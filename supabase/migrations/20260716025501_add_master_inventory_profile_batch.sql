alter table public.product_configuration_batches drop constraint if exists product_configuration_batches_zone_check;
alter table public.product_configuration_batches add constraint product_configuration_batches_zone_check check (zone in ('identity','request_policies','supplier_purchase','presentations','sites','inventory'));
create or replace function public.apply_master_inventory_profile_batch(p_changes jsonb)
returns uuid language plpgsql security invoker set search_path=public as $$
declare c jsonb; pid uuid; tolerance numeric; mode text; kind text; bid uuid; total integer:=0;
begin
 if not (public.is_owner() or public.is_global_manager()) then raise exception 'No tienes permiso para aplicar configuración masiva.'; end if;
 if jsonb_typeof(p_changes)<>'array' or jsonb_array_length(p_changes)=0 then raise exception 'No hay perfiles de inventario.'; end if;
 for c in select value from jsonb_array_elements(p_changes) loop
  pid:=(c->>'product_id')::uuid; tolerance:=coalesce((c->>'default_tolerance_percent')::numeric,0); mode:=nullif(trim(c->>'measurement_mode'),''); kind:=nullif(trim(c->>'inventory_kind'),'');
  if tolerance<0 or tolerance>100 or mode not in ('fixed_presentation','variable_weight','count_with_weight','bulk_volume') or kind is null then raise exception 'Perfil de inventario inválido.'; end if;
  if not exists(select 1 from public.products where id=pid) then raise exception 'Producto inválido.'; end if;
  insert into public.product_inventory_profiles(product_id,track_inventory,inventory_kind,lot_tracking,expiry_tracking,measurement_mode,default_tolerance_percent,updated_at)
  values(pid,coalesce((c->>'track_inventory')::boolean,true),kind,coalesce((c->>'lot_tracking')::boolean,false),coalesce((c->>'expiry_tracking')::boolean,false),mode,tolerance,now())
  on conflict(product_id) do update set track_inventory=excluded.track_inventory,inventory_kind=excluded.inventory_kind,lot_tracking=excluded.lot_tracking,expiry_tracking=excluded.expiry_tracking,measurement_mode=excluded.measurement_mode,default_tolerance_percent=excluded.default_tolerance_percent,updated_at=now(); total:=total+1;
 end loop;
 insert into public.product_configuration_batches(zone,summary,product_count,created_by) values('inventory',jsonb_build_object('changes',p_changes),total,auth.uid()) returning id into bid; return bid;
end; $$;
revoke all on function public.apply_master_inventory_profile_batch(jsonb) from public;
grant execute on function public.apply_master_inventory_profile_batch(jsonb) to authenticated;
