import fs from 'node:fs';
import path from 'node:path';
import { fileURLToPath } from 'node:url';

const currentFile = fileURLToPath(import.meta.url);
const scriptDirectory = path.dirname(currentFile);
const processesRoot = path.resolve(scriptDirectory, '..');
const repositoryRoot = path.resolve(processesRoot, '../../..');

const processIdentitySourcePath = path.join(
  repositoryRoot,
  'docs',
  'plan-canonico',
  'modular',
  'bloques',
  'E2_PROCESOS_Y_EXPERIENCIA',
  '01_01_BASE_DISENO_E_IDENTIDAD_DE_PROCESOS.md',
);

const processReconciliationSourcePath = path.join(
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

const generatedDirectory = path.join(processesRoot, 'generated');
const contractPath = path.join(generatedDirectory, 'process-id.contract.ts');
const indexPath = path.join(generatedDirectory, 'index.ts');

const sourceContractSha256 =
  '4a0c268805ba01f732e942703641b11cf9836a2e6c585dc5ea315328be229bd5';

const registryId = 'PROC-CANONICAL-ID-REGISTRY-001';
const expectedCount = 69;
const firstProcessId = 'VPROC-0001';
const lastProcessId = 'VPROC-0069';
const nextAvailableProcessId = 'VPROC-0070';
const processIdPatternSource = '^VPROC-[0-9]{4}$';

const expectedStatusCounts = Object.freeze({
  CANONICAL: 69,
  MERGED_ALIAS: 0,
  SPLIT_PARENT: 0,
  RETIRED: 0,
  VOID: 0,
});

function fail(message) {
  throw new Error(message);
}

function readCanonical(filePath, label) {
  if (!fs.existsSync(filePath)) {
    fail(`Missing canonical source ${label}: ${path.relative(process.cwd(), filePath)}`);
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
  const nextTaskMatch = tail.match(/^### ✅ [^\n]+$/m);

  if (!nextTaskMatch || nextTaskMatch.index === undefined) {
    return source.slice(start);
  }

  return source.slice(start, tailStart + nextTaskMatch.index);
}

function extractNumberedSection(taskSection, sectionNumber, nextSectionNumber) {
  const startPattern = new RegExp(`^#### ${sectionNumber}\\.[^\\n]*$`, 'm');
  const startMatch = taskSection.match(startPattern);

  if (!startMatch || startMatch.index === undefined) {
    fail(`Section ${sectionNumber} not found in canonical task.`);
  }

  const start = startMatch.index;
  const tailStart = start + startMatch[0].length;
  const tail = taskSection.slice(tailStart);
  const endPattern = new RegExp(`^#### ${nextSectionNumber}\\.[^\\n]*$`, 'm');
  const endMatch = tail.match(endPattern);

  if (!endMatch || endMatch.index === undefined) {
    fail(`Section ${nextSectionNumber} not found after section ${sectionNumber}.`);
  }

  return taskSection.slice(start, tailStart + endMatch.index);
}

function expectedProcessIds() {
  return Array.from({ length: expectedCount }, (_, index) => {
    const value = String(index + 1).padStart(4, '0');
    return `VPROC-${value}`;
  });
}

function extractAssignedProcessIds(procCat003Section) {
  const assignmentSection = extractNumberedSection(procCat003Section, 9, 10);
  const matches = [...assignmentSection.matchAll(/^\|\s*`(VPROC-[0-9]{4})`\s*\|/gm)];
  const values = matches.map((match) => match[1]);

  if (values.length !== expectedCount) {
    fail(
      `PROC-CAT-003 assignment table must contain exactly ${expectedCount} rows; received ${values.length}.`,
    );
  }

  if (new Set(values).size !== values.length) {
    fail('PROC-CAT-003 assignment table contains duplicate ProcessId values.');
  }

  const expected = expectedProcessIds();
  if (JSON.stringify(values) !== JSON.stringify(expected)) {
    fail('PROC-CAT-003 ProcessId sequence differs from VPROC-0001..VPROC-0069.');
  }

  return values;
}

function extractStatusCounts(procCat020Section) {
  const statusSectionMatch = procCat020Section.match(
    /MERGED_ALIAS\s+(\d+)[\s\S]*?SPLIT_PARENT\s+(\d+)[\s\S]*?RETIRED\s+(\d+)[\s\S]*?VOID\s+(\d+)[\s\S]*?CANONICAL\s+(\d+)/,
  );

  if (!statusSectionMatch) {
    fail('PROC-CAT-020 status reconciliation block was not found.');
  }

  return {
    MERGED_ALIAS: Number(statusSectionMatch[1]),
    SPLIT_PARENT: Number(statusSectionMatch[2]),
    RETIRED: Number(statusSectionMatch[3]),
    VOID: Number(statusSectionMatch[4]),
    CANONICAL: Number(statusSectionMatch[5]),
  };
}

function normalizeForComparison(value) {
  if (Array.isArray(value)) {
    return value.map((entry) => normalizeForComparison(entry));
  }

  if (value !== null && typeof value === 'object') {
    return Object.fromEntries(
      Object.keys(value)
        .sort()
        .map((key) => [key, normalizeForComparison(value[key])]),
    );
  }

  return value;
}

function assertExactObject(actual, expected, label) {
  const normalizedActual = normalizeForComparison(actual);
  const normalizedExpected = normalizeForComparison(expected);

  if (JSON.stringify(normalizedActual) !== JSON.stringify(normalizedExpected)) {
    fail(`${label} does not match the canonical expected value.`);
  }
}

function assertIncludes(source, expected, label) {
  if (!source.includes(expected)) {
    fail(`${label} is missing required canonical marker: ${expected}`);
  }
}

function loadCanonicalContract() {
  const identitySource = readCanonical(processIdentitySourcePath, 'PROC-CAT identity');
  const reconciliationSource = readCanonical(
    processReconciliationSourcePath,
    'PROC-CAT reconciliation',
  );
  const shellSource = readCanonical(shellContractSourcePath, 'SHELL-CON');

  const procCat003Section = extractTaskSection(identitySource, 'PROC-CAT-003');
  const procCat020Section = extractTaskSection(reconciliationSource, 'PROC-CAT-020');
  const shellCon009Section = extractTaskSection(shellSource, 'SHELL-CON-009');

  const identityMarkers = [
    registryId,
    '**Cantidad de procesos identificados:** **69**',
    '**Rango asignado:** `VPROC-0001` a `VPROC-0069`',
    '**Siguiente identificador disponible:** `VPROC-0070`',
    '`VPROC-0000`',
  ];
  for (const marker of identityMarkers) {
    assertIncludes(procCat003Section, marker, 'PROC-CAT-003');
  }

  const reconciliationMarkers = [
    'MERGED_ALIAS',
    'SPLIT_PARENT',
    'RETIRED',
    'VOID',
    'CANONICAL',
    nextAvailableProcessId,
  ];
  for (const marker of reconciliationMarkers) {
    assertIncludes(procCat020Section, marker, 'PROC-CAT-020');
  }

  const shellMarkers = [
    '### ✅ SHELL-CON-009 — Centralizar identificadores de procesos',
    registryId,
    '@vento/contracts/processes',
    'ProcessId',
    'PROCESS_IDS',
    processIdPatternSource,
    'VPROC-0001 .. VPROC-0069',
    nextAvailableProcessId,
    'ProcessId reconocido',
    'SHELL-CON-010',
  ];
  for (const marker of shellMarkers) {
    assertIncludes(shellCon009Section, marker, 'SHELL-CON-009');
  }

  const processIds = extractAssignedProcessIds(procCat003Section);
  const statusCounts = extractStatusCounts(procCat020Section);

  assertExactObject(statusCounts, expectedStatusCounts, 'PROC-CAT-020 status counts');

  if (processIds.includes('VPROC-0000')) {
    fail('VPROC-0000 must not belong to ProcessId.');
  }
  if (processIds.includes(nextAvailableProcessId)) {
    fail(`${nextAvailableProcessId} must remain outside the assigned ProcessId set.`);
  }

  return {
    processIds,
    statusCounts,
  };
}

function renderHeader() {
  return `// GENERATED FILE. DO NOT EDIT.
// Canonical registry: ${registryId}
// Registry owner: PROC-CAT-003
// Reconciliation: PROC-CAT-020
// Contract task: SHELL-CON-009
// Source contract SHA256: ${sourceContractSha256}

`;
}

function renderContract(contract) {
  const processIdRows = contract.processIds
    .map((processId) => `  ${JSON.stringify(processId)},`)
    .join('\n');

  return `${renderHeader()}export const PROCESS_ID_PATTERN_SOURCE = ${JSON.stringify(processIdPatternSource)} as const;

export const PROCESS_ID_PATTERN = /^VPROC-[0-9]{4}$/;

export const PROCESS_IDS = [
${processIdRows}
] as const;

export type ProcessId = (typeof PROCESS_IDS)[number];

export const PROCESS_ID_REGISTRY_METADATA = {
  registry_id: ${JSON.stringify(registryId)},
  registry_status: "CANONICAL",
  assigned_count: 69,
  canonical_count: 69,
  merged_alias_count: 0,
  split_parent_count: 0,
  retired_count: 0,
  void_count: 0,
  first_process_id: ${JSON.stringify(firstProcessId)},
  last_process_id: ${JSON.stringify(lastProcessId)},
  next_available_process_id: ${JSON.stringify(nextAvailableProcessId)},
  format_pattern: ${JSON.stringify(processIdPatternSource)},
  source_task_id: "PROC-CAT-003",
  reconciliation_task_id: "PROC-CAT-020",
  contract_task_id: "SHELL-CON-009",
} as const;

export type ProcessIdRegistryMetadata =
  typeof PROCESS_ID_REGISTRY_METADATA;

const PROCESS_ID_SET = new Set<string>(PROCESS_IDS);

export function isProcessIdFormat(value: unknown): value is string {
  return (
    typeof value === "string"
    && value !== "VPROC-0000"
    && PROCESS_ID_PATTERN.test(value)
  );
}

export function isProcessId(value: unknown): value is ProcessId {
  return isProcessIdFormat(value) && PROCESS_ID_SET.has(value);
}
`;
}

function renderIndex() {
  return `${renderHeader()}export {
  PROCESS_ID_PATTERN_SOURCE,
  PROCESS_ID_PATTERN,
  PROCESS_IDS,
  PROCESS_ID_REGISTRY_METADATA,
  isProcessIdFormat,
  isProcessId,
} from "./process-id.contract.js";

export type {
  ProcessId,
  ProcessIdRegistryMetadata,
} from "./process-id.contract.js";
`;
}

function assertOrWrite(filePath, expected, checkOnly) {
  const current = fs.existsSync(filePath) ? fs.readFileSync(filePath, 'utf8') : null;

  if (checkOnly) {
    if (current !== expected) {
      fail(`Generated artifact is stale: ${path.relative(process.cwd(), filePath)}`);
    }
    return 'FRESH';
  }

  fs.mkdirSync(path.dirname(filePath), { recursive: true });
  if (current !== expected) fs.writeFileSync(filePath, expected, 'utf8');
  return current === expected ? 'FRESH' : 'UPDATED';
}

export function generateProcessIdContracts({ checkOnly = false } = {}) {
  const contract = loadCanonicalContract();

  return {
    processIds: contract.processIds,
    statusCounts: contract.statusCounts,
    results: {
      contract: assertOrWrite(contractPath, renderContract(contract), checkOnly),
      index: assertOrWrite(indexPath, renderIndex(), checkOnly),
    },
  };
}

const isCli = process.argv[1]
  && path.resolve(process.argv[1]) === path.resolve(currentFile);

if (isCli) {
  try {
    const unknown = process.argv.slice(2).filter((argument) => argument !== '--check');
    if (unknown.length > 0) fail(`Unknown arguments: ${unknown.join(', ')}`);

    const checkOnly = process.argv.includes('--check');
    const result = generateProcessIdContracts({ checkOnly });

    console.log(`[VENTO CONTRACTS] PROCESS_IDS ${checkOnly ? 'CHECK' : 'GENERATE'} PASS`);
    console.log(`[VENTO CONTRACTS] REGISTRY ${registryId}`);
    console.log(`[VENTO CONTRACTS] ASSIGNED ${result.processIds.length}`);
    console.log(`[VENTO CONTRACTS] CANONICAL ${result.statusCounts.CANONICAL}`);
    console.log(`[VENTO CONTRACTS] RANGE ${firstProcessId}..${lastProcessId}`);
    console.log(`[VENTO CONTRACTS] NEXT_AVAILABLE ${nextAvailableProcessId}`);
    console.log(`[VENTO CONTRACTS] CONTRACT ${result.results.contract}`);
    console.log(`[VENTO CONTRACTS] INDEX ${result.results.index}`);
  } catch (error) {
    console.error('[VENTO CONTRACTS] PROCESS_IDS FAIL');
    console.error(error instanceof Error ? error.message : String(error));
    process.exitCode = 1;
  }
}