-- VENTO_DB_TEST_CATEGORY: RPC
begin;

create extension if not exists pgtap with schema extensions;

select plan(20);

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
        where a.grantee = 'anon'::regrole::oid
      )
  ),
  0::bigint,
  'postgres public default privileges do not grant anon'
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
        where a.grantee = 'anon'::regrole::oid
      )
  ),
  3::bigint,
  'managed supabase_admin anon defaults remain unchanged'
);

select ok(
  not has_schema_privilege('anon', 'pos', 'USAGE'),
  'anon no longer has USAGE on pos'
);

select ok(
  not has_schema_privilege('anon', 'pos', 'CREATE'),
  'anon still has no CREATE on pos'
);

select ok(
  has_schema_privilege('authenticated', 'pos', 'USAGE'),
  'authenticated pos USAGE remains unchanged'
);

select ok(
  has_schema_privilege('service_role', 'pos', 'USAGE'),
  'service_role pos USAGE remains unchanged'
);

select ok(
  has_schema_privilege('anon', 'pass', 'USAGE'),
  'legacy pass anon USAGE remains frozen'
);

select ok(
  has_schema_privilege('anon', 'public', 'USAGE'),
  'legacy public anon USAGE remains frozen'
);

select ok(
  has_schema_privilege('anon', 'talento', 'USAGE'),
  'legacy talento anon USAGE remains frozen'
);

select is(
  (
    select count(*)
    from pg_catalog.pg_namespace n
    where n.nspname in (
      'app_private',
      'club',
      'pass',
      'payments',
      'pos',
      'public',
      'talento',
      'viso'
    )
      and has_schema_privilege('anon', n.oid, 'USAGE')
  ),
  3::bigint,
  'anon schema USAGE is reduced from four governed schemas to three'
);

select is(
  (
    select count(*)
    from pg_catalog.pg_namespace n
    where n.nspname in (
      'app_private',
      'club',
      'pass',
      'payments',
      'pos',
      'public',
      'talento',
      'viso'
    )
      and has_schema_privilege('anon', n.oid, 'CREATE')
  ),
  0::bigint,
  'anon CREATE remains zero on governed schemas'
);

select is(
  (
    select count(*)
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
      )
  ),
  0::bigint,
  'pos remains without anon object privileges'
);

select is(
  (
    select count(*)
    from pg_catalog.pg_proc p
    join pg_catalog.pg_namespace n on n.oid = p.pronamespace
    where n.nspname = 'pos'
      and p.prokind in ('f', 'p')
      and has_function_privilege('anon', p.oid, 'EXECUTE')
  ),
  0::bigint,
  'pos remains without anon executable functions'
);

select is(
  (
    select count(*)
    from pg_catalog.pg_class c
    join pg_catalog.pg_namespace n on n.oid = c.relnamespace
    where n.nspname = 'pos'
      and c.relkind = 'S'
      and (
        has_sequence_privilege('anon', c.oid, 'USAGE')
        or has_sequence_privilege('anon', c.oid, 'SELECT')
        or has_sequence_privilege('anon', c.oid, 'UPDATE')
      )
  ),
  0::bigint,
  'pos remains without anon sequence privileges'
);

select is(
  (
    select count(*)
    from pg_catalog.pg_class c
    join pg_catalog.pg_namespace n on n.oid = c.relnamespace
    where n.nspname in (
      'app_private',
      'club',
      'pass',
      'payments',
      'pos',
      'public',
      'talento',
      'viso'
    )
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
  39::bigint,
  'legacy anon relation surface remains frozen at 39 identities'
);

select is(
  (
    select count(*)
    from pg_catalog.pg_class c
    join pg_catalog.pg_namespace n on n.oid = c.relnamespace
    where n.nspname in (
      'app_private',
      'club',
      'pass',
      'payments',
      'pos',
      'public',
      'talento',
      'viso'
    )
      and c.relkind in ('r', 'p', 'v', 'm', 'f')
      and has_table_privilege('anon', c.oid, 'INSERT')
      and has_table_privilege('anon', c.oid, 'UPDATE')
      and has_table_privilege('anon', c.oid, 'DELETE')
  ),
  4::bigint,
  'four legacy anon DML tables remain frozen pending successors'
);

select is(
  (
    select count(*)
    from pg_catalog.pg_proc p
    join pg_catalog.pg_namespace n on n.oid = p.pronamespace
    where n.nspname in (
      'app_private',
      'club',
      'pass',
      'payments',
      'pos',
      'public',
      'talento',
      'viso'
    )
      and p.prokind in ('f', 'p')
      and has_function_privilege('anon', p.oid, 'EXECUTE')
  ),
  91::bigint,
  'legacy anon EXECUTE surface remains frozen at 91 functions'
);

select is(
  (
    select count(*)
    from pg_catalog.pg_proc p
    join pg_catalog.pg_namespace n on n.oid = p.pronamespace
    where n.nspname in (
      'app_private',
      'club',
      'pass',
      'payments',
      'pos',
      'public',
      'talento',
      'viso'
    )
      and p.prokind in ('f', 'p')
      and p.prosecdef
      and has_function_privilege('anon', p.oid, 'EXECUTE')
  ),
  43::bigint,
  'legacy anon SECURITY DEFINER surface remains frozen pending classification'
);

select is(
  (
    select count(*)
    from pg_catalog.pg_class c
    join pg_catalog.pg_namespace n on n.oid = c.relnamespace
    where n.nspname in (
      'app_private',
      'club',
      'pass',
      'payments',
      'pos',
      'public',
      'talento',
      'viso'
    )
      and c.relkind = 'S'
      and (
        has_sequence_privilege('anon', c.oid, 'USAGE')
        or has_sequence_privilege('anon', c.oid, 'SELECT')
        or has_sequence_privilege('anon', c.oid, 'UPDATE')
      )
  ),
  0::bigint,
  'anon sequence privileges remain zero'
);

select ok(
  not exists (
    select 1
    from pg_catalog.pg_namespace
    where nspname = 'api'
  ),
  'AUTH-DB-005 does not create the api schema'
);

select * from finish();
rollback;
