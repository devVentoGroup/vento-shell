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
  readinessBlockers,
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

test('readiness previa a la rama ignora solo el bloqueo esperado AUTHORIZED', () => {
  const instanceId = 'SHELL-CON-001::GLOBAL';
  const blockers = readinessBlockers({
    blockers: [
      `${instanceId} debe estar IN_PROGRESS para ejecutar el preflight fisico; estado actual: AUTHORIZED.`,
      'formato de tarea: NEEDS_FORMAT.',
    ],
  }, instanceId);

  assert.deepEqual(blockers, ['formato de tarea: NEEDS_FORMAT.']);
});

test('start ejecuta readiness antes de crear rama y luego preflight IN_PROGRESS estricto', () => {
  const source = fs.readFileSync('scripts/docs/implementation-branch-lifecycle.mjs', 'utf8');
  const readinessDefinition = source.indexOf('function physicalReadiness');
  const readinessCall = source.indexOf('const readiness = physicalReadiness(root, id);');
  const branchMutation = source.indexOf('const branchMode = ensureBranchReadyForStart(root, branch);', readinessCall);
  const statusWrite = source.indexOf("writeInstanceStatus(root, id, 'IN_PROGRESS')", branchMutation);
  const preflightDefinition = source.indexOf('function physicalPreflight');
  const instanceArg = source.indexOf("'--instance-id', instanceId", preflightDefinition);
  const strict = source.indexOf("'--strict'", instanceArg);
  const preflightCall = source.indexOf('const report = physicalPreflight(root, id);', statusWrite);
  const ready = source.indexOf("READY_TO_IMPLEMENT: 'SI'", preflightCall);

  assert.ok(readinessDefinition >= 0);
  assert.ok(readinessCall > readinessDefinition);
  assert.ok(branchMutation > readinessCall);
  assert.ok(statusWrite > branchMutation);
  assert.ok(preflightDefinition >= 0);
  assert.ok(instanceArg > preflightDefinition);
  assert.ok(strict > instanceArg);
  assert.ok(preflightCall > statusWrite);
  assert.ok(ready > preflightCall);
});

test('finish valida plan y TREQ localmente antes de commit, push y CI', () => {
  const source = fs.readFileSync('scripts/docs/implementation-branch-lifecycle.mjs', 'utf8');
  const finish = source.indexOf('export function finishImplementation');
  const verified = source.indexOf('assertInstanceCanFinish(instance);', finish);
  const build = source.indexOf("npm(['run', '--silent', 'docs:plan:build']", verified);
  const planCheck = source.indexOf("npm(['run', '--silent', 'docs:plan:check']", build);
  const planTest = source.indexOf("npm(['run', '--silent', 'docs:plan:test']", planCheck);
  const treqCheck = source.indexOf("npm(['run', '--silent', 'docs:treq:check']", planTest);
  const treqTest = source.indexOf("npm(['run', '--silent', 'docs:treq:test']", treqCheck);
  const lint = source.indexOf("npm(['run', '--silent', 'quality:lint:ratchet']", treqTest);
  const commitScope = source.indexOf("'docs:commit-scope:check'", lint);
  const push = source.indexOf("git(['push', '-u', 'origin', branch]", commitScope);
  const checks = source.indexOf('waitForPrChecksToRegister(root, prNumber)', push);
  const merge = source.indexOf("'pr', 'merge'", checks);
  const cleanup = source.indexOf('cleanupBranch(root, branch)', merge);
  const ready = source.indexOf("READY_TO_RESTART_WATCHER: 'SI'", cleanup);

  assert.ok(finish >= 0);
  assert.ok(verified > finish);
  assert.ok(build > verified);
  assert.ok(planCheck > build);
  assert.ok(planTest > planCheck);
  assert.ok(treqCheck > planTest);
  assert.ok(treqTest > treqCheck);
  assert.ok(lint > treqTest);
  assert.ok(commitScope > lint);
  assert.ok(push > commitScope);
  assert.ok(checks > push);
  assert.ok(merge > checks);
  assert.ok(cleanup > merge);
  assert.ok(ready > cleanup);
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