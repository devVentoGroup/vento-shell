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

const baseRolesPath = path.join(
  authorizationRoot,
  'catalog',
  'base-roles',
  'versions',
  '1.1.0',
  'base-roles.json',
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
const generatedDirectory = path.join(
  authorizationRoot,
  'generated',
  'base-roles',
  'versions',
  '1.1.0',
);
const generatedTypesPath = path.join(generatedDirectory, 'base-role.types.ts');
const generatedValuesPath = path.join(generatedDirectory, 'base-role.values.ts');
const generatedIndexPath = path.join(generatedDirectory, 'index.ts');

const expectedBaseRoles = [
  "propietario",
  "gerente_general",
  "gerente",
  "supervisor",
  "auxiliar_administrativa",
  "contador",
  "marketing",
  "trabajador_operativo"
];
const expectedBaselineHash = 'bcea5460dfea42ecd2491a550bfe511478faa5403d766166c9e731cb499214e1';
const expectedSuccessorHash = '5fcde3858d5fc6ba1c210987962e32b3e2d535dc286b225b1ddb6ba4b0bb06d0';
const expectedContractReleaseHash = 'sha256:687e1bc19c0cf7332e76ed940cf5a23b829492ebbee399af718fd326cf473cbe';
const workerRows = [
  {
    "grant_id": "base-role-grant:trabajador_operativo:anima.access",
    "role_code": "trabajador_operativo",
    "permission_key": "anima.access",
    "authorization_mode": "BASE_ONLY",
    "lane": "BASE",
    "grant_type": "DIRECT_BASE",
    "effect": "ALLOW",
    "scope_expression": "NT-APP \u2014 entrada a la aplicaci\u00f3n. No concede por s\u00ed sola acceso a recursos ni ampl\u00eda las capacidades internas.",
    "condition_expression": "Carril base. No requiere turno ni check-in. Permite abrir ANIMA antes del turno; no administra trabajadores ni turnos y no concede check-in.",
    "source_task": "AUTH-MOD-021"
  },
  {
    "grant_id": "base-role-grant:trabajador_operativo:anima.workforce.employee_documents.upload",
    "role_code": "trabajador_operativo",
    "permission_key": "anima.workforce.employee_documents.upload",
    "authorization_mode": "BASE_ONLY",
    "lane": "BASE",
    "grant_type": "DIRECT_BASE",
    "effect": "ALLOW",
    "scope_expression": "OWN \u2014 \u00fanicamente recursos cuyo target_employee_id coincide con actor_employee_id.",
    "condition_expression": "Carril base. Solo tipos documentales de autoservicio para el propio actor, con validaci\u00f3n de formato, tama\u00f1o, hash y destino y trazabilidad de creaci\u00f3n; no aprueba, valida ni elimina documentos.",
    "source_task": "AUTH-MOD-021"
  },
  {
    "grant_id": "base-role-grant:trabajador_operativo:anima.workforce.employee_documents.view",
    "role_code": "trabajador_operativo",
    "permission_key": "anima.workforce.employee_documents.view",
    "authorization_mode": "BASE_ONLY",
    "lane": "BASE",
    "grant_type": "DIRECT_BASE",
    "effect": "ALLOW",
    "scope_expression": "OWN \u2014 \u00fanicamente recursos cuyo target_employee_id coincide con actor_employee_id.",
    "condition_expression": "Carril base. Solo documentos propios cuya retenci\u00f3n, sensibilidad y visibilidad permitan mostrarlos al empleado.",
    "source_task": "AUTH-MOD-021"
  },
  {
    "grant_id": "base-role-grant:trabajador_operativo:anima.workforce.employee_photos.upload",
    "role_code": "trabajador_operativo",
    "permission_key": "anima.workforce.employee_photos.upload",
    "authorization_mode": "BASE_ONLY",
    "lane": "BASE",
    "grant_type": "DIRECT_BASE",
    "effect": "ALLOW",
    "scope_expression": "OWN \u2014 \u00fanicamente la fotograf\u00eda laboral del propio actor.",
    "condition_expression": "Carril base. Solo fotograf\u00eda propia con formato y tama\u00f1o aprobados, flujo de revisi\u00f3n cuando corresponda y trazabilidad del reemplazo; no concede acceso a fotograf\u00edas de terceros.",
    "source_task": "AUTH-MOD-021"
  },
  {
    "grant_id": "base-role-grant:trabajador_operativo:shell.access",
    "role_code": "trabajador_operativo",
    "permission_key": "shell.access",
    "authorization_mode": "BASE_ONLY",
    "lane": "BASE",
    "grant_type": "DIRECT_BASE",
    "effect": "ALLOW",
    "scope_expression": "NT-APP \u2014 entrada a la aplicaci\u00f3n. No concede por s\u00ed sola acceso a recursos ni ampl\u00eda las capacidades internas.",
    "condition_expression": "Carril base. No requiere turno ni check-in. Permite ingresar al hub laboral; no concede acceso a otras aplicaciones ni capacidades internas.",
    "source_task": "AUTH-MOD-021"
  }
];

const baselineManifest = {
  dataset_id: 'vento.authorization.base-role-grants',
  dataset_version: '1.0.0',
  dataset_schema_version: '1.0.0',
  catalog_id: 'vento.authorization',
  catalog_version: '1.0.0',
  catalog_schema_version: '1.0.0',
  contract_release_hash: expectedContractReleaseHash,
  record_count: 499,
  role_count: 7,
  direct_base_count: 463,
  base_component_count: 36,
  effect: 'ALLOW_ONLY',
};

const successorManifest = {
  dataset_id: 'vento.authorization.base-role-grants',
  dataset_version: '1.1.0',
  dataset_schema_version: '1.0.0',
  catalog_id: 'vento.authorization',
  catalog_version: '1.0.0',
  catalog_schema_version: '1.0.0',
  contract_release_hash: expectedContractReleaseHash,
  record_count: 504,
  role_count: 8,
  direct_base_count: 468,
  base_component_count: 36,
  effect: 'ALLOW_ONLY',
};

function fail(message) {
  throw new Error(message);
}

function sha256(value) {
  return crypto.createHash('sha256').update(value).digest('hex');
}

function readJson(filePath, label) {
  if (!fs.existsSync(filePath)) fail(`Missing ${label}: ${path.relative(process.cwd(), filePath)}`);
  return JSON.parse(fs.readFileSync(filePath, 'utf8'));
}

function assertExactJson(actual, expected, label) {
  if (JSON.stringify(actual) !== JSON.stringify(expected)) {
    fail(`${label} does not match the canonical contract.`);
  }
}

function extractBaselinePayload() {
  if (!fs.existsSync(canonicalDatasetsPath)) {
    fail(`Missing canonical dataset source: ${path.relative(process.cwd(), canonicalDatasetsPath)}`);
  }
  const markdown = fs.readFileSync(canonicalDatasetsPath, 'utf8').replaceAll('\r\n', '\n');
  const lines = markdown.split('\n');
  const taskStart = lines.findIndex((line) => line.startsWith('### ') && line.includes('AUTH-RBAC-024'));
  if (taskStart < 0) fail('AUTH-RBAC-024 section not found in canonical dataset source.');
  const taskEndRelative = lines.slice(taskStart + 1)
    .findIndex((line) => line.startsWith('### ') && line.includes('AUTH-RBAC-025'));
  const taskEnd = taskEndRelative < 0 ? lines.length : taskStart + 1 + taskEndRelative;
  const taskLines = lines.slice(taskStart, taskEnd);
  const payloadHeading = taskLines.findIndex((line) => line.startsWith('#### 18.') && line.includes('Payload'));
  if (payloadHeading < 0) fail('AUTH-RBAC-024 payload heading not found.');
  const fenceStartRelative = taskLines.slice(payloadHeading + 1).findIndex((line) => line.trim() === '```jsonl');
  if (fenceStartRelative < 0) fail('AUTH-RBAC-024 jsonl fence not found.');
  const fenceStart = payloadHeading + 1 + fenceStartRelative + 1;
  const fenceEndRelative = taskLines.slice(fenceStart).findIndex((line) => line.trim() === '```');
  if (fenceEndRelative < 0) fail('AUTH-RBAC-024 jsonl fence is not closed.');
  const payloadLines = taskLines.slice(fenceStart, fenceStart + fenceEndRelative);
  if (payloadLines.length !== 500) {
    fail(`AUTH-RBAC-024 payload must contain 500 lines; received ${payloadLines.length}.`);
  }
  const payload = `${payloadLines.join('\n')}\n`;
  const digest = sha256(payload);
  if (digest !== expectedBaselineHash) {
    fail(`AUTH-RBAC-024 baseline hash mismatch: ${digest}.`);
  }
  const manifest = JSON.parse(payloadLines[0]);
  assertExactJson(manifest, baselineManifest, 'AUTH-RBAC-024 baseline manifest');
  const records = payloadLines.slice(1).map((line) => JSON.parse(line));
  return { payload, records, digest };
}

function readBaseRoles() {
  const roles = readJson(baseRolesPath, 'base-roles.json');
  if (!Array.isArray(roles)) fail('base-roles.json must contain an array.');
  assertExactJson(roles, expectedBaseRoles, 'base-roles.json');
  if (new Set(roles).size !== roles.length) fail('base-roles.json contains duplicate role codes.');
  return roles;
}

function buildSuccessorPayload(baselineRecords) {
  const workerKeys = workerRows.map((record) => record.permission_key);
  const sortedWorkerKeys = [...workerKeys].sort();
  if (JSON.stringify(workerKeys) !== JSON.stringify(sortedWorkerKeys)) {
    fail('SHELL-CON-004 worker rows are not ordered by permission_key ASC.');
  }
  const records = [...baselineRecords, ...workerRows];
  if (records.length !== 504) fail(`Successor dataset must contain 504 records; received ${records.length}.`);
  const lines = [JSON.stringify(successorManifest), ...records.map((record) => JSON.stringify(record))];
  const payload = `${lines.join('\n')}\n`;
  const digest = sha256(payload);
  if (digest !== expectedSuccessorHash) {
    fail(`SHELL-CON-004 successor hash mismatch: ${digest}.`);
  }
  return { payload, records, digest };
}

function renderTypes(roles) {
  const union = roles.map((role) => `  | ${JSON.stringify(role)}`).join('\n');
  return `// GENERATED FILE. DO NOT EDIT.\n// Source: authorization/catalog/base-roles/versions/1.1.0/base-roles.json\n\nexport type BaseRoleCode =\n${union};\n`;
}

function renderValues(roles) {
  const values = roles.map((role) => `  ${JSON.stringify(role)},`).join('\n');
  return `// GENERATED FILE. DO NOT EDIT.\n// Source: authorization/catalog/base-roles/versions/1.1.0/base-roles.json\n\nimport type { BaseRoleCode } from "./base-role.types.js";\n\nexport const BASE_ROLE_CODES = [\n${values}\n] as const satisfies readonly BaseRoleCode[];\n\nconst BASE_ROLE_CODE_SET = new Set<string>(BASE_ROLE_CODES);\n\nexport function isBaseRoleCode(value: unknown): value is BaseRoleCode {\n  return typeof value === "string" && BASE_ROLE_CODE_SET.has(value);\n}\n`;
}

function renderIndex() {
  return `// GENERATED FILE. DO NOT EDIT.\n// Source: authorization/catalog/base-roles/versions/1.1.0/base-roles.json\n\nexport type { BaseRoleCode } from "./base-role.types.js";\nexport { BASE_ROLE_CODES, isBaseRoleCode } from "./base-role.values.js";\n`;
}

function assertOrWrite(filePath, expected, checkOnly) {
  const current = fs.existsSync(filePath) ? fs.readFileSync(filePath, 'utf8') : null;
  if (checkOnly) {
    if (current !== expected) fail(`Generated artifact is stale: ${path.relative(process.cwd(), filePath)}`);
    return 'FRESH';
  }
  fs.mkdirSync(path.dirname(filePath), { recursive: true });
  if (current !== expected) fs.writeFileSync(filePath, expected, 'utf8');
  return current === expected ? 'FRESH' : 'UPDATED';
}

export function generateBaseRoleContracts({ checkOnly = false } = {}) {
  const roles = readBaseRoles();
  const baseline = extractBaselinePayload();
  const successor = buildSuccessorPayload(baseline.records);
  const results = {
    baseline_dataset: assertOrWrite(baselineDatasetPath, baseline.payload, checkOnly),
    successor_dataset: assertOrWrite(successorDatasetPath, successor.payload, checkOnly),
    types: assertOrWrite(generatedTypesPath, renderTypes(roles), checkOnly),
    values: assertOrWrite(generatedValuesPath, renderValues(roles), checkOnly),
    index: assertOrWrite(generatedIndexPath, renderIndex(), checkOnly),
  };
  return {
    base_roles: roles.length,
    baseline_records: baseline.records.length,
    successor_records: successor.records.length,
    baseline_hash: baseline.digest,
    successor_hash: successor.digest,
    results,
  };
}

const isCli = process.argv[1]
  && path.resolve(process.argv[1]) === path.resolve(currentFile);

if (isCli) {
  try {
    const unknown = process.argv.slice(2).filter((argument) => argument !== '--check');
    if (unknown.length > 0) fail(`Unknown arguments: ${unknown.join(', ')}`);
    const checkOnly = process.argv.includes('--check');
    const result = generateBaseRoleContracts({ checkOnly });
    console.log(`[VENTO CONTRACTS] BASE_ROLE_CONTRACTS ${checkOnly ? 'CHECK' : 'GENERATE'} PASS`);
    console.log(`[VENTO CONTRACTS] BASE_ROLES ${result.base_roles}`);
    console.log(`[VENTO CONTRACTS] BASE_ROLE_GRANTS_1_0_0 ${result.baseline_records}`);
    console.log(`[VENTO CONTRACTS] BASE_ROLE_GRANTS_1_0_0_SHA256 ${result.baseline_hash}`);
    console.log(`[VENTO CONTRACTS] BASE_ROLE_GRANTS_1_1_0 ${result.successor_records}`);
    console.log(`[VENTO CONTRACTS] BASE_ROLE_GRANTS_1_1_0_SHA256 ${result.successor_hash}`);
    console.log(`[VENTO CONTRACTS] DATASET_1_0_0 ${result.results.baseline_dataset}`);
    console.log(`[VENTO CONTRACTS] DATASET_1_1_0 ${result.results.successor_dataset}`);
    console.log(`[VENTO CONTRACTS] TYPES ${result.results.types}`);
    console.log(`[VENTO CONTRACTS] VALUES ${result.results.values}`);
    console.log(`[VENTO CONTRACTS] INDEX ${result.results.index}`);
  } catch (error) {
    console.error('[VENTO CONTRACTS] BASE_ROLE_CONTRACTS FAIL');
    console.error(error instanceof Error ? error.message : String(error));
    process.exitCode = 1;
  }
}