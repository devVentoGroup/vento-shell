// GENERATED FILE. DO NOT EDIT.
// Semantic owners: INT-EXT-003..008
// Contract task: SHELL-CON-018
// Foundation task: SHELL-CON-001
// Principal contract task: SHELL-CON-017
// Source contract SHA256: b22094113048ee52d8ea8abe961af7fcb8be2b1924eabe69d0eb048d928bbb69

import type { IntegrationPrincipalId } from "./integration-principal.contract.js";

declare const externalCredentialIdBrand: unique symbol;

export type ExternalCredentialId =
  string & {
    readonly [externalCredentialIdBrand]: "ExternalCredentialId";
  };

export const VENTO_CREDENTIAL_ENVIRONMENTS = [
  "DEVELOPMENT",
  "STAGING",
  "PRODUCTION",
] as const;

export type VentoCredentialEnvironment =
  (typeof VENTO_CREDENTIAL_ENVIRONMENTS)[number];

export interface ExternalCredentialRef {
  readonly external_credential_id: ExternalCredentialId;
  readonly external_system_id: string;
  readonly integration_principal_id: IntegrationPrincipalId;
  readonly credential_surface: string;
  readonly environment: VentoCredentialEnvironment;
  readonly external_instance_id?: string;
  readonly provider_account_ref?: string;
  readonly provenance?: string;
  readonly mechanism?: string;
  readonly minimum_scope?: readonly string[];
  readonly scope_ceiling?: readonly string[];
  readonly material_class?: string;
  readonly functional_owner_ref?: string;
  readonly technical_custodian_ref?: string;
  readonly lifecycle_state?: string;
  readonly predecessor_external_credential_id?: ExternalCredentialId;
  readonly successor_external_credential_id?: ExternalCredentialId;
  readonly known_dates?: readonly string[];
  readonly authorized_consumers?: readonly string[];
}

export const EXTERNAL_CREDENTIAL_CONCEPTUAL_DIMENSIONS = [
  "external_credential_id",
  "external_system_id",
  "external_instance_id",
  "integration_principal_id",
  "provider_account_ref",
  "credential_surface",
  "provenance",
  "mechanism",
  "minimum_scope",
  "scope_ceiling",
  "environment",
  "material_class",
  "functional_owner_ref",
  "technical_custodian_ref",
  "lifecycle_state",
  "predecessor_successor_refs",
  "known_dates",
  "authorized_consumers",
] as const;

export type ExternalCredentialConceptualDimension =
  (typeof EXTERNAL_CREDENTIAL_CONCEPTUAL_DIMENSIONS)[number];

export const EXTERNAL_CREDENTIAL_IDENTITY_POLICY = {
  identity_name: "ExternalCredentialId",
  semantics: "STABLE_OPAQUE_NON_SECRET_CREDENTIAL_IDENTITY",
  serialization: "UNSPECIFIED",
  syntax_pattern: null,
  static_registry: false,
  materialized_id_count: 0,
  derive_from_secret_value: false,
  derive_from_integration_principal_id: false,
  derive_from_external_system_id: false,
  derive_from_provider_account_ref: false,
  derive_from_endpoint: false,
  derive_from_environment_variable_name: false,
  authentication_mechanism: false,
  knowledge_grants_secret_resolution: false,
  reuse_for_independent_successor: false,
  reuse_after_retirement: false,
} as const;

export const EXTERNAL_CREDENTIAL_REFERENCE_POLICY = {
  material_class: "CREDENTIAL_REFERENCE",
  contains_authentication_material: false,
  contains_secret_store_path: false,
  contains_runtime_secret_locator: false,
  runtime_secret_resolution_api: false,
  business_authority_implied: false,
  permission_key_implied: false,
  credential_value_publication: false,
  fallback_to_global_credential: false,
  fallback_to_legacy_credential: false,
  fallback_to_other_environment: false,
  environment_cardinality: "EXACTLY_ONE",
  cardinality_basis: "CREDENTIAL_SURFACE_AND_ENVIRONMENT",
  multiple_refs_per_external_system_allowed: true,
} as const;

export const EXTERNAL_CREDENTIAL_ROTATION_POLICY = {
  independent_successor_requires_new_external_credential_id: true,
  ordinary_rotation_changes_integration_principal_id: false,
  predecessor_successor_history_preserved: true,
  revoked_expired_retired_history_preserved: true,
  derived_ephemeral_artifact_gets_identity_automatically: false,
  cross_environment_successor_allowed: false,
} as const;

export const EXTERNAL_CREDENTIAL_FAILURE_POLICY = {
  missing_required_credential_id: "FAIL_CLOSED",
  wrong_external_system: "FAIL_CLOSED",
  wrong_integration_principal: "FAIL_CLOSED",
  wrong_surface: "FAIL_CLOSED",
  wrong_environment: "FAIL_CLOSED",
  ambiguous_environment: "FAIL_CLOSED",
  incompatible_mechanism: "FAIL_CLOSED",
  requested_scope_above_ceiling: "FAIL_CLOSED",
  unusable_lifecycle_state: "FAIL_CLOSED",
  unresolved_required_material: "FAIL_CLOSED",
  inference_required_to_complete_reference: "FAIL_CLOSED",
} as const;

export const EXTERNAL_CREDENTIAL_REFERENCE_FORBIDDEN_MATERIAL = [
  "operational_api_key",
  "secret_key",
  "service_role_key",
  "complete_jwt",
  "access_token",
  "refresh_token",
  "webhook_secret",
  "password",
  "client_secret",
  "private_key",
  "private_certificate_material",
  "recoverable_service_account_private_material",
  "reusable_session_cookie",
  "complete_authentication_header",
  "reusable_signature_credential",
  "recoverable_cryptographic_material",
  "secret_reconstruction_fragment",
  "operational_secret_store_locator",
  "runtime_secret_recovery_instruction",
] as const;

export type ExternalCredentialForbiddenMaterial =
  (typeof EXTERNAL_CREDENTIAL_REFERENCE_FORBIDDEN_MATERIAL)[number];

export const EXTERNAL_CREDENTIAL_APPLICABILITY_STATUSES = [
  "PENDIENTE_DE_EVIDENCIA",
  "NO_APLICA",
  "NO_APLICA_ACTUAL",
] as const;

export type ExternalCredentialApplicabilityStatus =
  (typeof EXTERNAL_CREDENTIAL_APPLICABILITY_STATUSES)[number];

export const EXTERNAL_CREDENTIAL_REFERENCE_APPLICABILITY = [
  {
    external_system_id: "EXT-SYS-001",
    system: "Supabase",
    status: "PENDIENTE_DE_EVIDENCIA",
  },
  {
    external_system_id: "EXT-SYS-002",
    system: "Wompi",
    status: "PENDIENTE_DE_EVIDENCIA",
  },
  {
    external_system_id: "EXT-SYS-003",
    system: "RevenueCat",
    status: "PENDIENTE_DE_EVIDENCIA",
  },
  {
    external_system_id: "EXT-SYS-004",
    system: "Resend",
    status: "PENDIENTE_DE_EVIDENCIA",
  },
  {
    external_system_id: "EXT-SYS-005",
    system: "Expo / EAS Update",
    status: "PENDIENTE_DE_EVIDENCIA",
  },
  {
    external_system_id: "EXT-SYS-006",
    system: "Expo Push Service",
    status: "NO_APLICA",
  },
  {
    external_system_id: "EXT-SYS-007",
    system: "Sentry",
    status: "PENDIENTE_DE_EVIDENCIA",
  },
  {
    external_system_id: "EXT-SYS-008",
    system: "Google Maps / Google Reviews",
    status: "PENDIENTE_DE_EVIDENCIA",
  },
  {
    external_system_id: "EXT-SYS-009",
    system: "Apple Wallet / PassKit y APNs",
    status: "PENDIENTE_DE_EVIDENCIA",
  },
  {
    external_system_id: "EXT-SYS-010",
    system: "Vercel",
    status: "PENDIENTE_DE_EVIDENCIA",
  },
  {
    external_system_id: "EXT-SYS-011",
    system: "Zebra BrowserPrint",
    status: "NO_APLICA",
  },
  {
    external_system_id: "EXT-SYS-012",
    system: "Google Wallet / Google Pay & Wallet",
    status: "NO_APLICA_ACTUAL",
  },
  {
    external_system_id: "EXT-SYS-013",
    system: "POS externo vigente",
    status: "NO_APLICA_ACTUAL",
  },
  {
    external_system_id: "EXT-SYS-014",
    system: "Shopify / canal de comercio electrónico",
    status: "NO_APLICA_ACTUAL",
  },
  {
    external_system_id: "EXT-SYS-015",
    system: "Rappi / marketplace",
    status: "NO_APLICA_ACTUAL",
  },
  {
    external_system_id: "EXT-SYS-016",
    system: "ManyChat / automatización conversacional",
    status: "NO_APLICA_ACTUAL",
  },
  {
    external_system_id: "EXT-SYS-017",
    system: "WhatsApp",
    status: "NO_APLICA_ACTUAL",
  },
  {
    external_system_id: "EXT-SYS-018",
    system: "Instagram / perfiles sociales",
    status: "NO_APLICA_ACTUAL",
  },
  {
    external_system_id: "EXT-SYS-019",
    system: "Correo corporativo y alias funcionales",
    status: "NO_APLICA_ACTUAL",
  },
  {
    external_system_id: "EXT-SYS-020",
    system: "Telefonía / canal de voz",
    status: "NO_APLICA_ACTUAL",
  },
  {
    external_system_id: "EXT-SYS-021",
    system: "Transporte externo",
    status: "NO_APLICA_ACTUAL",
  },
] as const satisfies readonly {
  readonly external_system_id: string;
  readonly system: string;
  readonly status: ExternalCredentialApplicabilityStatus;
}[];

export const EXTERNAL_CREDENTIAL_REFERENCE_COVERAGE = {
  external_system_decision_count: 21,
  pending_evidence_count: 9,
  not_applicable_count: 2,
  not_applicable_current_count: 10,
  materialized_external_credential_id_count: 0,
  persisted_external_credential_ref_count: 0,
  created_or_moved_secret_count: 0,
} as const;

export const EXTERNAL_CREDENTIAL_CONTRACT_METADATA = {
  logical_namespace: "@vento/contracts/integrations",
  contract_task_id: "SHELL-CON-018",
  principal_contract_task_id: "SHELL-CON-017",
  semantic_owner_task_ids: [
    "INT-EXT-003",
    "INT-EXT-004",
    "INT-EXT-005",
    "INT-EXT-006",
    "INT-EXT-007",
    "INT-EXT-008",
  ],
  physical_reference_registry_owner_task_id: "INT-DB-002",
  next_contract_task_id: "SHELL-CON-019",
  execution_gate: "PRE_E5_FOUNDATION",
  physical_mode: "GLOBAL_ENABLE_ONCE",
  public_export_published: false,
  runtime_secret_resolution_materialized: false,
  external_credential_values_materialized: false,
  secret_materialized: false,
  supabase_changed: false,
} as const;

export type ExternalCredentialIdentityPolicy =
  typeof EXTERNAL_CREDENTIAL_IDENTITY_POLICY;

export type ExternalCredentialReferencePolicy =
  typeof EXTERNAL_CREDENTIAL_REFERENCE_POLICY;

export type ExternalCredentialRotationPolicy =
  typeof EXTERNAL_CREDENTIAL_ROTATION_POLICY;

export type ExternalCredentialFailurePolicy =
  typeof EXTERNAL_CREDENTIAL_FAILURE_POLICY;

export type ExternalCredentialReferenceCoverage =
  typeof EXTERNAL_CREDENTIAL_REFERENCE_COVERAGE;

export type ExternalCredentialContractMetadata =
  typeof EXTERNAL_CREDENTIAL_CONTRACT_METADATA;
