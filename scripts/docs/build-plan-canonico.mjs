await import('./safe-build-plan-canonico.mjs');
const { syncPendingTaskContext } = await import('./sync-pending-task-context.mjs');
syncPendingTaskContext();

try {
  const path = await import('node:path');
  const { derivePreflight } = await import('./canonical-task-preflight.mjs');
  const { prepareImplementationReadinessArtifacts } = await import('./implementation-readiness-artifacts.mjs');
  const { writeCurrentTaskDevelopmentArtifacts } = await import('./task-development-artifacts.mjs');
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
  writeCurrentTaskDevelopmentArtifacts({ root, buildSucceeded: true });
  prepareImplementationReadinessArtifacts({ root, write: true });
} catch (error) {
  console.warn(
    `[PLAN CANÓNICO] No se pudieron actualizar todos los artefactos locales: ${error instanceof Error ? error.message : String(error)}`,
  );
}
