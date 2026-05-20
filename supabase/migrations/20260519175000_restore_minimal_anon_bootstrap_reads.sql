begin;

do $$
begin
  if to_regclass('public.app_config') is not null then
    grant select on table public.app_config to anon;
  end if;

  if to_regclass('public.app_update_policies') is not null then
    grant select on table public.app_update_policies to anon;
  end if;
end $$;

commit;
