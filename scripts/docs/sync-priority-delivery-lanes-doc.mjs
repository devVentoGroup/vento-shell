import fs from 'node:fs';
import path from 'node:path';
import { fileURLToPath } from 'node:url';

const START_MARKER = '<!-- NEXO-REMISSIONS-ORDER:START -->';
const END_MARKER = '<!-- NEXO-REMISSIONS-ORDER:END -->';
const CONDITIONAL_IMPLEMENTATION_TOKEN = 'CONDITIONAL_IMPLEMENTATION_ARTIFACTS';

function mapById(artifacts = []) {
  return new Map(
    artifacts.map((artifact) => [artifact.artifact_group_id, artifact]),
  );
}

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

  for (const artifact of lane.required_task_artifacts ?? []) {
    add(
      artifact.artifact_group_id,
      `required_task_artifacts.${artifact.artifact_group_id}`,
      'Completar el grupo de diseño en el orden declarado y conservar evidencia antes de avanzar.',
    );
  }

  add(
    'CONDITIONAL_DESIGN_ARTIFACTS',
    'conditional_artifacts',
    'Evaluar todos los grupos de diseño; completar los aplicables y justificar por escrito cada no aplicable.',
  );
  add(
    'CONDITIONAL_IMPLEMENTATION_SCOPE',
    'conditional_implementation_scope',
    'Evaluar cada grupo condicional de implementación e incluirlo o excluirlo expresamente en DELIV-PKG antes de aprobar el paquete.',
  );
  add(
    'PACKAGE_DEFINITION',
    'package_definition_tasks',
    'Completar DELIV-PKG-001 a DELIV-PKG-025 para el package_id del carril.',
  );

  const entryGateArtifact = (lane.post_package_artifacts ?? []).find(
    ({ artifact_group_id: groupId }) => groupId === 'E5_ENTRY_GATES',
  );
  for (const artifact of lane.post_package_artifacts ?? []) {
    if (artifact.artifact_group_id === 'E5_ENTRY_GATES') continue;
    add(
      artifact.artifact_group_id,
      `post_package_artifacts.${artifact.artifact_group_id}`,
      'Completar el plan en el orden declarado antes de certificar la infraestructura y solicitar las puertas E5.',
    );
  }

  for (const artifact of lane.execution_prerequisite_artifacts ?? []) {
    add(
      artifact.artifact_group_id,
      `execution_prerequisite_artifacts.${artifact.artifact_group_id}`,
      'Completar y certificar el habilitador antes de ejecutar E5-GATE-001 a E5-GATE-008.',
    );
  }

  if (entryGateArtifact) {
    add(
      entryGateArtifact.artifact_group_id,
      `post_package_artifacts.${entryGateArtifact.artifact_group_id}`,
      'Confirmar con infraestructura disponible que el paquete, las pruebas, el rollout, el rollback, el piloto y la evidencia son ejecutables.',
    );
  }

  add(
    'PACKAGE_GATE',
    'package_gate',
    'Aprobar E5-GATE-008::NEXO-REMISSIONS-001 sin cerrar E5 completo.',
  );

  add(
    'IMPLEMENTATION_START',
    `execution_cycle.${lane.execution_cycle[0]}`,
    'Iniciar la implementación y el despliegue únicamente del paquete aprobado.',
  );

  const implementationById = mapById(lane.implementation_artifacts);
  for (const groupId of lane.implementation_execution_order ?? []) {
    if (groupId === CONDITIONAL_IMPLEMENTATION_TOKEN) {
      add(
        'CONDITIONAL_IMPLEMENTATION_EXECUTION',
        'conditional_implementation_artifacts',
        'Ejecutar bajo el mismo package_id todos los grupos condicionales de implementación incluidos en DELIV-PKG y justificar cada no aplicable aprobado.',
      );
      continue;
    }
    if (!implementationById.has(groupId)) {
      throw new Error(
        `implementation_execution_order referencia un grupo inexistente: ${groupId}.`,
      );
    }
    add(
      groupId,
      `implementation_artifacts.${groupId}`,
      'Ejecutar el grupo dentro de SHELL-CI-020, conservar evidencia y no avanzar con fallos abiertos bloqueantes.',
    );
  }

  for (const artifact of lane.post_implementation_artifacts ?? []) {
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
  if (!lane) throw new Error('Falta el carril NEXO-REMISSIONS-001.');

  const expectedStages = deriveOrderedExecutionStages(lane);
  if (
    JSON.stringify(lane.ordered_execution_stages)
    === JSON.stringify(expectedStages)
  ) {
    return { changed: false, data };
  }
  if (check) {
    throw new Error(
      'ordered_execution_stages está desactualizado frente a sus grupos y orden de implementación.',
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

  const requiredById = mapById(lane.required_task_artifacts);
  const prerequisitesById = mapById(lane.execution_prerequisite_artifacts);
  const implementationById = mapById(lane.implementation_artifacts);
  const postPackageById = mapById(lane.post_package_artifacts);
  const postImplementationById = mapById(lane.post_implementation_artifacts);

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
      tasks = 'Evaluar la matriz condicional de diseño mostrada debajo';
      result = 'cada grupo queda completado o justificado como no aplicable antes de DELIV-PKG';
    } else if (stage.task_source === 'conditional_implementation_scope') {
      tasks = 'Evaluar la matriz condicional de implementación mostrada debajo';
      result = 'cada grupo de implementación queda incluido o excluido expresamente en DELIV-PKG antes de E5-GATE-008';
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
    } else if (stage.task_source === 'package_gate') {
      tasks = '`E5-GATE-008::NEXO-REMISSIONS-001`';
      result = 'autorización explícita del paquete, todavía sin despliegue ni cambio físico';
    } else if (
      stage.task_source.startsWith('execution_prerequisite_artifacts.')
    ) {
      const groupId = stage.task_source.slice(
        'execution_prerequisite_artifacts.'.length,
      );
      const artifact = prerequisitesById.get(groupId);
      tasks = taskNotation(artifact);
      result = artifact.required_scope;
    } else if (stage.task_source.startsWith('implementation_artifacts.')) {
      const groupId = stage.task_source.slice(
        'implementation_artifacts.'.length,
      );
      const artifact = implementationById.get(groupId);
      tasks = taskNotation(artifact);
      result = artifact.required_scope;
    } else if (
      stage.task_source === 'conditional_implementation_artifacts'
    ) {
      tasks = 'Ejecutar la matriz condicional de implementación aprobada en DELIV-PKG';
      result = 'todos los grupos aplicables ejecutados bajo el mismo package_id; cada no aplicable conserva su justificación aprobada';
    } else if (
      stage.task_source.startsWith('post_implementation_artifacts.')
    ) {
      const groupId = stage.task_source.slice(
        'post_implementation_artifacts.'.length,
      );
      const artifact = postImplementationById.get(groupId);
      tasks = taskNotation(artifact);
      result = artifact.required_scope;
    } else {
      const taskId = stage.task_source.slice('execution_cycle.'.length);
      tasks = `\`${taskId}::NEXO-REMISSIONS-001\``;
      result = stage.rule;
    }

    return `| ${stage.order} | \`${stage.stage_id}\` | ${tasks} | ${result} |`;
  });

  const conditionalDesignRows = (lane.conditional_artifacts ?? []).map(
    (artifact, index) =>
      `| ${index + 1} | \`${artifact.artifact_group_id}\` | ${artifact.condition} | ${taskNotation(artifact)} |`,
  );
  const conditionalImplementationRows = (
    lane.conditional_implementation_artifacts ?? []
  ).map(
    (artifact, index) =>
      `| ${index + 1} | \`${artifact.artifact_group_id}\` | ${artifact.condition} | ${taskNotation(artifact)} |`,
  );
  const deferredRows = (lane.deferred_but_preserved ?? []).map(
    (artifact, index) =>
      `| ${index + 1} | ${taskNotation(artifact)} | ${artifact.reason} |`,
  );

  return [
    START_MARKER,
    '#### Orden ejecutable de NEXO-REMISSIONS-001',
    '',
    'Esta tabla se genera automáticamente desde `priority-delivery-lanes.json`.',
    'Las etapas son secuenciales y no se avanza mientras la anterior carezca',
    'de resultado y evidencia. Las tareas de diseño terminan antes de E5.',
    'Ninguna tarea de implementación, migración o cambio físico comienza antes',
    'de `E5-GATE-008::NEXO-REMISSIONS-001`.',
    '',
    '| Etapa | Grupo | Tareas exactas | Resultado para avanzar |',
    '| ----: | ----- | -------------- | ---------------------- |',
    ...rows,
    '',
    '##### Matriz condicional de diseño',
    '',
    'Se evalúa antes de `DELIV-PKG-001`. “No aplica” exige justificación escrita;',
    'los grupos aplicables deben quedar diseñados antes de definir el paquete.',
    '',
    '| Orden | Grupo | Se activa cuando | Tareas exactas |',
    '| ----: | ----- | ---------------- | -------------- |',
    ...conditionalDesignRows,
    '',
    '##### Matriz condicional de implementación',
    '',
    'Se decide antes de `E5-GATE-008` y se ejecuta únicamente después de la',
    'puerta, dentro de `SHELL-CI-020::NEXO-REMISSIONS-001` y con el mismo',
    '`package_id`. La exclusión también debe quedar aprobada y trazable.',
    '',
    '| Orden | Grupo | Se activa cuando | Tareas exactas |',
    '| ----: | ----- | ---------------- | -------------- |',
    ...conditionalImplementationRows,
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