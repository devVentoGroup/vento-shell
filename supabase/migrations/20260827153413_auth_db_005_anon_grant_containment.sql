begin;

create temporary table auth_db_005_governed_schemas (
  schema_name text primary key
) on commit drop;

insert into auth_db_005_governed_schemas (schema_name)
values
  ('app_private'),
  ('club'),
  ('pass'),
  ('payments'),
  ('pos'),
  ('public'),
  ('talento'),
  ('viso');

create temporary table auth_db_005_privilege_manifest (
  qualified_object_identity text not null,
  object_kind text not null,
  product_boundary text not null,
  schema_exposure_state text not null,
  object_owner text,
  current_schema_privileges jsonb not null,
  current_object_privileges jsonb not null,
  current_column_privileges jsonb not null,
  current_effective_privileges jsonb not null,
  privilege_origin text not null,
  default_privilege_origin text,
  role_membership_origin text,
  rls_protection_class text,
  policy_audiences jsonb not null,
  consumer_repositories jsonb not null,
  consumer_applications jsonb not null,
  contract_kind text,
  audience_contract text,
  public_purpose text,
  business_owner text,
  technical_owner text,
  sensitivity text,
  row_or_resource_scope text,
  column_or_return_scope text,
  volume_and_pagination_policy text,
  abuse_protection_policy text,
  error_disclosure_policy text,
  canonical_disposition text not null,
  target_schema text,
  target_operations jsonb not null,
  dependency_grants jsonb not null,
  successor_contract text,
  compatibility_state text,
  review_or_exit_gate text,
  migration_reference text not null,
  definition_or_acl_hash text,
  rollback text not null,
  evidence jsonb not null,
  primary key (object_kind, qualified_object_identity)
) on commit drop;

insert into auth_db_005_privilege_manifest
select
  format('SCHEMA:%I', n.nspname),
  'SCHEMA',
  'VENTO_OS',
  case when n.nspname = 'public' then 'LEGACY_EXPOSED' else 'OWNER_SCHEMA' end,
  pg_get_userbyid(n.nspowner),
  jsonb_build_object(
    'usage', has_schema_privilege('anon', n.oid, 'USAGE'),
    'create', has_schema_privilege('anon', n.oid, 'CREATE')
  ),
  '{}'::jsonb,
  '[]'::jsonb,
  jsonb_build_object(
    'usage', has_schema_privilege('anon', n.oid, 'USAGE'),
    'create', has_schema_privilege('anon', n.oid, 'CREATE')
  ),
  case
    when exists (
      select 1
      from aclexplode(coalesce(n.nspacl, '{}'::aclitem[])) a
      where a.grantee = 'anon'::regrole::oid
        and a.privilege_type = 'USAGE'
    ) then 'DIRECT_SCHEMA_ACL'
    when exists (
      select 1
      from aclexplode(coalesce(n.nspacl, '{}'::aclitem[])) a
      where a.grantee = 0
        and a.privilege_type = 'USAGE'
    ) then 'PUBLIC_SCHEMA_ACL'
    else 'NO_ANON_SCHEMA_PRIVILEGE'
  end,
  null,
  'ANON_ROLE_EFFECTIVE',
  null,
  '[]'::jsonb,
  '[]'::jsonb,
  '[]'::jsonb,
  'SCHEMA_PRIVILEGE',
  null,
  null,
  null,
  'VENTO_OS',
  null,
  null,
  null,
  null,
  null,
  null,
  case
    when n.nspname = 'pos' then 'RETIRE'
    when n.nspname in ('app_private', 'club', 'payments', 'viso') then 'PRIVATE_ONLY'
    else 'BLOCKED_PENDING_EVIDENCE'
  end,
  case when n.nspname = 'pos' then 'pos' else null end,
  case when n.nspname = 'pos' then '["REVOKE_USAGE"]'::jsonb else '[]'::jsonb end,
  '[]'::jsonb,
  null,
  case
    when n.nspname = 'pos' then 'NO_ANON_OBJECT_DEPENDENCY_OBSERVED'
    when n.nspname in ('app_private', 'club', 'payments', 'viso') then 'PRIVATE_BASELINE'
    else 'LEGACY_FROZEN'
  end,
  case
    when n.nspname = 'pos' then 'ZERO_ANON_OBJECT_FUNCTION_SEQUENCE_DEPENDENCIES'
    when n.nspname in ('app_private', 'club', 'payments', 'viso') then 'PRESERVE_ZERO'
    else 'REQUIRES_CONSUMER_AND_ANON_PUBLIC_EVIDENCE'
  end,
  'AUTH-DB-005::GLOBAL',
  md5(coalesce(n.nspacl::text, '')),
  case
    when n.nspname = 'pos'
      then 'FORWARD CORRECTION ONLY; RE-GRANT USAGE ONLY IF A VALIDATED ANON_PUBLIC DEPENDENCY IS PROVEN'
    else 'FORWARD CORRECTION ONLY; DO NOT BROADEN ANON SCHEMA PRIVILEGES'
  end,
  jsonb_build_object(
    'source', 'pg_catalog.pg_namespace',
    'relation_count', (
      select count(*)
      from pg_catalog.pg_class c
      where c.relnamespace = n.oid
        and c.relkind in ('r', 'p', 'v', 'm', 'f')
    ),
    'anon_relation_privilege_count', (
      select count(*)
      from pg_catalog.pg_class c
      where c.relnamespace = n.oid
        and c.relkind in ('r', 'p', 'v', 'm', 'f')
        and (
          has_table_privilege('anon', c.oid, 'SELECT')
          or has_table_privilege('anon', c.oid, 'INSERT')
          or has_table_privilege('anon', c.oid, 'UPDATE')
          or has_table_privilege('anon', c.oid, 'DELETE')
          or has_table_privilege('anon', c.oid, 'TRUNCATE')
          or has_table_privilege('anon', c.oid, 'REFERENCES')
          or has_table_privilege('anon', c.oid, 'TRIGGER')
        )
    ),
    'function_count', (
      select count(*)
      from pg_catalog.pg_proc p
      where p.pronamespace = n.oid
        and p.prokind in ('f', 'p')
    ),
    'anon_function_execute_count', (
      select count(*)
      from pg_catalog.pg_proc p
      where p.pronamespace = n.oid
        and p.prokind in ('f', 'p')
        and has_function_privilege('anon', p.oid, 'EXECUTE')
    ),
    'sequence_count', (
      select count(*)
      from pg_catalog.pg_class c
      where c.relnamespace = n.oid
        and c.relkind = 'S'
    ),
    'anon_sequence_privilege_count', (
      select count(*)
      from pg_catalog.pg_class c
      where c.relnamespace = n.oid
        and c.relkind = 'S'
        and (
          has_sequence_privilege('anon', c.oid, 'USAGE')
          or has_sequence_privilege('anon', c.oid, 'SELECT')
          or has_sequence_privilege('anon', c.oid, 'UPDATE')
        )
    )
  )
from pg_catalog.pg_namespace n
join auth_db_005_governed_schemas g on g.schema_name = n.nspname;

with relations as (
  select
    c.oid,
    n.nspname as schema_name,
    c.relname,
    c.relkind,
    c.relowner,
    c.relacl,
    c.relrowsecurity,
    c.relforcerowsecurity,
    c.reloptions
  from pg_catalog.pg_class c
  join pg_catalog.pg_namespace n on n.oid = c.relnamespace
  join auth_db_005_governed_schemas g on g.schema_name = n.nspname
  where c.relkind in ('r', 'p', 'v', 'm', 'f')
)
insert into auth_db_005_privilege_manifest
select
  format('%I.%I', r.schema_name, r.relname),
  case r.relkind
    when 'r' then 'TABLE'
    when 'p' then 'PARTITIONED_TABLE'
    when 'v' then 'VIEW'
    when 'm' then 'MATERIALIZED_VIEW'
    when 'f' then 'FOREIGN_TABLE'
    else 'RELATION'
  end,
  'VENTO_OS',
  case when r.schema_name = 'public' then 'LEGACY_EXPOSED' else 'OWNER_SCHEMA' end,
  pg_get_userbyid(r.relowner),
  jsonb_build_object(
    'usage', has_schema_privilege('anon', quote_ident(r.schema_name), 'USAGE'),
    'create', has_schema_privilege('anon', quote_ident(r.schema_name), 'CREATE')
  ),
  jsonb_build_object(
    'select', has_table_privilege('anon', r.oid, 'SELECT'),
    'insert', has_table_privilege('anon', r.oid, 'INSERT'),
    'update', has_table_privilege('anon', r.oid, 'UPDATE'),
    'delete', has_table_privilege('anon', r.oid, 'DELETE'),
    'truncate', has_table_privilege('anon', r.oid, 'TRUNCATE'),
    'references', has_table_privilege('anon', r.oid, 'REFERENCES'),
    'trigger', has_table_privilege('anon', r.oid, 'TRIGGER')
  ),
  coalesce((
    select jsonb_agg(
      jsonb_build_object('column', cp.column_name, 'privilege', cp.privilege_type)
      order by cp.column_name, cp.privilege_type
    )
    from information_schema.column_privileges cp
    where cp.table_schema = r.schema_name
      and cp.table_name = r.relname
      and cp.grantee = 'anon'
  ), '[]'::jsonb),
  jsonb_build_object(
    'select', has_table_privilege('anon', r.oid, 'SELECT'),
    'insert', has_table_privilege('anon', r.oid, 'INSERT'),
    'update', has_table_privilege('anon', r.oid, 'UPDATE'),
    'delete', has_table_privilege('anon', r.oid, 'DELETE'),
    'truncate', has_table_privilege('anon', r.oid, 'TRUNCATE'),
    'references', has_table_privilege('anon', r.oid, 'REFERENCES'),
    'trigger', has_table_privilege('anon', r.oid, 'TRIGGER')
  ),
  case
    when exists (
      select 1
      from aclexplode(coalesce(r.relacl, acldefault('r', r.relowner))) a
      where a.grantee = 'anon'::regrole::oid
    ) then 'DIRECT_OBJECT_ACL'
    when exists (
      select 1
      from aclexplode(coalesce(r.relacl, acldefault('r', r.relowner))) a
      where a.grantee = 0
    ) then 'PUBLIC_OR_INHERITED_ACL'
    else 'EFFECTIVE_ORIGIN_REQUIRES_MEMBERSHIP_RECONCILIATION'
  end,
  null,
  'ANON_ROLE_EFFECTIVE',
  case
    when r.relrowsecurity and r.relforcerowsecurity then 'RLS_FORCED'
    when r.relrowsecurity then 'RLS_ENABLED'
    else 'RLS_NOT_ENABLED'
  end,
  coalesce((
    select jsonb_agg(x.role_name order by x.role_name)
    from (
      select distinct role_name::text as role_name
      from pg_catalog.pg_policies pol
      cross join lateral unnest(pol.roles) role_name
      where pol.schemaname = r.schema_name
        and pol.tablename = r.relname
    ) x
  ), '[]'::jsonb),
  case
    when r.schema_name = 'pass' and r.relname = 'loyalty_redemptions'
      then '["carlosibarraariza/vento-pass"]'::jsonb
    else '[]'::jsonb
  end,
  case
    when r.schema_name = 'pass' and r.relname = 'loyalty_redemptions'
      then '["VENTO_PASS"]'::jsonb
    else '[]'::jsonb
  end,
  case
    when r.relkind in ('v', 'm') then 'LEGACY_READ_SURFACE'
    else 'LEGACY_RELATION'
  end,
  null,
  null,
  null,
  'VENTO_OS',
  null,
  null,
  null,
  null,
  null,
  null,
  'BLOCKED_PENDING_EVIDENCE',
  null,
  '[]'::jsonb,
  coalesce((
    select jsonb_agg(dep.identity order by dep.identity)
    from (
      select distinct format('%I.%I', dn.nspname, dc.relname) as identity
      from pg_catalog.pg_rewrite rw
      join pg_catalog.pg_depend d
        on d.classid = 'pg_rewrite'::regclass
       and d.objid = rw.oid
       and d.refclassid = 'pg_class'::regclass
      join pg_catalog.pg_class dc on dc.oid = d.refobjid
      join pg_catalog.pg_namespace dn on dn.oid = dc.relnamespace
      where rw.ev_class = r.oid
        and dc.oid <> r.oid
    ) dep
  ), '[]'::jsonb),
  null,
  'LEGACY_FROZEN',
  case
    when has_table_privilege('anon', r.oid, 'INSERT')
      or has_table_privilege('anon', r.oid, 'UPDATE')
      or has_table_privilege('anon', r.oid, 'DELETE')
      or has_table_privilege('anon', r.oid, 'TRUNCATE')
      or has_table_privilege('anon', r.oid, 'REFERENCES')
      or has_table_privilege('anon', r.oid, 'TRIGGER')
      then 'REQUIRES_SUCCESSOR_BEFORE_ANON_DML_OR_TABLE_ADMIN_REVOKE'
    else 'REQUIRES_ANON_PUBLIC_OR_RETIRE_EVIDENCE'
  end,
  'AUTH-DB-005::GLOBAL',
  md5(
    coalesce(r.relacl::text, '')
    || ':'
    || r.relrowsecurity::text
    || ':'
    || r.relforcerowsecurity::text
    || ':'
    || coalesce(array_to_string(r.reloptions, ','), '')
  ),
  'FORWARD CORRECTION ONLY; DO NOT RESTORE OR EXPAND BROAD ANON ACL',
  jsonb_build_object(
    'source', 'pg_catalog.pg_class',
    'security_invoker', case
      when r.relkind in ('v', 'm')
        then coalesce('security_invoker=true' = any(r.reloptions), false)
      else null
    end,
    'definition_hash', case
      when r.relkind in ('v', 'm') then md5(pg_get_viewdef(r.oid, true))
      else null
    end,
    'consumer_evidence_state', case
      when r.schema_name = 'pass' and r.relname = 'loyalty_redemptions'
        then 'CURRENT_AUTHENTICATED_VENTO_PASS_CONSUMER_OBSERVED'
      else 'NOT_SUFFICIENT_FOR_CUTOVER'
    end
  )
from relations r
where has_table_privilege('anon', r.oid, 'SELECT')
   or has_table_privilege('anon', r.oid, 'INSERT')
   or has_table_privilege('anon', r.oid, 'UPDATE')
   or has_table_privilege('anon', r.oid, 'DELETE')
   or has_table_privilege('anon', r.oid, 'TRUNCATE')
   or has_table_privilege('anon', r.oid, 'REFERENCES')
   or has_table_privilege('anon', r.oid, 'TRIGGER');

with funcs as (
  select
    p.oid,
    n.nspname as schema_name,
    p.proname,
    pg_get_function_identity_arguments(p.oid) as identity_args,
    p.proowner,
    p.prorettype,
    p.prosecdef,
    p.proacl,
    p.prosrc,
    exists (
      select 1
      from pg_catalog.pg_depend dep
      where dep.classid = 'pg_proc'::regclass
        and dep.objid = p.oid
        and dep.refclassid = 'pg_extension'::regclass
        and dep.deptype = 'e'
    ) as extension_managed
  from pg_catalog.pg_proc p
  join pg_catalog.pg_namespace n on n.oid = p.pronamespace
  join auth_db_005_governed_schemas g on g.schema_name = n.nspname
  where p.prokind in ('f', 'p')
)
insert into auth_db_005_privilege_manifest
select
  format('%I.%I(%s)', f.schema_name, f.proname, f.identity_args),
  case when f.prorettype = 'trigger'::regtype then 'TRIGGER_FUNCTION' else 'FUNCTION' end,
  case when f.extension_managed then 'MANAGED_EXTENSION' else 'VENTO_OS' end,
  case when f.schema_name = 'public' then 'LEGACY_EXPOSED' else 'OWNER_SCHEMA' end,
  pg_get_userbyid(f.proowner),
  jsonb_build_object(
    'usage', has_schema_privilege('anon', quote_ident(f.schema_name), 'USAGE'),
    'create', has_schema_privilege('anon', quote_ident(f.schema_name), 'CREATE')
  ),
  jsonb_build_object('execute', has_function_privilege('anon', f.oid, 'EXECUTE')),
  '[]'::jsonb,
  jsonb_build_object('execute', has_function_privilege('anon', f.oid, 'EXECUTE')),
  case
    when exists (
      select 1
      from aclexplode(coalesce(f.proacl, acldefault('f', f.proowner))) a
      where a.grantee = 'anon'::regrole::oid
        and a.privilege_type = 'EXECUTE'
    ) then 'DIRECT_AND_OR_PUBLIC_FUNCTION_ACL'
    when exists (
      select 1
      from aclexplode(coalesce(f.proacl, acldefault('f', f.proowner))) a
      where a.grantee = 0
        and a.privilege_type = 'EXECUTE'
    ) then 'PUBLIC_FUNCTION_ACL'
    else 'EFFECTIVE_ORIGIN_REQUIRES_MEMBERSHIP_RECONCILIATION'
  end,
  null,
  'ANON_ROLE_EFFECTIVE',
  null,
  '[]'::jsonb,
  '[]'::jsonb,
  '[]'::jsonb,
  case when f.prorettype = 'trigger'::regtype then 'TRIGGER_ONLY' else 'LEGACY_RPC_OR_HELPER' end,
  null,
  null,
  null,
  case when f.extension_managed then 'MANAGED_EXTENSION' else 'VENTO_OS' end,
  null,
  null,
  null,
  null,
  null,
  null,
  'BLOCKED_PENDING_EVIDENCE',
  null,
  '[]'::jsonb,
  '[]'::jsonb,
  null,
  case when f.extension_managed then 'MANAGED_PLATFORM' else 'LEGACY_FROZEN' end,
  case
    when f.extension_managed then 'MANAGED_EXTENSION_OUT_OF_INFERRED_CHANGES'
    when f.prorettype = 'trigger'::regtype then 'PUBLIC_EXECUTE_REQUIRES_CROSS_ROLE_ACL_SPLIT'
    when f.prosecdef then 'REQUIRES_ANON_PUBLIC_AND_AUTH_DB_003_EVIDENCE'
    else 'REQUIRES_ANON_PUBLIC_OR_RETIRE_EVIDENCE'
  end,
  'AUTH-DB-005::GLOBAL',
  md5(replace(f.prosrc, E'\r\n', E'\n')) || ':' || md5(coalesce(f.proacl::text, '')),
  'FORWARD CORRECTION ONLY; DO NOT CHANGE FUNCTION BODY OWNER SECURITY MODE OR CROSS-ROLE EXECUTE BY INFERENCE',
  jsonb_build_object(
    'source', 'pg_catalog.pg_proc',
    'security_definer', f.prosecdef,
    'trigger_return', f.prorettype = 'trigger'::regtype,
    'direct_anon_execute', exists (
      select 1
      from aclexplode(coalesce(f.proacl, acldefault('f', f.proowner))) a
      where a.grantee = 'anon'::regrole::oid
        and a.privilege_type = 'EXECUTE'
    ),
    'public_execute', exists (
      select 1
      from aclexplode(coalesce(f.proacl, acldefault('f', f.proowner))) a
      where a.grantee = 0
        and a.privilege_type = 'EXECUTE'
    ),
    'extension_managed', f.extension_managed,
    'trigger_associations', (
      select count(*)
      from pg_catalog.pg_trigger t
      where t.tgfoid = f.oid
        and not t.tgisinternal
    )
  )
from funcs f
where has_function_privilege('anon', f.oid, 'EXECUTE');

with seqs as (
  select
    c.oid,
    n.nspname as schema_name,
    c.relname,
    c.relowner,
    c.relacl
  from pg_catalog.pg_class c
  join pg_catalog.pg_namespace n on n.oid = c.relnamespace
  join auth_db_005_governed_schemas g on g.schema_name = n.nspname
  where c.relkind = 'S'
)
insert into auth_db_005_privilege_manifest
select
  format('%I.%I', s.schema_name, s.relname),
  'SEQUENCE',
  'VENTO_OS',
  case when s.schema_name = 'public' then 'LEGACY_EXPOSED' else 'OWNER_SCHEMA' end,
  pg_get_userbyid(s.relowner),
  jsonb_build_object(
    'usage', has_schema_privilege('anon', quote_ident(s.schema_name), 'USAGE'),
    'create', has_schema_privilege('anon', quote_ident(s.schema_name), 'CREATE')
  ),
  jsonb_build_object(
    'usage', has_sequence_privilege('anon', s.oid, 'USAGE'),
    'select', has_sequence_privilege('anon', s.oid, 'SELECT'),
    'update', has_sequence_privilege('anon', s.oid, 'UPDATE')
  ),
  '[]'::jsonb,
  jsonb_build_object(
    'usage', has_sequence_privilege('anon', s.oid, 'USAGE'),
    'select', has_sequence_privilege('anon', s.oid, 'SELECT'),
    'update', has_sequence_privilege('anon', s.oid, 'UPDATE')
  ),
  'SEQUENCE_ACL',
  null,
  'ANON_ROLE_EFFECTIVE',
  null,
  '[]'::jsonb,
  '[]'::jsonb,
  '[]'::jsonb,
  'PRIVATE_SEQUENCE',
  null,
  null,
  null,
  'VENTO_OS',
  null,
  null,
  null,
  null,
  null,
  null,
  'PRIVATE_ONLY',
  null,
  '[]'::jsonb,
  '[]'::jsonb,
  null,
  'PRIVATE_BASELINE',
  'PRESERVE_ZERO_ANON_SEQUENCE_ACCESS',
  'AUTH-DB-005::GLOBAL',
  md5(coalesce(s.relacl::text, '')),
  'FORWARD CORRECTION ONLY; NEVER GRANT ANON SEQUENCE ACCESS',
  jsonb_build_object('source', 'pg_catalog.pg_class')
from seqs s;

insert into auth_db_005_privilege_manifest
select
  format(
    'DEFAULT_PRIVILEGES:%s:%s:%s',
    d.defaclrole::regrole::text,
    n.nspname,
    d.defaclobjtype
  ),
  'DEFAULT_PRIVILEGES',
  case
    when d.defaclrole = 'postgres'::regrole::oid then 'VENTO_OS'
    else 'MANAGED_PLATFORM'
  end,
  'LEGACY_EXPOSED',
  d.defaclrole::regrole::text,
  '{}'::jsonb,
  jsonb_build_object('acl', d.defaclacl::text),
  '[]'::jsonb,
  jsonb_build_object(
    'anon_present', exists (
      select 1
      from aclexplode(d.defaclacl) a
      where a.grantee = 'anon'::regrole::oid
    )
  ),
  'DEFAULT_ACL',
  format('%s:%s:%s', d.defaclrole::regrole::text, n.nspname, d.defaclobjtype),
  null,
  null,
  '[]'::jsonb,
  '[]'::jsonb,
  '[]'::jsonb,
  'DEFAULT_PRIVILEGE_POLICY',
  null,
  null,
  null,
  case
    when d.defaclrole = 'postgres'::regrole::oid then 'VENTO_OS'
    else 'MANAGED_PLATFORM'
  end,
  null,
  null,
  null,
  null,
  null,
  null,
  case
    when d.defaclrole = 'postgres'::regrole::oid then 'PRIVATE_ONLY'
    else 'BLOCKED_PENDING_EVIDENCE'
  end,
  null,
  '[]'::jsonb,
  '[]'::jsonb,
  null,
  case
    when d.defaclrole = 'postgres'::regrole::oid then 'RESTRICTIVE_BASELINE'
    else 'MANAGED_PLATFORM'
  end,
  case
    when d.defaclrole = 'postgres'::regrole::oid
      then 'PRESERVE_ZERO_ANON_POSTGRES_DEFAULT_GRANTS'
    else 'MANAGED_SUPABASE_DEFAULTS_OUT_OF_INFERRED_CHANGES'
  end,
  'AUTH-DB-005::GLOBAL',
  md5(d.defaclacl::text),
  'FORWARD CORRECTION ONLY; DO NOT MODIFY MANAGED SUPABASE DEFAULTS BY INFERENCE',
  jsonb_build_object('source', 'pg_catalog.pg_default_acl')
from pg_catalog.pg_default_acl d
join pg_catalog.pg_namespace n on n.oid = d.defaclnamespace
where n.nspname = 'public'
  and d.defaclrole in ('postgres'::regrole::oid, 'supabase_admin'::regrole::oid)
  and d.defaclobjtype in ('r', 'f', 'S');

do $auth_db_005_preconditions$
declare
  v_count bigint;
begin
  if exists (
    select 1
    from pg_catalog.pg_namespace
    where nspname = 'api'
  ) then
    raise exception 'AUTH_DB_005_API_SCHEMA_ALREADY_EXISTS';
  end if;

  select count(*) into v_count
  from pg_catalog.pg_class c
  join pg_catalog.pg_namespace n on n.oid = c.relnamespace
  join auth_db_005_governed_schemas g on g.schema_name = n.nspname
  where c.relkind in ('r', 'p', 'v', 'm', 'f');

  if v_count <> 325 then
    raise exception 'AUTH_DB_005_RELATION_BASELINE_DRIFT:%', v_count;
  end if;

  select count(*) into v_count
  from pg_catalog.pg_class c
  join pg_catalog.pg_namespace n on n.oid = c.relnamespace
  join auth_db_005_governed_schemas g on g.schema_name = n.nspname
  where c.relkind in ('r', 'p', 'v', 'm', 'f')
    and (
      has_table_privilege('anon', c.oid, 'SELECT')
      or has_table_privilege('anon', c.oid, 'INSERT')
      or has_table_privilege('anon', c.oid, 'UPDATE')
      or has_table_privilege('anon', c.oid, 'DELETE')
      or has_table_privilege('anon', c.oid, 'TRUNCATE')
      or has_table_privilege('anon', c.oid, 'REFERENCES')
      or has_table_privilege('anon', c.oid, 'TRIGGER')
    );

  if v_count <> 39 then
    raise exception 'AUTH_DB_005_ANON_RELATION_BASELINE_DRIFT:%', v_count;
  end if;

  select count(*) into v_count
  from (
    (
      select format('%I.%I', n.nspname, c.relname) as identity
      from pg_catalog.pg_class c
      join pg_catalog.pg_namespace n on n.oid = c.relnamespace
      join auth_db_005_governed_schemas g on g.schema_name = n.nspname
      where c.relkind in ('r', 'p', 'v', 'm', 'f')
        and (
          has_table_privilege('anon', c.oid, 'INSERT')
          or has_table_privilege('anon', c.oid, 'UPDATE')
          or has_table_privilege('anon', c.oid, 'DELETE')
          or has_table_privilege('anon', c.oid, 'TRUNCATE')
          or has_table_privilege('anon', c.oid, 'REFERENCES')
          or has_table_privilege('anon', c.oid, 'TRIGGER')
        )
      except
      select identity
      from (
        values
          ('pass.loyalty_redemptions'::text),
          ('pass.loyalty_transactions'::text),
          ('pass.pass_satellites'::text),
          ('pass.user_favorites'::text)
      ) expected(identity)
    )
    union all
    (
      select identity
      from (
        values
          ('pass.loyalty_redemptions'::text),
          ('pass.loyalty_transactions'::text),
          ('pass.pass_satellites'::text),
          ('pass.user_favorites'::text)
      ) expected(identity)
      except
      select format('%I.%I', n.nspname, c.relname)
      from pg_catalog.pg_class c
      join pg_catalog.pg_namespace n on n.oid = c.relnamespace
      join auth_db_005_governed_schemas g on g.schema_name = n.nspname
      where c.relkind in ('r', 'p', 'v', 'm', 'f')
        and (
          has_table_privilege('anon', c.oid, 'INSERT')
          or has_table_privilege('anon', c.oid, 'UPDATE')
          or has_table_privilege('anon', c.oid, 'DELETE')
          or has_table_privilege('anon', c.oid, 'TRUNCATE')
          or has_table_privilege('anon', c.oid, 'REFERENCES')
          or has_table_privilege('anon', c.oid, 'TRIGGER')
        )
    )
  ) drift;

  if v_count <> 0 then
    raise exception 'AUTH_DB_005_ANON_DML_IDENTITY_DRIFT:%', v_count;
  end if;

  select count(*) into v_count
  from pg_catalog.pg_proc p
  join pg_catalog.pg_namespace n on n.oid = p.pronamespace
  join auth_db_005_governed_schemas g on g.schema_name = n.nspname
  where p.prokind in ('f', 'p');

  if v_count <> 301 then
    raise exception 'AUTH_DB_005_FUNCTION_BASELINE_DRIFT:%', v_count;
  end if;

  select count(*) into v_count
  from pg_catalog.pg_proc p
  join pg_catalog.pg_namespace n on n.oid = p.pronamespace
  join auth_db_005_governed_schemas g on g.schema_name = n.nspname
  where p.prokind in ('f', 'p')
    and has_function_privilege('anon', p.oid, 'EXECUTE');

  if v_count <> 91 then
    raise exception 'AUTH_DB_005_ANON_EXECUTE_BASELINE_DRIFT:%', v_count;
  end if;

  select count(*) into v_count
  from pg_catalog.pg_proc p
  join pg_catalog.pg_namespace n on n.oid = p.pronamespace
  join auth_db_005_governed_schemas g on g.schema_name = n.nspname
  where p.prokind in ('f', 'p')
    and p.prosecdef
    and has_function_privilege('anon', p.oid, 'EXECUTE');

  if v_count <> 43 then
    raise exception 'AUTH_DB_005_ANON_SECURITY_DEFINER_BASELINE_DRIFT:%', v_count;
  end if;

  select count(*) into v_count
  from pg_catalog.pg_class c
  join pg_catalog.pg_namespace n on n.oid = c.relnamespace
  join auth_db_005_governed_schemas g on g.schema_name = n.nspname
  where c.relkind = 'S';

  if v_count <> 2 then
    raise exception 'AUTH_DB_005_SEQUENCE_BASELINE_DRIFT:%', v_count;
  end if;

  select count(*) into v_count
  from pg_catalog.pg_class c
  join pg_catalog.pg_namespace n on n.oid = c.relnamespace
  join auth_db_005_governed_schemas g on g.schema_name = n.nspname
  where c.relkind = 'S'
    and (
      has_sequence_privilege('anon', c.oid, 'USAGE')
      or has_sequence_privilege('anon', c.oid, 'SELECT')
      or has_sequence_privilege('anon', c.oid, 'UPDATE')
    );

  if v_count <> 0 then
    raise exception 'AUTH_DB_005_ANON_SEQUENCE_PRIVILEGE_DRIFT:%', v_count;
  end if;

  select count(*) into v_count
  from pg_catalog.pg_namespace n
  join auth_db_005_governed_schemas g on g.schema_name = n.nspname
  where has_schema_privilege('anon', n.oid, 'USAGE');

  if v_count <> 4 then
    raise exception 'AUTH_DB_005_ANON_SCHEMA_USAGE_BASELINE_DRIFT:%', v_count;
  end if;

  select count(*) into v_count
  from pg_catalog.pg_namespace n
  join auth_db_005_governed_schemas g on g.schema_name = n.nspname
  where has_schema_privilege('anon', n.oid, 'CREATE');

  if v_count <> 0 then
    raise exception 'AUTH_DB_005_ANON_SCHEMA_CREATE_BASELINE_DRIFT:%', v_count;
  end if;

  if not has_schema_privilege('anon', 'pos', 'USAGE') then
    raise exception 'AUTH_DB_005_POS_ANON_USAGE_BASELINE_MISSING';
  end if;

  select count(*) into v_count
  from pg_catalog.pg_class c
  join pg_catalog.pg_namespace n on n.oid = c.relnamespace
  where n.nspname = 'pos'
    and c.relkind in ('r', 'p', 'v', 'm', 'f');

  if v_count <> 13 then
    raise exception 'AUTH_DB_005_POS_RELATION_COUNT_DRIFT:%', v_count;
  end if;

  select count(*) into v_count
  from pg_catalog.pg_class c
  join pg_catalog.pg_namespace n on n.oid = c.relnamespace
  where n.nspname = 'pos'
    and c.relkind in ('r', 'p', 'v', 'm', 'f')
    and (
      has_table_privilege('anon', c.oid, 'SELECT')
      or has_table_privilege('anon', c.oid, 'INSERT')
      or has_table_privilege('anon', c.oid, 'UPDATE')
      or has_table_privilege('anon', c.oid, 'DELETE')
      or has_table_privilege('anon', c.oid, 'TRUNCATE')
      or has_table_privilege('anon', c.oid, 'REFERENCES')
      or has_table_privilege('anon', c.oid, 'TRIGGER')
    );

  if v_count <> 0 then
    raise exception 'AUTH_DB_005_POS_ANON_OBJECT_DEPENDENCY_FOUND:%', v_count;
  end if;

  select count(*) into v_count
  from pg_catalog.pg_proc p
  join pg_catalog.pg_namespace n on n.oid = p.pronamespace
  where n.nspname = 'pos'
    and p.prokind in ('f', 'p');

  if v_count <> 0 then
    raise exception 'AUTH_DB_005_POS_FUNCTION_DEPENDENCY_FOUND:%', v_count;
  end if;

  select count(*) into v_count
  from pg_catalog.pg_class c
  join pg_catalog.pg_namespace n on n.oid = c.relnamespace
  where n.nspname = 'pos'
    and c.relkind = 'S';

  if v_count <> 0 then
    raise exception 'AUTH_DB_005_POS_SEQUENCE_DEPENDENCY_FOUND:%', v_count;
  end if;

  select count(*) into v_count
  from pg_catalog.pg_default_acl d
  join pg_catalog.pg_namespace n on n.oid = d.defaclnamespace
  where d.defaclrole = 'postgres'::regrole::oid
    and n.nspname = 'public'
    and d.defaclobjtype in ('r', 'f', 'S')
    and exists (
      select 1
      from aclexplode(d.defaclacl) a
      where a.grantee = 'anon'::regrole::oid
    );

  if v_count <> 0 then
    raise exception 'AUTH_DB_005_POSTGRES_DEFAULT_ANON_GRANT_DRIFT:%', v_count;
  end if;

  select count(*) into v_count
  from pg_catalog.pg_default_acl d
  join pg_catalog.pg_namespace n on n.oid = d.defaclnamespace
  where d.defaclrole = 'supabase_admin'::regrole::oid
    and n.nspname = 'public'
    and d.defaclobjtype in ('r', 'f', 'S')
    and exists (
      select 1
      from aclexplode(d.defaclacl) a
      where a.grantee = 'anon'::regrole::oid
    );

  if v_count <> 3 then
    raise exception 'AUTH_DB_005_MANAGED_DEFAULT_BASELINE_DRIFT:%', v_count;
  end if;

  select count(*) into v_count
  from auth_db_005_privilege_manifest;

  if v_count <> 146 then
    raise exception 'AUTH_DB_005_MANIFEST_CARDINALITY_DRIFT:%', v_count;
  end if;

  if exists (
    select 1
    from auth_db_005_privilege_manifest
    where canonical_disposition not in (
      'KEEP_AND_HARDEN',
      'MOVE_TO_API',
      'NARROW_PRIVILEGES',
      'REPLACE_WITH_COMMAND_OR_QUERY',
      'PRIVATE_ONLY',
      'TRANSITIONAL_COMPATIBILITY',
      'RETIRE',
      'BLOCKED_PENDING_EVIDENCE'
    )
  ) then
    raise exception 'AUTH_DB_005_INVALID_DISPOSITION';
  end if;

  if exists (
    select 1
    from auth_db_005_privilege_manifest
    where product_boundary = 'VITAL'
       or qualified_object_identity ilike 'vital.%'
  ) then
    raise exception 'AUTH_DB_005_VITAL_SCOPE_VIOLATION';
  end if;

  if (
    select canonical_disposition
    from auth_db_005_privilege_manifest
    where object_kind = 'SCHEMA'
      and qualified_object_identity = 'SCHEMA:pos'
  ) <> 'RETIRE' then
    raise exception 'AUTH_DB_005_POS_DISPOSITION_INVALID';
  end if;
end
$auth_db_005_preconditions$;

revoke usage on schema pos from anon;

do $auth_db_005_postconditions$
declare
  v_count bigint;
begin
  if has_schema_privilege('anon', 'pos', 'USAGE') then
    raise exception 'AUTH_DB_005_POS_ANON_USAGE_STILL_PRESENT';
  end if;

  if has_schema_privilege('anon', 'pos', 'CREATE') then
    raise exception 'AUTH_DB_005_POS_ANON_CREATE_PRESENT';
  end if;

  if not has_schema_privilege('authenticated', 'pos', 'USAGE') then
    raise exception 'AUTH_DB_005_AUTHENTICATED_POS_USAGE_CHANGED';
  end if;

  if not has_schema_privilege('service_role', 'pos', 'USAGE') then
    raise exception 'AUTH_DB_005_SERVICE_POS_USAGE_CHANGED';
  end if;

  if not has_schema_privilege('anon', 'pass', 'USAGE') then
    raise exception 'AUTH_DB_005_PASS_USAGE_CHANGED';
  end if;

  if not has_schema_privilege('anon', 'public', 'USAGE') then
    raise exception 'AUTH_DB_005_PUBLIC_USAGE_CHANGED';
  end if;

  if not has_schema_privilege('anon', 'talento', 'USAGE') then
    raise exception 'AUTH_DB_005_TALENTO_USAGE_CHANGED';
  end if;

  select count(*) into v_count
  from pg_catalog.pg_namespace n
  join auth_db_005_governed_schemas g on g.schema_name = n.nspname
  where has_schema_privilege('anon', n.oid, 'USAGE');

  if v_count <> 3 then
    raise exception 'AUTH_DB_005_ANON_SCHEMA_USAGE_POSTCONDITION:%', v_count;
  end if;

  select count(*) into v_count
  from pg_catalog.pg_namespace n
  join auth_db_005_governed_schemas g on g.schema_name = n.nspname
  where has_schema_privilege('anon', n.oid, 'CREATE');

  if v_count <> 0 then
    raise exception 'AUTH_DB_005_ANON_SCHEMA_CREATE_POSTCONDITION:%', v_count;
  end if;

  select count(*) into v_count
  from pg_catalog.pg_class c
  join pg_catalog.pg_namespace n on n.oid = c.relnamespace
  join auth_db_005_governed_schemas g on g.schema_name = n.nspname
  where c.relkind in ('r', 'p', 'v', 'm', 'f')
    and (
      has_table_privilege('anon', c.oid, 'SELECT')
      or has_table_privilege('anon', c.oid, 'INSERT')
      or has_table_privilege('anon', c.oid, 'UPDATE')
      or has_table_privilege('anon', c.oid, 'DELETE')
      or has_table_privilege('anon', c.oid, 'TRUNCATE')
      or has_table_privilege('anon', c.oid, 'REFERENCES')
      or has_table_privilege('anon', c.oid, 'TRIGGER')
    );

  if v_count <> 39 then
    raise exception 'AUTH_DB_005_ANON_RELATION_PRIVILEGES_CHANGED:%', v_count;
  end if;

  select count(*) into v_count
  from pg_catalog.pg_proc p
  join pg_catalog.pg_namespace n on n.oid = p.pronamespace
  join auth_db_005_governed_schemas g on g.schema_name = n.nspname
  where p.prokind in ('f', 'p')
    and has_function_privilege('anon', p.oid, 'EXECUTE');

  if v_count <> 91 then
    raise exception 'AUTH_DB_005_ANON_FUNCTION_EXECUTE_CHANGED:%', v_count;
  end if;

  select count(*) into v_count
  from pg_catalog.pg_class c
  join pg_catalog.pg_namespace n on n.oid = c.relnamespace
  join auth_db_005_governed_schemas g on g.schema_name = n.nspname
  where c.relkind = 'S'
    and (
      has_sequence_privilege('anon', c.oid, 'USAGE')
      or has_sequence_privilege('anon', c.oid, 'SELECT')
      or has_sequence_privilege('anon', c.oid, 'UPDATE')
    );

  if v_count <> 0 then
    raise exception 'AUTH_DB_005_ANON_SEQUENCE_PRIVILEGES_CHANGED:%', v_count;
  end if;

  select count(*) into v_count
  from pg_catalog.pg_default_acl d
  join pg_catalog.pg_namespace n on n.oid = d.defaclnamespace
  where d.defaclrole = 'postgres'::regrole::oid
    and n.nspname = 'public'
    and d.defaclobjtype in ('r', 'f', 'S')
    and exists (
      select 1
      from aclexplode(d.defaclacl) a
      where a.grantee = 'anon'::regrole::oid
    );

  if v_count <> 0 then
    raise exception 'AUTH_DB_005_POSTGRES_DEFAULT_ANON_POSTCONDITION:%', v_count;
  end if;

  select count(*) into v_count
  from pg_catalog.pg_default_acl d
  join pg_catalog.pg_namespace n on n.oid = d.defaclnamespace
  where d.defaclrole = 'supabase_admin'::regrole::oid
    and n.nspname = 'public'
    and d.defaclobjtype in ('r', 'f', 'S')
    and exists (
      select 1
      from aclexplode(d.defaclacl) a
      where a.grantee = 'anon'::regrole::oid
    );

  if v_count <> 3 then
    raise exception 'AUTH_DB_005_MANAGED_DEFAULTS_CHANGED:%', v_count;
  end if;

  if exists (
    select 1
    from pg_catalog.pg_namespace
    where nspname = 'api'
  ) then
    raise exception 'AUTH_DB_005_API_SCHEMA_CREATED';
  end if;
end
$auth_db_005_postconditions$;

commit;
