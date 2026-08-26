create table if not exists public.shared_operational_device_templates (
  id uuid primary key default gen_random_uuid(),
  code text not null unique,
  label text not null,
  description text,
  device_type text not null default 'shared_terminal',
  default_app_code text not null references public.apps(code),
  requires_actor_pin boolean not null default true,
  requires_active_actor_shift boolean not null default true,
  allow_actor_without_pin boolean not null default false,
  allow_actions_without_actor boolean not null default false,
  is_active boolean not null default true,
  sort_order integer not null default 1000,
  metadata jsonb not null default '{}'::jsonb,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now(),
  constraint shared_device_templates_code_not_blank check (btrim(code) <> ''),
  constraint shared_device_templates_label_not_blank check (btrim(label) <> ''),
  constraint shared_device_templates_device_type_check check (
    device_type in (
      'shared_terminal',
      'pos_terminal',
      'kiosk',
      'tablet',
      'reception_terminal',
      'production_terminal',
      'warehouse_terminal'
    )
  ),
  constraint shared_device_templates_actor_policy_check check (
    not allow_actions_without_actor or allow_actor_without_pin
  )
);

create table if not exists public.shared_operational_device_template_apps (
  id uuid primary key default gen_random_uuid(),
  template_id uuid not null references public.shared_operational_device_templates(id) on delete cascade,
  app_code text not null references public.apps(code),
  is_default boolean not null default false,
  is_active boolean not null default true,
  sort_order integer not null default 1000,
  created_at timestamptz not null default now(),
  constraint shared_device_template_apps_unique unique (template_id, app_code)
);

create unique index if not exists shared_device_template_apps_one_default_idx
  on public.shared_operational_device_template_apps(template_id)
  where is_default and is_active;

create table if not exists public.shared_operational_device_template_actor_policies (
  id uuid primary key default gen_random_uuid(),
  template_id uuid not null references public.shared_operational_device_templates(id) on delete cascade,
  policy_type text not null,
  scope_strategy text not null default 'device_site',
  role_code text,
  employee_id uuid references public.employees(id),
  is_active boolean not null default true,
  sort_order integer not null default 1000,
  notes text,
  created_at timestamptz not null default now(),
  constraint shared_device_template_actor_policies_policy_type_check check (
    policy_type in (
      'same_site_active_worker',
      'same_area_active_worker',
      'role_in_site',
      'role_in_area',
      'specific_employee',
      'any_active_worker'
    )
  ),
  constraint shared_device_template_actor_policies_scope_strategy_check check (
    scope_strategy in (
      'device_site',
      'device_area',
      'global',
      'explicit_employee'
    )
  ),
  constraint shared_device_template_actor_policies_shape_check check (
    (
      policy_type in ('same_site_active_worker', 'role_in_site')
      and scope_strategy = 'device_site'
      and employee_id is null
    )
    or (
      policy_type in ('same_area_active_worker', 'role_in_area')
      and scope_strategy = 'device_area'
      and employee_id is null
    )
    or (
      policy_type = 'specific_employee'
      and scope_strategy = 'explicit_employee'
      and employee_id is not null
    )
    or (
      policy_type = 'any_active_worker'
      and scope_strategy = 'global'
      and role_code is null
      and employee_id is null
    )
  )
);

alter table public.shared_operational_devices
  add column if not exists template_id uuid references public.shared_operational_device_templates(id);

create index if not exists shared_operational_devices_template_idx
  on public.shared_operational_devices(template_id);

create index if not exists shared_device_templates_active_sort_idx
  on public.shared_operational_device_templates(is_active, sort_order, label);

create index if not exists shared_device_template_apps_template_sort_idx
  on public.shared_operational_device_template_apps(template_id, sort_order)
  where is_active;

create index if not exists shared_device_template_actor_policies_template_sort_idx
  on public.shared_operational_device_template_actor_policies(template_id, sort_order)
  where is_active;

drop trigger if exists trg_shared_device_templates_updated_at on public.shared_operational_device_templates;
create trigger trg_shared_device_templates_updated_at
before update on public.shared_operational_device_templates
for each row execute function public._set_updated_at();

alter table public.shared_operational_device_templates enable row level security;
alter table public.shared_operational_device_template_apps enable row level security;
alter table public.shared_operational_device_template_actor_policies enable row level security;

drop policy if exists shared_device_templates_select_authenticated on public.shared_operational_device_templates;
create policy shared_device_templates_select_authenticated
on public.shared_operational_device_templates
for select
to authenticated
using (is_active);

drop policy if exists shared_device_template_apps_select_authenticated on public.shared_operational_device_template_apps;
create policy shared_device_template_apps_select_authenticated
on public.shared_operational_device_template_apps
for select
to authenticated
using (
  is_active and exists (
    select 1
    from public.shared_operational_device_templates t
    where t.id = shared_operational_device_template_apps.template_id
      and t.is_active
  )
);

drop policy if exists shared_device_template_actor_policies_select_authenticated on public.shared_operational_device_template_actor_policies;
create policy shared_device_template_actor_policies_select_authenticated
on public.shared_operational_device_template_actor_policies
for select
to authenticated
using (
  is_active and exists (
    select 1
    from public.shared_operational_device_templates t
    where t.id = shared_operational_device_template_actor_policies.template_id
      and t.is_active
  )
);

create or replace view public.shared_operational_device_templates_admin_v1 as
select
  t.id,
  t.code,
  t.label,
  t.description,
  t.device_type,
  t.default_app_code,
  t.requires_actor_pin,
  t.requires_active_actor_shift,
  t.allow_actor_without_pin,
  t.allow_actions_without_actor,
  t.is_active,
  t.sort_order,
  coalesce(
    array_agg(distinct ta.app_code order by ta.app_code) filter (where ta.is_active),
    '{}'::text[]
  ) as app_codes,
  coalesce(
    jsonb_agg(
      distinct jsonb_build_object(
        'policy_type', tp.policy_type,
        'scope_strategy', tp.scope_strategy,
        'role_code', tp.role_code,
        'employee_id', tp.employee_id,
        'notes', tp.notes
      )
    ) filter (where tp.is_active),
    '[]'::jsonb
  ) as actor_policies,
  t.metadata,
  t.created_at,
  t.updated_at
from public.shared_operational_device_templates t
left join public.shared_operational_device_template_apps ta on ta.template_id = t.id
left join public.shared_operational_device_template_actor_policies tp on tp.template_id = t.id
group by t.id;

create or replace function public.apply_shared_device_template_actor_policies_v1(
  p_device_id uuid,
  p_template_id uuid
)
returns integer
language plpgsql
security definer
set search_path = public, auth
as $$
declare
  v_inserted integer := 0;
begin
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
    tp.policy_type,
    case
      when tp.scope_strategy in ('device_site', 'device_area') then d.site_id
      else null
    end as site_id,
    case
      when tp.scope_strategy = 'device_area' then d.area_id
      else null
    end as area_id,
    tp.role_code,
    tp.employee_id,
    true,
    tp.notes
  from public.shared_operational_devices d
  join public.shared_operational_device_template_actor_policies tp
    on tp.template_id = p_template_id
   and tp.is_active
  where d.id = p_device_id;

  get diagnostics v_inserted = row_count;
  return v_inserted;
end;
$$;

-- Configuraciones iniciales editables desde base de datos / VISO.
with upserted_templates as (
  insert into public.shared_operational_device_templates (
    code,
    label,
    description,
    device_type,
    default_app_code,
    requires_actor_pin,
    requires_active_actor_shift,
    allow_actor_without_pin,
    allow_actions_without_actor,
    sort_order,
    metadata
  )
  values
    ('pos_satellite', 'Caja satélite', 'Terminal de caja/POS para sedes satélite. Por defecto abre PULSO y permite apoyo de NEXO.', 'pos_terminal', 'pulso', true, true, false, false, 100, '{"system_seed":true}'::jsonb),
    ('bar_satellite', 'Barra satélite', 'Tablet o terminal de barra para operación rápida y movimientos de inventario.', 'tablet', 'pulso', true, true, false, false, 200, '{"system_seed":true}'::jsonb),
    ('warehouse_kiosk', 'Kiosco de bodega', 'Kiosco compartido para retiros, conteos y movimientos de inventario.', 'warehouse_terminal', 'nexo', true, true, false, false, 300, '{"system_seed":true}'::jsonb),
    ('procurement_reception', 'Recepción de compras', 'Terminal para recepción de compras y afectación de inventario.', 'reception_terminal', 'origo', true, true, false, false, 400, '{"system_seed":true}'::jsonb),
    ('production_center', 'Producción centro', 'Terminal compartido para producción y consumo de inventario.', 'production_terminal', 'fogo', true, true, false, false, 500, '{"system_seed":true}'::jsonb),
    ('management_terminal', 'Gerencia', 'Terminal administrativo para gerencia y rentabilidad.', 'shared_terminal', 'numera', true, true, false, false, 600, '{"system_seed":true}'::jsonb)
  on conflict (code) do update set
    label = excluded.label,
    description = excluded.description,
    device_type = excluded.device_type,
    default_app_code = excluded.default_app_code,
    requires_actor_pin = excluded.requires_actor_pin,
    requires_active_actor_shift = excluded.requires_active_actor_shift,
    allow_actor_without_pin = excluded.allow_actor_without_pin,
    allow_actions_without_actor = excluded.allow_actions_without_actor,
    sort_order = excluded.sort_order,
    metadata = public.shared_operational_device_templates.metadata || excluded.metadata,
    updated_at = now()
  returning id, code
)
insert into public.shared_operational_device_template_apps (template_id, app_code, is_default, is_active, sort_order)
select t.id, x.app_code, x.app_code = t.default_app_code, true, x.sort_order
from public.shared_operational_device_templates t
join lateral (
  values
    ('pos_satellite', 'pulso', 100),
    ('pos_satellite', 'nexo', 200),
    ('bar_satellite', 'pulso', 100),
    ('bar_satellite', 'nexo', 200),
    ('warehouse_kiosk', 'nexo', 100),
    ('procurement_reception', 'origo', 100),
    ('procurement_reception', 'nexo', 200),
    ('production_center', 'fogo', 100),
    ('production_center', 'nexo', 200),
    ('management_terminal', 'numera', 100),
    ('management_terminal', 'viso', 200)
) as x(template_code, app_code, sort_order) on x.template_code = t.code
on conflict (template_id, app_code) do update set
  is_default = excluded.is_default,
  is_active = true,
  sort_order = excluded.sort_order;

insert into public.shared_operational_device_template_actor_policies (
  template_id,
  policy_type,
  scope_strategy,
  role_code,
  employee_id,
  is_active,
  sort_order,
  notes
)
select t.id, x.policy_type, x.scope_strategy, x.role_code, null::uuid, true, x.sort_order, x.notes
from public.shared_operational_device_templates t
join lateral (
  values
    ('pos_satellite', 'role_in_area', 'device_area', 'cajero', 100, 'Por defecto, caja satélite exige actor cajero en el área del dispositivo. Configurable.'),
    ('bar_satellite', 'same_area_active_worker', 'device_area', null, 100, 'Barra: cualquier trabajador con jornada activa en el área del dispositivo. Configurable.'),
    ('warehouse_kiosk', 'same_site_active_worker', 'device_site', null, 100, 'Bodega: cualquier trabajador con jornada activa en la sede del dispositivo. Configurable.'),
    ('procurement_reception', 'same_area_active_worker', 'device_area', null, 100, 'Recepción: cualquier trabajador autorizado por área operativa. Configurable.'),
    ('production_center', 'same_site_active_worker', 'device_site', null, 100, 'Producción: cualquier trabajador con jornada activa en la sede. Configurable.'),
    ('management_terminal', 'role_in_site', 'device_site', 'gerente_general', 100, 'Gerencia: rol gerente_general en la sede del dispositivo. Configurable.'),
    ('management_terminal', 'role_in_site', 'device_site', 'propietario', 200, 'Gerencia: rol propietario en la sede del dispositivo. Configurable.')
) as x(template_code, policy_type, scope_strategy, role_code, sort_order, notes) on x.template_code = t.code
where not exists (
  select 1
  from public.shared_operational_device_template_actor_policies existing
  where existing.template_id = t.id
    and existing.policy_type = x.policy_type
    and existing.scope_strategy = x.scope_strategy
    and coalesce(existing.role_code, '') = coalesce(x.role_code, '')
);

update public.shared_operational_devices d
set template_id = t.id,
    metadata = d.metadata || jsonb_build_object('template_code', 'warehouse_kiosk'),
    updated_at = now()
from public.shared_operational_device_templates t
where d.code = 'KIOSCO_BODEGA_CP'
  and t.code = 'warehouse_kiosk'
  and d.template_id is null;

grant select on public.shared_operational_device_templates_admin_v1 to authenticated;
grant execute on function public.apply_shared_device_template_actor_policies_v1(uuid, uuid) to authenticated;

comment on table public.shared_operational_device_templates is 'Plantillas configurables para crear dispositivos compartidos sin hardcodear reglas en el frontend.';
comment on table public.shared_operational_device_template_apps is 'Apps que una plantilla asigna automaticamente a un dispositivo compartido.';
comment on table public.shared_operational_device_template_actor_policies is 'Politicas de actor que una plantilla aplica automaticamente al dispositivo creado.';
comment on function public.apply_shared_device_template_actor_policies_v1(uuid, uuid) is 'Copia las politicas activas de una plantilla hacia un dispositivo concreto resolviendo sede/area del dispositivo.';
