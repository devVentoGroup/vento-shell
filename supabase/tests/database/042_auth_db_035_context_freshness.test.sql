-- VENTO_DB_TEST_CATEGORY: SCHEMA

do $auth_db_035_local_runtime_bootstrap$
begin
  perform
    app_private.bootstrap_context_freshness_runtime(
      'LOCAL'
    );
end
$auth_db_035_local_runtime_bootstrap$;

begin;

create extension
if not exists pgtap
with schema extensions;

create extension
if not exists dblink
with schema extensions;

select no_plan();

select ok(
  exists (
    select 1
    from pg_catalog.pg_roles r
    where r.rolname =
      'vento_context_freshness_owner'
      and not r.rolcanlogin
      and not r.rolinherit
      and not r.rolsuper
      and not r.rolcreatedb
      and not r.rolcreaterole
      and not r.rolreplication
      and not r.rolbypassrls
  ),
  'freshness owner exists with fail-closed posture'
);

select ok(
  pg_catalog.pg_has_role(
    'postgres',
    'vento_context_freshness_owner',
    'SET'
  ),
  'postgres may SET freshness owner'
);

select is(
  (
    select count(*)
    from pg_catalog.pg_auth_members m
    join pg_catalog.pg_roles member_role
      on member_role.oid = m.member
    join pg_catalog.pg_roles target_role
      on target_role.oid = m.roleid
    where target_role.rolname =
      'vento_context_freshness_owner'
      and member_role.rolname in (
        'anon',
        'authenticated',
        'service_role'
      )
  ),
  0::bigint,
  'runtime roles are not freshness-owner members'
);

select ok(
  pg_catalog.to_regclass(
    'app_private.context_freshness_generations'
  ) is not null,
  'generation table exists'
);

select ok(
  pg_catalog.to_regclass(
    'app_private.context_freshness_bindings'
  ) is not null,
  'binding registry exists'
);

select ok(
  pg_catalog.to_regclass(
    'app_private.context_freshness_runtime'
  ) is not null,
  'runtime identity table exists'
);

select ok(
  pg_catalog.to_regclass(
    'audit.context_invalidation_outbox'
  ) is not null,
  'invalidation outbox exists'
);

select ok(
  pg_catalog.to_regclass(
    'app_private.context_freshness_auth_sessions'
  ) is not null,
  'managed Auth freshness bridge exists'
);

select is(
  (
    select pg_catalog.array_agg(
      a.attname::text
      order by a.attnum
    )
    from pg_catalog.pg_attribute a
    where a.attrelid =
      'app_private.context_freshness_generations'
        ::regclass
      and a.attnum > 0
      and not a.attisdropped
  ),
  array[
    'organization_id',
    'scope_type',
    'scope_key',
    'generation',
    'last_event_id',
    'created_at',
    'updated_at',
    'schema_version'
  ]::text[],
  'generation table has exact minimum shape'
);

select is(
  (
    select pg_catalog.pg_get_constraintdef(
      c.oid
    )
    from pg_catalog.pg_constraint c
    where c.conrelid =
      'app_private.context_freshness_generations'
        ::regclass
      and c.contype = 'p'
  ),
  'PRIMARY KEY (organization_id, scope_type, scope_key)',
  'generation primary key is exact'
);

select is(
  (
    select count(*)
    from pg_catalog.pg_class c
    where c.oid in (
      'app_private.context_freshness_generations'
        ::regclass,
      'app_private.context_freshness_bindings'
        ::regclass,
      'app_private.context_freshness_runtime'
        ::regclass,
      'audit.context_invalidation_outbox'
        ::regclass
    )
      and c.relrowsecurity
  ),
  4::bigint,
  'all four private state tables have RLS'
);

select is(
  (
    select count(*)
    from pg_catalog.pg_policy p
    where p.polrelid in (
      'app_private.context_freshness_generations'
        ::regclass,
      'app_private.context_freshness_bindings'
        ::regclass,
      'app_private.context_freshness_runtime'
        ::regclass,
      'audit.context_invalidation_outbox'
        ::regclass
    )
  ),
  0::bigint,
  'freshness tables publish zero client policies'
);

select is(
  (
    select count(*)
    from (
      values
        ('anon'),
        ('authenticated'),
        ('service_role')
    ) r(role_name)
    cross join (
      values
        ('app_private.context_freshness_generations'),
        ('app_private.context_freshness_bindings'),
        ('app_private.context_freshness_runtime'),
        ('audit.context_invalidation_outbox'),
        ('app_private.context_freshness_auth_sessions')
    ) o(object_name)
    where
      pg_catalog.has_table_privilege(
        r.role_name,
        o.object_name,
        'SELECT'
      )
      or pg_catalog.has_table_privilege(
        r.role_name,
        o.object_name,
        'INSERT'
      )
      or pg_catalog.has_table_privilege(
        r.role_name,
        o.object_name,
        'UPDATE'
      )
      or pg_catalog.has_table_privilege(
        r.role_name,
        o.object_name,
        'DELETE'
      )
  ),
  0::bigint,
  'runtime roles have zero direct freshness data privileges'
);

select ok(
  not pg_catalog.has_schema_privilege(
    'vento_context_freshness_owner',
    'auth',
    'USAGE'
  ),
  'freshness owner has no managed Auth schema access'
);

select ok(
  not pg_catalog.has_table_privilege(
    'vento_context_freshness_owner',
    'auth.sessions',
    'SELECT'
  ),
  'freshness owner cannot read auth.sessions directly'
);

select ok(
  pg_catalog.has_table_privilege(
    'vento_context_freshness_owner',
    'app_private.context_freshness_auth_sessions',
    'SELECT'
  ),
  'freshness owner reads the private session bridge'
);

select ok(
  exists (
    select 1
    from pg_catalog.pg_policy p
    join pg_catalog.pg_roles r
      on r.oid = any(p.polroles)
    where p.polrelid =
        'org_governance.organization_scopes'::regclass
      and p.polname =
        'auth_db_035_freshness_owner_read_organization_scope'
      and p.polcmd = 'r'
      and r.rolname =
        'vento_context_freshness_owner'
  ),
  'freshness owner has explicit SELECT RLS policy for canonical organization scope'
);
select ok(
  pg_catalog.has_function_privilege(
    'vento_context_freshness_owner',
    'app_private.get_access_context(text)',
    'EXECUTE'
  )
  and pg_catalog.has_function_privilege(
    'vento_context_freshness_owner',
    'app_private.resolve_access_application(text,timestamp with time zone)',
    'EXECUTE'
  )
  and pg_catalog.has_function_privilege(
    'vento_context_freshness_owner',
    'app_private.canonicalize_json(jsonb)',
    'EXECUTE'
  )
  and pg_catalog.has_function_privilege(
    'vento_context_freshness_owner',
    'app_private.fingerprint_access_source(jsonb)',
    'EXECUTE'
  )
  and pg_catalog.has_function_privilege(
    'vento_context_freshness_owner',
    'app_private.resolve_organization_id()',
    'EXECUTE'
  )
  and pg_catalog.has_function_privilege(
    'vento_context_freshness_owner',
    'extensions.digest(text,text)',
    'EXECUTE'
  )
  and pg_catalog.has_function_privilege(
    'vento_context_freshness_owner',
    'extensions.gen_random_uuid()',
    'EXECUTE'
  ),
  'freshness owner has explicit EXECUTE on every cross-task function dependency'
);

select is(
  (
    select pg_catalog.array_agg(
      c.column_name::text
      order by c.ordinal_position
    )
    from information_schema.columns c
    where c.table_schema =
      'app_private'
      and c.table_name =
        'context_freshness_auth_sessions'
  ),
  array[
    'id',
    'user_id',
    'updated_at',
    'aal',
    'not_after',
    'refreshed_at',
    'oauth_client_id',
    'refresh_token_counter',
    'scopes'
  ]::text[],
  'session bridge exposes exactly nine approved fields'
);

select is(
  (
    select count(*)
    from information_schema.columns c
    where c.table_schema =
      'app_private'
      and c.table_name =
        'context_freshness_auth_sessions'
      and c.column_name in (
        'refresh_token_hmac_key',
        'user_agent',
        'ip'
      )
  ),
  0::bigint,
  'session bridge exposes no refresh secret user agent or IP'
);

select is(
  (
    select count(*)
    from pg_catalog.pg_proc p
    join pg_catalog.pg_namespace n
      on n.oid = p.pronamespace
    where n.nspname = 'app_private'
      and p.proname in (
        'context_freshness_source_shape_fingerprint',
        'fingerprint_context_freshness_generation',
        'bootstrap_context_freshness_runtime',
        'bump_context_freshness',
        'resolve_context_temporal_boundary',
        'get_context_freshness_token',
        'trigger_context_freshness_principals',
        'trigger_context_freshness_identity_links'
      )
  ),
  8::bigint,
  'AUTH-DB-035 creates exactly eight freshness functions'
);

select is(
  (
    select count(*)
    from pg_catalog.pg_proc p
    join pg_catalog.pg_namespace n
      on n.oid = p.pronamespace
    where n.nspname = 'app_private'
      and p.proname in (
        'context_freshness_source_shape_fingerprint',
        'fingerprint_context_freshness_generation',
        'bootstrap_context_freshness_runtime',
        'bump_context_freshness',
        'resolve_context_temporal_boundary',
        'get_context_freshness_token',
        'trigger_context_freshness_principals',
        'trigger_context_freshness_identity_links'
      )
      and p.prosecdef
  ),
  6::bigint,
  'exactly six AUTH-DB-035 functions are SECURITY DEFINER'
);

select is(
  (
    select count(*)
    from pg_catalog.pg_proc p
    join pg_catalog.pg_namespace n
      on n.oid = p.pronamespace
    where n.nspname = 'app_private'
      and p.proname in (
        'bootstrap_context_freshness_runtime',
        'bump_context_freshness',
        'resolve_context_temporal_boundary',
        'get_context_freshness_token',
        'trigger_context_freshness_principals',
        'trigger_context_freshness_identity_links'
      )
      and p.proconfig @>
        array[
          'search_path=pg_catalog, app_private'
        ]
  ),
  6::bigint,
  'all privileged freshness functions have fixed search path'
);

select is(
  (
    select count(*)
    from (
      values
        ('public'),
        ('anon'),
        ('authenticated'),
        ('service_role')
    ) r(role_name)
    cross join (
      values
        ('app_private.context_freshness_source_shape_fingerprint(text,text,text)'),
        ('app_private.fingerprint_context_freshness_generation(uuid,text,text,bigint)'),
        ('app_private.bootstrap_context_freshness_runtime(text)'),
        ('app_private.bump_context_freshness(jsonb)'),
        ('app_private.resolve_context_temporal_boundary(text)'),
        ('app_private.get_context_freshness_token(text)'),
        ('app_private.trigger_context_freshness_principals()'),
        ('app_private.trigger_context_freshness_identity_links()')
    ) f(signature)
    where pg_catalog.has_function_privilege(
      r.role_name,
      f.signature,
      'EXECUTE'
    )
  ),
  0::bigint,
  'freshness functions have zero client EXECUTE'
);

select is(
  (
    select count(*)
    from pg_catalog.pg_proc p
    join pg_catalog.pg_namespace n
      on n.oid = p.pronamespace
    where n.nspname = 'api'
      and p.proname like
        '%freshness%'
  ),
  0::bigint,
  'no freshness RPC exists in api'
);

select is(
  (
    select count(*)
    from pg_catalog.pg_trigger t
    join pg_catalog.pg_class c
      on c.oid = t.tgrelid
    join pg_catalog.pg_namespace n
      on n.oid = c.relnamespace
    where not t.tgisinternal
      and n.nspname = 'auth'
      and c.relname in (
        'sessions',
        'users'
      )
      and t.tgname like
        '%context_freshness%'
  ),
  0::bigint,
  'managed Auth has zero context-freshness triggers'
);

set local role vento_context_freshness_owner;

select is(
  (
    select count(*)
    from app_private.context_freshness_bindings
  ),
  15::bigint,
  'all fifteen AUTH-DB-033 source keys have bindings'
);

select is(
  (
    select count(*)
    from app_private.context_freshness_bindings
    where enforcement_state =
      'ENFORCED'
  ),
  6::bigint,
  'six currently materialized source contracts are enforced'
);

select is(
  (
    select count(*)
    from app_private.context_freshness_bindings
    where enforcement_state =
      'BLOCKED'
  ),
  9::bigint,
  'nine unmaterialized owner sources are explicitly blocked'
);

select is(
  (
    select count(*)
    from app_private.context_freshness_bindings
    where enforcement_state =
      'BOOTSTRAP'
  ),
  0::bigint,
  'no binding remains BOOTSTRAP'
);

select is(
  (
    select count(*)
    from app_private.context_freshness_bindings b
    where b.enforcement_state =
        'ENFORCED'
      and b.source_shape_fingerprint =
        app_private.context_freshness_source_shape_fingerprint(
          b.source_schema,
          b.source_relation,
          b.source_kind
        )
  ),
  6::bigint,
  'all enforced source fingerprints match current shapes'
);

select is(
  (
    select count(*)
    from app_private.context_freshness_generations
    where scope_type =
      'APP_AUTHORIZATION'
  ),
  10::bigint,
  'ten canonical applications have initialized generations'
);

select is(
  (
    select count(*)
    from app_private.context_freshness_generations
    where scope_type =
        'GLOBAL_AUTHORIZATION'
      and scope_key = 'GLOBAL'
  ),
  1::bigint,
  'one global authorization generation exists'
);

select is(
  (
    select count(*)
    from app_private.context_freshness_generations
    where generation < 1
  ),
  0::bigint,
  'zero is never a usable persisted generation'
);

select is(
  (
    select count(*)
    from audit.context_invalidation_outbox
    where producer =
      'AUTH-DB-035::GLOBAL:BOOTSTRAP'
  ),
  1::bigint,
  'bootstrap outbox event is idempotently unique'
);

reset role;

select throws_ok(
  $$
    select
      app_private.get_context_freshness_token(
        null
      )
  $$,
  '22023',
  'AUTH_DB_035_APPLICATION_CODE_INVALID',
  'null app code fails closed'
);

select throws_ok(
  $$
    select
      app_private.get_context_freshness_token(
        ''
      )
  $$,
  '22023',
  'AUTH_DB_035_APPLICATION_CODE_INVALID',
  'empty app code fails closed'
);

select throws_ok(
  $$
    select
      app_private.get_context_freshness_token(
        'unknown-app'
      )
  $$,
  '22023',
  'AUTH_DB_035_APPLICATION_UNKNOWN',
  'unknown app fails closed'
);

create temporary table
  auth_db_035_runtime_original
on commit drop
as
select
  app_private.bootstrap_context_freshness_runtime(
    'LOCAL'
  ) ->> 'environment_identity'
    as environment_identity;

select matches(
  (
    select environment_identity
    from auth_db_035_runtime_original
  ),
  '^env:[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}$',
  'LOCAL runtime identity is opaque'
);

select is(
  (
    app_private.bootstrap_context_freshness_runtime(
      'LOCAL'
    ) ->> 'environment_identity'
  ),
  (
    select environment_identity
    from auth_db_035_runtime_original
  ),
  'LOCAL bootstrap is idempotent'
);

select throws_ok(
  $$
    select
      app_private.bootstrap_context_freshness_runtime(
        'STAGING'
      )
  $$,
  '22023',
  'AUTH_DB_035_ENVIRONMENT_IDENTITY_CONFLICT',
  'one database cannot silently switch environment identity'
);

savepoint auth_db_035_environment_isolation;

set local role vento_context_freshness_owner;

delete from app_private.context_freshness_runtime
where runtime_key = 'ACTIVE';

reset role;

create temporary table
  auth_db_035_staging_identity
on commit drop
as
select
  app_private.bootstrap_context_freshness_runtime(
    'STAGING'
  ) ->> 'environment_identity'
    as environment_identity;

select isnt(
  (
    select environment_identity
    from auth_db_035_staging_identity
  ),
  (
    select environment_identity
    from auth_db_035_runtime_original
  ),
  'different environment bootstraps produce different opaque identities'
);

rollback to savepoint
  auth_db_035_environment_isolation;

select is(
  (
    app_private.bootstrap_context_freshness_runtime(
      'LOCAL'
    ) ->> 'environment_identity'
  ),
  (
    select environment_identity
    from auth_db_035_runtime_original
  ),
  'rollback restores LOCAL runtime identity'
);

insert into auth.users (
  id,
  email
)
values
  (
    '35000000-0000-4000-8000-000000000001',
    'auth-db-035@test.local'
  ),
  (
    '35000000-0000-4000-8000-000000000099',
    'auth-db-035-other@test.local'
  )
on conflict (id) do nothing;

insert into auth.sessions (
  id,
  user_id,
  created_at,
  updated_at,
  aal,
  not_after,
  refreshed_at,
  refresh_token_counter,
  scopes
)
values (
  '35000000-0000-4000-8000-000000000010',
  '35000000-0000-4000-8000-000000000001',
  pg_catalog.statement_timestamp(),
  pg_catalog.statement_timestamp(),
  'aal1'::auth.aal_level,
  pg_catalog.statement_timestamp() +
    interval '1 hour',
  pg_catalog.statement_timestamp()
    at time zone 'UTC',
  1,
  'openid'
);

set local role vento_ddl_owner;

insert into identity_access.principals (
  id,
  auth_subject_id,
  principal_kind,
  source_version,
  audit_reference
)
values (
  '35000000-0000-4000-8000-000000000020',
  '35000000-0000-4000-8000-000000000001',
  'HUMAN_USER',
  'AUTH-DB-035-TEST-1',
  'pgTAP rollback fixture'
);

insert into identity_access.enterprise_identity_links (
  id,
  principal_id,
  auth_subject_id,
  principal_kind,
  enterprise_identity_kind,
  enterprise_identity_id,
  link_state,
  link_origin,
  assurance_level,
  authority_reference,
  reason_code,
  verified_at,
  activated_at,
  source_version,
  audit_reference
)
values (
  '35000000-0000-4000-8000-000000000030',
  '35000000-0000-4000-8000-000000000020',
  '35000000-0000-4000-8000-000000000001',
  'HUMAN_USER',
  'CUSTOMER',
  '35000000-0000-4000-8000-000000000040',
  'ACTIVE',
  'MANUAL_RECONCILIATION',
  'TEST',
  'AUTH-DB-035-TEST',
  'TEST_FIXTURE',
  pg_catalog.statement_timestamp(),
  pg_catalog.statement_timestamp(),
  'AUTH-DB-035-TEST-1',
  'pgTAP rollback fixture'
);

reset role;

select set_config(
  'request.jwt.claim.sub',
  '35000000-0000-4000-8000-000000000001',
  true
);

select set_config(
  'request.jwt.claim.session_id',
  '35000000-0000-4000-8000-000000000010',
  true
);

select set_config(
  'request.jwt.claim.iat',
  (
    extract(
      epoch from
      pg_catalog.statement_timestamp() -
        interval '1 minute'
    )::bigint
  )::text,
  true
);

select set_config(
  'request.jwt.claim.exp',
  (
    extract(
      epoch from
      pg_catalog.statement_timestamp() +
        interval '30 minutes'
    )::bigint
  )::text,
  true
);

select set_config(
  'request.jwt.claims',
  pg_catalog.jsonb_build_object(
    'sub',
    '35000000-0000-4000-8000-000000000001',
    'session_id',
    '35000000-0000-4000-8000-000000000010',
    'iat',
    extract(
      epoch from
      pg_catalog.statement_timestamp() -
        interval '1 minute'
    )::bigint,
    'exp',
    extract(
      epoch from
      pg_catalog.statement_timestamp() +
        interval '30 minutes'
    )::bigint,
    'aal',
    'aal1'
  )::text,
  true
);

create temporary table
  auth_db_035_token_a
on commit drop
as
select
  app_private.get_context_freshness_token(
    'pass'
  ) as token;

select is(
  (
    select count(*)
    from pg_catalog.jsonb_object_keys(
      (
        select token
        from auth_db_035_token_a
      )
    )
  ),
  17::bigint,
  'ContextFreshnessToken has exactly seventeen fields'
);

select is(
  (
    select token ->> 'contract_name'
    from auth_db_035_token_a
  ),
  'ContextFreshnessToken',
  'token contract name is exact'
);

select is(
  (
    select token ->> 'contract_version'
    from auth_db_035_token_a
  ),
  '1.0.0',
  'token contract version is exact'
);

select matches(
  (
    select token ->> 'environment'
    from auth_db_035_token_a
  ),
  '^env:[0-9a-f-]{36}$',
  'token environment is opaque'
);

select is(
  (
    select token ->> 'organization_id'
    from auth_db_035_token_a
  ),
  app_private.resolve_organization_id()::text,
  'token organization comes from AUTH-DB-036'
);

select is(
  (
    select token ->> 'app_code'
    from auth_db_035_token_a
  ),
  'pass',
  'token app code is exact'
);

select matches(
  (
    select token ->> 'subject_key'
    from auth_db_035_token_a
  ),
  '^sha256:[0-9a-f]{64}$',
  'subject key is canonical SHA-256'
);

select matches(
  (
    select token ->> 'session_generation'
    from auth_db_035_token_a
  ),
  '^sha256:[0-9a-f]{64}$',
  'session generation is hashed'
);

select matches(
  (
    select token ->> 'actor_generation'
    from auth_db_035_token_a
  ),
  '^sha256:[0-9a-f]{64}$',
  'actor generation is hashed'
);

select is(
  (
    select token ->> 'employee_generation'
    from auth_db_035_token_a
  ),
  'NOT_APPLICABLE',
  'customer has NOT_APPLICABLE employee generation'
);

select is(
  (
    select token ->> 'base_lane_generation'
    from auth_db_035_token_a
  ),
  'NOT_APPLICABLE',
  'customer has NOT_APPLICABLE base lane generation'
);

select is(
  (
    select token ->>
      'operational_lane_generation'
    from auth_db_035_token_a
  ),
  'NOT_APPLICABLE',
  'customer has NOT_APPLICABLE operational lane generation'
);

select is(
  (
    select token ->> 'device_generation'
    from auth_db_035_token_a
  ),
  'NOT_APPLICABLE',
  'personal customer session has NOT_APPLICABLE device generation'
);

select matches(
  (
    select token ->>
      'app_authorization_generation'
    from auth_db_035_token_a
  ),
  '^sha256:[0-9a-f]{64}$',
  'app generation is hashed'
);

select matches(
  (
    select token ->>
      'global_authorization_generation'
    from auth_db_035_token_a
  ),
  '^sha256:[0-9a-f]{64}$',
  'global generation is hashed'
);

select matches(
  (
    select token ->>
      'token_fingerprint'
    from auth_db_035_token_a
  ),
  '^sha256:[0-9a-f]{64}$',
  'token fingerprint is canonical SHA-256'
);

select ok(
  (
    select (
      token ->>
        'next_temporal_boundary_at'
    )::timestamptz >
      pg_catalog.statement_timestamp()
    from auth_db_035_token_a
  ),
  'raw temporal boundary is in the future'
);

select ok(
  (
    select (
      token ->>
        'next_temporal_boundary_at'
    )::timestamptz -
      interval '1 second' >
      pg_catalog.statement_timestamp()
    from auth_db_035_token_a
  ),
  'one-second safety margin is currently satisfiable'
);

select ok(
  not (
    select token
    from auth_db_035_token_a
  ) ?| array[
    'permission',
    'permissions',
    'resource',
    'decision',
    'allow',
    'role',
    'site',
    'area'
  ],
  'freshness token carries no authorization decision'
);

select ok(
  (
    select token::text
    from auth_db_035_token_a
  ) not like '%auth-db-035@test.local%'
  and (
    select token::text
    from auth_db_035_token_a
  ) not like '%refresh_token_hmac_key%'
  and (
    select token::text
    from auth_db_035_token_a
  ) not like '%user_agent%'
  and (
    select token::text
    from auth_db_035_token_a
  ) not like '%"ip"%',
  'token carries no email refresh secret user agent or IP'
);

select pg_catalog.pg_sleep(0.01);

create temporary table
  auth_db_035_token_b
on commit drop
as
select
  app_private.get_context_freshness_token(
    'pass'
  ) as token;

select is(
  (
    select token ->>
      'token_fingerprint'
    from auth_db_035_token_b
  ),
  (
    select token ->>
      'token_fingerprint'
    from auth_db_035_token_a
  ),
  'issued_at alone does not alter token fingerprint'
);

select isnt(
  (
    select token ->> 'issued_at'
    from auth_db_035_token_b
  ),
  (
    select token ->> 'issued_at'
    from auth_db_035_token_a
  ),
  'issued_at changes across later reads'
);

select is(
  (
    select
      app_private.get_access_context(
        'pass'
      ) #>>
        '{resolution_metadata,cache_status}'
  ),
  'NOT_IMPLEMENTED',
  'AUTH-DB-035 does not enable L1'
);

set local search_path =
  pg_temp,
  public,
  extensions;

create temporary table
  context_freshness_generations (
    poisoned text
  );

create temporary table
  context_freshness_bindings (
    poisoned text
  );

select is(
  (
    app_private.get_context_freshness_token(
      'pass'
    ) ->> 'token_fingerprint'
  ),
  (
    select token ->>
      'token_fingerprint'
    from auth_db_035_token_b
  ),
  'caller search_path poisoning and homonyms do not alter token result'
);

set local search_path =
  public,
  extensions;

set local role vento_context_freshness_owner;

create temporary table
  auth_db_035_actor_before
on commit drop
as
select
  generation,
  last_event_id
from app_private.context_freshness_generations
where scope_type = 'ACTOR'
  and scope_key =
    '35000000-0000-4000-8000-000000000020';

reset role;

set local role vento_ddl_owner;

update identity_access.principals
set source_version =
  'AUTH-DB-035-TEST-2'
where id =
  '35000000-0000-4000-8000-000000000020';

reset role;

set local role vento_context_freshness_owner;

select is(
  (
    select generation
    from app_private.context_freshness_generations
    where scope_type = 'ACTOR'
      and scope_key =
        '35000000-0000-4000-8000-000000000020'
  ),
  (
    select generation + 1
    from auth_db_035_actor_before
  ),
  'principal mutation increments actor generation exactly once'
);

select is(
  (
    select count(*)
    from audit.context_invalidation_outbox o
    where o.producer =
      'AUTH-DB-035:principal_registry'
      and o.event_type =
        'DOMAIN_IDENTITY_CHANGED'
  ) >= 1,
  true,
  'principal mutation writes outbox in the same transaction'
);

select is(
  (
    select source_transaction_id
    from audit.context_invalidation_outbox
    where event_id = (
      select last_event_id
      from app_private.context_freshness_generations
      where scope_type = 'ACTOR'
        and scope_key =
          '35000000-0000-4000-8000-000000000020'
    )
  ),
  pg_catalog.pg_current_xact_id()::text,
  'generation and outbox correlate to the same transaction'
);

reset role;

create temporary table
  auth_db_035_token_c
on commit drop
as
select
  app_private.get_context_freshness_token(
    'pass'
  ) as token;

select isnt(
  (
    select token ->>
      'actor_generation'
    from auth_db_035_token_c
  ),
  (
    select token ->>
      'actor_generation'
    from auth_db_035_token_b
  ),
  'actor mutation changes hashed generation'
);

select isnt(
  (
    select token ->>
      'token_fingerprint'
    from auth_db_035_token_c
  ),
  (
    select token ->>
      'token_fingerprint'
    from auth_db_035_token_b
  ),
  'actor mutation changes token fingerprint'
);

set local role vento_context_freshness_owner;

create temporary table
  auth_db_035_rollback_before
on commit drop
as
select
  (
    select generation
    from app_private.context_freshness_generations
    where scope_type = 'ACTOR'
      and scope_key =
        '35000000-0000-4000-8000-000000000020'
  ) as generation,
  (
    select count(*)
    from audit.context_invalidation_outbox
  ) as outbox_count;

reset role;

savepoint auth_db_035_business_rollback;

set local role vento_ddl_owner;

update identity_access.principals
set source_version =
  'AUTH-DB-035-ROLLBACK'
where id =
  '35000000-0000-4000-8000-000000000020';

reset role;

rollback to savepoint
  auth_db_035_business_rollback;

set local role vento_context_freshness_owner;

select is(
  (
    select generation
    from app_private.context_freshness_generations
    where scope_type = 'ACTOR'
      and scope_key =
        '35000000-0000-4000-8000-000000000020'
  ),
  (
    select generation
    from auth_db_035_rollback_before
  ),
  'rolled-back business mutation rolls back generation'
);

select is(
  (
    select count(*)
    from audit.context_invalidation_outbox
  ),
  (
    select outbox_count
    from auth_db_035_rollback_before
  ),
  'rolled-back business mutation rolls back outbox'
);

reset role;

savepoint auth_db_035_missing_generation;

set local role vento_context_freshness_owner;

delete from app_private.context_freshness_generations
where scope_type =
    'APP_AUTHORIZATION'
  and scope_key = 'pass';

reset role;

select throws_ok(
  $$
    select
      app_private.get_context_freshness_token(
        'pass'
      )
  $$,
  'P0001',
  'AUTH_DB_035_GENERATION_MISSING',
  'required generation missing fails closed'
);

rollback to savepoint
  auth_db_035_missing_generation;

savepoint auth_db_035_missing_session;

delete from auth.sessions
where id =
  '35000000-0000-4000-8000-000000000010';

select throws_ok(
  $$
    select
      app_private.get_context_freshness_token(
        'pass'
      )
  $$,
  'P0001',
  'AUTH_DB_035_SESSION_MISSING',
  'missing managed session fails closed'
);

rollback to savepoint
  auth_db_035_missing_session;

savepoint auth_db_035_session_mismatch;

update auth.sessions
set user_id =
  '35000000-0000-4000-8000-000000000099'
where id =
  '35000000-0000-4000-8000-000000000010';

select throws_ok(
  $$
    select
      app_private.get_context_freshness_token(
        'pass'
      )
  $$,
  'P0001',
  'AUTH_DB_035_SESSION_PRINCIPAL_MISMATCH',
  'session principal mismatch fails closed'
);

rollback to savepoint
  auth_db_035_session_mismatch;

savepoint auth_db_035_expired_access_token;

select set_config(
  'request.jwt.claim.exp',
  (
    extract(
      epoch from
      pg_catalog.statement_timestamp() -
        interval '1 minute'
    )::bigint
  )::text,
  true
);

select set_config(
  'request.jwt.claims',
  pg_catalog.jsonb_build_object(
    'sub',
    '35000000-0000-4000-8000-000000000001',
    'session_id',
    '35000000-0000-4000-8000-000000000010',
    'iat',
    extract(
      epoch from
      pg_catalog.statement_timestamp() -
        interval '2 minutes'
    )::bigint,
    'exp',
    extract(
      epoch from
      pg_catalog.statement_timestamp() -
        interval '1 minute'
    )::bigint,
    'aal',
    'aal1'
  )::text,
  true
);

select throws_ok(
  $$
    select
      app_private.get_context_freshness_token(
        'pass'
      )
  $$,
  'P0001',
  'AUTH_DB_035_ACCESS_TOKEN_EXPIRED',
  'expired access token cannot yield reusable freshness'
);

rollback to savepoint
  auth_db_035_expired_access_token;

select set_config(
  'request.jwt.claim.exp',
  (
    extract(
      epoch from
      pg_catalog.statement_timestamp() +
        interval '30 minutes'
    )::bigint
  )::text,
  true
);

select set_config(
  'request.jwt.claims',
  pg_catalog.jsonb_build_object(
    'sub',
    '35000000-0000-4000-8000-000000000001',
    'session_id',
    '35000000-0000-4000-8000-000000000010',
    'iat',
    extract(
      epoch from
      pg_catalog.statement_timestamp() -
        interval '1 minute'
    )::bigint,
    'exp',
    extract(
      epoch from
      pg_catalog.statement_timestamp() +
        interval '30 minutes'
    )::bigint,
    'aal',
    'aal1'
  )::text,
  true
);

create temporary table
  auth_db_035_session_before
on commit drop
as
select
  app_private.get_context_freshness_token(
    'pass'
  ) as token;

update auth.sessions
set
  not_after =
    pg_catalog.statement_timestamp() +
      interval '10 minutes',
  updated_at =
    pg_catalog.statement_timestamp()
where id =
  '35000000-0000-4000-8000-000000000010';

create temporary table
  auth_db_035_session_after
on commit drop
as
select
  app_private.get_context_freshness_token(
    'pass'
  ) as token;

select isnt(
  (
    select token ->>
      'session_generation'
    from auth_db_035_session_after
  ),
  (
    select token ->>
      'session_generation'
    from auth_db_035_session_before
  ),
  'managed session mutation changes session generation'
);

select ok(
  (
    select (
      token ->>
        'next_temporal_boundary_at'
    )::timestamptz
    from auth_db_035_session_after
  ) <
  (
    select (
      token ->>
        'next_temporal_boundary_at'
    )::timestamptz
    from auth_db_035_session_before
  ),
  'earlier session expiry advances raw temporal boundary'
);

set local role vento_context_freshness_owner;

create temporary table
  auth_db_035_event_loss_before
on commit drop
as
select
  generation,
  last_event_id
from app_private.context_freshness_generations
where scope_type = 'ACTOR'
  and scope_key =
    '35000000-0000-4000-8000-000000000020';

reset role;

set local role vento_ddl_owner;

update identity_access.principals
set source_version =
  'AUTH-DB-035-EVENT-LOSS'
where id =
  '35000000-0000-4000-8000-000000000020';

reset role;

create temporary table
  auth_db_035_event_loss_token
on commit drop
as
select
  app_private.get_context_freshness_token(
    'pass'
  ) as token;

set local role vento_context_freshness_owner;

delete from audit.context_invalidation_outbox
where event_id = (
  select last_event_id
  from app_private.context_freshness_generations
  where scope_type = 'ACTOR'
    and scope_key =
      '35000000-0000-4000-8000-000000000020'
);

reset role;

select is(
  (
    app_private.get_context_freshness_token(
      'pass'
    ) ->> 'token_fingerprint'
  ),
  (
    select token ->>
      'token_fingerprint'
    from auth_db_035_event_loss_token
  ),
  'lost outbox event cannot restore stale token'
);

set local role vento_context_freshness_owner;

select is(
  (
    select count(*)
    from app_private.context_freshness_bindings
    where enforcement_state = 'BLOCKED'
      and source_contract_key in (
        'employment_model',
        'role_catalog',
        'site_catalog',
        'area_catalog',
        'administrative_coverage_policy',
        'shift_model',
        'checkin_model',
        'device_model',
        'actor_session_model'
      )
  ),
  9::bigint,
  'all currently unavailable temporal and workforce owner sources remain BLOCKED_SAFE'
);

reset role;

do $auth_db_035_disconnect_stale_concurrency_connections$
declare
  v_connection text;
begin
  foreach v_connection in array
    coalesce(
      extensions.dblink_get_connections(),
      array[]::text[]
    )
  loop
    if v_connection in (
      'auth_db_035_c1',
      'auth_db_035_c2'
    ) then
      perform
        extensions.dblink_disconnect(
          v_connection
        );
    end if;
  end loop;
end
$auth_db_035_disconnect_stale_concurrency_connections$;
select is(
  extensions.dblink_connect(
    'auth_db_035_c1',
    'host=host.docker.internal port=54322 dbname=postgres user=postgres password=postgres'
  ),
  'OK',
  'first concurrency connection opens'
);
select is(
  extensions.dblink_exec(
    'auth_db_035_c1',
    'set role vento_context_freshness_owner'
  ),
  'SET',
  'concurrency pre-clean enters freshness owner'
);

select matches(
  extensions.dblink_exec(
    'auth_db_035_c1',
    $q$
      delete from audit.context_invalidation_outbox
      where producer =
        'AUTH-DB-035-PGTAP-CONCURRENCY'
    $q$
  ),
  '^DELETE [0-9]+$',
  'concurrency pre-clean removes residual outbox fixtures'
);

select matches(
  extensions.dblink_exec(
    'auth_db_035_c1',
    $q$
      delete from app_private.context_freshness_generations
      where scope_type = 'ACTOR'
        and scope_key =
          'AUTH_DB_035_CONCURRENCY'
    $q$
  ),
  '^DELETE [0-9]+$',
  'concurrency pre-clean removes residual generation fixture'
);

select is(
  extensions.dblink_exec(
    'auth_db_035_c1',
    'reset role'
  ),
  'RESET',
  'concurrency pre-clean restores postgres role'
);

select is(
  extensions.dblink_connect(
    'auth_db_035_c2',
    'host=host.docker.internal port=54322 dbname=postgres user=postgres password=postgres'
  ),
  'OK',
  'second concurrency connection opens'
);

select is(
  extensions.dblink_send_query(
    'auth_db_035_c1',
    $q$
      with auth_db_035_c1_delay as materialized (
        select pg_catalog.pg_sleep(1.00)
      )
      select
        app_private.bump_context_freshness(
          pg_catalog.jsonb_build_object(
            'organization_id',
            app_private.resolve_organization_id(),
            'event_type',
            'ACTOR_ASSIGNMENT_CHANGED',
            'generation_scopes',
            pg_catalog.jsonb_build_array(
              'ACTOR'
            ),
            'scope_ids',
            pg_catalog.jsonb_build_object(
              'ACTOR',
              pg_catalog.jsonb_build_array(
                'AUTH_DB_035_CONCURRENCY'
              )
            ),
            'app_code',
            null,
            'subject_key_hash',
            null,
            'producer',
            'AUTH-DB-035-PGTAP-CONCURRENCY',
            'schema_version',
            '1.0.0'
          )
        )::text
      from auth_db_035_c1_delay
    $q$
  ),
  1,
  'first concurrent generation bump starts'
);

select pg_catalog.pg_sleep(0.20);

select is(
  extensions.dblink_send_query(
    'auth_db_035_c2',
    $q$
      select
        app_private.bump_context_freshness(
          pg_catalog.jsonb_build_object(
            'organization_id',
            app_private.resolve_organization_id(),
            'event_type',
            'ACTOR_ASSIGNMENT_CHANGED',
            'generation_scopes',
            pg_catalog.jsonb_build_array(
              'ACTOR'
            ),
            'scope_ids',
            pg_catalog.jsonb_build_object(
              'ACTOR',
              pg_catalog.jsonb_build_array(
                'AUTH_DB_035_CONCURRENCY'
              )
            ),
            'app_code',
            null,
            'subject_key_hash',
            null,
            'producer',
            'AUTH-DB-035-PGTAP-CONCURRENCY',
            'schema_version',
            '1.0.0'
          )
        )::text
    $q$
  ),
  1,
  'second concurrent generation bump starts'
);

select ok(
  (
    select result is not null
    from extensions.dblink_get_result(
      'auth_db_035_c1'
    ) as r(result text)
  ),
  'first concurrent bump completes'
);

select ok(
  (
    select result is not null
    from extensions.dblink_get_result(
      'auth_db_035_c2'
    ) as r(result text)
  ),
  'second concurrent bump completes'
);

do $auth_db_035_drain_async_results$
begin
  perform 1
  from extensions.dblink_get_result(
    'auth_db_035_c1'
  ) as r(result text);

  perform 1
  from extensions.dblink_get_result(
    'auth_db_035_c2'
  ) as r(result text);
end
$auth_db_035_drain_async_results$;

select is(
  extensions.dblink_exec(
    'auth_db_035_c1',
    'set role vento_context_freshness_owner'
  ),
  'SET',
  'concurrency connection enters freshness owner for evidence'
);

select is(
  (
    select generation
    from extensions.dblink(
      'auth_db_035_c1',
      $q$
        select generation
        from app_private.context_freshness_generations
        where scope_type = 'ACTOR'
          and scope_key =
            'AUTH_DB_035_CONCURRENCY'
      $q$
    ) as r(generation bigint)
  ),
  2::bigint,
  'two concurrent writers produce generation two'
);

select is(
  (
    select event_count
    from extensions.dblink(
      'auth_db_035_c1',
      $q$
        select count(*)
        from audit.context_invalidation_outbox
        where producer =
          'AUTH-DB-035-PGTAP-CONCURRENCY'
      $q$
    ) as r(event_count bigint)
  ),
  2::bigint,
  'two concurrent writers produce two outbox events'
);

select is(
  extensions.dblink_exec(
    'auth_db_035_c1',
    $q$
      delete from audit.context_invalidation_outbox
      where producer =
        'AUTH-DB-035-PGTAP-CONCURRENCY'
    $q$
  ),
  'DELETE 2',
  'concurrency outbox fixture is cleaned'
);

select is(
  extensions.dblink_exec(
    'auth_db_035_c1',
    $q$
      delete from app_private.context_freshness_generations
      where scope_type = 'ACTOR'
        and scope_key =
          'AUTH_DB_035_CONCURRENCY'
    $q$
  ),
  'DELETE 1',
  'concurrency generation fixture is cleaned'
);

select is(
  extensions.dblink_disconnect(
    'auth_db_035_c1'
  ),
  'OK',
  'first concurrency connection closes'
);

select is(
  extensions.dblink_disconnect(
    'auth_db_035_c2'
  ),
  'OK',
  'second concurrency connection closes'
);

select matches(
  pg_catalog.pg_get_functiondef(
    'app_private.bump_context_freshness(jsonb)'
      ::regprocedure
  ),
  'updated_at[[:space:]]*=[[:space:]]*greatest\([[:space:]]*target\.updated_at,[[:space:]]*pg_catalog\.statement_timestamp\(\)[[:space:]]*\)',
  'concurrent conflict update preserves monotonic updated_at'
);
select matches(
  pg_catalog.pg_get_functiondef(
    'app_private.bump_context_freshness(jsonb)'
      ::regprocedure
  ),
  'order by[[:space:]]+s\.scope_type,[[:space:]]+k\.scope_key',
  'multi-scope bump locks scopes in deterministic order'
);

select is(
  extensions.dblink_connect(
    'auth_db_035_plan',
    'host=host.docker.internal port=54322 dbname=postgres user=postgres password=postgres'
  ),
  'OK',
  'plan evidence connection opens'
);

select is(
  extensions.dblink_exec(
    'auth_db_035_plan',
    'set role vento_context_freshness_owner'
  ),
  'SET',
  'plan evidence uses freshness owner'
);

select is(
  extensions.dblink_exec(
    'auth_db_035_plan',
    'set enable_seqscan = off'
  ),
  'SET',
  'plan evidence disables seqscan for deterministic index proof'
);

create temporary table
  auth_db_035_plan_lines
on commit drop
as
select line
from extensions.dblink(
  'auth_db_035_plan',
  $q$
    explain (costs off)
    select event_id
    from audit.context_invalidation_outbox
    where delivery_status = 'PENDING'
    order by occurred_at, event_id
    limit 10
  $q$
) as r(line text);

select ok(
  exists (
    select 1
    from auth_db_035_plan_lines
    where line like
      '%ix_context_invalidation_pending%'
  ),
  'pending outbox query has index-plan evidence'
);

select is(
  extensions.dblink_disconnect(
    'auth_db_035_plan'
  ),
  'OK',
  'plan evidence connection closes'
);

create temporary table
  auth_db_035_token_perf (
    elapsed_ms double precision not null
  )
on commit drop;

do $auth_db_035_token_perf$
declare
  v_index integer;
  v_start timestamptz;
begin
  for v_index in 1..30 loop
    v_start :=
      pg_catalog.clock_timestamp();

    perform
      app_private.get_context_freshness_token(
        'pass'
      );

    insert into auth_db_035_token_perf (
      elapsed_ms
    )
    values (
      extract(
        epoch from (
          pg_catalog.clock_timestamp() -
          v_start
        )
      ) * 1000.0
    );
  end loop;
end
$auth_db_035_token_perf$;

select ok(
  (
    select
      pg_catalog.percentile_cont(0.50)
      within group (
        order by elapsed_ms
      )
    from auth_db_035_token_perf
  ) >= 0,
  'token reader p50 is captured'
);

select ok(
  (
    select
      pg_catalog.percentile_cont(0.95)
      within group (
        order by elapsed_ms
      )
    from auth_db_035_token_perf
  ) >=
  (
    select
      pg_catalog.percentile_cont(0.50)
      within group (
        order by elapsed_ms
      )
    from auth_db_035_token_perf
  ),
  'token reader p95 is captured'
);

select diag(
  pg_catalog.format(
    'AUTH_DB_035_TOKEN_READER_MS p50=%s p95=%s',
    (
      select pg_catalog.round(
        pg_catalog.percentile_cont(0.50)
        within group (
          order by elapsed_ms
        )::numeric,
        3
      )
      from auth_db_035_token_perf
    ),
    (
      select pg_catalog.round(
        pg_catalog.percentile_cont(0.95)
        within group (
          order by elapsed_ms
        )::numeric,
        3
      )
      from auth_db_035_token_perf
    )
  )
);

create temporary table
  auth_db_035_bump_perf (
    elapsed_ms double precision not null
  )
on commit drop;

do $auth_db_035_bump_perf$
declare
  v_index integer;
  v_start timestamptz;
begin
  for v_index in 1..30 loop
    v_start :=
      pg_catalog.clock_timestamp();

    perform app_private.bump_context_freshness(
      pg_catalog.jsonb_build_object(
        'organization_id',
        app_private.resolve_organization_id(),
        'event_type',
        'ACTOR_ASSIGNMENT_CHANGED',
        'generation_scopes',
        pg_catalog.jsonb_build_array(
          'ACTOR'
        ),
        'scope_ids',
        pg_catalog.jsonb_build_object(
          'ACTOR',
          pg_catalog.jsonb_build_array(
            'AUTH_DB_035_PERF'
          )
        ),
        'app_code',
        null,
        'subject_key_hash',
        null,
        'producer',
        'AUTH-DB-035-PERF',
        'schema_version',
        '1.0.0'
      )
    );

    insert into auth_db_035_bump_perf (
      elapsed_ms
    )
    values (
      extract(
        epoch from (
          pg_catalog.clock_timestamp() -
          v_start
        )
      ) * 1000.0
    );
  end loop;
end
$auth_db_035_bump_perf$;

select ok(
  (
    select
      pg_catalog.percentile_cont(0.50)
      within group (
        order by elapsed_ms
      )
    from auth_db_035_bump_perf
  ) >= 0,
  'generation bump p50 is captured'
);

select ok(
  (
    select
      pg_catalog.percentile_cont(0.95)
      within group (
        order by elapsed_ms
      )
    from auth_db_035_bump_perf
  ) >=
  (
    select
      pg_catalog.percentile_cont(0.50)
      within group (
        order by elapsed_ms
      )
    from auth_db_035_bump_perf
  ),
  'generation bump p95 is captured'
);

select diag(
  pg_catalog.format(
    'AUTH_DB_035_BUMP_MS p50=%s p95=%s',
    (
      select pg_catalog.round(
        pg_catalog.percentile_cont(0.50)
        within group (
          order by elapsed_ms
        )::numeric,
        3
      )
      from auth_db_035_bump_perf
    ),
    (
      select pg_catalog.round(
        pg_catalog.percentile_cont(0.95)
        within group (
          order by elapsed_ms
        )::numeric,
        3
      )
      from auth_db_035_bump_perf
    )
  )
);

select ok(
  (
    select count(*)
    from pg_catalog.pg_indexes i
    where i.schemaname = 'audit'
      and i.tablename =
        'context_invalidation_outbox'
      and i.indexname in (
        'ix_context_invalidation_pending',
        'ix_context_invalidation_organization_time',
        'ix_context_invalidation_app_time'
      )
  ) = 3,
  'outbox has three approved query-support indexes'
);

select ok(
  (
    select count(*)
    from pg_catalog.pg_indexes i
    where i.schemaname =
        'app_private'
      and i.tablename =
        'context_freshness_bindings'
      and i.indexname in (
        'ux_context_freshness_bindings_current_contract',
        'ix_context_freshness_bindings_source',
        'ix_context_freshness_bindings_state'
      )
  ) = 3,
  'binding registry has three approved indexes'
);

select is(
  (
    select count(*)
    from pg_catalog.pg_trigger t
    join pg_catalog.pg_class c
      on c.oid = t.tgrelid
    join pg_catalog.pg_namespace n
      on n.oid = c.relnamespace
    where not t.tgisinternal
      and n.nspname = 'public'
      and c.relname in (
        'employees',
        'employee_sites',
        'employee_areas',
        'employee_shifts',
        'attendance_shift_events',
        'employee_site_operational_profiles',
        'shared_operational_devices',
        'shared_operational_device_actor_sessions',
        'shared_operational_device_apps',
        'app_permissions',
        'employee_permissions',
        'operational_role_permissions',
        'role_permissions',
        'roles',
        'operational_roles',
        'site_operational_roles',
        'shift_policy'
      )
      and t.tgname like
        '%context_freshness%'
  ),
  0::bigint,
  'legacy-looking relations are not silently promoted to canonical authority'
);

select is(
  (
    select count(*)
    from pg_catalog.pg_proc p
    join pg_catalog.pg_namespace n
      on n.oid = p.pronamespace
    where n.nspname = 'api'
      and p.prokind in ('f', 'p')
      and (
        pg_catalog.pg_get_functiondef(
          p.oid
        ) like '%ContextFreshnessToken%'
        or pg_catalog.pg_get_functiondef(
          p.oid
        ) like '%context_freshness%'
      )
  ),
  0::bigint,
  'freshness token never crosses the api projection boundary'
);

select *
from finish();

rollback;
