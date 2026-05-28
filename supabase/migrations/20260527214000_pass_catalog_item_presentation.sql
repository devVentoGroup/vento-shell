begin;

create table if not exists pass.catalog_item_presentation (
  id uuid primary key default gen_random_uuid(),
  catalog_item_id uuid not null references pass.catalog_items(id) on delete cascade,
  surface text not null default 'vento_pass_menu',
  card_layout text not null default 'compact',
  opens_detail_modal boolean not null default false,
  is_highlighted boolean not null default false,
  sort_weight integer not null default 0,
  metadata jsonb not null default '{}'::jsonb,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now(),

  constraint pass_catalog_item_presentation_item_surface_key unique (catalog_item_id, surface),
  constraint pass_catalog_item_presentation_surface_check check (
    surface in ('vento_pass_menu')
  ),
  constraint pass_catalog_item_presentation_card_layout_check check (
    card_layout in ('compact', 'featured')
  ),
  constraint pass_catalog_item_presentation_metadata_object check (
    jsonb_typeof(metadata) = 'object'
  )
);

comment on table pass.catalog_item_presentation is
  'Configuracion visual por item comercial y superficie. Controla como se presenta un producto en Pass sin mezclarlo con metadata tecnica del catalogo.';

comment on column pass.catalog_item_presentation.catalog_item_id is
  'Item comercial canonico en pass.catalog_items.';

comment on column pass.catalog_item_presentation.surface is
  'Superficie donde aplica esta configuracion visual. MVP: vento_pass_menu.';

comment on column pass.catalog_item_presentation.card_layout is
  'Layout visual del producto en Pass: compact para grilla vertical, featured para card horizontal destacada.';

comment on column pass.catalog_item_presentation.opens_detail_modal is
  'Indica si el producto debe abrir modal de detalle antes de agregarse al pedido.';

comment on column pass.catalog_item_presentation.is_highlighted is
  'Marcador comercial para dar mayor prioridad visual futura.';

comment on column pass.catalog_item_presentation.sort_weight is
  'Peso visual adicional para ordenar o priorizar layouts dentro de una misma seccion.';

create index if not exists pass_catalog_item_presentation_item_idx
  on pass.catalog_item_presentation (catalog_item_id);

create index if not exists pass_catalog_item_presentation_surface_layout_idx
  on pass.catalog_item_presentation (surface, card_layout, sort_weight);

drop trigger if exists pass_catalog_item_presentation_set_updated_at on pass.catalog_item_presentation;
create trigger pass_catalog_item_presentation_set_updated_at
before update on pass.catalog_item_presentation
for each row
execute function public._set_updated_at();

alter table pass.catalog_item_presentation enable row level security;

grant select on table pass.catalog_item_presentation to anon, authenticated;
grant insert, update, delete on table pass.catalog_item_presentation to authenticated, service_role;

drop policy if exists pass_catalog_item_presentation_select_public on pass.catalog_item_presentation;
create policy pass_catalog_item_presentation_select_public
on pass.catalog_item_presentation
for select
using (
  exists (
    select 1
    from pass.catalog_items item
    where item.id = catalog_item_presentation.catalog_item_id
      and item.is_active = true
  )
);

drop policy if exists pass_catalog_item_presentation_select_admin on pass.catalog_item_presentation;
create policy pass_catalog_item_presentation_select_admin
on pass.catalog_item_presentation
for select
to authenticated
using (public.is_owner() or public.is_global_manager());

drop policy if exists pass_catalog_item_presentation_insert_admin on pass.catalog_item_presentation;
create policy pass_catalog_item_presentation_insert_admin
on pass.catalog_item_presentation
for insert
to authenticated
with check (public.is_owner() or public.is_global_manager());

drop policy if exists pass_catalog_item_presentation_update_admin on pass.catalog_item_presentation;
create policy pass_catalog_item_presentation_update_admin
on pass.catalog_item_presentation
for update
to authenticated
using (public.is_owner() or public.is_global_manager())
with check (public.is_owner() or public.is_global_manager());

drop policy if exists pass_catalog_item_presentation_delete_admin on pass.catalog_item_presentation;
create policy pass_catalog_item_presentation_delete_admin
on pass.catalog_item_presentation
for delete
to authenticated
using (public.is_owner() or public.is_global_manager());

insert into pass.catalog_item_presentation (
  catalog_item_id,
  surface,
  card_layout,
  opens_detail_modal,
  is_highlighted,
  sort_weight,
  metadata
)
select
  item.id,
  'vento_pass_menu',
  case
    when item.is_featured then 'featured'
    else 'compact'
  end,
  false,
  item.is_featured,
  0,
  '{}'::jsonb
from pass.catalog_items item
where item.is_active = true
  and item.metadata->>'source_app' = 'viso'
  and item.metadata->>'source_module' = 'menu_comercial'
on conflict (catalog_item_id, surface) do nothing;

create or replace view public.catalog_item_presentation
with (security_invoker = true)
as
select * from pass.catalog_item_presentation;

comment on view public.catalog_item_presentation is
  'Compat view publica para configuracion visual de items comerciales. Canonical table lives in pass.catalog_item_presentation.';

grant select on public.catalog_item_presentation to anon, authenticated;
grant insert, update, delete on public.catalog_item_presentation to authenticated, service_role;

notify pgrst, 'reload schema';

commit;
