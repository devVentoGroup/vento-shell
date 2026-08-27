begin;

create temporary table auth_db_004_privilege_manifest (
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
  consumer_repositories jsonb not null,
  consumer_applications jsonb not null,
  contract_kind text,
  business_owner text,
  technical_owner text,
  sensitivity text,
  canonical_disposition text not null,
  target_schema text,
  target_operations jsonb not null,
  target_columns jsonb not null,
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

with governed_schemas(schema_name) as (
  values
    ('app_private'),
    ('club'),
    ('pass'),
    ('payments'),
    ('pos'),
    ('public'),
    ('talento'),
    ('viso')
), relations as (
  select
    c.oid,
    n.nspname as schema_name,
    c.relname,
    c.relkind,
    pg_get_userbyid(c.relowner) as owner_name,
    c.relrowsecurity,
    c.relforcerowsecurity,
    c.relacl
  from pg_catalog.pg_class c
  join pg_catalog.pg_namespace n on n.oid = c.relnamespace
  join governed_schemas g on g.schema_name = n.nspname
  where c.relkind in ('r', 'p', 'v', 'm', 'f')
), relation_rows as (
  select
    format('%I.%I', r.schema_name, r.relname) as qualified_object_identity,
    case r.relkind
      when 'r' then 'TABLE'
      when 'p' then 'PARTITIONED_TABLE'
      when 'v' then 'VIEW'
      when 'm' then 'MATERIALIZED_VIEW'
      when 'f' then 'FOREIGN_TABLE'
      else 'RELATION'
    end as object_kind,
    'VENTO_OS'::text as product_boundary,
    case when r.schema_name = 'public' then 'LEGACY_EXPOSED' else 'OWNER_SCHEMA' end as schema_exposure_state,
    r.owner_name as object_owner,
    jsonb_build_object(
      'usage', has_schema_privilege('authenticated', quote_ident(r.schema_name), 'USAGE'),
      'create', has_schema_privilege('authenticated', quote_ident(r.schema_name), 'CREATE')
    ) as current_schema_privileges,
    jsonb_build_object(
      'select', has_table_privilege('authenticated', r.oid, 'SELECT'),
      'insert', has_table_privilege('authenticated', r.oid, 'INSERT'),
      'update', has_table_privilege('authenticated', r.oid, 'UPDATE'),
      'delete', has_table_privilege('authenticated', r.oid, 'DELETE'),
      'truncate', has_table_privilege('authenticated', r.oid, 'TRUNCATE'),
      'references', has_table_privilege('authenticated', r.oid, 'REFERENCES'),
      'trigger', has_table_privilege('authenticated', r.oid, 'TRIGGER')
    ) as current_object_privileges,
    coalesce((
      select jsonb_agg(
        jsonb_build_object('column', cp.column_name, 'privilege', cp.privilege_type)
        order by cp.column_name, cp.privilege_type
      )
      from information_schema.column_privileges cp
      where cp.table_schema = r.schema_name
        and cp.table_name = r.relname
        and cp.grantee = 'authenticated'
    ), '[]'::jsonb) as current_column_privileges,
    jsonb_build_object(
      'select', has_table_privilege('authenticated', r.oid, 'SELECT'),
      'insert', has_table_privilege('authenticated', r.oid, 'INSERT'),
      'update', has_table_privilege('authenticated', r.oid, 'UPDATE'),
      'delete', has_table_privilege('authenticated', r.oid, 'DELETE'),
      'truncate', has_table_privilege('authenticated', r.oid, 'TRUNCATE'),
      'references', has_table_privilege('authenticated', r.oid, 'REFERENCES'),
      'trigger', has_table_privilege('authenticated', r.oid, 'TRIGGER')
    ) as current_effective_privileges,
    case
      when exists (
        select 1
        from aclexplode(coalesce(r.relacl, acldefault('r', (select relowner from pg_class where oid = r.oid)))) a
        where a.grantee = 'authenticated'::regrole::oid
      ) then 'DIRECT_OBJECT_ACL'
      when exists (
        select 1
        from aclexplode(coalesce(r.relacl, acldefault('r', (select relowner from pg_class where oid = r.oid)))) a
        where a.grantee = 0
      ) then 'PUBLIC_OR_INHERITED_ACL'
      else 'EFFECTIVE_ORIGIN_REQUIRES_MEMBERSHIP_RECONCILIATION'
    end as privilege_origin,
    null::text as default_privilege_origin,
    'AUTHENTICATED_ROLE_EFFECTIVE'::text as role_membership_origin,
    case
      when r.relrowsecurity and r.relforcerowsecurity then 'RLS_FORCED'
      when r.relrowsecurity then 'RLS_ENABLED'
      else 'RLS_NOT_ENABLED'
    end as rls_protection_class,
    '[]'::jsonb as consumer_repositories,
    '[]'::jsonb as consumer_applications,
    null::text as contract_kind,
    null::text as business_owner,
    'VENTO_OS'::text as technical_owner,
    null::text as sensitivity,
    'BLOCKED_PENDING_EVIDENCE'::text as canonical_disposition,
    null::text as target_schema,
    '[]'::jsonb as target_operations,
    '[]'::jsonb as target_columns,
    '[]'::jsonb as dependency_grants,
    null::text as successor_contract,
    'LEGACY_FROZEN'::text as compatibility_state,
    'REQUIRES_CONSUMER_AND_SUCCESSOR_EVIDENCE'::text as review_or_exit_gate,
    'AUTH-DB-004::GLOBAL'::text as migration_reference,
    md5(coalesce(r.relacl::text, '') || ':' || r.relrowsecurity::text || ':' || r.relforcerowsecurity::text) as definition_or_acl_hash,
    'FORWARD_CORRECTION_ONLY; DO NOT RESTORE BROAD ACL'::text as rollback,
    jsonb_build_object('source', 'pg_catalog.pg_class') as evidence
  from relations r
  where has_table_privilege('authenticated', r.oid, 'SELECT')
     or has_table_privilege('authenticated', r.oid, 'INSERT')
     or has_table_privilege('authenticated', r.oid, 'UPDATE')
     or has_table_privilege('authenticated', r.oid, 'DELETE')
     or has_table_privilege('authenticated', r.oid, 'TRUNCATE')
     or has_table_privilege('authenticated', r.oid, 'REFERENCES')
     or has_table_privilege('authenticated', r.oid, 'TRIGGER')
)
insert into auth_db_004_privilege_manifest
select * from relation_rows;

with governed_schemas(schema_name) as (
  values
    ('app_private'),
    ('club'),
    ('pass'),
    ('payments'),
    ('pos'),
    ('public'),
    ('talento'),
    ('viso')
), funcs as (
  select
    p.oid,
    n.nspname as schema_name,
    p.proname,
    pg_get_function_identity_arguments(p.oid) as identity_args,
    pg_get_userbyid(p.proowner) as owner_name,
    p.prorettype,
    p.prosecdef,
    p.proacl,
    md5(replace(p.prosrc, E'\r\n', E'\n')) as body_md5
  from pg_catalog.pg_proc p
  join pg_catalog.pg_namespace n on n.oid = p.pronamespace
  join governed_schemas g on g.schema_name = n.nspname
  where p.prokind in ('f', 'p')
)
insert into auth_db_004_privilege_manifest
select
  format('%I.%I(%s)', f.schema_name, f.proname, f.identity_args),
  case when f.prorettype = 'trigger'::regtype then 'TRIGGER_FUNCTION' else 'FUNCTION' end,
  'VENTO_OS',
  case when f.schema_name = 'public' then 'LEGACY_EXPOSED' else 'OWNER_SCHEMA' end,
  f.owner_name,
  jsonb_build_object(
    'usage', has_schema_privilege('authenticated', quote_ident(f.schema_name), 'USAGE'),
    'create', has_schema_privilege('authenticated', quote_ident(f.schema_name), 'CREATE')
  ),
  jsonb_build_object('execute', has_function_privilege('authenticated', f.oid, 'EXECUTE')),
  '[]'::jsonb,
  jsonb_build_object('execute', has_function_privilege('authenticated', f.oid, 'EXECUTE')),
  case
    when exists (
      select 1
      from aclexplode(coalesce(f.proacl, acldefault('f', (select proowner from pg_proc where oid = f.oid)))) a
      where a.grantee = 'authenticated'::regrole::oid
        and a.privilege_type = 'EXECUTE'
    ) then 'DIRECT_OBJECT_ACL'
    when exists (
      select 1
      from aclexplode(coalesce(f.proacl, acldefault('f', (select proowner from pg_proc where oid = f.oid)))) a
      where a.grantee = 0
        and a.privilege_type = 'EXECUTE'
    ) then 'PUBLIC_ACL'
    else 'EFFECTIVE_ORIGIN_REQUIRES_MEMBERSHIP_RECONCILIATION'
  end,
  null,
  'AUTHENTICATED_ROLE_EFFECTIVE',
  null,
  '[]'::jsonb,
  case
    when format('%I.%I(%s)', f.schema_name, f.proname, f.identity_args) = 'pass.validate_catalog_item_product_site()'
      then '["database_trigger"]'::jsonb
    else '[]'::jsonb
  end,
  case
    when format('%I.%I(%s)', f.schema_name, f.proname, f.identity_args) = 'pass.validate_catalog_item_product_site()'
      then 'TRIGGER_ONLY'
    else null
  end,
  case when f.schema_name = 'pass' then 'PASS' else null end,
  'VENTO_OS',
  null,
  case
    when format('%I.%I(%s)', f.schema_name, f.proname, f.identity_args) = 'pass.validate_catalog_item_product_site()'
      then 'RETIRE'
    else 'BLOCKED_PENDING_EVIDENCE'
  end,
  null,
  case
    when format('%I.%I(%s)', f.schema_name, f.proname, f.identity_args) = 'pass.validate_catalog_item_product_site()'
      then '["NO_CLIENT_EXECUTE"]'::jsonb
    else '[]'::jsonb
  end,
  '[]'::jsonb,
  '[]'::jsonb,
  null,
  case
    when format('%I.%I(%s)', f.schema_name, f.proname, f.identity_args) = 'pass.validate_catalog_item_product_site()'
      then 'TRIGGER_ASSOCIATION_PRESERVED'
    else 'LEGACY_FROZEN'
  end,
  case
    when format('%I.%I(%s)', f.schema_name, f.proname, f.identity_args) = 'pass.validate_catalog_item_product_site()'
      then 'TRIGGER_FUNCTIONS_REQUIRE_NO_CLIENT_EXECUTE'
    else 'REQUIRES_CONSUMER_AND_CONTRACT_EVIDENCE'
  end,
  'AUTH-DB-004::GLOBAL',
  f.body_md5 || ':' || md5(coalesce(f.proacl::text, '')),
  'FORWARD_CORRECTION_ONLY; RE-GRANT EXECUTE ONLY IF A VALIDATED CLIENT CONTRACT IS PROVEN',
  jsonb_build_object(
    'source', 'pg_catalog.pg_proc',
    'security_definer', f.prosecdef,
    'trigger_return', f.prorettype = 'trigger'::regtype
  )
from funcs f
where has_function_privilege('authenticated', f.oid, 'EXECUTE');

with governed_schemas(schema_name) as (
  values
    ('app_private'),
    ('club'),
    ('pass'),
    ('payments'),
    ('pos'),
    ('public'),
    ('talento'),
    ('viso')
), seqs as (
  select
    c.oid,
    n.nspname as schema_name,
    c.relname,
    pg_get_userbyid(c.relowner) as owner_name,
    c.relacl
  from pg_catalog.pg_class c
  join pg_catalog.pg_namespace n on n.oid = c.relnamespace
  join governed_schemas g on g.schema_name = n.nspname
  where c.relkind = 'S'
)
insert into auth_db_004_privilege_manifest
select
  format('%I.%I', s.schema_name, s.relname),
  'SEQUENCE',
  'VENTO_OS',
  case when s.schema_name = 'public' then 'LEGACY_EXPOSED' else 'OWNER_SCHEMA' end,
  s.owner_name,
  jsonb_build_object(
    'usage', has_schema_privilege('authenticated', quote_ident(s.schema_name), 'USAGE'),
    'create', has_schema_privilege('authenticated', quote_ident(s.schema_name), 'CREATE')
  ),
  jsonb_build_object(
    'usage', has_sequence_privilege('authenticated', s.oid, 'USAGE'),
    'select', has_sequence_privilege('authenticated', s.oid, 'SELECT'),
    'update', has_sequence_privilege('authenticated', s.oid, 'UPDATE')
  ),
  '[]'::jsonb,
  jsonb_build_object(
    'usage', has_sequence_privilege('authenticated', s.oid, 'USAGE'),
    'select', has_sequence_privilege('authenticated', s.oid, 'SELECT'),
    'update', has_sequence_privilege('authenticated', s.oid, 'UPDATE')
  ),
  'DIRECT_OR_EFFECTIVE_SEQUENCE_ACL',
  null,
  'AUTHENTICATED_ROLE_EFFECTIVE',
  null,
  '[]'::jsonb,
  '[]'::jsonb,
  'LEGACY_SEQUENCE_DEPENDENCY',
  null,
  'VENTO_OS',
  null,
  'BLOCKED_PENDING_EVIDENCE',
  null,
  '[]'::jsonb,
  '[]'::jsonb,
  '[]'::jsonb,
  null,
  'TRANSITIONAL_COMPATIBILITY',
  'REQUIRES_SUCCESSOR_BEFORE_ZERO_CLIENT_SEQUENCE_ACCESS',
  'AUTH-DB-004::GLOBAL',
  md5(coalesce(s.relacl::text, '')),
  'FORWARD CORRECTION ONLY; DO NOT REMOVE SEQUENCE ACCESS UNTIL DEPENDENT INVOKER CONTRACTS ARE REPLACED',
  jsonb_build_object('source', 'pg_catalog.pg_class')
from seqs s
where has_sequence_privilege('authenticated', s.oid, 'USAGE')
   or has_sequence_privilege('authenticated', s.oid, 'SELECT')
   or has_sequence_privilege('authenticated', s.oid, 'UPDATE');

insert into auth_db_004_privilege_manifest
select
  format('DEFAULT_PRIVILEGES:%s:%s:%s', d.defaclrole::regrole::text, n.nspname, d.defaclobjtype),
  'DEFAULT_PRIVILEGES',
  case when d.defaclrole::regrole::text = 'postgres' then 'VENTO_OS' else 'MANAGED_PLATFORM' end,
  'LEGACY_EXPOSED',
  d.defaclrole::regrole::text,
  '{}'::jsonb,
  jsonb_build_object('acl', d.defaclacl::text),
  '[]'::jsonb,
  jsonb_build_object('authenticated_present', true),
  'DEFAULT_ACL',
  format('%s:%s:%s', d.defaclrole::regrole::text, n.nspname, d.defaclobjtype),
  null,
  null,
  '[]'::jsonb,
  '[]'::jsonb,
  'DEFAULT_PRIVILEGE_POLICY',
  null,
  case when d.defaclrole::regrole::text = 'postgres' then 'VENTO_OS' else 'SUPABASE_PLATFORM' end,
  null,
  case
    when d.defaclrole::regrole::text = 'postgres' and n.nspname = 'public'
      then 'NARROW_PRIVILEGES'
    else 'BLOCKED_PENDING_EVIDENCE'
  end,
  null,
  '[]'::jsonb,
  '[]'::jsonb,
  '[]'::jsonb,
  null,
  case
    when d.defaclrole::regrole::text = 'postgres' and n.nspname = 'public'
      then 'HARDEN_FUTURE_OBJECT_DEFAULTS'
    else 'MANAGED_PLATFORM_UNCHANGED'
  end,
  case
    when d.defaclrole::regrole::text = 'postgres' and n.nspname = 'public'
      then 'APPLY_NOW'
    else 'OWNER_AUTHORITY_REQUIRED'
  end,
  'AUTH-DB-004::GLOBAL',
  md5(d.defaclacl::text),
  'FORWARD CORRECTION ONLY; EXPLICITLY GRANT ONLY A CONTRACTED MINIMUM TO FUTURE OBJECTS',
  jsonb_build_object('source', 'pg_catalog.pg_default_acl')
from pg_catalog.pg_default_acl d
join pg_catalog.pg_namespace n on n.oid = d.defaclnamespace
where n.nspname = 'public'
  and exists (
    select 1
    from aclexplode(d.defaclacl) a
    where a.grantee = 'authenticated'::regrole::oid
  );

do $auth_db_004_manifest$
declare
  v_duplicates bigint;
  v_invalid_dispositions bigint;
  v_vital bigint;
  v_target bigint;
  v_postgres_defaults bigint;
begin
  select count(*)
  into v_duplicates
  from (
    select object_kind, qualified_object_identity
    from auth_db_004_privilege_manifest
    group by object_kind, qualified_object_identity
    having count(*) > 1
  ) d;

  if v_duplicates <> 0 then
    raise exception 'AUTH_DB_004_MANIFEST_DUPLICATES: %', v_duplicates;
  end if;

  select count(*)
  into v_invalid_dispositions
  from auth_db_004_privilege_manifest
  where canonical_disposition not in (
    'KEEP_AND_HARDEN',
    'MOVE_TO_API',
    'NARROW_PRIVILEGES',
    'REPLACE_WITH_COMMAND_OR_QUERY',
    'PRIVATE_ONLY',
    'TRANSITIONAL_COMPATIBILITY',
    'RETIRE',
    'BLOCKED_PENDING_EVIDENCE'
  );

  if v_invalid_dispositions <> 0 then
    raise exception 'AUTH_DB_004_INVALID_DISPOSITIONS: %', v_invalid_dispositions;
  end if;

  select count(*)
  into v_vital
  from auth_db_004_privilege_manifest
  where qualified_object_identity like 'vital.%';

  if v_vital <> 0 then
    raise exception 'AUTH_DB_004_VITAL_BOUNDARY_VIOLATION: %', v_vital;
  end if;

  select count(*)
  into v_target
  from auth_db_004_privilege_manifest
  where object_kind = 'TRIGGER_FUNCTION'
    and qualified_object_identity = 'pass.validate_catalog_item_product_site()'
    and canonical_disposition = 'RETIRE';

  if v_target <> 1 then
    raise exception 'AUTH_DB_004_TARGET_FUNCTION_NOT_CLASSIFIED';
  end if;

  select count(*)
  into v_postgres_defaults
  from auth_db_004_privilege_manifest
  where object_kind = 'DEFAULT_PRIVILEGES'
    and qualified_object_identity in (
      'DEFAULT_PRIVILEGES:postgres:public:r',
      'DEFAULT_PRIVILEGES:postgres:public:f',
      'DEFAULT_PRIVILEGES:postgres:public:S'
    )
    and canonical_disposition = 'NARROW_PRIVILEGES';

  if v_postgres_defaults <> 3 then
    raise exception 'AUTH_DB_004_POSTGRES_PUBLIC_DEFAULTS_DRIFT: expected 3 observed %', v_postgres_defaults;
  end if;
end
$auth_db_004_manifest$;

do $auth_db_004_target_guard$
declare
  v_oid oid := to_regprocedure('pass.validate_catalog_item_product_site()');
  v_body_md5 text;
  v_trigger_associations bigint;
begin
  if v_oid is null then
    raise exception 'AUTH_DB_004_TARGET_FUNCTION_MISSING';
  end if;

  select md5(replace(p.prosrc, E'\r\n', E'\n'))
  into v_body_md5
  from pg_catalog.pg_proc p
  where p.oid = v_oid;

  if v_body_md5 <> 'e51c9a8b3e91f8c2269e55d47a27ce6b' then
    raise exception 'AUTH_DB_004_TARGET_FUNCTION_BODY_DRIFT: %', v_body_md5;
  end if;

  select count(*)
  into v_trigger_associations
  from pg_catalog.pg_trigger t
  where t.tgfoid = v_oid
    and not t.tgisinternal;

  if v_trigger_associations <> 1 then
    raise exception 'AUTH_DB_004_TARGET_TRIGGER_ASSOCIATIONS_DRIFT: %', v_trigger_associations;
  end if;

  if not has_function_privilege('authenticated', v_oid, 'EXECUTE') then
    raise exception 'AUTH_DB_004_TARGET_AUTHENTICATED_EXECUTE_NOT_PRESENT';
  end if;

  if has_function_privilege('anon', v_oid, 'EXECUTE') then
    raise exception 'AUTH_DB_004_TARGET_ANON_EXECUTE_UNEXPECTED';
  end if;

  if not has_function_privilege('service_role', v_oid, 'EXECUTE') then
    raise exception 'AUTH_DB_004_TARGET_SERVICE_EXECUTE_MISSING';
  end if;
end
$auth_db_004_target_guard$;

alter default privileges for role postgres in schema public
  revoke all on tables from authenticated;

alter default privileges for role postgres in schema public
  revoke all on functions from authenticated;

alter default privileges for role postgres in schema public
  revoke all on sequences from authenticated;

revoke execute on function pass.validate_catalog_item_product_site() from authenticated;

do $auth_db_004_postconditions$
declare
  v_remaining_defaults bigint;
  v_managed_defaults bigint;
  v_oid oid := to_regprocedure('pass.validate_catalog_item_product_site()');
begin
  select count(*)
  into v_remaining_defaults
  from pg_catalog.pg_default_acl d
  join pg_catalog.pg_namespace n on n.oid = d.defaclnamespace
  where d.defaclrole = 'postgres'::regrole::oid
    and n.nspname = 'public'
    and d.defaclobjtype in ('r', 'f', 'S')
    and exists (
      select 1
      from aclexplode(d.defaclacl) a
      where a.grantee = 'authenticated'::regrole::oid
    );

  if v_remaining_defaults <> 0 then
    raise exception 'AUTH_DB_004_POSTGRES_DEFAULTS_NOT_HARDENED: %', v_remaining_defaults;
  end if;

  select count(*)
  into v_managed_defaults
  from pg_catalog.pg_default_acl d
  join pg_catalog.pg_namespace n on n.oid = d.defaclnamespace
  where d.defaclrole = 'supabase_admin'::regrole::oid
    and n.nspname = 'public'
    and d.defaclobjtype in ('r', 'f', 'S')
    and exists (
      select 1
      from aclexplode(d.defaclacl) a
      where a.grantee = 'authenticated'::regrole::oid
    );

  if v_managed_defaults <> 3 then
    raise exception 'AUTH_DB_004_MANAGED_DEFAULTS_CHANGED: expected 3 observed %', v_managed_defaults;
  end if;

  if has_function_privilege('authenticated', v_oid, 'EXECUTE') then
    raise exception 'AUTH_DB_004_TARGET_AUTHENTICATED_EXECUTE_STILL_PRESENT';
  end if;

  if has_function_privilege('anon', v_oid, 'EXECUTE') then
    raise exception 'AUTH_DB_004_TARGET_ANON_EXECUTE_CHANGED';
  end if;

  if not has_function_privilege('service_role', v_oid, 'EXECUTE') then
    raise exception 'AUTH_DB_004_TARGET_SERVICE_EXECUTE_CHANGED';
  end if;
end
$auth_db_004_postconditions$;

commit;
