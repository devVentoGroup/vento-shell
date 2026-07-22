import fs from 'node:fs';
import path from 'node:path';
import { spawnSync } from 'node:child_process';

const ROOT = process.cwd();
const APPLY = process.argv.includes('--apply');
const globalPath = path.join(ROOT, 'scripts/docs/plan-continuity-global.mjs');
const finalizePath = path.join(ROOT, 'scripts/docs/finalize-auth-ctx-027-roadmap.mjs');

function fail(message) {
  throw new Error(message);
}

function read(file) {
  if (!fs.existsSync(file) || !fs.statSync(file).isFile()) {
    fail(`No existe ${path.relative(ROOT, file)}.`);
  }
  return fs.readFileSync(file, 'utf8');
}

function patchGlobal(text) {
  if (text.includes('const originalEol = header.includes')) return text;

  const startBefore = `function updateHeader(header, manifest, taskMap, stats, continuity) {\n  let updated = header;`;
  const startAfter = `function updateHeader(header, manifest, taskMap, stats, continuity) {\n  const originalEol = header.includes('\\r\\n') ? '\\r\\n' : '\\n';\n  let updated = header.replace(/\\r\\n?/g, '\\n');`;

  const endBefore = `  updated = updated.replace(controlPattern, buildControlBlock(continuity));\n  return ensureRegistryNavigationLink(updated);\n}`;
  const endAfter = `  updated = updated.replace(controlPattern, buildControlBlock(continuity));\n  updated = ensureRegistryNavigationLink(updated);\n  return originalEol === '\\n' ? updated : updated.replace(/\\n/g, '\\r\\n');\n}`;

  const startCount = text.split(startBefore).length - 1;
  const endCount = text.split(endBefore).length - 1;
  if (startCount !== 1 || endCount !== 1) {
    fail(`No se pudo aplicar el parche CRLF de forma segura. Inicio=${startCount}; cierre=${endCount}.`);
  }

  return text.replace(startBefore, startAfter).replace(endBefore, endAfter);
}

function runFinalize() {
  const args = [finalizePath];
  if (APPLY) args.push('--apply');
  const result = spawnSync(process.execPath, args, {
    cwd: ROOT,
    stdio: 'inherit',
    shell: false,
  });
  return result.status ?? 1;
}

try {
  const original = read(globalPath);
  const patched = patchGlobal(original);
  console.log(`${original === patched ? 'OK' : 'CAMBIO'}: scripts/docs/plan-continuity-global.mjs`);

  if (!APPLY) {
    console.log('DRY RUN: el parche CRLF es aplicable y se ejecutará antes de la reparación integral.');
    const status = runFinalize();
    if (status !== 0) fail(`El dry-run de la reparación terminó con código ${status}.`);
    process.exit(0);
  }

  fs.writeFileSync(globalPath, patched, 'utf8');
  const status = runFinalize();
  if (status !== 0) {
    fs.writeFileSync(globalPath, original, 'utf8');
    fail(`La reparación integral terminó con código ${status}; se revirtió también el parche CRLF.`);
  }

  console.log('\nOK: compatibilidad CRLF y reparación integral aplicadas y verificadas.');
} catch (error) {
  console.error(`ERROR: ${error instanceof Error ? error.message : String(error)}`);
  process.exitCode = 1;
}
