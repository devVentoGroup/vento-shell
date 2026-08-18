import fs from 'node:fs';
import path from 'node:path';
import { fileURLToPath } from 'node:url';

import { validateEvidence as validateTestGateEvidence } from './shared-package-test-gate.mjs';
import { validateEvidence as validateBuildGateEvidence } from './shared-package-build-gate.mjs';
import {
  CANONICAL_SHARED_PACKAGES,
  asSha256Identity,
  parseSemver,
  validateReleaseContract,
} from './shared-package-release-gate.mjs';

export const COMPATIBILITY_GATE_INSTANCE_ID = 'SHELL-CI-005::GLOBAL';
export const COMPATIBILITY_SCHEMA_VERSION = 1;
export const IMPLEMENTATION_FILENAME = 'shared-package-compatibility-gate.mjs';
export const IMPLEMENTATION_RELATIVE_PATH = `scripts/quality/${IMPLEMENTATION_FILENAME}`;
export const RUNTIME_EVIDENCE_RELATIVE_ROOT = '.delivery/shared-package-compatibility';

export const CANONICAL_WEB_CONSUMERS = Object.freeze([
  'vento-shell',
  'vento-viso',
  'vento-nexo',
  'vento-fogo',
  'vento-origo',
  'vento-pulso',
  'vento-numera',
]);

export const RELATION_STATES = Object.freeze([
  'NO_APLICA',
  'PENDIENTE_DE_EVIDENCIA',
  'COMPATIBLE',
  'COMPATIBLE_CON_RESTRICCIONES',
  'INCOMPATIBLE',
  'BLOQUEADA',
]);

export const COMPATIBILITY_AXES = Object.freeze([
  Object.freeze({ id: 'COMP-AXIS-001', name: 'instalacion reproducible' }),
  Object.freeze({ id: 'COMP-AXIS-002', name: 'identidad del artefacto' }),
  Object.freeze({ id: 'COMP-AXIS-003', name: 'exports y modulos' }),
  Object.freeze({ id: 'COMP-AXIS-004', name: 'TypeScript' }),
  Object.freeze({ id: 'COMP-AXIS-005', name: 'runtime y Node' }),
  Object.freeze({ id: 'COMP-AXIS-006', name: 'Next y SSR' }),
  Object.freeze({ id: 'COMP-AXIS-007', name: 'React e hidratacion' }),
  Object.freeze({ id: 'COMP-AXIS-008', name: 'Supabase' }),
  Object.freeze({ id: 'COMP-AXIS-009', name: 'contratos y comportamiento' }),
  Object.freeze({ id: 'COMP-AXIS-010', name: 'contexto y autorizacion' }),
  Object.freeze({ id: 'COMP-AXIS-011', name: 'UI, CSS y accesibilidad' }),
  Object.freeze({ id: 'COMP-AXIS-012', name: 'consumidor' }),
]);

export const BASE_BAND_COVERAGE_POINTS = Object.freeze([
  'minimum_declared',
  'maximum_tested',
  'consumer_effective',
  'relevant_peers',
  'server_client_ssr',
]);

const AXIS_STATUSES = new Set([
  'PASS',
  'FAIL',
  'BLOCKED',
  'CANCELLED',
  'TIMED_OUT',
  'PENDING',
  'STALE',
  'NOT_APPLICABLE',
]);
const COVERAGE_STATUSES = AXIS_STATUSES;
const SHA256_IDENTITY_PATTERN = /^sha256:[0-9a-f]{64}$/u;
const COMMIT_PATTERN = /^[0-9a-f]{40}$/u;
const SENSITIVE_KEY_PATTERN = /(?:^|[_-])(?:authorization|cookie|credential|password|secret|token|api[_-]?key|private[_-]?key|service[_-]?role)(?:$|[_-])/iu;
const SENSITIVE_TEXT_PATTERNS = Object.freeze([
  /\bgh[pousr]_[A-Za-z0-9_]{24,}\b/u,
  /\bAKIA[0-9A-Z]{16}\b/u,
  /\bsk_(?:live|test)_[A-Za-z0-9]{20,}\b/u,
  /-----BEGIN (?:RSA |EC |OPENSSH )?PRIVATE KEY-----/u,
  /\b(?:password|secret|token|api[_-]?key|private[_-]?key)\s*[:=]\s*["']?[^\s"']{8,}/iu,
]);
const FORBIDDEN_BYPASS_FLAGS = new Set([
  'skipLibCheck',
  'global_cast',
  'permissive_mock',
  'hidden_override',
]);

function nonEmptyString(value) {
  return typeof value === 'string' && value.trim().length > 0;
}

function isPlainObject(value) {
  return value !== null && typeof value === 'object' && !Array.isArray(value);
}

function compareText(left, right) {
  const a = String(left);
  const b = String(right);
  if (a < b) return -1;
  if (a > b) return 1;
  return 0;
}

function unique(values) {
  return [...new Set(values)];
}

export function normalizeLf(value) {
  return String(value ?? '').replace(/\r\n?/gu, '\n');
}

function canonicalize(value) {
  if (typeof value === 'string') return normalizeLf(value);
  if (Array.isArray(value)) return value.map(canonicalize);
  if (!isPlainObject(value)) return value;
  return Object.fromEntries(
    Object.keys(value)
      .sort(compareText)
      .map((key) => [key, canonicalize(value[key])]),
  );
}

export function stableCanonicalStringify(value) {
  return JSON.stringify(canonicalize(value));
}

export function compatibilityIdentity(value) {
  return asSha256Identity(stableCanonicalStringify(value));
}

function implementationIdentity() {
  return asSha256Identity(fs.readFileSync(fileURLToPath(import.meta.url)));
}

function baseRelationId(index) {
  return `PKG-COMP-MX-${String(index).padStart(3, '0')}`;
}

export const CANONICAL_BASE_RELATIONS = Object.freeze(
  CANONICAL_SHARED_PACKAGES.flatMap((packageName, packageIndex) => (
    CANONICAL_WEB_CONSUMERS.map((consumerRepository, consumerIndex) => Object.freeze({
      relation_identity: baseRelationId((packageIndex * CANONICAL_WEB_CONSUMERS.length) + consumerIndex + 1),
      relation_source: 'BASE_WEB_MATRIX',
      package_name: packageName,
      consumer_repository: consumerRepository,
      applicability: 'APLICA',
      initial_state: 'PENDIENTE_DE_EVIDENCIA',
    }))
  )),
);

export const CANONICAL_BASE_COVERAGE_PLAN = Object.freeze(
  CANONICAL_BASE_RELATIONS.flatMap((relation) => (
    BASE_BAND_COVERAGE_POINTS.map((coveragePoint) => Object.freeze({
      relation_identity: relation.relation_identity,
      package_name: relation.package_name,
      consumer_repository: relation.consumer_repository,
      coverage_point: coveragePoint,
    }))
  )),
);

const BASE_RELATION_BY_ID = new Map(CANONICAL_BASE_RELATIONS.map((relation) => [relation.relation_identity, relation]));
const BASE_RELATION_IDS_BY_PACKAGE = new Map(
  CANONICAL_SHARED_PACKAGES.map((packageName) => [
    packageName,
    CANONICAL_BASE_RELATIONS
      .filter((relation) => relation.package_name === packageName)
      .map((relation) => relation.relation_identity),
  ]),
);
const AXIS_IDS = COMPATIBILITY_AXES.map(({ id }) => id);
const AXIS_ID_SET = new Set(AXIS_IDS);
const COVERAGE_POINT_SET = new Set(BASE_BAND_COVERAGE_POINTS);

function normalizeIdentityArray(values) {
  if (!Array.isArray(values)) return [];
  return unique(values.map((value) => normalizeLf(value).trim()).filter(nonEmptyString)).sort(compareText);
}

function normalizeRestriction(restriction) {
  return {
    owner: normalizeLf(restriction?.owner).trim(),
    scope: normalizeLf(restriction?.scope).trim(),
    exit_criteria: normalizeLf(restriction?.exit_criteria).trim(),
    reason: normalizeLf(restriction?.reason).trim(),
  };
}

function sensitiveFindings(value, pointer = '$', findings = []) {
  if (Array.isArray(value)) {
    value.forEach((child, index) => sensitiveFindings(child, `${pointer}[${index}]`, findings));
    return findings;
  }
  if (isPlainObject(value)) {
    for (const [key, child] of Object.entries(value)) {
      const childPointer = `${pointer}.${key}`;
      if (SENSITIVE_KEY_PATTERN.test(key) && child !== null && child !== undefined && String(child).length > 0) {
        findings.push(childPointer);
      }
      sensitiveFindings(child, childPointer, findings);
    }
    return findings;
  }
  if (typeof value === 'string' && SENSITIVE_TEXT_PATTERNS.some((pattern) => pattern.test(value))) {
    findings.push(pointer);
  }
  return findings;
}

function validateNoSensitiveData(value) {
  const findings = sensitiveFindings(value);
  return findings.map((pointer) => `SENSITIVE_DATA:${pointer}`);
}

function assertSha256Identity(value, code, errors) {
  if (!SHA256_IDENTITY_PATTERN.test(String(value ?? ''))) errors.push(code);
}

function normalizeSemverLike(value) {
  const parsed = parseSemver(String(value ?? ''));
  if (!parsed) return null;
  return parsed;
}

function compareSemver(left, right) {
  for (const key of ['major', 'minor', 'patch']) {
    if (left[key] < right[key]) return -1;
    if (left[key] > right[key]) return 1;
  }
  if (left.prerelease === right.prerelease) return 0;
  if (left.prerelease === null) return 1;
  if (right.prerelease === null) return -1;
  return compareText(left.prerelease, right.prerelease);
}

function versionInsideBand(version, band) {
  const parsed = normalizeSemverLike(version);
  const minimum = normalizeSemverLike(band?.minimum);
  const maximum = normalizeSemverLike(band?.maximum_tested);
  if (!parsed || !minimum || !maximum) return false;
  return compareSemver(parsed, minimum) >= 0 && compareSemver(parsed, maximum) <= 0;
}

function validateCandidateBands(relation) {
  const errors = [];
  if (!isPlainObject(relation.candidate_bands) || Object.keys(relation.candidate_bands).length === 0) {
    return ['CANDIDATE_BANDS_MISSING'];
  }
  for (const [dependency, band] of Object.entries(relation.candidate_bands)) {
    if (!isPlainObject(band)
      || !normalizeSemverLike(band.minimum)
      || !normalizeSemverLike(band.maximum_tested)) {
      errors.push(`CANDIDATE_BAND_INVALID:${dependency}`);
      continue;
    }
    if (compareSemver(normalizeSemverLike(band.minimum), normalizeSemverLike(band.maximum_tested)) > 0) {
      errors.push(`CANDIDATE_BAND_REVERSED:${dependency}`);
    }
    const resolved = relation.resolved_versions?.[dependency];
    if (!nonEmptyString(resolved)) errors.push(`RESOLVED_VERSION_MISSING:${dependency}`);
    else if (!versionInsideBand(resolved, band)) errors.push(`RESOLVED_VERSION_OUTSIDE_BAND:${dependency}`);
  }
  return errors;
}

function validateCoverageEvaluations(relation) {
  const errors = [];
  if (!Array.isArray(relation.coverage_evaluations)) return ['COVERAGE_EVALUATIONS_MISSING'];
  const points = relation.coverage_evaluations.map((entry) => entry?.coverage_point).filter(nonEmptyString);
  if (unique(points).length !== points.length) errors.push('COVERAGE_POINT_DUPLICATE');
  for (const point of BASE_BAND_COVERAGE_POINTS) {
    if (!points.includes(point)) errors.push(`COVERAGE_POINT_MISSING:${point}`);
  }
  for (const point of points) {
    if (!COVERAGE_POINT_SET.has(point)) errors.push(`COVERAGE_POINT_UNKNOWN:${point}`);
  }
  for (const entry of relation.coverage_evaluations) {
    if (!COVERAGE_STATUSES.has(entry?.status)) {
      errors.push(`COVERAGE_STATUS_INVALID:${entry?.coverage_point ?? 'UNKNOWN'}`);
      continue;
    }
    if (entry.status === 'NOT_APPLICABLE' && !nonEmptyString(entry.reason)) {
      errors.push(`COVERAGE_NOT_APPLICABLE_REASON_MISSING:${entry.coverage_point}`);
    }
    if (entry.status === 'PASS' && normalizeIdentityArray(entry.evidence_ids).length === 0) {
      errors.push(`COVERAGE_EVIDENCE_MISSING:${entry.coverage_point}`);
    }
  }
  const maximum = relation.coverage_evaluations.find((entry) => entry?.coverage_point === 'maximum_tested');
  if (maximum?.status === 'PASS') {
    for (const [dependency, band] of Object.entries(relation.candidate_bands ?? {})) {
      if (maximum.observed_versions?.[dependency] !== band.maximum_tested) {
        errors.push(`BAND_MAXIMUM_NOT_PROVEN:${dependency}`);
      }
    }
  }
  const minimum = relation.coverage_evaluations.find((entry) => entry?.coverage_point === 'minimum_declared');
  if (minimum?.status === 'PASS') {
    for (const [dependency, band] of Object.entries(relation.candidate_bands ?? {})) {
      if (minimum.observed_versions?.[dependency] !== band.minimum) {
        errors.push(`BAND_MINIMUM_NOT_PROVEN:${dependency}`);
      }
    }
  }
  const effective = relation.coverage_evaluations.find((entry) => entry?.coverage_point === 'consumer_effective');
  if (effective?.status === 'PASS') {
    for (const [dependency, version] of Object.entries(relation.resolved_versions ?? {})) {
      if (effective.observed_versions?.[dependency] !== version) {
        errors.push(`CONSUMER_EFFECTIVE_VERSION_NOT_PROVEN:${dependency}`);
      }
    }
  }
  return unique(errors);
}

function validateAxes(relation) {
  const errors = [];
  if (!Array.isArray(relation.axes)) return ['AXES_MISSING'];
  const ids = relation.axes.map((axis) => axis?.axis_id).filter(nonEmptyString);
  if (unique(ids).length !== ids.length) errors.push('AXIS_DUPLICATE');
  for (const axisId of AXIS_IDS) {
    if (!ids.includes(axisId)) errors.push(`AXIS_MISSING:${axisId}`);
  }
  for (const axis of relation.axes) {
    if (!AXIS_ID_SET.has(axis?.axis_id)) errors.push(`AXIS_UNKNOWN:${axis?.axis_id ?? 'UNKNOWN'}`);
    if (!AXIS_STATUSES.has(axis?.status)) errors.push(`AXIS_STATUS_INVALID:${axis?.axis_id ?? 'UNKNOWN'}`);
    if (axis?.status === 'NOT_APPLICABLE' && !nonEmptyString(axis.reason)) {
      errors.push(`AXIS_NOT_APPLICABLE_REASON_MISSING:${axis.axis_id}`);
    }
    if (axis?.status === 'PASS' && normalizeIdentityArray(axis.evidence_ids).length === 0) {
      errors.push(`AXIS_EVIDENCE_MISSING:${axis.axis_id}`);
    }
  }
  return unique(errors);
}

function validateRestrictions(relation) {
  const errors = [];
  if (!Array.isArray(relation.restrictions)) return ['RESTRICTIONS_INVALID'];
  relation.restrictions.forEach((restriction, index) => {
    const normalized = normalizeRestriction(restriction);
    for (const field of ['owner', 'scope', 'exit_criteria', 'reason']) {
      if (!nonEmptyString(normalized[field])) errors.push(`RESTRICTION_${field.toUpperCase()}_MISSING:${index}`);
    }
  });
  return errors;
}

export function validateBaseMatrixDefinition(relations = CANONICAL_BASE_RELATIONS) {
  const errors = [];
  if (!Array.isArray(relations)) return ['BASE_MATRIX_NOT_ARRAY'];
  if (relations.length !== 28) errors.push(`BASE_MATRIX_CARDINALITY:${relations.length}`);
  const ids = relations.map((relation) => relation?.relation_identity).filter(nonEmptyString);
  if (unique(ids).length !== ids.length) errors.push('BASE_MATRIX_DUPLICATE_RELATION');
  for (const canonical of CANONICAL_BASE_RELATIONS) {
    const matches = relations.filter((relation) => relation?.relation_identity === canonical.relation_identity);
    if (matches.length === 0) {
      errors.push(`BASE_RELATION_MISSING:${canonical.relation_identity}`);
      continue;
    }
    if (matches.length > 1) continue;
    const actual = matches[0];
    if (actual.package_name !== canonical.package_name
      || actual.consumer_repository !== canonical.consumer_repository
      || actual.relation_source !== 'BASE_WEB_MATRIX') {
      errors.push(`BASE_RELATION_REASSIGNED:${canonical.relation_identity}`);
    }
  }
  for (const relation of relations) {
    if (/^PKG-COMP-MX-/u.test(String(relation?.relation_identity ?? ''))
      && !BASE_RELATION_BY_ID.has(relation.relation_identity)) {
      errors.push(`BASE_RELATION_INVENTED:${relation.relation_identity}`);
    }
  }
  return unique(errors);
}

export function validateExtensionBinding(binding) {
  const errors = [];
  if (!isPlainObject(binding)) return ['EXTENSION_BINDING_NOT_OBJECT'];
  for (const field of [
    'binding_identity',
    'owner_contract',
    'owner',
    'package_name',
    'consumer_repository',
    'target',
    'renderer',
  ]) {
    if (!nonEmptyString(binding[field])) errors.push(`EXTENSION_BINDING_${field.toUpperCase()}_MISSING`);
  }
  if (!CANONICAL_SHARED_PACKAGES.includes(binding.package_name)) errors.push('EXTENSION_BINDING_PACKAGE_NOT_CANONICAL');
  if (binding.approved !== true) errors.push('EXTENSION_BINDING_NOT_APPROVED');
  if (/^PKG-COMP-MX-/u.test(String(binding.binding_identity ?? ''))) errors.push('EXTENSION_BINDING_BASE_ID_FORBIDDEN');
  if (binding.auto_package_inference === true) errors.push('EXTENSION_BINDING_AUTO_PACKAGE_INFERENCE_FORBIDDEN');
  if (String(binding.platform ?? '').toUpperCase() === 'EXPO_WEB' && binding.explicit_ui_web_binding !== true) {
    errors.push('EXPO_WEB_REQUIRES_EXPLICIT_UI_WEB_BINDING');
  }
  return unique(errors);
}

function consumerSnapshotByRepository(input) {
  return new Map((input.consumer_snapshots ?? []).map((snapshot) => [snapshot.consumer_repository, snapshot]));
}

function validateConsumerSnapshot(snapshot) {
  const errors = [];
  if (!isPlainObject(snapshot)) return ['CONSUMER_SNAPSHOT_MISSING'];
  if (!nonEmptyString(snapshot.consumer_repository)) errors.push('CONSUMER_REPOSITORY_MISSING');
  if (!COMMIT_PATTERN.test(String(snapshot.consumer_commit ?? ''))) errors.push('CONSUMER_COMMIT_INVALID');
  assertSha256Identity(snapshot.consumer_manifest_identity, 'CONSUMER_MANIFEST_IDENTITY_INVALID', errors);
  assertSha256Identity(snapshot.consumer_lockfile_identity, 'CONSUMER_LOCKFILE_IDENTITY_INVALID', errors);
  return errors;
}

function validatePackageSnapshot(snapshot) {
  const errors = [];
  if (!isPlainObject(snapshot)) return ['PACKAGE_SNAPSHOT_MISSING'];
  if (!CANONICAL_SHARED_PACKAGES.includes(snapshot.package_name)) errors.push('PACKAGE_NOT_CANONICAL');
  if (!normalizeSemverLike(snapshot.package_version)) errors.push('PACKAGE_VERSION_INVALID');
  if (!COMMIT_PATTERN.test(String(snapshot.package_source_commit ?? ''))) errors.push('PACKAGE_SOURCE_COMMIT_INVALID');
  assertSha256Identity(snapshot.package_manifest_identity, 'PACKAGE_MANIFEST_IDENTITY_INVALID', errors);
  assertSha256Identity(snapshot.artifact_content_identity, 'ARTIFACT_CONTENT_IDENTITY_INVALID', errors);
  if (!nonEmptyString(snapshot.artifact_integrity)) errors.push('ARTIFACT_INTEGRITY_MISSING');

  const testErrors = validateTestGateEvidence(snapshot.test_evidence);
  errors.push(...testErrors.map((error) => `CI001:${error}`));
  if (snapshot.test_evidence?.outcome !== 'PASS') errors.push('CI001:OUTCOME_NOT_PASS');
  if (snapshot.test_evidence?.invalidation_reason) errors.push('CI001:STALE');
  if (snapshot.test_evidence?.package !== snapshot.package_name) errors.push('CI001:PACKAGE_MISMATCH');
  if (snapshot.test_evidence?.candidate_version !== snapshot.package_version) errors.push('CI001:VERSION_MISMATCH');
  if (snapshot.test_evidence?.source_commit !== snapshot.package_source_commit) errors.push('CI001:COMMIT_MISMATCH');
  if (snapshot.test_evidence?.manifest_identity !== snapshot.package_manifest_identity) errors.push('CI001:MANIFEST_MISMATCH');

  const buildErrors = validateBuildGateEvidence(snapshot.build_evidence);
  errors.push(...buildErrors.map((error) => `CI002:${error}`));
  if (snapshot.build_evidence?.build_status !== 'PASS') errors.push('CI002:OUTCOME_NOT_PASS');
  if (snapshot.build_evidence?.invalidation_reason) errors.push('CI002:STALE');
  if (snapshot.build_evidence?.package_name !== snapshot.package_name) errors.push('CI002:PACKAGE_MISMATCH');
  if (snapshot.build_evidence?.package_candidate_version !== snapshot.package_version) errors.push('CI002:VERSION_MISMATCH');
  if (snapshot.build_evidence?.source_commit !== snapshot.package_source_commit) errors.push('CI002:COMMIT_MISMATCH');
  if (snapshot.build_evidence?.package_manifest_hash !== snapshot.package_manifest_identity) errors.push('CI002:MANIFEST_MISMATCH');
  if (snapshot.build_evidence?.artifact_content_hash !== snapshot.artifact_content_identity) errors.push('CI002:ARTIFACT_MISMATCH');
  if (snapshot.build_evidence?.pack_integrity !== snapshot.artifact_integrity) errors.push('CI002:INTEGRITY_MISMATCH');
  return unique(errors);
}

function validateEvidenceContext(relation) {
  const context = relation.evidence_context;
  if (!isPlainObject(context)) return ['EVIDENCE_CONTEXT_MISSING'];
  const errors = [];
  for (const [field, expected] of [
    ['package_name', relation.package_name],
    ['consumer_repository', relation.consumer_repository],
    ['target', relation.target],
    ['renderer', relation.renderer],
  ]) {
    if (context[field] !== expected) errors.push(`EVIDENCE_CONTEXT_MISMATCH:${field}`);
  }
  return errors;
}

function relationMaterial(relation) {
  return {
    relation_identity: relation.relation_identity,
    relation_source: relation.relation_source,
    package_name: relation.package_name,
    package_version: relation.package_version,
    package_source_commit: relation.package_source_commit,
    package_manifest_identity: relation.package_manifest_identity,
    artifact_content_identity: relation.artifact_content_identity,
    artifact_integrity: relation.artifact_integrity,
    candidate_bands: relation.candidate_bands,
    consumer_repository: relation.consumer_repository,
    consumer_commit: relation.consumer_commit,
    consumer_manifest_identity: relation.consumer_manifest_identity,
    consumer_lockfile_identity: relation.consumer_lockfile_identity,
    declared_versions: relation.declared_versions,
    resolved_versions: relation.resolved_versions,
    toolchain_identity: relation.toolchain_identity,
    runtime_identity: relation.runtime_identity,
    runtime_reproducible: relation.runtime_reproducible,
    environment: relation.environment,
    target: relation.target,
    renderer: relation.renderer,
    profile: relation.profile,
    coverage_evaluations: relation.coverage_evaluations,
    axes: relation.axes,
    restrictions: relation.restrictions,
    evidence_ids: normalizeIdentityArray(relation.evidence_ids),
    evidence_context: relation.evidence_context,
    bypass_flags: normalizeIdentityArray(relation.bypass_flags),
    stale: relation.stale === true,
    invalidation_reason: relation.invalidation_reason ?? null,
  };
}

export function evaluateRelation(relation, {
  packageSnapshot,
  consumerSnapshot = null,
  extensionBinding = null,
} = {}) {
  const errors = [];
  if (!isPlainObject(relation)) {
    return { state: 'BLOQUEADA', reasons: ['RELATION_NOT_OBJECT'], material_identity: null };
  }
  if (!nonEmptyString(relation.relation_identity)) errors.push('RELATION_IDENTITY_MISSING');
  if (!CANONICAL_SHARED_PACKAGES.includes(relation.package_name)) errors.push('RELATION_PACKAGE_NOT_CANONICAL');

  const canonical = BASE_RELATION_BY_ID.get(relation.relation_identity);
  if (relation.relation_source === 'BASE_WEB_MATRIX') {
    if (!canonical) errors.push(`BASE_RELATION_INVENTED:${relation.relation_identity}`);
    else if (canonical.package_name !== relation.package_name
      || canonical.consumer_repository !== relation.consumer_repository) {
      errors.push(`BASE_RELATION_REASSIGNED:${relation.relation_identity}`);
    }
  } else {
    if (!extensionBinding) errors.push('EXTENSION_BINDING_REQUIRED');
    else {
      errors.push(...validateExtensionBinding(extensionBinding));
      if (extensionBinding.binding_identity !== relation.relation_identity) errors.push('EXTENSION_RELATION_BINDING_MISMATCH');
      if (extensionBinding.package_name !== relation.package_name) errors.push('EXTENSION_RELATION_PACKAGE_MISMATCH');
      if (extensionBinding.consumer_repository !== relation.consumer_repository) errors.push('EXTENSION_RELATION_CONSUMER_MISMATCH');
      if (extensionBinding.target !== relation.target) errors.push('EXTENSION_RELATION_TARGET_MISMATCH');
      if (extensionBinding.renderer !== relation.renderer) errors.push('EXTENSION_RELATION_RENDERER_MISMATCH');
    }
    if (/^PKG-COMP-MX-/u.test(String(relation.relation_identity ?? ''))) errors.push('EXTENSION_RELATION_BASE_ID_FORBIDDEN');
  }

  if (!isPlainObject(packageSnapshot)) errors.push('PACKAGE_SNAPSHOT_MISSING');
  else {
    for (const [relationField, snapshotField] of [
      ['package_name', 'package_name'],
      ['package_version', 'package_version'],
      ['package_source_commit', 'package_source_commit'],
      ['package_manifest_identity', 'package_manifest_identity'],
      ['artifact_content_identity', 'artifact_content_identity'],
      ['artifact_integrity', 'artifact_integrity'],
    ]) {
      if (relation[relationField] !== packageSnapshot[snapshotField]) {
        errors.push(`PACKAGE_SNAPSHOT_MISMATCH:${relationField}`);
      }
    }
  }

  errors.push(...validateConsumerSnapshot(consumerSnapshot));
  if (isPlainObject(consumerSnapshot)) {
    for (const field of ['consumer_commit', 'consumer_manifest_identity', 'consumer_lockfile_identity']) {
      if (relation[field] !== consumerSnapshot[field]) errors.push(`CONSUMER_SNAPSHOT_MISMATCH:${field}`);
    }
  }

  if (!isPlainObject(relation.declared_versions) || Object.keys(relation.declared_versions).length === 0) {
    errors.push('DECLARED_VERSIONS_MISSING');
  }
  if (!isPlainObject(relation.resolved_versions) || Object.keys(relation.resolved_versions).length === 0) {
    errors.push('RESOLVED_VERSIONS_MISSING');
  }
  if (!nonEmptyString(relation.toolchain_identity)) errors.push('TOOLCHAIN_IDENTITY_MISSING');
  if (!nonEmptyString(relation.runtime_identity)) errors.push('RUNTIME_IDENTITY_MISSING');
  if (!nonEmptyString(relation.environment)) errors.push('ENVIRONMENT_MISSING');
  if (!nonEmptyString(relation.target)) errors.push('TARGET_MISSING');
  if (!nonEmptyString(relation.renderer)) errors.push('RENDERER_MISSING');
  if (!nonEmptyString(relation.profile)) errors.push('PROFILE_MISSING');
  if (relation.runtime_reproducible !== true && relation.relation_source === 'BASE_WEB_MATRIX') {
    errors.push('RUNTIME_NOT_REPRODUCIBLE');
  }
  if (normalizeIdentityArray(relation.evidence_ids).length === 0) errors.push('RELATION_EVIDENCE_MISSING');
  errors.push(...validateEvidenceContext(relation));
  errors.push(...validateCandidateBands(relation));
  errors.push(...validateCoverageEvaluations(relation));
  errors.push(...validateAxes(relation));
  errors.push(...validateRestrictions(relation));
  errors.push(...validateNoSensitiveData(relation));
  for (const flag of normalizeIdentityArray(relation.bypass_flags)) {
    if (FORBIDDEN_BYPASS_FLAGS.has(flag)) errors.push(`FORBIDDEN_BYPASS:${flag}`);
  }

  const materialIdentity = compatibilityIdentity(relationMaterial(relation));
  if (errors.length > 0) {
    return { state: 'BLOQUEADA', reasons: unique(errors), material_identity: materialIdentity };
  }
  if (relation.stale === true || nonEmptyString(relation.invalidation_reason)) {
    return {
      state: 'PENDIENTE_DE_EVIDENCIA',
      reasons: [relation.invalidation_reason ? `STALE:${relation.invalidation_reason}` : 'STALE'],
      material_identity: materialIdentity,
    };
  }

  const statuses = [
    ...relation.axes.map((axis) => axis.status),
    ...relation.coverage_evaluations.map((entry) => entry.status),
  ];
  if (statuses.some((status) => ['BLOCKED', 'CANCELLED', 'TIMED_OUT'].includes(status))) {
    return { state: 'BLOQUEADA', reasons: ['EXECUTION_BLOCKED'], material_identity: materialIdentity };
  }
  if (statuses.includes('FAIL')) {
    return { state: 'INCOMPATIBLE', reasons: ['EXECUTION_FAILED'], material_identity: materialIdentity };
  }
  if (statuses.some((status) => ['PENDING', 'STALE'].includes(status))) {
    return { state: 'PENDIENTE_DE_EVIDENCIA', reasons: ['EVIDENCE_PENDING'], material_identity: materialIdentity };
  }
  const restrictions = relation.restrictions.map(normalizeRestriction);
  return {
    state: restrictions.length > 0 ? 'COMPATIBLE_CON_RESTRICCIONES' : 'COMPATIBLE',
    reasons: [],
    restrictions,
    material_identity: materialIdentity,
  };
}

function normalizeEvaluation(relation, evaluation) {
  return {
    ...relationMaterial(relation),
    state: evaluation.state,
    reasons: [...evaluation.reasons].sort(compareText),
    material_identity: evaluation.material_identity,
  };
}

function requiredBaseRelationIds(packageName, releaseChannelType, pilotRelationIds) {
  const all = BASE_RELATION_IDS_BY_PACKAGE.get(packageName) ?? [];
  if (releaseChannelType === 'PRERELEASE') {
    const pilots = normalizeIdentityArray(pilotRelationIds);
    if (pilots.length === 0) return { ids: [], errors: ['PRERELEASE_PILOTS_REQUIRED'] };
    const unknown = pilots.filter((id) => !all.includes(id));
    if (unknown.length > 0) return { ids: [], errors: unknown.map((id) => `PRERELEASE_PILOT_NOT_OWNED:${id}`) };
    return { ids: pilots, errors: [] };
  }
  return { ids: [...all], errors: [] };
}

function supportedBandsFromEvaluations(evaluations) {
  return evaluations
    .map((evaluation) => ({
      relation_identity: evaluation.relation_identity,
      consumer_repository: evaluation.consumer_repository,
      candidate_bands: evaluation.candidate_bands,
    }))
    .sort((left, right) => compareText(left.relation_identity, right.relation_identity));
}

function prepareMaterialPayload({
  packageSnapshot,
  releaseChannelType,
  pilotRelationIds,
  requiredRelationIds,
  evaluations,
  extensionBindings,
}) {
  return {
    schema_version: COMPATIBILITY_SCHEMA_VERSION,
    gate_instance: COMPATIBILITY_GATE_INSTANCE_ID,
    package_name: packageSnapshot.package_name,
    package_version: packageSnapshot.package_version,
    package_source_commit: packageSnapshot.package_source_commit,
    package_manifest_identity: packageSnapshot.package_manifest_identity,
    artifact_content_identity: packageSnapshot.artifact_content_identity,
    artifact_integrity: packageSnapshot.artifact_integrity,
    test_evidence_identity: packageSnapshot.test_evidence.material_identity_sha256,
    build_evidence_identity: packageSnapshot.build_evidence.material_identity_sha256,
    release_channel_type: releaseChannelType,
    pilot_relation_ids: [...pilotRelationIds].sort(compareText),
    required_relation_ids: [...requiredRelationIds].sort(compareText),
    required_relation_set_identity: compatibilityIdentity([...requiredRelationIds].sort(compareText)),
    relation_evaluations: [...evaluations].sort((left, right) => compareText(left.relation_identity, right.relation_identity)),
    extension_bindings: [...extensionBindings].sort((left, right) => compareText(left.binding_identity, right.binding_identity)),
    supported_bands: supportedBandsFromEvaluations(evaluations),
    gate_implementation_identity: implementationIdentity(),
  };
}

export function prepareCompatibilityEvidence(input) {
  const errors = [];
  if (!isPlainObject(input)) {
    return { result: 'BLOCKED', reasons: ['PREPARE_INPUT_NOT_OBJECT'], compatibility_evidence_identity: null };
  }
  if (input.schema_version !== undefined && input.schema_version !== COMPATIBILITY_SCHEMA_VERSION) {
    errors.push('PREPARE_SCHEMA_VERSION_UNSUPPORTED');
  }
  const packageSnapshot = input.package_snapshot;
  errors.push(...validatePackageSnapshot(packageSnapshot));
  const releaseChannelType = String(input.release_channel_type ?? '').toUpperCase();
  if (!['STABLE', 'PRERELEASE'].includes(releaseChannelType)) errors.push('RELEASE_CHANNEL_TYPE_INVALID');

  const pilotResult = requiredBaseRelationIds(
    packageSnapshot?.package_name,
    releaseChannelType,
    input.pilot_relation_ids,
  );
  errors.push(...pilotResult.errors);
  const requiredBaseIds = pilotResult.ids;
  const consumerSnapshots = consumerSnapshotByRepository(input);
  for (const consumerRepository of CANONICAL_WEB_CONSUMERS) {
    const snapshot = consumerSnapshots.get(consumerRepository);
    if (!snapshot) errors.push(`CONSUMER_SNAPSHOT_MISSING:${consumerRepository}`);
    else errors.push(...validateConsumerSnapshot(snapshot).map((error) => `${consumerRepository}:${error}`));
  }

  const extensionBindings = Array.isArray(input.extension_bindings) ? input.extension_bindings : [];
  extensionBindings.forEach((binding) => errors.push(...validateExtensionBinding(binding)));
  const bindingById = new Map(extensionBindings.map((binding) => [binding.binding_identity, binding]));

  const relations = Array.isArray(input.relations) ? input.relations : [];
  const relationIds = relations.map((relation) => relation?.relation_identity).filter(nonEmptyString);
  if (unique(relationIds).length !== relationIds.length) errors.push('RELATION_ID_DUPLICATE');
  for (const requiredId of requiredBaseIds) {
    if (!relationIds.includes(requiredId)) errors.push(`REQUIRED_BASE_RELATION_MISSING:${requiredId}`);
  }
  for (const relation of relations) {
    if (relation.relation_source === 'BASE_WEB_MATRIX') {
      const canonical = BASE_RELATION_BY_ID.get(relation.relation_identity);
      if (!canonical) errors.push(`BASE_RELATION_INVENTED:${relation.relation_identity}`);
      else if (canonical.package_name !== packageSnapshot?.package_name) {
        errors.push(`BASE_RELATION_WRONG_PACKAGE:${relation.relation_identity}`);
      }
    }
  }

  const evaluated = relations.map((relation) => {
    const consumerSnapshot = consumerSnapshots.get(relation.consumer_repository) ?? null;
    const extensionBinding = relation.relation_source === 'BASE_WEB_MATRIX'
      ? null
      : bindingById.get(relation.relation_identity) ?? null;
    const evaluation = evaluateRelation(relation, { packageSnapshot, consumerSnapshot, extensionBinding });
    return normalizeEvaluation(relation, evaluation);
  });

  const requiredExtensionIds = extensionBindings
    .filter((binding) => binding.required === true && binding.package_name === packageSnapshot?.package_name)
    .map((binding) => binding.binding_identity);
  for (const requiredId of requiredExtensionIds) {
    if (!relationIds.includes(requiredId)) errors.push(`REQUIRED_EXTENSION_RELATION_MISSING:${requiredId}`);
  }

  const requiredRelationIds = [...requiredBaseIds, ...requiredExtensionIds];
  const requiredEvaluations = evaluated.filter((evaluation) => requiredRelationIds.includes(evaluation.relation_identity));
  for (const evaluation of requiredEvaluations) {
    if (!['COMPATIBLE', 'COMPATIBLE_CON_RESTRICCIONES'].includes(evaluation.state)) {
      errors.push(`REQUIRED_RELATION_NOT_COMPATIBLE:${evaluation.relation_identity}:${evaluation.state}`);
      errors.push(...evaluation.reasons.map((reason) => `${evaluation.relation_identity}:${reason}`));
    }
  }
  if (requiredEvaluations.length !== requiredRelationIds.length) errors.push('REQUIRED_RELATION_SET_INCOMPLETE');

  errors.push(...validateNoSensitiveData(input));
  const uniqueErrors = unique(errors).sort(compareText);
  if (uniqueErrors.length > 0) {
    return {
      schema_version: COMPATIBILITY_SCHEMA_VERSION,
      gate_instance: COMPATIBILITY_GATE_INSTANCE_ID,
      phase: 'PREPARE',
      result: 'BLOCKED',
      reasons: uniqueErrors,
      compatibility_evidence_identity: null,
      relation_evaluations: evaluated,
      invalidation_reason: null,
    };
  }

  const material = prepareMaterialPayload({
    packageSnapshot,
    releaseChannelType,
    pilotRelationIds: input.pilot_relation_ids ?? [],
    requiredRelationIds,
    evaluations: requiredEvaluations,
    extensionBindings,
  });
  const identity = compatibilityIdentity(material);
  return {
    ...material,
    phase: 'PREPARE',
    result: 'PASS',
    reasons: [],
    compatibility_evidence_identity: identity,
    coverage_evaluation_count: requiredBaseIds.length * BASE_BAND_COVERAGE_POINTS.length,
    invalidation_reason: null,
  };
}

export function buildGlobalCompatibilitySnapshot(preparedEvidences) {
  const errors = [];
  if (!Array.isArray(preparedEvidences)) {
    return { result: 'BLOCKED', reasons: ['GLOBAL_SNAPSHOT_NOT_ARRAY'], global_compatibility_identity: null };
  }
  const byPackage = new Map(preparedEvidences.map((evidence) => [evidence?.package_name, evidence]));
  for (const packageName of CANONICAL_SHARED_PACKAGES) {
    const evidence = byPackage.get(packageName);
    if (!evidence) {
      errors.push(`GLOBAL_PACKAGE_EVIDENCE_MISSING:${packageName}`);
      continue;
    }
    if (evidence.result !== 'PASS' || evidence.phase !== 'PREPARE') errors.push(`GLOBAL_PACKAGE_EVIDENCE_NOT_PASS:${packageName}`);
    if (evidence.release_channel_type !== 'STABLE') errors.push(`GLOBAL_PACKAGE_NOT_STABLE:${packageName}`);
    const expectedIds = BASE_RELATION_IDS_BY_PACKAGE.get(packageName) ?? [];
    if (stableCanonicalStringify([...evidence.required_relation_ids].sort(compareText))
      !== stableCanonicalStringify([...expectedIds].sort(compareText))) {
      errors.push(`GLOBAL_PACKAGE_RELATION_SET_INVALID:${packageName}`);
    }
    if (evidence.coverage_evaluation_count !== 35) errors.push(`GLOBAL_PACKAGE_COVERAGE_COUNT_INVALID:${packageName}`);
  }
  if (preparedEvidences.length !== 4) errors.push(`GLOBAL_PACKAGE_CARDINALITY:${preparedEvidences.length}`);
  const relationIds = preparedEvidences.flatMap((evidence) => evidence?.required_relation_ids ?? []);
  if (unique(relationIds).length !== 28 || relationIds.length !== 28) errors.push('GLOBAL_BASE_RELATION_CARDINALITY_INVALID');
  const coverageCount = preparedEvidences.reduce((total, evidence) => total + (evidence?.coverage_evaluation_count ?? 0), 0);
  if (coverageCount !== 140) errors.push(`GLOBAL_BASE_COVERAGE_CARDINALITY:${coverageCount}`);
  if (errors.length > 0) return { result: 'BLOCKED', reasons: unique(errors), global_compatibility_identity: null };
  const payload = {
    schema_version: COMPATIBILITY_SCHEMA_VERSION,
    gate_instance: COMPATIBILITY_GATE_INSTANCE_ID,
    base_relation_count: 28,
    base_coverage_evaluation_count: 140,
    package_compatibility_identities: CANONICAL_SHARED_PACKAGES.map((packageName) => ({
      package_name: packageName,
      compatibility_evidence_identity: byPackage.get(packageName).compatibility_evidence_identity,
    })),
    base_matrix_identity: compatibilityIdentity(CANONICAL_BASE_RELATIONS),
    base_coverage_plan_identity: compatibilityIdentity(CANONICAL_BASE_COVERAGE_PLAN),
  };
  return {
    ...payload,
    result: 'PASS',
    reasons: [],
    global_compatibility_identity: compatibilityIdentity(payload),
  };
}

export function bindCompatibilityIdentityToReleaseContract(releaseContract, preparedEvidence) {
  if (!isPlainObject(releaseContract)) return { contract: null, errors: ['RELEASE_CONTRACT_NOT_OBJECT'] };
  if (preparedEvidence?.result !== 'PASS' || !SHA256_IDENTITY_PATTERN.test(String(preparedEvidence.compatibility_evidence_identity ?? ''))) {
    return { contract: null, errors: ['COMPATIBILITY_EVIDENCE_NOT_PASS'] };
  }
  const contract = {
    ...releaseContract,
    compatibility_required: true,
    compatibility_evidence_identity: preparedEvidence.compatibility_evidence_identity,
  };
  const errors = validateReleaseContract(contract);
  if (contract.package_name !== preparedEvidence.package_name) errors.push('RELEASE_CONTRACT_PACKAGE_MISMATCH');
  if (contract.release_version !== preparedEvidence.package_version) errors.push('RELEASE_CONTRACT_VERSION_MISMATCH');
  if (contract.source_commit !== preparedEvidence.package_source_commit) errors.push('RELEASE_CONTRACT_COMMIT_MISMATCH');
  return { contract, errors: unique(errors) };
}

function validateReleaseEvidenceForFinalize(preparedEvidence, releaseContractSource, releaseContract, releaseEvidence) {
  const errors = [];
  const bound = bindCompatibilityIdentityToReleaseContract(releaseContract, preparedEvidence);
  errors.push(...bound.errors);
  if (!isPlainObject(releaseEvidence)) return [...errors, 'RELEASE_EVIDENCE_NOT_OBJECT'];
  if (releaseEvidence.schema_version !== 1) errors.push('RELEASE_EVIDENCE_SCHEMA_VERSION_UNSUPPORTED');
  if (releaseEvidence.gate_instance !== 'SHELL-CI-003::GLOBAL') errors.push('RELEASE_EVIDENCE_GATE_INVALID');
  if (releaseEvidence.release_status !== 'PASS') errors.push('RELEASE_EVIDENCE_NOT_PASS');
  if (releaseEvidence.package_name !== preparedEvidence.package_name) errors.push('RELEASE_EVIDENCE_PACKAGE_MISMATCH');
  if (releaseEvidence.release_version !== preparedEvidence.package_version) errors.push('RELEASE_EVIDENCE_VERSION_MISMATCH');
  if (releaseEvidence.source_commit !== preparedEvidence.package_source_commit) errors.push('RELEASE_EVIDENCE_COMMIT_MISMATCH');
  if (releaseEvidence.package_manifest_hash !== preparedEvidence.package_manifest_identity) errors.push('RELEASE_EVIDENCE_MANIFEST_MISMATCH');
  if (releaseEvidence.artifact_content_hash !== preparedEvidence.artifact_content_identity) errors.push('RELEASE_EVIDENCE_ARTIFACT_MISMATCH');
  if (releaseEvidence.pack_integrity !== preparedEvidence.artifact_integrity) errors.push('RELEASE_EVIDENCE_INTEGRITY_MISMATCH');
  if (!nonEmptyString(releaseEvidence.material_identity_sha256)) errors.push('RELEASE_EVIDENCE_MATERIAL_IDENTITY_MISSING');
  if (!nonEmptyString(releaseContractSource)) errors.push('RELEASE_CONTRACT_SOURCE_MISSING');
  else {
    const expectedContractIdentity = asSha256Identity(releaseContractSource);
    if (releaseEvidence.release_contract_identity !== expectedContractIdentity) errors.push('RELEASE_CONTRACT_IDENTITY_MISMATCH');
  }
  if (releaseEvidence.compatibility_evidence_identity !== undefined
    && releaseEvidence.compatibility_evidence_identity !== preparedEvidence.compatibility_evidence_identity) {
    errors.push('RELEASE_EVIDENCE_COMPATIBILITY_IDENTITY_MISMATCH');
  }
  return unique(errors);
}

export function finalizeCompatibilityEvidence(preparedEvidence, {
  release_contract_source: releaseContractSource,
  release_contract: releaseContract,
  release_evidence: releaseEvidence,
  history = [],
} = {}) {
  const errors = [];
  if (!isPlainObject(preparedEvidence)
    || preparedEvidence.phase !== 'PREPARE'
    || preparedEvidence.result !== 'PASS'
    || !SHA256_IDENTITY_PATTERN.test(String(preparedEvidence.compatibility_evidence_identity ?? ''))) {
    errors.push('PREPARED_EVIDENCE_NOT_PASS');
  }
  if (errors.length === 0) {
    errors.push(...validateReleaseEvidenceForFinalize(
      preparedEvidence,
      releaseContractSource,
      releaseContract,
      releaseEvidence,
    ));
  }
  if (errors.length > 0) {
    return {
      result: 'BLOCKED',
      reasons: unique(errors).sort(compareText),
      evidence: null,
      history: [...history],
      appended: false,
    };
  }
  const finalization = {
    release_run_identity: releaseEvidence.release_run_identity,
    release_material_identity_sha256: releaseEvidence.material_identity_sha256,
    release_contract_identity: releaseEvidence.release_contract_identity,
    release_status: releaseEvidence.release_status,
  };
  const finalizationIdentity = compatibilityIdentity({
    compatibility_evidence_identity: preparedEvidence.compatibility_evidence_identity,
    ...finalization,
  });
  const evidence = {
    ...preparedEvidence,
    phase: 'FINALIZE',
    result: 'PASS',
    finalization,
    finalization_identity: finalizationIdentity,
  };
  const appendedHistory = appendCompatibilityHistory(history, evidence);
  return {
    result: 'PASS',
    reasons: [],
    evidence,
    history: appendedHistory.history,
    appended: appendedHistory.appended,
  };
}

function historyIdentity(evidence) {
  if (evidence?.phase === 'FINALIZE') return evidence.finalization_identity;
  if (evidence?.phase === 'PREPARE') return evidence.compatibility_evidence_identity;
  return null;
}

export function appendCompatibilityHistory(history, evidence) {
  const current = Array.isArray(history) ? [...history] : [];
  const identity = historyIdentity(evidence);
  if (!nonEmptyString(identity)) return { history: current, appended: false };
  if (current.some((entry) => historyIdentity(entry) === identity)) return { history: current, appended: false };
  return { history: [...current, evidence], appended: true };
}

export function comparePreparedEvidence(previousEvidence, currentInput) {
  const current = prepareCompatibilityEvidence(currentInput);
  if (current.result !== 'PASS') {
    return {
      current: false,
      outcome: 'STALE',
      invalidation_reason: 'CURRENT_INPUT_NOT_COMPATIBLE',
      reasons: current.reasons,
      current_evidence: current,
    };
  }
  const same = previousEvidence?.compatibility_evidence_identity === current.compatibility_evidence_identity;
  return {
    current: same,
    outcome: same ? 'PASS' : 'STALE',
    invalidation_reason: same ? null : 'MATERIAL_IDENTITY_CHANGED',
    reasons: [],
    current_evidence: current,
  };
}

export function invalidateCompatibilityEvidence(preparedEvidence, reason) {
  const invalidationReason = nonEmptyString(reason) ? normalizeLf(reason).trim() : 'MATERIAL_INPUT_CHANGED';
  return {
    ...preparedEvidence,
    result: 'STALE',
    invalidation_reason: invalidationReason,
    relation_evaluations: (preparedEvidence?.relation_evaluations ?? []).map((evaluation) => ({
      ...evaluation,
      state: 'PENDIENTE_DE_EVIDENCIA',
      reasons: [`STALE:${invalidationReason}`],
    })),
  };
}

function packageSlug(packageName) {
  return String(packageName ?? 'unknown').replace(/^@/u, '').replaceAll('/', '__');
}

export function writeRuntimeEvidence(evidence, { repositoryRoot = process.cwd() } = {}) {
  const sensitive = validateNoSensitiveData(evidence);
  if (sensitive.length > 0) throw new Error(`Sensitive data rejected: ${sensitive.join(', ')}`);
  const identity = historyIdentity(evidence) ?? compatibilityIdentity(evidence);
  const digest = identity.replace(/^sha256:/u, '');
  const phase = String(evidence?.phase ?? 'evidence').toLowerCase();
  const filename = `${packageSlug(evidence?.package_name)}__${phase}__${digest}.json`;
  const evidenceRoot = path.join(repositoryRoot, RUNTIME_EVIDENCE_RELATIVE_ROOT);
  fs.mkdirSync(evidenceRoot, { recursive: true });
  const filePath = path.join(evidenceRoot, filename);
  const source = `${JSON.stringify(canonicalize(evidence), null, 2)}\n`;
  if (fs.existsSync(filePath)) {
    const current = fs.readFileSync(filePath, 'utf8');
    if (current !== source) throw new Error(`Immutable evidence conflict: ${filePath}`);
    return filePath;
  }
  fs.writeFileSync(filePath, source, { encoding: 'utf8', flag: 'wx' });
  return filePath;
}

function readJsonWithSource(filePath, label) {
  const source = fs.readFileSync(filePath, 'utf8');
  try {
    return { source, value: JSON.parse(source) };
  } catch (error) {
    throw new Error(`Invalid JSON in ${label}: ${error instanceof Error ? error.message : String(error)}`);
  }
}

function parseArgs(argv) {
  const args = { command: null, input: null, prepare: null, releaseContract: null, releaseEvidence: null, json: false };
  if (argv.length === 0) return args;
  args.command = argv[0];
  for (let index = 1; index < argv.length; index += 1) {
    const token = argv[index];
    if (token === '--json') args.json = true;
    else if (['--input', '--prepare', '--release-contract', '--release-evidence'].includes(token)) {
      const value = argv[index + 1];
      if (!value || value.startsWith('--')) throw new Error(`Missing value for ${token}.`);
      if (token === '--input') args.input = value;
      if (token === '--prepare') args.prepare = value;
      if (token === '--release-contract') args.releaseContract = value;
      if (token === '--release-evidence') args.releaseEvidence = value;
      index += 1;
    } else throw new Error(`Unknown argument: ${token}`);
  }
  return args;
}

function printUsage() {
  console.log(`Usage:\n  node ${IMPLEMENTATION_RELATIVE_PATH} prepare --input <json> [--json]\n  node ${IMPLEMENTATION_RELATIVE_PATH} finalize --prepare <json> --release-contract <json> --release-evidence <json> [--json]`);
}

export function main(argv = process.argv.slice(2)) {
  const args = parseArgs(argv);
  if (!args.command || args.command === 'help' || args.command === '--help') {
    printUsage();
    return null;
  }
  if (args.command === 'prepare') {
    if (!args.input) throw new Error('prepare requires --input.');
    const input = readJsonWithSource(path.resolve(args.input), 'prepare input').value;
    const evidence = prepareCompatibilityEvidence(input);
    if (evidence.result === 'PASS') writeRuntimeEvidence(evidence);
    console.log(args.json ? JSON.stringify(evidence, null, 2) : `${evidence.result}: ${evidence.package_name ?? 'unknown'} compatibility PREPARE`);
    if (evidence.result !== 'PASS') process.exitCode = 1;
    return evidence;
  }
  if (args.command === 'finalize') {
    if (!args.prepare || !args.releaseContract || !args.releaseEvidence) {
      throw new Error('finalize requires --prepare, --release-contract and --release-evidence.');
    }
    const prepared = readJsonWithSource(path.resolve(args.prepare), 'prepared evidence').value;
    const releaseContract = readJsonWithSource(path.resolve(args.releaseContract), 'release contract');
    const releaseEvidence = readJsonWithSource(path.resolve(args.releaseEvidence), 'release evidence').value;
    const result = finalizeCompatibilityEvidence(prepared, {
      release_contract_source: releaseContract.source,
      release_contract: releaseContract.value,
      release_evidence: releaseEvidence,
    });
    if (result.result === 'PASS') writeRuntimeEvidence(result.evidence);
    console.log(args.json ? JSON.stringify(result, null, 2) : `${result.result}: ${prepared.package_name ?? 'unknown'} compatibility FINALIZE`);
    if (result.result !== 'PASS') process.exitCode = 1;
    return result;
  }
  throw new Error(`Unknown command: ${args.command}`);
}

const isCli = process.argv[1]
  && path.resolve(process.argv[1]) === path.resolve(fileURLToPath(import.meta.url));

if (isCli) {
  try {
    main();
  } catch (error) {
    console.error(`ERROR: ${error instanceof Error ? error.message : String(error)}`);
    process.exit(1);
  }
}