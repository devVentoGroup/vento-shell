import assert from 'node:assert/strict';
import fs from 'node:fs';
import path from 'node:path';
import test from 'node:test';

import { validatePrintProcessBindingsSource } from './validate-print-process-bindings.mjs';

const baseDir = path.resolve('docs/plan-canonico/modular');
const printSource = fs.readFileSync(
  path.join(baseDir, 'bloques/E4_SERVICIOS_TRANSVERSALES/04_SERVICIO_TRANSVERSAL_DE_IMPRESION.md'),
  'utf8',
);
const purposeSource = fs.readFileSync(
  path.join(baseDir, 'bloques/E2_PROCESOS_Y_EXPERIENCIA/01_02_PROPOSITO_PROPIEDAD_CONSUMIDORES_Y_ACTORES.md'),
  'utf8',
);

test('acepta los 50 vínculos imprimibles reconciliados con el catálogo VPROC vigente', () => {
  const result = validatePrintProcessBindingsSource({ printSource, purposeSource });
  assert.deepEqual(result.errors, []);
  assert.equal(result.stats.outputs, 50);
  assert.equal(result.stats.relations, 108);
});

test('rechaza volver a asignar activos al proceso comercial VPROC-0057', () => {
  const changed = printSource.replace(
    '| `IMP-LBL-12` | Etiqueta de identificación de activo o equipo             | Asignar una identidad física visible a un activo o equipo.                                                   | VPROC-0029',
    '| `IMP-LBL-12` | Etiqueta de identificación de activo o equipo             | Asignar una identidad física visible a un activo o equipo.                                                   | VPROC-0057',
  );
  const result = validatePrintProcessBindingsSource({ printSource: changed, purposeSource });
  assert.match(result.errors.join('\n'), /IMP-LBL-12: procesos esperados VPROC-0029; encontrados VPROC-0057/u);
});

test('rechaza un proceso relacionado ausente del catálogo canónico', () => {
  const changedPurpose = purposeSource.replace(/^\| `VPROC-0029`.*\r?\n/mu, '');
  const result = validatePrintProcessBindingsSource({ printSource, purposeSource: changedPurpose });
  assert.match(result.errors.join('\n'), /proceso inexistente VPROC-0029/u);
});
