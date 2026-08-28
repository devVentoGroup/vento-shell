begin;

create temporary table auth_db_016_target_schemas (
  canonical_schema_name text primary key,
  schema_class text not null,
  v_schema_id text,
  v_domain_id text,
  business_authority text not null
) on commit drop;

insert into auth_db_016_target_schemas (
  canonical_schema_name,
  schema_class,
  v_schema_id,
  v_domain_id,
  business_authority
)
values
  ('org_governance', 'OWNER_SCHEMA', 'VSCHEMA-001', 'VDOM-001', 'DOMAIN_OWNER'),
  ('recruiting', 'OWNER_SCHEMA', 'VSCHEMA-002', 'VDOM-002', 'DOMAIN_OWNER'),
  ('workforce', 'OWNER_SCHEMA', 'VSCHEMA-003', 'VDOM-003', 'DOMAIN_OWNER'),
  ('work_scheduling', 'OWNER_SCHEMA', 'VSCHEMA-004', 'VDOM-004', 'DOMAIN_OWNER'),
  ('attendance', 'OWNER_SCHEMA', 'VSCHEMA-005', 'VDOM-005', 'DOMAIN_OWNER'),
  ('payroll', 'OWNER_SCHEMA', 'VSCHEMA-006', 'VDOM-006', 'DOMAIN_OWNER'),
  ('operational_compliance', 'OWNER_SCHEMA', 'VSCHEMA-007', 'VDOM-007', 'DOMAIN_OWNER'),
  ('product_catalog', 'OWNER_SCHEMA', 'VSCHEMA-008', 'VDOM-008', 'DOMAIN_OWNER'),
  ('recipes', 'OWNER_SCHEMA', 'VSCHEMA-009', 'VDOM-009', 'DOMAIN_OWNER'),
  ('commercial_offer', 'OWNER_SCHEMA', 'VSCHEMA-010', 'VDOM-010', 'DOMAIN_OWNER'),
  ('procurement', 'OWNER_SCHEMA', 'VSCHEMA-011', 'VDOM-011', 'DOMAIN_OWNER'),
  ('inventory', 'OWNER_SCHEMA', 'VSCHEMA-012', 'VDOM-012', 'DOMAIN_OWNER'),
  ('assets', 'OWNER_SCHEMA', 'VSCHEMA-013', 'VDOM-013', 'DOMAIN_OWNER'),
  ('production', 'OWNER_SCHEMA', 'VSCHEMA-014', 'VDOM-014', 'DOMAIN_OWNER'),
  ('sales_orders', 'OWNER_SCHEMA', 'VSCHEMA-015', 'VDOM-015', 'DOMAIN_OWNER'),
  ('payments', 'OWNER_SCHEMA', 'VSCHEMA-016', 'VDOM-016', 'DOMAIN_OWNER'),
  ('customer_engagement', 'OWNER_SCHEMA', 'VSCHEMA-017', 'VDOM-017', 'DOMAIN_OWNER'),
  ('logistics', 'OWNER_SCHEMA', 'VSCHEMA-018', 'VDOM-018', 'DOMAIN_OWNER'),
  ('finance', 'OWNER_SCHEMA', 'VSCHEMA-019', 'VDOM-019', 'DOMAIN_OWNER'),
  ('facilities', 'OWNER_SCHEMA', 'VSCHEMA-020', 'VDOM-020', 'DOMAIN_OWNER'),
  ('marketing', 'OWNER_SCHEMA', 'VSCHEMA-021', 'VDOM-021', 'DOMAIN_OWNER'),
  ('technology_operations', 'OWNER_SCHEMA', 'VSCHEMA-022', 'VDOM-022', 'DOMAIN_OWNER'),
  ('identity_access', 'OWNER_SCHEMA', 'VSCHEMA-023', 'VDOM-023', 'DOMAIN_OWNER'),
  ('business_records', 'OWNER_SCHEMA', 'VSCHEMA-024', 'VDOM-024', 'DOMAIN_OWNER'),
  ('business_insights', 'OWNER_SCHEMA', 'VSCHEMA-025', 'VDOM-025', 'DOMAIN_OWNER'),
  ('operational_continuity', 'OWNER_SCHEMA', 'VSCHEMA-026', 'VDOM-026', 'DOMAIN_OWNER'),
  ('api', 'VENTO_EXPOSED_CONTRACT_LAYER', null, null, 'NONE'),
  ('app_private', 'VENTO_PRIVATE_TECHNICAL_LAYER', null, null, 'NONE'),
  ('audit', 'VENTO_TRANSVERSAL_AUDIT_EVENT_LAYER', null, null, 'NONE');

do $auth_db_016_contract$
declare
  v_count bigint;
begin
  select count(*)
  into v_count
  from auth_db_016_target_schemas;

  if v_count <> 29 then
    raise exception
      'AUTH_DB_016_TARGET_CARDINALITY_INVALID:%',
      v_count;
  end if;

  select count(*)
  into v_count
  from auth_db_016_target_schemas
  where schema_class = 'OWNER_SCHEMA';

  if v_count <> 26 then
    raise exception
      'AUTH_DB_016_OWNER_SCHEMA_CARDINALITY_INVALID:%',
      v_count;
  end if;

  select count(*)
  into v_count
  from auth_db_016_target_schemas
  where schema_class <> 'OWNER_SCHEMA';

  if v_count <> 3 then
    raise exception
      'AUTH_DB_016_TRANSVERSAL_SCHEMA_CARDINALITY_INVALID:%',
      v_count;
  end if;

  if exists (
    select 1
    from auth_db_016_target_schemas
    where schema_class = 'OWNER_SCHEMA'
      and (
        v_schema_id is null
        or v_domain_id is null
        or v_schema_id !~ '^VSCHEMA-[0-9]{3}$'
        or v_domain_id !~ '^VDOM-[0-9]{3}$'
      )
  ) then
    raise exception
      'AUTH_DB_016_OWNER_IDENTITY_INCOMPLETE';
  end if;

  select count(distinct v_schema_id)
  into v_count
  from auth_db_016_target_schemas
  where schema_class = 'OWNER_SCHEMA';

  if v_count <> 26 then
    raise exception
      'AUTH_DB_016_VSCHEMA_IDENTITY_DUPLICATE:%',
      v_count;
  end if;

  select count(distinct v_domain_id)
  into v_count
  from auth_db_016_target_schemas
  where schema_class = 'OWNER_SCHEMA';

  if v_count <> 26 then
    raise exception
      'AUTH_DB_016_VDOMAIN_IDENTITY_DUPLICATE:%',
      v_count;
  end if;

  if exists (
    select 1
    from auth_db_016_target_schemas
    where schema_class <> 'OWNER_SCHEMA'
      and (
        v_schema_id is not null
        or v_domain_id is not null
        or business_authority <> 'NONE'
      )
  ) then
    raise exception
      'AUTH_DB_016_TRANSVERSAL_AUTHORITY_INVALID';
  end if;

  if exists (
    select 1
    from auth_db_016_target_schemas
    where canonical_schema_name in (
      'auth',
      'extensions',
      'graphql',
      'graphql_public',
      'information_schema',
      'net',
      'pg_catalog',
      'realtime',
      'storage',
      'supabase_functions',
      'supabase_migrations',
      'vault',
      'cron',
      'vital',
      'public',
      'club',
      'pass',
      'pos',
      'talento',
      'viso'
    )
  ) then
    raise exception
      'AUTH_DB_016_TARGET_BOUNDARY_INVALID';
  end if;
end
$auth_db_016_contract$;

create temporary table auth_db_016_schema_manifest (
  canonical_schema_name text primary key,
  schema_class text not null,
  v_schema_id_if_applicable text,
  v_domain_id_if_applicable text,
  expected_state text not null,
  observed_state_before text not null,
  observed_state_after text not null,
  postgres_owner_before_if_existing text,
  postgres_owner_after text,
  client_usage jsonb not null,
  client_create jsonb not null,
  exposed_in_data_api text not null,
  migration_reference text not null,
  environment text not null,
  drift_result text not null,
  rollback_or_forward_recovery text not null,
  evidence jsonb not null
) on commit drop;

insert into auth_db_016_schema_manifest (
  canonical_schema_name,
  schema_class,
  v_schema_id_if_applicable,
  v_domain_id_if_applicable,
  expected_state,
  observed_state_before,
  observed_state_after,
  postgres_owner_before_if_existing,
  postgres_owner_after,
  client_usage,
  client_create,
  exposed_in_data_api,
  migration_reference,
  environment,
  drift_result,
  rollback_or_forward_recovery,
  evidence
)
select
  t.canonical_schema_name,
  t.schema_class,
  t.v_schema_id,
  t.v_domain_id,
  'EXISTS',
  case
    when n.oid is null then 'MISSING'
    else 'EXISTING'
  end,
  'PENDING',
  case
    when n.oid is null then null
    else pg_get_userbyid(n.nspowner)
  end,
  null,
  jsonb_build_object(
    'anon',
    case
      when n.oid is null then null
      else has_schema_privilege(
        'anon',
        n.oid,
        'USAGE'
      )
    end,
    'authenticated',
    case
      when n.oid is null then null
      else has_schema_privilege(
        'authenticated',
        n.oid,
        'USAGE'
      )
    end
  ),
  jsonb_build_object(
    'anon',
    case
      when n.oid is null then null
      else has_schema_privilege(
        'anon',
        n.oid,
        'CREATE'
      )
    end,
    'authenticated',
    case
      when n.oid is null then null
      else has_schema_privilege(
        'authenticated',
        n.oid,
        'CREATE'
      )
    end
  ),
  'NOT_CHANGED_BY_AUTH_DB_016',
  'AUTH-DB-016::GLOBAL',
  'MIGRATION_TARGET',
  'PENDING',
  'FORWARD_FIX_ONLY_NO_DROP_SCHEMA_CASCADE',
  jsonb_build_object(
    'source',
    'pg_catalog.pg_namespace',
    'business_authority',
    t.business_authority,
    'owner_before',
    case
      when n.oid is null then null
      else pg_get_userbyid(n.nspowner)
    end,
    'schema_acl_before',
    case
      when n.oid is null then null
      else md5(coalesce(n.nspacl::text, ''))
    end
  )
from auth_db_016_target_schemas t
left join pg_catalog.pg_namespace n
  on n.nspname = t.canonical_schema_name;

create temporary table auth_db_016_existing_target_snapshot
on commit drop
as
select
  n.nspname as schema_name,
  n.nspowner,
  md5(coalesce(n.nspacl::text, '')) as schema_acl_hash,
  (
    select count(*)
    from pg_catalog.pg_class c
    where c.relnamespace = n.oid
      and c.relkind in (
        'r',
        'p',
        'v',
        'm',
        'f',
        'S'
      )
  ) as relation_count,
  (
    select count(*)
    from pg_catalog.pg_proc p
    where p.pronamespace = n.oid
      and p.prokind in ('f', 'p')
  ) as routine_count,
  (
    select count(*)
    from pg_catalog.pg_type ty
    where ty.typnamespace = n.oid
      and ty.typtype in ('e', 'd')
  ) as named_type_count
from pg_catalog.pg_namespace n
join auth_db_016_target_schemas t
  on t.canonical_schema_name = n.nspname;

create temporary table auth_db_016_legacy_schema_snapshot
on commit drop
as
select
  n.nspname as schema_name,
  n.nspowner,
  md5(coalesce(n.nspacl::text, '')) as schema_acl_hash,
  (
    select count(*)
    from pg_catalog.pg_class c
    where c.relnamespace = n.oid
      and c.relkind in (
        'r',
        'p',
        'v',
        'm',
        'f',
        'S'
      )
  ) as relation_count,
  (
    select count(*)
    from pg_catalog.pg_proc p
    where p.pronamespace = n.oid
      and p.prokind in ('f', 'p')
  ) as routine_count,
  (
    select count(*)
    from pg_catalog.pg_type ty
    where ty.typnamespace = n.oid
      and ty.typtype in ('e', 'd')
  ) as named_type_count
from pg_catalog.pg_namespace n
where n.nspname in (
  'club',
  'pass',
  'pos',
  'public',
  'talento',
  'viso',
  'vital'
);

create temporary table auth_db_016_default_acl_snapshot
on commit drop
as
select
  d.defaclrole,
  d.defaclnamespace,
  d.defaclobjtype,
  md5(
    coalesce(
      d.defaclacl::text,
      ''
    )
  ) as acl_hash
from pg_catalog.pg_default_acl d;

create temporary table auth_db_016_role_setting_snapshot
on commit drop
as
select
  s.setdatabase,
  s.setrole,
  md5(
    coalesce(
      array_to_string(
        s.setconfig,
        E'\n'
      ),
      ''
    )
  ) as setting_hash
from pg_catalog.pg_db_role_setting s;

do $auth_db_016_preconditions$
declare
  v_count bigint;
begin
  select count(*)
  into v_count
  from auth_db_016_schema_manifest
  where observed_state_before = 'EXISTING';

  if v_count <> 2 then
    raise exception
      'AUTH_DB_016_EXISTING_TARGET_BASELINE_DRIFT:%',
      v_count;
  end if;

  select count(*)
  into v_count
  from auth_db_016_schema_manifest
  where observed_state_before = 'EXISTING'
    and canonical_schema_name in (
      'app_private',
      'payments'
    );

  if v_count <> 2 then
    raise exception
      'AUTH_DB_016_EXISTING_TARGET_IDENTITY_DRIFT:%',
      v_count;
  end if;

  if exists (
    select 1
    from auth_db_016_schema_manifest
    where canonical_schema_name in (
      'app_private',
      'payments'
    )
      and observed_state_before <> 'EXISTING'
  ) then
    raise exception
      'AUTH_DB_016_REQUIRED_EXISTING_TARGET_MISSING';
  end if;

  select count(*)
  into v_count
  from auth_db_016_legacy_schema_snapshot;

  if v_count <> 7 then
    raise exception
      'AUTH_DB_016_LEGACY_BOUNDARY_BASELINE_DRIFT:%',
      v_count;
  end if;

  if exists (
    select 1
    from pg_catalog.pg_namespace n
    join auth_db_016_target_schemas t
      on t.canonical_schema_name = n.nspname
    where
      has_schema_privilege(
        'anon',
        n.oid,
        'USAGE'
      )
      or has_schema_privilege(
        'anon',
        n.oid,
        'CREATE'
      )
      or has_schema_privilege(
        'authenticated',
        n.oid,
        'CREATE'
      )
      or (
        n.nspname <> 'payments'
        and has_schema_privilege(
          'authenticated',
          n.oid,
          'USAGE'
        )
      )
  ) then
    raise exception
      'AUTH_DB_016_EXISTING_TARGET_CLIENT_ACL_DRIFT';
  end if;

  if not has_schema_privilege(
    'authenticated',
    'payments',
    'USAGE'
  ) then
    raise exception
      'AUTH_DB_016_PAYMENTS_AUTHENTICATED_USAGE_BASELINE_MISSING';
  end if;

  if exists (
    select 1
    from pg_catalog.pg_namespace n
    join auth_db_016_target_schemas t
      on t.canonical_schema_name = n.nspname
    where pg_get_userbyid(n.nspowner) in (
      'anon',
      'authenticated',
      'service_role'
    )
  ) then
    raise exception
      'AUTH_DB_016_EXISTING_TARGET_CLIENT_OWNER_INVALID';
  end if;

  if exists (
    select 1
    from pg_catalog.pg_namespace n
    where lower(n.nspname) in (
      select canonical_schema_name
      from auth_db_016_target_schemas
    )
      and not exists (
        select 1
        from auth_db_016_target_schemas t
        where t.canonical_schema_name = n.nspname
      )
  ) then
    raise exception
      'AUTH_DB_016_UNEXPECTED_TARGET_NAME_VARIANT';
  end if;
end
$auth_db_016_preconditions$;

do $auth_db_016_create$
declare
  r record;
begin
  for r in
    select canonical_schema_name
    from auth_db_016_schema_manifest
    where observed_state_before = 'MISSING'
    order by canonical_schema_name
  loop
    execute format(
      'create schema %I',
      r.canonical_schema_name
    );

    execute format(
      'revoke all privileges on schema %I from public, anon, authenticated',
      r.canonical_schema_name
    );
  end loop;
end
$auth_db_016_create$;

update auth_db_016_schema_manifest m
set
  observed_state_after = 'EXISTING',
  postgres_owner_after = pg_get_userbyid(n.nspowner),
  client_usage = jsonb_build_object(
    'anon',
    has_schema_privilege(
      'anon',
      n.oid,
      'USAGE'
    ),
    'authenticated',
    has_schema_privilege(
      'authenticated',
      n.oid,
      'USAGE'
    )
  ),
  client_create = jsonb_build_object(
    'anon',
    has_schema_privilege(
      'anon',
      n.oid,
      'CREATE'
    ),
    'authenticated',
    has_schema_privilege(
      'authenticated',
      n.oid,
      'CREATE'
    )
  ),
  evidence = m.evidence || jsonb_build_object(
    'owner_after',
    pg_get_userbyid(n.nspowner),
    'schema_acl_after',
    md5(coalesce(n.nspacl::text, '')),
    'created_by_auth_db_016',
    m.observed_state_before = 'MISSING'
  )
from pg_catalog.pg_namespace n
where n.nspname = m.canonical_schema_name;

do $auth_db_016_postconditions$
declare
  v_count bigint;
begin
  select count(*)
  into v_count
  from pg_catalog.pg_namespace n
  join auth_db_016_target_schemas t
    on t.canonical_schema_name = n.nspname;

  if v_count <> 29 then
    raise exception
      'AUTH_DB_016_TARGET_POSTCONDITION:%',
      v_count;
  end if;

  select count(*)
  into v_count
  from auth_db_016_schema_manifest
  where observed_state_before = 'MISSING';

  if v_count <> 27 then
    raise exception
      'AUTH_DB_016_CREATED_TARGET_COUNT_INVALID:%',
      v_count;
  end if;

  if exists (
    select 1
    from auth_db_016_schema_manifest
    where
      observed_state_after <> 'EXISTING'
      or postgres_owner_after is null
  ) then
    raise exception
      'AUTH_DB_016_MANIFEST_AFTER_STATE_INCOMPLETE';
  end if;

  select count(*)
  into v_count
  from pg_catalog.pg_namespace n
  join auth_db_016_target_schemas t
    on t.canonical_schema_name = n.nspname
  where
    has_schema_privilege(
      'anon',
      n.oid,
      'CREATE'
    )
    or has_schema_privilege(
      'authenticated',
      n.oid,
      'CREATE'
    );

  if v_count <> 0 then
    raise exception
      'AUTH_DB_016_CLIENT_CREATE_PRESENT:%',
      v_count;
  end if;

  select count(*)
  into v_count
  from pg_catalog.pg_namespace n
  join auth_db_016_target_schemas t
    on t.canonical_schema_name = n.nspname
  where has_schema_privilege(
    'anon',
    n.oid,
    'USAGE'
  );

  if v_count <> 0 then
    raise exception
      'AUTH_DB_016_ANON_USAGE_PRESENT:%',
      v_count;
  end if;

  select count(*)
  into v_count
  from pg_catalog.pg_namespace n
  join auth_db_016_target_schemas t
    on t.canonical_schema_name = n.nspname
  where n.nspname <> 'payments'
    and has_schema_privilege(
      'authenticated',
      n.oid,
      'USAGE'
    );

  if v_count <> 0 then
    raise exception
      'AUTH_DB_016_NEW_AUTHENTICATED_USAGE_PRESENT:%',
      v_count;
  end if;

  if not has_schema_privilege(
    'authenticated',
    'payments',
    'USAGE'
  ) then
    raise exception
      'AUTH_DB_016_PAYMENTS_AUTHENTICATED_USAGE_CHANGED';
  end if;

  select count(*)
  into v_count
  from pg_catalog.pg_class c
  join pg_catalog.pg_namespace n
    on n.oid = c.relnamespace
  join auth_db_016_schema_manifest m
    on m.canonical_schema_name = n.nspname
  where m.observed_state_before = 'MISSING'
    and c.relkind in (
      'r',
      'p',
      'v',
      'm',
      'f',
      'S'
    );

  if v_count <> 0 then
    raise exception
      'AUTH_DB_016_NEW_SCHEMA_RELATION_FOUND:%',
      v_count;
  end if;

  select count(*)
  into v_count
  from pg_catalog.pg_proc p
  join pg_catalog.pg_namespace n
    on n.oid = p.pronamespace
  join auth_db_016_schema_manifest m
    on m.canonical_schema_name = n.nspname
  where m.observed_state_before = 'MISSING'
    and p.prokind in ('f', 'p');

  if v_count <> 0 then
    raise exception
      'AUTH_DB_016_NEW_SCHEMA_ROUTINE_FOUND:%',
      v_count;
  end if;

  select count(*)
  into v_count
  from pg_catalog.pg_type ty
  join pg_catalog.pg_namespace n
    on n.oid = ty.typnamespace
  join auth_db_016_schema_manifest m
    on m.canonical_schema_name = n.nspname
  where m.observed_state_before = 'MISSING'
    and ty.typtype in ('e', 'd');

  if v_count <> 0 then
    raise exception
      'AUTH_DB_016_NEW_SCHEMA_TYPE_FOUND:%',
      v_count;
  end if;

  select count(*)
  into v_count
  from pg_catalog.pg_policies p
  join auth_db_016_schema_manifest m
    on m.canonical_schema_name = p.schemaname
  where m.observed_state_before = 'MISSING';

  if v_count <> 0 then
    raise exception
      'AUTH_DB_016_NEW_SCHEMA_POLICY_FOUND:%',
      v_count;
  end if;

  if exists (
    select 1
    from auth_db_016_existing_target_snapshot s
    left join pg_catalog.pg_namespace n
      on n.nspname = s.schema_name
    where
      n.oid is null
      or n.nspowner is distinct from s.nspowner
      or md5(
        coalesce(
          n.nspacl::text,
          ''
        )
      ) is distinct from s.schema_acl_hash
      or (
        select count(*)
        from pg_catalog.pg_class c
        where c.relnamespace = n.oid
          and c.relkind in (
            'r',
            'p',
            'v',
            'm',
            'f',
            'S'
          )
      ) is distinct from s.relation_count
      or (
        select count(*)
        from pg_catalog.pg_proc p
        where p.pronamespace = n.oid
          and p.prokind in ('f', 'p')
      ) is distinct from s.routine_count
      or (
        select count(*)
        from pg_catalog.pg_type ty
        where ty.typnamespace = n.oid
          and ty.typtype in ('e', 'd')
      ) is distinct from s.named_type_count
  ) then
    raise exception
      'AUTH_DB_016_EXISTING_TARGET_STATE_CHANGED';
  end if;

  if exists (
    select 1
    from auth_db_016_legacy_schema_snapshot s
    left join pg_catalog.pg_namespace n
      on n.nspname = s.schema_name
    where
      n.oid is null
      or n.nspowner is distinct from s.nspowner
      or md5(
        coalesce(
          n.nspacl::text,
          ''
        )
      ) is distinct from s.schema_acl_hash
      or (
        select count(*)
        from pg_catalog.pg_class c
        where c.relnamespace = n.oid
          and c.relkind in (
            'r',
            'p',
            'v',
            'm',
            'f',
            'S'
          )
      ) is distinct from s.relation_count
      or (
        select count(*)
        from pg_catalog.pg_proc p
        where p.pronamespace = n.oid
          and p.prokind in ('f', 'p')
      ) is distinct from s.routine_count
      or (
        select count(*)
        from pg_catalog.pg_type ty
        where ty.typnamespace = n.oid
          and ty.typtype in ('e', 'd')
      ) is distinct from s.named_type_count
  ) then
    raise exception
      'AUTH_DB_016_LEGACY_OR_VITAL_STATE_CHANGED';
  end if;

  select count(*)
  into v_count
  from (
    (
      select
        d.defaclrole,
        d.defaclnamespace,
        d.defaclobjtype,
        md5(
          coalesce(
            d.defaclacl::text,
            ''
          )
        ) as acl_hash
      from pg_catalog.pg_default_acl d

      except

      select
        defaclrole,
        defaclnamespace,
        defaclobjtype,
        acl_hash
      from auth_db_016_default_acl_snapshot
    )

    union all

    (
      select
        defaclrole,
        defaclnamespace,
        defaclobjtype,
        acl_hash
      from auth_db_016_default_acl_snapshot

      except

      select
        d.defaclrole,
        d.defaclnamespace,
        d.defaclobjtype,
        md5(
          coalesce(
            d.defaclacl::text,
            ''
          )
        ) as acl_hash
      from pg_catalog.pg_default_acl d
    )
  ) drift;

  if v_count <> 0 then
    raise exception
      'AUTH_DB_016_DEFAULT_ACL_CHANGED:%',
      v_count;
  end if;

  select count(*)
  into v_count
  from (
    (
      select
        s.setdatabase,
        s.setrole,
        md5(
          coalesce(
            array_to_string(
              s.setconfig,
              E'\n'
            ),
            ''
          )
        ) as setting_hash
      from pg_catalog.pg_db_role_setting s

      except

      select
        setdatabase,
        setrole,
        setting_hash
      from auth_db_016_role_setting_snapshot
    )

    union all

    (
      select
        setdatabase,
        setrole,
        setting_hash
      from auth_db_016_role_setting_snapshot

      except

      select
        s.setdatabase,
        s.setrole,
        md5(
          coalesce(
            array_to_string(
              s.setconfig,
              E'\n'
            ),
            ''
          )
        ) as setting_hash
      from pg_catalog.pg_db_role_setting s
    )
  ) drift;

  if v_count <> 0 then
    raise exception
      'AUTH_DB_016_ROLE_SETTINGS_CHANGED:%',
      v_count;
  end if;

  if exists (
    select 1
    from pg_catalog.pg_namespace n
    join auth_db_016_schema_manifest m
      on m.canonical_schema_name = n.nspname
    where m.observed_state_before = 'MISSING'
      and pg_get_userbyid(n.nspowner) in (
        'anon',
        'authenticated',
        'service_role'
      )
  ) then
    raise exception
      'AUTH_DB_016_NEW_SCHEMA_CLIENT_OWNER_INVALID';
  end if;

  if exists (
    select 1
    from auth_db_016_target_schemas
    where canonical_schema_name = 'vital'
  ) then
    raise exception
      'AUTH_DB_016_VITAL_ABSORBED';
  end if;
end
$auth_db_016_postconditions$;

update auth_db_016_schema_manifest
set
  drift_result = 'PASS',
  evidence = evidence || jsonb_build_object(
    'target_cardinality',
    29,
    'owner_schema_cardinality',
    26,
    'transversal_schema_cardinality',
    3,
    'new_schema_count',
    27,
    'persistent_objects_created',
    0,
    'client_create_added',
    0,
    'anon_usage_added',
    0,
    'data_api_configuration_changed',
    false,
    'legacy_schema_changes',
    0,
    'vital_changes',
    0
  );

do $auth_db_016_manifest_check$
declare
  v_count bigint;
begin
  select count(*)
  into v_count
  from auth_db_016_schema_manifest;

  if v_count <> 29 then
    raise exception
      'AUTH_DB_016_MANIFEST_CARDINALITY_INVALID:%',
      v_count;
  end if;

  select count(*)
  into v_count
  from auth_db_016_schema_manifest
  where drift_result = 'PASS'
    and observed_state_after = 'EXISTING';

  if v_count <> 29 then
    raise exception
      'AUTH_DB_016_MANIFEST_NOT_CERTIFIED:%',
      v_count;
  end if;
end
$auth_db_016_manifest_check$;

commit;
