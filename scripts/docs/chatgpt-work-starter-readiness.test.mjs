import assert from 'node:assert/strict';
import test from 'node:test';

import {
  injectReadinessIntoSources,
  renderReadinessStarterBlock,
  stableReadinessStarterProjection,
} from './chatgpt-work-starter-readiness.mjs';

function readiness(ready = true) {
  const queue = ready ? [{
    package_id: 'NEXO-PACKAGE-001',
    capability_id: 'NEXO_PACKAGE',
    owner_application: 'nexo',
    gate_id: 'E5-GATE-008::NEXO-PACKAGE-001',
    next_execution: 'SHELL-CI-020::NEXO-PACKAGE-001',
  }] : [];
  return {
    block: '=== PACKAGE READINESS SCAN ===\nIMPLEMENTATION READY:\n- NEXO-PACKAGE-001\n=== END PACKAGE READINESS ===',
    registry: { implementation_ready_queue: queue, packages: [] },
  };
}

const baseResult = {
  control: {
    primaryAction: { type: 'DOCUMENTAR_TAREA', target: 'DOC-001' },
    physical: { active: null },
  },
  source: 'BASE SELECTOR\n',
  documentationSource: 'INTENT_LOCK: DOCUMENTATION\nCONVERSATION_LANE: DOCUMENTARY\nDO_NOT_SWITCH_LANES: TRUE\nBASE DOCUMENTATION\n',
  implementationSource: 'INTENT_LOCK: PHYSICAL_IMPLEMENTATION\nCONVERSATION_LANE: PHYSICAL\nDO_NOT_SWITCH_LANES: TRUE\nNO EXISTE UNA INSTANCIA FÍSICA ACTIVA.\n',
};

const coordinated = {
  readinessCandidate: {
    packageId: 'NEXO-PACKAGE-001',
    instanceId: 'SHELL-CI-020::NEXO-PACKAGE-001',
  },
};

test('el mismo snapshot de readiness se inyecta en selector y ambos iniciadores', () => {
  const result = injectReadinessIntoSources({
    baseResult,
    readiness: readiness(),
    coordinated,
  });
  assert.match(result.documentationSource, /^INTENT_LOCK: DOCUMENTATION/u);
  assert.match(result.implementationSource, /^INTENT_LOCK: PHYSICAL_IMPLEMENTATION/u);
  assert.ok(result.documentationSource.indexOf('PACKAGE READINESS SCANNER') > result.documentationSource.indexOf('DO_NOT_SWITCH_LANES: TRUE'));
  assert.ok(result.implementationSource.indexOf('PACKAGE READINESS SCANNER') > result.implementationSource.indexOf('DO_NOT_SWITCH_LANES: TRUE'));
  for (const source of [result.source, result.documentationSource, result.implementationSource]) {
    assert.match(source, /PACKAGE READINESS SCANNER — OBLIGATORIO/u);
    assert.match(source, /NEXO-PACKAGE-001/u);
    assert.match(source, /E5-GATE-008::NEXO-PACKAGE-001/u);
    assert.match(source, /UNKNOWN/u);
  }
});

test('el iniciador documental avisa package listo sin cambiar de carril', () => {
  const block = renderReadinessStarterBlock({ readiness: readiness(), lane: 'DOCUMENTATION', coordinated });
  assert.match(block, /conservar esta conversación en DOCUMENTATION/u);
  assert.match(block, /NO cambiar de carril/u);
  assert.match(block, /PACKAGE IMPLEMENTABLE DETECTED/u);
  assert.match(block, /Physical authorization required: TRUE/u);
});

test('el iniciador físico distingue package listo de instancia AUTHORIZED', () => {
  const block = renderReadinessStarterBlock({ readiness: readiness(), lane: 'PHYSICAL_IMPLEMENTATION', coordinated });
  assert.match(block, /IMPLEMENTATION_READY solo crea un candidato para autorización/u);
  assert.match(block, /No equivale a AUTHORIZED/u);
  assert.match(block, /Status: READY_FOR_AUTHORIZATION/u);
  assert.match(block, /No implementation instance is authorized/u);
});

test('cola vacía no inventa candidato implementable', () => {
  const block = renderReadinessStarterBlock({ readiness: readiness(false), lane: 'SELECTOR', coordinated: null });
  assert.match(block, /IMPLEMENTATION_READY_QUEUE:\n- NONE/u);
  assert.doesNotMatch(block, /PACKAGE IMPLEMENTABLE DETECTED/u);
});

test('la proyección del starter es determinista entre triggers operacionales', () => {
  const chatgpt = '=== PACKAGE READINESS SCAN ===\n\nTRIGGER: chatgpt-starter\nCAPABILITIES DETECTED: 2\n\n=== END PACKAGE READINESS ===';
  const localSync = '=== PACKAGE READINESS SCAN ===\n\nTRIGGER: local-derived-sync\nCAPABILITIES DETECTED: 2\n\n=== END PACKAGE READINESS ===';
  const expected = stableReadinessStarterProjection(chatgpt);
  assert.equal(expected, stableReadinessStarterProjection(localSync));
  assert.match(expected, /TRIGGER: STARTER_PROJECTION/u);
  assert.doesNotMatch(expected, /chatgpt-starter|local-derived-sync/u);
});
