create table if not exists public.pulso_external_sales_item_mappings (
  id uuid primary key default gen_random_uuid(),
  site_id uuid not null references public.sites(id) on delete cascade,
  source text not null default 'makos',
  external_item_id text not null,
  external_item_name text,
  external_category text,
  catalog_item_id uuid not null references pass.catalog_items(id) on delete cascade,
  product_id uuid references public.products(id) on delete set null,
  is_active boolean not null default true,
  created_by uuid references auth.users(id) on delete set null,
  updated_by uuid references auth.users(id) on delete set null,
  metadata jsonb not null default '{}'::jsonb,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now(),
  constraint pulso_external_sales_item_mappings_source_check check (length(trim(source)) > 0),
  constraint pulso_external_sales_item_mappings_mid_check check (length(trim(external_item_id)) > 0),
  constraint pulso_external_sales_item_mappings_site_source_mid_key unique (site_id, source, external_item_id),
  constraint pulso_external_sales_item_mappings_site_catalog_key unique (site_id, source, catalog_item_id)
);

create index if not exists pulso_external_sales_item_mappings_catalog_idx
  on public.pulso_external_sales_item_mappings (catalog_item_id)
  where is_active = true;

create index if not exists pulso_external_sales_item_mappings_site_source_idx
  on public.pulso_external_sales_item_mappings (site_id, source, is_active);

create or replace function public.set_pulso_external_sales_item_mappings_updated_at()
returns trigger
language plpgsql
as $$
begin
  new.updated_at = now();
  return new;
end;
$$;

drop trigger if exists pulso_external_sales_item_mappings_updated_at on public.pulso_external_sales_item_mappings;
create trigger pulso_external_sales_item_mappings_updated_at
before update on public.pulso_external_sales_item_mappings
for each row
execute function public.set_pulso_external_sales_item_mappings_updated_at();

create or replace function public.pulso_sync_external_sales_item_mapping_product_id()
returns trigger
language plpgsql
security invoker
set search_path = public, pass
as $$
begin
  select ci.product_id
    into new.product_id
  from pass.catalog_items ci
  where ci.id = new.catalog_item_id
    and ci.site_id = new.site_id;

  if not found then
    raise exception 'catalog_item_id no pertenece a la sede indicada';
  end if;

  return new;
end;
$$;

drop trigger if exists pulso_external_sales_item_mappings_sync_product on public.pulso_external_sales_item_mappings;
create trigger pulso_external_sales_item_mappings_sync_product
before insert or update of catalog_item_id, site_id
on public.pulso_external_sales_item_mappings
for each row
execute function public.pulso_sync_external_sales_item_mapping_product_id();

alter table public.pulso_external_sales_item_mappings enable row level security;

drop policy if exists pulso_external_sales_item_mappings_select_permission on public.pulso_external_sales_item_mappings;
create policy pulso_external_sales_item_mappings_select_permission
on public.pulso_external_sales_item_mappings
for select
to authenticated
using (public.has_permission('pulso.pos.main', site_id));

drop policy if exists pulso_external_sales_item_mappings_insert_permission on public.pulso_external_sales_item_mappings;
create policy pulso_external_sales_item_mappings_insert_permission
on public.pulso_external_sales_item_mappings
for insert
to authenticated
with check (public.has_permission('pulso.pos.main', site_id));

drop policy if exists pulso_external_sales_item_mappings_update_permission on public.pulso_external_sales_item_mappings;
create policy pulso_external_sales_item_mappings_update_permission
on public.pulso_external_sales_item_mappings
for update
to authenticated
using (public.has_permission('pulso.pos.main', site_id))
with check (public.has_permission('pulso.pos.main', site_id));

grant select, insert, update on public.pulso_external_sales_item_mappings to authenticated;
grant all on public.pulso_external_sales_item_mappings to service_role;
grant execute on function public.pulso_sync_external_sales_item_mapping_product_id() to authenticated, service_role;