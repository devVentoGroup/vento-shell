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
  'docs/plan-canonico/modular/bloques/I_NAVEGACION_Y_PANTALLAS/04_DEPURACION_DE_VISTAS_Y_RUTAS_TECNICAS.md',
  'docs/plan-canonico/modular/bloques/I_NAVEGACION_Y_PANTALLAS/05_AUTORIZACION_DE_VISTAS_Y_ACCIONES.md',
  'docs/plan-canonico/modular/bloques/D_MATRICES/08_REVISION_CONTRACTUAL_PREVIA_DATASETS.md',
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
  assert.deepEqual(stats.readAssignments, { ASSIGNED: 125, BLOCKED: 38, NOT_APPLICABLE: 101 });
});

test('rechaza una clave de lectura fuera del catálogo contractual', () => {
  const root = fixture();
  const target = path.join(root, files[4]);
  const source = fs.readFileSync(target, 'utf8');
  const mutated = source.replace('`nexo.inventory.adjustments.view`', '`nexo.inventory.invented.view`');
  assert.notEqual(mutated, source);
  fs.writeFileSync(target, mutated);
  assert.throws(
    () => validateBlockISurfaceMatrices({ root }),
    /NEXO-ROUTE-002.*fuera de vento\.authorization@1\.0\.0/,
  );
});

test('rechaza cambiar la elegibilidad heredada por AUTH-UI-030', () => {
  const root = fixture();
  const target = path.join(root, files[4]);
  const source = fs.readFileSync(target, 'utf8');
  const mutated = source.replace(
    /(\| `NEXO-ROUTE-002`\s+\| )`FUNCTIONAL_VIEW_PERMISSION_ELIGIBLE`/,
    '$1`SYSTEM_RUNTIME_STATE_NO_VIEW_PERMISSION`',
  );
  assert.notEqual(mutated, source);
  fs.writeFileSync(target, mutated);
  assert.throws(
    () => validateBlockISurfaceMatrices({ root }),
    /NEXO-ROUTE-002 cambia la clase de elegibilidad/,
  );
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
