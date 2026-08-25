import { createHash } from 'node:crypto';
import fs from 'node:fs';
import path from 'node:path';
import { spawnSync } from 'node:child_process';
import { fileURLToPath } from 'node:url';

const MIGRATIONS_RELATIVE = 'supabase/migrations';
const MANIFEST_RELATIVE = 'supabase/MIGRATION_MANIFEST.md';
const BASELINE_FILENAME = '00000000000000_baseline.sql';
const CANONICAL_NEW_NAME = /^[0-9]{14}_[a-z0-9][a-z0-9_]*\.sql$/u;
const FINDING_ORDER = [
  'EMPTY_FILE',
  'CONTENT_DUPLICATE',
  'SAME_LOGICAL_FAMILY',
  'LEGACY_NAMING',
];
const FORBIDDEN_ENVIRONMENT_STATUS = [
  'applied_remote',
  'applied_staging',
  'applied_production',
  'pending_production',
];
const TABLE_COLUMNS = [
  'version',
  'filename',
  'sha256',
  'bytes',
  'kind',
  'findings',
  'lineage',
  'notes',
];

function fail(message) {
  const error = new Error(message);
  error.exitCode = 1;
  throw error;
}

function normalizeRepoPath(value) {
  return String(value ?? '').replaceAll('\\', '/').replace(/^\.\//u, '');
}

function migrationAbsoluteRoot(root) {
  return path.join(root, ...MIGRATIONS_RELATIVE.split('/'));
}

function manifestAbsolutePath(root) {
  return path.join(root, ...MANIFEST_RELATIVE.split('/'));
}

export function canonicalMigrationBytes(content) {
  const input = Buffer.isBuffer(content) ? content : Buffer.from(content);
  const output = [];
  for (let index = 0; index < input.length; index += 1) {
    if (input[index] === 13 && input[index + 1] === 10) {
      output.push(10);
      index += 1;
      continue;
    }
    output.push(input[index]);
  }
  return Buffer.from(output);
}

function listRegularFilesRecursive(directory, prefix = '') {
  const entries = fs.readdirSync(directory, { withFileTypes: true })
    .sort((left, right) => left.name.localeCompare(right.name, 'en'));
  const files = [];
  for (const entry of entries) {
    const relative = prefix ? `${prefix}/${entry.name}` : entry.name;
    const absolute = path.join(directory, entry.name);
    if (entry.isDirectory()) {
      files.push(...listRegularFilesRecursive(absolute, relative));
      continue;
    }
    if (entry.isFile()) files.push(relative);
  }
  return files;
}

export function classifyMigrationFile(filename) {
  const normalized = normalizeRepoPath(filename);
  const basename = path.posix.basename(normalized);
  const versionMatch = /^([0-9]{14})_(.+)$/u.exec(basename);
  const version = versionMatch?.[1] ?? 'UNVERSIONED';
  const rawTail = versionMatch?.[2] ?? basename;
  const withoutSql = rawTail.endsWith('.sql') ? rawTail.slice(0, -4) : rawTail;
  const logicalFamily = withoutSql.replace(/\.(?:manual|fixed)$/u, '');

  let kind = 'STANDARD';
  if (basename === BASELINE_FILENAME) kind = 'BASELINE';
  else if (basename.endsWith('.manual.sql')) kind = 'MANUAL_LEGACY';
  else if (basename.endsWith('.fixed.sql')) kind = 'FIXED_LEGACY';

  const canonicalName = basename === BASELINE_FILENAME || CANONICAL_NEW_NAME.test(basename);
  return {
    version,
    filename: normalized,
    basename,
    logicalFamily,
    kind,
    canonicalName,
  };
}

function groupBy(items, keySelector) {
  const groups = new Map();
  for (const item of items) {
    const key = keySelector(item);
    const bucket = groups.get(key) ?? [];
    bucket.push(item);
    groups.set(key, bucket);
  }
  return groups;
}

function relationPeers(group, filename) {
  return group
    .map((entry) => entry.filename)
    .filter((entry) => entry !== filename)
    .sort((left, right) => left.localeCompare(right, 'en'));
}

function sortRows(rows) {
  return [...rows].sort((left, right) => {
    if (left.filename === BASELINE_FILENAME && right.filename !== BASELINE_FILENAME) return -1;
    if (right.filename === BASELINE_FILENAME && left.filename !== BASELINE_FILENAME) return 1;
    const versionOrder = left.version.localeCompare(right.version, 'en');
    if (versionOrder !== 0) return versionOrder;
    return left.filename.localeCompare(right.filename, 'en');
  });
}

export function inventoryMigrations({ root = process.cwd() } = {}) {
  const directory = migrationAbsoluteRoot(root);
  if (!fs.existsSync(directory) || !fs.statSync(directory).isDirectory()) {
    fail(`MIGRATIONS_DIRECTORY_MISSING:${MIGRATIONS_RELATIVE}`);
  }

  const physicalFiles = listRegularFilesRecursive(directory);
  if (physicalFiles.length === 0) fail('MIGRATIONS_DIRECTORY_EMPTY');

  const rows = physicalFiles.map((relative) => {
    const classified = classifyMigrationFile(relative);
    const absolute = path.join(directory, ...relative.split('/'));
    const content = canonicalMigrationBytes(fs.readFileSync(absolute));
    return {
      ...classified,
      sha256: createHash('sha256').update(content).digest('hex'),
      bytes: content.byteLength,
    };
  });

  const shaGroups = groupBy(rows, (row) => row.sha256);
  const familyGroups = groupBy(rows, (row) => row.logicalFamily || `__NONE__:${row.filename}`);
  const versionGroups = groupBy(rows, (row) => row.version);

  const finalized = rows.map((row) => {
    const findings = [];
    const lineage = [];

    if (row.bytes === 0) findings.push('EMPTY_FILE');

    const sameContent = shaGroups.get(row.sha256) ?? [];
    if (sameContent.length > 1) {
      findings.push('CONTENT_DUPLICATE');
      lineage.push(`content:${relationPeers(sameContent, row.filename).join(',')}`);
    }

    const sameFamily = familyGroups.get(row.logicalFamily) ?? [];
    if (row.logicalFamily && sameFamily.length > 1) {
      findings.push('SAME_LOGICAL_FAMILY');
      lineage.push(`family:${relationPeers(sameFamily, row.filename).join(',')}`);
    }

    if (!row.canonicalName) findings.push('LEGACY_NAMING');

    const sameVersion = versionGroups.get(row.version) ?? [];
    if (row.version !== 'UNVERSIONED' && sameVersion.length > 1) {
      lineage.push(`version:${relationPeers(sameVersion, row.filename).join(',')}`);
    }

    const orderedFindings = FINDING_ORDER.filter((finding) => findings.includes(finding));
    const hasDocumentedRelation = lineage.length > 0;
    let disposition = 'SIN_HALLAZGO';
    if (hasDocumentedRelation) disposition = 'RELACIÓN_DOCUMENTADA';
    else if (orderedFindings.length > 0) disposition = 'HISTÓRICO_PRESERVADO';

    return {
      version: row.version,
      filename: row.filename,
      sha256: row.sha256,
      bytes: String(row.bytes),
      kind: row.kind,
      findings: orderedFindings.join(','),
      lineage: lineage.join('; '),
      notes: disposition,
    };
  });

  const duplicateContentGroups = [...shaGroups.values()].filter((group) => group.length > 1);
  const logicalFamilyGroups = [...familyGroups.values()].filter((group) => group.length > 1);
  const repeatedVersionGroups = [...versionGroups.entries()]
    .filter(([version, group]) => version !== 'UNVERSIONED' && group.length > 1)
    .map(([, group]) => group);

  return {
    rows: sortRows(finalized),
    summary: {
      files: rows.length,
      emptyFiles: rows.filter((row) => row.bytes === 0).length,
      legacyNamingFiles: rows.filter((row) => !row.canonicalName).length,
      duplicateContentGroups: duplicateContentGroups.length,
      logicalFamilyGroups: logicalFamilyGroups.length,
      repeatedVersionGroups: repeatedVersionGroups.length,
    },
  };
}

function escapeMarkdownCell(value) {
  return String(value ?? '')
    .replaceAll('\\', '\\\\')
    .replaceAll('|', '\\|')
    .replace(/[\r\n]+/gu, ' ')
    .trim();
}

function unescapeMarkdownCell(value) {
  return String(value ?? '').replaceAll('\\|', '|').replaceAll('\\\\', '\\').trim();
}

function splitMarkdownRow(line) {
  const source = String(line ?? '').trim();
  if (!source.startsWith('|') || !source.endsWith('|')) return [];
  const cells = [];
  let current = '';
  let escaped = false;
  for (const char of source.slice(1, -1)) {
    if (escaped) {
      current += `\\${char}`;
      escaped = false;
      continue;
    }
    if (char === '\\') {
      escaped = true;
      continue;
    }
    if (char === '|') {
      cells.push(unescapeMarkdownCell(current));
      current = '';
      continue;
    }
    current += char;
  }
  if (escaped) current += '\\';
  cells.push(unescapeMarkdownCell(current));
  return cells.map((cell) => cell.trim());
}

export function renderManifest(inventory) {
  const { rows, summary } = inventory;
  const lines = [
    '# VENTO Supabase Migration Manifest',
    '',
    '> Generated inventory for `AUTH-DB-015::GLOBAL`. Do not edit migration rows manually.',
    '',
    '`supabase/migrations/` is the executable canonical source. This manifest inventories versioned files; it does not assert whether a migration is applied in local, staging, or production.',
    '',
    'Environment state: NOT_TRACKED_HERE.',
    '',
    'Regenerate with `npm run supabase:migrations:manifest:build` and validate with `npm run supabase:migrations:manifest:check`.',
    '',
    '<!-- prettier-ignore -->',
    `| ${TABLE_COLUMNS.join(' | ')} |`,
    `| ${TABLE_COLUMNS.map(() => '---').join(' | ')} |`,
  ];

  for (const row of rows) {
    lines.push(`| ${TABLE_COLUMNS.map((column) => escapeMarkdownCell(row[column])).join(' | ')} |`);
  }

  lines.push(
    '',
    '## Inventory summary',
    '',
    `- Physical files: ${summary.files}`,
    `- Empty files: ${summary.emptyFiles}`,
    `- Content-duplicate groups: ${summary.duplicateContentGroups}`,
    `- Same-logical-family groups: ${summary.logicalFamilyGroups}`,
    `- Repeated-version groups: ${summary.repeatedVersionGroups}`,
    `- Legacy-naming files: ${summary.legacyNamingFiles}`,
    '',
    '## Binding rules',
    '',
    '- Every regular file under `supabase/migrations/` appears exactly once above.',
    '- `sha256` and `bytes` describe repository-canonical content; CRLF introduced by checkout is normalized to LF and no other bytes are rewritten.',
    '- Historical files are preserved; duplicate content, empty files and legacy names are findings, not deletion instructions.',
    '- New migration filenames must match `^[0-9]{14}_[a-z0-9][a-z0-9_]*\\.sql$`.',
    '- `00000000000000_baseline.sql` remains the reserved baseline.',
    '- New `.manual.sql` and `.fixed.sql` suffixes are forbidden; historical instances remain classified as legacy.',
    '- Environment application state is outside this manifest and belongs to `AUTH-DB-028`.',
    '- Schema/integrity/RLS/RPC/migration testing belongs to `AUTH-DB-027`.',
    '- Backup, restore and rollback validation belongs to `AUTH-DB-029`.',
    '',
  );
  return lines.join('\n');
}

export function parseManifestRows(source) {
  const lines = String(source ?? '').replaceAll('\r\n', '\n').split('\n');
  const headerIndex = lines.findIndex((line) => {
    const cells = splitMarkdownRow(line);
    return cells.length === TABLE_COLUMNS.length
      && cells.every((cell, index) => cell === TABLE_COLUMNS[index]);
  });
  if (headerIndex < 0) fail('MANIFEST_TABLE_HEADER_MISSING');

  const separator = splitMarkdownRow(lines[headerIndex + 1]);
  if (separator.length !== TABLE_COLUMNS.length || separator.some((cell) => !/^:?-{3,}:?$/u.test(cell))) {
    fail('MANIFEST_TABLE_SEPARATOR_INVALID');
  }

  const rows = [];
  for (let index = headerIndex + 2; index < lines.length; index += 1) {
    if (!lines[index].trim().startsWith('|')) break;
    const cells = splitMarkdownRow(lines[index]);
    if (cells.length !== TABLE_COLUMNS.length) fail(`MANIFEST_ROW_COLUMN_COUNT:${index + 1}`);
    rows.push(Object.fromEntries(TABLE_COLUMNS.map((column, cellIndex) => [column, cells[cellIndex]])));
  }
  return rows;
}

function compareRows(expected, actual) {
  if (actual.length !== expected.length) {
    fail(`MANIFEST_ROW_COUNT_MISMATCH:expected=${expected.length}:actual=${actual.length}`);
  }
  for (let index = 0; index < expected.length; index += 1) {
    for (const column of TABLE_COLUMNS) {
      if (actual[index][column] !== expected[index][column]) {
        fail(
          `MANIFEST_ROW_MISMATCH:index=${index}:column=${column}:expected=${expected[index][column]}:actual=${actual[index][column]}`,
        );
      }
    }
  }
}

function runGit(root, args) {
  const result = spawnSync('git', args, {
    cwd: root,
    encoding: 'utf8',
    windowsHide: true,
    stdio: ['ignore', 'pipe', 'pipe'],
  });
  if (result.error || result.status !== 0) return [];
  return String(result.stdout ?? '')
    .split(/\r?\n/u)
    .map((entry) => normalizeRepoPath(entry.trim()))
    .filter(Boolean);
}

export function discoverNewMigrationPaths({ root = process.cwd() } = {}) {
  const candidates = new Set();
  const commands = [
    ['diff', '--name-only', '--diff-filter=A', 'HEAD', '--', MIGRATIONS_RELATIVE],
    ['diff', '--cached', '--name-only', '--diff-filter=A', 'HEAD', '--', MIGRATIONS_RELATIVE],
    ['ls-files', '--others', '--exclude-standard', '--', MIGRATIONS_RELATIVE],
  ];
  const originMain = spawnSync('git', ['rev-parse', '--verify', '--quiet', 'origin/main'], {
    cwd: root,
    encoding: 'utf8',
    windowsHide: true,
    stdio: ['ignore', 'pipe', 'pipe'],
  });
  if (!originMain.error && originMain.status === 0) {
    commands.push(['diff', '--name-only', '--diff-filter=A', 'origin/main...HEAD', '--', MIGRATIONS_RELATIVE]);
  }
  for (const args of commands) {
    for (const entry of runGit(root, args)) candidates.add(entry);
  }
  return [...candidates].sort((left, right) => left.localeCompare(right, 'en'));
}

export function validateNewMigrationFilename(repoRelativePath) {
  const normalized = normalizeRepoPath(repoRelativePath);
  const prefix = `${MIGRATIONS_RELATIVE}/`;
  if (!normalized.startsWith(prefix)) return false;
  const nestedRelative = normalized.slice(prefix.length);
  if (nestedRelative.includes('/')) return false;
  if (nestedRelative === BASELINE_FILENAME) return false;
  return CANONICAL_NEW_NAME.test(nestedRelative);
}

export function findNewVersionConflicts(newPaths, allMigrationPaths) {
  const versionGroups = new Map();
  for (const entry of allMigrationPaths) {
    const classified = classifyMigrationFile(entry);
    if (classified.version === 'UNVERSIONED') continue;
    const bucket = versionGroups.get(classified.version) ?? [];
    bucket.push(classified.filename);
    versionGroups.set(classified.version, bucket);
  }

  const conflicts = [];
  for (const entry of newPaths) {
    const normalized = normalizeRepoPath(entry);
    const prefix = `${MIGRATIONS_RELATIVE}/`;
    const relative = normalized.startsWith(prefix) ? normalized.slice(prefix.length) : normalized;
    const classified = classifyMigrationFile(relative);
    const group = versionGroups.get(classified.version) ?? [];
    if (classified.version !== 'UNVERSIONED' && group.length > 1) {
      conflicts.push(`${classified.version}:${group.sort((left, right) => left.localeCompare(right, 'en')).join(',')}`);
    }
  }
  return [...new Set(conflicts)].sort((left, right) => left.localeCompare(right, 'en'));
}

function assertNewMigrationConstraints(root) {
  const newPaths = discoverNewMigrationPaths({ root });
  const invalid = newPaths.filter((entry) => !validateNewMigrationFilename(entry));
  if (invalid.length > 0) fail(`NEW_MIGRATION_NAME_VIOLATION:${invalid.join(',')}`);

  const physical = listRegularFilesRecursive(migrationAbsoluteRoot(root));
  const conflicts = findNewVersionConflicts(newPaths, physical);
  if (conflicts.length > 0) fail(`NEW_MIGRATION_VERSION_DUPLICATE:${conflicts.join(';')}`);
}

function assertManifestPreamble(source) {
  const lower = String(source ?? '').toLowerCase();
  for (const forbidden of FORBIDDEN_ENVIRONMENT_STATUS) {
    if (lower.includes(forbidden)) fail(`FORBIDDEN_ENVIRONMENT_STATUS:${forbidden}`);
  }
  if (!source.includes('`supabase/migrations/` is the executable canonical source.')) {
    fail('MANIFEST_CANONICAL_SOURCE_DECLARATION_MISSING');
  }
  if (!source.includes('Environment state: NOT_TRACKED_HERE.')) {
    fail('MANIFEST_ENVIRONMENT_BOUNDARY_MISSING');
  }
}

export function buildManifest({ root = process.cwd() } = {}) {
  assertNewMigrationConstraints(root);
  const inventory = inventoryMigrations({ root });
  const output = renderManifest(inventory);
  const target = manifestAbsolutePath(root);
  fs.writeFileSync(target, output, 'utf8');
  return inventory;
}

export function checkManifest({ root = process.cwd() } = {}) {
  const target = manifestAbsolutePath(root);
  if (!fs.existsSync(target) || !fs.statSync(target).isFile()) fail(`MANIFEST_MISSING:${MANIFEST_RELATIVE}`);
  const source = fs.readFileSync(target, 'utf8').replaceAll('\r\n', '\n');
  assertManifestPreamble(source);
  assertNewMigrationConstraints(root);
  const inventory = inventoryMigrations({ root });
  const actualRows = parseManifestRows(source);
  compareRows(inventory.rows, actualRows);
  return inventory;
}

function printSummary(operation, inventory) {
  const { summary } = inventory;
  console.log('=== RESULTADO PARA CHATGPT ===');
  console.log('ESTADO: PASS');
  console.log(`OPERACION: ${operation}`);
  console.log(`FILES: ${summary.files}`);
  console.log(`EMPTY_FILES: ${summary.emptyFiles}`);
  console.log(`CONTENT_DUPLICATE_GROUPS: ${summary.duplicateContentGroups}`);
  console.log(`LOGICAL_FAMILY_GROUPS: ${summary.logicalFamilyGroups}`);
  console.log(`REPEATED_VERSION_GROUPS: ${summary.repeatedVersionGroups}`);
  console.log(`LEGACY_NAMING_FILES: ${summary.legacyNamingFiles}`);
  console.log('NEW_NAME_VIOLATIONS: 0');
  console.log('ERROR: NONE');
  console.log('=== FIN RESULTADO PARA CHATGPT ===');
}

function printFailure(operation, error) {
  const message = error instanceof Error ? error.message : String(error);
  console.log('=== RESULTADO PARA CHATGPT ===');
  console.log('ESTADO: FAIL');
  console.log(`OPERACION: ${operation}`);
  console.log(`ERROR: ${message.replace(/[^\x20-\x7E]/gu, '?').replace(/\s+/gu, ' ').trim()}`);
  console.log('=== FIN RESULTADO PARA CHATGPT ===');
}

function usage() {
  console.log('Usage:');
  console.log('  node scripts/supabase/migration-manifest.mjs build');
  console.log('  node scripts/supabase/migration-manifest.mjs check');
}

function main() {
  const mode = String(process.argv[2] ?? '').trim().toLowerCase();
  if (!['build', 'check'].includes(mode)) {
    usage();
    process.exitCode = 1;
    return;
  }

  try {
    const inventory = mode === 'build' ? buildManifest() : checkManifest();
    printSummary(mode === 'build' ? 'MIGRATION_MANIFEST_BUILD' : 'MIGRATION_MANIFEST_CHECK', inventory);
  } catch (error) {
    printFailure(mode === 'build' ? 'MIGRATION_MANIFEST_BUILD' : 'MIGRATION_MANIFEST_CHECK', error);
    process.exitCode = Number.isInteger(error?.exitCode) ? error.exitCode : 1;
  }
}

const isCli = process.argv[1]
  && path.resolve(process.argv[1]) === path.resolve(fileURLToPath(import.meta.url));

if (isCli) main();
