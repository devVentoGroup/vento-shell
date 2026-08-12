import assert from 'node:assert/strict';
import test from 'node:test';

import { orderPendingTasksByRoute } from './sync-pending-task-context.mjs';

const task = (id, state = 'NO INICIADA') => ({
  id,
  title: `Título ${id}`,
  state,
  relativePath: 'task.md',
});

test('ordena las pendientes por etapa y selector, no por orden físico del manifiesto', () => {
  const tasks = [
    task('TEST-B-002'),
    task('TEST-A-002'),
    task('TEST-B-001', 'APROBADA'),
    task('TEST-A-001', 'APROBADA'),
  ];
  const route = {
    stages: [
      {
        sequence_id: 'PHASE-01-TEST-A',
        block_code: 'A',
        block_title: 'Primera',
        selectors: [{ prefix: 'TEST-A' }],
      },
      {
        sequence_id: 'PHASE-02-TEST-B',
        block_code: 'B',
        block_title: 'Segunda',
        selectors: [{ prefix: 'TEST-B' }],
      },
    ],
  };

  const result = orderPendingTasksByRoute(tasks, route);
  assert.deepEqual(result.map(({ id }) => id), ['TEST-A-002', 'TEST-B-002']);
  assert.deepEqual(result.map(({ canonicalOrder }) => canonicalOrder), [2, 4]);
  assert.deepEqual(result.map(({ stageOrder }) => stageOrder), [1, 2]);
});

test('rechaza cualquier tarea canónica que quede fuera de la guía', () => {
  assert.throws(
    () => orderPendingTasksByRoute(
      [task('TEST-A-001'), task('TEST-B-001')],
      {
        stages: [{
          sequence_id: 'PHASE-01-TEST-A',
          block_code: 'A',
          block_title: 'Primera',
          selectors: [{ prefix: 'TEST-A' }],
        }],
      },
    ),
    /no ubica tareas canónicas: TEST-B-001/u,
  );
});

test('conserva las tareas diferidas sin ponerlas delante de la continuidad activa', () => {
  const result = orderPendingTasksByRoute(
    [task('TEST-DEFERRED-001'), task('TEST-ACTIVE-001')],
    {
      stages: [
        {
          sequence_id: 'PHASE-01-DEFERRED',
          block_code: 'D',
          block_title: 'Diferida',
          activation_state: 'DEFERRED',
          selectors: [{ prefix: 'TEST-DEFERRED' }],
        },
        {
          sequence_id: 'PHASE-02-ACTIVE',
          block_code: 'A',
          block_title: 'Activa',
          selectors: [{ prefix: 'TEST-ACTIVE' }],
        },
      ],
    },
  );
  assert.deepEqual(result.map(({ id }) => id), ['TEST-ACTIVE-001', 'TEST-DEFERRED-001']);
  assert.deepEqual(result.map(({ canonicalOrder }) => canonicalOrder), [2, 1]);
});
