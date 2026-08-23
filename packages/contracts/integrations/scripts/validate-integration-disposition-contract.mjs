import fs from 'node:fs';
import path from 'node:path';
import { fileURLToPath } from 'node:url';

import {
  generateIntegrationDispositionContract,
} from './generate-integration-disposition-contract.mjs';

const currentFile = fileURLToPath(import.meta.url);
const scriptDirectory = path.dirname(currentFile);
const integrationsRoot = path.resolve(scriptDirectory, '..');
const contractsRoot = path.resolve(integrationsRoot, '..');

const contractPath = path.join(
  integrationsRoot,
  'generated',
  'integration-disposition.contract.ts',
);
const eventPath = path.join(
  integrationsRoot,
  'generated',
  'external-received-event.contract.ts',
);
const mappingPath = path.join(
  integrationsRoot,
  'generated',
  'external-identifier-mapping.contract.ts',
);
const idempotencyPath = path.join(
  integrationsRoot,
  'generated',
  'integration-idempotency-reconciliation.contract.ts',
);
const indexPath = path.join(integrationsRoot, 'generated', 'index.ts');
const integrationsReadmePath = path.join(integrationsRoot, 'README.md');
const contractsReadmePath = path.join(contractsRoot, 'README.md');
const packageJsonPath = path.join(contractsRoot, 'package.json');

const expectedFailureScopes = Object.freeze([
  'REQUEST_OR_COMMAND',
  'OWNER_TRANSACTION',
  'EVENT_EMISSION',
  'DELIVERY',
  'CONSUMER_EFFECT',
  'BATCH_OR_BULK_ITEM',
  'EXTERNAL_EXCHANGE',
  'OFFLINE_OR_EVIDENCE',
]);

const expectedPartialityClasses = Object.freeze([
  'NO_EFFECT_CONFIRMED',
  'SOME_EFFECTS_CONFIRMED',
  'SOME_EFFECTS_UNKNOWN',
  'ALL_EFFECTS_UNKNOWN',
  'DEPENDENCY_INCOMPLETE',
  'CONFLICTING_RESULTS',
  'UNTRUSTED_OR_TAMPERED_INPUT',
  'CONTRACT_OR_SCHEMA_INCOMPATIBLE',
  'EXTERNAL_STATE_DIVERGENCE',
]);

const expectedDispositions = Object.freeze([
  'RETRY_SAME_OPERATION',
  'WAIT_FOR_DEPENDENCY',
  'QUERY_AUTHORITATIVE_RESULT',
  'RECONCILE',
  'QUARANTINE',
  'DEAD_LETTER_CANDIDATE',
  'MANUAL_INTERVENTION_REQUIRED',
  'PERMANENTLY_REJECT',
  'COMPENSATE_CONFIRMED_EFFECTS',
  'CREATE_CORRECTION_OR_SUCCESSOR',
  'CONTINUE_INDEPENDENT_UNITS',
  'BLOCK_DEPENDENT_UNITS',
]);

const expectedQuarantineReasons = Object.freeze([
  'UNTRUSTED_SIGNATURE_OR_AUTHENTICITY',
  'SCHEMA_OR_VERSION_UNSUPPORTED',
  'PAYLOAD_INTEGRITY_FAILED',
  'IDENTITY_OR_ROUTING_AMBIGUOUS',
  'SENSITIVITY_OR_POLICY_VIOLATION',
  'REPEATED_POISON_MESSAGE',
  'EVIDENCE_LINKAGE_INVALID',
  'MANUAL_HOLD_FOR_INVESTIGATION',
]);

const expectedDeadLetterGates = Object.freeze([
  'AUTOMATION_BUDGET_CLOSED',
  'ITEM_ISOLATED',
  'IDENTITY_AND_CONTENT_PRESERVED',
  'BUSINESS_OUTCOME_CLASSIFIED_OR_RECONCILIATION_OPEN',
  'OWNER_AND_NEXT_ACTION_ASSIGNED',
  'REPROCESSING_REQUIRES_AUTHORIZATION',
  'RETENTION_AND_AUDIT_DEFINED',
]);

const expectedManualInterventionActions = Object.freeze([
  'RETRY_AUTHORIZED',
  'QUERY_RECEIPT',
  'CORRECT_METADATA',
  'CREATE_SUCCESSOR',
  'RELINK_EVIDENCE',
  'REPROCESS_FROM_QUARANTINE',
  'REPROCESS_FROM_DEAD_LETTER',
  'PERMANENT_REJECT',
  'START_RECONCILIATION',
  'START_COMPENSATION',
]);

const expectedClosureOutcomes = Object.freeze([
  'RESOLVED_CONFIRMED',
  'RESOLVED_NO_EFFECT',
  'RESOLVED_DUPLICATE_PRIOR_RESULT',
  'RESOLVED_CORRECTED',
  'RESOLVED_COMPENSATED',
  'RESOLVED_WITH_ACCEPTED_RESIDUAL',
  'PERMANENTLY_REJECTED',
  'SUPERSEDED_BY_SUCCESSOR',
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
  const forbidden = [
    [/\bcreateClient\s*\(/u, 'createClient('],
    [/\bfetch\s*\(/u, 'fetch('],
    [/\bprocess\.env\b/u, 'environment access'],
    [/\bfrom\s+["']@supabase\//u, '@supabase import'],
    [/\bfrom\s+["'](?:pg|postgres|drizzle|prisma)/u, 'database import'],
    [/\bDeno\.env\b/u, 'Deno environment access'],
    [/\bBun\.env\b/u, 'Bun environment access'],
  ];

  for (const [pattern, forbiddenLabel] of forbidden) {
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

function interfaceFields(source, interfaceName) {
  const pattern = new RegExp(
    `export interface ${interfaceName} \\{([\\s\\S]*?)^\\}`,
    'mu',
  );
  const match = source.match(pattern);
  if (!match) fail(`${interfaceName} interface not found.`);
  return [...match[1].matchAll(/^  readonly ([a-z_]+):/gmu)].map((entry) => entry[1]);
}

function readonlyTypeFields(source, typeName) {
  const pattern = new RegExp(
    `export type ${typeName} = Readonly<\\{([\\s\\S]*?)\\}>;`,
    'u',
  );
  const match = source.match(pattern);
  if (!match) fail(`${typeName} readonly type not found.`);
  return [...match[1].matchAll(/^  readonly ([a-z_]+):/gmu)].map((entry) => entry[1]);
}

function validateExactFields(actual, expected, label) {
  if (JSON.stringify(actual) !== JSON.stringify(expected)) {
    fail(`${label} fields must remain exact; received ${JSON.stringify(actual)}.`);
  }
}

function validateGeneratedContract(source) {
  const required = [
    'Semantic owners: INT-APP-006, INT-APP-009, INT-EXT-016, INT-EXT-017, INT-POS-012, INT-POS-019, INT-POS-020',
    'Contract task: SHELL-CON-024',
    'External received event task: SHELL-CON-019',
    'External identifier mapping task: SHELL-CON-022',
    'Idempotency and reconciliation task: SHELL-CON-023',
    'Physical quarantine owner: INT-DB-006',
    'Physical processing audit owner: INT-DB-007',
    'Physical reconciliation owner: INT-DB-008',
    'Source contract SHA256: aae1f418511d792568d76a309b98fcdab74fbb13dc7ae4b559fa9561f5f72f30',
    'import type { IntegrationPrincipalRef } from "./integration-principal.contract.js";',
    'import type { ExternalIdentifierMappingRef } from "./external-identifier-mapping.contract.js";',
    'IntegrationIdempotencyRef,',
    'IntegrationReconciliationClosureOutcome,',
    'IntegrationReconciliationRef,',
    'export type IntegrationDispositionCaseId',
    'export type IntegrationDispositionCaseRef = Readonly<{',
    'export interface IntegrationDispositionCase',
    'export type IntegrationQuarantineRef',
    'export type IntegrationDeadLetterRef',
    'export interface IntegrationCompensationPlanRef',
    'semantics: "STABLE_OPAQUE_NON_SECRET_DISPOSITION_CASE_IDENTITY"',
    'serialization: "UNSPECIFIED"',
    'syntax_pattern: null',
    'technical_retry_creates_new_case_by_default: false',
    'closed_identity_reusable: false',
    'quarantine_is_dead_letter: false',
    'dead_letter_is_business_rejection: false',
    'rejection_is_unknown_result: false',
    'reconciliation_is_compensation: false',
    'compensation_is_retry: false',
    'contingency_is_disposition: false',
    'quarantine_auto_applies_business_effect: false',
    'release_by_age_allowed: false',
    'release_by_alert_disappearance_allowed: false',
    'gate_count: 7',
    'all_gates_required: true',
    'retry_exhaustion_satisfies_all_gates: false',
    'dead_letter_is_terminal_business_failure_by_definition: false',
    'unresolved_outcome_unknown_allowed: false',
    'unresolved_result_unknown_allowed: false',
    'compensation_for_hypothetical_effect_allowed: false',
    'indeterminate_result_requires_reconciliation: true',
    'same_intent_preserves_business_identity: true',
    'same_intent_preserves_idempotency_scope_and_key: true',
    'material_intent_payload_resource_amount_quantity_recipient_version_action_or_authority_change_is_simple_reprocess: false',
    'material_change_requires_correction_or_successor: true',
    'confirmed_original_effect_required: true',
    'compensation_has_own_identity_and_idempotency: true',
    'original_effect_deleted_or_edited_to_simulate_non_occurrence: false',
    'global_rollback_across_pulso_nexo_numera_pass_and_provider_exists: false',
    'reused_closure_outcome_count: 8',
    'duplicate_closure_vocabulary_created_here: false',
    'closed_unknown_outcome_allowed: false',
    'residual_without_responsible_party_is_valid_closure: false',
    'authenticated_integration_principal_implies_retry_reprocess_reject_or_compensation_authority: false',
    'owner_specialization_ref: "EXTERNAL-SALE-LINE-QUARANTINE-001"',
    'release_executes_inventory: false',
    'corrected_mapping_changes_line_identity: false',
    'global_sale_rollback_exists: false',
    'summary_replaces_item_results: false',
    'exhausted_budget_auto_permanently_rejects: false',
    'exhausted_budget_auto_completes_dead_letter: false',
    'purpose_minimization_required: true',
    'api_key_allowed: false',
    'bearer_token_allowed: false',
    'service_role_allowed: false',
    'private_key_allowed: false',
    'password_allowed: false',
    'expected_external_system_count: 21',
    'adopted_external_system_count: 21',
    'missing_external_system_count: 0',
    'duplicate_external_system_count: 0',
    'unique_external_system_id_count: 21',
    'governed_by_internal_contract_count: 1',
    'idempotency_and_reconciliation_count: 6',
    'no_business_effect_ledger_count: 2',
    'technical_platform_without_business_effect_count: 2',
    'model_without_remote_binding_count: 1',
    'pos_specialization_count: 1',
    'no_binding_not_applicable_count: 7',
    'blocked_without_binding_count: 1',
    'specified_disposition_state_count: 12',
    'not_applicable_disposition_state_count: 8',
    'blocked_disposition_state_count: 1',
    'materialized_disposition_case_count: 0',
    'materialized_quarantine_record_count: 0',
    'materialized_dead_letter_record_count: 0',
    'materialized_compensation_count: 0',
    'physical_quarantine_owner_task_id: "INT-DB-006"',
    'physical_processing_audit_owner_task_id: "INT-DB-007"',
    'physical_reconciliation_owner_task_id: "INT-DB-008"',
    'queue_failure_recovery_owner_task_id: "QUEUE-ARC-008"',
    'queue_reprocess_exclusion_owner_task_id: "QUEUE-ARC-009"',
    'queue_metrics_owner_task_id: "QUEUE-ARC-011"',
    'queue_manual_authorization_owner_task_id: "QUEUE-ARC-012"',
    'next_contract_task_id: "SHELL-NORM-001"',
    'execution_gate: "PRE_E5_FOUNDATION"',
    'physical_mode: "GLOBAL_ENABLE_ONCE"',
    'public_export_published: false',
    'package_root_index_extended: false',
    'consumer_adoption_materialized: false',
    'persistence_materialized: false',
    'queue_materialized: false',
    'worker_materialized: false',
    'retry_runtime_materialized: false',
    'reprocess_runtime_materialized: false',
    'compensation_runtime_materialized: false',
    'migration_materialized: false',
    'supabase_changed: false',
  ];

  for (const marker of required) {
    assertIncludes(source, marker, 'integration disposition contract');
  }

  validateExactArray(source, 'INTEGRATION_FAILURE_SCOPES', expectedFailureScopes);
  validateExactArray(source, 'INTEGRATION_PARTIALITY_CLASSES', expectedPartialityClasses);
  validateExactArray(source, 'INTEGRATION_DISPOSITIONS', expectedDispositions);
  validateExactArray(source, 'INTEGRATION_QUARANTINE_REASONS', expectedQuarantineReasons);
  validateExactArray(source, 'INTEGRATION_DEAD_LETTER_GATES', expectedDeadLetterGates);
  validateExactArray(
    source,
    'INTEGRATION_MANUAL_INTERVENTION_ACTIONS',
    expectedManualInterventionActions,
  );

  validateExactFields(
    readonlyTypeFields(source, 'IntegrationDispositionCaseRef'),
    ['integration_disposition_case_id', 'contract_version'],
    'IntegrationDispositionCaseRef',
  );

  validateExactFields(
    interfaceFields(source, 'IntegrationCompensationPlanRef'),
    [
      'plan_ref',
      'contract_version',
      'original_confirmed_effect_ref',
      'owner_ref',
      'ccr_action_ref',
      'plan_outcome_ref',
      'verification_refs',
      'audit_refs',
    ],
    'IntegrationCompensationPlanRef',
  );

  validateExactFields(
    interfaceFields(source, 'IntegrationDispositionCase'),
    [
      'integration_disposition_case_id',
      'failure_scope',
      'partiality_class',
      'disposition',
      'owner_application',
      'owner_domain_ref',
      'resource_or_operation_refs',
      'external_system_id',
      'environment',
      'surface',
      'integration_principal_ref',
      'external_received_event_ref',
      'external_identifier_mapping_refs',
      'idempotency_ref',
      'reconciliation_ref',
      'quarantine_ref',
      'dead_letter_ref',
      'compensation_plan_ref',
      'original_evidence_refs',
      'content_integrity_ref',
      'contract_or_schema_version',
      'quarantine_reason',
      'owner_specialization_ref',
      'owner_resolution_detail',
      'dead_letter_gate_results',
      'manual_intervention_action',
      'authorization_reference',
      'attempt_references',
      'business_outcome_reference',
      'responsible_owner',
      'next_action',
      'residual_obligations',
      'retention_policy_ref',
      'legal_hold_reference',
      'audit_references',
      'closure_outcome',
      'created_at',
      'updated_at',
      'closed_at',
    ],
    'IntegrationDispositionCase',
  );

  const adoptionMatch = source.match(
    /export const INTEGRATION_DISPOSITION_ADOPTION = \[([\s\S]*?)\] as const;/u,
  );
  if (!adoptionMatch) fail('INTEGRATION_DISPOSITION_ADOPTION not found.');
  const adoptionSource = adoptionMatch[1];

  const ids = [
    ...adoptionSource.matchAll(/external_system_id: "(EXT-SYS-\d{3})"/gu),
  ].map((entry) => entry[1]);
  const expectedIds = Array.from({ length: 21 }, (_, index) => (
    `EXT-SYS-${String(index + 1).padStart(3, '0')}`
  ));
  if (JSON.stringify(ids) !== JSON.stringify(expectedIds)) {
    fail(`disposition adoption must preserve exact EXT-SYS-001..021 order; received ${JSON.stringify(ids)}.`);
  }
  if (new Set(ids).size !== 21) {
    fail('disposition adoption contains duplicate EXT-SYS identifiers.');
  }

  const classifications = [
    ...adoptionSource.matchAll(/inherited_classification: "([A-Z_]+)"/gu),
  ].map((entry) => entry[1]);
  const expectedClassificationCounts = {
    GOBERNADA_POR_CONTRATO_INTERNO: 1,
    APLICA_IDEMPOTENCIA_Y_CONCILIACION: 6,
    SIN_LEDGER_DE_EFECTO_EMPRESARIAL: 2,
    PLATAFORMA_TECNICA_SIN_EFECTO_EMPRESARIAL_EN_CORTE: 2,
    MODELO_SIN_BINDING_REMOTO: 1,
    APLICA_CON_ESPECIALIZACION_POS: 1,
    NO_APLICA_SIN_BINDING: 7,
    BLOQUEADO_SIN_BINDING: 1,
  };
  for (const [classification, expectedCount] of Object.entries(expectedClassificationCounts)) {
    const actualCount = classifications.filter((value) => value === classification).length;
    if (actualCount !== expectedCount) {
      fail(`classification ${classification} expected ${expectedCount}, received ${actualCount}.`);
    }
  }
  if (classifications.length !== 21) {
    fail(`classification coverage expected 21, received ${classifications.length}.`);
  }

  const states = [...adoptionSource.matchAll(/^    state: "([A-Z_]+)",$/gmu)].map((entry) => entry[1]);
  const expectedStateCounts = {
    ESPECIFICADO: 12,
    NO_APLICA: 8,
    BLOQUEADO: 1,
  };
  for (const [state, expectedCount] of Object.entries(expectedStateCounts)) {
    const actualCount = states.filter((value) => value === state).length;
    if (actualCount !== expectedCount) {
      fail(`disposition state ${state} expected ${expectedCount}, received ${actualCount}.`);
    }
  }
  if (states.length !== 21) {
    fail(`disposition state coverage expected 21, received ${states.length}.`);
  }

  for (const marker of [
    'Wompi',
    'RevenueCat',
    'Resend',
    'Expo Push Service',
    'Apple Wallet / PassKit y APNs',
    'Zebra BrowserPrint',
    'POS externo vigente',
    'EXTERNAL-SALE-LINE-QUARANTINE-001',
    'Telefonia / voz',
  ]) {
    assertIncludes(source, marker, 'disposition adoption coverage');
  }

  assertDoesNotMatch(source, /\bexport\s+enum\b/u, 'integration disposition contract', 'physical enum');
  assertDoesNotMatch(source, /\bcreate\s+table\b/iu, 'integration disposition contract', 'DDL');
  assertDoesNotMatch(
    source,
    /export const INTEGRATION_RECONCILIATION_CLOSURE_OUTCOMES/u,
    'integration disposition contract',
    'duplicate SHELL-CON-023 closure vocabulary',
  );
  validateNoRuntimeSurface(source, 'integration disposition contract');
}

function validateDependencyBoundaries(eventSource, mappingSource, idempotencySource) {
  for (const marker of [
    'Contract task: SHELL-CON-019',
    'readonly idempotency_ref: string | null;',
    'disposition_contract_task_id: "SHELL-CON-024"',
  ]) {
    assertIncludes(eventSource, marker, 'SHELL-CON-019 dependency');
  }
  assertDoesNotMatch(
    eventSource,
    /IntegrationDispositionCaseRef/u,
    'SHELL-CON-019 dependency',
    'SHELL-CON-024 consumer migration advanced in SHELL-CON-019',
  );

  for (const marker of [
    'Contract task: SHELL-CON-022',
    'disposition_contract_task_id: "SHELL-CON-024"',
    'export type ExternalIdentifierMappingRef',
  ]) {
    assertIncludes(mappingSource, marker, 'SHELL-CON-022 dependency');
  }
  assertDoesNotMatch(
    mappingSource,
    /IntegrationDispositionCase/u,
    'SHELL-CON-022 dependency',
    'SHELL-CON-024 contract advanced in SHELL-CON-022',
  );

  for (const marker of [
    'Contract task: SHELL-CON-023',
    'export interface IntegrationIdempotencyRef',
    'export type IntegrationReconciliationRef',
    'export type IntegrationReconciliationClosureOutcome',
    'disposition_contract_task_id: "SHELL-CON-024"',
    'next_contract_task_id: "SHELL-CON-024"',
  ]) {
    assertIncludes(idempotencySource, marker, 'SHELL-CON-023 dependency');
  }
  validateExactArray(
    idempotencySource,
    'INTEGRATION_RECONCILIATION_CLOSURE_OUTCOMES',
    expectedClosureOutcomes,
  );
  assertDoesNotMatch(
    idempotencySource,
    /IntegrationDispositionCase/u,
    'SHELL-CON-023 dependency',
    'SHELL-CON-024 contract advanced in SHELL-CON-023',
  );
}

function validateInternalIndexBoundary(indexSource) {
  const forbidden = [
    /\bIntegrationDispositionCaseId\b/u,
    /\bIntegrationDispositionCaseRef\b/u,
    /\bIntegrationDispositionCase\b/u,
    /\bIntegrationFailureScope\b/u,
    /\bIntegrationPartialityClass\b/u,
    /\bIntegrationDisposition\b/u,
    /\bIntegrationQuarantineReason\b/u,
    /\bIntegrationQuarantineRef\b/u,
    /\bIntegrationDeadLetterGate\b/u,
    /\bIntegrationDeadLetterRef\b/u,
    /\bIntegrationManualInterventionAction\b/u,
    /\bIntegrationCompensationPlanRef\b/u,
    /integration-disposition\.contract\.js/u,
  ];

  for (const pattern of forbidden) {
    assertDoesNotMatch(
      indexSource,
      pattern,
      'integrations generated index',
      'SHELL-CON-024 public barrel export',
    );
  }
}

function validatePackageBoundary() {
  const packageJson = JSON.parse(readText(packageJsonPath, '@vento/contracts package.json'));
  if (packageJson.name !== '@vento/contracts') fail('@vento/contracts package name changed.');
  if (packageJson.version !== '1.0.0-alpha.1') fail('@vento/contracts version changed during SHELL-CON-024.');
  if (packageJson.private !== true) fail('@vento/contracts must remain private.');
  if (Object.hasOwn(packageJson, 'exports')) fail('@vento/contracts must not add public exports in SHELL-CON-024.');
}

function validateReadmes() {
  const moduleReadme = readText(integrationsReadmePath, 'integrations README');
  const rootReadme = readText(contractsReadmePath, '@vento/contracts README');

  const moduleMarkers = [
    'SHELL-CON-023::GLOBAL',
    'SHELL-CON-024::GLOBAL',
    '@vento/contracts/integrations',
    'IntegrationDispositionCaseId',
    'IntegrationDispositionCaseRef',
    'IntegrationDispositionCase',
    'IntegrationFailureScope',
    'IntegrationPartialityClass',
    'IntegrationDisposition',
    'IntegrationQuarantineReason',
    'IntegrationQuarantineRef',
    'IntegrationDeadLetterGate',
    'IntegrationDeadLetterRef',
    'IntegrationManualInterventionAction',
    'IntegrationCompensationPlanRef',
    '8 alcances de fallo',
    '9 clases de parcialidad',
    '12 disposiciones',
    '8 razones de cuarentena',
    '7 puertas de dead-letter',
    '10 acciones manuales',
    '8 cierres de conciliación',
    '39 campos de nivel superior',
    'INT-DB-006',
    'INT-DB-007',
    'INT-DB-008',
    'QUEUE-ARC-008',
    'QUEUE-ARC-009',
    'QUEUE-ARC-011',
    'QUEUE-ARC-012',
    'EXT-SYS-001..021',
    '21/21',
    'EXTERNAL-SALE-LINE-QUARANTINE-001',
    'SHELL-NORM-001',
    '0 casos de disposición operativos',
    '0 compensaciones reales',
    '0 cambios Supabase',
    'aae1f418511d792568d76a309b98fcdab74fbb13dc7ae4b559fa9561f5f72f30',
  ];
  for (const marker of moduleMarkers) {
    assertIncludes(moduleReadme, marker, 'integrations README');
  }

  const rootMarkers = [
    '## Módulo de integraciones externas',
    '`SHELL-CON-023::GLOBAL`',
    '`SHELL-CON-024::GLOBAL`',
    '`IntegrationDispositionCaseId`',
    '`IntegrationDispositionCase`',
    '`IntegrationQuarantineRef`',
    '`IntegrationDeadLetterRef`',
    '`IntegrationCompensationPlanRef`',
    '8 alcances de fallo',
    '9 clases de parcialidad',
    '12 disposiciones',
    '8 razones de cuarentena',
    '7 puertas de dead-letter',
    '10 acciones manuales',
    '8 cierres de conciliación',
    '39 campos de nivel superior',
    '`INT-DB-006`',
    '`INT-DB-007`',
    '`INT-DB-008`',
    '`SHELL-NORM-001`',
    '21/21',
    '0 casos de disposición operativos',
    '0 compensaciones reales',
    '0 cambios Supabase',
  ];
  for (const marker of rootMarkers) {
    assertIncludes(rootReadme, marker, '@vento/contracts README');
  }

  for (const marker of [
    '`SHELL-CON-024` conserva en exclusiva la disposición compartida de rechazo/cuarentena/compensación',
    '`SHELL-CON-024` conserva en exclusiva rechazo, cuarentena y compensación compartidos',
  ]) {
    if (moduleReadme.includes(marker) || rootReadme.includes(marker)) {
      fail(`README still declares SHELL-CON-024 as reserved: ${marker}`);
    }
  }
}

export function validateIntegrationDispositionContract() {
  const freshness = generateIntegrationDispositionContract({ checkOnly: true });
  const source = readText(contractPath, 'integration disposition contract');
  const eventSource = readText(eventPath, 'external received event contract');
  const mappingSource = readText(mappingPath, 'external identifier mapping contract');
  const idempotencySource = readText(idempotencyPath, 'integration idempotency reconciliation contract');
  const indexSource = readText(indexPath, 'integrations generated index');

  validateGeneratedContract(source);
  validateDependencyBoundaries(eventSource, mappingSource, idempotencySource);
  validateInternalIndexBoundary(indexSource);
  validatePackageBoundary();
  validateReadmes();

  return Object.freeze(freshness);
}

function runCli() {
  try {
    const result = validateIntegrationDispositionContract();
    console.log('[VENTO CONTRACTS] INTEGRATION DISPOSITION VALIDATION PASS');
    console.log(`[VENTO CONTRACTS] FAILURE_SCOPES ${result.failureScopeCount}`);
    console.log(`[VENTO CONTRACTS] PARTIALITY_CLASSES ${result.partialityClassCount}`);
    console.log(`[VENTO CONTRACTS] DISPOSITIONS ${result.dispositionCount}`);
    console.log(`[VENTO CONTRACTS] QUARANTINE_REASONS ${result.quarantineReasonCount}`);
    console.log(`[VENTO CONTRACTS] DEAD_LETTER_GATES ${result.deadLetterGateCount}`);
    console.log(`[VENTO CONTRACTS] MANUAL_INTERVENTION_ACTIONS ${result.manualInterventionActionCount}`);
    console.log(`[VENTO CONTRACTS] REUSED_CLOSURE_OUTCOMES ${result.reusedClosureOutcomeCount}`);
    console.log(`[VENTO CONTRACTS] EXTERNAL_SYSTEMS ${result.externalSystemCount}`);
    console.log('');
    console.log('=== RESULTADO PARA CHATGPT ===');
    console.log('ESTADO: PASS');
    console.log('OPERACION: INTEGRATION_DISPOSITION_VALIDATE');
    console.log(`FAILURE_SCOPES: ${result.failureScopeCount}`);
    console.log(`PARTIALITY_CLASSES: ${result.partialityClassCount}`);
    console.log(`DISPOSITIONS: ${result.dispositionCount}`);
    console.log(`QUARANTINE_REASONS: ${result.quarantineReasonCount}`);
    console.log(`DEAD_LETTER_GATES: ${result.deadLetterGateCount}`);
    console.log(`MANUAL_INTERVENTION_ACTIONS: ${result.manualInterventionActionCount}`);
    console.log(`REUSED_CLOSURE_OUTCOMES: ${result.reusedClosureOutcomeCount}`);
    console.log(`EXTERNAL_SYSTEMS: ${result.externalSystemCount}`);
    console.log(`MATERIALIZED_DISPOSITION_CASES: ${result.materializedDispositionCases}`);
    console.log(`MATERIALIZED_COMPENSATIONS: ${result.materializedCompensations}`);
    console.log('DEPENDENCY_BOUNDARY: PASS');
    console.log('PACKAGE_BOUNDARY: PASS');
    console.log('INTERNAL_INDEX_BOUNDARY: PASS');
    console.log('README_BOUNDARY: PASS');
    console.log('RUNTIME_SECRET_BOUNDARY: PASS');
    console.log('=== FIN RESULTADO PARA CHATGPT ===');
  } catch (error) {
    const message = error instanceof Error ? error.message : String(error);
    console.error('[VENTO CONTRACTS] INTEGRATION DISPOSITION VALIDATION FAIL');
    console.error(message);
    console.error('');
    console.error('=== RESULTADO PARA CHATGPT ===');
    console.error('ESTADO: FAIL');
    console.error('OPERACION: INTEGRATION_DISPOSITION_VALIDATE');
    console.error(`ERROR: ${message}`);
    console.error('=== FIN RESULTADO PARA CHATGPT ===');
    process.exitCode = 1;
  }
}

if (process.argv[1] && path.resolve(process.argv[1]) === currentFile) runCli();
