import assert from 'node:assert/strict';
import fs from 'node:fs';
import os from 'node:os';
import path from 'node:path';
import test from 'node:test';
import { validateScreenCatalog } from './validate-screen-catalog.mjs';

const FILES = [
  'docs/plan-canonico/modular/bloques/E2_PROCESOS_Y_EXPERIENCIA/05_CONTRATO_DE_PANTALLAS.md',
  'docs/plan-canonico/modular/bloques/E2_PROCESOS_Y_EXPERIENCIA/01_CATALOGO_DE_PROCESOS.md',
  'docs/plan-canonico/modular/bloques/C_CATALOGO/01_APLICACIONES_Y_CONVENCION.md',
];

function fixture() {
  const root = fs.mkdtempSync(path.join(os.tmpdir(), 'vento-screen-catalog-'));
  for (const relativePath of FILES) {
    const destination = path.join(root, relativePath);
    fs.mkdirSync(path.dirname(destination), { recursive: true });
    fs.copyFileSync(path.resolve(relativePath), destination);
  }
  return root;
}

function mutate(root, search, replacement) {
  const relativePath = FILES[0];
  const fullPath = path.join(root, relativePath);
  const source = fs.readFileSync(fullPath, 'utf8');
  assert.ok(source.includes(search), `fixture no contiene ${search}`);
  fs.writeFileSync(fullPath, source.replace(search, replacement));
}

test('acepta el catálogo canónico vigente', () => {
  const root = fixture();
  assert.equal(validateScreenCatalog({ root }).screens, 175);
});

test('rechaza una pantalla faltante aunque los demás documentos existan', () => {
  const root = fixture();
  mutate(root, '| `VSCREEN-0164`', '| `VSCREEN-9999`');
  assert.throws(() => validateScreenCatalog({ root }), /secuencia de pantallas se rompe/);
});

test('rechaza la transferencia silenciosa de una pantalla PASS', () => {
  const root = fixture();
  mutate(
    root,
    '| `VSCREEN-0164` | Revisión, checkout e inicio de pago                   | `pass`',
    '| `VSCREEN-0164` | Revisión, checkout e inicio de pago                   | `viso`'
  );
  assert.throws(
    () => validateScreenCatalog({ root }),
    /distribución de viso|VSCREEN-0164 debe existir y permanecer vinculado con pass/
  );
});

test('rechaza cobertura incompleta o referencias a procesos inexistentes', () => {
  const root = fixture();
  mutate(root, '| `VPROC-0069`           | `COVERED`', '| `VPROC-0070`           | `COVERED`');
  assert.throws(() => validateScreenCatalog({ root }), /procesos sin disposición de cobertura/);
});
