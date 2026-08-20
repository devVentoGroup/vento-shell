import crypto from 'node:crypto';
import fs from 'node:fs';
import path from 'node:path';
import { fileURLToPath } from 'node:url';

import { generateBaseRoleContracts } from './generate-base-role-contracts.mjs';

const currentFile = fileURLToPath(import.meta.url);
const scriptDirectory = path.dirname(currentFile);
const authorizationRoot = path.resolve(scriptDirectory, '..');

const baseRolesPath = path.join(
  authorizationRoot,
  'catalog',
  'base-roles',
  'versions',
  '1.1.0',
  'base-roles.json',
);
const permissionsPath = path.join(
  authorizationRoot,
  'catalog',
  'versions',
  '1.0.0',
  'permissions.json',
);
const baselineDatasetPath = path.join(
  authorizationRoot,
  'datasets',
  'base-role-grants',
  'versions',
  '1.0.0',
  'base-role-grants.jsonl',
);
const successorDatasetPath = path.join(
  authorizationRoot,
  'datasets',
  'base-role-grants',
  'versions',
  '1.1.0',
  'base-role-grants.jsonl',
);

const expectedRoles = [
  "propietario",
  "gerente_general",
  "gerente",
  "supervisor",
  "auxiliar_administrativa",
  "contador",
  "marketing",
  "trabajador_operativo"
];
const excludedRoles = new Set([
  'barista',
  'bodeguero',
  'cajero',
  'cocinero',
  'conductor',
  'mesero',
  'panadero',
  'pastelero',
  'repostero',
  'logistica',
  'talento_humano',
]);
const expectedRoleCounts = new Map([
  ['propietario', 121],
  ['gerente_general', 119],
  ['gerente', 93],
  ['supervisor', 58],
  ['auxiliar_administrativa', 47],
  ['contador', 45],
  ['marketing', 16],
  ['trabajador_operativo', 5],
]);
const expectedApplicationCounts = new Map([
  ['shell', 8],
  ['anima', 52],
  ['aura', 3],
  ['fogo', 19],
  ['nexo', 251],
  ['numera', 27],
  ['origo', 31],
  ['pass', 2],
  ['pulso', 18],
  ['viso', 93],
]);
const expectedModeCounts = new Map([
  ['BASE_ONLY', 256],
  ['BASE_OR_OPERATIONAL', 212],
  ['BASE_AND_OPERATIONAL', 36],
  ['OPERATIONAL_ONLY', 0],
]);
const expectedGrantTypeCounts = new Map([
  ['DIRECT_BASE', 468],
  ['BASE_COMPONENT', 36],
]);
const workerPermissionKeys = [
  'anima.access',
  'anima.workforce.employee_documents.upload',
  'anima.workforce.employee_documents.view',
  'anima.workforce.employee_photos.upload',
  'shell.access',
];
const expectedBaselineHash = 'bcea5460dfea42ecd2491a550bfe511478faa5403d766166c9e731cb499214e1';
const expectedSuccessorHash = '5fcde3858d5fc6ba1c210987962e32b3e2d535dc286b225b1ddb6ba4b0bb06d0';

function fail(message) {
  throw new Error(message);
}

function readJson(filePath, label) {
  if (!fs.existsSync(filePath)) fail(`Missing ${label}: ${path.relative(process.cwd(), filePath)}`);
  return JSON.parse(fs.readFileSync(filePath, 'utf8'));
}

function readJsonl(filePath, label) {
  if (!fs.existsSync(filePath)) fail(`Missing ${label}: ${path.relative(process.cwd(), filePath)}`);
  const raw = fs.readFileSync(filePath, 'utf8');
  if (!raw.endsWith('\n') || raw.endsWith('\n\n') || raw.includes('\r')) {
    fail(`${label} must use LF, exactly one final LF and no CR characters.`);
  }
  const lines = raw.slice(0, -1).split('\n');
  return {
    raw,
    hash: crypto.createHash('sha256').update(raw).digest('hex'),
    manifest: JSON.parse(lines[0]),
    records: lines.slice(1).map((line) => JSON.parse(line)),
  };
}

function countBy(values, selector) {
  const result = new Map();
  for (const value of values) {
    const key = selector(value);
    result.set(key, (result.get(key) ?? 0) + 1);
  }
  return result;
}

function expectMapCounts(actual, expected, label) {
  for (const [key, value] of expected.entries()) {
    const received = actual.get(key) ?? 0;
    if (received !== value) fail(`${label} ${key} must be ${value}; received ${received}.`);
  }
  for (const [key, value] of actual.entries()) {
    if (!expected.has(key) && value !== 0) fail(`${label} contains unexpected key ${key}.`);
  }
}

function validatePackageBoundary() {
  const packagePath = path.resolve(authorizationRoot, '..', 'package.json');
  const packageJson = readJson(packagePath, '@vento/contracts package.json');
  if (packageJson.name !== '@vento/contracts') fail('Unexpected package name.');
  if (packageJson.version !== '1.0.0-alpha.1') fail('Package version changed outside SHELL-CON-004 scope.');
  if (packageJson.private !== true) fail('@vento/contracts must remain private.');
  if ('exports' in packageJson) fail('SHELL-CON-004 must not publish package exports.');
  for (const relativePath of ['catalog/current.json', 'generated/current.ts', 'generated/index.ts']) {
    if (fs.existsSync(path.join(authorizationRoot, ...relativePath.split('/')))) {
      fail(`Out-of-scope publication artifact exists: ${relativePath}`);
    }
  }
}

export function validateBaseRoleContracts() {
  validatePackageBoundary();
  const generated = generateBaseRoleContracts({ checkOnly: true });

  const baseRoles = readJson(baseRolesPath, 'base-roles.json');
  if (JSON.stringify(baseRoles) !== JSON.stringify(expectedRoles)) {
    fail('base-roles.json must contain exactly the eight canonical BaseRoleCode values in contract order.');
  }
  for (const role of baseRoles) {
    if (excludedRoles.has(role)) fail(`Excluded legacy role appears in base role catalog: ${role}.`);
  }

  const baseline = readJsonl(baselineDatasetPath, 'base-role-grants@1.0.0');
  const successor = readJsonl(successorDatasetPath, 'base-role-grants@1.1.0');
  if (baseline.hash !== expectedBaselineHash) fail(`Baseline dataset hash mismatch: ${baseline.hash}.`);
  if (successor.hash !== expectedSuccessorHash) fail(`Successor dataset hash mismatch: ${successor.hash}.`);
  if (baseline.records.length !== 499) fail(`Baseline record count must be 499; received ${baseline.records.length}.`);
  if (successor.records.length !== 504) fail(`Successor record count must be 504; received ${successor.records.length}.`);

  const inherited = successor.records.filter((record) => record.role_code !== 'trabajador_operativo');
  if (inherited.length !== baseline.records.length) fail('Successor inherited record count does not match baseline.');
  for (let index = 0; index < baseline.records.length; index += 1) {
    if (JSON.stringify(inherited[index]) !== JSON.stringify(baseline.records[index])) {
      fail(`Successor mutated baseline record at index ${index}.`);
    }
  }

  const permissionRows = readJson(permissionsPath, 'permissions.json');
  if (!Array.isArray(permissionRows) || permissionRows.length !== 140) {
    fail('permissions.json must preserve exactly 140 active identities.');
  }
  const permissionKeys = new Set(permissionRows.map((entry) => entry.permission_key));

  const pairSet = new Set();
  for (const record of successor.records) {
    const pair = `${record.role_code}\u0000${record.permission_key}`;
    if (pairSet.has(pair)) fail(`Duplicate role/permission pair: ${record.role_code} + ${record.permission_key}.`);
    pairSet.add(pair);
    if (!expectedRoles.includes(record.role_code)) fail(`Unexpected role_code ${record.role_code}.`);
    if (excludedRoles.has(record.role_code)) fail(`Legacy role_code ${record.role_code} is forbidden.`);
    if (!permissionKeys.has(record.permission_key)) fail(`Unknown PermissionKey ${record.permission_key}.`);
    if (record.lane !== 'BASE') fail(`${record.grant_id}: lane must be BASE.`);
    if (record.effect !== 'ALLOW') fail(`${record.grant_id}: effect must be ALLOW.`);
    if (record.grant_id !== `base-role-grant:${record.role_code}:${record.permission_key}`) {
      fail(`${record.grant_id}: grant_id does not match role and permission.`);
    }
    if (!['DIRECT_BASE', 'BASE_COMPONENT'].includes(record.grant_type)) {
      fail(`${record.grant_id}: invalid grant_type ${record.grant_type}.`);
    }
    if (!['BASE_ONLY', 'BASE_OR_OPERATIONAL', 'BASE_AND_OPERATIONAL'].includes(record.authorization_mode)) {
      fail(`${record.grant_id}: invalid authorization_mode ${record.authorization_mode}.`);
    }
    if (record.grant_type === 'BASE_COMPONENT' && record.authorization_mode !== 'BASE_AND_OPERATIONAL') {
      fail(`${record.grant_id}: BASE_COMPONENT must be BASE_AND_OPERATIONAL.`);
    }
  }

  const roleCounts = countBy(successor.records, (record) => record.role_code);
  expectMapCounts(roleCounts, expectedRoleCounts, 'role count');

  const appCounts = countBy(successor.records, (record) => record.permission_key.split('.')[0]);
  expectMapCounts(appCounts, expectedApplicationCounts, 'application count');

  const modeCounts = countBy(successor.records, (record) => record.authorization_mode);
  expectMapCounts(modeCounts, expectedModeCounts, 'authorization mode count');

  const grantTypeCounts = countBy(successor.records, (record) => record.grant_type);
  expectMapCounts(grantTypeCounts, expectedGrantTypeCounts, 'grant type count');

  const workerRows = successor.records.filter((record) => record.role_code === 'trabajador_operativo');
  const workerKeys = workerRows.map((record) => record.permission_key);
  if (JSON.stringify(workerKeys) !== JSON.stringify(workerPermissionKeys)) {
    fail(`trabajador_operativo PermissionKey set mismatch: ${workerKeys.join(', ')}.`);
  }
  for (const record of workerRows) {
    if (record.authorization_mode !== 'BASE_ONLY') fail(`${record.grant_id}: worker grant must be BASE_ONLY.`);
    if (record.grant_type !== 'DIRECT_BASE') fail(`${record.grant_id}: worker grant must be DIRECT_BASE.`);
    if (record.source_task !== 'AUTH-MOD-021') fail(`${record.grant_id}: source_task must be AUTH-MOD-021.`);
  }

  return {
    base_roles: baseRoles.length,
    baseline_records: baseline.records.length,
    successor_records: successor.records.length,
    direct_base: grantTypeCounts.get('DIRECT_BASE') ?? 0,
    base_component: grantTypeCounts.get('BASE_COMPONENT') ?? 0,
    worker_grants: workerRows.length,
    worker_default_deny_permissions: permissionRows.length - workerRows.length,
    baseline_hash: baseline.hash,
    successor_hash: successor.hash,
    generated: generated.results,
  };
}

const isCli = process.argv[1]
  && path.resolve(process.argv[1]) === path.resolve(currentFile);

if (isCli) {
  try {
    const result = validateBaseRoleContracts();
    console.log('[VENTO CONTRACTS] BASE_ROLE_CONTRACTS PASS');
    console.log(`[VENTO CONTRACTS] BASE_ROLES ${result.base_roles}`);
    console.log(`[VENTO CONTRACTS] BASE_ROLE_GRANTS_1_0_0 ${result.baseline_records}`);
    console.log(`[VENTO CONTRACTS] BASE_ROLE_GRANTS_1_1_0 ${result.successor_records}`);
    console.log(`[VENTO CONTRACTS] DIRECT_BASE ${result.direct_base}`);
    console.log(`[VENTO CONTRACTS] BASE_COMPONENT ${result.base_component}`);
    console.log(`[VENTO CONTRACTS] WORKER_GRANTS ${result.worker_grants}`);
    console.log(`[VENTO CONTRACTS] WORKER_DEFAULT_DENY_PERMISSIONS ${result.worker_default_deny_permissions}`);
    console.log(`[VENTO CONTRACTS] BASE_ROLE_GRANTS_1_0_0_SHA256 ${result.baseline_hash}`);
    console.log(`[VENTO CONTRACTS] BASE_ROLE_GRANTS_1_1_0_SHA256 ${result.successor_hash}`);
    console.log('[VENTO CONTRACTS] GENERATED FRESH');
  } catch (error) {
    console.error('[VENTO CONTRACTS] BASE_ROLE_CONTRACTS FAIL');
    console.error(error instanceof Error ? error.message : String(error));
    process.exitCode = 1;
  }
}