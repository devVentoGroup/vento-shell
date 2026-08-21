import fs from 'node:fs';
import path from 'node:path';
import { fileURLToPath } from 'node:url';

import { readPlanSection } from '../../../../scripts/docs/read-plan-section.mjs';

const currentFile = fileURLToPath(import.meta.url);
const scriptDirectory = path.dirname(currentFile);
const actionsRoot = path.resolve(scriptDirectory, '..');
const contractsRoot = path.resolve(actionsRoot, '..');
const repositoryRoot = path.resolve(actionsRoot, '../../..');

const screenLogicalPath =
  'docs/plan-canonico/modular/bloques/E2_PROCESOS_Y_EXPERIENCIA/05_CONTRATO_DE_PANTALLAS.md';
const shellContractSourcePath = path.join(
  repositoryRoot,
  'docs',
  'plan-canonico',
  'modular',
  'bloques',
  'H_FUNDACION_COMPARTIDA',
  '03_CONTRATOS_COMPARTIDOS.md',
);
const screenContractPath = path.join(
  contractsRoot,
  'screens',
  'generated',
  'screen-id.contract.ts',
);
const generatedDirectory = path.join(actionsRoot, 'generated');
const contractPath = path.join(
  generatedDirectory,
  'functional-action.contract.ts',
);
const indexPath = path.join(generatedDirectory, 'index.ts');

const sourceContractSha256 =
  '3ed778211435d455cea9e10b4a3d1be9c1fedbfd32b1e0a759bc8554958f3c02';

const primaryRegisterId = 'SCREEN-PRIMARY-ACTION-REGISTER-001';
const secondaryRegisterId = 'SCREEN-SECONDARY-ACTION-REGISTER-001';
const expectedScreenCount = 177;
const expectedPrimaryCount = 177;
const expectedSecondaryCount = 708;
const expectedTotalCount = 885;
const actionsPerScreen = 5;
const functionalActionIdPatternSource =
  '^VSCREEN-[0-9]{4,}::(?:PRIMARY|SECONDARY:[0-9]{2})$';

const expectedPrimaryFamilyCounts = Object.freeze({
  ENTER_WORKSPACE: 2,
  AUTHENTICATE_OR_RECOVER: 2,
  RESOLVE_ACCESS_CONTEXT: 1,
  ACTIVATE_ACTOR_SESSION: 1,
  OPEN_PRIORITY_ITEM: 9,
  MONITOR_AND_INTERVENE: 8,
  MAINTAIN_MASTER_DATA: 11,
  PUBLISH_POLICY_OR_VERSION: 9,
  CREATE_OR_UPDATE_CASE: 33,
  REVIEW_OR_RECOMMEND: 2,
  DECIDE_OR_APPROVE: 16,
  CAPTURE_FACT: 8,
  EXECUTE_OPERATION: 22,
  CONFIRM_HANDOFF: 10,
  RECONCILE: 6,
  INVESTIGATE: 2,
  GENERATE_OFFICIAL_OUTPUT: 1,
  SELF_SERVICE: 16,
  CUSTOMER_BROWSE_OR_SELECT: 2,
  CUSTOMER_TRANSACTION: 9,
  COMMUNICATE: 3,
  IDENTIFY_OR_PRESENT: 4,
});

const expectedPrimaryEffectCounts = Object.freeze({
  NAVIGATION_ONLY: 18,
  READ_ONLY: 14,
  SESSION_MUTATION: 4,
  DRAFT_MUTATION: 5,
  DOMAIN_MUTATION: 72,
  DECISION_MUTATION: 22,
  CONFIGURATION_MUTATION: 15,
  FINANCIAL_MUTATION: 20,
  EXTERNAL_SIDE_EFFECT: 3,
  COMMUNICATION_MUTATION: 3,
  EVIDENCE_OUTPUT: 1,
});

const expectedSecondaryApplicationCounts = Object.freeze({
  shell: 28,
  viso: 124,
  anima: 56,
  nexo: 148,
  fogo: 60,
  origo: 56,
  pulso: 80,
  numera: 80,
  pass: 76,
});

function fail(message) {
  throw new Error(message);
}

function normalizeEol(value) {
  return value.replace(/\r\n?/g, '\n');
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

function extractSubsection(source, startPattern, endPattern, label) {
  const startMatch = source.match(startPattern);
  if (!startMatch || startMatch.index === undefined) {
    fail(`Canonical subsection ${label} not found.`);
  }
  const start = startMatch.index;
  const tailStart = start + startMatch[0].length;
  const tail = source.slice(tailStart);
  const endMatch = tail.match(endPattern);
  if (!endMatch || endMatch.index === undefined) {
    fail(`Canonical subsection ${label} has no resolvable end.`);
  }
  return source.slice(start, tailStart + endMatch.index);
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

function splitMarkdownRow(line) {
  const trimmed = line.trim();
  if (!trimmed.startsWith('|') || !trimmed.endsWith('|')) return [];

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

function expectedScreenIds() {
  return Array.from(
    { length: expectedScreenCount },
    (_, index) => `VSCREEN-${String(index + 1).padStart(4, '0')}`,
  );
}

function expectedFunctionalActionIds() {
  return expectedScreenIds().flatMap((screenId) => [
    `${screenId}::PRIMARY`,
    `${screenId}::SECONDARY:01`,
    `${screenId}::SECONDARY:02`,
    `${screenId}::SECONDARY:03`,
    `${screenId}::SECONDARY:04`,
  ]);
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
      `${label} mismatch. actual=${JSON.stringify(actual)} `
      + `expected=${JSON.stringify(expected)}`,
    );
  }
}

function countBy(values, selector) {
  const counts = {};
  for (const value of values) {
    const key = selector(value);
    counts[key] = (counts[key] ?? 0) + 1;
  }
  return counts;
}

function extractScreenIdsFromPhysicalContract() {
  const source = readText(
    screenContractPath,
    'predecessor ScreenId contract',
  );
  const match = source.match(
    /export const SCREEN_IDS = \[([\s\S]*?)\] as const;/,
  );
  if (!match) {
    fail('Predecessor ScreenId contract does not expose SCREEN_IDS.');
  }

  const ids = [
    ...match[1].matchAll(/"(VSCREEN-[0-9]{4,})"/g),
  ].map((entry) => entry[1]);

  assertExactSequence(
    ids,
    expectedScreenIds(),
    'predecessor SCREEN_IDS',
  );
  return ids;
}

function parsePrimaryRegister(procScreen014Section) {
  const register = extractSubsection(
    procScreen014Section,
    /^#### 9\. SCREEN-PRIMARY-ACTION-REGISTER-001$/m,
    /^#### 10\./m,
    primaryRegisterId,
  );
  const rows = [];

  for (const line of register.split('\n')) {
    const cells = splitMarkdownRow(line);
    if (
      cells.length !== 12
      || !/^VSCREEN-[0-9]{4,}$/.test(cells[0] ?? '')
    ) {
      continue;
    }
    rows.push({
      screen_id: cells[0],
      working_name: cells[1],
      application_id: cells[2],
      primary_class: cells[3],
      functional_action_id: cells[6],
      human_label: cells[7],
      family: cells[8],
      effect: cells[9],
      confirmation_boundary: cells[10],
      mandatory_boundary: cells[11],
    });
  }

  assertExactSequence(
    rows.map((row) => row.screen_id),
    expectedScreenIds(),
    primaryRegisterId,
  );
  assertExactSequence(
    rows.map((row) => row.functional_action_id),
    expectedScreenIds().map((screenId) => `${screenId}::PRIMARY`),
    `${primaryRegisterId} identities`,
  );

  if (new Set(rows.map((row) => row.functional_action_id)).size !== expectedPrimaryCount) {
    fail(`${primaryRegisterId} contains duplicate primary identities.`);
  }

  for (const row of rows) {
    if (
      !row.working_name
      || !row.application_id
      || !row.primary_class
      || !row.human_label
      || !row.family
      || !row.effect
      || !row.confirmation_boundary
      || !row.mandatory_boundary
    ) {
      fail(`${row.screen_id} has an incomplete primary action row.`);
    }
  }

  assertExactObject(
    countBy(rows, (row) => row.family),
    expectedPrimaryFamilyCounts,
    'Primary action family distribution',
  );
  assertExactObject(
    countBy(rows, (row) => row.effect),
    expectedPrimaryEffectCounts,
    'Primary action effect distribution',
  );
  return rows;
}

function parseSecondaryRegister(procScreen015Section, primaryByScreen) {
  const register = extractSubsection(
    procScreen015Section,
    /^#### 12\. SCREEN-SECONDARY-ACTION-REGISTER-001$/m,
    /^#### 13\./m,
    secondaryRegisterId,
  );
  const rows = [];

  for (const line of register.split('\n')) {
    const cells = splitMarkdownRow(line);
    if (
      cells.length !== 13
      || !/^VSCREEN-[0-9]{4,}::SECONDARY:[0-9]{2}$/.test(cells[0] ?? '')
    ) {
      continue;
    }
    rows.push({
      functional_action_id: cells[0],
      screen_id: cells[1],
      working_name: cells[2],
      primary_action_id: cells[3],
      ordinal: Number(cells[4]),
      human_label: cells[5],
      secondary_class: cells[6],
      relationship: cells[7],
      effect: cells[8],
      availability: cells[9],
      location: cells[10],
      confirmation: cells[11],
      mandatory_boundary: cells[12],
    });
  }

  const expectedIds = expectedScreenIds().flatMap((screenId) =>
    [1, 2, 3, 4].map(
      (ordinal) =>
        `${screenId}::SECONDARY:${String(ordinal).padStart(2, '0')}`,
    ),
  );

  assertExactSequence(
    rows.map((row) => row.functional_action_id),
    expectedIds,
    `${secondaryRegisterId} identities`,
  );

  if (rows.length !== expectedSecondaryCount) {
    fail(
      `${secondaryRegisterId} must contain ${expectedSecondaryCount}; `
      + `received ${rows.length}.`,
    );
  }
  if (new Set(rows.map((row) => row.functional_action_id)).size !== expectedSecondaryCount) {
    fail(`${secondaryRegisterId} contains duplicate secondary identities.`);
  }

  const perScreen = new Map();

  for (const row of rows) {
    const primary = primaryByScreen.get(row.screen_id);
    if (!primary) {
      fail(`${row.functional_action_id} references unknown ScreenId ${row.screen_id}.`);
    }
    if (row.working_name !== primary.working_name) {
      fail(`${row.functional_action_id} changes the canonical screen name.`);
    }
    if (row.primary_action_id !== primary.functional_action_id) {
      fail(`${row.functional_action_id} references the wrong primary action.`);
    }
    if (![1, 2, 3, 4].includes(row.ordinal)) {
      fail(`${row.functional_action_id} uses non-current ordinal ${row.ordinal}.`);
    }
    if (
      !row.human_label
      || !row.secondary_class
      || !row.relationship
      || !row.effect
      || !row.availability
      || !row.location
      || !row.confirmation
      || !row.mandatory_boundary
    ) {
      fail(`${row.functional_action_id} has an incomplete secondary action row.`);
    }

    const ordinals = perScreen.get(row.screen_id) ?? [];
    ordinals.push(row.ordinal);
    perScreen.set(row.screen_id, ordinals);
  }

  for (const screenId of expectedScreenIds()) {
    assertExactSequence(
      perScreen.get(screenId) ?? [],
      [1, 2, 3, 4],
      `${screenId} current secondary ordinals`,
    );
  }

  const secondaryApplicationCounts = {};
  for (const row of rows) {
    const app = primaryByScreen.get(row.screen_id).application_id;
    secondaryApplicationCounts[app] =
      (secondaryApplicationCounts[app] ?? 0) + 1;
  }

  assertExactObject(
    secondaryApplicationCounts,
    expectedSecondaryApplicationCounts,
    'Secondary action application distribution',
  );
  return rows;
}

function parseCentralizationMatrix(shellCon012Section) {
  const matrix = extractSubsection(
    shellCon012Section,
    /^#### 11\. Matriz completa de identidades$/m,
    /^#### 12\./m,
    'SHELL-CON-012 identity matrix',
  );
  const rows = [];

  for (const line of matrix.split('\n')) {
    const cells = splitMarkdownRow(line);
    if (
      cells.length !== 10
      || !/^VSCREEN-[0-9]{4,}$/.test(cells[0] ?? '')
    ) {
      continue;
    }
    rows.push({
      screen_id: cells[0],
      primary_action_id: cells[1],
      secondary_01: cells[2],
      secondary_02: cells[3],
      secondary_03: cells[4],
      secondary_04: cells[5],
      total: Number(cells[6]),
      decision: cells[7],
      status: cells[8],
      block: cells[9],
    });
  }

  assertExactSequence(
    rows.map((row) => row.screen_id),
    expectedScreenIds(),
    'SHELL-CON-012 identity matrix',
  );

  for (const row of rows) {
    assertExactSequence(
      [
        row.primary_action_id,
        row.secondary_01,
        row.secondary_02,
        row.secondary_03,
        row.secondary_04,
      ],
      [
        `${row.screen_id}::PRIMARY`,
        `${row.screen_id}::SECONDARY:01`,
        `${row.screen_id}::SECONDARY:02`,
        `${row.screen_id}::SECONDARY:03`,
        `${row.screen_id}::SECONDARY:04`,
      ],
      `${row.screen_id} SHELL-CON-012 action set`,
    );
    if (row.total !== actionsPerScreen) {
      fail(`${row.screen_id} must declare exactly ${actionsPerScreen} actions.`);
    }
    if (row.decision !== 'CENTRALIZAR_SIN_RENUMERAR') {
      fail(`${row.screen_id} changes the approved centralization decision.`);
    }
    if (row.status !== 'ESPECIFICADO') {
      fail(`${row.screen_id} changes the approved action status.`);
    }
    if (row.block !== 'NO_APLICA') {
      fail(`${row.screen_id} changes the approved action block status.`);
    }
  }
  return rows;
}

function assertIncludes(source, expected, label) {
  if (!source.includes(expected)) {
    fail(`${label} is missing canonical marker: ${expected}`);
  }
}

function loadCanonicalContract() {
  const screenSource = readPlanSection(repositoryRoot, screenLogicalPath);
  const shellSource = readText(shellContractSourcePath, 'SHELL-CON source');

  const procScreen014Section = extractTaskSection(
    screenSource,
    'PROC-SCREEN-014',
  );
  const procScreen015Section = extractTaskSection(
    screenSource,
    'PROC-SCREEN-015',
  );
  const shellCon012Section = extractTaskSection(
    shellSource,
    'SHELL-CON-012',
  );

  for (const marker of [
    '@vento/contracts/actions',
    'FunctionalActionId',
    functionalActionIdPatternSource,
    '885/885 identidades funcionales existentes',
    '177 acciones principales',
    '708 acciones secundarias',
    'CENTRALIZAR_SIN_RENUMERAR',
    'ESPECIFICADO',
    'NO_APLICA',
    'SHELL-CON-013',
  ]) {
    assertIncludes(shellCon012Section, marker, 'SHELL-CON-012');
  }

  const physicalScreenIds = extractScreenIdsFromPhysicalContract();
  const primaryRows = parsePrimaryRegister(procScreen014Section);
  const primaryByScreen = new Map(
    primaryRows.map((row) => [row.screen_id, row]),
  );
  const secondaryRows = parseSecondaryRegister(
    procScreen015Section,
    primaryByScreen,
  );
  const centralizationRows = parseCentralizationMatrix(
    shellCon012Section,
  );

  assertExactSequence(
    primaryRows.map((row) => row.screen_id),
    physicalScreenIds,
    'primary actions vs predecessor ScreenId contract',
  );
  assertExactSequence(
    centralizationRows.map((row) => row.screen_id),
    physicalScreenIds,
    'SHELL-CON-012 matrix vs predecessor ScreenId contract',
  );

  const secondaryById = new Map(
    secondaryRows.map((row) => [row.functional_action_id, row]),
  );
  const actions = [];

  for (const screenId of physicalScreenIds) {
    const primary = primaryByScreen.get(screenId);

    actions.push({
      functional_action_id: primary.functional_action_id,
      screen_id: screenId,
      kind: 'PRIMARY',
      source: 'PROC-SCREEN-014',
      secondary_ordinal: null,
    });

    for (let ordinal = 1; ordinal <= 4; ordinal += 1) {
      const functionalActionId =
        `${screenId}::SECONDARY:${String(ordinal).padStart(2, '0')}`;
      const secondary = secondaryById.get(functionalActionId);
      if (!secondary) {
        fail(`Missing canonical secondary action ${functionalActionId}.`);
      }
      actions.push({
        functional_action_id: secondary.functional_action_id,
        screen_id: screenId,
        kind: 'SECONDARY',
        source: 'PROC-SCREEN-015',
        secondary_ordinal: ordinal,
      });
    }
  }

  assertExactSequence(
    actions.map((action) => action.functional_action_id),
    expectedFunctionalActionIds(),
    'FunctionalActionId projection',
  );

  if (actions.length !== expectedTotalCount) {
    fail(
      `FunctionalActionId projection must contain ${expectedTotalCount}; `
      + `received ${actions.length}.`,
    );
  }
  if (new Set(actions.map((action) => action.functional_action_id)).size !== expectedTotalCount) {
    fail('FunctionalActionId projection contains duplicate identities.');
  }

  return {
    screenIds: physicalScreenIds,
    actions,
    primaryActionIds: primaryRows.map(
      (row) => row.functional_action_id,
    ),
    secondaryActionIds: secondaryRows.map(
      (row) => row.functional_action_id,
    ),
  };
}

function renderHeader() {
  return `// GENERATED FILE. DO NOT EDIT.
// Primary register: ${primaryRegisterId}
// Secondary register: ${secondaryRegisterId}
// Screen identity dependency: SHELL-CON-011
// Contract task: SHELL-CON-012
// Source contract SHA256: ${sourceContractSha256}

`;
}

function renderContract(contract) {
  const actionIdRows = contract.actions
    .map((action) => `  ${JSON.stringify(action.functional_action_id)},`)
    .join('\n');
  const primaryRows = contract.primaryActionIds
    .map((actionId) => `  ${JSON.stringify(actionId)},`)
    .join('\n');
  const secondaryRows = contract.secondaryActionIds
    .map((actionId) => `  ${JSON.stringify(actionId)},`)
    .join('\n');
  const definitionRows = contract.actions
    .map((action) => {
      const ordinal = action.secondary_ordinal === null
        ? 'null'
        : String(action.secondary_ordinal);
      return [
        '  {',
        `    functional_action_id: ${JSON.stringify(action.functional_action_id)},`,
        `    screen_id: ${JSON.stringify(action.screen_id)},`,
        `    kind: ${JSON.stringify(action.kind)},`,
        `    source: ${JSON.stringify(action.source)},`,
        `    secondary_ordinal: ${ordinal},`,
        '  },',
      ].join('\n');
    })
    .join('\n');

  return `${renderHeader()}import type {
  ScreenId,
} from "../../screens/generated/screen-id.contract.js";

export const FUNCTIONAL_ACTION_ID_PATTERN_SOURCE =
  ${JSON.stringify(functionalActionIdPatternSource)} as const;

export const FUNCTIONAL_ACTION_ID_PATTERN =
  /^VSCREEN-[0-9]{4,}::(?:PRIMARY|SECONDARY:[0-9]{2})$/;

export const FUNCTIONAL_ACTION_KINDS = [
  "PRIMARY",
  "SECONDARY",
] as const;

export type FunctionalActionKind =
  (typeof FUNCTIONAL_ACTION_KINDS)[number];

export const FUNCTIONAL_ACTION_SOURCES = [
  "PROC-SCREEN-014",
  "PROC-SCREEN-015",
] as const;

export type FunctionalActionSource =
  (typeof FUNCTIONAL_ACTION_SOURCES)[number];

export const SECONDARY_FUNCTIONAL_ACTION_ORDINALS = [
  1,
  2,
  3,
  4,
] as const;

export type SecondaryFunctionalActionOrdinal =
  (typeof SECONDARY_FUNCTIONAL_ACTION_ORDINALS)[number];

export const FUNCTIONAL_ACTION_IDS = [
${actionIdRows}
] as const;

export type FunctionalActionId =
  (typeof FUNCTIONAL_ACTION_IDS)[number];

export const PRIMARY_FUNCTIONAL_ACTION_IDS = [
${primaryRows}
] as const;

export type PrimaryFunctionalActionId =
  (typeof PRIMARY_FUNCTIONAL_ACTION_IDS)[number];

export const SECONDARY_FUNCTIONAL_ACTION_IDS = [
${secondaryRows}
] as const;

export type SecondaryFunctionalActionId =
  (typeof SECONDARY_FUNCTIONAL_ACTION_IDS)[number];

export type FunctionalActionDefinition = Readonly<{
  functional_action_id: FunctionalActionId;
  screen_id: ScreenId;
  kind: FunctionalActionKind;
  source: FunctionalActionSource;
  secondary_ordinal: SecondaryFunctionalActionOrdinal | null;
}>;

export const FUNCTIONAL_ACTION_DEFINITIONS = [
${definitionRows}
] as const satisfies readonly FunctionalActionDefinition[];

export const FUNCTIONAL_ACTION_REGISTRY_METADATA = {
  primary_register_id: ${JSON.stringify(primaryRegisterId)},
  secondary_register_id: ${JSON.stringify(secondaryRegisterId)},
  registry_status: "ESPECIFICADO",
  centralization_decision: "CENTRALIZAR_SIN_RENUMERAR",
  block_status: "NO_APLICA",
  screen_count: 177,
  action_count: 885,
  primary_action_count: 177,
  secondary_action_count: 708,
  actions_per_screen: 5,
  current_secondary_ordinals: [1, 2, 3, 4],
  format_pattern: ${JSON.stringify(functionalActionIdPatternSource)},
  screen_contract_task_id: "SHELL-CON-011",
  primary_source_task_id: "PROC-SCREEN-014",
  secondary_source_task_id: "PROC-SCREEN-015",
  contract_task_id: "SHELL-CON-012",
} as const;

export type FunctionalActionRegistryMetadata =
  typeof FUNCTIONAL_ACTION_REGISTRY_METADATA;

const FUNCTIONAL_ACTION_ID_SET =
  new Set<string>(FUNCTIONAL_ACTION_IDS);

const FUNCTIONAL_ACTION_DEFINITION_BY_ID =
  new Map<FunctionalActionId, FunctionalActionDefinition>(
    FUNCTIONAL_ACTION_DEFINITIONS.map((definition) => [
      definition.functional_action_id,
      definition,
    ] as const),
  );

export function isFunctionalActionIdFormat(
  value: unknown,
): value is string {
  return (
    typeof value === "string"
    && FUNCTIONAL_ACTION_ID_PATTERN.test(value)
  );
}

export function isFunctionalActionId(
  value: unknown,
): value is FunctionalActionId {
  return (
    isFunctionalActionIdFormat(value)
    && FUNCTIONAL_ACTION_ID_SET.has(value)
  );
}

export function assertFunctionalActionId(
  value: unknown,
): asserts value is FunctionalActionId {
  if (!isFunctionalActionId(value)) {
    throw new TypeError("Unknown FunctionalActionId.");
  }
}

function requireFunctionalActionDefinition(
  functionalActionId: FunctionalActionId,
): FunctionalActionDefinition {
  const definition =
    FUNCTIONAL_ACTION_DEFINITION_BY_ID.get(functionalActionId);

  if (!definition) {
    throw new TypeError("FunctionalActionId has no definition.");
  }

  return definition;
}

export function resolveFunctionalActionScreenId(
  functionalActionId: FunctionalActionId,
): ScreenId {
  return requireFunctionalActionDefinition(
    functionalActionId,
  ).screen_id;
}

export function resolveFunctionalActionKind(
  functionalActionId: FunctionalActionId,
): FunctionalActionKind {
  return requireFunctionalActionDefinition(
    functionalActionId,
  ).kind;
}

export function resolveFunctionalActionSource(
  functionalActionId: FunctionalActionId,
): FunctionalActionSource {
  return requireFunctionalActionDefinition(
    functionalActionId,
  ).source;
}

export function resolveFunctionalActionSecondaryOrdinal(
  functionalActionId: FunctionalActionId,
): SecondaryFunctionalActionOrdinal | null {
  return requireFunctionalActionDefinition(
    functionalActionId,
  ).secondary_ordinal;
}
`;
}

function renderIndex() {
  return `${renderHeader()}export {
  FUNCTIONAL_ACTION_ID_PATTERN_SOURCE,
  FUNCTIONAL_ACTION_ID_PATTERN,
  FUNCTIONAL_ACTION_KINDS,
  FUNCTIONAL_ACTION_SOURCES,
  SECONDARY_FUNCTIONAL_ACTION_ORDINALS,
  FUNCTIONAL_ACTION_IDS,
  PRIMARY_FUNCTIONAL_ACTION_IDS,
  SECONDARY_FUNCTIONAL_ACTION_IDS,
  FUNCTIONAL_ACTION_DEFINITIONS,
  FUNCTIONAL_ACTION_REGISTRY_METADATA,
  isFunctionalActionIdFormat,
  isFunctionalActionId,
  assertFunctionalActionId,
  resolveFunctionalActionScreenId,
  resolveFunctionalActionKind,
  resolveFunctionalActionSource,
  resolveFunctionalActionSecondaryOrdinal,
} from "./functional-action.contract.js";

export type {
  FunctionalActionKind,
  FunctionalActionSource,
  SecondaryFunctionalActionOrdinal,
  FunctionalActionId,
  PrimaryFunctionalActionId,
  SecondaryFunctionalActionId,
  FunctionalActionDefinition,
  FunctionalActionRegistryMetadata,
} from "./functional-action.contract.js";
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

export function generateFunctionalActionContracts({
  checkOnly = false,
} = {}) {
  const contract = loadCanonicalContract();

  return {
    screenIds: contract.screenIds,
    actions: contract.actions,
    primaryActionIds: contract.primaryActionIds,
    secondaryActionIds: contract.secondaryActionIds,
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
    const result = generateFunctionalActionContracts({
      checkOnly,
    });

    console.log(
      `[VENTO CONTRACTS] FUNCTIONAL_ACTIONS ${checkOnly ? 'CHECK' : 'GENERATE'} PASS`,
    );
    console.log(`[VENTO CONTRACTS] ACTIONS ${result.actions.length}`);
    console.log(`[VENTO CONTRACTS] PRIMARY ${result.primaryActionIds.length}`);
    console.log(`[VENTO CONTRACTS] SECONDARY ${result.secondaryActionIds.length}`);
    console.log(`[VENTO CONTRACTS] SCREENS ${result.screenIds.length}`);
    console.log('[VENTO CONTRACTS] SECONDARY_ORDINALS 01..04');
    console.log('[VENTO CONTRACTS] MEMBERSHIP SYNTAX_AND_SET');
    console.log(`[VENTO CONTRACTS] CONTRACT ${result.results.contract}`);
    console.log(`[VENTO CONTRACTS] INDEX ${result.results.index}`);
  } catch (error) {
    console.error('[VENTO CONTRACTS] FUNCTIONAL_ACTIONS FAIL');
    console.error(
      error instanceof Error ? error.message : String(error),
    );
    process.exitCode = 1;
  }
}