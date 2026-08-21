import fs from 'node:fs';
import path from 'node:path';
import { fileURLToPath } from 'node:url';

import {
  generateProcessStateContracts,
} from './generate-process-state-contracts.mjs';

const currentFile = fileURLToPath(import.meta.url);
const scriptDirectory = path.dirname(currentFile);
const processesRoot = path.resolve(scriptDirectory, '..');
const contractsRoot = path.resolve(processesRoot, '..');

const stateContractPath = path.join(
  processesRoot,
  'generated',
  'states',
  'process-state.contract.ts',
);

const stateIndexPath = path.join(
  processesRoot,
  'generated',
  'states',
  'index.ts',
);

const processIdContractPath = path.join(
  processesRoot,
  'generated',
  'process-id.contract.ts',
);

const processRootIndexPath = path.join(
  processesRoot,
  'generated',
  'index.ts',
);

const processesReadmePath = path.join(
  processesRoot,
  'README.md',
);

const contractsReadmePath = path.join(
  contractsRoot,
  'README.md',
);

const packageJsonPath = path.join(
  contractsRoot,
  'package.json',
);

const sourceContractSha256 =
  '0c20de58e5ffdbfcaf80f469e906816f8cab4f870f1a2e067fb46cb811b6d9d4';

const expectedCounts = Object.freeze({
  processes: 69,
  initial: 69,
  intermediate: 454,
  finalNormal: 69,
  total: 592,
  transitions: 590,
});

function fail(message) {
  throw new Error(message);
}

function readText(filePath, label) {
  if (!fs.existsSync(filePath)) {
    fail(`Missing ${label}: ${path.relative(process.cwd(), filePath)}`);
  }

  return fs.readFileSync(filePath, 'utf8');
}

function readJson(filePath, label) {
  return JSON.parse(readText(filePath, label));
}

function assertIncludes(source, expected, label) {
  if (!source.includes(expected)) {
    fail(`${label} is missing required content: ${expected}`);
  }
}

function assertExcludes(source, forbidden, label) {
  if (source.includes(forbidden)) {
    fail(`${label} contains forbidden content: ${forbidden}`);
  }
}

function assertExactObject(actual, expected, label) {
  const normalizedActual = Object.fromEntries(
    Object.entries(actual).sort(([left], [right]) =>
      left.localeCompare(right),
    ),
  );
  const normalizedExpected = Object.fromEntries(
    Object.entries(expected).sort(([left], [right]) =>
      left.localeCompare(right),
    ),
  );

  if (
    JSON.stringify(normalizedActual)
    !== JSON.stringify(normalizedExpected)
  ) {
    fail(`${label} does not match the canonical expected value.`);
  }
}

function validatePackageBoundary() {
  const packageJson = readJson(
    packageJsonPath,
    '@vento/contracts package.json',
  );

  if (packageJson.name !== '@vento/contracts') {
    fail('@vento/contracts package identity changed.');
  }

  if (packageJson.private !== true) {
    fail('@vento/contracts must remain private during SHELL-CON-010.');
  }

  if (Object.prototype.hasOwnProperty.call(packageJson, 'exports')) {
    fail('SHELL-CON-010 must not create public package exports.');
  }
}

function validateGeneratedStateContract(source) {
  const required = [
    sourceContractSha256,
    'PROC-PROCESS-INITIAL-STATE-REGISTRY-001',
    'PROC-PROCESS-INTERMEDIATE-STATE-REGISTRY-001',
    'PROC-PROCESS-FINAL-STATE-REGISTRY-001',
    'PROC-PROCESS-TRANSITION-REGISTRY-001',
    'Contract task: SHELL-CON-010',
    'export const PROCESS_STATE_ID_PATTERN_SOURCE =',
    '"^VPROC-[0-9]{4}\\\\.[A-Z][A-Z0-9_]*$" as const;',
    'export const PROCESS_STATE_KINDS = [',
    '"INITIAL"',
    '"INTERMEDIATE"',
    '"FINAL_NORMAL"',
    'export const PROCESS_INTERMEDIATE_PHASES = [',
    '"VALIDACION"',
    '"ANALISIS"',
    '"REVISION"',
    '"APROBACION"',
    '"PREPARACION"',
    '"EJECUCION"',
    '"HANDOFF"',
    '"VERIFICACION"',
    '"RECONCILIACION"',
    '"ACTIVO"',
    'export const PROCESS_FINAL_TYPES = [',
    '"CERRADO"',
    '"RECONCILIADO"',
    '"LIBERADO"',
    '"CUMPLIDO"',
    '"VERIFICADO"',
    '"LIQUIDADO"',
    '"EVALUADO"',
    '"FORMALIZADO"',
    'export const PROCESS_STATE_IDS = [',
    'export type ProcessStateId =',
    'export const PROCESS_STATE_DEFINITIONS = [',
    'process_state_count: 592',
    'normal_transition_count: 590',
    'export function isProcessStateIdFormat(',
    'export function isProcessStateId(',
    'export function isProcessStateForProcess(',
    'export function getProcessStateDefinition(',
    'export function getProcessIdForState(',
    'export function getProcessStateCode(',
  ];

  for (const marker of required) {
    assertIncludes(
      source,
      marker,
      'process-state contract',
    );
  }

  const forbidden = [
    '.TR-001"',
    '.EX-001"',
    'process_instance_id',
    'transition_id:',
    'step_id:',
    'screen_id:',
    'action_id:',
    'event_id:',
    'command_id:',
    'error_code:',
    '"CONDITION_ONLY"',
    '"LINKED_REVIEW"',
    '"TEMPORARY_CONTROL"',
    '"ROUTE_CHANGE"',
    '"EXCEPTIONAL_TERMINAL"',
  ];

  for (const marker of forbidden) {
    assertExcludes(
      source,
      marker,
      'process-state contract',
    );
  }
}

function validateGeneratedStateIndex(source) {
  const required = [
    'PROCESS_STATE_ID_PATTERN_SOURCE',
    'PROCESS_STATE_ID_PATTERN',
    'PROCESS_STATE_KINDS',
    'PROCESS_INTERMEDIATE_PHASES',
    'PROCESS_FINAL_TYPES',
    'PROCESS_STATE_IDS',
    'PROCESS_STATE_DEFINITIONS',
    'PROCESS_STATE_REGISTRY_METADATA',
    'isProcessStateIdFormat',
    'isProcessStateId',
    'isProcessStateForProcess',
    'getProcessStateDefinition',
    'getProcessIdForState',
    'getProcessStateCode',
    'ProcessStateKind',
    'ProcessStateId',
  ];

  for (const marker of required) {
    assertIncludes(
      source,
      marker,
      'process-state index',
    );
  }
}

function validateProcessIdBoundary() {
  const processIdSource = readText(
    processIdContractPath,
    'ProcessId contract',
  );

  const required = [
    'Canonical registry: PROC-CANONICAL-ID-REGISTRY-001',
    'export const PROCESS_IDS = [',
    'export type ProcessId = (typeof PROCESS_IDS)[number];',
    'assigned_count: 69',
    'canonical_count: 69',
    'next_available_process_id: "VPROC-0070"',
    'export function isProcessId(',
  ];

  for (const marker of required) {
    assertIncludes(
      processIdSource,
      marker,
      'ProcessId contract',
    );
  }

  const rootIndexSource = readText(
    processRootIndexPath,
    'predecessor process index',
  );

  assertIncludes(
    rootIndexSource,
    'from "./process-id.contract.js";',
    'predecessor process index',
  );
  assertExcludes(
    rootIndexSource,
    'process-state',
    'predecessor process index',
  );
}

function validateReadmes() {
  const processesReadme = readText(
    processesReadmePath,
    'processes README',
  );

  const processMarkers = [
    '# @vento/contracts/processes',
    '`SHELL-CON-009::GLOBAL`',
    '`SHELL-CON-010::GLOBAL`',
    '`PROC-CANONICAL-ID-REGISTRY-001`',
    '`PROC-PROCESS-INITIAL-STATE-REGISTRY-001`',
    '`PROC-PROCESS-INTERMEDIATE-STATE-REGISTRY-001`',
    '`PROC-PROCESS-FINAL-STATE-REGISTRY-001`',
    '`PROC-PROCESS-TRANSITION-REGISTRY-001`',
    '`VPROC-0001` a `VPROC-0069`',
    '`VPROC-0070`',
    '`ProcessId`',
    '`PROCESS_IDS`',
    '`ProcessStateId`',
    '`PROCESS_STATE_IDS`',
    '**592**',
    '**69** `INITIAL`',
    '**454** `INTERMEDIATE`',
    '**69** `FINAL_NORMAL`',
    '**590** transiciones normales',
    '`generated/states/`',
    '`isProcessStateIdFormat()`',
    '`isProcessStateId()`',
    '`isProcessStateForProcess()`',
    'No publica el subpath',
    '`SHELL-CON-011`',
  ];

  for (const marker of processMarkers) {
    assertIncludes(
      processesReadme,
      marker,
      'processes README',
    );
  }

  const contractsReadme = readText(
    contractsReadmePath,
    '@vento/contracts README',
  );

  const rootMarkers = [
    '## Módulo de procesos',
    '`packages/contracts/processes`',
    '`SHELL-CON-009::GLOBAL`',
    '`SHELL-CON-010::GLOBAL`',
    '`@vento/contracts/processes`',
    '69 identidades',
    '592 estados',
    'no añade `exports` públicos',
    '`SHELL-CON-011`',
  ];

  for (const marker of rootMarkers) {
    assertIncludes(
      contractsReadme,
      marker,
      '@vento/contracts README',
    );
  }
}

export function validateProcessStateContracts() {
  const generated =
    generateProcessStateContracts({ checkOnly: true });

  assertExactObject(
    generated.counts,
    expectedCounts,
    'process-state counts',
  );

  validatePackageBoundary();
  validateProcessIdBoundary();

  const stateContractSource = readText(
    stateContractPath,
    'process-state contract',
  );
  const stateIndexSource = readText(
    stateIndexPath,
    'process-state index',
  );

  validateGeneratedStateContract(stateContractSource);
  validateGeneratedStateIndex(stateIndexSource);
  validateReadmes();

  return generated;
}

const isCli =
  process.argv[1]
  && path.resolve(process.argv[1]) === path.resolve(currentFile);

if (isCli) {
  try {
    const unknown = process.argv.slice(2);

    if (unknown.length > 0) {
      fail(`Unknown arguments: ${unknown.join(', ')}`);
    }

    const result = validateProcessStateContracts();

    console.log('[VENTO CONTRACTS] PROCESS_STATE_CONTRACTS PASS');
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
    console.log('[VENTO CONTRACTS] PROCESS_PREFIX_ALIGNMENT PASS');
    console.log('[VENTO CONTRACTS] STATE_MEMBERSHIP CLOSED');
    console.log('[VENTO CONTRACTS] TRANSITIONS EXCLUDED');
    console.log('[VENTO CONTRACTS] PUBLIC_EXPORTS NONE');
  } catch (error) {
    console.error('[VENTO CONTRACTS] PROCESS_STATE_CONTRACTS FAIL');
    console.error(
      error instanceof Error ? error.message : String(error),
    );
    process.exitCode = 1;
  }
}