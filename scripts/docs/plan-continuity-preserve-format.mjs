import fs from 'node:fs';
import path from 'node:path';

const TASK_REGEX = /^###\s+(?<marker>\[[ x~]\]|[✅🟡❌])\s+(?<id>[A-Z][A-Z0-9]*(?:-[A-Z0-9]+)+-\d{3})\b(?:\s+[—-]\s+(?<title>[^\n]+))?$/gmu;
const REGISTRY_OUTPUT = '.generated/REGISTRO_GLOBAL_DE_TAREAS.md';

function fail(message) {
  throw new Error(message);
}

function escapeRegex(value) {
  return value.replace(/[.*+?^${}()|[\]\\]/g, '\\$&');
}

function normalizeEol(text) {
  return text.replace(/\r\n?/g, '\n');
}

function detectEol(text) {
  return text.includes('\r\n') ? '\r\n' : '\n';
}

function restoreEol(text, eol) {
  return eol === '\n' ? text : text.replace(/\n/g, eol);
}

function maskFencedCode(text) {
  let insideFence = false;
  return text
    .split('\n')
    .map((line) => {
      if (/^\s*```/.test(line)) {
        insideFence = !insideFence;
        return '';
      }
      return insideFence ? '' : line;
    })
    .join('\n');
}

function stateFromMarker(marker) {
  if (marker === '✅' || marker === '[x]') return 'APROBADA';
  if (marker === '🟡' || marker === '[~]') return 'PROPUESTA PARA APROBACIÓN';
  if (marker === '[ ]') return 'NO INICIADA';
  if (marker === '❌') return 'RECHAZADA';
  fail(`marcador no reconocido: ${marker || 'VACÍO'}.`);
}

function stateIcon(state) {
  if (state === 'APROBADA') return '✅';
  if (state === 'PROPUESTA PARA APROBACIÓN') return '🟡';
  if (state === 'NO INICIADA') return '⬜';
  if (state === 'RECHAZADA') return '❌';
  return '⚠️';
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

function readTaskRegistry(baseDir, manifest) {
  const taskMap = new Map();

  manifest.files.forEach((relativePath, fileIndex) => {
    const fullPath = path.join(baseDir, relativePath);
    if (!fs.existsSync(fullPath) || !fs.statSync(fullPath).isFile()) return;

    const source = normalizeEol(fs.readFileSync(fullPath, 'utf8'));
    const matches = [...maskFencedCode(source).matchAll(TASK_REGEX)];

    matches.forEach((match, taskIndex) => {
      const id = match.groups?.id;
      if (!id) return;
      if (taskMap.has(id)) {
        const previous = taskMap.get(id);
        fail(`la tarea ${id} aparece en ${previous.relativePath} y ${relativePath}.`);
      }

      taskMap.set(id, {
        id,
        marker: match.groups?.marker ?? '',
        title: (match.groups?.title ?? '').trim() || '(sin título canónico)',
        state: stateFromMarker(match.groups?.marker ?? ''),
        relativePath,
        fileIndex,
        taskIndex,
      });
    });
  });

  if (taskMap.size === 0) fail('no se detectaron tareas con marcador canónico.');
  return taskMap;
}

function summarize(taskMap) {
  const tasks = [...taskMap.values()];
  const count = (state) => tasks.filter((task) => task.state === state).length;
  return {
    total: tasks.length,
    auth: tasks.filter((task) => task.id.startsWith('AUTH-')).length,
    approved: count('APROBADA'),
    proposed: count('PROPUESTA PARA APROBACIÓN'),
    notStarted: count('NO INICIADA'),
    rejected: count('RECHAZADA'),
  };
}

function resolveContinuity(taskMap) {
  const sequence = buildExecutionSequence().map((id) => {
    const task = taskMap.get(id);
    if (!task) fail(`no se encontró la tarea activa ${id}.`);
    if (task.title === '(sin título canónico)') fail(`la tarea activa ${id} no tiene título.`);
    return task;
  });

  const currentIndex = sequence.findIndex((task) => task.state !== 'APROBADA');
  if (currentIndex < 0) fail('toda la secuencia activa está aprobada.');
  if (currentIndex === 0) fail(`no existe una tarea aprobada anterior a ${sequence[0].id}.`);

  const outOfOrder = sequence
    .slice(currentIndex + 1)
    .filter((task) => task.state === 'APROBADA');
  if (outOfOrder.length) {
    fail(`aprobaciones fuera de orden después de ${sequence[currentIndex].id}: ${outOfOrder.map((task) => task.id).join(', ')}.`);
  }

  const proposals = sequence.filter((task) => task.state === 'PROPUESTA PARA APROBACIÓN');
  if (proposals.length > 1) {
    fail(`más de una propuesta activa: ${proposals.map((task) => task.id).join(', ')}.`);
  }

  return {
    sequence,
    lastApproved: sequence[currentIndex - 1],
    current: sequence[currentIndex],
    next: sequence[currentIndex + 1] ?? null,
  };
}

function setTableRowValue(text, label, value) {
  const escaped = escapeRegex(label);
  const pattern = new RegExp(`^(\\|\\s*${escaped}\\s*\\|\\s*)([^|\\n]*?)(\\s*\\|)\\s*$`, 'm');
  const match = text.match(pattern);
  if (!match) return { text, found: false, changed: false };
  if (match[2].trim() === value.trim()) return { text, found: true, changed: false };

  return {
    text: text.replace(pattern, (_, prefix, _oldValue, suffix) => `${prefix}${value}${suffix}`),
    found: true,
    changed: true,
  };
}

function requireTableRow(text, label, value) {
  const result = setTableRowValue(text, label, value);
  if (!result.found) fail(`no se encontró la fila de cabecera "${label}".`);
  return result.text;
}

function ensureSummaryRows(text, stats) {
  const rows = [
    ['Tareas canónicas con marcador', `**${stats.total}**`],
    ['Tareas `AUTH` únicas', `**${stats.auth}**`],
    ['Tareas aprobadas', `**${stats.approved}**`],
    ['Tareas en propuesta', `**${stats.proposed}**`],
    ['Tareas no iniciadas', `**${stats.notStarted}**`],
    ['Tareas rechazadas', `**${stats.rejected}**`],
  ];

  let updated = text;
  const missing = [];
  for (const [label, value] of rows) {
    const result = setTableRowValue(updated, label, value);
    updated = result.text;
    if (!result.found) missing.push([label, value]);
  }

  if (!missing.length) return updated;

  const anchor = /^\|\s*Fragmentos canónicos\s*\|[^\n]*\|\s*$/m;
  const line = updated.match(anchor)?.[0];
  if (!line) fail('no se encontró la fila Fragmentos canónicos.');

  const inserted = missing.map(([label, value]) => `| ${label} | ${value} |`).join('\n');
  return updated.replace(anchor, `${line}\n${inserted}`);
}

function formatTask(task, code = false) {
  const id = code ? `\`${task.id}\`` : task.id;
  return `${id} — ${task.title}`;
}

function currentProgressText(task) {
  if (task.state === 'PROPUESTA PARA APROBACIÓN') return 'en propuesta';
  if (task.state === 'RECHAZADA') return 'requiere corrección';
  return 'pendiente';
}

function buildProgressSummary(taskMap, continuity) {
  let highest = 0;
  for (let number = 1; number <= 30; number += 1) {
    const id = `AUTH-CTX-${String(number).padStart(3, '0')}`;
    if (taskMap.get(id)?.state === 'APROBADA') highest = number;
  }

  const approvedText = highest > 1
    ? `AUTH-CTX-001 a AUTH-CTX-${String(highest).padStart(3, '0')} aprobadas`
    : 'AUTH-CTX-001 aprobada';
  return `${approvedText}; ${continuity.current.id} ${currentProgressText(continuity.current)}`;
}

function pluralState(state, count) {
  if (count === 1) return state;
  if (state === 'APROBADA') return 'APROBADAS';
  if (state === 'NO INICIADA') return 'NO INICIADAS';
  if (state === 'RECHAZADA') return 'RECHAZADAS';
  return state;
}

function buildCtxRows(taskMap) {
  const groups = [];
  for (let number = 1; number <= 30; number += 1) {
    const task = taskMap.get(`AUTH-CTX-${String(number).padStart(3, '0')}`);
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

function normalizeRowsForComparison(rows) {
  return rows
    .map((row) => row.replace(/\*\*/g, '').replace(/\s+/g, '').toUpperCase())
    .join('\n');
}

function updateProgressSection(text, taskMap) {
  const headingIndex = text.indexOf('## Progreso documental aprobado');
  if (headingIndex < 0) fail('no se encontró la sección Progreso documental aprobado.');
  const nextHeading = text.indexOf('\n## ', headingIndex + 3);
  const end = nextHeading < 0 ? text.length : nextHeading;
  let section = text.slice(headingIndex, end);

  const gate = taskMap.get('AUTH-MOD-021');
  const gateValue = gate.state === 'APROBADA'
    ? '**APROBADA — PUERTA SUPERADA**'
    : `**${gate.state} — PUERTA ANTES DE AUTH-CTX-028**`;
  section = requireTableRow(section, '`AUTH-MOD-021`', gateValue);

  const firstCtxRow = section.search(/^\|\s*`AUTH-CTX-\d{3}`/m);
  const implementationRow = section.search(/^\|\s*Implementación física\s*\|/m);
  if (firstCtxRow < 0 || implementationRow <= firstCtxRow) {
    fail('no se pudo localizar el bloque AUTH-CTX del progreso.');
  }

  const currentRows = section
    .slice(firstCtxRow, implementationRow)
    .split('\n')
    .filter((line) => /^\|\s*`AUTH-CTX-/.test(line));
  const expectedRows = buildCtxRows(taskMap);

  if (normalizeRowsForComparison(currentRows) !== normalizeRowsForComparison(expectedRows)) {
    section = section.slice(0, firstCtxRow) + `${expectedRows.join('\n')}\n` + section.slice(implementationRow);
  }

  return text.slice(0, headingIndex) + section + text.slice(end);
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
    lines.push('        ↓', 'CONTINUIDAD DEL BLOQUE', `AUTH-CTX-${String(currentNumber + 2).padStart(3, '0')} a AUTH-CTX-027`);
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

function semanticBlock(text) {
  return text
    .replace(/^##\s+Control de continuidad\s*$/m, '')
    .replace(/```text|```/g, '')
    .replace(/\s+/g, ' ')
    .trim();
}

function updateControlBlock(text, continuity) {
  const expected = buildControlBlock(continuity);
  const headingMatch = text.match(/^##\s+Control de continuidad\s*$/m);

  if (!headingMatch) {
    return `${text.trimEnd()}\n\n${expected}\n`;
  }

  const start = headingMatch.index;
  const nextHeading = text.slice(start + headingMatch[0].length).search(/\n##\s+/);
  const end = nextHeading < 0
    ? text.length
    : start + headingMatch[0].length + nextHeading;
  const current = text.slice(start, end);

  if (semanticBlock(current) === semanticBlock(expected)) return text;
  return text.slice(0, start) + expected + text.slice(end);
}

function ensureRegistryLink(text) {
  const link = '- [Registro global de tareas](./.generated/REGISTRO_GLOBAL_DE_TAREAS.md)';
  if (text.includes(link)) return text;

  const compiledLink = '- [Documento compilado](./.generated/PLAN_IMPLEMENTACION_VENTO_OS_CANONICO_COMPILADO.md)';
  if (!text.includes(compiledLink)) return text;
  return text.replace(compiledLink, `${compiledLink}\n${link}`);
}

function updateHeader(text, manifest, taskMap, stats, continuity) {
  let updated = text;
  updated = requireTableRow(updated, 'Fragmentos canónicos', `**${manifest.files.length}**`);
  updated = ensureSummaryRows(updated, stats);
  updated = requireTableRow(updated, 'Última tarea aprobada', `**${formatTask(continuity.lastApproved)}**`);
  updated = requireTableRow(updated, 'Tarea actual', `**${formatTask(continuity.current)}**`);
  updated = requireTableRow(updated, 'Estado de la tarea actual', `**${continuity.current.state}**`);
  if (continuity.next) {
    updated = requireTableRow(updated, 'Siguiente tarea', `**${formatTask(continuity.next)}**`);
  }
  updated = requireTableRow(updated, 'Progreso del bloque', `**${buildProgressSummary(taskMap, continuity)}**`);
  updated = requireTableRow(updated, 'Última aprobada', formatTask(continuity.lastApproved, true));
  updated = requireTableRow(updated, 'Tarea actual', `${formatTask(continuity.current, true)} — **${continuity.current.state}**`);
  if (continuity.next) {
    updated = requireTableRow(updated, 'Siguiente tarea', formatTask(continuity.next, true));
  }

  updated = updateProgressSection(updated, taskMap);
  updated = updateControlBlock(updated, continuity);
  return ensureRegistryLink(updated);
}

function escapeCell(value) {
  return String(value).replaceAll('|', '\\|').replaceAll('\n', ' ');
}

function buildRegistry(taskMap, stats, continuity) {
  const tasks = [...taskMap.values()].sort(
    (a, b) => a.fileIndex - b.fileIndex || a.taskIndex - b.taskIndex
  );

  const lines = [
    '# REGISTRO GLOBAL DE TAREAS — VENTO OS',
    '',
    '> Archivo derivado. No editar manualmente.',
    '>',
    '> La fuente de verdad del estado es exclusivamente el marcador del encabezado.',
    '',
    '## Resumen global',
    '',
    '| Métrica | Cantidad |',
    '| --- | ---: |',
    `| Tareas con marcador | **${stats.total}** |`,
    `| Tareas \`AUTH\` | **${stats.auth}** |`,
    `| Aprobadas | **${stats.approved}** |`,
    `| En propuesta | **${stats.proposed}** |`,
    `| No iniciadas | **${stats.notStarted}** |`,
    `| Rechazadas | **${stats.rejected}** |`,
    '',
    '## Continuidad activa',
    '',
    '| Relación | Tarea | Estado |',
    '| --- | --- | --- |',
    `| Última aprobada | \`${continuity.lastApproved.id}\` — ${escapeCell(continuity.lastApproved.title)} | ✅ APROBADA |`,
    `| Tarea actual | \`${continuity.current.id}\` — ${escapeCell(continuity.current.title)} | ${stateIcon(continuity.current.state)} ${continuity.current.state} |`,
  ];

  if (continuity.next) {
    lines.push(`| Siguiente | \`${continuity.next.id}\` — ${escapeCell(continuity.next.title)} | ${stateIcon(continuity.next.state)} ${continuity.next.state} |`);
  }

  lines.push('', '## Registro completo', '', '| Estado | Identificador | Título | Fragmento fuente |', '| --- | --- | --- | --- |');
  for (const task of tasks) {
    lines.push(`| ${stateIcon(task.state)} ${task.state} | \`${task.id}\` | ${escapeCell(task.title)} | \`${escapeCell(task.relativePath)}\` |`);
  }
  lines.push('');
  return lines.join('\n');
}

export function syncPlanContinuity({ root = process.cwd(), checkOnly = false } = {}) {
  const baseDir = path.resolve(root, 'docs/plan-canonico/modular');
  const manifestPath = path.join(baseDir, 'manifest.json');
  const headerPath = path.join(baseDir, '00_CABECERA_Y_ESTADO.md');
  const registryPath = path.join(baseDir, REGISTRY_OUTPUT);

  if (!fs.existsSync(manifestPath)) fail(`no existe ${path.relative(root, manifestPath)}.`);
  if (!fs.existsSync(headerPath)) fail(`no existe ${path.relative(root, headerPath)}.`);

  const manifest = JSON.parse(fs.readFileSync(manifestPath, 'utf8'));
  if (!Array.isArray(manifest.files) || manifest.files.length === 0) {
    fail('manifest.json no contiene archivos válidos.');
  }

  const taskMap = readTaskRegistry(baseDir, manifest);
  const stats = summarize(taskMap);
  const continuity = resolveContinuity(taskMap);

  const originalHeader = fs.readFileSync(headerPath, 'utf8');
  const eol = detectEol(originalHeader);
  const normalizedHeader = normalizeEol(originalHeader);
  const nextNormalizedHeader = updateHeader(normalizedHeader, manifest, taskMap, stats, continuity);
  const nextHeader = restoreEol(nextNormalizedHeader, eol);
  const nextRegistry = buildRegistry(taskMap, stats, continuity);

  const headerChanged = nextHeader !== originalHeader;
  const registryChanged = !fs.existsSync(registryPath) || fs.readFileSync(registryPath, 'utf8') !== nextRegistry;

  if (checkOnly && (headerChanged || registryChanged)) {
    fail(`${headerChanged ? 'cabecera' : ''}${headerChanged && registryChanged ? ' y ' : ''}${registryChanged ? 'registro global' : ''} desactualizado(s).`);
  }

  if (!checkOnly) {
    if (headerChanged) fs.writeFileSync(headerPath, nextHeader, 'utf8');
    if (registryChanged) {
      fs.mkdirSync(path.dirname(registryPath), { recursive: true });
      fs.writeFileSync(registryPath, nextRegistry, 'utf8');
    }
  }

  console.log(`OK: registro global; ${stats.total} tareas; ${stats.approved} aprobadas; ${stats.proposed} en propuesta; ${stats.notStarted} no iniciadas; ${stats.rejected} rechazadas.`);
  console.log(`OK: continuidad; última ${continuity.lastApproved.id}; actual ${continuity.current.id}; siguiente ${continuity.next?.id ?? 'NINGUNA'}.`);

  return { changed: headerChanged || registryChanged, stats, taskMap, ...continuity };
}
