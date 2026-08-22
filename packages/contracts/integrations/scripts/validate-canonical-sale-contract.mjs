import fs from 'node:fs';
import path from 'node:path';
import { fileURLToPath } from 'node:url';

import {
  generateCanonicalSaleContract,
} from './generate-canonical-sale-contract.mjs';

const currentFile = fileURLToPath(import.meta.url);
const scriptDirectory = path.dirname(currentFile);
const integrationsRoot = path.resolve(scriptDirectory, '..');
const contractsRoot = path.resolve(integrationsRoot, '..');

const canonicalSaleContractPath = path.join(
  integrationsRoot,
  'generated',
  'canonical-sale.contract.ts',
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

function validateGeneratedCanonicalSaleContract(contractSource) {
  const requiredMarkers = [
    'Semantic owners: INT-POS-005, INT-SALES-001',
    'Contract task: SHELL-CON-020',
    'External received event task: SHELL-CON-019',
    'Line contract task: SHELL-CON-021',
    'Source contract SHA256: 5495541814c4bf5387462d98e638c9f25dbd128dc94706e7bbba7317a7f75182',
    'export type CanonicalSaleId',
    'export interface CanonicalSale<TSaleLine>',
    'readonly sale_id: CanonicalSaleId;',
    'readonly contract_version: string;',
    'readonly source_system: string;',
    'readonly source_instance_ref: string | null;',
    'readonly source_sale_id: string;',
    'readonly source_revision: string | null;',
    'readonly site_ref: string;',
    'readonly terminal_ref: string | null;',
    'readonly cash_session_ref: string | null;',
    'readonly occurred_at: string;',
    'readonly commercial_state: string;',
    'readonly customer_ref: string | null;',
    'readonly order_ref: string | null;',
    'readonly fiscal_document_ref: string | null;',
    'readonly payment_refs: readonly string[];',
    'readonly monetary_snapshot: {',
    'readonly currency_ref: string;',
    'readonly subtotal: unknown;',
    'readonly discount_total: unknown;',
    'readonly tax_total: unknown;',
    'readonly tip_total: unknown;',
    'readonly total: unknown;',
    'readonly lines: readonly [TSaleLine, ...TSaleLine[]];',
    'readonly provenance_refs: readonly string[];',
    'readonly correlation_refs: readonly string[];',
    'readonly recorded_actor_ref: string | null;',
    'readonly recorded_principal_ref: string | null;',
    'readonly recorded_at: string;',
    'semantics: "STABLE_OPAQUE_NON_SECRET_CANONICAL_SALE_IDENTITY"',
    'serialization: "UNSPECIFIED"',
    'syntax_pattern: null',
    'stable_across_retry_replay_backfill_and_revision: true',
    'external_event_id_is_sale_id: false',
    'receipt_id_is_sale_id: false',
    'sale_is_order: false',
    'sale_is_payment: false',
    'sale_is_inventory_movement: false',
    'sale_is_loyalty_movement: false',
    'sale_is_economic_fact: false',
    'sale_is_provider_payload: false',
    'external_assertion_is_sale_without_owner_validation: false',
    'source_system_is_actual_business_source: true',
    'historical_makos_sale_remains_makos: true',
    'pulso_is_source_only_under_approved_authority: true',
    'source_sale_id_fabrication_from_aggregate_allowed: false',
    'source_revision_fabrication_allowed: false',
    'occurred_at_is_recorded_at: false',
    'commercial_state_derived_from_payment_state: false',
    'snapshot_is_historical: true',
    'scalar_representation: "UNSPECIFIED"',
    'decimal_precision: "UNSPECIFIED"',
    'minimum_line_count_for_complete_sale: 1',
    'line_contract_task_id: "SHELL-CON-021"',
    'line_shape_materialized_here: false',
    'customer_ref_optional: true',
    'mapping_contract_task_id: "SHELL-CON-022"',
    'idempotency_contract_task_id: "SHELL-CON-023"',
    'disposition_contract_task_id: "SHELL-CON-024"',
    'revision_preserves_sale_id: true',
    'retry_preserves_sale_id: true',
    'replay_preserves_sale_id: true',
    'incompatible_identity_reuse_result: "CONFLICT"',
    'at_least_one_line_required: true',
    'secret_material_allowed: false',
    'raw_external_payload_allowed_by_default: false',
    'logical_namespace: "@vento/contracts/integrations"',
    'contract_task_id: "SHELL-CON-020"',
    'semantic_owner_task_ids: ["INT-POS-005", "INT-SALES-001"]',
    'external_received_event_contract_task_id: "SHELL-CON-019"',
    'next_contract_task_id: "SHELL-CON-021"',
    'execution_gate: "PRE_E5_FOUNDATION"',
    'physical_mode: "GLOBAL_ENABLE_ONCE"',
    'public_export_published: false',
    'package_root_index_extended: false',
    'consumer_adoption_materialized: false',
    'runtime_sale_creation_materialized: false',
    'persistence_materialized: false',
    'business_event_emission_materialized: false',
    'downstream_effect_materialized: false',
    'line_contract_materialized: false',
    'supabase_changed: false',
    'materialized_sale_instance_count: 0',
  ];

  for (const marker of requiredMarkers) {
    assertIncludes(contractSource, marker, 'canonical sale contract');
  }

  const interfaceMatch = contractSource.match(
    /export interface CanonicalSale<TSaleLine> \{([\s\S]*?)^\}/mu,
  );
  if (!interfaceMatch) {
    fail('CanonicalSale interface not found.');
  }

  const expectedFields = [
    'sale_id',
    'contract_version',
    'source_system',
    'source_instance_ref',
    'source_sale_id',
    'source_revision',
    'site_ref',
    'terminal_ref',
    'cash_session_ref',
    'occurred_at',
    'commercial_state',
    'customer_ref',
    'order_ref',
    'fiscal_document_ref',
    'payment_refs',
    'monetary_snapshot',
    'lines',
    'provenance_refs',
    'correlation_refs',
    'recorded_actor_ref',
    'recorded_principal_ref',
    'recorded_at',
  ];
  const actualFields = [
    ...interfaceMatch[1].matchAll(/^  readonly ([a-z_]+):/gmu),
  ].map((match) => match[1]);

  if (JSON.stringify(actualFields) !== JSON.stringify(expectedFields)) {
    fail(
      `CanonicalSale fields must remain exact 22-field logical shape; `
      + `received ${JSON.stringify(actualFields)}.`,
    );
  }

  const monetaryMatch = interfaceMatch[1].match(
    /^  readonly monetary_snapshot: \{([\s\S]*?)^  \};/mu,
  );
  if (!monetaryMatch) {
    fail('CanonicalSale monetary_snapshot not found.');
  }

  const expectedMonetaryFields = [
    'currency_ref',
    'subtotal',
    'discount_total',
    'tax_total',
    'tip_total',
    'total',
  ];
  const actualMonetaryFields = [
    ...monetaryMatch[1].matchAll(/^    readonly ([a-z_]+):/gmu),
  ].map((match) => match[1]);

  if (
    JSON.stringify(actualMonetaryFields)
    !== JSON.stringify(expectedMonetaryFields)
  ) {
    fail(
      `CanonicalSale monetary_snapshot fields must remain exact 6-field shape; `
      + `received ${JSON.stringify(actualMonetaryFields)}.`,
    );
  }

  const forbiddenLineFields = [
    /\n  readonly line_id:/u,
    /\n  readonly product_ref:/u,
    /\n  readonly presentation_ref:/u,
    /\n  readonly recipe_ref:/u,
    /\n  readonly quantity:/u,
    /\n  readonly unit_price:/u,
    /\n  readonly line_total:/u,
  ];

  for (const pattern of forbiddenLineFields) {
    assertDoesNotMatch(
      interfaceMatch[1],
      pattern,
      'CanonicalSale interface',
      `SHELL-CON-021 line field ${pattern.source}`,
    );
  }

  validateNoRuntimeSurface(contractSource, 'canonical sale contract');
}

function validatePackageBoundary() {
  const packageJson = JSON.parse(
    readText(packageJsonPath, '@vento/contracts package.json'),
  );

  if (packageJson.name !== '@vento/contracts') {
    fail('@vento/contracts package name changed.');
  }
  if (packageJson.version !== '1.0.0-alpha.1') {
    fail('@vento/contracts version changed during SHELL-CON-020.');
  }
  if (packageJson.private !== true) {
    fail('@vento/contracts must remain private.');
  }
  if (Object.hasOwn(packageJson, 'exports')) {
    fail('@vento/contracts must not add public exports in SHELL-CON-020.');
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
    'SHELL-CON-019::GLOBAL',
    'SHELL-CON-020::GLOBAL',
    '@vento/contracts/integrations',
    'CanonicalSaleId',
    'CanonicalSale<TSaleLine>',
    '22 campos de nivel superior',
    '6 componentes del `monetary_snapshot`',
    'al menos una línea',
    'TSaleLine',
    'INT-POS-005',
    'INT-SALES-001',
    'Makos',
    'PULSO',
    'source_system',
    'source_sale_id',
    'source_revision',
    'occurred_at',
    'recorded_at',
    'SHELL-CON-021',
    'SHELL-CON-022',
    'SHELL-CON-023',
    'SHELL-CON-024',
    'PRE_E5_FOUNDATION',
    '0 ventas operativas',
    '0 cambios Supabase',
    '5495541814c4bf5387462d98e638c9f25dbd128dc94706e7bbba7317a7f75182',
  ];

  for (const marker of moduleMarkers) {
    assertIncludes(moduleReadme, marker, 'integrations README');
  }

  const rootMarkers = [
    '## Módulo de integraciones externas',
    '`SHELL-CON-020::GLOBAL`',
    '`packages/contracts/integrations`',
    '`@vento/contracts/integrations`',
    '`CanonicalSaleId`',
    '`CanonicalSale<TSaleLine>`',
    '22 campos de nivel superior',
    '6 componentes monetarios',
    '`TSaleLine`',
    '`INT-POS-005`',
    '`INT-SALES-001`',
    'Makos',
    'PULSO',
    '`SHELL-CON-021`',
    '`SHELL-CON-022`',
    '`SHELL-CON-023`',
    '`SHELL-CON-024`',
    '0 ventas operativas',
    '0 cambios Supabase',
  ];

  for (const marker of rootMarkers) {
    assertIncludes(rootReadme, marker, '@vento/contracts README');
  }

  const staleReservations = [
    '`SHELL-CON-020` permanece como responsabilidad separada del contrato canónico de venta',
    '`SHELL-CON-020` conserva en exclusiva el contrato canónico de venta',
  ];
  for (const marker of staleReservations) {
    if (moduleReadme.includes(marker) || rootReadme.includes(marker)) {
      fail(`README still declares SHELL-CON-020 as reserved: ${marker}`);
    }
  }
}

export function validateCanonicalSaleContract() {
  const freshness = generateCanonicalSaleContract({ checkOnly: true });
  const contractSource = readText(
    canonicalSaleContractPath,
    'canonical sale contract',
  );

  validateGeneratedCanonicalSaleContract(contractSource);
  validatePackageBoundary();
  validateReadmes();

  return {
    logicalFieldCount: freshness.logicalFieldCount,
    monetarySnapshotFieldCount: freshness.monetarySnapshotFieldCount,
    minimumLineCount: freshness.minimumLineCount,
    materializedSaleInstances: freshness.materializedSaleInstances,
  };
}

function runCli() {
  try {
    const result = validateCanonicalSaleContract();

    console.log('[VENTO CONTRACTS] CANONICAL SALE VALIDATION PASS');
    console.log(`[VENTO CONTRACTS] SALE_LOGICAL_FIELDS ${result.logicalFieldCount}`);
    console.log(
      `[VENTO CONTRACTS] SALE_MONETARY_FIELDS `
      + `${result.monetarySnapshotFieldCount}`,
    );
    console.log(`[VENTO CONTRACTS] SALE_MINIMUM_LINES ${result.minimumLineCount}`);
    console.log(
      `[VENTO CONTRACTS] MATERIALIZED_SALE_INSTANCES `
      + `${result.materializedSaleInstances}`,
    );
    console.log('');
    console.log('=== RESULTADO PARA CHATGPT ===');
    console.log('ESTADO: PASS');
    console.log('OPERACION: CANONICAL_SALE_CONTRACT_VALIDATE');
    console.log(`SALE_LOGICAL_FIELDS: ${result.logicalFieldCount}`);
    console.log(`SALE_MONETARY_FIELDS: ${result.monetarySnapshotFieldCount}`);
    console.log(`SALE_MINIMUM_LINES: ${result.minimumLineCount}`);
    console.log(`MATERIALIZED_SALE_INSTANCES: ${result.materializedSaleInstances}`);
    console.log('PACKAGE_BOUNDARY: PASS');
    console.log('README_BOUNDARY: PASS');
    console.log('RUNTIME_BOUNDARY: PASS');
    console.log('LINE_CONTRACT_NOT_ADVANCED: PASS');
    console.log('=== FIN RESULTADO PARA CHATGPT ===');
  } catch (error) {
    const message = error instanceof Error ? error.message : String(error);

    console.error('[VENTO CONTRACTS] CANONICAL SALE VALIDATION FAIL');
    console.error(message);
    console.error('');
    console.error('=== RESULTADO PARA CHATGPT ===');
    console.error('ESTADO: FAIL');
    console.error('OPERACION: CANONICAL_SALE_CONTRACT_VALIDATE');
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