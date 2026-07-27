import assert from 'node:assert/strict';
import test from 'node:test';

import {
  normalizeApprovedTaskEvidence,
  reconcileTreqRegistrySource,
  updateLatestTaskSummary,
} from './treq-safe-reconcile.mjs';

const row = (id, evidence) =>
  `| \`${id}\` | \`PROC\` | Regla | \`TASK-001\` | crítica | contractual / automatizada | \`TASK-001\` | Paquete | shell / CI | \`IDENTIFICADO\` | Pendiente | Pendiente | ${evidence} | — |`;

test('restaura filas históricas y conserva filas nuevas', () => {
  const baselineSource = [
    '# Registro',
    row('TREQ-PROC-001', 'Aprobada'),
    row('TREQ-PROC-002', 'Aprobada'),
    '',
  ].join('\r\n');
  const currentSource = [
    '# Registro actualizado',
    row('TREQ-PROC-001', 'Propuesta antigua'),
    row('TREQ-PROC-002', 'Aprobada'),
    row('TREQ-PROC-003', 'Nueva'),
    '',
  ].join('\r\n');

  const result = reconcileTreqRegistrySource({
    currentSource,
    baselineSource,
  });

  assert.deepEqual(result.changedExistingIds, ['TREQ-PROC-001']);
  assert.deepEqual(result.newIds, ['TREQ-PROC-003']);
  assert.deepEqual(result.missingBaselineIds, []);
  assert.match(result.candidateSource, /# Registro actualizado/);
  assert.match(result.candidateSource, /TREQ-PROC-001.*Aprobada/);
  assert.match(result.candidateSource, /TREQ-PROC-003.*Nueva/);
  assert.ok(result.candidateSource.includes('\r\n'));
});

test('reconoce filas TREQ con secuencias de cuatro dígitos', () => {
  const baselineSource = `${row('TREQ-PROC-1000', 'Aprobada')}\n`;
  const currentSource = [
    row('TREQ-PROC-1000', 'Corregida'),
    row('TREQ-PROC-1001', 'Nueva'),
    '',
  ].join('\n');

  const result = reconcileTreqRegistrySource({
    currentSource,
    baselineSource,
  });

  assert.deepEqual(result.changedExistingIds, ['TREQ-PROC-1000']);
  assert.deepEqual(result.newIds, ['TREQ-PROC-1001']);
  assert.deepEqual(result.missingBaselineIds, []);
});

test('reporta filas históricas eliminadas y no las inventa', () => {
  const baselineSource = `${row('TREQ-PROC-001', 'Aprobada')}\n`;
  const currentSource = `${row('TREQ-PROC-002', 'Nueva')}\n`;

  const result = reconcileTreqRegistrySource({
    currentSource,
    baselineSource,
  });

  assert.deepEqual(result.missingBaselineIds, ['TREQ-PROC-001']);
  assert.deepEqual(result.newIds, ['TREQ-PROC-002']);
  assert.doesNotMatch(result.candidateSource, /TREQ-PROC-001/);
});

test('preserva cambios históricos que el validador no marcó como erróneos', () => {
  const baselineSource = [
    row('TREQ-PROC-001', 'Aprobada'),
    row('TREQ-PROC-002', 'Texto anterior'),
    '',
  ].join('\n');
  const currentSource = [
    row('TREQ-PROC-001', 'Propuesta antigua'),
    row('TREQ-PROC-002', 'Mejora válida'),
    row('TREQ-PROC-003', 'Nueva'),
    '',
  ].join('\n');

  const result = reconcileTreqRegistrySource({
    currentSource,
    baselineSource,
    restoreIds: new Set(['TREQ-PROC-001']),
  });

  assert.deepEqual(result.changedExistingIds, ['TREQ-PROC-001']);
  assert.deepEqual(result.preservedChangedExistingIds, ['TREQ-PROC-002']);
  assert.match(result.candidateSource, /TREQ-PROC-001.*Aprobada/);
  assert.match(result.candidateSource, /TREQ-PROC-002.*Mejora válida/);
  assert.match(result.candidateSource, /TREQ-PROC-003.*Nueva/);
});

test('normaliza propuesta aprobada solo en filas nuevas seleccionadas', () => {
  const source = [
    row('TREQ-PROC-001', 'Definida en propuesta `NFR-REQ-004`'),
    row('TREQ-PROC-002', 'Definida en propuesta `NFR-REQ-004`'),
    '',
  ].join('\n');

  const result = normalizeApprovedTaskEvidence({
    source,
    rowIds: new Set(['TREQ-PROC-002']),
    approvedTaskIds: new Set(['NFR-REQ-004']),
  });

  assert.match(result, /TREQ-PROC-001.*propuesta `NFR-REQ-004`/);
  assert.match(result, /TREQ-PROC-002.*`NFR-REQ-004` aprobada/);
});

test('actualiza únicamente la última tarea del resumen', () => {
  const source = [
    '| Última tarea incorporada | `NFR-REQ-003` |',
    '| Otra métrica | `NFR-REQ-003` |',
    '',
  ].join('\n');

  const result = updateLatestTaskSummary(source, 'NFR-REQ-004');

  assert.match(result, /Última tarea incorporada \| `NFR-REQ-004`/);
  assert.match(result, /Otra métrica \| `NFR-REQ-003`/);
});
