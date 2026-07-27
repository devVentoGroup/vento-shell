const TREQ_ROW_PATTERN = /^\| `(?<id>TREQ-[A-Z]+-\d{3})` \|/;

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
