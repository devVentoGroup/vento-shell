import fs from 'node:fs';
import path from 'node:path';
import { fileURLToPath } from 'node:url';

const currentFile = fileURLToPath(import.meta.url);
const scriptDirectory = path.dirname(currentFile);
const handoffsRoot = path.resolve(scriptDirectory, '..');
const contractsRoot = path.resolve(handoffsRoot, '..');
const repositoryRoot = path.resolve(handoffsRoot, '../../..');

const procCatSourcePath = path.join(
  repositoryRoot,
  'docs',
  'plan-canonico',
  'modular',
  'bloques',
  'E2_PROCESOS_Y_EXPERIENCIA',
  '01_02_PROPOSITO_PROPIEDAD_CONSUMIDORES_Y_ACTORES.md',
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

const applicationsPath = path.join(
  contractsRoot,
  'authorization',
  'catalog',
  'versions',
  '1.0.0',
  'applications.json',
);

const processContractPath = path.join(
  contractsRoot,
  'processes',
  'generated',
  'process-id.contract.ts',
);

const generatedDirectory = path.join(handoffsRoot, 'generated');
const contractPath = path.join(
  generatedDirectory,
  'application-handoff-relation.contract.ts',
);
const indexPath = path.join(generatedDirectory, 'index.ts');

const sourceContractSha256 =
  '5cb5fba2d7a08733387c335cc23fcd245d96befbb2852b1809d358047846f62d';

const expectedApplicationCodes = Object.freeze([
  'shell',
  'anima',
  'viso',
  'nexo',
  'fogo',
  'origo',
  'pulso',
  'numera',
  'aura',
  'pass',
]);

const expectedHandoffProcessIds = Object.freeze([
  'VPROC-0005',
  'VPROC-0006',
  'VPROC-0007',
  'VPROC-0009',
  'VPROC-0011',
  'VPROC-0059',
  'VPROC-0065',
  'VPROC-0066',
]);

const expectedParticipantCodes = Object.freeze([
  'shell',
  'anima',
  'nexo',
  'fogo',
  'origo',
  'pulso',
  'numera',
  'aura',
  'pass',
]);

const expectedPerProcess = Object.freeze({
  'VPROC-0005': { direct: 0, conditional: 2, total: 2 },
  'VPROC-0006': { direct: 2, conditional: 6, total: 8 },
  'VPROC-0007': { direct: 2, conditional: 5, total: 7 },
  'VPROC-0009': { direct: 2, conditional: 5, total: 7 },
  'VPROC-0011': { direct: 8, conditional: 0, total: 8 },
  'VPROC-0059': { direct: 9, conditional: 0, total: 9 },
  'VPROC-0065': { direct: 2, conditional: 0, total: 2 },
  'VPROC-0066': { direct: 2, conditional: 4, total: 6 },
});

const expectedPerParticipant = Object.freeze({
  shell: { direct: 5, conditional: 1, total: 6 },
  anima: { direct: 7, conditional: 1, total: 8 },
  nexo: { direct: 3, conditional: 3, total: 6 },
  fogo: { direct: 2, conditional: 4, total: 6 },
  origo: { direct: 2, conditional: 4, total: 6 },
  pulso: { direct: 2, conditional: 4, total: 6 },
  numera: { direct: 3, conditional: 4, total: 7 },
  aura: { direct: 2, conditional: 1, total: 3 },
  pass: { direct: 1, conditional: 0, total: 1 },
});

const expectedProcessCount = 69;
const expectedHandoffProcessCount = 8;
const expectedRelationCount = 49;
const expectedDirectCount = 27;
const expectedConditionalCount = 22;
const expectedOwnerApplication = 'viso';
const expectedOwnerApplicationCount = 1;
const expectedParticipantApplicationCount = 9;
const expectedConsumerMode = 'SOLICITUD_HANDOFF_Y_EVENTO';
const expectedIntegrationProfile = 'HANDOFF_PROJECTION';
const expectedExchangeFamily = 'HANDOFF_REQUEST';

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

function parseApplications() {
  if (!fs.existsSync(applicationsPath)) {
    fail(
      `Missing physical AppCode catalog: `
      + `${path.relative(process.cwd(), applicationsPath)}`,
    );
  }

  let applications;

  try {
    applications = JSON.parse(fs.readFileSync(applicationsPath, 'utf8'));
  } catch (error) {
    fail(
      `Invalid applications.json: `
      + `${error instanceof Error ? error.message : String(error)}`,
    );
  }

  if (!Array.isArray(applications)) {
    fail('applications.json must be an array.');
  }

  const appCodes = applications.map((entry) => entry?.app_code);

  assertExactSequence(
    appCodes,
    expectedApplicationCodes,
    'physical AppCode catalog',
  );

  return new Set(appCodes);
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

  if (ids.length !== expectedProcessCount) {
    fail(
      `Predecessor ProcessId contract must contain `
      + `${expectedProcessCount}; received ${ids.length}.`,
    );
  }

  return new Set(ids);
}

function parseAppList(value, appCodes, label) {
  const normalized = cleanCell(value);

  if (
    normalized === ''
    || normalized === '—'
    || normalized === '-'
  ) {
    return [];
  }

  const values = normalized
    .split(',')
    .map((entry) => entry.trim())
    .filter(Boolean);

  for (const appCode of values) {
    if (!appCodes.has(appCode)) {
      fail(`${label} references unknown AppCode ${appCode}.`);
    }
  }

  if (new Set(values).size !== values.length) {
    fail(`${label} contains duplicate AppCode values.`);
  }

  return values;
}

function relationKey(relation) {
  return JSON.stringify([
    relation.process_id,
    relation.owner_application,
    relation.participant_application,
  ]);
}

function countRelations(relations, selector, participationClass) {
  return relations.filter(
    (relation) =>
      selector(relation)
      && relation.participation_class === participationClass,
  ).length;
}

function validateDistributions(relations) {
  for (const [processId, expected] of Object.entries(expectedPerProcess)) {
    const direct = countRelations(
      relations,
      (relation) => relation.process_id === processId,
      'DIRECTA',
    );
    const conditional = countRelations(
      relations,
      (relation) => relation.process_id === processId,
      'CONDICIONAL',
    );
    const total = direct + conditional;

    if (
      direct !== expected.direct
      || conditional !== expected.conditional
      || total !== expected.total
    ) {
      fail(
        `${processId} distribution mismatch: `
        + `expected ${expected.direct}/${expected.conditional}/${expected.total}, `
        + `received ${direct}/${conditional}/${total}.`,
      );
    }
  }

  for (
    const [participantApplication, expected]
    of Object.entries(expectedPerParticipant)
  ) {
    const direct = countRelations(
      relations,
      (relation) =>
        relation.participant_application === participantApplication,
      'DIRECTA',
    );
    const conditional = countRelations(
      relations,
      (relation) =>
        relation.participant_application === participantApplication,
      'CONDICIONAL',
    );
    const total = direct + conditional;

    if (
      direct !== expected.direct
      || conditional !== expected.conditional
      || total !== expected.total
    ) {
      fail(
        `${participantApplication} distribution mismatch: `
        + `expected ${expected.direct}/${expected.conditional}/${expected.total}, `
        + `received ${direct}/${conditional}/${total}.`,
      );
    }
  }
}

function validateRelationUniverse(relations, processIds, appCodes, label) {
  if (relations.length !== expectedRelationCount) {
    fail(
      `${label} must contain ${expectedRelationCount} relations; `
      + `received ${relations.length}.`,
    );
  }

  const keys = relations.map(relationKey);

  if (new Set(keys).size !== expectedRelationCount) {
    fail(`${label} contains duplicate relation tuples.`);
  }

  const directCount = relations.filter(
    (relation) => relation.participation_class === 'DIRECTA',
  ).length;
  const conditionalCount = relations.filter(
    (relation) => relation.participation_class === 'CONDICIONAL',
  ).length;

  if (directCount !== expectedDirectCount) {
    fail(
      `${label} must contain ${expectedDirectCount} DIRECTA relations; `
      + `received ${directCount}.`,
    );
  }

  if (conditionalCount !== expectedConditionalCount) {
    fail(
      `${label} must contain ${expectedConditionalCount} CONDICIONAL relations; `
      + `received ${conditionalCount}.`,
    );
  }

  assertExactSet(
    relations.map((relation) => relation.process_id),
    expectedHandoffProcessIds,
    `${label} handoff ProcessId set`,
  );

  assertExactSet(
    relations.map((relation) => relation.participant_application),
    expectedParticipantCodes,
    `${label} participant AppCode set`,
  );

  assertExactSet(
    relations.map((relation) => relation.owner_application),
    [expectedOwnerApplication],
    `${label} owner AppCode set`,
  );

  for (const relation of relations) {
    if (!processIds.has(relation.process_id)) {
      fail(`${label} references unknown ProcessId ${relation.process_id}.`);
    }

    if (!appCodes.has(relation.owner_application)) {
      fail(
        `${label} references unknown owner AppCode `
        + `${relation.owner_application}.`,
      );
    }

    if (!appCodes.has(relation.participant_application)) {
      fail(
        `${label} references unknown participant AppCode `
        + `${relation.participant_application}.`,
      );
    }

    if (relation.owner_application === relation.participant_application) {
      fail(`${label} contains owner=participant for ${relationKey(relation)}.`);
    }
  }

  validateDistributions(relations);
}

function parseProcCat006(source, appCodes, processIds) {
  const task = extractTaskSection(source, 'PROC-CAT-006');
  const processRows = [];

  for (const line of task.split('\n')) {
    const cells = splitMarkdownRow(line);

    if (
      cells.length === 6
      && /^VPROC-[0-9]{4}$/.test(cells[0] ?? '')
      && appCodes.has(cells[1] ?? '')
      && /^[A-ZÑ_]+$/.test(cells[4] ?? '')
    ) {
      processRows.push({
        process_id: cells[0],
        owner_application: cells[1],
        direct_applications: parseAppList(
          cells[2],
          appCodes,
          `${cells[0]} direct consumers`,
        ),
        conditional_applications: parseAppList(
          cells[3],
          appCodes,
          `${cells[0]} conditional consumers`,
        ),
        consumer_mode: cells[4],
      });
    }
  }

  if (processRows.length !== expectedProcessCount) {
    fail(
      `PROC-CAT-006 must expose ${expectedProcessCount} process rows; `
      + `received ${processRows.length}.`,
    );
  }

  assertExactSet(
    processRows.map((row) => row.process_id),
    [...processIds],
    'PROC-CAT-006 ProcessId coverage',
  );

  const handoffRows = processRows.filter(
    (row) => row.consumer_mode === expectedConsumerMode,
  );

  assertExactSet(
    handoffRows.map((row) => row.process_id),
    expectedHandoffProcessIds,
    'PROC-CAT-006 handoff ProcessId set',
  );

  if (handoffRows.length !== expectedHandoffProcessCount) {
    fail(
      `PROC-CAT-006 must contain ${expectedHandoffProcessCount} `
      + `handoff processes; received ${handoffRows.length}.`,
    );
  }

  const relations = [];

  for (const row of handoffRows) {
    for (const participantApplication of row.direct_applications) {
      relations.push({
        process_id: row.process_id,
        owner_application: row.owner_application,
        participant_application: participantApplication,
        participation_class: 'DIRECTA',
      });
    }

    for (const participantApplication of row.conditional_applications) {
      relations.push({
        process_id: row.process_id,
        owner_application: row.owner_application,
        participant_application: participantApplication,
        participation_class: 'CONDICIONAL',
      });
    }
  }

  validateRelationUniverse(
    relations,
    processIds,
    appCodes,
    'PROC-CAT-006 handoff universe',
  );

  return {
    task,
    relations,
  };
}

function parseShellCon014(source, appCodes, processIds) {
  const task = extractTaskSection(source, 'SHELL-CON-014');
  const relations = [];

  for (const line of task.split('\n')) {
    const cells = splitMarkdownRow(line);

    if (
      cells.length === 12
      && /^[0-9]+$/.test(cells[0] ?? '')
      && /^VPROC-[0-9]{4}$/.test(cells[1] ?? '')
      && (cells[4] === 'DIRECTA' || cells[4] === 'CONDICIONAL')
    ) {
      relations.push({
        ordinal: Number(cells[0]),
        process_id: cells[1],
        owner_application: cells[2],
        participant_application: cells[3],
        participation_class: cells[4],
        consumer_mode: cells[5],
        integration_profile: cells[6],
        exchange_family: cells[7],
        decision: cells[8],
        result: cells[9],
        status: cells[10],
        block: cells[11],
      });
    }
  }

  if (relations.length !== expectedRelationCount) {
    fail(
      `SHELL-CON-014 matrix must contain ${expectedRelationCount} relations; `
      + `received ${relations.length}.`,
    );
  }

  relations.forEach((relation, index) => {
    if (relation.ordinal !== index + 1) {
      fail(
        `SHELL-CON-014 matrix ordinal mismatch at position ${index + 1}: `
        + `received ${relation.ordinal}.`,
      );
    }

    if (relation.consumer_mode !== expectedConsumerMode) {
      fail(
        `SHELL-CON-014 relation ${relation.ordinal} changes consumer mode.`,
      );
    }

    if (relation.integration_profile !== expectedIntegrationProfile) {
      fail(
        `SHELL-CON-014 relation ${relation.ordinal} changes integration profile.`,
      );
    }

    if (relation.exchange_family !== expectedExchangeFamily) {
      fail(
        `SHELL-CON-014 relation ${relation.ordinal} changes exchange family.`,
      );
    }

    if (relation.decision !== 'CENTRALIZAR_SIN_CAMBIAR_PROPIEDAD') {
      fail(
        `SHELL-CON-014 relation ${relation.ordinal} changes decision.`,
      );
    }

    if (relation.result !== 'INCLUIDA_EN_CONTRATO_LOGICO') {
      fail(
        `SHELL-CON-014 relation ${relation.ordinal} changes result.`,
      );
    }

    if (relation.status !== 'ESPECIFICADO') {
      fail(
        `SHELL-CON-014 relation ${relation.ordinal} changes status.`,
      );
    }

    if (relation.block !== 'NO_APLICA') {
      fail(
        `SHELL-CON-014 relation ${relation.ordinal} changes block.`,
      );
    }
  });

  validateRelationUniverse(
    relations,
    processIds,
    appCodes,
    'SHELL-CON-014 handoff matrix',
  );

  const requiredMarkers = [
    '@vento/contracts/handoffs',
    '(ProcessId, owner_application, participant_application)',
    'ApplicationHandoffRelation',
    'SOLICITUD_HANDOFF_Y_EVENTO',
    'HANDOFF_PROJECTION',
    'HANDOFF_REQUEST',
    '49',
    '27',
    '22',
    'SHELL-CON-015',
  ];

  for (const marker of requiredMarkers) {
    if (!task.includes(marker)) {
      fail(`SHELL-CON-014 is missing required content: ${marker}`);
    }
  }

  return {
    task,
    relations,
  };
}

function reconcileSources(procRelations, shellRelations) {
  const sourceByKey = new Map(
    procRelations.map((relation) => [relationKey(relation), relation]),
  );
  const shellByKey = new Map(
    shellRelations.map((relation) => [relationKey(relation), relation]),
  );

  if (sourceByKey.size !== shellByKey.size) {
    fail('PROC-CAT-006 and SHELL-CON-014 relation counts differ.');
  }

  for (const [key, sourceRelation] of sourceByKey) {
    const shellRelation = shellByKey.get(key);

    if (!shellRelation) {
      fail(`SHELL-CON-014 is missing canonical relation ${key}.`);
    }

    if (
      shellRelation.participation_class
      !== sourceRelation.participation_class
    ) {
      fail(`SHELL-CON-014 changes participation class for ${key}.`);
    }
  }

  for (const key of shellByKey.keys()) {
    if (!sourceByKey.has(key)) {
      fail(`SHELL-CON-014 adds non-canonical relation ${key}.`);
    }
  }
}

function renderRelation(relation) {
  return [
    '  {',
    `    process_id: "${relation.process_id}",`,
    `    owner_application: "${relation.owner_application}",`,
    `    participant_application: "${relation.participant_application}",`,
    `    participation_class: "${relation.participation_class}",`,
    `    consumer_mode: "${expectedConsumerMode}",`,
    `    integration_profile: "${expectedIntegrationProfile}",`,
    `    exchange_family: "${expectedExchangeFamily}",`,
    '  },',
  ].join('\n');
}

function renderContract(relations) {
  const renderedRelations = relations
    .map(renderRelation)
    .join('\n');

  const processIds = expectedHandoffProcessIds
    .map((value) => `  "${value}",`)
    .join('\n');

  const participantCodes = expectedParticipantCodes
    .map((value) => `  "${value}",`)
    .join('\n');

  return `// GENERATED FILE. DO NOT EDIT.
// Canonical relation source: PROC-CAT-006
// Contract task: SHELL-CON-014
// Integration sources: INT-APP-003, INT-APP-004, INT-APP-010
// Source contract SHA256: ${sourceContractSha256}

import type {
  AppCode,
} from "../../authorization/generated/versions/1.0.0/catalog.types.js";
import type {
  ProcessId,
} from "../../processes/generated/process-id.contract.js";

export const HANDOFF_PARTICIPATION_CLASSES = [
  "DIRECTA",
  "CONDICIONAL",
] as const;

export type HandoffParticipationClass =
  (typeof HANDOFF_PARTICIPATION_CLASSES)[number];

export const HANDOFF_CONSUMER_MODE =
  "${expectedConsumerMode}" as const;

export const HANDOFF_INTEGRATION_PROFILE =
  "${expectedIntegrationProfile}" as const;

export const HANDOFF_EXCHANGE_FAMILY =
  "${expectedExchangeFamily}" as const;

export interface ApplicationHandoffRelation {
  readonly process_id: ProcessId;
  readonly owner_application: AppCode;
  readonly participant_application: AppCode;
  readonly participation_class: HandoffParticipationClass;
  readonly consumer_mode: typeof HANDOFF_CONSUMER_MODE;
  readonly integration_profile: typeof HANDOFF_INTEGRATION_PROFILE;
  readonly exchange_family: typeof HANDOFF_EXCHANGE_FAMILY;
}

export const APPLICATION_HANDOFF_PROCESS_IDS = [
${processIds}
] as const satisfies readonly ProcessId[];

export type ApplicationHandoffProcessId =
  (typeof APPLICATION_HANDOFF_PROCESS_IDS)[number];

export const APPLICATION_HANDOFF_PARTICIPANT_CODES = [
${participantCodes}
] as const satisfies readonly AppCode[];

export type ApplicationHandoffParticipantCode =
  (typeof APPLICATION_HANDOFF_PARTICIPANT_CODES)[number];

export const APPLICATION_HANDOFF_RELATIONS = [
${renderedRelations}
] as const satisfies readonly ApplicationHandoffRelation[];

export type ApplicationHandoffRelationDefinition =
  (typeof APPLICATION_HANDOFF_RELATIONS)[number];

export const APPLICATION_HANDOFF_REGISTRY_METADATA = {
  relation_identity:
    "ProcessId + owner_application + participant_application",
  relation_count: ${expectedRelationCount},
  direct_count: ${expectedDirectCount},
  conditional_count: ${expectedConditionalCount},
  process_count: ${expectedHandoffProcessCount},
  owner_application_count: ${expectedOwnerApplicationCount},
  participant_application_count: ${expectedParticipantApplicationCount},
  owner_application: "${expectedOwnerApplication}",
  consumer_mode: HANDOFF_CONSUMER_MODE,
  integration_profile: HANDOFF_INTEGRATION_PROFILE,
  exchange_family: HANDOFF_EXCHANGE_FAMILY,
  source_task_id: "PROC-CAT-006",
  contract_task_id: "SHELL-CON-014",
} as const;

export type ApplicationHandoffRegistryMetadata =
  typeof APPLICATION_HANDOFF_REGISTRY_METADATA;

function handoffRelationKey(
  processId: ProcessId,
  ownerApplication: AppCode,
  participantApplication: AppCode,
): string {
  return JSON.stringify([
    processId,
    ownerApplication,
    participantApplication,
  ]);
}

const APPLICATION_HANDOFF_RELATION_BY_KEY = new Map(
  APPLICATION_HANDOFF_RELATIONS.map((relation) => [
    handoffRelationKey(
      relation.process_id,
      relation.owner_application,
      relation.participant_application,
    ),
    relation,
  ]),
);

export function isApplicationHandoffRelation(
  processId: ProcessId,
  ownerApplication: AppCode,
  participantApplication: AppCode,
): boolean {
  return APPLICATION_HANDOFF_RELATION_BY_KEY.has(
    handoffRelationKey(
      processId,
      ownerApplication,
      participantApplication,
    ),
  );
}

export function getApplicationHandoffRelation(
  processId: ProcessId,
  ownerApplication: AppCode,
  participantApplication: AppCode,
): ApplicationHandoffRelationDefinition | undefined {
  return APPLICATION_HANDOFF_RELATION_BY_KEY.get(
    handoffRelationKey(
      processId,
      ownerApplication,
      participantApplication,
    ),
  );
}

export function getApplicationHandoffRelationsForProcess(
  processId: ProcessId,
): readonly ApplicationHandoffRelationDefinition[] {
  return APPLICATION_HANDOFF_RELATIONS.filter(
    (relation) => relation.process_id === processId,
  );
}
`;
}

function renderIndex() {
  return `// GENERATED FILE. DO NOT EDIT.
// Contract task: SHELL-CON-014
// Source contract SHA256: ${sourceContractSha256}

export {
  APPLICATION_HANDOFF_PARTICIPANT_CODES,
  APPLICATION_HANDOFF_PROCESS_IDS,
  APPLICATION_HANDOFF_REGISTRY_METADATA,
  APPLICATION_HANDOFF_RELATIONS,
  HANDOFF_CONSUMER_MODE,
  HANDOFF_EXCHANGE_FAMILY,
  HANDOFF_INTEGRATION_PROFILE,
  HANDOFF_PARTICIPATION_CLASSES,
  getApplicationHandoffRelation,
  getApplicationHandoffRelationsForProcess,
  isApplicationHandoffRelation,
} from "./application-handoff-relation.contract.js";

export type {
  ApplicationHandoffParticipantCode,
  ApplicationHandoffProcessId,
  ApplicationHandoffRegistryMetadata,
  ApplicationHandoffRelation,
  ApplicationHandoffRelationDefinition,
  HandoffParticipationClass,
} from "./application-handoff-relation.contract.js";
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

export function generateHandoffContracts({ checkOnly = false } = {}) {
  const appCodes = parseApplications();
  const processIds = extractProcessIdsFromPhysicalContract();

  const procCatSource = readText(
    procCatSourcePath,
    'PROC-CAT-006 source file',
  );
  const shellContractSource = readText(
    shellContractSourcePath,
    'SHELL-CON-014 source file',
  );

  const proc = parseProcCat006(
    procCatSource,
    appCodes,
    processIds,
  );
  const shell = parseShellCon014(
    shellContractSource,
    appCodes,
    processIds,
  );

  reconcileSources(proc.relations, shell.relations);

  const contractResult = writeOrCheck(
    contractPath,
    renderContract(shell.relations),
    checkOnly,
    'application-handoff relation contract',
  );

  const indexResult = writeOrCheck(
    indexPath,
    renderIndex(),
    checkOnly,
    'handoff generated index',
  );

  return {
    relationCount: shell.relations.length,
    directCount: shell.relations.filter(
      (relation) => relation.participation_class === 'DIRECTA',
    ).length,
    conditionalCount: shell.relations.filter(
      (relation) => relation.participation_class === 'CONDICIONAL',
    ).length,
    processCount: new Set(
      shell.relations.map((relation) => relation.process_id),
    ).size,
    participantCount: new Set(
      shell.relations.map(
        (relation) => relation.participant_application,
      ),
    ).size,
    contractResult,
    indexResult,
  };
}

function runCli() {
  const checkOnly = process.argv.includes('--check');

  try {
    const result = generateHandoffContracts({ checkOnly });

    console.log(
      `[VENTO CONTRACTS] HANDOFFS ${checkOnly ? 'CHECK' : 'GENERATE'} PASS`,
    );
    console.log(
      `[VENTO CONTRACTS] RELATIONS ${result.relationCount}`,
    );
    console.log(
      `[VENTO CONTRACTS] DIRECT ${result.directCount}`,
    );
    console.log(
      `[VENTO CONTRACTS] CONDITIONAL ${result.conditionalCount}`,
    );
    console.log(
      `[VENTO CONTRACTS] PROCESSES ${result.processCount}`,
    );
    console.log(
      `[VENTO CONTRACTS] PARTICIPANTS ${result.participantCount}`,
    );
    console.log(
      `[VENTO CONTRACTS] CONTRACT ${result.contractResult}`,
    );
    console.log(
      `[VENTO CONTRACTS] INDEX ${result.indexResult}`,
    );
    console.log('');
    console.log('=== RESULTADO PARA CHATGPT ===');
    console.log('ESTADO: PASS');
    console.log(
      `OPERACION: ${checkOnly ? 'HANDOFFS_CHECK' : 'HANDOFFS_GENERATE'}`,
    );
    console.log(`RELATIONS: ${result.relationCount}`);
    console.log(`DIRECT: ${result.directCount}`);
    console.log(`CONDITIONAL: ${result.conditionalCount}`);
    console.log(`PROCESSES: ${result.processCount}`);
    console.log(`PARTICIPANTS: ${result.participantCount}`);
    console.log(`CONTRACT: ${result.contractResult}`);
    console.log(`INDEX: ${result.indexResult}`);
    console.log('=== FIN RESULTADO PARA CHATGPT ===');
  } catch (error) {
    const message =
      error instanceof Error ? error.message : String(error);

    console.error('[VENTO CONTRACTS] HANDOFFS FAIL');
    console.error(message);
    console.error('');
    console.error('=== RESULTADO PARA CHATGPT ===');
    console.error('ESTADO: FAIL');
    console.error('OPERACION: HANDOFFS');
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