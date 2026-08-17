import assert from 'node:assert/strict';
import test from 'node:test';

import { deriveImplementationControl } from './implementation-control.mjs';

const baseControl = {
  schema_version: 1,
  authorization_mode: 'EXPLICIT_PER_INSTANCE',
  automatic_authorization: false,
  single_primary_action: true,
  instance_statuses: [
    'AUTHORIZED',
    'IN_PROGRESS',
    'BLOCKED',
    'IMPLEMENTED',
    'VERIFIED',
    'DEFERRED',
  ],
  instances: [],
};

function topology() {
  const tasks = [
    { id: 'SHELL-CI-001', title: 'Crear pruebas', marker: '✅', relativePath: 'ci.md' },
    { id: 'SHELL-CI-002', title: 'Crear build', marker: '✅', relativePath: 'ci.md' },
    { id: 'SHELL-CI-003', title: 'Crear releases', marker: '[ ]', relativePath: 'ci.md' },
  ];
  return {
    ordered: tasks,
    inventory: new Map(tasks.map((task) => [task.id, task])),
    topology: new Map(tasks.map((task) => [task.id, {
      taskId: task.id,
      mode: 'GLOBAL_ENABLE_ONCE',
      instancePattern: '<task_id>::GLOBAL',
    }])),
    currentId: 'SHELL-CI-003',
  };
}

function scope(status, taskId = 'SHELL-CI-001') {
  return {
    instance_id: `${taskId}::GLOBAL`,
    task_id: taskId,
    status,
    target_repositories: ['vento-shell'],
    authorized_changes: ['scripts de CI del habilitador'],
    validation_commands: ['npm test'],
    evidence: ['evidence.json'],
  };
}

test('elige una sola autorización física y pausa la documentación sin autorizar código', () => {
  const result = deriveImplementationControl({
    control: baseControl,
    workTopology: topology(),
  });
  assert.equal(result.primaryAction.type, 'AUTORIZAR_IMPLEMENTACION');
  assert.equal(result.primaryAction.target, 'SHELL-CI-001::GLOBAL');
  assert.equal(result.implementationAuthorized, false);
  assert.equal(result.documentary.taskId, 'SHELL-CI-003');
  assert.equal(result.documentary.state, 'PAUSADO_POR_ACCION_FISICA_PRIORITARIA');
  assert.equal(result.physical.instances[1].status, 'WAITING_FOR_PREVIOUS_INSTANCE');
});

test('una autorización explícita cambia la instrucción a implementar solo su alcance', () => {
  const result = deriveImplementationControl({
    control: { ...baseControl, instances: [scope('AUTHORIZED')] },
    workTopology: topology(),
  });
  assert.equal(result.primaryAction.type, 'INICIAR_IMPLEMENTACION');
  assert.equal(result.implementationAuthorized, true);
  assert.deepEqual(result.physical.authorized.map(({ instanceId }) => instanceId), ['SHELL-CI-001::GLOBAL']);
});

test('la segunda instancia global solo queda elegible después de verificar la primera', () => {
  const result = deriveImplementationControl({
    control: { ...baseControl, instances: [scope('VERIFIED')] },
    workTopology: topology(),
  });
  assert.equal(result.primaryAction.type, 'AUTORIZAR_IMPLEMENTACION');
  assert.equal(result.primaryAction.target, 'SHELL-CI-002::GLOBAL');
});

test('bloquea autorización paralela que salte una instancia global previa', () => {
  assert.throws(() => deriveImplementationControl({
    control: { ...baseControl, instances: [scope('AUTHORIZED', 'SHELL-CI-002')] },
    workTopology: topology(),
  }), /no puede estar AUTHORIZED antes de verificar SHELL-CI-001::GLOBAL/u);
});

test('una instancia por unidad no puede autorizarse sin evidencia de sus gates', () => {
  const workTopology = topology();
  workTopology.topology.set('SHELL-CI-001', {
    taskId: 'SHELL-CI-001',
    mode: 'PER_IMPLEMENTATION_UNIT',
    instancePattern: '<task_id>::<implementation_unit_id>',
  });
  assert.throws(() => deriveImplementationControl({
    control: {
      ...baseControl,
      instances: [{
        ...scope('AUTHORIZED'),
        instance_id: 'SHELL-CI-001::UNIT-001',
      }],
    },
    workTopology,
  }), /debe declarar prerequisite_evidence/u);
});
