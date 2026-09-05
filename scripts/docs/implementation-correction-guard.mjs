import path from 'node:path';
import { fileURLToPath } from 'node:url';

import { startImplementation } from './implementation-branch-lifecycle.mjs';
import { scanPackageReadiness } from './package-readiness-scanner.mjs';
import { loadImplementationControl } from './implementation-control.mjs';
import {
    assertTargetNotBlocked,
    loadValidatedCorrectionControl,
} from './correction-control.mjs';

function fail(message) {
    throw new Error(message);
}

export function implementationCorrectionTargets(instance) {
    if (!instance || typeof instance !== 'object') fail('instancia de implementación inválida.');
    const instanceId = String(instance.instance_id ?? '').trim();
    const taskId = String(instance.task_id ?? '').trim();
    if (!instanceId || !taskId) fail('la instancia debe declarar instance_id y task_id.');
    return [instanceId, taskId];
}

export function assertImplementationTargetsNotBlocked(corrections, instance) {
    for (const target of implementationCorrectionTargets(instance)) {
        assertTargetNotBlocked(corrections, target);
    }
    return true;
}

function normalizedDeploymentTargets(values) {
  return (Array.isArray(values) ? values : [])
    .map((target) => ({
      environment_role: String(target?.environment_role ?? '').trim().toUpperCase(),
      target_type: String(target?.target_type ?? '').trim().toUpperCase(),
      target_id: String(target?.target_id ?? '').trim(),
      owner: String(target?.owner ?? '').trim(),
    }))
    .sort((left, right) => JSON.stringify(left).localeCompare(JSON.stringify(right), 'en'));
}

export function assertImplementationDeploymentEnvironment({ instance, pkg } = {}) {
  const deployment = pkg?.deployment_environment ?? null;
  if (deployment?.status !== 'PASS') {
    fail(`IMPLEMENTATION_ENVIRONMENT_NOT_READY: ${instance?.instance_id ?? 'UNKNOWN'}; ${deployment?.detail ?? 'PACKAGE_ENVIRONMENT_UNRESOLVED'}.`);
  }
  const packageEnvironment = pkg?.package_gate?.deployment_environment ?? null;
  const expected = normalizedDeploymentTargets(packageEnvironment?.targets);
  const actual = normalizedDeploymentTargets(instance?.target_environments);
  if (expected.length === 0) {
    fail(`IMPLEMENTATION_ENVIRONMENT_NOT_READY: ${instance.instance_id}; package-gate sin targets de despliegue.`);
  }
  if (JSON.stringify(actual) !== JSON.stringify(expected)) {
    fail(`IMPLEMENTATION_ENVIRONMENT_MISMATCH: ${instance.instance_id}; target_environments no coincide con GAP-PKG.`);
  }
  if (
    packageEnvironment?.production_authorized === false
    && actual.some((target) => target.environment_role === 'PRODUCTION')
  ) {
    fail(`IMPLEMENTATION_ENVIRONMENT_MISMATCH: ${instance.instance_id}; PRODUCTION no está autorizada.`);
  }
  return true;
}

export function assertImplementationPackageReadiness({ instance, readiness } = {}) {
  if (!instance || typeof instance !== 'object') fail('instancia de implementación inválida.');

  if (instance.task_id !== 'SHELL-CI-020') return true;

  const match = /^SHELL-CI-020::(GAP-PKG-\d{3})$/u.exec(String(instance.instance_id ?? ''));
  if (!match) return true;

  const packageId = match[1];
  const execution = readiness?.registry?.package_execution ?? null;
  const current = execution?.current ?? null;

  if (!current || current.package_id !== packageId) {
    fail(
      `IMPLEMENTATION_START_NOT_READY: ${instance.instance_id} no coincide con el package actual `
      + `${current?.package_id ?? 'NONE'}.`,
    );
  }

  const action = current.next_action;
  if (
    action?.type !== 'AUTHORIZE_PHYSICAL_IMPLEMENTATION'
    || action?.target !== instance.instance_id
  ) {
    const work = execution.current_work ?? current.current_work ?? null;
    fail(
      `IMPLEMENTATION_START_NOT_READY: ${instance.instance_id}; `
      + `CURRENT_EXECUTABLE_WORK=${work?.id ?? action?.target ?? 'UNKNOWN'}; `
      + `ACTION=${action?.type ?? 'NONE'}.`,
    );
  }

  const pkg = readiness?.registry?.packages?.find(({ package_id: id }) => id === packageId) ?? null;
  if (!pkg) fail(`IMPLEMENTATION_ENVIRONMENT_NOT_READY: ${instance.instance_id}; package ${packageId} no encontrado.`);
  assertImplementationDeploymentEnvironment({ instance, pkg });

  return true;
}

export function assertImplementationStartNotBlocked({ root = process.cwd(), instanceId } = {}) {
    const id = String(instanceId ?? '').trim();
    if (!id) fail('instanceId es obligatorio.');
    const implementation = loadImplementationControl({ root });
    const instance = implementation.instances.find((entry) => entry.instance_id === id) ?? null;
    if (!instance) fail(`${id} no existe en implementation-instances.`);
    const corrections = loadValidatedCorrectionControl({ root });
    assertImplementationTargetsNotBlocked(corrections, instance);

    if (
        instance.task_id === 'SHELL-CI-020'
        && /^SHELL-CI-020::GAP-PKG-\d{3}$/u.test(instance.instance_id)
    ) {
        const readiness = scanPackageReadiness({
            root,
            check: true,
            trigger: 'implementation-start-guard',
            supplied: { skipDerivedReports: true },
        });
        assertImplementationPackageReadiness({ instance, readiness });
    }

    return instance;
}


function parseArgs(argv) {
    const args = { mode: null, instanceId: null };
    const tokens = [...argv];
    args.mode = tokens.shift() ?? null;
    for (let index = 0; index < tokens.length; index += 1) {
        const token = tokens[index];
        const value = tokens[index + 1];
        if (token === '--instance-id') {
            if (!value || value.startsWith('--')) fail('falta valor de --instance-id.');
            args.instanceId = value;
            index += 1;
        } else fail(`argumento desconocido: ${token}.`);
    }
    return args;
}

export function main(argv = process.argv.slice(2)) {
    const args = parseArgs(argv);
    if (args.mode !== 'start') fail(`modo desconocido: ${args.mode || 'VACÍO'}.`);
    if (!args.instanceId) fail('start exige --instance-id.');
    assertImplementationStartNotBlocked({ instanceId: args.instanceId });
    return startImplementation({ instanceId: args.instanceId });
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
