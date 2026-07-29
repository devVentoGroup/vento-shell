const TREQ_ROW_PATTERN = /^\| `(?<id>TREQ-[A-Z]+-\d{3,})` \|/;

function splitSource(source) {
  const newline = source.includes('\r\n') ? '\r\n' : '\n';
  const endsWithNewline = source.endsWith('\n');
  const normalized = source.replace(/\r\n?/g, '\n');
  const lines = normalized.split('\n');

  if (endsWithNewline) {
    lines.pop();
  }

  return { lines, newline, endsWithNewline };
}

function indexRows(lines) {
  const rows = new Map();

  lines.forEach((line, index) => {
    const match = line.match(TREQ_ROW_PATTERN);
    if (match?.groups?.id) {
      rows.set(match.groups.id, { index, line });
    }
  });

  return rows;
}

export function normalizeApprovedTaskEvidence({
  source,
  rowIds,
  approvedTaskIds,
}) {
  const parsed = splitSource(source);
  const targetRows = rowIds instanceof Set ? rowIds : new Set(rowIds);
  const approvedTasks = approvedTaskIds instanceof Set
    ? approvedTaskIds
    : new Set(approvedTaskIds);
  const taskPattern =
    /\bpropuesta\s+(`?([A-Z][A-Z0-9]*(?:-[A-Z0-9]+)+-\d{3})`?)/giu;

  const lines = parsed.lines.map((line) => {
    const rowId = line.match(TREQ_ROW_PATTERN)?.groups?.id;
    if (!rowId || !targetRows.has(rowId)) {
      return line;
    }

    return line.replace(taskPattern, (match, renderedTask, taskId) => {
      if (!approvedTasks.has(taskId.toUpperCase())) {
        return match;
      }
      return `${renderedTask} aprobada`;
    });
  });

  return lines.join(parsed.newline)
    + (parsed.endsWithNewline ? parsed.newline : '');
}

export function updateLatestTaskSummary(source, latestTaskId) {
  return source.replace(
    /^(\|\s*Última tarea incorporada\s*\|\s*).*?(\s*\|\s*)$/mu,
    `$1\`${latestTaskId}\`$2`
  );
}

function updateNumericSummaryMetric(source, label, value) {
  const escapedLabel = label.replace(/[.*+?^${}()|[\]\\]/g, '\\$&');
  return source.replace(
    new RegExp(
      `^(\\|\\s*${escapedLabel}\\s*\\|\\s*)\\*\\*.*?\\*\\*(\\s*\\|\\s*)$`,
      'mu'
    ),
    `$1**${value}**$2`
  );
}

export function updateRegistrySummary(source, stats) {
  let updated = source;
  updated = updateNumericSummaryMetric(
    updated,
    'Requisitos vigentes',
    stats.requirements
  );
  updated = updateNumericSummaryMetric(
    updated,
    'Dominios con requisitos',
    stats.domains
  );
  updated = updateNumericSummaryMetric(
    updated,
    'Filas con catorce columnas',
    `${stats.requirements} de ${stats.requirements}`
  );
  updated = updateNumericSummaryMetric(
    updated,
    'Identificadores duplicados',
    stats.duplicates
  );
  updated = updateNumericSummaryMetric(
    updated,
    'Relaciones `TREQ-*` no resolubles',
    stats.unresolvedRelations
  );
  return updateLatestTaskSummary(updated, stats.latestTask);
}

export function reconcileTreqRegistrySource({
  currentSource,
  baselineSource,
  restoreIds,
}) {
  const current = splitSource(currentSource);
  const baseline = splitSource(baselineSource);
  const currentRows = indexRows(current.lines);
  const baselineRows = indexRows(baseline.lines);
  const changedExistingIds = [];
  const preservedChangedExistingIds = [];
  const newIds = [];
  const missingBaselineIds = [];
  const candidateLines = [...current.lines];

  for (const [id, currentRow] of currentRows) {
    const baselineRow = baselineRows.get(id);

    if (!baselineRow) {
      newIds.push(id);
      continue;
    }

    if (currentRow.line !== baselineRow.line) {
      if (!restoreIds || restoreIds.has(id)) {
        changedExistingIds.push(id);
        candidateLines[currentRow.index] = baselineRow.line;
      } else {
        preservedChangedExistingIds.push(id);
      }
    }
  }

  for (const id of baselineRows.keys()) {
    if (!currentRows.has(id)) {
      missingBaselineIds.push(id);
    }
  }

  const candidateSource = candidateLines.join(current.newline)
    + (current.endsWithNewline ? current.newline : '');

  return {
    candidateSource,
    changedExistingIds,
    preservedChangedExistingIds,
    newIds,
    missingBaselineIds,
  };
}
