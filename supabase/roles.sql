-- AUTH-DB-017
-- Canonical technical DDL creator for Vento-owned future objects.
-- Supabase CLI loads this global role definition before migrations.

do $auth_db_017_roles$
begin
  if not exists (
    select 1
    from pg_catalog.pg_roles
    where rolname = 'vento_ddl_owner'
  ) then
    create role vento_ddl_owner
      nologin
      noinherit
      nosuperuser
      nocreatedb
      nocreaterole
      noreplication
      nobypassrls;
  end if;
end
$auth_db_017_roles$;

do $auth_db_017_roles_posture$
begin
  if not exists (
    select 1
    from pg_catalog.pg_roles r
    where r.rolname = 'vento_ddl_owner'
      and not r.rolcanlogin
      and not r.rolinherit
      and not r.rolsuper
      and not r.rolcreatedb
      and not r.rolcreaterole
      and not r.rolreplication
      and not r.rolbypassrls
  ) then
    raise exception 'AUTH_DB_017_DDL_OWNER_POSTURE_INVALID';
  end if;
end
$auth_db_017_roles_posture$;

grant vento_ddl_owner to postgres
  with admin false, inherit false, set true;
