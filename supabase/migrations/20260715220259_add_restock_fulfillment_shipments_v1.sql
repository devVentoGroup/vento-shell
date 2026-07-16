-- Fulfillment v1: separates demand, preparation, physical shipments, receipts and exceptions.
-- Existing restock_requests/restock_request_items remain the authoritative legacy request history.

create table public.product_fulfillment_routes (
  id uuid primary key default gen_random_uuid(),
  product_id uuid not null references public.products(id) on delete cascade,
  from_site_id uuid not null references public.sites(id),
  to_site_id uuid not null references public.sites(id),
  requesting_area_kind text references public.area_kinds(code),
  preparing_area_kind text references public.area_kinds(code),
  preferred_source_location_id uuid references public.inventory_locations(id) on delete set null,
  preferred_destination_location_id uuid references public.inventory_locations(id) on delete set null,
  supply_mode text not null default 'stock' check (supply_mode in ('stock', 'production', 'supplier', 'transfer', 'manual')),
  dispatch_policy text not null default 'next_available' check (dispatch_policy in ('next_available', 'scheduled_run', 'manual')),
  estimated_lead_minutes integer check (estimated_lead_minutes is null or estimated_lead_minutes >= 0),
  allow_substitution boolean not null default false,
  is_active boolean not null default true,
  notes text,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now(),
  created_by uuid references auth.users(id),
  updated_by uuid references auth.users(id),
  constraint product_fulfillment_routes_distinct_sites check (from_site_id <> to_site_id)
);

create unique index product_fulfillment_routes_active_scope_uidx
  on public.product_fulfillment_routes(product_id, from_site_id, to_site_id, coalesce(requesting_area_kind, ''), coalesce(preparing_area_kind, ''))
  where is_active;

create table public.restock_item_fulfillments (
  id uuid primary key default gen_random_uuid(),
  request_item_id uuid not null references public.restock_request_items(id) on delete restrict,
  product_id uuid not null references public.products(id),
  route_id uuid references public.product_fulfillment_routes(id) on delete set null,
  from_site_id uuid not null references public.sites(id),
  to_site_id uuid not null references public.sites(id),
  requesting_area_kind text references public.area_kinds(code),
  preparing_area_kind text references public.area_kinds(code),
  source_location_id uuid references public.inventory_locations(id) on delete set null,
  destination_location_id uuid references public.inventory_locations(id) on delete set null,
  status text not null default 'pending' check (status in ('pending', 'reserved', 'preparing', 'partially_ready', 'ready', 'blocked', 'reassigned', 'released', 'cancelled')),
  requested_base_qty numeric not null check (requested_base_qty > 0),
  reserved_base_qty numeric not null default 0 check (reserved_base_qty >= 0),
  ready_base_qty numeric not null default 0 check (ready_base_qty >= 0),
  released_base_qty numeric not null default 0 check (released_base_qty >= 0),
  cancelled_base_qty numeric not null default 0 check (cancelled_base_qty >= 0),
  available_at timestamptz,
  shortage_reason text,
  notes text,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now(),
  created_by uuid references auth.users(id),
  updated_by uuid references auth.users(id),
  constraint restock_item_fulfillments_distinct_sites check (from_site_id <> to_site_id),
  constraint restock_item_fulfillments_allocations_within_requested check (
    reserved_base_qty + released_base_qty + cancelled_base_qty <= requested_base_qty
  )
);

create index restock_item_fulfillments_request_item_idx on public.restock_item_fulfillments(request_item_id, status);
create index restock_item_fulfillments_ready_idx on public.restock_item_fulfillments(from_site_id, to_site_id, status, available_at)
  where status in ('partially_ready', 'ready');

create table public.remission_dispatch_runs (
  id uuid primary key default gen_random_uuid(),
  origin_site_id uuid not null references public.sites(id),
  status text not null default 'draft' check (status in ('draft', 'loading', 'sealed', 'departed', 'cancelled', 'closed')),
  scheduled_departure_at timestamptz,
  departed_at timestamptz,
  closed_at timestamptz,
  driver_employee_id uuid references public.employees(id) on delete set null,
  vehicle_label text,
  capacity_weight_kg numeric check (capacity_weight_kg is null or capacity_weight_kg > 0),
  notes text,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now(),
  created_by uuid references auth.users(id),
  updated_by uuid references auth.users(id)
);

create index remission_dispatch_runs_origin_status_idx on public.remission_dispatch_runs(origin_site_id, status, scheduled_departure_at);

create table public.remission_shipments (
  id uuid primary key default gen_random_uuid(),
  dispatch_run_id uuid references public.remission_dispatch_runs(id) on delete set null,
  origin_site_id uuid not null references public.sites(id),
  destination_site_id uuid not null references public.sites(id),
  shipment_code text,
  status text not null default 'draft' check (status in ('draft', 'loading', 'sealed', 'in_transit', 'arrived', 'partial_receipt', 'received', 'exception', 'cancelled', 'closed')),
  sealed_at timestamptz,
  departed_at timestamptz,
  arrived_at timestamptz,
  closed_at timestamptz,
  notes text,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now(),
  created_by uuid references auth.users(id),
  updated_by uuid references auth.users(id),
  constraint remission_shipments_distinct_sites check (origin_site_id <> destination_site_id)
);

create unique index remission_shipments_code_uidx on public.remission_shipments(shipment_code) where shipment_code is not null;
create index remission_shipments_origin_status_idx on public.remission_shipments(origin_site_id, status, created_at desc);
create index remission_shipments_destination_status_idx on public.remission_shipments(destination_site_id, status, created_at desc);

create table public.remission_shipment_items (
  id uuid primary key default gen_random_uuid(),
  shipment_id uuid not null references public.remission_shipments(id) on delete restrict,
  request_item_id uuid not null references public.restock_request_items(id) on delete restrict,
  fulfillment_id uuid references public.restock_item_fulfillments(id) on delete set null,
  product_id uuid not null references public.products(id),
  source_location_id uuid references public.inventory_locations(id) on delete set null,
  destination_location_id uuid references public.inventory_locations(id) on delete set null,
  base_qty numeric not null check (base_qty > 0),
  stock_unit_code text references public.inventory_units(code),
  request_policy_id uuid references public.product_request_policies(id) on delete set null,
  request_policy_label text,
  requested_policy_qty numeric check (requested_policy_qty is null or requested_policy_qty > 0),
  notes text,
  created_at timestamptz not null default now(),
  created_by uuid references auth.users(id)
);

create index remission_shipment_items_shipment_idx on public.remission_shipment_items(shipment_id);
create index remission_shipment_items_request_item_idx on public.remission_shipment_items(request_item_id);
create index remission_shipment_items_fulfillment_idx on public.remission_shipment_items(fulfillment_id) where fulfillment_id is not null;

create table public.remission_receipts (
  id uuid primary key default gen_random_uuid(),
  shipment_id uuid not null references public.remission_shipments(id) on delete restrict,
  status text not null default 'draft' check (status in ('draft', 'confirmed', 'cancelled')),
  received_at timestamptz,
  received_by uuid references public.employees(id) on delete set null,
  notes text,
  idempotency_key text,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now(),
  created_by uuid references auth.users(id),
  updated_by uuid references auth.users(id)
);

create unique index remission_receipts_idempotency_uidx on public.remission_receipts(shipment_id, idempotency_key)
  where idempotency_key is not null;
create index remission_receipts_shipment_idx on public.remission_receipts(shipment_id, status, created_at);

create table public.remission_receipt_items (
  id uuid primary key default gen_random_uuid(),
  receipt_id uuid not null references public.remission_receipts(id) on delete restrict,
  shipment_item_id uuid not null references public.remission_shipment_items(id) on delete restrict,
  received_base_qty numeric not null default 0 check (received_base_qty >= 0),
  accepted_base_qty numeric not null default 0 check (accepted_base_qty >= 0),
  rejected_base_qty numeric not null default 0 check (rejected_base_qty >= 0),
  quarantined_base_qty numeric not null default 0 check (quarantined_base_qty >= 0),
  destination_location_id uuid references public.inventory_locations(id) on delete set null,
  notes text,
  created_at timestamptz not null default now(),
  created_by uuid references auth.users(id),
  constraint remission_receipt_items_resolution_within_received check (
    accepted_base_qty + rejected_base_qty + quarantined_base_qty <= received_base_qty
  )
);

create unique index remission_receipt_items_receipt_shipment_item_uidx
  on public.remission_receipt_items(receipt_id, shipment_item_id);
create index remission_receipt_items_shipment_item_idx on public.remission_receipt_items(shipment_item_id);

create table public.remission_exceptions (
  id uuid primary key default gen_random_uuid(),
  request_item_id uuid references public.restock_request_items(id) on delete set null,
  fulfillment_id uuid references public.restock_item_fulfillments(id) on delete set null,
  shipment_id uuid references public.remission_shipments(id) on delete set null,
  shipment_item_id uuid references public.remission_shipment_items(id) on delete set null,
  receipt_item_id uuid references public.remission_receipt_items(id) on delete set null,
  product_id uuid references public.products(id) on delete set null,
  stage text not null check (stage in ('fulfillment', 'loading', 'transit', 'receipt', 'post_receipt')),
  exception_type text not null check (exception_type in ('shortage', 'damage', 'substitution', 'quality_hold', 'loss_in_transit', 'return', 'wrong_product', 'other')),
  status text not null default 'open' check (status in ('open', 'investigating', 'escalated', 'resolved', 'cancelled')),
  affected_base_qty numeric not null check (affected_base_qty > 0),
  resolution text,
  due_at timestamptz,
  resolved_at timestamptz,
  assigned_to uuid references public.employees(id) on delete set null,
  evidence_url text,
  description text,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now(),
  created_by uuid references auth.users(id),
  updated_by uuid references auth.users(id)
);

create index remission_exceptions_open_idx on public.remission_exceptions(status, stage, due_at)
  where status in ('open', 'investigating', 'escalated');
create index remission_exceptions_request_item_idx on public.remission_exceptions(request_item_id) where request_item_id is not null;
create index remission_exceptions_shipment_idx on public.remission_exceptions(shipment_id) where shipment_id is not null;

comment on table public.product_fulfillment_routes is 'Configuración explícita de quién cumple una línea solicitada. No representa stock ni paquetes físicos.';
comment on table public.restock_item_fulfillments is 'Tareas y cantidades de cumplimiento para una necesidad; permite preparación parcial sin cerrar la solicitud.';
comment on table public.remission_dispatch_runs is 'Salida logística o viaje: conductor, vehículo y ventana de salida.';
comment on table public.remission_shipments is 'Remisión física inmutable después de sellar; puede contener líneas de varias solicitudes.';
comment on table public.remission_shipment_items is 'Cantidad realmente cargada y despachada, vinculada a la necesidad y opcionalmente a una tarea.';
comment on table public.remission_receipts is 'Evento idempotente de recepción; un envío admite varios eventos.';
comment on table public.remission_exceptions is 'Novedad operativa auditable; una cantidad afectada no se considera cumplida hasta resolverla.';

create or replace function public.touch_restock_fulfillment_updated_at()
returns trigger
language plpgsql
set search_path = public
as $$
begin
  new.updated_at = now();
  return new;
end;
$$;

create trigger trg_product_fulfillment_routes_updated_at before update on public.product_fulfillment_routes
  for each row execute function public.touch_restock_fulfillment_updated_at();
create trigger trg_restock_item_fulfillments_updated_at before update on public.restock_item_fulfillments
  for each row execute function public.touch_restock_fulfillment_updated_at();
create trigger trg_remission_dispatch_runs_updated_at before update on public.remission_dispatch_runs
  for each row execute function public.touch_restock_fulfillment_updated_at();
create trigger trg_remission_shipments_updated_at before update on public.remission_shipments
  for each row execute function public.touch_restock_fulfillment_updated_at();
create trigger trg_remission_receipts_updated_at before update on public.remission_receipts
  for each row execute function public.touch_restock_fulfillment_updated_at();
create trigger trg_remission_exceptions_updated_at before update on public.remission_exceptions
  for each row execute function public.touch_restock_fulfillment_updated_at();

alter table public.product_fulfillment_routes enable row level security;
alter table public.restock_item_fulfillments enable row level security;
alter table public.remission_dispatch_runs enable row level security;
alter table public.remission_shipments enable row level security;
alter table public.remission_shipment_items enable row level security;
alter table public.remission_receipts enable row level security;
alter table public.remission_receipt_items enable row level security;
alter table public.remission_exceptions enable row level security;

grant select, insert, update, delete on public.product_fulfillment_routes, public.restock_item_fulfillments, public.remission_dispatch_runs, public.remission_shipments, public.remission_shipment_items, public.remission_receipts, public.remission_receipt_items, public.remission_exceptions to authenticated;
grant all on public.product_fulfillment_routes, public.restock_item_fulfillments, public.remission_dispatch_runs, public.remission_shipments, public.remission_shipment_items, public.remission_receipts, public.remission_receipt_items, public.remission_exceptions to service_role;

create policy product_fulfillment_routes_select on public.product_fulfillment_routes for select to authenticated
  using (public.has_permission('nexo.inventory.remissions.all_sites') or public.has_permission('nexo.inventory.remissions', from_site_id) or public.has_permission('nexo.inventory.remissions', to_site_id));
create policy product_fulfillment_routes_write on public.product_fulfillment_routes for all to authenticated
  using (public.is_owner() or public.is_global_manager())
  with check (public.is_owner() or public.is_global_manager());

create policy restock_item_fulfillments_access on public.restock_item_fulfillments for all to authenticated
  using (public.has_permission('nexo.inventory.remissions.all_sites') or public.has_permission('nexo.inventory.remissions.prepare', from_site_id) or public.has_permission('nexo.inventory.remissions.receive', to_site_id))
  with check (public.has_permission('nexo.inventory.remissions.all_sites') or public.has_permission('nexo.inventory.remissions.prepare', from_site_id) or public.has_permission('nexo.inventory.remissions.receive', to_site_id));

create policy remission_dispatch_runs_access on public.remission_dispatch_runs for all to authenticated
  using (public.has_permission('nexo.inventory.remissions.all_sites') or public.has_permission('nexo.inventory.remissions.prepare', origin_site_id) or public.has_permission('nexo.inventory.remissions.transit', origin_site_id))
  with check (public.has_permission('nexo.inventory.remissions.all_sites') or public.has_permission('nexo.inventory.remissions.prepare', origin_site_id) or public.has_permission('nexo.inventory.remissions.transit', origin_site_id));

create policy remission_shipments_access on public.remission_shipments for all to authenticated
  using (public.has_permission('nexo.inventory.remissions.all_sites') or public.has_permission('nexo.inventory.remissions.prepare', origin_site_id) or public.has_permission('nexo.inventory.remissions.transit', origin_site_id) or public.has_permission('nexo.inventory.remissions.receive', destination_site_id))
  with check (public.has_permission('nexo.inventory.remissions.all_sites') or public.has_permission('nexo.inventory.remissions.prepare', origin_site_id) or public.has_permission('nexo.inventory.remissions.transit', origin_site_id) or public.has_permission('nexo.inventory.remissions.receive', destination_site_id));

create policy remission_shipment_items_access on public.remission_shipment_items for all to authenticated
  using (exists (select 1 from public.remission_shipments s where s.id = shipment_id and (public.has_permission('nexo.inventory.remissions.all_sites') or public.has_permission('nexo.inventory.remissions.prepare', s.origin_site_id) or public.has_permission('nexo.inventory.remissions.transit', s.origin_site_id) or public.has_permission('nexo.inventory.remissions.receive', s.destination_site_id))))
  with check (exists (select 1 from public.remission_shipments s where s.id = shipment_id and (public.has_permission('nexo.inventory.remissions.all_sites') or public.has_permission('nexo.inventory.remissions.prepare', s.origin_site_id) or public.has_permission('nexo.inventory.remissions.transit', s.origin_site_id) or public.has_permission('nexo.inventory.remissions.receive', s.destination_site_id))));

create policy remission_receipts_access on public.remission_receipts for all to authenticated
  using (exists (select 1 from public.remission_shipments s where s.id = shipment_id and (public.has_permission('nexo.inventory.remissions.all_sites') or public.has_permission('nexo.inventory.remissions.receive', s.destination_site_id) or public.has_permission('nexo.inventory.remissions.transit', s.origin_site_id))))
  with check (exists (select 1 from public.remission_shipments s where s.id = shipment_id and (public.has_permission('nexo.inventory.remissions.all_sites') or public.has_permission('nexo.inventory.remissions.receive', s.destination_site_id) or public.has_permission('nexo.inventory.remissions.transit', s.origin_site_id))));

create policy remission_receipt_items_access on public.remission_receipt_items for all to authenticated
  using (exists (select 1 from public.remission_receipts r join public.remission_shipments s on s.id = r.shipment_id where r.id = receipt_id and (public.has_permission('nexo.inventory.remissions.all_sites') or public.has_permission('nexo.inventory.remissions.receive', s.destination_site_id) or public.has_permission('nexo.inventory.remissions.transit', s.origin_site_id))))
  with check (exists (select 1 from public.remission_receipts r join public.remission_shipments s on s.id = r.shipment_id where r.id = receipt_id and (public.has_permission('nexo.inventory.remissions.all_sites') or public.has_permission('nexo.inventory.remissions.receive', s.destination_site_id) or public.has_permission('nexo.inventory.remissions.transit', s.origin_site_id))));

create policy remission_exceptions_access on public.remission_exceptions for all to authenticated
  using (public.has_permission('nexo.inventory.remissions.all_sites') or exists (select 1 from public.remission_shipments s where s.id = shipment_id and (public.has_permission('nexo.inventory.remissions.prepare', s.origin_site_id) or public.has_permission('nexo.inventory.remissions.transit', s.origin_site_id) or public.has_permission('nexo.inventory.remissions.receive', s.destination_site_id))))
  with check (public.has_permission('nexo.inventory.remissions.all_sites') or exists (select 1 from public.remission_shipments s where s.id = shipment_id and (public.has_permission('nexo.inventory.remissions.prepare', s.origin_site_id) or public.has_permission('nexo.inventory.remissions.transit', s.origin_site_id) or public.has_permission('nexo.inventory.remissions.receive', s.destination_site_id))));