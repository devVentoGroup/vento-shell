import crypto from 'node:crypto';
import fs from 'node:fs';
import path from 'node:path';
import { fileURLToPath } from 'node:url';

const currentFile = fileURLToPath(import.meta.url);
const scriptDirectory = path.dirname(currentFile);
const integrationsRoot = path.resolve(scriptDirectory, '..');
const repositoryRoot = path.resolve(integrationsRoot, '../../..');

const shellContractSourcePath = path.join(
  repositoryRoot,
  'docs',
  'plan-canonico',
  'modular',
  'bloques',
  'H_FUNDACION_COMPARTIDA',
  '01_CONTRATOS_DE_INTEGRACIONES_EXTERNAS.md',
);
const externalReceivedEventContractPath = path.join(
  integrationsRoot,
  'generated',
  'external-received-event.contract.ts',
);
const canonicalSaleLineContractPath = path.join(
  integrationsRoot,
  'generated',
  'canonical-sale-line.contract.ts',
);
const externalIdentifierMappingContractPath = path.join(
  integrationsRoot,
  'generated',
  'external-identifier-mapping.contract.ts',
);

const shellCon019SourceContractSha256 =
  '0faeb8d65edcf9b5806c6c962aefb76ab9cfd13e434d43cb549d559cd5cbaed1';
const shellCon021SourceContractSha256 =
  'f4ac39874bfa4864973cdf52f63c2519f03cdbf1519afca93a1cb6dcc6fdf802';
const shellCon022SourceContractSha256 =
  '89fbd1be5e68ec81239097376a1656eb4722ad6f38f55b1b76bb1f3dd469f474';

const identifierClasses = Object.freeze([
  'EXTERNAL_OBJECT_ID',
  'CANONICAL_VENTO_ID',
  'PROPAGATED_CANONICAL_ID',
  'EXTERNAL_ROUTING_REF',
  'IDEMPOTENCY_REF',
  'CORRELATION_REF',
  'DISPLAY_SEARCH_ATTRIBUTE',
  'TECHNICAL_NAMESPACE_ID',
  'EXTERNAL_ALIAS',
  'MAPPING_RECORD',
]);

const relationKinds = Object.freeze([
  'EXTERNAL_TO_CANONICAL',
  'CANONICAL_PROPAGATED_EXTERNAL',
  'EXTERNAL_ROUTE_TO_OWNER',
  'EXTERNAL_EVENT_TO_RECEIPT',
  'EXTERNAL_NAMESPACE_BINDING',
  'CORRELATION_ONLY',
  'NO_EQUIVALENCE',
]);

const mappingStates = Object.freeze([
  'RESOLVED',
  'PARTIALLY_RESOLVED',
  'UNRESOLVED',
  'AMBIGUOUS',
  'CONFLICT',
  'RETIRED',
  'NOT_APPLICABLE',
  'BLOCKED',
]);

const externalSystems = Object.freeze([
  ['EXT-SYS-001', 'Supabase', 'Infrastructure only; no global business mapping is created.'],
  ['EXT-SYS-002', 'Wompi', 'Typed transaction, propagated canonical and event-to-receipt relationships are admissible; reference remains separate.'],
  ['EXT-SYS-003', 'RevenueCat', 'Typed platform/store and propagated canonical relationships are admissible; aliases do not imply VENTO identity.'],
  ['EXT-SYS-004', 'Resend', 'Provider message IDs are not fabricated and email remains an address or attribute.'],
  ['EXT-SYS-005', 'Expo / EAS Update', 'Project, channel, profile and runtime identifiers remain technical references without universal business mapping.'],
  ['EXT-SYS-006', 'Expo Push Service', 'Push token is a routing reference and never an employee identity.'],
  ['EXT-SYS-007', 'Sentry', 'Observability references remain technical or correlational without accredited business mapping.'],
  ['EXT-SYS-008', 'Google Maps / Google Reviews', 'place_id remains external; durable association with VENTO requires explicit mapping.'],
  ['EXT-SYS-009', 'Apple Wallet / PassKit y APNs', 'Serial, pass type, device library identifier, push token and canonical owner remain separate planes.'],
  ['EXT-SYS-010', 'Vercel', 'Project, deployment and domain remain technical references without universal business equivalence.'],
  ['EXT-SYS-011', 'Zebra BrowserPrint', 'device.uid requires an accredited relationship with canonical printer identity before durable binding.'],
  ['EXT-SYS-012', 'Google Wallet / Google Pay & Wallet', 'Remote IDs remain unmapped until binding and related resource are accredited.'],
  ['EXT-SYS-013', 'POS externo vigente', 'Consumes INT-POS-010, INT-POS-011 and INT-POS-013; makos_excel row, hash, name or code do not fabricate sale or line identity.'],
  ['EXT-SYS-014', 'Shopify / comercio electronico', 'No mapping instances are created without authorized binding and accredited namespace.'],
  ['EXT-SYS-015', 'Rappi / marketplace', 'No order, store or courier mappings are created without real binding and contract.'],
  ['EXT-SYS-016', 'ManyChat / automatizacion conversacional', 'No subscriber, contact or flow mappings are created without accredited binding.'],
  ['EXT-SYS-017', 'WhatsApp', 'Phone, contact or conversation never become canonical person or case identity without provider, namespace and contract.'],
  ['EXT-SYS-018', 'Instagram / social', 'Handle, profile or message ID never become business identity without approved binding and relationship.'],
  ['EXT-SYS-019', 'Correo corporativo y alias funcionales', 'Mailbox, email or alias never equal canonical person, record or supplier by text coincidence.'],
  ['EXT-SYS-020', 'Telefonia / voz', 'Mapping remains blocked until TI-INT-003 accredits operator, account, interface, namespaces, IDs and semantics.'],
  ['EXT-SYS-021', 'Transporte externo', 'Tracking, guide, driver or shipment reference never become canonical output or delivery without accredited binding and contract.'],
]);

function fail(message) {
  throw new Error(message);
}

function sha256(source) {
  return crypto.createHash('sha256').update(source).digest('hex');
}

function normalizeEol(value) {
  return String(value)
    .replace(/^\uFEFF/u, '')
    .replace(/\r\n?/gu, '\n');
}

function readText(filePath, label) {
  if (!fs.existsSync(filePath)) {
    fail(`Missing ${label}: ${path.relative(process.cwd(), filePath)}`);
  }
  return normalizeEol(fs.readFileSync(filePath, 'utf8'));
}

function isFence(line) {
  return /^\s*```/u.test(line);
}

function extractTaskSection(source, taskId) {
  const lines = normalizeEol(source).split('\n');
  const taskHeading = /^###\s+(?<marker>\[[ x~]\]|[✅🟡❌])\s+(?<id>[A-Z][A-Z0-9]*(?:-[A-Z0-9]+)+-\d{3})\b(?:\s+[—-]\s+(?<title>[^\n]+))?$/u;
  const starts = [];
  let fenced = false;

  lines.forEach((line, index) => {
    if (isFence(line)) {
      fenced = !fenced;
      return;
    }
    if (fenced) return;
    const match = line.match(taskHeading);
    if (match) starts.push({ index, id: match.groups.id });
  });

  const taskIndex = starts.findIndex((entry) => entry.id === taskId);
  if (taskIndex < 0) fail(`Canonical task ${taskId} not found.`);
  const start = starts[taskIndex].index;
  const end = starts[taskIndex + 1]?.index ?? lines.length;
  return lines.slice(start, end).join('\n');
}

function assertIncludes(source, marker, label) {
  if (!source.includes(marker)) fail(`${label} is missing required content: ${marker}`);
}

function validateReconciliation(shellSource) {
  const markers = [
    '<!-- EXECUTION-GATE-RECONCILIATION:B001-200:SHELL-CON-017-024 -->',
    '`GLOBAL_ENABLE_ONCE`',
    '`PRE_E5_FOUNDATION`',
    '`<task_id>::GLOBAL`',
  ];
  for (const marker of markers) assertIncludes(shellSource, marker, 'SHELL-CON reconciliation');
}

function validateShellCon022(shellSource) {
  const task = extractTaskSection(shellSource, 'SHELL-CON-022');
  const actualHash = sha256(task);
  if (actualHash !== shellCon022SourceContractSha256) {
    fail(
      `SHELL-CON-022 source contract SHA256 mismatch: expected ${shellCon022SourceContractSha256}, received ${actualHash}.`,
    );
  }

  const required = [
    '@vento/contracts/integrations',
    'ExternalIdentifierMappingId',
    'ExternalIdentifierRef',
    'ExternalIdentifierMapping',
    'ExternalIdentifierMappingRef',
    'ExternalIdentifierClass',
    'ExternalIdentifierRelationKind',
    'ExternalIdentifierMappingState',
    'ExternalReceivedEvent.mapping_refs[]',
    'CanonicalSaleLine.mapping_refs[]',
    'INT-EXT-013',
    'INT-POS-010',
    'INT-POS-011',
    'INT-POS-013',
    'INT-DB-004',
    'SHELL-CON-023',
    'SHELL-CON-024',
    'EXTERNAL_OBJECT_ID',
    'CANONICAL_VENTO_ID',
    'PROPAGATED_CANONICAL_ID',
    'EXTERNAL_ROUTING_REF',
    'IDEMPOTENCY_REF',
    'CORRELATION_REF',
    'DISPLAY_SEARCH_ATTRIBUTE',
    'TECHNICAL_NAMESPACE_ID',
    'EXTERNAL_ALIAS',
    'MAPPING_RECORD',
    'EXTERNAL_TO_CANONICAL',
    'CANONICAL_PROPAGATED_EXTERNAL',
    'EXTERNAL_ROUTE_TO_OWNER',
    'EXTERNAL_EVENT_TO_RECEIPT',
    'EXTERNAL_NAMESPACE_BINDING',
    'CORRELATION_ONLY',
    'NO_EQUIVALENCE',
    'PARTIALLY_RESOLVED',
    'UNRESOLVED',
    'AMBIGUOUS',
    'CONFLICT',
    'RETIRED',
    'NOT_APPLICABLE',
    'BLOCKED',
    'NO GENERA REQUISITOS DE PRUEBA',
  ];
  for (const marker of required) assertIncludes(task, marker, 'SHELL-CON-022');

  for (let index = 1; index <= 21; index += 1) {
    assertIncludes(task, `EXT-SYS-${String(index).padStart(3, '0')}`, 'SHELL-CON-022 EXT-SYS coverage');
  }

  return task;
}

function validateDependencies(eventSource, lineSource) {
  const eventMarkers = [
    'Contract task: SHELL-CON-019',
    `Source contract SHA256: ${shellCon019SourceContractSha256}`,
    'export interface ExternalReceivedEvent<TNormalizedAssertion>',
    'readonly mapping_refs: readonly string[];',
    'mapping_contract_task_id: "SHELL-CON-022"',
  ];
  for (const marker of eventMarkers) assertIncludes(eventSource, marker, 'SHELL-CON-019 dependency');

  const lineMarkers = [
    'Contract task: SHELL-CON-021',
    `Source contract SHA256: ${shellCon021SourceContractSha256}`,
    'export interface CanonicalSaleLine',
    'readonly mapping_refs: readonly string[];',
    'mapping_contract_task_id: "SHELL-CON-022"',
    'next_contract_task_id: "SHELL-CON-022"',
  ];
  for (const marker of lineMarkers) assertIncludes(lineSource, marker, 'SHELL-CON-021 dependency');
}

function renderStringArray(name, values) {
  const rows = values.map((value) => `  ${JSON.stringify(value)},`).join('\n');
  return `export const ${name} = [\n${rows}\n] as const;`;
}

function renderAdoptionRows() {
  return externalSystems.map(([externalSystemId, system, decisionSummary]) => `  {\n    external_system_id: ${JSON.stringify(externalSystemId)},\n    system: ${JSON.stringify(system)},\n    decision_summary: ${JSON.stringify(decisionSummary)},\n    materialized_mapping_count: 0,\n  },`).join('\n');
}

function renderExternalIdentifierMappingContract() {
  return `// GENERATED FILE. DO NOT EDIT.\n// Semantic owners: INT-EXT-013, INT-POS-010, INT-POS-011, INT-POS-013\n// Contract task: SHELL-CON-022\n// Foundation task: SHELL-CON-001\n// External received event task: SHELL-CON-019\n// Canonical sale line task: SHELL-CON-021\n// Physical persistence owner: INT-DB-004\n// Source contract SHA256: ${shellCon022SourceContractSha256}\n\nimport type { VentoCredentialEnvironment } from "./external-credential-ref.contract.js";\n\ndeclare const externalIdentifierMappingIdBrand: unique symbol;\n\nexport type ExternalIdentifierMappingId =\n  string & {\n    readonly [externalIdentifierMappingIdBrand]: "ExternalIdentifierMappingId";\n  };\n\n${renderStringArray('EXTERNAL_IDENTIFIER_CLASSES', identifierClasses)}\n\nexport type ExternalIdentifierClass =\n  typeof EXTERNAL_IDENTIFIER_CLASSES[number];\n\n${renderStringArray('EXTERNAL_IDENTIFIER_RELATION_KINDS', relationKinds)}\n\nexport type ExternalIdentifierRelationKind =\n  typeof EXTERNAL_IDENTIFIER_RELATION_KINDS[number];\n\n${renderStringArray('EXTERNAL_IDENTIFIER_MAPPING_STATES', mappingStates)}\n\nexport type ExternalIdentifierMappingState =\n  typeof EXTERNAL_IDENTIFIER_MAPPING_STATES[number];\n\nexport interface ExternalIdentifierRef {\n  readonly external_system_id: string;\n  readonly environment: VentoCredentialEnvironment;\n  readonly surface: string;\n  readonly external_namespace: string;\n  readonly external_id_class: ExternalIdentifierClass;\n  readonly external_id_kind: string;\n  readonly external_id_value: string;\n}\n\nexport type ExternalIdentifierMappingRef = Readonly<{\n  readonly mapping_id: ExternalIdentifierMappingId;\n  readonly contract_version: string;\n}>;\n\nexport interface ExternalIdentifierMapping {\n  readonly mapping_id: ExternalIdentifierMappingId;\n  readonly contract_version: string;\n  readonly external_ref: ExternalIdentifierRef;\n  readonly relation_kind: ExternalIdentifierRelationKind;\n  readonly canonical_resource_type: string | null;\n  readonly canonical_id: string | null;\n  readonly mapping_state: ExternalIdentifierMappingState;\n  readonly resolution_detail: string | null;\n  readonly evidence_refs: readonly string[];\n  readonly correlation_refs: readonly string[];\n  readonly valid_from: string | null;\n  readonly retired_at: string | null;\n  readonly predecessor_mapping_ref: ExternalIdentifierMappingRef | null;\n  readonly successor_mapping_ref: ExternalIdentifierMappingRef | null;\n}\n\nexport const EXTERNAL_IDENTIFIER_MAPPING_IDENTITY_POLICY = {\n  identity_name: "ExternalIdentifierMappingId",\n  semantics: "STABLE_OPAQUE_NON_SECRET_MAPPING_RELATION_IDENTITY",\n  serialization: "UNSPECIFIED",\n  syntax_pattern: null,\n  static_registry: false,\n  materialized_id_count: 0,\n  derive_from_external_id_value: false,\n  derive_from_canonical_id: false,\n  derive_from_credential: false,\n  is_external_identifier_ref: false,\n  is_canonical_sale_id: false,\n  is_canonical_sale_line_id: false,\n  is_integration_principal_id: false,\n  is_idempotency_key: false,\n  is_event_receipt_or_correlation_id: false,\n  incompatible_semantic_change_overwrites_history: false,\n} as const;\n\nexport const EXTERNAL_IDENTIFIER_REFERENCE_POLICY = {\n  minimum_namespace_dimensions: [\n    "external_system_id",\n    "environment",\n    "surface",\n    "external_namespace",\n    "external_id_kind",\n  ],\n  environment_is_part_of_identity_scope: true,\n  surface_is_part_of_identity_scope: true,\n  same_text_across_namespaces_implies_same_object: false,\n  technical_namespace_is_business_resource: false,\n  inverse_resolution_implies_unique_external_source: false,\n  contains_secret_material: false,\n} as const;\n\nexport const EXTERNAL_IDENTIFIER_NORMALIZATION_POLICY = {\n  unconditional_trim_allowed: false,\n  unconditional_case_folding_allowed: false,\n  unconditional_prefix_removal_allowed: false,\n  unconditional_numeric_conversion_allowed: false,\n  unconditional_uuid_canonicalization_allowed: false,\n  namespace_contract_may_authorize_deterministic_normalization: true,\n  normalization_may_merge_semantically_distinct_values: false,\n  provenance_must_remain_reconstructible: true,\n} as const;\n\nexport const EXTERNAL_IDENTIFIER_RELATION_POLICY = {\n  correlation_only_promotes_to_exact_identity_without_new_evidence: false,\n  no_equivalence_is_explicit_decision: true,\n  relation_kind_grants_permission: false,\n  relation_kind_grants_business_ownership: false,\n  material_relation_change_requires_successor: true,\n  canonical_target_required_for_exact_relationship: true,\n  canonical_target_required_for_no_equivalence: false,\n  canonical_target_required_for_not_applicable: false,\n  canonical_target_required_for_blocked: false,\n} as const;\n\nexport const EXTERNAL_IDENTIFIER_MAPPING_STATE_POLICY = {\n  unresolved_degrades_to_resolved_silently: false,\n  ambiguous_degrades_to_resolved_silently: false,\n  conflict_degrades_to_resolved_silently: false,\n  blocked_degrades_to_resolved_silently: false,\n  not_applicable_is_null: false,\n  partially_resolved_authorizes_missing_dimensions: false,\n  retired_releases_history_for_reinterpretation: false,\n  state_is_business_resource_state: false,\n} as const;\n\nexport const EXTERNAL_IDENTIFIER_POS_STATE_PROJECTION = [\n  { owner_state: "RESOLVED", shared_state: "RESOLVED", automatic_equivalence: true },\n  { owner_state: "NOT_APPLICABLE", shared_state: "NOT_APPLICABLE", automatic_equivalence: true },\n  { owner_state: "AMBIGUOUS", shared_state: "AMBIGUOUS", automatic_equivalence: true },\n  { owner_state: "CONFLICT", shared_state: "CONFLICT", automatic_equivalence: true },\n  { owner_state: "PENDING_EVIDENCE", shared_state: "UNRESOLVED", automatic_equivalence: false },\n  { owner_state: "NOT_PROVIDED", shared_state: "UNRESOLVED", automatic_equivalence: false },\n  { owner_state: "INACTIVE", shared_state: "RETIRED", automatic_equivalence: false },\n] as const;\n\nexport const EXTERNAL_IDENTIFIER_CARDINALITY_POLICY = {\n  active_exact_external_to_canonical_max_targets_per_namespace: 1,\n  multiple_external_refs_may_target_same_canonical_resource: true,\n  multiple_technical_routes_imply_multiple_business_identities: false,\n  many_to_many_requires_explicit_owner_contract: true,\n  current_data_counts_define_cardinality: false,\n  absence_of_observed_duplicates_proves_one_to_one: false,\n  reassigned_external_id_requires_retirement_and_successor: true,\n  same_namespace_collision_result: "CONFLICT",\n} as const;\n\nexport const EXTERNAL_IDENTIFIER_HEURISTIC_POLICY = {\n  matching_uuid_text_is_sufficient: false,\n  email_is_sufficient: false,\n  phone_is_sufficient: false,\n  name_or_legal_name_is_sufficient: false,\n  display_name_is_sufficient: false,\n  address_is_sufficient: false,\n  coordinates_are_sufficient: false,\n  alias_is_sufficient: false,\n  state_is_sufficient: false,\n  amount_or_currency_is_sufficient: false,\n  timestamp_is_sufficient: false,\n  ip_is_sufficient: false,\n  product_name_code_or_category_is_sufficient: false,\n  file_position_or_source_row_number_is_sufficient: false,\n  file_or_payload_hash_is_sufficient: false,\n  visible_uid_without_namespace_is_sufficient: false,\n  reference_from_other_integration_is_sufficient: false,\n  payload_shape_similarity_is_sufficient: false,\n} as const;\n\nexport const EXTERNAL_IDENTIFIER_PROPAGATED_CANONICAL_POLICY = {\n  class_name: "PROPAGATED_CANONICAL_ID",\n  validate_expected_resource_type: true,\n  validate_environment: true,\n  validate_surface_contract_and_owner: true,\n  uuid_shape_proves_vento_origin: false,\n  external_provider_acquires_identifier_ownership: false,\n  contradiction_with_authenticated_external_identifier_result: "CONFLICT",\n  message_authenticity_validated_independently: true,\n  resource_authorization_revalidated_independently: true,\n  returned_value_reclassified_as_external_object_id: false,\n} as const;\n\nexport const EXTERNAL_IDENTIFIER_EVIDENCE_POLICY = {\n  exact_relationship_requires_reconstructible_evidence: true,\n  evidence_by_reference: true,\n  protected_source_reference_preferred_over_payload_copy: true,\n  full_payload_is_mapping_identity: false,\n  payload_hash_replaces_relationship: false,\n  correlation_creates_identity_equivalence: false,\n  loss_of_sufficient_evidence_may_require_reconciliation: true,\n  secrets_or_credentials_embedded_as_evidence: false,\n} as const;\n\nexport const EXTERNAL_IDENTIFIER_LIFECYCLE_POLICY = {\n  historical_relation_overwritten_for_new_target: false,\n  reassignment_requires_successor_relation: true,\n  canonical_resource_merge_executed_by_mapping: false,\n  canonical_resource_split_distributes_aliases_heuristically: false,\n  incompatible_namespace_or_semantic_change_requires_new_relation: true,\n  historical_resolution_uses_owner_defined_applicable_time: true,\n  received_at_used_by_convenience_for_historical_resolution: false,\n  retirement_deletes_historical_references: false,\n  contract_version_is_mapping_successor_identity: false,\n} as const;\n\nexport const EXTERNAL_IDENTIFIER_EVENT_COMPATIBILITY_POLICY = {\n  external_received_event_contract_task_id: "SHELL-CON-019",\n  current_mapping_refs_storage: "GENERIC_STRING_REFERENCES",\n  typed_target_ref: "ExternalIdentifierMappingRef",\n  consumer_migration_materialized_here: false,\n  event_may_exist_with_zero_resolved_mappings: true,\n  mapping_refs_may_contain_heuristic_candidates: false,\n  external_event_id_is_mapping_id: false,\n  receipt_id_is_mapping_id: false,\n  unresolved_mapping_may_preserve_received_evidence: true,\n  unresolved_mapping_enables_identity_dependent_effect: false,\n} as const;\n\nexport const EXTERNAL_IDENTIFIER_SALE_LINE_COMPATIBILITY_POLICY = {\n  canonical_sale_line_contract_task_id: "SHELL-CON-021",\n  current_mapping_refs_storage: "GENERIC_STRING_REFERENCES",\n  typed_target_ref: "ExternalIdentifierMappingRef",\n  consumer_migration_materialized_here: false,\n  mapping_change_reidentifies_sale_line: false,\n  later_presentation_or_recipe_resolution_creates_new_line: false,\n  product_presentation_recipe_remain_owner_domain_refs: true,\n  mapping_ref_explains_resolution_without_replacing_resolved_resource: true,\n  structural_line_may_exist_with_pending_mapping: true,\n  source_row_number_is_external_line_id: false,\n  makos_excel_gains_individual_granularity_from_mapping: false,\n} as const;\n\nexport const EXTERNAL_IDENTIFIER_IDEMPOTENCY_BOUNDARY = {\n  mapping_id_is_idempotency_key: false,\n  external_id_value_is_idempotency_key_by_default: false,\n  idempotency_ref_may_exist_without_business_resource_identity: true,\n  resolved_mapping_proves_operation_is_new: false,\n  redelivery_identity_preserved_after_mapping_resolution: true,\n  mapping_revision_authorizes_repeat_effect: false,\n  idempotency_contract_task_id: "SHELL-CON-023",\n} as const;\n\nexport const EXTERNAL_IDENTIFIER_AUTHORITY_BOUNDARY = {\n  authenticity_implies_mapping_resolved: false,\n  resolved_mapping_implies_authorization: false,\n  integration_principal_implies_resource_equivalence: false,\n  external_credential_implies_business_authority: false,\n  owner_domain_revalidates_resource_existence_state_and_use: true,\n  contracts_package_executes_business_effect: false,\n} as const;\n\nexport const EXTERNAL_IDENTIFIER_FAILURE_POLICY = {\n  resolved_allows_only_subsequent_gates: true,\n  partially_resolved_allows_only_explicitly_resolved_dimensions: true,\n  unresolved_blocks_identity_dependent_effect: true,\n  ambiguous_blocks_identity_dependent_effect: true,\n  conflict_blocks_identity_dependent_effect: true,\n  blocked_prevents_fictitious_relation: true,\n  not_applicable_fabricates_resource: false,\n  retired_used_for_new_operations_outside_validity: false,\n  blocking_effect_requires_discarding_valid_evidence: false,\n  disposition_contract_task_id: "SHELL-CON-024",\n} as const;\n\nexport const EXTERNAL_IDENTIFIER_MAPPING_ADOPTION = [\n${renderAdoptionRows()}\n] as const;\n\nexport const EXTERNAL_IDENTIFIER_MAPPING_COVERAGE = {\n  expected_external_system_count: 21,\n  adopted_external_system_count: 21,\n  missing_external_system_count: 0,\n  duplicate_external_system_count: 0,\n  unique_external_system_id_count: 21,\n  materialized_mapping_id_count: 0,\n  materialized_operational_mapping_count: 0,\n} as const;\n\nexport const EXTERNAL_IDENTIFIER_INTEROPERABILITY_CASES = [\n  { case_id: "WOMPI_TRANSACTION", class: "EXTERNAL_OBJECT_ID", relation: "EXTERNAL_TO_CANONICAL" },\n  { case_id: "WOMPI_EVENT_RECEIPT", class: "EXTERNAL_OBJECT_ID", relation: "EXTERNAL_EVENT_TO_RECEIPT" },\n  { case_id: "REVENUECAT_PROPAGATED_APP_USER", class: "PROPAGATED_CANONICAL_ID", relation: "CANONICAL_PROPAGATED_EXTERNAL" },\n  { case_id: "EXPO_PUSH_TOKEN", class: "EXTERNAL_ROUTING_REF", relation: "EXTERNAL_ROUTE_TO_OWNER" },\n  { case_id: "GOOGLE_PLACE_ID_WITHOUT_DURABLE_ASSOCIATION", class: "EXTERNAL_OBJECT_ID", relation: "NO_EQUIVALENCE_OR_CORRELATION_ONLY" },\n  { case_id: "PASSKIT_DEVICE_LIBRARY_IDENTIFIER", class: "EXTERNAL_OBJECT_ID", relation: "NO_USER_ID_EQUIVALENCE" },\n  { case_id: "PASSKIT_PUSH_TOKEN", class: "EXTERNAL_ROUTING_REF", relation: "NO_USER_OR_PASS_ID_EQUIVALENCE" },\n  { case_id: "ZEBRA_DEVICE_UID", class: "EXTERNAL_OBJECT_ID", relation: "EXTERNAL_TO_CANONICAL_AFTER_ACCREDITATION" },\n  { case_id: "POS_SOURCE_ROW_NUMBER", class: "DISPLAY_SEARCH_ATTRIBUTE", relation: "NOT_ELIGIBLE_AS_EXTERNAL_LINE_ID" },\n  { case_id: "DISPLAY_EMAIL_PHONE_NAME", class: "DISPLAY_SEARCH_ATTRIBUTE", relation: "NO_EXACT_MAPPING_BY_ITSELF" },\n] as const;\n\nexport const EXTERNAL_IDENTIFIER_SECURITY_POLICY = {\n  api_key_allowed: false,\n  client_secret_allowed: false,\n  password_allowed: false,\n  access_token_allowed: false,\n  refresh_token_allowed: false,\n  private_key_allowed: false,\n  service_role_key_allowed: false,\n  provider_credential_allowed: false,\n  persistent_signed_url_allowed: false,\n  full_source_payload_allowed_by_default: false,\n  mapping_id_grants_canonical_resource_read: false,\n  canonical_id_grants_provider_access: false,\n} as const;\n\nexport const EXTERNAL_IDENTIFIER_OWNERSHIP_POLICY = {\n  shared_contract_owns_mapping_shape_only: true,\n  owner_domain_retains_canonical_identifier_semantics: true,\n  external_provider_owns_vento_resource: false,\n  adapter_resolution_grants_functional_ownership: false,\n  physical_persistence_owner_task_id: "INT-DB-004",\n  consumer_local_incompatible_redefinition_allowed_after_publication: false,\n} as const;\n\nexport const EXTERNAL_IDENTIFIER_MAPPING_CONTRACT_METADATA = {\n  logical_namespace: "@vento/contracts/integrations",\n  contract_task_id: "SHELL-CON-022",\n  semantic_owner_task_ids: ["INT-EXT-013", "INT-POS-010", "INT-POS-011", "INT-POS-013"],\n  external_received_event_contract_task_id: "SHELL-CON-019",\n  canonical_sale_contract_task_id: "SHELL-CON-020",\n  canonical_sale_line_contract_task_id: "SHELL-CON-021",\n  physical_persistence_owner_task_id: "INT-DB-004",\n  idempotency_contract_task_id: "SHELL-CON-023",\n  disposition_contract_task_id: "SHELL-CON-024",\n  next_contract_task_id: "SHELL-CON-023",\n  execution_gate: "PRE_E5_FOUNDATION",\n  physical_mode: "GLOBAL_ENABLE_ONCE",\n  public_export_published: false,\n  package_root_index_extended: false,\n  consumer_adoption_materialized: false,\n  runtime_resolution_materialized: false,\n  persistence_materialized: false,\n  cache_materialized: false,\n  endpoint_materialized: false,\n  rpc_materialized: false,\n  migration_materialized: false,\n  supabase_changed: false,\n  materialized_mapping_id_count: 0,\n  materialized_operational_mapping_count: 0,\n} as const;\n\nexport type ExternalIdentifierMappingIdentityPolicy = typeof EXTERNAL_IDENTIFIER_MAPPING_IDENTITY_POLICY;\nexport type ExternalIdentifierReferencePolicy = typeof EXTERNAL_IDENTIFIER_REFERENCE_POLICY;\nexport type ExternalIdentifierNormalizationPolicy = typeof EXTERNAL_IDENTIFIER_NORMALIZATION_POLICY;\nexport type ExternalIdentifierRelationPolicy = typeof EXTERNAL_IDENTIFIER_RELATION_POLICY;\nexport type ExternalIdentifierMappingStatePolicy = typeof EXTERNAL_IDENTIFIER_MAPPING_STATE_POLICY;\nexport type ExternalIdentifierCardinalityPolicy = typeof EXTERNAL_IDENTIFIER_CARDINALITY_POLICY;\nexport type ExternalIdentifierHeuristicPolicy = typeof EXTERNAL_IDENTIFIER_HEURISTIC_POLICY;\nexport type ExternalIdentifierPropagatedCanonicalPolicy = typeof EXTERNAL_IDENTIFIER_PROPAGATED_CANONICAL_POLICY;\nexport type ExternalIdentifierEvidencePolicy = typeof EXTERNAL_IDENTIFIER_EVIDENCE_POLICY;\nexport type ExternalIdentifierLifecyclePolicy = typeof EXTERNAL_IDENTIFIER_LIFECYCLE_POLICY;\nexport type ExternalIdentifierEventCompatibilityPolicy = typeof EXTERNAL_IDENTIFIER_EVENT_COMPATIBILITY_POLICY;\nexport type ExternalIdentifierSaleLineCompatibilityPolicy = typeof EXTERNAL_IDENTIFIER_SALE_LINE_COMPATIBILITY_POLICY;\nexport type ExternalIdentifierIdempotencyBoundary = typeof EXTERNAL_IDENTIFIER_IDEMPOTENCY_BOUNDARY;\nexport type ExternalIdentifierAuthorityBoundary = typeof EXTERNAL_IDENTIFIER_AUTHORITY_BOUNDARY;\nexport type ExternalIdentifierFailurePolicy = typeof EXTERNAL_IDENTIFIER_FAILURE_POLICY;\nexport type ExternalIdentifierSecurityPolicy = typeof EXTERNAL_IDENTIFIER_SECURITY_POLICY;\nexport type ExternalIdentifierOwnershipPolicy = typeof EXTERNAL_IDENTIFIER_OWNERSHIP_POLICY;\nexport type ExternalIdentifierMappingContractMetadata = typeof EXTERNAL_IDENTIFIER_MAPPING_CONTRACT_METADATA;\n`;
}

function writeOrCheck(filePath, content, checkOnly, label) {
  const expected = normalizeEol(content);
  const exists = fs.existsSync(filePath);
  const current = exists ? normalizeEol(fs.readFileSync(filePath, 'utf8')) : null;

  if (checkOnly) {
    if (!exists) fail(`${label} is missing.`);
    if (current !== expected) fail(`${label} is stale.`);
    return 'FRESH';
  }

  fs.mkdirSync(path.dirname(filePath), { recursive: true });
  if (current === expected) return 'FRESH';
  fs.writeFileSync(filePath, expected, 'utf8');
  return exists ? 'UPDATED' : 'CREATED';
}

export function generateExternalIdentifierMappingContract({ checkOnly = false } = {}) {
  const shellSource = readText(shellContractSourcePath, 'SHELL-CON owner source');
  const eventSource = readText(externalReceivedEventContractPath, 'external received event contract');
  const lineSource = readText(canonicalSaleLineContractPath, 'canonical sale line contract');

  validateReconciliation(shellSource);
  validateShellCon022(shellSource);
  validateDependencies(eventSource, lineSource);

  const content = renderExternalIdentifierMappingContract();
  const status = writeOrCheck(
    externalIdentifierMappingContractPath,
    content,
    checkOnly,
    'external identifier mapping contract',
  );

  return Object.freeze({
    status,
    identifierClassCount: identifierClasses.length,
    relationKindCount: relationKinds.length,
    mappingStateCount: mappingStates.length,
    externalSystemCount: externalSystems.length,
    materializedMappingIds: 0,
    materializedOperationalMappings: 0,
  });
}

function runCli() {
  try {
    const unknownArgs = process.argv.slice(2).filter((arg) => arg !== '--check');
    if (unknownArgs.length > 0) fail(`Unknown arguments: ${unknownArgs.join(', ')}`);
    const checkOnly = process.argv.includes('--check');
    const result = generateExternalIdentifierMappingContract({ checkOnly });

    console.log('[VENTO CONTRACTS] EXTERNAL IDENTIFIER MAPPING GENERATION PASS');
    console.log(`[VENTO CONTRACTS] MODE ${checkOnly ? 'CHECK' : 'WRITE'}`);
    console.log(`[VENTO CONTRACTS] STATUS ${result.status}`);
    console.log(`[VENTO CONTRACTS] IDENTIFIER_CLASSES ${result.identifierClassCount}`);
    console.log(`[VENTO CONTRACTS] RELATION_KINDS ${result.relationKindCount}`);
    console.log(`[VENTO CONTRACTS] MAPPING_STATES ${result.mappingStateCount}`);
    console.log(`[VENTO CONTRACTS] EXTERNAL_SYSTEMS ${result.externalSystemCount}`);
    console.log('');
    console.log('=== RESULTADO PARA CHATGPT ===');
    console.log('ESTADO: PASS');
    console.log('OPERACION: EXTERNAL_IDENTIFIER_MAPPING_CONTRACT_GENERATE');
    console.log(`MODE: ${checkOnly ? 'CHECK' : 'WRITE'}`);
    console.log(`CONTRACT_STATUS: ${result.status}`);
    console.log(`IDENTIFIER_CLASSES: ${result.identifierClassCount}`);
    console.log(`RELATION_KINDS: ${result.relationKindCount}`);
    console.log(`MAPPING_STATES: ${result.mappingStateCount}`);
    console.log(`EXTERNAL_SYSTEMS: ${result.externalSystemCount}`);
    console.log(`MATERIALIZED_MAPPING_IDS: ${result.materializedMappingIds}`);
    console.log(`MATERIALIZED_OPERATIONAL_MAPPINGS: ${result.materializedOperationalMappings}`);
    console.log('=== FIN RESULTADO PARA CHATGPT ===');
  } catch (error) {
    const message = error instanceof Error ? error.message : String(error);
    console.error('[VENTO CONTRACTS] EXTERNAL IDENTIFIER MAPPING GENERATION FAIL');
    console.error(message);
    console.error('');
    console.error('=== RESULTADO PARA CHATGPT ===');
    console.error('ESTADO: FAIL');
    console.error('OPERACION: EXTERNAL_IDENTIFIER_MAPPING_CONTRACT_GENERATE');
    console.error(`ERROR: ${message}`);
    console.error('=== FIN RESULTADO PARA CHATGPT ===');
    process.exitCode = 1;
  }
}

if (process.argv[1] && path.resolve(process.argv[1]) === currentFile) runCli();
