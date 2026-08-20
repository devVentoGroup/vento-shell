import fs from 'node:fs';
import path from 'node:path';
import { fileURLToPath } from 'node:url';

const currentFile = fileURLToPath(import.meta.url);
const scriptDirectory = path.dirname(currentFile);
const authorizationRoot = path.resolve(scriptDirectory, '..');
const catalogVersion = '1.0.0';
const sourcePath = path.join(
  authorizationRoot,
  'catalog',
  'versions',
  catalogVersion,
  'applications.json',
);
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

function readApplications() {
  if (!fs.existsSync(sourcePath)) {
    fail(`Missing applications source: ${path.relative(process.cwd(), sourcePath)}`);
  }
  const applications = JSON.parse(fs.readFileSync(sourcePath, 'utf8'));
  if (!Array.isArray(applications)) fail('applications.json must contain an array.');
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

function quotedUnion(values) {
  return values.map((value) => JSON.stringify(value)).join(' | ');
}

function renderTypes(applications) {
  const domains = [...new Set(applications.map((entry) => entry.domain))];
  const kinds = [...new Set(applications.map((entry) => entry.app_kind))];
  const roadmapScopes = [...new Set(applications.map((entry) => entry.roadmap_scope))];
  return `// GENERATED FILE. DO NOT EDIT.
// Source: authorization/catalog/versions/${catalogVersion}/applications.json

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
`;
}

function renderValues(applications) {
  const source = JSON.stringify(applications, null, 2)
    .replace(/"([^"]+)":/g, '$1:')
    .replace(/"([^"]+)"/g, '"$1"');
  const codeList = applications.map((entry) => `  "${entry.app_code}",`).join('\n');
  const mapEntries = applications
    .map((entry, index) => `  ${entry.app_code}: APPLICATIONS[${index}],`)
    .join('\n');
  return `// GENERATED FILE. DO NOT EDIT.
// Source: authorization/catalog/versions/${catalogVersion}/applications.json

import type {
  AppCode,
  ApplicationByCode,
  ApplicationDefinition,
} from "./catalog.types.js";

export const APPLICATION_CODES = [
${codeList}
] as const satisfies readonly AppCode[];

export const APPLICATIONS = ${source} as const satisfies readonly ApplicationDefinition[];

export const APPLICATION_BY_CODE = {
${mapEntries}
} as const satisfies ApplicationByCode;

const APPLICATION_CODE_SET = new Set<string>(APPLICATION_CODES);

export function isAppCode(value: unknown): value is AppCode {
  return typeof value === "string" && APPLICATION_CODE_SET.has(value);
}
`;
}

function renderIndex() {
  return `// GENERATED FILE. DO NOT EDIT.
// Source: authorization/catalog/versions/${catalogVersion}/applications.json

export type {
  AppCode,
  AppDomain,
  AppKind,
  RoadmapScope,
  ApplicationLifecycleStatus,
  ApplicationDefinition,
  ApplicationByCode,
} from "./catalog.types.js";

export {
  APPLICATION_CODES,
  APPLICATIONS,
  APPLICATION_BY_CODE,
  isAppCode,
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

export function generateAuthorizationApplicationTypes({ checkOnly = false } = {}) {
  const applications = readApplications();
  const results = {
    types: assertOrWrite(typesPath, renderTypes(applications), checkOnly),
    values: assertOrWrite(valuesPath, renderValues(applications), checkOnly),
    index: assertOrWrite(indexPath, renderIndex(), checkOnly),
  };
  return { applications: applications.length, results };
}

const isCli = process.argv[1]
  && path.resolve(process.argv[1]) === path.resolve(currentFile);

if (isCli) {
  try {
    const unknown = process.argv.slice(2).filter((argument) => argument !== '--check');
    if (unknown.length > 0) fail(`Unknown arguments: ${unknown.join(', ')}`);
    const checkOnly = process.argv.includes('--check');
    const result = generateAuthorizationApplicationTypes({ checkOnly });
    console.log(`[VENTO CONTRACTS] APPLICATION_TYPES ${checkOnly ? 'CHECK' : 'GENERATE'} PASS`);
    console.log(`[VENTO CONTRACTS] APPLICATIONS ${result.applications}`);
    console.log(`[VENTO CONTRACTS] TYPES ${result.results.types}`);
    console.log(`[VENTO CONTRACTS] VALUES ${result.results.values}`);
    console.log(`[VENTO CONTRACTS] INDEX ${result.results.index}`);
  } catch (error) {
    console.error(`[VENTO CONTRACTS] APPLICATION_TYPES FAIL`);
    console.error(error instanceof Error ? error.message : String(error));
    process.exitCode = 1;
  }
}