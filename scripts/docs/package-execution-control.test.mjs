import test from 'node:test';
import assert from 'node:assert/strict';

import {
  deriveLinearPackageExecution,
  readPackageExecutionPolicy,
} from './package-execution-control.mjs';

const policy = {
  schema_version: 1,
  policy_id: 'PACKAGE-EXECUTION-001',
  mode: 'DETERMINISTIC_LINEAR_TOPOLOGICAL',
  automatic_next: true,
  human_package_selection: false,
  source_task: 'DELIV-PKG-015',
  layer_order: [0, 1, 2, 3, 4],
  tie_breakers: ['EXPLICIT_PACKAGE_DEPENDENCIES', 'IMPLEMENTATION_LAYER', 'PACKAGE_ID'],
  terminal_statuses: ['CLOSED'],
  stop_on_blocked_current: true,
  physical_authorization_required: true,
  defer_without_canonical_order: true,
};

function pkg(packageId, layer, status = 'COMPILED', dependencies = []) {
  return {
    package_id: packageId,
    source_kind: 'CANONICAL_GAP_PACKAGE',
    status,
    execution: {
      layer,
      depends_on_package_ids: dependencies,
      deferred: false,
    },
    blockers: status === 'IMPLEMENTATION_READY' ? [] : ['PENDING'],
    task_prerequisites: { missing_task_ids: [] },
    package_gate: null,
    next_execution: status === 'IMPLEMENTATION_READY' ? `SHELL-CI-020::${packageId}` : null,
  };
}

test('la política versionada elimina selección humana y exige secuencia automática', () => {
  const loaded = readPackageExecutionPolicy(process.cwd());
  assert.equal(loaded.mode, 'DETERMINISTIC_LINEAR_TOPOLOGICAL');
  assert.equal(loaded.automatic_next, true);
  assert.equal(loaded.human_package_selection, false);
  assert.equal(loaded.stop_on_blocked_current, true);
});

test('un package bloqueado conserva el turno aunque exista otro listo', () => {
  const blocked = pkg('GAP-PKG-001', 1);
  const laterReady = pkg('GAP-PKG-002', 2, 'IMPLEMENTATION_READY');
  const deferred = {
    ...pkg('GAP-PKG-003', null),
    execution: { layer: null, depends_on_package_ids: [], deferred: true, deferred_reason: 'NO_EJECUTABLE' },
  };
  const result = deriveLinearPackageExecution({ packages: [laterReady, deferred, blocked] }, policy);

  assert.deepEqual(result.sequence.map(({ package_id: packageId }) => packageId), ['GAP-PKG-001', 'GAP-PKG-002']);
  assert.equal(result.current.package_id, 'GAP-PKG-001');
  assert.equal(result.current.next_action.type, 'PREPARE_PACKAGE_GATE');
  assert.equal(result.state, 'BLOCKED_ON_CURRENT');
  assert.deepEqual(result.deferred.map(({ package_id: packageId }) => packageId), ['GAP-PKG-003']);
});

test('al cerrar el actual avanza automáticamente al siguiente y pide autorización física', () => {
  const closed = pkg('GAP-PKG-001', 1, 'CLOSED');
  const ready = pkg('GAP-PKG-002', 2, 'IMPLEMENTATION_READY');
  const result = deriveLinearPackageExecution({ packages: [ready, closed] }, policy);

  assert.equal(result.current.package_id, 'GAP-PKG-002');
  assert.equal(result.current.position, 2);
  assert.equal(result.current.next_action.type, 'AUTHORIZE_PHYSICAL_IMPLEMENTATION');
  assert.equal(result.state, 'READY_FOR_AUTHORIZATION');
});

test('un gate aprobado espera el prerrequisito físico exacto sin saltar de package', () => {
  const waiting = {
    ...pkg('GAP-PKG-001', 1),
    package_gate: { status: 'APPROVED_FOR_IMPLEMENTATION' },
    blockers: ['PHYSICAL_DEPENDENCIES:FAIL'],
    physical_dependencies: {
      status: 'FAIL',
      evidence: [{ source: 'SHELL-CI-019::GLOBAL', status: 'FAIL', detail: 'Se requiere VERIFIED.' }],
    },
  };
  const result = deriveLinearPackageExecution({ packages: [waiting] }, policy);

  assert.equal(result.current.package_id, 'GAP-PKG-001');
  assert.equal(result.current.next_action.type, 'WAIT_FOR_PHYSICAL_PREREQUISITE');
  assert.equal(result.current.next_action.target, 'SHELL-CI-019::GLOBAL');
});

test('una arista explícita prevalece sobre package_id dentro de la misma capa', () => {
  const dependent = pkg('GAP-PKG-001', 1, 'COMPILED', ['GAP-PKG-002']);
  const predecessor = pkg('GAP-PKG-002', 1);
  const result = deriveLinearPackageExecution({ packages: [dependent, predecessor] }, policy);

  assert.deepEqual(result.sequence.map(({ package_id: packageId }) => packageId), ['GAP-PKG-002', 'GAP-PKG-001']);
});

test('rechaza ciclos y dependencias que contradicen las capas', () => {
  assert.throws(
    () => deriveLinearPackageExecution({ packages: [
      pkg('GAP-PKG-001', 1, 'COMPILED', ['GAP-PKG-002']),
      pkg('GAP-PKG-002', 1, 'COMPILED', ['GAP-PKG-001']),
    ] }, policy),
    /Ciclo entre packages/u,
  );
  assert.throws(
    () => deriveLinearPackageExecution({ packages: [
      pkg('GAP-PKG-001', 1, 'COMPILED', ['GAP-PKG-002']),
      pkg('GAP-PKG-002', 2),
    ] }, policy),
    /contradice el orden de capas/u,
  );
});
