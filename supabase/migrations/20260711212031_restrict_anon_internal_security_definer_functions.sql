do $migration$
declare
  fn record;
begin
  for fn in
    select
      n.nspname as schema_name,
      p.proname as function_name,
      pg_get_function_identity_arguments(p.oid) as identity_arguments
    from pg_proc p
    join pg_namespace n on n.oid = p.pronamespace
    where p.prosecdef
      and p.prokind = 'f'
      and n.nspname in ('public', 'pass', 'club', 'talento', 'vital')
      and (
        (n.nspname = 'club' and p.proname in (
          'apply_redeem_debit',
          'reverse_redeem_debit'
        ))
        or
        (n.nspname = 'pass' and p.proname in (
          'cleanup_delivery_quotes',
          'ensure_commercial_category',
          'ensure_commercial_collection_category',
          'grant_loyalty_points',
          'process_loyalty_earning',
          'seed_catalog_items_from_sell_products',
          'update_catalog_item_image'
        ))
        or
        (n.nspname = 'talento' and p.proname in (
          'advance_application_stage',
          'handoff_to_anima',
          'log_application_event',
          'review_candidate_document',
          'schedule_interview',
          'transfer_candidate_to_employee'
        ))
        or
        (n.nspname = 'vital' and p.proname in (
          'is_vital_admin',
          'staff_weekly_squad_overview'
        ))
        or
        (n.nspname = 'public' and p.proname in (
          'apply_inventory_count_adjustments',
          'apply_inventory_site_count',
          'apply_operational_profile_to_shift',
          'apply_restock_receipt',
          'apply_restock_shipment',
          'apply_restock_shipment_from_picks',
          'apply_shared_device_template_actor_policies_v1',
          'assign_inventory_stock_to_location',
          'assign_inventory_stock_to_position',
          'award_loyalty_points_external',
          'close_inventory_count_session',
          'close_open_attendance_day_end',
          'consume_inventory_stock_by_uom_profile',
          'consume_inventory_stock_from_positions',
          'create_inventory_count_session_with_lines',
          'employee_wallet_eligibility',
          'employee_wallet_mark_issued',
          'employee_wallet_sync_eligibility',
          'estimate_internal_price_unit',
          'fogo_create_production_batch_from_recipe',
          'fogo_create_real_production_batch',
          'generate_daily_internal_pos_documents',
          'generate_manual_daily_internal_pos_documents',
          'generate_product_sku',
          'get_internal_invoice_cutoff_warnings',
          'mark_restock_request_in_transit',
          'origo_mark_inventory_entry_corrected',
          'origo_reverse_inventory_entry',
          'preview_daily_internal_pos_documents',
          'preview_manual_daily_internal_pos_documents',
          'price_restock_request_internal_transfer',
          'process_loyalty_earning',
          'process_order_payment',
          'promote_app_screen_to_navigation',
          'pulso_post_daily_sales_import',
          'rebuild_procurement_supplier_product_costs',
          'reconcile_inventory_stock_positions_for_count',
          'reconcile_zero_internal_positions_for_location_product',
          'reverse_restock_request',
          'run_shift_runtime_processor',
          'scheduled_auto_close_shift',
          'seed_catalog_items_from_sell_products',
          'set_inventory_stock_by_uom_profile_count',
          'split_restock_request_item',
          'sync_procurement_supplier_product_cost_from_entry_item',
          'sync_restock_request_status_from_items',
          'upsert_app_screen_registry',
          'upsert_driver_checkin_point',
          'upsert_employee_site_operational_profile',
          'upsert_inventory_stock_by_location',
          'upsert_inventory_stock_by_uom_profile',
          'upsert_operational_checkin_point',
          'upsert_site_operational_role',
          'value_closed_restock_request',
          'value_closed_restock_requests_for_cutoff'
        ))
      )
  loop
    execute format(
      'revoke execute on function %I.%I(%s) from public, anon',
      fn.schema_name,
      fn.function_name,
      fn.identity_arguments
    );
    execute format(
      'grant execute on function %I.%I(%s) to authenticated, service_role',
      fn.schema_name,
      fn.function_name,
      fn.identity_arguments
    );
  end loop;
end
$migration$;