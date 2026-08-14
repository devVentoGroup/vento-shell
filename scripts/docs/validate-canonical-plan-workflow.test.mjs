import assert from 'node:assert/strict';
import fs from 'node:fs';
import path from 'node:path';
import test from 'node:test';

const workflowPath = path.resolve('.github/workflows/validate-canonical-plan.yml');
const watcherPath = path.resolve('scripts/docs/watch-plan-canonico.mjs');
const productionIntegrationPath = path.resolve(
  'docs/plan-canonico/modular/bloques/X_INTEGRACIONES/05_PRODUCCION_E_INVENTARIO.md',
);
const posTransitionPath = path.resolve(
  'docs/plan-canonico/modular/bloques/X_INTEGRACIONES/06_TRANSICION_DEL_POS_EXTERNO.md',
);
const implementationPackagesPath = path.resolve(
  'docs/plan-canonico/modular/bloques/E5_PLANIFICACION_DE_IMPLEMENTACION/02_PAQUETES_DE_IMPLEMENTACION.md',
);

test('verifica fuentes antes del build y publica el compilado regenerado', () => {
  const workflow = fs.readFileSync(workflowPath, 'utf8');
  const prebuildCheck = workflow.indexOf(
    'Verificar fuentes y derivados versionados antes de compilar',
  );
  const build = workflow.indexOf('Compilar plan canónico');
  const reproducibleBuild = workflow.indexOf(
    'Verificar que la compilación sea reproducible sin cambios',
  );

  assert.ok(prebuildCheck >= 0, 'falta el check pre-build de fuentes y derivados versionados');
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
  assert.match(workflow, /uses: actions\/upload-artifact@v4/u);
  assert.match(workflow, /PLAN_IMPLEMENTACION_VENTO_OS_CANONICO_COMPILADO\.md/u);
  assert.match(workflow, /retention-days: 7/u);
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

test('INT-PROD-005 conserva su predecesora aprobada y reserva INT-POS-001', () => {
  const source = fs.readFileSync(productionIntegrationPath, 'utf8');
  const start = source.indexOf('### ✅ INT-PROD-005');
  assert.ok(start >= 0, 'no se pudo aislar INT-PROD-005');
  const task = source.slice(start);

  assert.match(
    task,
    /Tarea anterior dentro del flujo integral[^\n]+INT-PROD-004[^\n]+APROBADA/u,
  );
  assert.doesNotMatch(task, /INT-PROD-004[^\n]+NO INICIADA/u);
  assert.match(task, /PREDECESORA CANÓNICA APROBADA\s+INT-PROD-004/u);
  assert.match(task, /ÚLTIMA TAREA CANÓNICA APROBADA\s+INT-PROD-005/u);
  assert.match(task, /SIGUIENTE TAREA RESERVADA — NO INICIADA\s+INT-POS-001/u);
});

test('INT-POS-018 entrega acumulación, reversión y conciliación a identidades PASS vigentes', () => {
  const source = fs.readFileSync(posTransitionPath, 'utf8');
  const start = source.indexOf('### ✅ INT-POS-018');
  const end = source.indexOf('### ✅ INT-POS-019', start);
  assert.ok(start >= 0 && end > start, 'no se pudo aislar INT-POS-018');
  const task = source.slice(start, end);

  assert.doesNotMatch(task, /PASS-INT-006|PASS-INT-007/u);
  assert.doesNotMatch(task, /correlación evento-cuenta-movimiento[^\n]+PASS-INT-003/u);
  assert.doesNotMatch(task, /idempotencia detallada de acumulación[^\n]+PASS-INT-004/u);
  assert.match(task, /correlación evento-cuenta-movimiento de acumulación[^\n]+PASS-INT-001/u);
  assert.match(task, /idempotencia detallada de acumulación[^\n]+PASS-INT-001/u);
  assert.match(task, /reversión o compensación de acumulación PASS[^\n]+PASS-INT-001/u);
  assert.match(task, /conciliación de acumulación PASS[^\n]+PASS-INT-001[^\n]+PASS-QA-001/u);
});

test('DELIV-PKG-003 conserva un único título canónico en sus referencias de continuidad', () => {
  const source = fs.readFileSync(implementationPackagesPath, 'utf8');
  const canonicalTitle = 'Definir aplicación, dominio y repositorio propietarios';

  assert.match(source, new RegExp(`^### \\[ \\] DELIV-PKG-003 — ${canonicalTitle}$`, 'mu'));
  const titledReferences = [
    ...source.matchAll(/`DELIV-PKG-003 — (?<title>[^`\n]+)`/gu),
  ];
  assert.ok(titledReferences.length > 0, 'faltan referencias tituladas a DELIV-PKG-003');
  assert.deepEqual(
    [...new Set(titledReferences.map((match) => match.groups.title))],
    [canonicalTitle],
  );
});
