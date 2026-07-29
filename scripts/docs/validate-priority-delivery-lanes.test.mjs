import assert from 'node:assert/strict';
import test from 'node:test';
import {
  validatePriorityDeliveryLaneData,
} from './validate-priority-delivery-lanes.mjs';

const packageTasks = Array.from(
  { length: 25 },
  (_, index) => `DELIV-PKG-${String(index + 1).padStart(3, '0')}`,
);
const cycle = [
  'SHELL-CI-020',
  'SHELL-CI-021',
  'SHELL-CI-022',
  'SHELL-CI-023',
  'SHELL-CI-024',
];
const taskIds = new Set([
  'INT-APP-001',
  'E5-GATE-008',
  ...packageTasks,
  ...cycle,
]);
const documents = {
  order:
    '<!-- PRIORITY-DELIVERY-LANES:START --> NEXO-REMISSIONS-001 canonical_sequence_unchanged = true',
  protocol:
    '<!-- PRIORITY-PACKAGE-PROTOCOL:START --> global_task_partial_approval_forbidden E5-GATE-008::<package_id>',
  principles:
    'Aplicación incremental sin aprobación parcial NEXO-REMISSIONS-001',
  gate: 'Instancia de puerta por paquete E5-GATE-008::<package_id>',
  delivery:
    'SHELL-CI-020::<package_id> SHELL-CI-024::<package_id> no modifica el estado de la tarea canónica',
  nexo:
    'Primer paquete vertical designado NEXO-REMISSIONS-001 no es una tarea nueva',
};

function validData() {
  return {
    schema_version: 1,
    canonical_sequence_unchanged: true,
    global_task_partial_approval_forbidden: true,
    lanes: [
      {
        lane_id: 'NEXO-REMISSIONS-001',
        status: 'DESIGNATED_NOT_READY',
        supabase_repository: 'vento-shell',
        required_task_artifacts: [
          { task_refs: ['INT-APP-001'], required_scope: 'eventos' },
        ],
        conditional_artifacts: [],
        package_definition_tasks: packageTasks,
        package_gate: 'E5-GATE-008',
        execution_cycle: cycle,
        completion_task: 'SHELL-CI-024',
        excluded_from_closure: ['NEXO completo'],
        invariants: Array.from({ length: 8 }, (_, index) => `regla ${index}`),
      },
    ],
  };
}

test('acepta un carril que conserva secuencia, paquete y cierre independiente', () => {
  const stats = validatePriorityDeliveryLaneData({
    data: validData(),
    taskIds,
    documents,
  });

  assert.equal(stats.lanes, 1);
  assert.equal(stats.designated, 1);
});

test('rechaza habilitar aprobación parcial de tareas globales', () => {
  const data = validData();
  data.global_task_partial_approval_forbidden = false;

  assert.throws(
    () => validatePriorityDeliveryLaneData({
      data,
      taskIds,
      documents,
    }),
    /global_task_partial_approval_forbidden/,
  );
});

test('rechaza cambiar el repositorio propietario de Supabase', () => {
  const data = validData();
  data.lanes[0].supabase_repository = 'vento-nexo';

  assert.throws(
    () => validatePriorityDeliveryLaneData({
      data,
      taskIds,
      documents,
    }),
    /Supabase deberá permanecer en vento-shell/,
  );
});

test('rechaza omitir una tarea o alterar el ciclo de cierre', () => {
  const data = validData();
  data.lanes[0].execution_cycle = ['SHELL-CI-020', 'SHELL-CI-024'];
  data.lanes[0].required_task_artifacts[0].task_refs.push('TASK-UNKNOWN-001');

  assert.throws(
    () => validatePriorityDeliveryLaneData({
      data,
      taskIds,
      documents,
    }),
    /ciclo SHELL-CI-020 a SHELL-CI-024|tareas inexistentes/,
  );
});
