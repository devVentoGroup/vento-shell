try {
  await import('./safe-build-plan-canonico.mjs');
} catch (error) {
  console.error('[PLAN CANÓNICO] Validación bloqueada:');
  console.error(error instanceof Error ? error.message : String(error));
  process.exit(1);
}
const { syncPendingTaskContext } = await import('./sync-pending-task-context.mjs');
syncPendingTaskContext();

try {
  const path = await import('node:path');
  const { derivePreflight } = await import('./canonical-task-preflight.mjs');
  const { prepareImplementationReadinessArtifacts } = await import('./implementation-readiness-artifacts.mjs');
  const { writeImplementationControlArtifacts } = await import('./implementation-control.mjs');
  const { writeCurrentTaskDevelopmentArtifacts } = await import('./task-development-artifacts.mjs');
  const { writePlanWatchStatus } = await import('./plan-watch-runtime.mjs');
  const root = process.cwd();
  const completedAt = new Date().toISOString();
  const { control: implementationControl } = writeImplementationControlArtifacts({ root });
  writePlanWatchStatus(path.join(root, '.delivery', 'plan-status.md'), {
    state: 'COMPILACIÓN COMPLETADA',
    pid: null,
    startedAt: completedAt,
    updatedAt: completedAt,
    result: 'OK',
    reason: 'docs:plan:build',
    message: 'Fuentes canónicas compiladas y contexto pendiente sincronizado.',
    preflight: derivePreflight({ root }),
    implementationControl,
  });
  writeCurrentTaskDevelopmentArtifacts({ root, buildSucceeded: true });
  prepareImplementationReadinessArtifacts({ root, write: true });
  console.log(
    `[PLAN CANÓNICO] ➜ ACCIÓN PRINCIPAL: ${implementationControl.primaryAction.type} `
    + `${implementationControl.primaryAction.target}`,
  );
} catch (error) {
  console.warn(
    `[PLAN CANÓNICO] No se pudieron actualizar todos los artefactos locales: ${error instanceof Error ? error.message : String(error)}`,
  );
}
