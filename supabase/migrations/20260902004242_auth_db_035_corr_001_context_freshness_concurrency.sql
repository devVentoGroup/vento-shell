-- AUTH-DB-035::CORR-001
-- Forward-only physical correction for context freshness concurrency.
-- Preserves ContextFreshnessToken@1.0.0 semantics.
-- Historical migration 20260831233918 remains immutable.

begin;

grant create on schema app_private to vento_context_freshness_owner;

set local role vento_context_freshness_owner;

create or replace function
  app_private.bump_context_freshness(
    p_envelope jsonb
  )
returns jsonb
language plpgsql
volatile
security definer
set search_path = pg_catalog, app_private
as $function$
declare
  v_organization_id uuid;
  v_authoritative_organization_id uuid;
  v_event_id uuid :=
    extensions.gen_random_uuid();
  v_event_scope text;
  v_before jsonb := '{}'::jsonb;
  v_after jsonb := '{}'::jsonb;
  v_normalized_scope_ids jsonb;
  v_normalized_generation_scopes jsonb;
  v_after_generation bigint;
  v_scope record;
  v_changed bigint := 0;
begin
  if p_envelope is null
     or pg_catalog.jsonb_typeof(
       p_envelope
     ) <> 'object' then
    raise exception using
      errcode = '22023',
      message =
        'AUTH_DB_035_BUMP_ENVELOPE_INVALID';
  end if;

  begin
    v_organization_id :=
      (p_envelope ->> 'organization_id')::uuid;
  exception
    when invalid_text_representation then
      raise exception using
        errcode = '22023',
        message =
          'AUTH_DB_035_BUMP_ORGANIZATION_INVALID';
  end;

  v_authoritative_organization_id :=
    app_private.resolve_organization_id();

  if v_organization_id is null
     or v_organization_id <>
       v_authoritative_organization_id then
    raise exception using
      errcode = '22023',
      message =
        'AUTH_DB_035_BUMP_ORGANIZATION_MISMATCH';
  end if;

  if coalesce(
       p_envelope ->> 'event_type',
       ''
     ) not in (
       'AUTH_SESSION_CHANGED',
       'DOMAIN_IDENTITY_CHANGED',
       'ACTOR_ASSIGNMENT_CHANGED',
       'EMPLOYEE_STATUS_CHANGED',
       'BASE_ROLE_CHANGED',
       'ASSIGNED_SITE_CHANGED',
       'ASSIGNED_AREA_CHANGED',
       'ADMINISTRATIVE_COVERAGE_CHANGED',
       'SHIFT_CHANGED',
       'CHECKIN_SESSION_CHANGED',
       'OPERATIONAL_ROLE_MAPPING_CHANGED',
       'DEVICE_CHANGED',
       'DEVICE_ACTOR_SESSION_CHANGED',
       'SYSTEM_DELEGATION_CHANGED',
       'APP_AUTHORIZATION_CHANGED',
       'PERMISSION_CATALOG_CHANGED',
       'BASE_GRANTS_CHANGED',
       'OPERATIONAL_GRANTS_CHANGED',
       'INDIVIDUAL_OVERRIDE_CHANGED',
       'DENY_CHANGED',
       'CONTRACT_VERSION_CHANGED'
     ) then
    raise exception using
      errcode = '22023',
      message =
        'AUTH_DB_035_BUMP_EVENT_TYPE_INVALID';
  end if;

  if pg_catalog.jsonb_typeof(
       p_envelope -> 'generation_scopes'
     ) <> 'array'
     or pg_catalog.jsonb_array_length(
       p_envelope -> 'generation_scopes'
     ) = 0
     or pg_catalog.jsonb_typeof(
       p_envelope -> 'scope_ids'
     ) <> 'object' then
    raise exception using
      errcode = '22023',
      message =
        'AUTH_DB_035_BUMP_SCOPES_INVALID';
  end if;

  if exists (
    select 1
    from pg_catalog.jsonb_array_elements_text(
      p_envelope -> 'generation_scopes'
    ) s(scope_type)
    where s.scope_type not in (
      'ACTOR',
      'EMPLOYEE',
      'BASE_LANE',
      'OPERATIONAL_LANE',
      'DEVICE',
      'APP_AUTHORIZATION',
      'GLOBAL_AUTHORIZATION',
      'SYSTEM_DELEGATION'
    )
  ) then
    raise exception using
      errcode = '22023',
      message =
        'AUTH_DB_035_BUMP_SCOPE_TYPE_INVALID';
  end if;

  if exists (
    select 1
    from pg_catalog.jsonb_array_elements_text(
      p_envelope -> 'generation_scopes'
    ) s(scope_type)
    where
      pg_catalog.jsonb_typeof(
        p_envelope -> 'scope_ids' ->
          s.scope_type
      ) <> 'array'
      or pg_catalog.jsonb_array_length(
        p_envelope -> 'scope_ids' ->
          s.scope_type
      ) = 0
  ) then
    raise exception using
      errcode = '22023',
      message =
        'AUTH_DB_035_BUMP_SCOPE_KEYS_INVALID';
  end if;

  if exists (
    select 1
    from pg_catalog.jsonb_array_elements_text(
      p_envelope -> 'generation_scopes'
    ) s(scope_type)
    cross join lateral
      pg_catalog.jsonb_array_elements_text(
        p_envelope -> 'scope_ids' ->
          s.scope_type
      ) k(scope_key)
    where pg_catalog.btrim(
      k.scope_key
    ) = ''
  ) then
    raise exception using
      errcode = '22023',
      message =
        'AUTH_DB_035_BUMP_SCOPE_KEY_BLANK';
  end if;

  if exists (
    select 1
    from pg_catalog.jsonb_object_keys(
      p_envelope -> 'scope_ids'
    ) k(scope_type)
    where not (
      p_envelope -> 'generation_scopes'
    ) ? k.scope_type
  ) then
    raise exception using
      errcode = '22023',
      message =
        'AUTH_DB_035_BUMP_SCOPE_KEYS_EXTRA';
  end if;

  if (
       p_envelope -> 'generation_scopes'
     ) ? 'APP_AUTHORIZATION'
     and (
       nullif(
         p_envelope ->> 'app_code',
         ''
       ) is null
       or not (
         p_envelope -> 'scope_ids' ->
           'APP_AUTHORIZATION'
       ) ? (
         p_envelope ->> 'app_code'
       )
     ) then
    raise exception using
      errcode = '22023',
      message =
        'AUTH_DB_035_BUMP_APP_SCOPE_INVALID';
  end if;

  if coalesce(
       p_envelope ->> 'producer',
       ''
     ) = ''
     or p_envelope ->> 'schema_version'
       <> '1.0.0' then
    raise exception using
      errcode = '22023',
      message =
        'AUTH_DB_035_BUMP_METADATA_INVALID';
  end if;

  if p_envelope ->> 'subject_key_hash'
       is not null
     and p_envelope ->> 'subject_key_hash'
       !~ '^sha256:[0-9a-f]{64}$' then
    raise exception using
      errcode = '22023',
      message =
        'AUTH_DB_035_BUMP_SUBJECT_HASH_INVALID';
  end if;

  select pg_catalog.jsonb_agg(
    scope_type
    order by scope_type
  )
  into v_normalized_generation_scopes
  from (
    select distinct s.scope_type
    from pg_catalog.jsonb_array_elements_text(
      p_envelope -> 'generation_scopes'
    ) s(scope_type)
  ) normalized_scopes;

  select pg_catalog.jsonb_object_agg(
    scope_type,
    scope_keys
    order by scope_type
  )
  into v_normalized_scope_ids
  from (
    select
      scope_type,
      pg_catalog.jsonb_agg(
        scope_key
        order by scope_key
      ) as scope_keys
    from (
      select distinct
        s.scope_type,
        k.scope_key
      from pg_catalog.jsonb_array_elements_text(
        p_envelope -> 'generation_scopes'
      ) s(scope_type)
      cross join lateral
        pg_catalog.jsonb_array_elements_text(
          p_envelope -> 'scope_ids' ->
            s.scope_type
        ) k(scope_key)
    ) normalized_pairs
    group by scope_type
  ) grouped_pairs;

  for v_scope in
    select distinct
      s.scope_type,
      k.scope_key
    from pg_catalog.jsonb_array_elements_text(
      v_normalized_generation_scopes
    ) s(scope_type)
    cross join lateral
      pg_catalog.jsonb_array_elements_text(
        v_normalized_scope_ids ->
          s.scope_type
      ) k(scope_key)
    order by
      s.scope_type,
      k.scope_key
  loop
    insert into
      app_private.context_freshness_generations
      as target (
        organization_id,
        scope_type,
        scope_key,
        generation,
        last_event_id,
        schema_version
      )
    values (
      v_organization_id,
      v_scope.scope_type,
      v_scope.scope_key,
      1,
      v_event_id,
      '1.0.0'
    )
    on conflict (
      organization_id,
      scope_type,
      scope_key
    )
    do update
    set
      generation =
        target.generation + 1,
      last_event_id =
        excluded.last_event_id,
      updated_at =
        greatest(
          target.updated_at,
          pg_catalog.statement_timestamp()
        ),
      schema_version =
        excluded.schema_version
    returning generation
    into v_after_generation;

    v_before :=
      v_before ||
      pg_catalog.jsonb_build_object(
        v_scope.scope_type ||
          ':' ||
          v_scope.scope_key,
        v_after_generation - 1
      );

    v_after :=
      v_after ||
      pg_catalog.jsonb_build_object(
        v_scope.scope_type ||
          ':' ||
          v_scope.scope_key,
        v_after_generation
      );

    v_changed := v_changed + 1;
  end loop;

  if v_changed = 0 then
    raise exception using
      errcode = '22023',
      message =
        'AUTH_DB_035_BUMP_ZERO_SCOPES';
  end if;

  if p_envelope ->> 'event_type' =
       'AUTH_SESSION_CHANGED' then
    v_event_scope := 'SESSION';

  elsif v_normalized_generation_scopes
        ? 'GLOBAL_AUTHORIZATION' then
    v_event_scope := 'GLOBAL';

  elsif v_normalized_generation_scopes
        ? 'APP_AUTHORIZATION' then
    v_event_scope := 'APP';

  elsif v_normalized_generation_scopes
        ? 'DEVICE' then
    v_event_scope := 'DEVICE';

  else
    v_event_scope := 'SUBJECT';
  end if;

  insert into audit.context_invalidation_outbox (
    event_id,
    event_type,
    scope_type,
    scope_ids,
    app_code,
    organization_id,
    subject_key_hash,
    generation_before,
    generation_after,
    occurred_at,
    committed_at,
    source_transaction_id,
    producer,
    schema_version,
    delivery_status,
    attempt_count
  )
  values (
    v_event_id,
    p_envelope ->> 'event_type',
    v_event_scope,
    v_normalized_scope_ids,
    nullif(
      p_envelope ->> 'app_code',
      ''
    ),
    v_organization_id,
    nullif(
      p_envelope ->> 'subject_key_hash',
      ''
    ),
    v_before,
    v_after,
    pg_catalog.statement_timestamp(),
    null,
    pg_catalog.pg_current_xact_id()::text,
    p_envelope ->> 'producer',
    '1.0.0',
    'PENDING',
    0
  );

  return pg_catalog.jsonb_build_object(
    'event_id',
    v_event_id,
    'event_scope',
    v_event_scope,
    'generation_scopes',
    v_normalized_generation_scopes,
    'scope_ids',
    v_normalized_scope_ids,
    'generation_before',
    v_before,
    'generation_after',
    v_after,
    'source_transaction_id',
    pg_catalog.pg_current_xact_id()::text,
    'schema_version',
    '1.0.0'
  );
end;
$function$;

reset role;

revoke create on schema app_private from vento_context_freshness_owner;

commit;
