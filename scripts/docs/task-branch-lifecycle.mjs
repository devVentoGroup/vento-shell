import fs from 'node:fs';
import os from 'node:os';
import path from 'node:path';
import { fileURLToPath } from 'node:url';
import { spawnSync } from 'node:child_process';

const DEFAULT_BRANCH = 'main';
const TASK_PREFIX = 'task/';
const RESULT_START = '=== RESULTADO PARA CHATGPT ===';
const RESULT_END = '=== FIN RESULTADO PARA CHATGPT ===';

function fail(message, code = 1) {
  const error = new Error(message);
  error.exitCode = code;
  throw error;
}

function normalizeTaskId(value) {
  const taskId = String(value ?? '').trim().toUpperCase();
  if (!/^[A-Z0-9]+(?:-[A-Z0-9]+)*-[0-9]{3,4}$/u.test(taskId)) {
    fail(`TASK_ID invalido: ${value || 'VACIO'}.`);
  }
  return taskId;
}

export function taskBranchName(taskId) {
  return `${TASK_PREFIX}${normalizeTaskId(taskId).toLowerCase()}`;
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

export function resolveNpmInvocation({
  platform = process.platform,
  execPath = process.execPath,
  npmExecPath = process.env.npm_execpath,
  comspec = process.env.ComSpec || process.env.COMSPEC || 'cmd.exe',
} = {}) {
  const cliPath = String(npmExecPath ?? '').trim();

  if (cliPath) {
    return {
      command: execPath,
      prefixArgs: [cliPath],
    };
  }

  if (platform === 'win32') {
    return {
      command: comspec,
      prefixArgs: ['/d', '/s', '/c', 'npm.cmd'],
    };
  }

  return {
    command: 'npm',
    prefixArgs: [],
  };
}

function npm(args, options = {}) {
  const invocation = resolveNpmInvocation();
  return run(
    invocation.command,
    [...invocation.prefixArgs, ...args],
    options,
  );
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

export function parsePorcelainPaths(source) {
  const paths = [];
  for (const line of String(source ?? '').split(/\r?\n/u)) {
    if (!line.trim()) continue;
    const payload = line.length >= 4 ? line.slice(3).trim() : line.trim();
    const candidate = payload.includes(' -> ') ? payload.split(' -> ').at(-1) : payload;
    const normalized = String(candidate ?? '').replace(/^"|"$/gu, '').replaceAll('\\', '/');
    if (normalized) paths.push(normalized);
  }
  return [...new Set(paths)].sort((left, right) => left.localeCompare(right, 'en'));
}

function worktreePaths(root) {
  return parsePorcelainPaths(
    git(['status', '--porcelain=v1', '--untracked-files=all'], { cwd: root }).stdout,
  );
}

function ensureClean(root, label) {
  const paths = worktreePaths(root);
  if (paths.length > 0) {
    fail(`${label}: worktree no limpio: ${paths.join(', ')}`);
  }
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

function taskPreflight(root, taskId, { strict = false } = {}) {
  const args = [
    'run', '--silent', 'docs:task:preflight', '--',
    '--task-id', taskId,
    '--json',
  ];
  if (strict) args.push('--strict');
  const result = npm(args, { cwd: root, allowFailure: !strict });
  if (strict && result.status !== 0) fail(result.stderr || result.stdout || 'Preflight fallo.', result.status);
  const report = parseJsonOutput(result.stdout, 'docs:task:preflight');
  return { report, status: result.status };
}

function ensureTaskCanStart(root, taskId) {
  const { report, status } = taskPreflight(root, taskId, { strict: true });
  if (status !== 0) fail(`Preflight de ${taskId} fallo.`, status);
  if (report?.task?.id !== taskId || report?.task?.current !== true) {
    fail(`${taskId} no es la tarea documental actual.`);
  }
  if (Array.isArray(report.blockers) && report.blockers.length > 0) {
    fail(`Preflight bloqueado: ${report.blockers.join(' | ')}`);
  }
  return report;
}

function ensureTaskCanFinish(root, taskId) {
  const { report } = taskPreflight(root, taskId, { strict: false });
  if (report?.task?.id !== taskId) fail(`No se pudo resolver ${taskId}.`);
  if (String(report?.task?.state ?? '').toUpperCase() !== 'APROBADA') {
    fail(`${taskId} debe estar APROBADA antes de finish; estado: ${report?.task?.state ?? 'DESCONOCIDO'}.`);
  }
  if (report?.continuity?.previous !== taskId) {
    fail(`La continuidad no reconoce ${taskId} como ultima tarea aprobada.`);
  }
  if (report?.continuity?.active_sequence_current !== true) {
    fail('active-sequence.json no esta sincronizado; ejecute el cierre documental antes de finish.');
  }
  return report;
}

export function classifyTaskPath(filePath) {
  const normalized = String(filePath ?? '').replaceAll('\\', '/').replace(/^\.\//u, '');
  if (!normalized) return 'OTHER';
  if (
    normalized === 'AGENTS.md'
    || normalized === 'package.json'
    || normalized === 'package-lock.json'
    || normalized.startsWith('scripts/docs/')
    || normalized.startsWith('scripts/quality/')
    || normalized.startsWith('quality/')
    || normalized.startsWith('.github/')
    || normalized.startsWith('.vscode/')
    || normalized.startsWith('docs/plan-canonico/modular/')
    || normalized.startsWith('src/')
    || normalized.startsWith('packages/')
    || normalized.startsWith('supabase/')
    || normalized.startsWith('templates/')
  ) return 'ALLOWED';
  return 'OTHER';
}

function ensureNoUnknownPaths(paths) {
  const unknown = paths.filter((entry) => classifyTaskPath(entry) === 'OTHER');
  if (unknown.length > 0) {
    fail(`Hay archivos fuera del alcance automatizable: ${unknown.join(', ')}`);
  }
}

function escapeRegex(value) {
  return String(value).replace(/[.*+?^${}()|[\]\\]/gu, '\\$&');
}

export function parseTaskTreqDeclaration(ownerSource, taskId) {
  const escaped = escapeRegex(normalizeTaskId(taskId));
  const startPattern = new RegExp(
    `^###\\s+(?:✅|\\[[^\\]]+\\])\\s+${escaped}\\s+—[^\\n]*$`,
    'mu',
  );
  const start = startPattern.exec(ownerSource);
  if (!start) fail(`No se encontro el bloque de ${taskId}.`);

  const afterStart = ownerSource.slice(start.index + start[0].length);
  const next = /^###\s+(?:✅|\[[^\]]+\])\s+[A-Z0-9]+(?:-[A-Z0-9]+)+\s+—[^\n]*$/mu.exec(afterStart);
  const block = next ? afterStart.slice(0, next.index) : afterStart;

  const metadata = block.match(/^\*\*Requisitos de prueba creados o modificados:\*\*\s*(\d+)\s*$/imu);
  if (!metadata) fail(`${taskId}: falta metadata de requisitos de prueba creados o modificados.`);
  const declaredCount = Number(metadata[1]);

  const section = block.match(
    /^####\s+\d+\.\s+Requisitos de prueba derivados\s*$([\s\S]*?)(?=^####\s+\d+\.|(?![\s\S]))/imu,
  )?.[1] ?? '';
  const ids = [...new Set(section.match(/\bTREQ-[A-Z0-9-]+\b/gu) ?? [])].sort();

  if (declaredCount === 0 && ids.length > 0) {
    fail(`${taskId}: declara 0 TREQ pero la seccion derivada contiene ${ids.join(', ')}.`);
  }
  if (declaredCount > 0 && ids.length === 0) {
    fail(`${taskId}: declara ${declaredCount} TREQ pero no hay IDs en la seccion derivada.`);
  }
  if (declaredCount > 0 && ids.length !== declaredCount) {
    fail(`${taskId}: declara ${declaredCount} TREQ pero se resolvieron ${ids.length}: ${ids.join(', ')}.`);
  }

  return { declaredCount, ids };
}

export function buildPrBody(taskId, treqDeclaration) {
  const id = normalizeTaskId(taskId);
  if (treqDeclaration.ids.length === 0) {
    return [
      'VENTO-TREQ-AFFECTED: NONE',
      `VENTO-TREQ-ZERO-REASON: ${id} declara 0 requisitos TREQ creados o modificados y no altera el registro canonico.`,
      '',
      '## Tarea',
      '',
      id,
      '',
      'Cierre automatizado por docs:task:finish despues de validacion local y antes de avanzar a la siguiente tarea.',
      '',
    ].join('\n');
  }

  return [
    `VENTO-TREQ-AFFECTED: ${treqDeclaration.ids.join(',')}`,
    '',
    '## Tarea',
    '',
    id,
    '',
    'Cierre automatizado por docs:task:finish despues de validacion local y antes de avanzar a la siguiente tarea.',
    '',
  ].join('\n');
}

export function resolveCanonicalOwnerRelativePath(owner) {
  const raw = String(owner ?? '').trim().replaceAll('\\', '/').replace(/^\.\/+/u, '');
  if (!raw) fail('El preflight no devolvio archivo propietario.');

  const prefix = 'docs/plan-canonico/modular/';
  const relative = raw.startsWith(prefix) ? raw.slice(prefix.length) : raw;
  const normalized = path.posix.normalize(relative);

  if (
    !normalized
    || normalized === '.'
    || normalized === '..'
    || normalized.startsWith('../')
    || path.posix.isAbsolute(normalized)
  ) {
    fail(`Ruta de archivo propietario invalida: ${owner}.`);
  }

  return `${prefix}${normalized}`;
}

function readTreqDeclaration(root, report, taskId) {
  const owner = report?.task?.owner;
  if (!owner) fail(`${taskId}: preflight no devolvio archivo propietario.`);
  const ownerRelativePath = resolveCanonicalOwnerRelativePath(owner);
  const ownerPath = path.join(root, ...ownerRelativePath.split('/'));
  if (!fs.existsSync(ownerPath)) {
    fail(`No existe archivo propietario: ${ownerRelativePath}.`);
  }
  return parseTaskTreqDeclaration(fs.readFileSync(ownerPath, 'utf8'), taskId);
}

function syncCounts(root, left, right) {
  const raw = git(['rev-list', '--left-right', '--count', `${left}...${right}`], { cwd: root }).stdout.trim();
  const [behind, ahead] = raw.split(/\s+/u).map(Number);
  return { behind: Number(behind), ahead: Number(ahead), raw };
}

function createOrUpdatePr(root, taskId, branch, body) {
  const list = gh([
    'pr', 'list',
    '--head', branch,
    '--base', DEFAULT_BRANCH,
    '--state', 'open',
    '--json', 'number,url,headRefOid',
    '--limit', '1',
  ], { cwd: root });
  const existing = parseJsonOutput(list.stdout || '[]', 'gh pr list');

  const tempDir = fs.mkdtempSync(path.join(os.tmpdir(), 'vento-task-pr-'));
  const bodyPath = path.join(tempDir, 'body.md');
  fs.writeFileSync(bodyPath, body, 'utf8');

  try {
    if (Array.isArray(existing) && existing.length > 0) {
      const pr = existing[0];
      gh([
        'pr', 'edit', String(pr.number),
        '--title', `${taskId}: cierre de tarea`,
        '--body-file', bodyPath,
      ], { cwd: root });
      return Number(pr.number);
    }

    gh([
      'pr', 'create',
      '--base', DEFAULT_BRANCH,
      '--head', branch,
      '--title', `${taskId}: cierre de tarea`,
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

function cleanupTaskBranch(root, branch) {
  const remoteDelete = git(['push', 'origin', '--delete', branch], { cwd: root, allowFailure: true });
  const localDelete = git(['branch', '-d', branch], { cwd: root, allowFailure: true });
  return {
    remote: remoteDelete.status === 0 ? 'DELETED' : 'KEPT',
    local: localDelete.status === 0 ? 'DELETED' : 'KEPT',
  };
}

function printResult(fields) {
  console.log('');
  console.log(RESULT_START);
  for (const [key, value] of Object.entries(fields)) {
    console.log(`${key}: ${value}`);
  }
  console.log(RESULT_END);
}

export function startTask({ taskId, root = ensureRepositoryRoot() }) {
  const id = normalizeTaskId(taskId);
  const branch = taskBranchName(id);

  ensureGhReady(root);
  ensureClean(root, 'START');

  git(['fetch', 'origin', DEFAULT_BRANCH, '--quiet'], { cwd: root });
  git(['switch', DEFAULT_BRANCH], { cwd: root });
  git(['pull', '--ff-only', 'origin', DEFAULT_BRANCH], { cwd: root });
  ensureClean(root, 'START MAIN');

  const preflight = ensureTaskCanStart(root, id);
  let mode = 'CREATED';

  const remoteExists = remoteBranchExists(root, branch);
  const localExists = localBranchExists(root, branch);

  if (remoteExists) {
    mode = 'RESUMED';
    git(['fetch', 'origin', branch, '--quiet'], { cwd: root });
    if (localExists) {
      git(['switch', branch], { cwd: root });
      git(['branch', '--set-upstream-to', `origin/${branch}`, branch], { cwd: root });
      git(['pull', '--ff-only', 'origin', branch], { cwd: root });
    } else {
      git(['switch', '-c', branch, '--track', `origin/${branch}`], { cwd: root });
    }
  } else if (localExists) {
    mode = 'RESUMED_LOCAL';
    git(['switch', branch], { cwd: root });
    git(['push', '-u', 'origin', branch], { cwd: root });
  } else {
    git(['switch', '-c', branch], { cwd: root });
    git(['push', '-u', 'origin', branch], { cwd: root });
  }

  ensureClean(root, 'START BRANCH');
  const sync = syncCounts(root, `origin/${branch}`, 'HEAD');
  if (sync.behind !== 0 || sync.ahead !== 0) {
    fail(`La rama no quedo sincronizada con origin/${branch}: ${sync.raw}.`);
  }

  printResult({
    ESTADO: 'PASS',
    OPERACION: 'TASK_START',
    TASK_ID: id,
    BRANCH: branch,
    BRANCH_MODE: mode,
    BASE: DEFAULT_BRANCH,
    PREFLIGHT: 'PASS',
    CURRENT_TASK: preflight.task.id,
    REMOTE_BRANCH: 'PUBLISHED',
    SYNC_REMOTE: '0/0',
    WORKTREE: 'CLEAN',
    READY_TO_WORK: 'SI',
  });
}

export function finishTask({ taskId, root = ensureRepositoryRoot() }) {
  const id = normalizeTaskId(taskId);
  const branch = taskBranchName(id);

  ensureGhReady(root);
  if (currentBranch(root) !== branch) {
    fail(`FINISH debe ejecutarse desde ${branch}; rama actual: ${currentBranch(root) || 'DETACHED'}.`);
  }

  git(['fetch', 'origin', DEFAULT_BRANCH, '--quiet'], { cwd: root });
  const report = ensureTaskCanFinish(root, id);
  const treq = readTreqDeclaration(root, report, id);

  const dirty = worktreePaths(root);
  if (dirty.length > 0) {
    ensureNoUnknownPaths(dirty);
    git(['diff', '--check'], { cwd: root });
    git(['add', '--', ...dirty], { cwd: root });
    npm(['run', '--silent', 'docs:commit-scope:check', '--', '--staged'], { cwd: root });
    git(['diff', '--cached', '--check'], { cwd: root });

    const staged = git(['diff', '--cached', '--name-only', '--diff-filter=ACMRD'], { cwd: root }).stdout.trim();
    if (staged) {
      git(['commit', '-m', `task(${id}): close`], { cwd: root });
    }
  }

  const branchCommits = Number(
    git(['rev-list', '--count', `origin/${DEFAULT_BRANCH}..HEAD`], { cwd: root }).stdout.trim(),
  );
  if (!Number.isFinite(branchCommits) || branchCommits <= 0) {
    fail(`${branch} no contiene commits nuevos respecto de origin/${DEFAULT_BRANCH}.`);
  }

  git(['push', '-u', 'origin', branch], { cwd: root });
  const branchSync = syncCounts(root, `origin/${branch}`, 'HEAD');
  if (branchSync.behind !== 0 || branchSync.ahead !== 0) {
    fail(`Push incompleto de ${branch}: ${branchSync.raw}.`);
  }

  const headSha = currentHead(root);
  const prBody = buildPrBody(id, treq);
  const prNumber = createOrUpdatePr(root, id, branch, prBody);

  gh(['pr', 'checks', String(prNumber), '--watch', '--fail-fast'], { cwd: root, inherit: true });

  const prState = parseJsonOutput(
    gh(['pr', 'view', String(prNumber), '--json', 'number,state,isDraft,mergeable,headRefOid,baseRefName'], { cwd: root }).stdout,
    'gh pr view',
  );
  if (prState.state !== 'OPEN') fail(`PR #${prNumber} no esta OPEN; estado: ${prState.state}.`);
  if (prState.isDraft) fail(`PR #${prNumber} sigue en draft.`);
  if (prState.baseRefName !== DEFAULT_BRANCH) fail(`PR #${prNumber} no apunta a ${DEFAULT_BRANCH}.`);
  if (prState.headRefOid !== headSha) fail(`PR #${prNumber} no apunta al HEAD validado ${headSha}.`);
  if (!['MERGEABLE', 'UNKNOWN'].includes(String(prState.mergeable ?? '').toUpperCase())) {
    fail(`PR #${prNumber} no es mergeable: ${prState.mergeable}.`);
  }

  gh([
    'pr', 'merge', String(prNumber),
    '--merge',
    '--match-head-commit', headSha,
  ], { cwd: root });

  git(['fetch', 'origin', DEFAULT_BRANCH, '--quiet'], { cwd: root });
  git(['switch', DEFAULT_BRANCH], { cwd: root });
  git(['pull', '--ff-only', 'origin', DEFAULT_BRANCH], { cwd: root });
  ensureClean(root, 'FINISH MAIN');

  const mainSync = syncCounts(root, `origin/${DEFAULT_BRANCH}`, 'HEAD');
  if (mainSync.behind !== 0 || mainSync.ahead !== 0) {
    fail(`main no quedo sincronizado: ${mainSync.raw}.`);
  }

  const merged = parseJsonOutput(
    gh(['pr', 'view', String(prNumber), '--json', 'state,mergedAt,mergeCommit'], { cwd: root }).stdout,
    'gh pr view merged',
  );
  if (merged.state !== 'MERGED') fail(`PR #${prNumber} no quedo MERGED.`);

  const cleanup = cleanupTaskBranch(root, branch);

  printResult({
    ESTADO: 'PASS',
    OPERACION: 'TASK_FINISH',
    TASK_ID: id,
    BRANCH: branch,
    HEAD_VALIDATED: headSha,
    PR: prNumber,
    REQUIRED_CHECKS: 'PASS',
    MERGE: 'PASS',
    MAIN_HEAD: currentHead(root),
    SYNC_MAIN: '0/0',
    WORKTREE: 'CLEAN',
    LOCAL_BRANCH: cleanup.local,
    REMOTE_BRANCH: cleanup.remote,
    NEXT_TASK_ALLOWED: 'SI',
  });
}

function parseArgs(argv) {
  const args = { mode: null, taskId: null, help: false };
  if (argv.length > 0 && !argv[0].startsWith('--')) {
    args.mode = argv[0];
    argv = argv.slice(1);
  }
  for (let index = 0; index < argv.length; index += 1) {
    const token = argv[index];
    if (token === '--help' || token === '-h') args.help = true;
    else if (token === '--task-id') {
      const value = argv[index + 1];
      if (!value || value.startsWith('--')) fail('Falta valor de --task-id.');
      args.taskId = value;
      index += 1;
    } else fail(`Argumento desconocido: ${token}.`);
  }
  return args;
}

function usage() {
  console.log('Uso:');
  console.log('  npm run docs:task:start -- --task-id AUTH-SRV-001');
  console.log('  npm run docs:task:finish -- --task-id AUTH-SRV-001');
}

function main() {
  const args = parseArgs(process.argv.slice(2));
  if (args.help) {
    usage();
    return;
  }
  if (!['start', 'finish'].includes(args.mode)) fail('Modo requerido: start o finish.');
  if (!args.taskId) fail('Falta --task-id.');

  if (args.mode === 'start') startTask({ taskId: args.taskId });
  else finishTask({ taskId: args.taskId });
}

const isCli = process.argv[1] && path.resolve(process.argv[1]) === path.resolve(fileURLToPath(import.meta.url));

if (isCli) {
  try {
    main();
  } catch (error) {
    const message = error instanceof Error ? error.message : String(error);
    const code = Number.isInteger(error?.exitCode) ? error.exitCode : 1;
    printResult({
      ESTADO: 'FAIL',
      OPERACION: process.argv[2] === 'finish' ? 'TASK_FINISH' : 'TASK_START',
      COMPROBACION_FALLIDA: message.replace(/[\r\n]+/gu, ' | '),
      EXIT_CODE_REPORTADO: code,
      NEXT_TASK_ALLOWED: 'NO',
    });
    process.exitCode = code;
  }
}