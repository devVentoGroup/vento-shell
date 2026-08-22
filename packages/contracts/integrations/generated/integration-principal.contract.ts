// GENERATED FILE. DO NOT EDIT.
// Semantic owner: INT-EXT-002
// Contract task: SHELL-CON-017
// Foundation task: SHELL-CON-001
// Source contract SHA256: c4ca8bdc55f98113d235107f99355ef6a69dbb59a7f0853a6e087c8fcad14839

declare const integrationPrincipalIdBrand: unique symbol;

export type IntegrationPrincipalId =
  string & {
    readonly [integrationPrincipalIdBrand]: "IntegrationPrincipalId";
  };

export interface IntegrationPrincipal {
  readonly integration_principal_id: IntegrationPrincipalId;
}

export type IntegrationPrincipalRef =
  Pick<IntegrationPrincipal, "integration_principal_id">;

export const INTEGRATION_PRINCIPAL_CONTEXT_POLICY = {
  system_service_may_represent_execution: true,
  not_every_system_service_is_external_integration: true,
  principal_context_identity_equivalence: false,
  service_role_is_principal: false,
  business_authority_implied: false,
} as const;

export const INTEGRATION_PRINCIPAL_CARDINALITY_POLICY = {
  basis: "MATERIAL_INTEGRATION_BOUNDARY",
  binding_requires_explicit_principal_before_operation: true,
  generic_reuse_across_independent_integrations: false,
  provider_name_implies_single_principal: false,
  credential_rotation_creates_new_principal: false,
  boundary_or_purpose_change_requires_reevaluation: true,
} as const;

export const INTEGRATION_PRINCIPAL_FAILURE_POLICY = {
  unresolved_principal: "FAIL_CLOSED",
  ambiguous_principal: "FAIL_CLOSED",
  wrong_boundary_principal: "FAIL_CLOSED",
  heuristic_assignment_allowed: false,
} as const;

export const INTEGRATION_PRINCIPAL_IDENTITY_POLICY = {
  identity_name: "IntegrationPrincipalId",
  semantics: "STABLE_OPAQUE_NON_SECRET_TECHNICAL_IDENTITY",
  serialization: "UNSPECIFIED",
  syntax_pattern: null,
  static_registry: false,
  materialized_id_count: 0,
  derive_from_external_system_id: false,
  derive_from_credential: false,
  derive_from_human_identity: false,
  reuse_after_retirement: false,
} as const;

export const INTEGRATION_PRINCIPAL_SEPARATED_IDENTITIES = [
  "PrincipalContext.session_id",
  "PrincipalContext.auth_user_id",
  "PermissionKey",
  "provider_account_ref",
  "external_credential_id",
  "secret value",
  "endpoint_ref",
  "device_id",
  "external_system_id",
  "AppCode",
  "actor humano",
] as const;

export type IntegrationPrincipalSeparatedIdentity =
  (typeof INTEGRATION_PRINCIPAL_SEPARATED_IDENTITIES)[number];

export const INTEGRATION_PRINCIPAL_CONCEPTUAL_DIMENSIONS = [
  "integration_principal_id",
  "external_system_id",
  "external_instance_id",
  "business_owner_ref",
  "technical_owner_ref",
  "finalidad técnica",
  "ambiente",
  "vigencia",
  "correlación",
] as const;

export type IntegrationPrincipalConceptualDimension =
  (typeof INTEGRATION_PRINCIPAL_CONCEPTUAL_DIMENSIONS)[number];

export const INTEGRATION_PRINCIPAL_REFERENCE_ADOPTION = {
  source_inventory_task_id: "INT-EXT-001",
  semantic_owner_task_id: "INT-EXT-002",
  external_system_decision_count: 21,
  documentary_status: "ESPECIFICADO",
  documentary_decision_count: 21,
  pending_physical_materialization_count: 11,
  not_applicable_without_binding_count: 10,
  materialized_principal_id_count: 0,
  adoption_mode: "REFERENCE_NOT_DUPLICATED",
} as const;

export const INTEGRATION_PRINCIPAL_CONTRACT_METADATA = {
  logical_namespace: "@vento/contracts/integrations",
  contract_task_id: "SHELL-CON-017",
  semantic_owner_task_id: "INT-EXT-002",
  credential_reference_task_id: "SHELL-CON-018",
  physical_registry_owner_task_id: "INT-DB-001",
  execution_gate: "PRE_E5_FOUNDATION",
  physical_mode: "GLOBAL_ENABLE_ONCE",
  public_export_published: false,
  runtime_registry_materialized: false,
  credential_materialized: false,
  secret_materialized: false,
  supabase_changed: false,
} as const;

export type IntegrationPrincipalContextPolicy =
  typeof INTEGRATION_PRINCIPAL_CONTEXT_POLICY;

export type IntegrationPrincipalCardinalityPolicy =
  typeof INTEGRATION_PRINCIPAL_CARDINALITY_POLICY;

export type IntegrationPrincipalFailurePolicy =
  typeof INTEGRATION_PRINCIPAL_FAILURE_POLICY;

export type IntegrationPrincipalIdentityPolicy =
  typeof INTEGRATION_PRINCIPAL_IDENTITY_POLICY;

export type IntegrationPrincipalReferenceAdoption =
  typeof INTEGRATION_PRINCIPAL_REFERENCE_ADOPTION;

export type IntegrationPrincipalContractMetadata =
  typeof INTEGRATION_PRINCIPAL_CONTRACT_METADATA;
