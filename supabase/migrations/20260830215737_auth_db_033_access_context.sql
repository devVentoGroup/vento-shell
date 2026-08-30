-- AUTH-DB-033: deterministic AccessContext resolver and safe authenticated projection.
begin;

do $auth_db_033_preconditions$
begin
  if not exists (
    select 1 from pg_catalog.pg_roles
    where rolname = 'vento_access_context_owner'
      and not rolcanlogin and not rolinherit and not rolsuper
      and not rolcreatedb and not rolcreaterole and not rolreplication
      and not rolbypassrls
  ) then
    raise exception 'AUTH_DB_033_OWNER_MISSING_OR_UNSAFE';
  end if;

  if to_regnamespace('app_private') is null
     or to_regnamespace('api') is null
     or to_regclass('identity_access.principals') is null
     or to_regclass('identity_access.enterprise_identity_links') is null then
    raise exception 'AUTH_DB_033_REQUIRED_FOUNDATION_MISSING';
  end if;

  if to_regprocedure('app_private.get_access_context(text)') is not null
     or to_regprocedure('api.get_safe_access_context(text)') is not null then
    raise exception 'AUTH_DB_033_TARGET_OBJECT_ALREADY_EXISTS';
  end if;
end
$auth_db_033_preconditions$;

grant usage, create on schema app_private, api to vento_access_context_owner;
grant usage on schema identity_access, extensions to vento_access_context_owner;

-- AUTH-DB-019 tables are owned by the NOINHERIT DDL owner. PostgreSQL only
-- applies a table grant from its owner (or a role with grant option), so enter
-- that role explicitly instead of accepting a no-op GRANT warning.
set local role vento_ddl_owner;
grant select on identity_access.principals,
  identity_access.enterprise_identity_links
to vento_access_context_owner;
reset role;

grant execute on function extensions.digest(text, text)
to vento_access_context_owner;

set local role vento_access_context_owner;

create function app_private.resolve_access_application(
  p_application_code text,
  p_resolved_at timestamptz
) returns jsonb
language sql
stable
set search_path = pg_catalog
as $function$
  select case lower(btrim(p_application_code))
    when 'shell' then jsonb_build_object('valid', true, 'app_code', 'shell', 'domain', 'laboral', 'resolved_at', p_resolved_at)
    when 'anima' then jsonb_build_object('valid', true, 'app_code', 'anima', 'domain', 'laboral', 'resolved_at', p_resolved_at)
    when 'viso' then jsonb_build_object('valid', true, 'app_code', 'viso', 'domain', 'laboral', 'resolved_at', p_resolved_at)
    when 'nexo' then jsonb_build_object('valid', true, 'app_code', 'nexo', 'domain', 'laboral', 'resolved_at', p_resolved_at)
    when 'fogo' then jsonb_build_object('valid', true, 'app_code', 'fogo', 'domain', 'laboral', 'resolved_at', p_resolved_at)
    when 'origo' then jsonb_build_object('valid', true, 'app_code', 'origo', 'domain', 'laboral', 'resolved_at', p_resolved_at)
    when 'pulso' then jsonb_build_object('valid', true, 'app_code', 'pulso', 'domain', 'laboral', 'resolved_at', p_resolved_at)
    when 'numera' then jsonb_build_object('valid', true, 'app_code', 'numera', 'domain', 'laboral', 'resolved_at', p_resolved_at)
    when 'aura' then jsonb_build_object('valid', true, 'app_code', 'aura', 'domain', 'laboral', 'resolved_at', p_resolved_at)
    when 'pass' then jsonb_build_object('valid', true, 'app_code', 'pass', 'domain', 'cliente', 'resolved_at', p_resolved_at)
    else jsonb_build_object('valid', false, 'app_code', lower(btrim(p_application_code)), 'domain', null, 'resolved_at', p_resolved_at)
  end;
$function$;

create function app_private.resolve_access_principal(
  p_application_code text,
  p_resolved_at timestamptz,
  p_application jsonb
) returns jsonb
language plpgsql
stable
security definer
set search_path = pg_catalog, identity_access
as $function$
declare
  v_subject_text text := nullif(current_setting('request.jwt.claim.sub', true), '');
  v_subject uuid;
  v_count bigint := 0;
  v_principal identity_access.principals%rowtype;
  v_issue jsonb;
begin
  if v_subject_text is not null and v_subject_text ~* '^[0-9a-f]{8}-[0-9a-f]{4}-[1-5][0-9a-f]{3}-[89ab][0-9a-f]{3}-[0-9a-f]{12}$' then
    v_subject := v_subject_text::uuid;
  end if;

  if v_subject is null then
    v_issue := jsonb_build_object(
      'issue_code', 'AUTH_UNAUTHENTICATED', 'severity', 'BLOCKING_ALL',
      'subject_type', 'PRINCIPAL', 'subject_id', null,
      'source', 'PRINCIPAL_RESOLVER',
      'safe_message', 'No existe una autenticación válida para resolver el contexto.'
    );
    return jsonb_build_object(
      'principal', jsonb_build_object(
        'principal_type', 'ANONYMOUS', 'auth_user_id', null, 'session_id', null,
        'authenticated', false, 'authentication_method', null,
        'authenticated_at', null, 'session_expires_at', null,
        'principal_status', 'ANONYMOUS'
      ),
      'principal_id', null,
      'issues', jsonb_build_array(v_issue)
    );
  end if;

  select count(*)
    into v_count
  from identity_access.principals p
  where p.auth_subject_id = v_subject;

  if v_count = 1 then
    select * into v_principal
    from identity_access.principals p
    where p.auth_subject_id = v_subject;
  end if;

  if v_count <> 1 then
    v_issue := jsonb_build_object(
      'issue_code', case when v_count = 0 then 'PRINCIPAL_NOT_LINKED' else 'PRINCIPAL_AMBIGUOUS' end,
      'severity', 'BLOCKING_ALL', 'subject_type', 'PRINCIPAL',
      'subject_id', v_subject::text, 'source', 'PRINCIPAL_RESOLVER',
      'safe_message', case when v_count = 0
        then 'La identidad autenticada no está vinculada con una identidad empresarial válida.'
        else 'La identidad autenticada corresponde a más de un principal empresarial.' end
    );
  end if;

  return jsonb_build_object(
    'principal', jsonb_build_object(
      'principal_type', case coalesce(v_principal.principal_kind, 'HUMAN_USER')
        when 'SERVICE' then 'SYSTEM_SERVICE'
        else coalesce(v_principal.principal_kind, 'HUMAN_USER') end,
      'auth_user_id', v_subject::text,
      'session_id', nullif(current_setting('request.jwt.claim.session_id', true), ''),
      'authenticated', true,
      'authentication_method', nullif(current_setting('request.jwt.claim.amr', true), ''),
      'authenticated_at', nullif(current_setting('request.jwt.claim.iat', true), ''),
      'session_expires_at', nullif(current_setting('request.jwt.claim.exp', true), ''),
      'principal_status', case when v_count = 1 then 'VALID' else 'INVALID' end
    ),
    'principal_id', case when v_count = 1 then v_principal.id::text else null end,
    'issues', case when v_issue is null then '[]'::jsonb else jsonb_build_array(v_issue) end,
    'application_code', p_application_code,
    'resolved_at', p_resolved_at,
    'application_valid', coalesce((p_application ->> 'valid')::boolean, false)
  );
end;
$function$;

create function app_private.resolve_access_actor(
  p_application_code text,
  p_resolved_at timestamptz,
  p_application jsonb,
  p_principal jsonb
) returns jsonb
language plpgsql
stable
security definer
set search_path = pg_catalog, identity_access
as $function$
declare
  v_principal_id uuid;
  v_expected_kind text;
  v_count bigint := 0;
  v_link identity_access.enterprise_identity_links%rowtype;
  v_issue jsonb;
begin
  if nullif(p_principal ->> 'principal_id', '') is not null then
    v_principal_id := (p_principal ->> 'principal_id')::uuid;
  end if;
  v_expected_kind := case when p_application ->> 'domain' = 'cliente' then 'CUSTOMER' else 'EMPLOYEE' end;

  if v_principal_id is not null then
    select count(*) into v_count
    from identity_access.enterprise_identity_links l
    where l.principal_id = v_principal_id
      and l.enterprise_identity_kind = v_expected_kind
      and l.link_state = 'ACTIVE';
  end if;

  if v_count = 1 then
    select * into v_link
    from identity_access.enterprise_identity_links l
    where l.principal_id = v_principal_id
      and l.enterprise_identity_kind = v_expected_kind
      and l.link_state = 'ACTIVE';
    if v_expected_kind = 'EMPLOYEE' then
      v_issue := jsonb_build_object(
        'issue_code', 'EMPLOYEE_MISSING', 'severity', 'BLOCKING_ALL',
        'subject_type', 'EMPLOYEE', 'subject_id', v_link.enterprise_identity_id::text,
        'source', 'EMPLOYEE_RESOLVER',
        'safe_message', 'No fue posible resolver el trabajador requerido para este contexto.'
      );
    end if;
  elsif v_principal_id is not null then
    v_issue := jsonb_build_object(
      'issue_code', case when v_count = 0 then
        case when v_expected_kind = 'EMPLOYEE' then 'EMPLOYEE_MISSING' else 'DOMAIN_IDENTITY_INACTIVE' end
        else 'DOMAIN_IDENTITY_AMBIGUOUS' end,
      'severity', 'BLOCKING_ALL',
      'subject_type', case when v_expected_kind = 'EMPLOYEE' then 'EMPLOYEE' else 'DOMAIN_IDENTITY' end,
      'subject_id', v_principal_id::text,
      'source', case when v_expected_kind = 'EMPLOYEE' then 'EMPLOYEE_RESOLVER' else 'DOMAIN_IDENTITY_RESOLVER' end,
      'safe_message', case when v_count = 0
        then 'No existe una identidad de dominio activa y explícitamente vinculada para este contexto.'
        else 'La identidad de dominio no puede resolverse de forma única.' end
    );
  end if;

  return jsonb_build_object(
    'actor_effective', jsonb_build_object(
      'actor_type', case when v_count = 1 then
        case v_link.enterprise_identity_kind when 'EMPLOYEE' then 'EMPLOYEE' when 'CUSTOMER' then 'CUSTOMER' when 'DEVICE' then 'UNRESOLVED' else 'SYSTEM' end
        else 'UNRESOLVED' end,
      'actor_id', case when v_count = 1 then v_link.enterprise_identity_id::text else null end,
      'attribution_source', case when v_count = 1 then 'DOMAIN_IDENTITY' else 'NONE' end,
      'delegation_id', null,
      'resolved', v_count = 1
    ),
    'domain_identity', case when v_count = 1 then jsonb_build_object(
      'identity_type', case v_link.enterprise_identity_kind when 'SYSTEM_ACTOR' then 'SYSTEM' else v_link.enterprise_identity_kind end,
      'identity_id', v_link.enterprise_identity_id::text,
      'status', 'ACTIVE', 'source', 'identity_access.enterprise_identity_links'
    ) else null end,
    -- An identity link is not employment authority. Workforce is intentionally
    -- unresolved until its canonical owner source is physically materialized.
    'employee', null,
    'issues', case when v_issue is null then '[]'::jsonb else jsonb_build_array(v_issue) end,
    'application_code', p_application_code,
    'resolved_at', p_resolved_at
  );
end;
$function$;

create function app_private.resolve_access_base_lane(
  p_application_code text,
  p_resolved_at timestamptz,
  p_principal jsonb,
  p_actor jsonb
) returns jsonb
language sql
stable
set search_path = pg_catalog
as $function$
  select jsonb_build_object(
    'base_role', null,
    'assigned_sites', '[]'::jsonb,
    'assigned_areas', '[]'::jsonb,
    'administrative_coverage', jsonb_build_object(
      'mode', 'NONE', 'site_ids', '[]'::jsonb, 'area_ids', '[]'::jsonb,
      'source', 'NOT_MATERIALIZED', 'valid', false
    ),
    'lane', jsonb_build_object(
      'status', 'UNAVAILABLE',
      'reason_codes', case when p_actor #>> '{actor_effective,actor_type}' = 'EMPLOYEE'
        then jsonb_build_array('BASE_ROLE_NOT_AVAILABLE')
        else jsonb_build_array('NON_LABOR_ACTOR') end
    ),
    'application_code', p_application_code,
    'resolved_at', p_resolved_at,
    'principal_status', p_principal #>> '{principal,principal_status}'
  );
$function$;

create function app_private.resolve_access_operational_lane(
  p_application_code text,
  p_resolved_at timestamptz,
  p_actor jsonb,
  p_base_lane jsonb
) returns jsonb
language sql
stable
set search_path = pg_catalog
as $function$
  select jsonb_build_object(
    'active_shift', null, 'active_checkin_session', null,
    'operational_role', null, 'operational_site', null, 'operational_area', null,
    'lane', jsonb_build_object('status', 'UNAVAILABLE', 'reason_codes', jsonb_build_array('NO_ACTIVE_SHIFT')),
    'application_code', p_application_code, 'resolved_at', p_resolved_at,
    'base_status', p_base_lane #>> '{lane,status}',
    'actor_type', p_actor #>> '{actor_effective,actor_type}'
  );
$function$;

create function app_private.resolve_access_device(
  p_application_code text,
  p_resolved_at timestamptz,
  p_principal jsonb,
  p_actor jsonb,
  p_operational_lane jsonb
) returns jsonb
language sql
stable
set search_path = pg_catalog
as $function$
  select jsonb_build_object(
    'device_context', null,
    'issues', '[]'::jsonb,
    'application_code', p_application_code,
    'resolved_at', p_resolved_at,
    'principal_type', p_principal #>> '{principal,principal_type}',
    'actor_type', p_actor #>> '{actor_effective,actor_type}',
    'operational_status', p_operational_lane #>> '{lane,status}'
  );
$function$;

create function app_private.validate_access_context(p_context jsonb)
returns jsonb
language plpgsql
immutable
set search_path = pg_catalog
as $function$
begin
  if p_context is null
     or not (p_context ?& array[
       'contract_family', 'contract_family_version', 'contract_name',
       'contract_version', 'schema_version', 'context_id', 'resolved_at',
       'principal', 'actor_effective', 'lane_readiness',
       'structural_issues', 'resolution_metadata'
     ])
     or jsonb_typeof(p_context -> 'structural_issues') <> 'array' then
    raise exception using errcode = '22023', message = 'AUTH_DB_033_ACCESS_CONTEXT_INVALID';
  end if;
  return p_context;
end;
$function$;

create function app_private.canonicalize_access_context(p_context jsonb)
returns text
language sql
immutable
strict
set search_path = pg_catalog
as $function$
  -- jsonb normalizes object-key order; every resolver-owned array is produced in
  -- canonical order. Volatile snapshot identity is excluded from fingerprints.
  select (p_context - 'context_id' - 'resolved_at')::text;
$function$;

create function app_private.fingerprint_access_context(p_context jsonb)
returns text
language sql
immutable
strict
set search_path = pg_catalog, extensions
as $function$
  select 'sha256:' || encode(extensions.digest(
    app_private.canonicalize_access_context(p_context), 'sha256'
  ), 'hex');
$function$;

create function app_private.project_safe_access_context(
  p_application_code text,
  p_context jsonb
) returns jsonb
language sql
stable
set search_path = pg_catalog, app_private
as $function$
  select jsonb_build_object(
    'context_id', p_context ->> 'context_id',
    'resolved_at', p_context ->> 'resolved_at',
    'context_fingerprint', app_private.fingerprint_access_context(p_context),
    'expires_at', ((p_context ->> 'resolved_at')::timestamptz + interval '5 minutes'),
    'safe_fields', jsonb_build_object(
      'application_code', lower(btrim(p_application_code)),
      'principal_type', p_context #>> '{principal,principal_type}',
      'actor_type', p_context #>> '{actor_effective,actor_type}',
      'employee_active', p_context #> '{employee,is_active}',
      'base_role_code', p_context #>> '{base_role,role_code}',
      'operational_role_code', p_context #>> '{operational_role,role_code}',
      'operational_site_code', p_context #>> '{operational_site,site_code}',
      'operational_area_kind', p_context #>> '{operational_area,area_kind}',
      'operational_area_code', p_context #>> '{operational_area,area_code}',
      'device_mode', p_context #>> '{device_context,device_type}',
      'lane_readiness', p_context -> 'lane_readiness',
      'issue_codes', coalesce((
        select jsonb_agg(issue ->> 'issue_code' order by issue ->> 'issue_code')
        from jsonb_array_elements(p_context -> 'structural_issues') issue
      ), '[]'::jsonb)
    )
  );
$function$;

create function app_private.get_access_context(p_application_code text)
returns jsonb
language plpgsql
stable
security definer
set search_path = pg_catalog, app_private
as $function$
declare
  v_resolved_at timestamptz := statement_timestamp();
  v_application jsonb;
  v_principal jsonb;
  v_actor jsonb;
  v_base jsonb;
  v_operational jsonb;
  v_device jsonb;
  v_issues jsonb := '[]'::jsonb;
  v_context jsonb;
begin
  if p_application_code is null or btrim(p_application_code) = '' then
    raise exception using errcode = '22023', message = 'AUTH_DB_033_APPLICATION_CODE_REQUIRED';
  end if;

  v_application := app_private.resolve_access_application(p_application_code, v_resolved_at);
  v_principal := app_private.resolve_access_principal(p_application_code, v_resolved_at, v_application);
  v_actor := app_private.resolve_access_actor(p_application_code, v_resolved_at, v_application, v_principal);
  v_base := app_private.resolve_access_base_lane(p_application_code, v_resolved_at, v_principal, v_actor);
  v_operational := app_private.resolve_access_operational_lane(p_application_code, v_resolved_at, v_actor, v_base);
  v_device := app_private.resolve_access_device(p_application_code, v_resolved_at, v_principal, v_actor, v_operational);

  v_issues := coalesce(v_principal -> 'issues', '[]'::jsonb)
    || coalesce(v_actor -> 'issues', '[]'::jsonb)
    || coalesce(v_device -> 'issues', '[]'::jsonb);
  if not coalesce((v_application ->> 'valid')::boolean, false) then
    v_issues := v_issues || jsonb_build_array(jsonb_build_object(
      'issue_code', 'RESOLVER_CONFIGURATION_MISSING', 'severity', 'BLOCKING_ALL',
      'subject_type', 'CONFIGURATION', 'subject_id', lower(btrim(p_application_code)),
      'source', 'CONTEXT_VALIDATOR',
      'safe_message', 'La aplicación solicitada no pertenece al catálogo de autorización vigente.'
    ));
  end if;

  v_context := jsonb_build_object(
    'contract_family', 'vento.authorization.response-contracts',
    'contract_family_version', '1.0.0', 'contract_name', 'AccessContext',
    'contract_version', '1.0.0', 'schema_version', '1.0.0',
    'context_id', gen_random_uuid()::text, 'resolved_at', v_resolved_at,
    'principal', v_principal -> 'principal',
    'actor_effective', v_actor -> 'actor_effective',
    'domain_identity', v_actor -> 'domain_identity', 'employee', v_actor -> 'employee',
    'base_role', v_base -> 'base_role', 'assigned_sites', v_base -> 'assigned_sites',
    'assigned_areas', v_base -> 'assigned_areas',
    'administrative_coverage', v_base -> 'administrative_coverage',
    'active_shift', v_operational -> 'active_shift',
    'active_checkin_session', v_operational -> 'active_checkin_session',
    'operational_role', v_operational -> 'operational_role',
    'operational_site', v_operational -> 'operational_site',
    'operational_area', v_operational -> 'operational_area',
    'device_context', v_device -> 'device_context',
    'lane_readiness', jsonb_build_object('base', v_base -> 'lane', 'operational', v_operational -> 'lane'),
    'structural_issues', v_issues,
    'resolution_metadata', jsonb_build_object(
      'resolver', 'vento.authorization.get_access_context', 'resolver_version', '1.0.0',
      'authorization_contract_version', '1.0.0', 'catalog_version', '1.0.0',
      'source_versions', jsonb_build_object(
        'application_catalog', '1.0.0', 'principal_registry', 'AUTH-DB-019',
        'enterprise_identity_links', 'AUTH-DB-019', 'domain_identity_policy', '1.0.0',
        'actor_resolution_model', '1.0.0', 'structural_issue_catalog', '1.0.0'
      ),
      'source_fingerprints', jsonb_build_object(
        'application_catalog', 'sha256:63450829623c0d1fcc490b7417d70f71b61a2c160b029437412bc01b82de40f8',
        'principal_registry', 'sha256:3cb6dbcaa753906f97cae2f9447c7cd1bf5bfd31f7a6d6a7efe0ec1382c66e16',
        'enterprise_identity_links', 'sha256:3cb6dbcaa753906f97cae2f9447c7cd1bf5bfd31f7a6d6a7efe0ec1382c66e16',
        'domain_identity_policy', 'sha256:65ee7af60a650f0e4873f97600aa37339b117a87db02b791a7cb6c88477ffa7b',
        'actor_resolution_model', 'sha256:65ee7af60a650f0e4873f97600aa37339b117a87db02b791a7cb6c88477ffa7b',
        'structural_issue_catalog', 'sha256:ef042d037827ce14470e1cffa7ba3c76bf88318a21a65644cd465efdc65b5122'
      ),
      'cache_status', 'NOT_IMPLEMENTED'
    )
  );
  return app_private.validate_access_context(v_context);
end;
$function$;

create function api.get_safe_access_context(p_application_code text)
returns jsonb
language sql
stable
security definer
set search_path = pg_catalog, app_private
as $function$
  select app_private.project_safe_access_context(
    p_application_code,
    app_private.get_access_context(p_application_code)
  );
$function$;

comment on function app_private.canonicalize_access_context(jsonb) is
  'AUTH-DB-033 canonical JSON representation. jsonb normalizes object keys; all resolver arrays are emitted in deterministic order; volatile snapshot identity is excluded.';
comment on function app_private.get_access_context(text) is
  'AUTH-DB-033 full private AccessContext resolver. Captures one server timestamp and returns structural results for unresolved valid applications.';
comment on function api.get_safe_access_context(text) is
  'AUTH-DB-033 authenticated-only safe AccessContext projection. It exposes no internal identity, source, session, permission, grant, or denial identifiers.';

revoke all on function
  app_private.resolve_access_application(text, timestamptz),
  app_private.resolve_access_principal(text, timestamptz, jsonb),
  app_private.resolve_access_actor(text, timestamptz, jsonb, jsonb),
  app_private.resolve_access_base_lane(text, timestamptz, jsonb, jsonb),
  app_private.resolve_access_operational_lane(text, timestamptz, jsonb, jsonb),
  app_private.resolve_access_device(text, timestamptz, jsonb, jsonb, jsonb),
  app_private.validate_access_context(jsonb),
  app_private.canonicalize_access_context(jsonb),
  app_private.fingerprint_access_context(jsonb),
  app_private.project_safe_access_context(text, jsonb),
  app_private.get_access_context(text)
from public, anon, authenticated, service_role;

-- postgres is the governed migration/test administrator. The owner is
-- deliberately NOINHERIT, so administrative inspection must be explicit.
grant execute on function
  app_private.get_access_context(text),
  app_private.canonicalize_access_context(jsonb),
  app_private.fingerprint_access_context(jsonb)
to postgres;

revoke all on function api.get_safe_access_context(text)
from public, anon, authenticated, service_role;
grant execute on function api.get_safe_access_context(text) to authenticated;

reset role;

revoke create on schema app_private, api from vento_access_context_owner;

do $auth_db_033_postconditions$
begin
  if pg_catalog.pg_get_userbyid(
      (select p.proowner from pg_catalog.pg_proc p where p.oid = 'app_private.get_access_context(text)'::regprocedure)
    ) <> 'vento_access_context_owner'
     or pg_catalog.pg_get_userbyid(
      (select p.proowner from pg_catalog.pg_proc p where p.oid = 'api.get_safe_access_context(text)'::regprocedure)
    ) <> 'vento_access_context_owner' then
    raise exception 'AUTH_DB_033_OWNER_DRIFT';
  end if;

  if not has_table_privilege(
      'vento_access_context_owner', 'identity_access.principals', 'SELECT'
    )
     or not has_table_privilege(
      'vento_access_context_owner', 'identity_access.enterprise_identity_links', 'SELECT'
    ) then
    raise exception 'AUTH_DB_033_DEPENDENCY_GRANT_DRIFT';
  end if;

  if has_function_privilege('anon', 'api.get_safe_access_context(text)', 'EXECUTE')
     or not has_function_privilege('authenticated', 'api.get_safe_access_context(text)', 'EXECUTE')
     or has_function_privilege('authenticated', 'app_private.get_access_context(text)', 'EXECUTE') then
    raise exception 'AUTH_DB_033_EXECUTE_BOUNDARY_DRIFT';
  end if;
end
$auth_db_033_postconditions$;

commit;
