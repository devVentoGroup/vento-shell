begin;

create or replace function public.sync_employee_primary_site_assignment()
returns trigger
language plpgsql
security definer
set search_path to 'public'
as $$
declare
  v_employee_id uuid;
  v_preferred_site_id uuid;
  v_next_site_id uuid;
begin
  if pg_trigger_depth() > 1 then
    return coalesce(new, old);
  end if;

  v_employee_id := coalesce(new.employee_id, old.employee_id);

  if v_employee_id is null then
    return coalesce(new, old);
  end if;

  v_preferred_site_id := case
    when tg_op <> 'DELETE' and coalesce(new.is_active, true) is true then new.site_id
    else null
  end;

  select es.site_id
    into v_next_site_id
  from public.employee_sites es
  where es.employee_id = v_employee_id
    and coalesce(es.is_active, true) is true
  order by
    case
      when v_preferred_site_id is not null and es.site_id = v_preferred_site_id then 0
      else 1
    end,
    case when coalesce(es.is_primary, false) then 0 else 1 end,
    es.site_id
  limit 1;

  update public.employee_sites es
  set is_primary = (es.site_id = v_next_site_id)
  where es.employee_id = v_employee_id
    and coalesce(es.is_active, true) is true
    and es.is_primary is distinct from (es.site_id = v_next_site_id);

  update public.employees
  set
    site_id = v_next_site_id,
    updated_at = now()
  where id = v_employee_id
    and site_id is distinct from v_next_site_id;

  insert into public.employee_settings (employee_id, selected_site_id, updated_at)
  values (v_employee_id, v_next_site_id, now())
  on conflict (employee_id)
  do update set
    selected_site_id = excluded.selected_site_id,
    updated_at = excluded.updated_at
  where public.employee_settings.selected_site_id is distinct from excluded.selected_site_id;

  return coalesce(new, old);
end;
$$;

drop trigger if exists employee_sites_sync_primary_assignment on public.employee_sites;

create trigger employee_sites_sync_primary_assignment
after insert or update or delete on public.employee_sites
for each row
execute function public.sync_employee_primary_site_assignment();

create or replace function public.sync_employee_site_assignment_from_employee()
returns trigger
language plpgsql
security definer
set search_path to 'public'
as $$
begin
  if pg_trigger_depth() > 1 then
    return new;
  end if;

  if new.site_id is not null and (tg_op = 'INSERT' or new.site_id is distinct from old.site_id) then
    update public.employee_sites
    set is_primary = false
    where employee_id = new.id
      and site_id <> new.site_id
      and coalesce(is_primary, false) is true;

    insert into public.employee_sites (employee_id, site_id, is_primary, is_active)
    values (new.id, new.site_id, true, true)
    on conflict (employee_id, site_id)
    do update set
      is_primary = true,
      is_active = true;
  end if;

  if tg_op = 'INSERT' or new.site_id is distinct from old.site_id then
    insert into public.employee_settings (employee_id, selected_site_id, updated_at)
    values (new.id, new.site_id, now())
    on conflict (employee_id)
    do update set
      selected_site_id = excluded.selected_site_id,
      updated_at = excluded.updated_at
    where public.employee_settings.selected_site_id is distinct from excluded.selected_site_id;
  end if;

  return new;
end;
$$;

drop trigger if exists employees_sync_site_assignment on public.employees;
drop trigger if exists employees_sync_site_assignment_insert on public.employees;

create trigger employees_sync_site_assignment
after update of site_id on public.employees
for each row
execute function public.sync_employee_site_assignment_from_employee();

create trigger employees_sync_site_assignment_insert
after insert on public.employees
for each row
execute function public.sync_employee_site_assignment_from_employee();

with ranked_sites as (
  select
    es.employee_id,
    es.site_id,
    row_number() over (
      partition by es.employee_id
      order by
        case when coalesce(es.is_primary, false) then 0 else 1 end,
        es.site_id
    ) as site_rank
  from public.employee_sites es
  where coalesce(es.is_active, true) is true
)
update public.employees e
set
  site_id = ranked_sites.site_id,
  updated_at = now()
from ranked_sites
where ranked_sites.employee_id = e.id
  and ranked_sites.site_rank = 1
  and e.site_id is distinct from ranked_sites.site_id;

insert into public.employee_settings (employee_id, selected_site_id, updated_at)
select e.id, e.site_id, now()
from public.employees e
where e.site_id is not null
on conflict (employee_id)
do update set
  selected_site_id = excluded.selected_site_id,
  updated_at = excluded.updated_at
where public.employee_settings.selected_site_id is distinct from excluded.selected_site_id;

commit;
