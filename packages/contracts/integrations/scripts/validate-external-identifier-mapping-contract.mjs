import fs from 'node:fs';
import path from 'node:path';
import { fileURLToPath } from 'node:url';

import {
  generateExternalIdentifierMappingContract,
} from './generate-external-identifier-mapping-contract.mjs';

const currentFile = fileURLToPath(import.meta.url);
const scriptDirectory = path.dirname(currentFile);
const integrationsRoot = path.resolve(scriptDirectory, '..');
const contractsRoot = path.resolve(integrationsRoot, '..');

const mappingContractPath = path.join(
  integrationsRoot,
  'generated',
  'external-identifier-mapping.contract.ts',
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
const generatedIndexPath = path.join(integrationsRoot, 'generated', 'index.ts');
const integrationsReadmePath = path.join(integrationsRoot, 'README.md');
const contractsReadmePath = path.join(contractsRoot, 'README.md');
const packageJsonPath = path.join(contractsRoot, 'package.json');

const expectedIdentifierClasses = Object.freeze([
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

const expectedRelationKinds = Object.freeze([
  'EXTERNAL_TO_CANONICAL',
  'CANONICAL_PROPAGATED_EXTERNAL',
  'EXTERNAL_ROUTE_TO_OWNER',
  'EXTERNAL_EVENT_TO_RECEIPT',
  'EXTERNAL_NAMESPACE_BINDING',
  'CORRELATION_ONLY',
  'NO_EQUIVALENCE',
]);

const expectedMappingStates = Object.freeze([
  'RESOLVED',
  'PARTIALLY_RESOLVED',
  'UNRESOLVED',
  'AMBIGUOUS',
  'CONFLICT',
  'RETIRED',
  'NOT_APPLICABLE',
  'BLOCKED',
]);

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

function extractConstStringArray(source, constantName) {
  const pattern = new RegExp(
    `export const ${constantName} = \\[([\\s\\S]*?)\\] as const;`,
    'u',
  );
  const match = source.match(pattern);
  if (!match) fail(`${constantName} array not found.`);
  return [...match[1].matchAll(/"([A-Z_]+)"/gu)].map((entry) => entry[1]);
}

function validateExactArray(source, constantName, expected) {
  const actual = extractConstStringArray(source, constantName);
  if (JSON.stringify(actual) !== JSON.stringify(expected)) {
    fail(`${constantName} must remain exact; received ${JSON.stringify(actual)}.`);
  }
}

function validateGeneratedMappingContract(source) {
  const requiredMarkers = [
    'Semantic owners: INT-EXT-013, INT-POS-010, INT-POS-011, INT-POS-013',
    'Contract task: SHELL-CON-022',
    'External received event task: SHELL-CON-019',
    'Canonical sale line task: SHELL-CON-021',
    'Physical persistence owner: INT-DB-004',
    'Source contract SHA256: 89fbd1be5e68ec81239097376a1656eb4722ad6f38f55b1b76bb1f3dd469f474',
    'import type { VentoCredentialEnvironment } from "./external-credential-ref.contract.js";',
    'export type ExternalIdentifierMappingId',
    'export type ExternalIdentifierClass',
    'export type ExternalIdentifierRelationKind',
    'export type ExternalIdentifierMappingState',
    'export interface ExternalIdentifierRef',
    'export type ExternalIdentifierMappingRef = Readonly<{',
    'export interface ExternalIdentifierMapping',
    'readonly external_system_id: string;',
    'readonly environment: VentoCredentialEnvironment;',
    'readonly surface: string;',
    'readonly external_namespace: string;',
    'readonly external_id_class: ExternalIdentifierClass;',
    'readonly external_id_kind: string;',
    'readonly external_id_value: string;',
    'readonly mapping_id: ExternalIdentifierMappingId;',
    'readonly external_ref: ExternalIdentifierRef;',
    'readonly relation_kind: ExternalIdentifierRelationKind;',
    'readonly canonical_resource_type: string | null;',
    'readonly canonical_id: string | null;',
    'readonly mapping_state: ExternalIdentifierMappingState;',
    'readonly resolution_detail: string | null;',
    'readonly evidence_refs: readonly string[];',
    'readonly correlation_refs: readonly string[];',
    'readonly valid_from: string | null;',
    'readonly retired_at: string | null;',
    'readonly predecessor_mapping_ref: ExternalIdentifierMappingRef | null;',
    'readonly successor_mapping_ref: ExternalIdentifierMappingRef | null;',
    'semantics: "STABLE_OPAQUE_NON_SECRET_MAPPING_RELATION_IDENTITY"',
    'serialization: "UNSPECIFIED"',
    'syntax_pattern: null',
    'materialized_id_count: 0',
    'derive_from_external_id_value: false',
    'derive_from_canonical_id: false',
    'same_text_across_namespaces_implies_same_object: false',
    'unconditional_trim_allowed: false',
    'correlation_only_promotes_to_exact_identity_without_new_evidence: false',
    'no_equivalence_is_explicit_decision: true',
    'partially_resolved_authorizes_missing_dimensions: false',
    'retired_releases_history_for_reinterpretation: false',
    'same_namespace_collision_result: "CONFLICT"',
    'matching_uuid_text_is_sufficient: false',
    'file_position_or_source_row_number_is_sufficient: false',
    'class_name: "PROPAGATED_CANONICAL_ID"',
    'message_authenticity_validated_independently: true',
    'exact_relationship_requires_reconstructible_evidence: true',
    'reassignment_requires_successor_relation: true',
    'current_mapping_refs_storage: "GENERIC_STRING_REFERENCES"',
    'typed_target_ref: "ExternalIdentifierMappingRef"',
    'consumer_migration_materialized_here: false',
    'external_event_id_is_mapping_id: false',
    'receipt_id_is_mapping_id: false',
    'mapping_change_reidentifies_sale_line: false',
    'source_row_number_is_external_line_id: false',
    'makos_excel_gains_individual_granularity_from_mapping: false',
    'mapping_id_is_idempotency_key: false',
    'idempotency_contract_task_id: "SHELL-CON-023"',
    'resolved_mapping_implies_authorization: false',
    'unresolved_blocks_identity_dependent_effect: true',
    'ambiguous_blocks_identity_dependent_effect: true',
    'conflict_blocks_identity_dependent_effect: true',
    'disposition_contract_task_id: "SHELL-CON-024"',
    'expected_external_system_count: 21',
    'adopted_external_system_count: 21',
    'missing_external_system_count: 0',
    'duplicate_external_system_count: 0',
    'unique_external_system_id_count: 21',
    'materialized_mapping_id_count: 0',
    'materialized_operational_mapping_count: 0',
    'physical_persistence_owner_task_id: "INT-DB-004"',
    'next_contract_task_id: "SHELL-CON-023"',
    'execution_gate: "PRE_E5_FOUNDATION"',
    'physical_mode: "GLOBAL_ENABLE_ONCE"',
    'public_export_published: false',
    'package_root_index_extended: false',
    'consumer_adoption_materialized: false',
    'runtime_resolution_materialized: false',
    'persistence_materialized: false',
    'migration_materialized: false',
    'supabase_changed: false',
  ];
  for (const marker of requiredMarkers) assertIncludes(source, marker, 'mapping contract');

  validateExactArray(source, 'EXTERNAL_IDENTIFIER_CLASSES', expectedIdentifierClasses);
  validateExactArray(source, 'EXTERNAL_IDENTIFIER_RELATION_KINDS', expectedRelationKinds);
  validateExactArray(source, 'EXTERNAL_IDENTIFIER_MAPPING_STATES', expectedMappingStates);

  const externalRefMatch = source.match(
    /export interface ExternalIdentifierRef \{([\s\S]*?)^\}/mu,
  );
  if (!externalRefMatch) fail('ExternalIdentifierRef interface not found.');
  const externalRefFields = [
    ...externalRefMatch[1].matchAll(/^  readonly ([a-z_]+):/gmu),
  ].map((match) => match[1]);
  const expectedExternalRefFields = [
    'external_system_id',
    'environment',
    'surface',
    'external_namespace',
    'external_id_class',
    'external_id_kind',
    'external_id_value',
  ];
  if (JSON.stringify(externalRefFields) !== JSON.stringify(expectedExternalRefFields)) {
    fail(`ExternalIdentifierRef must remain exact 7-field shape; received ${JSON.stringify(externalRefFields)}.`);
  }

  const mappingMatch = source.match(
    /export interface ExternalIdentifierMapping \{([\s\S]*?)^\}/mu,
  );
  if (!mappingMatch) fail('ExternalIdentifierMapping interface not found.');
  const mappingFields = [
    ...mappingMatch[1].matchAll(/^  readonly ([a-z_]+):/gmu),
  ].map((match) => match[1]);
  const expectedMappingFields = [
    'mapping_id',
    'contract_version',
    'external_ref',
    'relation_kind',
    'canonical_resource_type',
    'canonical_id',
    'mapping_state',
    'resolution_detail',
    'evidence_refs',
    'correlation_refs',
    'valid_from',
    'retired_at',
    'predecessor_mapping_ref',
    'successor_mapping_ref',
  ];
  if (JSON.stringify(mappingFields) !== JSON.stringify(expectedMappingFields)) {
    fail(`ExternalIdentifierMapping must remain exact 14-field shape; received ${JSON.stringify(mappingFields)}.`);
  }

  const mappingRefMatch = source.match(
    /export type ExternalIdentifierMappingRef = Readonly<\{([\s\S]*?)\}>;/u,
  );
  if (!mappingRefMatch) fail('ExternalIdentifierMappingRef type not found.');
  const mappingRefFields = [
    ...mappingRefMatch[1].matchAll(/^  readonly ([a-z_]+):/gmu),
  ].map((match) => match[1]);
  if (JSON.stringify(mappingRefFields) !== JSON.stringify(['mapping_id', 'contract_version'])) {
    fail(`ExternalIdentifierMappingRef must remain exact 2-field shape; received ${JSON.stringify(mappingRefFields)}.`);
  }

  const ids = [
    ...source.matchAll(/external_system_id: "(EXT-SYS-\d{3})"/gu),
  ].map((match) => match[1]);
  const expectedIds = Array.from({ length: 21 }, (_, index) => (
    `EXT-SYS-${String(index + 1).padStart(3, '0')}`
  ));
  if (JSON.stringify(ids) !== JSON.stringify(expectedIds)) {
    fail(`mapping adoption must preserve exact EXT-SYS-001..021 order; received ${JSON.stringify(ids)}.`);
  }
  if (new Set(ids).size !== 21) fail('mapping adoption contains duplicate EXT-SYS identifiers.');

  const specialMarkers = [
    'Wompi',
    'RevenueCat',
    'Expo Push Service',
    'Google Maps / Google Reviews',
    'Apple Wallet / PassKit y APNs',
    'Zebra BrowserPrint',
    'POS externo vigente',
    'Telefonia / voz',
    'TI-INT-003',
    'makos_excel',
  ];
  for (const marker of specialMarkers) assertIncludes(source, marker, 'mapping adoption coverage');

  assertDoesNotMatch(source, /\bexport\s+enum\b/u, 'mapping contract', 'physical enum');
  assertDoesNotMatch(source, /\bExternalIdentifierMappingId\s*=\s*`/u, 'mapping contract', 'invented ID serialization');
  validateNoRuntimeSurface(source, 'mapping contract');
}

function validateDependencyBoundaries(eventSource, lineSource) {
  const eventMarkers = [
    'Contract task: SHELL-CON-019',
    'readonly mapping_refs: readonly string[];',
    'mapping_contract_task_id: "SHELL-CON-022"',
  ];
  for (const marker of eventMarkers) assertIncludes(eventSource, marker, 'SHELL-CON-019 dependency');
  assertDoesNotMatch(
    eventSource,
    /ExternalIdentifierMappingRef/u,
    'SHELL-CON-019 dependency',
    'consumer migration advanced in SHELL-CON-019',
  );

  const lineMarkers = [
    'Contract task: SHELL-CON-021',
    'readonly mapping_refs: readonly string[];',
    'mapping_contract_task_id: "SHELL-CON-022"',
    'next_contract_task_id: "SHELL-CON-022"',
  ];
  for (const marker of lineMarkers) assertIncludes(lineSource, marker, 'SHELL-CON-021 dependency');
  assertDoesNotMatch(
    lineSource,
    /ExternalIdentifierMappingRef/u,
    'SHELL-CON-021 dependency',
    'consumer migration advanced in SHELL-CON-021',
  );
}

function validateInternalIndexBoundary(indexSource) {
  const forbidden = [
    /\bExternalIdentifierMappingId\b/u,
    /\bExternalIdentifierRef\b/u,
    /\bExternalIdentifierMappingRef\b/u,
    /\bExternalIdentifierMapping\b/u,
    /external-identifier-mapping\.contract\.js/u,
  ];
  for (const pattern of forbidden) {
    assertDoesNotMatch(
      indexSource,
      pattern,
      'integrations generated index',
      'SHELL-CON-022 public barrel export',
    );
  }
}

function validatePackageBoundary() {
  const packageJson = JSON.parse(readText(packageJsonPath, '@vento/contracts package.json'));
  if (packageJson.name !== '@vento/contracts') fail('@vento/contracts package name changed.');
  if (packageJson.version !== '1.0.0-alpha.1') fail('@vento/contracts version changed during SHELL-CON-022.');
  if (packageJson.private !== true) fail('@vento/contracts must remain private.');
  if (Object.hasOwn(packageJson, 'exports')) fail('@vento/contracts must not add public exports in SHELL-CON-022.');
}

function validateReadmes() {
  const moduleReadme = readText(integrationsReadmePath, 'integrations README');
  const rootReadme = readText(contractsReadmePath, '@vento/contracts README');

  const moduleMarkers = [
    'SHELL-CON-021::GLOBAL',
    'SHELL-CON-022::GLOBAL',
    '@vento/contracts/integrations',
    'ExternalIdentifierMappingId',
    'ExternalIdentifierRef',
    'ExternalIdentifierMapping',
    'ExternalIdentifierMappingRef',
    '10 clases',
    '7 relaciones',
    '8 estados',
    '7 campos de `ExternalIdentifierRef`',
    '14 campos de nivel superior',
    '2 campos de `ExternalIdentifierMappingRef`',
    'INT-EXT-013',
    'INT-POS-010',
    'INT-POS-011',
    'INT-POS-013',
    'INT-DB-004',
    'EXT-SYS-001..021',
    '21/21',
    'Wompi',
    'RevenueCat',
    'Expo Push Service',
    'place_id',
    'PassKit',
    'Zebra',
    'makos_excel',
    'TI-INT-003',
    'SHELL-CON-023',
    'SHELL-CON-024',
    'PRE_E5_FOUNDATION',
    '0 valores físicos de `ExternalIdentifierMappingId`',
    '0 mappings operativos',
    '0 cambios Supabase',
    '89fbd1be5e68ec81239097376a1656eb4722ad6f38f55b1b76bb1f3dd469f474',
  ];
  for (const marker of moduleMarkers) assertIncludes(moduleReadme, marker, 'integrations README');

  const rootMarkers = [
    '## Módulo de integraciones externas',
    '`SHELL-CON-021::GLOBAL`',
    '`SHELL-CON-022::GLOBAL`',
    '`packages/contracts/integrations`',
    '`@vento/contracts/integrations`',
    '`ExternalIdentifierMappingId`',
    '`ExternalIdentifierRef`',
    '`ExternalIdentifierMapping`',
    '`ExternalIdentifierMappingRef`',
    '10 clases',
    '7 relaciones',
    '8 estados',
    '21/21',
    '`INT-EXT-013`',
    '`INT-DB-004`',
    '`makos_excel`',
    '`SHELL-CON-023`',
    '`SHELL-CON-024`',
    '0 valores físicos de `ExternalIdentifierMappingId`',
    '0 mappings operativos',
    '0 cambios Supabase',
  ];
  for (const marker of rootMarkers) assertIncludes(rootReadme, marker, '@vento/contracts README');

  const staleReservations = [
    '`SHELL-CON-022`, `SHELL-CON-023` y `SHELL-CON-024` conservan respectivamente mapping compartido',
    '`SHELL-CON-022` conserva en exclusiva el contrato compartido de mapping',
  ];
  for (const marker of staleReservations) {
    if (moduleReadme.includes(marker) || rootReadme.includes(marker)) {
      fail(`README still declares SHELL-CON-022 as reserved: ${marker}`);
    }
  }
}

export function validateExternalIdentifierMappingContract() {
  const freshness = generateExternalIdentifierMappingContract({ checkOnly: true });
  const mappingSource = readText(mappingContractPath, 'external identifier mapping contract');
  const eventSource = readText(externalReceivedEventContractPath, 'external received event contract');
  const lineSource = readText(canonicalSaleLineContractPath, 'canonical sale line contract');
  const indexSource = readText(generatedIndexPath, 'integrations generated index');

  validateGeneratedMappingContract(mappingSource);
  validateDependencyBoundaries(eventSource, lineSource);
  validateInternalIndexBoundary(indexSource);
  validatePackageBoundary();
  validateReadmes();

  return Object.freeze({
    identifierClassCount: freshness.identifierClassCount,
    relationKindCount: freshness.relationKindCount,
    mappingStateCount: freshness.mappingStateCount,
    externalSystemCount: freshness.externalSystemCount,
    materializedMappingIds: freshness.materializedMappingIds,
    materializedOperationalMappings: freshness.materializedOperationalMappings,
  });
}

function runCli() {
  try {
    const result = validateExternalIdentifierMappingContract();
    console.log('[VENTO CONTRACTS] EXTERNAL IDENTIFIER MAPPING VALIDATION PASS');
    console.log(`[VENTO CONTRACTS] IDENTIFIER_CLASSES ${result.identifierClassCount}`);
    console.log(`[VENTO CONTRACTS] RELATION_KINDS ${result.relationKindCount}`);
    console.log(`[VENTO CONTRACTS] MAPPING_STATES ${result.mappingStateCount}`);
    console.log(`[VENTO CONTRACTS] EXTERNAL_SYSTEMS ${result.externalSystemCount}`);
    console.log('');
    console.log('=== RESULTADO PARA CHATGPT ===');
    console.log('ESTADO: PASS');
    console.log('OPERACION: EXTERNAL_IDENTIFIER_MAPPING_CONTRACT_VALIDATE');
    console.log(`IDENTIFIER_CLASSES: ${result.identifierClassCount}`);
    console.log(`RELATION_KINDS: ${result.relationKindCount}`);
    console.log(`MAPPING_STATES: ${result.mappingStateCount}`);
    console.log(`EXTERNAL_SYSTEMS: ${result.externalSystemCount}`);
    console.log(`MATERIALIZED_MAPPING_IDS: ${result.materializedMappingIds}`);
    console.log(`MATERIALIZED_OPERATIONAL_MAPPINGS: ${result.materializedOperationalMappings}`);
    console.log('DEPENDENCY_BOUNDARY: PASS');
    console.log('PACKAGE_BOUNDARY: PASS');
    console.log('INTERNAL_INDEX_BOUNDARY: PASS');
    console.log('README_BOUNDARY: PASS');
    console.log('RUNTIME_SECRET_BOUNDARY: PASS');
    console.log('=== FIN RESULTADO PARA CHATGPT ===');
  } catch (error) {
    const message = error instanceof Error ? error.message : String(error);
    console.error('[VENTO CONTRACTS] EXTERNAL IDENTIFIER MAPPING VALIDATION FAIL');
    console.error(message);
    console.error('');
    console.error('=== RESULTADO PARA CHATGPT ===');
    console.error('ESTADO: FAIL');
    console.error('OPERACION: EXTERNAL_IDENTIFIER_MAPPING_CONTRACT_VALIDATE');
    console.error(`ERROR: ${message}`);
    console.error('=== FIN RESULTADO PARA CHATGPT ===');
    process.exitCode = 1;
  }
}

if (process.argv[1] && path.resolve(process.argv[1]) === currentFile) runCli();
