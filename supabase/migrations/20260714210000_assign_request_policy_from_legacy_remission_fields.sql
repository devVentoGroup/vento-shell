create or replace function public.assign_request_policy_to_restock_item()
returns trigger
language plpgsql
set search_path to 'public', 'auth', 'storage', 'extensions'
as $function$
declare
  v_policy_id uuid;
begin
  if new.request_policy_id is not null then
    return new;
  end if;

  if new.input_uom_profile_id is not null then
    select prp.id
      into v_policy_id
    from public.product_request_policies prp
    where prp.product_id = new.product_id
      and prp.is_active = true
      and prp.policy_kind = 'physical_presentation'
      and prp.physical_uom_profile_id = new.input_uom_profile_id
    order by prp.is_default desc, prp.created_at desc
    limit 1;
  end if;

  if v_policy_id is null then
    select prp.id
      into v_policy_id
    from public.product_request_policies prp
    where prp.product_id = new.product_id
      and prp.is_active = true
    order by prp.is_default desc, prp.created_at asc
    limit 1;
  end if;

  if v_policy_id is null then
    return new;
  end if;

  new.request_policy_id := v_policy_id;
  new.requested_policy_qty := coalesce(
    nullif(new.input_qty, 0),
    nullif(new.quantity, 0)
  );

  return new;
end;
$function$;

drop trigger if exists trg_00_assign_request_policy_to_restock_item
on public.restock_request_items;

create trigger trg_00_assign_request_policy_to_restock_item
before insert on public.restock_request_items
for each row
execute function public.assign_request_policy_to_restock_item();
