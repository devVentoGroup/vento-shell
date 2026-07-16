-- Las políticas usadas por solicitudes históricas no se borran: se desactivan.
-- El lote se rechaza entero si alguno de los productos quedaría sin alternativa activa.
alter table public.product_configuration_batches
  drop constraint if exists product_configuration_batches_zone_check;
alter table public.product_configuration_batches
  add constraint product_configuration_batches_zone_check
  check (zone in ('identity', 'request_policies'));

create or replace function public.deactivate_master_request_policy_batch(p_policy_ids jsonb)
returns uuid
language plpgsql
security invoker
set search_path = public
as $$
declare
  v_policy_id uuid;
  v_product_id uuid;
  v_is_default boolean;
  v_replacement_id uuid;
  v_batch_id uuid;
  v_count integer := 0;
begin
  if not (public.is_owner() or public.is_global_manager()) then
    raise exception 'No tienes permiso para aplicar configuración masiva.';
  end if;
  if jsonb_typeof(p_policy_ids) <> 'array' or jsonb_array_length(p_policy_ids) = 0 then
    raise exception 'No hay políticas para desactivar.';
  end if;

  for v_policy_id in select value::text::uuid from jsonb_array_elements(p_policy_ids) loop
    select product_id, is_default into v_product_id, v_is_default
    from public.product_request_policies
    where id = v_policy_id and is_active = true;
    if not found then raise exception 'La política ya no está activa o no existe.'; end if;

    select id into v_replacement_id
    from public.product_request_policies
    where product_id = v_product_id and is_active = true and id <> v_policy_id
    order by is_default desc, created_at asc
    limit 1;
    if v_replacement_id is null then
      raise exception 'No puedes desactivar la única política activa de un producto.';
    end if;
  end loop;

  for v_policy_id in select value::text::uuid from jsonb_array_elements(p_policy_ids) loop
    select product_id, is_default into v_product_id, v_is_default
    from public.product_request_policies where id = v_policy_id;
    if v_is_default then
      select id into v_replacement_id
      from public.product_request_policies
      where product_id = v_product_id and is_active = true and id <> v_policy_id
      order by is_default desc, created_at asc limit 1;
      update public.product_request_policies set is_default = false, updated_at = now() where id = v_policy_id;
      update public.product_request_policies set is_default = true, updated_at = now() where id = v_replacement_id;
    end if;
    update public.product_request_policies
    set is_active = false, is_default = false,
      change_reason = 'Desactivada desde el configurador maestro de productos.', updated_at = now()
    where id = v_policy_id;
    v_count := v_count + 1;
  end loop;

  insert into public.product_configuration_batches(zone, summary, product_count, created_by)
  values ('request_policies', jsonb_build_object('deactivated_policy_ids', p_policy_ids), v_count, auth.uid())
  returning id into v_batch_id;
  return v_batch_id;
end;
$$;

revoke all on function public.deactivate_master_request_policy_batch(jsonb) from public;
grant execute on function public.deactivate_master_request_policy_batch(jsonb) to authenticated;
