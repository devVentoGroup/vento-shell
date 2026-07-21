import fs from 'node:fs';
import path from 'node:path';

const TASK_REGEX = /^###\s+(?<marker>\[[ x~]\]|[✅🟡❌])\s+(?<id>[A-Z][A-Z0-9]*(?:-[A-Z0-9]+)+-\d{3})\b(?:\s+[—-]\s+(?<title>[^\n]+))?$/gmu;

function fail(message) {
  throw new Error(message);
}

function escapeRegex(value) {
  return value.replace(/[.*+?^${}()|[\]\\]/g, '\\$&');
}

function normalizeState(value) {
  const normalized = String(value ?? '')
    .replace(/\*\*/g, '')
    .replace(/^[✅🟡❌⬜]\s*/, '')
    .trim()
    .replace(/\s{2,}/g, ' ')
    .toUpperCase();

  if (normalized === 'APROBADO' || normalized === 'APROBADA') return 'APROBADA';
  if (normalized === 'PROPUESTA PARA APROBACIÓN') return 'PROPUESTA PARA APROBACIÓN';
  if (normalized === 'NO INICIADO' || normalized === 'NO INICIADA') return 'NO INICIADA';
  if (normalized === 'RECHAZADO' || normalized === 'RECHAZADA') return 'RECHAZADA';
  return normalized;
}

function extractTaskState(section, marker) {
  const patterns = [
    /^\*\*Estado:\*\*\s*([^\n]+)$/m,
    /^Estado:\s*([^\n]+)$/m,
    /^\|\s*\*\*Estado(?::)?\*\*\s*\|\s*([^|]+?)\s*\|$/m,
    /^\|\s*Estado(?::)?\s*\|\s*([^|]+?)\s*\|$/m,
    /^#####\s+Estado\s*\n+\s*([✅🟡❌⬜]?[^\n]+)$/m,
    /^#####\s+Estado de la tarea\s*\n+\s*([✅🟡❌⬜]?[^\n]+)$/m,
  ];

  for (const pattern of patterns) {
    const value = section.match(pattern)?.[1];
    if (value) return normalizeState(value);
  }

  if (marker === '✅' || marker === '[x]') return 'APROBADA';
  if (marker === '🟡' || marker === '[~]') return 'PROPUESTA PARA APROBACIÓN';
  if (marker === '[ ]') return 'NO INICIADA';
  if (marker === '❌') return 'RECHAZADA';
  return '';
}

function readTaskMap(baseDir, manifest) {
  const taskMap = new Map();

  for (const relativePath of manifest.files) {
    const fullPath = path.join(baseDir, relativePath);
    if (!fs.existsSync(fullPath) || !fs.statSync(fullPath).isFile()) continue;

    const text = fs.readFileSync(fullPath, 'utf8').replace(/\r\n?/g, '\n');
    const matches = [...text.matchAll(TASK_REGEX)];

    for (let index = 0; index < matches.length; index += 1) {
      const match = matches[index];
      const id = match.groups?.id;
      if (!id) continue;
      if (taskMap.has(id)) fail(`la tarea ${id} aparece en más de un fragmento canónico.`);

      const section = text.slice(match.index ?? 0, matches[index + 1]?.index ?? text.length);
      const marker = match.groups?.marker ?? '';
      const state = extractTaskState(section, marker);
      const title = (match.groups?.title ?? '').trim();

      if (!title) fail(`la tarea ${id} no tiene título resoluble en su encabezado.`);
      if (!state) fail(`la tarea ${id} no tiene estado resoluble.`);
      if (marker === '✅' && state !== 'APROBADA') fail(`${id} usa ✅ pero su estado es ${state}.`);
      if (marker === '🟡' && state !== 'PROPUESTA PARA APROBACIÓN') fail(`${id} usa 🟡 pero su estado es ${state}.`);
      if (marker === '[ ]' && state !== 'NO INICIADA') fail(`${id} usa [ ] pero su estado es ${state}.`);

      taskMap.set(id, { id, title, state, marker, relativePath });
    }
  }

  return taskMap;
}

function buildExecutionSequence() {
  const beforeGate = Array.from(
    { length: 27 },
    (_, index) => `AUTH-CTX-${String(index + 1).padStart(3, '0')}`
  );
  const afterGate = Array.from(
    { length: 3 },
    (_, index) => `AUTH-CTX-${String(index + 28).padStart(3, '0')}`
  );
  return [...beforeGate, 'AUTH-MOD-021', ...afterGate];
}

function resolveContinuity(taskMap) {
  const sequence = buildExecutionSequence();
  const tasks = sequence.map(
    (id) => taskMap.get(id) ?? fail(`no se encontró la tarea requerida ${id}.`)
  );
  const currentIndex = tasks.findIndex((task) => task.state !== 'APROBADA');

  if (currentIndex < 0) {
    fail('todas las tareas de la secuencia actual están aprobadas; se requiere definir manualmente la transición al siguiente bloque.');
  }
  if (currentIndex === 0) {
    fail(`la secuencia no tiene una tarea aprobada anterior a ${tasks[0].id}.`);
  }

  const approvedAfterCurrent = tasks
    .slice(currentIndex + 1)
    .filter((task) => task.state === 'APROBADA');
  if (approvedAfterCurrent.length > 0) {
    fail(`existen aprobaciones fuera de orden después de ${tasks[currentIndex].id}: ${approvedAfterCurrent.map((task) => task.id).join(', ')}.`);
  }

  const proposals = tasks.filter((task) => task.state === 'PROPUESTA PARA APROBACIÓN');
  if (proposals.length > 1) {
    fail(`existe más de una tarea en propuesta dentro de la secuencia: ${proposals.map((task) => task.id).join(', ')}.`);
  }

  const current = tasks[currentIndex];
  if (!['NO INICIADA', 'PROPUESTA PARA APROBACIÓN', 'RECHAZADA'].includes(current.state)) {
    fail(`la tarea actual derivada ${current.id} tiene un estado no soportado: ${current.state}.`);
  }

  return {
    sequence: tasks,
    lastApproved: tasks[currentIndex - 1],
    current,
    next: tasks[currentIndex + 1] ?? null,
  };
}

function replaceRow(text, label, value) {
  const pattern = new RegExp(`^\\|\\s*${escapeRegex(label)}\\s*\\|[^\\n]*\\|$`, 'm');
  if (!pattern.test(text)) fail(`no se encontró la fila de cabecera "${label}".`);
  return text.replace(pattern, `| ${label} | ${value} |`);
}

function replaceSection(text, heading, updater) {
  const start = text.indexOf(heading);
  if (start < 0) fail(`no se encontró la sección ${heading}.`);
  const nextHeading = text.indexOf('\n## ', start + heading.length);
  const end = nextHeading < 0 ? text.length : nextHeading;
  const section = text.slice(start, end);
  return text.slice(0, start) + updater(section) + text.slice(end);
}

function formatTask(task, code = false) {
  const id = code ? `\`${task.id}\`` : task.id;
  return `${id} — ${task.title}`;
}

function currentProgressText(current) {
  if (current.state === 'PROPUESTA PARA APROBACIÓN') return 'en propuesta';
  if (current.state === 'RECHAZADA') return 'requiere corrección';
  return 'pendiente';
}

function buildProgressSummary(taskMap, continuity) {
  const approvedCtx = [];
  for (let number = 1; number <= 30; number += 1) {
    const task = taskMap.get(`AUTH-CTX-${String(number).padStart(3, '0')}`);
    if (task?.state === 'APROBADA') approvedCtx.push(number);
  }

  const highestApprovedCtx = approvedCtx.length > 0 ? Math.max(...approvedCtx) : 0;
  const prefix = highestApprovedCtx > 1
    ? `AUTH-CTX-001 a AUTH-CTX-${String(highestApprovedCtx).padStart(3, '0')} aprobadas`
    : 'AUTH-CTX-001 aprobada';

  return `${prefix}; ${continuity.current.id} ${currentProgressText(continuity.current)}`;
}

function pluralState(state, count) {
  if (count <= 1) return state;
  if (state === 'APROBADA') return 'APROBADAS';
  if (state === 'NO INICIADA') return 'NO INICIADAS';
  if (state === 'RECHAZADA') return 'RECHAZADAS';
  return state;
}

function buildCtxProgressRows(taskMap) {
  const tasks = Array.from(
    { length: 30 },
    (_, index) => taskMap.get(`AUTH-CTX-${String(index + 1).padStart(3, '0')}`)
  );
  if (tasks.some((task) => !task)) {
    fail('no se pudieron resolver las 30 tareas AUTH-CTX para el progreso documental.');
  }

  const groups = [];
  for (const task of tasks) {
    const number = Number(task.id.slice(-3));
    const previous = groups.at(-1);
    if (previous && previous.state === task.state && previous.end + 1 === number) {
      previous.end = number;
    } else {
      groups.push({ start: number, end: number, state: task.state });
    }
  }

  return groups.map((group) => {
    const startId = `AUTH-CTX-${String(group.start).padStart(3, '0')}`;
    const endId = `AUTH-CTX-${String(group.end).padStart(3, '0')}`;
    const label = group.start === group.end
      ? `\`${startId}\``
      : `\`${startId}\` a \`${endId}\``;
    const state = pluralState(group.state, group.end - group.start + 1);
    return `| ${label} | **${state}** |`;
  });
}

function updateProgressSection(section, taskMap) {
  const gate = taskMap.get('AUTH-MOD-021') ?? fail('no se encontró AUTH-MOD-021.');
  const gateState = gate.state === 'APROBADA'
    ? '**APROBADA — PUERTA SUPERADA**'
    : `**${gate.state} — PUERTA ANTES DE AUTH-CTX-028**`;

  let updated = replaceRow(section, '`AUTH-MOD-021`', gateState);
  const firstCtxRow = updated.search(/^\|\s*`AUTH-CTX-\d{3}`/m);
  const implementationRow = updated.search(/^\|\s*Implementación física\s*\|/m);
  if (firstCtxRow < 0 || implementationRow < 0 || implementationRow <= firstCtxRow) {
    fail('no se pudo localizar el bloque de progreso AUTH-CTX.');
  }

  const rows = `${buildCtxProgressRows(taskMap).join('\n')}\n`;
  updated = updated.slice(0, firstCtxRow) + rows + updated.slice(implementationRow);
  return updated;
}

function buildControlBlock(continuity) {
  const lines = [
    '## Control de continuidad',
    '',
    '```text',
    'ÚLTIMA TAREA APROBADA',
    formatTask(continuity.lastApproved),
    '        ↓',
    'TAREA ACTUAL',
    formatTask(continuity.current),
  ];

  if (continuity.next) {
    lines.push('        ↓', 'SIGUIENTE TAREA RESERVADA', formatTask(continuity.next));
  }

  const currentCtxNumber = continuity.current.id.startsWith('AUTH-CTX-')
    ? Number(continuity.current.id.slice(-3))
    : null;

  if (currentCtxNumber !== null && currentCtxNumber < 27) {
    const start = currentCtxNumber + 2;
    if (start <= 27) {
      lines.push(
        '        ↓',
        'CONTINUIDAD DEL BLOQUE',
        `AUTH-CTX-${String(start).padStart(3, '0')} a AUTH-CTX-027`
      );
    }
  }

  const gateApproved = continuity.sequence
    .find((task) => task.id === 'AUTH-MOD-021')?.state === 'APROBADA';
  const currentIsGate = continuity.current.id === 'AUTH-MOD-021';
  const currentIsAfterGate = currentCtxNumber !== null && currentCtxNumber >= 28;
  if (!gateApproved && !currentIsGate && !currentIsAfterGate) {
    lines.push(
      '        ↓',
      'PUERTA CONTRACTUAL OBLIGATORIA',
      'AUTH-MOD-021 — Definir rol base mínimo',
      'no privilegiado para trabajadores',
      'puramente operativos'
    );
  }

  if (currentCtxNumber === null || currentCtxNumber < 28) {
    lines.push('        ↓', 'CIERRE DEL BLOQUE', 'AUTH-CTX-028 a AUTH-CTX-030');
  } else if (currentCtxNumber < 30) {
    lines.push(
      '        ↓',
      'CIERRE DEL BLOQUE',
      `AUTH-CTX-${String(currentCtxNumber + 1).padStart(3, '0')} a AUTH-CTX-030`
    );
  }

  lines.push('```');
  return lines.join('\n');
}

function updateHeader(header, taskMap, continuity) {
  let updated = header;
  updated = replaceRow(updated, 'Última tarea aprobada', `**${formatTask(continuity.lastApproved)}**`);
  updated = replaceRow(updated, 'Tarea actual', `**${formatTask(continuity.current)}**`);
  updated = replaceRow(updated, 'Estado de la tarea actual', `**${continuity.current.state}**`);
  if (continuity.next) {
    updated = replaceRow(updated, 'Siguiente tarea', `**${formatTask(continuity.next)}**`);
  }
  updated = replaceRow(
    updated,
    'Progreso del bloque',
    `**${buildProgressSummary(taskMap, continuity)}**`
  );

  updated = replaceSection(updated, '### Continuidad inmediata', (section) => {
    let result = section;
    result = replaceRow(result, 'Última aprobada', formatTask(continuity.lastApproved, true));
    result = replaceRow(
      result,
      'Tarea actual',
      `${formatTask(continuity.current, true)} — **${continuity.current.state}**`
    );
    if (continuity.next) {
      result = replaceRow(result, 'Siguiente tarea', formatTask(continuity.next, true));
    }
    return result;
  });

  updated = replaceSection(
    updated,
    '## Progreso documental aprobado',
    (section) => updateProgressSection(section, taskMap)
  );

  const controlPattern = /## Control de continuidad\n\n```text\n[\s\S]*?\n```/;
  if (!controlPattern.test(updated)) fail('no se encontró el bloque Control de continuidad.');
  updated = updated.replace(controlPattern, buildControlBlock(continuity));

  return updated;
}

export function syncPlanContinuity({ root = process.cwd(), checkOnly = false } = {}) {
  const baseDir = path.resolve(root, 'docs/plan-canonico/modular');
  const manifestPath = path.join(baseDir, 'manifest.json');
  const headerPath = path.join(baseDir, '00_CABECERA_Y_ESTADO.md');

  if (!fs.existsSync(manifestPath)) fail(`no existe ${path.relative(root, manifestPath)}.`);
  if (!fs.existsSync(headerPath)) fail(`no existe ${path.relative(root, headerPath)}.`);

  const manifest = JSON.parse(fs.readFileSync(manifestPath, 'utf8'));
  if (!Array.isArray(manifest.files) || manifest.files.length === 0) {
    fail('manifest.json no contiene una lista válida de archivos.');
  }

  const taskMap = readTaskMap(baseDir, manifest);
  const continuity = resolveContinuity(taskMap);
  const currentHeader = fs.readFileSync(headerPath, 'utf8');
  const nextHeader = updateHeader(currentHeader, taskMap, continuity);
  const changed = nextHeader !== currentHeader;

  if (checkOnly && changed) {
    fail(
      `la cabecera está desactualizada. Estado derivado: última ${continuity.lastApproved.id}; actual ${continuity.current.id}; siguiente ${continuity.next?.id ?? 'NINGUNA'}.`
    );
  }

  if (!checkOnly && changed) {
    fs.writeFileSync(headerPath, nextHeader, 'utf8');
    console.log(
      `OK: continuidad sincronizada; última ${continuity.lastApproved.id}; actual ${continuity.current.id}; siguiente ${continuity.next?.id ?? 'NINGUNA'}.`
    );
  } else if (!changed) {
    console.log(
      `OK: continuidad vigente; última ${continuity.lastApproved.id}; actual ${continuity.current.id}; siguiente ${continuity.next?.id ?? 'NINGUNA'}.`
    );
  }

  return { changed, ...continuity };
}
