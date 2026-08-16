import assert from 'node:assert/strict';
import test from 'node:test';

import {
  formatTaskBlock,
  formatTaskFileSource,
} from './format-canonical-task.mjs';

test('formatea solo la tarea indicada y conserva el contenido', () => {
  const source = `### [ ] TEST-FMT-001 — Primera
**Bloque:** X
**Estado:** NO INICIADA
#### 1. Propósito
Texto intacto.
---
#### 2. Resultado
Otro texto.

### [ ] TEST-FMT-002 — Segunda
Texto sin tocar.
`;
  const result = formatTaskFileSource(source, { taskId: 'TEST-FMT-001' });
  assert.deepEqual(result.changedTaskIds, ['TEST-FMT-001']);
  assert.match(result.source, /\*\*Estado:\*\* NO INICIADA\n\*\*Bloque:\*\* X/u);
  assert.match(result.source, /#### 1\. Propósito\n\nTexto intacto\./u);
  assert.match(result.source, /Otro texto\.\n\n### \[ \] TEST-FMT-002 — Segunda\nTexto sin tocar\./u);

  const secondPass = formatTaskFileSource(result.source, { taskId: 'TEST-FMT-001' });
  assert.deepEqual(secondPass.changedTaskIds, []);
  assert.equal(secondPass.source, result.source);
});

test('crea un scaffold explícito solo para una tarea no iniciada y vacía', () => {
  const source = '### [ ] TEST-FMT-003 — Vacía\n';
  const result = formatTaskFileSource(source, {
    taskId: 'TEST-FMT-003',
    scaffold: true,
  });
  assert.match(result.source, /\*\*Estado:\*\* NO INICIADA/u);
  assert.match(result.source, /#### 1\. Propósito/u);
  assert.match(result.source, /#### 7\. Resultado y continuidad/u);
  assert.match(result.source, /\[PENDIENTE_DE_DESARROLLO\]/u);
});

test('rechaza scaffold sobre una tarea aprobada', () => {
  assert.throws(
    () => formatTaskBlock('### ✅ TEST-FMT-004 — Aprobada\n', { scaffold: true }),
    /solo puede utilizarse con una tarea NO INICIADA/u,
  );
});
