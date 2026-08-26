-- VENTO_DB_TEST_CATEGORY: RPC
begin;

create extension if not exists pgtap with schema extensions;
create schema vento_harness_rpc;

create function vento_harness_rpc.echo_value(input_value text)
returns text
language sql
security invoker
set search_path = ''
as $$
  select input_value
$$;

grant usage on schema vento_harness_rpc to authenticated;
revoke execute on function vento_harness_rpc.echo_value(text) from public;
grant execute on function vento_harness_rpc.echo_value(text) to authenticated;

select plan(4);
select ok(to_regprocedure('vento_harness_rpc.echo_value(text)') is not null, 'RPC function exists');
select is(
  (select prosecdef from pg_proc where oid = 'vento_harness_rpc.echo_value(text)'::regprocedure),
  false,
  'RPC is SECURITY INVOKER'
);
select ok(
  has_function_privilege('authenticated', 'vento_harness_rpc.echo_value(text)', 'EXECUTE'),
  'authenticated has explicit EXECUTE'
);
select is(vento_harness_rpc.echo_value('vento'), 'vento', 'RPC returns contract value');

select * from finish();
rollback;