import fs from 'node:fs';
import path from 'node:path';
import { fileURLToPath } from 'node:url';

import { derivePreflight } from './canonical-task-preflight.mjs';
import { formatTaskFileSource } from './format-canonical-task.mjs';

function fail(message) {
  throw new Error(message);
}

export function automaticTaskIds(preflight) {
  return [...new Set([
    preflight.continuity.previous,
    preflight.continuity.current,
  ].filter(Boolean))];
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
  const changed = [];
  const checked = [];
  const skipped = [];

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

    if (preflight.task.structure === 'EMPTY_DRAFT') {
      skipped.push({ taskId, reason: 'EMPTY_DRAFT_NO_AUTO_SCAFFOLD' });
      continue;
    }

    const ownerPath = path.join(baseDir, preflight.task.owner);
    const raw = fs.readFileSync(ownerPath, 'utf8');
    const result = formatTaskFileSource(raw, { taskId });
    checked.push(taskId);
    if (result.changedTaskIds.length === 0) continue;
    if (checkOnly) {
      fail(`${taskId} requiere formato canónico; ejecute docs:plan:build para aplicarlo.`);
    }
    writePreservingEol(ownerPath, raw, result.source);
    changed.push(taskId);
  }

  console.log(
    `[PLAN CANÓNICO] Preparación automática: ${checked.length} tarea(s) revisadas; `
    + `${changed.length} formateadas; ${skipped.length} omitidas de forma segura.`,
  );
  for (const { taskId, reason } of skipped) {
    if (reason === 'EMPTY_DRAFT_NO_AUTO_SCAFFOLD') {
      console.log(`[PLAN CANÓNICO] ${taskId}: borrador vacío preservado; no se inicia automáticamente.`);
    } else {
      console.warn(`[PLAN CANÓNICO] ${taskId}: preparación omitida: ${reason}`);
    }
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
