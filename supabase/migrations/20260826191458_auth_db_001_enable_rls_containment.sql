begin;

do $auth_db_001_precheck$
declare
  expected text[] := array[
    'app_private.delivery_pin_secrets',
    'viso.demand_forecasts',
    'viso.demand_history_hourly',
    'viso.employee_availability',
    'viso.employee_planning_limits',
    'viso.employee_shift_preferences',
    'viso.shift_generation_candidate_items',
    'viso.shift_generation_candidates',
    'viso.shift_generation_runs',
    'viso.site_operational_roles',
    'viso.site_planning_rules',
    'viso.site_staffing_requirements'
  ];
  actual text[];
  mismatch_count integer;
begin
  select coalesce(
    array_agg(n.nspname || '.' || c.relname order by n.nspname, c.relname),
    array[]::text[]
  )
  into actual
  from pg_catalog.pg_class as c
  join pg_catalog.pg_namespace as n on n.oid = c.relnamespace
  where n.nspname in ('app_private', 'viso')
    and c.relkind in ('r', 'p')
    and not c.relrowsecurity;

  if actual is distinct from expected then
    raise exception
      'AUTH_DB_001_PRECHECK_RLS_OFF_SET_MISMATCH expected=% actual=%',
      expected,
      actual;
  end if;

  with expected_state(schema_name, table_name, service_role_grants) as (
    values
      ('app_private', 'delivery_pin_secrets', 0),
      ('viso', 'demand_forecasts', 7),
      ('viso', 'demand_history_hourly', 7),
      ('viso', 'employee_availability', 7),
      ('viso', 'employee_planning_limits', 7),
      ('viso', 'employee_shift_preferences', 7),
      ('viso', 'shift_generation_candidate_items', 7),
      ('viso', 'shift_generation_candidates', 7),
      ('viso', 'shift_generation_runs', 7),
      ('viso', 'site_operational_roles', 7),
      ('viso', 'site_planning_rules', 7),
      ('viso', 'site_staffing_requirements', 7)
  )
  select count(*)
  into mismatch_count
  from expected_state as e
  left join pg_catalog.pg_namespace as n
    on n.nspname = e.schema_name
  left join pg_catalog.pg_class as c
    on c.relnamespace = n.oid
   and c.relname = e.table_name
  left join pg_catalog.pg_roles as r
    on r.oid = c.relowner
  where c.oid is null
     or c.relkind <> 'r'
     or r.rolname is distinct from 'postgres'
     or c.relrowsecurity is distinct from false
     or c.relforcerowsecurity is distinct from false
     or (
       select count(*)
       from pg_catalog.pg_policies as p
       where p.schemaname = e.schema_name
         and p.tablename = e.table_name
     ) <> 0
     or (
       select count(*)
       from information_schema.table_privileges as g
       where g.table_schema = e.schema_name
         and g.table_name = e.table_name
         and g.grantee = 'anon'
     ) <> 0
     or (
       select count(*)
       from information_schema.table_privileges as g
       where g.table_schema = e.schema_name
         and g.table_name = e.table_name
         and g.grantee = 'authenticated'
     ) <> 0
     or (
       select count(*)
       from information_schema.table_privileges as g
       where g.table_schema = e.schema_name
         and g.table_name = e.table_name
         and g.grantee = 'service_role'
     ) <> e.service_role_grants;

  if mismatch_count <> 0 then
    raise exception
      'AUTH_DB_001_PRECHECK_TABLE_STATE_MISMATCH count=%',
      mismatch_count;
  end if;
end
$auth_db_001_precheck$;

alter table app_private.delivery_pin_secrets enable row level security;
alter table viso.demand_forecasts enable row level security;
alter table viso.demand_history_hourly enable row level security;
alter table viso.employee_availability enable row level security;
alter table viso.employee_planning_limits enable row level security;
alter table viso.employee_shift_preferences enable row level security;
alter table viso.shift_generation_candidate_items enable row level security;
alter table viso.shift_generation_candidates enable row level security;
alter table viso.shift_generation_runs enable row level security;
alter table viso.site_operational_roles enable row level security;
alter table viso.site_planning_rules enable row level security;
alter table viso.site_staffing_requirements enable row level security;

do $auth_db_001_postcheck$
declare
  mismatch_count integer;
  remaining_off text[];
begin
  with expected_state(schema_name, table_name, service_role_grants) as (
    values
      ('app_private', 'delivery_pin_secrets', 0),
      ('viso', 'demand_forecasts', 7),
      ('viso', 'demand_history_hourly', 7),
      ('viso', 'employee_availability', 7),
      ('viso', 'employee_planning_limits', 7),
      ('viso', 'employee_shift_preferences', 7),
      ('viso', 'shift_generation_candidate_items', 7),
      ('viso', 'shift_generation_candidates', 7),
      ('viso', 'shift_generation_runs', 7),
      ('viso', 'site_operational_roles', 7),
      ('viso', 'site_planning_rules', 7),
      ('viso', 'site_staffing_requirements', 7)
  )
  select count(*)
  into mismatch_count
  from expected_state as e
  left join pg_catalog.pg_namespace as n
    on n.nspname = e.schema_name
  left join pg_catalog.pg_class as c
    on c.relnamespace = n.oid
   and c.relname = e.table_name
  left join pg_catalog.pg_roles as r
    on r.oid = c.relowner
  where c.oid is null
     or c.relkind <> 'r'
     or r.rolname is distinct from 'postgres'
     or c.relrowsecurity is distinct from true
     or c.relforcerowsecurity is distinct from false
     or (
       select count(*)
       from pg_catalog.pg_policies as p
       where p.schemaname = e.schema_name
         and p.tablename = e.table_name
     ) <> 0
     or (
       select count(*)
       from information_schema.table_privileges as g
       where g.table_schema = e.schema_name
         and g.table_name = e.table_name
         and g.grantee = 'anon'
     ) <> 0
     or (
       select count(*)
       from information_schema.table_privileges as g
       where g.table_schema = e.schema_name
         and g.table_name = e.table_name
         and g.grantee = 'authenticated'
     ) <> 0
     or (
       select count(*)
       from information_schema.table_privileges as g
       where g.table_schema = e.schema_name
         and g.table_name = e.table_name
         and g.grantee = 'service_role'
     ) <> e.service_role_grants;

  if mismatch_count <> 0 then
    raise exception
      'AUTH_DB_001_POSTCHECK_TABLE_STATE_MISMATCH count=%',
      mismatch_count;
  end if;

  select coalesce(
    array_agg(n.nspname || '.' || c.relname order by n.nspname, c.relname),
    array[]::text[]
  )
  into remaining_off
  from pg_catalog.pg_class as c
  join pg_catalog.pg_namespace as n on n.oid = c.relnamespace
  where n.nspname in ('app_private', 'viso')
    and c.relkind in ('r', 'p')
    and not c.relrowsecurity;

  if cardinality(remaining_off) <> 0 then
    raise exception
      'AUTH_DB_001_POSTCHECK_RLS_OFF_REMAINS actual=%',
      remaining_off;
  end if;
end
$auth_db_001_postcheck$;

commit;
