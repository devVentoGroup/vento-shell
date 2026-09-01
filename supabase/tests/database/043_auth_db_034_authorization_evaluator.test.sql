-- VENTO_DB_TEST_CATEGORY: RPC
begin;

create extension if not exists
  pgtap
with schema extensions;

select plan(154);

create temporary table
  auth_db_034_fixture
on commit drop
as
select
  (
    select role_code
    from
      app_private.authorization_base_role_grants
    where dataset_version = '1.1.0'
      and permission_key = 'shell.access'
    order by role_code
    limit 1
  ) as shell_base_role,

  (
    select operational_role_code
    from
      app_private.authorization_operational_role_grants
    where dataset_version = '1.0.0'
      and permission_key = 'pulso.access'
    order by operational_role_code
    limit 1
  ) as pulso_operational_role,

  (
    select role_code
    from
      app_private.authorization_base_role_grants
    where dataset_version = '1.1.0'
      and permission_key = 'nexo.access'
    order by role_code
    limit 1
  ) as nexo_base_role,

  (
    select operational_role_code
    from
      app_private.authorization_operational_role_grants
    where dataset_version = '1.0.0'
      and permission_key = 'nexo.access'
    order by operational_role_code
    limit 1
  ) as nexo_operational_role,

  (
    select p.permission_key
    from
      app_private.authorization_permission_contracts p
    join
      app_private.authorization_operational_role_grants g
        on g.permission_key =
           p.permission_key
       and g.dataset_version =
           '1.0.0'
    where p.catalog_version =
          '1.1.0'
      and p.status =
          'ACTIVE'
      and coalesce(
            (
              p.contract_snapshot #>>
                '{operational_lane,requires_checkin}'
            )::boolean,
            false
          )
    order by p.permission_key
    limit 1
  ) as tc_permission,

  (
    select p.app_code
    from
      app_private.authorization_permission_contracts p
    join
      app_private.authorization_operational_role_grants g
        on g.permission_key =
           p.permission_key
       and g.dataset_version =
           '1.0.0'
    where p.catalog_version =
          '1.1.0'
      and p.status =
          'ACTIVE'
      and coalesce(
            (
              p.contract_snapshot #>>
                '{operational_lane,requires_checkin}'
            )::boolean,
            false
          )
    order by p.permission_key
    limit 1
  ) as tc_app,

  (
    select g.operational_role_code
    from
      app_private.authorization_permission_contracts p
    join
      app_private.authorization_operational_role_grants g
        on g.permission_key =
           p.permission_key
       and g.dataset_version =
           '1.0.0'
    where p.catalog_version =
          '1.1.0'
      and p.status =
          'ACTIVE'
      and coalesce(
            (
              p.contract_snapshot #>>
                '{operational_lane,requires_checkin}'
            )::boolean,
            false
          )
    order by
      p.permission_key,
      g.operational_role_code
    limit 1
  ) as tc_operational_role,

  (
    select p.permission_key
    from
      app_private.authorization_permission_contracts p
    join
      app_private.authorization_base_role_grants b
        on b.permission_key =
           p.permission_key
       and b.dataset_version =
           '1.1.0'
    join
      app_private.authorization_operational_role_grants o
        on o.permission_key =
           p.permission_key
       and o.dataset_version =
           '1.0.0'
    where p.catalog_version =
          '1.1.0'
      and p.status =
          'ACTIVE'
      and p.contract_snapshot ->>
          'authorization_requirement'
          = 'BASE_AND_OPERATIONAL'
    order by p.permission_key
    limit 1
  ) as both_permission,

  (
    select p.app_code
    from
      app_private.authorization_permission_contracts p
    join
      app_private.authorization_base_role_grants b
        on b.permission_key =
           p.permission_key
       and b.dataset_version =
           '1.1.0'
    join
      app_private.authorization_operational_role_grants o
        on o.permission_key =
           p.permission_key
       and o.dataset_version =
           '1.0.0'
    where p.catalog_version =
          '1.1.0'
      and p.status =
          'ACTIVE'
      and p.contract_snapshot ->>
          'authorization_requirement'
          = 'BASE_AND_OPERATIONAL'
    order by p.permission_key
    limit 1
  ) as both_app,

  (
    select b.role_code
    from
      app_private.authorization_permission_contracts p
    join
      app_private.authorization_base_role_grants b
        on b.permission_key =
           p.permission_key
       and b.dataset_version =
           '1.1.0'
    join
      app_private.authorization_operational_role_grants o
        on o.permission_key =
           p.permission_key
       and o.dataset_version =
           '1.0.0'
    where p.catalog_version =
          '1.1.0'
      and p.status =
          'ACTIVE'
      and p.contract_snapshot ->>
          'authorization_requirement'
          = 'BASE_AND_OPERATIONAL'
    order by
      p.permission_key,
      b.role_code
    limit 1
  ) as both_base_role,

  (
    select o.operational_role_code
    from
      app_private.authorization_permission_contracts p
    join
      app_private.authorization_base_role_grants b
        on b.permission_key =
           p.permission_key
       and b.dataset_version =
           '1.1.0'
    join
      app_private.authorization_operational_role_grants o
        on o.permission_key =
           p.permission_key
       and o.dataset_version =
           '1.0.0'
    where p.catalog_version =
          '1.1.0'
      and p.status =
          'ACTIVE'
      and p.contract_snapshot ->>
          'authorization_requirement'
          = 'BASE_AND_OPERATIONAL'
    order by
      p.permission_key,
      o.operational_role_code
    limit 1
  ) as both_operational_role;

do $auth_db_034_fixture_guard$
declare
  v_fixture auth_db_034_fixture%rowtype;
begin
  select *
  into v_fixture
  from auth_db_034_fixture;

  if v_fixture.shell_base_role is null
     or v_fixture.pulso_operational_role is null
     or v_fixture.nexo_base_role is null
     or v_fixture.nexo_operational_role is null
     or v_fixture.tc_permission is null
     or v_fixture.tc_app is null
     or v_fixture.tc_operational_role is null
     or v_fixture.both_permission is null
     or v_fixture.both_app is null
     or v_fixture.both_base_role is null
     or v_fixture.both_operational_role is null then
    raise exception 'AUTH_DB_034_PGTAP_FIXTURE_INCOMPLETE';
  end if;
end
$auth_db_034_fixture_guard$;

create function
  pg_temp.auth_db_034_request(
    p_app text,
    p_permission text,
    p_operation text,
    p_mode text
  )
returns jsonb
language sql
immutable
as $auth_db_034_request$
  select
    pg_catalog.jsonb_build_object(
      'contract_family',
      'vento.authorization.request-contracts',
      'contract_family_version',
      '1.0.0',
      'contract_name',
      'AuthorizationEvaluationRequest',
      'contract_version',
      '1.0.0',
      'schema_version',
      '1.0.0',
      'correlation_id',
      'AUTH-DB-034-PGTAP',
      'request',
      pg_catalog.jsonb_build_object(
        'app_code',
        p_app,
        'permission_key',
        p_permission,
        'operation_kind',
        p_operation,
        'resource_request',
        case p_mode
          when 'NON_RESOURCE' then
            pg_catalog.jsonb_build_object(
              'mode',
              p_mode
            )
          when 'EXISTING_RESOURCE' then
            pg_catalog.jsonb_build_object(
              'mode',
              p_mode,
              'locator',
              pg_catalog.jsonb_build_object(
                'id',
                'AUTH-DB-034-FIXTURE'
              )
            )
          when 'RESOURCE_DRAFT' then
            pg_catalog.jsonb_build_object(
              'mode',
              p_mode,
              'draft',
              pg_catalog.jsonb_build_object(
                'fixture',
                true
              )
            )
          when 'COLLECTION' then
            pg_catalog.jsonb_build_object(
              'mode',
              p_mode,
              'server_filter',
              pg_catalog.jsonb_build_object(
                'fixture',
                true
              )
            )
          when 'AGGREGATE' then
            pg_catalog.jsonb_build_object(
              'mode',
              p_mode,
              'server_filter',
              pg_catalog.jsonb_build_object(
                'fixture',
                true
              )
            )
          when 'BULK' then
            pg_catalog.jsonb_build_object(
              'mode',
              p_mode,
              'items',
              pg_catalog.jsonb_build_array(
                pg_catalog.jsonb_build_object(
                  'id',
                  'AUTH-DB-034-FIXTURE'
                )
              )
            )
          else
            pg_catalog.jsonb_build_object(
              'mode',
              p_mode
            )
        end,
        'requested_fields',
        pg_catalog.jsonb_build_array(),
        'request_source',
        'SERVER_ACTION'
      )
    );
$auth_db_034_request$;

create function
  pg_temp.auth_db_034_context(
    p_base_role text,
    p_operational_role text,
    p_with_shift boolean,
    p_with_checkin boolean,
    p_with_device boolean
  )
returns jsonb
language sql
stable
as $auth_db_034_context$
  select
    pg_catalog.jsonb_build_object(
      'contract_family',
      'vento.authorization.response-contracts',
      'contract_family_version',
      '1.0.0',
      'contract_name',
      'AccessContext',
      'contract_version',
      '1.0.0',
      'schema_version',
      '1.0.0',
      'context_id',
      '03400000-0000-0000-0000-000000000001',
      'resolved_at',
      pg_catalog.to_char(
        pg_catalog.statement_timestamp()
          at time zone 'UTC',
        'YYYY-MM-DD"T"HH24:MI:SS.MS"Z"'
      ),
      'principal',
      pg_catalog.jsonb_build_object(
        'principal_type',
        case
          when p_with_device
          then 'SHARED_DEVICE'
          else 'HUMAN_USER'
        end,
        'auth_user_id',
        '03400000-0000-0000-0000-000000000002',
        'session_id',
        'AUTH-DB-034-SESSION',
        'authenticated',
        true,
        'authentication_method',
        'PASSWORD',
        'authenticated_at',
        pg_catalog.statement_timestamp()::text,
        'session_expires_at',
        (
          pg_catalog.statement_timestamp()
          + interval '1 hour'
        )::text,
        'principal_status',
        'VALID'
      ),
      'actor_effective',
      pg_catalog.jsonb_build_object(
        'actor_type',
        'EMPLOYEE',
        'actor_id',
        '03400000-0000-0000-0000-000000000003',
        'attribution_source',
        case
          when p_with_device
          then 'DEVICE_ACTOR_SESSION'
          else 'PERSONAL_SESSION'
        end,
        'delegation_id',
        null,
        'resolved',
        true
      ),
      'domain_identity',
      pg_catalog.jsonb_build_object(
        'identity_type',
        'EMPLOYEE',
        'identity_id',
        '03400000-0000-0000-0000-000000000003',
        'status',
        'ACTIVE',
        'source',
        'AUTH_DB_034_PGTAP'
      ),
      'employee',
      pg_catalog.jsonb_build_object(
        'employee_id',
        '03400000-0000-0000-0000-000000000003',
        'auth_user_id',
        '03400000-0000-0000-0000-000000000002',
        'is_active',
        true,
        'employment_status',
        'ACTIVE',
        'base_role_code',
        p_base_role
      ),
      'base_role',
      case
        when p_base_role is null
        then 'null'::jsonb
        else pg_catalog.jsonb_build_object(
          'role_code',
          p_base_role,
          'role_status',
          'ACTIVE',
          'assignment_source',
          'AUTH_DB_034_PGTAP'
        )
      end,
      'assigned_sites',
      pg_catalog.jsonb_build_array(
        pg_catalog.jsonb_build_object(
          'site_id',
          '03400000-0000-0000-0000-000000000010',
          'site_code',
          'AUTH_DB_034_SITE',
          'is_primary',
          true,
          'assignment_active',
          true,
          'site_active',
          true,
          'assignable',
          true
        )
      ),
      'assigned_areas',
      pg_catalog.jsonb_build_array(
        pg_catalog.jsonb_build_object(
          'area_id',
          '03400000-0000-0000-0000-000000000011',
          'site_id',
          '03400000-0000-0000-0000-000000000010',
          'area_kind',
          'warehouse',
          'is_primary_for_site',
          true,
          'assignment_active',
          true,
          'area_active',
          true
        )
      ),
      'administrative_coverage',
      pg_catalog.jsonb_build_object(
        'mode',
        'ASSIGNED_SITES',
        'site_ids',
        pg_catalog.jsonb_build_array(
          '03400000-0000-0000-0000-000000000010'
        ),
        'area_ids',
        pg_catalog.jsonb_build_array(
          '03400000-0000-0000-0000-000000000011'
        ),
        'source',
        'AUTH_DB_034_PGTAP',
        'valid',
        true
      ),
      'active_shift',
      case
        when p_with_shift
        then pg_catalog.jsonb_build_object(
          'shift_id',
          '03400000-0000-0000-0000-000000000020',
          'employee_id',
          '03400000-0000-0000-0000-000000000003',
          'site_id',
          '03400000-0000-0000-0000-000000000010',
          'area_id',
          '03400000-0000-0000-0000-000000000011',
          'operational_role_code',
          p_operational_role,
          'starts_at',
          (
            pg_catalog.statement_timestamp()
            - interval '1 hour'
          )::text,
          'ends_at',
          (
            pg_catalog.statement_timestamp()
            + interval '1 hour'
          )::text,
          'shift_status',
          'ACTIVE',
          'published',
          true,
          'currently_valid',
          true
        )
        else 'null'::jsonb
      end,
      'active_checkin_session',
      case
        when p_with_checkin
        then pg_catalog.jsonb_build_object(
          'checkin_session_id',
          '03400000-0000-0000-0000-000000000021',
          'employee_id',
          '03400000-0000-0000-0000-000000000003',
          'shift_id',
          '03400000-0000-0000-0000-000000000020',
          'site_id',
          '03400000-0000-0000-0000-000000000010',
          'area_id',
          '03400000-0000-0000-0000-000000000011',
          'checked_in_at',
          pg_catalog.statement_timestamp()::text,
          'expires_at',
          null,
          'checked_out_at',
          null,
          'status',
          'ACTIVE'
        )
        else 'null'::jsonb
      end,
      'operational_role',
      case
        when p_with_shift
             and p_operational_role
                 is not null
        then pg_catalog.jsonb_build_object(
          'role_code',
          p_operational_role,
          'shift_id',
          '03400000-0000-0000-0000-000000000020',
          'site_id',
          '03400000-0000-0000-0000-000000000010',
          'area_id',
          '03400000-0000-0000-0000-000000000011',
          'valid_for_site',
          true,
          'valid_for_area',
          true
        )
        else 'null'::jsonb
      end,
      'operational_site',
      case
        when p_with_shift
        then pg_catalog.jsonb_build_object(
          'site_id',
          '03400000-0000-0000-0000-000000000010',
          'source_shift_id',
          '03400000-0000-0000-0000-000000000020',
          'site_active',
          true,
          'assignment_valid',
          true
        )
        else 'null'::jsonb
      end,
      'operational_area',
      case
        when p_with_shift
        then pg_catalog.jsonb_build_object(
          'area_id',
          '03400000-0000-0000-0000-000000000011',
          'site_id',
          '03400000-0000-0000-0000-000000000010',
          'area_kind',
          'warehouse',
          'source',
          'SHIFT',
          'area_active',
          true,
          'compatible_with_role',
          true
        )
        else 'null'::jsonb
      end,
      'device_context',
      case
        when p_with_device
        then pg_catalog.jsonb_build_object(
          'device_id',
          '03400000-0000-0000-0000-000000000030',
          'device_code',
          'AUTH_DB_034_DEVICE',
          'device_type',
          'SHARED_TERMINAL',
          'device_status',
          'ACTIVE',
          'authenticated_as_device',
          true,
          'actor_session_id',
          'AUTH_DB_034_ACTOR_SESSION',
          'actor_session_expires_at',
          (
            pg_catalog.statement_timestamp()
            + interval '1 hour'
          )::text,
          'allowed_application_codes',
          pg_catalog.jsonb_build_array(
            'shell',
            'anima',
            'aura',
            'fogo',
            'nexo',
            'numera',
            'origo',
            'pass',
            'pulso',
            'viso'
          ),
          'capability_package_code',
          'AUTH_DB_034_PGTAP'
        )
        else 'null'::jsonb
      end,
      'lane_readiness',
      pg_catalog.jsonb_build_object(
        'base',
        pg_catalog.jsonb_build_object(
          'status',
          case
            when p_base_role is null
            then 'NOT_APPLICABLE'
            else 'READY'
          end,
          'reason_codes',
          '[]'::jsonb
        ),
        'operational',
        pg_catalog.jsonb_build_object(
          'status',
          case
            when p_with_shift
                 and p_operational_role
                     is not null
            then 'READY'
            else 'UNAVAILABLE'
          end,
          'reason_codes',
          '[]'::jsonb
        )
      ),
      'structural_issues',
      '[]'::jsonb,
      'resolution_metadata',
      pg_catalog.jsonb_build_object(
        'resolver',
        'AUTH_DB_034_PGTAP',
        'resolver_version',
        '1.0.0',
        'authorization_contract_version',
        '1.0.0',
        'catalog_version',
        '1.1.0',
        'source_versions',
        '{}'::jsonb,
        'source_fingerprints',
        '{}'::jsonb,
        'cache_status',
        'BYPASS'
      )
    );
$auth_db_034_context$;

create function
  pg_temp.auth_db_034_eval(
    p_request jsonb,
    p_context jsonb,
    p_stack text[] default '{}'::text[],
    p_depth integer default 0
  )
returns jsonb
language sql
volatile
as $auth_db_034_eval$
  select
    app_private.evaluate_authorization_core(
      app_private.validate_authorization_evaluation_request(
        p_request
      ),
      p_context,
      extensions.gen_random_uuid(),
      pg_catalog.statement_timestamp(),
      p_stack,
      p_depth
    );
$auth_db_034_eval$;

create function
  pg_temp.auth_db_034_invalid_mode_sqlstate()
returns text
language plpgsql
as $auth_db_034_invalid_mode$
begin
  perform
    app_private.resolve_authorization_resource(
      'shell.access.v1',
      pg_catalog.jsonb_build_object(
        'mode',
        'INVALID_MODE'
      ),
      'APP_ACCESS',
      '{}'::text[]
    );

  return null;
exception
  when others then
    return SQLSTATE;
end
$auth_db_034_invalid_mode$;

create function
  pg_temp.auth_db_034_null_resource_sqlstate()
returns text
language plpgsql
as $auth_db_034_null_resource$
begin
  perform
    app_private.resolve_authorization_resource(
      'shell.access.v1',
      null,
      'APP_ACCESS',
      '{}'::text[]
    );

  return null;
exception
  when others then
    return SQLSTATE;
end
$auth_db_034_null_resource$;

create temporary table
  auth_db_034_shell_snapshot
on commit drop
as
select contract_snapshot
from
  app_private.authorization_permission_contracts
where catalog_id =
      'vento.authorization'
  and catalog_version =
      '1.1.0'
  and permission_key =
      'shell.access';

create temporary table
  auth_db_034_resource_fixture
on commit drop
as
select
  (
    select resource_contract_id
    from
      app_private.authorization_permission_contracts
    where catalog_version =
          '1.1.0'
      and permission_key =
          'shell.access'
  ) as shell_resource_contract_id,
  (
    select resource_contract_id
    from
      app_private.authorization_permission_contracts
    where catalog_version =
          '1.1.0'
      and permission_key =
          'nexo.inventory.stock.view'
  ) as stock_resource_contract_id;

-- ==========================================================
-- 1-6 — Signature
-- ==========================================================

select ok(
  pg_catalog.to_regprocedure(
    'app_private.evaluate_authorization(jsonb)'
  ) is not null,
  '1 issuer exact signature exists'
);

select is(
  pg_catalog.pg_get_function_result(
    'app_private.evaluate_authorization(jsonb)'::regprocedure
  ),
  'jsonb',
  '2 issuer returns jsonb'
);

select is(
  (
    select p.provolatile::text
    from pg_catalog.pg_proc p
    where p.oid =
      'app_private.evaluate_authorization(jsonb)'::regprocedure
  ),
  'v',
  '3 issuer is VOLATILE'
);

select ok(
  (
    select p.prosecdef
    from pg_catalog.pg_proc p
    where p.oid =
      'app_private.evaluate_authorization(jsonb)'::regprocedure
  ),
  '4 issuer is SECURITY DEFINER'
);

select ok(
  (
    select
      coalesce(
        p.proconfig,
        '{}'::text[]
      ) @>
      array[
        'search_path=pg_catalog, app_private'
      ]::text[]
    from pg_catalog.pg_proc p
    where p.oid =
      'app_private.evaluate_authorization(jsonb)'::regprocedure
  ),
  '5 issuer search_path is hardened'
);

select ok(
  pg_catalog.to_regprocedure(
    'app_private.evaluate_authorization_core(jsonb,jsonb,uuid,timestamptz,text[],integer)'
  ) is not null,
  '6 core exact signature exists'
);

-- ==========================================================
-- 7-16 — Permission contract
-- ==========================================================

select is(
  (
    select pg_catalog.count(*)
    from
      app_private.authorization_contract_releases
    where catalog_id =
          'vento.authorization'
      and status =
          'ACTIVE'
  ),
  1::bigint,
  '7 exactly one ACTIVE release'
);

select is(
  (
    select catalog_version
    from
      app_private.authorization_contract_releases
    where catalog_id =
          'vento.authorization'
      and status =
          'ACTIVE'
  ),
  '1.1.0',
  '8 active catalog is 1.1.0'
);

select is(
  (
    select permission_count::bigint
    from
      app_private.authorization_contract_releases
    where catalog_id =
          'vento.authorization'
      and status =
          'ACTIVE'
  ),
  (
    select pg_catalog.count(*)
    from
      app_private.authorization_permission_contracts
    where catalog_id =
          'vento.authorization'
      and catalog_version =
          '1.1.0'
      and status =
          'ACTIVE'
  ),
  '9 declared permission count reconciles'
);

select is(
  (
    select pg_catalog.count(*)
    from
      app_private.authorization_permission_contracts
    where catalog_version =
          '1.1.0'
      and status =
          'ACTIVE'
  ),
  140::bigint,
  '10 observed active release contains 140 permissions'
);

select is(
  (
    select pg_catalog.count(
      distinct permission_key
    )
    from
      app_private.authorization_permission_contracts
    where catalog_version =
          '1.1.0'
      and status =
          'ACTIVE'
  ),
  140::bigint,
  '11 active PermissionKey are unique'
);

select is(
  (
    select pg_catalog.count(
      distinct resource_contract_id
    )
    from
      app_private.authorization_permission_contracts
    where catalog_version =
          '1.1.0'
      and status =
          'ACTIVE'
  ),
  140::bigint,
  '12 effective resource contract identities are unique'
);

select is(
  (
    select pg_catalog.count(*)
    from
      app_private.authorization_permission_contracts
    where catalog_version =
          '1.1.0'
      and contract_fingerprint
          ~ '^sha256:[0-9a-f]{64}$'
  ),
  140::bigint,
  '13 every permission snapshot has a canonical fingerprint'
);

select is(
  (
    select pg_catalog.count(*)
    from
      app_private.authorization_permission_contracts p
    join
      app_private.authorization_resource_resolver_registry r
        on r.resource_contract_id =
           p.resource_contract_id
       and r.status =
           'ACTIVE'
    where p.catalog_version =
          '1.1.0'
      and p.status =
          'ACTIVE'
  ),
  140::bigint,
  '14 every active permission has an active resolver contract'
);

select ok(
  app_private.resolve_permission_contract_snapshot(
    'shell',
    'not.registered.permission'
  ) is null,
  '15 unknown permission resolves to no snapshot'
);

select ok(
  (
    app_private.resolve_permission_contract_snapshot(
      'shell',
      'shell.access'
    ) ->> 'authorization_requirement'
  ) = 'BASE_ONLY'
  and (
    app_private.resolve_permission_contract_snapshot(
      'shell',
      'shell.access'
    ) ->> 'resource_type'
  ) = 'APP_SURFACE',
  '16 shell.access preserves exact modality and resource type'
);

-- ==========================================================
-- 17-28 — Context
-- ==========================================================

select is(
  (
    pg_temp.auth_db_034_eval(
      pg_temp.auth_db_034_request(
        'shell',
        'shell.access',
        'APP_ACCESS',
        'NON_RESOURCE'
      ),
      pg_temp.auth_db_034_context(
        (
          select shell_base_role
          from auth_db_034_fixture
        ),
        null,
        false,
        false,
        false
      )
    ) ->> 'final_decision'
  ),
  'ALLOW',
  '17 valid base context authorizes shell.access'
);

select is(
  (
    pg_temp.auth_db_034_eval(
      pg_temp.auth_db_034_request(
        'shell',
        'shell.access',
        'APP_ACCESS',
        'NON_RESOURCE'
      ),
      pg_catalog.jsonb_set(
        pg_temp.auth_db_034_context(
          (
            select shell_base_role
            from auth_db_034_fixture
          ),
          null,
          false,
          false,
          false
        ),
        '{principal,authenticated}',
        'false'::jsonb
      )
    ) ->> 'final_decision'
  ),
  'DENY',
  '18 unauthenticated principal denies'
);

select is(
  (
    pg_temp.auth_db_034_eval(
      pg_temp.auth_db_034_request(
        'shell',
        'shell.access',
        'APP_ACCESS',
        'NON_RESOURCE'
      ),
      pg_catalog.jsonb_set(
        pg_catalog.jsonb_set(
          pg_temp.auth_db_034_context(
            (
              select shell_base_role
              from auth_db_034_fixture
            ),
            null,
            false,
            false,
            false
          ),
          '{actor_effective,resolved}',
          'false'::jsonb
        ),
        '{actor_effective,actor_id}',
        'null'::jsonb
      )
    ) ->> 'final_decision'
  ),
  'DENY',
  '19 unresolved effective actor denies'
);

select is(
  (
    pg_temp.auth_db_034_eval(
      pg_temp.auth_db_034_request(
        'shell',
        'shell.access',
        'APP_ACCESS',
        'NON_RESOURCE'
      ),
      pg_catalog.jsonb_set(
        pg_temp.auth_db_034_context(
          (
            select shell_base_role
            from auth_db_034_fixture
          ),
          null,
          false,
          false,
          false
        ),
        '{employee,is_active}',
        'false'::jsonb
      )
    ) ->> 'final_decision'
  ),
  'DENY',
  '20 inactive employee denies'
);

select is(
  (
    pg_temp.auth_db_034_eval(
      pg_temp.auth_db_034_request(
        'shell',
        'shell.access',
        'APP_ACCESS',
        'NON_RESOURCE'
      ),
      pg_catalog.jsonb_set(
        pg_temp.auth_db_034_context(
          (
            select shell_base_role
            from auth_db_034_fixture
          ),
          null,
          false,
          false,
          false
        ),
        '{lane_readiness,base,status}',
        '"UNAVAILABLE"'::jsonb
      )
    ) ->> 'final_decision'
  ),
  'DENY',
  '21 unavailable base lane denies'
);

select is(
  (
    pg_temp.auth_db_034_eval(
      pg_temp.auth_db_034_request(
        'shell',
        'shell.access',
        'APP_ACCESS',
        'NON_RESOURCE'
      ),
      pg_catalog.jsonb_set(
        pg_temp.auth_db_034_context(
          (
            select shell_base_role
            from auth_db_034_fixture
          ),
          null,
          false,
          false,
          false
        ),
        '{base_role,role_status}',
        '"INACTIVE"'::jsonb
      )
    ) ->> 'final_decision'
  ),
  'DENY',
  '22 inactive base role denies'
);

select is(
  (
    pg_temp.auth_db_034_eval(
      pg_temp.auth_db_034_request(
        'shell',
        'shell.access',
        'APP_ACCESS',
        'NON_RESOURCE'
      ),
      pg_temp.auth_db_034_context(
        (
          select shell_base_role
          from auth_db_034_fixture
        ),
        null,
        false,
        false,
        false
      )
    ) #>> '{base_decision,outcome}'
  ),
  'ALLOW',
  '23 base lane independently authorizes'
);

select is(
  (
    pg_temp.auth_db_034_eval(
      pg_temp.auth_db_034_request(
        'shell',
        'shell.access',
        'APP_ACCESS',
        'NON_RESOURCE'
      ),
      pg_temp.auth_db_034_context(
        '__AUTH_DB_034_NO_ROLE__',
        null,
        false,
        false,
        false
      )
    ) ->> 'final_decision'
  ),
  'DENY',
  '24 unknown base role does not authorize'
);

select is(
  (
    pg_temp.auth_db_034_eval(
      pg_temp.auth_db_034_request(
        'shell',
        'shell.access',
        'APP_ACCESS',
        'NON_RESOURCE'
      ),
      pg_temp.auth_db_034_context(
        (
          select shell_base_role
          from auth_db_034_fixture
        ),
        null,
        false,
        false,
        false
      )
    ) #>> '{operational_decision,evaluated}'
  ),
  'false',
  '25 non-admitted operational lane is not evaluated'
);

select is(
  (
    pg_temp.auth_db_034_eval(
      pg_temp.auth_db_034_request(
        'pulso',
        'pulso.access',
        'APP_ACCESS',
        'NON_RESOURCE'
      ),
      pg_temp.auth_db_034_context(
        null,
        (
          select pulso_operational_role
          from auth_db_034_fixture
        ),
        true,
        false,
        false
      )
    ) #>> '{base_decision,evaluated}'
  ),
  'false',
  '26 non-admitted base lane is not evaluated'
);

select is(
  (
    pg_temp.auth_db_034_eval(
      pg_temp.auth_db_034_request(
        'shell',
        'shell.access',
        'APP_ACCESS',
        'NON_RESOURCE'
      ),
      pg_catalog.jsonb_set(
        pg_temp.auth_db_034_context(
          (
            select shell_base_role
            from auth_db_034_fixture
          ),
          null,
          false,
          false,
          false
        ),
        '{structural_issues}',
        pg_catalog.jsonb_build_array(
          pg_catalog.jsonb_build_object(
            'issue_code',
            'AUTH_CONTEXT_CONTRACT_INVALID'
          )
        )
      )
    ) ->> 'final_decision'
  ),
  'DENY',
  '27 structural context issue is fail closed'
);

select ok(
  (
    pg_temp.auth_db_034_eval(
      pg_temp.auth_db_034_request(
        'shell',
        'shell.access',
        'APP_ACCESS',
        'NON_RESOURCE'
      ),
      pg_temp.auth_db_034_context(
        (
          select shell_base_role
          from auth_db_034_fixture
        ),
        null,
        false,
        false,
        false
      )
    ) #>>
      '{access_context_ref,context_fingerprint}'
  ) ~ '^sha256:[0-9a-f]{64}$',
  '28 decision carries deterministic context fingerprint'
);

-- ==========================================================
-- 29-54 — Resource
-- ==========================================================

select is(
  (
    app_private.resolve_authorization_resource(
      (
        select shell_resource_contract_id
        from auth_db_034_resource_fixture
      ),
      pg_catalog.jsonb_build_object(
        'mode',
        'NON_RESOURCE'
      ),
      'APP_ACCESS',
      '{}'::text[]
    ) ->> 'resolution_state'
  ),
  'NOT_APPLICABLE',
  '29 APP_SURFACE NON_RESOURCE resolves as NOT_APPLICABLE'
);

select ok(
  (
    app_private.resolve_authorization_resource(
      (
        select shell_resource_contract_id
        from auth_db_034_resource_fixture
      ),
      pg_catalog.jsonb_build_object(
        'mode',
        'NON_RESOURCE'
      ),
      'APP_ACCESS',
      '{}'::text[]
    ) ->> 'resource_fingerprint'
  ) ~ '^sha256:[0-9a-f]{64}$',
  '30 APP_SURFACE produces resource fingerprint'
);

select is(
  (
    app_private.resolve_authorization_resource(
      (
        select shell_resource_contract_id
        from auth_db_034_resource_fixture
      ),
      pg_catalog.jsonb_build_object(
        'mode',
        'NON_RESOURCE'
      ),
      'APP_ACCESS',
      '{}'::text[]
    ) ->> 'resource_type'
  ),
  'APP_SURFACE',
  '31 APP_SURFACE type is preserved'
);

select is(
  (
    app_private.resolve_authorization_resource(
      (
        select shell_resource_contract_id
        from auth_db_034_resource_fixture
      ),
      pg_catalog.jsonb_build_object(
        'mode',
        'EXISTING_RESOURCE',
        'locator',
        pg_catalog.jsonb_build_object(
          'id',
          'fixture'
        )
      ),
      'APP_ACCESS',
      '{}'::text[]
    ) ->> 'resolution_state'
  ),
  'CONFLICT',
  '32 APP_SURFACE rejects existing-resource mode'
);

select is(
  (
    app_private.resolve_authorization_resource(
      (
        select stock_resource_contract_id
        from auth_db_034_resource_fixture
      ),
      pg_catalog.jsonb_build_object(
        'mode',
        'EXISTING_RESOURCE',
        'locator',
        pg_catalog.jsonb_build_object(
          'id',
          'fixture'
        )
      ),
      'READ',
      '{}'::text[]
    ) ->> 'resolution_state'
  ),
  'UNRESOLVED',
  '33 unresolved owner lookup fails closed'
);

select is(
  (
    app_private.resolve_authorization_resource(
      (
        select stock_resource_contract_id
        from auth_db_034_resource_fixture
      ),
      pg_catalog.jsonb_build_object(
        'mode',
        'EXISTING_RESOURCE',
        'locator',
        pg_catalog.jsonb_build_object(
          'id',
          'fixture'
        )
      ),
      'READ',
      '{}'::text[]
    ) ->> 'resource_type'
  ),
  (
    select contract_snapshot ->>
      'resource_type'
    from
      app_private.authorization_permission_contracts
    where catalog_version =
          '1.1.0'
      and permission_key =
          'nexo.inventory.stock.view'
  ),
  '34 unresolved resolver preserves canonical resource type'
);

select ok(
  (
    app_private.resolve_authorization_resource(
      (
        select stock_resource_contract_id
        from auth_db_034_resource_fixture
      ),
      pg_catalog.jsonb_build_object(
        'mode',
        'EXISTING_RESOURCE',
        'locator',
        pg_catalog.jsonb_build_object(
          'id',
          'fixture'
        )
      ),
      'READ',
      '{}'::text[]
    ) ->> 'resource_fingerprint'
  ) ~ '^sha256:[0-9a-f]{64}$',
  '35 unresolved resource still has evidence fingerprint'
);

select is(
  (
    app_private.resolve_authorization_resource(
      (
        select stock_resource_contract_id
        from auth_db_034_resource_fixture
      ),
      pg_catalog.jsonb_build_object(
        'mode',
        'NON_RESOURCE'
      ),
      'READ',
      '{}'::text[]
    ) ->> 'resolution_state'
  ),
  'CONFLICT',
  '36 NON_RESOURCE is not a fallback for a real resource'
);

select is(
  (
    app_private.resolve_authorization_resource(
      'AUTH-DB-034-NOT-REGISTERED',
      pg_catalog.jsonb_build_object(
        'mode',
        'EXISTING_RESOURCE',
        'locator',
        pg_catalog.jsonb_build_object(
          'id',
          'fixture'
        )
      ),
      'READ',
      '{}'::text[]
    ) ->> 'resolution_state'
  ),
  'UNRESOLVED',
  '37 unknown resource contract is fail closed'
);

select is(
  (
    app_private.resolve_authorization_resource(
      (
        select stock_resource_contract_id
        from auth_db_034_resource_fixture
      ),
      pg_catalog.jsonb_build_object(
        'mode',
        'EXISTING_RESOURCE',
        'locator',
        pg_catalog.jsonb_build_object(
          'id',
          'fixture'
        )
      ),
      'READ',
      array[
        'z',
        'a',
        'z'
      ]::text[]
    ) -> 'requested_fields'
  ),
  '["a", "z"]'::jsonb,
  '38 requested fields normalize deterministically'
);

select ok(
  not (
    app_private.resolve_authorization_resource(
      (
        select stock_resource_contract_id
        from auth_db_034_resource_fixture
      ),
      pg_catalog.jsonb_build_object(
        'mode',
        'EXISTING_RESOURCE',
        'locator',
        pg_catalog.jsonb_build_object(
          'secret',
          'do-not-echo'
        )
      ),
      'READ',
      '{}'::text[]
    ) ? 'locator'
  ),
  '39 client locator is never echoed as authoritative state'
);

select ok(
  (
    app_private.resolve_authorization_resource(
      (
        select stock_resource_contract_id
        from auth_db_034_resource_fixture
      ),
      pg_catalog.jsonb_build_object(
        'mode',
        'EXISTING_RESOURCE',
        'locator',
        pg_catalog.jsonb_build_object(
          'id',
          'fixture'
        )
      ),
      'READ',
      '{}'::text[]
    ) -> 'safe_resource_reference'
  ) = 'null'::jsonb,
  '40 unresolved resource has no safe reference'
);

select ok(
  (
    app_private.resolve_authorization_resource(
      (
        select stock_resource_contract_id
        from auth_db_034_resource_fixture
      ),
      pg_catalog.jsonb_build_object(
        'mode',
        'EXISTING_RESOURCE',
        'locator',
        pg_catalog.jsonb_build_object(
          'id',
          'fixture'
        )
      ),
      'READ',
      '{}'::text[]
    ) ->> 'resolution_state'
  ) in (
    'RESOLVED',
    'MULTI_RESOLVED',
    'NOT_APPLICABLE',
    'UNRESOLVED',
    'CONFLICT',
    'ISOLATED'
  ),
  '41 resource state belongs to canonical vocabulary'
);

select is(
  (
    select allowed_request_modes
    from
      app_private.authorization_resource_resolver_registry
    where resource_contract_id =
      (
        select shell_resource_contract_id
        from auth_db_034_resource_fixture
      )
      and status =
          'ACTIVE'
  ),
  array[
    'NON_RESOURCE'
  ]::text[],
  '42 APP_SURFACE resolver admits only NON_RESOURCE'
);

select is(
  (
    select status
    from
      app_private.authorization_resource_resolver_registry
    where resource_contract_id =
      (
        select stock_resource_contract_id
        from auth_db_034_resource_fixture
      )
  ),
  'ACTIVE',
  '43 non-app resource has an ACTIVE fail-closed resolver'
);

select is(
  (
    select pg_catalog.cardinality(
      allowed_request_modes
    )
    from
      app_private.authorization_resource_resolver_registry
    where resource_contract_id =
      (
        select stock_resource_contract_id
        from auth_db_034_resource_fixture
      )
  ),
  5,
  '44 non-app resolver explicitly enumerates five resource-bearing modes'
);

select is(
  (
    select pg_catalog.count(*)
    from
      app_private.authorization_resource_resolver_registry
    where status = 'ACTIVE'
  ),
  140::bigint,
  '45 all release resolvers are ACTIVE'
);

select is(
  (
    select pg_catalog.count(*)
    from
      app_private.authorization_resource_resolver_registry
  ),
  140::bigint,
  '46 resolver registry contains exactly the observed release identities'
);

select is(
  (
    select pg_catalog.count(*)
    from
      app_private.authorization_resource_resolver_registry
    where resolver_shape_fingerprint
          ~ '^sha256:[0-9a-f]{64}$'
  ),
  140::bigint,
  '47 every resolver shape is fingerprinted'
);

select ok(
  not exists (
    select 1
    from
      app_private.authorization_resource_resolver_registry r,
      pg_catalog.unnest(
        r.allowed_request_modes
      ) as mode(value)
    where mode.value not in (
      'EXISTING_RESOURCE',
      'RESOURCE_DRAFT',
      'COLLECTION',
      'AGGREGATE',
      'BULK',
      'NON_RESOURCE'
    )
  ),
  '48 resolver registry contains only canonical request modes'
);

select is(
  (
    select pg_catalog.count(
      distinct resolver_key
    )
    from
      app_private.authorization_resource_resolver_registry
  ),
  2::bigint,
  '49 resolver dispatch is closed to two static implementation keys'
);

select ok(
  pg_catalog.lower(
    pg_catalog.pg_get_functiondef(
      'app_private.resolve_authorization_resource(text,jsonb,text,text[])'::regprocedure
    )
  ) not like '%execute %',
  '50 resource resolver contains no dynamic EXECUTE'
);

select ok(
  not (
    select p.prosecdef
    from pg_catalog.pg_proc p
    where p.oid =
      'app_private.resolve_authorization_resource(text,jsonb,text,text[])'::regprocedure
  ),
  '51 resource resolver is SECURITY INVOKER'
);

select ok(
  (
    select
      coalesce(
        p.proconfig,
        '{}'::text[]
      ) @>
      array[
        'search_path=pg_catalog, app_private'
      ]::text[]
    from pg_catalog.pg_proc p
    where p.oid =
      'app_private.resolve_authorization_resource(text,jsonb,text,text[])'::regprocedure
  ),
  '52 resource resolver has explicit search_path'
);

select is(
  pg_temp.auth_db_034_invalid_mode_sqlstate(),
  '22023',
  '53 invalid resource mode uses SQLSTATE 22023'
);

select is(
  pg_temp.auth_db_034_null_resource_sqlstate(),
  '22023',
  '54 null resource request uses SQLSTATE 22023'
);

-- ==========================================================
-- 55-72 — Base lane
-- ==========================================================

select is(
  (
    pg_temp.auth_db_034_eval(
      pg_temp.auth_db_034_request(
        'shell',
        'shell.access',
        'APP_ACCESS',
        'NON_RESOURCE'
      ),
      pg_temp.auth_db_034_context(
        (
          select shell_base_role
          from auth_db_034_fixture
        ),
        null,
        false,
        false,
        false
      )
    ) ->> 'final_decision'
  ),
  'ALLOW',
  '55 base grant yields final ALLOW'
);

select is(
  (
    pg_temp.auth_db_034_eval(
      pg_temp.auth_db_034_request(
        'shell',
        'shell.access',
        'APP_ACCESS',
        'NON_RESOURCE'
      ),
      pg_temp.auth_db_034_context(
        (
          select shell_base_role
          from auth_db_034_fixture
        ),
        null,
        false,
        false,
        false
      )
    ) #>> '{base_decision,evaluated}'
  ),
  'true',
  '56 base lane is evaluated'
);

select is(
  (
    pg_temp.auth_db_034_eval(
      pg_temp.auth_db_034_request(
        'shell',
        'shell.access',
        'APP_ACCESS',
        'NON_RESOURCE'
      ),
      pg_temp.auth_db_034_context(
        (
          select shell_base_role
          from auth_db_034_fixture
        ),
        null,
        false,
        false,
        false
      )
    ) #>> '{base_decision,outcome}'
  ),
  'ALLOW',
  '57 exact base grant yields BASE ALLOW'
);

select ok(
  pg_catalog.jsonb_array_length(
    pg_temp.auth_db_034_eval(
      pg_temp.auth_db_034_request(
        'shell',
        'shell.access',
        'APP_ACCESS',
        'NON_RESOURCE'
      ),
      pg_temp.auth_db_034_context(
        (
          select shell_base_role
          from auth_db_034_fixture
        ),
        null,
        false,
        false,
        false
      )
    ) -> 'matched_allows'
  ) >= 1,
  '58 base ALLOW retains matched allow evidence'
);

select ok(
  not exists (
    select 1
    from pg_catalog.jsonb_array_elements(
      pg_temp.auth_db_034_eval(
        pg_temp.auth_db_034_request(
          'shell',
          'shell.access',
          'APP_ACCESS',
          'NON_RESOURCE'
        ),
        pg_temp.auth_db_034_context(
          (
            select shell_base_role
            from auth_db_034_fixture
          ),
          null,
          false,
          false,
          false
        )
      ) -> 'matched_allows'
    ) item
    where item ->> 'lane' <> 'BASE'
  ),
  '59 shell matched allows remain in BASE lane'
);

select is(
  (
    pg_temp.auth_db_034_eval(
      pg_temp.auth_db_034_request(
        'shell',
        'shell.access',
        'APP_ACCESS',
        'NON_RESOURCE'
      ),
      pg_temp.auth_db_034_context(
        '__NO_BASE_GRANT__',
        null,
        false,
        false,
        false
      )
    ) ->> 'final_decision'
  ),
  'DENY',
  '60 missing base grant defaults to DENY'
);

select ok(
  (
    pg_temp.auth_db_034_eval(
      pg_temp.auth_db_034_request(
        'shell',
        'shell.access',
        'APP_ACCESS',
        'NON_RESOURCE'
      ),
      pg_temp.auth_db_034_context(
        '__NO_BASE_GRANT__',
        null,
        false,
        false,
        false
      )
    ) -> 'blocked_reasons'
  ) ? 'AUTH_ADMIN_PERMISSION_DENIED',
  '61 default base denial uses canonical reason'
);

select is(
  (
    pg_temp.auth_db_034_eval(
      pg_temp.auth_db_034_request(
        'shell',
        'shell.access',
        'APP_ACCESS',
        'NON_RESOURCE'
      ),
      pg_catalog.jsonb_set(
        pg_temp.auth_db_034_context(
          (
            select shell_base_role
            from auth_db_034_fixture
          ),
          null,
          false,
          false,
          false
        ),
        '{base_role,role_status}',
        '"INACTIVE"'::jsonb
      )
    ) ->> 'final_decision'
  ),
  'DENY',
  '62 inactive base role cannot consume a grant'
);

select is(
  (
    pg_temp.auth_db_034_eval(
      pg_temp.auth_db_034_request(
        'shell',
        'shell.access',
        'APP_ACCESS',
        'NON_RESOURCE'
      ),
      pg_catalog.jsonb_set(
        pg_temp.auth_db_034_context(
          (
            select shell_base_role
            from auth_db_034_fixture
          ),
          null,
          false,
          false,
          false
        ),
        '{lane_readiness,base,status}',
        '"INVALID"'::jsonb
      )
    ) ->> 'final_decision'
  ),
  'DENY',
  '63 invalid base lane readiness is fail closed'
);

select is(
  (
    pg_temp.auth_db_034_eval(
      pg_temp.auth_db_034_request(
        'shell',
        'shell.access',
        'APP_ACCESS',
        'NON_RESOURCE'
      ),
      pg_catalog.jsonb_set(
        pg_temp.auth_db_034_context(
          (
            select shell_base_role
            from auth_db_034_fixture
          ),
          null,
          false,
          false,
          false
        ),
        '{employee,is_active}',
        'false'::jsonb
      )
    ) ->> 'final_decision'
  ),
  'DENY',
  '64 inactive employee overrides valid base allow'
);

select is(
  (
    pg_temp.auth_db_034_eval(
      pg_temp.auth_db_034_request(
        'shell',
        'shell.access',
        'APP_ACCESS',
        'NON_RESOURCE'
      ),
      pg_catalog.jsonb_set(
        pg_temp.auth_db_034_context(
          (
            select shell_base_role
            from auth_db_034_fixture
          ),
          null,
          false,
          false,
          false
        ),
        '{actor_effective,resolved}',
        'false'::jsonb
      )
    ) ->> 'final_decision'
  ),
  'DENY',
  '65 unresolved actor overrides valid base allow'
);

select ok(
  (
    pg_temp.auth_db_034_eval(
      pg_temp.auth_db_034_request(
        'shell',
        'shell.access',
        'APP_ACCESS',
        'NON_RESOURCE'
      ),
      pg_catalog.jsonb_set(
        pg_temp.auth_db_034_context(
          (
            select shell_base_role
            from auth_db_034_fixture
          ),
          null,
          false,
          false,
          false
        ),
        '{principal,authenticated}',
        'false'::jsonb
      )
    ) -> 'blocked_reasons'
  ) ? 'AUTH_NO_SESSION',
  '66 missing session retains canonical structural reason'
);

delete from
  app_private.authorization_dataset_seed_records
where record_id like 'AUTH_DB_034_TEST:%';

insert into
  app_private.authorization_dataset_seed_records (
    record_id,
    subject_type,
    subject_ref,
    permission_key,
    lane,
    effect,
    reason_code,
    source_contract
  )
values (
  'AUTH_DB_034_TEST:ACTOR_DENY_BASE',
  'ACTOR',
  '03400000-0000-0000-0000-000000000003',
  null,
  'ALL',
  'DENY',
  'AUTH_ADMIN_PERMISSION_DENIED',
  'AUTH-DB-034-PGTAP'
);

select is(
  (
    pg_temp.auth_db_034_eval(
      pg_temp.auth_db_034_request(
        'shell',
        'shell.access',
        'APP_ACCESS',
        'NON_RESOURCE'
      ),
      pg_temp.auth_db_034_context(
        (
          select shell_base_role
          from auth_db_034_fixture
        ),
        null,
        false,
        false,
        false
      )
    ) ->> 'final_decision'
  ),
  'DENY',
  '67 actor-wide deny outranks base allow'
);

select is(
  pg_catalog.jsonb_array_length(
    pg_temp.auth_db_034_eval(
      pg_temp.auth_db_034_request(
        'shell',
        'shell.access',
        'APP_ACCESS',
        'NON_RESOURCE'
      ),
      pg_temp.auth_db_034_context(
        (
          select shell_base_role
          from auth_db_034_fixture
        ),
        null,
        false,
        false,
        false
      )
    ) -> 'actor_wide_denies'
  ),
  1,
  '68 actor-wide deny remains auditable'
);

delete from
  app_private.authorization_dataset_seed_records
where record_id like 'AUTH_DB_034_TEST:%';

insert into
  app_private.authorization_dataset_seed_records (
    record_id,
    subject_type,
    subject_ref,
    permission_key,
    lane,
    effect,
    reason_code,
    source_contract
  )
values (
  'AUTH_DB_034_TEST:BASE_DENY',
  'ACTOR',
  '03400000-0000-0000-0000-000000000003',
  'shell.access',
  'BASE',
  'DENY',
  'AUTH_ADMIN_PERMISSION_DENIED',
  'AUTH-DB-034-PGTAP'
);

select is(
  (
    pg_temp.auth_db_034_eval(
      pg_temp.auth_db_034_request(
        'shell',
        'shell.access',
        'APP_ACCESS',
        'NON_RESOURCE'
      ),
      pg_temp.auth_db_034_context(
        (
          select shell_base_role
          from auth_db_034_fixture
        ),
        null,
        false,
        false,
        false
      )
    ) #>> '{base_decision,outcome}'
  ),
  'DENY',
  '69 base lane deny outranks base role allow'
);

select is(
  pg_catalog.jsonb_array_length(
    pg_temp.auth_db_034_eval(
      pg_temp.auth_db_034_request(
        'shell',
        'shell.access',
        'APP_ACCESS',
        'NON_RESOURCE'
      ),
      pg_temp.auth_db_034_context(
        (
          select shell_base_role
          from auth_db_034_fixture
        ),
        null,
        false,
        false,
        false
      )
    ) -> 'lane_denies'
  ),
  1,
  '70 lane deny evidence is retained'
);

delete from
  app_private.authorization_dataset_seed_records
where record_id like 'AUTH_DB_034_TEST:%';

insert into
  app_private.authorization_dataset_seed_records (
    record_id,
    subject_type,
    subject_ref,
    permission_key,
    lane,
    effect,
    reason_code,
    source_contract
  )
values (
  'AUTH_DB_034_TEST:BASE_OVERRIDE',
  'ACTOR',
  '03400000-0000-0000-0000-000000000003',
  'shell.access',
  'BASE',
  'ALLOW',
  null,
  'AUTH-DB-034-PGTAP'
);

select is(
  (
    pg_temp.auth_db_034_eval(
      pg_temp.auth_db_034_request(
        'shell',
        'shell.access',
        'APP_ACCESS',
        'NON_RESOURCE'
      ),
      pg_temp.auth_db_034_context(
        '__NO_BASE_ROLE_GRANT__',
        null,
        false,
        false,
        false
      )
    ) ->> 'final_decision'
  ),
  'ALLOW',
  '71 explicit individual base override can supply the lane'
);

delete from
  app_private.authorization_dataset_seed_records
where record_id like 'AUTH_DB_034_TEST:%';

select is(
  (
    pg_temp.auth_db_034_eval(
      pg_temp.auth_db_034_request(
        'shell',
        'shell.access',
        'APP_ACCESS',
        'NON_RESOURCE'
      ),
      pg_temp.auth_db_034_context(
        (
          select shell_base_role
          from auth_db_034_fixture
        ),
        null,
        false,
        false,
        false
      )
    ) -> 'required_lanes'
  ),
  '["BASE"]'::jsonb,
  '72 BASE_ONLY requires exactly BASE'
);

-- ==========================================================
-- 73-92 — Operational lane
-- ==========================================================

select is(
  (
    pg_temp.auth_db_034_eval(
      pg_temp.auth_db_034_request(
        'pulso',
        'pulso.access',
        'APP_ACCESS',
        'NON_RESOURCE'
      ),
      pg_temp.auth_db_034_context(
        null,
        (
          select pulso_operational_role
          from auth_db_034_fixture
        ),
        true,
        false,
        false
      )
    ) ->> 'final_decision'
  ),
  'ALLOW',
  '73 pulso.access allows with exact operational grant and valid shift'
);

select is(
  (
    pg_temp.auth_db_034_eval(
      pg_temp.auth_db_034_request(
        'pulso',
        'pulso.access',
        'APP_ACCESS',
        'NON_RESOURCE'
      ),
      pg_temp.auth_db_034_context(
        null,
        (
          select pulso_operational_role
          from auth_db_034_fixture
        ),
        true,
        false,
        false
      )
    ) #>> '{operational_decision,evaluated}'
  ),
  'true',
  '74 operational lane is evaluated'
);

select is(
  (
    pg_temp.auth_db_034_eval(
      pg_temp.auth_db_034_request(
        'pulso',
        'pulso.access',
        'APP_ACCESS',
        'NON_RESOURCE'
      ),
      pg_temp.auth_db_034_context(
        null,
        (
          select pulso_operational_role
          from auth_db_034_fixture
        ),
        true,
        false,
        false
      )
    ) #>> '{operational_decision,outcome}'
  ),
  'ALLOW',
  '75 exact operational role grant yields lane ALLOW'
);

select is(
  (
    pg_temp.auth_db_034_eval(
      pg_temp.auth_db_034_request(
        'pulso',
        'pulso.access',
        'APP_ACCESS',
        'NON_RESOURCE'
      ),
      pg_temp.auth_db_034_context(
        null,
        (
          select pulso_operational_role
          from auth_db_034_fixture
        ),
        true,
        false,
        false
      )
    ) #>> '{base_decision,evaluated}'
  ),
  'false',
  '76 OPERATIONAL_ONLY does not evaluate BASE'
);

select is(
  (
    pg_temp.auth_db_034_eval(
      pg_temp.auth_db_034_request(
        'pulso',
        'pulso.access',
        'APP_ACCESS',
        'NON_RESOURCE'
      ),
      pg_temp.auth_db_034_context(
        null,
        (
          select pulso_operational_role
          from auth_db_034_fixture
        ),
        true,
        false,
        false
      )
    ) -> 'required_lanes'
  ),
  '["OPERATIONAL"]'::jsonb,
  '77 OPERATIONAL_ONLY requires exactly OPERATIONAL'
);

select is(
  (
    pg_temp.auth_db_034_eval(
      pg_temp.auth_db_034_request(
        'pulso',
        'pulso.access',
        'APP_ACCESS',
        'NON_RESOURCE'
      ),
      pg_temp.auth_db_034_context(
        null,
        (
          select pulso_operational_role
          from auth_db_034_fixture
        ),
        false,
        false,
        false
      )
    ) ->> 'final_decision'
  ),
  'DENY',
  '78 operational permission without shift denies'
);

select ok(
  (
    pg_temp.auth_db_034_eval(
      pg_temp.auth_db_034_request(
        'pulso',
        'pulso.access',
        'APP_ACCESS',
        'NON_RESOURCE'
      ),
      pg_catalog.jsonb_set(
        pg_temp.auth_db_034_context(
          null,
          (
            select pulso_operational_role
            from auth_db_034_fixture
          ),
          true,
          false,
          false
        ),
        '{active_shift,published}',
        'false'::jsonb
      )
    ) -> 'blocked_reasons'
  ) ? 'AUTH_PUBLISHED_SHIFT_REQUIRED',
  '79 unpublished shift uses canonical deny reason'
);

select ok(
  (
    pg_temp.auth_db_034_eval(
      pg_temp.auth_db_034_request(
        'pulso',
        'pulso.access',
        'APP_ACCESS',
        'NON_RESOURCE'
      ),
      pg_catalog.jsonb_set(
        pg_temp.auth_db_034_context(
          null,
          (
            select pulso_operational_role
            from auth_db_034_fixture
          ),
          true,
          false,
          false
        ),
        '{active_shift,currently_valid}',
        'false'::jsonb
      )
    ) -> 'blocked_reasons'
  ) ? 'AUTH_OUTSIDE_SHIFT_WINDOW',
  '80 out-of-window shift uses canonical reason'
);

select is(
  (
    pg_temp.auth_db_034_eval(
      pg_temp.auth_db_034_request(
        'pulso',
        'pulso.access',
        'APP_ACCESS',
        'NON_RESOURCE'
      ),
      pg_catalog.jsonb_set(
        pg_temp.auth_db_034_context(
          null,
          (
            select pulso_operational_role
            from auth_db_034_fixture
          ),
          true,
          false,
          false
        ),
        '{lane_readiness,operational,status}',
        '"UNAVAILABLE"'::jsonb
      )
    ) ->> 'final_decision'
  ),
  'DENY',
  '81 unavailable operational lane denies'
);

select ok(
  (
    pg_temp.auth_db_034_eval(
      pg_temp.auth_db_034_request(
        'pulso',
        'pulso.access',
        'APP_ACCESS',
        'NON_RESOURCE'
      ),
      pg_catalog.jsonb_set(
        pg_temp.auth_db_034_context(
          null,
          (
            select pulso_operational_role
            from auth_db_034_fixture
          ),
          true,
          false,
          false
        ),
        '{operational_role,valid_for_site}',
        'false'::jsonb
      )
    ) -> 'blocked_reasons'
  ) ? 'AUTH_OPERATIONAL_ROLE_INVALID_FOR_SITE',
  '82 invalid site-role binding denies'
);

select is(
  (
    pg_temp.auth_db_034_eval(
      pg_temp.auth_db_034_request(
        'pulso',
        'pulso.access',
        'APP_ACCESS',
        'NON_RESOURCE'
      ),
      pg_catalog.jsonb_set(
        pg_temp.auth_db_034_context(
          null,
          (
            select pulso_operational_role
            from auth_db_034_fixture
          ),
          true,
          false,
          false
        ),
        '{operational_area}',
        'null'::jsonb
      )
    ) #>> '{operational_decision,outcome}'
  ),
  'ALLOW',
  '83 SITE_SUFFICIENT does not fabricate an area requirement'
);

select is(
  (
    pg_temp.auth_db_034_eval(
      pg_temp.auth_db_034_request(
        'pulso',
        'pulso.access',
        'APP_ACCESS',
        'NON_RESOURCE'
      ),
      pg_temp.auth_db_034_context(
        null,
        (
          select pulso_operational_role
          from auth_db_034_fixture
        ),
        true,
        false,
        false
      )
    ) #>> '{operational_decision,outcome}'
  ),
  'ALLOW',
  '84 T-only permission does not require check-in'
);

select ok(
  (
    select tc_permission
    from auth_db_034_fixture
  ) is not null,
  '85 a T+C operational contract exists in the release'
);

select is(
  (
    pg_temp.auth_db_034_eval(
      pg_temp.auth_db_034_request(
        (
          select tc_app
          from auth_db_034_fixture
        ),
        (
          select tc_permission
          from auth_db_034_fixture
        ),
        'READ',
        'EXISTING_RESOURCE'
      ),
      pg_temp.auth_db_034_context(
        null,
        (
          select tc_operational_role
          from auth_db_034_fixture
        ),
        true,
        false,
        false
      )
    ) #>> '{operational_decision,outcome}'
  ),
  'DENY',
  '86 T+C permission denies without check-in'
);

select ok(
  (
    pg_temp.auth_db_034_eval(
      pg_temp.auth_db_034_request(
        (
          select tc_app
          from auth_db_034_fixture
        ),
        (
          select tc_permission
          from auth_db_034_fixture
        ),
        'READ',
        'EXISTING_RESOURCE'
      ),
      pg_temp.auth_db_034_context(
        null,
        (
          select tc_operational_role
          from auth_db_034_fixture
        ),
        true,
        false,
        false
      )
    ) #>
      '{operational_decision,reason_codes}'
  ) ? 'AUTH_CHECKIN_REQUIRED',
  '87 missing check-in preserves canonical reason'
);

select is(
  (
    pg_temp.auth_db_034_eval(
      pg_temp.auth_db_034_request(
        (
          select tc_app
          from auth_db_034_fixture
        ),
        (
          select tc_permission
          from auth_db_034_fixture
        ),
        'READ',
        'EXISTING_RESOURCE'
      ),
      pg_temp.auth_db_034_context(
        null,
        (
          select tc_operational_role
          from auth_db_034_fixture
        ),
        true,
        true,
        false
      )
    ) #>> '{operational_decision,outcome}'
  ),
  'ALLOW',
  '88 active check-in satisfies T+C operational prerequisites'
);

delete from
  app_private.authorization_dataset_seed_records
where record_id like 'AUTH_DB_034_TEST:%';

insert into
  app_private.authorization_dataset_seed_records (
    record_id,
    subject_type,
    subject_ref,
    permission_key,
    lane,
    effect,
    reason_code,
    source_contract
  )
values (
  'AUTH_DB_034_TEST:OP_DENY',
  'ACTOR',
  '03400000-0000-0000-0000-000000000003',
  'pulso.access',
  'OPERATIONAL',
  'DENY',
  'AUTH_OPERATIONAL_PERMISSION_DENIED',
  'AUTH-DB-034-PGTAP'
);

select is(
  (
    pg_temp.auth_db_034_eval(
      pg_temp.auth_db_034_request(
        'pulso',
        'pulso.access',
        'APP_ACCESS',
        'NON_RESOURCE'
      ),
      pg_temp.auth_db_034_context(
        null,
        (
          select pulso_operational_role
          from auth_db_034_fixture
        ),
        true,
        false,
        false
      )
    ) #>> '{operational_decision,outcome}'
  ),
  'DENY',
  '89 operational lane deny outranks operational allow'
);

delete from
  app_private.authorization_dataset_seed_records
where record_id like 'AUTH_DB_034_TEST:%';

insert into
  app_private.authorization_dataset_seed_records (
    record_id,
    subject_type,
    subject_ref,
    permission_key,
    lane,
    effect,
    reason_code,
    source_contract
  )
values (
  'AUTH_DB_034_TEST:OP_OVERRIDE',
  'ACTOR',
  '03400000-0000-0000-0000-000000000003',
  'pulso.access',
  'OPERATIONAL',
  'ALLOW',
  null,
  'AUTH-DB-034-PGTAP'
);

select is(
  (
    pg_temp.auth_db_034_eval(
      pg_temp.auth_db_034_request(
        'pulso',
        'pulso.access',
        'APP_ACCESS',
        'NON_RESOURCE'
      ),
      pg_temp.auth_db_034_context(
        null,
        '__NO_OPERATIONAL_ROLE_GRANT__',
        true,
        false,
        false
      )
    ) #>> '{operational_decision,outcome}'
  ),
  'ALLOW',
  '90 explicit operational override can supply the lane without a role grant'
);

delete from
  app_private.authorization_dataset_seed_records
where record_id like 'AUTH_DB_034_TEST:%';

insert into
  app_private.authorization_dataset_seed_records (
    record_id,
    subject_type,
    subject_ref,
    permission_key,
    lane,
    effect,
    reason_code,
    source_contract
  )
values (
  'AUTH_DB_034_TEST:ACTOR_DENY_OP',
  'ACTOR',
  '03400000-0000-0000-0000-000000000003',
  null,
  'ALL',
  'DENY',
  'AUTH_OPERATIONAL_PERMISSION_DENIED',
  'AUTH-DB-034-PGTAP'
);

select is(
  (
    pg_temp.auth_db_034_eval(
      pg_temp.auth_db_034_request(
        'pulso',
        'pulso.access',
        'APP_ACCESS',
        'NON_RESOURCE'
      ),
      pg_temp.auth_db_034_context(
        null,
        (
          select pulso_operational_role
          from auth_db_034_fixture
        ),
        true,
        false,
        false
      )
    ) ->> 'final_decision'
  ),
  'DENY',
  '91 actor-wide deny outranks operational allow'
);

delete from
  app_private.authorization_dataset_seed_records
where record_id like 'AUTH_DB_034_TEST:%';

select ok(
  (
    pg_temp.auth_db_034_eval(
      pg_temp.auth_db_034_request(
        'pulso',
        'pulso.access.fake',
        'APP_ACCESS',
        'NON_RESOURCE'
      ),
      pg_temp.auth_db_034_context(
        null,
        (
          select pulso_operational_role
          from auth_db_034_fixture
        ),
        true,
        false,
        false
      )
    ) -> 'blocked_reasons'
  ) ? 'AUTH_PERMISSION_NOT_REGISTERED',
  '92 permission matching is exact and never prefix based'
);

-- ==========================================================
-- 93-110 — Precedence / denies
-- ==========================================================

insert into
  app_private.authorization_dataset_seed_records (
    record_id,
    subject_type,
    subject_ref,
    permission_key,
    lane,
    effect,
    reason_code,
    source_contract
  )
values (
  'AUTH_DB_034_TEST:STRUCT_OVERRIDE',
  'ACTOR',
  '03400000-0000-0000-0000-000000000003',
  'shell.access',
  'BASE',
  'ALLOW',
  null,
  'AUTH-DB-034-PGTAP'
);

select is(
  (
    pg_temp.auth_db_034_eval(
      pg_temp.auth_db_034_request(
        'shell',
        'shell.access',
        'APP_ACCESS',
        'NON_RESOURCE'
      ),
      pg_catalog.jsonb_set(
        pg_temp.auth_db_034_context(
          '__NO_ROLE__',
          null,
          false,
          false,
          false
        ),
        '{principal,authenticated}',
        'false'::jsonb
      )
    ) ->> 'final_decision'
  ),
  'DENY',
  '93 STRUCTURAL_DENY outranks individual allow'
);

select ok(
  pg_catalog.jsonb_array_length(
    pg_temp.auth_db_034_eval(
      pg_temp.auth_db_034_request(
        'shell',
        'shell.access',
        'APP_ACCESS',
        'NON_RESOURCE'
      ),
      pg_catalog.jsonb_set(
        pg_temp.auth_db_034_context(
          '__NO_ROLE__',
          null,
          false,
          false,
          false
        ),
        '{principal,authenticated}',
        'false'::jsonb
      )
    ) -> 'structural_denies'
  ) > 0,
  '94 structural deny evidence is retained'
);

delete from
  app_private.authorization_dataset_seed_records
where record_id like 'AUTH_DB_034_TEST:%';

insert into
  app_private.authorization_dataset_seed_records
values
(
  'AUTH_DB_034_TEST:ALLOW',
  'ACTOR',
  '03400000-0000-0000-0000-000000000003',
  'shell.access',
  'BASE',
  'ALLOW',
  null,
  null,
  null,
  null,
  'ACTIVE',
  'AUTH-DB-034-PGTAP',
  '{}'::jsonb
),
(
  'AUTH_DB_034_TEST:ACTOR_DENY',
  'ACTOR',
  '03400000-0000-0000-0000-000000000003',
  null,
  'ALL',
  'DENY',
  null,
  null,
  null,
  'AUTH_ADMIN_PERMISSION_DENIED',
  'ACTIVE',
  'AUTH-DB-034-PGTAP',
  '{}'::jsonb
);

select is(
  (
    pg_temp.auth_db_034_eval(
      pg_temp.auth_db_034_request(
        'shell',
        'shell.access',
        'APP_ACCESS',
        'NON_RESOURCE'
      ),
      pg_temp.auth_db_034_context(
        '__NO_ROLE__',
        null,
        false,
        false,
        false
      )
    ) ->> 'final_decision'
  ),
  'DENY',
  '95 ACTOR_WIDE_DENY outranks individual allow'
);

select is(
  pg_catalog.jsonb_array_length(
    pg_temp.auth_db_034_eval(
      pg_temp.auth_db_034_request(
        'shell',
        'shell.access',
        'APP_ACCESS',
        'NON_RESOURCE'
      ),
      pg_temp.auth_db_034_context(
        '__NO_ROLE__',
        null,
        false,
        false,
        false
      )
    ) -> 'actor_wide_denies'
  ),
  1,
  '96 actor-wide deny identity remains visible internally'
);

delete from
  app_private.authorization_dataset_seed_records
where record_id like 'AUTH_DB_034_TEST:%';

insert into
  app_private.authorization_dataset_seed_records (
    record_id,
    subject_type,
    subject_ref,
    permission_key,
    lane,
    effect,
    reason_code,
    source_contract
  )
values (
  'AUTH_DB_034_TEST:BASE_PRECEDENCE',
  'ACTOR',
  '03400000-0000-0000-0000-000000000003',
  'shell.access',
  'BASE',
  'DENY',
  'AUTH_ADMIN_PERMISSION_DENIED',
  'AUTH-DB-034-PGTAP'
);

select is(
  (
    pg_temp.auth_db_034_eval(
      pg_temp.auth_db_034_request(
        'shell',
        'shell.access',
        'APP_ACCESS',
        'NON_RESOURCE'
      ),
      pg_temp.auth_db_034_context(
        (
          select shell_base_role
          from auth_db_034_fixture
        ),
        null,
        false,
        false,
        false
      )
    ) #>> '{base_decision,outcome}'
  ),
  'DENY',
  '97 LANE_DENY outranks BASE ALLOW'
);

select is(
  pg_catalog.jsonb_array_length(
    pg_temp.auth_db_034_eval(
      pg_temp.auth_db_034_request(
        'shell',
        'shell.access',
        'APP_ACCESS',
        'NON_RESOURCE'
      ),
      pg_temp.auth_db_034_context(
        (
          select shell_base_role
          from auth_db_034_fixture
        ),
        null,
        false,
        false,
        false
      )
    ) -> 'lane_denies'
  ),
  1,
  '98 base lane deny remains in lane evidence'
);

delete from
  app_private.authorization_dataset_seed_records
where record_id like 'AUTH_DB_034_TEST:%';

insert into
  app_private.authorization_dataset_seed_records (
    record_id,
    subject_type,
    subject_ref,
    permission_key,
    lane,
    effect,
    reason_code,
    source_contract
  )
values (
  'AUTH_DB_034_TEST:OP_PRECEDENCE',
  'ACTOR',
  '03400000-0000-0000-0000-000000000003',
  'pulso.access',
  'OPERATIONAL',
  'DENY',
  'AUTH_OPERATIONAL_PERMISSION_DENIED',
  'AUTH-DB-034-PGTAP'
);

select is(
  (
    pg_temp.auth_db_034_eval(
      pg_temp.auth_db_034_request(
        'pulso',
        'pulso.access',
        'APP_ACCESS',
        'NON_RESOURCE'
      ),
      pg_temp.auth_db_034_context(
        null,
        (
          select pulso_operational_role
          from auth_db_034_fixture
        ),
        true,
        false,
        false
      )
    ) #>> '{operational_decision,outcome}'
  ),
  'DENY',
  '99 LANE_DENY outranks OPERATIONAL ALLOW'
);

select is(
  pg_catalog.jsonb_array_length(
    pg_temp.auth_db_034_eval(
      pg_temp.auth_db_034_request(
        'pulso',
        'pulso.access',
        'APP_ACCESS',
        'NON_RESOURCE'
      ),
      pg_temp.auth_db_034_context(
        null,
        (
          select pulso_operational_role
          from auth_db_034_fixture
        ),
        true,
        false,
        false
      )
    ) -> 'lane_denies'
  ),
  1,
  '100 operational lane deny remains auditable'
);

delete from
  app_private.authorization_dataset_seed_records
where record_id like 'AUTH_DB_034_TEST:%';

select is(
  (
    pg_temp.auth_db_034_eval(
      pg_temp.auth_db_034_request(
        'shell',
        'shell.access',
        'APP_ACCESS',
        'NON_RESOURCE'
      ),
      pg_temp.auth_db_034_context(
        (
          select shell_base_role
          from auth_db_034_fixture
        ),
        null,
        false,
        false,
        false
      )
    ) ->> 'final_decision'
  ),
  'ALLOW',
  '101 exact allow outranks DEFAULT_DENY'
);

select is(
  (
    pg_temp.auth_db_034_eval(
      pg_temp.auth_db_034_request(
        'shell',
        'shell.access',
        'APP_ACCESS',
        'NON_RESOURCE'
      ),
      pg_temp.auth_db_034_context(
        '__NO_ROLE__',
        null,
        false,
        false,
        false
      )
    ) ->> 'final_decision'
  ),
  'DENY',
  '102 no applicable allow produces DEFAULT_DENY'
);

select is(
  (
    pg_temp.auth_db_034_eval(
      pg_temp.auth_db_034_request(
        'shell',
        'shell.access',
        'APP_ACCESS',
        'NON_RESOURCE'
      ),
      pg_catalog.jsonb_set(
        pg_temp.auth_db_034_context(
          '__NO_ROLE__',
          null,
          false,
          false,
          false
        ),
        '{principal,principal_type}',
        '"SYSTEM_SERVICE"'::jsonb
      )
    ) ->> 'final_decision'
  ),
  'DENY',
  '103 SYSTEM_SERVICE is not an authorization bypass'
);

select is(
  (
    pg_temp.auth_db_034_eval(
      pg_temp.auth_db_034_request(
        'shell',
        'shell.access',
        'APP_ACCESS',
        'NON_RESOURCE'
      ),
      pg_temp.auth_db_034_context(
        'manager',
        null,
        false,
        false,
        false
      )
    ) ->> 'final_decision'
  ),
  'DENY',
  '104 role-like names do not create manager bypass'
);

select is(
  (
    pg_temp.auth_db_034_eval(
      pg_temp.auth_db_034_request(
        'nexo',
        'nexo.access',
        'APP_ACCESS',
        'NON_RESOURCE'
      ),
      pg_temp.auth_db_034_context(
        (
          select nexo_base_role
          from auth_db_034_fixture
        ),
        null,
        false,
        false,
        false
      )
    ) ->> 'final_decision'
  ),
  'ALLOW',
  '105 BASE_OR_OPERATIONAL can authorize through BASE alone'
);

select is(
  (
    pg_temp.auth_db_034_eval(
      pg_temp.auth_db_034_request(
        'nexo',
        'nexo.access',
        'APP_ACCESS',
        'NON_RESOURCE'
      ),
      pg_temp.auth_db_034_context(
        null,
        (
          select nexo_operational_role
          from auth_db_034_fixture
        ),
        true,
        false,
        false
      )
    ) ->> 'final_decision'
  ),
  'ALLOW',
  '106 BASE_OR_OPERATIONAL can authorize through OPERATIONAL alone'
);

insert into
  app_private.authorization_dataset_seed_records (
    record_id,
    subject_type,
    subject_ref,
    permission_key,
    lane,
    effect,
    reason_code,
    source_contract
  )
values (
  'AUTH_DB_034_TEST:NEXO_BASE_DENY',
  'ACTOR',
  '03400000-0000-0000-0000-000000000003',
  'nexo.access',
  'BASE',
  'DENY',
  'AUTH_ADMIN_PERMISSION_DENIED',
  'AUTH-DB-034-PGTAP'
);

select is(
  (
    pg_temp.auth_db_034_eval(
      pg_temp.auth_db_034_request(
        'nexo',
        'nexo.access',
        'APP_ACCESS',
        'NON_RESOURCE'
      ),
      pg_temp.auth_db_034_context(
        (
          select nexo_base_role
          from auth_db_034_fixture
        ),
        (
          select nexo_operational_role
          from auth_db_034_fixture
        ),
        true,
        false,
        false
      )
    ) ->> 'final_decision'
  ),
  'ALLOW',
  '107 BASE_OR_OPERATIONAL survives BASE lane deny when OPERATIONAL allows'
);

delete from
  app_private.authorization_dataset_seed_records
where record_id like 'AUTH_DB_034_TEST:%';

insert into
  app_private.authorization_dataset_seed_records (
    record_id,
    subject_type,
    subject_ref,
    permission_key,
    lane,
    effect,
    reason_code,
    source_contract
  )
values (
  'AUTH_DB_034_TEST:NEXO_OP_DENY',
  'ACTOR',
  '03400000-0000-0000-0000-000000000003',
  'nexo.access',
  'OPERATIONAL',
  'DENY',
  'AUTH_OPERATIONAL_PERMISSION_DENIED',
  'AUTH-DB-034-PGTAP'
);

select is(
  (
    pg_temp.auth_db_034_eval(
      pg_temp.auth_db_034_request(
        'nexo',
        'nexo.access',
        'APP_ACCESS',
        'NON_RESOURCE'
      ),
      pg_temp.auth_db_034_context(
        (
          select nexo_base_role
          from auth_db_034_fixture
        ),
        (
          select nexo_operational_role
          from auth_db_034_fixture
        ),
        true,
        false,
        false
      )
    ) ->> 'final_decision'
  ),
  'ALLOW',
  '108 BASE_OR_OPERATIONAL survives OPERATIONAL deny when BASE allows'
);

delete from
  app_private.authorization_dataset_seed_records
where record_id like 'AUTH_DB_034_TEST:%';

select is(
  (
    pg_temp.auth_db_034_eval(
      pg_temp.auth_db_034_request(
        (
          select both_app
          from auth_db_034_fixture
        ),
        (
          select both_permission
          from auth_db_034_fixture
        ),
        'UPDATE',
        'EXISTING_RESOURCE'
      ),
      pg_temp.auth_db_034_context(
        (
          select both_base_role
          from auth_db_034_fixture
        ),
        null,
        false,
        false,
        false
      )
    ) #>> '{combination,outcome}'
  ),
  'DENY',
  '109 BASE_AND_OPERATIONAL rejects one-lane authorization'
);

select is(
  (
    pg_temp.auth_db_034_eval(
      pg_temp.auth_db_034_request(
        (
          select both_app
          from auth_db_034_fixture
        ),
        (
          select both_permission
          from auth_db_034_fixture
        ),
        'UPDATE',
        'EXISTING_RESOURCE'
      ),
      pg_temp.auth_db_034_context(
        (
          select both_base_role
          from auth_db_034_fixture
        ),
        (
          select both_operational_role
          from auth_db_034_fixture
        ),
        true,
        true,
        false
      )
    ) #>> '{combination,outcome}'
  ),
  'ALLOW',
  '110 BASE_AND_OPERATIONAL combines two valid lanes before resource restrictions'
);

-- ==========================================================
-- 111-122 — Dependencies / restrictions
-- ==========================================================

select is(
  (
    pg_temp.auth_db_034_eval(
      pg_temp.auth_db_034_request(
        'shell',
        'shell.access',
        'APP_ACCESS',
        'NON_RESOURCE'
      ),
      pg_temp.auth_db_034_context(
        (
          select shell_base_role
          from auth_db_034_fixture
        ),
        null,
        false,
        false,
        false
      ),
      '{}'::text[],
      33
    ) ->> 'final_decision'
  ),
  'DENY',
  '111 dependency depth above 32 fails closed'
);

select ok(
  pg_catalog.jsonb_array_length(
    pg_temp.auth_db_034_eval(
      pg_temp.auth_db_034_request(
        'shell',
        'shell.access',
        'APP_ACCESS',
        'NON_RESOURCE'
      ),
      pg_temp.auth_db_034_context(
        (
          select shell_base_role
          from auth_db_034_fixture
        ),
        null,
        false,
        false,
        false
      ),
      '{}'::text[],
      33
    ) -> 'structural_denies'
  ) > 0,
  '112 dependency depth violation is structural'
);

update
  app_private.authorization_permission_contracts
set contract_snapshot =
  pg_catalog.jsonb_set(
    contract_snapshot,
    '{dependency_permissions}',
    '["shell.access"]'::jsonb,
    true
  )
where catalog_version =
      '1.1.0'
  and permission_key =
      'shell.access';

select is(
  (
    pg_temp.auth_db_034_eval(
      pg_temp.auth_db_034_request(
        'shell',
        'shell.access',
        'APP_ACCESS',
        'NON_RESOURCE'
      ),
      pg_temp.auth_db_034_context(
        (
          select shell_base_role
          from auth_db_034_fixture
        ),
        null,
        false,
        false,
        false
      )
    ) ->> 'final_decision'
  ),
  'DENY',
  '113 self dependency cycle fails closed'
);

select is(
  pg_catalog.jsonb_array_length(
    pg_temp.auth_db_034_eval(
      pg_temp.auth_db_034_request(
        'shell',
        'shell.access',
        'APP_ACCESS',
        'NON_RESOURCE'
      ),
      pg_temp.auth_db_034_context(
        (
          select shell_base_role
          from auth_db_034_fixture
        ),
        null,
        false,
        false,
        false
      )
    ) -> 'prerequisite_decisions'
  ),
  1,
  '114 dependency result is recorded without reentering issuer'
);

update
  app_private.authorization_permission_contracts
set contract_snapshot =
  (
    select contract_snapshot
    from auth_db_034_shell_snapshot
  )
where catalog_version =
      '1.1.0'
  and permission_key =
      'shell.access';

select is(
  pg_catalog.jsonb_array_length(
    pg_temp.auth_db_034_eval(
      pg_temp.auth_db_034_request(
        'shell',
        'shell.access',
        'APP_ACCESS',
        'NON_RESOURCE'
      ),
      pg_temp.auth_db_034_context(
        (
          select shell_base_role
          from auth_db_034_fixture
        ),
        null,
        false,
        false,
        false
      )
    ) -> 'prerequisite_decisions'
  ),
  0,
  '115 permission without dependencies produces empty prerequisite decisions'
);

select is(
  (
    pg_temp.auth_db_034_eval(
      pg_temp.auth_db_034_request(
        'shell',
        'shell.access',
        'UPDATE',
        'NON_RESOURCE'
      ),
      pg_temp.auth_db_034_context(
        (
          select shell_base_role
          from auth_db_034_fixture
        ),
        null,
        false,
        false,
        false
      )
    ) ->> 'final_decision'
  ),
  'DENY',
  '116 read-only permission cannot authorize UPDATE'
);

select ok(
  (
    pg_temp.auth_db_034_eval(
      pg_temp.auth_db_034_request(
        'shell',
        'shell.access',
        'UPDATE',
        'NON_RESOURCE'
      ),
      pg_temp.auth_db_034_context(
        (
          select shell_base_role
          from auth_db_034_fixture
        ),
        null,
        false,
        false,
        false
      )
    ) -> 'blocked_reasons'
  ) ? 'AUTH_ADMINISTRATIVE_CONFIGURATION_INCONSISTENT',
  '117 read-only mutation mismatch uses canonical structural reason'
);

select is(
  (
    pg_temp.auth_db_034_eval(
      pg_temp.auth_db_034_request(
        'shell',
        'shell.access',
        'READ',
        'NON_RESOURCE'
      ),
      pg_temp.auth_db_034_context(
        (
          select shell_base_role
          from auth_db_034_fixture
        ),
        null,
        false,
        false,
        false
      )
    ) ->> 'final_decision'
  ),
  'DENY',
  '118 APP_SURFACE requires APP_ACCESS operation kind'
);

select is(
  (
    pg_temp.auth_db_034_eval(
      pg_temp.auth_db_034_request(
        'shell',
        'shell.access',
        'APP_ACCESS',
        'NON_RESOURCE'
      ),
      pg_temp.auth_db_034_context(
        (
          select shell_base_role
          from auth_db_034_fixture
        ),
        null,
        false,
        false,
        false
      )
    ) ->> 'final_decision'
  ),
  'ALLOW',
  '119 APP_ACCESS with NON_RESOURCE is structurally valid'
);

update
  app_private.authorization_permission_contracts
set contract_snapshot =
  pg_catalog.jsonb_set(
    contract_snapshot,
    '{device_policy}',
    '"NOT_ALLOWED"'::jsonb,
    true
  )
where catalog_version =
      '1.1.0'
  and permission_key =
      'shell.access';

select is(
  (
    pg_temp.auth_db_034_eval(
      pg_temp.auth_db_034_request(
        'shell',
        'shell.access',
        'APP_ACCESS',
        'NON_RESOURCE'
      ),
      pg_temp.auth_db_034_context(
        (
          select shell_base_role
          from auth_db_034_fixture
        ),
        null,
        false,
        false,
        true
      )
    ) ->> 'final_decision'
  ),
  'DENY',
  '120 NOT_ALLOWED device policy denies shared device'
);

update
  app_private.authorization_permission_contracts
set contract_snapshot =
  pg_catalog.jsonb_set(
    (
      select contract_snapshot
      from auth_db_034_shell_snapshot
    ),
    '{device_policy}',
    '"STRONG_REAUTH_REQUIRED"'::jsonb,
    true
  )
where catalog_version =
      '1.1.0'
  and permission_key =
      'shell.access';

select is(
  (
    pg_temp.auth_db_034_eval(
      pg_temp.auth_db_034_request(
        'shell',
        'shell.access',
        'APP_ACCESS',
        'NON_RESOURCE'
      ),
      pg_temp.auth_db_034_context(
        (
          select shell_base_role
          from auth_db_034_fixture
        ),
        null,
        false,
        false,
        true
      )
    ) ->> 'final_decision'
  ),
  'DENY',
  '121 strong shared-device policy fails closed without certified reauth proof'
);

update
  app_private.authorization_permission_contracts
set contract_snapshot =
  pg_catalog.jsonb_set(
    (
      select contract_snapshot
      from auth_db_034_shell_snapshot
    ),
    '{device_policy}',
    '"STANDARD_ACTOR_SESSION"'::jsonb,
    true
  )
where catalog_version =
      '1.1.0'
  and permission_key =
      'shell.access';

select is(
  (
    pg_temp.auth_db_034_eval(
      pg_temp.auth_db_034_request(
        'shell',
        'shell.access',
        'APP_ACCESS',
        'NON_RESOURCE'
      ),
      pg_temp.auth_db_034_context(
        (
          select shell_base_role
          from auth_db_034_fixture
        ),
        null,
        false,
        false,
        true
      )
    ) ->> 'final_decision'
  ),
  'ALLOW',
  '122 STANDARD device policy allows valid actor session'
);

update
  app_private.authorization_permission_contracts
set contract_snapshot =
  (
    select contract_snapshot
    from auth_db_034_shell_snapshot
  )
where catalog_version =
      '1.1.0'
  and permission_key =
      'shell.access';

-- ==========================================================
-- 123-132 — AuthorizationDecision output
-- ==========================================================

create temporary table
  auth_db_034_decision
on commit drop
as
select
  pg_temp.auth_db_034_eval(
    pg_temp.auth_db_034_request(
      'shell',
      'shell.access',
      'APP_ACCESS',
      'NON_RESOURCE'
    ),
    pg_temp.auth_db_034_context(
      (
        select shell_base_role
        from auth_db_034_fixture
      ),
      null,
      false,
      false,
      false
    )
  ) as decision;

select is(
  decision ->> 'contract_family',
  'vento.authorization.response-contracts',
  '123 decision uses canonical response contract family'
)
from auth_db_034_decision;

select is(
  decision ->> 'contract_name',
  'AuthorizationDecision',
  '124 decision contract name is exact'
)
from auth_db_034_decision;

select ok(
  decision ->> 'decision_id'
    ~ '^[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}$',
  '125 decision id is opaque UUID'
)
from auth_db_034_decision;

select ok(
  nullif(
    decision ->> 'decided_at',
    ''
  ) is not null,
  '126 decided_at is server-generated'
)
from auth_db_034_decision;

select is(
  decision ->> 'final_decision',
  'ALLOW',
  '127 final outcome only serializes ALLOW'
)
from auth_db_034_decision;

select is(
  (
    select pg_catalog.count(*)
    from pg_catalog.jsonb_object_keys(
      decision
    )
  ),
  28::bigint,
  '128 AuthorizationDecision root shape contains 28 canonical fields'
)
from auth_db_034_decision;

select is(
  (
    select pg_catalog.count(*)
    from pg_catalog.jsonb_object_keys(
      decision -> 'access_context_ref'
    )
  ),
  8::bigint,
  '129 AccessContextReference is compact and exact'
)
from auth_db_034_decision;

select ok(
  decision #>>
    '{audit,request_fingerprint}'
    ~ '^sha256:[0-9a-f]{64}$',
  '130 audit contains request fingerprint'
)
from auth_db_034_decision;

select is(
  decision #>>
    '{audit,contract_release_hash}',
  'sha256:9e8d1d7452ed5844fa76b9c718e7bb82ae029d6031234b3b6d9a17f22c2a4359',
  '131 decision pins the authorized contract release hash'
)
from auth_db_034_decision;

select isnt(
  (
    pg_temp.auth_db_034_eval(
      pg_temp.auth_db_034_request(
        'shell',
        'shell.access',
        'APP_ACCESS',
        'NON_RESOURCE'
      ),
      pg_temp.auth_db_034_context(
        (
          select shell_base_role
          from auth_db_034_fixture
        ),
        null,
        false,
        false,
        false
      )
    ) ->> 'decision_id'
  ),
  (
    pg_temp.auth_db_034_eval(
      pg_temp.auth_db_034_request(
        'shell',
        'shell.access',
        'APP_ACCESS',
        'NON_RESOURCE'
      ),
      pg_temp.auth_db_034_context(
        (
          select shell_base_role
          from auth_db_034_fixture
        ),
        null,
        false,
        false,
        false
      )
    ) ->> 'decision_id'
  ),
  '132 separate evaluations receive different decision identities'
);

-- ==========================================================
-- 133-140 — Safe projection
-- ==========================================================

create temporary table
  auth_db_034_safe
on commit drop
as
select
  app_private.project_safe_authorization_decision(
    decision
  ) as safe
from auth_db_034_decision;

select is(
  (
    select pg_catalog.count(*)
    from pg_catalog.jsonb_object_keys(
      safe
    )
  ),
  12::bigint,
  '133 safe projection contains only the 12 approved fields'
)
from auth_db_034_safe;

select is(
  safe ->> 'outcome',
  'ALLOW',
  '134 safe projection carries outcome'
)
from auth_db_034_safe;

select is(
  safe ->> 'app_code',
  'shell',
  '135 safe projection carries app code'
)
from auth_db_034_safe;

select is(
  safe ->> 'permission_key',
  'shell.access',
  '136 safe projection carries permission key'
)
from auth_db_034_safe;

select ok(
  not (safe ? 'actor_id'),
  '137 safe projection excludes actor identity'
)
from auth_db_034_safe;

select ok(
  not (safe ? 'matched_allows'),
  '138 safe projection excludes allow evidence'
)
from auth_db_034_safe;

select is(
  pg_catalog.jsonb_typeof(
    safe -> 'safe_reason_codes'
  ),
  'array',
  '139 safe reason codes are an array'
)
from auth_db_034_safe;

select ok(
  safe ? 'safe_message_code'
  and safe -> 'safe_message_code'
      = 'null'::jsonb,
  '140 ALLOW safe projection preserves a null safe message code'
)
from auth_db_034_safe;

-- ==========================================================
-- 141-148 — SECURITY DEFINER / ownership
-- ==========================================================

select is(
  pg_catalog.pg_get_userbyid(
    (
      select p.proowner
      from pg_catalog.pg_proc p
      where p.oid =
        'app_private.evaluate_authorization(jsonb)'::regprocedure
    )
  ),
  'vento_authorization_owner',
  '141 issuer has isolated technical owner'
);

select is(
  pg_catalog.pg_get_userbyid(
    (
      select p.proowner
      from pg_catalog.pg_proc p
      where p.oid =
        'api.get_safe_authorization_decision(jsonb)'::regprocedure
    )
  ),
  'vento_authorization_owner',
  '142 safe wrapper has isolated technical owner'
);

select is(
  pg_catalog.pg_get_userbyid(
    (
      select p.proowner
      from pg_catalog.pg_proc p
      where p.oid =
        'app_private.authorization_policy_allows(jsonb)'::regprocedure
    )
  ),
  'vento_authorization_owner',
  '143 RLS predicate has isolated technical owner'
);

select ok(
  (
    select p.prosecdef
    from pg_catalog.pg_proc p
    where p.oid =
      'app_private.evaluate_authorization(jsonb)'::regprocedure
  ),
  '144 issuer is SECURITY DEFINER'
);

select ok(
  (
    select p.prosecdef
    from pg_catalog.pg_proc p
    where p.oid =
      'api.get_safe_authorization_decision(jsonb)'::regprocedure
  ),
  '145 safe wrapper is SECURITY DEFINER'
);

select ok(
  (
    select p.prosecdef
    from pg_catalog.pg_proc p
    where p.oid =
      'app_private.authorization_policy_allows(jsonb)'::regprocedure
  ),
  '146 RLS predicate is SECURITY DEFINER'
);

select ok(
  not pg_catalog.has_function_privilege(
    'public',
    'app_private.evaluate_authorization(jsonb)',
    'EXECUTE'
  ),
  '147 PUBLIC cannot execute the full evaluator'
);

select ok(
  not pg_catalog.has_function_privilege(
    'authenticated',
    'app_private.evaluate_authorization(jsonb)',
    'EXECUTE'
  ),
  '148 authenticated cannot execute the full evaluator directly'
);

-- ==========================================================
-- 149-152 — RLS / private projections
-- ==========================================================

select is(
  (
    select pg_catalog.count(*)
    from
      pg_catalog.pg_class c
    join
      pg_catalog.pg_namespace n
        on n.oid =
           c.relnamespace
    where n.nspname =
          'app_private'
      and c.relname in (
        'authorization_contract_releases',
        'authorization_permission_contracts',
        'authorization_resource_resolver_registry',
        'authorization_dataset_source_registry',
        'authorization_base_role_grants',
        'authorization_operational_role_grants',
        'authorization_dataset_seed_records'
      )
      and c.relrowsecurity
  ),
  7::bigint,
  '149 every AUTH-DB-034 private table has RLS enabled'
);

select is(
  (
    select pg_catalog.count(*)
    from (
      values
        ('app_private.authorization_contract_releases'),
        ('app_private.authorization_permission_contracts'),
        ('app_private.authorization_resource_resolver_registry'),
        ('app_private.authorization_dataset_source_registry'),
        ('app_private.authorization_base_role_grants'),
        ('app_private.authorization_operational_role_grants'),
        ('app_private.authorization_dataset_seed_records')
    ) as tables(name)
    where pg_catalog.has_table_privilege(
      'anon',
      name,
      'SELECT'
    )
  ),
  0::bigint,
  '150 anon has zero direct SELECT on private authorization projections'
);

select is(
  (
    select pg_catalog.count(*)
    from (
      values
        ('app_private.authorization_contract_releases'),
        ('app_private.authorization_permission_contracts'),
        ('app_private.authorization_resource_resolver_registry'),
        ('app_private.authorization_dataset_source_registry'),
        ('app_private.authorization_base_role_grants'),
        ('app_private.authorization_operational_role_grants'),
        ('app_private.authorization_dataset_seed_records')
    ) as tables(name)
    where pg_catalog.has_table_privilege(
      'authenticated',
      name,
      'SELECT'
    )
  ),
  0::bigint,
  '151 authenticated has zero direct SELECT on private projections'
);

select is(
  (
    select pg_catalog.count(*)
    from (
      values
        ('app_private.authorization_contract_releases'),
        ('app_private.authorization_permission_contracts'),
        ('app_private.authorization_resource_resolver_registry'),
        ('app_private.authorization_dataset_source_registry'),
        ('app_private.authorization_base_role_grants'),
        ('app_private.authorization_operational_role_grants'),
        ('app_private.authorization_dataset_seed_records')
    ) as tables(name)
    where pg_catalog.has_table_privilege(
      'service_role',
      name,
      'SELECT'
    )
  ),
  0::bigint,
  '152 service_role is infrastructure, not direct business authority'
);

-- ==========================================================
-- 153-154 — Operation safety
-- ==========================================================

select ok(
  pg_catalog.has_function_privilege(
    'authenticated',
    'api.get_safe_authorization_decision(jsonb)',
    'EXECUTE'
  )
  and not pg_catalog.has_function_privilege(
    'anon',
    'api.get_safe_authorization_decision(jsonb)',
    'EXECUTE'
  )
  and not pg_catalog.has_function_privilege(
    'public',
    'api.get_safe_authorization_decision(jsonb)',
    'EXECUTE'
  )
  and not pg_catalog.has_function_privilege(
    'service_role',
    'api.get_safe_authorization_decision(jsonb)',
    'EXECUTE'
  ),
  '153 safe wrapper grant is exact: authenticated only'
);

select is(
  (
    select pg_catalog.count(*)
    from
      pg_catalog.pg_policy p
    where coalesce(
            pg_catalog.pg_get_expr(
              p.polqual,
              p.polrelid
            ),
            ''
          ) ilike
          '%authorization_policy_allows%'
       or coalesce(
            pg_catalog.pg_get_expr(
              p.polwithcheck,
              p.polrelid
            ),
            ''
          ) ilike
          '%authorization_policy_allows%'
  ),
  0::bigint,
  '154 AUTH-DB-034 does not attach the new predicate to legacy policies'
);

select * from finish();

rollback;
