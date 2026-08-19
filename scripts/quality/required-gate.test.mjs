import assert from 'node:assert/strict';
import test from 'node:test';

import {
  CANONICAL_REPOSITORIES,
  REQUIRED_GATE_CONTEXT,
  evaluateRequiredGate,
  validateRequiredGateWorkflow,
  validateVisoLegacyWorkflow,
  verifyProviderEvidence,
} from './required-gate.mjs';

const SHA_A = 'a'.repeat(40);
const SHA_B = 'b'.repeat(40);
const NOW = '2026-08-18T22:30:00.000Z';

function validBranchProtection() {
  return {
    protected: true,
    required_context: REQUIRED_GATE_CONTEXT,
    strict: true,
    enforce_admins: true,
    require_pull_request: true,
    allow_force_pushes: false,
    allow_deletions: false,
    bypass_actor_count: 0,
  };
}

function validCheck(overrides = {}) {
  return {
    check_id: 'npm-test',
    owner: 'SHELL-CI-016',
    classification: 'REQUIRED',
    applicability_reason: 'Prueba universal del repositorio.',
    source_identity: 'sha256:test',
    source_commit: SHA_A,
    result: 'PASS',
    started_at: NOW,
    completed_at: NOW,
    invalidation_reason: null,
    ...overrides,
  };
}

function validTreq(overrides = {}) {
  return {
    required: true,
    affected_treq_ids: [],
    zero_reason: 'El cambio no crea ni modifica requisitos TREQ y conserva la cobertura vigente.',
    validation_result: 'PASS',
    baseline_required: false,
    historical_result: 'NOT_REQUESTED',
    registry_identity: 'sha256:registry',
    baseline_identity: null,
    ...overrides,
  };
}

function validMerge(overrides = {}) {
  return {
    gate_context: 'MERGE',
    repository: 'vento-group-sas/vento-shell',
    source_commit: SHA_A,
    base_commit: SHA_B,
    target_branch: 'main',
    environment: null,
    package_id: null,
    checks: [validCheck()],
    treq: validTreq(),
    branch_protection: validBranchProtection(),
    started_at: NOW,
    completed_at: NOW,
    ...overrides,
  };
}

function validDeploy(overrides = {}) {
  return {
    gate_context: 'DEPLOY',
    repository: 'vento-group-sas/vento-shell',
    source_commit: SHA_A,
    base_commit: SHA_B,
    target_branch: 'main',
    environment: 'production',
    package_id: null,
    checks: [validCheck()],
    treq: validTreq(),
    deploy_provider: {
      verified: true,
      enforces_gate: true,
      source_commit: SHA_A,
      environment: 'production',
    },
    started_at: NOW,
    completed_at: NOW,
    ...overrides,
  };
}

function assertPass(input) {
  const result = evaluateRequiredGate(input);
  assert.equal(result.result, 'PASS', JSON.stringify(result.block_reasons));
  return result;
}

function assertNotPass(input, reasonFragment = null) {
  const result = evaluateRequiredGate(input);
  assert.notEqual(result.result, 'PASS');
  if (reasonFragment) assert.ok(result.block_reasons.some((reason) => reason.includes(reasonFragment)));
  return result;
}

const validWorkflow = `name: VENTO Required Gate
on:
  pull_request:
    branches: [main]
    types: [opened, synchronize, reopened, edited]
  workflow_dispatch:
permissions:
  contents: read
jobs:
  tests:
    runs-on: ubuntu-latest
    steps:
      - run: npm test --silent
  merge-gate:
    name: VENTO Required Gate
    runs-on: ubuntu-latest
    steps:
      - run: echo gate
`;

function providerRecord(repository, overrides = {}) {
  return {
    repository,
    provider: repository === 'vento-group-sas/vento-anima' ? 'EAS' : 'VERCEL',
    project_identity: `project:${repository}`,
    enforcement: repository === 'vento-group-sas/vento-anima'
      ? 'NO_GOVERNED_PRODUCTION_PATH'
      : 'PROTECTED_MAIN',
    production_source_branch: repository === 'vento-group-sas/vento-anima' ? null : 'main',
    deploy_check_identity: null,
    enforces_gate: true,
    verified: true,
    evidence_reference: `evidence:${repository}`,
    ...overrides,
  };
}

function validProviderEvidence() {
  return {
    schema_version: 1,
    repositories: CANONICAL_REPOSITORIES.map((repository) => providerRecord(repository)),
  };
}

// 14 positivos

test('P01 merge de SHELL con prueba y TREQ válidos', () => assertPass(validMerge()));
test('P02 merge de NEXO usa la misma señal lógica', () => assertPass(validMerge({ repository: 'vento-group-sas/vento-nexo' })));
test('P03 otro consumidor conserva la misma interfaz pública', () => assertPass(validMerge({ repository: 'vento-group-sas/vento-fogo' })));
test('P04 control condicional puede quedar NOT_APPLICABLE con razón', () => assertPass(validMerge({ checks: [validCheck(), validCheck({ check_id: 'build', owner: 'CI', classification: 'CONDITIONAL', result: 'NOT_APPLICABLE', applicability_reason: 'El contrato del cambio no exige build en este contexto.' })] })));
test('P05 TREQ afectados no vacíos son aceptables', () => assertPass(validMerge({ treq: validTreq({ affected_treq_ids: ['TREQ-SHELL-005'], zero_reason: null }) })));
test('P06 cero TREQ explícito con razón suficiente es aceptable', () => assertPass(validMerge()));
test('P07 baseline histórica PASS es aceptable', () => assertPass(validMerge({ treq: validTreq({ baseline_required: true, historical_result: 'PASS', baseline_identity: 'sha256:baseline' }) })));
test('P08 múltiples checks REQUIRED en PASS', () => assertPass(validMerge({ checks: [validCheck(), validCheck({ check_id: 'treq', owner: 'SHELL-CI-017' })] })));
test('P09 package_id puede acompañar un gate válido', () => assertPass(validMerge({ package_id: 'GAP-PKG-001' })));
test('P10 deploy producción con provider verificado', () => assertPass(validDeploy()));
test('P11 deploy staging con provider verificado', () => assertPass(validDeploy({ environment: 'staging', deploy_provider: { verified: true, enforces_gate: true, source_commit: SHA_A, environment: 'staging' } })));
test('P12 rerun del mismo SHA y conjunto sigue siendo elegible', () => { const a = assertPass(validMerge()); const b = assertPass(validMerge()); assert.equal(a.required_check_set_identity, b.required_check_set_identity); });
test('P13 timestamps explícitos producen evidencia completa', () => { const result = assertPass(validMerge()); assert.equal(result.started_at, NOW); assert.equal(result.completed_at, NOW); });
test('P14 evidencia provider completa para ocho repositorios', () => assert.equal(verifyProviderEvidence(validProviderEvidence()).result, 'PASS'));

// 28 negativos

test('N01 repositorio no gobernado bloquea', () => assertNotPass(validMerge({ repository: 'vento-group-sas/otro' }), 'REPOSITORY_NOT_GOVERNED'));
test('N02 contexto inválido bloquea', () => assertNotPass(validMerge({ gate_context: 'PREVIEW' }), 'GATE_CONTEXT_INVALID'));
test('N03 SHA inválido bloquea', () => assertNotPass(validMerge({ source_commit: 'abc' }), 'SOURCE_COMMIT_INVALID'));
test('N04 base SHA inválida bloquea', () => assertNotPass(validMerge({ base_commit: 'xyz' }), 'BASE_COMMIT_INVALID'));
test('N05 rama objetivo distinta de main bloquea merge', () => assertNotPass(validMerge({ target_branch: 'preview' }), 'TARGET_BRANCH_NOT_GOVERNED'));
test('N06 rama sin protección bloquea', () => assertNotPass(validMerge({ branch_protection: { ...validBranchProtection(), protected: false } }), 'BRANCH_NOT_PROTECTED'));
test('N07 required context distinto bloquea', () => assertNotPass(validMerge({ branch_protection: { ...validBranchProtection(), required_context: 'otro' } }), 'REQUIRED_CONTEXT_MISMATCH'));
test('N08 status checks no estrictos bloquean', () => assertNotPass(validMerge({ branch_protection: { ...validBranchProtection(), strict: false } }), 'STRICT_STATUS_CHECKS_DISABLED'));
test('N09 admins no gobernados bloquean', () => assertNotPass(validMerge({ branch_protection: { ...validBranchProtection(), enforce_admins: false } }), 'ADMIN_ENFORCEMENT_DISABLED'));
test('N10 PR no requerido bloquea', () => assertNotPass(validMerge({ branch_protection: { ...validBranchProtection(), require_pull_request: false } }), 'PULL_REQUEST_NOT_REQUIRED'));
test('N11 force push permitido bloquea', () => assertNotPass(validMerge({ branch_protection: { ...validBranchProtection(), allow_force_pushes: true } }), 'FORCE_PUSH_ALLOWED'));
test('N12 borrado de main permitido bloquea', () => assertNotPass(validMerge({ branch_protection: { ...validBranchProtection(), allow_deletions: true } }), 'BRANCH_DELETION_ALLOWED'));
test('N13 actores de bypass bloquean', () => assertNotPass(validMerge({ branch_protection: { ...validBranchProtection(), bypass_actor_count: 1 } }), 'BYPASS_ACTORS_PRESENT'));
test('N14 conjunto de checks vacío bloquea', () => assertNotPass(validMerge({ checks: [] }), 'REQUIRED_CHECK_SET_EMPTY'));
test('N15 clasificación de check desconocida bloquea', () => assertNotPass(validMerge({ checks: [validCheck({ classification: 'OPTIONAL' })] }), 'CHECK_CLASSIFICATION_INVALID'));
test('N16 check REQUIRED en FAIL bloquea', () => assertNotPass(validMerge({ checks: [validCheck({ result: 'FAIL' })] }), 'CHECK_NOT_PASS'));
test('N17 check cancelado no es PASS', () => assert.equal(assertNotPass(validMerge({ checks: [validCheck({ result: 'CANCELLED' })] })).result, 'CANCELLED'));
test('N18 timeout no es PASS', () => assert.equal(assertNotPass(validMerge({ checks: [validCheck({ result: 'TIMED_OUT' })] })).result, 'TIMED_OUT'));
test('N19 check de otro commit queda STALE', () => assert.equal(assertNotPass(validMerge({ checks: [validCheck({ source_commit: SHA_B })] })).result, 'STALE'));
test('N20 NOT_APPLICABLE sin razón suficiente bloquea', () => assertNotPass(validMerge({ checks: [validCheck({ classification: 'NOT_APPLICABLE', result: 'NOT_APPLICABLE', applicability_reason: '' })] }), 'NOT_APPLICABLE_REASON_MISSING'));
test('N21 declaración TREQ ausente bloquea', () => assertNotPass(validMerge({ treq: { ...validTreq(), affected_treq_ids: null } }), 'TREQ_DECLARATION_MISSING'));
test('N22 TREQ duplicado bloquea', () => assertNotPass(validMerge({ treq: validTreq({ affected_treq_ids: ['TREQ-SHELL-005', 'TREQ-SHELL-005'], zero_reason: null }) }), 'TREQ_DECLARATION_DUPLICATED'));
test('N23 TREQ mal formado bloquea', () => assertNotPass(validMerge({ treq: validTreq({ affected_treq_ids: ['TREQ-x'], zero_reason: null }) }), 'TREQ_DECLARATION_MALFORMED'));
test('N24 cero TREQ sin justificación suficiente bloquea', () => assertNotPass(validMerge({ treq: validTreq({ zero_reason: 'sin cambios' }) }), 'TREQ_ZERO_REASON_INSUFFICIENT'));
test('N25 validación TREQ FAIL bloquea', () => assertNotPass(validMerge({ treq: validTreq({ validation_result: 'FAIL' }) }), 'TREQ_VALIDATION_NOT_PASS'));
test('N26 baseline obligatoria sin PASS bloquea', () => assertNotPass(validMerge({ treq: validTreq({ baseline_required: true, historical_result: 'UNAVAILABLE' }) }), 'TREQ_HISTORICAL_VALIDATION_NOT_PASS'));
test('N27 deploy sin provider bloquea', () => assertNotPass(validDeploy({ deploy_provider: null }), 'DEPLOY_PROVIDER_EVIDENCE_MISSING'));
test('N28 deploy con SHA distinto al provider bloquea', () => assertNotPass(validDeploy({ deploy_provider: { verified: true, enforces_gate: true, source_commit: SHA_B, environment: 'production' } }), 'DEPLOY_PROVIDER_SOURCE_COMMIT_MISMATCH'));

// 18 regresiones

test('R01 workflow canónico no depende de test:ci007', () => assert.equal(validateRequiredGateWorkflow(validWorkflow).some((error) => error.includes('ci007')), false));
test('R02 workflow canónico no depende de test:ci013', () => assert.equal(validateRequiredGateWorkflow(validWorkflow).some((error) => error.includes('ci013')), false));
test('R03 path filter en señal final es rechazado', () => assert.ok(validateRequiredGateWorkflow(validWorkflow.replace('    types:', '    paths:\n      - "src/**"\n    types:')).includes('FINAL_GATE_PATH_FILTER_FORBIDDEN')));
test('R04 pull_request_target es rechazado', () => assert.ok(validateRequiredGateWorkflow(validWorkflow.replace('  pull_request:', '  pull_request_target:')).includes('PULL_REQUEST_TARGET_FORBIDDEN')));
test('R05 contents write es rechazado', () => assert.ok(validateRequiredGateWorkflow(validWorkflow.replace('contents: read', 'contents: write')).includes('CONTENTS_WRITE_FORBIDDEN')));
test('R06 continue-on-error true es rechazado', () => assert.ok(validateRequiredGateWorkflow(`${validWorkflow}\n# x\ncontinue-on-error: true\n`).includes('CONTINUE_ON_ERROR_FORBIDDEN')));
test('R07 neutralización || true es rechazada', () => assert.ok(validateRequiredGateWorkflow(validWorkflow.replace('echo gate', 'npm test || true')).includes('FAILURE_NEUTRALIZATION_FORBIDDEN')));
test('R08 git push desde el gate es rechazado', () => assert.ok(validateRequiredGateWorkflow(validWorkflow.replace('echo gate', 'git push origin main')).includes('GIT_PUSH_FORBIDDEN')));
test('R09 auto merge desde el gate es rechazado', () => assert.ok(validateRequiredGateWorkflow(validWorkflow.replace('echo gate', 'gh pr merge --auto')).includes('AUTO_MERGE_FORBIDDEN')));
test('R10 deploy productivo desde el gate es rechazado', () => assert.ok(validateRequiredGateWorkflow(validWorkflow.replace('echo gate', 'vercel --prod')).includes('DEPLOY_MUTATION_FORBIDDEN')));
test('R11 Expo Web no puede certificar ANIMA', () => assert.ok(validateRequiredGateWorkflow(validWorkflow.replace('echo gate', 'expo start --web'), 'vento-group-sas/vento-anima').includes('ANIMA_WEB_SURROGATE_FORBIDDEN')));
test('R12 VISO no puede conservar contents write', () => assert.ok(validateVisoLegacyWorkflow('permissions:\n  contents: write\n').includes('VISO_CONTENTS_WRITE_REMAINS')));
test('R13 VISO no puede conservar git push a main', () => assert.ok(validateVisoLegacyWorkflow('run: git push origin HEAD:main\n').includes('VISO_DIRECT_PUSH_REMAINS')));
test('R14 evidencia provider duplicada es rechazada', () => { const e = validProviderEvidence(); e.repositories[7] = { ...e.repositories[6] }; assert.equal(verifyProviderEvidence(e).result, 'BLOCKED'); });
test('R15 provider PROTECTED_MAIN debe usar main', () => { const e = validProviderEvidence(); e.repositories[0].production_source_branch = 'preview'; assert.equal(verifyProviderEvidence(e).result, 'BLOCKED'); });
test('R16 provider check debe usar VENTO Deploy Gate', () => { const e = validProviderEvidence(); e.repositories[0] = providerRecord(e.repositories[0].repository, { enforcement: 'PROVIDER_CHECK', deploy_check_identity: 'otro' }); assert.equal(verifyProviderEvidence(e).result, 'BLOCKED'); });
test('R17 PREVIEW_DIAGNOSTIC no puede pasar como deploy gobernado', () => assertNotPass(validDeploy({ environment: 'PREVIEW_DIAGNOSTIC', deploy_provider: { verified: true, enforces_gate: true, source_commit: SHA_A, environment: 'PREVIEW_DIAGNOSTIC' } }), 'PREVIEW_DIAGNOSTIC_NOT_GOVERNED_DEPLOY'));
test('R18 cambiar el conjunto obligatorio cambia su identidad', () => { const a = assertPass(validMerge()); const b = assertPass(validMerge({ checks: [validCheck(), validCheck({ check_id: 'extra', owner: 'CI' })] })); assert.notEqual(a.required_check_set_identity, b.required_check_set_identity); });
