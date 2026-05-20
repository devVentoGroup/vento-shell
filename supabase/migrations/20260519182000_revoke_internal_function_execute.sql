begin;

-- Internal/maintenance functions should not be callable as client RPCs.
revoke all on function public.employee_wallet_sync_eligibility() from authenticated;
grant execute on function public.employee_wallet_sync_eligibility() to service_role;

revoke all on function public.util_column_usage(regclass) from authenticated;
grant execute on function public.util_column_usage(regclass) to service_role;

-- Trigger helpers are executed by triggers, not directly by mobile/web clients.
revoke all on function public._set_updated_at() from authenticated;
revoke all on function public.enforce_attendance_geofence() from authenticated;
revoke all on function public.enforce_attendance_sequence() from authenticated;
revoke all on function public.enforce_employee_inventory_location_assignment_site() from authenticated;
revoke all on function public.enforce_employee_role_site() from authenticated;
revoke all on function public.enforce_inventory_location_area_site() from authenticated;
revoke all on function public.enforce_inventory_location_parent_same_site() from authenticated;
revoke all on function public.enforce_inventory_location_position_scope() from authenticated;
revoke all on function public.notify_shift_published() from authenticated;
revoke all on function public.set_product_sku() from authenticated;
revoke all on function public.set_production_batch_code() from authenticated;
revoke all on function public.set_updated_at() from authenticated;
revoke all on function public.sync_order_fulfillment_state() from authenticated;
revoke all on function public.sync_restock_item_status_trigger() from authenticated;
revoke all on function public.tg_set_updated_at() from authenticated;
revoke all on function public.touch_order_conversation_from_message() from authenticated;
revoke all on function public.touch_updated_at() from authenticated;
revoke all on function public.trg_sync_restock_request_status_from_items() from authenticated;
revoke all on function public.update_employee_shifts_updated_at() from authenticated;
revoke all on function public.update_loyalty_balance() from authenticated;
revoke all on function public.update_updated_at() from authenticated;
revoke all on function public.validate_product_site_production_location() from authenticated;

commit;
