import assert from 'node:assert/strict';
import fs from 'node:fs';
import test from 'node:test';

import {
  assertInstanceCanFinish,
  assertInstanceCanStart,
  assertStartWorktree,
  buildImplementationPrBody,
  classifyImplementationPath,
  implementationBranchName,
  normalizeInstanceId,
  physicalLaneBlockers,
  readinessBlockers,
  resolveImplementationFinishMode,
} from './implementation-branch-lifecycle.mjs';

test('normaliza instance_id y deriva rama fisica estable', () => {
  assert.equal(normalizeInstanceId('shell-con-001::GLOBAL'), 'SHELL-CON-001::GLOBAL');
  assert.equal(
    implementationBranchName('SHELL-CON-001::GLOBAL'),
    'implementation/shell-con-001/global',
  );
  assert.equal(
    implementationBranchName('AUTH-DB-020::pkg_001'),
    'implementation/auth-db-020/pkg_001',
  );
});

test('rechaza instance_id inseguros o sin cardinalidad fisica', () => {
  assert.throws(() => normalizeInstanceId('SHELL-CON-001'), /INSTANCE_ID invalido/u);
  assert.throws(() => normalizeInstanceId('../main::GLOBAL'), /INSTANCE_ID invalido/u);
  assert.throws(() => normalizeInstanceId('SHELL-CON-001::../GLOBAL'), /INSTANCE_ID invalido/u);
});

test('start exige AUTHORIZED con decision humana aprobada', () => {
  assert.equal(assertInstanceCanStart({
    instance_id: 'SHELL-CON-001::GLOBAL',
    status: 'AUTHORIZED',
    authorization: { decision: 'APPROVED' },
  }), true);
  assert.throws(
    () => assertInstanceCanStart({
      instance_id: 'SHELL-CON-001::GLOBAL',
      status: 'PENDING_AUTHORIZATION',
      authorization: null,
    }),
    /debe estar AUTHORIZED/u,
  );
});

test('finish exige VERIFIED y evidence consolidada', () => {
  assert.equal(assertInstanceCanFinish({
    instance_id: 'SHELL-CON-001::GLOBAL',
    status: 'VERIFIED',
    evidence: ['VALIDATION PASS'],
  }), true);
  assert.throws(
    () => assertInstanceCanFinish({
      instance_id: 'SHELL-CON-001::GLOBAL',
      status: 'IMPLEMENTED',
      evidence: ['VALIDATION PASS'],
    }),
    /debe estar VERIFIED/u,
  );
  assert.throws(
    () => assertInstanceCanFinish({
      instance_id: 'SHELL-CON-001::GLOBAL',
      status: 'VERIFIED',
      evidence: [],
    }),
    /sin evidence consolidada/u,
  );
});

test('start solo admite el registro fisico AUTHORIZED como cambio local previo', () => {
  const record = 'docs/plan-canonico/modular/implementation-instances/SHELL-CON-001__GLOBAL.json';
  assert.equal(assertStartWorktree([record], record), true);
  assert.throws(
    () => assertStartWorktree([record, 'package.json'], record),
    /unico cambio local/u,
  );
  assert.throws(
    () => assertStartWorktree([], record),
    /unico cambio local/u,
  );
});

test('finish crea commit con cambios y reanuda si el commit ya existe', () => {
  assert.equal(
    resolveImplementationFinishMode({
      dirtyPaths: ['packages/ui-web/src/Test.tsx'],
      branchCommits: 0,
    }),
    'CREATE_COMMIT',
  );
  assert.equal(
    resolveImplementationFinishMode({ dirtyPaths: [], branchCommits: 1 }),
    'RESUME_POST_COMMIT',
  );
  assert.throws(
    () => resolveImplementationFinishMode({ dirtyPaths: [], branchCommits: 0 }),
    /no encontro cambios locales ni un commit de implementacion existente para reanudar/u,
  );
});

test('cierre fisico permite codigo gobernado pero bloquea 04A y archivos ajenos', () => {
  assert.equal(classifyImplementationPath('packages/contracts/package.json'), 'ALLOWED');
  assert.equal(
    classifyImplementationPath('docs/plan-canonico/modular/implementation-instances/SHELL-CON-001__GLOBAL.json'),
    'ALLOWED',
  );
  assert.equal(
    classifyImplementationPath('docs/plan-canonico/modular/bloques/E1_DESCUBRIMIENTO_OPERATIVO/04A_04_SHELL.md'),
    'TREQ_REGISTRY',
  );
  assert.equal(classifyImplementationPath('.env.local'), 'OTHER');
});

test('PR fisico declara TREQ NONE y lista el alcance real', () => {
  const body = buildImplementationPrBody('SHELL-CON-001::GLOBAL', [
    'packages/contracts/package.json',
    'docs/plan-canonico/modular/implementation-instances/SHELL-CON-001__GLOBAL.json',
  ]);
  assert.match(body, /^VENTO-TREQ-AFFECTED: NONE$/mu);
  assert.match(body, /SHELL-CON-001::GLOBAL/u);
  assert.match(body, /packages\/contracts\/package\.json/u);
  assert.throws(
    () => buildImplementationPrBody('SHELL-CON-001::GLOBAL', [
      'docs/plan-canonico/modular/bloques/E1_DESCUBRIMIENTO_OPERATIVO/04A_04_SHELL.md',
    ]),
    /no puede modificar el registro 04A\/TREQ/u,
  );
});

test('readiness fisica desacopla continuidad y formato documentales historicos', () => {
  const instanceId = 'SHELL-CON-001::GLOBAL';
  const report = {
    blockers: [
      `${instanceId} debe estar IN_PROGRESS para ejecutar el preflight fisico; estado actual: AUTHORIZED.`,
      'formato de tarea: NEEDS_FORMAT.',
      'active-sequence.json requiere regeneración.',
      'contrato de entrega inválido: CONTRACT_ERROR',
    ],
  };

  assert.deepEqual(
    readinessBlockers(report, instanceId),
    ['contrato de entrega inválido: CONTRACT_ERROR'],
  );
  assert.deepEqual(
    physicalLaneBlockers(report, instanceId),
    [
      `${instanceId} debe estar IN_PROGRESS para ejecutar el preflight fisico; estado actual: AUTHORIZED.`,
      'contrato de entrega inválido: CONTRACT_ERROR',
    ],
  );
});

test('start abre carril fisico antes de reconciliar derivados versionados y no exige formato documental historico', () => {
  const source = fs.readFileSync('scripts/docs/implementation-branch-lifecycle.mjs', 'utf8');
  const start = source.indexOf('export function startImplementation');
  const readinessDefinition = source.indexOf('function physicalReadiness');
  const worktreeGuard = source.indexOf('assertStartWorktree(worktreePaths(root), recordPath);', start);
  const readinessCall = source.indexOf('const readiness = physicalReadiness(root, id);', worktreeGuard);
  const branchMutation = source.indexOf('const branchMode = ensureBranchReadyForStart(root, branch);', readinessCall);
  const secondWorktreeGuard = source.indexOf('assertStartWorktree(worktreePaths(root), recordPath);', branchMutation);
  const statusWrite = source.indexOf("writeInstanceStatus(root, id, 'IN_PROGRESS')", secondWorktreeGuard);
  const preflightDefinition = source.indexOf('function physicalPreflight');
  const instanceArg = source.indexOf("'--instance-id', instanceId", preflightDefinition);
  const strict = source.indexOf("'--strict'", instanceArg);
  const preflightCall = source.indexOf('const report = physicalPreflight(root, id);', statusWrite);
  const build = source.indexOf("npm(['run', '--silent', 'docs:plan:build']", preflightCall);
  const planCheck = source.indexOf("npm(['run', '--silent', 'docs:plan:check']", build);
  const diffCheck = source.indexOf("git(['diff', '--check']", planCheck);
  const ready = source.indexOf("READY_TO_IMPLEMENT: 'SI'", diffCheck);
  const preStartLocalSync = source.indexOf('syncLocalDerivedArtifacts({ root, quiet: true });', start);

  assert.ok(readinessDefinition >= 0);
  assert.ok(worktreeGuard > start);
  assert.ok(readinessCall > readinessDefinition);
  assert.ok(branchMutation > readinessCall);
  assert.ok(secondWorktreeGuard > branchMutation && secondWorktreeGuard < statusWrite);
  assert.ok(statusWrite > branchMutation);
  assert.ok(preflightDefinition >= 0);
  assert.ok(instanceArg > preflightDefinition);
  assert.ok(strict > instanceArg);
  assert.ok(preflightCall > statusWrite);
  assert.ok(build > preflightCall);
  assert.ok(planCheck > build);
  assert.ok(diffCheck > planCheck);
  assert.ok(ready > diffCheck);
  assert.ok(preStartLocalSync === -1 || preStartLocalSync > ready);
  assert.match(source, /START_DOCS_PLAN_BUILD: 'PASS_ONCE'/u);
  assert.match(source, /DOCUMENTARY_LANE_FOR_PHYSICAL: 'ADVISORY_ONLY'/u);
});

test('finish conserva validadores, reanuda post-commit y usa polling reintentable antes del merge', () => {
  const source = fs.readFileSync('scripts/docs/implementation-branch-lifecycle.mjs', 'utf8');
  const finish = source.indexOf('export async function finishImplementation');
  const finishEnd = source.indexOf('function parseArgs', finish);
  const finishSource = source.slice(finish, finishEnd);
  const verified = source.indexOf('assertInstanceCanFinish(instance);', finish);
  const build = source.indexOf("npm(['run', '--silent', 'docs:plan:build']", verified);
  const planCheck = source.indexOf("npm(['run', '--silent', 'docs:plan:check']", build);
  const parallel = source.indexOf('await Promise.all([', planCheck);
  const planTest = source.indexOf("npmAsync(['run', '--silent', 'docs:plan:test']", parallel);
  const treqCheck = source.indexOf("npmAsync(['run', '--silent', 'docs:treq:check']", parallel);
  const treqTest = source.indexOf("npmAsync(['run', '--silent', 'docs:treq:test']", parallel);
  const lint = source.indexOf("npmAsync(['run', '--silent', 'quality:lint:ratchet']", parallel);
  const dirty = source.indexOf('const dirty = worktreePaths(root);', parallel);
  const finishMode = source.indexOf('const finishMode = resolveImplementationFinishMode({', dirty);
  const commitScope = source.indexOf("'docs:commit-scope:check'", finishMode);
  const push = source.indexOf("git(['push', '-u', 'origin', branch]", commitScope);
  const registration = source.indexOf('waitForPrChecksToRegister(root, prNumber)', push);
  const completion = source.indexOf('waitForPrChecksToComplete(root, prNumber)', registration);
  const merge = source.indexOf("'pr', 'merge'", completion);
  const mainPull = source.indexOf("git(['pull', '--ff-only', 'origin', DEFAULT_BRANCH]", merge);
  const localDerivedSync = source.indexOf('syncLocalDerivedArtifacts({ root, quiet: true });', mainPull);
  const cleanup = source.indexOf('cleanupBranch(root, branch)', localDerivedSync);
  const ready = source.indexOf("READY_TO_RESTART_WATCHER: 'SI'", cleanup);
  const main = source.indexOf('async function main()');
  const awaitedFinish = source.indexOf('await finishImplementation({ instanceId: args.instanceId });', main);
  const awaitedMain = source.indexOf('await main();', awaitedFinish);

  assert.ok(finish >= 0);
  assert.ok(verified > finish);
  assert.ok(build > verified);
  assert.ok(planCheck > build);
  assert.ok(parallel > planCheck);
  assert.ok(planTest > parallel && planTest < dirty);
  assert.ok(treqCheck > parallel && treqCheck < dirty);
  assert.ok(treqTest > parallel && treqTest < dirty);
  assert.ok(lint > parallel && lint < dirty);
  assert.ok(finishMode > dirty);
  assert.ok(commitScope > finishMode);
  assert.ok(push > commitScope);
  assert.ok(registration > push);
  assert.ok(completion > registration);
  assert.ok(merge > completion);
  assert.ok(mainPull > merge);
  assert.ok(localDerivedSync > mainPull);
  assert.ok(cleanup > localDerivedSync);
  assert.ok(ready > cleanup);
  assert.ok(main >= 0);
  assert.ok(awaitedFinish > main);
  assert.ok(awaitedMain > awaitedFinish);
  assert.equal(finishSource.includes("'--watch'"), false);
  assert.match(source, /import \{ spawn, spawnSync \} from 'node:child_process';/u);
  assert.match(source, /const CHECK_REGISTRATION_ATTEMPTS = 60;/u);
  assert.match(source, /const CHECK_REGISTRATION_INTERVAL_MS = 2000;/u);
  assert.match(source, /const MERGE_CONFIRM_ATTEMPTS = 60;/u);
  assert.match(source, /const MERGE_CONFIRM_INTERVAL_MS = 2000;/u);
  assert.match(source, /FINISH_MODE: finishMode/u);
  assert.match(source, /CHECKS_COMPLETED: completedCheckCount/u);
  assert.match(source, /LOCAL_DERIVED_SYNC: 'PASS_AFTER_MERGE'/u);
});

test('CI usa fast lane en PR fisico sin duplicar suites cubiertas por Required Gate', () => {
  const source = fs.readFileSync('.github/workflows/validate-canonical-plan.yml', 'utf8');

  assert.match(source, /implementation_pr=false/u);
  assert.match(source, /\$\{HEAD_REF:-\}" == implementation\/\*/u);
  assert.match(source, /implementation_pr=\$implementation_pr/u);
  assert.match(
    source,
    /steps\.scope\.outputs\.implementation_pr != 'true'/u,
  );

  const planChecks = source.match(/run: npm run docs:plan:check/gu) ?? [];
  assert.equal(planChecks.length, 1);
  assert.equal(source.includes('run: npm run docs:delivery:check'), false);
  assert.match(source, /npm ci --prefer-offline --no-audit --no-fund/u);
});

test('docs:plan:build materializa la siguiente instancia pendiente antes del core build', () => {
  const source = fs.readFileSync('scripts/docs/build-plan-canonico.mjs', 'utf8');
  const derive = source.indexOf('deriveImplementationControl({ root })');
  const pending = source.indexOf('ensurePendingImplementationRecord({ root, control: preBuildControl })', derive);
  const coreBuild = source.indexOf("await import('./safe-build-plan-canonico.mjs')", pending);
  const finalControl = source.indexOf('writeImplementationControlArtifacts({ root })', coreBuild);

  assert.ok(derive >= 0);
  assert.ok(pending > derive);
  assert.ok(coreBuild > pending);
  assert.ok(finalControl > coreBuild);
});

test('package.json expone el lifecycle fisico y docs:plan:test lo autocertifica', () => {
  const packageJson = JSON.parse(fs.readFileSync('package.json', 'utf8'));
  assert.equal(
    packageJson.scripts['docs:implementation:start'],
    'node scripts/docs/implementation-branch-lifecycle.mjs start',
  );
  assert.equal(
    packageJson.scripts['docs:implementation:finish'],
    'node scripts/docs/implementation-branch-lifecycle.mjs finish',
  );
  assert.match(
    packageJson.scripts['docs:plan:test'],
    /scripts\/docs\/implementation-branch-lifecycle\.test\.mjs/u,
  );
});
test('sync local de derivados protege watcher y no cambia el worktree versionado', () => {
  const packageJson = JSON.parse(fs.readFileSync('package.json', 'utf8'));
  assert.equal(
    packageJson.scripts['docs:plan:local-sync'],
    'node scripts/docs/sync-local-derived-artifacts.mjs',
  );
  assert.equal(
    packageJson.scripts['docs:plan:watch'],
    'node scripts/docs/sync-local-derived-artifacts.mjs && node scripts/docs/watch-plan-canonico.mjs',
  );
  assert.match(
    packageJson.scripts['docs:plan:check'],
    /^node scripts\/docs\/sync-local-derived-artifacts\.mjs && /u,
  );

  const source = fs.readFileSync('scripts/docs/sync-local-derived-artifacts.mjs', 'utf8');
  assert.match(source, /git\(\s*\['check-ignore', '--quiet', '--', relativePath\]/u);
  assert.match(source, /writeChatgptWorkStarter\(\{ root: repositoryRoot \}\)/u);
  assert.match(source, /build-plan-canonico-core\.mjs', '--check'/u);
  assert.match(source, /afterStatus !== beforeStatus/u);
  assert.match(source, /VERSIONED_WORKTREE: UNCHANGED/u);
});
