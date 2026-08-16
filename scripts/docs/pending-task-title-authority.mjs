import fs from 'node:fs';
import path from 'node:path';

const TASK_ID = /^[A-Z][A-Z0-9]*(?:-[A-Z0-9]+)+-\d{3}$/u;
const OUTPUT = path.join(
  'docs',
  'plan-canonico',
  'modular',
  '.generated',
  'REGISTRO_DE_TAREAS_PENDIENTES_CON_CONTEXTO.md',
);

function splitMarkdownRow(line) {
  if (!/^\s*\|/u.test(line) || !/\|\s*$/u.test(line)) return [];
  const cells = [];
  let cell = '';
  let escaped = false;
  for (const character of line.trim().slice(1, -1)) {
    if (escaped) {
      cell += character;
      escaped = false;
    } else if (character === '\\') {
      escaped = true;
    } else if (character === '|') {
      cells.push(cell.trim());
      cell = '';
    } else {
      cell += character;
    }
  }
  if (escaped) cell += '\\';
  cells.push(cell.trim());
  return cells;
}

function stripCode(value) {
  return value.trim().replace(/^`|`$/gu, '');
}

export function parsePendingTaskTitleAuthority(source) {
  const lines = source.replace(/\r\n?/gu, '\n').split('\n');
  const titles = new Map();
  let foundTable = false;

  for (let index = 0; index < lines.length; index += 1) {
    const header = splitMarkdownRow(lines[index]);
    const idIndex = header.indexOf('Identificador');
    const titleIndex = header.indexOf('Título canónico');
    if (idIndex < 0 || titleIndex < 0) continue;
    foundTable = true;

    for (let rowIndex = index + 2; rowIndex < lines.length; rowIndex += 1) {
      const cells = splitMarkdownRow(lines[rowIndex]);
      if (cells.length === 0) break;
      const id = stripCode(cells[idIndex] ?? '');
      if (!TASK_ID.test(id)) continue;
      const title = (cells[titleIndex] ?? '').trim();
      if (!title) throw new Error(`la guía de pendientes no define título para ${id}.`);
      if (titles.has(id) && titles.get(id) !== title) {
        throw new Error(`la guía de pendientes contiene títulos contradictorios para ${id}.`);
      }
      titles.set(id, title);
    }
  }

  if (!foundTable) {
    throw new Error('la guía de pendientes no contiene la tabla de títulos canónicos.');
  }
  if (titles.size === 0) {
    throw new Error('la guía de pendientes no contiene tareas con título canónico.');
  }
  return titles;
}

export function readPendingTaskTitleAuthority(root = process.cwd()) {
  const filePath = path.join(root, OUTPUT);
  if (!fs.existsSync(filePath)) {
    throw new Error(`no existe la autoridad de títulos pendientes: ${filePath}.`);
  }
  return parsePendingTaskTitleAuthority(fs.readFileSync(filePath, 'utf8'));
}
