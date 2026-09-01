-- VENTO_DB_TEST_CATEGORY: SCHEMA
begin;

create extension if not exists pgtap with schema extensions;

select plan(67);

-- 1
select ok(
  to_regnamespace('identity_access') is not null,
  'identity_access schema exists'
);

-- 2
select is(
  (
    select count(*)
    from pg_catalog.pg_class c
    join pg_catalog.pg_namespace n on n.oid = c.relnamespace
    where n.nspname = 'identity_access'
      and c.relkind = 'r'
      and c.relname in ('principals', 'identity_resolution_cases', 'enterprise_identity_links')
  ),
  3::bigint,
  'AUTH-DB-019 creates exactly the three target identity tables'
);

-- 3
select is(
  (
    select count(*)
    from pg_catalog.pg_class c
    join pg_catalog.pg_namespace n on n.oid = c.relnamespace
    where n.nspname = 'identity_access'
      and c.relkind = 'r'
      and c.relname in ('principals', 'identity_resolution_cases', 'enterprise_identity_links')
      and pg_catalog.pg_get_userbyid(c.relowner) = 'vento_ddl_owner'
  ),
  3::bigint,
  'all AUTH-DB-019 target tables are owned by vento_ddl_owner'
);

-- 4
select is(
  (
    select count(*)
    from (values ('anon'), ('authenticated'), ('service_role')) as roles(role_name)
    where has_schema_privilege(role_name, 'identity_access', 'USAGE')
  ),
  0::bigint,
  'client and API roles have no USAGE on identity_access'
);

-- 5
select is(
  (
    select count(*)
    from pg_catalog.pg_class c
    join pg_catalog.pg_namespace n on n.oid = c.relnamespace
    cross join lateral pg_catalog.aclexplode(coalesce(c.relacl, pg_catalog.acldefault('r', c.relowner))) a
    where n.nspname = 'identity_access'
      and c.relname in ('principals', 'identity_resolution_cases', 'enterprise_identity_links')
      and (
        a.grantee = 0::oid
        or a.grantee = 'anon'::regrole::oid
        or a.grantee = 'authenticated'::regrole::oid
        or a.grantee = 'service_role'::regrole::oid
      )
  ),
  0::bigint,
  'AUTH-DB-019 target tables expose zero privileges to PUBLIC and runtime API roles'
);

-- 6
select ok(
  not has_schema_privilege('vento_ddl_owner', 'identity_access', 'CREATE'),
  'vento_ddl_owner CREATE on identity_access is revoked after materialization'
);

-- 7
select is(
  (
    select count(*)
    from pg_catalog.pg_constraint con
    join pg_catalog.pg_class sc on sc.oid = con.conrelid
    join pg_catalog.pg_namespace sn on sn.oid = sc.relnamespace
    join pg_catalog.pg_class tc on tc.oid = con.confrelid
    join pg_catalog.pg_namespace tn on tn.oid = tc.relnamespace
    where con.contype = 'f'
      and sn.nspname = 'identity_access'
      and sc.relname in ('principals', 'identity_resolution_cases', 'enterprise_identity_links')
      and tn.nspname = 'auth'
  ),
  0::bigint,
  'new enterprise identity objects have no FK that can cascade from managed Auth'
);

-- 8
select is(
  (
    (select count(*) from identity_access.principals)
    + (select count(*) from identity_access.identity_resolution_cases)
    + (select count(*) from identity_access.enterprise_identity_links)
  ),
  0::bigint,
  'AUTH-DB-019 performs no enterprise identity backfill'
);

create temporary table auth_db_019_actual_auth_fks on commit drop as
select
  sn.nspname::text as source_schema,
  sc.relname::text as source_table,
  sa.attname::text as source_column,
  con.conname::text as constraint_name,
  case con.confdeltype
    when 'a' then 'NO ACTION'
    when 'r' then 'RESTRICT'
    when 'c' then 'CASCADE'
    when 'n' then 'SET NULL'
    when 'd' then 'SET DEFAULT'
    else 'UNKNOWN'
  end::text as on_delete
from pg_catalog.pg_constraint con
join pg_catalog.pg_class sc on sc.oid = con.conrelid
join pg_catalog.pg_namespace sn on sn.oid = sc.relnamespace
join pg_catalog.pg_attribute sa on sa.attrelid = sc.oid and sa.attnum = con.conkey[1]
join pg_catalog.pg_class tc on tc.oid = con.confrelid
join pg_catalog.pg_namespace tn on tn.oid = tc.relnamespace
join pg_catalog.pg_attribute ta on ta.attrelid = tc.oid and ta.attnum = con.confkey[1]
where con.contype = 'f'
  and pg_catalog.cardinality(con.conkey) = 1
  and pg_catalog.cardinality(con.confkey) = 1
  and sn.nspname in ('app_private', 'club', 'pass', 'payments', 'pos', 'public', 'talento', 'viso')
  and tn.nspname = 'auth'
  and tc.relname = 'users'
  and ta.attname = 'id';

-- 9
select is(
  (select count(*) from auth_db_019_actual_auth_fks),
  73::bigint,
  'all 73 direct legacy references to auth.users are preserved'
);

-- 10
select is(
  (
    select array_agg(format('%s=%s', source_schema, fk_count) order by source_schema)
    from (
      select source_schema, count(*)::bigint as fk_count
      from auth_db_019_actual_auth_fks
      group by source_schema
    ) s
  ),
  array['club=8', 'pass=4', 'payments=1', 'public=60']::text[],
  'legacy Auth FK distribution remains club=8 pass=4 payments=1 public=60'
);

-- 11
select is(
  (
    select array_agg(format('%s=%s', on_delete, fk_count) order by on_delete)
    from (
      select on_delete, count(*)::bigint as fk_count
      from auth_db_019_actual_auth_fks
      group by on_delete
    ) s
  ),
  array['CASCADE=22', 'NO ACTION=24', 'RESTRICT=3', 'SET NULL=24']::text[],
  'legacy Auth FK delete actions remain unchanged'
);

-- 12
select is(
  (
    select count(*)
    from auth_db_019_actual_auth_fks
    where source_schema = 'public'
      and source_table = 'employees'
      and source_column = 'id'
      and constraint_name = 'employees_id_fkey'
      and on_delete = 'CASCADE'
  ),
  1::bigint,
  'public.employees.id legacy CASCADE remains present for compatibility'
);

-- 13
select is(
  (
    select count(*)
    from supabase_migrations.schema_migrations
    where version = '20260829200745'
  ),
  1::bigint,
  'AUTH-DB-019 migration is recorded in migration history'
);

-- 14
select is(
  (
    select count(*)
    from pg_catalog.pg_trigger t
    join pg_catalog.pg_class c on c.oid = t.tgrelid
    join pg_catalog.pg_namespace n on n.oid = c.relnamespace
    where n.nspname = 'identity_access'
      and not t.tgisinternal
      and t.tgname not in (
        'context_freshness_principals_insert',
        'context_freshness_principals_update',
        'context_freshness_principals_delete',
        'context_freshness_links_insert',
        'context_freshness_links_update',
        'context_freshness_links_delete'
      )
  ),
  0::bigint,
  'identity_access has no user triggers outside the AUTH-DB-035 allowlist'
);

-- 15
select is(
  (
    select count(*)
    from pg_catalog.pg_proc p
    join pg_catalog.pg_namespace n on n.oid = p.pronamespace
    where n.nspname = 'identity_access'
      and p.prosecdef
  ),
  0::bigint,
  'AUTH-DB-019 creates zero SECURITY DEFINER routines in identity_access'
);

-- 16
select is(
  (
    select array_agg(a.attname::text order by k.ordinality)
    from pg_catalog.pg_constraint con
    join pg_catalog.pg_class c on c.oid = con.conrelid
    join pg_catalog.pg_namespace n on n.oid = c.relnamespace
    cross join lateral unnest(con.conkey) with ordinality as k(attnum, ordinality)
    join pg_catalog.pg_attribute a on a.attrelid = c.oid and a.attnum = k.attnum
    where con.contype = 'p'
      and n.nspname = 'identity_access'
      and c.relname = 'principals'
  ),
  array['id']::text[],
  'principals primary key is its local id and not auth_subject_id'
);

-- 17
select is(
  (
    select array_agg(a.attname::text order by k.ordinality)
    from pg_catalog.pg_constraint con
    join pg_catalog.pg_class c on c.oid = con.conrelid
    join pg_catalog.pg_namespace n on n.oid = c.relnamespace
    cross join lateral unnest(con.conkey) with ordinality as k(attnum, ordinality)
    join pg_catalog.pg_attribute a on a.attrelid = c.oid and a.attnum = k.attnum
    where con.contype = 'p'
      and n.nspname = 'identity_access'
      and c.relname = 'enterprise_identity_links'
  ),
  array['id']::text[],
  'enterprise identity links have their own local identity'
);

-- 18
select is(
  (
    select count(*)
    from pg_catalog.pg_constraint con
    join pg_catalog.pg_class c on c.oid = con.conrelid
    join pg_catalog.pg_namespace n on n.oid = c.relnamespace
    join pg_catalog.pg_attribute a on a.attrelid = c.oid and a.attname = 'enterprise_identity_id'
    where con.contype = 'f'
      and n.nspname = 'identity_access'
      and c.relname = 'enterprise_identity_links'
      and a.attnum = any(con.conkey)
  ),
  0::bigint,
  'enterprise_identity_id remains independent until owner-domain identities are materialized'
);

-- Transaction-local harness privilege only. The surrounding pgTAP transaction rolls this back.
set local role vento_ddl_owner;
grant select, insert, update, delete on table
  identity_access.principals,
  identity_access.identity_resolution_cases,
  identity_access.enterprise_identity_links
to postgres;
reset role;

create temporary table auth_db_019_test_ids (
  label text primary key,
  principal_id uuid not null default gen_random_uuid(),
  auth_subject_id uuid default gen_random_uuid(),
  enterprise_id uuid not null default gen_random_uuid(),
  case_id uuid not null default gen_random_uuid(),
  link_id uuid not null default gen_random_uuid()
) on commit drop;

insert into auth_db_019_test_ids(label) values
  ('human_1'),
  ('human_2'),
  ('device_1'),
  ('service_1'),
  ('aux_1'),
  ('aux_2');

update auth_db_019_test_ids
set auth_subject_id = null
where label = 'service_1';

-- 19
select lives_ok(
  $$
    insert into identity_access.principals
      (id, auth_subject_id, principal_kind, source_version, audit_reference)
    select principal_id, auth_subject_id,
      case label
        when 'device_1' then 'SHARED_DEVICE'
        when 'service_1' then 'SERVICE'
        else 'HUMAN_USER'
      end,
      'AUTH-DB-019',
      'PGTAP'
    from auth_db_019_test_ids
    where label in ('human_1', 'human_2', 'device_1', 'service_1')
  $$,
  'all three canonical principal kinds are accepted'
);

-- 20
select throws_ok(
  $$
    insert into identity_access.principals
      (auth_subject_id, principal_kind, source_version)
    values (gen_random_uuid(), 'INVALID_PRINCIPAL', 'AUTH-DB-019')
  $$,
  '23514',
  null,
  'an invalid principal kind fails closed'
);

-- 21
select throws_ok(
  $$
    insert into identity_access.principals
      (auth_subject_id, principal_kind, source_version)
    select auth_subject_id, 'HUMAN_USER', 'AUTH-DB-019'
    from auth_db_019_test_ids
    where label = 'human_1'
  $$,
  '23505',
  null,
  'one current auth_subject_id cannot identify two principals'
);

-- 22
select lives_ok(
  $$
    insert into identity_access.enterprise_identity_links (
      principal_id, auth_subject_id, principal_kind,
      enterprise_identity_kind, enterprise_identity_id,
      link_state, link_origin, authority_reference, reason_code,
      verified_at, activated_at, source_version
    )
    select principal_id, auth_subject_id, 'HUMAN_USER',
      'EMPLOYEE', enterprise_id,
      'ACTIVE', 'STAFF_INVITATION', 'AUTH-DB-019', 'PGTAP',
      now(), now(), 'AUTH-DB-019'
    from auth_db_019_test_ids
    where label = 'human_1'
  $$,
  'HUMAN_USER can hold one ACTIVE EMPLOYEE link'
);

-- 23
select lives_ok(
  $$
    insert into identity_access.enterprise_identity_links (
      principal_id, auth_subject_id, principal_kind,
      enterprise_identity_kind, enterprise_identity_id,
      link_state, link_origin, authority_reference, reason_code,
      verified_at, activated_at, source_version
    )
    select principal_id, auth_subject_id, 'HUMAN_USER',
      'CUSTOMER', gen_random_uuid(),
      'ACTIVE', 'CUSTOMER_SELF_ENROLLMENT', 'AUTH-DB-019', 'PGTAP',
      now(), now(), 'AUTH-DB-019'
    from auth_db_019_test_ids
    where label = 'human_1'
  $$,
  'HUMAN_USER can simultaneously hold an independent ACTIVE CUSTOMER link'
);

-- 24
select throws_ok(
  $$
    insert into identity_access.enterprise_identity_links (
      principal_id, auth_subject_id, principal_kind,
      enterprise_identity_kind, enterprise_identity_id,
      link_state, link_origin, authority_reference, reason_code,
      verified_at, activated_at, source_version
    )
    select principal_id, auth_subject_id, 'HUMAN_USER',
      'DEVICE', gen_random_uuid(),
      'ACTIVE', 'MANUAL_RECONCILIATION', 'AUTH-DB-019', 'PGTAP',
      now(), now(), 'AUTH-DB-019'
    from auth_db_019_test_ids where label = 'human_2'
  $$,
  '23514',
  null,
  'HUMAN_USER plus DEVICE is structurally forbidden'
);

-- 25
select lives_ok(
  $$
    insert into identity_access.enterprise_identity_links (
      principal_id, auth_subject_id, principal_kind,
      enterprise_identity_kind, enterprise_identity_id,
      link_state, link_origin, authority_reference, reason_code,
      verified_at, activated_at, source_version
    )
    select principal_id, auth_subject_id, 'SHARED_DEVICE',
      'DEVICE', enterprise_id,
      'ACTIVE', 'ADMIN_DEVICE_PROVISIONING', 'AUTH-DB-019', 'PGTAP',
      now(), now(), 'AUTH-DB-019'
    from auth_db_019_test_ids where label = 'device_1'
  $$,
  'SHARED_DEVICE can hold one ACTIVE DEVICE link'
);

-- 26
select throws_ok(
  $$
    insert into identity_access.enterprise_identity_links (
      principal_id, auth_subject_id, principal_kind,
      enterprise_identity_kind, enterprise_identity_id,
      link_state, link_origin, authority_reference, reason_code,
      verified_at, activated_at, source_version
    )
    select principal_id, auth_subject_id, 'SHARED_DEVICE',
      'EMPLOYEE', gen_random_uuid(),
      'ACTIVE', 'MANUAL_RECONCILIATION', 'AUTH-DB-019', 'PGTAP',
      now(), now(), 'AUTH-DB-019'
    from auth_db_019_test_ids where label = 'device_1'
  $$,
  '23514',
  null,
  'SHARED_DEVICE plus EMPLOYEE is structurally forbidden'
);

-- 27
select throws_ok(
  $$
    insert into identity_access.enterprise_identity_links (
      principal_id, auth_subject_id, principal_kind,
      enterprise_identity_kind, enterprise_identity_id,
      link_state, link_origin, authority_reference, reason_code,
      verified_at, activated_at, source_version
    )
    select principal_id, auth_subject_id, 'SHARED_DEVICE',
      'CUSTOMER', gen_random_uuid(),
      'ACTIVE', 'MANUAL_RECONCILIATION', 'AUTH-DB-019', 'PGTAP',
      now(), now(), 'AUTH-DB-019'
    from auth_db_019_test_ids where label = 'device_1'
  $$,
  '23514',
  null,
  'SHARED_DEVICE plus CUSTOMER is structurally forbidden'
);

-- 28
select lives_ok(
  $$
    insert into identity_access.enterprise_identity_links (
      principal_id, auth_subject_id, principal_kind,
      enterprise_identity_kind, enterprise_identity_id,
      link_state, link_origin, authority_reference, reason_code,
      verified_at, activated_at, source_version
    )
    select principal_id, auth_subject_id, 'SERVICE',
      'SYSTEM_ACTOR', enterprise_id,
      'ACTIVE', 'MANUAL_RECONCILIATION', 'AUTH-DB-019', 'PGTAP',
      now(), now(), 'AUTH-DB-019'
    from auth_db_019_test_ids where label = 'service_1'
  $$,
  'SERVICE can resolve only through SYSTEM_ACTOR semantics'
);

-- 29
select throws_ok(
  $$
    insert into identity_access.enterprise_identity_links (
      principal_id, principal_kind,
      enterprise_identity_kind, enterprise_identity_id,
      link_state, link_origin, authority_reference, reason_code,
      verified_at, activated_at, source_version
    )
    select principal_id, 'SERVICE', 'EMPLOYEE', gen_random_uuid(),
      'ACTIVE', 'MANUAL_RECONCILIATION', 'AUTH-DB-019', 'PGTAP', now(), now(), 'AUTH-DB-019'
    from auth_db_019_test_ids where label = 'service_1'
  $$,
  '23514',
  null,
  'SERVICE cannot claim EMPLOYEE'
);

-- 30
select throws_ok(
  $$
    insert into identity_access.enterprise_identity_links (
      principal_id, principal_kind,
      enterprise_identity_kind, enterprise_identity_id,
      link_state, link_origin, authority_reference, reason_code,
      verified_at, activated_at, source_version
    )
    select principal_id, 'SERVICE', 'CUSTOMER', gen_random_uuid(),
      'ACTIVE', 'MANUAL_RECONCILIATION', 'AUTH-DB-019', 'PGTAP', now(), now(), 'AUTH-DB-019'
    from auth_db_019_test_ids where label = 'service_1'
  $$,
  '23514',
  null,
  'SERVICE cannot claim CUSTOMER'
);

-- 31
select throws_ok(
  $$
    insert into identity_access.enterprise_identity_links (
      principal_id, principal_kind,
      enterprise_identity_kind, enterprise_identity_id,
      link_state, link_origin, authority_reference, reason_code,
      verified_at, activated_at, source_version
    )
    select principal_id, 'SERVICE', 'DEVICE', gen_random_uuid(),
      'ACTIVE', 'MANUAL_RECONCILIATION', 'AUTH-DB-019', 'PGTAP', now(), now(), 'AUTH-DB-019'
    from auth_db_019_test_ids where label = 'service_1'
  $$,
  '23514',
  null,
  'SERVICE cannot claim DEVICE'
);

-- 32
select throws_ok(
  $$
    insert into identity_access.enterprise_identity_links (
      principal_id, auth_subject_id, principal_kind,
      enterprise_identity_kind, enterprise_identity_id,
      link_state, link_origin, authority_reference, reason_code,
      verified_at, activated_at, source_version
    )
    select principal_id, auth_subject_id, 'HUMAN_USER',
      'EMPLOYEE', gen_random_uuid(),
      'ACTIVE', 'VERIFIED_IDENTITY_CLAIM', 'AUTH-DB-019', 'PGTAP', now(), now(), 'AUTH-DB-019'
    from auth_db_019_test_ids where label = 'human_1'
  $$,
  '23505',
  null,
  'a principal cannot have two ACTIVE EMPLOYEE links'
);

-- 33
select throws_ok(
  $$
    insert into identity_access.enterprise_identity_links (
      principal_id, auth_subject_id, principal_kind,
      enterprise_identity_kind, enterprise_identity_id,
      link_state, link_origin, authority_reference, reason_code,
      verified_at, activated_at, source_version
    )
    select h2.principal_id, h2.auth_subject_id, 'HUMAN_USER',
      'EMPLOYEE', h1.enterprise_id,
      'ACTIVE', 'VERIFIED_IDENTITY_CLAIM', 'AUTH-DB-019', 'PGTAP', now(), now(), 'AUTH-DB-019'
    from auth_db_019_test_ids h1
    cross join auth_db_019_test_ids h2
    where h1.label = 'human_1' and h2.label = 'human_2'
  $$,
  '23505',
  null,
  'one enterprise EMPLOYEE identity cannot be ACTIVE for two principals'
);

-- 34
select throws_ok(
  $$
    insert into identity_access.enterprise_identity_links (
      principal_id, auth_subject_id, principal_kind,
      enterprise_identity_kind, enterprise_identity_id,
      link_state, link_origin, authority_reference, reason_code,
      verified_at, activated_at, source_version
    )
    select h2.principal_id, h1.auth_subject_id, 'HUMAN_USER',
      'EMPLOYEE', gen_random_uuid(),
      'ACTIVE', 'MANUAL_RECONCILIATION', 'AUTH-DB-019', 'PGTAP', now(), now(), 'AUTH-DB-019'
    from auth_db_019_test_ids h1
    cross join auth_db_019_test_ids h2
    where h1.label = 'human_1' and h2.label = 'human_2'
  $$,
  '23505',
  null,
  'one auth subject and identity kind cannot be ACTIVE through two principals'
);

-- 35
select lives_ok(
  $$
    insert into identity_access.enterprise_identity_links (
      principal_id, auth_subject_id, principal_kind,
      enterprise_identity_kind, enterprise_identity_id,
      link_state, link_origin, authority_reference, reason_code,
      revoked_at, audit_reference, source_version
    )
    select principal_id, auth_subject_id, 'HUMAN_USER',
      'EMPLOYEE', enterprise_id,
      'REVOKED', 'LEGACY_MIGRATION', 'AUTH-DB-019', 'PGTAP', now(), 'PGTAP:legacy-history', 'AUTH-DB-019'
    from auth_db_019_test_ids where label = 'human_1'
  $$,
  'historical non-ACTIVE links may coexist without violating ACTIVE cardinality'
);

-- 36
select throws_ok(
  $$
    insert into identity_access.enterprise_identity_links (
      principal_id, auth_subject_id, principal_kind,
      enterprise_identity_kind, enterprise_identity_id,
      link_state, link_origin, authority_reference, reason_code,
      activated_at, source_version
    )
    select principal_id, auth_subject_id, 'HUMAN_USER', 'EMPLOYEE', gen_random_uuid(),
      'ACTIVE', 'MANUAL_RECONCILIATION', 'AUTH-DB-019', 'PGTAP', now(), 'AUTH-DB-019'
    from auth_db_019_test_ids where label = 'human_2'
  $$,
  '23514',
  null,
  'ACTIVE requires verified_at'
);

-- 37
select throws_ok(
  $$
    insert into identity_access.enterprise_identity_links (
      principal_id, auth_subject_id, principal_kind,
      enterprise_identity_kind, enterprise_identity_id,
      link_state, link_origin, authority_reference, reason_code,
      verified_at, source_version
    )
    select principal_id, auth_subject_id, 'HUMAN_USER', 'EMPLOYEE', gen_random_uuid(),
      'ACTIVE', 'MANUAL_RECONCILIATION', 'AUTH-DB-019', 'PGTAP', now(), 'AUTH-DB-019'
    from auth_db_019_test_ids where label = 'human_2'
  $$,
  '23514',
  null,
  'ACTIVE requires activated_at'
);

-- 38
select throws_ok(
  $$
    insert into identity_access.enterprise_identity_links (
      principal_id, auth_subject_id, principal_kind,
      enterprise_identity_kind, enterprise_identity_id,
      link_state, link_origin, authority_reference, reason_code, source_version
    )
    select principal_id, auth_subject_id, 'HUMAN_USER', 'EMPLOYEE', gen_random_uuid(),
      'SUSPENDED', 'MANUAL_RECONCILIATION', 'AUTH-DB-019', 'PGTAP', 'AUTH-DB-019'
    from auth_db_019_test_ids where label = 'human_2'
  $$,
  '23514',
  null,
  'SUSPENDED requires suspended_at'
);

-- 39
select throws_ok(
  $$
    insert into identity_access.enterprise_identity_links (
      principal_id, auth_subject_id, principal_kind,
      enterprise_identity_kind, enterprise_identity_id,
      link_state, link_origin, authority_reference, reason_code, source_version
    )
    select principal_id, auth_subject_id, 'HUMAN_USER', 'EMPLOYEE', gen_random_uuid(),
      'REVOKED', 'MANUAL_RECONCILIATION', 'AUTH-DB-019', 'PGTAP', 'AUTH-DB-019'
    from auth_db_019_test_ids where label = 'human_2'
  $$,
  '23514',
  null,
  'REVOKED requires revoked_at'
);

-- 40
select throws_ok(
  $$
    insert into identity_access.enterprise_identity_links (
      principal_id, auth_subject_id, principal_kind,
      enterprise_identity_kind, enterprise_identity_id,
      link_state, link_origin, authority_reference, reason_code, source_version
    )
    select principal_id, auth_subject_id, 'HUMAN_USER', 'EMPLOYEE', gen_random_uuid(),
      'SUPERSEDED', 'MANUAL_RECONCILIATION', 'AUTH-DB-019', 'PGTAP', 'AUTH-DB-019'
    from auth_db_019_test_ids where label = 'human_2'
  $$,
  '23514',
  null,
  'SUPERSEDED requires superseded_at'
);

-- 41
select throws_ok(
  $$
    insert into identity_access.enterprise_identity_links (
      principal_id, auth_subject_id, principal_kind,
      enterprise_identity_kind, enterprise_identity_id,
      link_state, link_origin, authority_reference, reason_code, source_version
    )
    select principal_id, auth_subject_id, 'HUMAN_USER', 'EMPLOYEE', gen_random_uuid(),
      'CONFLICT', 'MANUAL_RECONCILIATION', 'AUTH-DB-019', 'PGTAP', 'AUTH-DB-019'
    from auth_db_019_test_ids where label = 'human_2'
  $$,
  '23514',
  null,
  'CONFLICT requires resolution_case_id'
);

-- 42
select throws_ok(
  $$
    insert into identity_access.enterprise_identity_links (
      id, principal_id, auth_subject_id, principal_kind,
      enterprise_identity_kind, enterprise_identity_id,
      link_state, link_origin, authority_reference, reason_code,
      superseded_at, supersedes_link_id, source_version
    )
    select link_id, principal_id, auth_subject_id, 'HUMAN_USER',
      'EMPLOYEE', gen_random_uuid(),
      'SUPERSEDED', 'MANUAL_RECONCILIATION', 'AUTH-DB-019', 'PGTAP',
      now(), link_id, 'AUTH-DB-019'
    from auth_db_019_test_ids where label = 'human_2'
  $$,
  '23514',
  null,
  'a link cannot supersede itself'
);

-- 43
select lives_ok(
  $$
    insert into identity_access.identity_resolution_cases (
      conflict_class, candidate_references, source_references, evidence_references,
      risk_reference, decision_required, authority_reference, source_version
    )
    values
      ('AUTH_ACCOUNT_DUPLICATE', '[]', '[]', '[]', 'PGTAP', 'REVIEW', 'AUTH-DB-019', 'AUTH-DB-019'),
      ('ENTERPRISE_IDENTITY_DUPLICATE', '[]', '[]', '[]', 'PGTAP', 'REVIEW', 'AUTH-DB-019', 'AUTH-DB-019'),
      ('IDENTITY_LINK_DUPLICATE', '[]', '[]', '[]', 'PGTAP', 'REVIEW', 'AUTH-DB-019', 'AUTH-DB-019'),
      ('CROSS_CLASS_COLLISION', '[]', '[]', '[]', 'PGTAP', 'REVIEW', 'AUTH-DB-019', 'AUTH-DB-019'),
      ('CONTACT_MATCH_ONLY', '[]', '[]', '[]', 'PGTAP', 'REVIEW', 'AUTH-DB-019', 'AUTH-DB-019'),
      ('ORPHAN_PROFILE', '[]', '[]', '[]', 'PGTAP', 'REVIEW', 'AUTH-DB-019', 'AUTH-DB-019'),
      ('LEGACY_SHARED_UUID', '[]', '[]', '[]', 'PGTAP', 'REVIEW', 'AUTH-DB-019', 'AUTH-DB-019'),
      ('DEVICE_HUMAN_COLLISION', '[]', '[]', '[]', 'PGTAP', 'REVIEW', 'AUTH-DB-019', 'AUTH-DB-019')
  $$,
  'all eight canonical conflict classes are accepted'
);

-- 44
select throws_ok(
  $$
    insert into identity_access.identity_resolution_cases (
      conflict_class, candidate_references, source_references, evidence_references,
      risk_reference, decision_required, authority_reference, source_version
    )
    values ('INVALID_CONFLICT', '[]', '[]', '[]', 'PGTAP', 'REVIEW', 'AUTH-DB-019', 'AUTH-DB-019')
  $$,
  '23514',
  null,
  'an invalid conflict class fails closed'
);

-- 45
select lives_ok(
  $$
    insert into identity_access.identity_resolution_cases (
      conflict_class, candidate_references, source_references, evidence_references,
      risk_reference, decision_required, authority_reference,
      resolution_result, resolved_at, source_version
    )
    values
      ('CONTACT_MATCH_ONLY', '[]', '[]', '[]', 'PGTAP', 'REVIEW', 'AUTH-DB-019', 'LINK_EXISTING_IDENTITY', now(), 'AUTH-DB-019'),
      ('CONTACT_MATCH_ONLY', '[]', '[]', '[]', 'PGTAP', 'REVIEW', 'AUTH-DB-019', 'CREATE_NEW_ENTERPRISE_IDENTITY', now(), 'AUTH-DB-019'),
      ('CONTACT_MATCH_ONLY', '[]', '[]', '[]', 'PGTAP', 'REVIEW', 'AUTH-DB-019', 'KEEP_UNLINKED', now(), 'AUTH-DB-019'),
      ('CONTACT_MATCH_ONLY', '[]', '[]', '[]', 'PGTAP', 'REVIEW', 'AUTH-DB-019', 'SPLIT_PRINCIPAL', now(), 'AUTH-DB-019'),
      ('CONTACT_MATCH_ONLY', '[]', '[]', '[]', 'PGTAP', 'REVIEW', 'AUTH-DB-019', 'SUPERSEDE_LINK', now(), 'AUTH-DB-019'),
      ('CONTACT_MATCH_ONLY', '[]', '[]', '[]', 'PGTAP', 'REVIEW', 'AUTH-DB-019', 'REJECT_AND_ESCALATE', now(), 'AUTH-DB-019')
  $$,
  'all six canonical resolution results are accepted'
);

-- 46
select throws_ok(
  $$
    insert into identity_access.identity_resolution_cases (
      conflict_class, candidate_references, source_references, evidence_references,
      risk_reference, decision_required, authority_reference,
      resolution_result, resolved_at, source_version
    )
    values ('CONTACT_MATCH_ONLY', '[]', '[]', '[]', 'PGTAP', 'REVIEW', 'AUTH-DB-019', 'INVALID_RESULT', now(), 'AUTH-DB-019')
  $$,
  '23514',
  null,
  'an invalid resolution result fails closed'
);

-- 47
select throws_ok(
  $$
    insert into identity_access.identity_resolution_cases (
      conflict_class, candidate_references, source_references, evidence_references,
      risk_reference, decision_required, authority_reference,
      resolution_result, source_version
    )
    values ('CONTACT_MATCH_ONLY', '[]', '[]', '[]', 'PGTAP', 'REVIEW', 'AUTH-DB-019', 'KEEP_UNLINKED', 'AUTH-DB-019')
  $$,
  '23514',
  null,
  'resolution_result requires resolved_at'
);

-- 48
select throws_ok(
  $$
    insert into identity_access.identity_resolution_cases (
      conflict_class, candidate_references, source_references, evidence_references,
      risk_reference, decision_required, authority_reference,
      resolved_at, source_version
    )
    values ('CONTACT_MATCH_ONLY', '[]', '[]', '[]', 'PGTAP', 'REVIEW', 'AUTH-DB-019', now(), 'AUTH-DB-019')
  $$,
  '23514',
  null,
  'resolved_at requires resolution_result'
);

insert into identity_access.identity_resolution_cases (
  id, conflict_class, candidate_references, source_references, evidence_references,
  risk_reference, decision_required, authority_reference, source_version
)
select case_id, 'LEGACY_SHARED_UUID', '[]', '[]', '[]',
  'PGTAP', 'REVIEW', 'AUTH-DB-019', 'AUTH-DB-019'
from auth_db_019_test_ids
where label = 'human_2';

-- 49
select lives_ok(
  $$
    insert into identity_access.enterprise_identity_links (
      principal_id, auth_subject_id, principal_kind,
      enterprise_identity_kind, enterprise_identity_id,
      link_state, link_origin, authority_reference, reason_code,
      resolution_case_id, source_version
    )
    select principal_id, auth_subject_id, 'HUMAN_USER',
      'EMPLOYEE', gen_random_uuid(),
      'CONFLICT', 'MANUAL_RECONCILIATION', 'AUTH-DB-019', 'PGTAP',
      case_id, 'AUTH-DB-019'
    from auth_db_019_test_ids where label = 'human_2'
  $$,
  'CONFLICT is valid when it points at a controlled resolution case'
);

-- 50
select lives_ok(
  $$
    insert into identity_access.enterprise_identity_links (
      principal_id, principal_kind, enterprise_identity_kind, enterprise_identity_id,
      link_state, link_origin, authority_reference, reason_code,
      suspended_at, revoked_at, superseded_at, resolution_case_id, source_version
    )
    select principal_id, 'SERVICE', 'SYSTEM_ACTOR', gen_random_uuid(), state_name,
      'MANUAL_RECONCILIATION', 'AUTH-DB-019', 'PGTAP',
      case when state_name = 'SUSPENDED' then now() end,
      case when state_name = 'REVOKED' then now() end,
      case when state_name = 'SUPERSEDED' then now() end,
      case when state_name = 'CONFLICT' then (
        select case_id from auth_db_019_test_ids where label = 'human_2'
      ) end,
      'AUTH-DB-019'
    from auth_db_019_test_ids
    cross join (values
      ('PENDING_VERIFICATION'),
      ('SUSPENDED'),
      ('REVOKED'),
      ('SUPERSEDED'),
      ('CONFLICT')
    ) states(state_name)
    where label = 'service_1'
  $$,
  'the five non-ACTIVE canonical link states are accepted with their required milestones'
);

-- 51
select throws_ok(
  $$
    insert into identity_access.enterprise_identity_links (
      principal_id, principal_kind, enterprise_identity_kind, enterprise_identity_id,
      link_state, link_origin, authority_reference, reason_code, source_version
    )
    select principal_id, 'SERVICE', 'SYSTEM_ACTOR', gen_random_uuid(),
      'INVALID_STATE', 'MANUAL_RECONCILIATION', 'AUTH-DB-019', 'PGTAP', 'AUTH-DB-019'
    from auth_db_019_test_ids where label = 'service_1'
  $$,
  '23514',
  null,
  'an invalid link state fails closed'
);

-- 52
select lives_ok(
  $$
    insert into identity_access.enterprise_identity_links (
      principal_id, auth_subject_id, principal_kind, enterprise_identity_kind, enterprise_identity_id,
      link_state, link_origin, authority_reference, reason_code, audit_reference, source_version
    )
    select principal_id, auth_subject_id, 'HUMAN_USER', 'EMPLOYEE', gen_random_uuid(),
      'PENDING_VERIFICATION', 'STAFF_INVITATION', 'AUTH-DB-019', 'PGTAP', 'PGTAP:origin-evidence', 'AUTH-DB-019'
    from auth_db_019_test_ids where label = 'human_2'
    union all
    select principal_id, auth_subject_id, 'HUMAN_USER', 'CUSTOMER', gen_random_uuid(),
      'PENDING_VERIFICATION', 'CUSTOMER_SELF_ENROLLMENT', 'AUTH-DB-019', 'PGTAP', 'PGTAP:origin-evidence', 'AUTH-DB-019'
    from auth_db_019_test_ids where label = 'human_2'
    union all
    select principal_id, auth_subject_id, 'SHARED_DEVICE', 'DEVICE', gen_random_uuid(),
      'PENDING_VERIFICATION', 'ADMIN_DEVICE_PROVISIONING', 'AUTH-DB-019', 'PGTAP', 'PGTAP:origin-evidence', 'AUTH-DB-019'
    from auth_db_019_test_ids where label = 'device_1'
    union all
    select principal_id, auth_subject_id, 'HUMAN_USER', 'EMPLOYEE', gen_random_uuid(),
      'PENDING_VERIFICATION', 'VERIFIED_IDENTITY_CLAIM', 'AUTH-DB-019', 'PGTAP', 'PGTAP:origin-evidence', 'AUTH-DB-019'
    from auth_db_019_test_ids where label = 'human_2'
    union all
    select principal_id, auth_subject_id, 'SERVICE', 'SYSTEM_ACTOR', gen_random_uuid(),
      'PENDING_VERIFICATION', 'LEGACY_MIGRATION', 'AUTH-DB-019', 'PGTAP', 'PGTAP:origin-evidence', 'AUTH-DB-019'
    from auth_db_019_test_ids where label = 'service_1'
    union all
    select principal_id, auth_subject_id, 'SERVICE', 'SYSTEM_ACTOR', gen_random_uuid(),
      'PENDING_VERIFICATION', 'MANUAL_RECONCILIATION', 'AUTH-DB-019', 'PGTAP', 'PGTAP:origin-evidence', 'AUTH-DB-019'
    from auth_db_019_test_ids where label = 'service_1'
  $$,
  'all six canonical link origin classes are accepted in compatible identity flows'
);

-- 53
select throws_ok(
  $$
    insert into identity_access.enterprise_identity_links (
      principal_id, auth_subject_id, principal_kind, enterprise_identity_kind, enterprise_identity_id,
      link_state, link_origin, authority_reference, reason_code, source_version
    )
    select principal_id, auth_subject_id, 'HUMAN_USER', 'EMPLOYEE', gen_random_uuid(),
      'PENDING_VERIFICATION', 'INVALID_ORIGIN', 'AUTH-DB-019', 'PGTAP', 'AUTH-DB-019'
    from auth_db_019_test_ids where label = 'human_2'
  $$,
  '23514',
  null,
  'an invalid link origin fails closed'
);

-- 54
select throws_ok(
  $$
    insert into identity_access.enterprise_identity_links (
      principal_id, auth_subject_id, principal_kind, enterprise_identity_kind, enterprise_identity_id,
      link_state, link_origin, authority_reference, reason_code, source_version
    )
    select principal_id, auth_subject_id, 'HUMAN_USER', 'EMPLOYEE', gen_random_uuid(),
      'PENDING_VERIFICATION', 'CUSTOMER_SELF_ENROLLMENT', 'AUTH-DB-019', 'PGTAP', 'AUTH-DB-019'
    from auth_db_019_test_ids where label = 'human_2'
  $$,
  '23514',
  null,
  'link origin semantics cannot be reused for an incompatible identity kind'
);

-- 55
select throws_ok(
  $$
    insert into identity_access.enterprise_identity_links (
      principal_id, auth_subject_id, principal_kind, enterprise_identity_kind, enterprise_identity_id,
      link_state, link_origin, authority_reference, reason_code, source_version
    )
    select principal_id, auth_subject_id, 'HUMAN_USER', 'EMPLOYEE', gen_random_uuid(),
      'PENDING_VERIFICATION', 'MANUAL_RECONCILIATION', 'AUTH-DB-019', 'PGTAP', 'AUTH-DB-019'
    from auth_db_019_test_ids where label = 'device_1'
  $$,
  '23503',
  null,
  'link principal_kind must match the canonical kind stored on the principal'
);

-- 56
select lives_ok(
  $$
    insert into identity_access.principals
      (id, auth_subject_id, principal_kind, source_version, audit_reference)
    select principal_id, auth_subject_id, 'HUMAN_USER', 'AUTH-DB-019', 'PGTAP'
    from auth_db_019_test_ids
    where label = 'aux_1'
  $$,
  'a stable principal can be created independently from the replaceable Auth subject'
);

-- 57
select lives_ok(
  $$
    insert into identity_access.enterprise_identity_links (
      id, principal_id, auth_subject_id, principal_kind,
      enterprise_identity_kind, enterprise_identity_id,
      link_state, link_origin, authority_reference, reason_code,
      audit_reference, source_version
    )
    select link_id, principal_id, auth_subject_id, 'HUMAN_USER',
      'EMPLOYEE', enterprise_id,
      'PENDING_VERIFICATION', 'LEGACY_MIGRATION', 'AUTH-DB-019', 'PGTAP',
      'PGTAP:legacy-evidence', 'AUTH-DB-019'
    from auth_db_019_test_ids
    where label = 'aux_1'
  $$,
  'a LEGACY_MIGRATION link preserves explicit evidence and begins without automatic activation'
);

-- 58
select throws_ok(
  $$
    insert into identity_access.enterprise_identity_links (
      principal_id, auth_subject_id, principal_kind,
      enterprise_identity_kind, enterprise_identity_id,
      link_state, link_origin, authority_reference, reason_code, source_version
    )
    select principal_id, auth_subject_id, 'HUMAN_USER',
      'CUSTOMER', gen_random_uuid(),
      'PENDING_VERIFICATION', 'LEGACY_MIGRATION', 'AUTH-DB-019', 'PGTAP', 'AUTH-DB-019'
    from auth_db_019_test_ids
    where label = 'aux_1'
  $$,
  '23514',
  null,
  'LEGACY_MIGRATION cannot omit its evidence reference'
);

-- 59
select lives_ok(
  $$
    update identity_access.principals p
    set auth_subject_id = replacement.auth_subject_id,
        updated_at = now()
    from auth_db_019_test_ids source
    cross join auth_db_019_test_ids replacement
    where source.label = 'aux_1'
      and replacement.label = 'aux_2'
      and p.id = source.principal_id
  $$,
  'replacing an Auth subject does not require replacing the enterprise principal'
);

-- 60
select ok(
  exists (
    select 1
    from identity_access.principals p
    join auth_db_019_test_ids source on source.label = 'aux_1' and p.id = source.principal_id
    join auth_db_019_test_ids replacement on replacement.label = 'aux_2' and p.auth_subject_id = replacement.auth_subject_id
    join identity_access.enterprise_identity_links l
      on l.id = source.link_id
     and l.principal_id = source.principal_id
     and l.enterprise_identity_id = source.enterprise_id
     and l.auth_subject_id = source.auth_subject_id
     and l.link_origin = 'LEGACY_MIGRATION'
     and l.audit_reference = 'PGTAP:legacy-evidence'
  ),
  'Auth account replacement preserves principal identity, enterprise identity, historical Auth subject, origin, and evidence'
);

-- 61
select lives_ok(
  $$
    with old_link as (
      update identity_access.enterprise_identity_links l
      set link_state = 'SUPERSEDED',
          superseded_at = now(),
          updated_at = now()
      from auth_db_019_test_ids source
      where source.label = 'aux_1'
        and l.id = source.link_id
      returning l.id, l.principal_id, l.principal_kind, l.enterprise_identity_kind, l.enterprise_identity_id
    )
    insert into identity_access.enterprise_identity_links (
      principal_id, auth_subject_id, principal_kind,
      enterprise_identity_kind, enterprise_identity_id,
      link_state, link_origin, authority_reference, reason_code,
      supersedes_link_id, audit_reference, source_version
    )
    select old_link.principal_id, replacement.auth_subject_id, old_link.principal_kind,
      old_link.enterprise_identity_kind, old_link.enterprise_identity_id,
      'PENDING_VERIFICATION', 'MANUAL_RECONCILIATION', 'AUTH-DB-019', 'PGTAP',
      old_link.id, 'PGTAP:supersession', 'AUTH-DB-019'
    from old_link
    cross join auth_db_019_test_ids replacement
    where replacement.label = 'aux_2'
  $$,
  'supersession creates a successor link without overwriting the historical link'
);

-- 62
select is(
  (
    select count(*)
    from identity_access.enterprise_identity_links l
    join auth_db_019_test_ids source on source.label = 'aux_1'
    where l.principal_id = source.principal_id
      and l.enterprise_identity_id = source.enterprise_id
      and l.link_state in ('SUPERSEDED', 'PENDING_VERIFICATION')
  ),
  2::bigint,
  'supersession preserves both historical and successor link records'
);

-- 63
select is(
  (
    select count(*)
    from identity_access.enterprise_identity_links l
    join auth_db_019_test_ids h on h.label = 'human_1' and h.principal_id = l.principal_id
    where l.enterprise_identity_kind = 'EMPLOYEE'
      and l.link_state = 'ACTIVE'
  ),
  1::bigint,
  'AUTH-DB-033 can consume exactly one unambiguous ACTIVE EMPLOYEE identity for the canonical human fixture'
);

-- 64
select is(
  (
    select count(*)
    from information_schema.columns
    where table_schema = 'identity_access'
      and table_name in ('principals', 'identity_resolution_cases', 'enterprise_identity_links')
      and column_name in ('email', 'phone', 'raw_user_meta_data', 'raw_app_meta_data')
  ),
  0::bigint,
  'contact and Auth metadata are not persisted as linking authority in the target foundation'
);

-- 65
select is(
  (
    select count(*)
    from identity_access.enterprise_identity_links l
    join auth_db_019_test_ids s on s.label = 'service_1' and s.principal_id = l.principal_id
    where l.enterprise_identity_kind = 'SYSTEM_ACTOR'
      and l.link_state = 'ACTIVE'
  ),
  1::bigint,
  'normal identity resolution selects ACTIVE and excludes pending suspended revoked superseded and conflict history'
);

-- 66
select is(
  (select count(*) from auth_db_019_actual_auth_fks),
  73::bigint,
  'transactional identity fixtures do not mutate any legacy Auth FK'
);

delete from identity_access.enterprise_identity_links;
delete from identity_access.identity_resolution_cases;
delete from identity_access.principals;

-- 67
select is(
  (
    (select count(*) from identity_access.principals)
    + (select count(*) from identity_access.identity_resolution_cases)
    + (select count(*) from identity_access.enterprise_identity_links)
  ),
  0::bigint,
  'pgTAP fixtures leave the AUTH-DB-019 target tables empty before rollback'
);

select * from finish();
rollback;
