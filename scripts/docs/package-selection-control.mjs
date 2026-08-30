import fs from 'node:fs';
import path from 'node:path';
import { fileURLToPath } from 'node:url';

export const PACKAGE_SELECTION_POLICY_PATH = 'docs/plan-canonico/modular/package-selection-policy.json';

function fail(message) {
  throw new Error(message);
}

function policyPath(root) {
  return path.join(root, ...PACKAGE_SELECTION_POLICY_PATH.split('/'));
}

export function readPackageSelectionPolicy(root = process.cwd()) {
  const target = policyPath(root);
  if (!fs.existsSync(target)) fail(`No existe ${PACKAGE_SELECTION_POLICY_PATH}.`);
  try {
    return JSON.parse(fs.readFileSync(target, 'utf8'));
  } catch (error) {
    fail(`${PACKAGE_SELECTION_POLICY_PATH} no contiene JSON válido: ${error instanceof Error ? error.message : String(error)}`);
  }
}

export function assessPackageSelection(policy, registry) {
  const errors = [];
  if (policy?.schema_version !== 1) errors.push('schema_version debe ser 1.');
  if (policy?.policy_id !== 'PACKAGE-SELECTION-001') errors.push('policy_id debe ser PACKAGE-SELECTION-001.');
  if (policy?.automatic_selection !== false) errors.push('automatic_selection debe ser false.');
  if (policy?.selection_owner !== 'OWN-OPS') errors.push('selection_owner debe ser OWN-OPS.');
  if (!Array.isArray(policy?.required_validators) || !policy.required_validators.includes('OWN-TEC')) {
    errors.push('required_validators debe incluir OWN-TEC.');
  }
  if (policy?.security_veto_owner !== 'OWN-SEG') errors.push('security_veto_owner debe ser OWN-SEG.');

  const queue = registry?.implementation_ready_queue ?? [];
  const eligibleIds = queue.map(({ package_id: packageId }) => packageId);
  const activePackage = (registry?.packages ?? []).find(({ status }) => status === 'IMPLEMENTING') ?? null;
  const selectedPackageId = policy?.selected_package_id ?? null;
  const decision = policy?.decision ?? null;
  let state = eligibleIds.length === 0 || activePackage ? 'NOT_DUE' : 'AWAITING_DECISION';

  if (selectedPackageId) {
    state = 'SELECTED';
    if (!eligibleIds.includes(selectedPackageId)) {
      errors.push(`${selectedPackageId} no pertenece a IMPLEMENTATION_READY_QUEUE.`);
    }
    if (decision?.approval !== 'APROBADO') errors.push('la selección exige decision.approval = APROBADO.');
    if (decision?.decided_by_owner !== policy.selection_owner) {
      errors.push(`decision.decided_by_owner debe ser ${policy.selection_owner}.`);
    }
    const validators = decision?.validated_by_owners ?? [];
    for (const required of policy.required_validators) {
      if (!validators.includes(required)) errors.push(`decision.validated_by_owners debe incluir ${required}.`);
    }
    if (!String(decision?.evidence ?? '').trim()) errors.push('la selección exige decision.evidence trazable.');
    if (activePackage) errors.push(`no se puede seleccionar ${selectedPackageId} mientras ${activePackage.package_id} está IMPLEMENTING.`);
  } else if (decision !== null) {
    errors.push('decision debe ser null cuando selected_package_id es null.');
  }

  if (errors.length > 0) {
    fail(`Política de selección de package inválida:\n- ${errors.join('\n- ')}`);
  }

  return Object.freeze({
    state,
    owner: policy.selection_owner,
    required_validators: [...policy.required_validators],
    security_veto_owner: policy.security_veto_owner,
    automatic_selection: false,
    selected_package_id: selectedPackageId,
    eligible_package_ids: eligibleIds,
    decision,
  });
}

function parseArgs(argv) {
  const [command = 'status', ...tokens] = argv;
  const args = { command, packageId: null, approval: null, evidence: null, owner: null, validatedBy: [] };
  for (let index = 0; index < tokens.length; index += 1) {
    const token = tokens[index];
    const value = tokens[index + 1];
    if (token === '--package-id') args.packageId = value;
    else if (token === '--approval') args.approval = value;
    else if (token === '--evidence') args.evidence = value;
    else if (token === '--owner') args.owner = value;
    else if (token === '--validated-by') args.validatedBy = value.split(',').map((item) => item.trim()).filter(Boolean);
    else fail(`Argumento desconocido: ${token}.`);
    if (!value) fail(`Falta valor para ${token}.`);
    index += 1;
  }
  return args;
}

async function readiness(root) {
  const { scanPackageReadiness } = await import('./package-readiness-scanner.mjs');
  return scanPackageReadiness({ root, check: true, trigger: 'package-selection', supplied: { skipPackageSelection: true } });
}

function printAssessment(assessment) {
  console.log(`PACKAGE_SELECTION: ${assessment.state}`);
  console.log(`SELECTION_OWNER: ${assessment.owner}`);
  console.log(`PACKAGE_SELECTED: ${assessment.selected_package_id ?? 'NONE'}`);
  console.log(`ELIGIBLE_PACKAGES: ${assessment.eligible_package_ids.length > 0 ? assessment.eligible_package_ids.join(', ') : 'NONE'}`);
  console.log('AUTOMATIC_SELECTION: FALSE');
}

async function main() {
  const root = process.cwd();
  const args = parseArgs(process.argv.slice(2));
  const result = await readiness(root);
  const policy = readPackageSelectionPolicy(root);

  if (args.command === 'status' || args.command === 'check') {
    printAssessment(assessPackageSelection(policy, result.registry));
    return;
  }
  if (args.command !== 'select') fail(`Comando desconocido: ${args.command}.`);
  if (args.approval !== 'APROBADO') fail('select requiere --approval APROBADO.');
  if (args.owner !== policy.selection_owner) fail(`select requiere --owner ${policy.selection_owner}.`);
  if (!args.packageId || !args.evidence) fail('select requiere --package-id y --evidence.');
  for (const required of policy.required_validators) {
    if (!args.validatedBy.includes(required)) fail(`select requiere --validated-by con ${required}.`);
  }
  const eligibleIds = result.registry.implementation_ready_queue.map(({ package_id: packageId }) => packageId);
  if (!eligibleIds.includes(args.packageId)) fail(`${args.packageId} no pertenece a IMPLEMENTATION_READY_QUEUE.`);

  const next = {
    ...policy,
    selected_package_id: args.packageId,
    decision: {
      approval: 'APROBADO',
      decided_by_owner: args.owner,
      validated_by_owners: args.validatedBy,
      evidence: args.evidence,
      decided_at: new Date().toISOString(),
    },
  };
  fs.writeFileSync(policyPath(root), `${JSON.stringify(next, null, 2)}\n`, 'utf8');
  printAssessment(assessPackageSelection(next, result.registry));
}

const isCli = process.argv[1] && path.resolve(process.argv[1]) === path.resolve(fileURLToPath(import.meta.url));
if (isCli) {
  main().catch((error) => {
    console.error(`ERROR: ${error instanceof Error ? error.message : String(error)}`);
    process.exitCode = 1;
  });
}
