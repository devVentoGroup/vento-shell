import assert from 'node:assert/strict';
import fs from 'node:fs';
import test from 'node:test';

import {
    assertImplementationPackageReadiness,
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

test('SHELL-CI-020 no puede iniciar mientras CURRENT_EXECUTABLE_WORK sea una fundación', () => {
    const instance = { instance_id: 'SHELL-CI-020::GAP-PKG-001', task_id: 'SHELL-CI-020' };
    const blocked = { registry: { package_execution: {
        current_work: { kind: 'FOUNDATION_GATE', id: 'MRP015-000' },
        current: { package_id: 'GAP-PKG-001', current_work: { kind: 'FOUNDATION_GATE', id: 'MRP015-000' }, next_action: { type: 'WAIT_FOR_FOUNDATION_PREREQUISITE', target: 'MRP015-000' } },
    } } };

    assert.throws(
        () => assertImplementationPackageReadiness({ instance, readiness: blocked }),
        /CURRENT_EXECUTABLE_WORK=MRP015-000/u,
    );

    const ready = { registry: { package_execution: {
        current: { package_id: 'GAP-PKG-001', next_action: { type: 'AUTHORIZE_PHYSICAL_IMPLEMENTATION', target: 'SHELL-CI-020::GAP-PKG-001' } },
    } } };
    assert.equal(assertImplementationPackageReadiness({ instance, readiness: ready }), true);
});
