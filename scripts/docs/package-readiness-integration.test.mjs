import assert from 'node:assert/strict';
import fs from 'node:fs';
import test from 'node:test';

const packageJson = JSON.parse(fs.readFileSync('package.json', 'utf8'));
const buildSource = fs.readFileSync('scripts/docs/build-plan-canonico.mjs', 'utf8');
const syncSource = fs.readFileSync('scripts/docs/sync-local-derived-artifacts.mjs', 'utf8');
const scannerSource = fs.readFileSync('scripts/docs/package-readiness-scanner.mjs', 'utf8');
const starterSource = fs.readFileSync('scripts/docs/chatgpt-work-starter-readiness.mjs', 'utf8');
const lifecycleSource = fs.readFileSync('scripts/docs/task-branch-lifecycle-readiness.mjs', 'utf8');
const index = JSON.parse(fs.readFileSync(
  'scripts/docs/package-readiness/implementation-capability-index.json',
  'utf8',
));

test('build ejecuta scanner fail-closed antes de generar iniciadores readiness', () => {
  const scan = buildSource.indexOf("scanPackageReadiness({ root, write: true, trigger: 'plan-build' })");
  const starter = buildSource.indexOf('writeChatgptWorkStarter({ root, readinessResult })');
  assert.ok(scan >= 0);
  assert.ok(starter > scan);
  assert.match(buildSource, /\[PACKAGE READINESS\] Compilaci\\u00f3n bloqueada/u);
  assert.match(buildSource, /process\.exit\(1\)/u);
});

test('local sync verifica readiness sin modificar estado versionado', () => {
  const before = syncSource.indexOf('const beforeStatus = repositoryStatus(repositoryRoot);');
  const scan = syncSource.indexOf("trigger: 'local-derived-sync'");
  const starter = syncSource.indexOf('writeReadinessChatgptWorkStarter({');
  const after = syncSource.indexOf('const afterStatus = repositoryStatus(repositoryRoot);');
  assert.ok(before >= 0);
  assert.ok(scan > before);
  assert.ok(starter > scan);
  assert.ok(after > starter);
  assert.match(syncSource, /check: true/u);
  assert.match(syncSource, /VERSIONED_WORKTREE: UNCHANGED/u);
});

test('package.json enruta starter, status, commit-scope y lifecycle por la capa readiness', () => {
  assert.equal(packageJson.scripts['docs:chatgpt:starter'], 'node scripts/docs/chatgpt-work-starter-readiness.mjs');
  assert.equal(packageJson.scripts['docs:implementation:status'], 'node scripts/docs/implementation-readiness-coordinator.mjs');
  assert.equal(packageJson.scripts['docs:commit-scope:check'], 'node scripts/docs/commit-scope-readiness.mjs');
  assert.equal(packageJson.scripts['docs:task:start'], 'node scripts/docs/task-branch-lifecycle-readiness.mjs start');
  assert.equal(packageJson.scripts['docs:task:finish'], 'node scripts/docs/task-branch-lifecycle-readiness.mjs finish');
  assert.match(packageJson.scripts['docs:plan:check'], /chatgpt-work-starter-readiness\.mjs --check/u);
  assert.doesNotMatch(packageJson.scripts['docs:plan:check'], /chatgpt-work-starter\.mjs --check/u);
});

test('el lifecycle documental escanea antes y después del cierre y no publica PASS antes del postcheck', () => {
  const pre = lifecycleSource.indexOf("trigger: 'task-finish-premerge'");
  const finish = lifecycleSource.indexOf('captureFinalResult(() => finishTask');
  const post = lifecycleSource.indexOf("trigger: 'task-finish-postmerge'");
  const replay = lifecycleSource.indexOf('replayFinalResult();');
  assert.ok(pre >= 0);
  assert.ok(finish > pre);
  assert.ok(post > finish);
  assert.ok(replay > post);
});

test('scanner separa registry documental persistente de estado físico efectivo', () => {
  assert.match(scannerSource, /status_scope: 'DOCUMENTARY_READINESS'/u);
  assert.match(scannerSource, /export function applyPhysicalOverlay/u);
  assert.match(scannerSource, /status_scope: 'EFFECTIVE_RUNTIME'/u);
  assert.match(scannerSource, /physical_authorization_required: true/u);
  assert.match(scannerSource, /persistentRegistry: nextPersistentRegistry/u);
});

test('los iniciadores usan una única proyección readiness y prohíben cambio silencioso de carril', () => {
  assert.match(starterSource, /PACKAGE READINESS SCANNER — OBLIGATORIO/u);
  assert.match(starterSource, /NO cambiar de carril/u);
  assert.match(starterSource, /No equivale a AUTHORIZED/u);
  assert.match(starterSource, /DOCUMENTATION_QUEUE = EMPTY/u);
  assert.match(starterSource, /READY_FOR_AUTHORIZATION/u);
});

test('el índice inicial no inventa un catálogo masivo y solo siembra identidades canónicas explícitas', () => {
  assert.equal(index.discovery_mode, 'EXPLICIT_CANONICAL_MAPPINGS_ONLY');
  assert.deepEqual(Object.keys(index.capabilities).sort(), ['NEXO_REMISSIONS', 'VISO_SCHEDULE_MONTHLY']);
  assert.equal(index.capabilities.NEXO_REMISSIONS.canonical_package_id, 'NEXO-REMISSIONS-001');
  assert.equal(index.capabilities.VISO_SCHEDULE_MONTHLY.canonical_package_id, 'VISO-SCHEDULE-MONTHLY-001');
});
