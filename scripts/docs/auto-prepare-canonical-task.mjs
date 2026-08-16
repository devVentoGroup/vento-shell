import fs from 'node:fs';
import path from 'node:path';
import { fileURLToPath } from 'node:url';

import { derivePreflight } from './canonical-task-preflight.mjs';
import {
  formatTaskFileSource,
  parseTaskBlocks,
  validateTaskPresentation,
} from './format-canonical-task.mjs';
import { validateTaskFormatPolicy } from './task-format-policy.mjs';
import { readPendingTaskTitleAuthority } from './pending-task-title-authority.mjs';
import { validateProspectiveTaskSemantics } from './task-semantic-contract.mjs';

function fail(message) {
  throw new Error(message);
}

export function automaticTaskIds(preflight) {
  return [...new Set([
    preflight.continuity.previous,
    preflight.continuity.current,
  ].filter(Boolean))];
}

export function isTaskCoveredByPresentationPolicy(taskOrder, boundaryOrder) {
  return taskOrder >= boundaryOrder;
}

function writePreservingEol(filePath, raw, normalized) {
  const next = raw.includes('\r\n') ? normalized.replace(/\n/gu, '\r\n') : normalized;
  fs.writeFileSync(filePath, next, 'utf8');
}

export function autoPrepareCanonicalTask({
  root = process.cwd(),
  checkOnly = false,
} = {}) {
  const currentPreflight = derivePreflight({ root });
  const baseDir = path.join(root, 'docs', 'plan-canonico', 'modular');
  const policy = validateTaskFormatPolicy({ root });
  const boundary = derivePreflight({ root, requestedTaskId: policy.effective_from_task_id });
  const canonicalTitles = readPendingTaskTitleAuthority(root);
  const changed = [];
  const checked = [];
  const skipped = [];
  const semanticWarnings = [];

  for (const taskId of automaticTaskIds(currentPreflight)) {
    let preflight;
    try {
      preflight = derivePreflight({ root, requestedTaskId: taskId });
    } catch (error) {
      skipped.push({
        taskId,
        reason: error instanceof Error ? error.message : String(error),
      });
      continue;
    }

    if (!isTaskCoveredByPresentationPolicy(
      preflight.task.canonical_order,
      boundary.task.canonical_order,
    )) {
      skipped.push({ taskId, reason: 'HISTORICAL_STYLE_PRESERVED' });
      continue;
    }

    if (preflight.task.structure === 'EMPTY_DRAFT') {
      const semantic = validateProspectiveTaskSemantics({ root, taskId });
      semanticWarnings.push(...semantic.warnings.map((warning) => ({ taskId, ...warning })));
      skipped.push({ taskId, reason: 'EMPTY_DRAFT_NO_AUTO_SCAFFOLD' });
      continue;
    }

    const ownerPath = path.join(baseDir, preflight.task.owner);
    const raw = fs.readFileSync(ownerPath, 'utf8');
    const result = formatTaskFileSource(raw, { taskId, canonicalTitles });
    checked.push(taskId);
    if (result.changedTaskIds.length > 0 && checkOnly) {
      fail(`${taskId} requiere formato canónico; ejecute docs:plan:build para aplicarlo.`);
    }
    const effectiveSource = result.source;
    const [formattedTask] = parseTaskBlocks(effectiveSource).filter(({ id }) => id === taskId);
    const presentationErrors = formattedTask
      ? validateTaskPresentation(formattedTask.block, { canonicalTitles })
      : [
      `${taskId} no se pudo aislar después del formateo.`,
      ];
    if (presentationErrors.length > 0) {
      fail(`${taskId} incumple task-format-policy.json:\n- ${presentationErrors.join('\n- ')}`);
    }
    if (result.changedTaskIds.length > 0) {
      writePreservingEol(ownerPath, raw, result.source);
      changed.push(taskId);
    }
    const semantic = validateProspectiveTaskSemantics({ root, taskId });
    semanticWarnings.push(...semantic.warnings.map((warning) => ({ taskId, ...warning })));
    if (semantic.errors.length > 0) {
      fail(
        `${taskId} incumple task-development-policy.json:\n- `
        + semantic.errors.map(({ code, message }) => `${code}: ${message}`).join('\n- '),
      );
    }
  }

  console.log(
    `[PLAN CANÓNICO] Preparación automática: ${checked.length} tarea(s) revisadas; `
    + `${changed.length} formateadas; ${skipped.length} omitidas de forma segura.`,
  );
  for (const { taskId, reason } of skipped) {
    if (reason === 'EMPTY_DRAFT_NO_AUTO_SCAFFOLD') {
      console.log(`[PLAN CANÓNICO] ${taskId}: borrador vacío preservado; no se inicia automáticamente.`);
    } else if (reason === 'HISTORICAL_STYLE_PRESERVED') {
      console.log(`[PLAN CANÓNICO] ${taskId}: formato histórico preservado por la frontera prospectiva.`);
    } else {
      console.warn(`[PLAN CANÓNICO] ${taskId}: preparación omitida: ${reason}`);
    }
  }
  for (const { taskId, code, message } of semanticWarnings) {
    console.warn(`[PLAN CANÓNICO] ${taskId}: advertencia semántica ${code}: ${message}`);
  }

  return { currentPreflight, checked, changed, skipped };
}

function parseArgs(argv) {
  const args = { checkOnly: false, help: false };
  for (const token of argv) {
    if (token === '--check') args.checkOnly = true;
    else if (token === '--help' || token === '-h') args.help = true;
    else fail(`argumento desconocido: ${token}.`);
  }
  return args;
}

function printUsage() {
  console.log(`Uso:
  node scripts/docs/auto-prepare-canonical-task.mjs
  node scripts/docs/auto-prepare-canonical-task.mjs --check

El build y el watcher invocan este comando automáticamente. No crea scaffolds,
no cambia estados y no inicia la tarea siguiente.`);
}

export function main(argv = process.argv.slice(2)) {
  const args = parseArgs(argv);
  if (args.help) return printUsage();
  return autoPrepareCanonicalTask({ checkOnly: args.checkOnly });
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
