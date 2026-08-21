import fs from 'node:fs';
import path from 'node:path';
import { fileURLToPath } from 'node:url';

import { generateResponseContracts } from './generate-response-contracts.mjs';

const currentFile = fileURLToPath(import.meta.url);
const scriptDirectory = path.dirname(currentFile);
const authorizationRoot = path.resolve(scriptDirectory, '..');
const repositoryRoot = path.resolve(authorizationRoot, '../../..');

const generatedDirectory = path.join(
  authorizationRoot,
  'generated',
  'response-contracts',
  'versions',
  '1.0.0',
);

const metadataPath = path.join(generatedDirectory, 'contract-metadata.types.ts');
const accessContextPath = path.join(generatedDirectory, 'access-context.types.ts');
const simulationContextPath = path.join(generatedDirectory, 'simulation-context.types.ts');
const indexPath = path.join(generatedDirectory, 'index.ts');

const reasonCodeTypesPath = path.join(
  authorizationRoot,
  'generated',
  'reason-codes',
  'versions',
  '1.0.0',
  'reason-code.types.ts',
);

const applicationsPath = path.join(
  authorizationRoot,
  'catalog',
  'versions',
  '1.0.0',
  'applications.json',
);

const baseRolesPath = path.join(
  authorizationRoot,
  'catalog',
  'base-roles',
  'versions',
  '1.1.0',
  'base-roles.json',
);

const operationalRolesPath = path.join(
  authorizationRoot,
  'catalog',
  'operational-roles',
  'versions',
  '1.0.0',
  'operational-roles.json',
);

const packageJsonPath = path.join(repositoryRoot, 'packages', 'contracts', 'package.json');
const readmePath = path.join(authorizationRoot, 'README.md');
const legacyContextPath = path.join(repositoryRoot, 'packages', 'os-context', 'src', 'types.ts');

const contractFamily = 'vento.authorization.response-contracts';
const contractFamilyVersion = '1.0.0';
const releaseHash = 'sha256:782a216c4bbfdc3b3cec1bbd7239c05d93edd7fa34b4ce62cad48c1e6b9941cd';
const reasonCodeSourceContractSha256 = 'ef042d037827ce14470e1cffa7ba3c76bf88318a21a65644cd465efdc65b5122';

const expectedAppCodes = [
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
];

const expectedBaseRoles = [
  'propietario',
  'gerente_general',
  'gerente',
  'supervisor',
  'auxiliar_administrativa',
  'contador',
  'marketing',
  'trabajador_operativo',
];

const expectedOperationalRoles = [
  'cajero_satelite',
  'barista_satelite',
  'cocinero_satelite',
  'servicio_salon',
  'mostrador_satelite',
  'operador_integral_satelite',
  'produccion_cocina',
  'produccion_panaderia',
  'produccion_reposteria',
  'bodeguero',
  'conductor_logistica',
  'gerencia_operativa',
];

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

function assertEqual(actual, expected, label) {
  if (JSON.stringify(actual) !== JSON.stringify(expected)) {
    fail(`${label} does not match the canonical expected value.`);
  }
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

function validateCatalogDependencies() {
  const applications = readJson(applicationsPath, 'applications.json');
  if (!Array.isArray(applications)) fail('applications.json must contain an array.');
  assertEqual(
    applications.map((entry) => entry.app_code),
    expectedAppCodes,
    'AppCode set',
  );

  const baseRoles = readJson(baseRolesPath, 'base-roles.json');
  if (!Array.isArray(baseRoles)) fail('base-roles.json must contain an array.');
  assertEqual(baseRoles, expectedBaseRoles, 'BaseRoleCode set');

  const operationalRoles = readJson(operationalRolesPath, 'operational-roles.json');
  if (!Array.isArray(operationalRoles)) {
    fail('operational-roles.json must contain an array.');
  }
  assertEqual(operationalRoles, expectedOperationalRoles, 'OperationalRoleCode set');

  return {
    appCodes: applications.length,
    baseRoles: baseRoles.length,
    operationalRoles: operationalRoles.length,
  };
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

function validateReasonCodeDependency() {
  const source = readText(reasonCodeTypesPath, 'reason-code types');
  const required = [
    reasonCodeSourceContractSha256,
    'export type AuthorizationReasonCode =',
    'export type StructuralIssueCode =',
    'export type LaneAvailabilityReasonCode =',
    'export type LaneReasonCode =',
    'export type StructuralIssueSeverity =',
    'export type StructuralIssueSubjectType =',
    'export type StructuralIssueSource =',
  ];

  for (const marker of required) {
    assertIncludes(source, marker, 'reason-code types');
  }
}

function validateMetadata(metadataSource) {
  const markers = [
    'export type ResponseContractName =',
    '| "AccessContext"',
    '| "AuthorizationDecision"',
    '| "SimulationContext"',
    '| "SimulatedAuthorizationDecision"',
    'contract_family: "vento.authorization.response-contracts";',
    'contract_family_version: "1.0.0";',
    'contract_version: string;',
    'schema_version: string;',
    releaseHash,
  ];

  for (const marker of markers) {
    assertIncludes(metadataSource, marker, 'contract metadata');
  }
}

function validateAccessContext(accessSource) {
  const required = [
    'import type { AppCode }',
    'import type { BaseRoleCode }',
    'import type { OperationalRoleCode }',
    'LaneReasonCode,',
    'StructuralIssueCode,',
    'StructuralIssueSeverity,',
    'StructuralIssueSource,',
    'StructuralIssueSubjectType,',
    'from "../../../reason-codes/versions/1.0.0/reason-code.types.js";',
    reasonCodeSourceContractSha256,
    'export type AccessContextV1 = ContractMetadata & {',
    'contract_name: "AccessContext";',
    'contract_version: "1.0.0";',
    'schema_version: "1.0.0";',
    'base_role_code: BaseRoleCode | null;',
    'role_code: BaseRoleCode;',
    'operational_role_code: OperationalRoleCode;',
    'role_code: OperationalRoleCode;',
    'allowed_application_codes: AppCode[];',
    'status: "READY" | "UNAVAILABLE" | "INVALID" | "NOT_APPLICABLE";',
    'reason_codes: LaneReasonCode[];',
    'issue_code: StructuralIssueCode;',
    'severity: StructuralIssueSeverity;',
    'subject_type: StructuralIssueSubjectType;',
    'source: StructuralIssueSource;',
    'source_versions: Record<string, string>;',
    'source_fingerprints: Record<string, string>;',
  ];

  for (const marker of required) {
    assertIncludes(accessSource, marker, 'AccessContextV1');
  }

  const forbidden = [
    'reason_codes: string[];',
    'issue_code: string;',
    'EffectiveContext',
    'EffectiveContextSource',
    'ContextSimulationInput',
    'administrative_bypass',
    'bypass_applied',
    'can_operate',
    'is_simulation',
    'simulation_id',
    'real_administrative_role',
    'effective_administrative_role',
    'metadata: Record<string, unknown>',
    'export type SimulationContextV1',
    'export type AuthorizationDecisionV1',
  ];

  for (const marker of forbidden) {
    assertExcludes(accessSource, marker, 'AccessContextV1');
  }
}

function validateSimulationContext(simulationSource) {
  const required = [
    'export type SimulationContextV1 = ContractMetadata & {',
    'contract_name: "SimulationContext";',
    'contract_version: "1.0.0";',
    'schema_version: "1.0.0";',
    'export type SimulatedAuthorizationDecisionV1 = ContractMetadata & {',
    'contract_name: "SimulatedAuthorizationDecision";',
    'export type SimulatedLaneResult =',
    'required: false;',
    'result: null;',
    'required: true;',
    'result: "WOULD_ALLOW" | "WOULD_DENY" | "INDETERMINATE";',
    'effect: "ALLOW";',
    'lane: "BASE" | "OPERATIONAL";',
    'effect: "DENY";',
    'lane: "BASE" | "OPERATIONAL" | "ALL";',
    'provenance: "VIGENTE" | "PROPUESTA" | "SINTÉTICA";',
    'evaluations: SimulatedAuthorizationDecisionV1[];',
    'final_result: "WOULD_ALLOW" | "WOULD_DENY" | "INDETERMINATE";',
  ];

  for (const marker of required) {
    assertIncludes(simulationSource, marker, 'SimulationContextV1');
  }

  const forbidden = [
    'export type AccessContextV1',
    'export type AuthorizationDecisionV1',
    'effect: "ALLOW";\n      lane: "BASE" | "OPERATIONAL" | "ALL";',
  ];

  for (const marker of forbidden) {
    assertExcludes(simulationSource, marker, 'SimulationContextV1');
  }
}

function validateIndex(indexSource) {
  const required = [
    'ContractMetadata',
    'AccessContextV1',
    'SimulationContextV1',
    'SimulatedAuthorizationDecisionV1',
    'SimulatedLaneResult',
    'SimulationMatch',
  ];

  for (const marker of required) {
    assertIncludes(indexSource, marker, 'response-contract index');
  }

  if (/\bAuthorizationDecisionV1\b/.test(indexSource)) {
    fail('response-contract index contains forbidden standalone identifier: AuthorizationDecisionV1');
  }
}

function validateLegacyBoundary() {
  const legacySource = readText(legacyContextPath, 'legacy os-context types');

  const required = [
    'export type EffectiveContextSource =',
    'export type EffectiveContext = {',
    'export type ContextSimulationInput = {',
    'blocked_reasons: string[];',
    'bypass_applied: boolean;',
    'can_operate: boolean;',
    'metadata: Record<string, unknown>;',
  ];

  for (const marker of required) {
    assertIncludes(legacySource, marker, 'legacy context boundary');
  }
}

function validateReadme() {
  const source = readText(readmePath, 'authorization README');
  const markers = [
    '## Contratos de contexto canónicos',
    '`SHELL-CON-007::GLOBAL`',
    '`AccessContextV1`',
    '`SimulationContextV1`',
    '`SimulatedAuthorizationDecisionV1`',
    '`generated/response-contracts/versions/1.0.0/`',
    '## Códigos de autorización y contexto canónicos',
    '`SHELL-CON-008::GLOBAL`',
    '`LaneReasonCode`',
    '`StructuralIssueCode`',
    'no modifica `@vento/os-context`',
  ];

  for (const marker of markers) {
    assertIncludes(source, marker, 'authorization README');
  }
}

export function validateResponseContracts() {
  generateResponseContracts({ checkOnly: true });

  const metadataSource = readText(metadataPath, 'contract metadata types');
  const accessSource = readText(accessContextPath, 'access context types');
  const simulationSource = readText(simulationContextPath, 'simulation context types');
  const indexSource = readText(indexPath, 'response-contract index');

  validatePackageBoundary();
  const counts = validateCatalogDependencies();
  validateReasonCodeDependency();
  validateMetadata(metadataSource);
  validateAccessContext(accessSource);
  validateSimulationContext(simulationSource);
  validateIndex(indexSource);
  validateLegacyBoundary();
  validateReadme();

  return counts;
}

const isCli = process.argv[1]
  && path.resolve(process.argv[1]) === path.resolve(currentFile);

if (isCli) {
  try {
    const unknown = process.argv.slice(2);
    if (unknown.length > 0) fail(`Unknown arguments: ${unknown.join(', ')}`);

    const counts = validateResponseContracts();

    console.log('[VENTO CONTRACTS] RESPONSE_CONTRACTS PASS');
    console.log(`[VENTO CONTRACTS] CONTRACT_FAMILY ${contractFamily}@${contractFamilyVersion}`);
    console.log('[VENTO CONTRACTS] ACCESS_CONTEXT_VERSION 1.0.0');
    console.log('[VENTO CONTRACTS] SIMULATION_CONTEXT_VERSION 1.0.0');
    console.log('[VENTO CONTRACTS] SIMULATED_DECISION_VERSION 1.0.0');
    console.log(`[VENTO CONTRACTS] APP_CODES ${counts.appCodes}`);
    console.log(`[VENTO CONTRACTS] BASE_ROLE_CODES ${counts.baseRoles}`);
    console.log(`[VENTO CONTRACTS] OPERATIONAL_ROLE_CODES ${counts.operationalRoles}`);
    console.log(`[VENTO CONTRACTS] RELEASE_HASH ${releaseHash}`);
    console.log('[VENTO CONTRACTS] REASON_CODE_TYPES TYPED');
    console.log('[VENTO CONTRACTS] LEGACY_BOUNDARY PRESERVED');
    console.log('[VENTO CONTRACTS] PUBLIC_EXPORTS NONE');
  } catch (error) {
    console.error('[VENTO CONTRACTS] RESPONSE_CONTRACTS FAIL');
    console.error(error instanceof Error ? error.message : String(error));
    process.exitCode = 1;
  }
}