import fs from 'node:fs';
import path from 'node:path';
import { fileURLToPath } from 'node:url';

const PRINT_PATH = 'bloques/E4_SERVICIOS_TRANSVERSALES/04_SERVICIO_TRANSVERSAL_DE_IMPRESION.md';
const PROCESS_PATH = 'bloques/E2_PROCESOS_Y_EXPERIENCIA/01_02_PROPOSITO_PROPIEDAD_CONSUMIDORES_Y_ACTORES.md';

const EXPECTED_BINDINGS = new Map(`
IMP-LBL-01 VPROC-0034,VPROC-0035,VPROC-0036
IMP-LBL-02 VPROC-0034,VPROC-0024
IMP-LBL-03 VPROC-0033,VPROC-0034,VPROC-0037
IMP-LBL-04 VPROC-0034,VPROC-0036,VPROC-0027
IMP-LBL-05 VPROC-0018,VPROC-0034,VPROC-0035
IMP-LBL-06 VPROC-0035,VPROC-0027
IMP-LBL-07 VPROC-0022,VPROC-0024,VPROC-0035
IMP-LBL-08 VPROC-0023
IMP-LBL-09 VPROC-0015,VPROC-0023
IMP-LBL-10 VPROC-0025,VPROC-0048
IMP-LBL-11 VPROC-0039,VPROC-0049
IMP-LBL-12 VPROC-0029
IMP-LBL-13 VPROC-0029,VPROC-0030
IMP-LBL-14 VPROC-0014,VPROC-0055
IMP-LBL-15 VPROC-0018,VPROC-0035
IMP-LBL-16 VPROC-0027,VPROC-0037
IMP-CMD-01 VPROC-0038,VPROC-0039,VPROC-0034
IMP-CMD-02 VPROC-0038,VPROC-0039,VPROC-0034
IMP-CMD-03 VPROC-0038,VPROC-0039,VPROC-0034
IMP-CMD-04 VPROC-0033,VPROC-0034
IMP-CMD-05 VPROC-0039,VPROC-0048,VPROC-0049
IMP-CMD-06 VPROC-0028
IMP-CMD-07 VPROC-0042,VPROC-0038,VPROC-0039
IMP-CMD-08 VPROC-0042,VPROC-0038,VPROC-0039
IMP-CMD-09 VPROC-0028,VPROC-0033,VPROC-0034
IMP-CLI-01 VPROC-0038,VPROC-0039,VPROC-0043
IMP-CLI-02 VPROC-0038,VPROC-0039,VPROC-0040
IMP-CLI-03 VPROC-0043
IMP-CLI-04 VPROC-0043,VPROC-0051
IMP-CLI-05 VPROC-0042,VPROC-0046,VPROC-0051
IMP-CLI-06 VPROC-0039,VPROC-0048,VPROC-0049
IMP-CLI-07 VPROC-0047,VPROC-0043
IMP-CLI-08 VPROC-0045,VPROC-0056
IMP-CLI-09 VPROC-0044
IMP-DOC-01 VPROC-0025,VPROC-0048,VPROC-0049
IMP-DOC-02 VPROC-0025
IMP-DOC-03 VPROC-0026
IMP-DOC-04 VPROC-0026,VPROC-0027
IMP-DOC-05 VPROC-0021,VPROC-0069
IMP-DOC-06 VPROC-0022,VPROC-0024
IMP-DOC-07 VPROC-0022,VPROC-0025
IMP-DOC-08 VPROC-0033,VPROC-0034
IMP-DOC-09 VPROC-0016,VPROC-0034
IMP-DOC-10 VPROC-0035,VPROC-0061
IMP-DOC-11 VPROC-0030
IMP-DOC-12 VPROC-0029
IMP-DOC-13 VPROC-0030,VPROC-0058
IMP-DOC-14 VPROC-0014,VPROC-0055
IMP-DOC-15 VPROC-0051,VPROC-0054
IMP-DOC-16 VPROC-0054,VPROC-0061
`.trim().split('\n').map((line) => {
  const [id, processList] = line.trim().split(/\s+/u);
  return [id, processList.split(',')];
}));

function section(source, startMarker, endMarker) {
  const start = source.indexOf(startMarker);
  const end = source.indexOf(endMarker, start + startMarker.length);
  if (start < 0 || end <= start) return null;
  return source.slice(start, end);
}

export function parsePrintProcessBindings(printSource) {
  const inventory = section(
    printSource,
    '#### 5. Inventario canónico materializado',
    '#### 6. Reconciliación cuantitativa',
  );
  if (!inventory) return null;

  const bindings = new Map();
  const rowPattern = /^\| `(?<id>IMP-(?:LBL|CMD|CLI|DOC)-\d{2})` \|(?<row>.+)$/gmu;
  for (const match of inventory.matchAll(rowPattern)) {
    const processIds = [...match.groups.row.matchAll(/VPROC-\d{4}/gu)].map(([id]) => id);
    bindings.set(match.groups.id, processIds);
  }
  return bindings;
}

export function validatePrintProcessBindingsSource({ printSource, purposeSource }) {
  const errors = [];
  const bindings = parsePrintProcessBindings(printSource);
  if (!bindings) {
    return { errors: ['No se pudo aislar el inventario PRINT-ARC-003.'], stats: { outputs: 0, relations: 0 } };
  }

  const purposeRegistry = section(
    purposeSource,
    '#### 6. Registro canónico de propósitos empresariales',
    '#### 7. Distinciones obligatorias entre procesos cercanos',
  );
  if (!purposeRegistry) {
    errors.push('No se pudo aislar PROC-BUSINESS-PURPOSE-REGISTRY-001.');
  }
  const canonicalProcesses = new Set(
    [...(purposeRegistry ?? '').matchAll(/^\| `(?<id>VPROC-\d{4})` \|/gmu)].map((match) => match.groups.id),
  );

  for (const [id, expected] of EXPECTED_BINDINGS) {
    const actual = bindings.get(id);
    if (!actual) {
      errors.push(`Falta la relación de procesos para ${id}.`);
      continue;
    }
    if (actual.join(',') !== expected.join(',')) {
      errors.push(`${id}: procesos esperados ${expected.join(', ')}; encontrados ${actual.join(', ') || 'NINGUNO'}.`);
    }
  }

  for (const [id, processIds] of bindings) {
    if (!EXPECTED_BINDINGS.has(id)) errors.push(`Salida imprimible no gobernada por el contrato: ${id}.`);
    for (const processId of processIds) {
      if (!canonicalProcesses.has(processId)) errors.push(`${id}: proceso inexistente ${processId}.`);
    }
  }

  if (!printSource.includes('`VPROC-0012` conserva exclusivamente el proceso de riesgos')) {
    errors.push('Falta la frontera explícita que impide reutilizar VPROC-0012 para compras.');
  }
  if (!printSource.includes('`VPROC-0057` conserva exclusivamente la conversión de interacciones digitales')) {
    errors.push('Falta la frontera explícita que impide reutilizar VPROC-0057 para activos.');
  }

  return {
    errors,
    stats: {
      outputs: bindings.size,
      relations: [...bindings.values()].reduce((total, ids) => total + ids.length, 0),
    },
  };
}

export function validatePrintProcessBindings({ root = process.cwd() } = {}) {
  const baseDir = path.join(root, 'docs/plan-canonico/modular');
  return validatePrintProcessBindingsSource({
    printSource: fs.readFileSync(path.join(baseDir, PRINT_PATH), 'utf8'),
    purposeSource: fs.readFileSync(path.join(baseDir, PROCESS_PATH), 'utf8'),
  });
}

const isCli = process.argv[1] && path.resolve(process.argv[1]) === fileURLToPath(import.meta.url);
if (isCli) {
  const result = validatePrintProcessBindings();
  if (result.errors.length > 0) {
    console.error(result.errors.map((error) => `ERROR: ${error}`).join('\n'));
    process.exit(1);
  }
  console.log(`OK: vínculos PRINT-ARC-003; ${result.stats.outputs} salidas; ${result.stats.relations} relaciones VPROC reconciliadas.`);
}
