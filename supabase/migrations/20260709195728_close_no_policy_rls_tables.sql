begin;

-- These tables are intentionally service-side only. Defining explicit deny
-- policies removes the RLS "enabled without policy" advisor without exposing
-- webhook payloads, secrets, counters, or planning limits to client roles.

drop policy if exists no_client_access_payments_webhook_events on payments.webhook_events;
create policy no_client_access_payments_webhook_events
on payments.webhook_events
for all
to anon, authenticated
using (false)
with check (false);

drop policy if exists no_client_access_internal_job_secrets on public.internal_job_secrets;
create policy no_client_access_internal_job_secrets
on public.internal_job_secrets
for all
to anon, authenticated
using (false)
with check (false);

drop policy if exists no_client_access_product_sku_sequences on public.product_sku_sequences;
create policy no_client_access_product_sku_sequences
on public.product_sku_sequences
for all
to anon, authenticated
using (false)
with check (false);

drop policy if exists no_client_access_role_concurrency_limits on viso.role_concurrency_limits;
create policy no_client_access_role_concurrency_limits
on viso.role_concurrency_limits
for all
to anon, authenticated
using (false)
with check (false);

commit;
