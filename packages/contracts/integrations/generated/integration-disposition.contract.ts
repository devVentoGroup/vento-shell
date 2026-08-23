// GENERATED FILE. DO NOT EDIT.
// Semantic owners: INT-APP-006, INT-APP-009, INT-EXT-016, INT-EXT-017, INT-POS-012, INT-POS-019, INT-POS-020
// Contract task: SHELL-CON-024
// Foundation task: SHELL-CON-001
// External received event task: SHELL-CON-019
// External identifier mapping task: SHELL-CON-022
// Idempotency and reconciliation task: SHELL-CON-023
// Physical quarantine owner: INT-DB-006
// Physical processing audit owner: INT-DB-007
// Physical reconciliation owner: INT-DB-008
// Source contract SHA256: aae1f418511d792568d76a309b98fcdab74fbb13dc7ae4b559fa9561f5f72f30

import type { VentoCredentialEnvironment } from "./external-credential-ref.contract.js";
import type { IntegrationPrincipalRef } from "./integration-principal.contract.js";
import type { ExternalIdentifierMappingRef } from "./external-identifier-mapping.contract.js";
import type {
  IntegrationIdempotencyRef,
  IntegrationReconciliationClosureOutcome,
  IntegrationReconciliationRef,
} from "./integration-idempotency-reconciliation.contract.js";

declare const integrationDispositionCaseIdBrand: unique symbol;
declare const integrationQuarantineRefBrand: unique symbol;
declare const integrationDeadLetterRefBrand: unique symbol;

export type IntegrationDispositionCaseId =
  string & {
    readonly [integrationDispositionCaseIdBrand]: "IntegrationDispositionCaseId";
  };

export type IntegrationQuarantineRef =
  string & {
    readonly [integrationQuarantineRefBrand]: "IntegrationQuarantineRef";
  };

export type IntegrationDeadLetterRef =
  string & {
    readonly [integrationDeadLetterRefBrand]: "IntegrationDeadLetterRef";
  };

export type IntegrationDispositionCaseRef = Readonly<{
  readonly integration_disposition_case_id: IntegrationDispositionCaseId;
  readonly contract_version: string;
}>;

export interface IntegrationCompensationPlanRef {
  readonly plan_ref: string;
  readonly contract_version: string;
  readonly original_confirmed_effect_ref: string;
  readonly owner_ref: string;
  readonly ccr_action_ref: string;
  readonly plan_outcome_ref: string | null;
  readonly verification_refs: readonly string[];
  readonly audit_refs: readonly string[];
}

export const INTEGRATION_FAILURE_SCOPES = [
  "REQUEST_OR_COMMAND",
  "OWNER_TRANSACTION",
  "EVENT_EMISSION",
  "DELIVERY",
  "CONSUMER_EFFECT",
  "BATCH_OR_BULK_ITEM",
  "EXTERNAL_EXCHANGE",
  "OFFLINE_OR_EVIDENCE",
] as const;

export type IntegrationFailureScope =
  typeof INTEGRATION_FAILURE_SCOPES[number];

export const INTEGRATION_PARTIALITY_CLASSES = [
  "NO_EFFECT_CONFIRMED",
  "SOME_EFFECTS_CONFIRMED",
  "SOME_EFFECTS_UNKNOWN",
  "ALL_EFFECTS_UNKNOWN",
  "DEPENDENCY_INCOMPLETE",
  "CONFLICTING_RESULTS",
  "UNTRUSTED_OR_TAMPERED_INPUT",
  "CONTRACT_OR_SCHEMA_INCOMPATIBLE",
  "EXTERNAL_STATE_DIVERGENCE",
] as const;

export type IntegrationPartialityClass =
  typeof INTEGRATION_PARTIALITY_CLASSES[number];

export const INTEGRATION_DISPOSITIONS = [
  "RETRY_SAME_OPERATION",
  "WAIT_FOR_DEPENDENCY",
  "QUERY_AUTHORITATIVE_RESULT",
  "RECONCILE",
  "QUARANTINE",
  "DEAD_LETTER_CANDIDATE",
  "MANUAL_INTERVENTION_REQUIRED",
  "PERMANENTLY_REJECT",
  "COMPENSATE_CONFIRMED_EFFECTS",
  "CREATE_CORRECTION_OR_SUCCESSOR",
  "CONTINUE_INDEPENDENT_UNITS",
  "BLOCK_DEPENDENT_UNITS",
] as const;

export type IntegrationDisposition =
  typeof INTEGRATION_DISPOSITIONS[number];

export const INTEGRATION_QUARANTINE_REASONS = [
  "UNTRUSTED_SIGNATURE_OR_AUTHENTICITY",
  "SCHEMA_OR_VERSION_UNSUPPORTED",
  "PAYLOAD_INTEGRITY_FAILED",
  "IDENTITY_OR_ROUTING_AMBIGUOUS",
  "SENSITIVITY_OR_POLICY_VIOLATION",
  "REPEATED_POISON_MESSAGE",
  "EVIDENCE_LINKAGE_INVALID",
  "MANUAL_HOLD_FOR_INVESTIGATION",
] as const;

export type IntegrationQuarantineReason =
  typeof INTEGRATION_QUARANTINE_REASONS[number];

export const INTEGRATION_DEAD_LETTER_GATES = [
  "AUTOMATION_BUDGET_CLOSED",
  "ITEM_ISOLATED",
  "IDENTITY_AND_CONTENT_PRESERVED",
  "BUSINESS_OUTCOME_CLASSIFIED_OR_RECONCILIATION_OPEN",
  "OWNER_AND_NEXT_ACTION_ASSIGNED",
  "REPROCESSING_REQUIRES_AUTHORIZATION",
  "RETENTION_AND_AUDIT_DEFINED",
] as const;

export type IntegrationDeadLetterGate =
  typeof INTEGRATION_DEAD_LETTER_GATES[number];

export const INTEGRATION_MANUAL_INTERVENTION_ACTIONS = [
  "RETRY_AUTHORIZED",
  "QUERY_RECEIPT",
  "CORRECT_METADATA",
  "CREATE_SUCCESSOR",
  "RELINK_EVIDENCE",
  "REPROCESS_FROM_QUARANTINE",
  "REPROCESS_FROM_DEAD_LETTER",
  "PERMANENT_REJECT",
  "START_RECONCILIATION",
  "START_COMPENSATION",
] as const;

export type IntegrationManualInterventionAction =
  typeof INTEGRATION_MANUAL_INTERVENTION_ACTIONS[number];

export interface IntegrationDispositionCase {
  readonly integration_disposition_case_id: IntegrationDispositionCaseId;
  readonly failure_scope: IntegrationFailureScope;
  readonly partiality_class: IntegrationPartialityClass;
  readonly disposition: IntegrationDisposition;
  readonly owner_application: string;
  readonly owner_domain_ref: string;
  readonly resource_or_operation_refs: readonly string[];
  readonly external_system_id: string | null;
  readonly environment: VentoCredentialEnvironment | null;
  readonly surface: string | null;
  readonly integration_principal_ref: IntegrationPrincipalRef | null;
  readonly external_received_event_ref: string | null;
  readonly external_identifier_mapping_refs: readonly ExternalIdentifierMappingRef[];
  readonly idempotency_ref: IntegrationIdempotencyRef | null;
  readonly reconciliation_ref: IntegrationReconciliationRef | null;
  readonly quarantine_ref: IntegrationQuarantineRef | null;
  readonly dead_letter_ref: IntegrationDeadLetterRef | null;
  readonly compensation_plan_ref: IntegrationCompensationPlanRef | null;
  readonly original_evidence_refs: readonly string[];
  readonly content_integrity_ref: string | null;
  readonly contract_or_schema_version: string;
  readonly quarantine_reason: IntegrationQuarantineReason | null;
  readonly owner_specialization_ref: string | null;
  readonly owner_resolution_detail: string | null;
  readonly dead_letter_gate_results: readonly Readonly<{
    readonly gate: IntegrationDeadLetterGate;
    readonly satisfied: boolean;
    readonly evidence_refs: readonly string[];
  }>[];
  readonly manual_intervention_action: IntegrationManualInterventionAction | null;
  readonly authorization_reference: string | null;
  readonly attempt_references: readonly string[];
  readonly business_outcome_reference: string | null;
  readonly responsible_owner: string;
  readonly next_action: string | null;
  readonly residual_obligations: readonly string[];
  readonly retention_policy_ref: string | null;
  readonly legal_hold_reference: string | null;
  readonly audit_references: readonly string[];
  readonly closure_outcome: IntegrationReconciliationClosureOutcome | null;
  readonly created_at: string;
  readonly updated_at: string;
  readonly closed_at: string | null;
}

export const INTEGRATION_DISPOSITION_IDENTITY_POLICY = {
  identity_name: "IntegrationDispositionCaseId",
  semantics: "STABLE_OPAQUE_NON_SECRET_DISPOSITION_CASE_IDENTITY",
  serialization: "UNSPECIFIED",
  syntax_pattern: null,
  static_registry: false,
  materialized_case_id_count: 0,
  derived_from_payload_amount_date_email_phone_product_provider_or_error_text: false,
  is_event_id: false,
  is_receipt_id: false,
  is_attempt_id: false,
  is_delivery_id: false,
  is_mapping_id: false,
  is_sale_id: false,
  is_sale_line_id: false,
  is_correlation_id: false,
  is_idempotency_key: false,
  technical_retry_creates_new_case_by_default: false,
  closed_identity_reusable: false,
} as const;

export const INTEGRATION_DISPOSITION_SEPARATION_POLICY = {
  disposition_case_is_business_operation: false,
  disposition_case_is_event: false,
  disposition_case_is_receipt: false,
  disposition_case_is_business_result: false,
  disposition_case_is_technical_attempt: false,
  disposition_case_is_idempotency_key: false,
  disposition_case_is_reconciliation_case: false,
  disposition_case_is_compensation_plan: false,
  quarantine_is_dead_letter: false,
  dead_letter_is_business_rejection: false,
  rejection_is_unknown_result: false,
  reconciliation_is_compensation: false,
  compensation_is_retry: false,
  contingency_is_disposition: false,
} as const;

export const INTEGRATION_QUARANTINE_POLICY = {
  isolated_unit_preserves_original_identity: true,
  original_content_or_protected_evidence_preserved: true,
  integrity_reference_preserved_when_applicable: true,
  contract_and_version_preserved: true,
  provenance_preserved: true,
  reason_owner_responsible_party_and_next_action_required_when_applicable: true,
  source_business_state_mutated_by_quarantine: false,
  quarantine_auto_applies_business_effect: false,
  release_by_age_allowed: false,
  release_by_alert_disappearance_allowed: false,
  quarantine_proves_no_prior_effect: false,
  quarantine_is_secret_store: false,
  owner_specialization_may_relax_shared_security_integrity_identity_or_ownership: false,
} as const;

export const INTEGRATION_DEAD_LETTER_POLICY = {
  gate_count: 7,
  all_gates_required: true,
  retry_exhaustion_satisfies_all_gates: false,
  retry_exhaustion_may_satisfy_only_automation_budget_gate: true,
  one_false_gate_allows_complete_dead_letter: false,
  outcome_uncertainty_allowed_only_with_explicit_open_reconciliation: true,
  dead_letter_removes_owner_or_next_action_requirement: false,
  dead_letter_is_terminal_business_failure_by_definition: false,
  age_satisfies_business_gate: false,
} as const;

export const INTEGRATION_TERMINAL_REJECTION_POLICY = {
  exact_unit_identity_required: true,
  applicable_contract_required: true,
  terminal_cause_required: true,
  absence_of_incompatible_effect_required: true,
  unresolved_outcome_unknown_allowed: false,
  unresolved_result_unknown_allowed: false,
  hidden_partial_effect_allowed: false,
  owner_and_decision_authority_required: true,
  evidence_and_audit_required: true,
  rejection_fabricates_external_fact_state: false,
} as const;

export const INTEGRATION_UNKNOWN_RESULT_DISPOSITION_POLICY = {
  timeout_equals_failure: false,
  no_response_equals_no_effect: false,
  quarantine_resolves_uncertainty: false,
  dead_letter_resolves_uncertainty: false,
  rejection_closes_uncertainty: false,
  compensation_for_hypothetical_effect_allowed: false,
  authoritative_source_or_receipt_queried_before_material_repeat: true,
  confirmed_effect_recovers_result_or_evaluates_compensation_when_eligible: true,
  demonstrated_no_effect_may_retry_or_reject_under_owner_contract: true,
  indeterminate_result_requires_reconciliation: true,
  operational_isolation_and_open_reconciliation_may_coexist: true,
  outcome_unknown_and_result_unknown_are_distinct_layers: true,
} as const;

export const INTEGRATION_MANUAL_INTERVENTION_POLICY = {
  action_count: 10,
  allowlist_only: true,
  actor_or_principal_required: true,
  current_authority_required: true,
  reason_and_exact_scope_required: true,
  previous_state_and_evidence_required: true,
  resulting_attempt_and_result_recorded_when_applicable: true,
  audit_refs_required: true,
  next_action_required_when_case_remains_open: true,
  alert_receipt_grants_execution_authority: false,
  support_membership_grants_business_authority: false,
  read_access_grants_intervention_authority: false,
} as const;

export const INTEGRATION_REPROCESS_POLICY = {
  same_intent_preserves_business_identity: true,
  same_intent_preserves_idempotency_scope_and_key: true,
  same_intent_requires_compatible_fingerprint: true,
  applicable_event_command_or_external_identity_preserved: true,
  owner_purpose_sensitivity_correlation_and_source_evidence_preserved: true,
  retry_budget_history_preserved: true,
  technical_attempt_id_may_change: true,
  reprocess_creates_second_business_effect: false,
} as const;

export const INTEGRATION_SUCCESSOR_POLICY = {
  material_intent_payload_resource_amount_quantity_recipient_version_action_or_authority_change_is_simple_reprocess: false,
  material_change_requires_correction_or_successor: true,
  successor_uses_new_identity_for_new_intent: true,
  successor_relationship_to_original_required: true,
  original_case_reinterpreted_or_overwritten: false,
} as const;

export const INTEGRATION_COMPENSATION_POLICY = {
  confirmed_original_effect_required: true,
  original_effect_identity_and_correlation_required: true,
  reversibility_or_valid_compensation_policy_required: true,
  effect_owner_required: true,
  current_authority_required: true,
  compensation_has_own_identity_and_idempotency: true,
  dependencies_and_residuals_explicit: true,
  result_verifiable: true,
  timeout_without_result_compensable: false,
  technical_ack_compensable: false,
  hypothetical_effect_compensable: false,
  unconfirmed_delivery_compensable: false,
  rejected_input_without_effect_compensable: false,
  unresolved_divergence_compensable: false,
  ambiguous_mapping_compensable: false,
  original_effect_deleted_or_edited_to_simulate_non_occurrence: false,
  confirmed_compensation_repeated_on_retry: false,
  equivalent_compensation_request_recovers_prior_result: true,
  incompatible_compensation_content_result: "CONFLICTING_REUSE",
  partial_compensation_preserves_confirmed_pending_impossible_and_residual_steps: true,
  cross_owner_automatic_compensation_allowed: false,
} as const;

export const INTEGRATION_NO_GLOBAL_ROLLBACK_POLICY = {
  global_rollback_across_pulso_nexo_numera_pass_and_provider_exists: false,
  consistency_uses_scope_idempotency_durable_results_safe_retry_reconciliation_successors_and_owner_compensation: true,
  confirmed_owner_effect_may_coexist_with_pending_rejected_or_unknown_other_effect: true,
} as const;

export const INTEGRATION_RECONCILIATION_COMPATIBILITY_POLICY = {
  reconciliation_type_owner_task_id: "SHELL-CON-023",
  closure_outcome_type: "IntegrationReconciliationClosureOutcome",
  reused_closure_outcome_count: 8,
  duplicate_closure_vocabulary_created_here: false,
  disposition_case_may_link_reconciliation_case: true,
  disposition_case_is_reconciliation_case: false,
  reconciliation_compares_authoritative_sources: true,
  reconciliation_rewrites_history: false,
  reconciliation_enables_cross_owner_write: false,
  reconciliation_replays_confirmed_effects: false,
  closed_unknown_outcome_allowed: false,
  close_by_age_silence_alert_disappearance_dead_letter_worker_restart_or_archive_allowed: false,
} as const;

export const INTEGRATION_RESIDUAL_POLICY = {
  accepted_residual_requires_exact_residual: true,
  owner_required: true,
  responsible_party_required: true,
  risk_required: true,
  control_required: true,
  accepting_authority_required: true,
  follow_up_condition_or_time_required: true,
  decision_evidence_required: true,
  residual_without_responsible_party_is_valid_closure: false,
} as const;

export const INTEGRATION_OWNERSHIP_AUTHORIZATION_POLICY = {
  adapter_may_record_own_technical_metadata_receipts_mappings_and_evidence: true,
  owner_application_retains_business_decision: true,
  queue_becomes_business_fact_owner: false,
  support_case_assignment_grants_business_authority: false,
  observability_may_modify_private_owner_source: false,
  compensation_executes_within_effect_owner: true,
  cross_domain_correction_expressed_through_owner_contract: true,
  authenticated_integration_principal_implies_retry_reprocess_reject_or_compensation_authority: false,
  external_credential_grants_transverse_vento_authority: false,
  shared_database_service_role_connection_schema_or_package_transfers_functional_ownership: false,
} as const;

export const INTEGRATION_POS_DISPOSITION_POLICY = {
  external_system_id: "EXT-SYS-013",
  shared_contract_applies: true,
  owner_specialization_ref: "EXTERNAL-SALE-LINE-QUARANTINE-001",
  quarantine_owner_unit: "CANONICAL_SALE_LINE_WHEN_MAPPING_BLOCKS_PRODUCT_DEPENDENT_EFFECT",
  active_quarantined_line_nexo_product_effect_count: 0,
  release_executes_inventory: false,
  corrected_mapping_changes_line_identity: false,
  possibility_of_prior_effect_requires_reconciliation_first: true,
  reversals_returns_and_refunds_preserve_original_sale_and_line: true,
  nexo_numera_pass_compensate_only_own_confirmed_effects: true,
  global_sale_rollback_exists: false,
  reconciliation_reexecutes_already_confirmed_effects: false,
} as const;

export const INTEGRATION_BATCH_DISPOSITION_POLICY = {
  each_item_preserves_identity_and_disposition: true,
  confirmed_item_repeated_due_to_other_item_failure: false,
  rejected_item_cancels_independent_item: false,
  unknown_item_presented_as_failed_to_close_batch: false,
  summary_replaces_item_results: false,
  dead_letter_may_apply_per_item_without_promoting_entire_batch: true,
  compensation_evaluated_per_confirmed_effect: true,
  residuals_and_responsible_parties_preserved_per_unit_when_needed: true,
} as const;

export const INTEGRATION_RETRY_DEAD_LETTER_POLICY = {
  retryable_failure_retries_same_operation_within_budget: true,
  exhausted_budget_requires_result_and_partiality_classification: true,
  exhausted_budget_requires_dead_letter_gate_evaluation: true,
  exhausted_budget_auto_permanently_rejects: false,
  exhausted_budget_auto_completes_dead_letter: false,
  budget_resets_on_restart_redeploy_worker_requeue_or_transport_change: false,
} as const;

export const INTEGRATION_DISPOSITION_SECURITY_POLICY = {
  purpose_minimization_required: true,
  api_key_allowed: false,
  bearer_token_allowed: false,
  service_role_allowed: false,
  private_key_allowed: false,
  password_allowed: false,
  reusable_signature_material_allowed: false,
  full_personal_payload_allowed_by_convenience: false,
  full_bank_data_allowed: false,
  full_document_allowed_when_protected_reference_is_sufficient: false,
  signed_url_or_credential_parameter_allowed: false,
  unnecessary_sensitive_diagnostic_allowed: false,
  protected_refs_hashes_and_minimum_metadata_preferred: true,
  case_access_grants_full_evidence_access: false,
} as const;

export const INTEGRATION_DISPOSITION_ADOPTION = [
  {
    external_system_id: "EXT-SYS-001",
    system: "Supabase",
    inherited_classification: "GOBERNADA_POR_CONTRATO_INTERNO",
    state: "ESPECIFICADO",
    decision_summary: "Disposition is governed by the owning VENTO surface; no universal external quarantine is created for the platform.",
    materialized_disposition_case_count: 0,
    materialized_compensation_count: 0,
  },
  {
    external_system_id: "EXT-SYS-002",
    system: "Wompi",
    inherited_classification: "APLICA_IDEMPOTENCIA_Y_CONCILIACION",
    state: "ESPECIFICADO",
    decision_summary: "Quarantine, rejection and reconciliation may apply by unit; compensation requires a confirmed effect and owner authority, never timeout alone.",
    materialized_disposition_case_count: 0,
    materialized_compensation_count: 0,
  },
  {
    external_system_id: "EXT-SYS-003",
    system: "RevenueCat",
    inherited_classification: "APLICA_IDEMPOTENCIA_Y_CONCILIACION",
    state: "ESPECIFICADO",
    decision_summary: "Incompatible input or mapping may be isolated; uncertain entitlement is reconciled before correction or compensation.",
    materialized_disposition_case_count: 0,
    materialized_compensation_count: 0,
  },
  {
    external_system_id: "EXT-SYS-004",
    system: "Resend",
    inherited_classification: "APLICA_IDEMPOTENCIA_Y_CONCILIACION",
    state: "ESPECIFICADO",
    decision_summary: "Delivery failure preserves generation and attempt; dead-letter does not prove business delivery or rejection and blind resend is forbidden.",
    materialized_disposition_case_count: 0,
    materialized_compensation_count: 0,
  },
  {
    external_system_id: "EXT-SYS-005",
    system: "Expo / EAS Update",
    inherited_classification: "PLATAFORMA_TECNICA_SIN_EFECTO_EMPRESARIAL_EN_CORTE",
    state: "ESPECIFICADO",
    decision_summary: "Only owner-specific technical treatment applies when present; no fictitious business quarantine, ledger or compensation is created.",
    materialized_disposition_case_count: 0,
    materialized_compensation_count: 0,
  },
  {
    external_system_id: "EXT-SYS-006",
    system: "Expo Push Service",
    inherited_classification: "APLICA_IDEMPOTENCIA_Y_CONCILIACION",
    state: "ESPECIFICADO",
    decision_summary: "Disposition is per destination and generation; one batch does not hide isolated elements and uncertain result does not authorize blind redelivery.",
    materialized_disposition_case_count: 0,
    materialized_compensation_count: 0,
  },
  {
    external_system_id: "EXT-SYS-007",
    system: "Sentry",
    inherited_classification: "SIN_LEDGER_DE_EFECTO_EMPRESARIAL",
    state: "ESPECIFICADO",
    decision_summary: "Best-effort telemetry does not create business compensation or dead-letter; technical isolation preserves purpose and minimum evidence.",
    materialized_disposition_case_count: 0,
    materialized_compensation_count: 0,
  },
  {
    external_system_id: "EXT-SYS-008",
    system: "Google Maps / Google Reviews",
    inherited_classification: "SIN_LEDGER_DE_EFECTO_EMPRESARIAL",
    state: "ESPECIFICADO",
    decision_summary: "Failed interactive reads may reject or degrade under their owner contract; no business dead-letter or compensation exists by default.",
    materialized_disposition_case_count: 0,
    materialized_compensation_count: 0,
  },
  {
    external_system_id: "EXT-SYS-009",
    system: "Apple Wallet / PassKit y APNs",
    inherited_classification: "APLICA_IDEMPOTENCIA_Y_CONCILIACION",
    state: "ESPECIFICADO",
    decision_summary: "Resource and push remain separate units; each retains its own disposition and uncertain push never justifies resource recreation.",
    materialized_disposition_case_count: 0,
    materialized_compensation_count: 0,
  },
  {
    external_system_id: "EXT-SYS-010",
    system: "Vercel",
    inherited_classification: "PLATAFORMA_TECNICA_SIN_EFECTO_EMPRESARIAL_EN_CORTE",
    state: "ESPECIFICADO",
    decision_summary: "Platform and continuity controls apply where owned; no fictitious business queue or remote compensation plan is created.",
    materialized_disposition_case_count: 0,
    materialized_compensation_count: 0,
  },
  {
    external_system_id: "EXT-SYS-011",
    system: "Zebra BrowserPrint",
    inherited_classification: "APLICA_IDEMPOTENCIA_Y_CONCILIACION",
    state: "ESPECIFICADO",
    decision_summary: "Uncertain physical print result requires verification or reconciliation before reprint; manual action is authorized and audited per case.",
    materialized_disposition_case_count: 0,
    materialized_compensation_count: 0,
  },
  {
    external_system_id: "EXT-SYS-012",
    system: "Google Wallet / Google Pay & Wallet",
    inherited_classification: "MODELO_SIN_BINDING_REMOTO",
    state: "NO_APLICA",
    decision_summary: "Without an accredited remote binding no provider quarantine, dead-letter or compensation runtime is materialized.",
    materialized_disposition_case_count: 0,
    materialized_compensation_count: 0,
  },
  {
    external_system_id: "EXT-SYS-013",
    system: "POS externo vigente",
    inherited_classification: "APLICA_CON_ESPECIALIZACION_POS",
    state: "ESPECIFICADO",
    decision_summary: "Shared disposition applies while EXTERNAL-SALE-LINE-QUARANTINE-001, reversal rules and POS reconciliation remain owner specializations.",
    materialized_disposition_case_count: 0,
    materialized_compensation_count: 0,
  },
  {
    external_system_id: "EXT-SYS-014",
    system: "Shopify / comercio electronico",
    inherited_classification: "NO_APLICA_SIN_BINDING",
    state: "NO_APLICA",
    decision_summary: "No unit, reason, queue, dead-letter or compensation is invented without an accredited binding.",
    materialized_disposition_case_count: 0,
    materialized_compensation_count: 0,
  },
  {
    external_system_id: "EXT-SYS-015",
    system: "Rappi / marketplace",
    inherited_classification: "NO_APLICA_SIN_BINDING",
    state: "NO_APLICA",
    decision_summary: "No unit, reason, queue, dead-letter or compensation is invented without an accredited binding.",
    materialized_disposition_case_count: 0,
    materialized_compensation_count: 0,
  },
  {
    external_system_id: "EXT-SYS-016",
    system: "ManyChat / automatizacion conversacional",
    inherited_classification: "NO_APLICA_SIN_BINDING",
    state: "NO_APLICA",
    decision_summary: "No unit, reason, queue, dead-letter or compensation is invented without an accredited binding.",
    materialized_disposition_case_count: 0,
    materialized_compensation_count: 0,
  },
  {
    external_system_id: "EXT-SYS-017",
    system: "WhatsApp",
    inherited_classification: "NO_APLICA_SIN_BINDING",
    state: "NO_APLICA",
    decision_summary: "Provider, API, receipt, retry, quarantine, dead-letter and compensation are not presumed without an accredited binding.",
    materialized_disposition_case_count: 0,
    materialized_compensation_count: 0,
  },
  {
    external_system_id: "EXT-SYS-018",
    system: "Instagram / social",
    inherited_classification: "NO_APLICA_SIN_BINDING",
    state: "NO_APLICA",
    decision_summary: "No unit, reason, queue, dead-letter or compensation is invented without an accredited binding.",
    materialized_disposition_case_count: 0,
    materialized_compensation_count: 0,
  },
  {
    external_system_id: "EXT-SYS-019",
    system: "Correo corporativo y alias funcionales",
    inherited_classification: "NO_APLICA_SIN_BINDING",
    state: "NO_APLICA",
    decision_summary: "Organizational channel existence does not accredit provider runtime integration or technical disposition.",
    materialized_disposition_case_count: 0,
    materialized_compensation_count: 0,
  },
  {
    external_system_id: "EXT-SYS-020",
    system: "Telefonia / voz",
    inherited_classification: "BLOQUEADO_SIN_BINDING",
    state: "BLOQUEADO",
    decision_summary: "The system remains blocked until provider and interface are accredited; no operator-specific disposition is invented.",
    materialized_disposition_case_count: 0,
    materialized_compensation_count: 0,
  },
  {
    external_system_id: "EXT-SYS-021",
    system: "Transporte externo",
    inherited_classification: "NO_APLICA_SIN_BINDING",
    state: "NO_APLICA",
    decision_summary: "Without accredited provider and integration no delivery, dead-letter or compensation state is invented.",
    materialized_disposition_case_count: 0,
    materialized_compensation_count: 0,
  },
] as const;

export const INTEGRATION_DISPOSITION_COVERAGE = {
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
  specified_disposition_state_count: 12,
  not_applicable_disposition_state_count: 8,
  blocked_disposition_state_count: 1,
  materialized_disposition_case_count: 0,
  materialized_quarantine_record_count: 0,
  materialized_dead_letter_record_count: 0,
  materialized_compensation_count: 0,
} as const;

export const INTEGRATION_DISPOSITION_CONTRACT_METADATA = {
  logical_namespace: "@vento/contracts/integrations",
  contract_task_id: "SHELL-CON-024",
  semantic_owner_task_ids: [
    "INT-APP-006",
    "INT-APP-009",
    "INT-EXT-016",
    "INT-EXT-017",
    "INT-POS-012",
    "INT-POS-019",
    "INT-POS-020",
  ],
  integration_principal_contract_task_id: "SHELL-CON-017",
  external_credential_contract_task_id: "SHELL-CON-018",
  external_received_event_contract_task_id: "SHELL-CON-019",
  external_identifier_mapping_contract_task_id: "SHELL-CON-022",
  idempotency_reconciliation_contract_task_id: "SHELL-CON-023",
  physical_quarantine_owner_task_id: "INT-DB-006",
  physical_processing_audit_owner_task_id: "INT-DB-007",
  physical_reconciliation_owner_task_id: "INT-DB-008",
  queue_failure_recovery_owner_task_id: "QUEUE-ARC-008",
  queue_reprocess_exclusion_owner_task_id: "QUEUE-ARC-009",
  queue_metrics_owner_task_id: "QUEUE-ARC-011",
  queue_manual_authorization_owner_task_id: "QUEUE-ARC-012",
  next_contract_task_id: "SHELL-NORM-001",
  execution_gate: "PRE_E5_FOUNDATION",
  physical_mode: "GLOBAL_ENABLE_ONCE",
  public_export_published: false,
  package_root_index_extended: false,
  consumer_adoption_materialized: false,
  persistence_materialized: false,
  queue_materialized: false,
  worker_materialized: false,
  retry_runtime_materialized: false,
  reprocess_runtime_materialized: false,
  compensation_runtime_materialized: false,
  endpoint_materialized: false,
  migration_materialized: false,
  supabase_changed: false,
  materialized_disposition_case_count: 0,
  materialized_compensation_count: 0,
} as const;

export type IntegrationDispositionIdentityPolicy = typeof INTEGRATION_DISPOSITION_IDENTITY_POLICY;
export type IntegrationDispositionSeparationPolicy = typeof INTEGRATION_DISPOSITION_SEPARATION_POLICY;
export type IntegrationQuarantinePolicy = typeof INTEGRATION_QUARANTINE_POLICY;
export type IntegrationDeadLetterPolicy = typeof INTEGRATION_DEAD_LETTER_POLICY;
export type IntegrationTerminalRejectionPolicy = typeof INTEGRATION_TERMINAL_REJECTION_POLICY;
export type IntegrationUnknownResultDispositionPolicy = typeof INTEGRATION_UNKNOWN_RESULT_DISPOSITION_POLICY;
export type IntegrationManualInterventionPolicy = typeof INTEGRATION_MANUAL_INTERVENTION_POLICY;
export type IntegrationReprocessPolicy = typeof INTEGRATION_REPROCESS_POLICY;
export type IntegrationSuccessorPolicy = typeof INTEGRATION_SUCCESSOR_POLICY;
export type IntegrationCompensationPolicy = typeof INTEGRATION_COMPENSATION_POLICY;
export type IntegrationNoGlobalRollbackPolicy = typeof INTEGRATION_NO_GLOBAL_ROLLBACK_POLICY;
export type IntegrationReconciliationCompatibilityPolicy = typeof INTEGRATION_RECONCILIATION_COMPATIBILITY_POLICY;
export type IntegrationResidualPolicy = typeof INTEGRATION_RESIDUAL_POLICY;
export type IntegrationOwnershipAuthorizationPolicy = typeof INTEGRATION_OWNERSHIP_AUTHORIZATION_POLICY;
export type IntegrationPosDispositionPolicy = typeof INTEGRATION_POS_DISPOSITION_POLICY;
export type IntegrationBatchDispositionPolicy = typeof INTEGRATION_BATCH_DISPOSITION_POLICY;
export type IntegrationRetryDeadLetterPolicy = typeof INTEGRATION_RETRY_DEAD_LETTER_POLICY;
export type IntegrationDispositionSecurityPolicy = typeof INTEGRATION_DISPOSITION_SECURITY_POLICY;
export type IntegrationDispositionContractMetadata = typeof INTEGRATION_DISPOSITION_CONTRACT_METADATA;
