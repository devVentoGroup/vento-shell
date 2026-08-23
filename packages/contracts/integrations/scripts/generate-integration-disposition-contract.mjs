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
  'docs', 'plan-canonico', 'modular', 'bloques',
  'H_FUNDACION_COMPARTIDA', '01_CONTRATOS_DE_INTEGRACIONES_EXTERNAS.md',
);
const principalContractPath = path.join(
  integrationsRoot, 'generated', 'integration-principal.contract.ts',
);
const credentialContractPath = path.join(
  integrationsRoot, 'generated', 'external-credential-ref.contract.ts',
);
const externalReceivedEventContractPath = path.join(
  integrationsRoot, 'generated', 'external-received-event.contract.ts',
);
const mappingContractPath = path.join(
  integrationsRoot, 'generated', 'external-identifier-mapping.contract.ts',
);
const idempotencyReconciliationContractPath = path.join(
  integrationsRoot, 'generated', 'integration-idempotency-reconciliation.contract.ts',
);
const outputPath = path.join(
  integrationsRoot, 'generated', 'integration-disposition.contract.ts',
);

const shellCon017SourceContractSha256 =
  'c4ca8bdc55f98113d235107f99355ef6a69dbb59a7f0853a6e087c8fcad14839';
const shellCon018SourceContractSha256 =
  'b22094113048ee52d8ea8abe961af7fcb8be2b1924eabe69d0eb048d928bbb69';
const shellCon019SourceContractSha256 =
  '0faeb8d65edcf9b5806c6c962aefb76ab9cfd13e434d43cb549d559cd5cbaed1';
const shellCon022SourceContractSha256 =
  '89fbd1be5e68ec81239097376a1656eb4722ad6f38f55b1b76bb1f3dd469f474';
const shellCon023SourceContractSha256 =
  'd6630e1e3280845765308579eb06302ce1b476da96475de675a1667e06ee68f0';
const shellCon024SourceContractSha256 =
  'aae1f418511d792568d76a309b98fcdab74fbb13dc7ae4b559fa9561f5f72f30';

const failureScopes = Object.freeze([
  'REQUEST_OR_COMMAND',
  'OWNER_TRANSACTION',
  'EVENT_EMISSION',
  'DELIVERY',
  'CONSUMER_EFFECT',
  'BATCH_OR_BULK_ITEM',
  'EXTERNAL_EXCHANGE',
  'OFFLINE_OR_EVIDENCE',
]);

const partialityClasses = Object.freeze([
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

const dispositions = Object.freeze([
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

const quarantineReasons = Object.freeze([
  'UNTRUSTED_SIGNATURE_OR_AUTHENTICITY',
  'SCHEMA_OR_VERSION_UNSUPPORTED',
  'PAYLOAD_INTEGRITY_FAILED',
  'IDENTITY_OR_ROUTING_AMBIGUOUS',
  'SENSITIVITY_OR_POLICY_VIOLATION',
  'REPEATED_POISON_MESSAGE',
  'EVIDENCE_LINKAGE_INVALID',
  'MANUAL_HOLD_FOR_INVESTIGATION',
]);

const deadLetterGates = Object.freeze([
  'AUTOMATION_BUDGET_CLOSED',
  'ITEM_ISOLATED',
  'IDENTITY_AND_CONTENT_PRESERVED',
  'BUSINESS_OUTCOME_CLASSIFIED_OR_RECONCILIATION_OPEN',
  'OWNER_AND_NEXT_ACTION_ASSIGNED',
  'REPROCESSING_REQUIRES_AUTHORIZATION',
  'RETENTION_AND_AUDIT_DEFINED',
]);

const manualInterventionActions = Object.freeze([
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

const reconciliationClosureOutcomes = Object.freeze([
  'RESOLVED_CONFIRMED',
  'RESOLVED_NO_EFFECT',
  'RESOLVED_DUPLICATE_PRIOR_RESULT',
  'RESOLVED_CORRECTED',
  'RESOLVED_COMPENSATED',
  'RESOLVED_WITH_ACCEPTED_RESIDUAL',
  'PERMANENTLY_REJECTED',
  'SUPERSEDED_BY_SUCCESSOR',
]);

const externalSystems = Object.freeze([
  ['EXT-SYS-001', 'Supabase', 'GOBERNADA_POR_CONTRATO_INTERNO', 'ESPECIFICADO', 'Disposition is governed by the owning VENTO surface; no universal external quarantine is created for the platform.'],
  ['EXT-SYS-002', 'Wompi', 'APLICA_IDEMPOTENCIA_Y_CONCILIACION', 'ESPECIFICADO', 'Quarantine, rejection and reconciliation may apply by unit; compensation requires a confirmed effect and owner authority, never timeout alone.'],
  ['EXT-SYS-003', 'RevenueCat', 'APLICA_IDEMPOTENCIA_Y_CONCILIACION', 'ESPECIFICADO', 'Incompatible input or mapping may be isolated; uncertain entitlement is reconciled before correction or compensation.'],
  ['EXT-SYS-004', 'Resend', 'APLICA_IDEMPOTENCIA_Y_CONCILIACION', 'ESPECIFICADO', 'Delivery failure preserves generation and attempt; dead-letter does not prove business delivery or rejection and blind resend is forbidden.'],
  ['EXT-SYS-005', 'Expo / EAS Update', 'PLATAFORMA_TECNICA_SIN_EFECTO_EMPRESARIAL_EN_CORTE', 'ESPECIFICADO', 'Only owner-specific technical treatment applies when present; no fictitious business quarantine, ledger or compensation is created.'],
  ['EXT-SYS-006', 'Expo Push Service', 'APLICA_IDEMPOTENCIA_Y_CONCILIACION', 'ESPECIFICADO', 'Disposition is per destination and generation; one batch does not hide isolated elements and uncertain result does not authorize blind redelivery.'],
  ['EXT-SYS-007', 'Sentry', 'SIN_LEDGER_DE_EFECTO_EMPRESARIAL', 'ESPECIFICADO', 'Best-effort telemetry does not create business compensation or dead-letter; technical isolation preserves purpose and minimum evidence.'],
  ['EXT-SYS-008', 'Google Maps / Google Reviews', 'SIN_LEDGER_DE_EFECTO_EMPRESARIAL', 'ESPECIFICADO', 'Failed interactive reads may reject or degrade under their owner contract; no business dead-letter or compensation exists by default.'],
  ['EXT-SYS-009', 'Apple Wallet / PassKit y APNs', 'APLICA_IDEMPOTENCIA_Y_CONCILIACION', 'ESPECIFICADO', 'Resource and push remain separate units; each retains its own disposition and uncertain push never justifies resource recreation.'],
  ['EXT-SYS-010', 'Vercel', 'PLATAFORMA_TECNICA_SIN_EFECTO_EMPRESARIAL_EN_CORTE', 'ESPECIFICADO', 'Platform and continuity controls apply where owned; no fictitious business queue or remote compensation plan is created.'],
  ['EXT-SYS-011', 'Zebra BrowserPrint', 'APLICA_IDEMPOTENCIA_Y_CONCILIACION', 'ESPECIFICADO', 'Uncertain physical print result requires verification or reconciliation before reprint; manual action is authorized and audited per case.'],
  ['EXT-SYS-012', 'Google Wallet / Google Pay & Wallet', 'MODELO_SIN_BINDING_REMOTO', 'NO_APLICA', 'Without an accredited remote binding no provider quarantine, dead-letter or compensation runtime is materialized.'],
  ['EXT-SYS-013', 'POS externo vigente', 'APLICA_CON_ESPECIALIZACION_POS', 'ESPECIFICADO', 'Shared disposition applies while EXTERNAL-SALE-LINE-QUARANTINE-001, reversal rules and POS reconciliation remain owner specializations.'],
  ['EXT-SYS-014', 'Shopify / comercio electronico', 'NO_APLICA_SIN_BINDING', 'NO_APLICA', 'No unit, reason, queue, dead-letter or compensation is invented without an accredited binding.'],
  ['EXT-SYS-015', 'Rappi / marketplace', 'NO_APLICA_SIN_BINDING', 'NO_APLICA', 'No unit, reason, queue, dead-letter or compensation is invented without an accredited binding.'],
  ['EXT-SYS-016', 'ManyChat / automatizacion conversacional', 'NO_APLICA_SIN_BINDING', 'NO_APLICA', 'No unit, reason, queue, dead-letter or compensation is invented without an accredited binding.'],
  ['EXT-SYS-017', 'WhatsApp', 'NO_APLICA_SIN_BINDING', 'NO_APLICA', 'Provider, API, receipt, retry, quarantine, dead-letter and compensation are not presumed without an accredited binding.'],
  ['EXT-SYS-018', 'Instagram / social', 'NO_APLICA_SIN_BINDING', 'NO_APLICA', 'No unit, reason, queue, dead-letter or compensation is invented without an accredited binding.'],
  ['EXT-SYS-019', 'Correo corporativo y alias funcionales', 'NO_APLICA_SIN_BINDING', 'NO_APLICA', 'Organizational channel existence does not accredit provider runtime integration or technical disposition.'],
  ['EXT-SYS-020', 'Telefonia / voz', 'BLOQUEADO_SIN_BINDING', 'BLOQUEADO', 'The system remains blocked until provider and interface are accredited; no operator-specific disposition is invented.'],
  ['EXT-SYS-021', 'Transporte externo', 'NO_APLICA_SIN_BINDING', 'NO_APLICA', 'Without accredited provider and integration no delivery, dead-letter or compensation state is invented.'],
]);

function fail(message) {
  throw new Error(message);
}

function sha256(source) {
  return crypto.createHash('sha256').update(source).digest('hex');
}

function normalizeEol(value) {
  return String(value).replace(/^\uFEFF/u, '').replace(/\r\n?/gu, '\n');
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
  const lines = normalizeEol(source).split('\n');
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
    if (match) starts.push({ index, id: match.groups.id });
  });

  const taskIndex = starts.findIndex((entry) => entry.id === taskId);
  if (taskIndex < 0) fail(`Canonical task ${taskId} not found.`);
  const start = starts[taskIndex].index;
  const end = starts[taskIndex + 1]?.index ?? lines.length;
  return lines.slice(start, end).join('\n');
}

function assertIncludes(source, marker, label) {
  if (!source.includes(marker)) fail(`${label} is missing required content: ${marker}`);
}

function validateReconciliation(shellSource) {
  for (const marker of [
    '<!-- EXECUTION-GATE-RECONCILIATION:B001-200:SHELL-CON-017-024 -->',
    '`GLOBAL_ENABLE_ONCE`',
    '`PRE_E5_FOUNDATION`',
    '`<task_id>::GLOBAL`',
  ]) {
    assertIncludes(shellSource, marker, 'SHELL-CON reconciliation');
  }
}

function validateShellCon024(shellSource) {
  const task = extractTaskSection(shellSource, 'SHELL-CON-024');
  const actualHash = sha256(task);
  if (actualHash !== shellCon024SourceContractSha256) {
    fail(`SHELL-CON-024 source contract SHA256 mismatch: expected ${shellCon024SourceContractSha256}, received ${actualHash}.`);
  }

  const required = [
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
    'IntegrationIdempotencyRef',
    'IntegrationReconciliationRef',
    'IntegrationReconciliationClosureOutcome',
    'REQUEST_OR_COMMAND',
    'OWNER_TRANSACTION',
    'EVENT_EMISSION',
    'DELIVERY',
    'CONSUMER_EFFECT',
    'BATCH_OR_BULK_ITEM',
    'EXTERNAL_EXCHANGE',
    'OFFLINE_OR_EVIDENCE',
    'NO_EFFECT_CONFIRMED',
    'SOME_EFFECTS_CONFIRMED',
    'SOME_EFFECTS_UNKNOWN',
    'ALL_EFFECTS_UNKNOWN',
    'DEPENDENCY_INCOMPLETE',
    'CONFLICTING_RESULTS',
    'UNTRUSTED_OR_TAMPERED_INPUT',
    'CONTRACT_OR_SCHEMA_INCOMPATIBLE',
    'EXTERNAL_STATE_DIVERGENCE',
    'RETRY_SAME_OPERATION',
    'QUERY_AUTHORITATIVE_RESULT',
    'RECONCILE',
    'QUARANTINE',
    'DEAD_LETTER_CANDIDATE',
    'PERMANENTLY_REJECT',
    'COMPENSATE_CONFIRMED_EFFECTS',
    'CREATE_CORRECTION_OR_SUCCESSOR',
    'UNTRUSTED_SIGNATURE_OR_AUTHENTICITY',
    'REPEATED_POISON_MESSAGE',
    'MANUAL_HOLD_FOR_INVESTIGATION',
    'AUTOMATION_BUDGET_CLOSED',
    'BUSINESS_OUTCOME_CLASSIFIED_OR_RECONCILIATION_OPEN',
    'RETENTION_AND_AUDIT_DEFINED',
    'REPROCESS_FROM_QUARANTINE',
    'REPROCESS_FROM_DEAD_LETTER',
    'START_COMPENSATION',
    'INT-DB-006',
    'INT-DB-007',
    'INT-DB-008',
    'QUEUE-ARC-008',
    'QUEUE-ARC-009',
    'QUEUE-ARC-011',
    'QUEUE-ARC-012',
    'SHELL-NORM-001',
    'NO GENERA REQUISITOS DE PRUEBA',
  ];
  for (const marker of required) assertIncludes(task, marker, 'SHELL-CON-024');

  for (let index = 1; index <= 21; index += 1) {
    assertIncludes(task, `EXT-SYS-${String(index).padStart(3, '0')}`, 'SHELL-CON-024 EXT-SYS coverage');
  }

  return task;
}

function validateDependencies(principalSource, credentialSource, eventSource, mappingSource, idempotencySource) {
  for (const marker of [
    'Contract task: SHELL-CON-017',
    `Source contract SHA256: ${shellCon017SourceContractSha256}`,
    'export type IntegrationPrincipalId',
    'export type IntegrationPrincipalRef',
  ]) assertIncludes(principalSource, marker, 'SHELL-CON-017 dependency');

  for (const marker of [
    'Contract task: SHELL-CON-018',
    `Source contract SHA256: ${shellCon018SourceContractSha256}`,
    'export type ExternalCredentialId',
    'export type ExternalCredentialRef',
  ]) assertIncludes(credentialSource, marker, 'SHELL-CON-018 dependency');

  for (const marker of [
    'Contract task: SHELL-CON-019',
    `Source contract SHA256: ${shellCon019SourceContractSha256}`,
    'export interface ExternalReceivedEvent<TNormalizedAssertion>',
    'disposition_contract_task_id: "SHELL-CON-024"',
  ]) assertIncludes(eventSource, marker, 'SHELL-CON-019 dependency');

  for (const marker of [
    'Contract task: SHELL-CON-022',
    `Source contract SHA256: ${shellCon022SourceContractSha256}`,
    'export type ExternalIdentifierMappingRef',
    'disposition_contract_task_id: "SHELL-CON-024"',
  ]) assertIncludes(mappingSource, marker, 'SHELL-CON-022 dependency');

  for (const marker of [
    'Contract task: SHELL-CON-023',
    `Source contract SHA256: ${shellCon023SourceContractSha256}`,
    'export interface IntegrationIdempotencyRef',
    'export type IntegrationReconciliationRef',
    'export type IntegrationReconciliationClosureOutcome',
    'disposition_contract_task_id: "SHELL-CON-024"',
  ]) assertIncludes(idempotencySource, marker, 'SHELL-CON-023 dependency');

  for (const value of reconciliationClosureOutcomes) {
    assertIncludes(idempotencySource, `"${value}"`, 'SHELL-CON-023 reconciliation closure vocabulary');
  }
}

function renderStringArray(name, values) {
  return `export const ${name} = [\n${values.map((value) => `  ${JSON.stringify(value)},`).join('\n')}\n] as const;`;
}

function renderAdoptionRows() {
  return externalSystems.map(([externalSystemId, system, inheritedClassification, state, decisionSummary]) => `  {\n    external_system_id: ${JSON.stringify(externalSystemId)},\n    system: ${JSON.stringify(system)},\n    inherited_classification: ${JSON.stringify(inheritedClassification)},\n    state: ${JSON.stringify(state)},\n    decision_summary: ${JSON.stringify(decisionSummary)},\n    materialized_disposition_case_count: 0,\n    materialized_compensation_count: 0,\n  },`).join('\n');
}

function renderContract() {
  return `// GENERATED FILE. DO NOT EDIT.\n// Semantic owners: INT-APP-006, INT-APP-009, INT-EXT-016, INT-EXT-017, INT-POS-012, INT-POS-019, INT-POS-020\n// Contract task: SHELL-CON-024\n// Foundation task: SHELL-CON-001\n// External received event task: SHELL-CON-019\n// External identifier mapping task: SHELL-CON-022\n// Idempotency and reconciliation task: SHELL-CON-023\n// Physical quarantine owner: INT-DB-006\n// Physical processing audit owner: INT-DB-007\n// Physical reconciliation owner: INT-DB-008\n// Source contract SHA256: ${shellCon024SourceContractSha256}\n\nimport type { VentoCredentialEnvironment } from "./external-credential-ref.contract.js";\nimport type { IntegrationPrincipalRef } from "./integration-principal.contract.js";\nimport type { ExternalIdentifierMappingRef } from "./external-identifier-mapping.contract.js";\nimport type {\n  IntegrationIdempotencyRef,\n  IntegrationReconciliationClosureOutcome,\n  IntegrationReconciliationRef,\n} from "./integration-idempotency-reconciliation.contract.js";\n\ndeclare const integrationDispositionCaseIdBrand: unique symbol;\ndeclare const integrationQuarantineRefBrand: unique symbol;\ndeclare const integrationDeadLetterRefBrand: unique symbol;\n\nexport type IntegrationDispositionCaseId =\n  string & {\n    readonly [integrationDispositionCaseIdBrand]: "IntegrationDispositionCaseId";\n  };\n\nexport type IntegrationQuarantineRef =\n  string & {\n    readonly [integrationQuarantineRefBrand]: "IntegrationQuarantineRef";\n  };\n\nexport type IntegrationDeadLetterRef =\n  string & {\n    readonly [integrationDeadLetterRefBrand]: "IntegrationDeadLetterRef";\n  };\n\nexport type IntegrationDispositionCaseRef = Readonly<{\n  readonly integration_disposition_case_id: IntegrationDispositionCaseId;\n  readonly contract_version: string;\n}>;\n\nexport interface IntegrationCompensationPlanRef {\n  readonly plan_ref: string;\n  readonly contract_version: string;\n  readonly original_confirmed_effect_ref: string;\n  readonly owner_ref: string;\n  readonly ccr_action_ref: string;\n  readonly plan_outcome_ref: string | null;\n  readonly verification_refs: readonly string[];\n  readonly audit_refs: readonly string[];\n}\n\n${renderStringArray('INTEGRATION_FAILURE_SCOPES', failureScopes)}\n\nexport type IntegrationFailureScope =\n  typeof INTEGRATION_FAILURE_SCOPES[number];\n\n${renderStringArray('INTEGRATION_PARTIALITY_CLASSES', partialityClasses)}\n\nexport type IntegrationPartialityClass =\n  typeof INTEGRATION_PARTIALITY_CLASSES[number];\n\n${renderStringArray('INTEGRATION_DISPOSITIONS', dispositions)}\n\nexport type IntegrationDisposition =\n  typeof INTEGRATION_DISPOSITIONS[number];\n\n${renderStringArray('INTEGRATION_QUARANTINE_REASONS', quarantineReasons)}\n\nexport type IntegrationQuarantineReason =\n  typeof INTEGRATION_QUARANTINE_REASONS[number];\n\n${renderStringArray('INTEGRATION_DEAD_LETTER_GATES', deadLetterGates)}\n\nexport type IntegrationDeadLetterGate =\n  typeof INTEGRATION_DEAD_LETTER_GATES[number];\n\n${renderStringArray('INTEGRATION_MANUAL_INTERVENTION_ACTIONS', manualInterventionActions)}\n\nexport type IntegrationManualInterventionAction =\n  typeof INTEGRATION_MANUAL_INTERVENTION_ACTIONS[number];\n\nexport interface IntegrationDispositionCase {\n  readonly integration_disposition_case_id: IntegrationDispositionCaseId;\n  readonly failure_scope: IntegrationFailureScope;\n  readonly partiality_class: IntegrationPartialityClass;\n  readonly disposition: IntegrationDisposition;\n  readonly owner_application: string;\n  readonly owner_domain_ref: string;\n  readonly resource_or_operation_refs: readonly string[];\n  readonly external_system_id: string | null;\n  readonly environment: VentoCredentialEnvironment | null;\n  readonly surface: string | null;\n  readonly integration_principal_ref: IntegrationPrincipalRef | null;\n  readonly external_received_event_ref: string | null;\n  readonly external_identifier_mapping_refs: readonly ExternalIdentifierMappingRef[];\n  readonly idempotency_ref: IntegrationIdempotencyRef | null;\n  readonly reconciliation_ref: IntegrationReconciliationRef | null;\n  readonly quarantine_ref: IntegrationQuarantineRef | null;\n  readonly dead_letter_ref: IntegrationDeadLetterRef | null;\n  readonly compensation_plan_ref: IntegrationCompensationPlanRef | null;\n  readonly original_evidence_refs: readonly string[];\n  readonly content_integrity_ref: string | null;\n  readonly contract_or_schema_version: string;\n  readonly quarantine_reason: IntegrationQuarantineReason | null;\n  readonly owner_specialization_ref: string | null;\n  readonly owner_resolution_detail: string | null;\n  readonly dead_letter_gate_results: readonly Readonly<{\n    readonly gate: IntegrationDeadLetterGate;\n    readonly satisfied: boolean;\n    readonly evidence_refs: readonly string[];\n  }>[];\n  readonly manual_intervention_action: IntegrationManualInterventionAction | null;\n  readonly authorization_reference: string | null;\n  readonly attempt_references: readonly string[];\n  readonly business_outcome_reference: string | null;\n  readonly responsible_owner: string;\n  readonly next_action: string | null;\n  readonly residual_obligations: readonly string[];\n  readonly retention_policy_ref: string | null;\n  readonly legal_hold_reference: string | null;\n  readonly audit_references: readonly string[];\n  readonly closure_outcome: IntegrationReconciliationClosureOutcome | null;\n  readonly created_at: string;\n  readonly updated_at: string;\n  readonly closed_at: string | null;\n}\n\nexport const INTEGRATION_DISPOSITION_IDENTITY_POLICY = {\n  identity_name: "IntegrationDispositionCaseId",\n  semantics: "STABLE_OPAQUE_NON_SECRET_DISPOSITION_CASE_IDENTITY",\n  serialization: "UNSPECIFIED",\n  syntax_pattern: null,\n  static_registry: false,\n  materialized_case_id_count: 0,\n  derived_from_payload_amount_date_email_phone_product_provider_or_error_text: false,\n  is_event_id: false,\n  is_receipt_id: false,\n  is_attempt_id: false,\n  is_delivery_id: false,\n  is_mapping_id: false,\n  is_sale_id: false,\n  is_sale_line_id: false,\n  is_correlation_id: false,\n  is_idempotency_key: false,\n  technical_retry_creates_new_case_by_default: false,\n  closed_identity_reusable: false,\n} as const;\n\nexport const INTEGRATION_DISPOSITION_SEPARATION_POLICY = {\n  disposition_case_is_business_operation: false,\n  disposition_case_is_event: false,\n  disposition_case_is_receipt: false,\n  disposition_case_is_business_result: false,\n  disposition_case_is_technical_attempt: false,\n  disposition_case_is_idempotency_key: false,\n  disposition_case_is_reconciliation_case: false,\n  disposition_case_is_compensation_plan: false,\n  quarantine_is_dead_letter: false,\n  dead_letter_is_business_rejection: false,\n  rejection_is_unknown_result: false,\n  reconciliation_is_compensation: false,\n  compensation_is_retry: false,\n  contingency_is_disposition: false,\n} as const;\n\nexport const INTEGRATION_QUARANTINE_POLICY = {\n  isolated_unit_preserves_original_identity: true,\n  original_content_or_protected_evidence_preserved: true,\n  integrity_reference_preserved_when_applicable: true,\n  contract_and_version_preserved: true,\n  provenance_preserved: true,\n  reason_owner_responsible_party_and_next_action_required_when_applicable: true,\n  source_business_state_mutated_by_quarantine: false,\n  quarantine_auto_applies_business_effect: false,\n  release_by_age_allowed: false,\n  release_by_alert_disappearance_allowed: false,\n  quarantine_proves_no_prior_effect: false,\n  quarantine_is_secret_store: false,\n  owner_specialization_may_relax_shared_security_integrity_identity_or_ownership: false,\n} as const;\n\nexport const INTEGRATION_DEAD_LETTER_POLICY = {\n  gate_count: 7,\n  all_gates_required: true,\n  retry_exhaustion_satisfies_all_gates: false,\n  retry_exhaustion_may_satisfy_only_automation_budget_gate: true,\n  one_false_gate_allows_complete_dead_letter: false,\n  outcome_uncertainty_allowed_only_with_explicit_open_reconciliation: true,\n  dead_letter_removes_owner_or_next_action_requirement: false,\n  dead_letter_is_terminal_business_failure_by_definition: false,\n  age_satisfies_business_gate: false,\n} as const;\n\nexport const INTEGRATION_TERMINAL_REJECTION_POLICY = {\n  exact_unit_identity_required: true,\n  applicable_contract_required: true,\n  terminal_cause_required: true,\n  absence_of_incompatible_effect_required: true,\n  unresolved_outcome_unknown_allowed: false,\n  unresolved_result_unknown_allowed: false,\n  hidden_partial_effect_allowed: false,\n  owner_and_decision_authority_required: true,\n  evidence_and_audit_required: true,\n  rejection_fabricates_external_fact_state: false,\n} as const;\n\nexport const INTEGRATION_UNKNOWN_RESULT_DISPOSITION_POLICY = {\n  timeout_equals_failure: false,\n  no_response_equals_no_effect: false,\n  quarantine_resolves_uncertainty: false,\n  dead_letter_resolves_uncertainty: false,\n  rejection_closes_uncertainty: false,\n  compensation_for_hypothetical_effect_allowed: false,\n  authoritative_source_or_receipt_queried_before_material_repeat: true,\n  confirmed_effect_recovers_result_or_evaluates_compensation_when_eligible: true,\n  demonstrated_no_effect_may_retry_or_reject_under_owner_contract: true,\n  indeterminate_result_requires_reconciliation: true,\n  operational_isolation_and_open_reconciliation_may_coexist: true,\n  outcome_unknown_and_result_unknown_are_distinct_layers: true,\n} as const;\n\nexport const INTEGRATION_MANUAL_INTERVENTION_POLICY = {\n  action_count: 10,\n  allowlist_only: true,\n  actor_or_principal_required: true,\n  current_authority_required: true,\n  reason_and_exact_scope_required: true,\n  previous_state_and_evidence_required: true,\n  resulting_attempt_and_result_recorded_when_applicable: true,\n  audit_refs_required: true,\n  next_action_required_when_case_remains_open: true,\n  alert_receipt_grants_execution_authority: false,\n  support_membership_grants_business_authority: false,\n  read_access_grants_intervention_authority: false,\n} as const;\n\nexport const INTEGRATION_REPROCESS_POLICY = {\n  same_intent_preserves_business_identity: true,\n  same_intent_preserves_idempotency_scope_and_key: true,\n  same_intent_requires_compatible_fingerprint: true,\n  applicable_event_command_or_external_identity_preserved: true,\n  owner_purpose_sensitivity_correlation_and_source_evidence_preserved: true,\n  retry_budget_history_preserved: true,\n  technical_attempt_id_may_change: true,\n  reprocess_creates_second_business_effect: false,\n} as const;\n\nexport const INTEGRATION_SUCCESSOR_POLICY = {\n  material_intent_payload_resource_amount_quantity_recipient_version_action_or_authority_change_is_simple_reprocess: false,\n  material_change_requires_correction_or_successor: true,\n  successor_uses_new_identity_for_new_intent: true,\n  successor_relationship_to_original_required: true,\n  original_case_reinterpreted_or_overwritten: false,\n} as const;\n\nexport const INTEGRATION_COMPENSATION_POLICY = {\n  confirmed_original_effect_required: true,\n  original_effect_identity_and_correlation_required: true,\n  reversibility_or_valid_compensation_policy_required: true,\n  effect_owner_required: true,\n  current_authority_required: true,\n  compensation_has_own_identity_and_idempotency: true,\n  dependencies_and_residuals_explicit: true,\n  result_verifiable: true,\n  timeout_without_result_compensable: false,\n  technical_ack_compensable: false,\n  hypothetical_effect_compensable: false,\n  unconfirmed_delivery_compensable: false,\n  rejected_input_without_effect_compensable: false,\n  unresolved_divergence_compensable: false,\n  ambiguous_mapping_compensable: false,\n  original_effect_deleted_or_edited_to_simulate_non_occurrence: false,\n  confirmed_compensation_repeated_on_retry: false,\n  equivalent_compensation_request_recovers_prior_result: true,\n  incompatible_compensation_content_result: "CONFLICTING_REUSE",\n  partial_compensation_preserves_confirmed_pending_impossible_and_residual_steps: true,\n  cross_owner_automatic_compensation_allowed: false,\n} as const;\n\nexport const INTEGRATION_NO_GLOBAL_ROLLBACK_POLICY = {\n  global_rollback_across_pulso_nexo_numera_pass_and_provider_exists: false,\n  consistency_uses_scope_idempotency_durable_results_safe_retry_reconciliation_successors_and_owner_compensation: true,\n  confirmed_owner_effect_may_coexist_with_pending_rejected_or_unknown_other_effect: true,\n} as const;\n\nexport const INTEGRATION_RECONCILIATION_COMPATIBILITY_POLICY = {\n  reconciliation_type_owner_task_id: "SHELL-CON-023",\n  closure_outcome_type: "IntegrationReconciliationClosureOutcome",\n  reused_closure_outcome_count: 8,\n  duplicate_closure_vocabulary_created_here: false,\n  disposition_case_may_link_reconciliation_case: true,\n  disposition_case_is_reconciliation_case: false,\n  reconciliation_compares_authoritative_sources: true,\n  reconciliation_rewrites_history: false,\n  reconciliation_enables_cross_owner_write: false,\n  reconciliation_replays_confirmed_effects: false,\n  closed_unknown_outcome_allowed: false,\n  close_by_age_silence_alert_disappearance_dead_letter_worker_restart_or_archive_allowed: false,\n} as const;\n\nexport const INTEGRATION_RESIDUAL_POLICY = {\n  accepted_residual_requires_exact_residual: true,\n  owner_required: true,\n  responsible_party_required: true,\n  risk_required: true,\n  control_required: true,\n  accepting_authority_required: true,\n  follow_up_condition_or_time_required: true,\n  decision_evidence_required: true,\n  residual_without_responsible_party_is_valid_closure: false,\n} as const;\n\nexport const INTEGRATION_OWNERSHIP_AUTHORIZATION_POLICY = {\n  adapter_may_record_own_technical_metadata_receipts_mappings_and_evidence: true,\n  owner_application_retains_business_decision: true,\n  queue_becomes_business_fact_owner: false,\n  support_case_assignment_grants_business_authority: false,\n  observability_may_modify_private_owner_source: false,\n  compensation_executes_within_effect_owner: true,\n  cross_domain_correction_expressed_through_owner_contract: true,\n  authenticated_integration_principal_implies_retry_reprocess_reject_or_compensation_authority: false,\n  external_credential_grants_transverse_vento_authority: false,\n  shared_database_service_role_connection_schema_or_package_transfers_functional_ownership: false,\n} as const;\n\nexport const INTEGRATION_POS_DISPOSITION_POLICY = {\n  external_system_id: "EXT-SYS-013",\n  shared_contract_applies: true,\n  owner_specialization_ref: "EXTERNAL-SALE-LINE-QUARANTINE-001",\n  quarantine_owner_unit: "CANONICAL_SALE_LINE_WHEN_MAPPING_BLOCKS_PRODUCT_DEPENDENT_EFFECT",\n  active_quarantined_line_nexo_product_effect_count: 0,\n  release_executes_inventory: false,\n  corrected_mapping_changes_line_identity: false,\n  possibility_of_prior_effect_requires_reconciliation_first: true,\n  reversals_returns_and_refunds_preserve_original_sale_and_line: true,\n  nexo_numera_pass_compensate_only_own_confirmed_effects: true,\n  global_sale_rollback_exists: false,\n  reconciliation_reexecutes_already_confirmed_effects: false,\n} as const;\n\nexport const INTEGRATION_BATCH_DISPOSITION_POLICY = {\n  each_item_preserves_identity_and_disposition: true,\n  confirmed_item_repeated_due_to_other_item_failure: false,\n  rejected_item_cancels_independent_item: false,\n  unknown_item_presented_as_failed_to_close_batch: false,\n  summary_replaces_item_results: false,\n  dead_letter_may_apply_per_item_without_promoting_entire_batch: true,\n  compensation_evaluated_per_confirmed_effect: true,\n  residuals_and_responsible_parties_preserved_per_unit_when_needed: true,\n} as const;\n\nexport const INTEGRATION_RETRY_DEAD_LETTER_POLICY = {\n  retryable_failure_retries_same_operation_within_budget: true,\n  exhausted_budget_requires_result_and_partiality_classification: true,\n  exhausted_budget_requires_dead_letter_gate_evaluation: true,\n  exhausted_budget_auto_permanently_rejects: false,\n  exhausted_budget_auto_completes_dead_letter: false,\n  budget_resets_on_restart_redeploy_worker_requeue_or_transport_change: false,\n} as const;\n\nexport const INTEGRATION_DISPOSITION_SECURITY_POLICY = {\n  purpose_minimization_required: true,\n  api_key_allowed: false,\n  bearer_token_allowed: false,\n  service_role_allowed: false,\n  private_key_allowed: false,\n  password_allowed: false,\n  reusable_signature_material_allowed: false,\n  full_personal_payload_allowed_by_convenience: false,\n  full_bank_data_allowed: false,\n  full_document_allowed_when_protected_reference_is_sufficient: false,\n  signed_url_or_credential_parameter_allowed: false,\n  unnecessary_sensitive_diagnostic_allowed: false,\n  protected_refs_hashes_and_minimum_metadata_preferred: true,\n  case_access_grants_full_evidence_access: false,\n} as const;\n\nexport const INTEGRATION_DISPOSITION_ADOPTION = [\n${renderAdoptionRows()}\n] as const;\n\nexport const INTEGRATION_DISPOSITION_COVERAGE = {\n  expected_external_system_count: 21,\n  adopted_external_system_count: 21,\n  missing_external_system_count: 0,\n  duplicate_external_system_count: 0,\n  unique_external_system_id_count: 21,\n  governed_by_internal_contract_count: 1,\n  idempotency_and_reconciliation_count: 6,\n  no_business_effect_ledger_count: 2,\n  technical_platform_without_business_effect_count: 2,\n  model_without_remote_binding_count: 1,\n  pos_specialization_count: 1,\n  no_binding_not_applicable_count: 7,\n  blocked_without_binding_count: 1,\n  specified_disposition_state_count: 12,\n  not_applicable_disposition_state_count: 8,\n  blocked_disposition_state_count: 1,\n  materialized_disposition_case_count: 0,\n  materialized_quarantine_record_count: 0,\n  materialized_dead_letter_record_count: 0,\n  materialized_compensation_count: 0,\n} as const;\n\nexport const INTEGRATION_DISPOSITION_CONTRACT_METADATA = {\n  logical_namespace: "@vento/contracts/integrations",\n  contract_task_id: "SHELL-CON-024",\n  semantic_owner_task_ids: [\n    "INT-APP-006",\n    "INT-APP-009",\n    "INT-EXT-016",\n    "INT-EXT-017",\n    "INT-POS-012",\n    "INT-POS-019",\n    "INT-POS-020",\n  ],\n  integration_principal_contract_task_id: "SHELL-CON-017",\n  external_credential_contract_task_id: "SHELL-CON-018",\n  external_received_event_contract_task_id: "SHELL-CON-019",\n  external_identifier_mapping_contract_task_id: "SHELL-CON-022",\n  idempotency_reconciliation_contract_task_id: "SHELL-CON-023",\n  physical_quarantine_owner_task_id: "INT-DB-006",\n  physical_processing_audit_owner_task_id: "INT-DB-007",\n  physical_reconciliation_owner_task_id: "INT-DB-008",\n  queue_failure_recovery_owner_task_id: "QUEUE-ARC-008",\n  queue_reprocess_exclusion_owner_task_id: "QUEUE-ARC-009",\n  queue_metrics_owner_task_id: "QUEUE-ARC-011",\n  queue_manual_authorization_owner_task_id: "QUEUE-ARC-012",\n  next_contract_task_id: "SHELL-NORM-001",\n  execution_gate: "PRE_E5_FOUNDATION",\n  physical_mode: "GLOBAL_ENABLE_ONCE",\n  public_export_published: false,\n  package_root_index_extended: false,\n  consumer_adoption_materialized: false,\n  persistence_materialized: false,\n  queue_materialized: false,\n  worker_materialized: false,\n  retry_runtime_materialized: false,\n  reprocess_runtime_materialized: false,\n  compensation_runtime_materialized: false,\n  endpoint_materialized: false,\n  migration_materialized: false,\n  supabase_changed: false,\n  materialized_disposition_case_count: 0,\n  materialized_compensation_count: 0,\n} as const;\n\nexport type IntegrationDispositionIdentityPolicy = typeof INTEGRATION_DISPOSITION_IDENTITY_POLICY;\nexport type IntegrationDispositionSeparationPolicy = typeof INTEGRATION_DISPOSITION_SEPARATION_POLICY;\nexport type IntegrationQuarantinePolicy = typeof INTEGRATION_QUARANTINE_POLICY;\nexport type IntegrationDeadLetterPolicy = typeof INTEGRATION_DEAD_LETTER_POLICY;\nexport type IntegrationTerminalRejectionPolicy = typeof INTEGRATION_TERMINAL_REJECTION_POLICY;\nexport type IntegrationUnknownResultDispositionPolicy = typeof INTEGRATION_UNKNOWN_RESULT_DISPOSITION_POLICY;\nexport type IntegrationManualInterventionPolicy = typeof INTEGRATION_MANUAL_INTERVENTION_POLICY;\nexport type IntegrationReprocessPolicy = typeof INTEGRATION_REPROCESS_POLICY;\nexport type IntegrationSuccessorPolicy = typeof INTEGRATION_SUCCESSOR_POLICY;\nexport type IntegrationCompensationPolicy = typeof INTEGRATION_COMPENSATION_POLICY;\nexport type IntegrationNoGlobalRollbackPolicy = typeof INTEGRATION_NO_GLOBAL_ROLLBACK_POLICY;\nexport type IntegrationReconciliationCompatibilityPolicy = typeof INTEGRATION_RECONCILIATION_COMPATIBILITY_POLICY;\nexport type IntegrationResidualPolicy = typeof INTEGRATION_RESIDUAL_POLICY;\nexport type IntegrationOwnershipAuthorizationPolicy = typeof INTEGRATION_OWNERSHIP_AUTHORIZATION_POLICY;\nexport type IntegrationPosDispositionPolicy = typeof INTEGRATION_POS_DISPOSITION_POLICY;\nexport type IntegrationBatchDispositionPolicy = typeof INTEGRATION_BATCH_DISPOSITION_POLICY;\nexport type IntegrationRetryDeadLetterPolicy = typeof INTEGRATION_RETRY_DEAD_LETTER_POLICY;\nexport type IntegrationDispositionSecurityPolicy = typeof INTEGRATION_DISPOSITION_SECURITY_POLICY;\nexport type IntegrationDispositionContractMetadata = typeof INTEGRATION_DISPOSITION_CONTRACT_METADATA;\n`;
}

function writeOrCheck(filePath, content, checkOnly, label) {
  const expected = normalizeEol(content);
  const exists = fs.existsSync(filePath);
  const current = exists ? normalizeEol(fs.readFileSync(filePath, 'utf8')) : null;

  if (checkOnly) {
    if (!exists) fail(`${label} is missing.`);
    if (current !== expected) fail(`${label} is stale.`);
    return 'FRESH';
  }

  fs.mkdirSync(path.dirname(filePath), { recursive: true });
  if (current === expected) return 'FRESH';
  fs.writeFileSync(filePath, expected, 'utf8');
  return exists ? 'UPDATED' : 'CREATED';
}

export function generateIntegrationDispositionContract({ checkOnly = false } = {}) {
  const shellSource = readText(shellContractSourcePath, 'SHELL-CON owner source');
  const principalSource = readText(principalContractPath, 'integration principal contract');
  const credentialSource = readText(credentialContractPath, 'external credential contract');
  const eventSource = readText(externalReceivedEventContractPath, 'external received event contract');
  const mappingSource = readText(mappingContractPath, 'external identifier mapping contract');
  const idempotencySource = readText(idempotencyReconciliationContractPath, 'integration idempotency reconciliation contract');

  validateReconciliation(shellSource);
  validateShellCon024(shellSource);
  validateDependencies(principalSource, credentialSource, eventSource, mappingSource, idempotencySource);

  const status = writeOrCheck(outputPath, renderContract(), checkOnly, 'integration disposition contract');

  return Object.freeze({
    status,
    failureScopeCount: failureScopes.length,
    partialityClassCount: partialityClasses.length,
    dispositionCount: dispositions.length,
    quarantineReasonCount: quarantineReasons.length,
    deadLetterGateCount: deadLetterGates.length,
    manualInterventionActionCount: manualInterventionActions.length,
    reusedClosureOutcomeCount: reconciliationClosureOutcomes.length,
    externalSystemCount: externalSystems.length,
    materializedDispositionCases: 0,
    materializedCompensations: 0,
  });
}

function runCli() {
  try {
    const unknownArgs = process.argv.slice(2).filter((arg) => arg !== '--check');
    if (unknownArgs.length > 0) fail(`Unknown arguments: ${unknownArgs.join(', ')}`);
    const checkOnly = process.argv.includes('--check');
    const result = generateIntegrationDispositionContract({ checkOnly });

    console.log('[VENTO CONTRACTS] INTEGRATION DISPOSITION GENERATION PASS');
    console.log(`[VENTO CONTRACTS] MODE ${checkOnly ? 'CHECK' : 'WRITE'}`);
    console.log(`[VENTO CONTRACTS] STATUS ${result.status}`);
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
    console.log('OPERACION: INTEGRATION_DISPOSITION_GENERATE');
    console.log(`MODE: ${checkOnly ? 'CHECK' : 'WRITE'}`);
    console.log(`CONTRACT_STATUS: ${result.status}`);
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
    console.log('=== FIN RESULTADO PARA CHATGPT ===');
  } catch (error) {
    const message = error instanceof Error ? error.message : String(error);
    console.error('[VENTO CONTRACTS] INTEGRATION DISPOSITION GENERATION FAIL');
    console.error(message);
    console.error('');
    console.error('=== RESULTADO PARA CHATGPT ===');
    console.error('ESTADO: FAIL');
    console.error('OPERACION: INTEGRATION_DISPOSITION_GENERATE');
    console.error(`ERROR: ${message}`);
    console.error('=== FIN RESULTADO PARA CHATGPT ===');
    process.exitCode = 1;
  }
}

if (process.argv[1] && path.resolve(process.argv[1]) === currentFile) runCli();
