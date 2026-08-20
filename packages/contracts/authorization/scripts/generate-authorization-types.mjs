import fs from 'node:fs';
import path from 'node:path';
import { fileURLToPath } from 'node:url';

const currentFile = fileURLToPath(import.meta.url);
const scriptDirectory = path.dirname(currentFile);
const authorizationRoot = path.resolve(scriptDirectory, '..');
const catalogVersion = '1.0.0';
const catalogVersionDirectory = path.join(
  authorizationRoot,
  'catalog',
  'versions',
  catalogVersion,
);
const applicationsPath = path.join(catalogVersionDirectory, 'applications.json');
const permissionsPath = path.join(catalogVersionDirectory, 'permissions.json');
const outputDirectory = path.join(
  authorizationRoot,
  'generated',
  'versions',
  catalogVersion,
);
const typesPath = path.join(outputDirectory, 'catalog.types.ts');
const valuesPath = path.join(outputDirectory, 'catalog.values.ts');
const indexPath = path.join(outputDirectory, 'index.ts');

const expectedCodes = [
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

function fail(message) {
  throw new Error(message);
}

function readJsonArray(filePath, label) {
  if (!fs.existsSync(filePath)) {
    fail(`Missing ${label} source: ${path.relative(process.cwd(), filePath)}`);
  }
  const value = JSON.parse(fs.readFileSync(filePath, 'utf8'));
  if (!Array.isArray(value)) fail(`${label} must contain an array.`);
  return value;
}

function readApplications() {
  const applications = readJsonArray(applicationsPath, 'applications.json');
  if (applications.length !== expectedCodes.length) {
    fail(`applications.json must contain exactly ${expectedCodes.length} applications.`);
  }
  const codes = applications.map((entry) => entry?.app_code);
  if (JSON.stringify(codes) !== JSON.stringify(expectedCodes)) {
    fail(`applications.json app_code order mismatch: ${codes.join(', ')}`);
  }
  if (new Set(codes).size !== codes.length) fail('applications.json contains duplicate app_code values.');
  return applications;
}

function readPermissions(applications) {
  const permissions = readJsonArray(permissionsPath, 'permissions.json');
  if (permissions.length !== 140) {
    fail(`permissions.json must contain exactly 140 permissions; received ${permissions.length}.`);
  }
  const applicationCodes = new Set(applications.map((entry) => entry.app_code));
  const permissionKeys = permissions.map((entry) => entry?.permission_key);
  if (new Set(permissionKeys).size !== permissionKeys.length) {
    fail('permissions.json contains duplicate permission_key values.');
  }
  for (const permission of permissions) {
    if (!applicationCodes.has(permission?.app_code)) {
      fail(`${permission?.permission_key ?? 'unknown permission'} references unknown app_code ${permission?.app_code}.`);
    }
    if (typeof permission?.permission_key !== 'string' || !permission.permission_key.startsWith(`${permission.app_code}.`)) {
      fail(`${permission?.permission_key ?? 'unknown permission'} does not match app_code ${permission?.app_code}.`);
    }
    if (permission?.lifecycle_status !== 'active') {
      fail(`${permission?.permission_key ?? 'unknown permission'} must have lifecycle_status active.`);
    }
  }
  return permissions;
}

function quotedUnion(values) {
  return values.map((value) => JSON.stringify(value)).join(' | ');
}

function quotedMultilineUnion(values) {
  return values.map((value) => `  | ${JSON.stringify(value)}`).join('\n');
}

function renderTypes(applications, permissions) {
  const domains = [...new Set(applications.map((entry) => entry.domain))];
  const kinds = [...new Set(applications.map((entry) => entry.app_kind))];
  const roadmapScopes = [...new Set(applications.map((entry) => entry.roadmap_scope))];
  return `// GENERATED FILE. DO NOT EDIT.
// Sources:
// - authorization/catalog/versions/${catalogVersion}/applications.json
// - authorization/catalog/versions/${catalogVersion}/permissions.json

export type AppCode = ${quotedUnion(applications.map((entry) => entry.app_code))};

export type AppDomain = ${quotedUnion(domains)};

export type AppKind = ${quotedUnion(kinds)};

export type RoadmapScope = ${quotedUnion(roadmapScopes)};

export type ApplicationLifecycleStatus =
  | "active"
  | "deprecated"
  | "retired"
  | "reserved";

export interface ApplicationDefinition {
  readonly app_code: AppCode;
  readonly display_name: string;
  readonly app_kind: AppKind;
  readonly domain: AppDomain;
  readonly roadmap_scope: RoadmapScope;
  readonly lifecycle_status: ApplicationLifecycleStatus;
  readonly repository_owner?: string;
  readonly permission_namespace: AppCode;
  readonly is_authorization_catalog_member: boolean;
}

export type ApplicationByCode = Readonly<Record<AppCode, ApplicationDefinition>>;

export type PermissionKey =
${quotedMultilineUnion(permissions.map((entry) => entry.permission_key))};

export type PermissionLifecycleStatus =
  | "active"
  | "deprecated"
  | "retired"
  | "reserved";

export interface PermissionIdentityDefinition {
  readonly permission_key: PermissionKey;
  readonly app_code: AppCode;
  readonly lifecycle_status: PermissionLifecycleStatus;
}

export type PermissionByKey = Readonly<Record<PermissionKey, PermissionIdentityDefinition>>;
`;
}

function renderObjectArray(values) {
  return JSON.stringify(values, null, 2)
    .replace(/"([^"]+)":/g, '$1:')
    .replace(/"([^"]+)"/g, '"$1"');
}

function renderValues(applications, permissions) {
  const applicationSource = renderObjectArray(applications);
  const permissionSource = renderObjectArray(permissions);
  const applicationCodeList = applications.map((entry) => `  "${entry.app_code}",`).join('\n');
  const applicationMapEntries = applications
    .map((entry, index) => `  ${entry.app_code}: APPLICATIONS[${index}],`)
    .join('\n');
  const permissionKeyList = permissions.map((entry) => `  "${entry.permission_key}",`).join('\n');
  const permissionMapEntries = permissions
    .map((entry, index) => `  "${entry.permission_key}": PERMISSION_IDENTITIES[${index}],`)
    .join('\n');
  return `// GENERATED FILE. DO NOT EDIT.
// Sources:
// - authorization/catalog/versions/${catalogVersion}/applications.json
// - authorization/catalog/versions/${catalogVersion}/permissions.json

import type {
  AppCode,
  ApplicationByCode,
  ApplicationDefinition,
  PermissionByKey,
  PermissionIdentityDefinition,
  PermissionKey,
} from "./catalog.types.js";

export const APPLICATION_CODES = [
${applicationCodeList}
] as const satisfies readonly AppCode[];

export const APPLICATIONS = ${applicationSource} as const satisfies readonly ApplicationDefinition[];

export const APPLICATION_BY_CODE = {
${applicationMapEntries}
} as const satisfies ApplicationByCode;

export const PERMISSION_KEYS = [
${permissionKeyList}
] as const satisfies readonly PermissionKey[];

export const PERMISSION_IDENTITIES = ${permissionSource} as const satisfies readonly PermissionIdentityDefinition[];

export const PERMISSION_BY_KEY = {
${permissionMapEntries}
} as const satisfies PermissionByKey;

const APPLICATION_CODE_SET = new Set<string>(APPLICATION_CODES);
const PERMISSION_KEY_SET = new Set<string>(PERMISSION_KEYS);

export function isAppCode(value: unknown): value is AppCode {
  return typeof value === "string" && APPLICATION_CODE_SET.has(value);
}

export function isPermissionKey(value: unknown): value is PermissionKey {
  return typeof value === "string" && PERMISSION_KEY_SET.has(value);
}
`;
}

function renderIndex() {
  return `// GENERATED FILE. DO NOT EDIT.
// Sources:
// - authorization/catalog/versions/${catalogVersion}/applications.json
// - authorization/catalog/versions/${catalogVersion}/permissions.json

export type {
  AppCode,
  AppDomain,
  AppKind,
  RoadmapScope,
  ApplicationLifecycleStatus,
  ApplicationDefinition,
  ApplicationByCode,
  PermissionKey,
  PermissionLifecycleStatus,
  PermissionIdentityDefinition,
  PermissionByKey,
} from "./catalog.types.js";

export {
  APPLICATION_CODES,
  APPLICATIONS,
  APPLICATION_BY_CODE,
  PERMISSION_KEYS,
  PERMISSION_IDENTITIES,
  PERMISSION_BY_KEY,
  isAppCode,
  isPermissionKey,
} from "./catalog.values.js";
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

export function generateAuthorizationTypes({ checkOnly = false } = {}) {
  const applications = readApplications();
  const permissions = readPermissions(applications);
  const results = {
    types: assertOrWrite(typesPath, renderTypes(applications, permissions), checkOnly),
    values: assertOrWrite(valuesPath, renderValues(applications, permissions), checkOnly),
    index: assertOrWrite(indexPath, renderIndex(), checkOnly),
  };
  return {
    applications: applications.length,
    permissions: permissions.length,
    results,
  };
}

export function generateAuthorizationApplicationTypes(options = {}) {
  return generateAuthorizationTypes(options);
}

const isCli = process.argv[1]
  && path.resolve(process.argv[1]) === path.resolve(currentFile);

if (isCli) {
  try {
    const unknown = process.argv.slice(2).filter((argument) => argument !== '--check');
    if (unknown.length > 0) fail(`Unknown arguments: ${unknown.join(', ')}`);
    const checkOnly = process.argv.includes('--check');
    const result = generateAuthorizationTypes({ checkOnly });
    console.log(`[VENTO CONTRACTS] AUTHORIZATION_TYPES ${checkOnly ? 'CHECK' : 'GENERATE'} PASS`);
    console.log(`[VENTO CONTRACTS] APPLICATIONS ${result.applications}`);
    console.log(`[VENTO CONTRACTS] PERMISSIONS ${result.permissions}`);
    console.log(`[VENTO CONTRACTS] TYPES ${result.results.types}`);
    console.log(`[VENTO CONTRACTS] VALUES ${result.results.values}`);
    console.log(`[VENTO CONTRACTS] INDEX ${result.results.index}`);
  } catch (error) {
    console.error('[VENTO CONTRACTS] AUTHORIZATION_TYPES FAIL');
    console.error(error instanceof Error ? error.message : String(error));
    process.exitCode = 1;
  }
}