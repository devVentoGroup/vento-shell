begin;

-- Limpieza de la categoria legacy "Bebidas Listas (RTD)".
--
-- Contexto:
-- - La categoria operacional legacy fue reemplazada por el arbol canonico de NEXO.
-- - Los items legacy sembrados en pass.catalog_items siguen activos y bloquean la creacion
--   de items reales del menu comercial por el indice unico (site_id, product_id) activo.
-- - El menu comercial nuevo solo debe usar filas con metadata.source_app='viso' y
--   metadata.source_module='menu_comercial'.

do $$
declare
  v_legacy_product_category uuid;
  v_target_product_category uuid;
  v_real_commercial_items integer;
begin
  select id
    into v_target_product_category
  from public.product_categories
  where lower(trim(slug)) = 'venta-bebidas-frias'
    and site_id is null
    and coalesce(nullif(trim(domain), ''), '') = ''
  order by id
  limit 1;

  if v_target_product_category is null then
    raise exception 'No existe la categoria operacional canonica venta-bebidas-frias.';
  end if;

  select id
    into v_legacy_product_category
  from public.product_categories
  where lower(trim(name)) = 'bebidas listas (rtd)'
     or lower(trim(slug)) = 'bebidas-listas-rtd'
  order by id
  limit 1;

  if v_legacy_product_category is not null then
    update public.products
    set category_id = v_target_product_category,
        updated_at = now()
    where category_id = v_legacy_product_category;

    delete from public.product_categories
    where id = v_legacy_product_category
      and not exists (
        select 1
        from public.products p
        where p.category_id = v_legacy_product_category
      );
  end if;

  select count(*)
    into v_real_commercial_items
  from pass.catalog_items ci
  join pass.commercial_categories cc
    on cc.id = ci.commercial_category_id
  where lower(trim(cc.name)) = 'bebidas listas (rtd)'
    and ci.metadata->>'source_app' = 'viso'
    and ci.metadata->>'source_module' = 'menu_comercial';

  if v_real_commercial_items > 0 then
    raise exception 'No se puede borrar Bebidas Listas (RTD): tiene % items reales de menu_comercial.', v_real_commercial_items;
  end if;

  alter table pass.catalog_items disable trigger user;

  update pass.catalog_items ci
  set is_active = false,
      commercial_collection_id = null,
      metadata = coalesce(ci.metadata, '{}'::jsonb)
        || jsonb_build_object(
          'legacy_cleanup_at', now(),
          'legacy_cleanup_reason', 'bebidas_listas_rtd_replaced_by_commercial_menu'
        ),
      updated_at = now()
  from pass.commercial_categories cc
  where cc.id = ci.commercial_category_id
    and lower(trim(cc.name)) = 'bebidas listas (rtd)'
    and (
      ci.metadata->>'source_app' is distinct from 'viso'
      or ci.metadata->>'source_module' is distinct from 'menu_comercial'
    );

  update pass.catalog_items ci
  set is_active = false,
      commercial_collection_id = null,
      metadata = coalesce(ci.metadata, '{}'::jsonb)
        || jsonb_build_object(
          'legacy_cleanup_at', now(),
          'legacy_cleanup_reason', 'bebidas_listas_rtd_label_replaced_by_commercial_menu'
        ),
      updated_at = now()
  where lower(trim(coalesce(ci.category_label, ''))) = 'bebidas listas (rtd)'
    and (
      ci.metadata->>'source_app' is distinct from 'viso'
      or ci.metadata->>'source_module' is distinct from 'menu_comercial'
    );

  delete from pass.commercial_collection_categories link
  using pass.commercial_categories cc
  where cc.id = link.commercial_category_id
    and lower(trim(cc.name)) = 'bebidas listas (rtd)';

  delete from pass.commercial_categories cc
  where lower(trim(cc.name)) = 'bebidas listas (rtd)'
    and not exists (
      select 1
      from pass.catalog_items ci
      where ci.commercial_category_id = cc.id
        and ci.metadata->>'source_app' = 'viso'
        and ci.metadata->>'source_module' = 'menu_comercial'
    );

  alter table pass.catalog_items enable trigger user;
end;
$$;

notify pgrst, 'reload schema';

commit;
