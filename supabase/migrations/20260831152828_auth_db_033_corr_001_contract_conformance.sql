-- AUTH-DB-033::CORR-001
-- Restores AccessContext contract conformance without rewriting the historical
-- migration. The safe Data API wrapper remains withheld until every canonical
-- owner source required by AUTH-DB-033 is physically available.

begin;

do $auth_db_033_corr_001_preconditions$
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
    raise exception 'AUTH_DB_033_CORR_001_OWNER_MISSING_OR_UNSAFE';
  end if;

  if pg_catalog.to_regclass('identity_access.principals') is null
     or pg_catalog.to_regclass('identity_access.enterprise_identity_links') is null
     or pg_catalog.to_regprocedure('extensions.digest(text,text)') is null
     or pg_catalog.to_regprocedure('extensions.gen_random_uuid()') is null then
    raise exception 'AUTH_DB_033_CORR_001_REQUIRED_FOUNDATION_MISSING';
  end if;

  if pg_catalog.to_regprocedure('app_private.get_access_context(text)') is null
     or pg_catalog.to_regprocedure('api.get_safe_access_context(text)') is null then
    raise exception 'AUTH_DB_033_CORR_001_HISTORICAL_GRAPH_MISSING';
  end if;
end
$auth_db_033_corr_001_preconditions$;

grant usage, create on schema app_private, api to vento_access_context_owner;

set local role vento_access_context_owner;

create or replace function app_private.access_context_issue_definition(
  p_issue_code text,
  p_subject_id text
) returns jsonb
language sql
immutable
security invoker
set search_path = pg_catalog, app_private
as $function$
  select case p_issue_code
    when 'AUTH_UNAUTHENTICATED' then pg_catalog.jsonb_build_object(
      'issue_code', 'AUTH_UNAUTHENTICATED',
      'severity', 'BLOCKING_ALL',
      'subject_type', 'PRINCIPAL',
      'subject_id', p_subject_id,
      'source', 'PRINCIPAL_RESOLVER',
      'safe_message', 'No existe una autenticación válida para resolver el contexto.'
    )
    when 'PRINCIPAL_NOT_LINKED' then pg_catalog.jsonb_build_object(
      'issue_code', 'PRINCIPAL_NOT_LINKED',
      'severity', 'BLOCKING_ALL',
      'subject_type', 'PRINCIPAL',
      'subject_id', p_subject_id,
      'source', 'PRINCIPAL_RESOLVER',
      'safe_message', 'La identidad autenticada no está vinculada con una identidad empresarial válida.'
    )
    when 'PRINCIPAL_AMBIGUOUS' then pg_catalog.jsonb_build_object(
      'issue_code', 'PRINCIPAL_AMBIGUOUS',
      'severity', 'BLOCKING_ALL',
      'subject_type', 'PRINCIPAL',
      'subject_id', p_subject_id,
      'source', 'PRINCIPAL_RESOLVER',
      'safe_message', 'La identidad autenticada corresponde a más de un principal empresarial.'
    )
    when 'DOMAIN_IDENTITY_AMBIGUOUS' then pg_catalog.jsonb_build_object(
      'issue_code', 'DOMAIN_IDENTITY_AMBIGUOUS',
      'severity', 'BLOCKING_ALL',
      'subject_type', 'DOMAIN_IDENTITY',
      'subject_id', p_subject_id,
      'source', 'DOMAIN_IDENTITY_RESOLVER',
      'safe_message', 'La identidad de dominio no puede resolverse de forma única.'
    )
    when 'DOMAIN_IDENTITY_INACTIVE' then pg_catalog.jsonb_build_object(
      'issue_code', 'DOMAIN_IDENTITY_INACTIVE',
      'severity', 'BLOCKING_ALL',
      'subject_type', 'DOMAIN_IDENTITY',
      'subject_id', p_subject_id,
      'source', 'DOMAIN_IDENTITY_RESOLVER',
      'safe_message', 'La identidad de dominio resuelta no está activa.'
    )
    when 'EMPLOYEE_MISSING' then pg_catalog.jsonb_build_object(
      'issue_code', 'EMPLOYEE_MISSING',
      'severity', 'BLOCKING_ALL',
      'subject_type', 'EMPLOYEE',
      'subject_id', p_subject_id,
      'source', 'EMPLOYEE_RESOLVER',
      'safe_message', 'No fue posible resolver el trabajador requerido para este contexto.'
    )
    when 'DEVICE_UNRESOLVED' then pg_catalog.jsonb_build_object(
      'issue_code', 'DEVICE_UNRESOLVED',
      'severity', 'BLOCKING_ALL',
      'subject_type', 'DEVICE',
      'subject_id', p_subject_id,
      'source', 'DEVICE_RESOLVER',
      'safe_message', 'No fue posible resolver el dispositivo empresarial autenticado.'
    )
    when 'RESOLVER_CONFIGURATION_MISSING' then pg_catalog.jsonb_build_object(
      'issue_code', 'RESOLVER_CONFIGURATION_MISSING',
      'severity', 'BLOCKING_ALL',
      'subject_type', 'CONFIGURATION',
      'subject_id', p_subject_id,
      'source', 'CONTEXT_VALIDATOR',
      'safe_message', 'Falta una configuración obligatoria para resolver el contexto.'
    )
    else null
  end;
$function$;

create or replace function app_private.normalize_access_context_issues(
  p_issues jsonb
) returns jsonb
language plpgsql
immutable
security invoker
set search_path = pg_catalog, app_private
as $function$
declare
  v_result jsonb;
begin
  if p_issues is null or pg_catalog.jsonb_typeof(p_issues) <> 'array' then
    raise exception using
      errcode = '22023',
      message = 'AUTH_DB_033_STRUCTURAL_ISSUES_INVALID';
  end if;

  select coalesce(
    pg_catalog.jsonb_agg(
      issue order by
        case issue ->> 'severity'
          when 'BLOCKING_ALL' then 1
          when 'BLOCKING_BASE' then 2
          when 'BLOCKING_OPERATIONAL' then 3
          when 'WARNING' then 4
          when 'INFO' then 5
          else 6
        end,
        issue ->> 'issue_code',
        issue ->> 'subject_type',
        coalesce(issue ->> 'subject_id', ''),
        issue ->> 'source'
    ),
    '[]'::jsonb
  )
  into v_result
  from (
    select distinct element as issue
    from pg_catalog.jsonb_array_elements(p_issues) e(element)
  ) normalized;

  return v_result;
end;
$function$;

create or replace function app_private.canonicalize_json(
  p_value jsonb
) returns text
language plpgsql
immutable
strict
security invoker
set search_path = pg_catalog, app_private
as $function$
declare
  v_type text := pg_catalog.jsonb_typeof(p_value);
  v_result text;
begin
  case v_type
    when 'null' then
      return 'null';
    when 'boolean' then
      return case when (p_value #>> '{}')::boolean then 'true' else 'false' end;
    when 'number' then
      return pg_catalog.trim_scale((p_value #>> '{}')::numeric)::text;
    when 'string' then
      return pg_catalog.to_jsonb(normalize(p_value #>> '{}', NFC))::text;
    when 'array' then
      select '[' || coalesce(
        pg_catalog.string_agg(
          app_private.canonicalize_json(element),
          ',' order by ordinal
        ),
        ''
      ) || ']'
      into v_result
      from pg_catalog.jsonb_array_elements(p_value)
        with ordinality e(element, ordinal);
      return v_result;
    when 'object' then
      select '{' || coalesce(
        pg_catalog.string_agg(
          app_private.canonicalize_json(pg_catalog.to_jsonb(key))
            || ':' || app_private.canonicalize_json(value),
          ',' order by key collate "C"
        ),
        ''
      ) || '}'
      into v_result
      from pg_catalog.jsonb_each(p_value) e(key, value);
      return v_result;
    else
      raise exception using
        errcode = '22023',
        message = 'AUTH_DB_033_CANONICAL_JSON_TYPE_INVALID';
  end case;
end;
$function$;

create or replace function app_private.fingerprint_access_source(
  p_source_snapshot jsonb
) returns text
language sql
immutable
strict
security invoker
set search_path = pg_catalog, app_private
as $function$
  select 'sha256:' || pg_catalog.encode(
    extensions.digest(
      app_private.canonicalize_json(p_source_snapshot),
      'sha256'
    ),
    'hex'
  );
$function$;

create or replace function app_private.resolve_access_application(
  p_application_code text,
  p_resolved_at timestamptz
) returns jsonb
language sql
stable
security invoker
set search_path = pg_catalog, app_private
as $function$
  with catalog(app_code, app_domain, app_kind, lifecycle_status) as (
    values
      ('shell', 'laboral', 'hub', 'active'),
      ('anima', 'laboral', 'hybrid', 'active'),
      ('viso', 'laboral', 'administrative', 'active'),
      ('nexo', 'laboral', 'hybrid', 'active'),
      ('fogo', 'laboral', 'operational', 'active'),
      ('origo', 'laboral', 'hybrid', 'active'),
      ('pulso', 'laboral', 'operational', 'active'),
      ('numera', 'laboral', 'hybrid', 'active'),
      ('aura', 'laboral', 'administrative', 'active'),
      ('pass', 'cliente', 'customer', 'active')
  ), selected as (
    select *
    from catalog
    where app_code = p_application_code
  )
  select pg_catalog.jsonb_build_object(
    'valid', count(*) = 1,
    'app_code', p_application_code,
    'domain', case when count(*) = 1 then min(app_domain) else null end,
    'app_kind', case when count(*) = 1 then min(app_kind) else null end,
    'lifecycle_status', case when count(*) = 1 then min(lifecycle_status) else null end,
    'resolved_at', p_resolved_at,
    'source_snapshot', pg_catalog.jsonb_build_object(
      'requested_app_code', p_application_code,
      'matches', coalesce(
        pg_catalog.jsonb_agg(
          pg_catalog.jsonb_build_object(
            'app_code', app_code,
            'domain', app_domain,
            'app_kind', app_kind,
            'lifecycle_status', lifecycle_status
          ) order by app_code
        ) filter (where app_code is not null),
        '[]'::jsonb
      )
    )
  )
  from selected;
$function$;

create or replace function app_private.resolve_access_principal(
  p_application_code text,
  p_resolved_at timestamptz,
  p_application jsonb
) returns jsonb
language plpgsql
stable
security invoker
set search_path = pg_catalog, app_private
as $function$
declare
  v_claims jsonb := '{}'::jsonb;
  v_claims_text text := nullif(
    pg_catalog.current_setting('request.jwt.claims', true),
    ''
  );
  v_subject_text text;
  v_subject uuid;
  v_count bigint := 0;
  v_principal identity_access.principals%rowtype;
  v_issue jsonb;
  v_iat_text text;
  v_exp_text text;
  v_authenticated_at text;
  v_session_expires_at text;
  v_authentication_method text;
  v_source_snapshot jsonb;
begin
  if v_claims_text is not null then
    begin
      v_claims := v_claims_text::jsonb;
    exception when others then
      v_claims := '{}'::jsonb;
    end;
  end if;

  v_subject_text := coalesce(
    nullif(
      pg_catalog.current_setting('request.jwt.claim.sub', true),
      ''
    ),
    nullif(v_claims ->> 'sub', '')
  );
  v_iat_text := coalesce(
    nullif(
      pg_catalog.current_setting('request.jwt.claim.iat', true),
      ''
    ),
    nullif(v_claims ->> 'iat', '')
  );
  v_exp_text := coalesce(
    nullif(
      pg_catalog.current_setting('request.jwt.claim.exp', true),
      ''
    ),
    nullif(v_claims ->> 'exp', '')
  );
  v_authentication_method := coalesce(
    nullif(
      pg_catalog.current_setting('request.jwt.claim.amr', true),
      ''
    ),
    nullif(v_claims ->> 'aal', ''),
    nullif(v_claims ->> 'amr', '')
  );

  if v_iat_text ~ '^[0-9]+(?:\.[0-9]+)?$' then
    v_authenticated_at := pg_catalog.to_char(
      pg_catalog.to_timestamp(v_iat_text::double precision)
        at time zone 'UTC',
      'YYYY-MM-DD"T"HH24:MI:SS.US"Z"'
    );
  end if;
  if v_exp_text ~ '^[0-9]+(?:\.[0-9]+)?$' then
    v_session_expires_at := pg_catalog.to_char(
      pg_catalog.to_timestamp(v_exp_text::double precision)
        at time zone 'UTC',
      'YYYY-MM-DD"T"HH24:MI:SS.US"Z"'
    );
  end if;

  begin
    v_subject := v_subject_text::uuid;
  exception when invalid_text_representation then
    v_subject := null;
  end;

  if v_subject is null then
    v_issue := app_private.access_context_issue_definition(
      'AUTH_UNAUTHENTICATED',
      null
    );
    return pg_catalog.jsonb_build_object(
      'principal', pg_catalog.jsonb_build_object(
        'principal_type', 'ANONYMOUS',
        'auth_user_id', null,
        'session_id', null,
        'authenticated', false,
        'authentication_method', null,
        'authenticated_at', null,
        'session_expires_at', null,
        'principal_status', 'ANONYMOUS'
      ),
      'principal_id', null,
      'issues', pg_catalog.jsonb_build_array(v_issue),
      'source_snapshot', pg_catalog.jsonb_build_object(
        'auth_subject_id', null,
        'matches', '[]'::jsonb
      )
    );
  end if;

  select count(*)
  into v_count
  from identity_access.principals p
  where p.auth_subject_id = v_subject;

  if v_count = 1 then
    select p.*
    into strict v_principal
    from identity_access.principals p
    where p.auth_subject_id = v_subject;
  elsif v_count = 0 then
    v_issue := app_private.access_context_issue_definition(
      'PRINCIPAL_NOT_LINKED',
      v_subject::text
    );
  else
    v_issue := app_private.access_context_issue_definition(
      'PRINCIPAL_AMBIGUOUS',
      v_subject::text
    );
  end if;

  select pg_catalog.jsonb_build_object(
    'auth_subject_id', v_subject::text,
    'matches', coalesce(
      pg_catalog.jsonb_agg(
        pg_catalog.jsonb_build_object(
          'principal_id', p.id::text,
          'principal_kind', p.principal_kind,
          'source_version', p.source_version
        ) order by p.id
      ),
      '[]'::jsonb
    )
  )
  into v_source_snapshot
  from identity_access.principals p
  where p.auth_subject_id = v_subject;

  return pg_catalog.jsonb_build_object(
    'principal', pg_catalog.jsonb_build_object(
      'principal_type', case
        when v_count = 1 and v_principal.principal_kind = 'SERVICE'
          then 'SYSTEM_SERVICE'
        when v_count = 1 then v_principal.principal_kind
        else 'HUMAN_USER'
      end,
      'auth_user_id', v_subject::text,
      'session_id', coalesce(
        nullif(
          pg_catalog.current_setting('request.jwt.claim.session_id', true),
          ''
        ),
        nullif(v_claims ->> 'session_id', '')
      ),
      'authenticated', true,
      'authentication_method', v_authentication_method,
      'authenticated_at', v_authenticated_at,
      'session_expires_at', v_session_expires_at,
      'principal_status', case when v_count > 1 then 'INVALID' else 'VALID' end
    ),
    'principal_id', case when v_count = 1 then v_principal.id::text else null end,
    'issues', case
      when v_issue is null then '[]'::jsonb
      else pg_catalog.jsonb_build_array(v_issue)
    end,
    'application_code', p_application_code,
    'resolved_at', p_resolved_at,
    'application_valid', coalesce((p_application ->> 'valid')::boolean, false),
    'source_snapshot', v_source_snapshot
  );
end;
$function$;

create or replace function app_private.resolve_access_actor(
  p_application_code text,
  p_resolved_at timestamptz,
  p_application jsonb,
  p_principal jsonb
) returns jsonb
language plpgsql
stable
security invoker
set search_path = pg_catalog, app_private
as $function$
declare
  v_principal_id uuid;
  v_principal_type text := p_principal #>> '{principal,principal_type}';
  v_expected_kind text;
  v_active_count bigint := 0;
  v_total_count bigint := 0;
  v_link identity_access.enterprise_identity_links%rowtype;
  v_issue jsonb;
  v_source_snapshot jsonb;
  v_actor_type text := 'UNRESOLVED';
  v_attribution_source text := 'NONE';
  v_resolved boolean := false;
begin
  if nullif(p_principal ->> 'principal_id', '') is not null then
    v_principal_id := (p_principal ->> 'principal_id')::uuid;
  end if;

  v_expected_kind := case
    when v_principal_type = 'SYSTEM_SERVICE' then 'SYSTEM_ACTOR'
    when v_principal_type = 'SHARED_DEVICE' then 'DEVICE'
    when p_application ->> 'domain' = 'cliente' then 'CUSTOMER'
    else 'EMPLOYEE'
  end;

  if v_principal_id is not null then
    select count(*), count(*) filter (where l.link_state = 'ACTIVE')
    into v_total_count, v_active_count
    from identity_access.enterprise_identity_links l
    where l.principal_id = v_principal_id
      and l.enterprise_identity_kind = v_expected_kind;

    if v_active_count = 1 then
      select l.*
      into strict v_link
      from identity_access.enterprise_identity_links l
      where l.principal_id = v_principal_id
        and l.enterprise_identity_kind = v_expected_kind
        and l.link_state = 'ACTIVE';
    end if;

    select pg_catalog.jsonb_build_object(
      'principal_id', v_principal_id::text,
      'expected_identity_kind', v_expected_kind,
      'matches', coalesce(
        pg_catalog.jsonb_agg(
          pg_catalog.jsonb_build_object(
            'link_id', l.id::text,
            'enterprise_identity_kind', l.enterprise_identity_kind,
            'enterprise_identity_id', l.enterprise_identity_id::text,
            'link_state', l.link_state,
            'source_version', l.source_version
          ) order by l.id
        ),
        '[]'::jsonb
      )
    )
    into v_source_snapshot
    from identity_access.enterprise_identity_links l
    where l.principal_id = v_principal_id
      and l.enterprise_identity_kind = v_expected_kind;
  else
    v_source_snapshot := pg_catalog.jsonb_build_object(
      'principal_id', null,
      'expected_identity_kind', v_expected_kind,
      'matches', '[]'::jsonb
    );
  end if;

  if v_principal_id is not null and v_active_count > 1 then
    v_issue := app_private.access_context_issue_definition(
      'DOMAIN_IDENTITY_AMBIGUOUS',
      v_principal_id::text
    );
  elsif v_principal_id is not null and v_active_count = 0 then
    v_issue := case
      when v_expected_kind = 'EMPLOYEE' then
        app_private.access_context_issue_definition(
          'EMPLOYEE_MISSING',
          v_principal_id::text
        )
      else
        app_private.access_context_issue_definition(
          'DOMAIN_IDENTITY_INACTIVE',
          v_principal_id::text
        )
    end;
  elsif v_active_count = 1 then
    v_actor_type := case v_link.enterprise_identity_kind
      when 'EMPLOYEE' then 'EMPLOYEE'
      when 'CUSTOMER' then 'CUSTOMER'
      when 'SYSTEM_ACTOR' then 'SYSTEM'
      else 'UNRESOLVED'
    end;
    v_attribution_source := case
      when v_link.enterprise_identity_kind = 'DEVICE' then 'NONE'
      when v_link.enterprise_identity_kind = 'SYSTEM_ACTOR' then 'SYSTEM_PROCESS'
      else 'DOMAIN_IDENTITY'
    end;
    v_resolved := v_actor_type <> 'UNRESOLVED';

    -- The identity link is not an employment record. Until the workforce owner
    -- source exists, laboral resolution is contained with canonical metadata.
    if v_link.enterprise_identity_kind = 'EMPLOYEE' then
      v_issue := app_private.access_context_issue_definition(
        'EMPLOYEE_MISSING',
        v_link.enterprise_identity_id::text
      );
    elsif v_link.enterprise_identity_kind = 'SYSTEM_ACTOR' then
      v_actor_type := 'UNRESOLVED';
      v_attribution_source := 'NONE';
      v_resolved := false;
      v_issue := app_private.access_context_issue_definition(
        'RESOLVER_CONFIGURATION_MISSING',
        p_application_code
      );
    end if;
  end if;

  return pg_catalog.jsonb_build_object(
    'actor_effective', pg_catalog.jsonb_build_object(
      'actor_type', v_actor_type,
      'actor_id', case when v_resolved then v_link.enterprise_identity_id::text else null end,
      'attribution_source', v_attribution_source,
      'delegation_id', null,
      'resolved', v_resolved
    ),
    'domain_identity', case when v_active_count = 1 then
      pg_catalog.jsonb_build_object(
        'identity_type', case v_link.enterprise_identity_kind
          when 'SYSTEM_ACTOR' then 'SYSTEM'
          else v_link.enterprise_identity_kind
        end,
        'identity_id', v_link.enterprise_identity_id::text,
        'status', 'ACTIVE',
        'source', 'identity_access.enterprise_identity_links'
      )
      else null
    end,
    'employee', null,
    'issues', case
      when v_issue is null then '[]'::jsonb
      else pg_catalog.jsonb_build_array(v_issue)
    end,
    'application_code', p_application_code,
    'resolved_at', p_resolved_at,
    'source_snapshot', v_source_snapshot,
    'link_candidate_count', v_total_count
  );
end;
$function$;

create or replace function app_private.resolve_access_base_lane(
  p_application_code text,
  p_resolved_at timestamptz,
  p_principal jsonb,
  p_actor jsonb
) returns jsonb
language sql
stable
security invoker
set search_path = pg_catalog, app_private
as $function$
  select pg_catalog.jsonb_build_object(
    'base_role', null,
    'assigned_sites', '[]'::jsonb,
    'assigned_areas', '[]'::jsonb,
    'administrative_coverage', pg_catalog.jsonb_build_object(
      'mode', 'NONE',
      'site_ids', '[]'::jsonb,
      'area_ids', '[]'::jsonb,
      'source', 'AUTH_DB_033_CONTAINED_NO_WORKFORCE_SOURCE',
      'valid', false
    ),
    'lane', case
      when p_application_code = 'pass' then pg_catalog.jsonb_build_object(
        'status', 'NOT_APPLICABLE',
        'reason_codes', pg_catalog.jsonb_build_array('NON_LABOR_ACTOR')
      )
      when p_actor #>> '{actor_effective,actor_type}' = 'EMPLOYEE' then
        pg_catalog.jsonb_build_object(
          'status', 'UNAVAILABLE',
          'reason_codes', pg_catalog.jsonb_build_array('BASE_ROLE_NOT_AVAILABLE')
        )
      else pg_catalog.jsonb_build_object(
        'status', 'UNAVAILABLE',
        'reason_codes', pg_catalog.jsonb_build_array('BASE_ROLE_NOT_AVAILABLE')
      )
    end,
    'application_code', p_application_code,
    'resolved_at', p_resolved_at,
    'principal_status', p_principal #>> '{principal,principal_status}'
  );
$function$;

create or replace function app_private.resolve_access_operational_lane(
  p_application_code text,
  p_resolved_at timestamptz,
  p_actor jsonb,
  p_base_lane jsonb
) returns jsonb
language sql
stable
security invoker
set search_path = pg_catalog, app_private
as $function$
  select pg_catalog.jsonb_build_object(
    'active_shift', null,
    'active_checkin_session', null,
    'operational_role', null,
    'operational_site', null,
    'operational_area', null,
    'lane', case
      when p_application_code = 'pass' then pg_catalog.jsonb_build_object(
        'status', 'NOT_APPLICABLE',
        'reason_codes', pg_catalog.jsonb_build_array('NON_LABOR_ACTOR')
      )
      when p_actor #>> '{actor_effective,actor_type}' = 'EMPLOYEE' then
        pg_catalog.jsonb_build_object(
          'status', 'UNAVAILABLE',
          'reason_codes', pg_catalog.jsonb_build_array('NO_ACTIVE_SHIFT')
        )
      else pg_catalog.jsonb_build_object(
        'status', 'UNAVAILABLE',
        'reason_codes', pg_catalog.jsonb_build_array('BASE_ROLE_NOT_AVAILABLE')
      )
    end,
    'application_code', p_application_code,
    'resolved_at', p_resolved_at,
    'base_status', p_base_lane #>> '{lane,status}',
    'actor_type', p_actor #>> '{actor_effective,actor_type}'
  );
$function$;

create or replace function app_private.resolve_access_device(
  p_application_code text,
  p_resolved_at timestamptz,
  p_principal jsonb,
  p_actor jsonb,
  p_operational_lane jsonb
) returns jsonb
language sql
stable
security invoker
set search_path = pg_catalog, app_private
as $function$
  select pg_catalog.jsonb_build_object(
    'device_context', null,
    'issues', case
      when p_principal #>> '{principal,principal_type}' = 'SHARED_DEVICE'
        then pg_catalog.jsonb_build_array(
          app_private.access_context_issue_definition(
            'DEVICE_UNRESOLVED',
            p_principal #>> '{principal,auth_user_id}'
          )
        )
      else '[]'::jsonb
    end,
    'application_code', p_application_code,
    'resolved_at', p_resolved_at,
    'principal_type', p_principal #>> '{principal,principal_type}',
    'actor_type', p_actor #>> '{actor_effective,actor_type}',
    'operational_status', p_operational_lane #>> '{lane,status}'
  );
$function$;

create or replace function app_private.validate_access_context(
  p_context jsonb
) returns jsonb
language plpgsql
immutable
security invoker
set search_path = pg_catalog, app_private
as $function$
declare
  v_issue jsonb;
  v_expected_issue jsonb;
  v_version_keys text[];
  v_fingerprint_keys text[];
begin
  if p_context is null
     or pg_catalog.jsonb_typeof(p_context) <> 'object'
     or not (p_context ?& array[
       'contract_family', 'contract_family_version', 'contract_name',
       'contract_version', 'schema_version', 'context_id', 'resolved_at',
       'principal', 'actor_effective', 'domain_identity', 'employee',
       'base_role', 'assigned_sites', 'assigned_areas',
       'administrative_coverage', 'active_shift',
       'active_checkin_session', 'operational_role', 'operational_site',
       'operational_area', 'device_context', 'lane_readiness',
       'structural_issues', 'resolution_metadata'
     ])
     or (select count(*) from pg_catalog.jsonb_object_keys(p_context)) <> 24
     or p_context ->> 'contract_family' <> 'vento.authorization.response-contracts'
     or p_context ->> 'contract_family_version' <> '1.0.0'
     or p_context ->> 'contract_name' <> 'AccessContext'
     or p_context ->> 'contract_version' <> '1.0.0'
     or p_context ->> 'schema_version' <> '1.0.0'
     or not coalesce((p_context ->> 'context_id') ~
       '^[0-9a-f]{8}-[0-9a-f]{4}-[1-5][0-9a-f]{3}-[89ab][0-9a-f]{3}-[0-9a-f]{12}$', false)
     or not coalesce((p_context ->> 'resolved_at') ~
       '^[0-9]{4}-[0-9]{2}-[0-9]{2}T[0-9]{2}:[0-9]{2}:[0-9]{2}\.[0-9]{6}Z$', false)
     or pg_catalog.jsonb_typeof(p_context -> 'principal') <> 'object'
     or pg_catalog.jsonb_typeof(p_context -> 'actor_effective') <> 'object'
     or pg_catalog.jsonb_typeof(p_context -> 'assigned_sites') <> 'array'
     or pg_catalog.jsonb_typeof(p_context -> 'assigned_areas') <> 'array'
     or pg_catalog.jsonb_typeof(p_context -> 'administrative_coverage') <> 'object'
     or pg_catalog.jsonb_typeof(p_context -> 'lane_readiness') <> 'object'
     or pg_catalog.jsonb_typeof(p_context -> 'structural_issues') <> 'array'
     or pg_catalog.jsonb_typeof(p_context -> 'resolution_metadata') <> 'object'
     or pg_catalog.jsonb_typeof(p_context -> 'domain_identity') not in ('object', 'null')
     or pg_catalog.jsonb_typeof(p_context -> 'employee') not in ('object', 'null')
     or pg_catalog.jsonb_typeof(p_context -> 'base_role') not in ('object', 'null')
     or pg_catalog.jsonb_typeof(p_context -> 'active_shift') not in ('object', 'null')
     or pg_catalog.jsonb_typeof(p_context -> 'active_checkin_session') not in ('object', 'null')
     or pg_catalog.jsonb_typeof(p_context -> 'operational_role') not in ('object', 'null')
     or pg_catalog.jsonb_typeof(p_context -> 'operational_site') not in ('object', 'null')
     or pg_catalog.jsonb_typeof(p_context -> 'operational_area') not in ('object', 'null')
     or pg_catalog.jsonb_typeof(p_context -> 'device_context') not in ('object', 'null') then
    raise exception using
      errcode = '22023',
      message = 'AUTH_DB_033_ACCESS_CONTEXT_INVALID';
  end if;

  if not ((p_context -> 'principal') ?& array[
       'principal_type', 'auth_user_id', 'session_id', 'authenticated',
       'authentication_method', 'authenticated_at', 'session_expires_at',
       'principal_status'
     ])
     or (select count(*) from pg_catalog.jsonb_object_keys(p_context -> 'principal')) <> 8
     or (p_context #>> '{principal,principal_type}') not in (
       'HUMAN_USER', 'SHARED_DEVICE', 'SYSTEM_SERVICE', 'ANONYMOUS'
     )
     or (p_context #>> '{principal,principal_status}') not in (
       'VALID', 'INVALID', 'ANONYMOUS'
     )
     or pg_catalog.jsonb_typeof(p_context #> '{principal,authenticated}') <> 'boolean'
     or not ((p_context -> 'actor_effective') ?& array[
       'actor_type', 'actor_id', 'attribution_source', 'delegation_id', 'resolved'
     ])
     or (select count(*) from pg_catalog.jsonb_object_keys(p_context -> 'actor_effective')) <> 5
     or (p_context #>> '{actor_effective,actor_type}') not in (
       'EMPLOYEE', 'CUSTOMER', 'SYSTEM', 'UNRESOLVED'
     )
     or (p_context #>> '{actor_effective,attribution_source}') not in (
       'PERSONAL_SESSION', 'DEVICE_ACTOR_SESSION', 'SYSTEM_PROCESS',
       'DOMAIN_IDENTITY', 'NONE'
     )
     or pg_catalog.jsonb_typeof(p_context #> '{actor_effective,resolved}') <> 'boolean'
     or not ((p_context -> 'administrative_coverage') ?& array[
       'mode', 'site_ids', 'area_ids', 'source', 'valid'
     ])
     or (select count(*) from pg_catalog.jsonb_object_keys(p_context -> 'administrative_coverage')) <> 5
     or (p_context #>> '{administrative_coverage,mode}') not in (
       'NONE', 'ASSIGNED_SITES', 'SPECIFIC_SITE', 'ASSIGNED_AREAS',
       'SPECIFIC_AREA', 'ORGANIZATION'
     )
     or pg_catalog.jsonb_typeof(p_context #> '{administrative_coverage,site_ids}') <> 'array'
     or pg_catalog.jsonb_typeof(p_context #> '{administrative_coverage,area_ids}') <> 'array'
     or pg_catalog.jsonb_typeof(p_context #> '{administrative_coverage,valid}') <> 'boolean'
     or not ((p_context -> 'lane_readiness') ?& array['base', 'operational'])
     or (select count(*) from pg_catalog.jsonb_object_keys(p_context -> 'lane_readiness')) <> 2
     or not ((p_context #> '{lane_readiness,base}') ?& array['status', 'reason_codes'])
     or not ((p_context #> '{lane_readiness,operational}') ?& array['status', 'reason_codes'])
     or (p_context #>> '{lane_readiness,base,status}') not in (
       'READY', 'UNAVAILABLE', 'INVALID', 'NOT_APPLICABLE'
     )
     or (p_context #>> '{lane_readiness,operational,status}') not in (
       'READY', 'UNAVAILABLE', 'INVALID', 'NOT_APPLICABLE'
     )
     or pg_catalog.jsonb_typeof(p_context #> '{lane_readiness,base,reason_codes}') <> 'array'
     or pg_catalog.jsonb_typeof(p_context #> '{lane_readiness,operational,reason_codes}') <> 'array' then
    raise exception using
      errcode = '22023',
      message = 'AUTH_DB_033_ACCESS_CONTEXT_INVALID';
  end if;

  for v_issue in
    select element
    from pg_catalog.jsonb_array_elements(p_context -> 'structural_issues') e(element)
  loop
    v_expected_issue := app_private.access_context_issue_definition(
      v_issue ->> 'issue_code',
      v_issue ->> 'subject_id'
    );
    if v_expected_issue is null or v_issue <> v_expected_issue then
      raise exception using
        errcode = '22023',
        message = 'AUTH_DB_033_STRUCTURAL_ISSUE_METADATA_INVALID';
    end if;
  end loop;

  if app_private.normalize_access_context_issues(
       p_context -> 'structural_issues'
     ) <> p_context -> 'structural_issues' then
    raise exception using
      errcode = '22023',
      message = 'AUTH_DB_033_STRUCTURAL_ISSUES_NOT_CANONICAL';
  end if;

  if not ((p_context -> 'resolution_metadata') ?& array[
       'resolver', 'resolver_version', 'authorization_contract_version',
       'catalog_version', 'source_versions', 'source_fingerprints',
       'cache_status'
     ])
     or (select count(*) from pg_catalog.jsonb_object_keys(p_context -> 'resolution_metadata')) <> 7
     or p_context #>> '{resolution_metadata,resolver}' <>
       'vento.authorization.get_access_context'
     or p_context #>> '{resolution_metadata,resolver_version}' <> '1.0.0'
     or p_context #>> '{resolution_metadata,authorization_contract_version}' <> '1.0.0'
     or p_context #>> '{resolution_metadata,catalog_version}' <> '1.0.0'
     or p_context #>> '{resolution_metadata,cache_status}' <> 'NOT_IMPLEMENTED'
     or pg_catalog.jsonb_typeof(p_context #> '{resolution_metadata,source_versions}') <> 'object'
     or pg_catalog.jsonb_typeof(p_context #> '{resolution_metadata,source_fingerprints}') <> 'object' then
    raise exception using
      errcode = '22023',
      message = 'AUTH_DB_033_ACCESS_CONTEXT_INVALID';
  end if;

  select pg_catalog.array_agg(key order by key)
  into v_version_keys
  from pg_catalog.jsonb_object_keys(
    p_context #> '{resolution_metadata,source_versions}'
  ) keys(key);
  select pg_catalog.array_agg(key order by key)
  into v_fingerprint_keys
  from pg_catalog.jsonb_object_keys(
    p_context #> '{resolution_metadata,source_fingerprints}'
  ) keys(key);

  if v_version_keys is distinct from v_fingerprint_keys
     or exists (
       select 1
       from pg_catalog.unnest(v_version_keys) key
       where key not in (
         'application_catalog', 'principal_registry',
         'enterprise_identity_links', 'domain_identity_policy',
         'actor_resolution_model', 'employment_model', 'role_catalog',
         'site_catalog', 'area_catalog',
         'administrative_coverage_policy', 'shift_model', 'checkin_model',
         'device_model', 'actor_session_model', 'structural_issue_catalog'
       )
     )
     or exists (
       select 1
       from pg_catalog.jsonb_each_text(
         p_context #> '{resolution_metadata,source_fingerprints}'
       ) fp(key, value)
       where value !~ '^sha256:[0-9a-f]{64}$'
     )
     or exists (
       select 1
       from pg_catalog.jsonb_each_text(
         p_context #> '{resolution_metadata,source_versions}'
       ) version_entry(key, value)
       where value = ''
     ) then
    raise exception using
      errcode = '22023',
      message = 'AUTH_DB_033_SOURCE_METADATA_INVALID';
  end if;

  return p_context;
end;
$function$;

create or replace function app_private.canonicalize_access_context(
  p_context jsonb
) returns text
language sql
immutable
strict
security invoker
set search_path = pg_catalog, app_private
as $function$
  select app_private.canonicalize_json(
    (
      app_private.validate_access_context(p_context)
      - 'context_id'
      - 'resolved_at'
    ) || pg_catalog.jsonb_build_object(
      'resolution_metadata',
      (p_context -> 'resolution_metadata') - 'cache_status'
    )
  );
$function$;

create or replace function app_private.fingerprint_access_context(
  p_context jsonb
) returns text
language sql
immutable
strict
security invoker
set search_path = pg_catalog, app_private
as $function$
  select 'sha256:' || pg_catalog.encode(
    extensions.digest(
      app_private.canonicalize_access_context(p_context),
      'sha256'
    ),
    'hex'
  );
$function$;

create or replace function app_private.project_safe_access_context(
  p_application_code text,
  p_context jsonb
) returns jsonb
language plpgsql
stable
security invoker
set search_path = pg_catalog, app_private
as $function$
declare
  v_validated jsonb := app_private.validate_access_context(p_context);
  v_resolved_at timestamptz := (v_validated ->> 'resolved_at')::timestamptz;
  v_expires_at timestamptz;
  v_boundary timestamptz;
  v_ttl interval;
  v_base_reasons jsonb;
  v_operational_reasons jsonb;
  v_safe_issue_codes jsonb;
begin
  v_ttl := case
    when not coalesce((v_validated #>> '{actor_effective,resolved}')::boolean, false)
      then interval '5 seconds'
    when v_validated #>> '{principal,principal_type}' = 'SHARED_DEVICE'
      then interval '10 seconds'
    when v_validated #>> '{principal,principal_type}' = 'HUMAN_USER'
      then interval '30 seconds'
    else interval '5 seconds'
  end;
  v_expires_at := v_resolved_at + v_ttl;

  foreach v_boundary in array array[
    nullif(v_validated #>> '{principal,session_expires_at}', '')::timestamptz,
    nullif(v_validated #>> '{active_shift,ends_at}', '')::timestamptz,
    nullif(v_validated #>> '{active_checkin_session,expires_at}', '')::timestamptz,
    nullif(v_validated #>> '{device_context,actor_session_expires_at}', '')::timestamptz
  ]
  loop
    if v_boundary is not null then
      v_expires_at := least(
        v_expires_at,
        v_boundary - interval '1 second'
      );
    end if;
  end loop;
  v_expires_at := greatest(v_expires_at, v_resolved_at);

  select coalesce(
    pg_catalog.jsonb_agg(pg_catalog.to_jsonb(code) order by code),
    '[]'::jsonb
  )
  into v_base_reasons
  from (
    select distinct element #>> '{}' as code
    from pg_catalog.jsonb_array_elements(
      v_validated #> '{lane_readiness,base,reason_codes}'
    ) reason(element)
    where element #>> '{}' in (
      'NON_LABOR_ACTOR', 'EMPLOYEE_INACTIVE', 'BASE_ROLE_NOT_AVAILABLE',
      'ADMINISTRATIVE_COVERAGE_NOT_AVAILABLE', 'AUTH_UNAUTHENTICATED',
      'PRINCIPAL_NOT_LINKED', 'DOMAIN_IDENTITY_INACTIVE',
      'EMPLOYEE_MISSING', 'RESOLVER_CONFIGURATION_MISSING'
    )
  ) safe_base;

  select coalesce(
    pg_catalog.jsonb_agg(pg_catalog.to_jsonb(code) order by code),
    '[]'::jsonb
  )
  into v_operational_reasons
  from (
    select distinct element #>> '{}' as code
    from pg_catalog.jsonb_array_elements(
      v_validated #> '{lane_readiness,operational,reason_codes}'
    ) reason(element)
    where element #>> '{}' in (
      'NON_LABOR_ACTOR', 'EMPLOYEE_INACTIVE', 'NO_ACTIVE_SHIFT',
      'NO_ACTIVE_CHECKIN', 'NO_OPERATIONAL_AREA',
      'OPERATIONAL_ROLE_NOT_AVAILABLE', 'OPERATIONAL_SITE_NOT_AVAILABLE',
      'AUTH_UNAUTHENTICATED', 'PRINCIPAL_NOT_LINKED',
      'DOMAIN_IDENTITY_INACTIVE', 'EMPLOYEE_MISSING',
      'RESOLVER_CONFIGURATION_MISSING'
    )
  ) safe_operational;

  select coalesce(
    pg_catalog.jsonb_agg(
      pg_catalog.to_jsonb(issue ->> 'issue_code')
      order by issue ->> 'issue_code'
    ),
    '[]'::jsonb
  )
  into v_safe_issue_codes
  from pg_catalog.jsonb_array_elements(
    v_validated -> 'structural_issues'
  ) issues(issue)
  where issue ->> 'issue_code' in (
    'AUTH_UNAUTHENTICATED', 'PRINCIPAL_NOT_LINKED',
    'DOMAIN_IDENTITY_INACTIVE', 'EMPLOYEE_MISSING',
    'RESOLVER_CONFIGURATION_MISSING'
  );

  return pg_catalog.jsonb_build_object(
    'context_id', v_validated ->> 'context_id',
    'resolved_at', v_validated ->> 'resolved_at',
    'context_fingerprint', app_private.fingerprint_access_context(v_validated),
    'expires_at', pg_catalog.to_char(
      v_expires_at at time zone 'UTC',
      'YYYY-MM-DD"T"HH24:MI:SS.US"Z"'
    ),
    'safe_fields', pg_catalog.jsonb_build_object(
      'principal_type', v_validated #>> '{principal,principal_type}',
      'actor_type', v_validated #>> '{actor_effective,actor_type}',
      'employee_active', v_validated #> '{employee,is_active}',
      'base_role_code', v_validated #>> '{base_role,role_code}',
      'operational_role_code', v_validated #>> '{operational_role,role_code}',
      'operational_site_code', null,
      'operational_area_kind', v_validated #>> '{operational_area,area_kind}',
      'operational_area_code', null,
      'device_mode', v_validated #>> '{device_context,device_type}',
      'lane_readiness', pg_catalog.jsonb_build_object(
        'base', pg_catalog.jsonb_build_object(
          'state', v_validated #>> '{lane_readiness,base,status}',
          'reason_codes', v_base_reasons
        ),
        'operational', pg_catalog.jsonb_build_object(
          'state', v_validated #>> '{lane_readiness,operational,status}',
          'reason_codes', v_operational_reasons
        )
      ),
      'safe_structural_issue_codes', v_safe_issue_codes
    )
  );
end;
$function$;

create or replace function app_private.get_access_context(
  p_application_code text
) returns jsonb
language plpgsql
stable
security definer
set search_path = pg_catalog, app_private
as $function$
declare
  v_resolved_at timestamptz := pg_catalog.statement_timestamp();
  v_resolved_at_text text;
  v_application jsonb;
  v_principal jsonb;
  v_actor jsonb;
  v_base jsonb;
  v_operational jsonb;
  v_device jsonb;
  v_issues jsonb;
  v_context jsonb;
  v_source_versions jsonb;
  v_source_fingerprints jsonb;
  v_issue_catalog_snapshot jsonb;
  v_base_status text;
  v_operational_status text;
  v_base_reasons jsonb;
  v_operational_reasons jsonb;
begin
  if p_application_code is null
     or p_application_code = ''
     or p_application_code <> pg_catalog.btrim(p_application_code) then
    raise exception using
      errcode = '22023',
      message = 'AUTH_DB_033_APPLICATION_CODE_INVALID';
  end if;

  v_resolved_at_text := pg_catalog.to_char(
    v_resolved_at at time zone 'UTC',
    'YYYY-MM-DD"T"HH24:MI:SS.US"Z"'
  );
  v_application := app_private.resolve_access_application(
    p_application_code,
    v_resolved_at
  );
  v_principal := app_private.resolve_access_principal(
    p_application_code,
    v_resolved_at,
    v_application
  );
  v_actor := app_private.resolve_access_actor(
    p_application_code,
    v_resolved_at,
    v_application,
    v_principal
  );
  v_base := app_private.resolve_access_base_lane(
    p_application_code,
    v_resolved_at,
    v_principal,
    v_actor
  );
  v_operational := app_private.resolve_access_operational_lane(
    p_application_code,
    v_resolved_at,
    v_actor,
    v_base
  );
  v_device := app_private.resolve_access_device(
    p_application_code,
    v_resolved_at,
    v_principal,
    v_actor,
    v_operational
  );

  v_issues := coalesce(v_principal -> 'issues', '[]'::jsonb)
    || coalesce(v_actor -> 'issues', '[]'::jsonb)
    || coalesce(v_device -> 'issues', '[]'::jsonb);
  if not coalesce((v_application ->> 'valid')::boolean, false) then
    v_issues := v_issues || pg_catalog.jsonb_build_array(
      app_private.access_context_issue_definition(
        'RESOLVER_CONFIGURATION_MISSING',
        p_application_code
      )
    );
  end if;
  v_issues := app_private.normalize_access_context_issues(v_issues);

  v_base_status := v_base #>> '{lane,status}';
  v_operational_status := v_operational #>> '{lane,status}';
  if exists (
    select 1
    from pg_catalog.jsonb_array_elements(v_issues) issue
    where issue ->> 'severity' = 'BLOCKING_ALL'
  ) then
    v_base_status := 'INVALID';
    v_operational_status := 'INVALID';
  elsif exists (
    select 1
    from pg_catalog.jsonb_array_elements(v_issues) issue
    where issue ->> 'severity' = 'BLOCKING_BASE'
  ) then
    v_base_status := 'INVALID';
    v_operational_status := 'INVALID';
  elsif exists (
    select 1
    from pg_catalog.jsonb_array_elements(v_issues) issue
    where issue ->> 'severity' = 'BLOCKING_OPERATIONAL'
  ) then
    v_operational_status := 'INVALID';
  end if;

  select coalesce(
    pg_catalog.jsonb_agg(pg_catalog.to_jsonb(code) order by code),
    '[]'::jsonb
  )
  into v_base_reasons
  from (
    select distinct element #>> '{}' as code
    from pg_catalog.jsonb_array_elements(
      coalesce(v_base #> '{lane,reason_codes}', '[]'::jsonb)
      || coalesce((
        select pg_catalog.jsonb_agg(pg_catalog.to_jsonb(issue ->> 'issue_code'))
        from pg_catalog.jsonb_array_elements(v_issues) issue
        where issue ->> 'severity' in ('BLOCKING_ALL', 'BLOCKING_BASE')
      ), '[]'::jsonb)
    ) reason(element)
  ) codes;

  select coalesce(
    pg_catalog.jsonb_agg(pg_catalog.to_jsonb(code) order by code),
    '[]'::jsonb
  )
  into v_operational_reasons
  from (
    select distinct element #>> '{}' as code
    from pg_catalog.jsonb_array_elements(
      coalesce(v_operational #> '{lane,reason_codes}', '[]'::jsonb)
      || coalesce((
        select pg_catalog.jsonb_agg(pg_catalog.to_jsonb(issue ->> 'issue_code'))
        from pg_catalog.jsonb_array_elements(v_issues) issue
        where issue ->> 'severity' in (
          'BLOCKING_ALL', 'BLOCKING_BASE', 'BLOCKING_OPERATIONAL'
        )
      ), '[]'::jsonb)
    ) reason(element)
  ) codes;

  v_issue_catalog_snapshot := pg_catalog.jsonb_build_array(
    app_private.access_context_issue_definition('AUTH_UNAUTHENTICATED', null) - 'subject_id',
    app_private.access_context_issue_definition('PRINCIPAL_NOT_LINKED', null) - 'subject_id',
    app_private.access_context_issue_definition('PRINCIPAL_AMBIGUOUS', null) - 'subject_id',
    app_private.access_context_issue_definition('DOMAIN_IDENTITY_AMBIGUOUS', null) - 'subject_id',
    app_private.access_context_issue_definition('DOMAIN_IDENTITY_INACTIVE', null) - 'subject_id',
    app_private.access_context_issue_definition('EMPLOYEE_MISSING', null) - 'subject_id',
    app_private.access_context_issue_definition('DEVICE_UNRESOLVED', null) - 'subject_id',
    app_private.access_context_issue_definition('RESOLVER_CONFIGURATION_MISSING', null) - 'subject_id'
  );

  v_source_versions := pg_catalog.jsonb_build_object(
    'application_catalog', '1.0.0',
    'principal_registry', 'AUTH-DB-019',
    'enterprise_identity_links', 'AUTH-DB-019',
    'domain_identity_policy', '1.0.0',
    'actor_resolution_model', '1.0.0',
    'structural_issue_catalog', '1.0.0'
  );
  v_source_fingerprints := pg_catalog.jsonb_build_object(
    'application_catalog', app_private.fingerprint_access_source(
      v_application -> 'source_snapshot'
    ),
    'principal_registry', app_private.fingerprint_access_source(
      v_principal -> 'source_snapshot'
    ),
    'enterprise_identity_links', app_private.fingerprint_access_source(
      v_actor -> 'source_snapshot'
    ),
    'domain_identity_policy', app_private.fingerprint_access_source(
      pg_catalog.jsonb_build_object(
        'app_code', p_application_code,
        'domain', v_application ->> 'domain',
        'expected_identity_kind', v_actor -> 'source_snapshot' ->> 'expected_identity_kind'
      )
    ),
    'actor_resolution_model', app_private.fingerprint_access_source(
      pg_catalog.jsonb_build_object(
        'model', 'vento.authorization.actor-resolution',
        'version', '1.0.0',
        'principal_type', v_principal #>> '{principal,principal_type}',
        'actor_type', v_actor #>> '{actor_effective,actor_type}',
        'attribution_source', v_actor #>> '{actor_effective,attribution_source}'
      )
    ),
    'structural_issue_catalog', app_private.fingerprint_access_source(
      v_issue_catalog_snapshot
    )
  );

  v_context := pg_catalog.jsonb_build_object(
    'contract_family', 'vento.authorization.response-contracts',
    'contract_family_version', '1.0.0',
    'contract_name', 'AccessContext',
    'contract_version', '1.0.0',
    'schema_version', '1.0.0',
    'context_id', extensions.gen_random_uuid()::text,
    'resolved_at', v_resolved_at_text,
    'principal', v_principal -> 'principal',
    'actor_effective', v_actor -> 'actor_effective',
    'domain_identity', v_actor -> 'domain_identity',
    'employee', v_actor -> 'employee',
    'base_role', v_base -> 'base_role',
    'assigned_sites', v_base -> 'assigned_sites',
    'assigned_areas', v_base -> 'assigned_areas',
    'administrative_coverage', v_base -> 'administrative_coverage',
    'active_shift', v_operational -> 'active_shift',
    'active_checkin_session', v_operational -> 'active_checkin_session',
    'operational_role', v_operational -> 'operational_role',
    'operational_site', v_operational -> 'operational_site',
    'operational_area', v_operational -> 'operational_area',
    'device_context', v_device -> 'device_context',
    'lane_readiness', pg_catalog.jsonb_build_object(
      'base', pg_catalog.jsonb_build_object(
        'status', v_base_status,
        'reason_codes', v_base_reasons
      ),
      'operational', pg_catalog.jsonb_build_object(
        'status', v_operational_status,
        'reason_codes', v_operational_reasons
      )
    ),
    'structural_issues', v_issues,
    'resolution_metadata', pg_catalog.jsonb_build_object(
      'resolver', 'vento.authorization.get_access_context',
      'resolver_version', '1.0.0',
      'authorization_contract_version', '1.0.0',
      'catalog_version', '1.0.0',
      'source_versions', v_source_versions,
      'source_fingerprints', v_source_fingerprints,
      'cache_status', 'NOT_IMPLEMENTED'
    )
  );

  return app_private.validate_access_context(v_context);
end;
$function$;

create or replace function api.get_safe_access_context(
  p_application_code text
) returns jsonb
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

comment on function app_private.canonicalize_json(jsonb) is
  'AUTH-DB-033::CORR-001 recursive vento.canonical-json@1.0.0 implementation: NFC strings, canonical numbers, sorted object keys and preserved array order.';
comment on function app_private.get_access_context(text) is
  'AUTH-DB-033::CORR-001 corrected full resolver. One privileged border, exact app input, dynamic source fingerprints, canonical issues and fail-closed unavailable owner sources.';
comment on function api.get_safe_access_context(text) is
  'AUTH-DB-033::CORR-001 corrected safe projection. EXECUTE is intentionally withheld until all AUTH-DB-033 owner sources and publication tests are available.';

revoke all on function
  app_private.access_context_issue_definition(text, text),
  app_private.normalize_access_context_issues(jsonb),
  app_private.canonicalize_json(jsonb),
  app_private.fingerprint_access_source(jsonb),
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

grant execute on function
  app_private.get_access_context(text),
  app_private.access_context_issue_definition(text, text),
  app_private.normalize_access_context_issues(jsonb),
  app_private.validate_access_context(jsonb),
  app_private.canonicalize_access_context(jsonb),
  app_private.fingerprint_access_context(jsonb),
  app_private.canonicalize_json(jsonb)
to postgres;

revoke all on function api.get_safe_access_context(text)
from public, anon, authenticated, service_role;

grant execute on function api.get_safe_access_context(text) to postgres;

reset role;

revoke create on schema app_private, api from vento_access_context_owner;

do $auth_db_033_corr_001_postconditions$
declare
  v_private_definers bigint;
begin
  if pg_catalog.pg_get_userbyid(
      (
        select p.proowner
        from pg_catalog.pg_proc p
        where p.oid = 'app_private.get_access_context(text)'::regprocedure
      )
    ) <> 'vento_access_context_owner'
     or pg_catalog.pg_get_userbyid(
      (
        select p.proowner
        from pg_catalog.pg_proc p
        where p.oid = 'api.get_safe_access_context(text)'::regprocedure
      )
    ) <> 'vento_access_context_owner' then
    raise exception 'AUTH_DB_033_CORR_001_OWNER_DRIFT';
  end if;

  select count(*)
  into v_private_definers
  from pg_catalog.pg_proc p
  join pg_catalog.pg_namespace n on n.oid = p.pronamespace
  where n.nspname = 'app_private'
    and p.proname in (
      'access_context_issue_definition',
      'normalize_access_context_issues',
      'canonicalize_json',
      'fingerprint_access_source',
      'resolve_access_application',
      'resolve_access_principal',
      'resolve_access_actor',
      'resolve_access_base_lane',
      'resolve_access_operational_lane',
      'resolve_access_device',
      'validate_access_context',
      'canonicalize_access_context',
      'fingerprint_access_context',
      'project_safe_access_context',
      'get_access_context'
    )
    and p.prosecdef;

  if v_private_definers <> 1 then
    raise exception 'AUTH_DB_033_CORR_001_PRIVILEGED_BORDER_DRIFT';
  end if;

  if pg_catalog.has_function_privilege(
       'public', 'api.get_safe_access_context(text)', 'EXECUTE'
     )
     or pg_catalog.has_function_privilege(
       'anon', 'api.get_safe_access_context(text)', 'EXECUTE'
     )
     or pg_catalog.has_function_privilege(
       'authenticated', 'api.get_safe_access_context(text)', 'EXECUTE'
     )
     or pg_catalog.has_function_privilege(
       'service_role', 'api.get_safe_access_context(text)', 'EXECUTE'
     ) then
    raise exception 'AUTH_DB_033_CORR_001_WITHHELD_RPC_ACL_DRIFT';
  end if;
end
$auth_db_033_corr_001_postconditions$;

commit;
