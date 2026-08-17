import assert from 'node:assert/strict';
import test from 'node:test';

import fs from 'node:fs';
import path from 'node:path';

import {
  validateTaskDevelopmentPolicy,
  validateTaskSemanticContract,
} from './task-semantic-contract.mjs';

const policy = {
  required_header_fields: [
    'Estado',
    'Tarea anterior',
    'Tarea siguiente',
    'Tipo de tarea',
    'Bloque',
    'Repositorio propietario',
    'Archivo propietario',
    'Estado físico resultante',
    'Cambios físicos autorizados',
    'Requisitos de prueba creados o modificados',
  ],
  required_section_groups: [
    { label: 'propósito', pattern: 'Propósito|Objetivo' },
    { label: 'pruebas', pattern: 'Requisitos de prueba derivados' },
    { label: 'evidencia', pattern: 'Evidencia de validación' },
    { label: 'aceptación', pattern: 'Criterios de aceptación' },
    { label: 'límites', pattern: 'Límites' },
    { label: 'continuidad', pattern: 'Continuidad' },
  ],
  forbidden_placeholder_pattern: '\\[PENDIENTE[^\\]]*\\]|<[A-Z][A-Z0-9_-]*>',
  required_evidence_classes: ['BUILD', 'LOCAL', 'REMOTA', 'OPERATIVA', 'FÍSICA'],
  allowed_evidence_statuses: ['PASS', 'FAIL', 'NOT_EXECUTED', 'NOT_APPLICABLE'],
  blocking_codes: [
    'EMPTY_DRAFT',
    'PRESENTATION',
    'OWNER_FILE_MISMATCH',
    'OWNER_REPOSITORY_MISSING',
    'PHYSICAL_SCOPE_CONTRADICTION',
    'UNRESOLVED_PLACEHOLDER',
    'UNKNOWN_TASK_REFERENCE',
    'EVIDENCE_STATUS_INVALID',
    'EVIDENCE_MISSING',
    'TREQ_COUNT_CONTRADICTION',
  ],
};

const validBlock = `### ✅ TEST-SEM-011 — Tarea válida

**Estado:** APROBADA
**Tarea anterior:** TEST-SEM-010 — Anterior
**Tarea siguiente:** TEST-SEM-012 — Siguiente
**Tipo de tarea:** Documental
**Bloque:** X
**Repositorio propietario:** \`devVentoGroup/vento-shell\`
**Archivo propietario:** \`docs/plan-canonico/modular/bloques/X/test.md\`
**Estado físico resultante:** \`ESPECIFICADO_NO_MATERIALIZADO\`
**Cambios físicos autorizados:** ninguno
**Requisitos de prueba creados o modificados:** 0

---

#### 1. Propósito
Texto.

#### 2. Requisitos de prueba derivados
**Resultado:** NO GENERA REQUISITOS DE PRUEBA

#### 3. Evidencia de validación
| Clase | Estado | Evidencia |
| --- | --- | --- |
| BUILD | PASS | docs:plan:build completado |
| LOCAL | PASS | pruebas unitarias completadas |
| REMOTA | NOT_EXECUTED | no requerida |
| OPERATIVA | NOT_EXECUTED | no requerida |
| FÍSICA | NOT_EXECUTED | no requerida |

#### 4. Criterios de aceptación
Texto.

#### 5. Límites
No autoriza implementación.

#### 6. Continuidad
**ÚLTIMA TAREA APROBADA**
\`TEST-SEM-010 — Anterior\`

**TAREA ACTUAL APROBADA**
\`TEST-SEM-011 — Tarea válida\`

**SIGUIENTE TAREA RESERVADA**
\`TEST-SEM-012 — Siguiente\`
`;

const inventory = new Map([
  ['TEST-SEM-010', {}],
  ['TEST-SEM-011', {}],
  ['TEST-SEM-012', {}],
]);

test('la política material prospectiva es válida', () => {
  const materialPolicy = JSON.parse(fs.readFileSync(
    path.resolve('docs/plan-canonico/modular/task-development-policy.json'),
    'utf8',
  ));
  assert.deepEqual(validateTaskDevelopmentPolicy(materialPolicy), []);
});

test('acepta una tarea aprobada completa y con evidencia tipada', () => {
  const result = validateTaskSemanticContract({
    block: validBlock,
    task: { id: 'TEST-SEM-011', state: 'APROBADA' },
    ownerRelativePath: 'bloques/X/test.md',
    inventory,
    policy,
  });
  assert.deepEqual(result.errors, []);
  assert.deepEqual(result.warnings, []);
});

test('no confunde artefacto independiente con evidencia pendiente', () => {
  const block = validBlock.replace(
    'pruebas unitarias completadas',
    'El artefacto independiente fue comprobado estructuralmente contra la política',
  );
  const result = validateTaskSemanticContract({
    block,
    task: { id: 'TEST-SEM-011', state: 'APROBADA' },
    ownerRelativePath: 'bloques/X/test.md',
    inventory,
    policy,
  });
  assert.ok(!result.errors.some(({ code }) => code === 'EVIDENCE_MISSING'));
});

test('sigue rechazando un PASS que declara evidencia pendiente', () => {
  const block = validBlock.replace(
    'pruebas unitarias completadas',
    'Evidencia pendiente de ejecución local',
  );
  const result = validateTaskSemanticContract({
    block,
    task: { id: 'TEST-SEM-011', state: 'APROBADA' },
    ownerRelativePath: 'bloques/X/test.md',
    inventory,
    policy,
  });
  assert.ok(result.errors.some(({ code }) => code === 'EVIDENCE_MISSING'));
});

test('acepta cero como declaración explícita de cambios físicos no autorizados', () => {
  const result = validateTaskSemanticContract({
    block: validBlock.replace('**Cambios físicos autorizados:** ninguno', '**Cambios físicos autorizados:** 0'),
    task: { id: 'TEST-SEM-011', state: 'APROBADA' },
    ownerRelativePath: 'bloques/X/test.md',
    inventory,
    policy,
  });
  assert.ok(!result.errors.some(({ code }) => code === 'PHYSICAL_SCOPE_CONTRADICTION'));
});

test('durante desarrollo convierte incumplimientos en advertencias', () => {
  const result = validateTaskSemanticContract({
    block: validBlock.replace('### ✅', '### [ ]').replace('APROBADA', 'NO INICIADA').replace(
      '#### 3. Evidencia de validación',
      '#### 3. Evidencia pendiente',
    ),
    task: { id: 'TEST-SEM-011', state: 'NO INICIADA' },
    ownerRelativePath: 'bloques/X/test.md',
    inventory,
    policy,
  });
  assert.equal(result.errors.length, 0);
  assert.ok(result.warnings.some(({ code }) => code === 'SECTION_MISSING'));
});

test('una tarea aprobada no puede conservar placeholders', () => {
  const result = validateTaskSemanticContract({
    block: validBlock.replace('Texto.', '[PENDIENTE_DE_DESARROLLO]'),
    task: { id: 'TEST-SEM-011', state: 'APROBADA' },
    ownerRelativePath: 'bloques/X/test.md',
    inventory,
    policy,
  });
  assert.ok(result.errors.some(({ code }) => code === 'UNRESOLVED_PLACEHOLDER'));
});

test('una tarea aprobada con formato histórico recibe recomendaciones sin bloquear', () => {
  const historicalBlock = validBlock
    .replace(/^\*\*(?:Repositorio propietario|Archivo propietario|Estado físico resultante|Cambios físicos autorizados|Requisitos de prueba creados o modificados):\*\*.*\n/gmu, '')
    .replace(/\n#### 3\. Evidencia de validación[\s\S]*?(?=\n#### 4\.)/u, '')
    .replace(/\n#### 5\. Límites[\s\S]*?(?=\n#### 6\.)/u, '');
  const result = validateTaskSemanticContract({
    block: historicalBlock,
    task: { id: 'TEST-SEM-011', state: 'APROBADA' },
    ownerRelativePath: 'bloques/X/test.md',
    inventory,
    policy,
  });
  assert.deepEqual(result.errors, []);
  assert.ok(result.warnings.some(({ code }) => code === 'HEADER_FIELD_MISSING'));
  assert.ok(result.warnings.some(({ code }) => code === 'SECTION_MISSING'));
  assert.ok(result.warnings.some(({ code }) => code === 'EVIDENCE_CLASS_CARDINALITY'));
  assert.ok(!result.warnings.some(({ code }) => code === 'TREQ_COUNT_CONTRADICTION'));
});

test('la ausencia del contador TREQ no se interpreta como contradicción', () => {
  const blockWithoutCount = validBlock.replace(
    /^\*\*Requisitos de prueba creados o modificados:\*\*.*\n/mu,
    '',
  );
  const result = validateTaskSemanticContract({
    block: blockWithoutCount,
    task: { id: 'TEST-SEM-011', state: 'APROBADA' },
    ownerRelativePath: 'bloques/X/test.md',
    inventory,
    policy,
  });
  assert.ok(![...result.errors, ...result.warnings]
    .some(({ code }) => code === 'TREQ_COUNT_CONTRADICTION'));
});
