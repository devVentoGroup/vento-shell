-- VENTO_DB_TEST_CATEGORY: SCHEMA
begin;

create extension if not exists pgtap with schema extensions;
select plan(4);

select ok(to_regnamespace('public') is not null, 'public schema exists');
select ok(to_regnamespace('auth') is not null, 'auth schema exists');
select ok(to_regclass('auth.users') is not null, 'auth.users exists');
select ok(to_regtype('uuid') is not null, 'uuid type exists');

select * from finish();
rollback;