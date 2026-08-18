import assert from 'node:assert/strict';
import fs from 'node:fs';
import os from 'node:os';
import path from 'node:path';
import test from 'node:test';

import {
  REQUIRED_ROLLBACK_RECORD_FIELDS,
  appendRollbackHistory,
  buildIncidentRollbackPlan,
  comparePreparedPlan,
  planGateRecovery,
  prepareRollbackPlan,
  rollbackIdentity,
  verifyRollbackExecution,
  writeRuntimeEvidence,
} from './repository-rollback-gate.mjs';
import { RELEASE_GATE_INSTANCE_ID } from './shared-package-release-gate.mjs';
import { COMPATIBILITY_GATE_INSTANCE_ID } from './shared-package-compatibility-gate.mjs';
import { CONSUMER_UPDATE_GATE_INSTANCE_ID } from './shared-package-consumer-update-gate.mjs';

const HEX = Object.freeze({
  a: 'a',
  b: 'b',
  c: 'c',
  d: 'd',
  e: 'e',
  f: 'f',
  one: '1',
  two: '2',
  three: '3',
  four: '4',
  five: '5',
  six: '6',
  seven: '7',
  eight: '8',
  nine: '9',
  zero: '0',
});

function sha(key) {
  return `sha256:${HEX[key].repeat(64)}`;
}

function commit(key) {
  return HEX[key].repeat(40);
}

function baselineGate(repository) {
  return {
    'devVentoGroup/vento-nexo': 'SHELL-CI-007::GLOBAL',
    'devVentoGroup/vento-fogo': 'SHELL-CI-008::GLOBAL',
    'devVentoGroup/vento-origo': 'SHELL-CI-009::GLOBAL',
    'devVentoGroup/vento-pulso': 'SHELL-CI-010::GLOBAL',
    'devVentoGroup/vento-viso': 'SHELL-CI-011::GLOBAL',
    'devVentoGroup/vento-numera': 'SHELL-CI-012::GLOBAL',
    'devVentoGroup/vento-anima': 'SHELL-CI-013::GLOBAL',
  }[repository] ?? null;
}

function executionId(repository) {
  return `RB-SYNTH-${repository.split('/').at(-1).toUpperCase()}-001`;
}

function baselineRef(repository, targetCommit, environment) {
  const gate = baselineGate(repository);
  if (!gate) return null;
  return {
    gate_instance: gate,
    consumer_repository: repository,
    consumer_base_commit: targetCommit,
    environment,
    result: 'PASS',
    execution_identity: sha('three'),
    invalidation_reason: null,
  };
}

function baseCodePlan({
  repository = 'devVentoGroup/vento-nexo',
  environment = 'SYNTHETIC_CI014',
} = {}) {
  const fromCommit = commit('a');
  const toCommit = commit('b');
  const fromArtifact = sha('a');
  const toArtifact = sha('b');
  const manifestTarget = sha('d');
  const lockfileTarget = sha('f');
  return {
    schema_version: 1,
    execution_mode: 'SYNTHETIC',
    rollback_execution_id: executionId(repository),
    repository,
    environment,
    trigger: 'FUNCTIONAL_REGRESSION',
    incident_ref: 'INC-SYNTH-CI014-001',
    requested_by: 'SYNTHETIC_REQUESTER',
    approved_by: 'SYNTHETIC_APPROVER',
    source_branch: 'main',
    rollback_from_commit: fromCommit,
    observed_current_commit: fromCommit,
    rollback_from_artifact: fromArtifact,
    rollback_to_commit: toCommit,
    rollback_to_artifact: toArtifact,
    manifest_before_identity: sha('c'),
    manifest_target_identity: manifestTarget,
    lockfile_before_identity: sha('e'),
    lockfile_target_identity: lockfileTarget,
    manifest_target_commit: toCommit,
    lockfile_target_commit: toCommit,
    manifest_lock_consistent: true,
    package_set_before: [],
    package_set_target: [],
    release_refs: [],
    compatibility_refs: [],
    consumer_update_ref: null,
    consumer_baseline_ref: baselineRef(repository, toCommit, environment),
    previous_snapshot_ref: {
      certified: true,
      snapshot_identity: sha('one'),
      repository,
      environment,
      commit: toCommit,
      artifact_identity: toArtifact,
      manifest_identity: manifestTarget,
      lockfile_identity: lockfileTarget,
      invalidation_reason: null,
    },
    target_snapshot: {
      available: true,
      integrity_verified: true,
      supported: true,
      compatible_with_environment: true,
      requires_retired_contract: false,
      requires_simultaneous_rollback: false,
      superseded_by_hotfix: false,
    },
    database_state_ref: {
      schema_identity: sha('four'),
      migration_identity: sha('five'),
      code_target_compatible: true,
      rollback_required: false,
      strategy: 'NONE',
      down_migration_certified: false,
    },
    configuration_before_identity: sha('six'),
    configuration_target_identity: sha('six'),
    configuration_target_versioned: true,
    configuration_target_environment: environment,
    cache_strategy: {
      mode: 'NOT_APPLICABLE',
      current: true,
    },
    secret_strategy: {
      mode: 'KEEP_CURRENT',
      restores_revoked: false,
      exposes_values: false,
    },
    data_impact: {
      preserves_valid_data: true,
      preserves_audit: true,
      snapshot_restore: false,
      invalid_data_present: false,
      reconciliation_owner: 'NONE',
    },
    supabase_impact: {
      mutation_required: false,
      ci014_executes_mutation: false,
      owner_repository: 'devVentoGroup/vento-shell',
      owner_task: 'AUTH-DB-029',
      approved_plan_identity: null,
    },
    required_validation_set: [
      { id: 'IDENTITY', kind: 'CHECK', required: true },
      { id: 'POST_ROLLBACK_TESTS', kind: 'TEST', required: true },
    ],
    rollback_classes: ['REPOSITORY_CODE'],
    planned_actions: ['DEPLOY_IMMUTABLE_ARTIFACT'],
    security_assessment: {
      target_supported: true,
      known_vulnerability: false,
      restores_authorization_bypass: false,
      restores_insecure_grants: false,
    },
    authorization_ref: {
      decision: 'APPROVED',
      scope: 'SYNTHETIC_SELF_CERTIFICATION',
      evidence_identity: sha('seven'),
    },
    concurrent_change_ref: null,
    synthetic_fixture_uses_production_data: false,
    depends_on: [],
  };
}

function basePackagePlan(options = {}) {
  const input = baseCodePlan(options);
  input.rollback_classes = ['PACKAGE_ADOPTION', 'CONTRACT_COMPATIBILITY'];
  input.planned_actions = ['RESTORE_EXACT_PACKAGE_SET_VIA_REVIEWED_PR'];
  input.package_set_before = [
    { package_name: '@vento/contracts', version: '1.1.0' },
  ];
  input.package_set_target = [
    { package_name: '@vento/contracts', version: '1.0.0' },
  ];
  input.release_refs = [
    {
      gate_instance: RELEASE_GATE_INSTANCE_ID,
      package_name: '@vento/contracts',
      version: '1.0.0',
      result: 'PASS',
      immutable: true,
      release_evidence_identity: sha('eight'),
      invalidation_reason: null,
    },
  ];
  input.compatibility_refs = [
    {
      gate_instance: COMPATIBILITY_GATE_INSTANCE_ID,
      package_name: '@vento/contracts',
      consumer_repository: input.repository.split('/').at(-1),
      environment: input.environment,
      result: 'PASS',
      relation_state: 'COMPATIBLE',
      compatibility_evidence_identity: sha('nine'),
      invalidation_reason: null,
    },
  ];
  input.consumer_update_ref = {
    gate_instance: CONSUMER_UPDATE_GATE_INSTANCE_ID,
    consumer_repository: input.repository.split('/').at(-1),
    update_class: 'ROLLBACK_UPDATE',
    result: 'PASS',
    rollback_ref: sha('one'),
    proposal_identity: sha('two'),
    invalidation_reason: null,
  };
  return input;
}

function baseConfigurationPlan() {
  const input = baseCodePlan();
  input.rollback_classes = ['CONFIGURATION'];
  input.planned_actions = ['RESTORE_VERSIONED_CONFIGURATION'];
  input.configuration_before_identity = sha('six');
  input.configuration_target_identity = sha('seven');
  input.configuration_target_versioned = true;
  return input;
}

function baseCachePlan() {
  const input = baseCodePlan();
  input.rollback_classes = ['CACHE'];
  input.planned_actions = ['INVALIDATE_CACHE', 'REBUILD_CACHE'];
  input.cache_strategy = {
    mode: 'REBUILD_FROM_AUTHORITY',
    current: true,
  };
  return input;
}

function baseDatabasePlan() {
  const input = baseCodePlan();
  input.rollback_classes = ['DATABASE_DEPENDENCY'];
  input.planned_actions = ['DELEGATE_DATABASE_CHANGE_TO_AUTH_DB_029'];
  input.database_state_ref = {
    schema_identity: sha('four'),
    migration_identity: sha('five'),
    code_target_compatible: false,
    rollback_required: true,
    strategy: 'FORWARD_FIX',
    down_migration_certified: false,
  };
  input.supabase_impact = {
    mutation_required: true,
    ci014_executes_mutation: false,
    owner_repository: 'devVentoGroup/vento-shell',
    owner_task: 'AUTH-DB-029',
    approved_plan_identity: sha('six'),
  };
  return input;
}

function baseVerification(prepared) {
  return {
    rollback_execution_id: prepared.record.rollback_execution_id,
    repository: prepared.record.repository,
    environment: prepared.record.environment,
    source_commit_before_execution: prepared.record.rollback_from_commit,
    concurrent_change_ref: null,
    mutation_result: 'APPLIED',
    final_commit: prepared.record.rollback_to_commit,
    final_artifact: prepared.record.rollback_to_artifact,
    validation_results: prepared.record.required_validation_set.map((entry) => ({
      id: entry.id,
      status: 'PASS',
      executed_count: entry.kind === 'TEST' ? 3 : 1,
    })),
    reconciliation_pending: false,
    critical_regression_detected: false,
    incident_condition_persists: false,
    data_preserved: true,
    audit_preserved: true,
    configuration_verified: true,
    cache_verified: true,
    database_owner_evidence: prepared.record.supabase_impact?.mutation_required
      ? {
        owner_repository: 'devVentoGroup/vento-shell',
        owner_task: 'AUTH-DB-029',
        result: 'PASS',
        evidence_identity: sha('zero'),
      }
      : null,
    retry_count: 0,
    retry_diagnostic_ref: null,
    reported_result: 'PASS',
    execution_started_at: '2026-08-18T14:30:00-05:00',
    execution_completed_at: '2026-08-18T14:31:00-05:00',
  };
}

function assertBlocked(input, expectedReason) {
  const result = prepareRollbackPlan(input);
  assert.equal(result.result, 'BLOCKED');
  assert.ok(
    result.reasons.some((reason) => reason === expectedReason || reason.startsWith(`${expectedReason}:`)),
    `Expected ${expectedReason}; received ${result.reasons.join(', ')}`,
  );
}

const POSITIVE_CASES = [
  {
    name: 'P01 rollback de código a artefacto anterior compatible',
    run() {
      const result = prepareRollbackPlan(baseCodePlan());
      assert.equal(result.result, 'PASS');
      assert.equal(result.record.result, 'PENDING');
    },
  },
  {
    name: 'P02 rollback de adopción restaura package set exacto',
    run() {
      const result = prepareRollbackPlan(basePackagePlan());
      assert.equal(result.result, 'PASS');
      assert.deepEqual(result.record.package_set_target, [
        { package_name: '@vento/contracts', version: '1.0.0' },
      ]);
    },
  },
  {
    name: 'P03 rollback de configuración versionada sin secretos',
    run() {
      const result = prepareRollbackPlan(baseConfigurationPlan());
      assert.equal(result.result, 'PASS');
    },
  },
  {
    name: 'P04 invalidación y reconstrucción segura de caché',
    run() {
      const prepared = prepareRollbackPlan(baseCachePlan());
      assert.equal(prepared.result, 'PASS');
      const verified = verifyRollbackExecution(prepared, baseVerification(prepared));
      assert.equal(verified.result, 'PASS');
    },
  },
  {
    name: 'P05 preservación de datos válidos y auditoría',
    run() {
      const prepared = prepareRollbackPlan(baseCodePlan());
      const verified = verifyRollbackExecution(prepared, baseVerification(prepared));
      assert.equal(verified.result, 'PASS');
      assert.equal(verified.record.post_rollback_verification.data_preserved, true);
      assert.equal(verified.record.post_rollback_verification.audit_preserved, true);
    },
  },
  {
    name: 'P06 dos repositorios forman unidades independientes',
    run() {
      const first = prepareRollbackPlan(baseCodePlan());
      const second = prepareRollbackPlan(baseCodePlan({
        repository: 'devVentoGroup/vento-fogo',
      }));
      const incident = buildIncidentRollbackPlan([first, second]);
      assert.equal(incident.result, 'PASS');
      assert.equal(incident.units.length, 2);
    },
  },
  {
    name: 'P07 version skew soportado por compatibilidad vigente',
    run() {
      const result = prepareRollbackPlan(basePackagePlan());
      assert.equal(result.result, 'PASS');
      assert.equal(result.record.compatibility_refs[0].relation_state, 'COMPATIBLE');
    },
  },
  {
    name: 'P08 cambio Supabase no propietario queda bloqueado antes de ejecutar',
    run() {
      const input = baseDatabasePlan();
      input.supabase_impact.owner_repository = 'devVentoGroup/vento-nexo';
      assertBlocked(input, 'SUPABASE_OWNER_REPOSITORY_INVALID');
    },
  },
  {
    name: 'P09 dependencia de base de datos delegada a AUTH-DB-029',
    run() {
      const result = prepareRollbackPlan(baseDatabasePlan());
      assert.equal(result.result, 'PASS');
      assert.equal(result.record.supabase_impact.owner_task, 'AUTH-DB-029');
      assert.equal(result.record.supabase_impact.ci014_executes_mutation, false);
    },
  },
  {
    name: 'P10 verificación repetida es determinista y no duplica mutación',
    run() {
      const prepared = prepareRollbackPlan(baseCodePlan());
      const observation = baseVerification(prepared);
      const first = verifyRollbackExecution(prepared, observation);
      const second = verifyRollbackExecution(prepared, observation);
      assert.equal(first.result, 'PASS');
      assert.equal(second.result, 'PASS');
      assert.equal(first.verification_identity, second.verification_identity);
    },
  },
  {
    name: 'P11 evidencia machine-readable contiene origen y destino completos',
    run() {
      const prepared = prepareRollbackPlan(baseCodePlan());
      assert.deepEqual(
        REQUIRED_ROLLBACK_RECORD_FIELDS.filter(
          (field) => !Object.hasOwn(prepared.record, field),
        ),
        [],
      );
      const temporaryRoot = fs.mkdtempSync(path.join(os.tmpdir(), 'ci014-'));
      try {
        const evidencePath = writeRuntimeEvidence(prepared, {
          evidenceRoot: temporaryRoot,
        });
        assert.equal(fs.existsSync(evidencePath), true);
        const stored = JSON.parse(fs.readFileSync(evidencePath, 'utf8'));
        assert.equal(stored.plan_identity, prepared.plan_identity);
      } finally {
        fs.rmSync(temporaryRoot, { recursive: true, force: true });
      }
    },
  },
  {
    name: 'P12 recuperación del gate conserva intentos anteriores',
    run() {
      const previousIdentity = sha('nine');
      const history = [
        { verification_identity: sha('eight'), result: 'FAIL' },
        {
          gate_implementation_identity: previousIdentity,
          result: 'PASS',
          certified: true,
        },
      ];
      const recovery = planGateRecovery({
        current_implementation_identity: sha('a'),
        previous_certified_identity: previousIdentity,
        history,
      });
      assert.equal(recovery.result, 'PASS');
      assert.equal(recovery.history.length, 2);
    },
  },
];

const NEGATIVE_CASES = [
  {
    name: 'N01 repositorio desconocido',
    run() {
      const input = baseCodePlan();
      input.repository = 'devVentoGroup/vento-desconocido';
      assertBlocked(input, 'REPOSITORY_NOT_CANONICAL');
    },
  },
  {
    name: 'N02 ambiente desconocido',
    run() {
      const input = baseCodePlan();
      input.environment = '';
      assertBlocked(input, 'ENVIRONMENT_MISSING');
    },
  },
  {
    name: 'N03 commit origen no coincide con desplegado',
    run() {
      const input = baseCodePlan();
      input.observed_current_commit = commit('c');
      assertBlocked(input, 'SOURCE_COMMIT_STALE');
    },
  },
  {
    name: 'N04 objetivo inexistente',
    run() {
      const input = baseCodePlan();
      input.target_snapshot.available = false;
      assertBlocked(input, 'TARGET_NOT_AVAILABLE');
    },
  },
  {
    name: 'N05 artefacto sin integridad verificada',
    run() {
      const input = baseCodePlan();
      input.target_snapshot.integrity_verified = false;
      assertBlocked(input, 'TARGET_INTEGRITY_NOT_VERIFIED');
    },
  },
  {
    name: 'N06 manifest y lockfile inconsistentes',
    run() {
      const input = basePackagePlan();
      input.manifest_lock_consistent = false;
      assertBlocked(input, 'MANIFEST_LOCKFILE_INCONSISTENT');
    },
  },
  {
    name: 'N07 package anterior incompatible',
    run() {
      const input = basePackagePlan();
      input.compatibility_refs[0].result = 'FAIL';
      input.compatibility_refs[0].relation_state = 'INCOMPATIBLE';
      assertBlocked(input, 'COMPATIBILITY_REF_NOT_PASS');
    },
  },
  {
    name: 'N08 target exige contrato retirado',
    run() {
      const input = baseCodePlan();
      input.target_snapshot.requires_retired_contract = true;
      assertBlocked(input, 'TARGET_REQUIRES_RETIRED_CONTRACT');
    },
  },
  {
    name: 'N09 target exige rollback simultáneo no aprobado',
    run() {
      const input = baseCodePlan();
      input.target_snapshot.requires_simultaneous_rollback = true;
      assertBlocked(input, 'TARGET_REQUIRES_SIMULTANEOUS_ROLLBACK');
    },
  },
  {
    name: 'N10 ausencia de snapshot previo certificado',
    run() {
      const input = baseCodePlan();
      input.previous_snapshot_ref = null;
      assertBlocked(input, 'PREVIOUS_SNAPSHOT_MISSING');
    },
  },
  {
    name: 'N11 intento de force push',
    run() {
      const input = baseCodePlan();
      input.planned_actions = ['FORCE_PUSH'];
      assertBlocked(input, 'FORBIDDEN_ACTION');
    },
  },
  {
    name: 'N12 intento de mover tag histórico',
    run() {
      const input = baseCodePlan();
      input.planned_actions = ['MOVE_HISTORICAL_TAG'];
      assertBlocked(input, 'FORBIDDEN_ACTION');
    },
  },
  {
    name: 'N13 intento de unpublish para simular rollback',
    run() {
      const input = basePackagePlan();
      input.planned_actions = ['UNPUBLISH_RELEASE'];
      assertBlocked(input, 'FORBIDDEN_ACTION');
    },
  },
  {
    name: 'N14 restauración de bypass de autorización',
    run() {
      const input = baseCodePlan();
      input.security_assessment.restores_authorization_bypass = true;
      assertBlocked(input, 'AUTHORIZATION_BYPASS_RESTORE_FORBIDDEN');
    },
  },
  {
    name: 'N15 restauración de secreto revocado',
    run() {
      const input = baseCodePlan();
      input.secret_strategy.restores_revoked = true;
      assertBlocked(input, 'SECRET_REVOKED_RESTORE_FORBIDDEN');
    },
  },
  {
    name: 'N16 configuración target no versionada',
    run() {
      const input = baseConfigurationPlan();
      input.configuration_target_versioned = false;
      assertBlocked(input, 'CONFIGURATION_TARGET_NOT_VERSIONED');
    },
  },
  {
    name: 'N17 caché antigua usada como autoridad',
    run() {
      const input = baseCachePlan();
      input.cache_strategy = {
        mode: 'RESTORE_VERSIONED_NON_AUTHORITATIVE_SNAPSHOT',
        current: true,
        versioned: true,
        immutable: true,
        non_authoritative: false,
        compatible: true,
      };
      assertBlocked(input, 'CACHE_SNAPSHOT_IS_AUTHORITATIVE');
    },
  },
  {
    name: 'N18 down migration no certificada',
    run() {
      const input = baseDatabasePlan();
      input.database_state_ref.strategy = 'DOWN_MIGRATION';
      input.database_state_ref.down_migration_certified = false;
      assertBlocked(input, 'DOWN_MIGRATION_NOT_CERTIFIED');
    },
  },
  {
    name: 'N19 rollback Supabase desde consumidor',
    run() {
      const input = baseDatabasePlan();
      input.supabase_impact.owner_repository = 'devVentoGroup/vento-nexo';
      assertBlocked(input, 'SUPABASE_OWNER_REPOSITORY_INVALID');
    },
  },
  {
    name: 'N20 restauración snapshot pierde datos válidos',
    run() {
      const input = baseCodePlan();
      input.data_impact.snapshot_restore = true;
      input.data_impact.preserves_valid_data = false;
      assertBlocked(input, 'VALID_DATA_PRESERVATION_NOT_PROVEN');
    },
  },
  {
    name: 'N21 evidencia de otro ambiente',
    run() {
      const input = basePackagePlan();
      input.compatibility_refs[0].environment = 'SYNTHETIC_OTHER';
      assertBlocked(input, 'COMPATIBILITY_REF_ENVIRONMENT_MISMATCH');
    },
  },
  {
    name: 'N22 pruebas posteriores inexistentes',
    run() {
      const prepared = prepareRollbackPlan(baseCodePlan());
      const observation = baseVerification(prepared);
      observation.validation_results = [];
      const verified = verifyRollbackExecution(prepared, observation);
      assert.equal(verified.result, 'FAIL');
      assert.ok(verified.reasons.some((reason) => reason.startsWith('REQUIRED_VALIDATION_MISSING')));
    },
  },
  {
    name: 'N23 cero pruebas con comprobaciones obligatorias',
    run() {
      const input = baseCodePlan();
      input.required_validation_set = [];
      assertBlocked(input, 'VALIDATION_SET_EMPTY');
    },
  },
  {
    name: 'N24 mutación concurrente invalida plan',
    run() {
      const input = baseCodePlan();
      input.concurrent_change_ref = 'DEPLOY-CONCURRENT-001';
      assertBlocked(input, 'CONCURRENT_CHANGE_PRESENT');
    },
  },
  {
    name: 'N25 hotfix posterior no incorporado',
    run() {
      const input = baseCodePlan();
      input.target_snapshot.superseded_by_hotfix = true;
      assertBlocked(input, 'TARGET_SUPERSEDED_BY_HOTFIX');
    },
  },
  {
    name: 'N26 evidencia baseline stale',
    run() {
      const input = baseCodePlan();
      input.consumer_baseline_ref.invalidation_reason = 'COMMIT_CHANGED';
      assertBlocked(input, 'CONSUMER_BASELINE_STALE');
    },
  },
  {
    name: 'N27 fallo parcial presentado como éxito',
    run() {
      const prepared = prepareRollbackPlan(baseCodePlan());
      const observation = baseVerification(prepared);
      observation.mutation_result = 'PARTIAL';
      observation.reported_result = 'PASS';
      const verified = verifyRollbackExecution(prepared, observation);
      assert.equal(verified.result, 'FAIL');
      assert.ok(verified.reasons.includes('PARTIAL_MUTATION'));
      assert.ok(verified.reasons.includes('REPORTED_PASS_CONTRADICTS_OBSERVATION'));
    },
  },
  {
    name: 'N28 target vulnerable conocido',
    run() {
      const input = baseCodePlan();
      input.security_assessment.known_vulnerability = true;
      assertBlocked(input, 'TARGET_KNOWN_VULNERABLE');
    },
  },
];

const REGRESSION_CASES = [
  {
    name: 'R01 comparación de commits sola no concede elegibilidad',
    run() {
      const result = prepareRollbackPlan({
        schema_version: 1,
        execution_mode: 'SYNTHETIC',
        repository: 'devVentoGroup/vento-nexo',
        environment: 'SYNTHETIC_CI014',
        rollback_from_commit: commit('a'),
        rollback_to_commit: commit('b'),
        observed_current_commit: commit('a'),
      });
      assert.equal(result.result, 'BLOCKED');
      assert.ok(result.reasons.includes('PREVIOUS_SNAPSHOT_MISSING'));
    },
  },
  {
    name: 'R02 SemVer sin package identity no es target',
    run() {
      const input = basePackagePlan();
      input.package_set_target = [{ package_name: '', version: '1.0.0' }];
      assertBlocked(input, 'PACKAGE_SET_TARGET_PACKAGE_NOT_CANONICAL');
    },
  },
  {
    name: 'R03 branch sin commit target queda bloqueada',
    run() {
      const input = baseCodePlan();
      input.rollback_to_commit = null;
      assertBlocked(input, 'ROLLBACK_TO_COMMIT_INVALID');
    },
  },
  {
    name: 'R04 manifest sin lockfile queda bloqueado',
    run() {
      const input = basePackagePlan();
      input.lockfile_target_identity = null;
      assertBlocked(input, 'LOCKFILE_TARGET_IDENTITY_INVALID');
    },
  },
  {
    name: 'R05 lockfile de otro commit queda bloqueado',
    run() {
      const input = basePackagePlan();
      input.lockfile_target_commit = commit('c');
      assertBlocked(input, 'LOCKFILE_TARGET_COMMIT_MISMATCH');
    },
  },
  {
    name: 'R06 compatibilidad de otro consumidor no satisface unidad',
    run() {
      const input = basePackagePlan();
      input.compatibility_refs[0].consumer_repository = 'vento-fogo';
      assertBlocked(input, 'COMPATIBILITY_REF_MISSING');
    },
  },
  {
    name: 'R07 baseline de otro consumidor no satisface unidad',
    run() {
      const input = baseCodePlan();
      input.consumer_baseline_ref.consumer_repository = 'devVentoGroup/vento-fogo';
      assertBlocked(input, 'CONSUMER_BASELINE_REPOSITORY_MISMATCH');
    },
  },
  {
    name: 'R08 ambientes mezclados quedan bloqueados',
    run() {
      const input = baseCodePlan();
      input.consumer_baseline_ref.environment = 'SYNTHETIC_OTHER';
      assertBlocked(input, 'CONSUMER_BASELINE_ENVIRONMENT_MISMATCH');
    },
  },
  {
    name: 'R09 configuración de otro ambiente queda bloqueada',
    run() {
      const input = baseConfigurationPlan();
      input.configuration_target_environment = 'SYNTHETIC_OTHER';
      assertBlocked(input, 'CONFIGURATION_TARGET_ENVIRONMENT_MISMATCH');
    },
  },
  {
    name: 'R10 caché stale queda bloqueada',
    run() {
      const input = baseCachePlan();
      input.cache_strategy.current = false;
      assertBlocked(input, 'CACHE_EVIDENCE_STALE');
    },
  },
  {
    name: 'R11 secretos en evidencia son rechazados',
    run() {
      const input = baseCodePlan();
      input.diagnostic = { api_key: 'SYNTHETIC_FIXTURE_VALUE' };
      assertBlocked(input, 'SENSITIVE_DATA');
    },
  },
  {
    name: 'R12 datos productivos no pueden ser fixture sintético',
    run() {
      const input = baseCodePlan();
      input.synthetic_fixture_uses_production_data = true;
      assertBlocked(input, 'PRODUCTION_DATA_FIXTURE_FORBIDDEN');
    },
  },
  {
    name: 'R13 cambio de schema no puede ignorarse',
    run() {
      const input = baseCodePlan();
      input.database_state_ref.code_target_compatible = false;
      input.database_state_ref.rollback_required = false;
      assertBlocked(input, 'DATABASE_COMPATIBILITY_UNRESOLVED');
    },
  },
  {
    name: 'R14 rollback DB implícito queda prohibido',
    run() {
      const input = baseDatabasePlan();
      input.planned_actions = ['EXECUTE_DOWN_MIGRATION'];
      assertBlocked(input, 'FORBIDDEN_ACTION');
    },
  },
  {
    name: 'R15 grants inseguros no se restauran',
    run() {
      const input = baseCodePlan();
      input.security_assessment.restores_insecure_grants = true;
      assertBlocked(input, 'INSECURE_GRANT_RESTORE_FORBIDDEN');
    },
  },
  {
    name: 'R16 historial Git no se reescribe',
    run() {
      const input = baseCodePlan();
      input.planned_actions = ['REWRITE_HISTORY'];
      assertBlocked(input, 'FORBIDDEN_ACTION');
    },
  },
  {
    name: 'R17 release histórica no se muta',
    run() {
      const input = basePackagePlan();
      input.planned_actions = ['MUTATE_RELEASE'];
      assertBlocked(input, 'FORBIDDEN_ACTION');
    },
  },
  {
    name: 'R18 auto-merge permanece prohibido',
    run() {
      const input = basePackagePlan();
      input.planned_actions = ['AUTO_MERGE'];
      assertBlocked(input, 'FORBIDDEN_ACTION');
    },
  },
  {
    name: 'R19 auto-deploy permanece prohibido',
    run() {
      const input = baseCodePlan();
      input.planned_actions = ['AUTO_DEPLOY'];
      assertBlocked(input, 'FORBIDDEN_ACTION');
    },
  },
  {
    name: 'R20 rollback global implícito permanece prohibido',
    run() {
      const first = prepareRollbackPlan(baseCodePlan());
      const second = prepareRollbackPlan(baseCodePlan({
        repository: 'devVentoGroup/vento-fogo',
      }));
      const incident = buildIncidentRollbackPlan(
        [first, second],
        { implicit_global_rollback: true },
      );
      assert.equal(incident.result, 'BLOCKED');
      assert.ok(incident.reasons.includes('IMPLICIT_GLOBAL_ROLLBACK_FORBIDDEN'));
    },
  },
  {
    name: 'R21 PREPARE nunca declara ejecución PASS',
    run() {
      const prepared = prepareRollbackPlan(baseCodePlan());
      assert.equal(prepared.result, 'PASS');
      assert.equal(prepared.record.result, 'PENDING');
      assert.equal(prepared.record.post_rollback_verification, null);
    },
  },
  {
    name: 'R22 intentos fallidos permanecen en historial',
    run() {
      const prepared = prepareRollbackPlan(baseCodePlan());
      const failedObservation = baseVerification(prepared);
      failedObservation.incident_condition_persists = true;
      failedObservation.reported_result = 'FAIL';
      const failed = verifyRollbackExecution(prepared, failedObservation);
      const passed = verifyRollbackExecution(prepared, baseVerification(prepared));
      const firstAppend = appendRollbackHistory([], failed);
      const secondAppend = appendRollbackHistory(firstAppend.history, passed);
      assert.equal(firstAppend.appended, true);
      assert.equal(secondAppend.appended, true);
      assert.equal(secondAppend.history.length, 2);
      assert.equal(secondAppend.history[0].result, 'FAIL');
      assert.equal(secondAppend.history[1].result, 'PASS');
    },
  },
  {
    name: 'R23 reintentos sin diagnóstico no fuerzan verde',
    run() {
      const prepared = prepareRollbackPlan(baseCodePlan());
      const observation = baseVerification(prepared);
      observation.retry_count = 2;
      observation.retry_diagnostic_ref = null;
      const verified = verifyRollbackExecution(prepared, observation);
      assert.equal(verified.result, 'FAIL');
      assert.ok(verified.reasons.includes('RETRY_DIAGNOSTIC_MISSING'));
    },
  },
  {
    name: 'R24 evidencia no se reutiliza tras cambio material',
    run() {
      const previousInput = baseCodePlan();
      const previous = prepareRollbackPlan(previousInput);
      const currentInput = structuredClone(previousInput);
      currentInput.rollback_to_commit = commit('c');
      currentInput.previous_snapshot_ref.commit = commit('c');
      currentInput.consumer_baseline_ref.consumer_base_commit = commit('c');
      const comparison = comparePreparedPlan(previous, currentInput);
      assert.equal(comparison.current, false);
      assert.equal(comparison.result, 'STALE');
      assert.ok(comparison.reasons.includes('MATERIAL_INPUT_CHANGED'));
    },
  },
];

assert.equal(POSITIVE_CASES.length, 12);
assert.equal(NEGATIVE_CASES.length, 28);
assert.equal(REGRESSION_CASES.length, 24);
assert.equal(POSITIVE_CASES.length + NEGATIVE_CASES.length + REGRESSION_CASES.length, 64);

test('SHELL-CI-014::GLOBAL — 12 casos positivos', async (t) => {
  for (const scenario of POSITIVE_CASES) {
    await t.test(scenario.name, scenario.run);
  }
});

test('SHELL-CI-014::GLOBAL — 28 casos negativos', async (t) => {
  for (const scenario of NEGATIVE_CASES) {
    await t.test(scenario.name, scenario.run);
  }
});

test('SHELL-CI-014::GLOBAL — 24 regresiones', async (t) => {
  for (const scenario of REGRESSION_CASES) {
    await t.test(scenario.name, scenario.run);
  }
});

test('identidad de evidencia es determinista para el mismo material', () => {
  const left = rollbackIdentity({ b: 2, a: 1 });
  const right = rollbackIdentity({ a: 1, b: 2 });
  assert.equal(left, right);
});