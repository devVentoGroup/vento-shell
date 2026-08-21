import fs from 'node:fs';
import path from 'node:path';
import { fileURLToPath } from 'node:url';

const currentFile = fileURLToPath(import.meta.url);
const scriptDirectory = path.dirname(currentFile);
const eventsRoot = path.resolve(scriptDirectory, '..');
const contractsRoot = path.resolve(eventsRoot, '..');
const repositoryRoot = path.resolve(eventsRoot, '../../..');

const procCatSourcePath = path.join(
  repositoryRoot,
  'docs',
  'plan-canonico',
  'modular',
  'bloques',
  'E2_PROCESOS_Y_EXPERIENCIA',
  '01_04_INFORMACION_EVENTOS_AUDITORIA_METRICAS_Y_DUPLICADOS.md',
);

const shellContractSourcePath = path.join(
  repositoryRoot,
  'docs',
  'plan-canonico',
  'modular',
  'bloques',
  'H_FUNDACION_COMPARTIDA',
  '03_CONTRATOS_COMPARTIDOS.md',
);

const processContractPath = path.join(
  contractsRoot,
  'processes',
  'generated',
  'process-id.contract.ts',
);

const generatedDirectory = path.join(eventsRoot, 'generated');
const contractPath = path.join(
  generatedDirectory,
  'business-event.contract.ts',
);
const indexPath = path.join(generatedDirectory, 'index.ts');

const sourceContractSha256 =
  '0a42928046b483e3750c71f9f943ba3b6cd805d097c51e63358399ea598bff35';

const businessEventIdPatternSource =
  '^VPROC-[0-9]{4}\\.EVT-[0-9]{3}$';

const expectedProcessCount = 69;
const expectedBusinessEventCount = 395;

const fourEventProcesses = new Set([
  'VPROC-0003',
  'VPROC-0015',
  'VPROC-0017',
  'VPROC-0033',
]);

const fiveEventProcesses = new Set([
  'VPROC-0001',
  'VPROC-0008',
  'VPROC-0016',
  'VPROC-0018',
  'VPROC-0019',
  'VPROC-0020',
  'VPROC-0038',
  'VPROC-0039',
  'VPROC-0048',
  'VPROC-0056',
  'VPROC-0060',
]);

const expectedEventClasses = Object.freeze([
  'PROCESS_STARTED',
  'ANALYSIS_FACT',
  'DECISION_FACT',
  'VERIFICATION_FACT',
  'PROCESS_COMPLETED',
  'VALIDATION_FACT',
  'EXECUTION_FACT',
  'REVIEW_FACT',
  'READINESS_FACT',
  'HANDOFF_FACT',
  'RECONCILIATION_FACT',
  'ACTIVATION_FACT',
]);

const expectedSensitivities = Object.freeze([
  'INTERNAL_OPERATIONAL',
  'RESTRICTED_PERSONAL',
  'RESTRICTED_FINANCIAL',
  'RESTRICTED_TECHNICAL',
]);

const expectedConditionalTemplates = Object.freeze([
  'vento.process.vproc-####.exception-applied.v1',
  'vento.process.vproc-####.exception-resolved.v1',
  'vento.process.vproc-####.cancellation-recorded.v1',
  'vento.process.vproc-####.void-recorded.v1',
  'vento.process.vproc-####.reversal-applied.v1',
  'vento.process.vproc-####.compensation-posted.v1',
  'vento.process.vproc-####.correction-applied.v1',
  'vento.process.vproc-####.linked-review-opened.v1',
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

function expectedProcessIds() {
  return Array.from(
    { length: expectedProcessCount },
    (_, index) => `VPROC-${String(index + 1).padStart(4, '0')}`,
  );
}

function expectedEventCountForProcess(processId) {
  if (fourEventProcesses.has(processId)) return 4;
  if (fiveEventProcesses.has(processId)) return 5;
  return 6;
}

function expectedBusinessEventIds() {
  return expectedProcessIds().flatMap((processId) =>
    Array.from(
      { length: expectedEventCountForProcess(processId) },
      (_, index) =>
        `${processId}.EVT-${String(index + 1).padStart(3, '0')}`,
    ),
  );
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

function assertExactSet(actual, expected, label) {
  const left = [...new Set(actual)].sort();
  const right = [...new Set(expected)].sort();
  assertExactSequence(left, right, label);
}

function extractProcessIdsFromPhysicalContract() {
  const source = readText(
    processContractPath,
    'predecessor ProcessId contract',
  );
  const match = source.match(
    /export const PROCESS_IDS = \[([\s\S]*?)\] as const;/,
  );

  if (!match) {
    fail('Predecessor ProcessId contract does not expose PROCESS_IDS.');
  }

  const ids = [
    ...match[1].matchAll(/"(VPROC-[0-9]{4})"/g),
  ].map((entry) => entry[1]);

  assertExactSequence(
    ids,
    expectedProcessIds(),
    'predecessor PROCESS_IDS',
  );

  return ids;
}

function parseProcCat017(source) {
  const task = extractTaskSection(source, 'PROC-CAT-017');
  const events = [];
  const conditionalTemplates = [];

  for (const line of task.split('\n')) {
    const cells = splitMarkdownRow(line);

    /*
     * PROC-CAT-017 has seven semantic columns, but descriptive cells can
     * contain additional pipe characters. Therefore this parser MUST NOT
     * require cells.length === 7.
     *
     * The shared identity contract only needs the stable fields at the
     * beginning of the row plus the final sensitivity cell:
     *   0 BusinessEventId
     *   1 ProcessId
     *   2 event_type
     *   3 event_class
     *   ... descriptive source/confirmed text ...
     *   last sensitivity
     */
    if (
      cells.length >= 5
      && /^VPROC-[0-9]{4}\.EVT-[0-9]{3}$/.test(cells[0] ?? '')
      && /^VPROC-[0-9]{4}$/.test(cells[1] ?? '')
      && /^vento\.process\.vproc-[0-9]{4}\.[a-z0-9-]+\.v1$/.test(
        cells[2] ?? '',
      )
      && /^[A-Z_]+$/.test(cells[3] ?? '')
      && /^[A-Z_]+$/.test(cells.at(-1) ?? '')
    ) {
      events.push({
        business_event_id: cells[0],
        process_id: cells[1],
        event_type: cells[2],
        event_class: cells[3],
        sensitivity: cells.at(-1),
      });
      continue;
    }

    if (
      cells.length >= 3
      && /^vento\.process\.vproc-####\.[a-z0-9-]+\.v1$/.test(
        cells[0] ?? '',
      )
    ) {
      conditionalTemplates.push(cells[0]);
    }
  }

  // PROC-CAT-017 groups some processes by functional section, so source-row
  // order is not the canonical BusinessEventId order. Normalize deterministically
  // before comparing with SHELL-CON-013 and before generating artifacts.
  events.sort((left, right) =>
    left.business_event_id.localeCompare(right.business_event_id, 'en'),
  );

  const expectedIds = expectedBusinessEventIds();
  const actualIds = events.map((entry) => entry.business_event_id);

  if (
    actualIds.length !== expectedIds.length
    || actualIds.some((value, index) => value !== expectedIds[index])
  ) {
    const actualSet = new Set(actualIds);
    const expectedSet = new Set(expectedIds);
    const missing = expectedIds.filter((value) => !actualSet.has(value));
    const unexpected = actualIds.filter((value) => !expectedSet.has(value));

    fail(
      'PROC-CAT-017 normal BusinessEventId registry mismatch. '
      + `expected=${expectedIds.length} actual=${actualIds.length} `
      + `missing=${missing.join(',') || 'NONE'} `
      + `unexpected=${unexpected.join(',') || 'NONE'}`,
    );
  }

  if (events.length !== expectedBusinessEventCount) {
    fail(
      `PROC-CAT-017 must contain ${expectedBusinessEventCount} normal events; `
      + `received ${events.length}.`,
    );
  }

  if (
    new Set(events.map((entry) => entry.business_event_id)).size
    !== expectedBusinessEventCount
  ) {
    fail('PROC-CAT-017 contains duplicate BusinessEventId values.');
  }

  if (
    new Set(events.map((entry) => entry.event_type)).size
    !== expectedBusinessEventCount
  ) {
    fail('PROC-CAT-017 contains duplicate event_type values.');
  }

  const physicalProcesses = new Set(expectedProcessIds());

  for (const event of events) {
    const processFromId = event.business_event_id.slice(0, 10);

    if (event.process_id !== processFromId) {
      fail(`${event.business_event_id} does not match its ProcessId.`);
    }

    if (!physicalProcesses.has(event.process_id)) {
      fail(`${event.business_event_id} references unknown ProcessId.`);
    }

    const expectedTypePrefix =
      `vento.process.${event.process_id.toLowerCase()}.`;

    if (
      !event.event_type.startsWith(expectedTypePrefix)
      || !event.event_type.endsWith('.v1')
    ) {
      fail(`${event.business_event_id} has incompatible event_type.`);
    }

    if (!expectedEventClasses.includes(event.event_class)) {
      fail(`${event.business_event_id} has unknown event class.`);
    }

    if (!expectedSensitivities.includes(event.sensitivity)) {
      fail(`${event.business_event_id} has unknown sensitivity.`);
    }
  }

  assertExactSet(
    events.map((entry) => entry.event_class),
    expectedEventClasses,
    'PROC-CAT-017 event classes',
  );

  assertExactSet(
    events.map((entry) => entry.sensitivity),
    expectedSensitivities,
    'PROC-CAT-017 sensitivities',
  );

  assertExactSequence(
    conditionalTemplates,
    expectedConditionalTemplates,
    'PROC-CAT-017 conditional templates',
  );

  return {
    task,
    events,
    conditionalTemplates,
  };
}

function parseShellCon013(source) {
  const task = extractTaskSection(source, 'SHELL-CON-013');
  const matrix = [];
  const conditionalTemplates = [];

  for (const line of task.split('\n')) {
    const cells = splitMarkdownRow(line);

    if (
      cells.length === 6
      && /^VPROC-[0-9]{4}\.EVT-[0-9]{3}$/.test(cells[0] ?? '')
    ) {
      matrix.push({
        business_event_id: cells[0],
        process_id: cells[1],
        decision: cells[2],
        result: cells[3],
        status: cells[4],
        block: cells[5],
      });
      continue;
    }

    if (
      cells.length === 3
      && /^vento\.process\.vproc-####\.[a-z0-9-]+\.v1$/.test(cells[0] ?? '')
    ) {
      conditionalTemplates.push(cells[0]);
    }
  }

  assertExactSequence(
    matrix.map((entry) => entry.business_event_id),
    expectedBusinessEventIds(),
    'SHELL-CON-013 BusinessEventId matrix',
  );

  for (const row of matrix) {
    if (row.process_id !== row.business_event_id.slice(0, 10)) {
      fail(`${row.business_event_id} has the wrong ProcessId in SHELL-CON-013.`);
    }

    if (row.decision !== 'Centralizar sin renumerar') {
      fail(`${row.business_event_id} changes the centralization decision.`);
    }

    if (row.result !== 'Incluido en contrato lógico') {
      fail(`${row.business_event_id} changes the logical contract result.`);
    }

    if (row.status !== 'Definición normal vigente') {
      fail(`${row.business_event_id} changes the normal definition status.`);
    }

    if (row.block !== 'No aplica') {
      fail(`${row.business_event_id} changes the approved block status.`);
    }
  }

  assertExactSequence(
    conditionalTemplates,
    expectedConditionalTemplates,
    'SHELL-CON-013 conditional templates',
  );

  for (const marker of [
    '@vento/contracts/events',
    'BusinessEventId',
    businessEventIdPatternSource,
    '395/395',
    '69/69',
    '12 clases',
    '4 sensibilidades',
    '8 familias condicionales',
    'SHELL-CON-014',
  ]) {
    if (!task.includes(marker)) {
      fail(`SHELL-CON-013 is missing canonical marker: ${marker}`);
    }
  }

  if (/PROC\.FAMILY\.[A-Z_]+/.test(task)) {
    fail('SHELL-CON-013 still contains deprecated PROC.FAMILY aliases.');
  }

  return {
    task,
    matrix,
    conditionalTemplates,
  };
}

function loadCanonicalContract() {
  const procSource = readText(procCatSourcePath, 'PROC-CAT source');
  const shellSource = readText(shellContractSourcePath, 'SHELL-CON source');

  const physicalProcessIds = extractProcessIdsFromPhysicalContract();
  const proc = parseProcCat017(procSource);
  const shell = parseShellCon013(shellSource);

  assertExactSequence(
    proc.events.map((entry) => entry.process_id)
      .filter((value, index, values) => values.indexOf(value) === index),
    physicalProcessIds,
    'PROC-CAT-017 process coverage vs ProcessId contract',
  );

  assertExactSequence(
    proc.events.map((entry) => entry.business_event_id),
    shell.matrix.map((entry) => entry.business_event_id),
    'PROC-CAT-017 vs SHELL-CON-013 normal event identities',
  );

  assertExactSequence(
    proc.conditionalTemplates,
    shell.conditionalTemplates,
    'PROC-CAT-017 vs SHELL-CON-013 conditional templates',
  );

  return {
    processIds: physicalProcessIds,
    events: proc.events,
    conditionalTemplates: proc.conditionalTemplates,
  };
}

function renderHeader() {
  return `// GENERATED FILE. DO NOT EDIT.
// Semantic owner: PROC-CAT-017
// Identity centralization: SHELL-CON-013
// Process identity dependency: SHELL-CON-009
// Source contract SHA256: ${sourceContractSha256}

`;
}

function renderContract(contract) {
  const idRows = contract.events
    .map((entry) => `  ${JSON.stringify(entry.business_event_id)},`)
    .join('\n');

  const typeRows = contract.events
    .map((entry) => `  ${JSON.stringify(entry.event_type)},`)
    .join('\n');

  const definitionRows = contract.events
    .map((entry) => [
      '  {',
      `    business_event_id: ${JSON.stringify(entry.business_event_id)},`,
      `    process_id: ${JSON.stringify(entry.process_id)},`,
      `    event_type: ${JSON.stringify(entry.event_type)},`,
      `    event_class: ${JSON.stringify(entry.event_class)},`,
      `    sensitivity: ${JSON.stringify(entry.sensitivity)},`,
      '  },',
    ].join('\n'))
    .join('\n');

  const conditionalRows = contract.conditionalTemplates
    .map((entry) => `  ${JSON.stringify(entry)},`)
    .join('\n');

  const classRows = expectedEventClasses
    .map((entry) => `  ${JSON.stringify(entry)},`)
    .join('\n');

  const sensitivityRows = expectedSensitivities
    .map((entry) => `  ${JSON.stringify(entry)},`)
    .join('\n');

  return `${renderHeader()}import type {
  ProcessId,
} from "../../processes/generated/process-id.contract.js";

export const BUSINESS_EVENT_ID_PATTERN_SOURCE =
  ${JSON.stringify(businessEventIdPatternSource)} as const;

export const BUSINESS_EVENT_ID_PATTERN =
  /^VPROC-[0-9]{4}\\.EVT-[0-9]{3}$/;

export const BUSINESS_EVENT_CLASSES = [
${classRows}
] as const;

export type BusinessEventClass =
  (typeof BUSINESS_EVENT_CLASSES)[number];

export const BUSINESS_EVENT_SENSITIVITIES = [
${sensitivityRows}
] as const;

export type BusinessEventSensitivity =
  (typeof BUSINESS_EVENT_SENSITIVITIES)[number];

export const BUSINESS_EVENT_IDS = [
${idRows}
] as const;

export type BusinessEventId =
  (typeof BUSINESS_EVENT_IDS)[number];

export const BUSINESS_EVENT_TYPES = [
${typeRows}
] as const;

export type BusinessEventType =
  (typeof BUSINESS_EVENT_TYPES)[number];

export const CONDITIONAL_BUSINESS_EVENT_TYPE_TEMPLATES = [
${conditionalRows}
] as const;

export type ConditionalBusinessEventTypeTemplate =
  (typeof CONDITIONAL_BUSINESS_EVENT_TYPE_TEMPLATES)[number];

export type BusinessEventDefinition = Readonly<{
  business_event_id: BusinessEventId;
  process_id: ProcessId;
  event_type: BusinessEventType;
  event_class: BusinessEventClass;
  sensitivity: BusinessEventSensitivity;
}>;

export const BUSINESS_EVENT_DEFINITIONS = [
${definitionRows}
] as const satisfies readonly BusinessEventDefinition[];

export const BUSINESS_EVENT_REGISTRY_METADATA = {
  semantic_owner_task_id: "PROC-CAT-017",
  process_contract_task_id: "SHELL-CON-009",
  contract_task_id: "SHELL-CON-013",
  logical_namespace: "@vento/contracts/events",
  process_count: 69,
  normal_definition_count: 395,
  conditional_family_count: 8,
  event_class_count: 12,
  sensitivity_count: 4,
  centralization_decision: "Centralizar sin renumerar",
  format_pattern: ${JSON.stringify(businessEventIdPatternSource)},
} as const;

export type BusinessEventRegistryMetadata =
  typeof BUSINESS_EVENT_REGISTRY_METADATA;

const BUSINESS_EVENT_ID_SET =
  new Set<string>(BUSINESS_EVENT_IDS);

const BUSINESS_EVENT_TYPE_SET =
  new Set<string>(BUSINESS_EVENT_TYPES);

const BUSINESS_EVENT_DEFINITION_BY_ID =
  new Map<BusinessEventId, BusinessEventDefinition>(
    BUSINESS_EVENT_DEFINITIONS.map((definition) => [
      definition.business_event_id,
      definition,
    ] as const),
  );

export function isBusinessEventIdFormat(
  value: unknown,
): value is string {
  return (
    typeof value === "string"
    && BUSINESS_EVENT_ID_PATTERN.test(value)
  );
}

export function isBusinessEventId(
  value: unknown,
): value is BusinessEventId {
  return (
    isBusinessEventIdFormat(value)
    && BUSINESS_EVENT_ID_SET.has(value)
  );
}

export function assertBusinessEventId(
  value: unknown,
): asserts value is BusinessEventId {
  if (!isBusinessEventId(value)) {
    throw new TypeError("Unknown BusinessEventId.");
  }
}

export function isBusinessEventType(
  value: unknown,
): value is BusinessEventType {
  return (
    typeof value === "string"
    && BUSINESS_EVENT_TYPE_SET.has(value)
  );
}

function requireBusinessEventDefinition(
  businessEventId: BusinessEventId,
): BusinessEventDefinition {
  const definition =
    BUSINESS_EVENT_DEFINITION_BY_ID.get(businessEventId);

  if (!definition) {
    throw new TypeError("BusinessEventId has no definition.");
  }

  return definition;
}

export function resolveBusinessEventProcessId(
  businessEventId: BusinessEventId,
): ProcessId {
  return requireBusinessEventDefinition(
    businessEventId,
  ).process_id;
}

export function resolveBusinessEventType(
  businessEventId: BusinessEventId,
): BusinessEventType {
  return requireBusinessEventDefinition(
    businessEventId,
  ).event_type;
}

export function resolveBusinessEventClass(
  businessEventId: BusinessEventId,
): BusinessEventClass {
  return requireBusinessEventDefinition(
    businessEventId,
  ).event_class;
}

export function resolveBusinessEventSensitivity(
  businessEventId: BusinessEventId,
): BusinessEventSensitivity {
  return requireBusinessEventDefinition(
    businessEventId,
  ).sensitivity;
}
`;
}

function renderIndex() {
  return `${renderHeader()}export {
  BUSINESS_EVENT_ID_PATTERN_SOURCE,
  BUSINESS_EVENT_ID_PATTERN,
  BUSINESS_EVENT_CLASSES,
  BUSINESS_EVENT_SENSITIVITIES,
  BUSINESS_EVENT_IDS,
  BUSINESS_EVENT_TYPES,
  CONDITIONAL_BUSINESS_EVENT_TYPE_TEMPLATES,
  BUSINESS_EVENT_DEFINITIONS,
  BUSINESS_EVENT_REGISTRY_METADATA,
  isBusinessEventIdFormat,
  isBusinessEventId,
  assertBusinessEventId,
  isBusinessEventType,
  resolveBusinessEventProcessId,
  resolveBusinessEventType,
  resolveBusinessEventClass,
  resolveBusinessEventSensitivity,
} from "./business-event.contract.js";

export type {
  BusinessEventClass,
  BusinessEventSensitivity,
  BusinessEventId,
  BusinessEventType,
  ConditionalBusinessEventTypeTemplate,
  BusinessEventDefinition,
  BusinessEventRegistryMetadata,
} from "./business-event.contract.js";
`;
}

function assertOrWrite(filePath, expected, checkOnly) {
  const current = fs.existsSync(filePath)
    ? fs.readFileSync(filePath, 'utf8')
    : null;

  if (checkOnly) {
    if (
      current === null
      || normalizeEol(current) !== normalizeEol(expected)
    ) {
      fail(
        `Generated artifact is stale: ${path.relative(process.cwd(), filePath)}`,
      );
    }

    return 'FRESH';
  }

  fs.mkdirSync(path.dirname(filePath), { recursive: true });

  if (
    current === null
    || normalizeEol(current) !== normalizeEol(expected)
  ) {
    fs.writeFileSync(filePath, expected, 'utf8');
    return 'UPDATED';
  }

  return 'FRESH';
}

export function generateBusinessEventContracts({
  checkOnly = false,
} = {}) {
  const contract = loadCanonicalContract();

  return {
    processIds: contract.processIds,
    events: contract.events,
    conditionalTemplates: contract.conditionalTemplates,
    results: {
      contract: assertOrWrite(
        contractPath,
        renderContract(contract),
        checkOnly,
      ),
      index: assertOrWrite(
        indexPath,
        renderIndex(),
        checkOnly,
      ),
    },
  };
}

const isCli =
  process.argv[1]
  && path.resolve(process.argv[1]) === path.resolve(currentFile);

if (isCli) {
  try {
    const unknown = process.argv
      .slice(2)
      .filter((argument) => argument !== '--check');

    if (unknown.length > 0) {
      fail(`Unknown arguments: ${unknown.join(', ')}`);
    }

    const checkOnly = process.argv.includes('--check');
    const result = generateBusinessEventContracts({
      checkOnly,
    });

    console.log(
      `[VENTO CONTRACTS] BUSINESS_EVENTS ${checkOnly ? 'CHECK' : 'GENERATE'} PASS`,
    );
    console.log(
      `[VENTO CONTRACTS] NORMAL_EVENTS ${result.events.length}`,
    );
    console.log(
      `[VENTO CONTRACTS] PROCESSES ${result.processIds.length}`,
    );
    console.log(
      `[VENTO CONTRACTS] CONDITIONAL_TEMPLATES ${result.conditionalTemplates.length}`,
    );
    console.log(
      '[VENTO CONTRACTS] MEMBERSHIP SYNTAX_AND_SET',
    );
    console.log(
      `[VENTO CONTRACTS] CONTRACT ${result.results.contract}`,
    );
    console.log(
      `[VENTO CONTRACTS] INDEX ${result.results.index}`,
    );
    console.log('');
    console.log('=== RESULTADO PARA CHATGPT ===');
    console.log('ESTADO: PASS');
    console.log(
      `OPERACION: ${checkOnly ? 'BUSINESS_EVENTS_CHECK' : 'BUSINESS_EVENTS_GENERATE'}`,
    );
    console.log(`NORMAL_EVENTS: ${result.events.length}`);
    console.log(`PROCESSES: ${result.processIds.length}`);
    console.log(
      `CONDITIONAL_TEMPLATES: ${result.conditionalTemplates.length}`,
    );
    console.log(`CONTRACT: ${result.results.contract}`);
    console.log(`INDEX: ${result.results.index}`);
    console.log('=== FIN RESULTADO PARA CHATGPT ===');
  } catch (error) {
    const message =
      error instanceof Error ? error.message : String(error);
    console.error('[VENTO CONTRACTS] BUSINESS_EVENTS FAIL');
    console.error(message);
    console.error('');
    console.error('=== RESULTADO PARA CHATGPT ===');
    console.error('ESTADO: FAIL');
    console.error('OPERACION: BUSINESS_EVENTS');
    console.error(`ERROR: ${message}`);
    console.error('=== FIN RESULTADO PARA CHATGPT ===');
    process.exitCode = 1;
  }
}