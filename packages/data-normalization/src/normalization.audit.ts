import type {
  NormalizableFieldSemanticClass,
  NormalizationOperationKind,
} from './normalization.types.js';
import type { NormalizationPreview } from './normalization.preview.js';

/**
 * Pure metadata, versioning, audit and idempotency contracts for
 * SHELL-NORM-008::GLOBAL.
 *
 * This module has no I/O, persistence, clock, randomness, authorization,
 * transaction, Git, registry, Supabase, replay execution or commit authority.
 * External facts are always supplied explicitly by the owning layer.
 */

export const RULE_AUDIT_VERSION_POLICY_ID =
  'VENTO_TEXT_RULE_AUDIT_VERSION_AND_IDEMPOTENCY_POLICY@1.0.0' as const;

export const AUDIT_LOGICAL_RECORD_FAMILIES = [
  'RULE_GOVERNANCE_RECORD',
  'RULE_EVALUATION_RECORD',
  'PERSISTED_MUTATION_RECORD',
  'DERIVATION_MATERIALIZATION_RECORD',
  'REVIEW_DECISION_RECORD',
  'PROPAGATION_OR_TRANSITION_RECORD',
] as const;

export type AuditLogicalRecordFamily =
  typeof AUDIT_LOGICAL_RECORD_FAMILIES[number];

export const RULE_VERSION_IDENTITY_FIELDS = [
  'rule_key',
  'rule_version_id',
  'rule_family',
  'policy_coordinate',
  'semantic_class',
  'operation_kind',
  'language_profile',
  'version_number',
  'content_digest',
  'status',
  'effective_from',
  'effective_to',
  'supersedes_rule_version_id',
] as const;

export const RESOLVED_VERSION_DEPENDENCY_KEYS = [
  'field_policy_version',
  'field_class_catalog_version',
  'capitalization_policy_version',
  'connector_catalog_version',
  'official_exception_catalog_version',
  'orthographic_dictionary_version',
  'review_decision_version',
  'search_policy_version',
  'language_and_unicode_profile_version',
  'algorithm_artifact_version',
  'external_mapping_version',
] as const;

export type ResolvedVersionDependencyKey =
  typeof RESOLVED_VERSION_DEPENDENCY_KEYS[number];

export const RULE_LIFECYCLE_STATUSES = [
  'DRAFT',
  'APPROVED_PENDING_ACTIVATION',
  'ACTIVE',
  'SUSPENDED',
  'SUPERSEDED',
  'RETIRED',
  'REJECTED',
  'INVALIDATED',
] as const;

export type RuleLifecycleStatus = typeof RULE_LIFECYCLE_STATUSES[number];

export const RULE_ACTIVATION_METADATA_FIELDS = [
  'approved_at',
  'approved_by_authority',
  'effective_from',
  'effective_to',
  'activation_scope',
  'activation_environment',
  'activation_event_id',
] as const;

export const VERSION_COMPATIBILITY_MODES = [
  'ACTIVE_ONLY',
  'DUAL_EVALUATION_SHADOW',
  'HISTORICAL_READ_ONLY',
  'REPLAY_ONLY',
  'INCOMPATIBLE_BLOCKED',
] as const;

export type VersionCompatibilityMode =
  typeof VERSION_COMPATIBILITY_MODES[number];

export const ALGORITHM_PROVENANCE_FIELDS = [
  'algorithm_key',
  'algorithm_version',
  'artifact_identity',
  'artifact_digest',
  'source_revision_or_commit',
  'runtime_contract_version',
  'language_profile',
  'unicode_version',
  'tokenizer_version',
  'catalog_version_set',
  'configuration_digest',
] as const;

export const AUDIT_EVENT_KINDS = [
  'RULE_VERSION_PROPOSED',
  'RULE_VERSION_APPROVED',
  'RULE_VERSION_ACTIVATED',
  'RULE_VERSION_SUSPENDED',
  'RULE_VERSION_SUPERSEDED',
  'RULE_VERSION_RETIRED',
  'RULE_EVALUATED',
  'RULE_MUTATION_COMMITTED',
  'RULE_DERIVATION_MATERIALIZED',
  'RULE_BLOCK_OR_REVIEW_EMITTED',
  'RULE_REPLAY_OR_RECONCILIATION_RECORDED',
  'RULE_COMPENSATION_OR_ROLLBACK_RECORDED',
] as const;

export type AuditEventKind = typeof AUDIT_EVENT_KINDS[number];

export const AUDIT_RECORD_FIELDS = [
  'audit_event_id',
  'logical_operation_id',
  'attempt_id',
  'correlation_id',
  'causation_id',
  'event_kind',
  'event_time',
  'recorded_at',
  'actor_or_service_identity',
  'authorization_context',
  'reason_code',
  'policy_coordinate',
  'entity_type',
  'entity_id',
  'source_field_coordinate',
  'source_value_version_or_hash',
  'before_value_reference_or_hash',
  'after_value_reference_or_hash',
  'requested_operation',
  'resolved_version_set',
  'version_set_digest',
  'algorithm_provenance',
  'idempotency_key',
  'idempotency_payload_digest',
  'expected_source_version_or_hash',
  'outcome',
  'outcome_reason',
  'review_case_or_decision_reference',
  'propagation_or_transition_reference',
  'environment',
] as const;

export const EVALUATION_OUTCOMES = [
  'APPLIED_CHANGE',
  'NO_CHANGE_ALREADY_CANONICAL',
  'DERIVED',
  'PRESERVED',
  'NOT_APPLICABLE',
  'BLOCKED_POLICY',
  'BLOCKED_CONFLICT',
  'REVIEW_REQUIRED',
  'ESCALATED_STRUCTURAL',
  'FAILED_TECHNICAL',
] as const;

export type EvaluationOutcome = typeof EVALUATION_OUTCOMES[number];

export const LOGICAL_RETENTION_CLASSES = [
  'GOVERNANCE_IMMUTABLE',
  'MUTATION_EVIDENCE',
  'DERIVATION_REPRODUCIBILITY',
  'OPERATIONAL_DIAGNOSTIC',
  'SENSITIVE_REFERENCE',
] as const;

export type LogicalRetentionClass =
  typeof LOGICAL_RETENTION_CLASSES[number];

export const REPRODUCIBILITY_LEVELS = [
  'FULL_REPLAYABLE',
  'REFERENCE_REPLAYABLE',
  'DECISION_RECONSTRUCTABLE',
] as const;

export type ReproducibilityLevel = typeof REPRODUCIBILITY_LEVELS[number];

export const SEMANTIC_TIME_FIELDS = [
  'observed_at',
  'requested_at',
  'evaluated_at',
  'effect_committed_at',
  'effective_from',
  'effective_to',
  'recorded_at',
] as const;

export const IDEMPOTENCY_KEY_COMPONENTS = [
  'operation_kind',
  'actor_or_service_scope',
  'target_entity_type',
  'target_entity_id',
  'source_field_coordinate',
  'source_value_version_or_hash',
  'requested_operation',
  'version_set_digest',
  'business_correlation_or_command_id',
] as const;

export const IDEMPOTENT_OPERATION_CLASSES = [
  'PURE_EVALUATION',
  'PERSISTED_MUTATION',
  'DERIVATION_MATERIALIZATION',
  'RULE_LIFECYCLE_TRANSITION',
  'REVIEW_DECISION_RECORDING',
  'PROPAGATION_OR_TRANSITION_COMMAND',
] as const;

export type IdempotentOperationClass =
  typeof IDEMPOTENT_OPERATION_CLASSES[number];

export const CONCURRENCY_EXPECTATION_FIELDS = [
  'expected_source_version_or_hash',
  'expected_policy_coordinate',
  'expected_version_set_digest',
  'expected_current_state',
] as const;

export type ConcurrencyExpectationField =
  typeof CONCURRENCY_EXPECTATION_FIELDS[number];

export const REPLAY_CONTRACT_FIELDS = [
  'replay_id',
  'source_event_or_decision_set',
  'source_snapshot_or_reference',
  'version_set_digest',
  'algorithm_provenance',
  'replay_environment',
  'expected_outcomes',
  'actual_outcomes',
  'difference_classification',
] as const;

export const IDEMPOTENCY_PAYLOAD_CONFLICT_REASON =
  'IDEMPOTENCY_PAYLOAD_CONFLICT' as const;

export const RULE_LIFECYCLE_TRANSITIONS = {
  DRAFT: ['APPROVED_PENDING_ACTIVATION', 'REJECTED'],
  APPROVED_PENDING_ACTIVATION: ['ACTIVE', 'SUSPENDED', 'REJECTED'],
  ACTIVE: ['SUSPENDED', 'SUPERSEDED', 'RETIRED', 'INVALIDATED'],
  SUSPENDED: ['ACTIVE', 'SUPERSEDED', 'RETIRED', 'INVALIDATED'],
  SUPERSEDED: [],
  RETIRED: [],
  REJECTED: [],
  INVALIDATED: [],
} as const satisfies Readonly<Record<RuleLifecycleStatus, readonly RuleLifecycleStatus[]>>;

export type ExplicitLogicalValue<T> =
  | { readonly state: 'VALUE'; readonly value: T }
  | { readonly state: 'NOT_APPLICABLE'; readonly value: null };

export interface NormalizationDigestAdapter {
  readonly algorithm_key: string;
  readonly algorithm_version: string;
  readonly digest_utf8: (canonicalUtf8Text: string) => string;
}

export interface RuleVersionIdentity {
  readonly rule_key: string;
  readonly rule_version_id: string;
  readonly rule_family: string;
  readonly policy_coordinate: string;
  readonly semantic_class: NormalizableFieldSemanticClass;
  readonly operation_kind: NormalizationOperationKind;
  readonly language_profile: ExplicitLogicalValue<string>;
  readonly version_number: string;
  readonly content_digest: string;
  readonly status: RuleLifecycleStatus;
  readonly effective_from: ExplicitLogicalValue<string>;
  readonly effective_to: ExplicitLogicalValue<string>;
  readonly supersedes_rule_version_id: ExplicitLogicalValue<string>;
}

export type ResolvedVersionDependencyState = 'RESOLVED' | 'NOT_APPLICABLE';

export interface ResolvedVersionDependency {
  readonly dependency_key: ResolvedVersionDependencyKey;
  readonly state: ResolvedVersionDependencyState;
  readonly version_ref: string | null;
  readonly content_digest: string | null;
}

export interface ResolvedVersionSet {
  readonly resolved_version_set: readonly ResolvedVersionDependency[];
  readonly version_set_digest: string;
  readonly digest_algorithm_key: string;
  readonly digest_algorithm_version: string;
}

export type ResolvedVersionSetBuildResult =
  | { readonly ok: true; readonly value: ResolvedVersionSet }
  | { readonly ok: false; readonly reason: string };

export interface RuleActivationMetadata {
  readonly approved_at: ExplicitLogicalValue<string>;
  readonly approved_by_authority: ExplicitLogicalValue<string>;
  readonly effective_from: ExplicitLogicalValue<string>;
  readonly effective_to: ExplicitLogicalValue<string>;
  readonly activation_scope: ExplicitLogicalValue<string>;
  readonly activation_environment: ExplicitLogicalValue<string>;
  readonly activation_event_id: ExplicitLogicalValue<string>;
}

export interface AlgorithmProvenance {
  readonly algorithm_key: string;
  readonly algorithm_version: string;
  readonly artifact_identity: string;
  readonly artifact_digest: string;
  readonly source_revision_or_commit: ExplicitLogicalValue<string>;
  readonly runtime_contract_version: string;
  readonly language_profile: ExplicitLogicalValue<string>;
  readonly unicode_version: ExplicitLogicalValue<string>;
  readonly tokenizer_version: ExplicitLogicalValue<string>;
  readonly catalog_version_set: ExplicitLogicalValue<Readonly<Record<string, string>>>;
  readonly configuration_digest: string;
}

export interface NormalizationSemanticTimes {
  readonly observed_at: ExplicitLogicalValue<string>;
  readonly requested_at: ExplicitLogicalValue<string>;
  readonly evaluated_at: ExplicitLogicalValue<string>;
  readonly effect_committed_at: ExplicitLogicalValue<string>;
  readonly effective_from: ExplicitLogicalValue<string>;
  readonly effective_to: ExplicitLogicalValue<string>;
  readonly recorded_at: ExplicitLogicalValue<string>;
}

export interface NormalizationAuditRecord {
  readonly audit_event_id: string;
  readonly logical_operation_id: string;
  readonly attempt_id: string;
  readonly correlation_id: string;
  readonly causation_id: ExplicitLogicalValue<string>;
  readonly event_kind: AuditEventKind;
  readonly event_time: string;
  readonly recorded_at: string;
  readonly actor_or_service_identity: ExplicitLogicalValue<string>;
  readonly authorization_context: ExplicitLogicalValue<Readonly<Record<string, unknown>>>;
  readonly reason_code: string;
  readonly policy_coordinate: string;
  readonly entity_type: ExplicitLogicalValue<string>;
  readonly entity_id: ExplicitLogicalValue<string>;
  readonly source_field_coordinate: ExplicitLogicalValue<string>;
  readonly source_value_version_or_hash: ExplicitLogicalValue<string>;
  readonly before_value_reference_or_hash: ExplicitLogicalValue<string>;
  readonly after_value_reference_or_hash: ExplicitLogicalValue<string>;
  readonly requested_operation: string;
  readonly resolved_version_set: readonly ResolvedVersionDependency[];
  readonly version_set_digest: string;
  readonly algorithm_provenance: AlgorithmProvenance;
  readonly idempotency_key: ExplicitLogicalValue<string>;
  readonly idempotency_payload_digest: ExplicitLogicalValue<string>;
  readonly expected_source_version_or_hash: ExplicitLogicalValue<string>;
  readonly outcome: EvaluationOutcome;
  readonly outcome_reason: string;
  readonly review_case_or_decision_reference: ExplicitLogicalValue<string>;
  readonly propagation_or_transition_reference: ExplicitLogicalValue<string>;
  readonly environment: string;
}

export interface LogicalAuditEnvelope {
  readonly record_family: AuditLogicalRecordFamily;
  readonly record: NormalizationAuditRecord;
  readonly retention_class: LogicalRetentionClass;
  readonly reproducibility_level: ReproducibilityLevel;
  readonly semantic_times: NormalizationSemanticTimes;
}

export interface AuditRecordValidation {
  readonly valid: boolean;
  readonly blockers: readonly string[];
  readonly persistence_authority: false;
  readonly authorization_authority: false;
}

export interface IdempotencyKeyInput {
  readonly operation_kind: NormalizationOperationKind;
  readonly actor_or_service_scope: string;
  readonly target_entity_type: string;
  readonly target_entity_id: string;
  readonly source_field_coordinate: string;
  readonly source_value_version_or_hash: string;
  readonly requested_operation: string;
  readonly version_set_digest: string;
  readonly business_correlation_or_command_id: string;
}

export interface MaterializedIdempotencyKey {
  readonly idempotency_key: string;
  readonly canonical_payload: string;
  readonly digest_algorithm_key: string;
  readonly digest_algorithm_version: string;
}

export type MaterializedIdempotencyKeyResult =
  | { readonly ok: true; readonly value: MaterializedIdempotencyKey }
  | { readonly ok: false; readonly reason: string };

export interface PriorIdempotencyState {
  readonly idempotency_key: string;
  readonly idempotency_payload_digest: string;
  readonly outcome: EvaluationOutcome;
  readonly effect_confirmation_reference: ExplicitLogicalValue<string>;
}

export type IdempotencyAssessment =
  | { readonly disposition: 'NEW_OPERATION'; readonly outcome: null; readonly reason: null }
  | {
      readonly disposition: 'REUSE_PRIOR_OUTCOME';
      readonly outcome: EvaluationOutcome;
      readonly reason: null;
    }
  | {
      readonly disposition: 'BLOCKED_CONFLICT';
      readonly outcome: 'BLOCKED_CONFLICT';
      readonly reason: string;
    };

export interface ConcurrencyExpectation {
  readonly expected_source_version_or_hash: string;
  readonly expected_policy_coordinate: string;
  readonly expected_version_set_digest: string;
  readonly expected_current_state: string;
}

export interface CurrentConcurrencyState {
  readonly source_version_or_hash: string;
  readonly policy_coordinate: string;
  readonly version_set_digest: string;
  readonly current_state: string;
}

export interface ConcurrencyAssessment {
  readonly compatible: boolean;
  readonly mismatches: readonly ConcurrencyExpectationField[];
  readonly state_authority: false;
}

export interface ReplayContract {
  readonly replay_id: string;
  readonly source_event_or_decision_set: readonly string[];
  readonly source_snapshot_or_reference: string;
  readonly version_set_digest: string;
  readonly algorithm_provenance: AlgorithmProvenance;
  readonly replay_environment: string;
  readonly expected_outcomes: readonly EvaluationOutcome[];
  readonly actual_outcomes: readonly EvaluationOutcome[];
  readonly difference_classification: string;
}

export interface ReplayValidation {
  readonly valid: boolean;
  readonly blockers: readonly string[];
  readonly production_mutation_authority: false;
}

export interface PreviewAuditProjectionInput {
  readonly outcome: EvaluationOutcome;
  readonly outcome_reason: string;
  readonly resolved_version_set: readonly ResolvedVersionDependency[];
  readonly version_set_digest: string;
  readonly algorithm_provenance: AlgorithmProvenance;
}

export interface PreviewAuditProjection {
  readonly preview_result: NormalizationPreview['result'];
  readonly resolved_version_set: readonly ResolvedVersionDependency[];
  readonly version_set_digest: string;
  readonly source_value_version_or_hash: string | null;
  readonly algorithm_provenance: AlgorithmProvenance;
  readonly outcome: Exclude<EvaluationOutcome, 'APPLIED_CHANGE'>;
  readonly outcome_reason: string;
  readonly binding: 'NON_BINDING';
  readonly effect_committed_at: { readonly state: 'NOT_APPLICABLE'; readonly value: null };
  readonly commit_authority: false;
}

export type PreviewAuditProjectionResult =
  | { readonly ok: true; readonly value: PreviewAuditProjection }
  | { readonly ok: false; readonly reason: string };

function nonEmpty(value: string): boolean {
  return value.trim().length > 0;
}

function explicitValueIsValid<T>(value: ExplicitLogicalValue<T>): boolean {
  return value.state === 'NOT_APPLICABLE'
    ? value.value === null
    : value.value !== null && value.value !== undefined;
}

function stringLogicalValueIsValid(value: ExplicitLogicalValue<string>): boolean {
  return explicitValueIsValid(value)
    && (value.state === 'NOT_APPLICABLE' || nonEmpty(value.value));
}

function safeDigest(adapter: NormalizationDigestAdapter, payload: string): string | null {
  if (!nonEmpty(adapter.algorithm_key) || !nonEmpty(adapter.algorithm_version)) return null;
  try {
    const digest = adapter.digest_utf8(payload);
    return typeof digest === 'string' && nonEmpty(digest) ? digest : null;
  } catch {
    return null;
  }
}

function dependencyRank(key: ResolvedVersionDependencyKey): number {
  return RESOLVED_VERSION_DEPENDENCY_KEYS.indexOf(key);
}

function canonicalVersionSetPayload(entries: readonly ResolvedVersionDependency[]): string {
  return JSON.stringify(entries.map((entry) => ({
    dependency_key: entry.dependency_key,
    state: entry.state,
    version_ref: entry.version_ref,
    content_digest: entry.content_digest,
  })));
}

export function materializeResolvedVersionSet(
  dependencies: readonly ResolvedVersionDependency[],
  digestAdapter: NormalizationDigestAdapter,
): ResolvedVersionSetBuildResult {
  if (dependencies.length === 0) {
    return { ok: false, reason: 'RESOLVED_VERSION_SET_EMPTY' };
  }

  const seen = new Set<ResolvedVersionDependencyKey>();
  const normalized: ResolvedVersionDependency[] = [];

  for (const dependency of dependencies) {
    if (!RESOLVED_VERSION_DEPENDENCY_KEYS.includes(dependency.dependency_key)) {
      return { ok: false, reason: 'UNKNOWN_VERSION_DEPENDENCY' };
    }
    if (seen.has(dependency.dependency_key)) {
      return { ok: false, reason: 'DUPLICATE_VERSION_DEPENDENCY' };
    }
    seen.add(dependency.dependency_key);

    if (dependency.state === 'RESOLVED') {
      if (
        dependency.version_ref === null
        || !nonEmpty(dependency.version_ref)
        || dependency.version_ref.toLowerCase() === 'latest'
        || dependency.content_digest === null
        || !nonEmpty(dependency.content_digest)
      ) {
        return { ok: false, reason: 'INVALID_RESOLVED_VERSION_DEPENDENCY' };
      }
    } else if (dependency.state === 'NOT_APPLICABLE') {
      if (dependency.version_ref !== null || dependency.content_digest !== null) {
        return { ok: false, reason: 'NOT_APPLICABLE_DEPENDENCY_HAS_VALUE' };
      }
    } else {
      return { ok: false, reason: 'INVALID_VERSION_DEPENDENCY_STATE' };
    }

    normalized.push({ ...dependency });
  }

  normalized.sort((left, right) => (
    dependencyRank(left.dependency_key) - dependencyRank(right.dependency_key)
  ));

  const digest = safeDigest(digestAdapter, canonicalVersionSetPayload(normalized));
  if (digest === null) return { ok: false, reason: 'VERSION_SET_DIGEST_FAILED' };

  return {
    ok: true,
    value: {
      resolved_version_set: normalized,
      version_set_digest: digest,
      digest_algorithm_key: digestAdapter.algorithm_key,
      digest_algorithm_version: digestAdapter.algorithm_version,
    },
  };
}

export function validateRuleVersionIdentity(identity: RuleVersionIdentity): readonly string[] {
  const blockers: string[] = [];
  for (const value of [
    identity.rule_key,
    identity.rule_version_id,
    identity.rule_family,
    identity.policy_coordinate,
    identity.version_number,
    identity.content_digest,
  ]) {
    if (!nonEmpty(value)) blockers.push('RULE_VERSION_IDENTITY_REQUIRED_VALUE_MISSING');
  }
  if (!RULE_LIFECYCLE_STATUSES.includes(identity.status)) blockers.push('RULE_VERSION_STATUS_INVALID');
  if (!stringLogicalValueIsValid(identity.language_profile)) blockers.push('LANGUAGE_PROFILE_INVALID');
  if (!stringLogicalValueIsValid(identity.effective_from)) blockers.push('EFFECTIVE_FROM_INVALID');
  if (!stringLogicalValueIsValid(identity.effective_to)) blockers.push('EFFECTIVE_TO_INVALID');
  if (!stringLogicalValueIsValid(identity.supersedes_rule_version_id)) blockers.push('SUPERSEDES_INVALID');
  return [...new Set(blockers)];
}

export function lifecycleTransitionDisposition(
  current: RuleLifecycleStatus,
  requested: RuleLifecycleStatus,
): 'ALLOWED_TRANSITION' | 'NO_TRANSITION_ALREADY_AT_STATE' | 'BLOCKED_TRANSITION' {
  if (current === requested) return 'NO_TRANSITION_ALREADY_AT_STATE';
  return RULE_LIFECYCLE_TRANSITIONS[current].includes(requested as never)
    ? 'ALLOWED_TRANSITION'
    : 'BLOCKED_TRANSITION';
}

export function validateActivationMetadata(metadata: RuleActivationMetadata): readonly string[] {
  const blockers: string[] = [];
  for (const [name, value] of Object.entries(metadata)) {
    if (!explicitValueIsValid(value)) blockers.push(`ACTIVATION_METADATA_INVALID:${name}`);
    if (value.state === 'VALUE' && typeof value.value === 'string' && !nonEmpty(value.value)) {
      blockers.push(`ACTIVATION_METADATA_EMPTY:${name}`);
    }
  }
  return blockers;
}

export function validateAlgorithmProvenance(provenance: AlgorithmProvenance): readonly string[] {
  const blockers: string[] = [];
  for (const [name, value] of [
    ['algorithm_key', provenance.algorithm_key],
    ['algorithm_version', provenance.algorithm_version],
    ['artifact_identity', provenance.artifact_identity],
    ['artifact_digest', provenance.artifact_digest],
    ['runtime_contract_version', provenance.runtime_contract_version],
    ['configuration_digest', provenance.configuration_digest],
  ] as const) {
    if (!nonEmpty(value) || value.toLowerCase() === 'latest') blockers.push(`PROVENANCE_INVALID:${name}`);
  }
  for (const [name, value] of [
    ['source_revision_or_commit', provenance.source_revision_or_commit],
    ['language_profile', provenance.language_profile],
    ['unicode_version', provenance.unicode_version],
    ['tokenizer_version', provenance.tokenizer_version],
  ] as const) {
    if (!stringLogicalValueIsValid(value)) blockers.push(`PROVENANCE_INVALID:${name}`);
    if (value.state === 'VALUE' && value.value.toLowerCase() === 'latest') {
      blockers.push(`PROVENANCE_LATEST_FORBIDDEN:${name}`);
    }
  }
  if (!explicitValueIsValid(provenance.catalog_version_set)) {
    blockers.push('PROVENANCE_INVALID:catalog_version_set');
  } else if (provenance.catalog_version_set.state === 'VALUE') {
    for (const value of Object.values(provenance.catalog_version_set.value)) {
      if (!nonEmpty(value) || value.toLowerCase() === 'latest') {
        blockers.push('PROVENANCE_INVALID:catalog_version_set');
        break;
      }
    }
  }
  return [...new Set(blockers)];
}

function familyAcceptsEvent(family: AuditLogicalRecordFamily, eventKind: AuditEventKind): boolean {
  const allowed: Readonly<Record<AuditLogicalRecordFamily, readonly AuditEventKind[]>> = {
    RULE_GOVERNANCE_RECORD: [
      'RULE_VERSION_PROPOSED',
      'RULE_VERSION_APPROVED',
      'RULE_VERSION_ACTIVATED',
      'RULE_VERSION_SUSPENDED',
      'RULE_VERSION_SUPERSEDED',
      'RULE_VERSION_RETIRED',
    ],
    RULE_EVALUATION_RECORD: ['RULE_EVALUATED', 'RULE_BLOCK_OR_REVIEW_EMITTED'],
    PERSISTED_MUTATION_RECORD: ['RULE_MUTATION_COMMITTED'],
    DERIVATION_MATERIALIZATION_RECORD: ['RULE_DERIVATION_MATERIALIZED'],
    REVIEW_DECISION_RECORD: ['RULE_BLOCK_OR_REVIEW_EMITTED'],
    PROPAGATION_OR_TRANSITION_RECORD: [
      'RULE_REPLAY_OR_RECONCILIATION_RECORDED',
      'RULE_COMPENSATION_OR_ROLLBACK_RECORDED',
    ],
  };
  return allowed[family].includes(eventKind);
}

function logicalStringRequired(value: ExplicitLogicalValue<string>): boolean {
  return value.state === 'VALUE' && nonEmpty(value.value);
}

export function validateLogicalAuditEnvelope(
  envelope: LogicalAuditEnvelope,
): AuditRecordValidation {
  const blockers: string[] = [];
  const record = envelope.record;

  if (!AUDIT_LOGICAL_RECORD_FAMILIES.includes(envelope.record_family)) blockers.push('RECORD_FAMILY_INVALID');
  if (!AUDIT_EVENT_KINDS.includes(record.event_kind)) blockers.push('EVENT_KIND_INVALID');
  if (!familyAcceptsEvent(envelope.record_family, record.event_kind)) blockers.push('EVENT_FAMILY_MISMATCH');
  if (!EVALUATION_OUTCOMES.includes(record.outcome)) blockers.push('OUTCOME_INVALID');
  if (!LOGICAL_RETENTION_CLASSES.includes(envelope.retention_class)) blockers.push('RETENTION_CLASS_INVALID');
  if (!REPRODUCIBILITY_LEVELS.includes(envelope.reproducibility_level)) blockers.push('REPRODUCIBILITY_LEVEL_INVALID');

  for (const value of [
    record.audit_event_id,
    record.logical_operation_id,
    record.attempt_id,
    record.correlation_id,
    record.event_time,
    record.recorded_at,
    record.reason_code,
    record.policy_coordinate,
    record.requested_operation,
    record.version_set_digest,
    record.outcome_reason,
    record.environment,
  ]) {
    if (!nonEmpty(value)) blockers.push('AUDIT_REQUIRED_VALUE_MISSING');
  }

  if (record.version_set_digest.toLowerCase() === 'latest') blockers.push('LATEST_VERSION_SET_FORBIDDEN');
  if (record.resolved_version_set.length === 0) blockers.push('AUDIT_VERSION_SET_EMPTY');
  blockers.push(...validateAlgorithmProvenance(record.algorithm_provenance));

  for (const value of [
    record.causation_id,
    record.actor_or_service_identity,
    record.entity_type,
    record.entity_id,
    record.source_field_coordinate,
    record.source_value_version_or_hash,
    record.before_value_reference_or_hash,
    record.after_value_reference_or_hash,
    record.idempotency_key,
    record.idempotency_payload_digest,
    record.expected_source_version_or_hash,
    record.review_case_or_decision_reference,
    record.propagation_or_transition_reference,
  ]) {
    if (!stringLogicalValueIsValid(value)) blockers.push('AUDIT_LOGICAL_VALUE_INVALID');
  }
  if (!explicitValueIsValid(record.authorization_context)) blockers.push('AUTHORIZATION_CONTEXT_INVALID');

  for (const [name, semanticTime] of Object.entries(envelope.semantic_times)) {
    if (!stringLogicalValueIsValid(semanticTime)) blockers.push(`SEMANTIC_TIME_INVALID:${name}`);
  }

  const effectFamilies = new Set<AuditLogicalRecordFamily>([
    'PERSISTED_MUTATION_RECORD',
    'DERIVATION_MATERIALIZATION_RECORD',
    'PROPAGATION_OR_TRANSITION_RECORD',
  ]);
  const effectCommitted = envelope.semantic_times.effect_committed_at;

  if (envelope.record_family === 'RULE_EVALUATION_RECORD' && record.outcome === 'APPLIED_CHANGE') {
    blockers.push('EVALUATION_CANNOT_ASSERT_APPLIED_CHANGE');
  }
  if (!effectFamilies.has(envelope.record_family) && effectCommitted.state !== 'NOT_APPLICABLE') {
    blockers.push('NON_EFFECT_RECORD_CANNOT_ASSERT_COMMIT_TIME');
  }
  if (
    (envelope.record_family === 'PERSISTED_MUTATION_RECORD'
      || envelope.record_family === 'DERIVATION_MATERIALIZATION_RECORD')
    && !logicalStringRequired(effectCommitted)
  ) {
    blockers.push('CONFIRMED_EFFECT_REQUIRES_COMMIT_TIME');
  }
  if (
    record.outcome === 'APPLIED_CHANGE'
    && !['PERSISTED_MUTATION_RECORD', 'PROPAGATION_OR_TRANSITION_RECORD'].includes(envelope.record_family)
  ) {
    blockers.push('APPLIED_CHANGE_REQUIRES_EFFECT_RECORD');
  }
  if (
    (record.event_kind === 'RULE_MUTATION_COMMITTED'
      || record.event_kind === 'RULE_DERIVATION_MATERIALIZED')
    && (!logicalStringRequired(record.actor_or_service_identity)
      || record.authorization_context.state !== 'VALUE')
  ) {
    blockers.push('CONFIRMED_EFFECT_REQUIRES_OWNER_CONTEXT');
  }

  return {
    valid: blockers.length === 0,
    blockers: [...new Set(blockers)],
    persistence_authority: false,
    authorization_authority: false,
  };
}

export function materializeIdempotencyKey(
  input: IdempotencyKeyInput,
  digestAdapter: NormalizationDigestAdapter,
): MaterializedIdempotencyKeyResult {
  const ordered = IDEMPOTENCY_KEY_COMPONENTS.map((key) => [key, input[key]] as const);
  if (ordered.some(([, value]) => !nonEmpty(value))) {
    return { ok: false, reason: 'IDEMPOTENCY_COMPONENT_MISSING' };
  }
  if (input.version_set_digest.toLowerCase() === 'latest') {
    return { ok: false, reason: 'IDEMPOTENCY_VERSION_SET_LATEST_FORBIDDEN' };
  }
  const canonicalPayload = JSON.stringify(Object.fromEntries(ordered));
  const digest = safeDigest(digestAdapter, canonicalPayload);
  if (digest === null) return { ok: false, reason: 'IDEMPOTENCY_DIGEST_FAILED' };
  return {
    ok: true,
    value: {
      idempotency_key: digest,
      canonical_payload: canonicalPayload,
      digest_algorithm_key: digestAdapter.algorithm_key,
      digest_algorithm_version: digestAdapter.algorithm_version,
    },
  };
}

export function assessPriorIdempotencyState(
  requestedKey: string,
  requestedPayloadDigest: string,
  prior: PriorIdempotencyState | null,
): IdempotencyAssessment {
  if (!nonEmpty(requestedKey) || !nonEmpty(requestedPayloadDigest)) {
    return {
      disposition: 'BLOCKED_CONFLICT',
      outcome: 'BLOCKED_CONFLICT',
      reason: 'IDEMPOTENCY_REQUEST_INCOMPLETE',
    };
  }
  if (prior === null || prior.idempotency_key !== requestedKey) {
    return { disposition: 'NEW_OPERATION', outcome: null, reason: null };
  }
  if (prior.idempotency_payload_digest !== requestedPayloadDigest) {
    return {
      disposition: 'BLOCKED_CONFLICT',
      outcome: 'BLOCKED_CONFLICT',
      reason: IDEMPOTENCY_PAYLOAD_CONFLICT_REASON,
    };
  }
  if (prior.outcome === 'APPLIED_CHANGE' && !logicalStringRequired(prior.effect_confirmation_reference)) {
    return {
      disposition: 'BLOCKED_CONFLICT',
      outcome: 'BLOCKED_CONFLICT',
      reason: 'PRIOR_EFFECT_CONFIRMATION_MISSING',
    };
  }
  return {
    disposition: 'REUSE_PRIOR_OUTCOME',
    outcome: prior.outcome,
    reason: null,
  };
}

export function assessConcurrency(
  expected: ConcurrencyExpectation,
  current: CurrentConcurrencyState,
): ConcurrencyAssessment {
  const mismatches: ConcurrencyExpectationField[] = [];
  if (expected.expected_source_version_or_hash !== current.source_version_or_hash) {
    mismatches.push('expected_source_version_or_hash');
  }
  if (expected.expected_policy_coordinate !== current.policy_coordinate) {
    mismatches.push('expected_policy_coordinate');
  }
  if (expected.expected_version_set_digest !== current.version_set_digest) {
    mismatches.push('expected_version_set_digest');
  }
  if (expected.expected_current_state !== current.current_state) {
    mismatches.push('expected_current_state');
  }
  return {
    compatible: mismatches.length === 0,
    mismatches,
    state_authority: false,
  };
}

export function validateReplayContract(replay: ReplayContract): ReplayValidation {
  const blockers: string[] = [];
  for (const value of [
    replay.replay_id,
    replay.source_snapshot_or_reference,
    replay.version_set_digest,
    replay.replay_environment,
    replay.difference_classification,
  ]) {
    if (!nonEmpty(value)) blockers.push('REPLAY_REQUIRED_VALUE_MISSING');
  }
  if (replay.version_set_digest.toLowerCase() === 'latest') blockers.push('REPLAY_LATEST_FORBIDDEN');
  if (replay.source_event_or_decision_set.length === 0
    || new Set(replay.source_event_or_decision_set).size !== replay.source_event_or_decision_set.length
    || replay.source_event_or_decision_set.some((entry) => !nonEmpty(entry))) {
    blockers.push('REPLAY_SOURCE_SET_INVALID');
  }
  if (replay.expected_outcomes.some((outcome) => !EVALUATION_OUTCOMES.includes(outcome))) {
    blockers.push('REPLAY_EXPECTED_OUTCOME_INVALID');
  }
  if (replay.actual_outcomes.some((outcome) => !EVALUATION_OUTCOMES.includes(outcome))) {
    blockers.push('REPLAY_ACTUAL_OUTCOME_INVALID');
  }
  blockers.push(...validateAlgorithmProvenance(replay.algorithm_provenance));
  return {
    valid: blockers.length === 0,
    blockers: [...new Set(blockers)],
    production_mutation_authority: false,
  };
}

export function projectNonBindingPreviewAuditMetadata(
  preview: NormalizationPreview,
  input: PreviewAuditProjectionInput,
): PreviewAuditProjectionResult {
  if (preview.binding !== 'NON_BINDING' || preview.commit_authority !== false) {
    return { ok: false, reason: 'PREVIEW_BINDING_BOUNDARY_INVALID' };
  }
  if (!nonEmpty(input.version_set_digest) || input.version_set_digest.toLowerCase() === 'latest') {
    return { ok: false, reason: 'PREVIEW_VERSION_SET_INVALID' };
  }
  if (!nonEmpty(input.outcome_reason)) return { ok: false, reason: 'PREVIEW_OUTCOME_REASON_REQUIRED' };
  if (input.outcome === 'APPLIED_CHANGE') {
    return { ok: false, reason: 'PREVIEW_CANNOT_ASSERT_APPLIED_CHANGE' };
  }
  const provenanceBlockers = validateAlgorithmProvenance(input.algorithm_provenance);
  if (provenanceBlockers.length > 0) {
    return { ok: false, reason: `PREVIEW_PROVENANCE_INVALID:${provenanceBlockers.join('|')}` };
  }
  return {
    ok: true,
    value: {
      preview_result: preview.result,
      resolved_version_set: input.resolved_version_set.map((dependency) => ({ ...dependency })),
      version_set_digest: input.version_set_digest,
      source_value_version_or_hash: preview.source_version_or_hash,
      algorithm_provenance: input.algorithm_provenance,
      outcome: input.outcome,
      outcome_reason: input.outcome_reason,
      binding: 'NON_BINDING',
      effect_committed_at: { state: 'NOT_APPLICABLE', value: null },
      commit_authority: false,
    },
  };
}

export function metadataContextDisposition(
  productBoundary: 'VENTO_OS' | 'VITAL',
  policyId: string,
): 'ALLOWED' | 'BLOCKED_VITAL' | 'BLOCKED_POLICY_ID' {
  if (productBoundary === 'VITAL') return 'BLOCKED_VITAL';
  return policyId === RULE_AUDIT_VERSION_POLICY_ID ? 'ALLOWED' : 'BLOCKED_POLICY_ID';
}
