import { createHash } from 'node:crypto';
import fs from 'node:fs';
import path from 'node:path';
import { fileURLToPath } from 'node:url';

import {
  CANONICAL_SHARED_PACKAGES as CI003_PACKAGES,
  RELEASE_GATE_INSTANCE_ID,
} from './shared-package-release-gate.mjs';
import {
  CANONICAL_BASE_RELATIONS,
  CANONICAL_WEB_CONSUMERS as CI005_WEB_CONSUMERS,
  COMPATIBILITY_GATE_INSTANCE_ID,
} from './shared-package-compatibility-gate.mjs';
import {
  CANONICAL_WEB_CONSUMERS as CI006_WEB_CONSUMERS,
  CONSUMER_UPDATE_GATE_INSTANCE_ID,
  PR_BLOCKERS,
} from './shared-package-consumer-update-gate.mjs';
import {
  CANONICAL_REPOSITORIES as CI014_REPOSITORIES,
  CONSUMER_BASELINE_GATES,
  ROLLBACK_GATE_INSTANCE_ID,
} from './repository-rollback-gate.mjs';

export const DEPLOYMENT_INDEPENDENCE_GATE_INSTANCE_ID = 'SHELL-CI-015::GLOBAL';
export const DEPLOYMENT_INDEPENDENCE_SCHEMA_VERSION = 1;
export const IMPLEMENTATION_FILENAME = 'deployment-independence-gate.mjs';
export const IMPLEMENTATION_RELATIVE_PATH = `scripts/quality/${IMPLEMENTATION_FILENAME}`;
export const RUNTIME_EVIDENCE_RELATIVE_ROOT = '.delivery/deployment-independence';
export const CANONICAL_REPOSITORIES = Object.freeze([...CI014_REPOSITORIES]);
export const CANONICAL_WEB_CONSUMERS = Object.freeze([...CI005_WEB_CONSUMERS]);
export const PLAN_CLASSIFICATIONS = Object.freeze([
  'SINGLE_REPOSITORY',
  'ANY_ORDER',
  'ORDERED',
  'BLOCKED_LOCKSTEP',
]);
export const RESULT_STATES = Object.freeze([
  'PENDING',
  'RUNNING',
  'PASS',
  'FAIL',
  'BLOCKED',
  'CANCELLED',
  'TIMED_OUT',
  'STALE',
  'NOT_APPLICABLE',
]);
export const REQUIRED_DEPLOYMENT_UNIT_FIELDS = Object.freeze([
  'deployment_unit_id',
  'repository',
  'environment',
  'owner',
  'change_ref',
  'source_branch',
  'source_commit',
  'source_artifact',
  'target_commit',
  'target_artifact',
  'manifest_before_identity',
  'manifest_target_identity',
  'lockfile_before_identity',
  'lockfile_target_identity',
  'package_set_before',
  'package_set_target',
  'contract_set_before',
  'contract_set_target',
  'configuration_before_identity',
  'configuration_target_identity',
  'database_state_ref',
  'compatibility_refs',
  'consumer_baseline_ref',
  'release_refs',
  'rollback_ref',
  'depends_on_units',
  'required_validation_set',
  'unit_result',
]);
export const REQUIRED_PLAN_RECORD_FIELDS = Object.freeze([
  'deployment_independence_id',
  'environment',
  'change_ref',
  'requested_by',
  'approved_by',
  'initial_system_state_identity',
  'target_system_state_identity',
  'deployment_units',
  'dependency_edges',
  'candidate_orders',
  'selected_order',
  'intermediate_states',
  'compatibility_evidence',
  'baseline_evidence',
  'rollback_evidence',
  'database_dependency_evidence',
  'configuration_evidence',
  'validation_set',
  'started_at',
  'completed_at',
  'result',
  'invalidation_reason',
  'evidence_refs',
]);

const RESULT_STATE_SET = new Set(RESULT_STATES);
const REPOSITORY_SET = new Set(CANONICAL_REPOSITORIES);
const PACKAGE_SET = new Set(CI003_PACKAGES);
const COMMIT_PATTERN = /^[0-9a-f]{40}$/u;
const SHA256_PATTERN = /^sha256:[0-9a-f]{64}$/u;
const EXACT_SEMVER_PATTERN = /^\d+\.\d+\.\d+(?:-[0-9A-Za-z]+(?:[.-][0-9A-Za-z]+)*)?$/u;
const ISO_PATTERN = /^\d{4}-\d{2}-\d{2}T\d{2}:\d{2}(?::\d{2}(?:\.\d{3})?)?(?:Z|[+-]\d{2}:\d{2})$/u;
const SENSITIVE_KEY_PATTERN = /(?:^|[_-])(?:password|token|credential|api[_-]?key|private[_-]?key|service[_-]?role|secret(?:[_-](?:value|key|token|credential))?)(?:$|[_-])/iu;
const SENSITIVE_BOOLEAN_METADATA_KEYS = new Set(['contains_secret_values']);
const HARD_SECRET_PATTERNS = Object.freeze([
  /\bgh[pousr]_[A-Za-z0-9_]{24,}\b/u,
  /\bAKIA[0-9A-Z]{16}\b/u,
  /\bsk_(?:live|test)_[A-Za-z0-9]{20,}\b/u,
  /-----BEGIN (?:RSA |EC |OPENSSH )?PRIVATE KEY-----/u,
]);
const FORBIDDEN_AUTOMATION_CAPABILITIES = new Set([
  'auto_merge',
  'auto_deploy',
  'deploy_all',
  'write_protected_branch',
  'modify_branch_protection',
  'mutate_release',
  'unpublish_release',
  'supabase_mutation',
  'global_rollback',
]);

if (CI005_WEB_CONSUMERS.length !== 7 || CI006_WEB_CONSUMERS.length !== 7) {
  throw new Error('CI015_WEB_CONSUMER_CARDINALITY_DRIFT');
}
if (stableTextArray(CI005_WEB_CONSUMERS) !== stableTextArray(CI006_WEB_CONSUMERS)) {
  throw new Error('CI015_CI005_CI006_CONSUMER_DRIFT');
}
if (CI014_REPOSITORIES.length !== 8) {
  throw new Error('CI015_CI014_REPOSITORY_CARDINALITY_DRIFT');
}
if (!PR_BLOCKERS.includes('PR-BLK-018')) {
  throw new Error('CI015_CI006_SIMULTANEOUS_DEPLOY_BLOCKER_MISSING');
}

function nonEmptyString(value) {
  return typeof value === 'string' && value.trim().length > 0;
}

function isPlainObject(value) {
  return value !== null && typeof value === 'object' && !Array.isArray(value);
}

function compareText(left, right) {
  return String(left).localeCompare(String(right), 'en');
}

function unique(values) {
  return [...new Set(values)];
}

function normalizeLf(value) {
  return String(value ?? '').replace(/\r\n?/gu, '\n');
}

function stableTextArray(values) {
  return JSON.stringify([...values].map(String).sort(compareText));
}

function canonicalize(value) {
  if (typeof value === 'string') return normalizeLf(value);
  if (Array.isArray(value)) return value.map(canonicalize);
  if (!isPlainObject(value)) return value;
  return Object.fromEntries(
    Object.keys(value)
      .sort(compareText)
      .map((key) => [key, canonicalize(value[key])]),
  );
}

export function stableCanonicalStringify(value) {
  return JSON.stringify(canonicalize(value));
}

export function deploymentIdentity(value) {
  return `sha256:${createHash('sha256').update(stableCanonicalStringify(value)).digest('hex')}`;
}

function implementationIdentity() {
  return `sha256:${createHash('sha256')
    .update(fs.readFileSync(fileURLToPath(import.meta.url)))
    .digest('hex')}`;
}

function sensitiveFindings(value, pointer = '$', findings = []) {
  if (Array.isArray(value)) {
    value.forEach((child, index) => sensitiveFindings(child, `${pointer}[${index}]`, findings));
    return findings;
  }
  if (isPlainObject(value)) {
    for (const [key, child] of Object.entries(value)) {
      const next = `${pointer}.${key}`;
      const allowedSensitiveBooleanMetadata =
        SENSITIVE_BOOLEAN_METADATA_KEYS.has(key) && typeof child === 'boolean';
      if (
        !allowedSensitiveBooleanMetadata
        && SENSITIVE_KEY_PATTERN.test(key)
        && child !== null
        && child !== undefined
        && String(child).length > 0
      ) {
        findings.push(next);
      }
      sensitiveFindings(child, next, findings);
    }
    return findings;
  }
  if (
    typeof value === 'string'
    && HARD_SECRET_PATTERNS.some((pattern) => pattern.test(value))
  ) {
    findings.push(pointer);
  }
  return findings;
}

export function validateNoSensitiveData(value) {
  return unique(sensitiveFindings(value)).map((pointer) => `SENSITIVE_DATA:${pointer}`);
}

function validateShaIdentity(value, code, errors, { optional = false } = {}) {
  if (optional && (value === null || value === undefined || value === '')) return;
  if (!SHA256_PATTERN.test(String(value ?? ''))) errors.push(code);
}

function validateCommit(value, code, errors) {
  if (!COMMIT_PATTERN.test(String(value ?? ''))) errors.push(code);
}

function validateIso(value, code, errors) {
  if (!ISO_PATTERN.test(String(value ?? ''))) errors.push(code);
}

function repositoryShortName(repository) {
  return String(repository ?? '').split('/').at(-1) ?? '';
}

function normalizePackageSet(value) {
  if (!Array.isArray(value)) return [];
  return value
    .map((entry) => ({
      package_name: String(entry?.package_name ?? '').trim(),
      version: String(entry?.version ?? '').trim(),
    }))
    .filter((entry) => entry.package_name || entry.version)
    .sort((left, right) => (
      compareText(left.package_name, right.package_name)
      || compareText(left.version, right.version)
    ));
}

function validatePackageSet(value, label, errors) {
  if (!Array.isArray(value)) {
    errors.push(`${label}_NOT_ARRAY`);
    return [];
  }
  const normalized = normalizePackageSet(value);
  const names = normalized.map((entry) => entry.package_name);
  if (unique(names).length !== names.length) errors.push(`${label}_DUPLICATE_PACKAGE`);
  for (const entry of normalized) {
    if (!PACKAGE_SET.has(entry.package_name)) {
      errors.push(`${label}_PACKAGE_NOT_CANONICAL:${entry.package_name || 'EMPTY'}`);
    }
    if (!EXACT_SEMVER_PATTERN.test(entry.version)) {
      errors.push(`${label}_VERSION_NOT_EXACT:${entry.package_name || 'EMPTY'}`);
    }
  }
  return normalized;
}

function normalizeContractSet(value) {
  if (!Array.isArray(value)) return [];
  return value
    .map((entry) => ({
      contract_name: String(entry?.contract_name ?? '').trim(),
      version: String(entry?.version ?? '').trim(),
    }))
    .filter((entry) => entry.contract_name || entry.version)
    .sort((left, right) => (
      compareText(left.contract_name, right.contract_name)
      || compareText(left.version, right.version)
    ));
}

function validateContractSet(value, label, errors) {
  if (!Array.isArray(value)) {
    errors.push(`${label}_NOT_ARRAY`);
    return [];
  }
  const normalized = normalizeContractSet(value);
  const names = normalized.map((entry) => entry.contract_name);
  if (unique(names).length !== names.length) errors.push(`${label}_DUPLICATE_CONTRACT`);
  for (const entry of normalized) {
    if (!nonEmptyString(entry.contract_name)) errors.push(`${label}_NAME_MISSING`);
    if (!EXACT_SEMVER_PATTERN.test(entry.version)) {
      errors.push(`${label}_VERSION_NOT_EXACT:${entry.contract_name || 'EMPTY'}`);
    }
  }
  return normalized;
}

function packageSetChanged(before, target) {
  return stableCanonicalStringify(normalizePackageSet(before))
    !== stableCanonicalStringify(normalizePackageSet(target));
}

function contractSetChanged(before, target) {
  return stableCanonicalStringify(normalizeContractSet(before))
    !== stableCanonicalStringify(normalizeContractSet(target));
}

function configurationChanged(unit) {
  return unit.configuration_before_identity !== unit.configuration_target_identity;
}

function changedPackages(before, target) {
  const beforeMap = new Map(normalizePackageSet(before).map((entry) => [entry.package_name, entry.version]));
  return normalizePackageSet(target)
    .filter((entry) => beforeMap.get(entry.package_name) !== entry.version);
}

function relationFor(packageName, consumerRepository) {
  return CANONICAL_BASE_RELATIONS.find((entry) => (
    entry.package_name === packageName
    && entry.consumer_repository === consumerRepository
  )) ?? null;
}

function validateReleaseRefs(unit, errors) {
  const changed = changedPackages(unit.package_set_before, unit.package_set_target);
  if (changed.length === 0) return;
  if (!Array.isArray(unit.release_refs)) {
    errors.push('RELEASE_REFS_NOT_ARRAY');
    return;
  }
  for (const target of changed) {
    const ref = unit.release_refs.find((entry) => entry?.package_name === target.package_name);
    if (!ref) {
      errors.push(`RELEASE_REF_MISSING:${target.package_name}`);
      continue;
    }
    if (ref.gate_instance !== RELEASE_GATE_INSTANCE_ID) {
      errors.push(`RELEASE_GATE_INVALID:${target.package_name}`);
    }
    if (ref.version !== target.version) errors.push(`RELEASE_VERSION_MISMATCH:${target.package_name}`);
    if (ref.result !== 'PASS') errors.push(`RELEASE_NOT_PASS:${target.package_name}`);
    if (ref.immutable !== true) errors.push(`RELEASE_NOT_IMMUTABLE:${target.package_name}`);
    if (ref.invalidation_reason) errors.push(`RELEASE_STALE:${target.package_name}`);
    validateShaIdentity(
      ref.release_evidence_identity,
      `RELEASE_EVIDENCE_IDENTITY_INVALID:${target.package_name}`,
      errors,
    );
  }
}

function validateCompatibilityRefs(unit, errors) {
  const packageChanged = packageSetChanged(unit.package_set_before, unit.package_set_target);
  const contractsChanged = contractSetChanged(unit.contract_set_before, unit.contract_set_target);
  if (!packageChanged && !contractsChanged) return;
  if (!Array.isArray(unit.compatibility_refs) || unit.compatibility_refs.length === 0) {
    errors.push('COMPATIBILITY_REFS_MISSING');
    return;
  }
  const consumer = repositoryShortName(unit.repository);
  for (const ref of unit.compatibility_refs) {
    if (ref?.result !== 'PASS') errors.push('COMPATIBILITY_REF_NOT_PASS');
    if (!['COMPATIBLE', 'COMPATIBLE_CON_RESTRICCIONES'].includes(ref?.relation_state)) {
      errors.push('COMPATIBILITY_RELATION_NOT_SUPPORTED');
    }
    if (ref?.invalidation_reason) errors.push('COMPATIBILITY_REF_STALE');
    if (ref?.environment !== unit.environment) errors.push('COMPATIBILITY_ENVIRONMENT_MISMATCH');
    validateShaIdentity(
      ref?.compatibility_evidence_identity,
      'COMPATIBILITY_EVIDENCE_IDENTITY_INVALID',
      errors,
    );
    if (unit.repository === 'vento-group-sas/vento-anima') {
      if (ref?.relation_source !== 'OWNER_EXTENSION') errors.push('ANIMA_COMPATIBILITY_NOT_OWNER_EXTENSION');
      if (ref?.consumer_repository !== 'vento-anima') errors.push('ANIMA_COMPATIBILITY_CONSUMER_MISMATCH');
      if (ref?.target_class !== 'NATIVE_REACT_NATIVE_EXPO') errors.push('ANIMA_TARGET_CLASS_INVALID');
      if (!nonEmptyString(ref?.owner_contract)) errors.push('ANIMA_OWNER_CONTRACT_MISSING');
      continue;
    }
    if (ref?.gate_instance !== COMPATIBILITY_GATE_INSTANCE_ID) {
      errors.push('COMPATIBILITY_GATE_INVALID');
    }
    if (ref?.consumer_repository !== consumer) errors.push('COMPATIBILITY_CONSUMER_MISMATCH');
    if (ref?.package_name) {
      const relation = relationFor(ref.package_name, consumer);
      if (!relation || relation.relation_identity !== ref.relation_identity) {
        errors.push(`COMPATIBILITY_RELATION_IDENTITY_MISMATCH:${ref.package_name}`);
      }
    }
  }
}

function validateConsumerUpdateRef(unit, errors) {
  if (!packageSetChanged(unit.package_set_before, unit.package_set_target)) return;
  if (unit.repository === 'vento-group-sas/vento-anima') return;
  const ref = unit.consumer_update_ref;
  if (!isPlainObject(ref)) {
    errors.push('CONSUMER_UPDATE_REF_MISSING');
    return;
  }
  if (ref.gate_instance !== CONSUMER_UPDATE_GATE_INSTANCE_ID) errors.push('CONSUMER_UPDATE_GATE_INVALID');
  if (ref.consumer_repository !== repositoryShortName(unit.repository)) {
    errors.push('CONSUMER_UPDATE_REPOSITORY_MISMATCH');
  }
  if (ref.result !== 'PASS') errors.push('CONSUMER_UPDATE_NOT_PASS');
  if (ref.simultaneous_deploy_required === true) errors.push('CONSUMER_UPDATE_REQUIRES_SIMULTANEOUS_DEPLOY');
  if (Array.isArray(ref.blockers) && ref.blockers.includes('PR-BLK-018')) {
    errors.push('CONSUMER_UPDATE_LOCKSTEP_BLOCKED');
  }
  if (ref.invalidation_reason) errors.push('CONSUMER_UPDATE_STALE');
  validateShaIdentity(ref.proposal_identity, 'CONSUMER_UPDATE_IDENTITY_INVALID', errors);
}

function validateBaselineRef(unit, errors) {
  const expected = CONSUMER_BASELINE_GATES[unit.repository] ?? null;
  if (!expected) {
    if (unit.consumer_baseline_ref !== null) errors.push('SHELL_BASELINE_REF_MUST_BE_NULL');
    return;
  }
  const ref = unit.consumer_baseline_ref;
  if (!isPlainObject(ref)) {
    errors.push('CONSUMER_BASELINE_REF_MISSING');
    return;
  }
  if (ref.gate_instance !== expected) errors.push('CONSUMER_BASELINE_GATE_MISMATCH');
  if (ref.consumer_repository !== unit.repository) errors.push('CONSUMER_BASELINE_REPOSITORY_MISMATCH');
  if (ref.environment !== unit.environment) errors.push('CONSUMER_BASELINE_ENVIRONMENT_MISMATCH');
  if (ref.result !== 'PASS') errors.push('CONSUMER_BASELINE_NOT_PASS');
  if (ref.invalidation_reason) errors.push('CONSUMER_BASELINE_STALE');
  validateShaIdentity(ref.execution_identity, 'CONSUMER_BASELINE_IDENTITY_INVALID', errors);
}

function validateRollbackRef(unit, errors) {
  const ref = unit.rollback_ref;
  if (!isPlainObject(ref)) {
    errors.push('ROLLBACK_REF_MISSING');
    return;
  }
  if (ref.gate_instance !== ROLLBACK_GATE_INSTANCE_ID) errors.push('ROLLBACK_GATE_INVALID');
  if (ref.repository !== unit.repository) errors.push('ROLLBACK_REPOSITORY_MISMATCH');
  if (ref.environment !== unit.environment) errors.push('ROLLBACK_ENVIRONMENT_MISMATCH');
  if (ref.result !== 'PASS') errors.push('ROLLBACK_NOT_PASS');
  if (ref.independent !== true) errors.push('ROLLBACK_NOT_INDEPENDENT');
  if (ref.global_rollback_required === true) errors.push('ROLLBACK_GLOBAL_REQUIRED');
  if (ref.invalidation_reason) errors.push('ROLLBACK_REF_STALE');
  validateShaIdentity(ref.rollback_evidence_identity, 'ROLLBACK_EVIDENCE_IDENTITY_INVALID', errors);
}

function validateDatabaseStateRef(unit, errors) {
  const ref = unit.database_state_ref;
  if (!isPlainObject(ref)) {
    errors.push('DATABASE_STATE_REF_MISSING');
    return;
  }
  if (ref.ci015_executes_mutation === true) errors.push('CI015_SUPABASE_MUTATION_FORBIDDEN');
  validateShaIdentity(ref.before_identity, 'DATABASE_BEFORE_IDENTITY_INVALID', errors);
  validateShaIdentity(ref.target_identity, 'DATABASE_TARGET_IDENTITY_INVALID', errors);
  if (ref.affected !== true) return;
  if (ref.owner_repository !== 'vento-group-sas/vento-shell') errors.push('DATABASE_OWNER_REPOSITORY_INVALID');
  if (!/^AUTH-DB-\d{3}$/u.test(String(ref.owner_task ?? ''))) errors.push('DATABASE_OWNER_TASK_INVALID');
  if (ref.result !== 'PASS') errors.push('DATABASE_DEPENDENCY_NOT_PASS');
  if (ref.old_and_new_code_coexist !== true) errors.push('DATABASE_VERSION_SKEW_NOT_SUPPORTED');
  if (ref.destructive_before_consumer_retirement === true) errors.push('DATABASE_DESTRUCTIVE_BEFORE_RETIREMENT');
  if (ref.rollback_required === true && ref.rollback_owner_task !== 'AUTH-DB-029') {
    errors.push('DATABASE_ROLLBACK_OWNER_INVALID');
  }
  validateShaIdentity(ref.evidence_identity, 'DATABASE_EVIDENCE_IDENTITY_INVALID', errors);
}

function validateConfigurationTransition(unit, errors) {
  if (!configurationChanged(unit)) return;
  const transition = unit.configuration_transition;
  if (!isPlainObject(transition)) {
    errors.push('CONFIGURATION_TRANSITION_MISSING');
    return;
  }
  if (transition.versioned !== true) errors.push('CONFIGURATION_NOT_VERSIONED');
  if (transition.environment !== unit.environment) errors.push('CONFIGURATION_ENVIRONMENT_MISMATCH');
  if (transition.opens_bypass === true) errors.push('CONFIGURATION_OPENS_BYPASS');
  if (transition.expands_permissions === true) errors.push('CONFIGURATION_EXPANDS_PERMISSIONS');
  if (transition.contains_secret_values === true) errors.push('CONFIGURATION_CONTAINS_SECRET_VALUES');
  if (transition.result !== 'PASS') errors.push('CONFIGURATION_TRANSITION_NOT_PASS');
  validateShaIdentity(transition.evidence_identity, 'CONFIGURATION_EVIDENCE_IDENTITY_INVALID', errors);
}

function validateValidationSet(value, label, errors) {
  if (!Array.isArray(value) || value.length === 0) {
    errors.push(`${label}_MISSING`);
    return;
  }
  const ids = value.map((entry) => entry?.id).filter(nonEmptyString);
  if (ids.length !== value.length) errors.push(`${label}_ID_MISSING`);
  if (unique(ids).length !== ids.length) errors.push(`${label}_DUPLICATE_ID`);
  if (!value.some((entry) => entry?.required !== false)) errors.push(`${label}_NO_REQUIRED_CHECK`);
}

export function validateDeploymentUnit(unit, { environment, changeRef } = {}) {
  const errors = [];
  if (!isPlainObject(unit)) return ['DEPLOYMENT_UNIT_NOT_OBJECT'];
  for (const field of REQUIRED_DEPLOYMENT_UNIT_FIELDS) {
    if (!Object.hasOwn(unit, field)) errors.push(`DEPLOYMENT_UNIT_FIELD_MISSING:${field}`);
  }
  if (!nonEmptyString(unit.deployment_unit_id)) errors.push('DEPLOYMENT_UNIT_ID_MISSING');
  if (!REPOSITORY_SET.has(unit.repository)) errors.push('REPOSITORY_UNKNOWN');
  if (!nonEmptyString(unit.environment) || unit.environment !== environment) errors.push('ENVIRONMENT_MISMATCH');
  if (!nonEmptyString(unit.owner)) errors.push('UNIT_OWNER_MISSING');
  if (!nonEmptyString(unit.change_ref) || unit.change_ref !== changeRef) errors.push('CHANGE_REF_MISMATCH');
  if (!nonEmptyString(unit.source_branch)) errors.push('SOURCE_BRANCH_MISSING');
  validateCommit(unit.source_commit, 'SOURCE_COMMIT_INVALID', errors);
  validateCommit(unit.target_commit, 'TARGET_COMMIT_INVALID', errors);
  validateShaIdentity(unit.source_artifact, 'SOURCE_ARTIFACT_INVALID', errors);
  validateShaIdentity(unit.target_artifact, 'TARGET_ARTIFACT_INVALID', errors);
  validateShaIdentity(unit.manifest_before_identity, 'MANIFEST_BEFORE_IDENTITY_INVALID', errors);
  validateShaIdentity(unit.manifest_target_identity, 'MANIFEST_TARGET_IDENTITY_INVALID', errors);
  validateShaIdentity(unit.lockfile_before_identity, 'LOCKFILE_BEFORE_IDENTITY_INVALID', errors);
  validateShaIdentity(unit.lockfile_target_identity, 'LOCKFILE_TARGET_IDENTITY_INVALID', errors);
  validateShaIdentity(unit.configuration_before_identity, 'CONFIGURATION_BEFORE_IDENTITY_INVALID', errors);
  validateShaIdentity(unit.configuration_target_identity, 'CONFIGURATION_TARGET_IDENTITY_INVALID', errors);
  validatePackageSet(unit.package_set_before, 'PACKAGE_SET_BEFORE', errors);
  validatePackageSet(unit.package_set_target, 'PACKAGE_SET_TARGET', errors);
  validateContractSet(unit.contract_set_before, 'CONTRACT_SET_BEFORE', errors);
  validateContractSet(unit.contract_set_target, 'CONTRACT_SET_TARGET', errors);
  if (unit.manifest_lock_consistent === false) errors.push('MANIFEST_LOCKFILE_INCONSISTENT');
  if (unit.requires_retired_contract === true) errors.push('TARGET_REQUIRES_RETIRED_CONTRACT');
  if (unit.artificial_release_for_unchanged_package === true) errors.push('ARTIFICIAL_RELEASE_WITHOUT_CHANGE');
  if (!Array.isArray(unit.depends_on_units)) errors.push('DEPENDS_ON_UNITS_NOT_ARRAY');
  if (!RESULT_STATE_SET.has(unit.unit_result)) errors.push('UNIT_RESULT_INVALID');
  if (unit.unit_result !== 'PASS') errors.push('UNIT_NOT_ELIGIBLE');
  validateReleaseRefs(unit, errors);
  validateCompatibilityRefs(unit, errors);
  validateConsumerUpdateRef(unit, errors);
  validateBaselineRef(unit, errors);
  validateRollbackRef(unit, errors);
  validateDatabaseStateRef(unit, errors);
  validateConfigurationTransition(unit, errors);
  validateValidationSet(unit.required_validation_set, 'UNIT_VALIDATION_SET', errors);
  return unique(errors);
}

function stateFromUnit(unit, mode, current = {}) {
  const target = mode === 'target';
  return {
    ...current,
    commit: target ? unit.target_commit : unit.source_commit,
    artifact: target ? unit.target_artifact : unit.source_artifact,
    manifest_identity: target ? unit.manifest_target_identity : unit.manifest_before_identity,
    lockfile_identity: target ? unit.lockfile_target_identity : unit.lockfile_before_identity,
    package_set: target ? normalizePackageSet(unit.package_set_target) : normalizePackageSet(unit.package_set_before),
    contract_set: target ? normalizeContractSet(unit.contract_set_target) : normalizeContractSet(unit.contract_set_before),
    configuration_identity: target
      ? unit.configuration_target_identity
      : unit.configuration_before_identity,
    database_state_identity: target
      ? unit.database_state_ref?.target_identity
      : unit.database_state_ref?.before_identity,
  };
}

function cloneJson(value) {
  return JSON.parse(JSON.stringify(value));
}

export function materializeSystemState(initialSystemState, deploymentUnits, completedUnitIds) {
  const state = cloneJson(initialSystemState ?? {});
  const unitMap = new Map((deploymentUnits ?? []).map((unit) => [unit.deployment_unit_id, unit]));
  for (const unitId of completedUnitIds ?? []) {
    const unit = unitMap.get(unitId);
    if (!unit) throw new Error(`UNKNOWN_DEPLOYMENT_UNIT:${unitId}`);
    state[unit.repository] = stateFromUnit(unit, 'target', state[unit.repository]);
  }
  return canonicalize(state);
}

function validateSystemStateMap(value, label, errors) {
  if (!isPlainObject(value) || Object.keys(value).length === 0) {
    errors.push(`${label}_MISSING`);
    return;
  }
  for (const [repository, state] of Object.entries(value)) {
    if (!REPOSITORY_SET.has(repository)) errors.push(`${label}_REPOSITORY_UNKNOWN:${repository}`);
    if (!isPlainObject(state)) {
      errors.push(`${label}_STATE_INVALID:${repository}`);
      continue;
    }
    validateCommit(state.commit, `${label}_COMMIT_INVALID:${repository}`, errors);
    for (const [field, code] of [
      ['artifact', 'ARTIFACT'],
      ['manifest_identity', 'MANIFEST'],
      ['lockfile_identity', 'LOCKFILE'],
      ['configuration_identity', 'CONFIGURATION'],
      ['database_state_identity', 'DATABASE'],
    ]) {
      validateShaIdentity(state[field], `${label}_${code}_INVALID:${repository}`, errors);
    }
    validatePackageSet(state.package_set, `${label}_PACKAGE_SET:${repository}`, errors);
    validateContractSet(state.contract_set, `${label}_CONTRACT_SET:${repository}`, errors);
  }
}

function validateUnitStateAlignment(initialState, targetState, units, errors) {
  const initialKeys = Object.keys(initialState ?? {}).sort(compareText);
  const targetKeys = Object.keys(targetState ?? {}).sort(compareText);
  if (stableTextArray(initialKeys) !== stableTextArray(targetKeys)) {
    errors.push('SYSTEM_STATE_REPOSITORY_SET_MISMATCH');
    return;
  }
  const unitByRepo = new Map();
  for (const unit of units) {
    if (unitByRepo.has(unit.repository)) errors.push(`MULTIPLE_UNITS_FOR_REPOSITORY:${unit.repository}`);
    unitByRepo.set(unit.repository, unit);
    const sourceExpected = stateFromUnit(unit, 'source', initialState[unit.repository]);
    if (stableCanonicalStringify(sourceExpected) !== stableCanonicalStringify(initialState[unit.repository])) {
      errors.push(`SOURCE_STATE_MISMATCH:${unit.deployment_unit_id}`);
    }
  }
  const expectedTarget = materializeSystemState(initialState, units, units.map((unit) => unit.deployment_unit_id));
  if (stableCanonicalStringify(expectedTarget) !== stableCanonicalStringify(targetState)) {
    errors.push('TARGET_SYSTEM_STATE_MISMATCH');
  }
  for (const repository of initialKeys) {
    if (unitByRepo.has(repository)) continue;
    if (stableCanonicalStringify(initialState[repository]) !== stableCanonicalStringify(targetState[repository])) {
      errors.push(`STATE_CHANGED_WITHOUT_DEPLOYMENT_UNIT:${repository}`);
    }
  }
}

function dependencyKey(edge) {
  return `${edge?.from_unit_id ?? ''}->${edge?.to_unit_id ?? ''}`;
}

function validateDependencyEdges(edges, units, errors) {
  if (!Array.isArray(edges)) {
    errors.push('DEPENDENCY_EDGES_NOT_ARRAY');
    return new Map();
  }
  const ids = new Set(units.map((unit) => unit.deployment_unit_id));
  const seen = new Set();
  const incoming = new Map(units.map((unit) => [unit.deployment_unit_id, []]));
  for (const edge of edges) {
    const key = dependencyKey(edge);
    if (seen.has(key)) errors.push(`DEPENDENCY_EDGE_DUPLICATE:${key}`);
    seen.add(key);
    if (!ids.has(edge?.from_unit_id)) errors.push(`DEPENDENCY_SOURCE_UNKNOWN:${edge?.from_unit_id ?? 'EMPTY'}`);
    if (!ids.has(edge?.to_unit_id)) errors.push(`DEPENDENCY_TARGET_UNKNOWN:${edge?.to_unit_id ?? 'EMPTY'}`);
    if (edge?.from_unit_id === edge?.to_unit_id) errors.push(`DEPENDENCY_SELF_LOOP:${edge?.from_unit_id}`);
    if (!nonEmptyString(edge?.reason)) errors.push(`DEPENDENCY_REASON_MISSING:${key}`);
    validateShaIdentity(edge?.evidence_identity, `DEPENDENCY_EVIDENCE_INVALID:${key}`, errors);
    if (ids.has(edge?.to_unit_id) && ids.has(edge?.from_unit_id)) {
      incoming.get(edge.to_unit_id).push(edge.from_unit_id);
    }
  }
  for (const unit of units) {
    const declared = [...(unit.depends_on_units ?? [])].sort(compareText);
    const derived = [...(incoming.get(unit.deployment_unit_id) ?? [])].sort(compareText);
    if (stableTextArray(declared) !== stableTextArray(derived)) {
      errors.push(`DEPENDS_ON_UNITS_MISMATCH:${unit.deployment_unit_id}`);
    }
  }
  return incoming;
}

function hasDependencyCycle(units, incoming) {
  const remaining = new Set(units.map((unit) => unit.deployment_unit_id));
  const completed = new Set();
  while (remaining.size > 0) {
    const ready = [...remaining]
      .filter((id) => (incoming.get(id) ?? []).every((dependency) => completed.has(dependency)))
      .sort(compareText);
    if (ready.length === 0) return true;
    for (const id of ready) {
      remaining.delete(id);
      completed.add(id);
    }
  }
  return false;
}

function completedKey(completedUnitIds) {
  return [...completedUnitIds].sort(compareText).join('|');
}

function indexStateEvaluations(value, units, environment, initialState, errors) {
  if (!Array.isArray(value)) {
    errors.push('STATE_EVALUATIONS_NOT_ARRAY');
    return new Map();
  }
  const unitIds = new Set(units.map((unit) => unit.deployment_unit_id));
  const index = new Map();
  for (const entry of value) {
    const completed = Array.isArray(entry?.completed_units)
      ? [...entry.completed_units].sort(compareText)
      : [];
    const key = completedKey(completed);
    if (index.has(key)) errors.push(`STATE_EVALUATION_DUPLICATE:${key || 'INITIAL'}`);
    if (unique(completed).length !== completed.length) errors.push(`STATE_EVALUATION_DUPLICATE_UNIT:${key}`);
    for (const id of completed) {
      if (!unitIds.has(id)) errors.push(`STATE_EVALUATION_UNKNOWN_UNIT:${id}`);
    }
    if (entry?.environment !== environment) errors.push(`STATE_EVALUATION_ENVIRONMENT_MISMATCH:${key}`);
    const expectedState = materializeSystemState(initialState, units, completed);
    const expectedIdentity = deploymentIdentity(expectedState);
    if (entry?.state_identity !== expectedIdentity) errors.push(`STATE_IDENTITY_MISMATCH:${key}`);
    index.set(key, { ...entry, completed_units: completed, expected_state: expectedState });
  }
  return index;
}

function stateEvaluationErrors(entry, validationSet) {
  const errors = [];
  if (!entry) return ['STATE_EVALUATION_MISSING'];
  if (entry.result !== 'PASS') errors.push('STATE_NOT_PASS');
  if (entry.invalidation_reason) errors.push('STATE_EVIDENCE_STALE');
  if (entry.compatibility_valid !== true) errors.push('STATE_COMPATIBILITY_NOT_VALID');
  if (entry.baseline_valid !== true) errors.push('STATE_BASELINE_NOT_VALID');
  if (entry.rollback_available !== true) errors.push('STATE_ROLLBACK_NOT_AVAILABLE');
  if (entry.database_compatible !== true) errors.push('STATE_DATABASE_NOT_COMPATIBLE');
  if (entry.configuration_compatible !== true) errors.push('STATE_CONFIGURATION_NOT_COMPATIBLE');
  const supportWindow = entry.support_window;
  if (!isPlainObject(supportWindow) || supportWindow.valid !== true || supportWindow.current !== true) {
    errors.push('STATE_SUPPORT_WINDOW_NOT_VALID');
  } else {
    if (supportWindow.synthetic_seconds_only === true) errors.push('STATE_SUPPORT_WINDOW_SECONDS_ONLY');
    if (!nonEmptyString(supportWindow.exit_condition)) errors.push('STATE_SUPPORT_WINDOW_EXIT_CONDITION_MISSING');
    validateShaIdentity(supportWindow.evidence_identity, 'STATE_SUPPORT_WINDOW_EVIDENCE_INVALID', errors);
  }
  if (!Array.isArray(entry.evidence_refs) || entry.evidence_refs.length === 0) {
    errors.push('STATE_EVIDENCE_REFS_MISSING');
  } else {
    for (const ref of entry.evidence_refs) validateShaIdentity(ref, 'STATE_EVIDENCE_REF_INVALID', errors);
  }
  if (!Array.isArray(entry.validation_results)) {
    errors.push('STATE_VALIDATION_RESULTS_MISSING');
  } else {
    const byId = new Map(entry.validation_results.map((result) => [result?.id, result]));
    for (const required of validationSet.filter((check) => check?.required !== false)) {
      const result = byId.get(required.id);
      if (!result) errors.push(`STATE_VALIDATION_MISSING:${required.id}`);
      else if (result.status !== 'PASS') errors.push(`STATE_VALIDATION_NOT_PASS:${required.id}`);
      else if (!Number.isInteger(result.executed_count) || result.executed_count < 1) {
        errors.push(`STATE_VALIDATION_ZERO_EXECUTIONS:${required.id}`);
      }
    }
  }
  return unique(errors);
}

function availableUnits(units, incoming, completed) {
  return units
    .map((unit) => unit.deployment_unit_id)
    .filter((id) => !completed.has(id))
    .filter((id) => (incoming.get(id) ?? []).every((dependency) => completed.has(dependency)))
    .sort(compareText);
}

function countSafeOrders(units, incoming, stateIndex, validationSet) {
  const memo = new Map();
  function visit(completed) {
    const key = completedKey(completed);
    if (memo.has(key)) return memo.get(key);
    if (completed.size === units.length) return 1;
    let total = 0;
    for (const next of availableUnits(units, incoming, completed)) {
      const nextCompleted = new Set(completed);
      nextCompleted.add(next);
      const state = stateIndex.get(completedKey(nextCompleted));
      if (stateEvaluationErrors(state, validationSet).length > 0) continue;
      total += visit(nextCompleted);
    }
    memo.set(key, total);
    return total;
  }
  return visit(new Set());
}

function collectSafeOrders(units, incoming, stateIndex, validationSet, limit = 128) {
  const orders = [];
  function walk(completed, order) {
    if (orders.length >= limit) return;
    if (completed.size === units.length) {
      orders.push([...order]);
      return;
    }
    for (const next of availableUnits(units, incoming, completed)) {
      const nextCompleted = new Set(completed);
      nextCompleted.add(next);
      const state = stateIndex.get(completedKey(nextCompleted));
      if (stateEvaluationErrors(state, validationSet).length > 0) continue;
      walk(nextCompleted, [...order, next]);
      if (orders.length >= limit) return;
    }
  }
  walk(new Set(), []);
  return orders;
}

function factorial(value) {
  let result = 1;
  for (let index = 2; index <= value; index += 1) result *= index;
  return result;
}

function allSubsetsSupported(units, stateIndex, validationSet) {
  const ids = units.map((unit) => unit.deployment_unit_id).sort(compareText);
  for (let mask = 0; mask < (1 << ids.length); mask += 1) {
    const subset = ids.filter((_, index) => (mask & (1 << index)) !== 0);
    const state = stateIndex.get(completedKey(subset));
    if (stateEvaluationErrors(state, validationSet).length > 0) return false;
  }
  return true;
}

function selectedIntermediateStates(selectedOrder, stateIndex) {
  const states = [];
  const completed = [];
  states.push(stateIndex.get(''));
  for (const unitId of selectedOrder) {
    completed.push(unitId);
    states.push(stateIndex.get(completedKey(completed)));
  }
  return states.map((entry) => ({
    completed_units: entry.completed_units,
    state_identity: entry.state_identity,
    result: entry.result,
    support_window: entry.support_window,
    evidence_refs: entry.evidence_refs,
  }));
}

function aggregateRefs(units, field) {
  return units.flatMap((unit) => {
    const value = unit[field];
    if (Array.isArray(value)) return value;
    if (value === null || value === undefined) return [];
    return [value];
  });
}

function validateEnvironmentRef(input, errors) {
  const ref = input.environment_ref;
  if (!isPlainObject(ref)) {
    errors.push('ENVIRONMENT_REF_MISSING');
    return;
  }
  if (ref.environment !== input.environment) errors.push('ENVIRONMENT_REF_MISMATCH');
  if (ref.known !== true) errors.push('ENVIRONMENT_UNKNOWN');
  if (!Array.isArray(ref.repository_scope) || ref.repository_scope.length === 0) {
    errors.push('ENVIRONMENT_REPOSITORY_SCOPE_MISSING');
  }
  validateShaIdentity(ref.evidence_identity, 'ENVIRONMENT_EVIDENCE_IDENTITY_INVALID', errors);
}

function validateGlobalProhibitions(input, errors) {
  if (input.simultaneous_deploy_required === true) errors.push('SIMULTANEOUS_DEPLOY_REQUIRED');
  if (input.coordination_as_safety_property === true) errors.push('COORDINATION_USED_AS_SAFETY_PROPERTY');
  if (input.deploy_all_unit === true) errors.push('DEPLOY_ALL_NOT_A_DEPLOYMENT_UNIT');
  if (input.global_repository_lock_required === true) errors.push('GLOBAL_REPOSITORY_LOCK_FORBIDDEN');
  if (nonEmptyString(input.global_tag_identity)) errors.push('GLOBAL_TAG_IDENTITY_FORBIDDEN');
  if (input.atomicity_claim === 'SAME_TIMESTAMP') errors.push('TIMESTAMP_ATOMICITY_CLAIM_FORBIDDEN');
  if (input.coordination_policy === 'COORDINATED_RELEASE_IMPLIES_DEPLOY') {
    errors.push('COORDINATED_RELEASE_DOES_NOT_REQUIRE_COORDINATED_DEPLOY');
  }
  if (input.assume_instant_anima_update === true) errors.push('ANIMA_INSTANT_UPDATE_ASSUMPTION_FORBIDDEN');
  if (input.anima_classification === 'WEB') errors.push('ANIMA_WEB_CLASSIFICATION_FORBIDDEN');
  if (input.recovery_strategy === 'ROLLBACK_ALL') errors.push('IMPLICIT_GLOBAL_ROLLBACK_FORBIDDEN');
  if (input.mutate_historical_release === true) errors.push('HISTORICAL_RELEASE_MUTATION_FORBIDDEN');
  if (input.synthetic_fixture_uses_production_data === true) errors.push('PRODUCTION_DATA_FIXTURE_FORBIDDEN');
  if (Array.isArray(input.automation_capabilities)) {
    for (const capability of input.automation_capabilities) {
      if (FORBIDDEN_AUTOMATION_CAPABILITIES.has(capability)) {
        errors.push(`FORBIDDEN_AUTOMATION_CAPABILITY:${capability}`);
      }
    }
  }
  if (!Array.isArray(input.independence_basis)
    || !input.independence_basis.includes('INTERMEDIATE_STATE_COMPATIBILITY')) {
    errors.push('INDEPENDENCE_BASIS_INSUFFICIENT');
  }
}

function validateAnimaCompatibility(input, errors) {
  if (input.anima_in_scope !== true) return;
  const ref = input.anima_compatibility_ref;
  if (!isPlainObject(ref)) {
    errors.push('ANIMA_COMPATIBILITY_REF_MISSING');
    return;
  }
  if (ref.repository !== 'vento-group-sas/vento-anima') errors.push('ANIMA_COMPATIBILITY_REPOSITORY_INVALID');
  if (ref.target_class !== 'NATIVE_REACT_NATIVE_EXPO') errors.push('ANIMA_COMPATIBILITY_TARGET_CLASS_INVALID');
  if (ref.result !== 'PASS') errors.push('ANIMA_COMPATIBILITY_NOT_PASS');
  if (ref.instant_update_required === true) errors.push('ANIMA_COMPATIBILITY_REQUIRES_INSTANT_UPDATE');
  validateShaIdentity(ref.evidence_identity, 'ANIMA_COMPATIBILITY_EVIDENCE_INVALID', errors);
}

function validateFailureRecoveryRef(input, errors) {
  if (!input.failure_recovery_ref) return;
  const ref = input.failure_recovery_ref;
  if (!isPlainObject(ref)) {
    errors.push('FAILURE_RECOVERY_REF_INVALID');
    return;
  }
  if (ref.gate_instance !== ROLLBACK_GATE_INSTANCE_ID) errors.push('FAILURE_RECOVERY_GATE_INVALID');
  if (ref.result !== 'PASS') errors.push('FAILURE_RECOVERY_NOT_PASS');
  if (ref.scope !== 'UNIT') errors.push('FAILURE_RECOVERY_SCOPE_NOT_UNIT');
  if (ref.global_rollback === true) errors.push('FAILURE_RECOVERY_GLOBAL_ROLLBACK_FORBIDDEN');
  validateShaIdentity(ref.evidence_identity, 'FAILURE_RECOVERY_EVIDENCE_INVALID', errors);
}

function buildBlockedResult(reasons, classification = null) {
  return {
    schema_version: DEPLOYMENT_INDEPENDENCE_SCHEMA_VERSION,
    gate_instance: DEPLOYMENT_INDEPENDENCE_GATE_INSTANCE_ID,
    phase: 'EVALUATE',
    result: 'BLOCKED',
    classification,
    reasons: unique(reasons),
    plan_identity: null,
    record: null,
  };
}

export function validatePlanRecord(record) {
  const errors = [];
  if (!isPlainObject(record)) return ['PLAN_RECORD_NOT_OBJECT'];
  for (const field of REQUIRED_PLAN_RECORD_FIELDS) {
    if (!Object.hasOwn(record, field)) errors.push(`PLAN_RECORD_FIELD_MISSING:${field}`);
  }
  if (!RESULT_STATE_SET.has(record.result)) errors.push('PLAN_RECORD_RESULT_INVALID');
  if (!PLAN_CLASSIFICATIONS.includes(record.classification)) errors.push('PLAN_RECORD_CLASSIFICATION_INVALID');
  return unique(errors);
}

export function evaluateDeploymentIndependence(input) {
  const errors = [];
  if (!isPlainObject(input)) return buildBlockedResult(['INPUT_NOT_OBJECT']);
  if (input.schema_version !== DEPLOYMENT_INDEPENDENCE_SCHEMA_VERSION) errors.push('SCHEMA_VERSION_UNSUPPORTED');
  if (!['SYNTHETIC', 'EVALUATION_ONLY'].includes(input.execution_mode)) errors.push('EXECUTION_MODE_INVALID');
  if (!nonEmptyString(input.deployment_independence_id)) errors.push('DEPLOYMENT_INDEPENDENCE_ID_MISSING');
  if (!nonEmptyString(input.environment)) errors.push('ENVIRONMENT_MISSING');
  if (!nonEmptyString(input.change_ref)) errors.push('CHANGE_REF_MISSING');
  if (!nonEmptyString(input.requested_by)) errors.push('REQUESTED_BY_MISSING');
  if (!nonEmptyString(input.approved_by)) errors.push('APPROVED_BY_MISSING');
  validateIso(input.started_at, 'STARTED_AT_INVALID', errors);
  validateIso(input.completed_at, 'COMPLETED_AT_INVALID', errors);
  validateEnvironmentRef(input, errors);
  validateGlobalProhibitions(input, errors);
  validateAnimaCompatibility(input, errors);
  validateFailureRecoveryRef(input, errors);
  errors.push(...validateNoSensitiveData(input));
  validateValidationSet(input.validation_set, 'PLAN_VALIDATION_SET', errors);

  if (!Array.isArray(input.deployment_units) || input.deployment_units.length === 0) {
    errors.push('DEPLOYMENT_UNITS_MISSING');
  }
  const units = Array.isArray(input.deployment_units) ? input.deployment_units : [];
  if (units.length > CANONICAL_REPOSITORIES.length) errors.push('DEPLOYMENT_UNIT_CARDINALITY_EXCEEDED');
  const unitIds = units.map((unit) => unit?.deployment_unit_id).filter(nonEmptyString);
  if (unique(unitIds).length !== unitIds.length) errors.push('DEPLOYMENT_UNIT_ID_DUPLICATE');
  for (const unit of units) {
    errors.push(...validateDeploymentUnit(unit, {
      environment: input.environment,
      changeRef: input.change_ref,
    }).map((error) => `${unit?.deployment_unit_id ?? 'UNKNOWN'}:${error}`));
  }

  validateSystemStateMap(input.initial_system_state, 'INITIAL_SYSTEM_STATE', errors);
  validateSystemStateMap(input.target_system_state, 'TARGET_SYSTEM_STATE', errors);
  if (isPlainObject(input.initial_system_state) && isPlainObject(input.target_system_state)) {
    validateUnitStateAlignment(input.initial_system_state, input.target_system_state, units, errors);
  }

  const incoming = validateDependencyEdges(input.dependency_edges, units, errors);
  if (hasDependencyCycle(units, incoming)) {
    errors.push('DEPENDENCY_CYCLE_LOCKSTEP');
  }

  const stateIndex = indexStateEvaluations(
    input.state_evaluations,
    units,
    input.environment,
    input.initial_system_state,
    errors,
  );
  const initialStateErrors = stateEvaluationErrors(stateIndex.get(''), input.validation_set ?? []);
  if (initialStateErrors.length > 0) {
    errors.push(...initialStateErrors.map((error) => `INITIAL_STATE:${error}`));
  }

  if (errors.length > 0) {
    const lockstep = errors.some((error) => error === 'DEPENDENCY_CYCLE_LOCKSTEP');
    return buildBlockedResult(errors, lockstep ? 'BLOCKED_LOCKSTEP' : null);
  }

  const safeOrderCount = countSafeOrders(units, incoming, stateIndex, input.validation_set);
  const candidateOrders = collectSafeOrders(units, incoming, stateIndex, input.validation_set);
  if (safeOrderCount === 0 || candidateOrders.length === 0) {
    return buildBlockedResult(['NO_SAFE_SEQUENTIAL_ORDER'], 'BLOCKED_LOCKSTEP');
  }

  const selectedOrder = candidateOrders[0];
  const noEdges = input.dependency_edges.length === 0;
  const allSubsetsPass = noEdges && allSubsetsSupported(units, stateIndex, input.validation_set);
  let classification = 'ORDERED';
  if (units.length === 1) classification = 'SINGLE_REPOSITORY';
  else if (allSubsetsPass && safeOrderCount === factorial(units.length)) classification = 'ANY_ORDER';

  const intermediateStates = selectedIntermediateStates(selectedOrder, stateIndex);
  const finalStateErrors = intermediateStates.flatMap((state, index) => (
    stateEvaluationErrors(stateIndex.get(completedKey(state.completed_units)), input.validation_set)
      .map((error) => `SELECTED_STATE_${index}:${error}`)
  ));
  if (finalStateErrors.length > 0) return buildBlockedResult(finalStateErrors, 'BLOCKED_LOCKSTEP');

  const evidenceRefs = unique(
    intermediateStates.flatMap((state) => state.evidence_refs ?? []),
  ).sort(compareText);
  const record = {
    deployment_independence_id: input.deployment_independence_id,
    environment: input.environment,
    change_ref: input.change_ref,
    requested_by: input.requested_by,
    approved_by: input.approved_by,
    initial_system_state_identity: deploymentIdentity(input.initial_system_state),
    target_system_state_identity: deploymentIdentity(input.target_system_state),
    deployment_units: units,
    dependency_edges: input.dependency_edges,
    candidate_orders: candidateOrders,
    candidate_order_count: safeOrderCount,
    selected_order: selectedOrder,
    intermediate_states: intermediateStates,
    compatibility_evidence: aggregateRefs(units, 'compatibility_refs'),
    baseline_evidence: aggregateRefs(units, 'consumer_baseline_ref'),
    rollback_evidence: aggregateRefs(units, 'rollback_ref'),
    database_dependency_evidence: aggregateRefs(units, 'database_state_ref'),
    configuration_evidence: aggregateRefs(units, 'configuration_transition'),
    validation_set: input.validation_set,
    started_at: input.started_at,
    completed_at: input.completed_at,
    result: 'PASS',
    classification,
    invalidation_reason: null,
    evidence_refs: evidenceRefs,
    gate_implementation_identity: implementationIdentity(),
    automation_effects: Object.freeze({
      merge: false,
      deploy: false,
      rollback: false,
      supabase_mutation: false,
      release_mutation: false,
    }),
  };
  const recordErrors = validatePlanRecord(record);
  if (recordErrors.length > 0) return buildBlockedResult(recordErrors);
  const material = {
    schema_version: DEPLOYMENT_INDEPENDENCE_SCHEMA_VERSION,
    gate_instance: DEPLOYMENT_INDEPENDENCE_GATE_INSTANCE_ID,
    record,
  };
  return {
    schema_version: DEPLOYMENT_INDEPENDENCE_SCHEMA_VERSION,
    gate_instance: DEPLOYMENT_INDEPENDENCE_GATE_INSTANCE_ID,
    phase: 'EVALUATE',
    result: 'PASS',
    classification,
    reasons: [],
    plan_identity: deploymentIdentity(material),
    record,
  };
}

export function comparePreparedIndependencePlan(previous, currentInput) {
  if (
    previous?.result !== 'PASS'
    || !SHA256_PATTERN.test(String(previous?.plan_identity ?? ''))
  ) {
    return { current: false, outcome: 'STALE', reasons: ['PREVIOUS_PLAN_INVALID'], evaluated: null };
  }
  const evaluated = evaluateDeploymentIndependence(currentInput);
  if (evaluated.result !== 'PASS') {
    return { current: false, outcome: 'STALE', reasons: evaluated.reasons, evaluated };
  }
  if (evaluated.plan_identity !== previous.plan_identity) {
    return { current: false, outcome: 'STALE', reasons: ['MATERIAL_INPUT_CHANGED'], evaluated };
  }
  return { current: true, outcome: 'PASS', reasons: [], evaluated };
}

function evidenceIdentity(evidence) {
  if (evidence?.result === 'PASS') return evidence.plan_identity;
  return null;
}

export function appendIndependenceHistory(history, evidence) {
  const current = Array.isArray(history) ? [...history] : [];
  const identity = evidenceIdentity(evidence);
  if (!identity) return { history: current, appended: false };
  if (current.some((entry) => evidenceIdentity(entry) === identity)) {
    return { history: current, appended: false };
  }
  return { history: [...current, evidence], appended: true };
}

function sanitizeFilename(value) {
  return String(value ?? 'evidence').replace(/[^A-Za-z0-9._-]+/gu, '_');
}

export function writeRuntimeEvidence(evidence, {
  repositoryRoot = process.cwd(),
  evidenceRoot = null,
} = {}) {
  const sensitive = validateNoSensitiveData(evidence);
  if (sensitive.length > 0) throw new Error(`Sensitive data rejected: ${sensitive.join(', ')}`);
  const identity = evidenceIdentity(evidence) ?? deploymentIdentity(evidence);
  const digest = identity.replace(/^sha256:/u, '');
  const root = evidenceRoot
    ? path.resolve(repositoryRoot, evidenceRoot)
    : path.resolve(repositoryRoot, RUNTIME_EVIDENCE_RELATIVE_ROOT);
  fs.mkdirSync(root, { recursive: true });
  const filename = `${sanitizeFilename(evidence?.record?.deployment_independence_id ?? 'ci015')}-${digest}.json`;
  const filePath = path.join(root, filename);
  fs.writeFileSync(filePath, `${JSON.stringify(evidence, null, 2)}\n`, 'utf8');
  return filePath;
}

function parseArgs(argv) {
  const args = {
    command: null,
    input: null,
    previous: null,
    json: false,
    writeEvidence: false,
  };
  for (let index = 0; index < argv.length; index += 1) {
    const token = argv[index];
    if (!args.command && !token.startsWith('--')) {
      args.command = token;
      continue;
    }
    if (token === '--json') {
      args.json = true;
      continue;
    }
    if (token === '--write-evidence') {
      args.writeEvidence = true;
      continue;
    }
    if (token === '--input' || token === '--previous') {
      const value = argv[index + 1];
      if (!value || value.startsWith('--')) throw new Error(`Missing value for ${token}`);
      args[token.slice(2)] = value;
      index += 1;
      continue;
    }
    throw new Error(`Unknown argument: ${token}`);
  }
  return args;
}

function readJson(filePath, label) {
  if (!filePath) throw new Error(`${label} path is required.`);
  return JSON.parse(fs.readFileSync(path.resolve(filePath), 'utf8'));
}

function printUsage() {
  console.log(`Usage:\n  node ${IMPLEMENTATION_RELATIVE_PATH} evaluate --input <json> [--json] [--write-evidence]\n  node ${IMPLEMENTATION_RELATIVE_PATH} compare --previous <json> --input <json> [--json]`);
}

export function main(argv = process.argv.slice(2)) {
  const args = parseArgs(argv);
  if (!args.command || args.command === 'help' || args.command === '--help') {
    printUsage();
    return null;
  }
  let result;
  if (args.command === 'evaluate') {
    result = evaluateDeploymentIndependence(readJson(args.input, 'input'));
    if (args.writeEvidence && result.result === 'PASS') writeRuntimeEvidence(result);
  } else if (args.command === 'compare') {
    result = comparePreparedIndependencePlan(
      readJson(args.previous, 'previous'),
      readJson(args.input, 'input'),
    );
  } else {
    throw new Error(`Unknown command: ${args.command}`);
  }
  if (args.json) console.log(JSON.stringify(result, null, 2));
  else console.log(`${DEPLOYMENT_INDEPENDENCE_GATE_INSTANCE_ID} ${result.result ?? result.outcome}`);
  if (!['PASS'].includes(result.result ?? result.outcome)) process.exitCode = 1;
  return result;
}

if (process.argv[1] && path.resolve(process.argv[1]) === fileURLToPath(import.meta.url)) {
  main();
}