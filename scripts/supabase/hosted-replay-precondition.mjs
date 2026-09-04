import fs from 'node:fs';
import path from 'node:path';
import { fileURLToPath } from 'node:url';

const MANAGEMENT_BASE_URL = 'https://api.supabase.com';
const CONTRACT_RELATIVE_PATH = 'scripts/docs/package-readiness/package-readiness-contract.json';
const CORRECTION_ID = 'DELIV-PKG-015::CORR-006';
const RESULT_START = '=== RESULTADO PARA CHATGPT ===';
const RESULT_END = '=== FIN RESULTADO PARA CHATGPT ===';

export const INSPECTION_SQL = String.raw`
select pg_catalog.jsonb_build_object(
  'database_name', pg_catalog.current_database(),
  'current_user', current_user,
  'server_version_num', pg_catalog.current_setting('server_version_num'),
  'postgres_public_anon_defaults', coalesce((
    select pg_catalog.jsonb_agg(
      pg_catalog.jsonb_build_object(
        'object_type', d.defaclobjtype,
        'privilege_type', a.privilege_type,
        'is_grantable', a.is_grantable
      )
      order by d.defaclobjtype, a.privilege_type, a.is_grantable
    )
    from pg_catalog.pg_default_acl d
    join pg_catalog.pg_namespace n on n.oid = d.defaclnamespace
    cross join lateral pg_catalog.aclexplode(d.defaclacl) a
    where d.defaclrole = 'postgres'::pg_catalog.regrole::pg_catalog.oid
      and n.nspname = 'public'
      and d.defaclobjtype in ('r', 'f', 'S')
      and a.grantee = 'anon'::pg_catalog.regrole::pg_catalog.oid
  ), '[]'::pg_catalog.jsonb),
  'supabase_admin_public_anon_defaults', coalesce((
    select pg_catalog.jsonb_agg(
      pg_catalog.jsonb_build_object(
        'object_type', d.defaclobjtype,
        'privilege_type', a.privilege_type,
        'is_grantable', a.is_grantable
      )
      order by d.defaclobjtype, a.privilege_type, a.is_grantable
    )
    from pg_catalog.pg_default_acl d
    join pg_catalog.pg_namespace n on n.oid = d.defaclnamespace
    cross join lateral pg_catalog.aclexplode(d.defaclacl) a
    where d.defaclrole = 'supabase_admin'::pg_catalog.regrole::pg_catalog.oid
      and n.nspname = 'public'
      and d.defaclobjtype in ('r', 'f', 'S')
      and a.grantee = 'anon'::pg_catalog.regrole::pg_catalog.oid
  ), '[]'::pg_catalog.jsonb),
  'postgres_public_non_anon_defaults', coalesce((
    select pg_catalog.jsonb_agg(
      pg_catalog.jsonb_build_object(
        'object_type', d.defaclobjtype,
        'grantee', case when a.grantee = 0 then 'PUBLIC' else pg_catalog.pg_get_userbyid(a.grantee) end,
        'privilege_type', a.privilege_type,
        'is_grantable', a.is_grantable
      )
      order by d.defaclobjtype,
        case when a.grantee = 0 then 'PUBLIC' else pg_catalog.pg_get_userbyid(a.grantee) end,
        a.privilege_type,
        a.is_grantable
    )
    from pg_catalog.pg_default_acl d
    join pg_catalog.pg_namespace n on n.oid = d.defaclnamespace
    cross join lateral pg_catalog.aclexplode(d.defaclacl) a
    where d.defaclrole = 'postgres'::pg_catalog.regrole::pg_catalog.oid
      and n.nspname = 'public'
      and d.defaclobjtype in ('r', 'f', 'S')
      and a.grantee <> 'anon'::pg_catalog.regrole::pg_catalog.oid
  ), '[]'::pg_catalog.jsonb),
  'public_relations_with_anon_dml', (
    select pg_catalog.count(*)
    from pg_catalog.pg_class c
    join pg_catalog.pg_namespace n on n.oid = c.relnamespace
    where n.nspname = 'public'
      and c.relkind in ('r', 'p', 'v', 'm', 'f')
      and (
        pg_catalog.has_table_privilege('anon', c.oid, 'INSERT')
        or pg_catalog.has_table_privilege('anon', c.oid, 'UPDATE')
        or pg_catalog.has_table_privilege('anon', c.oid, 'DELETE')
      )
  ),
  'public_relation_acl_md5', (
    select pg_catalog.md5(coalesce(pg_catalog.string_agg(
      pg_catalog.format('%s|%s|%s|%s|%s', n.nspname, c.relname, c.relkind, c.relowner, coalesce(c.relacl::pg_catalog.text, '')),
      E'\n' order by n.nspname, c.relname, c.relkind, c.relowner
    ), ''))
    from pg_catalog.pg_class c
    join pg_catalog.pg_namespace n on n.oid = c.relnamespace
    where n.nspname = 'public'
      and c.relkind in ('r', 'p', 'v', 'm', 'f', 'S')
  ),
  'public_function_acl_md5', (
    select pg_catalog.md5(coalesce(pg_catalog.string_agg(
      pg_catalog.format('%s|%s|%s|%s', n.nspname, p.proname, pg_catalog.pg_get_function_identity_arguments(p.oid), coalesce(p.proacl::pg_catalog.text, '')),
      E'\n' order by n.nspname, p.proname, pg_catalog.pg_get_function_identity_arguments(p.oid)
    ), ''))
    from pg_catalog.pg_proc p
    join pg_catalog.pg_namespace n on n.oid = p.pronamespace
    where n.nspname = 'public'
      and p.prokind in ('f', 'p')
  ),
  'public_schema_acl_md5', (
    select pg_catalog.md5(pg_catalog.format('%s|%s', n.nspowner, coalesce(n.nspacl::pg_catalog.text, '')))
    from pg_catalog.pg_namespace n
    where n.nspname = 'public'
  )
)::pg_catalog.text as snapshot;
`;

export const MUTATION_SQL = String.raw`
begin;

do $vento_corr_006$
begin
  if current_user <> 'postgres' then
    raise exception 'VENTO_CORR_006_CURRENT_USER_NOT_POSTGRES';
  end if;

  if exists (
    select 1
    from pg_catalog.pg_class c
    join pg_catalog.pg_namespace n on n.oid = c.relnamespace
    where n.nspname = 'public'
      and c.relkind in ('r', 'p', 'v', 'm', 'f')
      and (
        pg_catalog.has_table_privilege('anon', c.oid, 'INSERT')
        or pg_catalog.has_table_privilege('anon', c.oid, 'UPDATE')
        or pg_catalog.has_table_privilege('anon', c.oid, 'DELETE')
      )
  ) then
    raise exception 'VENTO_CORR_006_REPLAY_ALREADY_STARTED';
  end if;
end
$vento_corr_006$;

alter default privileges for role postgres in schema public
  revoke all on tables from anon;

alter default privileges for role postgres in schema public
  revoke all on functions from anon;

alter default privileges for role postgres in schema public
  revoke all on sequences from anon;

do $vento_corr_006_post$
begin
  if exists (
    select 1
    from pg_catalog.pg_default_acl d
    join pg_catalog.pg_namespace n on n.oid = d.defaclnamespace
    cross join lateral pg_catalog.aclexplode(d.defaclacl) a
    where d.defaclrole = 'postgres'::pg_catalog.regrole::pg_catalog.oid
      and n.nspname = 'public'
      and d.defaclobjtype in ('r', 'f', 'S')
      and a.grantee = 'anon'::pg_catalog.regrole::pg_catalog.oid
  ) then
    raise exception 'VENTO_CORR_006_POSTGRES_ANON_DEFAULTS_REMAIN';
  end if;
end
$vento_corr_006_post$;

commit;
`;

function fail(code, detail = '') {
  const error = new Error(detail ? `${code}:${detail}` : code);
  error.code = code;
  throw error;
}

function repoRootFromModule() {
  return path.resolve(path.dirname(fileURLToPath(import.meta.url)), '../..');
}

function safeAscii(value) {
  return String(value ?? '')
    .replace(/postgres(?:ql)?:\/\/[^\s]+/giu, '[REDACTED_DB_URL]')
    .replace(/\b(?:eyJ|sb_[A-Za-z0-9_])[A-Za-z0-9._-]{20,}\b/gu, '[REDACTED_TOKEN]')
    .replace(/[^\x20-\x7E\r\n]/gu, '?');
}

function stableValue(value) {
  if (Array.isArray(value)) return value.map((entry) => stableValue(entry));
  if (value && typeof value === 'object') {
    return Object.fromEntries(
      Object.keys(value).sort((left, right) => left.localeCompare(right, 'en'))
        .map((key) => [key, stableValue(value[key])]),
    );
  }
  return value;
}

export function stableStringify(value) {
  return JSON.stringify(stableValue(value));
}

function normalizeSqlValue(value) {
  if (typeof value !== 'string') return value;
  const trimmed = value.trim();
  if (!((trimmed.startsWith('{') && trimmed.endsWith('}')) || (trimmed.startsWith('[') && trimmed.endsWith(']')))) {
    return value;
  }
  try {
    return JSON.parse(trimmed);
  } catch {
    return value;
  }
}

export function extractSqlScalar(payload) {
  let rows = payload;
  if (payload && typeof payload === 'object' && !Array.isArray(payload)) {
    if (Array.isArray(payload.result)) rows = payload.result;
    else if (Array.isArray(payload.data)) rows = payload.data;
  }
  if (!Array.isArray(rows) || rows.length === 0) fail('SQL_RESULT_EMPTY');
  const first = rows[0];
  if (first && typeof first === 'object' && !Array.isArray(first)) {
    const values = Object.values(first);
    if (values.length !== 1) fail('SQL_RESULT_SCALAR_EXPECTED');
    return normalizeSqlValue(values[0]);
  }
  return normalizeSqlValue(first);
}

function normalizeMode(value) {
  const mode = String(value ?? '').trim().toLowerCase();
  if (!['inspect', 'apply'].includes(mode)) fail('MODE_MUST_BE_INSPECT_OR_APPLY');
  return mode;
}

export function parseArgs(argv = []) {
  const tokens = [...argv];
  const mode = normalizeMode(tokens.shift());
  const args = {
    mode,
    environmentRole: null,
    projectRef: null,
    owner: null,
    acknowledgement: null,
  };
  for (let index = 0; index < tokens.length; index += 1) {
    const token = tokens[index];
    const value = tokens[index + 1];
    if (token === '--environment-role') args.environmentRole = value;
    else if (token === '--project-ref') args.projectRef = value;
    else if (token === '--owner') args.owner = value;
    else if (token === '--acknowledge-mutation') args.acknowledgement = value;
    else fail('UNKNOWN_ARGUMENT', token);
    if (!value || value.startsWith('--')) fail('ARGUMENT_VALUE_MISSING', token);
    index += 1;
  }
  if (String(args.environmentRole ?? '').trim().toLowerCase() !== 'staging') {
    fail('ONLY_STAGING_IS_ALLOWED');
  }
  if (!/^[A-Za-z0-9_-]+$/u.test(String(args.projectRef ?? '').trim())) fail('PROJECT_REF_INVALID');
  if (!String(args.owner ?? '').trim()) fail('OWNER_REQUIRED');
  if (mode === 'apply' && args.acknowledgement !== CORRECTION_ID) {
    fail('MUTATION_ACKNOWLEDGEMENT_REQUIRED', CORRECTION_ID);
  }
  return {
    ...args,
    environmentRole: 'STAGING',
    projectRef: String(args.projectRef).trim(),
    owner: String(args.owner).trim(),
  };
}

export function readEnvironmentBindings({ root = repoRootFromModule() } = {}) {
  const contractPath = path.join(root, ...CONTRACT_RELATIVE_PATH.split('/'));
  if (!fs.existsSync(contractPath)) fail('PACKAGE_READINESS_CONTRACT_MISSING');
  const contract = JSON.parse(fs.readFileSync(contractPath, 'utf8'));
  const remote = contract?.physical_dependencies?.supabase_pre_e5_foundation?.remote_environment_identity;
  const staging = remote?.bindings?.STAGING;
  const production = remote?.bindings?.PRODUCTION;
  if (!staging || !production) fail('REMOTE_ENVIRONMENT_BINDINGS_MISSING');
  return { staging, production };
}

export function assertTargetBinding({ projectRef, owner, environmentRole = 'STAGING', bindings } = {}) {
  if (String(environmentRole).toUpperCase() !== 'STAGING') fail('ONLY_STAGING_IS_ALLOWED');
  const staging = bindings?.staging;
  const production = bindings?.production;
  if (!staging || !production) fail('REMOTE_ENVIRONMENT_BINDINGS_MISSING');
  if (String(projectRef) === String(production.project_ref)) fail('PRODUCTION_TARGET_FORBIDDEN');
  if (String(projectRef) !== String(staging.project_ref)) fail('STAGING_PROJECT_REF_MISMATCH');
  if (String(owner) !== String(staging.owner)) fail('STAGING_OWNER_MISMATCH');
  if (String(staging.classification).toUpperCase() !== 'STAGING') fail('STAGING_CLASSIFICATION_INVALID');
  if (String(production.classification).toUpperCase() !== 'PRODUCTION') fail('PRODUCTION_CLASSIFICATION_INVALID');
  return true;
}

function managementPath(projectRef, suffix) {
  return `/v1/projects/${projectRef}${suffix}`;
}

export function assertManagementOperation({ mode, method, pathname } = {}) {
  const normalizedMode = normalizeMode(mode);
  const normalizedMethod = String(method ?? '').toUpperCase();
  const normalizedPath = String(pathname ?? '');
  const identityProject = /^\/v1\/projects\/[A-Za-z0-9_-]+$/u;
  const identityBranch = /^\/v1\/branches\/[A-Za-z0-9_-]+$/u;
  const migrations = /^\/v1\/projects\/[A-Za-z0-9_-]+\/database\/migrations$/u;
  const readOnlyQuery = /^\/v1\/projects\/[A-Za-z0-9_-]+\/database\/query\/read-only$/u;
  const writeQuery = /^\/v1\/projects\/[A-Za-z0-9_-]+\/database\/query$/u;
  if (normalizedMethod === 'GET' && (identityProject.test(normalizedPath) || identityBranch.test(normalizedPath) || migrations.test(normalizedPath))) {
    return true;
  }
  if (normalizedMethod === 'POST' && readOnlyQuery.test(normalizedPath)) return true;
  if (normalizedMode === 'apply' && normalizedMethod === 'POST' && writeQuery.test(normalizedPath)) return true;
  fail('MANAGEMENT_OPERATION_FORBIDDEN', `${normalizedMode}:${normalizedMethod}:${normalizedPath}`);
}

async function managementRequest({ mode, token, pathname, method = 'GET', body = null, fetchImpl = fetch } = {}) {
  assertManagementOperation({ mode, method, pathname });
  if (!token) fail('SUPABASE_ACCESS_TOKEN_MISSING');
  const response = await fetchImpl(`${MANAGEMENT_BASE_URL}${pathname}`, {
    method,
    headers: {
      Authorization: `Bearer ${token}`,
      Accept: 'application/json',
      ...(body === null ? {} : { 'Content-Type': 'application/json' }),
    },
    body: body === null ? undefined : JSON.stringify(body),
  });
  if (!response.ok) fail('MANAGEMENT_API_HTTP', `${response.status}:${pathname}`);
  return response.json();
}

async function resolveHostedIdentity({ mode, projectRef, token, fetchImpl }) {
  try {
    const project = await managementRequest({ mode, token, pathname: `/v1/projects/${projectRef}`, fetchImpl });
    return { kind: 'project', ref: String(project?.ref ?? project?.id ?? '') };
  } catch (projectError) {
    try {
      const branch = await managementRequest({ mode, token, pathname: `/v1/branches/${projectRef}`, fetchImpl });
      return { kind: 'branch', ref: String(branch?.ref ?? '') };
    } catch (branchError) {
      fail(
        'HOSTED_IDENTITY_UNRESOLVED',
        `project=${safeAscii(projectError?.message ?? projectError)};branch=${safeAscii(branchError?.message ?? branchError)}`,
      );
    }
  }
}

async function readMigrationHistory({ mode, projectRef, token, fetchImpl }) {
  const payload = await managementRequest({
    mode,
    token,
    pathname: managementPath(projectRef, '/database/migrations'),
    fetchImpl,
  });
  if (!Array.isArray(payload)) fail('MIGRATION_HISTORY_INVALID');
  return payload.map((entry) => ({
    version: String(entry?.version ?? ''),
    name: String(entry?.name ?? ''),
  })).sort((left, right) => left.version.localeCompare(right.version, 'en') || left.name.localeCompare(right.name, 'en'));
}

async function readSnapshot({ mode, projectRef, token, fetchImpl }) {
  const payload = await managementRequest({
    mode,
    token,
    pathname: managementPath(projectRef, '/database/query/read-only'),
    method: 'POST',
    body: { query: INSPECTION_SQL, parameters: [] },
    fetchImpl,
  });
  const snapshot = extractSqlScalar(payload);
  if (!snapshot || typeof snapshot !== 'object' || Array.isArray(snapshot)) fail('INSPECTION_SNAPSHOT_INVALID');
  return snapshot;
}

function managedDefaultObjectTypes(snapshot) {
  return [...new Set((snapshot?.supabase_admin_public_anon_defaults ?? []).map((entry) => String(entry?.object_type ?? '')))]
    .sort((left, right) => left.localeCompare(right, 'en'));
}

export function assessPreReplayState({ snapshot, migrations } = {}) {
  const postgresDefaults = Array.isArray(snapshot?.postgres_public_anon_defaults)
    ? snapshot.postgres_public_anon_defaults
    : [];
  const anonDml = Number(snapshot?.public_relations_with_anon_dml ?? Number.NaN);
  const migrationCount = Array.isArray(migrations) ? migrations.length : Number.NaN;
  const currentUser = String(snapshot?.current_user ?? '');
  const managedTypes = managedDefaultObjectTypes(snapshot);
  const managedDefaultsCompatible = managedTypes.length === 3
    && managedTypes.includes('S')
    && managedTypes.includes('f')
    && managedTypes.includes('r');
  const applyAllowed = currentUser === 'postgres'
    && Number.isFinite(anonDml)
    && anonDml === 0
    && Number.isFinite(migrationCount)
    && migrationCount === 0
    && managedDefaultsCompatible;
  const readyForReplay = applyAllowed && postgresDefaults.length === 0;
  return {
    current_user: currentUser,
    postgres_public_anon_default_grants: postgresDefaults.length,
    public_relations_with_anon_dml: anonDml,
    migration_history_count: migrationCount,
    managed_defaults_compatible: managedDefaultsCompatible,
    apply_allowed: applyAllowed,
    ready_for_replay: readyForReplay,
  };
}

function protectedState(snapshot) {
  return {
    supabase_admin_public_anon_defaults: snapshot?.supabase_admin_public_anon_defaults ?? null,
    postgres_public_non_anon_defaults: snapshot?.postgres_public_non_anon_defaults ?? null,
    public_relation_acl_md5: snapshot?.public_relation_acl_md5 ?? null,
    public_function_acl_md5: snapshot?.public_function_acl_md5 ?? null,
    public_schema_acl_md5: snapshot?.public_schema_acl_md5 ?? null,
    public_relations_with_anon_dml: snapshot?.public_relations_with_anon_dml ?? null,
  };
}

export function verifyPostconditions({ beforeSnapshot, afterSnapshot, beforeMigrations, afterMigrations } = {}) {
  if (stableStringify(protectedState(beforeSnapshot)) !== stableStringify(protectedState(afterSnapshot))) {
    fail('PROTECTED_HOSTED_STATE_CHANGED');
  }
  if (stableStringify(beforeMigrations) !== stableStringify(afterMigrations)) fail('MIGRATION_HISTORY_CHANGED');
  const afterAssessment = assessPreReplayState({ snapshot: afterSnapshot, migrations: afterMigrations });
  if (!afterAssessment.ready_for_replay) fail('POSTCONDITION_NOT_READY_FOR_REPLAY');
  return afterAssessment;
}

async function executeMutation({ projectRef, token, fetchImpl }) {
  await managementRequest({
    mode: 'apply',
    token,
    pathname: managementPath(projectRef, '/database/query'),
    method: 'POST',
    body: { query: MUTATION_SQL, parameters: [] },
    fetchImpl,
  });
}

export async function runHostedReplayPrecondition({
  mode,
  projectRef,
  environmentRole = 'STAGING',
  owner,
  token,
  bindings,
  fetchImpl = fetch,
} = {}) {
  const normalizedMode = normalizeMode(mode);
  assertTargetBinding({ projectRef, owner, environmentRole, bindings });
  if (!token) fail('SUPABASE_ACCESS_TOKEN_MISSING');

  const identity = await resolveHostedIdentity({ mode: normalizedMode, projectRef, token, fetchImpl });
  if (identity.ref !== projectRef) fail('HOSTED_IDENTITY_REF_MISMATCH');

  const beforeMigrations = await readMigrationHistory({ mode: normalizedMode, projectRef, token, fetchImpl });
  const beforeSnapshot = await readSnapshot({ mode: normalizedMode, projectRef, token, fetchImpl });
  const beforeAssessment = assessPreReplayState({ snapshot: beforeSnapshot, migrations: beforeMigrations });

  if (normalizedMode === 'inspect') {
    return {
      mode: normalizedMode,
      identity_kind: identity.kind,
      project_ref: projectRef,
      environment_role: 'STAGING',
      owner,
      mutation_executed: false,
      ...beforeAssessment,
    };
  }

  if (!beforeAssessment.apply_allowed) fail('PRE_REPLAY_STATE_NOT_CLEAN');

  let mutationExecuted = false;
  if (beforeAssessment.postgres_public_anon_default_grants > 0) {
    await executeMutation({ projectRef, token, fetchImpl });
    mutationExecuted = true;
  }

  const afterMigrations = await readMigrationHistory({ mode: normalizedMode, projectRef, token, fetchImpl });
  const afterSnapshot = await readSnapshot({ mode: normalizedMode, projectRef, token, fetchImpl });
  const afterAssessment = verifyPostconditions({
    beforeSnapshot,
    afterSnapshot,
    beforeMigrations,
    afterMigrations,
  });

  return {
    mode: normalizedMode,
    identity_kind: identity.kind,
    project_ref: projectRef,
    environment_role: 'STAGING',
    owner,
    mutation_executed: mutationExecuted,
    ...afterAssessment,
  };
}

function yesNo(value) {
  return value ? 'SI' : 'NO';
}

function printResult(result) {
  console.log(RESULT_START);
  console.log('ESTADO: PASS');
  console.log(`OPERACION: HOSTED_REPLAY_PRECONDITION_${String(result.mode).toUpperCase()}`);
  console.log(`ENVIRONMENT_ROLE: ${result.environment_role}`);
  console.log(`PROJECT_REF: ${result.project_ref}`);
  console.log(`OWNER: ${safeAscii(result.owner)}`);
  console.log(`IDENTITY_KIND: ${String(result.identity_kind).toUpperCase()}`);
  console.log(`MUTATION_EXECUTED: ${yesNo(result.mutation_executed)}`);
  console.log(`POSTGRES_PUBLIC_ANON_DEFAULT_GRANTS: ${result.postgres_public_anon_default_grants}`);
  console.log(`PUBLIC_RELATIONS_WITH_ANON_DML: ${result.public_relations_with_anon_dml}`);
  console.log(`MIGRATION_HISTORY_COUNT: ${result.migration_history_count}`);
  console.log(`MANAGED_DEFAULTS_COMPATIBLE: ${yesNo(result.managed_defaults_compatible)}`);
  console.log(`APPLY_ALLOWED: ${yesNo(result.apply_allowed)}`);
  console.log(`READY_FOR_REPLAY: ${yesNo(result.ready_for_replay)}`);
  console.log('SECRET_VALUES_IN_OUTPUT: NO');
  console.log(RESULT_END);
}

function printFailure(mode, error) {
  console.log(RESULT_START);
  console.log('ESTADO: FAIL');
  console.log(`OPERACION: HOSTED_REPLAY_PRECONDITION_${String(mode ?? 'UNKNOWN').toUpperCase()}`);
  console.log(`ERROR: ${safeAscii(error?.message ?? error).replace(/\s+/gu, ' ').trim()}`);
  console.log('PRODUCTION_MUTATION: NO');
  console.log('SECRET_VALUES_IN_OUTPUT: NO');
  console.log(RESULT_END);
  process.exitCode = 1;
}

async function main() {
  let args;
  try {
    args = parseArgs(process.argv.slice(2));
    const bindings = readEnvironmentBindings();
    const result = await runHostedReplayPrecondition({
      ...args,
      bindings,
      token: process.env.SUPABASE_ACCESS_TOKEN,
    });
    printResult(result);
  } catch (error) {
    printFailure(args?.mode ?? process.argv[2], error);
  }
}

const isCli = process.argv[1]
  && path.resolve(process.argv[1]) === path.resolve(fileURLToPath(import.meta.url));

if (isCli) await main();

export const __test = Object.freeze({
  CORRECTION_ID,
  CONTRACT_RELATIVE_PATH,
});