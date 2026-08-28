import path from 'node:path';
import { fileURLToPath } from 'node:url';

import { scanPackageReadiness } from './package-readiness-scanner.mjs';
import { finishTask, startTask } from './task-branch-lifecycle.mjs';

const RESULT_START = '=== RESULTADO PARA CHATGPT ===';
const RESULT_END = '=== FIN RESULTADO PARA CHATGPT ===';

export function parseReadinessLifecycleArgs(argv) {
  const args = { mode: null, taskId: null };
  for (let index = 0; index < argv.length; index += 1) {
    const token = argv[index];
    if (!args.mode && ['start', 'finish'].includes(token)) args.mode = token;
    else if (token === '--task-id') {
      args.taskId = argv[index + 1];
      if (!args.taskId) throw new Error('Falta --task-id.');
      index += 1;
    } else throw new Error(`Argumento desconocido: ${token}.`);
  }
  if (!args.mode) throw new Error('Modo requerido: start o finish.');
  if (!args.taskId) throw new Error('Falta --task-id.');
  return args;
}

function captureFinalResult(operation) {
  const original = console.log.bind(console);
  const buffered = [];
  let capturing = false;

  console.log = (...values) => {
    const line = values.map((value) => String(value)).join(' ');
    if (!capturing && line === RESULT_START) {
      capturing = true;
      buffered.push(values);
      return;
    }
    if (capturing) {
      buffered.push(values);
      if (line === RESULT_END) capturing = false;
      return;
    }
    original(...values);
  };

  try {
    operation();
  } finally {
    console.log = original;
  }

  return () => {
    for (const values of buffered) original(...values);
  };
}

function printFailure(mode, error) {
  const message = error instanceof Error ? error.message : String(error);
  console.log('');
  console.log(RESULT_START);
  console.log('ESTADO: FAIL');
  console.log(`OPERACION: ${mode === 'finish' ? 'TASK_FINISH' : 'TASK_START'}`);
  console.log(`PACKAGE_READINESS: FAIL`);
  console.log(`COMPROBACION_FALLIDA: ${message.replace(/[\r\n]+/gu, ' | ')}`);
  console.log(`NEXT_TASK_ALLOWED: NO`);
  console.log(RESULT_END);
}

export function runReadinessTaskLifecycle({ mode, taskId, root = process.cwd() }) {
  if (mode === 'start') {
    scanPackageReadiness({ root, check: true, trigger: 'task-start' });
    startTask({ taskId, root });
    return;
  }

  scanPackageReadiness({ root, write: true, trigger: 'task-finish-premerge' });
  const replayFinalResult = captureFinalResult(() => finishTask({ taskId, root }));
  scanPackageReadiness({ root, check: true, trigger: 'task-finish-postmerge' });
  replayFinalResult();
}

function main() {
  const args = parseReadinessLifecycleArgs(process.argv.slice(2));
  try {
    runReadinessTaskLifecycle(args);
  } catch (error) {
    printFailure(args.mode, error);
    process.exitCode = 1;
  }
}

const isCli = process.argv[1]
  && path.resolve(process.argv[1]) === path.resolve(fileURLToPath(import.meta.url));

if (isCli) main();
