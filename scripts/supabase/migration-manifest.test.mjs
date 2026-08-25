import assert from 'node:assert/strict';
import fs from 'node:fs';
import os from 'node:os';
import path from 'node:path';
import test from 'node:test';

import {
  buildManifest,
  checkManifest,
  canonicalMigrationBytes,
  classifyMigrationFile,
  findNewVersionConflicts,
  inventoryMigrations,
  parseManifestRows,
  renderManifest,
  validateNewMigrationFilename,
} from './migration-manifest.mjs';

function withFixture(run) {
  const root = fs.mkdtempSync(path.join(os.tmpdir(), 'vento-auth-db-015-'));
  const migrations = path.join(root, 'supabase', 'migrations');
  fs.mkdirSync(migrations, { recursive: true });
  try {
    return run({ root, migrations });
  } finally {
    fs.rmSync(root, { recursive: true, force: true });
  }
}

function writeFixtureMigration(directory, filename, content) {
  fs.writeFileSync(path.join(directory, filename), content);
}

test('contenido canonico es estable entre checkout CRLF de Windows y LF de CI', () => {
  const lf = canonicalMigrationBytes(Buffer.from('select 1;\n', 'utf8'));
  const crlf = canonicalMigrationBytes(Buffer.from('select 1;\r\n', 'utf8'));
  assert.deepEqual(crlf, lf);
  assert.equal(crlf.byteLength, lf.byteLength);
  assert.deepEqual(
    canonicalMigrationBytes(Buffer.from([1, 2, 3, 13, 10, 4, 255])),
    Buffer.from([1, 2, 3, 10, 4, 255]),
  );
});

test('clasifica baseline, standard y sufijos legacy sin reescribir identidad', () => {
  assert.deepEqual(
    classifyMigrationFile('00000000000000_baseline.sql'),
    {
      version: '00000000000000',
      filename: '00000000000000_baseline.sql',
      basename: '00000000000000_baseline.sql',
      logicalFamily: 'baseline',
      kind: 'BASELINE',
      canonicalName: true,
    },
  );
  assert.equal(classifyMigrationFile('20260825120000_example.sql').kind, 'STANDARD');
  assert.equal(classifyMigrationFile('20260531200500_example.manual.sql').kind, 'MANUAL_LEGACY');
  assert.equal(classifyMigrationFile('20260605124500_example.fixed.sql').kind, 'FIXED_LEGACY');
  assert.equal(classifyMigrationFile('20260531200500_example.manual.sql').canonicalName, false);
});

test('convencion nueva exige catorce digitos, slug normalizado y ubicacion directa', () => {
  assert.equal(validateNewMigrationFilename('supabase/migrations/20260825123045_valid_name.sql'), true);
  assert.equal(validateNewMigrationFilename('supabase/migrations/202608251230_invalid.sql'), false);
  assert.equal(validateNewMigrationFilename('supabase/migrations/20260825123045_bad-name.sql'), false);
  assert.equal(validateNewMigrationFilename('supabase/migrations/20260825123045_old.manual.sql'), false);
  assert.equal(validateNewMigrationFilename('supabase/migrations/nested/20260825123045_valid.sql'), false);
  assert.equal(validateNewMigrationFilename('supabase/migrations/00000000000000_baseline.sql'), false);
});


test('version nueva no puede repetir identidad de version existente', () => {
  assert.deepEqual(
    findNewVersionConflicts(
      ['supabase/migrations/20260825123045_second.sql'],
      ['20260825123045_first.sql', '20260825123045_second.sql', '20260825123100_other.sql'],
    ),
    ['20260825123045:20260825123045_first.sql,20260825123045_second.sql'],
  );
  assert.deepEqual(
    findNewVersionConflicts(
      ['supabase/migrations/20260825123100_other.sql'],
      ['20260825123045_first.sql', '20260825123100_other.sql'],
    ),
    [],
  );
});

test('inventario deriva hashes, bytes, vacios, duplicados, familias y legacy', () => withFixture(({ root, migrations }) => {
  writeFixtureMigration(migrations, '00000000000000_baseline.sql', 'select 0;\n');
  writeFixtureMigration(migrations, '20260825090000_alpha.sql', 'select 1;\n');
  writeFixtureMigration(migrations, '20260825090100_beta.sql', 'select 1;\n');
  writeFixtureMigration(migrations, '20260825090200_family.sql', 'select 2;\n');
  writeFixtureMigration(migrations, '20260825090300_family.sql', 'select 3;\n');
  writeFixtureMigration(migrations, '20260825090400_empty.sql', '');
  writeFixtureMigration(migrations, '20260825090500_legacy.manual.sql', 'select 4;\n');

  const inventory = inventoryMigrations({ root });
  assert.equal(inventory.summary.files, 7);
  assert.equal(inventory.summary.emptyFiles, 1);
  assert.equal(inventory.summary.duplicateContentGroups, 1);
  assert.equal(inventory.summary.logicalFamilyGroups, 1);
  assert.equal(inventory.summary.legacyNamingFiles, 1);

  const alpha = inventory.rows.find((row) => row.filename === '20260825090000_alpha.sql');
  const family = inventory.rows.find((row) => row.filename === '20260825090200_family.sql');
  const empty = inventory.rows.find((row) => row.filename === '20260825090400_empty.sql');
  const legacy = inventory.rows.find((row) => row.filename === '20260825090500_legacy.manual.sql');

  assert.match(alpha.findings, /CONTENT_DUPLICATE/u);
  assert.match(alpha.lineage, /content:20260825090100_beta\.sql/u);
  assert.match(family.findings, /SAME_LOGICAL_FAMILY/u);
  assert.match(family.lineage, /family:20260825090300_family\.sql/u);
  assert.match(empty.findings, /EMPTY_FILE/u);
  assert.match(legacy.findings, /LEGACY_NAMING/u);
  assert.equal(inventory.rows[0].filename, '00000000000000_baseline.sql');
}));

test('render y parse preservan las ocho columnas contractuales', () => withFixture(({ root, migrations }) => {
  writeFixtureMigration(migrations, '00000000000000_baseline.sql', 'select 0;\n');
  writeFixtureMigration(migrations, '20260825100000_one.sql', 'select 1;\n');
  const inventory = inventoryMigrations({ root });
  const source = renderManifest(inventory);
  const rows = parseManifestRows(source);
  assert.deepEqual(rows, inventory.rows);
  assert.match(source, /version \| filename \| sha256 \| bytes \| kind \| findings \| lineage \| notes/u);
  assert.doesNotMatch(source, /applied_remote/iu);
  assert.doesNotMatch(source, /applied_production/iu);
}));

test('build y check detectan manifiesto obsoleto cuando cambia contenido fisico', () => withFixture(({ root, migrations }) => {
  writeFixtureMigration(migrations, '00000000000000_baseline.sql', 'select 0;\n');
  writeFixtureMigration(migrations, '20260825110000_one.sql', 'select 1;\n');
  buildManifest({ root });
  assert.equal(checkManifest({ root }).summary.files, 2);

  writeFixtureMigration(migrations, '20260825110000_one.sql', 'select 2;\n');
  assert.throws(() => checkManifest({ root }), /MANIFEST_ROW_MISMATCH/u);
}));

test('check rechaza estado aplicado por entorno dentro del manifiesto', () => withFixture(({ root, migrations }) => {
  writeFixtureMigration(migrations, '00000000000000_baseline.sql', 'select 0;\n');
  buildManifest({ root });
  const manifest = path.join(root, 'supabase', 'MIGRATION_MANIFEST.md');
  fs.appendFileSync(manifest, '\n## applied_remote\n', 'utf8');
  assert.throws(() => checkManifest({ root }), /FORBIDDEN_ENVIRONMENT_STATUS/u);
}));

test('integracion del repositorio conserva fachada test y exige manifest check en Required Gate', () => {
  const pkg = JSON.parse(fs.readFileSync('package.json', 'utf8'));
  assert.equal(pkg.scripts.test, 'node scripts/quality/repository-test-command-gate.mjs run-shell');
  assert.equal(pkg.scripts['supabase:migrations:manifest:build'], 'node scripts/supabase/migration-manifest.mjs build');
  assert.equal(pkg.scripts['supabase:migrations:manifest:check'], 'node scripts/supabase/migration-manifest.mjs check');

  const workflow = fs.readFileSync('.github/workflows/vento-required-gate.yml', 'utf8');
  const install = workflow.indexOf('run: npm ci');
  const manifestCheck = workflow.indexOf('run: npm run supabase:migrations:manifest:check', install);
  const publicTests = workflow.indexOf('run: npm test --silent', manifestCheck);
  assert.ok(install >= 0);
  assert.ok(manifestCheck > install);
  assert.ok(publicTests > manifestCheck);
});

test('arquitectura reconciliada mantiene autoridad unica y fronteras AUTH-DB-027/028/029', () => {
  const source = fs.readFileSync('docs/ARQUITECTURA-MIGRACIONES-CENTRALIZADAS.md', 'utf8');
  assert.match(source, /`supabase\/migrations\/` es el universo canónico/iu);
  assert.match(source, /`supabase\/MIGRATION_MANIFEST\.md` no sustituye los archivos SQL/iu);
  assert.match(source, /AUTH-DB-027/u);
  assert.match(source, /AUTH-DB-028/u);
  assert.match(source, /AUTH-DB-029/u);
  assert.doesNotMatch(source, /##\s+applied_remote/iu);
  assert.doesNotMatch(source, /cp\s+\.\.\/vento-shell\/supabase\/migrations/iu);
  assert.doesNotMatch(source, /sincronizar \(copiar \+ commit\)/iu);
});
