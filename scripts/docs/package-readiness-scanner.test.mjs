import assert from 'node:assert/strict';
import fs from 'node:fs';
import test from 'node:test';

import {
  evaluateCapability,
  scanPackageReadiness,
} from './package-readiness-scanner.mjs';

const contract = JSON.parse(fs.readFileSync(
  new URL('./package-readiness/package-readiness-contract.json', import.meta.url),
  'utf8',
));

function approvedTask(id, title = id) {
  return {
    id,
    title,
    marker: '✅',
    state: 'APROBADA',
    relativePath: `fixtures/${id}.md`,
    block: `### ✅ ${id} — ${title}\n\n**Estado:** APROBADA\n`,
  };
}

function pendingTask(id, title = id) {
  return {
    id,
    title,
    marker: '[ ]',
    state: 'NO_INICIADA',
    relativePath: `fixtures/${id}.md`,
    block: `### [ ] ${id} — ${title}\n\n**Estado:** NO INICIADA\n`,
  };
}

function inventory({ capabilityApproved = true, templatesApproved = true, gateApproved = true } = {}) {
  const rows = [capabilityApproved ? approvedTask('TEST-CAP-001') : pendingTask('TEST-CAP-001')];
  for (let number = 1; number <= 25; number += 1) {
    const id = `DELIV-PKG-${String(number).padStart(3, '0')}`;
    rows.push(templatesApproved ? approvedTask(id) : pendingTask(id));
  }
  rows.push(gateApproved ? approvedTask('E5-GATE-008') : pendingTask('E5-GATE-008'));
  return new Map(rows.map((row) => [row.id, row]));
}

function completeCapability(overrides = {}) {
  const contributors = {};
  for (const condition of contract.capability_conditions) {
    contributors[condition.group] = [{ task_refs: ['TEST-CAP-001'] }];
  }
  return {
    objective: 'Capacidad de prueba trazable',
    owner_application: 'nexo',
    package_slug: 'TEST-CAPABILITY',
    contributors,
    not_applicable: [],
    ...overrides,
  };
}

function capabilityIndex(capability = completeCapability()) {
  return {
    schema_version: 1,
    index_id: 'TEST-CAPABILITY-INDEX',
    discovery_mode: 'EXPLICIT_CANONICAL_MAPPINGS_ONLY',
    capabilities: {
      TEST_CAPABILITY: capability,
    },
  };
}

function emptyRegistry() {
  return {
    schema_version: 1,
    registry_id: 'TEST-REGISTRY',
    packages: [],
    status_scope: 'DOCUMENTARY_READINESS',
    physical_status_projection: '.delivery/package-readiness-scan.json',
  };
}

function verifiedPhysicalDependencies() {
  const rows = new Map();
  for (let number = 1; number <= 19; number += 1) {
    const taskId = `SHELL-CI-${String(number).padStart(3, '0')}`;
    const instanceId = `${taskId}::GLOBAL`;
    rows.set(instanceId, { instance_id: instanceId, task_id: taskId, status: 'VERIFIED' });
  }
  return rows;
}

function scan({
  index = capabilityIndex(),
  registry = emptyRegistry(),
  taskInventory = inventory(),
  instances = verifiedPhysicalDependencies(),
  priorityLanes = { lanes: [] },
  check = false,
  time = '2026-08-27T15:00:00.000Z',
} = {}) {
  return scanPackageReadiness({
    root: process.cwd(),
    check,
    trigger: 'test',
    now: () => time,
    supplied: {
      contract,
      capabilityIndex: index,
      registry,
      inventory: taskInventory,
      instances,
      priorityLanes,
      activeSequence: { task_ids: ['NEXT-DOC-001'] },
      canonicalPackageIds: [],
      skipDerivedReports: true,
    },
  });
}

function addCompleteDossier(registry) {
  const cloned = structuredClone(registry);
  assert.equal(cloned.packages.length, 1);
  const evidence = {};
  for (const condition of contract.dossier_conditions) {
    evidence[condition.id] = [{
      source: `artifact:${condition.id}`,
      status: 'PASS',
      detail: `Evidencia trazable para ${condition.id}`,
    }];
  }
  cloned.packages[0].package_evidence = evidence;
  return cloned;
}

test('el contrato conserva exactamente las 14 condiciones booleanas y DELIV-PKG-001..025', () => {
  assert.equal(contract.capability_conditions.length, 14);
  const deliv = contract.dossier_conditions.flatMap(({ deliv_pkg_refs: refs }) => refs);
  assert.deepEqual(
    deliv,
    Array.from({ length: 25 }, (_, index) => `DELIV-PKG-${String(index + 1).padStart(3, '0')}`),
  );
  assert.equal(contract.unknown_blocks, true);
  assert.equal(contract.implementation_entry_task, 'SHELL-CI-020');
});

test('evidencia ausente produce UNKNOWN y bloquea la creación del package', () => {
  const capability = completeCapability();
  capability.contributors.data = [];
  const result = scan({ index: capabilityIndex(capability) });
  const data = result.capabilityResults[0].conditions.find(({ id }) => id === 'DATA_CLOSED');
  assert.equal(data.status, 'UNKNOWN');
  assert.equal(result.capabilityResults[0].capability_ready, false);
  assert.equal(result.registry.packages.length, 0);
  assert.equal(result.registry.implementation_ready_queue.length, 0);
});

test('una capacidad con 14 condiciones trazables auto-instancia package y compila el contrato DELIV-PKG', () => {
  const result = scan();
  assert.equal(result.capabilityResults[0].capability_ready, true);
  assert.equal(result.registry.packages.length, 1);
  const pkg = result.registry.packages[0];
  assert.equal(pkg.package_id, 'TEST-CAPABILITY-001');
  assert.equal(pkg.status, 'COMPILED');
  assert.equal(pkg.dossier.contract_ready, true);
  assert.equal(pkg.dossier.complete, false);
  assert.deepEqual(
    pkg.status_history.map(({ status }) => status),
    ['DISCOVERED', 'READY_FOR_COMPILATION', 'COMPILED'],
  );
  assert.equal(result.registry.implementation_ready_queue.length, 0);
});

test('un PASS de dossier sin fuente material degradable queda UNKNOWN', () => {
  const first = scan();
  const registry = structuredClone(first.registry);
  registry.packages[0].package_evidence.DELIV_PKG_001 = [{
    source: 'artifact:DELIV_PKG_001',
    status: 'PASS',
  }];
  const second = scan({ registry });
  const check = second.registry.packages[0].dossier.checks.find(({ id }) => id === 'DELIV_PKG_001');
  assert.equal(check.package_status, 'UNKNOWN');
  assert.match(check.evidence[0].detail, /degradado a UNKNOWN/u);
  assert.equal(second.registry.packages[0].status, 'COMPILED');
});

test('dossier completo + gate + dependencias VERIFIED produce IMPLEMENTATION_READY sin autoautorizar CI020', () => {
  const first = scan();
  const second = scan({
    registry: addCompleteDossier(first.registry),
    time: '2026-08-27T15:01:00.000Z',
  });
  const pkg = second.registry.packages[0];
  assert.equal(pkg.dossier.complete, true);
  assert.equal(pkg.gate.status, 'PASS');
  assert.equal(pkg.status, 'IMPLEMENTATION_READY');
  assert.equal(pkg.blockers.length, 0);
  assert.equal(pkg.next_execution, 'SHELL-CI-020::TEST-CAPABILITY-001');
  assert.equal(second.registry.implementation_ready_queue.length, 1);
  assert.equal(second.registry.implementation_ready_queue[0].physical_authorization_required, true);
  assert.equal(second.registry.implementation_ready_queue[0].next_execution, 'SHELL-CI-020::TEST-CAPABILITY-001');
  assert.equal(verifiedPhysicalDependencies().has('SHELL-CI-020::TEST-CAPABILITY-001'), false);
  assert.deepEqual(
    pkg.status_history.map(({ status }) => status),
    ['DISCOVERED', 'READY_FOR_COMPILATION', 'COMPILED', 'READY_FOR_GATE', 'IMPLEMENTATION_READY'],
  );
});

test('dossier completo sin fundación física VERIFIED queda READY_FOR_GATE y fuera de la cola', () => {
  const first = scan();
  const second = scan({
    registry: addCompleteDossier(first.registry),
    instances: new Map(),
  });
  const pkg = second.registry.packages[0];
  assert.equal(pkg.status, 'READY_FOR_GATE');
  assert.equal(pkg.gate.status, 'UNKNOWN');
  assert.ok(pkg.blockers.includes('PHYSICAL_DEPENDENCIES:UNKNOWN'));
  assert.equal(second.registry.implementation_ready_queue.length, 0);
});

test('los cambios físicos alteran la proyección efectiva sin ensuciar el registry persistente', () => {
  const first = scan();
  const persistentReadyForGate = scan({
    registry: addCompleteDossier(first.registry),
    instances: new Map(),
    time: '2026-08-27T15:02:00.000Z',
  });
  assert.equal(persistentReadyForGate.registry.packages[0].status, 'READY_FOR_GATE');
  assert.equal(persistentReadyForGate.persistentRegistry.packages[0].status, 'READY_FOR_GATE');

  const projected = scan({
    registry: persistentReadyForGate.persistentRegistry,
    instances: verifiedPhysicalDependencies(),
    check: true,
    time: '2026-08-27T15:03:00.000Z',
  });
  assert.equal(projected.registryChanged, false);
  assert.equal(projected.persistentRegistry.packages[0].status, 'READY_FOR_GATE');
  assert.equal(projected.registry.packages[0].status, 'IMPLEMENTATION_READY');
  assert.equal(projected.registry.implementation_ready_queue.length, 1);
});

test('una decisión empresarial suspendida bloquea la capacidad aunque su documentación esté cerrada', () => {
  const capability = completeCapability({ priority_lane_id: 'NEXO-REMISSIONS-001' });
  const result = evaluateCapability({
    capabilityId: 'TEST_CAPABILITY',
    capability,
    contract,
    inventory: inventory(),
    priorityLanes: {
      lanes: [{
        lane_id: 'NEXO-REMISSIONS-001',
        status: 'SUSPENDED',
        active: false,
        suspension_reason: 'Decisión empresarial explícita.',
      }],
    },
  });
  const decisions = result.conditions.find(({ id }) => id === 'NO_OPEN_CRITICAL_DECISIONS');
  assert.equal(decisions.status, 'FAIL');
  assert.equal(result.capability_ready, false);
});

test('un package_id canónico sin mapping explícito bloquea write/check del scanner', () => {
  assert.throws(
    () => scanPackageReadiness({
      root: process.cwd(),
      check: true,
      supplied: {
        contract,
        capabilityIndex: capabilityIndex(),
        registry: emptyRegistry(),
        inventory: inventory(),
        instances: verifiedPhysicalDependencies(),
        priorityLanes: { lanes: [] },
        activeSequence: { task_ids: ['NEXT-DOC-001'] },
        canonicalPackageIds: ['UNMAPPED-PACKAGE-001'],
        skipDerivedReports: true,
      },
    }),
    /no cubre package_id canónicos: UNMAPPED-PACKAGE-001/u,
  );
});

test('N/A solo es válido para las cinco condiciones donde el contrato lo permite', () => {
  const capability = completeCapability({ not_applicable: ['functional_result'] });
  assert.throws(
    () => scan({ index: capabilityIndex(capability) }),
    /N\/A no permitido/u,
  );
});

test('--check falla cerrado cuando el registry persistente está desactualizado', () => {
  assert.throws(
    () => scan({ check: true }),
    /implementation-package-registry\.json está desactualizado/u,
  );
});
