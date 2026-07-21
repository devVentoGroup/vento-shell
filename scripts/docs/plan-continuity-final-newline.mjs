import fs from 'node:fs';
import path from 'node:path';
import { syncPlanContinuity as syncPreservingFormat } from './plan-continuity-preserve-format.mjs';

function ensureSingleFinalNewline(filePath, checkOnly) {
  const current = fs.readFileSync(filePath, 'utf8');
  const eol = current.includes('\r\n') ? '\r\n' : '\n';
  const expected = current.replace(/(?:\r?\n)+$/u, '') + eol;

  if (current === expected) return false;

  if (checkOnly) {
    throw new Error(
      `${path.basename(filePath)} debe terminar en exactamente un salto de línea.`
    );
  }

  fs.writeFileSync(filePath, expected, 'utf8');
  console.log(`OK: ${path.basename(filePath)} termina en un salto de línea.`);
  return true;
}

export function syncPlanContinuity({ root = process.cwd(), checkOnly = false } = {}) {
  const result = syncPreservingFormat({ root, checkOnly });
  const headerPath = path.resolve(
    root,
    'docs/plan-canonico/modular/00_CABECERA_Y_ESTADO.md'
  );
  const finalNewlineChanged = ensureSingleFinalNewline(headerPath, checkOnly);

  return {
    ...result,
    changed: result.changed || finalNewlineChanged,
  };
}
