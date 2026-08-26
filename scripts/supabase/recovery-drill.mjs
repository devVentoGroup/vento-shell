import crypto from 'node:crypto';
import fs from 'node:fs';
import path from 'node:path';
import { spawnSync } from 'node:child_process';
import { fileURLToPath, pathToFileURL } from 'node:url';

export const RECOVERY_SCHEMA_VERSION = 1;
export const RECOVERY_INSTANCE_ID = 'AUTH-DB-029::GLOBAL';
export const LOCAL_FIXTURE_SCHEMA = 'vento_recovery_drill';
export const EVIDENCE_ROOT = '.delivery/supabase-recovery';

export const RECOVERY_MODES = Object.freeze([
    'TRANSACTION_ABORT',
    'REDEPLOY_PRIOR_ARTIFACT',
    'TRAFFIC_ROUTE_BACK',
    'AUTHORITY_RETURN_WITH_DELTA',
    'FORWARD_FIX',
    'SELECTIVE_DATA_RESTORE',
    'COMPENSATE_FORWARD',
    'RESTORE_PROJECT_OR_PITR',
    'NO_INDEPENDENT_ROLLBACK',
    'BOUNDARY_NO_TOUCH',
    'TRANSACTION_ABORT_OR_FORWARD_FIX',
    'TRAFFIC_ROUTE_BACK+UNKNOWN_OUTCOME_RECONCILIATION',
    'STOP_REPLAY+CHECKPOINT_RESTORE+COMPENSATE_FORWARD',
    'ABORT_BEFORE_MERGE_OR_COMPENSATE_FORWARD',
    'STOP_ROUTING+RETURN_SOURCE+RECONCILE_DESTINATIONS',
    'RESTORE_LIMITED_COMPATIBILITY_NO_LEGACY_AUTHORITY',
    'RETURN_AUTHORITY_WITH_DELTA_IF_SAFE_ELSE_FORWARD_RECOVERY',
]);

export const RECOVERY_OUTCOMES = Object.freeze([
    'PASS_ROLLBACK_VERIFIED',
    'PASS_FORWARD_RECOVERY_VERIFIED',
    'FAIL_PRECHECK',
    'FAIL_FORWARD_EXECUTION',
    'FAIL_ROLLBACK',
    'FAIL_POSTCHECK',
    'FAIL_RPO',
    'FAIL_RTO',
    'BLOCKED_BEFORE_ROLLBACK_DRILL',
    'NOT_ELIGIBLE_FOR_ROLLBACK_DRILL',
    'NOT_EXECUTED',
    'NOT_APPLICABLE',
]);

export const BLOCKING_CONDITIONS = Object.freeze([
    'RECOVERY_POINT_MISSING',
    'RECOVERY_POINT_NOT_VERIFIED',
    'ROLLBACK_MODE_UNRESOLVED',
    'POINT_OF_NO_RETURN_UNRESOLVED',
    'RPO_TARGET_UNRESOLVED',
    'RTO_TARGET_UNRESOLVED',
    'DRILL_NOT_ELIGIBLE',
    'DRILL_FAILED',
    'POST_RECOVERY_HARNESS_FAILED',
    'UNAUTHORIZED_DRIFT_AFTER_RECOVERY',
    'DATA_RECONCILIATION_FAILED',
    'SECURITY_RECOVERY_FAILED',
    'ESSENTIAL_CONSUMER_RECOVERY_FAILED',
    'EVIDENCE_INCOMPLETE',
]);

const RESULT_START = '=== RESULTADO PARA CHATGPT ===';
const RESULT_END = '=== FIN RESULTADO PARA CHATGPT ===';
const PROCESS_OUTPUT_MAX_BYTES = 64 * 1024 * 1024;
const SHA256_IDENTITY_PATTERN = /^sha256:[a-f0-9]{64}$/u;
const COMMIT_PATTERN = /^[a-f0-9]{40}$/u;
const ISO_PATTERN = /^\d{4}-\d{2}-\d{2}T\d{2}:\d{2}:\d{2}(?:\.\d{3})?Z$/u;
const RECOVERY_MODE_SET = new Set(RECOVERY_MODES);
const OUTCOME_SET = new Set(RECOVERY_OUTCOMES);
const SENSITIVE_KEY_PATTERN = /(?:^|[_-])(?:password|token|secret|credential|service[_-]?role|api[_-]?key|private[_-]?key|db[_-]?url)(?:$|[_-])/iu;
const SECRET_VALUE_PATTERNS = Object.freeze([
    /postgres(?:ql)?:\/\/[^\s]+/giu,
    /\b(?:eyJ|sb_(?:secret|publishable)_[A-Za-z0-9_])[A-Za-z0-9._-]{16,}\b/gu,
    /\bgh[pousr]_[A-Za-z0-9_]{24,}\b/gu,
    /-----BEGIN (?:RSA |EC |OPENSSH )?PRIVATE KEY-----/gu,
]);

function fail(code, detail = '') {
    const error = new Error(detail ? `${code}:${detail}` : code);
    error.exitCode = 1;
    throw error;
}

function repoRootFromModule() {
    return path.resolve(path.dirname(fileURLToPath(import.meta.url)), '../..');
}

function normalizeLf(value) {
    return String(value ?? '').replace(/\r\n?/gu, '\n');
}

function canonicalize(value) {
    if (typeof value === 'string') return normalizeLf(value);
    if (Array.isArray(value)) return value.map(canonicalize);
    if (!value || typeof value !== 'object') return value;
    return Object.fromEntries(
        Object.keys(value)
            .sort((left, right) => left.localeCompare(right, 'en'))
            .map((key) => [key, canonicalize(value[key])]),
    );
}

export function stableStringify(value) {
    return JSON.stringify(canonicalize(value));
}

export function sha256(value) {
    const input = Buffer.isBuffer(value) ? value : Buffer.from(normalizeLf(value), 'utf8');
    return crypto.createHash('sha256').update(input).digest('hex');
}

export function identity(value) {
    return `sha256:${sha256(stableStringify(value))}`;
}

function nonEmptyString(value) {
    return typeof value === 'string' && value.trim().length > 0;
}

function positiveFinite(value) {
    return Number.isFinite(value) && value > 0;
}

function nonNegativeFinite(value) {
    return Number.isFinite(value) && value >= 0;
}

export function redactSensitiveText(value) {
    let text = String(value ?? '');
    for (const pattern of SECRET_VALUE_PATTERNS) text = text.replace(pattern, '[REDACTED]');
    return text.replace(/[^\x20-\x7E\r\n]/gu, '?');
}

export function sensitiveFindings(value, pointer = '$', findings = []) {
    if (Array.isArray(value)) {
        value.forEach((child, index) => sensitiveFindings(child, `${pointer}[${index}]`, findings));
        return findings;
    }
    if (value && typeof value === 'object') {
        for (const [key, child] of Object.entries(value)) {
            const childPointer = `${pointer}.${key}`;
            if (SENSITIVE_KEY_PATTERN.test(key) && child !== null && child !== undefined && String(child) !== '') {
                findings.push(childPointer);
            }
            sensitiveFindings(child, childPointer, findings);
        }
        return findings;
    }
    if (typeof value === 'string' && SECRET_VALUE_PATTERNS.some((pattern) => {
        pattern.lastIndex = 0;
        return pattern.test(value);
    })) {
        findings.push(pointer);
    }
    return findings;
}

export function assertNoSensitiveEvidence(value) {
    const findings = sensitiveFindings(value);
    if (findings.length > 0) fail('SENSITIVE_EVIDENCE_FORBIDDEN', findings.join(','));
    return true;
}

export function validateRecoveryEnvelope(envelope) {
    const errors = [];
    if (!envelope || typeof envelope !== 'object' || Array.isArray(envelope)) {
        return ['ENVELOPE_NOT_OBJECT'];
    }
    if (envelope.schema_version !== RECOVERY_SCHEMA_VERSION) errors.push('SCHEMA_VERSION_INVALID');
    if (!nonEmptyString(envelope.candidate_identity)) errors.push('CANDIDATE_IDENTITY_MISSING');
    if (!COMMIT_PATTERN.test(String(envelope.commit_sha ?? ''))) errors.push('COMMIT_SHA_INVALID');
    if (!nonEmptyString(envelope.environment_identity)) errors.push('ENVIRONMENT_IDENTITY_MISSING');
    if (!Array.isArray(envelope.migration_set) || envelope.migration_set.length === 0) errors.push('MIGRATION_SET_MISSING');
    if (!SHA256_IDENTITY_PATTERN.test(String(envelope.migration_manifest_digest ?? ''))) errors.push('MIGRATION_MANIFEST_DIGEST_INVALID');
    if (!nonEmptyString(envelope.expected_baseline)) errors.push('EXPECTED_BASELINE_MISSING');
    if (!nonEmptyString(envelope.observed_baseline)) errors.push('OBSERVED_BASELINE_MISSING');
    if (!RECOVERY_MODE_SET.has(envelope.rollback_mode)) errors.push('ROLLBACK_MODE_UNRESOLVED');
    const recoveryPoint = envelope.recovery_point;
    if (!recoveryPoint || typeof recoveryPoint !== 'object' || Array.isArray(recoveryPoint)) {
        errors.push('RECOVERY_POINT_MISSING');
    } else {
        if (!nonEmptyString(recoveryPoint.type)) errors.push('RECOVERY_POINT_TYPE_MISSING');
        if (!SHA256_IDENTITY_PATTERN.test(String(recoveryPoint.identity ?? ''))) errors.push('RECOVERY_POINT_IDENTITY_INVALID');
        if (!ISO_PATTERN.test(String(recoveryPoint.timestamp_utc ?? ''))) errors.push('RECOVERY_POINT_TIMESTAMP_INVALID');
        if (recoveryPoint.available !== true) errors.push('RECOVERY_POINT_NOT_VERIFIED');
    }
    if (!nonEmptyString(envelope.point_of_no_return)) errors.push('POINT_OF_NO_RETURN_UNRESOLVED');
    if (!envelope.rpo_target || !nonEmptyString(envelope.rpo_target.unit) || !nonNegativeFinite(envelope.rpo_target.maximum)) {
        errors.push('RPO_TARGET_UNRESOLVED');
    }
    if (!envelope.rto_target || envelope.rto_target.unit !== 'milliseconds' || !positiveFinite(envelope.rto_target.maximum)) {
        errors.push('RTO_TARGET_UNRESOLVED');
    }
    for (const field of [
        'owner',
        'approver',
        'pre_ponr_strategy',
        'post_ponr_strategy',
        'data_reconciliation',
        'security_validation',
        'consumer_validation',
        'evidence_bundle',
    ]) {
        if (!nonEmptyString(envelope[field])) errors.push(`${field.toUpperCase()}_MISSING`);
    }
    try {
        assertNoSensitiveEvidence(envelope);
    } catch {
        errors.push('SENSITIVE_EVIDENCE_FORBIDDEN');
    }
    return [...new Set(errors)];
}

export function computeOutcome({
    precheckPass,
    rollbackPass,
    restorePass,
    postHarnessPass,
    postDriftPass,
    dataReconciliationPass,
    securityPass,
    consumerPass,
    rpoActual,
    rpoTarget,
    rtoActualMs,
    rtoTargetMs,
} = {}) {
    if (!precheckPass) return 'FAIL_PRECHECK';
    if (!rollbackPass || !restorePass) return 'FAIL_ROLLBACK';
    if (!postHarnessPass || !postDriftPass || !dataReconciliationPass || !securityPass || !consumerPass) {
        return 'FAIL_POSTCHECK';
    }
    if (!nonNegativeFinite(rpoActual) || !nonNegativeFinite(rpoTarget) || rpoActual > rpoTarget) return 'FAIL_RPO';
    if (!nonNegativeFinite(rtoActualMs) || !positiveFinite(rtoTargetMs) || rtoActualMs > rtoTargetMs) return 'FAIL_RTO';
    return 'PASS_ROLLBACK_VERIFIED';
}

export function parseProjectId(source) {
    const match = /^\s*project_id\s*=\s*["']([^"']+)["']\s*$/mu.exec(String(source ?? ''));
    if (!match || !match[1].trim()) fail('LOCAL_PROJECT_ID_MISSING');
    return match[1].trim();
}

export function parseCliArgs(args) {
    const input = [...(args ?? [])].map(String);
    const mode = input.shift() ?? '';
    if (!['validate', 'local'].includes(mode)) fail('MODE_INVALID', mode || 'EMPTY');
    const options = {
        mode,
        rpoTargetLossUnits: null,
        rtoTargetMs: null,
    };
    for (const token of input) {
        if (/^--(?:linked|db-url|project-ref)(?:=|$)/u.test(token)) fail('REMOTE_TARGET_FLAG_FORBIDDEN', token);
        if (token.startsWith('--rpo-target-loss-units=')) {
            options.rpoTargetLossUnits = Number(token.slice('--rpo-target-loss-units='.length));
            continue;
        }
        if (token.startsWith('--rto-target-ms=')) {
            options.rtoTargetMs = Number(token.slice('--rto-target-ms='.length));
            continue;
        }
        fail('ARGUMENT_UNSUPPORTED', token);
    }
    if (mode === 'local') {
        if (!nonNegativeFinite(options.rpoTargetLossUnits)) fail('RPO_TARGET_UNRESOLVED');
        if (!positiveFinite(options.rtoTargetMs)) fail('RTO_TARGET_UNRESOLVED');
    }
    return options;
}

function run(command, args, {
    cwd = process.cwd(),
    allowFailure = false,
    input = undefined,
    env = process.env,
} = {}) {
    const result = spawnSync(command, args, {
        cwd,
        encoding: 'utf8',
        windowsHide: true,
        env,
        input,
        maxBuffer: PROCESS_OUTPUT_MAX_BYTES,
        stdio: ['pipe', 'pipe', 'pipe'],
    });
    if (result.error) {
        if (allowFailure) return { status: 1, stdout: '', stderr: result.error.message };
        fail('PROCESS_START_FAILED', path.basename(command));
    }
    const status = Number.isInteger(result.status) ? result.status : 1;
    const output = {
        status,
        stdout: String(result.stdout ?? '').trimEnd(),
        stderr: String(result.stderr ?? '').trimEnd(),
    };
    if (status !== 0 && !allowFailure) {
        fail('PROCESS_FAILED', `${path.basename(command)}:exit=${status}:${redactSensitiveText(output.stderr || output.stdout).slice(-1200)}`);
    }
    return output;
}

export function resolveNpmInvocation({
    platform = process.platform,
    execPath = process.execPath,
    npmExecPath = process.env.npm_execpath,
    comspec = process.env.ComSpec || process.env.COMSPEC,
} = {}) {
    if (npmExecPath) return { command: execPath, prefixArgs: [npmExecPath] };
    if (platform === 'win32') {
        if (!comspec) fail('COMSPEC_MISSING_FOR_NPM');
        return { command: comspec, prefixArgs: ['/d', '/s', '/c', 'npm.cmd'] };
    }
    return { command: 'npm', prefixArgs: [] };
}

function npm(root, args, options = {}) {
    const invocation = resolveNpmInvocation();
    return run(invocation.command, [...invocation.prefixArgs, ...args], { cwd: root, ...options });
}

export function validatePackageScripts(packageJson) {
    const scripts = packageJson?.scripts ?? {};
    const expected = {
        'supabase:recovery:test': 'node --test scripts/supabase/recovery-drill.test.mjs',
        'supabase:recovery:validate': 'node scripts/supabase/recovery-drill.mjs validate',
        'supabase:recovery:local': 'node scripts/supabase/recovery-drill.mjs local --rpo-target-loss-units=0 --rto-target-ms=900000',
    };
    const errors = [];
    for (const [name, command] of Object.entries(expected)) {
        if (scripts[name] !== command) errors.push(`PACKAGE_SCRIPT_MISMATCH:${name}`);
    }
    return errors;
}

function listMigrationSet(root) {
    const directory = path.join(root, 'supabase', 'migrations');
    const files = fs.readdirSync(directory, { withFileTypes: true })
        .filter((entry) => entry.isFile() && entry.name.endsWith('.sql'))
        .map((entry) => entry.name)
        .sort((left, right) => left.localeCompare(right, 'en'));
    if (files.length === 0) fail('MIGRATION_SET_MISSING');
    return files;
}

function resolveLocalContainer(root, projectId) {
    const result = run('docker', ['ps', '--format', '{{.Names}}'], { cwd: root });
    const names = result.stdout.split(/\r?\n/u).map((entry) => entry.trim()).filter(Boolean);
    const exact = `supabase_db_${projectId}`;
    if (names.includes(exact)) return exact;
    const normalizedProject = projectId.replace(/[^A-Za-z0-9_-]/gu, '_');
    const candidates = names.filter((name) => name.startsWith('supabase_db_') && name.includes(normalizedProject));
    if (candidates.length !== 1) fail('LOCAL_SUPABASE_DB_CONTAINER_UNRESOLVED', `candidates=${candidates.length}`);
    return candidates[0];
}

function psql(root, container, sql, { allowFailure = false } = {}) {
    return run('docker', [
        'exec', '-i', container,
        'psql', '-X', '-A', '-t', '-v', 'ON_ERROR_STOP=1', '-U', 'postgres', '-d', 'postgres', '-c', sql,
    ], { cwd: root, allowFailure });
}

function restoreSql(root, container, sql) {
    return run('docker', [
        'exec', '-i', container,
        'psql', '-X', '-v', 'ON_ERROR_STOP=1', '-U', 'postgres', '-d', 'postgres',
    ], { cwd: root, input: sql });
}

function dumpFixture(root, container) {
    return run('docker', [
        'exec', container,
        'pg_dump', '--no-owner', '--no-privileges', '--format=p', '--encoding=UTF8',
        '--schema', LOCAL_FIXTURE_SCHEMA, '-U', 'postgres', '-d', 'postgres',
    ], { cwd: root });
}

export function fixtureSeedSql() {
    return `
DROP SCHEMA IF EXISTS ${LOCAL_FIXTURE_SCHEMA} CASCADE;
CREATE SCHEMA ${LOCAL_FIXTURE_SCHEMA};
CREATE TABLE ${LOCAL_FIXTURE_SCHEMA}.recovery_fixture (
  id bigint PRIMARY KEY,
  payload text NOT NULL
);
INSERT INTO ${LOCAL_FIXTURE_SCHEMA}.recovery_fixture (id, payload) VALUES
  (1, 'VENTO_RECOVERY_ALPHA'),
  (2, 'VENTO_RECOVERY_BETA'),
  (3, 'VENTO_RECOVERY_GAMMA');
`;
}

function fixtureRows(root, container) {
    const result = psql(
        root,
        container,
        `SELECT id::text || ':' || payload FROM ${LOCAL_FIXTURE_SCHEMA}.recovery_fixture ORDER BY id;`,
    );
    return result.stdout.split(/\r?\n/u).map((entry) => entry.trim()).filter(Boolean);
}

export function rowSetDigest(rows) {
    return identity([...(rows ?? [])]);
}

function fixtureExists(root, container) {
    const result = psql(
        root,
        container,
        `SELECT to_regclass('${LOCAL_FIXTURE_SCHEMA}.recovery_fixture') IS NOT NULL;`,
    );
    return result.stdout.trim() === 't';
}

function prePonrRollback(root, container, expectedDigest) {
    psql(root, container, `BEGIN; UPDATE ${LOCAL_FIXTURE_SCHEMA}.recovery_fixture SET payload = payload || '_TEMP'; ROLLBACK;`);
    return rowSetDigest(fixtureRows(root, container)) === expectedDigest;
}

function ensureFixtureCleanup(root, container) {
    psql(root, container, `DROP SCHEMA IF EXISTS ${LOCAL_FIXTURE_SCHEMA} CASCADE;`, { allowFailure: true });
}

async function loadAuthDb028(root) {
    const modulePath = path.join(root, 'scripts', 'supabase', 'environment-drift.mjs');
    const drift = await import(pathToFileURL(modulePath).href);
    if (typeof drift.buildExpectedBaseline !== 'function' || typeof drift.observeLocalDatabase !== 'function') {
        fail('AUTH_DB_028_EXPORTS_MISSING');
    }
    return drift;
}

function utcNow() {
    return new Date().toISOString();
}

function runId(candidate) {
    return `${utcNow().replace(/[-:.TZ]/gu, '')}-${candidate.commit_sha.slice(0, 12)}-${crypto.randomBytes(4).toString('hex')}`;
}

export function writeAppendOnlyJson(filePath, value) {
    if (fs.existsSync(filePath)) fail('EVIDENCE_APPEND_ONLY_VIOLATION', filePath);
    fs.mkdirSync(path.dirname(filePath), { recursive: true });
    fs.writeFileSync(filePath, `${JSON.stringify(value, null, 2)}\n`, { encoding: 'utf8', flag: 'wx' });
    return filePath;
}

function validateStaticPrerequisites(root) {
    const requiredFiles = [
        'supabase/config.toml',
        'supabase/MIGRATION_MANIFEST.md',
        'scripts/quality/supabase-db-harness.mjs',
        'scripts/supabase/environment-drift.mjs',
        'scripts/supabase/migration-manifest.mjs',
    ];
    const missing = requiredFiles.filter((relative) => !fs.existsSync(path.join(root, ...relative.split('/'))));
    if (missing.length > 0) fail('REQUIRED_FILE_MISSING', missing.join(','));
    const packageJson = JSON.parse(fs.readFileSync(path.join(root, 'package.json'), 'utf8'));
    const scriptErrors = validatePackageScripts(packageJson);
    if (scriptErrors.length > 0) fail('PACKAGE_SCRIPT_VALIDATION_FAILED', scriptErrors.join(','));
    const config = fs.readFileSync(path.join(root, 'supabase', 'config.toml'), 'utf8');
    const projectId = parseProjectId(config);
    const migrations = listMigrationSet(root);
    const manifest = fs.readFileSync(path.join(root, 'supabase', 'MIGRATION_MANIFEST.md'));
    const dockerVersion = run('docker', ['--version'], { cwd: root });
    const supabaseVersion = npm(root, ['exec', '--', 'supabase', '--version']);
    return {
        projectId,
        migrations,
        manifestDigest: `sha256:${sha256(manifest)}`,
        dockerVersion: redactSensitiveText(dockerVersion.stdout || dockerVersion.stderr).trim(),
        supabaseVersion: redactSensitiveText(supabaseVersion.stdout || supabaseVersion.stderr).split(/\r?\n/u)[0].trim(),
    };
}

function buildEnvelope({ expected, observed, backupDigest, backupTimestamp, evidenceRelative, rpoTarget, rtoTargetMs }) {
    return {
        schema_version: RECOVERY_SCHEMA_VERSION,
        instance_id: RECOVERY_INSTANCE_ID,
        candidate_identity: `sha256:${expected.expected_digest}`,
        commit_sha: expected.candidate.commit_sha,
        environment_identity: observed.identity.technical_id,
        migration_set: expected.migration_manifest.rows.map((row) => row.filename),
        migration_manifest_digest: `sha256:${expected.migration_manifest.digest}`,
        expected_baseline: `sha256:${expected.expected_digest}`,
        observed_baseline: `sha256:${observed.observed_digest}`,
        rollback_mode: 'SELECTIVE_DATA_RESTORE',
        recovery_point: {
            type: 'LOCAL_LOGICAL_DUMP',
            identity: `sha256:${backupDigest}`,
            timestamp_utc: backupTimestamp,
            available: true,
            surfaces_included: [`schema:${LOCAL_FIXTURE_SCHEMA}`],
            surfaces_excluded: ['auth', 'storage_objects', 'edge_functions', 'secrets', 'hosted_configuration', 'external_consumers'],
        },
        point_of_no_return: `COMMITTED_DROP_SCHEMA:${LOCAL_FIXTURE_SCHEMA}`,
        rpo_target: {
            unit: 'synthetic_state_loss_units',
            maximum: rpoTarget,
            scope: 'AUTH-DB-029_GLOBAL_LOCAL_SELF_CERTIFICATION_ONLY',
        },
        rto_target: {
            unit: 'milliseconds',
            maximum: rtoTargetMs,
            scope: 'AUTH-DB-029_GLOBAL_LOCAL_SELF_CERTIFICATION_ONLY',
        },
        owner: 'VENTO_OWNER',
        approver: 'VENTO_OWNER',
        pre_ponr_strategy: 'TRANSACTION_ABORT',
        post_ponr_strategy: 'SELECTIVE_DATA_RESTORE',
        data_reconciliation: 'EXACT_SYNTHETIC_ROWSET_DIGEST',
        security_validation: 'AUTH-DB-027_POST_RECOVERY_HARNESS_PLUS_AUTH-DB-028_DRIFT',
        consumer_validation: 'LOCAL_FOUNDATION_NO_EXTERNAL_CONSUMER; AUTH-DB-027_HARNESS_IS_MINIMUM_OPERABILITY_CHECK',
        evidence_bundle: evidenceRelative,
    };
}

function printResult(fields) {
    console.log(RESULT_START);
    for (const [key, value] of Object.entries(fields)) console.log(`${key}: ${value}`);
    console.log(RESULT_END);
}

function runValidationMode(root) {
    const prerequisite = validateStaticPrerequisites(root);
    printResult({
        ESTADO: 'PASS',
        OPERACION: 'SUPABASE_RECOVERY_VALIDATE',
        INSTANCE_ID: RECOVERY_INSTANCE_ID,
        MIGRATIONS: prerequisite.migrations.length,
        MANIFEST_DIGEST: prerequisite.manifestDigest,
        DOCKER: prerequisite.dockerVersion,
        SUPABASE_CLI: prerequisite.supabaseVersion,
        REMOTE_TARGETS_USED: 'NO',
        ERROR: 'NONE',
    });
}

async function runLocalMode(root, options) {
    const prerequisite = validateStaticPrerequisites(root);
    const drift = await loadAuthDb028(root);
    const expected = drift.buildExpectedBaseline({ root });
    const candidate = expected.candidate;
    const id = runId(candidate);
    const runDirectory = path.join(root, ...EVIDENCE_ROOT.split('/'), id);
    const relativeRunDirectory = `${EVIDENCE_ROOT}/${id}`;
    const backupPath = path.join(runDirectory, 'backup.sql');
    const envelopePath = path.join(runDirectory, 'envelope.json');
    const evidencePath = path.join(runDirectory, 'evidence.json');
    fs.mkdirSync(runDirectory, { recursive: true });

    let container = null;
    let rollbackPass = false;
    let restorePass = false;
    let dataReconciliationPass = false;
    let postHarnessPass = false;
    let postDriftPass = false;
    let securityPass = false;
    let consumerPass = false;
    let rpoActual = Number.POSITIVE_INFINITY;
    let rtoActualMs = Number.POSITIVE_INFINITY;
    let envelope = null;
    let outcome = 'FAIL_PRECHECK';
    let baselineRows = [];
    let baselineDigest = '';
    let restoredDigest = '';
    let t0 = null;
    let t1 = null;
    let ponrReached = false;

    try {
        npm(root, ['run', 'supabase:migrations:manifest:check']);
        npm(root, ['run', 'supabase:db:test:clean']);
        npm(root, ['run', 'supabase:drift:local']);
        const observed = drift.observeLocalDatabase({ root, expected });

        container = resolveLocalContainer(root, prerequisite.projectId);
        ensureFixtureCleanup(root, container);
        psql(root, container, fixtureSeedSql());
        baselineRows = fixtureRows(root, container);
        baselineDigest = rowSetDigest(baselineRows);
        if (baselineRows.length !== 3) fail('FIXTURE_ROW_COUNT_INVALID', String(baselineRows.length));

        rollbackPass = prePonrRollback(root, container, baselineDigest);
        if (!rollbackPass) fail('PRE_PONR_ROLLBACK_FAILED');

        const dump = dumpFixture(root, container);
        const backupSql = normalizeLf(dump.stdout);
        if (!backupSql.includes(`CREATE SCHEMA ${LOCAL_FIXTURE_SCHEMA};`) && !backupSql.includes(`CREATE SCHEMA \"${LOCAL_FIXTURE_SCHEMA}\";`)) {
            fail('BACKUP_SCHEMA_NOT_FOUND');
        }
        fs.writeFileSync(backupPath, backupSql, { encoding: 'utf8', flag: 'wx' });
        const backupDigest = sha256(backupSql);
        const backupTimestamp = utcNow();

        envelope = buildEnvelope({
            expected,
            observed,
            backupDigest,
            backupTimestamp,
            evidenceRelative: `${relativeRunDirectory}/evidence.json`,
            rpoTarget: options.rpoTargetLossUnits,
            rtoTargetMs: options.rtoTargetMs,
        });
        const envelopeErrors = validateRecoveryEnvelope(envelope);
        if (envelopeErrors.length > 0) fail('RECOVERY_ENVELOPE_INVALID', envelopeErrors.join(','));
        writeAppendOnlyJson(envelopePath, envelope);

        t0 = utcNow();
        const t0Ms = Date.now();
        psql(root, container, `DROP SCHEMA ${LOCAL_FIXTURE_SCHEMA} CASCADE;`);
        ponrReached = true;
        if (fixtureExists(root, container)) fail('PONR_DESTRUCTION_NOT_OBSERVED');

        restoreSql(root, container, backupSql);
        restorePass = fixtureExists(root, container);
        if (!restorePass) fail('RESTORE_FAILED');
        const restoredRows = fixtureRows(root, container);
        restoredDigest = rowSetDigest(restoredRows);
        dataReconciliationPass = restoredDigest === baselineDigest;
        rpoActual = dataReconciliationPass ? 0 : Math.max(baselineRows.length, restoredRows.length, 1);

        ensureFixtureCleanup(root, container);
        const postHarness = npm(root, ['run', 'supabase:db:test'], { allowFailure: true });
        postHarnessPass = postHarness.status === 0;
        const postDrift = npm(root, ['run', 'supabase:drift:local'], { allowFailure: true });
        postDriftPass = postDrift.status === 0;
        securityPass = postHarnessPass && postDriftPass;
        consumerPass = postHarnessPass;

        t1 = utcNow();
        rtoActualMs = Date.now() - t0Ms;
        outcome = computeOutcome({
            precheckPass: true,
            rollbackPass,
            restorePass,
            postHarnessPass,
            postDriftPass,
            dataReconciliationPass,
            securityPass,
            consumerPass,
            rpoActual,
            rpoTarget: options.rpoTargetLossUnits,
            rtoActualMs,
            rtoTargetMs: options.rtoTargetMs,
        });

        const evidenceCore = {
            schema_version: RECOVERY_SCHEMA_VERSION,
            instance_id: RECOVERY_INSTANCE_ID,
            execution_id: id,
            timestamp_utc: utcNow(),
            candidate_identity: envelope.candidate_identity,
            environment_identity: envelope.environment_identity,
            commit_sha: expected.candidate.commit_sha,
            candidate_branch: expected.candidate.branch,
            candidate_clean: expected.candidate.clean,
            candidate_dirty_path_count: expected.candidate.dirty_path_count,
            expected_baseline_digest: envelope.expected_baseline,
            observed_baseline_digest: envelope.observed_baseline,
            migration_manifest_digest: prerequisite.manifestDigest,
            migration_count: prerequisite.migrations.length,
            recovery_envelope_identity: identity(envelope),
            recovery_point_identity: envelope.recovery_point.identity,
            recovery_point_type: envelope.recovery_point.type,
            backup_relative_path: `${relativeRunDirectory}/backup.sql`,
            backup_sha256: `sha256:${sha256(fs.readFileSync(backupPath))}`,
            pre_ponr_mode: 'TRANSACTION_ABORT',
            pre_ponr_rollback: rollbackPass ? 'PASS' : 'FAIL',
            ponr_reached: ponrReached,
            post_ponr_mode: 'SELECTIVE_DATA_RESTORE',
            restore: restorePass ? 'PASS' : 'FAIL',
            data_reconciliation: dataReconciliationPass ? 'PASS' : 'FAIL',
            baseline_rowset_digest: baselineDigest,
            restored_rowset_digest: restoredDigest,
            t0_utc: t0,
            t1_utc: t1,
            rpo_target: envelope.rpo_target,
            rpo_actual: { unit: 'synthetic_state_loss_units', value: rpoActual },
            rto_target: envelope.rto_target,
            rto_actual: { unit: 'milliseconds', value: rtoActualMs },
            post_recovery_harness: postHarnessPass ? 'PASS' : 'FAIL',
            post_recovery_drift: postDriftPass ? 'PASS' : 'FAIL',
            security_validation: securityPass ? 'PASS' : 'FAIL',
            essential_consumer_validation: consumerPass ? 'PASS' : 'FAIL',
            tools: {
                node: process.version,
                platform: `${process.platform}-${process.arch}`,
                docker: prerequisite.dockerVersion,
                supabase_cli: prerequisite.supabaseVersion,
            },
            remote_targets_used: 'NO',
            hosted_backup_or_pitr_exercised: 'NO',
            outcome,
        };
        assertNoSensitiveEvidence(evidenceCore);
        const evidence = {
            ...evidenceCore,
            evidence_bundle_digest: identity(evidenceCore),
        };
        writeAppendOnlyJson(evidencePath, evidence);

        if (!OUTCOME_SET.has(outcome) || !outcome.startsWith('PASS_')) {
            fail('RECOVERY_DRILL_FAILED', outcome);
        }

        printResult({
            ESTADO: 'PASS',
            OPERACION: 'SUPABASE_RECOVERY_DRILL',
            INSTANCE_ID: RECOVERY_INSTANCE_ID,
            MODE: 'LOCAL_SYNTHETIC',
            PRE_RECOVERY_HARNESS: 'PASS',
            BACKUP_CREATED: 'PASS',
            PRE_PONR_ROLLBACK: 'PASS',
            PONR_REACHED: 'YES',
            RESTORE_EXECUTED: 'PASS',
            RESTORED_DATA: dataReconciliationPass ? 'PASS' : 'FAIL',
            POST_RECOVERY_HARNESS: postHarnessPass ? 'PASS' : 'FAIL',
            POST_RECOVERY_DRIFT: postDriftPass ? 'PASS' : 'FAIL',
            RPO_TARGET: `${options.rpoTargetLossUnits} synthetic_state_loss_units`,
            RPO_ACTUAL: `${rpoActual} synthetic_state_loss_units`,
            RTO_TARGET_MS: options.rtoTargetMs,
            RTO_ACTUAL_MS: rtoActualMs,
            OUTCOME: outcome,
            EVIDENCE: `${relativeRunDirectory}/evidence.json`,
            REMOTE_TARGETS_USED: 'NO',
            ERROR: 'NONE',
        });
    } catch (error) {
        if (container) ensureFixtureCleanup(root, container);
        const message = redactSensitiveText(error instanceof Error ? error.message : String(error)).replace(/\s+/gu, ' ').trim();
        printResult({
            ESTADO: 'FAIL',
            OPERACION: 'SUPABASE_RECOVERY_DRILL',
            INSTANCE_ID: RECOVERY_INSTANCE_ID,
            MODE: 'LOCAL_SYNTHETIC',
            PRE_PONR_ROLLBACK: rollbackPass ? 'PASS' : 'NOT_VERIFIED',
            PONR_REACHED: ponrReached ? 'YES' : 'NO',
            RESTORE_EXECUTED: restorePass ? 'PASS' : 'NOT_VERIFIED',
            POST_RECOVERY_HARNESS: postHarnessPass ? 'PASS' : 'NOT_VERIFIED',
            POST_RECOVERY_DRIFT: postDriftPass ? 'PASS' : 'NOT_VERIFIED',
            OUTCOME: outcome,
            REMOTE_TARGETS_USED: 'NO',
            ERROR: message || 'UNKNOWN',
        });
        process.exitCode = Number.isInteger(error?.exitCode) ? error.exitCode : 1;
    }
}

async function main() {
    let options;
    try {
        options = parseCliArgs(process.argv.slice(2));
    } catch (error) {
        printResult({
            ESTADO: 'FAIL',
            OPERACION: 'SUPABASE_RECOVERY_DRILL',
            INSTANCE_ID: RECOVERY_INSTANCE_ID,
            ERROR: redactSensitiveText(error instanceof Error ? error.message : String(error)),
            REMOTE_TARGETS_USED: 'NO',
        });
        process.exitCode = 1;
        return;
    }
    const root = repoRootFromModule();
    if (options.mode === 'validate') runValidationMode(root);
    else await runLocalMode(root, options);
}

const isCli = process.argv[1]
    && path.resolve(process.argv[1]) === path.resolve(fileURLToPath(import.meta.url));

if (isCli) await main();