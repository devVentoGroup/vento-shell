import fs from 'node:fs';
import path from 'node:path';
import crypto from 'node:crypto';
import { fileURLToPath } from 'node:url';
import { checkManifest } from './migration-manifest.mjs';
import { assertTargetBinding, readEnvironmentBindings, stableStringify } from './hosted-replay-precondition.mjs';

export const PREFIX_VERSION = '20260827143711';
export const AUTHENTICATED_PREFIX_VERSION = '20260828023253';
export const AUTHENTICATED_EXPECTED_REVOKES = 10;

export const AUTHENTICATED_SERVER_ONLY_TARGETS = Object.freeze([
  { identity: 'public.anonymize_user_personal_data(uuid)', owner: 'postgres', security_definer: true, function_config: ['search_path=public, pass'], function_md5: '13c296433853424b08e4bcdf2c59b472' },
  { identity: 'public.checkout_fail_payment_transaction(uuid,text,text,text,jsonb)', owner: 'postgres', security_definer: true, function_config: ['search_path=public, payments'], function_md5: 'b81c7a6afe01335af76654742a70aca3' },
  { identity: 'public.checkout_find_payment_transaction_by_reference(text,text)', owner: 'postgres', security_definer: true, function_config: ['search_path=public, payments'], function_md5: '74103e83ccb52d0199a8a1b87b68daaf' },
  { identity: 'public.checkout_get_payment_transaction(uuid)', owner: 'postgres', security_definer: true, function_config: ['search_path=public, payments'], function_md5: '5a0417dd2564d955778909bdb909f1fe' },
  { identity: 'public.checkout_get_payment_webhook_event(text,text)', owner: 'postgres', security_definer: true, function_config: ['search_path=public, payments'], function_md5: 'd18d722294dabad34606dedda284a102' },
  { identity: 'public.checkout_mark_payment_transaction_requires_action(uuid,jsonb)', owner: 'postgres', security_definer: true, function_config: ['search_path=public, payments'], function_md5: 'd9b2ad7235bd2279fb34bcf43667aa11' },
  { identity: 'public.checkout_record_payment_webhook_event(text,text,uuid,boolean,boolean,jsonb)', owner: 'postgres', security_definer: true, function_config: ['search_path=public, payments'], function_md5: '1e8cff1933651d7a0b5780eafd86b4df' },
  { identity: 'public.mark_payment_transaction_status(uuid,text,text,jsonb)', owner: 'postgres', security_definer: true, function_config: ['search_path=public, payments'], function_md5: 'd36077fa1742c797a8e8f569b0241c3e' },
  { identity: 'public.sync_restock_request_status_from_items(uuid)', owner: 'postgres', security_definer: true, function_config: ['search_path=public'], function_md5: '4297a3ea56a5f9a2c44ee044c59513e1' },
  { identity: 'public.upsert_app_screen_registry(text,text,text,text,text,text,text,integer,integer,text,text,text,text,text,text,text,boolean,text)', owner: 'postgres', security_definer: true, function_config: ['search_path=public'], function_md5: '92012e4b6395d91ade0d816e37541cd0' },
]);

export const SNAPSHOT_SQL = String.raw`
with objects as (
  select c.oid, 'pg_class'::regclass::oid as catalog, n.nspname as schema, c.relname as name,
    case when c.relkind = 'S' then 'SEQUENCE' else 'TABLE' end as kind,
    format('%I.%I', n.nspname, c.relname) as identity,
    pg_get_userbyid(c.relowner) as owner, c.relacl as acl
  from pg_class c join pg_namespace n on n.oid = c.relnamespace
  where n.nspname = 'public' and c.relkind in ('r','p','v','m','f','S')
  union all
  select p.oid, 'pg_proc'::regclass::oid, n.nspname, p.proname, 'FUNCTION',
    format('%I.%I(%s)', n.nspname, p.proname, pg_get_function_identity_arguments(p.oid)),
    pg_get_userbyid(p.proowner), p.proacl
  from pg_proc p join pg_namespace n on n.oid = p.pronamespace
  where n.nspname = 'public' and p.prokind = 'f'
), object_rows as (
  select kind, schema, name, identity, owner,
    exists(select 1 from pg_depend d where d.classid = o.catalog and d.objid = o.oid and d.deptype = 'e') as extension_member,
    coalesce((select jsonb_agg(jsonb_build_object('grantor', pg_get_userbyid(a.grantor),
      'privilege', a.privilege_type, 'grantable', a.is_grantable) order by a.privilege_type, a.grantor)
      from aclexplode(o.acl) a where a.grantee = 'anon'::regrole), '[]'::jsonb) as anon,
    coalesce((select jsonb_agg(jsonb_build_object('grantor', pg_get_userbyid(a.grantor),
      'privilege', a.privilege_type, 'grantable', a.is_grantable) order by a.privilege_type, a.grantor)
      from aclexplode(o.acl) a where a.grantee = 'authenticated'::regrole), '[]'::jsonb) as authenticated,
    case when kind = 'FUNCTION' then has_function_privilege('authenticated', o.oid, 'EXECUTE') else null end as authenticated_effective,
    case when kind = 'FUNCTION' then has_function_privilege('anon', o.oid, 'EXECUTE') else null end as anon_effective,
    case when kind = 'FUNCTION' then has_function_privilege('service_role', o.oid, 'EXECUTE') else null end as service_role_effective,
    case when kind = 'FUNCTION' then (select p.prosecdef from pg_proc p where p.oid = o.oid) else null end as security_definer,
    case when kind = 'FUNCTION' then (select p.proconfig from pg_proc p where p.oid = o.oid) else null end as function_config,
    case when kind = 'FUNCTION' then (select md5(replace(pg_get_functiondef(p.oid), E'\r\n', E'\n')) from pg_proc p where p.oid = o.oid) else null end as function_md5
  from objects o
), protected_rows as (
  select 'relation' as kind, c.oid::text as id,
    (to_jsonb(c) - array['relacl','reltuples','relpages','relallvisible','relallfrozen','relfrozenxid','relminmxid']) as value
  from pg_class c join pg_namespace n on n.oid = c.relnamespace
  where n.nspname not like 'pg_temp_%' and n.nspname not like 'pg_toast_temp_%'
  union all
  select 'relation_acl', c.oid::text, jsonb_build_object('grantor', a.grantor, 'grantee', a.grantee,
    'privilege', a.privilege_type, 'grantable', a.is_grantable)
  from pg_class c join pg_namespace n on n.oid=c.relnamespace cross join lateral aclexplode(c.relacl) a
  where not (n.nspname='public' and a.grantee='anon'::regrole)
    and n.nspname not like 'pg_temp_%' and n.nspname not like 'pg_toast_temp_%'
  union all select 'column', a.attrelid::text || ':' || a.attnum, to_jsonb(a)
  from pg_attribute a join pg_class c on c.oid=a.attrelid join pg_namespace n on n.oid=c.relnamespace
  where n.nspname not like 'pg_temp_%' and n.nspname not like 'pg_toast_temp_%'
  union all select 'function', p.oid::text, to_jsonb(p) - 'proacl' from pg_proc p
  union all select 'function_acl', p.oid::text, jsonb_build_object('grantor', a.grantor, 'grantee', a.grantee,
    'privilege', a.privilege_type, 'grantable', a.is_grantable)
  from pg_proc p join pg_namespace n on n.oid=p.pronamespace cross join lateral aclexplode(p.proacl) a
  where not (n.nspname='public' and a.grantee='anon'::regrole)
  union all select 'schema', oid::text, to_jsonb(n) from pg_namespace n
  where nspname not like 'pg_temp_%' and nspname not like 'pg_toast_temp_%'
  union all select 'constraint', oid::text, to_jsonb(c) from pg_constraint c
  union all select 'trigger', oid::text, to_jsonb(t) from pg_trigger t
  union all select 'policy', oid::text, to_jsonb(p) from pg_policy p
  union all select 'extension', oid::text, to_jsonb(e) from pg_extension e
  union all select 'default_acl', d.oid::text, jsonb_build_object('role', d.defaclrole,
    'namespace', d.defaclnamespace, 'type', d.defaclobjtype, 'grantor', a.grantor,
    'grantee', a.grantee, 'privilege', a.privilege_type, 'grantable', a.is_grantable)
  from pg_default_acl d cross join lateral aclexplode(d.defaclacl) a
  where not (d.defaclrole='postgres'::regrole and d.defaclnamespace='public'::regnamespace and a.grantee='anon'::regrole)
)
select jsonb_build_object(
  'current_user', current_user,
  'history', (select jsonb_agg(jsonb_build_object('version',version,'name',name) order by version) from supabase_migrations.schema_migrations),
  'objects', (select jsonb_agg(to_jsonb(o) order by kind,identity) from object_rows o),
  'defaults', coalesce((select jsonb_agg(jsonb_build_object('type', d.defaclobjtype,
    'grantor',pg_get_userbyid(a.grantor),'privilege',a.privilege_type,'grantable',a.is_grantable)
    order by d.defaclobjtype,a.privilege_type,a.grantor)
    from pg_default_acl d cross join lateral aclexplode(d.defaclacl) a
    where d.defaclrole='postgres'::regrole and d.defaclnamespace='public'::regnamespace and a.grantee='anon'::regrole), '[]'::jsonb),
  'protected_digest', (select md5(string_agg(kind || ':' || id || ':' || value::text, E'\n' order by kind,id,value::text)) from protected_rows),
  'authenticated_function_protected_digest', (
    select md5(string_agg(pr.kind || ':' || pr.id || ':' || pr.value::text, E'\n' order by pr.kind,pr.id,pr.value::text))
    from protected_rows pr
    where not (
      pr.kind = 'function_acl'
      and (pr.value->>'grantee')::oid = 'authenticated'::regrole
      and exists (
        select 1
        from pg_proc p join pg_namespace n on n.oid = p.pronamespace
        where p.oid = pr.id::oid and n.nspname = 'public'
      )
    )
  ),
  'public_anon_column_grants', (select count(*) from pg_attribute a join pg_class c on c.oid=a.attrelid
    join pg_namespace n on n.oid=c.relnamespace cross join lateral aclexplode(a.attacl) x
    where n.nspname='public' and x.grantee='anon'::regrole)
) as snapshot;
`;

const json = stableStringify;
const hash = (value) => crypto.createHash('sha256').update(json(value)).digest('hex');
const key = (entry) => `${entry.kind}:${entry.identity}`;
const aclKey = (entry) => `${entry.grantor}:${entry.privilege}:${entry.grantable}`;
const literal = (value) => `'${String(value).replaceAll("'", "''")}'`;
const acl = (entry, role) => Array.isArray(entry?.[role]) ? entry[role] : [];
const aclMap = (objects, role, predicate = () => true) => Object.fromEntries(
  objects.filter(predicate).map((entry) => [key(entry), acl(entry, role)]),
);

export function buildPlan({ reference, observed, root = process.cwd(), projectRef, owner }) {
  assertTargetBinding({ projectRef, owner, bindings: readEnvironmentBindings({ root }) });
  const manifest = checkManifest({ root });
  const prefix = manifest.rows.filter((row) => row.version <= PREFIX_VERSION)
    .map((row) => ({ version: row.version, name: path.basename(row.filename).slice(15, -4) }));
  if (prefix.length !== 5 || json(reference.history) !== json(prefix) || json(observed.history) !== json(prefix)) {
    throw new Error('EXACT_FIVE_MIGRATION_PREFIX_REQUIRED');
  }
  if (observed.current_user !== 'postgres') throw new Error('POSTGRES_REQUIRED');
  if (reference.public_anon_column_grants !== 0 || observed.public_anon_column_grants !== 0) {
    throw new Error('COLUMN_ACL_REQUIRES_SEPARATE_RECONCILIATION');
  }
  const expectedObjects = new Map(reference.objects.map((entry) => [key(entry), entry]));
  const revokes = [];
  for (const object of observed.objects) {
    const expected = expectedObjects.get(key(object));
    if (!expected || object.owner !== expected.owner || object.schema !== 'public') {
      throw new Error(`OBJECT_IDENTITY_DRIFT:${key(object)}`);
    }
    expectedObjects.delete(key(object));
    const desired = new Set(expected.anon.map(aclKey));
    const actual = new Set(object.anon.map(aclKey));
    if (expected.anon.some((entry) => !actual.has(aclKey(entry)))) throw new Error(`MISSING_CANONICAL_GRANT:${key(object)}`);
    for (const grant of object.anon.filter((entry) => !desired.has(aclKey(entry)))) {
      if (object.extension_member || object.owner !== 'postgres' || grant.grantor !== 'postgres' || grant.grantable) {
        throw new Error(`UNSUPPORTED_GRANT_PROVENANCE:${key(object)}`);
      }
      const allowed = object.kind === 'TABLE'
        ? ['SELECT','INSERT','UPDATE','DELETE','TRUNCATE','REFERENCES','TRIGGER','MAINTAIN']
        : object.kind === 'SEQUENCE' ? ['SELECT','USAGE','UPDATE'] : ['EXECUTE'];
      if (!allowed.includes(grant.privilege)) throw new Error('UNKNOWN_PRIVILEGE');
      revokes.push({ kind: object.kind, identity: object.identity, privilege: grant.privilege });
    }
  }
  if (expectedObjects.size) throw new Error('MISSING_CANONICAL_OBJECTS');
  const defaultKey = (entry) => `${entry.type}:${aclKey(entry)}`;
  const desiredDefaults = new Set(reference.defaults.map(defaultKey));
  const actualDefaults = new Set(observed.defaults.map(defaultKey));
  if (reference.defaults.some((entry) => !actualDefaults.has(defaultKey(entry)))) throw new Error('MISSING_CANONICAL_DEFAULT_GRANT');
  if (observed.defaults.some((entry) => entry.grantor !== 'postgres' || entry.grantable || !['r','f','S'].includes(entry.type))) {
    throw new Error('UNSUPPORTED_DEFAULT_GRANT');
  }
  const expectedAfter = { ...observed, objects: reference.objects, defaults: reference.defaults };
  return {
    project_ref: projectRef, owner, prefix_version: PREFIX_VERSION,
    migration_manifest_sha256: hash(manifest.rows), reference_sha256: hash(reference),
    before: observed, expected_after: expectedAfter, revokes,
    defaults_to_revoke: observed.defaults.filter((entry) => !desiredDefaults.has(defaultKey(entry))),
    destructive_ddl: 0, data_mutations: 0, new_grants: 0,
  };
}

export function buildAuthenticatedPlan({ reference, observed, root = process.cwd(), projectRef, owner }) {
  assertTargetBinding({ projectRef, owner, bindings: readEnvironmentBindings({ root }) });
  const manifest = checkManifest({ root });
  const prefix = manifest.rows.filter((row) => row.version <= AUTHENTICATED_PREFIX_VERSION)
    .map((row) => ({ version: row.version, name: path.basename(row.filename).slice(15, -4) }));
  if (prefix.length !== 7 || json(reference.history) !== json(prefix) || json(observed.history) !== json(prefix)) {
    throw new Error('EXACT_SEVEN_MIGRATION_PREFIX_REQUIRED');
  }
  if (reference.current_user !== 'postgres' || observed.current_user !== 'postgres') throw new Error('POSTGRES_REQUIRED');
  if (!observed.authenticated_function_protected_digest) {
    throw new Error('AUTHENTICATED_PROTECTED_DIGEST_REQUIRED');
  }

  const referenceObjects = new Map(reference.objects.map((entry) => [entry.identity, entry]));
  const observedObjects = new Map(observed.objects.map((entry) => [entry.identity, entry]));
  const targets = [];

  for (const expectedTarget of AUTHENTICATED_SERVER_ONLY_TARGETS) {
    const referenceObject = referenceObjects.get(expectedTarget.identity);
    const observedObject = observedObjects.get(expectedTarget.identity);
    if (!referenceObject || referenceObject.kind !== 'FUNCTION' || referenceObject.schema !== 'public') {
      throw new Error(`CANONICAL_TARGET_MISSING:${expectedTarget.identity}`);
    }
    if (!observedObject || observedObject.kind !== 'FUNCTION' || observedObject.schema !== 'public') {
      throw new Error(`STAGING_TARGET_MISSING:${expectedTarget.identity}`);
    }
    for (const [label, object] of [['REFERENCE', referenceObject], ['STAGING', observedObject]]) {
      if (object.owner !== expectedTarget.owner || object.extension_member) {
        throw new Error(`${label}_TARGET_OWNERSHIP_DRIFT:${expectedTarget.identity}`);
      }
      if (
        object.security_definer !== expectedTarget.security_definer
        || json(object.function_config ?? null) !== json(expectedTarget.function_config)
        || object.function_md5 !== expectedTarget.function_md5
      ) {
        throw new Error(`${label}_TARGET_DEFINITION_DRIFT:${expectedTarget.identity}`);
      }
      if (object.anon_effective !== false || object.service_role_effective !== true) {
        throw new Error(`${label}_TARGET_NON_AUTH_PRIVILEGE_DRIFT:${expectedTarget.identity}`);
      }
    }

    const grants = acl(observedObject, 'authenticated');
    if (observedObject.authenticated_effective === true) {
      if (
        grants.length !== 1
        || grants[0].grantor !== 'postgres'
        || grants[0].privilege !== 'EXECUTE'
        || grants[0].grantable !== false
      ) {
        throw new Error(`STAGING_TARGET_AUTHENTICATED_ACL_UNSAFE:${expectedTarget.identity}`);
      }
      targets.push({ kind: 'FUNCTION', identity: expectedTarget.identity, privilege: 'EXECUTE' });
    } else if (grants.length !== 0) {
      throw new Error(`STAGING_TARGET_AUTHENTICATED_ACL_INCONSISTENT:${expectedTarget.identity}`);
    }
  }

  if (![0, AUTHENTICATED_EXPECTED_REVOKES].includes(targets.length)) {
    throw new Error(`AUTHENTICATED_REVOKE_COUNT_INVALID:${targets.length}`);
  }

  const expectedAfterObjects = observed.objects.map((entry) => {
    const isTarget = AUTHENTICATED_SERVER_ONLY_TARGETS.some((target) => target.identity === entry.identity);
    return isTarget
      ? { ...entry, authenticated: [], authenticated_effective: false }
      : entry;
  });

  return {
    project_ref: projectRef,
    owner,
    role: 'authenticated',
    prefix_version: AUTHENTICATED_PREFIX_VERSION,
    migration_manifest_sha256: hash(manifest.rows),
    reference_sha256: hash({
      history: reference.history,
      targets: AUTHENTICATED_SERVER_ONLY_TARGETS.map((target) => {
        const object = referenceObjects.get(target.identity);
        return {
          identity: target.identity,
          owner: object.owner,
          extension_member: object.extension_member,
          security_definer: object.security_definer,
          function_config: object.function_config,
          function_md5: object.function_md5,
          anon_effective: object.anon_effective,
          service_role_effective: object.service_role_effective,
        };
      }),
    }),
    before: observed,
    expected_after: { ...observed, objects: expectedAfterObjects },
    revokes: targets,
    defaults_to_revoke: [],
    destructive_ddl: 0,
    data_mutations: 0,
    new_grants: 0,
  };
}

export function renderRepairSql(plan, { rollback = false } = {}) {
  const snapshotQuery = SNAPSHOT_SQL.trim().replace(/;$/u, '');
  // All identifiers originate in the matching canonical snapshot, never free-form arguments.
  const groups = new Map();
  for (const entry of plan.revokes) {
    const objectKey = key(entry);
    if (!groups.has(objectKey)) groups.set(objectKey, { ...entry, privileges: [] });
    groups.get(objectKey).privileges.push(entry.privilege);
  }
  const revokes = [...groups.values()].map((entry) => `revoke ${entry.privileges.join(', ')} on ${entry.kind} ${entry.identity} from anon restrict;`);
  for (const type of [...new Set(plan.defaults_to_revoke.map((entry) => entry.type))]) {
    const group = { r: 'tables', f: 'functions', S: 'sequences' }[type];
    const privileges = plan.defaults_to_revoke.filter((entry) => entry.type === type).map((entry) => entry.privilege);
    revokes.push(`alter default privileges for role postgres in schema public revoke ${privileges.join(', ')} on ${group} from anon restrict;`);
  }
  const expectedAcl = Object.fromEntries(plan.expected_after.objects.map((entry) => [key(entry), entry.anon]));
  return `-- STAGING ONLY: ${plan.project_ref}; canonical prefix ${PREFIX_VERSION}\n-- No history repair, persistent helpers, new grants or destructive DDL.\nbegin;\nset local lock_timeout = '5s';\nset local statement_timeout = '90s';\ndo $vento_acl_repair$\ndeclare s jsonb;\nbegin\n  ${snapshotQuery} into s;\n  if s <> ${literal(json(plan.before))}::jsonb then raise exception 'STAGING_ACL_PRECONDITION_CHANGED'; end if;\nend\n$vento_acl_repair$;\n${revokes.join('\n')}\ndo $vento_acl_post$\ndeclare s jsonb; v_acl jsonb;\nbegin\n  ${snapshotQuery} into s;\n  select jsonb_object_agg((o->>'kind') || ':' || (o->>'identity'), o->'anon') into v_acl from jsonb_array_elements(s->'objects') o;\n  if v_acl <> ${literal(json(expectedAcl))}::jsonb or s->'defaults' <> ${literal(json(plan.expected_after.defaults))}::jsonb then raise exception 'STAGING_ACL_TARGET_NOT_REACHED'; end if;\n  if s->>'protected_digest' <> ${literal(plan.before.protected_digest)} or s->'history' <> ${literal(json(plan.before.history))}::jsonb then raise exception 'STAGING_PROTECTED_STATE_CHANGED'; end if;\nend\n$vento_acl_post$;\n${rollback ? 'rollback' : 'commit'};\n`;
}

export function renderAuthenticatedRepairSql(plan, { rollback = false } = {}) {
  const snapshotQuery = SNAPSHOT_SQL.trim().replace(/;$/u, '');
  const groups = new Map();
  for (const entry of plan.revokes) {
    const objectKey = key(entry);
    if (!groups.has(objectKey)) groups.set(objectKey, { ...entry, privileges: [] });
    groups.get(objectKey).privileges.push(entry.privilege);
  }
  const revokes = [...groups.values()].map((entry) => `revoke ${entry.privileges.join(', ')} on FUNCTION ${entry.identity} from authenticated restrict;`);
  const expectedAuthenticated = Object.fromEntries(
    plan.expected_after.objects
      .filter((entry) => entry.kind === 'FUNCTION')
      .map((entry) => [key(entry), { acl: acl(entry, 'authenticated'), effective: entry.authenticated_effective }]),
  );
  const beforeAnon = aclMap(plan.before.objects, 'anon');
  return `-- STAGING ONLY: ${plan.project_ref}; canonical prefix ${AUTHENTICATED_PREFIX_VERSION}; authenticated function ACL reconciliation\n-- No history repair, persistent helpers, new grants, data mutation or destructive DDL.\nbegin;\nset local lock_timeout = '5s';\nset local statement_timeout = '90s';\ndo $vento_authenticated_acl_repair$\ndeclare s jsonb;\nbegin\n  ${snapshotQuery} into s;\n  if s <> ${literal(json(plan.before))}::jsonb then raise exception 'STAGING_AUTHENTICATED_ACL_PRECONDITION_CHANGED'; end if;\nend\n$vento_authenticated_acl_repair$;\n${revokes.join('\n')}\ndo $vento_authenticated_acl_post$\ndeclare s jsonb; v_authenticated jsonb; v_anon jsonb;\nbegin\n  ${snapshotQuery} into s;\n  select jsonb_object_agg((o->>'kind') || ':' || (o->>'identity'), jsonb_build_object('acl', o->'authenticated', 'effective', o->'authenticated_effective')) into v_authenticated from jsonb_array_elements(s->'objects') o where o->>'kind' = 'FUNCTION';\n  select jsonb_object_agg((o->>'kind') || ':' || (o->>'identity'), o->'anon') into v_anon from jsonb_array_elements(s->'objects') o;\n  if v_authenticated <> ${literal(json(expectedAuthenticated))}::jsonb then raise exception 'STAGING_AUTHENTICATED_ACL_TARGET_NOT_REACHED'; end if;\n  if v_anon <> ${literal(json(beforeAnon))}::jsonb or s->'defaults' <> ${literal(json(plan.before.defaults))}::jsonb then raise exception 'STAGING_NON_TARGET_ACL_CHANGED'; end if;\n  if s->>'authenticated_function_protected_digest' <> ${literal(plan.before.authenticated_function_protected_digest)} or s->'history' <> ${literal(json(plan.before.history))}::jsonb then raise exception 'STAGING_AUTHENTICATED_PROTECTED_STATE_CHANGED'; end if;\nend\n$vento_authenticated_acl_post$;\n${rollback ? 'rollback' : 'commit'};\n`;
}

if (process.argv[1] && path.resolve(process.argv[1]) === fileURLToPath(import.meta.url)) {
  const [referencePath, observedPath, outputPrefix, mode = 'anon'] = process.argv.slice(2);
  if (!referencePath || !observedPath || !outputPrefix || !['anon', 'authenticated'].includes(mode)) {
    throw new Error('Usage: node staging-acl-reconciliation.mjs reference.json observed.json output-prefix [anon|authenticated]');
  }
  const { staging } = readEnvironmentBindings();
  const input = {
    reference: JSON.parse(fs.readFileSync(referencePath, 'utf8')),
    observed: JSON.parse(fs.readFileSync(observedPath, 'utf8')),
    projectRef: staging.project_ref,
    owner: staging.owner,
  };
  const plan = mode === 'authenticated' ? buildAuthenticatedPlan(input) : buildPlan(input);
  const sql = mode === 'authenticated' ? renderAuthenticatedRepairSql(plan) : renderRepairSql(plan);
  fs.writeFileSync(`${outputPrefix}.json`, `${JSON.stringify(plan, null, 2)}\n`);
  fs.writeFileSync(`${outputPrefix}.sql`, sql);
  console.log(JSON.stringify({ mode, revokes: plan.revokes.length, defaults: plan.defaults_to_revoke.length, target: plan.project_ref, mutations_executed: false }));
}
