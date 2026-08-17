import fs from 'node:fs';
import path from 'node:path';
import { fileURLToPath } from 'node:url';

const TASK_REGEX = /^###\s+(?<marker>\[[ x~]\]|[✅🟡❌])\s+(?<id>[A-Z][A-Z0-9]*(?:-[A-Z0-9]+)+-\d{3})\b(?:\s+[—-]\s+(?<title>[^\n]+))?$/gmu;
const TASK_ID_PATTERN = '[A-Z][A-Z0-9]*(?:-[A-Z0-9]+)+-\\d{3}';
const SCOPE_START = '<!-- TASK-SCOPE-CONTRACT:START -->';
const SCOPE_END = '<!-- TASK-SCOPE-CONTRACT:END -->';
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

function conjugateCoordinatedActions(value) {
  const conjugations = new Map([
    ['aprobar', 'aprueba'],
    ['certificar', 'certifica'],
    ['configurar', 'configura'],
    ['corregir', 'corrige'],
    ['desplegar', 'despliega'],
    ['documentar', 'documenta'],
    ['estabilizar', 'estabiliza'],
    ['ejecutar', 'ejecuta'],
    ['habilitar', 'habilita'],
    ['migrar', 'migra'],
    ['probar', 'prueba'],
    ['proteger', 'protege'],
    ['publicar', 'publica'],
    ['reconciliar', 'reconcilia'],
    ['recuperar', 'recupera'],
    ['registrar', 'registra'],
    ['resolver', 'resuelve'],
    ['retirar', 'retira'],
    ['validar', 'valida'],
    ['verificar', 'verifica'],
  ]);
  let result = value;
  for (const [infinitive, conjugated] of conjugations) {
    result = result.replace(new RegExp(`\\by ${infinitive}\\b`, 'giu'), `y ${conjugated}`);
  }
  return result;
}

export function describePendingTask(title) {
  const subject = normalizeSubject(title || 'tarea sin título');
  const rules = [
    [/^Definir\s+/iu, (rest) => `Define ${rest} con reglas, responsables, excepciones y criterios verificables.`],
    [/^Diseñar\s+/iu, (rest) => `Diseña ${rest}, incluyendo arquitectura, flujo, componentes y límites.`],
    [/^Implementar y desplegar\s+/iu, (rest) => `Implementa y despliega ${rest} de forma controlada, con pruebas y rollback.`],
    [/^Implementar\s+/iu, (rest) => `Implementa ${rest} y verifica integración, compatibilidad y rollback.`],
    [/^Crear\s+/iu, (rest) => `Crea ${rest} como artefacto verificable, con relaciones y aceptación claras.`],
    [/^Validar\s+/iu, (rest) => `Valida ${rest} contra los contratos y escenarios aprobados y registra evidencia.`],
    [/^Verificar\s+/iu, (rest) => `Verifica ${rest}, registra brechas y deja evidencia del resultado.`],
    [/^Probar\s+/iu, (rest) => `Prueba ${rest} en escenarios representativos y registra resultados y defectos reales.`],
    [/^Ejecutar\s+/iu, (rest) => `Ejecuta ${rest} de forma controlada y registra resultado, fallos y evidencia.`],
    [/^Registrar\s+/iu, (rest) => `Registra ${rest} de forma trazable, con decisiones y evidencia.`],
    [/^Aprobar\s+/iu, (rest) => `Aprueba ${rest} solo después de revisar evidencia y bloqueos.`],
    [/^Auditar\s+/iu, (rest) => `Audita ${rest}, identifica brechas y decide cada hallazgo.`],
    [/^Inventariar\s+/iu, (rest) => `Inventaría ${rest} y reconcilia faltantes, duplicados e identidades.`],
    [/^Clasificar\s+/iu, (rest) => `Clasifica ${rest} con una decisión explícita por elemento y excepción.`],
    [/^Documentar\s+/iu, (rest) => `Documenta ${rest} con fuentes, decisiones, límites y evidencia.`],
    [/^Resolver\s+/iu, (rest) => `Resuelve ${rest}, cierra bloqueos y deja una salida verificable.`],
    [/^Preparar\s+/iu, (rest) => `Prepara ${rest} para su ejecución posterior, con dependencias y puertas claras.`],
    [/^Migrar\s+/iu, (rest) => `Migra ${rest} al destino canónico, comprueba paridad y conserva rollback.`],
    [/^Retirar\s+/iu, (rest) => `Retira ${rest} solo después de verificar el reemplazo y el rollback.`],
    [/^Sustituir\s+/iu, (rest) => `Sustituye ${rest} por su alternativa canónica sin romper consumidores.`],
    [/^Consolidar\s+/iu, (rest) => `Consolida ${rest}; establece una fuente canónica y elimina responsabilidades competidoras.`],
    [/^Compartir\s+/iu, (rest) => `Comparte ${rest} mediante una API reutilizable y un propietario claro.`],
    [/^Mantener\s+/iu, (rest) => `Mantiene ${rest} y documenta la frontera que evita acoplamientos.`],
    [/^Permitir\s+/iu, (rest) => `Permite ${rest} bajo condiciones, límites y controles verificables.`],
    [/^Evitar\s+/iu, (rest) => `Evita ${rest} mediante una regla comprobable y una respuesta segura.`],
    [/^Estandarizar\s+/iu, (rest) => `Estandariza ${rest} con una forma común y verificable.`],
    [/^Publicar\s+/iu, (rest) => `Publica ${rest} con versión, trazabilidad y evidencia de entrega.`],
    [/^Configurar\s+/iu, (rest) => `Configura ${rest} con valores, propietarios, validaciones y rollback.`],
    [/^Integrar\s+/iu, (rest) => `Integra ${rest} con sus consumidores y verifica contratos y compatibilidad.`],
    [/^Proteger\s+/iu, (rest) => `Protege ${rest} y verifica denegación segura, auditoría y recuperación.`],
    [/^Certificar\s+/iu, (rest) => `Certifica ${rest} con evidencia de paridad y cumplimiento.`],
    [/^Reconciliar\s+/iu, (rest) => `Reconcilia ${rest} con sus fuentes canónicas y resuelve cada diferencia.`],
    [/^Medir\s+/iu, (rest) => `Mide ${rest} con criterios reproducibles y registra resultados reales.`],
    [/^Revisar\s+/iu, (rest) => `Revisa ${rest}, identifica diferencias y deja decisiones trazables.`],
  ];
  for (const [pattern, formatter] of rules) {
    const match = subject.match(pattern);
    if (match) return formatter(conjugateCoordinatedActions(subject.slice(match[0].length)));
  }
  return `Convierte «${subject}» en una condición verificable, con responsable, evidencia y criterio de cierre.`;
}

function countOccurrences(source, token) {
  return source.split(token).length - 1;
}

export function parseTaskScopeContracts(source, relativePath = '(fuente desconocida)') {
  const startCount = countOccurrences(source, SCOPE_START);
  const endCount = countOccurrences(source, SCOPE_END);
  if (startCount !== endCount) {
    throw new Error(`Contrato de alcance sin cierre válido en ${relativePath}.`);
  }

  const contracts = new Map();
  const blockPattern = new RegExp(`${SCOPE_START}([\\s\\S]*?)${SCOPE_END}`, 'gu');
  const scopeRowStartPattern = new RegExp('^\\|\\s*`' + TASK_ID_PATTERN + '`', 'u');
  const rowPattern = new RegExp(
    '^\\|\\s*`(?<id>' + TASK_ID_PATTERN + ')`\\s*\\|\\s*(?<decides>[^|]+?)\\s*\\|\\s*(?<excludes>[^|]+?)\\s*\\|\\s*(?<handoff>[^|]+?)\\s*\\|\\s*$',
    'u',
  );

  for (const block of source.matchAll(blockPattern)) {
    let rows = 0;
    for (const line of block[1].split('\n')) {
      if (!scopeRowStartPattern.test(line)) continue;
      const match = line.match(rowPattern);
      if (!match?.groups) {
        throw new Error(`Fila de alcance inválida en ${relativePath}: ${line.trim()}`);
      }
      const { id, decides, excludes, handoff } = match.groups;
      if (contracts.has(id)) throw new Error(`Contrato de alcance duplicado para ${id}.`);
      contracts.set(id, {
        decides: decides.trim(),
        excludes: excludes.trim(),
        handoff: handoff.trim(),
      });
      rows += 1;
    }
    if (rows === 0) throw new Error(`Contrato de alcance vacío en ${relativePath}.`);
  }

  return contracts;
}

export function describeTaskScope(task) {
  if (!task.scope) return describePendingTask(task.title);
  return task.scope.decides;
}

function readCanonicalTasks(baseDir) {
  const manifest = JSON.parse(fs.readFileSync(path.join(baseDir, 'manifest.json'), 'utf8'));
  const tasks = [];
  for (const relativePath of manifest.files) {
    const fullPath = path.join(baseDir, relativePath);
    if (!fs.existsSync(fullPath) || !fs.statSync(fullPath).isFile()) continue;
    const source = maskFencedCode(fs.readFileSync(fullPath, 'utf8').replace(/\r\n?/gu, '\n'));
    const scopes = parseTaskScopeContracts(source, relativePath);
    const fileTaskIds = new Set();
    for (const match of source.matchAll(TASK_REGEX)) {
      const state = stateFromMarker(match.groups?.marker ?? '');
      fileTaskIds.add(match.groups.id);
      tasks.push({
        id: match.groups.id,
        title: (match.groups.title ?? '(sin título canónico)').trim(),
        state,
        relativePath,
        scope: scopes.get(match.groups.id) ?? null,
      });
    }
    const orphanScopes = [...scopes.keys()].filter((id) => !fileTaskIds.has(id));
    if (orphanScopes.length > 0) {
      throw new Error(`Contratos de alcance sin tarea canónica en ${relativePath}: ${orphanScopes.join(', ')}.`);
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
    '## Próximas tareas — vista rápida',
    '',
    '> Estas frases orientan la lectura sin iniciar ni ampliar las tareas. El contrato y el fragmento propietario siguen siendo la autoridad.',
    '',
    '| # | Tarea | Qué hace |',
    '| ---: | --- | --- |',
    ...tasks.slice(0, 12).map((task, index) => `| ${index + 1} | \`${task.id}\` — ${task.title.replaceAll('|', '\\|')} | ${describeTaskScope(task).replaceAll('|', '\\|').replaceAll('\n', ' ')} |`),
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
    '| Pendiente # | Orden canónico | Etapa | Estado | Identificador | Título canónico | Qué hace | Fragmento propietario |',
    '| ---: | ---: | --- | --- | --- | --- | --- | --- |',
  ];
  for (const [pendingIndex, task] of tasks.entries()) {
    const esc = (value) => String(value).replaceAll('|', '\\|').replaceAll('\n', ' ');
    lines.push(`| ${pendingIndex + 1} | ${task.canonicalOrder} | \`${task.sequenceId}\` | ${task.state} | \`${task.id}\` | ${esc(task.title)} | ${esc(describeTaskScope(task))} | \`${esc(task.relativePath)}\` |`);
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
