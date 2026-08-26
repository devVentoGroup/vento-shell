import assert from 'node:assert/strict';
import fs from 'node:fs';
import os from 'node:os';
import path from 'node:path';
import test from 'node:test';
import * as recovery from './recovery-drill.mjs';

function validEnvelope() {
    return {
        schema_version: 1,
        candidate_identity: `sha256:${'a'.repeat(64)}`,
        commit_sha: 'b'.repeat(40),
        environment_identity: 'local:vento-shell',
        migration_set: ['00000000000000_baseline.sql'],
        migration_manifest_digest: `sha256:${'c'.repeat(64)}`,
        expected_baseline: 'AUTH-DB-028:expected',
        observed_baseline: 'AUTH-DB-028:observed',
        rollback_mode: 'SELECTIVE_DATA_RESTORE',
        recovery_point: {
            type: 'LOCAL_LOGICAL_DUMP',
            identity: `sha256:${'d'.repeat(64)}`,
            timestamp_utc: '2026-08-26T18:00:00.000Z',
            available: true,
        },
        point_of_no_return: 'COMMITTED_DROP_SCHEMA:vento_recovery_drill',
        rpo_target: { unit: 'synthetic_state_loss_units', maximum: 0 },
        rto_target: { unit: 'milliseconds', maximum: 900000 },
        owner: 'VENTO_OWNER',
        approver: 'VENTO_OWNER',
        pre_ponr_strategy: 'TRANSACTION_ABORT',
        post_ponr_strategy: 'SELECTIVE_DATA_RESTORE',
        data_reconciliation: 'EXACT_SYNTHETIC_ROWSET_DIGEST',
        security_validation: 'AUTH-DB-027+AUTH-DB-028',
        consumer_validation: 'LOCAL_FOUNDATION',
        evidence_bundle: '.delivery/supabase-recovery/example/evidence.json',
    };
}

test('stableStringify sorts object keys', () => {
    assert.equal(recovery.stableStringify({ b: 1, a: 2 }), '{"a":2,"b":1}');
});

test('sha256 canonicalizes CRLF to LF', () => {
    assert.equal(recovery.sha256('a\r\nb'), recovery.sha256('a\nb'));
});

test('identity uses sha256 prefix', () => {
    assert.match(recovery.identity({ a: 1 }), /^sha256:[a-f0-9]{64}$/u);
});

test('valid recovery envelope passes', () => {
    assert.deepEqual(recovery.validateRecoveryEnvelope(validEnvelope()), []);
});

test('missing candidate is rejected', () => {
    const envelope = validEnvelope();
    envelope.candidate_identity = '';
    assert.ok(recovery.validateRecoveryEnvelope(envelope).includes('CANDIDATE_IDENTITY_MISSING'));
});

test('invalid commit is rejected', () => {
    const envelope = validEnvelope();
    envelope.commit_sha = 'abc';
    assert.ok(recovery.validateRecoveryEnvelope(envelope).includes('COMMIT_SHA_INVALID'));
});

test('empty migration set is rejected', () => {
    const envelope = validEnvelope();
    envelope.migration_set = [];
    assert.ok(recovery.validateRecoveryEnvelope(envelope).includes('MIGRATION_SET_MISSING'));
});

test('unknown rollback mode is rejected', () => {
    const envelope = validEnvelope();
    envelope.rollback_mode = 'ROLLBACK_EVERYTHING';
    assert.ok(recovery.validateRecoveryEnvelope(envelope).includes('ROLLBACK_MODE_UNRESOLVED'));
});

test('unverified recovery point is rejected', () => {
    const envelope = validEnvelope();
    envelope.recovery_point.available = false;
    assert.ok(recovery.validateRecoveryEnvelope(envelope).includes('RECOVERY_POINT_NOT_VERIFIED'));
});

test('ambiguous recovery point identity is rejected', () => {
    const envelope = validEnvelope();
    envelope.recovery_point.identity = 'latest-backup';
    assert.ok(recovery.validateRecoveryEnvelope(envelope).includes('RECOVERY_POINT_IDENTITY_INVALID'));
});

test('missing PONR is rejected', () => {
    const envelope = validEnvelope();
    envelope.point_of_no_return = '';
    assert.ok(recovery.validateRecoveryEnvelope(envelope).includes('POINT_OF_NO_RETURN_UNRESOLVED'));
});

test('missing RPO target is rejected', () => {
    const envelope = validEnvelope();
    envelope.rpo_target = null;
    assert.ok(recovery.validateRecoveryEnvelope(envelope).includes('RPO_TARGET_UNRESOLVED'));
});

test('missing RTO target is rejected', () => {
    const envelope = validEnvelope();
    envelope.rto_target = null;
    assert.ok(recovery.validateRecoveryEnvelope(envelope).includes('RTO_TARGET_UNRESOLVED'));
});

test('sensitive evidence key is rejected', () => {
    const envelope = validEnvelope();
    envelope.db_password = 'forbidden';
    assert.ok(recovery.validateRecoveryEnvelope(envelope).includes('SENSITIVE_EVIDENCE_FORBIDDEN'));
});

test('sensitive URL value is redacted', () => {
    assert.equal(recovery.redactSensitiveText('postgresql://user:pass@example/db'), '[REDACTED]');
});

test('local args require explicit RPO and RTO targets', () => {
    assert.throws(() => recovery.parseCliArgs(['local']), /RPO_TARGET_UNRESOLVED/u);
});

test('remote target flags are forbidden', () => {
    assert.throws(
        () => recovery.parseCliArgs(['local', '--rpo-target-loss-units=0', '--rto-target-ms=1', '--linked']),
        /REMOTE_TARGET_FLAG_FORBIDDEN/u,
    );
});

test('valid local args parse exact targets', () => {
    assert.deepEqual(
        recovery.parseCliArgs(['local', '--rpo-target-loss-units=0', '--rto-target-ms=900000']),
        { mode: 'local', rpoTargetLossUnits: 0, rtoTargetMs: 900000 },
    );
});

test('validate mode does not require recovery targets', () => {
    assert.deepEqual(
        recovery.parseCliArgs(['validate']),
        { mode: 'validate', rpoTargetLossUnits: null, rtoTargetMs: null },
    );
});

test('PASS outcome requires rollback restore postchecks and targets', () => {
    const outcome = recovery.computeOutcome({
        precheckPass: true,
        rollbackPass: true,
        restorePass: true,
        postHarnessPass: true,
        postDriftPass: true,
        dataReconciliationPass: true,
        securityPass: true,
        consumerPass: true,
        rpoActual: 0,
        rpoTarget: 0,
        rtoActualMs: 100,
        rtoTargetMs: 1000,
    });
    assert.equal(outcome, 'PASS_ROLLBACK_VERIFIED');
});

test('RPO excess produces FAIL_RPO', () => {
    assert.equal(recovery.computeOutcome({
        precheckPass: true,
        rollbackPass: true,
        restorePass: true,
        postHarnessPass: true,
        postDriftPass: true,
        dataReconciliationPass: true,
        securityPass: true,
        consumerPass: true,
        rpoActual: 1,
        rpoTarget: 0,
        rtoActualMs: 10,
        rtoTargetMs: 100,
    }), 'FAIL_RPO');
});

test('RTO excess produces FAIL_RTO', () => {
    assert.equal(recovery.computeOutcome({
        precheckPass: true,
        rollbackPass: true,
        restorePass: true,
        postHarnessPass: true,
        postDriftPass: true,
        dataReconciliationPass: true,
        securityPass: true,
        consumerPass: true,
        rpoActual: 0,
        rpoTarget: 0,
        rtoActualMs: 101,
        rtoTargetMs: 100,
    }), 'FAIL_RTO');
});

test('postcheck failure produces FAIL_POSTCHECK', () => {
    assert.equal(recovery.computeOutcome({
        precheckPass: true,
        rollbackPass: true,
        restorePass: true,
        postHarnessPass: false,
        postDriftPass: true,
        dataReconciliationPass: true,
        securityPass: false,
        consumerPass: false,
        rpoActual: 0,
        rpoTarget: 0,
        rtoActualMs: 10,
        rtoTargetMs: 100,
    }), 'FAIL_POSTCHECK');
});

test('fixture SQL is scoped to the dedicated synthetic schema', () => {
    const sql = recovery.fixtureSeedSql();
    assert.match(sql, /vento_recovery_drill\.recovery_fixture/u);
    assert.doesNotMatch(sql, /auth\.users|storage\.objects/u);
});

test('rowSetDigest is order-sensitive and deterministic', () => {
    assert.equal(recovery.rowSetDigest(['1:a', '2:b']), recovery.rowSetDigest(['1:a', '2:b']));
    assert.notEqual(recovery.rowSetDigest(['1:a', '2:b']), recovery.rowSetDigest(['2:b', '1:a']));
});

test('parseProjectId reads quoted TOML project id', () => {
    assert.equal(recovery.parseProjectId('project_id = "vento-shell"\n'), 'vento-shell');
});

test('package scripts must use the stable recovery entry points', () => {
    assert.deepEqual(recovery.validatePackageScripts({
        scripts: {
            'supabase:recovery:test': 'node --test scripts/supabase/recovery-drill.test.mjs',
            'supabase:recovery:validate': 'node scripts/supabase/recovery-drill.mjs validate',
            'supabase:recovery:local': 'node scripts/supabase/recovery-drill.mjs local --rpo-target-loss-units=0 --rto-target-ms=900000',
        }
    }), []);
});

test('append-only evidence writer refuses overwrite', () => {
    const root = fs.mkdtempSync(path.join(os.tmpdir(), 'vento-recovery-test-'));
    const target = path.join(root, 'evidence.json');
    recovery.writeAppendOnlyJson(target, { ok: true });
    assert.throws(() => recovery.writeAppendOnlyJson(target, { ok: false }), /EVIDENCE_APPEND_ONLY_VIOLATION/u);
});
