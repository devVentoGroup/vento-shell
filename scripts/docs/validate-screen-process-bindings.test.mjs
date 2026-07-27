import assert from 'node:assert/strict';
import fs from 'node:fs';
import os from 'node:os';
import path from 'node:path';
import test from 'node:test';
import { validateScreenProcessBindings } from './validate-screen-process-bindings.mjs';

const FILES = [
  'docs/plan-canonico/modular/bloques/E2_PROCESOS_Y_EXPERIENCIA/05_CONTRATO_DE_PANTALLAS.md',
  'docs/plan-canonico/modular/bloques/E2_PROCESOS_Y_EXPERIENCIA/01_CATALOGO_DE_PROCESOS.md',
];

function fixture() {
  const root = fs.mkdtempSync(path.join(os.tmpdir(), 'vento-screen-process-'));
  for (const relativePath of FILES) {
    const destination = path.join(root, relativePath);
    fs.mkdirSync(path.dirname(destination), { recursive: true });
    fs.copyFileSync(path.resolve(relativePath), destination);
  }
  return root;
}

function mutate(root, search, replacement) {
  const fullPath = path.join(root, FILES[0]);
  const source = fs.readFileSync(fullPath, 'utf8');
  assert.ok(source.includes(search), `fixture no contiene ${search}`);
  fs.writeFileSync(fullPath, source.replace(search, replacement));
}

test('acepta los 175 vínculos pantalla-proceso propuestos', () => {
  const stats = validateScreenProcessBindings({ root: fixture() });
  assert.equal(stats.screens, 175);
  assert.equal(stats.primaryBindings, 175);
  assert.equal(stats.coveredProcesses, 67);
  assert.equal(stats.deferredProcesses, 2);
});

test('rechaza una pantalla sin vínculo', () => {
  const root = fixture();
  mutate(root, '| `VSCREEN-0164` | Revisión, checkout e inicio de pago', '| `VSCREEN-9999` | Revisión, checkout e inicio de pago');
  assert.throws(() => validateScreenProcessBindings({ root }), /no existe en SCREEN-CANONICAL-CATALOG-001/);
});

test('rechaza un proceso inexistente', () => {
  const root = fixture();
  mutate(root, '| `VSCREEN-0171` | Calificación y satisfacción | `pass` | `VPROC-0068`', '| `VSCREEN-0171` | Calificación y satisfacción | `pass` | `VPROC-9999`');
  assert.throws(() => validateScreenProcessBindings({ root }), /proceso primario inexistente VPROC-9999/);
});

test('rechaza propiedad silenciosa desde un canal PASS', () => {
  const root = fixture();
  mutate(
    root,
    '| `VSCREEN-0164` | Revisión, checkout e inicio de pago | `pass` | `VPROC-0043` | `VPROC-0039`, `VPROC-0042` | `CUSTOMER_CHANNEL`',
    '| `VSCREEN-0164` | Revisión, checkout e inicio de pago | `pass` | `VPROC-0043` | `VPROC-0039`, `VPROC-0042` | `OWNER_WORKSPACE`'
  );
  assert.throws(() => validateScreenProcessBindings({ root }), /pertenece a pulso/);
});

test('rechaza vincular un proceso AURA diferido', () => {
  const root = fixture();
  mutate(root, '| `VSCREEN-0123` | Gestión de comunicaciones internas | `viso` | `VPROC-0004`', '| `VSCREEN-0123` | Gestión de comunicaciones internas | `viso` | `VPROC-0056`');
  assert.throws(() => validateScreenProcessBindings({ root }), /vincula el proceso diferido VPROC-0056/);
});
