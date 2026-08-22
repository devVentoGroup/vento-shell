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
    fail('@vento/contracts version changed during SHELL-CON-018.');
  }
  if (packageJson.private !== true) {
    fail('@vento/contracts must remain private.');
  }
  if (Object.hasOwn(packageJson, 'exports')) {
    fail('@vento/contracts must not add public exports in SHELL-CON-018.');
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
    'SHELL-CON-019',
    'PRE_E5_FOUNDATION',
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
    '`SHELL-CON-019`',
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
  const indexSource = readText(indexPath, 'integrations generated index');

  validateGeneratedPrincipalContract(principalContractSource);
  validateGeneratedCredentialContract(credentialContractSource);
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