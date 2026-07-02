-- VISO schedule/planning tables are accessed from server-side code through
-- createAdminClient(), which uses the service_role API role. The schema is not
-- safe to expose directly to authenticated clients until table RLS policies are
-- designed, so keep these grants limited to service_role.

grant usage on schema viso to service_role;

grant all privileges on all tables in schema viso to service_role;
grant all privileges on all sequences in schema viso to service_role;
grant execute on all functions in schema viso to service_role;

alter default privileges in schema viso
  grant all privileges on tables to service_role;

alter default privileges in schema viso
  grant all privileges on sequences to service_role;

alter default privileges in schema viso
  grant execute on functions to service_role;

notify pgrst, 'reload schema';
