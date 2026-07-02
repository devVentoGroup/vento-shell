begin;

do $$
declare
  target record;
  proc record;
  search_path_sql text;
begin
  for target in
    select *
    from (
      values
        ('public', 'touch_updated_at'),
        ('vital', 'set_updated_at'),
        ('vital', 'is_service_role'),
        ('talento', 'current_candidate_id'),
        ('talento', 'set_updated_at'),
        ('pass', 'normalize_commercial_category_code'),
        ('talento', 'stage_rank'),
        ('talento', 'status_for_stage'),
        ('public', 'set_app_navigation_items_updated_at'),
        ('public', 'haversine_m'),
        ('vital', 'should_materialize_on_date'),
        ('vital', 'validate_notification_schedule'),
        ('public', 'enforce_inventory_location_parent_same_site'),
        ('pass', 'normalize_commercial_collection_code'),
        ('talento', 'storage_object_belongs_to_current_candidate'),
        ('public', 'validate_employee_site_operational_profile'),
        ('public', 'set_production_batch_code'),
        ('public', 'tg_set_updated_at'),
        ('public', 'check_nexo_permissions'),
        ('public', '_set_updated_at'),
        ('public', '_vento_norm'),
        ('public', 'generate_location_code'),
        ('public', 'generate_lpn_code'),
        ('public', 'receive_purchase_order'),
        ('public', 'sync_restock_item_status_trigger'),
        ('public', 'resolve_product_sku_type_code'),
        ('public', 'update_updated_at'),
        ('public', 'generate_inventory_sku'),
        ('public', 'device_info_has_blocking_warnings'),
        ('public', 'get_restock_request_operational_summary'),
        ('public', 'compute_restock_item_status'),
        ('public', 'enforce_employee_inventory_location_assignment_site'),
        ('public', 'enforce_employee_role_site'),
        ('public', 'set_numera_updated_at'),
        ('public', 'numera_current_period_summary'),
        ('public', 'set_pulso_daily_sales_import_updated_at'),
        ('public', 'set_pulso_external_sales_item_mappings_updated_at'),
        ('public', 'util_column_usage'),
        ('public', 'enforce_attendance_sequence'),
        ('public', 'set_updated_at'),
        ('public', 'update_employee_shifts_updated_at'),
        ('public', 'update_loyalty_balance'),
        ('public', 'set_pulso_sales_consumption_rules_updated_at'),
        ('public', '_vento_slugify'),
        ('public', '_vento_uuid_from_text'),
        ('public', 'resolve_product_sku_brand_code'),
        ('public', 'handle_new_user'),
        ('public', 'set_recipe_site_uses_updated_at'),
        ('public', 'set_recipe_outputs_updated_at')
    ) as t(schema_name, function_name)
  loop
    search_path_sql := case target.schema_name
      when 'public' then 'public, auth, storage, extensions'
      else format('%I, public, auth, storage, extensions', target.schema_name)
    end;

    for proc in
      select p.oid::regprocedure as identity
      from pg_proc p
      join pg_namespace n on n.oid = p.pronamespace
      where n.nspname = target.schema_name
        and p.proname = target.function_name
    loop
      execute format(
        'alter function %s set search_path = %s',
        proc.identity,
        search_path_sql
      );
    end loop;
  end loop;
end $$;

commit;
