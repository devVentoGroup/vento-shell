import fs from 'node:fs';
import path from 'node:path';
import { spawnSync } from 'node:child_process';

const root = process.cwd();
const apply = process.argv.includes('--apply');
const continuityFile = path.join(root, 'scripts/docs/plan-continuity-global.mjs');
const finalizeFile = path.join(root, 'scripts/docs/finalize-auth-ctx-027-roadmap.mjs');

function stop(message) {
  throw new Error(message);
}

function load(file) {
  if (!fs.existsSync(file)) stop(`No existe ${path.relative(root, file)}.`);
  return fs.readFileSync(file, 'utf8');
}

function prepareContinuity(source) {
  const lineEnd = source.includes('\r\n') ? '\r\n' : '\n';
  let text = source.replace(/\r\n?/g, '\n');

  if (!text.includes('const originalEol = header.includes')) {
    const opening = "function updateHeader(header, manifest, taskMap, stats, continuity) {\n  let updated = header;";
    const openingReplacement = "function updateHeader(header, manifest, taskMap, stats, continuity) {\n  const originalEol = header.includes('\\r\\n') ? '\\r\\n' : '\\n';\n  let updated = header.replace(/\\r\\n?/g, '\\n');";
    const closing = "  updated = updated.replace(controlPattern, buildControlBlock(continuity));\n  return ensureRegistryNavigationLink(updated);\n}";
    const closingReplacement = "  updated = updated.replace(controlPattern, buildControlBlock(continuity));\n  updated = ensureRegistryNavigationLink(updated);\n  return originalEol === '\\n' ? updated : updated.replace(/\\n/g, '\\r\\n');\n}";

    if ((text.split(opening).length - 1) !== 1) stop('No se encontró una única apertura de updateHeader.');
    if ((text.split(closing).length - 1) !== 1) stop('No se encontró un único cierre de updateHeader.');

    text = text.replace(opening, openingReplacement).replace(closing, closingReplacement);
  }

  return lineEnd === '\n' ? text : text.replace(/\n/g, '\r\n');
}

function runFinalize() {
  const args = [finalizeFile];
  if (apply) args.push('--apply');
  const result = spawnSync(process.execPath, args, {
    cwd: root,
    stdio: 'inherit',
    shell: false,
  });
  return result.status ?? 1;
}

try {
  const original = load(continuityFile);
  const prepared = prepareContinuity(original);
  console.log(`${original === prepared ? 'OK' : 'CAMBIO'}: scripts/docs/plan-continuity-global.mjs`);

  if (!apply) {
    console.log('DRY RUN: parche CRLF validado.');
    const status = runFinalize();
    if (status !== 0) stop(`El dry-run de la reparación terminó con código ${status}.`);
  } else {
    fs.writeFileSync(continuityFile, prepared, 'utf8');
    const status = runFinalize();
    if (status !== 0) {
      fs.writeFileSync(continuityFile, original, 'utf8');
      stop(`La reparación terminó con código ${status}; el sincronizador fue revertido.`);
    }
    console.log('\nOK: compatibilidad CRLF y reparación integral aplicadas y verificadas.');
  }
} catch (error) {
  console.error(`ERROR: ${error instanceof Error ? error.message : String(error)}`);
  process.exitCode = 1;
}
