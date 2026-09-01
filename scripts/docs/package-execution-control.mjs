import fs from 'node:fs';
import path from 'node:path';
import { fileURLToPath } from 'node:url';

export const PACKAGE_EXECUTION_POLICY_PATH = 'docs/plan-canonico/modular/package-execution-policy.json';

function fail(message) {
  throw new Error(message);
}

function absolute(root, relativePath) {
  return path.join(root, ...String(relativePath).split('/'));
}

function canonicalPackageId(value) {
  return /^GAP-PKG-\d{3}$/u.test(String(value ?? ''));
}

export function assertPackageMutationAllowed({
  execution,
  packageId,
  operation = 'PACKAGE_MUTATION',
  openOrderCorrections = [],
} = {}) {
  const normalizedPackageId = String(packageId ?? '').trim().toUpperCase();
  if (!canonicalPackageId(normalizedPackageId)) {
    fail(`PACKAGE_ID_INVALID: ${packageId ?? 'EMPTY'}.`);
  }

  const corrections = [...new Set(
    (openOrderCorrections ?? [])
      .map((entry) => typeof entry === 'string' ? entry : entry?.correction_id)
      .map((entry) => String(entry ?? '').trim())
      .filter(Boolean),
  )].sort((left, right) => left.localeCompare(right, 'en'));

  if (corrections.length > 0) {
    fail(
      `PACKAGE_EXECUTION_ORDER_CORRECTION_OPEN: ${operation} bloqueado mientras `
      + `${corrections.join(', ')} no quede VERIFIED en main.`,
    );
  }

  if (!execution?.current) {
    fail(`PACKAGE_EXECUTION_COMPLETE: ${operation} no tiene un package actual ejecutable.`);
  }

  if (execution.current.package_id !== normalizedPackageId) {
    fail(
      `PACKAGE_OUT_OF_TURN: ${operation} solo admite ${execution.current.package_id}; `
      + `solicitado ${normalizedPackageId}.`,
    );
  }

  return execution.current;
}

export function assertNoFuturePackageArtifacts({
  execution,
  packageGateIds = [],
  implementationInstanceIds = [],
} = {}) {
  if (!execution) fail('PACKAGE_EXECUTION_NOT_EVALUATED.');
  if (!execution.current) return true;

  const positions = new Map(
    execution.sequence.map(({ package_id: packageId, position }) => [packageId, position]),
  );
  const currentPosition = execution.current.position;
  const violations = [];

  for (const packageId of packageGateIds) {
    const normalized = String(packageId ?? '').trim().toUpperCase();
    if (!canonicalPackageId(normalized)) continue;
    const position = positions.get(normalized);
    if (!Number.isInteger(position)) {
      violations.push(`PACKAGE_GATE_OUTSIDE_LINEAR_SEQUENCE:${normalized}`);
    } else if (position > currentPosition) {
      violations.push(`FUTURE_PACKAGE_GATE:${normalized}:${position}`);
    }
  }

  for (const instanceId of implementationInstanceIds) {
    const match = /^SHELL-CI-02[0-4]::(GAP-PKG-\d{3})$/u.exec(String(instanceId ?? ''));
    if (!match) continue;
    const packageId = match[1];
    const position = positions.get(packageId);
    if (!Number.isInteger(position)) {
      violations.push(`PHYSICAL_INSTANCE_OUTSIDE_LINEAR_SEQUENCE:${instanceId}`);
    } else if (position > currentPosition) {
      violations.push(`FUTURE_PHYSICAL_INSTANCE:${instanceId}:${position}`);
    }
  }

  if (violations.length > 0) {
    fail(
      `PACKAGE_LINEAR_ARTIFACT_VIOLATION: actual=${execution.current.package_id}; `
      + violations.join(', '),
    );
  }

  return true;
}

export function readPackageExecutionPolicy(root = process.cwd()) {
  const target = absolute(root, PACKAGE_EXECUTION_POLICY_PATH);
  if (!fs.existsSync(target)) fail(`No existe ${PACKAGE_EXECUTION_POLICY_PATH}.`);
  let policy;
  try {
    policy = JSON.parse(fs.readFileSync(target, 'utf8'));
  } catch (error) {
    fail(`${PACKAGE_EXECUTION_POLICY_PATH} no contiene JSON válido: ${error instanceof Error ? error.message : String(error)}`);
  }
  const errors = [];
  if (policy?.schema_version !== 1) errors.push('schema_version debe ser 1.');
  if (policy?.policy_id !== 'PACKAGE-EXECUTION-001') errors.push('policy_id debe ser PACKAGE-EXECUTION-001.');
  if (policy?.mode !== 'DETERMINISTIC_LINEAR_TOPOLOGICAL') errors.push('mode debe ser DETERMINISTIC_LINEAR_TOPOLOGICAL.');
  if (policy?.automatic_next !== true) errors.push('automatic_next debe ser true.');
  if (policy?.human_package_selection !== false) errors.push('human_package_selection debe ser false.');
  if (policy?.source_task !== 'DELIV-PKG-015') errors.push('source_task debe ser DELIV-PKG-015.');
  if (JSON.stringify(policy?.layer_order) !== JSON.stringify([0, 1, 2, 3, 4])) errors.push('layer_order debe ser [0,1,2,3,4].');
  if (JSON.stringify(policy?.tie_breakers) !== JSON.stringify(['EXPLICIT_PACKAGE_DEPENDENCIES', 'IMPLEMENTATION_LAYER', 'PACKAGE_ID'])) {
    errors.push('tie_breakers debe conservar dependencias, capa y package_id.');
  }
  if (!Array.isArray(policy?.terminal_statuses) || !policy.terminal_statuses.includes('CLOSED')) errors.push('terminal_statuses debe incluir CLOSED.');
  if (policy?.stop_on_blocked_current !== true) errors.push('stop_on_blocked_current debe ser true.');
  if (policy?.physical_authorization_required !== true) errors.push('physical_authorization_required debe ser true.');
  if (policy?.defer_without_canonical_order !== true) errors.push('defer_without_canonical_order debe ser true.');
  if (errors.length > 0) fail(`Política de ejecución lineal inválida:\n- ${errors.join('\n- ')}`);
  return Object.freeze(policy);
}

function comparePackage(left, right, layerRank) {
  const leftLayer = layerRank.get(left.execution.layer) ?? Number.MAX_SAFE_INTEGER;
  const rightLayer = layerRank.get(right.execution.layer) ?? Number.MAX_SAFE_INTEGER;
  return leftLayer - rightLayer || left.package_id.localeCompare(right.package_id, 'en');
}

function nextAction(pkg) {
  if (pkg.status === 'IMPLEMENTATION_READY') {
    if (!pkg.physical_entry_instance) {
      return {
        type: 'MATERIALIZE_PHYSICAL_HANDOFF',
        target: pkg.next_execution,
        command: `npm run docs:package:handoff -- --package-id ${pkg.package_id}`,
        reason: `${pkg.package_id} completó dossier, gate y dependencias; falta materializar su registro físico PENDING_AUTHORIZATION.`,
      };
    }
    return {
      type: 'AUTHORIZE_PHYSICAL_IMPLEMENTATION',
      target: pkg.physical_entry_instance.instance_id,
      command: 'npm run docs:implementation:status',
      reason: `${pkg.package_id} ya tiene handoff físico PENDING_AUTHORIZATION; falta autorización física humana.`,
    };
  }
  if (['IMPLEMENTING', 'DEPLOYED'].includes(pkg.status)) {
    return {
      type: 'CONTINUE_PHYSICAL_LIFECYCLE',
      target: pkg.next_execution ?? pkg.package_id,
      command: 'npm run docs:implementation:status',
      reason: `${pkg.package_id} ya inició su lifecycle físico y debe cerrarse antes de avanzar.`,
    };
  }
  if (pkg.source_kind === 'CANONICAL_GAP_PACKAGE' && !pkg.package_gate) {
    return {
      type: 'PREPARE_PACKAGE_GATE',
      target: pkg.package_id,
      command: `npm run docs:package:start -- --package-id ${pkg.package_id}`,
      reason: `${pkg.package_id} ocupa el turno lineal y todavía no tiene expediente package-gate.`,
    };
  }
  if (pkg.source_kind === 'CANONICAL_GAP_PACKAGE') {
    const missingTask = pkg.task_prerequisites?.missing_task_ids?.[0] ?? null;
    if (missingTask) {
      return {
        type: 'WAIT_FOR_DOCUMENTARY_PREREQUISITE',
        target: missingTask,
        command: `npm run docs:package:gate:status -- --package-id ${pkg.package_id}`,
        reason: `${pkg.package_id} conserva el turno; debe cerrarse primero ${missingTask}.`,
      };
    }
    if (pkg.package_gate.status !== 'APPROVED_FOR_IMPLEMENTATION') {
      return {
        type: 'MATURE_PACKAGE_GATE',
        target: pkg.package_id,
        command: `npm run docs:package:gate:status -- --package-id ${pkg.package_id}`,
        reason: `${pkg.package_id} conserva el turno hasta completar su identidad, unidades, evidencia y aprobación de gate.`,
      };
    }
    const physicalDependency = pkg.physical_dependencies?.evidence?.find(({ status }) => status !== 'PASS') ?? null;
    if (physicalDependency) {
      return {
        type: 'WAIT_FOR_PHYSICAL_PREREQUISITE',
        target: physicalDependency.source,
        command: 'npm run docs:implementation:status',
        reason: `${pkg.package_id} conserva el turno hasta que ${physicalDependency.source} quede VERIFIED.`,
      };
    }
    const gateBlocker = pkg.gate?.checks?.find(({ status }) => status !== 'PASS') ?? null;
    return {
      type: 'RESOLVE_PACKAGE_BLOCKER',
      target: gateBlocker?.id ?? pkg.blockers?.[0] ?? pkg.package_id,
      command: `npm run docs:package:readiness -- --package ${pkg.package_id}`,
      reason: `${pkg.package_id} conserva el turno hasta resolver su primer bloqueo efectivo.`,
    };
  }
  return {
    type: 'WAIT_FOR_SPECIAL_PACKAGE_READINESS',
    target: pkg.package_id,
    command: `npm run docs:package:readiness:check -- --package ${pkg.package_id}`,
    reason: `${pkg.package_id} conserva el turno hasta cerrar sus condiciones documentales explícitas.`,
  };
}

export function deriveLinearPackageExecution(registry, policy) {
  const packages = registry?.packages ?? [];
  const byId = new Map(packages.map((pkg) => [pkg.package_id, pkg]));
  const layerRank = new Map(policy.layer_order.map((layer, index) => [layer, index]));
  const deferred = [];
  const executable = [];

  for (const pkg of packages) {
    const execution = pkg.execution ?? null;
    if (!execution || execution.deferred === true || !layerRank.has(execution.layer)) {
      deferred.push({
        package_id: pkg.package_id,
        status: pkg.status,
        reason: execution?.deferred_reason ?? 'NO_CANONICAL_EXECUTION_ORDER',
      });
      continue;
    }
    executable.push(pkg);
  }

  const executableIds = new Set(executable.map(({ package_id: packageId }) => packageId));
  const incoming = new Map(executable.map(({ package_id: packageId }) => [packageId, new Set()]));
  const outgoing = new Map(executable.map(({ package_id: packageId }) => [packageId, new Set()]));

  for (const pkg of executable) {
    for (const dependencyId of pkg.execution.depends_on_package_ids ?? []) {
      if (!canonicalPackageId(dependencyId) || !byId.has(dependencyId)) fail(`${pkg.package_id}: dependencia desconocida ${dependencyId}.`);
      if (dependencyId === pkg.package_id) fail(`${pkg.package_id}: dependencia circular consigo mismo.`);
      if (!executableIds.has(dependencyId)) fail(`${pkg.package_id}: depende de ${dependencyId}, que está fuera de la línea ejecutable.`);
      const dependency = byId.get(dependencyId);
      if (layerRank.get(dependency.execution.layer) > layerRank.get(pkg.execution.layer)) {
        fail(`${pkg.package_id}: dependencia ${dependencyId} contradice el orden de capas.`);
      }
      incoming.get(pkg.package_id).add(dependencyId);
      outgoing.get(dependencyId).add(pkg.package_id);
    }
  }

  const ready = executable.filter((pkg) => incoming.get(pkg.package_id).size === 0)
    .sort((left, right) => comparePackage(left, right, layerRank));
  const ordered = [];
  while (ready.length > 0) {
    const current = ready.shift();
    ordered.push(current);
    for (const dependentId of outgoing.get(current.package_id)) {
      const dependencies = incoming.get(dependentId);
      dependencies.delete(current.package_id);
      if (dependencies.size === 0) {
        ready.push(byId.get(dependentId));
        ready.sort((left, right) => comparePackage(left, right, layerRank));
      }
    }
  }
  if (ordered.length !== executable.length) {
    const cyclic = executable.filter((pkg) => !ordered.some(({ package_id: packageId }) => packageId === pkg.package_id));
    fail(`Ciclo entre packages: ${cyclic.map(({ package_id: packageId }) => packageId).join(', ')}.`);
  }

  const terminal = new Set(policy.terminal_statuses);
  const currentPackage = ordered.find((pkg) => !terminal.has(pkg.status)) ?? null;
  const entries = ordered.map((pkg, index) => ({
    position: index + 1,
    package_id: pkg.package_id,
    layer: pkg.execution.layer,
    depends_on_package_ids: [...(pkg.execution.depends_on_package_ids ?? [])],
    status: pkg.status,
    current: pkg.package_id === currentPackage?.package_id,
  }));
  const current = currentPackage
    ? {
      ...entries.find(({ package_id: packageId }) => packageId === currentPackage.package_id),
      next_action: nextAction(currentPackage),
      blockers: [...(currentPackage.blockers ?? [])],
    }
    : null;

  return Object.freeze({
    policy_id: policy.policy_id,
    mode: policy.mode,
    automatic_next: true,
    human_package_selection: false,
    state: current
      ? current.next_action.type === 'MATERIALIZE_PHYSICAL_HANDOFF'
        ? 'READY_FOR_HANDOFF'
        : currentPackage.status === 'IMPLEMENTATION_READY'
          ? 'READY_FOR_AUTHORIZATION'
          : 'BLOCKED_ON_CURRENT'
      : 'COMPLETE',
    current,
    sequence: entries,
    deferred: deferred.sort((left, right) => left.package_id.localeCompare(right.package_id, 'en')),
  });
}

function printExecution(execution) {
  console.log(`PACKAGE_EXECUTION: ${execution.state}`);
  console.log(`MODE: ${execution.mode}`);
  console.log('HUMAN_PACKAGE_SELECTION: FALSE');
  console.log(`CURRENT_PACKAGE: ${execution.current?.package_id ?? 'NONE'}`);
  console.log(`CURRENT_POSITION: ${execution.current?.position ?? 'NONE'}/${execution.sequence.length}`);
  console.log(`ACTION: ${execution.current?.next_action.type ?? 'NONE'}`);
  console.log(`TARGET: ${execution.current?.next_action.target ?? 'NONE'}`);
  console.log(`COMMAND: ${execution.current?.next_action.command ?? 'NONE'}`);
  console.log(`DEFERRED_PACKAGES: ${execution.deferred.length}`);
}

async function main() {
  const [command = 'status', ...unknown] = process.argv.slice(2);
  if (!['status', 'check'].includes(command)) fail(`Comando desconocido: ${command}.`);
  if (unknown.length > 0) fail(`Argumentos desconocidos: ${unknown.join(', ')}.`);
  const { scanPackageReadiness } = await import('./package-readiness-scanner.mjs');
  const result = scanPackageReadiness({ check: true, trigger: 'package-execution-status' });
  printExecution(result.registry.package_execution);
}

const isCli = process.argv[1] && path.resolve(process.argv[1]) === path.resolve(fileURLToPath(import.meta.url));
if (isCli) {
  main().catch((error) => {
    console.error(`ERROR: ${error instanceof Error ? error.message : String(error)}`);
    process.exitCode = 1;
  });
}
