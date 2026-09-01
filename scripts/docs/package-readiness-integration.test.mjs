import assert from 'node:assert/strict';
import fs from 'node:fs';
import test from 'node:test';

const packageJson = JSON.parse(fs.readFileSync('package.json', 'utf8'));
const buildSource = fs.readFileSync('scripts/docs/build-plan-canonico.mjs', 'utf8');
const syncSource = fs.readFileSync('scripts/docs/sync-local-derived-artifacts.mjs', 'utf8');
const scannerSource = fs.readFileSync('scripts/docs/package-readiness-scanner.mjs', 'utf8');
const starterSource = fs.readFileSync('scripts/docs/chatgpt-work-starter-readiness.mjs', 'utf8');
const packageGateLifecycleSource = fs.readFileSync('scripts/docs/package-gate-lifecycle.mjs', 'utf8');
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

test('package.json enruta starter, status, commit-scope y lifecycle por readiness con carril de correcciones separado', () => {
  const starterCommand = packageJson.scripts['docs:chatgpt:starter'];
  assert.equal(
    starterCommand,
    'node scripts/docs/chatgpt-work-starter-readiness.mjs && node scripts/docs/correction-starter.mjs',
  );
  const readinessStarter = starterCommand.indexOf('chatgpt-work-starter-readiness.mjs');
  const correctionStarter = starterCommand.indexOf('correction-starter.mjs');
  assert.ok(readinessStarter >= 0);
  assert.ok(correctionStarter > readinessStarter);
  assert.equal(packageJson.scripts['docs:implementation:status'], 'node scripts/docs/implementation-readiness-coordinator.mjs');
  assert.equal(packageJson.scripts['docs:commit-scope:check'], 'node scripts/docs/commit-scope-readiness.mjs');
  assert.equal(packageJson.scripts['docs:task:start'], 'node scripts/docs/task-branch-lifecycle-readiness.mjs start');
  assert.equal(packageJson.scripts['docs:task:finish'], 'node scripts/docs/task-branch-lifecycle-readiness.mjs finish');
  assert.match(packageJson.scripts['docs:plan:check'], /chatgpt-work-starter-readiness\.mjs --check/u);
  assert.doesNotMatch(packageJson.scripts['docs:plan:check'], /chatgpt-work-starter\.mjs --check/u);
  assert.equal(packageJson.scripts['docs:package:start'], 'node scripts/docs/package-gate-lifecycle.mjs start');
  assert.equal(packageJson.scripts['docs:package:prepare'], 'node scripts/docs/package-gate-lifecycle.mjs prepare');
  assert.equal(packageJson.scripts['docs:package:gate:status'], 'node scripts/docs/package-gate-lifecycle.mjs status');
  assert.equal(packageJson.scripts['docs:package:gate:check'], 'node scripts/docs/package-gate-lifecycle.mjs check');
  assert.equal(packageJson.scripts['docs:package:gate:approve'], 'node scripts/docs/package-gate-lifecycle.mjs approve');
  assert.equal(packageJson.scripts['docs:package:finish'], 'node scripts/docs/package-gate-lifecycle.mjs finish');
  assert.equal(packageJson.scripts['docs:package:handoff'], 'node scripts/docs/package-gate-lifecycle.mjs handoff');
  assert.equal(packageJson.scripts['docs:package:execution:status'], 'node scripts/docs/package-execution-control.mjs status');
  assert.equal(packageJson.scripts['docs:package:execution:check'], 'node scripts/docs/package-execution-control.mjs check');
  assert.equal(packageJson.scripts['docs:package:select'], undefined);
  assert.match(packageJson.scripts['docs:plan:check'], /package-gate-lifecycle\.mjs check/u);
  assert.match(packageJson.scripts['docs:plan:check'], /package-execution-control\.mjs check/u);
  assert.match(packageJson.scripts['docs:plan:test'], /package-gate-control\.test\.mjs/u);
  assert.match(packageJson.scripts['docs:plan:test'], /package-execution-control\.test\.mjs/u);
  assert.match(packageJson.scripts['docs:plan:test'], /correction-starter\.test\.mjs/u);
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

test('package lifecycle obliga turno, rama, publicación y handoff PENDING', () => {
  assert.match(packageGateLifecycleSource, /assertPackageMutationAllowed/u);
  assert.match(packageGateLifecycleSource, /assertNoFuturePackageArtifacts/u);
  assert.match(packageGateLifecycleSource, /loadValidatedCorrectionControl/u);
  assert.match(packageGateLifecycleSource, /PACKAGE_EXECUTION_ORDER_CORRECTION_OPEN|openOrderCorrections/u);
  assert.match(packageGateLifecycleSource, /infra\/package-gate-/u);
  assert.match(packageGateLifecycleSource, /docs:infra:publish/u);
  assert.match(packageGateLifecycleSource, /pendingInstanceRecord/u);
  assert.match(packageGateLifecycleSource, /PENDING_AUTHORIZATION/u);
  assert.match(packageGateLifecycleSource, /docs:implementation:status/u);
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
  assert.match(starterSource, /no equivale a AUTHORIZED/u);
  assert.match(starterSource, /DOCUMENTATION_QUEUE = EMPTY/u);
  assert.match(starterSource, /READY_FOR_AUTHORIZATION/u);
  assert.match(starterSource, /PACKAGE GATE LIFECYCLE — VALIDACIÓN OBLIGATORIA/u);
  assert.match(starterSource, /docs:package:gate:check/u);
  assert.match(starterSource, /Nunca ejecute docs:package:gate:approve por inferencia/u);
  assert.doesNotMatch(starterSource, /packages\.find\(\(\{ package_gate/u);
  assert.match(starterSource, /Selección humana de package: FALSE/u);
  assert.match(starterSource, /Un bloqueo conserva el turno/u);
  assert.match(starterSource, /docs:package:start/u);
  assert.match(starterSource, /DELIV-PKG-015/u);
  assert.match(starterSource, /PENDING_AUTHORIZATION/u);
});

test('el índice inicial no inventa un catálogo masivo y solo siembra identidades canónicas explícitas', () => {
  assert.equal(index.discovery_mode, 'EXPLICIT_CANONICAL_MAPPINGS_ONLY');
  assert.deepEqual(Object.keys(index.capabilities).sort(), ['NEXO_REMISSIONS', 'VISO_SCHEDULE_MONTHLY']);
  assert.equal(index.capabilities.NEXO_REMISSIONS.canonical_package_id, 'NEXO-REMISSIONS-001');
  assert.equal(index.capabilities.VISO_SCHEDULE_MONTHLY.canonical_package_id, 'VISO-SCHEDULE-MONTHLY-001');
});
