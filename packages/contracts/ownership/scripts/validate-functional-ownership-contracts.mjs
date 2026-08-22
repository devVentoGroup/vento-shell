import fs from 'node:fs';
import path from 'node:path';
import { fileURLToPath } from 'node:url';

import {
  generateFunctionalOwnershipContracts,
} from './generate-functional-ownership-contracts.mjs';

const currentFile = fileURLToPath(import.meta.url);
const scriptDirectory = path.dirname(currentFile);
const ownershipRoot = path.resolve(scriptDirectory, '..');
const contractsRoot = path.resolve(ownershipRoot, '..');

const contractPath = path.join(
  ownershipRoot,
  'generated',
  'functional-ownership.contract.ts',
);
const indexPath = path.join(
  ownershipRoot,
  'generated',
  'index.ts',
);
const ownershipReadmePath = path.join(ownershipRoot, 'README.md');
const contractsReadmePath = path.join(contractsRoot, 'README.md');
const packageJsonPath = path.join(contractsRoot, 'package.json');

const expectedAppCodes = Object.freeze([
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

const expectedProcessOwnerDistribution = Object.freeze({
  shell: 0,
  anima: 1,
  viso: 20,
  nexo: 16,
  fogo: 6,
  origo: 4,
  pulso: 12,
  numera: 7,
  aura: 2,
  pass: 1,
});

const expectedSourceStatuses = Object.freeze([
  'OBJETIVO_FUERTE',
  'OBJETIVO_CON_FRONTERA',
  'OBJETIVO_DIVIDIDO',
  'OBJETIVO_DIFERIDO',
  'SIN_FUENTE_ADECUADA',
]);

const expectedRepresentationClasses = Object.freeze([
  'REFERENCE',
  'PROJECTION',
  'CONTROLLED_CACHE',
  'DERIVED_RESULT',
  'EVIDENCE_COPY',
]);

const expectedFamilies = Object.freeze(
  Array.from(
    { length: 18 },
    (_, index) => `CAP-${String(index + 1).padStart(2, '0')}`,
  ),
);

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

function assertExactSequence(actual, expected, label) {
  if (actual.length !== expected.length) {
    fail(`${label} must contain ${expected.length}; received ${actual.length}.`);
  }

  for (let index = 0; index < expected.length; index += 1) {
    if (actual[index] !== expected[index]) {
      fail(`${label} differs at position ${index + 1}.`);
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
    ...match[1].matchAll(/"([^"]+)"/g),
  ].map((entry) => entry[1]);
}

function validateGeneratedContract(contractSource) {
  for (const marker of [
    'Contract task: SHELL-CON-016',
    'Process authority: PROC-CAT-005 / PROC-APPLICATION-OWNERSHIP-REGISTRY-001',
    'Capability source authority: CAP-MAP-008',
    'Competing ownership evidence: CAP-MAP-013',
    'AppCode,',
    'ProcessId,',
    'FUNCTIONAL_OWNERSHIP_EFFECTIVE_VERSION',
    'FUNCTIONAL_OWNERSHIP_SOURCE_STATUSES',
    'FUNCTIONAL_OWNERSHIP_REPRESENTATION_CLASSES',
    'FUNCTIONAL_OWNERSHIP_CONCEPTUAL_DIMENSIONS',
    'export interface ProcessOwnershipProjection',
    'export const PROCESS_OWNERSHIP_PROJECTIONS = [',
    'export const PROCESS_OWNER_DISTRIBUTION = {',
    'export interface CapabilitySourceFamilyProjection',
    'export const CAPABILITY_SOURCE_FAMILY_PROJECTIONS = [',
    'export const COMPETING_FUNCTIONAL_OWNERSHIP_CASES = [',
    'subject_ref: "public.employee_shifts"',
    'current_competing_app_codes: ["viso", "anima"]',
    'target_owner_app_code: "viso"',
    'target_consumer_app_code: "anima"',
    'process_assignment_count: 69',
    'app_code_universe_count: 10',
    'assigned_process_owner_app_code_count: 9',
    'subcapacity_decision_count: 217',
    'capability_family_projection_count: 18',
    'source_status_count: 5',
    'representation_class_count: 5',
    'competing_ownership_case_count: 1',
    'capability_projection_model: "FAMILY_PLUS_EXCEPTION"',
    'flat_subcapacity_registry_materialized: false',
    'ownership_id_defined: false',
    'export function resolveProcessOwner(',
    'export function resolveCapabilitySource(',
    'resolution_status: "CANONICAL_DETAIL_REQUIRED"',
    'export function isCanonicalOwner(',
    '): boolean | null {',
    'export function assertOwnershipProjectionFresh(',
  ]) {
    assertIncludes(
      contractSource,
      marker,
      'functional ownership contract',
    );
  }

  assertExactSequence(
    extractStringArray(
      contractSource,
      'FUNCTIONAL_OWNERSHIP_SOURCE_STATUSES',
    ),
    expectedSourceStatuses,
    'FUNCTIONAL_OWNERSHIP_SOURCE_STATUSES',
  );

  assertExactSequence(
    extractStringArray(
      contractSource,
      'FUNCTIONAL_OWNERSHIP_REPRESENTATION_CLASSES',
    ),
    expectedRepresentationClasses,
    'FUNCTIONAL_OWNERSHIP_REPRESENTATION_CLASSES',
  );

  const processBlock = contractSource.match(
    /export const PROCESS_OWNERSHIP_PROJECTIONS = \[([\s\S]*?)\] as const satisfies readonly ProcessOwnershipProjection\[\];/,
  );

  if (!processBlock) {
    fail('PROCESS_OWNERSHIP_PROJECTIONS was not found.');
  }

  const processRows = [
    ...processBlock[1].matchAll(
      /process_id: "(VPROC-[0-9]{4})",[\s\S]*?owner_app_code: "([a-z]+)",/g,
    ),
  ].map((entry) => ({
    processId: entry[1],
    ownerAppCode: entry[2],
  }));

  if (processRows.length !== 69) {
    fail(
      `PROCESS_OWNERSHIP_PROJECTIONS must contain 69 rows; `
      + `received ${processRows.length}.`,
    );
  }

  if (new Set(processRows.map((entry) => entry.processId)).size !== 69) {
    fail('PROCESS_OWNERSHIP_PROJECTIONS contains duplicate ProcessId values.');
  }

  const distribution = Object.fromEntries(
    expectedAppCodes.map((appCode) => [appCode, 0]),
  );

  for (const row of processRows) {
    if (!Object.hasOwn(distribution, row.ownerAppCode)) {
      fail('PROCESS_OWNERSHIP_PROJECTIONS contains unknown AppCode.');
    }

    distribution[row.ownerAppCode] += 1;
  }

  for (const appCode of expectedAppCodes) {
    if (
      distribution[appCode]
      !== expectedProcessOwnerDistribution[appCode]
    ) {
      fail(`Generated process owner distribution mismatch for ${appCode}.`);
    }
  }

  const capabilityBlock = contractSource.match(
    /export const CAPABILITY_SOURCE_FAMILY_PROJECTIONS = \[([\s\S]*?)\] as const satisfies readonly CapabilitySourceFamilyProjection\[\];/,
  );

  if (!capabilityBlock) {
    fail('CAPABILITY_SOURCE_FAMILY_PROJECTIONS was not found.');
  }

  const capabilityRows = [
    ...capabilityBlock[1].matchAll(
      /family_ref: "(CAP-[0-9]{2})",[\s\S]*?source_status: "(OBJETIVO_[A-Z_]+|SIN_FUENTE_ADECUADA)",/g,
    ),
  ].map((entry) => ({
    familyRef: entry[1],
    sourceStatus: entry[2],
  }));

  if (capabilityRows.length !== 18) {
    fail(
      `CAPABILITY_SOURCE_FAMILY_PROJECTIONS must contain 18 rows; `
      + `received ${capabilityRows.length}.`,
    );
  }

  assertExactSequence(
    capabilityRows.map((entry) => entry.familyRef),
    expectedFamilies,
    'generated capability family sequence',
  );

  for (const row of capabilityRows) {
    if (!expectedSourceStatuses.includes(row.sourceStatus)) {
      fail('Generated capability projection contains unknown source status.');
    }
  }

  for (const [pattern, forbiddenLabel] of [
    [/\bownership_id\s*:/u, 'ownership_id:'],
    [/\bOWNERSHIP_IDS\b/u, 'OWNERSHIP_IDS'],
    [/\bOWNERSHIP_ID_PATTERN\b/u, 'OWNERSHIP_ID_PATTERN'],
    [/\bexport\s+type\s+OwnershipId\b/u, 'export type OwnershipId'],
    [/\bSUBCAPABILITY_OWNERSHIP_PROJECTIONS\b/u, 'SUBCAPABILITY_OWNERSHIP_PROJECTIONS'],
    [/\bcreateClient\s*\(/u, 'createClient('],
    [/\bfetch\s*\(/u, 'fetch('],
    [/\bfrom\s+["']@supabase\//u, '@supabase import'],
    [/\bservice_role\b/u, 'service_role'],
    [/\bexport\s+(?:async\s+)?function\s+(?:write|mutate|update|delete|create|apply)Ownership\b/iu, 'runtime ownership mutation'],
    [/\b(?:outbox|inbox|webhook|broker|topic|queue)_client\b/iu, 'runtime transport client'],
  ]) {
    assertDoesNotMatch(
      contractSource,
      pattern,
      'functional ownership contract',
      forbiddenLabel,
    );
  }

  if (
    !contractSource.includes(
      'resolution_status: "CANONICAL_DETAIL_REQUIRED"',
    )
  ) {
    fail('Capability detail resolution is not fail-closed.');
  }
}

function validateGeneratedIndex(indexSource) {
  for (const marker of [
    'CAPABILITY_SOURCE_FAMILY_PROJECTIONS',
    'COMPETING_FUNCTIONAL_OWNERSHIP_CASES',
    'FUNCTIONAL_OWNERSHIP_CONCEPTUAL_DIMENSIONS',
    'FUNCTIONAL_OWNERSHIP_EFFECTIVE_VERSION',
    'FUNCTIONAL_OWNERSHIP_REGISTRY_METADATA',
    'FUNCTIONAL_OWNERSHIP_REPRESENTATION_CLASSES',
    'FUNCTIONAL_OWNERSHIP_SOURCE_STATUSES',
    'PROCESS_OWNER_DISTRIBUTION',
    'PROCESS_OWNERSHIP_PROJECTIONS',
    'assertOwnershipProjectionFresh',
    'isCanonicalOwner',
    'resolveCapabilitySource',
    'resolveProcessOwner',
    'CapabilitySourceResolution',
    'ProcessOwnershipProjection',
    'from "./functional-ownership.contract.js";',
  ]) {
    assertIncludes(
      indexSource,
      marker,
      'functional ownership generated index',
    );
  }
}

function validatePackageBoundary() {
  const packageJson = JSON.parse(
    readText(packageJsonPath, '@vento/contracts package.json'),
  );

  if (packageJson.name !== '@vento/contracts') {
    fail('@vento/contracts package name changed.');
  }

  if (packageJson.version !== '1.0.0-alpha.1') {
    fail('@vento/contracts version changed during SHELL-CON-016.');
  }

  if (packageJson.private !== true) {
    fail('@vento/contracts must remain private.');
  }

  if (Object.hasOwn(packageJson, 'exports')) {
    fail('@vento/contracts must not add public exports in SHELL-CON-016.');
  }
}

function validateReadmes() {
  const ownershipReadme = readText(
    ownershipReadmePath,
    'ownership README',
  );
  const contractsReadme = readText(
    contractsReadmePath,
    '@vento/contracts README',
  );

  for (const marker of [
    '# @vento/contracts/ownership',
    '`SHELL-CON-016::GLOBAL`',
    '`PRE_E5_FOUNDATION`',
    '69 asignaciones',
    '10 `AppCode`',
    '9',
    '217 decisiones',
    '18 familias',
    '5 estados',
    '`ownership_id`',
    '`PROC-CAT-005`',
    '`CAP-MAP-008`',
    '`CAP-MAP-013`',
    '`public.employee_shifts`',
    '`REFERENCE`',
    '`PROJECTION`',
    '`CONTROLLED_CACHE`',
    '`DERIVED_RESULT`',
    '`EVIDENCE_COPY`',
    '`resolveProcessOwner()`',
    '`resolveCapabilitySource()`',
    '`isCanonicalOwner()`',
    '`assertOwnershipProjectionFresh()`',
    '`SHELL-CON-017`',
  ]) {
    assertIncludes(
      ownershipReadme,
      marker,
      'ownership README',
    );
  }

  for (const marker of [
    '## Módulo de propiedad funcional',
    '`SHELL-CON-016::GLOBAL`',
    '`packages/contracts/ownership`',
    '`@vento/contracts/ownership`',
    '69 asignaciones',
    '217 decisiones',
    '18 familias',
    '5 estados',
    '`public.employee_shifts`',
    '`SHELL-CON-017`',
  ]) {
    assertIncludes(
      contractsReadme,
      marker,
      '@vento/contracts README',
    );
  }

  for (const predecessorMarker of [
    '## Módulo de procesos',
    '`SHELL-CON-011`',
    '## Módulo de pantallas',
    '## Módulo de acciones funcionales',
    '`SHELL-CON-013`',
    '## Módulo de eventos empresariales',
    '`SHELL-CON-014`',
    '395 definiciones normales',
    '## Módulo de traspasos entre aplicaciones',
    '`SHELL-CON-015`',
    '49 relaciones',
    '## Módulo de ítems de trabajo',
    '`SHELL-CON-016`',
    '29 campos contractuales',
  ]) {
    assertIncludes(
      contractsReadme,
      predecessorMarker,
      '@vento/contracts README',
    );
  }
}

export function validateFunctionalOwnershipContracts() {
  const generated = generateFunctionalOwnershipContracts({
    checkOnly: true,
  });

  if (
    generated.processAssignments !== 69
    || generated.appCodeUniverse !== 10
    || generated.assignedProcessOwnerCodes !== 9
    || generated.subcapacityDecisions !== 217
    || generated.capabilityFamilies !== 18
    || generated.sourceStatuses !== 5
    || generated.representationClasses !== 5
    || generated.competingOwnershipCases !== 1
  ) {
    fail('Generator reconciliation returned an unexpected ownership shape.');
  }

  const contractSource = readText(
    contractPath,
    'functional ownership contract',
  );
  const indexSource = readText(
    indexPath,
    'functional ownership generated index',
  );

  validateGeneratedContract(contractSource);
  validateGeneratedIndex(indexSource);
  validatePackageBoundary();
  validateReadmes();

  return generated;
}

function runCli() {
  const unknown = process.argv.slice(2);

  try {
    if (unknown.length > 0) {
      fail(`Unknown arguments: ${unknown.join(', ')}`);
    }

    const result = validateFunctionalOwnershipContracts();

    console.log('[VENTO CONTRACTS] FUNCTIONAL_OWNERSHIP_CONTRACTS PASS');
    console.log(
      `[VENTO CONTRACTS] PROCESS_ASSIGNMENTS `
      + `${result.processAssignments}`,
    );
    console.log(
      `[VENTO CONTRACTS] APP_CODE_UNIVERSE `
      + `${result.appCodeUniverse}`,
    );
    console.log(
      `[VENTO CONTRACTS] ASSIGNED_PROCESS_OWNER_CODES `
      + `${result.assignedProcessOwnerCodes}`,
    );
    console.log(
      `[VENTO CONTRACTS] SUBCAPACITY_DECISIONS `
      + `${result.subcapacityDecisions}`,
    );
    console.log(
      `[VENTO CONTRACTS] CAPABILITY_FAMILIES `
      + `${result.capabilityFamilies}`,
    );
    console.log(
      `[VENTO CONTRACTS] SOURCE_STATUSES `
      + `${result.sourceStatuses}`,
    );
    console.log(
      `[VENTO CONTRACTS] REPRESENTATION_CLASSES `
      + `${result.representationClasses}`,
    );
    console.log(
      `[VENTO CONTRACTS] COMPETING_OWNERSHIP_CASES `
      + `${result.competingOwnershipCases}`,
    );
    console.log('[VENTO CONTRACTS] OWNERSHIP_ID NONE');
    console.log('[VENTO CONTRACTS] FLAT_SUBCAPABILITY_REGISTRY NONE');
    console.log('[VENTO CONTRACTS] PUBLIC_EXPORTS NONE');
    console.log('[VENTO CONTRACTS] RUNTIME_OWNERSHIP_INFRA NONE');
    console.log('');
    console.log('=== RESULTADO PARA CHATGPT ===');
    console.log('ESTADO: PASS');
    console.log('VALIDACION: FUNCTIONAL_OWNERSHIP_CONTRACTS');
    console.log(
      `PROCESS_ASSIGNMENTS: ${result.processAssignments}`,
    );
    console.log(`APP_CODE_UNIVERSE: ${result.appCodeUniverse}`);
    console.log(
      `ASSIGNED_PROCESS_OWNER_CODES: `
      + `${result.assignedProcessOwnerCodes}`,
    );
    console.log(
      `SUBCAPACITY_DECISIONS: ${result.subcapacityDecisions}`,
    );
    console.log(
      `CAPABILITY_FAMILIES: ${result.capabilityFamilies}`,
    );
    console.log(`SOURCE_STATUSES: ${result.sourceStatuses}`);
    console.log(
      `REPRESENTATION_CLASSES: ${result.representationClasses}`,
    );
    console.log(
      `COMPETING_OWNERSHIP_CASES: `
      + `${result.competingOwnershipCases}`,
    );
    console.log('OWNERSHIP_ID: NONE');
    console.log('FLAT_SUBCAPABILITY_REGISTRY: NONE');
    console.log('PUBLIC_EXPORTS: NONE');
    console.log('RUNTIME_OWNERSHIP_INFRA: NONE');
    console.log('=== FIN RESULTADO PARA CHATGPT ===');
  } catch (error) {
    const message =
      error instanceof Error ? error.message : String(error);

    console.error('[VENTO CONTRACTS] FUNCTIONAL_OWNERSHIP_CONTRACTS FAIL');
    console.error(message);
    console.error('');
    console.error('=== RESULTADO PARA CHATGPT ===');
    console.error('ESTADO: FAIL');
    console.error('VALIDACION: FUNCTIONAL_OWNERSHIP_CONTRACTS');
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