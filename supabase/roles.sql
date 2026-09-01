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

-- AUTH-DB-033
-- Isolated owner for the AccessContext resolver graph. This role cannot log in,
-- inherit ambient privileges, create database objects, or bypass RLS.
do $auth_db_033_roles$
begin
  if not exists (
    select 1
    from pg_catalog.pg_roles
    where rolname = 'vento_access_context_owner'
  ) then
    create role vento_access_context_owner
      nologin
      noinherit
      nosuperuser
      nocreatedb
      nocreaterole
      noreplication
      nobypassrls;
  end if;
end
$auth_db_033_roles$;

do $auth_db_033_roles_posture$
begin
  if not exists (
    select 1
    from pg_catalog.pg_roles r
    where r.rolname = 'vento_access_context_owner'
      and not r.rolcanlogin
      and not r.rolinherit
      and not r.rolsuper
      and not r.rolcreatedb
      and not r.rolcreaterole
      and not r.rolreplication
      and not r.rolbypassrls
  ) then
    raise exception 'AUTH_DB_033_ACCESS_CONTEXT_OWNER_POSTURE_INVALID';
  end if;
end
$auth_db_033_roles_posture$;

grant vento_access_context_owner to postgres
  with admin false, inherit false, set true;

-- AUTH-DB-035
-- Isolated owner for private context-freshness state and privileged borders.
do $auth_db_035_roles$
begin
  if not exists (
    select 1
    from pg_catalog.pg_roles
    where rolname = 'vento_context_freshness_owner'
  ) then
    create role vento_context_freshness_owner
      nologin
      noinherit
      nosuperuser
      nocreatedb
      nocreaterole
      noreplication
      nobypassrls;
  end if;
end
$auth_db_035_roles$;

do $auth_db_035_roles_posture$
begin
  if not exists (
    select 1
    from pg_catalog.pg_roles r
    where r.rolname = 'vento_context_freshness_owner'
      and not r.rolcanlogin
      and not r.rolinherit
      and not r.rolsuper
      and not r.rolcreatedb
      and not r.rolcreaterole
      and not r.rolreplication
      and not r.rolbypassrls
  ) then
    raise exception 'AUTH_DB_035_FRESHNESS_OWNER_POSTURE_INVALID';
  end if;
end
$auth_db_035_roles_posture$;

grant vento_context_freshness_owner to postgres
  with admin false, inherit false, set true;

-- AUTH-DB-034
-- Isolated technical owner for the canonical authorization evaluator,
-- its immutable runtime projections, resource resolver registry and
-- safe API projection.
do $auth_db_034_roles$
begin
  if not exists (
    select 1
    from pg_catalog.pg_roles
    where rolname = 'vento_authorization_owner'
  ) then
    create role vento_authorization_owner
      nologin
      noinherit
      nosuperuser
      nocreatedb
      nocreaterole
      noreplication
      nobypassrls;
  end if;
end
$auth_db_034_roles$;

do $auth_db_034_roles_posture$
begin
  if not exists (
    select 1
    from pg_catalog.pg_roles r
    where r.rolname = 'vento_authorization_owner'
      and not r.rolcanlogin
      and not r.rolinherit
      and not r.rolsuper
      and not r.rolcreatedb
      and not r.rolcreaterole
      and not r.rolreplication
      and not r.rolbypassrls
  ) then
    raise exception 'AUTH_DB_034_AUTHORIZATION_OWNER_POSTURE_INVALID';
  end if;
end
$auth_db_034_roles_posture$;

grant vento_authorization_owner to postgres
  with admin false, inherit false, set true;
