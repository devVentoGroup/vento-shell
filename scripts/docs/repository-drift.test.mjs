import assert from 'node:assert/strict';
import test from 'node:test';

import { compareSnapshots } from './repository-drift.mjs';

const repository = {
  name: 'vento-shell',
  available: true,
  package: { sha256: 'abc', node_engine: '24' },
  surfaces: { route_files: 1, component_files: 2, migration_files: 3 },
  git: { head: 'ignored-live-state' },
};

test('ignora estado Git vivo al comparar la estructura', () => {
  const baseline = { repositories: [repository] };
  const current = {
    repositories: [{ ...repository, git: { head: 'otro', clean: false } }],
  };
  assert.deepEqual(compareSnapshots(current, baseline), []);
});

test('detecta deriva estructural y repositorios nuevos', () => {
  const baseline = { repositories: [repository] };
  const current = {
    repositories: [
      { ...repository, surfaces: { ...repository.surfaces, route_files: 2 } },
      { ...repository, name: 'vento-nexo' },
    ],
  };
  assert.deepEqual(
    compareSnapshots(current, baseline).map(({ repository: name, kind }) => [name, kind]),
    [
      ['vento-shell', 'STRUCTURAL_DRIFT'],
      ['vento-nexo', 'NEW_REPOSITORY'],
    ],
  );
});
