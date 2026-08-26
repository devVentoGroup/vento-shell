-- VENTO_DB_TEST_CATEGORY: RLS
begin;

create extension if not exists pgtap with schema extensions;
create schema vento_harness_rls;

create table vento_harness_rls.rls_fixture (
  id integer primary key,
  owner_id uuid not null,
  payload text not null
);

alter table vento_harness_rls.rls_fixture enable row level security;
grant usage on schema vento_harness_rls to authenticated;
grant select on vento_harness_rls.rls_fixture to authenticated;

create policy rls_fixture_owner_select
on vento_harness_rls.rls_fixture
for select
to authenticated
using ((select auth.uid()) = owner_id);

insert into vento_harness_rls.rls_fixture (id, owner_id, payload) values
  (1, '11111111-1111-1111-1111-111111111111', 'owned'),
  (2, '22222222-2222-2222-2222-222222222222', 'foreign');

select plan(4);
select ok(
  (select relrowsecurity from pg_class where oid = 'vento_harness_rls.rls_fixture'::regclass),
  'RLS is enabled'
);

set local role authenticated;
set local request.jwt.claim.sub = '11111111-1111-1111-1111-111111111111';

select is((select count(*) from vento_harness_rls.rls_fixture), 1::bigint, 'authorized actor sees one row');
select is((select count(*) from vento_harness_rls.rls_fixture where id = 2), 0::bigint, 'foreign row is denied');
select is((select count(*) from vento_harness_rls.rls_fixture where id = 1), 1::bigint, 'owned row is allowed');

reset role;
select * from finish();
rollback;