-- VENTO / NEXO
-- Modelo base para activos fisicos, equipos, conteos, QR y ficha tecnica patrimonial.
--
-- IMPORTANTE:
-- Esta migracion NO borra datos.
-- Esta migracion NO actualiza productos existentes.
-- Esta migracion NO toca insumos, recetas, proveedores, stock, movimientos, LOCs ni configuraciones actuales.
-- Solo crea tablas nuevas, indices, vistas de lectura y comentarios.
--
-- Concepto:
-- products = modelo/base del activo. Ej: Cabina RCF ART 715.
-- asset_items = unidad fisica individual. Ej: Cabina RCF ART 715 #001, serial X, QR unico.
-- asset_groups = grupo contado por cantidad. Ej: 24 sillas negras terraza.
-- asset_count_sessions / asset_count_lines = conteos patrimoniales separados del conteo de inventario consumible.

begin;

create table if not exists public.asset_items (
  id uuid primary key default gen_random_uuid(),
  product_id uuid not null references public.products(id) on delete restrict,

  asset_code text not null,
  qr_token uuid not null default gen_random_uuid(),
  display_name text,
  internal_plate text,
  serial_number text,

  site_id uuid references public.sites(id) on delete set null,
  area_id uuid references public.areas(id) on delete set null,
  location_id uuid references public.inventory_locations(id) on delete set null,
  location_position_id uuid references public.inventory_location_positions(id) on delete set null,
  responsible_employee_id uuid references public.employees(id) on delete set null,

  brand text,
  model text,
  manufacturer text,

  equipment_status text not null default 'operativo',
  condition_status text not null default 'bueno',
  lifecycle_status text not null default 'activo',
  ownership_status text not null default 'propio',

  purchase_date date,
  started_use_date date,
  warranty_until date,
  commercial_value numeric(14,2),
  purchase_invoice_url text,
  main_image_url text,

  technical_specs jsonb not null default '{}'::jsonb,
  notes text,

  created_by uuid references public.employees(id) on delete set null,
  updated_by uuid references public.employees(id) on delete set null,
  created_at timestamp with time zone not null default timezone('utc', now()),
  updated_at timestamp with time zone not null default timezone('utc', now()),

  constraint asset_items_asset_code_not_blank_chk
    check (length(btrim(asset_code)) > 0),

  constraint asset_items_equipment_status_chk
    check (equipment_status in ('operativo', 'en_mantenimiento', 'fuera_servicio', 'baja')),

  constraint asset_items_condition_status_chk
    check (condition_status in ('nuevo', 'bueno', 'regular', 'malo', 'critico')),

  constraint asset_items_lifecycle_status_chk
    check (lifecycle_status in ('activo', 'almacenado', 'prestado', 'en_reparacion', 'retirado', 'perdido')),

  constraint asset_items_ownership_status_chk
    check (ownership_status in ('propio', 'rentado', 'prestado', 'comodato')),

  constraint asset_items_commercial_value_nonnegative_chk
    check (commercial_value is null or commercial_value >= 0)
);

create unique index if not exists ux_asset_items_asset_code
  on public.asset_items (asset_code);

create unique index if not exists ux_asset_items_qr_token
  on public.asset_items (qr_token);

create unique index if not exists ux_asset_items_serial_per_product
  on public.asset_items (product_id, serial_number)
  where serial_number is not null and btrim(serial_number) <> '';

create index if not exists idx_asset_items_product_id
  on public.asset_items (product_id);

create index if not exists idx_asset_items_site_location
  on public.asset_items (site_id, location_id, location_position_id);

create index if not exists idx_asset_items_status
  on public.asset_items (equipment_status, lifecycle_status);


create table if not exists public.asset_groups (
  id uuid primary key default gen_random_uuid(),
  product_id uuid not null references public.products(id) on delete restrict,

  group_code text not null,
  qr_token uuid not null default gen_random_uuid(),
  name text not null,

  expected_qty numeric(14,3) not null default 0,
  unit_code text not null default 'un',

  site_id uuid references public.sites(id) on delete set null,
  area_id uuid references public.areas(id) on delete set null,
  location_id uuid references public.inventory_locations(id) on delete set null,
  location_position_id uuid references public.inventory_location_positions(id) on delete set null,
  responsible_employee_id uuid references public.employees(id) on delete set null,

  condition_status text not null default 'bueno',
  lifecycle_status text not null default 'activo',

  main_image_url text,
  notes text,

  created_by uuid references public.employees(id) on delete set null,
  updated_by uuid references public.employees(id) on delete set null,
  created_at timestamp with time zone not null default timezone('utc', now()),
  updated_at timestamp with time zone not null default timezone('utc', now()),

  constraint asset_groups_group_code_not_blank_chk
    check (length(btrim(group_code)) > 0),

  constraint asset_groups_name_not_blank_chk
    check (length(btrim(name)) > 0),

  constraint asset_groups_expected_qty_nonnegative_chk
    check (expected_qty >= 0),

  constraint asset_groups_unit_code_not_blank_chk
    check (length(btrim(unit_code)) > 0),

  constraint asset_groups_condition_status_chk
    check (condition_status in ('nuevo', 'bueno', 'regular', 'malo', 'critico')),

  constraint asset_groups_lifecycle_status_chk
    check (lifecycle_status in ('activo', 'almacenado', 'prestado', 'en_reparacion', 'retirado', 'perdido'))
);

create unique index if not exists ux_asset_groups_group_code
  on public.asset_groups (group_code);

create unique index if not exists ux_asset_groups_qr_token
  on public.asset_groups (qr_token);

create index if not exists idx_asset_groups_product_id
  on public.asset_groups (product_id);

create index if not exists idx_asset_groups_site_location
  on public.asset_groups (site_id, location_id, location_position_id);


create table if not exists public.asset_movements (
  id uuid primary key default gen_random_uuid(),

  asset_item_id uuid references public.asset_items(id) on delete cascade,
  asset_group_id uuid references public.asset_groups(id) on delete cascade,

  moved_at timestamp with time zone not null default timezone('utc', now()),
  movement_type text not null default 'transfer',

  from_site_id uuid references public.sites(id) on delete set null,
  from_area_id uuid references public.areas(id) on delete set null,
  from_location_id uuid references public.inventory_locations(id) on delete set null,
  from_location_position_id uuid references public.inventory_location_positions(id) on delete set null,

  to_site_id uuid references public.sites(id) on delete set null,
  to_area_id uuid references public.areas(id) on delete set null,
  to_location_id uuid references public.inventory_locations(id) on delete set null,
  to_location_position_id uuid references public.inventory_location_positions(id) on delete set null,

  quantity numeric(14,3),
  responsible_employee_id uuid references public.employees(id) on delete set null,
  notes text,

  created_by uuid references public.employees(id) on delete set null,
  created_at timestamp with time zone not null default timezone('utc', now()),

  constraint asset_movements_subject_chk
    check (
      (asset_item_id is not null and asset_group_id is null)
      or
      (asset_item_id is null and asset_group_id is not null)
    ),

  constraint asset_movements_movement_type_chk
    check (movement_type in ('initial_location', 'transfer', 'loan', 'return', 'maintenance_out', 'maintenance_in', 'status_change', 'adjustment')),

  constraint asset_movements_quantity_nonnegative_chk
    check (quantity is null or quantity >= 0)
);

create index if not exists idx_asset_movements_item_id
  on public.asset_movements (asset_item_id, moved_at desc);

create index if not exists idx_asset_movements_group_id
  on public.asset_movements (asset_group_id, moved_at desc);

create index if not exists idx_asset_movements_to_location
  on public.asset_movements (to_site_id, to_location_id, to_location_position_id);


create table if not exists public.asset_documents (
  id uuid primary key default gen_random_uuid(),

  product_id uuid references public.products(id) on delete cascade,
  asset_item_id uuid references public.asset_items(id) on delete cascade,
  asset_group_id uuid references public.asset_groups(id) on delete cascade,

  document_type text not null default 'other',
  title text not null,
  file_url text not null,
  issued_at date,
  expires_at date,
  notes text,

  uploaded_by uuid references public.employees(id) on delete set null,
  created_at timestamp with time zone not null default timezone('utc', now()),
  updated_at timestamp with time zone not null default timezone('utc', now()),

  constraint asset_documents_subject_chk
    check (
      product_id is not null
      or asset_item_id is not null
      or asset_group_id is not null
    ),

  constraint asset_documents_type_chk
    check (document_type in ('technical_sheet', 'manual', 'invoice', 'warranty', 'maintenance_report', 'photo', 'certificate', 'other')),

  constraint asset_documents_title_not_blank_chk
    check (length(btrim(title)) > 0),

  constraint asset_documents_file_url_not_blank_chk
    check (length(btrim(file_url)) > 0)
);

create index if not exists idx_asset_documents_product_id
  on public.asset_documents (product_id);

create index if not exists idx_asset_documents_item_id
  on public.asset_documents (asset_item_id);

create index if not exists idx_asset_documents_group_id
  on public.asset_documents (asset_group_id);

create index if not exists idx_asset_documents_type
  on public.asset_documents (document_type);


create table if not exists public.asset_maintenance_records (
  id uuid primary key default gen_random_uuid(),

  asset_item_id uuid references public.asset_items(id) on delete cascade,
  product_id uuid references public.products(id) on delete set null,

  status text not null default 'planned',
  maintenance_type text not null default 'preventive',

  scheduled_date date,
  performed_date date,
  responsible_employee_id uuid references public.employees(id) on delete set null,
  maintenance_provider text,
  work_done text,
  parts_replaced boolean not null default false,
  replaced_parts text,
  cost numeric(14,2),
  next_scheduled_date date,
  notes text,

  created_by uuid references public.employees(id) on delete set null,
  updated_by uuid references public.employees(id) on delete set null,
  created_at timestamp with time zone not null default timezone('utc', now()),
  updated_at timestamp with time zone not null default timezone('utc', now()),

  constraint asset_maintenance_records_status_chk
    check (status in ('planned', 'done', 'cancelled', 'overdue')),

  constraint asset_maintenance_records_type_chk
    check (maintenance_type in ('preventive', 'corrective', 'inspection', 'calibration', 'cleaning', 'other')),

  constraint asset_maintenance_records_cost_nonnegative_chk
    check (cost is null or cost >= 0)
);

create index if not exists idx_asset_maintenance_records_item_id
  on public.asset_maintenance_records (asset_item_id, scheduled_date desc);

create index if not exists idx_asset_maintenance_records_product_id
  on public.asset_maintenance_records (product_id);

create index if not exists idx_asset_maintenance_records_status
  on public.asset_maintenance_records (status, scheduled_date);


create table if not exists public.asset_count_sessions (
  id uuid primary key default gen_random_uuid(),

  site_id uuid not null references public.sites(id) on delete restrict,
  name text,
  status text not null default 'open',
  scope_type text not null default 'site',
  scope_area_id uuid references public.areas(id) on delete set null,
  scope_location_id uuid references public.inventory_locations(id) on delete set null,
  scope_location_position_id uuid references public.inventory_location_positions(id) on delete set null,

  started_at timestamp with time zone not null default timezone('utc', now()),
  started_by uuid references public.employees(id) on delete set null,
  closed_at timestamp with time zone,
  closed_by uuid references public.employees(id) on delete set null,
  notes text,

  created_at timestamp with time zone not null default timezone('utc', now()),
  updated_at timestamp with time zone not null default timezone('utc', now()),

  constraint asset_count_sessions_status_chk
    check (status in ('open', 'closed', 'cancelled')),

  constraint asset_count_sessions_scope_type_chk
    check (scope_type in ('site', 'area', 'loc', 'position'))
);

create index if not exists idx_asset_count_sessions_site_status
  on public.asset_count_sessions (site_id, status, started_at desc);


create table if not exists public.asset_count_lines (
  id uuid primary key default gen_random_uuid(),

  session_id uuid not null references public.asset_count_sessions(id) on delete cascade,
  asset_item_id uuid references public.asset_items(id) on delete set null,
  asset_group_id uuid references public.asset_groups(id) on delete set null,

  expected_qty numeric(14,3) not null default 1,
  counted_qty numeric(14,3) not null default 0,
  count_status text not null default 'pending',

  expected_site_id uuid references public.sites(id) on delete set null,
  expected_area_id uuid references public.areas(id) on delete set null,
  expected_location_id uuid references public.inventory_locations(id) on delete set null,
  expected_location_position_id uuid references public.inventory_location_positions(id) on delete set null,

  found_site_id uuid references public.sites(id) on delete set null,
  found_area_id uuid references public.areas(id) on delete set null,
  found_location_id uuid references public.inventory_locations(id) on delete set null,
  found_location_position_id uuid references public.inventory_location_positions(id) on delete set null,

  condition_status text,
  scanned_qr_token uuid,
  counted_by uuid references public.employees(id) on delete set null,
  counted_at timestamp with time zone,
  notes text,

  created_at timestamp with time zone not null default timezone('utc', now()),
  updated_at timestamp with time zone not null default timezone('utc', now()),

  constraint asset_count_lines_subject_chk
    check (
      (asset_item_id is not null and asset_group_id is null)
      or
      (asset_item_id is null and asset_group_id is not null)
    ),

  constraint asset_count_lines_qty_nonnegative_chk
    check (expected_qty >= 0 and counted_qty >= 0),

  constraint asset_count_lines_status_chk
    check (count_status in ('pending', 'found', 'missing', 'found_elsewhere', 'damaged', 'extra', 'not_applicable')),

  constraint asset_count_lines_condition_status_chk
    check (condition_status is null or condition_status in ('nuevo', 'bueno', 'regular', 'malo', 'critico'))
);

create index if not exists idx_asset_count_lines_session_id
  on public.asset_count_lines (session_id);

create index if not exists idx_asset_count_lines_item_id
  on public.asset_count_lines (asset_item_id);

create index if not exists idx_asset_count_lines_group_id
  on public.asset_count_lines (asset_group_id);

create index if not exists idx_asset_count_lines_status
  on public.asset_count_lines (count_status);


create or replace view public.v_asset_items_inventory_status as
select
  ai.id,
  ai.product_id,
  p.name as product_name,
  p.sku as product_sku,
  ai.asset_code,
  ai.qr_token,
  ai.display_name,
  ai.internal_plate,
  ai.serial_number,
  ai.brand,
  ai.model,
  ai.equipment_status,
  ai.condition_status,
  ai.lifecycle_status,
  ai.ownership_status,
  ai.site_id,
  s.name as site_name,
  ai.area_id,
  a.name as area_name,
  a.kind as area_kind,
  ai.location_id,
  il.code as location_code,
  il.zone as location_zone,
  ai.location_position_id,
  ilp.code as position_code,
  ilp.name as position_name,
  ai.responsible_employee_id,
  e.full_name as responsible_name,
  ai.commercial_value,
  ai.warranty_until,
  ai.main_image_url,
  ('/inventory/assets/items/'::text || ai.id::text) as technical_sheet_path,
  ai.created_at,
  ai.updated_at
from public.asset_items ai
join public.products p on p.id = ai.product_id
left join public.sites s on s.id = ai.site_id
left join public.areas a on a.id = ai.area_id
left join public.inventory_locations il on il.id = ai.location_id
left join public.inventory_location_positions ilp on ilp.id = ai.location_position_id
left join public.employees e on e.id = ai.responsible_employee_id;

create or replace view public.v_asset_groups_inventory_status as
select
  ag.id,
  ag.product_id,
  p.name as product_name,
  p.sku as product_sku,
  ag.group_code,
  ag.qr_token,
  ag.name,
  ag.expected_qty,
  ag.unit_code,
  ag.condition_status,
  ag.lifecycle_status,
  ag.site_id,
  s.name as site_name,
  ag.area_id,
  a.name as area_name,
  a.kind as area_kind,
  ag.location_id,
  il.code as location_code,
  il.zone as location_zone,
  ag.location_position_id,
  ilp.code as position_code,
  ilp.name as position_name,
  ag.responsible_employee_id,
  e.full_name as responsible_name,
  ag.main_image_url,
  ('/inventory/assets/groups/'::text || ag.id::text) as technical_sheet_path,
  ag.created_at,
  ag.updated_at
from public.asset_groups ag
join public.products p on p.id = ag.product_id
left join public.sites s on s.id = ag.site_id
left join public.areas a on a.id = ag.area_id
left join public.inventory_locations il on il.id = ag.location_id
left join public.inventory_location_positions ilp on ilp.id = ag.location_position_id
left join public.employees e on e.id = ag.responsible_employee_id;

create or replace view public.v_asset_count_session_summary as
select
  acs.id as session_id,
  acs.site_id,
  s.name as site_name,
  acs.name,
  acs.status,
  acs.scope_type,
  acs.started_at,
  acs.closed_at,
  count(acl.id)::integer as line_count,
  count(*) filter (where acl.count_status = 'found')::integer as found_count,
  count(*) filter (where acl.count_status = 'missing')::integer as missing_count,
  count(*) filter (where acl.count_status = 'found_elsewhere')::integer as found_elsewhere_count,
  count(*) filter (where acl.count_status = 'damaged')::integer as damaged_count,
  count(*) filter (where acl.count_status = 'extra')::integer as extra_count
from public.asset_count_sessions acs
left join public.sites s on s.id = acs.site_id
left join public.asset_count_lines acl on acl.session_id = acs.id
group by acs.id, s.name;

comment on table public.asset_items is
  'Unidades fisicas individualizadas de equipos/activos. Cada fila puede tener serial, placa, QR, ubicacion real y ficha tecnica propia.';

comment on table public.asset_groups is
  'Activos agrupados por cantidad para objetos repetidos que no requieren trazabilidad individual, por ejemplo sillas, bandejas o canastillas.';

comment on table public.asset_movements is
  'Historial patrimonial de movimientos de activos individuales o grupos entre sedes, LOCs y ubicaciones internas.';

comment on table public.asset_documents is
  'Documentos de activos: ficha tecnica, manuales, facturas, garantias, fotos, certificados e informes.';

comment on table public.asset_maintenance_records is
  'Mantenimientos por activo fisico individual. Convive con el historial legacy por producto sin modificarlo.';

comment on table public.asset_count_sessions is
  'Sesiones de conteo patrimonial de activos. Separadas de inventory_count_sessions para no mezclar activos con consumibles.';

comment on table public.asset_count_lines is
  'Resultado del conteo de activos individuales o grupos: encontrado, faltante, encontrado en otro LOC, danado o extra.';

comment on column public.asset_items.qr_token is
  'Token estable para construir QR sin exponer necesariamente el ID interno. La UI puede apuntar a /inventory/assets/items/[id] o resolver por token.';

comment on column public.asset_groups.qr_token is
  'Token estable para QR de grupos contables de activos repetidos.';

comment on column public.asset_items.technical_specs is
  'JSON flexible para datos tecnicos: potencia, voltaje, capacidad, dimensiones, peso, material, consumo, presion, etc.';

do $$
begin
  if exists (
    select 1
    from pg_proc p
    join pg_namespace n on n.oid = p.pronamespace
    where n.nspname = 'public'
      and p.proname = 'touch_updated_at'
  ) then
    if not exists (
      select 1 from pg_trigger where tgname = 'trg_asset_items_touch_updated_at'
    ) then
      create trigger trg_asset_items_touch_updated_at
      before update on public.asset_items
      for each row execute function public.touch_updated_at();
    end if;

    if not exists (
      select 1 from pg_trigger where tgname = 'trg_asset_groups_touch_updated_at'
    ) then
      create trigger trg_asset_groups_touch_updated_at
      before update on public.asset_groups
      for each row execute function public.touch_updated_at();
    end if;

    if not exists (
      select 1 from pg_trigger where tgname = 'trg_asset_documents_touch_updated_at'
    ) then
      create trigger trg_asset_documents_touch_updated_at
      before update on public.asset_documents
      for each row execute function public.touch_updated_at();
    end if;

    if not exists (
      select 1 from pg_trigger where tgname = 'trg_asset_maintenance_records_touch_updated_at'
    ) then
      create trigger trg_asset_maintenance_records_touch_updated_at
      before update on public.asset_maintenance_records
      for each row execute function public.touch_updated_at();
    end if;

    if not exists (
      select 1 from pg_trigger where tgname = 'trg_asset_count_sessions_touch_updated_at'
    ) then
      create trigger trg_asset_count_sessions_touch_updated_at
      before update on public.asset_count_sessions
      for each row execute function public.touch_updated_at();
    end if;

    if not exists (
      select 1 from pg_trigger where tgname = 'trg_asset_count_lines_touch_updated_at'
    ) then
      create trigger trg_asset_count_lines_touch_updated_at
      before update on public.asset_count_lines
      for each row execute function public.touch_updated_at();
    end if;
  end if;
end $$;

grant select, insert, update, delete on public.asset_items to authenticated;
grant select, insert, update, delete on public.asset_groups to authenticated;
grant select, insert, update, delete on public.asset_movements to authenticated;
grant select, insert, update, delete on public.asset_documents to authenticated;
grant select, insert, update, delete on public.asset_maintenance_records to authenticated;
grant select, insert, update, delete on public.asset_count_sessions to authenticated;
grant select, insert, update, delete on public.asset_count_lines to authenticated;

grant select on public.v_asset_items_inventory_status to authenticated;
grant select on public.v_asset_groups_inventory_status to authenticated;
grant select on public.v_asset_count_session_summary to authenticated;

commit;
