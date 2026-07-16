create or replace function public.apply_master_supplier_purchase_batch(p_changes jsonb)
returns uuid language plpgsql security invoker set search_path = public as $$
declare c jsonb; supplier_link uuid; price numeric; pack_qty numeric; unit_code text; primary_flag boolean; batch_id uuid; total integer:=0;
begin
 if not (public.is_owner() or public.is_global_manager()) then raise exception 'No tienes permiso para aplicar configuración masiva.'; end if;
 if jsonb_typeof(p_changes)<>'array' or jsonb_array_length(p_changes)=0 then raise exception 'No hay cambios para aplicar.'; end if;
 for c in select value from jsonb_array_elements(p_changes) loop
  supplier_link := (c->>'product_supplier_id')::uuid; price := (c->>'purchase_price')::numeric; pack_qty := (c->>'purchase_pack_qty')::numeric; unit_code:=nullif(trim(c->>'purchase_pack_unit_code'),''); primary_flag:=coalesce((c->>'is_primary')::boolean,false);
  if price<0 or pack_qty<=0 or unit_code is null then raise exception 'Precio, empaque y unidad de compra deben ser válidos.'; end if;
  if not exists(select 1 from public.product_suppliers where id=supplier_link) then raise exception 'La relación con proveedor no existe.'; end if;
  if primary_flag then update public.product_suppliers set is_primary=false where product_id=(select product_id from public.product_suppliers where id=supplier_link); end if;
  update public.product_suppliers set purchase_price=price,purchase_pack_qty=pack_qty,purchase_pack_unit_code=unit_code,is_primary=primary_flag,updated_at=now() where id=supplier_link;
  total:=total+1;
 end loop;
 insert into public.product_configuration_batches(zone,summary,product_count,created_by) values('supplier_purchase',jsonb_build_object('supplier_purchase',p_changes),total,auth.uid()) returning id into batch_id; return batch_id;
end; $$;
revoke all on function public.apply_master_supplier_purchase_batch(jsonb) from public;
grant execute on function public.apply_master_supplier_purchase_batch(jsonb) to authenticated;
alter table public.product_configuration_batches drop constraint if exists product_configuration_batches_zone_check;
alter table public.product_configuration_batches add constraint product_configuration_batches_zone_check check (zone in ('identity','request_policies','supplier_purchase'));
