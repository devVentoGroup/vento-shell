begin;

create or replace view pass.sell_products_by_site as
with recipe_cost as (
  select
    r.product_id,
    sum(r.quantity * coalesce(ing.cost, 0))::numeric as recipe_total_cost
  from public.recipes r
  join public.products ing
    on ing.id = r.ingredient_product_id
  where coalesce(r.is_active, true) = true
  group by r.product_id
),
recipe_yield as (
  select
    rc.product_id,
    nullif(rc.yield_qty, 0)::numeric as yield_qty
  from public.recipe_cards rc
  where coalesce(rc.is_active, true) = true
)
select
  pss.site_id,
  p.id as product_id,
  p.name,
  p.sku,
  p.description,
  p.price as base_price,
  case
    when rc.recipe_total_cost is null then null
    when ry.yield_qty is null then greatest(rc.recipe_total_cost, 0)
    else greatest((rc.recipe_total_cost / ry.yield_qty), 0)
  end::numeric as recipe_cost_amount,
  case
    when p.price is null then null
    when rc.recipe_total_cost is null then null
    when ry.yield_qty is null then p.price - rc.recipe_total_cost
    else p.price - (rc.recipe_total_cost / ry.yield_qty)
  end::numeric as base_margin_amount,
  case
    when coalesce(p.price, 0) <= 0 then null
    when rc.recipe_total_cost is null then null
    when ry.yield_qty is null then round(((p.price - rc.recipe_total_cost) / p.price) * 100, 2)
    else round(((p.price - (rc.recipe_total_cost / ry.yield_qty)) / p.price) * 100, 2)
  end::numeric as base_margin_pct
from public.product_site_settings pss
join public.products p
  on p.id = pss.product_id
left join public.product_inventory_profiles pip
  on pip.product_id = p.id
left join recipe_cost rc
  on rc.product_id = p.id
left join recipe_yield ry
  on ry.product_id = p.id
where coalesce(pss.is_active, true) = true
  and coalesce(p.is_active, true) = true
  and (
    (
      lower(coalesce(p.product_type, '')) in ('venta', 'sale')
      and coalesce(pss.sales_enabled, true) = true
    )
    or (
      lower(coalesce(p.product_type, '')) = 'preparacion'
      and coalesce(pip.inventory_kind, 'finished') = 'finished'
      and coalesce(pss.sales_enabled, false) = true
    )
  );

grant select on pass.sell_products_by_site to authenticated, service_role;

create or replace view public.sell_products_by_site
with (security_invoker = true)
as
select * from pass.sell_products_by_site;

comment on view public.sell_products_by_site is 'Compat view. Canonical view lives in pass.sell_products_by_site.';

grant select on public.sell_products_by_site to authenticated, service_role;

create or replace function pass.validate_catalog_item_product_site()
returns trigger
language plpgsql
security definer
set search_path = public, pass
as $$
declare
  v_product record;
  v_category record;
begin
  if new.product_id is null then
    raise exception 'El item comercial debe estar asociado a un producto operacional vendible.';
  end if;

  select
    product_id,
    site_id,
    name,
    sku,
    description,
    base_price as price
  into v_product
  from pass.sell_products_by_site
  where product_id = new.product_id
    and site_id = new.site_id;

  if not found then
    raise exception 'El producto % no esta habilitado para venta en esta sede.', new.product_id;
  end if;

  if coalesce(trim(new.name), '') = '' then
    new.name := coalesce(v_product.name, 'Producto');
  end if;

  if coalesce(trim(new.description), '') = '' then
    new.description := v_product.description;
  end if;

  if coalesce(trim(new.code), '') = '' then
    new.code := lower(regexp_replace(coalesce(v_product.sku, v_product.name, 'item'), '[^a-zA-Z0-9]+', '-', 'g'));
    new.code := regexp_replace(new.code, '(^-+|-+$)', '', 'g');
    if coalesce(new.code, '') = '' then
      new.code := 'item';
    end if;
  end if;

  if coalesce(new.price_amount, 0) = 0 and v_product.price is not null and v_product.price > 0 then
    new.price_amount := v_product.price;
  end if;

  if new.commercial_category_id is null then
    raise exception 'Categoria comercial obligatoria. Crea o selecciona una categoria de venta; no se crean categorias desde texto libre.';
  end if;

  select id, site_id, name, is_active
    into v_category
  from pass.commercial_categories
  where id = new.commercial_category_id;

  if not found then
    raise exception 'Categoria comercial % no existe.', new.commercial_category_id;
  end if;

  if v_category.site_id is distinct from new.site_id then
    raise exception 'Categoria comercial no pertenece a la sede del item.';
  end if;

  if coalesce(v_category.is_active, true) = false then
    raise exception 'Categoria comercial inactiva.';
  end if;

  new.category_label := v_category.name;
  return new;
end;
$$;

alter function pass.validate_catalog_item_product_site() owner to postgres;
grant execute on function pass.validate_catalog_item_product_site() to authenticated, service_role;

comment on function pass.validate_catalog_item_product_site() is
  'Valida items comerciales contra pass.sell_products_by_site, que filtra productos operacionales vendibles por sede.';

notify pgrst, 'reload schema';

commit;
