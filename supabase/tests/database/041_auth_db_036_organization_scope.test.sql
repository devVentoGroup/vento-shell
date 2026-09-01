-- VENTO_DB_TEST_CATEGORY: SCHEMA
begin;

create extension
if not exists pgtap
with schema extensions;

select plan(58);

select ok(
  to_regnamespace('org_governance') is not null,
  'org_governance exists'
);

select ok(
  to_regclass(
    'org_governance.organization_scopes'
  ) is not null,
  'organization_scopes exists'
);

select is(
  (
    select array_agg(
      c.column_name::text
      order by c.ordinal_position
    )
    from information_schema.columns c
    where c.table_schema = 'org_governance'
      and c.table_name = 'organization_scopes'
  ),
  array[
    'organization_id',
    'organization_code',
    'display_name',
    'status',
    'created_at',
    'updated_at'
  ]::text[],
  'organization_scopes has the exact minimum six-column shape'
);

select is(
  (
    select c.udt_name
    from information_schema.columns c
    where c.table_schema = 'org_governance'
      and c.table_name = 'organization_scopes'
      and c.column_name = 'organization_id'
  ),
  'uuid',
  'organization_id is uuid'
);

select is(
  (
    select c.is_nullable
    from information_schema.columns c
    where c.table_schema = 'org_governance'
      and c.table_name = 'organization_scopes'
      and c.column_name = 'organization_id'
  ),
  'NO',
  'organization_id is not nullable'
);

select ok(
  (
    select c.column_default
    from information_schema.columns c
    where c.table_schema = 'org_governance'
      and c.table_name = 'organization_scopes'
      and c.column_name = 'organization_id'
  ) like '%gen_random_uuid%',
  'organization_id is generated server-side'
);

select is(
  (
    select c.udt_name
    from information_schema.columns c
    where c.table_schema = 'org_governance'
      and c.table_name = 'organization_scopes'
      and c.column_name = 'organization_code'
  ),
  'text',
  'organization_code is text'
);

select is(
  (
    select c.is_nullable
    from information_schema.columns c
    where c.table_schema = 'org_governance'
      and c.table_name = 'organization_scopes'
      and c.column_name = 'organization_code'
  ),
  'NO',
  'organization_code is not nullable'
);

select is(
  (
    select c.udt_name
    from information_schema.columns c
    where c.table_schema = 'org_governance'
      and c.table_name = 'organization_scopes'
      and c.column_name = 'display_name'
  ),
  'text',
  'display_name is text'
);

select is(
  (
    select c.is_nullable
    from information_schema.columns c
    where c.table_schema = 'org_governance'
      and c.table_name = 'organization_scopes'
      and c.column_name = 'display_name'
  ),
  'NO',
  'display_name is not nullable'
);

select is(
  (
    select c.udt_name
    from information_schema.columns c
    where c.table_schema = 'org_governance'
      and c.table_name = 'organization_scopes'
      and c.column_name = 'status'
  ),
  'text',
  'status is text'
);

select is(
  (
    select c.is_nullable
    from information_schema.columns c
    where c.table_schema = 'org_governance'
      and c.table_name = 'organization_scopes'
      and c.column_name = 'status'
  ),
  'NO',
  'status is not nullable'
);

select is(
  (
    select c.udt_name
    from information_schema.columns c
    where c.table_schema = 'org_governance'
      and c.table_name = 'organization_scopes'
      and c.column_name = 'created_at'
  ),
  'timestamptz',
  'created_at is timestamptz'
);

select is(
  (
    select c.is_nullable
    from information_schema.columns c
    where c.table_schema = 'org_governance'
      and c.table_name = 'organization_scopes'
      and c.column_name = 'created_at'
  ),
  'NO',
  'created_at is not nullable'
);

select is(
  (
    select c.udt_name
    from information_schema.columns c
    where c.table_schema = 'org_governance'
      and c.table_name = 'organization_scopes'
      and c.column_name = 'updated_at'
  ),
  'timestamptz',
  'updated_at is timestamptz'
);

select is(
  (
    select c.is_nullable
    from information_schema.columns c
    where c.table_schema = 'org_governance'
      and c.table_name = 'organization_scopes'
      and c.column_name = 'updated_at'
  ),
  'NO',
  'updated_at is not nullable'
);

select is(
  (
    select count(*)
    from pg_catalog.pg_constraint c
    where c.conrelid =
      'org_governance.organization_scopes'::regclass
      and c.contype = 'p'
      and pg_catalog.pg_get_constraintdef(c.oid)
        = 'PRIMARY KEY (organization_id)'
  ),
  1::bigint,
  'organization_id is the primary key'
);

select is(
  (
    select count(*)
    from pg_catalog.pg_constraint c
    where c.conrelid =
      'org_governance.organization_scopes'::regclass
      and c.contype = 'u'
      and pg_catalog.pg_get_constraintdef(c.oid)
        = 'UNIQUE (organization_code)'
  ),
  1::bigint,
  'organization_code is unique'
);

select is(
  (
    select count(*)
    from pg_catalog.pg_constraint c
    where c.conrelid =
      'org_governance.organization_scopes'::regclass
      and c.contype = 'c'
      and pg_catalog.pg_get_constraintdef(c.oid)
        like '%ACTIVE%'
      and pg_catalog.pg_get_constraintdef(c.oid)
        like '%INACTIVE%'
  ),
  1::bigint,
  'status has the approved ACTIVE INACTIVE vocabulary'
);

select ok(
  (
    select c.relrowsecurity
    from pg_catalog.pg_class c
    where c.oid =
      'org_governance.organization_scopes'::regclass
  ),
  'organization_scopes has RLS enabled as defense in depth'
);

select is(
  (
    select count(*)
    from pg_catalog.pg_policy p
    where p.polrelid =
      'org_governance.organization_scopes'::regclass
      and (
        0::oid = any(p.polroles)
        or p.polroles && array[
          'anon'::regrole::oid,
          'authenticated'::regrole::oid,
          'service_role'::regrole::oid
        ]
      )
  ),
  0::bigint,
  'organization_scopes publishes no client RLS policy'
);

select ok(
  to_regprocedure(
    'org_governance.enforce_organization_scope_identity()'
  ) is not null,
  'identity guard function exists'
);

select ok(
  not (
    select p.prosecdef
    from pg_catalog.pg_proc p
    where p.oid =
      'org_governance.enforce_organization_scope_identity()'
        ::regprocedure
  ),
  'identity guard is SECURITY INVOKER'
);

select is(
  (
    select count(*)
    from pg_catalog.pg_trigger t
    where t.tgrelid =
      'org_governance.organization_scopes'::regclass
      and t.tgname =
        'organization_scopes_identity_guard'
      and not t.tgisinternal
  ),
  1::bigint,
  'identity guard trigger exists exactly once'
);

select ok(
  to_regprocedure(
    'app_private.resolve_organization_id()'
  ) is not null,
  'private organization resolver exists'
);

select is(
  (
    select p.prorettype
    from pg_catalog.pg_proc p
    where p.oid =
      'app_private.resolve_organization_id()'::regprocedure
  ),
  'uuid'::regtype::oid,
  'organization resolver returns uuid'
);

select is(
  (
    select p.provolatile
    from pg_catalog.pg_proc p
    where p.oid =
      'app_private.resolve_organization_id()'::regprocedure
  ),
  's'::"char",
  'organization resolver is stable'
);

select ok(
  not (
    select p.prosecdef
    from pg_catalog.pg_proc p
    where p.oid =
      'app_private.resolve_organization_id()'::regprocedure
  ),
  'organization resolver is SECURITY INVOKER'
);

select ok(
  (
    select coalesce(
      array_to_string(p.proconfig, ','),
      ''
    )
    from pg_catalog.pg_proc p
    where p.oid =
      'app_private.resolve_organization_id()'::regprocedure
  ) in (
    'search_path=""',
    'search_path='
  ),
  'organization resolver has an empty fixed search_path'
);

select ok(
  not has_function_privilege(
    'public',
    'app_private.resolve_organization_id()',
    'EXECUTE'
  ),
  'PUBLIC cannot execute organization resolver'
);

select ok(
  not has_function_privilege(
    'anon',
    'app_private.resolve_organization_id()',
    'EXECUTE'
  ),
  'anon cannot execute organization resolver'
);

select ok(
  not has_function_privilege(
    'authenticated',
    'app_private.resolve_organization_id()',
    'EXECUTE'
  ),
  'authenticated cannot execute organization resolver'
);

select ok(
  not has_function_privilege(
    'service_role',
    'app_private.resolve_organization_id()',
    'EXECUTE'
  ),
  'service_role receives no implicit organization resolver execution'
);

select is(
  (
    select count(*)
    from (
      values
        ('anon'),
        ('authenticated'),
        ('service_role')
    ) roles(role_name)
    where has_schema_privilege(
      roles.role_name,
      'org_governance',
      'USAGE'
    )
  ),
  0::bigint,
  'runtime roles have zero org_governance USAGE'
);

select is(
  (
    select count(*)
    from pg_catalog.pg_namespace n
    cross join lateral pg_catalog.aclexplode(
      coalesce(
        n.nspacl,
        pg_catalog.acldefault('n', n.nspowner)
      )
    ) a
    where n.nspname = 'org_governance'
      and a.grantee = 0::oid
      and a.privilege_type in ('USAGE', 'CREATE')
  ),
  0::bigint,
  'PUBLIC has zero org_governance privileges'
);

select is(
  (
    select count(*)
    from (
      values
        ('anon'),
        ('authenticated'),
        ('service_role')
    ) roles(role_name)
    where
      has_table_privilege(
        roles.role_name,
        'org_governance.organization_scopes',
        'SELECT'
      )
      or has_table_privilege(
        roles.role_name,
        'org_governance.organization_scopes',
        'INSERT'
      )
      or has_table_privilege(
        roles.role_name,
        'org_governance.organization_scopes',
        'UPDATE'
      )
      or has_table_privilege(
        roles.role_name,
        'org_governance.organization_scopes',
        'DELETE'
      )
  ),
  0::bigint,
  'runtime roles have zero direct organization_scopes DML'
);

select is(
  (
    select count(*)
    from pg_catalog.pg_class c
    cross join lateral pg_catalog.aclexplode(
      coalesce(
        c.relacl,
        pg_catalog.acldefault('r', c.relowner)
      )
    ) a
    where c.oid =
      'org_governance.organization_scopes'::regclass
      and a.grantee = 0::oid
  ),
  0::bigint,
  'PUBLIC has zero direct organization_scopes privileges'
);

select is(
  (
    select count(*)
    from org_governance.organization_scopes
  ),
  1::bigint,
  'bootstrap creates exactly one organization scope'
);

select is(
  (
    select organization_code
    from org_governance.organization_scopes
    limit 1
  ),
  'VENTO_GROUP_ECOSYSTEM',
  'bootstrap organization code is exact'
);

select is(
  (
    select display_name
    from org_governance.organization_scopes
    limit 1
  ),
  'Vento Group — Ecosistema',
  'bootstrap display name is exact'
);

select is(
  (
    select status
    from org_governance.organization_scopes
    limit 1
  ),
  'ACTIVE',
  'bootstrap organization is ACTIVE'
);

select ok(
  (
    select organization_id
    from org_governance.organization_scopes
    limit 1
  ) is not null,
  'bootstrap UUID is non-null'
);

select is(
  app_private.resolve_organization_id(),
  (
    select organization_id
    from org_governance.organization_scopes
    where organization_code =
      'VENTO_GROUP_ECOSYSTEM'
  ),
  'resolver returns bootstrap UUID'
);

create temporary table auth_db_036_root_before
on commit drop
as
select *
from org_governance.organization_scopes
where organization_code =
  'VENTO_GROUP_ECOSYSTEM';

insert into org_governance.organization_scopes (
  organization_code,
  display_name,
  status
)
values (
  'VENTO_GROUP_ECOSYSTEM',
  'Vento Group — Ecosistema',
  'ACTIVE'
)
on conflict (organization_code)
do nothing;

select is(
  (
    select count(*)
    from org_governance.organization_scopes
    where organization_code =
      'VENTO_GROUP_ECOSYSTEM'
  ),
  1::bigint,
  'repeating bootstrap does not duplicate root'
);

select is(
  (
    select organization_id
    from org_governance.organization_scopes
    where organization_code =
      'VENTO_GROUP_ECOSYSTEM'
  ),
  (
    select organization_id
    from auth_db_036_root_before
  ),
  'repeating bootstrap preserves UUID'
);

select throws_ok(
  $$
    update org_governance.organization_scopes
    set organization_id = gen_random_uuid()
    where organization_code =
      'VENTO_GROUP_ECOSYSTEM'
  $$,
  '22023',
  'ORGANIZATION_ID_IMMUTABLE',
  'organization_id cannot be changed'
);

select throws_ok(
  $$
    update org_governance.organization_scopes
    set organization_code =
      'AUTH_DB_036_FORBIDDEN_RENAME'
    where organization_code =
      'VENTO_GROUP_ECOSYSTEM'
  $$,
  '22023',
  'ORGANIZATION_CODE_IMMUTABLE',
  'organization_code cannot be changed'
);

update org_governance.organization_scopes
set display_name =
  'Vento Group — Ecosistema TEST'
where organization_code =
  'VENTO_GROUP_ECOSYSTEM';

select is(
  (
    select display_name
    from org_governance.organization_scopes
    where organization_code =
      'VENTO_GROUP_ECOSYSTEM'
  ),
  'Vento Group — Ecosistema TEST',
  'display_name remains mutable'
);

select ok(
  (
    select organization_id
    from org_governance.organization_scopes
    where organization_code =
      'VENTO_GROUP_ECOSYSTEM'
  ) = (
    select organization_id
    from auth_db_036_root_before
  )
  and (
    select organization_code
    from org_governance.organization_scopes
    where organization_code =
      'VENTO_GROUP_ECOSYSTEM'
  ) = (
    select organization_code
    from auth_db_036_root_before
  ),
  'mutable update preserves organization identity'
);

select ok(
  (
    select updated_at
    from org_governance.organization_scopes
    where organization_code =
      'VENTO_GROUP_ECOSYSTEM'
  ) > (
    select updated_at
    from auth_db_036_root_before
  ),
  'mutable update advances updated_at'
);

update org_governance.organization_scopes
set display_name =
  'Vento Group — Ecosistema'
where organization_code =
  'VENTO_GROUP_ECOSYSTEM';

update org_governance.organization_scopes
set status = 'INACTIVE'
where organization_code =
  'VENTO_GROUP_ECOSYSTEM';

select throws_ok(
  $$select app_private.resolve_organization_id()$$,
  'P0001',
  'ORGANIZATION_SCOPE_MISSING',
  'zero ACTIVE organizations fails closed'
);

update org_governance.organization_scopes
set status = 'ACTIVE'
where organization_code =
  'VENTO_GROUP_ECOSYSTEM';

insert into org_governance.organization_scopes (
  organization_code,
  display_name,
  status
)
values (
  'AUTH_DB_036_SECONDARY_TEST',
  'AUTH DB 036 Secondary Test',
  'ACTIVE'
);

select throws_ok(
  $$select app_private.resolve_organization_id()$$,
  'P0001',
  'ORGANIZATION_SCOPE_AMBIGUOUS',
  'multiple ACTIVE organizations fail closed'
);

delete from org_governance.organization_scopes
where organization_code =
  'AUTH_DB_036_SECONDARY_TEST';

select is(
  app_private.resolve_organization_id(),
  (
    select organization_id
    from auth_db_036_root_before
  ),
  'resolver returns the same root after negative tests'
);

select is(
  (
    select count(*)
    from pg_catalog.pg_constraint c
    where c.conrelid =
      'org_governance.organization_scopes'::regclass
      and c.contype = 'f'
      and c.confrelid = 'public.sites'::regclass
  ),
  0::bigint,
  'public.sites is not organization authority'
);

select is(
  (
    select count(*)
    from pg_catalog.pg_default_acl d
    join pg_catalog.pg_namespace n
      on n.oid = d.defaclnamespace
    cross join lateral pg_catalog.aclexplode(
      d.defaclacl
    ) a
    where n.nspname = 'org_governance'
      and (
        a.grantee = 0::oid
        or a.grantee in (
          'anon'::regrole::oid,
          'authenticated'::regrole::oid,
          'service_role'::regrole::oid
        )
      )
  ),
  0::bigint,
  'org_governance default privileges contain no broad runtime grants'
);

select ok(
  (
    select pg_catalog.pg_get_userbyid(c.relowner)
    from pg_catalog.pg_class c
    where c.oid =
      'org_governance.organization_scopes'::regclass
  ) not in (
    'anon',
    'authenticated',
    'service_role'
  ),
  'organization_scopes owner is not a runtime role'
);

select ok(
  (
    select pg_catalog.pg_get_userbyid(p.proowner)
    from pg_catalog.pg_proc p
    where p.oid =
      'app_private.resolve_organization_id()'::regprocedure
  ) not in (
    'anon',
    'authenticated',
    'service_role'
  ),
  'organization resolver owner is not a runtime role'
);

select ok(
  (
    select pg_catalog.pg_get_userbyid(p.proowner)
    from pg_catalog.pg_proc p
    where p.oid =
      'org_governance.enforce_organization_scope_identity()'
        ::regprocedure
  ) not in (
    'anon',
    'authenticated',
    'service_role'
  ),
  'identity guard owner is not a runtime role'
);

select *
from finish();

rollback;
