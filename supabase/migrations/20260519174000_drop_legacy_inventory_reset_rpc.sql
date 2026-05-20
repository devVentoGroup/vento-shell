begin;

-- Legacy one-off reset helper. Keeping a destructive SECURITY DEFINER RPC in
-- production is unnecessary risk; if a reset is needed, run a reviewed migration.
drop function if exists public.run_nexo_inventory_reset(text);

commit;
