import fs from 'node:fs';
import path from 'node:path';
import { fileURLToPath } from 'node:url';

const BLOCK_PATH =
  'bloques/X_INTEGRACIONES/01_EVENTOS_ENTRE_APLICACIONES.md';
const TREQ_PATH =
  'bloques/E1_DESCUBRIMIENTO_OPERATIVO/04A_REGISTRO_CANONICO_DE_REQUISITOS_DE_PRUEBA.md';

const TASKS = [
  {
    id: 'INT-APP-001',
    title: 'Crear catálogo de eventos empresariales',
    next: 'INT-APP-002',
    artifact: 'ENTERPRISE-EVENT-CATALOG-001',
    treqFrom: 24,
    treqTo: 53,
  },
  {
    id: 'INT-APP-002',
    title: 'Definir aplicación emisora de cada evento',
    next: 'INT-APP-003',
    artifact: 'ENTERPRISE-EVENT-PRODUCER-REGISTRY-001',
    treqFrom: 54,
    treqTo: 79,
  },
  {
    id: 'INT-APP-003',
    title: 'Definir aplicaciones consumidoras',
    next: 'INT-APP-004',
    artifact: 'ENTERPRISE-EVENT-CONSUMER-REGISTRY-001',
    treqFrom: 80,
    treqTo: 107,
  },
  {
    id: 'INT-APP-004',
    title: 'Definir idempotencia',
    next: 'INT-APP-005',
    artifact: 'ENTERPRISE-EVENT-IDEMPOTENCY-REGISTRY-001',
    treqFrom: 108,
    treqTo: 137,
  },
  {
    id: 'INT-APP-005',
    title: 'Definir reintentos',
    next: 'INT-APP-006',
    artifact: 'ENTERPRISE-EVENT-RETRY-POLICY-001',
    treqFrom: 138,
    treqTo: 167,
  },
  {
    id: 'INT-APP-006',
    title: 'Definir compensaciones',
    next: 'INT-APP-007',
    artifact: 'ENTERPRISE-EVENT-COMPENSATION-POLICY-001',
    treqFrom: 168,
    treqTo: 197,
  },
  {
    id: 'INT-APP-007',
    title: 'Definir auditoría transversal',
    next: 'INT-APP-008',
    artifact: 'ENTERPRISE-INTEGRATION-AUDIT-POLICY-001',
    treqFrom: 198,
    treqTo: 227,
  },
  {
    id: 'INT-APP-008',
    title: 'Definir estados pendientes de sincronización',
    next: 'INT-APP-009',
    artifact: 'ENTERPRISE-SYNC-PENDING-STATE-MACHINE-001',
    treqFrom: 228,
    treqTo: 257,
  },
  {
    id: 'INT-APP-009',
    title: 'Definir manejo de errores parciales',
    next: 'INT-APP-010',
    artifact: 'ENTERPRISE-PARTIAL-ERROR-HANDLING-POLICY-001',
    treqFrom: 258,
    treqTo: 287,
  },
  {
    id: 'INT-APP-010',
    title: 'Evitar escrituras cruzadas sin contrato',
    next: null,
    artifact: 'ENTERPRISE-CROSS-APPLICATION-WRITE-POLICY-001',
    treqFrom: 288,
    treqTo: 317,
  },
];

function escapeRegExp(value) {
  return value.replace(/[.*+?^${}()|[\]\\]/g, '\\$&');
}

function splitTaskSections(source) {
  const headingPattern =
    /^###\s+✅\s+(INT-APP-\d{3})\s+—\s+([^\r\n]+)$/gmu;
  const headings = [...source.matchAll(headingPattern)];
  return headings.map((heading, index) => ({
    id: heading[1],
    title: heading[2].trim(),
    source: source.slice(
      heading.index,
      headings[index + 1]?.index ?? source.length,
    ),
  }));
}

function parseTreqRows(source) {
  const rows = new Map();
  for (const line of source.split(/\r?\n/)) {
    const match = line.match(/^\|\s*`(TREQ-INTEGRATION-(\d{3,}))`\s*\|/u);
    if (!match) continue;
    rows.set(Number(match[2]), { id: match[1], line });
  }
  return rows;
}

export function validateEventApplicationBlockSource({
  blockSource,
  registrySource,
}) {
  const errors = [];
  const sections = splitTaskSections(blockSource);
  const actualIds = sections.map((section) => section.id);
  const expectedIds = TASKS.map((task) => task.id);

  if (JSON.stringify(actualIds) !== JSON.stringify(expectedIds)) {
    errors.push(
      `El orden o conjunto INT-APP es inválido: ${actualIds.join(', ') || '(vacío)'}.`,
    );
  }

  if (
    !blockSource.includes(
      '**Cobertura canónica:** `INT-APP-001` a `INT-APP-010` — 10 tareas.',
    )
  ) {
    errors.push('La cobertura declarada del mini-bloque no es exacta.');
  }
  if (
    !blockSource.includes(
      '**Estado del mini-bloque:** cerrado documentalmente',
    )
  ) {
    errors.push('El cierre documental del mini-bloque no está declarado.');
  }
  if (
    blockSource.includes(
      'VALIDACIÓN REAL DEL REPOSITORIO PENDIENTE DE EJECUCIÓN LOCAL',
    )
  ) {
    errors.push('El bloque aprobado conserva una validación local como pendiente.');
  }

  const sectionById = new Map(
    sections.map((section) => [section.id, section]),
  );
  for (const task of TASKS) {
    const section = sectionById.get(task.id);
    if (!section) continue;

    if (section.title !== task.title) {
      errors.push(`${task.id}: título inesperado "${section.title}".`);
    }
    if (!/\*\*Estado:\*\*\s+APROBADA\b/u.test(section.source)) {
      errors.push(`${task.id}: no está declarada como APROBADA.`);
    }
    if (!section.source.includes(task.artifact)) {
      errors.push(`${task.id}: falta el artefacto ${task.artifact}.`);
    }

    const expectedNext = task.next
      ? `**Siguiente tarea:** \`${task.next} —`
      : '**Siguiente tarea:** `NINGUNA — CIERRE DEL BLOQUE`';
    if (!section.source.includes(expectedNext)) {
      errors.push(`${task.id}: la siguiente tarea declarada es incoherente.`);
    }

    const expectedRange =
      `TREQ-INTEGRATION-${String(task.treqFrom).padStart(3, '0')}` +
      ` a ` +
      `TREQ-INTEGRATION-${String(task.treqTo).padStart(3, '0')}`;
    if (!section.source.includes(expectedRange)) {
      errors.push(`${task.id}: falta el rango derivado ${expectedRange}.`);
    }
  }

  const requiredFacts = [
    ['69 procesos', /69\s+procesos/iu],
    ['395 eventos', /395\s+(?:definiciones|eventos)/iu],
    ['2.020 relaciones', /2\.020\s+relaciones/iu],
    ['ocho familias condicionales', /ocho\s+familias\s+condicionales/iu],
    ['cero eventos sin emisora', /EVENTOS SIN EMISORA\s+0/iu],
    ['cero eventos sin audiencia', /EVENTOS SIN AUDIENCIA POTENCIAL\s+0/iu],
  ];
  for (const [label, pattern] of requiredFacts) {
    if (!pattern.test(blockSource)) {
      errors.push(`Falta la reconciliación de ${label}.`);
    }
  }

  const treqRows = parseTreqRows(registrySource);
  let treqCount = 0;
  for (const task of TASKS) {
    for (let sequence = task.treqFrom; sequence <= task.treqTo; sequence += 1) {
      treqCount += 1;
      const row = treqRows.get(sequence);
      const treqId = `TREQ-INTEGRATION-${String(sequence).padStart(3, '0')}`;
      if (!row) {
        errors.push(`${task.id}: falta ${treqId} en el registro TREQ.`);
        continue;
      }
      const originPattern = new RegExp(
        `\\|\\s*\`${escapeRegExp(task.id)}\`\\s*\\/`,
        'u',
      );
      if (!originPattern.test(row.line)) {
        errors.push(`${treqId}: el origen no corresponde a ${task.id}.`);
      }
    }
  }

  return {
    errors,
    stats: {
      tasks: TASKS.length,
      treqRequirements: treqCount,
      normalEvents: 395,
      processes: 69,
      consumerRelations: 2020,
    },
  };
}

export function validateEventApplicationBlock({ root = process.cwd() } = {}) {
  const baseDir = path.join(root, 'docs/plan-canonico/modular');
  const result = validateEventApplicationBlockSource({
    blockSource: fs.readFileSync(path.join(baseDir, BLOCK_PATH), 'utf8'),
    registrySource: fs.readFileSync(path.join(baseDir, TREQ_PATH), 'utf8'),
  });
  if (result.errors.length > 0) {
    throw new Error(
      `Mini-bloque INT-APP inválido:\n- ${result.errors.join('\n- ')}`,
    );
  }
  return result.stats;
}

function isMainModule() {
  return process.argv[1]
    && path.resolve(process.argv[1]) === fileURLToPath(import.meta.url);
}

if (isMainModule()) {
  try {
    const stats = validateEventApplicationBlock();
    console.log(
      `OK: INT-APP; ${stats.tasks} tareas aprobadas; `
      + `${stats.treqRequirements} requisitos derivados; `
      + `${stats.processes} procesos; ${stats.normalEvents} eventos; `
      + `${stats.consumerRelations} relaciones consumidoras.`,
    );
  } catch (error) {
    console.error(
      `ERROR: ${error instanceof Error ? error.message : String(error)}`,
    );
    process.exitCode = 1;
  }
}
