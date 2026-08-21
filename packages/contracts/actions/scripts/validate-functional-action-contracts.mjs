import fs from 'node:fs';
import path from 'node:path';
import { fileURLToPath } from 'node:url';

import {
  generateFunctionalActionContracts,
} from './generate-functional-action-contracts.mjs';

const currentFile = fileURLToPath(import.meta.url);
const scriptDirectory = path.dirname(currentFile);
const actionsRoot = path.resolve(scriptDirectory, '..');
const contractsRoot = path.resolve(actionsRoot, '..');

const contractPath = path.join(
  actionsRoot,
  'generated',
  'functional-action.contract.ts',
);
const indexPath = path.join(
  actionsRoot,
  'generated',
  'index.ts',
);
const actionsReadmePath = path.join(actionsRoot, 'README.md');
const contractsReadmePath = path.join(contractsRoot, 'README.md');
const packageJsonPath = path.join(contractsRoot, 'package.json');

const sourceContractSha256 =
  '3ed778211435d455cea9e10b4a3d1be9c1fedbfd32b1e0a759bc8554958f3c02';

const expectedScreenIds = Array.from(
  { length: 177 },
  (_, index) => `VSCREEN-${String(index + 1).padStart(4, '0')}`,
);
const expectedPrimaryIds = expectedScreenIds.map(
  (screenId) => `${screenId}::PRIMARY`,
);
const expectedSecondaryIds = expectedScreenIds.flatMap(
  (screenId) =>
    [1, 2, 3, 4].map(
      (ordinal) =>
        `${screenId}::SECONDARY:${String(ordinal).padStart(2, '0')}`,
    ),
);
const expectedActionIds = expectedScreenIds.flatMap(
  (screenId) => [
    `${screenId}::PRIMARY`,
    `${screenId}::SECONDARY:01`,
    `${screenId}::SECONDARY:02`,
    `${screenId}::SECONDARY:03`,
    `${screenId}::SECONDARY:04`,
  ],
);

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

function extractStringArray(source, constantName) {
  const pattern = new RegExp(
    `export const ${constantName} = \\[([\\s\\S]*?)\\] as const;`,
  );
  const match = source.match(pattern);
  if (!match) {
    fail(`Generated ${constantName} array was not found.`);
  }
  return [
    ...match[1].matchAll(
      /"(VSCREEN-[0-9]{4,}::(?:PRIMARY|SECONDARY:[0-9]{2}))"/g,
    ),
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
    fail('@vento/contracts must remain private during SHELL-CON-012.');
  }
  if (Object.prototype.hasOwnProperty.call(packageJson, 'exports')) {
    fail('SHELL-CON-012 must not create public package exports.');
  }
}

function validateGeneratedContract(contractSource) {
  const required = [
    sourceContractSha256,
    'Primary register: SCREEN-PRIMARY-ACTION-REGISTER-001',
    'Secondary register: SCREEN-SECONDARY-ACTION-REGISTER-001',
    'Screen identity dependency: SHELL-CON-011',
    'Contract task: SHELL-CON-012',
    'from "../../screens/generated/screen-id.contract.js";',
    'export const FUNCTIONAL_ACTION_ID_PATTERN_SOURCE =',
    '"^VSCREEN-[0-9]{4,}::(?:PRIMARY|SECONDARY:[0-9]{2})$" as const;',
    'export const FUNCTIONAL_ACTION_ID_PATTERN =',
    '/^VSCREEN-[0-9]{4,}::(?:PRIMARY|SECONDARY:[0-9]{2})$/;',
    'export const FUNCTIONAL_ACTION_KINDS = [',
    'export const FUNCTIONAL_ACTION_SOURCES = [',
    'export const SECONDARY_FUNCTIONAL_ACTION_ORDINALS = [',
    'export const FUNCTIONAL_ACTION_IDS = [',
    'export type FunctionalActionId =',
    'export const PRIMARY_FUNCTIONAL_ACTION_IDS = [',
    'export const SECONDARY_FUNCTIONAL_ACTION_IDS = [',
    'export type FunctionalActionDefinition = Readonly<{',
    'export const FUNCTIONAL_ACTION_DEFINITIONS = [',
    'registry_status: "ESPECIFICADO"',
    'centralization_decision: "CENTRALIZAR_SIN_RENUMERAR"',
    'block_status: "NO_APLICA"',
    'screen_count: 177',
    'action_count: 885',
    'primary_action_count: 177',
    'secondary_action_count: 708',
    'actions_per_screen: 5',
    'current_secondary_ordinals: [1, 2, 3, 4]',
    'screen_contract_task_id: "SHELL-CON-011"',
    'primary_source_task_id: "PROC-SCREEN-014"',
    'secondary_source_task_id: "PROC-SCREEN-015"',
    'contract_task_id: "SHELL-CON-012"',
    'export function isFunctionalActionIdFormat(',
    'FUNCTIONAL_ACTION_ID_PATTERN.test(value)',
    'export function isFunctionalActionId(',
    'FUNCTIONAL_ACTION_ID_SET.has(value)',
    'export function assertFunctionalActionId(',
    'export function resolveFunctionalActionScreenId(',
    'export function resolveFunctionalActionKind(',
    'export function resolveFunctionalActionSource(',
    'export function resolveFunctionalActionSecondaryOrdinal(',
  ];

  for (const marker of required) {
    assertIncludes(
      contractSource,
      marker,
      'functional-action contract',
    );
  }

  assertExactSequence(
    extractStringArray(contractSource, 'FUNCTIONAL_ACTION_IDS'),
    expectedActionIds,
    'FUNCTIONAL_ACTION_IDS',
  );
  assertExactSequence(
    extractStringArray(
      contractSource,
      'PRIMARY_FUNCTIONAL_ACTION_IDS',
    ),
    expectedPrimaryIds,
    'PRIMARY_FUNCTIONAL_ACTION_IDS',
  );
  assertExactSequence(
    extractStringArray(
      contractSource,
      'SECONDARY_FUNCTIONAL_ACTION_IDS',
    ),
    expectedSecondaryIds,
    'SECONDARY_FUNCTIONAL_ACTION_IDS',
  );

  const definitionMatch = contractSource.match(
    /export const FUNCTIONAL_ACTION_DEFINITIONS = \[([\s\S]*?)\] as const satisfies readonly FunctionalActionDefinition\[\];/,
  );
  if (!definitionMatch) {
    fail('FUNCTIONAL_ACTION_DEFINITIONS was not found.');
  }

  const definitionIds = [
    ...definitionMatch[1].matchAll(
      /functional_action_id: "(VSCREEN-[0-9]{4,}::(?:PRIMARY|SECONDARY:[0-9]{2}))"/g,
    ),
  ].map((entry) => entry[1]);

  assertExactSequence(
    definitionIds,
    expectedActionIds,
    'FUNCTIONAL_ACTION_DEFINITIONS identities',
  );

  if (new Set(definitionIds).size !== 885) {
    fail('FUNCTIONAL_ACTION_DEFINITIONS must contain 885 unique identities.');
  }

  for (const forbidden of [
    'primary_application_id:',
    'primary_process_id:',
    'process_state_id:',
    'permission_id:',
    'business_event_id:',
    'route:',
    'slug:',
    'component_id:',
    'server_action:',
    'rpc:',
    'family:',
    'effect:',
    'secondary_class:',
    'relationship:',
    'availability:',
    'location:',
    'confirmation:',
  ]) {
    assertExcludes(
      contractSource,
      forbidden,
      'functional-action contract',
    );
  }
}

function validateGeneratedIndex(indexSource) {
  const required = [
    'FUNCTIONAL_ACTION_ID_PATTERN_SOURCE',
    'FUNCTIONAL_ACTION_ID_PATTERN',
    'FUNCTIONAL_ACTION_KINDS',
    'FUNCTIONAL_ACTION_SOURCES',
    'SECONDARY_FUNCTIONAL_ACTION_ORDINALS',
    'FUNCTIONAL_ACTION_IDS',
    'PRIMARY_FUNCTIONAL_ACTION_IDS',
    'SECONDARY_FUNCTIONAL_ACTION_IDS',
    'FUNCTIONAL_ACTION_DEFINITIONS',
    'FUNCTIONAL_ACTION_REGISTRY_METADATA',
    'isFunctionalActionIdFormat',
    'isFunctionalActionId',
    'assertFunctionalActionId',
    'resolveFunctionalActionScreenId',
    'resolveFunctionalActionKind',
    'resolveFunctionalActionSource',
    'resolveFunctionalActionSecondaryOrdinal',
    'FunctionalActionId',
    'PrimaryFunctionalActionId',
    'SecondaryFunctionalActionId',
    'FunctionalActionDefinition',
    'FunctionalActionRegistryMetadata',
    'from "./functional-action.contract.js";',
  ];
  for (const marker of required) {
    assertIncludes(indexSource, marker, 'functional-action index');
  }
}

function validateReadmes() {
  const actionsReadme = readText(
    actionsReadmePath,
    'actions README',
  );
  const actionMarkers = [
    '# @vento/contracts/actions',
    '`SHELL-CON-012::GLOBAL`',
    '`SCREEN-PRIMARY-ACTION-REGISTER-001`',
    '`SCREEN-SECONDARY-ACTION-REGISTER-001`',
    '`FunctionalActionId`',
    '885',
    '177 acciones principales',
    '708 acciones secundarias',
    '`VSCREEN-0001::PRIMARY`',
    '`VSCREEN-0177::PRIMARY`',
    '`::SECONDARY:01` a `::SECONDARY:04`',
    '`VSCREEN-0001::SECONDARY:05`',
    '`FUNCTIONAL_ACTION_IDS`',
    '`PRIMARY_FUNCTIONAL_ACTION_IDS`',
    '`SECONDARY_FUNCTIONAL_ACTION_IDS`',
    '`FUNCTIONAL_ACTION_DEFINITIONS`',
    '`isFunctionalActionIdFormat()`',
    '`isFunctionalActionId()`',
    '`assertFunctionalActionId()`',
    '`resolveFunctionalActionScreenId()`',
    '`resolveFunctionalActionKind()`',
    '`resolveFunctionalActionSource()`',
    '`resolveFunctionalActionSecondaryOrdinal()`',
    'No publica el subpath',
    '`SHELL-CON-013`',
  ];
  for (const marker of actionMarkers) {
    assertIncludes(actionsReadme, marker, 'actions README');
  }

  const contractsReadme = readText(
    contractsReadmePath,
    '@vento/contracts README',
  );
  const rootMarkers = [
    '## Módulo de acciones funcionales',
    '`packages/contracts/actions`',
    '`SHELL-CON-012::GLOBAL`',
    '`@vento/contracts/actions`',
    '885 identidades funcionales',
    '177 principales',
    '708 secundarias',
    '`FunctionalActionId`',
    'no añade `exports` públicos',
    '`SHELL-CON-013`',
  ];
  for (const marker of rootMarkers) {
    assertIncludes(
      contractsReadme,
      marker,
      '@vento/contracts README',
    );
  }
}

export function validateFunctionalActionContracts() {
  const generated =
    generateFunctionalActionContracts({ checkOnly: true });

  assertExactSequence(
    generated.screenIds,
    expectedScreenIds,
    'canonical ScreenId coverage',
  );
  assertExactSequence(
    generated.actions.map(
      (action) => action.functional_action_id,
    ),
    expectedActionIds,
    'canonical FunctionalActionId projection',
  );
  assertExactSequence(
    generated.primaryActionIds,
    expectedPrimaryIds,
    'canonical primary actions',
  );
  assertExactSequence(
    generated.secondaryActionIds,
    expectedSecondaryIds,
    'canonical secondary actions',
  );

  validatePackageBoundary();

  const contractSource = readText(
    contractPath,
    'functional-action contract',
  );
  const indexSource = readText(
    indexPath,
    'functional-action index',
  );

  validateGeneratedContract(contractSource);
  validateGeneratedIndex(indexSource);
  validateReadmes();

  return {
    screens: generated.screenIds.length,
    actions: generated.actions.length,
    primaryActions: generated.primaryActionIds.length,
    secondaryActions: generated.secondaryActionIds.length,
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

    const result = validateFunctionalActionContracts();

    console.log('[VENTO CONTRACTS] FUNCTIONAL_ACTION_CONTRACTS PASS');
    console.log(`[VENTO CONTRACTS] ACTIONS ${result.actions}`);
    console.log(`[VENTO CONTRACTS] PRIMARY ${result.primaryActions}`);
    console.log(`[VENTO CONTRACTS] SECONDARY ${result.secondaryActions}`);
    console.log(`[VENTO CONTRACTS] SCREENS ${result.screens}`);
    console.log('[VENTO CONTRACTS] ACTIONS_PER_SCREEN 5');
    console.log('[VENTO CONTRACTS] SECONDARY_ORDINALS 01..04');
    console.log('[VENTO CONTRACTS] SECONDARY_05 MEMBERSHIP_FALSE');
    console.log('[VENTO CONTRACTS] MEMBERSHIP SYNTAX_AND_SET');
    console.log('[VENTO CONTRACTS] SCREEN_DEPENDENCY RECONCILED');
    console.log('[VENTO CONTRACTS] PUBLIC_EXPORTS NONE');
    console.log('[VENTO CONTRACTS] BUSINESS_EVENTS NONE');
  } catch (error) {
    console.error('[VENTO CONTRACTS] FUNCTIONAL_ACTION_CONTRACTS FAIL');
    console.error(
      error instanceof Error ? error.message : String(error),
    );
    process.exitCode = 1;
  }
}