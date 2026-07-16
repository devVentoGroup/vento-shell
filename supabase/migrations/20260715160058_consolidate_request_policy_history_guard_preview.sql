create or replace function public.prevent_used_request_policy_semantic_update()
returns trigger
language plpgsql
set search_path to 'public', 'auth', 'storage', 'extensions'
as $function$
begin
  if exists (
    select 1
    from public.restock_request_items item
    where item.request_policy_id = old.id
    limit 1
  ) and (
    new.product_id is distinct from old.product_id
    or new.request_unit_code is distinct from old.request_unit_code
    or new.base_unit_code is distinct from old.base_unit_code
    or new.base_qty_per_request_unit is distinct from old.base_qty_per_request_unit
    or new.constraint_mode is distinct from old.constraint_mode
    or new.minimum_request_qty is distinct from old.minimum_request_qty
    or new.request_step_qty is distinct from old.request_step_qty
    or new.allow_fraction is distinct from old.allow_fraction
    or new.policy_kind is distinct from old.policy_kind
    or new.physical_uom_profile_id is distinct from old.physical_uom_profile_id
  ) then
    raise exception using
      errcode = '23514',
      message = 'REQUEST_POLICY_VERSION_REQUIRED',
      detail = 'La política ya fue utilizada. Desactívala y crea una nueva versión para cambiar su significado.';
  end if;

  return new;
end;
$function$;

revoke all on function public.prevent_used_request_policy_semantic_update() from public;
revoke all on function public.prevent_used_request_policy_semantic_update() from anon;
revoke all on function public.prevent_used_request_policy_semantic_update() from authenticated;

drop trigger if exists trg_lock_used_product_request_policy on public.product_request_policies;
drop function if exists public.lock_used_product_request_policy_semantics();