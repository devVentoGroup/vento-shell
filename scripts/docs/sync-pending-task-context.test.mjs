import assert from 'node:assert/strict';
import test from 'node:test';

import {
  describePendingTask,
  describeTaskScope,
  orderPendingTasksByRoute,
  parseTaskScopeContracts,
  pendingTaskExecutionContext,
  validationProfileForTask,
} from './sync-pending-task-context.mjs';

test('describe tareas pendientes con una acción breve y legible', () => {
  assert.equal(
    describePendingTask('Migrar consumidores de autorización'),
    'Migra consumidores de autorización al destino canónico, comprueba paridad y conserva rollback.',
  );
  assert.equal(
    describePendingTask('Verificar accesibilidad y movimiento reducido'),
    'Verifica accesibilidad y movimiento reducido, registra brechas y deja evidencia del resultado.',
  );
  assert.equal(
    describePendingTask('Retirar copias legacy y certificar adopción'),
    'Retira copias legacy y certifica adopción solo después de verificar el reemplazo y el rollback.',
  );
  assert.equal(
    describePendingTask('Ejecutar y resolver el checklist aprobado'),
    'Ejecuta y resuelve el checklist aprobado de forma controlada y registra resultado, fallos y evidencia.',
  );
  assert.equal(
    describePendingTask('Los fallos parciales permiten recuperación'),
    'Convierte «Los fallos parciales permiten recuperación» en una condición verificable, con responsable, evidencia y criterio de cierre.',
  );
});

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
  assert.deepEqual(result.map(({ routePredecessorId }) => routePredecessorId), ['TEST-A-001', 'TEST-B-001']);
});

test('expone dependencias, TREQ y cierre declarados sin inferir contenido canónico', () => {
  const context = pendingTaskExecutionContext({
    ...task('TEST-A-002'),
    title: 'Migrar consumidores legacy',
    routePredecessorId: 'TEST-A-001',
    block: `### [ ] TEST-A-002 — Migrar consumidores legacy

**Dependencias:** \`TEST-A-001\`; \`TEST-SEC-004\`.

#### 1. Requisitos de prueba derivados

- \`TREQ-UX-2001\`
- \`TREQ-SEC-2002\`

**Puerta de cierre:** paridad aprobada y rollback reproducible.`,
  });

  assert.equal(context.dependencyKind, 'DECLARADAS');
  assert.equal(context.dependencies, '`TEST-A-001`; `TEST-SEC-004`.');
  assert.match(context.tests, /`TREQ-UX-2001`, `TREQ-SEC-2002`/u);
  assert.match(context.tests, /paridad contractual y operativa/u);
  assert.equal(context.closure, 'paridad aprobada y rollback reproducible.');
});

test('distingue precedencia y perfil previsto cuando la tarea sigue vacía', () => {
  const context = pendingTaskExecutionContext({
    ...task('TEST-UI-002'),
    title: 'Implementar componente accesible',
    routePredecessorId: 'TEST-UI-001',
    block: '### [ ] TEST-UI-002 — Implementar componente accesible',
  });

  assert.equal(context.dependencyKind, 'PRECEDENCIA_DE_RUTA');
  assert.equal(context.dependencies, 'Precedencia de ruta: `TEST-UI-001`');
  assert.match(context.tests, /^Por definir al desarrollar/u);
  assert.match(context.tests, /accesibilidad/u);
  assert.match(context.closure, /Se concreta al desarrollar/u);
});

test('selecciona perfiles de validación proporcionales por naturaleza', () => {
  assert.match(validationProfileForTask({ ...task('TEST-AUTH-001'), title: 'Proteger permisos' }), /denegaciones/u);
  assert.match(validationProfileForTask({ ...task('TEST-INT-001'), title: 'Integrar webhook idempotente' }), /reintentos/u);
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

test('extrae el alcance canónico sin alterar el título de la tarea', () => {
  const scopes = parseTaskScopeContracts(`
<!-- TASK-SCOPE-CONTRACT:START -->
| Tarea | Decide | No decide ni ejecuta | Entrega a |
| --- | --- | --- | --- |
| \`TEST-A-001\` | Arquitectura y versiones compatibles. | Instalación física. | \`TEST-A-002\`. |
<!-- TASK-SCOPE-CONTRACT:END -->
`, 'test.md');

  const scope = scopes.get('TEST-A-001');
  assert.deepEqual(scope, {
    decides: 'Arquitectura y versiones compatibles.',
    excludes: 'Instalación física.',
    handoff: '`TEST-A-002`.',
  });
  assert.equal(
    describeTaskScope({ ...task('TEST-A-001'), scope }),
    'Arquitectura y versiones compatibles.',
  );
});

test('rechaza contratos de alcance ambiguos o incompletos', () => {
  assert.throws(
    () => parseTaskScopeContracts(`
<!-- TASK-SCOPE-CONTRACT:START -->
| \`TEST-A-001\` | Solo dos columnas. |
<!-- TASK-SCOPE-CONTRACT:END -->
`, 'test.md'),
    /Fila de alcance inválida/u,
  );

  assert.throws(
    () => parseTaskScopeContracts('<!-- TASK-SCOPE-CONTRACT:START -->', 'test.md'),
    /sin cierre válido/u,
  );
});
