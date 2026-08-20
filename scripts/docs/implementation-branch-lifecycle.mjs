import fs from 'node:fs';
import os from 'node:os';
import path from 'node:path';
import { fileURLToPath } from 'node:url';
import { spawnSync } from 'node:child_process';

import {
  classifyPrChecksProbe,
  classifyTaskPath,
  parsePorcelainPaths,
  resolveNpmInvocation,
} from './task-branch-lifecycle.mjs';
import {
  instanceRecordRelativePath,
  loadImplementationControl,
  validateImplementationControl,
} from './implementation-control.mjs';
import { resolveTaskWorkTopology } from './task-work-topology.mjs';

const DEFAULT_BRANCH = 'main';
const IMPLEMENTATION_PREFIX = 'implementation/';
const RESULT_START = '=== RESULTADO PARA CHATGPT ===';
const RESULT_END = '=== FIN RESULTADO PARA CHATGPT ===';
const CHECK_REGISTRATION_ATTEMPTS = 24;
const CHECK_REGISTRATION_INTERVAL_MS = 5000;
const CHECK_WATCH_INTERVAL_SECONDS = 5;
const MERGE_CONFIRM_ATTEMPTS = 24;
const MERGE_CONFIRM_INTERVAL_MS = 5000;

function fail(message, code = 1) {
  const error = new Error(message);
  error.exitCode = code;
  throw error;
}

export function normalizeInstanceId(value) {
  const raw = String(value ?? '').trim();
  const match = /^([A-Za-z0-9]+(?:-[A-Za-z0-9]+)*-[0-9]{3,4})::([A-Za-z0-9][A-Za-z0-9._-]*)$/u.exec(raw);
  if (!match) {
    fail(`INSTANCE_ID invalido: ${raw || 'VACIO'}.`);
  }
  return `${match[1].toUpperCase()}::${match[2]}`;
}

export function implementationBranchName(instanceId) {
  const normalized = normalizeInstanceId(instanceId);
  const separator = normalized.indexOf('::');
  const taskId = normalized.slice(0, separator).toLowerCase();
  const instanceKey = normalized.slice(separator + 2).toLowerCase();
  return `${IMPLEMENTATION_PREFIX}${taskId}/${instanceKey}`;
}

function run(command, args, {
  cwd = process.cwd(),
  allowFailure = false,
  inherit = false,
  env = process.env,
} = {}) {
  const result = spawnSync(command, args, {
    cwd,
    encoding: 'utf8',
    windowsHide: true,
    env,
    stdio: inherit ? 'inherit' : ['ignore', 'pipe', 'pipe'],
  });

  if (result.error) {
    if (allowFailure) return { status: 1, stdout: '', stderr: result.error.message };
    fail(`${command} no disponible: ${result.error.message}`);
  }

  const status = Number.isInteger(result.status) ? result.status : 1;
  const stdout = inherit ? '' : String(result.stdout ?? '').trimEnd();
  const stderr = inherit ? '' : String(result.stderr ?? '').trimEnd();

  if (status !== 0 && !allowFailure) {
    fail(stderr || stdout || `${command} ${args.join(' ')} fallo.`, status);
  }

  return { status, stdout, stderr };
}

function git(args, options = {}) {
  return run('git', args, options);
}

function gh(args, options = {}) {
  return run('gh', args, options);
}

function npm(args, options = {}) {
  const invocation = resolveNpmInvocation();
  return run(invocation.command, [...invocation.prefixArgs, ...args], options);
}

function sleep(milliseconds) {
  const delay = Number(milliseconds);
  if (!Number.isFinite(delay) || delay <= 0) return;
  Atomics.wait(new Int32Array(new SharedArrayBuffer(4)), 0, 0, delay);
}

function ensureRepositoryRoot() {
  const root = git(['rev-parse', '--show-toplevel']).stdout.trim();
  if (!root) fail('No se pudo resolver la raiz Git.');
  return root;
}

function currentBranch(root) {
  return git(['branch', '--show-current'], { cwd: root }).stdout.trim();
}

function currentHead(root) {
  return git(['rev-parse', 'HEAD'], { cwd: root }).stdout.trim();
}

function worktreePaths(root) {
  return parsePorcelainPaths(
    git(['status', '--porcelain=v1', '--untracked-files=all'], { cwd: root }).stdout,
  );
}

function syncCounts(root, left, right) {
  const raw = git(['rev-list', '--left-right', '--count', `${left}...${right}`], { cwd: root }).stdout.trim();
  const [behind, ahead] = raw.split(/\s+/u).map(Number);
  return { behind: Number(behind), ahead: Number(ahead), raw };
}

function ensureGhReady(root) {
  const version = gh(['--version'], { cwd: root, allowFailure: true });
  if (version.status !== 0) fail('GitHub CLI gh no esta disponible en PATH.');
  const auth = gh(['auth', 'status'], { cwd: root, allowFailure: true });
  if (auth.status !== 0) fail(auth.stderr || auth.stdout || 'gh no esta autenticado.');
}

function remoteBranchExists(root, branch) {
  return git(['ls-remote', '--exit-code', '--heads', 'origin', `refs/heads/${branch}`], {
    cwd: root,
    allowFailure: true,
  }).status === 0;
}

function localBranchExists(root, branch) {
  return git(['show-ref', '--verify', '--quiet', `refs/heads/${branch}`], {
    cwd: root,
    allowFailure: true,
  }).status === 0;
}

function parseJsonOutput(source, label) {
  const text = String(source ?? '').trim();
  if (!text) fail(`${label}: salida JSON vacia.`);
  try {
    return JSON.parse(text);
  } catch {
    const start = text.indexOf('{');
    const end = text.lastIndexOf('}');
    if (start >= 0 && end > start) {
      try {
        return JSON.parse(text.slice(start, end + 1));
      } catch {
        // handled below
      }
    }
    fail(`${label}: no se pudo interpretar JSON.`);
  }
}

function printResult(fields) {
  console.log('');
  console.log(RESULT_START);
  for (const [key, value] of Object.entries(fields)) {
    console.log(`${key}: ${value}`);
  }
  console.log(RESULT_END);
}

function loadValidatedControl(root) {
  const topology = resolveTaskWorkTopology({ root });
  return validateImplementationControl(loadImplementationControl({ root }), topology);
}

function resolveInstance(root, instanceId) {
  const id = normalizeInstanceId(instanceId);
  const control = loadValidatedControl(root);
  const instance = control.instances.find((entry) => entry.instance_id === id) ?? null;
  if (!instance) fail(`${id} no existe en implementation-instances.`);
  return { id, instance, control };
}

export function assertInstanceCanStart(instance) {
  if (!instance || typeof instance !== 'object') fail('Instancia fisica invalida.');
  if (instance.status !== 'AUTHORIZED') {
    fail(`${instance.instance_id ?? 'INSTANCIA'} debe estar AUTHORIZED antes de docs:implementation:start; estado actual: ${instance.status ?? 'DESCONOCIDO'}.`);
  }
  if (!instance.authorization || instance.authorization.decision !== 'APPROVED') {
    fail(`${instance.instance_id} no conserva authorization APPROVED.`);
  }
  return true;
}

export function assertInstanceCanFinish(instance) {
  if (!instance || typeof instance !== 'object') fail('Instancia fisica invalida.');
  if (instance.status !== 'VERIFIED') {
    fail(`${instance.instance_id ?? 'INSTANCIA'} debe estar VERIFIED antes de docs:implementation:finish; estado actual: ${instance.status ?? 'DESCONOCIDO'}.`);
  }
  if (!Array.isArray(instance.evidence) || instance.evidence.length === 0) {
    fail(`${instance.instance_id} no puede cerrarse sin evidence consolidada.`);
  }
  return true;
}

export function classifyImplementationPath(filePath) {
  const normalized = String(filePath ?? '').replaceAll('\\', '/').replace(/^\.\//u, '');
  if (!normalized) return 'OTHER';
  if (classifyTaskPath(normalized) !== 'ALLOWED') return 'OTHER';
  if (normalized.startsWith('docs/plan-canonico/modular/') && /(?:^|\/)04A_/u.test(normalized)) {
    return 'TREQ_REGISTRY';
  }
  return 'ALLOWED';
}

function ensureImplementationPaths(paths) {
  const treqPaths = paths.filter((entry) => classifyImplementationPath(entry) === 'TREQ_REGISTRY');
  if (treqPaths.length > 0) {
    fail(`El cierre fisico no puede modificar el registro 04A/TREQ: ${treqPaths.join(', ')}.`);
  }
  const unknown = paths.filter((entry) => classifyImplementationPath(entry) === 'OTHER');
  if (unknown.length > 0) {
    fail(`Hay archivos fuera del alcance automatizable de implementacion: ${unknown.join(', ')}.`);
  }
}

export function assertStartWorktree(paths, recordPath) {
  const normalized = [...new Set((paths ?? []).map((entry) => String(entry).replaceAll('\\', '/')))].sort();
  if (normalized.length !== 1 || normalized[0] !== recordPath) {
    fail(
      `docs:implementation:start exige que el unico cambio local sea ${recordPath}; cambios actuales: ${normalized.join(', ') || 'NINGUNO'}.`,
    );
  }
  return true;
}

function writeInstanceStatus(root, instanceId, status) {
  const { instance } = resolveInstance(root, instanceId);
  const recordPath = instanceRecordRelativePath(instanceId);
  const absolute = path.join(root, ...recordPath.split('/'));
  const next = { ...instance, status };
  fs.writeFileSync(absolute, `${JSON.stringify(next, null, 2)}\n`, 'utf8');
  return next;
}

function physicalPreflight(root, instanceId) {
  const result = npm([
    'run', '--silent', 'docs:task:preflight', '--',
    '--instance-id', instanceId,
    '--json',
    '--strict',
  ], { cwd: root, allowFailure: true });

  const report = result.stdout.trim()
    ? parseJsonOutput(result.stdout, 'docs:task:preflight')
    : null;

  if (result.status !== 0) {
    const detail = report?.blockers?.join(' | ') || result.stderr || result.stdout || 'Preflight fisico fallo.';
    fail(detail, result.status);
  }
  if (!report?.instance || report.instance.id !== instanceId || report.instance.status !== 'IN_PROGRESS') {
    fail(`Preflight no confirmo ${instanceId} en IN_PROGRESS.`);
  }
  if (Array.isArray(report.blockers) && report.blockers.length > 0) {
    fail(`Preflight bloqueado: ${report.blockers.join(' | ')}.`);
  }
  return report;
}

function ensureBranchReadyForStart(root, branch) {
  const startingBranch = currentBranch(root);
  if (![DEFAULT_BRANCH, branch].includes(startingBranch)) {
    fail(`IMPLEMENTATION_START debe ejecutarse desde ${DEFAULT_BRANCH} o ${branch}; rama actual: ${startingBranch || 'DETACHED'}.`);
  }

  if (startingBranch === DEFAULT_BRANCH) {
    const mainSync = syncCounts(root, `origin/${DEFAULT_BRANCH}`, 'HEAD');
    if (mainSync.behind !== 0 || mainSync.ahead !== 0) {
      fail(`main debe estar sincronizado 0/0 antes de iniciar implementacion: ${mainSync.raw}.`);
    }

    const remoteExists = remoteBranchExists(root, branch);
    const localExists = localBranchExists(root, branch);

    if (remoteExists) {
      git(['fetch', 'origin', branch, '--quiet'], { cwd: root });
      if (localExists) {
        git(['switch', branch], { cwd: root });
        git(['branch', '--set-upstream-to', `origin/${branch}`, branch], { cwd: root });
      } else {
        git(['switch', '-c', branch, '--track', `origin/${branch}`], { cwd: root });
      }
      const sync = syncCounts(root, `origin/${branch}`, 'HEAD');
      if (sync.behind !== 0 || sync.ahead !== 0) {
        fail(`La rama existente ${branch} no esta sincronizada 0/0: ${sync.raw}.`);
      }
      return 'RESUMED_REMOTE';
    }

    if (localExists) {
      git(['switch', branch], { cwd: root });
      git(['push', '-u', 'origin', branch], { cwd: root });
      return 'RESUMED_LOCAL';
    }

    git(['switch', '-c', branch], { cwd: root });
    git(['push', '-u', 'origin', branch], { cwd: root });
    return 'CREATED';
  }

  if (!remoteBranchExists(root, branch)) {
    git(['push', '-u', 'origin', branch], { cwd: root });
    return 'RESUMED_LOCAL';
  }

  const sync = syncCounts(root, `origin/${branch}`, 'HEAD');
  if (sync.behind !== 0 || sync.ahead !== 0) {
    fail(`La rama ${branch} no esta sincronizada 0/0 antes del preflight: ${sync.raw}.`);
  }
  return 'RESUMED';
}

export function startImplementation({ instanceId, root = ensureRepositoryRoot() }) {
  const { id, instance } = resolveInstance(root, instanceId);
  assertInstanceCanStart(instance);

  const recordPath = instanceRecordRelativePath(id);
  const branch = implementationBranchName(id);

  ensureGhReady(root);
  git(['fetch', 'origin', DEFAULT_BRANCH, '--quiet'], { cwd: root });
  assertStartWorktree(worktreePaths(root), recordPath);

  const branchMode = ensureBranchReadyForStart(root, branch);
  assertStartWorktree(worktreePaths(root), recordPath);

  writeInstanceStatus(root, id, 'IN_PROGRESS');
  const report = physicalPreflight(root, id);

  printResult({
    ESTADO: 'PASS',
    OPERACION: 'IMPLEMENTATION_START',
    INSTANCE_ID: id,
    TASK_ID: instance.task_id,
    BRANCH: branch,
    BRANCH_MODE: branchMode,
    INSTANCE_STATUS: 'IN_PROGRESS',
    PREFLIGHT: 'PASS',
    VALIDATION_COMMANDS: Array.isArray(instance.validation_commands) ? instance.validation_commands.length : 0,
    REMOTE_BRANCH: 'PUBLISHED',
    SYNC_REMOTE: '0/0',
    DOCUMENTAL_CURRENT_TASK: report.continuity?.current ?? 'NINGUNA',
    READY_TO_IMPLEMENT: 'SI',
  });
}

function waitForPrChecksToRegister(root, prNumber) {
  for (let attempt = 1; attempt <= CHECK_REGISTRATION_ATTEMPTS; attempt += 1) {
    const probe = gh([
      'pr', 'checks', String(prNumber),
      '--json', 'name,state,bucket,link',
    ], { cwd: root, allowFailure: true });
    const classification = classifyPrChecksProbe(probe);
    if (classification.state === 'REGISTERED') return classification.count;
    if (classification.state === 'ERROR') {
      fail(`No se pudieron consultar checks de PR #${prNumber}: ${classification.detail}`, probe.status);
    }
    if (attempt < CHECK_REGISTRATION_ATTEMPTS) sleep(CHECK_REGISTRATION_INTERVAL_MS);
  }
  fail(`PR #${prNumber} no registro checks; cierre detenido antes del merge.`);
}

function readOpenPrState(root, prNumber) {
  return parseJsonOutput(
    gh([
      'pr', 'view', String(prNumber),
      '--json', 'number,state,isDraft,mergeable,headRefOid,baseRefName',
    ], { cwd: root }).stdout,
    'gh pr view',
  );
}

function ensureOpenPrIdentity(prState, prNumber, headSha) {
  if (prState.state !== 'OPEN') fail(`PR #${prNumber} no esta OPEN; estado: ${prState.state}.`);
  if (prState.isDraft) fail(`PR #${prNumber} sigue en draft.`);
  if (prState.baseRefName !== DEFAULT_BRANCH) fail(`PR #${prNumber} no apunta a ${DEFAULT_BRANCH}.`);
  if (prState.headRefOid !== headSha) fail(`PR #${prNumber} no apunta al HEAD validado ${headSha}.`);
  if (!['MERGEABLE', 'UNKNOWN'].includes(String(prState.mergeable ?? '').toUpperCase())) {
    fail(`PR #${prNumber} no es mergeable: ${prState.mergeable}.`);
  }
}

function waitForPrMerged(root, prNumber, headSha) {
  for (let attempt = 1; attempt <= MERGE_CONFIRM_ATTEMPTS; attempt += 1) {
    const state = parseJsonOutput(
      gh([
        'pr', 'view', String(prNumber),
        '--json', 'state,mergedAt,mergeCommit,headRefOid',
      ], { cwd: root }).stdout,
      'gh pr view merged',
    );

    if (state.headRefOid !== headSha) {
      fail(`PR #${prNumber} cambio de HEAD durante el merge.`);
    }
    if (state.state === 'MERGED') {
      const mergeCommitSha = String(state.mergeCommit?.oid ?? '').trim();
      if (!state.mergedAt || !mergeCommitSha) fail(`PR #${prNumber} figura MERGED sin evidencia completa.`);
      return { ...state, mergeCommitSha };
    }
    if (state.state === 'CLOSED') fail(`PR #${prNumber} fue cerrado sin merge.`);
    if (attempt < MERGE_CONFIRM_ATTEMPTS) sleep(MERGE_CONFIRM_INTERVAL_MS);
  }
  fail(`PR #${prNumber} no confirmo estado MERGED.`);
}

export function buildImplementationPrBody(instanceId, changedPaths) {
  const id = normalizeInstanceId(instanceId);
  const paths = [...new Set((changedPaths ?? []).map((entry) => String(entry).replaceAll('\\', '/')))].sort();
  ensureImplementationPaths(paths);
  return [
    'VENTO-TREQ-AFFECTED: NONE',
    `VENTO-TREQ-ZERO-REASON: ${id} cierra una instancia fisica ya gobernada por requisitos TREQ y este lifecycle bloquea cambios directos al registro 04A.`,
    '',
    '## Instancia fisica',
    '',
    id,
    '',
    '## Archivos',
    '',
    ...paths.map((entry) => `- ${entry}`),
    '',
  ].join('\n');
}

function createOrUpdatePr(root, instanceId, branch, changedPaths) {
  const list = gh([
    'pr', 'list',
    '--head', branch,
    '--base', DEFAULT_BRANCH,
    '--state', 'open',
    '--json', 'number,url,headRefOid',
    '--limit', '1',
  ], { cwd: root });
  const existing = parseJsonOutput(list.stdout || '[]', 'gh pr list');

  const tempDir = fs.mkdtempSync(path.join(os.tmpdir(), 'vento-implementation-pr-'));
  const bodyPath = path.join(tempDir, 'body.md');
  fs.writeFileSync(bodyPath, buildImplementationPrBody(instanceId, changedPaths), 'utf8');

  try {
    if (Array.isArray(existing) && existing.length > 0) {
      const pr = existing[0];
      gh([
        'pr', 'edit', String(pr.number),
        '--title', `${instanceId}: cierre de implementacion`,
        '--body-file', bodyPath,
      ], { cwd: root });
      return Number(pr.number);
    }

    gh([
      'pr', 'create',
      '--base', DEFAULT_BRANCH,
      '--head', branch,
      '--title', `${instanceId}: cierre de implementacion`,
      '--body-file', bodyPath,
    ], { cwd: root });

    const created = gh([
      'pr', 'list',
      '--head', branch,
      '--base', DEFAULT_BRANCH,
      '--state', 'open',
      '--json', 'number,url,headRefOid',
      '--limit', '1',
    ], { cwd: root });
    const rows = parseJsonOutput(created.stdout || '[]', 'gh pr list post-create');
    if (!Array.isArray(rows) || rows.length !== 1) fail('No se pudo resolver el PR creado.');
    return Number(rows[0].number);
  } finally {
    fs.rmSync(tempDir, { recursive: true, force: true });
  }
}

function cleanupBranch(root, branch) {
  if (remoteBranchExists(root, branch)) {
    git(['push', 'origin', '--delete', branch], { cwd: root, allowFailure: true });
  }
  if (localBranchExists(root, branch)) {
    git(['branch', '-d', branch], { cwd: root, allowFailure: true });
  }

  const remoteRemaining = remoteBranchExists(root, branch);
  const localRemaining = localBranchExists(root, branch);
  if (remoteRemaining || localRemaining) {
    fail(`No se pudo limpiar ${branch}: local=${localRemaining}, remote=${remoteRemaining}.`);
  }
  return { local: 'DELETED', remote: 'DELETED' };
}

export function finishImplementation({ instanceId, root = ensureRepositoryRoot() }) {
  const { id, instance } = resolveInstance(root, instanceId);
  assertInstanceCanFinish(instance);

  const branch = implementationBranchName(id);
  if (currentBranch(root) !== branch) {
    fail(`IMPLEMENTATION_FINISH debe ejecutarse desde ${branch}; rama actual: ${currentBranch(root) || 'DETACHED'}.`);
  }

  ensureGhReady(root);
  git(['fetch', 'origin', DEFAULT_BRANCH, '--quiet'], { cwd: root });

  npm(['run', '--silent', 'docs:plan:build'], { cwd: root });

  const dirty = worktreePaths(root);
  if (dirty.length === 0) {
    fail('IMPLEMENTATION_FINISH no encontro cambios para cerrar despues de docs:plan:build.');
  }
  ensureImplementationPaths(dirty);

  git(['diff', '--check'], { cwd: root });
  git(['add', '--', ...dirty], { cwd: root });
  npm(['run', '--silent', 'docs:commit-scope:check', '--', '--staged'], { cwd: root });
  git(['diff', '--cached', '--check'], { cwd: root });

  const staged = git(['diff', '--cached', '--name-only', '--diff-filter=ACMRD'], { cwd: root })
    .stdout.split(/\r?\n/u).map((entry) => entry.trim()).filter(Boolean);
  ensureImplementationPaths(staged);
  if (staged.length === 0) fail('No hay archivos staged para cerrar la implementacion.');

  git(['commit', '-m', `implementation(${id}): verify`], { cwd: root });

  const branchCommits = Number(
    git(['rev-list', '--count', `origin/${DEFAULT_BRANCH}..HEAD`], { cwd: root }).stdout.trim(),
  );
  if (!Number.isFinite(branchCommits) || branchCommits <= 0) {
    fail(`${branch} no contiene commits nuevos respecto de origin/${DEFAULT_BRANCH}.`);
  }

  const changedPaths = git(['diff', '--name-only', `origin/${DEFAULT_BRANCH}...HEAD`], { cwd: root })
    .stdout.split(/\r?\n/u).map((entry) => entry.trim()).filter(Boolean);
  ensureImplementationPaths(changedPaths);

  git(['push', '-u', 'origin', branch], { cwd: root });
  const branchSync = syncCounts(root, `origin/${branch}`, 'HEAD');
  if (branchSync.behind !== 0 || branchSync.ahead !== 0) {
    fail(`Push incompleto de ${branch}: ${branchSync.raw}.`);
  }

  const headSha = currentHead(root);
  const prNumber = createOrUpdatePr(root, id, branch, changedPaths);

  let prState = readOpenPrState(root, prNumber);
  ensureOpenPrIdentity(prState, prNumber, headSha);

  const registeredCheckCount = waitForPrChecksToRegister(root, prNumber);
  gh([
    'pr', 'checks', String(prNumber),
    '--watch',
    '--fail-fast',
    '--interval', String(CHECK_WATCH_INTERVAL_SECONDS),
  ], { cwd: root, inherit: true });

  prState = readOpenPrState(root, prNumber);
  ensureOpenPrIdentity(prState, prNumber, headSha);

  gh([
    'pr', 'merge', String(prNumber),
    '--merge',
    '--match-head-commit', headSha,
  ], { cwd: root });

  const merged = waitForPrMerged(root, prNumber, headSha);

  git(['fetch', 'origin', DEFAULT_BRANCH, '--quiet'], { cwd: root });
  git(['switch', DEFAULT_BRANCH], { cwd: root });
  git(['pull', '--ff-only', 'origin', DEFAULT_BRANCH], { cwd: root });

  if (worktreePaths(root).length > 0) fail('main no quedo limpio despues del merge.');
  const mainSync = syncCounts(root, `origin/${DEFAULT_BRANCH}`, 'HEAD');
  if (mainSync.behind !== 0 || mainSync.ahead !== 0) {
    fail(`main no quedo sincronizado 0/0: ${mainSync.raw}.`);
  }

  const validatedHeadInMain = git(
    ['merge-base', '--is-ancestor', headSha, 'HEAD'],
    { cwd: root, allowFailure: true },
  );
  if (validatedHeadInMain.status !== 0) {
    fail(`El HEAD validado ${headSha} no quedo contenido en main.`);
  }

  const mergeCommitInMain = git(
    ['merge-base', '--is-ancestor', merged.mergeCommitSha, 'HEAD'],
    { cwd: root, allowFailure: true },
  );
  if (mergeCommitInMain.status !== 0) {
    fail(`El merge commit ${merged.mergeCommitSha} no quedo contenido en main.`);
  }

  const cleanup = cleanupBranch(root, branch);
  if (worktreePaths(root).length > 0) fail('El worktree final no quedo limpio.');

  const finalSync = syncCounts(root, `origin/${DEFAULT_BRANCH}`, 'HEAD');
  if (finalSync.behind !== 0 || finalSync.ahead !== 0) {
    fail(`main perdio sincronizacion al final: ${finalSync.raw}.`);
  }

  printResult({
    ESTADO: 'PASS',
    OPERACION: 'IMPLEMENTATION_FINISH',
    INSTANCE_ID: id,
    TASK_ID: instance.task_id,
    BRANCH: branch,
    FILES: changedPaths.length,
    PHYSICAL_VALIDATIONS: 'REUSED_FROM_VERIFIED_EVIDENCE',
    DOCS_PLAN_BUILD: 'PASS_ONCE',
    HEAD_VALIDATED: headSha,
    PR: prNumber,
    CHECKS_REGISTERED: registeredCheckCount,
    REQUIRED_CHECKS: 'PASS',
    MERGE: 'PASS',
    MERGE_COMMIT: merged.mergeCommitSha,
    MAIN_HEAD: currentHead(root),
    SYNC_MAIN: '0/0',
    WORKTREE: 'CLEAN',
    LOCAL_BRANCH: cleanup.local,
    REMOTE_BRANCH: cleanup.remote,
    READY_TO_RESTART_WATCHER: 'SI',
  });
}

function parseArgs(argv) {
  const args = { mode: null, instanceId: null, help: false };
  if (argv.length > 0 && !argv[0].startsWith('--')) {
    args.mode = argv[0];
    argv = argv.slice(1);
  }
  for (let index = 0; index < argv.length; index += 1) {
    const token = argv[index];
    if (token === '--help' || token === '-h') args.help = true;
    else if (token === '--instance-id') {
      const value = argv[index + 1];
      if (!value || value.startsWith('--')) fail('Falta valor de --instance-id.');
      args.instanceId = value;
      index += 1;
    } else fail(`Argumento desconocido: ${token}.`);
  }
  return args;
}

function usage() {
  console.log('Uso:');
  console.log('  npm run docs:implementation:start -- --instance-id SHELL-CON-001::GLOBAL');
  console.log('  npm run docs:implementation:finish -- --instance-id SHELL-CON-001::GLOBAL');
  console.log('');
  console.log('START exige registro AUTHORIZED, crea o recupera implementation/<task-id>/<instance-key>, cambia a IN_PROGRESS y ejecuta el preflight fisico estricto una sola vez.');
  console.log('FINISH exige VERIFIED, ejecuta docs:plan:build una sola vez, valida el commit, publica, espera CI, mergea, sincroniza main y limpia la rama.');
}

function main() {
  const args = parseArgs(process.argv.slice(2));
  if (args.help) {
    usage();
    return;
  }
  if (!['start', 'finish'].includes(args.mode)) fail('Modo requerido: start o finish.');
  if (!args.instanceId) fail('Falta --instance-id.');

  if (args.mode === 'start') startImplementation({ instanceId: args.instanceId });
  else finishImplementation({ instanceId: args.instanceId });
}

const isCli = process.argv[1]
  && path.resolve(process.argv[1]) === path.resolve(fileURLToPath(import.meta.url));

if (isCli) {
  try {
    main();
  } catch (error) {
    const message = error instanceof Error ? error.message : String(error);
    const code = Number.isInteger(error?.exitCode) ? error.exitCode : 1;
    const mode = process.argv[2];
    const instanceArgIndex = process.argv.indexOf('--instance-id');
    const instanceId = instanceArgIndex >= 0 ? process.argv[instanceArgIndex + 1] : 'DESCONOCIDA';
    printResult({
      ESTADO: 'FAIL',
      OPERACION: mode === 'finish' ? 'IMPLEMENTATION_FINISH' : 'IMPLEMENTATION_START',
      INSTANCE_ID: instanceId || 'DESCONOCIDA',
      ERROR: message.replace(/\s+/gu, ' ').trim(),
      WORKTREE_PRESERVED: 'SI',
      TERMINAL_REMAINS_OPEN: 'SI',
    });
    process.exitCode = code;
  }
}