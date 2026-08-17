import assert from 'node:assert/strict';
import test from 'node:test';

import {
  developmentDependencyOrderErrors,
  resolveTaskWorkTopology,
  taskDependencies,
} from './task-work-topology.mjs';

test('clasifica todas las tareas y separa definición, unidad, paquete y cierre global', () => {
  const result = resolveTaskWorkTopology();
  assert.equal(result.topology.size, 1594);
  assert.equal(Object.values(result.counts).reduce((sum, value) => sum + value, 0), 1594);
  assert.equal(result.topology.get('SHELL-MIG-007').mode, 'TEMPLATE_PER_PACKAGE');
  assert.equal(result.topology.get('SHELL-CI-001').mode, 'GLOBAL_ENABLE_ONCE');
  assert.equal(result.topology.get('SHELL-CI-020').mode, 'TEMPLATE_PER_PACKAGE');
  assert.equal(result.topology.get('AUTH-QA-001').mode, 'PER_PACKAGE_AND_GLOBAL_FINAL');
  assert.equal(result.topology.get('AUTH-DB-030').mode, 'GLOBAL_FINAL');
});

test('separa dependencias para desarrollar de bloqueos futuros de ejecución', () => {
  const knownIds = new Set([
    'SHELL-MIG-005',
    'SHELL-MIG-006',
    'SHELL-CI-001',
    ...Array.from({ length: 7 }, (_, index) => `SHELL-CI-${String(index + 7).padStart(3, '0')}`),
    'E5-GATE-008',
    'SHELL-CI-020',
  ]);
  const task = {
    id: 'SHELL-MIG-007',
    block: `### [ ] SHELL-MIG-007 — Definir contrato

**Dependencias para desarrollar:** \`SHELL-MIG-005\`; \`SHELL-MIG-006\`.
**Dependencias para ejecutar cada instancia:** \`SHELL-CI-001\`; \`SHELL-CI-007\` a \`SHELL-CI-013\`; \`E5-GATE-008::<package_id>\`; \`SHELL-CI-020::<package_id>\`.`,
  };
  const result = taskDependencies(task, knownIds);
  assert.deepEqual(result.development, ['SHELL-MIG-005', 'SHELL-MIG-006']);
  assert.deepEqual(result.execution, [
    'SHELL-CI-001',
    'SHELL-CI-007',
    'SHELL-CI-013',
    'E5-GATE-008',
    'SHELL-CI-020',
    'SHELL-CI-008',
    'SHELL-CI-009',
    'SHELL-CI-010',
    'SHELL-CI-011',
    'SHELL-CI-012',
  ]);
});

test('acepta dependencias desarrolladas como secciones con listas', () => {
  const knownIds = new Set([
    'SHELL-MIG-005',
    'SHELL-MIG-006',
    'SHELL-CI-001',
    'E5-GATE-008',
    'SHELL-CI-020',
  ]);
  const result = taskDependencies({
    id: 'SHELL-MIG-007',
    block: `### ✅ SHELL-MIG-007 — Definir contrato

Dependencias para desarrollar el marcador global:

- \`SHELL-MIG-005\`;
- \`SHELL-MIG-006\`.

Dependencias para ejecutar una instancia:

- \`SHELL-CI-001\`;
- \`E5-GATE-008::<package_id>\`;
- \`SHELL-CI-020::<package_id>\`.`,
  }, knownIds);
  assert.deepEqual(result.development, ['SHELL-MIG-005', 'SHELL-MIG-006']);
  assert.deepEqual(result.execution, ['SHELL-CI-001', 'E5-GATE-008', 'SHELL-CI-020']);
});

test('rechaza una dependencia de desarrollo hacia una tarea futura', () => {
  const ordered = [{ id: 'TEST-A-001' }, { id: 'TEST-A-002' }];
  const dependencies = new Map([
    ['TEST-A-001', { development: ['TEST-A-002'] }],
    ['TEST-A-002', { development: [] }],
  ]);
  assert.deepEqual(
    developmentDependencyOrderErrors(ordered, dependencies),
    ['TEST-A-001 tiene una dependencia de desarrollo futura: TEST-A-002.'],
  );
});

test('ubica el inventario PULSO antes de la definición física que lo consume', () => {
  const result = resolveTaskWorkTopology();
  const ids = result.ordered.map(({ id }) => id);
  assert.ok(ids.indexOf('PULSO-UX-001') < ids.indexOf('OPS-POS-001'));
  assert.ok(ids.indexOf('OPS-POS-001') < ids.indexOf('PULSO-UX-002'));
});
