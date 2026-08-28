import { fileURLToPath } from 'node:url';
import path from 'node:path';

import { scanPackageReadiness } from './package-readiness-scanner.mjs';

function queueCandidate(registry) {
  const first = registry?.implementation_ready_queue?.[0] ?? null;
  if (!first) return null;
  return {
    packageId: first.package_id,
    capabilityId: first.capability_id,
    ownerApplication: first.owner_application,
    gateId: first.gate_id,
    instanceId: first.next_execution,
    status: 'READY_FOR_AUTHORIZATION',
    source: 'IMPLEMENTATION_READY_QUEUE',
    authorizationRequired: true,
  };
}

export function coordinateImplementationStatus({ baseControl, registry }) {
  if (!baseControl || typeof baseControl !== 'object') {
    throw new Error('baseControl es obligatorio.');
  }
  const candidate = queueCandidate(registry);
  const baseActive = baseControl.physical?.active ?? null;

  if (baseActive) {
    return {
      ...baseControl,
      readinessCandidate: candidate,
      coordinatedPrimaryAction: baseControl.primaryAction,
      coordinationSource: 'IMPLEMENTATION_CONTROL_ACTIVE_INSTANCE',
    };
  }

  if (!candidate) {
    return {
      ...baseControl,
      readinessCandidate: null,
      coordinatedPrimaryAction: baseControl.primaryAction,
      coordinationSource: 'IMPLEMENTATION_CONTROL_NO_READY_PACKAGE',
    };
  }

  return {
    ...baseControl,
    readinessCandidate: candidate,
    coordinatedPrimaryAction: {
      type: 'AUTORIZAR_IMPLEMENTACION',
      target: candidate.instanceId,
      title: `Package ${candidate.packageId} listo para autorización física`,
      instruction: `Definir y aprobar el alcance físico exacto de ${candidate.instanceId}; no crear AUTHORIZED ni ejecutar cambios antes de aprobación humana explícita.`,
      why: `${candidate.packageId} está en IMPLEMENTATION_READY_QUEUE con ${candidate.gateId} PASS y cero bloqueadores.`,
      source: candidate.source,
    },
    coordinationSource: 'IMPLEMENTATION_READY_QUEUE',
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
