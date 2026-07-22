import fs from 'node:fs';
import path from 'node:path';
import { spawnSync } from 'node:child_process';

const root = process.cwd();
const apply = process.argv.includes('--apply');
const globalFile = path.join(root, 'scripts/docs/plan-continuity-global.mjs');
const compilerFix = path.join(root, 'scripts/docs/fix-real-task-count.mjs');
const manifestFile = path.join(root, 'docs/plan-canonico/modular/manifest.json');
const headerFile = path.join(root, 'docs/plan-canonico/modular/00_CABECERA_Y_ESTADO.md');
const registryFile = path.join(root, 'docs/plan-canonico/modular/.generated/REGISTRO_GLOBAL_DE_TAREAS.md');

const obsolete = [
  'scripts/docs/finalize-auth-ctx-027-roadmap.mjs',
  'scripts/docs/finalize-auth-ctx-027-roadmap-v2.mjs',
  'scripts/docs/finalize-auth-ctx-027-roadmap-v3.mjs',
].map((file) => path.join(root, file));

const oldRegex = "const TASK_REGEX = /^###\\s+(?<marker>\\[[ x~]\\]|[✅🟡❌])\\s+(?<id>[A-Z][A-Z0-9]*(?:-[A-Z0-9]+)+-\\d{3})\\b(?:\\s+[—-]\\s+(?<title>[^\\n]+))?$/gmu;";
const newRegex = "const TASK_REGEX = /^###\\s+(?<marker>\\[[ x~]\\]|[✅🟡❌])\\s+(?<id>[A-Z][A-Z0-9]*(?:-[A-Z0-9]+)+-\\d{3})\\b(?:\\s+(?:[—-]\\s+)?(?<title>[^\\n]+))?$/gmu;";

function fail(message) {
  throw new Error(message);
}

function exists(file) {
  return fs.existsSync(file) && fs.statSync(file).isFile();
}

function read(file) {
  if (!exists(file)) fail(`No existe ${path.relative(root, file)}.`);
  return fs.readFileSync(file, 'utf8');
}

function patchGlobal(source) {
  if (source.includes(newRegex)) return source;
  const count = source.split(oldRegex).length - 1;
  if (count !== 1) fail(`Se esperaba una definición TASK_REGEX anterior y se encontraron ${count}.`);
  return source.replace(oldRegex, newRegex);
}

function run(script, args = []) {
  const result = spawnSync(process.execPath, [script, ...args], {
    cwd: root,
    stdio: 'inherit',
    shell: false,
  });
  if (result.status !== 0) fail(`${path.relative(root, script)} ${args.join(' ')} terminó con código ${result.status}.`);
}

function parseCount(source, label) {
  const escaped = label.replace(/[.*+?^${}()|[\]\\]/g, '\\$&');
  const match = source.match(new RegExp(`^\\|\\s*${escaped}\\s*\\|\\s*\\*\\*(\\d+)\\*\\*\\s*\\|$`, 'm'));
  if (!match) fail(`No se encontró la métrica ${label}.`);
  return Number(match[1]);
}

function validateParity() {
  const header = read(headerFile);
  const registry = read(registryFile);
  const headerTotal = parseCount(header, 'Tareas canónicas con marcador');
  const headerAuth = parseCount(header, 'Tareas `AUTH` únicas');
  const registryTotal = parseCount(registry, 'Tareas con marcador');
  const registryAuth = parseCount(registry, 'Tareas `AUTH`');

  if (headerTotal !== registryTotal) fail(`Cabecera=${headerTotal}, registro=${registryTotal}.`);
  if (headerAuth !== registryAuth) fail(`AUTH cabecera=${headerAuth}, registro=${registryAuth}.`);
  if (headerTotal !== 1350) fail(`Se esperaban 1350 tareas reales y se obtuvieron ${headerTotal}.`);
  if (headerAuth !== 315) fail(`Se esperaban 315 tareas AUTH y se obtuvieron ${headerAuth}.`);

  console.log(`OK: cabecera y registro coinciden en ${headerTotal} tareas y ${headerAuth} tareas AUTH.`);
}

try {
  const originalGlobal = read(globalFile);
  const nextGlobal = patchGlobal(originalGlobal);
  console.log(`${originalGlobal === nextGlobal ? 'OK' : 'CAMBIO'}: scripts/docs/plan-continuity-global.mjs`);

  if (!apply) {
    console.log('DRY RUN completado. Se reconocerán títulos con y sin raya separadora.');
    process.exit(0);
  }

  const backups = new Map([[globalFile, originalGlobal]]);
  for (const file of obsolete) backups.set(file, exists(file) ? read(file) : null);

  try {
    fs.writeFileSync(globalFile, nextGlobal, 'utf8');
    run(compilerFix, ['--apply']);
    run(path.join(root, 'scripts/docs/build-plan-canonico.mjs'));
    run(path.join(root, 'scripts/docs/build-plan-canonico.mjs'), ['--check']);
    validateParity();

    for (const file of obsolete) {
      if (exists(file)) fs.rmSync(file);
    }
  } catch (error) {
    fs.writeFileSync(globalFile, originalGlobal, 'utf8');
    for (const [file, value] of backups) {
      if (file === globalFile) continue;
      if (value === null) {
        if (exists(file)) fs.rmSync(file);
      } else {
        fs.mkdirSync(path.dirname(file), { recursive: true });
        fs.writeFileSync(file, value, 'utf8');
      }
    }
    throw new Error(`Se revirtió el registro global. ${error instanceof Error ? error.message : String(error)}`);
  }

  console.log('\nOK: inventario global corregido; 1350 tareas reales registradas y verificadas.');
} catch (error) {
  console.error(`ERROR: ${error instanceof Error ? error.message : String(error)}`);
  process.exitCode = 1;
}
