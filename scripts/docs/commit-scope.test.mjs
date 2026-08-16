import assert from 'node:assert/strict';
import test from 'node:test';

import { analyzeCommitScope, classifyCommitPath } from './commit-scope.mjs';

test('clasifica fuentes canónicas y herramientas transversales por separado', () => {
  assert.equal(
    classifyCommitPath('docs/plan-canonico/modular/bloques/H/archivo.md'),
    'CANONICAL_TASK',
  );
  assert.equal(classifyCommitPath('scripts/docs/watch-plan-canonico.mjs'), 'TRANSVERSAL');
  assert.equal(classifyCommitPath('src/app/page.tsx'), 'APPLICATION');
});

test('rechaza mezclar una tarea canónica con infraestructura transversal', () => {
  const result = analyzeCommitScope([
    'docs/plan-canonico/modular/bloques/H/tareas.md',
    'scripts/docs/validator.mjs',
  ]);
  assert.deepEqual(result.errors, [
    'el commit mezcla desarrollo de tarea canónica con infraestructura transversal.',
  ]);
});

test('permite derivados y fragmento propietario dentro del mismo alcance canónico', () => {
  const result = analyzeCommitScope([
    'docs/plan-canonico/modular/bloques/H/tareas.md',
    'docs/plan-canonico/modular/active-sequence.json',
    'docs/plan-canonico/modular/.generated/REGISTRO_GLOBAL_DE_TAREAS.md',
  ]);
  assert.deepEqual(result.errors, []);
});
