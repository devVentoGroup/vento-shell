import assert from 'node:assert/strict';
import fs from 'node:fs';
import test from 'node:test';
import {
  validatePriorityDeliveryLaneData,
} from './validate-priority-delivery-lanes.mjs';

const canonicalData = JSON.parse(
  fs.readFileSync(
    'docs/plan-canonico/modular/priority-delivery-lanes.json',
    'utf8',
  ),
);
const canonicalLane = canonicalData.lanes[0];
const expandRanges = (ranges = []) =>
  ranges.flatMap(({ prefix, from, to }) =>
    Array.from(
      { length: to - from + 1 },
      (_, index) => `${prefix}-${String(from + index).padStart(3, '0')}`,
    ));
const artifactRefs = (artifact) => [
  ...(artifact.task_refs ?? []),
  ...expandRanges(artifact.task_ranges),
];
const taskIds = new Set([
  ...canonicalLane.required_task_artifacts.flatMap(artifactRefs),
  ...canonicalLane.conditional_artifacts.flatMap(artifactRefs),
  ...canonicalLane.post_package_artifacts.flatMap(artifactRefs),
  ...canonicalLane.post_implementation_artifacts.flatMap(artifactRefs),
  ...canonicalLane.deferred_but_preserved.flatMap(artifactRefs),
  ...canonicalLane.package_definition_tasks,
  canonicalLane.package_gate,
  ...canonicalLane.execution_cycle,
  canonicalLane.completion_task,
]);
const documents = {
  order:
    '<!-- PRIORITY-DELIVERY-LANES:START --> NEXO-REMISSIONS-001 canonical_sequence_unchanged = true ¿LA PRIORIDAD DE IMPLEMENTACIÓN ACTIVA ES REMISIONES NEXO? Orden ejecutable de NEXO-REMISSIONS-001 desde la etapa 1 hasta la 39 H_SHARED_AUDIT E5_READINESS_PLAN U_AUTHORIZATION_CERTIFICATION SHELL-CI-024::NEXO-REMISSIONS-001',
  protocol:
    '<!-- PRIORITY-PACKAGE-PROTOCOL:START --> global_task_partial_approval_forbidden E5-GATE-008::<package_id> NORMAL_CANONICAL_FLOW ordered_execution_stages deberá completar todo BLOQUE H',
  principles:
    'Aplicación incremental sin aprobación parcial NEXO-REMISSIONS-001',
  gate: 'Instancia de puerta por paquete E5-GATE-008::<package_id>',
  delivery:
    'SHELL-CI-020::<package_id> SHELL-CI-024::<package_id> no modifica el estado de la tarea canónica',
  nexo:
    'Primer paquete vertical designado NEXO-REMISSIONS-001 no es una tarea nueva',
};

function validData() {
  return structuredClone(canonicalData);
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
  data.lanes[0].required_task_artifacts[0].task_refs = ['TASK-UNKNOWN-001'];

  assert.throws(
    () => validatePriorityDeliveryLaneData({
      data,
      taskIds,
      documents,
    }),
    /ciclo SHELL-CI-020 a SHELL-CI-024|tareas inexistentes/,
  );
});

test('rechaza omitir una tarea obligatoria aunque el grupo siga existiendo', () => {
  const data = validData();
  data.lanes[0].required_task_artifacts[4].task_ranges[0].from = 2;

  assert.throws(
    () => validatePriorityDeliveryLaneData({
      data,
      taskIds,
      documents,
    }),
    /H_SHARED_AUDIT omite tareas/,
  );
});

test('rechaza omitir una tarea condicional o posterior preservada', () => {
  const data = validData();
  data.lanes[0].conditional_artifacts[2].task_ranges[0].to = 9;
  data.lanes[0].deferred_but_preserved[2].task_ranges[0].to = 37;

  assert.throws(
    () => validatePriorityDeliveryLaneData({
      data,
      taskIds,
      documents,
    }),
    /EVIDENCE_CONDITIONAL omite tareas|NEXO-DOM-038 debe quedar preservada/,
  );
});

test('rechaza omitir planes E5 o certificación posterior a implementación', () => {
  const data = validData();
  data.lanes[0].post_package_artifacts[0].task_ranges[0].to = 14;
  data.lanes[0].post_implementation_artifacts[0].task_ranges[0].to = 29;

  assert.throws(
    () => validatePriorityDeliveryLaneData({
      data,
      taskIds,
      documents,
    }),
    /E5_READINESS_PLAN omite tareas|U_AUTHORIZATION_CERTIFICATION omite tareas/,
  );
});

test('rechaza una ruta ambigua o etapas fuera de orden', () => {
  const data = validData();
  data.implementation_route_policy.default_route = 'PRIORITY_BY_DEFAULT';
  data.lanes[0].ordered_execution_stages[0].order = 2;

  assert.throws(
    () => validatePriorityDeliveryLaneData({
      data,
      taskIds,
      documents,
    }),
    /NORMAL_CANONICAL_FLOW|etapas deben estar numeradas/,
  );
});
