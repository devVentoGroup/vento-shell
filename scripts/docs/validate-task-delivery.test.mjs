import assert from 'node:assert/strict';
import fs from 'node:fs';
import os from 'node:os';
import path from 'node:path';
import test from 'node:test';

import { validateContract, validateTask } from './validate-task-delivery.mjs';

const contract = JSON.parse(
  fs.readFileSync('docs/plan-canonico/modular/delivery-contract.json', 'utf8'),
);

test('acepta el contrato modular vigente', () => {
  assert.deepEqual(validateContract(contract), []);
});

test('valida una entrega aprobada sin TREQ nuevos', (t) => {
  const directory = fs.mkdtempSync(path.join(os.tmpdir(), 'vento-delivery-'));
  t.after(() => fs.rmSync(directory, { recursive: true, force: true }));
  const taskPath = path.join(directory, 'TEST-DEL-001_APROBADA_PARA_REEMPLAZAR.md');
  fs.writeFileSync(taskPath, `### ✅ TEST-DEL-001 — Entrega

**Estado:** APROBADA

#### 1. Requisitos de prueba derivados

**Resultado:** NO GENERA REQUISITOS DE PRUEBA
`, 'utf8');
  const result = validateTask({ taskPath, contract });
  assert.deepEqual(result.errors, []);
  assert.equal(result.taskId, 'TEST-DEL-001');
  assert.equal(result.requiresRegistry, false);
});

test('rechaza un contrato que permita el registro monolítico legacy', () => {
  const invalid = structuredClone(contract);
  invalid.registry_artifact.allow_legacy_monolithic_delivery = true;
  assert.match(validateContract(invalid).join('\n'), /debe permanecer en false/u);
});
