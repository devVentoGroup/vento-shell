begin;

create table if not exists pass.catalog_item_option_groups (
  id uuid primary key default gen_random_uuid(),
  catalog_item_id uuid not null references pass.catalog_items(id) on update cascade on delete cascade,
  code text not null,
  name text not null,
  description text,
  selection_type text not null default 'single',
  is_required boolean not null default false,
  min_select integer not null default 0,
  max_select integer not null default 1,
  sort_order integer not null default 0,
  is_active boolean not null default true,
  metadata jsonb not null default '{}'::jsonb,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now(),

  constraint pass_catalog_item_option_groups_item_code_key unique (catalog_item_id, code),
  constraint pass_catalog_item_option_groups_code_not_blank check (length(btrim(code)) > 0),
  constraint pass_catalog_item_option_groups_name_not_blank check (length(btrim(name)) > 0),
  constraint pass_catalog_item_option_groups_selection_type_check check (
    selection_type in ('single', 'multiple')
  ),
  constraint pass_catalog_item_option_groups_min_select_check check (min_select >= 0),
  constraint pass_catalog_item_option_groups_max_select_check check (max_select >= 1),
  constraint pass_catalog_item_option_groups_select_range_check check (max_select >= min_select),
  constraint pass_catalog_item_option_groups_single_max_check check (
    selection_type <> 'single' or max_select = 1
  ),
  constraint pass_catalog_item_option_groups_required_min_check check (
    is_required = false or min_select >= 1
  ),
  constraint pass_catalog_item_option_groups_metadata_object check (
    jsonb_typeof(metadata) = 'object'
  )
);

comment on table pass.catalog_item_option_groups is
  'Grupos de opciones configurables por item comercial de Pass. Ej: leche, tamaño, acompañante, extras. Tabla canonica en schema pass.';

comment on column pass.catalog_item_option_groups.catalog_item_id is
  'Item comercial canonico en pass.catalog_items al que pertenece el grupo de opciones.';

comment on column pass.catalog_item_option_groups.selection_type is
  'single permite una opcion; multiple permite varias opciones dentro del grupo.';

comment on column pass.catalog_item_option_groups.is_required is
  'Si es true, Pass debe exigir al menos min_select opciones antes de agregar el producto.';

comment on column pass.catalog_item_option_groups.min_select is
  'Cantidad minima de opciones que debe seleccionar el cliente en este grupo.';

comment on column pass.catalog_item_option_groups.max_select is
  'Cantidad maxima de opciones seleccionables en este grupo. Para selection_type single debe ser 1.';

create index if not exists pass_catalog_item_option_groups_item_active_idx
  on pass.catalog_item_option_groups (catalog_item_id, is_active, sort_order);

drop trigger if exists pass_catalog_item_option_groups_set_updated_at on pass.catalog_item_option_groups;
create trigger pass_catalog_item_option_groups_set_updated_at
before update on pass.catalog_item_option_groups
for each row
execute function public._set_updated_at();

alter table pass.catalog_item_option_groups enable row level security;

grant select on table pass.catalog_item_option_groups to anon, authenticated;
grant insert, update, delete on table pass.catalog_item_option_groups to authenticated, service_role;

drop policy if exists pass_catalog_item_option_groups_select_public on pass.catalog_item_option_groups;
create policy pass_catalog_item_option_groups_select_public
on pass.catalog_item_option_groups
for select
to anon, authenticated
using (
  is_active = true
  and exists (
    select 1
    from pass.catalog_items item
    where item.id = catalog_item_option_groups.catalog_item_id
      and item.is_active = true
  )
);

drop policy if exists pass_catalog_item_option_groups_select_admin on pass.catalog_item_option_groups;
create policy pass_catalog_item_option_groups_select_admin
on pass.catalog_item_option_groups
for select
to authenticated
using (public.is_owner() or public.is_global_manager());

drop policy if exists pass_catalog_item_option_groups_insert_admin on pass.catalog_item_option_groups;
create policy pass_catalog_item_option_groups_insert_admin
on pass.catalog_item_option_groups
for insert
to authenticated
with check (public.is_owner() or public.is_global_manager());

drop policy if exists pass_catalog_item_option_groups_update_admin on pass.catalog_item_option_groups;
create policy pass_catalog_item_option_groups_update_admin
on pass.catalog_item_option_groups
for update
to authenticated
using (public.is_owner() or public.is_global_manager())
with check (public.is_owner() or public.is_global_manager());

drop policy if exists pass_catalog_item_option_groups_delete_admin on pass.catalog_item_option_groups;
create policy pass_catalog_item_option_groups_delete_admin
on pass.catalog_item_option_groups
for delete
to authenticated
using (public.is_owner() or public.is_global_manager());

create table if not exists pass.catalog_item_options (
  id uuid primary key default gen_random_uuid(),
  option_group_id uuid not null references pass.catalog_item_option_groups(id) on update cascade on delete cascade,
  code text not null,
  name text not null,
  description text,
  price_delta_amount numeric not null default 0,
  product_id uuid references public.products(id) on update cascade on delete set null,
  is_default boolean not null default false,
  is_active boolean not null default true,
  sort_order integer not null default 0,
  metadata jsonb not null default '{}'::jsonb,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now(),

  constraint pass_catalog_item_options_group_code_key unique (option_group_id, code),
  constraint pass_catalog_item_options_code_not_blank check (length(btrim(code)) > 0),
  constraint pass_catalog_item_options_name_not_blank check (length(btrim(name)) > 0),
  constraint pass_catalog_item_options_price_delta_check check (price_delta_amount >= 0),
  constraint pass_catalog_item_options_metadata_object check (
    jsonb_typeof(metadata) = 'object'
  )
);

comment on table pass.catalog_item_options is
  'Opciones seleccionables dentro de un grupo configurable de item comercial. Ej: leche de almendra, brownie, queso extra. Tabla canonica en schema pass.';

comment on column pass.catalog_item_options.product_id is
  'Producto operacional opcional para conectar la opcion con inventario/costos. Puede ser null para opciones puramente comerciales.';

comment on column pass.catalog_item_options.price_delta_amount is
  'Valor adicional COP que suma esta opcion al precio base del item comercial. MVP no permite valores negativos.';

create index if not exists pass_catalog_item_options_group_active_idx
  on pass.catalog_item_options (option_group_id, is_active, sort_order);

create index if not exists pass_catalog_item_options_product_idx
  on pass.catalog_item_options (product_id)
  where product_id is not null;

drop trigger if exists pass_catalog_item_options_set_updated_at on pass.catalog_item_options;
create trigger pass_catalog_item_options_set_updated_at
before update on pass.catalog_item_options
for each row
execute function public._set_updated_at();

alter table pass.catalog_item_options enable row level security;

grant select on table pass.catalog_item_options to anon, authenticated;
grant insert, update, delete on table pass.catalog_item_options to authenticated, service_role;

drop policy if exists pass_catalog_item_options_select_public on pass.catalog_item_options;
create policy pass_catalog_item_options_select_public
on pass.catalog_item_options
for select
to anon, authenticated
using (
  is_active = true
  and exists (
    select 1
    from pass.catalog_item_option_groups option_group
    join pass.catalog_items item
      on item.id = option_group.catalog_item_id
    where option_group.id = catalog_item_options.option_group_id
      and option_group.is_active = true
      and item.is_active = true
  )
);

drop policy if exists pass_catalog_item_options_select_admin on pass.catalog_item_options;
create policy pass_catalog_item_options_select_admin
on pass.catalog_item_options
for select
to authenticated
using (public.is_owner() or public.is_global_manager());

drop policy if exists pass_catalog_item_options_insert_admin on pass.catalog_item_options;
create policy pass_catalog_item_options_insert_admin
on pass.catalog_item_options
for insert
to authenticated
with check (public.is_owner() or public.is_global_manager());

drop policy if exists pass_catalog_item_options_update_admin on pass.catalog_item_options;
create policy pass_catalog_item_options_update_admin
on pass.catalog_item_options
for update
to authenticated
using (public.is_owner() or public.is_global_manager())
with check (public.is_owner() or public.is_global_manager());

drop policy if exists pass_catalog_item_options_delete_admin on pass.catalog_item_options;
create policy pass_catalog_item_options_delete_admin
on pass.catalog_item_options
for delete
to authenticated
using (public.is_owner() or public.is_global_manager());

create table if not exists public.order_item_options (
  id uuid primary key default gen_random_uuid(),
  order_item_id uuid not null references public.order_items(id) on update cascade on delete cascade,
  option_group_id uuid references pass.catalog_item_option_groups(id) on update cascade on delete set null,
  option_id uuid references pass.catalog_item_options(id) on update cascade on delete set null,
  group_code text,
  group_name text not null,
  option_code text,
  option_name text not null,
  quantity numeric not null default 1,
  price_delta_amount numeric not null default 0,
  total_delta_amount numeric not null default 0,
  metadata jsonb not null default '{}'::jsonb,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now(),

  constraint order_item_options_group_name_not_blank check (length(btrim(group_name)) > 0),
  constraint order_item_options_option_name_not_blank check (length(btrim(option_name)) > 0),
  constraint order_item_options_quantity_check check (quantity > 0),
  constraint order_item_options_price_delta_check check (price_delta_amount >= 0),
  constraint order_item_options_total_delta_check check (total_delta_amount >= 0),
  constraint order_item_options_metadata_object check (
    jsonb_typeof(metadata) = 'object'
  )
);

comment on table public.order_item_options is
  'Snapshot de opciones seleccionadas por linea de pedido. Vive en public porque pertenece al pedido operativo, no a la configuracion comercial canonica.';

comment on column public.order_item_options.option_group_id is
  'Referencia opcional al grupo configurado en pass. Se conserva null si la configuracion se elimina despues del pedido.';

comment on column public.order_item_options.option_id is
  'Referencia opcional a la opcion configurada en pass. Se conserva null si la opcion se elimina despues del pedido.';

comment on column public.order_item_options.group_name is
  'Snapshot del nombre del grupo al momento de comprar.';

comment on column public.order_item_options.option_name is
  'Snapshot del nombre de la opcion al momento de comprar.';

comment on column public.order_item_options.price_delta_amount is
  'Precio adicional unitario de la opcion al momento de comprar.';

comment on column public.order_item_options.total_delta_amount is
  'Precio adicional total de esta opcion para la linea del pedido.';

create index if not exists order_item_options_order_item_idx
  on public.order_item_options (order_item_id);

create index if not exists order_item_options_option_group_idx
  on public.order_item_options (option_group_id)
  where option_group_id is not null;

create index if not exists order_item_options_option_idx
  on public.order_item_options (option_id)
  where option_id is not null;

drop trigger if exists order_item_options_set_updated_at on public.order_item_options;
create trigger order_item_options_set_updated_at
before update on public.order_item_options
for each row
execute function public._set_updated_at();

alter table public.order_item_options enable row level security;

grant all on table public.order_item_options to authenticated;
grant all on table public.order_item_options to service_role;

drop policy if exists order_item_options_select_client on public.order_item_options;
create policy order_item_options_select_client
on public.order_item_options
for select
to authenticated
using (
  exists (
    select 1
    from public.order_items item
    join public.orders order_header
      on order_header.id = item.order_id
    where item.id = order_item_options.order_item_id
      and order_header.client_id = auth.uid()
  )
);

drop policy if exists order_item_options_select_staff on public.order_item_options;
create policy order_item_options_select_staff
on public.order_item_options
for select
to authenticated
using (
  exists (
    select 1
    from public.order_items item
    join public.orders order_header
      on order_header.id = item.order_id
    where item.id = order_item_options.order_item_id
      and public.is_employee()
      and public.can_access_site(order_header.site_id)
  )
);

drop policy if exists order_item_options_insert_client on public.order_item_options;
create policy order_item_options_insert_client
on public.order_item_options
for insert
to authenticated
with check (
  exists (
    select 1
    from public.order_items item
    join public.orders order_header
      on order_header.id = item.order_id
    where item.id = order_item_options.order_item_id
      and order_header.client_id = auth.uid()
  )
);

drop policy if exists order_item_options_insert_staff on public.order_item_options;
create policy order_item_options_insert_staff
on public.order_item_options
for insert
to authenticated
with check (
  exists (
    select 1
    from public.order_items item
    join public.orders order_header
      on order_header.id = item.order_id
    where item.id = order_item_options.order_item_id
      and public.is_employee()
      and public.can_access_site(order_header.site_id)
  )
);

drop policy if exists order_item_options_update_staff on public.order_item_options;
create policy order_item_options_update_staff
on public.order_item_options
for update
to authenticated
using (
  exists (
    select 1
    from public.order_items item
    join public.orders order_header
      on order_header.id = item.order_id
    where item.id = order_item_options.order_item_id
      and public.is_employee()
      and public.can_access_site(order_header.site_id)
  )
)
with check (
  exists (
    select 1
    from public.order_items item
    join public.orders order_header
      on order_header.id = item.order_id
    where item.id = order_item_options.order_item_id
      and public.is_employee()
      and public.can_access_site(order_header.site_id)
  )
);

drop policy if exists order_item_options_delete_owner on public.order_item_options;
create policy order_item_options_delete_owner
on public.order_item_options
for delete
to authenticated
using (public.is_owner() or public.is_global_manager());

create or replace view public.catalog_item_option_groups
with (security_invoker = true)
as
select
  id,
  catalog_item_id,
  code,
  name,
  description,
  selection_type,
  is_required,
  min_select,
  max_select,
  sort_order,
  is_active,
  metadata,
  created_at,
  updated_at
from pass.catalog_item_option_groups;

comment on view public.catalog_item_option_groups is
  'Compat view publica para grupos de opciones de items comerciales. Canonical table lives in pass.catalog_item_option_groups.';

grant select on public.catalog_item_option_groups to anon, authenticated;
grant insert, update, delete on public.catalog_item_option_groups to authenticated, service_role;

create or replace view public.catalog_item_options
with (security_invoker = true)
as
select
  id,
  option_group_id,
  code,
  name,
  description,
  price_delta_amount,
  product_id,
  is_default,
  is_active,
  sort_order,
  metadata,
  created_at,
  updated_at
from pass.catalog_item_options;

comment on view public.catalog_item_options is
  'Compat view publica para opciones de items comerciales. Canonical table lives in pass.catalog_item_options.';

grant select on public.catalog_item_options to anon, authenticated;
grant insert, update, delete on public.catalog_item_options to authenticated, service_role;

notify pgrst, 'reload schema';

commit;
