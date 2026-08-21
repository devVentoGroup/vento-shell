import fs from 'node:fs';
import path from 'node:path';
import { fileURLToPath } from 'node:url';

import {
  generateWorkItemContracts,
} from './generate-work-item-contracts.mjs';

const currentFile = fileURLToPath(import.meta.url);
const scriptDirectory = path.dirname(currentFile);
const workItemsRoot = path.resolve(scriptDirectory, '..');
const contractsRoot = path.resolve(workItemsRoot, '..');

const contractPath = path.join(
  workItemsRoot,
  'generated',
  'work-item.contract.ts',
);
const indexPath = path.join(
  workItemsRoot,
  'generated',
  'index.ts',
);
const workItemsReadmePath = path.join(workItemsRoot, 'README.md');
const contractsReadmePath = path.join(contractsRoot, 'README.md');
const packageJsonPath = path.join(contractsRoot, 'package.json');

const expectedFields = Object.freeze([
  'work_item_id',
  'process_id',
  'process_instance_id',
  'process_step',
  'owner_app_code',
  'source_ref',
  'work_item_type',
  'work_lane',
  'status',
  'readiness_status',
  'assignment_mode',
  'assigned_actor_ref',
  'eligible_actor_set_ref',
  'queue_ref',
  'required_context_ref',
  'required_permission_ref',
  'resource_ref',
  'location_ref',
  'available_at',
  'due_at',
  'priority_class',
  'priority_policy_version',
  'blocking_refs',
  'next_action_code',
  'work_item_version',
  'claim_or_lease_ref',
  'idempotency_scope',
  'created_at',
  'updated_at',
]);

const expectedTypes = Object.freeze([
  'EXECUTE_STEP',
  'VERIFY_STEP',
  'HANDOFF_ACCEPTANCE',
  'PERSONAL_OBLIGATION',
  'SUPERVISORY_RESPONSE',
  'SAFETY_RESPONSE',
  'FOLLOW_UP',
  'RECOVERY',
]);

const expectedStatuses = Object.freeze([
  'NOT_READY',
  'AVAILABLE',
  'OFFERED',
  'ASSIGNED',
  'CLAIMED',
  'IN_PROGRESS',
  'WAITING',
  'BLOCKED',
  'PAUSED',
  'COMPLETION_PENDING_SYNC',
  'COMPLETED',
  'CANCELLED',
  'SUPERSEDED',
  'EXPIRED',
  'CONFLICT',
  'RECONCILIATION_REQUIRED',
]);

const expectedReadinessStatuses = Object.freeze([
  'EXECUTABLE_NOW',
  'VISIBLE_NOT_EXECUTABLE',
  'WAITING_EXTERNAL',
  'BLOCKED_RECOVERABLE',
  'BLOCKED_REQUIRES_OTHER_ACTOR',
  'STALE_REQUIRES_REFRESH',
  'NOT_ELIGIBLE',
]);

const expectedIdentitySeparations = Object.freeze([
  'ProcessId',
  'process_instance_id',
  'ProcessStateId',
  'FunctionalActionId',
  'BusinessEventId',
  'PermissionId',
  'ScreenId',
  'navigation_id',
  'claim_or_lease_ref',
  'handoff_relation',
  'alert_or_notification_id',
]);

function fail(message) {
  throw new Error(message);
}

function normalizeEol(value) {
  return String(value).replace(/\r\n?/g, '\n');
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

function assertExactSequence(actual, expected, label) {
  if (actual.length !== expected.length) {
    fail(`${label} must contain ${expected.length}; received ${actual.length}.`);
  }

  for (let index = 0; index < expected.length; index += 1) {
    if (actual[index] !== expected[index]) {
      fail(
        `${label} differs at position ${index + 1}: `
        + `expected ${expected[index]}, received ${actual[index]}.`,
      );
    }
  }
}

function extractStringArray(source, constantName) {
  const pattern = new RegExp(
    `export const ${constantName} = \\[([\\s\\S]*?)\\] as const;`,
  );
  const match = source.match(pattern);

  if (!match) {
    fail(`Generated ${constantName} array was not found.`);
  }

  return [
    ...match[1].matchAll(/"([^"]+)"/g),
  ].map((entry) => entry[1]);
}

function validateGeneratedContract(contractSource) {
  const requiredMarkers = [
    'Semantic owner: UX-BASE-002',
    'Contract task: SHELL-CON-015',
    'WORK_ITEM_FIELD_NAMES',
    'WORK_ITEM_TYPES',
    'WORK_ITEM_STATUSES',
    'WORK_ITEM_READINESS_STATUSES',
    'WORK_ITEM_PRIORITY_LEVELS',
    'WORK_ITEM_IDENTITY_SEPARATIONS',
    'WORK_ITEM_IDENTITY_POLICY',
    'identity_name: "work_item_id"',
    'semantics: "OPAQUE_RUNTIME_REFERENCE"',
    'serialization: "UNSPECIFIED"',
    'syntax_pattern: null',
    'static_registry: false',
    'infer_authority_from_value: false',
    'WORK_ITEM_AUTHORITY_BINDINGS',
    'owner_app_code: "AppCode"',
    'process_id: "ProcessId"',
    'process_step_when_state_identity_applies: "ProcessStateId"',
    'next_action_code_when_catalogued: "FunctionalActionId"',
    'correlated_business_event_when_applicable: "BusinessEventId"',
    'cross_app_handoff_when_applicable: "ApplicationHandoffRelation"',
    'field_count: 29',
    'type_count: 8',
    'status_count: 16',
    'readiness_status_count: 7',
    'priority_level_count: 6',
    'identity_serialization_defined: false',
    'runtime_instance_registry: false',
    'logical_namespace: "@vento/contracts/work-items"',
    'export function isWorkItemFieldName(',
    'export function isWorkItemType(',
    'export function isWorkItemStatus(',
    'export function isWorkItemReadinessStatus(',
  ];

  for (const marker of requiredMarkers) {
    assertIncludes(
      contractSource,
      marker,
      'work-item contract',
    );
  }

  assertExactSequence(
    extractStringArray(contractSource, 'WORK_ITEM_FIELD_NAMES'),
    expectedFields,
    'WORK_ITEM_FIELD_NAMES',
  );
  assertExactSequence(
    extractStringArray(contractSource, 'WORK_ITEM_TYPES'),
    expectedTypes,
    'WORK_ITEM_TYPES',
  );
  assertExactSequence(
    extractStringArray(contractSource, 'WORK_ITEM_STATUSES'),
    expectedStatuses,
    'WORK_ITEM_STATUSES',
  );
  assertExactSequence(
    extractStringArray(
      contractSource,
      'WORK_ITEM_READINESS_STATUSES',
    ),
    expectedReadinessStatuses,
    'WORK_ITEM_READINESS_STATUSES',
  );
  assertExactSequence(
    extractStringArray(
      contractSource,
      'WORK_ITEM_IDENTITY_SEPARATIONS',
    ),
    expectedIdentitySeparations,
    'WORK_ITEM_IDENTITY_SEPARATIONS',
  );

  const priorityMatch = contractSource.match(
    /export const WORK_ITEM_PRIORITY_LEVELS = \[([\s\S]*?)\] as const;/,
  );

  if (!priorityMatch) {
    fail('WORK_ITEM_PRIORITY_LEVELS was not found.');
  }

  const levels = [
    ...priorityMatch[1].matchAll(/level: ([0-5]),/g),
  ].map((entry) => Number(entry[1]));

  assertExactSequence(
    levels,
    [0, 1, 2, 3, 4, 5],
    'WORK_ITEM_PRIORITY_LEVELS',
  );

  const forbiddenSymbols = [
    [/\bWORK_ITEM_IDS\b/u, 'WORK_ITEM_IDS'],
    [/\bWORK_ITEM_ID_PATTERN\b/u, 'WORK_ITEM_ID_PATTERN'],
    [/\bWORK_ITEM_ID_PATTERN_SOURCE\b/u, 'WORK_ITEM_ID_PATTERN_SOURCE'],
    [/\bisWorkItemId\s*\(/u, 'isWorkItemId('],
    [/\bassertWorkItemId\s*\(/u, 'assertWorkItemId('],
    [/\bexport\s+type\s+WorkItemId\b/u, 'export type WorkItemId'],
    [/\bexport\s+interface\s+WorkItemInstance\b/u, 'WorkItemInstance'],
    [/\bexport\s+const\s+WORK_ITEM_INSTANCES\b/u, 'WORK_ITEM_INSTANCES'],
  ];

  for (const [pattern, label] of forbiddenSymbols) {
    assertDoesNotMatch(
      contractSource,
      pattern,
      'work-item contract',
      label,
    );
  }

  const forbiddenRuntime = [
    [/\bcreateClient\s*\(/u, 'createClient('],
    [/\bfetch\s*\(/u, 'fetch('],
    [/\bfrom\s+["']@supabase\//u, '@supabase import'],
    [/\bfrom\s+["'](?:pg|postgres|drizzle|prisma)/u, 'database import'],
    [/\bexport\s+(?:async\s+)?function\s+(?:claim|assign|offer|start|complete|cancel|schedule)WorkItem\b/iu, 'runtime work-item command'],
    [/\b(?:outbox|inbox|webhook|broker|topic)_client\b/iu, 'runtime transport client'],
  ];

  for (const [pattern, label] of forbiddenRuntime) {
    assertDoesNotMatch(
      contractSource,
      pattern,
      'work-item contract',
      label,
    );
  }
}

function validateGeneratedIndex(indexSource) {
  const requiredMarkers = [
    'WORK_ITEM_FIELD_NAMES',
    'WORK_ITEM_TYPES',
    'WORK_ITEM_STATUSES',
    'WORK_ITEM_READINESS_STATUSES',
    'WORK_ITEM_PRIORITY_LEVELS',
    'WORK_ITEM_IDENTITY_POLICY',
    'WORK_ITEM_IDENTITY_SEPARATIONS',
    'WORK_ITEM_AUTHORITY_BINDINGS',
    'WORK_ITEM_CONTRACT_METADATA',
    'isWorkItemFieldName',
    'isWorkItemType',
    'isWorkItemStatus',
    'isWorkItemReadinessStatus',
    'WorkItemFieldName',
    'WorkItemType',
    'WorkItemStatus',
    'WorkItemReadinessStatus',
    'WorkItemPriorityLevel',
    'WorkItemOwnerAppCode',
    'WorkItemProcessId',
    'WorkItemProcessStateReference',
    'WorkItemNextActionReference',
    'WorkItemBusinessEventReference',
    'WorkItemHandoffRelationReference',
    'from "./work-item.contract.js";',
  ];

  for (const marker of requiredMarkers) {
    assertIncludes(indexSource, marker, 'work-item generated index');
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
    fail('@vento/contracts version changed during SHELL-CON-015.');
  }

  if (packageJson.private !== true) {
    fail('@vento/contracts must remain private.');
  }

  if (Object.hasOwn(packageJson, 'exports')) {
    fail('@vento/contracts must not add public exports in SHELL-CON-015.');
  }
}

function validateReadmes() {
  const workItemsReadme = readText(
    workItemsReadmePath,
    'work-items README',
  );
  const contractsReadme = readText(
    contractsReadmePath,
    '@vento/contracts README',
  );

  for (const marker of [
    '# @vento/contracts/work-items',
    '`SHELL-CON-015::GLOBAL`',
    '`PRE_E5_FOUNDATION`',
    '29 campos',
    '8 clases',
    '16 estados',
    '7 estados de readiness',
    '6 niveles de prioridad',
    '`work_item_id`',
    'referencia opaca',
    'no define patrón',
    '`AppCode`',
    '`ProcessId`',
    '`ProcessStateId`',
    '`FunctionalActionId`',
    '`BusinessEventId`',
    '`ApplicationHandoffRelation`',
    '`TREQ-UX-024` a `TREQ-UX-040`',
    '`SHELL-CON-016`',
  ]) {
    assertIncludes(workItemsReadme, marker, 'work-items README');
  }

  for (const marker of [
    '## Módulo de ítems de trabajo',
    '`SHELL-CON-015::GLOBAL`',
    '`packages/contracts/work-items`',
    '`@vento/contracts/work-items`',
    '29 campos',
    '8 clases',
    '16 estados',
    '7 estados de readiness',
    '6 niveles de prioridad',
    '`work_item_id`',
    '`SHELL-CON-016`',
  ]) {
    assertIncludes(
      contractsReadme,
      marker,
      '@vento/contracts README',
    );
  }

  for (const predecessorMarker of [
    '## Módulo de procesos',
    '## Módulo de pantallas',
    '## Módulo de acciones funcionales',
    '## Módulo de eventos empresariales',
    '## Módulo de traspasos entre aplicaciones',
    '`SHELL-CON-014`',
    '49 relaciones',
    '395 definiciones normales',
    '885 identidades funcionales',
  ]) {
    assertIncludes(
      contractsReadme,
      predecessorMarker,
      '@vento/contracts README',
    );
  }
}

export function validateWorkItemContracts() {
  const generated =
    generateWorkItemContracts({ checkOnly: true });

  if (
    generated.fields !== 29
    || generated.types !== 8
    || generated.statuses !== 16
    || generated.readinessStatuses !== 7
    || generated.priorityLevels !== 6
    || generated.treqCoverage !== 17
  ) {
    fail(
      'Generator reconciliation returned an unexpected 29/8/16/7/6/17 shape.',
    );
  }

  const contractSource = readText(
    contractPath,
    'work-item contract',
  );
  const indexSource = readText(
    indexPath,
    'work-item generated index',
  );

  validateGeneratedContract(contractSource);
  validateGeneratedIndex(indexSource);
  validatePackageBoundary();
  validateReadmes();

  return {
    fields: generated.fields,
    types: generated.types,
    statuses: generated.statuses,
    readinessStatuses: generated.readinessStatuses,
    priorityLevels: generated.priorityLevels,
    treqCoverage: generated.treqCoverage,
  };
}

function runCli() {
  const unknown = process.argv.slice(2);

  try {
    if (unknown.length > 0) {
      fail(`Unknown arguments: ${unknown.join(', ')}`);
    }

    const result = validateWorkItemContracts();

    console.log('[VENTO CONTRACTS] WORK_ITEM_CONTRACTS PASS');
    console.log(`[VENTO CONTRACTS] FIELDS ${result.fields}`);
    console.log(`[VENTO CONTRACTS] TYPES ${result.types}`);
    console.log(`[VENTO CONTRACTS] STATUSES ${result.statuses}`);
    console.log(
      `[VENTO CONTRACTS] READINESS ${result.readinessStatuses}`,
    );
    console.log(
      `[VENTO CONTRACTS] PRIORITY_LEVELS ${result.priorityLevels}`,
    );
    console.log(
      `[VENTO CONTRACTS] TREQ_COVERAGE ${result.treqCoverage}`,
    );
    console.log('[VENTO CONTRACTS] WORK_ITEM_ID OPAQUE');
    console.log('[VENTO CONTRACTS] RUNTIME_INSTANCE_REGISTRY NONE');
    console.log('[VENTO CONTRACTS] PUBLIC_EXPORTS NONE');
    console.log('[VENTO CONTRACTS] RUNTIME_WORK_ITEM_INFRA NONE');
    console.log('');
    console.log('=== RESULTADO PARA CHATGPT ===');
    console.log('ESTADO: PASS');
    console.log('VALIDACION: WORK_ITEM_CONTRACTS');
    console.log(`FIELDS: ${result.fields}`);
    console.log(`TYPES: ${result.types}`);
    console.log(`STATUSES: ${result.statuses}`);
    console.log(`READINESS: ${result.readinessStatuses}`);
    console.log(`PRIORITY_LEVELS: ${result.priorityLevels}`);
    console.log(`TREQ_COVERAGE: ${result.treqCoverage}`);
    console.log('WORK_ITEM_ID: OPAQUE');
    console.log('RUNTIME_INSTANCE_REGISTRY: NONE');
    console.log('PUBLIC_EXPORTS: NONE');
    console.log('RUNTIME_WORK_ITEM_INFRA: NONE');
    console.log('=== FIN RESULTADO PARA CHATGPT ===');
  } catch (error) {
    const message =
      error instanceof Error ? error.message : String(error);

    console.error('[VENTO CONTRACTS] WORK_ITEM_CONTRACTS FAIL');
    console.error(message);
    console.error('');
    console.error('=== RESULTADO PARA CHATGPT ===');
    console.error('ESTADO: FAIL');
    console.error('VALIDACION: WORK_ITEM_CONTRACTS');
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