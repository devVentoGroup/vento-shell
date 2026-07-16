revoke all on function public.get_order_delivery_pin(uuid) from public;
revoke all on function public.get_order_delivery_pin(uuid) from anon;
grant execute on function public.get_order_delivery_pin(uuid) to authenticated;