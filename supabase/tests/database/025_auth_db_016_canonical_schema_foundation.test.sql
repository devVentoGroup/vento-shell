-- VENTO_DB_TEST_CATEGORY: SCHEMA
begin;

create extension if not exists pgtap
with schema extensions;

create temporary table auth_db_016_expected_schemas (
  schema_name text primary key,
  schema_class text not null,
  existed_before boolean not null
) on commit drop;

insert into auth_db_016_expected_schemas (
  schema_name,
  schema_class,
  existed_before
)
values
  ('org_governance', 'OWNER_SCHEMA', false),
  ('recruiting', 'OWNER_SCHEMA', false),
  ('workforce', 'OWNER_SCHEMA', false),
  ('work_scheduling', 'OWNER_SCHEMA', false),
  ('attendance', 'OWNER_SCHEMA', false),
  ('payroll', 'OWNER_SCHEMA', false),
  ('operational_compliance', 'OWNER_SCHEMA', false),
  ('product_catalog', 'OWNER_SCHEMA', false),
  ('recipes', 'OWNER_SCHEMA', false),
  ('commercial_offer', 'OWNER_SCHEMA', false),
  ('procurement', 'OWNER_SCHEMA', false),
  ('inventory', 'OWNER_SCHEMA', false),
  ('assets', 'OWNER_SCHEMA', false),
  ('production', 'OWNER_SCHEMA', false),
  ('sales_orders', 'OWNER_SCHEMA', false),
  ('payments', 'OWNER_SCHEMA', true),
  ('customer_engagement', 'OWNER_SCHEMA', false),
  ('logistics', 'OWNER_SCHEMA', false),
  ('finance', 'OWNER_SCHEMA', false),
  ('facilities', 'OWNER_SCHEMA', false),
  ('marketing', 'OWNER_SCHEMA', false),
  ('technology_operations', 'OWNER_SCHEMA', false),
  ('identity_access', 'OWNER_SCHEMA', false),
  ('business_records', 'OWNER_SCHEMA', false),
  ('business_insights', 'OWNER_SCHEMA', false),
  ('operational_continuity', 'OWNER_SCHEMA', false),
  ('api', 'VENTO_EXPOSED_CONTRACT_LAYER', false),
  ('app_private', 'VENTO_PRIVATE_TECHNICAL_LAYER', true),
  ('audit', 'VENTO_TRANSVERSAL_AUDIT_EVENT_LAYER', false);

select plan(26);

select is(
  (
    select count(*)
    from auth_db_016_expected_schemas
  ),
  29::bigint,
  'AUTH-DB-016 target contract contains exactly 29 schemas'
);

select is(
  (
    select count(*)
    from auth_db_016_expected_schemas e
    where to_regnamespace(e.schema_name) is null
  ),
  0::bigint,
  'all 29 target schemas exist'
);

select is(
  (
    select count(*)
    from auth_db_016_expected_schemas e
    where e.schema_class = 'OWNER_SCHEMA'
      and to_regnamespace(e.schema_name) is not null
  ),
  26::bigint,
  'all 26 owner schemas exist'
);

select is(
  (
    select count(*)
    from auth_db_016_expected_schemas e
    where e.schema_class <> 'OWNER_SCHEMA'
      and to_regnamespace(e.schema_name) is not null
  ),
  3::bigint,
  'api app_private and audit exist'
);

select ok(
  to_regnamespace('app_private') is not null,
  'app_private is preserved'
);

select ok(
  to_regnamespace('payments') is not null,
  'payments is preserved'
);

select ok(
  to_regnamespace('api') is not null,
  'api namespace exists'
);

select ok(
  to_regnamespace('audit') is not null,
  'audit namespace exists'
);

select is(
  (
    select count(*)
    from pg_catalog.pg_namespace
    where nspname in (
      'club',
      'pass',
      'pos',
      'public',
      'talento',
      'viso'
    )
  ),
  6::bigint,
  'legacy Vento schemas remain present'
);

select ok(
  to_regnamespace('vital') is not null,
  'VITAL remains present'
);

select ok(
  not exists (
    select 1
    from auth_db_016_expected_schemas
    where schema_name = 'vital'
  ),
  'VITAL is outside the Vento OS target set'
);

select is(
  (
    select count(*)
    from pg_catalog.pg_namespace n
    join auth_db_016_expected_schemas e
      on e.schema_name = n.nspname
    where has_schema_privilege(
      'anon',
      n.oid,
      'CREATE'
    )
  ),
  0::bigint,
  'anon has zero CREATE on target schemas'
);

select is(
  (
    select count(*)
    from pg_catalog.pg_namespace n
    join auth_db_016_expected_schemas e
      on e.schema_name = n.nspname
    where has_schema_privilege(
      'authenticated',
      n.oid,
      'CREATE'
    )
  ),
  0::bigint,
  'authenticated has zero CREATE on target schemas'
);

select is(
  (
    select count(*)
    from pg_catalog.pg_namespace n
    join auth_db_016_expected_schemas e
      on e.schema_name = n.nspname
    where has_schema_privilege(
      'anon',
      n.oid,
      'USAGE'
    )
  ),
  0::bigint,
  'anon has zero USAGE on target schemas'
);

select is(
  coalesce(
    (
      select array_agg(
        n.nspname::text
        order by n.nspname::text
      )
      from pg_catalog.pg_namespace n
      join auth_db_016_expected_schemas e
        on e.schema_name = n.nspname
      where has_schema_privilege(
        'authenticated',
        n.oid,
        'USAGE'
      )
    ),
    array[]::text[]
  ),
  array['payments']::text[],
  'authenticated USAGE remains only on payments'
);

select ok(
  not has_schema_privilege(
    'authenticated',
    'app_private',
    'USAGE'
  ),
  'app_private remains private'
);

select ok(
  has_schema_privilege(
    'authenticated',
    'payments',
    'USAGE'
  ),
  'payments authenticated USAGE is preserved'
);

select is(
  (
    select count(*)
    from pg_catalog.pg_namespace n
    join auth_db_016_expected_schemas e
      on e.schema_name = n.nspname
    where exists (
      select 1
      from pg_catalog.aclexplode(n.nspacl) a
      where a.grantee = 0::oid
        and a.privilege_type = 'CREATE'
    )
  ),
  0::bigint,
  'PUBLIC has no direct CREATE on target schemas'
);

select is(
  (
    select count(*)
    from pg_catalog.pg_class c
    join pg_catalog.pg_namespace n
      on n.oid = c.relnamespace
    join auth_db_016_expected_schemas e
      on e.schema_name = n.nspname
    where not e.existed_before
      and c.relkind in (
        'r',
        'p',
        'v',
        'm',
        'f',
        'S'
      )
  ),
  0::bigint,
  'new schemas contain no relations views or sequences'
);

select is(
  (
    select count(*)
    from pg_catalog.pg_proc p
    join pg_catalog.pg_namespace n
      on n.oid = p.pronamespace
    join auth_db_016_expected_schemas e
      on e.schema_name = n.nspname
    where not e.existed_before
      and p.prokind in ('f', 'p')
  ),
  0::bigint,
  'new schemas contain no routines'
);

select is(
  (
    select count(*)
    from pg_catalog.pg_type ty
    join pg_catalog.pg_namespace n
      on n.oid = ty.typnamespace
    join auth_db_016_expected_schemas e
      on e.schema_name = n.nspname
    where not e.existed_before
      and ty.typtype in ('e', 'd')
  ),
  0::bigint,
  'new schemas contain no enums or domains'
);

select is(
  (
    select count(*)
    from pg_catalog.pg_policies p
    join auth_db_016_expected_schemas e
      on e.schema_name = p.schemaname
    where not e.existed_before
  ),
  0::bigint,
  'new schemas contain no RLS policies'
);

select is(
  (
    (
      select count(*)
      from pg_catalog.pg_class c
      join pg_catalog.pg_namespace n
        on n.oid = c.relnamespace
      where n.nspname = 'api'
        and c.relkind in (
          'r',
          'p',
          'v',
          'm',
          'f',
          'S'
        )
    )
    +
    (
      select count(*)
      from pg_catalog.pg_proc p
      join pg_catalog.pg_namespace n
        on n.oid = p.pronamespace
      where n.nspname = 'api'
        and p.prokind in ('f', 'p')
    )
    +
    (
      select count(*)
      from pg_catalog.pg_type ty
      join pg_catalog.pg_namespace n
        on n.oid = ty.typnamespace
      where n.nspname = 'api'
        and ty.typtype in ('e', 'd')
    )
  ),
  0::bigint,
  'api exists only as an empty namespace'
);

select is(
  (
    (
      select count(*)
      from pg_catalog.pg_class c
      join pg_catalog.pg_namespace n
        on n.oid = c.relnamespace
      where n.nspname = 'audit'
        and c.relkind in (
          'r',
          'p',
          'v',
          'm',
          'f',
          'S'
        )
    )
    +
    (
      select count(*)
      from pg_catalog.pg_proc p
      join pg_catalog.pg_namespace n
        on n.oid = p.pronamespace
      where n.nspname = 'audit'
        and p.prokind in ('f', 'p')
    )
    +
    (
      select count(*)
      from pg_catalog.pg_type ty
      join pg_catalog.pg_namespace n
        on n.oid = ty.typnamespace
      where n.nspname = 'audit'
        and ty.typtype in ('e', 'd')
    )
  ),
  0::bigint,
  'audit exists only as an empty namespace'
);

select is(
  (
    select count(*)
    from pg_catalog.pg_namespace n
    join auth_db_016_expected_schemas e
      on e.schema_name = n.nspname
    where not e.existed_before
      and pg_get_userbyid(n.nspowner) in (
        'anon',
        'authenticated',
        'service_role'
      )
  ),
  0::bigint,
  'new schemas are not owned by client roles'
);

select is(
  (
    select count(*)
    from pg_catalog.pg_default_acl d
    join pg_catalog.pg_namespace n
      on n.oid = d.defaclnamespace
    join auth_db_016_expected_schemas e
      on e.schema_name = n.nspname
    where not e.existed_before
      and exists (
        select 1
        from pg_catalog.aclexplode(
          d.defaclacl
        ) a
        where
          a.grantee = 0::oid
          or a.grantee = 'anon'::regrole::oid
          or a.grantee = 'authenticated'::regrole::oid
      )
  ),
  0::bigint,
  'new schemas define no broad client default privileges'
);

select * from finish();

rollback;
