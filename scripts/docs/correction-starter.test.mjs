import assert from 'node:assert/strict';
import fs from 'node:fs';
import test from 'node:test';

import { buildCorrectionStarter } from './correction-starter.mjs';

test('iniciador de correcciones conserva un carril exclusivo', () => {
    const source = buildCorrectionStarter();
    assert.match(source, /^VENTO OS — INICIADOR CANÓNICO DE CORRECCIONES/u);
    assert.match(source, /INTENT_LOCK: CORRECTION/u);
    assert.match(source, /CONVERSATION_LANE: CORRECTION/u);
    assert.match(source, /DO_NOT_SWITCH_LANES: TRUE/u);
    assert.match(source, /VENTO_CANONICAL_CORRECTION_LIFECYCLE_V1|CORRECCIÓN/u);
});

test('iniciador documenta forward migrations y VERIFIED_ON_MAIN', () => {
    const source = fs.readFileSync('scripts/docs/correction-starter.mjs', 'utf8');
    assert.match(source, /forward migration/u);
    assert.match(source, /VERIFIED_ON_MAIN/u);
    assert.match(source, /STALE_TARGET/u);
    assert.match(source, /docs:correction:start/u);
    assert.match(source, /docs:correction:finish/u);
});

test('check tolera ausencia de la proyección no versionada en CI', () => {
    const source = fs.readFileSync('scripts/docs/correction-starter.mjs', 'utf8');
    assert.match(source, /check && changed && fs\.existsSync\(outputPath\)/u);
});
