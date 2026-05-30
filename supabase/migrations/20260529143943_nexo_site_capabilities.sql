begin;

create table if not exists public.site_operational_capabilities (
  site_id uuid primary key references public.sites(id) on delete cascade,
  can_request_remissions boolean not null default false,
  can_fulfill_remissions boolean not null default false,
  can_receive_remissions boolean not null default false,
  can_sell boolean not null default false,
  can_produce boolean not null default false,
  can_hold_inventory boolean not null default false,
  is_commercial_business boolean not null default false,
  show_in_product_setup boolean not null default true,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now(),
  updated_by uuid references auth.users(id)
);

comment on table public.site_operational_capabilities is
  'Capacidades operativas configurables por sede. site_type queda como clasificacion visual/legacy.';
comment on column public.site_operational_capabilities.can_request_remissions is
  'La sede puede crear solicitudes de remision.';
comment on column public.site_operational_capabilities.can_fulfill_remissions is
  'La sede puede despachar/alistar remisiones como origen.';
comment on column public.site_operational_capabilities.can_receive_remissions is
  'La sede puede recibir remisiones.';
comment on column public.site_operational_capabilities.can_sell is
  'La sede participa en flujos comerciales/POS.';
comment on column public.site_operational_capabilities.can_produce is
  'La sede puede producir localmente.';
comment on column public.site_operational_capabilities.can_hold_inventory is
  'La sede participa en stock, conteos y LOCs.';
comment on column public.site_operational_capabilities.is_commercial_business is
  'Sede comercial que no entra a flujos operativos salvo que tenga capacidades activas.';
comment on column public.site_operational_capabilities.show_in_product_setup is
  'Controla si la sede aparece en configuracion producto-sede.';

drop trigger if exists trg_site_operational_capabilities_updated_at
  on public.site_operational_capabilities;
create trigger trg_site_operational_capabilities_updated_at
before update on public.site_operational_capabilities
for each row execute function public._set_updated_at();

alter table public.site_operational_capabilities enable row level security;

drop policy if exists "site_operational_capabilities_select_authenticated"
  on public.site_operational_capabilities;
create policy "site_operational_capabilities_select_authenticated"
on public.site_operational_capabilities
for select
to authenticated
using (true);

drop policy if exists "site_operational_capabilities_write_admin"
  on public.site_operational_capabilities;
create policy "site_operational_capabilities_write_admin"
on public.site_operational_capabilities
for all
to authenticated
using (public.is_owner() or public.is_global_manager())
with check (public.is_owner() or public.is_global_manager());

grant select, insert, update, delete on public.site_operational_capabilities to authenticated;

insert into public.site_operational_capabilities (
  site_id,
  can_request_remissions,
  can_fulfill_remissions,
  can_receive_remissions,
  can_sell,
  can_produce,
  can_hold_inventory,
  is_commercial_business,
  show_in_product_setup
)
select
  s.id,
  case when s.site_type::text = 'satellite' then true else false end,
  case when s.site_type::text = 'production_center' then true else false end,
  case when s.site_type::text in ('satellite', 'production_center') then true else false end,
  case when s.site_type::text in ('satellite', 'business') then true else false end,
  case when s.site_type::text = 'production_center' then true else false end,
  case when s.site_type::text in ('satellite', 'production_center', 'warehouse') then true else false end,
  case when s.site_type::text = 'business' then true else false end,
  case when s.site_type::text in ('business', 'admin') then false else true end
from public.sites s
on conflict (site_id) do nothing;

create table if not exists public.site_purpose_settings (
  site_id uuid not null references public.sites(id) on delete cascade,
  purpose text not null,
  mode text not null default 'inherit_global',
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now(),
  updated_by uuid references auth.users(id),
  primary key (site_id, purpose),
  constraint site_purpose_settings_purpose_chk
    check (purpose in ('remission', 'production_recipe')),
  constraint site_purpose_settings_mode_chk
    check (mode in ('inherit_global', 'custom', 'disabled'))
);

comment on table public.site_purpose_settings is
  'Modo de resolucion por sede/proposito para distinguir fallback global, reglas custom y cero areas habilitadas.';
comment on column public.site_purpose_settings.mode is
  'inherit_global usa defaults globales; custom usa reglas site_area_purpose_rules; disabled fuerza cero areas.';

drop trigger if exists trg_site_purpose_settings_updated_at
  on public.site_purpose_settings;
create trigger trg_site_purpose_settings_updated_at
before update on public.site_purpose_settings
for each row execute function public._set_updated_at();

alter table public.site_purpose_settings enable row level security;

drop policy if exists "site_purpose_settings_select_authenticated"
  on public.site_purpose_settings;
create policy "site_purpose_settings_select_authenticated"
on public.site_purpose_settings
for select
to authenticated
using (true);

drop policy if exists "site_purpose_settings_write_admin"
  on public.site_purpose_settings;
create policy "site_purpose_settings_write_admin"
on public.site_purpose_settings
for all
to authenticated
using (public.is_owner() or public.is_global_manager())
with check (public.is_owner() or public.is_global_manager());

grant select, insert, update, delete on public.site_purpose_settings to authenticated;

insert into public.site_purpose_settings (site_id, purpose, mode)
select distinct site_id, purpose, 'custom'
from public.site_area_purpose_rules
where purpose in ('remission', 'production_recipe')
on conflict (site_id, purpose) do nothing;

alter table public.product_site_settings
  add column if not exists local_production_enabled boolean not null default false,
  add column if not exists sales_enabled boolean,
  add column if not exists inventory_enabled boolean;

update public.product_site_settings
set local_production_enabled = true
where production_location_id is not null
  and local_production_enabled = false;

alter table public.product_site_settings
  drop constraint if exists product_site_settings_local_production_location_chk;

alter table public.product_site_settings
  add constraint product_site_settings_local_production_location_chk
  check (local_production_enabled = true or production_location_id is null);

comment on column public.product_site_settings.local_production_enabled is
  'Control explicito para indicar que el producto se produce localmente en esta sede.';
comment on column public.product_site_settings.sales_enabled is
  'Control opcional para venta por sede. Null mantiene comportamiento legacy.';
comment on column public.product_site_settings.inventory_enabled is
  'Control opcional para inventario por sede. Null mantiene comportamiento legacy.';

commit;
