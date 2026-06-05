begin;

alter table pass.catalog_item_option_groups
  add column if not exists display_type text not null default 'radio';

alter table pass.catalog_item_option_groups
  drop constraint if exists pass_catalog_item_option_groups_display_type_check;

alter table pass.catalog_item_option_groups
  add constraint pass_catalog_item_option_groups_display_type_check check (
    display_type in ('radio', 'checkbox', 'plus', 'upsell')
  );

comment on column pass.catalog_item_option_groups.display_type is
  'Presentacion visual sugerida en Pass: radio para seleccion unica, checkbox para multiple, plus para adiciones rapidas y upsell para productos recomendados vinculables.';

alter table pass.catalog_item_option_groups
  add column if not exists is_collapsible boolean not null default true;

comment on column pass.catalog_item_option_groups.is_collapsible is
  'Permite que el grupo se pueda contraer/expandir en el modal de Pass.';

alter table pass.catalog_item_option_groups
  add column if not exists default_collapsed boolean not null default false;

comment on column pass.catalog_item_option_groups.default_collapsed is
  'Si es true, el grupo aparece contraido por defecto en el modal de Pass.';

alter table pass.catalog_item_option_groups
  add column if not exists helper_text text;

comment on column pass.catalog_item_option_groups.helper_text is
  'Texto de ayuda corto para el modal. Si es null, Pass puede construirlo desde minimo/maximo/obligatorio.';

alter table pass.catalog_item_options
  add column if not exists image_url text;

comment on column pass.catalog_item_options.image_url is
  'Imagen opcional de la opcion para experiencias tipo Rappi: bebidas, salsas, acompanamientos o upsells.';

alter table pass.catalog_item_options
  add column if not exists linked_catalog_item_id uuid references pass.catalog_items(id) on update cascade on delete set null;

comment on column pass.catalog_item_options.linked_catalog_item_id is
  'Item comercial vinculado para opciones tipo upsell/recomendado. Permite mostrar un producto real dentro del modal y, en Pass, agregarlo como linea separada o abrir su detalle.';

alter table pass.catalog_item_options
  add column if not exists linked_quantity numeric not null default 1;

alter table pass.catalog_item_options
  drop constraint if exists pass_catalog_item_options_linked_quantity_check;

alter table pass.catalog_item_options
  add constraint pass_catalog_item_options_linked_quantity_check check (
    linked_quantity > 0
  );

comment on column pass.catalog_item_options.linked_quantity is
  'Cantidad sugerida del item vinculado cuando la opcion funciona como upsell.';

alter table pass.catalog_item_options
  add column if not exists opens_linked_detail boolean not null default false;

comment on column pass.catalog_item_options.opens_linked_detail is
  'Si es true, Pass puede mostrar flecha/detalle del item vinculado antes de agregar el upsell.';

alter table pass.catalog_item_presentation
  add column if not exists allow_customer_note boolean not null default false;

comment on column pass.catalog_item_presentation.allow_customer_note is
  'Permite nota especial por linea de producto en el modal de Pass. Ej: sin azucar, poca salsa, instrucciones de preparacion.';

alter table pass.catalog_item_presentation
  add column if not exists note_placeholder text;

comment on column pass.catalog_item_presentation.note_placeholder is
  'Placeholder sugerido para la nota especial por linea del producto en Pass.';

create index if not exists pass_catalog_item_option_groups_display_idx
  on pass.catalog_item_option_groups (catalog_item_id, display_type, is_active, sort_order);

create index if not exists pass_catalog_item_options_linked_catalog_item_idx
  on pass.catalog_item_options (linked_catalog_item_id)
  where linked_catalog_item_id is not null;

create or replace function pass.validate_catalog_item_option_rappi_level()
returns trigger
language plpgsql
security definer
set search_path = pass, public
as $$
declare
  v_option_site_id uuid;
  v_linked_site_id uuid;
begin
  if new.linked_catalog_item_id is null then
    return new;
  end if;

  select item.site_id
    into v_option_site_id
  from pass.catalog_item_option_groups option_group
  join pass.catalog_items item
    on item.id = option_group.catalog_item_id
  where option_group.id = new.option_group_id;

  select linked_item.site_id
    into v_linked_site_id
  from pass.catalog_items linked_item
  where linked_item.id = new.linked_catalog_item_id
    and linked_item.is_active = true;

  if v_linked_site_id is null then
    raise exception 'linked_catalog_item_id not found or inactive';
  end if;

  if v_option_site_id is null or v_linked_site_id <> v_option_site_id then
    raise exception 'linked_catalog_item_id must belong to same site as option catalog item';
  end if;

  return new;
end;
$$;

drop trigger if exists pass_catalog_item_options_validate_rappi_level on pass.catalog_item_options;
create trigger pass_catalog_item_options_validate_rappi_level
before insert or update on pass.catalog_item_options
for each row
execute function pass.validate_catalog_item_option_rappi_level();

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
  updated_at,
  display_type,
  is_collapsible,
  default_collapsed,
  helper_text
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
  updated_at,
  effect_type,
  image_url,
  linked_catalog_item_id,
  linked_quantity,
  opens_linked_detail
from pass.catalog_item_options;

comment on view public.catalog_item_options is
  'Compat view publica para opciones de items comerciales. Canonical table lives in pass.catalog_item_options.';

grant select on public.catalog_item_options to anon, authenticated;
grant insert, update, delete on public.catalog_item_options to authenticated, service_role;

notify pgrst, 'reload schema';

commit;
