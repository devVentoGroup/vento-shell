import assert from 'node:assert/strict';
import test from 'node:test';

import { resolvePriorityRoute } from './execution-route.mjs';
import { renderPriorityLaneOrderSection } from './sync-priority-delivery-lanes-doc.mjs';

function task(id, state = 'NO INICIADA') {
  return {
    id,
    title: `Título ${id}`,
    state,
    marker: state === 'APROBADA' ? '✅' : '[ ]',
    relativePath: 'task.md',
  };
}

const selector = {
  selected_route_id: 'TEST-LANE-001',
  priority_entry_task_id: 'ENTRY-TEST-001',
  latest_treq_task_id: 'AUTH-UI-057',
  return_policy: 'RETURN_TO_NORMAL_AFTER_PRIORITY_CERTIFICATION',
  deferred_task_ids: ['AUTH-UI-058', 'AUTH-UI-059', 'AUTH-UI-060'],
  deferred_to_stage_id: 'U_NEXO_EXPERIENCE_CERTIFICATION',
  deferred_reason: 'Las pantallas implementadas son la superficie de prueba y el prototipo es la línea base.',
};

const lane = {
  lane_id: 'TEST-LANE-001',
  title: 'Carril de prueba',
  owner_application: 'nexo',
  required_task_artifacts: [
    {
      artifact_group_id: 'NEXO_UI_VALIDATION',
      task_ranges: [{ prefix: 'AUTH-UI', from: 52, to: 60 }],
      required_scope: 'validación completa antes de implementar',
    },
  ],
  post_implementation_artifacts: [
    {
      artifact_group_id: 'U_NEXO_EXPERIENCE_CERTIFICATION',
      task_refs: ['UX-QA-001'],
      required_scope: 'certificación de experiencia implementada',
    },
  ],
  ordered_execution_stages: [
    {
      order: 1,
      stage_id: 'NEXO_UI_VALIDATION',
      task_source: 'required_task_artifacts.NEXO_UI_VALIDATION',
    },
    {
      order: 2,
      stage_id: 'U_NEXO_EXPERIENCE_CERTIFICATION',
      task_source: 'post_implementation_artifacts.U_NEXO_EXPERIENCE_CERTIFICATION',
    },
  ],
};

const progress = {
  schema_version: 1,
  route_id: 'TEST-LANE-001',
  conditional_scopes: {},
  stage_controls: {},
  instance_states: {},
};

function taskMap() {
  return new Map([
    ['ENTRY-TEST-001', task('ENTRY-TEST-001', 'APROBADA')],
    ...Array.from({ length: 9 }, (_, index) => {
      const number = index + 52;
      const id = `AUTH-UI-${String(number).padStart(3, '0')}`;
      return [id, task(id, number <= 57 ? 'APROBADA' : 'NO INICIADA')];
    }),
    ['UX-QA-001', task('UX-QA-001')],
  ]);
}

test('difiere AUTH-UI-058 a 060 hasta certificación posterior a implementación', () => {
  const active = resolvePriorityRoute({
    selector,
    lanes: { lanes: [lane] },
    progress,
    taskMap: taskMap(),
  });

  assert.equal(active.priority_stage.stage_id, 'U_NEXO_EXPERIENCE_CERTIFICATION');
  assert.deepEqual(active.task_ids.slice(0, 3), [
    'AUTH-UI-058',
    'AUTH-UI-059',
    'AUTH-UI-060',
  ]);
  assert.equal(active.previous_task_id, 'AUTH-UI-057');
  assert.equal(active.latest_treq_task_id, 'AUTH-UI-057');
  assert.deepEqual(active.deferred_task_ids, selector.deferred_task_ids);
  assert.equal(active.deferred_to_stage_id, 'U_NEXO_EXPERIENCE_CERTIFICATION');
});

test('proyecta el mismo diferimiento en el orden visible', () => {
  const rendered = renderPriorityLaneOrderSection({ lanes: [lane] }, selector);

  assert.match(
    rendered,
    /\| 1 \| `NEXO_UI_VALIDATION` \| `AUTH-UI-052` a `AUTH-UI-057` \|/,
  );
  assert.match(
    rendered,
    /\| 2 \| `U_NEXO_EXPERIENCE_CERTIFICATION` \| `AUTH-UI-058` a `AUTH-UI-060`; `UX-QA-001` \|/,
  );
  assert.match(rendered, /pantallas implementadas son la superficie de prueba/);
  assert.doesNotMatch(
    rendered,
    /\| 1 \| `NEXO_UI_VALIDATION` \| `AUTH-UI-052` a `AUTH-UI-060` \|/,
  );
});

test('rechaza diferir pruebas hacia una etapa previa a implementación', () => {
  assert.throws(
    () => resolvePriorityRoute({
      selector: { ...selector, deferred_to_stage_id: 'NEXO_UI_VALIDATION' },
      lanes: { lanes: [lane] },
      progress,
      taskMap: taskMap(),
    }),
    /posterior a la implementación/,
  );
});
