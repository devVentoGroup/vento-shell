import fs from 'node:fs';
import path from 'node:path';
import { fileURLToPath } from 'node:url';

const currentFile = fileURLToPath(import.meta.url);
const scriptDirectory = path.dirname(currentFile);
const workItemsRoot = path.resolve(scriptDirectory, '..');
const contractsRoot = path.resolve(workItemsRoot, '..');
const repositoryRoot = path.resolve(workItemsRoot, '../../..');

const shellContractSourcePath = path.join(
  repositoryRoot,
  'docs',
  'plan-canonico',
  'modular',
  'bloques',
  'H_FUNDACION_COMPARTIDA',
  '03_CONTRATOS_COMPARTIDOS.md',
);

const uxBaseSourcePath = path.join(
  repositoryRoot,
  'docs',
  'plan-canonico',
  'modular',
  'bloques',
  'E2_PROCESOS_Y_EXPERIENCIA',
  '08_01_ACTOR_TAREA_NAVEGACION_Y_CONTEXTO.md',
);

const uxTreqSourcePath = path.join(
  repositoryRoot,
  'docs',
  'plan-canonico',
  'modular',
  'bloques',
  'E1_DESCUBRIMIENTO_OPERATIVO',
  '04A_19_UX.md',
);

const authorityPaths = Object.freeze({
  appCode: path.join(
    contractsRoot,
    'authorization',
    'generated',
    'versions',
    '1.0.0',
    'catalog.types.ts',
  ),
  processId: path.join(
    contractsRoot,
    'processes',
    'generated',
    'process-id.contract.ts',
  ),
  processStateId: path.join(
    contractsRoot,
    'processes',
    'generated',
    'states',
    'process-state.contract.ts',
  ),
  functionalActionId: path.join(
    contractsRoot,
    'actions',
    'generated',
    'functional-action.contract.ts',
  ),
  businessEventId: path.join(
    contractsRoot,
    'events',
    'generated',
    'business-event.contract.ts',
  ),
  handoffRelation: path.join(
    contractsRoot,
    'handoffs',
    'generated',
    'application-handoff-relation.contract.ts',
  ),
});

const generatedDirectory = path.join(workItemsRoot, 'generated');
const contractPath = path.join(
  generatedDirectory,
  'work-item.contract.ts',
);
const indexPath = path.join(generatedDirectory, 'index.ts');

const sourceContractSha256 =
  '79b15488e1366e8848fafbdda0fe9e267fef3db0542a490ba3a07eb6c68812c4';

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

const expectedPriorityLevels = Object.freeze([
  {
    level: 0,
    canonical_label: 'Seguridad, emergencia o custodia crítica.',
  },
  {
    level: 1,
    canonical_label: 'Trabajo ya en ejecución que debe continuar.',
  },
  {
    level: 2,
    canonical_label:
      'Compromiso inmediato con cliente, producción, entrega o cadena.',
  },
  {
    level: 3,
    canonical_label:
      'Tarea asignada con vencimiento o bloqueo de terceros.',
  },
  {
    level: 4,
    canonical_label: 'Tarea disponible priorizada por política.',
  },
  {
    level: 5,
    canonical_label: 'Mantenimiento, seguimiento o trabajo sin urgencia.',
  },
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

const expectedTreqIds = Object.freeze(
  Array.from(
    { length: 17 },
    (_, index) => `TREQ-UX-${String(index + 24).padStart(3, '0')}`,
  ),
);

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

function escapeRegExp(value) {
  return value.replace(/[.*+?^${}()|[\]\\]/g, '\\$&');
}

function extractTaskSection(source, taskId) {
  const startPattern = new RegExp(
    `^### [^\\n]*${escapeRegExp(taskId)}\\b[^\\n]*$`,
    'm',
  );
  const startMatch = source.match(startPattern);

  if (!startMatch || startMatch.index === undefined) {
    fail(`Canonical task ${taskId} not found.`);
  }

  const start = startMatch.index;
  const tailStart = start + startMatch[0].length;
  const tail = source.slice(tailStart);
  const nextTaskMatch = tail.match(/^### [^\n]+$/m);

  if (!nextTaskMatch || nextTaskMatch.index === undefined) {
    return source.slice(start);
  }

  return source.slice(start, tailStart + nextTaskMatch.index);
}

function extractNumberedSubsection(task, subsectionNumber) {
  const startPattern = new RegExp(
    `^#### ${subsectionNumber}\\. [^\\n]+$`,
    'm',
  );
  const startMatch = task.match(startPattern);

  if (!startMatch || startMatch.index === undefined) {
    fail(`Subsection ${subsectionNumber} not found.`);
  }

  const start = startMatch.index;
  const tailStart = start + startMatch[0].length;
  const tail = task.slice(tailStart);
  const nextMatch = tail.match(/^#### [0-9]+\. [^\n]+$/m);

  if (!nextMatch || nextMatch.index === undefined) {
    return task.slice(start);
  }

  return task.slice(start, tailStart + nextMatch.index);
}

function cleanCell(value) {
  return String(value)
    .trim()
    .replace(/<br\s*\/?>/gi, '\n')
    .replace(/\\\|/g, '|')
    .replace(/&#124;/g, '|')
    .replace(/`([^`]*)`/g, '$1')
    .replace(/\*\*([^*]+)\*\*/g, '$1')
    .trim();
}

function splitMarkdownRow(line) {
  const trimmed = line.trim();

  if (!trimmed.startsWith('|') || !trimmed.endsWith('|')) {
    return [];
  }

  const body = trimmed.slice(1, -1);
  const cells = [];
  let current = '';
  let escaped = false;
  let inCode = false;

  for (const character of body) {
    if (escaped) {
      current += character;
      escaped = false;
      continue;
    }

    if (character === '\\') {
      escaped = true;
      current += character;
      continue;
    }

    if (character === '`') {
      inCode = !inCode;
      current += character;
      continue;
    }

    if (character === '|' && !inCode) {
      cells.push(cleanCell(current));
      current = '';
      continue;
    }

    current += character;
  }

  cells.push(cleanCell(current));
  return cells;
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

function assertExactObjectSequence(actual, expected, label) {
  if (actual.length !== expected.length) {
    fail(`${label} must contain ${expected.length}; received ${actual.length}.`);
  }

  for (let index = 0; index < expected.length; index += 1) {
    const left = actual[index];
    const right = expected[index];

    if (
      left.level !== right.level
      || left.canonical_label !== right.canonical_label
    ) {
      fail(
        `${label} differs at position ${index + 1}: `
        + `expected ${JSON.stringify(right)}, `
        + `received ${JSON.stringify(left)}.`,
      );
    }
  }
}

function parseTableColumn(section, predicate, columnIndex = 0) {
  const values = [];

  for (const line of section.split('\n')) {
    const cells = splitMarkdownRow(line);

    if (cells.length > columnIndex && predicate(cells)) {
      values.push(cells[columnIndex]);
    }
  }

  return values;
}

function parseOwnerContract(task) {
  const fieldsSection = extractNumberedSubsection(task, 6);
  const typesSection = extractNumberedSubsection(task, 7);
  const statusesSection = extractNumberedSubsection(task, 8);
  const readinessSection = extractNumberedSubsection(task, 9);
  const prioritySection = extractNumberedSubsection(task, 12);

  const fields = parseTableColumn(
    fieldsSection,
    (cells) =>
      cells.length >= 3
      && /^[0-9]+$/.test(cells[0] ?? '')
      && /^[a-z][a-z0-9_]*$/.test(cells[1] ?? ''),
    1,
  );

  const types = parseTableColumn(
    typesSection,
    (cells) =>
      cells.length >= 2
      && /^[A-Z][A-Z0-9_]*$/.test(cells[0] ?? ''),
    0,
  );

  const statuses = parseTableColumn(
    statusesSection,
    (cells) =>
      cells.length >= 2
      && /^[A-Z][A-Z0-9_]*$/.test(cells[0] ?? ''),
    0,
  );

  const readinessStatuses = parseTableColumn(
    readinessSection,
    (cells) =>
      cells.length >= 2
      && /^[A-Z][A-Z0-9_]*$/.test(cells[0] ?? ''),
    0,
  );

  const priorityLevels = [];

  for (const line of prioritySection.split('\n')) {
    const cells = splitMarkdownRow(line);

    if (
      cells.length >= 2
      && /^[0-5]$/.test(cells[0] ?? '')
      && cells[1]
    ) {
      priorityLevels.push({
        level: Number(cells[0]),
        canonical_label: cells[1],
      });
    }
  }

  assertExactSequence(
    fields,
    expectedFields,
    'SHELL-CON-015 field registry',
  );
  assertExactSequence(
    types,
    expectedTypes,
    'SHELL-CON-015 work item types',
  );
  assertExactSequence(
    statuses,
    expectedStatuses,
    'SHELL-CON-015 statuses',
  );
  assertExactSequence(
    readinessStatuses,
    expectedReadinessStatuses,
    'SHELL-CON-015 readiness statuses',
  );
  assertExactObjectSequence(
    priorityLevels,
    expectedPriorityLevels,
    'SHELL-CON-015 priority levels',
  );

  const requiredMarkers = [
    '@vento/contracts/work-items',
    'work_item_id',
    'work_item_id != ProcessId',
    'work_item_id != process_instance_id',
    'work_item_id != ProcessStateId',
    'work_item_id != FunctionalActionId',
    'work_item_id != BusinessEventId',
    'work_item_id != PermissionId',
    'work_item_id != ScreenId',
    'work_item_id != navigation_id',
    'work_item_id != claim_or_lease_ref',
    'work_item_id != handoff_relation',
    'work_item_id != alert_or_notification_id',
    'TREQ-UX-024..TREQ-UX-040',
    'NO GENERA REQUISITOS DE PRUEBA',
    'SHELL-CON-016',
  ];

  for (const marker of requiredMarkers) {
    if (!task.includes(marker)) {
      fail(`SHELL-CON-015 is missing required content: ${marker}`);
    }
  }

  return {
    fields,
    types,
    statuses,
    readinessStatuses,
    priorityLevels,
  };
}

function extractFirstTextFence(section, label) {
  const match = section.match(/```text\s*\n([\s\S]*?)```/);

  if (!match) {
    fail(`${label} text fence not found.`);
  }

  return match[1]
    .split('\n')
    .map((line) => line.trim())
    .filter(Boolean);
}

function parseUxBase002(task) {
  const fieldsSection = extractNumberedSubsection(task, 8);
  const typesSection = extractNumberedSubsection(task, 9);
  const statusesSection = extractNumberedSubsection(task, 11);
  const readinessSection = extractNumberedSubsection(task, 12);
  const prioritySection = extractNumberedSubsection(task, 13);

  const fields = extractFirstTextFence(
    fieldsSection,
    'UX-BASE-002 fields',
  ).filter((value) => /^[a-z][a-z0-9_]*$/.test(value));

  const types = parseTableColumn(
    typesSection,
    (cells) =>
      cells.length >= 2
      && /^[A-Z][A-Z0-9_]*$/.test(cells[0] ?? ''),
    0,
  );

  const statuses = extractFirstTextFence(
    statusesSection,
    'UX-BASE-002 statuses',
  ).filter((value) => /^[A-Z][A-Z0-9_]*$/.test(value));

  const readinessStatuses = expectedReadinessStatuses.filter(
    (value) => readinessSection.includes(`\`${value}\``),
  );

  const priorityLevels = [];
  const priorityFence = extractFirstTextFence(
    prioritySection,
    'UX-BASE-002 priority levels',
  );

  for (const line of priorityFence) {
    const match = line.match(/^NIVEL ([0-5])\s+[—-]\s+(.+)$/u);

    if (match) {
      priorityLevels.push(Number(match[1]));
    }
  }

  assertExactSequence(
    fields,
    expectedFields,
    'UX-BASE-002 field registry',
  );
  assertExactSequence(
    types,
    expectedTypes,
    'UX-BASE-002 work item types',
  );
  assertExactSequence(
    statuses,
    expectedStatuses,
    'UX-BASE-002 statuses',
  );
  assertExactSequence(
    readinessStatuses,
    expectedReadinessStatuses,
    'UX-BASE-002 readiness statuses',
  );
  assertExactSequence(
    priorityLevels,
    [0, 1, 2, 3, 4, 5],
    'UX-BASE-002 priority levels',
  );
}

function validateTreqCoverage(source) {
  for (const treqId of expectedTreqIds) {
    if (!source.includes(`\`${treqId}\``)) {
      fail(`Existing UX coverage is missing ${treqId}.`);
    }
  }
}

function validatePhysicalAuthorities() {
  const authorities = [
    ['AppCode', authorityPaths.appCode, 'export type AppCode'],
    ['ProcessId', authorityPaths.processId, 'export type ProcessId'],
    [
      'ProcessStateId',
      authorityPaths.processStateId,
      'export type ProcessStateId',
    ],
    [
      'FunctionalActionId',
      authorityPaths.functionalActionId,
      'export type FunctionalActionId',
    ],
    [
      'BusinessEventId',
      authorityPaths.businessEventId,
      'export type BusinessEventId',
    ],
    [
      'ApplicationHandoffRelation',
      authorityPaths.handoffRelation,
      'export interface ApplicationHandoffRelation',
    ],
  ];

  for (const [label, filePath, marker] of authorities) {
    const source = readText(filePath, `${label} authority`);

    if (!source.includes(marker)) {
      fail(`${label} authority is missing marker: ${marker}`);
    }
  }
}

function renderStringArray(name, values) {
  const rows = values
    .map((value) => `  ${JSON.stringify(value)},`)
    .join('\n');

  return `export const ${name} = [\n${rows}\n] as const;`;
}

function renderPriorityLevels() {
  const rows = expectedPriorityLevels
    .map(
      (entry) => [
        '  {',
        `    level: ${entry.level},`,
        `    canonical_label: ${JSON.stringify(entry.canonical_label)},`,
        '  },',
      ].join('\n'),
    )
    .join('\n');

  return `export const WORK_ITEM_PRIORITY_LEVELS = [\n${rows}\n] as const;`;
}

function renderContract() {
  return `// GENERATED FILE. DO NOT EDIT.
// Semantic owner: UX-BASE-002
// Contract task: SHELL-CON-015
// Foundation task: SHELL-CON-001
// Source contract SHA256: ${sourceContractSha256}

import type {
  AppCode,
} from "../../authorization/generated/versions/1.0.0/catalog.types.js";
import type {
  ProcessId,
} from "../../processes/generated/process-id.contract.js";
import type {
  ProcessStateId,
} from "../../processes/generated/states/process-state.contract.js";
import type {
  FunctionalActionId,
} from "../../actions/generated/functional-action.contract.js";
import type {
  BusinessEventId,
} from "../../events/generated/business-event.contract.js";
import type {
  ApplicationHandoffRelation,
} from "../../handoffs/generated/application-handoff-relation.contract.js";

${renderStringArray('WORK_ITEM_FIELD_NAMES', expectedFields)}

export type WorkItemFieldName =
  (typeof WORK_ITEM_FIELD_NAMES)[number];

${renderStringArray('WORK_ITEM_TYPES', expectedTypes)}

export type WorkItemType =
  (typeof WORK_ITEM_TYPES)[number];

${renderStringArray('WORK_ITEM_STATUSES', expectedStatuses)}

export type WorkItemStatus =
  (typeof WORK_ITEM_STATUSES)[number];

${renderStringArray(
    'WORK_ITEM_READINESS_STATUSES',
    expectedReadinessStatuses,
  )}

export type WorkItemReadinessStatus =
  (typeof WORK_ITEM_READINESS_STATUSES)[number];

${renderPriorityLevels()}

export type WorkItemPriorityLevel =
  (typeof WORK_ITEM_PRIORITY_LEVELS)[number]["level"];

${renderStringArray(
    'WORK_ITEM_IDENTITY_SEPARATIONS',
    expectedIdentitySeparations,
  )}

export type WorkItemSeparatedIdentity =
  (typeof WORK_ITEM_IDENTITY_SEPARATIONS)[number];

export const WORK_ITEM_IDENTITY_POLICY = {
  identity_name: "work_item_id",
  semantics: "OPAQUE_RUNTIME_REFERENCE",
  serialization: "UNSPECIFIED",
  syntax_pattern: null,
  static_registry: false,
  infer_authority_from_value: false,
} as const;

export const WORK_ITEM_AUTHORITY_BINDINGS = {
  owner_app_code: "AppCode",
  process_id: "ProcessId",
  process_step_when_state_identity_applies: "ProcessStateId",
  next_action_code_when_catalogued: "FunctionalActionId",
  correlated_business_event_when_applicable: "BusinessEventId",
  cross_app_handoff_when_applicable: "ApplicationHandoffRelation",
} as const;

export type WorkItemOwnerAppCode = AppCode;
export type WorkItemProcessId = ProcessId;
export type WorkItemProcessStateReference = ProcessStateId;
export type WorkItemNextActionReference = FunctionalActionId;
export type WorkItemBusinessEventReference = BusinessEventId;
export type WorkItemHandoffRelationReference =
  ApplicationHandoffRelation;

export const WORK_ITEM_CONTRACT_METADATA = {
  logical_namespace: "@vento/contracts/work-items",
  field_count: ${expectedFields.length},
  type_count: ${expectedTypes.length},
  status_count: ${expectedStatuses.length},
  readiness_status_count: ${expectedReadinessStatuses.length},
  priority_level_count: ${expectedPriorityLevels.length},
  identity_serialization_defined: false,
  runtime_instance_registry: false,
  semantic_owner_task_id: "UX-BASE-002",
  contract_task_id: "SHELL-CON-015",
  handoff_authority_task_id: "SHELL-CON-014",
  action_authority_task_id: "SHELL-CON-012",
  event_authority_task_id: "SHELL-CON-013",
} as const;

export type WorkItemContractMetadata =
  typeof WORK_ITEM_CONTRACT_METADATA;

const WORK_ITEM_FIELD_NAME_SET =
  new Set<string>(WORK_ITEM_FIELD_NAMES);
const WORK_ITEM_TYPE_SET =
  new Set<string>(WORK_ITEM_TYPES);
const WORK_ITEM_STATUS_SET =
  new Set<string>(WORK_ITEM_STATUSES);
const WORK_ITEM_READINESS_STATUS_SET =
  new Set<string>(WORK_ITEM_READINESS_STATUSES);

export function isWorkItemFieldName(
  value: unknown,
): value is WorkItemFieldName {
  return (
    typeof value === "string"
    && WORK_ITEM_FIELD_NAME_SET.has(value)
  );
}

export function isWorkItemType(
  value: unknown,
): value is WorkItemType {
  return (
    typeof value === "string"
    && WORK_ITEM_TYPE_SET.has(value)
  );
}

export function isWorkItemStatus(
  value: unknown,
): value is WorkItemStatus {
  return (
    typeof value === "string"
    && WORK_ITEM_STATUS_SET.has(value)
  );
}

export function isWorkItemReadinessStatus(
  value: unknown,
): value is WorkItemReadinessStatus {
  return (
    typeof value === "string"
    && WORK_ITEM_READINESS_STATUS_SET.has(value)
  );
}
`;
}

function renderIndex() {
  return `// GENERATED FILE. DO NOT EDIT.
// Contract task: SHELL-CON-015
// Source contract SHA256: ${sourceContractSha256}

export {
  WORK_ITEM_AUTHORITY_BINDINGS,
  WORK_ITEM_CONTRACT_METADATA,
  WORK_ITEM_FIELD_NAMES,
  WORK_ITEM_IDENTITY_POLICY,
  WORK_ITEM_IDENTITY_SEPARATIONS,
  WORK_ITEM_PRIORITY_LEVELS,
  WORK_ITEM_READINESS_STATUSES,
  WORK_ITEM_STATUSES,
  WORK_ITEM_TYPES,
  isWorkItemFieldName,
  isWorkItemReadinessStatus,
  isWorkItemStatus,
  isWorkItemType,
} from "./work-item.contract.js";

export type {
  WorkItemBusinessEventReference,
  WorkItemContractMetadata,
  WorkItemFieldName,
  WorkItemHandoffRelationReference,
  WorkItemNextActionReference,
  WorkItemOwnerAppCode,
  WorkItemPriorityLevel,
  WorkItemProcessId,
  WorkItemProcessStateReference,
  WorkItemReadinessStatus,
  WorkItemSeparatedIdentity,
  WorkItemStatus,
  WorkItemType,
} from "./work-item.contract.js";
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

export function generateWorkItemContracts({ checkOnly = false } = {}) {
  const shellSource = readText(
    shellContractSourcePath,
    'SHELL-CON-015 source file',
  );
  const uxSource = readText(
    uxBaseSourcePath,
    'UX-BASE-002 source file',
  );
  const treqSource = readText(
    uxTreqSourcePath,
    'UX TREQ coverage source file',
  );

  const shellTask = extractTaskSection(shellSource, 'SHELL-CON-015');
  const uxTask = extractTaskSection(uxSource, 'UX-BASE-002');

  const owner = parseOwnerContract(shellTask);
  parseUxBase002(uxTask);
  validateTreqCoverage(treqSource);
  validatePhysicalAuthorities();

  const contractResult = writeOrCheck(
    contractPath,
    renderContract(),
    checkOnly,
    'work-item contract',
  );

  const indexResult = writeOrCheck(
    indexPath,
    renderIndex(),
    checkOnly,
    'work-item generated index',
  );

  return {
    fields: owner.fields.length,
    types: owner.types.length,
    statuses: owner.statuses.length,
    readinessStatuses: owner.readinessStatuses.length,
    priorityLevels: owner.priorityLevels.length,
    treqCoverage: expectedTreqIds.length,
    contractResult,
    indexResult,
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

    const result = generateWorkItemContracts({ checkOnly });

    console.log(
      `[VENTO CONTRACTS] WORK_ITEMS ${checkOnly ? 'CHECK' : 'GENERATE'} PASS`,
    );
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
    console.log(`[VENTO CONTRACTS] CONTRACT ${result.contractResult}`);
    console.log(`[VENTO CONTRACTS] INDEX ${result.indexResult}`);
    console.log('');
    console.log('=== RESULTADO PARA CHATGPT ===');
    console.log('ESTADO: PASS');
    console.log(
      `OPERACION: ${checkOnly ? 'WORK_ITEMS_CHECK' : 'WORK_ITEMS_GENERATE'}`,
    );
    console.log(`FIELDS: ${result.fields}`);
    console.log(`TYPES: ${result.types}`);
    console.log(`STATUSES: ${result.statuses}`);
    console.log(`READINESS: ${result.readinessStatuses}`);
    console.log(`PRIORITY_LEVELS: ${result.priorityLevels}`);
    console.log(`TREQ_COVERAGE: ${result.treqCoverage}`);
    console.log(`CONTRACT: ${result.contractResult}`);
    console.log(`INDEX: ${result.indexResult}`);
    console.log('=== FIN RESULTADO PARA CHATGPT ===');
  } catch (error) {
    const message =
      error instanceof Error ? error.message : String(error);

    console.error('[VENTO CONTRACTS] WORK_ITEMS FAIL');
    console.error(message);
    console.error('');
    console.error('=== RESULTADO PARA CHATGPT ===');
    console.error('ESTADO: FAIL');
    console.error('OPERACION: WORK_ITEMS');
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