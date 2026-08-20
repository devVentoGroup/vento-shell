import crypto from 'node:crypto';
import fs from 'node:fs';
import path from 'node:path';
import { fileURLToPath } from 'node:url';

import { generateOperationalRoleContracts } from './generate-operational-role-contracts.mjs';

const currentFile = fileURLToPath(import.meta.url);
const scriptDirectory = path.dirname(currentFile);
const authorizationRoot = path.resolve(scriptDirectory, '..');

const operationalRolesPath = path.join(
  authorizationRoot,
  'catalog',
  'operational-roles',
  'versions',
  '1.0.0',
  'operational-roles.json',
);

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

const operationalDatasetPath = path.join(
  authorizationRoot,
  'datasets',
  'operational-role-grants',
  'versions',
  '1.0.0',
  'operational-role-grants.jsonl',
);

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

const expectedRoleCounts = new Map([
  ['cajero_satelite', 20],
  ['barista_satelite', 11],
  ['cocinero_satelite', 11],
  ['servicio_salon', 11],
  ['mostrador_satelite', 11],
  ['operador_integral_satelite', 21],
  ['produccion_cocina', 16],
  ['produccion_panaderia', 16],
  ['produccion_reposteria', 16],
  ['bodeguero', 36],
  ['conductor_logistica', 16],
  ['gerencia_operativa', 55],
]);

const expectedDirectByRole = new Map([
  ['cajero_satelite', 15],
  ['barista_satelite', 11],
  ['cocinero_satelite', 11],
  ['servicio_salon', 11],
  ['mostrador_satelite', 11],
  ['operador_integral_satelite', 16],
  ['produccion_cocina', 16],
  ['produccion_panaderia', 16],
  ['produccion_reposteria', 16],
  ['bodeguero', 36],
  ['conductor_logistica', 16],
  ['gerencia_operativa', 43],
]);

const expectedComponentByRole = new Map([
  ['cajero_satelite', 5],
  ['barista_satelite', 0],
  ['cocinero_satelite', 0],
  ['servicio_salon', 0],
  ['mostrador_satelite', 0],
  ['operador_integral_satelite', 5],
  ['produccion_cocina', 0],
  ['produccion_panaderia', 0],
  ['produccion_reposteria', 0],
  ['bodeguero', 0],
  ['conductor_logistica', 0],
  ['gerencia_operativa', 12],
]);

const expectedApplicationCounts = new Map([
  ['fogo', 19],
  ['nexo', 181],
  ['origo', 9],
  ['pulso', 31],
]);

const expectedModeCounts = new Map([
  ['BASE_OR_OPERATIONAL', 174],
  ['OPERATIONAL_ONLY', 44],
  ['BASE_AND_OPERATIONAL', 22],
  ['BASE_ONLY', 0],
]);

const expectedGrantTypeCounts = new Map([
  ['DIRECT_OPERATIONAL', 218],
  ['OPERATIONAL_COMPONENT', 22],
]);

const expectedDatasetHash = '3e28cb780c346fbc5cf583fe9cf20d1a88333c4fd459fc233380d9e627c6f94f';

function fail(message) {
  throw new Error(message);
}

function readJson(filePath, label) {
  if (!fs.existsSync(filePath)) {
    fail(`Missing ${label}: ${path.relative(process.cwd(), filePath)}`);
  }
  return JSON.parse(fs.readFileSync(filePath, 'utf8'));
}

function readJsonl(filePath, label) {
  if (!fs.existsSync(filePath)) {
    fail(`Missing ${label}: ${path.relative(process.cwd(), filePath)}`);
  }

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

    if (received !== value) {
      fail(`${label} ${key} must be ${value}; received ${received}.`);
    }
  }

  for (const [key, value] of actual.entries()) {
    if (!expected.has(key) && value !== 0) {
      fail(`${label} contains unexpected key ${key}.`);
    }
  }
}

function validatePackageBoundary() {
  const packagePath = path.resolve(authorizationRoot, '..', 'package.json');
  const packageJson = readJson(packagePath, '@vento/contracts package.json');

  if (packageJson.name !== '@vento/contracts') {
    fail('Unexpected package name.');
  }

  if (packageJson.version !== '1.0.0-alpha.1') {
    fail('Package version changed outside SHELL-CON-005 scope.');
  }

  if (packageJson.private !== true) {
    fail('@vento/contracts must remain private.');
  }

  if ('exports' in packageJson) {
    fail('SHELL-CON-005 must not publish package exports.');
  }

  for (const relativePath of [
    'catalog/current.json',
    'generated/current.ts',
    'generated/index.ts',
  ]) {
    if (fs.existsSync(path.join(authorizationRoot, ...relativePath.split('/')))) {
      fail(`Out-of-scope publication artifact exists: ${relativePath}`);
    }
  }
}

export function validateOperationalRoleContracts() {
  validatePackageBoundary();

  const generated = generateOperationalRoleContracts({ checkOnly: true });

  const operationalRoles = readJson(operationalRolesPath, 'operational-roles.json');
  if (JSON.stringify(operationalRoles) !== JSON.stringify(expectedOperationalRoles)) {
    fail(
      'operational-roles.json must contain exactly the twelve canonical OperationalRoleCode values in contract order.',
    );
  }

  if (new Set(operationalRoles).size !== operationalRoles.length) {
    fail('operational-roles.json contains duplicate role codes.');
  }

  if (operationalRoles.includes('propietario_admin')) {
    fail('propietario_admin is forbidden in OperationalRoleCode.');
  }

  const baseRoles = readJson(baseRolesPath, 'base-roles.json');
  if (JSON.stringify(baseRoles) !== JSON.stringify(expectedBaseRoles)) {
    fail('base-roles.json no longer matches the SHELL-CON-004 dependency.');
  }

  const baseRoleSet = new Set(baseRoles);
  const overlap = operationalRoles.filter((role) => baseRoleSet.has(role));
  if (overlap.length > 0) {
    fail(`OperationalRoleCode overlaps BaseRoleCode: ${overlap.join(', ')}.`);
  }

  const permissionRows = readJson(permissionsPath, 'permissions.json');
  if (!Array.isArray(permissionRows) || permissionRows.length !== 140) {
    fail('permissions.json must preserve exactly 140 active identities.');
  }

  const permissionKeys = new Set(permissionRows.map((entry) => entry.permission_key));
  if (permissionKeys.size !== 140) {
    fail('permissions.json contains duplicate permission identities.');
  }

  const dataset = readJsonl(
    operationalDatasetPath,
    'operational-role-grants@1.0.0',
  );

  if (dataset.hash !== expectedDatasetHash) {
    fail(`Operational dataset hash mismatch: ${dataset.hash}.`);
  }

  if (dataset.records.length !== 240) {
    fail(`Operational dataset must contain 240 records; received ${dataset.records.length}.`);
  }

  if (dataset.manifest.dataset_id !== 'vento.authorization.operational-role-grants') {
    fail('Unexpected operational dataset_id.');
  }

  if (dataset.manifest.dataset_version !== '1.0.0') {
    fail('Operational dataset version must remain 1.0.0.');
  }

  if (dataset.manifest.record_count !== 240) {
    fail('Operational dataset manifest record_count must be 240.');
  }

  if (dataset.manifest.operational_role_count !== 12) {
    fail('Operational dataset manifest operational_role_count must be 12.');
  }

  if (dataset.manifest.direct_operational_count !== 218) {
    fail('Operational dataset manifest direct_operational_count must be 218.');
  }

  if (dataset.manifest.operational_component_count !== 22) {
    fail('Operational dataset manifest operational_component_count must be 22.');
  }

  if (dataset.manifest.effect !== 'ALLOW_ONLY') {
    fail('Operational dataset manifest effect must be ALLOW_ONLY.');
  }

  const pairSet = new Set();
  let legacyDispatchCount = 0;
  let baseRoleOverlapCount = 0;

  for (const record of dataset.records) {
    const pair = `${record.operational_role_code}\u0000${record.permission_key}`;

    if (pairSet.has(pair)) {
      fail(
        `Duplicate operational role/permission pair: ${record.operational_role_code} + ${record.permission_key}.`,
      );
    }
    pairSet.add(pair);

    if (!expectedOperationalRoles.includes(record.operational_role_code)) {
      fail(`Unexpected operational_role_code ${record.operational_role_code}.`);
    }

    if (record.operational_role_code === 'propietario_admin') {
      fail('propietario_admin appears in operational dataset.');
    }

    if (baseRoleSet.has(record.operational_role_code)) {
      baseRoleOverlapCount += 1;
      fail(`BaseRoleCode appears in operational dataset: ${record.operational_role_code}.`);
    }

    if (!permissionKeys.has(record.permission_key)) {
      fail(`Unknown or non-active PermissionKey ${record.permission_key}.`);
    }

    if (record.permission_key.includes('*')) {
      fail(`Wildcard PermissionKey is forbidden: ${record.permission_key}.`);
    }

    if (record.permission_key === 'nexo.inventory.remissions.dispatch') {
      legacyDispatchCount += 1;
      fail('Legacy remissions.dispatch is forbidden in operational dataset.');
    }

    if (record.lane !== 'OPERATIONAL') {
      fail(`${record.grant_id}: lane must be OPERATIONAL.`);
    }

    if (record.effect !== 'ALLOW') {
      fail(`${record.grant_id}: effect must be ALLOW.`);
    }

    if (!['DIRECT_OPERATIONAL', 'OPERATIONAL_COMPONENT'].includes(record.grant_type)) {
      fail(`${record.grant_id}: invalid grant_type ${record.grant_type}.`);
    }

    if (
      ![
        'BASE_OR_OPERATIONAL',
        'OPERATIONAL_ONLY',
        'BASE_AND_OPERATIONAL',
      ].includes(record.authorization_mode)
    ) {
      fail(`${record.grant_id}: invalid authorization_mode ${record.authorization_mode}.`);
    }

    if (record.authorization_mode === 'BASE_ONLY') {
      fail(`${record.grant_id}: BASE_ONLY is forbidden in operational dataset.`);
    }

    if (
      record.grant_type === 'OPERATIONAL_COMPONENT'
      && record.authorization_mode !== 'BASE_AND_OPERATIONAL'
    ) {
      fail(`${record.grant_id}: OPERATIONAL_COMPONENT must be BASE_AND_OPERATIONAL.`);
    }

    if (
      record.authorization_mode === 'BASE_AND_OPERATIONAL'
      && record.grant_type !== 'OPERATIONAL_COMPONENT'
    ) {
      fail(`${record.grant_id}: BASE_AND_OPERATIONAL must be OPERATIONAL_COMPONENT.`);
    }

    const expectedGrantId =
      `operational-role-grant:${record.operational_role_code}:${record.permission_key}`;

    if (record.grant_id !== expectedGrantId) {
      fail(`${record.grant_id}: grant_id does not match role and permission.`);
    }

    for (const field of ['scope_expression', 'condition_expression', 'source_task']) {
      if (typeof record[field] !== 'string' || record[field].trim() === '') {
        fail(`${record.grant_id}: ${field} must be a non-empty string.`);
      }
    }
  }

  if (pairSet.size !== 240) {
    fail(`Operational dataset must contain 240 unique pairs; received ${pairSet.size}.`);
  }

  const roleCounts = countBy(
    dataset.records,
    (record) => record.operational_role_code,
  );
  expectMapCounts(roleCounts, expectedRoleCounts, 'role count');

  const directByRole = countBy(
    dataset.records.filter((record) => record.grant_type === 'DIRECT_OPERATIONAL'),
    (record) => record.operational_role_code,
  );
  expectMapCounts(directByRole, expectedDirectByRole, 'direct role count');

  const componentByRole = countBy(
    dataset.records.filter((record) => record.grant_type === 'OPERATIONAL_COMPONENT'),
    (record) => record.operational_role_code,
  );
  expectMapCounts(componentByRole, expectedComponentByRole, 'component role count');

  const applicationCounts = countBy(
    dataset.records,
    (record) => record.permission_key.split('.')[0],
  );
  expectMapCounts(applicationCounts, expectedApplicationCounts, 'application count');

  const modeCounts = countBy(
    dataset.records,
    (record) => record.authorization_mode,
  );
  expectMapCounts(modeCounts, expectedModeCounts, 'authorization mode count');

  const grantTypeCounts = countBy(
    dataset.records,
    (record) => record.grant_type,
  );
  expectMapCounts(grantTypeCounts, expectedGrantTypeCounts, 'grant type count');

  return {
    operational_roles: operationalRoles.length,
    records: dataset.records.length,
    unique_pairs: pairSet.size,
    direct_operational: grantTypeCounts.get('DIRECT_OPERATIONAL') ?? 0,
    operational_component: grantTypeCounts.get('OPERATIONAL_COMPONENT') ?? 0,
    base_or_operational: modeCounts.get('BASE_OR_OPERATIONAL') ?? 0,
    operational_only: modeCounts.get('OPERATIONAL_ONLY') ?? 0,
    base_and_operational: modeCounts.get('BASE_AND_OPERATIONAL') ?? 0,
    base_only: modeCounts.get('BASE_ONLY') ?? 0,
    base_role_overlap: baseRoleOverlapCount,
    legacy_dispatch: legacyDispatchCount,
    dataset_hash: dataset.hash,
    generated: generated.results,
  };
}

const isCli = process.argv[1]
  && path.resolve(process.argv[1]) === path.resolve(currentFile);

if (isCli) {
  try {
    const result = validateOperationalRoleContracts();

    console.log('[VENTO CONTRACTS] OPERATIONAL_ROLE_CONTRACTS PASS');
    console.log(`[VENTO CONTRACTS] OPERATIONAL_ROLES ${result.operational_roles}`);
    console.log(`[VENTO CONTRACTS] OPERATIONAL_ROLE_GRANTS_1_0_0 ${result.records}`);
    console.log(`[VENTO CONTRACTS] UNIQUE_PAIRS ${result.unique_pairs}`);
    console.log(`[VENTO CONTRACTS] DIRECT_OPERATIONAL ${result.direct_operational}`);
    console.log(`[VENTO CONTRACTS] OPERATIONAL_COMPONENT ${result.operational_component}`);
    console.log(`[VENTO CONTRACTS] BASE_OR_OPERATIONAL ${result.base_or_operational}`);
    console.log(`[VENTO CONTRACTS] OPERATIONAL_ONLY ${result.operational_only}`);
    console.log(`[VENTO CONTRACTS] BASE_AND_OPERATIONAL ${result.base_and_operational}`);
    console.log(`[VENTO CONTRACTS] BASE_ONLY ${result.base_only}`);
    console.log(`[VENTO CONTRACTS] BASE_ROLE_OVERLAP ${result.base_role_overlap}`);
    console.log(`[VENTO CONTRACTS] LEGACY_DISPATCH ${result.legacy_dispatch}`);
    console.log(
      `[VENTO CONTRACTS] OPERATIONAL_ROLE_GRANTS_1_0_0_SHA256 ${result.dataset_hash}`,
    );
    console.log('[VENTO CONTRACTS] GENERATED FRESH');
  } catch (error) {
    console.error('[VENTO CONTRACTS] OPERATIONAL_ROLE_CONTRACTS FAIL');
    console.error(error instanceof Error ? error.message : String(error));
    process.exitCode = 1;
  }
}