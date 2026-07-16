do $migration$
declare
  fn record;
begin
  for fn in
    select distinct
      p.oid,
      n.nspname as schema_name,
      p.proname as function_name,
      pg_get_function_identity_arguments(p.oid) as identity_arguments
    from pg_proc p
    join pg_namespace n on n.oid = p.pronamespace
    join pg_trigger t on t.tgfoid = p.oid
    where not t.tgisinternal
      and p.prorettype = 'trigger'::regtype
      and n.nspname in (
        'public',
        'pass',
        'talento',
        'vital',
        'club',
        'viso',
        'pos',
        'payments'
      )
  loop
    execute format(
      'revoke execute on function %I.%I(%s) from public, anon, authenticated',
      fn.schema_name,
      fn.function_name,
      fn.identity_arguments
    );
  end loop;
end
$migration$;