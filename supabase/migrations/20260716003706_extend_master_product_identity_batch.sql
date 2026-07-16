-- Extiende el lote de Identidad: los cambios quedan en productos y se validan
-- antes de persistir. No modifica documentos operativos o movimientos históricos.
create or replace function public.apply_master_product_identity_batch(p_changes jsonb)
returns uuid
language plpgsql
security invoker
set search_path = public
as $$
declare
  v_change jsonb;
  v_product_id uuid;
  v_name text;
  v_sku text;
  v_category_id uuid;
  v_is_active boolean;
  v_product_type text;
  v_batch_id uuid;
  v_count integer := 0;
begin
  if not (public.is_owner() or public.is_global_manager()) then
    raise exception 'No tienes permiso para aplicar configuración masiva.';
  end if;
  if jsonb_typeof(p_changes) <> 'array' or jsonb_array_length(p_changes) = 0 then
    raise exception 'No hay cambios para aplicar.';
  end if;

  for v_change in select value from jsonb_array_elements(p_changes) loop
    v_product_id := (v_change->>'product_id')::uuid;
    v_name := nullif(trim(v_change->>'name'), '');
    v_sku := nullif(trim(v_change->>'sku'), '');
    v_category_id := (v_change->>'category_id')::uuid;
    v_is_active := coalesce((v_change->>'is_active')::boolean, true);
    if v_name is null then raise exception 'El nombre es obligatorio.'; end if;

    select product_type into v_product_type from public.products where id = v_product_id;
    if not found then raise exception 'Producto no encontrado.'; end if;
    if not exists (
      select 1 from public.product_categories
      where id = v_category_id
        and is_active = true
        and applies_to_kinds @> array[v_product_type]
    ) then
      raise exception 'La categoría seleccionada no es válida para el producto.';
    end if;

    update public.products
    set name = v_name, sku = v_sku, category_id = v_category_id, is_active = v_is_active, updated_at = now()
    where id = v_product_id;
    v_count := v_count + 1;
  end loop;

  insert into public.product_configuration_batches(zone, summary, product_count, created_by)
  values ('identity', jsonb_build_object('changes', p_changes), v_count, auth.uid())
  returning id into v_batch_id;
  return v_batch_id;
end;
$$;

revoke all on function public.apply_master_product_identity_batch(jsonb) from public;
grant execute on function public.apply_master_product_identity_batch(jsonb) to authenticated;
