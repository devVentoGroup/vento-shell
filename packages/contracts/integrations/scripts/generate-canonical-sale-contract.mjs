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

const shellCon020SourceContractSha256 =
  '5495541814c4bf5387462d98e638c9f25dbd128dc94706e7bbba7317a7f75182';

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
      starts.push({
        index,
        id: match.groups.id,
      });
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

function validateShellCon020(shellSource) {
  const task = extractTaskSection(shellSource, 'SHELL-CON-020');
  const actualSourceHash = sha256(task);

  if (actualSourceHash !== shellCon020SourceContractSha256) {
    fail(
      `SHELL-CON-020 source contract SHA256 mismatch: `
      + `expected ${shellCon020SourceContractSha256}, received ${actualSourceHash}.`,
    );
  }

  const requiredTaskMarkers = [
    '@vento/contracts/integrations',
    'CanonicalSaleId',
    'CanonicalSale<TSaleLine>',
    'source_system',
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
    'payment_refs[]',
    'monetary_snapshot',
    'lines: TSaleLine[]',
    'provenance_refs[]',
    'correlation_refs[]',
    'recorded_actor_ref',
    'recorded_principal_ref',
    'recorded_at',
    'ExternalReceivedEvent<TNormalizedAssertion>',
    'INT-POS-005',
    'INT-SALES-001',
    'SHELL-CON-021',
    'SHELL-CON-022',
    'SHELL-CON-023',
    'SHELL-CON-024',
    'NO GENERA REQUISITOS DE PRUEBA',
  ];

  for (const marker of requiredTaskMarkers) {
    if (!task.includes(marker)) {
      fail(`SHELL-CON-020 is missing required content: ${marker}`);
    }
  }

  return task;
}

function renderCanonicalSaleContract() {
  return `// GENERATED FILE. DO NOT EDIT.
// Semantic owners: INT-POS-005, INT-SALES-001
// Contract task: SHELL-CON-020
// Foundation task: SHELL-CON-001
// External received event task: SHELL-CON-019
// Line contract task: SHELL-CON-021
// Source contract SHA256: ${shellCon020SourceContractSha256}

declare const canonicalSaleIdBrand: unique symbol;

export type CanonicalSaleId =
  string & {
    readonly [canonicalSaleIdBrand]: "CanonicalSaleId";
  };

export interface CanonicalSale<TSaleLine> {
  readonly sale_id: CanonicalSaleId;
  readonly contract_version: string;
  readonly source_system: string;
  readonly source_instance_ref: string | null;
  readonly source_sale_id: string;
  readonly source_revision: string | null;
  readonly site_ref: string;
  readonly terminal_ref: string | null;
  readonly cash_session_ref: string | null;
  readonly occurred_at: string;
  readonly commercial_state: string;
  readonly customer_ref: string | null;
  readonly order_ref: string | null;
  readonly fiscal_document_ref: string | null;
  readonly payment_refs: readonly string[];
  readonly monetary_snapshot: {
    readonly currency_ref: string;
    readonly subtotal: unknown;
    readonly discount_total: unknown;
    readonly tax_total: unknown;
    readonly tip_total: unknown;
    readonly total: unknown;
  };
  readonly lines: readonly [TSaleLine, ...TSaleLine[]];
  readonly provenance_refs: readonly string[];
  readonly correlation_refs: readonly string[];
  readonly recorded_actor_ref: string | null;
  readonly recorded_principal_ref: string | null;
  readonly recorded_at: string;
}

export const CANONICAL_SALE_IDENTITY_POLICY = {
  identity_name: "CanonicalSaleId",
  semantics: "STABLE_OPAQUE_NON_SECRET_CANONICAL_SALE_IDENTITY",
  serialization: "UNSPECIFIED",
  syntax_pattern: null,
  static_registry: false,
  derive_from_source_sale_id: false,
  derive_from_total: false,
  derive_from_rounded_time: false,
  derive_from_customer: false,
  derive_from_terminal: false,
  derive_from_product: false,
  derive_from_file_position: false,
  derive_from_batch_or_file_hash: false,
  external_event_id_is_sale_id: false,
  receipt_id_is_sale_id: false,
  payment_id_is_sale_id: false,
  order_id_is_sale_id: false,
  fiscal_document_id_is_sale_id: false,
  stable_across_retry_replay_backfill_and_revision: true,
  incompatible_identity_reuse_overwrites_prior_sale: false,
} as const;

export const CANONICAL_SALE_BOUNDARY_POLICY = {
  contract_is_business_source: false,
  sale_is_order: false,
  sale_is_payment: false,
  sale_is_cash_movement: false,
  sale_is_fiscal_document: false,
  sale_is_inventory_movement: false,
  sale_is_loyalty_movement: false,
  sale_is_economic_fact: false,
  sale_is_delivery: false,
  sale_is_integration_event: false,
  sale_is_provider_payload: false,
  external_assertion_is_sale_without_owner_validation: false,
  executes_downstream_effects: false,
} as const;

export const CANONICAL_SALE_SOURCE_POLICY = {
  source_system_is_actual_business_source: true,
  transport_or_adapter_is_source_system: false,
  storing_in_pulso_reclassifies_historical_source: false,
  historical_makos_sale_remains_makos: true,
  pulso_is_source_only_under_approved_authority: true,
  dual_active_source_for_same_sale_allowed: false,
  source_sale_id_is_preserved: true,
  source_sale_id_fabrication_from_aggregate_allowed: false,
  source_revision_fabrication_allowed: false,
  source_revision_is_contract_version: false,
} as const;

export const CANONICAL_SALE_TEMPORAL_STATE_POLICY = {
  occurred_at_is_recorded_at: false,
  occurred_at_may_be_import_time_by_default: false,
  occurred_at_may_be_sync_time_by_default: false,
  historical_sale_preserves_original_occurrence_time: true,
  commercial_state_derived_from_payment_state: false,
  commercial_state_derived_from_cash_state: false,
  commercial_state_derived_from_fiscal_state: false,
  commercial_state_derived_from_inventory_state: false,
  commercial_state_derived_from_loyalty_state: false,
  commercial_state_derived_from_economic_state: false,
  commercial_state_derived_from_delivery_state: false,
} as const;

export const CANONICAL_SALE_MONETARY_POLICY = {
  snapshot_is_historical: true,
  scalar_representation: "UNSPECIFIED",
  decimal_precision: "UNSPECIFIED",
  rounding_rule: "UNSPECIFIED",
  default_currency: null,
  subtotal_discount_tax_tip_total_are_distinct: true,
  payment_is_monetary_component: false,
  historical_values_recomputed_from_current_catalog: false,
  header_line_inconsistency_silently_corrected: false,
} as const;

export const CANONICAL_SALE_LINE_POLICY = {
  minimum_line_count_for_complete_sale: 1,
  non_empty_tuple_materialized: true,
  line_contract_task_id: "SHELL-CON-021",
  line_shape_materialized_here: false,
  line_public_identity_materialized_here: false,
  aggregate_daily_product_row_is_individual_sale_line: false,
  line_position_is_identity_by_itself: false,
} as const;

export const CANONICAL_SALE_REFERENCE_POLICY = {
  customer_ref_optional: true,
  artificial_customer_required_for_consumer_sale: false,
  order_ref_implies_sale_equivalence: false,
  fiscal_document_ref_implies_emission_or_acceptance: false,
  payment_refs_are_independent_facts: true,
  provenance_by_reference: true,
  correlation_by_reference: true,
  external_received_event_may_be_provenance: true,
  provider_payload_copied_as_sale_contract_by_default: false,
  mapping_contract_task_id: "SHELL-CON-022",
  idempotency_contract_task_id: "SHELL-CON-023",
  disposition_contract_task_id: "SHELL-CON-024",
} as const;

export const CANONICAL_SALE_REVISION_RETRY_POLICY = {
  revision_preserves_sale_id: true,
  retry_preserves_sale_id: true,
  replay_preserves_sale_id: true,
  late_sync_preserves_sale_id: true,
  source_system_preserved_across_revision: true,
  source_sale_id_preserved_across_revision: true,
  destructive_provenance_overwrite_allowed: false,
  older_revision_may_silently_replace_newer_revision: false,
  incompatible_identity_reuse_result: "CONFLICT",
  timeout_authorizes_new_sale_identity: false,
  payload_digest_replaces_sale_identity: false,
} as const;

export const CANONICAL_SALE_COMPLETENESS_POLICY = {
  sale_id_required: true,
  source_system_required: true,
  source_sale_id_required: true,
  contract_version_required: true,
  site_ref_required: true,
  occurred_at_required: true,
  commercial_state_required: true,
  monetary_snapshot_required: true,
  at_least_one_line_required: true,
  provenance_reconstructible_required: true,
  correlation_sufficient_for_downstream_chain_required: true,
  incompatible_identity_reuse_blocks_completion: true,
  unresolved_material_authority_conflict_blocks_completion: true,
} as const;

export const CANONICAL_SALE_SECURITY_POLICY = {
  secret_material_allowed: false,
  api_key_allowed: false,
  service_role_key_allowed: false,
  access_or_refresh_token_allowed: false,
  password_allowed: false,
  provider_credential_allowed: false,
  full_card_data_allowed: false,
  full_bank_data_allowed: false,
  complete_customer_profile_allowed_by_default: false,
  raw_external_payload_allowed_by_default: false,
  consumer_reference_grants_additional_data_access: false,
} as const;

export const CANONICAL_SALE_CONTRACT_METADATA = {
  logical_namespace: "@vento/contracts/integrations",
  contract_task_id: "SHELL-CON-020",
  semantic_owner_task_ids: ["INT-POS-005", "INT-SALES-001"],
  external_received_event_contract_task_id: "SHELL-CON-019",
  line_contract_task_id: "SHELL-CON-021",
  mapping_contract_task_id: "SHELL-CON-022",
  idempotency_contract_task_id: "SHELL-CON-023",
  disposition_contract_task_id: "SHELL-CON-024",
  next_contract_task_id: "SHELL-CON-021",
  execution_gate: "PRE_E5_FOUNDATION",
  physical_mode: "GLOBAL_ENABLE_ONCE",
  public_export_published: false,
  package_root_index_extended: false,
  consumer_adoption_materialized: false,
  runtime_sale_creation_materialized: false,
  persistence_materialized: false,
  business_event_emission_materialized: false,
  downstream_effect_materialized: false,
  line_contract_materialized: false,
  secret_materialized: false,
  supabase_changed: false,
  materialized_sale_instance_count: 0,
} as const;

export type CanonicalSaleIdentityPolicy =
  typeof CANONICAL_SALE_IDENTITY_POLICY;

export type CanonicalSaleBoundaryPolicy =
  typeof CANONICAL_SALE_BOUNDARY_POLICY;

export type CanonicalSaleSourcePolicy =
  typeof CANONICAL_SALE_SOURCE_POLICY;

export type CanonicalSaleTemporalStatePolicy =
  typeof CANONICAL_SALE_TEMPORAL_STATE_POLICY;

export type CanonicalSaleMonetaryPolicy =
  typeof CANONICAL_SALE_MONETARY_POLICY;

export type CanonicalSaleLinePolicy =
  typeof CANONICAL_SALE_LINE_POLICY;

export type CanonicalSaleReferencePolicy =
  typeof CANONICAL_SALE_REFERENCE_POLICY;

export type CanonicalSaleRevisionRetryPolicy =
  typeof CANONICAL_SALE_REVISION_RETRY_POLICY;

export type CanonicalSaleCompletenessPolicy =
  typeof CANONICAL_SALE_COMPLETENESS_POLICY;

export type CanonicalSaleSecurityPolicy =
  typeof CANONICAL_SALE_SECURITY_POLICY;

export type CanonicalSaleContractMetadata =
  typeof CANONICAL_SALE_CONTRACT_METADATA;
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

  if (current === expected) {
    return 'FRESH';
  }

  fs.writeFileSync(filePath, expected, 'utf8');
  return exists ? 'UPDATED' : 'CREATED';
}

export function generateCanonicalSaleContract({
  checkOnly = false,
} = {}) {
  const shellSource = readText(
    shellContractSourcePath,
    'SHELL-CON source file',
  );

  validateReconciliation(shellSource);
  validateShellCon020(shellSource);

  const canonicalSaleContractResult = writeOrCheck(
    canonicalSaleContractPath,
    renderCanonicalSaleContract(),
    checkOnly,
    'canonical sale contract',
  );

  return {
    logicalFieldCount: 22,
    monetarySnapshotFieldCount: 6,
    minimumLineCount: 1,
    materializedSaleInstances: 0,
    canonicalSaleContractResult,
  };
}

function runCli() {
  const checkOnly = process.argv.includes('--check');
  const unknown = process.argv
    .slice(2)
    .filter((value) => value !== '--check');

  try {
    if (unknown.length > 0) {
      fail(`Unknown arguments: ${unknown.join(', ')}`);
    }

    const result = generateCanonicalSaleContract({ checkOnly });

    console.log(
      `[VENTO CONTRACTS] CANONICAL SALE `
      + `${checkOnly ? 'CHECK' : 'GENERATE'} PASS`,
    );
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
    console.log(
      `[VENTO CONTRACTS] CANONICAL_SALE_CONTRACT `
      + `${result.canonicalSaleContractResult}`,
    );
    console.log('');
    console.log('=== RESULTADO PARA CHATGPT ===');
    console.log('ESTADO: PASS');
    console.log(
      `OPERACION: ${checkOnly
        ? 'CANONICAL_SALE_CONTRACT_CHECK'
        : 'CANONICAL_SALE_CONTRACT_GENERATE'}`,
    );
    console.log(`SALE_LOGICAL_FIELDS: ${result.logicalFieldCount}`);
    console.log(`SALE_MONETARY_FIELDS: ${result.monetarySnapshotFieldCount}`);
    console.log(`SALE_MINIMUM_LINES: ${result.minimumLineCount}`);
    console.log(`MATERIALIZED_SALE_INSTANCES: ${result.materializedSaleInstances}`);
    console.log(`CANONICAL_SALE_CONTRACT: ${result.canonicalSaleContractResult}`);
    console.log('=== FIN RESULTADO PARA CHATGPT ===');
  } catch (error) {
    const message = error instanceof Error ? error.message : String(error);

    console.error('[VENTO CONTRACTS] CANONICAL SALE FAIL');
    console.error(message);
    console.error('');
    console.error('=== RESULTADO PARA CHATGPT ===');
    console.error('ESTADO: FAIL');
    console.error('OPERACION: CANONICAL_SALE_CONTRACT');
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