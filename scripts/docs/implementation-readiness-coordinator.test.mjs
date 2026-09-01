import assert from 'node:assert/strict';
import test from 'node:test';

import { coordinateImplementationStatus } from './implementation-readiness-coordinator.mjs';

function baseControl(active = null) {
  return {
    primaryAction: active
      ? { type: 'EJECUTAR_IMPLEMENTACION', target: active.instanceId, title: 'Base active' }
      : { type: 'DOCUMENTAR_TAREA', target: 'DOC-001', title: 'Documentar' },
    physical: { active },
    documentary: { taskId: 'DOC-001' },
  };
}

const readyRegistry = {
  package_execution: {
    mode: 'DETERMINISTIC_LINEAR_TOPOLOGICAL',
    state: 'READY_FOR_AUTHORIZATION',
    sequence: [{ package_id: 'NEXO-PACKAGE-001' }],
    current: {
      position: 1,
      package_id: 'NEXO-PACKAGE-001',
      next_action: {
        type: 'AUTHORIZE_PHYSICAL_IMPLEMENTATION',
        target: 'SHELL-CI-020::NEXO-PACKAGE-001',
        command: 'npm run docs:implementation:status',
        reason: 'Gate completo; falta autorización física humana.',
      },
    },
  },
  implementation_ready_queue: [{
    package_id: 'NEXO-PACKAGE-001',
    capability_id: 'NEXO_PACKAGE',
    owner_application: 'nexo',
    gate_id: 'E5-GATE-008::NEXO-PACKAGE-001',
    next_execution: 'SHELL-CI-020::NEXO-PACKAGE-001',
  }],
};

test('una instancia física ya activa conserva prioridad sobre la cola de packages', () => {
  const active = { instanceId: 'SHELL-CI-010::GLOBAL', status: 'IN_PROGRESS' };
  const result = coordinateImplementationStatus({ baseControl: baseControl(active), registry: readyRegistry });
  assert.equal(result.coordinationSource, 'IMPLEMENTATION_CONTROL_ACTIVE_INSTANCE');
  assert.equal(result.coordinatedPrimaryAction.target, active.instanceId);
  assert.equal(result.readinessCandidate.packageId, 'NEXO-PACKAGE-001');
});

test('sin instancia activa, el package actual ready produce candidato READY_FOR_AUTHORIZATION', () => {
  const result = coordinateImplementationStatus({ baseControl: baseControl(), registry: readyRegistry });
  assert.equal(result.coordinationSource, 'PACKAGE_EXECUTION_LINEAR');
  assert.equal(result.coordinatedPrimaryAction.type, 'AUTHORIZE_PHYSICAL_IMPLEMENTATION');
  assert.equal(result.coordinatedPrimaryAction.target, 'SHELL-CI-020::NEXO-PACKAGE-001');
  assert.equal(result.readinessCandidate.status, 'READY_FOR_AUTHORIZATION');
  assert.equal(result.readinessCandidate.authorizationRequired, true);
  assert.equal(result.implementationAuthorized, undefined);
});

test('línea completa conserva la acción documental base', () => {
  const base = baseControl();
  const result = coordinateImplementationStatus({
    baseControl: base,
    registry: { implementation_ready_queue: [], package_execution: { current: null, sequence: [] } },
  });
  assert.equal(result.coordinationSource, 'PACKAGE_EXECUTION_COMPLETE');
  assert.equal(result.coordinatedPrimaryAction, base.primaryAction);
  assert.equal(result.readinessCandidate, null);
});

test('un package actual bloqueado conserva el turno aunque otro esté ready', () => {
  const result = coordinateImplementationStatus({
    baseControl: baseControl(),
    registry: {
      package_execution: {
        state: 'BLOCKED_ON_CURRENT',
        sequence: [{ package_id: 'GAP-PKG-001' }, { package_id: 'GAP-PKG-061' }],
        current: {
          position: 1,
          package_id: 'GAP-PKG-001',
          next_action: {
            type: 'PREPARE_PACKAGE_GATE',
            target: 'GAP-PKG-001',
            command: 'npm run docs:package:prepare -- --package-id GAP-PKG-001',
            reason: 'Falta expediente.',
          },
        },
      },
      implementation_ready_queue: [{
        package_id: 'GAP-PKG-061',
        next_execution: 'SHELL-CI-020::GAP-PKG-061',
      }],
    },
  });
  assert.equal(result.coordinationSource, 'PACKAGE_EXECUTION_LINEAR');
  assert.equal(result.coordinatedPrimaryAction.type, 'PREPARE_PACKAGE_GATE');
  assert.equal(result.coordinatedPrimaryAction.target, 'GAP-PKG-001');
  assert.equal(result.readinessCandidate, null);
});
