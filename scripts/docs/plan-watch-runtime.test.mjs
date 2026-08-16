import assert from 'node:assert/strict';
import fs from 'node:fs';
import os from 'node:os';
import path from 'node:path';
import test from 'node:test';

import {
  acquireWatcherLock,
  releaseWatcherLock,
  renderPlanWatchStatus,
} from './plan-watch-runtime.mjs';

function withTempDirectory(run) {
  const directory = fs.mkdtempSync(path.join(os.tmpdir(), 'vento-plan-watch-'));
  try {
    return run(directory);
  } finally {
    fs.rmSync(directory, { recursive: true, force: true });
  }
}

test('rechaza una segunda instancia cuando el PID propietario sigue activo', () => {
  withTempDirectory((directory) => {
    const lockPath = path.join(directory, 'watch.lock.json');
    assert.equal(acquireWatcherLock({ lockPath, pid: 101 }).acquired, true);
    const duplicate = acquireWatcherLock({
      lockPath,
      pid: 202,
      processAlive: (pid) => pid === 101,
    });
    assert.equal(duplicate.acquired, false);
    assert.equal(duplicate.lock.pid, 101);
  });
});

test('reclama un lock obsoleto y solo su propietario puede liberarlo', () => {
  withTempDirectory((directory) => {
    const lockPath = path.join(directory, 'watch.lock.json');
    acquireWatcherLock({ lockPath, pid: 101 });
    const reclaimed = acquireWatcherLock({
      lockPath,
      pid: 202,
      processAlive: () => false,
    });
    assert.equal(reclaimed.acquired, true);
    assert.equal(reclaimed.reclaimed, true);
    assert.equal(releaseWatcherLock({ lockPath, pid: 101 }), false);
    assert.equal(releaseWatcherLock({ lockPath, pid: 202 }), true);
    assert.equal(fs.existsSync(lockPath), false);
  });
});

test('renderiza un estado legible sin convertirlo en fuente canónica', () => {
  const status = renderPlanWatchStatus({
    state: 'VIGILANDO',
    pid: 123,
    startedAt: '2026-08-16T00:00:00.000Z',
    updatedAt: '2026-08-16T00:01:00.000Z',
    buildId: 2,
    reason: 'cambios guardados',
    result: 'OK',
    preflight: {
      task: { title: 'Compartir aviso de rol simulado', state: 'NO INICIADA' },
      continuity: {
        previous: 'SHELL-UI-008',
        current: 'SHELL-UI-009',
        next: 'SHELL-UI-010',
        route: 'NORMAL-CANONICAL-FLOW-001',
      },
    },
  });
  assert.match(status, /No es una fuente canónica ni aprueba tareas/u);
  assert.match(status, /SHELL-UI-009 — Compartir aviso de rol simulado/u);
  assert.match(status, /\*\*Resultado:\*\* OK/u);
});
