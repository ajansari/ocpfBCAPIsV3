import fs from 'node:fs';
import path from 'node:path';
import { fileURLToPath } from 'node:url';

const objectTypes = new Set(('table tableextension page pageextension report reportextension codeunit query xmlport ' +
  'enum enumextension permissionset permissionsetextension profile profileextension controladdin interface entitlement').split(' '));
const excluded = new Set(['.git', '.github', 'node_modules', '.alpackages', '.snapshots', '.vscode']);
const lower = value => String(value ?? '').toLowerCase();
const outputLimits = { findings: 100, paths: 100, text: 384, file: 192, bytes: 60_000 };
const canonical = tokens => JSON.stringify(tokens.map(t => [t.kind, t.kind === 'string' ? t.value : lower(t.value)]));
const name = tokens => tokens.map(t => t.value).join('');
const editable = object => ['insertallowed', 'modifyallowed', 'deleteallowed'].some(key =>
  scalar(object, key, 'true') !== 'false') && scalar(object, 'editable', 'true') !== 'false';
const scalar = (object, key, fallback = '') => lower(name(object.props.get(key) ?? [])) || fallback;

function walk(root, directory = '', files = new Map()) {
  if (!fs.existsSync(path.join(root, directory))) return files;
  for (const entry of fs.readdirSync(path.join(root, directory), { withFileTypes: true }).sort((a, b) => a.name.localeCompare(b.name, 'en'))) {
    if (excluded.has(entry.name) || /(^|[._ -])ats($|[._ -])/i.test(entry.name) || entry.isSymbolicLink()) continue;
    const relative = directory ? `${directory}/${entry.name}` : entry.name;
    if (entry.isDirectory()) walk(root, relative, files);
    else if (entry.isFile() && (/\.al$/i.test(entry.name) || relative === 'app.json' || /\.(md|rst|txt)$/i.test(entry.name))) {
      files.set(relative, fs.readFileSync(path.join(root, relative), 'utf8'));
    }
  }
  return files;
}

// Tokens retain literal contents and source locations; comments never participate in comparisons.
function lex(text, warn) {
  const tokens = [];
  let i = 0, line = 1;
  const advance = () => { if (text[i++] === '\n') line++; };
  while (i < text.length) {
    if (/\s/.test(text[i])) { advance(); continue; }
    if (text.startsWith('//', i)) { while (i < text.length && text[i] !== '\n') advance(); continue; }
    if (text.startsWith('/*', i)) {
      const start = line;
      advance(); advance();
      while (i < text.length && !text.startsWith('*/', i)) advance();
      if (i === text.length) warn(start, 'Unterminated block comment');
      else { advance(); advance(); }
      continue;
    }
    const start = line;
    if (text[i] === '#') {
      let directive = '';
      while (i < text.length && text[i] !== '\n') { directive += text[i]; advance(); }
      warn(start, `Preprocessor directive ${directive.trim()} requires compiler evaluation`);
      continue;
    }
    if (text[i] === "'" || text[i] === '"') {
      const quote = text[i];
      advance();
      let value = '', closed = false;
      while (i < text.length) {
        if (text[i] === quote) {
          advance();
          if (text[i] === quote) { value += quote; advance(); }
          else { closed = true; break; }
        } else { value += text[i]; advance(); }
      }
      if (!closed) warn(start, 'Unterminated quoted literal');
      tokens.push({ value, kind: quote === "'" ? 'string' : 'identifier', line: start });
      continue;
    }
    const match = /^[\p{L}_][\p{L}\p{N}_]*|^\d+(?:\.\d+)?/u.exec(text.slice(i));
    if (match) {
      tokens.push({ value: match[0], kind: /^\d/.test(match[0]) ? 'number' : 'identifier', line: start });
      i += match[0].length;
    } else {
      tokens.push({ value: text[i], kind: 'symbol', line: start });
      advance();
    }
  }
  return tokens;
}

function pairs(tokens, warn) {
  const stack = [], result = new Map();
  for (let i = 0; i < tokens.length; i++) {
    const token = tokens[i];
    if (token.kind !== 'symbol') continue;
    if (['{', '(', '['].includes(token.value)) stack.push(i);
    if (['}', ')', ']'].includes(token.value)) {
      const opening = stack.pop();
      if (opening === undefined || '{(['.indexOf(tokens[opening].value) !== '})]'.indexOf(token.value)) {
        warn(token.line, 'Unbalanced AL delimiters');
      } else result.set(opening, i);
    }
  }
  for (const index of stack) warn(tokens[index].line, 'Unclosed AL delimiter');
  return result;
}

function properties(tokens, start, end, matching) {
  const props = new Map();
  for (let i = start; i < end; i++) {
    if (tokens[i].kind === 'identifier' && tokens[i + 1]?.value === '=') {
      let last = i + 2;
      for (; last < end && !(tokens[last].kind === 'symbol' && tokens[last].value === ';'); last++) {
        if (matching.has(last)) last = matching.get(last);
      }
      props.set(lower(tokens[i].value), tokens.slice(i + 2, last));
      i = last;
    } else if (matching.has(i)) i = matching.get(i);
  }
  return props;
}

function split(tokens, separator) {
  const parts = [[]];
  let depth = 0;
  for (const token of tokens) {
    if (token.kind === 'symbol' && ['(', '['].includes(token.value)) depth++;
    if (token.kind === 'symbol' && [')', ']'].includes(token.value)) depth--;
    if (token.kind === 'symbol' && token.value === separator && depth === 0) parts.push([]);
    else parts.at(-1).push(token);
  }
  return parts;
}

function parse(files, emit, phase, conditionalFiles) {
  const objects = [], unsupported = new Set();
  for (const [file, text] of files) {
    if (!/\.al$/i.test(file)) continue;
    const warn = (line, message) => {
      unsupported.add(file);
      if (message.startsWith('Preprocessor directive ')) conditionalFiles.add(file);
      emit('yellow', file, line, `Static coverage incomplete (${phase}): ${message}.`);
    };
    const tokens = lex(text, warn), matching = pairs(tokens, warn);
    let count = 0;
    for (let i = 0; i < tokens.length; i++) {
      const type = lower(tokens[i].value);
      if (!objectTypes.has(type) || tokens[i].kind !== 'identifier') {
        if (tokens[i].kind === 'identifier' && tokens[i + 1]?.kind === 'number') {
          warn(tokens[i].line, `Unsupported object declaration ${tokens[i].value}`);
        }
        continue;
      }
      const start = i;
      const hasId = tokens[i + 1]?.kind === 'number';
      const id = hasId ? Number(tokens[i + 1].value) : null;
      if ((!hasId && !['interface', 'controladdin', 'profile', 'profileextension', 'permissionsetextension'].includes(type)) ||
          (hasId && !Number.isInteger(id))) warn(tokens[i].line, `Missing or invalid numeric ID for ${type}`);
      const objectName = tokens[i + (hasId ? 2 : 1)];
      let open = i + 1;
      while (open < tokens.length && !(tokens[open].kind === 'symbol' && ['{', ';'].includes(tokens[open].value))) open++;
      if (!objectName || !matching.has(open)) { warn(tokens[start].line, `Cannot parse ${type} object`); continue; }
      const end = matching.get(open);
      const object = { type, id, name: objectName.value, file, line: tokens[start].line,
        props: properties(tokens, open + 1, end, matching), fields: new Map(), triggers: [] };
      for (let j = open + 1; j < end; j++) {
        if (type === 'page' && ['part', 'systempart', 'usercontrol'].includes(lower(tokens[j].value)) &&
            tokens[j + 1]?.value === '(') warn(tokens[j].line, 'Nested API parts and controls are not modeled');
        if (lower(tokens[j].value) === 'field' && tokens[j].kind === 'identifier' && tokens[j + 1]?.value === '(') {
          const close = matching.get(j + 1);
          if (!close) { warn(tokens[j].line, 'Cannot parse field'); continue; }
          const args = split(tokens.slice(j + 2, close), ';');
          const fieldEnd = matching.get(close + 1);
          if ((args.length !== 2 && args.length !== 3) || !fieldEnd) { warn(tokens[j].line, 'Unsupported field declaration'); continue; }
          const fieldName = name(args[args.length === 3 ? 1 : 0]);
          const field = { name: fieldName, expression: args.at(-1), line: tokens[j].line,
            props: properties(tokens, close + 2, fieldEnd, matching) };
          if (object.fields.has(lower(fieldName))) emit('red', file, field.line, `Duplicate field ${fieldName} in ${object.name}.`);
          object.fields.set(lower(fieldName), field);
        }
        if (lower(tokens[j].value) === 'trigger' && tokens[j].kind === 'identifier') {
          const begin = j;
          // Triggers use begin/end, not braces; stop at the next member or enclosing brace.
          let finish = j + 1;
          for (; finish < end; finish++) {
            if (tokens[finish].kind === 'identifier' && ['trigger', 'procedure'].includes(lower(tokens[finish].value))) break;
            if (tokens[finish].kind === 'symbol' && tokens[finish].value === '}') break;
          }
          object.triggers.push(tokens.slice(begin, finish));
        }
      }
      objects.push(object); count++; i = end;
      if (type === 'query' && scalar(object, 'querytype') === 'api') warn(object.line, 'API query columns and dataitems are not modeled');
      if (object.props.has('permissions') && split(object.props.get('permissions'), ',').some(clause =>
        clause.length && (clause.findIndex(t => t.value === '=') < 2))) warn(object.line, 'Unsupported Permissions clause');
    }
    if (!count && tokens.length) warn(1, 'No supported object declaration found');
  }
  return { objects, unsupported };
}

function routes(object, emit) {
  const values = {};
  for (const key of ['apipublisher', 'apigroup', 'apiversion', 'entityname', 'entitysetname']) {
    const parts = split(object.props.get(key) ?? [], ',');
    if (!parts.length || parts.some(part => part.length !== 1 || part[0].kind !== 'string' || !part[0].value)) {
      emit('yellow', object.file, object.line, `Static coverage incomplete: ${object.name} has missing or nonliteral ${key}.`);
      return [];
    }
    values[key] = parts.map(part => part[0].value);
    if (key !== 'apiversion' && parts.length !== 1) {
      emit('yellow', object.file, object.line, `Static coverage incomplete: multiple values for ${key}.`);
      return [];
    }
  }
  return values.apiversion.map(version => ({
    scope: `${values.apipublisher[0]}/${values.apigroup[0]}/${version}`,
    entity: values.entityname[0], set: values.entitysetname[0],
  }));
}

function grants(object) {
  const result = new Map();
  for (const clause of split(object.props.get('permissions') ?? [], ',')) {
    const equals = clause.findIndex(t => t.value === '=');
    if (equals < 2) continue;
    const type = lower(clause[0].value), target = lower(name(clause.slice(1, equals)));
    const rights = name(clause.slice(equals + 1));
    const key = `${type}:${target}`;
    result.set(key, (result.get(key) ?? '') + rights);
  }
  return result;
}

function permissionCoverage(objects, apis, emit) {
  const sets = objects.filter(object => object.type === 'permissionset');
  const lookup = new Map(sets.flatMap(object => [[lower(object.name), object], [String(object.id), object]]));
  const expand = (object, seen = new Set()) => {
    if (seen.has(object)) return new Set();
    seen.add(object);
    const pages = new Set();
    for (const [key, rights] of grants(object)) if (key.startsWith('page:') && /x/i.test(rights)) pages.add(key.slice(5));
    for (const entry of split(object.props.get('includedpermissionsets') ?? [], ',')) {
      if (!entry.length) continue;
      const included = lookup.get(lower(name(entry)));
      if (included) for (const page of expand(included, seen)) pages.add(page);
      else emit('yellow', object.file, object.line, `Static coverage incomplete: cannot resolve IncludedPermissionSets ${name(entry)}.`);
    }
    if (object.props.has('excludedpermissionsets')) {
      emit('yellow', object.file, object.line, 'Static coverage incomplete: ExcludedPermissionSets needs compiler permission evaluation.');
      return new Set();
    }
    return pages;
  };
  const read = lookup.get('ocpf - read'), write = lookup.get('ocpf - read/write');
  const readPages = read ? expand(read) : new Set(), writePages = write ? expand(write) : new Set();
  let readCovered = 0, writeRequired = 0, writeCovered = 0;
  for (const api of apis) {
    const covered = pages => pages.has(lower(api.name)) || pages.has(String(api.id)) || pages.has('*') || pages.has('0');
    if (covered(readPages)) readCovered++;
    else emit('yellow', api.file, api.line, `Inferred access risk: OCPF - READ does not grant execute access to API page ${api.name}.`);
    if (editable(api)) {
      writeRequired++;
      if (covered(writePages)) writeCovered++;
      else emit('yellow', api.file, api.line, `Inferred access risk: OCPF - READ/WRITE does not grant execute access to editable API page ${api.name}.`);
    }
  }
  return { permissionSets: sets.length, readCovered, writeRequired, writeCovered };
}

function fieldType(api, field, objects) {
  const table = objects.find(object => object.type === 'table' &&
    [lower(object.name), String(object.id)].includes(scalar(api, 'sourcetable')));
  const expression = field.expression;
  if (!table || expression.length !== 3 || lower(expression[0].value) !== 'rec' || expression[1].value !== '.') return null;
  return table.fields.get(lower(expression[2].value))?.expression ?? null;
}

function compareApi(before, after, emit, baseObjects, headObjects) {
  for (const key of ['sourcetable', 'odatakeyfields']) {
    if (canonical(before.props.get(key) ?? []) !== canonical(after.props.get(key) ?? [])) {
      emit('red', after.file, after.line, `Breaking API contract: ${before.name} changed ${key}.`);
    }
  }
  if (canonical(before.props.get('sourcetableview') ?? []) !== canonical(after.props.get('sourcetableview') ?? [])) {
    emit('yellow', after.file, after.line, `Inferred compatibility risk: ${before.name} changed SourceTableView filtering.`);
  }
  for (const [key, field] of before.fields) {
    const current = after.fields.get(key);
    if (!current) emit('red', after.file, after.line, `Breaking API contract: removed field ${field.name} from ${before.name}.`);
    else {
      const oldType = fieldType(before, field, baseObjects), newType = fieldType(after, current, headObjects);
      if (oldType && newType && canonical(oldType) !== canonical(newType)) {
        emit('red', after.file, current.line, `Breaking API contract: field ${field.name} locally declared source type changed.`);
      }
      if (canonical(field.expression) !== canonical(current.expression)) {
        emit('yellow', after.file, current.line, `Inferred compatibility risk: field ${field.name} source expression changed; external types cannot be determined without AL symbols.`);
      }
      for (const key of ['editable', 'accessbypermission']) {
        if (canonical(field.props.get(key) ?? []) !== canonical(current.props.get(key) ?? [])) {
          emit('yellow', after.file, current.line, `Inferred access-control risk: field ${field.name} changed ${key}.`);
        }
      }
    }
  }
  for (const key of ['insertallowed', 'modifyallowed', 'deleteallowed', 'editable']) {
    if (scalar(before, key, 'true') === 'false' && scalar(after, key, 'true') !== 'false') {
      emit('yellow', after.file, after.line, `Inferred write-surface risk: ${before.name} broadened ${key} (AL default is true).`);
    }
  }
  if (scalar(before, 'dataaccessintent') === 'readonly' && scalar(after, 'dataaccessintent') !== 'readonly') {
    emit('yellow', after.file, after.line, `Inferred operational risk: ${before.name} lost DataAccessIntent = ReadOnly.`);
  }
  for (const key of ['access', 'permissions', 'accessbypermission', 'inherentpermissions', 'inherententitlements']) {
    if (canonical(before.props.get(key) ?? []) !== canonical(after.props.get(key) ?? [])) {
      emit('yellow', after.file, after.line, `Inferred access-control risk: ${before.name} changed ${key}.`);
    }
  }
  if (JSON.stringify(before.triggers.map(canonical)) !== JSON.stringify(after.triggers.map(canonical))) {
    emit('yellow', after.file, after.line, `Inferred behavior risk: ${before.name} trigger code changed; runtime review is required.`);
  }
}

/** Deterministic, dependency-free static review. This is not an AL compiler or runtime test. */
export function review({ baseDir, headDir, changedFiles } = {}) {
  if (!path.isAbsolute(baseDir ?? '') || !path.isAbsolute(headDir ?? '')) throw new Error('baseDir and headDir must be absolute directories');
  if (!fs.lstatSync(baseDir).isDirectory() || !fs.lstatSync(headDir).isDirectory()) throw new Error('Both inputs must be non-symlink directories');
  const findings = [], unique = new Map(), conditionalFiles = new Set(), influences = new Map();
  const emit = (severity, file, line, message, relatedFiles = []) => {
    const finding = { severity, file, line: Math.max(1, line), message };
    const key = JSON.stringify(finding);
    if (!unique.has(key)) {
      unique.set(key, finding); findings.push(finding); influences.set(finding, new Set([file]));
    }
    for (const related of relatedFiles) influences.get(unique.get(key)).add(related);
  };
  const baseFiles = walk(baseDir), headFiles = walk(headDir);
  const actualChanges = [...new Set([...baseFiles.keys(), ...headFiles.keys()])]
    .filter(file => baseFiles.get(file) !== headFiles.get(file)).sort();
  const changed = changedFiles === undefined ? actualChanges : [...new Set(changedFiles.map(file =>
    typeof file === 'string' ? file.replaceAll('\\', '/') : file.filename))].sort();
  const base = parse(baseFiles, emit, 'base', conditionalFiles), head = parse(headFiles, emit, 'head', conditionalFiles);
  let manifest;
  try { manifest = JSON.parse(headFiles.get('app.json') ?? ''); }
  catch { emit('yellow', 'app.json', 1, 'Static coverage incomplete: missing or invalid app.json; object ranges cannot be checked.'); }
  const ranges = manifest?.idRanges;
  if (manifest && (!Array.isArray(ranges) || !ranges.length || ranges.some(range =>
    !Number.isInteger(range.from) || !Number.isInteger(range.to) || range.from > range.to))) {
    emit('yellow', 'app.json', 1, 'Static coverage incomplete: app.json idRanges is missing or invalid.');
  }
  const validRanges = Array.isArray(ranges) && ranges.length && ranges.every(range =>
    Number.isInteger(range.from) && Number.isInteger(range.to) && range.from <= range.to);
  const ids = new Map();
  for (const object of head.objects) {
    if (object.id !== null) {
      const key = `${object.type}:${object.id}`;
      if (ids.has(key)) emit('red', object.file, object.line, `Duplicate ${object.type} object ID ${object.id}; also declared in ${ids.get(key).file}.`, [ids.get(key).file]);
      else ids.set(key, object);
      if (validRanges && !ranges.some(range => object.id >= range.from && object.id <= range.to)) {
        emit('red', object.file, object.line, `${object.type} object ID ${object.id} is outside app.json idRanges.`);
      }
    }
    if (['pageextension', 'permissionsetextension', 'tableextension'].includes(object.type)) {
      emit('yellow', object.file, object.line, `Static coverage incomplete: ${object.type} effects on API contracts and effective permissions require compiler symbols.`);
    }
  }
  const isApi = object => ['page', 'query'].includes(object.type) && scalar(object, object.type === 'query' ? 'querytype' : 'pagetype') === 'api';
  const baseApis = base.objects.filter(isApi), headApis = head.objects.filter(isApi);
  // A missing route is a negative lookup: unevaluated head branches may hide its replacement.
  const conditionalHeadFiles = [...conditionalFiles].filter(file => headFiles.has(file));
  const headRoutes = new Map(), headRouteList = new Map();
  for (const api of headApis) {
    const list = routes(api, emit);
    headRouteList.set(api, list);
    for (const route of list) for (const kind of ['entity', 'set']) {
      const key = `${route.scope}/${kind}/${route[kind]}`;
      if (headRoutes.has(key) && headRoutes.get(key) !== api) {
        emit('red', api.file, api.line, `Conflicting API ${kind === 'set' ? 'EntitySetName' : 'EntityName'} route ${route.scope}/${route[kind]} with ${headRoutes.get(key).name}.`, [headRoutes.get(key).file]);
      } else headRoutes.set(key, api);
    }
  }
  for (const before of baseApis) {
    const previousRoutes = routes(before, emit);
    const identity = headApis.find(after => after.type === before.type && after.id === before.id);
    const candidates = new Set();
    for (const route of previousRoutes) {
      const after = headRoutes.get(`${route.scope}/set/${route.set}`);
      const same = after && headRouteList.get(after).some(item => item.scope === route.scope && item.set === route.set && item.entity === route.entity);
      if (!same) emit('red', identity?.file ?? before.file, identity?.line ?? before.line,
        `Breaking API contract: removed or renamed route ${route.scope}/${route.set} (EntityName ${route.entity}).`,
        [before.file, after?.file, ...conditionalHeadFiles]);
      if (after) candidates.add(after);
    }
    if (!previousRoutes.length && identity) candidates.add(identity);
    if (!previousRoutes.length && !identity) emit('yellow', before.file, before.line, `Static coverage incomplete: deleted API ${before.name} had an unresolved route.`);
    for (const after of candidates) {
      const relatedFiles = [before.file, after.file];
      for (const [api, list] of headRouteList) {
        if (list.some(route => previousRoutes.some(previous => previous.scope === route.scope && previous.set === route.set))) {
          relatedFiles.push(api.file);
        }
      }
      for (const [api, objects] of [[before, base.objects], [after, head.objects]]) {
        relatedFiles.push(...objects.filter(object => object.type === 'table' &&
          [lower(object.name), String(object.id)].includes(scalar(api, 'sourcetable'))).map(object => object.file));
      }
      compareApi(before, after, (severity, file, line, message) => emit(severity, file, line, message, relatedFiles),
        base.objects, head.objects);
    }
  }
  const baseSets = new Map(base.objects.filter(object => object.type === 'permissionset').map(object => [object.id, object]));
  for (const object of head.objects.filter(object => object.type === 'permissionset')) {
    const before = baseSets.get(object.id);
    if (!before) {
      if (grants(object).size) emit('yellow', object.file, object.line, `Inferred access-control risk: new permission set ${object.name} grants permissions.`);
      continue;
    }
    const oldGrants = grants(before);
    let expanded = false;
    for (const [target, rights] of grants(object)) {
      if ([...rights].some(right => !(oldGrants.get(target) ?? '').includes(right))) {
        expanded = true;
        emit('yellow', object.file, object.line, `Inferred privilege-expansion risk: ${object.name} expanded permissions for ${target} (direct/indirect grants need runtime validation).`);
      }
    }
    if (!expanded && canonical(before.props.get('permissions') ?? []) !== canonical(object.props.get('permissions') ?? [])) {
      emit('yellow', object.file, object.line, `Inferred access-control risk: ${object.name} permission grants changed or were removed.`);
    }
    for (const key of ['includedpermissionsets', 'excludedpermissionsets', 'assignable', 'access']) {
      if (canonical(before.props.get(key) ?? []) !== canonical(object.props.get(key) ?? [])) {
        emit('yellow', object.file, object.line, `Inferred access-control risk: ${object.name} changed ${key}.`);
      }
    }
  }
  if (changed.some(file => /\.al$/i.test(file))) {
    let baseVersion;
    try { baseVersion = JSON.parse(baseFiles.get('app.json') ?? '').version; } catch { /* Reported through coverage below. */ }
    if (!manifest?.version || manifest.version === baseVersion) emit('yellow', 'app.json', 1, 'Release hygiene: AL changed without an app.json version change.');
    if (!changed.some(file => /\.(md|rst|txt)$/i.test(file))) {
      emit('yellow', 'app.json', 1, 'Release hygiene: AL changed without documentation or changelog updates.');
    }
  }
  const pages = headApis.filter(object => object.type === 'page');
  const coverage = {
    alFiles: [...headFiles.keys()].filter(file => /\.al$/i.test(file)).length,
    objects: head.objects.length, apiPages: pages.length, apiQueries: headApis.length - pages.length,
    ...permissionCoverage(head.objects, pages, emit),
    unsupportedFiles: [...new Set([...base.unsupported, ...head.unsupported])].sort(),
    changedFiles: changed,
    limitations: ['Static inference only; no AL compilation, dependency symbols, table-field type resolution, or runtime authorization validation.',
      'Symlinks, ATS artifacts, hidden tooling directories (including .github), dependencies and generated packages are excluded.'],
  };
  // An inactive branch can influence another file's duplicate or compatibility check.
  for (const finding of findings) {
    if (finding.severity === 'red' && [...influences.get(finding)].some(file => conditionalFiles.has(file))) {
      finding.severity = 'yellow';
      finding.message = `Static coverage incomplete (preprocessor evaluation required): ${finding.message}`;
    }
  }
  findings.sort((a, b) => a.file < b.file ? -1 : a.file > b.file ? 1 : a.line - b.line ||
    (a.severity < b.severity ? -1 : a.severity > b.severity ? 1 : a.message < b.message ? -1 : a.message > b.message ? 1 : 0));
  const summary = { red: findings.filter(item => item.severity === 'red').length,
    yellow: findings.filter(item => item.severity === 'yellow').length, total: findings.length,
    reported: Math.min(findings.length, outputLimits.findings), omitted: Math.max(0, findings.length - outputLimits.findings) };
  const shortened = (value, limit) => value.length > limit ? `${value.slice(0, limit - 1)}…` : value;
  const result = {
    findings: findings.slice(0, outputLimits.findings).map(finding => ({
      ...finding, file: shortened(finding.file, outputLimits.file), message: shortened(finding.message, outputLimits.text),
    })),
    coverage: {
      ...coverage,
      changedFiles: coverage.changedFiles.slice(0, outputLimits.paths).map(file => shortened(file, outputLimits.file)),
      changedFilesTotal: coverage.changedFiles.length,
      unsupportedFiles: coverage.unsupportedFiles.slice(0, outputLimits.paths).map(file => shortened(file, outputLimits.file)),
      unsupportedFilesTotal: coverage.unsupportedFiles.length,
    },
    summary,
  };
  // Include pretty-printing overhead in the budget: base64 remains below 100 KB.
  while (Buffer.byteLength(`${JSON.stringify(result, null, 2)}\n`) > outputLimits.bytes) {
    if (result.findings.length) result.findings.pop();
    else if (result.coverage.changedFiles.length) result.coverage.changedFiles.pop();
    else result.coverage.unsupportedFiles.pop();
    summary.reported = result.findings.length;
    summary.omitted = summary.total - summary.reported;
  }
  return result;
}

function main() {
  const args = process.argv.slice(2), options = {};
  for (let i = 0; i < args.length; i += 2) {
    if (!['--base', '--head', '--output'].includes(args[i]) || !args[i + 1] || args[i + 1].startsWith('--')) {
      throw new Error('Usage: node al-review.mjs --base DIR --head DIR --output FILE');
    }
    options[args[i].slice(2)] = args[i + 1];
  }
  if (!options.output) throw new Error('--output is required');
  const result = review({ baseDir: options.base, headDir: options.head });
  fs.writeFileSync(options.output, `${JSON.stringify(result, null, 2)}\n`);
}

if (process.argv[1] && path.resolve(process.argv[1]) === fileURLToPath(import.meta.url)) {
  try { main(); }
  catch (error) { console.error(error.message); process.exitCode = 1; }
}
