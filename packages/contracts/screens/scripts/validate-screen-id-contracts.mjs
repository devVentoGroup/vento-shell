import fs from 'node:fs';
import path from 'node:path';
import { fileURLToPath } from 'node:url';

import {
  generateScreenIdContracts,
} from './generate-screen-id-contracts.mjs';

const currentFile = fileURLToPath(import.meta.url);
const scriptDirectory = path.dirname(currentFile);
const screensRoot = path.resolve(scriptDirectory, '..');
const contractsRoot = path.resolve(screensRoot, '..');

const contractPath = path.join(
  screensRoot,
  'generated',
  'screen-id.contract.ts',
);

const indexPath = path.join(
  screensRoot,
  'generated',
  'index.ts',
);

const screensReadmePath = path.join(
  screensRoot,
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
  'd7f93b1a7628879958353a915f333eb184900f05f1d37db02e7ca6c5f9a84b99';

const expectedIds = Array.from(
  { length: 177 },
  (_, index) => `VSCREEN-${String(index + 1).padStart(4, '0')}`,
);

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
    fail(`${label} does not match the canonical expected value.`);
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

function extractGeneratedScreenIds(contractSource) {
  const match = contractSource.match(
    /export const SCREEN_IDS = \[([\s\S]*?)\] as const;/,
  );

  if (!match) {
    fail('Generated SCREEN_IDS array was not found.');
  }

  return [
    ...match[1].matchAll(/"(VSCREEN-[0-9]{4,})"/g),
  ].map((entry) => entry[1]);
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
    fail('@vento/contracts must remain private during SHELL-CON-011.');
  }

  if (Object.prototype.hasOwnProperty.call(packageJson, 'exports')) {
    fail('SHELL-CON-011 must not create public package exports.');
  }
}

function validateGeneratedContract(contractSource) {
  const required = [
    sourceContractSha256,
    'Identity contract: SCREEN-IDENTITY-CONTRACT-001',
    'Canonical catalog: SCREEN-CANONICAL-CATALOG-001',
    'Catalog owner: PROC-SCREEN-002',
    'Reconciled with: PROC-SCREEN-003, PROC-SCREEN-004',
    'Contract task: SHELL-CON-011',
    'export const SCREEN_ID_PATTERN_SOURCE = "^VSCREEN-[0-9]{4,}$" as const;',
    'export const SCREEN_ID_PATTERN = /^VSCREEN-[0-9]{4,}$/;',
    'export const SCREEN_IDS = [',
    'export type ScreenId = (typeof SCREEN_IDS)[number];',
    'catalog_status: "CANONICAL"',
    'assigned_count: 177',
    'canonical_count: 177',
    'first_screen_id: "VSCREEN-0001"',
    'last_screen_id: "VSCREEN-0177"',
    'next_unassigned_screen_id: "VSCREEN-0178"',
    'identity_task_id: "PROC-SCREEN-001"',
    'catalog_task_id: "PROC-SCREEN-002"',
    'process_binding_task_id: "PROC-SCREEN-003"',
    'step_binding_task_id: "PROC-SCREEN-004"',
    'contract_task_id: "SHELL-CON-011"',
    'export function isScreenIdFormat(',
    'SCREEN_ID_PATTERN.test(value)',
    'export function isScreenId(',
    'SCREEN_ID_SET.has(value)',
  ];

  for (const marker of required) {
    assertIncludes(
      contractSource,
      marker,
      'screen-id contract',
    );
  }

  const screenIds = extractGeneratedScreenIds(contractSource);

  assertExactSequence(
    screenIds,
    expectedIds,
    'SCREEN_IDS',
  );

  if (new Set(screenIds).size !== 177) {
    fail('SCREEN_IDS must contain exactly 177 unique members.');
  }

  if (screenIds.includes('VSCREEN-0000')) {
    fail('VSCREEN-0000 must remain outside SCREEN_IDS.');
  }

  if (screenIds.includes('VSCREEN-0178')) {
    fail('VSCREEN-0178 must remain outside SCREEN_IDS.');
  }

  const forbidden = [
    'primary_application_id',
    'primary_process_id',
    'process_instance_id',
    'step_id',
    'action_id',
    'event_id',
    'route_id',
    'component_id',
    'permission_key',
    'ProcessStateId',
    'VPROC-',
    '::STEP-',
    '::PRIMARY',
  ];

  for (const marker of forbidden) {
    assertExcludes(
      contractSource,
      marker,
      'screen-id contract',
    );
  }
}

function validateGeneratedIndex(indexSource) {
  const required = [
    'SCREEN_ID_PATTERN_SOURCE',
    'SCREEN_ID_PATTERN',
    'SCREEN_IDS',
    'SCREEN_ID_REGISTRY_METADATA',
    'isScreenIdFormat',
    'isScreenId',
    'ScreenId',
    'ScreenIdRegistryMetadata',
    'from "./screen-id.contract.js";',
  ];

  for (const marker of required) {
    assertIncludes(
      indexSource,
      marker,
      'screen-id index',
    );
  }
}

function validateReadmes() {
  const screensReadme = readText(
    screensReadmePath,
    'screens README',
  );

  const screenMarkers = [
    '# @vento/contracts/screens',
    '`SHELL-CON-011::GLOBAL`',
    '`SCREEN-IDENTITY-CONTRACT-001`',
    '`SCREEN-CANONICAL-CATALOG-001`',
    '`VSCREEN-0001` a `VSCREEN-0177`',
    '`VSCREEN-0178`',
    '`VSCREEN-0000`',
    '`SCREEN_IDS`',
    '`ScreenId`',
    '`isScreenIdFormat()`',
    '`isScreenId()`',
    '177',
    '`shell`: 7',
    '`viso`: 31',
    '`anima`: 14',
    '`nexo`: 37',
    '`fogo`: 15',
    '`origo`: 14',
    '`pulso`: 20',
    '`numera`: 20',
    '`pass`: 19',
    '`aura`: 0',
    'No publica el subpath',
    '`SHELL-CON-012`',
  ];

  for (const marker of screenMarkers) {
    assertIncludes(
      screensReadme,
      marker,
      'screens README',
    );
  }

  const contractsReadme = readText(
    contractsReadmePath,
    '@vento/contracts README',
  );

  const rootMarkers = [
    '## Módulo de pantallas',
    '`packages/contracts/screens`',
    '`SHELL-CON-011::GLOBAL`',
    '`@vento/contracts/screens`',
    '177 identidades',
    '`VSCREEN-0001`',
    '`VSCREEN-0177`',
    '`VSCREEN-0178`',
    'no añade `exports` públicos',
    '`SHELL-CON-012`',
  ];

  for (const marker of rootMarkers) {
    assertIncludes(
      contractsReadme,
      marker,
      '@vento/contracts README',
    );
  }
}

export function validateScreenIdContracts() {
  const generated =
    generateScreenIdContracts({ checkOnly: true });

  assertExactSequence(
    generated.screenIds,
    expectedIds,
    'canonical ScreenId set',
  );

  assertExactObject(
    generated.applicationCounts,
    expectedApplicationCounts,
    'canonical application distribution',
  );

  validatePackageBoundary();

  const contractSource = readText(
    contractPath,
    'screen-id contract',
  );
  const indexSource = readText(
    indexPath,
    'screen-id index',
  );

  validateGeneratedContract(contractSource);
  validateGeneratedIndex(indexSource);
  validateReadmes();

  return {
    screenIds: generated.screenIds.length,
    firstScreenId: generated.screenIds[0],
    lastScreenId: generated.screenIds.at(-1),
  };
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

    const result = validateScreenIdContracts();

    console.log('[VENTO CONTRACTS] SCREEN_ID_CONTRACTS PASS');
    console.log(
      `[VENTO CONTRACTS] SCREEN_IDS ${result.screenIds}`,
    );
    console.log(
      `[VENTO CONTRACTS] FIRST ${result.firstScreenId}`,
    );
    console.log(
      `[VENTO CONTRACTS] LAST ${result.lastScreenId}`,
    );
    console.log('[VENTO CONTRACTS] NEXT_UNASSIGNED VSCREEN-0178');
    console.log('[VENTO CONTRACTS] CATALOG_STATUS CANONICAL_177');
    console.log('[VENTO CONTRACTS] MEMBERSHIP SYNTAX_AND_SET');
    console.log('[VENTO CONTRACTS] PROCESS_STEP_BINDINGS RECONCILED');
    console.log('[VENTO CONTRACTS] PUBLIC_EXPORTS NONE');
  } catch (error) {
    console.error('[VENTO CONTRACTS] SCREEN_ID_CONTRACTS FAIL');
    console.error(
      error instanceof Error ? error.message : String(error),
    );
    process.exitCode = 1;
  }
}