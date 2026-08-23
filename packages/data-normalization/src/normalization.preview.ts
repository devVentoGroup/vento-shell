import type {
  NormalizableFieldDescriptor,
  NormalizationOperationKind,
} from './normalization.types.js';

/**
 * Pure, internal and non-binding preview contract for SHELL-NORM-007::GLOBAL.
 *
 * This module has no I/O, persistence, clock, cache, identity, uniqueness or
 * commit authority. The authoritative semantic evaluator is always injected.
 */

export const PREVIEW_AUTHORITY_FUNCTIONS = [
  'PREVIEW_AND_GUIDANCE',
  'AUTHORITATIVE_SEMANTIC_EVALUATION',
  'TRANSACTIONAL_REVALIDATION_AND_COMMIT',
  'DEFENSIVE_INVARIANT_ENFORCEMENT',
] as const;

export const PREVIEW_LOGICAL_LAYERS = [
  'APPLICATION_INTERACTION_LAYER',
  'DOMAIN_NORMALIZATION_SERVICE',
  'TRANSACTIONAL_RPC_BOUNDARY',
  'DEFENSIVE_DATABASE_TRIGGER',
] as const;

export const NORMALIZATION_EVALUATION_QUERY_FAMILY =
  'NORMALIZATION_EVALUATION_QUERY' as const;

export const PREVIEW_PLACEMENT_DESCRIPTOR_FIELDS = [
  'execution_policy_key',
  'operation_kind',
  'policy_coordinate',
  'semantic_class',
  'representation_role',
  'source_role',
  'primary_semantic_authority',
  'transactional_boundary',
  'application_preview_mode',
  'trigger_mode',
  'allowed_callers',
  'required_authorization_context',
  'resolved_version_dependencies',
  'idempotency_class',
  'concurrency_expectations',
  'mutation_target',
  'synchronous_derivations',
  'audit_owner',
  'failure_mode',
  'bypass_policy',
  'propagation_policy',
] as const;

export const PREVIEW_TRANSACTION_FLOW = [
  'CAPTURE_INTENT_VALUE_CONTEXT_AND_OBSERVED_VERSION',
  'OPTIONAL_NON_BINDING_SERVER_PREVIEW',
  'SEND_COMMAND_WITH_ID_AND_SOURCE_EXPECTATION',
  'AUTHENTICATE_AUTHORIZE_AND_BUILD_IDEMPOTENT_OPERATION',
  'RESOLVE_COORDINATE_VERSIONS_AND_DOMAIN_RESULT',
  'REVALIDATE_STATE_CONCURRENCY_UNIQUENESS_AND_PRECONDITIONS',
  'PERSIST_SOURCE_SYNCHRONOUS_DERIVATIONS_AND_ROOT_AUDIT',
  'CHECK_AUTHORIZED_DEFENSIVE_INVARIANTS',
  'COMMIT_AND_RETURN_RESULT',
  'CONTINUE_ASYNCHRONOUS_CHILD_COMMANDS',
] as const;

export const PREVIEW_DIVERGENCE_DIMENSIONS = [
  'VALUE',
  'SCOPE',
  'POLICY',
  'VERSION_SET',
  'UNIQUENESS',
  'RELATIONSHIPS',
] as const;

export type PreviewDivergenceDimension =
  typeof PREVIEW_DIVERGENCE_DIMENSIONS[number];

export const PREVIEW_RESULTS = [
  'NO_CHANGE',
  'PROPOSED_CHANGE',
  'BLOCKED_POLICY',
  'BLOCKED_CONFLICT',
  'REVIEW_REQUIRED',
  'ESCALATED_STRUCTURAL',
  'TECHNICAL_FAILURE',
] as const;

export type PreviewResult = typeof PREVIEW_RESULTS[number];

export type ApplicationPreviewMode =
  | 'SERVER_PREVIEW_OPTIONAL'
  | 'SERVER_PREVIEW_REQUIRED'
  | 'PREVIEW_DISABLED';

export interface ResolvedPreviewVersionDependency {
  readonly dependency_key: string;
  readonly version_ref: string;
  readonly status: 'ACTIVE' | 'SUSPENDED' | 'RETIRED' | 'INCOMPATIBLE';
}

export interface PreviewPlacementDescriptor {
  readonly execution_policy_key: string;
  readonly operation_kind: NormalizationOperationKind;
  readonly policy_coordinate: string;
  readonly semantic_class: NormalizableFieldDescriptor['semantic_class'];
  readonly representation_role: NormalizableFieldDescriptor['representation_role'];
  readonly source_role: NormalizableFieldDescriptor['source_role'];
  readonly primary_semantic_authority: 'DOMAIN_NORMALIZATION_SERVICE';
  readonly transactional_boundary: string;
  readonly application_preview_mode: ApplicationPreviewMode;
  readonly trigger_mode: string;
  readonly allowed_callers: readonly string[];
  readonly required_authorization_context: readonly string[];
  readonly resolved_version_dependencies: readonly ResolvedPreviewVersionDependency[];
  readonly idempotency_class: string;
  readonly concurrency_expectations: string;
  readonly mutation_target: string | null;
  readonly synchronous_derivations: readonly string[];
  readonly audit_owner: string;
  readonly failure_mode: string;
  readonly bypass_policy: string;
  readonly propagation_policy: string;
}

export interface NormalizationPreviewRequest {
  readonly query_family: typeof NORMALIZATION_EVALUATION_QUERY_FAMILY;
  readonly operation_intent: string;
  readonly field_descriptor: NormalizableFieldDescriptor;
  readonly placement_descriptor: PreviewPlacementDescriptor;
  readonly observed_value: unknown;
  readonly scope_ref: string;
  readonly purpose_ref: string;
  readonly source_version_or_hash: string | null;
  readonly resolved_version_set: readonly ResolvedPreviewVersionDependency[];
  readonly version_set_digest: string;
  readonly observed_at: string;
  readonly authorization_context: Readonly<Record<string, unknown>>;
  readonly structured_parameters?: Readonly<Record<string, unknown>>;
}

export interface PreviewAuthorizationResolver {
  readonly authorization_version_ref: string;
  readonly authorize_preview: (request: NormalizationPreviewRequest) => boolean;
}

export interface AuthoritativeSemanticEvaluation {
  readonly result: PreviewResult;
  readonly proposed_or_preserved_value: unknown;
  readonly explanation: string;
  readonly operations_consumed: readonly string[];
  readonly derivations: readonly unknown[];
  readonly matches: readonly unknown[];
  readonly blocking_detail: string | null;
}

export interface AuthoritativeSemanticEvaluator {
  readonly evaluator_version_ref: string;
  readonly evaluate: (
    request: NormalizationPreviewRequest,
  ) => AuthoritativeSemanticEvaluation;
}

export interface NormalizationPreview {
  readonly query_family: typeof NORMALIZATION_EVALUATION_QUERY_FAMILY;
  readonly authority_function: 'PREVIEW_AND_GUIDANCE';
  readonly semantic_authority: 'AUTHORITATIVE_SEMANTIC_EVALUATION';
  readonly binding: 'NON_BINDING';
  readonly observed_value: unknown;
  readonly proposed_or_preserved_value: unknown;
  readonly result: PreviewResult;
  readonly explanation: string;
  readonly operations_consumed: readonly string[];
  readonly derivations: readonly unknown[];
  readonly matches: readonly unknown[];
  readonly scope_ref: string;
  readonly purpose_ref: string;
  readonly policy_coordinate: string;
  readonly source_version_or_hash: string | null;
  readonly resolved_version_set: readonly ResolvedPreviewVersionDependency[];
  readonly version_set_digest: string;
  readonly observed_at: string;
  readonly evaluator_version_ref: string;
  readonly authorization_version_ref: string;
  readonly blocking_detail: string | null;
  readonly commit_authority: false;
  readonly mutation_performed: false;
  readonly state_reserved: false;
  readonly uniqueness_certified: false;
  readonly identity_decided: false;
  readonly requires_transactional_revalidation: true;
}

export interface PreviewDivergenceSnapshot {
  readonly value_version_or_hash: string | null;
  readonly scope_ref: string;
  readonly policy_coordinate: string;
  readonly version_set_digest: string;
  readonly uniqueness_state_ref: string | null;
  readonly relationships_state_ref: string | null;
}

export interface PreviewDivergenceAnalysis {
  readonly changed_dimensions: readonly PreviewDivergenceDimension[];
  readonly has_material_divergence: boolean;
  readonly disposition:
    | 'REVALIDATION_REQUIRED_DUE_TO_DIVERGENCE'
    | 'TRANSACTIONAL_REVALIDATION_STILL_REQUIRED';
  readonly commit_authority: false;
}

const NON_BINDING_FLAGS = {
  commit_authority: false,
  mutation_performed: false,
  state_reserved: false,
  uniqueness_certified: false,
  identity_decided: false,
  requires_transactional_revalidation: true,
} as const;

function nonEmpty(value: string): boolean {
  return value.trim().length > 0;
}

function blockedPreview(
  request: NormalizationPreviewRequest,
  authorizationVersionRef: string,
  evaluatorVersionRef: string,
  result: Extract<PreviewResult, 'BLOCKED_POLICY' | 'TECHNICAL_FAILURE'>,
  detail: string,
): NormalizationPreview {
  return {
    query_family: NORMALIZATION_EVALUATION_QUERY_FAMILY,
    authority_function: 'PREVIEW_AND_GUIDANCE',
    semantic_authority: 'AUTHORITATIVE_SEMANTIC_EVALUATION',
    binding: 'NON_BINDING',
    observed_value: request.observed_value,
    proposed_or_preserved_value: request.observed_value,
    result,
    explanation: detail,
    operations_consumed: [],
    derivations: [],
    matches: [],
    scope_ref: request.scope_ref,
    purpose_ref: request.purpose_ref,
    policy_coordinate: request.placement_descriptor.policy_coordinate,
    source_version_or_hash: request.source_version_or_hash,
    resolved_version_set: request.resolved_version_set,
    version_set_digest: request.version_set_digest,
    observed_at: request.observed_at,
    evaluator_version_ref: evaluatorVersionRef,
    authorization_version_ref: authorizationVersionRef,
    blocking_detail: detail,
    ...NON_BINDING_FLAGS,
  };
}

function requestBlocker(request: NormalizationPreviewRequest): string | null {
  const placement = request.placement_descriptor;
  if (request.query_family !== NORMALIZATION_EVALUATION_QUERY_FAMILY) {
    return 'UNSUPPORTED_QUERY_FAMILY';
  }
  if (!nonEmpty(request.operation_intent) || !nonEmpty(request.scope_ref)
    || !nonEmpty(request.purpose_ref) || !nonEmpty(request.version_set_digest)
    || !nonEmpty(request.observed_at)) {
    return 'INCOMPLETE_PREVIEW_CONTEXT';
  }
  if (placement.primary_semantic_authority !== 'DOMAIN_NORMALIZATION_SERVICE') {
    return 'INVALID_SEMANTIC_AUTHORITY';
  }
  if (placement.application_preview_mode === 'PREVIEW_DISABLED') {
    return 'PREVIEW_DISABLED_BY_DESCRIPTOR';
  }
  if (placement.semantic_class !== request.field_descriptor.semantic_class
    || placement.representation_role !== request.field_descriptor.representation_role
    || placement.source_role !== request.field_descriptor.source_role
    || placement.policy_coordinate !== request.field_descriptor.policy_version_ref) {
    return 'DESCRIPTOR_MISMATCH';
  }
  if (request.field_descriptor.semantic_class === 'SECRET_OR_SIGNATURE_MATERIAL') {
    return 'PROTECTED_MATERIAL_EXCLUDED';
  }
  if (request.resolved_version_set.length === 0
    || request.resolved_version_set.some((dependency) => (
      !nonEmpty(dependency.dependency_key)
      || !nonEmpty(dependency.version_ref)
      || dependency.version_ref.toLowerCase() === 'latest'
      || dependency.status !== 'ACTIVE'
    ))) {
    return 'UNRESOLVED_OR_INACTIVE_VERSION_SET';
  }
  const descriptorVersions = placement.resolved_version_dependencies;
  if (descriptorVersions.length !== request.resolved_version_set.length
    || descriptorVersions.some((dependency, index) => {
      const resolved = request.resolved_version_set[index];
      return resolved === undefined
        || dependency.dependency_key !== resolved.dependency_key
        || dependency.version_ref !== resolved.version_ref
        || dependency.status !== resolved.status;
    })) {
    return 'VERSION_SET_DESCRIPTOR_MISMATCH';
  }
  return null;
}

export function createNormalizationPreview(
  request: NormalizationPreviewRequest,
  authorization: PreviewAuthorizationResolver,
  evaluator: AuthoritativeSemanticEvaluator,
): NormalizationPreview {
  const blocker = requestBlocker(request);
  if (blocker !== null) {
    return blockedPreview(
      request,
      authorization.authorization_version_ref,
      evaluator.evaluator_version_ref,
      'BLOCKED_POLICY',
      blocker,
    );
  }

  if (!authorization.authorize_preview(request)) {
    return blockedPreview(
      request,
      authorization.authorization_version_ref,
      evaluator.evaluator_version_ref,
      'BLOCKED_POLICY',
      'PREVIEW_NOT_AUTHORIZED',
    );
  }

  let evaluation: AuthoritativeSemanticEvaluation;
  try {
    evaluation = evaluator.evaluate(request);
  } catch {
    return blockedPreview(
      request,
      authorization.authorization_version_ref,
      evaluator.evaluator_version_ref,
      'TECHNICAL_FAILURE',
      'AUTHORITATIVE_EVALUATOR_FAILURE',
    );
  }

  if (!PREVIEW_RESULTS.includes(evaluation.result) || !nonEmpty(evaluation.explanation)) {
    return blockedPreview(
      request,
      authorization.authorization_version_ref,
      evaluator.evaluator_version_ref,
      'TECHNICAL_FAILURE',
      'INVALID_AUTHORITATIVE_EVALUATION',
    );
  }

  return {
    query_family: NORMALIZATION_EVALUATION_QUERY_FAMILY,
    authority_function: 'PREVIEW_AND_GUIDANCE',
    semantic_authority: 'AUTHORITATIVE_SEMANTIC_EVALUATION',
    binding: 'NON_BINDING',
    observed_value: request.observed_value,
    proposed_or_preserved_value: evaluation.proposed_or_preserved_value,
    result: evaluation.result,
    explanation: evaluation.explanation,
    operations_consumed: [...evaluation.operations_consumed],
    derivations: [...evaluation.derivations],
    matches: [...evaluation.matches],
    scope_ref: request.scope_ref,
    purpose_ref: request.purpose_ref,
    policy_coordinate: request.placement_descriptor.policy_coordinate,
    source_version_or_hash: request.source_version_or_hash,
    resolved_version_set: request.resolved_version_set.map((dependency) => ({ ...dependency })),
    version_set_digest: request.version_set_digest,
    observed_at: request.observed_at,
    evaluator_version_ref: evaluator.evaluator_version_ref,
    authorization_version_ref: authorization.authorization_version_ref,
    blocking_detail: evaluation.blocking_detail,
    ...NON_BINDING_FLAGS,
  };
}

export function analyzePreviewDivergence(
  previewSnapshot: PreviewDivergenceSnapshot,
  currentSnapshot: PreviewDivergenceSnapshot,
): PreviewDivergenceAnalysis {
  const changed: PreviewDivergenceDimension[] = [];
  if (previewSnapshot.value_version_or_hash !== currentSnapshot.value_version_or_hash) changed.push('VALUE');
  if (previewSnapshot.scope_ref !== currentSnapshot.scope_ref) changed.push('SCOPE');
  if (previewSnapshot.policy_coordinate !== currentSnapshot.policy_coordinate) changed.push('POLICY');
  if (previewSnapshot.version_set_digest !== currentSnapshot.version_set_digest) changed.push('VERSION_SET');
  if (previewSnapshot.uniqueness_state_ref !== currentSnapshot.uniqueness_state_ref) changed.push('UNIQUENESS');
  if (previewSnapshot.relationships_state_ref !== currentSnapshot.relationships_state_ref) changed.push('RELATIONSHIPS');

  return {
    changed_dimensions: changed,
    has_material_divergence: changed.length > 0,
    disposition: changed.length > 0
      ? 'REVALIDATION_REQUIRED_DUE_TO_DIVERGENCE'
      : 'TRANSACTIONAL_REVALIDATION_STILL_REQUIRED',
    commit_authority: false,
  };
}
