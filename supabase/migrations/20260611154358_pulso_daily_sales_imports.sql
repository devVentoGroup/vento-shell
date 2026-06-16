create table if not exists public.pulso_daily_sales_import_batches (
  id uuid primary key default gen_random_uuid(),
  site_id uuid not null references public.sites(id) on delete restrict,
  sales_date date not null,
  source text not null default 'makos_excel',
  source_file_name text not null,
  source_file_hash text not null,
  status text not null default 'draft',
  row_count integer not null default 0,
  matched_row_count integer not null default 0,
  warning_count integer not null default 0,
  total_quantity numeric(14,3) not null default 0,
  subtotal_amount numeric(14,2) not null default 0,
  tax_amount numeric(14,2) not null default 0,
  discount_amount numeric(14,2) not null default 0,
  return_amount numeric(14,2) not null default 0,
  net_sales_amount numeric(14,2) not null default 0,
  imported_by uuid references auth.users(id) on delete set null,
  imported_at timestamptz not null default now(),
  posted_at timestamptz,
  metadata jsonb not null default '{}'::jsonb,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now(),
  constraint pulso_daily_sales_import_batches_status_check check (status in ('draft', 'validated', 'posted', 'cancelled')),
  constraint pulso_daily_sales_import_batches_source_hash_key unique (site_id, sales_date, source, source_file_hash),
  constraint pulso_daily_sales_import_batches_totals_nonnegative check (
    row_count >= 0
    and matched_row_count >= 0
    and warning_count >= 0
    and total_quantity >= 0
    and subtotal_amount >= 0
    and tax_amount >= 0
    and discount_amount >= 0
    and return_amount >= 0
  )
);

create table if not exists public.pulso_daily_sales_import_rows (
  id uuid primary key default gen_random_uuid(),
  batch_id uuid not null references public.pulso_daily_sales_import_batches(id) on delete cascade,
  site_id uuid not null references public.sites(id) on delete restrict,
  sales_date date not null,
  source_row_number integer not null,
  external_item_id text,
  external_item_name text not null,
  external_category text,
  quantity numeric(14,3) not null default 0,
  subtotal_amount numeric(14,2) not null default 0,
  tax_amount numeric(14,2) not null default 0,
  discount_amount numeric(14,2) not null default 0,
  return_amount numeric(14,2) not null default 0,
  net_sales_amount numeric(14,2) not null default 0,
  gross_sales_amount numeric(14,2) not null default 0,
  catalog_item_id uuid references pass.catalog_items(id) on delete set null,
  product_id uuid references public.products(id) on delete set null,
  match_status text not null default 'unmatched',
  match_reason text,
  row_status text not null default 'draft',
  metadata jsonb not null default '{}'::jsonb,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now(),
  constraint pulso_daily_sales_import_rows_status_check check (row_status in ('draft', 'validated', 'posted', 'cancelled')),
  constraint pulso_daily_sales_import_rows_match_status_check check (match_status in ('matched_mid', 'matched_code', 'matched_name', 'unmatched')),
  constraint pulso_daily_sales_import_rows_amounts_nonnegative check (
    quantity >= 0
    and subtotal_amount >= 0
    and tax_amount >= 0
    and discount_amount >= 0
    and return_amount >= 0
  ),
  constraint pulso_daily_sales_import_rows_batch_row_unique unique (batch_id, source_row_number)
);

create index if not exists pulso_daily_sales_import_batches_site_date_idx
  on public.pulso_daily_sales_import_batches (site_id, sales_date desc, imported_at desc);

create index if not exists pulso_daily_sales_import_rows_batch_idx
  on public.pulso_daily_sales_import_rows (batch_id, source_row_number);

create index if not exists pulso_daily_sales_import_rows_catalog_idx
  on public.pulso_daily_sales_import_rows (catalog_item_id)
  where catalog_item_id is not null;

create or replace function public.set_pulso_daily_sales_import_updated_at()
returns trigger
language plpgsql
as $$
begin
  new.updated_at = now();
  return new;
end;
$$;

drop trigger if exists pulso_daily_sales_import_batches_updated_at on public.pulso_daily_sales_import_batches;
create trigger pulso_daily_sales_import_batches_updated_at
before update on public.pulso_daily_sales_import_batches
for each row
execute function public.set_pulso_daily_sales_import_updated_at();

drop trigger if exists pulso_daily_sales_import_rows_updated_at on public.pulso_daily_sales_import_rows;
create trigger pulso_daily_sales_import_rows_updated_at
before update on public.pulso_daily_sales_import_rows
for each row
execute function public.set_pulso_daily_sales_import_updated_at();

alter table public.pulso_daily_sales_import_batches enable row level security;
alter table public.pulso_daily_sales_import_rows enable row level security;

drop policy if exists pulso_sales_import_batches_select_permission on public.pulso_daily_sales_import_batches;
create policy pulso_sales_import_batches_select_permission
on public.pulso_daily_sales_import_batches
for select
to authenticated
using (public.has_permission('pulso.pos.main', site_id));

drop policy if exists pulso_sales_import_batches_insert_permission on public.pulso_daily_sales_import_batches;
create policy pulso_sales_import_batches_insert_permission
on public.pulso_daily_sales_import_batches
for insert
to authenticated
with check (public.has_permission('pulso.pos.main', site_id));

drop policy if exists pulso_sales_import_batches_update_permission on public.pulso_daily_sales_import_batches;
create policy pulso_sales_import_batches_update_permission
on public.pulso_daily_sales_import_batches
for update
to authenticated
using (public.has_permission('pulso.pos.main', site_id))
with check (public.has_permission('pulso.pos.main', site_id));

drop policy if exists pulso_sales_import_rows_select_permission on public.pulso_daily_sales_import_rows;
create policy pulso_sales_import_rows_select_permission
on public.pulso_daily_sales_import_rows
for select
to authenticated
using (public.has_permission('pulso.pos.main', site_id));

drop policy if exists pulso_sales_import_rows_insert_permission on public.pulso_daily_sales_import_rows;
create policy pulso_sales_import_rows_insert_permission
on public.pulso_daily_sales_import_rows
for insert
to authenticated
with check (public.has_permission('pulso.pos.main', site_id));

drop policy if exists pulso_sales_import_rows_update_permission on public.pulso_daily_sales_import_rows;
create policy pulso_sales_import_rows_update_permission
on public.pulso_daily_sales_import_rows
for update
to authenticated
using (public.has_permission('pulso.pos.main', site_id))
with check (public.has_permission('pulso.pos.main', site_id));

grant select, insert, update on public.pulso_daily_sales_import_batches to authenticated;
grant select, insert, update on public.pulso_daily_sales_import_rows to authenticated;
grant all on public.pulso_daily_sales_import_batches to service_role;
grant all on public.pulso_daily_sales_import_rows to service_role;

insert into public.app_navigation_items (
  app_code,
  group_key,
  group_label,
  group_order,
  item_key,
  label,
  description,
  href,
  icon,
  required_permission_code,
  sort_order,
  is_active,
  metadata
)
values (
  'pulso',
  'ventas',
  'Ventas',
  20,
  'sales_imports',
  'Importar ventas',
  'Ventas diarias por Excel',
  '/sales-imports',
  'clipboard',
  'pulso.pos.main',
  20,
  true,
  jsonb_build_object('source', 'pulso_daily_sales_imports')
)
on conflict (app_code, item_key) do update
set group_key = excluded.group_key,
    group_label = excluded.group_label,
    group_order = excluded.group_order,
    label = excluded.label,
    description = excluded.description,
    href = excluded.href,
    icon = excluded.icon,
    required_permission_code = excluded.required_permission_code,
    sort_order = excluded.sort_order,
    is_active = excluded.is_active,
    metadata = public.app_navigation_items.metadata || excluded.metadata,
    updated_at = now();
