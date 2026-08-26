begin;

-- Internal/maintenance functions should not be callable as client RPCs.
-- Some signatures are environment/history dependent and do not exist during
-- every clean replay. Harden each function only when its exact signature is
-- present, without weakening privileges for functions that do exist.
do $$
declare
  target record;
  v_identity regprocedure;
begin
  for target in
    select *
    from (values
      ('public.employee_wallet_sync_eligibility()', true),
      ('public.util_column_usage(regclass)', true),
      ('public._set_updated_at()', false),
      ('public.enforce_attendance_geofence()', false),
      ('public.enforce_attendance_sequence()', false),
      ('public.enforce_employee_inventory_location_assignment_site()', false),
      ('public.enforce_employee_role_site()', false),
      ('public.enforce_inventory_location_area_site()', false),
      ('public.enforce_inventory_location_parent_same_site()', false),
      ('public.enforce_inventory_location_position_scope()', false),
      ('public.notify_shift_published()', false),
      ('public.set_product_sku()', false),
      ('public.set_production_batch_code()', false),
      ('public.set_updated_at()', false),
      ('public.sync_order_fulfillment_state()', false),
      ('public.sync_restock_item_status_trigger()', false),
      ('public.tg_set_updated_at()', false),
      ('public.touch_order_conversation_from_message()', false),
      ('public.touch_updated_at()', false),
      ('public.trg_sync_restock_request_status_from_items()', false),
      ('public.update_employee_shifts_updated_at()', false),
      ('public.update_loyalty_balance()', false),
      ('public.update_updated_at()', false),
      ('public.validate_product_site_production_location()', false)
    ) as functions(function_signature, grant_service_role)
  loop
    v_identity := to_regprocedure(target.function_signature);
    if v_identity is null then
      raise notice 'Privilege hardening skipped for missing function %', target.function_signature;
      continue;
    end if;

    execute format('revoke all on function %s from authenticated', v_identity);
    if target.grant_service_role then
      execute format('grant execute on function %s to service_role', v_identity);
    end if;
  end loop;
end
$$;

commit;
