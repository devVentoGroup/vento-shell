import assert from 'node:assert/strict';
import fs from 'node:fs';
import path from 'node:path';
import test from 'node:test';

const workflowPath = path.resolve('.github/workflows/validate-canonical-plan.yml');

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
