create or replace function public.get_site_order_status(
  p_site_id uuid,
  p_fulfillment_type text,
  p_items jsonb,
  p_timezone text default 'America/Bogota'
)
returns jsonb
language sql
security definer
set search_path to 'public', 'pass', 'auth'
as $$
  select pass.get_site_order_status(
    p_site_id,
    p_fulfillment_type,
    p_items,
    p_timezone
  );
$$;

revoke all on function public.get_site_order_status(uuid, text, jsonb, text) from public, anon;
grant execute on function public.get_site_order_status(uuid, text, jsonb, text) to authenticated, service_role;