import fs from 'node:fs';
import path from 'node:path';
import { fileURLToPath } from 'node:url';

import {
  generateBusinessEventContracts,
} from './generate-business-event-contracts.mjs';

const currentFile = fileURLToPath(import.meta.url);
const scriptDirectory = path.dirname(currentFile);
const eventsRoot = path.resolve(scriptDirectory, '..');
const contractsRoot = path.resolve(eventsRoot, '..');

const contractPath = path.join(
  eventsRoot,
  'generated',
  'business-event.contract.ts',
);
const indexPath = path.join(
  eventsRoot,
  'generated',
  'index.ts',
);
const eventsReadmePath = path.join(eventsRoot, 'README.md');
const contractsReadmePath = path.join(contractsRoot, 'README.md');
const packageJsonPath = path.join(contractsRoot, 'package.json');

const sourceContractSha256 =
  '0a42928046b483e3750c71f9f943ba3b6cd805d097c51e63358399ea598bff35';

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

const expectedConditionalTemplates = [
  'vento.process.vproc-####.exception-applied.v1',
  'vento.process.vproc-####.exception-resolved.v1',
  'vento.process.vproc-####.cancellation-recorded.v1',
  'vento.process.vproc-####.void-recorded.v1',
  'vento.process.vproc-####.reversal-applied.v1',
  'vento.process.vproc-####.compensation-posted.v1',
  'vento.process.vproc-####.correction-applied.v1',
  'vento.process.vproc-####.linked-review-opened.v1',
];

function expectedProcessIds() {
  return Array.from(
    { length: 69 },
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

function assertIncludesAny(source, alternatives, label, semanticLabel) {
  if (!alternatives.some((candidate) => source.includes(candidate))) {
    fail(
      `${label} is missing required semantic content: ${semanticLabel} `
      + `(accepted: ${alternatives.join(' OR ')})`,
    );
  }
}

function assertDoesNotMatch(source, pattern, label, forbiddenLabel) {
  if (pattern.test(source)) {
    fail(`${label} contains forbidden content: ${forbiddenLabel}`);
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

function extractStringArray(source, constantName, pattern) {
  const arrayPattern = new RegExp(
    `export const ${constantName} = \\[([\\s\\S]*?)\\] as const;`,
  );
  const match = source.match(arrayPattern);

  if (!match) {
    fail(`Generated ${constantName} array was not found.`);
  }

  return [
    ...match[1].matchAll(pattern),
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
    fail('@vento/contracts must remain private during SHELL-CON-013.');
  }

  if (Object.prototype.hasOwnProperty.call(packageJson, 'exports')) {
    fail('SHELL-CON-013 must not create public package exports.');
  }
}

function validateGeneratedContract(contractSource) {
  const required = [
    sourceContractSha256,
    'Semantic owner: PROC-CAT-017',
    'Identity centralization: SHELL-CON-013',
    'Process identity dependency: SHELL-CON-009',
    'from "../../processes/generated/process-id.contract.js";',
    'export const BUSINESS_EVENT_ID_PATTERN_SOURCE =',
    '"^VPROC-[0-9]{4}\\\\.EVT-[0-9]{3}$" as const;',
    'export const BUSINESS_EVENT_ID_PATTERN =',
    String.raw`/^VPROC-[0-9]{4}\.EVT-[0-9]{3}$/;`,
    'export const BUSINESS_EVENT_CLASSES = [',
    'export const BUSINESS_EVENT_SENSITIVITIES = [',
    'export const BUSINESS_EVENT_IDS = [',
    'export type BusinessEventId =',
    'export const BUSINESS_EVENT_TYPES = [',
    'export type BusinessEventType =',
    'export const CONDITIONAL_BUSINESS_EVENT_TYPE_TEMPLATES = [',
    'export const BUSINESS_EVENT_DEFINITIONS = [',
    'normal_definition_count: 395',
    'conditional_family_count: 8',
    'event_class_count: 12',
    'sensitivity_count: 4',
    'contract_task_id: "SHELL-CON-013"',
    'semantic_owner_task_id: "PROC-CAT-017"',
    'logical_namespace: "@vento/contracts/events"',
    'export function isBusinessEventIdFormat(',
    'BUSINESS_EVENT_ID_PATTERN.test(value)',
    'export function isBusinessEventId(',
    'BUSINESS_EVENT_ID_SET.has(value)',
    'export function assertBusinessEventId(',
    'export function isBusinessEventType(',
    'export function resolveBusinessEventProcessId(',
    'export function resolveBusinessEventType(',
    'export function resolveBusinessEventClass(',
    'export function resolveBusinessEventSensitivity(',
  ];

  for (const marker of required) {
    assertIncludes(
      contractSource,
      marker,
      'business-event contract',
    );
  }

  const ids = extractStringArray(
    contractSource,
    'BUSINESS_EVENT_IDS',
    /"(VPROC-[0-9]{4}\.EVT-[0-9]{3})"/g,
  );

  assertExactSequence(
    ids,
    expectedBusinessEventIds(),
    'BUSINESS_EVENT_IDS',
  );

  if (new Set(ids).size !== 395) {
    fail('BUSINESS_EVENT_IDS must contain 395 unique identities.');
  }

  const conditionalTemplates = extractStringArray(
    contractSource,
    'CONDITIONAL_BUSINESS_EVENT_TYPE_TEMPLATES',
    /"(vento\.process\.vproc-####\.[a-z0-9-]+\.v1)"/g,
  );

  assertExactSequence(
    conditionalTemplates,
    expectedConditionalTemplates,
    'CONDITIONAL_BUSINESS_EVENT_TYPE_TEMPLATES',
  );

  const definitionMatch = contractSource.match(
    /export const BUSINESS_EVENT_DEFINITIONS = \[([\s\S]*?)\] as const satisfies readonly BusinessEventDefinition\[\];/,
  );

  if (!definitionMatch) {
    fail('BUSINESS_EVENT_DEFINITIONS was not found.');
  }

  const definitionIds = [
    ...definitionMatch[1].matchAll(
      /business_event_id: "(VPROC-[0-9]{4}\.EVT-[0-9]{3})"/g,
    ),
  ].map((entry) => entry[1]);

  assertExactSequence(
    definitionIds,
    expectedBusinessEventIds(),
    'BUSINESS_EVENT_DEFINITIONS identities',
  );

  const forbiddenRuntimeProperties = [
    [/(?:^|[^A-Za-z0-9_])source_fact\s*:/mu, 'source_fact:'],
    [/(?:^|[^A-Za-z0-9_])confirmed_fact\s*:/mu, 'confirmed_fact:'],
    [/(?:^|[^A-Za-z0-9_])event_id\s*:/mu, 'event_id:'],
    [/(?:^|[^A-Za-z0-9_])process_instance_id\s*:/mu, 'process_instance_id:'],
    [/(?:^|[^A-Za-z0-9_])correlation_id\s*:/mu, 'correlation_id:'],
    [/(?:^|[^A-Za-z0-9_])causation_id\s*:/mu, 'causation_id:'],
    [/(?:^|[^A-Za-z0-9_])permission_id\s*:/mu, 'permission_id:'],
    [/(?:^|[^A-Za-z0-9_])functional_action_id\s*:/mu, 'functional_action_id:'],
    [/(?:^|[^A-Za-z0-9_])producer_runtime\s*:/mu, 'producer_runtime:'],
    [/(?:^|[^A-Za-z0-9_])consumer_runtime\s*:/mu, 'consumer_runtime:'],
    [/(?:^|[^A-Za-z0-9_])topic\s*:/mu, 'topic:'],
    [/(?:^|[^A-Za-z0-9_])queue\s*:/mu, 'queue:'],
    [/(?:^|[^A-Za-z0-9_])outbox\s*:/mu, 'outbox:'],
    [/(?:^|[^A-Za-z0-9_])webhook\s*:/mu, 'webhook:'],
    [/(?:^|[^A-Za-z0-9_])rpc\s*:/mu, 'rpc:'],
  ];

  for (const [pattern, forbiddenLabel] of forbiddenRuntimeProperties) {
    assertDoesNotMatch(
      contractSource,
      pattern,
      'business-event contract',
      forbiddenLabel,
    );
  }

  if (ids.includes('VPROC-0003.EVT-005')) {
    fail('VPROC-0003.EVT-005 must not be a current BusinessEventId.');
  }

  if (ids.includes('VPROC-0070.EVT-001')) {
    fail('VPROC-0070.EVT-001 must not be a current BusinessEventId.');
  }
}

function validateGeneratedIndex(indexSource) {
  const required = [
    'BUSINESS_EVENT_ID_PATTERN_SOURCE',
    'BUSINESS_EVENT_ID_PATTERN',
    'BUSINESS_EVENT_CLASSES',
    'BUSINESS_EVENT_SENSITIVITIES',
    'BUSINESS_EVENT_IDS',
    'BUSINESS_EVENT_TYPES',
    'CONDITIONAL_BUSINESS_EVENT_TYPE_TEMPLATES',
    'BUSINESS_EVENT_DEFINITIONS',
    'BUSINESS_EVENT_REGISTRY_METADATA',
    'isBusinessEventIdFormat',
    'isBusinessEventId',
    'assertBusinessEventId',
    'isBusinessEventType',
    'resolveBusinessEventProcessId',
    'resolveBusinessEventType',
    'resolveBusinessEventClass',
    'resolveBusinessEventSensitivity',
    'BusinessEventId',
    'BusinessEventType',
    'BusinessEventClass',
    'BusinessEventSensitivity',
    'ConditionalBusinessEventTypeTemplate',
    'BusinessEventDefinition',
    'BusinessEventRegistryMetadata',
    'from "./business-event.contract.js";',
  ];

  for (const marker of required) {
    assertIncludes(indexSource, marker, 'business-event index');
  }
}

function validateReadmes() {
  const eventsReadme = readText(
    eventsReadmePath,
    'events README',
  );

  for (const marker of [
    '# @vento/contracts/events',
    '`SHELL-CON-013::GLOBAL`',
    '`PROC-CAT-017`',
    '`BusinessEventId`',
    '395 definiciones normales',
    '69 procesos',
    '12 clases',
    '4 sensibilidades',
    '`VPROC-0003.EVT-005`',
    '`VPROC-0070.EVT-001`',
    '`BUSINESS_EVENT_IDS`',
    '`BUSINESS_EVENT_TYPES`',
    '`BUSINESS_EVENT_DEFINITIONS`',
    '`CONDITIONAL_BUSINESS_EVENT_TYPE_TEMPLATES`',
    '`isBusinessEventIdFormat()`',
    '`isBusinessEventId()`',
    '`assertBusinessEventId()`',
    '`SHELL-CON-014`',
    'No publica el subpath',
  ]) {
    assertIncludes(eventsReadme, marker, 'events README');
  }

  assertIncludesAny(
    eventsReadme,
    ['8 familias condicionales', 'ocho familias condicionales'],
    'events README',
    'ocho/8 familias condicionales',
  );

  const contractsReadme = readText(
    contractsReadmePath,
    '@vento/contracts README',
  );

  for (const marker of [
    '## Módulo de eventos empresariales',
    '`packages/contracts/events`',
    '`SHELL-CON-013::GLOBAL`',
    '`@vento/contracts/events`',
    '395 definiciones normales',
    '`BusinessEventId`',
    'no añade `exports` públicos',
    '`SHELL-CON-014`',
  ]) {
    assertIncludes(
      contractsReadme,
      marker,
      '@vento/contracts README',
    );
  }

  assertIncludesAny(
    contractsReadme,
    ['8 familias condicionales', 'ocho familias condicionales'],
    '@vento/contracts README',
    'ocho/8 familias condicionales',
  );
}

export function validateBusinessEventContracts() {
  const generated =
    generateBusinessEventContracts({ checkOnly: true });

  assertExactSequence(
    generated.processIds,
    expectedProcessIds(),
    'canonical ProcessId coverage',
  );

  assertExactSequence(
    generated.events.map(
      (entry) => entry.business_event_id,
    ),
    expectedBusinessEventIds(),
    'canonical BusinessEventId projection',
  );

  assertExactSequence(
    generated.conditionalTemplates,
    expectedConditionalTemplates,
    'canonical conditional templates',
  );

  validatePackageBoundary();

  const contractSource = readText(
    contractPath,
    'business-event contract',
  );
  const indexSource = readText(
    indexPath,
    'business-event index',
  );

  validateGeneratedContract(contractSource);
  validateGeneratedIndex(indexSource);
  validateReadmes();

  return {
    processes: generated.processIds.length,
    normalEvents: generated.events.length,
    conditionalTemplates: generated.conditionalTemplates.length,
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

    const result = validateBusinessEventContracts();

    console.log('[VENTO CONTRACTS] BUSINESS_EVENT_CONTRACTS PASS');
    console.log(
      `[VENTO CONTRACTS] NORMAL_EVENTS ${result.normalEvents}`,
    );
    console.log(
      `[VENTO CONTRACTS] PROCESSES ${result.processes}`,
    );
    console.log(
      `[VENTO CONTRACTS] CONDITIONAL_TEMPLATES ${result.conditionalTemplates}`,
    );
    console.log('[VENTO CONTRACTS] EVENT_CLASSES 12');
    console.log('[VENTO CONTRACTS] SENSITIVITIES 4');
    console.log('[VENTO CONTRACTS] MEMBERSHIP SYNTAX_AND_SET');
    console.log('[VENTO CONTRACTS] PROCESS_DEPENDENCY RECONCILED');
    console.log('[VENTO CONTRACTS] PUBLIC_EXPORTS NONE');
    console.log('[VENTO CONTRACTS] RUNTIME_EVENT_INFRA NONE');
    console.log('');
    console.log('=== RESULTADO PARA CHATGPT ===');
    console.log('ESTADO: PASS');
    console.log('VALIDACION: BUSINESS_EVENT_CONTRACTS');
    console.log(`NORMAL_EVENTS: ${result.normalEvents}`);
    console.log(`PROCESSES: ${result.processes}`);
    console.log(
      `CONDITIONAL_TEMPLATES: ${result.conditionalTemplates}`,
    );
    console.log('EVENT_CLASSES: 12');
    console.log('SENSITIVITIES: 4');
    console.log('PROCESS_DEPENDENCY: RECONCILED');
    console.log('PUBLIC_EXPORTS: NONE');
    console.log('RUNTIME_EVENT_INFRA: NONE');
    console.log('=== FIN RESULTADO PARA CHATGPT ===');
  } catch (error) {
    const message =
      error instanceof Error ? error.message : String(error);
    console.error('[VENTO CONTRACTS] BUSINESS_EVENT_CONTRACTS FAIL');
    console.error(message);
    console.error('');
    console.error('=== RESULTADO PARA CHATGPT ===');
    console.error('ESTADO: FAIL');
    console.error('VALIDACION: BUSINESS_EVENT_CONTRACTS');
    console.error(`ERROR: ${message}`);
    console.error('=== FIN RESULTADO PARA CHATGPT ===');
    process.exitCode = 1;
  }
}