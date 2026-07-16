do $$
declare
  fn regprocedure;
begin
  foreach fn in array array[
    to_regprocedure('public.get_operational_context(uuid,uuid,text)'),
    to_regprocedure('public.has_operational_permission(text,uuid,uuid,text)'),
    to_regprocedure('public.has_operational_role_permission(text,text,uuid,uuid,text)'),
    to_regprocedure('public.has_role_permission(text,text,uuid,uuid)')
  ]
  loop
    if fn is not null then
      execute format('revoke execute on function %s from public, anon', fn);
      execute format('grant execute on function %s to authenticated, service_role', fn);
    end if;
  end loop;
end
$$;