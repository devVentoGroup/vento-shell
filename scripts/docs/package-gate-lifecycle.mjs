import fs from 'node:fs';
import path from 'node:path';
import { fileURLToPath } from 'node:url';

import { scanPackageReadiness } from './package-readiness-scanner.mjs';
import {
  assertPackageGateRecordsValid,
  assessPackageGateRecord,
  packageGateRecordRelativePath,
  readPackageGatePolicy,
} from './package-gate-control.mjs';

function fail(message) { throw new Error(message); }
function abs(root, relativePath) { return path.join(root, ...relativePath.split('/')); }
function stableJson(value) { return `${JSON.stringify(value, null, 2)}\n`; }

function parseArgs(argv) {
  const command = argv[0];
  const values = {};
  for (let i = 1; i < argv.length; i += 1) {
    const token = argv[i];
    if (!token.startsWith('--')) fail(`Argumento desconocido: ${token}.`);
    const key = token.slice(2).replaceAll('-', '_');
    const value = argv[i + 1];
    if (!value || value.startsWith('--')) fail(`Falta valor de ${token}.`);
    values[key] = value;
    i += 1;
  }
  if (!['prepare', 'status', 'check', 'approve'].includes(command)) fail('Use prepare, status, check o approve.');
  return { command, ...values };
}

function packageFromScan(root, packageId) {
  const result = scanPackageReadiness({ root, check: false, trigger: 'package-gate-lifecycle', supplied: { skipDerivedReports: true } });
  const pkg = result.registry.packages.find(({ package_id: id }) => id === packageId);
  if (!pkg || pkg.source_kind !== 'CANONICAL_GAP_PACKAGE') fail(`Package canónico no encontrado: ${packageId}.`);
  return pkg;
}

function newRecord(pkg, now) {
  return {
    schema_version: 1,
    package_id: pkg.package_id,
    status: pkg.task_prerequisites.remaining > 0 ? 'WAITING_DOCUMENTATION' : 'MATURATION_DRAFT',
    created_at: now,
    updated_at: now,
    canonical_snapshot: {
      repository_owner: pkg.repository_owner,
      runtime_profile: pkg.runtime_profile,
      dominant_task_id: pkg.dominant_task_id,
      task_ids: pkg.task_prerequisites.tasks.map(({ task_id: taskId }) => taskId),
      missing_task_ids: pkg.task_prerequisites.missing_task_ids,
    },
    physical_identity: { targets: [] },
    implementation_units: [],
    evidence_plan: { tests: [], observability: [], acceptance_criteria: [], rollback_steps: [] },
    authorization: {
      decision: 'PENDING', approved_by: null, approved_at: null, approval_ref: null, approval_statement: null,
    },
  };
}

export function preparePackageGate({ root = process.cwd(), packageId, now = new Date().toISOString() }) {
  const policy = readPackageGatePolicy(root);
  const pkg = packageFromScan(root, packageId);
  const relativePath = packageGateRecordRelativePath(packageId, policy);
  const filePath = abs(root, relativePath);
  let record = fs.existsSync(filePath) ? JSON.parse(fs.readFileSync(filePath, 'utf8')) : newRecord(pkg, now);
  const assessment = assessPackageGateRecord(record, { taskPrerequisites: pkg.task_prerequisites, policy, relativePath });
  record = {
    ...record,
    status: assessment.status,
    updated_at: now,
    canonical_snapshot: {
      repository_owner: pkg.repository_owner,
      runtime_profile: pkg.runtime_profile,
      dominant_task_id: pkg.dominant_task_id,
      task_ids: pkg.task_prerequisites.tasks.map(({ task_id: taskId }) => taskId),
      missing_task_ids: pkg.task_prerequisites.missing_task_ids,
    },
  };
  fs.mkdirSync(path.dirname(filePath), { recursive: true });
  fs.writeFileSync(filePath, stableJson(record), 'utf8');
  return { relativePath, record, assessment: assessPackageGateRecord(record, { taskPrerequisites: pkg.task_prerequisites, policy, relativePath }) };
}

export function inspectPackageGate({ root = process.cwd(), packageId }) {
  const policy = readPackageGatePolicy(root);
  const pkg = packageFromScan(root, packageId);
  const relativePath = packageGateRecordRelativePath(packageId, policy);
  const filePath = abs(root, relativePath);
  if (!fs.existsSync(filePath)) fail(`${relativePath} no existe; ejecute docs:package:prepare.`);
  const record = JSON.parse(fs.readFileSync(filePath, 'utf8'));
  return { relativePath, record, assessment: assessPackageGateRecord(record, { taskPrerequisites: pkg.task_prerequisites, policy, relativePath }) };
}

export function approvePackageGate({ root = process.cwd(), packageId, approvedBy, approvalRef, statement, now = new Date().toISOString() }) {
  if (!approvedBy || !approvalRef || !statement?.includes('APROBADO')) fail('approve exige --approved-by, --approval-ref y --statement con APROBADO explícito.');
  const current = inspectPackageGate({ root, packageId });
  const policy = readPackageGatePolicy(root);
  if (!current.assessment.tasks_complete) fail('Existen tareas prerrequisito pendientes; aprobación bloqueada.');
  const preApproval = assessPackageGateRecord({ ...current.record, authorization: { decision: 'PENDING' } }, { policy });
  if (!preApproval.dossier_complete) fail('El expediente no está completo; aprobación bloqueada.');
  const record = {
    ...current.record,
    status: 'APPROVED_FOR_IMPLEMENTATION',
    updated_at: now,
    authorization: {
      decision: 'APROBADO', approved_by: approvedBy, approved_at: now, approval_ref: approvalRef, approval_statement: statement,
    },
  };
  fs.writeFileSync(abs(root, current.relativePath), stableJson(record), 'utf8');
  return { ...current, record, assessment: assessPackageGateRecord(record, { policy, relativePath: current.relativePath }) };
}

function print(result) {
  console.log(`PACKAGE: ${result.record.package_id}`);
  console.log(`FILE: ${result.relativePath}`);
  console.log(`STATUS: ${result.assessment.status}`);
  console.log(`TASKS_COMPLETE: ${result.assessment.tasks_complete ? 'YES' : 'NO'}`);
  console.log(`DOSSIER_COMPLETE: ${result.assessment.dossier_complete ? 'YES' : 'NO'}`);
  console.log(`APPROVAL_COMPLETE: ${result.assessment.approval_complete ? 'YES' : 'NO'}`);
  console.log(`VALID: ${result.assessment.valid ? 'YES' : 'NO'}`);
}

function main() {
  const args = parseArgs(process.argv.slice(2));
  if (args.command === 'check' && !args.package_id) {
    const scan = scanPackageReadiness({
      check: false,
      trigger: 'package-gate-check',
      supplied: { skipDerivedReports: true },
    });
    const result = assertPackageGateRecordsValid(scan.packageGateRecords);
    console.log(`PACKAGE_GATE_CHECK: PASS (${result.records.size} expediente(s)).`);
    return;
  }
  if (!args.package_id) fail('--package-id es obligatorio.');
  if (args.command === 'prepare') print(preparePackageGate({ packageId: args.package_id }));
  else if (args.command === 'status' || args.command === 'check') {
    const result = inspectPackageGate({ packageId: args.package_id });
    print(result);
    if (!result.assessment.valid) fail(result.assessment.errors.join('; '));
  } else print(approvePackageGate({ packageId: args.package_id, approvedBy: args.approved_by, approvalRef: args.approval_ref, statement: args.statement }));
}

const isCli = process.argv[1] && path.resolve(process.argv[1]) === path.resolve(fileURLToPath(import.meta.url));
if (isCli) {
  try { main(); } catch (error) { console.error(`ERROR: ${error instanceof Error ? error.message : String(error)}`); process.exitCode = 1; }
}
