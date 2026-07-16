alter table public.product_configuration_batches drop constraint if exists product_configuration_batches_zone_check;
alter table public.product_configuration_batches add constraint product_configuration_batches_zone_check check (zone in ('identity','request_policies','supplier_purchase','presentations'));

create or replace function public.apply_master_presentation_version_batch(p_changes jsonb)
returns uuid language plpgsql security invoker set search_path = public as $$
declare c jsonb; p public.product_uom_profiles%rowtype; new_id uuid; label_value text; input_unit text; stock_qty numeric; batch_id uuid; total integer:=0;
begin
 if not (public.is_owner() or public.is_global_manager()) then raise exception 'No tienes permiso para aplicar configuración masiva.'; end if;
 if jsonb_typeof(p_changes)<>'array' or jsonb_array_length(p_changes)=0 then raise exception 'No hay presentaciones para aplicar.'; end if;
 for c in select value from jsonb_array_elements(p_changes) loop
  select * into p from public.product_uom_profiles where id=(c->>'profile_id')::uuid and is_active=true; if not found then raise exception 'La presentación ya no está activa.'; end if;
  label_value:=nullif(trim(c->>'label'),''); input_unit:=nullif(trim(c->>'input_unit_code'),''); stock_qty:=(c->>'qty_in_stock_unit')::numeric;
  if label_value is null or input_unit is null or stock_qty<=0 then raise exception 'Nombre, unidad y equivalencia deben ser válidos.'; end if;
  insert into public.product_uom_profiles(product_id,label,input_unit_code,qty_in_input_unit,qty_in_stock_unit,is_default,is_active,source,usage_context,image_url,catalog_image_url)
  values(p.product_id,label_value,input_unit,coalesce(p.qty_in_input_unit,1),stock_qty,p.is_default,true,'master_configurator',p.usage_context,p.image_url,p.catalog_image_url) returning id into new_id;
  update public.product_uom_profiles set is_active=false,is_default=false,updated_at=now() where id=p.id;
  update public.product_suppliers set uom_profile_id=new_id,updated_at=now() where uom_profile_id=p.id;
  total:=total+1;
 end loop;
 insert into public.product_configuration_batches(zone,summary,product_count,created_by) values('presentations',jsonb_build_object('versions',p_changes),total,auth.uid()) returning id into batch_id; return batch_id;
end; $$;
revoke all on function public.apply_master_presentation_version_batch(jsonb) from public;
grant execute on function public.apply_master_presentation_version_batch(jsonb) to authenticated;
