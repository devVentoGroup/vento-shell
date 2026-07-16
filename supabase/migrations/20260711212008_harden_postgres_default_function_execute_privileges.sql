alter default privileges for role postgres in schema public revoke execute on functions from public, anon;
alter default privileges for role postgres in schema pass revoke execute on functions from public, anon;
alter default privileges for role postgres in schema talento revoke execute on functions from public, anon;
alter default privileges for role postgres in schema vital revoke execute on functions from public, anon;
alter default privileges for role postgres in schema club revoke execute on functions from public, anon;
alter default privileges for role postgres in schema pos revoke execute on functions from public, anon;
alter default privileges for role postgres in schema payments revoke execute on functions from public, anon;
alter default privileges for role postgres in schema viso revoke execute on functions from public, anon;

alter default privileges for role postgres in schema public grant execute on functions to service_role;
alter default privileges for role postgres in schema pass grant execute on functions to service_role;
alter default privileges for role postgres in schema talento grant execute on functions to service_role;
alter default privileges for role postgres in schema vital grant execute on functions to service_role;
alter default privileges for role postgres in schema club grant execute on functions to service_role;
alter default privileges for role postgres in schema pos grant execute on functions to service_role;
alter default privileges for role postgres in schema payments grant execute on functions to service_role;
alter default privileges for role postgres in schema viso grant execute on functions to service_role;