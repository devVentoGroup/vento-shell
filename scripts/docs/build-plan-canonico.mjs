function terminalSafeText(value) {
  const replacements = new Map([
    ['\u279c', '->'],
    ['\u2192', '->'],
    ['\u2705', 'PASS'],
    ['\u274c', 'FAIL'],
    ['\u23f3', 'WAIT'],
    ['\u21bb', 'RETRY'],
    ['\u25b6', '>'],
    ['\u2014', '-'],
    ['\u2013', '-'],
    ['\u201c', '"'],
    ['\u201d', '"'],
    ['\u2018', "'"],
    ['\u2019', "'"],
  ]);
  let source = String(value ?? '');
  for (const [symbol, replacement] of replacements) {
    source = source.replaceAll(symbol, replacement);
  }
  return source
    .normalize('NFKD')
    .replace(/\p{M}/gu, '')
    .replace(/[^\x09\x0A\x0D\x20-\x7E]/gu, '?');
}

function installTerminalSafeConsole() {
  for (const level of ['log', 'warn', 'error']) {
    const original = console[level].bind(console);
    console[level] = (...args) => original(
      ...args.map((value) => typeof value === 'string' ? terminalSafeText(value) : value),
    );
  }
}

installTerminalSafeConsole();

const root = process.cwd();

try {
  const {
    deriveImplementationControl,
    ensurePendingImplementationRecord,
  } = await import('./implementation-control.mjs');
  const preBuildControl = deriveImplementationControl({ root });
  ensurePendingImplementationRecord({ root, control: preBuildControl });
} catch (error) {
  console.error('[PLAN CAN\u00d3NICO] Preparaci\u00f3n f\u00edsica previa a compilaci\u00f3n bloqueada:');
  console.error(error instanceof Error ? error.message : String(error));
  process.exit(1);
}

try {
  await import('./safe-build-plan-canonico.mjs');
} catch (error) {
  console.error('[PLAN CAN\u00d3NICO] Validaci\u00f3n bloqueada:');
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
  const { writeChatgptWorkStarter } = await import('./chatgpt-work-starter.mjs');
  const { writeCurrentTaskDevelopmentArtifacts } = await import('./task-development-artifacts.mjs');
  const { writePlanWatchStatus } = await import('./plan-watch-runtime.mjs');
  const completedAt = new Date().toISOString();
  const { control: implementationControl } = writeImplementationControlArtifacts({ root });
  writeChatgptWorkStarter({ root });
  writePlanWatchStatus(path.join(root, '.delivery', 'plan-status.md'), {
    state: 'COMPILACI\u00d3N COMPLETADA',
    pid: null,
    startedAt: completedAt,
    updatedAt: completedAt,
    result: 'OK',
    reason: 'docs:plan:build',
    message: 'Fuentes can\u00f3nicas compiladas y contexto pendiente sincronizado.',
    preflight: derivePreflight({ root }),
    implementationControl,
  });
  writeCurrentTaskDevelopmentArtifacts({ root, buildSucceeded: true });
  prepareImplementationReadinessArtifacts({ root, write: true });
  console.log(
    `[PLAN CAN\u00d3NICO] \u279c ACCI\u00d3N PRINCIPAL: ${implementationControl.primaryAction.type} `
    + `${implementationControl.primaryAction.target}`,
  );
  console.log('[PLAN CAN\u00d3NICO]   Iniciador ChatGPT: INICIADOR_VENTO_ACTUAL.txt');
} catch (error) {
  console.warn(
    `[PLAN CAN\u00d3NICO] No se pudieron actualizar todos los artefactos locales: ${error instanceof Error ? error.message : String(error)}`,
  );
}