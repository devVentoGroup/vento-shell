import fs from 'node:fs';
import path from 'node:path';
import { syncPlanContinuity as syncGlobalContinuity } from './plan-continuity-global.mjs';

const CONTROL_HEADING = '## Control de continuidad';

function prepareHeader(root) {
  const headerPath = path.resolve(
    root,
    'docs/plan-canonico/modular/00_CABECERA_Y_ESTADO.md'
  );

  if (!fs.existsSync(headerPath)) {
    throw new Error(`no existe ${path.relative(root, headerPath)}.`);
  }

  const original = fs.readFileSync(headerPath, 'utf8');
  let normalized = original.replace(/\r\n?/g, '\n');

  if (!normalized.includes(CONTROL_HEADING)) {
    normalized = `${normalized.trimEnd()}\n\n${CONTROL_HEADING}\n\n\`\`\`text\nPENDIENTE DE SINCRONIZACIÓN\n\`\`\`\n`;
  }

  if (normalized !== original) {
    fs.writeFileSync(headerPath, normalized, 'utf8');
    console.log('OK: cabecera normalizada antes de sincronizar continuidad.');
  }
}

export function syncPlanContinuity({ root = process.cwd(), checkOnly = false } = {}) {
  if (!checkOnly) {
    prepareHeader(root);
  }

  return syncGlobalContinuity({ root, checkOnly });
}
