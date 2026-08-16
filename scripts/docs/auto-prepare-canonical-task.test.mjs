import assert from 'node:assert/strict';
import test from 'node:test';

import { automaticTaskIds } from './auto-prepare-canonical-task.mjs';

test('prepara únicamente la última aprobada y la tarea actual', () => {
  assert.deepEqual(
    automaticTaskIds({
      continuity: {
        previous: 'SHELL-UI-007',
        current: 'SHELL-UI-008',
        next: 'SHELL-UI-009',
      },
    }),
    ['SHELL-UI-007', 'SHELL-UI-008'],
  );
});

test('no duplica una tarea terminal', () => {
  assert.deepEqual(
    automaticTaskIds({ continuity: { previous: 'FINAL-001', current: 'FINAL-001' } }),
    ['FINAL-001'],
  );
});
