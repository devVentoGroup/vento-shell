insert into public.inventory_movement_types (code, name, description, affects_stock, is_active)
values ('sale_out', 'Salida por venta', 'Consumo por venta directa', -1, true)
on conflict (code) do update
set name = excluded.name,
    description = excluded.description,
    affects_stock = excluded.affects_stock,
    is_active = true;

alter table public.pulso_daily_sales_import_rows
  drop constraint if exists pulso_daily_sales_import_rows_match_status_check;

alter table public.pulso_daily_sales_import_rows
  add constraint pulso_daily_sales_import_rows_match_status_check
  check (match_status in ('matched_mid', 'matched_code', 'matched_name', 'unmatched'));

create table if not exists public.pulso_sales_consumption_rules (
  id uuid primary key default gen_random_uuid(),
  site_id uuid not null references public.sites(id) on delete cascade,
  catalog_item_id uuid references pass.catalog_items(id) on delete cascade,
  product_id uuid references public.products(id) on delete cascade,
  category_label text,
  area_id uuid not null references public.areas(id) on delete restrict,
  source_loc_id uuid not null references public.inventory_locations(id) on delete restrict,
  consumption_mode text not null,
  finished_product_id uuid references public.products(id) on delete restrict,
  recipe_product_id uuid references public.products(id) on delete restrict,
  ingredient_product_id uuid references public.products(id) on delete restrict,
  ingredient_qty numeric(14,6),
  ingredient_unit text,
  priority integer not null default 100,
  is_active boolean not null default true,
  created_by uuid references auth.users(id) on delete set null,
  updated_by uuid references auth.users(id) on delete set null,
  metadata jsonb not null default '{}'::jsonb,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now(),
  constraint pulso_sales_consumption_rules_mode_chk
    check (consumption_mode in ('stored_finished_good', 'made_to_order_recipe', 'direct_ingredient', 'no_inventory')),
  constraint pulso_sales_consumption_rules_selector_chk
    check (catalog_item_id is not null or product_id is not null or nullif(btrim(category_label), '') is not null),
  constraint pulso_sales_consumption_rules_qty_chk
    check (ingredient_qty is null or ingredient_qty > 0),
  constraint pulso_sales_consumption_rules_mode_payload_chk check (
    (consumption_mode = 'stored_finished_good' and finished_product_id is not null and recipe_product_id is null and ingredient_product_id is null and ingredient_qty is null)
    or (consumption_mode = 'made_to_order_recipe' and recipe_product_id is not null and finished_product_id is null and ingredient_product_id is null and ingredient_qty is null)
    or (consumption_mode = 'direct_ingredient' and ingredient_product_id is not null and ingredient_qty is not null and finished_product_id is null and recipe_product_id is null)
    or (consumption_mode = 'no_inventory' and finished_product_id is null and recipe_product_id is null and ingredient_product_id is null and ingredient_qty is null)
  )
);

create unique index if not exists pulso_sales_consumption_rules_catalog_uidx
  on public.pulso_sales_consumption_rules (site_id, catalog_item_id)
  where catalog_item_id is not null and is_active = true;

create index if not exists pulso_sales_consumption_rules_product_idx
  on public.pulso_sales_consumption_rules (site_id, product_id, priority)
  where product_id is not null and is_active = true;

create index if not exists pulso_sales_consumption_rules_category_idx
  on public.pulso_sales_consumption_rules (site_id, lower(btrim(category_label)), priority)
  where category_label is not null and is_active = true;

create table if not exists public.pulso_sales_inventory_postings (
  id uuid primary key default gen_random_uuid(),
  batch_id uuid not null references public.pulso_daily_sales_import_batches(id) on delete cascade,
  row_id uuid not null references public.pulso_daily_sales_import_rows(id) on delete cascade,
  rule_id uuid references public.pulso_sales_consumption_rules(id) on delete set null,
  site_id uuid not null references public.sites(id) on delete restrict,
  sales_date date not null,
  catalog_item_id uuid references pass.catalog_items(id) on delete set null,
  source_loc_id uuid references public.inventory_locations(id) on delete set null,
  area_id uuid references public.areas(id) on delete set null,
  product_id uuid references public.products(id) on delete restrict,
  quantity numeric(14,6) not null,
  movement_id uuid references public.inventory_movements(id) on delete set null,
  posting_kind text not null,
  metadata jsonb not null default '{}'::jsonb,
  created_at timestamptz not null default now(),
  constraint pulso_sales_inventory_postings_qty_chk check (quantity > 0),
  constraint pulso_sales_inventory_postings_kind_chk check (posting_kind in ('stored_finished_good', 'made_to_order_recipe', 'direct_ingredient')),
  constraint pulso_sales_inventory_postings_row_product_uidx unique (row_id, product_id, source_loc_id, posting_kind)
);

create or replace function public.set_pulso_sales_consumption_rules_updated_at()
returns trigger
language plpgsql
as $$
begin
  new.updated_at = now();
  return new;
end;
$$;

drop trigger if exists pulso_sales_consumption_rules_updated_at on public.pulso_sales_consumption_rules;
create trigger pulso_sales_consumption_rules_updated_at
before update on public.pulso_sales_consumption_rules
for each row
execute function public.set_pulso_sales_consumption_rules_updated_at();

create or replace function public.pulso_validate_sales_consumption_rule()
returns trigger
language plpgsql
security invoker
set search_path = public, pass
as $$
declare
  v_loc record;
  v_catalog record;
begin
  select site_id, area_id, is_active
    into v_loc
  from public.inventory_locations
  where id = new.source_loc_id;

  if v_loc.site_id is null then
    raise exception 'source_loc_id no existe';
  end if;
  if v_loc.site_id <> new.site_id then
    raise exception 'source_loc_id no pertenece a la sede indicada';
  end if;
  if v_loc.area_id <> new.area_id then
    raise exception 'source_loc_id no pertenece al area indicada';
  end if;
  if coalesce(v_loc.is_active, false) is false then
    raise exception 'source_loc_id no esta activo';
  end if;

  if new.catalog_item_id is not null then
    select site_id, product_id, category_label
      into v_catalog
    from pass.catalog_items
    where id = new.catalog_item_id;

    if v_catalog.site_id is null then
      raise exception 'catalog_item_id no existe';
    end if;
    if v_catalog.site_id <> new.site_id then
      raise exception 'catalog_item_id no pertenece a la sede indicada';
    end if;

    new.product_id := coalesce(new.product_id, v_catalog.product_id);
    new.category_label := coalesce(nullif(btrim(new.category_label), ''), v_catalog.category_label);
  end if;

  return new;
end;
$$;

drop trigger if exists pulso_sales_consumption_rules_validate on public.pulso_sales_consumption_rules;
create trigger pulso_sales_consumption_rules_validate
before insert or update of site_id, catalog_item_id, product_id, category_label, area_id, source_loc_id
on public.pulso_sales_consumption_rules
for each row
execute function public.pulso_validate_sales_consumption_rule();

create or replace view public.pulso_sales_import_rows_pending_consumption
with (security_invoker = true)
as
select
  row.id as row_id,
  row.batch_id,
  row.site_id,
  row.sales_date,
  row.source_row_number,
  row.external_item_id,
  row.external_item_name,
  row.external_category,
  row.quantity,
  row.catalog_item_id,
  row.product_id,
  item.category_label,
  row.match_status,
  row.row_status,
  case
    when row.catalog_item_id is null then 'missing_catalog_item'
    when rule.id is null then 'missing_consumption_rule'
    else null
  end as issue_code
from public.pulso_daily_sales_import_rows row
left join pass.catalog_items item on item.id = row.catalog_item_id
left join lateral (
  select r.id
  from public.pulso_sales_consumption_rules r
  where r.site_id = row.site_id
    and r.is_active = true
    and (
      r.catalog_item_id = row.catalog_item_id
      or (r.catalog_item_id is null and r.product_id = row.product_id)
      or (
        r.catalog_item_id is null
        and r.product_id is null
        and r.category_label is not null
        and lower(btrim(r.category_label)) = lower(btrim(coalesce(item.category_label, row.external_category)))
      )
    )
  order by
    case
      when r.catalog_item_id = row.catalog_item_id then 1
      when r.product_id = row.product_id then 2
      else 3
    end,
    r.priority,
    r.created_at
  limit 1
) rule on true
where row.row_status in ('draft', 'validated');

create or replace function public.pulso_post_daily_sales_import(p_batch_id uuid)
returns jsonb
language plpgsql
security definer
set search_path = public, pass, pg_temp
as $$
declare
  v_batch record;
  v_errors jsonb := '[]'::jsonb;
  v_posted_lines integer := 0;
  v_skipped_lines integer := 0;
  v_now timestamptz := now();
  v_line record;
  v_component record;
  v_movement_id uuid;
begin
  select *
    into v_batch
  from public.pulso_daily_sales_import_batches
  where id = p_batch_id
  for update;

  if v_batch.id is null then
    raise exception 'pulso_daily_sales_import_batch not found: %', p_batch_id;
  end if;

  if not public.has_permission('pulso.pos.main', v_batch.site_id) then
    raise exception 'permission denied';
  end if;

  if v_batch.status = 'posted' then
    return jsonb_build_object('status', 'posted', 'postedLines', 0, 'skippedLines', 0, 'errors', v_errors);
  end if;

  if v_batch.status not in ('validated') then
    raise exception 'Solo se pueden publicar lotes validados. Estado actual: %', v_batch.status;
  end if;

  for v_line in
    select
      row.id as row_id,
      row.site_id,
      row.sales_date,
      row.source_row_number,
      row.external_item_name,
      row.external_category,
      row.quantity as sold_qty,
      row.catalog_item_id,
      row.product_id as row_product_id,
      item.category_label,
      rule.id as rule_id,
      rule.area_id,
      rule.source_loc_id,
      rule.consumption_mode,
      rule.finished_product_id,
      rule.recipe_product_id,
      rule.ingredient_product_id,
      rule.ingredient_qty,
      rule.ingredient_unit
    from public.pulso_daily_sales_import_rows row
    left join pass.catalog_items item on item.id = row.catalog_item_id
    left join lateral (
      select r.*
      from public.pulso_sales_consumption_rules r
      where r.site_id = row.site_id
        and r.is_active = true
        and (
          r.catalog_item_id = row.catalog_item_id
          or (r.catalog_item_id is null and r.product_id = row.product_id)
          or (
            r.catalog_item_id is null
            and r.product_id is null
            and r.category_label is not null
            and lower(btrim(r.category_label)) = lower(btrim(coalesce(item.category_label, row.external_category)))
          )
        )
      order by
        case
          when r.catalog_item_id = row.catalog_item_id then 1
          when r.product_id = row.product_id then 2
          else 3
        end,
        r.priority,
        r.created_at
      limit 1
    ) rule on true
    where row.batch_id = p_batch_id
      and row.row_status = 'validated'
    order by row.source_row_number
  loop
    if v_line.catalog_item_id is null then
      v_errors := v_errors || jsonb_build_array(jsonb_build_object(
        'rowId', v_line.row_id,
        'rowNumber', v_line.source_row_number,
        'item', v_line.external_item_name,
        'issue', 'missing_catalog_item'
      ));
      continue;
    end if;

    if v_line.rule_id is null then
      v_errors := v_errors || jsonb_build_array(jsonb_build_object(
        'rowId', v_line.row_id,
        'rowNumber', v_line.source_row_number,
        'item', v_line.external_item_name,
        'category', coalesce(v_line.category_label, v_line.external_category),
        'issue', 'missing_consumption_rule'
      ));
      continue;
    end if;

    if v_line.consumption_mode = 'no_inventory' then
      update public.pulso_daily_sales_import_rows
      set row_status = 'posted',
          metadata = metadata || jsonb_build_object('inventoryPosting', 'no_inventory')
      where id = v_line.row_id;
      v_skipped_lines := v_skipped_lines + 1;
      continue;
    end if;

    for v_component in
      select
        v_line.consumption_mode as posting_kind,
        v_line.finished_product_id as product_id,
        v_line.sold_qty as qty,
        null::text as unit_code
      where v_line.consumption_mode = 'stored_finished_good'
      union all
      select
        v_line.consumption_mode,
        v_line.ingredient_product_id,
        v_line.sold_qty * v_line.ingredient_qty,
        v_line.ingredient_unit
      where v_line.consumption_mode = 'direct_ingredient'
      union all
      select
        v_line.consumption_mode,
        recipe.ingredient_product_id,
        (v_line.sold_qty / recipe_card.yield_qty) * recipe.quantity,
        null::text
      from public.recipes recipe
      join public.recipe_cards recipe_card
        on recipe_card.product_id = recipe.product_id
       and recipe_card.is_active = true
       and recipe_card.yield_qty > 0
      where v_line.consumption_mode = 'made_to_order_recipe'
        and recipe.product_id = v_line.recipe_product_id
        and recipe.is_active = true
        and recipe.ingredient_product_id is not null
        and recipe.quantity > 0
    loop
      if v_component.product_id is null or coalesce(v_component.qty, 0) <= 0 then
        v_errors := v_errors || jsonb_build_array(jsonb_build_object(
          'rowId', v_line.row_id,
          'rowNumber', v_line.source_row_number,
          'item', v_line.external_item_name,
          'issue', 'invalid_consumption_component'
        ));
        continue;
      end if;

      if coalesce((
        select stock.current_qty
        from public.inventory_stock_by_location stock
        where stock.location_id = v_line.source_loc_id
          and stock.product_id = v_component.product_id
      ), 0) < v_component.qty then
        v_errors := v_errors || jsonb_build_array(jsonb_build_object(
          'rowId', v_line.row_id,
          'rowNumber', v_line.source_row_number,
          'item', v_line.external_item_name,
          'productId', v_component.product_id,
          'sourceLocId', v_line.source_loc_id,
          'requiredQty', v_component.qty,
          'issue', 'insufficient_stock'
        ));
        continue;
      end if;

      if exists (
        select 1
        from public.pulso_sales_inventory_postings existing
        where existing.row_id = v_line.row_id
          and existing.product_id = v_component.product_id
          and existing.source_loc_id = v_line.source_loc_id
          and existing.posting_kind = v_component.posting_kind
      ) then
        continue;
      end if;

      insert into public.inventory_movements (
        site_id,
        product_id,
        movement_type,
        quantity,
        note,
        created_by,
        input_qty,
        input_unit_code,
        conversion_factor_to_stock,
        stock_unit_code
      )
      select
        v_line.site_id,
        v_component.product_id,
        'sale_out',
        v_component.qty,
        format('Pulso venta importada %s fila %s - %s', v_batch.sales_date, v_line.source_row_number, v_line.external_item_name),
        auth.uid(),
        v_component.qty,
        coalesce(nullif(v_component.unit_code, ''), p.stock_unit_code, p.unit, 'un'),
        1,
        coalesce(p.stock_unit_code, p.unit, 'un')
      from public.products p
      where p.id = v_component.product_id
      returning id into v_movement_id;

      insert into public.inventory_stock_by_site (site_id, product_id, current_qty, updated_at)
      values (v_line.site_id, v_component.product_id, -v_component.qty, v_now)
      on conflict (site_id, product_id) do update
        set current_qty = public.inventory_stock_by_site.current_qty + excluded.current_qty,
            updated_at = excluded.updated_at;

      insert into public.inventory_stock_by_location (location_id, product_id, current_qty, updated_at)
      values (v_line.source_loc_id, v_component.product_id, -v_component.qty, v_now)
      on conflict (location_id, product_id) do update
        set current_qty = public.inventory_stock_by_location.current_qty + excluded.current_qty,
            updated_at = excluded.updated_at;

      insert into public.pulso_sales_inventory_postings (
        batch_id,
        row_id,
        rule_id,
        site_id,
        sales_date,
        catalog_item_id,
        source_loc_id,
        area_id,
        product_id,
        quantity,
        movement_id,
        posting_kind,
        metadata
      )
      values (
        p_batch_id,
        v_line.row_id,
        v_line.rule_id,
        v_line.site_id,
        v_line.sales_date,
        v_line.catalog_item_id,
        v_line.source_loc_id,
        v_line.area_id,
        v_component.product_id,
        v_component.qty,
        v_movement_id,
        v_component.posting_kind,
        jsonb_build_object('source', 'pulso_post_daily_sales_import')
      );

      v_posted_lines := v_posted_lines + 1;
    end loop;

    if v_line.consumption_mode = 'made_to_order_recipe' and not exists (
      select 1
      from public.recipes recipe
      join public.recipe_cards recipe_card
        on recipe_card.product_id = recipe.product_id
       and recipe_card.is_active = true
       and recipe_card.yield_qty > 0
      where recipe.product_id = v_line.recipe_product_id
        and recipe.is_active = true
        and recipe.ingredient_product_id is not null
        and recipe.quantity > 0
    ) then
      v_errors := v_errors || jsonb_build_array(jsonb_build_object(
        'rowId', v_line.row_id,
        'rowNumber', v_line.source_row_number,
        'item', v_line.external_item_name,
        'issue', 'missing_recipe_components'
      ));
    end if;

    if jsonb_array_length(v_errors) = 0 then
      update public.pulso_daily_sales_import_rows
      set row_status = 'posted'
      where id = v_line.row_id;
    end if;
  end loop;

  if jsonb_array_length(v_errors) > 0 then
    raise exception 'No se puede publicar el lote: %', v_errors;
  end if;

  update public.pulso_daily_sales_import_batches
  set status = 'posted',
      posted_at = v_now,
      metadata = metadata || jsonb_build_object(
        'inventoryPostedAt', v_now,
        'inventoryPostedBy', auth.uid(),
        'inventoryPostedLines', v_posted_lines,
        'inventorySkippedLines', v_skipped_lines
      )
  where id = p_batch_id;

  return jsonb_build_object(
    'status', 'posted',
    'postedLines', v_posted_lines,
    'skippedLines', v_skipped_lines,
    'errors', v_errors
  );
end;
$$;

alter table public.pulso_sales_consumption_rules enable row level security;
alter table public.pulso_sales_inventory_postings enable row level security;

drop policy if exists pulso_sales_consumption_rules_select_permission on public.pulso_sales_consumption_rules;
create policy pulso_sales_consumption_rules_select_permission
on public.pulso_sales_consumption_rules
for select
to authenticated
using (public.has_permission('pulso.pos.main', site_id));

drop policy if exists pulso_sales_consumption_rules_insert_permission on public.pulso_sales_consumption_rules;
create policy pulso_sales_consumption_rules_insert_permission
on public.pulso_sales_consumption_rules
for insert
to authenticated
with check (public.has_permission('pulso.pos.main', site_id));

drop policy if exists pulso_sales_consumption_rules_update_permission on public.pulso_sales_consumption_rules;
create policy pulso_sales_consumption_rules_update_permission
on public.pulso_sales_consumption_rules
for update
to authenticated
using (public.has_permission('pulso.pos.main', site_id))
with check (public.has_permission('pulso.pos.main', site_id));

drop policy if exists pulso_sales_inventory_postings_select_permission on public.pulso_sales_inventory_postings;
create policy pulso_sales_inventory_postings_select_permission
on public.pulso_sales_inventory_postings
for select
to authenticated
using (public.has_permission('pulso.pos.main', site_id));

grant select, insert, update on public.pulso_sales_consumption_rules to authenticated;
grant select on public.pulso_sales_inventory_postings to authenticated;
grant all on public.pulso_sales_consumption_rules to service_role;
grant all on public.pulso_sales_inventory_postings to service_role;
grant select on public.pulso_sales_import_rows_pending_consumption to authenticated;
grant execute on function public.pulso_validate_sales_consumption_rule() to authenticated, service_role;
grant execute on function public.pulso_post_daily_sales_import(uuid) to authenticated, service_role;
