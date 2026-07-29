import fs from 'node:fs';
import path from 'node:path';
import { fileURLToPath } from 'node:url';
import {
  syncPriorityLaneOrderDocument,
} from './sync-priority-delivery-lanes-doc.mjs';

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
const range = (prefix, from, to) =>
  Array.from(
    { length: to - from + 1 },
    (_, index) => `${prefix}-${String(from + index).padStart(3, '0')}`,
  );
const EXPECTED_REQUIRED_GROUPS = new Map([
  ['EVENT_CONTRACTS', range('INT-APP', 1, 10)],
  ['SUPABASE_AUDIT', range('SUPA-AUD', 1, 24)],
  ['SUPABASE_ARCHITECTURE', range('SUPA-ARC', 1, 25)],
  ['SUPABASE_TRANSITION', range('SUPA-TRANS', 1, 16)],
  ['H_SHARED_AUDIT', range('SHELL-AUD', 1, 11)],
  ['H_SHARED_DISTRIBUTION', range('SHELL-PKG', 1, 8)],
  ['H_SHARED_CONTRACTS', range('SHELL-CON', 1, 24)],
  ['TRANSVERSE_SERVICE_CATALOG', range('TSVC-CAT', 1, 10)],
  ['CI_FOUNDATION', range('SHELL-CI', 1, 19)],
  ['AUTH_UI_CONTRACT', range('AUTH-UI', 30, 39)],
  ['H_AUTH_CONTEXT_BASE', ['SHELL-AUTH-001', 'SHELL-CTX-001']],
  ['R0_DATABASE_SAFETY', [
    'AUTH-DB-015',
    ...range('AUTH-DB', 27, 29),
    ...range('AUTH-DB', 1, 5),
  ]],
  ['R1_AUTH_PHYSICAL_CORE', [
    'AUTH-DB-016',
    'AUTH-DB-018',
    'AUTH-DB-017',
    'AUTH-DB-019',
    'AUTH-DB-033',
    'AUTH-DB-035',
    'AUTH-DB-034',
    'AUTH-DB-032',
    ...range('AUTH-DB', 12, 14),
  ]],
  ['H_AUTH_CONTEXT_CONVERGENCE', [
    ...range('SHELL-CTX', 2, 6),
    ...range('SHELL-AUTH', 2, 4),
  ]],
  ['R2_NEXO_DATABASE_PACKAGE', [
    'AUTH-DB-020',
    ...range('AUTH-DB', 6, 10),
    'AUTH-DB-021',
    'AUTH-DB-011',
    ...range('AUTH-DB', 22, 26),
  ]],
  ['H_SHARED_REMAINING', [
    ...range('SHELL-NORM', 1, 9),
    ...range('SHELL-DB', 1, 5),
    ...range('SHELL-UI', 1, 20),
    ...range('SHELL-NATIVE', 1, 3),
  ]],
  ['H_FINAL_AUTH_ADOPTION', ['SHELL-AUTH-005']],
  ['AUTH_UI_ENFORCEMENT', range('AUTH-UI', 40, 51)],
  ['SERVER_ACTIONS_COMPLETE', range('AUTH-SRV', 1, 18)],
  ['SHARED_DEVICES_NEXO', range('AUTH-DEV', 1, 14)],
  ['STRICT_SIMULATION', range('AUTH-SIM', 1, 14)],
  ['AUTHORIZATION_ERRORS', range('AUTH-ERR', 1, 20)],
  ['NEXO_FUNCTIONAL_UX', range('NEXO-UX', 1, 25)],
  ['NEXO_AUTHORIZATION', range('NEXO-AUTH', 1, 20)],
  ['NEXO_UI_VALIDATION', range('AUTH-UI', 52, 60)],
]);
const EXPECTED_CONDITIONAL_GROUP_IDS = [
  'PRODUCTION_CONDITIONAL',
  'PRINTING_CONDITIONAL',
  'EVIDENCE_CONDITIONAL',
  'QUEUE_CONDITIONAL',
  'NOTIFICATIONS_CONDITIONAL',
  'PHYSICAL_NORMALIZATION_CONDITIONAL',
  'EXTERNAL_INTEGRATION_CONDITIONAL',
  'TECHNOLOGY_SUPPORT_CONDITIONAL',
  'INFORMATION_GOVERNANCE_CONDITIONAL',
  'MASTER_DATA_ANALYTICS_CONDITIONAL',
  'CONTINUITY_CONDITIONAL',
];
const EXPECTED_CONDITIONAL_GROUPS = new Map([
  ['PRODUCTION_CONDITIONAL', ['INT-PROD-005', 'NEXO-AUTH-007']],
  ['PRINTING_CONDITIONAL', [
    ...range('PRINT-ARC', 1, 20),
  ]],
  ['EVIDENCE_CONDITIONAL', range('EVID-ARC', 1, 10)],
  ['QUEUE_CONDITIONAL', range('QUEUE-ARC', 1, 12)],
  ['NOTIFICATIONS_CONDITIONAL', range('NOTIFY-ARC', 1, 10)],
  ['PHYSICAL_NORMALIZATION_CONDITIONAL', range('DATA-NORM-DB', 1, 10)],
  ['EXTERNAL_INTEGRATION_CONDITIONAL', range('INT-DB', 1, 8)],
  ['TECHNOLOGY_SUPPORT_CONDITIONAL', [
    ...range('TI-DOM', 1, 13),
    ...range('TI-AUTH', 1, 4),
    ...range('TI-UX', 1, 6),
    ...range('TI-INT', 1, 3),
  ]],
  ['INFORMATION_GOVERNANCE_CONDITIONAL', [
    ...range('INFO-DOM', 1, 13),
    ...range('INFO-AUTH', 1, 4),
    ...range('INFO-UX', 1, 6),
    ...range('INFO-INT', 1, 3),
  ]],
  ['MASTER_DATA_ANALYTICS_CONDITIONAL', [
    ...range('DATA-DOM', 1, 17),
    ...range('DATA-AUTH', 1, 4),
    ...range('DATA-UX', 1, 8),
    ...range('DATA-INT', 1, 4),
  ]],
  ['CONTINUITY_CONDITIONAL', [
    ...range('CONT-DOM', 1, 15),
    ...range('CONT-AUTH', 1, 4),
    ...range('CONT-UX', 1, 7),
    ...range('CONT-INT', 1, 4),
  ]],
]);
const EXPECTED_POST_PACKAGE_GROUPS = new Map([
  ['E5_READINESS_PLAN', range('READY-GATE', 1, 15)],
  ['E5_CUTOVER_PLAN', range('CUTOVER-OPS', 1, 10)],
  ['E5_HYPERCARE_PLAN', range('HYPERCARE-OPS', 1, 10)],
  ['E5_ENTRY_GATES', range('E5-GATE', 1, 7)],
]);
const EXPECTED_POST_IMPLEMENTATION_GROUPS = new Map([
  ['U_AUTHORIZATION_CERTIFICATION', range('AUTH-QA', 1, 30)],
  ['U_NEXO_EXPERIENCE_CERTIFICATION', [
    ...range('UX-QA', 1, 20),
    'UX-QA-024',
  ]],
]);
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

function expandTaskRanges(taskRanges = []) {
  return taskRanges.flatMap(({ prefix, from, to }) => {
    if (!prefix || !Number.isInteger(from) || !Number.isInteger(to) || to < from) {
      return [];
    }
    return range(prefix, from, to);
  });
}

function artifactTaskRefs(artifact) {
  return [
    ...(artifact.task_refs ?? []),
    ...expandTaskRanges(artifact.task_ranges),
  ];
}

function allTaskRefs(lane) {
  return [
    ...(lane.required_task_artifacts ?? []).flatMap(
      artifactTaskRefs,
    ),
    ...(lane.conditional_artifacts ?? []).flatMap(
      artifactTaskRefs,
    ),
    ...(lane.post_package_artifacts ?? []).flatMap(artifactTaskRefs),
    ...(lane.post_implementation_artifacts ?? []).flatMap(artifactTaskRefs),
    ...(lane.deferred_but_preserved ?? []).flatMap(artifactTaskRefs),
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
  const routePolicy = data?.implementation_route_policy;
  if (routePolicy?.default_route !== 'NORMAL_CANONICAL_FLOW') {
    errors.push('la ruta por defecto debe ser NORMAL_CANONICAL_FLOW.');
  }
  if (routePolicy?.normal_route_source !== 'active-sequence.json') {
    errors.push('el flujo normal debe derivarse de active-sequence.json.');
  }
  if (routePolicy?.priority_route_id !== 'NEXO-REMISSIONS-001') {
    errors.push('la ruta prioritaria debe ser NEXO-REMISSIONS-001.');
  }
  if (routePolicy?.canonical_documentation_continues !== true
    || routePolicy?.final_plan_scope_unchanged !== true) {
    errors.push('la ruta prioritaria debe conservar continuidad y alcance final.');
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

    const requiredGroupIds = (lane.required_task_artifacts ?? [])
      .map((artifact) => artifact.artifact_group_id);
    const conditionalGroupIds = (lane.conditional_artifacts ?? [])
      .map((artifact) => artifact.artifact_group_id);
    const postPackageGroupIds = (lane.post_package_artifacts ?? [])
      .map((artifact) => artifact.artifact_group_id);
    const postImplementationGroupIds =
      (lane.post_implementation_artifacts ?? [])
        .map((artifact) => artifact.artifact_group_id);
    const allGroupIds = [
      ...requiredGroupIds,
      ...conditionalGroupIds,
      ...postPackageGroupIds,
      ...postImplementationGroupIds,
    ];
    if (allGroupIds.some((groupId) => !groupId)
      || new Set(allGroupIds).size !== allGroupIds.length) {
      errors.push(`${lane.lane_id}: artifact_group_id ausente o duplicado.`);
    }

    const stages = lane.ordered_execution_stages ?? [];
    const expectedStageSources = [
      ...requiredGroupIds.map((groupId) => `required_task_artifacts.${groupId}`),
      'conditional_artifacts',
      'package_definition_tasks',
      ...postPackageGroupIds.map(
        (groupId) => `post_package_artifacts.${groupId}`,
      ),
      'package_gate',
      `execution_cycle.${EXPECTED_CYCLE[0]}`,
      ...postImplementationGroupIds.map(
        (groupId) => `post_implementation_artifacts.${groupId}`,
      ),
      ...EXPECTED_CYCLE.slice(1).map(
        (taskId) => `execution_cycle.${taskId}`,
      ),
    ];
    const stageOrders = stages.map((stage) => stage.order);
    const expectedOrders = expectedStageSources.map((_, index) => index + 1);
    if (!equalArray(stageOrders, expectedOrders)) {
      errors.push(
        `${lane.lane_id}: las etapas deben estar numeradas de 1 a ${expectedOrders.length}.`,
      );
    }
    if (!equalArray(
      stages.map((stage) => stage.task_source),
      expectedStageSources,
    )) {
      errors.push(`${lane.lane_id}: el orden ejecutable está incompleto o desordenado.`);
    }
    const stagedRequiredGroups = stages
      .map((stage) => stage.task_source)
      .filter((source) => source?.startsWith('required_task_artifacts.'))
      .map((source) => source.slice('required_task_artifacts.'.length));
    if (!equalArray(stagedRequiredGroups, requiredGroupIds)) {
      errors.push(`${lane.lane_id}: los grupos obligatorios no coinciden con sus etapas.`);
    }
    if (stages.some((stage) => !stage.stage_id || !stage.rule)) {
      errors.push(`${lane.lane_id}: cada etapa debe declarar stage_id y rule.`);
    }

    if (lane.lane_id === 'NEXO-REMISSIONS-001') {
      if (!equalArray(requiredGroupIds, [...EXPECTED_REQUIRED_GROUPS.keys()])) {
        errors.push(
          `${lane.lane_id}: faltan grupos obligatorios o están fuera del orden auditado.`,
        );
      }
      for (const [groupId, expectedTasks] of EXPECTED_REQUIRED_GROUPS) {
        const artifact = (lane.required_task_artifacts ?? [])
          .find(({ artifact_group_id: candidate }) => candidate === groupId);
        const actualTasks = artifact ? artifactTaskRefs(artifact) : [];
        if (!equalArray(actualTasks, expectedTasks)) {
          errors.push(
            `${lane.lane_id}: ${groupId} omite tareas o altera su orden.`,
          );
        }
      }
      if (!equalArray(conditionalGroupIds, EXPECTED_CONDITIONAL_GROUP_IDS)) {
        errors.push(
          `${lane.lane_id}: faltan grupos condicionales o están fuera del orden auditado.`,
        );
      }
      for (const [groupId, expectedTasks] of EXPECTED_CONDITIONAL_GROUPS) {
        const artifact = (lane.conditional_artifacts ?? [])
          .find(({ artifact_group_id: candidate }) => candidate === groupId);
        const actualTasks = artifact ? artifactTaskRefs(artifact) : [];
        if (!equalArray(actualTasks, expectedTasks)) {
          errors.push(
            `${lane.lane_id}: ${groupId} omite tareas o altera su orden.`,
          );
        }
      }
      if (!equalArray(
        postPackageGroupIds,
        [...EXPECTED_POST_PACKAGE_GROUPS.keys()],
      )) {
        errors.push(
          `${lane.lane_id}: faltan planes o gates E5 posteriores al paquete.`,
        );
      }
      for (const [groupId, expectedTasks] of EXPECTED_POST_PACKAGE_GROUPS) {
        const artifact = (lane.post_package_artifacts ?? [])
          .find(({ artifact_group_id: candidate }) => candidate === groupId);
        const actualTasks = artifact ? artifactTaskRefs(artifact) : [];
        if (!equalArray(actualTasks, expectedTasks)) {
          errors.push(
            `${lane.lane_id}: ${groupId} omite tareas o altera su orden.`,
          );
        }
      }
      if (!equalArray(
        postImplementationGroupIds,
        [...EXPECTED_POST_IMPLEMENTATION_GROUPS.keys()],
      )) {
        errors.push(
          `${lane.lane_id}: faltan certificaciones posteriores a la implementación.`,
        );
      }
      for (
        const [groupId, expectedTasks]
        of EXPECTED_POST_IMPLEMENTATION_GROUPS
      ) {
        const artifact = (lane.post_implementation_artifacts ?? [])
          .find(({ artifact_group_id: candidate }) => candidate === groupId);
        const actualTasks = artifact ? artifactTaskRefs(artifact) : [];
        if (!equalArray(actualTasks, expectedTasks)) {
          errors.push(
            `${lane.lane_id}: ${groupId} omite tareas o altera su orden.`,
          );
        }
      }
      const deferred = new Set(
        (lane.deferred_but_preserved ?? []).flatMap(artifactTaskRefs),
      );
      for (const taskId of [
        'AUTH-DB-030',
        'AUTH-DB-031',
        'AUTH-DEV-015',
        'AUTH-DEV-016',
        ...range('NEXO-DOM', 1, 38),
        ...range('NEXO-AUTH', 21, 32),
        ...range('NEXO-UX', 26, 48),
      ]) {
        if (!deferred.has(taskId)) {
          errors.push(`${lane.lane_id}: ${taskId} debe quedar preservada como posterior.`);
        }
      }
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
      '¿LA PRIORIDAD DE IMPLEMENTACIÓN ACTIVA ES REMISIONES NEXO?',
      'Orden ejecutable de NEXO-REMISSIONS-001',
      'desde la etapa 1 hasta la 39',
      'H_SHARED_AUDIT',
      'E5_READINESS_PLAN',
      'U_AUTHORIZATION_CERTIFICATION',
      'SHELL-CI-024::NEXO-REMISSIONS-001',
    ],
    protocol: [
      '<!-- PRIORITY-PACKAGE-PROTOCOL:START -->',
      'global_task_partial_approval_forbidden',
      'E5-GATE-008::<package_id>',
      'NORMAL_CANONICAL_FLOW',
      'ordered_execution_stages',
      'deberá completar todo BLOQUE H',
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
  syncPriorityLaneOrderDocument({ root, check: true });
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
