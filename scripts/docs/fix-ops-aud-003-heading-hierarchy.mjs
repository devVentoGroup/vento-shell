import fs from 'node:fs';

const filePath = 'docs/plan-canonico/modular/bloques/E1_DESCUBRIMIENTO_OPERATIVO/02_AUDITORIA_DE_OPERACION_REAL.md';
const source = fs.readFileSync(filePath, 'utf8').replace(/\r\n?/g, '\n');

const startPattern = /^###\s+(?:🟡|✅|\[~\]|\[x\])\s+OPS-AUD-003\b.*$/m;
const endPattern = /^###\s+\[ \]\s+OPS-AUD-004\b.*$/m;

const startMatch = source.match(startPattern);
if (!startMatch || startMatch.index == null) {
  throw new Error('No se encontró el inicio de OPS-AUD-003.');
}

const tail = source.slice(startMatch.index + startMatch[0].length);
const endMatch = tail.match(endPattern);
if (!endMatch || endMatch.index == null) {
  throw new Error('No se encontró el inicio de OPS-AUD-004.');
}

const blockStart = startMatch.index;
const blockEnd = startMatch.index + startMatch[0].length + endMatch.index;
let block = source.slice(blockStart, blockEnd);

block = block.replace(
  /^#\s+OPS-AUD-003\s+—\s+Levantar la operación ordinaria real por sede y área\s*\n+/m,
  '',
);

block = block
  .split('\n')
  .map((line) => {
    const match = line.match(/^#{1,6}\s+(\d+(?:\.\d+)*\.)\s+(.+)$/);
    if (!match) return line;

    const depth = match[1].split('.').filter(Boolean).length;
    const headingLevel = depth === 1 ? 4 : depth === 2 ? 5 : 6;
    return `${'#'.repeat(headingLevel)} ${match[1]} ${match[2]}`;
  })
  .join('\n');

const updated = source.slice(0, blockStart) + block + source.slice(blockEnd);

if (updated === source) {
  console.log('OPS-AUD-003 ya tiene la jerarquía correcta.');
  process.exit(0);
}

fs.writeFileSync(filePath, updated, 'utf8');
console.log('Jerarquía de OPS-AUD-003 corregida.');
