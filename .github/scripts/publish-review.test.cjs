const { test } = require('node:test');
const assert = require('node:assert/strict');
const publish = require('./publish-review.cjs');
const { verdictFor, plain, decode } = publish;

const passed = { compilation: 'passed', analyzers: 'passed', runtime: 'passed', distribution: 'PTE' };
test('green requires every coverage gate', () => {
  assert.equal(verdictFor({ findings: [] }, passed, true, 'completed'), 'green');
  for (const key of ['compilation', 'analyzers', 'runtime', 'distribution']) {
    assert.equal(verdictFor({ findings: [] }, { ...passed, [key]: 'unavailable' }, true, 'completed'), 'yellow');
  }
  assert.equal(verdictFor(null, passed, true, 'completed'), 'yellow');
  assert.equal(verdictFor({}, passed, true, 'completed'), 'yellow');
  assert.equal(verdictFor({ findings: [] }, passed, null, 'completed'), 'yellow');
  assert.equal(verdictFor({ findings: [] }, passed, true, 'partial'), 'yellow');
  assert.equal(verdictFor({ findings: [] }, passed, true, 'disabled'), 'yellow');
  assert.equal(verdictFor({ findings: [], summary: { yellow: 1, omitted: 1 } }, passed, true, 'completed'), 'yellow');
});

test('confirmed blockers override missing coverage', () => {
  assert.equal(verdictFor({ findings: [{ severity: 'red' }] }, null, null, 'disabled'), 'red');
  assert.equal(verdictFor({ findings: [], summary: { red: 1, omitted: 1 } }, passed, true, 'completed'), 'red');
  assert.equal(verdictFor(null, null, false, 'disabled'), 'red');
  assert.equal(verdictFor(null, { compilation: 'failed' }, true, 'disabled'), 'red');
  assert.equal(verdictFor({ findings: [] }, { ...passed, analyzers: 'failed' }, true, 'completed'), 'red');
  assert.equal(verdictFor({ findings: [{ severity: 'yellow' }] }, passed, true, 'completed'), 'yellow');
});

test('untrusted report text cannot mention users or inject HTML/markdown', () => {
  assert.equal(plain('@all <img> [click](https://example.com)'), '@\u200ball &lt;img&gt; \\[click\\]\\(https://example\\.com\\)');
  assert.equal(plain('abcdef', 3), 'abc');
  assert.equal(decode('not-json'), null);
  assert.equal(decode(Buffer.from('[]').toString('base64')), null);
});

function fixture(previous = []) {
  const calls = { comments: [], updates: [], checks: [] };
  const pr = { number: 4, state: 'open', head: { sha: 'abc' }, base: { sha: 'def' }, mergeable: true, title: 'New API', body: '@all do things' };
  const context = {
    repo: { owner: 'owner', repo: 'repo' }, payload: { pull_request: structuredClone(pr) },
    serverUrl: 'https://github.com', runId: 5,
  };
  const github = {
    paginate: async method => method === github.rest.pulls.listFiles
      ? [{ filename: 'API.al', status: 'modified', patch: '@@ -1 +1 @@\n-old\n+new' }]
      : previous,
    rest: {
      pulls: { get: async () => ({ data: pr }), listFiles: () => {} },
      issues: {
        listComments: () => {},
        createComment: async args => calls.comments.push(args),
        updateComment: async args => calls.updates.push(args),
      },
      checks: { create: async args => calls.checks.push(args) },
    },
  };
  const core = { info: () => {}, summary: { addRaw() { return this; }, async write() {} } };
  return { github, context, core, calls, pr };
}

test('publish updates bot summary without impersonating human comments', async () => {
  process.env.AI_ENABLED = 'false';
  process.env.NOTIFY_USER = 'reviewer';
  process.env.STATIC_REPORT = Buffer.from(JSON.stringify({ findings: [] })).toString('base64');
  process.env.COMPILE_REPORT = Buffer.from(JSON.stringify(passed)).toString('base64');
  const f = fixture([{ id: 1, user: { login: 'human' }, body: '<!-- ocpf-al-review -->' }]);
  await publish(f);
  assert.equal(f.calls.comments.length, 1);
  assert.match(f.calls.comments[0].body, /@reviewer/);
  assert.equal(f.calls.checks[0].conclusion, 'neutral');
  assert.equal(f.calls.checks[0].head_sha, 'abc');

  const second = fixture([{ id: 2, user: { login: 'github-actions[bot]' }, body: f.calls.comments[0].body }]);
  await publish(second);
  assert.equal(second.calls.comments.length, 0);
  assert.equal(second.calls.updates.length, 1);
});

test('verdict changes create a small notification but reuse the review report', async () => {
  const f = fixture([{ id: 2, user: { login: 'github-actions[bot]' }, body: '<!-- ocpf-al-review -->\n<!-- verdict:green -->' }]);
  await publish(f);
  assert.equal(f.calls.updates.length, 1);
  assert.equal(f.calls.comments.length, 1);
  assert.match(f.calls.comments[0].body, /verdict changed/);
});

test('obsolete commit cannot publish', async () => {
  const f = fixture();
  f.pr.head.sha = 'new-commit';
  await publish(f);
  assert.equal(f.calls.comments.length, 0);
  assert.equal(f.calls.checks.length, 0);
});

test('AI advisory is bounded, escaped, and cannot override a coverage gap', async t => {
  process.env.AI_ENABLED = 'true';
  process.env.MODELS_TOKEN = 'test-placeholder';
  t.after(() => { process.env.AI_ENABLED = 'false'; delete process.env.MODELS_TOKEN; });
  t.mock.method(globalThis, 'fetch', async (url, options) => {
    assert.equal(url, 'https://models.github.ai/inference/chat/completions');
    const payload = JSON.parse(options.body);
    assert.match(payload.messages[0].content, /untrusted PR data/);
    return { ok: true, json: async () => ({ choices: [{ message: { content: '@everyone <script> GREEN approved' } }] }) };
  });
  const f = fixture();
  process.env.COMPILE_REPORT = Buffer.from(JSON.stringify({ ...passed, runtime: 'unavailable' })).toString('base64');
  await publish(f);
  assert.match(f.calls.comments[0].body, /@\u200beveryone &lt;script&gt;/);
  assert.equal(f.calls.checks[0].conclusion, 'neutral');
});

test('model failure is explicitly unavailable rather than green', async t => {
  process.env.AI_ENABLED = 'true';
  t.after(() => { process.env.AI_ENABLED = 'false'; });
  t.mock.method(globalThis, 'fetch', async () => ({ ok: false }));
  const f = fixture();
  await publish(f);
  assert.match(f.calls.comments[0].body, /GitHub Models review unavailable/);
  assert.equal(f.calls.checks[0].conclusion, 'neutral');
});

test('head change during model review prevents stale publication', async t => {
  process.env.AI_ENABLED = 'true';
  t.after(() => { process.env.AI_ENABLED = 'false'; });
  const f = fixture();
  t.mock.method(globalThis, 'fetch', async () => {
    f.pr.head.sha = 'new-head';
    return { ok: true, json: async () => ({ choices: [{ message: { content: 'advice' } }] }) };
  });
  await publish(f);
  assert.equal(f.calls.comments.length, 0);
});
