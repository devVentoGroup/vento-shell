// GENERATED FILE. DO NOT EDIT.
// Semantic owners: INT-APP-004, INT-APP-005, INT-APP-007..010, INT-EXT-012, INT-EXT-017, INT-POS-013, INT-POS-020, INT-SALES-007, INT-SALES-008
// Contract task: SHELL-CON-023
// Foundation task: SHELL-CON-001
// External received event task: SHELL-CON-019
// External identifier mapping task: SHELL-CON-022
// Physical idempotency owner: INT-DB-005
// Physical reconciliation owner: INT-DB-008
// Physical processing audit owner: INT-DB-007
// Source contract SHA256: d6630e1e3280845765308579eb06302ce1b476da96475de675a1667e06ee68f0

import type { VentoCredentialEnvironment } from "./external-credential-ref.contract.js";
import type { IntegrationPrincipalId } from "./integration-principal.contract.js";
import type { ExternalIdentifierMappingRef } from "./external-identifier-mapping.contract.js";

export const INTEGRATION_IDEMPOTENCY_SCOPES = [
  "REQUEST_ACCEPTANCE",
  "OWNER_COMMAND",
  "EVENT_EMISSION",
  "CONSUMER_INBOX",
  "CONSUMER_EFFECT",
  "EXTERNAL_RECEIPT",
  "REPLAY_BATCH",
] as const;

export type IntegrationIdempotencyScope =
  typeof INTEGRATION_IDEMPOTENCY_SCOPES[number];

export const EXTERNAL_INTEGRATION_CLAIM_STATES = [
  "CLAIMED",
  "SUCCEEDED",
  "FAILED_RETRYABLE",
  "FAILED_FINAL",
  "OUTCOME_UNKNOWN",
  "CANCELLED",
  "EXPIRED",
] as const;

export type ExternalIntegrationClaimState =
  typeof EXTERNAL_INTEGRATION_CLAIM_STATES[number];

export const INTEGRATION_IDEMPOTENCY_OUTCOMES = [
  "APPLIED",
  "DUPLICATE_RESULT_RETURNED",
  "CONFLICTING_REUSE",
  "IN_PROGRESS_RECOVERABLE",
  "STALE_VERSION",
  "OUT_OF_ORDER_DEFERRED",
  "RECONCILIATION_REQUIRED",
  "REJECTED",
] as const;

export type IntegrationIdempotencyOutcome =
  typeof INTEGRATION_IDEMPOTENCY_OUTCOMES[number];

export const INTEGRATION_RECONCILIATION_CLOSURE_OUTCOMES = [
  "RESOLVED_CONFIRMED",
  "RESOLVED_NO_EFFECT",
  "RESOLVED_DUPLICATE_PRIOR_RESULT",
  "RESOLVED_CORRECTED",
  "RESOLVED_COMPENSATED",
  "RESOLVED_WITH_ACCEPTED_RESIDUAL",
  "PERMANENTLY_REJECTED",
  "SUPERSEDED_BY_SUCCESSOR",
] as const;

export type IntegrationReconciliationClosureOutcome =
  typeof INTEGRATION_RECONCILIATION_CLOSURE_OUTCOMES[number];

export interface IntegrationIdempotencyRef {
  readonly scope: IntegrationIdempotencyScope;
  readonly scope_owner_ref: string;
  readonly namespace_ref: string;
  readonly operation_key: string;
  readonly generation: string | null;
  readonly contract_version: string;
}

declare const integrationReconciliationRefBrand: unique symbol;

export type IntegrationReconciliationRef =
  string & {
    readonly [integrationReconciliationRefBrand]: "IntegrationReconciliationRef";
  };

export interface IntegrationIdempotencyRecord {
  readonly idempotency_ref: IntegrationIdempotencyRef;
  readonly logical_content_hash: string;
  readonly logical_content_hash_version: string;
  readonly resource_ref: string | null;
  readonly claim_state: ExternalIntegrationClaimState | null;
  readonly outcome: IntegrationIdempotencyOutcome;
  readonly result_ref: string | null;
  readonly external_system_id: string | null;
  readonly external_instance_id: string | null;
  readonly integration_principal_id: IntegrationPrincipalId | null;
  readonly environment: VentoCredentialEnvironment | null;
  readonly surface: string | null;
  readonly operation_kind: string | null;
  readonly provider_ref: string | null;
  readonly first_observed_at: string;
  readonly last_observed_at: string;
  readonly attempt_count: unknown;
  readonly finalized_at: string | null;
  readonly correlation_refs: readonly string[];
  readonly audit_ref: string | null;
  readonly reconciliation_ref: IntegrationReconciliationRef | null;
}

export interface IntegrationReconciliationCase {
  readonly reconciliation_ref: IntegrationReconciliationRef;
  readonly idempotency_ref: IntegrationIdempotencyRef | null;
  readonly owner_ref: string;
  readonly operation_ref: string | null;
  readonly event_ref: string | null;
  readonly receipt_ref: string | null;
  readonly mapping_refs: readonly ExternalIdentifierMappingRef[];
  readonly correlation_refs: readonly string[];
  readonly compared_source_refs: readonly string[];
  readonly evidence_refs: readonly string[];
  readonly attempt_refs: readonly string[];
  readonly observed_difference_refs: readonly string[];
  readonly owner_outcome_ref: string | null;
  readonly external_claim_state: ExternalIntegrationClaimState | null;
  readonly decision_ref: string | null;
  readonly closure_outcome: IntegrationReconciliationClosureOutcome | null;
  readonly residual_obligations: readonly string[];
  readonly next_action_ref: string | null;
  readonly responsible_owner_ref: string | null;
  readonly reactivation_condition_ref: string | null;
  readonly opened_at: string;
  readonly updated_at: string;
  readonly closed_at: string | null;
}

export const INTEGRATION_IDEMPOTENCY_SCOPE_POLICY = {
  scope_count: 7,
  global_vento_idempotency_key_exists: false,
  global_sale_idempotency_key_exists: false,
  request_acceptance_is_owner_command: false,
  owner_command_is_event_emission: false,
  event_emission_is_consumer_inbox: false,
  consumer_inbox_is_consumer_effect: false,
  external_receipt_is_business_effect: false,
  replay_batch_authorizes_sensitive_effect: false,
  scope_known_before_first_protected_effect: true,
  scope_owner_retains_result_authority: true,
  cross_scope_identifier_reuse_as_universal_identity_allowed: false,
  retry_redelivery_replay_preserve_compatible_scope_identity: true,
} as const;

export const INTEGRATION_IDEMPOTENCY_REF_POLICY = {
  exact_field_count: 6,
  operation_key_stable_within_scope: true,
  operation_key_fixed_before_first_effect: true,
  operation_key_is_secret: false,
  operation_key_changes_on_retry: false,
  operation_key_changes_on_redelivery: false,
  operation_key_changes_on_restart_worker_device_deployment_or_transport: false,
  generation_represents_legitimate_new_intent_only: true,
  generation_hides_conflict_or_unknown_result: false,
  namespace_ref_prevents_cross_system_environment_surface_contract_collision: true,
  scope_owner_ref_grants_cross_owner_authority: false,
  operation_key_serialization: "UNSPECIFIED",
  operation_key_syntax_pattern: null,
} as const;

export const INTEGRATION_EXTERNAL_OPERATION_NAMESPACE_POLICY = {
  minimum_dimensions: ["external_system_id", "environment", "surface", "operation_kind"],
  external_instance_id_added_when_collision_scope_requires_it: true,
  same_value_across_external_systems_is_same_operation: false,
  environments_share_deduplication_by_convenience: false,
  checkout_and_webhook_share_namespace_by_correlation_only: false,
  different_operation_kinds_share_key_by_default: false,
  external_system_id_replaces_operation_key: false,
  external_identifier_mapping_id_replaces_operation_key: false,
  integration_principal_id_replaces_operation_key: false,
  credential_or_secret_used_as_operation_identity: false,
} as const;

export const INTEGRATION_OPERATION_KEY_POLICY = {
  approved_pre_effect_identity_may_supply_key: true,
  source_command_id_may_supply_key: true,
  event_id_may_supply_key: true,
  stable_authenticated_external_id_may_supply_key_when_owner_contract_allows: true,
  provider_transaction_identity_may_supply_key_when_stability_and_scope_are_accredited: true,
  deterministic_versioned_composition_requires_sufficient_unambiguous_stable_fields: true,
  receipt_timestamp_is_sufficient: false,
  uuid_generated_after_unidentified_receipt_is_sufficient: false,
  filename_is_sufficient: false,
  row_position_is_sufficient: false,
  source_row_number_is_sufficient: false,
  email_or_phone_is_sufficient: false,
  site_id_alone_is_sufficient: false,
  product_name_or_amount_is_sufficient: false,
  coordinates_or_ip_are_sufficient: false,
  retry_count_attempt_id_delivery_id_trace_id_are_sufficient: false,
  mapping_id_is_sufficient: false,
  secret_value_is_sufficient: false,
} as const;

export const INTEGRATION_LOGICAL_FINGERPRINT_POLICY = {
  identity_answers_which_operation: true,
  fingerprint_answers_content_compatibility: true,
  logical_content_hash_required: true,
  logical_content_hash_version_required: true,
  same_identity_compatible_hash_recovers_prior_state_or_result: true,
  same_identity_incompatible_hash_result: "CONFLICTING_REUSE",
  incompatible_second_content_partial_application_allowed: false,
  only_owner_contract_material_fields_participate: true,
  technical_retry_delivery_trace_connection_metadata_excluded: true,
  secrets_and_credential_material_excluded: true,
  canonicalization_change_requires_identifiable_version: true,
  adapter_or_parser_upgrade_reinterprets_historical_hash_silently: false,
  physical_digest_algorithm_fixed_here: false,
} as const;

export const INTEGRATION_CLAIM_POLICY = {
  durable_or_equivalent_atomic_claim_required_when_scope_protects_effect: true,
  concurrent_same_identity_business_winner_count: 1,
  select_then_effect_then_record_without_equivalent_protection_is_sufficient: false,
  single_instance_memory_lock_is_distributed_guarantee: false,
  upsert_without_identity_and_hash_semantic_validation_is_sufficient: false,
  confirmed_effect_requires_recoverable_result_or_reference: true,
  expired_lease_proves_absence_of_commit: false,
  new_lease_allows_repeat_of_uncertain_effect: false,
  physical_uniqueness_owner_task_id: "INT-DB-005",
} as const;

export const INTEGRATION_IDEMPOTENCY_RESULT_POLICY = {
  duplicate_result_returned_new_mutation_count: 0,
  reconciliation_required_authorizes_retry: false,
  rejected_hides_partial_or_unknown_effect: false,
  stale_version_rewinds_confirmed_state: false,
  out_of_order_deferred_preserves_original_identity: true,
  outcome_is_business_resource_state: false,
  result_ref_targets_owner_durable_result: true,
  transport_ack_is_final_result_by_default: false,
  attempt_count_changes_identity: false,
} as const;

export const INTEGRATION_UNKNOWN_RESULT_POLICY = {
  timeout_proves_no_effect: false,
  retry_budget_exhaustion_proves_success_or_failure: false,
  worker_or_application_restart_clears_uncertainty: false,
  alternate_table_rpc_provider_application_or_endpoint_allows_new_identity: false,
  original_identity_consulted_before_repeat: true,
  owner_result_receipt_provider_ledger_or_authoritative_source_compared: true,
  confirmed_effect_recovers_result_without_repeat: true,
  demonstrated_no_effect_may_retry_same_identity_when_eligible: true,
  indeterminate_result_requires_reconciliation: true,
  unknown_operation_retains_owner_evidence_residual_and_next_action: true,
} as const;

export const INTEGRATION_RECOVERY_POLICY = {
  global_acid_transaction_across_owners_exists: false,
  recovery_targets_pending_or_uncertain_scope_only: true,
  confirmed_effect_reapplied_due_to_other_failure: false,
  mixed_result_may_remain_explicit: true,
  durable_commit_per_owner: true,
  identity_per_scope: true,
  recoverable_result_required: true,
  safe_retry_required: true,
  non_destructive_compensation_when_owner_contract_requires: true,
  evidence_based_reconciliation_required: true,
} as const;

export const INTEGRATION_RECONCILIATION_IDENTITY_POLICY = {
  identity_name: "IntegrationReconciliationRef",
  semantics: "STABLE_OPAQUE_NON_SECRET_RECONCILIATION_CASE_IDENTITY",
  serialization: "UNSPECIFIED",
  syntax_pattern: null,
  static_registry: false,
  materialized_ref_count: 0,
  is_idempotency_key: false,
  is_event_id: false,
  is_receipt_id: false,
  is_mapping_id: false,
  is_sale_id: false,
  is_effect_id: false,
  multiple_sources_may_be_correlated_without_identity_fusion: true,
  new_evidence_revision_keeps_same_case_for_same_divergence_by_default: true,
  successor_case_preserves_predecessor_reference: true,
} as const;

export const INTEGRATION_RECONCILIATION_SOURCE_POLICY = {
  owner_sources_remain_authoritative: true,
  reconciliation_layer_replaces_owner_source: false,
  durable_owner_result_may_be_compared: true,
  accredited_external_receipt_may_be_compared: true,
  provider_queryable_state_may_be_compared: true,
  owner_ledger_may_be_compared: true,
  event_and_version_may_be_compared: true,
  consumer_inbox_and_effect_result_may_be_compared: true,
  accredited_mapping_may_be_compared: true,
  protected_source_evidence_may_be_compared: true,
  correlated_audit_may_be_compared: true,
  confirmed_compensation_result_may_be_compared: true,
  isolated_log_replaces_owner_result: false,
  metric_replaces_ledger: false,
  transport_ack_replaces_business_effect: false,
  projection_row_replaces_distinct_owner_source: false,
  amount_date_name_product_terminal_timestamp_similarity_proves_identity: false,
  new_evidence_rewrites_previous_review_evidence: false,
} as const;

export const INTEGRATION_RECONCILIATION_CLOSURE_POLICY = {
  closure_outcome_count: 8,
  unknown_closure_outcome_exists: false,
  outcome_unknown_closes_case_by_itself: false,
  result_unknown_closes_case_by_itself: false,
  permanently_rejected_allowed_with_partial_or_uncertain_effect: false,
  resolved_corrected_allows_destructive_original_edit: false,
  resolved_compensated_requires_confirmed_compensation_ref: true,
  accepted_residual_requires_residual_responsible_owner_and_authority: true,
  superseded_by_successor_requires_successor_ref: true,
  age_retry_count_or_alert_silence_closes_case: false,
} as const;

export const INTEGRATION_CONCEPT_SEPARATION_POLICY = {
  mapping_is_idempotency: false,
  correlation_is_idempotency: false,
  idempotency_is_reconciliation: false,
  mapping_resolution_authorizes_retry_or_effect: false,
  idempotency_result_grants_business_authorization: false,
  correlation_proves_object_equivalence: false,
  reconciliation_may_compare_operations_without_identity_fusion: true,
} as const;

export const INTEGRATION_EXTERNAL_EVENT_COMPATIBILITY_POLICY = {
  external_received_event_contract_task_id: "SHELL-CON-019",
  current_idempotency_ref_storage: "GENERIC_STRING_REFERENCE_OR_NULL",
  typed_target_ref: "IntegrationIdempotencyRef",
  consumer_migration_materialized_here: false,
  received_event_may_exist_without_business_idempotency_key: true,
  receipt_confirms_business_effect: false,
  external_event_id_may_supply_key_only_when_stability_and_namespace_are_accredited: true,
  redelivery_preserves_applicable_idempotency_identity: true,
  uncertain_event_may_link_reconciliation_ref_without_changing_receipt_or_external_identity: true,
  authenticity_mapping_and_idempotency_are_independent_controls: true,
} as const;

export const INTEGRATION_SALE_EFFECT_BOUNDARY_POLICY = {
  canonical_sale_id_is_universal_effect_key: false,
  canonical_sale_line_id_is_universal_effect_key: false,
  sale_is_event: false,
  event_is_consumer_inbox: false,
  nexo_effect_is_numera_effect: false,
  numera_effect_is_pass_effect: false,
  pass_effect_is_nexo_effect: false,
  each_consumer_retains_independent_inbox: true,
  each_effect_retains_owner_identity: true,
  pending_mapping_may_preserve_line_without_fabricating_effect: true,
  recovering_pending_effect_reemits_sale_or_confirmed_effects: false,
  compensation_is_retry_of_original_effect: false,
  reconciliation_vector_creates_global_state_machine: false,
} as const;

export const INTEGRATION_POS_IDEMPOTENCY_POLICY = {
  source_system_scope_preserved: true,
  external_sale_scope_preserved: true,
  external_sale_line_scope_preserved: true,
  external_sale_key_requires_source_system: true,
  external_sale_key_uses_source_instance_when_applicable: true,
  external_sale_key_requires_accredited_external_sale_id: true,
  external_sale_line_key_requires_accredited_external_line_id: true,
  source_row_number_is_line_identity: false,
  file_hash_is_sale_identity: false,
  date_site_total_product_or_position_is_valid_heuristic_identity: false,
  receipt_identity_may_support_evidence_reprocessing_without_becoming_sale_id: true,
  makos_excel_proves_individual_sale_or_line_idempotency: false,
  pos_reconciliation_owner_task_id: "INT-POS-020",
  permanent_sale_control_task_ids: ["INT-SALES-007", "INT-SALES-008"],
} as const;

export const INTEGRATION_IDEMPOTENCY_RECONCILIATION_ADOPTION = [
{
  external_system_id: "EXT-SYS-001",
  system: "Supabase",
  classification: "GOBERNADA_POR_CONTRATO_INTERNO",
  state: "ESPECIFICADO",
  decision_summary: "Shared infrastructure does not create a global platform idempotency key; owner scopes remain authoritative.",
  materialized_operation_count: 0,
  materialized_reconciliation_case_count: 0,
},
{
  external_system_id: "EXT-SYS-002",
  system: "Wompi",
  classification: "APLICA_IDEMPOTENCIA_Y_CONCILIACION",
  state: "ESPECIFICADO",
  decision_summary: "Transactions, webhooks and uncertain outcomes preserve namespace, key, fingerprint, claim and reconciliation before repeat effect.",
  materialized_operation_count: 0,
  materialized_reconciliation_case_count: 0,
},
{
  external_system_id: "EXT-SYS-003",
  system: "RevenueCat",
  classification: "APLICA_IDEMPOTENCIA_Y_CONCILIACION",
  state: "ESPECIFICADO",
  decision_summary: "Accredited identity is preserved; versioned deterministic fingerprint may only support approved absence of native ID without identity fusion.",
  materialized_operation_count: 0,
  materialized_reconciliation_case_count: 0,
},
{
  external_system_id: "EXT-SYS-004",
  system: "Resend",
  classification: "APLICA_IDEMPOTENCIA_Y_CONCILIACION",
  state: "ESPECIFICADO",
  decision_summary: "Retry preserves the same logical operation; intentional business resend uses a new generation and ACK is not business delivery confirmation.",
  materialized_operation_count: 0,
  materialized_reconciliation_case_count: 0,
},
{
  external_system_id: "EXT-SYS-005",
  system: "Expo / EAS Update",
  classification: "PLATAFORMA_TECNICA_SIN_EFECTO_EMPRESARIAL_EN_CORTE",
  state: "NO_APLICA",
  decision_summary: "Release and configuration references do not become a business idempotency ledger in the current cut.",
  materialized_operation_count: 0,
  materialized_reconciliation_case_count: 0,
},
{
  external_system_id: "EXT-SYS-006",
  system: "Expo Push Service",
  classification: "APLICA_IDEMPOTENCIA_Y_CONCILIACION",
  state: "ESPECIFICADO",
  decision_summary: "Logical notification delivery preserves operation identity while per-destination outcomes remain independent.",
  materialized_operation_count: 0,
  materialized_reconciliation_case_count: 0,
},
{
  external_system_id: "EXT-SYS-007",
  system: "Sentry",
  classification: "SIN_LEDGER_DE_EFECTO_EMPRESARIAL",
  state: "NO_APLICA",
  decision_summary: "Best-effort observability is not promoted to business idempotency or authoritative reconciliation.",
  materialized_operation_count: 0,
  materialized_reconciliation_case_count: 0,
},
{
  external_system_id: "EXT-SYS-008",
  system: "Google Maps / Google Reviews",
  classification: "SIN_LEDGER_DE_EFECTO_EMPRESARIAL",
  state: "NO_APLICA",
  decision_summary: "Interactive reads receive no business idempotency ledger without an accredited durable effect.",
  materialized_operation_count: 0,
  materialized_reconciliation_case_count: 0,
},
{
  external_system_id: "EXT-SYS-009",
  system: "Apple Wallet / PassKit y APNs",
  classification: "APLICA_IDEMPOTENCIA_Y_CONCILIACION",
  state: "ESPECIFICADO",
  decision_summary: "Resource mutation and push are distinct surfaces; uncertain remote or physical outcome is queried or reconciled before repetition.",
  materialized_operation_count: 0,
  materialized_reconciliation_case_count: 0,
},
{
  external_system_id: "EXT-SYS-010",
  system: "Vercel",
  classification: "PLATAFORMA_TECNICA_SIN_EFECTO_EMPRESARIAL_EN_CORTE",
  state: "NO_APLICA",
  decision_summary: "Project, deployment and domain remain technical references without a global business operation key.",
  materialized_operation_count: 0,
  materialized_reconciliation_case_count: 0,
},
{
  external_system_id: "EXT-SYS-011",
  system: "Zebra BrowserPrint",
  classification: "APLICA_IDEMPOTENCIA_Y_CONCILIACION",
  state: "ESPECIFICADO",
  decision_summary: "Uncertain physical print result requires verification or reconciliation; deliberate reprint is a new generation rather than retry.",
  materialized_operation_count: 0,
  materialized_reconciliation_case_count: 0,
},
{
  external_system_id: "EXT-SYS-012",
  system: "Google Wallet / Google Pay & Wallet",
  classification: "MODELO_SIN_BINDING_REMOTO",
  state: "NO_APLICA",
  decision_summary: "Documented model has no accredited remote binding, so runtime operation, claim, result and reconciliation are not fabricated.",
  materialized_operation_count: 0,
  materialized_reconciliation_case_count: 0,
},
{
  external_system_id: "EXT-SYS-013",
  system: "POS externo vigente",
  classification: "APLICA_CON_ESPECIALIZACION_POS",
  state: "PENDIENTE_DE_EVIDENCIA",
  decision_summary: "INT-POS-013 and INT-POS-020 govern specialization; makos_excel does not prove individual sale or line identity and no keys are fabricated.",
  materialized_operation_count: 0,
  materialized_reconciliation_case_count: 0,
},
{
  external_system_id: "EXT-SYS-014",
  system: "Shopify / comercio electronico",
  classification: "NO_APLICA_SIN_BINDING",
  state: "NO_APLICA",
  decision_summary: "No accredited binding exists for a concrete idempotent operation.",
  materialized_operation_count: 0,
  materialized_reconciliation_case_count: 0,
},
{
  external_system_id: "EXT-SYS-015",
  system: "Rappi / marketplace",
  classification: "NO_APLICA_SIN_BINDING",
  state: "NO_APLICA",
  decision_summary: "No accredited binding exists; order, store, courier operation and reconciliation are not invented.",
  materialized_operation_count: 0,
  materialized_reconciliation_case_count: 0,
},
{
  external_system_id: "EXT-SYS-016",
  system: "ManyChat / automatizacion conversacional",
  classification: "NO_APLICA_SIN_BINDING",
  state: "NO_APLICA",
  decision_summary: "No accredited bot or API binding exists; operations, subscriber identifiers and results are not invented.",
  materialized_operation_count: 0,
  materialized_reconciliation_case_count: 0,
},
{
  external_system_id: "EXT-SYS-017",
  system: "WhatsApp",
  classification: "NO_APLICA_SIN_BINDING",
  state: "NO_APLICA",
  decision_summary: "No accredited provider, API or binding exists; phone or conversation does not create canonical operation identity.",
  materialized_operation_count: 0,
  materialized_reconciliation_case_count: 0,
},
{
  external_system_id: "EXT-SYS-018",
  system: "Instagram / social",
  classification: "NO_APLICA_SIN_BINDING",
  state: "NO_APLICA",
  decision_summary: "No accredited API binding exists; message IDs, claims and reconciliation are not invented.",
  materialized_operation_count: 0,
  materialized_reconciliation_case_count: 0,
},
{
  external_system_id: "EXT-SYS-019",
  system: "Correo corporativo y alias funcionales",
  classification: "NO_APLICA_SIN_BINDING",
  state: "NO_APLICA",
  decision_summary: "Mailbox or alias existence does not establish technical integration or idempotent operation.",
  materialized_operation_count: 0,
  materialized_reconciliation_case_count: 0,
},
{
  external_system_id: "EXT-SYS-020",
  system: "Telefonia / voz",
  classification: "BLOQUEADO_SIN_BINDING",
  state: "BLOQUEADO",
  decision_summary: "TI-INT-003 must accredit operator, account, interface, identifiers and semantics before instantiating this contract.",
  materialized_operation_count: 0,
  materialized_reconciliation_case_count: 0,
},
{
  external_system_id: "EXT-SYS-021",
  system: "Transporte externo",
  classification: "NO_APLICA_SIN_BINDING",
  state: "NO_APLICA",
  decision_summary: "Without accredited provider and interface, tracking operation or reconciliation is not fabricated.",
  materialized_operation_count: 0,
  materialized_reconciliation_case_count: 0,
},
] as const;

export const INTEGRATION_IDEMPOTENCY_RECONCILIATION_COVERAGE = {
  expected_external_system_count: 21,
  adopted_external_system_count: 21,
  missing_external_system_count: 0,
  duplicate_external_system_count: 0,
  unique_external_system_id_count: 21,
  governed_by_internal_contract_count: 1,
  idempotency_and_reconciliation_count: 6,
  no_business_effect_ledger_count: 2,
  technical_platform_without_business_effect_count: 2,
  model_without_remote_binding_count: 1,
  pos_specialization_count: 1,
  no_binding_not_applicable_count: 7,
  blocked_without_binding_count: 1,
  materialized_idempotency_record_count: 0,
  materialized_reconciliation_case_count: 0,
} as const;

export const INTEGRATION_IDEMPOTENCY_RECONCILIATION_SECURITY_POLICY = {
  idempotency_is_authorization: false,
  reconciliation_is_authorization: false,
  operation_key_is_permission_or_secret: false,
  integration_principal_grants_business_authority: false,
  credential_grants_business_authority: false,
  service_role_is_business_principal: false,
  full_payload_allowed: false,
  token_allowed: false,
  signature_allowed: false,
  password_allowed: false,
  api_key_allowed: false,
  credential_material_allowed: false,
  protected_refs_and_hashes_preferred_when_sufficient: true,
  reconciliation_cross_owner_direct_write_allowed: false,
  corrective_action_retains_owner_actor_authorization_cause_and_evidence: true,
} as const;

export const INTEGRATION_IDEMPOTENCY_RECONCILIATION_CONTRACT_METADATA = {
  logical_namespace: "@vento/contracts/integrations",
  contract_task_id: "SHELL-CON-023",
  semantic_owner_task_ids: [
    "INT-APP-004",
    "INT-APP-005",
    "INT-APP-007",
    "INT-APP-008",
    "INT-APP-009",
    "INT-APP-010",
    "INT-EXT-012",
    "INT-EXT-017",
    "INT-POS-013",
    "INT-POS-020",
    "INT-SALES-007",
    "INT-SALES-008",
  ],
  external_received_event_contract_task_id: "SHELL-CON-019",
  external_identifier_mapping_contract_task_id: "SHELL-CON-022",
  physical_idempotency_owner_task_id: "INT-DB-005",
  physical_reconciliation_owner_task_id: "INT-DB-008",
  physical_processing_audit_owner_task_id: "INT-DB-007",
  disposition_contract_task_id: "SHELL-CON-024",
  next_contract_task_id: "SHELL-CON-024",
  execution_gate: "PRE_E5_FOUNDATION",
  physical_mode: "GLOBAL_ENABLE_ONCE",
  public_export_published: false,
  package_root_index_extended: false,
  consumer_adoption_materialized: false,
  persistence_materialized: false,
  claim_runtime_materialized: false,
  retry_runtime_materialized: false,
  reconciliation_runtime_materialized: false,
  endpoint_materialized: false,
  worker_materialized: false,
  migration_materialized: false,
  supabase_changed: false,
  materialized_idempotency_record_count: 0,
  materialized_reconciliation_case_count: 0,
} as const;

export type IntegrationIdempotencyScopePolicy = typeof INTEGRATION_IDEMPOTENCY_SCOPE_POLICY;
export type IntegrationIdempotencyRefPolicy = typeof INTEGRATION_IDEMPOTENCY_REF_POLICY;
export type IntegrationExternalOperationNamespacePolicy = typeof INTEGRATION_EXTERNAL_OPERATION_NAMESPACE_POLICY;
export type IntegrationOperationKeyPolicy = typeof INTEGRATION_OPERATION_KEY_POLICY;
export type IntegrationLogicalFingerprintPolicy = typeof INTEGRATION_LOGICAL_FINGERPRINT_POLICY;
export type IntegrationClaimPolicy = typeof INTEGRATION_CLAIM_POLICY;
export type IntegrationIdempotencyResultPolicy = typeof INTEGRATION_IDEMPOTENCY_RESULT_POLICY;
export type IntegrationUnknownResultPolicy = typeof INTEGRATION_UNKNOWN_RESULT_POLICY;
export type IntegrationRecoveryPolicy = typeof INTEGRATION_RECOVERY_POLICY;
export type IntegrationReconciliationIdentityPolicy = typeof INTEGRATION_RECONCILIATION_IDENTITY_POLICY;
export type IntegrationReconciliationSourcePolicy = typeof INTEGRATION_RECONCILIATION_SOURCE_POLICY;
export type IntegrationReconciliationClosurePolicy = typeof INTEGRATION_RECONCILIATION_CLOSURE_POLICY;
export type IntegrationConceptSeparationPolicy = typeof INTEGRATION_CONCEPT_SEPARATION_POLICY;
export type IntegrationExternalEventCompatibilityPolicy = typeof INTEGRATION_EXTERNAL_EVENT_COMPATIBILITY_POLICY;
export type IntegrationSaleEffectBoundaryPolicy = typeof INTEGRATION_SALE_EFFECT_BOUNDARY_POLICY;
export type IntegrationPosIdempotencyPolicy = typeof INTEGRATION_POS_IDEMPOTENCY_POLICY;
export type IntegrationIdempotencyReconciliationSecurityPolicy = typeof INTEGRATION_IDEMPOTENCY_RECONCILIATION_SECURITY_POLICY;
export type IntegrationIdempotencyReconciliationContractMetadata = typeof INTEGRATION_IDEMPOTENCY_RECONCILIATION_CONTRACT_METADATA;
