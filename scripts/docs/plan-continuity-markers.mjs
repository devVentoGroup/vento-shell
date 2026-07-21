import fs from 'node:fs';
import path from 'node:path';

const TASK_REGEX = /^###\s+(?<marker>\[[ x~]\]|[✅🟡❌])\s+(?<id>[A-Z][A-Z0-9]*(?:-[A-Z0-9]+)+-\d{3})\b(?:\s+[—-]\s+(?<title>[^\n]+))?$/gmu;

function fail(message) {
  throw new Error(message);
}

function escapeRegex(value) {
  return value.replace(/[.*+?^${}()|[\]\\]/g, '\\$&');
}

function buildExecutionSequence() {
  const ctxBeforeGate = Array.from(
    { length: 27 },
    (_, index) => `AUTH-CTX-${String(index + 1).padStart(3, '0')}`
  );
  const ctxAfterGate = Array.from(
    { length: 3 },
    (_, index) => `AUTH-CTX-${String(index + 28).padStart(3, '0')}`
  );

  return [...ctxBeforeGate, 'AUTH-MOD-021', ...ctxAfterGate];
}

function stateFromMarker(marker) {
  if (marker === '✅' || marker === '[x]') return 'APROBADA';
  if (marker === '🟡' || marker === '[~]') return 'PROPUESTA PARA APROBACIÓN';
  if (marker === '[ ]') return 'NO INICIADA';
  if (marker === '❌') return 'RECHAZADA';
  fail(`marcador de tarea no reconocido: ${marker || 'VACÍO'}.`);
}

function readManagedTasks(baseDir, manifest, sequenceIds) {
  const managedIds = new Set(sequenceIds);
  const taskMap = new Map();

  for (const relativePath of manifest.files) {
    const fullPath = path.join(baseDir, relativePath);
    if (!fs.existsSync(fullPath) || !fs.statSync(fullPath).isFile()) continue;

    const text = fs.readFileSync(fullPath, 'utf8').replace(/\r\n?/g, '\n');
    const matches = [...text.matchAll(TASK_REGEX)];

    for (const match of matches) {
      const id = match.groups?.id;
      if (!id || !managedIds.has(id)) continue;
      if (taskMap.has(id)) fail(`la tarea ${id} aparece en más de un fragmento canónico.`);

      const marker = match.groups?.marker ?? '';
      const title = (match.groups?.title ?? '').trim();
      if (!title) fail(`la tarea ${id} no tiene título resoluble en su encabezado.`);

      taskMap.set(id, {
        id,
        title,
        marker,
        state: stateFromMarker(marker),
        relativePath,
      });
    }
  }

  for (const id of sequenceIds) {
    if (!taskMap.has(id)) fail(`no se encontró la tarea requerida ${id}.`);
  }

  return taskMap;
}

function resolveContinuity(taskMap, sequenceIds) {
  const tasks = sequenceIds.map((id) => taskMap.get(id));
  const currentIndex = tasks.findIndex((task) => task.state !== 'APROBADA');

  if (currentIndex < 0) {
    fail('toda la secuencia actual está aprobada; debe definirse manualmente la transición al siguiente bloque.');
  }
  if (currentIndex === 0) {
    fail(`la secuencia no tiene una tarea aprobada anterior a ${tasks[0].id}.`);
  }

  const approvalsOutOfOrder = tasks
    .slice(currentIndex + 1)
    .filter((task) => task.state === 'APROBADA');
  if (approvalsOutOfOrder.length > 0) {
    fail(`existen aprobaciones fuera de orden después de ${tasks[currentIndex].id}: ${approvalsOutOfOrder.map((task) => task.id).join(', ')}.`);
  }

  const proposals = tasks.filter((task) => task.state === 'PROPUESTA PARA APROBACIÓN');
  if (proposals.length > 1) {
    fail(`existe más de una tarea en propuesta: ${proposals.map((task) => task.id).join(', ')}.`);
  }

  return {
    sequence: tasks,
    lastApproved: tasks[currentIndex - 1],
    current: tasks[currentIndex],
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
  return text.slice(0, start) + updater(text.slice(start, end)) + text.slice(end);
}

function formatTask(task, code = false) {
  const id = code ? `\`${task.id}\`` : task.id;
  return `${id} — ${task.title}`;
}

function progressStatus(task) {
  if (task.state === 'PROPUESTA PARA APROBACIÓN') return 'en propuesta';
  if (task.state === 'RECHAZADA') return 'requiere corrección';
  return 'pendiente';
}

function buildProgressSummary(taskMap, continuity) {
  let highestApproved = 0;
  for (let number = 1; number <= 30; number += 1) {
    const id = `AUTH-CTX-${String(number).padStart(3, '0')}`;
    if (taskMap.get(id)?.state === 'APROBADA') highestApproved = number;
  }

  const approvedText = highestApproved > 1
    ? `AUTH-CTX-001 a AUTH-CTX-${String(highestApproved).padStart(3, '0')} aprobadas`
    : 'AUTH-CTX-001 aprobada';

  return `${approvedText}; ${continuity.current.id} ${progressStatus(continuity.current)}`;
}

function pluralState(state, count) {
  if (count === 1) return state;
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
    return `| ${label} | **${pluralState(group.state, group.end - group.start + 1)}** |`;
  });
}

function updateProgressSection(section, taskMap) {
  const gate = taskMap.get('AUTH-MOD-021');
  const gateValue = gate.state === 'APROBADA'
    ? '**APROBADA — PUERTA SUPERADA**'
    : `**${gate.state} — PUERTA ANTES DE AUTH-CTX-028**`;

  let updated = replaceRow(section, '`AUTH-MOD-021`', gateValue);
  const firstCtxRow = updated.search(/^\|\s*`AUTH-CTX-\d{3}`/m);
  const implementationRow = updated.search(/^\|\s*Implementación física\s*\|/m);
  if (firstCtxRow < 0 || implementationRow <= firstCtxRow) {
    fail('no se pudo localizar el bloque de progreso AUTH-CTX.');
  }

  const rows = `${buildCtxProgressRows(taskMap).join('\n')}\n`;
  return updated.slice(0, firstCtxRow) + rows + updated.slice(implementationRow);
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

  const currentNumber = continuity.current.id.startsWith('AUTH-CTX-')
    ? Number(continuity.current.id.slice(-3))
    : null;
  const gateApproved = continuity.sequence.find((task) => task.id === 'AUTH-MOD-021')?.state === 'APROBADA';

  if (currentNumber !== null && currentNumber < 27 && currentNumber + 2 <= 27) {
    lines.push(
      '        ↓',
      'CONTINUIDAD DEL BLOQUE',
      `AUTH-CTX-${String(currentNumber + 2).padStart(3, '0')} a AUTH-CTX-027`
    );
  }

  if (!gateApproved && continuity.current.id !== 'AUTH-MOD-021' && !(currentNumber !== null && currentNumber >= 28)) {
    lines.push(
      '        ↓',
      'PUERTA CONTRACTUAL OBLIGATORIA',
      'AUTH-MOD-021 — Definir rol base mínimo',
      'no privilegiado para trabajadores',
      'puramente operativos'
    );
  }

  if (currentNumber === null || currentNumber < 28) {
    lines.push('        ↓', 'CIERRE DEL BLOQUE', 'AUTH-CTX-028 a AUTH-CTX-030');
  } else if (currentNumber < 30) {
    lines.push('        ↓', 'CIERRE DEL BLOQUE', `AUTH-CTX-${String(currentNumber + 1).padStart(3, '0')} a AUTH-CTX-030`);
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
  updated = replaceRow(updated, 'Progreso del bloque', `**${buildProgressSummary(taskMap, continuity)}**`);

  updated = replaceSection(updated, '### Continuidad inmediata', (section) => {
    let result = section;
    result = replaceRow(result, 'Última aprobada', formatTask(continuity.lastApproved, true));
    result = replaceRow(result, 'Tarea actual', `${formatTask(continuity.current, true)} — **${continuity.current.state}**`);
    if (continuity.next) result = replaceRow(result, 'Siguiente tarea', formatTask(continuity.next, true));
    return result;
  });

  updated = replaceSection(
    updated,
    '## Progreso documental aprobado',
    (section) => updateProgressSection(section, taskMap)
  );

  const controlPattern = /## Control de continuidad\n\n```text\n[\s\S]*?\n```/;
  if (!controlPattern.test(updated)) fail('no se encontró el bloque Control de continuidad.');
  return updated.replace(controlPattern, buildControlBlock(continuity));
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

  const sequenceIds = buildExecutionSequence();
  const taskMap = readManagedTasks(baseDir, manifest, sequenceIds);
  const continuity = resolveContinuity(taskMap, sequenceIds);
  const currentHeader = fs.readFileSync(headerPath, 'utf8');
  const nextHeader = updateHeader(currentHeader, taskMap, continuity);
  const changed = nextHeader !== currentHeader;

  if (checkOnly && changed) {
    fail(`la cabecera está desactualizada. Estado derivado: última ${continuity.lastApproved.id}; actual ${continuity.current.id}; siguiente ${continuity.next?.id ?? 'NINGUNA'}.`);
  }

  if (!checkOnly && changed) {
    fs.writeFileSync(headerPath, nextHeader, 'utf8');
    console.log(`OK: continuidad sincronizada; última ${continuity.lastApproved.id}; actual ${continuity.current.id}; siguiente ${continuity.next?.id ?? 'NINGUNA'}.`);
  } else {
    console.log(`OK: continuidad vigente; última ${continuity.lastApproved.id}; actual ${continuity.current.id}; siguiente ${continuity.next?.id ?? 'NINGUNA'}.`);
  }

  return { changed, ...continuity };
}
