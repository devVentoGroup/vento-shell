import assert from 'node:assert/strict';
import test from 'node:test';

import { validateTreqRegistrySource } from './validate-treq-registry.mjs';

const context = {
  tasks: new Map([
    ['TASK-BASE-001', {
      id: 'TASK-BASE-001',
      state: 'APROBADA',
      derivedIds: ['TREQ-AUTH-001'],
    }],
  ]),
  expectedLatestTaskId: 'TASK-BASE-001',
};

function registry({ rowOverrides = {}, summaryOverrides = {}, extraRows = [] } = {}) {
  const row = {
    ID: '`TREQ-AUTH-001`',
    Dominio: '`AUTH`',
    'Regla protegida': 'La autorización se valida.',
    Origen: '`TASK-BASE-001`',
    'Riesgo / prioridad': 'Acceso indebido / crítica',
    'Tipo / modalidad': 'seguridad + regresión / automatizada',
    'Tarea responsable': '`TASK-BASE-001`',
    Paquete: 'Paquete aprobado',
    'Repositorio / ambiente': 'vento-shell / CI',
    Estado: '`IDENTIFICADO`',
    Artefacto: 'Pendiente',
    'Último resultado': 'Pendiente',
    Evidencia: 'Definida en `TASK-BASE-001` aprobada',
    Relación: '—',
    ...rowOverrides,
  };
  const columns = Object.keys(row);
  const dataRows = [row, ...extraRows]
    .map((entry) => `| ${columns.map((column) => entry[column] ?? row[column]).join(' | ')} |`)
    .join('\n');
  const summary = {
    requirements: 1 + extraRows.length,
    domains: 1,
    validRows: 1 + extraRows.length,
    totalRows: 1 + extraRows.length,
    duplicates: 0,
    unresolved: 0,
    latest: '`TASK-BASE-001`',
    ...summaryOverrides,
  };

  return `## REGISTRO CANÓNICO DE REQUISITOS DE PRUEBA

### Convención de identificadores

Dominios iniciales:

- \`AUTH\`.

### Estados permitidos

| Estado | Significado |
| --- | --- |
| \`IDENTIFICADO\` | identificado |
| \`DIFERIDO\` | diferido |

### Tipos permitidos

- seguridad.

### Resumen vigente

| Métrica | Resultado |
| --- | ---: |
| Requisitos vigentes | **${summary.requirements}** |
| Dominios con requisitos | **${summary.domains}** |
| Filas con catorce columnas | **${summary.validRows} de ${summary.totalRows}** |
| Identificadores duplicados | **${summary.duplicates}** |
| Relaciones \`TREQ-*\` no resolubles | **${summary.unresolved}** |
| Última tarea incorporada | ${summary.latest} |

Distribución vigente:

| Dominio | Rango | Cantidad |
| --- | --- | ---: |
| \`AUTH\` | \`TREQ-AUTH-001\` | ${1 + extraRows.length} |

### Procedimiento obligatorio de actualización

1. Regenerar.

### Registro

#### AUTH

| ID | Dominio | Regla protegida | Origen | Riesgo / prioridad | Tipo / modalidad | Tarea responsable | Paquete | Repositorio / ambiente | Estado | Artefacto | Último resultado | Evidencia | Relación |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
${dataRows}

### Reglas obligatorias
`;
}

function errorsFor(source) {
  return validateTreqRegistrySource(source, context).errors.join('\n');
}

test('acepta un registro coherente sin cifras hardcodeadas', () => {
  const result = validateTreqRegistrySource(registry(), context);
  assert.deepEqual(result.errors, []);
  assert.equal(result.stats.requirements, 1);
  assert.equal(result.stats.latestTask, 'TASK-BASE-001');
});

test('acepta secuencias TREQ de cuatro dígitos', () => {
  const extraRows = Array.from({ length: 999 }, (_, index) => ({
    ID: `\`TREQ-AUTH-${String(index + 2).padStart(3, '0')}\``,
    Dominio: '`AUTH`',
  }));
  const source = registry({ extraRows }).replace(
    '| `AUTH` | `TREQ-AUTH-001` | 1000 |',
    '| `AUTH` | `TREQ-AUTH-001` a `TREQ-AUTH-1000` | 1000 |'
  );

  const result = validateTreqRegistrySource(source, context);
  assert.deepEqual(result.errors, []);
  assert.equal(result.stats.requirements, 1000);
});

test('rechaza identificadores duplicados', () => {
  const duplicate = {
    ID: '`TREQ-AUTH-001`',
    Dominio: '`AUTH`',
  };
  assert.match(errorsFor(registry({
    extraRows: [duplicate],
    summaryOverrides: { duplicates: 1 },
  })), /Identificador duplicado/);
});

test('rechaza una fila con menos de catorce columnas', () => {
  const source = registry().replace(
    /\| — \|\n\n### Reglas obligatorias/,
    '|\n\n### Reglas obligatorias'
  );
  assert.match(errorsFor(source), /fila con 13 columnas/);
});

test('rechaza dominio incoherente con el identificador', () => {
  assert.match(errorsFor(registry({
    rowOverrides: { Dominio: '`PROC`' },
  })), /dominio de la fila/);
});

test('rechaza saltos en la secuencia numérica del dominio', () => {
  assert.match(errorsFor(registry({
    rowOverrides: { ID: '`TREQ-AUTH-002`' },
  })), /secuencia inválida/);
});

test('rechaza relaciones TREQ no resolubles', () => {
  assert.match(errorsFor(registry({
    rowOverrides: { Relación: '`TREQ-AUTH-999`' },
    summaryOverrides: { unresolved: 1 },
  })), /relación no resoluble/);
});

test('rechaza cifras desactualizadas del resumen', () => {
  assert.match(errorsFor(registry({
    summaryOverrides: { requirements: 2 },
  })), /declara 2 requisitos y existen 1/);
});

test('rechaza estados fuera del catálogo permitido', () => {
  assert.match(errorsFor(registry({
    rowOverrides: { Estado: '`INVENTADO`' },
  })), /estado no permitido/);
});

test('rechaza evidencia que llama propuesta a una tarea aprobada', () => {
  assert.match(errorsFor(registry({
    rowOverrides: { Evidencia: 'Definida en propuesta `TASK-BASE-001`' },
  })), /sigue llamando propuesta/);
});

test('rechaza extremos inexistentes dentro de un rango de tareas canónicas', () => {
  assert.match(errorsFor(registry({
    rowOverrides: {
      'Tarea responsable': '`TASK-BASE-001` a `TASK-BASE-002`',
    },
  })), /tareas canónicas inexistentes: TASK-BASE-002/);
});

test('rechaza lenguaje residual de propuesta para una tarea fuente aprobada', () => {
  assert.match(errorsFor(registry({
    rowOverrides: {
      Evidencia: 'Regla de transferencia propuesta; aprobación pendiente',
    },
  })), /conserva lenguaje de propuesta o aprobación pendiente/);
});

test('rechaza una última tarea incoherente con la secuencia activa', () => {
  assert.match(errorsFor(registry({
    summaryOverrides: { latest: '`OTHER-BASE-001`' },
  })), /última tarea debe ser TASK-BASE-001/);
});
