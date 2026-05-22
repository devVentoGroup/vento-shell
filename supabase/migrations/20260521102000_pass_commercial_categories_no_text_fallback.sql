begin;

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
    raise exception 'El item comercial debe estar asociado a un producto de venta.';
  end if;

  select
    product_id,
    site_id,
    name,
    sku,
    description,
    base_price as price,
    is_active
  into v_product
  from pass.sell_products_by_site
  where product_id = new.product_id
    and site_id = new.site_id;

  if not found then
    raise exception 'El producto % no esta habilitado para venta en esta sede.', new.product_id;
  end if;

  if coalesce(v_product.is_active, true) = false then
    raise exception 'El producto % esta inactivo para venta.', new.product_id;
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
  'Valida items de venta Pass sin crear categorias comerciales desde category_label. Las categorias de venta deben existir explicitamente en pass.commercial_categories.';

notify pgrst, 'reload schema';

commit;
