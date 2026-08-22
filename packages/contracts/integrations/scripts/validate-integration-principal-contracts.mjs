import fs from 'node:fs';
import path from 'node:path';
import { fileURLToPath } from 'node:url';

import {
  generateIntegrationPrincipalContracts,
} from './generate-integration-principal-contracts.mjs';

const currentFile = fileURLToPath(import.meta.url);
const scriptDirectory = path.dirname(currentFile);
const integrationsRoot = path.resolve(scriptDirectory, '..');
const contractsRoot = path.resolve(integrationsRoot, '..');

const principalContractPath = path.join(
  integrationsRoot,
  'generated',
  'integration-principal.contract.ts',
);
const credentialContractPath = path.join(
  integrationsRoot,
  'generated',
  'external-credential-ref.contract.ts',
);
const externalReceivedEventContractPath = path.join(
  integrationsRoot,
  'generated',
  'external-received-event.contract.ts',
);
const indexPath = path.join(
  integrationsRoot,
  'generated',
  'index.ts',
);
const integrationsReadmePath = path.join(integrationsRoot, 'README.md');
const contractsReadmePath = path.join(contractsRoot, 'README.md');
const packageJsonPath = path.join(contractsRoot, 'package.json');

function fail(message) {
  throw new Error(message);
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

function assertIncludes(source, expected, label) {
  if (!source.includes(expected)) {
    fail(`${label} is missing required content: ${expected}`);
  }
}

function assertDoesNotMatch(source, pattern, label, forbiddenLabel) {
  if (pattern.test(source)) {
    fail(`${label} contains forbidden content: ${forbiddenLabel}`);
  }
}

function validateGeneratedPrincipalContract(contractSource) {
  const requiredMarkers = [
    'Semantic owner: INT-EXT-002',
    'Contract task: SHELL-CON-017',
    'export type IntegrationPrincipalId',
    'export interface IntegrationPrincipal',
    'export type IntegrationPrincipalRef',
    'system_service_may_represent_execution: true',
    'not_every_system_service_is_external_integration: true',
    'principal_context_identity_equivalence: false',
    'service_role_is_principal: false',
    'business_authority_implied: false',
    'basis: "MATERIAL_INTEGRATION_BOUNDARY"',
    'binding_requires_explicit_principal_before_operation: true',
    'generic_reuse_across_independent_integrations: false',
    'provider_name_implies_single_principal: false',
    'credential_rotation_creates_new_principal: false',
    'boundary_or_purpose_change_requires_reevaluation: true',
    'unresolved_principal: "FAIL_CLOSED"',
    'ambiguous_principal: "FAIL_CLOSED"',
    'wrong_boundary_principal: "FAIL_CLOSED"',
    'heuristic_assignment_allowed: false',
    'semantics: "STABLE_OPAQUE_NON_SECRET_TECHNICAL_IDENTITY"',
    'serialization: "UNSPECIFIED"',
    'syntax_pattern: null',
    'static_registry: false',
    'materialized_id_count: 0',
    'derive_from_external_system_id: false',
    'derive_from_credential: false',
    'derive_from_human_identity: false',
    'reuse_after_retirement: false',
    'external_system_decision_count: 21',
    'documentary_status: "ESPECIFICADO"',
    'documentary_decision_count: 21',
    'pending_physical_materialization_count: 11',
    'not_applicable_without_binding_count: 10',
    'materialized_principal_id_count: 0',
    'adoption_mode: "REFERENCE_NOT_DUPLICATED"',
    'logical_namespace: "@vento/contracts/integrations"',
    'credential_reference_task_id: "SHELL-CON-018"',
    'physical_registry_owner_task_id: "INT-DB-001"',
    'execution_gate: "PRE_E5_FOUNDATION"',
    'physical_mode: "GLOBAL_ENABLE_ONCE"',
    'public_export_published: false',
    'runtime_registry_materialized: false',
    'credential_materialized: false',
    'secret_materialized: false',
    'supabase_changed: false',
  ];

  for (const marker of requiredMarkers) {
    assertIncludes(contractSource, marker, 'integration principal contract');
  }

  const separatedIdentities = [
    'PrincipalContext.session_id',
    'PrincipalContext.auth_user_id',
    'PermissionKey',
    'provider_account_ref',
    'external_credential_id',
    'secret value',
    'endpoint_ref',
    'device_id',
    'external_system_id',
    'AppCode',
    'actor humano',
  ];

  for (const value of separatedIdentities) {
    assertIncludes(
      contractSource,
      JSON.stringify(value),
      'integration principal separations',
    );
  }

  const forbiddenSymbols = [
    [/\bINTEGRATION_PRINCIPAL_IDS\b/u, 'INTEGRATION_PRINCIPAL_IDS'],
    [/\bINTEGRATION_PRINCIPAL_ID_PATTERN\b/u, 'principal ID pattern'],
    [/\bisIntegrationPrincipalId\s*\(/u, 'isIntegrationPrincipalId('],
    [/\bassertIntegrationPrincipalId\s*\(/u, 'assertIntegrationPrincipalId('],
    [/\basIntegrationPrincipalId\s*\(/u, 'asIntegrationPrincipalId('],
    [/\bEXTERNAL_CREDENTIAL_IDS\b/u, 'external credential registry'],
  ];

  for (const [pattern, label] of forbiddenSymbols) {
    assertDoesNotMatch(
      contractSource,
      pattern,
      'integration principal contract',
      label,
    );
  }

  validateNoRuntimeSurface(contractSource, 'integration principal contract');
}

function validateGeneratedCredentialContract(contractSource) {
  const requiredMarkers = [
    'Semantic owners: INT-EXT-003..008',
    'Contract task: SHELL-CON-018',
    'Principal contract task: SHELL-CON-017',
    'export type ExternalCredentialId',
    'export interface ExternalCredentialRef',
    'readonly external_credential_id: ExternalCredentialId;',
    'readonly external_system_id: string;',
    'readonly integration_principal_id: IntegrationPrincipalId;',
    'readonly credential_surface: string;',
    'readonly environment: VentoCredentialEnvironment;',
    'readonly minimum_scope?: readonly string[];',
    'readonly scope_ceiling?: readonly string[];',
    'readonly predecessor_external_credential_id?: ExternalCredentialId;',
    'readonly successor_external_credential_id?: ExternalCredentialId;',
    '"DEVELOPMENT"',
    '"STAGING"',
    '"PRODUCTION"',
    'semantics: "STABLE_OPAQUE_NON_SECRET_CREDENTIAL_IDENTITY"',
    'serialization: "UNSPECIFIED"',
    'syntax_pattern: null',
    'static_registry: false',
    'materialized_id_count: 0',
    'derive_from_secret_value: false',
    'derive_from_integration_principal_id: false',
    'derive_from_external_system_id: false',
    'derive_from_provider_account_ref: false',
    'derive_from_endpoint: false',
    'derive_from_environment_variable_name: false',
    'authentication_mechanism: false',
    'knowledge_grants_secret_resolution: false',
    'material_class: "CREDENTIAL_REFERENCE"',
    'contains_authentication_material: false',
    'contains_secret_store_path: false',
    'contains_runtime_secret_locator: false',
    'runtime_secret_resolution_api: false',
    'business_authority_implied: false',
    'permission_key_implied: false',
    'fallback_to_global_credential: false',
    'fallback_to_legacy_credential: false',
    'fallback_to_other_environment: false',
    'environment_cardinality: "EXACTLY_ONE"',
    'cardinality_basis: "CREDENTIAL_SURFACE_AND_ENVIRONMENT"',
    'independent_successor_requires_new_external_credential_id: true',
    'ordinary_rotation_changes_integration_principal_id: false',
    'predecessor_successor_history_preserved: true',
    'wrong_environment: "FAIL_CLOSED"',
    'requested_scope_above_ceiling: "FAIL_CLOSED"',
    'inference_required_to_complete_reference: "FAIL_CLOSED"',
    'external_system_decision_count: 21',
    'pending_evidence_count: 9',
    'not_applicable_count: 2',
    'not_applicable_current_count: 10',
    'materialized_external_credential_id_count: 0',
    'persisted_external_credential_ref_count: 0',
    'created_or_moved_secret_count: 0',
    'logical_namespace: "@vento/contracts/integrations"',
    'physical_reference_registry_owner_task_id: "INT-DB-002"',
    'next_contract_task_id: "SHELL-CON-019"',
    'execution_gate: "PRE_E5_FOUNDATION"',
    'physical_mode: "GLOBAL_ENABLE_ONCE"',
    'public_export_published: false',
    'runtime_secret_resolution_materialized: false',
    'external_credential_values_materialized: false',
    'secret_materialized: false',
    'supabase_changed: false',
  ];

  for (const marker of requiredMarkers) {
    assertIncludes(contractSource, marker, 'external credential reference contract');
  }

  const conceptualDimensions = [
    'external_credential_id',
    'external_system_id',
    'external_instance_id',
    'integration_principal_id',
    'provider_account_ref',
    'credential_surface',
    'provenance',
    'mechanism',
    'minimum_scope',
    'scope_ceiling',
    'environment',
    'material_class',
    'functional_owner_ref',
    'technical_custodian_ref',
    'lifecycle_state',
    'predecessor_successor_refs',
    'known_dates',
    'authorized_consumers',
  ];

  for (const value of conceptualDimensions) {
    assertIncludes(
      contractSource,
      JSON.stringify(value),
      'external credential conceptual dimensions',
    );
  }

  for (let index = 1; index <= 21; index += 1) {
    assertIncludes(
      contractSource,
      JSON.stringify(`EXT-SYS-${String(index).padStart(3, '0')}`),
      'external credential applicability coverage',
    );
  }

  const statusOccurrences = (status) => (
    contractSource.match(new RegExp(`status: ${JSON.stringify(status)}`, 'gu')) ?? []
  ).length;

  if (statusOccurrences('PENDIENTE_DE_EVIDENCIA') !== 9) {
    fail('external credential applicability must contain 9 PENDIENTE_DE_EVIDENCIA rows.');
  }
  if (statusOccurrences('NO_APLICA') !== 2) {
    fail('external credential applicability must contain 2 NO_APLICA rows.');
  }
  if (statusOccurrences('NO_APLICA_ACTUAL') !== 10) {
    fail('external credential applicability must contain 10 NO_APLICA_ACTUAL rows.');
  }

  const forbiddenMaterializedValues = [
    [/\bEXTERNAL_CREDENTIAL_IDS\b/u, 'EXTERNAL_CREDENTIAL_IDS'],
    [/\bEXTERNAL_CREDENTIAL_ID_PATTERN\b/u, 'credential ID pattern'],
    [/\bisExternalCredentialId\s*\(/u, 'isExternalCredentialId('],
    [/\bassertExternalCredentialId\s*\(/u, 'assertExternalCredentialId('],
    [/\basExternalCredentialId\s*\(/u, 'asExternalCredentialId('],
    [/external_credential_id:\s*["'][^"']+["']/u, 'materialized external_credential_id'],
  ];

  for (const [pattern, label] of forbiddenMaterializedValues) {
    assertDoesNotMatch(
      contractSource,
      pattern,
      'external credential reference contract',
      label,
    );
  }

  validateNoRuntimeSurface(contractSource, 'external credential reference contract');
}

function validateGeneratedExternalReceivedEventContract(contractSource) {
  const requiredMarkers = [
    'Semantic owners: INT-EXT-009..017',
    'Contract task: SHELL-CON-019',
    'Principal contract task: SHELL-CON-017',
    'Credential contract task: SHELL-CON-018',
    'export interface ExternalReceivedEvent<TNormalizedAssertion>',
    'readonly external_system_id: string;',
    'readonly external_instance_id: string | null;',
    'readonly integration_principal_id: IntegrationPrincipalId | null;',
    'readonly external_credential_id: ExternalCredentialId | null;',
    'readonly environment: VentoCredentialEnvironment;',
    'readonly vento_contract_version: string;',
    'readonly provider_contract_version: string | null;',
    'readonly input_contract_ref: string;',
    'readonly transport_ref: string;',
    'readonly external_event_id: string | null;',
    'readonly receipt_id: string | null;',
    'readonly received_at: string;',
    'readonly provider_occurred_at: string | null;',
    'readonly authenticity_result_ref: string | null;',
    'readonly source_evidence_ref: string;',
    'readonly source_payload_digest: string | null;',
    'readonly normalized_assertion: TNormalizedAssertion | null;',
    'readonly mapping_refs: readonly string[];',
    'readonly idempotency_ref: string | null;',
    'readonly correlation_refs: readonly string[];',
    'readonly owner_contract_ref: string;',
    'external_assertion_is_canonical_business_fact: false',
    'external_provider_is_internal_business_producer: false',
    'receipt_ack_callback_webhook_confirms_business_effect: false',
    'authenticity_implies_business_correctness: false',
    'durable_receipt_required_without_stable_external_event_id: true',
    'payload_digest_replaces_event_or_receipt_identity: false',
    'raw_payload_transported_by_default: false',
    'normalized_assertion_is_business_fact: false',
    'universal_record_string_unknown_api: false',
    'mapping_by_reference: true',
    'idempotency_by_reference: true',
    'correlation_by_reference: true',
    'owner_contract_ref_grants_authority: false',
    'external_system_decision_count: 21',
    'accredited_inbound_event_count: 2',
    'without_accredited_inbound_event_count: 19',
    'not_applicable_in_cut_count: 18',
    'not_applicable_to_event_in_cut_count: 1',
    'defined_not_materialized_count: 2',
    'not_applicable_physical_count: 9',
    'not_applicable_current_physical_count: 8',
    'blocked_physical_count: 2',
    'materialized_runtime_event_count: 0',
    'created_endpoint_count: 0',
    'created_receipt_record_count: 0',
    'created_secret_count: 0',
    'supabase_change_count: 0',
    'logical_namespace: "@vento/contracts/integrations"',
    'mapping_contract_task_id: "SHELL-CON-022"',
    'idempotency_contract_task_id: "SHELL-CON-023"',
    'disposition_contract_task_id: "SHELL-CON-024"',
    'next_contract_task_id: "SHELL-CON-020"',
    'execution_gate: "PRE_E5_FOUNDATION"',
    'physical_mode: "GLOBAL_ENABLE_ONCE"',
    'public_export_published: false',
    'runtime_endpoint_materialized: false',
    'receipt_persistence_materialized: false',
    'source_payload_storage_materialized: false',
    'secret_materialized: false',
    'supabase_changed: false',
  ];

  for (const marker of requiredMarkers) {
    assertIncludes(contractSource, marker, 'external received event contract');
  }

  const interfaceMatch = contractSource.match(
    /export interface ExternalReceivedEvent<TNormalizedAssertion> \{([\s\S]*?)\n\}/u,
  );
  if (!interfaceMatch) {
    fail('external received event contract interface not found.');
  }

  const expectedFields = [
    'external_system_id',
    'external_instance_id',
    'integration_principal_id',
    'external_credential_id',
    'environment',
    'vento_contract_version',
    'provider_contract_version',
    'input_contract_ref',
    'transport_ref',
    'external_event_id',
    'receipt_id',
    'received_at',
    'provider_occurred_at',
    'authenticity_result_ref',
    'source_evidence_ref',
    'source_payload_digest',
    'normalized_assertion',
    'mapping_refs',
    'idempotency_ref',
    'correlation_refs',
    'owner_contract_ref',
  ];
  const actualFields = [
    ...interfaceMatch[1].matchAll(/^\s+readonly ([a-z_]+):/gmu),
  ].map((match) => match[1]);

  if (JSON.stringify(actualFields) !== JSON.stringify(expectedFields)) {
    fail(
      `ExternalReceivedEvent fields must remain exact 21-field logical shape; `
      + `received ${JSON.stringify(actualFields)}.`,
    );
  }

  for (let index = 1; index <= 21; index += 1) {
    assertIncludes(
      contractSource,
      JSON.stringify(`EXT-SYS-${String(index).padStart(3, '0')}`),
      'external received event applicability coverage',
    );
  }

  const decisionOccurrences = (decision) => (
    contractSource.match(new RegExp(`decision: ${JSON.stringify(decision)}`, 'gu')) ?? []
  ).length;
  const physicalStatusOccurrences = (status) => (
    contractSource.match(
      new RegExp(`physical_status: ${JSON.stringify(status)}`, 'gu'),
    ) ?? []
  ).length;

  if (decisionOccurrences('APLICA_EVENTO_INBOUND_ACREDITADO') !== 2) {
    fail('external received event applicability must contain 2 accredited inbound rows.');
  }
  if (decisionOccurrences('NO_APLICA_EN_CORTE') !== 18) {
    fail('external received event applicability must contain 18 NO_APLICA_EN_CORTE rows.');
  }
  if (decisionOccurrences('NO_APLICA_AL_EVENTO_EN_CORTE') !== 1) {
    fail(
      'external received event applicability must contain '
      + '1 NO_APLICA_AL_EVENTO_EN_CORTE row.',
    );
  }
  if (physicalStatusOccurrences('DEFINIDO_NO_MATERIALIZADO') !== 2) {
    fail('external received event physical coverage must contain 2 defined rows.');
  }
  if (physicalStatusOccurrences('NO_APLICA') !== 9) {
    fail('external received event physical coverage must contain 9 NO_APLICA rows.');
  }
  if (physicalStatusOccurrences('NO_APLICA_ACTUAL') !== 8) {
    fail(
      'external received event physical coverage must contain '
      + '8 NO_APLICA_ACTUAL rows.',
    );
  }
  if (physicalStatusOccurrences('BLOQUEADO') !== 2) {
    fail('external received event physical coverage must contain 2 BLOQUEADO rows.');
  }

  const accreditedRows = [
    ['EXT-SYS-002', 'Wompi'],
    ['EXT-SYS-003', 'RevenueCat'],
  ];
  for (const [externalSystemId, system] of accreditedRows) {
    const rowPattern = new RegExp(
      `external_system_id: ${JSON.stringify(externalSystemId)},`
      + `[\\s\\S]*?system: ${JSON.stringify(system)},`
      + `[\\s\\S]*?decision: "APLICA_EVENTO_INBOUND_ACREDITADO",`,
      'u',
    );
    if (!rowPattern.test(contractSource)) {
      fail(`${externalSystemId} ${system} must remain an accredited inbound surface.`);
    }
  }

  const interfaceBody = interfaceMatch[1];
  const forbiddenFields = [
    /\braw_payload\s*:/u,
    /\bpayload\s*:/u,
    /\bsecret\s*:/u,
    /\btoken\s*:/u,
    /\bsignature\s*:/u,
    /\bpassword\s*:/u,
    /\bapi_key\s*:/u,
    /\bservice_role\s*:/u,
  ];
  for (const pattern of forbiddenFields) {
    assertDoesNotMatch(
      interfaceBody,
      pattern,
      'ExternalReceivedEvent interface',
      pattern.source,
    );
  }

  validateNoRuntimeSurface(contractSource, 'external received event contract');
}

function validateNoRuntimeSurface(source, label) {
  const forbiddenRuntime = [
    [/\bcreateClient\s*\(/u, 'createClient('],
    [/\bfetch\s*\(/u, 'fetch('],
    [/\bprocess\.env\b/u, 'environment access'],
    [/\bfrom\s+["']@supabase\//u, '@supabase import'],
    [/\bfrom\s+["'](?:pg|postgres|drizzle|prisma)/u, 'database import'],
    [/\bDeno\.env\b/u, 'Deno environment access'],
    [/\bBun\.env\b/u, 'Bun environment access'],
  ];

  for (const [pattern, forbiddenLabel] of forbiddenRuntime) {
    assertDoesNotMatch(source, pattern, label, forbiddenLabel);
  }
}

function validateGeneratedIndex(indexSource) {
  const requiredMarkers = [
    'INTEGRATION_PRINCIPAL_CARDINALITY_POLICY',
    'INTEGRATION_PRINCIPAL_CONCEPTUAL_DIMENSIONS',
    'INTEGRATION_PRINCIPAL_CONTEXT_POLICY',
    'INTEGRATION_PRINCIPAL_FAILURE_POLICY',
    'INTEGRATION_PRINCIPAL_CONTRACT_METADATA',
    'INTEGRATION_PRINCIPAL_IDENTITY_POLICY',
    'INTEGRATION_PRINCIPAL_REFERENCE_ADOPTION',
    'INTEGRATION_PRINCIPAL_SEPARATED_IDENTITIES',
    'IntegrationPrincipal',
    'IntegrationPrincipalId',
    'IntegrationPrincipalRef',
    'from "./integration-principal.contract.js";',
    'EXTERNAL_CREDENTIAL_APPLICABILITY_STATUSES',
    'EXTERNAL_CREDENTIAL_CONCEPTUAL_DIMENSIONS',
    'EXTERNAL_CREDENTIAL_CONTRACT_METADATA',
    'EXTERNAL_CREDENTIAL_FAILURE_POLICY',
    'EXTERNAL_CREDENTIAL_IDENTITY_POLICY',
    'EXTERNAL_CREDENTIAL_REFERENCE_APPLICABILITY',
    'EXTERNAL_CREDENTIAL_REFERENCE_COVERAGE',
    'EXTERNAL_CREDENTIAL_REFERENCE_FORBIDDEN_MATERIAL',
    'EXTERNAL_CREDENTIAL_REFERENCE_POLICY',
    'EXTERNAL_CREDENTIAL_ROTATION_POLICY',
    'VENTO_CREDENTIAL_ENVIRONMENTS',
    'ExternalCredentialApplicabilityStatus',
    'ExternalCredentialId',
    'ExternalCredentialRef',
    'VentoCredentialEnvironment',
    'from "./external-credential-ref.contract.js";',
    'EXTERNAL_RECEIVED_EVENT_APPLICABILITY',
    'EXTERNAL_RECEIVED_EVENT_APPLICABILITY_DECISIONS',
    'EXTERNAL_RECEIVED_EVENT_AUTHENTICITY_POLICY',
    'EXTERNAL_RECEIVED_EVENT_BOUNDARY_POLICY',
    'EXTERNAL_RECEIVED_EVENT_CONTRACT_METADATA',
    'EXTERNAL_RECEIVED_EVENT_COVERAGE',
    'EXTERNAL_RECEIVED_EVENT_EVIDENCE_POLICY',
    'EXTERNAL_RECEIVED_EVENT_FORBIDDEN_MATERIAL',
    'EXTERNAL_RECEIVED_EVENT_IDENTITY_POLICY',
    'EXTERNAL_RECEIVED_EVENT_NORMALIZATION_POLICY',
    'EXTERNAL_RECEIVED_EVENT_PHYSICAL_STATUSES',
    'EXTERNAL_RECEIVED_EVENT_REFERENCE_POLICY',
    'EXTERNAL_RECEIVED_EVENT_TEMPORAL_POLICY',
    'ExternalReceivedEvent',
    'ExternalReceivedEventApplicabilityDecision',
    'ExternalReceivedEventPhysicalStatus',
    'from "./external-received-event.contract.js";',
  ];

  for (const marker of requiredMarkers) {
    assertIncludes(indexSource, marker, 'integrations generated index');
  }
}

function validatePackageBoundary() {
  const packageJson = JSON.parse(
    readText(packageJsonPath, '@vento/contracts package.json'),
  );

  if (packageJson.name !== '@vento/contracts') {
    fail('@vento/contracts package name changed.');
  }
  if (packageJson.version !== '1.0.0-alpha.1') {
    fail('@vento/contracts version changed during SHELL-CON-019.');
  }
  if (packageJson.private !== true) {
    fail('@vento/contracts must remain private.');
  }
  if (Object.hasOwn(packageJson, 'exports')) {
    fail('@vento/contracts must not add public exports in SHELL-CON-019.');
  }
}

function validateReadmes() {
  const moduleReadme = readText(
    integrationsReadmePath,
    'integrations README',
  );
  const rootReadme = readText(
    contractsReadmePath,
    '@vento/contracts README',
  );

  const moduleMarkers = [
    'SHELL-CON-017::GLOBAL',
    'SHELL-CON-018::GLOBAL',
    '@vento/contracts/integrations',
    'IntegrationPrincipalId',
    'ExternalCredentialId',
    'ExternalCredentialRef',
    '9 `PENDIENTE_DE_EVIDENCIA`',
    '2 `NO_APLICA`',
    '10 `NO_APLICA_ACTUAL`',
    '0 valores físicos de `ExternalCredentialId`',
    'INT-EXT-003..008',
    'INT-DB-002',
    'SHELL-CON-019::GLOBAL',
    'ExternalReceivedEvent',
    '2 `APLICA_EVENTO_INBOUND_ACREDITADO`',
    '19 sin evento externo recibido acreditado',
    'Wompi',
    'RevenueCat',
    'SHELL-CON-020',
    'PRE_E5_FOUNDATION',
    '0faeb8d65edcf9b5806c6c962aefb76ab9cfd13e434d43cb549d559cd5cbaed1',
  ];

  for (const marker of moduleMarkers) {
    assertIncludes(moduleReadme, marker, 'integrations README');
  }

  const rootMarkers = [
    '## Módulo de integraciones externas',
    '`SHELL-CON-017::GLOBAL`',
    '`SHELL-CON-018::GLOBAL`',
    '`packages/contracts/integrations`',
    '`@vento/contracts/integrations`',
    '`IntegrationPrincipalId`',
    '`ExternalCredentialId`',
    '`ExternalCredentialRef`',
    '9 `PENDIENTE_DE_EVIDENCIA`',
    '2 `NO_APLICA`',
    '10 `NO_APLICA_ACTUAL`',
    '0 valores físicos de `ExternalCredentialId`',
    '`SHELL-CON-019::GLOBAL`',
    '`ExternalReceivedEvent`',
    '2 `APLICA_EVENTO_INBOUND_ACREDITADO`',
    '19 sin evento externo recibido acreditado',
    '`SHELL-CON-020`',
  ];

  for (const marker of rootMarkers) {
    assertIncludes(rootReadme, marker, '@vento/contracts README');
  }

  if (rootReadme.includes(
    '`SHELL-CON-018` permanece como responsabilidad separada '
    + 'de referencia de credencial externa sin secreto.',
  )) {
    fail('@vento/contracts README still declares SHELL-CON-018 as reserved.');
  }
  if (rootReadme.includes(
    '`SHELL-CON-019` permanece como responsabilidad separada '
    + 'del contrato de evento externo recibido.',
  )) {
    fail('@vento/contracts README still declares SHELL-CON-019 as reserved.');
  }
}

export function validateIntegrationPrincipalContracts() {
  const freshness = generateIntegrationPrincipalContracts({ checkOnly: true });

  const principalContractSource = readText(
    principalContractPath,
    'integration principal contract',
  );
  const credentialContractSource = readText(
    credentialContractPath,
    'external credential reference contract',
  );
  const externalReceivedEventContractSource = readText(
    externalReceivedEventContractPath,
    'external received event contract',
  );
  const indexSource = readText(indexPath, 'integrations generated index');

  validateGeneratedPrincipalContract(principalContractSource);
  validateGeneratedCredentialContract(credentialContractSource);
  validateGeneratedExternalReceivedEventContract(externalReceivedEventContractSource);
  validateGeneratedIndex(indexSource);
  validatePackageBoundary();
  validateReadmes();

  return {
    principalDecisions: freshness.principalDecisions,
    credentialDecisions: freshness.credentialDecisions,
    credentialPendingEvidence: freshness.credentialPendingEvidence,
    credentialNotApplicable: freshness.credentialNotApplicable,
    credentialNotApplicableCurrent: freshness.credentialNotApplicableCurrent,
    materializedCredentialIds: freshness.materializedCredentialIds,
    eventDecisions: freshness.eventDecisions,
    eventAccreditedInbound: freshness.eventAccreditedInbound,
    eventWithoutAccreditedInbound: freshness.eventWithoutAccreditedInbound,
    eventNotApplicableInCut: freshness.eventNotApplicableInCut,
    eventNotApplicableToEventInCut: freshness.eventNotApplicableToEventInCut,
    eventDefinedNotMaterialized: freshness.eventDefinedNotMaterialized,
    eventNotApplicablePhysical: freshness.eventNotApplicablePhysical,
    eventNotApplicableCurrentPhysical: freshness.eventNotApplicableCurrentPhysical,
    eventBlockedPhysical: freshness.eventBlockedPhysical,
  };
}

function runCli() {
  try {
    const result = validateIntegrationPrincipalContracts();

    console.log('[VENTO CONTRACTS] INTEGRATIONS VALIDATION PASS');
    console.log(`[VENTO CONTRACTS] PRINCIPAL_DECISIONS ${result.principalDecisions}`);
    console.log(`[VENTO CONTRACTS] CREDENTIAL_DECISIONS ${result.credentialDecisions}`);
    console.log(
      `[VENTO CONTRACTS] CREDENTIAL_PENDING_EVIDENCE `
      + `${result.credentialPendingEvidence}`,
    );
    console.log(
      `[VENTO CONTRACTS] CREDENTIAL_NOT_APPLICABLE `
      + `${result.credentialNotApplicable}`,
    );
    console.log(
      `[VENTO CONTRACTS] CREDENTIAL_NOT_APPLICABLE_CURRENT `
      + `${result.credentialNotApplicableCurrent}`,
    );
    console.log(
      `[VENTO CONTRACTS] MATERIALIZED_CREDENTIAL_IDS `
      + `${result.materializedCredentialIds}`,
    );
    console.log(`[VENTO CONTRACTS] EVENT_DECISIONS ${result.eventDecisions}`);
    console.log(
      `[VENTO CONTRACTS] EVENT_ACCREDITED_INBOUND `
      + `${result.eventAccreditedInbound}`,
    );
    console.log(
      `[VENTO CONTRACTS] EVENT_WITHOUT_ACCREDITED_INBOUND `
      + `${result.eventWithoutAccreditedInbound}`,
    );
    console.log('');
    console.log('=== RESULTADO PARA CHATGPT ===');
    console.log('ESTADO: PASS');
    console.log('OPERACION: INTEGRATION_CONTRACTS_VALIDATE');
    console.log(`PRINCIPAL_DECISIONS: ${result.principalDecisions}`);
    console.log(`CREDENTIAL_DECISIONS: ${result.credentialDecisions}`);
    console.log(`CREDENTIAL_PENDING_EVIDENCE: ${result.credentialPendingEvidence}`);
    console.log(`CREDENTIAL_NOT_APPLICABLE: ${result.credentialNotApplicable}`);
    console.log(
      `CREDENTIAL_NOT_APPLICABLE_CURRENT: `
      + `${result.credentialNotApplicableCurrent}`,
    );
    console.log(`MATERIALIZED_CREDENTIAL_IDS: ${result.materializedCredentialIds}`);
    console.log(`EVENT_DECISIONS: ${result.eventDecisions}`);
    console.log(`EVENT_ACCREDITED_INBOUND: ${result.eventAccreditedInbound}`);
    console.log(
      `EVENT_WITHOUT_ACCREDITED_INBOUND: ${result.eventWithoutAccreditedInbound}`,
    );
    console.log(`EVENT_NOT_APPLICABLE_IN_CUT: ${result.eventNotApplicableInCut}`);
    console.log(
      `EVENT_NOT_APPLICABLE_TO_EVENT_IN_CUT: `
      + `${result.eventNotApplicableToEventInCut}`,
    );
    console.log(
      `EVENT_DEFINED_NOT_MATERIALIZED: ${result.eventDefinedNotMaterialized}`,
    );
    console.log(
      `EVENT_NOT_APPLICABLE_PHYSICAL: ${result.eventNotApplicablePhysical}`,
    );
    console.log(
      `EVENT_NOT_APPLICABLE_CURRENT_PHYSICAL: `
      + `${result.eventNotApplicableCurrentPhysical}`,
    );
    console.log(`EVENT_BLOCKED_PHYSICAL: ${result.eventBlockedPhysical}`);
    console.log('PACKAGE_BOUNDARY: PASS');
    console.log('README_BOUNDARY: PASS');
    console.log('RUNTIME_SECRET_BOUNDARY: PASS');
    console.log('=== FIN RESULTADO PARA CHATGPT ===');
  } catch (error) {
    const message = error instanceof Error ? error.message : String(error);

    console.error('[VENTO CONTRACTS] INTEGRATIONS VALIDATION FAIL');
    console.error(message);
    console.error('');
    console.error('=== RESULTADO PARA CHATGPT ===');
    console.error('ESTADO: FAIL');
    console.error('OPERACION: INTEGRATION_CONTRACTS_VALIDATE');
    console.error(`ERROR: ${message}`);
    console.error('=== FIN RESULTADO PARA CHATGPT ===');
    process.exitCode = 1;
  }
}

if (
  process.argv[1]
  && path.resolve(process.argv[1]) === currentFile
) {
  runCli();
}