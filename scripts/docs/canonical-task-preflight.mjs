import fs from 'node:fs';
import path from 'node:path';
import { spawnSync } from 'node:child_process';
import { fileURLToPath } from 'node:url';

import { serializeActiveSequence } from './continuity-route.mjs';
import { readAndResolveExecutionRoute } from './execution-route.mjs';
import {
  buildExecutionSequence,
  expandSequenceSegments,
  readGlobalTaskRegistry,
  resolveContinuity,
} from './plan-continuity-global.mjs';
import { formatTaskFileSource, parseTaskBlocks } from './format-canonical-task.mjs';
import { validateContract } from './validate-task-delivery.mjs';

function fail(message) {
  throw new Error(message);
}

function readJson(filePath, label) {
  if (!fs.existsSync(filePath)) fail(`no existe ${label}: ${filePath}.`);
  return JSON.parse(fs.readFileSync(filePath, 'utf8'));
}

function git(root, args) {
  const result = spawnSync('git', args, { cwd: root, encoding: 'utf8' });
  return result.status === 0 ? result.stdout.trim() : null;
}

export function validatorsForPath(relativePath) {
  const validators = new Set([
    'npm run docs:plan:build',
    'npm run docs:plan:check',
    'npm run docs:plan:test',
    'npm run docs:treq:check',
    'npm run docs:treq:test',
    'git diff --check',
  ]);
  const normalized = relativePath.replace(/\\/gu, '/');
  if (/E2_PROCESOS_Y_EXPERIENCIA|C_CATALOGO/u.test(normalized)) {
    validators.add('npm run docs:process-apps:check');
    validators.add('npm run docs:screens:check');
    validators.add('npm run docs:screen-processes:check');
    validators.add('npm run docs:screen-matrices:check');
  }
  if (/I_NAVEGACION_Y_PANTALLAS/u.test(normalized)) {
    validators.add('npm run docs:block-i:check');
  }
  if (/E3_SUPABASE/u.test(normalized)) validators.add('node scripts/docs/validate-e3-transition-closure.mjs');
  if (/E4_SERVICIOS_TRANSVERSALES/u.test(normalized)) validators.add('npm run docs:print-processes:check');
  if (/X_INTEGRACIONES/u.test(normalized)) {
    validators.add('npm run docs:int-app:check');
    validators.add('npm run docs:int-ext:check');
  }
  return [...validators];
}

export function derivePreflight({ root = process.cwd(), requestedTaskId = null } = {}) {
  const baseDir = path.join(root, 'docs', 'plan-canonico', 'modular');
  const manifest = readJson(path.join(baseDir, 'manifest.json'), 'manifest.json');
  const taskMap = readGlobalTaskRegistry(baseDir, manifest);
  const resolvedConfig = readAndResolveExecutionRoute(baseDir, taskMap);
  const taskIds = Array.isArray(resolvedConfig.task_ids)
    ? resolvedConfig.task_ids
    : expandSequenceSegments(resolvedConfig.segments);
  const continuityMap = new Map(taskMap);
  for (const task of resolvedConfig.virtual_tasks ?? []) continuityMap.set(task.id, task);
  const continuity = resolveContinuity(
    continuityMap,
    buildExecutionSequence({ ...resolvedConfig, taskIds }),
  );
  const currentTaskId = continuity.current?.id ?? null;
  const taskId = requestedTaskId ?? currentTaskId;
  if (!taskId) fail('la ruta está completa y no existe una tarea actual.');
  const task = taskMap.get(taskId);
  if (!task) fail(`${taskId} no es una tarea canónica física disponible para preflight.`);

  const ownerPath = path.join(baseDir, task.relativePath);
  const ownerSource = fs.readFileSync(ownerPath, 'utf8');
  const blocks = parseTaskBlocks(ownerSource).filter(({ id }) => id === taskId);
  if (blocks.length !== 1) fail(`${taskId} debe aparecer exactamente una vez en su archivo propietario.`);
  const sectionCount = blocks[0].block.match(/^####\s+/gmu)?.length ?? 0;
  let formatState = 'OK';
  try {
    const formatted = formatTaskFileSource(ownerSource, { taskId });
    if (formatted.changedTaskIds.length > 0) formatState = 'NEEDS_FORMAT';
  } catch (error) {
    formatState = `ERROR: ${error instanceof Error ? error.message : String(error)}`;
  }

  const contractPath = path.join(baseDir, 'delivery-contract.json');
  const contract = readJson(contractPath, 'delivery-contract.json');
  const contractErrors = validateContract(contract);
  const expectedActiveSource = serializeActiveSequence(resolvedConfig);
  const activePath = path.join(baseDir, 'active-sequence.json');
  const activeSource = fs.readFileSync(activePath, 'utf8').replace(/\r\n?/gu, '\n');
  const worktree = git(root, ['status', '--porcelain']) ?? '';
  const branch = git(root, ['branch', '--show-current']);
  const upstream = git(root, ['rev-parse', '--abbrev-ref', '@{upstream}']);
  const divergenceRaw = upstream
    ? git(root, ['rev-list', '--left-right', '--count', '@{upstream}...HEAD'])
    : null;
  const [behind, ahead] = divergenceRaw?.split(/\s+/u).map(Number) ?? [null, null];

  const warnings = [];
  if (requestedTaskId && requestedTaskId !== currentTaskId) {
    warnings.push(`${requestedTaskId} no es la tarea actual; la continuidad apunta a ${currentTaskId}.`);
  }
  if (worktree) warnings.push('el repositorio contiene cambios locales.');
  if (behind > 0) warnings.push(`la referencia local de upstream contiene ${behind} commit(s) no integrados.`);
  if (ahead > 0) warnings.push(`la rama local contiene ${ahead} commit(s) no publicados.`);
  if (activeSource !== expectedActiveSource) warnings.push('active-sequence.json requiere regeneración.');
  if (formatState !== 'OK') warnings.push(`formato de tarea: ${formatState}.`);
  if (contractErrors.length > 0) warnings.push(`contrato de entrega inválido: ${contractErrors.join('; ')}`);

  return {
    task: {
      id: task.id,
      title: task.title,
      state: task.state,
      owner: task.relativePath.replace(/\\/gu, '/'),
      current: task.id === currentTaskId,
      section_count: sectionCount,
      structure: sectionCount === 0 ? 'EMPTY_DRAFT' : 'DEVELOPED',
      format: formatState,
    },
    continuity: {
      previous: continuity.lastApproved?.id ?? null,
      current: currentTaskId,
      next: continuity.next?.id ?? resolvedConfig.handoff_task_id ?? null,
      route: resolvedConfig.route_id,
      sequence: resolvedConfig.sequence_id,
      active_sequence_current: activeSource === expectedActiveSource,
    },
    repository: {
      branch,
      upstream,
      behind,
      ahead,
      clean: !worktree,
      remote_note: 'La comparación usa la referencia local de upstream; este comando no ejecuta git fetch.',
    },
    delivery_contract: {
      valid: contractErrors.length === 0,
      errors: contractErrors,
    },
    validators: validatorsForPath(task.relativePath),
    warnings,
  };
}

function parseArgs(argv) {
  const args = { taskId: null, json: false, strict: false, help: false };
  for (let index = 0; index < argv.length; index += 1) {
    const token = argv[index];
    if (token === '--json') args.json = true;
    else if (token === '--strict') args.strict = true;
    else if (token === '--help' || token === '-h') args.help = true;
    else if (token === '--task-id') {
      const value = argv[index + 1];
      if (!value || value.startsWith('--')) fail('falta el valor de --task-id.');
      args.taskId = value;
      index += 1;
    } else fail(`argumento desconocido: ${token}.`);
  }
  return args;
}

function printUsage() {
  console.log(`Uso:
  npm run docs:task:preflight
  npm run docs:task:preflight -- --task-id <ID> [--json] [--strict]

El comando es de solo lectura. No hace fetch, no formatea y no cambia continuidad.`);
}

export function main(argv = process.argv.slice(2)) {
  const args = parseArgs(argv);
  if (args.help) return printUsage();
  const result = derivePreflight({ requestedTaskId: args.taskId });
  if (args.json) console.log(JSON.stringify(result, null, 2));
  else {
    console.log(`TAREA: ${result.task.id} — ${result.task.title}`);
    console.log(`ESTADO: ${result.task.state}; estructura ${result.task.structure}; formato ${result.task.format}`);
    console.log(`ARCHIVO: ${result.task.owner}`);
    console.log(`CONTINUIDAD: ${result.continuity.previous} → ${result.continuity.current} → ${result.continuity.next}`);
    console.log(`GIT: ${result.repository.branch}; upstream ${result.repository.upstream ?? 'SIN_UPSTREAM'}; `
      + `behind ${result.repository.behind ?? 'N/A'}; ahead ${result.repository.ahead ?? 'N/A'}; `
      + `${result.repository.clean ? 'LIMPIO' : 'CON CAMBIOS'}`);
    console.log('VALIDADORES:');
    for (const validator of result.validators) console.log(`- ${validator}`);
    if (result.warnings.length > 0) {
      console.log('ADVERTENCIAS:');
      for (const warning of result.warnings) console.log(`- ${warning}`);
    } else console.log('OK: preflight sin advertencias.');
  }
  if (args.strict && result.warnings.length > 0) process.exitCode = 1;
  return result;
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
