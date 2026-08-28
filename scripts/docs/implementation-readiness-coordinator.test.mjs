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

test('sin instancia activa, IMPLEMENTATION_READY_QUEUE produce candidato READY_FOR_AUTHORIZATION', () => {
  const result = coordinateImplementationStatus({ baseControl: baseControl(), registry: readyRegistry });
  assert.equal(result.coordinationSource, 'IMPLEMENTATION_READY_QUEUE');
  assert.equal(result.coordinatedPrimaryAction.type, 'AUTORIZAR_IMPLEMENTACION');
  assert.equal(result.coordinatedPrimaryAction.target, 'SHELL-CI-020::NEXO-PACKAGE-001');
  assert.equal(result.readinessCandidate.status, 'READY_FOR_AUTHORIZATION');
  assert.equal(result.readinessCandidate.authorizationRequired, true);
  assert.equal(result.implementationAuthorized, undefined);
});

test('cola vacía conserva la acción documental base', () => {
  const base = baseControl();
  const result = coordinateImplementationStatus({
    baseControl: base,
    registry: { implementation_ready_queue: [] },
  });
  assert.equal(result.coordinationSource, 'IMPLEMENTATION_CONTROL_NO_READY_PACKAGE');
  assert.equal(result.coordinatedPrimaryAction, base.primaryAction);
  assert.equal(result.readinessCandidate, null);
});
