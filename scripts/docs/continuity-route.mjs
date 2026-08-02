import fs from 'node:fs';
import path from 'node:path';

const TASK_ID_REGEX = /^(?<prefix>[A-Z][A-Z0-9]*(?:-[A-Z0-9]+)+)-(?<number>\d{3})$/u;

function fail(message) {
  throw new Error(message);
}

function parseTaskId(id) {
  const match = String(id ?? '').match(TASK_ID_REGEX);
  if (!match) fail(`identificador de tarea inválido en continuity-route.json: ${id ?? 'VACÍO'}.`);
  return {
    id,
    prefix: match.groups.prefix,
    number: Number(match.groups.number),
  };
}

function resolveSelector(selector, taskMap) {
  if (typeof selector?.prefix === 'string') {
    const tasks = [...taskMap.values()]
      .filter((task) => task.id.startsWith(`${selector.prefix}-`))
      .filter((task) => parseTaskId(task.id).prefix === selector.prefix)
      .sort((left, right) => parseTaskId(left.id).number - parseTaskId(right.id).number);
    if (tasks.length === 0) {
      fail(`continuity-route.json no encontró tareas para el prefijo ${selector.prefix}.`);
    }
    return tasks;
  }

  if (Array.isArray(selector?.task_ids) && selector.task_ids.length > 0) {
    return selector.task_ids.map((id) => {
      parseTaskId(id);
      const task = taskMap.get(id);
      if (!task) fail(`continuity-route.json referencia una tarea inexistente: ${id}.`);
      return task;
    });
  }

  fail('continuity-route.json contiene un selector inválido. Use prefix o task_ids.');
}

function resolveStage(stage, taskMap) {
  if (typeof stage?.sequence_id !== 'string' || !stage.sequence_id) {
    fail('continuity-route.json contiene una etapa sin sequence_id.');
  }
  if (typeof stage.block_code !== 'string' || typeof stage.block_title !== 'string') {
    fail(`${stage.sequence_id}: debe declarar block_code y block_title.`);
  }
  if (!Array.isArray(stage.selectors) || stage.selectors.length === 0) {
    fail(`${stage.sequence_id}: debe declarar al menos un selector.`);
  }

  const tasks = stage.selectors.flatMap((selector) => resolveSelector(selector, taskMap));
  const ids = tasks.map((task) => task.id);
  if (new Set(ids).size !== ids.length) {
    fail(`${stage.sequence_id}: sus selectores producen tareas duplicadas.`);
  }
  return { ...stage, tasks };
}

function tasksToSegments(tasks) {
  const segments = [];
  for (const task of tasks) {
    const { prefix, number } = parseTaskId(task.id);
    const previous = segments.at(-1);
    if (previous?.prefix === prefix && previous.to + 1 === number) {
      previous.to = number;
    } else {
      segments.push({ prefix, from: number, to: number });
    }
  }
  return segments;
}

export function resolveContinuityRoute(route, taskMap) {
  if (route?.schema_version !== 1) {
    fail('continuity-route.json utiliza una versión no soportada.');
  }
  if (typeof route.route_id !== 'string' || !route.route_id) {
    fail('continuity-route.json no define route_id.');
  }
  if (!Array.isArray(route.stages) || route.stages.length === 0) {
    fail('continuity-route.json no contiene etapas.');
  }
  if (!taskMap.has(route.entry_task_id)) {
    fail(`continuity-route.json declara una tarea de entrada inexistente: ${route.entry_task_id}.`);
  }

  const stages = route.stages.map((stage) => resolveStage(stage, taskMap));
  const sequenceIds = stages.map((stage) => stage.sequence_id);
  if (new Set(sequenceIds).size !== sequenceIds.length) {
    fail('continuity-route.json contiene sequence_id duplicados.');
  }
  const routedTaskIds = stages.flatMap((stage) => stage.tasks.map((task) => task.id));
  if (new Set(routedTaskIds).size !== routedTaskIds.length) {
    fail('continuity-route.json asigna una tarea a más de una etapa.');
  }

  let activeIndex = stages.findIndex(
    (stage) => stage.tasks.some((task) => task.state !== 'APROBADA'),
  );
  if (activeIndex < 0) activeIndex = stages.length - 1;

  const active = stages[activeIndex];
  const previousTaskId = activeIndex === 0
    ? route.entry_task_id
    : stages[activeIndex - 1].tasks.at(-1).id;
  const handoff = stages[activeIndex + 1] ?? null;

  return {
    schema_version: 1,
    generated_from: 'continuity-route.json',
    route_id: route.route_id,
    sequence_id: active.sequence_id,
    block_code: active.block_code,
    block_title: active.block_title,
    previous_task_id: previousTaskId,
    latest_treq_task_id: route.latest_treq_task_id,
    handoff_task_id: handoff?.tasks[0].id ?? null,
    handoff_sequence_id: handoff?.sequence_id ?? null,
    segments: tasksToSegments(active.tasks),
  };
}

export function readAndResolveContinuityRoute(baseDir, taskMap) {
  const routePath = path.join(baseDir, 'continuity-route.json');
  if (!fs.existsSync(routePath)) fail('no existe continuity-route.json.');
  const route = JSON.parse(fs.readFileSync(routePath, 'utf8'));
  return resolveContinuityRoute(route, taskMap);
}

export function serializeActiveSequence(config) {
  return `${JSON.stringify(config, null, 2)}\n`;
}
