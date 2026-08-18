import assert from 'node:assert/strict';
import test from 'node:test';

import {
  CANONICAL_UPDATE_RELATIONS,
  GATE_DEFINITIONS,
  UPDATE_RECORD_FIELDS,
  appendUpdateHistory,
  automationActionPlan,
  compareUpdateEvidence,
  evaluateConsumerUpdate,
  supersedeUpdate,
  updateIdentity,
  validateCanonicalContract,
} from './shared-package-consumer-update-gate.mjs';

const commits = {
  base: 'a'.repeat(40),
  proposal: 'b'.repeat(40),
  release: 'c'.repeat(40),
  otherBase: 'd'.repeat(40),
  otherProposal: 'e'.repeat(40),
};

function sha(label) {
  return updateIdentity({ label });
}

function manifestFor(packageSet) {
  return {
    name: 'synthetic-consumer',
    private: true,
    dependencies: Object.fromEntries(packageSet.map((entry) => [entry.package_name, entry.version])),
  };
}

function lockfileFor(packageSet) {
  return {
    name: 'synthetic-consumer',
    lockfileVersion: 3,
    packages: {
      '': {
        name: 'synthetic-consumer',
        dependencies: Object.fromEntries(packageSet.map((entry) => [entry.package_name, entry.version])),
      },
      ...Object.fromEntries(packageSet.map((entry) => [
        `node_modules/${entry.package_name}`,
        { version: entry.version, resolved: `https://registry.invalid/${entry.package_name}/${entry.version}` },
      ])),
    },
  };
}

function relationFor(packageName, consumerRepository = 'vento-nexo') {
  const relation = CANONICAL_UPDATE_RELATIONS.find((entry) => (
    entry.package_name === packageName && entry.consumer_repository === consumerRepository
  ));
  assert.ok(relation, `missing canonical relation for ${packageName}/${consumerRepository}`);
  return relation;
}

function releasesFor(packageSet) {
  return packageSet.map((entry, index) => ({
    package_name: entry.package_name,
    version: entry.version,
    source_commit: String(index + 1).repeat(40).slice(0, 40),
    release_identity: sha(`release:${entry.package_name}:${entry.version}`),
    artifact_identity: sha(`artifact:${entry.package_name}:${entry.version}`),
    manifest_identity: sha(`manifest:${entry.package_name}:${entry.version}`),
    integrity: `sha512-synthetic-${index + 1}`,
    release_status: 'PASS',
  }));
}

function compatibilitiesFor(packageSet, consumerRepository = 'vento-nexo') {
  return packageSet.map((entry) => {
    const relation = relationFor(entry.package_name, consumerRepository);
    return {
      relation_identity: relation.compatibility_relation_identity,
      package_name: entry.package_name,
      package_version: entry.version,
      consumer_repository: consumerRepository,
      phase: 'FINALIZE',
      result: 'PASS',
      stale: false,
      compatibility_evidence_identity: sha(`compat-prep:${entry.package_name}:${entry.version}:${consumerRepository}`),
      finalization_identity: sha(`compat-final:${entry.package_name}:${entry.version}:${consumerRepository}`),
      artifact_identity: sha(`artifact:${entry.package_name}:${entry.version}`),
      target_identity: `${consumerRepository}:web`,
      renderer_class: 'WEB',
    };
  });
}

function passingGateResults() {
  return Object.fromEntries(GATE_DEFINITIONS.map((definition) => [
    definition.id,
    definition.applicability === 'CONDITIONAL'
      ? { status: 'NOT_APPLICABLE', reason: 'sin riesgo reforzado en el escenario sintético', evidence_ids: [] }
      : { status: 'PASS', evidence_ids: [sha(`gate:${definition.id}`)] },
  ]));
}

function validInput(overrides = {}) {
  const packageSetFrom = overrides.package_set_from ?? [{ package_name: '@vento/contracts', version: '1.0.0' }];
  const packageSetTo = overrides.package_set_to ?? [{ package_name: '@vento/contracts', version: '1.0.1' }];
  const consumerRepository = overrides.consumer_repository ?? 'vento-nexo';
  const base = {
    schema_version: 1,
    update_id: 'PKG-PR-NEXO-1',
    consumer_repository: consumerRepository,
    consumer_owner: 'NEXO_TECH_OWNER',
    target_branch: 'main',
    base_commit: commits.base,
    proposal_commit: commits.proposal,
    remote_pr_ref: 'SYNTHETIC-PR-1',
    update_class: 'PATCH_UPDATE',
    trigger: 'RELEASE',
    package_set_from: packageSetFrom,
    package_set_to: packageSetTo,
    manifest_before: manifestFor(packageSetFrom),
    manifest_after: manifestFor(packageSetTo),
    lockfile_before: lockfileFor(packageSetFrom),
    lockfile_after: lockfileFor(packageSetTo),
    release_refs: releasesFor(packageSetTo),
    compatibilities: compatibilitiesFor(packageSetTo, consumerRepository),
    changelog_ref: sha('changelog'),
    deprecation_refs: [],
    security_ref: 'NONE',
    rollback_ref: 'RBK-NEXO-001',
    treq_impact: { created: 0, modified: 0, affected: ['TREQ-SHELL-006', 'TREQ-SHELL-008'] },
    supabase_impact: 'NO_APLICA',
    data_impact: 'NO_APLICA',
    configuration_impact: 'NO_APLICA',
    cache_impact: 'NO_APLICA',
    gate_results: passingGateResults(),
    evidence_refs: [sha('upstream-ci001'), sha('upstream-ci002'), sha('upstream-ci003'), sha('upstream-ci004'), sha('upstream-ci005')],
    required_reviewers: ['NEXO_TECH_OWNER', 'INDEPENDENT_REVIEWER'],
    approvals: [
      { reviewer: 'NEXO_TECH_OWNER', status: 'APPROVED' },
      { reviewer: 'INDEPENDENT_REVIEWER', status: 'APPROVED' },
    ],
    bot_identity: 'SYNTHETIC_UPDATE_BOT',
    opened_at: '2026-08-17T20:00:00-05:00',
    updated_at: '2026-08-17T20:01:00-05:00',
    merged_at: 'NONE',
    deployment_ref: 'PENDING',
    outcome: 'PENDING_REVIEW',
    supersedes: 'NONE',
    superseded_by: 'NONE',
    risk_controls: {
      major_ready: true,
      security_safe: true,
      deprecation_ready: true,
      remote_data_or_supabase_change: false,
      supabase_owner_task: null,
      simultaneous_deploy_required: false,
    },
    automation: {
      capabilities: [
        'read_release',
        'read_registry',
        'prepare_isolated_checkout',
        'write_proposal_branch',
        'open_pr',
        'publish_non_sensitive_evidence',
      ],
      attempt_merge: false,
      attempt_deploy: false,
    },
    change_scope: { attributable_only: true },
    multi_package: { minimal: true, closed: true, resolvable: true },
  };
  return { ...base, ...overrides };
}

assert.deepEqual(validateCanonicalContract(), []);

function assertPass(input) {
  const result = evaluateConsumerUpdate(input);
  assert.equal(result.result, 'PASS', JSON.stringify(result, null, 2));
  assert.equal(result.state, 'READY_FOR_REVIEW');
  assert.deepEqual(result.blockers, []);
  assert.deepEqual(result.errors, []);
  assert.equal(Object.keys(result.evidence.record).length, UPDATE_RECORD_FIELDS.length);
  return result;
}

function assertBlockedBy(input, blockerCode) {
  const result = evaluateConsumerUpdate(input);
  assert.equal(result.result, 'BLOCKED');
  assert.ok(result.blockers.some((entry) => entry.code === blockerCode), JSON.stringify(result, null, 2));
  return result;
}

// 8 positivos obligatorios

test('POS-01 INITIAL_ADOPTION elegible produce propuesta atribuible', () => {
  const input = validInput({
    update_class: 'INITIAL_ADOPTION',
    package_set_from: [],
    manifest_before: manifestFor([]),
    lockfile_before: lockfileFor([]),
  });
  const result = assertPass(input);
  assert.equal(result.evidence.record.update_class, 'INITIAL_ADOPTION');
});

test('POS-02 PATCH_UPDATE es idempotente sobre la misma identidad', () => {
  const input = validInput();
  const first = assertPass(input);
  const second = assertPass(input);
  assert.equal(first.evidence.proposal_identity, second.evidence.proposal_identity);
});

test('POS-03 MINOR_UPDATE conserva escenarios adicionales sin ruptura', () => {
  const result = assertPass(validInput({ update_class: 'MINOR_UPDATE', trigger: 'MINOR_RELEASE' }));
  assert.equal(result.evidence.record.update_class, 'MINOR_UPDATE');
});

test('POS-04 MAJOR_UPDATE completa exige y acepta control reforzado', () => {
  const gates = passingGateResults();
  gates['PKG-GATE-013'] = { status: 'PASS', evidence_ids: [sha('major-risk')] };
  const result = assertPass(validInput({ update_class: 'MAJOR_UPDATE', gate_results: gates }));
  assert.equal(result.evidence.record.update_class, 'MAJOR_UPDATE');
});

test('POS-05 SECURITY_UPDATE prioritaria no concede merge ni deploy', () => {
  const gates = passingGateResults();
  gates['PKG-GATE-013'] = { status: 'PASS', evidence_ids: [sha('security-risk')] };
  const result = assertPass(validInput({ update_class: 'SECURITY_UPDATE', security_ref: 'SEC-VENTO-001', gate_results: gates }));
  const plan = automationActionPlan(result);
  assert.ok(plan.forbidden.includes('merge_pr'));
  assert.ok(plan.forbidden.includes('deploy'));
});

test('POS-06 DEPRECATION_MIGRATION preserva expediente DEP', () => {
  const gates = passingGateResults();
  gates['PKG-GATE-013'] = { status: 'PASS', evidence_ids: [sha('deprecation-risk')] };
  const result = assertPass(validInput({
    update_class: 'DEPRECATION_MIGRATION',
    deprecation_refs: ['DEP-VENTO-001'],
    gate_results: gates,
  }));
  assert.deepEqual(result.evidence.record.deprecation_refs, ['DEP-VENTO-001']);
});

test('POS-07 ROLLBACK_UPDATE restaura snapshot certificado mediante expediente', () => {
  const gates = passingGateResults();
  gates['PKG-GATE-013'] = { status: 'PASS', evidence_ids: [sha('rollback-risk')] };
  const result = assertPass(validInput({ update_class: 'ROLLBACK_UPDATE', trigger: 'ROLLBACK', gate_results: gates }));
  assert.equal(result.evidence.record.rollback_ref, 'RBK-NEXO-001');
});

test('POS-08 conjunto multi-package mínimo cerrado usa una sola propuesta', () => {
  const from = [
    { package_name: '@vento/contracts', version: '1.0.0' },
    { package_name: '@vento/os-context', version: '1.0.0' },
  ];
  const to = [
    { package_name: '@vento/contracts', version: '1.1.0' },
    { package_name: '@vento/os-context', version: '1.0.1' },
  ];
  const result = assertPass(validInput({
    package_set_from: from,
    package_set_to: to,
    manifest_before: manifestFor(from),
    manifest_after: manifestFor(to),
    lockfile_before: lockfileFor(from),
    lockfile_after: lockfileFor(to),
    release_refs: releasesFor(to),
    compatibilities: compatibilitiesFor(to),
  }));
  assert.equal(result.evidence.record.package_set_to.length, 2);
});

// 18 casos negativos: uno por PR-BLK

test('NEG-01 PR-BLK-001 bloquea release inexistente', () => {
  assertBlockedBy(validInput({ release_refs: [] }), 'PR-BLK-001');
});

test('NEG-02 PR-BLK-002 bloquea identidad de release incoherente', () => {
  const refs = releasesFor([{ package_name: '@vento/contracts', version: '1.0.1' }]);
  refs[0].version = '1.0.2';
  assertBlockedBy(validInput({ release_refs: refs }), 'PR-BLK-002');
});

test('NEG-03 PR-BLK-003 bloquea drift manifest-lockfile', () => {
  const lockfile = lockfileFor([{ package_name: '@vento/contracts', version: '1.0.1' }]);
  lockfile.packages[''].dependencies['@vento/contracts'] = '1.0.0';
  assertBlockedBy(validInput({ lockfile_after: lockfile }), 'PR-BLK-003');
});

test('NEG-04 PR-BLK-004 bloquea rango flotante', () => {
  const to = [{ package_name: '@vento/contracts', version: '^1.0.1' }];
  assertBlockedBy(validInput({
    package_set_to: to,
    manifest_after: manifestFor(to),
    lockfile_after: lockfileFor(to),
    release_refs: releasesFor(to),
    compatibilities: compatibilitiesFor(to),
  }), 'PR-BLK-004');
});

test('NEG-05 PR-BLK-005 bloquea compatibilidad ausente', () => {
  assertBlockedBy(validInput({ compatibilities: [] }), 'PR-BLK-005');
});

test('NEG-06 PR-BLK-006 bloquea gate obligatorio fallido', () => {
  const gates = passingGateResults();
  gates['PKG-GATE-009'] = { status: 'FAIL', evidence_ids: [sha('failed-consumer-tests')] };
  assertBlockedBy(validInput({ gate_results: gates }), 'PR-BLK-006');
});

test('NEG-07 PR-BLK-007 bloquea evidencia stale', () => {
  assertBlockedBy(validInput({
    evidence_snapshot: {
      base_commit: commits.otherBase,
      proposal_commit: commits.proposal,
      manifest_after_hash: sha('wrong-manifest'),
      lockfile_after_hash: sha('wrong-lock'),
      package_set_to_identity: sha('wrong-set'),
    },
  }), 'PR-BLK-007');
});

test('NEG-08 PR-BLK-008 bloquea MAJOR sin preparación', () => {
  const input = validInput({ update_class: 'MAJOR_UPDATE' });
  input.risk_controls = { ...input.risk_controls, major_ready: false };
  assertBlockedBy(input, 'PR-BLK-008');
});

test('NEG-09 PR-BLK-009 bloquea deprecación incompleta', () => {
  const input = validInput({ update_class: 'DEPRECATION_MIGRATION' });
  input.risk_controls = { ...input.risk_controls, deprecation_ready: false };
  assertBlockedBy(input, 'PR-BLK-009');
});

test('NEG-10 PR-BLK-010 bloquea security update insegura', () => {
  const input = validInput({ update_class: 'SECURITY_UPDATE' });
  input.risk_controls = { ...input.risk_controls, security_safe: false };
  assertBlockedBy(input, 'PR-BLK-010');
});

test('NEG-11 PR-BLK-011 bloquea impacto Supabase sin tarea propietaria', () => {
  const to = [{ package_name: '@vento/supabase', version: '1.0.1' }];
  const input = validInput({
    package_set_to: to,
    package_set_from: [{ package_name: '@vento/supabase', version: '1.0.0' }],
    manifest_before: manifestFor([{ package_name: '@vento/supabase', version: '1.0.0' }]),
    manifest_after: manifestFor(to),
    lockfile_before: lockfileFor([{ package_name: '@vento/supabase', version: '1.0.0' }]),
    lockfile_after: lockfileFor(to),
    release_refs: releasesFor(to),
    compatibilities: compatibilitiesFor(to),
    supabase_impact: 'REQUIERE_CAMBIO',
  });
  input.risk_controls = { ...input.risk_controls, supabase_owner_task: null };
  assertBlockedBy(input, 'PR-BLK-011');
});

test('NEG-12 PR-BLK-012 bloquea ausencia de snapshot de rollback', () => {
  assertBlockedBy(validInput({ rollback_ref: 'PENDING' }), 'PR-BLK-012');
});

test('NEG-13 PR-BLK-013 bloquea revisores incompletos', () => {
  assertBlockedBy(validInput({ approvals: [{ reviewer: 'NEXO_TECH_OWNER', status: 'APPROVED' }] }), 'PR-BLK-013');
});

test('NEG-14 PR-BLK-014 bloquea autoridad automatizada excesiva', () => {
  const input = validInput();
  input.automation = { ...input.automation, capabilities: [...input.automation.capabilities, 'merge_pr'] };
  assertBlockedBy(input, 'PR-BLK-014');
});

test('NEG-15 PR-BLK-015 bloquea cambios ajenos', () => {
  assertBlockedBy(validInput({ change_scope: { attributable_only: false } }), 'PR-BLK-015');
});

test('NEG-16 PR-BLK-016 bloquea conjunto multi-package no mínimo', () => {
  const to = [
    { package_name: '@vento/contracts', version: '1.0.1' },
    { package_name: '@vento/os-context', version: '1.0.1' },
  ];
  assertBlockedBy(validInput({
    package_set_to: to,
    manifest_after: manifestFor(to),
    lockfile_after: lockfileFor(to),
    release_refs: releasesFor(to),
    compatibilities: compatibilitiesFor(to),
    multi_package: { minimal: false, closed: true, resolvable: true },
  }), 'PR-BLK-016');
});

test('NEG-17 PR-BLK-017 bloquea sustitución silenciosa del objetivo', () => {
  assertBlockedBy(validInput({ reviewed_package_set_to_identity: sha('reviewed-old-target') }), 'PR-BLK-017');
});

test('NEG-18 PR-BLK-018 bloquea despliegue simultáneo no probado', () => {
  const input = validInput();
  input.risk_controls = { ...input.risk_controls, simultaneous_deploy_required: true };
  assertBlockedBy(input, 'PR-BLK-018');
});

// 16 regresiones obligatorias

test('REG-01 nunca normaliza un rango flotante como versión exacta', () => {
  const to = [{ package_name: '@vento/contracts', version: 'latest' }];
  const result = evaluateConsumerUpdate(validInput({
    package_set_to: to,
    manifest_after: manifestFor(to),
    lockfile_after: lockfileFor(to),
    release_refs: releasesFor(to),
    compatibilities: compatibilitiesFor(to),
  }));
  assert.notEqual(result.result, 'PASS');
});

test('REG-02 nunca acepta lockfile con drift respecto del manifest', () => {
  const input = validInput();
  input.lockfile_after.packages['node_modules/@vento/contracts'].version = '1.0.0';
  assertBlockedBy(input, 'PR-BLK-003');
});

test('REG-03 cambiar base_commit vuelve STALE la evidencia previa', () => {
  const baselineInput = validInput();
  const baseline = assertPass(baselineInput);
  const changed = validInput({ base_commit: commits.otherBase });
  const comparison = compareUpdateEvidence(baseline.evidence, changed);
  assert.equal(comparison.current, false);
  assert.equal(comparison.outcome, 'STALE');
});

test('REG-04 cambiar proposal_commit vuelve STALE checks y evidencia', () => {
  const baseline = assertPass(validInput());
  const comparison = compareUpdateEvidence(baseline.evidence, validInput({ proposal_commit: commits.otherProposal }));
  assert.equal(comparison.outcome, 'STALE');
});

test('REG-05 versión objetivo nueva no sustituye silenciosamente la revisada', () => {
  const oldInput = validInput();
  const oldResult = assertPass(oldInput);
  const to = [{ package_name: '@vento/contracts', version: '1.0.2' }];
  const nextInput = validInput({
    update_id: 'PKG-PR-NEXO-2',
    package_set_to: to,
    manifest_after: manifestFor(to),
    lockfile_after: lockfileFor(to),
    release_refs: releasesFor(to),
    compatibilities: compatibilitiesFor(to),
  });
  const comparison = compareUpdateEvidence(oldResult.evidence, nextInput);
  assert.equal(comparison.outcome, 'STALE');
});

test('REG-06 no duplica una propuesta equivalente en el historial', () => {
  const result = assertPass(validInput());
  const first = appendUpdateHistory([], result.evidence);
  const second = appendUpdateHistory(first.history, result.evidence);
  assert.equal(first.appended, true);
  assert.equal(second.appended, false);
  assert.equal(second.history.length, 1);
});

test('REG-07 supersesión preserva historia y enlaces bidireccionales', () => {
  const previous = assertPass(validInput());
  const to = [{ package_name: '@vento/contracts', version: '1.0.2' }];
  const nextInput = validInput({
    update_id: 'PKG-PR-NEXO-2',
    proposal_commit: commits.otherProposal,
    package_set_to: to,
    manifest_after: manifestFor(to),
    lockfile_after: lockfileFor(to),
    release_refs: releasesFor(to),
    compatibilities: compatibilitiesFor(to),
  });
  const supersession = supersedeUpdate(previous.evidence, nextInput);
  assert.equal(supersession.result, 'PASS');
  assert.equal(supersession.previous.record.superseded_by, 'PKG-PR-NEXO-2');
  assert.equal(supersession.next.evidence.record.supersedes, 'PKG-PR-NEXO-1');
});

test('REG-08 un resultado técnico correcto nunca habilita auto-merge', () => {
  const plan = automationActionPlan(assertPass(validInput()));
  assert.ok(plan.forbidden.includes('merge_pr'));
  assert.ok(!plan.actions.includes('merge_pr'));
});

test('REG-09 merge no habilita auto-deploy', () => {
  const plan = automationActionPlan(assertPass(validInput({ merged_at: '2026-08-17T20:30:00-05:00' })));
  assert.ok(plan.forbidden.includes('deploy'));
  assert.ok(!plan.actions.includes('deploy'));
});

test('REG-10 la implementación nunca escribe directamente a rama protegida', () => {
  const plan = automationActionPlan(assertPass(validInput()));
  assert.ok(plan.forbidden.includes('write_protected_branch'));
});

test('REG-11 no reutiliza privilegios de publicación como privilegios de consumidor', () => {
  const input = validInput();
  input.automation = { ...input.automation, capabilities: [...input.automation.capabilities, 'publish_package'] };
  assertBlockedBy(input, 'PR-BLK-014');
});

test('REG-12 no reutiliza resultados de otro consumidor', () => {
  const compatibilities = compatibilitiesFor([{ package_name: '@vento/contracts', version: '1.0.1' }], 'vento-viso');
  assertBlockedBy(validInput({ compatibilities }), 'PR-BLK-005');
});

test('REG-13 no reutiliza compatibilidad de otra versión o artefacto', () => {
  const compatibilities = compatibilitiesFor([{ package_name: '@vento/contracts', version: '1.0.0' }]);
  assertBlockedBy(validInput({ compatibilities }), 'PR-BLK-005');
});

test('REG-14 NOT_APPLICABLE nunca satisface un gate universal', () => {
  const gates = passingGateResults();
  gates['PKG-GATE-010'] = { status: 'NOT_APPLICABLE', reason: 'no permitido', evidence_ids: [] };
  assertBlockedBy(validInput({ gate_results: gates }), 'PR-BLK-006');
});

test('REG-15 FAIL/BLOCKED/CANCELLED/TIMED_OUT/STALE nunca se convierten en PASS', () => {
  for (const status of ['FAIL', 'BLOCKED', 'CANCELLED', 'TIMED_OUT', 'STALE']) {
    const gates = passingGateResults();
    gates['PKG-GATE-009'] = { status, evidence_ids: [sha(`status:${status}`)] };
    const result = evaluateConsumerUpdate(validInput({ gate_results: gates }));
    assert.equal(result.result, 'BLOCKED', status);
  }
});

test('REG-16 nunca ejecuta ni infiere una migración Supabase desde consumidor', () => {
  const input = validInput({ supabase_impact: 'REQUIERE_CAMBIO' });
  input.risk_controls = { ...input.risk_controls, remote_data_or_supabase_change: true, supabase_owner_task: null };
  const result = assertBlockedBy(input, 'PR-BLK-011');
  assert.ok(automationActionPlan(result).forbidden.includes('supabase_mutation'));
});
