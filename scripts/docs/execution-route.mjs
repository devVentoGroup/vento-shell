import fs from 'node:fs';
import path from 'node:path';

import {
  readAndResolveContinuityRoute,
} from './continuity-route.mjs';

const ALLOWED_STATES = new Set([
  'APROBADA',
  'PROPUESTA PARA APROBACIÓN',
  'NO INICIADA',
  'RECHAZADA',
]);

function fail(message) {
  throw new Error(message);
}

function readJson(filePath, label) {
  if (!fs.existsSync(filePath)) fail(`no existe ${label}.`);
  return JSON.parse(fs.readFileSync(filePath, 'utf8'));
}

function range(prefix, from, to) {
  return Array.from(
    { length: to - from + 1 },
    (_, index) => `${prefix}-${String(from + index).padStart(3, '0')}`,
  );
}

function artifactTaskIds(artifact, taskMap) {
  return [
    ...(artifact?.task_refs ?? []),
    ...(artifact?.task_ranges ?? []).flatMap(({ prefix, from, to }) =>
      range(prefix, from, to)),
    ...(artifact?.task_family_refs ?? []).flatMap((prefix) =>
      [...taskMap.keys()]
        .filter((id) => id.startsWith(`${prefix}-`))
        .sort((left, right) => left.localeCompare(right, 'en'))),
  ];
}

function stateMarker(state) {
  if (state === 'APROBADA') return '✅';
  if (state === 'PROPUESTA PARA APROBACIÓN') return '🟡';
  if (state === 'RECHAZADA') return '❌';
  return '[ ]';
}

function virtualTask(id, title, state) {
  if (!ALLOWED_STATES.has(state)) fail(`${id}: estado de instancia inválido ${state}.`);
  return {
    id,
    title,
    state,
    marker: stateMarker(state),
    relativePath: 'priority-route-progress.json',
    virtual: true,
  };
}

function canonicalTasks(ids, taskMap, label) {
  return ids.map((id) => {
    const task = taskMap.get(id);
    if (!task) fail(`${label}: referencia una tarea inexistente: ${id}.`);
    return task;
  });
}

function artifactMap(lane, collection) {
  return new Map(
    (lane[collection] ?? []).map((artifact) => [artifact.artifact_group_id, artifact]),
  );
}

function instanceTasks(baseIds, lane, progress, taskMap) {
  return canonicalTasks(baseIds, taskMap, lane.lane_id).map((base) => {
    const id = `${base.id}::${lane.lane_id}`;
    const state = progress.instance_states?.[id] ?? 'NO INICIADA';
    return virtualTask(id, `${base.title} [${lane.lane_id}]`, state);
  });
}

function controlTask(stage, lane, progress) {
  const scope = progress.conditional_scopes?.[stage.stage_id];
  if (!scope) fail(`${lane.lane_id}: falta el control ${stage.stage_id} en priority-route-progress.json.`);
  return virtualTask(
    `${lane.lane_id}::${stage.stage_id}`,
    `Resolver y aprobar ${stage.stage_id}`,
    scope.decision_state,
  );
}

function validateConditionalClassification(scope, artifacts, label) {
  if (scope.decision_state !== 'APROBADA') return;
  const expected = artifacts.map((artifact) => artifact.artifact_group_id);
  const classified = [
    ...(scope.applicable_groups ?? []),
    ...(scope.not_applicable_groups ?? []),
  ];
  if (new Set(classified).size !== classified.length) {
    fail(`${label}: un grupo condicional aparece más de una vez.`);
  }
  const missing = expected.filter((id) => !classified.includes(id));
  const unknown = classified.filter((id) => !expected.includes(id));
  if (missing.length || unknown.length) {
    fail(
      `${label}: clasificación incompleta; faltan ${missing.join(', ') || 'NINGUNO'}; `
      + `desconocidos ${unknown.join(', ') || 'NINGUNO'}.`,
    );
  }
}

function priorityStageTasks(stage, lane, progress, taskMap) {
  const source = stage.task_source;
  const collectionSources = [
    'required_task_artifacts',
    'execution_prerequisite_artifacts',
    'implementation_artifacts',
  ];
  for (const collection of collectionSources) {
    const prefix = `${collection}.`;
    if (source.startsWith(prefix)) {
      const artifact = artifactMap(lane, collection).get(source.slice(prefix.length));
      if (!artifact) fail(`${lane.lane_id}: ${source} no existe.`);
      return canonicalTasks(artifactTaskIds(artifact, taskMap), taskMap, source);
    }
  }

  const instanceCollections = [
    'post_package_artifacts',
    'post_implementation_artifacts',
  ];
  for (const collection of instanceCollections) {
    const prefix = `${collection}.`;
    if (source.startsWith(prefix)) {
      const artifact = artifactMap(lane, collection).get(source.slice(prefix.length));
      if (!artifact) fail(`${lane.lane_id}: ${source} no existe.`);
      return instanceTasks(artifactTaskIds(artifact, taskMap), lane, progress, taskMap);
    }
  }

  if (source === 'package_definition_tasks') {
    return instanceTasks(lane.package_definition_tasks, lane, progress, taskMap);
  }
  if (source === 'package_gate') {
    return instanceTasks([lane.package_gate], lane, progress, taskMap);
  }
  if (source.startsWith('execution_cycle.')) {
    return instanceTasks([source.slice('execution_cycle.'.length)], lane, progress, taskMap);
  }
  if (source === 'conditional_artifacts') {
    const scope = progress.conditional_scopes.CONDITIONAL_DESIGN_ARTIFACTS;
    validateConditionalClassification(
      scope,
      lane.conditional_artifacts ?? [],
      'CONDITIONAL_DESIGN_ARTIFACTS',
    );
    const selected = (lane.conditional_artifacts ?? []).filter((artifact) =>
      (scope.applicable_groups ?? []).includes(artifact.artifact_group_id));
    return [
      controlTask(stage, lane, progress),
      ...canonicalTasks(
        selected.flatMap((artifact) => artifactTaskIds(artifact, taskMap)),
        taskMap,
        source,
      ),
    ];
  }
  if (source === 'conditional_implementation_scope') {
    const scope = progress.conditional_scopes.CONDITIONAL_IMPLEMENTATION_SCOPE;
    validateConditionalClassification(
      scope,
      lane.conditional_implementation_artifacts ?? [],
      'CONDITIONAL_IMPLEMENTATION_SCOPE',
    );
    return [controlTask(stage, lane, progress)];
  }
  if (source === 'conditional_implementation_artifacts') {
    const scope = progress.conditional_scopes.CONDITIONAL_IMPLEMENTATION_SCOPE;
    const selected = (lane.conditional_implementation_artifacts ?? []).filter((artifact) =>
      (scope.applicable_groups ?? []).includes(artifact.artifact_group_id));
    const controlState = progress.stage_controls?.[stage.stage_id];
    if (!controlState) {
      fail(`${lane.lane_id}: falta el control ${stage.stage_id} en priority-route-progress.json.`);
    }
    return [
      virtualTask(
        `${lane.lane_id}::${stage.stage_id}`,
        `Ejecutar y cerrar ${stage.stage_id}`,
        controlState,
      ),
      ...canonicalTasks(
        selected.flatMap((artifact) => artifactTaskIds(artifact, taskMap)),
        taskMap,
        source,
      ),
    ];
  }

  fail(`${lane.lane_id}: task_source no soportado: ${source}.`);
}

export function resolvePriorityRoute({ selector, lanes, progress, taskMap }) {
  if (progress?.schema_version !== 1 || progress.route_id !== selector.selected_route_id) {
    fail('priority-route-progress.json no corresponde a la ruta seleccionada.');
  }
  const lane = (lanes?.lanes ?? []).find(
    ({ lane_id: laneId }) => laneId === selector.selected_route_id,
  );
  if (!lane) fail(`no existe el carril seleccionado ${selector.selected_route_id}.`);

  const stages = lane.ordered_execution_stages.map((stage) => ({
    ...stage,
    tasks: priorityStageTasks(stage, lane, progress, taskMap),
  }));
  if (stages.some((stage) => stage.tasks.length === 0)) {
    const empty = stages.filter((stage) => stage.tasks.length === 0).map((stage) => stage.stage_id);
    fail(`${lane.lane_id}: etapas sin trabajo resoluble: ${empty.join(', ')}.`);
  }

  let activeIndex = stages.findIndex(
    (stage) => stage.tasks.some((task) => task.state !== 'APROBADA'),
  );
  const priorityRouteComplete = activeIndex < 0;
  if (priorityRouteComplete) activeIndex = stages.length - 1;
  const active = stages[activeIndex];
  const previousId = activeIndex === 0
    ? selector.priority_entry_task_id
    : stages[activeIndex - 1].tasks.at(-1).id;
  const handoff = stages[activeIndex + 1] ?? null;
  const relevantVirtualIds = new Set([
    previousId,
    ...active.tasks.map((task) => task.id),
    handoff?.tasks[0].id,
  ].filter(Boolean));
  const virtualTasks = stages
    .flatMap((stage) => stage.tasks)
    .filter((task) => task.virtual && relevantVirtualIds.has(task.id));

  return {
    schema_version: 2,
    generated_from: 'execution-route.json',
    route_id: lane.lane_id,
    sequence_id: `PRIORITY-${lane.lane_id}-STAGE-${String(active.order).padStart(3, '0')}`,
    block_code: `CARRIL ${lane.owner_application.toUpperCase()}`,
    block_title: `${lane.title} — etapa ${active.order}: ${active.stage_id}`,
    previous_task_id: previousId,
    latest_treq_task_id: 'SUPA-TRANS-006',
    handoff_task_id: handoff?.tasks[0].id ?? null,
    handoff_sequence_id: handoff
      ? `PRIORITY-${lane.lane_id}-STAGE-${String(handoff.order).padStart(3, '0')}`
      : null,
    task_ids: active.tasks.map((task) => task.id),
    virtual_tasks: virtualTasks,
    priority_stage: {
      order: active.order,
      stage_id: active.stage_id,
      total_stages: stages.length,
    },
    return_policy: selector.return_policy,
    priority_route_complete: priorityRouteComplete,
  };
}

export function applyPriorityReturnPolicy(selector, priorityConfig, normalConfig) {
  if (
    priorityConfig.priority_route_complete !== true
    || selector.return_policy !== 'RETURN_TO_NORMAL_AFTER_PRIORITY_CERTIFICATION'
  ) {
    const firstSegment = normalConfig.segments?.[0];
    return {
      ...priorityConfig,
      post_priority_route: {
        route_id: normalConfig.route_id,
        sequence_id: normalConfig.sequence_id,
        first_pending_task_id: firstSegment
          ? `${firstSegment.prefix}-${String(firstSegment.from).padStart(3, '0')}`
          : null,
        ...normalConfig.route_progress,
      },
    };
  }
  return {
    ...normalConfig,
    generated_from: 'execution-route.json',
    selected_route_id: selector.normal_route_id,
    resumed_after_priority_route_id: selector.selected_route_id,
    priority_route_complete: true,
  };
}

export function readAndResolveExecutionRoute(baseDir, taskMap) {
  const selector = readJson(path.join(baseDir, 'execution-route.json'), 'execution-route.json');
  if (selector.schema_version !== 1 || selector.selected_explicitly !== true) {
    fail('execution-route.json debe registrar una selección explícita válida.');
  }

  if (selector.selected_route_id === selector.normal_route_id) {
    return {
      ...readAndResolveContinuityRoute(baseDir, taskMap),
      generated_from: 'execution-route.json',
      selected_route_id: selector.selected_route_id,
    };
  }

  const priorityConfig = resolvePriorityRoute({
    selector,
    lanes: readJson(
      path.join(baseDir, 'priority-delivery-lanes.json'),
      'priority-delivery-lanes.json',
    ),
    progress: readJson(
      path.join(baseDir, 'priority-route-progress.json'),
      'priority-route-progress.json',
    ),
    taskMap,
  });
  return applyPriorityReturnPolicy(
    selector,
    priorityConfig,
    readAndResolveContinuityRoute(baseDir, taskMap),
  );
}
