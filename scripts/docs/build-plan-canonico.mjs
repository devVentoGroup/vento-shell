await import('./safe-build-plan-canonico.mjs');
const { syncPendingTaskContext } = await import('./sync-pending-task-context.mjs');
syncPendingTaskContext();

try {
  const path = await import('node:path');
  const { derivePreflight } = await import('./canonical-task-preflight.mjs');
  const { writePlanWatchStatus } = await import('./plan-watch-runtime.mjs');
  const root = process.cwd();
  const completedAt = new Date().toISOString();
  writePlanWatchStatus(path.join(root, '.delivery', 'plan-status.md'), {
    state: 'COMPILACIÓN COMPLETADA',
    pid: null,
    startedAt: completedAt,
    updatedAt: completedAt,
    result: 'OK',
    reason: 'docs:plan:build',
    message: 'Fuentes canónicas compiladas y contexto pendiente sincronizado.',
    preflight: derivePreflight({ root }),
  });
} catch (error) {
  console.warn(
    `[PLAN CANÓNICO] No se pudo actualizar .delivery/plan-status.md: ${error instanceof Error ? error.message : String(error)}`,
  );
}
