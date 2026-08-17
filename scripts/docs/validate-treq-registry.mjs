import fs from 'node:fs';
import path from 'node:path';
import { fileURLToPath } from 'node:url';
import { readCanonicalTreqRegistry } from './treq-registry-files.mjs';

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

function cleanCell(value) {
  return value.trim().replace(/^`|`$/g, '').replace(/\*\*/g, '').trim();
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
  return [...value.matchAll(new RegExp(`\\b(${TASK_PATTERN})\\b`, 'g'))]
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

function expandTreqReferences(value) {
  const references = new Set();
  const rangeRegex = /TREQ-([A-Z]+)-(\d{3,})`?\s+a\s+`?TREQ-\1-(\d{3,})/g;
  let withoutRanges = value;

  for (const match of value.matchAll(rangeRegex)) {
    const [, domain, fromRaw, toRaw] = match;
    const from = Number(fromRaw);
    const to = Number(toRaw);
    if (to < from) continue;
    for (let number = from; number <= to; number += 1) {
      references.add(`TREQ-${domain}-${String(number).padStart(3, '0')}`);
    }
    withoutRanges = withoutRanges.replace(match[0], '');
  }

  for (const match of withoutRanges.matchAll(/\bTREQ-[A-Z]+-\d{3,}\b/g)) {
    references.add(match[0]);
  }
  return [...references];
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
  return expandTreqReferences(section);
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

function parseRegistry(source, errors) {
  const start = source.indexOf('### Registro');
  const end = source.indexOf('### Reglas obligatorias', start);
  if (start < 0 || end < 0) {
    errors.push('Debe existir exactamente una sección `### Registro` antes de `### Reglas obligatorias`.');
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
      errors.push(`${domain}: falta la tabla completa del registro.`);
      return;
    }
    const header = splitMarkdownRow(tableLines[0]);
    if (!header || header.length !== EXPECTED_COLUMNS.length
      || header.some((cell, cellIndex) => cleanCell(cell) !== EXPECTED_COLUMNS[cellIndex])) {
      errors.push(`${domain}: la cabecera debe tener las catorce columnas canónicas en el orden exacto.`);
    }
    const separator = splitMarkdownRow(tableLines[1]);
    if (!separator || separator.length !== EXPECTED_COLUMNS.length || !isSeparatorRow(separator)) {
      errors.push(`${domain}: el separador de la tabla es inválido.`);
    }

    tableLines.slice(2).forEach((line) => {
      const cells = splitMarkdownRow(line);
      if (!cells || cells.length !== EXPECTED_COLUMNS.length) {
        errors.push(`${domain}: fila con ${cells?.length ?? 0} columnas; se requieren 14.`);
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

function numericSummary(summary, label, errors) {
  const raw = summary.get(label);
  const value = Number(raw?.match(/\d+/)?.[0]);
  if (!raw || !Number.isInteger(value)) errors.push(`Resumen: falta una cifra válida para "${label}".`);
  return value;
}

export function validateTreqRegistrySource(source, context) {
  const normalized = source.replace(/\r\n?/g, '\n');
  const errors = [];
  const mainHeadings = normalized.match(/^## REGISTRO CANÓNICO DE REQUISITOS DE PRUEBA\s*$/gm) ?? [];
  const registryHeadings = normalized.match(/^### Registro\s*$/gm) ?? [];
  if (mainHeadings.length !== 1) errors.push('Debe existir exactamente un encabezado principal del registro.');
  if (registryHeadings.length !== 1) errors.push('Debe existir exactamente una sección `### Registro`.');

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
  if (declaredDomains.length === 0) errors.push('No se pudieron leer los dominios permitidos.');
  if (allowedStates.length === 0) errors.push('No se pudieron leer los estados permitidos.');
  if (allowedTypes.length === 0) errors.push('No se pudieron leer los tipos permitidos.');

  const { rows, domains } = parseRegistry(normalized, errors);
  if (domains.join('|') !== declaredDomains.join('|')) {
    errors.push('El orden o conjunto de dominios del registro no coincide con "Dominios iniciales".');
  }

  const ids = new Set();
  const duplicateIds = new Set();
  const grouped = new Map(declaredDomains.map((domain) => [domain, []]));
  let unresolvedRelations = 0;

  for (const row of rows) {
    for (const column of EXPECTED_COLUMNS) {
      if (!row[column]) errors.push(`${row.ID || '(sin ID)'}: la columna "${column}" está vacía.`);
    }

    const idMatch = row.ID.match(TREQ_ID);
    if (!idMatch) {
      errors.push(`${row.ID || '(sin ID)'}: identificador TREQ inválido.`);
      continue;
    }
    const [, idDomain] = idMatch;
    if (ids.has(row.ID)) duplicateIds.add(row.ID);
    ids.add(row.ID);
    if (row.Dominio !== idDomain) {
      errors.push(`${row.ID}: el dominio de la fila (${row.Dominio}) no coincide con el identificador (${idDomain}).`);
    }
    if (!grouped.has(idDomain)) {
      errors.push(`${row.ID}: dominio no declarado.`);
    } else {
      grouped.get(idDomain).push(row);
    }
    if (!allowedStates.includes(row.Estado)) errors.push(`${row.ID}: estado no permitido "${row.Estado}".`);

    const [typePart, modePart] = row['Tipo / modalidad'].split('/').map((part) => part?.trim());
    if (!typePart || !modePart) {
      errors.push(`${row.ID}: "Tipo / modalidad" debe declarar tipo y modalidad separados por "/".`);
    } else if (!allowedTypes.some((type) => typePart.toLowerCase().includes(type.toLowerCase()))) {
      errors.push(`${row.ID}: no contiene ningún tipo permitido.`);
    }

    for (const field of ['Origen', 'Tarea responsable']) {
      const known = extractTaskIds(row[field]).filter((id) => context.tasks.has(id));
      if (known.length === 0) errors.push(`${row.ID}: "${field}" no referencia ninguna tarea canónica existente.`);
      const unknown = findUnknownCanonicalTaskIds(row[field], context.tasks);
      if (unknown.length > 0) {
        errors.push(`${row.ID}: "${field}" referencia tareas canónicas inexistentes: ${unknown.join(', ')}.`);
      }
    }
    if (/pendiente/i.test(row.Paquete)
      && extractTaskIds(row['Tarea responsable']).every((id) => !context.tasks.has(id))) {
      errors.push(`${row.ID}: paquete pendiente sin tarea canónica propietaria.`);
    }
    if (row.Estado === 'DIFERIDO') {
      const deferralText = `${row['Tarea responsable']} ${row['Último resultado']} ${row.Evidencia}`;
      if (!/justific|riesgo|puerta|gate|resolver/i.test(deferralText)) {
        errors.push(`${row.ID}: un requisito DIFERIDO debe declarar justificación, riesgo y puerta de resolución.`);
      }
    }

    for (const relation of expandTreqReferences(row.Relación)) {
      if (relation === row.ID) errors.push(`${row.ID}: no puede relacionarse consigo mismo.`);
      if (!rows.some((candidate) => candidate.ID === relation)) {
        unresolvedRelations += 1;
        errors.push(`${row.ID}: relación no resoluble ${relation}.`);
      }
    }
    for (const proposal of row.Evidencia.matchAll(
      new RegExp(`\\bpropuesta\\s+\`?(${TASK_PATTERN})\`?`, 'gi')
    )) {
      const task = context.tasks.get(proposal[1].toUpperCase());
      if (task?.state === 'APROBADA') {
        errors.push(`${row.ID}: la evidencia sigue llamando propuesta a la tarea aprobada ${task.id}.`);
      }
    }
    if (/\b(?:definid[oa]s?\s+en\s+propuesta|regla\s+de\s+\w+\s+propuesta|aprobación\s+pendiente)\b/i.test(row.Evidencia)) {
      const approvedSources = extractTaskIds(`${row.Origen} ${row['Tarea responsable']}`)
        .map((id) => context.tasks.get(id))
        .filter((task) => task?.state === 'APROBADA');
      if (approvedSources.length > 0) {
        errors.push(
          `${row.ID}: la evidencia conserva lenguaje de propuesta o aprobación pendiente `
          + `para tareas ya aprobadas: ${[...new Set(approvedSources.map((task) => task.id))].join(', ')}.`
        );
      }
    }
  }

  for (const duplicate of duplicateIds) errors.push(`Identificador duplicado: ${duplicate}.`);
  for (const [domain, domainRows] of grouped) {
    domainRows.forEach((row, index) => {
      const expected = `TREQ-${domain}-${String(index + 1).padStart(3, '0')}`;
      if (row.ID !== expected) errors.push(`${domain}: secuencia inválida; se esperaba ${expected} y apareció ${row.ID}.`);
    });
  }

  const summary = parseSummary(normalized);
  const domainsWithRequirements = [...grouped.values()].filter((domainRows) => domainRows.length > 0).length;
  const summaryTotal = numericSummary(summary, 'Requisitos vigentes', errors);
  const summaryDomains = numericSummary(summary, 'Dominios con requisitos', errors);
  const summaryDuplicates = numericSummary(summary, 'Identificadores duplicados', errors);
  const summaryUnresolved = numericSummary(summary, 'Relaciones `TREQ-*` no resolubles', errors);
  const columnSummary = summary.get('Filas con catorce columnas')?.match(/(\d+)\s+de\s+(\d+)/);
  if (!columnSummary) {
    errors.push('Resumen: "Filas con catorce columnas" debe usar el formato N de N.');
  } else if (Number(columnSummary[1]) !== rows.length || Number(columnSummary[2]) !== rows.length) {
    errors.push(`Resumen: las filas con catorce columnas no coinciden con las ${rows.length} filas reales.`);
  }
  if (summaryTotal !== rows.length) errors.push(`Resumen: declara ${summaryTotal} requisitos y existen ${rows.length}.`);
  if (summaryDomains !== domainsWithRequirements) {
    errors.push(`Resumen: declara ${summaryDomains} dominios con requisitos y existen ${domainsWithRequirements}.`);
  }
  if (summaryDuplicates !== duplicateIds.size) errors.push('Resumen: el total de duplicados no coincide con el registro.');
  if (summaryUnresolved !== unresolvedRelations) errors.push('Resumen: el total de relaciones no resolubles no coincide con el registro.');

  const declaredLatest = summary.get('Última tarea incorporada');
  if (declaredLatest !== context.expectedLatestTaskId) {
    errors.push(`Resumen: la última tarea debe ser ${context.expectedLatestTaskId}, no ${declaredLatest || 'vacía'}.`);
  } else {
    const missingDerived = context.tasks.get(declaredLatest)?.derivedIds.filter((id) => !ids.has(id)) ?? [];
    if (missingDerived.length > 0) {
      errors.push(`${declaredLatest}: faltan requisitos derivados en el registro: ${missingDerived.join(', ')}.`);
    }
  }

  const distribution = parseDistribution(normalized);
  if (distribution.map((row) => row.domain).join('|') !== declaredDomains.join('|')) {
    errors.push('La distribución no conserva el orden y conjunto de dominios declarados.');
  }
  distribution.forEach((declared) => {
    const actual = grouped.get(declared.domain) ?? [];
    const expectedRange = actual.length === 1
      ? actual[0].ID
      : actual.length > 1
        ? `${actual[0].ID} a ${actual.at(-1).ID}`
        : '';
    if (declared.count !== actual.length || declared.range.replace(/`/g, '') !== expectedRange) {
      errors.push(`${declared.domain}: distribución declarada incoherente con las filas reales.`);
    }
  });

  return {
    errors,
    stats: {
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
    },
  };
}

export function validateCanonicalTreqRegistry({ root = process.cwd() } = {}) {
  const baseDir = path.resolve(root, 'docs/plan-canonico/modular');
  const manifest = JSON.parse(fs.readFileSync(path.join(baseDir, 'manifest.json'), 'utf8'));
  const context = buildCanonicalTreqContext({ baseDir, manifest });
  const result = validateTreqRegistrySource(readCanonicalTreqRegistry({ baseDir }), context);
  if (result.errors.length > 0) {
    throw new Error(`Registro TREQ inválido:\n- ${result.errors.join('\n- ')}`);
  }
  return result.stats;
}

const isCli = process.argv[1]
  && path.resolve(process.argv[1]) === path.resolve(fileURLToPath(import.meta.url));

if (isCli) {
  try {
    const stats = validateCanonicalTreqRegistry();
    console.log(
      `OK: registro TREQ; ${stats.requirements} requisitos; ${stats.domains} dominios; `
      + `${stats.duplicates} duplicados; ${stats.unresolvedRelations} relaciones no resolubles; `
      + `última tarea ${stats.latestTask}.`
    );
  } catch (error) {
    console.error(`ERROR: ${error instanceof Error ? error.message : String(error)}`);
    process.exit(1);
  }
}
