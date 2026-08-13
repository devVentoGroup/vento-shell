import assert from 'node:assert/strict';
import fs from 'node:fs';
import path from 'node:path';
import test from 'node:test';

const workflowPath = path.resolve('.github/workflows/validate-canonical-plan.yml');
const watcherPath = path.resolve('scripts/docs/watch-plan-canonico.mjs');
const productionIntegrationPath = path.resolve(
  'docs/plan-canonico/modular/bloques/X_INTEGRACIONES/05_PRODUCCION_E_INVENTARIO.md',
);

test('verifica derivados commiteados antes de que el build pueda regenerarlos', () => {
  const workflow = fs.readFileSync(workflowPath, 'utf8');
  const prebuildCheck = workflow.indexOf(
    'Verificar artefactos derivados commiteados antes de compilar',
  );
  const build = workflow.indexOf('Compilar plan canónico');
  const reproducibleBuild = workflow.indexOf(
    'Verificar que la compilación sea reproducible sin cambios',
  );

  assert.ok(prebuildCheck >= 0, 'falta el check pre-build de artefactos commiteados');
  assert.ok(build > prebuildCheck, 'el build debe ejecutarse después del check pre-build');
  assert.ok(
    reproducibleBuild > build,
    'la comprobación de reproducibilidad debe ejecutarse después del build',
  );
  assert.match(
    workflow.slice(prebuildCheck, build),
    /run: npm run docs:plan:check/u,
  );
  assert.match(
    workflow.slice(reproducibleBuild),
    /run: git diff --exit-code -- docs\/plan-canonico\/modular/u,
  );
});

test('el watcher regenera y valida también la guía de tareas pendientes', () => {
  const watcher = fs.readFileSync(watcherPath, 'utf8');

  assert.match(watcher, /"build-plan-canonico\.mjs"/u);
  assert.doesNotMatch(watcher, /\[safeBuildScript\]/u);
  assert.match(watcher, /"sync-pending-task-context\.mjs"/u);
  assert.match(
    watcher,
    /\[pendingTaskContextCheckScript, "--check"\]/u,
  );
  assert.match(watcher, /"normalize-retired-priority-route\.mjs"/u);
});

test('INT-PROD conserva decidir, ejecutar y verificar sin dependencia circular', () => {
  const source = fs.readFileSync(productionIntegrationPath, 'utf8');
  const start = source.indexOf('### ✅ INT-PROD-003');
  const end = source.indexOf('### ✅ INT-PROD-004', start);
  assert.ok(start >= 0 && end > start, 'no se pudo aislar INT-PROD-003');
  const task = source.slice(start, end);

  assert.doesNotMatch(task, /Solo una disposición de calidad registrada y verificada/u);
  assert.doesNotMatch(task, /Solo la existencia expresamente liberada puede ser candidata/u);
  assert.match(task, /DISPOSITION_DECIDED → ejecución de la disposición → EXECUTION_VERIFICATION_PENDING → QUALITY_DISPOSITION_VERIFIED/u);
  assert.match(task, /QUALITY_DISPOSITION_VERIFIED` no constituye una precondición/u);

  const decided = task.indexOf('`VPROC-0035.EVT-004` — disposición decidida');
  const pending = task.indexOf('`VPROC-0035.EVT-005` — verificación de ejecución pendiente');
  const verified = task.indexOf('`VPROC-0035.EVT-006` — disposición de calidad verificada');
  assert.ok(decided >= 0 && decided < pending && pending < verified);
});
