import assert from 'node:assert/strict';
import fs from 'node:fs';
import os from 'node:os';
import path from 'node:path';
import test from 'node:test';

import {
  buildMaterialIdentity,
  compareEvidenceIdentity,
  detectFlakyHistory,
  evaluateTestResult,
  findDuplicateGateImplementations,
  redactSensitiveText,
  stableStringify,
  validateEvidence,
  validateTestContract,
} from './shared-package-test-gate.mjs';

function clone(value) {
  return JSON.parse(JSON.stringify(value));
}

function groupPass(id, total = 2) {
  return { id, status: 'PASS', tests: { total, passed: total, failed: 0, skipped: 0 } };
}

function groupFail(id, total = 2) {
  return { id, status: 'FAIL', tests: { total, passed: total - 1, failed: 1, skipped: 0 } };
}

function groupNotApplicable(id, reason = 'Condition does not apply to this synthetic package.') {
  return { id, status: 'NOT_APPLICABLE', reason, tests: { total: 0, passed: 0, failed: 0, skipped: 0 } };
}

const baseContract = Object.freeze({
  schema_version: 1,
  package: '@vento/contracts',
  runner: {
    command: '$NODE',
    args: ['synthetic-runner.mjs'],
    timeout_ms: 30_000,
  },
  required_groups: [
    { id: 'unit', applicability: 'REQUIRED' },
    { id: 'contractual', applicability: 'REQUIRED' },
    { id: 'security', applicability: 'CONDITIONAL' },
  ],
  fixtures: [],
});

const baseIdentity = Object.freeze(buildMaterialIdentity({
  packageName: '@vento/contracts',
  candidateVersion: '1.2.3',
  sourceCommit: 'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa',
  manifestIdentity: 'sha256:manifest',
  internalDependencySet: [],
  runtimeIdentity: 'node:v24.19.0;platform:win32;arch:x64',
  testContractIdentity: 'sha256:contract',
  fixtureIdentities: [],
  gateImplementationIdentity: 'sha256:gate',
}));

const baseResult = Object.freeze({
  schema_version: 1,
  package: '@vento/contracts',
  outcome: 'PASS',
  groups: [
    groupPass('unit', 2),
    groupPass('contractual', 2),
    groupNotApplicable('security'),
  ],
});

const successfulProcess = Object.freeze({ status: 0, signal: null, timedOut: false, error: null });

function evaluate({
  contract = baseContract,
  result = baseResult,
  processResult = successfulProcess,
  identity = baseIdentity,
  history = [],
} = {}) {
  return evaluateTestResult({
    contract: clone(contract),
    result: clone(result),
    processResult: clone(processResult),
    identity: clone(identity),
    history: clone(history),
  });
}

function evidenceFor(identity = baseIdentity, overrides = {}) {
  return {
    schema_version: 1,
    gate_instance: 'SHELL-CI-001::GLOBAL',
    run_identity: 'run-1',
    started_at: '2026-08-17T19:00:00.000Z',
    ended_at: '2026-08-17T19:00:01.000Z',
    ...clone(identity),
    required_groups: ['unit', 'contractual', 'security'],
    executed_groups: ['unit', 'contractual'],
    conditional_not_applicable: ['security'],
    test_counts: { total: 4, passed: 4, failed: 0, skipped: 0 },
    attempt_number: 1,
    outcome: 'PASS',
    reasons: [],
    runner: { command: '$NODE', args: [], exit_status: 0, signal: null, timed_out: false },
    artifacts: [],
    invalidation_reason: null,
    result_fingerprint: 'sha256:fingerprint',
    ...overrides,
  };
}

// 6 positive cases

test('positive 01 - complete eligible package returns PASS', () => {
  const result = evaluate();
  assert.equal(result.outcome, 'PASS');
  assert.deepEqual(result.test_counts, { total: 4, passed: 4, failed: 0, skipped: 0 });
});

test('positive 02 - same logical inputs produce the same material identity', () => {
  const left = buildMaterialIdentity({
    packageName: '@vento/contracts',
    candidateVersion: '1.2.3',
    sourceCommit: 'a',
    manifestIdentity: 'm',
    internalDependencySet: [{ name: '@vento/os-context', range: '1.0.0', section: 'dependencies' }],
    runtimeIdentity: 'node:v24.19.0',
    testContractIdentity: 'c',
    fixtureIdentities: [{ path: 'fixture.json', sha256: 'f' }],
    gateImplementationIdentity: 'g',
  });
  const right = buildMaterialIdentity({
    packageName: '@vento/contracts',
    candidateVersion: '1.2.3',
    sourceCommit: 'a',
    manifestIdentity: 'm',
    internalDependencySet: [{ section: 'dependencies', range: '1.0.0', name: '@vento/os-context' }],
    runtimeIdentity: 'node:v24.19.0',
    testContractIdentity: 'c',
    fixtureIdentities: [{ sha256: 'f', path: 'fixture.json' }],
    gateImplementationIdentity: 'g',
  });
  assert.equal(left.material_identity_sha256, right.material_identity_sha256);
});

test('positive 03 - multiple groups are preserved without losing identity', () => {
  const result = evaluate();
  assert.deepEqual(result.required_groups, ['unit', 'contractual', 'security']);
  assert.deepEqual(result.executed_groups, ['unit', 'contractual']);
});

test('positive 04 - deterministic fixture identity remains current', () => {
  const identity = { ...clone(baseIdentity), fixture_identities: [{ path: 'fixture.json', sha256: 'sha256:1' }] };
  identity.material_identity_sha256 = buildMaterialIdentity({
    packageName: identity.package,
    candidateVersion: identity.candidate_version,
    sourceCommit: identity.source_commit,
    manifestIdentity: identity.manifest_identity,
    internalDependencySet: identity.internal_dependency_set,
    runtimeIdentity: identity.runtime_identity,
    testContractIdentity: identity.test_contract_identity,
    fixtureIdentities: identity.fixture_identities,
    gateImplementationIdentity: identity.gate_implementation_identity,
  }).material_identity_sha256;
  const comparison = compareEvidenceIdentity(evidenceFor(identity), identity);
  assert.equal(comparison.current, true);
});

test('positive 05 - corrected failure on a changed material identity may pass', () => {
  const changedIdentity = buildMaterialIdentity({
    packageName: baseIdentity.package,
    candidateVersion: baseIdentity.candidate_version,
    sourceCommit: 'bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb',
    manifestIdentity: baseIdentity.manifest_identity,
    internalDependencySet: [],
    runtimeIdentity: baseIdentity.runtime_identity,
    testContractIdentity: baseIdentity.test_contract_identity,
    fixtureIdentities: [],
    gateImplementationIdentity: baseIdentity.gate_implementation_identity,
  });
  const history = [evidenceFor(baseIdentity, { outcome: 'FAIL' })];
  const result = evaluate({ identity: changedIdentity, history });
  assert.equal(result.outcome, 'PASS');
});

test('positive 06 - conditional group may be NOT_APPLICABLE with a reason', () => {
  const result = evaluate();
  assert.equal(result.outcome, 'PASS');
  assert.deepEqual(result.conditional_not_applicable, ['security']);
});

// 18 negative cases

test('negative 01 - missing contract is rejected', () => {
  assert.deepEqual(validateTestContract(null), ['CONTRACT_NOT_OBJECT']);
});

test('negative 02 - missing runner command is rejected', () => {
  const contract = clone(baseContract);
  contract.runner.command = '';
  assert.ok(validateTestContract(contract).includes('RUNNER_COMMAND_MISSING'));
});

test('negative 03 - zero tests in a required PASS group fail closed', () => {
  const result = clone(baseResult);
  result.groups[0] = groupPass('unit', 0);
  result.outcome = 'FAIL';
  assert.equal(evaluate({ result }).outcome, 'FAIL');
});

test('negative 04 - failed required test returns FAIL', () => {
  const result = clone(baseResult);
  result.groups[0] = groupFail('unit');
  result.outcome = 'FAIL';
  assert.equal(evaluate({ result, processResult: { ...successfulProcess, status: 1 } }).outcome, 'FAIL');
});

test('negative 05 - required group cannot be disabled with NOT_APPLICABLE', () => {
  const result = clone(baseResult);
  result.groups[0] = groupNotApplicable('unit', 'Disabled');
  result.outcome = 'FAIL';
  assert.ok(evaluate({ result }).reasons.includes('REQUIRED_GROUP_NOT_APPLICABLE:unit'));
});

test('negative 06 - missing required group blocks the run', () => {
  const result = clone(baseResult);
  result.groups = result.groups.filter((group) => group.id !== 'contractual');
  result.outcome = 'FAIL';
  assert.equal(evaluate({ result }).outcome, 'BLOCKED');
});

test('negative 07 - timeout is TIMED_OUT and never PASS', () => {
  const result = evaluate({ processResult: { status: null, signal: null, timedOut: true, error: null } });
  assert.equal(result.outcome, 'TIMED_OUT');
});

test('negative 08 - cancellation signal is CANCELLED', () => {
  const result = evaluate({ processResult: { status: null, signal: 'SIGTERM', timedOut: false, error: null } });
  assert.equal(result.outcome, 'CANCELLED');
});

test('negative 09 - runner infrastructure error is BLOCKED', () => {
  const result = evaluate({ processResult: { status: null, signal: null, timedOut: false, error: 'ENOENT' } });
  assert.equal(result.outcome, 'BLOCKED');
});

test('negative 10 - evidence from another commit becomes stale', () => {
  const current = { ...clone(baseIdentity), source_commit: 'different' };
  current.material_identity_sha256 = 'sha256:different';
  const comparison = compareEvidenceIdentity(evidenceFor(), current);
  assert.equal(comparison.current, false);
  assert.ok(comparison.changed_fields.includes('source_commit'));
});

test('negative 11 - evidence from another candidate version becomes stale', () => {
  const current = { ...clone(baseIdentity), candidate_version: '2.0.0', material_identity_sha256: 'sha256:different' };
  assert.equal(compareEvidenceIdentity(evidenceFor(), current).current, false);
});

test('negative 12 - changed fixture identity becomes stale', () => {
  const current = { ...clone(baseIdentity), fixture_identities: [{ path: 'x', sha256: 'new' }], material_identity_sha256: 'sha256:new' };
  const comparison = compareEvidenceIdentity(evidenceFor(), current);
  assert.ok(comparison.changed_fields.includes('fixture_identities'));
});

test('negative 13 - changed test contract becomes stale', () => {
  const current = { ...clone(baseIdentity), test_contract_identity: 'sha256:new', material_identity_sha256: 'sha256:new' };
  assert.ok(compareEvidenceIdentity(evidenceFor(), current).changed_fields.includes('test_contract_identity'));
});

test('negative 14 - changed internal dependency set becomes stale', () => {
  const current = {
    ...clone(baseIdentity),
    internal_dependency_set: [{ name: '@vento/os-context', range: '2.0.0', section: 'dependencies' }],
    material_identity_sha256: 'sha256:new',
  };
  assert.ok(compareEvidenceIdentity(evidenceFor(), current).changed_fields.includes('internal_dependency_set'));
});

test('negative 15 - incomplete evidence is rejected', () => {
  const evidence = evidenceFor();
  delete evidence.source_commit;
  assert.ok(validateEvidence(evidence).includes('EVIDENCE_FIELD_MISSING:source_commit'));
});

test('negative 16 - manually reported PASS cannot hide zero tests', () => {
  const result = clone(baseResult);
  result.groups[0] = groupPass('unit', 0);
  result.outcome = 'PASS';
  const evaluated = evaluate({ result });
  assert.equal(evaluated.outcome, 'FAIL');
  assert.ok(evaluated.reasons.some((reason) => reason.startsWith('MACHINE_OUTCOME_MISMATCH')));
});

test('negative 17 - same-input retry after a failure is treated as flaky', () => {
  const history = [evidenceFor(baseIdentity, { outcome: 'FAIL' })];
  const result = evaluate({ history });
  assert.equal(result.outcome, 'BLOCKED');
  assert.ok(result.reasons.includes('FLAKY_SAME_INPUTS_PREVIOUSLY_NONPASS'));
});

test('negative 18 - package outside the canonical universe is rejected', () => {
  const contract = clone(baseContract);
  contract.package = '@vento/unknown';
  assert.ok(validateTestContract(contract).includes('PACKAGE_NOT_CANONICAL'));
});

// 15 global-gate regression cases

test('regression 01 - zero-test false green remains blocked by FAIL', () => {
  const result = clone(baseResult);
  result.groups[1] = groupPass('contractual', 0);
  result.outcome = 'PASS';
  assert.equal(evaluate({ result }).outcome, 'FAIL');
});

test('regression 02 - nonexistent runner declaration cannot certify the gate', () => {
  const contract = clone(baseContract);
  delete contract.runner.command;
  assert.equal(evaluate({ contract }).outcome, 'BLOCKED');
});

test('regression 03 - nonzero process exit cannot be ignored by machine PASS', () => {
  const result = evaluate({ processResult: { ...successfulProcess, status: 9 } });
  assert.equal(result.outcome, 'FAIL');
  assert.ok(result.reasons.includes('PROCESS_EXIT_NONZERO_WITH_PASS:9'));
});

test('regression 04 - required disabled test cannot become PASS', () => {
  const result = clone(baseResult);
  result.groups[1] = groupNotApplicable('contractual', 'Temporarily disabled');
  result.outcome = 'PASS';
  assert.equal(evaluate({ result }).outcome, 'FAIL');
});

test('regression 05 - stale material identity is not considered current', () => {
  const evidence = evidenceFor();
  const current = { ...clone(baseIdentity), gate_implementation_identity: 'sha256:new', material_identity_sha256: 'sha256:new' };
  assert.equal(compareEvidenceIdentity(evidence, current).current, false);
});

test('regression 06 - evidence tied to another commit cannot be reused', () => {
  const current = { ...clone(baseIdentity), source_commit: 'cccc', material_identity_sha256: 'sha256:new' };
  assert.equal(compareEvidenceIdentity(evidenceFor(), current).reason, 'MATERIAL_IDENTITY_CHANGED');
});

test('regression 07 - fixture mutation is part of invalidation', () => {
  const current = { ...clone(baseIdentity), fixture_identities: [{ path: 'f', sha256: 'changed' }], material_identity_sha256: 'sha256:new' };
  assert.ok(compareEvidenceIdentity(evidenceFor(), current).changed_fields.includes('fixture_identities'));
});

test('regression 08 - retry cannot hide same-input intermittency', () => {
  assert.equal(detectFlakyHistory([evidenceFor(baseIdentity, { outcome: 'FAIL' })], baseIdentity.material_identity_sha256, 'PASS'), true);
});

test('regression 09 - NOT_APPLICABLE is forbidden for universal required groups', () => {
  const result = clone(baseResult);
  result.groups[0] = groupNotApplicable('unit', 'Not applicable');
  result.outcome = 'FAIL';
  assert.ok(evaluate({ result }).reasons.includes('REQUIRED_GROUP_NOT_APPLICABLE:unit'));
});

test('regression 10 - unknown package cannot obtain a canonical contract', () => {
  const contract = clone(baseContract);
  contract.package = '@other/package';
  assert.ok(validateTestContract(contract).includes('PACKAGE_NOT_CANONICAL'));
});

test('regression 11 - evidence missing machine identity is invalid', () => {
  const evidence = evidenceFor();
  delete evidence.material_identity_sha256;
  assert.ok(validateEvidence(evidence).includes('EVIDENCE_MATERIAL_IDENTITY_MISSING'));
});

test('regression 12 - infrastructure error cannot be converted to success', () => {
  const evaluated = evaluate({
    result: baseResult,
    processResult: { status: null, signal: null, timedOut: false, error: 'EACCES' },
  });
  assert.equal(evaluated.outcome, 'BLOCKED');
});

test('regression 13 - failed history remains visible through attempt numbering', () => {
  const history = [
    evidenceFor(baseIdentity, { run_identity: 'run-1', outcome: 'FAIL' }),
    evidenceFor(baseIdentity, { run_identity: 'run-2', outcome: 'BLOCKED' }),
  ];
  const evaluated = evaluate({
    result: { ...clone(baseResult), outcome: 'FAIL', groups: [groupFail('unit'), groupPass('contractual'), groupNotApplicable('security')] },
    processResult: { ...successfulProcess, status: 1 },
    history,
  });
  assert.equal(evaluated.attempt_number, 3);
});

test('regression 14 - machine outcome cannot diverge from derived gate outcome', () => {
  const result = clone(baseResult);
  result.outcome = 'FAIL';
  const evaluated = evaluate({ result });
  assert.equal(evaluated.outcome, 'FAIL');
  assert.ok(evaluated.reasons.some((reason) => reason.startsWith('MACHINE_OUTCOME_MISMATCH')));
});

test('regression 15 - package-local duplicate gate implementation is detected', () => {
  const root = fs.mkdtempSync(path.join(os.tmpdir(), 'vento-ci001-'));
  try {
    const duplicateDirectory = path.join(root, 'packages', 'contracts', 'quality');
    fs.mkdirSync(duplicateDirectory, { recursive: true });
    fs.writeFileSync(path.join(duplicateDirectory, 'shared-package-test-gate.mjs'), 'export {};\n', 'utf8');
    assert.deepEqual(
      findDuplicateGateImplementations(root),
      ['packages/contracts/quality/shared-package-test-gate.mjs'],
    );
  } finally {
    fs.rmSync(root, { recursive: true, force: true });
  }
});

test('security helper - sensitive diagnostic text is redacted', () => {
  const redacted = redactSensitiveText('token=abc123 Authorization: Bearer secret.value');
  assert.equal(redacted.includes('abc123'), false);
  assert.equal(redacted.includes('secret.value'), false);
});

test('determinism helper - stableStringify orders object keys recursively', () => {
  assert.equal(stableStringify({ b: 1, a: { d: 2, c: 3 } }), '{"a":{"c":3,"d":2},"b":1}');
});