import fs from 'node:fs';
import path from 'node:path';
import { fileURLToPath } from 'node:url';

import {
  generateIntegrationIdempotencyReconciliationContract,
} from './generate-integration-idempotency-reconciliation-contract.mjs';

const currentFile = fileURLToPath(import.meta.url);
const scriptDirectory = path.dirname(currentFile);
const integrationsRoot = path.resolve(scriptDirectory, '..');
const contractsRoot = path.resolve(integrationsRoot, '..');
const contractPath = path.join(integrationsRoot, 'generated', 'integration-idempotency-reconciliation.contract.ts');
const eventPath = path.join(integrationsRoot, 'generated', 'external-received-event.contract.ts');
const mappingPath = path.join(integrationsRoot, 'generated', 'external-identifier-mapping.contract.ts');
const indexPath = path.join(integrationsRoot, 'generated', 'index.ts');
const integrationsReadmePath = path.join(integrationsRoot, 'README.md');
const contractsReadmePath = path.join(contractsRoot, 'README.md');
const packageJsonPath = path.join(contractsRoot, 'package.json');

const expectedScopes = Object.freeze(["REQUEST_ACCEPTANCE", "OWNER_COMMAND", "EVENT_EMISSION", "CONSUMER_INBOX", "CONSUMER_EFFECT", "EXTERNAL_RECEIPT", "REPLAY_BATCH"]);
const expectedClaimStates = Object.freeze(["CLAIMED", "SUCCEEDED", "FAILED_RETRYABLE", "FAILED_FINAL", "OUTCOME_UNKNOWN", "CANCELLED", "EXPIRED"]);
const expectedIdempotencyOutcomes = Object.freeze(["APPLIED", "DUPLICATE_RESULT_RETURNED", "CONFLICTING_REUSE", "IN_PROGRESS_RECOVERABLE", "STALE_VERSION", "OUT_OF_ORDER_DEFERRED", "RECONCILIATION_REQUIRED", "REJECTED"]);
const expectedClosureOutcomes = Object.freeze(["RESOLVED_CONFIRMED", "RESOLVED_NO_EFFECT", "RESOLVED_DUPLICATE_PRIOR_RESULT", "RESOLVED_CORRECTED", "RESOLVED_COMPENSATED", "RESOLVED_WITH_ACCEPTED_RESIDUAL", "PERMANENTLY_REJECTED", "SUPERSEDED_BY_SUCCESSOR"]);

function fail(message) { throw new Error(message); }
function normalizeEol(value) { return String(value).replace(/^\uFEFF/u, '').replace(/\r\n?/gu, '\n'); }
function readText(filePath, label) {
  if (!fs.existsSync(filePath)) fail(`Missing ${label}: ${path.relative(process.cwd(), filePath)}`);
  return normalizeEol(fs.readFileSync(filePath, 'utf8'));
}
function assertIncludes(source, expected, label) { if (!source.includes(expected)) fail(`${label} is missing required content: ${expected}`); }
function assertDoesNotMatch(source, pattern, label, forbiddenLabel) { if (pattern.test(source)) fail(`${label} contains forbidden content: ${forbiddenLabel}`); }
function validateNoRuntimeSurface(source, label) {
  for (const [pattern, forbiddenLabel] of [
    [/\bcreateClient\s*\(/u, 'createClient('], [/\bfetch\s*\(/u, 'fetch('],
    [/\bprocess\.env\b/u, 'environment access'], [/\bfrom\s+["']@supabase\//u, '@supabase import'],
    [/\bfrom\s+["'](?:pg|postgres|drizzle|prisma)/u, 'database import'], [/\bDeno\.env\b/u, 'Deno environment access'],
    [/\bBun\.env\b/u, 'Bun environment access'],
  ]) assertDoesNotMatch(source, pattern, label, forbiddenLabel);
}
function extractConstStringArray(source, constantName) {
  const pattern = new RegExp(`export const ${constantName} = \\[([\\s\\S]*?)\\] as const;`, 'u');
  const match = source.match(pattern);
  if (!match) fail(`${constantName} array not found.`);
  return [...match[1].matchAll(/"([A-Z_]+)"/gu)].map((entry) => entry[1]);
}
function validateExactArray(source, name, expected) {
  const actual = extractConstStringArray(source, name);
  if (JSON.stringify(actual) !== JSON.stringify(expected)) fail(`${name} must remain exact; received ${JSON.stringify(actual)}.`);
}
function interfaceFields(source, interfaceName) {
  const match = source.match(new RegExp(`export interface ${interfaceName} \\{([\\s\\S]*?)^\\}`, 'mu'));
  if (!match) fail(`${interfaceName} interface not found.`);
  return [...match[1].matchAll(/^  readonly ([a-z_]+):/gmu)].map((entry) => entry[1]);
}
function validateExactFields(source, interfaceName, expected) {
  const actual = interfaceFields(source, interfaceName);
  if (JSON.stringify(actual) !== JSON.stringify(expected)) fail(`${interfaceName} fields must remain exact; received ${JSON.stringify(actual)}.`);
}
function validateGeneratedContract(source) {
  const required = [
    'Contract task: SHELL-CON-023', 'External received event task: SHELL-CON-019',
    'External identifier mapping task: SHELL-CON-022', 'Physical idempotency owner: INT-DB-005',
    'Physical reconciliation owner: INT-DB-008', 'Physical processing audit owner: INT-DB-007',
    'Source contract SHA256: d6630e1e3280845765308579eb06302ce1b476da96475de675a1667e06ee68f0',
    'export type IntegrationIdempotencyScope', 'export interface IntegrationIdempotencyRef',
    'export interface IntegrationIdempotencyRecord', 'export type ExternalIntegrationClaimState',
    'export type IntegrationIdempotencyOutcome', 'export type IntegrationReconciliationRef',
    'export interface IntegrationReconciliationCase', 'export type IntegrationReconciliationClosureOutcome',
    'global_vento_idempotency_key_exists: false', 'global_sale_idempotency_key_exists: false',
    'scope_known_before_first_protected_effect: true', 'operation_key_fixed_before_first_effect: true',
    'generation_represents_legitimate_new_intent_only: true', 'same_identity_incompatible_hash_result: "CONFLICTING_REUSE"',
    'concurrent_same_identity_business_winner_count: 1', 'expired_lease_proves_absence_of_commit: false',
    'duplicate_result_returned_new_mutation_count: 0', 'reconciliation_required_authorizes_retry: false',
    'indeterminate_result_requires_reconciliation: true', 'global_acid_transaction_across_owners_exists: false',
    'semantics: "STABLE_OPAQUE_NON_SECRET_RECONCILIATION_CASE_IDENTITY"', 'unknown_closure_outcome_exists: false',
    'mapping_is_idempotency: false', 'correlation_is_idempotency: false',
    'current_idempotency_ref_storage: "GENERIC_STRING_REFERENCE_OR_NULL"', 'typed_target_ref: "IntegrationIdempotencyRef"',
    'consumer_migration_materialized_here: false', 'canonical_sale_id_is_universal_effect_key: false',
    'canonical_sale_line_id_is_universal_effect_key: false', 'makos_excel_proves_individual_sale_or_line_idempotency: false',
    'expected_external_system_count: 21', 'adopted_external_system_count: 21', 'missing_external_system_count: 0',
    'duplicate_external_system_count: 0', 'unique_external_system_id_count: 21',
    'governed_by_internal_contract_count: 1', 'idempotency_and_reconciliation_count: 6',
    'no_business_effect_ledger_count: 2', 'technical_platform_without_business_effect_count: 2',
    'model_without_remote_binding_count: 1', 'pos_specialization_count: 1',
    'no_binding_not_applicable_count: 7', 'blocked_without_binding_count: 1',
    'materialized_idempotency_record_count: 0', 'materialized_reconciliation_case_count: 0',
    'physical_idempotency_owner_task_id: "INT-DB-005"', 'physical_reconciliation_owner_task_id: "INT-DB-008"',
    'physical_processing_audit_owner_task_id: "INT-DB-007"', 'disposition_contract_task_id: "SHELL-CON-024"',
    'next_contract_task_id: "SHELL-CON-024"', 'execution_gate: "PRE_E5_FOUNDATION"', 'physical_mode: "GLOBAL_ENABLE_ONCE"',
    'public_export_published: false', 'package_root_index_extended: false', 'consumer_adoption_materialized: false',
    'persistence_materialized: false', 'claim_runtime_materialized: false', 'retry_runtime_materialized: false',
    'reconciliation_runtime_materialized: false', 'migration_materialized: false', 'supabase_changed: false',
  ];
  for (const marker of required) assertIncludes(source, marker, 'idempotency reconciliation contract');
  validateExactArray(source, 'INTEGRATION_IDEMPOTENCY_SCOPES', expectedScopes);
  validateExactArray(source, 'EXTERNAL_INTEGRATION_CLAIM_STATES', expectedClaimStates);
  validateExactArray(source, 'INTEGRATION_IDEMPOTENCY_OUTCOMES', expectedIdempotencyOutcomes);
  validateExactArray(source, 'INTEGRATION_RECONCILIATION_CLOSURE_OUTCOMES', expectedClosureOutcomes);
  validateExactFields(source, 'IntegrationIdempotencyRef', ['scope','scope_owner_ref','namespace_ref','operation_key','generation','contract_version']);
  validateExactFields(source, 'IntegrationIdempotencyRecord', ['idempotency_ref','logical_content_hash','logical_content_hash_version','resource_ref','claim_state','outcome','result_ref','external_system_id','external_instance_id','integration_principal_id','environment','surface','operation_kind','provider_ref','first_observed_at','last_observed_at','attempt_count','finalized_at','correlation_refs','audit_ref','reconciliation_ref']);
  validateExactFields(source, 'IntegrationReconciliationCase', ['reconciliation_ref','idempotency_ref','owner_ref','operation_ref','event_ref','receipt_ref','mapping_refs','correlation_refs','compared_source_refs','evidence_refs','attempt_refs','observed_difference_refs','owner_outcome_ref','external_claim_state','decision_ref','closure_outcome','residual_obligations','next_action_ref','responsible_owner_ref','reactivation_condition_ref','opened_at','updated_at','closed_at']);
  const ids = [...source.matchAll(/external_system_id: "(EXT-SYS-\d{3})"/gu)].map((match) => match[1]);
  const expectedIds = Array.from({ length: 21 }, (_, index) => `EXT-SYS-${String(index + 1).padStart(3, '0')}`);
  if (JSON.stringify(ids) !== JSON.stringify(expectedIds)) fail(`adoption must preserve exact EXT-SYS-001..021 order; received ${JSON.stringify(ids)}.`);
  if (new Set(ids).size !== 21) fail('adoption contains duplicate EXT-SYS identifiers.');
  const classifications = [...source.matchAll(/classification: "([A-Z_]+)"/gu)].map((m) => m[1]);
  const distribution = Object.fromEntries([...new Set(classifications)].map((key) => [key, classifications.filter((value) => value === key).length]));
  const expectedDistribution = {
    GOBERNADA_POR_CONTRATO_INTERNO: 1,
    APLICA_IDEMPOTENCIA_Y_CONCILIACION: 6,
    SIN_LEDGER_DE_EFECTO_EMPRESARIAL: 2,
    PLATAFORMA_TECNICA_SIN_EFECTO_EMPRESARIAL_EN_CORTE: 2,
    MODELO_SIN_BINDING_REMOTO: 1,
    APLICA_CON_ESPECIALIZACION_POS: 1,
    NO_APLICA_SIN_BINDING: 7,
    BLOQUEADO_SIN_BINDING: 1,
  };
  const distributionKeys = Object.keys(distribution).sort();
  const expectedDistributionKeys = Object.keys(expectedDistribution).sort();
  if (JSON.stringify(distributionKeys) !== JSON.stringify(expectedDistributionKeys)) {
    fail(`adoption distribution keys mismatch: ${JSON.stringify(distribution)}.`);
  }
  for (const [key, expectedCount] of Object.entries(expectedDistribution)) {
    if (distribution[key] !== expectedCount) {
      fail(`adoption distribution mismatch for ${key}: expected ${expectedCount}, received ${distribution[key] ?? 0}.`);
    }
  }
  for (const marker of ['Wompi','RevenueCat','Resend','Expo Push Service','Apple Wallet / PassKit y APNs','Zebra BrowserPrint','POS externo vigente','makos_excel','Telefonia / voz','TI-INT-003']) assertIncludes(source, marker, 'adoption coverage');
  assertDoesNotMatch(source, /\bexport\s+enum\b/u, 'idempotency reconciliation contract', 'physical enum');
  assertDoesNotMatch(source, /\bcreate table\b/iu, 'idempotency reconciliation contract', 'DDL');
  assertDoesNotMatch(source, /\boperation_key:\s*[^;]*password/iu, 'idempotency reconciliation contract', 'secret operation key');
  validateNoRuntimeSurface(source, 'idempotency reconciliation contract');
}
function validateDependencyBoundaries(eventSource, mappingSource) {
  for (const marker of ['Contract task: SHELL-CON-019','readonly idempotency_ref: string | null;','idempotency_contract_task_id: "SHELL-CON-023"']) assertIncludes(eventSource, marker, 'SHELL-CON-019 dependency');
  assertDoesNotMatch(eventSource, /IntegrationIdempotencyRef/u, 'SHELL-CON-019 dependency', 'consumer migration advanced in SHELL-CON-019');
  for (const marker of ['Contract task: SHELL-CON-022','mapping_id_is_idempotency_key: false','idempotency_contract_task_id: "SHELL-CON-023"']) assertIncludes(mappingSource, marker, 'SHELL-CON-022 dependency');
  assertDoesNotMatch(mappingSource, /IntegrationIdempotencyRecord/u, 'SHELL-CON-022 dependency', 'idempotency contract advanced in SHELL-CON-022');
}
function validateInternalIndexBoundary(indexSource) {
  for (const pattern of [/\bIntegrationIdempotencyScope\b/u,/\bIntegrationIdempotencyRef\b/u,/\bIntegrationIdempotencyRecord\b/u,/\bIntegrationReconciliationRef\b/u,/\bIntegrationReconciliationCase\b/u,/integration-idempotency-reconciliation\.contract\.js/u]) {
    assertDoesNotMatch(indexSource, pattern, 'integrations generated index', 'SHELL-CON-023 public barrel export');
  }
}
function validatePackageBoundary() {
  const packageJson = JSON.parse(readText(packageJsonPath, '@vento/contracts package.json'));
  if (packageJson.name !== '@vento/contracts') fail('@vento/contracts package name changed.');
  if (packageJson.version !== '1.0.0-alpha.1') fail('@vento/contracts version changed during SHELL-CON-023.');
  if (packageJson.private !== true) fail('@vento/contracts must remain private.');
  if (Object.hasOwn(packageJson, 'exports')) fail('@vento/contracts must not add public exports in SHELL-CON-023.');
}
function validateReadmes() {
  const moduleReadme = readText(integrationsReadmePath, 'integrations README');
  const rootReadme = readText(contractsReadmePath, '@vento/contracts README');
  const moduleMarkers = [
    'SHELL-CON-022::GLOBAL','SHELL-CON-023::GLOBAL','@vento/contracts/integrations',
    'IntegrationIdempotencyScope','IntegrationIdempotencyRef','IntegrationIdempotencyRecord','ExternalIntegrationClaimState',
    'IntegrationIdempotencyOutcome','IntegrationReconciliationRef','IntegrationReconciliationCase','IntegrationReconciliationClosureOutcome',
    '7 alcances','7 estados de claim','8 outcomes idempotentes','8 cierres de conciliación',
    '6 campos de `IntegrationIdempotencyRef`','21 campos de nivel superior','23 campos de nivel superior',
    'REQUEST_ACCEPTANCE','CONSUMER_EFFECT','EXTERNAL_RECEIPT','REPLAY_BATCH','OUTCOME_UNKNOWN','RESULT_UNKNOWN',
    'INT-DB-005','INT-DB-008','INT-DB-007','EXT-SYS-001..021','21/21','makos_excel','TI-INT-003',
    'SHELL-CON-024','PRE_E5_FOUNDATION','0 registros idempotentes operativos','0 casos de conciliación operativos','0 cambios Supabase',
    'd6630e1e3280845765308579eb06302ce1b476da96475de675a1667e06ee68f0',
  ];
  for (const marker of moduleMarkers) assertIncludes(moduleReadme, marker, 'integrations README');
  const rootMarkers = [
    '## Módulo de integraciones externas','`SHELL-CON-022::GLOBAL`','`SHELL-CON-023::GLOBAL`',
    '`packages/contracts/integrations`','`@vento/contracts/integrations`','`IntegrationIdempotencyScope`','`IntegrationIdempotencyRef`',
    '`IntegrationIdempotencyRecord`','`IntegrationReconciliationRef`','`IntegrationReconciliationCase`',
    '7 alcances','7 estados de claim','8 outcomes idempotentes','8 cierres de conciliación','21/21',
    '`INT-DB-005`','`INT-DB-008`','`INT-DB-007`','`makos_excel`','`SHELL-CON-024`',
    '0 registros idempotentes operativos','0 casos de conciliación operativos','0 cambios Supabase',
  ];
  for (const marker of rootMarkers) assertIncludes(rootReadme, marker, '@vento/contracts README');
  for (const marker of [
    '`SHELL-CON-023` y `SHELL-CON-024` conservan respectivamente idempotencia/conciliación',
    '`SHELL-CON-023` conserva idempotencia y conciliación compartidas',
  ]) {
    if (moduleReadme.includes(marker) || rootReadme.includes(marker)) fail(`README still declares SHELL-CON-023 as reserved: ${marker}`);
  }
}
export function validateIntegrationIdempotencyReconciliationContract() {
  const freshness = generateIntegrationIdempotencyReconciliationContract({ checkOnly: true });
  const source = readText(contractPath, 'integration idempotency reconciliation contract');
  const eventSource = readText(eventPath, 'external received event contract');
  const mappingSource = readText(mappingPath, 'external identifier mapping contract');
  const indexSource = readText(indexPath, 'integrations generated index');
  validateGeneratedContract(source);
  validateDependencyBoundaries(eventSource, mappingSource);
  validateInternalIndexBoundary(indexSource);
  validatePackageBoundary();
  validateReadmes();
  return Object.freeze(freshness);
}
function runCli() {
  try {
    const result = validateIntegrationIdempotencyReconciliationContract();
    console.log('[VENTO CONTRACTS] IDEMPOTENCY RECONCILIATION VALIDATION PASS');
    console.log(`[VENTO CONTRACTS] IDEMPOTENCY_SCOPES ${result.scopeCount}`);
    console.log(`[VENTO CONTRACTS] CLAIM_STATES ${result.claimStateCount}`);
    console.log(`[VENTO CONTRACTS] IDEMPOTENCY_OUTCOMES ${result.idempotencyOutcomeCount}`);
    console.log(`[VENTO CONTRACTS] RECONCILIATION_CLOSURE_OUTCOMES ${result.closureOutcomeCount}`);
    console.log(`[VENTO CONTRACTS] EXTERNAL_SYSTEMS ${result.externalSystemCount}`);
    console.log('');
    console.log('=== RESULTADO PARA CHATGPT ===');
    console.log('ESTADO: PASS');
    console.log('OPERACION: INTEGRATION_IDEMPOTENCY_RECONCILIATION_VALIDATE');
    console.log(`IDEMPOTENCY_SCOPES: ${result.scopeCount}`);
    console.log(`CLAIM_STATES: ${result.claimStateCount}`);
    console.log(`IDEMPOTENCY_OUTCOMES: ${result.idempotencyOutcomeCount}`);
    console.log(`RECONCILIATION_CLOSURE_OUTCOMES: ${result.closureOutcomeCount}`);
    console.log(`EXTERNAL_SYSTEMS: ${result.externalSystemCount}`);
    console.log(`MATERIALIZED_IDEMPOTENCY_RECORDS: ${result.materializedIdempotencyRecords}`);
    console.log(`MATERIALIZED_RECONCILIATION_CASES: ${result.materializedReconciliationCases}`);
    console.log('DEPENDENCY_BOUNDARY: PASS');
    console.log('PACKAGE_BOUNDARY: PASS');
    console.log('INTERNAL_INDEX_BOUNDARY: PASS');
    console.log('README_BOUNDARY: PASS');
    console.log('RUNTIME_SECRET_BOUNDARY: PASS');
    console.log('=== FIN RESULTADO PARA CHATGPT ===');
  } catch (error) {
    const message = error instanceof Error ? error.message : String(error);
    console.error('[VENTO CONTRACTS] IDEMPOTENCY RECONCILIATION VALIDATION FAIL');
    console.error(message);
    console.error('');
    console.error('=== RESULTADO PARA CHATGPT ===');
    console.error('ESTADO: FAIL');
    console.error('OPERACION: INTEGRATION_IDEMPOTENCY_RECONCILIATION_VALIDATE');
    console.error(`ERROR: ${message}`);
    console.error('=== FIN RESULTADO PARA CHATGPT ===');
    process.exitCode = 1;
  }
}
if (process.argv[1] && path.resolve(process.argv[1]) === currentFile) runCli();
