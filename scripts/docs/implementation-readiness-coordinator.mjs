import { fileURLToPath } from 'node:url';
import path from 'node:path';

import { scanPackageReadiness } from './package-readiness-scanner.mjs';

function queueCandidate(registry) {
  const current = registry?.package_execution?.current ?? null;
  if (current?.next_action.type !== 'AUTHORIZE_PHYSICAL_IMPLEMENTATION') return null;
  const first = registry?.implementation_ready_queue?.find(
    ({ package_id: packageId }) => packageId === current.package_id,
  ) ?? null;
  if (!first) return null;
  return {
    packageId: first.package_id,
    capabilityId: first.capability_id,
    ownerApplication: first.owner_application,
    gateId: first.gate_id,
    instanceId: first.next_execution,
    status: 'READY_FOR_AUTHORIZATION',
    source: 'PACKAGE_EXECUTION_LINEAR',
    authorizationRequired: true,
  };
}

function linearPackageAction(registry) {
  const execution = registry?.package_execution ?? null;
  const current = execution?.current ?? null;
  if (!current) return null;
  const action = current.next_action;
  return {
    type: action.type,
    target: action.target,
    title: `${current.package_id} ocupa el turno ${current.position}/${execution.sequence.length}`,
    instruction: `${action.reason} Ejecutar: ${action.command}`,
    why: 'La secuencia es determinista; un package bloqueado conserva el turno y no puede ser adelantado.',
    command: action.command,
    packageId: current.package_id,
    source: 'PACKAGE_EXECUTION_LINEAR',
  };
}

export function coordinateImplementationStatus({ baseControl, registry }) {
  if (!baseControl || typeof baseControl !== 'object') {
    throw new Error('baseControl es obligatorio.');
  }
  const candidate = queueCandidate(registry);
  const current = registry?.package_execution?.current ?? null;
  const linearAction = linearPackageAction(registry);
  const baseActive = baseControl.physical?.active ?? null;

  if (baseActive) {
    return {
      ...baseControl,
      readinessCandidate: candidate,
      readinessCurrent: current,
      coordinatedPrimaryAction: baseControl.primaryAction,
      coordinationSource: 'IMPLEMENTATION_CONTROL_ACTIVE_INSTANCE',
    };
  }

  if (!linearAction) {
    return {
      ...baseControl,
      readinessCandidate: null,
      readinessCurrent: null,
      coordinatedPrimaryAction: baseControl.primaryAction,
      coordinationSource: 'PACKAGE_EXECUTION_COMPLETE',
    };
  }

  return {
    ...baseControl,
    readinessCandidate: candidate,
    readinessCurrent: current,
    coordinatedPrimaryAction: linearAction,
    coordinationSource: 'PACKAGE_EXECUTION_LINEAR',
  };
}

export async function deriveCoordinatedImplementationStatus({ root = process.cwd() } = {}) {
  const [{ deriveImplementationControl }, readiness] = await Promise.all([
    import('./implementation-control.mjs'),
    Promise.resolve(scanPackageReadiness({ root, check: true, trigger: 'implementation-status' })),
  ]);
  const baseControl = deriveImplementationControl({ root });
  return coordinateImplementationStatus({ baseControl, registry: readiness.registry });
}

function printStatus(status) {
  const action = status.coordinatedPrimaryAction;
  console.log(`COORDINATION_SOURCE: ${status.coordinationSource}`);
  console.log(`ACTION: ${action.type}`);
  console.log(`TARGET: ${action.target}`);
  if (action.command) console.log(`COMMAND: ${action.command}`);
  if (status.readinessCurrent) {
    console.log(`CURRENT_PACKAGE: ${status.readinessCurrent.package_id}`);
    console.log(`CURRENT_POSITION: ${status.readinessCurrent.position}`);
  }
  if (status.readinessCandidate) {
    console.log(`PACKAGE_ID: ${status.readinessCandidate.packageId}`);
    console.log(`PACKAGE_GATE: ${status.readinessCandidate.gateId}`);
    console.log(`PACKAGE_STATUS: ${status.readinessCandidate.status}`);
    console.log('PHYSICAL_AUTHORIZATION_REQUIRED: SI');
  }
}

async function main() {
  const unknown = process.argv.slice(2);
  if (unknown.length > 0) throw new Error(`argumentos desconocidos: ${unknown.join(', ')}.`);
  const status = await deriveCoordinatedImplementationStatus();
  printStatus(status);
}

const isCli = process.argv[1]
  && path.resolve(process.argv[1]) === path.resolve(fileURLToPath(import.meta.url));

if (isCli) {
  main().catch((error) => {
    console.error(`ERROR: ${error instanceof Error ? error.message : String(error)}`);
    process.exitCode = 1;
  });
}
