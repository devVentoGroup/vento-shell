import assert from 'node:assert/strict';
import fs from 'node:fs';
import os from 'node:os';
import path from 'node:path';
import test from 'node:test';
import { validateProcessApplicationIntegrity } from './validate-process-application-integrity.mjs';

const FILES = [
  'docs/plan-canonico/modular/bloques/E2_PROCESOS_Y_EXPERIENCIA/01_CATALOGO_DE_PROCESOS.md',
  'docs/plan-canonico/modular/bloques/C_CATALOGO/01_APLICACIONES_Y_CONVENCION.md',
];

function fixture() {
  const root = fs.mkdtempSync(path.join(os.tmpdir(), 'vento-process-apps-'));
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

test('acepta las matrices proceso-aplicación vigentes', () => {
  const stats = validateProcessApplicationIntegrity({ root: fixture() });
  assert.equal(stats.processes, 69);
  assert.equal(stats.directRelationships, 278);
  assert.equal(stats.conditionalRelationships, 77);
});

test('rechaza una propietaria sin app_code canónico', () => {
  const root = fixture();
  mutate(
    root,
    '| `VPROC-0005` | `ASIS-SRC-005` | Planear dotación y ejecutar selección sin mezclar necesidad laboral, candidato y trabajador activo | `viso`',
    '| `VPROC-0005` | `ASIS-SRC-005` | Planear dotación y ejecutar selección sin mezclar necesidad laboral, candidato y trabajador activo | `talento`'
  );
  assert.throws(() => validateProcessApplicationIntegrity({ root }), /propietaria no canónica talento/);
});

test('rechaza que la propietaria aparezca como consumidora', () => {
  const root = fixture();
  mutate(
    root,
    '| `VPROC-0005` | `viso`      | —',
    '| `VPROC-0005` | `viso`      | `viso`'
  );
  assert.throws(() => validateProcessApplicationIntegrity({ root }), /incluye a su propietaria viso como consumidora/);
});
