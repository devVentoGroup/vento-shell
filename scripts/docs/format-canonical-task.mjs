import fs from 'node:fs';
import path from 'node:path';
import { fileURLToPath } from 'node:url';

const TASK_HEADING = /^###\s+(?<marker>\[[ x~]\]|[✅🟡❌])\s+(?<id>[A-Z][A-Z0-9]*(?:-[A-Z0-9]+)+-\d{3})\b(?:\s+[—-]\s+(?<title>[^\n]+))?$/u;
const SECTION_HEADING = /^####(?:\s+\d+\.)?\s+\S.*$/u;
const METADATA = /^\*\*(?<label>[^*\n]+):\*\*\s*(?<value>.*)$/u;

const METADATA_ORDER = [
  'Estado',
  'Tarea anterior',
  'Dependencia anterior',
  'Tarea siguiente',
  'Continuidad reservada',
  'Tipo de tarea',
  'Tipo',
  'Bloque',
  'Repositorio propietario',
  'Archivo propietario',
  'Estado físico resultante',
  'Cambios físicos autorizados',
  'Requisitos de prueba creados o modificados',
  'Fecha de corte',
];

const SCAFFOLD_SECTIONS = [
  'Propósito',
  'Alcance y límites',
  'Resultado canónico',
  'Decisiones',
  'Requisitos de prueba derivados',
  'Criterios de aceptación',
  'Resultado y continuidad',
];

function fail(message) {
  throw new Error(message);
}

function normalizeSource(source) {
  return source.replace(/^\uFEFF/u, '').replace(/\r\n?/gu, '\n');
}

function detectEol(source) {
  return source.includes('\r\n') ? '\r\n' : '\n';
}

function isFence(line) {
  return /^\s*```/u.test(line);
}

function metadataRank(line, fallback) {
  const match = line.match(METADATA);
  if (!match) return Number.MAX_SAFE_INTEGER + fallback;
  const rank = METADATA_ORDER.indexOf(match.groups.label.trim());
  return rank < 0 ? METADATA_ORDER.length + fallback : rank;
}

function metadataEntries(lines) {
  const entries = lines.map((line, index) => {
    const match = line.match(METADATA);
    if (!match) fail(`línea de metadata inválida: ${line}`);
    return {
      label: match.groups.label.trim(),
      value: match.groups.value.trim(),
      line,
      index,
    };
  });
  const labels = entries.map(({ label }) => label.toLocaleLowerCase('es'));
  if (new Set(labels).size !== labels.length) {
    fail('la tarea contiene etiquetas de metadata duplicadas.');
  }
  return entries;
}

function semanticFingerprint(block) {
  const lines = normalizeSource(block).split('\n');
  const heading = lines.shift()?.replace(/\s+/gu, ' ').trim() ?? '';
  while (lines[0] === '') lines.shift();
  const metadataLines = [];
  while (lines[0]?.match(METADATA)) metadataLines.push(lines.shift());
  const metadata = metadataEntries(metadataLines)
    .map(({ label, value }) => `${label.replace(/\s+/gu, ' ')}:${value.replace(/\s+/gu, ' ')}`)
    .sort((left, right) => left.localeCompare(right, 'es'));
  const body = lines.join('\n').replace(/\s+/gu, '');
  return JSON.stringify({ heading, metadata, body });
}

function normalizeStructuralSpacing(lines) {
  const output = [];
  let fenced = false;

  for (let index = 0; index < lines.length; index += 1) {
    const raw = lines[index];
    const trimmed = raw.trim();
    if (isFence(raw)) {
      fenced = !fenced;
      output.push(raw);
      continue;
    }
    if (fenced) {
      output.push(raw);
      continue;
    }

    const structural = trimmed === '---' || SECTION_HEADING.test(trimmed);
    if (!structural) {
      output.push(raw.trim().length === 0 ? '' : raw);
      continue;
    }

    while (output.at(-1) === '') output.pop();
    if (output.length > 0) output.push('');
    output.push(trimmed);
    output.push('');
    while (lines[index + 1]?.trim() === '') index += 1;
  }

  while (output[0] === '') output.shift();
  while (output.at(-1) === '') output.pop();
  return output;
}

function addScaffold(block, task) {
  if (task.marker !== '[ ]') {
    fail(`--scaffold solo puede utilizarse con una tarea NO INICIADA; ${task.id} usa ${task.marker}.`);
  }
  if (/^####\s+/mu.test(block)) {
    fail(`--scaffold no puede utilizarse: ${task.id} ya contiene secciones desarrolladas.`);
  }

  const lines = normalizeSource(block).split('\n');
  while (lines.at(-1)?.trim() === '') lines.pop();
  if (!lines.slice(1).some((line) => line.match(METADATA))) {
    lines.push(
      '',
      '**Estado:** NO INICIADA',
      '**Tipo de tarea:** [PENDIENTE_DE_DEFINIR]',
      '**Cambios físicos autorizados:** ninguno',
    );
  }
  lines.push('', '---');
  for (const [index, title] of SCAFFOLD_SECTIONS.entries()) {
    lines.push('', `#### ${index + 1}. ${title}`, '');
    if (title === 'Requisitos de prueba derivados') {
      lines.push('**Resultado:** [PENDIENTE_DE_CLASIFICAR]');
    } else {
      lines.push('[PENDIENTE_DE_DESARROLLO]');
    }
    if (index < SCAFFOLD_SECTIONS.length - 1) lines.push('', '---');
  }
  return lines.join('\n');
}

export function parseTaskBlocks(source) {
  const normalized = normalizeSource(source);
  const lines = normalized.split('\n');
  const starts = [];
  let fenced = false;

  lines.forEach((line, index) => {
    if (isFence(line)) {
      fenced = !fenced;
      return;
    }
    if (fenced) return;
    const match = line.match(TASK_HEADING);
    if (match) {
      starts.push({
        index,
        id: match.groups.id,
        marker: match.groups.marker,
        title: (match.groups.title ?? '').trim(),
      });
    }
  });

  return starts.map((task, index) => ({
    ...task,
    endIndex: starts[index + 1]?.index ?? lines.length,
    block: lines.slice(task.index, starts[index + 1]?.index ?? lines.length).join('\n'),
  }));
}

export function formatTaskBlock(block, { scaffold = false } = {}) {
  let candidate = normalizeSource(block);
  const parsed = parseTaskBlocks(candidate);
  if (parsed.length !== 1 || parsed[0].index !== 0) {
    fail('el bloque debe contener exactamente una tarea canónica desde su primera línea.');
  }
  const task = parsed[0];
  if (scaffold) candidate = addScaffold(candidate, task);

  const beforeFingerprint = semanticFingerprint(candidate);
  const lines = candidate.split('\n');
  const heading = lines.shift().trim();
  while (lines[0]?.trim() === '') lines.shift();

  const metadataLines = [];
  while (lines[0]?.match(METADATA)) metadataLines.push(lines.shift());
  const metadata = metadataEntries(metadataLines)
    .sort((left, right) => {
      const rankDelta = metadataRank(left.line, left.index) - metadataRank(right.line, right.index);
      return rankDelta || left.index - right.index;
    })
    .map(({ line }) => line);

  while (lines[0]?.trim() === '') lines.shift();
  const body = normalizeStructuralSpacing(lines);
  const formatted = [
    heading,
    ...(metadata.length > 0 ? ['', ...metadata] : []),
    ...(body.length > 0 ? ['', ...body] : []),
  ].join('\n');

  if (semanticFingerprint(formatted) !== beforeFingerprint) {
    fail(`el formateo de ${task.id} intentó cambiar contenido no estructural.`);
  }
  return formatted;
}

export function formatTaskFileSource(source, {
  taskId = null,
  all = false,
  scaffold = false,
} = {}) {
  const normalized = normalizeSource(source);
  const tasks = parseTaskBlocks(normalized);
  if (tasks.length === 0) fail('el archivo no contiene tareas canónicas.');
  if (all && taskId) fail('--all y --task-id son mutuamente excluyentes.');
  if (scaffold && all) fail('--scaffold exige una tarea explícita; no se permite junto con --all.');

  let selected;
  if (all) {
    selected = tasks;
  } else if (taskId) {
    selected = tasks.filter((task) => task.id === taskId);
    if (selected.length !== 1) fail(`se esperaba una sola tarea ${taskId}; encontradas ${selected.length}.`);
  } else if (tasks.length === 1) {
    selected = tasks;
  } else {
    fail('el archivo contiene varias tareas; use --task-id <ID> o --all.');
  }

  const selectedIds = new Set(selected.map(({ id }) => id));
  const lines = normalized.split('\n');
  const output = [];
  const changedTaskIds = [];
  let cursor = 0;

  for (const task of tasks) {
    output.push(...lines.slice(cursor, task.index));
    if (!selectedIds.has(task.id)) {
      output.push(...lines.slice(task.index, task.endIndex));
    } else {
      const formatted = formatTaskBlock(task.block, { scaffold });
      const trailing = task.block.match(/\n+$/u)?.[0] ?? '';
      const formattedWithTrailing = `${formatted}${trailing}`;
      if (formattedWithTrailing !== task.block) changedTaskIds.push(task.id);
      output.push(...formattedWithTrailing.split('\n'));
    }
    cursor = task.endIndex;
  }
  output.push(...lines.slice(cursor));

  return {
    source: `${output.join('\n').replace(/\n+$/u, '')}\n`,
    taskIds: selected.map(({ id }) => id),
    changedTaskIds,
  };
}

function parseArgs(argv) {
  const args = { file: null, taskId: null, all: false, write: false, scaffold: false, help: false };
  for (let index = 0; index < argv.length; index += 1) {
    const token = argv[index];
    if (token === '--help' || token === '-h') args.help = true;
    else if (token === '--all') args.all = true;
    else if (token === '--write') args.write = true;
    else if (token === '--check') args.write = false;
    else if (token === '--scaffold') args.scaffold = true;
    else if (token === '--file' || token === '--task-id') {
      const value = argv[index + 1];
      if (!value || value.startsWith('--')) fail(`falta el valor de ${token}.`);
      args[token === '--file' ? 'file' : 'taskId'] = value;
      index += 1;
    } else fail(`argumento desconocido: ${token}.`);
  }
  return args;
}

function printUsage() {
  console.log(`Uso:
  npm run docs:task:format -- --file <ruta.md> [--task-id <ID> | --all] [--check | --write]
  npm run docs:task:format -- --file <ruta.md> --task-id <ID> --scaffold --write

El modo predeterminado es --check. --write modifica únicamente los bloques seleccionados.
--scaffold solo prepara una tarea NO INICIADA sin secciones y nunca se aplica en masa.`);
}

export function main(argv = process.argv.slice(2)) {
  const args = parseArgs(argv);
  if (args.help) return printUsage();
  if (!args.file) fail('debe indicarse --file <ruta.md>.');

  const filePath = path.resolve(args.file);
  if (!fs.existsSync(filePath)) fail(`no existe ${filePath}.`);
  const raw = fs.readFileSync(filePath, 'utf8');
  const eol = detectEol(raw);
  const result = formatTaskFileSource(raw, args);
  const next = eol === '\n' ? result.source : result.source.replace(/\n/gu, '\r\n');

  if (result.changedTaskIds.length === 0) {
    console.log(`OK: formato canónico vigente; ${result.taskIds.join(', ')}.`);
    return result;
  }
  if (!args.write) {
    fail(`requieren formato canónico: ${result.changedTaskIds.join(', ')}. Use --write para aplicarlo.`);
  }

  fs.writeFileSync(filePath, next, 'utf8');
  console.log(`OK: formato canónico aplicado a ${result.changedTaskIds.join(', ')}.`);
  return result;
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
