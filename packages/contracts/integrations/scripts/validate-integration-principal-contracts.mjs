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

const contractPath = path.join(
  integrationsRoot,
  'generated',
  'integration-principal.contract.ts',
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
  return String(value).replace(/\r\n?/gu, '\n');
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

function validateGeneratedContract(contractSource) {
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
    assertIncludes(
      contractSource,
      marker,
      'integration principal contract',
    );
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

  const conceptualDimensions = [
    'integration_principal_id',
    'external_system_id',
    'external_instance_id',
    'business_owner_ref',
    'technical_owner_ref',
    'finalidad técnica',
    'ambiente',
    'vigencia',
    'correlación',
  ];

  for (const value of conceptualDimensions) {
    assertIncludes(
      contractSource,
      JSON.stringify(value),
      'integration principal conceptual dimensions',
    );
  }

  const forbiddenSymbols = [
    [/\bINTEGRATION_PRINCIPAL_IDS\b/u, 'INTEGRATION_PRINCIPAL_IDS'],
    [/\bINTEGRATION_PRINCIPAL_ID_PATTERN\b/u, 'ID pattern'],
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

  const forbiddenRuntime = [
    [/\bcreateClient\s*\(/u, 'createClient('],
    [/\bfetch\s*\(/u, 'fetch('],
    [/\bfrom\s+["']@supabase\//u, '@supabase import'],
    [/\bfrom\s+["'](?:pg|postgres|drizzle|prisma)/u, 'database import'],
    [/\bprocess\.env\b/u, 'environment secret access'],
    [/\bAPI_KEY\b/u, 'API_KEY'],
    [/\bACCESS_TOKEN\b/u, 'ACCESS_TOKEN'],
    [/\bREFRESH_TOKEN\b/u, 'REFRESH_TOKEN'],
    [/\bCLIENT_SECRET\b/u, 'CLIENT_SECRET'],
    [/\bSERVICE_ROLE\b/u, 'SERVICE_ROLE'],
  ];

  for (const [pattern, label] of forbiddenRuntime) {
    assertDoesNotMatch(
      contractSource,
      pattern,
      'integration principal contract',
      label,
    );
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
    'IntegrationPrincipalCardinalityPolicy',
    'IntegrationPrincipalConceptualDimension',
    'IntegrationPrincipalContextPolicy',
    'IntegrationPrincipalContractMetadata',
    'IntegrationPrincipalFailurePolicy',
    'IntegrationPrincipalId',
    'IntegrationPrincipalIdentityPolicy',
    'IntegrationPrincipalRef',
    'IntegrationPrincipalReferenceAdoption',
    'IntegrationPrincipalSeparatedIdentity',
    'from "./integration-principal.contract.js";',
  ];

  for (const marker of requiredMarkers) {
    assertIncludes(
      indexSource,
      marker,
      'integration principal generated index',
    );
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
    fail('@vento/contracts version changed during SHELL-CON-017.');
  }

  if (packageJson.private !== true) {
    fail('@vento/contracts must remain private.');
  }

  if (Object.hasOwn(packageJson, 'exports')) {
    fail('@vento/contracts must not add public exports in SHELL-CON-017.');
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
    '@vento/contracts/integrations',
    'IntegrationPrincipalId',
    '21 decisiones documentales `ESPECIFICADO`',
    '11 materializaciones `PENDIENTE_DE_EVIDENCIA`',
    '10 materializaciones `NO_APLICA`',
    '0 valores físicos',
    'SHELL-CON-018',
    'INT-DB-001',
    'PRE_E5_FOUNDATION',
  ];

  for (const marker of moduleMarkers) {
    assertIncludes(moduleReadme, marker, 'integrations README');
  }

  const rootMarkers = [
    '## Módulo de principal técnico de integración',
    '`SHELL-CON-017::GLOBAL`',
    '`packages/contracts/integrations`',
    '`@vento/contracts/integrations`',
    '21 decisiones',
    '11 `PENDIENTE_DE_EVIDENCIA`',
    '10 `NO_APLICA`',
    '0 valores físicos de `IntegrationPrincipalId`',
    '`SHELL-CON-018`',
  ];

  for (const marker of rootMarkers) {
    assertIncludes(rootReadme, marker, '@vento/contracts README');
  }

  if (rootReadme.includes(
    '`SHELL-CON-017` permanece reservado para el contrato '
    + 'de principal técnico de integración.',
  )) {
    fail(
      '@vento/contracts README still declares SHELL-CON-017 as reserved.',
    );
  }
}

export function validateIntegrationPrincipalContracts() {
  const freshness =
    generateIntegrationPrincipalContracts({ checkOnly: true });

  const contractSource = readText(
    contractPath,
    'integration principal contract',
  );
  const indexSource = readText(
    indexPath,
    'integration principal generated index',
  );

  validateGeneratedContract(contractSource);
  validateGeneratedIndex(indexSource);
  validatePackageBoundary();
  validateReadmes();

  return {
    decisions: freshness.decisions,
    documentarySpecified: freshness.documentarySpecified,
    pendingPhysical: freshness.pendingPhysical,
    notApplicable: freshness.notApplicable,
    materializedPrincipalIds: freshness.materializedPrincipalIds,
  };
}

function runCli() {
  try {
    const result = validateIntegrationPrincipalContracts();

    console.log('[VENTO CONTRACTS] INTEGRATION_PRINCIPAL VALIDATION PASS');
    console.log(`[VENTO CONTRACTS] DECISIONS ${result.decisions}`);
    console.log(
      `[VENTO CONTRACTS] DOCUMENTARY_SPECIFIED `
      + `${result.documentarySpecified}`,
    );
    console.log(
      `[VENTO CONTRACTS] PENDING_PHYSICAL ${result.pendingPhysical}`,
    );
    console.log(
      `[VENTO CONTRACTS] NOT_APPLICABLE ${result.notApplicable}`,
    );
    console.log(
      `[VENTO CONTRACTS] MATERIALIZED_PRINCIPAL_IDS `
      + `${result.materializedPrincipalIds}`,
    );
    console.log('');
    console.log('=== RESULTADO PARA CHATGPT ===');
    console.log('ESTADO: PASS');
    console.log('OPERACION: INTEGRATION_PRINCIPAL_VALIDATE');
    console.log(`DECISIONS: ${result.decisions}`);
    console.log(
      `DOCUMENTARY_SPECIFIED: ${result.documentarySpecified}`,
    );
    console.log(`PENDING_PHYSICAL: ${result.pendingPhysical}`);
    console.log(`NOT_APPLICABLE: ${result.notApplicable}`);
    console.log(
      `MATERIALIZED_PRINCIPAL_IDS: ${result.materializedPrincipalIds}`,
    );
    console.log('PACKAGE_BOUNDARY: PASS');
    console.log('README_BOUNDARY: PASS');
    console.log('=== FIN RESULTADO PARA CHATGPT ===');
  } catch (error) {
    const message =
      error instanceof Error ? error.message : String(error);

    console.error('[VENTO CONTRACTS] INTEGRATION_PRINCIPAL VALIDATION FAIL');
    console.error(message);
    console.error('');
    console.error('=== RESULTADO PARA CHATGPT ===');
    console.error('ESTADO: FAIL');
    console.error('OPERACION: INTEGRATION_PRINCIPAL_VALIDATE');
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