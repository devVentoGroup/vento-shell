import { spawnSync } from 'node:child_process';
import path from 'node:path';
import { fileURLToPath } from 'node:url';

const TRANSVERSAL_PLAN_FILES = new Set([
  'docs/plan-canonico/modular/01_PROTOCOLO.md',
  'docs/plan-canonico/modular/delivery-contract.json',
  'docs/plan-canonico/modular/implementation-handoff-template.md',
  'docs/plan-canonico/modular/implementation-readiness-policy.json',
  'docs/plan-canonico/modular/implementation-control.json',
  'docs/plan-canonico/modular/continuity-route.json',
  'docs/plan-canonico/modular/task-delivery-template.md',
  'docs/plan-canonico/modular/task-development-policy.json',
  'docs/plan-canonico/modular/task-format-policy.json',
  'docs/plan-canonico/modular/task-work-topology.json',
]);
const DERIVED_PLAN_PROJECTIONS = new Set([
  'docs/plan-canonico/modular/00_CABECERA_Y_ESTADO.md',
  'docs/plan-canonico/modular/active-sequence.json',
  'docs/plan-canonico/modular/.generated/REGISTRO_GLOBAL_DE_TAREAS.md',
  'docs/plan-canonico/modular/.generated/REGISTRO_DE_TAREAS_PENDIENTES_CON_CONTEXTO.md',
]);

function normalizePath(filePath) {
  return String(filePath).replaceAll('\\', '/').replace(/^\.\//u, '');
}

export function classifyCommitPath(filePath) {
  const normalized = normalizePath(filePath);
  if (TRANSVERSAL_PLAN_FILES.has(normalized)) return 'TRANSVERSAL';
  if (DERIVED_PLAN_PROJECTIONS.has(normalized)) return 'PROJECTION';
  if (
    normalized === 'AGENTS.md'
    || normalized === 'package.json'
    || normalized === 'package-lock.json'
    || normalized.startsWith('scripts/docs/')
    || normalized.startsWith('scripts/quality/')
    || normalized.startsWith('quality/')
    || normalized.startsWith('.github/')
    || normalized.startsWith('.vscode/')
  ) return 'TRANSVERSAL';
  if (normalized.startsWith('docs/plan-canonico/modular/')) return 'CANONICAL_TASK';
  if (
    normalized.startsWith('src/')
    || normalized.startsWith('packages/')
    || normalized.startsWith('supabase/')
    || normalized.startsWith('templates/')
  ) return 'APPLICATION';
  return 'OTHER';
}

export function analyzeCommitScope(paths) {
  const files = [...new Set(paths.map(normalizePath).filter(Boolean))].sort();
  const byScope = new Map();
  for (const file of files) {
    const scope = classifyCommitPath(file);
    if (!byScope.has(scope)) byScope.set(scope, []);
    byScope.get(scope).push(file);
  }
  const errors = [];
  const warnings = [];
  if (byScope.has('CANONICAL_TASK') && byScope.has('TRANSVERSAL')) {
    errors.push('el commit mezcla desarrollo de tarea canónica con infraestructura transversal.');
  }
  if (byScope.has('CANONICAL_TASK') && byScope.has('APPLICATION')) {
    warnings.push('el commit mezcla plan canónico y aplicación; confirme que la tarea autoriza ambos alcances.');
  }
  return {
    files,
    scopes: Object.fromEntries([...byScope.entries()]),
    errors,
    warnings,
  };
}

function runGit(args) {
  const result = spawnSync('git', args, {
    cwd: process.cwd(),
    encoding: 'utf8',
    windowsHide: true,
  });
  if (result.status !== 0) {
    throw new Error(result.stderr.trim() || `git ${args.join(' ')} falló.`);
  }
  return result.stdout.trim();
}

function pathsForCommit(commit) {
  return runGit(['diff-tree', '--root', '--no-commit-id', '--name-only', '-r', commit])
    .split(/\r?\n/u)
    .filter(Boolean);
}

function parseArgs(argv) {
  const args = { staged: false, range: null };
  for (let index = 0; index < argv.length; index += 1) {
    const token = argv[index];
    if (token === '--staged') args.staged = true;
    else if (token === '--range') {
      args.range = argv[index + 1];
      if (!args.range) throw new Error('falta el valor de --range.');
      index += 1;
    } else throw new Error(`argumento desconocido: ${token}.`);
  }
  if (args.staged && args.range) throw new Error('--staged y --range son mutuamente excluyentes.');
  return args;
}

export function main(argv = process.argv.slice(2)) {
  const args = parseArgs(argv);
  const reports = [];
  if (args.range) {
    const commits = runGit(['rev-list', '--reverse', args.range]).split(/\r?\n/u).filter(Boolean);
    for (const commit of commits) {
      reports.push({ label: commit.slice(0, 12), report: analyzeCommitScope(pathsForCommit(commit)) });
    }
  } else {
    const diffArgs = args.staged
      ? ['diff', '--cached', '--name-only', '--diff-filter=ACMRD']
      : ['diff', '--name-only', '--diff-filter=ACMRD', 'HEAD'];
    reports.push({ label: args.staged ? 'staged' : 'working-tree', report: analyzeCommitScope(
      runGit(diffArgs).split(/\r?\n/u).filter(Boolean),
    ) });
  }

  const errors = [];
  for (const { label, report } of reports) {
    for (const warning of report.warnings) console.warn(`[COMMIT SCOPE] ${label}: ADVERTENCIA: ${warning}`);
    for (const error of report.errors) errors.push(`${label}: ${error}`);
  }
  if (errors.length > 0) throw new Error(errors.join('\n'));
  console.log(`OK: alcance de ${reports.length} corte(s) sin mezcla transversal prohibida.`);
  return reports;
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
