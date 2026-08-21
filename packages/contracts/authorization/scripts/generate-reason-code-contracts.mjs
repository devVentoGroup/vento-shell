import fs from 'node:fs';
import path from 'node:path';
import { fileURLToPath } from 'node:url';

const currentFile = fileURLToPath(import.meta.url);
const scriptDirectory = path.dirname(currentFile);
const authorizationRoot = path.resolve(scriptDirectory, '..');
const repositoryRoot = path.resolve(authorizationRoot, '../../..');

const shellSourcePath = path.join(
  repositoryRoot,
  'docs',
  'plan-canonico',
  'modular',
  'bloques',
  'H_FUNDACION_COMPARTIDA',
  '03_CONTRATOS_COMPARTIDOS.md',
);

const contextSourcePath = path.join(
  repositoryRoot,
  'docs',
  'plan-canonico',
  'modular',
  'bloques',
  'E_CONTEXTO_Y_DECISION',
  '03_CONTEXTO_LABORAL_Y_DISPOSITIVO.md',
);

const messagesSourcePath = path.join(
  repositoryRoot,
  'docs',
  'plan-canonico',
  'modular',
  'bloques',
  'S_MENSAJES_BLOQUEO',
  '03_CONFIGURACION_ERRORES_Y_DISTRIBUCION.md',
);

const generatedDirectory = path.join(
  authorizationRoot,
  'generated',
  'reason-codes',
  'versions',
  '1.0.0',
);

const generatedTypesPath = path.join(generatedDirectory, 'reason-code.types.ts');
const generatedValuesPath = path.join(generatedDirectory, 'reason-code.values.ts');
const generatedIndexPath = path.join(generatedDirectory, 'index.ts');

const sourceContractSha256 = 'ef042d037827ce14470e1cffa7ba3c76bf88318a21a65644cd465efdc65b5122';
const responseContractFamily = 'vento.authorization.response-contracts';
const responseContractVersion = '1.0.0';
const responseReleaseHash = 'sha256:782a216c4bbfdc3b3cec1bbd7239c05d93edd7fa34b4ce62cad48c1e6b9941cd';
const messageCatalogId = 'vento.authorization.messages';
const messageCatalogVersion = '1.0.0';
const messageSchemaVersion = '1.0.0';
const sourceLocale = 'es-CO';

const expectedCounts = Object.freeze({
  authorizationReasonCodes: 20,
  structuralIssueCodes: 100,
  laneAvailabilityReasonCodes: 10,
  laneReasonCodes: 110,
  structuralIssueSeverities: 5,
  structuralIssueSubjectTypes: 17,
  structuralIssueSources: 15,
  structuralIssueMetadata: 100,
});

const auxiliaryInteractionStates = Object.freeze([
  'ACTOR_IDENTIFICATION_REQUIRED',
  'STRONG_REAUTHENTICATION_REQUIRED',
]);

function fail(message) {
  throw new Error(message);
}

function readCanonical(filePath, label) {
  if (!fs.existsSync(filePath)) {
    fail(`Missing canonical source ${label}: ${path.relative(process.cwd(), filePath)}`);
  }
  return fs.readFileSync(filePath, 'utf8').replaceAll('\r\n', '\n');
}

function extractTaskSection(source, taskId, nextTaskId = null) {
  const startPattern = new RegExp(`^### [^\\n]*${taskId} [^\\n]*$`, 'm');
  const startMatch = source.match(startPattern);
  if (!startMatch || startMatch.index === undefined) {
    fail(`Canonical task ${taskId} not found.`);
  }

  const start = startMatch.index;
  if (!nextTaskId) return source.slice(start);

  const tail = source.slice(start + startMatch[0].length);
  const endPattern = new RegExp(`^### [^\\n]*${nextTaskId} [^\\n]*$`, 'm');
  const endMatch = tail.match(endPattern);
  if (!endMatch || endMatch.index === undefined) {
    fail(`Canonical task boundary ${nextTaskId} not found after ${taskId}.`);
  }

  return source.slice(start, start + startMatch[0].length + endMatch.index);
}

function extractLiteralUnion(section, typeName) {
  const pattern = new RegExp(`type\\s+${typeName}\\s*=([\\s\\S]*?);`);
  const match = section.match(pattern);
  if (!match) fail(`Type union ${typeName} not found in SHELL-CON-008.`);

  const values = [...match[1].matchAll(/"([^"]+)"/g)].map((entry) => entry[1]);
  if (values.length === 0) fail(`Type union ${typeName} contains no literal members.`);
  if (new Set(values).size !== values.length) fail(`Type union ${typeName} contains duplicates.`);
  return values;
}

function assertCount(values, expected, label) {
  if (values.length !== expected) {
    fail(`${label} must contain exactly ${expected} members; received ${values.length}.`);
  }
}

function assertDisjoint(left, right, label) {
  const rightSet = new Set(right);
  const overlap = left.filter((value) => rightSet.has(value));
  if (overlap.length > 0) {
    fail(`${label} must be disjoint; overlap: ${overlap.join(', ')}`);
  }
}

function validateUpperSnakeCase(values, label) {
  for (const value of values) {
    if (!/^[A-Z][A-Z0-9_]*$/.test(value)) {
      fail(`${label} contains non UPPER_SNAKE_CASE member: ${value}`);
    }
  }
}

function parseStructuralMetadata(section, structuralIssueCodes, severities, subjectTypes, sources) {
  const codeSet = new Set(structuralIssueCodes);
  const severitySet = new Set(severities);
  const subjectTypeSet = new Set(subjectTypes);
  const sourceSet = new Set(sources);
  const byCode = new Map();

  const lines = section.split('\n');
  const rowPattern = /^\|\s*`([^`]+)`\s*\|\s*`([^`]+)`\s*\|\s*`([^`]+)`\s*\|\s*`([^`]+)`\s*\|\s*(.*?)\s*\|\s*$/;

  for (const line of lines) {
    const match = line.match(rowPattern);
    if (!match) continue;

    const [, issueCode, severity, subjectType, source, safeMessage] = match;
    if (!codeSet.has(issueCode)) continue;

    if (byCode.has(issueCode)) {
      fail(`AUTH-CTX-015 contains duplicate structural metadata for ${issueCode}.`);
    }
    if (!severitySet.has(severity)) {
      fail(`${issueCode} references unknown StructuralIssueSeverity ${severity}.`);
    }
    if (!subjectTypeSet.has(subjectType)) {
      fail(`${issueCode} references unknown StructuralIssueSubjectType ${subjectType}.`);
    }
    if (!sourceSet.has(source)) {
      fail(`${issueCode} references unknown StructuralIssueSource ${source}.`);
    }
    if (!safeMessage || safeMessage.trim().length === 0) {
      fail(`${issueCode} must preserve a non-empty safe_message.`);
    }

    byCode.set(issueCode, {
      issue_code: issueCode,
      severity,
      subject_type: subjectType,
      source,
      safe_message: safeMessage.trim(),
    });
  }

  const missing = structuralIssueCodes.filter((code) => !byCode.has(code));
  if (missing.length > 0) {
    fail(`AUTH-CTX-015 is missing structural metadata for: ${missing.join(', ')}`);
  }

  return structuralIssueCodes.map((code) => byCode.get(code));
}

function assertSourceContractMarkers(shellSection, contextSection, messagesSection) {
  const shellMarkers = [
    'AuthorizationReasonCode',
    'StructuralIssueCode',
    'LaneAvailabilityReasonCode',
    'LaneReasonCode',
    'StructuralIssueSeverity',
    'StructuralIssueSubjectType',
    'StructuralIssueSource',
    'LaneReasonCode =',
    '100 + 10 = 110',
    responseReleaseHash,
  ];
  for (const marker of shellMarkers) {
    if (!shellSection.includes(marker)) {
      fail(`SHELL-CON-008 is missing canonical marker: ${marker}`);
    }
  }

  const contextMarkers = [
    'lane_readiness',
    'structural_issues',
    'AUTH_UNAUTHENTICATED',
    'STRUCTURAL_ISSUE_CODE_UNKNOWN',
    'STRUCTURAL_ISSUE_METADATA_INVALID',
    'CONTEXT_STALE',
  ];
  for (const marker of contextMarkers) {
    if (!contextSection.includes(marker)) {
      fail(`AUTH-CTX-015 is missing canonical marker: ${marker}`);
    }
  }

  const messageMarkers = [
    `catalog_id = ${messageCatalogId}`,
    `catalog_version = ${messageCatalogVersion}`,
    `schema_version = ${messageSchemaVersion}`,
    `source_locale = ${sourceLocale}`,
    'reason_count = 20',
    'auxiliary_interaction_state_count = 2',
    'AUTH_NO_SESSION',
    'AUTH_AUTHORIZATION_EVALUATION_UNAVAILABLE',
  ];
  for (const marker of messageMarkers) {
    if (!messagesSection.includes(marker)) {
      fail(`AUTH-ERR-020 is missing canonical marker: ${marker}`);
    }
  }
}

function loadCanonicalContract() {
  const shellSource = readCanonical(shellSourcePath, 'SHELL-CON');
  const contextSource = readCanonical(contextSourcePath, 'AUTH-CTX');
  const messagesSource = readCanonical(messagesSourcePath, 'AUTH-ERR');

  const shellSection = extractTaskSection(shellSource, 'SHELL-CON-008', 'SHELL-CON-009');
  const contextSection = extractTaskSection(contextSource, 'AUTH-CTX-015');
  const messagesSection = extractTaskSection(messagesSource, 'AUTH-ERR-020');

  assertSourceContractMarkers(shellSection, contextSection, messagesSection);

  const authorizationReasonCodes = extractLiteralUnion(shellSection, 'AuthorizationReasonCode');
  const structuralIssueCodes = extractLiteralUnion(shellSection, 'StructuralIssueCode');
  const laneAvailabilityReasonCodes = extractLiteralUnion(shellSection, 'LaneAvailabilityReasonCode');
  const structuralIssueSeverities = extractLiteralUnion(shellSection, 'StructuralIssueSeverity');
  const structuralIssueSubjectTypes = extractLiteralUnion(shellSection, 'StructuralIssueSubjectType');
  const structuralIssueSources = extractLiteralUnion(shellSection, 'StructuralIssueSource');

  assertCount(
    authorizationReasonCodes,
    expectedCounts.authorizationReasonCodes,
    'AuthorizationReasonCode',
  );
  assertCount(
    structuralIssueCodes,
    expectedCounts.structuralIssueCodes,
    'StructuralIssueCode',
  );
  assertCount(
    laneAvailabilityReasonCodes,
    expectedCounts.laneAvailabilityReasonCodes,
    'LaneAvailabilityReasonCode',
  );
  assertCount(
    structuralIssueSeverities,
    expectedCounts.structuralIssueSeverities,
    'StructuralIssueSeverity',
  );
  assertCount(
    structuralIssueSubjectTypes,
    expectedCounts.structuralIssueSubjectTypes,
    'StructuralIssueSubjectType',
  );
  assertCount(
    structuralIssueSources,
    expectedCounts.structuralIssueSources,
    'StructuralIssueSource',
  );

  validateUpperSnakeCase(authorizationReasonCodes, 'AuthorizationReasonCode');
  validateUpperSnakeCase(structuralIssueCodes, 'StructuralIssueCode');
  validateUpperSnakeCase(laneAvailabilityReasonCodes, 'LaneAvailabilityReasonCode');
  validateUpperSnakeCase(structuralIssueSeverities, 'StructuralIssueSeverity');
  validateUpperSnakeCase(structuralIssueSubjectTypes, 'StructuralIssueSubjectType');
  validateUpperSnakeCase(structuralIssueSources, 'StructuralIssueSource');

  assertDisjoint(
    structuralIssueCodes,
    laneAvailabilityReasonCodes,
    'StructuralIssueCode / LaneAvailabilityReasonCode',
  );

  const laneReasonCodes = [...structuralIssueCodes, ...laneAvailabilityReasonCodes];
  assertCount(laneReasonCodes, expectedCounts.laneReasonCodes, 'LaneReasonCode');
  if (new Set(laneReasonCodes).size !== laneReasonCodes.length) {
    fail('LaneReasonCode contains duplicate values.');
  }

  assertDisjoint(
    authorizationReasonCodes,
    laneReasonCodes,
    'AuthorizationReasonCode / LaneReasonCode',
  );

  for (const auxiliaryState of auxiliaryInteractionStates) {
    if (authorizationReasonCodes.includes(auxiliaryState)) {
      fail(`${auxiliaryState} must remain outside AuthorizationReasonCode.`);
    }
  }

  for (const reasonCode of authorizationReasonCodes) {
    if (!messagesSection.includes(reasonCode)) {
      fail(`AUTH-ERR-020 does not contain AuthorizationReasonCode ${reasonCode}.`);
    }
  }

  const structuralIssueMetadata = parseStructuralMetadata(
    contextSection,
    structuralIssueCodes,
    structuralIssueSeverities,
    structuralIssueSubjectTypes,
    structuralIssueSources,
  );
  assertCount(
    structuralIssueMetadata,
    expectedCounts.structuralIssueMetadata,
    'Structural issue metadata',
  );

  return {
    authorizationReasonCodes,
    structuralIssueCodes,
    laneAvailabilityReasonCodes,
    laneReasonCodes,
    structuralIssueSeverities,
    structuralIssueSubjectTypes,
    structuralIssueSources,
    structuralIssueMetadata,
  };
}

function renderHeader() {
  return `// GENERATED FILE. DO NOT EDIT.
// Canonical sources: AUTH-ERR-020 + AUTH-CTX-015 + SHELL-CON-008
// Source contract SHA256: ${sourceContractSha256}
// Response contract family: ${responseContractFamily}@${responseContractVersion}
// Response release hash: ${responseReleaseHash}
// Message catalog: ${messageCatalogId}@${messageCatalogVersion}
// Message schema version: ${messageSchemaVersion}
// Source locale: ${sourceLocale}

`;
}

function renderUnion(typeName, values) {
  return `export type ${typeName} =\n${values.map((value) => `  | ${JSON.stringify(value)}`).join('\n')};\n`;
}

function renderTypes(contract) {
  return `${renderHeader()}${renderUnion('AuthorizationReasonCode', contract.authorizationReasonCodes)}
${renderUnion('StructuralIssueCode', contract.structuralIssueCodes)}
${renderUnion('LaneAvailabilityReasonCode', contract.laneAvailabilityReasonCodes)}
export type LaneReasonCode =
  | StructuralIssueCode
  | LaneAvailabilityReasonCode;

${renderUnion('StructuralIssueSeverity', contract.structuralIssueSeverities)}
${renderUnion('StructuralIssueSubjectType', contract.structuralIssueSubjectTypes)}
${renderUnion('StructuralIssueSource', contract.structuralIssueSources)}
export type StructuralIssueDefinition = {
  readonly issue_code: StructuralIssueCode;
  readonly severity: StructuralIssueSeverity;
  readonly subject_type: StructuralIssueSubjectType;
  readonly source: StructuralIssueSource;
  readonly safe_message: string;
};

export type StructuralIssueByCode =
  Readonly<Record<StructuralIssueCode, StructuralIssueDefinition>>;
`;
}

function renderConstArray(name, typeName, values) {
  const body = values.map((value) => `  ${JSON.stringify(value)},`).join('\n');
  return `export const ${name} = [\n${body}\n] as const satisfies readonly ${typeName}[];\n`;
}

function renderValues(contract) {
  const metadataRows = contract.structuralIssueMetadata
    .map((entry) => `  ${JSON.stringify(entry)},`)
    .join('\n');

  const byCodeEntries = contract.structuralIssueCodes
    .map((code, index) => `  ${JSON.stringify(code)}: STRUCTURAL_ISSUE_CATALOG[${index}],`)
    .join('\n');

  return `${renderHeader()}import type {
  AuthorizationReasonCode,
  LaneAvailabilityReasonCode,
  LaneReasonCode,
  StructuralIssueByCode,
  StructuralIssueCode,
  StructuralIssueDefinition,
  StructuralIssueSeverity,
  StructuralIssueSource,
  StructuralIssueSubjectType,
} from "./reason-code.types.js";

${renderConstArray('AUTHORIZATION_REASON_CODES', 'AuthorizationReasonCode', contract.authorizationReasonCodes)}
${renderConstArray('STRUCTURAL_ISSUE_CODES', 'StructuralIssueCode', contract.structuralIssueCodes)}
${renderConstArray('LANE_AVAILABILITY_REASON_CODES', 'LaneAvailabilityReasonCode', contract.laneAvailabilityReasonCodes)}
export const LANE_REASON_CODES = [
  ...STRUCTURAL_ISSUE_CODES,
  ...LANE_AVAILABILITY_REASON_CODES,
] as const satisfies readonly LaneReasonCode[];

${renderConstArray('STRUCTURAL_ISSUE_SEVERITIES', 'StructuralIssueSeverity', contract.structuralIssueSeverities)}
${renderConstArray('STRUCTURAL_ISSUE_SUBJECT_TYPES', 'StructuralIssueSubjectType', contract.structuralIssueSubjectTypes)}
${renderConstArray('STRUCTURAL_ISSUE_SOURCES', 'StructuralIssueSource', contract.structuralIssueSources)}
export const STRUCTURAL_ISSUE_CATALOG = [
${metadataRows}
] as const satisfies readonly StructuralIssueDefinition[];

export const STRUCTURAL_ISSUE_BY_CODE = {
${byCodeEntries}
} as const satisfies StructuralIssueByCode;

const AUTHORIZATION_REASON_CODE_SET = new Set<string>(AUTHORIZATION_REASON_CODES);
const STRUCTURAL_ISSUE_CODE_SET = new Set<string>(STRUCTURAL_ISSUE_CODES);
const LANE_AVAILABILITY_REASON_CODE_SET = new Set<string>(LANE_AVAILABILITY_REASON_CODES);
const LANE_REASON_CODE_SET = new Set<string>(LANE_REASON_CODES);

export function isAuthorizationReasonCode(value: unknown): value is AuthorizationReasonCode {
  return typeof value === "string" && AUTHORIZATION_REASON_CODE_SET.has(value);
}

export function isStructuralIssueCode(value: unknown): value is StructuralIssueCode {
  return typeof value === "string" && STRUCTURAL_ISSUE_CODE_SET.has(value);
}

export function isLaneAvailabilityReasonCode(
  value: unknown,
): value is LaneAvailabilityReasonCode {
  return typeof value === "string" && LANE_AVAILABILITY_REASON_CODE_SET.has(value);
}

export function isLaneReasonCode(value: unknown): value is LaneReasonCode {
  return typeof value === "string" && LANE_REASON_CODE_SET.has(value);
}
`;
}

function renderIndex() {
  return `${renderHeader()}export type {
  AuthorizationReasonCode,
  StructuralIssueCode,
  LaneAvailabilityReasonCode,
  LaneReasonCode,
  StructuralIssueSeverity,
  StructuralIssueSubjectType,
  StructuralIssueSource,
  StructuralIssueDefinition,
  StructuralIssueByCode,
} from "./reason-code.types.js";

export {
  AUTHORIZATION_REASON_CODES,
  STRUCTURAL_ISSUE_CODES,
  LANE_AVAILABILITY_REASON_CODES,
  LANE_REASON_CODES,
  STRUCTURAL_ISSUE_SEVERITIES,
  STRUCTURAL_ISSUE_SUBJECT_TYPES,
  STRUCTURAL_ISSUE_SOURCES,
  STRUCTURAL_ISSUE_CATALOG,
  STRUCTURAL_ISSUE_BY_CODE,
  isAuthorizationReasonCode,
  isStructuralIssueCode,
  isLaneAvailabilityReasonCode,
  isLaneReasonCode,
} from "./reason-code.values.js";
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

export function generateReasonCodeContracts({ checkOnly = false } = {}) {
  const contract = loadCanonicalContract();

  const results = {
    types: assertOrWrite(generatedTypesPath, renderTypes(contract), checkOnly),
    values: assertOrWrite(generatedValuesPath, renderValues(contract), checkOnly),
    index: assertOrWrite(generatedIndexPath, renderIndex(), checkOnly),
  };

  return {
    counts: {
      authorizationReasonCodes: contract.authorizationReasonCodes.length,
      structuralIssueCodes: contract.structuralIssueCodes.length,
      laneAvailabilityReasonCodes: contract.laneAvailabilityReasonCodes.length,
      laneReasonCodes: contract.laneReasonCodes.length,
      structuralIssueSeverities: contract.structuralIssueSeverities.length,
      structuralIssueSubjectTypes: contract.structuralIssueSubjectTypes.length,
      structuralIssueSources: contract.structuralIssueSources.length,
      structuralIssueMetadata: contract.structuralIssueMetadata.length,
    },
    results,
  };
}

const isCli = process.argv[1]
  && path.resolve(process.argv[1]) === path.resolve(currentFile);

if (isCli) {
  try {
    const unknown = process.argv.slice(2).filter((argument) => argument !== '--check');
    if (unknown.length > 0) fail(`Unknown arguments: ${unknown.join(', ')}`);

    const checkOnly = process.argv.includes('--check');
    const result = generateReasonCodeContracts({ checkOnly });

    console.log(`[VENTO CONTRACTS] REASON_CODES ${checkOnly ? 'CHECK' : 'GENERATE'} PASS`);
    console.log(`[VENTO CONTRACTS] AUTHORIZATION_REASON_CODES ${result.counts.authorizationReasonCodes}`);
    console.log(`[VENTO CONTRACTS] STRUCTURAL_ISSUE_CODES ${result.counts.structuralIssueCodes}`);
    console.log(`[VENTO CONTRACTS] LANE_AVAILABILITY_REASON_CODES ${result.counts.laneAvailabilityReasonCodes}`);
    console.log(`[VENTO CONTRACTS] LANE_REASON_CODES ${result.counts.laneReasonCodes}`);
    console.log(`[VENTO CONTRACTS] STRUCTURAL_ISSUE_SEVERITIES ${result.counts.structuralIssueSeverities}`);
    console.log(`[VENTO CONTRACTS] STRUCTURAL_ISSUE_SUBJECT_TYPES ${result.counts.structuralIssueSubjectTypes}`);
    console.log(`[VENTO CONTRACTS] STRUCTURAL_ISSUE_SOURCES ${result.counts.structuralIssueSources}`);
    console.log(`[VENTO CONTRACTS] STRUCTURAL_ISSUE_METADATA ${result.counts.structuralIssueMetadata}`);
    console.log(`[VENTO CONTRACTS] TYPES ${result.results.types}`);
    console.log(`[VENTO CONTRACTS] VALUES ${result.results.values}`);
    console.log(`[VENTO CONTRACTS] INDEX ${result.results.index}`);
  } catch (error) {
    console.error('[VENTO CONTRACTS] REASON_CODES FAIL');
    console.error(error instanceof Error ? error.message : String(error));
    process.exitCode = 1;
  }
}