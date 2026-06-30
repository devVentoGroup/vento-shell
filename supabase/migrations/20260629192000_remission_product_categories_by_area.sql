begin;

alter table public.remission_product_categories
  add column if not exists area_kind text;

alter table public.remission_product_categories
  drop constraint if exists remission_product_categories_unique_site_name;

alter table public.remission_product_categories
  drop constraint if exists remission_product_categories_area_kind_not_blank;

alter table public.remission_product_categories
  add constraint remission_product_categories_area_kind_not_blank
    check (area_kind is null or length(btrim(area_kind)) > 0);

create unique index if not exists remission_product_categories_unique_site_area_name
  on public.remission_product_categories (
    site_id,
    coalesce(area_kind, ''),
    lower(btrim(name))
  );

create index if not exists idx_remission_product_categories_site_area_active_sort
  on public.remission_product_categories(site_id, area_kind, is_active, sort_order, name);

comment on column public.remission_product_categories.area_kind is
  'Área solicitante dentro de la sede destino. Null conserva categorías globales heredadas.';

create table if not exists public.product_site_area_remission_categories (
  id uuid primary key default gen_random_uuid(),
  product_id uuid not null references public.products(id) on delete cascade,
  site_id uuid not null references public.sites(id) on delete cascade,
  area_kind text not null,
  remission_category_id uuid references public.remission_product_categories(id) on delete set null,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now(),
  updated_by uuid references auth.users(id),
  constraint product_site_area_remission_categories_area_kind_not_blank
    check (length(btrim(area_kind)) > 0),
  constraint product_site_area_remission_categories_unique_scope
    unique (product_id, site_id, area_kind)
);

comment on table public.product_site_area_remission_categories is
  'Asignación de categoría visual de remisión por producto, sede destino y área solicitante.';
comment on column public.product_site_area_remission_categories.area_kind is
  'Área solicitante: cocina, barra, mostrador u otra regla activa de remisión.';
comment on column public.product_site_area_remission_categories.remission_category_id is
  'Categoría visual usada para ordenar el producto dentro del área solicitante.';

drop trigger if exists trg_product_site_area_remission_categories_updated_at
  on public.product_site_area_remission_categories;
create trigger trg_product_site_area_remission_categories_updated_at
before update on public.product_site_area_remission_categories
for each row execute function public._set_updated_at();

alter table public.product_site_area_remission_categories enable row level security;

drop policy if exists "product_site_area_remission_categories_select_authenticated"
  on public.product_site_area_remission_categories;
create policy "product_site_area_remission_categories_select_authenticated"
on public.product_site_area_remission_categories
for select
to authenticated
using (true);

drop policy if exists "product_site_area_remission_categories_write_admin"
  on public.product_site_area_remission_categories;
create policy "product_site_area_remission_categories_write_admin"
on public.product_site_area_remission_categories
for all
to authenticated
using (public.is_owner() or public.is_global_manager())
with check (public.is_owner() or public.is_global_manager());

grant select, insert, update, delete
  on public.product_site_area_remission_categories
  to authenticated;

create index if not exists idx_product_site_area_remission_categories_site_area
  on public.product_site_area_remission_categories(site_id, area_kind);

create index if not exists idx_product_site_area_remission_categories_product_site
  on public.product_site_area_remission_categories(product_id, site_id);

insert into public.product_site_area_remission_categories (
  product_id,
  site_id,
  area_kind,
  remission_category_id
)
select
  pss.product_id,
  pss.site_id,
  area_kind_values.area_kind,
  pss.remission_category_id
from public.product_site_settings pss
cross join lateral (
  select distinct btrim(value)::text as area_kind
  from unnest(
    case
      when pss.area_kinds is not null and array_length(pss.area_kinds, 1) > 0
        then pss.area_kinds
      when pss.default_area_kind is not null and btrim(pss.default_area_kind) <> ''
        then array[pss.default_area_kind]
      else array[]::text[]
    end
  ) as value
) as area_kind_values
where pss.product_id is not null
  and pss.site_id is not null
  and pss.remission_category_id is not null
  and btrim(area_kind_values.area_kind) <> ''
on conflict (product_id, site_id, area_kind)
do update set
  remission_category_id = excluded.remission_category_id,
  updated_at = now();

commit;
