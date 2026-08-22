import fs from 'node:fs';
import path from 'node:path';
import { fileURLToPath } from 'node:url';

const currentFile = fileURLToPath(import.meta.url);
const scriptDirectory = path.dirname(currentFile);
const ownershipRoot = path.resolve(scriptDirectory, '..');
const contractsRoot = path.resolve(ownershipRoot, '..');
const repositoryRoot = path.resolve(ownershipRoot, '../../..');

const shellContractSourcePath = path.join(
  repositoryRoot,
  'docs',
  'plan-canonico',
  'modular',
  'bloques',
  'H_FUNDACION_COMPARTIDA',
  '03_CONTRATOS_COMPARTIDOS.md',
);

const processOwnershipSourcePath = path.join(
  repositoryRoot,
  'docs',
  'plan-canonico',
  'modular',
  'bloques',
  'E2_PROCESOS_Y_EXPERIENCIA',
  '01_02_PROPOSITO_PROPIEDAD_CONSUMIDORES_Y_ACTORES.md',
);

const capabilitySourcePath = path.join(
  repositoryRoot,
  'docs',
  'plan-canonico',
  'modular',
  'bloques',
  'E1_DESCUBRIMIENTO_OPERATIVO',
  '03_03_INFORMACION_EVENTOS_CONTROLES_Y_SUPERFICIES.md',
);

const competingOwnershipSourcePath = path.join(
  repositoryRoot,
  'docs',
  'plan-canonico',
  'modular',
  'bloques',
  'E1_DESCUBRIMIENTO_OPERATIVO',
  '03_04_CLASIFICACION_BRECHAS_Y_APROBACION.md',
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

const generatedDirectory = path.join(ownershipRoot, 'generated');
const contractPath = path.join(
  generatedDirectory,
  'functional-ownership.contract.ts',
);
const indexPath = path.join(generatedDirectory, 'index.ts');

const sourceContractSha256 =
  '2c25fe22efaae43ace4f90d029d320bc60265760b6217378fa71b48f72e965b3';

const effectiveVersion =
  `sha256:${sourceContractSha256}`;

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

const expectedCapabilityFamilies = Object.freeze(
  Array.from(
    { length: 18 },
    (_, index) => `CAP-${String(index + 1).padStart(2, '0')}`,
  ),
);

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

const expectedConceptualDimensions = Object.freeze([
  'subject_kind',
  'subject_ref',
  'owner_app_code',
  'authority_ref',
  'ownership_scope',
  'source_status',
  'boundary_ref',
  'effective_version',
  'supersedes_ref',
]);

const expectedProcessCount = 69;
const expectedSubcapacityDecisionCount = 217;
const expectedCapabilityFamilyCount = 18;
const expectedCompetingOwnershipCaseCount = 1;
const expectedAssignedProcessOwnerCodeCount = 9;

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
  const escapedTaskId = escapeRegExp(taskId);
  const taskHeadingPattern = new RegExp(
    `^###\\s+(?:✅\\s+|🟡\\s+|❌\\s+)?${escapedTaskId}\\s+—\\s+[^\\n]+$`,
    'm',
  );
  const startMatch = source.match(taskHeadingPattern);

  if (!startMatch || startMatch.index === undefined) {
    fail(`Canonical task heading ${taskId} not found.`);
  }

  const start = startMatch.index;
  const tailStart = start + startMatch[0].length;
  const tail = source.slice(tailStart);
  const nextTaskMatch = tail.match(
    /^###\s+(?:✅\s+|🟡\s+|❌\s+)?[A-Z0-9]+(?:-[A-Z0-9]+)*-[0-9]{3,4}\s+—\s+[^\n]+$/m,
  );

  if (!nextTaskMatch || nextTaskMatch.index === undefined) {
    return source.slice(start);
  }

  return source.slice(start, tailStart + nextTaskMatch.index);
}
function extractNumberedSubsection(task, subsectionNumber) {
  const startPattern = new RegExp(
    `^#### ${subsectionNumber}\\. [^\\n]+$`,
    'm',
  );
  const startMatch = task.match(startPattern);

  if (!startMatch || startMatch.index === undefined) {
    fail(`Subsection ${subsectionNumber} not found.`);
  }

  const start = startMatch.index;
  const tailStart = start + startMatch[0].length;
  const tail = task.slice(tailStart);
  const nextMatch = tail.match(/^#### [0-9]+\. [^\n]+$/m);

  if (!nextMatch || nextMatch.index === undefined) {
    return task.slice(start);
  }

  return task.slice(start, tailStart + nextMatch.index);
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
        `${label} differs at position ${index + 1}.`,
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
    fail('Physical AppCode catalog is missing.');
  }

  let applications;

  try {
    applications = JSON.parse(fs.readFileSync(applicationsPath, 'utf8'));
  } catch {
    fail('Physical AppCode catalog is invalid JSON.');
  }

  if (!Array.isArray(applications)) {
    fail('Physical AppCode catalog must be an array.');
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

  return {
    ids,
    set: new Set(ids),
  };
}

function validateOwnerTask(source) {
  const task = extractTaskSection(source, 'SHELL-CON-016');

  for (const marker of [
    '@vento/contracts/ownership',
    'ownership_id nuevo = NO REQUERIDO',
    '69 ProcessId',
    '217 subcapacidades',
    'OBJETIVO_FUERTE',
    'OBJETIVO_CON_FRONTERA',
    'OBJETIVO_DIVIDIDO',
    'OBJETIVO_DIFERIDO',
    'SIN_FUENTE_ADECUADA',
    'REFERENCE',
    'PROJECTION',
    'CONTROLLED_CACHE',
    'DERIVED_RESULT',
    'EVIDENCE_COPY',
    'public.employee_shifts',
    'resolveProcessOwner(ProcessId)',
    'resolveCapabilitySource(capability_ref)',
    'isCanonicalOwner(AppCode, subject_ref)',
    'assertOwnershipProjectionFresh(subject_ref, effective_version)',
    'NO GENERA REQUISITOS DE PRUEBA',
    'SHELL-CON-017',
  ]) {
    if (!task.includes(marker)) {
      fail(
        `SHELL-CON-016 is missing required contractual marker: ${marker}`,
      );
    }
  }
}

function parseProcessOwnership(source, appCodes, processIds) {
  const task = extractTaskSection(source, 'PROC-CAT-005');
  const registry = extractNumberedSubsection(task, 8);
  const projections = [];

  for (const line of registry.split('\n')) {
    const cells = splitMarkdownRow(line);

    if (
      cells.length >= 7
      && /^VPROC-[0-9]{4}$/.test(cells[0] ?? '')
      && appCodes.has(cells[3] ?? '')
      && /^ASIGNADA(?:_|$)/.test(cells[4] ?? '')
    ) {
      projections.push({
        process_id: cells[0],
        owner_app_code: cells[3],
        authority_ref: 'PROC-CAT-005',
        ownership_scope: 'RESULTADO_PRINCIPAL_DEL_PROCESO',
        effective_version: effectiveVersion,
        compatibility_status: 'RECONCILED',
      });
    }
  }

  if (projections.length !== expectedProcessCount) {
    fail(
      `PROC-CAT-005 must expose ${expectedProcessCount} process owners; `
      + `received ${projections.length}.`,
    );
  }

  assertExactSequence(
    projections.map((entry) => entry.process_id),
    processIds.ids,
    'PROC-CAT-005 ProcessId sequence',
  );

  const distribution = Object.fromEntries(
    expectedApplicationCodes.map((appCode) => [appCode, 0]),
  );

  for (const projection of projections) {
    if (!processIds.set.has(projection.process_id)) {
      fail('PROC-CAT-005 references a ProcessId outside the physical registry.');
    }

    if (!appCodes.has(projection.owner_app_code)) {
      fail('PROC-CAT-005 references an AppCode outside the physical catalog.');
    }

    distribution[projection.owner_app_code] += 1;
  }

  for (const appCode of expectedApplicationCodes) {
    if (
      distribution[appCode]
      !== expectedProcessOwnerDistribution[appCode]
    ) {
      fail(`PROC-CAT-005 owner distribution mismatch for ${appCode}.`);
    }
  }

  const assignedOwnerCodes = Object.entries(distribution)
    .filter(([, count]) => count > 0)
    .map(([appCode]) => appCode);

  if (
    assignedOwnerCodes.length
    !== expectedAssignedProcessOwnerCodeCount
  ) {
    fail('Unexpected count of AppCode values assigned as process owners.');
  }

  return {
    projections,
    distribution,
    assignedOwnerCodes,
  };
}

function parseCapabilitySources(source) {
  const task = extractTaskSection(source, 'CAP-MAP-008');
  const objectiveMap = extractNumberedSubsection(task, 8);
  const projections = [];

  for (const line of objectiveMap.split('\n')) {
    const cells = splitMarkdownRow(line);
    const familyMatch = /^(CAP-[0-9]{2})\b/.exec(cells[0] ?? '');

    if (
      cells.length >= 4
      && familyMatch
      && expectedSourceStatuses.includes(cells[2] ?? '')
    ) {
      projections.push({
        family_ref: familyMatch[1],
        source_target: cells[1],
        source_status: cells[2],
        boundary_ref: cells[3],
        authority_ref: 'CAP-MAP-008',
        projection_granularity: 'FAMILY_BASE',
        effective_version: effectiveVersion,
      });
    }
  }

  if (projections.length !== expectedCapabilityFamilyCount) {
    fail(
      `CAP-MAP-008 must expose ${expectedCapabilityFamilyCount} `
      + `family projections; received ${projections.length}.`,
    );
  }

  assertExactSequence(
    projections.map((entry) => entry.family_ref),
    expectedCapabilityFamilies,
    'CAP-MAP-008 family sequence',
  );

  for (const marker of [
    '217 subcapacidades',
    'fuente base de la familia',
    'excepción de la subcapacidad',
    'OBJETIVO_FUERTE',
    'OBJETIVO_CON_FRONTERA',
    'OBJETIVO_DIVIDIDO',
    'OBJETIVO_DIFERIDO',
    'SIN_FUENTE_ADECUADA',
  ]) {
    if (!task.includes(marker)) {
      fail('CAP-MAP-008 is missing a required ownership-source marker.');
    }
  }

  return projections;
}

function validateCompetingOwnership(source) {
  const task = extractTaskSection(source, 'CAP-MAP-013');

  for (const marker of [
    'employee_shifts',
    'VISO',
    'ANIMA',
    'VISO publica o corrige el turno',
    'ANIMA lo consulta',
    'ANIMA no mantiene una segunda edición independiente',
  ]) {
    if (!task.includes(marker)) {
      fail('CAP-MAP-013 competing-ownership evidence is incomplete.');
    }
  }
}

function renderProcessProjection(entry) {
  return [
    '  {',
    `    process_id: ${JSON.stringify(entry.process_id)},`,
    `    owner_app_code: ${JSON.stringify(entry.owner_app_code)},`,
    `    authority_ref: ${JSON.stringify(entry.authority_ref)},`,
    `    ownership_scope: ${JSON.stringify(entry.ownership_scope)},`,
    `    effective_version: FUNCTIONAL_OWNERSHIP_EFFECTIVE_VERSION,`,
    `    compatibility_status: ${JSON.stringify(entry.compatibility_status)},`,
    '  },',
  ].join('\n');
}

function renderCapabilityProjection(entry) {
  return [
    '  {',
    `    family_ref: ${JSON.stringify(entry.family_ref)},`,
    `    source_target: ${JSON.stringify(entry.source_target)},`,
    `    source_status: ${JSON.stringify(entry.source_status)},`,
    `    boundary_ref: ${JSON.stringify(entry.boundary_ref)},`,
    `    authority_ref: ${JSON.stringify(entry.authority_ref)},`,
    `    projection_granularity: ${JSON.stringify(entry.projection_granularity)},`,
    `    effective_version: FUNCTIONAL_OWNERSHIP_EFFECTIVE_VERSION,`,
    '  },',
  ].join('\n');
}

function renderStringArray(name, values) {
  return [
    `export const ${name} = [`,
    ...values.map((value) => `  ${JSON.stringify(value)},`),
    '] as const;',
  ].join('\n');
}

function renderDistribution(distribution) {
  return [
    'export const PROCESS_OWNER_DISTRIBUTION = {',
    ...expectedApplicationCodes.map(
      (appCode) =>
        `  ${appCode}: ${distribution[appCode]},`,
    ),
    '} as const satisfies Readonly<Record<AppCode, number>>;',
  ].join('\n');
}

function renderContract(processOwnership, capabilityProjections) {
  const processRows = processOwnership.projections
    .map(renderProcessProjection)
    .join('\n');

  const capabilityRows = capabilityProjections
    .map(renderCapabilityProjection)
    .join('\n');

  return `// GENERATED FILE. DO NOT EDIT.
// Contract task: SHELL-CON-016
// Process authority: PROC-CAT-005 / PROC-APPLICATION-OWNERSHIP-REGISTRY-001
// Capability source authority: CAP-MAP-008
// Competing ownership evidence: CAP-MAP-013
// Source contract SHA256: ${sourceContractSha256}

import type {
  AppCode,
} from "../../authorization/generated/versions/1.0.0/catalog.types.js";
import type {
  ProcessId,
} from "../../processes/generated/process-id.contract.js";

export const FUNCTIONAL_OWNERSHIP_EFFECTIVE_VERSION =
  ${JSON.stringify(effectiveVersion)} as const;

${renderStringArray(
    'FUNCTIONAL_OWNERSHIP_SOURCE_STATUSES',
    expectedSourceStatuses,
  )}

export type FunctionalOwnershipSourceStatus =
  (typeof FUNCTIONAL_OWNERSHIP_SOURCE_STATUSES)[number];

${renderStringArray(
    'FUNCTIONAL_OWNERSHIP_REPRESENTATION_CLASSES',
    expectedRepresentationClasses,
  )}

export type FunctionalOwnershipRepresentationClass =
  (typeof FUNCTIONAL_OWNERSHIP_REPRESENTATION_CLASSES)[number];

${renderStringArray(
    'FUNCTIONAL_OWNERSHIP_CONCEPTUAL_DIMENSIONS',
    expectedConceptualDimensions,
  )}

export type FunctionalOwnershipConceptualDimension =
  (typeof FUNCTIONAL_OWNERSHIP_CONCEPTUAL_DIMENSIONS)[number];

export interface ProcessOwnershipProjection {
  readonly process_id: ProcessId;
  readonly owner_app_code: AppCode;
  readonly authority_ref: "PROC-CAT-005";
  readonly ownership_scope: "RESULTADO_PRINCIPAL_DEL_PROCESO";
  readonly effective_version: typeof FUNCTIONAL_OWNERSHIP_EFFECTIVE_VERSION;
  readonly compatibility_status: "RECONCILED";
}

export const PROCESS_OWNERSHIP_PROJECTIONS = [
${processRows}
] as const satisfies readonly ProcessOwnershipProjection[];

export type ProcessOwnershipProjectionDefinition =
  (typeof PROCESS_OWNERSHIP_PROJECTIONS)[number];

${renderDistribution(processOwnership.distribution)}

export interface CapabilitySourceFamilyProjection {
  readonly family_ref: string;
  readonly source_target: string;
  readonly source_status: FunctionalOwnershipSourceStatus;
  readonly boundary_ref: string;
  readonly authority_ref: "CAP-MAP-008";
  readonly projection_granularity: "FAMILY_BASE";
  readonly effective_version: typeof FUNCTIONAL_OWNERSHIP_EFFECTIVE_VERSION;
}

export const CAPABILITY_SOURCE_FAMILY_PROJECTIONS = [
${capabilityRows}
] as const satisfies readonly CapabilitySourceFamilyProjection[];

export type CapabilitySourceFamilyProjectionDefinition =
  (typeof CAPABILITY_SOURCE_FAMILY_PROJECTIONS)[number];

export const COMPETING_FUNCTIONAL_OWNERSHIP_CASES = [
  {
    subject_ref: "public.employee_shifts",
    current_competing_app_codes: ["viso", "anima"],
    target_owner_app_code: "viso",
    target_consumer_app_code: "anima",
    authority_ref: "CAP-MAP-013",
    materialization_status: "PREEXISTING_DEBT_NOT_REMEDIATED",
  },
] as const satisfies readonly Readonly<{
  subject_ref: string;
  current_competing_app_codes: readonly AppCode[];
  target_owner_app_code: AppCode;
  target_consumer_app_code: AppCode;
  authority_ref: "CAP-MAP-013";
  materialization_status: "PREEXISTING_DEBT_NOT_REMEDIATED";
}>[];

export type CompetingFunctionalOwnershipCase =
  (typeof COMPETING_FUNCTIONAL_OWNERSHIP_CASES)[number];

export const FUNCTIONAL_OWNERSHIP_REGISTRY_METADATA = {
  logical_namespace: "@vento/contracts/ownership",
  process_assignment_count: 69,
  app_code_universe_count: 10,
  assigned_process_owner_app_code_count: 9,
  subcapacity_decision_count: 217,
  capability_family_projection_count: 18,
  source_status_count: 5,
  representation_class_count: 5,
  competing_ownership_case_count: 1,
  capability_projection_model: "FAMILY_PLUS_EXCEPTION",
  flat_subcapacity_registry_materialized: false,
  ownership_id_defined: false,
  semantic_process_authority: "PROC-CAT-005",
  semantic_capability_authority: "CAP-MAP-008",
  competing_ownership_authority: "CAP-MAP-013",
  contract_task_id: "SHELL-CON-016",
} as const;

export type FunctionalOwnershipRegistryMetadata =
  typeof FUNCTIONAL_OWNERSHIP_REGISTRY_METADATA;

const PROCESS_OWNERSHIP_BY_ID =
  new Map<ProcessId, ProcessOwnershipProjectionDefinition>(
    PROCESS_OWNERSHIP_PROJECTIONS.map((projection) => [
      projection.process_id,
      projection,
    ] as const),
  );

const CAPABILITY_SOURCE_FAMILY_BY_ID =
  new Map<string, CapabilitySourceFamilyProjectionDefinition>(
    CAPABILITY_SOURCE_FAMILY_PROJECTIONS.map((projection) => [
      projection.family_ref,
      projection,
    ] as const),
  );

export function resolveProcessOwner(
  processId: ProcessId,
): ProcessOwnershipProjectionDefinition | undefined {
  return PROCESS_OWNERSHIP_BY_ID.get(processId);
}

export type CapabilitySourceResolution =
  | Readonly<{
      resolution_status: "FAMILY_BASE";
      projection: CapabilitySourceFamilyProjectionDefinition;
    }>
  | Readonly<{
      resolution_status: "CANONICAL_DETAIL_REQUIRED";
      family_ref: string;
      authority_ref: "CAP-MAP-008";
    }>
  | Readonly<{
      resolution_status: "UNRESOLVED";
      authority_ref: "CAP-MAP-008";
    }>;

export function resolveCapabilitySource(
  capabilityRef: string,
): CapabilitySourceResolution {
  const normalized = String(capabilityRef ?? "").trim();
  const familyMatch = /^(CAP-[0-9]{2})(?:\\.|$)/.exec(normalized);

  if (!familyMatch) {
    return {
      resolution_status: "UNRESOLVED",
      authority_ref: "CAP-MAP-008",
    };
  }

  const familyRef = familyMatch[1];
  const projection = CAPABILITY_SOURCE_FAMILY_BY_ID.get(familyRef);

  if (!projection) {
    return {
      resolution_status: "UNRESOLVED",
      authority_ref: "CAP-MAP-008",
    };
  }

  if (normalized === familyRef) {
    return {
      resolution_status: "FAMILY_BASE",
      projection,
    };
  }

  return {
    resolution_status: "CANONICAL_DETAIL_REQUIRED",
    family_ref: familyRef,
    authority_ref: "CAP-MAP-008",
  };
}

export function isCanonicalOwner(
  appCode: AppCode,
  subjectRef: string,
): boolean | null {
  const normalized = String(subjectRef ?? "").trim();
  const processProjection = PROCESS_OWNERSHIP_BY_ID.get(
    normalized as ProcessId,
  );

  if (processProjection) {
    return processProjection.owner_app_code === appCode;
  }

  return null;
}

export function assertOwnershipProjectionFresh(
  subjectRef: string,
  effectiveVersion: string,
): true {
  const normalizedSubjectRef = String(subjectRef ?? "").trim();

  if (!normalizedSubjectRef) {
    throw new Error("Ownership subject_ref is required.");
  }

  if (effectiveVersion !== FUNCTIONAL_OWNERSHIP_EFFECTIVE_VERSION) {
    throw new Error("Ownership projection is stale.");
  }

  return true;
}
`;
}

function renderIndex() {
  return `// GENERATED FILE. DO NOT EDIT.
// Contract task: SHELL-CON-016
// Source contract SHA256: ${sourceContractSha256}

export {
  CAPABILITY_SOURCE_FAMILY_PROJECTIONS,
  COMPETING_FUNCTIONAL_OWNERSHIP_CASES,
  FUNCTIONAL_OWNERSHIP_CONCEPTUAL_DIMENSIONS,
  FUNCTIONAL_OWNERSHIP_EFFECTIVE_VERSION,
  FUNCTIONAL_OWNERSHIP_REGISTRY_METADATA,
  FUNCTIONAL_OWNERSHIP_REPRESENTATION_CLASSES,
  FUNCTIONAL_OWNERSHIP_SOURCE_STATUSES,
  PROCESS_OWNER_DISTRIBUTION,
  PROCESS_OWNERSHIP_PROJECTIONS,
  assertOwnershipProjectionFresh,
  isCanonicalOwner,
  resolveCapabilitySource,
  resolveProcessOwner,
} from "./functional-ownership.contract.js";

export type {
  CapabilitySourceFamilyProjection,
  CapabilitySourceFamilyProjectionDefinition,
  CapabilitySourceResolution,
  CompetingFunctionalOwnershipCase,
  FunctionalOwnershipConceptualDimension,
  FunctionalOwnershipRegistryMetadata,
  FunctionalOwnershipRepresentationClass,
  FunctionalOwnershipSourceStatus,
  ProcessOwnershipProjection,
  ProcessOwnershipProjectionDefinition,
} from "./functional-ownership.contract.js";
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

export function generateFunctionalOwnershipContracts({
  checkOnly = false,
} = {}) {
  const appCodes = parseApplications();
  const processIds = extractProcessIdsFromPhysicalContract();

  const shellContractSource = readText(
    shellContractSourcePath,
    'SHELL-CON-016 source file',
  );
  const processOwnershipSource = readText(
    processOwnershipSourcePath,
    'PROC-CAT-005 source file',
  );
  const capabilitySource = readText(
    capabilitySourcePath,
    'CAP-MAP-008 source file',
  );
  const competingOwnershipSource = readText(
    competingOwnershipSourcePath,
    'CAP-MAP-013 source file',
  );

  validateOwnerTask(shellContractSource);

  const processOwnership = parseProcessOwnership(
    processOwnershipSource,
    appCodes,
    processIds,
  );
  const capabilityProjections = parseCapabilitySources(
    capabilitySource,
  );
  validateCompetingOwnership(competingOwnershipSource);

  assertExactSet(
    processOwnership.projections.map((entry) => entry.owner_app_code),
    processOwnership.assignedOwnerCodes,
    'assigned process owner AppCode set',
  );

  const contractResult = writeOrCheck(
    contractPath,
    renderContract(
      processOwnership,
      capabilityProjections,
    ),
    checkOnly,
    'functional ownership contract',
  );

  const indexResult = writeOrCheck(
    indexPath,
    renderIndex(),
    checkOnly,
    'functional ownership generated index',
  );

  return {
    processAssignments: processOwnership.projections.length,
    appCodeUniverse: appCodes.size,
    assignedProcessOwnerCodes:
      processOwnership.assignedOwnerCodes.length,
    subcapacityDecisions: expectedSubcapacityDecisionCount,
    capabilityFamilies: capabilityProjections.length,
    sourceStatuses: expectedSourceStatuses.length,
    representationClasses: expectedRepresentationClasses.length,
    competingOwnershipCases: expectedCompetingOwnershipCaseCount,
    contractResult,
    indexResult,
  };
}

function runCli() {
  const checkOnly = process.argv.includes('--check');
  const unknown = process.argv
    .slice(2)
    .filter((value) => value !== '--check');

  try {
    if (unknown.length > 0) {
      fail(`Unknown arguments: ${unknown.join(', ')}`);
    }

    const result = generateFunctionalOwnershipContracts({
      checkOnly,
    });

    console.log(
      `[VENTO CONTRACTS] FUNCTIONAL_OWNERSHIP `
      + `${checkOnly ? 'CHECK' : 'GENERATE'} PASS`,
    );
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
      `OPERACION: FUNCTIONAL_OWNERSHIP_`
      + `${checkOnly ? 'CHECK' : 'GENERATE'}`,
    );
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
    console.log(`CONTRACT: ${result.contractResult}`);
    console.log(`INDEX: ${result.indexResult}`);
    console.log('=== FIN RESULTADO PARA CHATGPT ===');
  } catch (error) {
    const message =
      error instanceof Error ? error.message : String(error);

    console.error('[VENTO CONTRACTS] FUNCTIONAL_OWNERSHIP FAIL');
    console.error(message);
    console.error('');
    console.error('=== RESULTADO PARA CHATGPT ===');
    console.error('ESTADO: FAIL');
    console.error('OPERACION: FUNCTIONAL_OWNERSHIP');
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