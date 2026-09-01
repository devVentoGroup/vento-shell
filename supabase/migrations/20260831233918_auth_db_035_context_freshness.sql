-- AUTH-DB-035
-- ContextFreshnessToken@1.0.0 transactional freshness foundation.
-- L1 remains disabled. Cache mode remains REQUEST_ONLY.
-- No managed Auth table is mutated by this migration.

begin;

do $auth_db_035_preconditions$
declare
  v_required_session_columns bigint;
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
    raise exception
      'AUTH_DB_035_FRESHNESS_OWNER_MISSING_OR_UNSAFE';
  end if;

  if pg_catalog.to_regnamespace('app_private') is null
     or pg_catalog.to_regnamespace('audit') is null
     or pg_catalog.to_regnamespace('identity_access') is null
     or pg_catalog.to_regnamespace('org_governance') is null
     or pg_catalog.to_regclass(
       'identity_access.principals'
     ) is null
     or pg_catalog.to_regclass(
       'identity_access.enterprise_identity_links'
     ) is null
     or pg_catalog.to_regclass(
       'org_governance.organization_scopes'
     ) is null
     or pg_catalog.to_regprocedure(
       'app_private.get_access_context(text)'
     ) is null
     or pg_catalog.to_regprocedure(
       'app_private.resolve_access_application(text,timestamp with time zone)'
     ) is null
     or pg_catalog.to_regprocedure(
       'app_private.canonicalize_json(jsonb)'
     ) is null
     or pg_catalog.to_regprocedure(
       'app_private.fingerprint_access_source(jsonb)'
     ) is null
     or pg_catalog.to_regprocedure(
       'app_private.resolve_organization_id()'
     ) is null
     or pg_catalog.to_regprocedure(
       'extensions.gen_random_uuid()'
     ) is null then
    raise exception
      'AUTH_DB_035_REQUIRED_FOUNDATION_MISSING';
  end if;

  select count(*)
  into v_required_session_columns
  from pg_catalog.pg_attribute a
  where a.attrelid = 'auth.sessions'::regclass
    and a.attnum > 0
    and not a.attisdropped
    and a.attname in (
      'id',
      'user_id',
      'updated_at',
      'aal',
      'not_after',
      'refreshed_at',
      'oauth_client_id',
      'refresh_token_counter',
      'scopes'
    );

  if v_required_session_columns <> 9 then
    raise exception
      'AUTH_DB_035_AUTH_SESSIONS_SHAPE_DRIFT:%',
      v_required_session_columns;
  end if;
end
$auth_db_035_preconditions$;

grant usage, create
on schema app_private, audit
to vento_context_freshness_owner;

grant usage
on schema identity_access, org_governance, extensions
to vento_context_freshness_owner;

grant execute
on function
  extensions.digest(text, text),
  extensions.gen_random_uuid()
to vento_context_freshness_owner;

grant usage
on schema app_private
to vento_ddl_owner;

grant select
on table org_governance.organization_scopes
to vento_context_freshness_owner;

grant execute
on function app_private.resolve_organization_id()
to vento_context_freshness_owner;

create policy
  auth_db_035_freshness_owner_read_organization_scope
on org_governance.organization_scopes
for select
to vento_context_freshness_owner
using (true);

set local role vento_ddl_owner;

grant select
on table
  identity_access.principals,
  identity_access.enterprise_identity_links
to vento_context_freshness_owner;

lock table
  identity_access.principals,
  identity_access.enterprise_identity_links
in share row exclusive mode;

reset role;

set local role vento_access_context_owner;

grant execute
on function
  app_private.get_access_context(text),
  app_private.resolve_access_application(
    text,
    timestamp with time zone
  ),
  app_private.canonicalize_json(jsonb),
  app_private.fingerprint_access_source(jsonb)
to vento_context_freshness_owner;

grant execute
on function app_private.fingerprint_access_source(jsonb)
to postgres;

reset role;

do $auth_db_035_cross_task_execute_closure$
begin
  if not (
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
    )
  ) then
    raise exception using
      errcode = '42501',
      message =
        'AUTH_DB_035_CROSS_TASK_EXECUTE_CLOSURE_MISSING';
  end if;
end
$auth_db_035_cross_task_execute_closure$;

create or replace view
  app_private.context_freshness_auth_sessions
with (
  security_barrier = true
)
as
select
  s.id,
  s.user_id,
  s.updated_at,
  s.aal,
  s.not_after,
  s.refreshed_at,
  s.oauth_client_id,
  s.refresh_token_counter,
  s.scopes
from auth.sessions s;

comment on view
  app_private.context_freshness_auth_sessions is
  'AUTH-DB-035 private managed-Auth session freshness bridge. It exposes only the non-secret session facts required by ContextFreshnessToken@1.0.0.';

revoke all
on table app_private.context_freshness_auth_sessions
from public, anon, authenticated, service_role;

grant select
on table app_private.context_freshness_auth_sessions
to vento_context_freshness_owner;

set local role vento_context_freshness_owner;

alter default privileges
in schema app_private
revoke execute on functions
from public, anon, authenticated, service_role;

alter default privileges
in schema app_private
revoke all on tables
from public, anon, authenticated, service_role;

alter default privileges
in schema audit
revoke all on tables
from public, anon, authenticated, service_role;

create table if not exists
  app_private.context_freshness_generations (
    organization_id uuid not null,
    scope_type text not null,
    scope_key text not null,
    generation bigint not null,
    last_event_id uuid not null,
    created_at timestamptz not null
      default pg_catalog.statement_timestamp(),
    updated_at timestamptz not null
      default pg_catalog.statement_timestamp(),
    schema_version text not null
      default '1.0.0',

    constraint pk_context_freshness_generations
      primary key (
        organization_id,
        scope_type,
        scope_key
      ),

    constraint ck_context_freshness_generation_positive
      check (generation >= 1),

    constraint ck_context_freshness_scope_type
      check (
        scope_type in (
          'ACTOR',
          'EMPLOYEE',
          'BASE_LANE',
          'OPERATIONAL_LANE',
          'DEVICE',
          'APP_AUTHORIZATION',
          'GLOBAL_AUTHORIZATION',
          'SYSTEM_DELEGATION'
        )
      ),

    constraint ck_context_freshness_scope_key
      check (
        pg_catalog.btrim(scope_key) <> ''
      ),

    constraint ck_context_freshness_generation_schema
      check (schema_version = '1.0.0'),

    constraint ck_context_freshness_generation_timestamps
      check (updated_at >= created_at)
  );

create table if not exists
  app_private.context_freshness_bindings (
    binding_id text primary key,
    source_schema text not null,
    source_relation text not null,
    source_kind text not null,
    mutation_ops text[] not null,
    event_type text not null,
    generation_scopes text[] not null,
    scope_strategy text not null,
    enforcement_state text not null,
    owner_task text not null,
    source_contract_key text not null,
    source_shape_fingerprint text not null,
    created_at timestamptz not null
      default pg_catalog.statement_timestamp(),
    updated_at timestamptz not null
      default pg_catalog.statement_timestamp(),

    constraint ck_context_freshness_binding_source_kind
      check (
        source_kind in (
          'TABLE',
          'FUNCTION',
          'UNMATERIALIZED'
        )
      ),

    constraint ck_context_freshness_binding_mutations
      check (
        pg_catalog.cardinality(mutation_ops) > 0
      ),

    constraint ck_context_freshness_binding_event
      check (
        event_type in (
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
        )
      ),

    constraint ck_context_freshness_binding_generation_scopes
      check (
        generation_scopes <@ array[
          'ACTOR',
          'EMPLOYEE',
          'BASE_LANE',
          'OPERATIONAL_LANE',
          'DEVICE',
          'APP_AUTHORIZATION',
          'GLOBAL_AUTHORIZATION',
          'SYSTEM_DELEGATION'
        ]::text[]
        and pg_catalog.cardinality(
          generation_scopes
        ) > 0
      ),

    constraint ck_context_freshness_binding_state
      check (
        enforcement_state in (
          'BOOTSTRAP',
          'ENFORCED',
          'SUPERSEDED',
          'BLOCKED'
        )
      ),

    constraint ck_context_freshness_binding_owner
      check (owner_task = 'AUTH-DB-035'),

    constraint ck_context_freshness_binding_contract_key
      check (
        pg_catalog.btrim(
          source_contract_key
        ) <> ''
      ),

    constraint ck_context_freshness_binding_fingerprint
      check (
        source_shape_fingerprint ~
          '^sha256:[0-9a-f]{64}$'
      ),

    constraint ck_context_freshness_binding_timestamps
      check (updated_at >= created_at)
  );

create unique index if not exists
  ux_context_freshness_bindings_current_contract
on app_private.context_freshness_bindings (
  source_contract_key
)
where enforcement_state <> 'SUPERSEDED';

create index if not exists
  ix_context_freshness_bindings_source
on app_private.context_freshness_bindings (
  source_schema,
  source_relation
);

create index if not exists
  ix_context_freshness_bindings_state
on app_private.context_freshness_bindings (
  enforcement_state
);

create table if not exists
  app_private.context_freshness_runtime (
    runtime_key text primary key,
    environment_code text not null,
    environment_identity text not null,
    schema_version text not null
      default '1.0.0',
    created_at timestamptz not null
      default pg_catalog.statement_timestamp(),
    updated_at timestamptz not null
      default pg_catalog.statement_timestamp(),

    constraint uq_context_freshness_runtime_identity
      unique (environment_identity),

    constraint ck_context_freshness_runtime_key
      check (runtime_key = 'ACTIVE'),

    constraint ck_context_freshness_runtime_environment
      check (
        environment_code ~
          '^[A-Z][A-Z0-9_-]{1,31}$'
      ),

    constraint ck_context_freshness_runtime_identity
      check (
        environment_identity ~
          '^env:[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}$'
      ),

    constraint ck_context_freshness_runtime_schema
      check (schema_version = '1.0.0'),

    constraint ck_context_freshness_runtime_timestamps
      check (updated_at >= created_at)
  );

create table if not exists
  audit.context_invalidation_outbox (
    event_id uuid primary key,
    event_type text not null,
    scope_type text not null,
    scope_ids jsonb not null,
    app_code text,
    organization_id uuid not null,
    subject_key_hash text,
    generation_before jsonb not null,
    generation_after jsonb not null,
    occurred_at timestamptz not null
      default pg_catalog.statement_timestamp(),
    committed_at timestamptz,
    source_transaction_id text not null,
    producer text not null,
    schema_version text not null
      default '1.0.0',
    delivery_status text not null
      default 'PENDING',
    attempt_count integer not null
      default 0,
    last_attempt_at timestamptz,
    last_error_class text,
    delivered_at timestamptz,

    constraint ck_context_invalidation_event_type
      check (
        event_type in (
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
        )
      ),

    constraint ck_context_invalidation_scope_type
      check (
        scope_type in (
          'SESSION',
          'SUBJECT',
          'DEVICE',
          'APP',
          'ORGANIZATION',
          'GLOBAL'
        )
      ),

    constraint ck_context_invalidation_scope_ids
      check (
        pg_catalog.jsonb_typeof(
          scope_ids
        ) = 'object'
      ),

    constraint ck_context_invalidation_generations
      check (
        pg_catalog.jsonb_typeof(
          generation_before
        ) = 'object'
        and pg_catalog.jsonb_typeof(
          generation_after
        ) = 'object'
      ),

    constraint ck_context_invalidation_subject_hash
      check (
        subject_key_hash is null
        or subject_key_hash ~
          '^sha256:[0-9a-f]{64}$'
      ),

    constraint ck_context_invalidation_delivery
      check (
        delivery_status in (
          'PENDING',
          'CLAIMED',
          'DELIVERED',
          'FAILED',
          'DEAD_LETTER'
        )
      ),

    constraint ck_context_invalidation_attempt_count
      check (attempt_count >= 0),

    constraint ck_context_invalidation_schema
      check (schema_version = '1.0.0')
  );

create unique index if not exists
  ux_context_invalidation_bootstrap
on audit.context_invalidation_outbox (
  producer,
  schema_version
)
where producer =
  'AUTH-DB-035::GLOBAL:BOOTSTRAP';

create index if not exists
  ix_context_invalidation_pending
on audit.context_invalidation_outbox (
  occurred_at,
  event_id
)
where delivery_status = 'PENDING';

create index if not exists
  ix_context_invalidation_organization_time
on audit.context_invalidation_outbox (
  organization_id,
  occurred_at
);

create index if not exists
  ix_context_invalidation_app_time
on audit.context_invalidation_outbox (
  app_code,
  occurred_at
)
where app_code is not null;

alter table
  app_private.context_freshness_generations
enable row level security;

alter table
  app_private.context_freshness_bindings
enable row level security;

alter table
  app_private.context_freshness_runtime
enable row level security;

alter table
  audit.context_invalidation_outbox
enable row level security;

revoke all
on table
  app_private.context_freshness_generations,
  app_private.context_freshness_bindings,
  app_private.context_freshness_runtime,
  audit.context_invalidation_outbox
from public, anon, authenticated, service_role;

comment on table
  app_private.context_freshness_generations is
  'AUTH-DB-035 monotonic private context-freshness generations.';

comment on table
  app_private.context_freshness_bindings is
  'AUTH-DB-035 private binding registry for sources that may affect AccessContext.';

comment on table
  app_private.context_freshness_runtime is
  'AUTH-DB-035 one opaque runtime identity per database environment.';

comment on table
  audit.context_invalidation_outbox is
  'AUTH-DB-035 durable transactional invalidation outbox. No automatic purge is installed until an operational retention window is explicitly approved; generation state remains the stale-safety barrier.';

create or replace function
  app_private.context_freshness_source_shape_fingerprint(
    p_source_schema text,
    p_source_relation text,
    p_source_kind text
  )
returns text
language plpgsql
stable
strict
security invoker
set search_path = pg_catalog, app_private
as $function$
declare
  v_relation oid;
  v_procedure oid;
  v_snapshot jsonb;
begin
  if p_source_kind = 'TABLE' then
    v_relation :=
      pg_catalog.to_regclass(
        pg_catalog.format(
          '%I.%I',
          p_source_schema,
          p_source_relation
        )
      );

    if v_relation is null then
      raise exception using
        errcode = '42P01',
        message =
          'AUTH_DB_035_BINDING_RELATION_MISSING';
    end if;

    select pg_catalog.jsonb_build_object(
      'source_kind',
      'TABLE',
      'schema',
      p_source_schema,
      'relation',
      p_source_relation,
      'columns',
      coalesce(
        (
          select pg_catalog.jsonb_agg(
            pg_catalog.jsonb_build_object(
              'name',
              a.attname,
              'type',
              pg_catalog.format_type(
                a.atttypid,
                a.atttypmod
              ),
              'not_null',
              a.attnotnull,
              'default',
              pg_catalog.pg_get_expr(
                d.adbin,
                d.adrelid
              )
            )
            order by a.attnum
          )
          from pg_catalog.pg_attribute a
          left join pg_catalog.pg_attrdef d
            on d.adrelid = a.attrelid
           and d.adnum = a.attnum
          where a.attrelid = v_relation
            and a.attnum > 0
            and not a.attisdropped
        ),
        '[]'::jsonb
      ),
      'constraints',
      coalesce(
        (
          select pg_catalog.jsonb_agg(
            pg_catalog.jsonb_build_object(
              'name',
              c.conname,
              'type',
              c.contype,
              'definition',
              pg_catalog.pg_get_constraintdef(
                c.oid,
                true
              )
            )
            order by c.conname
          )
          from pg_catalog.pg_constraint c
          where c.conrelid = v_relation
        ),
        '[]'::jsonb
      ),
      'triggers',
      coalesce(
        (
          select pg_catalog.jsonb_agg(
            pg_catalog.jsonb_build_object(
              'name',
              t.tgname,
              'definition',
              pg_catalog.pg_get_triggerdef(
                t.oid,
                true
              )
            )
            order by t.tgname
          )
          from pg_catalog.pg_trigger t
          where t.tgrelid = v_relation
            and not t.tgisinternal
        ),
        '[]'::jsonb
      )
    )
    into v_snapshot;

  elsif p_source_kind = 'FUNCTION' then
    v_procedure :=
      pg_catalog.to_regprocedure(
        p_source_schema || '.' ||
        p_source_relation
      );

    if v_procedure is null then
      raise exception using
        errcode = '42883',
        message =
          'AUTH_DB_035_BINDING_FUNCTION_MISSING';
    end if;

    select pg_catalog.jsonb_build_object(
      'source_kind',
      'FUNCTION',
      'schema',
      p_source_schema,
      'relation',
      p_source_relation,
      'definition',
      pg_catalog.pg_get_functiondef(
        v_procedure
      )
    )
    into v_snapshot;

  elsif p_source_kind = 'UNMATERIALIZED' then
    v_snapshot :=
      pg_catalog.jsonb_build_object(
        'source_kind',
        'UNMATERIALIZED',
        'schema',
        p_source_schema,
        'relation',
        p_source_relation,
        'status',
        'NOT_MATERIALIZED'
      );

  else
    raise exception using
      errcode = '22023',
      message =
        'AUTH_DB_035_BINDING_SOURCE_KIND_INVALID';
  end if;

  return app_private.fingerprint_access_source(
    v_snapshot
  );
end;
$function$;

insert into
  app_private.context_freshness_bindings (
    binding_id,
    source_schema,
    source_relation,
    source_kind,
    mutation_ops,
    event_type,
    generation_scopes,
    scope_strategy,
    enforcement_state,
    owner_task,
    source_contract_key,
    source_shape_fingerprint
  )
select
  v.binding_id,
  v.source_schema,
  v.source_relation,
  v.source_kind,
  v.mutation_ops,
  v.event_type,
  v.generation_scopes,
  v.scope_strategy,
  v.enforcement_state,
  'AUTH-DB-035',
  v.source_contract_key,
  app_private.context_freshness_source_shape_fingerprint(
    v.source_schema,
    v.source_relation,
    v.source_kind
  )
from (
  values
    (
      'AUTH-DB-035:application_catalog',
      'app_private',
      'resolve_access_application(text,timestamp with time zone)',
      'FUNCTION',
      array['DDL']::text[],
      'APP_AUTHORIZATION_CHANGED',
      array[
        'APP_AUTHORIZATION',
        'GLOBAL_AUTHORIZATION'
      ]::text[],
      'VERSIONED_MIGRATION',
      'BOOTSTRAP',
      'application_catalog'
    ),
    (
      'AUTH-DB-035:principal_registry',
      'identity_access',
      'principals',
      'TABLE',
      array[
        'INSERT',
        'UPDATE',
        'DELETE'
      ]::text[],
      'DOMAIN_IDENTITY_CHANGED',
      array['ACTOR']::text[],
      'PRINCIPAL_ID',
      'BOOTSTRAP',
      'principal_registry'
    ),
    (
      'AUTH-DB-035:enterprise_identity_links',
      'identity_access',
      'enterprise_identity_links',
      'TABLE',
      array[
        'INSERT',
        'UPDATE',
        'DELETE'
      ]::text[],
      'DOMAIN_IDENTITY_CHANGED',
      array[
        'ACTOR',
        'EMPLOYEE',
        'BASE_LANE',
        'OPERATIONAL_LANE',
        'DEVICE',
        'SYSTEM_DELEGATION'
      ]::text[],
      'IDENTITY_LINK_FANOUT',
      'BOOTSTRAP',
      'enterprise_identity_links'
    ),
    (
      'AUTH-DB-035:domain_identity_policy',
      'app_private',
      'resolve_access_actor(text,timestamp with time zone,jsonb,jsonb)',
      'FUNCTION',
      array['DDL']::text[],
      'DOMAIN_IDENTITY_CHANGED',
      array[
        'ACTOR',
        'GLOBAL_AUTHORIZATION'
      ]::text[],
      'VERSIONED_MIGRATION',
      'BOOTSTRAP',
      'domain_identity_policy'
    ),
    (
      'AUTH-DB-035:actor_resolution_model',
      'app_private',
      'resolve_access_actor(text,timestamp with time zone,jsonb,jsonb)',
      'FUNCTION',
      array['DDL']::text[],
      'ACTOR_ASSIGNMENT_CHANGED',
      array[
        'ACTOR',
        'GLOBAL_AUTHORIZATION'
      ]::text[],
      'VERSIONED_MIGRATION',
      'BOOTSTRAP',
      'actor_resolution_model'
    ),
    (
      'AUTH-DB-035:structural_issue_catalog',
      'app_private',
      'access_context_issue_definition(text,text)',
      'FUNCTION',
      array['DDL']::text[],
      'CONTRACT_VERSION_CHANGED',
      array['GLOBAL_AUTHORIZATION']::text[],
      'VERSIONED_MIGRATION',
      'BOOTSTRAP',
      'structural_issue_catalog'
    ),
    (
      'AUTH-DB-035:employment_model',
      'app_private',
      'employment_model',
      'UNMATERIALIZED',
      array['NONE']::text[],
      'EMPLOYEE_STATUS_CHANGED',
      array[
        'EMPLOYEE',
        'BASE_LANE',
        'OPERATIONAL_LANE'
      ]::text[],
      'UNMATERIALIZED_OWNER_SOURCE',
      'BLOCKED',
      'employment_model'
    ),
    (
      'AUTH-DB-035:role_catalog',
      'app_private',
      'role_catalog',
      'UNMATERIALIZED',
      array['NONE']::text[],
      'BASE_ROLE_CHANGED',
      array[
        'BASE_LANE',
        'GLOBAL_AUTHORIZATION'
      ]::text[],
      'UNMATERIALIZED_OWNER_SOURCE',
      'BLOCKED',
      'role_catalog'
    ),
    (
      'AUTH-DB-035:site_catalog',
      'app_private',
      'site_catalog',
      'UNMATERIALIZED',
      array['NONE']::text[],
      'ASSIGNED_SITE_CHANGED',
      array['BASE_LANE']::text[],
      'UNMATERIALIZED_OWNER_SOURCE',
      'BLOCKED',
      'site_catalog'
    ),
    (
      'AUTH-DB-035:area_catalog',
      'app_private',
      'area_catalog',
      'UNMATERIALIZED',
      array['NONE']::text[],
      'ASSIGNED_AREA_CHANGED',
      array['BASE_LANE']::text[],
      'UNMATERIALIZED_OWNER_SOURCE',
      'BLOCKED',
      'area_catalog'
    ),
    (
      'AUTH-DB-035:administrative_coverage_policy',
      'app_private',
      'administrative_coverage_policy',
      'UNMATERIALIZED',
      array['NONE']::text[],
      'ADMINISTRATIVE_COVERAGE_CHANGED',
      array['BASE_LANE']::text[],
      'UNMATERIALIZED_OWNER_SOURCE',
      'BLOCKED',
      'administrative_coverage_policy'
    ),
    (
      'AUTH-DB-035:shift_model',
      'app_private',
      'shift_model',
      'UNMATERIALIZED',
      array['NONE']::text[],
      'SHIFT_CHANGED',
      array['OPERATIONAL_LANE']::text[],
      'UNMATERIALIZED_OWNER_SOURCE',
      'BLOCKED',
      'shift_model'
    ),
    (
      'AUTH-DB-035:checkin_model',
      'app_private',
      'checkin_model',
      'UNMATERIALIZED',
      array['NONE']::text[],
      'CHECKIN_SESSION_CHANGED',
      array['OPERATIONAL_LANE']::text[],
      'UNMATERIALIZED_OWNER_SOURCE',
      'BLOCKED',
      'checkin_model'
    ),
    (
      'AUTH-DB-035:device_model',
      'app_private',
      'device_model',
      'UNMATERIALIZED',
      array['NONE']::text[],
      'DEVICE_CHANGED',
      array['DEVICE']::text[],
      'UNMATERIALIZED_OWNER_SOURCE',
      'BLOCKED',
      'device_model'
    ),
    (
      'AUTH-DB-035:actor_session_model',
      'app_private',
      'actor_session_model',
      'UNMATERIALIZED',
      array['NONE']::text[],
      'DEVICE_ACTOR_SESSION_CHANGED',
      array[
        'DEVICE',
        'ACTOR'
      ]::text[],
      'UNMATERIALIZED_OWNER_SOURCE',
      'BLOCKED',
      'actor_session_model'
    )
) v(
  binding_id,
  source_schema,
  source_relation,
  source_kind,
  mutation_ops,
  event_type,
  generation_scopes,
  scope_strategy,
  enforcement_state,
  source_contract_key
)
where true
on conflict (binding_id)
do nothing;

do $auth_db_035_backfill$
declare
  v_organization_id uuid;
  v_event_id uuid;
begin
  v_organization_id :=
    app_private.resolve_organization_id();

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
  select
    extensions.gen_random_uuid(),
    'CONTRACT_VERSION_CHANGED',
    'GLOBAL',
    pg_catalog.jsonb_build_object(
      'GLOBAL_AUTHORIZATION',
      pg_catalog.jsonb_build_array(
        'GLOBAL'
      )
    ),
    null,
    v_organization_id,
    null,
    '{}'::jsonb,
    pg_catalog.jsonb_build_object(
      'bootstrap_generation',
      1
    ),
    pg_catalog.statement_timestamp(),
    null,
    pg_catalog.pg_current_xact_id()::text,
    'AUTH-DB-035::GLOBAL:BOOTSTRAP',
    '1.0.0',
    'PENDING',
    0
  where not exists (
    select 1
    from audit.context_invalidation_outbox o
    where o.producer =
      'AUTH-DB-035::GLOBAL:BOOTSTRAP'
      and o.schema_version = '1.0.0'
  )
  on conflict do nothing;

  select o.event_id
  into strict v_event_id
  from audit.context_invalidation_outbox o
  where o.producer =
    'AUTH-DB-035::GLOBAL:BOOTSTRAP'
    and o.schema_version = '1.0.0';

  insert into app_private.context_freshness_generations (
    organization_id,
    scope_type,
    scope_key,
    generation,
    last_event_id,
    schema_version
  )
  values (
    v_organization_id,
    'GLOBAL_AUTHORIZATION',
    'GLOBAL',
    1,
    v_event_id,
    '1.0.0'
  )
  on conflict (
    organization_id,
    scope_type,
    scope_key
  )
  do nothing;

  insert into app_private.context_freshness_generations (
    organization_id,
    scope_type,
    scope_key,
    generation,
    last_event_id,
    schema_version
  )
  select
    v_organization_id,
    'APP_AUTHORIZATION',
    app_code,
    1,
    v_event_id,
    '1.0.0'
  from (
    values
      ('shell'),
      ('anima'),
      ('viso'),
      ('nexo'),
      ('fogo'),
      ('origo'),
      ('pulso'),
      ('numera'),
      ('aura'),
      ('pass')
  ) apps(app_code)
  where true
  on conflict (
    organization_id,
    scope_type,
    scope_key
  )
  do nothing;

  insert into app_private.context_freshness_generations (
    organization_id,
    scope_type,
    scope_key,
    generation,
    last_event_id,
    schema_version
  )
  select
    v_organization_id,
    'ACTOR',
    p.id::text,
    1,
    v_event_id,
    '1.0.0'
  from identity_access.principals p
  where true
  on conflict (
    organization_id,
    scope_type,
    scope_key
  )
  do nothing;

  insert into app_private.context_freshness_generations (
    organization_id,
    scope_type,
    scope_key,
    generation,
    last_event_id,
    schema_version
  )
  select distinct
    v_organization_id,
    s.scope_type,
    l.enterprise_identity_id::text,
    1,
    v_event_id,
    '1.0.0'
  from identity_access.enterprise_identity_links l
  cross join lateral (
    values
      ('EMPLOYEE'),
      ('BASE_LANE'),
      ('OPERATIONAL_LANE')
  ) s(scope_type)
  where l.enterprise_identity_kind = 'EMPLOYEE'
    and l.link_state = 'ACTIVE'
  on conflict (
    organization_id,
    scope_type,
    scope_key
  )
  do nothing;

  insert into app_private.context_freshness_generations (
    organization_id,
    scope_type,
    scope_key,
    generation,
    last_event_id,
    schema_version
  )
  select distinct
    v_organization_id,
    'DEVICE',
    l.enterprise_identity_id::text,
    1,
    v_event_id,
    '1.0.0'
  from identity_access.enterprise_identity_links l
  where l.enterprise_identity_kind = 'DEVICE'
    and l.link_state = 'ACTIVE'
  on conflict (
    organization_id,
    scope_type,
    scope_key
  )
  do nothing;

  insert into app_private.context_freshness_generations (
    organization_id,
    scope_type,
    scope_key,
    generation,
    last_event_id,
    schema_version
  )
  select distinct
    v_organization_id,
    'SYSTEM_DELEGATION',
    l.enterprise_identity_id::text,
    1,
    v_event_id,
    '1.0.0'
  from identity_access.enterprise_identity_links l
  where l.enterprise_identity_kind = 'SYSTEM_ACTOR'
    and l.link_state = 'ACTIVE'
  on conflict (
    organization_id,
    scope_type,
    scope_key
  )
  do nothing;
end
$auth_db_035_backfill$;

create or replace function
  app_private.fingerprint_context_freshness_generation(
    p_organization_id uuid,
    p_scope_type text,
    p_scope_key text,
    p_generation bigint
  )
returns text
language sql
immutable
strict
security invoker
set search_path = pg_catalog, app_private
as $function$
  select app_private.fingerprint_access_source(
    pg_catalog.jsonb_build_object(
      'contract_version',
      '1.0.0',
      'organization_id',
      p_organization_id::text,
      'scope_type',
      p_scope_type,
      'scope_key',
      p_scope_key,
      'generation',
      p_generation
    )
  );
$function$;

create or replace function
  app_private.bootstrap_context_freshness_runtime(
    p_environment_code text
  )
returns jsonb
language plpgsql
volatile
security definer
set search_path = pg_catalog, app_private
as $function$
declare
  v_count bigint;
  v_identity text;
  v_existing_code text;
begin
  if p_environment_code is null
     or p_environment_code <>
       pg_catalog.btrim(
         p_environment_code
       )
     or p_environment_code !~
       '^[A-Z][A-Z0-9_-]{1,31}$' then
    raise exception using
      errcode = '22023',
      message =
        'AUTH_DB_035_ENVIRONMENT_CODE_INVALID';
  end if;

  lock table
    app_private.context_freshness_runtime
  in exclusive mode;

  select count(*)
  into v_count
  from app_private.context_freshness_runtime
  where runtime_key = 'ACTIVE';

  if v_count = 0 then
    v_identity :=
      'env:' ||
      extensions.gen_random_uuid()::text;

    insert into app_private.context_freshness_runtime (
      runtime_key,
      environment_code,
      environment_identity,
      schema_version
    )
    values (
      'ACTIVE',
      p_environment_code,
      v_identity,
      '1.0.0'
    );

  elsif v_count = 1 then
    select
      environment_code,
      environment_identity
    into
      v_existing_code,
      v_identity
    from app_private.context_freshness_runtime
    where runtime_key = 'ACTIVE'
    for update;

    if v_existing_code <>
       p_environment_code then
      raise exception using
        errcode = '22023',
        message =
          'AUTH_DB_035_ENVIRONMENT_IDENTITY_CONFLICT';
    end if;

  else
    raise exception using
      errcode = 'P0001',
      message =
        'AUTH_DB_035_RUNTIME_AMBIGUOUS';
  end if;

  return pg_catalog.jsonb_build_object(
    'runtime_key',
    'ACTIVE',
    'environment_code',
    p_environment_code,
    'environment_identity',
    v_identity,
    'schema_version',
    '1.0.0'
  );
end;
$function$;

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
        pg_catalog.statement_timestamp(),
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

create or replace function
  app_private.resolve_context_temporal_boundary(
    p_app_code text
  )
returns timestamptz
language plpgsql
stable
security definer
set search_path = pg_catalog, app_private
as $function$
declare
  v_now timestamptz :=
    pg_catalog.statement_timestamp();
  v_application jsonb;
  v_context jsonb;
  v_subject uuid;
  v_session_id uuid;
  v_session_user_id uuid;
  v_session_not_after timestamptz;
  v_claims jsonb := '{}'::jsonb;
  v_claims_text text;
  v_exp_text text;
  v_access_token_expiry timestamptz;
  v_boundary timestamptz;
begin
  if p_app_code is null
     or p_app_code = ''
     or p_app_code <>
       pg_catalog.btrim(p_app_code) then
    raise exception using
      errcode = '22023',
      message =
        'AUTH_DB_035_APPLICATION_CODE_INVALID';
  end if;

  v_application :=
    app_private.resolve_access_application(
      p_app_code,
      v_now
    );

  if coalesce(
       (
         v_application ->> 'valid'
       )::boolean,
       false
     ) is not true then
    raise exception using
      errcode = '22023',
      message =
        'AUTH_DB_035_APPLICATION_UNKNOWN';
  end if;

  v_context :=
    app_private.get_access_context(
      p_app_code
    );

  begin
    v_subject :=
      (
        v_context #>>
          '{principal,auth_user_id}'
      )::uuid;

    v_session_id :=
      (
        v_context #>>
          '{principal,session_id}'
      )::uuid;
  exception
    when invalid_text_representation then
      raise exception using
        errcode = 'P0001',
        message =
          'AUTH_DB_035_SESSION_MISSING';
  end;

  if v_subject is null
     or v_session_id is null then
    raise exception using
      errcode = 'P0001',
      message =
        'AUTH_DB_035_SESSION_MISSING';
  end if;

  select
    s.user_id,
    s.not_after
  into
    v_session_user_id,
    v_session_not_after
  from app_private.context_freshness_auth_sessions s
  where s.id = v_session_id;

  if not found then
    raise exception using
      errcode = 'P0001',
      message =
        'AUTH_DB_035_SESSION_MISSING';
  end if;

  if v_session_user_id <>
     v_subject then
    raise exception using
      errcode = 'P0001',
      message =
        'AUTH_DB_035_SESSION_PRINCIPAL_MISMATCH';
  end if;

  v_claims_text :=
    nullif(
      pg_catalog.current_setting(
        'request.jwt.claims',
        true
      ),
      ''
    );

  if v_claims_text is not null then
    begin
      v_claims := v_claims_text::jsonb;
    exception when others then
      v_claims := '{}'::jsonb;
    end;
  end if;

  v_exp_text := coalesce(
    nullif(
      pg_catalog.current_setting(
        'request.jwt.claim.exp',
        true
      ),
      ''
    ),
    nullif(
      v_claims ->> 'exp',
      ''
    )
  );

  if v_exp_text is null
     or v_exp_text !~
       '^[0-9]+(?:\.[0-9]+)?$' then
    raise exception using
      errcode = 'P0001',
      message =
        'AUTH_DB_035_ACCESS_TOKEN_EXPIRY_MISSING';
  end if;

  v_access_token_expiry :=
    pg_catalog.to_timestamp(
      v_exp_text::double precision
    );

  if v_access_token_expiry <= v_now then
    raise exception using
      errcode = 'P0001',
      message =
        'AUTH_DB_035_ACCESS_TOKEN_EXPIRED';
  end if;

  if v_session_not_after is not null
     and v_session_not_after <= v_now then
    raise exception using
      errcode = 'P0001',
      message =
        'AUTH_DB_035_SESSION_EXPIRED';
  end if;

  select min(boundary)
  into v_boundary
  from (
    values
      (v_access_token_expiry),
      (v_session_not_after)
  ) b(boundary)
  where boundary is not null;

  if v_boundary is null then
    raise exception using
      errcode = 'P0001',
      message =
        'AUTH_DB_035_TEMPORAL_BOUNDARY_MISSING';
  end if;

  return v_boundary;
end;
$function$;

create or replace function
  app_private.get_context_freshness_token(
    p_app_code text
  )
returns jsonb
language plpgsql
stable
security definer
set search_path = pg_catalog, app_private
as $function$
declare
  v_now timestamptz :=
    pg_catalog.statement_timestamp();
  v_application jsonb;
  v_context jsonb;
  v_organization_id uuid;
  v_runtime_count bigint;
  v_environment_identity text;
  v_subject uuid;
  v_session_id uuid;
  v_session_user_id uuid;
  v_session_updated_at timestamptz;
  v_session_aal text;
  v_session_not_after timestamptz;
  v_session_refreshed_at timestamp;
  v_session_oauth_client_id uuid;
  v_session_refresh_counter bigint;
  v_session_scopes text;
  v_session_generation text;
  v_principal_id uuid;
  v_principal_kind text;
  v_principal_count bigint;
  v_actor_type text;
  v_actor_id text;
  v_actor_raw bigint;
  v_actor_generation text;
  v_employee_raw bigint;
  v_employee_generation text :=
    'NOT_APPLICABLE';
  v_base_raw bigint;
  v_base_generation text :=
    'NOT_APPLICABLE';
  v_operational_raw bigint;
  v_operational_generation text :=
    'NOT_APPLICABLE';
  v_device_id uuid;
  v_device_raw bigint;
  v_device_generation text :=
    'NOT_APPLICABLE';
  v_system_id uuid;
  v_system_raw bigint;
  v_system_generation text;
  v_app_raw bigint;
  v_app_generation text;
  v_global_raw bigint;
  v_global_generation text;
  v_boundary timestamptz;
  v_subject_key text;
  v_preimage jsonb;
  v_token_fingerprint text;
  v_issued_at_text text;
  v_boundary_text text;
begin
  if p_app_code is null
     or p_app_code = ''
     or p_app_code <>
       pg_catalog.btrim(p_app_code) then
    raise exception using
      errcode = '22023',
      message =
        'AUTH_DB_035_APPLICATION_CODE_INVALID';
  end if;

  v_application :=
    app_private.resolve_access_application(
      p_app_code,
      v_now
    );

  if coalesce(
       (
         v_application ->> 'valid'
       )::boolean,
       false
     ) is not true then
    raise exception using
      errcode = '22023',
      message =
        'AUTH_DB_035_APPLICATION_UNKNOWN';
  end if;

  select count(*)
  into v_runtime_count
  from app_private.context_freshness_runtime
  where runtime_key = 'ACTIVE';

  if v_runtime_count = 0 then
    raise exception using
      errcode = 'P0001',
      message =
        'AUTH_DB_035_RUNTIME_MISSING';

  elsif v_runtime_count > 1 then
    raise exception using
      errcode = 'P0001',
      message =
        'AUTH_DB_035_RUNTIME_AMBIGUOUS';
  end if;

  select environment_identity
  into v_environment_identity
  from app_private.context_freshness_runtime
  where runtime_key = 'ACTIVE';

  v_organization_id :=
    app_private.resolve_organization_id();

  v_context :=
    app_private.get_access_context(
      p_app_code
    );

  if exists (
    select 1
    from pg_catalog.jsonb_array_elements(
      coalesce(
        v_context -> 'structural_issues',
        '[]'::jsonb
      )
    ) issue(value)
    where issue.value ->> 'severity'
      in (
        'BLOCKING_ALL',
        'BLOCKING_BASE',
        'BLOCKING_OPERATIONAL'
      )
  ) then
    raise exception using
      errcode = 'P0001',
      message =
        'AUTH_DB_035_CONTEXT_NOT_FRESHNESS_ELIGIBLE';
  end if;

  if coalesce(
       (
         v_context #>>
           '{principal,authenticated}'
       )::boolean,
       false
     ) is not true
     or v_context #>>
       '{principal,principal_status}'
       <> 'VALID'
     or coalesce(
       (
         v_context #>>
           '{actor_effective,resolved}'
       )::boolean,
       false
     ) is not true then
    raise exception using
      errcode = 'P0001',
      message =
        'AUTH_DB_035_ACTOR_UNRESOLVED';
  end if;

  begin
    v_subject :=
      (
        v_context #>>
          '{principal,auth_user_id}'
      )::uuid;

    v_session_id :=
      (
        v_context #>>
          '{principal,session_id}'
      )::uuid;
  exception
    when invalid_text_representation then
      raise exception using
        errcode = 'P0001',
        message =
          'AUTH_DB_035_SESSION_MISSING';
  end;

  if v_subject is null
     or v_session_id is null then
    raise exception using
      errcode = 'P0001',
      message =
        'AUTH_DB_035_SESSION_MISSING';
  end if;

  select
    s.user_id,
    s.updated_at,
    s.aal::text,
    s.not_after,
    s.refreshed_at,
    s.oauth_client_id,
    s.refresh_token_counter,
    s.scopes
  into
    v_session_user_id,
    v_session_updated_at,
    v_session_aal,
    v_session_not_after,
    v_session_refreshed_at,
    v_session_oauth_client_id,
    v_session_refresh_counter,
    v_session_scopes
  from app_private.context_freshness_auth_sessions s
  where s.id = v_session_id;

  if not found then
    raise exception using
      errcode = 'P0001',
      message =
        'AUTH_DB_035_SESSION_MISSING';
  end if;

  if v_session_user_id <>
     v_subject then
    raise exception using
      errcode = 'P0001',
      message =
        'AUTH_DB_035_SESSION_PRINCIPAL_MISMATCH';
  end if;

  v_session_generation :=
    app_private.fingerprint_access_source(
      pg_catalog.jsonb_build_object(
        'session_id',
        v_session_id::text,
        'user_id',
        v_session_user_id::text,
        'updated_at',
        v_session_updated_at,
        'not_after',
        v_session_not_after,
        'aal',
        v_session_aal,
        'refreshed_at',
        v_session_refreshed_at,
        'oauth_client_id',
        v_session_oauth_client_id,
        'refresh_token_counter',
        v_session_refresh_counter,
        'scopes',
        v_session_scopes
      )
    );

  select count(*)
  into v_principal_count
  from identity_access.principals p
  where p.auth_subject_id = v_subject;

  if v_principal_count <> 1 then
    raise exception using
      errcode = 'P0001',
      message =
        'AUTH_DB_035_PRINCIPAL_AMBIGUOUS';
  end if;

  select
    p.id,
    p.principal_kind
  into
    v_principal_id,
    v_principal_kind
  from identity_access.principals p
  where p.auth_subject_id = v_subject;

  select g.generation
  into v_actor_raw
  from app_private.context_freshness_generations g
  where g.organization_id =
      v_organization_id
    and g.scope_type = 'ACTOR'
    and g.scope_key =
      v_principal_id::text;

  if not found then
    raise exception using
      errcode = 'P0001',
      message =
        'AUTH_DB_035_GENERATION_MISSING';
  end if;

  v_actor_generation :=
    app_private.fingerprint_context_freshness_generation(
      v_organization_id,
      'ACTOR',
      v_principal_id::text,
      v_actor_raw
    );

  v_actor_type :=
    v_context #>>
      '{actor_effective,actor_type}';

  v_actor_id :=
    v_context #>>
      '{actor_effective,actor_id}';

  if v_actor_type = 'EMPLOYEE' then
    if v_actor_id is null then
      raise exception using
        errcode = 'P0001',
        message =
          'AUTH_DB_035_GENERATION_MISSING';
    end if;

    select generation
    into v_employee_raw
    from app_private.context_freshness_generations
    where organization_id =
        v_organization_id
      and scope_type = 'EMPLOYEE'
      and scope_key = v_actor_id;

    if not found then
      raise exception using
        errcode = 'P0001',
        message =
          'AUTH_DB_035_GENERATION_MISSING';
    end if;

    select generation
    into v_base_raw
    from app_private.context_freshness_generations
    where organization_id =
        v_organization_id
      and scope_type = 'BASE_LANE'
      and scope_key = v_actor_id;

    if not found then
      raise exception using
        errcode = 'P0001',
        message =
          'AUTH_DB_035_GENERATION_MISSING';
    end if;

    select generation
    into v_operational_raw
    from app_private.context_freshness_generations
    where organization_id =
        v_organization_id
      and scope_type =
        'OPERATIONAL_LANE'
      and scope_key = v_actor_id;

    if not found then
      raise exception using
        errcode = 'P0001',
        message =
          'AUTH_DB_035_GENERATION_MISSING';
    end if;

    v_employee_generation :=
      app_private.fingerprint_context_freshness_generation(
        v_organization_id,
        'EMPLOYEE',
        v_actor_id,
        v_employee_raw
      );

    v_base_generation :=
      app_private.fingerprint_context_freshness_generation(
        v_organization_id,
        'BASE_LANE',
        v_actor_id,
        v_base_raw
      );

    v_operational_generation :=
      app_private.fingerprint_context_freshness_generation(
        v_organization_id,
        'OPERATIONAL_LANE',
        v_actor_id,
        v_operational_raw
      );
  end if;

  if v_principal_kind =
       'SHARED_DEVICE' then
    select l.enterprise_identity_id
    into v_device_id
    from identity_access.enterprise_identity_links l
    where l.principal_id = v_principal_id
      and l.enterprise_identity_kind =
        'DEVICE'
      and l.link_state = 'ACTIVE';

    if not found then
      raise exception using
        errcode = 'P0001',
        message =
          'AUTH_DB_035_GENERATION_MISSING';
    end if;

    select generation
    into v_device_raw
    from app_private.context_freshness_generations
    where organization_id =
        v_organization_id
      and scope_type = 'DEVICE'
      and scope_key =
        v_device_id::text;

    if not found then
      raise exception using
        errcode = 'P0001',
        message =
          'AUTH_DB_035_GENERATION_MISSING';
    end if;

    v_device_generation :=
      app_private.fingerprint_context_freshness_generation(
        v_organization_id,
        'DEVICE',
        v_device_id::text,
        v_device_raw
      );
  end if;

  if v_actor_type = 'SYSTEM' then
    select l.enterprise_identity_id
    into v_system_id
    from identity_access.enterprise_identity_links l
    where l.principal_id = v_principal_id
      and l.enterprise_identity_kind =
        'SYSTEM_ACTOR'
      and l.link_state = 'ACTIVE';

    if not found then
      raise exception using
        errcode = 'P0001',
        message =
          'AUTH_DB_035_GENERATION_MISSING';
    end if;

    select generation
    into v_system_raw
    from app_private.context_freshness_generations
    where organization_id =
        v_organization_id
      and scope_type =
        'SYSTEM_DELEGATION'
      and scope_key =
        v_system_id::text;

    if not found then
      raise exception using
        errcode = 'P0001',
        message =
          'AUTH_DB_035_GENERATION_MISSING';
    end if;

    v_system_generation :=
      app_private.fingerprint_context_freshness_generation(
        v_organization_id,
        'SYSTEM_DELEGATION',
        v_system_id::text,
        v_system_raw
      );

    v_actor_generation :=
      app_private.fingerprint_access_source(
        pg_catalog.jsonb_build_object(
          'actor_generation',
          v_actor_generation,
          'system_delegation_generation',
          v_system_generation
        )
      );
  end if;

  select generation
  into v_app_raw
  from app_private.context_freshness_generations
  where organization_id =
      v_organization_id
    and scope_type =
      'APP_AUTHORIZATION'
    and scope_key = p_app_code;

  if not found then
    raise exception using
      errcode = 'P0001',
      message =
        'AUTH_DB_035_GENERATION_MISSING';
  end if;

  v_app_generation :=
    app_private.fingerprint_context_freshness_generation(
      v_organization_id,
      'APP_AUTHORIZATION',
      p_app_code,
      v_app_raw
    );

  select generation
  into v_global_raw
  from app_private.context_freshness_generations
  where organization_id =
      v_organization_id
    and scope_type =
      'GLOBAL_AUTHORIZATION'
    and scope_key = 'GLOBAL';

  if not found then
    raise exception using
      errcode = 'P0001',
      message =
        'AUTH_DB_035_GENERATION_MISSING';
  end if;

  v_global_generation :=
    app_private.fingerprint_context_freshness_generation(
      v_organization_id,
      'GLOBAL_AUTHORIZATION',
      'GLOBAL',
      v_global_raw
    );

  v_boundary :=
    app_private.resolve_context_temporal_boundary(
      p_app_code
    );

  v_issued_at_text :=
    pg_catalog.to_char(
      v_now at time zone 'UTC',
      'YYYY-MM-DD"T"HH24:MI:SS.US"Z"'
    );

  v_boundary_text :=
    pg_catalog.to_char(
      v_boundary at time zone 'UTC',
      'YYYY-MM-DD"T"HH24:MI:SS.US"Z"'
    );

  v_subject_key :=
    app_private.fingerprint_access_source(
      pg_catalog.jsonb_strip_nulls(
        pg_catalog.jsonb_build_object(
          'environment',
          v_environment_identity,
          'organization_id',
          v_organization_id::text,
          'app_code',
          p_app_code,
          'principal_type',
          v_context #>>
            '{principal,principal_type}',
          'principal_id',
          v_principal_id::text,
          'auth_session_id',
          v_session_id::text,
          'actor_session_id',
          null,
          'system_process_id',
          case
            when v_actor_type = 'SYSTEM'
              then v_actor_id
            else null
          end,
          'effective_actor_identity',
          v_context ->
            'actor_effective'
        )
      )
    );

  v_preimage :=
    pg_catalog.jsonb_build_object(
      'contract_name',
      'ContextFreshnessToken',
      'contract_version',
      '1.0.0',
      'environment',
      v_environment_identity,
      'organization_id',
      v_organization_id::text,
      'app_code',
      p_app_code,
      'subject_key',
      v_subject_key,
      'session_generation',
      v_session_generation,
      'actor_generation',
      v_actor_generation,
      'employee_generation',
      v_employee_generation,
      'base_lane_generation',
      v_base_generation,
      'operational_lane_generation',
      v_operational_generation,
      'device_generation',
      v_device_generation,
      'app_authorization_generation',
      v_app_generation,
      'global_authorization_generation',
      v_global_generation,
      'next_temporal_boundary_at',
      v_boundary_text
    );

  v_token_fingerprint :=
    app_private.fingerprint_access_source(
      v_preimage
    );

  return
    v_preimage ||
    pg_catalog.jsonb_build_object(
      'issued_at',
      v_issued_at_text,
      'token_fingerprint',
      v_token_fingerprint
    );
end;
$function$;

create or replace function
  app_private.trigger_context_freshness_principals()
returns trigger
language plpgsql
volatile
security definer
set search_path = pg_catalog, app_private
as $function$
declare
  v_actor_ids text[];
begin
  if tg_op = 'INSERT' then
    select pg_catalog.array_agg(
      distinct id::text
      order by id::text
    )
    into v_actor_ids
    from auth_db_035_new_rows;

  elsif tg_op = 'UPDATE' then
    select pg_catalog.array_agg(
      distinct id
      order by id
    )
    into v_actor_ids
    from (
      select id::text
      from auth_db_035_old_rows

      union

      select id::text
      from auth_db_035_new_rows
    ) changed;

  elsif tg_op = 'DELETE' then
    select pg_catalog.array_agg(
      distinct id::text
      order by id::text
    )
    into v_actor_ids
    from auth_db_035_old_rows;
  end if;

  if v_actor_ids is null
     or pg_catalog.cardinality(
       v_actor_ids
     ) = 0 then
    return null;
  end if;

  perform app_private.bump_context_freshness(
    pg_catalog.jsonb_build_object(
      'organization_id',
      app_private.resolve_organization_id(),
      'event_type',
      'DOMAIN_IDENTITY_CHANGED',
      'generation_scopes',
      pg_catalog.jsonb_build_array(
        'ACTOR'
      ),
      'scope_ids',
      pg_catalog.jsonb_build_object(
        'ACTOR',
        pg_catalog.to_jsonb(
          v_actor_ids
        )
      ),
      'app_code',
      null,
      'subject_key_hash',
      null,
      'producer',
      'AUTH-DB-035:principal_registry',
      'schema_version',
      '1.0.0'
    )
  );

  return null;
end;
$function$;

create or replace function
  app_private.trigger_context_freshness_identity_links()
returns trigger
language plpgsql
volatile
security definer
set search_path = pg_catalog, app_private
as $function$
declare
  v_actor_ids text[];
  v_employee_ids text[];
  v_device_ids text[];
  v_system_ids text[];
  v_generation_scopes jsonb :=
    '[]'::jsonb;
  v_scope_ids jsonb :=
    '{}'::jsonb;
begin
  if tg_op = 'INSERT' then
    select
      pg_catalog.array_agg(
        distinct principal_id::text
        order by principal_id::text
      ),
      pg_catalog.array_agg(
        distinct enterprise_identity_id::text
        order by enterprise_identity_id::text
      ) filter (
        where enterprise_identity_kind =
          'EMPLOYEE'
      ),
      pg_catalog.array_agg(
        distinct enterprise_identity_id::text
        order by enterprise_identity_id::text
      ) filter (
        where enterprise_identity_kind =
          'DEVICE'
      ),
      pg_catalog.array_agg(
        distinct enterprise_identity_id::text
        order by enterprise_identity_id::text
      ) filter (
        where enterprise_identity_kind =
          'SYSTEM_ACTOR'
      )
    into
      v_actor_ids,
      v_employee_ids,
      v_device_ids,
      v_system_ids
    from auth_db_035_new_rows;

  elsif tg_op = 'UPDATE' then
    select
      pg_catalog.array_agg(
        distinct principal_id
        order by principal_id
      ),
      pg_catalog.array_agg(
        distinct enterprise_identity_id
        order by enterprise_identity_id
      ) filter (
        where enterprise_identity_kind =
          'EMPLOYEE'
      ),
      pg_catalog.array_agg(
        distinct enterprise_identity_id
        order by enterprise_identity_id
      ) filter (
        where enterprise_identity_kind =
          'DEVICE'
      ),
      pg_catalog.array_agg(
        distinct enterprise_identity_id
        order by enterprise_identity_id
      ) filter (
        where enterprise_identity_kind =
          'SYSTEM_ACTOR'
      )
    into
      v_actor_ids,
      v_employee_ids,
      v_device_ids,
      v_system_ids
    from (
      select
        principal_id::text
          as principal_id,
        enterprise_identity_kind,
        enterprise_identity_id::text
          as enterprise_identity_id
      from auth_db_035_old_rows

      union

      select
        principal_id::text,
        enterprise_identity_kind,
        enterprise_identity_id::text
      from auth_db_035_new_rows
    ) changed;

  elsif tg_op = 'DELETE' then
    select
      pg_catalog.array_agg(
        distinct principal_id::text
        order by principal_id::text
      ),
      pg_catalog.array_agg(
        distinct enterprise_identity_id::text
        order by enterprise_identity_id::text
      ) filter (
        where enterprise_identity_kind =
          'EMPLOYEE'
      ),
      pg_catalog.array_agg(
        distinct enterprise_identity_id::text
        order by enterprise_identity_id::text
      ) filter (
        where enterprise_identity_kind =
          'DEVICE'
      ),
      pg_catalog.array_agg(
        distinct enterprise_identity_id::text
        order by enterprise_identity_id::text
      ) filter (
        where enterprise_identity_kind =
          'SYSTEM_ACTOR'
      )
    into
      v_actor_ids,
      v_employee_ids,
      v_device_ids,
      v_system_ids
    from auth_db_035_old_rows;
  end if;

  if v_actor_ids is not null
     and pg_catalog.cardinality(
       v_actor_ids
     ) > 0 then
    v_generation_scopes :=
      v_generation_scopes ||
      pg_catalog.jsonb_build_array(
        'ACTOR'
      );

    v_scope_ids :=
      v_scope_ids ||
      pg_catalog.jsonb_build_object(
        'ACTOR',
        pg_catalog.to_jsonb(
          v_actor_ids
        )
      );
  end if;

  if v_employee_ids is not null
     and pg_catalog.cardinality(
       v_employee_ids
     ) > 0 then
    v_generation_scopes :=
      v_generation_scopes ||
      pg_catalog.jsonb_build_array(
        'EMPLOYEE',
        'BASE_LANE',
        'OPERATIONAL_LANE'
      );

    v_scope_ids :=
      v_scope_ids ||
      pg_catalog.jsonb_build_object(
        'EMPLOYEE',
        pg_catalog.to_jsonb(
          v_employee_ids
        ),
        'BASE_LANE',
        pg_catalog.to_jsonb(
          v_employee_ids
        ),
        'OPERATIONAL_LANE',
        pg_catalog.to_jsonb(
          v_employee_ids
        )
      );
  end if;

  if v_device_ids is not null
     and pg_catalog.cardinality(
       v_device_ids
     ) > 0 then
    v_generation_scopes :=
      v_generation_scopes ||
      pg_catalog.jsonb_build_array(
        'DEVICE'
      );

    v_scope_ids :=
      v_scope_ids ||
      pg_catalog.jsonb_build_object(
        'DEVICE',
        pg_catalog.to_jsonb(
          v_device_ids
        )
      );
  end if;

  if v_system_ids is not null
     and pg_catalog.cardinality(
       v_system_ids
     ) > 0 then
    v_generation_scopes :=
      v_generation_scopes ||
      pg_catalog.jsonb_build_array(
        'SYSTEM_DELEGATION'
      );

    v_scope_ids :=
      v_scope_ids ||
      pg_catalog.jsonb_build_object(
        'SYSTEM_DELEGATION',
        pg_catalog.to_jsonb(
          v_system_ids
        )
      );
  end if;

  if pg_catalog.jsonb_array_length(
       v_generation_scopes
     ) = 0 then
    return null;
  end if;

  perform app_private.bump_context_freshness(
    pg_catalog.jsonb_build_object(
      'organization_id',
      app_private.resolve_organization_id(),
      'event_type',
      'DOMAIN_IDENTITY_CHANGED',
      'generation_scopes',
      v_generation_scopes,
      'scope_ids',
      v_scope_ids,
      'app_code',
      null,
      'subject_key_hash',
      null,
      'producer',
      'AUTH-DB-035:enterprise_identity_links',
      'schema_version',
      '1.0.0'
    )
  );

  return null;
end;
$function$;

comment on function
  app_private.context_freshness_source_shape_fingerprint(
    text,
    text,
    text
  ) is
  'AUTH-DB-035 source-shape fingerprint using the canonical AUTH-DB-033 JSON fingerprint implementation.';

comment on function
  app_private.fingerprint_context_freshness_generation(
    uuid,
    text,
    text,
    bigint
  ) is
  'AUTH-DB-035 one-way serialization for internal bigint generations.';

comment on function
  app_private.bootstrap_context_freshness_runtime(
    text
  ) is
  'AUTH-DB-035 idempotent versioned environment identity bootstrap.';

comment on function
  app_private.bump_context_freshness(
    jsonb
  ) is
  'AUTH-DB-035 atomic generation bump plus outbox write in the caller transaction.';

comment on function
  app_private.resolve_context_temporal_boundary(
    text
  ) is
  'AUTH-DB-035 raw authoritative temporal boundary. The contractual one-second safety margin remains a consumer rule and does not mutate source timestamps.';

comment on function
  app_private.get_context_freshness_token(
    text
  ) is
  'AUTH-DB-035 private server-only ContextFreshnessToken@1.0.0 reader. It never returns an authorization decision.';

revoke execute
on function
  app_private.context_freshness_source_shape_fingerprint(
    text,
    text,
    text
  ),
  app_private.fingerprint_context_freshness_generation(
    uuid,
    text,
    text,
    bigint
  ),
  app_private.bootstrap_context_freshness_runtime(
    text
  ),
  app_private.bump_context_freshness(
    jsonb
  ),
  app_private.resolve_context_temporal_boundary(
    text
  ),
  app_private.get_context_freshness_token(
    text
  ),
  app_private.trigger_context_freshness_principals(),
  app_private.trigger_context_freshness_identity_links()
from public, anon, authenticated, service_role;

grant execute
on function
  app_private.context_freshness_source_shape_fingerprint(
    text,
    text,
    text
  ),
  app_private.fingerprint_context_freshness_generation(
    uuid,
    text,
    text,
    bigint
  ),
  app_private.bootstrap_context_freshness_runtime(
    text
  ),
  app_private.bump_context_freshness(
    jsonb
  ),
  app_private.resolve_context_temporal_boundary(
    text
  ),
  app_private.get_context_freshness_token(
    text
  )
to postgres;

reset role;

set local role vento_context_freshness_owner;

grant execute
on function
  app_private.trigger_context_freshness_principals(),
  app_private.trigger_context_freshness_identity_links()
to vento_ddl_owner;

reset role;

set local role vento_ddl_owner;

drop trigger if exists
  context_freshness_principals_insert
on identity_access.principals;

create trigger
  context_freshness_principals_insert
after insert
on identity_access.principals
referencing new table as
  auth_db_035_new_rows
for each statement
execute function
  app_private.trigger_context_freshness_principals();

drop trigger if exists
  context_freshness_principals_update
on identity_access.principals;

create trigger
  context_freshness_principals_update
after update
on identity_access.principals
referencing
  old table as auth_db_035_old_rows
  new table as auth_db_035_new_rows
for each statement
execute function
  app_private.trigger_context_freshness_principals();

drop trigger if exists
  context_freshness_principals_delete
on identity_access.principals;

create trigger
  context_freshness_principals_delete
after delete
on identity_access.principals
referencing old table as
  auth_db_035_old_rows
for each statement
execute function
  app_private.trigger_context_freshness_principals();

drop trigger if exists
  context_freshness_links_insert
on identity_access.enterprise_identity_links;

create trigger
  context_freshness_links_insert
after insert
on identity_access.enterprise_identity_links
referencing new table as
  auth_db_035_new_rows
for each statement
execute function
  app_private.trigger_context_freshness_identity_links();

drop trigger if exists
  context_freshness_links_update
on identity_access.enterprise_identity_links;

create trigger
  context_freshness_links_update
after update
on identity_access.enterprise_identity_links
referencing
  old table as auth_db_035_old_rows
  new table as auth_db_035_new_rows
for each statement
execute function
  app_private.trigger_context_freshness_identity_links();

drop trigger if exists
  context_freshness_links_delete
on identity_access.enterprise_identity_links;

create trigger
  context_freshness_links_delete
after delete
on identity_access.enterprise_identity_links
referencing old table as
  auth_db_035_old_rows
for each statement
execute function
  app_private.trigger_context_freshness_identity_links();

reset role;

set local role vento_context_freshness_owner;

update app_private.context_freshness_bindings b
set
  source_shape_fingerprint =
    app_private.context_freshness_source_shape_fingerprint(
      b.source_schema,
      b.source_relation,
      b.source_kind
    ),
  enforcement_state = 'ENFORCED',
  updated_at =
    pg_catalog.statement_timestamp()
where b.source_contract_key in (
  'application_catalog',
  'principal_registry',
  'enterprise_identity_links',
  'domain_identity_policy',
  'actor_resolution_model',
  'structural_issue_catalog'
)
and b.enforcement_state in (
  'BOOTSTRAP',
  'ENFORCED'
);

reset role;

revoke create
on schema app_private, audit
from vento_context_freshness_owner;

do $auth_db_035_postconditions$
declare
  v_count bigint;
  v_source_versions jsonb;
begin
  if not exists (
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
  ) then
    raise exception
      'AUTH_DB_035_OWNER_POSTURE_INVALID';
  end if;

  select count(*)
  into v_count
  from app_private.context_freshness_bindings;

  if v_count <> 15 then
    raise exception
      'AUTH_DB_035_BINDING_COUNT_INVALID:%',
      v_count;
  end if;

  select count(*)
  into v_count
  from app_private.context_freshness_bindings
  where enforcement_state = 'ENFORCED';

  if v_count <> 6 then
    raise exception
      'AUTH_DB_035_ENFORCED_BINDING_COUNT_INVALID:%',
      v_count;
  end if;

  select count(*)
  into v_count
  from app_private.context_freshness_bindings
  where enforcement_state = 'BLOCKED';

  if v_count <> 9 then
    raise exception
      'AUTH_DB_035_BLOCKED_BINDING_COUNT_INVALID:%',
      v_count;
  end if;

  if exists (
    select 1
    from app_private.context_freshness_bindings
    where enforcement_state = 'BOOTSTRAP'
  ) then
    raise exception
      'AUTH_DB_035_BOOTSTRAP_BINDING_REMAINS';
  end if;

  if exists (
    select 1
    from app_private.context_freshness_bindings b
    where b.enforcement_state = 'ENFORCED'
      and b.source_shape_fingerprint <>
        app_private.context_freshness_source_shape_fingerprint(
          b.source_schema,
          b.source_relation,
          b.source_kind
        )
  ) then
    raise exception
      'AUTH_DB_035_SOURCE_SHAPE_DRIFT';
  end if;

  select
    app_private.get_access_context(
      'nexo'
    ) #>
      '{resolution_metadata,source_versions}'
  into v_source_versions;

  if (
    select count(*)
    from pg_catalog.jsonb_object_keys(
      v_source_versions
    )
  ) <> 6 then
    raise exception
      'AUTH_DB_035_SOURCE_REGISTRY_COUNT_INVALID';
  end if;

  if exists (
    select 1
    from pg_catalog.jsonb_object_keys(
      v_source_versions
    ) k(source_contract_key)
    where not exists (
      select 1
      from app_private.context_freshness_bindings b
      where b.source_contract_key =
          k.source_contract_key
        and b.enforcement_state =
          'ENFORCED'
    )
  ) then
    raise exception
      'AUTH_DB_035_SOURCE_REGISTRY_BINDING_MISSING';
  end if;

  select count(*)
  into v_count
  from pg_catalog.pg_trigger t
  join pg_catalog.pg_class c
    on c.oid = t.tgrelid
  join pg_catalog.pg_namespace n
    on n.oid = c.relnamespace
  where not t.tgisinternal
    and n.nspname =
      'identity_access'
    and c.relname in (
      'principals',
      'enterprise_identity_links'
    )
    and t.tgname like
      'context_freshness_%';

  if v_count <> 6 then
    raise exception
      'AUTH_DB_035_TRIGGER_COUNT_INVALID:%',
      v_count;
  end if;

  if exists (
    select 1
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
  ) then
    raise exception
      'AUTH_DB_035_MANAGED_AUTH_TRIGGER_FORBIDDEN';
  end if;

  select count(*)
  into v_count
  from app_private.context_freshness_generations
  where scope_type =
    'APP_AUTHORIZATION';

  if v_count <> 10 then
    raise exception
      'AUTH_DB_035_APP_GENERATION_COUNT_INVALID:%',
      v_count;
  end if;

  select count(*)
  into v_count
  from app_private.context_freshness_generations
  where scope_type =
      'GLOBAL_AUTHORIZATION'
    and scope_key = 'GLOBAL';

  if v_count <> 1 then
    raise exception
      'AUTH_DB_035_GLOBAL_GENERATION_COUNT_INVALID:%',
      v_count;
  end if;

  if exists (
    select 1
    from app_private.context_freshness_generations
    where generation < 1
  ) then
    raise exception
      'AUTH_DB_035_GENERATION_ZERO_OR_NEGATIVE';
  end if;

  if (
    select count(*)
    from pg_catalog.pg_class c
    join pg_catalog.pg_namespace n
      on n.oid = c.relnamespace
    where n.nspname in (
      'app_private',
      'audit'
    )
      and c.relname in (
        'context_freshness_generations',
        'context_freshness_bindings',
        'context_freshness_runtime',
        'context_invalidation_outbox'
      )
      and c.relrowsecurity
  ) <> 4 then
    raise exception
      'AUTH_DB_035_RLS_NOT_ENABLED';
  end if;

  if exists (
    select 1
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
  ) then
    raise exception
      'AUTH_DB_035_CLIENT_TABLE_GRANT_INVALID';
  end if;

  if exists (
    select 1
    from (
      values
        (
          'app_private.context_freshness_source_shape_fingerprint(text,text,text)'
        ),
        (
          'app_private.fingerprint_context_freshness_generation(uuid,text,text,bigint)'
        ),
        (
          'app_private.bootstrap_context_freshness_runtime(text)'
        ),
        (
          'app_private.bump_context_freshness(jsonb)'
        ),
        (
          'app_private.resolve_context_temporal_boundary(text)'
        ),
        (
          'app_private.get_context_freshness_token(text)'
        ),
        (
          'app_private.trigger_context_freshness_principals()'
        ),
        (
          'app_private.trigger_context_freshness_identity_links()'
        )
    ) f(signature)
    cross join (
      values
        ('public'),
        ('anon'),
        ('authenticated'),
        ('service_role')
    ) r(role_name)
    where pg_catalog.has_function_privilege(
      r.role_name,
      f.signature,
      'EXECUTE'
    )
  ) then
    raise exception
      'AUTH_DB_035_CLIENT_FUNCTION_EXECUTE_INVALID';
  end if;

  if pg_catalog.has_schema_privilege(
       'vento_context_freshness_owner',
       'auth',
       'USAGE'
     )
     or pg_catalog.has_table_privilege(
       'vento_context_freshness_owner',
       'auth.sessions',
       'SELECT'
     ) then
    raise exception
      'AUTH_DB_035_DIRECT_MANAGED_AUTH_ACCESS_FORBIDDEN';
  end if;

  if not pg_catalog.has_table_privilege(
       'vento_context_freshness_owner',
       'app_private.context_freshness_auth_sessions',
       'SELECT'
     ) then
    raise exception
      'AUTH_DB_035_SESSION_BRIDGE_GRANT_MISSING';
  end if;

  if (
    select count(*)
    from information_schema.columns c
    where c.table_schema =
        'app_private'
      and c.table_name =
        'context_freshness_auth_sessions'
  ) <> 9 then
    raise exception
      'AUTH_DB_035_SESSION_BRIDGE_SHAPE_INVALID';
  end if;

  if exists (
    select 1
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
  ) then
    raise exception
      'AUTH_DB_035_SESSION_SECRET_FIELD_EXPOSED';
  end if;

  if exists (
    select 1
    from pg_catalog.pg_proc p
    join pg_catalog.pg_namespace n
      on n.oid = p.pronamespace
    where n.nspname = 'api'
      and p.proname like
        '%freshness%'
  ) then
    raise exception
      'AUTH_DB_035_FRESHNESS_API_EXPOSURE_INVALID';
  end if;

  if pg_catalog.has_schema_privilege(
       'vento_context_freshness_owner',
       'app_private',
       'CREATE'
     )
     or pg_catalog.has_schema_privilege(
       'vento_context_freshness_owner',
       'audit',
       'CREATE'
     ) then
    raise exception
      'AUTH_DB_035_OWNER_CREATE_NOT_REVOKED';
  end if;

  if (
    select count(*)
    from audit.context_invalidation_outbox
    where producer =
      'AUTH-DB-035::GLOBAL:BOOTSTRAP'
  ) <> 1 then
    raise exception
      'AUTH_DB_035_BOOTSTRAP_OUTBOX_INVALID';
  end if;
end
$auth_db_035_postconditions$;

commit;
