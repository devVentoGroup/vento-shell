import { createHash } from 'node:crypto';
import fs from 'node:fs';
import path from 'node:path';
import { fileURLToPath } from 'node:url';

import { RELEASE_GATE_INSTANCE_ID } from './shared-package-release-gate.mjs';
import {
  COMPATIBILITY_GATE_INSTANCE_ID,
} from './shared-package-compatibility-gate.mjs';
import {
  CANONICAL_SHARED_PACKAGES,
  CANONICAL_WEB_CONSUMERS as CI006_WEB_CONSUMERS,
  CONSUMER_UPDATE_GATE_INSTANCE_ID,
  UPDATE_CLASSES,
} from './shared-package-consumer-update-gate.mjs';

export const ROLLBACK_GATE_INSTANCE_ID = 'SHELL-CI-014::GLOBAL';
export const ROLLBACK_SCHEMA_VERSION = 1;
export const IMPLEMENTATION_FILENAME = 'repository-rollback-gate.mjs';
export const IMPLEMENTATION_RELATIVE_PATH = `scripts/quality/${IMPLEMENTATION_FILENAME}`;
export const RUNTIME_EVIDENCE_RELATIVE_ROOT = '.delivery/repository-rollback';

export const CANONICAL_REPOSITORIES = Object.freeze([
  'devVentoGroup/vento-shell',
  'devVentoGroup/vento-nexo',
  'devVentoGroup/vento-fogo',
  'devVentoGroup/vento-origo',
  'devVentoGroup/vento-pulso',
  'devVentoGroup/vento-viso',
  'devVentoGroup/vento-numera',
  'devVentoGroup/vento-anima',
]);

export const ROLLBACK_CLASSES = Object.freeze([
  'REPOSITORY_CODE',
  'PACKAGE_ADOPTION',
  'CONTRACT_COMPATIBILITY',
  'CONFIGURATION',
  'CACHE',
  'DATABASE_DEPENDENCY',
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

export const ROLLBACK_TRIGGERS = Object.freeze([
  'FUNCTIONAL_REGRESSION',
  'PACKAGE_INCOMPATIBILITY',
  'DEPLOYMENT_ERROR',
  'SECURITY_INCIDENT',
  'CONFIGURATION_ERROR',
  'PERFORMANCE_DEGRADATION',
  'OPERATIONAL_FAILURE',
  'DEPRECATION_RETIREMENT_ERROR',
  'HUMAN_CONTINGENCY_DECISION',
]);

export const CACHE_STRATEGIES = Object.freeze([
  'INVALIDATE_ALL',
  'INVALIDATE_SELECTIVE',
  'REBUILD_FROM_AUTHORITY',
  'BUMP_NAMESPACE',
  'RESTORE_VERSIONED_NON_AUTHORITATIVE_SNAPSHOT',
  'NOT_APPLICABLE',
]);

export const SECRET_STRATEGIES = Object.freeze([
  'KEEP_CURRENT',
  'ROTATE_AND_KEEP_ROTATED',
  'NOT_APPLICABLE',
]);

export const ALLOWED_PLANNED_ACTIONS = Object.freeze([
  'DEPLOY_IMMUTABLE_ARTIFACT',
  'CREATE_REVERT_PROPOSAL',
  'RESTORE_EXACT_PACKAGE_SET_VIA_REVIEWED_PR',
  'RESTORE_VERSIONED_CONFIGURATION',
  'INVALIDATE_CACHE',
  'REBUILD_CACHE',
  'BUMP_CACHE_NAMESPACE',
  'DELEGATE_DATABASE_CHANGE_TO_AUTH_DB_029',
  'NO_DATABASE_CHANGE',
]);

export const FORBIDDEN_ACTIONS = Object.freeze([
  'FORCE_PUSH',
  'MOVE_HISTORICAL_TAG',
  'MUTATE_RELEASE',
  'UNPUBLISH_RELEASE',
  'AUTO_MERGE',
  'AUTO_DEPLOY',
  'WRITE_PROTECTED_BRANCH',
  'MODIFY_BRANCH_PROTECTION',
  'SUPABASE_MUTATION_BY_CONSUMER',
  'EXECUTE_DOWN_MIGRATION',
  'RESTORE_REVOKED_SECRET',
  'REWRITE_HISTORY',
  'ROLLBACK_ALL',
]);

export const REQUIRED_ROLLBACK_RECORD_FIELDS = Object.freeze([
  'rollback_execution_id',
  'repository',
  'environment',
  'trigger',
  'incident_ref',
  'requested_by',
  'approved_by',
  'source_branch',
  'rollback_from_commit',
  'rollback_from_artifact',
  'rollback_to_commit',
  'rollback_to_artifact',
  'manifest_before_identity',
  'manifest_target_identity',
  'lockfile_before_identity',
  'lockfile_target_identity',
  'package_set_before',
  'package_set_target',
  'compatibility_refs',
  'consumer_baseline_ref',
  'database_state_ref',
  'configuration_before_identity',
  'configuration_target_identity',
  'cache_strategy',
  'secret_strategy',
  'data_impact',
  'supabase_impact',
  'required_validation_set',
  'execution_started_at',
  'execution_completed_at',
  'result',
  'post_rollback_verification',
  'invalidation_reason',
]);

export const CONSUMER_BASELINE_GATES = Object.freeze({
  'devVentoGroup/vento-nexo': 'SHELL-CI-007::GLOBAL',
  'devVentoGroup/vento-fogo': 'SHELL-CI-008::GLOBAL',
  'devVentoGroup/vento-origo': 'SHELL-CI-009::GLOBAL',
  'devVentoGroup/vento-pulso': 'SHELL-CI-010::GLOBAL',
  'devVentoGroup/vento-viso': 'SHELL-CI-011::GLOBAL',
  'devVentoGroup/vento-numera': 'SHELL-CI-012::GLOBAL',
  'devVentoGroup/vento-anima': 'SHELL-CI-013::GLOBAL',
});

const CI006_WEB_REPOSITORIES = new Set(
  CI006_WEB_CONSUMERS.map((name) => `devVentoGroup/${name}`),
);
for (const repository of CANONICAL_REPOSITORIES.filter(
  (entry) => entry !== 'devVentoGroup/vento-anima',
)) {
  if (!CI006_WEB_REPOSITORIES.has(repository)) {
    throw new Error(`CI006_CONSUMER_UNIVERSE_DRIFT:${repository}`);
  }
}
if (!UPDATE_CLASSES.includes('ROLLBACK_UPDATE')) {
  throw new Error('CI006_ROLLBACK_UPDATE_CLASS_MISSING');
}

const ROLLBACK_CLASS_SET = new Set(ROLLBACK_CLASSES);
const RESULT_STATE_SET = new Set(RESULT_STATES);
const TRIGGER_SET = new Set(ROLLBACK_TRIGGERS);
const CACHE_STRATEGY_SET = new Set(CACHE_STRATEGIES);
const SECRET_STRATEGY_SET = new Set(SECRET_STRATEGIES);
const ALLOWED_ACTION_SET = new Set(ALLOWED_PLANNED_ACTIONS);
const FORBIDDEN_ACTION_SET = new Set(FORBIDDEN_ACTIONS);
const CANONICAL_REPOSITORY_SET = new Set(CANONICAL_REPOSITORIES);
const CANONICAL_PACKAGE_SET = new Set(CANONICAL_SHARED_PACKAGES);
const COMMIT_PATTERN = /^[0-9a-f]{40}$/u;
const SHA256_IDENTITY_PATTERN = /^sha256:[0-9a-f]{64}$/u;
const EXACT_SEMVER_PATTERN = /^\d+\.\d+\.\d+(?:-[0-9A-Za-z]+(?:[.-][0-9A-Za-z]+)*)?$/u;
const HARD_SECRET_PATTERNS = Object.freeze([
  /\bgh[pousr]_[A-Za-z0-9_]{24,}\b/u,
  /\bAKIA[0-9A-Z]{16}\b/u,
  /\bsk_(?:live|test)_[A-Za-z0-9]{20,}\b/u,
  /-----BEGIN (?:RSA |EC |OPENSSH )?PRIVATE KEY-----/u,
  /\b(?:password|token|api[_-]?key|private[_-]?key|service[_-]?role|secret[_-]?(?:value|key|token|credential))\s*[:=]\s*["']?[^\s"']{8,}/iu,
]);
const SENSITIVE_KEY_PATTERN = /(?:^|[_-])(?:password|token|credential|api[_-]?key|private[_-]?key|service[_-]?role|secret[_-]?(?:value|key|token|credential))(?:$|[_-])/iu;
const ALLOWED_SENSITIVE_METADATA_KEYS = new Set(['secret_strategy']);

function nonEmptyString(value) {
  return typeof value === 'string' && value.trim().length > 0;
}

function isPlainObject(value) {
  return value !== null && typeof value === 'object' && !Array.isArray(value);
}

function compareText(left, right) {
  const a = String(left);
  const b = String(right);
  if (a < b) return -1;
  if (a > b) return 1;
  return 0;
}

function unique(values) {
  return [...new Set(values)];
}

function normalizeLf(value) {
  return String(value ?? '').replace(/\r\n?/gu, '\n');
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

export function rollbackIdentity(value) {
  return `sha256:${createHash('sha256').update(stableCanonicalStringify(value)).digest('hex')}`;
}

function implementationIdentity() {
  return `sha256:${createHash('sha256')
    .update(fs.readFileSync(fileURLToPath(import.meta.url)))
    .digest('hex')}`;
}

function normalizeRepositoryRef(value) {
  if (!nonEmptyString(value)) return null;
  const trimmed = value.trim();
  if (trimmed.startsWith('devVentoGroup/')) return trimmed;
  return `devVentoGroup/${trimmed}`;
}

function repositoryShortName(repository) {
  return String(repository ?? '').split('/').at(-1) ?? '';
}

function sensitiveFindings(value, pointer = '$', findings = []) {
  if (Array.isArray(value)) {
    value.forEach((child, index) => sensitiveFindings(child, `${pointer}[${index}]`, findings));
    return findings;
  }
  if (isPlainObject(value)) {
    for (const [key, child] of Object.entries(value)) {
      const childPointer = `${pointer}.${key}`;
      if (
        !ALLOWED_SENSITIVE_METADATA_KEYS.has(key)
        && SENSITIVE_KEY_PATTERN.test(key)
        && child !== null
        && child !== undefined
        && String(child).length > 0
      ) {
        findings.push(childPointer);
      }
      sensitiveFindings(child, childPointer, findings);
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
  return sensitiveFindings(value).map((pointer) => `SENSITIVE_DATA:${pointer}`);
}

function validateShaIdentity(value, code, errors, { optional = false } = {}) {
  if ((value === null || value === undefined || value === '') && optional) return;
  if (!SHA256_IDENTITY_PATTERN.test(String(value ?? ''))) errors.push(code);
}

function validateCommit(value, code, errors) {
  if (!COMMIT_PATTERN.test(String(value ?? ''))) errors.push(code);
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
    if (!CANONICAL_PACKAGE_SET.has(entry.package_name)) {
      errors.push(`${label}_PACKAGE_NOT_CANONICAL:${entry.package_name || 'EMPTY'}`);
    }
    if (!EXACT_SEMVER_PATTERN.test(entry.version)) {
      errors.push(`${label}_VERSION_NOT_EXACT:${entry.package_name || 'EMPTY'}`);
    }
  }
  return normalized;
}

function packageSetsEqual(left, right) {
  return stableCanonicalStringify(normalizePackageSet(left))
    === stableCanonicalStringify(normalizePackageSet(right));
}

function normalizeValidationSet(value) {
  if (!Array.isArray(value)) return [];
  return value.map((entry) => ({
    id: String(entry?.id ?? '').trim(),
    kind: String(entry?.kind ?? 'CHECK').trim(),
    required: entry?.required !== false,
  }));
}

function validateRequiredValidationSet(value, errors) {
  if (!Array.isArray(value)) {
    errors.push('VALIDATION_SET_NOT_ARRAY');
    return [];
  }
  const normalized = normalizeValidationSet(value);
  if (normalized.length === 0) errors.push('VALIDATION_SET_EMPTY');
  const ids = normalized.map((entry) => entry.id);
  if (unique(ids).length !== ids.length) errors.push('VALIDATION_SET_DUPLICATE_ID');
  for (const entry of normalized) {
    if (!nonEmptyString(entry.id)) errors.push('VALIDATION_ID_MISSING');
    if (!['CHECK', 'TEST', 'BUILD', 'INTEGRATION', 'OPERATIVE'].includes(entry.kind)) {
      errors.push(`VALIDATION_KIND_INVALID:${entry.id || 'UNKNOWN'}`);
    }
  }
  if (!normalized.some((entry) => entry.required)) errors.push('VALIDATION_SET_HAS_NO_REQUIRED_CHECK');
  return normalized;
}

function validateTargetSnapshot(input, errors) {
  const target = input?.target_snapshot;
  if (!isPlainObject(target)) {
    errors.push('TARGET_SNAPSHOT_MISSING');
    return;
  }
  if (target.available !== true) errors.push('TARGET_NOT_AVAILABLE');
  if (target.integrity_verified !== true) errors.push('TARGET_INTEGRITY_NOT_VERIFIED');
  if (target.supported !== true) errors.push('TARGET_NOT_SUPPORTED');
  if (target.compatible_with_environment !== true) errors.push('TARGET_ENVIRONMENT_INCOMPATIBLE');
  if (target.requires_retired_contract === true) errors.push('TARGET_REQUIRES_RETIRED_CONTRACT');
  if (target.requires_simultaneous_rollback === true) {
    errors.push('TARGET_REQUIRES_SIMULTANEOUS_ROLLBACK');
  }
  if (target.superseded_by_hotfix === true) errors.push('TARGET_SUPERSEDED_BY_HOTFIX');
}

function validatePreviousSnapshot(input, errors) {
  const snapshot = input?.previous_snapshot_ref;
  if (!isPlainObject(snapshot)) {
    errors.push('PREVIOUS_SNAPSHOT_MISSING');
    return;
  }
  if (snapshot.certified !== true) errors.push('PREVIOUS_SNAPSHOT_NOT_CERTIFIED');
  validateShaIdentity(snapshot.snapshot_identity, 'PREVIOUS_SNAPSHOT_IDENTITY_INVALID', errors);
  if (snapshot.repository !== input.repository) errors.push('PREVIOUS_SNAPSHOT_REPOSITORY_MISMATCH');
  if (snapshot.environment !== input.environment) errors.push('PREVIOUS_SNAPSHOT_ENVIRONMENT_MISMATCH');
  if (snapshot.commit !== input.rollback_to_commit) errors.push('PREVIOUS_SNAPSHOT_COMMIT_MISMATCH');
  if (
    input.rollback_to_artifact
    && snapshot.artifact_identity !== input.rollback_to_artifact
  ) {
    errors.push('PREVIOUS_SNAPSHOT_ARTIFACT_MISMATCH');
  }
  if (
    input.manifest_target_identity
    && snapshot.manifest_identity !== input.manifest_target_identity
  ) {
    errors.push('PREVIOUS_SNAPSHOT_MANIFEST_MISMATCH');
  }
  if (
    input.lockfile_target_identity
    && snapshot.lockfile_identity !== input.lockfile_target_identity
  ) {
    errors.push('PREVIOUS_SNAPSHOT_LOCKFILE_MISMATCH');
  }
  if (snapshot.invalidation_reason) errors.push('PREVIOUS_SNAPSHOT_STALE');
}

function validateConsumerBaseline(input, errors) {
  const expectedGate = CONSUMER_BASELINE_GATES[input.repository];
  const baseline = input.consumer_baseline_ref;
  if (!expectedGate) {
    if (baseline !== null && baseline !== undefined && baseline?.result !== 'NOT_APPLICABLE') {
      errors.push('CONSUMER_BASELINE_UNEXPECTED');
    }
    return;
  }
  if (!isPlainObject(baseline)) {
    errors.push('CONSUMER_BASELINE_MISSING');
    return;
  }
  if (baseline.gate_instance !== expectedGate) errors.push('CONSUMER_BASELINE_GATE_MISMATCH');
  if (baseline.consumer_repository !== input.repository) {
    errors.push('CONSUMER_BASELINE_REPOSITORY_MISMATCH');
  }
  if (baseline.consumer_base_commit !== input.rollback_to_commit) {
    errors.push('CONSUMER_BASELINE_COMMIT_MISMATCH');
  }
  if (baseline.result !== 'PASS') errors.push('CONSUMER_BASELINE_NOT_PASS');
  validateShaIdentity(
    baseline.execution_identity,
    'CONSUMER_BASELINE_EXECUTION_IDENTITY_INVALID',
    errors,
  );
  if (baseline.invalidation_reason) errors.push('CONSUMER_BASELINE_STALE');
  if (baseline.environment && baseline.environment !== input.environment) {
    errors.push('CONSUMER_BASELINE_ENVIRONMENT_MISMATCH');
  }
}

function validateReleaseRefs(input, packageSetTarget, errors) {
  const refs = Array.isArray(input.release_refs) ? input.release_refs : [];
  if (packageSetTarget.length === 0) {
    if (refs.length > 0) {
      for (const ref of refs) {
        if (ref?.gate_instance !== RELEASE_GATE_INSTANCE_ID) {
          errors.push('RELEASE_REF_GATE_MISMATCH');
        }
      }
    }
    return;
  }
  for (const target of packageSetTarget) {
    const ref = refs.find((entry) => entry?.package_name === target.package_name);
    if (!ref) {
      errors.push(`RELEASE_REF_MISSING:${target.package_name}`);
      continue;
    }
    if (ref.gate_instance !== RELEASE_GATE_INSTANCE_ID) {
      errors.push(`RELEASE_REF_GATE_MISMATCH:${target.package_name}`);
    }
    if (ref.version !== target.version) {
      errors.push(`RELEASE_REF_VERSION_MISMATCH:${target.package_name}`);
    }
    if (ref.result !== 'PASS') errors.push(`RELEASE_REF_NOT_PASS:${target.package_name}`);
    if (ref.immutable !== true) errors.push(`RELEASE_REF_NOT_IMMUTABLE:${target.package_name}`);
    validateShaIdentity(
      ref.release_evidence_identity,
      `RELEASE_REF_IDENTITY_INVALID:${target.package_name}`,
      errors,
    );
    if (ref.invalidation_reason) errors.push(`RELEASE_REF_STALE:${target.package_name}`);
  }
}

function validateCompatibilityRefs(input, packageSetTarget, errors) {
  const refs = Array.isArray(input.compatibility_refs) ? input.compatibility_refs : [];
  if (packageSetTarget.length === 0) return;
  for (const target of packageSetTarget) {
    const ref = refs.find((entry) => (
      entry?.package_name === target.package_name
      && normalizeRepositoryRef(entry?.consumer_repository) === input.repository
    ));
    if (!ref) {
      errors.push(`COMPATIBILITY_REF_MISSING:${target.package_name}`);
      continue;
    }
    if (ref.gate_instance !== COMPATIBILITY_GATE_INSTANCE_ID) {
      errors.push(`COMPATIBILITY_REF_GATE_MISMATCH:${target.package_name}`);
    }
    if (ref.result !== 'PASS') errors.push(`COMPATIBILITY_REF_NOT_PASS:${target.package_name}`);
    const relationState = ref.relation_state ?? ref.state;
    if (!['COMPATIBLE', 'COMPATIBLE_CON_RESTRICCIONES'].includes(relationState)) {
      errors.push(`COMPATIBILITY_STATE_INVALID:${target.package_name}`);
    }
    validateShaIdentity(
      ref.compatibility_evidence_identity,
      `COMPATIBILITY_REF_IDENTITY_INVALID:${target.package_name}`,
      errors,
    );
    if (ref.invalidation_reason) errors.push(`COMPATIBILITY_REF_STALE:${target.package_name}`);
    if (ref.environment && ref.environment !== input.environment) {
      errors.push(`COMPATIBILITY_REF_ENVIRONMENT_MISMATCH:${target.package_name}`);
    }
  }
}

function validateConsumerUpdateRef(input, packageSetBefore, packageSetTarget, errors) {
  if (packageSetsEqual(packageSetBefore, packageSetTarget)) return;
  const ref = input.consumer_update_ref;
  if (!isPlainObject(ref)) {
    errors.push('CONSUMER_UPDATE_REF_MISSING');
    return;
  }
  if (input.repository === 'devVentoGroup/vento-anima') {
    if (!nonEmptyString(ref.owner_contract)) {
      errors.push('ANIMA_CONSUMER_UPDATE_OWNER_CONTRACT_MISSING');
    }
  } else if (ref.gate_instance !== CONSUMER_UPDATE_GATE_INSTANCE_ID) {
    errors.push('CONSUMER_UPDATE_GATE_MISMATCH');
  }
  if (ref.update_class !== 'ROLLBACK_UPDATE') errors.push('CONSUMER_UPDATE_CLASS_INVALID');
  if (normalizeRepositoryRef(ref.consumer_repository) !== input.repository) {
    errors.push('CONSUMER_UPDATE_REPOSITORY_MISMATCH');
  }
  if (ref.result !== 'PASS') errors.push('CONSUMER_UPDATE_NOT_PASS');
  validateShaIdentity(ref.rollback_ref, 'CONSUMER_UPDATE_ROLLBACK_REF_INVALID', errors);
  validateShaIdentity(ref.proposal_identity, 'CONSUMER_UPDATE_PROPOSAL_IDENTITY_INVALID', errors);
  if (ref.invalidation_reason) errors.push('CONSUMER_UPDATE_STALE');
}

function validateDatabaseAndSupabase(input, errors) {
  const database = input.database_state_ref;
  const supabase = input.supabase_impact;
  if (!isPlainObject(database)) {
    errors.push('DATABASE_STATE_REF_MISSING');
    return;
  }
  validateShaIdentity(database.schema_identity, 'DATABASE_SCHEMA_IDENTITY_INVALID', errors);
  validateShaIdentity(database.migration_identity, 'DATABASE_MIGRATION_IDENTITY_INVALID', errors);
  if (!isPlainObject(supabase)) {
    errors.push('SUPABASE_IMPACT_MISSING');
    return;
  }
  if (supabase.ci014_executes_mutation !== false) {
    errors.push('CI014_SUPABASE_MUTATION_FORBIDDEN');
  }
  if (database.code_target_compatible === false && database.rollback_required !== true) {
    errors.push('DATABASE_COMPATIBILITY_UNRESOLVED');
  }
  if (database.rollback_required === true) {
    if (supabase.mutation_required !== true) errors.push('SUPABASE_OWNER_PLAN_REQUIRED');
    if (supabase.owner_repository !== 'devVentoGroup/vento-shell') {
      errors.push('SUPABASE_OWNER_REPOSITORY_INVALID');
    }
    if (supabase.owner_task !== 'AUTH-DB-029') errors.push('SUPABASE_OWNER_TASK_INVALID');
    validateShaIdentity(
      supabase.approved_plan_identity,
      'SUPABASE_APPROVED_PLAN_IDENTITY_INVALID',
      errors,
    );
    if (
      database.strategy === 'DOWN_MIGRATION'
      && database.down_migration_certified !== true
    ) {
      errors.push('DOWN_MIGRATION_NOT_CERTIFIED');
    }
  } else if (supabase.mutation_required === true) {
    errors.push('SUPABASE_MUTATION_UNNECESSARY');
  }
}

function validateConfiguration(input, classes, errors) {
  validateShaIdentity(
    input.configuration_before_identity,
    'CONFIGURATION_BEFORE_IDENTITY_INVALID',
    errors,
    { optional: !classes.includes('CONFIGURATION') },
  );
  validateShaIdentity(
    input.configuration_target_identity,
    'CONFIGURATION_TARGET_IDENTITY_INVALID',
    errors,
    { optional: !classes.includes('CONFIGURATION') },
  );
  if (!classes.includes('CONFIGURATION')) return;
  if (input.configuration_target_versioned !== true) {
    errors.push('CONFIGURATION_TARGET_NOT_VERSIONED');
  }
  if (input.configuration_target_environment !== input.environment) {
    errors.push('CONFIGURATION_TARGET_ENVIRONMENT_MISMATCH');
  }
}

function validateCache(input, classes, errors) {
  const strategy = input.cache_strategy;
  if (!isPlainObject(strategy)) {
    errors.push('CACHE_STRATEGY_MISSING');
    return;
  }
  if (!CACHE_STRATEGY_SET.has(strategy.mode)) errors.push('CACHE_STRATEGY_INVALID');
  if (strategy.current === false) errors.push('CACHE_EVIDENCE_STALE');
  if (classes.includes('CACHE') && strategy.mode === 'NOT_APPLICABLE') {
    errors.push('CACHE_STRATEGY_REQUIRED');
  }
  if (strategy.mode === 'RESTORE_VERSIONED_NON_AUTHORITATIVE_SNAPSHOT') {
    if (strategy.versioned !== true) errors.push('CACHE_SNAPSHOT_NOT_VERSIONED');
    if (strategy.immutable !== true) errors.push('CACHE_SNAPSHOT_NOT_IMMUTABLE');
    if (strategy.non_authoritative !== true) errors.push('CACHE_SNAPSHOT_IS_AUTHORITATIVE');
    if (strategy.compatible !== true) errors.push('CACHE_SNAPSHOT_INCOMPATIBLE');
  }
}

function validateSecrets(input, errors) {
  const strategy = input.secret_strategy;
  if (!isPlainObject(strategy)) {
    errors.push('SECRET_STRATEGY_MISSING');
    return;
  }
  if (!SECRET_STRATEGY_SET.has(strategy.mode)) errors.push('SECRET_STRATEGY_INVALID');
  if (strategy.restores_revoked === true) errors.push('SECRET_REVOKED_RESTORE_FORBIDDEN');
  if (strategy.exposes_values === true) errors.push('SECRET_VALUE_EXPOSURE_FORBIDDEN');
}

function validateDataImpact(input, errors) {
  const impact = input.data_impact;
  if (!isPlainObject(impact)) {
    errors.push('DATA_IMPACT_MISSING');
    return;
  }
  if (impact.preserves_valid_data !== true) errors.push('VALID_DATA_PRESERVATION_NOT_PROVEN');
  if (impact.preserves_audit !== true) errors.push('AUDIT_PRESERVATION_NOT_PROVEN');
  if (impact.snapshot_restore === true) errors.push('BLIND_SNAPSHOT_RESTORE_FORBIDDEN');
  if (
    impact.invalid_data_present === true
    && (!nonEmptyString(impact.reconciliation_owner) || impact.reconciliation_owner === 'NONE')
  ) {
    errors.push('INVALID_DATA_RECONCILIATION_OWNER_MISSING');
  }
}

function validateSecurityAssessment(input, errors) {
  const assessment = input.security_assessment;
  if (!isPlainObject(assessment)) {
    errors.push('SECURITY_ASSESSMENT_MISSING');
    return;
  }
  if (assessment.target_supported !== true) errors.push('SECURITY_TARGET_NOT_SUPPORTED');
  if (assessment.known_vulnerability === true) errors.push('TARGET_KNOWN_VULNERABLE');
  if (assessment.restores_authorization_bypass === true) {
    errors.push('AUTHORIZATION_BYPASS_RESTORE_FORBIDDEN');
  }
  if (assessment.restores_insecure_grants === true) {
    errors.push('INSECURE_GRANT_RESTORE_FORBIDDEN');
  }
}

function validatePlannedActions(input, classes, errors) {
  if (!Array.isArray(input.planned_actions) || input.planned_actions.length === 0) {
    errors.push('PLANNED_ACTIONS_MISSING');
    return;
  }
  for (const action of input.planned_actions) {
    if (FORBIDDEN_ACTION_SET.has(action)) errors.push(`FORBIDDEN_ACTION:${action}`);
    else if (!ALLOWED_ACTION_SET.has(action)) errors.push(`UNKNOWN_ACTION:${action}`);
  }
  if (
    classes.includes('REPOSITORY_CODE')
    && !input.planned_actions.some((action) => (
      action === 'DEPLOY_IMMUTABLE_ARTIFACT'
      || action === 'CREATE_REVERT_PROPOSAL'
    ))
  ) {
    errors.push('REPOSITORY_CODE_ACTION_MISSING');
  }
  if (
    classes.includes('PACKAGE_ADOPTION')
    && !input.planned_actions.includes('RESTORE_EXACT_PACKAGE_SET_VIA_REVIEWED_PR')
  ) {
    errors.push('PACKAGE_ADOPTION_ACTION_MISSING');
  }
  if (
    classes.includes('CONFIGURATION')
    && !input.planned_actions.includes('RESTORE_VERSIONED_CONFIGURATION')
  ) {
    errors.push('CONFIGURATION_ACTION_MISSING');
  }
  if (
    classes.includes('CACHE')
    && !input.planned_actions.some((action) => (
      action === 'INVALIDATE_CACHE'
      || action === 'REBUILD_CACHE'
      || action === 'BUMP_CACHE_NAMESPACE'
    ))
  ) {
    errors.push('CACHE_ACTION_MISSING');
  }
  if (
    classes.includes('DATABASE_DEPENDENCY')
    && !input.planned_actions.includes('DELEGATE_DATABASE_CHANGE_TO_AUTH_DB_029')
  ) {
    errors.push('DATABASE_DELEGATION_ACTION_MISSING');
  }
}

function validateAuthorization(input, errors) {
  const authorization = input.authorization_ref;
  if (!isPlainObject(authorization)) {
    errors.push('ROLLBACK_AUTHORIZATION_MISSING');
    return;
  }
  if (authorization.decision !== 'APPROVED') errors.push('ROLLBACK_AUTHORIZATION_NOT_APPROVED');
  validateShaIdentity(
    authorization.evidence_identity,
    'ROLLBACK_AUTHORIZATION_IDENTITY_INVALID',
    errors,
  );
  if (
    input.execution_mode === 'REAL'
    && authorization.scope !== 'EXACT_ROLLBACK_UNIT'
  ) {
    errors.push('REAL_ROLLBACK_AUTHORIZATION_SCOPE_INVALID');
  }
  if (
    input.execution_mode === 'SYNTHETIC'
    && authorization.scope !== 'SYNTHETIC_SELF_CERTIFICATION'
  ) {
    errors.push('SYNTHETIC_AUTHORIZATION_SCOPE_INVALID');
  }
}

function validateClasses(input, errors) {
  if (!Array.isArray(input.rollback_classes) || input.rollback_classes.length === 0) {
    errors.push('ROLLBACK_CLASSES_MISSING');
    return [];
  }
  const classes = unique(input.rollback_classes.map((entry) => String(entry)));
  if (classes.length !== input.rollback_classes.length) errors.push('ROLLBACK_CLASS_DUPLICATE');
  for (const rollbackClass of classes) {
    if (!ROLLBACK_CLASS_SET.has(rollbackClass)) {
      errors.push(`ROLLBACK_CLASS_UNKNOWN:${rollbackClass}`);
    }
  }
  return classes;
}

function validateCoreIdentity(input, errors) {
  if (!CANONICAL_REPOSITORY_SET.has(input.repository)) errors.push('REPOSITORY_NOT_CANONICAL');
  if (!nonEmptyString(input.environment)) errors.push('ENVIRONMENT_MISSING');
  if (!TRIGGER_SET.has(input.trigger)) errors.push('TRIGGER_INVALID');
  for (const field of [
    'rollback_execution_id',
    'incident_ref',
    'requested_by',
    'approved_by',
    'source_branch',
  ]) {
    if (!nonEmptyString(input[field])) errors.push(`${field.toUpperCase()}_MISSING`);
  }
  validateCommit(input.rollback_from_commit, 'ROLLBACK_FROM_COMMIT_INVALID', errors);
  validateCommit(input.rollback_to_commit, 'ROLLBACK_TO_COMMIT_INVALID', errors);
  if (input.rollback_from_commit === input.rollback_to_commit) {
    errors.push('ROLLBACK_COMMITS_IDENTICAL');
  }
  if (input.observed_current_commit !== input.rollback_from_commit) {
    errors.push('SOURCE_COMMIT_STALE');
  }
  if (nonEmptyString(input.concurrent_change_ref)) errors.push('CONCURRENT_CHANGE_PRESENT');
}

function validateArtifactsAndPackages(input, classes, errors) {
  const packageSetBefore = validatePackageSet(
    input.package_set_before ?? [],
    'PACKAGE_SET_BEFORE',
    errors,
  );
  const packageSetTarget = validatePackageSet(
    input.package_set_target ?? [],
    'PACKAGE_SET_TARGET',
    errors,
  );

  validateShaIdentity(
    input.rollback_from_artifact,
    'ROLLBACK_FROM_ARTIFACT_INVALID',
    errors,
    { optional: !classes.includes('REPOSITORY_CODE') },
  );
  validateShaIdentity(
    input.rollback_to_artifact,
    'ROLLBACK_TO_ARTIFACT_INVALID',
    errors,
    { optional: !classes.includes('REPOSITORY_CODE') },
  );

  const packageChange = !packageSetsEqual(packageSetBefore, packageSetTarget);
  if (packageChange && !classes.includes('PACKAGE_ADOPTION')) {
    errors.push('PACKAGE_CHANGE_WITHOUT_PACKAGE_ADOPTION_CLASS');
  }

  if (classes.includes('PACKAGE_ADOPTION') || packageSetTarget.length > 0) {
    validateShaIdentity(
      input.manifest_before_identity,
      'MANIFEST_BEFORE_IDENTITY_INVALID',
      errors,
    );
    validateShaIdentity(
      input.manifest_target_identity,
      'MANIFEST_TARGET_IDENTITY_INVALID',
      errors,
    );
    validateShaIdentity(
      input.lockfile_before_identity,
      'LOCKFILE_BEFORE_IDENTITY_INVALID',
      errors,
    );
    validateShaIdentity(
      input.lockfile_target_identity,
      'LOCKFILE_TARGET_IDENTITY_INVALID',
      errors,
    );
    if (input.manifest_lock_consistent !== true) errors.push('MANIFEST_LOCKFILE_INCONSISTENT');
    if (input.manifest_target_commit !== input.rollback_to_commit) {
      errors.push('MANIFEST_TARGET_COMMIT_MISMATCH');
    }
    if (input.lockfile_target_commit !== input.rollback_to_commit) {
      errors.push('LOCKFILE_TARGET_COMMIT_MISMATCH');
    }
  } else {
    validateShaIdentity(
      input.manifest_before_identity,
      'MANIFEST_BEFORE_IDENTITY_INVALID',
      errors,
      { optional: true },
    );
    validateShaIdentity(
      input.manifest_target_identity,
      'MANIFEST_TARGET_IDENTITY_INVALID',
      errors,
      { optional: true },
    );
    validateShaIdentity(
      input.lockfile_before_identity,
      'LOCKFILE_BEFORE_IDENTITY_INVALID',
      errors,
      { optional: true },
    );
    validateShaIdentity(
      input.lockfile_target_identity,
      'LOCKFILE_TARGET_IDENTITY_INVALID',
      errors,
      { optional: true },
    );
  }

  validateReleaseRefs(input, packageSetTarget, errors);
  validateCompatibilityRefs(input, packageSetTarget, errors);
  validateConsumerUpdateRef(input, packageSetBefore, packageSetTarget, errors);

  return { packageSetBefore, packageSetTarget };
}

export function validateRollbackRecord(record) {
  const errors = [];
  if (!isPlainObject(record)) return ['ROLLBACK_RECORD_NOT_OBJECT'];
  for (const field of REQUIRED_ROLLBACK_RECORD_FIELDS) {
    if (!Object.hasOwn(record, field)) errors.push(`ROLLBACK_RECORD_FIELD_MISSING:${field}`);
  }
  if (!RESULT_STATE_SET.has(record.result)) errors.push('ROLLBACK_RECORD_RESULT_INVALID');
  return unique(errors);
}

export function prepareRollbackPlan(input) {
  const errors = [];
  if (!isPlainObject(input)) {
    return {
      schema_version: ROLLBACK_SCHEMA_VERSION,
      gate_instance: ROLLBACK_GATE_INSTANCE_ID,
      phase: 'PREPARE',
      result: 'BLOCKED',
      reasons: ['INPUT_NOT_OBJECT'],
      plan_identity: null,
      record: null,
    };
  }

  if (input.schema_version !== ROLLBACK_SCHEMA_VERSION) errors.push('SCHEMA_VERSION_UNSUPPORTED');
  if (!['SYNTHETIC', 'REAL'].includes(input.execution_mode)) errors.push('EXECUTION_MODE_INVALID');
  if (input.execution_mode === 'SYNTHETIC' && !String(input.environment ?? '').startsWith('SYNTHETIC_')) {
    errors.push('SYNTHETIC_ENVIRONMENT_REQUIRED');
  }
  if (input.execution_mode === 'SYNTHETIC' && input.synthetic_fixture_uses_production_data === true) {
    errors.push('PRODUCTION_DATA_FIXTURE_FORBIDDEN');
  }

  validateCoreIdentity(input, errors);
  const classes = validateClasses(input, errors);
  const { packageSetBefore, packageSetTarget } = validateArtifactsAndPackages(
    input,
    classes,
    errors,
  );
  validateTargetSnapshot(input, errors);
  validatePreviousSnapshot(input, errors);
  validateConsumerBaseline(input, errors);
  validateDatabaseAndSupabase(input, errors);
  validateConfiguration(input, classes, errors);
  validateCache(input, classes, errors);
  validateSecrets(input, errors);
  validateDataImpact(input, errors);
  validateSecurityAssessment(input, errors);
  validatePlannedActions(input, classes, errors);
  validateAuthorization(input, errors);
  const validationSet = validateRequiredValidationSet(input.required_validation_set, errors);
  errors.push(...validateNoSensitiveData(input));

  const uniqueErrors = unique(errors);
  const record = {
    rollback_execution_id: input.rollback_execution_id ?? null,
    repository: input.repository ?? null,
    environment: input.environment ?? null,
    trigger: input.trigger ?? null,
    incident_ref: input.incident_ref ?? null,
    requested_by: input.requested_by ?? null,
    approved_by: input.approved_by ?? null,
    source_branch: input.source_branch ?? null,
    rollback_from_commit: input.rollback_from_commit ?? null,
    rollback_from_artifact: input.rollback_from_artifact ?? null,
    rollback_to_commit: input.rollback_to_commit ?? null,
    rollback_to_artifact: input.rollback_to_artifact ?? null,
    manifest_before_identity: input.manifest_before_identity ?? null,
    manifest_target_identity: input.manifest_target_identity ?? null,
    lockfile_before_identity: input.lockfile_before_identity ?? null,
    lockfile_target_identity: input.lockfile_target_identity ?? null,
    package_set_before: packageSetBefore,
    package_set_target: packageSetTarget,
    compatibility_refs: Array.isArray(input.compatibility_refs)
      ? canonicalize(input.compatibility_refs)
      : [],
    consumer_baseline_ref: input.consumer_baseline_ref ?? null,
    database_state_ref: input.database_state_ref ?? null,
    configuration_before_identity: input.configuration_before_identity ?? null,
    configuration_target_identity: input.configuration_target_identity ?? null,
    cache_strategy: input.cache_strategy ?? null,
    secret_strategy: input.secret_strategy ?? null,
    data_impact: input.data_impact ?? null,
    supabase_impact: input.supabase_impact ?? null,
    required_validation_set: validationSet,
    execution_started_at: null,
    execution_completed_at: null,
    result: uniqueErrors.length === 0 ? 'PENDING' : 'BLOCKED',
    post_rollback_verification: null,
    invalidation_reason: uniqueErrors.length === 0 ? null : 'PREPARE_BLOCKED',
  };

  const recordErrors = validateRollbackRecord(record);
  uniqueErrors.push(...recordErrors);
  const finalErrors = unique(uniqueErrors);

  const material = {
    schema_version: ROLLBACK_SCHEMA_VERSION,
    gate_instance: ROLLBACK_GATE_INSTANCE_ID,
    record,
    execution_mode: input.execution_mode,
    rollback_classes: classes,
    previous_snapshot_ref: input.previous_snapshot_ref ?? null,
    target_snapshot: input.target_snapshot ?? null,
    release_refs: input.release_refs ?? [],
    consumer_update_ref: input.consumer_update_ref ?? null,
    security_assessment: input.security_assessment ?? null,
    authorization_ref: input.authorization_ref ?? null,
    planned_actions: input.planned_actions ?? [],
    depends_on: Array.isArray(input.depends_on) ? [...input.depends_on] : [],
    gate_implementation_identity: implementationIdentity(),
  };

  return {
    ...material,
    phase: 'PREPARE',
    result: finalErrors.length === 0 ? 'PASS' : 'BLOCKED',
    reasons: finalErrors,
    plan_identity: finalErrors.length === 0 ? rollbackIdentity(material) : null,
  };
}

export function comparePreparedPlan(previousPrepared, currentInput) {
  if (
    previousPrepared?.result !== 'PASS'
    || !SHA256_IDENTITY_PATTERN.test(String(previousPrepared?.plan_identity ?? ''))
  ) {
    return {
      current: false,
      result: 'STALE',
      reasons: ['PREVIOUS_PLAN_INVALID'],
      prepared: prepareRollbackPlan(currentInput),
    };
  }
  const current = prepareRollbackPlan(currentInput);
  if (current.result !== 'PASS') {
    return {
      current: false,
      result: 'STALE',
      reasons: ['CURRENT_PLAN_NOT_ELIGIBLE', ...current.reasons],
      prepared: current,
    };
  }
  if (current.plan_identity !== previousPrepared.plan_identity) {
    return {
      current: false,
      result: 'STALE',
      reasons: ['MATERIAL_INPUT_CHANGED'],
      prepared: current,
    };
  }
  return {
    current: true,
    result: 'PASS',
    reasons: [],
    prepared: current,
  };
}

function validationResultMap(observation) {
  const results = Array.isArray(observation?.validation_results)
    ? observation.validation_results
    : [];
  return new Map(results.map((entry) => [entry?.id, entry]));
}

function databaseOwnerEvidenceValid(prepared, observation, errors) {
  if (prepared.record?.supabase_impact?.mutation_required !== true) return;
  const evidence = observation?.database_owner_evidence;
  if (!isPlainObject(evidence)) {
    errors.push('DATABASE_OWNER_EVIDENCE_MISSING');
    return;
  }
  if (evidence.owner_repository !== 'devVentoGroup/vento-shell') {
    errors.push('DATABASE_OWNER_EVIDENCE_REPOSITORY_INVALID');
  }
  if (evidence.owner_task !== 'AUTH-DB-029') errors.push('DATABASE_OWNER_EVIDENCE_TASK_INVALID');
  if (evidence.result !== 'PASS') errors.push('DATABASE_OWNER_EVIDENCE_NOT_PASS');
  validateShaIdentity(
    evidence.evidence_identity,
    'DATABASE_OWNER_EVIDENCE_IDENTITY_INVALID',
    errors,
  );
}

function verificationRecord(prepared, observation, result, reasons) {
  return {
    ...prepared.record,
    execution_started_at: observation?.execution_started_at ?? null,
    execution_completed_at: observation?.execution_completed_at ?? null,
    result,
    post_rollback_verification: {
      validation_results: Array.isArray(observation?.validation_results)
        ? canonicalize(observation.validation_results)
        : [],
      data_preserved: observation?.data_preserved === true,
      audit_preserved: observation?.audit_preserved === true,
      cache_verified: observation?.cache_verified ?? null,
      configuration_verified: observation?.configuration_verified ?? null,
      database_owner_evidence: observation?.database_owner_evidence ?? null,
      incident_condition_persists: observation?.incident_condition_persists === true,
      critical_regression_detected: observation?.critical_regression_detected === true,
      reconciliation_pending: observation?.reconciliation_pending === true,
      reasons,
    },
    invalidation_reason: result === 'PASS' ? null : reasons[0] ?? 'VERIFICATION_FAILED',
  };
}

export function verifyRollbackExecution(prepared, observation) {
  if (
    prepared?.phase !== 'PREPARE'
    || prepared?.result !== 'PASS'
    || !SHA256_IDENTITY_PATTERN.test(String(prepared?.plan_identity ?? ''))
  ) {
    return {
      schema_version: ROLLBACK_SCHEMA_VERSION,
      gate_instance: ROLLBACK_GATE_INSTANCE_ID,
      phase: 'VERIFY',
      result: 'BLOCKED',
      reasons: ['PREPARED_PLAN_INVALID'],
      verification_identity: null,
      record: null,
    };
  }

  const staleReasons = [];
  if (observation?.rollback_execution_id !== prepared.record.rollback_execution_id) {
    staleReasons.push('ROLLBACK_EXECUTION_ID_MISMATCH');
  }
  if (observation?.repository !== prepared.record.repository) {
    staleReasons.push('ROLLBACK_REPOSITORY_MISMATCH');
  }
  if (observation?.environment !== prepared.record.environment) {
    staleReasons.push('ROLLBACK_ENVIRONMENT_MISMATCH');
  }
  if (observation?.source_commit_before_execution !== prepared.record.rollback_from_commit) {
    staleReasons.push('SOURCE_COMMIT_CHANGED_BEFORE_EXECUTION');
  }
  if (nonEmptyString(observation?.concurrent_change_ref)) {
    staleReasons.push('CONCURRENT_CHANGE_BEFORE_EXECUTION');
  }
  if (staleReasons.length > 0) {
    const reasons = unique(staleReasons);
    const record = verificationRecord(prepared, observation, 'STALE', reasons);
    return {
      schema_version: ROLLBACK_SCHEMA_VERSION,
      gate_instance: ROLLBACK_GATE_INSTANCE_ID,
      phase: 'VERIFY',
      result: 'STALE',
      reasons,
      plan_identity: prepared.plan_identity,
      verification_identity: rollbackIdentity({
        plan_identity: prepared.plan_identity,
        record,
      }),
      record,
    };
  }

  const errors = [];
  errors.push(...validateNoSensitiveData(observation));

  if (observation?.mutation_result !== 'APPLIED') {
    errors.push(
      observation?.mutation_result === 'PARTIAL'
        ? 'PARTIAL_MUTATION'
        : 'MUTATION_NOT_APPLIED',
    );
  }
  if (observation?.final_commit !== prepared.record.rollback_to_commit) {
    errors.push('FINAL_COMMIT_MISMATCH');
  }
  if (
    prepared.record.rollback_to_artifact
    && observation?.final_artifact !== prepared.record.rollback_to_artifact
  ) {
    errors.push('FINAL_ARTIFACT_MISMATCH');
  }

  const resultMap = validationResultMap(observation);
  for (const required of prepared.record.required_validation_set) {
    if (!required.required) continue;
    const observed = resultMap.get(required.id);
    if (!observed) {
      errors.push(`REQUIRED_VALIDATION_MISSING:${required.id}`);
      continue;
    }
    if (observed.status !== 'PASS') {
      errors.push(`REQUIRED_VALIDATION_NOT_PASS:${required.id}`);
    }
    if (
      required.kind === 'TEST'
      && (!Number.isInteger(observed.executed_count) || observed.executed_count <= 0)
    ) {
      errors.push(`REQUIRED_TESTS_ZERO:${required.id}`);
    }
  }

  if (observation?.reconciliation_pending === true) errors.push('RECONCILIATION_PENDING');
  if (observation?.critical_regression_detected === true) {
    errors.push('CRITICAL_REGRESSION_DETECTED');
  }
  if (observation?.incident_condition_persists === true) {
    errors.push('INCIDENT_CONDITION_PERSISTS');
  }
  if (observation?.data_preserved !== true) errors.push('POST_ROLLBACK_DATA_NOT_PRESERVED');
  if (observation?.audit_preserved !== true) errors.push('POST_ROLLBACK_AUDIT_NOT_PRESERVED');

  if (
    prepared.rollback_classes.includes('CONFIGURATION')
    && observation?.configuration_verified !== true
  ) {
    errors.push('CONFIGURATION_NOT_VERIFIED');
  }
  if (
    prepared.rollback_classes.includes('CACHE')
    && observation?.cache_verified !== true
  ) {
    errors.push('CACHE_NOT_VERIFIED');
  }

  databaseOwnerEvidenceValid(prepared, observation, errors);

  if (
    Number.isInteger(observation?.retry_count)
    && observation.retry_count > 0
    && !SHA256_IDENTITY_PATTERN.test(String(observation?.retry_diagnostic_ref ?? ''))
  ) {
    errors.push('RETRY_DIAGNOSTIC_MISSING');
  }

  if (observation?.reported_result === 'PASS' && errors.length > 0) {
    errors.push('REPORTED_PASS_CONTRADICTS_OBSERVATION');
  }

  const reasons = unique(errors);
  const result = reasons.length === 0 ? 'PASS' : 'FAIL';
  const record = verificationRecord(prepared, observation, result, reasons);
  const verificationMaterial = {
    schema_version: ROLLBACK_SCHEMA_VERSION,
    gate_instance: ROLLBACK_GATE_INSTANCE_ID,
    plan_identity: prepared.plan_identity,
    record,
    gate_implementation_identity: implementationIdentity(),
  };

  return {
    ...verificationMaterial,
    phase: 'VERIFY',
    result,
    reasons,
    verification_identity: rollbackIdentity(verificationMaterial),
  };
}

function evidenceIdentity(evidence) {
  if (SHA256_IDENTITY_PATTERN.test(String(evidence?.verification_identity ?? ''))) {
    return evidence.verification_identity;
  }
  if (SHA256_IDENTITY_PATTERN.test(String(evidence?.plan_identity ?? ''))) {
    return evidence.plan_identity;
  }
  return null;
}

export function appendRollbackHistory(history, evidence) {
  const current = Array.isArray(history) ? [...history] : [];
  const identity = evidenceIdentity(evidence);
  if (!identity) return { history: current, appended: false };
  if (current.some((entry) => evidenceIdentity(entry) === identity)) {
    return { history: current, appended: false };
  }
  return { history: [...current, evidence], appended: true };
}

function dependencyCycle(units) {
  const byId = new Map(units.map((unit) => [unit.rollback_execution_id, unit]));
  const visiting = new Set();
  const visited = new Set();

  function visit(id) {
    if (visiting.has(id)) return true;
    if (visited.has(id)) return false;
    visiting.add(id);
    const unit = byId.get(id);
    for (const dependency of unit?.depends_on ?? []) {
      if (visit(dependency)) return true;
    }
    visiting.delete(id);
    visited.add(id);
    return false;
  }

  return [...byId.keys()].some((id) => visit(id));
}

export function buildIncidentRollbackPlan(preparedPlans, {
  implicit_global_rollback = false,
} = {}) {
  const errors = [];
  if (!Array.isArray(preparedPlans) || preparedPlans.length === 0) {
    return {
      result: 'BLOCKED',
      reasons: ['INCIDENT_UNITS_MISSING'],
      incident_plan_identity: null,
      units: [],
    };
  }
  if (implicit_global_rollback === true) errors.push('IMPLICIT_GLOBAL_ROLLBACK_FORBIDDEN');

  const units = preparedPlans.map((prepared) => ({
    rollback_execution_id: prepared?.record?.rollback_execution_id ?? null,
    repository: prepared?.record?.repository ?? null,
    environment: prepared?.record?.environment ?? null,
    plan_identity: prepared?.plan_identity ?? null,
    result: prepared?.result ?? null,
    depends_on: Array.isArray(prepared?.depends_on) ? [...prepared.depends_on] : [],
  }));

  for (const prepared of preparedPlans) {
    if (prepared?.result !== 'PASS') errors.push('INCIDENT_UNIT_NOT_ELIGIBLE');
    if ((prepared?.planned_actions ?? []).includes('ROLLBACK_ALL')) {
      errors.push('INCIDENT_ROLLBACK_ALL_ACTION_FORBIDDEN');
    }
  }

  const ids = units.map((unit) => unit.rollback_execution_id);
  if (unique(ids).length !== ids.length) errors.push('INCIDENT_UNIT_ID_DUPLICATE');
  const repositoryEnvironments = units.map(
    (unit) => `${unit.repository}\n${unit.environment}`,
  );
  if (unique(repositoryEnvironments).length !== repositoryEnvironments.length) {
    errors.push('INCIDENT_REPOSITORY_ENVIRONMENT_DUPLICATE');
  }

  const idSet = new Set(ids);
  for (const unit of units) {
    for (const dependency of unit.depends_on) {
      if (!idSet.has(dependency)) errors.push(`INCIDENT_DEPENDENCY_UNKNOWN:${dependency}`);
      if (dependency === unit.rollback_execution_id) errors.push('INCIDENT_SELF_DEPENDENCY');
    }
  }
  if (dependencyCycle(units)) errors.push('INCIDENT_DEPENDENCY_CYCLE');

  const reasons = unique(errors);
  const material = {
    schema_version: ROLLBACK_SCHEMA_VERSION,
    gate_instance: ROLLBACK_GATE_INSTANCE_ID,
    units: canonicalize(units),
  };
  return {
    ...material,
    result: reasons.length === 0 ? 'PASS' : 'BLOCKED',
    reasons,
    incident_plan_identity: reasons.length === 0 ? rollbackIdentity(material) : null,
  };
}

export function planGateRecovery({
  current_implementation_identity,
  previous_certified_identity,
  history = [],
} = {}) {
  const errors = [];
  validateShaIdentity(
    current_implementation_identity,
    'CURRENT_GATE_IMPLEMENTATION_IDENTITY_INVALID',
    errors,
  );
  validateShaIdentity(
    previous_certified_identity,
    'PREVIOUS_GATE_IMPLEMENTATION_IDENTITY_INVALID',
    errors,
  );
  if (current_implementation_identity === previous_certified_identity) {
    errors.push('GATE_RECOVERY_IDENTITIES_IDENTICAL');
  }
  const previous = Array.isArray(history)
    ? history.find((entry) => (
      entry?.gate_implementation_identity === previous_certified_identity
      && entry?.result === 'PASS'
      && entry?.certified === true
    ))
    : null;
  if (!previous) errors.push('PREVIOUS_CERTIFIED_GATE_NOT_FOUND');

  const reasons = unique(errors);
  return {
    result: reasons.length === 0 ? 'PASS' : 'BLOCKED',
    reasons,
    action: reasons.length === 0 ? 'RESTORE_PREVIOUS_CERTIFIED_IMPLEMENTATION' : null,
    current_implementation_identity,
    previous_certified_identity,
    history: Array.isArray(history) ? [...history] : [],
  };
}

function sanitizeFilename(value) {
  return String(value ?? 'evidence').replace(/[^A-Za-z0-9._-]+/gu, '_');
}

export function writeRuntimeEvidence(evidence, {
  repositoryRoot = process.cwd(),
  evidenceRoot = null,
} = {}) {
  const findings = validateNoSensitiveData(evidence);
  if (findings.length > 0) {
    throw new Error(`Sensitive data rejected: ${findings.join(', ')}`);
  }
  const identity = evidenceIdentity(evidence) ?? rollbackIdentity(evidence);
  const phase = String(evidence?.phase ?? 'evidence').toLowerCase();
  const root = evidenceRoot
    ? path.resolve(evidenceRoot)
    : path.join(path.resolve(repositoryRoot), RUNTIME_EVIDENCE_RELATIVE_ROOT);
  const directory = path.join(root, sanitizeFilename(phase));
  fs.mkdirSync(directory, { recursive: true });
  const filename = `${identity.replace(/^sha256:/u, '')}.json`;
  const target = path.join(directory, filename);
  fs.writeFileSync(target, `${JSON.stringify(evidence, null, 2)}\n`, 'utf8');
  return target;
}

function readJson(filePath, label) {
  const absolute = path.resolve(filePath);
  let source;
  try {
    source = fs.readFileSync(absolute, 'utf8');
  } catch (error) {
    throw new Error(`Cannot read ${label}: ${error instanceof Error ? error.message : String(error)}`);
  }
  try {
    return JSON.parse(source);
  } catch (error) {
    throw new Error(`Invalid JSON in ${label}: ${error instanceof Error ? error.message : String(error)}`);
  }
}

function parseArgs(argv) {
  const args = {
    command: argv[0] ?? null,
    input: null,
    prepare: null,
    observation: null,
    evidenceRoot: null,
    json: false,
  };
  for (let index = 1; index < argv.length; index += 1) {
    const token = argv[index];
    if (token === '--json') {
      args.json = true;
      continue;
    }
    const value = argv[index + 1];
    if (token === '--input') args.input = value;
    else if (token === '--prepare') args.prepare = value;
    else if (token === '--observation') args.observation = value;
    else if (token === '--evidence-root') args.evidenceRoot = value;
    else throw new Error(`Unknown argument: ${token}`);
    index += 1;
  }
  return args;
}

function printUsage() {
  console.log(`Usage:
  node ${IMPLEMENTATION_RELATIVE_PATH} prepare --input <json> [--evidence-root <dir>] [--json]
  node ${IMPLEMENTATION_RELATIVE_PATH} verify --prepare <json> --observation <json> [--evidence-root <dir>] [--json]
  node ${IMPLEMENTATION_RELATIVE_PATH} incident --input <json> [--evidence-root <dir>] [--json]
  node ${IMPLEMENTATION_RELATIVE_PATH} gate-recovery --input <json> [--json]

This gate evaluates, prepares and verifies rollback evidence. It does not force-push, mutate tags/releases, merge, deploy, restore secrets, execute Supabase changes or run down migrations.`);
}

function emit(result, args, { write = true } = {}) {
  let evidencePath = null;
  if (write) {
    evidencePath = writeRuntimeEvidence(result, {
      evidenceRoot: args.evidenceRoot,
    });
  }
  if (args.json) {
    console.log(JSON.stringify({ result, evidence_path: evidencePath }, null, 2));
  } else {
    console.log(`${result.phase ?? 'RESULT'} ${result.result}`);
    if (evidencePath) console.log(`EVIDENCE ${evidencePath}`);
    if (Array.isArray(result.reasons) && result.reasons.length > 0) {
      console.log(`REASONS ${result.reasons.join(',')}`);
    }
  }
  if (!['PASS', 'PENDING'].includes(result.result)) process.exitCode = 1;
  return result;
}

export function main(argv = process.argv.slice(2)) {
  const args = parseArgs(argv);
  if (!args.command || args.command === 'help' || args.command === '--help') {
    printUsage();
    return null;
  }

  if (args.command === 'prepare') {
    if (!args.input) throw new Error('--input is required for prepare.');
    return emit(prepareRollbackPlan(readJson(args.input, 'rollback input')), args);
  }

  if (args.command === 'verify') {
    if (!args.prepare || !args.observation) {
      throw new Error('--prepare and --observation are required for verify.');
    }
    return emit(
      verifyRollbackExecution(
        readJson(args.prepare, 'prepared rollback'),
        readJson(args.observation, 'rollback observation'),
      ),
      args,
    );
  }

  if (args.command === 'incident') {
    if (!args.input) throw new Error('--input is required for incident.');
    const input = readJson(args.input, 'incident rollback input');
    const prepared = Array.isArray(input) ? input : input.units;
    return emit(
      buildIncidentRollbackPlan(prepared, {
        implicit_global_rollback: input?.implicit_global_rollback === true,
      }),
      args,
    );
  }

  if (args.command === 'gate-recovery') {
    if (!args.input) throw new Error('--input is required for gate-recovery.');
    return emit(
      {
        phase: 'GATE_RECOVERY',
        ...planGateRecovery(readJson(args.input, 'gate recovery input')),
      },
      args,
      { write: false },
    );
  }

  throw new Error(`Unknown command: ${args.command}`);
}

if (
  process.argv[1]
  && path.resolve(process.argv[1]) === path.resolve(fileURLToPath(import.meta.url))
) {
  try {
    main();
  } catch (error) {
    console.error(error instanceof Error ? error.message : String(error));
    process.exitCode = 1;
  }
}