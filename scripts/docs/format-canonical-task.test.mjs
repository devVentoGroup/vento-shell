import assert from 'node:assert/strict';
import test from 'node:test';

import {
  formatTaskBlock,
  formatTaskFileSource,
  validateTaskPresentation,
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
  assert.match(result.source, /#### 8\. Continuidad/u);
  assert.match(result.source, /\[PENDIENTE_DE_DESARROLLO\]/u);
});

test('rechaza scaffold sobre una tarea aprobada', () => {
  assert.throws(
    () => formatTaskBlock('### ✅ TEST-FMT-004 — Aprobada\n', { scaffold: true }),
    /solo puede utilizarse con una tarea NO INICIADA/u,
  );
});

test('normaliza cabecera compacta y continuidad inline sin frase redundante', () => {
  const source = `### ✅ TEST-FMT-005 — Modelo futuro

**Estado:** APROBADA

**Tarea anterior:** \`TEST-FMT-004 — Anterior\`

**Tarea siguiente:** \`TEST-FMT-006 — Siguiente\`

**Tipo de tarea:** Documental

**Bloque:** X — Prueba

---

#### 1. Propósito

Texto intacto.

---

#### 2. Continuidad

**ÚLTIMA TAREA APROBADA**

\`\`\`text
TEST-FMT-004 — Anterior
\`\`\`

**TAREA ACTUAL APROBADA**

\`\`\`text
TEST-FMT-005 — Modelo futuro
\`\`\`

**SIGUIENTE TAREA RESERVADA**

\`\`\`text
TEST-FMT-006 — Siguiente
\`\`\`

No se inicia \`TEST-FMT-006\` en esta tarea.
`;
  const formatted = formatTaskBlock(source);
  assert.match(formatted, /\*\*Estado:\*\* APROBADA\n\*\*Tarea anterior:\*\* TEST-FMT-004/u);
  assert.doesNotMatch(formatted, /```text|No se inicia/u);
  assert.match(
    formatted,
    /\*\*ÚLTIMA TAREA APROBADA\*\*\n`TEST-FMT-004 — Anterior`\n\n\*\*TAREA ACTUAL APROBADA\*\*\n`TEST-FMT-005 — Modelo futuro`/u,
  );
  assert.deepEqual(validateTaskPresentation(formatted), []);
});

test('añade continuidad prospectiva cuando la tarea desarrollada todavía no la contiene', () => {
  const source = `### [ ] TEST-FMT-006 — Con desarrollo

**Estado:** NO INICIADA
**Tarea anterior:** TEST-FMT-005 — Anterior
**Tarea siguiente:** TEST-FMT-007 — Siguiente
**Tipo de tarea:** Documental
**Bloque:** X — Prueba

---

#### 1. Propósito

Texto.
`;
  const formatted = formatTaskBlock(source);
  assert.match(formatted, /#### 2\. Continuidad/u);
  assert.match(formatted, /`TEST-FMT-006 — Con desarrollo`/u);
  assert.deepEqual(validateTaskPresentation(formatted), []);
});

test('inserta el separador estructural de cabecera cuando fue omitido', () => {
  const source = `### ✅ TEST-FMT-007 — Sin separador

**Estado:** APROBADA
**Tarea anterior:** TEST-FMT-006 — Anterior
**Tarea siguiente:** TEST-FMT-008 — Siguiente
**Tipo de tarea:** Documental
**Bloque:** X — Prueba

#### 1. Propósito

Texto.

#### 2. Continuidad

**ÚLTIMA TAREA APROBADA**
\`TEST-FMT-006 — Anterior\`

**TAREA ACTUAL APROBADA**
\`TEST-FMT-007 — Sin separador\`

**SIGUIENTE TAREA RESERVADA**
\`TEST-FMT-008 — Siguiente\`
`;
  const formatted = formatTaskBlock(source);
  assert.match(formatted, /\*\*Bloque:\*\* X — Prueba\n\n---\n\n#### 1\. Propósito/u);
  assert.deepEqual(validateTaskPresentation(formatted), []);
});
