import fs from 'node:fs';
import path from 'node:path';
import { fileURLToPath } from 'node:url';

import { readCanonicalTaskInventory } from './task-semantic-contract.mjs';

const TASK_ID = '[A-Z][A-Z0-9]*(?:-[A-Z0-9]+)+-\\d{3}';
const TASK_REFERENCE = new RegExp(`\\b${TASK_ID}(?!\\d)`, 'gu');
const RANGE_REFERENCE = new RegExp(
  `(?<from>${TASK_ID})\`?\\s+(?:a|hasta|\\.\\.)\\s+\`?(?<to>${TASK_ID})`,
  'giu',
);

function taskIdentity(id) {
  const match = id.match(/^(?<prefix>[A-Z][A-Z0-9]*(?:-[A-Z0-9]+)+)-(?<number>\d{3})$/u);
  if (!match) throw new Error(`identificador canónico inválido: ${id}.`);
  return { prefix: match.groups.prefix, number: Number(match.groups.number) };
}

function matchesSelector(task, selector) {
  if (Array.isArray(selector.task_ids)) return selector.task_ids.includes(task.id);
  if (typeof selector.prefix !== 'string') throw new Error('selector de topología inválido.');
  const identity = taskIdentity(task.id);
  return identity.prefix === selector.prefix
    && identity.number >= (selector.from ?? 1)
    && identity.number <= (selector.to ?? Number.MAX_SAFE_INTEGER);
}

function expandSelectors(tasks, selectors) {
  const selected = [];
  for (const selector of selectors) {
    for (const task of tasks) {
      if (matchesSelector(task, selector) && !selected.includes(task.id)) selected.push(task.id);
    }
  }
  return selected;
}

function stateFromMarker(marker) {
  if (marker === '[ ]') return 'NO INICIADA';
  if (marker === '[~]' || marker === '🟡') return 'PROPUESTA PARA APROBACIÓN';
  if (marker === '❌') return 'RECHAZADA';
  return 'APROBADA';
}

function inlineField(block, labels) {
  const pattern = new RegExp(`^\\*\\*(?:${labels.join('|')}):\\*\\*\\s*(?<value>.+?)\\s*$`, 'imu');
  return block.match(pattern)?.groups?.value?.trim() ?? null;
}

function listedField(block, labels) {
  const pattern = new RegExp(
    `^(?:${labels.join('|')}):[ \\t]*\\r?\\n[ \\t]*\\r?\\n(?<value>(?:[ \\t]*[-*][ \\t]+[^\\r\\n]+(?:\\r?\\n|$))+)`,
    'imu',
  );
  return block.match(pattern)?.groups?.value?.trim() ?? null;
}

function expandReferences(value, knownIds) {
  const references = new Set(String(value ?? '').match(TASK_REFERENCE) ?? []);
  for (const match of String(value ?? '').matchAll(RANGE_REFERENCE)) {
    const from = taskIdentity(match.groups.from);
    const to = taskIdentity(match.groups.to);
    if (from.prefix !== to.prefix || from.number > to.number) continue;
    for (let number = from.number; number <= to.number; number += 1) {
      const id = `${from.prefix}-${String(number).padStart(3, '0')}`;
      if (knownIds.has(id)) references.add(id);
    }
  }
  return [...references];
}

export function taskDependencies(task, knownIds) {
  const developmentLabels = [
    'Dependencias para desarrollar(?: el marcador global)?',
    'Dependencias de desarrollo',
  ];
  const executionLabels = [
    'Dependencias para ejecutar(?: cada instancia| una instancia)?',
    'Dependencias de ejecución',
  ];
  const developmentSource = inlineField(task.block, developmentLabels)
    ?? listedField(task.block, developmentLabels)
    ?? inlineField(task.block, ['Dependencias?']);
  const executionSource = inlineField(task.block, executionLabels)
    ?? listedField(task.block, executionLabels);
  return {
    developmentSource,
    development: expandReferences(developmentSource, knownIds).filter((id) => id !== task.id),
    executionSource,
    execution: expandReferences(executionSource, knownIds).filter((id) => id !== task.id),
  };
}

function orderedRouteTasks(tasks, route) {
  const byId = new Map(tasks.map((task) => [task.id, task]));
  const result = [];
  const stageByTask = new Map();
  for (const stage of route.stages) {
    for (const id of expandSelectors(tasks, stage.selectors)) {
      if (!byId.has(id)) throw new Error(`${stage.sequence_id} referencia la tarea inexistente ${id}.`);
      if (stageByTask.has(id)) throw new Error(`${id} aparece en más de una etapa de continuidad.`);
      stageByTask.set(id, stage.sequence_id);
      result.push(byId.get(id));
    }
  }
  const missing = tasks.filter((task) => !stageByTask.has(task.id));
  if (missing.length > 0) throw new Error(`tareas sin etapa de continuidad: ${missing.map(({ id }) => id).join(', ')}.`);
  return { ordered: result, stageByTask };
}

export function developmentDependencyOrderErrors(ordered, dependencies) {
  const errors = [];
  const position = new Map(ordered.map((task, index) => [task.id, index]));
  for (const task of ordered) {
    for (const dependency of dependencies.get(task.id)?.development ?? []) {
      if (!position.has(dependency)) errors.push(`${task.id} depende de la tarea desconocida ${dependency}.`);
      else if (position.get(dependency) >= position.get(task.id)) {
        errors.push(`${task.id} tiene una dependencia de desarrollo futura: ${dependency}.`);
      }
    }
  }
  return errors;
}

export function resolveTaskWorkTopology({ root = process.cwd() } = {}) {
  const baseDir = path.join(root, 'docs', 'plan-canonico', 'modular');
  const policy = JSON.parse(fs.readFileSync(path.join(baseDir, 'task-work-topology.json'), 'utf8'));
  const route = JSON.parse(fs.readFileSync(path.join(baseDir, 'continuity-route.json'), 'utf8'));
  const inventory = readCanonicalTaskInventory(root);
  const tasks = [...inventory.values()].filter((task) => route.stages.some((stage) => (
    stage.selectors.some((selector) => matchesSelector(task, selector))
  )));
  const errors = [];

  if (policy.schema_version !== 1) errors.push('schema_version debe ser 1.');
  if (policy.canonical_marker_semantics !== 'DEFINE_CONTRACT_ONCE') {
    errors.push('canonical_marker_semantics debe ser DEFINE_CONTRACT_ONCE.');
  }
  if (policy.coverage_policy !== 'ALL_CONTINUITY_TASKS_EXACTLY_ONCE') {
    errors.push('coverage_policy debe cubrir todas las tareas exactamente una vez.');
  }
  const modes = new Set(Object.keys(policy.mode_definitions ?? {}));
  const routeStageIds = route.stages.map(({ sequence_id }) => sequence_id);
  const defaults = new Map((policy.stage_defaults ?? []).map((item) => [item.sequence_id, item.mode]));
  const duplicateDefaults = (policy.stage_defaults ?? [])
    .filter((item, index, all) => all.findIndex(({ sequence_id }) => sequence_id === item.sequence_id) !== index);
  if (duplicateDefaults.length > 0) errors.push('stage_defaults contiene etapas duplicadas.');
  for (const stageId of routeStageIds) if (!defaults.has(stageId)) errors.push(`falta modo por defecto para ${stageId}.`);
  for (const stageId of defaults.keys()) if (!routeStageIds.includes(stageId)) errors.push(`modo para etapa inexistente ${stageId}.`);
  for (const [stageId, mode] of defaults) if (!modes.has(mode)) errors.push(`${stageId} usa el modo desconocido ${mode}.`);

  let ordered = [];
  let stageByTask = new Map();
  try {
    ({ ordered, stageByTask } = orderedRouteTasks(tasks, route));
  } catch (error) {
    errors.push(error instanceof Error ? error.message : String(error));
  }

  const overridesByTask = new Map();
  for (const override of policy.overrides ?? []) {
    if (!modes.has(override.mode)) errors.push(`override usa el modo desconocido ${override.mode}.`);
    const selected = expandSelectors(tasks, override.selectors ?? []);
    if (selected.length === 0) errors.push(`override ${override.mode} no selecciona tareas.`);
    for (const id of selected) {
      if (overridesByTask.has(id)) errors.push(`${id} recibe más de un override de topología.`);
      overridesByTask.set(id, override);
    }
  }

  const topology = new Map();
  for (const task of ordered) {
    const stageId = stageByTask.get(task.id);
    const override = overridesByTask.get(task.id);
    const mode = override?.mode ?? defaults.get(stageId);
    const definition = policy.mode_definitions?.[mode];
    if (!definition) continue;
    topology.set(task.id, {
      taskId: task.id,
      sequenceId: stageId,
      mode,
      label: definition.label,
      canonicalWork: override?.canonical_work ?? definition.canonical_work,
      executionDependencies: override?.execution_dependencies ?? definition.execution_dependencies,
      executionRule: override?.execution_rule ?? definition.execution_rule,
      instancePattern: override?.instance_pattern ?? definition.instance_pattern,
    });
  }
  if (topology.size !== ordered.length) errors.push(`topología incompleta: ${topology.size} de ${ordered.length} tareas.`);

  const position = new Map(ordered.map((task, index) => [task.id, index]));
  const knownIds = new Set(position.keys());
  const dependencies = new Map();
  for (const task of ordered) {
    const parsed = taskDependencies(task, knownIds);
    dependencies.set(task.id, parsed);
  }
  errors.push(...developmentDependencyOrderErrors(ordered, dependencies));

  const active = JSON.parse(fs.readFileSync(path.join(baseDir, 'active-sequence.json'), 'utf8'));
  const segment = active.segments?.[0];
  const currentId = segment ? `${segment.prefix}-${String(segment.from).padStart(3, '0')}` : null;
  if (currentId && dependencies.has(currentId)) {
    for (const dependency of dependencies.get(currentId).development) {
      const owner = inventory.get(dependency);
      if (owner && stateFromMarker(owner.marker) !== 'APROBADA') {
        errors.push(`${currentId} no puede ser actual: su dependencia de desarrollo ${dependency} no está aprobada.`);
      }
    }
  }

  if (errors.length > 0) throw new Error(`task-work-topology.json o su grafo son inválidos:\n- ${errors.join('\n- ')}`);
  const counts = {};
  for (const item of topology.values()) counts[item.mode] = (counts[item.mode] ?? 0) + 1;
  return { policy, route, inventory, ordered, topology, dependencies, counts, currentId };
}

function main() {
  const result = resolveTaskWorkTopology();
  console.log(
    `OK: topología de trabajo; ${result.topology.size} tareas; `
    + `${Object.entries(result.counts).map(([mode, count]) => `${mode}=${count}`).join('; ')}.`,
  );
}

const isCli = process.argv[1]
  && path.resolve(process.argv[1]) === path.resolve(fileURLToPath(import.meta.url));

if (isCli) {
  try {
    main();
  } catch (error) {
    console.error(`ERROR: ${error instanceof Error ? error.message : String(error)}`);
    process.exit(1);
  }
}
