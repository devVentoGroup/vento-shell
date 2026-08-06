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

function readPendingTasks(baseDir) {
  const manifest = JSON.parse(fs.readFileSync(path.join(baseDir, 'manifest.json'), 'utf8'));
  const tasks = [];
  for (const relativePath of manifest.files) {
    const fullPath = path.join(baseDir, relativePath);
    if (!fs.existsSync(fullPath) || !fs.statSync(fullPath).isFile()) continue;
    const source = maskFencedCode(fs.readFileSync(fullPath, 'utf8').replace(/\r\n?/gu, '\n'));
    for (const match of source.matchAll(TASK_REGEX)) {
      const state = stateFromMarker(match.groups?.marker ?? '');
      if (state === 'APROBADA') continue;
      tasks.push({
        id: match.groups.id,
        title: (match.groups.title ?? '(sin título canónico)').trim(),
        state,
        relativePath,
      });
    }
  }
  const ids = tasks.map(({ id }) => id);
  if (new Set(ids).size !== ids.length) throw new Error('Existen tareas pendientes duplicadas.');
  return tasks;
}

function render(tasks) {
  const lines = [
    '# REGISTRO DE TAREAS PENDIENTES CON CONTEXTO — VENTO OS',
    '',
    '> Archivo derivado. No editar manualmente.',
    '>',
    '> Cada descripción resume el trabajo principal a partir del título canónico; no reemplaza el contenido completo de la tarea ni autoriza cambios de alcance.',
    '',
    `**Tareas pendientes descritas:** ${tasks.length}`,
    '',
    '| Estado | Identificador | Título canónico | Qué se hace | Archivo propietario |',
    '| --- | --- | --- | --- | --- |',
  ];
  for (const task of tasks) {
    const esc = (value) => String(value).replaceAll('|', '\\|').replaceAll('\n', ' ');
    lines.push(`| ${task.state} | \`${task.id}\` | ${esc(task.title)} | ${esc(describePendingTask(task.title))} | \`${esc(task.relativePath)}\` |`);
  }
  lines.push('');
  return lines.join('\n');
}

export function syncPendingTaskContext({ root = process.cwd(), check = false } = {}) {
  const baseDir = path.join(root, 'docs/plan-canonico/modular');
  const outputPath = path.join(baseDir, OUTPUT);
  const expected = render(readPendingTasks(baseDir));
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
