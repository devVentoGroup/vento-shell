import assert from 'node:assert/strict';
import test from 'node:test';

import {
  INSPECTION_SQL,
  MUTATION_SQL,
  assessPreReplayState,
  assertManagementOperation,
  assertTargetBinding,
  extractSqlScalar,
  parseArgs,
  runHostedReplayPrecondition,
  stableStringify,
  verifyPostconditions,
} from './hosted-replay-precondition.mjs';

const STAGING_REF = 'rcrxixmqhrndcervbllp';
const PRODUCTION_REF = 'clzdpinthhtknkmefsxx';
const OWNER = 'SUPA-TRANS-015';
const ACK = 'DELIV-PKG-015::CORR-006';

const bindings = Object.freeze({
  staging: Object.freeze({ classification: 'STAGING', project_ref: STAGING_REF, owner: OWNER }),
  production: Object.freeze({ classification: 'PRODUCTION', project_ref: PRODUCTION_REF, owner: OWNER }),
});

function snapshot({ postgresAnon = true, anonDml = 0, managed = true } = {}) {
  return {
    database_name: 'postgres',
    current_user: 'postgres',
    server_version_num: '170006',
    postgres_public_anon_defaults: postgresAnon
      ? [
          { object_type: 'S', privilege_type: 'SELECT', is_grantable: false },
          { object_type: 'S', privilege_type: 'UPDATE', is_grantable: false },
          { object_type: 'S', privilege_type: 'USAGE', is_grantable: false },
          { object_type: 'f', privilege_type: 'EXECUTE', is_grantable: false },
          { object_type: 'r', privilege_type: 'DELETE', is_grantable: false },
          { object_type: 'r', privilege_type: 'INSERT', is_grantable: false },
          { object_type: 'r', privilege_type: 'SELECT', is_grantable: false },
          { object_type: 'r', privilege_type: 'UPDATE', is_grantable: false },
        ]
      : [],
    supabase_admin_public_anon_defaults: managed
      ? [
          { object_type: 'S', privilege_type: 'SELECT', is_grantable: false },
          { object_type: 'f', privilege_type: 'EXECUTE', is_grantable: false },
          { object_type: 'r', privilege_type: 'SELECT', is_grantable: false },
        ]
      : [],
    postgres_public_non_anon_defaults: [
      { object_type: 'r', grantee: 'authenticated', privilege_type: 'SELECT', is_grantable: false },
    ],
    public_relations_with_anon_dml: anonDml,
    public_relation_acl_md5: 'relations-md5',
    public_function_acl_md5: 'functions-md5',
    public_schema_acl_md5: 'schema-md5',
  };
}

function response(payload, status = 200) {
  return {
    ok: status >= 200 && status < 300,
    status,
    async json() {
      return payload;
    },
  };
}

function sqlPayload(value) {
  return [{ snapshot: JSON.stringify(value) }];
}

function makeFetch({ before, after = before, migrationsBefore = [], migrationsAfter = migrationsBefore, projectStatus = 404 } = {}) {
  const calls = [];
  let snapshotReads = 0;
  let migrationReads = 0;
  const fetchImpl = async (url, options = {}) => {
    const parsed = new URL(url);
    const method = String(options.method ?? 'GET').toUpperCase();
    const body = options.body ? JSON.parse(options.body) : null;
    calls.push({ pathname: parsed.pathname, method, body, authorization: options.headers?.Authorization ?? null });

    if (parsed.pathname === `/v1/projects/${STAGING_REF}` && method === 'GET') {
      return projectStatus === 200
        ? response({ ref: STAGING_REF, name: 'staging-project' })
        : response({ message: 'not project' }, projectStatus);
    }
    if (parsed.pathname === `/v1/branches/${STAGING_REF}` && method === 'GET') {
      return response({ ref: STAGING_REF, name: 'staging-branch' });
    }
    if (parsed.pathname === `/v1/projects/${STAGING_REF}/database/migrations` && method === 'GET') {
      const payload = migrationReads === 0 ? migrationsBefore : migrationsAfter;
      migrationReads += 1;
      return response(payload);
    }
    if (parsed.pathname === `/v1/projects/${STAGING_REF}/database/query/read-only` && method === 'POST') {
      assert.equal(body?.query, INSPECTION_SQL);
      const payload = snapshotReads === 0 ? before : after;
      snapshotReads += 1;
      return response(sqlPayload(payload), 201);
    }
    if (parsed.pathname === `/v1/projects/${STAGING_REF}/database/query` && method === 'POST') {
      assert.equal(body?.query, MUTATION_SQL);
      return response([], 201);
    }
    throw new Error(`UNEXPECTED_REQUEST:${method}:${parsed.pathname}`);
  };
  return { fetchImpl, calls };
}

test('parseArgs requires staging and explicit mutation acknowledgement', () => {
  assert.deepEqual(parseArgs([
    'inspect', '--environment-role', 'staging', '--project-ref', STAGING_REF, '--owner', OWNER,
  ]), {
    mode: 'inspect', environmentRole: 'STAGING', projectRef: STAGING_REF, owner: OWNER, acknowledgement: null,
  });

  assert.deepEqual(parseArgs([
    'apply', '--environment-role', 'staging', '--project-ref', STAGING_REF, '--owner', OWNER,
    '--acknowledge-mutation', ACK,
  ]).mode, 'apply');

  assert.throws(() => parseArgs([
    'apply', '--environment-role', 'staging', '--project-ref', STAGING_REF, '--owner', OWNER,
  ]), /MUTATION_ACKNOWLEDGEMENT_REQUIRED/u);
  assert.throws(() => parseArgs([
    'inspect', '--environment-role', 'production', '--project-ref', PRODUCTION_REF, '--owner', OWNER,
  ]), /ONLY_STAGING_IS_ALLOWED/u);
});

test('target binding rejects production and any noncanonical staging identity', () => {
  assert.equal(assertTargetBinding({ projectRef: STAGING_REF, owner: OWNER, bindings }), true);
  assert.throws(() => assertTargetBinding({ projectRef: PRODUCTION_REF, owner: OWNER, bindings }), /PRODUCTION_TARGET_FORBIDDEN/u);
  assert.throws(() => assertTargetBinding({ projectRef: 'wrong-staging', owner: OWNER, bindings }), /STAGING_PROJECT_REF_MISMATCH/u);
  assert.throws(() => assertTargetBinding({ projectRef: STAGING_REF, owner: 'OTHER', bindings }), /STAGING_OWNER_MISMATCH/u);
});

test('management allowlist is read-only in inspect and admits only database query in apply', () => {
  assert.equal(assertManagementOperation({ mode: 'inspect', method: 'POST', pathname: `/v1/projects/${STAGING_REF}/database/query/read-only` }), true);
  assert.equal(assertManagementOperation({ mode: 'apply', method: 'POST', pathname: `/v1/projects/${STAGING_REF}/database/query` }), true);
  assert.throws(() => assertManagementOperation({ mode: 'inspect', method: 'POST', pathname: `/v1/projects/${STAGING_REF}/database/query` }), /MANAGEMENT_OPERATION_FORBIDDEN/u);
  assert.throws(() => assertManagementOperation({ mode: 'apply', method: 'POST', pathname: `/v1/projects/${PRODUCTION_REF}/database/reset` }), /MANAGEMENT_OPERATION_FORBIDDEN/u);
});

test('mutation SQL changes only postgres public defaults for anon', () => {
  const normalized = MUTATION_SQL.toLowerCase();
  assert.match(normalized, /alter default privileges for role postgres in schema public\s+revoke all on tables from anon;/u);
  assert.match(normalized, /alter default privileges for role postgres in schema public\s+revoke all on functions from anon;/u);
  assert.match(normalized, /alter default privileges for role postgres in schema public\s+revoke all on sequences from anon;/u);
  assert.doesNotMatch(normalized, /alter default privileges for role supabase_admin/u);
  assert.doesNotMatch(normalized, /from authenticated/u);
  assert.doesNotMatch(normalized, /from service_role/u);
  assert.doesNotMatch(normalized, /revoke .* from public;/u);
  assert.doesNotMatch(normalized, /supabase_migrations\s*\.\s*schema_migrations/u);
  assert.doesNotMatch(normalized, /\b(?:insert|update|delete|truncate)\s+(?:into|from|table)\s+public\./u);
});

test('SQL scalar extraction accepts Management API response shapes', () => {
  assert.deepEqual(extractSqlScalar([{ snapshot: '{"a":1}' }]), { a: 1 });
  assert.deepEqual(extractSqlScalar({ result: [{ snapshot: '[]' }] }), []);
});

test('assessment blocks current contaminated staging state', () => {
  const assessment = assessPreReplayState({ snapshot: snapshot({ anonDml: 246 }), migrations: [{ version: '00000000000000', name: 'baseline' }] });
  assert.equal(assessment.public_relations_with_anon_dml, 246);
  assert.equal(assessment.migration_history_count, 1);
  assert.equal(assessment.apply_allowed, false);
  assert.equal(assessment.ready_for_replay, false);
});

test('inspect never sends a mutating database query', async () => {
  const before = snapshot({ anonDml: 246 });
  const { fetchImpl, calls } = makeFetch({
    before,
    migrationsBefore: [{ version: '00000000000000', name: 'baseline' }],
  });
  const result = await runHostedReplayPrecondition({
    mode: 'inspect', projectRef: STAGING_REF, environmentRole: 'STAGING', owner: OWNER,
    token: 'test-token', bindings, fetchImpl,
  });
  assert.equal(result.ready_for_replay, false);
  assert.equal(result.mutation_executed, false);
  assert.equal(calls.some((entry) => entry.pathname.endsWith('/database/query')), false);
});

test('apply fails before mutation if replay already started or history is nonempty', async () => {
  const { fetchImpl, calls } = makeFetch({
    before: snapshot({ anonDml: 246 }),
    migrationsBefore: [{ version: '00000000000000', name: 'baseline' }],
  });
  await assert.rejects(() => runHostedReplayPrecondition({
    mode: 'apply', projectRef: STAGING_REF, environmentRole: 'STAGING', owner: OWNER,
    token: 'test-token', bindings, fetchImpl,
  }), /PRE_REPLAY_STATE_NOT_CLEAN/u);
  assert.equal(calls.some((entry) => entry.pathname.endsWith('/database/query')), false);
});

test('apply is idempotent when clean staging already has restrictive defaults', async () => {
  const clean = snapshot({ postgresAnon: false, anonDml: 0 });
  const { fetchImpl, calls } = makeFetch({ before: clean, after: clean });
  const result = await runHostedReplayPrecondition({
    mode: 'apply', projectRef: STAGING_REF, environmentRole: 'STAGING', owner: OWNER,
    token: 'test-token', bindings, fetchImpl,
  });
  assert.equal(result.mutation_executed, false);
  assert.equal(result.ready_for_replay, true);
  assert.equal(calls.some((entry) => entry.pathname.endsWith('/database/query')), false);
});

test('apply mutates once then proves protected state and history stayed identical', async () => {
  const before = snapshot({ postgresAnon: true, anonDml: 0 });
  const after = snapshot({ postgresAnon: false, anonDml: 0 });
  const { fetchImpl, calls } = makeFetch({ before, after, migrationsBefore: [], migrationsAfter: [] });
  const result = await runHostedReplayPrecondition({
    mode: 'apply', projectRef: STAGING_REF, environmentRole: 'STAGING', owner: OWNER,
    token: 'test-token', bindings, fetchImpl,
  });
  assert.equal(result.mutation_executed, true);
  assert.equal(result.ready_for_replay, true);
  assert.equal(calls.filter((entry) => entry.pathname.endsWith('/database/query')).length, 1);
  assert.ok(calls.every((entry) => entry.authorization === 'Bearer test-token'));
});

test('postconditions fail closed if managed defaults, object ACLs or history change', () => {
  const before = snapshot({ postgresAnon: true, anonDml: 0 });
  const clean = snapshot({ postgresAnon: false, anonDml: 0 });

  const managedChanged = { ...clean, supabase_admin_public_anon_defaults: [] };
  assert.throws(() => verifyPostconditions({
    beforeSnapshot: before,
    afterSnapshot: managedChanged,
    beforeMigrations: [],
    afterMigrations: [],
  }), /PROTECTED_HOSTED_STATE_CHANGED/u);

  const aclChanged = { ...clean, public_relation_acl_md5: 'changed' };
  assert.throws(() => verifyPostconditions({
    beforeSnapshot: before,
    afterSnapshot: aclChanged,
    beforeMigrations: [],
    afterMigrations: [],
  }), /PROTECTED_HOSTED_STATE_CHANGED/u);

  assert.throws(() => verifyPostconditions({
    beforeSnapshot: before,
    afterSnapshot: clean,
    beforeMigrations: [],
    afterMigrations: [{ version: '1', name: 'unexpected' }],
  }), /MIGRATION_HISTORY_CHANGED/u);
});

test('stable comparison is independent of object key insertion order', () => {
  assert.equal(stableStringify({ b: 2, a: 1 }), stableStringify({ a: 1, b: 2 }));
});