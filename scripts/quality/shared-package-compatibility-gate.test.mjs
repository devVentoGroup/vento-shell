import assert from 'node:assert/strict';
import crypto from 'node:crypto';
import fs from 'node:fs';
import os from 'node:os';
import path from 'node:path';
import test from 'node:test';

import {
  BASE_BAND_COVERAGE_POINTS,
  CANONICAL_BASE_COVERAGE_PLAN,
  CANONICAL_BASE_RELATIONS,
  CANONICAL_WEB_CONSUMERS,
  COMPATIBILITY_AXES,
  appendCompatibilityHistory,
  bindCompatibilityIdentityToReleaseContract,
  buildGlobalCompatibilitySnapshot,
  comparePreparedEvidence,
  compatibilityIdentity,
  evaluateRelation,
  finalizeCompatibilityEvidence,
  invalidateCompatibilityEvidence,
  normalizeLf,
  prepareCompatibilityEvidence,
  stableCanonicalStringify,
  validateBaseMatrixDefinition,
  validateExtensionBinding,
  writeRuntimeEvidence,
} from './shared-package-compatibility-gate.mjs';

const PACKAGES = [
  '@vento/contracts',
  '@vento/os-context',
  '@vento/supabase',
  '@vento/ui-web',
];

function sha256Identity(label) {
  return `sha256:${crypto.createHash('sha256').update(label).digest('hex')}`;
}

function commit(label) {
  return crypto.createHash('sha1').update(label).digest('hex');
}

function integrity(label) {
  return `sha512-${crypto.createHash('sha512').update(label).digest('base64')}`;
}

function clone(value) {
  return structuredClone(value);
}

function makeTestEvidence(packageName, version, sourceCommit, manifestIdentity) {
  const evidence = {
    schema_version: 1,
    gate_instance: 'SHELL-CI-001::GLOBAL',
    run_identity: sha256Identity(`test-run:${packageName}`),
    outcome: 'PASS',
    package: packageName,
    candidate_version: version,
    source_commit: sourceCommit,
    manifest_identity: manifestIdentity,
    internal_dependency_set: [],
    runtime_identity: sha256Identity(`test-runtime:${packageName}`),
    test_contract_identity: sha256Identity(`test-contract:${packageName}`),
    fixture_identities: [],
    gate_implementation_identity: sha256Identity('ci001-implementation'),
    required_groups: ['unit', 'contract'],
    executed_groups: ['unit', 'contract'],
    test_counts: { total: 2, passed: 2, failed: 0, skipped: 0 },
    invalidation_reason: null,
  };
  evidence.material_identity_sha256 = sha256Identity(stableCanonicalStringify(evidence));
  return evidence;
}

function makeBuildEvidence(packageName, version, sourceCommit, manifestIdentity, artifactIdentity, artifactIntegrity) {
  const evidence = {
    schema_version: 1,
    gate_instance: 'SHELL-CI-002::GLOBAL',
    run_identity: sha256Identity(`build-run:${packageName}`),
    build_status: 'PASS',
    package_name: packageName,
    package_candidate_version: version,
    source_commit: sourceCommit,
    package_manifest_hash: manifestIdentity,
    lockfile_hash: sha256Identity(`package-lock:${packageName}`),
    toolchain_identity: sha256Identity(`build-toolchain:${packageName}`),
    runtime_identity: sha256Identity(`build-runtime:${packageName}`),
    resolved_internal_dependency_set: [],
    public_surface_identity: sha256Identity(`public-surface:${packageName}`),
    build_contract_identity: sha256Identity(`build-contract:${packageName}`),
    gate_implementation_identity: sha256Identity('ci002-implementation'),
    artifact_file_manifest: [{ path: 'dist/index.js', sha256: sha256Identity(`file:${packageName}`) }],
    artifact_content_hash: artifactIdentity,
    declarations_identity: sha256Identity(`declarations:${packageName}`),
    exports_identity: sha256Identity(`exports:${packageName}`),
    pack_integrity: artifactIntegrity,
    invalidation_reason: null,
  };
  evidence.material_identity_sha256 = sha256Identity(stableCanonicalStringify(evidence));
  return evidence;
}

function makePackageSnapshot(packageName) {
  const packageIndex = PACKAGES.indexOf(packageName) + 1;
  const version = `1.${packageIndex}.3`;
  const sourceCommit = commit(`package:${packageName}`);
  const manifestIdentity = sha256Identity(`manifest:${packageName}`);
  const artifactIdentity = sha256Identity(`artifact:${packageName}`);
  const artifactIntegrity = integrity(`artifact:${packageName}`);
  return {
    package_name: packageName,
    package_version: version,
    package_source_commit: sourceCommit,
    package_manifest_identity: manifestIdentity,
    artifact_content_identity: artifactIdentity,
    artifact_integrity: artifactIntegrity,
    test_evidence: makeTestEvidence(packageName, version, sourceCommit, manifestIdentity),
    build_evidence: makeBuildEvidence(
      packageName,
      version,
      sourceCommit,
      manifestIdentity,
      artifactIdentity,
      artifactIntegrity,
    ),
  };
}

function makeConsumerSnapshot(consumerRepository) {
  return {
    consumer_repository: consumerRepository,
    consumer_commit: commit(`consumer:${consumerRepository}`),
    consumer_manifest_identity: sha256Identity(`consumer-manifest:${consumerRepository}`),
    consumer_lockfile_identity: sha256Identity(`consumer-lock:${consumerRepository}`),
  };
}

function bandVersions() {
  return {
    node: { minimum: '24.0.0', maximum_tested: '24.19.0' },
    react: { minimum: '19.0.0', maximum_tested: '19.2.3' },
    react_dom: { minimum: '19.0.0', maximum_tested: '19.2.3' },
  };
}

function resolvedVersions() {
  return {
    node: '24.19.0',
    react: '19.2.3',
    react_dom: '19.2.3',
    next: '16.2.1',
  };
}

function coverageEvaluations(relationIdentity) {
  const bands = bandVersions();
  const resolved = resolvedVersions();
  return [
    {
      coverage_point: 'minimum_declared',
      status: 'PASS',
      evidence_ids: [sha256Identity(`${relationIdentity}:minimum`)],
      observed_versions: Object.fromEntries(Object.entries(bands).map(([key, value]) => [key, value.minimum])),
    },
    {
      coverage_point: 'maximum_tested',
      status: 'PASS',
      evidence_ids: [sha256Identity(`${relationIdentity}:maximum`)],
      observed_versions: Object.fromEntries(Object.entries(bands).map(([key, value]) => [key, value.maximum_tested])),
    },
    {
      coverage_point: 'consumer_effective',
      status: 'PASS',
      evidence_ids: [sha256Identity(`${relationIdentity}:effective`)],
      observed_versions: resolved,
    },
    {
      coverage_point: 'relevant_peers',
      status: 'PASS',
      evidence_ids: [sha256Identity(`${relationIdentity}:peers`)],
      observed_versions: { react: resolved.react, react_dom: resolved.react_dom },
    },
    {
      coverage_point: 'server_client_ssr',
      status: 'PASS',
      evidence_ids: [sha256Identity(`${relationIdentity}:ssr`)],
      observed: { server: true, client: true, ssr: true },
    },
  ];
}

function axisEvaluations(relationIdentity) {
  return COMPATIBILITY_AXES.map(({ id }) => ({
    axis_id: id,
    status: 'PASS',
    evidence_ids: [sha256Identity(`${relationIdentity}:${id}`)],
  }));
}

function makeRelation(canonicalRelation, packageSnapshot, consumerSnapshot) {
  const relationIdentity = canonicalRelation.relation_identity;
  return {
    relation_identity: relationIdentity,
    relation_source: 'BASE_WEB_MATRIX',
    package_name: packageSnapshot.package_name,
    package_version: packageSnapshot.package_version,
    package_source_commit: packageSnapshot.package_source_commit,
    package_manifest_identity: packageSnapshot.package_manifest_identity,
    artifact_content_identity: packageSnapshot.artifact_content_identity,
    artifact_integrity: packageSnapshot.artifact_integrity,
    candidate_bands: bandVersions(),
    consumer_repository: consumerSnapshot.consumer_repository,
    consumer_commit: consumerSnapshot.consumer_commit,
    consumer_manifest_identity: consumerSnapshot.consumer_manifest_identity,
    consumer_lockfile_identity: consumerSnapshot.consumer_lockfile_identity,
    declared_versions: {
      node: '>=24 <25',
      react: '^19.0.0',
      react_dom: '^19.0.0',
      next: '^16.1.0',
    },
    resolved_versions: resolvedVersions(),
    toolchain_identity: sha256Identity(`toolchain:${consumerSnapshot.consumer_repository}`),
    runtime_identity: sha256Identity(`runtime:${consumerSnapshot.consumer_repository}`),
    runtime_reproducible: true,
    environment: 'synthetic-web',
    target: 'WEB',
    renderer: 'NEXT',
    profile: 'BASE_WEB',
    coverage_evaluations: coverageEvaluations(relationIdentity),
    axes: axisEvaluations(relationIdentity),
    restrictions: [],
    evidence_ids: [sha256Identity(`${relationIdentity}:relation-evidence`)],
    evidence_context: {
      package_name: packageSnapshot.package_name,
      consumer_repository: consumerSnapshot.consumer_repository,
      target: 'WEB',
      renderer: 'NEXT',
    },
    bypass_flags: [],
    stale: false,
    invalidation_reason: null,
  };
}

function makePrepareInput(packageName, { releaseChannelType = 'STABLE', pilotRelationIds = [] } = {}) {
  const packageSnapshot = makePackageSnapshot(packageName);
  const consumerSnapshots = CANONICAL_WEB_CONSUMERS.map(makeConsumerSnapshot);
  const snapshotByConsumer = new Map(consumerSnapshots.map((snapshot) => [snapshot.consumer_repository, snapshot]));
  const relations = CANONICAL_BASE_RELATIONS
    .filter((relation) => relation.package_name === packageName)
    .map((relation) => makeRelation(relation, packageSnapshot, snapshotByConsumer.get(relation.consumer_repository)));
  return {
    schema_version: 1,
    release_channel_type: releaseChannelType,
    pilot_relation_ids: pilotRelationIds,
    package_snapshot: packageSnapshot,
    consumer_snapshots: consumerSnapshots,
    relations,
    extension_bindings: [],
    metadata: {
      observed_at: '2026-08-17T20:00:00-05:00',
      locale: 'es-CO',
      timezone: 'America/Bogota',
    },
  };
}

function makeExtension(packageSnapshot, { platform = 'REACT_NATIVE', explicitUiWeb = false } = {}) {
  const consumerSnapshot = makeConsumerSnapshot('vento-anima');
  const binding = {
    binding_identity: 'SYNTHETIC-NATIVE-BINDING-001',
    owner_contract: 'SYNTHETIC-OWNER-CONTRACT-001',
    owner: 'SYNTHETIC_OWNER',
    approved: true,
    package_name: packageSnapshot.package_name,
    consumer_repository: consumerSnapshot.consumer_repository,
    target: platform === 'EXPO_WEB' ? 'WEB_EXPO' : 'NATIVE',
    renderer: platform === 'EXPO_WEB' ? 'EXPO_WEB' : 'REACT_NATIVE',
    platform,
    explicit_ui_web_binding: explicitUiWeb,
    required: true,
  };
  const relation = makeRelation(
    {
      relation_identity: binding.binding_identity,
      package_name: packageSnapshot.package_name,
      consumer_repository: consumerSnapshot.consumer_repository,
    },
    packageSnapshot,
    consumerSnapshot,
  );
  relation.relation_source = binding.owner_contract;
  relation.relation_identity = binding.binding_identity;
  relation.target = binding.target;
  relation.renderer = binding.renderer;
  relation.profile = platform === 'EXPO_WEB' ? 'EXPO_WEB_EXPLICIT' : 'NATIVE_BINDING';
  relation.evidence_context.target = relation.target;
  relation.evidence_context.renderer = relation.renderer;
  relation.coverage_evaluations = coverageEvaluations(binding.binding_identity);
  relation.axes = axisEvaluations(binding.binding_identity);
  relation.evidence_ids = [sha256Identity(`${binding.binding_identity}:relation-evidence`)];
  return { binding, relation, consumerSnapshot };
}

function makeReleaseBundle(prepared) {
  const baseContract = {
    schema_version: 1,
    package_name: prepared.package_name,
    release_version: prepared.package_version,
    source_commit: prepared.package_source_commit,
    release_channel: 'latest',
    release_channel_type: 'STABLE',
    execution_mode: 'SYNTHETIC',
    distribution_change: true,
    changelog_required: false,
    compatibility_required: true,
    compatibility_evidence_identity: prepared.compatibility_evidence_identity,
    approved_internal_prereleases: [],
  };
  const bound = bindCompatibilityIdentityToReleaseContract(baseContract, prepared);
  assert.deepEqual(bound.errors, []);
  const source = `${JSON.stringify(bound.contract, null, 2)}\n`;
  const releaseEvidence = {
    schema_version: 1,
    gate_instance: 'SHELL-CI-003::GLOBAL',
    release_run_identity: sha256Identity(`release-run:${prepared.package_name}`),
    release_status: 'PASS',
    package_name: prepared.package_name,
    release_version: prepared.package_version,
    source_commit: prepared.package_source_commit,
    package_manifest_hash: prepared.package_manifest_identity,
    lockfile_hash: sha256Identity(`release-lock:${prepared.package_name}`),
    resolved_internal_dependency_set: [],
    test_evidence_identity: prepared.test_evidence_identity,
    build_evidence_identity: prepared.build_evidence_identity,
    artifact_file_manifest_identity: sha256Identity(`release-files:${prepared.package_name}`),
    artifact_content_hash: prepared.artifact_content_identity,
    pack_integrity: prepared.artifact_integrity,
    release_channel: 'latest',
    release_channel_type: 'STABLE',
    release_contract_identity: sha256Identity(normalizeLf(source)),
    tag_serialization_identity: sha256Identity('tag-serialization'),
    gate_implementation_identity: sha256Identity('ci003-implementation'),
    material_identity_sha256: sha256Identity(`release-material:${prepared.package_name}`),
  };
  return { contract: bound.contract, source, evidence: releaseEvidence };
}

function relationContext(input, relation) {
  return {
    packageSnapshot: input.package_snapshot,
    consumerSnapshot: input.consumer_snapshots.find((entry) => entry.consumer_repository === relation.consumer_repository),
  };
}

function assertBlocked(result, pattern) {
  assert.equal(result.result, 'BLOCKED');
  if (pattern) assert.match(result.reasons.join('\n'), pattern);
}

// 8 positive contractual cases.

test('P01 relation web con todos los ejes aplicables en PASS deriva COMPATIBLE', () => {
  const input = makePrepareInput('@vento/contracts');
  const relation = input.relations[0];
  const result = evaluateRelation(relation, relationContext(input, relation));
  assert.equal(result.state, 'COMPATIBLE');
});

test('P02 restriccion explicita completa deriva COMPATIBLE_CON_RESTRICCIONES', () => {
  const input = makePrepareInput('@vento/contracts');
  const relation = input.relations[0];
  relation.restrictions = [{
    owner: 'SYNTHETIC_OWNER',
    scope: 'synthetic browser range',
    exit_criteria: 'revalidate after candidate update',
    reason: 'synthetic constrained compatibility',
  }];
  const result = evaluateRelation(relation, relationContext(input, relation));
  assert.equal(result.state, 'COMPATIBLE_CON_RESTRICCIONES');
});

test('P03 snapshot global conserva 28 relaciones y 140 evaluaciones base', () => {
  const prepared = PACKAGES.map((packageName) => prepareCompatibilityEvidence(makePrepareInput(packageName)));
  prepared.forEach((entry) => assert.equal(entry.result, 'PASS'));
  const global = buildGlobalCompatibilitySnapshot(prepared);
  assert.equal(global.result, 'PASS');
  assert.equal(global.base_relation_count, 28);
  assert.equal(global.base_coverage_evaluation_count, 140);
  assert.equal(CANONICAL_BASE_RELATIONS.length, 28);
  assert.equal(CANONICAL_BASE_COVERAGE_PLAN.length, 140);
});

test('P04 repeticion exacta conserva bytes canonicos e identidad', () => {
  const input = makePrepareInput('@vento/os-context');
  const first = prepareCompatibilityEvidence(input);
  const second = prepareCompatibilityEvidence(clone(input));
  assert.equal(first.result, 'PASS');
  assert.equal(second.result, 'PASS');
  assert.equal(first.compatibility_evidence_identity, second.compatibility_evidence_identity);
  assert.equal(stableCanonicalStringify(first), stableCanonicalStringify(second));
});

test('P05 corte multi-package mantiene matrices e identidades independientes', () => {
  const left = prepareCompatibilityEvidence(makePrepareInput('@vento/contracts'));
  const right = prepareCompatibilityEvidence(makePrepareInput('@vento/ui-web'));
  assert.equal(left.result, 'PASS');
  assert.equal(right.result, 'PASS');
  assert.notEqual(left.compatibility_evidence_identity, right.compatibility_evidence_identity);
  assert.equal(left.required_relation_ids.length, 7);
  assert.equal(right.required_relation_ids.length, 7);
});

test('P06 prerelease limita certificacion a pilotos explicitos', () => {
  const input = makePrepareInput('@vento/supabase', {
    releaseChannelType: 'PRERELEASE',
    pilotRelationIds: ['PKG-COMP-MX-015', 'PKG-COMP-MX-016'],
  });
  input.relations = input.relations.filter((relation) => input.pilot_relation_ids.includes(relation.relation_identity));
  const result = prepareCompatibilityEvidence(input);
  assert.equal(result.result, 'PASS');
  assert.deepEqual(result.required_relation_ids, ['PKG-COMP-MX-015', 'PKG-COMP-MX-016']);
  assert.equal(result.coverage_evaluation_count, 10);
});

test('P07 binding nativo propietario queda separado sin crear PKG-COMP-MX-029', () => {
  const input = makePrepareInput('@vento/os-context');
  const extension = makeExtension(input.package_snapshot);
  input.extension_bindings.push(extension.binding);
  input.consumer_snapshots.push(extension.consumerSnapshot);
  input.relations.push(extension.relation);
  const result = prepareCompatibilityEvidence(input);
  assert.equal(result.result, 'PASS');
  assert.ok(result.required_relation_ids.includes(extension.binding.binding_identity));
  assert.equal(result.required_relation_ids.includes('PKG-COMP-MX-029'), false);
});

test('P08 FINALIZE exacto con evidencia CI003 es idempotente y no muta PREPARE', () => {
  const prepared = prepareCompatibilityEvidence(makePrepareInput('@vento/contracts'));
  const before = stableCanonicalStringify(prepared);
  const release = makeReleaseBundle(prepared);
  const first = finalizeCompatibilityEvidence(prepared, {
    release_contract_source: release.source,
    release_contract: release.contract,
    release_evidence: release.evidence,
    history: [],
  });
  const second = finalizeCompatibilityEvidence(prepared, {
    release_contract_source: release.source,
    release_contract: release.contract,
    release_evidence: release.evidence,
    history: first.history,
  });
  assert.equal(first.result, 'PASS');
  assert.equal(second.result, 'PASS');
  assert.equal(first.evidence.finalization_identity, second.evidence.finalization_identity);
  assert.equal(second.appended, false);
  assert.equal(second.history.length, 1);
  assert.equal(stableCanonicalStringify(prepared), before);
});

// 20 negative contractual cases.

test('N01 bloquea package fuera de las familias gobernadas', () => {
  const input = makePrepareInput('@vento/contracts');
  input.package_snapshot.package_name = '@vento/unknown';
  const result = prepareCompatibilityEvidence(input);
  assertBlocked(result, /PACKAGE_NOT_CANONICAL/u);
});

test('N02 bloquea relacion base faltante', () => {
  const input = makePrepareInput('@vento/contracts');
  input.relations.pop();
  const result = prepareCompatibilityEvidence(input);
  assertBlocked(result, /REQUIRED_BASE_RELATION_MISSING/u);
});

test('N03 bloquea relacion base duplicada', () => {
  const input = makePrepareInput('@vento/contracts');
  input.relations.push(clone(input.relations[0]));
  const result = prepareCompatibilityEvidence(input);
  assertBlocked(result, /RELATION_ID_DUPLICATE/u);
});

test('N04 bloquea PKG-COMP-MX inventado o reasignado', () => {
  const matrix = clone(CANONICAL_BASE_RELATIONS);
  matrix[0].consumer_repository = 'vento-numera';
  matrix.push({
    relation_identity: 'PKG-COMP-MX-029',
    relation_source: 'BASE_WEB_MATRIX',
    package_name: '@vento/contracts',
    consumer_repository: 'vento-shell',
  });
  const errors = validateBaseMatrixDefinition(matrix);
  assert.match(errors.join('\n'), /BASE_RELATION_REASSIGNED|BASE_RELATION_INVENTED/u);
});

test('N05 bloquea version del package distinta al candidato', () => {
  const input = makePrepareInput('@vento/contracts');
  input.relations[0].package_version = '9.9.9';
  assertBlocked(prepareCompatibilityEvidence(input), /PACKAGE_SNAPSHOT_MISMATCH:package_version/u);
});

test('N06 bloquea commit manifest artefacto o integridad incompatibles', () => {
  const input = makePrepareInput('@vento/contracts');
  input.relations[0].artifact_content_identity = sha256Identity('wrong-artifact');
  assertBlocked(prepareCompatibilityEvidence(input), /PACKAGE_SNAPSHOT_MISMATCH:artifact_content_identity/u);
});

test('N07 bloquea commit del consumidor distinto al probado', () => {
  const input = makePrepareInput('@vento/contracts');
  input.relations[0].consumer_commit = commit('different-consumer');
  assertBlocked(prepareCompatibilityEvidence(input), /CONSUMER_SNAPSHOT_MISMATCH:consumer_commit/u);
});

test('N08 bloquea manifest del consumidor distinto al probado', () => {
  const input = makePrepareInput('@vento/contracts');
  input.relations[0].consumer_manifest_identity = sha256Identity('different-manifest');
  assertBlocked(prepareCompatibilityEvidence(input), /CONSUMER_SNAPSHOT_MISMATCH:consumer_manifest_identity/u);
});

test('N09 bloquea lockfile distinto al probado', () => {
  const input = makePrepareInput('@vento/contracts');
  input.relations[0].consumer_lockfile_identity = sha256Identity('different-lockfile');
  assertBlocked(prepareCompatibilityEvidence(input), /CONSUMER_SNAPSHOT_MISMATCH:consumer_lockfile_identity/u);
});

test('N10 bloquea versiones resueltas obligatorias ausentes', () => {
  const input = makePrepareInput('@vento/contracts');
  input.relations[0].resolved_versions = {};
  assertBlocked(prepareCompatibilityEvidence(input), /RESOLVED_VERSIONS_MISSING|RESOLVED_VERSION_MISSING/u);
});

test('N11 bloquea consumidor web estable sin runtime reproducible', () => {
  const input = makePrepareInput('@vento/contracts');
  input.relations[0].runtime_reproducible = false;
  assertBlocked(prepareCompatibilityEvidence(input), /RUNTIME_NOT_REPRODUCIBLE/u);
});

test('N12 bloquea peer o version resuelta fuera de la banda candidata', () => {
  const input = makePrepareInput('@vento/contracts');
  input.relations[0].resolved_versions.node = '25.0.0';
  input.relations[0].coverage_evaluations.find((entry) => entry.coverage_point === 'consumer_effective').observed_versions.node = '25.0.0';
  assertBlocked(prepareCompatibilityEvidence(input), /RESOLVED_VERSION_OUTSIDE_BAND:node/u);
});

test('N13 bloquea eje obligatorio ausente', () => {
  const input = makePrepareInput('@vento/contracts');
  input.relations[0].axes = input.relations[0].axes.filter((axis) => axis.axis_id !== 'COMP-AXIS-012');
  assertBlocked(prepareCompatibilityEvidence(input), /AXIS_MISSING:COMP-AXIS-012/u);
});

test('N14 bloquea eje obligatorio fallido bloqueado cancelado o timeout', () => {
  const statuses = ['FAIL', 'BLOCKED', 'CANCELLED', 'TIMED_OUT'];
  for (const status of statuses) {
    const input = makePrepareInput('@vento/contracts');
    input.relations[0].axes[0].status = status;
    const result = prepareCompatibilityEvidence(input);
    assert.equal(result.result, 'BLOCKED');
  }
});

test('N15 bloquea NOT_APPLICABLE sin justificacion contractual', () => {
  const input = makePrepareInput('@vento/contracts');
  input.relations[0].axes[0] = { axis_id: 'COMP-AXIS-001', status: 'NOT_APPLICABLE', evidence_ids: [] };
  assertBlocked(prepareCompatibilityEvidence(input), /AXIS_NOT_APPLICABLE_REASON_MISSING/u);
});

test('N16 bloquea evidencia stale reutilizada despues de cambiar una entrada', () => {
  const input = makePrepareInput('@vento/contracts');
  input.relations[0].stale = true;
  input.relations[0].invalidation_reason = 'consumer lockfile changed';
  assertBlocked(prepareCompatibilityEvidence(input), /REQUIRED_RELATION_NOT_COMPATIBLE/u);
});

test('N17 bloquea restriccion sin owner alcance o salida', () => {
  const input = makePrepareInput('@vento/contracts');
  input.relations[0].restrictions = [{ owner: '', scope: '', exit_criteria: '', reason: 'synthetic' }];
  assertBlocked(prepareCompatibilityEvidence(input), /RESTRICTION_OWNER_MISSING|RESTRICTION_SCOPE_MISSING|RESTRICTION_EXIT_CRITERIA_MISSING/u);
});

test('N18 bloquea release estable con relacion requerida pendiente bloqueada o incompatible', () => {
  for (const status of ['PENDING', 'BLOCKED', 'FAIL']) {
    const input = makePrepareInput('@vento/contracts');
    input.relations[0].axes[0].status = status;
    assert.equal(prepareCompatibilityEvidence(input).result, 'BLOCKED');
  }
});

test('N19 bloquea evidencia de otro consumidor target renderer o package', () => {
  const input = makePrepareInput('@vento/contracts');
  input.relations[0].evidence_context.target = 'NATIVE';
  assertBlocked(prepareCompatibilityEvidence(input), /EVIDENCE_CONTEXT_MISMATCH:target/u);
});

test('N20 bloquea FINALIZE con evidencia CI003 de otra identidad material', () => {
  const prepared = prepareCompatibilityEvidence(makePrepareInput('@vento/contracts'));
  const release = makeReleaseBundle(prepared);
  release.evidence.artifact_content_hash = sha256Identity('other-release-artifact');
  const result = finalizeCompatibilityEvidence(prepared, {
    release_contract_source: release.source,
    release_contract: release.contract,
    release_evidence: release.evidence,
  });
  assertBlocked(result, /RELEASE_EVIDENCE_ARTIFACT_MISMATCH/u);
});

// 16 regression cases.

test('R01 orden distinto de claves JSON no altera el digest logico', () => {
  const left = { b: 2, a: { y: 2, x: 1 } };
  const right = { a: { x: 1, y: 2 }, b: 2 };
  assert.equal(compatibilityIdentity(left), compatibilityIdentity(right));
});

test('R02 CRLF y LF producen la misma identidad logica normalizada', () => {
  assert.equal(compatibilityIdentity({ text: 'a\r\nb\r\n' }), compatibilityIdentity({ text: 'a\nb\n' }));
});

test('R03 locale timezone y reloj no alteran compatibility_evidence_identity', () => {
  const firstInput = makePrepareInput('@vento/contracts');
  const secondInput = clone(firstInput);
  secondInput.metadata = {
    observed_at: '2099-01-01T00:00:00+09:00',
    locale: 'ja-JP',
    timezone: 'Asia/Tokyo',
  };
  const first = prepareCompatibilityEvidence(firstInput);
  const second = prepareCompatibilityEvidence(secondInput);
  assert.equal(first.compatibility_evidence_identity, second.compatibility_evidence_identity);
});

test('R04 reintento exacto no duplica evaluacion historica', () => {
  const prepared = prepareCompatibilityEvidence(makePrepareInput('@vento/contracts'));
  const once = appendCompatibilityHistory([], prepared);
  const twice = appendCompatibilityHistory(once.history, clone(prepared));
  assert.equal(once.history.length, 1);
  assert.equal(twice.history.length, 1);
  assert.equal(twice.appended, false);
});

test('R05 cambio de package invalida evidencia previa y vuelve stale', () => {
  const input = makePrepareInput('@vento/contracts');
  const prepared = prepareCompatibilityEvidence(input);
  const changed = clone(input);
  changed.package_snapshot.package_version = '2.0.0';
  changed.package_snapshot.test_evidence.candidate_version = '2.0.0';
  changed.package_snapshot.build_evidence.package_candidate_version = '2.0.0';
  changed.relations.forEach((relation) => { relation.package_version = '2.0.0'; });
  const comparison = comparePreparedEvidence(prepared, changed);
  assert.equal(comparison.outcome, 'STALE');
});

test('R06 cambio de lockfile consumidor invalida evidencia', () => {
  const input = makePrepareInput('@vento/contracts');
  const prepared = prepareCompatibilityEvidence(input);
  const changed = clone(input);
  const newIdentity = sha256Identity('changed-consumer-lock');
  changed.consumer_snapshots[0].consumer_lockfile_identity = newIdentity;
  changed.relations[0].consumer_lockfile_identity = newIdentity;
  const comparison = comparePreparedEvidence(prepared, changed);
  assert.equal(comparison.outcome, 'STALE');
});

test('R07 cambio de toolchain invalida evidencia', () => {
  const input = makePrepareInput('@vento/contracts');
  const prepared = prepareCompatibilityEvidence(input);
  const changed = clone(input);
  changed.relations[0].toolchain_identity = sha256Identity('new-toolchain');
  const comparison = comparePreparedEvidence(prepared, changed);
  assert.equal(comparison.outcome, 'STALE');
});

test('R08 perdida duplicacion o renumeracion de las 28 relaciones queda protegida', () => {
  assert.deepEqual(validateBaseMatrixDefinition(CANONICAL_BASE_RELATIONS), []);
  assert.equal(CANONICAL_BASE_RELATIONS.length, 28);
  assert.equal(CANONICAL_BASE_COVERAGE_PLAN.length, 140);
  const missing = clone(CANONICAL_BASE_RELATIONS).slice(1);
  assert.match(validateBaseMatrixDefinition(missing).join('\n'), /BASE_MATRIX_CARDINALITY|BASE_RELATION_MISSING/u);
});

test('R09 ANIMA u otro target adicional no puede convertirse en relacion 29', () => {
  const binding = {
    binding_identity: 'PKG-COMP-MX-029',
    owner_contract: 'SYNTHETIC-OWNER-CONTRACT-001',
    owner: 'SYNTHETIC_OWNER',
    approved: true,
    package_name: '@vento/os-context',
    consumer_repository: 'vento-anima',
    target: 'NATIVE',
    renderer: 'REACT_NATIVE',
  };
  assert.match(validateExtensionBinding(binding).join('\n'), /EXTENSION_BINDING_BASE_ID_FORBIDDEN/u);
});

test('R10 Expo Web no implica automaticamente @vento/ui-web', () => {
  const snapshot = makePackageSnapshot('@vento/ui-web');
  const extension = makeExtension(snapshot, { platform: 'EXPO_WEB', explicitUiWeb: false });
  extension.binding.auto_package_inference = true;
  const errors = validateExtensionBinding(extension.binding);
  assert.match(errors.join('\n'), /EXPO_WEB_REQUIRES_EXPLICIT_UI_WEB_BINDING|AUTO_PACKAGE_INFERENCE_FORBIDDEN/u);
});

test('R11 PASS de un target no certifica otro target obligatorio', () => {
  const input = makePrepareInput('@vento/contracts');
  input.relations[0].target = 'NATIVE';
  assertBlocked(prepareCompatibilityEvidence(input), /EVIDENCE_CONTEXT_MISMATCH:target/u);
});

test('R12 skipLibCheck cast global mock permisivo u override oculto bloquean la relacion', () => {
  for (const flag of ['skipLibCheck', 'global_cast', 'permissive_mock', 'hidden_override']) {
    const input = makePrepareInput('@vento/contracts');
    input.relations[0].bypass_flags = [flag];
    assertBlocked(prepareCompatibilityEvidence(input), /FORBIDDEN_BYPASS/u);
  }
});

test('R13 una sola version probada no amplia automaticamente toda una banda', () => {
  const input = makePrepareInput('@vento/contracts');
  input.relations[0].candidate_bands.react.maximum_tested = '19.9.9';
  assertBlocked(prepareCompatibilityEvidence(input), /BAND_MAXIMUM_NOT_PROVEN:react/u);
});

test('R14 deprecacion o retiro no elimina historia de compatibilidad previa', () => {
  const first = prepareCompatibilityEvidence(makePrepareInput('@vento/contracts'));
  const secondInput = makePrepareInput('@vento/contracts');
  const newLock = sha256Identity('historical-new-lock');
  secondInput.consumer_snapshots[0].consumer_lockfile_identity = newLock;
  secondInput.relations[0].consumer_lockfile_identity = newLock;
  const second = prepareCompatibilityEvidence(secondInput);
  assert.equal(first.result, 'PASS');
  assert.equal(second.result, 'PASS');
  const history = appendCompatibilityHistory(appendCompatibilityHistory([], first).history, second).history;
  assert.equal(history.length, 2);
  assert.equal(history[0].compatibility_evidence_identity, first.compatibility_evidence_identity);
});

test('R15 revalidacion no reescribe evidencia historica de release', () => {
  const prepared = prepareCompatibilityEvidence(makePrepareInput('@vento/contracts'));
  const release = makeReleaseBundle(prepared);
  const first = finalizeCompatibilityEvidence(prepared, {
    release_contract_source: release.source,
    release_contract: release.contract,
    release_evidence: release.evidence,
  });
  const original = stableCanonicalStringify(first.history[0]);
  const revalidatedEvidence = clone(release.evidence);
  revalidatedEvidence.release_run_identity = sha256Identity('release-revalidation-run');
  revalidatedEvidence.material_identity_sha256 = sha256Identity('release-revalidation-material');
  const second = finalizeCompatibilityEvidence(prepared, {
    release_contract_source: release.source,
    release_contract: release.contract,
    release_evidence: revalidatedEvidence,
    history: first.history,
  });
  assert.equal(second.result, 'PASS');
  assert.equal(second.history.length, 2);
  assert.equal(stableCanonicalStringify(second.history[0]), original);
});

test('R16 gate solo escribe evidencia bajo .delivery y no toca consumidor real PR o release', () => {
  const root = fs.mkdtempSync(path.join(os.tmpdir(), 'vento-ci005-'));
  const consumer = path.join(root, 'consumer-real');
  const sentinel = path.join(consumer, 'sentinel.txt');
  fs.mkdirSync(consumer, { recursive: true });
  fs.writeFileSync(sentinel, 'UNCHANGED\n', 'utf8');
  try {
    const prepared = prepareCompatibilityEvidence(makePrepareInput('@vento/contracts'));
    const evidencePath = writeRuntimeEvidence(prepared, { repositoryRoot: root });
    assert.equal(fs.readFileSync(sentinel, 'utf8'), 'UNCHANGED\n');
    assert.match(evidencePath.replaceAll('\\', '/'), /\.delivery\/shared-package-compatibility\//u);
    const invalidated = invalidateCompatibilityEvidence(prepared, 'synthetic material change');
    assert.equal(invalidated.result, 'STALE');
    assert.ok(invalidated.relation_evaluations.every((entry) => entry.state === 'PENDIENTE_DE_EVIDENCIA'));
  } finally {
    fs.rmSync(root, { recursive: true, force: true });
  }
});

assert.equal(BASE_BAND_COVERAGE_POINTS.length, 5);