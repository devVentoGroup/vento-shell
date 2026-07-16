alter table public.product_configuration_batches drop constraint if exists product_configuration_batches_zone_check;
alter table public.product_configuration_batches add constraint product_configuration_batches_zone_check check (zone in ('identity','request_policies','supplier_purchase','presentations','sites'));
create or replace function public.apply_master_product_site_batch(p_changes jsonb)
returns uuid language plpgsql security invoker set search_path=public as $$
declare c jsonb; pid uuid; sid uuid; minimum numeric; bid uuid; total integer:=0;
begin
 if not (public.is_owner() or public.is_global_manager()) then raise exception 'No tienes permiso para aplicar configuración masiva.'; end if;
 if jsonb_typeof(p_changes)<>'array' or jsonb_array_length(p_changes)=0 then raise exception 'No hay configuraciones por sede.'; end if;
 for c in select value from jsonb_array_elements(p_changes) loop
  pid:=(c->>'product_id')::uuid; sid:=(c->>'site_id')::uuid; minimum:=coalesce((c->>'min_stock_qty')::numeric,0);
  if minimum<0 then raise exception 'El mínimo no puede ser negativo.'; end if;
  if not exists(select 1 from public.products where id=pid) or not exists(select 1 from public.sites where id=sid) then raise exception 'Producto o sede inválidos.'; end if;
  insert into public.product_site_settings(product_id,site_id,is_active,inventory_enabled,remission_enabled,sales_enabled,min_stock_qty,updated_at)
  values(pid,sid,coalesce((c->>'is_active')::boolean,true),coalesce((c->>'inventory_enabled')::boolean,true),coalesce((c->>'remission_enabled')::boolean,false),coalesce((c->>'sales_enabled')::boolean,false),minimum,now())
  on conflict(product_id,site_id) do update set is_active=excluded.is_active,inventory_enabled=excluded.inventory_enabled,remission_enabled=excluded.remission_enabled,sales_enabled=excluded.sales_enabled,min_stock_qty=excluded.min_stock_qty,updated_at=now(); total:=total+1;
 end loop;
 insert into public.product_configuration_batches(zone,summary,product_count,created_by) values('sites',jsonb_build_object('changes',p_changes),total,auth.uid()) returning id into bid; return bid;
end; $$;
revoke all on function public.apply_master_product_site_batch(jsonb) from public;
grant execute on function public.apply_master_product_site_batch(jsonb) to authenticated;
