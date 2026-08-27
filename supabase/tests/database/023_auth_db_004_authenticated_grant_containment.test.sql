-- VENTO_DB_TEST_CATEGORY: RPC
begin;

create extension if not exists pgtap with schema extensions;

select plan(14);

select is(
  (
    select count(*)
    from pg_catalog.pg_default_acl d
    join pg_catalog.pg_namespace n on n.oid = d.defaclnamespace
    where d.defaclrole = 'postgres'::regrole::oid
      and n.nspname = 'public'
      and d.defaclobjtype in ('r', 'f', 'S')
      and exists (
        select 1
        from aclexplode(d.defaclacl) a
        where a.grantee = 'authenticated'::regrole::oid
      )
  ),
  0::bigint,
  'postgres public default privileges no longer grant authenticated'
);

select is(
  (
    select count(*)
    from pg_catalog.pg_default_acl d
    join pg_catalog.pg_namespace n on n.oid = d.defaclnamespace
    where d.defaclrole = 'supabase_admin'::regrole::oid
      and n.nspname = 'public'
      and d.defaclobjtype in ('r', 'f', 'S')
      and exists (
        select 1
        from aclexplode(d.defaclacl) a
        where a.grantee = 'authenticated'::regrole::oid
      )
  ),
  3::bigint,
  'managed supabase_admin defaults remain unchanged'
);

select ok(
  to_regprocedure('pass.validate_catalog_item_product_site()') is not null,
  'target trigger function exists'
);

select is(
  (
    select md5(replace(p.prosrc, E'\r\n', E'\n'))
    from pg_catalog.pg_proc p
    where p.oid = to_regprocedure('pass.validate_catalog_item_product_site()')
  ),
  'e51c9a8b3e91f8c2269e55d47a27ce6b'::text,
  'target trigger body is unchanged'
);

select ok(
  (
    select p.prosecdef
    from pg_catalog.pg_proc p
    where p.oid = to_regprocedure('pass.validate_catalog_item_product_site()')
  ),
  'AUTH-DB-004 does not change SECURITY DEFINER mode'
);

select is(
  (
    select count(*)
    from pg_catalog.pg_trigger t
    where t.tgfoid = to_regprocedure('pass.validate_catalog_item_product_site()')
      and not t.tgisinternal
  ),
  1::bigint,
  'target trigger association remains present'
);

select ok(
  not has_function_privilege(
    'authenticated',
    to_regprocedure('pass.validate_catalog_item_product_site()'),
    'EXECUTE'
  ),
  'authenticated cannot execute the trigger function directly'
);

select ok(
  not has_function_privilege(
    'anon',
    to_regprocedure('pass.validate_catalog_item_product_site()'),
    'EXECUTE'
  ),
  'anon privilege remains unchanged and denied'
);

select ok(
  has_function_privilege(
    'service_role',
    to_regprocedure('pass.validate_catalog_item_product_site()'),
    'EXECUTE'
  ),
  'service_role privilege remains unchanged'
);

select ok(
  not exists (
    select 1
    from pg_catalog.pg_namespace
    where nspname = 'api'
  ),
  'AUTH-DB-004 does not create the api schema'
);

select is(
  (
    select count(*)
    from pg_catalog.pg_class c
    join pg_catalog.pg_namespace n on n.oid = c.relnamespace
    where c.relkind = 'S'
      and n.nspname in (
        'app_private',
        'club',
        'pass',
        'payments',
        'pos',
        'public',
        'talento',
        'viso'
      )
      and has_sequence_privilege('authenticated', c.oid, 'USAGE')
      and has_sequence_privilege('authenticated', c.oid, 'SELECT')
      and has_sequence_privilege('authenticated', c.oid, 'UPDATE')
  ),
  2::bigint,
  'existing authenticated sequence compatibility remains intact'
);

select ok(
  has_sequence_privilege('authenticated', 'public.inventory_sku_seq', 'USAGE'),
  'inventory_sku_seq compatibility remains intact'
);

select ok(
  has_sequence_privilege('authenticated', 'public.lpn_sequence', 'USAGE'),
  'lpn_sequence compatibility remains intact'
);

select is(
  (
    select count(*)
    from pg_catalog.pg_namespace n
    where n.nspname in ('app_private', 'viso')
      and has_schema_privilege('authenticated', n.oid, 'USAGE')
  ),
  0::bigint,
  'private app_private and viso schemas remain without authenticated USAGE'
);

select * from finish();
rollback;
