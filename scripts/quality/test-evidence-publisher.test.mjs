import assert from 'node:assert/strict';
import fs from 'node:fs';
import os from 'node:os';
import path from 'node:path';
import test from 'node:test';

import {
  EVIDENCE_CONTRACT_ID,
  EVIDENCE_INSTANCE_ID,
  buildPackageDossier,
  buildRepositoryBundle,
  logicalIdentity,
  runSelfCertification,
  validatePackageDossier,
  validateRepositoryBundle,
  verifyBundleFiles,
  writeRepositoryBundle,
} from './test-evidence-publisher.mjs';

function gateReport(overrides = {}) {
  return {
    schema_version: 1,
    logical_gate_identity: 'VENTO Required Gate',
    gate_context: 'MERGE',
    repository: 'vento-group-sas/vento-shell',
    source_commit: 'a'.repeat(40),
    base_commit: 'b'.repeat(40),
    target_branch: 'main',
    environment: null,
    package_id: null,
    required_check_set_identity: logicalIdentity([
      { check_id: 'npm-test', owner: 'SHELL-CI-016' },
      { check_id: 'treq-registry', owner: 'SHELL-CI-017' },
    ]),
    checks: [
      { check_id: 'npm-test', owner: 'SHELL-CI-016', result: 'PASS' },
      { check_id: 'treq-registry', owner: 'SHELL-CI-017', result: 'PASS' },
    ],
    treq_registry_identity: `sha256:${'c'.repeat(64)}`,
    treq_baseline_identity: 'b'.repeat(40),
    affected_treq_ids: [],
    started_at: '2026-08-18T20:00:00.000Z',
    completed_at: '2026-08-18T20:01:00.000Z',
    execution_identity: 'github:100:1',
    result: 'PASS',
    block_reasons: [],
    ...overrides,
  };
}

function bundle(overrides = {}) {
  return buildRepositoryBundle({
    gateReport: gateReport(overrides),
    provider: 'github-actions',
    providerRunId: '100',
    providerRunAttempt: 1,
    providerWorkflowIdentity:
      'vento-group-sas/vento-shell/.github/workflows/vento-required-gate.yml@refs/heads/test',
    publishedAt: '2026-08-18T20:01:10.000Z',
  }).bundle;
}

test('autocertifica los 51 escenarios contractuales mínimos de CI019', () => {
  const result = runSelfCertification();
  assert.equal(result.instance_id, EVIDENCE_INSTANCE_ID);
  assert.equal(result.positive_count, 15);
  assert.equal(result.negative_count, 20);
  assert.equal(result.regression_count, 16);
  assert.equal(result.scenario_count, 51);
  assert.deepEqual(result.failures, []);
  assert.equal(result.result, 'PASS');
});

test('construye y valida un bundle reproducible sin reinterpretar CI018', () => {
  const built = bundle({
    affected_treq_ids: ['TREQ-SHELL-005', 'TREQ-SHELL-008'],
  });
  const validation = validateRepositoryBundle(built, {
    expectedRepository: 'vento-group-sas/vento-shell',
    expectedSourceCommit: 'a'.repeat(40),
    expectedExecutionIdentity: 'github:100:1',
  });
  assert.equal(built.evidence_contract_id, EVIDENCE_CONTRACT_ID);
  assert.deepEqual(
    built.affected_treq_ids,
    ['TREQ-SHELL-005', 'TREQ-SHELL-008'],
  );
  assert.equal(validation.result, 'PASS');
});

test('el almacenamiento local previo al upload es append-only', () => {
  const root = fs.mkdtempSync(path.join(os.tmpdir(), 'vento-ci019-test-'));
  try {
    const report = gateReport();
    writeRepositoryBundle({
      gateReport: report,
      outputDirectory: root,
      providerRunId: '100',
      providerRunAttempt: 1,
      providerWorkflowIdentity: 'workflow:test',
    });

    const validation = verifyBundleFiles({
      bundlePath: path.join(root, 'bundle.json'),
      gateReportPath: path.join(root, 'gate-decision.json'),
      expectedRepository: report.repository,
      expectedSourceCommit: report.source_commit,
      expectedExecutionIdentity: report.execution_identity,
    });
    assert.equal(validation.result, 'PASS');

    assert.throws(() => writeRepositoryBundle({
      gateReport: report,
      outputDirectory: root,
      providerRunId: '100',
      providerRunAttempt: 1,
      providerWorkflowIdentity: 'workflow:test',
    }), /PUBLICATION_OUTPUT_ALREADY_EXISTS/u);
  } finally {
    fs.rmSync(root, { recursive: true, force: true });
  }
});

test('un dossier multi-repositorio conserva un SHA independiente por repositorio', () => {
  const shell = bundle();
  const nexo = buildRepositoryBundle({
    gateReport: gateReport({
      repository: 'vento-group-sas/vento-nexo',
      source_commit: 'd'.repeat(40),
      execution_identity: 'github:200:1',
    }),
    providerRunId: '200',
    providerRunAttempt: 1,
    providerWorkflowIdentity: 'workflow:nexo',
  }).bundle;

  const dossier = buildPackageDossier({
    packageId: 'PKG-CI019-MULTI',
    requiredRepositories: [shell.repository, nexo.repository],
    bundles: [shell, nexo],
    packageExecutionIdentity: 'package-run:multi:1',
  });

  assert.equal(dossier.completeness, 'COMPLETE');
  assert.equal(dossier.result, 'PASS');
  assert.notEqual(
    dossier.repositories[0].source_commit,
    dossier.repositories[1].source_commit,
  );
  assert.equal(validatePackageDossier(dossier).result, 'PASS');
});

test('un bundle alterado queda bloqueado', () => {
  const altered = bundle();
  altered.bundle_identity = `sha256:${'0'.repeat(64)}`;
  const result = validateRepositoryBundle(altered);
  assert.equal(result.result, 'BLOCKED');
  assert.match(result.errors.join(','), /PUBLICATION_BUNDLE_IDENTITY_MISMATCH/u);
});