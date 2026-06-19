begin;

create table if not exists pass.catalog_item_customization_templates (
  id uuid primary key default gen_random_uuid(),
  site_id uuid not null references public.sites(id) on delete cascade,
  code text not null,
  name text not null,
  description text,
  is_active boolean not null default true,
  metadata jsonb not null default '{}'::jsonb,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now(),

  constraint pass_catalog_item_customization_templates_site_code_key unique (site_id, code),
  constraint pass_catalog_item_customization_templates_code_not_blank check (length(btrim(code)) > 0),
  constraint pass_catalog_item_customization_templates_name_not_blank check (length(btrim(name)) > 0),
  constraint pass_catalog_item_customization_templates_metadata_object check (jsonb_typeof(metadata) = 'object')
);

comment on table pass.catalog_item_customization_templates is
  'Plantillas compartidas de personalizacion para items comerciales de Pass. Permiten que variantes de un grupo comercial usen los mismos grupos de opciones sin duplicarlos.';

create index if not exists pass_catalog_item_customization_templates_site_active_idx
  on pass.catalog_item_customization_templates (site_id, is_active, code);

drop trigger if exists pass_catalog_item_customization_templates_set_updated_at on pass.catalog_item_customization_templates;
create trigger pass_catalog_item_customization_templates_set_updated_at
before update on pass.catalog_item_customization_templates
for each row
execute function public._set_updated_at();

alter table pass.catalog_item_customization_templates enable row level security;

grant select on table pass.catalog_item_customization_templates to anon, authenticated;
grant insert, update, delete on table pass.catalog_item_customization_templates to authenticated, service_role;

drop policy if exists pass_catalog_item_customization_templates_select_public on pass.catalog_item_customization_templates;
create policy pass_catalog_item_customization_templates_select_public
on pass.catalog_item_customization_templates
for select
to anon, authenticated
using (is_active = true);

drop policy if exists pass_catalog_item_customization_templates_select_admin on pass.catalog_item_customization_templates;
create policy pass_catalog_item_customization_templates_select_admin
on pass.catalog_item_customization_templates
for select
to authenticated
using (public.is_owner() or public.is_global_manager());

drop policy if exists pass_catalog_item_customization_templates_insert_admin on pass.catalog_item_customization_templates;
create policy pass_catalog_item_customization_templates_insert_admin
on pass.catalog_item_customization_templates
for insert
to authenticated
with check (public.is_owner() or public.is_global_manager());

drop policy if exists pass_catalog_item_customization_templates_update_admin on pass.catalog_item_customization_templates;
create policy pass_catalog_item_customization_templates_update_admin
on pass.catalog_item_customization_templates
for update
to authenticated
using (public.is_owner() or public.is_global_manager())
with check (public.is_owner() or public.is_global_manager());

drop policy if exists pass_catalog_item_customization_templates_delete_admin on pass.catalog_item_customization_templates;
create policy pass_catalog_item_customization_templates_delete_admin
on pass.catalog_item_customization_templates
for delete
to authenticated
using (public.is_owner() or public.is_global_manager());

create table if not exists pass.catalog_item_customization_template_groups (
  template_id uuid not null references pass.catalog_item_customization_templates(id) on update cascade on delete cascade,
  option_group_id uuid not null references pass.catalog_item_option_groups(id) on update cascade on delete cascade,
  sort_order integer not null default 0,
  is_active boolean not null default true,
  metadata jsonb not null default '{}'::jsonb,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now(),
  primary key (template_id, option_group_id),

  constraint pass_catalog_item_customization_template_groups_metadata_object check (jsonb_typeof(metadata) = 'object')
);

comment on table pass.catalog_item_customization_template_groups is
  'Grupos de opciones incluidos en una plantilla compartida. El grupo conserva sus opciones, reglas de consumo y efectos de receta originales.';

create index if not exists pass_catalog_item_customization_template_groups_group_idx
  on pass.catalog_item_customization_template_groups (option_group_id, is_active);

drop trigger if exists pass_catalog_item_customization_template_groups_set_updated_at on pass.catalog_item_customization_template_groups;
create trigger pass_catalog_item_customization_template_groups_set_updated_at
before update on pass.catalog_item_customization_template_groups
for each row
execute function public._set_updated_at();

alter table pass.catalog_item_customization_template_groups enable row level security;

grant select on table pass.catalog_item_customization_template_groups to anon, authenticated;
grant insert, update, delete on table pass.catalog_item_customization_template_groups to authenticated, service_role;

drop policy if exists pass_catalog_item_customization_template_groups_select_public on pass.catalog_item_customization_template_groups;
create policy pass_catalog_item_customization_template_groups_select_public
on pass.catalog_item_customization_template_groups
for select
to anon, authenticated
using (
  is_active = true
  and exists (
    select 1
    from pass.catalog_item_customization_templates template
    where template.id = catalog_item_customization_template_groups.template_id
      and template.is_active = true
  )
  and exists (
    select 1
    from pass.catalog_item_option_groups option_group
    join pass.catalog_items item
      on item.id = option_group.catalog_item_id
    where option_group.id = catalog_item_customization_template_groups.option_group_id
      and option_group.is_active = true
      and item.is_active = true
  )
);

drop policy if exists pass_catalog_item_customization_template_groups_select_admin on pass.catalog_item_customization_template_groups;
create policy pass_catalog_item_customization_template_groups_select_admin
on pass.catalog_item_customization_template_groups
for select
to authenticated
using (public.is_owner() or public.is_global_manager());

drop policy if exists pass_catalog_item_customization_template_groups_insert_admin on pass.catalog_item_customization_template_groups;
create policy pass_catalog_item_customization_template_groups_insert_admin
on pass.catalog_item_customization_template_groups
for insert
to authenticated
with check (public.is_owner() or public.is_global_manager());

drop policy if exists pass_catalog_item_customization_template_groups_update_admin on pass.catalog_item_customization_template_groups;
create policy pass_catalog_item_customization_template_groups_update_admin
on pass.catalog_item_customization_template_groups
for update
to authenticated
using (public.is_owner() or public.is_global_manager())
with check (public.is_owner() or public.is_global_manager());

drop policy if exists pass_catalog_item_customization_template_groups_delete_admin on pass.catalog_item_customization_template_groups;
create policy pass_catalog_item_customization_template_groups_delete_admin
on pass.catalog_item_customization_template_groups
for delete
to authenticated
using (public.is_owner() or public.is_global_manager());

create table if not exists pass.catalog_item_customization_template_assignments (
  catalog_item_id uuid not null references pass.catalog_items(id) on update cascade on delete cascade,
  template_id uuid not null references pass.catalog_item_customization_templates(id) on update cascade on delete cascade,
  sort_order integer not null default 0,
  is_active boolean not null default true,
  metadata jsonb not null default '{}'::jsonb,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now(),
  primary key (catalog_item_id, template_id),

  constraint pass_catalog_item_customization_template_assignments_metadata_object check (jsonb_typeof(metadata) = 'object')
);

comment on table pass.catalog_item_customization_template_assignments is
  'Asignacion explicita de plantillas compartidas a variantes/items comerciales. El item conserva su catalog_item_id real para carrito y checkout.';

create index if not exists pass_catalog_item_customization_template_assignments_template_idx
  on pass.catalog_item_customization_template_assignments (template_id, is_active);

drop trigger if exists pass_catalog_item_customization_template_assignments_set_updated_at on pass.catalog_item_customization_template_assignments;
create trigger pass_catalog_item_customization_template_assignments_set_updated_at
before update on pass.catalog_item_customization_template_assignments
for each row
execute function public._set_updated_at();

alter table pass.catalog_item_customization_template_assignments enable row level security;

grant select on table pass.catalog_item_customization_template_assignments to anon, authenticated;
grant insert, update, delete on table pass.catalog_item_customization_template_assignments to authenticated, service_role;

drop policy if exists pass_catalog_item_customization_template_assignments_select_public on pass.catalog_item_customization_template_assignments;
create policy pass_catalog_item_customization_template_assignments_select_public
on pass.catalog_item_customization_template_assignments
for select
to anon, authenticated
using (
  is_active = true
  and exists (
    select 1
    from pass.catalog_items item
    where item.id = catalog_item_customization_template_assignments.catalog_item_id
      and item.is_active = true
  )
  and exists (
    select 1
    from pass.catalog_item_customization_templates template
    where template.id = catalog_item_customization_template_assignments.template_id
      and template.is_active = true
  )
);

drop policy if exists pass_catalog_item_customization_template_assignments_select_admin on pass.catalog_item_customization_template_assignments;
create policy pass_catalog_item_customization_template_assignments_select_admin
on pass.catalog_item_customization_template_assignments
for select
to authenticated
using (public.is_owner() or public.is_global_manager());

drop policy if exists pass_catalog_item_customization_template_assignments_insert_admin on pass.catalog_item_customization_template_assignments;
create policy pass_catalog_item_customization_template_assignments_insert_admin
on pass.catalog_item_customization_template_assignments
for insert
to authenticated
with check (public.is_owner() or public.is_global_manager());

drop policy if exists pass_catalog_item_customization_template_assignments_update_admin on pass.catalog_item_customization_template_assignments;
create policy pass_catalog_item_customization_template_assignments_update_admin
on pass.catalog_item_customization_template_assignments
for update
to authenticated
using (public.is_owner() or public.is_global_manager())
with check (public.is_owner() or public.is_global_manager());

drop policy if exists pass_catalog_item_customization_template_assignments_delete_admin on pass.catalog_item_customization_template_assignments;
create policy pass_catalog_item_customization_template_assignments_delete_admin
on pass.catalog_item_customization_template_assignments
for delete
to authenticated
using (public.is_owner() or public.is_global_manager());

create or replace function pass.catalog_item_option_group_is_allowed(
  p_catalog_item_id uuid,
  p_option_group_id uuid
)
returns boolean
language sql
stable
security definer
set search_path = pass, public
as $$
  select exists (
    select 1
    from pass.catalog_item_option_groups option_group
    where option_group.id = p_option_group_id
      and option_group.catalog_item_id = p_catalog_item_id
      and option_group.is_active = true
  )
  or exists (
    select 1
    from pass.catalog_item_customization_template_assignments assignment
    join pass.catalog_item_customization_templates template
      on template.id = assignment.template_id
     and template.is_active = true
    join pass.catalog_item_customization_template_groups template_group
      on template_group.template_id = template.id
     and template_group.option_group_id = p_option_group_id
     and template_group.is_active = true
    join pass.catalog_item_option_groups option_group
      on option_group.id = template_group.option_group_id
     and option_group.is_active = true
    join pass.catalog_items item
      on item.id = assignment.catalog_item_id
     and item.is_active = true
    join pass.catalog_items owner_item
      on owner_item.id = option_group.catalog_item_id
     and owner_item.is_active = true
     and owner_item.site_id = item.site_id
    where assignment.catalog_item_id = p_catalog_item_id
      and assignment.is_active = true
  );
$$;

grant execute on function pass.catalog_item_option_group_is_allowed(uuid, uuid) to anon, authenticated, service_role;

create or replace function pass.catalog_item_allowed_option_groups(p_catalog_item_id uuid)
returns table (
  id uuid,
  catalog_item_id uuid,
  code text,
  name text,
  description text,
  selection_type text,
  is_required boolean,
  min_select integer,
  max_select integer,
  sort_order integer,
  is_active boolean,
  metadata jsonb
)
language sql
stable
security definer
set search_path = pass, public
as $$
  with own_groups as (
    select
      option_group.id,
      option_group.catalog_item_id,
      option_group.code,
      option_group.name,
      option_group.description,
      option_group.selection_type,
      option_group.is_required,
      option_group.min_select,
      option_group.max_select,
      option_group.sort_order,
      option_group.is_active,
      option_group.metadata,
      0 as template_sort_order
    from pass.catalog_item_option_groups option_group
    where option_group.catalog_item_id = p_catalog_item_id
      and option_group.is_active = true
  ),
  template_groups as (
    select
      option_group.id,
      option_group.catalog_item_id,
      option_group.code,
      option_group.name,
      option_group.description,
      option_group.selection_type,
      option_group.is_required,
      option_group.min_select,
      option_group.max_select,
      option_group.sort_order,
      option_group.is_active,
      option_group.metadata,
      assignment.sort_order + template_group.sort_order as template_sort_order
    from pass.catalog_item_customization_template_assignments assignment
    join pass.catalog_item_customization_templates template
      on template.id = assignment.template_id
     and template.is_active = true
    join pass.catalog_item_customization_template_groups template_group
      on template_group.template_id = template.id
     and template_group.is_active = true
    join pass.catalog_item_option_groups option_group
      on option_group.id = template_group.option_group_id
     and option_group.is_active = true
    join pass.catalog_items item
      on item.id = assignment.catalog_item_id
     and item.is_active = true
    join pass.catalog_items owner_item
      on owner_item.id = option_group.catalog_item_id
     and owner_item.is_active = true
     and owner_item.site_id = item.site_id
    where assignment.catalog_item_id = p_catalog_item_id
      and assignment.is_active = true
      and not exists (
        select 1
        from pass.catalog_item_option_groups own_group
        where own_group.catalog_item_id = p_catalog_item_id
          and own_group.code = option_group.code
          and own_group.is_active = true
      )
  )
  select distinct on (merged.id)
    merged.id,
    merged.catalog_item_id,
    merged.code,
    merged.name,
    merged.description,
    merged.selection_type,
    merged.is_required,
    merged.min_select,
    merged.max_select,
    merged.sort_order,
    merged.is_active,
    merged.metadata
  from (
    select * from own_groups
    union all
    select * from template_groups
  ) merged
  order by merged.id, merged.template_sort_order, merged.sort_order, merged.name;
$$;

grant execute on function pass.catalog_item_allowed_option_groups(uuid) to anon, authenticated, service_role;

create or replace view public.catalog_item_customization_templates
with (security_invoker = true)
as
select
  id,
  site_id,
  code,
  name,
  description,
  is_active,
  metadata,
  created_at,
  updated_at
from pass.catalog_item_customization_templates;

grant select on public.catalog_item_customization_templates to anon, authenticated;
grant insert, update, delete on public.catalog_item_customization_templates to authenticated, service_role;

create or replace view public.catalog_item_customization_template_groups
with (security_invoker = true)
as
select
  template_id,
  option_group_id,
  sort_order,
  is_active,
  metadata,
  created_at,
  updated_at
from pass.catalog_item_customization_template_groups;

grant select on public.catalog_item_customization_template_groups to anon, authenticated;
grant insert, update, delete on public.catalog_item_customization_template_groups to authenticated, service_role;

create or replace view public.catalog_item_customization_template_assignments
with (security_invoker = true)
as
select
  catalog_item_id,
  template_id,
  sort_order,
  is_active,
  metadata,
  created_at,
  updated_at
from pass.catalog_item_customization_template_assignments;

grant select on public.catalog_item_customization_template_assignments to anon, authenticated;
grant insert, update, delete on public.catalog_item_customization_template_assignments to authenticated, service_role;

create or replace function public.create_order_checkout_draft(
  p_site_id uuid,
  p_satellite_name text,
  p_fulfillment_type text,
  p_contact_name text,
  p_contact_phone text,
  p_address_line text,
  p_address_reference text,
  p_notes text,
  p_items jsonb,
  p_delivery_fee_amount numeric default 0,
  p_source text default 'vento_pass',
  p_delivery_distance_km integer default null,
  p_delivery_quote_id uuid default null
)
returns jsonb
language plpgsql
security definer
set search_path = public, auth, pass
as $$
declare
  v_uid uuid := auth.uid();
  v_order_id uuid;
  v_order_item_id uuid;
  v_tx_id uuid;
  v_item jsonb;
  v_option jsonb;
  v_validated_items jsonb := '[]'::jsonb;
  v_selected_options jsonb := '[]'::jsonb;
  v_product_id uuid;
  v_catalog_item_id uuid;
  v_option_id uuid;
  v_quantity numeric;
  v_original_unit_price numeric;
  v_unit_price numeric;
  v_catalog_base_price numeric;
  v_option_delta numeric;
  v_subtotal numeric := 0;
  v_delivery numeric := 0;
  v_total numeric := 0;
  v_fulfillment text := lower(trim(coalesce(p_fulfillment_type, 'delivery')));
  v_order_type text := 'takeaway';
  v_delivery_address jsonb := '{}'::jsonb;
  v_delivery_zone text := null;
  v_quote pass.delivery_quotes%rowtype;
  v_idempotency_key text := gen_random_uuid()::text;
  v_payment_status text := 'pending_payment';
  v_payment_provider text := null;
  v_checkout_expires_at timestamptz := null;
  v_option_row record;
  v_group_rule record;
  v_selected_count integer;
  v_min_select integer;
  v_max_select integer;
  v_option_count integer;
  v_distinct_option_count integer;
  v_group_preset text;
  v_linked_catalog_item_id uuid;
  v_option_metadata jsonb;
  v_consumption_rules jsonb;
  v_recipe_effects jsonb;
  v_canonical_selected_options jsonb := '[]'::jsonb;
begin
  if v_uid is null then
    raise exception 'authentication_required';
  end if;

  if p_site_id is null then
    raise exception 'site_required';
  end if;

  if jsonb_typeof(p_items) <> 'array' or jsonb_array_length(p_items) = 0 then
    raise exception 'items_required';
  end if;

  if v_fulfillment not in ('delivery', 'pickup', 'on_premise') then
    raise exception 'invalid_fulfillment_type';
  end if;

  if v_fulfillment = 'on_premise' then
    v_order_type := 'dine_in';
  end if;

  if v_fulfillment = 'delivery' then
    v_payment_status := 'pending_payment';
    v_payment_provider := 'wompi';
    v_checkout_expires_at := now() + interval '20 minutes';

    if p_delivery_quote_id is null then
      raise exception 'delivery_quote_required';
    end if;

    select *
    into v_quote
    from pass.delivery_quotes
    where id = p_delivery_quote_id
      and user_id = v_uid
      and site_id = p_site_id
      and used_at is null
      and expires_at > now()
    for update;

    if v_quote.id is null then
      raise exception 'delivery_quote_invalid_or_expired';
    end if;

    v_delivery := v_quote.customer_fee_amount;
    v_delivery_zone := v_quote.billed_distance_km::text || ' km';
    v_delivery_address := jsonb_build_object(
      'line1', nullif(trim(coalesce(p_address_line, v_quote.destination_address, '')), ''),
      'reference', nullif(trim(coalesce(p_address_reference, '')), ''),
      'label', nullif(trim(coalesce(v_quote.destination_label, '')), ''),
      'latitude', v_quote.destination_latitude,
      'longitude', v_quote.destination_longitude,
      'distance_meters', v_quote.distance_meters,
      'distance_km', v_quote.distance_km,
      'billed_distance_km', v_quote.billed_distance_km,
      'duration_seconds', v_quote.duration_seconds,
      'delivery_quote_id', v_quote.id
    );

    if coalesce(v_delivery_address ->> 'line1', '') = '' then
      raise exception 'delivery_address_required';
    end if;
  else
    v_payment_status := 'not_required';
    v_payment_provider := null;
    v_checkout_expires_at := null;
    v_delivery := 0;
    v_delivery_zone := null;
    v_delivery_address := '{}'::jsonb;
  end if;

  for v_item in select * from jsonb_array_elements(p_items)
  loop
    v_product_id := nullif(v_item ->> 'product_id', '')::uuid;
    v_catalog_item_id := nullif(v_item ->> 'catalog_item_id', '')::uuid;
    v_quantity := greatest(coalesce((v_item ->> 'quantity')::numeric, 0), 0);
    v_original_unit_price := greatest(coalesce((v_item ->> 'unit_price')::numeric, 0), 0);
    v_unit_price := v_original_unit_price;
    v_catalog_base_price := null;
    v_option_delta := 0;

    if v_item ? 'selected_options' then
      if jsonb_typeof(v_item -> 'selected_options') <> 'array' then
        raise exception 'invalid_selected_options';
      end if;

      v_selected_options := coalesce(v_item -> 'selected_options', '[]'::jsonb);
    else
      v_selected_options := '[]'::jsonb;
    end if;

    v_canonical_selected_options := '[]'::jsonb;

    if v_product_id is null then
      raise exception 'item_product_required';
    end if;

    if v_quantity <= 0 then
      raise exception 'invalid_item_quantity';
    end if;

    if v_original_unit_price < 0 then
      raise exception 'invalid_item_price';
    end if;

    if v_catalog_item_id is null and jsonb_array_length(v_selected_options) > 0 then
      raise exception 'catalog_item_required_for_selected_options';
    end if;

    if v_catalog_item_id is not null then
      select item.price_amount
      into v_catalog_base_price
      from pass.catalog_items item
      where item.id = v_catalog_item_id
        and item.site_id = p_site_id
        and item.product_id = v_product_id
        and item.is_active = true;

      if not found then
        raise exception 'catalog_item_invalid';
      end if;

      select count(*), count(distinct selected.value ->> 'option_id')
      into v_option_count, v_distinct_option_count
      from jsonb_array_elements(v_selected_options) selected;

      if coalesce(v_option_count, 0) <> coalesce(v_distinct_option_count, 0) then
        raise exception 'duplicate_selected_options';
      end if;

      v_canonical_selected_options := '[]'::jsonb;

      for v_option in select * from jsonb_array_elements(v_selected_options)
      loop
        v_option_id := nullif(v_option ->> 'option_id', '')::uuid;

        if v_option_id is null then
          raise exception 'selected_option_required';
        end if;

        select
          opt_group.id as group_id,
          opt_group.code as group_code,
          opt_group.name as group_name,
          opt_group.selection_type,
          opt_group.metadata as group_metadata,
          case
            when lower(coalesce(opt_group.metadata ->> 'preset', '')) in (
              'choice',
              'extras',
              'replacements',
              'replacement',
              'removals',
              'preferences',
              'recommendations'
            )
              then case
                when lower(coalesce(opt_group.metadata ->> 'preset', '')) = 'replacement'
                  then 'replacements'
                else lower(coalesce(opt_group.metadata ->> 'preset', ''))
              end
            when lower(coalesce(opt_group.code, '')) like '%recomend%'
              or lower(coalesce(opt_group.name, '')) like '%recomend%'
              or lower(coalesce(opt_group.name, '')) like '%suger%'
              then 'recommendations'
            when lower(coalesce(opt_group.code, '')) like '%reemplaz%'
              or lower(coalesce(opt_group.code, '')) like '%cambio%'
              or lower(coalesce(opt_group.name, '')) like '%reemplaz%'
              or lower(coalesce(opt_group.name, '')) like '%cambio%'
              then 'replacements'
            when lower(coalesce(opt_group.code, '')) like '%quitar%'
              or lower(coalesce(opt_group.code, '')) like '%sin-%'
              or lower(coalesce(opt_group.name, '')) like '%quitar%'
              or lower(coalesce(opt_group.name, '')) like 'sin %'
              then 'removals'
            when lower(coalesce(opt_group.code, '')) like '%extra%'
              or lower(coalesce(opt_group.code, '')) like '%adicion%'
              or lower(coalesce(opt_group.name, '')) like '%extra%'
              or lower(coalesce(opt_group.name, '')) like '%adicion%'
              or lower(coalesce(opt_group.name, '')) like '%topping%'
              then 'extras'
            when lower(coalesce(opt_group.code, '')) like '%prefer%'
              or lower(coalesce(opt_group.name, '')) like '%prefer%'
              or lower(coalesce(opt_group.name, '')) like '%instru%'
              then 'preferences'
            else 'choice'
          end as group_preset,
          opt.id as option_id,
          opt.code as option_code,
          opt.name as option_name,
          opt.price_delta_amount,
          opt.effect_type,
          opt.metadata as option_metadata
        into v_option_row
        from pass.catalog_item_options opt
        join pass.catalog_item_option_groups opt_group
          on opt_group.id = opt.option_group_id
        where opt.id = v_option_id
          and opt.is_active = true
          and opt_group.is_active = true
          and pass.catalog_item_option_group_is_allowed(v_catalog_item_id, opt_group.id);

        if not found then
          raise exception 'selected_option_invalid';
        end if;

        v_group_preset := coalesce(v_option_row.group_preset, 'choice');
        v_option_metadata := coalesce(v_option_row.option_metadata, '{}'::jsonb);

        v_linked_catalog_item_id := case
          when coalesce(v_option_metadata ->> 'linked_catalog_item_id', '') ~* '^[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}$'
            then (v_option_metadata ->> 'linked_catalog_item_id')::uuid
          else null
        end;

        select coalesce(jsonb_agg(to_jsonb(rule) order by rule.sort_order, rule.name), '[]'::jsonb)
        into v_consumption_rules
        from pass.catalog_item_option_consumption_rules rule
        where rule.option_id = v_option_row.option_id
          and rule.is_active = true;

        select coalesce(jsonb_agg(to_jsonb(effect) order by effect.sort_order, effect.id), '[]'::jsonb)
        into v_recipe_effects
        from pass.catalog_item_option_recipe_effects effect
        where effect.option_id = v_option_row.option_id
          and effect.is_active = true;

        if v_group_preset = 'extras' and jsonb_array_length(v_consumption_rules) = 0 then
          raise exception 'option_consumption_rule_required';
        end if;

        if v_group_preset = 'replacements' or v_option_row.effect_type = 'replacement' then
          if jsonb_array_length(v_consumption_rules) = 0 then
            raise exception 'replacement_consumption_rule_required';
          end if;

          if not exists (
            select 1
            from jsonb_array_elements(v_recipe_effects) effect
            where effect ->> 'effect_type' = 'replacement'
          ) then
            raise exception 'replacement_recipe_effect_required';
          end if;
        end if;

        if v_group_preset = 'removals' or v_option_row.effect_type = 'removal' then
          if not exists (
            select 1
            from jsonb_array_elements(v_recipe_effects) effect
            where effect ->> 'effect_type' = 'removal'
          ) then
            raise exception 'removal_recipe_effect_required';
          end if;
        end if;

        if v_group_preset = 'recommendations' then
          if v_linked_catalog_item_id is null then
            raise exception 'linked_catalog_item_required';
          end if;

          perform 1
          from pass.catalog_items linked_item
          where linked_item.id = v_linked_catalog_item_id
            and linked_item.site_id = p_site_id
            and linked_item.is_active = true;

          if not found then
            raise exception 'linked_catalog_item_invalid';
          end if;
        end if;

        v_option_delta := v_option_delta + greatest(coalesce(v_option_row.price_delta_amount, 0), 0);

        v_canonical_selected_options := v_canonical_selected_options || jsonb_build_array(
          jsonb_build_object(
            'group_id', v_option_row.group_id,
            'group_code', v_option_row.group_code,
            'group_name', v_option_row.group_name,
            'group_preset', v_group_preset,
            'selection_type', v_option_row.selection_type,
            'option_id', v_option_row.option_id,
            'option_code', v_option_row.option_code,
            'option_name', v_option_row.option_name,
            'price_delta_amount', greatest(coalesce(v_option_row.price_delta_amount, 0), 0),
            'effect_type', v_option_row.effect_type,
            'linked_catalog_item_id', v_linked_catalog_item_id,
            'linked_catalog_item_price_amount', nullif(v_option_metadata ->> 'linked_catalog_item_price_amount', '')::numeric,
            'metadata', v_option_metadata,
            'consumption_rules', v_consumption_rules,
            'recipe_effects', v_recipe_effects,
            'client_snapshot', v_option
          )
        );
      end loop;

      for v_group_rule in
        select id, name, selection_type, is_required, min_select, max_select
        from pass.catalog_item_allowed_option_groups(v_catalog_item_id)
      loop
        v_min_select := greatest(
          case when coalesce(v_group_rule.is_required, false) then 1 else 0 end,
          coalesce(v_group_rule.min_select, 0)
        );

        v_max_select := case
          when v_group_rule.selection_type = 'single' then 1
          else greatest(1, coalesce(v_group_rule.max_select, 1), v_min_select)
        end;

        select count(distinct opt.id)
        into v_selected_count
        from jsonb_array_elements(v_selected_options) selected
        join pass.catalog_item_options opt
          on opt.id::text = selected.value ->> 'option_id'
        where opt.option_group_id = v_group_rule.id
          and opt.is_active = true;

        if coalesce(v_selected_count, 0) < v_min_select then
          raise exception 'option_group_min_select_required';
        end if;

        if coalesce(v_selected_count, 0) > v_max_select then
          raise exception 'option_group_max_select_exceeded';
        end if;
      end loop;

      v_unit_price := greatest(coalesce(v_catalog_base_price, 0), 0) + greatest(coalesce(v_option_delta, 0), 0);

      if abs(v_original_unit_price - v_unit_price) > 0.01 then
        raise exception 'invalid_item_price';
      end if;
    end if;

    v_subtotal := v_subtotal + (v_quantity * v_unit_price);

    v_validated_items := v_validated_items || jsonb_build_array(
      jsonb_build_object(
        'product_id', v_product_id,
        'catalog_item_id', v_catalog_item_id,
        'quantity', v_quantity,
        'unit_price', v_unit_price,
        'base_unit_price', coalesce(v_catalog_base_price, v_unit_price),
        'option_total_amount', greatest(coalesce(v_option_delta, 0), 0),
        'notes', nullif(trim(coalesce(v_item ->> 'notes', '')), ''),
        'line_key', nullif(trim(coalesce(v_item ->> 'line_key', '')), ''),
        'selected_options', v_canonical_selected_options
      )
    );
  end loop;

  v_total := v_subtotal + v_delivery;

  insert into public.orders (
    client_id,
    order_type,
    source,
    status,
    payment_status,
    total_amount,
    subtotal_amount,
    notes,
    site_id,
    guest_info,
    fulfillment_type,
    contact_phone,
    delivery_address,
    delivery_zone,
    delivery_fee_amount,
    payment_provider,
    checkout_expires_at
  )
  values (
    v_uid,
    v_order_type,
    coalesce(nullif(trim(coalesce(p_source, '')), ''), 'vento_pass'),
    'pending',
    v_payment_status,
    v_total,
    v_subtotal,
    nullif(trim(coalesce(p_notes, '')), ''),
    p_site_id,
    jsonb_build_object(
      'contact_name', nullif(trim(coalesce(p_contact_name, '')), ''),
      'contact_phone', nullif(trim(coalesce(p_contact_phone, '')), ''),
      'fulfillment_type', v_fulfillment,
      'satellite_name', nullif(trim(coalesce(p_satellite_name, '')), '')
    ),
    v_fulfillment,
    nullif(trim(coalesce(p_contact_phone, '')), ''),
    v_delivery_address,
    v_delivery_zone,
    v_delivery,
    v_payment_provider,
    v_checkout_expires_at
  )
  returning id into v_order_id;

  for v_item in select * from jsonb_array_elements(v_validated_items)
  loop
    v_selected_options := coalesce(v_item -> 'selected_options', '[]'::jsonb);
    v_quantity := (v_item ->> 'quantity')::numeric;
    v_unit_price := (v_item ->> 'unit_price')::numeric;
    v_catalog_item_id := nullif(v_item ->> 'catalog_item_id', '')::uuid;

    insert into public.order_items (
      order_id,
      product_id,
      quantity,
      unit_price,
      total_amount,
      notes
    )
    values (
      v_order_id,
      (v_item ->> 'product_id')::uuid,
      v_quantity,
      v_unit_price,
      (v_quantity * v_unit_price),
      nullif(trim(coalesce(v_item ->> 'notes', '')), '')
    )
    returning id into v_order_item_id;

    if v_catalog_item_id is not null and jsonb_array_length(v_selected_options) > 0 then
      for v_option in select * from jsonb_array_elements(v_selected_options)
      loop
        v_option_id := nullif(v_option ->> 'option_id', '')::uuid;

        select
          opt_group.id as group_id,
          opt_group.code as group_code,
          opt_group.name as group_name,
          opt_group.selection_type,
          opt.id as option_id,
          opt.code as option_code,
          opt.name as option_name,
          opt.price_delta_amount,
          opt.effect_type
        into v_option_row
        from pass.catalog_item_options opt
        join pass.catalog_item_option_groups opt_group
          on opt_group.id = opt.option_group_id
        where opt.id = v_option_id
          and opt.is_active = true
          and opt_group.is_active = true
          and pass.catalog_item_option_group_is_allowed(v_catalog_item_id, opt_group.id);

        if not found then
          raise exception 'selected_option_invalid';
        end if;

        insert into public.order_item_options (
          order_item_id,
          option_group_id,
          option_id,
          group_code,
          group_name,
          option_code,
          option_name,
          quantity,
          price_delta_amount,
          total_delta_amount,
          metadata
        )
        values (
          v_order_item_id,
          v_option_row.group_id,
          v_option_row.option_id,
          v_option_row.group_code,
          v_option_row.group_name,
          v_option_row.option_code,
          v_option_row.option_name,
          v_quantity,
          greatest(coalesce(v_option_row.price_delta_amount, 0), 0),
          v_quantity * greatest(coalesce(v_option_row.price_delta_amount, 0), 0),
          jsonb_build_object(
            'line_key', v_item ->> 'line_key',
            'catalog_item_id', v_catalog_item_id,
            'base_unit_price', (v_item ->> 'base_unit_price')::numeric,
            'option_total_amount', (v_item ->> 'option_total_amount')::numeric,
            'group_preset', v_option ->> 'group_preset',
            'selection_type', v_option_row.selection_type,
            'effect_type', v_option_row.effect_type,
            'linked_catalog_item_id', nullif(v_option ->> 'linked_catalog_item_id', ''),
            'linked_catalog_item_price_amount',
              nullif(v_option ->> 'linked_catalog_item_price_amount', '')::numeric,
            'option_metadata', coalesce(v_option -> 'metadata', '{}'::jsonb),
            'selection_snapshot', v_option,
            'client_snapshot', coalesce(v_option -> 'client_snapshot', v_option),
            'consumption_rules', coalesce(v_option -> 'consumption_rules', '[]'::jsonb),
            'recipe_effects', coalesce(v_option -> 'recipe_effects', '[]'::jsonb)
          )
        );
      end loop;
    end if;
  end loop;

  if v_quote.id is not null then
    update pass.delivery_quotes
    set used_at = now()
    where id = v_quote.id;
  end if;

  if v_fulfillment = 'delivery' then
    insert into payments.transactions (
      order_id,
      user_id,
      site_id,
      provider,
      idempotency_key,
      amount_minor,
      currency,
      status,
      metadata
    )
    values (
      v_order_id,
      v_uid,
      p_site_id,
      'wompi',
      v_idempotency_key,
      round(v_total * 100)::bigint,
      'COP',
      'pending',
      jsonb_build_object(
        'source', 'create_order_checkout_draft',
        'delivery_quote_id', p_delivery_quote_id,
        'delivery_distance_km', coalesce(v_quote.billed_distance_km, p_delivery_distance_km),
        'fulfillment_type', v_fulfillment
      )
    )
    returning id into v_tx_id;

    update public.orders
    set payment_intent_id = v_tx_id
    where id = v_order_id;
  end if;

  return jsonb_build_object(
    'ok', true,
    'order_id', v_order_id,
    'transaction_id', v_tx_id,
    'idempotency_key', case when v_fulfillment = 'delivery' then v_idempotency_key else null end,
    'amount_minor', round(v_total * 100)::bigint,
    'currency', 'COP',
    'payment_status', v_payment_status,
    'payment_provider', v_payment_provider,
    'checkout_expires_at', v_checkout_expires_at
  );
end;
$$;

grant execute on function public.create_order_checkout_draft(
  uuid,
  text,
  text,
  text,
  text,
  text,
  text,
  text,
  jsonb,
  numeric,
  text,
  integer,
  uuid
) to authenticated, service_role;

comment on function public.create_order_checkout_draft(
  uuid,
  text,
  text,
  text,
  text,
  text,
  text,
  text,
  jsonb,
  numeric,
  text,
  integer,
  uuid
) is
  'Crea orden desde Vento Pass. Valida precio de catalog item, opciones configurables y reglas operacionales obligatorias; guarda snapshot canonico en order_item_options. Domicilio crea intento Wompi pendiente; recoger y en sitio quedan con pago no requerido.';

notify pgrst, 'reload schema';

commit;
