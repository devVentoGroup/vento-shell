import fs from 'node:fs';
import path from 'node:path';
import { fileURLToPath } from 'node:url';

const currentFile = fileURLToPath(import.meta.url);
const scriptDirectory = path.dirname(currentFile);
const processesRoot = path.resolve(scriptDirectory, '..');
const repositoryRoot = path.resolve(processesRoot, '../../..');

const stateSourcePath = path.join(
  repositoryRoot,
  'docs',
  'plan-canonico',
  'modular',
  'bloques',
  'E2_PROCESOS_Y_EXPERIENCIA',
  '01_03_ESTADOS_TRANSICIONES_EXCEPCIONES_Y_REVERSAS.md',
);

const shellSourcePath = path.join(
  repositoryRoot,
  'docs',
  'plan-canonico',
  'modular',
  'bloques',
  'H_FUNDACION_COMPARTIDA',
  '03_CONTRATOS_COMPARTIDOS.md',
);

const processIdContractPath = path.join(
  processesRoot,
  'generated',
  'process-id.contract.ts',
);

const generatedDirectory = path.join(
  processesRoot,
  'generated',
  'states',
);

const contractPath = path.join(
  generatedDirectory,
  'process-state.contract.ts',
);

const indexPath = path.join(
  generatedDirectory,
  'index.ts',
);

const sourceContractSha256 =
  '0c20de58e5ffdbfcaf80f469e906816f8cab4f870f1a2e067fb46cb811b6d9d4';

const registryIds = Object.freeze({
  initial: 'PROC-PROCESS-INITIAL-STATE-REGISTRY-001',
  intermediate: 'PROC-PROCESS-INTERMEDIATE-STATE-REGISTRY-001',
  finalNormal: 'PROC-PROCESS-FINAL-STATE-REGISTRY-001',
  transitions: 'PROC-PROCESS-TRANSITION-REGISTRY-001',
});

const expectedCounts = Object.freeze({
  processes: 69,
  initial: 69,
  intermediate: 454,
  finalNormal: 69,
  total: 592,
  transitions: 590,
});

const expectedIntermediatePhaseCounts = Object.freeze({
  VALIDACION: 29,
  ANALISIS: 44,
  REVISION: 36,
  APROBACION: 44,
  PREPARACION: 69,
  EJECUCION: 72,
  HANDOFF: 65,
  VERIFICACION: 35,
  RECONCILIACION: 34,
  ACTIVO: 26,
});

const expectedFinalTypeCounts = Object.freeze({
  CERRADO: 28,
  RECONCILIADO: 21,
  LIBERADO: 4,
  CUMPLIDO: 4,
  VERIFICADO: 6,
  LIQUIDADO: 2,
  EVALUADO: 3,
  FORMALIZADO: 1,
});

const processStatePattern =
  /^VPROC-[0-9]{4}\.[A-Z][A-Z0-9_]*$/;

const transitionIdPattern =
  /^VPROC-[0-9]{4}\.TR-[0-9]{3}$/;

function fail(message) {
  throw new Error(message);
}

function readText(filePath, label) {
  if (!fs.existsSync(filePath)) {
    fail(`Missing ${label}: ${path.relative(process.cwd(), filePath)}`);
  }

  return fs.readFileSync(filePath, 'utf8').replaceAll('\r\n', '\n');
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

function extractNumberedSection(taskSection, sectionNumber, nextSectionNumber) {
  const startPattern = new RegExp(
    `^#### ${sectionNumber}\\.[^\\n]*$`,
    'm',
  );
  const startMatch = taskSection.match(startPattern);

  if (!startMatch || startMatch.index === undefined) {
    fail(`Section ${sectionNumber} not found.`);
  }

  const start = startMatch.index;
  const tailStart = start + startMatch[0].length;
  const tail = taskSection.slice(tailStart);
  const endPattern = new RegExp(
    `^#### ${nextSectionNumber}\\.[^\\n]*$`,
    'm',
  );
  const endMatch = tail.match(endPattern);

  if (!endMatch || endMatch.index === undefined) {
    fail(`Section ${nextSectionNumber} not found after section ${sectionNumber}.`);
  }

  return taskSection.slice(start, tailStart + endMatch.index);
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

function cleanCell(value) {
  return value
    .trim()
    .replace(/<br\s*\/?>/gi, '\n')
    .replace(/\\\|/g, '|')
    .replace(/&#124;/g, '|')
    .replace(/`([^`]*)`/g, '$1')
    .replace(/\*\*([^*]+)\*\*/g, '$1')
    .trim();
}

function extractProcessIds(processIdContractSource) {
  const match = processIdContractSource.match(
    /export const PROCESS_IDS = \[([\s\S]*?)\] as const;/,
  );

  if (!match) {
    fail('Current ProcessId contract does not expose PROCESS_IDS.');
  }

  const processIds = [
    ...match[1].matchAll(/"(VPROC-[0-9]{4})"/g),
  ].map((entry) => entry[1]);

  const expected = Array.from(
    { length: expectedCounts.processes },
    (_, index) => `VPROC-${String(index + 1).padStart(4, '0')}`,
  );

  if (JSON.stringify(processIds) !== JSON.stringify(expected)) {
    fail('Current ProcessId contract is not exactly VPROC-0001..VPROC-0069.');
  }

  return processIds;
}

function parseInitialStates(taskSection) {
  const states = [];

  for (const line of taskSection.split('\n')) {
    const cells = splitMarkdownRow(line);

    if (
      cells.length !== 8
      || !/^VPROC-[0-9]{4}$/.test(cells[0] ?? '')
      || !processStatePattern.test(cells[3] ?? '')
    ) {
      continue;
    }

    states.push({
      process_state_id: cells[3],
      process_id: cells[0],
      state_code: cells[3].split('.')[1],
      kind: 'INITIAL',
      owner: cells[1],
      process_name: cells[2],
      label: cells[4],
      initialization_pattern: cells[5],
      minimum_entry_condition: cells[6],
      birth_invariant: cells[7],
    });
  }

  return states;
}

function parseIntermediateStates(taskSection) {
  const states = [];

  for (const line of taskSection.split('\n')) {
    const cells = splitMarkdownRow(line);

    if (
      cells.length !== 8
      || !/^VPROC-[0-9]{4}$/.test(cells[0] ?? '')
      || !/^[0-9]+$/.test(cells[3] ?? '')
      || !processStatePattern.test(cells[4] ?? '')
    ) {
      continue;
    }

    states.push({
      process_state_id: cells[4],
      process_id: cells[0],
      state_code: cells[4].split('.')[1],
      kind: 'INTERMEDIATE',
      owner: cells[1],
      initial_state_id: cells[2],
      order: Number(cells[3]),
      label: cells[5],
      phase: cells[6],
      minimum_truth_and_limit: cells[7],
    });
  }

  return states;
}

function parseFinalNormalStates(taskSection) {
  const states = [];

  for (const line of taskSection.split('\n')) {
    const cells = splitMarkdownRow(line);

    if (
      cells.length !== 8
      || !/^VPROC-[0-9]{4}$/.test(cells[0] ?? '')
      || !processStatePattern.test(cells[3] ?? '')
    ) {
      continue;
    }

    states.push({
      process_state_id: cells[3],
      process_id: cells[0],
      state_code: cells[3].split('.')[1],
      kind: 'FINAL_NORMAL',
      owner: cells[1],
      initial_state_id: cells[2],
      label: cells[4],
      terminal_type: cells[5],
      minimum_entry_criterion: cells[6],
      final_truth_and_limit: cells[7],
    });
  }

  return states;
}

function extractMatrixStateIds(shellCon010Section) {
  const matrixSection = extractNumberedSection(
    shellCon010Section,
    8,
    9,
  );

  const stateIds = [];

  for (const line of matrixSection.split('\n')) {
    const cells = splitMarkdownRow(line);

    if (
      cells.length < 4
      || !/^VPROC-[0-9]{4}$/.test(cells[0] ?? '')
    ) {
      continue;
    }

    for (const match of line.matchAll(
      /VPROC-[0-9]{4}\.[A-Z][A-Z0-9_]*/g,
    )) {
      stateIds.push(match[0]);
    }
  }

  if (stateIds.length !== expectedCounts.total) {
    fail(
      `SHELL-CON-010 matrix must contain ${expectedCounts.total} state identities; received ${stateIds.length}.`,
    );
  }

  if (new Set(stateIds).size !== stateIds.length) {
    fail('SHELL-CON-010 matrix contains duplicate full state identities.');
  }

  return stateIds;
}

function extractTransitionIds(procCat012Section) {
  const transitionIds = [];

  for (const line of procCat012Section.split('\n')) {
    const cells = splitMarkdownRow(line);
    const candidate = cells[0] ?? '';

    if (transitionIdPattern.test(candidate)) {
      transitionIds.push(candidate);
    }
  }

  if (transitionIds.length !== expectedCounts.transitions) {
    fail(
      `PROC-CAT-012 must contain ${expectedCounts.transitions} transition rows; received ${transitionIds.length}.`,
    );
  }

  if (new Set(transitionIds).size !== transitionIds.length) {
    fail('PROC-CAT-012 contains duplicate transition identities.');
  }

  return transitionIds;
}

function countBy(values, selector) {
  const counts = {};

  for (const value of values) {
    const key = selector(value);
    counts[key] = (counts[key] ?? 0) + 1;
  }

  return counts;
}

function normalizeObject(value) {
  return Object.fromEntries(
    Object.entries(value).sort(([left], [right]) =>
      left.localeCompare(right),
    ),
  );
}

function assertExactObject(actual, expected, label) {
  if (
    JSON.stringify(normalizeObject(actual))
    !== JSON.stringify(normalizeObject(expected))
  ) {
    fail(
      `${label} mismatch. actual=${JSON.stringify(actual)} expected=${JSON.stringify(expected)}`,
    );
  }
}

function assertCount(values, expected, label) {
  if (values.length !== expected) {
    fail(`${label} must contain ${expected}; received ${values.length}.`);
  }
}

function validateStateSet({
  processIds,
  initialStates,
  intermediateStates,
  finalNormalStates,
  matrixStateIds,
  transitionIds,
}) {
  assertCount(initialStates, expectedCounts.initial, 'INITIAL states');
  assertCount(
    intermediateStates,
    expectedCounts.intermediate,
    'INTERMEDIATE states',
  );
  assertCount(
    finalNormalStates,
    expectedCounts.finalNormal,
    'FINAL_NORMAL states',
  );

  const allStates = [
    ...initialStates,
    ...intermediateStates,
    ...finalNormalStates,
  ];

  assertCount(allStates, expectedCounts.total, 'ProcessStateId');

  const stateById = new Map();

  for (const state of allStates) {
    if (!processStatePattern.test(state.process_state_id)) {
      fail(`Invalid ProcessStateId syntax: ${state.process_state_id}`);
    }

    const [prefix, stateCode] = state.process_state_id.split('.');

    if (prefix !== state.process_id) {
      fail(
        `Process/state prefix mismatch: ${state.process_state_id} vs ${state.process_id}`,
      );
    }

    if (!/^[A-Z][A-Z0-9_]*$/.test(stateCode)) {
      fail(`Invalid STATE_CODE: ${stateCode}`);
    }

    if (!processIds.includes(state.process_id)) {
      fail(`Unknown ProcessId in state registry: ${state.process_id}`);
    }

    if (stateById.has(state.process_state_id)) {
      fail(`Duplicate ProcessStateId: ${state.process_state_id}`);
    }

    stateById.set(state.process_state_id, state);
  }

  const matrixSet = new Set(matrixStateIds);

  if (matrixSet.size !== stateById.size) {
    fail('SHELL-CON-010 matrix and semantic state registries differ in size.');
  }

  for (const stateId of stateById.keys()) {
    if (!matrixSet.has(stateId)) {
      fail(`State registry identity missing from SHELL-CON-010 matrix: ${stateId}`);
    }
  }

  for (const stateId of matrixSet) {
    if (!stateById.has(stateId)) {
      fail(`SHELL-CON-010 matrix identity missing from semantic registries: ${stateId}`);
    }
  }

  const intermediatePhaseCounts = countBy(
    intermediateStates,
    (state) => state.phase,
  );
  assertExactObject(
    intermediatePhaseCounts,
    expectedIntermediatePhaseCounts,
    'Intermediate phase distribution',
  );

  const finalTypeCounts = countBy(
    finalNormalStates,
    (state) => state.terminal_type,
  );
  assertExactObject(
    finalTypeCounts,
    expectedFinalTypeCounts,
    'Final type distribution',
  );

  for (const processId of processIds) {
    const initials = initialStates.filter(
      (state) => state.process_id === processId,
    );
    const intermediates = intermediateStates.filter(
      (state) => state.process_id === processId,
    );
    const finals = finalNormalStates.filter(
      (state) => state.process_id === processId,
    );

    if (initials.length !== 1) {
      fail(`${processId} must have exactly one INITIAL state.`);
    }

    if (intermediates.length === 0) {
      fail(`${processId} must have at least one INTERMEDIATE state.`);
    }

    if (finals.length !== 1) {
      fail(`${processId} must have exactly one FINAL_NORMAL state.`);
    }

    const ordered = [...intermediates].sort(
      (left, right) => left.order - right.order,
    );

    ordered.forEach((state, index) => {
      if (state.order !== index + 1) {
        fail(
          `${processId} intermediate order must be contiguous from 1; received ${state.order} at position ${index + 1}.`,
        );
      }

      if (state.initial_state_id !== initials[0].process_state_id) {
        fail(
          `${state.process_state_id} references an unexpected initial state.`,
        );
      }
    });

    if (finals[0].initial_state_id !== initials[0].process_state_id) {
      fail(`${finals[0].process_state_id} references an unexpected initial state.`);
    }
  }

  const stateIdSet = new Set(stateById.keys());

  for (const transitionId of transitionIds) {
    if (stateIdSet.has(transitionId)) {
      fail(`Transition identity leaked into ProcessStateId: ${transitionId}`);
    }
  }

  return {
    stateById,
    intermediatePhaseCounts,
    finalTypeCounts,
  };
}

function loadCanonicalContract() {
  const stateSource = readText(
    stateSourcePath,
    'process state canonical source',
  );
  const shellSource = readText(
    shellSourcePath,
    'SHELL-CON canonical source',
  );
  const processIdContractSource = readText(
    processIdContractPath,
    'current ProcessId contract',
  );

  const procCat009Section = extractTaskSection(
    stateSource,
    'PROC-CAT-009',
  );
  const procCat010Section = extractTaskSection(
    stateSource,
    'PROC-CAT-010',
  );
  const procCat011Section = extractTaskSection(
    stateSource,
    'PROC-CAT-011',
  );
  const procCat012Section = extractTaskSection(
    stateSource,
    'PROC-CAT-012',
  );
  const shellCon010Section = extractTaskSection(
    shellSource,
    'SHELL-CON-010',
  );

  for (const [label, section, registryId] of [
    ['PROC-CAT-009', procCat009Section, registryIds.initial],
    ['PROC-CAT-010', procCat010Section, registryIds.intermediate],
    ['PROC-CAT-011', procCat011Section, registryIds.finalNormal],
    ['PROC-CAT-012', procCat012Section, registryIds.transitions],
  ]) {
    if (!section.includes(registryId)) {
      fail(`${label} is missing registry ${registryId}.`);
    }
  }

  const shellMarkers = [
    '592',
    '454',
    '590',
    '@vento/contracts/processes',
    'ProcessStateId',
    '^VPROC-[0-9]{4}\\.[A-Z][A-Z0-9_]*$',
    'INITIAL',
    'INTERMEDIATE',
    'FINAL_NORMAL',
    'SHELL-CON-011',
  ];

  for (const marker of shellMarkers) {
    if (!shellCon010Section.includes(marker)) {
      fail(`SHELL-CON-010 is missing canonical marker: ${marker}`);
    }
  }

  const processIds = extractProcessIds(processIdContractSource);
  const initialStates = parseInitialStates(procCat009Section);
  const intermediateStates = parseIntermediateStates(procCat010Section);
  const finalNormalStates = parseFinalNormalStates(procCat011Section);
  const matrixStateIds = extractMatrixStateIds(shellCon010Section);
  const transitionIds = extractTransitionIds(procCat012Section);

  const validation = validateStateSet({
    processIds,
    initialStates,
    intermediateStates,
    finalNormalStates,
    matrixStateIds,
    transitionIds,
  });

  const orderedStates = matrixStateIds.map(
    (stateId) => validation.stateById.get(stateId),
  );

  if (orderedStates.some((state) => state === undefined)) {
    fail('Unable to order all ProcessStateId definitions from SHELL-CON-010.');
  }

  return {
    processIds,
    orderedStates,
    intermediatePhaseCounts: validation.intermediatePhaseCounts,
    finalTypeCounts: validation.finalTypeCounts,
    transitionIds,
  };
}

function renderHeader() {
  return `// GENERATED FILE. DO NOT EDIT.
// Canonical state registries: ${registryIds.initial}, ${registryIds.intermediate}, ${registryIds.finalNormal}
// Transition reconciliation: ${registryIds.transitions}
// Contract task: SHELL-CON-010
// Source contract SHA256: ${sourceContractSha256}

`;
}

function renderLiteralArray(name, values) {
  const rows = values
    .map((value) => `  ${JSON.stringify(value)},`)
    .join('\n');

  return `export const ${name} = [\n${rows}\n] as const;\n`;
}

function renderDefinition(state) {
  const common = [
    `process_state_id: ${JSON.stringify(state.process_state_id)}`,
    `process_id: ${JSON.stringify(state.process_id)}`,
    `state_code: ${JSON.stringify(state.state_code)}`,
    `kind: ${JSON.stringify(state.kind)}`,
    `owner: ${JSON.stringify(state.owner)}`,
    `label: ${JSON.stringify(state.label)}`,
  ];

  if (state.kind === 'INITIAL') {
    return {
      ...Object.fromEntries(
        common.map((entry) => {
          const separator = entry.indexOf(':');
          return [
            entry.slice(0, separator),
            JSON.parse(entry.slice(separator + 1).trim()),
          ];
        }),
      ),
      process_name: state.process_name,
      initialization_pattern: state.initialization_pattern,
      minimum_entry_condition: state.minimum_entry_condition,
      birth_invariant: state.birth_invariant,
    };
  }

  if (state.kind === 'INTERMEDIATE') {
    return {
      ...Object.fromEntries(
        common.map((entry) => {
          const separator = entry.indexOf(':');
          return [
            entry.slice(0, separator),
            JSON.parse(entry.slice(separator + 1).trim()),
          ];
        }),
      ),
      initial_state_id: state.initial_state_id,
      order: state.order,
      phase: state.phase,
      minimum_truth_and_limit: state.minimum_truth_and_limit,
    };
  }

  return {
    ...Object.fromEntries(
      common.map((entry) => {
        const separator = entry.indexOf(':');
        return [
          entry.slice(0, separator),
          JSON.parse(entry.slice(separator + 1).trim()),
        ];
      }),
    ),
    initial_state_id: state.initial_state_id,
    terminal_type: state.terminal_type,
    minimum_entry_criterion: state.minimum_entry_criterion,
    final_truth_and_limit: state.final_truth_and_limit,
  };
}

function renderContract(contract) {
  const stateIds = contract.orderedStates.map(
    (state) => state.process_state_id,
  );

  const definitions = contract.orderedStates
    .map((state) => `  ${JSON.stringify(renderDefinition(state))},`)
    .join('\n');

  const intermediatePhases = Object.keys(
    expectedIntermediatePhaseCounts,
  );
  const finalTypes = Object.keys(expectedFinalTypeCounts);

  return `${renderHeader()}import { isProcessId } from "../process-id.contract.js";
import type { ProcessId } from "../process-id.contract.js";

export const PROCESS_STATE_ID_PATTERN_SOURCE =
  "^VPROC-[0-9]{4}\\\\.[A-Z][A-Z0-9_]*$" as const;

export const PROCESS_STATE_ID_PATTERN =
  /^VPROC-[0-9]{4}\\.[A-Z][A-Z0-9_]*$/;

${renderLiteralArray('PROCESS_STATE_KINDS', ['INITIAL', 'INTERMEDIATE', 'FINAL_NORMAL'])}
export type ProcessStateKind =
  (typeof PROCESS_STATE_KINDS)[number];

${renderLiteralArray('PROCESS_INTERMEDIATE_PHASES', intermediatePhases)}
export type ProcessIntermediatePhase =
  (typeof PROCESS_INTERMEDIATE_PHASES)[number];

${renderLiteralArray('PROCESS_FINAL_TYPES', finalTypes)}
export type ProcessFinalType =
  (typeof PROCESS_FINAL_TYPES)[number];

${renderLiteralArray('PROCESS_STATE_IDS', stateIds)}
export type ProcessStateId =
  (typeof PROCESS_STATE_IDS)[number];

export type InitialProcessStateDefinition = {
  readonly process_state_id: ProcessStateId;
  readonly process_id: ProcessId;
  readonly state_code: string;
  readonly kind: "INITIAL";
  readonly owner: string;
  readonly label: string;
  readonly process_name: string;
  readonly initialization_pattern: string;
  readonly minimum_entry_condition: string;
  readonly birth_invariant: string;
};

export type IntermediateProcessStateDefinition = {
  readonly process_state_id: ProcessStateId;
  readonly process_id: ProcessId;
  readonly state_code: string;
  readonly kind: "INTERMEDIATE";
  readonly owner: string;
  readonly label: string;
  readonly initial_state_id: ProcessStateId;
  readonly order: number;
  readonly phase: ProcessIntermediatePhase;
  readonly minimum_truth_and_limit: string;
};

export type FinalNormalProcessStateDefinition = {
  readonly process_state_id: ProcessStateId;
  readonly process_id: ProcessId;
  readonly state_code: string;
  readonly kind: "FINAL_NORMAL";
  readonly owner: string;
  readonly label: string;
  readonly initial_state_id: ProcessStateId;
  readonly terminal_type: ProcessFinalType;
  readonly minimum_entry_criterion: string;
  readonly final_truth_and_limit: string;
};

export type ProcessStateDefinition =
  | InitialProcessStateDefinition
  | IntermediateProcessStateDefinition
  | FinalNormalProcessStateDefinition;

export const PROCESS_STATE_DEFINITIONS = [
${definitions}
] as const satisfies readonly ProcessStateDefinition[];

export const PROCESS_STATE_REGISTRY_METADATA = {
  initial_registry_id: ${JSON.stringify(registryIds.initial)},
  intermediate_registry_id: ${JSON.stringify(registryIds.intermediate)},
  final_normal_registry_id: ${JSON.stringify(registryIds.finalNormal)},
  transition_registry_id: ${JSON.stringify(registryIds.transitions)},
  source_task_id: "SHELL-CON-010",
  process_count: 69,
  initial_count: 69,
  intermediate_count: 454,
  final_normal_count: 69,
  process_state_count: 592,
  normal_transition_count: 590,
  intermediate_phase_counts: ${JSON.stringify(expectedIntermediatePhaseCounts)},
  final_type_counts: ${JSON.stringify(expectedFinalTypeCounts)},
} as const;

export type ProcessStateRegistryMetadata =
  typeof PROCESS_STATE_REGISTRY_METADATA;

const PROCESS_STATE_ID_SET =
  new Set<string>(PROCESS_STATE_IDS);

const PROCESS_STATE_DEFINITION_BY_ID =
  new Map<ProcessStateId, ProcessStateDefinition>(
    PROCESS_STATE_DEFINITIONS.map(
      (definition) => [
        definition.process_state_id,
        definition,
      ] as const,
    ),
  );

export function isProcessStateIdFormat(
  value: unknown,
): value is string {
  return (
    typeof value === "string"
    && PROCESS_STATE_ID_PATTERN.test(value)
  );
}

export function isProcessStateId(
  value: unknown,
): value is ProcessStateId {
  return (
    isProcessStateIdFormat(value)
    && PROCESS_STATE_ID_SET.has(value)
  );
}

export function isProcessStateForProcess(
  processId: unknown,
  stateId: unknown,
): stateId is ProcessStateId {
  if (!isProcessId(processId) || !isProcessStateId(stateId)) {
    return false;
  }

  return (
    PROCESS_STATE_DEFINITION_BY_ID
      .get(stateId)
      ?.process_id === processId
  );
}

export function getProcessStateDefinition(
  stateId: ProcessStateId,
): ProcessStateDefinition {
  const definition = PROCESS_STATE_DEFINITION_BY_ID.get(stateId);

  if (!definition) {
    throw new Error("Unknown ProcessStateId: " + stateId);
  }

  return definition;
}

export function getProcessIdForState(
  stateId: ProcessStateId,
): ProcessId {
  return getProcessStateDefinition(stateId).process_id;
}

export function getProcessStateCode(
  stateId: ProcessStateId,
): string {
  return getProcessStateDefinition(stateId).state_code;
}
`;
}

function renderIndex() {
  return `${renderHeader()}export {
  PROCESS_STATE_ID_PATTERN_SOURCE,
  PROCESS_STATE_ID_PATTERN,
  PROCESS_STATE_KINDS,
  PROCESS_INTERMEDIATE_PHASES,
  PROCESS_FINAL_TYPES,
  PROCESS_STATE_IDS,
  PROCESS_STATE_DEFINITIONS,
  PROCESS_STATE_REGISTRY_METADATA,
  isProcessStateIdFormat,
  isProcessStateId,
  isProcessStateForProcess,
  getProcessStateDefinition,
  getProcessIdForState,
  getProcessStateCode,
} from "./process-state.contract.js";

export type {
  ProcessStateKind,
  ProcessIntermediatePhase,
  ProcessFinalType,
  ProcessStateId,
  InitialProcessStateDefinition,
  IntermediateProcessStateDefinition,
  FinalNormalProcessStateDefinition,
  ProcessStateDefinition,
  ProcessStateRegistryMetadata,
} from "./process-state.contract.js";
`;
}

function assertOrWrite(filePath, expected, checkOnly) {
  const current = fs.existsSync(filePath)
    ? fs.readFileSync(filePath, 'utf8')
    : null;

  if (checkOnly) {
    if (current !== expected) {
      fail(
        `Generated artifact is stale: ${path.relative(process.cwd(), filePath)}`,
      );
    }

    return 'FRESH';
  }

  fs.mkdirSync(path.dirname(filePath), { recursive: true });

  if (current !== expected) {
    fs.writeFileSync(filePath, expected, 'utf8');
  }

  return current === expected ? 'FRESH' : 'UPDATED';
}

export function generateProcessStateContracts({
  checkOnly = false,
} = {}) {
  const contract = loadCanonicalContract();
  const counts = countBy(
    contract.orderedStates,
    (state) => state.kind,
  );

  return {
    counts: {
      processes: contract.processIds.length,
      initial: counts.INITIAL ?? 0,
      intermediate: counts.INTERMEDIATE ?? 0,
      finalNormal: counts.FINAL_NORMAL ?? 0,
      total: contract.orderedStates.length,
      transitions: contract.transitionIds.length,
    },
    intermediatePhaseCounts: contract.intermediatePhaseCounts,
    finalTypeCounts: contract.finalTypeCounts,
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
    const result = generateProcessStateContracts({
      checkOnly,
    });

    console.log(
      `[VENTO CONTRACTS] PROCESS_STATES ${checkOnly ? 'CHECK' : 'GENERATE'} PASS`,
    );
    console.log(
      `[VENTO CONTRACTS] PROCESS_STATE_IDS ${result.counts.total}`,
    );
    console.log(
      `[VENTO CONTRACTS] INITIAL ${result.counts.initial}`,
    );
    console.log(
      `[VENTO CONTRACTS] INTERMEDIATE ${result.counts.intermediate}`,
    );
    console.log(
      `[VENTO CONTRACTS] FINAL_NORMAL ${result.counts.finalNormal}`,
    );
    console.log(
      `[VENTO CONTRACTS] NORMAL_TRANSITIONS ${result.counts.transitions}`,
    );
    console.log(
      `[VENTO CONTRACTS] CONTRACT ${result.results.contract}`,
    );
    console.log(
      `[VENTO CONTRACTS] INDEX ${result.results.index}`,
    );
  } catch (error) {
    console.error('[VENTO CONTRACTS] PROCESS_STATES FAIL');
    console.error(
      error instanceof Error ? error.message : String(error),
    );
    process.exitCode = 1;
  }
}