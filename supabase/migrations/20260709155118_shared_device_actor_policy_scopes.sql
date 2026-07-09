create table if not exists public.shared_operational_device_actor_policies (
  id uuid primary key default gen_random_uuid(),
  device_id uuid not null references public.shared_operational_devices(id) on delete cascade,
  policy_type text not null,
  site_id uuid references public.sites(id),
  area_id uuid references public.areas(id),
  role_code text,
  employee_id uuid references public.employees(id),
  is_active boolean not null default true,
  notes text,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now(),
  constraint shared_device_actor_policies_policy_type_check check (
    policy_type in (
      'same_site_active_worker',
      'same_area_active_worker',
      'role_in_site',
      'role_in_area',
      'specific_employee',
      'any_active_worker'
    )
  ),
  constraint shared_device_actor_policies_shape_check check (
    (
      policy_type = 'same_site_active_worker'
      and site_id is not null
      and area_id is null
      and role_code is null
      and employee_id is null
    )
    or (
      policy_type = 'same_area_active_worker'
      and site_id is not null
      and area_id is not null
      and role_code is null
      and employee_id is null
    )
    or (
      policy_type = 'role_in_site'
      and site_id is not null
      and area_id is null
      and role_code is not null
      and employee_id is null
    )
    or (
      policy_type = 'role_in_area'
      and site_id is not null
      and area_id is not null
      and role_code is not null
      and employee_id is null
    )
    or (
      policy_type = 'specific_employee'
      and employee_id is not null
    )
    or (
      policy_type = 'any_active_worker'
      and site_id is null
      and area_id is null
      and role_code is null
      and employee_id is null
    )
  )
);

create index if not exists shared_device_actor_policies_device_active_idx
  on public.shared_operational_device_actor_policies(device_id)
  where is_active;

create index if not exists shared_device_actor_policies_scope_idx
  on public.shared_operational_device_actor_policies(site_id, area_id, role_code)
  where is_active;

drop trigger if exists trg_shared_device_actor_policies_updated_at on public.shared_operational_device_actor_policies;
create trigger trg_shared_device_actor_policies_updated_at
before update on public.shared_operational_device_actor_policies
for each row execute function public._set_updated_at();

create or replace function public.validate_shared_device_actor_policy_area_site()
returns trigger
language plpgsql
set search_path = public
as $$
begin
  if new.area_id is not null and not exists (
    select 1
    from public.areas a
    where a.id = new.area_id
      and a.site_id = new.site_id
  ) then
    raise exception 'El area_id % no pertenece a la sede %', new.area_id, new.site_id;
  end if;

  return new;
end;
$$;

drop trigger if exists trg_shared_device_actor_policy_area_site on public.shared_operational_device_actor_policies;
create trigger trg_shared_device_actor_policy_area_site
before insert or update of site_id, area_id on public.shared_operational_device_actor_policies
for each row execute function public.validate_shared_device_actor_policy_area_site();

alter table public.shared_operational_device_actor_policies enable row level security;

drop policy if exists shared_device_actor_policies_select_own_device on public.shared_operational_device_actor_policies;
create policy shared_device_actor_policies_select_own_device
on public.shared_operational_device_actor_policies
for select
to authenticated
using (
  exists (
    select 1
    from public.shared_operational_devices d
    where d.id = shared_operational_device_actor_policies.device_id
      and d.auth_user_id = auth.uid()
  )
);

create or replace view public.shared_operational_device_actor_policies_admin_v1 as
select
  p.id,
  p.device_id,
  d.code as device_code,
  d.label as device_label,
  p.policy_type,
  p.site_id,
  s.name as site_name,
  s.code as site_code,
  p.area_id,
  a.name as area_name,
  a.code as area_code,
  p.role_code,
  p.employee_id,
  e.full_name as employee_name,
  p.is_active,
  p.notes,
  p.created_at,
  p.updated_at
from public.shared_operational_device_actor_policies p
join public.shared_operational_devices d on d.id = p.device_id
left join public.sites s on s.id = p.site_id
left join public.areas a on a.id = p.area_id
left join public.employees e on e.id = p.employee_id;

create or replace function public.shared_device_actor_is_allowed_v1(
  p_device_id uuid,
  p_actor_employee_id uuid,
  p_site_id uuid default null,
  p_area_id uuid default null
)
returns boolean
language sql
stable
security definer
set search_path = public, auth
as $$
  with actor as (
    select
      e.id,
      e.role,
      e.site_id as default_site_id,
      e.is_active
    from public.employees e
    where e.id = p_actor_employee_id
  ),
  last_attendance as (
    select
      al.employee_id,
      al.action,
      al.site_id,
      al.shift_id,
      al.device_info
    from public.attendance_logs al
    where al.employee_id = p_actor_employee_id
      and al.action in ('check_in', 'check_out')
    order by al.occurred_at desc, al.created_at desc
    limit 1
  ),
  active_context as (
    select
      la.employee_id,
      coalesce(
        nullif(la.device_info #>> '{operationalContext,siteId}', '')::uuid,
        la.site_id
      ) as active_site_id,
      nullif(la.device_info #>> '{operationalContext,areaId}', '')::uuid as active_area_id,
      coalesce(
        nullif(la.device_info #>> '{operationalContext,operationalRole}', ''),
        a.role
      ) as active_role
    from last_attendance la
    join actor a on a.id = la.employee_id
    where la.action = 'check_in'
  )
  select exists (
    select 1
    from public.shared_operational_device_actor_policies p
    join actor a on a.is_active
    left join active_context ac on true
    where p.device_id = p_device_id
      and p.is_active
      and ac.employee_id is not null
      and (
        (p.policy_type = 'any_active_worker')
        or (
          p.policy_type = 'same_site_active_worker'
          and ac.active_site_id = p.site_id
        )
        or (
          p.policy_type = 'same_area_active_worker'
          and ac.active_site_id = p.site_id
          and ac.active_area_id = p.area_id
        )
        or (
          p.policy_type = 'role_in_site'
          and ac.active_site_id = p.site_id
          and ac.active_role = p.role_code
        )
        or (
          p.policy_type = 'role_in_area'
          and ac.active_site_id = p.site_id
          and ac.active_area_id = p.area_id
          and ac.active_role = p.role_code
        )
        or (
          p.policy_type = 'specific_employee'
          and a.id = p.employee_id
        )
      )
      and (p_site_id is null or ac.active_site_id = p_site_id)
      and (p_area_id is null or ac.active_area_id = p_area_id)
  );
$$;

insert into public.shared_operational_device_actor_policies (
  device_id,
  policy_type,
  site_id,
  area_id,
  role_code,
  employee_id,
  is_active,
  notes
)
select
  d.id,
  'same_site_active_worker',
  d.site_id,
  null,
  null,
  null,
  true,
  'Kiosco de bodega CP: puede ser usado por cualquier trabajador activo del Centro de Producción con jornada abierta.'
from public.shared_operational_devices d
where d.code = 'KIOSCO_BODEGA_CP'
on conflict do nothing;

grant select on public.shared_operational_device_actor_policies_admin_v1 to authenticated;
grant execute on function public.shared_device_actor_is_allowed_v1(uuid, uuid, uuid, uuid) to authenticated;

comment on table public.shared_operational_device_actor_policies is 'Políticas flexibles de qué trabajadores pueden actuar sobre un dispositivo compartido.';
comment on function public.shared_device_actor_is_allowed_v1(uuid, uuid, uuid, uuid) is 'Valida si un actor humano activo con jornada abierta puede operar un dispositivo compartido según sus políticas.';
