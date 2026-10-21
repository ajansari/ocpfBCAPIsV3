param(
    [Parameter(Mandatory = $true)]
    [string] $Project
)

$ErrorActionPreference = 'Stop'
$result = @{
    compilation = 'unavailable'
    analyzers = 'unavailable'
    runtime = 'unavailable'
    distribution = 'unspecified'
    message = 'Configure a trusted symbol archive to enable compilation. Runtime tests are not configured.'
}

try {
    if (-not $env:AL_SYMBOLS_URL -or -not $env:AL_SYMBOLS_SHA256) {
        return
    }
    $uri = [Uri] $env:AL_SYMBOLS_URL
    if ($uri.Scheme -ne 'https' -or $uri.UserInfo -or $env:AL_SYMBOLS_SHA256 -notmatch '^[a-fA-F0-9]{64}$') {
        throw 'Symbols require an HTTPS URL without credentials and a SHA-256 checksum.'
    }
    $distribution = $env:AL_DISTRIBUTION
    if ($distribution -and $distribution -notin @('PTE', 'AppSource', 'Both')) {
        throw 'AL_REVIEW_DISTRIBUTION must be PTE, AppSource, or Both.'
    }
    if ($distribution) { $result.distribution = $distribution }

    $work = Join-Path $env:RUNNER_TEMP 'al-validation'
    New-Item -ItemType Directory -Path $work -Force | Out-Null
    $compilerZip = Join-Path $work 'compiler.zip'
    Invoke-WebRequest 'https://api.nuget.org/v3-flatcontainer/microsoft.dynamics.businesscentral.development.tools/16.2.28.57946/microsoft.dynamics.businesscentral.development.tools.16.2.28.57946.nupkg' -OutFile $compilerZip
    if ((Get-FileHash $compilerZip -Algorithm SHA256).Hash -ne 'A76BB5E635E8CEC8F2B064A0CA8AC5112D90DE8EE3FC78ED795081EB22749731') {
        throw 'AL compiler package checksum mismatch.'
    }
    Expand-Archive $compilerZip (Join-Path $work 'compiler')
    $compiler = Join-Path $work 'compiler/lib/net8.0/win-x64'

    $symbolsZip = Join-Path $work 'symbols.zip'
    Invoke-WebRequest $uri -OutFile $symbolsZip
    if ((Get-FileHash $symbolsZip -Algorithm SHA256).Hash -ne $env:AL_SYMBOLS_SHA256) {
        throw 'Symbol archive checksum mismatch.'
    }
    $symbols = Join-Path $work 'symbols'
    Expand-Archive $symbolsZip $symbols
    if (-not (Get-ChildItem $symbols -Filter '*.app' -File)) {
        throw 'Symbol archive must contain .app files at its root.'
    }

    # Compile only source/manifest copies; never load PR-supplied analyzer or ruleset configuration.
    $source = Join-Path $work 'source'
    New-Item -ItemType Directory $source | Out-Null
    $result.compilation = 'failed'
    $manifest = Get-Item -LiteralPath (Join-Path $Project 'app.json')
    if ($manifest.Attributes -band [IO.FileAttributes]::ReparsePoint) {
        throw 'Symlinked manifest is not supported.'
    }
    Copy-Item -LiteralPath $manifest.FullName -Destination $source
    $metadata = Get-Content -LiteralPath $manifest.FullName -Raw | ConvertFrom-Json
    if ($metadata.logo) {
        $root = [IO.Path]::GetFullPath($Project).TrimEnd([IO.Path]::DirectorySeparatorChar) + [IO.Path]::DirectorySeparatorChar
        $logo = [IO.Path]::GetFullPath((Join-Path $Project $metadata.logo))
        if (-not $logo.StartsWith($root, [StringComparison]::OrdinalIgnoreCase) -or
            [IO.Path]::GetExtension($logo) -notin @('.png', '.jpg', '.jpeg', '.bmp')) {
            throw 'Manifest logo must be an image within the candidate project.'
        }
        $relative = [IO.Path]::GetRelativePath($Project, $logo)
        $current = $Project
        foreach ($part in $relative.Split([IO.Path]::DirectorySeparatorChar)) {
            $current = Join-Path $current $part
            if ((Get-Item -LiteralPath $current -Force).Attributes -band [IO.FileAttributes]::ReparsePoint) {
                throw 'Symlinked logo paths are not supported.'
            }
        }
        if (-not (Test-Path -LiteralPath $logo -PathType Leaf)) { throw 'Manifest logo is missing.' }
        $destination = Join-Path $source $relative
        New-Item -ItemType Directory -Path (Split-Path $destination) -Force | Out-Null
        Copy-Item -LiteralPath $logo -Destination $destination
    }
    $queue = [Collections.Generic.Queue[string]]::new()
    $queue.Enqueue($Project)
    while ($queue.Count) {
        $directory = $queue.Dequeue()
        foreach ($entry in Get-ChildItem -LiteralPath $directory -Force) {
            if ($entry.Attributes -band [IO.FileAttributes]::ReparsePoint) { continue }
            if ($entry.PSIsContainer) {
                if ($entry.Name -notin @('.git', '.github', '.alpackages', '.vscode', 'node_modules', 'ATS')) {
                    $queue.Enqueue($entry.FullName)
                }
            }
            elseif ($entry.Extension -eq '.al') {
                $relative = [IO.Path]::GetRelativePath($Project, $entry.FullName)
                $destination = Join-Path $source $relative
                New-Item -ItemType Directory -Path (Split-Path $destination) -Force | Out-Null
                Copy-Item -LiteralPath $entry.FullName -Destination $destination
            }
        }
    }
    $analyzers = @((Join-Path $compiler 'Microsoft.Dynamics.Nav.CodeCop.dll'))
    if ($distribution -in @('PTE', 'Both')) {
        $analyzers += Join-Path $compiler 'Microsoft.Dynamics.Nav.PerTenantExtensionCop.dll'
    }
    if ($distribution -in @('AppSource', 'Both')) {
        $analyzers += Join-Path $compiler 'Microsoft.Dynamics.Nav.AppSourceCop.dll'
    }
    $arguments = @(
        "/project:$source",
        "/packagecachepath:$symbols",
        "/out:$(Join-Path $work 'review.app')",
        '/generatecode+'
    )
    $log = Join-Path $work 'compiler.log'
    & (Join-Path $compiler 'alc.exe') @arguments *> $log
    $exitCode = $LASTEXITCODE
    $result.compilation = if ($exitCode -eq 0) { 'passed' } else { 'failed' }
    Get-Content $log | ForEach-Object { Write-Output "AL: $_" }
    if ($exitCode -eq 0) {
        $analyzerLog = Join-Path $work 'analyzers.log'
        & (Join-Path $compiler 'alc.exe') @arguments "/analyzer:$($analyzers -join ',')" *> $analyzerLog
        $analyzerExitCode = $LASTEXITCODE
        $hasWarnings = [bool](Select-String -Path $analyzerLog -Pattern '\bwarning\s+[A-Z]+\d+' -Quiet)
        $result.analyzers = if ($analyzerExitCode -ne 0) { 'failed' } elseif ($hasWarnings) { 'warnings' } else { 'passed' }
        Get-Content $analyzerLog | ForEach-Object { Write-Output "AL: $_" }
    }
    $result.message = "Compiler exit code: $exitCode. CodeCop enabled; distribution: $($result.distribution). Runtime tests unavailable. See compiler diagnostics in the job log."
}
catch {
    $result.message = if ($result.compilation -eq 'failed') {
        'Candidate project validation or compilation failed; see the job log. Runtime tests unavailable.'
    } else {
        'Compilation infrastructure/configuration failed; see the job log. Runtime tests unavailable.'
    }
    # Prevent compiler diagnostics or PR-controlled text from becoming workflow commands.
    Write-Output "AL validation error: $($_.Exception.GetType().Name)"
}
finally {
    $json = $result | ConvertTo-Json -Compress
    $encoded = [Convert]::ToBase64String([Text.Encoding]::UTF8.GetBytes($json))
    "report=$encoded" >> $env:GITHUB_OUTPUT
}
