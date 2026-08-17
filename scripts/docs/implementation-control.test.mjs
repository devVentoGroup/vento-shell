import assert from 'node:assert/strict';
import fs from 'node:fs';
import os from 'node:os';
import path from 'node:path';
import test from 'node:test';

import {
  deriveImplementationControl,
  ensurePendingImplementationRecord,
  pendingInstanceRecord,
} from './implementation-control.mjs';

const baseControl = {
  schema_version: 1,
  authorization_mode: 'EXPLICIT_PER_INSTANCE',
  automatic_authorization: false,
  single_primary_action: true,
  instance_storage_mode: 'ONE_FILE_PER_INSTANCE',
  instance_records_directory: 'docs/plan-canonico/modular/implementation-instances',
  instance_history_mode: 'APPEND_ONLY_LEDGER',
  verified_instances_immutable: true,
  execution_operator_policy: {
    default_operator: 'HUMAN_USER',
    interaction_mode: 'CONTINUOUS_BATCH_UNTIL_EVIDENCE_GATE',
    assistant_repository_writes: false,
    assistant_validation_execution: false,
    assistant_git_operations: false,
    assistant_remote_mutations: false,
    assistant_read_only_audit: true,
    pause_only_when_next_step_depends_on_evidence: true,
    evidence_reply_prefix: 'RESULTADO DEL PASO ',
    assisted_execution_authorization_prefix: 'AUTORIZO EJECUCION ASISTIDA DEL PASO ',
  },
  instance_statuses: [
    'PENDING_AUTHORIZATION',
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
  const entry = {
    instance_id: `${taskId}::GLOBAL`,
    task_id: taskId,
    status,
    target_repositories: ['vento-shell'],
    authorized_changes: ['scripts de CI del habilitador'],
    validation_commands: ['npm test'],
    evidence: ['evidence.json'],
  };
  return {
    ...entry,
    authorization: {
      decision: 'APPROVED',
      approved_by: 'VENTO_OWNER',
      approved_at: '2026-08-17',
      timezone: 'America/Bogota',
      approval_statement: 'Apruebo exclusivamente el alcance declarado por esta instancia.',
      source_contract_sha256: 'a'.repeat(64),
    },
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

test('el borrador automático conserva identidad sin inferir autorización ni alcance', () => {
  const draft = pendingInstanceRecord({
    instanceId: 'SHELL-CI-001::GLOBAL',
    taskId: 'SHELL-CI-001',
  });
  assert.deepEqual(draft, {
    instance_id: 'SHELL-CI-001::GLOBAL',
    task_id: 'SHELL-CI-001',
    status: 'PENDING_AUTHORIZATION',
    target_repositories: [],
    authorized_changes: [],
    validation_commands: [],
    authorization: null,
    evidence: [],
  });
  const result = deriveImplementationControl({
    control: { ...baseControl, instances: [draft] },
    workTopology: topology(),
  });
  assert.equal(result.primaryAction.type, 'AUTORIZAR_IMPLEMENTACION');
  assert.equal(result.implementationAuthorized, false);
  assert.equal(result.physical.active.record.status, 'PENDING_AUTHORIZATION');
});

test('materializa automáticamente el archivo pendiente exacto una sola vez', () => {
  const root = fs.mkdtempSync(path.join(os.tmpdir(), 'vento-implementation-instance-'));
  const recordPath = 'docs/plan-canonico/modular/implementation-instances/SHELL-CI-001__GLOBAL.json';
  const control = {
    primaryAction: { type: 'AUTORIZAR_IMPLEMENTACION' },
    physical: {
      active: {
        instanceId: 'SHELL-CI-001::GLOBAL',
        taskId: 'SHELL-CI-001',
        recordPath,
        source: 'DERIVED_FROM_APPROVED_CONTRACT',
      },
    },
  };
  try {
    assert.equal(ensurePendingImplementationRecord({ root, control }), true);
    const materialized = JSON.parse(fs.readFileSync(path.join(root, recordPath), 'utf8'));
    assert.equal(materialized.status, 'PENDING_AUTHORIZATION');
    assert.deepEqual(materialized.target_repositories, []);
    assert.equal(materialized.authorization, null);
    const original = fs.readFileSync(path.join(root, recordPath), 'utf8');
    assert.equal(ensurePendingImplementationRecord({ root, control }), true);
    assert.equal(fs.readFileSync(path.join(root, recordPath), 'utf8'), original);
  } finally {
    fs.rmSync(root, { recursive: true, force: true });
  }
});

test('una autorización explícita cambia la instrucción a implementar solo su alcance', () => {
  const result = deriveImplementationControl({
    control: { ...baseControl, instances: [scope('AUTHORIZED')] },
    workTopology: topology(),
  });
  assert.equal(result.primaryAction.type, 'INICIAR_IMPLEMENTACION');
  assert.equal(result.implementationAuthorized, true);
  assert.equal(result.executionOperatorPolicy.defaultOperator, 'HUMAN_USER');
  assert.equal(result.executionOperatorPolicy.assistantRepositoryWrites, false);
  assert.match(result.primaryAction.instruction, /guía humana/u);
  assert.equal(result.executionOperatorPolicy.pauseOnlyWhenNextStepDependsOnEvidence, true);
  assert.equal(result.executionOperatorPolicy.evidenceReplyPrefix, 'RESULTADO DEL PASO ');
  assert.deepEqual(result.physical.authorized.map(({ instanceId }) => instanceId), ['SHELL-CI-001::GLOBAL']);
});

test('rechaza habilitar escrituras automáticas del asistente por inferencia', () => {
  assert.throws(() => deriveImplementationControl({
    control: {
      ...baseControl,
      execution_operator_policy: {
        ...baseControl.execution_operator_policy,
        assistant_repository_writes: true,
      },
    },
    workTopology: topology(),
  }), /assistant_repository_writes debe ser false/u);
});

test('rechaza autorizar una instancia sin evidencia humana completa', () => {
  const entry = scope('AUTHORIZED');
  delete entry.authorization;
  assert.throws(() => deriveImplementationControl({
    control: { ...baseControl, instances: [entry] },
    workTopology: topology(),
  }), /debe conservar authorization como evidencia humana/u);
});

test('acepta la autorización sin obligar al usuario a calcular un hash del alcance', () => {
  const entry = scope('AUTHORIZED');
  const result = deriveImplementationControl({
    control: { ...baseControl, instances: [entry] },
    workTopology: topology(),
  });
  assert.equal(result.primaryAction.type, 'INICIAR_IMPLEMENTACION');
});

test('la segunda instancia global solo queda elegible después de verificar la primera', () => {
  const result = deriveImplementationControl({
    control: { ...baseControl, instances: [scope('VERIFIED')] },
    workTopology: topology(),
  });
  assert.equal(result.primaryAction.type, 'AUTORIZAR_IMPLEMENTACION');
  assert.equal(result.primaryAction.target, 'SHELL-CI-002::GLOBAL');
  assert.equal(
    result.physical.active.recordPath,
    'docs/plan-canonico/modular/implementation-instances/SHELL-CI-002__GLOBAL.json',
  );
  assert.deepEqual(
    result.physical.recordedInstances.map(({ instance_id: instanceId }) => instanceId),
    ['SHELL-CI-001::GLOBAL'],
  );
});

test('el historial físico exige almacenamiento acumulativo por archivo', () => {
  assert.throws(() => deriveImplementationControl({
    control: {
      ...baseControl,
      instance_history_mode: 'REPLACE_CURRENT',
    },
    workTopology: topology(),
  }), /instance_history_mode debe ser APPEND_ONLY_LEDGER/u);
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
