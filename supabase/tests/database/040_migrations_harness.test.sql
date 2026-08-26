-- VENTO_DB_TEST_CATEGORY: MIGRATIONS
begin;

create extension if not exists pgtap with schema extensions;
select plan(4);

select ok(
  to_regclass('supabase_migrations.schema_migrations') is not null,
  'Supabase migration history exists'
);
select ok(
  (select count(*) > 0 from supabase_migrations.schema_migrations),
  'at least one migration is recorded as applied locally'
);
select is(
  (current_setting('server_version_num')::integer / 10000),
  17,
  'runtime PostgreSQL major matches supabase/config.toml'
);
select ok(
  (
    select count(*) = count(distinct version)
    from supabase_migrations.schema_migrations
  ),
  'applied migration versions are unique'
);

select * from finish();
rollback;