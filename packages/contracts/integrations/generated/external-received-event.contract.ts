// GENERATED FILE. DO NOT EDIT.
// Semantic owners: INT-EXT-009..017
// Contract task: SHELL-CON-019
// Foundation task: SHELL-CON-001
// Principal contract task: SHELL-CON-017
// Credential contract task: SHELL-CON-018
// Source contract SHA256: 0faeb8d65edcf9b5806c6c962aefb76ab9cfd13e434d43cb549d559cd5cbaed1

import type {
  ExternalCredentialId,
  VentoCredentialEnvironment,
} from "./external-credential-ref.contract.js";
import type { IntegrationPrincipalId } from "./integration-principal.contract.js";

export interface ExternalReceivedEvent<TNormalizedAssertion> {
  readonly external_system_id: string;
  readonly external_instance_id: string | null;
  readonly integration_principal_id: IntegrationPrincipalId | null;
  readonly external_credential_id: ExternalCredentialId | null;
  readonly environment: VentoCredentialEnvironment;
  readonly vento_contract_version: string;
  readonly provider_contract_version: string | null;
  readonly input_contract_ref: string;
  readonly transport_ref: string;
  readonly external_event_id: string | null;
  readonly receipt_id: string | null;
  readonly received_at: string;
  readonly provider_occurred_at: string | null;
  readonly authenticity_result_ref: string | null;
  readonly source_evidence_ref: string;
  readonly source_payload_digest: string | null;
  readonly normalized_assertion: TNormalizedAssertion | null;
  readonly mapping_refs: readonly string[];
  readonly idempotency_ref: string | null;
  readonly correlation_refs: readonly string[];
  readonly owner_contract_ref: string;
}

export const EXTERNAL_RECEIVED_EVENT_BOUNDARY_POLICY = {
  external_assertion_is_canonical_business_fact: false,
  external_provider_is_internal_business_producer: false,
  receipt_ack_callback_webhook_confirms_business_effect: false,
  provider_payload_is_owner_domain_model: false,
  adapter_acquires_functional_ownership: false,
  authenticity_implies_business_correctness: false,
  business_authority_implied: false,
  owner_application_produces_business_fact_after_validation: true,
} as const;

export const EXTERNAL_RECEIVED_EVENT_IDENTITY_POLICY = {
  external_event_id_semantics: "PROVIDER_ASSERTION_ID_WHEN_STABLE",
  receipt_id_semantics: "VENTO_TECHNICAL_RECEIPT_ID",
  external_event_id_equals_receipt_id_by_definition: false,
  stable_identity_required_before_effect_processing: true,
  durable_receipt_required_without_stable_external_event_id: true,
  new_receipt_per_processing_attempt_allowed: false,
  payload_digest_replaces_event_or_receipt_identity: false,
  mapping_required_for_canonical_resource_equivalence: true,
} as const;

export const EXTERNAL_RECEIVED_EVENT_AUTHENTICITY_POLICY = {
  authenticity_result_by_reference: true,
  null_authenticity_result_means_valid: false,
  valid_authenticity_confirms_business_correctness: false,
  complete_signature_material_embedded: false,
  credential_reference_equals_authenticity_result: false,
  failed_or_unresolved_authenticity_may_produce_business_effect: false,
} as const;

export const EXTERNAL_RECEIVED_EVENT_EVIDENCE_POLICY = {
  source_evidence_reference_required: true,
  raw_payload_transported_by_default: false,
  persistent_signed_url_allowed_as_source_evidence_ref: false,
  source_payload_digest_is_integrity_or_correlation_only: true,
  source_evidence_rewritten_on_redelivery: false,
  source_evidence_rewritten_on_parser_change: false,
  exact_source_bytes_preserved_when_authenticity_requires_them: true,
  audit_log_may_become_payload_copy: false,
} as const;

export const EXTERNAL_RECEIVED_EVENT_NORMALIZATION_POLICY = {
  normalized_assertion_is_business_fact: false,
  typed_per_input_contract: true,
  validated_before_owner_handoff: true,
  minimized: true,
  universal_record_string_unknown_api: false,
  secret_material_allowed: false,
  may_confirm_business_effect_by_itself: false,
  nullable_when_processing_cannot_continue: true,
} as const;

export const EXTERNAL_RECEIVED_EVENT_REFERENCE_POLICY = {
  authenticity_by_reference: true,
  mapping_by_reference: true,
  idempotency_by_reference: true,
  correlation_by_reference: true,
  owner_contract_ref_grants_authority: false,
  timestamp_alone_establishes_correlation_or_causality: false,
} as const;

export const EXTERNAL_RECEIVED_EVENT_TEMPORAL_POLICY = {
  received_at_semantics: "VENTO_TECHNICAL_RECEIPT_TIME",
  provider_occurred_at_semantics: "PROVIDER_CLAIMED_EVENT_TIME",
  provider_occurred_at_nullable: true,
  received_at_replaced_by_provider_timestamp: false,
  business_order_derived_only_from_timestamps: false,
} as const;

export const EXTERNAL_RECEIVED_EVENT_FORBIDDEN_MATERIAL = [
  "api_key",
  "service_role_key",
  "password",
  "client_secret",
  "webhook_secret",
  "refresh_token",
  "reusable_access_token",
  "private_key",
  "p8_private_material",
  "p12_private_material",
  "private_certificate_material",
  "persistent_signed_url",
  "session_cookie",
  "raw_sensitive_payload_by_default",
  "complete_bank_data",
  "complete_medical_record",
  "provider_credential",
  "checksum_or_hmac_secret",
] as const;

export type ExternalReceivedEventForbiddenMaterial =
  (typeof EXTERNAL_RECEIVED_EVENT_FORBIDDEN_MATERIAL)[number];

export const EXTERNAL_RECEIVED_EVENT_APPLICABILITY_DECISIONS = [
  "APLICA_EVENTO_INBOUND_ACREDITADO",
  "NO_APLICA_EN_CORTE",
  "NO_APLICA_AL_EVENTO_EN_CORTE",
] as const;

export type ExternalReceivedEventApplicabilityDecision =
  (typeof EXTERNAL_RECEIVED_EVENT_APPLICABILITY_DECISIONS)[number];

export const EXTERNAL_RECEIVED_EVENT_PHYSICAL_STATUSES = [
  "DEFINIDO_NO_MATERIALIZADO",
  "NO_APLICA",
  "NO_APLICA_ACTUAL",
  "BLOQUEADO",
] as const;

export type ExternalReceivedEventPhysicalStatus =
  (typeof EXTERNAL_RECEIVED_EVENT_PHYSICAL_STATUSES)[number];

export const EXTERNAL_RECEIVED_EVENT_APPLICABILITY = [
  {
    external_system_id: "EXT-SYS-001",
    system: "Supabase",
    inbound_surface: "no existe un evento de proveedor único acreditado por esta tarea; las fronteras dependen de contratos propietarios",
    decision: "NO_APLICA_EN_CORTE",
    physical_status: "NO_APLICA",
  },
  {
    external_system_id: "EXT-SYS-002",
    system: "Wompi",
    inbound_surface: "webhook de resultado de pago",
    decision: "APLICA_EVENTO_INBOUND_ACREDITADO",
    physical_status: "DEFINIDO_NO_MATERIALIZADO",
  },
  {
    external_system_id: "EXT-SYS-003",
    system: "RevenueCat",
    inbound_surface: "webhook de entitlement / suscripción",
    decision: "APLICA_EVENTO_INBOUND_ACREDITADO",
    physical_status: "DEFINIDO_NO_MATERIALIZADO",
  },
  {
    external_system_id: "EXT-SYS-004",
    system: "Resend",
    inbound_surface: "la superficie observada es salida de correo",
    decision: "NO_APLICA_EN_CORTE",
    physical_status: "NO_APLICA",
  },
  {
    external_system_id: "EXT-SYS-005",
    system: "Expo / EAS Update",
    inbound_surface: "configuración observada sin evento runtime acreditado",
    decision: "NO_APLICA_EN_CORTE",
    physical_status: "NO_APLICA",
  },
  {
    external_system_id: "EXT-SYS-006",
    system: "Expo Push Service",
    inbound_surface: "la superficie observada es salida de notificación",
    decision: "NO_APLICA_EN_CORTE",
    physical_status: "NO_APLICA",
  },
  {
    external_system_id: "EXT-SYS-007",
    system: "Sentry",
    inbound_surface: "ingestión de telemetría VENTO hacia proveedor",
    decision: "NO_APLICA_EN_CORTE",
    physical_status: "NO_APLICA",
  },
  {
    external_system_id: "EXT-SYS-008",
    system: "Google Maps / Google Reviews",
    inbound_surface: "consulta y navegación, sin evento inbound acreditado",
    decision: "NO_APLICA_EN_CORTE",
    physical_status: "NO_APLICA",
  },
  {
    external_system_id: "EXT-SYS-009",
    system: "Apple Wallet / PassKit y APNs",
    inbound_surface: "existen requests inbound del PassKit Web Service, pero son requests de recurso/registro y no se reetiquetan como evento empresarial externo",
    decision: "NO_APLICA_AL_EVENTO_EN_CORTE",
    physical_status: "NO_APLICA",
  },
  {
    external_system_id: "EXT-SYS-010",
    system: "Vercel",
    inbound_surface: "configuración de plataforma sin evento runtime acreditado",
    decision: "NO_APLICA_EN_CORTE",
    physical_status: "NO_APLICA",
  },
  {
    external_system_id: "EXT-SYS-011",
    system: "Zebra BrowserPrint",
    inbound_surface: "bridge local y efecto físico, sin evento de proveedor inbound acreditado",
    decision: "NO_APLICA_EN_CORTE",
    physical_status: "NO_APLICA",
  },
  {
    external_system_id: "EXT-SYS-012",
    system: "Google Wallet / Google Pay & Wallet",
    inbound_surface: "modelo documentado sin binding remoto acreditado",
    decision: "NO_APLICA_EN_CORTE",
    physical_status: "NO_APLICA_ACTUAL",
  },
  {
    external_system_id: "EXT-SYS-013",
    system: "POS externo vigente",
    inbound_surface: "proveedor e interfaz no acreditados",
    decision: "NO_APLICA_EN_CORTE",
    physical_status: "BLOQUEADO",
  },
  {
    external_system_id: "EXT-SYS-014",
    system: "Shopify / comercio electrónico",
    inbound_surface: "sin binding acreditado",
    decision: "NO_APLICA_EN_CORTE",
    physical_status: "NO_APLICA_ACTUAL",
  },
  {
    external_system_id: "EXT-SYS-015",
    system: "Rappi / marketplace",
    inbound_surface: "sin binding acreditado",
    decision: "NO_APLICA_EN_CORTE",
    physical_status: "NO_APLICA_ACTUAL",
  },
  {
    external_system_id: "EXT-SYS-016",
    system: "ManyChat / automatización conversacional",
    inbound_surface: "sin binding acreditado",
    decision: "NO_APLICA_EN_CORTE",
    physical_status: "NO_APLICA_ACTUAL",
  },
  {
    external_system_id: "EXT-SYS-017",
    system: "WhatsApp",
    inbound_surface: "sin proveedor/API/binding acreditados",
    decision: "NO_APLICA_EN_CORTE",
    physical_status: "NO_APLICA_ACTUAL",
  },
  {
    external_system_id: "EXT-SYS-018",
    system: "Instagram / perfiles sociales",
    inbound_surface: "sin API/binding acreditados",
    decision: "NO_APLICA_EN_CORTE",
    physical_status: "NO_APLICA_ACTUAL",
  },
  {
    external_system_id: "EXT-SYS-019",
    system: "Correo corporativo y alias funcionales",
    inbound_surface: "proveedor e integración API no acreditados",
    decision: "NO_APLICA_EN_CORTE",
    physical_status: "NO_APLICA_ACTUAL",
  },
  {
    external_system_id: "EXT-SYS-020",
    system: "Telefonía / canal de voz",
    inbound_surface: "operador e integración no acreditados",
    decision: "NO_APLICA_EN_CORTE",
    physical_status: "BLOQUEADO",
  },
  {
    external_system_id: "EXT-SYS-021",
    system: "Transporte externo",
    inbound_surface: "proveedor e interfaz no acreditados",
    decision: "NO_APLICA_EN_CORTE",
    physical_status: "NO_APLICA_ACTUAL",
  },
] as const satisfies readonly {
  readonly external_system_id: string;
  readonly system: string;
  readonly inbound_surface: string;
  readonly decision: ExternalReceivedEventApplicabilityDecision;
  readonly physical_status: ExternalReceivedEventPhysicalStatus;
}[];

export const EXTERNAL_RECEIVED_EVENT_COVERAGE = {
  external_system_decision_count: 21,
  accredited_inbound_event_count: 2,
  without_accredited_inbound_event_count: 19,
  not_applicable_in_cut_count: 18,
  not_applicable_to_event_in_cut_count: 1,
  defined_not_materialized_count: 2,
  not_applicable_physical_count: 9,
  not_applicable_current_physical_count: 8,
  blocked_physical_count: 2,
  materialized_runtime_event_count: 0,
  created_endpoint_count: 0,
  created_receipt_record_count: 0,
  created_secret_count: 0,
  supabase_change_count: 0,
} as const;

export const EXTERNAL_RECEIVED_EVENT_CONTRACT_METADATA = {
  logical_namespace: "@vento/contracts/integrations",
  contract_task_id: "SHELL-CON-019",
  principal_contract_task_id: "SHELL-CON-017",
  credential_reference_task_id: "SHELL-CON-018",
  mapping_contract_task_id: "SHELL-CON-022",
  idempotency_contract_task_id: "SHELL-CON-023",
  disposition_contract_task_id: "SHELL-CON-024",
  next_contract_task_id: "SHELL-CON-020",
  execution_gate: "PRE_E5_FOUNDATION",
  physical_mode: "GLOBAL_ENABLE_ONCE",
  public_export_published: false,
  runtime_endpoint_materialized: false,
  receipt_persistence_materialized: false,
  source_payload_storage_materialized: false,
  secret_materialized: false,
  supabase_changed: false,
} as const;

export type ExternalReceivedEventBoundaryPolicy =
  typeof EXTERNAL_RECEIVED_EVENT_BOUNDARY_POLICY;

export type ExternalReceivedEventIdentityPolicy =
  typeof EXTERNAL_RECEIVED_EVENT_IDENTITY_POLICY;

export type ExternalReceivedEventAuthenticityPolicy =
  typeof EXTERNAL_RECEIVED_EVENT_AUTHENTICITY_POLICY;

export type ExternalReceivedEventEvidencePolicy =
  typeof EXTERNAL_RECEIVED_EVENT_EVIDENCE_POLICY;

export type ExternalReceivedEventNormalizationPolicy =
  typeof EXTERNAL_RECEIVED_EVENT_NORMALIZATION_POLICY;

export type ExternalReceivedEventReferencePolicy =
  typeof EXTERNAL_RECEIVED_EVENT_REFERENCE_POLICY;

export type ExternalReceivedEventTemporalPolicy =
  typeof EXTERNAL_RECEIVED_EVENT_TEMPORAL_POLICY;

export type ExternalReceivedEventCoverage =
  typeof EXTERNAL_RECEIVED_EVENT_COVERAGE;

export type ExternalReceivedEventContractMetadata =
  typeof EXTERNAL_RECEIVED_EVENT_CONTRACT_METADATA;
