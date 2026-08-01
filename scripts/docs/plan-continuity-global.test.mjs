import assert from 'node:assert/strict';
import test from 'node:test';

import {
  calculateCompletionPercentage,
  resolveHandoff,
  resolveContinuity,
} from './plan-continuity-global.mjs';

function task(id, state) {
  return {
    id,
    title: `Título ${id}`,
    state,
    marker: state === 'APROBADA' ? '✅' : '[ ]',
    relativePath: 'fragmento.md',
  };
}

test('avanza automáticamente a la primera tarea no aprobada', () => {
  const taskMap = new Map([
    ['PROC-CAT-020', task('PROC-CAT-020', 'APROBADA')],
    ['PROC-ACTOR-010', task('PROC-ACTOR-010', 'APROBADA')],
    ['UX-STATION-001', task('UX-STATION-001', 'NO INICIADA')],
    ['OPS-CAN-001', task('OPS-CAN-001', 'NO INICIADA')],
  ]);

  const result = resolveContinuity(taskMap, [
    'PROC-CAT-020',
    'PROC-ACTOR-010',
    'UX-STATION-001',
    'OPS-CAN-001',
  ]);

  assert.equal(result.isComplete, false);
  assert.equal(result.lastApproved.id, 'PROC-ACTOR-010');
  assert.equal(result.current.id, 'UX-STATION-001');
  assert.equal(result.next.id, 'OPS-CAN-001');
});

test('acepta una secuencia totalmente aprobada como estado terminal', () => {
  const taskMap = new Map([
    ['PROC-CAT-020', task('PROC-CAT-020', 'APROBADA')],
    ['PROC-ACTOR-010', task('PROC-ACTOR-010', 'APROBADA')],
    ['UX-STATION-001', task('UX-STATION-001', 'APROBADA')],
  ]);

  const result = resolveContinuity(taskMap, [
    'PROC-CAT-020',
    'PROC-ACTOR-010',
    'UX-STATION-001',
  ]);

  assert.equal(result.isComplete, true);
  assert.equal(result.lastApproved.id, 'UX-STATION-001');
  assert.equal(result.current, null);
  assert.equal(result.next, null);
});

test('mantiene un handoff reservado fuera de la secuencia que cierra', () => {
  const taskMap = new Map([
    ['SUPA-TRANS-016', task('SUPA-TRANS-016', 'PROPUESTA PARA APROBACIÓN')],
    ['SHELL-AUD-001', task('SHELL-AUD-001', 'NO INICIADA')],
  ]);
  const handoff = resolveHandoff(taskMap, {
    handoff_task_id: 'SHELL-AUD-001',
    handoff_sequence_id: 'H-SHARED-AUDIT-001',
  }, ['SUPA-TRANS-016']);

  assert.equal(handoff.id, 'SHELL-AUD-001');
  assert.equal(handoff.handoffSequenceId, 'H-SHARED-AUDIT-001');
});

test('rechaza iniciar el handoff antes de activar su secuencia', () => {
  const taskMap = new Map([
    ['SUPA-TRANS-016', task('SUPA-TRANS-016', 'APROBADA')],
    ['SHELL-AUD-001', task('SHELL-AUD-001', 'PROPUESTA PARA APROBACIÓN')],
  ]);

  assert.throws(
    () => resolveHandoff(taskMap, {
      handoff_task_id: 'SHELL-AUD-001',
      handoff_sequence_id: 'H-SHARED-AUDIT-001',
    }, ['SUPA-TRANS-016']),
    /debe permanecer NO INICIADA/
  );
});

test('rechaza aprobaciones fuera del orden declarado', () => {
  const taskMap = new Map([
    ['PROC-CAT-020', task('PROC-CAT-020', 'APROBADA')],
    ['UX-STATION-001', task('UX-STATION-001', 'NO INICIADA')],
    ['OPS-CAN-001', task('OPS-CAN-001', 'APROBADA')],
  ]);

  assert.throws(
    () => resolveContinuity(taskMap, [
      'PROC-CAT-020',
      'UX-STATION-001',
      'OPS-CAN-001',
    ]),
    /aprobaciones fuera de orden/
  );
});

test('calcula el porcentaje de completamiento con dos decimales', () => {
  assert.equal(calculateCompletionPercentage(340, 1575), 21.59);
  assert.equal(calculateCompletionPercentage(0, 0), 0);
  assert.equal(calculateCompletionPercentage(1575, 1575), 100);
});
