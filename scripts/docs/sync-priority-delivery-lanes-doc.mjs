import fs from 'node:fs';
import path from 'node:path';
import { fileURLToPath } from 'node:url';

const START_MARKER = '<!-- NEXO-REMISSIONS-ORDER:START -->';
const END_MARKER = '<!-- NEXO-REMISSIONS-ORDER:END -->';

function deriveOrderedExecutionStages(lane) {
  const stages = [];
  const add = (stageId, taskSource, rule) => {
    stages.push({
      order: stages.length + 1,
      stage_id: stageId,
      task_source: taskSource,
      rule,
    });
  };
  for (const artifact of lane.required_task_artifacts) {
    add(
      artifact.artifact_group_id,
      `required_task_artifacts.${artifact.artifact_group_id}`,
      'Completar el grupo en el orden declarado y conservar evidencia antes de avanzar.',
    );
  }
  add(
    'CONDITIONAL_ARTIFACTS',
    'conditional_artifacts',
    'Evaluar todos los grupos; ejecutar los aplicables y justificar por escrito cada no aplicable.',
  );
  add(
    'PACKAGE_DEFINITION',
    'package_definition_tasks',
    'Completar DELIV-PKG-001 a DELIV-PKG-025 para el package_id del carril.',
  );
  for (const artifact of lane.post_package_artifacts) {
    add(
      artifact.artifact_group_id,
      `post_package_artifacts.${artifact.artifact_group_id}`,
      'Completar el plan o gate en el orden declarado antes de solicitar la puerta E5 final.',
    );
  }
  add(
    'PACKAGE_GATE',
    'package_gate',
    'Aprobar E5-GATE-008::NEXO-REMISSIONS-001 sin cerrar E5 completo.',
  );
  add(
    'IMPLEMENTATION',
    `execution_cycle.${lane.execution_cycle[0]}`,
    'Implementar y desplegar el paquete aprobado.',
  );
  for (const artifact of lane.post_implementation_artifacts) {
    add(
      artifact.artifact_group_id,
      `post_implementation_artifacts.${artifact.artifact_group_id}`,
      'Ejecutar y cerrar la certificación del alcance implementado antes de readiness.',
    );
  }
  const remainingStageIds = [
    'READINESS',
    'PILOT',
    'HYPERCARE',
    'CERTIFICATION',
  ];
  const remainingRules = [
    'Validar readiness técnico y operativo.',
    'Ejecutar piloto controlado y conservar evidencia.',
    'Estabilizar, conciliar y resolver defectos del alcance.',
    'Certificar únicamente el paquete de remisiones NEXO.',
  ];
  lane.execution_cycle.slice(1).forEach((taskId, index) => {
    add(
      remainingStageIds[index],
      `execution_cycle.${taskId}`,
      remainingRules[index],
    );
  });
  return stages;
}

function syncPriorityLaneSource({ root, check }) {
  const sourcePath = path.join(
    root,
    'docs/plan-canonico/modular/priority-delivery-lanes.json',
  );
  const source = fs.readFileSync(sourcePath, 'utf8');
  const data = JSON.parse(source);
  const lane = data.lanes.find(
    ({ lane_id: laneId }) => laneId === 'NEXO-REMISSIONS-001',
  );
  const expectedStages = deriveOrderedExecutionStages(lane);
  if (
    JSON.stringify(lane.ordered_execution_stages)
    === JSON.stringify(expectedStages)
  ) {
    return { changed: false, data };
  }
  if (check) {
    throw new Error(
      'ordered_execution_stages está desactualizado frente a sus grupos.',
    );
  }
  lane.ordered_execution_stages = expectedStages;
  fs.writeFileSync(sourcePath, `${JSON.stringify(data, null, 2)}\n`, 'utf8');
  return { changed: true, data };
}

function taskNotation(artifact) {
  return [
    ...(artifact.task_refs ?? []).map((taskId) => `\`${taskId}\``),
    ...(artifact.task_ranges ?? []).map(({ prefix, from, to }) => {
      const first = `${prefix}-${String(from).padStart(3, '0')}`;
      const last = `${prefix}-${String(to).padStart(3, '0')}`;
      return from === to ? `\`${first}\`` : `\`${first}\` a \`${last}\``;
    }),
  ].join('; ');
}

export function renderPriorityLaneOrderSection(data) {
  const lane = data.lanes.find(
    ({ lane_id: laneId }) => laneId === 'NEXO-REMISSIONS-001',
  );
  if (!lane) throw new Error('Falta el carril NEXO-REMISSIONS-001.');

  const requiredById = new Map(
    lane.required_task_artifacts.map(
      (artifact) => [artifact.artifact_group_id, artifact],
    ),
  );
  const postPackageById = new Map(
    lane.post_package_artifacts.map(
      (artifact) => [artifact.artifact_group_id, artifact],
    ),
  );
  const postImplementationById = new Map(
    lane.post_implementation_artifacts.map(
      (artifact) => [artifact.artifact_group_id, artifact],
    ),
  );
  const rows = lane.ordered_execution_stages.map((stage) => {
    let tasks;
    let result;
    if (stage.task_source.startsWith('required_task_artifacts.')) {
      const groupId = stage.task_source.slice(
        'required_task_artifacts.'.length,
      );
      const artifact = requiredById.get(groupId);
      tasks = taskNotation(artifact);
      result = artifact.required_scope;
    } else if (stage.task_source === 'conditional_artifacts') {
      tasks = 'Evaluar la matriz condicional completa mostrada debajo';
      result = 'cada grupo queda ejecutado o justificado como no aplicable';
    } else if (stage.task_source === 'package_definition_tasks') {
      tasks = '`DELIV-PKG-001` a `DELIV-PKG-025`';
      result = 'paquete ejecutable, verificable y reversible';
    } else if (stage.task_source.startsWith('post_package_artifacts.')) {
      const groupId = stage.task_source.slice(
        'post_package_artifacts.'.length,
      );
      const artifact = postPackageById.get(groupId);
      tasks = taskNotation(artifact);
      result = artifact.required_scope;
    } else if (stage.task_source.startsWith('post_implementation_artifacts.')) {
      const groupId = stage.task_source.slice(
        'post_implementation_artifacts.'.length,
      );
      const artifact = postImplementationById.get(groupId);
      tasks = taskNotation(artifact);
      result = artifact.required_scope;
    } else if (stage.task_source === 'package_gate') {
      tasks = '`E5-GATE-008::NEXO-REMISSIONS-001`';
      result = 'autorización explícita del paquete, sin cerrar E5';
    } else {
      const taskId = stage.task_source.slice('execution_cycle.'.length);
      tasks = `\`${taskId}::NEXO-REMISSIONS-001\``;
      result = stage.rule;
    }
    return `| ${stage.order} | \`${stage.stage_id}\` | ${tasks} | ${result} |`;
  });

  const conditionalRows = lane.conditional_artifacts.map(
    (artifact, index) =>
      `| ${index + 1} | \`${artifact.artifact_group_id}\` | ${artifact.condition} | ${taskNotation(artifact)} |`,
  );
  const deferredRows = lane.deferred_but_preserved.map(
    (artifact, index) =>
      `| ${index + 1} | ${taskNotation(artifact)} | ${artifact.reason} |`,
  );

  return [
    START_MARKER,
    '#### Orden ejecutable de NEXO-REMISSIONS-001',
    '',
    'Esta tabla se genera automáticamente desde `priority-delivery-lanes.json`.',
    'Las etapas son secuenciales y no se avanza mientras la anterior carezca',
    'de resultado y evidencia. Dentro de cada grupo se respeta el orden',
    'enumerado por sus tareas o rangos.',
    '',
    '| Etapa | Grupo | Tareas exactas | Resultado para avanzar |',
    '| ----: | ----- | -------------- | ---------------------- |',
    ...rows,
    '',
    '##### Matriz condicional obligatoria',
    '',
    'En la etapa `CONDITIONAL_ARTIFACTS` se evalúan todos los grupos siguientes.',
    '“No aplica” exige justificación escrita; no puede asumirse por silencio.',
    '',
    '| Orden | Grupo | Se activa cuando | Tareas exactas |',
    '| ----: | ----- | ---------------- | -------------- |',
    ...conditionalRows,
    '',
    '##### Trabajo posterior preservado',
    '',
    'Estas tareas no desaparecen ni se consideran terminadas por certificar el',
    'paquete. Regresan al flujo normal en su fase propietaria.',
    '',
    '| Orden | Tareas preservadas | Motivo |',
    '| ----: | ------------------ | ------ |',
    ...deferredRows,
    '',
    'Los artefactos del carril no cambian por sí solos el marcador de una tarea',
    'canónica. Cada aprobación global continúa requiriendo alcance completo y',
    'confirmación explícita.',
    END_MARKER,
  ].join('\n');
}

export function syncPriorityLaneOrderDocument({
  root = process.cwd(),
  check = false,
} = {}) {
  const modularRoot = path.join(root, 'docs', 'plan-canonico', 'modular');
  const sourceSync = syncPriorityLaneSource({ root, check });
  const data = sourceSync.data;
  const documentPath = path.join(
    modularRoot,
    '90_ORDEN_DE_IMPLEMENTACION.md',
  );
  const source = fs.readFileSync(documentPath, 'utf8');
  const start = source.indexOf(START_MARKER);
  const end = source.indexOf(END_MARKER);
  if (start < 0 || end < start) {
    throw new Error('Faltan los marcadores de orden ejecutable del carril.');
  }
  const expected = renderPriorityLaneOrderSection(data);
  const current = source.slice(start, end + END_MARKER.length);
  if (current === expected) return { changed: sourceSync.changed };
  if (check) {
    throw new Error(
      'El orden visible de NEXO-REMISSIONS-001 está desactualizado.',
    );
  }
  const updated =
    source.slice(0, start) + expected + source.slice(end + END_MARKER.length);
  fs.writeFileSync(documentPath, updated, 'utf8');
  return { changed: true };
}

const isCli =
  process.argv[1]
  && path.resolve(process.argv[1]) === fileURLToPath(import.meta.url);
if (isCli) {
  try {
    const result = syncPriorityLaneOrderDocument({
      check: process.argv.includes('--check'),
    });
    console.log(
      result.changed
        ? 'OK: orden visible del carril actualizado.'
        : 'OK: orden visible del carril vigente.',
    );
  } catch (error) {
    console.error(`ERROR: ${error.message}`);
    process.exit(1);
  }
}
