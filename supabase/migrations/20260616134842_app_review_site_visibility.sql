begin;

alter table public.sites
  add column if not exists operational_visibility text not null default 'operational';

do $$
begin
  if not exists (
    select 1
    from pg_constraint
    where conname = 'sites_operational_visibility_chk'
  ) then
    alter table public.sites
      add constraint sites_operational_visibility_chk
      check (operational_visibility in ('operational', 'app_review', 'test', 'hidden'));
  end if;
end
$$;

comment on column public.sites.operational_visibility is
  'Controla si la sede aparece en flujos operativos. app_review/test/hidden se excluyen de selectores normales.';

update public.sites
set operational_visibility = 'app_review'
where lower(trim(coalesce(name, ''))) = 'app review (demo)';

commit;
