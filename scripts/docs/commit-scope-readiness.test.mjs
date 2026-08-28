import assert from 'node:assert/strict';
import test from 'node:test';

import {
  analyzeReadinessCommitScope,
  PACKAGE_REGISTRY_PATH,
} from './commit-scope-readiness.mjs';

function baseAnalyze(paths) {
  const canonical = paths.filter((entry) => entry.startsWith('docs/plan-canonico/modular/'));
  const transversal = paths.filter((entry) => entry.startsWith('scripts/docs/'));
  const errors = canonical.length && transversal.length
    ? ['el commit mezcla desarrollo de tarea canónica con infraestructura transversal.']
    : [];
  const scopes = {};
  if (canonical.length) scopes.CANONICAL_TASK = canonical;
  if (transversal.length) scopes.TRANSVERSAL = transversal;
  return { files: [...paths], scopes, errors, warnings: [] };
}

test('el registry persistente puede acompañar el cierre de una tarea como PROJECTION', () => {
  const report = analyzeReadinessCommitScope([
    'docs/plan-canonico/modular/bloques/X/fixture.md',
    PACKAGE_REGISTRY_PATH,
  ], baseAnalyze);
  assert.deepEqual(report.errors, []);
  assert.deepEqual(report.scopes.PROJECTION, [PACKAGE_REGISTRY_PATH]);
  assert.deepEqual(report.scopes.CANONICAL_TASK, ['docs/plan-canonico/modular/bloques/X/fixture.md']);
  assert.equal(report.scopes.TRANSVERSAL, undefined);
});

test('otros scripts/docs siguen siendo TRANSVERSAL y mantienen el bloqueo de mezcla', () => {
  const report = analyzeReadinessCommitScope([
    'docs/plan-canonico/modular/bloques/X/fixture.md',
    'scripts/docs/package-readiness-scanner.mjs',
  ], baseAnalyze);
  assert.equal(report.errors.length, 1);
  assert.ok(report.scopes.TRANSVERSAL.includes('scripts/docs/package-readiness-scanner.mjs'));
});
