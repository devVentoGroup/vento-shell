-- =====================================================================================
-- VENTO / NEXO
-- Migration: Internal billing foundation
-- File: 20260530173000_internal_billing_foundation.sql
--
-- Scope:
-- - Extend existing cost_centers table.
-- - Add internal price lists and internal POS documents.
-- - Add internal transfer variances.
-- - Extend restock_requests/restock_request_items using existing pricing fields.
-- - Add NEXO permissions for VISO role matrix.
-- - Add RLS policies for the new internal billing entities.
--
-- Notes from current database audit:
-- - public.cost_centers already exists and is empty.
-- - public.restock_requests already has pricing_mode and pricing_status.
-- - public.restock_request_items already has transfer_unit_price, transfer_currency,
--   transfer_total, received_quantity, shipped_quantity and shortage_quantity.
--
-- This migration is structural only.
-- It does not create the automatic 4:30 p.m. alert or 5:00 p.m. billing job yet.
-- =====================================================================================

begin;

-- =====================================================================================
-- 1. Extend existing cost_centers
-- =====================================================================================

alter table public.cost_centers
  add column if not exists code text,
  add column if not exists type text,
  add column if not exists updated_at timestamptz not null default now();

do $$
begin
  if not exists (
    select 1
    from pg_constraint
    where conname = 'cost_centers_type_check'
      and conrelid = 'public.cost_centers'::regclass
  ) then
    alter table public.cost_centers
      add constraint cost_centers_type_check
      check (
        type is null
        or type in ('production_center', 'satellite', 'logistics', 'admin', 'other')
      ) not valid;
  end if;
end $$;

do $$
begin
  if not exists (
    select 1
    from pg_constraint
    where conname = 'cost_centers_code_not_blank'
      and conrelid = 'public.cost_centers'::regclass
  ) then
    alter table public.cost_centers
      add constraint cost_centers_code_not_blank
      check (code is null or btrim(code) <> '') not valid;
  end if;
end $$;

create unique index if not exists cost_centers_code_uidx
  on public.cost_centers (lower(btrim(code)))
  where code is not null and btrim(code) <> '';

create unique index if not exists cost_centers_site_uidx
  on public.cost_centers (site_id)
  where site_id is not null and is_active is not false;

comment on table public.cost_centers is
  'Centros de costo internos. Se usa para asociar sedes, produccion, satelites, logistica o administracion con responsabilidad economica.';

comment on column public.cost_centers.code is
  'Codigo corto auditable del centro de costo. Ejemplo: CP-PRINCIPAL, SAT-CHAPINERO.';

comment on column public.cost_centers.type is
  'Tipo funcional del centro de costo: production_center, satellite, logistics, admin u other.';

-- =====================================================================================
-- 2. Internal price lists
-- =====================================================================================

create table if not exists public.internal_price_lists (
  id uuid primary key default gen_random_uuid(),
  name text not null,
  seller_cost_center_id uuid not null references public.cost_centers(id),
  buyer_cost_center_id uuid null references public.cost_centers(id),
  buyer_site_id uuid null references public.sites(id),
  valid_from timestamptz not null default now(),
  valid_to timestamptz null,
  is_active boolean not null default true,
  created_by uuid null,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now(),
  constraint internal_price_lists_name_not_blank check (btrim(name) <> ''),
  constraint internal_price_lists_valid_range check (valid_to is null or valid_to > valid_from)
);

create index if not exists internal_price_lists_seller_idx
  on public.internal_price_lists (seller_cost_center_id, is_active, valid_from desc);

create index if not exists internal_price_lists_buyer_cc_idx
  on public.internal_price_lists (buyer_cost_center_id, is_active, valid_from desc)
  where buyer_cost_center_id is not null;

create index if not exists internal_price_lists_buyer_site_idx
  on public.internal_price_lists (buyer_site_id, is_active, valid_from desc)
  where buyer_site_id is not null;

comment on table public.internal_price_lists is
  'Listas de precios internos para transferencias entre centros de costo. No representan precio fiscal ni precio al cliente.';

comment on column public.internal_price_lists.seller_cost_center_id is
  'Centro de costo vendedor, normalmente centro de produccion.';

comment on column public.internal_price_lists.buyer_cost_center_id is
  'Centro de costo comprador. Puede ser null para una lista general.';

comment on column public.internal_price_lists.buyer_site_id is
  'Sede compradora especifica. Permite precios distintos por satelite.';

-- =====================================================================================
-- 3. Internal price list items
-- =====================================================================================

create table if not exists public.internal_price_list_items (
  id uuid primary key default gen_random_uuid(),
  price_list_id uuid not null references public.internal_price_lists(id) on delete cascade,
  product_id uuid not null references public.products(id),
  unit_price numeric not null,
  unit_code text not null,
  is_active boolean not null default true,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now(),
  constraint internal_price_list_items_unit_price_non_negative check (unit_price >= 0),
  constraint internal_price_list_items_unit_code_not_blank check (btrim(unit_code) <> '')
);

create index if not exists internal_price_list_items_product_idx
  on public.internal_price_list_items (product_id, is_active);

create unique index if not exists internal_price_list_items_active_uniq
  on public.internal_price_list_items (price_list_id, product_id, lower(btrim(unit_code)))
  where is_active = true;

comment on table public.internal_price_list_items is
  'Items de listas de precios internos. unit_price es precio interno neto, sin impuestos.';

comment on column public.internal_price_list_items.unit_price is
  'Precio interno neto usado para valorizar remisiones cerradas.';

-- =====================================================================================
-- 4. Internal transfer variances
-- =====================================================================================

create table if not exists public.internal_transfer_variances (
  id uuid primary key default gen_random_uuid(),
  remission_id uuid not null references public.restock_requests(id),
  remission_item_id uuid not null references public.restock_request_items(id),
  product_id uuid not null references public.products(id),
  expected_qty numeric not null default 0,
  dispatched_qty numeric not null default 0,
  received_qty numeric not null default 0,
  variance_qty numeric not null default 0,
  unit_code text null,
  variance_type text not null default 'shortage',
  reason text null,
  responsible_cost_center_id uuid null references public.cost_centers(id),
  responsible_employee_id uuid null references public.employees(id),
  financial_treatment text not null default 'pending',
  status text not null default 'pending',
  approved_by uuid null references public.employees(id),
  approved_at timestamptz null,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now(),
  constraint internal_transfer_variances_expected_non_negative check (expected_qty >= 0),
  constraint internal_transfer_variances_dispatched_non_negative check (dispatched_qty >= 0),
  constraint internal_transfer_variances_received_non_negative check (received_qty >= 0),
  constraint internal_transfer_variances_variance_non_negative check (variance_qty >= 0),
  constraint internal_transfer_variances_type_check check (
    variance_type in ('shortage', 'damage', 'overage', 'wrong_item', 'quality_issue', 'other')
  ),
  constraint internal_transfer_variances_financial_treatment_check check (
    financial_treatment in (
      'pending',
      'charge_to_responsible_cost_center',
      'company_loss',
      'production_loss',
      'satellite_loss',
      'logistics_loss',
      'no_charge_authorized'
    )
  ),
  constraint internal_transfer_variances_status_check check (
    status in ('pending', 'resolved', 'approved', 'cancelled')
  )
);

create index if not exists internal_transfer_variances_remission_idx
  on public.internal_transfer_variances (remission_id, status);

create index if not exists internal_transfer_variances_item_idx
  on public.internal_transfer_variances (remission_item_id);

create index if not exists internal_transfer_variances_responsible_cc_idx
  on public.internal_transfer_variances (responsible_cost_center_id, status)
  where responsible_cost_center_id is not null;

comment on table public.internal_transfer_variances is
  'Diferencias internas entre lo despachado y lo recibido en remisiones. Bloquean facturacion hasta resolverse/aprobarse.';

-- =====================================================================================
-- 5. Internal POS documents and numbering sequence by date
-- =====================================================================================

create table if not exists public.internal_pos_document_sequences (
  document_date date primary key,
  last_value integer not null default 0,
  updated_at timestamptz not null default now(),
  constraint internal_pos_document_sequences_last_value_non_negative check (last_value >= 0)
);

comment on table public.internal_pos_document_sequences is
  'Secuencia interna por fecha para generar consecutivos INT-YYYYMMDD-0001.';

create table if not exists public.internal_pos_documents (
  id uuid primary key default gen_random_uuid(),
  document_number text not null,
  document_date date not null,
  cutoff_at timestamptz not null,
  seller_cost_center_id uuid not null references public.cost_centers(id),
  buyer_cost_center_id uuid not null references public.cost_centers(id),
  buyer_site_id uuid null references public.sites(id),
  status text not null default 'draft',
  subtotal numeric not null default 0,
  total numeric not null default 0,
  currency text not null default 'COP',
  generated_by_system boolean not null default true,
  generated_at timestamptz not null default now(),
  issued_at timestamptz null,
  cancelled_at timestamptz null,
  credited_at timestamptz null,
  notes text null,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now(),
  constraint internal_pos_documents_number_not_blank check (btrim(document_number) <> ''),
  constraint internal_pos_documents_status_check check (
    status in ('draft', 'issued', 'cancelled', 'credited')
  ),
  constraint internal_pos_documents_subtotal_non_negative check (subtotal >= 0),
  constraint internal_pos_documents_total_non_negative check (total >= 0),
  constraint internal_pos_documents_currency_not_blank check (btrim(currency) <> '')
);

create unique index if not exists internal_pos_documents_number_uidx
  on public.internal_pos_documents (document_number);

create index if not exists internal_pos_documents_date_idx
  on public.internal_pos_documents (document_date, status);

create index if not exists internal_pos_documents_buyer_idx
  on public.internal_pos_documents (buyer_cost_center_id, document_date desc);

create index if not exists internal_pos_documents_seller_idx
  on public.internal_pos_documents (seller_cost_center_id, document_date desc);

create unique index if not exists internal_pos_documents_cutoff_party_active_uidx
  on public.internal_pos_documents (
    document_date,
    seller_cost_center_id,
    buyer_cost_center_id,
    coalesce(buyer_site_id, '00000000-0000-0000-0000-000000000000'::uuid)
  )
  where status in ('draft', 'issued', 'credited');

comment on table public.internal_pos_documents is
  'Comprobantes POS internos diarios generados desde remisiones cerradas y valorizadas. No son factura fiscal.';

comment on column public.internal_pos_documents.document_number is
  'Consecutivo global interno. Formato recomendado: INT-YYYYMMDD-0001.';

-- =====================================================================================
-- 6. Internal POS document lines
-- =====================================================================================

create table if not exists public.internal_pos_document_lines (
  id uuid primary key default gen_random_uuid(),
  document_id uuid not null references public.internal_pos_documents(id) on delete cascade,
  remission_id uuid not null references public.restock_requests(id),
  remission_item_id uuid not null references public.restock_request_items(id),
  product_id uuid not null references public.products(id),
  quantity numeric not null,
  unit_code text not null,
  unit_price numeric not null,
  subtotal numeric not null,
  price_list_id uuid null references public.internal_price_lists(id),
  price_list_item_id uuid null references public.internal_price_list_items(id),
  priced_at timestamptz not null,
  created_at timestamptz not null default now(),
  constraint internal_pos_document_lines_quantity_positive check (quantity > 0),
  constraint internal_pos_document_lines_unit_price_non_negative check (unit_price >= 0),
  constraint internal_pos_document_lines_subtotal_non_negative check (subtotal >= 0),
  constraint internal_pos_document_lines_unit_code_not_blank check (btrim(unit_code) <> '')
);

create index if not exists internal_pos_document_lines_document_idx
  on public.internal_pos_document_lines (document_id);

create index if not exists internal_pos_document_lines_remission_idx
  on public.internal_pos_document_lines (remission_id);

create unique index if not exists internal_pos_document_lines_remission_item_uidx
  on public.internal_pos_document_lines (remission_item_id);

comment on table public.internal_pos_document_lines is
  'Lineas de comprobantes POS internos. Cada linea viene de un item de remision y no puede facturarse dos veces.';

-- =====================================================================================
-- 7. Extend restock_requests with internal billing snapshot references
-- =====================================================================================

alter table public.restock_requests
  add column if not exists seller_cost_center_id uuid null references public.cost_centers(id),
  add column if not exists buyer_cost_center_id uuid null references public.cost_centers(id),
  add column if not exists internal_pos_document_id uuid null references public.internal_pos_documents(id),
  add column if not exists priced_at timestamptz null;

do $$
begin
  if not exists (
    select 1
    from pg_constraint
    where conname = 'restock_requests_pricing_mode_check'
      and conrelid = 'public.restock_requests'::regclass
  ) then
    alter table public.restock_requests
      add constraint restock_requests_pricing_mode_check
      check (
        pricing_mode in ('none', 'internal_transfer', 'external_purchase', 'manual_adjustment')
      ) not valid;
  end if;
end $$;

do $$
begin
  if not exists (
    select 1
    from pg_constraint
    where conname = 'restock_requests_pricing_status_check'
      and conrelid = 'public.restock_requests'::regclass
  ) then
    alter table public.restock_requests
      add constraint restock_requests_pricing_status_check
      check (
        pricing_status in (
          'draft',
          'pending_close',
          'pending_price',
          'pending_variance_resolution',
          'ready_to_invoice',
          'invoiced',
          'credited',
          'not_applicable'
        )
      ) not valid;
  end if;
end $$;

create index if not exists restock_requests_internal_billing_idx
  on public.restock_requests (
    pricing_mode,
    pricing_status,
    closed_at,
    internal_pos_document_id
  );

create index if not exists restock_requests_seller_buyer_cc_idx
  on public.restock_requests (seller_cost_center_id, buyer_cost_center_id)
  where seller_cost_center_id is not null and buyer_cost_center_id is not null;

comment on column public.restock_requests.seller_cost_center_id is
  'Snapshot del centro de costo vendedor usado para facturacion interna.';

comment on column public.restock_requests.buyer_cost_center_id is
  'Snapshot del centro de costo comprador usado para facturacion interna.';

comment on column public.restock_requests.internal_pos_document_id is
  'Comprobante POS interno asociado cuando la remision queda facturada.';

comment on column public.restock_requests.priced_at is
  'Momento en que la remision fue valorizada con precios internos.';

-- =====================================================================================
-- 8. Extend restock_request_items with internal price provenance
-- =====================================================================================

alter table public.restock_request_items
  add column if not exists internal_price_list_id uuid null references public.internal_price_lists(id),
  add column if not exists internal_price_list_item_id uuid null references public.internal_price_list_items(id),
  add column if not exists priced_at timestamptz null;

do $$
begin
  if not exists (
    select 1
    from pg_constraint
    where conname = 'restock_request_items_transfer_unit_price_non_negative'
      and conrelid = 'public.restock_request_items'::regclass
  ) then
    alter table public.restock_request_items
      add constraint restock_request_items_transfer_unit_price_non_negative
      check (transfer_unit_price is null or transfer_unit_price >= 0) not valid;
  end if;
end $$;

do $$
begin
  if not exists (
    select 1
    from pg_constraint
    where conname = 'restock_request_items_transfer_total_non_negative'
      and conrelid = 'public.restock_request_items'::regclass
  ) then
    alter table public.restock_request_items
      add constraint restock_request_items_transfer_total_non_negative
      check (transfer_total is null or transfer_total >= 0) not valid;
  end if;
end $$;

create index if not exists restock_request_items_internal_price_idx
  on public.restock_request_items (internal_price_list_item_id)
  where internal_price_list_item_id is not null;

create index if not exists restock_request_items_priced_at_idx
  on public.restock_request_items (priced_at)
  where priced_at is not null;

comment on column public.restock_request_items.transfer_unit_price is
  'Snapshot del precio interno unitario usado para facturar la linea.';

comment on column public.restock_request_items.transfer_total is
  'Subtotal interno de la linea: cantidad recibida valorizada por precio interno.';

comment on column public.restock_request_items.internal_price_list_id is
  'Lista de precios internos usada para valorizar la linea.';

comment on column public.restock_request_items.internal_price_list_item_id is
  'Item exacto de lista de precios usado como fuente del precio interno.';

comment on column public.restock_request_items.priced_at is
  'Momento en que se congelo el precio interno de la linea.';

-- =====================================================================================
-- 9. Updated-at triggers for new/extended tables
-- =====================================================================================

drop trigger if exists trg_cost_centers_updated_at on public.cost_centers;
create trigger trg_cost_centers_updated_at
before update on public.cost_centers
for each row execute function _set_updated_at();

drop trigger if exists trg_internal_price_lists_updated_at on public.internal_price_lists;
create trigger trg_internal_price_lists_updated_at
before update on public.internal_price_lists
for each row execute function _set_updated_at();

drop trigger if exists trg_internal_price_list_items_updated_at on public.internal_price_list_items;
create trigger trg_internal_price_list_items_updated_at
before update on public.internal_price_list_items
for each row execute function _set_updated_at();

drop trigger if exists trg_internal_transfer_variances_updated_at on public.internal_transfer_variances;
create trigger trg_internal_transfer_variances_updated_at
before update on public.internal_transfer_variances
for each row execute function _set_updated_at();

drop trigger if exists trg_internal_pos_document_sequences_updated_at on public.internal_pos_document_sequences;
create trigger trg_internal_pos_document_sequences_updated_at
before update on public.internal_pos_document_sequences
for each row execute function _set_updated_at();

drop trigger if exists trg_internal_pos_documents_updated_at on public.internal_pos_documents;
create trigger trg_internal_pos_documents_updated_at
before update on public.internal_pos_documents
for each row execute function _set_updated_at();

-- =====================================================================================
-- 10. Enable RLS
-- =====================================================================================

alter table public.internal_price_lists enable row level security;
alter table public.internal_price_list_items enable row level security;
alter table public.internal_transfer_variances enable row level security;
alter table public.internal_pos_document_sequences enable row level security;
alter table public.internal_pos_documents enable row level security;
alter table public.internal_pos_document_lines enable row level security;

-- =====================================================================================
-- 11. RLS policies
-- =====================================================================================

-- cost_centers write policy. Existing read policy remains unchanged.
drop policy if exists cost_centers_manage_internal_billing on public.cost_centers;
create policy cost_centers_manage_internal_billing
on public.cost_centers
for all
to authenticated
using (
  has_permission('nexo.cost_centers.manage')
  or is_owner()
  or is_global_manager()
)
with check (
  has_permission('nexo.cost_centers.manage')
  or is_owner()
  or is_global_manager()
);

-- internal_price_lists
drop policy if exists internal_price_lists_select_permission on public.internal_price_lists;
create policy internal_price_lists_select_permission
on public.internal_price_lists
for select
to authenticated
using (
  has_permission('nexo.internal_prices.view')
  or has_permission('nexo.internal_prices.manage')
  or is_owner()
  or is_global_manager()
);

drop policy if exists internal_price_lists_write_permission on public.internal_price_lists;
create policy internal_price_lists_write_permission
on public.internal_price_lists
for all
to authenticated
using (
  has_permission('nexo.internal_prices.manage')
  or is_owner()
  or is_global_manager()
)
with check (
  has_permission('nexo.internal_prices.manage')
  or is_owner()
  or is_global_manager()
);

-- internal_price_list_items
drop policy if exists internal_price_list_items_select_permission on public.internal_price_list_items;
create policy internal_price_list_items_select_permission
on public.internal_price_list_items
for select
to authenticated
using (
  has_permission('nexo.internal_prices.view')
  or has_permission('nexo.internal_prices.manage')
  or is_owner()
  or is_global_manager()
);

drop policy if exists internal_price_list_items_write_permission on public.internal_price_list_items;
create policy internal_price_list_items_write_permission
on public.internal_price_list_items
for all
to authenticated
using (
  has_permission('nexo.internal_prices.manage')
  or is_owner()
  or is_global_manager()
)
with check (
  has_permission('nexo.internal_prices.manage')
  or is_owner()
  or is_global_manager()
);

-- internal_transfer_variances
drop policy if exists internal_transfer_variances_select_permission on public.internal_transfer_variances;
create policy internal_transfer_variances_select_permission
on public.internal_transfer_variances
for select
to authenticated
using (
  has_permission('nexo.internal_variances.view')
  or has_permission('nexo.internal_variances.resolve')
  or has_permission('nexo.internal_variances.approve')
  or is_owner()
  or is_global_manager()
);

drop policy if exists internal_transfer_variances_write_permission on public.internal_transfer_variances;
create policy internal_transfer_variances_write_permission
on public.internal_transfer_variances
for all
to authenticated
using (
  has_permission('nexo.internal_variances.resolve')
  or has_permission('nexo.internal_variances.approve')
  or is_owner()
  or is_global_manager()
)
with check (
  has_permission('nexo.internal_variances.resolve')
  or has_permission('nexo.internal_variances.approve')
  or is_owner()
  or is_global_manager()
);

-- internal_pos_document_sequences: app/server/service process only.
drop policy if exists internal_pos_document_sequences_service_role on public.internal_pos_document_sequences;
create policy internal_pos_document_sequences_service_role
on public.internal_pos_document_sequences
for all
to service_role
using (true)
with check (true);

-- internal_pos_documents
drop policy if exists internal_pos_documents_select_permission on public.internal_pos_documents;
create policy internal_pos_documents_select_permission
on public.internal_pos_documents
for select
to authenticated
using (
  has_permission('nexo.internal_invoices.view')
  or has_permission('nexo.internal_invoices.view_amounts')
  or has_permission('nexo.internal_invoices.generate')
  or has_permission('nexo.internal_invoices.issue')
  or has_permission('nexo.internal_invoices.cancel')
  or is_owner()
  or is_global_manager()
);

drop policy if exists internal_pos_documents_write_permission on public.internal_pos_documents;
create policy internal_pos_documents_write_permission
on public.internal_pos_documents
for all
to authenticated
using (
  has_permission('nexo.internal_invoices.generate')
  or has_permission('nexo.internal_invoices.issue')
  or has_permission('nexo.internal_invoices.cancel')
  or is_owner()
  or is_global_manager()
)
with check (
  has_permission('nexo.internal_invoices.generate')
  or has_permission('nexo.internal_invoices.issue')
  or has_permission('nexo.internal_invoices.cancel')
  or is_owner()
  or is_global_manager()
);

drop policy if exists internal_pos_documents_service_role on public.internal_pos_documents;
create policy internal_pos_documents_service_role
on public.internal_pos_documents
for all
to service_role
using (true)
with check (true);

-- internal_pos_document_lines
drop policy if exists internal_pos_document_lines_select_permission on public.internal_pos_document_lines;
create policy internal_pos_document_lines_select_permission
on public.internal_pos_document_lines
for select
to authenticated
using (
  has_permission('nexo.internal_invoices.view')
  or has_permission('nexo.internal_invoices.view_amounts')
  or has_permission('nexo.internal_invoices.generate')
  or has_permission('nexo.internal_invoices.issue')
  or has_permission('nexo.internal_invoices.cancel')
  or is_owner()
  or is_global_manager()
);

drop policy if exists internal_pos_document_lines_write_permission on public.internal_pos_document_lines;
create policy internal_pos_document_lines_write_permission
on public.internal_pos_document_lines
for all
to authenticated
using (
  has_permission('nexo.internal_invoices.generate')
  or has_permission('nexo.internal_invoices.issue')
  or has_permission('nexo.internal_invoices.cancel')
  or is_owner()
  or is_global_manager()
)
with check (
  has_permission('nexo.internal_invoices.generate')
  or has_permission('nexo.internal_invoices.issue')
  or has_permission('nexo.internal_invoices.cancel')
  or is_owner()
  or is_global_manager()
);

drop policy if exists internal_pos_document_lines_service_role on public.internal_pos_document_lines;
create policy internal_pos_document_lines_service_role
on public.internal_pos_document_lines
for all
to service_role
using (true)
with check (true);

-- =====================================================================================
-- 12. NEXO permissions for VISO role matrix
-- app_permissions.code stores the code without app prefix.
-- has_permission can still be called with the full p_permission_code, e.g. nexo.internal_prices.manage.
-- =====================================================================================

with nexo_app as (
  select id
  from public.apps
  where code = 'nexo'
)
insert into public.app_permissions (app_id, code, name, description, is_active)
select
  nexo_app.id,
  permission.code,
  permission.name,
  permission.description,
  true
from nexo_app
cross join (
  values
    ('cost_centers.view', 'Centros de costo - Ver', 'Ver centros de costo internos.'),
    ('cost_centers.manage', 'Centros de costo - Gestionar', 'Crear y administrar centros de costo internos.'),

    ('internal_prices.view', 'Precios internos - Ver', 'Ver listas de precios internos.'),
    ('internal_prices.manage', 'Precios internos - Gestionar', 'Crear y editar precios internos por producto y satelite.'),

    ('internal_invoices.view', 'Comprobantes internos - Ver', 'Ver comprobantes POS internos.'),
    ('internal_invoices.view_amounts', 'Comprobantes internos - Ver valores', 'Ver valores monetarios de comprobantes internos.'),
    ('internal_invoices.generate', 'Comprobantes internos - Generar', 'Generar o regenerar comprobantes POS internos.'),
    ('internal_invoices.issue', 'Comprobantes internos - Emitir', 'Emitir comprobantes POS internos.'),
    ('internal_invoices.cancel', 'Comprobantes internos - Cancelar', 'Cancelar comprobantes POS internos.'),

    ('internal_variances.view', 'Diferencias internas - Ver', 'Ver diferencias entre despacho y recepcion.'),
    ('internal_variances.resolve', 'Diferencias internas - Resolver', 'Resolver diferencias internas antes del corte.'),
    ('internal_variances.approve', 'Diferencias internas - Aprobar', 'Aprobar diferencias internas y tratamientos financieros.'),

    ('internal_reports.view', 'Reportes internos - Ver', 'Ver reportes de compras, ingresos y comprobantes internos.'),
    ('internal_reports.full_margin', 'Reportes internos - Margen completo', 'Ver reportes con margen completo y costos reales.')
) as permission(code, name, description)
on conflict (app_id, code)
do update set
  name = excluded.name,
  description = excluded.description,
  is_active = true,
  updated_at = now();

commit;

-- =====================================================================================
-- Post-migration validation queries
-- =====================================================================================

select
  'internal_billing_tables' as check_name,
  table_name
from information_schema.tables
where table_schema = 'public'
  and table_name in (
    'internal_price_lists',
    'internal_price_list_items',
    'internal_transfer_variances',
    'internal_pos_document_sequences',
    'internal_pos_documents',
    'internal_pos_document_lines'
  )
order by table_name;

select
  'nexo_internal_permissions' as check_name,
  ap.code,
  ap.name
from public.app_permissions ap
join public.apps a
  on a.id = ap.app_id
where a.code = 'nexo'
  and (
    ap.code like 'internal_%'
    or ap.code like 'cost_centers.%'
  )
order by ap.code;
