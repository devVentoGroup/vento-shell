-- Fase 13.2.5B — Solicitudes de maestro de datos desde Recepciones ORIGO
-- Crea una bandeja de revision para:
-- 1) nuevo producto / insumo
-- 2) nueva presentacion de compra para producto existente
--
-- Importante:
-- Esta tabla NO crea productos ni presentaciones aprobadas automaticamente.
-- Admin/Carlos/Nathalia deben revisar y aprobar antes de materializar en products/product_uom_profiles.

create table if not exists public.product_master_review_requests (
  id uuid primary key default gen_random_uuid(),

  request_kind text not null check (request_kind in ('new_product', 'new_presentation')),
  status text not null default 'pending_review' check (status in ('pending_review', 'approved', 'rejected', 'cancelled')),

  source_app text not null default 'origo',
  source_flow text not null default 'receipt',

  site_id uuid not null,
  supplier_id uuid null,
  product_id uuid null,

  source_entry_id uuid null,
  source_entry_item_id uuid null,
  line_index integer null,

  requested_label text not null,
  input_unit_code text null,
  input_unit_label text null,
  conversion_factor_to_stock numeric null check (
    conversion_factor_to_stock is null or conversion_factor_to_stock > 0
  ),
  stock_unit_code text null,

  unit_cost numeric null check (unit_cost is null or unit_cost >= 0),
  currency text not null default 'COP',

  notes text null,
  payload jsonb not null default '{}'::jsonb,

  created_by uuid null,
  created_at timestamptz not null default now(),

  reviewed_by uuid null,
  reviewed_at timestamptz null,
  review_notes text null,

  approved_product_id uuid null,
  approved_presentation_id uuid null,

  constraint product_master_review_requests_product_required_for_presentation
    check (request_kind <> 'new_presentation' or product_id is not null)
);

create index if not exists idx_product_master_review_requests_status
  on public.product_master_review_requests (status, created_at desc);

create index if not exists idx_product_master_review_requests_site_status
  on public.product_master_review_requests (site_id, status, created_at desc);

create index if not exists idx_product_master_review_requests_product
  on public.product_master_review_requests (product_id)
  where product_id is not null;

create index if not exists idx_product_master_review_requests_supplier
  on public.product_master_review_requests (supplier_id)
  where supplier_id is not null;

create index if not exists idx_product_master_review_requests_source_entry
  on public.product_master_review_requests (source_entry_id)
  where source_entry_id is not null;

alter table public.product_master_review_requests enable row level security;

drop policy if exists "product_master_review_requests_insert_own" on public.product_master_review_requests;
create policy "product_master_review_requests_insert_own"
  on public.product_master_review_requests
  for insert
  to authenticated
  with check (created_by = auth.uid());

drop policy if exists "product_master_review_requests_select_receipts" on public.product_master_review_requests;
create policy "product_master_review_requests_select_receipts"
  on public.product_master_review_requests
  for select
  to authenticated
  using (
    created_by = auth.uid()
    or public.has_permission('origo.procurement.receipts', site_id, null)
  );

drop policy if exists "product_master_review_requests_update_receipts" on public.product_master_review_requests;
create policy "product_master_review_requests_update_receipts"
  on public.product_master_review_requests
  for update
  to authenticated
  using (public.has_permission('origo.procurement.receipts', site_id, null))
  with check (public.has_permission('origo.procurement.receipts', site_id, null));
