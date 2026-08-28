import fs from 'node:fs';
import path from 'node:path';
import { fileURLToPath } from 'node:url';

import { readCanonicalTaskInventory } from './task-semantic-contract.mjs';

export const READINESS_PATHS = Object.freeze({
  contract: 'scripts/docs/package-readiness/package-readiness-contract.json',
  capabilityIndex: 'scripts/docs/package-readiness/implementation-capability-index.json',
  packageRegistry: 'scripts/docs/package-readiness/implementation-package-registry.json',
  priorityLanes: 'docs/plan-canonico/modular/priority-delivery-lanes.json',
  activeSequence: 'docs/plan-canonico/modular/active-sequence.json',
  implementationOrder: 'docs/plan-canonico/modular/90_ORDEN_DE_IMPLEMENTACION.md',
  taskRoot: 'docs/plan-canonico/modular/bloques',
  implementationInstances: 'docs/plan-canonico/modular/implementation-instances',
  reportJson: '.delivery/package-readiness-scan.json',
  reportMarkdown: '.delivery/package-readiness-scan.md',
});

const TASK_HEADING = /^###\s+(?<marker>✅|🟡|❌|\[[^\]]+\])\s+(?<id>[A-Z0-9]+(?:-[A-Z0-9]+)*-\d{3,4})\s+—\s+(?<title>[^\n]+)$/gmu;
const APPROVED_STATES = new Set(['APROBADA', 'APROBADO', 'CERRADA', 'CERRADO']);
const PHYSICAL_ACTIVE = new Set(['AUTHORIZED', 'IN_PROGRESS', 'IMPLEMENTED']);

function fail(message) {
  throw new Error(message);
}

function rel(root, relativePath) {
  return path.join(root, ...String(relativePath).split('/'));
}

function readJson(root, relativePath, { optional = false, fallback = null } = {}) {
  const filePath = rel(root, relativePath);
  if (!fs.existsSync(filePath)) {
    if (optional) return fallback;
    fail(`No existe ${relativePath}.`);
  }
  try {
    return JSON.parse(fs.readFileSync(filePath, 'utf8'));
  } catch (error) {
    fail(`${relativePath} no contiene JSON valido: ${error instanceof Error ? error.message : String(error)}`);
  }
}

function stableJson(value) {
  return `${JSON.stringify(value, null, 2)}\n`;
}


export function parseTaskInventoryFromSource(source, relativePath = 'fixture.md') {
  const matches = [...String(source).matchAll(TASK_HEADING)];
  const tasks = [];
  for (let index = 0; index < matches.length; index += 1) {
    const match = matches[index];
    const next = matches[index + 1];
    const block = String(source).slice(match.index, next?.index ?? String(source).length);
    const explicitState = block.match(/^\*\*Estado:\*\*\s*([^\n]+)$/imu)?.[1]?.trim() ?? null;
    const marker = match.groups.marker;
    const markerState = marker === '✅'
      ? 'APROBADA'
      : marker === '❌'
        ? 'RECHAZADA'
        : marker === '🟡' || marker === '[~]'
          ? 'PROPUESTA'
          : 'NO_INICIADA';
    tasks.push({
      id: match.groups.id,
      title: match.groups.title.trim(),
      marker,
      state: (explicitState ?? markerState).toUpperCase(),
      relativePath,
      block,
    });
  }
  return tasks;
}

export function readTaskInventory(root = process.cwd()) {
  const canonical = readCanonicalTaskInventory(root);
  if (!(canonical instanceof Map) || canonical.size === 0) {
    fail('El inventario canónico de tareas quedó vacío o no pudo resolverse.');
  }
  return new Map([...canonical.entries()].map(([taskId, task]) => {
    const markerState = task.marker === '✅'
      ? 'APROBADA'
      : task.marker === '❌'
        ? 'RECHAZADA'
        : task.marker === '🟡' || task.marker === '[~]'
          ? 'PROPUESTA'
          : 'NO_INICIADA';
    return [taskId, {
      ...task,
      id: task.id ?? taskId,
      state: String(task.state ?? markerState).toUpperCase(),
      relativePath: task.relativePath ?? task.owner ?? 'No declarado.',
    }];
  }));
}

function isApprovedTask(task) {
  return Boolean(task) && (task.marker === '✅' || [...APPROVED_STATES].some((state) => task.state.startsWith(state)));
}

function taskEvidence(taskId, inventory) {
  const task = inventory.get(taskId);
  if (!task) {
    return { source: taskId, status: 'UNKNOWN', detail: 'Tarea canónica no encontrada.' };
  }
  if (isApprovedTask(task)) {
    return {
      source: taskId,
      status: 'PASS',
      detail: `${task.relativePath} — ${task.state}`,
    };
  }
  return {
    source: taskId,
    status: 'FAIL',
    detail: `${task.relativePath} — ${task.state}`,
  };
}

function rangeTaskIds({ prefix, from, to }) {
  const width = Math.max(3, String(to).length, String(from).length);
  return Array.from({ length: to - from + 1 }, (_, index) => (
    `${prefix}-${String(from + index).padStart(width, '0')}`
  ));
}

export function resolveSelector(selector, inventory, root = process.cwd()) {
  if (!selector || typeof selector !== 'object' || Array.isArray(selector)) {
    return [{ source: 'INVALID_SELECTOR', status: 'UNKNOWN', detail: 'Selector inválido.' }];
  }
  if (Array.isArray(selector.task_refs)) {
    return selector.task_refs.map((taskId) => taskEvidence(taskId, inventory));
  }
  if (selector.task_range && typeof selector.task_range === 'object') {
    const { prefix, from, to } = selector.task_range;
    if (!prefix || !Number.isInteger(from) || !Number.isInteger(to) || to < from) {
      return [{ source: 'INVALID_TASK_RANGE', status: 'UNKNOWN', detail: JSON.stringify(selector.task_range) }];
    }
    return rangeTaskIds({ prefix, from, to }).map((taskId) => taskEvidence(taskId, inventory));
  }
  if (typeof selector.prefix === 'string' && selector.prefix.trim()) {
    const prefix = `${selector.prefix.trim()}-`;
    const matching = [...inventory.values()]
      .filter((task) => task.id.startsWith(prefix))
      .sort((left, right) => left.id.localeCompare(right.id, 'en'));
    if (matching.length === 0) {
      return [{ source: `${selector.prefix}-*`, status: 'UNKNOWN', detail: 'No existe ninguna tarea canónica con este prefijo.' }];
    }
    return matching.map((task) => taskEvidence(task.id, inventory));
  }
  if (typeof selector.file === 'string' && selector.file.trim()) {
    const relativePath = selector.file.replaceAll('\\', '/');
    const filePath = rel(root, relativePath);
    if (!fs.existsSync(filePath) || !fs.statSync(filePath).isFile()) {
      return [{ source: relativePath, status: 'UNKNOWN', detail: 'Archivo de evidencia no encontrado.' }];
    }
    const source = fs.readFileSync(filePath, 'utf8');
    const patterns = Array.isArray(selector.contains) ? selector.contains : [];
    const missing = patterns.filter((pattern) => !source.includes(String(pattern)));
    return [{
      source: relativePath,
      status: missing.length === 0 ? 'PASS' : 'FAIL',
      detail: missing.length === 0
        ? `Archivo presente${patterns.length ? ' y patrones requeridos encontrados' : ''}.`
        : `Faltan patrones: ${missing.join(', ')}`,
    }];
  }
  return [{ source: 'UNSUPPORTED_SELECTOR', status: 'UNKNOWN', detail: JSON.stringify(selector) }];
}

function aggregateEvidence(evidence) {
  if (evidence.some(({ status }) => status === 'FAIL')) return 'FAIL';
  if (evidence.some(({ status }) => status === 'UNKNOWN')) return 'UNKNOWN';
  if (evidence.length === 0) return 'UNKNOWN';
  return 'PASS';
}

export function evaluateContributorGroup({
  capability,
  group,
  allowNotApplicable,
  inventory,
  root = process.cwd(),
}) {
  const notApplicable = new Set(capability.not_applicable ?? []);
  if (notApplicable.has(group)) {
    if (!allowNotApplicable) {
      return {
        status: 'FAIL',
        evidence: [{ source: `not_applicable:${group}`, status: 'FAIL', detail: 'El contrato no permite N/A para esta condición.' }],
      };
    }
    return {
      status: 'NOT_APPLICABLE',
      evidence: [{ source: `not_applicable:${group}`, status: 'NOT_APPLICABLE', detail: 'N/A declarado explícitamente en implementation-capability-index.json.' }],
    };
  }
  const selectors = capability.contributors?.[group] ?? [];
  if (!Array.isArray(selectors) || selectors.length === 0) {
    return {
      status: 'UNKNOWN',
      evidence: [{ source: `contributors.${group}`, status: 'UNKNOWN', detail: 'No existe evidencia declarada para este grupo.' }],
    };
  }
  const evidence = selectors.flatMap((selector) => resolveSelector(selector, inventory, root));
  return { status: aggregateEvidence(evidence), evidence };
}

function laneDecisionEvidence(capability, priorityLanes) {
  const laneId = capability.priority_lane_id;
  if (!laneId) return null;
  const lane = (priorityLanes?.lanes ?? []).find((entry) => entry.lane_id === laneId);
  if (!lane) {
    return { source: `priority-delivery-lanes:${laneId}`, status: 'UNKNOWN', detail: 'Carril declarado no encontrado.' };
  }
  const status = String(lane.status ?? '').toUpperCase();
  if (lane.active === false || ['SUSPENDED', 'BLOCKED', 'RETIRED'].includes(status)) {
    return {
      source: `priority-delivery-lanes:${laneId}`,
      status: 'FAIL',
      detail: lane.suspension_reason || `Carril ${status || 'INACTIVO'}.`,
    };
  }
  return { source: `priority-delivery-lanes:${laneId}`, status: 'PASS', detail: `Carril ${status || 'ACTIVO'}.` };
}

export function evaluateCapability({
  capabilityId,
  capability,
  contract,
  inventory,
  priorityLanes = null,
  root = process.cwd(),
}) {
  const conditions = contract.capability_conditions.map((condition) => {
    const result = evaluateContributorGroup({
      capability,
      group: condition.group,
      allowNotApplicable: condition.allow_not_applicable === true,
      inventory,
      root,
    });
    const evidence = [...result.evidence];
    let status = result.status;
    if (condition.id === 'NO_OPEN_CRITICAL_DECISIONS') {
      const laneEvidence = laneDecisionEvidence(capability, priorityLanes);
      if (laneEvidence) {
        evidence.push(laneEvidence);
        status = aggregateEvidence(evidence.filter(({ status: itemStatus }) => itemStatus !== 'NOT_APPLICABLE'));
      }
    }
    return {
      id: condition.id,
      label: condition.label,
      status,
      evidence,
    };
  });
  const blockers = conditions
    .filter(({ status }) => status === 'FAIL' || status === 'UNKNOWN')
    .map(({ id, status, evidence }) => ({
      id,
      status,
      missing_or_failed_sources: evidence
        .filter(({ status: itemStatus }) => itemStatus === 'FAIL' || itemStatus === 'UNKNOWN')
        .map(({ source }) => source),
    }));
  const ready = blockers.length === 0;
  return {
    capability_id: capabilityId,
    objective: capability.objective,
    owner_application: capability.owner_application,
    status: ready ? 'READY_FOR_COMPILATION' : 'BLOCKED',
    capability_ready: ready,
    conditions,
    blockers,
  };
}

function validateContract(contract) {
  const errors = [];
  if (contract?.schema_version !== 1) errors.push('schema_version debe ser 1.');
  if (!Array.isArray(contract?.capability_conditions) || contract.capability_conditions.length !== 14) {
    errors.push('capability_conditions debe contener exactamente 14 condiciones.');
  }
  const conditionIds = (contract?.capability_conditions ?? []).map(({ id }) => id);
  if (new Set(conditionIds).size !== conditionIds.length) errors.push('capability_conditions contiene IDs duplicados.');
  if (!Array.isArray(contract?.dossier_conditions) || contract.dossier_conditions.length === 0) {
    errors.push('dossier_conditions debe ser no vacío.');
  }
  const delivRefs = (contract?.dossier_conditions ?? []).flatMap(({ deliv_pkg_refs }) => deliv_pkg_refs ?? []);
  const expectedDeliv = Array.from({ length: 25 }, (_, index) => `DELIV-PKG-${String(index + 1).padStart(3, '0')}`);
  if (JSON.stringify([...new Set(delivRefs)].sort()) !== JSON.stringify(expectedDeliv.sort())) {
    errors.push('dossier_conditions debe cubrir DELIV-PKG-001..025 exactamente como autoridad contractual.');
  }
  if (contract?.gate?.task_id !== 'E5-GATE-008') errors.push('gate.task_id debe ser E5-GATE-008.');
  if (contract?.implementation_entry_task !== 'SHELL-CI-020') errors.push('implementation_entry_task debe ser SHELL-CI-020.');
  if (contract?.unknown_blocks !== true) errors.push('unknown_blocks debe ser true.');
  if (errors.length) fail(`package-readiness-contract.json inválido:\n- ${errors.join('\n- ')}`);
  return contract;
}

function validateCapabilityIndex(index, contract) {
  const errors = [];
  if (index?.schema_version !== 1) errors.push('schema_version debe ser 1.');
  if (index?.discovery_mode !== 'EXPLICIT_CANONICAL_MAPPINGS_ONLY') {
    errors.push('discovery_mode debe ser EXPLICIT_CANONICAL_MAPPINGS_ONLY.');
  }
  if (!index?.capabilities || typeof index.capabilities !== 'object' || Array.isArray(index.capabilities)) {
    errors.push('capabilities debe ser un objeto.');
  }
  for (const [capabilityId, capability] of Object.entries(index?.capabilities ?? {})) {
    if (!/^[A-Z][A-Z0-9_]+$/u.test(capabilityId)) errors.push(`${capabilityId} no usa una identidad de capacidad válida.`);
    if (!String(capability.objective ?? '').trim()) errors.push(`${capabilityId} no declara objective.`);
    if (!/^[a-z][a-z0-9-]*$/u.test(String(capability.owner_application ?? ''))) errors.push(`${capabilityId} no declara owner_application válido.`);
    if (!/^[A-Z0-9]+(?:-[A-Z0-9]+)*$/u.test(String(capability.package_slug ?? ''))) errors.push(`${capabilityId} no declara package_slug válido.`);
    for (const condition of contract.capability_conditions) {
      const group = condition.group;
      const isNa = (capability.not_applicable ?? []).includes(group);
      if (!Object.hasOwn(capability.contributors ?? {}, group) && !isNa) {
        errors.push(`${capabilityId} no declara contributors.${group} ni N/A.`);
      }
      if (isNa && condition.allow_not_applicable !== true) {
        errors.push(`${capabilityId} declara N/A no permitido en ${group}.`);
      }
    }
  }
  if (errors.length) fail(`implementation-capability-index.json inválido:\n- ${errors.join('\n- ')}`);
  return index;
}

function normalizeRegistry(registry) {
  if (!registry || registry.schema_version !== 1 || !Array.isArray(registry.packages)) {
    fail('implementation-package-registry.json inválido: schema_version=1 y packages[] son obligatorios.');
  }
  const seenPackage = new Set();
  const seenCapability = new Set();
  for (const pkg of registry.packages) {
    if (!pkg?.package_id || !pkg?.capability_id) fail('Cada package debe declarar package_id y capability_id.');
    if (seenPackage.has(pkg.package_id)) fail(`package_id duplicado: ${pkg.package_id}.`);
    if (seenCapability.has(pkg.capability_id)) fail(`capability_id duplicado en registry: ${pkg.capability_id}.`);
    seenPackage.add(pkg.package_id);
    seenCapability.add(pkg.capability_id);
  }
  return {
    schema_version: 1,
    registry_id: registry.registry_id ?? 'VENTO-IMPLEMENTATION-PACKAGE-REGISTRY-001',
    status_scope: 'DOCUMENTARY_READINESS',
    physical_status_projection: READINESS_PATHS.reportJson,
    packages: registry.packages,
  };
}

function nextPackageId(capability, packages) {
  if (capability.canonical_package_id) return capability.canonical_package_id;
  const base = capability.package_slug;
  const used = packages
    .map(({ package_id }) => String(package_id))
    .map((packageId) => new RegExp(`^${base.replace(/[.*+?^${}()|[\]\\]/gu, '\\$&')}-(\\d+)$`, 'u').exec(packageId))
    .filter(Boolean)
    .map((match) => Number(match[1]))
    .filter(Number.isFinite);
  const next = (used.length ? Math.max(...used) : 0) + 1;
  return `${base}-${String(next).padStart(3, '0')}`;
}

function packageEvidenceFromRegistry(previous, evidenceId) {
  const entries = previous?.package_evidence?.[evidenceId];
  if (!Array.isArray(entries) || entries.length === 0) {
    return [{ source: `package_evidence.${evidenceId}`, status: 'UNKNOWN', detail: 'El package no conserva evidencia específica para esta sección DELIV-PKG.' }];
  }
  return entries.map((entry) => {
    if (!entry || typeof entry !== 'object' || Array.isArray(entry)) {
      return { source: `package_evidence.${evidenceId}`, status: 'UNKNOWN', detail: 'Entrada de evidencia inválida.' };
    }
    const source = String(entry.source ?? '').trim();
    const status = String(entry.status ?? '').toUpperCase();
    if (!source) return { source: `package_evidence.${evidenceId}`, status: 'UNKNOWN', detail: 'La evidencia no declara source.' };
    if (!['PASS', 'FAIL', 'UNKNOWN', 'NOT_APPLICABLE'].includes(status)) {
      return { source, status: 'UNKNOWN', detail: `Estado de evidencia no permitido: ${status || 'VACIO'}.` };
    }
    if (status === 'PASS' && !String(entry.detail ?? entry.sha256 ?? entry.artifact ?? '').trim()) {
      return { source, status: 'UNKNOWN', detail: 'PASS sin detalle, artefacto o hash trazable; degradado a UNKNOWN.' };
    }
    return { source, status, detail: String(entry.detail ?? entry.artifact ?? entry.sha256 ?? '').trim() || 'Sin detalle.' };
  });
}

export function evaluateDossier({ previousPackage, contract, inventory }) {
  const checks = contract.dossier_conditions.map((condition) => {
    const templateEvidence = condition.deliv_pkg_refs.map((taskId) => taskEvidence(taskId, inventory));
    const templateStatus = aggregateEvidence(templateEvidence);
    const evidence = packageEvidenceFromRegistry(previousPackage, condition.id);
    const nonNaEvidence = evidence.filter(({ status: itemStatus }) => itemStatus !== 'NOT_APPLICABLE');
    const allNa = evidence.length > 0 && evidence.every(({ status: itemStatus }) => itemStatus === 'NOT_APPLICABLE');
    const packageStatus = allNa ? 'NOT_APPLICABLE' : aggregateEvidence(nonNaEvidence);
    const status = templateStatus === 'PASS' ? packageStatus : templateStatus;
    return {
      id: condition.id,
      label: condition.label,
      contract_sources: condition.deliv_pkg_refs,
      contract_template_status: templateStatus,
      contract_template_evidence: templateEvidence,
      package_status: packageStatus,
      status,
      evidence,
    };
  });
  const blockers = checks.filter(({ status }) => status === 'FAIL' || status === 'UNKNOWN');
  const contractReady = checks.every(({ contract_template_status: status }) => status === 'PASS');
  const complete = contractReady && blockers.length === 0;
  return {
    status: complete ? 'PASS' : 'BLOCKED',
    contract_ready: contractReady,
    complete,
    checks,
    blockers: blockers.map(({ id, status }) => `${id}:${status}`),
  };
}

function readImplementationInstances(root) {
  const directory = rel(root, READINESS_PATHS.implementationInstances);
  const instances = new Map();
  if (!fs.existsSync(directory)) return instances;
  for (const entry of fs.readdirSync(directory, { withFileTypes: true })) {
    if (!entry.isFile() || !entry.name.endsWith('.json')) continue;
    const filePath = path.join(directory, entry.name);
    let record;
    try {
      record = JSON.parse(fs.readFileSync(filePath, 'utf8'));
    } catch {
      fail(`${path.relative(root, filePath)} contiene JSON inválido.`);
    }
    if (record?.instance_id) instances.set(record.instance_id, record);
  }
  return instances;
}

function physicalDependencyInstanceIds(contract, capability) {
  const ids = [];
  for (const range of contract.physical_dependencies?.global_verified_ranges ?? []) {
    ids.push(...rangeTaskIds(range).map((taskId) => `${taskId}::GLOBAL`));
  }
  for (const selector of capability?.physical_dependencies ?? []) {
    if (Array.isArray(selector.global_task_refs)) {
      ids.push(...selector.global_task_refs.map((taskId) => `${taskId}::GLOBAL`));
    }
    if (selector.global_task_range) {
      ids.push(...rangeTaskIds(selector.global_task_range).map((taskId) => `${taskId}::GLOBAL`));
    }
    if (Array.isArray(selector.instance_refs)) ids.push(...selector.instance_refs);
  }
  return [...new Set(ids)];
}

export function evaluatePhysicalDependencies({ contract, instances, capability = null }) {
  const evidence = [];
  for (const instanceId of physicalDependencyInstanceIds(contract, capability)) {
    const record = instances.get(instanceId);
    if (!record) {
      evidence.push({ source: instanceId, status: 'UNKNOWN', detail: 'Instancia física requerida no encontrada.' });
    } else if (record.status === 'VERIFIED') {
      evidence.push({ source: instanceId, status: 'PASS', detail: 'VERIFIED.' });
    } else {
      evidence.push({ source: instanceId, status: 'FAIL', detail: `Estado ${record.status ?? 'DESCONOCIDO'}; se requiere VERIFIED.` });
    }
  }
  return {
    status: aggregateEvidence(evidence),
    available: evidence.length > 0 && evidence.every(({ status }) => status === 'PASS'),
    evidence,
  };
}

function blockersStatus(blockers) {
  if (blockers.length === 0) return 'PASS';
  if (blockers.some((blocker) => /:FAIL(?:$|:)/u.test(blocker) || blocker.startsWith('BUSINESS_DECISION:'))) return 'FAIL';
  if (blockers.some((blocker) => /:UNKNOWN(?:$|:)/u.test(blocker))) return 'UNKNOWN';
  return 'FAIL';
}

function dossierGateStatus(dossier) {
  if (dossier.complete) return 'PASS';
  if (dossier.checks.some(({ status }) => status === 'FAIL')) return 'FAIL';
  return 'UNKNOWN';
}

function evaluateDocumentaryGate({ packageId, dossier, contract, inventory, blockers }) {
  const template = taskEvidence(contract.gate.task_id, inventory);
  const zeroBlockersStatus = blockersStatus(blockers);
  const checks = [
    { id: 'PACKAGE_ID_EXISTS', status: packageId ? 'PASS' : 'FAIL', evidence: [{ source: packageId || 'package_id', status: packageId ? 'PASS' : 'FAIL', detail: packageId ? 'Identidad exacta disponible.' : 'Falta package_id.' }] },
    { id: 'DELIV_PKG_DOSSIER_COMPLETE', status: dossierGateStatus(dossier), evidence: dossier.checks.flatMap(({ evidence, contract_template_evidence: templateEvidence }) => [...templateEvidence, ...evidence]) },
    { id: 'E5_GATE_TEMPLATE_APPROVED', status: template.status, evidence: [template] },
    { id: 'ZERO_BLOCKERS', status: zeroBlockersStatus, evidence: blockers.length === 0 ? [{ source: 'blockers', status: 'PASS', detail: '0 bloqueadores documentales.' }] : blockers.map((blocker) => ({ source: blocker, status: zeroBlockersStatus, detail: blocker })) },
  ];
  const status = aggregateEvidence(checks.map((check) => ({ status: check.status })));
  return {
    gate_id: `${contract.gate.task_id}::${packageId}`,
    status,
    pass: status === 'PASS',
    scope: 'DOCUMENTARY_GATE',
    checks,
  };
}

function evaluateEffectiveGate(documentaryGate, physicalDependencies) {
  const physicalCheck = {
    id: 'PHYSICAL_DEPENDENCIES_AVAILABLE',
    status: physicalDependencies.status,
    evidence: physicalDependencies.evidence,
  };
  const checks = [...documentaryGate.checks, physicalCheck];
  const status = aggregateEvidence(checks.map((check) => ({ status: check.status })));
  return {
    gate_id: documentaryGate.gate_id,
    status,
    pass: status === 'PASS',
    scope: 'EFFECTIVE_PACKAGE_GATE',
    checks,
  };
}

function physicalLifecycleStatus(packageId, instances, contract) {
  const ci020 = instances.get(`${contract.implementation_entry_task}::${packageId}`);
  const ci024 = instances.get(`SHELL-CI-024::${packageId}`);
  if (ci024?.status === 'VERIFIED') {
    return { status: 'CLOSED', source: ci024.instance_id, nextExecution: null };
  }
  if (ci020?.status === 'VERIFIED') {
    const next = Array.from({ length: 4 }, (_, index) => `SHELL-CI-${String(index + 21).padStart(3, '0')}::${packageId}`)
      .find((instanceId) => instances.get(instanceId)?.status !== 'VERIFIED') ?? null;
    const active = Array.from({ length: 4 }, (_, index) => `SHELL-CI-${String(index + 21).padStart(3, '0')}::${packageId}`)
      .find((instanceId) => PHYSICAL_ACTIVE.has(instances.get(instanceId)?.status)) ?? null;
    return { status: 'DEPLOYED', source: active ?? ci020.instance_id, nextExecution: active ?? next };
  }
  if (ci020 && PHYSICAL_ACTIVE.has(ci020.status)) {
    return { status: 'IMPLEMENTING', source: ci020.instance_id, nextExecution: ci020.instance_id };
  }
  return null;
}

function semanticPackageSnapshot(pkg) {
  const snapshot = { ...pkg };
  delete snapshot.updated_at;
  return snapshot;
}

function sameSemanticPackage(left, right) {
  return JSON.stringify(semanticPackageSnapshot(left)) === JSON.stringify(semanticPackageSnapshot(right));
}

function initialStatusHistory(status, contract, timestamp) {
  const sequence = contract.package_statuses ?? [];
  const target = sequence.indexOf(status);
  if (target < 0) return [{ status, at: timestamp, reason: 'AUTO_RECONCILE' }];
  const allowedBootstrap = new Set([
    'DISCOVERED',
    'READY_FOR_COMPILATION',
    'COMPILED',
    'READY_FOR_GATE',
    'IMPLEMENTATION_READY',
  ]);
  const history = sequence
    .slice(0, target + 1)
    .filter((candidate) => allowedBootstrap.has(candidate))
    .map((candidate) => ({ status: candidate, at: timestamp, reason: 'AUTO_RECONCILE' }));
  if (history.at(-1)?.status !== status) history.push({ status, at: timestamp, reason: 'AUTO_RECONCILE' });
  return history;
}

function reconcileStatusHistory(previous, status, contract, timestamp) {
  if (!previous) return initialStatusHistory(status, contract, timestamp);
  const history = Array.isArray(previous.status_history) ? [...previous.status_history] : [];
  if (history.length === 0) history.push({ status: previous.status ?? 'DISCOVERED', at: previous.detected_at ?? timestamp, reason: 'IMPORTED' });
  if (previous.status !== status) history.push({ status, at: timestamp, reason: 'RECONCILED' });
  return history;
}

export function reconcileRegistry({
  registry,
  capabilityResults,
  capabilityIndex,
  contract,
  inventory,
  priorityLanes,
  now = () => new Date().toISOString(),
}) {
  const previousByCapability = new Map(registry.packages.map((pkg) => [pkg.capability_id, pkg]));
  const packages = [];

  for (const capabilityResult of capabilityResults) {
    const capability = capabilityIndex.capabilities[capabilityResult.capability_id];
    const previous = previousByCapability.get(capabilityResult.capability_id) ?? null;
    if (!previous && !capabilityResult.capability_ready) continue;

    const timestamp = now();
    const packageId = previous?.package_id ?? nextPackageId(capability, registry.packages);
    const dossier = evaluateDossier({ previousPackage: previous, contract, inventory });
    const businessBlockers = [];
    const laneEvidence = laneDecisionEvidence(capability, priorityLanes);
    if (laneEvidence?.status === 'FAIL') businessBlockers.push(`BUSINESS_DECISION:${laneEvidence.source}:${laneEvidence.detail}`);
    if (laneEvidence?.status === 'UNKNOWN') businessBlockers.push(`BUSINESS_DECISION:${laneEvidence.source}:UNKNOWN`);
    const capabilityBlockers = capabilityResult.blockers.map(({ id, status }) => `CAPABILITY:${id}:${status}`);
    const dossierBlockers = dossier.blockers.map((blocker) => `DOSSIER:${blocker}`);
    const documentaryBlockers = [...businessBlockers, ...capabilityBlockers, ...dossierBlockers];
    const documentaryGate = evaluateDocumentaryGate({
      packageId,
      dossier,
      contract,
      inventory,
      blockers: documentaryBlockers,
    });

    let status = 'READY_FOR_COMPILATION';
    if (!capabilityResult.capability_ready) status = 'MATURING';
    else if (!dossier.contract_ready) status = 'READY_FOR_COMPILATION';
    else if (!dossier.complete) status = 'COMPILED';
    else status = 'READY_FOR_GATE';

    const blockers = [...documentaryBlockers, ...documentaryGate.checks
      .filter(({ status: checkStatus }) => checkStatus === 'FAIL' || checkStatus === 'UNKNOWN')
      .map(({ id, status: checkStatus }) => `GATE_DOCUMENTARY:${id}:${checkStatus}`)];

    const draft = {
      package_id: packageId,
      capability_id: capabilityResult.capability_id,
      objective: capability.objective,
      owner_application: capability.owner_application,
      status,
      status_scope: 'DOCUMENTARY_READINESS',
      capability_status: capabilityResult.status,
      status_history: reconcileStatusHistory(previous, status, contract, timestamp),
      dossier,
      gate_documentary: documentaryGate,
      blockers: [...new Set(blockers)],
      package_evidence: previous?.package_evidence ?? {},
      detected_at: previous?.detected_at ?? timestamp,
      compiled_at: dossier.contract_ready ? previous?.compiled_at ?? timestamp : previous?.compiled_at ?? null,
      ready_for_gate_at: status === 'READY_FOR_GATE'
        ? previous?.ready_for_gate_at ?? timestamp
        : previous?.ready_for_gate_at ?? null,
      last_status_change_at: previous?.status === status
        ? previous?.last_status_change_at ?? previous?.detected_at ?? timestamp
        : timestamp,
      updated_at: previous?.updated_at ?? timestamp,
    };
    if (previous && sameSemanticPackage(previous, draft)) draft.updated_at = previous.updated_at;
    else if (previous) draft.updated_at = timestamp;
    packages.push(draft);
  }

  for (const previous of registry.packages) {
    if (!capabilityIndex.capabilities[previous.capability_id]) {
      packages.push({ ...previous, blockers: [...new Set([...(previous.blockers ?? []), 'CAPABILITY_REMOVED_FROM_INDEX'])] });
    }
  }

  packages.sort((left, right) => left.package_id.localeCompare(right.package_id, 'en'));
  return {
    schema_version: 1,
    registry_id: registry.registry_id ?? 'VENTO-IMPLEMENTATION-PACKAGE-REGISTRY-001',
    status_scope: 'DOCUMENTARY_READINESS',
    physical_status_projection: READINESS_PATHS.reportJson,
    packages,
  };
}

export function applyPhysicalOverlay({ registry, contract, instances, capabilityIndex }) {
  const packages = registry.packages.map((persisted) => {
    const capability = capabilityIndex.capabilities[persisted.capability_id] ?? null;
    const physicalDependencies = evaluatePhysicalDependencies({ contract, instances, capability });
    const effectiveGate = evaluateEffectiveGate(persisted.gate_documentary, physicalDependencies);
    const physical = physicalLifecycleStatus(persisted.package_id, instances, contract);
    let status = persisted.status;
    if (physical) status = physical.status;
    else if (persisted.status === 'READY_FOR_GATE' && effectiveGate.pass) status = 'IMPLEMENTATION_READY';

    const history = [...(persisted.status_history ?? [])];
    if (history.at(-1)?.status !== status) {
      history.push({ status, at: null, reason: 'EFFECTIVE_RUNTIME_PROJECTION' });
    }
    const physicalBlockers = physicalDependencies.status === 'PASS'
      ? []
      : [`PHYSICAL_DEPENDENCIES:${physicalDependencies.status}`];
    const effectiveBlockers = status === 'IMPLEMENTATION_READY'
      ? []
      : [...(persisted.blockers ?? []), ...physicalBlockers, ...effectiveGate.checks
        .filter(({ status: checkStatus }) => checkStatus === 'FAIL' || checkStatus === 'UNKNOWN')
        .map(({ id, status: checkStatus }) => `GATE:${id}:${checkStatus}`)];
    return {
      ...persisted,
      status,
      status_scope: 'EFFECTIVE_RUNTIME',
      persisted_status: persisted.status,
      status_history: history,
      gate: effectiveGate,
      physical_dependencies: physicalDependencies,
      blockers: [...new Set(effectiveBlockers)],
      next_execution: status === 'IMPLEMENTATION_READY'
        ? `${contract.implementation_entry_task}::${persisted.package_id}`
        : physical?.nextExecution ?? null,
    };
  });
  const implementationReadyQueue = packages
    .filter(({ status, blockers }) => status === 'IMPLEMENTATION_READY' && blockers.length === 0)
    .map((pkg) => ({
      package_id: pkg.package_id,
      capability_id: pkg.capability_id,
      owner_application: pkg.owner_application,
      status: 'READY',
      gate_id: pkg.gate.gate_id,
      next_execution: pkg.next_execution,
      physical_authorization_required: true,
    }));
  return {
    ...registry,
    status_scope: 'EFFECTIVE_RUNTIME',
    packages,
    implementation_ready_queue: implementationReadyQueue,
  };
}

export function discoverCanonicalPackageIds(root = process.cwd(), priorityLanes = { lanes: [] }) {
  const ids = new Set(
    (priorityLanes?.lanes ?? [])
      .map(({ lane_id: laneId }) => String(laneId ?? '').trim())
      .filter((laneId) => /^[A-Z][A-Z0-9-]*-\d{3,4}$/u.test(laneId)),
  );
  const orderPath = rel(root, READINESS_PATHS.implementationOrder);
  if (fs.existsSync(orderPath) && fs.statSync(orderPath).isFile()) {
    const source = fs.readFileSync(orderPath, 'utf8');
    for (const match of source.matchAll(/(?:E5-GATE-008|SHELL-CI-020)::([A-Z][A-Z0-9-]*-\d{3,4})/gu)) {
      ids.add(match[1]);
    }
  }
  return [...ids].sort((left, right) => left.localeCompare(right, 'en'));
}

export function auditCapabilityIndexCoverage(capabilityIndex, canonicalPackageIds) {
  const mapped = new Set(
    Object.values(capabilityIndex.capabilities ?? {})
      .map(({ canonical_package_id: packageId }) => String(packageId ?? '').trim())
      .filter(Boolean),
  );
  const unmapped = canonicalPackageIds.filter((packageId) => !mapped.has(packageId));
  return {
    canonical_package_ids: canonicalPackageIds,
    mapped_package_ids: [...mapped].sort((left, right) => left.localeCompare(right, 'en')),
    unmapped_package_ids: unmapped,
    complete: unmapped.length === 0,
  };
}

function documentationCurrent(activeSequence) {
  if (!activeSequence || typeof activeSequence !== 'object') return null;
  if (Array.isArray(activeSequence.task_ids) && activeSequence.task_ids.length > 0) return activeSequence.task_ids[0];
  if (Array.isArray(activeSequence.segments)) {
    const first = activeSequence.segments[0];
    if (first?.prefix && Number.isInteger(first?.from)) {
      return `${first.prefix}-${String(first.from).padStart(3, '0')}`;
    }
  }
  return null;
}

export function renderReadinessBlock({ capabilityResults, registry, activeSequence, trigger, indexCoverage }) {
  const readyCaps = capabilityResults.filter(({ status }) => status === 'READY_FOR_COMPILATION');
  const blockedCaps = capabilityResults.filter(({ status }) => status === 'BLOCKED');
  const packageRows = registry.packages.length > 0
    ? registry.packages.map((pkg) => `- ${pkg.package_id}  STATUS: ${pkg.status}`).join('\n')
    : '- NONE';
  const readyRows = registry.implementation_ready_queue.length > 0
    ? registry.implementation_ready_queue.map((entry) => `- ${entry.package_id}  NEXT: ${entry.next_execution}`).join('\n')
    : '- NONE';
  const blockers = registry.packages
    .filter((pkg) => pkg.blockers.length > 0)
    .map((pkg) => `${pkg.package_id}:\n${pkg.blockers.map((blocker) => `  - ${blocker}`).join('\n')}`)
    .join('\n');
  const unmapped = indexCoverage?.unmapped_package_ids ?? [];
  return `=== PACKAGE READINESS SCAN ===\n\nTRIGGER: ${trigger}\nCAPABILITIES DETECTED: ${capabilityResults.length}\n\nUNMAPPED CANONICAL PACKAGES:\n${unmapped.length ? unmapped.map((packageId) => `- ${packageId}  UNKNOWN_CAPABILITY_MAPPING`).join('\n') : '- NONE'}\n\nMATURING/BLOCKED:\n${blockedCaps.length ? blockedCaps.map((cap) => `- ${cap.capability_id}  BLOCKED`).join('\n') : '- NONE'}\n\nREADY FOR COMPILATION:\n${readyCaps.length ? readyCaps.map((cap) => `- ${cap.capability_id}  YES`).join('\n') : '- NONE'}\n\nPACKAGES:\n${packageRows}\n\nIMPLEMENTATION READY:\n${readyRows}\n\nBLOCKERS:\n${blockers || '- NONE'}\n\nNEXT DOCUMENTATION WORK:\n${documentationCurrent(activeSequence) ?? 'EMPTY'}\n\n=== END PACKAGE READINESS ===`;
}

function renderMarkdown(result) {
  return `# Package Readiness Scan\n\n\`\`\`text\n${result.block}\n\`\`\`\n\n## Reglas\n\n- Un \`PASS\` exige evidencia trazable.\n- Evidencia ausente o insuficiente se degrada a \`UNKNOWN\`.\n- \`UNKNOWN\` bloquea readiness.\n- \`IMPLEMENTATION_READY\` no autoriza ejecución física; solo crea una entrada en \`IMPLEMENTATION_READY_QUEUE\`.\n- La autorización física sigue siendo explícita por instancia.\n`;
}

function writeDerivedReports(root, result) {
  const jsonPath = rel(root, READINESS_PATHS.reportJson);
  const markdownPath = rel(root, READINESS_PATHS.reportMarkdown);
  fs.mkdirSync(path.dirname(jsonPath), { recursive: true });
  fs.writeFileSync(jsonPath, stableJson({
    trigger: result.trigger,
    scanned_at: result.scannedAt,
    capabilities: result.capabilityResults,
    index_coverage: result.indexCoverage,
    packages: result.registry.packages,
    implementation_ready_queue: result.registry.implementation_ready_queue,
    documentation_current: documentationCurrent(result.activeSequence),
  }), 'utf8');
  fs.writeFileSync(markdownPath, renderMarkdown(result), 'utf8');
}

export function scanPackageReadiness({
  root = process.cwd(),
  write = false,
  check = false,
  trigger = 'manual',
  now = () => new Date().toISOString(),
  supplied = {},
} = {}) {
  const contract = validateContract(supplied.contract ?? readJson(root, READINESS_PATHS.contract));
  const capabilityIndex = validateCapabilityIndex(
    supplied.capabilityIndex ?? readJson(root, READINESS_PATHS.capabilityIndex),
    contract,
  );
  const registry = normalizeRegistry(
    supplied.registry ?? readJson(root, READINESS_PATHS.packageRegistry),
  );
  const inventory = supplied.inventory ?? readTaskInventory(root);
  const priorityLanes = supplied.priorityLanes ?? readJson(root, READINESS_PATHS.priorityLanes, { optional: true, fallback: { lanes: [] } });
  const activeSequence = supplied.activeSequence ?? readJson(root, READINESS_PATHS.activeSequence, { optional: true, fallback: null });
  const instances = supplied.instances ?? readImplementationInstances(root);
  const canonicalPackageIds = supplied.canonicalPackageIds
    ?? discoverCanonicalPackageIds(root, priorityLanes);
  const indexCoverage = auditCapabilityIndexCoverage(capabilityIndex, canonicalPackageIds);
  if ((write || check) && !indexCoverage.complete) {
    fail(`implementation-capability-index.json no cubre package_id canónicos: ${indexCoverage.unmapped_package_ids.join(', ')}.`);
  }

  const capabilityResults = Object.entries(capabilityIndex.capabilities)
    .map(([capabilityId, capability]) => evaluateCapability({
      capabilityId,
      capability,
      contract,
      inventory,
      priorityLanes,
      root,
    }));

  const nextPersistentRegistry = reconcileRegistry({
    registry,
    capabilityResults,
    capabilityIndex,
    contract,
    inventory,
    priorityLanes,
    now,
  });
  const effectiveRegistry = applyPhysicalOverlay({
    registry: nextPersistentRegistry,
    contract,
    instances,
    capabilityIndex,
  });

  const expectedSource = stableJson(nextPersistentRegistry);
  const currentSource = stableJson(registry);
  const registryChanged = expectedSource !== currentSource;
  if (check && registryChanged) {
    const currentPath = READINESS_PATHS.packageRegistry;
    fail(`${currentPath} está desactualizado; ejecute npm run docs:package:readiness antes de continuar.`);
  }
  if (write && registryChanged) {
    fs.writeFileSync(rel(root, READINESS_PATHS.packageRegistry), expectedSource, 'utf8');
  }

  const result = {
    trigger,
    scannedAt: now(),
    contract,
    capabilityIndex,
    capabilityResults,
    indexCoverage,
    registry: effectiveRegistry,
    persistentRegistry: nextPersistentRegistry,
    registryChanged,
    activeSequence,
  };
  result.block = renderReadinessBlock(result);
  if (!supplied.skipDerivedReports) writeDerivedReports(root, result);
  return result;
}

function parseArgs(argv) {
  const args = { write: false, check: false, trigger: 'manual', json: false };
  for (let index = 0; index < argv.length; index += 1) {
    const token = argv[index];
    if (token === '--write') args.write = true;
    else if (token === '--check') args.check = true;
    else if (token === '--json') args.json = true;
    else if (token === '--trigger') {
      args.trigger = argv[index + 1];
      if (!args.trigger) fail('Falta valor de --trigger.');
      index += 1;
    } else fail(`Argumento desconocido: ${token}.`);
  }
  if (args.write && args.check) fail('--write y --check son mutuamente excluyentes.');
  return args;
}

function printCliResult(result, { json = false } = {}) {
  if (json) {
    console.log(JSON.stringify({
      trigger: result.trigger,
      capability_results: result.capabilityResults,
      packages: result.registry.packages,
      implementation_ready_queue: result.registry.implementation_ready_queue,
      registry_changed: result.registryChanged,
    }, null, 2));
    return;
  }
  console.log(result.block);
  if (result.registry.implementation_ready_queue.length > 0) {
    const first = result.registry.implementation_ready_queue[0];
    console.log('');
    console.log('PACKAGE IMPLEMENTABLE DETECTED');
    console.log(first.package_id);
    console.log(`E5-GATE: PASS (${first.gate_id})`);
    console.log('BLOCKERS: 0');
    console.log(`NEXT EXECUTION: ${first.next_execution}`);
    console.log('PHYSICAL AUTHORIZATION: REQUIRED');
  }
}

function main() {
  const args = parseArgs(process.argv.slice(2));
  const result = scanPackageReadiness(args);
  printCliResult(result, args);
}

const isCli = process.argv[1]
  && path.resolve(process.argv[1]) === path.resolve(fileURLToPath(import.meta.url));

if (isCli) {
  try {
    main();
  } catch (error) {
    console.error(`ERROR: ${error instanceof Error ? error.message : String(error)}`);
    process.exitCode = 1;
  }
}
