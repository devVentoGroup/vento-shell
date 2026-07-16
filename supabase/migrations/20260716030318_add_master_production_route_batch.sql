alter table public.product_configuration_batches drop constraint if exists product_configuration_batches_zone_check;
alter table public.product_configuration_batches add constraint product_configuration_batches_zone_check check (zone in ('identity','request_policies','supplier_purchase','presentations','sites','inventory','production'));
create or replace function public.apply_master_production_route_batch(p_changes jsonb)
returns uuid language plpgsql security invoker set search_path=public as $$
declare c jsonb; pid uuid; sid uuid; input_loc uuid; output_loc uuid; area text; bid uuid; total integer:=0;
begin
 if not (public.is_owner() or public.is_global_manager()) then raise exception 'No tienes permiso para aplicar configuración masiva.'; end if;
 if jsonb_typeof(p_changes)<>'array' or jsonb_array_length(p_changes)=0 then raise exception 'No hay rutas de producción.'; end if;
 for c in select value from jsonb_array_elements(p_changes) loop
  pid:=(c->>'product_id')::uuid; sid:=(c->>'site_id')::uuid; input_loc:=(c->>'input_location_id')::uuid; output_loc:=(c->>'output_location_id')::uuid; area:=nullif(trim(c->>'area_kind'),'');
  if area is null or not exists(select 1 from public.inventory_locations where id=input_loc and site_id=sid) or not exists(select 1 from public.inventory_locations where id=output_loc and site_id=sid) then raise exception 'Área o LOC inválido para la sede seleccionada.'; end if;
  insert into public.product_site_production_routes(product_id,site_id,area_kind,input_location_id,output_mode,output_location_id,is_active)
  values(pid,sid,area,input_loc,'specific_location',output_loc,true)
  on conflict(product_id,site_id) do update set area_kind=excluded.area_kind,input_location_id=excluded.input_location_id,output_mode=excluded.output_mode,output_location_id=excluded.output_location_id,is_active=true; total:=total+1;
 end loop;
 insert into public.product_configuration_batches(zone,summary,product_count,created_by) values('production',jsonb_build_object('changes',p_changes),total,auth.uid()) returning id into bid; return bid;
end; $$;
revoke all on function public.apply_master_production_route_batch(jsonb) from public;
grant execute on function public.apply_master_production_route_batch(jsonb) to authenticated;
