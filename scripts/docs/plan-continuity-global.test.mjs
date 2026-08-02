import assert from 'node:assert/strict';
import test from 'node:test';

import {
  calculateCompletionPercentage,
  expandSequenceSegments,
  resolveHandoff,
  resolveContinuity,
} from './plan-continuity-global.mjs';
import { resolveContinuityRoute } from './continuity-route.mjs';

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

test('deriva la etapa activa y el handoff sin rangos configurados manualmente', () => {
  const taskMap = new Map([
    ['PRE-TEST-001', task('PRE-TEST-001', 'APROBADA')],
    ['TEST-A-001', task('TEST-A-001', 'APROBADA')],
    ['TEST-A-002', task('TEST-A-002', 'APROBADA')],
    ['TEST-B-001', task('TEST-B-001', 'NO INICIADA')],
    ['TEST-B-002', task('TEST-B-002', 'NO INICIADA')],
  ]);
  const route = {
    schema_version: 1,
    route_id: 'TEST-ROUTE-001',
    entry_task_id: 'PRE-TEST-001',
    latest_treq_task_id: 'PRE-TEST-001',
    stages: [
      {
        sequence_id: 'TEST-A-SEQUENCE-001',
        block_code: 'BLOQUE A',
        block_title: 'A',
        selectors: [{ prefix: 'TEST-A' }],
      },
      {
        sequence_id: 'TEST-B-SEQUENCE-001',
        block_code: 'BLOQUE B',
        block_title: 'B',
        selectors: [{ prefix: 'TEST-B' }],
      },
    ],
  };

  const active = resolveContinuityRoute(route, taskMap);

  assert.equal(active.sequence_id, 'TEST-B-SEQUENCE-001');
  assert.equal(active.previous_task_id, 'TEST-A-002');
  assert.equal(active.handoff_task_id, null);
  assert.deepEqual(expandSequenceSegments(active.segments), ['TEST-B-001', 'TEST-B-002']);
});

test('incorpora una tarea nueva al prefijo y reabre automáticamente su etapa', () => {
  const taskMap = new Map([
    ['PRE-TEST-001', task('PRE-TEST-001', 'APROBADA')],
    ['TEST-A-001', task('TEST-A-001', 'APROBADA')],
    ['TEST-A-002', task('TEST-A-002', 'APROBADA')],
    ['TEST-A-003', task('TEST-A-003', 'NO INICIADA')],
    ['TEST-B-001', task('TEST-B-001', 'NO INICIADA')],
  ]);
  const active = resolveContinuityRoute({
    schema_version: 1,
    route_id: 'TEST-ROUTE-001',
    entry_task_id: 'PRE-TEST-001',
    latest_treq_task_id: 'PRE-TEST-001',
    stages: [
      {
        sequence_id: 'TEST-A-SEQUENCE-001',
        block_code: 'BLOQUE A',
        block_title: 'A',
        selectors: [{ prefix: 'TEST-A' }],
      },
      {
        sequence_id: 'TEST-B-SEQUENCE-001',
        block_code: 'BLOQUE B',
        block_title: 'B',
        selectors: [{ prefix: 'TEST-B' }],
      },
    ],
  }, taskMap);

  assert.equal(active.sequence_id, 'TEST-A-SEQUENCE-001');
  assert.equal(active.handoff_task_id, 'TEST-B-001');
  assert.deepEqual(expandSequenceSegments(active.segments), [
    'TEST-A-001',
    'TEST-A-002',
    'TEST-A-003',
  ]);
});

test('proyecta solo pendientes y conserva el orden después de adelantos aprobados', () => {
  const taskMap = new Map([
    ['PRE-TEST-001', task('PRE-TEST-001', 'APROBADA')],
    ['TEST-A-001', task('TEST-A-001', 'APROBADA')],
    ['TEST-A-002', task('TEST-A-002', 'NO INICIADA')],
    ['TEST-A-003', task('TEST-A-003', 'APROBADA')],
    ['TEST-A-004', task('TEST-A-004', 'NO INICIADA')],
  ]);

  const active = resolveContinuityRoute({
    schema_version: 1,
    route_id: 'TEST-ROUTE-001',
    entry_task_id: 'PRE-TEST-001',
    latest_treq_task_id: 'PRE-TEST-001',
    coverage_policy: 'ALL_CANONICAL_TASKS_EXACTLY_ONCE',
    projection_policy: 'PENDING_TASKS_ONLY',
    stages: [{
      sequence_id: 'TEST-A-SEQUENCE-001',
      block_code: 'BLOQUE A',
      block_title: 'A',
      selectors: [
        { task_ids: ['PRE-TEST-001'] },
        { prefix: 'TEST-A', from: 1, to: 4 },
      ],
    }],
  }, taskMap);

  assert.equal(active.previous_task_id, 'TEST-A-001');
  assert.deepEqual(expandSequenceSegments(active.segments), ['TEST-A-002', 'TEST-A-004']);
  assert.deepEqual(active.route_progress, {
    covered_tasks: 5,
    pending_tasks: 2,
    deferred_pending_tasks: 0,
    total_stages: 1,
    active_stage: 1,
  });
});

test('conserva etapas condicionales diferidas sin bloquear el handoff normal', () => {
  const taskMap = new Map([
    ['PRE-TEST-001', task('PRE-TEST-001', 'APROBADA')],
    ['OPTIONAL-TEST-001', task('OPTIONAL-TEST-001', 'NO INICIADA')],
    ['MAIN-TEST-001', task('MAIN-TEST-001', 'NO INICIADA')],
  ]);
  const active = resolveContinuityRoute({
    schema_version: 1,
    route_id: 'TEST-ROUTE-001',
    entry_task_id: 'PRE-TEST-001',
    latest_treq_task_id: 'PRE-TEST-001',
    coverage_policy: 'ALL_CANONICAL_TASKS_EXACTLY_ONCE',
    projection_policy: 'PENDING_TASKS_ONLY',
    stages: [
      {
        sequence_id: 'OPTIONAL-SEQUENCE-001',
        block_code: 'OPCIONAL',
        block_title: 'Condicional',
        activation_state: 'DEFERRED',
        selectors: [{ prefix: 'OPTIONAL-TEST' }],
      },
      {
        sequence_id: 'MAIN-SEQUENCE-001',
        block_code: 'PRINCIPAL',
        block_title: 'Principal',
        selectors: [{ task_ids: ['PRE-TEST-001', 'MAIN-TEST-001'] }],
      },
    ],
  }, taskMap);

  assert.equal(active.sequence_id, 'MAIN-SEQUENCE-001');
  assert.deepEqual(expandSequenceSegments(active.segments), ['MAIN-TEST-001']);
  assert.equal(active.route_progress.deferred_pending_tasks, 1);
});

test('rechaza una ruta total cuando aparece una tarea canónica sin ubicar', () => {
  const taskMap = new Map([
    ['PRE-TEST-001', task('PRE-TEST-001', 'APROBADA')],
    ['TEST-A-001', task('TEST-A-001', 'NO INICIADA')],
  ]);

  assert.throws(() => resolveContinuityRoute({
    schema_version: 1,
    route_id: 'TEST-ROUTE-001',
    entry_task_id: 'PRE-TEST-001',
    latest_treq_task_id: 'PRE-TEST-001',
    coverage_policy: 'ALL_CANONICAL_TASKS_EXACTLY_ONCE',
    stages: [{
      sequence_id: 'TEST-A-SEQUENCE-001',
      block_code: 'BLOQUE A',
      block_title: 'A',
      selectors: [{ task_ids: ['PRE-TEST-001'] }],
    }],
  }, taskMap), /faltan TEST-A-001/);
});

test('acepta una ruta terminal sin handoff', () => {
  const taskMap = new Map([
    ['PRE-001', task('PRE-001', 'APROBADA')],
    ['TEST-A-001', task('TEST-A-001', 'APROBADA')],
  ]);

  assert.equal(resolveHandoff(taskMap, {
    handoff_task_id: null,
    handoff_sequence_id: null,
  }, ['PRE-001', 'TEST-A-001']), null);
});
