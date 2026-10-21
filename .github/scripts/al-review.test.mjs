import test from 'node:test';
import assert from 'node:assert/strict';
import fs from 'node:fs';
import path from 'node:path';
import { spawnSync } from 'node:child_process';
import { fileURLToPath } from 'node:url';
import { review } from './al-review.mjs';

const script = fileURLToPath(new URL('./al-review.mjs', import.meta.url));
const app = { version: '1.0.0.0', idRanges: [{ from: 50000, to: 50100 }] };
const api = (properties = '', fields = 'field(id; Rec.SystemId) {}', id = 50000, objectName = 'Example') => `
page ${id} "${objectName}" {
 PageType = API; APIPublisher = 'pub'; APIGroup = 'group';
 APIVersion = 'v1', 'v2'; EntityName = 'item'; EntitySetName = 'items';
 SourceTable = "Item"; ODataKeyFields = SystemId;
 ${properties}
 layout { area(content) { repeater(rows) { ${fields} } } }
}`;
const permissions = `
permissionset 50090 "OCPF - READ" { Permissions = page Example = X; }
permissionset 50091 "OCPF - READ/WRITE" { IncludedPermissionSets = "OCPF - READ"; }
`;

function fixture(t, before = {}, after = before) {
  // All ephemeral fixtures live inside the repository, never in OS temporary paths.
  const root = fs.mkdtempSync(path.join(path.dirname(script), '.al-review-test-'));
  t.after(() => fs.rmSync(root, { recursive: true, force: true }));
  for (const [side, files] of [['base', before], ['head', after]]) {
    fs.mkdirSync(path.join(root, side));
    for (const [file, content] of Object.entries({ 'app.json': JSON.stringify(app), 'Permissions.al': permissions, ...files })) {
      fs.mkdirSync(path.dirname(path.join(root, side, file)), { recursive: true });
      fs.writeFileSync(path.join(root, side, file), content);
    }
  }
  const input = { baseDir: path.join(root, 'base'), headDir: path.join(root, 'head') };
  return { root, input, result: () => review(input) };
}
const messages = result => result.findings.map(finding => finding.message).join('\n');
const reds = result => result.findings.filter(finding => finding.severity === 'red');

test('unchanged API and transitive permission coverage are clean and deterministic', t => {
  const f = fixture(t, { 'API.al': api() });
  const result = f.result();
  assert.deepEqual(result.findings, []);
  assert.deepEqual(result.summary, { red: 0, yellow: 0, total: 0, reported: 0, omitted: 0 });
  assert.equal(result.coverage.readCovered, 1);
  assert.equal(result.coverage.writeCovered, 1);
  assert.deepEqual(result, f.result());
});

test('lexer respects comments, braces and escaped quotes inside literals', t => {
  const contents = api("Caption = 'a; } // isn''t /* a comment';",
    'field("odd}Name"; Rec."F""ield") { Caption = \'field(x; bad) { }\'; }');
  const f = fixture(t, { 'API.al': `/* page 1 Bad { } */\n${contents}\n// page 2 Bad {` });
  assert.deepEqual(f.result().findings, []);
});

test('objects use separate ID spaces, with duplicate and range checks for other AL types', t => {
  const f = fixture(t, {
    'Objects.al': 'table 50000 T {} codeunit 50000 C {} enum 50001 E {} enum 50001 F {} report 60000 R {}',
  });
  const result = f.result();
  assert.equal(reds(result).length, 2);
  assert.match(messages(result), /Duplicate enum object ID/);
  assert.match(messages(result), /report object ID 60000 is outside/);
});

test('multiple API objects in one file are parsed independently', t => {
  const second = api('', '', 50001, 'Second').replaceAll("'items'", "'others'").replaceAll("'item'", "'other'");
  const f = fixture(t, { 'API.al': api() + second });
  assert.equal(f.result().coverage.apiPages, 2);
  assert.equal(reds(f.result()).length, 0);
});

test('route conflicts require publisher/group/version overlap and check both entity names', t => {
  const second = api('', '', 50001, 'Second');
  const f = fixture(t, { 'API.al': api() + second.replace("'items'", "'otherItems'") });
  assert.equal(reds(f.result()).length, 2);
  assert.match(messages(f.result()), /Conflicting API EntityName/);
  const other = fixture(t, { 'API.al': api() + second.replace("'v1', 'v2'", "'v3'") });
  assert.equal(reds(other.result()).length, 0);
  const otherPublisher = fixture(t, { 'API.al': api() + second.replace("'pub'", "'different'") });
  assert.equal(reds(otherPublisher.result()).length, 0);
});

test('removed versions, entity rename and deleted APIs break routes', t => {
  for (const change of [
    api().replace("'v1', 'v2'", "'v2'"),
    api().replace("'item'", "'renamed'"),
    api().replace("'items'", "'renamed'"),
    '',
  ]) {
    const f = fixture(t, { 'API.al': api() }, { 'API.al': change });
    assert.match(messages(f.result()), /Breaking API contract: removed or renamed route/);
    assert.ok(reds(f.result()).length > 0);
  }
});

test('moving a page or changing its object ID does not remove a preserved route', t => {
  const f = fixture(t, { 'Old.al': api() }, { 'New.al': api().replace('page 50000', 'page 50001') });
  assert.equal(reds(f.result()).length, 0);
});

test('preserved routes take precedence over an old object ID reused for a new version', t => {
  const old = api('', 'field(id; Rec.SystemId) {} field(code; Rec.Code) {}').replace("'v1', 'v2'", "'v1'");
  const moved = old.replace('page 50000 "Example"', 'page 50001 "Legacy"');
  const reused = api('', 'field(id; Rec.SystemId) {}').replace("'v1', 'v2'", "'v2'");
  const f = fixture(t, { 'Old.al': old }, { 'Legacy.al': moved, 'New.al': reused });
  assert.equal(reds(f.result()).length, 0);
  assert.doesNotMatch(messages(f.result()), /removed field code/);
});

test('a field removed from the route-matched replacement still breaks compatibility', t => {
  const old = api('', 'field(id; Rec.SystemId) {} field(code; Rec.Code) {}').replace("'v1', 'v2'", "'v1'");
  const moved = api().replace('page 50000 "Example"', 'page 50001 "Legacy"').replace("'v1', 'v2'", "'v1'");
  const reused = old.replace("'v1'", "'v2'");
  const f = fixture(t, { 'Old.al': old }, { 'Legacy.al': moved, 'New.al': reused });
  assert.equal(reds(f.result()).length, 1);
  assert.match(messages(f.result()), /removed field code/);
});

test('conditional object and route duplicates across files are unconfirmed regardless of file ordering', t => {
  for (const [conditional, unconditional] of [['A.al', 'Z.al'], ['Z.al', 'A.al']]) {
    const f = fixture(t, { [conditional]: `#if FEATURE\n${api()}\n#endif`, [unconditional]: api() });
    const result = f.result();
    assert.equal(reds(result).length, 0);
    assert.ok(result.findings.some(finding => /Duplicate page object ID/.test(finding.message) &&
      /preprocessor evaluation required/.test(finding.message) && finding.severity === 'yellow'));
    assert.ok(result.findings.some(finding => /Conflicting API EntitySetName/.test(finding.message) &&
      /preprocessor evaluation required/.test(finding.message) && finding.severity === 'yellow'));
  }
});

test('conditional fields and range violations are incomplete rather than false blockers', t => {
  const f = fixture(t, { 'API.al': api('', `
  #if FEATURE
  field(id; Rec.SystemId) {}
  #else
  field(id; Rec.OtherId) {}
  #endif
  `, 70000) });
  assert.equal(reds(f.result()).length, 0);
  assert.match(messages(f.result()), /preprocessor evaluation required.*Duplicate field/);
  assert.match(messages(f.result()), /preprocessor evaluation required.*outside app.json/);
});

test('compatibility influenced by conditional base or head declarations is incomplete', t => {
  const old = api('', 'field(id; Rec.SystemId) {} field(code; Rec.Code) {}');
  for (const [before, after] of [
    [`#if FEATURE\n${old}\n#endif`, api()],
    [old, `#if FEATURE\n${api()}\n#endif`],
    [`#if FEATURE\n${old}\n#endif`, ''],
  ]) {
    const f = fixture(t, { 'Old.al': before }, { 'New.al': after });
    assert.equal(reds(f.result()).length, 0);
    assert.match(messages(f.result()), /preprocessor evaluation required.*Breaking API contract/);
  }
});

test('conditional source table types downgrade cross-file API compatibility findings', t => {
  const f = fixture(t, { 'API.al': api('', 'field(code; Rec.Code) {}'),
    'Table.al': '#if FEATURE\ntable 50003 Item { fields { field(1; Code; Code[20]) {} } }\n#endif' },
  { 'API.al': api('', 'field(code; Rec.Code) {}'),
    'Table.al': 'table 50003 Item { fields { field(1; Code; Text[50]) {} } }' });
  assert.equal(reds(f.result()).length, 0);
  assert.match(messages(f.result()), /preprocessor evaluation required.*locally declared source type changed/);
});

test('unrelated conditional declarations do not downgrade definitive errors', t => {
  const f = fixture(t, { 'Conditional.al': '#if FEATURE\ncodeunit 50004 C {}\n#endif',
    'API.al': api('', '', 70000) });
  assert.equal(reds(f.result()).length, 1);
  assert.match(reds(f.result())[0].message, /outside app.json/);
});

test('field removal is red and source remapping is an explicitly inferred yellow', t => {
  const f = fixture(t, { 'API.al': api('', 'field(id; Rec.SystemId) {} field(code; Rec.Code) {}') },
    { 'API.al': api('', 'field(id; Rec."Other Id") {}') });
  const result = f.result();
  assert.equal(reds(result).length, 1);
  assert.match(messages(result), /removed field code/);
  assert.ok(result.findings.some(finding => finding.severity === 'yellow' && /source expression changed/.test(finding.message)));
  assert.ok(result.findings.every(finding => Number.isInteger(finding.line) && finding.line > 0));
});

test('locally resolvable table field type changes are red', t => {
  const f = fixture(t, { 'API.al': api('', 'field(code; Rec.Code) {}'),
    'Table.al': 'table 50003 Item { fields { field(1; Code; Code[20]) {} } }' },
  { 'API.al': api('', 'field(code; Rec.Code) {}'),
    'Table.al': 'table 50003 Item { fields { field(1; Code; Text[50]) {} } }' });
  assert.match(messages(f.result()), /locally declared source type changed/);
  assert.equal(reds(f.result()).length, 1);
});

test('source table and OData key changes are definitive contract changes', t => {
  const f = fixture(t, { 'API.al': api() }, { 'API.al': api().replace('"Item"', '"Customer"').replace('= SystemId', '= "No."') });
  assert.equal(reds(f.result()).length, 2);
});

test('omitted write flags default true, losing read intent and trigger changes warn', t => {
  const before = api('InsertAllowed = false; ModifyAllowed = false; DeleteAllowed = false; DataAccessIntent = ReadOnly;') +
    '\n';
  const after = api('trigger OnOpenPage() begin Message(\'changed\'); end;');
  const f = fixture(t, { 'API.al': before }, { 'API.al': after });
  const text = messages(f.result());
  assert.match(text, /broadened insertallowed/);
  assert.match(text, /broadened modifyallowed/);
  assert.match(text, /broadened deleteallowed/);
  assert.match(text, /lost DataAccessIntent/);
  assert.match(text, /trigger code changed/);
  assert.equal(reds(f.result()).length, 0);
});

test('comment-only changes do not imply trigger or expression changes', t => {
  const f = fixture(t, { 'API.al': api('trigger OnOpenPage() begin end;') },
    { 'API.al': api('trigger OnOpenPage() /* { } */ begin // comment\n end;') });
  assert.doesNotMatch(messages(f.result()), /trigger code changed|source expression changed/);
});

test('permission IDs, cycles and indirect grants are resolved without recursion failure', t => {
  const f = fixture(t, { 'API.al': api(), 'Permissions.al': `
  permissionset 50090 "OCPF - READ" { IncludedPermissionSets = Helper; }
  permissionset 50091 "OCPF - READ/WRITE" { IncludedPermissionSets = "OCPF - READ"; }
  permissionset 50092 Helper { IncludedPermissionSets = "OCPF - READ"; Permissions = page 50000 = x; }
  ` });
  assert.equal(f.result().coverage.readCovered, 1);
  assert.equal(f.result().coverage.writeCovered, 1);
});

test('read coverage includes read-only APIs, write requirement excludes them', t => {
  const f = fixture(t, { 'API.al': api('Editable = false;'), 'Permissions.al': '' });
  assert.equal(f.result().coverage.writeRequired, 0);
  assert.equal(f.result().coverage.readCovered, 0);
  assert.match(messages(f.result()), /OCPF - READ does not grant/);
  assert.doesNotMatch(messages(f.result()), /READ\/WRITE does not grant/);
});

test('permission expansion, included sets and access changes produce inferred risks', t => {
  const f = fixture(t, { 'API.al': api() }, { 'API.al': api('Access = Internal;'),
    'Permissions.al': permissions.replace('page Example = X', 'page Example = X, tabledata Item = RIMD')
      .replace('IncludedPermissionSets = "OCPF - READ"', 'IncludedPermissionSets = "OCPF - READ", Missing') });
  assert.match(messages(f.result()), /privilege-expansion risk/);
  assert.match(messages(f.result()), /changed includedpermissionsets/);
  assert.match(messages(f.result()), /cannot resolve IncludedPermissionSets Missing/);
  assert.match(messages(f.result()), /changed access/);
});

test('unrecognized syntax, malformed delimiters, conditional compilation and query columns warn', t => {
  const f = fixture(t, { 'Bad.al': '#if FEATURE\npage 50000 Bad { Caption = \'x\';\n#endif',
    'Unknown.al': 'futureobject 50000 X {}',
    'Query.al': "query 50001 Q { QueryType = API; }" });
  assert.match(messages(f.result()), /Preprocessor directive/);
  assert.match(messages(f.result()), /Unclosed AL delimiter/);
  assert.match(messages(f.result()), /No supported object declaration/);
  assert.match(messages(f.result()), /API query columns and dataitems are not modeled/);
  assert.deepEqual(f.result().coverage.unsupportedFiles, ['Bad.al', 'Query.al', 'Unknown.al']);
});

test('invalid manifest warns rather than silently skipping range checks', t => {
  const f = fixture(t, { 'app.json': '{ invalid', 'API.al': api() });
  assert.match(messages(f.result()), /missing or invalid app.json/);
  const invalidRanges = fixture(t, { 'app.json': '{"idRanges":[{"from":5,"to":1}]}', 'API.al': api() });
  assert.match(messages(invalidRanges.result()), /idRanges is missing or invalid/);
});

test('mixed unsupported declarations, invalid IDs and nested API parts are explicit coverage warnings', t => {
  const f = fixture(t, { 'API.al': api('', 'part(lines; Lines) {}') +
    ' futureobject 50004 Unknown {} page MissingId {}' });
  assert.match(messages(f.result()), /Unsupported object declaration futureobject/);
  assert.match(messages(f.result()), /Missing or invalid numeric ID/);
  assert.match(messages(f.result()), /Nested API parts and controls are not modeled/);
});

test('permission grant removal remains an access-control risk', t => {
  const f = fixture(t, { 'API.al': api() },
    { 'API.al': api(), 'Permissions.al': permissions.replace('Permissions = page Example = X;', '') });
  assert.match(messages(f.result()), /permission grants changed or were removed/);
  assert.equal(f.result().coverage.readCovered, 0);
});

test('release hygiene requires a version change and some docs, not arbitrary metadata fields', t => {
  const f = fixture(t, { 'API.al': api() }, { 'API.al': api('Caption = \'Changed\';') });
  assert.match(messages(f.result()), /without an app.json version change/);
  assert.match(messages(f.result()), /without documentation or changelog/);
  const good = fixture(t, { 'API.al': api() }, { 'API.al': api('Caption = \'Changed\';'),
    'app.json': JSON.stringify({ ...app, version: '1.0.0.1' }), 'Documentation/CHANGELOG.md': 'Updated API.' });
  assert.deepEqual(good.result().findings, []);
});

test('exclusions skip dependencies, ATS, symlinks and GitHub configuration', t => {
  const f = fixture(t, { 'API.al': api(), 'ATS/Bad.al': 'page 2 Bad {}',
    'node_modules/Bad.al': 'page 2 Bad {}', '.github/fixture/Bad.al': 'page 2 Bad {}' });
  fs.symlinkSync(path.join(f.input.headDir, 'API.al'), path.join(f.input.headDir, 'Linked.al'));
  assert.equal(f.result().coverage.alFiles, 2); // API and permissions only
  assert.deepEqual(f.result().findings, []);
});

test('changedFiles override supports filename objects and deleted AL detection', t => {
  const f = fixture(t, {}, {});
  const result = review({ ...f.input, changedFiles: [{ filename: 'Deleted.al' }] });
  assert.deepEqual(result.coverage.changedFiles, ['Deleted.al']);
  assert.match(messages(result), /Release hygiene/);
});

test('head app.json symlinks are not read and snapshot symlink roots are rejected', t => {
  const f = fixture(t, { 'API.al': api() });
  fs.unlinkSync(path.join(f.input.headDir, 'app.json'));
  fs.symlinkSync(path.join(f.input.baseDir, 'app.json'), path.join(f.input.headDir, 'app.json'));
  assert.match(messages(f.result()), /missing or invalid app.json/);
  const linked = path.join(f.root, 'linked-head');
  fs.symlinkSync(f.input.headDir, linked);
  assert.throws(() => review({ ...f.input, headDir: linked }), /non-symlink directories/);
});

test('large findings and coverage payloads stay below the base64 workflow output budget', t => {
  const files = {};
  for (let index = 0; index < 350; index++) {
    files[`${String(index).padStart(3, '0')}-${'文'.repeat(70)}.al`] = `page ${70000 + index} "${'長'.repeat(300)}" {}`;
  }
  const f = fixture(t, files);
  const result = review({ ...f.input, changedFiles: Object.keys(files) });
  assert.ok(result.summary.total >= 350);
  assert.ok(result.findings.length <= 100);
  assert.equal(result.summary.reported, result.findings.length);
  assert.equal(result.summary.omitted, result.summary.total - result.findings.length);
  assert.equal(result.coverage.changedFilesTotal, 350);
  assert.ok(result.coverage.changedFiles.length <= 100);
  const serialized = `${JSON.stringify(result, null, 2)}\n`;
  assert.ok(Buffer.byteLength(serialized) <= 60_000);
  assert.ok(Buffer.from(serialized).toString('base64').length < 100_000);
});

test('CLI writes JSON only, matches exported result, and rejects invalid arguments', t => {
  const f = fixture(t, { 'API.al': api() });
  const output = path.join(f.root, 'review.json');
  const result = spawnSync(process.execPath, [script, '--base', f.input.baseDir, '--head', f.input.headDir, '--output', output], { encoding: 'utf8' });
  assert.equal(result.status, 0, result.stderr);
  assert.equal(result.stdout, '');
  assert.deepEqual(JSON.parse(fs.readFileSync(output, 'utf8')), f.result());
  const bad = spawnSync(process.execPath, [script, '--wrong', 'x'], { encoding: 'utf8' });
  assert.equal(bad.status, 1);
  assert.match(bad.stderr, /Usage/);
  assert.throws(() => review({ baseDir: '.', headDir: '.' }), /absolute/);
});
