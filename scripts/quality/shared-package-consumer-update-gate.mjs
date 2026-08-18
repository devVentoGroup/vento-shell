import { createHash } from 'node:crypto';

export const CONSUMER_UPDATE_GATE_INSTANCE_ID = 'SHELL-CI-006::GLOBAL';
export const CONSUMER_UPDATE_SCHEMA_VERSION = 1;
export const RUNTIME_EVIDENCE_RELATIVE_ROOT = '.delivery/shared-package-consumer-update';

export const CANONICAL_SHARED_PACKAGES = Object.freeze([
  '@vento/contracts',
  '@vento/os-context',
  '@vento/supabase',
  '@vento/ui-web',
]);

export const CANONICAL_WEB_CONSUMERS = Object.freeze([
  'vento-shell',
  'vento-viso',
  'vento-nexo',
  'vento-fogo',
  'vento-origo',
  'vento-pulso',
  'vento-numera',
]);

export const CONSUMER_CODES = Object.freeze({
  'vento-shell': 'SHELL',
  'vento-viso': 'VISO',
  'vento-nexo': 'NEXO',
  'vento-fogo': 'FOGO',
  'vento-origo': 'ORIGO',
  'vento-pulso': 'PULSO',
  'vento-numera': 'NUMERA',
});

export const UPDATE_CLASSES = Object.freeze([
  'INITIAL_ADOPTION',
  'PATCH_UPDATE',
  'MINOR_UPDATE',
  'MAJOR_UPDATE',
  'SECURITY_UPDATE',
  'DEPRECATION_MIGRATION',
  'ROLLBACK_UPDATE',
]);

export const PROPOSAL_STATES = Object.freeze([
  'NOT_REQUESTED',
  'ELIGIBLE',
  'PR_OPEN',
  'VALIDATING',
  'CHANGES_REQUESTED',
  'BLOCKED',
  'READY_FOR_REVIEW',
  'APPROVED_FOR_MERGE',
  'MERGED',
  'ADOPTION_PENDING',
  'ADOPTED',
  'CLOSED_NO_CHANGE',
  'SUPERSEDED',
  'REVERTED',
]);

export const GATE_RESULTS = Object.freeze([
  'PENDING',
  'RUNNING',
  'PASS',
  'FAIL',
  'BLOCKED',
  'CANCELLED',
  'TIMED_OUT',
  'STALE',
  'NOT_APPLICABLE',
]);

const gate = (number, name, applicability, owner) => Object.freeze({
  id: `PKG-GATE-${String(number).padStart(3, '0')}`,
  name,
  applicability,
  owner,
});

export const GATE_DEFINITIONS = Object.freeze([
  gate(1, 'identidad de release', 'UNIVERSAL', 'SHELL-CI-001/SHELL-CI-003'),
  gate(2, 'elegibilidad de versión', 'UNIVERSAL', 'SHELL-CI-003/SHELL-CI-005'),
  gate(3, 'coherencia manifest-lockfile', 'UNIVERSAL', 'SHELL-CI-006'),
  gate(4, 'instalación bloqueada reproducible', 'UNIVERSAL', 'SHELL-CI-006/CONSUMIDOR'),
  gate(5, 'pruebas propias del package', 'UNIVERSAL', 'SHELL-CI-001/PACKAGE'),
  gate(6, 'lint o análisis estático del consumidor', 'UNIVERSAL', 'CONSUMIDOR/SHELL-CI-006'),
  gate(7, 'typecheck del consumidor', 'UNIVERSAL', 'CONSUMIDOR/SHELL-CI-006'),
  gate(8, 'build o export del consumidor', 'UNIVERSAL', 'CONSUMIDOR/SHELL-CI-006'),
  gate(9, 'pruebas automatizadas del consumidor', 'UNIVERSAL', 'CONSUMIDOR/SHELL-CI-006'),
  gate(10, 'matriz de compatibilidad', 'UNIVERSAL', 'SHELL-CI-002/SHELL-CI-005'),
  gate(11, 'perfil especializado de familia', 'UNIVERSAL', 'SHELL-CI-002/SHELL-CI-004'),
  gate(12, 'requisitos de prueba afectados', 'UNIVERSAL', 'SHELL-CI-006/04A'),
  gate(13, 'controles reforzados por riesgo', 'CONDITIONAL', 'PROPIETARIOS_APLICABLES'),
  gate(14, 'vigencia y coherencia de evidencia', 'UNIVERSAL', 'SHELL-CI-006'),
  gate(15, 'revisión y protección de merge', 'UNIVERSAL', 'GOBIERNO_CONSUMIDOR'),
  gate(16, 'separación de merge, despliegue y adopción', 'UNIVERSAL', 'GOBIERNO_CI/CONSUMIDOR'),
]);

export const GATE_PROFILES = Object.freeze({
  '@vento/contracts': 'GATE-PROFILE-CONTRACTS',
  '@vento/os-context': 'GATE-PROFILE-OS-CONTEXT',
  '@vento/supabase': 'GATE-PROFILE-SUPABASE',
  '@vento/ui-web': 'GATE-PROFILE-UI-WEB',
});

export const PR_BLOCKERS = Object.freeze([
  'PR-BLK-001', 'PR-BLK-002', 'PR-BLK-003', 'PR-BLK-004', 'PR-BLK-005', 'PR-BLK-006',
  'PR-BLK-007', 'PR-BLK-008', 'PR-BLK-009', 'PR-BLK-010', 'PR-BLK-011', 'PR-BLK-012',
  'PR-BLK-013', 'PR-BLK-014', 'PR-BLK-015', 'PR-BLK-016', 'PR-BLK-017', 'PR-BLK-018',
]);

export const UPDATE_RECORD_FIELDS = Object.freeze([
  'update_id',
  'consumer_repository',
  'consumer_owner',
  'target_branch',
  'base_commit',
  'proposal_commit',
  'remote_pr_ref',
  'update_class',
  'trigger',
  'package_set_from',
  'package_set_to',
  'release_refs',
  'manifest_before_hash',
  'manifest_after_hash',
  'lockfile_before_hash',
  'lockfile_after_hash',
  'compatibility_ref',
  'changelog_ref',
  'deprecation_refs',
  'security_ref',
  'rollback_ref',
  'treq_impact',
  'supabase_impact',
  'data_impact',
  'configuration_impact',
  'cache_impact',
  'validation_results',
  'evidence_refs',
  'required_reviewers',
  'approvals',
  'bot_identity',
  'opened_at',
  'updated_at',
  'merged_at',
  'deployment_ref',
  'outcome',
  'supersedes',
  'superseded_by',
]);

function relationId(index) {
  return `PKG-PR-REL-${String(index).padStart(3, '0')}`;
}

function compatibilityRelationId(index) {
  return `PKG-COMP-MX-${String(index).padStart(3, '0')}`;
}

export const CANONICAL_UPDATE_RELATIONS = Object.freeze(
  CANONICAL_SHARED_PACKAGES.flatMap((packageName, packageIndex) => (
    CANONICAL_WEB_CONSUMERS.map((consumerRepository, consumerIndex) => {
      const index = (packageIndex * CANONICAL_WEB_CONSUMERS.length) + consumerIndex + 1;
      return Object.freeze({
        relation_identity: relationId(index),
        compatibility_relation_identity: compatibilityRelationId(index),
        package_name: packageName,
        consumer_repository: consumerRepository,
        applicability: 'APLICA',
        initial_state: 'NO_APLICA_SIN_RELEASE_ESTABLE',
      });
    })
  )),
);

const RELATION_BY_PAIR = new Map(
  CANONICAL_UPDATE_RELATIONS.map((entry) => [`${entry.package_name}\n${entry.consumer_repository}`, entry]),
);
const UPDATE_CLASS_SET = new Set(UPDATE_CLASSES);
const PROPOSAL_STATE_SET = new Set(PROPOSAL_STATES);
const GATE_RESULT_SET = new Set(GATE_RESULTS);
const SHA256_IDENTITY_PATTERN = /^sha256:[0-9a-f]{64}$/u;
const COMMIT_PATTERN = /^[0-9a-f]{40}$/u;
const EXACT_SEMVER_PATTERN = /^\d+\.\d+\.\d+(?:-[0-9A-Za-z]+(?:[.-][0-9A-Za-z]+)*)?$/u;
const SENSITIVE_KEY_PATTERN = /(?:^|[_-])(?:authorization|cookie|credential|password|secret|token|api[_-]?key|private[_-]?key|service[_-]?role)(?:$|[_-])/iu;
const SENSITIVE_TEXT_PATTERNS = Object.freeze([
  /\bgh[pousr]_[A-Za-z0-9_]{24,}\b/u,
  /\bAKIA[0-9A-Z]{16}\b/u,
  /-----BEGIN (?:RSA |EC |OPENSSH )?PRIVATE KEY-----/u,
  /\b(?:password|secret|token|api[_-]?key|private[_-]?key)\s*[:=]\s*["']?[^\s"']{8,}/iu,
]);
const FORBIDDEN_AUTOMATION_CAPABILITIES = new Set([
  'approve_own_pr',
  'merge_pr',
  'deploy',
  'write_protected_branch',
  'modify_branch_protection',
  'modify_required_checks',
  'publish_package',
  'supabase_mutation',
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

export function updateIdentity(value) {
  return `sha256:${createHash('sha256').update(stableCanonicalStringify(value)).digest('hex')}`;
}

function assertShaIdentity(value, code, errors) {
  if (!SHA256_IDENTITY_PATTERN.test(String(value ?? ''))) errors.push(code);
}

function normalizePackageSet(value) {
  if (!Array.isArray(value)) return [];
  return value
    .map((entry) => ({
      package_name: String(entry?.package_name ?? '').trim(),
      version: String(entry?.version ?? '').trim(),
    }))
    .filter((entry) => entry.package_name && entry.version)
    .sort((a, b) => compareText(a.package_name, b.package_name));
}

function packageSetIdentity(value) {
  return updateIdentity(normalizePackageSet(value));
}

function isExactSemver(value) {
  return EXACT_SEMVER_PATTERN.test(String(value ?? ''));
}

function rootDependencies(lockfile) {
  if (!isPlainObject(lockfile)) return {};
  if (isPlainObject(lockfile.packages?.['']?.dependencies)) return lockfile.packages[''].dependencies;
  return {};
}

function lockfileResolvedVersion(lockfile, packageName) {
  const direct = lockfile?.packages?.[`node_modules/${packageName}`]?.version;
  if (nonEmptyString(direct)) return direct;
  const legacy = lockfile?.dependencies?.[packageName]?.version;
  if (nonEmptyString(legacy)) return legacy;
  return null;
}

function sensitiveFindings(value, pointer = '$', findings = []) {
  if (Array.isArray(value)) {
    value.forEach((child, index) => sensitiveFindings(child, `${pointer}[${index}]`, findings));
    return findings;
  }
  if (isPlainObject(value)) {
    for (const [key, child] of Object.entries(value)) {
      const next = `${pointer}.${key}`;
      if (SENSITIVE_KEY_PATTERN.test(key) && child !== null && child !== undefined && String(child).length > 0) {
        findings.push(next);
      }
      sensitiveFindings(child, next, findings);
    }
    return findings;
  }
  if (typeof value === 'string' && SENSITIVE_TEXT_PATTERNS.some((pattern) => pattern.test(value))) findings.push(pointer);
  return findings;
}

export function validateNoSensitiveData(value) {
  return sensitiveFindings(value).map((pointer) => `SENSITIVE_DATA:${pointer}`);
}

export function validateBaseUpdateMatrix(relations = CANONICAL_UPDATE_RELATIONS) {
  const errors = [];
  if (!Array.isArray(relations)) return ['UPDATE_MATRIX_NOT_ARRAY'];
  if (relations.length !== 28) errors.push(`UPDATE_MATRIX_CARDINALITY:${relations.length}`);
  const ids = relations.map((entry) => entry?.relation_identity);
  if (unique(ids).length !== ids.length) errors.push('UPDATE_MATRIX_DUPLICATE_RELATION');
  CANONICAL_UPDATE_RELATIONS.forEach((expected, index) => {
    const actual = relations[index];
    if (!actual) return;
    for (const field of [
      'relation_identity',
      'compatibility_relation_identity',
      'package_name',
      'consumer_repository',
      'applicability',
      'initial_state',
    ]) {
      if (actual[field] !== expected[field]) errors.push(`UPDATE_MATRIX_MISMATCH:${expected.relation_identity}:${field}`);
    }
  });
  return unique(errors);
}

export function validateManifestLockfile({ manifest, lockfile, packageSet }) {
  const errors = [];
  if (!isPlainObject(manifest)) return ['MANIFEST_NOT_OBJECT'];
  if (!isPlainObject(lockfile)) return ['LOCKFILE_NOT_OBJECT'];
  const targetSet = normalizePackageSet(packageSet);
  if (targetSet.length === 0) errors.push('PACKAGE_SET_EMPTY');
  const manifestDependencies = {
    ...(isPlainObject(manifest.dependencies) ? manifest.dependencies : {}),
    ...(isPlainObject(manifest.devDependencies) ? manifest.devDependencies : {}),
    ...(isPlainObject(manifest.optionalDependencies) ? manifest.optionalDependencies : {}),
  };
  const lockRoot = rootDependencies(lockfile);
  for (const entry of targetSet) {
    if (!CANONICAL_SHARED_PACKAGES.includes(entry.package_name)) {
      errors.push(`PACKAGE_NOT_CANONICAL:${entry.package_name}`);
      continue;
    }
    if (!isExactSemver(entry.version)) errors.push(`PACKAGE_VERSION_NOT_EXACT:${entry.package_name}`);
    const declared = manifestDependencies[entry.package_name];
    if (declared !== entry.version) errors.push(`MANIFEST_VERSION_MISMATCH:${entry.package_name}`);
    if (lockRoot[entry.package_name] !== entry.version) errors.push(`LOCKFILE_ROOT_VERSION_MISMATCH:${entry.package_name}`);
    if (lockfileResolvedVersion(lockfile, entry.package_name) !== entry.version) {
      errors.push(`LOCKFILE_RESOLVED_VERSION_MISMATCH:${entry.package_name}`);
    }
  }
  return unique(errors);
}

function validateReleaseRefs(packageSet, releaseRefs) {
  const identityErrors = [];
  const eligibilityErrors = [];
  const targetSet = normalizePackageSet(packageSet);
  if (!Array.isArray(releaseRefs)) return {
    identityErrors: ['RELEASE_REFS_MISSING'],
    eligibilityErrors: ['RELEASE_REFS_MISSING'],
  };
  for (const target of targetSet) {
    const ref = releaseRefs.find((entry) => entry?.package_name === target.package_name);
    if (!ref) {
      eligibilityErrors.push(`RELEASE_MISSING:${target.package_name}`);
      continue;
    }
    if (ref.release_status !== 'PASS') eligibilityErrors.push(`RELEASE_NOT_PASS:${target.package_name}`);
    if (ref.version !== target.version) identityErrors.push(`RELEASE_VERSION_MISMATCH:${target.package_name}`);
    if (!COMMIT_PATTERN.test(String(ref.source_commit ?? ''))) identityErrors.push(`RELEASE_COMMIT_INVALID:${target.package_name}`);
    for (const field of ['release_identity', 'artifact_identity', 'manifest_identity']) {
      if (!SHA256_IDENTITY_PATTERN.test(String(ref[field] ?? ''))) identityErrors.push(`RELEASE_${field.toUpperCase()}_INVALID:${target.package_name}`);
    }
    if (!nonEmptyString(ref.integrity)) identityErrors.push(`RELEASE_INTEGRITY_MISSING:${target.package_name}`);
  }
  return { identityErrors: unique(identityErrors), eligibilityErrors: unique(eligibilityErrors) };
}

function expectedCompatibilityRelation(packageName, consumerRepository) {
  return RELATION_BY_PAIR.get(`${packageName}\n${consumerRepository}`)?.compatibility_relation_identity ?? null;
}

function validateCompatibility(packageSet, consumerRepository, compatibilities) {
  const errors = [];
  if (!Array.isArray(compatibilities)) return ['COMPATIBILITY_MISSING'];
  for (const target of normalizePackageSet(packageSet)) {
    const expectedRelation = expectedCompatibilityRelation(target.package_name, consumerRepository);
    const evidence = compatibilities.find((entry) => entry?.package_name === target.package_name);
    if (!evidence) {
      errors.push(`COMPATIBILITY_MISSING:${target.package_name}`);
      continue;
    }
    if (evidence.consumer_repository !== consumerRepository) errors.push(`COMPATIBILITY_CONSUMER_MISMATCH:${target.package_name}`);
    if (evidence.package_version !== target.version) errors.push(`COMPATIBILITY_VERSION_MISMATCH:${target.package_name}`);
    if (evidence.relation_identity !== expectedRelation) errors.push(`COMPATIBILITY_RELATION_MISMATCH:${target.package_name}`);
    if (evidence.phase !== 'FINALIZE' || evidence.result !== 'PASS') errors.push(`COMPATIBILITY_NOT_FINAL_PASS:${target.package_name}`);
    if (evidence.stale === true) errors.push(`COMPATIBILITY_STALE:${target.package_name}`);
    assertShaIdentity(evidence.compatibility_evidence_identity, `COMPATIBILITY_IDENTITY_INVALID:${target.package_name}`, errors);
    assertShaIdentity(evidence.finalization_identity, `COMPATIBILITY_FINALIZATION_IDENTITY_INVALID:${target.package_name}`, errors);
    assertShaIdentity(evidence.artifact_identity, `COMPATIBILITY_ARTIFACT_IDENTITY_INVALID:${target.package_name}`, errors);
    if (!nonEmptyString(evidence.target_identity)) errors.push(`COMPATIBILITY_TARGET_MISSING:${target.package_name}`);
    if (!nonEmptyString(evidence.renderer_class)) errors.push(`COMPATIBILITY_RENDERER_MISSING:${target.package_name}`);
  }
  return unique(errors);
}

function validateGateResults(gateResults) {
  const errors = [];
  if (!isPlainObject(gateResults)) return ['GATE_RESULTS_MISSING'];
  for (const definition of GATE_DEFINITIONS) {
    const result = gateResults[definition.id];
    if (!isPlainObject(result)) {
      errors.push(`GATE_RESULT_MISSING:${definition.id}`);
      continue;
    }
    if (!GATE_RESULT_SET.has(result.status)) {
      errors.push(`GATE_RESULT_INVALID:${definition.id}`);
      continue;
    }
    if (definition.applicability === 'UNIVERSAL' && result.status !== 'PASS') {
      errors.push(`UNIVERSAL_GATE_NOT_PASS:${definition.id}`);
    }
    if (definition.applicability === 'CONDITIONAL') {
      if (!['PASS', 'NOT_APPLICABLE'].includes(result.status)) errors.push(`CONDITIONAL_GATE_NOT_SATISFIED:${definition.id}`);
      if (result.status === 'NOT_APPLICABLE' && !nonEmptyString(result.reason)) errors.push(`CONDITIONAL_GATE_REASON_MISSING:${definition.id}`);
    }
    if (result.status === 'PASS' && (!Array.isArray(result.evidence_ids) || result.evidence_ids.length === 0)) {
      errors.push(`GATE_EVIDENCE_MISSING:${definition.id}`);
    }
  }
  return unique(errors);
}

function requiredReviewersSatisfied(requiredReviewers, approvals) {
  if (!Array.isArray(requiredReviewers) || requiredReviewers.length === 0) return false;
  if (!Array.isArray(approvals)) return false;
  const approved = new Set(approvals.filter((entry) => entry?.status === 'APPROVED').map((entry) => entry.reviewer));
  return requiredReviewers.every((reviewer) => approved.has(reviewer));
}

function validateUpdateId(updateId, consumerRepository) {
  const code = CONSUMER_CODES[consumerRepository];
  if (!code) return false;
  return new RegExp(`^PKG-PR-${code}-[1-9][0-9]*$`, 'u').test(String(updateId ?? ''));
}

function currentEvidenceSnapshot(input, hashes) {
  return {
    base_commit: input.base_commit,
    proposal_commit: input.proposal_commit,
    manifest_after_hash: hashes.manifestAfter,
    lockfile_after_hash: hashes.lockfileAfter,
    package_set_to_identity: packageSetIdentity(input.package_set_to),
  };
}

function blocker(code, reason, details = []) {
  return { code, reason, details: [...details] };
}

export function detectBlockers(input, derived = null) {
  const blockers = [];
  const consumer = input?.consumer_repository;
  const packageSetTo = normalizePackageSet(input?.package_set_to);
  const hashes = derived?.hashes ?? {
    manifestBefore: updateIdentity(input?.manifest_before ?? null),
    manifestAfter: updateIdentity(input?.manifest_after ?? null),
    lockfileBefore: updateIdentity(input?.lockfile_before ?? null),
    lockfileAfter: updateIdentity(input?.lockfile_after ?? null),
  };

  const releases = validateReleaseRefs(packageSetTo, input?.release_refs);
  if (releases.eligibilityErrors.length > 0) blockers.push(blocker('PR-BLK-001', 'release canónica inexistente o no elegible', releases.eligibilityErrors));
  if (releases.identityErrors.length > 0) blockers.push(blocker('PR-BLK-002', 'identidad de release incoherente', releases.identityErrors));

  const manifestErrors = validateManifestLockfile({
    manifest: input?.manifest_after,
    lockfile: input?.lockfile_after,
    packageSet: packageSetTo,
  });
  if (manifestErrors.some((entry) => entry.startsWith('MANIFEST_') || entry.startsWith('LOCKFILE_'))) {
    blockers.push(blocker('PR-BLK-003', 'manifest y lockfile no son una unidad coherente', manifestErrors));
  }
  if (manifestErrors.some((entry) => entry.includes('VERSION_NOT_EXACT'))
    || packageSetTo.some((entry) => !isExactSemver(entry.version))) {
    blockers.push(blocker('PR-BLK-004', 'la propuesta no usa versiones exactas publicables', manifestErrors));
  }

  const compatibilityErrors = validateCompatibility(packageSetTo, consumer, input?.compatibilities);
  if (compatibilityErrors.length > 0) blockers.push(blocker('PR-BLK-005', 'compatibilidad ausente o no atribuible', compatibilityErrors));

  const gateErrors = validateGateResults(input?.gate_results);
  if (gateErrors.length > 0) blockers.push(blocker('PR-BLK-006', 'gate obligatorio incompleto o fallido', gateErrors));

  const snapshot = currentEvidenceSnapshot(input, hashes);
  if (isPlainObject(input?.evidence_snapshot)
    && stableCanonicalStringify(input.evidence_snapshot) !== stableCanonicalStringify(snapshot)) {
    blockers.push(blocker('PR-BLK-007', 'evidencia ligada a otra base, propuesta, manifest, lockfile o conjunto objetivo'));
  }

  if (input?.update_class === 'MAJOR_UPDATE' && input?.risk_controls?.major_ready !== true) {
    blockers.push(blocker('PR-BLK-008', 'actualización MAJOR sin migración o revisión reforzada'));
  }
  if (input?.update_class === 'DEPRECATION_MIGRATION' && input?.risk_controls?.deprecation_ready !== true) {
    blockers.push(blocker('PR-BLK-009', 'deprecación sin expediente o uso residual resuelto'));
  }
  if (input?.update_class === 'SECURITY_UPDATE' && input?.risk_controls?.security_safe !== true) {
    blockers.push(blocker('PR-BLK-010', 'actualización de seguridad sin tratamiento seguro'));
  }

  const supabaseAffected = packageSetTo.some((entry) => entry.package_name === '@vento/supabase');
  const remoteDataChange = input?.risk_controls?.remote_data_or_supabase_change === true;
  if ((supabaseAffected || remoteDataChange)
    && input?.supabase_impact !== 'NO_APLICA'
    && !nonEmptyString(input?.risk_controls?.supabase_owner_task)) {
    blockers.push(blocker('PR-BLK-011', 'impacto de datos o Supabase sin tarea propietaria'));
  }

  if (!nonEmptyString(input?.rollback_ref) || ['NONE', 'PENDING'].includes(input.rollback_ref)) {
    blockers.push(blocker('PR-BLK-012', 'snapshot anterior certificado o rollback ausente'));
  }

  if (!requiredReviewersSatisfied(input?.required_reviewers, input?.approvals)) {
    blockers.push(blocker('PR-BLK-013', 'revisores o aprobaciones requeridas incompletas'));
  }

  const capabilities = new Set(input?.automation?.capabilities ?? []);
  const forbidden = [...capabilities].filter((entry) => FORBIDDEN_AUTOMATION_CAPABILITIES.has(entry));
  if (forbidden.length > 0 || input?.automation?.attempt_merge === true || input?.automation?.attempt_deploy === true) {
    blockers.push(blocker('PR-BLK-014', 'la identidad automatizada excede su autoridad', forbidden));
  }

  if (input?.change_scope?.attributable_only !== true) {
    blockers.push(blocker('PR-BLK-015', 'la propuesta contiene cambios ajenos o no atribuibles'));
  }

  if (packageSetTo.length > 1
    && (input?.multi_package?.minimal !== true
      || input?.multi_package?.closed !== true
      || input?.multi_package?.resolvable !== true)) {
    blockers.push(blocker('PR-BLK-016', 'conjunto multi-package no mínimo, cerrado o resoluble'));
  }

  if (nonEmptyString(input?.reviewed_package_set_to_identity)
    && input.reviewed_package_set_to_identity !== packageSetIdentity(packageSetTo)) {
    blockers.push(blocker('PR-BLK-017', 'versión o conjunto objetivo sustituido después de revisión'));
  }

  if (input?.risk_controls?.simultaneous_deploy_required === true) {
    blockers.push(blocker('PR-BLK-018', 'la adopción requeriría despliegue simultáneo no probado'));
  }

  return blockers;
}

function profileForPackageSet(packageSet) {
  return normalizePackageSet(packageSet).map((entry) => ({
    package_name: entry.package_name,
    profile: GATE_PROFILES[entry.package_name] ?? null,
  }));
}

function representativeCompatibilityRef(input) {
  const values = (input.compatibilities ?? []).map((entry) => entry.finalization_identity).filter(nonEmptyString).sort(compareText);
  return values.length === 0 ? 'NONE' : updateIdentity(values);
}

function buildRecord(input, hashes, blockers, state, evidenceIdentity) {
  return {
    update_id: input.update_id,
    consumer_repository: input.consumer_repository,
    consumer_owner: input.consumer_owner,
    target_branch: input.target_branch,
    base_commit: input.base_commit,
    proposal_commit: input.proposal_commit,
    remote_pr_ref: input.remote_pr_ref ?? 'PENDING',
    update_class: input.update_class,
    trigger: input.trigger,
    package_set_from: normalizePackageSet(input.package_set_from),
    package_set_to: normalizePackageSet(input.package_set_to),
    release_refs: input.release_refs ?? [],
    manifest_before_hash: hashes.manifestBefore,
    manifest_after_hash: hashes.manifestAfter,
    lockfile_before_hash: hashes.lockfileBefore,
    lockfile_after_hash: hashes.lockfileAfter,
    compatibility_ref: representativeCompatibilityRef(input),
    changelog_ref: input.changelog_ref ?? 'NONE',
    deprecation_refs: input.deprecation_refs ?? [],
    security_ref: input.security_ref ?? 'NONE',
    rollback_ref: input.rollback_ref,
    treq_impact: input.treq_impact ?? { created: 0, modified: 0, affected: [] },
    supabase_impact: input.supabase_impact ?? 'NO_APLICA',
    data_impact: input.data_impact ?? 'NO_APLICA',
    configuration_impact: input.configuration_impact ?? 'NO_APLICA',
    cache_impact: input.cache_impact ?? 'NO_APLICA',
    validation_results: input.gate_results ?? {},
    evidence_refs: unique([...(input.evidence_refs ?? []), evidenceIdentity].filter(nonEmptyString)),
    required_reviewers: input.required_reviewers ?? [],
    approvals: input.approvals ?? [],
    bot_identity: input.bot_identity ?? 'MANUAL',
    opened_at: input.opened_at ?? 'PENDING',
    updated_at: input.updated_at ?? 'PENDING',
    merged_at: input.merged_at ?? 'NONE',
    deployment_ref: input.deployment_ref ?? 'PENDING',
    outcome: blockers.length > 0 ? { state: 'BLOCKED', blockers: blockers.map((entry) => entry.code) } : { state, blockers: [] },
    supersedes: input.supersedes ?? 'NONE',
    superseded_by: input.superseded_by ?? 'NONE',
  };
}

export function validateUpdateRecord(record) {
  const errors = [];
  if (!isPlainObject(record)) return ['UPDATE_RECORD_NOT_OBJECT'];
  for (const field of UPDATE_RECORD_FIELDS) {
    if (!Object.hasOwn(record, field)) errors.push(`UPDATE_RECORD_FIELD_MISSING:${field}`);
  }
  if (!validateUpdateId(record.update_id, record.consumer_repository)) errors.push('UPDATE_ID_INVALID');
  if (!UPDATE_CLASS_SET.has(record.update_class)) errors.push('UPDATE_CLASS_INVALID');
  if (!CANONICAL_WEB_CONSUMERS.includes(record.consumer_repository)) errors.push('CONSUMER_NOT_CANONICAL');
  if (!COMMIT_PATTERN.test(String(record.base_commit ?? ''))) errors.push('BASE_COMMIT_INVALID');
  if (!COMMIT_PATTERN.test(String(record.proposal_commit ?? ''))) errors.push('PROPOSAL_COMMIT_INVALID');
  for (const field of ['manifest_before_hash', 'manifest_after_hash', 'lockfile_before_hash', 'lockfile_after_hash']) {
    if (!SHA256_IDENTITY_PATTERN.test(String(record[field] ?? ''))) errors.push(`UPDATE_RECORD_HASH_INVALID:${field}`);
  }
  if (validateNoSensitiveData(record).length > 0) errors.push('UPDATE_RECORD_CONTAINS_SENSITIVE_DATA');
  return unique(errors);
}

export function evaluateConsumerUpdate(input) {
  const errors = [];
  if (!isPlainObject(input)) return { result: 'BLOCKED', state: 'BLOCKED', errors: ['INPUT_NOT_OBJECT'], blockers: [], evidence: null };
  if (input.schema_version !== undefined && input.schema_version !== CONSUMER_UPDATE_SCHEMA_VERSION) errors.push('SCHEMA_VERSION_UNSUPPORTED');
  if (!CANONICAL_WEB_CONSUMERS.includes(input.consumer_repository)) errors.push('CONSUMER_NOT_CANONICAL');
  if (!validateUpdateId(input.update_id, input.consumer_repository)) errors.push('UPDATE_ID_INVALID');
  if (!UPDATE_CLASS_SET.has(input.update_class)) errors.push('UPDATE_CLASS_INVALID');
  if (!COMMIT_PATTERN.test(String(input.base_commit ?? ''))) errors.push('BASE_COMMIT_INVALID');
  if (!COMMIT_PATTERN.test(String(input.proposal_commit ?? ''))) errors.push('PROPOSAL_COMMIT_INVALID');
  if (!nonEmptyString(input.consumer_owner)) errors.push('CONSUMER_OWNER_MISSING');
  if (!nonEmptyString(input.target_branch)) errors.push('TARGET_BRANCH_MISSING');
  if (!nonEmptyString(input.trigger)) errors.push('TRIGGER_MISSING');
  errors.push(...validateNoSensitiveData(input));

  const hashes = {
    manifestBefore: updateIdentity(input.manifest_before ?? null),
    manifestAfter: updateIdentity(input.manifest_after ?? null),
    lockfileBefore: updateIdentity(input.lockfile_before ?? null),
    lockfileAfter: updateIdentity(input.lockfile_after ?? null),
  };
  const blockers = detectBlockers(input, { hashes });

  const state = errors.length > 0 || blockers.length > 0 ? 'BLOCKED' : 'READY_FOR_REVIEW';
  const identityPayload = {
    schema_version: CONSUMER_UPDATE_SCHEMA_VERSION,
    update_id: input.update_id,
    consumer_repository: input.consumer_repository,
    base_commit: input.base_commit,
    proposal_commit: input.proposal_commit,
    update_class: input.update_class,
    package_set_from: normalizePackageSet(input.package_set_from),
    package_set_to: normalizePackageSet(input.package_set_to),
    hashes,
    release_identities: (input.release_refs ?? []).map((entry) => entry.release_identity).filter(nonEmptyString).sort(compareText),
    compatibility_identities: (input.compatibilities ?? []).map((entry) => entry.finalization_identity).filter(nonEmptyString).sort(compareText),
    gate_results: input.gate_results,
    gate_profiles: profileForPackageSet(input.package_set_to),
  };
  const evidenceIdentity = updateIdentity(identityPayload);
  const record = buildRecord(input, hashes, blockers, state, evidenceIdentity);
  errors.push(...validateUpdateRecord(record));

  const evidence = {
    schema_version: CONSUMER_UPDATE_SCHEMA_VERSION,
    gate_instance_id: CONSUMER_UPDATE_GATE_INSTANCE_ID,
    phase: 'PREPARE',
    result: errors.length === 0 && blockers.length === 0 ? 'PASS' : 'BLOCKED',
    state,
    proposal_identity: evidenceIdentity,
    relation_identities: normalizePackageSet(input.package_set_to).map((entry) => RELATION_BY_PAIR.get(`${entry.package_name}\n${input.consumer_repository}`)?.relation_identity ?? null),
    compatibility_relation_identities: normalizePackageSet(input.package_set_to).map((entry) => expectedCompatibilityRelation(entry.package_name, input.consumer_repository)),
    update_record_identity: updateIdentity(record),
    package_set_to_identity: packageSetIdentity(input.package_set_to),
    gate_profile_set_identity: updateIdentity(profileForPackageSet(input.package_set_to)),
    evidence_snapshot: currentEvidenceSnapshot(input, hashes),
    blockers,
    record,
  };

  return {
    result: evidence.result,
    state,
    errors: unique(errors),
    blockers,
    evidence,
  };
}

export function compareUpdateEvidence(previousEvidence, currentInput) {
  const current = evaluateConsumerUpdate(currentInput);
  if (!previousEvidence || !SHA256_IDENTITY_PATTERN.test(String(previousEvidence.proposal_identity ?? ''))) {
    return { current: false, outcome: 'STALE', reasons: ['PREVIOUS_EVIDENCE_INVALID'], evaluated: current };
  }
  if (current.result !== 'PASS') {
    return { current: false, outcome: 'STALE', reasons: ['CURRENT_INPUT_NOT_PASS'], evaluated: current };
  }
  if (previousEvidence.proposal_identity !== current.evidence.proposal_identity) {
    return { current: false, outcome: 'STALE', reasons: ['MATERIAL_INPUT_CHANGED'], evaluated: current };
  }
  return { current: true, outcome: 'PASS', reasons: [], evaluated: current };
}

export function appendUpdateHistory(history, evidence) {
  const current = Array.isArray(history) ? [...history] : [];
  const identity = evidence?.proposal_identity;
  if (!SHA256_IDENTITY_PATTERN.test(String(identity ?? ''))) return { history: current, appended: false };
  if (current.some((entry) => entry?.proposal_identity === identity)) return { history: current, appended: false };
  return { history: [...current, evidence], appended: true };
}

export function supersedeUpdate(previousEvidence, nextInput) {
  const next = evaluateConsumerUpdate(nextInput);
  if (next.result !== 'PASS') return { result: 'BLOCKED', reasons: ['NEXT_PROPOSAL_NOT_PASS'], previous: previousEvidence, next };
  if (!previousEvidence?.record?.update_id) return { result: 'BLOCKED', reasons: ['PREVIOUS_UPDATE_ID_MISSING'], previous: previousEvidence, next };
  if (previousEvidence.proposal_identity === next.evidence.proposal_identity) {
    return { result: 'BLOCKED', reasons: ['EQUIVALENT_PROPOSAL_CANNOT_SUPERSEDE'], previous: previousEvidence, next };
  }
  const linkedRecord = {
    ...next.evidence.record,
    supersedes: previousEvidence.record.update_id,
  };
  const linkedEvidence = {
    ...next.evidence,
    record: linkedRecord,
    update_record_identity: updateIdentity(linkedRecord),
  };
  return {
    result: 'PASS',
    reasons: [],
    previous: {
      ...previousEvidence,
      record: {
        ...previousEvidence.record,
        superseded_by: linkedRecord.update_id,
        outcome: { state: 'SUPERSEDED', blockers: [] },
      },
    },
    next: { ...next, evidence: linkedEvidence },
  };
}

export function automationActionPlan(evaluation) {
  if (evaluation?.result !== 'PASS') {
    return Object.freeze({
      allowed: false,
      actions: [],
      forbidden: ['merge_pr', 'deploy', 'write_protected_branch', 'supabase_mutation'],
    });
  }
  return Object.freeze({
    allowed: true,
    actions: [
      'prepare_isolated_checkout',
      'update_authorized_manifest_and_lockfile',
      'run_authorized_validations',
      'prepare_proposal_branch',
      'create_or_maintain_pull_request',
      'publish_non_sensitive_evidence',
    ],
    forbidden: [
      'approve_own_pr',
      'merge_pr',
      'deploy',
      'write_protected_branch',
      'modify_branch_protection',
      'modify_required_checks',
      'publish_package',
      'supabase_mutation',
    ],
  });
}

export function validateCanonicalContract() {
  const errors = [];
  errors.push(...validateBaseUpdateMatrix());
  if (CANONICAL_SHARED_PACKAGES.length !== 4) errors.push('PACKAGE_CARDINALITY_INVALID');
  if (CANONICAL_WEB_CONSUMERS.length !== 7) errors.push('CONSUMER_CARDINALITY_INVALID');
  if (UPDATE_CLASSES.length !== 7) errors.push('UPDATE_CLASS_CARDINALITY_INVALID');
  if (PROPOSAL_STATES.length !== 14) errors.push('PROPOSAL_STATE_CARDINALITY_INVALID');
  if (UPDATE_RECORD_FIELDS.length !== 38) errors.push('UPDATE_RECORD_FIELD_CARDINALITY_INVALID');
  if (GATE_DEFINITIONS.length !== 16) errors.push('GATE_CARDINALITY_INVALID');
  if (GATE_DEFINITIONS.filter((entry) => entry.applicability === 'UNIVERSAL').length !== 15) errors.push('UNIVERSAL_GATE_CARDINALITY_INVALID');
  if (GATE_DEFINITIONS.filter((entry) => entry.applicability === 'CONDITIONAL').length !== 1) errors.push('CONDITIONAL_GATE_CARDINALITY_INVALID');
  if (Object.keys(GATE_PROFILES).length !== 4) errors.push('PROFILE_CARDINALITY_INVALID');
  if (PR_BLOCKERS.length !== 18) errors.push('BLOCKER_CARDINALITY_INVALID');
  if (unique(PR_BLOCKERS).length !== 18) errors.push('BLOCKER_DUPLICATE');
  if (new Set(GATE_DEFINITIONS.map((entry) => entry.id)).size !== 16) errors.push('GATE_DUPLICATE');
  if (PROPOSAL_STATES.some((entry) => !PROPOSAL_STATE_SET.has(entry))) errors.push('PROPOSAL_STATE_INVALID');
  return unique(errors);
}
