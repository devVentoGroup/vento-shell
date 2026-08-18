import fs from 'node:fs';
import path from 'node:path';
import { fileURLToPath } from 'node:url';
import {
  readCanonicalTreqRegistryBundle,
} from './treq-registry-files.mjs';

const EXPECTED_COLUMNS = [
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
const TASK_PATTERN = '[A-Z][A-Z0-9]*(?:-[A-Z0-9]+)+-\\d{3}';
const TASK_HEADING = new RegExp(
  `^###\\s+(?<marker>\\[[ x~]\\]|[✅🟡❌])\\s+(?<id>${TASK_PATTERN})\\b`,
  'gmu'
);
const TREQ_ID = /^TREQ-([A-Z]+)-(\d{3,})$/;
const TERMINAL_RESULT_PATTERN = /\b(?:PASS|FAIL|OK|APROBADO|RECHAZADO|VERIFICADO|COMPLETADO|CERRADO|EJECUTADO|EXIT[_ -]?CODE|RESULTADO)\b/iu;
const PENDING_VALUE_PATTERN = /^(?:—|-|pendiente(?:\s+de[^]*)?|por\s+definir|no[_\s-]?confirmado|n\/?a|na|sin\s+(?:evidencia|resultado|artefacto)|no\s+aplica)$/iu;
const GENERIC_EVIDENCE_PATTERN = /^(?:probado|correcto|listo|ok|aprobado|verificado|pass|funciona)(?:[.!])?$/iu;

function cleanCell(value) {
  return String(value ?? '').trim().replace(/^`|`$/g, '').replace(/\*\*/g, '').trim();
}

function splitMarkdownRow(line) {
  if (!line.trim().startsWith('|') || !line.trim().endsWith('|')) return null;
  const cells = [];
  let current = '';
  let escaped = false;
  const body = line.trim().slice(1, -1);

  for (const character of body) {
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

function isSeparatorRow(cells) {
  return cells.every((cell) => /^:?-{3,}:?$/.test(cell.replace(/\s/g, '')));
}

function extractTaskIds(value) {
  return [...String(value ?? '').matchAll(new RegExp(`\\b(${TASK_PATTERN})\\b`, 'g'))]
    .map((match) => match[1])
    .filter((id) => !id.startsWith('TREQ-'));
}

function findUnknownCanonicalTaskIds(value, tasks) {
  const canonicalPrefixes = new Set(
    [...tasks.keys()].map((id) => id.replace(/-\d{3}$/, ''))
  );

  return [...new Set(
    extractTaskIds(value).filter((id) => {
      const prefix = id.replace(/-\d{3}$/, '');
      return canonicalPrefixes.has(prefix) && !tasks.has(id);
    })
  )];
}

function parseTreqReferences(value) {
  const references = new Set();
  const invalidRanges = [];
  const rangeRegex = /TREQ-([A-Z]+)-(\d{3,})`?\s+a\s+`?TREQ-([A-Z]+)-(\d{3,})/g;
  let withoutRanges = String(value ?? '');

  for (const match of String(value ?? '').matchAll(rangeRegex)) {
    const [, fromDomain, fromRaw, toDomain, toRaw] = match;
    const from = Number(fromRaw);
    const to = Number(toRaw);
    withoutRanges = withoutRanges.replace(match[0], '');

    if (fromDomain !== toDomain || to < from) {
      invalidRanges.push(match[0]);
      continue;
    }
    for (let number = from; number <= to; number += 1) {
      references.add(`TREQ-${fromDomain}-${String(number).padStart(3, '0')}`);
    }
  }

  for (const match of withoutRanges.matchAll(/\bTREQ-[A-Z]+-\d{3,}\b/g)) {
    references.add(match[0]);
  }
  return { references: [...references], invalidRanges };
}

export function extractDerivedTreqIds(body) {
  const derivedMatch = body.match(
    /^####(?:\s+\d+\.)?\s+(?:Requisitos de prueba (?:derivados|generados|incorporados|creados)|Requisitos creados)\s*$/m
  );
  if (derivedMatch?.index === undefined) {
    return [];
  }

  const derivedBody = body.slice(derivedMatch.index);
  const nextSection = derivedBody.slice(5).search(/^####\s/m);
  const section = nextSection >= 0
    ? derivedBody.slice(0, nextSection + 5)
    : derivedBody;
  const declaresNoRequirements = /^\*\*Resultado:\*\*\s*(?:\*\*)?NO\s+(?:GENERA|CREA|MODIFICA)\b/imu.test(section);
  const declaresZeroCreated = /^\*\*(?:Requisitos\s+)?creados:\*\*\s*(?:\*\*)?0(?:\*\*)?\b/imu.test(section);
  const declaresZeroModified = /^\*\*(?:Requisitos\s+)?modificados:\*\*\s*(?:\*\*)?0(?:\*\*)?\b/imu.test(section);
  if (declaresNoRequirements && declaresZeroCreated && declaresZeroModified) return [];
  return parseTreqReferences(section).references;
}

function markerState(marker) {
  if (marker === '✅' || marker === '[x]') return 'APROBADA';
  if (marker === '🟡' || marker === '[~]') return 'PROPUESTA PARA APROBACIÓN';
  if (marker === '[ ]') return 'NO INICIADA';
  if (marker === '❌') return 'RECHAZADA';
  return 'DESCONOCIDA';
}

function maskFencedCode(source) {
  let fenced = false;
  return source
    .split('\n')
    .map((line) => {
      if (/^\s*```/.test(line)) {
        fenced = !fenced;
        return '';
      }
      return fenced ? ' '.repeat(line.length) : line;
    })
    .join('\n');
}

function expandActiveSequence(config) {
  const ids = [config.previous_task_id];
  if (Array.isArray(config.task_ids)) {
    return [...ids, ...config.task_ids];
  }
  for (const segment of config.segments ?? []) {
    for (let number = segment.from; number <= segment.to; number += 1) {
      ids.push(`${segment.prefix}-${String(number).padStart(3, '0')}`);
    }
  }
  return ids;
}

function orderedRouteTaskIds(tasks, route) {
  const ordered = [];
  const seen = new Set();
  for (const stage of route.stages ?? []) {
    for (const selector of stage.selectors ?? []) {
      const selected = Array.isArray(selector.task_ids)
        ? selector.task_ids
        : [...tasks.keys()]
          .map((id) => {
            const match = id.match(/^(?<prefix>[A-Z][A-Z0-9]*(?:-[A-Z0-9]+)+)-(?<number>\d{3})$/u);
            return match ? { id, prefix: match.groups.prefix, number: Number(match.groups.number) } : null;
          })
          .filter((task) => task
            && task.prefix === selector.prefix
            && task.number >= (selector.from ?? 1)
            && task.number <= (selector.to ?? Number.MAX_SAFE_INTEGER))
          .sort((left, right) => left.number - right.number)
          .map(({ id }) => id);
      for (const id of selected) {
        if (tasks.has(id) && !seen.has(id)) {
          ordered.push(id);
          seen.add(id);
        }
      }
    }
  }
  return ordered;
}

export function deriveLatestTreqTaskId({ tasks, orderedTaskIds, currentTaskId, fallbackTaskId }) {
  const currentIndex = orderedTaskIds.indexOf(currentTaskId);
  const history = currentIndex >= 0 ? orderedTaskIds.slice(0, currentIndex) : orderedTaskIds;
  return history
    .map((id) => tasks.get(id))
    .filter((task) => task?.state === 'APROBADA' && task.derivedIds.length > 0)
    .at(-1)?.id ?? fallbackTaskId;
}

export function buildCanonicalTreqContext({ baseDir, manifest }) {
  const tasks = new Map();

  for (const relativePath of manifest.files) {
    const fullPath = path.join(baseDir, relativePath);
    const source = fs.readFileSync(fullPath, 'utf8').replace(/\r\n?/g, '\n');
    const matches = [...maskFencedCode(source).matchAll(TASK_HEADING)];

    matches.forEach((match, index) => {
      const id = match.groups.id;
      const end = matches[index + 1]?.index ?? source.length;
      const body = source.slice(match.index, end);
      tasks.set(id, {
        id,
        state: markerState(match.groups.marker),
        relativePath,
        derivedIds: extractDerivedTreqIds(body),
      });
    });
  }

  const activeConfig = JSON.parse(
    fs.readFileSync(path.join(baseDir, 'active-sequence.json'), 'utf8')
  );
  const activeIds = expandActiveSequence(activeConfig);
  const currentTaskId = activeIds.find((id) => tasks.get(id)?.state !== 'APROBADA') ?? activeIds.at(-1);
  const routePath = path.join(baseDir, 'continuity-route.json');
  const route = fs.existsSync(routePath)
    ? JSON.parse(fs.readFileSync(routePath, 'utf8'))
    : { stages: [{ selectors: [{ task_ids: activeIds }] }] };
  const orderedTaskIds = orderedRouteTaskIds(tasks, route);
  const expectedLatestTaskId = deriveLatestTreqTaskId({
    tasks,
    orderedTaskIds,
    currentTaskId,
    fallbackTaskId: activeConfig.latest_treq_task_id,
  });

  if (!expectedLatestTaskId) {
    throw new Error('No se pudo derivar la última tarea aprobada que incorporó TREQ.');
  }
  const latestTask = tasks.get(expectedLatestTaskId);
  if (latestTask?.state !== 'APROBADA' || latestTask.derivedIds.length === 0) {
    throw new Error(
      `La última tarea TREQ configurada ${expectedLatestTaskId} no existe, no está aprobada o no incorpora requisitos.`
    );
  }
  return { tasks, activeIds, expectedLatestTaskId };
}

function parseDeclaredList(source, heading, endHeading, itemRegex) {
  const start = source.indexOf(heading);
  const end = source.indexOf(endHeading, start + heading.length);
  if (start < 0 || end < 0) return [];
  return [...source.slice(start, end).matchAll(itemRegex)].map((match) => match[1]);
}

function parseSummary(source) {
  const start = source.indexOf('### Resumen vigente');
  const end = source.indexOf('Distribución vigente:', start);
  const values = new Map();
  if (start < 0 || end < 0) return values;

  for (const line of source.slice(start, end).split('\n')) {
    const cells = splitMarkdownRow(line);
    if (!cells || cells.length !== 2 || isSeparatorRow(cells)) continue;
    values.set(cleanCell(cells[0]), cleanCell(cells[1]));
  }
  return values;
}

function parseDistribution(source) {
  const start = source.indexOf('Distribución vigente:');
  const end = source.indexOf('### Procedimiento obligatorio de actualización', start);
  const rows = [];
  if (start < 0 || end < 0) return rows;

  for (const line of source.slice(start, end).split('\n')) {
    const cells = splitMarkdownRow(line);
    if (!cells || cells.length !== 3 || isSeparatorRow(cells)) continue;
    if (cleanCell(cells[0]) === 'Dominio') continue;
    rows.push({
      domain: cleanCell(cells[0]),
      range: cleanCell(cells[1]),
      count: Number(cleanCell(cells[2])),
    });
  }
  return rows;
}

function createRecorder() {
  const errors = [];
  const diagnostics = [];
  const add = (category, code, message, rowId = null) => {
    errors.push(message);
    diagnostics.push({
      category,
      code,
      ...(rowId ? { row_id: rowId } : {}),
      message,
    });
  };
  return { errors, diagnostics, add };
}

function parseRegistry(source, add) {
  const start = source.indexOf('### Registro');
  const end = source.indexOf('### Reglas obligatorias', start);
  if (start < 0 || end < 0) {
    add('SOURCE', 'REGISTRY_SECTION_MISSING', 'Debe existir exactamente una sección `### Registro` antes de `### Reglas obligatorias`.');
    return { rows: [], domains: [] };
  }

  const section = source.slice(start, end);
  const headings = [...section.matchAll(/^####\s+([A-Z]+)\s*$/gm)];
  const rows = [];
  const domains = [];

  headings.forEach((heading, index) => {
    const domain = heading[1];
    const domainEnd = headings[index + 1]?.index ?? section.length;
    const body = section.slice(heading.index + heading[0].length, domainEnd);
    const tableLines = body.split('\n').filter((line) => line.trim().startsWith('|'));
    domains.push(domain);

    if (tableLines.length < 3) {
      add('SCHEMA', 'DOMAIN_TABLE_MISSING', `${domain}: falta la tabla completa del registro.`);
      return;
    }
    const header = splitMarkdownRow(tableLines[0]);
    if (!header || header.length !== EXPECTED_COLUMNS.length
      || header.some((cell, cellIndex) => cleanCell(cell) !== EXPECTED_COLUMNS[cellIndex])) {
      add('SCHEMA', 'CANONICAL_COLUMNS_INVALID', `${domain}: la cabecera debe tener las catorce columnas canónicas en el orden exacto.`);
    }
    const separator = splitMarkdownRow(tableLines[1]);
    if (!separator || separator.length !== EXPECTED_COLUMNS.length || !isSeparatorRow(separator)) {
      add('SCHEMA', 'TABLE_SEPARATOR_INVALID', `${domain}: el separador de la tabla es inválido.`);
    }

    tableLines.slice(2).forEach((line) => {
      const cells = splitMarkdownRow(line);
      if (!cells || cells.length !== EXPECTED_COLUMNS.length) {
        add('SCHEMA', 'ROW_COLUMN_COUNT_INVALID', `${domain}: fila con ${cells?.length ?? 0} columnas; se requieren 14.`);
        return;
      }
      const row = Object.fromEntries(
        EXPECTED_COLUMNS.map((column, cellIndex) => [column, cleanCell(cells[cellIndex])])
      );
      row._line = line;
      rows.push(row);
    });
  });
  return { rows, domains };
}

function numericSummary(summary, label, add) {
  const raw = summary.get(label);
  const value = Number(raw?.match(/\d+/)?.[0]);
  if (!raw || !Number.isInteger(value)) add('SUMMARY', 'SUMMARY_NUMBER_MISSING', `Resumen: falta una cifra válida para "${label}".`);
  return value;
}

function isPendingValue(value) {
  const normalized = cleanCell(value).replace(/\s+/gu, ' ');
  return normalized.length === 0 || PENDING_VALUE_PATTERN.test(normalized);
}

function hasCompletedResult(value) {
  const normalized = cleanCell(value);
  return !isPendingValue(normalized)
    && (TERMINAL_RESULT_PATTERN.test(normalized) || normalized.length >= 12);
}

function hasReproducibleEvidence(value) {
  const normalized = cleanCell(value);
  if (isPendingValue(normalized) || GENERIC_EVIDENCE_PATTERN.test(normalized)) return false;
  return /https?:\/\//iu.test(normalized)
    || /\b[0-9a-f]{7,64}\b/iu.test(normalized)
    || /(?:^|[\s`])(?:\.{0,2}[\\/])?[A-Za-z0-9_.-]+[\\/][A-Za-z0-9_./\\-]+/u.test(normalized)
    || /(?:^|[\s`'"])[A-Za-z0-9][A-Za-z0-9_.-]*\.(?:md|json|xml|html?|log|txt|csv|tap|trx|sarif|zip)(?=$|[\s`'";,.])/iu.test(normalized)
    || /\b(?:run|job|execution|ejecuci[oó]n|reporte|report|artefacto|artifact|evidencia|evidence|log|commit|sha)\b[^\n]{0,40}(?:[#:=]|\bid\b)\s*[`"']?[A-Za-z0-9._/-]{2,}/iu.test(normalized);
}

function validateVerifiedRow(row, add) {
  const requiredFields = ['Repositorio / ambiente', 'Artefacto', 'Último resultado', 'Evidencia'];
  for (const field of requiredFields) {
    if (isPendingValue(row[field])) {
      add(
        'VERIFIED_EVIDENCE',
        'VERIFIED_REQUIRED_FIELD_PENDING',
        `${row.ID}: VERIFICADO exige "${field}" resuelto y no pendiente.`,
        row.ID,
      );
    }
  }
  if (!hasCompletedResult(row['Último resultado'])) {
    add(
      'VERIFIED_EVIDENCE',
      'VERIFIED_RESULT_NOT_CONCLUDED',
      `${row.ID}: VERIFICADO exige un último resultado que represente una ejecución o decisión concluida.`,
      row.ID,
    );
  }
  if (!hasReproducibleEvidence(row.Evidencia)) {
    add(
      'VERIFIED_EVIDENCE',
      'VERIFIED_EVIDENCE_NOT_REPRODUCIBLE',
      `${row.ID}: VERIFICADO exige una referencia de evidencia reproducible; una afirmación genérica no es suficiente.`,
      row.ID,
    );
  }
}

function validateDeferredRow(row, context, add) {
  const responsibleIds = extractTaskIds(row['Tarea responsable']).filter((id) => context.tasks.has(id));
  const narrative = `${row['Último resultado']} ${row.Evidencia}`.trim();
  const genericDeferral = /^(?:pendiente|despu[eé]s|m[aá]s adelante|cuando corresponda|por definir)[.!]?$/iu;
  const hasJustification = /\b(?:justific|aplaz|diferid|posterg|bloquead|debido|porque|riesgo)\w*/iu.test(narrative);
  const hasResumption = extractTaskIds(narrative).some((id) => context.tasks.has(id))
    || /\b(?:puerta|gate|etapa|fase|cuando|despu[eé]s de|antes de|al completar|al aprobar|hasta que)\b\s+\S+/iu.test(narrative);

  if (responsibleIds.length === 0) {
    add(
      'DEFERRED_RESOLUTION',
      'DEFERRED_RESPONSIBLE_TASK_MISSING',
      `${row.ID}: DIFERIDO exige una tarea responsable exacta y resoluble.`,
      row.ID,
    );
  }
  if (isPendingValue(row['Riesgo / prioridad'])) {
    add(
      'DEFERRED_RESOLUTION',
      'DEFERRED_RISK_MISSING',
      `${row.ID}: DIFERIDO exige riesgo aceptado o explicado.`,
      row.ID,
    );
  }
  if (!narrative || genericDeferral.test(narrative) || !hasJustification) {
    add(
      'DEFERRED_RESOLUTION',
      'DEFERRED_JUSTIFICATION_MISSING',
      `${row.ID}: DIFERIDO exige una justificación explícita del aplazamiento.`,
      row.ID,
    );
  }
  if (!narrative || genericDeferral.test(narrative) || !hasResumption) {
    add(
      'DEFERRED_RESOLUTION',
      'DEFERRED_RESUMPTION_MISSING',
      `${row.ID}: DIFERIDO exige una puerta, condición, evento o momento determinable de reanudación.`,
      row.ID,
    );
  }
}

export function validateAffectedTreqDeclaration({
  affectedIds,
  knownIds,
  allowZeroAffected = false,
} = {}) {
  const rawIds = Array.isArray(affectedIds)
    ? affectedIds.map((value) => cleanCell(value)).filter(Boolean)
    : [];
  const duplicates = [...new Set(rawIds.filter((id, index, all) => all.indexOf(id) !== index))].sort();
  const malformed = [...new Set(rawIds.filter((id) => !TREQ_ID.test(id)))].sort();
  const known = knownIds instanceof Set ? knownIds : new Set(knownIds ?? []);
  const unknown = [...new Set(rawIds.filter((id) => TREQ_ID.test(id) && !known.has(id)))].sort();
  const diagnostics = [];

  if (rawIds.length === 0 && !allowZeroAffected) {
    diagnostics.push({
      category: 'IDENTITY',
      code: 'AFFECTED_REQUIREMENTS_EMPTY',
      message: 'La declaración de requisitos afectados está vacía y el caller no autorizó cero requisitos.',
    });
  }
  if (duplicates.length > 0) {
    diagnostics.push({
      category: 'IDENTITY',
      code: 'AFFECTED_REQUIREMENTS_DUPLICATED',
      message: `La declaración de requisitos afectados contiene duplicados: ${duplicates.join(', ')}.`,
    });
  }
  if (malformed.length > 0) {
    diagnostics.push({
      category: 'IDENTITY',
      code: 'AFFECTED_REQUIREMENTS_MALFORMED',
      message: `La declaración contiene identificadores TREQ mal formados: ${malformed.join(', ')}.`,
    });
  }
  if (unknown.length > 0) {
    diagnostics.push({
      category: 'IDENTITY',
      code: 'AFFECTED_REQUIREMENTS_UNKNOWN',
      message: `La declaración contiene requisitos inexistentes: ${unknown.join(', ')}.`,
    });
  }

  return {
    requested: true,
    allow_zero: allowZeroAffected,
    ids: rawIds,
    duplicate_ids: duplicates,
    malformed_ids: malformed,
    unknown_ids: unknown,
    result: diagnostics.length === 0 ? 'PASS' : 'FAIL',
    diagnostics,
  };
}

function parseHistoricalBaseline(source, add) {
  const baselineRows = [];
  let failed = false;
  const baselineAdd = (_category, code, message, rowId = null) => {
    failed = true;
    add(
      'HISTORICAL_RETENTION',
      `BASELINE_${code}`,
      `Línea base inválida: ${message}`,
      rowId,
    );
  };
  const parsed = parseRegistry(String(source ?? '').replace(/\r\n?/g, '\n'), baselineAdd);
  baselineRows.push(...parsed.rows);
  return { rows: baselineRows, failed };
}

function buildReport({
  recorder,
  stats,
  historicalMissingIds,
  historicalCheck,
  affectedDeclaration,
}) {
  const invalidRows = [...new Set(recorder.diagnostics.map((entry) => entry.row_id).filter(Boolean))].sort();
  const verifiedEvidenceErrors = [...new Set(
    recorder.diagnostics
      .filter((entry) => entry.category === 'VERIFIED_EVIDENCE')
      .map((entry) => entry.row_id)
      .filter(Boolean)
  )].sort();
  const deferredResolutionErrors = [...new Set(
    recorder.diagnostics
      .filter((entry) => entry.category === 'DEFERRED_RESOLUTION')
      .map((entry) => entry.row_id)
      .filter(Boolean)
  )].sort();

  return {
    result: recorder.errors.length === 0 ? 'PASS' : 'FAIL',
    requirements: stats.requirements,
    domains: stats.domains,
    fragments: [],
    duplicates: stats.duplicates,
    unresolved_relations: stats.unresolvedRelations,
    invalid_rows: invalidRows,
    verified_evidence_errors: verifiedEvidenceErrors,
    deferred_resolution_errors: deferredResolutionErrors,
    historical_missing_ids: [...historicalMissingIds],
    historical_check: historicalCheck,
    latest_task: stats.latestTask,
    distribution: stats.distribution,
    affected_requirements: affectedDeclaration,
    errors: recorder.diagnostics,
  };
}

export function validateTreqRegistrySource(source, context, {
  baselineSource = null,
  baselineRequired = false,
  affectedIds = null,
  allowZeroAffected = false,
} = {}) {
  const normalized = String(source ?? '').replace(/\r\n?/g, '\n');
  const recorder = createRecorder();
  const { add } = recorder;
  const mainHeadings = normalized.match(/^## REGISTRO CANÓNICO DE REQUISITOS DE PRUEBA\s*$/gm) ?? [];
  const registryHeadings = normalized.match(/^### Registro\s*$/gm) ?? [];
  if (mainHeadings.length !== 1) add('SOURCE', 'MAIN_HEADING_COUNT_INVALID', 'Debe existir exactamente un encabezado principal del registro.');
  if (registryHeadings.length !== 1) add('SOURCE', 'REGISTRY_HEADING_COUNT_INVALID', 'Debe existir exactamente una sección `### Registro`.');

  const declaredDomains = parseDeclaredList(
    normalized,
    'Dominios iniciales:',
    '### Estados permitidos',
    /^- `([A-Z]+)`[.;]$/gm
  );
  const allowedStates = parseDeclaredList(
    normalized,
    '### Estados permitidos',
    '### Tipos permitidos',
    /^\| `([A-Z_]+)`\s+\|/gm
  );
  const allowedTypes = parseDeclaredList(
    normalized,
    '### Tipos permitidos',
    '### Resumen vigente',
    /^- ([^;.]+)[.;]$/gm
  );
  if (declaredDomains.length === 0) add('DOMAIN', 'DOMAIN_CATALOG_UNREADABLE', 'No se pudieron leer los dominios permitidos.');
  if (allowedStates.length === 0) add('STATE', 'STATE_CATALOG_UNREADABLE', 'No se pudieron leer los estados permitidos.');
  if (allowedTypes.length === 0) add('TYPE', 'TYPE_CATALOG_UNREADABLE', 'No se pudieron leer los tipos permitidos.');

  const { rows, domains } = parseRegistry(normalized, add);
  if (domains.join('|') !== declaredDomains.join('|')) {
    add('DOMAIN', 'DOMAIN_ORDER_MISMATCH', 'El orden o conjunto de dominios del registro no coincide con "Dominios iniciales".');
  }

  const ids = new Set();
  const duplicateIds = new Set();
  const grouped = new Map(declaredDomains.map((domain) => [domain, []]));
  let unresolvedRelations = 0;

  for (const row of rows) {
    for (const column of EXPECTED_COLUMNS) {
      if (!row[column]) add('SCHEMA', 'REQUIRED_CELL_EMPTY', `${row.ID || '(sin ID)'}: la columna "${column}" está vacía.`, row.ID || null);
    }

    const idMatch = row.ID.match(TREQ_ID);
    if (!idMatch) {
      add('IDENTITY', 'TREQ_ID_INVALID', `${row.ID || '(sin ID)'}: identificador TREQ inválido.`, row.ID || null);
      continue;
    }
    const [, idDomain] = idMatch;
    if (ids.has(row.ID)) duplicateIds.add(row.ID);
    ids.add(row.ID);
    if (row.Dominio !== idDomain) {
      add('DOMAIN', 'ROW_DOMAIN_MISMATCH', `${row.ID}: el dominio de la fila (${row.Dominio}) no coincide con el identificador (${idDomain}).`, row.ID);
    }
    if (!grouped.has(idDomain)) {
      add('DOMAIN', 'ROW_DOMAIN_UNDECLARED', `${row.ID}: dominio no declarado.`, row.ID);
    } else {
      grouped.get(idDomain).push(row);
    }
    if (!allowedStates.includes(row.Estado)) add('STATE', 'STATE_NOT_ALLOWED', `${row.ID}: estado no permitido "${row.Estado}".`, row.ID);

    const [typePart, modePart] = row['Tipo / modalidad'].split('/').map((part) => part?.trim());
    if (!typePart || !modePart) {
      add('TYPE', 'TYPE_MODE_MISSING', `${row.ID}: "Tipo / modalidad" debe declarar tipo y modalidad separados por "/".`, row.ID);
    } else if (!allowedTypes.some((type) => typePart.toLowerCase().includes(type.toLowerCase()))) {
      add('TYPE', 'TYPE_NOT_ALLOWED', `${row.ID}: no contiene ningún tipo permitido.`, row.ID);
    }

    for (const field of ['Origen', 'Tarea responsable']) {
      const known = extractTaskIds(row[field]).filter((id) => context.tasks.has(id));
      if (known.length === 0) add('TASK_REFERENCE', 'TASK_REFERENCE_MISSING', `${row.ID}: "${field}" no referencia ninguna tarea canónica existente.`, row.ID);
      const unknown = findUnknownCanonicalTaskIds(row[field], context.tasks);
      if (unknown.length > 0) {
        add('TASK_REFERENCE', 'TASK_REFERENCE_UNKNOWN', `${row.ID}: "${field}" referencia tareas canónicas inexistentes: ${unknown.join(', ')}.`, row.ID);
      }
    }
    if (/pendiente/i.test(row.Paquete)
      && extractTaskIds(row['Tarea responsable']).every((id) => !context.tasks.has(id))) {
      add('TASK_REFERENCE', 'PENDING_PACKAGE_OWNER_MISSING', `${row.ID}: paquete pendiente sin tarea canónica propietaria.`, row.ID);
    }

    if (row.Estado === 'VERIFICADO') validateVerifiedRow(row, add);
    if (row.Estado === 'DIFERIDO') validateDeferredRow(row, context, add);

    const parsedRelations = parseTreqReferences(row.Relación);
    for (const invalidRange of parsedRelations.invalidRanges) {
      add('TREQ_RELATION', 'TREQ_RANGE_INVALID', `${row.ID}: rango TREQ inválido o invertido ${invalidRange}.`, row.ID);
    }
    for (const relation of parsedRelations.references) {
      if (relation === row.ID) add('TREQ_RELATION', 'TREQ_SELF_REFERENCE', `${row.ID}: no puede relacionarse consigo mismo.`, row.ID);
      if (!rows.some((candidate) => candidate.ID === relation)) {
        unresolvedRelations += 1;
        add('TREQ_RELATION', 'TREQ_RELATION_UNRESOLVED', `${row.ID}: relación no resoluble ${relation}.`, row.ID);
      }
    }
    for (const proposal of row.Evidencia.matchAll(
      new RegExp(`\\bpropuesta\\s+\`?(${TASK_PATTERN})\`?`, 'gi')
    )) {
      const task = context.tasks.get(proposal[1].toUpperCase());
      if (task?.state === 'APROBADA') {
        add('TASK_REFERENCE', 'APPROVED_TASK_CALLED_PROPOSAL', `${row.ID}: la evidencia sigue llamando propuesta a la tarea aprobada ${task.id}.`, row.ID);
      }
    }
    if (/\b(?:definid[oa]s?\s+en\s+propuesta|regla\s+de\s+\w+\s+propuesta|aprobación\s+pendiente)\b/i.test(row.Evidencia)) {
      const approvedSources = extractTaskIds(`${row.Origen} ${row['Tarea responsable']}`)
        .map((id) => context.tasks.get(id))
        .filter((task) => task?.state === 'APROBADA');
      if (approvedSources.length > 0) {
        add(
          'TASK_REFERENCE',
          'APPROVED_SOURCE_HAS_PROPOSAL_LANGUAGE',
          `${row.ID}: la evidencia conserva lenguaje de propuesta o aprobación pendiente `
          + `para tareas ya aprobadas: ${[...new Set(approvedSources.map((task) => task.id))].join(', ')}.`,
          row.ID,
        );
      }
    }
  }

  for (const duplicate of duplicateIds) add('IDENTITY', 'TREQ_ID_DUPLICATED', `Identificador duplicado: ${duplicate}.`, duplicate);
  for (const [domain, domainRows] of grouped) {
    domainRows.forEach((row, index) => {
      const expected = `TREQ-${domain}-${String(index + 1).padStart(3, '0')}`;
      if (row.ID !== expected) add('SEQUENCE', 'DOMAIN_SEQUENCE_INVALID', `${domain}: secuencia inválida; se esperaba ${expected} y apareció ${row.ID}.`, row.ID);
    });
  }

  const summary = parseSummary(normalized);
  const domainsWithRequirements = [...grouped.values()].filter((domainRows) => domainRows.length > 0).length;
  const summaryTotal = numericSummary(summary, 'Requisitos vigentes', add);
  const summaryDomains = numericSummary(summary, 'Dominios con requisitos', add);
  const summaryDuplicates = numericSummary(summary, 'Identificadores duplicados', add);
  const summaryUnresolved = numericSummary(summary, 'Relaciones `TREQ-*` no resolubles', add);
  const columnSummary = summary.get('Filas con catorce columnas')?.match(/(\d+)\s+de\s+(\d+)/);
  if (!columnSummary) {
    add('SUMMARY', 'COLUMN_SUMMARY_INVALID', 'Resumen: "Filas con catorce columnas" debe usar el formato N de N.');
  } else if (Number(columnSummary[1]) !== rows.length || Number(columnSummary[2]) !== rows.length) {
    add('SUMMARY', 'COLUMN_SUMMARY_MISMATCH', `Resumen: las filas con catorce columnas no coinciden con las ${rows.length} filas reales.`);
  }
  if (summaryTotal !== rows.length) add('SUMMARY', 'REQUIREMENT_COUNT_MISMATCH', `Resumen: declara ${summaryTotal} requisitos y existen ${rows.length}.`);
  if (summaryDomains !== domainsWithRequirements) {
    add('SUMMARY', 'DOMAIN_COUNT_MISMATCH', `Resumen: declara ${summaryDomains} dominios con requisitos y existen ${domainsWithRequirements}.`);
  }
  if (summaryDuplicates !== duplicateIds.size) add('SUMMARY', 'DUPLICATE_COUNT_MISMATCH', 'Resumen: el total de duplicados no coincide con el registro.');
  if (summaryUnresolved !== unresolvedRelations) add('SUMMARY', 'UNRESOLVED_COUNT_MISMATCH', 'Resumen: el total de relaciones no resolubles no coincide con el registro.');

  const declaredLatest = summary.get('Última tarea incorporada');
  if (declaredLatest !== context.expectedLatestTaskId) {
    add('LATEST_TASK', 'LATEST_TASK_MISMATCH', `Resumen: la última tarea debe ser ${context.expectedLatestTaskId}, no ${declaredLatest || 'vacía'}.`);
  } else {
    const missingDerived = context.tasks.get(declaredLatest)?.derivedIds.filter((id) => !ids.has(id)) ?? [];
    if (missingDerived.length > 0) {
      add('LATEST_TASK', 'LATEST_TASK_DERIVED_IDS_MISSING', `${declaredLatest}: faltan requisitos derivados en el registro: ${missingDerived.join(', ')}.`);
    }
  }

  const distribution = parseDistribution(normalized);
  if (distribution.map((row) => row.domain).join('|') !== declaredDomains.join('|')) {
    add('DISTRIBUTION', 'DISTRIBUTION_DOMAIN_ORDER_MISMATCH', 'La distribución no conserva el orden y conjunto de dominios declarados.');
  }
  distribution.forEach((declared) => {
    const actual = grouped.get(declared.domain) ?? [];
    const expectedRange = actual.length === 1
      ? actual[0].ID
      : actual.length > 1
        ? `${actual[0].ID} a ${actual.at(-1).ID}`
        : '';
    if (declared.count !== actual.length || declared.range.replace(/`/g, '') !== expectedRange) {
      add('DISTRIBUTION', 'DISTRIBUTION_ROW_MISMATCH', `${declared.domain}: distribución declarada incoherente con las filas reales.`);
    }
  });

  const historicalMissingIds = [];
  let historicalCheck = 'NOT_REQUESTED';
  if (baselineSource !== null) {
    historicalCheck = 'PASS';
    const baseline = parseHistoricalBaseline(baselineSource, add);
    if (baseline.failed) {
      historicalCheck = 'FAIL';
    } else {
      for (const baselineRow of baseline.rows) {
        if (!ids.has(baselineRow.ID)) historicalMissingIds.push(baselineRow.ID);
      }
      if (historicalMissingIds.length > 0) {
        historicalCheck = 'FAIL';
        for (const missingId of historicalMissingIds) {
          add(
            'HISTORICAL_RETENTION',
            'HISTORICAL_ID_MISSING',
            `${missingId}: requisito histórico ausente frente a la línea base explícita.`,
            missingId,
          );
        }
      }
    }
  } else if (baselineRequired) {
    historicalCheck = 'UNAVAILABLE';
    add(
      'HISTORICAL_RETENTION',
      'BASELINE_REQUIRED_BUT_UNAVAILABLE',
      'La comprobación histórica fue solicitada, pero no se proporcionó una línea base explícita; no puede declararse PASS histórico.',
    );
  }

  let affectedDeclaration = null;
  if (affectedIds !== null) {
    affectedDeclaration = validateAffectedTreqDeclaration({
      affectedIds,
      knownIds: ids,
      allowZeroAffected,
    });
    for (const diagnostic of affectedDeclaration.diagnostics) {
      add(diagnostic.category, diagnostic.code, diagnostic.message);
    }
  }

  const stats = {
    requirements: rows.length,
    domains: domainsWithRequirements,
    duplicates: duplicateIds.size,
    unresolvedRelations,
    latestTask: context.expectedLatestTaskId,
    distribution: [...grouped.entries()].map(([domain, domainRows]) => ({
      domain,
      firstId: domainRows[0]?.ID ?? null,
      lastId: domainRows.at(-1)?.ID ?? null,
      count: domainRows.length,
    })),
  };

  return {
    errors: recorder.errors,
    diagnostics: recorder.diagnostics,
    stats,
    rows,
    report: buildReport({
      recorder,
      stats,
      historicalMissingIds,
      historicalCheck,
      affectedDeclaration,
    }),
  };
}

function emptyReport(diagnostic, historicalCheck = 'NOT_REQUESTED') {
  return {
    result: 'FAIL',
    requirements: 0,
    domains: 0,
    fragments: [],
    duplicates: 0,
    unresolved_relations: 0,
    invalid_rows: [],
    verified_evidence_errors: [],
    deferred_resolution_errors: [],
    historical_missing_ids: [],
    historical_check: historicalCheck,
    latest_task: null,
    distribution: [],
    affected_requirements: null,
    errors: [diagnostic],
  };
}

export function inspectCanonicalTreqRegistry({
  root = process.cwd(),
  baselineFile = null,
  requireBaseline = false,
  affectedIds = null,
  allowZeroAffected = false,
} = {}) {
  const baseDir = path.resolve(root, 'docs/plan-canonico/modular');
  let manifest;
  let context;
  let bundle;

  try {
    manifest = JSON.parse(fs.readFileSync(path.join(baseDir, 'manifest.json'), 'utf8'));
    context = buildCanonicalTreqContext({ baseDir, manifest });
    bundle = readCanonicalTreqRegistryBundle({ baseDir, manifest });
  } catch (error) {
    const diagnostic = {
      category: 'FRAGMENT',
      code: 'CANONICAL_SOURCE_UNAVAILABLE',
      message: error instanceof Error ? error.message : String(error),
    };
    return {
      errors: [diagnostic.message],
      diagnostics: [diagnostic],
      stats: {
        requirements: 0,
        domains: 0,
        duplicates: 0,
        unresolvedRelations: 0,
        latestTask: null,
        distribution: [],
      },
      report: emptyReport(diagnostic),
    };
  }

  let baselineSource = null;
  let baselineLoadDiagnostic = null;
  if (baselineFile) {
    const resolved = path.isAbsolute(baselineFile)
      ? baselineFile
      : path.resolve(root, baselineFile);
    try {
      baselineSource = fs.readFileSync(resolved, 'utf8');
    } catch (error) {
      baselineLoadDiagnostic = {
        category: 'HISTORICAL_RETENTION',
        code: 'BASELINE_SOURCE_UNAVAILABLE',
        message: `No se pudo leer la línea base explícita ${resolved}: ${error instanceof Error ? error.message : String(error)}`,
      };
    }
  }

  const result = validateTreqRegistrySource(bundle.source, context, {
    baselineSource,
    baselineRequired: requireBaseline || Boolean(baselineFile),
    affectedIds,
    allowZeroAffected,
  });
  result.report.fragments = [...bundle.fragments];

  if (baselineLoadDiagnostic) {
    result.errors.push(baselineLoadDiagnostic.message);
    result.diagnostics.push(baselineLoadDiagnostic);
    result.report.errors.push(baselineLoadDiagnostic);
    result.report.historical_check = 'UNAVAILABLE';
    result.report.result = 'FAIL';
  }

  return result;
}

export function validateCanonicalTreqRegistry(options = {}) {
  const result = inspectCanonicalTreqRegistry(options);
  if (result.errors.length > 0) {
    throw new Error(`Registro TREQ inválido:\n- ${result.errors.join('\n- ')}`);
  }
  return {
    ...result.stats,
    fragments: result.report.fragments,
    report: result.report,
  };
}

function parseCliArguments(argv) {
  const options = {
    json: false,
    baselineFile: null,
    requireBaseline: false,
    affectedIds: null,
    allowZeroAffected: false,
  };

  for (let index = 0; index < argv.length; index += 1) {
    const argument = argv[index];
    if (argument === '--json') {
      options.json = true;
    } else if (argument === '--require-baseline') {
      options.requireBaseline = true;
    } else if (argument === '--allow-zero-affected') {
      options.allowZeroAffected = true;
    } else if (argument === '--baseline-file') {
      const value = argv[index + 1];
      if (!value || value.startsWith('--')) throw new Error('--baseline-file exige una ruta explícita.');
      options.baselineFile = value;
      index += 1;
    } else if (argument === '--affected') {
      const value = argv[index + 1];
      if (value === undefined || value.startsWith('--')) throw new Error('--affected exige una lista separada por comas.');
      options.affectedIds = value.split(',').map((item) => item.trim()).filter(Boolean);
      index += 1;
    } else {
      throw new Error(`Argumento no reconocido: ${argument}.`);
    }
  }

  return options;
}

function printHumanReport(report) {
  if (report.result === 'PASS') {
    console.log(
      `OK: registro TREQ; ${report.requirements} requisitos; ${report.domains} dominios; `
      + `${report.fragments.length} fragmentos; ${report.duplicates} duplicados; `
      + `${report.unresolved_relations} relaciones no resolubles; última tarea ${report.latest_task}.`
    );
    if (report.historical_check !== 'NOT_REQUESTED') {
      console.log(`OK: integridad histórica ${report.historical_check}.`);
    }
    return;
  }

  console.error('ERROR: registro TREQ inválido:');
  for (const diagnostic of report.errors) {
    console.error(`- [${diagnostic.category}/${diagnostic.code}] ${diagnostic.message}`);
  }
}

const isCli = process.argv[1]
  && path.resolve(process.argv[1]) === path.resolve(fileURLToPath(import.meta.url));

if (isCli) {
  try {
    const options = parseCliArguments(process.argv.slice(2));
    const result = inspectCanonicalTreqRegistry(options);
    if (options.json) {
      console.log(JSON.stringify(result.report, null, 2));
    } else {
      printHumanReport(result.report);
    }
    if (result.report.result !== 'PASS') process.exitCode = 1;
  } catch (error) {
    const diagnostic = {
      category: 'SOURCE',
      code: 'CLI_ARGUMENT_INVALID',
      message: error instanceof Error ? error.message : String(error),
    };
    const report = emptyReport(diagnostic);
    if (process.argv.includes('--json')) {
      console.log(JSON.stringify(report, null, 2));
    } else {
      printHumanReport(report);
    }
    process.exitCode = 1;
  }
}