import assert from 'node:assert/strict';
import fs from 'node:fs';
import os from 'node:os';
import path from 'node:path';
import test from 'node:test';
import { validateBlockISurfaceMatrices } from './validate-block-i-surface-matrices.mjs';

const files = [
  'docs/plan-canonico/modular/bloques/I_NAVEGACION_Y_PANTALLAS/01_INVENTARIO_COMPLETO_DE_SUPERFICIES.md',
  'docs/plan-canonico/modular/bloques/I_NAVEGACION_Y_PANTALLAS/02_VINCULACION_CON_PROCESOS_Y_APLICACIONES.md',
  'docs/plan-canonico/modular/bloques/I_NAVEGACION_Y_PANTALLAS/03_CLASIFICACION_FUNCIONAL_Y_CONTEXTO_DE_USO.md',
];

function fixture() {
  const root = fs.mkdtempSync(path.join(os.tmpdir(), 'vento-block-i-'));
  for (const relative of files) {
    const target = path.join(root, relative);
    fs.mkdirSync(path.dirname(target), { recursive: true });
    fs.copyFileSync(path.join(process.cwd(), relative), target);
  }
  return root;
}

test('acepta las matrices AS-IS reconciliadas del BLOQUE I', () => {
  const stats = validateBlockISurfaceMatrices({ root: process.cwd() });
  assert.equal(stats.rows, 264);
  assert.equal(stats.renderedViews, 252);
  assert.equal(stats.passSurfaces, 21);
  assert.equal(stats.redirects, 5);
});

test('rechaza que un redirect vuelva a contarse como vista operativa', () => {
  const root = fixture();
  const target = path.join(root, files[2]);
  const source = fs.readFileSync(target, 'utf8');
  const mutated = source.replace(
    /(\| `NEXO-ROUTE-055`[^\r\n]*?)`false`(\s*\|\s*)`REDIRECT_INHERITED`/,
    '$1`true`$2`HYBRID_OPERATION`',
  );
  assert.notEqual(mutated, source);
  fs.writeFileSync(target, mutated);
  assert.throws(
    () => validateBlockISurfaceMatrices({ root }),
    /NEXO-ROUTE-055|redirect|operativa/,
  );
});

test('rechaza omitir una superficie cliente de PASS', () => {
  const root = fixture();
  const target = path.join(root, files[1]);
  const source = fs.readFileSync(target, 'utf8');
  const mutated = source.replace(/^\| `PASS-CUSTOMER-SURFACE-014`[^\r\n]*\r?\n/m, '');
  assert.notEqual(mutated, source);
  fs.writeFileSync(target, mutated);
  assert.throws(
    () => validateBlockISurfaceMatrices({ root }),
    /263 filas|PASS-CUSTOMER-SURFACE-014|cobertura/,
  );
});
