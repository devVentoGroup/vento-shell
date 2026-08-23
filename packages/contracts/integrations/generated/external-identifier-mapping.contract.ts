// GENERATED FILE. DO NOT EDIT.
// Semantic owners: INT-EXT-013, INT-POS-010, INT-POS-011, INT-POS-013
// Contract task: SHELL-CON-022
// Foundation task: SHELL-CON-001
// External received event task: SHELL-CON-019
// Canonical sale line task: SHELL-CON-021
// Physical persistence owner: INT-DB-004
// Source contract SHA256: 89fbd1be5e68ec81239097376a1656eb4722ad6f38f55b1b76bb1f3dd469f474

import type { VentoCredentialEnvironment } from "./external-credential-ref.contract.js";

declare const externalIdentifierMappingIdBrand: unique symbol;

export type ExternalIdentifierMappingId =
  string & {
    readonly [externalIdentifierMappingIdBrand]: "ExternalIdentifierMappingId";
  };

export const EXTERNAL_IDENTIFIER_CLASSES = [
  "EXTERNAL_OBJECT_ID",
  "CANONICAL_VENTO_ID",
  "PROPAGATED_CANONICAL_ID",
  "EXTERNAL_ROUTING_REF",
  "IDEMPOTENCY_REF",
  "CORRELATION_REF",
  "DISPLAY_SEARCH_ATTRIBUTE",
  "TECHNICAL_NAMESPACE_ID",
  "EXTERNAL_ALIAS",
  "MAPPING_RECORD",
] as const;

export type ExternalIdentifierClass =
  typeof EXTERNAL_IDENTIFIER_CLASSES[number];

export const EXTERNAL_IDENTIFIER_RELATION_KINDS = [
  "EXTERNAL_TO_CANONICAL",
  "CANONICAL_PROPAGATED_EXTERNAL",
  "EXTERNAL_ROUTE_TO_OWNER",
  "EXTERNAL_EVENT_TO_RECEIPT",
  "EXTERNAL_NAMESPACE_BINDING",
  "CORRELATION_ONLY",
  "NO_EQUIVALENCE",
] as const;

export type ExternalIdentifierRelationKind =
  typeof EXTERNAL_IDENTIFIER_RELATION_KINDS[number];

export const EXTERNAL_IDENTIFIER_MAPPING_STATES = [
  "RESOLVED",
  "PARTIALLY_RESOLVED",
  "UNRESOLVED",
  "AMBIGUOUS",
  "CONFLICT",
  "RETIRED",
  "NOT_APPLICABLE",
  "BLOCKED",
] as const;

export type ExternalIdentifierMappingState =
  typeof EXTERNAL_IDENTIFIER_MAPPING_STATES[number];

export interface ExternalIdentifierRef {
  readonly external_system_id: string;
  readonly environment: VentoCredentialEnvironment;
  readonly surface: string;
  readonly external_namespace: string;
  readonly external_id_class: ExternalIdentifierClass;
  readonly external_id_kind: string;
  readonly external_id_value: string;
}

export type ExternalIdentifierMappingRef = Readonly<{
  readonly mapping_id: ExternalIdentifierMappingId;
  readonly contract_version: string;
}>;

export interface ExternalIdentifierMapping {
  readonly mapping_id: ExternalIdentifierMappingId;
  readonly contract_version: string;
  readonly external_ref: ExternalIdentifierRef;
  readonly relation_kind: ExternalIdentifierRelationKind;
  readonly canonical_resource_type: string | null;
  readonly canonical_id: string | null;
  readonly mapping_state: ExternalIdentifierMappingState;
  readonly resolution_detail: string | null;
  readonly evidence_refs: readonly string[];
  readonly correlation_refs: readonly string[];
  readonly valid_from: string | null;
  readonly retired_at: string | null;
  readonly predecessor_mapping_ref: ExternalIdentifierMappingRef | null;
  readonly successor_mapping_ref: ExternalIdentifierMappingRef | null;
}

export const EXTERNAL_IDENTIFIER_MAPPING_IDENTITY_POLICY = {
  identity_name: "ExternalIdentifierMappingId",
  semantics: "STABLE_OPAQUE_NON_SECRET_MAPPING_RELATION_IDENTITY",
  serialization: "UNSPECIFIED",
  syntax_pattern: null,
  static_registry: false,
  materialized_id_count: 0,
  derive_from_external_id_value: false,
  derive_from_canonical_id: false,
  derive_from_credential: false,
  is_external_identifier_ref: false,
  is_canonical_sale_id: false,
  is_canonical_sale_line_id: false,
  is_integration_principal_id: false,
  is_idempotency_key: false,
  is_event_receipt_or_correlation_id: false,
  incompatible_semantic_change_overwrites_history: false,
} as const;

export const EXTERNAL_IDENTIFIER_REFERENCE_POLICY = {
  minimum_namespace_dimensions: [
    "external_system_id",
    "environment",
    "surface",
    "external_namespace",
    "external_id_kind",
  ],
  environment_is_part_of_identity_scope: true,
  surface_is_part_of_identity_scope: true,
  same_text_across_namespaces_implies_same_object: false,
  technical_namespace_is_business_resource: false,
  inverse_resolution_implies_unique_external_source: false,
  contains_secret_material: false,
} as const;

export const EXTERNAL_IDENTIFIER_NORMALIZATION_POLICY = {
  unconditional_trim_allowed: false,
  unconditional_case_folding_allowed: false,
  unconditional_prefix_removal_allowed: false,
  unconditional_numeric_conversion_allowed: false,
  unconditional_uuid_canonicalization_allowed: false,
  namespace_contract_may_authorize_deterministic_normalization: true,
  normalization_may_merge_semantically_distinct_values: false,
  provenance_must_remain_reconstructible: true,
} as const;

export const EXTERNAL_IDENTIFIER_RELATION_POLICY = {
  correlation_only_promotes_to_exact_identity_without_new_evidence: false,
  no_equivalence_is_explicit_decision: true,
  relation_kind_grants_permission: false,
  relation_kind_grants_business_ownership: false,
  material_relation_change_requires_successor: true,
  canonical_target_required_for_exact_relationship: true,
  canonical_target_required_for_no_equivalence: false,
  canonical_target_required_for_not_applicable: false,
  canonical_target_required_for_blocked: false,
} as const;

export const EXTERNAL_IDENTIFIER_MAPPING_STATE_POLICY = {
  unresolved_degrades_to_resolved_silently: false,
  ambiguous_degrades_to_resolved_silently: false,
  conflict_degrades_to_resolved_silently: false,
  blocked_degrades_to_resolved_silently: false,
  not_applicable_is_null: false,
  partially_resolved_authorizes_missing_dimensions: false,
  retired_releases_history_for_reinterpretation: false,
  state_is_business_resource_state: false,
} as const;

export const EXTERNAL_IDENTIFIER_POS_STATE_PROJECTION = [
  { owner_state: "RESOLVED", shared_state: "RESOLVED", automatic_equivalence: true },
  { owner_state: "NOT_APPLICABLE", shared_state: "NOT_APPLICABLE", automatic_equivalence: true },
  { owner_state: "AMBIGUOUS", shared_state: "AMBIGUOUS", automatic_equivalence: true },
  { owner_state: "CONFLICT", shared_state: "CONFLICT", automatic_equivalence: true },
  { owner_state: "PENDING_EVIDENCE", shared_state: "UNRESOLVED", automatic_equivalence: false },
  { owner_state: "NOT_PROVIDED", shared_state: "UNRESOLVED", automatic_equivalence: false },
  { owner_state: "INACTIVE", shared_state: "RETIRED", automatic_equivalence: false },
] as const;

export const EXTERNAL_IDENTIFIER_CARDINALITY_POLICY = {
  active_exact_external_to_canonical_max_targets_per_namespace: 1,
  multiple_external_refs_may_target_same_canonical_resource: true,
  multiple_technical_routes_imply_multiple_business_identities: false,
  many_to_many_requires_explicit_owner_contract: true,
  current_data_counts_define_cardinality: false,
  absence_of_observed_duplicates_proves_one_to_one: false,
  reassigned_external_id_requires_retirement_and_successor: true,
  same_namespace_collision_result: "CONFLICT",
} as const;

export const EXTERNAL_IDENTIFIER_HEURISTIC_POLICY = {
  matching_uuid_text_is_sufficient: false,
  email_is_sufficient: false,
  phone_is_sufficient: false,
  name_or_legal_name_is_sufficient: false,
  display_name_is_sufficient: false,
  address_is_sufficient: false,
  coordinates_are_sufficient: false,
  alias_is_sufficient: false,
  state_is_sufficient: false,
  amount_or_currency_is_sufficient: false,
  timestamp_is_sufficient: false,
  ip_is_sufficient: false,
  product_name_code_or_category_is_sufficient: false,
  file_position_or_source_row_number_is_sufficient: false,
  file_or_payload_hash_is_sufficient: false,
  visible_uid_without_namespace_is_sufficient: false,
  reference_from_other_integration_is_sufficient: false,
  payload_shape_similarity_is_sufficient: false,
} as const;

export const EXTERNAL_IDENTIFIER_PROPAGATED_CANONICAL_POLICY = {
  class_name: "PROPAGATED_CANONICAL_ID",
  validate_expected_resource_type: true,
  validate_environment: true,
  validate_surface_contract_and_owner: true,
  uuid_shape_proves_vento_origin: false,
  external_provider_acquires_identifier_ownership: false,
  contradiction_with_authenticated_external_identifier_result: "CONFLICT",
  message_authenticity_validated_independently: true,
  resource_authorization_revalidated_independently: true,
  returned_value_reclassified_as_external_object_id: false,
} as const;

export const EXTERNAL_IDENTIFIER_EVIDENCE_POLICY = {
  exact_relationship_requires_reconstructible_evidence: true,
  evidence_by_reference: true,
  protected_source_reference_preferred_over_payload_copy: true,
  full_payload_is_mapping_identity: false,
  payload_hash_replaces_relationship: false,
  correlation_creates_identity_equivalence: false,
  loss_of_sufficient_evidence_may_require_reconciliation: true,
  secrets_or_credentials_embedded_as_evidence: false,
} as const;

export const EXTERNAL_IDENTIFIER_LIFECYCLE_POLICY = {
  historical_relation_overwritten_for_new_target: false,
  reassignment_requires_successor_relation: true,
  canonical_resource_merge_executed_by_mapping: false,
  canonical_resource_split_distributes_aliases_heuristically: false,
  incompatible_namespace_or_semantic_change_requires_new_relation: true,
  historical_resolution_uses_owner_defined_applicable_time: true,
  received_at_used_by_convenience_for_historical_resolution: false,
  retirement_deletes_historical_references: false,
  contract_version_is_mapping_successor_identity: false,
} as const;

export const EXTERNAL_IDENTIFIER_EVENT_COMPATIBILITY_POLICY = {
  external_received_event_contract_task_id: "SHELL-CON-019",
  current_mapping_refs_storage: "GENERIC_STRING_REFERENCES",
  typed_target_ref: "ExternalIdentifierMappingRef",
  consumer_migration_materialized_here: false,
  event_may_exist_with_zero_resolved_mappings: true,
  mapping_refs_may_contain_heuristic_candidates: false,
  external_event_id_is_mapping_id: false,
  receipt_id_is_mapping_id: false,
  unresolved_mapping_may_preserve_received_evidence: true,
  unresolved_mapping_enables_identity_dependent_effect: false,
} as const;

export const EXTERNAL_IDENTIFIER_SALE_LINE_COMPATIBILITY_POLICY = {
  canonical_sale_line_contract_task_id: "SHELL-CON-021",
  current_mapping_refs_storage: "GENERIC_STRING_REFERENCES",
  typed_target_ref: "ExternalIdentifierMappingRef",
  consumer_migration_materialized_here: false,
  mapping_change_reidentifies_sale_line: false,
  later_presentation_or_recipe_resolution_creates_new_line: false,
  product_presentation_recipe_remain_owner_domain_refs: true,
  mapping_ref_explains_resolution_without_replacing_resolved_resource: true,
  structural_line_may_exist_with_pending_mapping: true,
  source_row_number_is_external_line_id: false,
  makos_excel_gains_individual_granularity_from_mapping: false,
} as const;

export const EXTERNAL_IDENTIFIER_IDEMPOTENCY_BOUNDARY = {
  mapping_id_is_idempotency_key: false,
  external_id_value_is_idempotency_key_by_default: false,
  idempotency_ref_may_exist_without_business_resource_identity: true,
  resolved_mapping_proves_operation_is_new: false,
  redelivery_identity_preserved_after_mapping_resolution: true,
  mapping_revision_authorizes_repeat_effect: false,
  idempotency_contract_task_id: "SHELL-CON-023",
} as const;

export const EXTERNAL_IDENTIFIER_AUTHORITY_BOUNDARY = {
  authenticity_implies_mapping_resolved: false,
  resolved_mapping_implies_authorization: false,
  integration_principal_implies_resource_equivalence: false,
  external_credential_implies_business_authority: false,
  owner_domain_revalidates_resource_existence_state_and_use: true,
  contracts_package_executes_business_effect: false,
} as const;

export const EXTERNAL_IDENTIFIER_FAILURE_POLICY = {
  resolved_allows_only_subsequent_gates: true,
  partially_resolved_allows_only_explicitly_resolved_dimensions: true,
  unresolved_blocks_identity_dependent_effect: true,
  ambiguous_blocks_identity_dependent_effect: true,
  conflict_blocks_identity_dependent_effect: true,
  blocked_prevents_fictitious_relation: true,
  not_applicable_fabricates_resource: false,
  retired_used_for_new_operations_outside_validity: false,
  blocking_effect_requires_discarding_valid_evidence: false,
  disposition_contract_task_id: "SHELL-CON-024",
} as const;

export const EXTERNAL_IDENTIFIER_MAPPING_ADOPTION = [
  {
    external_system_id: "EXT-SYS-001",
    system: "Supabase",
    decision_summary: "Infrastructure only; no global business mapping is created.",
    materialized_mapping_count: 0,
  },
  {
    external_system_id: "EXT-SYS-002",
    system: "Wompi",
    decision_summary: "Typed transaction, propagated canonical and event-to-receipt relationships are admissible; reference remains separate.",
    materialized_mapping_count: 0,
  },
  {
    external_system_id: "EXT-SYS-003",
    system: "RevenueCat",
    decision_summary: "Typed platform/store and propagated canonical relationships are admissible; aliases do not imply VENTO identity.",
    materialized_mapping_count: 0,
  },
  {
    external_system_id: "EXT-SYS-004",
    system: "Resend",
    decision_summary: "Provider message IDs are not fabricated and email remains an address or attribute.",
    materialized_mapping_count: 0,
  },
  {
    external_system_id: "EXT-SYS-005",
    system: "Expo / EAS Update",
    decision_summary: "Project, channel, profile and runtime identifiers remain technical references without universal business mapping.",
    materialized_mapping_count: 0,
  },
  {
    external_system_id: "EXT-SYS-006",
    system: "Expo Push Service",
    decision_summary: "Push token is a routing reference and never an employee identity.",
    materialized_mapping_count: 0,
  },
  {
    external_system_id: "EXT-SYS-007",
    system: "Sentry",
    decision_summary: "Observability references remain technical or correlational without accredited business mapping.",
    materialized_mapping_count: 0,
  },
  {
    external_system_id: "EXT-SYS-008",
    system: "Google Maps / Google Reviews",
    decision_summary: "place_id remains external; durable association with VENTO requires explicit mapping.",
    materialized_mapping_count: 0,
  },
  {
    external_system_id: "EXT-SYS-009",
    system: "Apple Wallet / PassKit y APNs",
    decision_summary: "Serial, pass type, device library identifier, push token and canonical owner remain separate planes.",
    materialized_mapping_count: 0,
  },
  {
    external_system_id: "EXT-SYS-010",
    system: "Vercel",
    decision_summary: "Project, deployment and domain remain technical references without universal business equivalence.",
    materialized_mapping_count: 0,
  },
  {
    external_system_id: "EXT-SYS-011",
    system: "Zebra BrowserPrint",
    decision_summary: "device.uid requires an accredited relationship with canonical printer identity before durable binding.",
    materialized_mapping_count: 0,
  },
  {
    external_system_id: "EXT-SYS-012",
    system: "Google Wallet / Google Pay & Wallet",
    decision_summary: "Remote IDs remain unmapped until binding and related resource are accredited.",
    materialized_mapping_count: 0,
  },
  {
    external_system_id: "EXT-SYS-013",
    system: "POS externo vigente",
    decision_summary: "Consumes INT-POS-010, INT-POS-011 and INT-POS-013; makos_excel row, hash, name or code do not fabricate sale or line identity.",
    materialized_mapping_count: 0,
  },
  {
    external_system_id: "EXT-SYS-014",
    system: "Shopify / comercio electronico",
    decision_summary: "No mapping instances are created without authorized binding and accredited namespace.",
    materialized_mapping_count: 0,
  },
  {
    external_system_id: "EXT-SYS-015",
    system: "Rappi / marketplace",
    decision_summary: "No order, store or courier mappings are created without real binding and contract.",
    materialized_mapping_count: 0,
  },
  {
    external_system_id: "EXT-SYS-016",
    system: "ManyChat / automatizacion conversacional",
    decision_summary: "No subscriber, contact or flow mappings are created without accredited binding.",
    materialized_mapping_count: 0,
  },
  {
    external_system_id: "EXT-SYS-017",
    system: "WhatsApp",
    decision_summary: "Phone, contact or conversation never become canonical person or case identity without provider, namespace and contract.",
    materialized_mapping_count: 0,
  },
  {
    external_system_id: "EXT-SYS-018",
    system: "Instagram / social",
    decision_summary: "Handle, profile or message ID never become business identity without approved binding and relationship.",
    materialized_mapping_count: 0,
  },
  {
    external_system_id: "EXT-SYS-019",
    system: "Correo corporativo y alias funcionales",
    decision_summary: "Mailbox, email or alias never equal canonical person, record or supplier by text coincidence.",
    materialized_mapping_count: 0,
  },
  {
    external_system_id: "EXT-SYS-020",
    system: "Telefonia / voz",
    decision_summary: "Mapping remains blocked until TI-INT-003 accredits operator, account, interface, namespaces, IDs and semantics.",
    materialized_mapping_count: 0,
  },
  {
    external_system_id: "EXT-SYS-021",
    system: "Transporte externo",
    decision_summary: "Tracking, guide, driver or shipment reference never become canonical output or delivery without accredited binding and contract.",
    materialized_mapping_count: 0,
  },
] as const;

export const EXTERNAL_IDENTIFIER_MAPPING_COVERAGE = {
  expected_external_system_count: 21,
  adopted_external_system_count: 21,
  missing_external_system_count: 0,
  duplicate_external_system_count: 0,
  unique_external_system_id_count: 21,
  materialized_mapping_id_count: 0,
  materialized_operational_mapping_count: 0,
} as const;

export const EXTERNAL_IDENTIFIER_INTEROPERABILITY_CASES = [
  { case_id: "WOMPI_TRANSACTION", class: "EXTERNAL_OBJECT_ID", relation: "EXTERNAL_TO_CANONICAL" },
  { case_id: "WOMPI_EVENT_RECEIPT", class: "EXTERNAL_OBJECT_ID", relation: "EXTERNAL_EVENT_TO_RECEIPT" },
  { case_id: "REVENUECAT_PROPAGATED_APP_USER", class: "PROPAGATED_CANONICAL_ID", relation: "CANONICAL_PROPAGATED_EXTERNAL" },
  { case_id: "EXPO_PUSH_TOKEN", class: "EXTERNAL_ROUTING_REF", relation: "EXTERNAL_ROUTE_TO_OWNER" },
  { case_id: "GOOGLE_PLACE_ID_WITHOUT_DURABLE_ASSOCIATION", class: "EXTERNAL_OBJECT_ID", relation: "NO_EQUIVALENCE_OR_CORRELATION_ONLY" },
  { case_id: "PASSKIT_DEVICE_LIBRARY_IDENTIFIER", class: "EXTERNAL_OBJECT_ID", relation: "NO_USER_ID_EQUIVALENCE" },
  { case_id: "PASSKIT_PUSH_TOKEN", class: "EXTERNAL_ROUTING_REF", relation: "NO_USER_OR_PASS_ID_EQUIVALENCE" },
  { case_id: "ZEBRA_DEVICE_UID", class: "EXTERNAL_OBJECT_ID", relation: "EXTERNAL_TO_CANONICAL_AFTER_ACCREDITATION" },
  { case_id: "POS_SOURCE_ROW_NUMBER", class: "DISPLAY_SEARCH_ATTRIBUTE", relation: "NOT_ELIGIBLE_AS_EXTERNAL_LINE_ID" },
  { case_id: "DISPLAY_EMAIL_PHONE_NAME", class: "DISPLAY_SEARCH_ATTRIBUTE", relation: "NO_EXACT_MAPPING_BY_ITSELF" },
] as const;

export const EXTERNAL_IDENTIFIER_SECURITY_POLICY = {
  api_key_allowed: false,
  client_secret_allowed: false,
  password_allowed: false,
  access_token_allowed: false,
  refresh_token_allowed: false,
  private_key_allowed: false,
  service_role_key_allowed: false,
  provider_credential_allowed: false,
  persistent_signed_url_allowed: false,
  full_source_payload_allowed_by_default: false,
  mapping_id_grants_canonical_resource_read: false,
  canonical_id_grants_provider_access: false,
} as const;

export const EXTERNAL_IDENTIFIER_OWNERSHIP_POLICY = {
  shared_contract_owns_mapping_shape_only: true,
  owner_domain_retains_canonical_identifier_semantics: true,
  external_provider_owns_vento_resource: false,
  adapter_resolution_grants_functional_ownership: false,
  physical_persistence_owner_task_id: "INT-DB-004",
  consumer_local_incompatible_redefinition_allowed_after_publication: false,
} as const;

export const EXTERNAL_IDENTIFIER_MAPPING_CONTRACT_METADATA = {
  logical_namespace: "@vento/contracts/integrations",
  contract_task_id: "SHELL-CON-022",
  semantic_owner_task_ids: ["INT-EXT-013", "INT-POS-010", "INT-POS-011", "INT-POS-013"],
  external_received_event_contract_task_id: "SHELL-CON-019",
  canonical_sale_contract_task_id: "SHELL-CON-020",
  canonical_sale_line_contract_task_id: "SHELL-CON-021",
  physical_persistence_owner_task_id: "INT-DB-004",
  idempotency_contract_task_id: "SHELL-CON-023",
  disposition_contract_task_id: "SHELL-CON-024",
  next_contract_task_id: "SHELL-CON-023",
  execution_gate: "PRE_E5_FOUNDATION",
  physical_mode: "GLOBAL_ENABLE_ONCE",
  public_export_published: false,
  package_root_index_extended: false,
  consumer_adoption_materialized: false,
  runtime_resolution_materialized: false,
  persistence_materialized: false,
  cache_materialized: false,
  endpoint_materialized: false,
  rpc_materialized: false,
  migration_materialized: false,
  supabase_changed: false,
  materialized_mapping_id_count: 0,
  materialized_operational_mapping_count: 0,
} as const;

export type ExternalIdentifierMappingIdentityPolicy = typeof EXTERNAL_IDENTIFIER_MAPPING_IDENTITY_POLICY;
export type ExternalIdentifierReferencePolicy = typeof EXTERNAL_IDENTIFIER_REFERENCE_POLICY;
export type ExternalIdentifierNormalizationPolicy = typeof EXTERNAL_IDENTIFIER_NORMALIZATION_POLICY;
export type ExternalIdentifierRelationPolicy = typeof EXTERNAL_IDENTIFIER_RELATION_POLICY;
export type ExternalIdentifierMappingStatePolicy = typeof EXTERNAL_IDENTIFIER_MAPPING_STATE_POLICY;
export type ExternalIdentifierCardinalityPolicy = typeof EXTERNAL_IDENTIFIER_CARDINALITY_POLICY;
export type ExternalIdentifierHeuristicPolicy = typeof EXTERNAL_IDENTIFIER_HEURISTIC_POLICY;
export type ExternalIdentifierPropagatedCanonicalPolicy = typeof EXTERNAL_IDENTIFIER_PROPAGATED_CANONICAL_POLICY;
export type ExternalIdentifierEvidencePolicy = typeof EXTERNAL_IDENTIFIER_EVIDENCE_POLICY;
export type ExternalIdentifierLifecyclePolicy = typeof EXTERNAL_IDENTIFIER_LIFECYCLE_POLICY;
export type ExternalIdentifierEventCompatibilityPolicy = typeof EXTERNAL_IDENTIFIER_EVENT_COMPATIBILITY_POLICY;
export type ExternalIdentifierSaleLineCompatibilityPolicy = typeof EXTERNAL_IDENTIFIER_SALE_LINE_COMPATIBILITY_POLICY;
export type ExternalIdentifierIdempotencyBoundary = typeof EXTERNAL_IDENTIFIER_IDEMPOTENCY_BOUNDARY;
export type ExternalIdentifierAuthorityBoundary = typeof EXTERNAL_IDENTIFIER_AUTHORITY_BOUNDARY;
export type ExternalIdentifierFailurePolicy = typeof EXTERNAL_IDENTIFIER_FAILURE_POLICY;
export type ExternalIdentifierSecurityPolicy = typeof EXTERNAL_IDENTIFIER_SECURITY_POLICY;
export type ExternalIdentifierOwnershipPolicy = typeof EXTERNAL_IDENTIFIER_OWNERSHIP_POLICY;
export type ExternalIdentifierMappingContractMetadata = typeof EXTERNAL_IDENTIFIER_MAPPING_CONTRACT_METADATA;
