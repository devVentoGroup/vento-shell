import assert from 'node:assert/strict';
import test from 'node:test';

import { assessPackageSelection } from './package-selection-control.mjs';

const basePolicy = {
  schema_version: 1,
  policy_id: 'PACKAGE-SELECTION-001',
  automatic_selection: false,
  selection_owner: 'OWN-OPS',
  required_validators: ['OWN-TEC'],
  security_veto_owner: 'OWN-SEG',
  selected_package_id: null,
  decision: null,
};

const queue = (ids) => ({ implementation_ready_queue: ids.map((packageId) => ({ package_id: packageId })) });

test('sin packages elegibles la selección todavía no corresponde', () => {
  const result = assessPackageSelection(basePolicy, queue([]));
  assert.equal(result.state, 'NOT_DUE');
  assert.equal(result.selected_package_id, null);
  assert.equal(result.owner, 'OWN-OPS');
});

test('una cola no selecciona automáticamente su primer package', () => {
  const result = assessPackageSelection(basePolicy, queue(['GAP-PKG-061']));
  assert.equal(result.state, 'AWAITING_DECISION');
  assert.equal(result.selected_package_id, null);
  assert.deepEqual(result.eligible_package_ids, ['GAP-PKG-061']);
});

test('la selección exige package elegible, dueño y APROBADO trazable', () => {
  const selected = {
    ...basePolicy,
    selected_package_id: 'GAP-PKG-061',
    decision: {
      approval: 'APROBADO',
      decided_by_owner: 'OWN-OPS',
      validated_by_owners: ['OWN-TEC'],
      evidence: 'DEC-PKG-2026-001',
    },
  };
  assert.equal(assessPackageSelection(selected, queue(['GAP-PKG-061'])).state, 'SELECTED');
  assert.throws(
    () => assessPackageSelection({ ...selected, selected_package_id: 'GAP-PKG-062' }, queue(['GAP-PKG-061'])),
    /no pertenece a IMPLEMENTATION_READY_QUEUE/u,
  );
});
