import fs from 'node:fs';

const file = 'docs/plan-canonico/modular/bloques/E1_DESCUBRIMIENTO_OPERATIVO/02_AUDITORIA_DE_OPERACION_REAL.md';
let text = fs.readFileSync(file, 'utf8').replace(/\r\n?/g, '\n');

text = text.replace(/^## (\d+\..*)$/gm, '#### $1');

if (/^## \d+\./m.test(text)) {
  throw new Error('Persisten secciones numeradas fuera de la jerarquía de OPS-AUD-001.');
}

fs.writeFileSync(file, text.replace(/\s+$/u, '') + '\n', 'utf8');
console.log('Jerarquía de OPS-AUD-001 corregida.');
