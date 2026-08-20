import fs from 'node:fs';
import path from 'node:path';
import { fileURLToPath } from 'node:url';

import { generateAuthorizationApplicationTypes } from './generate-authorization-types.mjs';

const currentFile = fileURLToPath(import.meta.url);
const scriptDirectory = path.dirname(currentFile);
const authorizationRoot = path.resolve(scriptDirectory, '..');
const sourcePath = path.join(
  authorizationRoot,
  'catalog',
  'versions',
  '1.0.0',
  'applications.json',
);
const schemaPath = path.join(authorizationRoot, 'schemas', 'application.schema.json');

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

const allowedKinds = new Set(['hub', 'administrative', 'operational', 'hybrid', 'customer']);
const allowedDomains = new Set(['laboral', 'cliente']);
const allowedRoadmaps = new Set(['core', 'deferred', 'adjacent']);
const allowedLifecycle = new Set(['active', 'deprecated', 'retired', 'reserved']);
const appCodePattern = /^[a-z][a-z0-9_]*$/u;
const repositoryPattern = /^[A-Za-z0-9_.-]+\/[A-Za-z0-9_.-]+$/u;

function fail(message) {
  throw new Error(message);
}

function countBy(applications, key) {
  const counts = new Map();
  for (const application of applications) {
    const value = application[key];
    counts.set(value, (counts.get(value) ?? 0) + 1);
  }
  return counts;
}

function expectCount(counts, value, expected) {
  const actual = counts.get(value) ?? 0;
  if (actual !== expected) fail(`${value} count must be ${expected}; received ${actual}.`);
}

function validateScopeBoundary() {
  const packagePath = path.resolve(authorizationRoot, '..', 'package.json');
  const packageJson = JSON.parse(fs.readFileSync(packagePath, 'utf8'));
  if (packageJson.name !== '@vento/contracts') fail('Unexpected package name.');
  if (packageJson.version !== '1.0.0-alpha.1') fail('Package version changed outside SHELL-CON-002 scope.');
  if (packageJson.private !== true) fail('@vento/contracts must remain private.');
  if ('exports' in packageJson) fail('SHELL-CON-002 must not publish package exports.');

  for (const relativePath of [
    'catalog/current.json',
    'catalog/versions/1.0.0/manifest.json',
    'catalog/versions/1.0.0/permissions.json',
    'catalog/versions/1.0.0/aliases.json',
    'catalog/versions/1.0.0/legacy-permissions.json',
    'catalog/versions/1.0.0/retired-permissions.json',
    'catalog/versions/1.0.0/resource-contracts.json',
    'catalog/versions/1.0.0/checksums.json',
    'changelog/1.0.0.md',
    'generated/current.ts',
    'generated/index.ts',
  ]) {
    if (fs.existsSync(path.join(authorizationRoot, ...relativePath.split('/')))) {
      fail(`Out-of-scope artifact exists for SHELL-CON-002: ${relativePath}`);
    }
  }
}

function validateSchemaContract() {
  const schema = JSON.parse(fs.readFileSync(schemaPath, 'utf8'));
  if (schema.type !== 'object' || schema.additionalProperties !== false) {
    fail('application.schema.json must define a closed object.');
  }
  const required = new Set(schema.required ?? []);
  for (const field of [
    'app_code',
    'display_name',
    'app_kind',
    'domain',
    'roadmap_scope',
    'lifecycle_status',
    'permission_namespace',
    'is_authorization_catalog_member',
  ]) {
    if (!required.has(field)) fail(`application.schema.json missing required field ${field}.`);
  }
}

function validateApplications() {
  const applications = JSON.parse(fs.readFileSync(sourcePath, 'utf8'));
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

  generateAuthorizationApplicationTypes({ checkOnly: true });
  return applications.length;
}

try {
  validateScopeBoundary();
  validateSchemaContract();
  const applicationCount = validateApplications();
  console.log('[VENTO CONTRACTS] AUTHORIZATION_APPLICATIONS PASS');
  console.log(`[VENTO CONTRACTS] APPLICATIONS ${applicationCount}`);
  console.log('[VENTO CONTRACTS] UNIQUE_CODES 10');
  console.log('[VENTO CONTRACTS] GENERATED FRESH');
} catch (error) {
  console.error('[VENTO CONTRACTS] AUTHORIZATION_APPLICATIONS FAIL');
  console.error(error instanceof Error ? error.message : String(error));
  process.exitCode = 1;
}