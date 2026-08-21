import fs from 'node:fs';
import path from 'node:path';
import { fileURLToPath } from 'node:url';

import {
  generateHandoffContracts,
} from './generate-handoff-contracts.mjs';

const currentFile = fileURLToPath(import.meta.url);
const scriptDirectory = path.dirname(currentFile);
const handoffsRoot = path.resolve(scriptDirectory, '..');
const contractsRoot = path.resolve(handoffsRoot, '..');

const contractPath = path.join(
  handoffsRoot,
  'generated',
  'application-handoff-relation.contract.ts',
);
const indexPath = path.join(
  handoffsRoot,
  'generated',
  'index.ts',
);
const handoffsReadmePath = path.join(handoffsRoot, 'README.md');
const contractsReadmePath = path.join(contractsRoot, 'README.md');
const packageJsonPath = path.join(contractsRoot, 'package.json');

const expectedProcesses = Object.freeze([
  'VPROC-0005',
  'VPROC-0006',
  'VPROC-0007',
  'VPROC-0009',
  'VPROC-0011',
  'VPROC-0059',
  'VPROC-0065',
  'VPROC-0066',
]);

const expectedParticipants = Object.freeze([
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

const expectedRelationCount = 49;
const expectedDirectCount = 27;
const expectedConditionalCount = 22;

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

function assertIncludes(source, expected, label) {
  if (!source.includes(expected)) {
    fail(`${label} is missing required content: ${expected}`);
  }
}

function assertDoesNotMatch(source, pattern, label, forbiddenLabel) {
  if (pattern.test(source)) {
    fail(`${label} contains forbidden content: ${forbiddenLabel}`);
  }
}

function assertExactSet(actual, expected, label) {
  const left = [...new Set(actual)].sort();
  const right = [...new Set(expected)].sort();

  if (
    left.length !== right.length
    || left.some((value, index) => value !== right[index])
  ) {
    fail(
      `${label} mismatch: expected ${right.join(',')}; `
      + `received ${left.join(',')}.`,
    );
  }
}

function parseGeneratedRelations(contractSource) {
  const pattern =
    /\{\s*process_id: "(VPROC-[0-9]{4})",\s*owner_application: "([a-z]+)",\s*participant_application: "([a-z]+)",\s*participation_class: "(DIRECTA|CONDICIONAL)",\s*consumer_mode: "SOLICITUD_HANDOFF_Y_EVENTO",\s*integration_profile: "HANDOFF_PROJECTION",\s*exchange_family: "HANDOFF_REQUEST",\s*\}/g;

  return [...contractSource.matchAll(pattern)].map((match) => ({
    processId: match[1],
    ownerApplication: match[2],
    participantApplication: match[3],
    participationClass: match[4],
  }));
}

function validateGeneratedContract(contractSource) {
  const requiredMarkers = [
    'import type {',
    'AppCode,',
    'ProcessId,',
    'export interface ApplicationHandoffRelation',
    'readonly process_id: ProcessId;',
    'readonly owner_application: AppCode;',
    'readonly participant_application: AppCode;',
    'export const HANDOFF_CONSUMER_MODE =',
    '"SOLICITUD_HANDOFF_Y_EVENTO" as const;',
    'export const HANDOFF_INTEGRATION_PROFILE =',
    '"HANDOFF_PROJECTION" as const;',
    'export const HANDOFF_EXCHANGE_FAMILY =',
    '"HANDOFF_REQUEST" as const;',
    'export const APPLICATION_HANDOFF_RELATIONS = [',
    'relation_identity:',
    '"ProcessId + owner_application + participant_application"',
    'relation_count: 49,',
    'direct_count: 27,',
    'conditional_count: 22,',
    'process_count: 8,',
    'participant_application_count: 9,',
    'export function isApplicationHandoffRelation(',
    'export function getApplicationHandoffRelation(',
    'export function getApplicationHandoffRelationsForProcess(',
  ];

  for (const marker of requiredMarkers) {
    assertIncludes(
      contractSource,
      marker,
      'application-handoff relation contract',
    );
  }

  const forbiddenRuntimeProperties = [
    [/(?:^|[^A-Za-z0-9_])process_instance_id\s*:/mu, 'process_instance_id:'],
    [/(?:^|[^A-Za-z0-9_])resource_id\s*:/mu, 'resource_id:'],
    [/(?:^|[^A-Za-z0-9_])actor_id\s*:/mu, 'actor_id:'],
    [/(?:^|[^A-Za-z0-9_])site_id\s*:/mu, 'site_id:'],
    [/(?:^|[^A-Za-z0-9_])area_id\s*:/mu, 'area_id:'],
    [/(?:^|[^A-Za-z0-9_])process_state_id\s*:/mu, 'process_state_id:'],
    [/(?:^|[^A-Za-z0-9_])functional_action_id\s*:/mu, 'functional_action_id:'],
    [/(?:^|[^A-Za-z0-9_])return_destination\s*:/mu, 'return_destination:'],
    [/(?:^|[^A-Za-z0-9_])correlation_id\s*:/mu, 'correlation_id:'],
    [/(?:^|[^A-Za-z0-9_])causation_id\s*:/mu, 'causation_id:'],
    [/(?:^|[^A-Za-z0-9_])idempotency_key\s*:/mu, 'idempotency_key:'],
    [/(?:^|[^A-Za-z0-9_])deep_link\s*:/mu, 'deep_link:'],
    [/(?:^|[^A-Za-z0-9_])url\s*:/mu, 'url:'],
    [/(?:^|[^A-Za-z0-9_])topic\s*:/mu, 'topic:'],
    [/(?:^|[^A-Za-z0-9_])queue\s*:/mu, 'queue:'],
    [/(?:^|[^A-Za-z0-9_])outbox\s*:/mu, 'outbox:'],
    [/(?:^|[^A-Za-z0-9_])inbox\s*:/mu, 'inbox:'],
    [/(?:^|[^A-Za-z0-9_])webhook\s*:/mu, 'webhook:'],
    [/(?:^|[^A-Za-z0-9_])rpc\s*:/mu, 'rpc:'],
  ];

  for (const [pattern, forbiddenLabel] of forbiddenRuntimeProperties) {
    assertDoesNotMatch(
      contractSource,
      pattern,
      'application-handoff relation contract',
      forbiddenLabel,
    );
  }

  assertDoesNotMatch(
    contractSource,
    /(?:^|[^A-Za-z0-9_])handoff_relation_id\s*:/mu,
    'application-handoff relation contract',
    'handoff_relation_id:',
  );

  const relations = parseGeneratedRelations(contractSource);

  if (relations.length !== expectedRelationCount) {
    fail(
      `Generated handoff relation count must be ${expectedRelationCount}; `
      + `received ${relations.length}.`,
    );
  }

  const keys = relations.map((relation) =>
    JSON.stringify([
      relation.processId,
      relation.ownerApplication,
      relation.participantApplication,
    ]),
  );

  if (new Set(keys).size !== expectedRelationCount) {
    fail('Generated handoff relations contain duplicate tuples.');
  }

  const directCount = relations.filter(
    (relation) => relation.participationClass === 'DIRECTA',
  ).length;
  const conditionalCount = relations.filter(
    (relation) => relation.participationClass === 'CONDICIONAL',
  ).length;

  if (directCount !== expectedDirectCount) {
    fail(
      `Generated DIRECTA count must be ${expectedDirectCount}; `
      + `received ${directCount}.`,
    );
  }

  if (conditionalCount !== expectedConditionalCount) {
    fail(
      `Generated CONDICIONAL count must be ${expectedConditionalCount}; `
      + `received ${conditionalCount}.`,
    );
  }

  assertExactSet(
    relations.map((relation) => relation.processId),
    expectedProcesses,
    'generated handoff ProcessId set',
  );

  assertExactSet(
    relations.map((relation) => relation.participantApplication),
    expectedParticipants,
    'generated participant AppCode set',
  );

  assertExactSet(
    relations.map((relation) => relation.ownerApplication),
    ['viso'],
    'generated owner AppCode set',
  );

  if (
    relations.some(
      (relation) =>
        relation.ownerApplication === relation.participantApplication,
    )
  ) {
    fail('Generated handoff relations contain owner=participant.');
  }

  return relations;
}

function validateIndex(indexSource) {
  const requiredMarkers = [
    'APPLICATION_HANDOFF_RELATIONS',
    'APPLICATION_HANDOFF_PROCESS_IDS',
    'APPLICATION_HANDOFF_PARTICIPANT_CODES',
    'APPLICATION_HANDOFF_REGISTRY_METADATA',
    'HANDOFF_CONSUMER_MODE',
    'HANDOFF_INTEGRATION_PROFILE',
    'HANDOFF_EXCHANGE_FAMILY',
    'isApplicationHandoffRelation',
    'getApplicationHandoffRelation',
    'getApplicationHandoffRelationsForProcess',
    'ApplicationHandoffRelation',
    './application-handoff-relation.contract.js',
  ];

  for (const marker of requiredMarkers) {
    assertIncludes(indexSource, marker, 'handoff generated index');
  }
}

function validatePackageBoundary() {
  const packageJson = JSON.parse(
    readText(packageJsonPath, '@vento/contracts package.json'),
  );

  if (packageJson.name !== '@vento/contracts') {
    fail('@vento/contracts package name changed.');
  }

  if (packageJson.private !== true) {
    fail('@vento/contracts must remain private.');
  }

  if (Object.hasOwn(packageJson, 'exports')) {
    fail('@vento/contracts must not add public exports in SHELL-CON-014.');
  }
}

function validateReadmes() {
  const handoffsReadme = readText(
    handoffsReadmePath,
    'handoffs README',
  );
  const contractsReadme = readText(
    contractsReadmePath,
    '@vento/contracts README',
  );

  for (const marker of [
    'SHELL-CON-014::GLOBAL',
    'PRE_E5_FOUNDATION',
    '@vento/contracts/handoffs',
    '49 relaciones',
    '27 directas',
    '22 condicionales',
    '8 procesos',
    '9 aplicaciones participantes',
    'ProcessId + owner_application + participant_application',
    'SOLICITUD_HANDOFF_Y_EVENTO',
    'HANDOFF_PROJECTION',
    'HANDOFF_REQUEST',
    'no crea un identificador serializado paralelo',
    'no implementa el payload runtime',
    'SHELL-CON-015',
  ]) {
    assertIncludes(handoffsReadme, marker, 'handoffs README');
  }

  for (const marker of [
    '## Módulo de traspasos entre aplicaciones',
    'SHELL-CON-014::GLOBAL',
    'packages/contracts/handoffs',
    '49 relaciones',
    '27 directas',
    '22 condicionales',
    '8 procesos',
    '9 aplicaciones participantes',
    'HANDOFF_PROJECTION',
    'HANDOFF_REQUEST',
  ]) {
    assertIncludes(
      contractsReadme,
      marker,
      '@vento/contracts README',
    );
  }
}

export function validateHandoffContracts() {
  const generated = generateHandoffContracts({ checkOnly: true });
  const contractSource = readText(
    contractPath,
    'application-handoff relation contract',
  );
  const indexSource = readText(indexPath, 'handoff generated index');

  const relations = validateGeneratedContract(contractSource);
  validateIndex(indexSource);
  validatePackageBoundary();
  validateReadmes();

  if (generated.relationCount !== expectedRelationCount) {
    fail('Generator reconciliation returned the wrong relation count.');
  }

  return {
    relationCount: relations.length,
    directCount: relations.filter(
      (relation) => relation.participationClass === 'DIRECTA',
    ).length,
    conditionalCount: relations.filter(
      (relation) => relation.participationClass === 'CONDICIONAL',
    ).length,
    processCount: new Set(
      relations.map((relation) => relation.processId),
    ).size,
    participantCount: new Set(
      relations.map((relation) => relation.participantApplication),
    ).size,
  };
}

function runCli() {
  try {
    const result = validateHandoffContracts();

    console.log('[VENTO CONTRACTS] HANDOFF_CONTRACTS PASS');
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
    console.log('[VENTO CONTRACTS] APP_CODE_DEPENDENCY RECONCILED');
    console.log('[VENTO CONTRACTS] PROCESS_ID_DEPENDENCY RECONCILED');
    console.log('[VENTO CONTRACTS] PUBLIC_EXPORTS NONE');
    console.log('[VENTO CONTRACTS] RUNTIME_HANDOFF_INFRA NONE');
    console.log('');
    console.log('=== RESULTADO PARA CHATGPT ===');
    console.log('ESTADO: PASS');
    console.log('VALIDACION: HANDOFF_CONTRACTS');
    console.log(`RELATIONS: ${result.relationCount}`);
    console.log(`DIRECT: ${result.directCount}`);
    console.log(`CONDITIONAL: ${result.conditionalCount}`);
    console.log(`PROCESSES: ${result.processCount}`);
    console.log(`PARTICIPANTS: ${result.participantCount}`);
    console.log('APP_CODE_DEPENDENCY: RECONCILED');
    console.log('PROCESS_ID_DEPENDENCY: RECONCILED');
    console.log('PUBLIC_EXPORTS: NONE');
    console.log('RUNTIME_HANDOFF_INFRA: NONE');
    console.log('=== FIN RESULTADO PARA CHATGPT ===');
  } catch (error) {
    const message =
      error instanceof Error ? error.message : String(error);

    console.error('[VENTO CONTRACTS] HANDOFF_CONTRACTS FAIL');
    console.error(message);
    console.error('');
    console.error('=== RESULTADO PARA CHATGPT ===');
    console.error('ESTADO: FAIL');
    console.error('VALIDACION: HANDOFF_CONTRACTS');
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