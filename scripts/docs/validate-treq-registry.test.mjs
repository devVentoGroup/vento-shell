import assert from 'node:assert/strict';
import fs from 'node:fs';
import os from 'node:os';
import path from 'node:path';
import test from 'node:test';

import {
  deriveLatestTreqTaskId,
  extractDerivedTreqIds,
  validateAffectedTreqDeclaration,
  validateTreqRegistrySource,
} from './validate-treq-registry.mjs';
import {
  readCanonicalTreqRegistryBundle,
} from './treq-registry-files.mjs';

const COLUMNS = [
  'ID',
  'Dominio',
  'Regla protegida',
  'Origen',
  'Riesgo / prioridad',
  'Tipo / modalidad',
  'Tarea responsable',
  'Paquete',
  'Repositorio / ambiente',
  'Estado',
  'Artefacto',
  'Último resultado',
  'Evidencia',
  'Relación',
];

const ALLOWED_STATES = [
  'IDENTIFICADO',
  'ESPECIFICADO',
  'PLANIFICADO',
  'IMPLEMENTADO',
  'VERIFICADO',
  'DIFERIDO',
  'DESCARTADO',
  'OBSOLETO',
];

const context = {
  tasks: new Map([
    ['TASK-BASE-001', {
      id: 'TASK-BASE-001',
      state: 'APROBADA',
      derivedIds: ['TREQ-AUTH-001'],
    }],
    ['TASK-BASE-002', {
      id: 'TASK-BASE-002',
      state: 'APROBADA',
      derivedIds: [],
    }],
    ['TASK-BASE-003', {
      id: 'TASK-BASE-003',
      state: 'NO INICIADA',
      derivedIds: [],
    }],
    ['TASK-PROC-001', {
      id: 'TASK-PROC-001',
      state: 'APROBADA',
      derivedIds: [],
    }],
    ['E5-GATE-008', {
      id: 'E5-GATE-008',
      state: 'APROBADA',
      derivedIds: [],
    }],
  ]),
  expectedLatestTaskId: 'TASK-BASE-001',
};

function row(overrides = {}) {
  return {
    ID: 'TREQ-AUTH-001',
    Dominio: 'AUTH',
    'Regla protegida': 'La autorización se valida.',
    Origen: 'TASK-BASE-001',
    'Riesgo / prioridad': 'Acceso indebido / crítica',
    'Tipo / modalidad': 'seguridad + regresión / automatizada',
    'Tarea responsable': 'TASK-BASE-001',
    Paquete: 'Paquete aprobado',
    'Repositorio / ambiente': 'devVentoGroup/vento-shell / CI',
    Estado: 'IDENTIFICADO',
    Artefacto: 'Pendiente',
    'Último resultado': 'Pendiente',
    Evidencia: 'Definida en TASK-BASE-001 aprobada',
    Relación: '—',
    ...overrides,
  };
}

function markdownCell(column, value, backticks) {
  if (!backticks) return String(value);
  if (['ID', 'Dominio', 'Estado'].includes(column)) return `\`${value}\``;
  if (['Origen', 'Tarea responsable'].includes(column)
      && /^[A-Z][A-Z0-9-]+-\d{3}$/u.test(String(value))) {
    return `\`${value}\``;
  }
  return String(value);
}

function buildRegistry({
  rows = [row()],
  declaredDomains = null,
  summaryOverrides = {},
  distributionOverride = null,
  renderBackticks = true,
} = {}) {
  const domains = declaredDomains ?? [...new Set(rows.map((entry) => entry.Dominio))];
  const duplicateCount = rows.length - new Set(rows.map((entry) => entry.ID)).size;
  const summary = {
    requirements: rows.length,
    domains: domains.filter((domain) => rows.some((entry) => entry.Dominio === domain)).length,
    validRows: rows.length,
    totalRows: rows.length,
    duplicates: duplicateCount,
    unresolved: 0,
    latest: 'TASK-BASE-001',
    ...summaryOverrides,
  };

  const domainList = domains.map((domain) => `- \`${domain}\`.`).join('\n');
  const states = ALLOWED_STATES
    .map((state) => `| \`${state}\` | ${state.toLowerCase()} |`)
    .join('\n');

  const domainSections = domains.map((domain) => {
    const domainRows = rows.filter((entry) => entry.Dominio === domain);
    const renderedRows = domainRows.map((entry) =>
      `| ${COLUMNS.map((column) => markdownCell(column, entry[column] ?? '', renderBackticks)).join(' | ')} |`
    ).join('\n');
    return `#### ${domain}\n\n| ${COLUMNS.join(' | ')} |\n| ${COLUMNS.map(() => '---').join(' | ')} |\n${renderedRows}`;
  }).join('\n\n');

  const calculatedDistribution = domains.map((domain) => {
    const domainRows = rows.filter((entry) => entry.Dominio === domain);
    const firstId = domainRows[0]?.ID ?? '';
    const lastId = domainRows.at(-1)?.ID ?? '';
    const range = domainRows.length === 1
      ? firstId
      : domainRows.length > 1
        ? `${firstId} a ${lastId}`
        : '';
    return { domain, range, count: domainRows.length };
  });
  const distribution = distributionOverride ?? calculatedDistribution;
  const distributionRows = distribution
    .map((entry) => `| \`${entry.domain}\` | ${entry.range ? `\`${entry.range.replace(' a ', '\` a \`')}\`` : ''} | ${entry.count} |`)
    .join('\n');

  return `## REGISTRO CANÓNICO DE REQUISITOS DE PRUEBA

### Convención de identificadores

Dominios iniciales:

${domainList}

### Estados permitidos

| Estado | Significado |
| --- | --- |
${states}

### Tipos permitidos

- seguridad;
- contractual;
- integración;
- regresión;

### Resumen vigente

| Métrica | Resultado |
| --- | ---: |
| Requisitos vigentes | **${summary.requirements}** |
| Dominios con requisitos | **${summary.domains}** |
| Filas con catorce columnas | **${summary.validRows} de ${summary.totalRows}** |
| Identificadores duplicados | **${summary.duplicates}** |
| Relaciones \`TREQ-*\` no resolubles | **${summary.unresolved}** |
| Última tarea incorporada | \`${summary.latest}\` |

Distribución vigente:

| Dominio | Rango | Cantidad |
| --- | --- | ---: |
${distributionRows}

### Procedimiento obligatorio de actualización

1. Regenerar.

### Registro

${domainSections}

### Reglas obligatorias
`;
}

function errorsFor(source, options = {}) {
  return validateTreqRegistrySource(source, context, options).errors.join('\n');
}

function codesFor(source, options = {}) {
  return validateTreqRegistrySource(source, context, options).diagnostics.map((entry) => entry.code);
}

function makeFragmentRoot({
  manifestFiles = null,
  extraFiles = {},
  legacySource = null,
  writeOrder = null,
} = {}) {
  const root = fs.mkdtempSync(path.join(os.tmpdir(), 'ci017-treq-'));
  const baseDir = path.join(root, 'docs', 'plan-canonico', 'modular');
  const fragmentDir = path.join(baseDir, 'bloques', 'E1_DESCUBRIMIENTO_OPERATIVO');
  fs.mkdirSync(fragmentDir, { recursive: true });

  const defaultFiles = {
    'bloques/E1_DESCUBRIMIENTO_OPERATIVO/04A_00_CABECERA_Y_GOBIERNO_DEL_REGISTRO.md':
      '## REGISTRO CANÓNICO DE REQUISITOS DE PRUEBA\n### Registro\n',
    'bloques/E1_DESCUBRIMIENTO_OPERATIVO/04A_01_AUTH.md':
      '#### AUTH\n| ID |\n',
    'bloques/E1_DESCUBRIMIENTO_OPERATIVO/04A_20_REGLAS_OBLIGATORIAS.md':
      '### Reglas obligatorias\n',
    ...extraFiles,
  };
  const files = manifestFiles ?? Object.keys(defaultFiles);
  const order = writeOrder ?? Object.keys(defaultFiles);

  for (const relativePath of order) {
    if (!Object.hasOwn(defaultFiles, relativePath)) continue;
    const fullPath = path.join(baseDir, relativePath);
    fs.mkdirSync(path.dirname(fullPath), { recursive: true });
    const value = defaultFiles[relativePath];
    if (Buffer.isBuffer(value)) fs.writeFileSync(fullPath, value);
    else fs.writeFileSync(fullPath, value, 'utf8');
  }

  if (legacySource !== null) {
    fs.writeFileSync(
      path.join(fragmentDir, '04A_REGISTRO_CANONICO_DE_REQUISITOS_DE_PRUEBA.md'),
      legacySource,
      'utf8',
    );
  }
  fs.writeFileSync(path.join(baseDir, 'manifest.json'), `${JSON.stringify({ files }, null, 2)}\n`, 'utf8');
  return { root, baseDir, files: defaultFiles };
}

function cleanup(root) {
  fs.rmSync(root, { recursive: true, force: true });
}

const POSITIVE_CASES = [
  ['P01', 'reconstruye la familia modular registrada por manifest', () => {
    const fixture = makeFragmentRoot();
    try {
      const bundle = readCanonicalTreqRegistryBundle({ baseDir: fixture.baseDir });
      assert.equal(bundle.fragments.length, 3);
      assert.deepEqual(bundle.domains, ['AUTH']);
      assert.match(bundle.source, /REGISTRO CANÓNICO/);
    } finally {
      cleanup(fixture.root);
    }
  }],
  ['P02', 'acepta secuencias TREQ de cuatro dígitos', () => {
    const rows = Array.from({ length: 1000 }, (_, index) => row({
      ID: `TREQ-AUTH-${String(index + 1).padStart(3, '0')}`,
    }));
    const result = validateTreqRegistrySource(buildRegistry({ rows }), context);
    assert.deepEqual(result.errors, []);
    assert.equal(result.stats.requirements, 1000);
  }],
  ['P03', 'acepta múltiples dominios en el orden declarado', () => {
    const rows = [
      row(),
      row({
        ID: 'TREQ-PROC-001',
        Dominio: 'PROC',
        Origen: 'TASK-PROC-001',
        'Tarea responsable': 'TASK-PROC-001',
      }),
    ];
    const result = validateTreqRegistrySource(buildRegistry({ rows, declaredDomains: ['AUTH', 'PROC'] }), context);
    assert.deepEqual(result.errors, []);
    assert.deepEqual(result.stats.distribution.map((entry) => entry.domain), ['AUTH', 'PROC']);
  }],
  ['P04', 'acepta una relación TREQ individual resoluble', () => {
    const rows = [row(), row({ ID: 'TREQ-AUTH-002', Relación: 'TREQ-AUTH-001' })];
    assert.deepEqual(validateTreqRegistrySource(buildRegistry({ rows }), context).errors, []);
  }],
  ['P05', 'acepta un rango TREQ resoluble', () => {
    const rows = [
      row(),
      row({ ID: 'TREQ-AUTH-002' }),
      row({ ID: 'TREQ-AUTH-003', Relación: 'TREQ-AUTH-001 a TREQ-AUTH-002' }),
    ];
    assert.deepEqual(validateTreqRegistrySource(buildRegistry({ rows }), context).errors, []);
  }],
  ['P06', 'acepta tarea responsable canónica válida', () => {
    assert.deepEqual(validateTreqRegistrySource(buildRegistry(), context).errors, []);
  }],
  ['P07', 'acepta VERIFICADO con evidencia reproducible', () => {
    const source = buildRegistry({ rows: [row({
      Estado: 'VERIFICADO',
      Artefacto: 'E1-GATE-MANIFEST-002',
      'Último resultado': 'PASS_WITH_CARRYOVER',
      Evidencia: '11_E1_GATE_MANIFEST_002.md',
    })] });
    assert.deepEqual(validateTreqRegistrySource(source, context).errors, []);
  }],
  ['P08', 'acepta DIFERIDO con justificación y puerta determinista', () => {
    const source = buildRegistry({ rows: [row({
      Estado: 'DIFERIDO',
      'Último resultado': 'Diferido por riesgo aceptado de compatibilidad.',
      Evidencia: 'Reanudar cuando TASK-BASE-002 quede aprobada y se complete la puerta E5-GATE-008.',
    })] });
    assert.deepEqual(validateTreqRegistrySource(source, context).errors, []);
  }],
  ['P09', 'acepta baseline histórica preservada con filas nuevas', () => {
    const baseline = buildRegistry({ rows: [row()] });
    const currentRows = [row(), row({ ID: 'TREQ-AUTH-002' })];
    const result = validateTreqRegistrySource(buildRegistry({ rows: currentRows }), context, { baselineSource: baseline });
    assert.equal(result.report.historical_check, 'PASS');
    assert.deepEqual(result.report.historical_missing_ids, []);
  }],
  ['P10', 'conserva la última tarea TREQ al atravesar una tarea con cero cambios', () => {
    const tasks = new Map([
      ['TASK-BASE-001', { id: 'TASK-BASE-001', state: 'APROBADA', derivedIds: ['TREQ-AUTH-001'] }],
      ['TASK-BASE-002', { id: 'TASK-BASE-002', state: 'APROBADA', derivedIds: [] }],
      ['TASK-BASE-003', { id: 'TASK-BASE-003', state: 'NO INICIADA', derivedIds: [] }],
    ]);
    assert.equal(deriveLatestTreqTaskId({
      tasks,
      orderedTaskIds: [...tasks.keys()],
      currentTaskId: 'TASK-BASE-003',
      fallbackTaskId: null,
    }), 'TASK-BASE-001');
  }],
  ['P11', 'acepta declaración de TREQ afectados resoluble y sin duplicados', () => {
    const result = validateAffectedTreqDeclaration({
      affectedIds: ['TREQ-AUTH-001', 'TREQ-AUTH-002'],
      knownIds: new Set(['TREQ-AUTH-001', 'TREQ-AUTH-002']),
    });
    assert.equal(result.result, 'PASS');
  }],
  ['P12', 'deriva salida machine-readable del mismo resultado lógico', () => {
    const result = validateTreqRegistrySource(buildRegistry(), context);
    assert.equal(result.report.result, 'PASS');
    assert.equal(result.errors.length, 0);
    assert.deepEqual(Object.keys(result.report).slice(0, 13), [
      'result',
      'requirements',
      'domains',
      'fragments',
      'duplicates',
      'unresolved_relations',
      'invalid_rows',
      'verified_evidence_errors',
      'deferred_resolution_errors',
      'historical_missing_ids',
      'historical_check',
      'latest_task',
      'distribution',
    ]);
  }],
];

const NEGATIVE_CASES = [
  ['N01', 'bloquea un fragmento registrado ausente', () => {
    const fixture = makeFragmentRoot({
      manifestFiles: [
        'bloques/E1_DESCUBRIMIENTO_OPERATIVO/04A_00_CABECERA_Y_GOBIERNO_DEL_REGISTRO.md',
        'bloques/E1_DESCUBRIMIENTO_OPERATIVO/04A_01_AUTH.md',
        'bloques/E1_DESCUBRIMIENTO_OPERATIVO/04A_02_PROC.md',
        'bloques/E1_DESCUBRIMIENTO_OPERATIVO/04A_20_REGLAS_OBLIGATORIAS.md',
      ],
    });
    try {
      assert.throws(() => readCanonicalTreqRegistryBundle({ baseDir: fixture.baseDir }), /ausente/);
    } finally {
      cleanup(fixture.root);
    }
  }],
  ['N02', 'bloquea dominio físico duplicado', () => {
    const duplicatePath = 'bloques/E1_DESCUBRIMIENTO_OPERATIVO/04A_02_AUTH.md';
    const fixture = makeFragmentRoot({
      extraFiles: { [duplicatePath]: '#### AUTH\n| ID |\n' },
      manifestFiles: [
        'bloques/E1_DESCUBRIMIENTO_OPERATIVO/04A_00_CABECERA_Y_GOBIERNO_DEL_REGISTRO.md',
        'bloques/E1_DESCUBRIMIENTO_OPERATIVO/04A_01_AUTH.md',
        duplicatePath,
        'bloques/E1_DESCUBRIMIENTO_OPERATIVO/04A_20_REGLAS_OBLIGATORIAS.md',
      ],
    });
    try {
      assert.throws(() => readCanonicalTreqRegistryBundle({ baseDir: fixture.baseDir }), /duplicado/);
    } finally {
      cleanup(fixture.root);
    }
  }],
  ['N03', 'bloquea fila con trece columnas', () => {
    const source = buildRegistry().replace(/\| — \|\n\n### Reglas obligatorias/u, '|\n\n### Reglas obligatorias');
    assert.match(errorsFor(source), /fila con 13 columnas/);
  }],
  ['N04', 'bloquea fila con quince columnas', () => {
    const source = buildRegistry().replace(/\| — \|\n\n### Reglas obligatorias/u, '| — | EXTRA |\n\n### Reglas obligatorias');
    assert.match(errorsFor(source), /fila con 15 columnas/);
  }],
  ['N05', 'bloquea celda obligatoria vacía', () => {
    assert.ok(codesFor(buildRegistry({ rows: [row({ 'Regla protegida': '' })] })).includes('REQUIRED_CELL_EMPTY'));
  }],
  ['N06', 'bloquea identificador TREQ mal formado', () => {
    assert.ok(codesFor(buildRegistry({ rows: [row({ ID: 'TREQ-AUTH-X01' })] })).includes('TREQ_ID_INVALID'));
  }],
  ['N07', 'bloquea dominio incoherente con identificador', () => {
    const source = buildRegistry({ rows: [row({ Dominio: 'PROC' })], declaredDomains: ['PROC'] });
    assert.ok(codesFor(source).includes('ROW_DOMAIN_MISMATCH'));
  }],
  ['N08', 'bloquea identificador duplicado', () => {
    const source = buildRegistry({ rows: [row(), row()] });
    assert.ok(codesFor(source).includes('TREQ_ID_DUPLICATED'));
  }],
  ['N09', 'bloquea salto de secuencia', () => {
    const source = buildRegistry({ rows: [row(), row({ ID: 'TREQ-AUTH-003' })] });
    assert.ok(codesFor(source).includes('DOMAIN_SEQUENCE_INVALID'));
  }],
  ['N10', 'bloquea estado no permitido', () => {
    assert.ok(codesFor(buildRegistry({ rows: [row({ Estado: 'INVENTADO' })] })).includes('STATE_NOT_ALLOWED'));
  }],
  ['N11', 'bloquea tipo no permitido', () => {
    assert.ok(codesFor(buildRegistry({ rows: [row({ 'Tipo / modalidad': 'rendimiento / automatizada' })] })).includes('TYPE_NOT_ALLOWED'));
  }],
  ['N12', 'bloquea modalidad ausente', () => {
    assert.ok(codesFor(buildRegistry({ rows: [row({ 'Tipo / modalidad': 'seguridad' })] })).includes('TYPE_MODE_MISSING'));
  }],
  ['N13', 'bloquea Origen sin tarea canónica', () => {
    assert.ok(codesFor(buildRegistry({ rows: [row({ Origen: 'Sin tarea' })] })).includes('TASK_REFERENCE_MISSING'));
  }],
  ['N14', 'bloquea Tarea responsable inexistente', () => {
    const source = buildRegistry({ rows: [row({ 'Tarea responsable': 'TASK-BASE-999' })] });
    assert.ok(codesFor(source).includes('TASK_REFERENCE_UNKNOWN'));
  }],
  ['N15', 'bloquea autorreferencia TREQ', () => {
    assert.ok(codesFor(buildRegistry({ rows: [row({ Relación: 'TREQ-AUTH-001' })] })).includes('TREQ_SELF_REFERENCE'));
  }],
  ['N16', 'bloquea relación TREQ inexistente', () => {
    const source = buildRegistry({
      rows: [row({ Relación: 'TREQ-AUTH-999' })],
      summaryOverrides: { unresolved: 1 },
    });
    assert.ok(codesFor(source).includes('TREQ_RELATION_UNRESOLVED'));
  }],
  ['N17', 'bloquea rango TREQ invertido', () => {
    const source = buildRegistry({ rows: [row({ Relación: 'TREQ-AUTH-005 a TREQ-AUTH-002' })] });
    assert.ok(codesFor(source).includes('TREQ_RANGE_INVALID'));
  }],
  ['N18', 'bloquea resumen de requisitos desactualizado', () => {
    assert.ok(codesFor(buildRegistry({ summaryOverrides: { requirements: 2 } })).includes('REQUIREMENT_COUNT_MISMATCH'));
  }],
  ['N19', 'bloquea distribución incoherente', () => {
    const source = buildRegistry({ distributionOverride: [{ domain: 'AUTH', range: 'TREQ-AUTH-001 a TREQ-AUTH-002', count: 2 }] });
    assert.ok(codesFor(source).includes('DISTRIBUTION_ROW_MISMATCH'));
  }],
  ['N20', 'bloquea última tarea TREQ incoherente', () => {
    assert.ok(codesFor(buildRegistry({ summaryOverrides: { latest: 'TASK-BASE-002' } })).includes('LATEST_TASK_MISMATCH'));
  }],
  ['N21', 'bloquea VERIFICADO con artefacto pendiente', () => {
    const source = buildRegistry({ rows: [row({
      Estado: 'VERIFICADO',
      'Último resultado': 'PASS; exit_code=0',
      Evidencia: 'Reporte `.delivery/treq/run-1.json`; execution_id=run-1.',
    })] });
    assert.ok(codesFor(source).includes('VERIFIED_REQUIRED_FIELD_PENDING'));
  }],
  ['N22', 'bloquea VERIFICADO con evidencia genérica', () => {
    const source = buildRegistry({ rows: [row({
      Estado: 'VERIFICADO',
      Artefacto: 'scripts/docs/validate-treq-registry.test.mjs',
      'Último resultado': 'PASS; exit_code=0',
      Evidencia: 'probado',
    })] });
    assert.ok(codesFor(source).includes('VERIFIED_EVIDENCE_NOT_REPRODUCIBLE'));
  }],
  ['N23', 'bloquea DIFERIDO sin momento o puerta de reanudación', () => {
    const source = buildRegistry({ rows: [row({
      Estado: 'DIFERIDO',
      'Último resultado': 'Diferido por riesgo operativo.',
      Evidencia: 'Aplazado justificadamente.',
    })] });
    assert.ok(codesFor(source).includes('DEFERRED_RESUMPTION_MISSING'));
  }],
  ['N24', 'bloquea identificador histórico ausente frente a baseline', () => {
    const baseline = buildRegistry({ rows: [row(), row({ ID: 'TREQ-AUTH-002' })] });
    const current = buildRegistry({ rows: [row()] });
    const result = validateTreqRegistrySource(current, context, { baselineSource: baseline });
    assert.deepEqual(result.report.historical_missing_ids, ['TREQ-AUTH-002']);
    assert.equal(result.report.historical_check, 'FAIL');
  }],
];

const REGRESSION_CASES = [
  ['R01', 'no recupera autoridad desde el monolito legacy', () => {
    const fixture = makeFragmentRoot({ legacySource: 'LEGACY_NO_AUTORITATIVO\n' });
    try {
      const bundle = readCanonicalTreqRegistryBundle({ baseDir: fixture.baseDir });
      assert.doesNotMatch(bundle.source, /LEGACY_NO_AUTORITATIVO/);
      assert.match(bundle.source, /REGISTRO CANÓNICO/);
    } finally {
      cleanup(fixture.root);
    }
  }],
  ['R02', 'usa el orden de manifest y no el orden accidental del filesystem', () => {
    const procPath = 'bloques/E1_DESCUBRIMIENTO_OPERATIVO/04A_02_PROC.md';
    const header = 'bloques/E1_DESCUBRIMIENTO_OPERATIVO/04A_00_CABECERA_Y_GOBIERNO_DEL_REGISTRO.md';
    const auth = 'bloques/E1_DESCUBRIMIENTO_OPERATIVO/04A_01_AUTH.md';
    const rules = 'bloques/E1_DESCUBRIMIENTO_OPERATIVO/04A_20_REGLAS_OBLIGATORIAS.md';
    const fixture = makeFragmentRoot({
      extraFiles: { [procPath]: '#### PROC\n| ID |\n' },
      manifestFiles: [header, auth, procPath, rules],
      writeOrder: [rules, procPath, auth, header],
    });
    try {
      const bundle = readCanonicalTreqRegistryBundle({ baseDir: fixture.baseDir });
      assert.ok(bundle.source.indexOf('#### AUTH') < bundle.source.indexOf('#### PROC'));
    } finally {
      cleanup(fixture.root);
    }
  }],
  ['R03', 'normaliza backticks opcionales sin cambiar identidad lógica', () => {
    const source = buildRegistry({ renderBackticks: false });
    assert.deepEqual(validateTreqRegistrySource(source, context).errors, []);
  }],
  ['R04', 'no trunca secuencias superiores a 999', () => {
    const rows = Array.from({ length: 1001 }, (_, index) => row({
      ID: `TREQ-AUTH-${String(index + 1).padStart(3, '0')}`,
    }));
    const result = validateTreqRegistrySource(buildRegistry({ rows }), context);
    assert.equal(result.stats.distribution[0].lastId, 'TREQ-AUTH-1001');
    assert.deepEqual(result.errors, []);
  }],
  ['R05', 'una tarea aprobada con cero TREQ no desplaza la última tarea incorporada', () => {
    const body = `#### 39. Requisitos de prueba derivados\n\n**Resultado:** NO GENERA REQUISITOS DE PRUEBA\n**Requisitos creados:** **0**\n**Requisitos modificados:** **0**\nTREQ-AUTH-999 se cita solo como cobertura.\n\n#### 40. Cierre`;
    assert.deepEqual(extractDerivedTreqIds(body), []);
  }],
  ['R06', 'mantiene bloqueo de lenguaje de propuesta para tarea aprobada', () => {
    const source = buildRegistry({ rows: [row({ Evidencia: 'Definida en propuesta TASK-BASE-001' })] });
    assert.ok(codesFor(source).includes('APPROVED_TASK_CALLED_PROPOSAL'));
  }],
  ['R07', 'la lectura canónica permanece de solo lectura', () => {
    const fixture = makeFragmentRoot();
    try {
      const authPath = path.join(fixture.baseDir, 'bloques/E1_DESCUBRIMIENTO_OPERATIVO/04A_01_AUTH.md');
      const before = fs.readFileSync(authPath, 'utf8');
      readCanonicalTreqRegistryBundle({ baseDir: fixture.baseDir });
      const after = fs.readFileSync(authPath, 'utf8');
      assert.equal(after, before);
    } finally {
      cleanup(fixture.root);
    }
  }],
  ['R08', 'un snapshot no suministrado no se infiere como baseline', () => {
    const result = validateTreqRegistrySource(buildRegistry(), context);
    assert.equal(result.report.historical_check, 'NOT_REQUESTED');
    assert.deepEqual(result.report.historical_missing_ids, []);
  }],
  ['R09', 'ausencia de baseline solicitada nunca se convierte en PASS histórico', () => {
    const result = validateTreqRegistrySource(buildRegistry(), context, { baselineRequired: true });
    assert.equal(result.report.historical_check, 'UNAVAILABLE');
    assert.equal(result.report.result, 'FAIL');
  }],
  ['R10', 'no permite eliminar una fila histórica DESCARTADO', () => {
    const baseline = buildRegistry({ rows: [row(), row({ ID: 'TREQ-AUTH-002', Estado: 'DESCARTADO' })] });
    const result = validateTreqRegistrySource(buildRegistry({ rows: [row()] }), context, { baselineSource: baseline });
    assert.deepEqual(result.report.historical_missing_ids, ['TREQ-AUTH-002']);
  }],
  ['R11', 'no permite eliminar una fila histórica OBSOLETO', () => {
    const baseline = buildRegistry({ rows: [row(), row({ ID: 'TREQ-AUTH-002', Estado: 'OBSOLETO' })] });
    const result = validateTreqRegistrySource(buildRegistry({ rows: [row()] }), context, { baselineSource: baseline });
    assert.deepEqual(result.report.historical_missing_ids, ['TREQ-AUTH-002']);
  }],
  ['R12', 'cualquier error bloqueante produce resultado FAIL', () => {
    const result = validateTreqRegistrySource(buildRegistry({ rows: [row({ Estado: 'INVENTADO' })] }), context);
    assert.equal(result.report.result, 'FAIL');
    assert.ok(result.report.errors.length > 0);
  }],
];

assert.equal(POSITIVE_CASES.length, 12);
assert.equal(NEGATIVE_CASES.length, 24);
assert.equal(REGRESSION_CASES.length, 12);

for (const [id, title, fn] of [...POSITIVE_CASES, ...NEGATIVE_CASES, ...REGRESSION_CASES]) {
  test(`CI017 ${id} — ${title}`, fn);
}