create or replace function public.apply_master_request_policy_rules_batch(p_changes jsonb)
returns uuid language plpgsql security invoker set search_path = public as $$
declare c jsonb; p public.product_request_policies%rowtype; n numeric; s numeric; usage_count integer; new_id uuid; batch_id uuid; total integer := 0;
begin
  if not (public.is_owner() or public.is_global_manager()) then raise exception 'No tienes permiso para aplicar configuración masiva.'; end if;
  if jsonb_typeof(p_changes) <> 'array' or jsonb_array_length(p_changes)=0 then raise exception 'No hay cambios para aplicar.'; end if;
  for c in select value from jsonb_array_elements(p_changes) loop
    select * into p from public.product_request_policies where id=(c->>'policy_id')::uuid and is_active=true;
    if not found then raise exception 'La política ya no está activa.'; end if;
    n := (c->>'minimum_request_qty')::numeric; s := (c->>'request_step_qty')::numeric;
    if n <= 0 or s <= 0 then raise exception 'El mínimo y el paso deben ser mayores que cero.'; end if;
    select count(*) into usage_count from public.restock_request_items where request_policy_id=p.id;
    if usage_count > 0 and (p.minimum_request_qty <> n or p.request_step_qty <> s) then
      update public.product_request_policies set is_active=false,is_default=false,updated_at=now(),change_reason='Reemplazada desde configurador maestro.' where id=p.id;
      insert into public.product_request_policies(product_id,label,request_unit_code,base_unit_code,base_qty_per_request_unit,constraint_mode,minimum_request_qty,request_step_qty,allow_fraction,policy_kind,physical_uom_profile_id,is_active,is_default,source,version_number,supersedes_policy_id,change_reason,created_by)
      values(p.product_id,p.label,p.request_unit_code,p.base_unit_code,p.base_qty_per_request_unit,p.constraint_mode,n,s,p.allow_fraction,p.policy_kind,p.physical_uom_profile_id,true,true,p.source,p.version_number+1,p.id,'Cambio de mínimo o paso desde configurador maestro.',auth.uid()) returning id into new_id;
      insert into public.product_request_policy_presentations(request_policy_id,uom_profile_id,is_preferred,allow_substitution,priority)
      select new_id,uom_profile_id,is_preferred,allow_substitution,priority from public.product_request_policy_presentations where request_policy_id=p.id;
    else
      update public.product_request_policies set minimum_request_qty=n,request_step_qty=s,updated_at=now() where id=p.id;
    end if; total:=total+1;
  end loop;
  insert into public.product_configuration_batches(zone,summary,product_count,created_by) values('request_policies',jsonb_build_object('rules',p_changes),total,auth.uid()) returning id into batch_id;
  return batch_id;
end; $$;
revoke all on function public.apply_master_request_policy_rules_batch(jsonb) from public;
grant execute on function public.apply_master_request_policy_rules_batch(jsonb) to authenticated;
