import fs from 'node:fs';
import path from 'node:path';
import { fileURLToPath } from 'node:url';

import { generateProcessIdContracts } from './generate-process-id-contracts.mjs';

const currentFile = fileURLToPath(import.meta.url);
const scriptDirectory = path.dirname(currentFile);
const processesRoot = path.resolve(scriptDirectory, '..');
const contractsRoot = path.resolve(processesRoot, '..');

const contractPath = path.join(processesRoot, 'generated', 'process-id.contract.ts');
const indexPath = path.join(processesRoot, 'generated', 'index.ts');
const processesReadmePath = path.join(processesRoot, 'README.md');
const contractsReadmePath = path.join(contractsRoot, 'README.md');
const packageJsonPath = path.join(contractsRoot, 'package.json');

const sourceContractSha256 =
  '4a0c268805ba01f732e942703641b11cf9836a2e6c585dc5ea315328be229bd5';

const expectedIds = Array.from({ length: 69 }, (_, index) => {
  const value = String(index + 1).padStart(4, '0');
  return `VPROC-${value}`;
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

function assertExact(actual, expected, label) {
  const normalizedActual = normalizeForComparison(actual);
  const normalizedExpected = normalizeForComparison(expected);

  if (JSON.stringify(normalizedActual) !== JSON.stringify(normalizedExpected)) {
    fail(`${label} does not match the canonical expected value.`);
  }
}

function extractGeneratedProcessIds(contractSource) {
  const match = contractSource.match(
    /export const PROCESS_IDS = \[([\s\S]*?)\] as const;/,
  );
  if (!match) fail('Generated PROCESS_IDS array was not found.');

  return [...match[1].matchAll(/"(VPROC-[0-9]{4})"/g)]
    .map((entry) => entry[1]);
}

function validatePackageBoundary() {
  const packageJson = readJson(packageJsonPath, '@vento/contracts package.json');

  if (packageJson.name !== '@vento/contracts') {
    fail('@vento/contracts package identity changed.');
  }
  if (packageJson.private !== true) {
    fail('@vento/contracts must remain private during SHELL-CON-009.');
  }
  if (Object.prototype.hasOwnProperty.call(packageJson, 'exports')) {
    fail('SHELL-CON-009 must not create public package exports.');
  }
}

function validateGeneratedContract(contractSource) {
  const required = [
    sourceContractSha256,
    'Canonical registry: PROC-CANONICAL-ID-REGISTRY-001',
    'Registry owner: PROC-CAT-003',
    'Reconciliation: PROC-CAT-020',
    'Contract task: SHELL-CON-009',
    'export const PROCESS_ID_PATTERN_SOURCE = "^VPROC-[0-9]{4}$" as const;',
    'export const PROCESS_ID_PATTERN = /^VPROC-[0-9]{4}$/;',
    'export const PROCESS_IDS = [',
    'export type ProcessId = (typeof PROCESS_IDS)[number];',
    'registry_status: "CANONICAL"',
    'assigned_count: 69',
    'canonical_count: 69',
    'merged_alias_count: 0',
    'split_parent_count: 0',
    'retired_count: 0',
    'void_count: 0',
    'first_process_id: "VPROC-0001"',
    'last_process_id: "VPROC-0069"',
    'next_available_process_id: "VPROC-0070"',
    'export function isProcessIdFormat(value: unknown): value is string',
    'value !== "VPROC-0000"',
    'PROCESS_ID_PATTERN.test(value)',
    'export function isProcessId(value: unknown): value is ProcessId',
    'PROCESS_ID_SET.has(value)',
  ];

  for (const marker of required) {
    assertIncludes(contractSource, marker, 'process-id contract');
  }

  const processIds = extractGeneratedProcessIds(contractSource);
  assertExact(processIds, expectedIds, 'PROCESS_IDS');

  if (new Set(processIds).size !== 69) {
    fail('PROCESS_IDS must contain exactly 69 unique members.');
  }
  if (processIds.includes('VPROC-0000')) {
    fail('VPROC-0000 must not belong to PROCESS_IDS.');
  }
  if (processIds.includes('VPROC-0070')) {
    fail('VPROC-0070 must remain outside PROCESS_IDS.');
  }

  const forbidden = [
    'ASIS-SRC-',
    'ADICIONAL-PROVISIONAL-',
    'ProcessState',
    'PROCESS_STATES',
    'process_instance_id',
    'permission_key',
    'app_code:',
  ];
  for (const marker of forbidden) {
    assertExcludes(contractSource, marker, 'process-id contract');
  }
}

function validateGeneratedIndex(indexSource) {
  const required = [
    'PROCESS_ID_PATTERN_SOURCE',
    'PROCESS_ID_PATTERN',
    'PROCESS_IDS',
    'PROCESS_ID_REGISTRY_METADATA',
    'isProcessIdFormat',
    'isProcessId',
    'ProcessId',
    'ProcessIdRegistryMetadata',
  ];

  for (const marker of required) {
    assertIncludes(indexSource, marker, 'process-id index');
  }
}

function validateReadmes() {
  const processesReadme = readText(processesReadmePath, 'processes README');
  const processMarkers = [
    '# @vento/contracts/processes',
    '`SHELL-CON-009::GLOBAL`',
    '`PROC-CANONICAL-ID-REGISTRY-001`',
    '`VPROC-0001` a `VPROC-0069`',
    '`VPROC-0070`',
    '`ProcessId`',
    '`PROCESS_IDS`',
    '`isProcessIdFormat()`',
    '`isProcessId()`',
    'No publica el subpath',
    '`SHELL-CON-010`',
  ];
  for (const marker of processMarkers) {
    assertIncludes(processesReadme, marker, 'processes README');
  }

  const contractsReadme = readText(contractsReadmePath, '@vento/contracts README');
  const rootMarkers = [
    '## Módulo de procesos',
    '`packages/contracts/processes`',
    '`SHELL-CON-009::GLOBAL`',
    '`@vento/contracts/processes`',
    '69 identidades',
    'no añade `exports` públicos',
  ];
  for (const marker of rootMarkers) {
    assertIncludes(contractsReadme, marker, '@vento/contracts README');
  }
}

export function validateProcessIdContracts() {
  const generated = generateProcessIdContracts({ checkOnly: true });

  assertExact(generated.processIds, expectedIds, 'canonical ProcessId set');
  assertExact(
    generated.statusCounts,
    {
      CANONICAL: 69,
      MERGED_ALIAS: 0,
      SPLIT_PARENT: 0,
      RETIRED: 0,
      VOID: 0,
    },
    'canonical registry status counts',
  );

  validatePackageBoundary();

  const contractSource = readText(contractPath, 'process-id contract');
  const indexSource = readText(indexPath, 'process-id index');

  validateGeneratedContract(contractSource);
  validateGeneratedIndex(indexSource);
  validateReadmes();

  return {
    processIds: generated.processIds.length,
    firstProcessId: generated.processIds[0],
    lastProcessId: generated.processIds.at(-1),
  };
}

const isCli = process.argv[1]
  && path.resolve(process.argv[1]) === path.resolve(currentFile);

if (isCli) {
  try {
    const unknown = process.argv.slice(2);
    if (unknown.length > 0) fail(`Unknown arguments: ${unknown.join(', ')}`);

    const result = validateProcessIdContracts();

    console.log('[VENTO CONTRACTS] PROCESS_ID_CONTRACTS PASS');
    console.log(`[VENTO CONTRACTS] PROCESS_IDS ${result.processIds}`);
    console.log(`[VENTO CONTRACTS] FIRST ${result.firstProcessId}`);
    console.log(`[VENTO CONTRACTS] LAST ${result.lastProcessId}`);
    console.log('[VENTO CONTRACTS] NEXT_AVAILABLE VPROC-0070');
    console.log('[VENTO CONTRACTS] REGISTRY_STATUS CANONICAL_69');
    console.log('[VENTO CONTRACTS] VPROC_0000 INVALID');
    console.log('[VENTO CONTRACTS] MEMBERSHIP FORMAT_AND_SET');
    console.log('[VENTO CONTRACTS] PUBLIC_EXPORTS NONE');
  } catch (error) {
    console.error('[VENTO CONTRACTS] PROCESS_ID_CONTRACTS FAIL');
    console.error(error instanceof Error ? error.message : String(error));
    process.exitCode = 1;
  }
}