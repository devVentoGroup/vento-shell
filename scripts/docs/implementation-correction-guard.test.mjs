import assert from 'node:assert/strict';
import fs from 'node:fs';
import test from 'node:test';

import {
    assertImplementationTargetsNotBlocked,
    implementationCorrectionTargets,
} from './implementation-correction-guard.mjs';

test('guard evalúa tanto instance_id como task_id', () => {
    assert.deepEqual(
        implementationCorrectionTargets({ instance_id: 'AUTH-DB-035::GLOBAL', task_id: 'AUTH-DB-035' }),
        ['AUTH-DB-035::GLOBAL', 'AUTH-DB-035'],
    );
});

test('guard bloquea únicamente cuando CORR declara la instancia o la tarea', () => {
    const corrections = {
        records: [{
            record: {
                correction_id: 'AUTH-DB-033::CORR-001',
                status: 'PENDING_AUTHORIZATION',
                blocking: true,
                blocked_targets: ['AUTH-DB-035::GLOBAL'],
            }
        }],
    };
    assert.throws(
        () => assertImplementationTargetsNotBlocked(corrections, {
            instance_id: 'AUTH-DB-035::GLOBAL',
            task_id: 'AUTH-DB-035',
        }),
        /AUTH-DB-033::CORR-001/u,
    );
    assert.equal(
        assertImplementationTargetsNotBlocked(corrections, {
            instance_id: 'AUTH-DB-034::GLOBAL',
            task_id: 'AUTH-DB-034',
        }),
        true,
    );
});

test('package.json enruta docs:implementation:start por el guard de correcciones', () => {
    const manifest = JSON.parse(fs.readFileSync('package.json', 'utf8'));
    assert.equal(
        manifest.scripts['docs:implementation:start'],
        'node scripts/docs/implementation-correction-guard.mjs start',
    );
});