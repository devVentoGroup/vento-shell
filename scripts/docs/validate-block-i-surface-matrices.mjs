import crypto from 'node:crypto';
import fs from 'node:fs';
import path from 'node:path';
import { fileURLToPath } from 'node:url';

const INVENTORY_PATH =
  'docs/plan-canonico/modular/bloques/I_NAVEGACION_Y_PANTALLAS/01_INVENTARIO_COMPLETO_DE_SUPERFICIES.md';
const BINDINGS_PATH =
  'docs/plan-canonico/modular/bloques/I_NAVEGACION_Y_PANTALLAS/02_VINCULACION_CON_PROCESOS_Y_APLICACIONES.md';
const CLASSIFICATION_PATH =
  'docs/plan-canonico/modular/bloques/I_NAVEGACION_Y_PANTALLAS/03_CLASIFICACION_FUNCIONAL_Y_CONTEXTO_DE_USO.md';

const EXPECTED_ROWS = 264;
const EXPECTED_RENDERED_VIEWS = 252;
const EXPECTED_ALIASES = 7;
const EXPECTED_REDIRECTS = 5;
const PASS_STACK_NAMES = [
  'Home',
  'Club',
  'MyOrders',
  'ChooseSatellite',
  'DeliveryAddresses',
  'AccountSettings',
  'VentoCafe',
  'Saudo',
  'SatelliteExperience',
  'SatellitePass',
  'OrderHome',
  'OrderMenu',
  'OrderCheckout',
  'OrderPlaced',
  'OrderChat',
];
const PASS_SURFACE_IDS = Array.from(
  { length: 21 },
  (_, index) => `PASS-CUSTOMER-SURFACE-${String(index + 1).padStart(3, '0')}`,
);
const REDIRECT_IDS = new Set([
  'NEXO-ROUTE-055',
  'NEXO-ROUTE-057',
  'NEXO-ROUTE-058',
  'NEXO-ROUTE-064',
  'AURA-CURRENT-PUBLIC-007',
]);

function normalize(value) {
  return value.replace(/\r\n?/g, '\n');
}

function clean(value) {
  return value.replaceAll('`', '').replaceAll('*', '').trim();
}

function splitRow(line) {
  if (!line.startsWith('|') || !line.endsWith('|')) return null;
  return line.slice(1, -1).split('|').map(clean);
}

function task(source, id, nextId) {
  const start = source.search(new RegExp(`^###\\s+✅\\s+${id}\\b`, 'm'));
  if (start < 0) throw new Error(`no se encontró ${id}.`);
  const tail = source.slice(start + 1);
  const end = nextId
    ? tail.search(new RegExp(`^###\\s+(?:✅|🟡|❌|\\[[ x~]\\])\\s+${nextId}\\b`, 'm'))
    : -1;
  return source.slice(start, end < 0 ? source.length : start + 1 + end);
}

function matrix(section, columns, label) {
  const rows = section
    .split('\n')
    .map(splitRow)
    .filter((cells) =>
      cells?.length === columns
      && /^(?:NEXO|FOGO|ORIGO|PULSO|VISO|NUMERA|ANIMA|SHELL|PASS|AURA)-/.test(cells[0]));
  const result = new Map();
  for (const cells of rows) {
    if (result.has(cells[0])) throw new Error(`${cells[0]} está duplicada en ${label}.`);
    result.set(cells[0], cells);
  }
  return result;
}

function assertCoverage(reference, observed, label) {
  if (observed.size !== reference.size) {
    throw new Error(`${label} contiene ${observed.size} filas para ${reference.size} identidades de referencia.`);
  }
  for (const id of reference.keys()) {
    if (!observed.has(id)) throw new Error(`${label} no contiene ${id}.`);
  }
}

function count(matrixValue, index, expected) {
  return [...matrixValue.values()].filter((cells) => cells[index] === expected).length;
}

function sha(ids) {
  return crypto.createHash('sha256').update([...ids].sort().join('\n')).digest('hex');
}

function assertFragment(section, fragment, label) {
  if (!section.includes(fragment)) throw new Error(`${label} no declara ${fragment}.`);
}

function validateOptionalPassRepository(root, inventory) {
  const passApp = path.resolve(root, '..', 'vento-pass', 'App.js');
  if (!fs.existsSync(passApp)) return { checked: false, stackScreens: PASS_STACK_NAMES.length };
  const source = fs.readFileSync(passApp, 'utf8');
  const actual = [...source.matchAll(/<Stack\.Screen\s+name="([^"]+)"/g)].map((match) => match[1]);
  if (new Set(actual).size !== actual.length) throw new Error('vento-pass/App.js contiene Stack.Screen duplicados.');
  if (actual.length !== PASS_STACK_NAMES.length
    || actual.some((name, index) => name !== PASS_STACK_NAMES[index])) {
    throw new Error(
      `vento-pass/App.js declara [${actual.join(', ')}], pero el inventario congelado espera `
      + `[${PASS_STACK_NAMES.join(', ')}]. Ejecuta la reconciliación documental antes de compilar.`,
    );
  }
  for (const name of actual) {
    if (!inventory.includes(`\`${name} —`) && !inventory.includes(`\`${name} `)) {
      throw new Error(`AUTH-UI-009 no identifica la pantalla PASS ${name}.`);
    }
  }
  return { checked: true, stackScreens: actual.length };
}

export function validateBlockISurfaceMatrices({ root = process.cwd() } = {}) {
  const inventory = normalize(fs.readFileSync(path.join(root, INVENTORY_PATH), 'utf8'));
  const bindings = normalize(fs.readFileSync(path.join(root, BINDINGS_PATH), 'utf8'));
  const classification = normalize(fs.readFileSync(path.join(root, CLASSIFICATION_PATH), 'utf8'));
  const sections = {
    inventory: task(inventory, 'AUTH-UI-009', 'AUTH-UI-010'),
    process: task(bindings, 'AUTH-UI-011', 'AUTH-UI-012'),
    step: task(bindings, 'AUTH-UI-012', 'AUTH-UI-013'),
    application: task(bindings, 'AUTH-UI-013', 'AUTH-UI-014'),
    consumption: task(bindings, 'AUTH-UI-014'),
    operational: task(classification, 'AUTH-UI-015', 'AUTH-UI-016'),
  };
  const matrices = {
    process: matrix(sections.process, 7, 'AUTH-UI-011'),
    step: matrix(sections.step, 9, 'AUTH-UI-012'),
    application: matrix(sections.application, 10, 'AUTH-UI-013'),
    consumption: matrix(sections.consumption, 12, 'AUTH-UI-014'),
    operational: matrix(sections.operational, 13, 'AUTH-UI-015'),
  };

  if (matrices.process.size !== EXPECTED_ROWS) {
    throw new Error(`AUTH-UI-011 contiene ${matrices.process.size} filas; se requieren ${EXPECTED_ROWS}.`);
  }
  for (const [label, observed] of Object.entries(matrices)) {
    assertCoverage(matrices.process, observed, label);
  }
  for (const id of matrices.process.keys()) {
    const processId = matrices.process.get(id)[2];
    if (matrices.step.get(id)[2] !== processId
      || matrices.application.get(id)[2] !== processId
      || matrices.consumption.get(id)[2] !== processId
      || matrices.operational.get(id)[2] !== processId) {
      throw new Error(`${id} cambia primary_process_id entre AUTH-UI-011 y AUTH-UI-015.`);
    }
    const step = matrices.step.get(id)[3];
    if (matrices.application.get(id)[3] !== step
      || matrices.consumption.get(id)[3] !== step
      || matrices.operational.get(id)[3] !== step) {
      throw new Error(`${id} cambia primary_process_step_ref entre AUTH-UI-012 y AUTH-UI-015.`);
    }
    const primaryApp = matrices.application.get(id)[5];
    const ownerApp = matrices.application.get(id)[6];
    if (matrices.consumption.get(id)[4] !== primaryApp
      || matrices.operational.get(id)[5] !== primaryApp
      || matrices.consumption.get(id)[5] !== ownerApp
      || matrices.operational.get(id)[6] !== ownerApp) {
      throw new Error(`${id} cambia aplicación primaria o propietaria entre AUTH-UI-013 y AUTH-UI-015.`);
    }
    const consumerOnly = matrices.consumption.get(id)[6];
    if (!['true', 'false'].includes(consumerOnly)) {
      throw new Error(`${id} usa consumer_only inválido ${consumerOnly}.`);
    }
    if (matrices.operational.get(id)[7] !== consumerOnly) {
      throw new Error(`${id} cambia consumer_only al entrar en AUTH-UI-015.`);
    }
  }

  for (const id of PASS_SURFACE_IDS) {
    if (!sections.inventory.includes(`\`${id}\``)) throw new Error(`AUTH-UI-009 no contiene ${id}.`);
    if (!matrices.process.has(id)) throw new Error(`las matrices no contienen ${id}.`);
  }
  const optionalRepository = validateOptionalPassRepository(root, sections.inventory);

  const aliases = [...matrices.operational.values()].filter((cells) => cells[9] === 'ALIAS_INHERITED');
  const redirects = [...matrices.operational.values()].filter((cells) => cells[9] === 'REDIRECT_INHERITED');
  if (aliases.length !== EXPECTED_ALIASES) {
    throw new Error(`AUTH-UI-015 contiene ${aliases.length} aliases; se requieren ${EXPECTED_ALIASES}.`);
  }
  if (redirects.length !== EXPECTED_REDIRECTS) {
    throw new Error(`AUTH-UI-015 contiene ${redirects.length} redirects; se requieren ${EXPECTED_REDIRECTS}.`);
  }
  for (const id of REDIRECT_IDS) {
    const processRow = matrices.process.get(id);
    const operationalRow = matrices.operational.get(id);
    if (processRow[4] !== 'REDIRECT_ALIAS') throw new Error(`${id} no conserva binding_mode REDIRECT_ALIAS.`);
    if (operationalRow[8] !== 'false'
      || operationalRow[9] !== 'REDIRECT_INHERITED'
      || operationalRow[10] !== 'INHERITED') {
      throw new Error(`${id} se trata como vista operativa o renderizada independiente.`);
    }
  }

  const uniqueRendered = matrices.process.size - aliases.length - redirects.length;
  if (uniqueRendered !== EXPECTED_RENDERED_VIEWS) {
    throw new Error(`se derivan ${uniqueRendered} vistas renderizadas; se requieren ${EXPECTED_RENDERED_VIEWS}.`);
  }
  const operationalCounts = {
    direct: count(matrices.operational, 9, 'DIRECT_OPERATION'),
    hybrid: count(matrices.operational, 9, 'HYBRID_OPERATION'),
    nonOperational: count(matrices.operational, 9, 'NOT_OPERATIONAL'),
    alias: aliases.length,
    redirect: redirects.length,
    operational: count(matrices.operational, 8, 'true'),
  };
  const expectedOperational = {
    direct: 28,
    hybrid: 31,
    nonOperational: 193,
    alias: 7,
    redirect: 5,
    operational: 59,
  };
  for (const [key, expected] of Object.entries(expectedOperational)) {
    if (operationalCounts[key] !== expected) {
      throw new Error(`AUTH-UI-015 deriva ${operationalCounts[key]} para ${key}; se requieren ${expected}.`);
    }
  }

  const fingerprints = {
    direct: sha([...matrices.operational.values()]
      .filter((cells) => cells[9] === 'DIRECT_OPERATION').map((cells) => cells[0])),
    hybrid: sha([...matrices.operational.values()]
      .filter((cells) => cells[9] === 'HYBRID_OPERATION').map((cells) => cells[0])),
    nonOperational: sha([...matrices.operational.values()]
      .filter((cells) => cells[9] === 'NOT_OPERATIONAL').map((cells) => cells[0])),
    alias: sha([...matrices.operational.values()]
      .filter((cells) => cells[9] === 'ALIAS_INHERITED').map((cells) => cells[0])),
    redirect: sha([...matrices.operational.values()]
      .filter((cells) => cells[9] === 'REDIRECT_INHERITED').map((cells) => cells[0])),
  };
  const fingerprintLabels = {
    direct: 'DIRECT_OPERATION_SHA256',
    hybrid: 'HYBRID_OPERATION_SHA256',
    nonOperational: 'NOT_OPERATIONAL_SHA256',
    alias: 'ALIAS_INHERITED_SHA256',
    redirect: 'REDIRECT_INHERITED_SHA256',
  };
  const missingFingerprints = Object.entries(fingerprints)
    .map(([key, hash]) => `${fingerprintLabels[key]} = ${hash}`)
    .filter((fragment) => !sections.operational.includes(fragment));
  if (missingFingerprints.length) {
    throw new Error(`AUTH-UI-015 no declara las huellas vigentes: ${missingFingerprints.join('; ')}.`);
  }
  for (const section of [sections.process, sections.step, sections.application, sections.consumption]) {
    assertFragment(section, '**264**', 'matriz BLOQUE I');
    assertFragment(section, '**252**', 'matriz BLOQUE I');
    assertFragment(section, '**12**', 'matriz BLOQUE I');
  }
  assertFragment(sections.operational, '**264**', 'AUTH-UI-015');
  assertFragment(sections.operational, '**252**', 'AUTH-UI-015');
  assertFragment(sections.operational, '**12**', 'AUTH-UI-015');
  assertFragment(
    sections.consumption,
    '| Tarea canónica propietaria | `AUTH-UI-030`',
    'AUTH-UI-014-COR-001',
  );
  assertFragment(
    sections.consumption,
    '| Estado de la acción  | `BLOCKING_PRECONDITION`',
    'AUTH-UI-014-COR-001',
  );

  return {
    rows: matrices.process.size,
    renderedViews: uniqueRendered,
    aliases: aliases.length,
    redirects: redirects.length,
    passSurfaces: PASS_SURFACE_IDS.length,
    passRepositoryChecked: optionalRepository.checked,
    operational: operationalCounts.operational,
    fingerprints,
  };
}

const isCli = process.argv[1] && path.resolve(process.argv[1]) === fileURLToPath(import.meta.url);
if (isCli) {
  try {
    const stats = validateBlockISurfaceMatrices();
    console.log(
      `OK: BLOQUE I; ${stats.rows} filas; ${stats.renderedViews} vistas renderizadas; `
      + `${stats.aliases} aliases; ${stats.redirects} redirects; ${stats.passSurfaces} superficies PASS; `
      + `${stats.operational} operativas${stats.passRepositoryChecked ? '; vento-pass verificado' : ''}.`,
    );
  } catch (error) {
    console.error(`ERROR: matrices BLOQUE I inválidas:\n- ${error instanceof Error ? error.message : String(error)}`);
    process.exit(1);
  }
}
