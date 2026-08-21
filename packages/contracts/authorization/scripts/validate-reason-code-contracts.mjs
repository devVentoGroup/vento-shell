import fs from 'node:fs';
import path from 'node:path';
import { fileURLToPath } from 'node:url';

import { generateReasonCodeContracts } from './generate-reason-code-contracts.mjs';

const currentFile = fileURLToPath(import.meta.url);
const scriptDirectory = path.dirname(currentFile);
const authorizationRoot = path.resolve(scriptDirectory, '..');
const repositoryRoot = path.resolve(authorizationRoot, '../../..');

const generatedDirectory = path.join(
  authorizationRoot,
  'generated',
  'reason-codes',
  'versions',
  '1.0.0',
);

const typesPath = path.join(generatedDirectory, 'reason-code.types.ts');
const valuesPath = path.join(generatedDirectory, 'reason-code.values.ts');
const indexPath = path.join(generatedDirectory, 'index.ts');

const accessContextPath = path.join(
  authorizationRoot,
  'generated',
  'response-contracts',
  'versions',
  '1.0.0',
  'access-context.types.ts',
);

const packageJsonPath = path.join(repositoryRoot, 'packages', 'contracts', 'package.json');
const readmePath = path.join(authorizationRoot, 'README.md');
const legacyContextPath = path.join(repositoryRoot, 'packages', 'os-context', 'src', 'types.ts');

const sourceContractSha256 = 'ef042d037827ce14470e1cffa7ba3c76bf88318a21a65644cd465efdc65b5122';
const responseReleaseHash = 'sha256:782a216c4bbfdc3b3cec1bbd7239c05d93edd7fa34b4ce62cad48c1e6b9941cd';

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

function validateCounts(actual) {
  for (const [key, expected] of Object.entries(expectedCounts)) {
    if (actual[key] !== expected) {
      fail(`${key} must equal ${expected}; received ${actual[key]}.`);
    }
  }
}

function validatePackageBoundary() {
  const packageJson = readJson(packageJsonPath, '@vento/contracts package.json');

  if (packageJson.name !== '@vento/contracts') {
    fail('@vento/contracts package identity changed.');
  }
  if (packageJson.private !== true) {
    fail('@vento/contracts must remain private during SHELL-CON-008.');
  }
  if (Object.prototype.hasOwnProperty.call(packageJson, 'exports')) {
    fail('SHELL-CON-008 must not create public package exports.');
  }
}

function validateTypes(source) {
  const required = [
    sourceContractSha256,
    responseReleaseHash,
    'export type AuthorizationReasonCode =',
    'export type StructuralIssueCode =',
    'export type LaneAvailabilityReasonCode =',
    'export type LaneReasonCode =',
    '| StructuralIssueCode',
    '| LaneAvailabilityReasonCode;',
    'export type StructuralIssueSeverity =',
    'export type StructuralIssueSubjectType =',
    'export type StructuralIssueSource =',
    'export type StructuralIssueDefinition = {',
    'readonly issue_code: StructuralIssueCode;',
    'readonly severity: StructuralIssueSeverity;',
    'readonly subject_type: StructuralIssueSubjectType;',
    'readonly source: StructuralIssueSource;',
    'readonly safe_message: string;',
  ];

  for (const marker of required) {
    assertIncludes(source, marker, 'reason-code types');
  }

  const forbidden = [
    'type ErrorCode',
    'ACTOR_IDENTIFICATION_REQUIRED',
    'STRONG_REAUTHENTICATION_REQUIRED',
    'AuthorizationSourceStatus',
  ];

  for (const marker of forbidden) {
    assertExcludes(source, marker, 'reason-code types');
  }
}

function validateValues(source) {
  const required = [
    'AUTHORIZATION_REASON_CODES',
    'STRUCTURAL_ISSUE_CODES',
    'LANE_AVAILABILITY_REASON_CODES',
    'LANE_REASON_CODES',
    'STRUCTURAL_ISSUE_SEVERITIES',
    'STRUCTURAL_ISSUE_SUBJECT_TYPES',
    'STRUCTURAL_ISSUE_SOURCES',
    'STRUCTURAL_ISSUE_CATALOG',
    'STRUCTURAL_ISSUE_BY_CODE',
    'isAuthorizationReasonCode',
    'isStructuralIssueCode',
    'isLaneAvailabilityReasonCode',
    'isLaneReasonCode',
    '"AUTH_NO_SESSION"',
    '"AUTH_AUTHORIZATION_EVALUATION_UNAVAILABLE"',
    '"AUTH_UNAUTHENTICATED"',
    '"STRUCTURAL_ISSUE_CODE_UNKNOWN"',
    '"STRUCTURAL_ISSUE_METADATA_INVALID"',
    '"CONTEXT_STALE"',
    '"NON_LABOR_ACTOR"',
    '"OPERATIONAL_SITE_NOT_AVAILABLE"',
  ];

  for (const marker of required) {
    assertIncludes(source, marker, 'reason-code values');
  }

  for (const auxiliaryState of [
    'ACTOR_IDENTIFICATION_REQUIRED',
    'STRONG_REAUTHENTICATION_REQUIRED',
  ]) {
    assertExcludes(source, auxiliaryState, 'reason-code values');
  }
}

function validateIndex(source) {
  const required = [
    'AuthorizationReasonCode',
    'StructuralIssueCode',
    'LaneAvailabilityReasonCode',
    'LaneReasonCode',
    'StructuralIssueSeverity',
    'StructuralIssueSubjectType',
    'StructuralIssueSource',
    'STRUCTURAL_ISSUE_CATALOG',
    'isAuthorizationReasonCode',
    'isStructuralIssueCode',
    'isLaneAvailabilityReasonCode',
    'isLaneReasonCode',
  ];

  for (const marker of required) {
    assertIncludes(source, marker, 'reason-code index');
  }

  assertExcludes(source, 'ErrorCode', 'reason-code index');
}

function validateAccessContext(source) {
  const required = [
    'import type {',
    'LaneReasonCode,',
    'StructuralIssueCode,',
    'StructuralIssueSeverity,',
    'StructuralIssueSource,',
    'StructuralIssueSubjectType,',
    'from "../../../reason-codes/versions/1.0.0/reason-code.types.js";',
    'reason_codes: LaneReasonCode[];',
    'issue_code: StructuralIssueCode;',
    'severity: StructuralIssueSeverity;',
    'subject_type: StructuralIssueSubjectType;',
    'source: StructuralIssueSource;',
  ];

  for (const marker of required) {
    assertIncludes(source, marker, 'AccessContextV1');
  }

  assertExcludes(source, 'reason_codes: string[];', 'AccessContextV1');
  assertExcludes(source, 'issue_code: string;', 'AccessContextV1');
}

function validateLegacyBoundary() {
  const legacySource = readText(legacyContextPath, 'legacy os-context types');
  const required = [
    'export type EffectiveContext = {',
    'blocked_reasons: string[];',
    'export type ContextSimulationInput = {',
    'bypass_applied: boolean;',
    'can_operate: boolean;',
  ];

  for (const marker of required) {
    assertIncludes(legacySource, marker, 'legacy context boundary');
  }
}

function validateReadme() {
  const source = readText(readmePath, 'authorization README');
  const required = [
    '## Códigos de autorización y contexto canónicos',
    '`SHELL-CON-008::GLOBAL`',
    '`AuthorizationReasonCode`: **20**',
    '`StructuralIssueCode`: **100**',
    '`LaneAvailabilityReasonCode`: **10**',
    '`LaneReasonCode`: **110**',
    '`StructuralIssueSeverity`: **5**',
    '`StructuralIssueSubjectType`: **17**',
    '`StructuralIssueSource`: **15**',
    '`generated/reason-codes/versions/1.0.0/`',
    '`blocked_reasons: string[]`',
    'no crea exports públicos',
  ];

  for (const marker of required) {
    assertIncludes(source, marker, 'authorization README');
  }
}

export function validateReasonCodeContracts() {
  const generated = generateReasonCodeContracts({ checkOnly: true });
  validateCounts(generated.counts);

  const typesSource = readText(typesPath, 'reason-code types');
  const valuesSource = readText(valuesPath, 'reason-code values');
  const indexSource = readText(indexPath, 'reason-code index');
  const accessContextSource = readText(accessContextPath, 'AccessContextV1');

  validatePackageBoundary();
  validateTypes(typesSource);
  validateValues(valuesSource);
  validateIndex(indexSource);
  validateAccessContext(accessContextSource);
  validateLegacyBoundary();
  validateReadme();

  return generated.counts;
}

const isCli = process.argv[1]
  && path.resolve(process.argv[1]) === path.resolve(currentFile);

if (isCli) {
  try {
    const unknown = process.argv.slice(2);
    if (unknown.length > 0) fail(`Unknown arguments: ${unknown.join(', ')}`);

    const counts = validateReasonCodeContracts();

    console.log('[VENTO CONTRACTS] REASON_CODE_CONTRACTS PASS');
    console.log(`[VENTO CONTRACTS] AUTHORIZATION_REASON_CODES ${counts.authorizationReasonCodes}`);
    console.log(`[VENTO CONTRACTS] STRUCTURAL_ISSUE_CODES ${counts.structuralIssueCodes}`);
    console.log(`[VENTO CONTRACTS] LANE_AVAILABILITY_REASON_CODES ${counts.laneAvailabilityReasonCodes}`);
    console.log(`[VENTO CONTRACTS] LANE_REASON_CODES ${counts.laneReasonCodes}`);
    console.log(`[VENTO CONTRACTS] STRUCTURAL_ISSUE_SEVERITIES ${counts.structuralIssueSeverities}`);
    console.log(`[VENTO CONTRACTS] STRUCTURAL_ISSUE_SUBJECT_TYPES ${counts.structuralIssueSubjectTypes}`);
    console.log(`[VENTO CONTRACTS] STRUCTURAL_ISSUE_SOURCES ${counts.structuralIssueSources}`);
    console.log(`[VENTO CONTRACTS] STRUCTURAL_ISSUE_METADATA ${counts.structuralIssueMetadata}`);
    console.log('[VENTO CONTRACTS] NAMESPACE_INTERSECTIONS 0');
    console.log('[VENTO CONTRACTS] AUXILIARY_INTERACTION_STATES EXCLUDED');
    console.log('[VENTO CONTRACTS] LEGACY_BLOCKED_REASONS PRESERVED');
    console.log('[VENTO CONTRACTS] PUBLIC_EXPORTS NONE');
  } catch (error) {
    console.error('[VENTO CONTRACTS] REASON_CODE_CONTRACTS FAIL');
    console.error(error instanceof Error ? error.message : String(error));
    process.exitCode = 1;
  }
}