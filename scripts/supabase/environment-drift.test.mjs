import assert from 'node:assert/strict';
import fs from 'node:fs';
import os from 'node:os';
import path from 'node:path';
import test from 'node:test';
import { fileURLToPath } from 'node:url';

import {
  __test,
  applyAllowlist,
  assertManagementRequest,
  compareFunctionSets,
  compareLocal,
  compareRemote,
  extractSqlScalar,
  inventoryEdgeFunctions,
  normalizeRemoteFunctionBody,
  parseToml,
  sha256,
  stableStringify,
  validateAllowlist,
  validatePackageScripts,
} from './environment-drift.mjs';

function withTempRoot(callback) {
  const root = fs.mkdtempSync(path.join(os.tmpdir(), 'vento-environment-drift-'));
  try {
    return callback(root);
  } finally {
    fs.rmSync(root, { recursive: true, force: true });
  }
}

test('parsea el subconjunto TOML usado por el contrato ambiental', () => {
  const parsed = parseToml(`
project_id = "vento-shell"
[api]
schemas = ["public", "graphql_public"]
max_rows = 1000
[db]
major_version = 17
[functions.webhook]
verify_jwt = false
`);
  assert.equal(parsed[''].project_id, 'vento-shell');
  assert.deepEqual(parsed.api.schemas, ['public', 'graphql_public']);
  assert.equal(parsed.api.max_rows, 1000);
  assert.equal(parsed.db.major_version, 17);
  assert.equal(parsed['functions.webhook'].verify_jwt, false);
});

test('stableStringify ordena claves sin destruir orden semantico de arreglos', () => {
  assert.equal(stableStringify({ b: 2, a: 1 }), stableStringify({ a: 1, b: 2 }));
  assert.notEqual(stableStringify({ a: [1, 2] }), stableStringify({ a: [2, 1] }));
});

test('inventa Edge Functions con digests, verify_jwt y nombres de secretos sin valores', () => {
  withTempRoot((root) => {
    fs.mkdirSync(path.join(root, 'supabase', 'functions', 'alpha'), { recursive: true });
    fs.writeFileSync(path.join(root, 'supabase', 'config.toml'), '[functions.alpha]\nverify_jwt = false\n', 'utf8');
    fs.writeFileSync(
      path.join(root, 'supabase', 'functions', 'alpha', 'index.ts'),
      'const key = Deno.env.get("PAYMENT_SECRET");\nconst url = Deno.env.get("SUPABASE_URL");\n',
      'utf8',
    );
    const functions = inventoryEdgeFunctions({ root });
    assert.equal(functions.length, 1);
    assert.equal(functions[0].slug, 'alpha');
    assert.equal(functions[0].verify_jwt, false);
    assert.deepEqual(functions[0].referenced_secret_names, ['PAYMENT_SECRET']);
    assert.match(functions[0].source_digest, /^[a-f0-9]{64}$/u);
    assert.equal(JSON.stringify(functions).includes('PAYMENT_SECRET='), false);
  });
});

test('normaliza cuerpo remoto de Edge Function al mismo modelo de archivos', () => {
  const remote = normalizeRemoteFunctionBody(
    'alpha',
    { verify_jwt: true, status: 'ACTIVE', version: 2, ezbr_sha256: 'abc' },
    { files: [{ name: 'alpha/index.ts', content: 'export const x = 1;\r\n' }] },
  );
  assert.equal(remote.slug, 'alpha');
  assert.equal(remote.verify_jwt, true);
  assert.equal(remote.files[0].path, 'index.ts');
  assert.equal(remote.files[0].sha256, sha256('export const x = 1;\n'));
  assert.match(remote.source_digest, /^[a-f0-9]{64}$/u);
});

test('Management API queda cerrada a GET y SQL read-only', () => {
  assert.equal(assertManagementRequest('GET', '/v1/projects/abc123'), true);
  assert.equal(assertManagementRequest('GET', '/v1/projects/abc123/database/migrations'), true);
  assert.equal(assertManagementRequest('POST', '/v1/projects/abc123/database/query/read-only'), true);
  assert.throws(
    () => assertManagementRequest('POST', '/v1/projects/abc123/database/query'),
    /MANAGEMENT_API_OPERATION_FORBIDDEN/u,
  );
  assert.throws(
    () => assertManagementRequest('PATCH', '/v1/projects/abc123/config/auth'),
    /MANAGEMENT_API_OPERATION_FORBIDDEN/u,
  );
  assert.throws(
    () => assertManagementRequest('DELETE', '/v1/projects/abc123/database/migrations'),
    /MANAGEMENT_API_OPERATION_FORBIDDEN/u,
  );
});

test('extrae resultado escalar de respuestas SQL compatibles', () => {
  assert.deepEqual(extractSqlScalar([{ fingerprint: '{"a":1}' }]), { a: 1 });
  assert.deepEqual(extractSqlScalar({ result: [{ storage_buckets: '[]' }] }), []);
  assert.throws(() => extractSqlScalar([]), /SQL_RESULT_EMPTY/u);
});

test('allowlist exige identidad exacta, owner, aprobador y expiracion vigente', () => {
  const base = {
    drift_id: 'DRIFT-1234',
    surface: 'auth.site_url',
    identity: 'project-ref',
    environment: 'staging',
    classification: 'EXPECTED_OVERLAY',
    reason: 'URL propia de staging',
    risk: 'LOW',
    owner: 'VENTO_OWNER',
    approver: 'VENTO_OWNER',
    evidence: 'ENV-IDENTITY-001',
    treatment: 'KEEP_ENVIRONMENT_SPECIFIC',
  };
  assert.equal(validateAllowlist([base]).length, 1);
  assert.throws(
    () => validateAllowlist([{ ...base, surface: 'auth.*' }]),
    /ALLOWLIST_WILDCARD_FORBIDDEN/u,
  );
  assert.throws(
    () => validateAllowlist([{ ...base, classification: 'TEMPORARY_EXCEPTION' }]),
    /ALLOWLIST_EXPIRATION_REQUIRED/u,
  );
  assert.throws(
    () => validateAllowlist([{
      ...base,
      classification: 'TEMPORARY_EXCEPTION',
      expires_at: '2020-01-01T00:00:00Z',
    }], { now: new Date('2026-08-26T00:00:00Z') }),
    /ALLOWLIST_EXPIRATION_EXPIRED/u,
  );
});

test('applyAllowlist solo reclasifica el drift exacto', () => {
  const drift = {
    drift_id: 'DRIFT-1234',
    surface: 'auth.site_url',
    identity: 'project-ref',
    environment: 'staging',
    classification: 'UNAUTHORIZED_DRIFT',
  };
  const allowance = validateAllowlist([{
    drift_id: 'DRIFT-1234',
    surface: 'auth.site_url',
    identity: 'project-ref',
    environment: 'staging',
    classification: 'EXPECTED_OVERLAY',
    reason: 'URL propia',
    risk: 'LOW',
    owner: 'VENTO_OWNER',
    approver: 'VENTO_OWNER',
    evidence: 'ENV-IDENTITY-001',
    treatment: 'KEEP_ENVIRONMENT_SPECIFIC',
  }]);
  assert.equal(applyAllowlist([drift], allowance)[0].classification, 'EXPECTED_OVERLAY');
});

test('comparacion de Edge Functions detecta presencia, verify_jwt y source drift', () => {
  const expected = [{
    slug: 'alpha',
    verify_jwt: true,
    source_digest: 'aaa',
    files: [],
  }];
  const observed = [{
    slug: 'alpha',
    verify_jwt: false,
    source_digest: 'bbb',
    files: [{ path: 'index.ts', sha256: 'x', bytes: 1 }],
  }];
  const drifts = [];
  compareFunctionSets(expected, observed, drifts, 'staging');
  assert.equal(drifts.length, 2);
  assert.deepEqual(drifts.map((entry) => entry.surface).sort(), [
    'edge_functions.source',
    'edge_functions.verify_jwt',
  ]);
});

test('local no certifica un candidate con worktree sucio', () => {
  const result = compareLocal({
    expected: {
      candidate: { clean: false, commit_sha: 'abc', dirty_path_count: 2 },
      migration_manifest: { count: 5 },
      config: { contract: { postgres_major: 17 } },
      expected_digest: 'expected',
    },
    observed: {
      harness: { migrations: 5 },
      toolchain: { postgres_major: 17 },
      observed_digest: 'observed',
    },
  });
  assert.equal(result.certification, 'INSUFFICIENT_EVIDENCE');
  assert.equal(result.drifts[0].surface, 'candidate.git_tree');
});

test('local certifica cuando el candidate esta limpio y contratos base coinciden', () => {
  const result = compareLocal({
    expected: {
      candidate: { clean: true, commit_sha: 'abc', dirty_path_count: 0 },
      migration_manifest: { count: 5 },
      config: { contract: { postgres_major: 17 } },
      expected_digest: 'expected',
    },
    observed: {
      harness: { migrations: 5 },
      toolchain: { postgres_major: 17 },
      observed_digest: 'observed',
    },
  });
  assert.equal(result.certification, 'LOCAL_CERTIFIED');
  assert.deepEqual(result.drifts, []);
});

test('remote sin identidad explicita termina en INSUFFICIENT_EVIDENCE', () => {
  const result = compareRemote({
    expected: {
      candidate: { clean: true, commit_sha: 'abc', dirty_path_count: 0 },
      expected_digest: 'expected',
    },
    localObserved: {},
    remoteObserved: {
      environment_role: 'staging',
      identity: { project_ref: null },
      identity_status: 'INSUFFICIENT_EVIDENCE',
      identity_issues: ['PROJECT_REF_MISSING_OR_INVALID'],
      observed_digest: null,
    },
  });
  assert.equal(result.certification, 'INSUFFICIENT_EVIDENCE');
  assert.equal(result.drifts[0].surface, 'environment.identity');
});

test('SQL de fingerprint excluye VITAL y no contiene operaciones de mutacion', () => {
  const sql = __test.FINGERPRINT_SQL.toLowerCase();
  assert.match(sql, /'vital'/u);
  assert.match(sql, /included_in_governed_schemas/u);
  assert.doesNotMatch(sql, /\b(insert|update|delete|alter|drop|create|truncate)\b/u);
});

test('captura fingerprints mayores al maxBuffer predeterminado de Node', () => {
  assert.equal(__test.PROCESS_OUTPUT_MAX_BYTES, 32 * 1024 * 1024);
  assert.ok(__test.PROCESS_OUTPUT_MAX_BYTES > 1024 * 1024);
});

test('package.json expone las cuatro entradas estables de drift', () => {
  const root = path.resolve(path.dirname(fileURLToPath(import.meta.url)), '../..');
  const packageJson = JSON.parse(fs.readFileSync(path.join(root, 'package.json'), 'utf8'));
  assert.equal(validatePackageScripts(packageJson), true);
});
