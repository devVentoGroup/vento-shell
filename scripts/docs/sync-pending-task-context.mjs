import fs from 'node:fs';
import path from 'node:path';
import { fileURLToPath } from 'node:url';

const TASK_REGEX = /^###\s+(?<marker>\[[ x~]\]|[✅🟡❌])\s+(?<id>[A-Z][A-Z0-9]*(?:-[A-Z0-9]+)+-\d{3})\b(?:\s+[—-]\s+(?<title>[^\n]+))?$/gmu;
const OUTPUT = '.generated/REGISTRO_DE_TAREAS_PENDIENTES_CON_CONTEXTO.md';

function maskFencedCode(text) {
  let insideFence = false;
  return text.split('\n').map((line) => {
    if (/^\s*```/u.test(line)) {
      insideFence = !insideFence;
      return '';
    }
    return insideFence ? '' : line;
  }).join('\n');
}

function stateFromMarker(marker) {
  if (marker === '[ ]') return 'NO INICIADA';
  if (marker === '[~]' || marker === '🟡') return 'PROPUESTA PARA APROBACIÓN';
  if (marker === '❌') return 'RECHAZADA';
  return 'APROBADA';
}

function normalizeSubject(title) {
  return title.trim().replace(/[.!?]+$/u, '');
}

export function describePendingTask(title) {
  const subject = normalizeSubject(title || 'tarea sin título');
  const rules = [
    [/^Definir\s+/iu, (rest) => `Establecer reglas, alcance, datos, responsables, excepciones y criterios verificables para ${rest}.`],
    [/^Diseñar\s+/iu, (rest) => `Materializar la arquitectura, flujo, componentes, decisiones y límites necesarios para ${rest}.`],
    [/^Implementar\s+/iu, (rest) => `Construir, integrar y probar el cambio técnico necesario para ${rest}, incluyendo compatibilidad y rollback cuando aplique.`],
    [/^Crear\s+/iu, (rest) => `Producir el artefacto completo y verificable requerido para ${rest}, con sus relaciones y criterios de aceptación.`],
    [/^Validar\s+/iu, (rest) => `Comprobar con evidencia que ${rest} cumple los contratos, escenarios y criterios aprobados.`],
    [/^Probar\s+/iu, (rest) => `Ejecutar pruebas representativas sobre ${rest}, registrar resultados reales y clasificar los defectos encontrados.`],
    [/^Registrar\s+/iu, (rest) => `Consolidar de forma trazable la información, decisiones, responsables y evidencia de ${rest}.`],
    [/^Aprobar\s+/iu, (rest) => `Revisar evidencia y criterios de salida para autorizar formalmente ${rest} sin pendientes bloqueantes.`],
    [/^Auditar\s+/iu, (rest) => `Inspeccionar el estado real de ${rest}, identificar brechas y dejar decisiones verificables por cada hallazgo.`],
    [/^Inventariar\s+/iu, (rest) => `Identificar y reconciliar todas las instancias reales de ${rest}, sin faltantes, duplicados ni identidades ambiguas.`],
    [/^Clasificar\s+/iu, (rest) => `Asignar una decisión explícita y trazable a cada elemento de ${rest}, preservando identidades y excepciones.`],
    [/^Documentar\s+/iu, (rest) => `Consolidar la definición completa, fuentes, decisiones, límites y evidencia de ${rest}.`],
    [/^Resolver\s+/iu, (rest) => `Cerrar las decisiones y bloqueos necesarios para ${rest}, dejando una salida verificable y continuidad explícita.`],
  ];
  for (const [pattern, formatter] of rules) {
    const match = subject.match(pattern);
    if (match) return formatter(subject.slice(match[0].length));
  }
  return `Completar ${subject.toLowerCase()}, definiendo el resultado material, sus límites, responsables, evidencia y criterios de cierre.`;
}

function readCanonicalTasks(baseDir) {
  const manifest = JSON.parse(fs.readFileSync(path.join(baseDir, 'manifest.json'), 'utf8'));
  const tasks = [];
  for (const relativePath of manifest.files) {
    const fullPath = path.join(baseDir, relativePath);
    if (!fs.existsSync(fullPath) || !fs.statSync(fullPath).isFile()) continue;
    const source = maskFencedCode(fs.readFileSync(fullPath, 'utf8').replace(/\r\n?/gu, '\n'));
    for (const match of source.matchAll(TASK_REGEX)) {
      const state = stateFromMarker(match.groups?.marker ?? '');
      tasks.push({
        id: match.groups.id,
        title: (match.groups.title ?? '(sin título canónico)').trim(),
        state,
        relativePath,
      });
    }
  }
  const ids = tasks.map(({ id }) => id);
  if (new Set(ids).size !== ids.length) throw new Error('Existen tareas canónicas duplicadas.');
  return tasks;
}

function taskIdentity(id) {
  const match = id.match(/^(?<prefix>[A-Z][A-Z0-9]*(?:-[A-Z0-9]+)+)-(?<number>\d{3})$/u);
  if (!match) throw new Error(`Identificador canónico inválido: ${id}.`);
  return { prefix: match.groups.prefix, number: Number(match.groups.number) };
}

export function orderPendingTasksByRoute(tasks, route) {
  const byId = new Map(tasks.map((task) => [task.id, task]));
  const ordered = [];
  const seen = new Set();
  const canonicalOrderById = new Map();
  let canonicalOrder = 0;

  const expandStage = (stage) => {
    const stageTasks = [];
    for (const selector of stage.selectors) {
      let selected;
      if (typeof selector.prefix === 'string') {
        const from = selector.from ?? 1;
        const to = selector.to ?? Number.MAX_SAFE_INTEGER;
        selected = tasks
          .filter(({ id }) => taskIdentity(id).prefix === selector.prefix)
          .filter(({ id }) => {
            const { number } = taskIdentity(id);
            return number >= from && number <= to;
          })
          .sort((left, right) => taskIdentity(left.id).number - taskIdentity(right.id).number);
      } else if (Array.isArray(selector.task_ids)) {
        selected = selector.task_ids.map((id) => {
          const task = byId.get(id);
          if (!task) throw new Error(`La guía referencia una tarea inexistente: ${id}.`);
          return task;
        });
      } else {
        throw new Error(`Selector inválido en ${stage.sequence_id}.`);
      }
      stageTasks.push(...selected);
    }

    return stageTasks;
  };

  const expandedStages = route.stages.map((stage, stageIndex) => ({
    ...stage,
    stageOrder: stageIndex + 1,
    tasks: expandStage(stage),
  }));

  for (const stage of expandedStages) {
    for (const task of stage.tasks) {
      if (canonicalOrderById.has(task.id)) throw new Error(`La guía asigna dos veces ${task.id}.`);
      canonicalOrder += 1;
      canonicalOrderById.set(task.id, canonicalOrder);
    }
  }

  const executionStages = [
    ...expandedStages.filter((stage) => stage.activation_state !== 'DEFERRED'),
    ...expandedStages.filter((stage) => stage.activation_state === 'DEFERRED'),
  ];

  for (const stage of executionStages) {
    for (const task of stage.tasks) {
      if (seen.has(task.id)) throw new Error(`La guía asigna dos veces ${task.id}.`);
      seen.add(task.id);
      if (task.state === 'APROBADA') continue;
      ordered.push({
        ...task,
        canonicalOrder: canonicalOrderById.get(task.id),
        stageOrder: stage.stageOrder,
        sequenceId: stage.sequence_id,
        blockCode: stage.block_code,
        blockTitle: stage.block_title,
        activationState: stage.activation_state ?? 'ACTIVE',
      });
    }
  }

  const missing = tasks.filter(({ id }) => !seen.has(id));
  if (missing.length > 0) {
    throw new Error(`La guía no ubica tareas canónicas: ${missing.map(({ id }) => id).join(', ')}.`);
  }
  return ordered;
}

function render(tasks, route, active) {
  const activeTaskId = active.segments?.[0]
    ? `${active.segments[0].prefix}-${String(active.segments[0].from).padStart(3, '0')}`
    : 'NINGUNA';
  const stageIds = new Set();
  const stages = tasks.filter((task) => {
    if (stageIds.has(task.sequenceId)) return false;
    stageIds.add(task.sequenceId);
    return true;
  });
  const lines = [
    '# GUÍA MAESTRA DE EJECUCIÓN TAREA POR TAREA — VENTO OS',
    '',
    '> Archivo derivado. No editar manualmente.',
    '>',
    '> Esta guía ordena todas las tareas pendientes del flujo canónico integral. El contenido completo y los criterios específicos permanecen en el fragmento propietario enlazado por cada fila.',
    '>',
    '> Una fila no puede aprobarse solo por producir documentación: debe demostrar la cobertura y la evidencia exigidas por su naturaleza real.',
    '',
    '## Estado ejecutivo',
    '',
    `- **Ruta activa:** \`${active.route_id}\``,
    `- **Etapa actual:** \`${active.sequence_id}\` — ${active.block_title}`,
    `- **Tarea actual:** \`${activeTaskId}\``,
    `- **Siguiente etapa:** \`${active.handoff_sequence_id ?? 'NINGUNA'}\``,
    `- **Tareas pendientes ordenadas:** **${tasks.length}**`,
    `- **Tareas canónicas cubiertas por la ruta:** **${route.coverage_policy === 'ALL_CANONICAL_TASKS_EXACTLY_ONCE' ? 'todas, exactamente una vez' : route.coverage_policy}**`,
    '',
    '## Contrato obligatorio para ejecutar cada tarea',
    '',
    'Antes de desarrollar:',
    '',
    '1. consultar la rama canónica vigente y verificar que la fila continúa siendo la tarea actual;',
    '2. leer completa la sección propietaria, sus TREQ, decisiones, dependencias y consumidores;',
    '3. reconciliar el alcance contra el código vigente de todos los repositorios afectados;',
    '4. enumerar cada superficie afectada y asignarle disposición `CREAR`, `MODIFICAR`, `REUTILIZAR`, `RETIRAR`, `SIN_CAMBIO_JUSTIFICADO` o `DIFERIR_A_<TASK-ID>`;',
    '5. declarar archivos exactos, funciones/símbolos, contratos, datos, permisos, integraciones, pruebas y evidencia esperada.',
    '',
    'No puede quedar sin revisar ninguna categoría aplicable:',
    '',
    '- aplicaciones, rutas, layouts, pantallas, componentes, formularios y navegación;',
    '- acciones de usuario, hooks, servicios, adaptadores, consultas, estado local y utilidades;',
    '- Server Actions, API/route handlers, RPC, funciones SQL, triggers, Edge Functions, jobs, cron, colas y webhooks;',
    '- tablas, vistas, relaciones, constraints, RLS, grants, Storage, Realtime, tipos y migraciones;',
    '- eventos, productores, consumidores, idempotencia, retry, compensación y conciliación;',
    '- configuración, variables, secretos, feature flags, observabilidad, logs y alertas;',
    '- pruebas unitarias, contractuales, integración, seguridad, E2E, regresión, dispositivo y operación;',
    '- documentación, capacitación, rollout, rollback, piloto, evidencia y soporte.',
    '',
    'Para cerrar:',
    '',
    '1. cada superficie descubierta debe estar resuelta por esta tarea o vinculada a otra tarea canónica exacta;',
    '2. toda exclusión o diferimiento debe tener justificación, propietario y momento de resolución;',
    '3. deben ejecutarse las validaciones proporcionales y registrarse resultados reales, incluidos los fallos;',
    '4. el compilador, el registro TREQ y la continuidad deben quedar consistentes;',
    '5. el estado solo cambia mediante aprobación explícita; la siguiente fila no se inicia por inferencia.',
    '',
    '**Regla de cero omisiones:** una función, archivo, ruta, objeto de datos o consumidor descubierto sin tarea propietaria bloquea el cierre. Debe incorporarse al alcance actual o asignarse expresamente a una tarea posterior existente; si ninguna existe, se crea primero la tarea canónica faltante y se regenera esta guía.',
    '',
    '## Etapas pendientes',
    '',
    '| Orden | Etapa | Bloque | Activación | Primera tarea pendiente |',
    '| ---: | --- | --- | --- | --- |',
    ...stages.map((stage) => `| ${stage.stageOrder} | \`${stage.sequenceId}\` | ${stage.blockCode} — ${stage.blockTitle} | ${stage.activationState} | \`${stage.id}\` |`),
    '',
    '## Secuencia pendiente exacta',
    '',
    '> Las etapas `ACTIVE` aparecen primero en su orden ejecutable. Las tareas de etapas `DEFERRED` permanecen incluidas al final y no se pierden, pero no bloquean la continuidad activa hasta que se resuelva su condición de activación.',
    '',
    '| Pendiente # | Orden canónico | Etapa | Estado | Identificador | Título canónico | Resultado material esperado | Fragmento propietario |',
    '| ---: | ---: | --- | --- | --- | --- | --- | --- |',
  ];
  for (const [pendingIndex, task] of tasks.entries()) {
    const esc = (value) => String(value).replaceAll('|', '\\|').replaceAll('\n', ' ');
    lines.push(`| ${pendingIndex + 1} | ${task.canonicalOrder} | \`${task.sequenceId}\` | ${task.state} | \`${task.id}\` | ${esc(task.title)} | ${esc(describePendingTask(task.title))} | \`${esc(task.relativePath)}\` |`);
  }
  lines.push('');
  return lines.join('\n');
}

export function syncPendingTaskContext({ root = process.cwd(), check = false } = {}) {
  const baseDir = path.join(root, 'docs/plan-canonico/modular');
  const outputPath = path.join(baseDir, OUTPUT);
  const route = JSON.parse(fs.readFileSync(path.join(baseDir, 'continuity-route.json'), 'utf8'));
  const active = JSON.parse(fs.readFileSync(path.join(baseDir, 'active-sequence.json'), 'utf8'));
  const tasks = orderPendingTasksByRoute(readCanonicalTasks(baseDir), route);
  const expected = render(tasks, route, active);
  const current = fs.existsSync(outputPath) ? fs.readFileSync(outputPath, 'utf8') : '';
  if (current === expected) return { changed: false };
  if (check) throw new Error('El registro de tareas pendientes con contexto está desactualizado.');
  fs.mkdirSync(path.dirname(outputPath), { recursive: true });
  fs.writeFileSync(outputPath, expected, 'utf8');
  return { changed: true };
}

const isCli = process.argv[1] && path.resolve(process.argv[1]) === fileURLToPath(import.meta.url);
if (isCli) {
  try {
    const result = syncPendingTaskContext({ check: process.argv.includes('--check') });
    console.log(result.changed ? 'OK: contexto de tareas pendientes actualizado.' : 'OK: contexto de tareas pendientes vigente.');
  } catch (error) {
    console.error(`ERROR: ${error.message}`);
    process.exit(1);
  }
}
