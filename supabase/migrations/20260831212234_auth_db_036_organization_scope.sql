-- AUTH-DB-036
-- Materializa la autoridad organizacional raiz ORGANIZATION_SCOPE.
-- No expone org_governance ni app_private a roles cliente.
-- No modifica Supabase hosted.

begin;

do $auth_db_036_preconditions$
begin
  if to_regnamespace('org_governance') is null
     or to_regnamespace('app_private') is null then
    raise exception
      'AUTH_DB_036_REQUIRED_FOUNDATION_MISSING';
  end if;

  if to_regclass(
       'org_governance.organization_scopes'
     ) is not null then
    raise exception
      'AUTH_DB_036_TARGET_TABLE_ALREADY_EXISTS';
  end if;

  if to_regprocedure(
       'app_private.resolve_organization_id()'
     ) is not null then
    raise exception
      'AUTH_DB_036_RESOLVER_ALREADY_EXISTS';
  end if;

  if to_regprocedure(
       'org_governance.enforce_organization_scope_identity()'
     ) is not null then
    raise exception
      'AUTH_DB_036_IDENTITY_GUARD_ALREADY_EXISTS';
  end if;
end
$auth_db_036_preconditions$;

revoke all privileges
on schema org_governance
from public, anon, authenticated, service_role;

alter default privileges
for role postgres
in schema org_governance
revoke all privileges on tables
from public, anon, authenticated, service_role;

alter default privileges
for role postgres
in schema org_governance
revoke all privileges on sequences
from public, anon, authenticated, service_role;

alter default privileges
for role postgres
in schema org_governance
revoke execute on functions
from public, anon, authenticated, service_role;

create table org_governance.organization_scopes (
  organization_id uuid
    not null
    default gen_random_uuid(),

  organization_code text
    not null,

  display_name text
    not null,

  status text
    not null,

  created_at timestamptz
    not null
    default statement_timestamp(),

  updated_at timestamptz
    not null
    default statement_timestamp(),

  constraint organization_scopes_pkey
    primary key (organization_id),

  constraint organization_scopes_organization_code_key
    unique (organization_code),

  constraint organization_scopes_organization_code_not_blank
    check (btrim(organization_code) <> ''),

  constraint organization_scopes_display_name_not_blank
    check (btrim(display_name) <> ''),

  constraint organization_scopes_status_check
    check (status in ('ACTIVE', 'INACTIVE'))
);

comment on table org_governance.organization_scopes is
  'AUTH-DB-036 authoritative ORGANIZATION_SCOPE root registry.';

comment on column
  org_governance.organization_scopes.organization_id is
  'Stable immutable UUID identity of ORGANIZATION_SCOPE.';

comment on column
  org_governance.organization_scopes.organization_code is
  'Stable immutable organization code.';

alter table
  org_governance.organization_scopes
enable row level security;

revoke all privileges
on table org_governance.organization_scopes
from public, anon, authenticated, service_role;

create function
  org_governance.enforce_organization_scope_identity()
returns trigger
language plpgsql
security invoker
set search_path = ''
as $function$
begin
  if new.organization_id
       is distinct from old.organization_id then
    raise exception
      using
        errcode = '22023',
        message = 'ORGANIZATION_ID_IMMUTABLE';
  end if;

  if new.organization_code
       is distinct from old.organization_code then
    raise exception
      using
        errcode = '22023',
        message = 'ORGANIZATION_CODE_IMMUTABLE';
  end if;

  new.updated_at := pg_catalog.clock_timestamp();

  return new;
end;
$function$;

revoke execute
on function
  org_governance.enforce_organization_scope_identity()
from public, anon, authenticated, service_role;

create trigger
  organization_scopes_identity_guard
before update
on org_governance.organization_scopes
for each row
execute function
  org_governance.enforce_organization_scope_identity();

insert into org_governance.organization_scopes (
  organization_code,
  display_name,
  status
)
values (
  'VENTO_GROUP_ECOSYSTEM',
  'Vento Group — Ecosistema',
  'ACTIVE'
)
on conflict (organization_code)
do nothing;

do $auth_db_036_bootstrap_postconditions$
declare
  v_total bigint;
  v_active bigint;
begin
  select count(*)
    into v_total
  from org_governance.organization_scopes;

  if v_total <> 1 then
    raise exception
      'AUTH_DB_036_BOOTSTRAP_CARDINALITY_INVALID:%',
      v_total;
  end if;

  select count(*)
    into v_active
  from org_governance.organization_scopes
  where status = 'ACTIVE';

  if v_active <> 1 then
    raise exception
      'AUTH_DB_036_ACTIVE_CARDINALITY_INVALID:%',
      v_active;
  end if;

  if not exists (
    select 1
    from org_governance.organization_scopes
    where organization_code = 'VENTO_GROUP_ECOSYSTEM'
      and display_name = 'Vento Group — Ecosistema'
      and status = 'ACTIVE'
      and organization_id is not null
  ) then
    raise exception
      'AUTH_DB_036_BOOTSTRAP_ROOT_INVALID';
  end if;
end
$auth_db_036_bootstrap_postconditions$;

create function app_private.resolve_organization_id()
returns uuid
language plpgsql
stable
security invoker
set search_path = ''
as $function$
declare
  v_count bigint;
  v_organization_id uuid;
begin
  select count(*)
    into v_count
  from org_governance.organization_scopes
  where status = 'ACTIVE';

  if v_count = 0 then
    raise exception
      using
        errcode = 'P0001',
        message = 'ORGANIZATION_SCOPE_MISSING';
  end if;

  if v_count > 1 then
    raise exception
      using
        errcode = 'P0001',
        message = 'ORGANIZATION_SCOPE_AMBIGUOUS';
  end if;

  select organization_id
    into v_organization_id
  from org_governance.organization_scopes
  where status = 'ACTIVE';

  return v_organization_id;
end;
$function$;

comment on function
  app_private.resolve_organization_id() is
  'AUTH-DB-036 private fail-closed ORGANIZATION_SCOPE resolver.';

revoke execute
on function app_private.resolve_organization_id()
from public, anon, authenticated, service_role;

do $auth_db_036_security_postconditions$
begin
  if has_schema_privilege(
       'anon',
       'org_governance',
       'USAGE'
     )
     or has_schema_privilege(
       'authenticated',
       'org_governance',
       'USAGE'
     ) then
    raise exception
      'AUTH_DB_036_CLIENT_SCHEMA_USAGE_INVALID';
  end if;

  if has_table_privilege(
       'anon',
       'org_governance.organization_scopes',
       'SELECT'
     )
     or has_table_privilege(
       'authenticated',
       'org_governance.organization_scopes',
       'SELECT'
     ) then
    raise exception
      'AUTH_DB_036_CLIENT_TABLE_ACCESS_INVALID';
  end if;

  if has_function_privilege(
       'public',
       'app_private.resolve_organization_id()',
       'EXECUTE'
     )
     or has_function_privilege(
       'anon',
       'app_private.resolve_organization_id()',
       'EXECUTE'
     )
     or has_function_privilege(
       'authenticated',
       'app_private.resolve_organization_id()',
       'EXECUTE'
     ) then
    raise exception
      'AUTH_DB_036_CLIENT_RESOLVER_EXECUTE_INVALID';
  end if;
end
$auth_db_036_security_postconditions$;

commit;
