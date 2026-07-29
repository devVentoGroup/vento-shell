import fs from 'node:fs';
import path from 'node:path';
import { fileURLToPath } from 'node:url';

const scriptDirectory = path.dirname(fileURLToPath(import.meta.url));
const repositoryRoot = path.resolve(scriptDirectory, '..', '..');
const planRoot = path.join(
  repositoryRoot,
  'docs',
  'plan-canonico',
  'modular',
  'bloques'
);
const registryPath = path.join(
  planRoot,
  'E1_DESCUBRIMIENTO_OPERATIVO',
  '04A_REGISTRO_CANONICO_DE_REQUISITOS_DE_PRUEBA.md'
);
const taskPaths = [
  path.join(
    planRoot,
    'I_NAVEGACION_Y_PANTALLAS',
    '01_INVENTARIO_COMPLETO_DE_SUPERFICIES.md'
  ),
  path.join(
    planRoot,
    'I_NAVEGACION_Y_PANTALLAS',
    '02_VINCULACION_CON_PROCESOS_Y_APLICACIONES.md'
  ),
  path.join(
    planRoot,
    'I_NAVEGACION_Y_PANTALLAS',
    '03_CLASIFICACION_FUNCIONAL_Y_CONTEXTO_DE_USO.md'
  ),
];

const NEW_ROW_METADATA = new Map([
  ...Array.from({ length: 8 }, (_, index) => {
    const number = 35 + index;
    return [
      `TREQ-PASS-${String(number).padStart(3, '0')}`,
      {
        origin: '`AUTH-UI-009` / `PASS-CUSTOMER-SURFACE-INVENTORY-001`',
        risk:
          'Inventario incompleto, deriva entre código y plan o atribución funcional incorrecta / crítica',
        type:
          'contractual + estática + integración + regresión / automatizada',
        task:
          '`AUTH-UI-009`; `AUTH-UI-011` a `AUTH-UI-015`; `AUTH-UI-026`',
        package: 'Inventario integral PASS y validador del BLOQUE I',
        repository:
          '`vento-pass`, `vento-shell` / desarrollo local y CI documental',
        evidence:
          'Inventario documental aprobado; implementación y evidencia runtime permanecen pendientes.',
        relation:
          '`TREQ-PASS-013`; `TREQ-PASS-034`; `TREQ-UX-1579`; `TREQ-UX-1593`',
      },
    ];
  }),
  [
    'TREQ-UX-1603',
    {
      origin: '`AUTH-UI-015` / `VIEW-OPERATIONAL-CLASSIFICATION-001`',
      risk:
        'Deriva silenciosa entre matrices consecutivas y clasificación construida sobre vínculos alterados / crítica',
      type: 'contractual + estática + regresión / automatizada',
      task: '`AUTH-UI-015`; `SHELL-CI-017`',
      package: 'Validador transversal de matrices del BLOQUE I',
      repository: '`vento-shell` / CI documental',
      evidence:
        'Validador documental incorporado; implementación funcional permanece pendiente.',
      relation:
        '`TREQ-UX-1579`; `TREQ-UX-1580`; `TREQ-UX-1602`',
    },
  ],
  [
    'TREQ-UX-1604',
    {
      origin: '`AUTH-UI-015` / `VIEW-OPERATIONAL-CLASSIFICATION-001`',
      risk:
        'Duplicación de vistas, conteos falsos y herencia incorrecta de navegación / alta',
      type: 'contractual + estática + navegación + regresión / automatizada',
      task: '`AUTH-UI-015`; `SHELL-CI-017`',
      package: 'Validador transversal de matrices del BLOQUE I',
      repository: '`vento-shell` / CI documental',
      evidence:
        'Semántica documental y validador incorporados; evidencia runtime permanece pendiente.',
      relation:
        '`TREQ-UX-1579`; `TREQ-UX-1581`; `TREQ-UX-1585`; `TREQ-UX-1602`',
    },
  ],
]);

function splitMarkdownRow(line) {
  if (!line.trim().startsWith('|') || !line.trim().endsWith('|')) return null;

  const cells = [];
  let current = '';
  let escaped = false;

  for (const character of line.trim().slice(1, -1)) {
    if (escaped) {
      current += character;
      escaped = false;
    } else if (character === '\\') {
      current += character;
      escaped = true;
    } else if (character === '|') {
      cells.push(current.trim());
      current = '';
    } else {
      current += character;
    }
  }

  cells.push(current.trim());
  return cells;
}

function cleanId(value) {
  return value?.replaceAll('`', '').trim();
}

function isManagedId(id) {
  const match = id.match(/^TREQ-(PASS|UX)-(\d+)$/);
  if (!match) return false;

  const number = Number(match[2]);
  return (
    (match[1] === 'PASS' && number >= 35 && number <= 42) ||
    (match[1] === 'UX' && number >= 1483 && number <= 1604)
  );
}

function collectTaskRules() {
  const rules = new Map();

  for (const taskPath of taskPaths) {
    const source = fs.readFileSync(taskPath, 'utf8');

    for (const line of source.split(/\r?\n/)) {
      const cells = splitMarkdownRow(line);
      if (cells?.length !== 2) continue;

      const id = cleanId(cells[0]);
      if (isManagedId(id)) {
        rules.set(id, cells[1]);
      }
    }
  }

  return rules;
}

function createRegistryRow(id, rule) {
  const metadata = NEW_ROW_METADATA.get(id);
  if (!metadata) {
    throw new Error(`No existe metadata para incorporar ${id}.`);
  }

  const domain = id.split('-')[1];
  return [
    `\`${id}\``,
    `\`${domain}\``,
    rule,
    metadata.origin,
    metadata.risk,
    metadata.type,
    metadata.task,
    metadata.package,
    metadata.repository,
    '`IDENTIFICADO`',
    'Pendiente',
    'Pendiente',
    metadata.evidence,
    metadata.relation,
  ];
}

function renderRow(cells) {
  return `| ${cells.join(' | ')} |`;
}

function reconcile() {
  const taskRules = collectTaskRules();
  const newline = fs.readFileSync(registryPath, 'utf8').includes('\r\n')
    ? '\r\n'
    : '\n';
  const lines = fs.readFileSync(registryPath, 'utf8').replace(/\r\n?/g, '\n').split('\n');
  const registryRows = new Map();

  lines.forEach((line, index) => {
    const cells = splitMarkdownRow(line);
    if (cells?.length === 14) {
      const id = cleanId(cells[0]);
      if (/^TREQ-[A-Z]+-\d+$/.test(id)) {
        registryRows.set(id, { index, cells });
      }
    }
  });

  let updated = 0;
  for (const [id, rule] of taskRules) {
    const existing = registryRows.get(id);
    if (!existing) continue;
    if (existing.cells[2] !== rule) {
      existing.cells[2] = rule;
      lines[existing.index] = renderRow(existing.cells);
      updated += 1;
    }
  }

  for (const id of NEW_ROW_METADATA.keys()) {
    if (registryRows.has(id)) continue;

    const rule = taskRules.get(id);
    if (!rule) {
      throw new Error(`La tarea fuente no declara ${id}.`);
    }

    const domain = id.split('-')[1];
    const number = Number(id.split('-').at(-1));
    const previousId = `TREQ-${domain}-${String(number - 1).padStart(3, '0')}`;
    const previous = registryRows.get(previousId);
    if (!previous) {
      throw new Error(`No se encontró ${previousId} para insertar ${id}.`);
    }

    const row = createRegistryRow(id, rule);
    lines.splice(previous.index + 1, 0, renderRow(row));

    for (const registryRow of registryRows.values()) {
      if (registryRow.index > previous.index) registryRow.index += 1;
    }
    registryRows.set(id, { index: previous.index + 1, cells: row });
  }

  let output = lines.join('\n');
  output = output
    .replace('| Requisitos vigentes               |         **3608** |', '| Requisitos vigentes               |         **3618** |')
    .replace('| Filas con catorce columnas        | **3608 de 3608** |', '| Filas con catorce columnas        | **3618 de 3618** |')
    .replace(
      '| `PASS`        | `TREQ-PASS-001` a `TREQ-PASS-034`               |       34 |',
      '| `PASS`        | `TREQ-PASS-001` a `TREQ-PASS-042`               |       42 |'
    )
    .replace(
      '| `UX`          | `TREQ-UX-001` a `TREQ-UX-1602`                  |     1602 |',
      '| `UX`          | `TREQ-UX-001` a `TREQ-UX-1604`                  |     1604 |'
    );

  fs.writeFileSync(registryPath, output.replace(/\n/g, newline), 'utf8');
  console.log(
    `OK: registro TREQ del BLOQUE I reconciliado; ${updated} regla(s) actualizada(s); 10 requisito(s) nuevos asegurados.`
  );
}

reconcile();
