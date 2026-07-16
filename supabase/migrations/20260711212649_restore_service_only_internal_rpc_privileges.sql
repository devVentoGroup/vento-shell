do $migration$
declare
  fn regprocedure;
begin
  foreach fn in array array[
    'pass.cleanup_delivery_quotes()'::regprocedure,
    'pass.seed_catalog_items_from_sell_products(uuid,boolean)'::regprocedure,
    'public.close_open_attendance_day_end(text)'::regprocedure,
    'public.employee_wallet_sync_eligibility()'::regprocedure,
    'public.notify_shift_published()'::regprocedure,
    'public.rebuild_procurement_supplier_product_costs()'::regprocedure,
    'public.run_shift_runtime_processor()'::regprocedure,
    'public.scheduled_auto_close_shift(uuid,timestamp with time zone)'::regprocedure,
    'public.seed_catalog_items_from_sell_products(uuid,boolean)'::regprocedure,
    'public.sync_procurement_supplier_product_cost_from_entry_item(uuid)'::regprocedure,
    'public.sync_restock_request_status_from_items(uuid)'::regprocedure,
    'public.update_loyalty_balance()'::regprocedure
  ]
  loop
    execute format('revoke execute on function %s from public, anon, authenticated', fn);
    execute format('grant execute on function %s to service_role', fn);
  end loop;
end
$migration$;