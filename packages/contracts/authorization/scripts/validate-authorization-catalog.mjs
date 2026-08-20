import crypto from 'node:crypto';
import fs from 'node:fs';
import path from 'node:path';
import { fileURLToPath } from 'node:url';

import { generateAuthorizationTypes } from './generate-authorization-types.mjs';

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
const applicationSchemaPath = path.join(authorizationRoot, 'schemas', 'application.schema.json');
const permissionSchemaPath = path.join(authorizationRoot, 'schemas', 'permission.schema.json');

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

const expectedRepositories = new Map([
  ['shell', 'devVentoGroup/vento-shell'],
  ['anima', 'devVentoGroup/vento-anima'],
  ['viso', 'devVentoGroup/vento-viso'],
  ['nexo', 'devVentoGroup/vento-nexo'],
  ['fogo', 'devVentoGroup/vento-fogo'],
  ['origo', 'devVentoGroup/vento-origo'],
  ['pulso', 'devVentoGroup/vento-pulso'],
  ['numera', 'devVentoGroup/vento-numera'],
  ['pass', 'devVentoGroup/vento-pass'],
]);

const expectedPermissionCounts = new Map([
  ["shell", 1],
  ["anima", 10],
  ["aura", 1],
  ["fogo", 6],
  ["nexo", 67],
  ["numera", 6],
  ["origo", 6],
  ["pass", 1],
  ["pulso", 11],
  ["viso", 31]
]);

const legacyBlockedKeys = new Set([
  "fogo.production.recipes.manage",
  "nexo.settings.categories.manage",
  "nexo.settings.units.manage",
  "nexo.settings.supply_routes.manage",
  "nexo.internal_prices.manage",
  "nexo.cost_centers.manage",
  "nexo.settings.sites.manage",
  "nexo.settings.remissions.manage",
  "nexo.inventory.remissions.dispatch",
  "numera.cost_centers.manage",
  "numera.expenses.manage",
  "origo.suppliers.manage",
  "pulso.pos.main",
  "viso.app_navigation.manage",
  "viso.employee_operational_profiles.manage",
  "viso.menu.images.manage",
  "viso.operational_points.manage",
  "viso.site_operational_roles.manage",
  "viso.staff.documents.manage",
  "viso.staff.employee_photos.manage",
  "viso.staff.manage",
  "viso.staff.permissions.manage",
]);
const retiredTechnicalKeys = new Set([
  "nexo.code.view",
  "nexo.edit.view",
  "nexo.login.view",
  "nexo.new.view",
  "nexo.no_access.view",
  "nexo.open.view",
  "nexo.page_tsx.view",
  "nexo.quick.view",
  "nexo.scanner.view",
  "nexo.settings.view",
  "nexo.setup.view",
  "nexo.slug.view",
  "origo.login.view",
  "origo.no_access.view",
]);
const expectedPermissionKeysetSha256 = '8bfa524537c8378907d07487cfd445ada99448e1804a2ac8b3681bc41877afda';

const allowedKinds = new Set(['hub', 'administrative', 'operational', 'hybrid', 'customer']);
const allowedDomains = new Set(['laboral', 'cliente']);
const allowedRoadmaps = new Set(['core', 'deferred', 'adjacent']);
const allowedLifecycle = new Set(['active', 'deprecated', 'retired', 'reserved']);
const appCodePattern = /^[a-z][a-z0-9_]*$/u;
const permissionSegmentPattern = /^[a-z][a-z0-9_]*$/u;
const repositoryPattern = /^[A-Za-z0-9_.-]+\/[A-Za-z0-9_.-]+$/u;

function fail(message) {
  throw new Error(message);
}

function readJson(filePath, label) {
  if (!fs.existsSync(filePath)) fail(`Missing ${label}: ${path.relative(process.cwd(), filePath)}`);
  return JSON.parse(fs.readFileSync(filePath, 'utf8'));
}

function countBy(values, key) {
  const counts = new Map();
  for (const value of values) {
    const current = value[key];
    counts.set(current, (counts.get(current) ?? 0) + 1);
  }
  return counts;
}

function expectCount(counts, value, expected) {
  const actual = counts.get(value) ?? 0;
  if (actual !== expected) fail(`${value} count must be ${expected}; received ${actual}.`);
}

function keysetSha256(permissionKeys) {
  return crypto.createHash('sha256').update(`${permissionKeys.join('\n')}\n`).digest('hex');
}

function validateScopeBoundary() {
  const packagePath = path.resolve(authorizationRoot, '..', 'package.json');
  const packageJson = readJson(packagePath, '@vento/contracts package.json');
  if (packageJson.name !== '@vento/contracts') fail('Unexpected package name.');
  if (packageJson.version !== '1.0.0-alpha.1') fail('Package version changed outside SHELL-CON-003 scope.');
  if (packageJson.private !== true) fail('@vento/contracts must remain private.');
  if ('exports' in packageJson) fail('SHELL-CON-003 must not publish package exports.');

  for (const relativePath of [
    'catalog/current.json',
    'catalog/versions/1.0.0/manifest.json',
    'catalog/versions/1.0.0/aliases.json',
    'catalog/versions/1.0.0/legacy-permissions.json',
    'catalog/versions/1.0.0/retired-permissions.json',
    'catalog/versions/1.0.0/resource-contracts.json',
    'catalog/versions/1.0.0/checksums.json',
    'schemas/catalog-manifest.schema.json',
    'schemas/alias.schema.json',
    'schemas/resource-contract.schema.json',
    'changelog/1.0.0.md',
    'generated/current.ts',
    'generated/index.ts',
  ]) {
    if (fs.existsSync(path.join(authorizationRoot, ...relativePath.split('/')))) {
      fail(`Out-of-scope artifact exists for SHELL-CON-003: ${relativePath}`);
    }
  }
}

function validateClosedSchema(schemaPath, label, requiredFields) {
  const schema = readJson(schemaPath, label);
  if (schema.type !== 'object' || schema.additionalProperties !== false) {
    fail(`${label} must define a closed object.`);
  }
  const required = new Set(schema.required ?? []);
  for (const field of requiredFields) {
    if (!required.has(field)) fail(`${label} missing required field ${field}.`);
  }
  return schema;
}

function validateApplications() {
  validateClosedSchema(applicationSchemaPath, 'application.schema.json', [
    'app_code',
    'display_name',
    'app_kind',
    'domain',
    'roadmap_scope',
    'lifecycle_status',
    'permission_namespace',
    'is_authorization_catalog_member',
  ]);

  const applications = readJson(applicationsPath, 'applications.json');
  if (!Array.isArray(applications)) fail('applications.json must contain an array.');
  if (applications.length !== 10) fail(`applications.json must contain 10 rows; received ${applications.length}.`);

  const codes = applications.map((entry) => entry?.app_code);
  if (JSON.stringify(codes) !== JSON.stringify(expectedCodes)) {
    fail(`Canonical app_code order mismatch: ${codes.join(', ')}`);
  }
  if (new Set(codes).size !== 10) fail('app_code values must be unique.');

  for (const application of applications) {
    const keys = Object.keys(application).sort();
    const allowedKeys = [
      'app_code',
      'app_kind',
      'display_name',
      'domain',
      'is_authorization_catalog_member',
      'lifecycle_status',
      'permission_namespace',
      'repository_owner',
      'roadmap_scope',
    ];
    if (keys.some((key) => !allowedKeys.includes(key))) {
      fail(`${application.app_code}: unexpected property.`);
    }
    if (!appCodePattern.test(application.app_code)) fail(`${application.app_code}: invalid app_code.`);
    if (typeof application.display_name !== 'string' || !application.display_name.trim()) {
      fail(`${application.app_code}: invalid display_name.`);
    }
    if (!allowedKinds.has(application.app_kind)) fail(`${application.app_code}: invalid app_kind.`);
    if (!allowedDomains.has(application.domain)) fail(`${application.app_code}: invalid domain.`);
    if (!allowedRoadmaps.has(application.roadmap_scope)) fail(`${application.app_code}: invalid roadmap_scope.`);
    if (!allowedLifecycle.has(application.lifecycle_status)) fail(`${application.app_code}: invalid lifecycle_status.`);
    if (application.lifecycle_status !== 'active') fail(`${application.app_code}: lifecycle_status must remain active.`);
    if (application.permission_namespace !== application.app_code) {
      fail(`${application.app_code}: permission_namespace must equal app_code.`);
    }
    if (application.is_authorization_catalog_member !== true) {
      fail(`${application.app_code}: is_authorization_catalog_member must be true.`);
    }

    const expectedRepository = expectedRepositories.get(application.app_code);
    if (expectedRepository) {
      if (application.repository_owner !== expectedRepository) {
        fail(`${application.app_code}: repository_owner mismatch.`);
      }
      if (!repositoryPattern.test(application.repository_owner)) {
        fail(`${application.app_code}: invalid repository_owner.`);
      }
    } else if (application.app_code === 'aura' && 'repository_owner' in application) {
      fail('aura: repository_owner must remain absent until repository ownership is confirmed.');
    }
  }

  const domainCounts = countBy(applications, 'domain');
  expectCount(domainCounts, 'laboral', 9);
  expectCount(domainCounts, 'cliente', 1);

  const roadmapCounts = countBy(applications, 'roadmap_scope');
  expectCount(roadmapCounts, 'core', 8);
  expectCount(roadmapCounts, 'deferred', 1);
  expectCount(roadmapCounts, 'adjacent', 1);

  const kindCounts = countBy(applications, 'app_kind');
  expectCount(kindCounts, 'hub', 1);
  expectCount(kindCounts, 'administrative', 2);
  expectCount(kindCounts, 'operational', 2);
  expectCount(kindCounts, 'hybrid', 4);
  expectCount(kindCounts, 'customer', 1);

  return applications;
}

function validatePermissionKeyShape(permission) {
  const { permission_key: permissionKey, app_code: appCode } = permission;
  if (typeof permissionKey !== 'string') fail('permission_key must be a string.');
  const segments = permissionKey.split('.');
  const appAccess = segments.length === 2 && segments[1] === 'access';
  const fullPermission = segments.length === 4 && segments.every((segment) => permissionSegmentPattern.test(segment));
  if (!appAccess && !fullPermission) fail(`${permissionKey}: invalid canonical permission shape.`);
  if (segments[0] !== appCode) fail(`${permissionKey}: first segment must equal app_code ${appCode}.`);
  if (appAccess && permissionKey !== `${appCode}.access`) fail(`${permissionKey}: invalid app access permission.`);
}

function validatePermissions(applications) {
  validateClosedSchema(permissionSchemaPath, 'permission.schema.json', [
    'permission_key',
    'app_code',
    'lifecycle_status',
  ]);

  const permissions = readJson(permissionsPath, 'permissions.json');
  if (!Array.isArray(permissions)) fail('permissions.json must contain an array.');
  if (permissions.length !== 140) fail(`permissions.json must contain 140 rows; received ${permissions.length}.`);

  const applicationCodes = new Set(applications.map((entry) => entry.app_code));
  const permissionKeys = permissions.map((entry) => entry?.permission_key);
  if (new Set(permissionKeys).size !== 140) fail('permission_key values must be unique.');

  const digest = keysetSha256(permissionKeys);
  if (digest !== expectedPermissionKeysetSha256) {
    fail(`Canonical permission keyset digest mismatch: ${digest}.`);
  }

  let legacyOverlap = 0;
  let retiredOverlap = 0;

  for (const permission of permissions) {
    const keys = Object.keys(permission).sort();
    const expectedKeys = ['app_code', 'lifecycle_status', 'permission_key'];
    if (JSON.stringify(keys) !== JSON.stringify(expectedKeys)) {
      fail(`${permission.permission_key ?? 'unknown permission'}: unexpected or missing property.`);
    }
    if (!applicationCodes.has(permission.app_code)) {
      fail(`${permission.permission_key}: unknown app_code ${permission.app_code}.`);
    }
    if (permission.lifecycle_status !== 'active') {
      fail(`${permission.permission_key}: lifecycle_status must be active.`);
    }
    validatePermissionKeyShape(permission);
    if (legacyBlockedKeys.has(permission.permission_key)) legacyOverlap += 1;
    if (retiredTechnicalKeys.has(permission.permission_key)) retiredOverlap += 1;
  }

  if (legacyOverlap !== 0) fail(`Active permissions overlap ${legacyOverlap} blocked legacy keys.`);
  if (retiredOverlap !== 0) fail(`Active permissions overlap ${retiredOverlap} retired technical keys.`);

  const permissionCounts = countBy(permissions, 'app_code');
  for (const [appCode, expected] of expectedPermissionCounts.entries()) {
    expectCount(permissionCounts, appCode, expected);
  }
  if (permissionCounts.size !== expectedPermissionCounts.size) {
    fail('permissions.json contains an unexpected application namespace.');
  }

  return {
    count: permissions.length,
    digest,
    legacyOverlap,
    retiredOverlap,
  };
}

try {
  validateScopeBoundary();
  const applications = validateApplications();
  const permissionResult = validatePermissions(applications);
  generateAuthorizationTypes({ checkOnly: true });

  console.log('[VENTO CONTRACTS] AUTHORIZATION_CATALOG PASS');
  console.log(`[VENTO CONTRACTS] APPLICATIONS ${applications.length}`);
  console.log(`[VENTO CONTRACTS] PERMISSIONS ${permissionResult.count}`);
  console.log('[VENTO CONTRACTS] UNIQUE_PERMISSION_KEYS 140');
  console.log(`[VENTO CONTRACTS] PERMISSION_KEYSET_SHA256 ${permissionResult.digest}`);
  console.log(`[VENTO CONTRACTS] LEGACY_ACTIVE_OVERLAP ${permissionResult.legacyOverlap}`);
  console.log(`[VENTO CONTRACTS] RETIRED_ACTIVE_OVERLAP ${permissionResult.retiredOverlap}`);
  console.log('[VENTO CONTRACTS] GENERATED FRESH');
} catch (error) {
  console.error('[VENTO CONTRACTS] AUTHORIZATION_CATALOG FAIL');
  console.error(error instanceof Error ? error.message : String(error));
  process.exitCode = 1;
}