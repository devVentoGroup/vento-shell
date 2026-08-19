import assert from 'node:assert/strict';
import fs from 'node:fs';
import os from 'node:os';
import path from 'node:path';
import test from 'node:test';

import {
  PLAN_CLASSIFICATIONS,
  REQUIRED_DEPLOYMENT_UNIT_FIELDS,
  REQUIRED_PLAN_RECORD_FIELDS,
  appendIndependenceHistory,
  comparePreparedIndependencePlan,
  deploymentIdentity,
  evaluateDeploymentIndependence,
  materializeSystemState,
  writeRuntimeEvidence,
} from './deployment-independence-gate.mjs';
import { RELEASE_GATE_INSTANCE_ID } from './shared-package-release-gate.mjs';
import {
  CANONICAL_BASE_RELATIONS,
  COMPATIBILITY_GATE_INSTANCE_ID,
} from './shared-package-compatibility-gate.mjs';
import { CONSUMER_UPDATE_GATE_INSTANCE_ID } from './shared-package-consumer-update-gate.mjs';
import {
  CONSUMER_BASELINE_GATES,
  ROLLBACK_GATE_INSTANCE_ID,
} from './repository-rollback-gate.mjs';

const HEX = Object.freeze(['a', 'b', 'c', 'd', 'e', 'f', '1', '2', '3', '4', '5', '6', '7', '8', '9', '0']);
const REPOSITORIES = Object.freeze([
  'vento-group-sas/vento-shell',
  'vento-group-sas/vento-nexo',
  'vento-group-sas/vento-fogo',
  'vento-group-sas/vento-origo',
  'vento-group-sas/vento-pulso',
  'vento-group-sas/vento-viso',
  'vento-group-sas/vento-numera',
  'vento-group-sas/vento-anima',
]);

function sha(key = 'a') {
  return `sha256:${key.repeat(64)}`;
}

function commit(key = 'a') {
  return key.repeat(40);
}

function repoIndex(repository) {
  const index = REPOSITORIES.indexOf(repository);
  return index >= 0 ? index : 0;
}

function shortName(repository) {
  return repository.split('/').at(-1);
}

function unitId(repository) {
  return `DU-${shortName(repository).replace(/^vento-/u, '').toUpperCase()}-001`;
}

function baselineRef(repository, environment) {
  const gate = CONSUMER_BASELINE_GATES[repository];
  if (!gate) return null;
  return {
    gate_instance: gate,
    consumer_repository: repository,
    environment,
    result: 'PASS',
    execution_identity: sha('6'),
    invalidation_reason: null,
  };
}

function rollbackRef(repository, environment) {
  return {
    gate_instance: ROLLBACK_GATE_INSTANCE_ID,
    repository,
    environment,
    result: 'PASS',
    independent: true,
    global_rollback_required: false,
    rollback_evidence_identity: sha('7'),
    invalidation_reason: null,
  };
}

function baseUnit(repository, environment, changeRef) {
  const index = repoIndex(repository);
  const sourceKey = HEX[index];
  const targetKey = HEX[index + 1];
  return {
    deployment_unit_id: unitId(repository),
    repository,
    environment,
    owner: `${shortName(repository).toUpperCase()}_OWNER`,
    change_ref: changeRef,
    source_branch: 'main',
    source_commit: commit(sourceKey),
    source_artifact: sha(sourceKey),
    target_commit: commit(targetKey),
    target_artifact: sha(targetKey),
    manifest_before_identity: sha('1'),
    manifest_target_identity: sha('2'),
    lockfile_before_identity: sha('3'),
    lockfile_target_identity: sha('4'),
    package_set_before: [],
    package_set_target: [],
    contract_set_before: [
      { contract_name: 'vento.synthetic.contract', version: '1.0.0' },
    ],
    contract_set_target: [
      { contract_name: 'vento.synthetic.contract', version: '1.0.0' },
    ],
    configuration_before_identity: sha('5'),
    configuration_target_identity: sha('5'),
    database_state_ref: {
      affected: false,
      before_identity: sha('8'),
      target_identity: sha('8'),
      ci015_executes_mutation: false,
    },
    compatibility_refs: [],
    consumer_baseline_ref: baselineRef(repository, environment),
    release_refs: [],
    rollback_ref: rollbackRef(repository, environment),
    depends_on_units: [],
    required_validation_set: [
      { id: 'UNIT_READY', kind: 'CHECK', required: true },
    ],
    unit_result: 'PASS',
    manifest_lock_consistent: true,
    requires_retired_contract: false,
    consumer_update_ref: null,
    configuration_transition: null,
  };
}

function stateFromUnit(unit, target = false) {
  return {
    commit: target ? unit.target_commit : unit.source_commit,
    artifact: target ? unit.target_artifact : unit.source_artifact,
    manifest_identity: target ? unit.manifest_target_identity : unit.manifest_before_identity,
    lockfile_identity: target ? unit.lockfile_target_identity : unit.lockfile_before_identity,
    package_set: target ? unit.package_set_target : unit.package_set_before,
    contract_set: target ? unit.contract_set_target : unit.contract_set_before,
    configuration_identity: target
      ? unit.configuration_target_identity
      : unit.configuration_before_identity,
    database_state_identity: target
      ? unit.database_state_ref.target_identity
      : unit.database_state_ref.before_identity,
    runtime_identity: sha('9'),
  };
}

function unchangedState(repository) {
  const key = HEX[repoIndex(repository)];
  return {
    commit: commit(key),
    artifact: sha(key),
    manifest_identity: sha('1'),
    lockfile_identity: sha('3'),
    package_set: [],
    contract_set: [
      { contract_name: 'vento.synthetic.contract', version: '1.0.0' },
    ],
    configuration_identity: sha('5'),
    database_state_identity: sha('8'),
    runtime_identity: sha('9'),
  };
}

function allSubsets(ids) {
  const subsets = [];
  for (let mask = 0; mask < (1 << ids.length); mask += 1) {
    subsets.push(ids.filter((_, index) => (mask & (1 << index)) !== 0));
  }
  return subsets;
}

function stateEvaluation(plan, completedUnits) {
  const state = materializeSystemState(
    plan.initial_system_state,
    plan.deployment_units,
    completedUnits,
  );
  return {
    completed_units: [...completedUnits].sort(),
    environment: plan.environment,
    state_identity: deploymentIdentity(state),
    result: 'PASS',
    compatibility_valid: true,
    baseline_valid: true,
    rollback_available: true,
    database_compatible: true,
    configuration_compatible: true,
    support_window: {
      valid: true,
      current: true,
      synthetic_seconds_only: false,
      exit_condition: 'OWNER_CONTROLLED_SUPPORT_WINDOW',
      evidence_identity: sha('a'),
    },
    validation_results: plan.validation_set.map((entry) => ({
      id: entry.id,
      status: 'PASS',
      executed_count: 1,
    })),
    evidence_refs: [sha('b')],
    invalidation_reason: null,
  };
}

function rebuildPlanStates(plan, { all = true } = {}) {
  plan.initial_system_state = Object.fromEntries(
    Object.entries(plan.initial_system_state).map(([repository, state]) => {
      const unit = plan.deployment_units.find((entry) => entry.repository === repository);
      return [repository, unit ? { ...state, ...stateFromUnit(unit, false) } : state];
    }),
  );
  plan.target_system_state = materializeSystemState(
    plan.initial_system_state,
    plan.deployment_units,
    plan.deployment_units.map((unit) => unit.deployment_unit_id),
  );
  const ids = plan.deployment_units.map((unit) => unit.deployment_unit_id).sort();
  const subsets = all ? allSubsets(ids) : [[], ids];
  plan.state_evaluations = subsets.map((subset) => stateEvaluation(plan, subset));
  plan.environment_ref.repository_scope = Object.keys(plan.initial_system_state).sort();
  return plan;
}

function basePlan({
  repositories = ['vento-group-sas/vento-nexo'],
  additionalRepositories = [],
} = {}) {
  const environment = 'SYNTHETIC_CI015';
  const changeRef = 'CHANGE-SYNTH-CI015-001';
  const deploymentUnits = repositories.map((repository) => baseUnit(repository, environment, changeRef));
  const initialSystemState = Object.fromEntries([
    ...deploymentUnits.map((unit) => [unit.repository, stateFromUnit(unit, false)]),
    ...additionalRepositories.map((repository) => [repository, unchangedState(repository)]),
  ]);
  const plan = {
    schema_version: 1,
    execution_mode: 'SYNTHETIC',
    deployment_independence_id: 'DI-SYNTH-CI015-001',
    environment,
    change_ref: changeRef,
    requested_by: 'SYNTHETIC_REQUESTER',
    approved_by: 'SYNTHETIC_APPROVER',
    environment_ref: {
      environment,
      known: true,
      repository_scope: Object.keys(initialSystemState),
      evidence_identity: sha('c'),
    },
    initial_system_state: initialSystemState,
    target_system_state: {},
    deployment_units: deploymentUnits,
    dependency_edges: [],
    state_evaluations: [],
    validation_set: [
      { id: 'INTERMEDIATE_COMPATIBILITY', kind: 'INTEGRATION', required: true },
      { id: 'ROLLBACK_AVAILABLE', kind: 'CHECK', required: true },
    ],
    independence_basis: [
      'INTERMEDIATE_STATE_COMPATIBILITY',
      'CI005',
      'CI014',
    ],
    coordination_policy: 'OPTIONAL',
    coordination_as_safety_property: false,
    simultaneous_deploy_required: false,
    deploy_all_unit: false,
    global_repository_lock_required: false,
    global_tag_identity: null,
    atomicity_claim: 'NONE',
    assume_instant_anima_update: false,
    anima_classification: 'NATIVE_REACT_NATIVE_EXPO',
    anima_in_scope: false,
    anima_compatibility_ref: null,
    recovery_strategy: 'UNIT_ROLLBACK_ONLY',
    failure_recovery_ref: null,
    mutate_historical_release: false,
    synthetic_fixture_uses_production_data: false,
    automation_capabilities: [],
    started_at: '2026-08-18T14:50:00-05:00',
    completed_at: '2026-08-18T14:51:00-05:00',
  };
  return rebuildPlanStates(plan);
}

function setDependency(plan, fromRepository, toRepository) {
  const fromId = unitId(fromRepository);
  const toId = unitId(toRepository);
  plan.dependency_edges.push({
    from_unit_id: fromId,
    to_unit_id: toId,
    reason: 'SYNTHETIC_ORDER_DEPENDENCY',
    evidence_identity: sha('d'),
  });
  const target = plan.deployment_units.find((unit) => unit.deployment_unit_id === toId);
  target.depends_on_units = [...new Set([...target.depends_on_units, fromId])].sort();
  return plan;
}

function relationFor(packageName, repository) {
  return CANONICAL_BASE_RELATIONS.find((entry) => (
    entry.package_name === packageName
    && entry.consumer_repository === shortName(repository)
  ));
}

function applyPackageChange(plan, repository, packageName, fromVersion, targetVersion) {
  const unit = plan.deployment_units.find((entry) => entry.repository === repository);
  const before = unit.package_set_before.filter((entry) => entry.package_name !== packageName);
  const target = unit.package_set_target.filter((entry) => entry.package_name !== packageName);
  unit.package_set_before = [...before, { package_name: packageName, version: fromVersion }];
  unit.package_set_target = [...target, { package_name: packageName, version: targetVersion }];
  unit.release_refs = [
    ...unit.release_refs.filter((entry) => entry.package_name !== packageName),
    {
      gate_instance: RELEASE_GATE_INSTANCE_ID,
      package_name: packageName,
      version: targetVersion,
      result: 'PASS',
      immutable: true,
      release_evidence_identity: sha('e'),
      invalidation_reason: null,
    },
  ];
  if (repository === 'vento-group-sas/vento-anima') {
    unit.compatibility_refs = [
      ...unit.compatibility_refs.filter((entry) => entry.package_name !== packageName),
      {
        relation_source: 'OWNER_EXTENSION',
        owner_contract: 'SHELL-NATIVE-003',
        target_class: 'NATIVE_REACT_NATIVE_EXPO',
        package_name: packageName,
        consumer_repository: 'vento-anima',
        environment: plan.environment,
        result: 'PASS',
        relation_state: 'COMPATIBLE',
        compatibility_evidence_identity: sha('f'),
        invalidation_reason: null,
      },
    ];
  } else {
    const relation = relationFor(packageName, repository);
    unit.compatibility_refs = [
      ...unit.compatibility_refs.filter((entry) => entry.package_name !== packageName),
      {
        gate_instance: COMPATIBILITY_GATE_INSTANCE_ID,
        relation_identity: relation.relation_identity,
        package_name: packageName,
        consumer_repository: shortName(repository),
        environment: plan.environment,
        result: 'PASS',
        relation_state: 'COMPATIBLE',
        compatibility_evidence_identity: sha('f'),
        invalidation_reason: null,
      },
    ];
    unit.consumer_update_ref = {
      gate_instance: CONSUMER_UPDATE_GATE_INSTANCE_ID,
      consumer_repository: shortName(repository),
      result: 'PASS',
      simultaneous_deploy_required: false,
      blockers: [],
      proposal_identity: sha('1'),
      invalidation_reason: null,
    };
  }
  return rebuildPlanStates(plan);
}

function applyDatabaseExpansion(plan, repository) {
  const unit = plan.deployment_units.find((entry) => entry.repository === repository);
  unit.database_state_ref = {
    affected: true,
    before_identity: sha('8'),
    target_identity: sha('9'),
    ci015_executes_mutation: false,
    owner_repository: 'vento-group-sas/vento-shell',
    owner_task: 'AUTH-DB-029',
    result: 'PASS',
    old_and_new_code_coexist: true,
    destructive_before_consumer_retirement: false,
    rollback_required: true,
    rollback_owner_task: 'AUTH-DB-029',
    evidence_identity: sha('2'),
  };
  return rebuildPlanStates(plan);
}

function applyConfigurationChange(plan, repository) {
  const unit = plan.deployment_units.find((entry) => entry.repository === repository);
  unit.configuration_target_identity = sha('6');
  unit.configuration_transition = {
    versioned: true,
    environment: plan.environment,
    opens_bypass: false,
    expands_permissions: false,
    contains_secret_values: false,
    deferred_activation: true,
    result: 'PASS',
    evidence_identity: sha('3'),
  };
  return rebuildPlanStates(plan);
}

function reasonMatches(reason, expected) {
  return reason === expected
    || reason.startsWith(`${expected}:`)
    || reason.endsWith(`:${expected}`)
    || reason.includes(`:${expected}:`);
}

function assertBlocked(plan, expectedReason) {
  const result = evaluateDeploymentIndependence(plan);
  assert.equal(result.result, 'BLOCKED');
  assert.ok(
    result.reasons.some((reason) => reasonMatches(reason, expectedReason)),
    `Expected ${expectedReason}; received ${result.reasons.join(', ')}`,
  );
}

const POSITIVE_CASES = [
  {
    name: 'P01 single repository change with compatible external state',
    run() {
      const result = evaluateDeploymentIndependence(basePlan());
      assert.equal(result.result, 'PASS');
      assert.equal(result.classification, 'SINGLE_REPOSITORY');
      assert.equal(result.record.selected_order.length, 1);
      assert.equal(
        REQUIRED_DEPLOYMENT_UNIT_FIELDS.every((field) => Object.hasOwn(result.record.deployment_units[0], field)),
        true,
      );
    },
  },
  {
    name: 'P02 two repositories are supported in any order',
    run() {
      const plan = basePlan({
        repositories: ['vento-group-sas/vento-nexo', 'vento-group-sas/vento-fogo'],
      });
      const result = evaluateDeploymentIndependence(plan);
      assert.equal(result.result, 'PASS');
      assert.equal(result.classification, 'ANY_ORDER');
      assert.equal(result.record.candidate_order_count, 2);
    },
  },
  {
    name: 'P03 two repositories have one supported explicit order',
    run() {
      const plan = basePlan({
        repositories: ['vento-group-sas/vento-nexo', 'vento-group-sas/vento-fogo'],
      });
      setDependency(plan, 'vento-group-sas/vento-nexo', 'vento-group-sas/vento-fogo');
      const result = evaluateDeploymentIndependence(plan);
      assert.equal(result.result, 'PASS');
      assert.equal(result.classification, 'ORDERED');
      assert.deepEqual(result.record.selected_order, [
        unitId('vento-group-sas/vento-nexo'),
        unitId('vento-group-sas/vento-fogo'),
      ]);
    },
  },
  {
    name: 'P04 shared release is adopted by consumers in staggered units',
    run() {
      const plan = basePlan({
        repositories: ['vento-group-sas/vento-nexo', 'vento-group-sas/vento-fogo'],
      });
      applyPackageChange(plan, 'vento-group-sas/vento-nexo', '@vento/contracts', '1.0.0', '1.1.0');
      applyPackageChange(plan, 'vento-group-sas/vento-fogo', '@vento/contracts', '1.0.0', '1.1.0');
      const result = evaluateDeploymentIndependence(plan);
      assert.equal(result.result, 'PASS');
      assert.equal(result.record.compatibility_evidence.length, 2);
    },
  },
  {
    name: 'P05 old and new consumers coexist inside certified support',
    run() {
      const plan = basePlan({
        repositories: ['vento-group-sas/vento-nexo'],
        additionalRepositories: ['vento-group-sas/vento-fogo'],
      });
      applyPackageChange(plan, 'vento-group-sas/vento-nexo', '@vento/contracts', '1.0.0', '1.1.0');
      const result = evaluateDeploymentIndependence(plan);
      assert.equal(result.result, 'PASS');
      assert.deepEqual(
        result.record.intermediate_states.at(-1).completed_units,
        [unitId('vento-group-sas/vento-nexo')],
      );
    },
  },
  {
    name: 'P06 minimal closed multi-package adoption remains one consumer unit',
    run() {
      const plan = basePlan();
      applyPackageChange(plan, 'vento-group-sas/vento-nexo', '@vento/contracts', '1.0.0', '1.1.0');
      applyPackageChange(plan, 'vento-group-sas/vento-nexo', '@vento/os-context', '1.0.0', '1.2.0');
      const result = evaluateDeploymentIndependence(plan);
      assert.equal(result.result, 'PASS');
      assert.equal(result.record.deployment_units.length, 1);
      assert.equal(result.record.release_refs, undefined);
      assert.equal(result.record.deployment_units[0].release_refs.length, 2);
    },
  },
  {
    name: 'P07 approved schema expansion supports old and new code',
    run() {
      const plan = applyDatabaseExpansion(basePlan(), 'vento-group-sas/vento-nexo');
      const result = evaluateDeploymentIndependence(plan);
      assert.equal(result.result, 'PASS');
      assert.equal(result.record.database_dependency_evidence[0].old_and_new_code_coexist, true);
    },
  },
  {
    name: 'P08 safe versioned configuration defers activation without bypass',
    run() {
      const plan = applyConfigurationChange(basePlan(), 'vento-group-sas/vento-nexo');
      const result = evaluateDeploymentIndependence(plan);
      assert.equal(result.result, 'PASS');
      assert.equal(result.record.configuration_evidence[0].deferred_activation, true);
    },
  },
  {
    name: 'P09 ANIMA remains on supported native version while backend changes',
    run() {
      const plan = basePlan({
        repositories: ['vento-group-sas/vento-shell'],
        additionalRepositories: ['vento-group-sas/vento-anima'],
      });
      plan.anima_in_scope = true;
      plan.anima_compatibility_ref = {
        repository: 'vento-group-sas/vento-anima',
        target_class: 'NATIVE_REACT_NATIVE_EXPO',
        result: 'PASS',
        instant_update_required: false,
        evidence_identity: sha('4'),
      };
      const result = evaluateDeploymentIndependence(plan);
      assert.equal(result.result, 'PASS');
      assert.equal(plan.target_system_state['vento-group-sas/vento-anima'].commit, plan.initial_system_state['vento-group-sas/vento-anima'].commit);
    },
  },
  {
    name: 'P10 three-unit rollout can stop after first supported state',
    run() {
      const plan = basePlan({
        repositories: [
          'vento-group-sas/vento-nexo',
          'vento-group-sas/vento-fogo',
          'vento-group-sas/vento-origo',
        ],
      });
      const result = evaluateDeploymentIndependence(plan);
      assert.equal(result.result, 'PASS');
      assert.equal(result.record.intermediate_states[1].result, 'PASS');
      assert.equal(result.record.intermediate_states[1].completed_units.length, 1);
    },
  },
  {
    name: 'P11 unit failure recovery delegates to CI014 without global rollback',
    run() {
      const plan = basePlan();
      plan.failure_recovery_ref = {
        gate_instance: ROLLBACK_GATE_INSTANCE_ID,
        result: 'PASS',
        scope: 'UNIT',
        global_rollback: false,
        evidence_identity: sha('5'),
      };
      const result = evaluateDeploymentIndependence(plan);
      assert.equal(result.result, 'PASS');
      const history = appendIndependenceHistory([], result);
      assert.equal(history.appended, true);
      assert.equal(result.record.automation_effects.rollback, false);
    },
  },
  {
    name: 'P12 repeated evaluation is deterministic and writes machine evidence',
    run() {
      const plan = basePlan({
        repositories: ['vento-group-sas/vento-nexo', 'vento-group-sas/vento-fogo'],
      });
      const first = evaluateDeploymentIndependence(plan);
      const second = evaluateDeploymentIndependence(plan);
      assert.equal(first.result, 'PASS');
      assert.equal(first.plan_identity, second.plan_identity);
      assert.deepEqual(first.record.selected_order, second.record.selected_order);
      assert.equal(
        REQUIRED_PLAN_RECORD_FIELDS.every((field) => Object.hasOwn(first.record, field)),
        true,
      );
      const comparison = comparePreparedIndependencePlan(first, plan);
      assert.equal(comparison.outcome, 'PASS');
      const tempRoot = fs.mkdtempSync(path.join(os.tmpdir(), 'ci015-'));
      try {
        const evidencePath = writeRuntimeEvidence(first, {
          repositoryRoot: tempRoot,
          evidenceRoot: '.delivery/deployment-independence',
        });
        assert.equal(fs.existsSync(evidencePath), true);
        const parsed = JSON.parse(fs.readFileSync(evidencePath, 'utf8'));
        assert.equal(parsed.plan_identity, first.plan_identity);
      } finally {
        fs.rmSync(tempRoot, { recursive: true, force: true });
      }
    },
  },
];

const NEGATIVE_CASES = [
  {
    name: 'N01 unknown repository is blocked',
    run() {
      const plan = basePlan();
      plan.deployment_units[0].repository = 'vento-group-sas/vento-unknown';
      assertBlocked(plan, 'REPOSITORY_UNKNOWN');
    },
  },
  {
    name: 'N02 unknown environment is blocked',
    run() {
      const plan = basePlan();
      plan.environment_ref.known = false;
      assertBlocked(plan, 'ENVIRONMENT_UNKNOWN');
    },
  },
  {
    name: 'N03 unit without owner is blocked',
    run() {
      const plan = basePlan();
      plan.deployment_units[0].owner = '';
      assertBlocked(plan, 'UNIT_OWNER_MISSING');
    },
  },
  {
    name: 'N04 source state mismatch is blocked',
    run() {
      const plan = basePlan();
      const repository = plan.deployment_units[0].repository;
      plan.initial_system_state[repository].commit = commit('f');
      assertBlocked(plan, 'SOURCE_STATE_MISMATCH');
    },
  },
  {
    name: 'N05 target without exact identity is blocked',
    run() {
      const plan = basePlan();
      plan.deployment_units[0].target_commit = 'latest';
      assertBlocked(plan, 'TARGET_COMMIT_INVALID');
    },
  },
  {
    name: 'N06 unverifiable release is blocked',
    run() {
      const plan = applyPackageChange(basePlan(), 'vento-group-sas/vento-nexo', '@vento/contracts', '1.0.0', '1.1.0');
      plan.deployment_units[0].release_refs[0].result = 'FAIL';
      assertBlocked(plan, 'RELEASE_NOT_PASS');
    },
  },
  {
    name: 'N07 inconsistent manifest and lockfile are blocked',
    run() {
      const plan = basePlan();
      plan.deployment_units[0].manifest_lock_consistent = false;
      assertBlocked(plan, 'MANIFEST_LOCKFILE_INCONSISTENT');
    },
  },
  {
    name: 'N08 floating package set is blocked',
    run() {
      const plan = applyPackageChange(basePlan(), 'vento-group-sas/vento-nexo', '@vento/contracts', '1.0.0', '1.1.0');
      plan.deployment_units[0].package_set_target[0].version = '^1.1.0';
      assertBlocked(plan, 'PACKAGE_SET_TARGET_VERSION_NOT_EXACT');
    },
  },
  {
    name: 'N09 missing compatibility is blocked',
    run() {
      const plan = applyPackageChange(basePlan(), 'vento-group-sas/vento-nexo', '@vento/contracts', '1.0.0', '1.1.0');
      plan.deployment_units[0].compatibility_refs = [];
      assertBlocked(plan, 'COMPATIBILITY_REFS_MISSING');
    },
  },
  {
    name: 'N10 incompatible relation is blocked',
    run() {
      const plan = applyPackageChange(basePlan(), 'vento-group-sas/vento-nexo', '@vento/contracts', '1.0.0', '1.1.0');
      plan.deployment_units[0].compatibility_refs[0].relation_state = 'INCOMPATIBLE';
      assertBlocked(plan, 'COMPATIBILITY_RELATION_NOT_SUPPORTED');
    },
  },
  {
    name: 'N11 compatibility from another consumer is blocked',
    run() {
      const plan = applyPackageChange(basePlan(), 'vento-group-sas/vento-nexo', '@vento/contracts', '1.0.0', '1.1.0');
      plan.deployment_units[0].compatibility_refs[0].consumer_repository = 'vento-fogo';
      assertBlocked(plan, 'COMPATIBILITY_CONSUMER_MISMATCH');
    },
  },
  {
    name: 'N12 baseline from another consumer is blocked',
    run() {
      const plan = basePlan();
      plan.deployment_units[0].consumer_baseline_ref.consumer_repository = 'vento-group-sas/vento-fogo';
      assertBlocked(plan, 'CONSUMER_BASELINE_REPOSITORY_MISMATCH');
    },
  },
  {
    name: 'N13 target requiring retired contract is blocked',
    run() {
      const plan = basePlan();
      plan.deployment_units[0].requires_retired_contract = true;
      assertBlocked(plan, 'TARGET_REQUIRES_RETIRED_CONTRACT');
    },
  },
  {
    name: 'N14 A-B dependency cycle is blocked as lockstep',
    run() {
      const plan = basePlan({
        repositories: ['vento-group-sas/vento-nexo', 'vento-group-sas/vento-fogo'],
      });
      setDependency(plan, 'vento-group-sas/vento-nexo', 'vento-group-sas/vento-fogo');
      setDependency(plan, 'vento-group-sas/vento-fogo', 'vento-group-sas/vento-nexo');
      const result = evaluateDeploymentIndependence(plan);
      assert.equal(result.result, 'BLOCKED');
      assert.equal(result.classification, 'BLOCKED_LOCKSTEP');
      assert.ok(result.reasons.includes('DEPENDENCY_CYCLE_LOCKSTEP'));
    },
  },
  {
    name: 'N15 simultaneous-only success condition is blocked',
    run() {
      const plan = basePlan();
      plan.simultaneous_deploy_required = true;
      assertBlocked(plan, 'SIMULTANEOUS_DEPLOY_REQUIRED');
    },
  },
  {
    name: 'N16 seconds-only compatibility window is blocked',
    run() {
      const plan = basePlan();
      plan.coordination_as_safety_property = true;
      plan.state_evaluations.forEach((entry) => {
        entry.support_window.synthetic_seconds_only = true;
      });
      assertBlocked(plan, 'COORDINATION_USED_AS_SAFETY_PROPERTY');
    },
  },
  {
    name: 'N17 deploy-all cannot be a deployment unit',
    run() {
      const plan = basePlan();
      plan.deploy_all_unit = true;
      assertBlocked(plan, 'DEPLOY_ALL_NOT_A_DEPLOYMENT_UNIT');
    },
  },
  {
    name: 'N18 destructive migration before consumer retirement is blocked',
    run() {
      const plan = applyDatabaseExpansion(basePlan(), 'vento-group-sas/vento-nexo');
      plan.deployment_units[0].database_state_ref.destructive_before_consumer_retirement = true;
      assertBlocked(plan, 'DATABASE_DESTRUCTIVE_BEFORE_RETIREMENT');
    },
  },
  {
    name: 'N19 Supabase mutation from consumer or CI015 is blocked',
    run() {
      const plan = applyDatabaseExpansion(basePlan(), 'vento-group-sas/vento-nexo');
      plan.deployment_units[0].database_state_ref.owner_repository = 'vento-group-sas/vento-nexo';
      plan.deployment_units[0].database_state_ref.ci015_executes_mutation = true;
      assertBlocked(plan, 'CI015_SUPABASE_MUTATION_FORBIDDEN');
    },
  },
  {
    name: 'N20 unversioned configuration bridge is blocked',
    run() {
      const plan = applyConfigurationChange(basePlan(), 'vento-group-sas/vento-nexo');
      plan.deployment_units[0].configuration_transition.versioned = false;
      assertBlocked(plan, 'CONFIGURATION_NOT_VERSIONED');
    },
  },
  {
    name: 'N21 flag reopening bypass is blocked',
    run() {
      const plan = applyConfigurationChange(basePlan(), 'vento-group-sas/vento-nexo');
      plan.deployment_units[0].configuration_transition.opens_bypass = true;
      assertBlocked(plan, 'CONFIGURATION_OPENS_BYPASS');
    },
  },
  {
    name: 'N22 instant ANIMA update assumption is blocked',
    run() {
      const plan = basePlan();
      plan.assume_instant_anima_update = true;
      assertBlocked(plan, 'ANIMA_INSTANT_UPDATE_ASSUMPTION_FORBIDDEN');
    },
  },
  {
    name: 'N23 untested intermediate state blocks every sequential order',
    run() {
      const plan = basePlan({
        repositories: ['vento-group-sas/vento-nexo', 'vento-group-sas/vento-fogo'],
      });
      rebuildPlanStates(plan, { all: false });
      const result = evaluateDeploymentIndependence(plan);
      assert.equal(result.result, 'BLOCKED');
      assert.equal(result.classification, 'BLOCKED_LOCKSTEP');
      assert.ok(result.reasons.includes('NO_SAFE_SEQUENTIAL_ORDER'));
    },
  },
  {
    name: 'N24 automatic global rollback is blocked',
    run() {
      const plan = basePlan();
      plan.recovery_strategy = 'ROLLBACK_ALL';
      assertBlocked(plan, 'IMPLICIT_GLOBAL_ROLLBACK_FORBIDDEN');
    },
  },
];

const REGRESSION_CASES = [
  {
    name: 'R01 green build alone never proves independence',
    run() {
      const plan = basePlan();
      plan.independence_basis = ['BUILD_PASS'];
      assertBlocked(plan, 'INDEPENDENCE_BASIS_INSUFFICIENT');
    },
  },
  {
    name: 'R02 SemVer range never substitutes executed compatibility',
    run() {
      const plan = applyPackageChange(basePlan(), 'vento-group-sas/vento-nexo', '@vento/contracts', '1.0.0', '1.1.0');
      plan.deployment_units[0].package_set_target[0].version = '>=1 <2';
      assertBlocked(plan, 'PACKAGE_SET_TARGET_VERSION_NOT_EXACT');
    },
  },
  {
    name: 'R03 equal deployment timestamps never imply atomicity',
    run() {
      const plan = basePlan();
      plan.atomicity_claim = 'SAME_TIMESTAMP';
      assertBlocked(plan, 'TIMESTAMP_ATOMICITY_CLAIM_FORBIDDEN');
    },
  },
  {
    name: 'R04 manual order without intermediate validation remains blocked',
    run() {
      const plan = basePlan({
        repositories: ['vento-group-sas/vento-nexo', 'vento-group-sas/vento-fogo'],
      });
      plan.manual_selected_order = [
        unitId('vento-group-sas/vento-nexo'),
        unitId('vento-group-sas/vento-fogo'),
      ];
      rebuildPlanStates(plan, { all: false });
      assertBlocked(plan, 'NO_SAFE_SEQUENTIAL_ORDER');
    },
  },
  {
    name: 'R05 initial or final prefix cannot be omitted',
    run() {
      const plan = basePlan();
      plan.state_evaluations = plan.state_evaluations.filter((entry) => entry.completed_units.length > 0);
      assertBlocked(plan, 'STATE_EVALUATION_MISSING');
    },
  },
  {
    name: 'R06 evidence from another environment is rejected',
    run() {
      const plan = basePlan();
      plan.state_evaluations[0].environment = 'OTHER_ENV';
      assertBlocked(plan, 'STATE_EVALUATION_ENVIRONMENT_MISMATCH');
    },
  },
  {
    name: 'R07 evidence from another consumer is rejected',
    run() {
      const plan = applyPackageChange(basePlan(), 'vento-group-sas/vento-nexo', '@vento/contracts', '1.0.0', '1.1.0');
      plan.deployment_units[0].compatibility_refs[0].consumer_repository = 'vento-origo';
      assertBlocked(plan, 'COMPATIBILITY_CONSUMER_MISMATCH');
    },
  },
  {
    name: 'R08 stale intermediate evidence is rejected',
    run() {
      const plan = basePlan();
      plan.state_evaluations[0].invalidation_reason = 'MATERIAL_CHANGE';
      assertBlocked(plan, 'STATE_EVIDENCE_STALE');
    },
  },
  {
    name: 'R09 coordinated package release never requires coordinated deploy',
    run() {
      const plan = basePlan();
      plan.coordination_policy = 'COORDINATED_RELEASE_IMPLIES_DEPLOY';
      assertBlocked(plan, 'COORDINATED_RELEASE_DOES_NOT_REQUIRE_COORDINATED_DEPLOY');
    },
  },
  {
    name: 'R10 unchanged package cannot receive artificial version for lockstep',
    run() {
      const plan = basePlan();
      plan.deployment_units[0].artificial_release_for_unchanged_package = true;
      assertBlocked(plan, 'ARTIFICIAL_RELEASE_WITHOUT_CHANGE');
    },
  },
  {
    name: 'R11 global tag cannot replace repository identities',
    run() {
      const plan = basePlan();
      plan.global_tag_identity = 'vento-global-v1';
      assertBlocked(plan, 'GLOBAL_TAG_IDENTITY_FORBIDDEN');
    },
  },
  {
    name: 'R12 permanent global repository lock is forbidden',
    run() {
      const plan = basePlan();
      plan.global_repository_lock_required = true;
      assertBlocked(plan, 'GLOBAL_REPOSITORY_LOCK_FORBIDDEN');
    },
  },
  {
    name: 'R13 ANIMA is never treated as web consumer',
    run() {
      const plan = basePlan();
      plan.anima_classification = 'WEB';
      assertBlocked(plan, 'ANIMA_WEB_CLASSIFICATION_FORBIDDEN');
    },
  },
  {
    name: 'R14 incompatible schema cannot be hidden by a short window',
    run() {
      const plan = applyDatabaseExpansion(basePlan(), 'vento-group-sas/vento-nexo');
      plan.deployment_units[0].database_state_ref.old_and_new_code_coexist = false;
      assertBlocked(plan, 'DATABASE_VERSION_SKEW_NOT_SUPPORTED');
    },
  },
  {
    name: 'R15 implicit database migration by CI015 is forbidden',
    run() {
      const plan = applyDatabaseExpansion(basePlan(), 'vento-group-sas/vento-nexo');
      plan.deployment_units[0].database_state_ref.ci015_executes_mutation = true;
      assertBlocked(plan, 'CI015_SUPABASE_MUTATION_FORBIDDEN');
    },
  },
  {
    name: 'R16 secret-shaped evidence is rejected even with synthetic value',
    run() {
      const plan = basePlan();
      plan.synthetic_sensitive_fixture = { api_key: 'SYNTHETIC_FIXTURE_VALUE' };
      assertBlocked(plan, 'SENSITIVE_DATA');
    },
  },
  {
    name: 'R17 auto-merge or auto-deploy capability is forbidden',
    run() {
      const plan = basePlan();
      plan.automation_capabilities = ['auto_merge', 'auto_deploy'];
      assertBlocked(plan, 'FORBIDDEN_AUTOMATION_CAPABILITY');
    },
  },
  {
    name: 'R18 implicit global rollback remains forbidden',
    run() {
      const plan = basePlan();
      plan.recovery_strategy = 'ROLLBACK_ALL';
      assertBlocked(plan, 'IMPLICIT_GLOBAL_ROLLBACK_FORBIDDEN');
    },
  },
  {
    name: 'R19 arbitrary manual order cannot hide dependency cycle',
    run() {
      const plan = basePlan({
        repositories: ['vento-group-sas/vento-nexo', 'vento-group-sas/vento-fogo'],
      });
      setDependency(plan, 'vento-group-sas/vento-nexo', 'vento-group-sas/vento-fogo');
      setDependency(plan, 'vento-group-sas/vento-fogo', 'vento-group-sas/vento-nexo');
      plan.manual_selected_order = [
        unitId('vento-group-sas/vento-nexo'),
        unitId('vento-group-sas/vento-fogo'),
      ];
      assertBlocked(plan, 'DEPENDENCY_CYCLE_LOCKSTEP');
    },
  },
  {
    name: 'R20 reported PASS before every intermediate state is validated is rejected',
    run() {
      const plan = basePlan({
        repositories: ['vento-group-sas/vento-nexo', 'vento-group-sas/vento-fogo'],
      });
      rebuildPlanStates(plan, { all: false });
      plan.reported_result = 'PASS';
      const result = evaluateDeploymentIndependence(plan);
      assert.equal(result.result, 'BLOCKED');
      assert.equal(result.record, null);
    },
  },
];

assert.equal(POSITIVE_CASES.length, 12);
assert.equal(NEGATIVE_CASES.length, 24);
assert.equal(REGRESSION_CASES.length, 20);
assert.equal(POSITIVE_CASES.length + NEGATIVE_CASES.length + REGRESSION_CASES.length, 56);
assert.ok(PLAN_CLASSIFICATIONS.includes('BLOCKED_LOCKSTEP'));

for (const entry of POSITIVE_CASES) {
  test(entry.name, entry.run);
}
for (const entry of NEGATIVE_CASES) {
  test(entry.name, entry.run);
}
for (const entry of REGRESSION_CASES) {
  test(entry.name, entry.run);
}