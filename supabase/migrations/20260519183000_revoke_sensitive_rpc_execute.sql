begin;

-- These routines are internal jobs, webhook/service helpers, or implementation
-- details used by other functions/triggers. They should not be callable as
-- client-side RPCs by every signed-in user.

-- Service-role only maintenance and privacy operations.
revoke all on function public.anonymize_user_personal_data(uuid) from authenticated;
grant execute on function public.anonymize_user_personal_data(uuid) to service_role;

-- Payment and loyalty mutation helpers are invoked by trusted server paths.
revoke all on function public.grant_loyalty_points(uuid, integer, text, jsonb) from authenticated;
grant execute on function public.grant_loyalty_points(uuid, integer, text, jsonb) to service_role;

revoke all on function public.process_loyalty_earning(uuid) from authenticated;
grant execute on function public.process_loyalty_earning(uuid) to service_role;

revoke all on function public.mark_payment_transaction_status(uuid, text, text, jsonb) from authenticated;
grant execute on function public.mark_payment_transaction_status(uuid, text, text, jsonb) to service_role;

-- Scheduled/background jobs are triggered by cron/edge functions, not clients.
revoke all on function public.run_shift_runtime_processor() from authenticated;
grant execute on function public.run_shift_runtime_processor() to service_role;

revoke all on function public.scheduled_auto_close_shift(uuid, timestamptz) from authenticated;
grant execute on function public.scheduled_auto_close_shift(uuid, timestamptz) to service_role;

-- One-off catalog seeding should stay server/admin controlled.
revoke all on function public.seed_catalog_items_from_sell_products(uuid, boolean) from authenticated;
grant execute on function public.seed_catalog_items_from_sell_products(uuid, boolean) to service_role;

-- Pure/internal helpers do not need to be exposed as RPC endpoints.
revoke all on function public._vento_norm(text) from authenticated;
revoke all on function public._vento_slugify(text) from authenticated;
revoke all on function public._vento_uuid_from_text(text) from authenticated;
revoke all on function public.compute_restock_item_status(numeric, numeric, numeric, numeric, numeric) from authenticated;
revoke all on function public.haversine_m(numeric, numeric, numeric, numeric) from authenticated;
revoke all on function public.resolve_product_sku_brand_code(uuid) from authenticated;
revoke all on function public.resolve_product_sku_type_code(text) from authenticated;
revoke all on function public.handle_new_user() from authenticated;
revoke all on function public.sync_restock_request_status_from_items(uuid) from authenticated;

commit;
