import assert from 'node:assert/strict';
import fs from 'node:fs';
import test from 'node:test';
import {
  validatePriorityDeliveryLaneData,
} from './validate-priority-delivery-lanes.mjs';

const canonicalData = JSON.parse(
  fs.readFileSync(
    new URL('../../docs/plan-canonico/modular/priority-delivery-lanes.json', import.meta.url),
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
const allArtifactCollections = [
  canonicalLane.required_task_artifacts,
  canonicalLane.conditional_artifacts,
  canonicalLane.conditional_implementation_artifacts,
  canonicalLane.execution_prerequisite_artifacts,
  canonicalLane.implementation_artifacts,
  canonicalLane.post_package_artifacts,
  canonicalLane.post_implementation_artifacts,
  canonicalLane.deferred_but_preserved,
];
const taskIds = new Set([
  ...allArtifactCollections.flatMap((collection) =>
    collection.flatMap(artifactRefs)),
  ...canonicalLane.package_definition_tasks,
  canonicalLane.package_gate,
  ...canonicalLane.execution_cycle,
  canonicalLane.completion_task,
]);
const documents = {
  order:
    '<!-- PRIORITY-DELIVERY-LANES:START --> NEXO-REMISSIONS-001 canonical_sequence_unchanged = true ¿LA PRIORIDAD DE IMPLEMENTACIÓN ACTIVA ES REMISIONES NEXO? Orden ejecutable de NEXO-REMISSIONS-001 desde la etapa 1 hasta la 44 NEXO_INVENTORY_CLASSIFICATION CONDITIONAL_IMPLEMENTATION_SCOPE Ninguna tarea de implementación, migración o cambio físico comienza antes CI_FOUNDATION R2_NEXO_DATABASE_PACKAGE E5_READINESS_PLAN U_AUTHORIZATION_CERTIFICATION SHELL-CI-024::NEXO-REMISSIONS-001',
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

function group(data, collection, groupId) {
  return data.lanes[0][collection].find(
    ({ artifact_group_id: candidate }) => candidate === groupId,
  );
}

test('acepta un carril que separa diseño, puerta e implementación física', () => {
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
    () => validatePriorityDeliveryLaneData({ data, taskIds, documents }),
    /global_task_partial_approval_forbidden/,
  );
});

test('rechaza cambiar el repositorio propietario de Supabase', () => {
  const data = validData();
  data.lanes[0].supabase_repository = 'vento-nexo';
  assert.throws(
    () => validatePriorityDeliveryLaneData({ data, taskIds, documents }),
    /Supabase deberá permanecer en vento-shell/,
  );
});

test('rechaza omitir auditoría o arquitectura de normalización en E3', () => {
  const data = validData();
  group(data, 'required_task_artifacts', 'SUPABASE_AUDIT')
    .task_ranges[1].to = 6;
  group(data, 'required_task_artifacts', 'SUPABASE_ARCHITECTURE')
    .task_ranges[1].to = 11;
  assert.throws(
    () => validatePriorityDeliveryLaneData({ data, taskIds, documents }),
    /SUPABASE_AUDIT omite tareas|SUPABASE_ARCHITECTURE omite tareas/,
  );
});

test('rechaza aprobar SUPA-TRANS-016 sin transición de normalización', () => {
  const data = validData();
  group(data, 'required_task_artifacts', 'SUPABASE_TRANSITION')
    .task_ranges.splice(1, 1);
  assert.throws(
    () => validatePriorityDeliveryLaneData({ data, taskIds, documents }),
    /SUPABASE_TRANSITION omite tareas/,
  );
});

test('rechaza omitir la clasificación base de inventario NEXO', () => {
  const data = validData();
  group(data, 'required_task_artifacts', 'NEXO_INVENTORY_CLASSIFICATION')
    .task_refs.length = 0;
  assert.throws(
    () => validatePriorityDeliveryLaneData({ data, taskIds, documents }),
    /NEXO_INVENTORY_CLASSIFICATION omite tareas/,
  );
});

test('rechaza omitir una tarea de implementación obligatoria', () => {
  const data = validData();
  group(data, 'implementation_artifacts', 'R2_NEXO_DATABASE_PACKAGE')
    .task_refs.pop();
  assert.throws(
    () => validatePriorityDeliveryLaneData({ data, taskIds, documents }),
    /R2_NEXO_DATABASE_PACKAGE omite tareas/,
  );
});

test('rechaza mezclar normalización física con diseño condicional', () => {
  const data = validData();
  const physical = data.lanes[0].conditional_implementation_artifacts.shift();
  data.lanes[0].conditional_artifacts.push(physical);
  assert.throws(
    () => validatePriorityDeliveryLaneData({ data, taskIds, documents }),
    /grupos condicionales de diseño|grupos condicionales de implementación|artifact_group_id/,
  );
});

test('rechaza duplicar autorización de producción entre grupos', () => {
  const data = validData();
  group(data, 'implementation_artifacts', 'NEXO_AUTHORIZATION')
    .task_refs = ['NEXO-AUTH-007'];
  assert.throws(
    () => validatePriorityDeliveryLaneData({ data, taskIds, documents }),
    /NEXO-AUTH-007 aparece en más de un grupo|NEXO_AUTHORIZATION omite tareas/,
  );
});

test('rechaza iniciar implementación antes de CI o alterar su orden interno', () => {
  const data = validData();
  data.lanes[0].implementation_execution_order = [
    'R2_NEXO_DATABASE_PACKAGE',
    ...data.lanes[0].implementation_execution_order.slice(1),
  ];
  data.lanes[0].ordered_execution_stages[23].task_source =
    'implementation_artifacts.R2_NEXO_DATABASE_PACKAGE';
  assert.throws(
    () => validatePriorityDeliveryLaneData({ data, taskIds, documents }),
    /implementation_execution_order|orden ejecutable|fuera de orden/,
  );
});

test('rechaza omitir planes E5 o certificación posterior', () => {
  const data = validData();
  group(data, 'post_package_artifacts', 'E5_READINESS_PLAN')
    .task_ranges[0].to = 14;
  group(data, 'post_implementation_artifacts', 'U_AUTHORIZATION_CERTIFICATION')
    .task_ranges[0].to = 29;
  assert.throws(
    () => validatePriorityDeliveryLaneData({ data, taskIds, documents }),
    /E5_READINESS_PLAN omite tareas|U_AUTHORIZATION_CERTIFICATION omite tareas/,
  );
});

test('rechaza una ruta ambigua o un carril usado como secuencia documental', () => {
  const data = validData();
  data.implementation_route_policy.default_route = 'PRIORITY_BY_DEFAULT';
  assert.throws(
    () => validatePriorityDeliveryLaneData({
      data,
      taskIds,
      documents,
      activeSequenceSource: 'NEXO-REMISSIONS-001',
    }),
    /NORMAL_CANONICAL_FLOW|no puede reemplazar active-sequence/,
  );
});