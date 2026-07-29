import assert from 'node:assert/strict';
import fs from 'node:fs';
import os from 'node:os';
import path from 'node:path';
import test from 'node:test';
import { readPlanSection } from './read-plan-section.mjs';
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
  fs.writeFileSync(target, readPlanSection(process.cwd(), relative));
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
  const mutated = source.replace(
    /^(\| `VSCREEN-0061`[^\r\n]*?)`OUTSIDE_SUPERVISION_CLASS`(\s*\|\s*)`NONE`(\s*\|)/m,
    '$1`PRIMARY_SUPERVISION`$2`SUPERVISION_CONTROL`$3',
  );
  assert.notEqual(mutated, source, 'el fixture debe localizar la fila de supervisión de VSCREEN-0061');
  fs.writeFileSync(target, mutated);
  assert.throws(
    () => validateScreenClassifications({ root }),
    /resultado cuantitativo|clasificaciones primarias|decisión semántica/,
  );
});
