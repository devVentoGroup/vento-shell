begin;

create table if not exists public.remission_product_categories (
  id uuid primary key default gen_random_uuid(),
  site_id uuid not null references public.sites(id) on delete cascade,
  name text not null,
  sort_order integer not null default 0,
  is_active boolean not null default true,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now(),
  updated_by uuid references auth.users(id),
  constraint remission_product_categories_name_not_blank
    check (length(btrim(name)) > 0),
  constraint remission_product_categories_unique_site_name
    unique (site_id, name)
);

comment on table public.remission_product_categories is
  'Categorias visuales por sede destino para agrupar productos en solicitudes de remision. No cambian la categoria real del catalogo.';
comment on column public.remission_product_categories.site_id is
  'Sede destino que usa esta categoria visual.';
comment on column public.remission_product_categories.sort_order is
  'Orden visual dentro de la sede destino.';

drop trigger if exists trg_remission_product_categories_updated_at
  on public.remission_product_categories;
create trigger trg_remission_product_categories_updated_at
before update on public.remission_product_categories
for each row execute function public._set_updated_at();

alter table public.remission_product_categories enable row level security;

drop policy if exists "remission_product_categories_select_authenticated"
  on public.remission_product_categories;
create policy "remission_product_categories_select_authenticated"
on public.remission_product_categories
for select
to authenticated
using (true);

drop policy if exists "remission_product_categories_write_admin"
  on public.remission_product_categories;
create policy "remission_product_categories_write_admin"
on public.remission_product_categories
for all
to authenticated
using (public.is_owner() or public.is_global_manager())
with check (public.is_owner() or public.is_global_manager());

grant select, insert, update, delete on public.remission_product_categories to authenticated;

alter table public.product_site_settings
  add column if not exists remission_category_id uuid
    references public.remission_product_categories(id) on delete set null;

create index if not exists idx_remission_product_categories_site_active_sort
  on public.remission_product_categories(site_id, is_active, sort_order, name);

create index if not exists idx_product_site_settings_remission_category
  on public.product_site_settings(remission_category_id)
  where remission_category_id is not null;

comment on column public.product_site_settings.remission_category_id is
  'Categoria visual de remision para agrupar este producto en la sede destino. No afecta inventario, compras ni categoria del catalogo.';

commit;
