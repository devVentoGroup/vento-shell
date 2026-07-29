import assert from 'node:assert/strict';
import fs from 'node:fs';
import path from 'node:path';
import test from 'node:test';

import {
  validateEventApplicationBlockSource,
} from './validate-event-application-block.mjs';

const baseDir = path.resolve('docs/plan-canonico/modular');
const validBlockSource = fs.readFileSync(
  path.join(
    baseDir,
    'bloques/X_INTEGRACIONES/01_EVENTOS_ENTRE_APLICACIONES.md',
  ),
  'utf8',
);
const validRegistrySource = fs.readFileSync(
  path.join(
    baseDir,
    'bloques/E1_DESCUBRIMIENTO_OPERATIVO/04A_REGISTRO_CANONICO_DE_REQUISITOS_DE_PRUEBA.md',
  ),
  'utf8',
);

function validate(blockSource = validBlockSource, registrySource = validRegistrySource) {
  return validateEventApplicationBlockSource({ blockSource, registrySource });
}

test('acepta el cierre integral vigente de INT-APP', () => {
  const result = validate();
  assert.deepEqual(result.errors, []);
  assert.equal(result.stats.tasks, 10);
  assert.equal(result.stats.treqRequirements, 294);
});

test('rechaza una tarea ausente o fuera del conjunto aprobado', () => {
  const result = validate(
    validBlockSource.replace(
      '### ✅ INT-APP-006 — Definir compensaciones',
      '### [ ] INT-APP-006 — Definir compensaciones',
    ),
  );
  assert.match(result.errors.join('\n'), /orden o conjunto INT-APP/u);
});

test('rechaza continuidad interna contradictoria', () => {
  const result = validate(
    validBlockSource.replace(
      '**Siguiente tarea:** `INT-APP-008 — Definir estados pendientes de sincronización`',
      '**Siguiente tarea:** `INT-APP-009 — Definir manejo de errores parciales`',
    ),
  );
  assert.match(
    result.errors.join('\n'),
    /INT-APP-007: la siguiente tarea declarada es incoherente/u,
  );
});

test('rechaza omitir un requisito derivado o cambiar su origen', () => {
  const result = validate(
    validBlockSource,
    validRegistrySource.replace(
      /^\| `TREQ-INTEGRATION-193`.*\r?\n/mu,
      '',
    ),
  );
  assert.match(result.errors.join('\n'), /falta TREQ-INTEGRATION-193/u);
});

test('rechaza mantener como pendiente la validación de un bloque cerrado', () => {
  const result = validate(
    `${validBlockSource}\nVALIDACIÓN REAL DEL REPOSITORIO PENDIENTE DE EJECUCIÓN LOCAL\n`,
  );
  assert.match(
    result.errors.join('\n'),
    /conserva una validación local como pendiente/u,
  );
});
