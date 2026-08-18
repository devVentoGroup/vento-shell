import assert from 'node:assert/strict';
import crypto from 'node:crypto';
import test from 'node:test';

import {
  asSha256Identity,
  validateReleaseContract,
} from './shared-package-release-gate.mjs';

import {
  finalizeChangelog,
  findDuplicateChangelogGateImplementations,
  mergeChangelogHistory,
  planCoordinatedChangelogs,
  prepareChangelog,
  releaseContractChangelogFields,
  renderChangelogEntry,
  stableCanonicalStringify,
  validateChangelogContract,
  validatePreparedMaterial,
} from './shared-package-changelog-gate.mjs';

function hash(label) {
  return `sha256:${crypto.createHash('sha256').update(String(label)).digest('hex')}`;
}

function manifest(packageName = '@vento/contracts', version = '1.2.3') {
  return {
    name: packageName,
    version,
    type: 'module',
    exports: { '.': './dist/index.js' },
  };
}

function record(overrides = {}) {
  return {
    change_record_id: 'CHG-001',
    package_name: '@vento/contracts',
    change_kind: 'FIXED',
    summary: 'Correct deterministic contract serialization for consumers.',
    semver_impact: 'PATCH',
    public_surfaces: ['serializeContract'],
    source_refs: ['src/contracts.ts'],
    breaking_change: false,
    migration_required: false,
    migration_reference: null,
    deprecation_ids: [],
    security_visibility: 'NOT_APPLICABLE',
    treq_refs: [],
    internal_change_reason: null,
    ...overrides,
  };
}

function scenario(overrides = {}) {
  const packageName = overrides.packageName ?? '@vento/contracts';
  const version = overrides.version ?? '1.2.3';
  const currentManifest = overrides.manifest ?? manifest(packageName, version);
  const manifestSource = overrides.manifestSource ?? `${JSON.stringify(currentManifest, null, 2)}\n`;
  const changeRecords = overrides.changeRecords ?? [record({ package_name: packageName })];
  const contract = {
    schema_version: 1,
    semantic_source: 'STRUCTURED_CHANGESET',
    package_name: packageName,
    release_version: version,
    source_commit: '1'.repeat(40),
    package_manifest_identity: asSha256Identity(manifestSource.replace(/\r\n?/gu, '\n')),
    base_release_package_name: packageName,
    base_release_version: '1.2.2',
    base_release_identity: hash('base-release'),
    base_artifact_content_identity: hash('base-artifact'),
    artifact_content_identity: hash('next-artifact'),
    distribution_change: true,
    distributable_change_ids: changeRecords.filter((item) => item.semver_impact !== 'NO_RELEASE').map((item) => item.change_record_id),
    release_channel_type: version.includes('-') ? 'PRERELEASE' : 'STABLE',
    execution_mode: 'SYNTHETIC',
    change_records: changeRecords,
    ...(overrides.contract ?? {}),
  };
  return { manifest: currentManifest, manifestSource, contract };
}

function prepare(overrides = {}) {
  const input = scenario(overrides);
  return { input, result: prepareChangelog(input) };
}

function releaseInputs(prepared, currentManifest) {
  const releaseContract = {
    schema_version: 1,
    package_name: prepared.package_name,
    release_version: prepared.release_version,
    source_commit: prepared.source_commit,
    release_channel: prepared.release_channel_type === 'PRERELEASE' ? 'fixture-preview' : 'fixture-stable',
    release_channel_type: prepared.release_channel_type,
    execution_mode: 'SYNTHETIC',
    distribution_change: true,
    approved_internal_prereleases: [],
    compatibility_required: false,
    ...releaseContractChangelogFields(prepared),
  };
  const releaseContractSource = `${JSON.stringify(releaseContract, null, 2)}\n`;
  const releaseEvidence = {
    schema_version: 1,
    gate_instance: 'SHELL-CI-003::GLOBAL',
    release_run_identity: 'fixture-release-run',
    release_status: 'PASS',
    invalidation_reason: null,
    package_name: prepared.package_name,
    release_version: prepared.release_version,
    source_commit: prepared.source_commit,
    release_contract_identity: asSha256Identity(releaseContractSource),
  };
  assert.deepEqual(validateReleaseContract(releaseContract, { manifest: currentManifest }), []);
  return { releaseContract, releaseContractSource, releaseEvidence };
}

function finalizePrepared(prepared, currentManifest, historySource = '', mutate = null) {
  const base = releaseInputs(prepared, currentManifest);
  if (mutate) mutate(base);
  return finalizeChangelog({
    prepared,
    manifest: currentManifest,
    historySource,
    ...base,
  });
}

// 8 positive cases.
test('positive 01 - PATCH candidate produces deterministic changelog and release notes', () => {
  const { result } = prepare();
  assert.equal(result.outcome, 'PASS');
  assert.match(result.prepared.rendered_changelog_entry, /### Fixed/u);
  assert.ok(result.prepared.changelog_identity.startsWith('sha256:'));
});

test('positive 02 - MINOR additive change is coherent with the version bump', () => {
  const change = record({ change_record_id: 'CHG-ADD-001', change_kind: 'ADDED', summary: 'Add a compatible public contract helper.', semver_impact: 'MINOR' });
  const { result } = prepare({ version: '1.3.0', changeRecords: [change] });
  assert.equal(result.outcome, 'PASS');
  assert.match(result.prepared.rendered_changelog_entry, /### Added/u);
});

test('positive 03 - MAJOR breaking change renders Breaking changes and Migration', () => {
  const change = record({
    change_record_id: 'CHG-BREAK-001',
    change_kind: 'CHANGED',
    summary: 'Replace the public contract serializer signature.',
    semver_impact: 'MAJOR',
    breaking_change: true,
    migration_required: true,
    migration_reference: 'docs/migrations/contracts-v2.md',
  });
  const { result } = prepare({ version: '2.0.0', changeRecords: [change] });
  assert.equal(result.outcome, 'PASS');
  assert.match(result.prepared.rendered_changelog_entry, /### Breaking changes/u);
  assert.match(result.prepared.rendered_changelog_entry, /### Migration/u);
});

test('positive 04 - stable deprecation with DEP record renders Deprecated coherently', () => {
  const change = record({
    change_record_id: 'CHG-DEP-001',
    change_kind: 'DEPRECATED',
    summary: 'Deprecate the legacy contract parser in favor of parseContractV2.',
    semver_impact: 'MINOR',
    migration_required: true,
    migration_reference: 'docs/migrations/parse-contract-v2.md',
    deprecation_ids: ['DEP-CONTRACTS-001'],
  });
  const { result } = prepare({ version: '1.3.0', changeRecords: [change] });
  assert.equal(result.outcome, 'PASS');
  assert.match(result.prepared.rendered_changelog_entry, /DEP-CONTRACTS-001/u);
});

test('positive 05 - valid rc prerelease remains explicitly non-stable', () => {
  const change = record({
    change_record_id: 'CHG-RC-001',
    change_kind: 'CHANGED',
    summary: 'Prepare the next major contract shape for validation.',
    semver_impact: 'MAJOR',
    breaking_change: true,
    migration_required: true,
    migration_reference: 'docs/migrations/contracts-v2.md',
  });
  const { result } = prepare({ version: '2.0.0-rc.1', changeRecords: [change] });
  assert.equal(result.outcome, 'PASS');
  assert.match(result.prepared.release_notes, /Prerelease/u);
});

test('positive 06 - coordinated cut keeps two changed packages and omits one NO_RELEASE package', () => {
  const contracts = prepare().result;
  const uiChange = record({
    change_record_id: 'CHG-UI-001',
    package_name: '@vento/ui-web',
    change_kind: 'ADDED',
    summary: 'Add a compatible shared button variant.',
    semver_impact: 'MINOR',
    public_surfaces: ['Button.variant'],
  });
  const ui = prepare({ packageName: '@vento/ui-web', version: '1.3.0', changeRecords: [uiChange] }).result;
  const noReleaseRecord = record({
    change_record_id: 'CHG-NR-001',
    package_name: '@vento/os-context',
    change_kind: 'CHANGED',
    summary: 'Update tests without changing distributed package output.',
    semver_impact: 'NO_RELEASE',
    public_surfaces: [],
    internal_change_reason: 'Test-only change outside distributed output.',
  });
  const noRelease = prepare({
    packageName: '@vento/os-context',
    version: '1.2.2',
    changeRecords: [noReleaseRecord],
    contract: {
      distribution_change: false,
      distributable_change_ids: [],
      artifact_content_identity: hash('base-artifact'),
    },
  }).result;
  const plan = planCoordinatedChangelogs([ui, noRelease, contracts]);
  assert.equal(plan.outcome, 'PASS');
  assert.deepEqual(plan.releases.map((item) => item.package_name), ['@vento/contracts', '@vento/ui-web']);
});

test('positive 07 - exact logical candidate is deterministic across record order and repeated preparation', () => {
  const a = record({ change_record_id: 'CHG-002', change_kind: 'CHANGED', summary: 'Adjust internal emitted metadata without changing public behavior.' });
  const b = record({ change_record_id: 'CHG-001' });
  const first = prepare({ changeRecords: [a, b], contract: { distributable_change_ids: ['CHG-002', 'CHG-001'] } }).result;
  const second = prepare({ changeRecords: [b, a], contract: { distributable_change_ids: ['CHG-001', 'CHG-002'] } }).result;
  assert.equal(first.outcome, 'PASS');
  assert.equal(second.outcome, 'PASS');
  assert.equal(first.prepared.changelog_identity, second.prepared.changelog_identity);
  assert.equal(first.prepared.rendered_changelog_entry, second.prepared.rendered_changelog_entry);
});

test('positive 08 - exact CI003 finalization is idempotent and preserves one history entry', () => {
  const { input, result } = prepare();
  assert.equal(result.outcome, 'PASS');
  const first = finalizePrepared(result.prepared, input.manifest);
  assert.equal(first.outcome, 'PASS');
  assert.equal(first.idempotent, false);
  const second = finalizePrepared(result.prepared, input.manifest, first.history);
  assert.equal(second.outcome, 'PASS');
  assert.equal(second.idempotent, true);
  assert.equal((second.history.match(/^## 1\.2\.3$/gmu) ?? []).length, 1);
});

// 20 negative cases.
test('negative 01 - package outside the canonical universe is blocked', () => {
  const input = scenario({ packageName: '@vento/unknown' });
  assert.ok(validateChangelogContract(input.contract, input).includes('PACKAGE_NOT_CANONICAL'));
});

test('negative 02 - invalid SemVer is blocked', () => {
  const currentManifest = manifest('@vento/contracts', 'latest');
  const manifestSource = `${JSON.stringify(currentManifest, null, 2)}\n`;
  const input = scenario({ manifest: currentManifest, manifestSource, version: 'latest' });
  assert.ok(validateChangelogContract(input.contract, input).includes('RELEASE_VERSION_INVALID'));
});

test('negative 03 - release version different from manifest is blocked', () => {
  const input = scenario({ contract: { release_version: '1.2.4' } });
  assert.ok(validateChangelogContract(input.contract, input).includes('MANIFEST_VERSION_MISMATCH'));
});

test('negative 04 - invalid source commit is blocked', () => {
  const input = scenario({ contract: { source_commit: 'abc' } });
  assert.ok(validateChangelogContract(input.contract, input).includes('SOURCE_COMMIT_INVALID'));
});

test('negative 05 - base release from another package is blocked', () => {
  const input = scenario({ contract: { base_release_package_name: '@vento/ui-web' } });
  assert.ok(validateChangelogContract(input.contract, input).includes('BASE_RELEASE_PACKAGE_MISMATCH'));
});

test('negative 06 - distributable release with empty change set is blocked', () => {
  const input = scenario({ changeRecords: [], contract: { distributable_change_ids: [] } });
  assert.ok(validateChangelogContract(input.contract, input).includes('DISTRIBUTION_CHANGE_REQUIRES_RECORDS'));
});

test('negative 07 - detected distributable change omitted from declared coverage is blocked', () => {
  const input = scenario({ contract: { distributable_change_ids: [] } });
  assert.ok(validateChangelogContract(input.contract, input).includes('DISTRIBUTABLE_CHANGE_COVERAGE_MISMATCH'));
});

test('negative 08 - record attributed to another package is blocked', () => {
  const input = scenario({ changeRecords: [record({ package_name: '@vento/ui-web' })] });
  assert.ok(validateChangelogContract(input.contract, input).some((reason) => reason.startsWith('CHANGE_RECORD_PACKAGE_MISMATCH:')));
});

test('negative 09 - duplicate change_record_id is blocked', () => {
  const input = scenario({ changeRecords: [record(), record({ summary: 'Correct a second independent serialization defect.' })] });
  assert.ok(validateChangelogContract(input.contract, input).includes('CHANGE_RECORD_ID_DUPLICATED'));
});

test('negative 10 - unsupported narrative category is blocked', () => {
  const input = scenario({ changeRecords: [record({ change_kind: 'BREAKING' })] });
  assert.ok(validateChangelogContract(input.contract, input).some((reason) => reason.startsWith('CHANGE_KIND_INVALID:')));
});

test('negative 11 - git log or commit inference cannot replace STRUCTURED_CHANGESET authority', () => {
  const input = scenario({ contract: { semantic_source: 'GIT_LOG' } });
  assert.ok(validateChangelogContract(input.contract, input).includes('STRUCTURED_CHANGESET_REQUIRED'));
});

test('negative 12 - stable breaking change classified PATCH or MINOR is blocked', () => {
  const change = record({ breaking_change: true, migration_required: true, migration_reference: 'docs/migrate.md' });
  const input = scenario({ changeRecords: [change] });
  assert.ok(validateChangelogContract(input.contract, input).some((reason) => reason.startsWith('BREAKING_CHANGE_REQUIRES_MAJOR:')));
});

test('negative 13 - removal of stable surface without MAJOR is blocked', () => {
  const change = record({ change_kind: 'REMOVED', semver_impact: 'MINOR', deprecation_ids: ['DEP-CONTRACTS-001'] });
  const input = scenario({ version: '1.3.0', changeRecords: [change] });
  assert.ok(validateChangelogContract(input.contract, input).some((reason) => reason.startsWith('REMOVAL_REQUIRES_MAJOR:')));
});

test('negative 14 - stable deprecation without resolvable DEP identifier is blocked', () => {
  const change = record({ change_kind: 'DEPRECATED', semver_impact: 'MINOR', migration_required: true, migration_reference: 'docs/migrate.md' });
  const input = scenario({ version: '1.3.0', changeRecords: [change] });
  assert.ok(validateChangelogContract(input.contract, input).some((reason) => reason.startsWith('DEPRECATION_ID_REQUIRED:')));
});

test('negative 15 - migration obligation without migration reference is blocked', () => {
  const change = record({ migration_required: true, migration_reference: null });
  const input = scenario({ changeRecords: [change] });
  assert.ok(validateChangelogContract(input.contract, input).some((reason) => reason.startsWith('MIGRATION_REFERENCE_REQUIRED:')));
});

test('negative 16 - NO_RELEASE cannot hide changed distributed artifact bytes', () => {
  const noRelease = record({
    semver_impact: 'NO_RELEASE',
    public_surfaces: [],
    internal_change_reason: 'Test-only change outside distributed output.',
  });
  const input = scenario({
    version: '1.2.2',
    changeRecords: [noRelease],
    contract: { distribution_change: false, distributable_change_ids: [] },
  });
  assert.ok(validateChangelogContract(input.contract, input).includes('NO_RELEASE_WITH_CHANGED_ARTIFACT'));
});

test('negative 17 - published version cannot be finalized with different historical content', () => {
  const { input, result } = prepare();
  const conflicting = '# Changelog \u2014 @vento/contracts\n\n## 1.2.3\n\n### Fixed\n- Different historical statement [CHG-001]\n';
  const final = finalizePrepared(result.prepared, input.manifest, conflicting);
  assert.equal(final.outcome, 'BLOCKED');
  assert.ok(final.reasons.includes('HISTORY_VERSION_CONTENT_CONFLICT'));
});

test('negative 18 - release notes tampering cannot add or omit obligations from the change set', () => {
  const { result } = prepare();
  const tampered = structuredClone(result.prepared);
  tampered.release_notes += '\nUndeclared breaking change.\n';
  assert.ok(validatePreparedMaterial(tampered).includes('RELEASE_NOTES_MISMATCH'));
});

test('negative 19 - sensitive content in the structured candidate is blocked', () => {
  const secretRecord = { ...record(), api_token: 'token=fixture-secret-value-12345678' };
  const input = scenario({ changeRecords: [secretRecord] });
  assert.ok(validateChangelogContract(input.contract, input).some((reason) => reason.startsWith('SENSITIVE_CONTENT_DETECTED:')));
});

test('negative 20 - CI003 final identity incompatible with prepared changelog is blocked', () => {
  const { input, result } = prepare();
  const final = finalizePrepared(result.prepared, input.manifest, '', ({ releaseContract, releaseEvidence }) => {
    releaseContract.changelog_identity = hash('different-changelog');
    releaseEvidence.release_contract_identity = asSha256Identity(`${JSON.stringify(releaseContract, null, 2)}\n`);
  });
  assert.equal(final.outcome, 'BLOCKED');
  assert.ok(final.reasons.includes('RELEASE_CONTRACT_CHANGELOG_IDENTITY_MISMATCH'));
});

// 16 regression cases.
test('regression 01 - object key insertion order does not change logical change-set identity', () => {
  const firstRecord = record();
  const secondRecord = {
    treq_refs: [], security_visibility: 'NOT_APPLICABLE', deprecation_ids: [], migration_reference: null,
    migration_required: false, breaking_change: false, source_refs: ['src/contracts.ts'],
    public_surfaces: ['serializeContract'], semver_impact: 'PATCH',
    summary: 'Correct deterministic contract serialization for consumers.', change_kind: 'FIXED',
    package_name: '@vento/contracts', change_record_id: 'CHG-001', internal_change_reason: null,
  };
  const first = prepare({ changeRecords: [firstRecord] }).result;
  const second = prepare({ changeRecords: [secondRecord] }).result;
  assert.equal(first.prepared.change_set_identity, second.prepared.change_set_identity);
});

test('regression 02 - input record order does not change narrative bytes', () => {
  const one = record({ change_record_id: 'CHG-001' });
  const two = record({ change_record_id: 'CHG-002', summary: 'Correct another deterministic serialization edge case.' });
  const first = prepare({ changeRecords: [one, two], contract: { distributable_change_ids: ['CHG-001', 'CHG-002'] } }).result;
  const second = prepare({ changeRecords: [two, one], contract: { distributable_change_ids: ['CHG-002', 'CHG-001'] } }).result;
  assert.equal(first.prepared.rendered_changelog_entry, second.prepared.rendered_changelog_entry);
});

test('regression 03 - locale and timezone environment do not alter the same candidate output', () => {
  const beforeTz = process.env.TZ;
  const beforeLang = process.env.LANG;
  const first = prepare().result.prepared.changelog_identity;
  process.env.TZ = 'Asia/Tokyo';
  process.env.LANG = 'tr_TR.UTF-8';
  const second = prepare().result.prepared.changelog_identity;
  if (beforeTz === undefined) delete process.env.TZ; else process.env.TZ = beforeTz;
  if (beforeLang === undefined) delete process.env.LANG; else process.env.LANG = beforeLang;
  assert.equal(first, second);
});

test('regression 04 - CRLF versus LF manifest serialization uses the same normalized manifest identity', () => {
  const currentManifest = manifest();
  const lf = `${JSON.stringify(currentManifest, null, 2)}\n`;
  const crlf = lf.replace(/\n/gu, '\r\n');
  const first = prepare({ manifest: currentManifest, manifestSource: lf }).result;
  const second = prepare({ manifest: currentManifest, manifestSource: crlf }).result;
  assert.equal(first.outcome, 'PASS');
  assert.equal(second.outcome, 'PASS');
  assert.equal(first.prepared.changelog_identity, second.prepared.changelog_identity);
});

test('regression 05 - empty narrative sections are omitted deterministically', () => {
  const output = prepare().result.prepared.rendered_changelog_entry;
  assert.doesNotMatch(output, /### Added/u);
  assert.doesNotMatch(output, /### Migration/u);
  assert.match(output, /### Fixed/u);
});

test('regression 06 - semantically duplicated records with different IDs cannot inflate changelog', () => {
  const one = record({ change_record_id: 'CHG-001' });
  const two = record({ change_record_id: 'CHG-002' });
  const input = scenario({ changeRecords: [one, two], contract: { distributable_change_ids: ['CHG-001', 'CHG-002'] } });
  assert.ok(validateChangelogContract(input.contract, input).includes('SEMANTIC_CHANGE_RECORD_DUPLICATED'));
});

test('regression 07 - finalizing a newer version preserves all prior history', () => {
  const old = '# Changelog \u2014 @vento/contracts\n\n## 1.2.2\n\n### Fixed\n- Historical fix [OLD-001]\n';
  const { input, result } = prepare();
  const final = finalizePrepared(result.prepared, input.manifest, old);
  assert.equal(final.outcome, 'PASS');
  assert.match(final.history, /Historical fix/u);
  assert.match(final.history, /^## 1\.2\.3$/mu);
});

test('regression 08 - one package narrative never leaks into another package plan', () => {
  const contracts = prepare().result;
  const uiChange = record({
    change_record_id: 'CHG-UI-001', package_name: '@vento/ui-web', summary: 'Correct shared button focus behavior.', public_surfaces: ['Button.focus'],
  });
  const ui = prepare({ packageName: '@vento/ui-web', changeRecords: [uiChange] }).result;
  const plan = planCoordinatedChangelogs([contracts, ui]);
  assert.equal(plan.outcome, 'PASS');
  assert.notEqual(plan.releases[0].changelog_identity, plan.releases[1].changelog_identity);
});

test('regression 09 - prerelease cannot be presented with STABLE channel semantics', () => {
  const change = record({ semver_impact: 'MAJOR', breaking_change: true, migration_required: true, migration_reference: 'docs/migrate.md' });
  const input = scenario({ version: '2.0.0-rc.1', changeRecords: [change], contract: { release_channel_type: 'STABLE' } });
  assert.ok(validateChangelogContract(input.contract, input).includes('STABLE_RELEASE_HAS_PRERELEASE'));
});

test('regression 10 - restricted security narrative does not expose source references as public detail', () => {
  const security = record({
    change_record_id: 'CHG-SEC-001',
    change_kind: 'SECURITY',
    summary: 'Harden validation for crafted contract payloads.',
    security_visibility: 'RESTRICTED',
    source_refs: ['internal/security/incident-001'],
  });
  const output = prepare({ changeRecords: [security] }).result.prepared.release_notes;
  assert.match(output, /technical details restricted/u);
  assert.doesNotMatch(output, /internal\/security\/incident-001/u);
});

test('regression 11 - NO_RELEASE produces NOT_APPLICABLE without a published changelog entry', () => {
  const noRelease = record({
    semver_impact: 'NO_RELEASE', public_surfaces: [], internal_change_reason: 'Test-only change outside distributed output.',
  });
  const { result } = prepare({
    version: '1.2.2',
    changeRecords: [noRelease],
    contract: { distribution_change: false, distributable_change_ids: [], artifact_content_identity: hash('base-artifact') },
  });
  assert.equal(result.outcome, 'NOT_APPLICABLE');
  assert.equal(result.prepared.changelog_identity, undefined);
});

test('regression 12 - DEP identifier remains present in finalized immutable history', () => {
  const dep = record({
    change_kind: 'DEPRECATED', semver_impact: 'MINOR', migration_required: true, migration_reference: 'docs/migrate.md', deprecation_ids: ['DEP-CONTRACTS-001'],
  });
  const { input, result } = prepare({ version: '1.3.0', changeRecords: [dep] });
  const final = finalizePrepared(result.prepared, input.manifest);
  assert.match(final.history, /DEP-CONTRACTS-001/u);
});

test('regression 13 - reordering records cannot downgrade the highest breaking SemVer impact', () => {
  const patch = record({ change_record_id: 'CHG-PATCH-001' });
  const major = record({
    change_record_id: 'CHG-MAJOR-001', change_kind: 'CHANGED', summary: 'Replace a public stable contract signature.', semver_impact: 'MAJOR', breaking_change: true, migration_required: true, migration_reference: 'docs/migrate.md',
  });
  const first = prepare({ version: '2.0.0', changeRecords: [patch, major], contract: { distributable_change_ids: ['CHG-PATCH-001', 'CHG-MAJOR-001'] } }).result;
  const second = prepare({ version: '2.0.0', changeRecords: [major, patch], contract: { distributable_change_ids: ['CHG-MAJOR-001', 'CHG-PATCH-001'] } }).result;
  assert.equal(first.outcome, 'PASS');
  assert.equal(second.outcome, 'PASS');
  assert.equal(first.prepared.changelog_identity, second.prepared.changelog_identity);
});

test('regression 14 - repeated finalization never duplicates an already-correct entry', () => {
  const { input, result } = prepare();
  const first = finalizePrepared(result.prepared, input.manifest);
  const second = finalizePrepared(result.prepared, input.manifest, first.history);
  assert.equal(second.idempotent, true);
  assert.equal((second.history.match(/^## 1\.2\.3$/gmu) ?? []).length, 1);
});

test('regression 15 - second package-local changelog-gate implementation is blocked', () => {
  const input = scenario();
  const result = prepareChangelog({
    ...input,
    duplicateImplementations: ['packages/contracts/shared-package-changelog-gate.mjs'],
  });
  assert.equal(result.outcome, 'BLOCKED');
  assert.ok(result.reasons.some((reason) => reason.startsWith('DUPLICATE_GATE_IMPLEMENTATION:')));
  assert.equal(typeof findDuplicateChangelogGateImplementations, 'function');
});

test('regression 16 - changed renderer output for an already-published version is never silently rewritten', () => {
  const original = renderChangelogEntry('@vento/contracts', '1.2.3', [record()]);
  const merged = mergeChangelogHistory({
    packageName: '@vento/contracts',
    version: '1.2.3',
    entry: original.replace('Correct deterministic', 'Altered deterministic'),
    historySource: `# Changelog \u2014 @vento/contracts\n\n${original}`,
  });
  assert.equal(merged.outcome, 'BLOCKED');
  assert.ok(merged.reasons.includes('HISTORY_VERSION_CONTENT_CONFLICT'));
  assert.equal(stableCanonicalStringify({ b: 2, a: 1 }), stableCanonicalStringify({ a: 1, b: 2 }));
});