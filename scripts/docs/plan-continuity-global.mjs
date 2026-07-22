import fs from 'node:fs';
import path from 'node:path';

const TASK_REGEX = /^###\s+(?<marker>\[[ x~]\]|[✅🟡❌])\s+(?<id>[A-Z][A-Z0-9]*(?:-[A-Z0-9]+)+-\d{3})\b(?:\s+[—-]\s+(?<title>[^\n]+))?$/gmu;

const REGISTRY_OUTPUT = '.generated/REGISTRO_GLOBAL_DE_TAREAS.md';
const ACTIVE_SEQUENCE_CONFIG = 'active-sequence.json';

function fail(message) {
  throw new Error(message);
}

function escapeRegex(value) {
  return value.replace(/[.*+?^${}()|[\]\\]/g, '\\$&');
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

function expandSequenceSegments(segments) {
  if (!Array.isArray(segments) || segments.length === 0) {
    fail('active-sequence.json no contiene segmentos válidos.');
  }

  const ids = segments.flatMap((segment) => {
    const { prefix, from, to } = segment ?? {};
    if (
      typeof prefix !== 'string'
      || !Number.isInteger(from)
      || !Number.isInteger(to)
      || from < 1
      || to < from
    ) {
      fail('active-sequence.json contiene un segmento inválido.');
    }

    return Array.from(
      { length: to - from + 1 },
      (_, index) => `${prefix}-${String(from + index).padStart(3, '0')}`
    );
  });

  if (new Set(ids).size !== ids.length) {
    fail('active-sequence.json genera tareas duplicadas.');
  }
  return ids;
}

function readActiveSequenceConfig(baseDir) {
  const configPath = path.join(baseDir, ACTIVE_SEQUENCE_CONFIG);
  if (!fs.existsSync(configPath)) {
    fail(`no existe ${path.relative(baseDir, configPath)}; debe definirse el bloque activo.`);
  }

  const config = JSON.parse(fs.readFileSync(configPath, 'utf8'));
  if (config.schema_version !== 1) fail('active-sequence.json utiliza una versión no soportada.');
  if (typeof config.sequence_id !== 'string') fail('active-sequence.json no define sequence_id.');
  if (typeof config.block_code !== 'string') fail('active-sequence.json no define block_code.');
  if (typeof config.block_title !== 'string') fail('active-sequence.json no define block_title.');
  if (typeof config.previous_task_id !== 'string') fail('active-sequence.json no define previous_task_id.');

  return { ...config, taskIds: expandSequenceSegments(config.segments) };
}

function buildExecutionSequence(activeConfig) {
  return [activeConfig.previous_task_id, ...activeConfig.taskIds];
}

function stateFromMarker(marker) {
  if (marker === '✅' || marker === '[x]') return 'APROBADA';
  if (marker === '🟡' || marker === '[~]') return 'PROPUESTA PARA APROBACIÓN';
  if (marker === '[ ]') return 'NO INICIADA';
  if (marker === '❌') return 'RECHAZADA';
  fail(`marcador de tarea no reconocido: ${marker || 'VACÍO'}.`);
}

function stateIcon(state) {
  if (state === 'APROBADA') return '✅';
  if (state === 'PROPUESTA PARA APROBACIÓN') return '🟡';
  if (state === 'NO INICIADA') return '⬜';
  if (state === 'RECHAZADA') return '❌';
  return '⚠️';
}

function readGlobalTaskRegistry(baseDir, manifest) {
  const taskMap = new Map();
  const missingTitles = [];

  manifest.files.forEach((relativePath, fileIndex) => {
    const fullPath = path.join(baseDir, relativePath);
    if (!fs.existsSync(fullPath) || !fs.statSync(fullPath).isFile()) return;

    const source = fs.readFileSync(fullPath, 'utf8').replace(/\r\n?/g, '\n');
    const text = maskFencedCode(source);
    const matches = [...text.matchAll(TASK_REGEX)];

    matches.forEach((match, taskIndex) => {
      const id = match.groups?.id;
      if (!id) return;
      if (taskMap.has(id)) {
        const previous = taskMap.get(id);
        fail(`la tarea ${id} aparece en más de un fragmento: ${previous.relativePath} y ${relativePath}.`);
      }

      const marker = match.groups?.marker ?? '';
      const rawTitle = (match.groups?.title ?? '').trim();
      const title = rawTitle || '(sin título canónico)';
      if (!rawTitle) missingTitles.push(`${id} en ${relativePath}`);

      taskMap.set(id, {
        id,
        title,
        marker,
        state: stateFromMarker(marker),
        relativePath,
        fileIndex,
        taskIndex,
      });
    });
  });

  if (taskMap.size === 0) {
    fail('no se detectaron tareas con marcador canónico.');
  }

  if (missingTitles.length > 0) {
    console.warn(`ADVERTENCIA: tareas sin título canónico: ${missingTitles.join(', ')}.`);
  }

  return taskMap;
}

function summarizeRegistry(taskMap) {
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

function resolveContinuity(taskMap, sequenceIds) {
  const tasks = sequenceIds.map((id) => {
    const task = taskMap.get(id);
    if (!task) fail(`no se encontró la tarea requerida por la secuencia activa: ${id}.`);
    if (task.title === '(sin título canónico)') fail(`la tarea activa ${id} no tiene título canónico.`);
    return task;
  });

  const currentIndex = tasks.findIndex((task) => task.state !== 'APROBADA');

  if (currentIndex < 0) {
    fail('toda la secuencia activa está aprobada; debe definirse manualmente la transición al siguiente bloque.');
  }
  if (currentIndex === 0) {
    fail(`la secuencia activa no tiene una tarea aprobada anterior a ${tasks[0].id}.`);
  }

  const approvalsOutOfOrder = tasks
    .slice(currentIndex + 1)
    .filter((task) => task.state === 'APROBADA');
  if (approvalsOutOfOrder.length > 0) {
    fail(`existen aprobaciones fuera de orden después de ${tasks[currentIndex].id}: ${approvalsOutOfOrder.map((task) => task.id).join(', ')}.`);
  }

  const proposals = tasks.filter((task) => task.state === 'PROPUESTA PARA APROBACIÓN');
  if (proposals.length > 1) {
    fail(`existe más de una tarea en propuesta dentro de la secuencia activa: ${proposals.map((task) => task.id).join(', ')}.`);
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

function replaceRegistrySummaryRows(header, stats) {
  const labels = [
    'Tareas canónicas con marcador',
    'Tareas `AUTH` únicas',
    'Tareas aprobadas',
    'Tareas en propuesta',
    'Tareas no iniciadas',
    'Tareas rechazadas',
  ];

  let updated = header;
  for (const label of labels) {
    const pattern = new RegExp(`^\\|\\s*${escapeRegex(label)}\\s*\\|[^\\n]*\\|\\n?`, 'm');
    updated = updated.replace(pattern, '');
  }

  const anchorPattern = /^\|\s*Fragmentos canónicos\s*\|[^\n]*\|$/m;
  const anchor = updated.match(anchorPattern)?.[0];
  if (!anchor) fail('no se encontró la fila Fragmentos canónicos para insertar el registro global.');

  const rows = [
    `| Tareas canónicas con marcador | **${stats.total}** |`,
    `| Tareas \`AUTH\` únicas | **${stats.auth}** |`,
    `| Tareas aprobadas | **${stats.approved}** |`,
    `| Tareas en propuesta | **${stats.proposed}** |`,
    `| Tareas no iniciadas | **${stats.notStarted}** |`,
    `| Tareas rechazadas | **${stats.rejected}** |`,
  ].join('\n');

  return updated.replace(anchorPattern, `${anchor}\n${rows}`);
}

function ensureRegistryNavigationLink(header) {
  const link = '- [Registro global de tareas](./.generated/REGISTRO_GLOBAL_DE_TAREAS.md)';
  if (header.includes(link)) return header;

  const compiledLink = '- [Documento compilado](./.generated/PLAN_IMPLEMENTACION_VENTO_OS_CANONICO_COMPILADO.md)';
  if (!header.includes(compiledLink)) fail('no se encontró el enlace al documento compilado.');
  return header.replace(compiledLink, `${compiledLink}\n${link}`);
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

function buildProgressSummary(continuity, activeConfig) {
  const approved = continuity.sequence.slice(1).filter((task) => task.state === 'APROBADA').length;
  return `${activeConfig.block_code}: ${approved} de ${continuity.sequence.length - 1} aprobadas; ${continuity.current.id} ${progressStatus(continuity.current)}`;
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

function updateProgressSection(section, taskMap, continuity, activeConfig) {
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
  updated = updated.slice(0, firstCtxRow) + rows + updated.slice(implementationRow);

  const activePattern = new RegExp(
    `^\\|\\s*${escapeRegex(activeConfig.block_code)}\\s*\\|[^\\n]*\\|\\n?`,
    'm'
  );
  updated = updated.replace(activePattern, '');

  const approved = continuity.sequence.slice(1).filter((task) => task.state === 'APROBADA').length;
  const activeRow = `| ${activeConfig.block_code} | **${approved} DE ${continuity.sequence.length - 1} APROBADAS — ACTUAL ${continuity.current.id}** |`;
  const implementationPattern = /^\|\s*Implementación física\s*\|[^\n]*\|$/m;
  if (!implementationPattern.test(updated)) fail('no se encontró la fila Implementación física.');
  return updated.replace(implementationPattern, `${activeRow}\n$&`);
}

function buildControlBlock(continuity, activeConfig) {
  const approved = continuity.sequence.slice(1).filter((task) => task.state === 'APROBADA').length;
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

  lines.push(
    '        ↓',
    'CONTINUIDAD DEL BLOQUE',
    `${activeConfig.block_code} — ${approved} de ${continuity.sequence.length - 1} tareas aprobadas`,
    '```'
  );
  return lines.join('\n');
}

function updateHeader(header, manifest, taskMap, stats, continuity, activeConfig) {
  const originalEol = header.includes('\r\n') ? '\r\n' : '\n';
  let updated = header.replace(/\r\n?/g, '\n');
  updated = replaceRow(updated, 'Fragmentos canónicos', `**${manifest.files.length}**`);
  updated = replaceRegistrySummaryRows(updated, stats);
  updated = replaceRow(updated, 'Última tarea aprobada', `**${formatTask(continuity.lastApproved)}**`);
  updated = replaceRow(updated, 'Tarea actual', `**${formatTask(continuity.current)}**`);
  updated = replaceRow(updated, 'Estado de la tarea actual', `**${continuity.current.state}**`);
  updated = replaceRow(updated, 'Bloque actual', `**${activeConfig.block_code} — ${activeConfig.block_title}**`);
  updated = replaceRow(updated, 'Siguiente tarea', continuity.next ? `**${formatTask(continuity.next)}**` : '**NINGUNA — CIERRE DEL BLOQUE**');
  updated = replaceRow(updated, 'Progreso del bloque', `**${buildProgressSummary(continuity, activeConfig)}**`);

  updated = replaceSection(updated, '### Continuidad inmediata', (section) => {
    let result = section;
    result = replaceRow(result, 'Última aprobada', formatTask(continuity.lastApproved, true));
    result = replaceRow(result, 'Tarea actual', `${formatTask(continuity.current, true)} — **${continuity.current.state}**`);
    result = replaceRow(result, 'Siguiente tarea', continuity.next ? formatTask(continuity.next, true) : 'NINGUNA — CIERRE DEL BLOQUE');
    return result;
  });

  updated = replaceSection(
    updated,
    '## Progreso documental aprobado',
    (section) => updateProgressSection(section, taskMap, continuity, activeConfig)
  );

  const controlPattern = /## Control de continuidad\n\n```text\n[\s\S]*?\n```/;
  if (!controlPattern.test(updated)) fail('no se encontró el bloque Control de continuidad.');
  updated = updated.replace(controlPattern, buildControlBlock(continuity, activeConfig));
  updated = ensureRegistryNavigationLink(updated);
  return originalEol === '\n' ? updated : updated.replace(/\n/g, '\r\n');
}

function escapeMarkdownCell(value) {
  return String(value).replaceAll('|', '\\|').replaceAll('\n', ' ');
}

function buildRegistryMarkdown(taskMap, stats, continuity) {
  const tasks = [...taskMap.values()].sort(
    (a, b) => a.fileIndex - b.fileIndex || a.taskIndex - b.taskIndex
  );

  const lines = [
    '# REGISTRO GLOBAL DE TAREAS — VENTO OS',
    '',
    '> Archivo derivado. No editar manualmente.',
    '>',
    '> La fuente de verdad del estado es exclusivamente el marcador del encabezado de cada tarea.',
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
    `| Última aprobada | \`${continuity.lastApproved.id}\` — ${escapeMarkdownCell(continuity.lastApproved.title)} | ✅ APROBADA |`,
    `| Tarea actual | \`${continuity.current.id}\` — ${escapeMarkdownCell(continuity.current.title)} | ${stateIcon(continuity.current.state)} ${continuity.current.state} |`,
  ];

  if (continuity.next) {
    lines.push(`| Siguiente | \`${continuity.next.id}\` — ${escapeMarkdownCell(continuity.next.title)} | ${stateIcon(continuity.next.state)} ${continuity.next.state} |`);
  }

  lines.push(
    '',
    '## Registro completo',
    '',
    '| Estado | Identificador | Título | Fragmento fuente |',
    '| --- | --- | --- | --- |'
  );

  for (const task of tasks) {
    lines.push(
      `| ${stateIcon(task.state)} ${task.state} | \`${task.id}\` | ${escapeMarkdownCell(task.title)} | \`${escapeMarkdownCell(task.relativePath)}\` |`
    );
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
    fail('manifest.json no contiene una lista válida de archivos.');
  }

  const taskMap = readGlobalTaskRegistry(baseDir, manifest);
  const stats = summarizeRegistry(taskMap);
  const activeConfig = readActiveSequenceConfig(baseDir);
  const sequenceIds = buildExecutionSequence(activeConfig);
  const continuity = resolveContinuity(taskMap, sequenceIds);

  const currentHeader = fs.readFileSync(headerPath, 'utf8');
  const nextHeader = updateHeader(currentHeader, manifest, taskMap, stats, continuity, activeConfig);
  const nextRegistry = buildRegistryMarkdown(taskMap, stats, continuity);
  const headerChanged = nextHeader !== currentHeader;
  const registryChanged = !fs.existsSync(registryPath) || fs.readFileSync(registryPath, 'utf8') !== nextRegistry;

  if (checkOnly && (headerChanged || registryChanged)) {
    const pending = [
      headerChanged ? 'cabecera' : null,
      registryChanged ? 'registro global' : null,
    ].filter(Boolean).join(' y ');
    fail(`${pending} desactualizado(s). Estado derivado: última ${continuity.lastApproved.id}; actual ${continuity.current.id}; siguiente ${continuity.next?.id ?? 'NINGUNA'}.`);
  }

  if (!checkOnly) {
    if (headerChanged) fs.writeFileSync(headerPath, nextHeader, 'utf8');
    if (registryChanged) {
      fs.mkdirSync(path.dirname(registryPath), { recursive: true });
      fs.writeFileSync(registryPath, nextRegistry, 'utf8');
    }
  }

  const action = headerChanged || registryChanged ? 'sincronizados' : 'vigentes';
  console.log(
    `OK: continuidad y registro global ${action}; ${stats.total} tareas; ${stats.approved} aprobadas; ${stats.proposed} en propuesta; ${stats.notStarted} no iniciadas; ${stats.rejected} rechazadas.`
  );
  console.log(
    `OK: secuencia activa; última ${continuity.lastApproved.id}; actual ${continuity.current.id}; siguiente ${continuity.next?.id ?? 'NINGUNA'}.`
  );

  return { changed: headerChanged || registryChanged, stats, taskMap, activeConfig, ...continuity };
}
