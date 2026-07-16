revoke execute on function public.grant_loyalty_points(uuid, integer, text, jsonb) from public, anon;
grant execute on function public.grant_loyalty_points(uuid, integer, text, jsonb) to authenticated, service_role;

revoke execute on function public.process_loyalty_earning(uuid) from public, anon, authenticated;
grant execute on function public.process_loyalty_earning(uuid) to service_role;

revoke execute on function pass.process_loyalty_earning(uuid) from public, anon, authenticated;
grant execute on function pass.process_loyalty_earning(uuid) to service_role;

revoke execute on function public.upsert_app_screen_registry(text, text, text, text, text, text, text, integer, integer, text, text, text, text, text, text, text, boolean, text) from public, anon, authenticated;
grant execute on function public.upsert_app_screen_registry(text, text, text, text, text, text, text, integer, integer, text, text, text, text, text, text, text, boolean, text) to service_role;