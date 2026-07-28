import assert from 'node:assert/strict';
import fs from 'node:fs';
import os from 'node:os';
import path from 'node:path';
import test from 'node:test';
import {
  validateScreenClassifications,
  validateScreenStepBindings,
} from './validate-screen-contract-matrices.mjs';

const relative =
  'docs/plan-canonico/modular/bloques/E2_PROCESOS_Y_EXPERIENCIA/05_CONTRATO_DE_PANTALLAS.md';

function fixture() {
  const root = fs.mkdtempSync(path.join(os.tmpdir(), 'vento-screen-matrices-'));
  const target = path.join(root, relative);
  fs.mkdirSync(path.dirname(target), { recursive: true });
  fs.copyFileSync(path.resolve(relative), target);
  return root;
}

test('acepta pasos y clasificaciones reconciliados', () => {
  const root = fixture();
  assert.equal(validateScreenStepBindings({ root }).screens, 177);
  assert.equal(validateScreenClassifications({ root }).matrices, 4);
});

test('rechaza que una guía operativa vuelva a ser supervisión primaria', () => {
  const root = fixture();
  const target = path.join(root, relative);
  const source = fs.readFileSync(target, 'utf8');
  fs.writeFileSync(
    target,
    source.replace(
      '| `VSCREEN-0061` | Receta operativa | `fogo` | `VPROC-0016::STEP-CONSULT_APPLICABLE_RECIPE` | `PRIMARY_OPERATIONAL` | `OUTSIDE_ADMINISTRATIVE_CLASS` | `OUTSIDE_SUPERVISION_CLASS` | `NONE` |',
      '| `VSCREEN-0061` | Receta operativa | `fogo` | `VPROC-0016::STEP-CONSULT_APPLICABLE_RECIPE` | `PRIMARY_OPERATIONAL` | `OUTSIDE_ADMINISTRATIVE_CLASS` | `PRIMARY_SUPERVISION` | `SUPERVISION_CONTROL` |',
    ),
  );
  assert.throws(
    () => validateScreenClassifications({ root }),
    /resultado cuantitativo|clasificaciones primarias|decisión semántica/,
  );
});
