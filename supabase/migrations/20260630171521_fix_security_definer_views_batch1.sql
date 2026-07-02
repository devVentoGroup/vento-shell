begin;

alter view public.v_inventory_catalog set (security_invoker = true);
alter view public.employee_attendance_status set (security_invoker = true);
alter view public.v_inventory_stock_by_location set (security_invoker = true);
alter view pass.sell_products_by_site set (security_invoker = true);
alter view public.v_asset_items_inventory_status set (security_invoker = true);
alter view public.v_asset_groups_inventory_status set (security_invoker = true);
alter view public.v_asset_count_session_summary set (security_invoker = true);
alter view public.pass_delivery_distance_rates set (security_invoker = true);
alter view public.v_site_production_route_diagnostics set (security_invoker = true);
alter view public.v_site_area_operational_diagnostics set (security_invoker = true);
alter view public.v_ops_site_readiness set (security_invoker = true);
alter view public.v_ops_restock_product_gaps set (security_invoker = true);
alter view public.v_procurement_price_book set (security_invoker = true);
alter view public.shift_calendar_view set (security_invoker = true);
alter view public.operational_sites set (security_invoker = true);
alter view public.vento_operational_roles_v1 set (security_invoker = true);
alter view public.vento_site_operational_role_matrix_v1 set (security_invoker = true);

commit;
