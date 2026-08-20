import crypto from 'node:crypto';
import fs from 'node:fs';
import path from 'node:path';
import { fileURLToPath } from 'node:url';

import { generatePermissionScopeContracts } from './generate-permission-scope-contracts.mjs';

const currentFile = fileURLToPath(import.meta.url);
const scriptDirectory = path.dirname(currentFile);
const authorizationRoot = path.resolve(scriptDirectory, '..');
const catalogVersion = '1.0.0';

const scopeSourcePath = path.join(
  authorizationRoot,
  'catalog',
  'scopes',
  'versions',
  catalogVersion,
  'scopes.json',
);

const permissionsPath = path.join(
  authorizationRoot,
  'catalog',
  'versions',
  catalogVersion,
  'permissions.json',
);

const expectedSourceSha256 = '70987732aae8d2d6e6bad40e6abba16e98823224cd1c19b28f0bfd1088dcd85d';
const expectedPermissionKeysetSha256 = '8bfa524537c8378907d07487cfd445ada99448e1804a2ac8b3681bc41877afda';

const expectedDefinitions = [
  {
    scope_code: 'NT',
    scope_category: 'NON_TERRITORIAL',
    canonical_order: 1,
    semantics: 'El permiso no admite dimensión territorial variable. La ausencia de sede o área no crea territorio implícito.',
  },
  {
    scope_code: 'ORG',
    scope_category: 'NON_TERRITORIAL',
    canonical_order: 2,
    semantics: 'El recurso queda limitado a la organización, unidad, catálogo, canal o dominio exacto definido por su contrato, sin fabricar una sede.',
  },
  {
    scope_code: 'G',
    scope_category: 'TERRITORIAL',
    canonical_order: 3,
    semantics: 'Autoriza el permiso exacto en el ámbito ordinario de la organización. No es universal, no cruza aplicaciones ni incorpora recursos aislados.',
  },
  {
    scope_code: 'AS',
    scope_category: 'TERRITORIAL',
    canonical_order: 4,
    semantics: 'Conjunto de sedes activas asignadas al actor mediante la relación laboral autorizada.',
  },
  {
    scope_code: 'SS',
    scope_category: 'TERRITORIAL',
    canonical_order: 5,
    semantics: 'Una sede concreta autorizada para el permiso y recurso evaluados.',
  },
  {
    scope_code: 'AST',
    scope_category: 'TERRITORIAL',
    canonical_order: 6,
    semantics: 'Subconjunto de sedes asignadas al actor que además coincide con un tipo de sede exacto.',
  },
  {
    scope_code: 'TST',
    scope_category: 'TERRITORIAL',
    canonical_order: 7,
    semantics: 'Conjunto transversal de sedes ordinarias de un tipo exacto, únicamente mediante concesión explícita; nunca se infiere desde AST.',
  },
  {
    scope_code: 'AA',
    scope_category: 'TERRITORIAL',
    canonical_order: 8,
    semantics: 'Conjunto de áreas activas asignadas al actor dentro de sedes autorizadas.',
  },
  {
    scope_code: 'SA',
    scope_category: 'TERRITORIAL',
    canonical_order: 9,
    semantics: 'Un área concreta dentro de una sede autorizada.',
  },
  {
    scope_code: 'AAT',
    scope_category: 'TERRITORIAL',
    canonical_order: 10,
    semantics: 'Subconjunto de áreas asignadas al actor que coincide con un tipo de área exacto.',
  },
  {
    scope_code: 'ATW',
    scope_category: 'TERRITORIAL',
    canonical_order: 11,
    semantics: 'Conjunto transversal de áreas de un tipo exacto, siempre acotado por una sede o conjunto superior de sedes autorizado.',
  },
  {
    scope_code: 'CTX',
    scope_category: 'OPERATIONAL_CONTEXT',
    canonical_order: 12,
    semantics: 'Territorio efectivo resuelto por el carril operativo. No aporta por sí mismo turno, check-in ni área activa.',
  },
  {
    scope_code: 'OWN',
    scope_category: 'OWNERSHIP',
    canonical_order: 13,
    semantics: 'Restricción o variante sobre recurso propio, creado o atribuido según el contrato del recurso. Puede combinarse con territorio, pero nunca ampliarlo.',
  },
];

const expectedCategoryCounts = new Map([
  ['NON_TERRITORIAL', 2],
  ['TERRITORIAL', 9],
  ['OPERATIONAL_CONTEXT', 1],
  ['OWNERSHIP', 1],
]);

function fail(message) {
  throw new Error(message);
}

function sha256(value) {
  return crypto.createHash('sha256').update(value).digest('hex');
}

function readJson(filePath, label) {
  if (!fs.existsSync(filePath)) {
    fail(`Missing ${label}: ${path.relative(process.cwd(), filePath)}`);
  }
  return JSON.parse(fs.readFileSync(filePath, 'utf8'));
}

function readCanonicalJson(filePath, label) {
  if (!fs.existsSync(filePath)) {
    fail(`Missing ${label}: ${path.relative(process.cwd(), filePath)}`);
  }
  const raw = fs.readFileSync(filePath, 'utf8');
  if (!raw.endsWith('\n') || raw.endsWith('\n\n') || raw.includes('\r')) {
    fail(`${label} must use LF, exactly one final LF and no CR characters.`);
  }
  return {
    raw,
    hash: sha256(raw),
    value: JSON.parse(raw),
  };
}

function assertExactJson(actual, expected, label) {
  if (JSON.stringify(actual) !== JSON.stringify(expected)) {
    fail(`${label} does not match the canonical SHELL-CON-006 contract.`);
  }
}

function countBy(values, selector) {
  const counts = new Map();
  for (const value of values) {
    const key = selector(value);
    counts.set(key, (counts.get(key) ?? 0) + 1);
  }
  return counts;
}

function expectMapCounts(actual, expected, label) {
  for (const [key, expectedCount] of expected.entries()) {
    const received = actual.get(key) ?? 0;
    if (received !== expectedCount) {
      fail(`${label} ${key} must be ${expectedCount}; received ${received}.`);
    }
  }
  for (const [key, received] of actual.entries()) {
    if (!expected.has(key) && received !== 0) {
      fail(`${label} contains unexpected key ${key}.`);
    }
  }
}

function validatePackageBoundary() {
  const packagePath = path.resolve(authorizationRoot, '..', 'package.json');
  const packageJson = readJson(packagePath, '@vento/contracts package.json');

  if (packageJson.name !== '@vento/contracts') fail('Unexpected package name.');
  if (packageJson.version !== '1.0.0-alpha.1') {
    fail('Package version changed outside SHELL-CON-006 scope.');
  }
  if (packageJson.private !== true) fail('@vento/contracts must remain private.');
  if ('exports' in packageJson) fail('SHELL-CON-006 must not publish package exports.');

  for (const relativePath of [
    'catalog/current.json',
    'catalog/versions/1.0.0/manifest.json',
    'catalog/versions/1.0.0/checksums.json',
    'changelog/1.0.0.md',
    'generated/current.ts',
    'generated/index.ts',
  ]) {
    if (fs.existsSync(path.join(authorizationRoot, ...relativePath.split('/')))) {
      fail(`Out-of-scope publication artifact exists: ${relativePath}`);
    }
  }
}

function validateScopeDefinitions() {
  const source = readCanonicalJson(scopeSourcePath, 'scopes.json');
  if (source.hash !== expectedSourceSha256) {
    fail(`scopes.json SHA256 mismatch: ${source.hash}.`);
  }
  if (!Array.isArray(source.value)) fail('scopes.json must contain an array.');
  if (source.value.length !== 13) {
    fail(`scopes.json must contain exactly 13 definitions; received ${source.value.length}.`);
  }

  assertExactJson(source.value, expectedDefinitions, 'scopes.json');

  const expectedKeys = ['scope_code', 'scope_category', 'canonical_order', 'semantics'];
  const codes = [];
  for (let index = 0; index < source.value.length; index += 1) {
    const definition = source.value[index];
    const keys = Object.keys(definition);
    if (JSON.stringify(keys) !== JSON.stringify(expectedKeys)) {
      fail(`${definition.scope_code ?? `index ${index}`}: unexpected property order or shape.`);
    }
    if (definition.canonical_order !== index + 1) {
      fail(`${definition.scope_code}: canonical_order must be ${index + 1}.`);
    }
    if (!/^[A-Z][A-Z0-9]*$/u.test(definition.scope_code)) {
      fail(`${definition.scope_code}: invalid scope_code shape.`);
    }
    if (typeof definition.semantics !== 'string' || !definition.semantics.trim()) {
      fail(`${definition.scope_code}: semantics must be a non-empty string.`);
    }
    codes.push(definition.scope_code);
  }

  if (new Set(codes).size !== 13) fail('scope_code values must be unique.');
  const categoryCounts = countBy(source.value, (definition) => definition.scope_category);
  expectMapCounts(categoryCounts, expectedCategoryCounts, 'scope category count');

  return {
    count: source.value.length,
    unique: new Set(codes).size,
    categoryCounts,
    hash: source.hash,
  };
}

function validatePermissionIdentityBoundary() {
  const permissions = readJson(permissionsPath, 'permissions.json');
  if (!Array.isArray(permissions) || permissions.length !== 140) {
    fail('permissions.json must preserve exactly 140 active identities.');
  }

  const expectedKeys = ['app_code', 'lifecycle_status', 'permission_key'];
  const permissionKeys = [];
  for (const permission of permissions) {
    const keys = Object.keys(permission).sort();
    if (JSON.stringify(keys) !== JSON.stringify(expectedKeys)) {
      fail(`${permission.permission_key ?? 'unknown permission'}: SHELL-CON-006 must not add permission metadata.`);
    }
    if (permission.lifecycle_status !== 'active') {
      fail(`${permission.permission_key}: lifecycle_status must remain active.`);
    }
    permissionKeys.push(permission.permission_key);
  }

  if (new Set(permissionKeys).size !== 140) {
    fail('permissions.json must preserve 140 unique permission_key values.');
  }

  const digest = sha256(`${permissionKeys.join('\n')}\n`);
  if (digest !== expectedPermissionKeysetSha256) {
    fail(`Permission keyset SHA256 mismatch: ${digest}.`);
  }

  return {
    count: permissions.length,
    digest,
  };
}

export function validatePermissionScopeContracts() {
  validatePackageBoundary();
  const scopeResult = validateScopeDefinitions();
  const permissionResult = validatePermissionIdentityBoundary();
  const generated = generatePermissionScopeContracts({ checkOnly: true });

  return {
    scope_codes: scopeResult.count,
    unique_scope_codes: scopeResult.unique,
    non_territorial: scopeResult.categoryCounts.get('NON_TERRITORIAL') ?? 0,
    territorial: scopeResult.categoryCounts.get('TERRITORIAL') ?? 0,
    operational_context: scopeResult.categoryCounts.get('OPERATIONAL_CONTEXT') ?? 0,
    ownership: scopeResult.categoryCounts.get('OWNERSHIP') ?? 0,
    source_hash: scopeResult.hash,
    permissions: permissionResult.count,
    permission_keyset_hash: permissionResult.digest,
    generated: generated.results,
  };
}

const isCli = process.argv[1]
  && path.resolve(process.argv[1]) === path.resolve(currentFile);

if (isCli) {
  try {
    const result = validatePermissionScopeContracts();
    console.log('[VENTO CONTRACTS] PERMISSION_SCOPE_CONTRACTS PASS');
    console.log(`[VENTO CONTRACTS] PERMISSION_SCOPE_CODES ${result.scope_codes}`);
    console.log(`[VENTO CONTRACTS] UNIQUE_SCOPE_CODES ${result.unique_scope_codes}`);
    console.log(`[VENTO CONTRACTS] NON_TERRITORIAL ${result.non_territorial}`);
    console.log(`[VENTO CONTRACTS] TERRITORIAL ${result.territorial}`);
    console.log(`[VENTO CONTRACTS] OPERATIONAL_CONTEXT ${result.operational_context}`);
    console.log(`[VENTO CONTRACTS] OWNERSHIP ${result.ownership}`);
    console.log(`[VENTO CONTRACTS] SOURCE_SHA256 ${result.source_hash}`);
    console.log(`[VENTO CONTRACTS] PERMISSIONS ${result.permissions}`);
    console.log(`[VENTO CONTRACTS] PERMISSION_KEYSET_SHA256 ${result.permission_keyset_hash}`);
    console.log('[VENTO CONTRACTS] G_NOT_UNIVERSAL PASS');
    console.log('[VENTO CONTRACTS] TST_NOT_FROM_AST PASS');
    console.log('[VENTO CONTRACTS] ATW_UPPER_BOUND PASS');
    console.log('[VENTO CONTRACTS] CTX_PREREQUISITES_NOT_IMPLIED PASS');
    console.log('[VENTO CONTRACTS] OWN_NO_EXPANSION PASS');
    console.log('[VENTO CONTRACTS] GENERATED FRESH');
  } catch (error) {
    console.error('[VENTO CONTRACTS] PERMISSION_SCOPE_CONTRACTS FAIL');
    console.error(error instanceof Error ? error.message : String(error));
    process.exitCode = 1;
  }
}