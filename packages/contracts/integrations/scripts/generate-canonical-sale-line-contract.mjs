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

const shellCon020SourceContractSha256 =
  '5495541814c4bf5387462d98e638c9f25dbd128dc94706e7bbba7317a7f75182';
const shellCon021SourceContractSha256 =
  'f4ac39874bfa4864973cdf52f63c2519f03cdbf1519afca93a1cb6dcc6fdf802';

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
  const normalized = normalizeEol(source);
  const lines = normalized.split('\n');
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
    if (match) {
      starts.push({ index, id: match.groups.id });
    }
  });

  const taskIndex = starts.findIndex((entry) => entry.id === taskId);
  if (taskIndex < 0) {
    fail(`Canonical task ${taskId} not found.`);
  }

  const start = starts[taskIndex].index;
  const end = starts[taskIndex + 1]?.index ?? lines.length;
  return lines.slice(start, end).join('\n');
}

function validateReconciliation(shellSource) {
  const requiredMarkers = [
    '<!-- EXECUTION-GATE-RECONCILIATION:B001-200:SHELL-CON-017-024 -->',
    '`GLOBAL_ENABLE_ONCE`',
    '`PRE_E5_FOUNDATION`',
    '`<task_id>::GLOBAL`',
  ];

  for (const marker of requiredMarkers) {
    if (!shellSource.includes(marker)) {
      fail(`SHELL-CON reconciliation is missing marker: ${marker}`);
    }
  }
}

function validateShellCon021(shellSource) {
  const task = extractTaskSection(shellSource, 'SHELL-CON-021');
  const actualSourceHash = sha256(task);

  if (actualSourceHash !== shellCon021SourceContractSha256) {
    fail(
      `SHELL-CON-021 source contract SHA256 mismatch: `
      + `expected ${shellCon021SourceContractSha256}, received ${actualSourceHash}.`,
    );
  }

  const requiredTaskMarkers = [
    '@vento/contracts/integrations',
    'CanonicalSaleLineId',
    'CanonicalSaleLine',
    'CanonicalSale<CanonicalSaleLine>',
    'sale_line_id',
    'sale_id',
    'source_line_id',
    'source_line_sequence',
    'source_line_revision',
    'sold_item_ref',
    'product_ref',
    'presentation_ref',
    'recipe_ref',
    'mapping_refs[]',
    'quantity',
    'unit_ref',
    'monetary_snapshot',
    'applied_unit_price',
    'line_subtotal',
    'source_line_state',
    'canonical_line_state',
    'line_state_mapping_result',
    'line_occurred_at',
    'provenance_refs[]',
    'correlation_refs[]',
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
    'NO GENERA REQUISITOS DE PRUEBA',
  ];

  for (const marker of requiredTaskMarkers) {
    if (!task.includes(marker)) {
      fail(`SHELL-CON-021 is missing required content: ${marker}`);
    }
  }

  return task;
}

function validateCanonicalSaleDependency(contractSource) {
  const requiredMarkers = [
    'Contract task: SHELL-CON-020',
    `Source contract SHA256: ${shellCon020SourceContractSha256}`,
    'export type CanonicalSaleId',
    'export interface CanonicalSale<TSaleLine>',
    'readonly sale_id: CanonicalSaleId;',
    'readonly lines: readonly [TSaleLine, ...TSaleLine[]];',
    'line_contract_task_id: "SHELL-CON-021"',
    'line_shape_materialized_here: false',
    'line_public_identity_materialized_here: false',
    'next_contract_task_id: "SHELL-CON-021"',
  ];

  for (const marker of requiredMarkers) {
    if (!contractSource.includes(marker)) {
      fail(`SHELL-CON-020 dependency is missing required content: ${marker}`);
    }
  }

  const forbiddenLineFields = [
    /\n  readonly sale_line_id:/u,
    /\n  readonly sold_item_ref:/u,
    /\n  readonly product_ref:/u,
    /\n  readonly quantity:/u,
    /\n  readonly line_total:/u,
  ];

  for (const pattern of forbiddenLineFields) {
    if (pattern.test(contractSource)) {
      fail(`SHELL-CON-020 dependency already materializes line field: ${pattern.source}`);
    }
  }
}

function renderCanonicalSaleLineContract() {
  return `// GENERATED FILE. DO NOT EDIT.
// Semantic owners: INT-POS-005..013, INT-SALES-001
// Contract task: SHELL-CON-021
// Foundation task: SHELL-CON-001
// Sale contract task: SHELL-CON-020
// Mapping contract task: SHELL-CON-022
// Source contract SHA256: ${shellCon021SourceContractSha256}

import type { CanonicalSaleId } from "./canonical-sale.contract.js";

declare const canonicalSaleLineIdBrand: unique symbol;

export type CanonicalSaleLineId =
  string & {
    readonly [canonicalSaleLineIdBrand]: "CanonicalSaleLineId";
  };

export interface CanonicalSaleLine {
  readonly sale_line_id: CanonicalSaleLineId;
  readonly sale_id: CanonicalSaleId;
  readonly contract_version: string;
  readonly source_line_id: string | null;
  readonly source_line_sequence: unknown | null;
  readonly source_line_revision: string | null;
  readonly sold_item_ref: string;
  readonly product_ref: string | null;
  readonly presentation_ref: string | null;
  readonly recipe_ref: string | null;
  readonly mapping_refs: readonly string[];
  readonly quantity: unknown;
  readonly unit_ref: string | null;
  readonly monetary_snapshot: {
    readonly currency_ref: string;
    readonly applied_unit_price: unknown;
    readonly line_subtotal: unknown;
    readonly discount_total: unknown;
    readonly tax_total: unknown;
    readonly tip_total: unknown;
    readonly line_total: unknown;
  };
  readonly source_line_state: string | null;
  readonly canonical_line_state: string | null;
  readonly line_state_mapping_result: string;
  readonly line_occurred_at: string | null;
  readonly provenance_refs: readonly string[];
  readonly correlation_refs: readonly string[];
}

export const CANONICAL_SALE_LINE_IDENTITY_POLICY = {
  identity_name: "CanonicalSaleLineId",
  semantics: "STABLE_OPAQUE_NON_SECRET_CANONICAL_SALE_LINE_IDENTITY",
  serialization: "UNSPECIFIED",
  syntax_pattern: null,
  static_registry: false,
  materialized_id_count: 0,
  derive_from_sale_id: false,
  derive_from_source_line_id: false,
  derive_from_product: false,
  derive_from_sold_item_ref: false,
  derive_from_price: false,
  derive_from_quantity: false,
  derive_from_position_or_row_number: false,
  derive_from_timestamp: false,
  derive_from_file_or_payload_hash: false,
  derive_from_mapping: false,
  derive_from_recipe: false,
  derive_from_presentation: false,
  changes_on_mapping_resolution: false,
  changes_on_quarantine_entry_or_release: false,
  changes_on_state_change: false,
  changes_on_retry_replay_or_late_sync: false,
  incompatible_identity_reuse_result: "CONFLICT",
} as const;

export const CANONICAL_SALE_LINE_PARENT_POLICY = {
  exactly_one_sale_required: true,
  sale_line_id_is_sale_id: false,
  sale_id_type: "CanonicalSaleId",
  moving_between_sales_is_ordinary_edit: false,
  isolated_projection_must_retain_sale_id: true,
  source_system_redefined_by_line: false,
  site_ref_redefined_by_line: false,
  terminal_ref_redefined_by_line: false,
  cash_session_ref_redefined_by_line: false,
  customer_ref_redefined_by_line: false,
  order_ref_redefined_by_line: false,
  fiscal_document_ref_redefined_by_line: false,
  payment_refs_redefined_by_line: false,
} as const;

export const CANONICAL_SALE_LINE_SOURCE_IDENTITY_POLICY = {
  source_line_id_preserved_when_stable: true,
  source_line_id_nullable_when_not_provided: true,
  source_line_id_fabrication_allowed: false,
  source_line_sequence_is_universal_identity: false,
  source_line_sequence_preserved_only_when_material: true,
  source_line_revision_preserved_when_accredited: true,
  source_line_revision_fabrication_allowed: false,
  aggregate_row_receives_fabricated_source_line_id: false,
} as const;

export const CANONICAL_SALE_LINE_ITEM_MAPPING_POLICY = {
  sold_item_ref_required: true,
  sold_item_ref_is_product_ref: false,
  product_ref_required_before_product_dependent_effect: true,
  presentation_ref_conditional: true,
  recipe_ref_conditional: true,
  product_presentation_recipe_are_independent_resolutions: true,
  default_presentation_inference_allowed: false,
  recipe_inference_from_product_allowed: false,
  name_code_category_is_mapping_authority: false,
  silent_absence_means_not_applicable: false,
  mapping_by_reference: true,
  mapping_contract_task_id: "SHELL-CON-022",
  mapping_change_reidentifies_line: false,
} as const;

export const CANONICAL_SALE_LINE_QUANTITY_POLICY = {
  quantity_required: true,
  scalar_representation: "UNSPECIFIED",
  unit_required_when_magnitude_not_self_sufficient: true,
  commercial_quantity_is_inventory_quantity: false,
  unit_conversion_without_approved_rule_allowed: false,
  presentation_is_unit: false,
  negative_quantity_means_return_or_compensation: false,
  unresolved_quantity_difference_silently_corrected: false,
} as const;

export const CANONICAL_SALE_LINE_MONETARY_POLICY = {
  snapshot_is_historical: true,
  scalar_representation: "UNSPECIFIED",
  decimal_precision: "UNSPECIFIED",
  rounding_rule: "UNSPECIFIED",
  default_currency: null,
  applied_unit_price_and_totals_are_distinct: true,
  discount_tax_tip_are_distinct_components: true,
  header_discount_prorated_by_inference: false,
  line_discount_promoted_to_header_by_inference: false,
  unknown_value_becomes_zero: false,
  payment_is_line_monetary_component: false,
  current_catalog_recomputes_history: false,
  header_line_difference_silently_corrected: false,
} as const;

export const CANONICAL_SALE_LINE_STATE_POLICY = {
  source_state_is_canonical_state: false,
  canonical_state_is_sale_commercial_state: false,
  canonical_state_is_mapping_state: false,
  canonical_state_is_quarantine_state: false,
  canonical_state_is_inventory_state: false,
  absent_state_defaults_to_active: false,
  canonical_state_requires_accredited_equivalence: true,
  approved_minimum_active_semantics: "ACTIVE",
  approved_minimum_cancelled_semantics: "CANCELLED",
  mapped_result_semantics: "MAPPED",
  not_provided_result_semantics: "NOT_PROVIDED",
  unresolved_result_semantics: "UNRESOLVED",
  executable_state_enum_materialized: false,
  cancelled_executes_return_refund_or_compensation: false,
  ambiguous_state_remains_unresolved: true,
} as const;

export const CANONICAL_SALE_LINE_TEMPORAL_POLICY = {
  line_occurred_at_conditional: true,
  sale_occurred_at_copied_as_line_time_by_default: false,
  import_time_is_line_occurred_at: false,
  receipt_time_is_line_occurred_at: false,
  replay_time_is_line_occurred_at: false,
  sync_time_is_line_occurred_at: false,
  date_only_promoted_to_midnight: false,
  arbitrary_timezone_assignment_allowed: false,
  late_revision_moves_historical_line_time: false,
} as const;

export const CANONICAL_SALE_LINE_PROVENANCE_POLICY = {
  provenance_by_reference: true,
  correlation_by_reference: true,
  provenance_replaces_sale_line_id: false,
  payload_digest_is_business_identity: false,
  parser_or_mapping_correction_rewrites_source_evidence: false,
  raw_payload_copied_by_default: false,
  correlation_creates_identity_equivalence: false,
  weak_match_by_product_amount_time_or_text_is_sufficient: false,
} as const;

export const CANONICAL_SALE_LINE_COMPLETENESS_POLICY = {
  structural_line_requires_stable_sale_line_id: true,
  structural_line_requires_sale_id: true,
  structural_line_requires_contract_version: true,
  structural_line_requires_sold_item_ref: true,
  structural_line_requires_quantity: true,
  structural_line_requires_unit_when_needed: true,
  structural_line_requires_sufficient_monetary_snapshot: true,
  structural_line_requires_reconstructible_provenance: true,
  structural_line_allows_pending_product_mapping: true,
  incompatible_identity_conflict_blocks_completion: true,
  product_effect_requires_product_ref: true,
  product_effect_requires_applicable_presentation_ref: true,
  product_effect_requires_applicable_recipe_ref: true,
  product_effect_requires_explicit_non_applicability_decisions: true,
  product_effect_requires_compatible_quantity_and_unit: true,
  product_effect_blocks_ambiguous_conflicting_or_pending_required_mapping: true,
  active_quarantine_blocks_applicable_effect: true,
  product_effect_requires_mapping_version: true,
  downstream_authorization_remains_owner_responsibility: true,
  idempotency_and_correlation_remain_owner_responsibility: true,
  eligibility_executes_effect: false,
} as const;

export const CANONICAL_SALE_LINE_BOUNDARY_POLICY = {
  line_is_sale: false,
  line_is_product: false,
  line_is_presentation: false,
  line_is_recipe: false,
  line_is_order_line: false,
  line_is_inventory_movement: false,
  line_is_economic_fact: false,
  line_is_loyalty_movement: false,
  line_is_payment: false,
  line_is_fiscal_line: false,
  line_is_quarantine: false,
  line_is_mapping: false,
  line_is_event: false,
  line_is_downstream_effect: false,
  executes_inventory_effect: false,
  executes_economic_effect: false,
  executes_loyalty_effect: false,
  executes_payment_effect: false,
  executes_fiscal_effect: false,
} as const;

export const CANONICAL_SALE_LINE_AGGREGATE_POLICY = {
  makos_excel_aggregate_row_is_individual_sale_line: false,
  row_number_is_sale_line_id: false,
  product_date_site_is_sale_line_identity: false,
  file_hash_is_sale_line_identity: false,
  aggregate_evidence_may_be_preserved: true,
  individual_line_requires_individual_sale_and_line_granularity: true,
} as const;

export const CANONICAL_SALE_LINE_SECURITY_POLICY = {
  secret_material_allowed: false,
  api_key_allowed: false,
  service_role_key_allowed: false,
  access_or_refresh_token_allowed: false,
  password_allowed: false,
  provider_credential_allowed: false,
  full_payment_instrument_data_allowed: false,
  complete_customer_profile_allowed_by_default: false,
  raw_external_payload_allowed_by_default: false,
  full_logs_or_traces_allowed_by_default: false,
  embedded_evidence_file_allowed: false,
  authentication_cryptographic_material_allowed: false,
  mapping_reference_transports_secret: false,
} as const;

export const CANONICAL_SALE_LINE_CONTRACT_METADATA = {
  logical_namespace: "@vento/contracts/integrations",
  contract_task_id: "SHELL-CON-021",
  sale_contract_task_id: "SHELL-CON-020",
  semantic_owner_task_ids: [
    "INT-POS-005",
    "INT-POS-006",
    "INT-POS-007",
    "INT-POS-008",
    "INT-POS-009",
    "INT-POS-010",
    "INT-POS-011",
    "INT-POS-012",
    "INT-POS-013",
    "INT-SALES-001",
  ],
  mapping_contract_task_id: "SHELL-CON-022",
  idempotency_contract_task_id: "SHELL-CON-023",
  disposition_contract_task_id: "SHELL-CON-024",
  next_contract_task_id: "SHELL-CON-022",
  execution_gate: "PRE_E5_FOUNDATION",
  physical_mode: "GLOBAL_ENABLE_ONCE",
  public_export_published: false,
  package_root_index_extended: false,
  consumer_adoption_materialized: false,
  runtime_sale_line_creation_materialized: false,
  persistence_materialized: false,
  mapping_runtime_materialized: false,
  quarantine_runtime_materialized: false,
  downstream_effect_materialized: false,
  secret_materialized: false,
  supabase_changed: false,
  materialized_sale_line_instance_count: 0,
} as const;

export type CanonicalSaleLineIdentityPolicy =
  typeof CANONICAL_SALE_LINE_IDENTITY_POLICY;

export type CanonicalSaleLineParentPolicy =
  typeof CANONICAL_SALE_LINE_PARENT_POLICY;

export type CanonicalSaleLineSourceIdentityPolicy =
  typeof CANONICAL_SALE_LINE_SOURCE_IDENTITY_POLICY;

export type CanonicalSaleLineItemMappingPolicy =
  typeof CANONICAL_SALE_LINE_ITEM_MAPPING_POLICY;

export type CanonicalSaleLineQuantityPolicy =
  typeof CANONICAL_SALE_LINE_QUANTITY_POLICY;

export type CanonicalSaleLineMonetaryPolicy =
  typeof CANONICAL_SALE_LINE_MONETARY_POLICY;

export type CanonicalSaleLineStatePolicy =
  typeof CANONICAL_SALE_LINE_STATE_POLICY;

export type CanonicalSaleLineTemporalPolicy =
  typeof CANONICAL_SALE_LINE_TEMPORAL_POLICY;

export type CanonicalSaleLineProvenancePolicy =
  typeof CANONICAL_SALE_LINE_PROVENANCE_POLICY;

export type CanonicalSaleLineCompletenessPolicy =
  typeof CANONICAL_SALE_LINE_COMPLETENESS_POLICY;

export type CanonicalSaleLineBoundaryPolicy =
  typeof CANONICAL_SALE_LINE_BOUNDARY_POLICY;

export type CanonicalSaleLineAggregatePolicy =
  typeof CANONICAL_SALE_LINE_AGGREGATE_POLICY;

export type CanonicalSaleLineSecurityPolicy =
  typeof CANONICAL_SALE_LINE_SECURITY_POLICY;

export type CanonicalSaleLineContractMetadata =
  typeof CANONICAL_SALE_LINE_CONTRACT_METADATA;
`;
}

function writeOrCheck(filePath, content, checkOnly, label) {
  const expected = normalizeEol(content);
  const exists = fs.existsSync(filePath);
  const current = exists
    ? normalizeEol(fs.readFileSync(filePath, 'utf8'))
    : null;

  if (checkOnly) {
    if (!exists) {
      fail(`${label} is missing.`);
    }
    if (current !== expected) {
      fail(`${label} is stale.`);
    }
    return 'FRESH';
  }

  fs.mkdirSync(path.dirname(filePath), { recursive: true });
  if (current === expected) return 'FRESH';
  fs.writeFileSync(filePath, expected, 'utf8');
  return exists ? 'UPDATED' : 'CREATED';
}

export function generateCanonicalSaleLineContract({ checkOnly = false } = {}) {
  const shellSource = readText(shellContractSourcePath, 'SHELL-CON source file');
  const canonicalSaleContract = readText(
    canonicalSaleContractPath,
    'canonical sale contract',
  );

  validateReconciliation(shellSource);
  validateShellCon021(shellSource);
  validateCanonicalSaleDependency(canonicalSaleContract);

  const contractResult = writeOrCheck(
    canonicalSaleLineContractPath,
    renderCanonicalSaleLineContract(),
    checkOnly,
    'canonical sale line contract',
  );

  return {
    logicalFieldCount: 20,
    monetarySnapshotFieldCount: 7,
    materializedSaleLineIds: 0,
    materializedSaleLineInstances: 0,
    contractResult,
  };
}

function runCli() {
  const checkOnly = process.argv.includes('--check');
  const unknown = process.argv.slice(2).filter((value) => value !== '--check');

  try {
    if (unknown.length > 0) {
      fail(`Unknown arguments: ${unknown.join(', ')}`);
    }

    const result = generateCanonicalSaleLineContract({ checkOnly });

    console.log(
      `[VENTO CONTRACTS] CANONICAL SALE LINE ${checkOnly ? 'CHECK' : 'GENERATE'} PASS`,
    );
    console.log(`[VENTO CONTRACTS] SALE_LINE_LOGICAL_FIELDS ${result.logicalFieldCount}`);
    console.log(
      `[VENTO CONTRACTS] SALE_LINE_MONETARY_FIELDS `
      + `${result.monetarySnapshotFieldCount}`,
    );
    console.log(
      `[VENTO CONTRACTS] MATERIALIZED_SALE_LINE_IDS `
      + `${result.materializedSaleLineIds}`,
    );
    console.log(
      `[VENTO CONTRACTS] MATERIALIZED_SALE_LINE_INSTANCES `
      + `${result.materializedSaleLineInstances}`,
    );
    console.log(`[VENTO CONTRACTS] CONTRACT ${result.contractResult}`);
    console.log('');
    console.log('=== RESULTADO PARA CHATGPT ===');
    console.log('ESTADO: PASS');
    console.log(
      `OPERACION: ${checkOnly
        ? 'CANONICAL_SALE_LINE_CONTRACT_CHECK'
        : 'CANONICAL_SALE_LINE_CONTRACT_GENERATE'}`,
    );
    console.log(`SALE_LINE_LOGICAL_FIELDS: ${result.logicalFieldCount}`);
    console.log(`SALE_LINE_MONETARY_FIELDS: ${result.monetarySnapshotFieldCount}`);
    console.log(`MATERIALIZED_SALE_LINE_IDS: ${result.materializedSaleLineIds}`);
    console.log(
      `MATERIALIZED_SALE_LINE_INSTANCES: ${result.materializedSaleLineInstances}`,
    );
    console.log(`CONTRACT: ${result.contractResult}`);
    console.log('=== FIN RESULTADO PARA CHATGPT ===');
  } catch (error) {
    const message = error instanceof Error ? error.message : String(error);
    console.error('[VENTO CONTRACTS] CANONICAL SALE LINE FAIL');
    console.error(message);
    console.error('');
    console.error('=== RESULTADO PARA CHATGPT ===');
    console.error('ESTADO: FAIL');
    console.error('OPERACION: CANONICAL_SALE_LINE_CONTRACT');
    console.error(`ERROR: ${message}`);
    console.error('=== FIN RESULTADO PARA CHATGPT ===');
    process.exitCode = 1;
  }
}

if (process.argv[1] && path.resolve(process.argv[1]) === currentFile) {
  runCli();
}
