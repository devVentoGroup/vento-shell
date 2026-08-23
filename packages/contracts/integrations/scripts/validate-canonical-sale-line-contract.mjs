import fs from 'node:fs';
import path from 'node:path';
import { fileURLToPath } from 'node:url';

import {
  generateCanonicalSaleLineContract,
} from './generate-canonical-sale-line-contract.mjs';

const currentFile = fileURLToPath(import.meta.url);
const scriptDirectory = path.dirname(currentFile);
const integrationsRoot = path.resolve(scriptDirectory, '..');
const contractsRoot = path.resolve(integrationsRoot, '..');

const canonicalSaleContractPath = path.join(
  integrationsRoot,
  'generated',
  'canonical-sale.contract.ts',
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

function validateGeneratedCanonicalSaleLineContract(contractSource) {
  const requiredMarkers = [
    'Semantic owners: INT-POS-005..013, INT-SALES-001',
    'Contract task: SHELL-CON-021',
    'Sale contract task: SHELL-CON-020',
    'Mapping contract task: SHELL-CON-022',
    'Source contract SHA256: f4ac39874bfa4864973cdf52f63c2519f03cdbf1519afca93a1cb6dcc6fdf802',
    'import type { CanonicalSaleId } from "./canonical-sale.contract.js";',
    'export type CanonicalSaleLineId',
    'export interface CanonicalSaleLine',
    'readonly sale_line_id: CanonicalSaleLineId;',
    'readonly sale_id: CanonicalSaleId;',
    'readonly source_line_id: string | null;',
    'readonly source_line_sequence: unknown | null;',
    'readonly source_line_revision: string | null;',
    'readonly sold_item_ref: string;',
    'readonly product_ref: string | null;',
    'readonly presentation_ref: string | null;',
    'readonly recipe_ref: string | null;',
    'readonly mapping_refs: readonly string[];',
    'readonly quantity: unknown;',
    'readonly unit_ref: string | null;',
    'readonly monetary_snapshot: {',
    'readonly currency_ref: string;',
    'readonly applied_unit_price: unknown;',
    'readonly line_subtotal: unknown;',
    'readonly discount_total: unknown;',
    'readonly tax_total: unknown;',
    'readonly tip_total: unknown;',
    'readonly line_total: unknown;',
    'readonly source_line_state: string | null;',
    'readonly canonical_line_state: string | null;',
    'readonly line_state_mapping_result: string;',
    'readonly line_occurred_at: string | null;',
    'readonly provenance_refs: readonly string[];',
    'readonly correlation_refs: readonly string[];',
    'semantics: "STABLE_OPAQUE_NON_SECRET_CANONICAL_SALE_LINE_IDENTITY"',
    'serialization: "UNSPECIFIED"',
    'syntax_pattern: null',
    'materialized_id_count: 0',
    'changes_on_mapping_resolution: false',
    'changes_on_retry_replay_or_late_sync: false',
    'incompatible_identity_reuse_result: "CONFLICT"',
    'exactly_one_sale_required: true',
    'sale_line_id_is_sale_id: false',
    'sale_id_type: "CanonicalSaleId"',
    'source_line_id_fabrication_allowed: false',
    'source_line_sequence_is_universal_identity: false',
    'sold_item_ref_is_product_ref: false',
    'product_ref_required_before_product_dependent_effect: true',
    'mapping_contract_task_id: "SHELL-CON-022"',
    'quantity_required: true',
    'commercial_quantity_is_inventory_quantity: false',
    'negative_quantity_means_return_or_compensation: false',
    'snapshot_is_historical: true',
    'default_currency: null',
    'header_discount_prorated_by_inference: false',
    'unknown_value_becomes_zero: false',
    'absent_state_defaults_to_active: false',
    'approved_minimum_active_semantics: "ACTIVE"',
    'approved_minimum_cancelled_semantics: "CANCELLED"',
    'mapped_result_semantics: "MAPPED"',
    'not_provided_result_semantics: "NOT_PROVIDED"',
    'unresolved_result_semantics: "UNRESOLVED"',
    'executable_state_enum_materialized: false',
    'line_occurred_at_conditional: true',
    'sale_occurred_at_copied_as_line_time_by_default: false',
    'raw_payload_copied_by_default: false',
    'structural_line_allows_pending_product_mapping: true',
    'active_quarantine_blocks_applicable_effect: true',
    'eligibility_executes_effect: false',
    'line_is_inventory_movement: false',
    'line_is_economic_fact: false',
    'line_is_loyalty_movement: false',
    'makos_excel_aggregate_row_is_individual_sale_line: false',
    'row_number_is_sale_line_id: false',
    'individual_line_requires_individual_sale_and_line_granularity: true',
    'secret_material_allowed: false',
    'raw_external_payload_allowed_by_default: false',
    'logical_namespace: "@vento/contracts/integrations"',
    'contract_task_id: "SHELL-CON-021"',
    'sale_contract_task_id: "SHELL-CON-020"',
    'idempotency_contract_task_id: "SHELL-CON-023"',
    'disposition_contract_task_id: "SHELL-CON-024"',
    'next_contract_task_id: "SHELL-CON-022"',
    'execution_gate: "PRE_E5_FOUNDATION"',
    'physical_mode: "GLOBAL_ENABLE_ONCE"',
    'public_export_published: false',
    'package_root_index_extended: false',
    'consumer_adoption_materialized: false',
    'runtime_sale_line_creation_materialized: false',
    'persistence_materialized: false',
    'mapping_runtime_materialized: false',
    'quarantine_runtime_materialized: false',
    'downstream_effect_materialized: false',
    'supabase_changed: false',
    'materialized_sale_line_instance_count: 0',
  ];

  for (const marker of requiredMarkers) {
    assertIncludes(contractSource, marker, 'canonical sale line contract');
  }

  const interfaceMatch = contractSource.match(
    /export interface CanonicalSaleLine \{([\s\S]*?)^\}/mu,
  );
  if (!interfaceMatch) {
    fail('CanonicalSaleLine interface not found.');
  }

  const expectedFields = [
    'sale_line_id',
    'sale_id',
    'contract_version',
    'source_line_id',
    'source_line_sequence',
    'source_line_revision',
    'sold_item_ref',
    'product_ref',
    'presentation_ref',
    'recipe_ref',
    'mapping_refs',
    'quantity',
    'unit_ref',
    'monetary_snapshot',
    'source_line_state',
    'canonical_line_state',
    'line_state_mapping_result',
    'line_occurred_at',
    'provenance_refs',
    'correlation_refs',
  ];
  const actualFields = [
    ...interfaceMatch[1].matchAll(/^  readonly ([a-z_]+):/gmu),
  ].map((match) => match[1]);

  if (JSON.stringify(actualFields) !== JSON.stringify(expectedFields)) {
    fail(
      `CanonicalSaleLine fields must remain exact 20-field logical shape; `
      + `received ${JSON.stringify(actualFields)}.`,
    );
  }

  const monetaryMatch = interfaceMatch[1].match(
    /^  readonly monetary_snapshot: \{([\s\S]*?)^  \};/mu,
  );
  if (!monetaryMatch) {
    fail('CanonicalSaleLine monetary_snapshot not found.');
  }

  const expectedMonetaryFields = [
    'currency_ref',
    'applied_unit_price',
    'line_subtotal',
    'discount_total',
    'tax_total',
    'tip_total',
    'line_total',
  ];
  const actualMonetaryFields = [
    ...monetaryMatch[1].matchAll(/^    readonly ([a-z_]+):/gmu),
  ].map((match) => match[1]);

  if (JSON.stringify(actualMonetaryFields) !== JSON.stringify(expectedMonetaryFields)) {
    fail(
      `CanonicalSaleLine monetary_snapshot fields must remain exact 7-field shape; `
      + `received ${JSON.stringify(actualMonetaryFields)}.`,
    );
  }

  const interfaceBody = interfaceMatch[1];
  const forbiddenHeaderFields = [
    /\n  readonly source_system:/u,
    /\n  readonly source_instance_ref:/u,
    /\n  readonly site_ref:/u,
    /\n  readonly terminal_ref:/u,
    /\n  readonly cash_session_ref:/u,
    /\n  readonly customer_ref:/u,
    /\n  readonly order_ref:/u,
    /\n  readonly fiscal_document_ref:/u,
    /\n  readonly payment_refs:/u,
    /\n  readonly recorded_at:/u,
  ];
  for (const pattern of forbiddenHeaderFields) {
    assertDoesNotMatch(
      interfaceBody,
      pattern,
      'CanonicalSaleLine interface',
      `duplicated sale header field ${pattern.source}`,
    );
  }

  assertDoesNotMatch(
    contractSource,
    /\bexport\s+enum\b/u,
    'canonical sale line contract',
    'physical enum',
  );
  assertDoesNotMatch(
    interfaceBody,
    /readonly\s+(?:quantity|applied_unit_price|line_subtotal|discount_total|tax_total|tip_total|line_total):\s*number\b/u,
    'CanonicalSaleLine interface',
    'invented numeric scalar',
  );

  validateNoRuntimeSurface(contractSource, 'canonical sale line contract');
}

function validateCanonicalSaleDependency(saleSource) {
  const requiredMarkers = [
    'Contract task: SHELL-CON-020',
    'Source contract SHA256: 5495541814c4bf5387462d98e638c9f25dbd128dc94706e7bbba7317a7f75182',
    'export type CanonicalSaleId',
    'export interface CanonicalSale<TSaleLine>',
    'readonly lines: readonly [TSaleLine, ...TSaleLine[]];',
    'line_contract_task_id: "SHELL-CON-021"',
    'line_shape_materialized_here: false',
    'line_public_identity_materialized_here: false',
    'next_contract_task_id: "SHELL-CON-021"',
  ];

  for (const marker of requiredMarkers) {
    assertIncludes(saleSource, marker, 'canonical sale dependency');
  }
}

function validateInternalIndexBoundary(indexSource) {
  const forbidden = [
    /\bCanonicalSaleLineId\b/u,
    /\bCanonicalSaleLine\b/u,
    /canonical-sale-line\.contract\.js/u,
  ];

  for (const pattern of forbidden) {
    assertDoesNotMatch(
      indexSource,
      pattern,
      'integrations generated index',
      'SHELL-CON-021 public barrel export',
    );
  }
}

function validatePackageBoundary() {
  const packageJson = JSON.parse(readText(packageJsonPath, '@vento/contracts package.json'));

  if (packageJson.name !== '@vento/contracts') {
    fail('@vento/contracts package name changed.');
  }
  if (packageJson.version !== '1.0.0-alpha.1') {
    fail('@vento/contracts version changed during SHELL-CON-021.');
  }
  if (packageJson.private !== true) {
    fail('@vento/contracts must remain private.');
  }
  if (Object.hasOwn(packageJson, 'exports')) {
    fail('@vento/contracts must not add public exports in SHELL-CON-021.');
  }
}

function validateReadmes() {
  const moduleReadme = readText(integrationsReadmePath, 'integrations README');
  const rootReadme = readText(contractsReadmePath, '@vento/contracts README');

  const moduleMarkers = [
    'SHELL-CON-021::GLOBAL',
    '@vento/contracts/integrations',
    'CanonicalSaleLineId',
    'CanonicalSaleLine',
    'CanonicalSale<CanonicalSaleLine>',
    '20 campos de nivel superior',
    '7 componentes del `monetary_snapshot`',
    'sale_line_id',
    'sale_id',
    'source_line_id',
    'source_line_sequence',
    'source_line_revision',
    'sold_item_ref',
    'product_ref',
    'presentation_ref',
    'recipe_ref',
    'mapping_refs',
    'quantity',
    'unit_ref',
    'source_line_state',
    'canonical_line_state',
    'line_state_mapping_result',
    'line_occurred_at',
    'ACTIVE',
    'CANCELLED',
    'MAPPED',
    'NOT_PROVIDED',
    'UNRESOLVED',
    'makos_excel',
    'INT-POS-005..013',
    'INT-SALES-001',
    'SHELL-CON-022',
    'SHELL-CON-023',
    'SHELL-CON-024',
    'PRE_E5_FOUNDATION',
    '0 valores físicos de `CanonicalSaleLineId`',
    '0 líneas operativas',
    '0 cambios Supabase',
    'f4ac39874bfa4864973cdf52f63c2519f03cdbf1519afca93a1cb6dcc6fdf802',
  ];

  for (const marker of moduleMarkers) {
    assertIncludes(moduleReadme, marker, 'integrations README');
  }

  const rootMarkers = [
    '## Módulo de integraciones externas',
    '`SHELL-CON-021::GLOBAL`',
    '`packages/contracts/integrations`',
    '`@vento/contracts/integrations`',
    '`CanonicalSaleLineId`',
    '`CanonicalSaleLine`',
    '`CanonicalSale<CanonicalSaleLine>`',
    '20 campos de nivel superior',
    '7 componentes monetarios',
    '`INT-POS-005..013`',
    '`INT-SALES-001`',
    '`makos_excel`',
    '`SHELL-CON-022`',
    '`SHELL-CON-023`',
    '`SHELL-CON-024`',
    '0 valores físicos de `CanonicalSaleLineId`',
    '0 líneas operativas',
    '0 cambios Supabase',
  ];

  for (const marker of rootMarkers) {
    assertIncludes(rootReadme, marker, '@vento/contracts README');
  }

  const staleReservations = [
    '`SHELL-CON-021` conserva en exclusiva la identidad y forma compartida de línea de venta',
    '`SHELL-CON-021` conserva la identidad y forma compartida de línea de venta',
  ];
  for (const marker of staleReservations) {
    if (moduleReadme.includes(marker) || rootReadme.includes(marker)) {
      fail(`README still declares SHELL-CON-021 as reserved: ${marker}`);
    }
  }
}

export function validateCanonicalSaleLineContract() {
  const freshness = generateCanonicalSaleLineContract({ checkOnly: true });
  const lineSource = readText(
    canonicalSaleLineContractPath,
    'canonical sale line contract',
  );
  const saleSource = readText(canonicalSaleContractPath, 'canonical sale contract');
  const indexSource = readText(generatedIndexPath, 'integrations generated index');

  validateGeneratedCanonicalSaleLineContract(lineSource);
  validateCanonicalSaleDependency(saleSource);
  validateInternalIndexBoundary(indexSource);
  validatePackageBoundary();
  validateReadmes();

  return {
    logicalFieldCount: freshness.logicalFieldCount,
    monetarySnapshotFieldCount: freshness.monetarySnapshotFieldCount,
    materializedSaleLineIds: freshness.materializedSaleLineIds,
    materializedSaleLineInstances: freshness.materializedSaleLineInstances,
  };
}

function runCli() {
  try {
    const result = validateCanonicalSaleLineContract();

    console.log('[VENTO CONTRACTS] CANONICAL SALE LINE VALIDATION PASS');
    console.log(`[VENTO CONTRACTS] SALE_LINE_LOGICAL_FIELDS ${result.logicalFieldCount}`);
    console.log(
      `[VENTO CONTRACTS] SALE_LINE_MONETARY_FIELDS `
      + `${result.monetarySnapshotFieldCount}`,
    );
    console.log(
      `[VENTO CONTRACTS] MATERIALIZED_SALE_LINE_IDS ${result.materializedSaleLineIds}`,
    );
    console.log(
      `[VENTO CONTRACTS] MATERIALIZED_SALE_LINE_INSTANCES `
      + `${result.materializedSaleLineInstances}`,
    );
    console.log('');
    console.log('=== RESULTADO PARA CHATGPT ===');
    console.log('ESTADO: PASS');
    console.log('OPERACION: CANONICAL_SALE_LINE_CONTRACT_VALIDATE');
    console.log(`SALE_LINE_LOGICAL_FIELDS: ${result.logicalFieldCount}`);
    console.log(`SALE_LINE_MONETARY_FIELDS: ${result.monetarySnapshotFieldCount}`);
    console.log(`MATERIALIZED_SALE_LINE_IDS: ${result.materializedSaleLineIds}`);
    console.log(
      `MATERIALIZED_SALE_LINE_INSTANCES: ${result.materializedSaleLineInstances}`,
    );
    console.log('SALE_DEPENDENCY: PASS');
    console.log('PACKAGE_BOUNDARY: PASS');
    console.log('INTERNAL_INDEX_BOUNDARY: PASS');
    console.log('README_BOUNDARY: PASS');
    console.log('RUNTIME_SECRET_BOUNDARY: PASS');
    console.log('=== FIN RESULTADO PARA CHATGPT ===');
  } catch (error) {
    const message = error instanceof Error ? error.message : String(error);
    console.error('[VENTO CONTRACTS] CANONICAL SALE LINE VALIDATION FAIL');
    console.error(message);
    console.error('');
    console.error('=== RESULTADO PARA CHATGPT ===');
    console.error('ESTADO: FAIL');
    console.error('OPERACION: CANONICAL_SALE_LINE_CONTRACT_VALIDATE');
    console.error(`ERROR: ${message}`);
    console.error('=== FIN RESULTADO PARA CHATGPT ===');
    process.exitCode = 1;
  }
}

if (process.argv[1] && path.resolve(process.argv[1]) === currentFile) {
  runCli();
}
