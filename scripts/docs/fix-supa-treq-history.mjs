import fs from 'node:fs';
import path from 'node:path';

const registryPath = path.resolve(
  'docs/plan-canonico/modular/bloques/E1_DESCUBRIMIENTO_OPERATIVO/04A_REGISTRO_CANONICO_DE_REQUISITOS_DE_PRUEBA.md'
);

const typeFixes = new Map([
  ['TREQ-SUPABASE-209', 'contractual + seguridad + regresión / automatizada'],
  ['TREQ-SUPABASE-237', 'contractual + seguridad + regresión / automatizada'],
  ['TREQ-SUPABASE-269', 'base de datos + seguridad + regresión / automatizada'],
  ['TREQ-SUPABASE-270', 'contractual + regresión / automatizada'],
  ['TREQ-SUPABASE-287', 'base de datos + regresión / automatizada'],
  ['TREQ-SUPABASE-295', 'contractual + regresión / automatizada con revisión'],
  ['TREQ-SUPABASE-331', 'base de datos + migración + regresión / automatizada'],
  ['TREQ-SUPABASE-370', 'base de datos + regresión / automatizada'],
  ['TREQ-SUPABASE-371', 'base de datos + regresión / automatizada'],
  ['TREQ-SUPABASE-372', 'base de datos + regresión / automatizada'],
  ['TREQ-SUPABASE-379', 'base de datos + regresión / automatizada'],
  ['TREQ-SUPABASE-381', 'base de datos + regresión / automatizada'],
  ['TREQ-SUPABASE-382', 'base de datos + migración + regresión / automatizada'],
  ['TREQ-SUPABASE-383', 'base de datos + regresión / automatizada'],
  ['TREQ-SUPABASE-384', 'base de datos + regresión / automatizada'],
  ['TREQ-SUPABASE-386', 'contractual + seguridad + regresión / automatizada'],
  ['TREQ-SUPABASE-406', 'contractual + regresión / automatizada'],
]);

const taskFixes = new Map([
  ['TREQ-SUPABASE-383', ['OPS-AUD-018', 'SUPA-ARC-021']],
  ['TREQ-SUPABASE-391', ['OPS-AUD-018', 'SUPA-ARC-022']],
]);

if (!fs.existsSync(registryPath)) {
  throw new Error(`No existe el registro canónico: ${registryPath}`);
}

const source = fs.readFileSync(registryPath, 'utf8').replace(/\r\n?/g, '\n');
const lines = source.split('\n');
const expectedIds = new Set([...typeFixes.keys(), ...taskFixes.keys()]);
const seen = new Map();
let changed = 0;

for (let index = 0; index < lines.length; index += 1) {
  const match = lines[index].match(/^\|\s*`(TREQ-SUPABASE-\d+)`\s*\|/);
  if (!match || !expectedIds.has(match[1])) continue;

  const id = match[1];
  const cells = lines[index].split('|');
  if (cells.length !== 16) {
    throw new Error(`${id}: la fila no conserva las catorce columnas canónicas.`);
  }

  seen.set(id, (seen.get(id) ?? 0) + 1);
  let rowChanged = false;

  if (typeFixes.has(id)) {
    const normalized = ` ${typeFixes.get(id)} `;
    if (cells[6] !== normalized) {
      cells[6] = normalized;
      rowChanged = true;
    }
  }

  if (taskFixes.has(id)) {
    const [legacyTask, canonicalTask] = taskFixes.get(id);
    if (cells[7].includes(legacyTask)) {
      cells[7] = cells[7].replaceAll(legacyTask, canonicalTask);
      rowChanged = true;
    } else if (!cells[7].includes(canonicalTask)) {
      throw new Error(`${id}: no contiene ${legacyTask} ni ${canonicalTask}.`);
    }
  }

  if (rowChanged) {
    lines[index] = cells.join('|');
    changed += 1;
  }
}

for (const id of expectedIds) {
  if ((seen.get(id) ?? 0) !== 1) {
    throw new Error(`${id}: se esperaba exactamente una fila canónica.`);
  }
}

if (changed > 0) {
  fs.writeFileSync(registryPath, lines.join('\n'), 'utf8');
}

console.log(`OK: normalización histórica Supabase; ${changed} filas modificadas.`);
