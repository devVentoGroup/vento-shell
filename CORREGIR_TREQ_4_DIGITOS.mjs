import fs from 'node:fs';
import path from 'node:path';
import { spawnSync } from 'node:child_process';

const root = process.cwd();
const requiredRootFile = path.join(root, 'package.json');

if (!fs.existsSync(requiredRootFile)) {
  console.error('ERROR: ejecuta este archivo desde la raíz del repositorio vento-shell.');
  process.exit(1);
}

const files = {
  validator: 'scripts/docs/validate-treq-registry.mjs',
  validatorTest: 'scripts/docs/validate-treq-registry.test.mjs',
  reconcile: 'scripts/docs/treq-safe-reconcile.mjs',
  reconcileTest: 'scripts/docs/treq-safe-reconcile.test.mjs',
  safeBuild: 'scripts/docs/safe-build-plan-canonico.mjs',
  registry:
    'docs/plan-canonico/modular/bloques/E1_DESCUBRIMIENTO_OPERATIVO/04A_REGISTRO_CANONICO_DE_REQUISITOS_DE_PRUEBA.md',
};

const originals = new Map();
const modified = new Map();

function read(relativePath) {
  const fullPath = path.join(root, relativePath);
  if (!fs.existsSync(fullPath)) {
    throw new Error(`No existe el archivo requerido: ${relativePath}`);
  }
  const source = fs.readFileSync(fullPath, 'utf8');
  originals.set(relativePath, source);
  modified.set(relativePath, source);
  return source;
}

for (const relativePath of Object.values(files)) {
  read(relativePath);
}

function replaceExactly(relativePath, search, replacement, description) {
  const source = modified.get(relativePath);
  const occurrences = source.split(search).length - 1;

  if (occurrences === 0 && source.includes(replacement)) {
    console.log(`OMITIDO: ${description}; la corrección ya estaba aplicada.`);
    return;
  }
  if (occurrences !== 1) {
    throw new Error(
      `${description}: se esperaba exactamente 1 coincidencia en ${relativePath}, `
        + `pero se encontraron ${occurrences}.`
    );
  }

  modified.set(relativePath, source.replace(search, replacement));
  console.log(`PREPARADO: ${description}.`);
}

function insertBeforeOnce(relativePath, marker, insertion, description) {
  const source = modified.get(relativePath);
  if (source.includes(insertion.trim())) {
    console.log(`OMITIDO: ${description}; la prueba ya existe.`);
    return;
  }

  const occurrences = source.split(marker).length - 1;
  if (occurrences !== 1) {
    throw new Error(
      `${description}: se esperaba exactamente 1 marcador en ${relativePath}, `
        + `pero se encontraron ${occurrences}.`
    );
  }

  modified.set(relativePath, source.replace(marker, `${insertion}\n${marker}`));
  console.log(`PREPARADO: ${description}.`);
}

replaceExactly(
  files.validator,
  'const TREQ_ID = /^TREQ-([A-Z]+)-(\\d{3})$/;',
  'const TREQ_ID = /^TREQ-([A-Z]+)-(\\d{3,})$/;',
  'permitir secuencias TREQ de tres o más dígitos'
);

replaceExactly(
  files.validator,
  '  const rangeRegex = /TREQ-([A-Z]+)-(\\d{3})`?\\s+a\\s+`?TREQ-\\1-(\\d{3})/g;',
  '  const rangeRegex = /TREQ-([A-Z]+)-(\\d{3,})`?\\s+a\\s+`?TREQ-\\1-(\\d{3,})/g;',
  'expandir rangos TREQ que superen 999'
);

replaceExactly(
  files.validator,
  '  for (const match of withoutRanges.matchAll(/\\bTREQ-[A-Z]+-\\d{3}\\b/g)) {',
  '  for (const match of withoutRanges.matchAll(/\\bTREQ-[A-Z]+-\\d{3,}\\b/g)) {',
  'resolver referencias individuales TREQ que superen 999'
);

replaceExactly(
  files.reconcile,
  'const TREQ_ROW_PATTERN = /^\\| `(?<id>TREQ-[A-Z]+-\\d{3})` \\|/;',
  'const TREQ_ROW_PATTERN = /^\\| `(?<id>TREQ-[A-Z]+-\\d{3,})` \\|/;',
  'indexar filas TREQ de cuatro o más dígitos durante la reconciliación'
);

replaceExactly(
  files.safeBuild,
  '      .map((error) => error.match(/^(TREQ-[A-Z]+-\\d{3}):/)?.[1])',
  '      .map((error) => error.match(/^(TREQ-[A-Z]+-\\d{3,}):/)?.[1])',
  'capturar errores asociados a identificadores TREQ que superen 999'
);

replaceExactly(
  files.registry,
  '`TREQ-<DOMINIO>-<NNN>`',
  '`TREQ-<DOMINIO>-<SECUENCIA>`\n\nLa secuencia utiliza un mínimo de tres dígitos (`001` a `999`) y continúa sin truncamiento cuando supera ese rango (`1000`, `1001`, ...).',
  'documentar la secuencia TREQ escalable sin límite artificial de 999'
);

const validatorRegressionTest = `test('acepta secuencias TREQ de cuatro dígitos', () => {
  const extraRows = Array.from({ length: 999 }, (_, index) => ({
    ID: \`\\\`TREQ-AUTH-\${String(index + 2).padStart(3, '0')}\\\`\`,
    Dominio: '\`AUTH\`',
  }));
  const source = registry({ extraRows }).replace(
    '| \`AUTH\` | \`TREQ-AUTH-001\` | 1000 |',
    '| \`AUTH\` | \`TREQ-AUTH-001\` a \`TREQ-AUTH-1000\` | 1000 |'
  );

  const result = validateTreqRegistrySource(source, context);
  assert.deepEqual(result.errors, []);
  assert.equal(result.stats.requirements, 1000);
});
`;

insertBeforeOnce(
  files.validatorTest,
  "test('rechaza identificadores duplicados'",
  validatorRegressionTest,
  'agregar regresión del validador para TREQ-*-1000'
);

const reconcileRegressionTest = `test('reconoce filas TREQ con secuencias de cuatro dígitos', () => {
  const baselineSource = \`\${row('TREQ-PROC-1000', 'Aprobada')}\\n\`;
  const currentSource = [
    row('TREQ-PROC-1000', 'Corregida'),
    row('TREQ-PROC-1001', 'Nueva'),
    '',
  ].join('\\n');

  const result = reconcileTreqRegistrySource({
    currentSource,
    baselineSource,
  });

  assert.deepEqual(result.changedExistingIds, ['TREQ-PROC-1000']);
  assert.deepEqual(result.newIds, ['TREQ-PROC-1001']);
  assert.deepEqual(result.missingBaselineIds, []);
});
`;

insertBeforeOnce(
  files.reconcileTest,
  "test('reporta filas históricas eliminadas y no las inventa'",
  reconcileRegressionTest,
  'agregar regresión de reconciliación para TREQ-*-1000+'
);

function restore() {
  for (const [relativePath, source] of originals) {
    fs.writeFileSync(path.join(root, relativePath), source, 'utf8');
  }
}

function runNode(args, label) {
  console.log(`\nEJECUTANDO: ${label}`);
  const result = spawnSync(process.execPath, args, {
    cwd: root,
    stdio: 'inherit',
    windowsHide: true,
  });

  if (result.error) throw result.error;
  if (result.status !== 0) {
    throw new Error(`${label} terminó con código ${result.status ?? 'desconocido'}.`);
  }
}

try {
  for (const [relativePath, source] of modified) {
    fs.writeFileSync(path.join(root, relativePath), source, 'utf8');
  }

  runNode(
    [
      '--test',
      'scripts/docs/validate-treq-registry.test.mjs',
      'scripts/docs/treq-safe-reconcile.test.mjs',
    ],
    'pruebas del registro y reconciliación TREQ'
  );
  runNode(
    ['scripts/docs/validate-treq-registry.mjs'],
    'validación del Registro Canónico TREQ'
  );
  runNode(
    ['scripts/docs/build-plan-canonico.mjs'],
    'compilación del Plan Canónico'
  );

  console.log('\nCORRECCIÓN COMPLETADA.');
  console.log('El dominio PROC puede continuar con TREQ-PROC-1000, 1001 y siguientes.');
  console.log('Revisa git diff, crea el commit y realiza push.');
} catch (error) {
  restore();
  console.error('\nERROR: la corrección no superó todas las verificaciones.');
  console.error('Se restauraron exactamente los archivos originales.');
  console.error(error instanceof Error ? error.message : String(error));
  process.exit(1);
}
