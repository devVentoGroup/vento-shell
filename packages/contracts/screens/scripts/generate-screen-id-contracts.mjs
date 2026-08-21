import fs from 'node:fs';
import path from 'node:path';
import { fileURLToPath } from 'node:url';

import { readPlanSection } from '../../../../scripts/docs/read-plan-section.mjs';

const currentFile = fileURLToPath(import.meta.url);
const scriptDirectory = path.dirname(currentFile);
const screensRoot = path.resolve(scriptDirectory, '..');
const repositoryRoot = path.resolve(screensRoot, '../../..');

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

const generatedDirectory = path.join(screensRoot, 'generated');
const contractPath = path.join(generatedDirectory, 'screen-id.contract.ts');
const indexPath = path.join(generatedDirectory, 'index.ts');

const sourceContractSha256 =
  'd7f93b1a7628879958353a915f333eb184900f05f1d37db02e7ca6c5f9a84b99';

const identityContractId = 'SCREEN-IDENTITY-CONTRACT-001';
const catalogId = 'SCREEN-CANONICAL-CATALOG-001';
const expectedCount = 177;
const firstScreenId = 'VSCREEN-0001';
const lastScreenId = 'VSCREEN-0177';
const nextUnassignedScreenId = 'VSCREEN-0178';
const screenIdPatternSource = '^VSCREEN-[0-9]{4,}$';

const expectedApplicationCounts = Object.freeze({
  shell: 7,
  viso: 31,
  anima: 14,
  nexo: 37,
  fogo: 15,
  origo: 14,
  pulso: 20,
  numera: 20,
  pass: 19,
  aura: 0,
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

function expectedScreenIds() {
  return Array.from({ length: expectedCount }, (_, index) => {
    const value = String(index + 1).padStart(4, '0');
    return `VSCREEN-${value}`;
  });
}

function assertExactSequence(actual, expected, label) {
  if (actual.length !== expected.length) {
    fail(`${label} must contain ${expected.length} rows; received ${actual.length}.`);
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
      `${label} mismatch. actual=${JSON.stringify(actual)} `
      + `expected=${JSON.stringify(expected)}`,
    );
  }
}

function parseCanonicalCatalog(procScreen002Section) {
  const screens = [];

  for (const line of procScreen002Section.split('\n')) {
    const cells = splitMarkdownRow(line);

    if (
      cells.length !== 6
      || !/^VSCREEN-[0-9]{4,}$/.test(cells[0] ?? '')
    ) {
      continue;
    }

    screens.push({
      screen_id: cells[0],
      working_name: cells[1],
      primary_application_id: cells[2],
      identity_statement: cells[3],
      boundary_source: cells[4],
      lifecycle_status: cells[5],
    });
  }

  const expected = expectedScreenIds();

  assertExactSequence(
    screens.map((screen) => screen.screen_id),
    expected,
    'SCREEN-CANONICAL-CATALOG-001',
  );

  const unique = new Set(screens.map((screen) => screen.screen_id));

  if (unique.size !== expectedCount) {
    fail('SCREEN-CANONICAL-CATALOG-001 contains duplicate ScreenId values.');
  }

  if (screens.some((screen) => screen.lifecycle_status !== 'CANONICAL')) {
    fail('All current screen catalog rows must remain CANONICAL.');
  }

  const observedApplicationCounts = {
    ...countBy(screens, (screen) => screen.primary_application_id),
    aura: 0,
  };

  assertExactObject(
    observedApplicationCounts,
    expectedApplicationCounts,
    'Screen application distribution',
  );

  const specialScreens = new Map(
    screens.map((screen) => [screen.screen_id, screen]),
  );

  const screen0176 = specialScreens.get('VSCREEN-0176');
  const screen0177 = specialScreens.get('VSCREEN-0177');

  if (
    screen0176?.working_name !== 'Definición de kits y conjuntos'
    || screen0176?.primary_application_id !== 'nexo'
  ) {
    fail('VSCREEN-0176 does not preserve its canonical boundary.');
  }

  if (
    screen0177?.working_name !== 'Configuración de impresoras logísticas'
    || screen0177?.primary_application_id !== 'nexo'
  ) {
    fail('VSCREEN-0177 does not preserve its canonical boundary.');
  }

  return {
    screens,
    applicationCounts: observedApplicationCounts,
  };
}

function parseBindingScreenIds(taskSection, expectedColumns, label) {
  const ids = [];

  for (const line of taskSection.split('\n')) {
    const cells = splitMarkdownRow(line);

    if (
      cells.length !== expectedColumns
      || !/^VSCREEN-[0-9]{4,}$/.test(cells[0] ?? '')
    ) {
      continue;
    }

    ids.push(cells[0]);
  }

  assertExactSequence(ids, expectedScreenIds(), label);

  if (new Set(ids).size !== expectedCount) {
    fail(`${label} contains duplicate ScreenId values.`);
  }

  return ids;
}

function parseCentralizationMatrix(shellCon011Section) {
  const rows = [];

  for (const line of shellCon011Section.split('\n')) {
    const cells = splitMarkdownRow(line);

    if (
      cells.length !== 4
      || !/^VSCREEN-[0-9]{4,}$/.test(cells[0] ?? '')
    ) {
      continue;
    }

    rows.push({
      screen_id: cells[0],
      lifecycle_status: cells[1],
      centralization_decision: cells[2],
      documentary_block: cells[3],
    });
  }

  assertExactSequence(
    rows.map((row) => row.screen_id),
    expectedScreenIds(),
    'SHELL-CON-011 centralization matrix',
  );

  if (rows.some((row) => row.lifecycle_status !== 'CANONICAL')) {
    fail('SHELL-CON-011 matrix must preserve CANONICAL for all 177 screens.');
  }

  if (
    rows.some(
      (row) =>
        row.centralization_decision
        !== 'CENTRALIZAR_SIN_CAMBIO_DE_IDENTIDAD',
    )
  ) {
    fail('SHELL-CON-011 matrix contains an unexpected centralization decision.');
  }

  if (rows.some((row) => row.documentary_block !== 'NINGUNO_DOCUMENTAL')) {
    fail('SHELL-CON-011 matrix contains an unexpected documentary block.');
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

  const procScreen001Section = extractTaskSection(
    screenSource,
    'PROC-SCREEN-001',
  );
  const procScreen002Section = extractTaskSection(
    screenSource,
    'PROC-SCREEN-002',
  );
  const procScreen003Section = extractTaskSection(
    screenSource,
    'PROC-SCREEN-003',
  );
  const procScreen004Section = extractTaskSection(
    screenSource,
    'PROC-SCREEN-004',
  );
  const shellCon011Section = extractTaskSection(
    shellSource,
    'SHELL-CON-011',
  );

  const identityMarkers = [
    identityContractId,
    '^VSCREEN-[0-9]{4,}$',
    'VSCREEN-0001',
    'VSCREEN-10000',
    'SCREEN-ID-ALLOCATION-POLICY-001',
  ];

  for (const marker of identityMarkers) {
    assertIncludes(procScreen001Section, marker, 'PROC-SCREEN-001');
  }

  const catalogMarkers = [
    catalogId,
    'VSCREEN-0001',
    'VSCREEN-0177',
    'CANONICAL',
  ];

  for (const marker of catalogMarkers) {
    assertIncludes(procScreen002Section, marker, 'PROC-SCREEN-002');
  }

  const shellMarkers = [
    catalogId,
    '@vento/contracts/screens',
    'ScreenId',
    'SCREEN_IDS',
    screenIdPatternSource,
    'VSCREEN-0001 .. VSCREEN-0177',
    nextUnassignedScreenId,
    'CENTRALIZAR_SIN_CAMBIO_DE_IDENTIDAD',
    'SHELL-CON-012',
  ];

  for (const marker of shellMarkers) {
    assertIncludes(shellCon011Section, marker, 'SHELL-CON-011');
  }

  const catalog = parseCanonicalCatalog(procScreen002Section);
  const processBindingIds = parseBindingScreenIds(
    procScreen003Section,
    7,
    'PROC-SCREEN-003 bindings',
  );
  const stepBindingIds = parseBindingScreenIds(
    procScreen004Section,
    7,
    'PROC-SCREEN-004 bindings',
  );
  const centralizationRows = parseCentralizationMatrix(
    shellCon011Section,
  );

  const screenIds = catalog.screens.map((screen) => screen.screen_id);

  assertExactSequence(
    processBindingIds,
    screenIds,
    'PROC-SCREEN-003 identity reconciliation',
  );
  assertExactSequence(
    stepBindingIds,
    screenIds,
    'PROC-SCREEN-004 identity reconciliation',
  );
  assertExactSequence(
    centralizationRows.map((row) => row.screen_id),
    screenIds,
    'SHELL-CON-011 identity reconciliation',
  );

  if (screenIds.includes('VSCREEN-0000')) {
    fail('VSCREEN-0000 must remain outside the assigned ScreenId set.');
  }

  if (screenIds.includes(nextUnassignedScreenId)) {
    fail(
      `${nextUnassignedScreenId} must remain outside the current ScreenId set.`,
    );
  }

  return {
    screenIds,
    applicationCounts: catalog.applicationCounts,
  };
}

function renderHeader() {
  return `// GENERATED FILE. DO NOT EDIT.
// Identity contract: ${identityContractId}
// Canonical catalog: ${catalogId}
// Catalog owner: PROC-SCREEN-002
// Reconciled with: PROC-SCREEN-003, PROC-SCREEN-004
// Contract task: SHELL-CON-011
// Source contract SHA256: ${sourceContractSha256}

`;
}

function renderContract(contract) {
  const screenIdRows = contract.screenIds
    .map((screenId) => `  ${JSON.stringify(screenId)},`)
    .join('\n');

  return `${renderHeader()}export const SCREEN_ID_PATTERN_SOURCE = ${JSON.stringify(screenIdPatternSource)} as const;

export const SCREEN_ID_PATTERN = /^VSCREEN-[0-9]{4,}$/;

export const SCREEN_IDS = [
${screenIdRows}
] as const;

export type ScreenId = (typeof SCREEN_IDS)[number];

export const SCREEN_ID_REGISTRY_METADATA = {
  identity_contract_id: ${JSON.stringify(identityContractId)},
  canonical_catalog_id: ${JSON.stringify(catalogId)},
  catalog_status: "CANONICAL",
  assigned_count: 177,
  canonical_count: 177,
  first_screen_id: ${JSON.stringify(firstScreenId)},
  last_screen_id: ${JSON.stringify(lastScreenId)},
  next_unassigned_screen_id: ${JSON.stringify(nextUnassignedScreenId)},
  format_pattern: ${JSON.stringify(screenIdPatternSource)},
  identity_task_id: "PROC-SCREEN-001",
  catalog_task_id: "PROC-SCREEN-002",
  process_binding_task_id: "PROC-SCREEN-003",
  step_binding_task_id: "PROC-SCREEN-004",
  contract_task_id: "SHELL-CON-011",
} as const;

export type ScreenIdRegistryMetadata =
  typeof SCREEN_ID_REGISTRY_METADATA;

const SCREEN_ID_SET = new Set<string>(SCREEN_IDS);

export function isScreenIdFormat(
  value: unknown,
): value is string {
  return (
    typeof value === "string"
    && SCREEN_ID_PATTERN.test(value)
  );
}

export function isScreenId(
  value: unknown,
): value is ScreenId {
  return (
    isScreenIdFormat(value)
    && SCREEN_ID_SET.has(value)
  );
}
`;
}

function renderIndex() {
  return `${renderHeader()}export {
  SCREEN_ID_PATTERN_SOURCE,
  SCREEN_ID_PATTERN,
  SCREEN_IDS,
  SCREEN_ID_REGISTRY_METADATA,
  isScreenIdFormat,
  isScreenId,
} from "./screen-id.contract.js";

export type {
  ScreenId,
  ScreenIdRegistryMetadata,
} from "./screen-id.contract.js";
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

export function generateScreenIdContracts({
  checkOnly = false,
} = {}) {
  const contract = loadCanonicalContract();

  return {
    screenIds: contract.screenIds,
    applicationCounts: contract.applicationCounts,
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
    const result = generateScreenIdContracts({
      checkOnly,
    });

    console.log(
      `[VENTO CONTRACTS] SCREEN_IDS ${checkOnly ? 'CHECK' : 'GENERATE'} PASS`,
    );
    console.log(
      `[VENTO CONTRACTS] CATALOG ${catalogId}`,
    );
    console.log(
      `[VENTO CONTRACTS] ASSIGNED ${result.screenIds.length}`,
    );
    console.log(
      `[VENTO CONTRACTS] RANGE ${firstScreenId}..${lastScreenId}`,
    );
    console.log(
      `[VENTO CONTRACTS] NEXT_UNASSIGNED ${nextUnassignedScreenId}`,
    );
    console.log(
      `[VENTO CONTRACTS] CONTRACT ${result.results.contract}`,
    );
    console.log(
      `[VENTO CONTRACTS] INDEX ${result.results.index}`,
    );
  } catch (error) {
    console.error('[VENTO CONTRACTS] SCREEN_IDS FAIL');
    console.error(
      error instanceof Error ? error.message : String(error),
    );
    process.exitCode = 1;
  }
}