import fs from 'node:fs';
import path from 'node:path';
import { fileURLToPath } from 'node:url';

import {
  formatTaskBlock,
  validateTaskPresentation,
} from './format-canonical-task.mjs';
import { readPendingTaskTitleAuthority } from './pending-task-title-authority.mjs';
import {
  validateTaskDevelopmentPolicy,
  validateTaskSemanticContract,
} from './task-semantic-contract.mjs';
import { validateTaskFormatPolicy } from './task-format-policy.mjs';
import { resolveTaskWorkTopology } from './task-work-topology.mjs';

function taskState(marker) {
  if (marker === '[ ]') return 'NO INICIADA';
  if (marker === '[~]' || marker === '🟡') return 'PROPUESTA PARA APROBACIÓN';
  if (marker === '❌') return 'RECHAZADA';
  return 'APROBADA';
}

function finding(taskId, contract, code, message) {
  return { taskId, contract, code, message };
}

function matchesHistoricalExemption(taskId, selectors) {
  for (const selector of selectors ?? []) {
    if (selector.task_ids?.includes(taskId)) return true;
    if (typeof selector.prefix !== 'string') continue;
    const match = taskId.match(/^(?<prefix>[A-Z][A-Z0-9]*(?:-[A-Z0-9]+)+)-(?<number>\d{3})$/u);
    if (!match || match.groups.prefix !== selector.prefix) continue;
    const number = Number(match.groups.number);
    if (number >= selector.from && number <= selector.to) return true;
  }
  return false;
}

export function auditProspectiveTaskSet({
  ordered,
  inventory,
  canonicalTitles,
  formatBoundaryId,
  semanticBoundaryId,
  developmentPolicy,
  root = process.cwd(),
}) {
  const position = new Map(ordered.map((task, index) => [task.id, index]));
  if (!position.has(formatBoundaryId)) {
    throw new Error(`la frontera de formato ${formatBoundaryId} no existe en la ruta canónica.`);
  }
  if (!position.has(semanticBoundaryId)) {
    throw new Error(`la frontera semántica ${semanticBoundaryId} no existe en la ruta canónica.`);
  }

  const formatBoundary = position.get(formatBoundaryId);
  const semanticBoundary = position.get(semanticBoundaryId);
  const errors = [];
  const warnings = [];
  const formattedById = new Map();
  let approved = 0;
  let formatCovered = 0;
  let semanticCovered = 0;
  let normalizable = 0;
  let historicalExemptions = 0;

  for (const routeTask of ordered) {
    const index = position.get(routeTask.id);
    const inventoryTask = inventory.get(routeTask.id) ?? routeTask;
    if (taskState(inventoryTask.marker) !== 'APROBADA') continue;
    approved += 1;
    if (matchesHistoricalExemption(routeTask.id, developmentPolicy.historical_approved_exemptions)) {
      historicalExemptions += 1;
      continue;
    }

    if (index >= formatBoundary) {
      formatCovered += 1;
      try {
        const formatted = formatTaskBlock(inventoryTask.block, { canonicalTitles });
        formattedById.set(routeTask.id, formatted);
        if (formatted !== inventoryTask.block.replace(/\r\n?/gu, '\n').replace(/\n+$/u, '')) {
          normalizable += 1;
        }
        for (const message of validateTaskPresentation(formatted, { canonicalTitles })) {
          errors.push(finding(routeTask.id, 'FORMAT', 'PRESENTATION', message));
        }
      } catch (error) {
        errors.push(finding(
          routeTask.id,
          'FORMAT',
          'FORMATTER_REJECTED',
          error instanceof Error ? error.message : String(error),
        ));
      }
    }

    if (index >= semanticBoundary) {
      semanticCovered += 1;
      const result = validateTaskSemanticContract({
        block: formattedById.get(routeTask.id) ?? inventoryTask.block,
        task: { ...routeTask, state: 'APROBADA' },
        ownerRelativePath: inventoryTask.relativePath,
        inventory,
        policy: developmentPolicy,
        root,
      });
      errors.push(...result.errors.filter(({ code }) => (
        code !== 'PRESENTATION' || index < formatBoundary
      )).map(({ code, message }) => (
        finding(routeTask.id, 'SEMANTIC', code, message)
      )));
      warnings.push(...result.warnings.map(({ code, message }) => (
        finding(routeTask.id, 'SEMANTIC', code, message)
      )));
    }
  }

  return {
    errors,
    warnings,
    stats: { approved, formatCovered, semanticCovered, normalizable, historicalExemptions },
  };
}

export function auditProspectiveTasks({ root = process.cwd() } = {}) {
  const baseDir = path.join(root, 'docs', 'plan-canonico', 'modular');
  const formatPolicy = validateTaskFormatPolicy({ root });
  const developmentPolicy = JSON.parse(fs.readFileSync(
    path.join(baseDir, 'task-development-policy.json'),
    'utf8',
  ));
  const policyErrors = validateTaskDevelopmentPolicy(developmentPolicy);
  if (policyErrors.length > 0) {
    throw new Error(`task-development-policy.json inválida:\n- ${policyErrors.join('\n- ')}`);
  }
  const topology = resolveTaskWorkTopology({ root });
  const canonicalTitles = readPendingTaskTitleAuthority(root);
  return auditProspectiveTaskSet({
    ordered: topology.ordered,
    inventory: topology.inventory,
    canonicalTitles,
    formatBoundaryId: formatPolicy.effective_from_task_id,
    semanticBoundaryId: developmentPolicy.effective_from_task_id,
    developmentPolicy,
    root,
  });
}

export function renderProspectiveAuditErrors(errors) {
  return [
    `auditoría prospectiva bloqueada; ${errors.length} incompatibilidad(es) encontradas en conjunto:`,
    ...errors.map(({ taskId, contract, code, message }) => (
      `- ${taskId} [${contract}/${code}]: ${message}`
    )),
  ].join('\n');
}

export function assertProspectiveTasks({ root = process.cwd() } = {}) {
  const result = auditProspectiveTasks({ root });
  if (result.errors.length > 0) throw new Error(renderProspectiveAuditErrors(result.errors));
  return result;
}

function main() {
  const result = assertProspectiveTasks();
  console.log(
    `OK: auditoría prospectiva completa; ${result.stats.formatCovered} tareas aprobadas con formato; `
    + `${result.stats.semanticCovered} con contrato semántico; `
    + `${result.stats.normalizable} normalizables automáticamente; `
    + `${result.warnings.length} advertencia(s).`,
  );
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
