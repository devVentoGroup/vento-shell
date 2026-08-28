import assert from 'node:assert/strict';
import test from 'node:test';

import { parseReadinessLifecycleArgs } from './task-branch-lifecycle-readiness.mjs';

test('preserva el task-id exacto para start', () => {
  assert.deepEqual(
    parseReadinessLifecycleArgs(['start', '--task-id', 'AUTH-SRV-001']),
    { mode: 'start', taskId: 'AUTH-SRV-001' },
  );
});

test('preserva el task-id exacto para finish', () => {
  assert.deepEqual(
    parseReadinessLifecycleArgs(['finish', '--task-id', 'AUTH-SRV-001']),
    { mode: 'finish', taskId: 'AUTH-SRV-001' },
  );
});

test('falla cerrado sin task-id', () => {
  assert.throws(() => parseReadinessLifecycleArgs(['finish']), /Falta --task-id/u);
});
