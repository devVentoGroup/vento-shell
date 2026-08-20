import crypto from 'node:crypto';
import fs from 'node:fs';
import path from 'node:path';
import { fileURLToPath } from 'node:url';

const currentFile = fileURLToPath(import.meta.url);
const scriptDirectory = path.dirname(currentFile);
const authorizationRoot = path.resolve(scriptDirectory, '..');
const repositoryRoot = path.resolve(authorizationRoot, '../../..');

const canonicalDatasetsPath = path.join(
  repositoryRoot,
  'docs',
  'plan-canonico',
  'modular',
  'bloques',
  'D_MATRICES',
  '09_DATASETS.md',
);

const operationalRolesPath = path.join(
  authorizationRoot,
  'catalog',
  'operational-roles',
  'versions',
  '1.0.0',
  'operational-roles.json',
);

const operationalDatasetPath = path.join(
  authorizationRoot,
  'datasets',
  'operational-role-grants',
  'versions',
  '1.0.0',
  'operational-role-grants.jsonl',
);

const generatedDirectory = path.join(
  authorizationRoot,
  'generated',
  'operational-roles',
  'versions',
  '1.0.0',
);

const generatedTypesPath = path.join(generatedDirectory, 'operational-role.types.ts');
const generatedValuesPath = path.join(generatedDirectory, 'operational-role.values.ts');
const generatedIndexPath = path.join(generatedDirectory, 'index.ts');

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

const expectedDatasetHash = '3e28cb780c346fbc5cf583fe9cf20d1a88333c4fd459fc233380d9e627c6f94f';
const expectedContractReleaseHash = 'sha256:687e1bc19c0cf7332e76ed940cf5a23b829492ebbee399af718fd326cf473cbe';

const expectedManifest = {
  dataset_id: 'vento.authorization.operational-role-grants',
  dataset_version: '1.0.0',
  dataset_schema_version: '1.0.0',
  catalog_id: 'vento.authorization',
  catalog_version: '1.0.0',
  catalog_schema_version: '1.0.0',
  contract_release_hash: expectedContractReleaseHash,
  record_count: 240,
  operational_role_count: 12,
  direct_operational_count: 218,
  operational_component_count: 22,
  effect: 'ALLOW_ONLY',
};

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

function assertExactJson(actual, expected, label) {
  if (JSON.stringify(actual) !== JSON.stringify(expected)) {
    fail(`${label} does not match the canonical contract.`);
  }
}

function extractOperationalPayload() {
  if (!fs.existsSync(canonicalDatasetsPath)) {
    fail(`Missing canonical dataset source: ${path.relative(process.cwd(), canonicalDatasetsPath)}`);
  }

  const markdown = fs.readFileSync(canonicalDatasetsPath, 'utf8').replaceAll('\r\n', '\n');
  const lines = markdown.split('\n');

  const taskStart = lines.findIndex(
    (line) => line.startsWith('### ') && line.includes('AUTH-RBAC-025'),
  );
  if (taskStart < 0) {
    fail('AUTH-RBAC-025 section not found in canonical dataset source.');
  }

  const taskEndRelative = lines
    .slice(taskStart + 1)
    .findIndex((line) => line.startsWith('### ') && line.includes('AUTH-RBAC-026'));
  const taskEnd = taskEndRelative < 0
    ? lines.length
    : taskStart + 1 + taskEndRelative;

  const taskLines = lines.slice(taskStart, taskEnd);

  const payloadHeading = taskLines.findIndex(
    (line) => line.startsWith('#### 18.') && line.includes('Payload'),
  );
  if (payloadHeading < 0) {
    fail('AUTH-RBAC-025 payload heading not found.');
  }

  const fenceStartRelative = taskLines
    .slice(payloadHeading + 1)
    .findIndex((line) => line.trim() === '```jsonl');
  if (fenceStartRelative < 0) {
    fail('AUTH-RBAC-025 jsonl fence not found.');
  }

  const fenceStart = payloadHeading + 1 + fenceStartRelative + 1;
  const fenceEndRelative = taskLines
    .slice(fenceStart)
    .findIndex((line) => line.trim() === '```');
  if (fenceEndRelative < 0) {
    fail('AUTH-RBAC-025 jsonl fence is not closed.');
  }

  const payloadLines = taskLines.slice(fenceStart, fenceStart + fenceEndRelative);
  if (payloadLines.length !== 241) {
    fail(`AUTH-RBAC-025 payload must contain 241 lines; received ${payloadLines.length}.`);
  }

  const payload = `${payloadLines.join('\n')}\n`;
  const digest = sha256(payload);

  if (digest !== expectedDatasetHash) {
    fail(`AUTH-RBAC-025 dataset hash mismatch: ${digest}.`);
  }

  const manifest = JSON.parse(payloadLines[0]);
  assertExactJson(manifest, expectedManifest, 'AUTH-RBAC-025 manifest');

  const records = payloadLines.slice(1).map((line) => JSON.parse(line));
  if (records.length !== 240) {
    fail(`AUTH-RBAC-025 must contain 240 records; received ${records.length}.`);
  }

  return {
    payload,
    records,
    digest,
  };
}

function readOperationalRoles() {
  const roles = readJson(operationalRolesPath, 'operational-roles.json');

  if (!Array.isArray(roles)) {
    fail('operational-roles.json must contain an array.');
  }

  assertExactJson(roles, expectedOperationalRoles, 'operational-roles.json');

  if (new Set(roles).size !== roles.length) {
    fail('operational-roles.json contains duplicate role codes.');
  }

  return roles;
}

function renderTypes(roles) {
  const union = roles.map((role) => `  | ${JSON.stringify(role)}`).join('\n');
  return `// GENERATED FILE. DO NOT EDIT.\n// Source: authorization/catalog/operational-roles/versions/1.0.0/operational-roles.json\n\nexport type OperationalRoleCode =\n${union};\n`;
}

function renderValues(roles) {
  const values = roles.map((role) => `  ${JSON.stringify(role)},`).join('\n');
  return `// GENERATED FILE. DO NOT EDIT.\n// Source: authorization/catalog/operational-roles/versions/1.0.0/operational-roles.json\n\nimport type { OperationalRoleCode } from "./operational-role.types.js";\n\nexport const OPERATIONAL_ROLE_CODES = [\n${values}\n] as const satisfies readonly OperationalRoleCode[];\n\nconst OPERATIONAL_ROLE_CODE_SET = new Set<string>(OPERATIONAL_ROLE_CODES);\n\nexport function isOperationalRoleCode(value: unknown): value is OperationalRoleCode {\n  return typeof value === "string" && OPERATIONAL_ROLE_CODE_SET.has(value);\n}\n`;
}

function renderIndex() {
  return `// GENERATED FILE. DO NOT EDIT.\n// Source: authorization/catalog/operational-roles/versions/1.0.0/operational-roles.json\n\nexport type { OperationalRoleCode } from "./operational-role.types.js";\nexport { OPERATIONAL_ROLE_CODES, isOperationalRoleCode } from "./operational-role.values.js";\n`;
}

function assertOrWrite(filePath, expected, checkOnly) {
  const current = fs.existsSync(filePath)
    ? fs.readFileSync(filePath, 'utf8')
    : null;

  if (checkOnly) {
    if (current !== expected) {
      fail(`Generated artifact is stale: ${path.relative(process.cwd(), filePath)}`);
    }
    return 'FRESH';
  }

  fs.mkdirSync(path.dirname(filePath), { recursive: true });

  if (current !== expected) {
    fs.writeFileSync(filePath, expected, 'utf8');
  }

  return current === expected ? 'FRESH' : 'UPDATED';
}

export function generateOperationalRoleContracts({ checkOnly = false } = {}) {
  const roles = readOperationalRoles();
  const dataset = extractOperationalPayload();

  const results = {
    dataset: assertOrWrite(operationalDatasetPath, dataset.payload, checkOnly),
    types: assertOrWrite(generatedTypesPath, renderTypes(roles), checkOnly),
    values: assertOrWrite(generatedValuesPath, renderValues(roles), checkOnly),
    index: assertOrWrite(generatedIndexPath, renderIndex(), checkOnly),
  };

  return {
    operational_roles: roles.length,
    dataset_records: dataset.records.length,
    dataset_hash: dataset.digest,
    results,
  };
}

const isCli = process.argv[1]
  && path.resolve(process.argv[1]) === path.resolve(currentFile);

if (isCli) {
  try {
    const unknown = process.argv
      .slice(2)
      .filter((argument) => argument !== '--check');

    if (unknown.length > 0) {
      fail(`Unknown arguments: ${unknown.join(', ')}`);
    }

    const checkOnly = process.argv.includes('--check');
    const result = generateOperationalRoleContracts({ checkOnly });

    console.log(
      `[VENTO CONTRACTS] OPERATIONAL_ROLE_CONTRACTS ${checkOnly ? 'CHECK' : 'GENERATE'} PASS`,
    );
    console.log(`[VENTO CONTRACTS] OPERATIONAL_ROLES ${result.operational_roles}`);
    console.log(`[VENTO CONTRACTS] OPERATIONAL_ROLE_GRANTS_1_0_0 ${result.dataset_records}`);
    console.log(
      `[VENTO CONTRACTS] OPERATIONAL_ROLE_GRANTS_1_0_0_SHA256 ${result.dataset_hash}`,
    );
    console.log(`[VENTO CONTRACTS] DATASET ${result.results.dataset}`);
    console.log(`[VENTO CONTRACTS] TYPES ${result.results.types}`);
    console.log(`[VENTO CONTRACTS] VALUES ${result.results.values}`);
    console.log(`[VENTO CONTRACTS] INDEX ${result.results.index}`);
  } catch (error) {
    console.error('[VENTO CONTRACTS] OPERATIONAL_ROLE_CONTRACTS FAIL');
    console.error(error instanceof Error ? error.message : String(error));
    process.exitCode = 1;
  }
}