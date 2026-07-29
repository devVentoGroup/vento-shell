import fs from 'node:fs';
import path from 'node:path';
import { fileURLToPath } from 'node:url';

const EXPECTED_CYCLE = [
  'SHELL-CI-020',
  'SHELL-CI-021',
  'SHELL-CI-022',
  'SHELL-CI-023',
  'SHELL-CI-024',
];
const EXPECTED_PACKAGE_TASKS = Array.from(
  { length: 25 },
  (_, index) => `DELIV-PKG-${String(index + 1).padStart(3, '0')}`,
);
const ALLOWED_STATUSES = new Set([
  'DESIGNATED_NOT_READY',
  'READY_FOR_E5',
  'APPROVED_FOR_IMPLEMENTATION',
  'IMPLEMENTING',
  'READINESS',
  'PILOT',
  'HYPERCARE',
  'CERTIFIED',
  'SUSPENDED',
  'REJECTED',
]);
const TASK_HEADING =
  /^###\s+(?:\[[ x~]\]|✅|🟡|❌)\s+(?<id>[A-Z][A-Z0-9]*(?:-[A-Z0-9]+)+-\d{3})\b/gmu;

function equalArray(left, right) {
  return left.length === right.length
    && left.every((value, index) => value === right[index]);
}

function allTaskRefs(lane) {
  return [
    ...(lane.required_task_artifacts ?? []).flatMap(
      (artifact) => artifact.task_refs ?? [],
    ),
    ...(lane.conditional_artifacts ?? []).flatMap(
      (artifact) => artifact.task_refs ?? [],
    ),
    ...(lane.package_definition_tasks ?? []),
    lane.package_gate,
    ...(lane.execution_cycle ?? []),
    lane.completion_task,
  ].filter(Boolean);
}

export function validatePriorityDeliveryLaneData({
  data,
  taskIds,
  documents,
  activeSequenceSource = '',
}) {
  const errors = [];

  if (data?.schema_version !== 1) {
    errors.push('schema_version debe ser 1.');
  }
  if (data?.canonical_sequence_unchanged !== true) {
    errors.push('canonical_sequence_unchanged debe permanecer en true.');
  }
  if (data?.global_task_partial_approval_forbidden !== true) {
    errors.push('global_task_partial_approval_forbidden debe permanecer en true.');
  }
  if (!Array.isArray(data?.lanes) || data.lanes.length === 0) {
    errors.push('debe existir al menos un carril prioritario.');
  }

  const laneIds = new Set();
  for (const lane of data?.lanes ?? []) {
    if (!lane.lane_id || laneIds.has(lane.lane_id)) {
      errors.push(`lane_id ausente o duplicado: ${lane.lane_id ?? '(vacío)'}.`);
      continue;
    }
    laneIds.add(lane.lane_id);

    if (taskIds.has(lane.lane_id)) {
      errors.push(`${lane.lane_id} no puede materializarse como tarea canónica.`);
    }
    if (!ALLOWED_STATUSES.has(lane.status)) {
      errors.push(`${lane.lane_id}: estado no permitido ${lane.status}.`);
    }
    if (lane.supabase_repository !== 'vento-shell') {
      errors.push(`${lane.lane_id}: Supabase deberá permanecer en vento-shell.`);
    }
    if (lane.package_gate !== 'E5-GATE-008') {
      errors.push(`${lane.lane_id}: package_gate debe ser E5-GATE-008.`);
    }
    if (!equalArray(lane.execution_cycle ?? [], EXPECTED_CYCLE)) {
      errors.push(`${lane.lane_id}: ciclo SHELL-CI-020 a SHELL-CI-024 incompleto o desordenado.`);
    }
    if (lane.completion_task !== 'SHELL-CI-024') {
      errors.push(`${lane.lane_id}: completion_task debe ser SHELL-CI-024.`);
    }
    if (!equalArray(lane.package_definition_tasks ?? [], EXPECTED_PACKAGE_TASKS)) {
      errors.push(`${lane.lane_id}: debe conservar DELIV-PKG-001 a DELIV-PKG-025.`);
    }
    if (!Array.isArray(lane.excluded_from_closure)
      || lane.excluded_from_closure.length === 0) {
      errors.push(`${lane.lane_id}: debe declarar exclusiones de cierre.`);
    }
    if (!Array.isArray(lane.invariants) || lane.invariants.length < 8) {
      errors.push(`${lane.lane_id}: debe conservar al menos ocho invariantes.`);
    }

    const unknownTasks = [...new Set(allTaskRefs(lane))]
      .filter((taskId) => !taskIds.has(taskId));
    if (unknownTasks.length) {
      errors.push(
        `${lane.lane_id}: tareas inexistentes: ${unknownTasks.join(', ')}.`,
      );
    }
  }

  const requiredFragments = {
    order: [
      '<!-- PRIORITY-DELIVERY-LANES:START -->',
      'NEXO-REMISSIONS-001',
      'canonical_sequence_unchanged = true',
    ],
    protocol: [
      '<!-- PRIORITY-PACKAGE-PROTOCOL:START -->',
      'global_task_partial_approval_forbidden',
      'E5-GATE-008::<package_id>',
    ],
    principles: [
      'Aplicación incremental sin aprobación parcial',
      'NEXO-REMISSIONS-001',
    ],
    gate: [
      'Instancia de puerta por paquete',
      'E5-GATE-008::<package_id>',
    ],
    delivery: [
      'SHELL-CI-020::<package_id>',
      'SHELL-CI-024::<package_id>',
      'no modifica el estado de la tarea canónica',
    ],
    nexo: [
      'Primer paquete vertical designado',
      'NEXO-REMISSIONS-001',
      'no es una tarea nueva',
    ],
  };

  for (const [documentId, fragments] of Object.entries(requiredFragments)) {
    const source = documents[documentId] ?? '';
    for (const fragment of fragments) {
      if (!source.includes(fragment)) {
        errors.push(`${documentId}: falta el contrato "${fragment}".`);
      }
    }
  }

  for (const laneId of laneIds) {
    if (activeSequenceSource.includes(laneId)) {
      errors.push(`${laneId}: un carril no puede reemplazar active-sequence.json.`);
    }
  }

  if (errors.length) {
    throw new Error(errors.join('\n- '));
  }

  return {
    lanes: laneIds.size,
    designated: (data.lanes ?? []).filter(
      (lane) => lane.status === 'DESIGNATED_NOT_READY',
    ).length,
    referencedTasks: new Set(
      (data.lanes ?? []).flatMap((lane) => allTaskRefs(lane)),
    ).size,
  };
}

function readTaskIds(blocksRoot) {
  const taskIds = new Set();
  const pending = [blocksRoot];

  while (pending.length) {
    const current = pending.pop();
    for (const entry of fs.readdirSync(current, { withFileTypes: true })) {
      const fullPath = path.join(current, entry.name);
      if (entry.isDirectory()) {
        pending.push(fullPath);
      } else if (entry.isFile() && entry.name.endsWith('.md')) {
        const source = fs.readFileSync(fullPath, 'utf8');
        for (const match of source.matchAll(TASK_HEADING)) {
          taskIds.add(match.groups.id);
        }
      }
    }
  }

  return taskIds;
}

export function validatePriorityDeliveryLanes({ root = process.cwd() } = {}) {
  const modularRoot = path.join(root, 'docs', 'plan-canonico', 'modular');
  const read = (relativePath) =>
    fs.readFileSync(path.join(modularRoot, relativePath), 'utf8');

  return validatePriorityDeliveryLaneData({
    data: JSON.parse(read('priority-delivery-lanes.json')),
    taskIds: readTaskIds(path.join(modularRoot, 'bloques')),
    activeSequenceSource: read('active-sequence.json'),
    documents: {
      order: read('90_ORDEN_DE_IMPLEMENTACION.md'),
      protocol: read('01_PROTOCOLO.md'),
      principles: read(
        'bloques/E5_PLANIFICACION_DE_IMPLEMENTACION/01_PRINCIPIOS_OBLIGATORIOS.md',
      ),
      gate: read(
        'bloques/E5_PLANIFICACION_DE_IMPLEMENTACION/06_PUERTA_DE_SALIDA_DE_E5.md',
      ),
      delivery: read(
        'bloques/T_CALIDAD_Y_DESPLIEGUE/04_DESPLIEGUE_PILOTO_Y_ESTABILIZACION.md',
      ),
      nexo: read('bloques/K_NEXO/00_INTRO.md'),
    },
  });
}

const isCli =
  process.argv[1]
  && path.resolve(process.argv[1]) === fileURLToPath(import.meta.url);

if (isCli) {
  try {
    const stats = validatePriorityDeliveryLanes();
    console.log(
      `OK: carriles prioritarios; ${stats.lanes} registrado(s); `
      + `${stats.designated} designado(s) no listo(s); `
      + `${stats.referencedTasks} tareas referenciadas.`,
    );
  } catch (error) {
    console.error(
      `ERROR: carriles prioritarios inválidos:\n- ${
        error instanceof Error ? error.message : String(error)
      }`,
    );
    process.exit(1);
  }
}
