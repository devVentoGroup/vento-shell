-- AUTH-DB-032::GLOBAL
-- Canonical durable AuthorizationDecision persistence and decision-execution links.
-- source_contract_sha256 = b4ac332aebb731370919938eb29bb491ded5f17df360ce1fc731733a63b9c925
-- No hosted Supabase target is mutated directly by this migration authoring flow.
-- No permission-change audit, simulation audit, device-lifecycle audit, generic event store,
-- generic outbox, inbox, Realtime, Edge Function, webhook or cron surface is introduced.

begin;

do $auth_db_032_preconditions$
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
    raise exception 'AUTH_DB_032_AUTHORIZATION_OWNER_MISSING_OR_UNSAFE';
  end if;

  if pg_catalog.to_regnamespace('audit') is null
     or pg_catalog.to_regnamespace('app_private') is null
     or pg_catalog.to_regnamespace('api') is null
     or pg_catalog.to_regnamespace('extensions') is null then
    raise exception 'AUTH_DB_032_REQUIRED_SCHEMA_MISSING';
  end if;

  if pg_catalog.to_regprocedure('app_private.evaluate_authorization(jsonb)') is null
     or pg_catalog.to_regprocedure('app_private.project_safe_authorization_decision(jsonb)') is null
     or pg_catalog.to_regprocedure('app_private.authorization_policy_allows(jsonb)') is null
     or pg_catalog.to_regprocedure('app_private.canonicalize_authorization_payload(jsonb)') is null
     or pg_catalog.to_regprocedure('api.get_safe_authorization_decision(jsonb)') is null
     or pg_catalog.to_regprocedure('extensions.digest(text,text)') is null
     or pg_catalog.to_regprocedure('extensions.gen_random_uuid()') is null then
    raise exception 'AUTH_DB_032_REQUIRED_FUNCTION_GRAPH_MISSING';
  end if;

  if not exists (
    select 1
    from pg_catalog.pg_proc p
    where p.oid = 'app_private.evaluate_authorization(jsonb)'::regprocedure
      and pg_catalog.pg_get_userbyid(p.proowner) = 'vento_authorization_owner'
      and p.provolatile = 'v'
      and p.prosecdef
  ) then
    raise exception 'AUTH_DB_032_EVALUATOR_BASELINE_DRIFT';
  end if;
end
$auth_db_032_preconditions$;

grant usage, create on schema audit to vento_authorization_owner;
grant usage, create on schema app_private, api to vento_authorization_owner;
grant usage on schema extensions to vento_authorization_owner;
grant execute on function extensions.digest(text, text), extensions.gen_random_uuid() to vento_authorization_owner;

set local role vento_authorization_owner;

create table if not exists audit.authorization_decision_persistence_policies (
  policy_version text not null,
  category text not null,
  evidence_storage_mode text not null,
  sensitivity_floor text not null,
  retention_class text not null,
  source_contract_fingerprint text not null,
  status text not null,
  activated_at timestamptz,
  superseded_at timestamptz,
  installed_at timestamptz not null default pg_catalog.statement_timestamp(),
  constraint pk_authorization_decision_persistence_policies
    primary key (policy_version, category),
  constraint ck_authorization_decision_persistence_policy_category
    check (category in (
      'NAVIGATION',
      'UI_GUARD',
      'ORDINARY_READ',
      'AGGREGATE',
      'SENSITIVE_READ',
      'EXPORT',
      'SUPPORT',
      'MUTATION'
    )),
  constraint ck_authorization_decision_persistence_policy_mode
    check (evidence_storage_mode in ('AUDIT_ANCHOR', 'FULL_DECISION')),
  constraint ck_authorization_decision_persistence_policy_sensitivity
    check (sensitivity_floor in (
      'FUNCTIONAL',
      'FUNCTIONAL_SENSITIVE',
      'ADMINISTRATIVE',
      'PRIVILEGED'
    )),
  constraint ck_authorization_decision_persistence_policy_retention
    check (retention_class in (
      'RET_TRANSIENT',
      'RET_ACTIVE_CASE',
      'RET_BUSINESS_CYCLE',
      'RET_RELATIONSHIP',
      'RET_OBLIGATION',
      'RET_ARCHIVAL',
      'RET_HOLD',
      'RET_PERMANENT_EXCEPTION',
      'RET_UNRESOLVED'
    )),
  constraint ck_authorization_decision_persistence_policy_source
    check (source_contract_fingerprint ~ '^sha256:[0-9a-f]{64}$'),
  constraint ck_authorization_decision_persistence_policy_status
    check (status in ('INSTALLED', 'ACTIVE', 'SUPERSEDED', 'BLOCKED')),
  constraint ck_authorization_decision_persistence_policy_times
    check (
      (status = 'ACTIVE' and activated_at is not null and superseded_at is null)
      or (status <> 'ACTIVE')
    )
);

create unique index if not exists uq_authorization_decision_persistence_policy_active
on audit.authorization_decision_persistence_policies (category)
where status = 'ACTIVE';

insert into audit.authorization_decision_persistence_policies (
  policy_version,
  category,
  evidence_storage_mode,
  sensitivity_floor,
  retention_class,
  source_contract_fingerprint,
  status,
  activated_at,
  superseded_at
)
values
  ('1.0.0', 'NAVIGATION', 'AUDIT_ANCHOR', 'FUNCTIONAL', 'RET_BUSINESS_CYCLE', 'sha256:b4ac332aebb731370919938eb29bb491ded5f17df360ce1fc731733a63b9c925', 'ACTIVE', pg_catalog.statement_timestamp(), null),
  ('1.0.0', 'UI_GUARD', 'AUDIT_ANCHOR', 'FUNCTIONAL', 'RET_BUSINESS_CYCLE', 'sha256:b4ac332aebb731370919938eb29bb491ded5f17df360ce1fc731733a63b9c925', 'ACTIVE', pg_catalog.statement_timestamp(), null),
  ('1.0.0', 'ORDINARY_READ', 'AUDIT_ANCHOR', 'FUNCTIONAL', 'RET_BUSINESS_CYCLE', 'sha256:b4ac332aebb731370919938eb29bb491ded5f17df360ce1fc731733a63b9c925', 'ACTIVE', pg_catalog.statement_timestamp(), null),
  ('1.0.0', 'AGGREGATE', 'AUDIT_ANCHOR', 'FUNCTIONAL', 'RET_BUSINESS_CYCLE', 'sha256:b4ac332aebb731370919938eb29bb491ded5f17df360ce1fc731733a63b9c925', 'ACTIVE', pg_catalog.statement_timestamp(), null),
  ('1.0.0', 'SENSITIVE_READ', 'FULL_DECISION', 'FUNCTIONAL_SENSITIVE', 'RET_OBLIGATION', 'sha256:b4ac332aebb731370919938eb29bb491ded5f17df360ce1fc731733a63b9c925', 'ACTIVE', pg_catalog.statement_timestamp(), null),
  ('1.0.0', 'EXPORT', 'FULL_DECISION', 'FUNCTIONAL_SENSITIVE', 'RET_OBLIGATION', 'sha256:b4ac332aebb731370919938eb29bb491ded5f17df360ce1fc731733a63b9c925', 'ACTIVE', pg_catalog.statement_timestamp(), null),
  ('1.0.0', 'SUPPORT', 'FULL_DECISION', 'FUNCTIONAL_SENSITIVE', 'RET_OBLIGATION', 'sha256:b4ac332aebb731370919938eb29bb491ded5f17df360ce1fc731733a63b9c925', 'ACTIVE', pg_catalog.statement_timestamp(), null),
  ('1.0.0', 'MUTATION', 'FULL_DECISION', 'FUNCTIONAL_SENSITIVE', 'RET_OBLIGATION', 'sha256:b4ac332aebb731370919938eb29bb491ded5f17df360ce1fc731733a63b9c925', 'ACTIVE', pg_catalog.statement_timestamp(), null)
on conflict (policy_version, category) do nothing;

create table if not exists audit.authorization_decisions (
  decision_id text primary key,
  decision_contract_version text not null,
  decision_schema_version text not null,
  decision_record_fingerprint text not null,
  decided_at timestamptz not null,
  recorded_at timestamptz not null default pg_catalog.statement_timestamp(),
  correlation_id text,
  context_id text not null,
  principal_id text,
  actor_id text,
  device_id text,
  app_code text not null,
  permission_key text not null,
  operation_kind text not null,
  request_source text not null,
  resource_type text not null,
  resource_ids text[] not null default '{}'::text[],
  outcome text not null,
  authorizing_lanes text[] not null default '{}'::text[],
  authorization_reason_codes text[] not null default '{}'::text[],
  context_fingerprint text not null,
  resource_fingerprint text not null,
  catalog_hash text not null,
  dataset_hashes jsonb not null default '{}'::jsonb,
  evaluator_name text not null,
  evaluator_version text not null,
  evidence_storage_mode text not null,
  decision_payload jsonb,
  sensitivity_class text not null,
  retention_class text not null,
  source_contract_sha256 text not null,
  constraint ck_authorization_decision_record_fingerprint
    check (decision_record_fingerprint ~ '^sha256:[0-9a-f]{64}$'),
  constraint ck_authorization_decision_recorded_at
    check (recorded_at >= decided_at),
  constraint ck_authorization_decision_operation_kind
    check (operation_kind in ('READ', 'CREATE', 'UPDATE', 'DELETE', 'EXECUTE', 'TRANSITION', 'EXPORT', 'APP_ACCESS')),
  constraint ck_authorization_decision_request_source
    check (request_source in ('SERVER_ACTION', 'RPC', 'RLS', 'API', 'UI_GUARD', 'JOB')),
  constraint ck_authorization_decision_outcome
    check (outcome in ('ALLOW', 'DENY')),
  constraint ck_authorization_decision_authorizing_lanes
    check (
      authorizing_lanes <@ array['BASE', 'OPERATIONAL']::text[]
      and pg_catalog.array_position(authorizing_lanes, null) is null
      and (
        (outcome = 'ALLOW' and pg_catalog.cardinality(authorizing_lanes) > 0)
        or (outcome = 'DENY' and pg_catalog.cardinality(authorizing_lanes) = 0)
      )
    ),
  constraint ck_authorization_decision_resource_ids
    check (pg_catalog.array_position(resource_ids, null) is null),
  constraint ck_authorization_decision_reason_codes
    check (pg_catalog.array_position(authorization_reason_codes, null) is null),
  constraint ck_authorization_decision_fingerprints
    check (
      context_fingerprint ~ '^sha256:[0-9a-f]{64}$'
      and resource_fingerprint ~ '^sha256:[0-9a-f]{64}$'
      and catalog_hash ~ '^sha256:[0-9a-f]{64}$'
    ),
  constraint ck_authorization_decision_dataset_hashes
    check (pg_catalog.jsonb_typeof(dataset_hashes) = 'object'),
  constraint ck_authorization_decision_evidence_mode
    check (evidence_storage_mode in ('AUDIT_ANCHOR', 'FULL_DECISION')),
  constraint ck_authorization_decision_payload_mode
    check (evidence_storage_mode <> 'FULL_DECISION' or decision_payload is not null),
  constraint ck_authorization_decision_retention
    check (retention_class in (
      'RET_TRANSIENT',
      'RET_ACTIVE_CASE',
      'RET_BUSINESS_CYCLE',
      'RET_RELATIONSHIP',
      'RET_OBLIGATION',
      'RET_ARCHIVAL',
      'RET_HOLD',
      'RET_PERMANENT_EXCEPTION',
      'RET_UNRESOLVED'
    )),
  constraint ck_authorization_decision_source_contract
    check (source_contract_sha256 ~ '^[0-9a-f]{64}$')
);

create table if not exists audit.authorization_decision_resources (
  decision_id text not null,
  resource_ordinal integer not null,
  resource_type text not null,
  resource_id text not null,
  resource_fingerprint text not null,
  decided_at timestamptz not null,
  recorded_at timestamptz not null default pg_catalog.statement_timestamp(),
  link_fingerprint text not null,
  constraint pk_authorization_decision_resources primary key (decision_id, resource_ordinal),
  constraint uq_authorization_decision_resource_identity unique (decision_id, resource_type, resource_id),
  constraint fk_authorization_decision_resources_decision foreign key (decision_id)
    references audit.authorization_decisions(decision_id),
  constraint ck_authorization_decision_resource_ordinal check (resource_ordinal > 0),
  constraint ck_authorization_decision_resource_fingerprints check (
    resource_fingerprint ~ '^sha256:[0-9a-f]{64}$'
    and link_fingerprint ~ '^sha256:[0-9a-f]{64}$'
  ),
  constraint ck_authorization_decision_resource_recorded_at check (recorded_at >= decided_at)
);

create table if not exists audit.authorization_decision_links (
  decision_link_id text primary key,
  decision_id text not null,
  link_kind text not null,
  reference_type text not null,
  reference_id text not null,
  process_id text,
  process_instance_id text,
  correlation_id text,
  causation_id text,
  occurred_at timestamptz not null,
  recorded_at timestamptz not null default pg_catalog.statement_timestamp(),
  result_code text,
  result_reference text,
  error_class text,
  expected_resource_version text,
  observed_resource_version text,
  idempotency_key_reference text,
  link_fingerprint text not null,
  constraint fk_authorization_decision_links_decision foreign key (decision_id)
    references audit.authorization_decisions(decision_id),
  constraint uq_authorization_decision_link_reference
    unique (decision_id, link_kind, reference_type, reference_id),
  constraint ck_authorization_decision_link_kind check (link_kind in (
    'COMMAND',
    'EXECUTION_RESULT',
    'BUSINESS_EVENT',
    'ERROR',
    'COMPENSATION',
    'RECONCILIATION',
    'AUDIT_ENTRY'
  )),
  constraint ck_authorization_decision_link_reference check (
    pg_catalog.length(pg_catalog.btrim(reference_type)) > 0
    and pg_catalog.length(pg_catalog.btrim(reference_id)) > 0
  ),
  constraint ck_authorization_decision_link_fingerprint
    check (link_fingerprint ~ '^sha256:[0-9a-f]{64}$'),
  constraint ck_authorization_decision_link_recorded_at check (recorded_at >= occurred_at)
);

create table if not exists audit.authorization_evaluation_failures (
  evaluation_attempt_id text primary key,
  correlation_id text,
  support_code text not null,
  request_source text not null,
  consumer_id text,
  app_code text not null,
  permission_key text,
  operation_kind text not null,
  failure_stage text not null,
  private_failure_family text not null,
  sanitized_provider_code text,
  source_status text not null,
  retry_count integer not null,
  retry_budget integer not null,
  duration_ms bigint not null,
  source_versions jsonb not null default '{}'::jsonb,
  source_fingerprints jsonb not null default '{}'::jsonb,
  session_preserved boolean not null,
  effects_committed boolean not null,
  occurred_at timestamptz not null,
  recorded_at timestamptz not null default pg_catalog.statement_timestamp(),
  failure_fingerprint text not null,
  sensitivity_class text not null,
  retention_class text not null,
  constraint ck_authorization_evaluation_failure_request_source
    check (request_source in ('SERVER_ACTION', 'RPC', 'RLS', 'API', 'UI_GUARD', 'JOB')),
  constraint ck_authorization_evaluation_failure_operation_kind
    check (operation_kind in ('READ', 'CREATE', 'UPDATE', 'DELETE', 'EXECUTE', 'TRANSITION', 'EXPORT', 'APP_ACCESS')),
  constraint ck_authorization_evaluation_failure_source_status check (source_status = 'UNAVAILABLE'),
  constraint ck_authorization_evaluation_failure_retry check (
    retry_count >= 0 and retry_budget >= 0 and retry_count <= retry_budget
  ),
  constraint ck_authorization_evaluation_failure_duration check (duration_ms >= 0),
  constraint ck_authorization_evaluation_failure_sources check (
    pg_catalog.jsonb_typeof(source_versions) = 'object'
    and pg_catalog.jsonb_typeof(source_fingerprints) = 'object'
  ),
  constraint ck_authorization_evaluation_failure_state check (
    session_preserved and not effects_committed
  ),
  constraint ck_authorization_evaluation_failure_fingerprint
    check (failure_fingerprint ~ '^sha256:[0-9a-f]{64}$'),
  constraint ck_authorization_evaluation_failure_retention
    check (retention_class in (
      'RET_TRANSIENT',
      'RET_ACTIVE_CASE',
      'RET_BUSINESS_CYCLE',
      'RET_RELATIONSHIP',
      'RET_OBLIGATION',
      'RET_ARCHIVAL',
      'RET_HOLD',
      'RET_PERMANENT_EXCEPTION',
      'RET_UNRESOLVED'
    )),
  constraint ck_authorization_evaluation_failure_recorded_at check (recorded_at >= occurred_at)
);

create table if not exists audit.authorization_evaluation_failure_attempts (
  evaluation_attempt_id text not null,
  attempt_ordinal integer not null,
  source_key text not null,
  started_at timestamptz not null,
  completed_at timestamptz not null,
  duration_ms bigint not null,
  sanitized_provider_code text,
  retryable boolean not null,
  retry_after_seconds integer,
  attempt_result text not null,
  recorded_at timestamptz not null default pg_catalog.statement_timestamp(),
  attempt_fingerprint text not null,
  constraint pk_authorization_evaluation_failure_attempts
    primary key (evaluation_attempt_id, attempt_ordinal),
  constraint fk_authorization_evaluation_failure_attempts_failure
    foreign key (evaluation_attempt_id)
    references audit.authorization_evaluation_failures(evaluation_attempt_id),
  constraint ck_authorization_evaluation_failure_attempt_ordinal check (attempt_ordinal > 0),
  constraint ck_authorization_evaluation_failure_attempt_duration check (
    duration_ms >= 0 and completed_at >= started_at
  ),
  constraint ck_authorization_evaluation_failure_attempt_retry_after check (
    retry_after_seconds is null or retry_after_seconds >= 0
  ),
  constraint ck_authorization_evaluation_failure_attempt_result check (
    pg_catalog.length(pg_catalog.btrim(attempt_result)) > 0
  ),
  constraint ck_authorization_evaluation_failure_attempt_fingerprint
    check (attempt_fingerprint ~ '^sha256:[0-9a-f]{64}$')
);

create index if not exists ix_authorization_decisions_correlation_time
on audit.authorization_decisions (correlation_id, decided_at desc, decision_id desc);
create index if not exists ix_authorization_decisions_actor_time
on audit.authorization_decisions (actor_id, decided_at desc, decision_id desc);
create index if not exists ix_authorization_decisions_principal_time
on audit.authorization_decisions (principal_id, decided_at desc, decision_id desc);
create index if not exists ix_authorization_decisions_device_time
on audit.authorization_decisions (device_id, decided_at desc, decision_id desc);
create index if not exists ix_authorization_decisions_permission_time
on audit.authorization_decisions (app_code, permission_key, decided_at desc, decision_id desc);
create index if not exists ix_authorization_decisions_outcome_time
on audit.authorization_decisions (outcome, decided_at desc, decision_id desc);
create index if not exists ix_authorization_decision_resources_lookup
on audit.authorization_decision_resources (resource_type, resource_id, decided_at desc, decision_id desc);
create index if not exists ix_authorization_decision_links_decision_time
on audit.authorization_decision_links (decision_id, occurred_at, decision_link_id);
create index if not exists ix_authorization_evaluation_failures_correlation_time
on audit.authorization_evaluation_failures (correlation_id, occurred_at desc, evaluation_attempt_id desc);
create index if not exists ix_authorization_evaluation_failures_permission_time
on audit.authorization_evaluation_failures (app_code, permission_key, occurred_at desc, evaluation_attempt_id desc);
create index if not exists ix_authorization_evaluation_failures_stage_time
on audit.authorization_evaluation_failures (failure_stage, occurred_at desc, evaluation_attempt_id desc);

create or replace function app_private.resolve_authorization_persistence_profile(
  p_decision jsonb
)
returns jsonb
language plpgsql
stable
strict
set search_path = pg_catalog, app_private, audit
as $auth_db_032_profile$
declare
  v_operation text;
  v_source text;
  v_resource_mode text;
  v_category text;
  v_permission_sensitive boolean;
  v_permission_sensitivity text;
  v_resource_sensitivity text;
  v_audit_policy_id text;
  v_policy audit.authorization_decision_persistence_policies%rowtype;
  v_sensitivity text;
  v_rank integer;
  v_candidate text;
  v_candidate_rank integer;
begin
  if pg_catalog.jsonb_typeof(p_decision) <> 'object'
     or p_decision ->> 'contract_family' <> 'vento.authorization.response-contracts'
     or p_decision ->> 'contract_name' <> 'AuthorizationDecision'
     or p_decision ->> 'contract_version' <> '1.0.0'
     or p_decision ->> 'schema_version' <> '1.0.0' then
    raise exception using errcode = '22023', message = 'AUTH_DB_032_PROFILE_DECISION_INVALID';
  end if;

  v_operation := p_decision #>> '{request,operation_kind}';
  v_source := p_decision #>> '{request,request_source}';
  v_resource_mode := p_decision #>> '{request,resource_request,mode}';
  v_permission_sensitive := coalesce((p_decision #>> '{permission_contract,is_sensitive}')::boolean, false);
  v_permission_sensitivity := nullif(p_decision #>> '{permission_contract,sensitivity_class}', '');
  v_resource_sensitivity := nullif(p_decision #>> '{resource,sensitivity_class}', '');
  v_audit_policy_id := nullif(p_decision #>> '{permission_contract,audit_policy_id}', '');

  if v_source = 'UI_GUARD' then
    v_category := 'UI_GUARD';
  elsif v_operation = 'APP_ACCESS' then
    v_category := 'NAVIGATION';
  elsif v_operation in ('CREATE', 'UPDATE', 'DELETE', 'EXECUTE', 'TRANSITION') then
    v_category := 'MUTATION';
  elsif v_operation = 'EXPORT' then
    v_category := 'EXPORT';
  elsif v_operation = 'READ' and coalesce(v_audit_policy_id, '') ilike '%support%' then
    v_category := 'SUPPORT';
  elsif v_operation = 'READ' and (
    v_permission_sensitive
    or v_permission_sensitivity in ('FUNCTIONAL_SENSITIVE', 'ADMINISTRATIVE', 'PRIVILEGED')
    or v_resource_sensitivity in ('FUNCTIONAL_SENSITIVE', 'ADMINISTRATIVE', 'PRIVILEGED')
  ) then
    v_category := 'SENSITIVE_READ';
  elsif v_operation = 'READ' and v_resource_mode = 'AGGREGATE' then
    v_category := 'AGGREGATE';
  elsif v_operation = 'READ' then
    v_category := 'ORDINARY_READ';
  else
    raise exception using errcode = '22023', message = 'AUTH_DB_032_PROFILE_CATEGORY_UNRESOLVED';
  end if;

  select p.*
  into v_policy
  from audit.authorization_decision_persistence_policies p
  where p.category = v_category
    and p.status = 'ACTIVE';

  if not found then
    raise exception using errcode = '55000', message = 'AUTH_DB_032_ACTIVE_PERSISTENCE_POLICY_MISSING';
  end if;

  if (
    select pg_catalog.count(*)
    from audit.authorization_decision_persistence_policies p
    where p.category = v_category
      and p.status = 'ACTIVE'
  ) <> 1 then
    raise exception using errcode = '55000', message = 'AUTH_DB_032_ACTIVE_PERSISTENCE_POLICY_AMBIGUOUS';
  end if;

  v_sensitivity := v_policy.sensitivity_floor;
  v_rank := case v_sensitivity
    when 'FUNCTIONAL' then 1
    when 'FUNCTIONAL_SENSITIVE' then 2
    when 'ADMINISTRATIVE' then 3
    when 'PRIVILEGED' then 4
    else 0
  end;

  foreach v_candidate in array array[
    case when v_permission_sensitive then 'FUNCTIONAL_SENSITIVE' else null end,
    v_permission_sensitivity,
    v_resource_sensitivity
  ] loop
    if v_candidate is null then
      continue;
    end if;
    v_candidate_rank := case v_candidate
      when 'FUNCTIONAL' then 1
      when 'FUNCTIONAL_SENSITIVE' then 2
      when 'ADMINISTRATIVE' then 3
      when 'PRIVILEGED' then 4
      else 0
    end;
    if v_candidate_rank > v_rank then
      v_rank := v_candidate_rank;
      v_sensitivity := v_candidate;
    end if;
  end loop;

  return pg_catalog.jsonb_build_object(
    'policy_version', v_policy.policy_version,
    'category', v_policy.category,
    'evidence_storage_mode', v_policy.evidence_storage_mode,
    'sensitivity_class', v_sensitivity,
    'retention_class', v_policy.retention_class,
    'audit_commit_class', 'AUDIT_ATOMIC_REQUIRED'
  );
end
$auth_db_032_profile$;

create or replace function audit.reject_authorization_record_mutation()
returns trigger
language plpgsql
volatile
set search_path = pg_catalog, audit
as $auth_db_032_reject_mutation$
begin
  raise exception using errcode = '55000', message = 'AUTH_DB_032_APPEND_ONLY_MUTATION_FORBIDDEN';
end
$auth_db_032_reject_mutation$;

create or replace function audit.append_authorization_decision(
  p_decision jsonb
)
returns text
language plpgsql
volatile
security definer
strict
set search_path = pg_catalog, audit, app_private
as $auth_db_032_append_decision$
declare
  v_audit jsonb;
  v_profile jsonb;
  v_decision_id text;
  v_decided_at timestamptz;
  v_recorded_at timestamptz := pg_catalog.statement_timestamp();
  v_correlation_id text;
  v_context_id text;
  v_principal_id text;
  v_actor_id text;
  v_device_id text;
  v_app_code text;
  v_permission_key text;
  v_operation_kind text;
  v_request_source text;
  v_resource_type text;
  v_resource_ids text[] := '{}'::text[];
  v_outcome text;
  v_authorizing_lanes text[] := '{}'::text[];
  v_reason_codes text[] := '{}'::text[];
  v_context_fingerprint text;
  v_resource_fingerprint text;
  v_catalog_hash text;
  v_dataset_hashes jsonb;
  v_evaluator_name text;
  v_evaluator_version text;
  v_evidence_mode text;
  v_payload jsonb;
  v_sensitivity text;
  v_retention text;
  v_preimage jsonb;
  v_fingerprint text;
  v_existing_fingerprint text;
  v_existing_mode text;
  v_existing_sensitivity text;
  v_existing_retention text;
  v_existing_record boolean := false;
  v_inserted boolean := false;
  v_child_ids text[];
  v_index integer;
begin
  if pg_catalog.jsonb_typeof(p_decision) <> 'object'
     or p_decision ->> 'contract_family' <> 'vento.authorization.response-contracts'
     or p_decision ->> 'contract_name' <> 'AuthorizationDecision'
     or p_decision ->> 'contract_version' <> '1.0.0'
     or p_decision ->> 'schema_version' <> '1.0.0'
     or pg_catalog.jsonb_typeof(p_decision -> 'audit') <> 'object' then
    raise exception using errcode = '22023', message = 'AUTH_DB_032_DECISION_CONTRACT_INVALID';
  end if;

  v_audit := p_decision -> 'audit';
  v_decision_id := nullif(p_decision ->> 'decision_id', '');
  if v_decision_id is null or v_decision_id is distinct from nullif(v_audit ->> 'decision_id', '') then
    raise exception using errcode = '22023', message = 'AUTH_DB_032_DECISION_ID_MISMATCH';
  end if;

  begin
    v_decided_at := (p_decision ->> 'decided_at')::timestamptz;
  exception when others then
    raise exception using errcode = '22023', message = 'AUTH_DB_032_DECIDED_AT_INVALID';
  end;

  if v_recorded_at < v_decided_at then
    raise exception using errcode = '22023', message = 'AUTH_DB_032_RECORDED_AT_PRECEDES_DECISION';
  end if;

  v_correlation_id := nullif(p_decision ->> 'correlation_id', '');
  if v_correlation_id is distinct from nullif(v_audit ->> 'correlation_id', '') then
    raise exception using errcode = '22023', message = 'AUTH_DB_032_CORRELATION_ID_MISMATCH';
  end if;

  v_context_id := nullif(p_decision #>> '{access_context_ref,context_id}', '');
  v_principal_id := nullif(v_audit ->> 'principal_id', '');
  v_actor_id := nullif(v_audit ->> 'actor_id', '');
  v_device_id := nullif(v_audit ->> 'device_id', '');

  if v_context_id is null
     or v_actor_id is distinct from nullif(p_decision #>> '{access_context_ref,actor_id}', '')
     or v_principal_id is distinct from nullif(p_decision #>> '{access_context_ref,principal_id}', '') then
    raise exception using errcode = '22023', message = 'AUTH_DB_032_ACTOR_CONTEXT_MISMATCH';
  end if;

  v_app_code := nullif(p_decision #>> '{request,app_code}', '');
  v_permission_key := nullif(p_decision #>> '{request,permission_key}', '');
  v_operation_kind := nullif(p_decision #>> '{request,operation_kind}', '');
  v_request_source := nullif(p_decision #>> '{request,request_source}', '');

  if v_app_code is null or v_permission_key is null
     or v_app_code is distinct from nullif(v_audit ->> 'app_code', '')
     or v_permission_key is distinct from nullif(v_audit ->> 'permission_key', '')
     or v_request_source is distinct from nullif(v_audit ->> 'request_source', '') then
    raise exception using errcode = '22023', message = 'AUTH_DB_032_REQUEST_AUDIT_MISMATCH';
  end if;

  v_resource_type := nullif(p_decision #>> '{resource,resource_type}', '');
  if v_resource_type is null or v_resource_type is distinct from nullif(v_audit ->> 'resource_type', '') then
    raise exception using errcode = '22023', message = 'AUTH_DB_032_RESOURCE_TYPE_MISMATCH';
  end if;

  if pg_catalog.jsonb_typeof(v_audit -> 'resource_ids') <> 'array' then
    raise exception using errcode = '22023', message = 'AUTH_DB_032_RESOURCE_IDS_INVALID';
  end if;
  select coalesce(pg_catalog.array_agg(x.resource_id order by x.resource_id), '{}'::text[])
  into v_resource_ids
  from (
    select distinct value as resource_id
    from pg_catalog.jsonb_array_elements_text(v_audit -> 'resource_ids')
    where nullif(value, '') is not null
  ) x;

  v_outcome := p_decision ->> 'final_decision';
  if v_outcome not in ('ALLOW', 'DENY') or v_outcome is distinct from v_audit ->> 'outcome' then
    raise exception using errcode = '22023', message = 'AUTH_DB_032_OUTCOME_MISMATCH';
  end if;

  if pg_catalog.jsonb_typeof(v_audit -> 'authorizing_lanes') <> 'array' then
    raise exception using errcode = '22023', message = 'AUTH_DB_032_AUTHORIZING_LANES_INVALID';
  end if;
  select coalesce(pg_catalog.array_agg(x.lane order by x.lane), '{}'::text[])
  into v_authorizing_lanes
  from (
    select distinct value as lane
    from pg_catalog.jsonb_array_elements_text(v_audit -> 'authorizing_lanes')
  ) x;

  if exists (
    select 1 from pg_catalog.unnest(v_authorizing_lanes) lane where lane not in ('BASE', 'OPERATIONAL')
  ) or (v_outcome = 'ALLOW' and pg_catalog.cardinality(v_authorizing_lanes) = 0)
     or (v_outcome = 'DENY' and pg_catalog.cardinality(v_authorizing_lanes) <> 0) then
    raise exception using errcode = '22023', message = 'AUTH_DB_032_AUTHORIZING_LANES_OUTCOME_INVALID';
  end if;

  if pg_catalog.jsonb_typeof(p_decision -> 'blocked_reasons') = 'array' then
    select coalesce(pg_catalog.array_agg(distinct value order by value), '{}'::text[])
    into v_reason_codes
    from pg_catalog.jsonb_array_elements_text(p_decision -> 'blocked_reasons');
  end if;

  v_context_fingerprint := coalesce(nullif(v_audit ->> 'context_fingerprint', ''), nullif(p_decision #>> '{access_context_ref,context_fingerprint}', ''));
  v_resource_fingerprint := coalesce(nullif(v_audit ->> 'resource_fingerprint', ''), nullif(p_decision #>> '{resource,resource_fingerprint}', ''));
  v_catalog_hash := nullif(v_audit ->> 'catalog_hash', '');
  v_dataset_hashes := v_audit -> 'dataset_hashes';
  v_evaluator_name := nullif(v_audit ->> 'evaluator_name', '');
  v_evaluator_version := nullif(v_audit ->> 'evaluator_version', '');

  if v_context_fingerprint !~ '^sha256:[0-9a-f]{64}$'
     or v_resource_fingerprint !~ '^sha256:[0-9a-f]{64}$'
     or v_catalog_hash !~ '^sha256:[0-9a-f]{64}$'
     or pg_catalog.jsonb_typeof(v_dataset_hashes) <> 'object'
     or v_evaluator_name is null
     or v_evaluator_version is null then
    raise exception using errcode = '22023', message = 'AUTH_DB_032_DECISION_FINGERPRINT_EVIDENCE_INVALID';
  end if;

  if v_context_fingerprint is distinct from nullif(p_decision #>> '{access_context_ref,context_fingerprint}', '')
     or v_resource_fingerprint is distinct from nullif(p_decision #>> '{resource,resource_fingerprint}', '') then
    raise exception using errcode = '22023', message = 'AUTH_DB_032_ROOT_AUDIT_FINGERPRINT_MISMATCH';
  end if;

  select
    d.decision_record_fingerprint,
    d.evidence_storage_mode,
    d.sensitivity_class,
    d.retention_class
  into
    v_existing_fingerprint,
    v_existing_mode,
    v_existing_sensitivity,
    v_existing_retention
  from audit.authorization_decisions d
  where d.decision_id = v_decision_id;

  v_existing_record := found;

  if v_existing_record then
    v_evidence_mode := v_existing_mode;
    v_sensitivity := v_existing_sensitivity;
    v_retention := v_existing_retention;
    v_profile := pg_catalog.jsonb_build_object(
      'policy_version', null,
      'category', null,
      'evidence_storage_mode', v_evidence_mode,
      'sensitivity_class', v_sensitivity,
      'retention_class', v_retention,
      'audit_commit_class', 'AUDIT_ATOMIC_REQUIRED'
    );
  else
    v_profile := app_private.resolve_authorization_persistence_profile(p_decision);
    v_evidence_mode := v_profile ->> 'evidence_storage_mode';
    v_sensitivity := v_profile ->> 'sensitivity_class';
    v_retention := v_profile ->> 'retention_class';
  end if;

  v_payload := case when v_evidence_mode = 'FULL_DECISION' then p_decision else null end;

  v_preimage := pg_catalog.jsonb_build_object(
    'contract_identity', pg_catalog.jsonb_build_object(
      'contract_family', p_decision ->> 'contract_family',
      'contract_family_version', p_decision ->> 'contract_family_version',
      'contract_name', p_decision ->> 'contract_name',
      'contract_version', p_decision ->> 'contract_version',
      'schema_version', p_decision ->> 'schema_version'
    ),
    'decision_id', v_decision_id,
    'decided_at', pg_catalog.to_char(v_decided_at at time zone 'UTC', 'YYYY-MM-DD"T"HH24:MI:SS.MS"Z"'),
    'correlation_id', v_correlation_id,
    'audit_context', pg_catalog.jsonb_build_object(
      'decision_id', v_decision_id,
      'correlation_id', v_correlation_id,
      'actor_id', v_actor_id,
      'principal_id', v_principal_id,
      'device_id', v_device_id,
      'app_code', v_app_code,
      'permission_key', v_permission_key,
      'request_source', v_request_source,
      'resource_type', v_resource_type,
      'resource_ids', pg_catalog.to_jsonb(v_resource_ids),
      'outcome', v_outcome,
      'authorizing_lanes', pg_catalog.to_jsonb(v_authorizing_lanes),
      'context_fingerprint', v_context_fingerprint,
      'resource_fingerprint', v_resource_fingerprint,
      'catalog_hash', v_catalog_hash,
      'dataset_hashes', v_dataset_hashes,
      'evaluator_name', v_evaluator_name,
      'evaluator_version', v_evaluator_version
    ),
    'request_identity', pg_catalog.jsonb_build_object(
      'app_code', v_app_code,
      'permission_key', v_permission_key,
      'operation_kind', v_operation_kind,
      'request_source', v_request_source,
      'resource_type', v_resource_type,
      'resource_ids', pg_catalog.to_jsonb(v_resource_ids)
    ),
    'outcome', v_outcome,
    'authorization_reason_codes', pg_catalog.to_jsonb(v_reason_codes),
    'hashes', pg_catalog.jsonb_build_object(
      'context_fingerprint', v_context_fingerprint,
      'resource_fingerprint', v_resource_fingerprint,
      'catalog_hash', v_catalog_hash,
      'dataset_hashes', v_dataset_hashes
    ),
    'persistence_profile', pg_catalog.jsonb_build_object(
      'evidence_storage_mode', v_evidence_mode,
      'sensitivity_class', v_sensitivity,
      'retention_class', v_retention,
      'audit_commit_class', 'AUDIT_ATOMIC_REQUIRED'
    ),
    'source_contract_sha256', 'b4ac332aebb731370919938eb29bb491ded5f17df360ce1fc731733a63b9c925',
    'decision_payload', v_payload
  );

  v_fingerprint := 'sha256:' || pg_catalog.encode(
    extensions.digest(app_private.canonicalize_authorization_payload(v_preimage), 'sha256'),
    'hex'
  );

  if v_existing_record then
    if v_existing_fingerprint is distinct from v_fingerprint then
      raise exception using errcode = '23505', message = 'AUTH_DB_032_DECISION_INTEGRITY_CONFLICT';
    end if;

    select coalesce(pg_catalog.array_agg(r.resource_id order by r.resource_ordinal), '{}'::text[])
    into v_child_ids
    from audit.authorization_decision_resources r
    where r.decision_id = v_decision_id;

    if v_child_ids is distinct from v_resource_ids then
      raise exception using errcode = '55000', message = 'AUTH_DB_032_DECISION_RESOURCE_LINK_MISMATCH';
    end if;

    return v_decision_id;
  end if;

  insert into audit.authorization_decisions (
    decision_id,
    decision_contract_version,
    decision_schema_version,
    decision_record_fingerprint,
    decided_at,
    recorded_at,
    correlation_id,
    context_id,
    principal_id,
    actor_id,
    device_id,
    app_code,
    permission_key,
    operation_kind,
    request_source,
    resource_type,
    resource_ids,
    outcome,
    authorizing_lanes,
    authorization_reason_codes,
    context_fingerprint,
    resource_fingerprint,
    catalog_hash,
    dataset_hashes,
    evaluator_name,
    evaluator_version,
    evidence_storage_mode,
    decision_payload,
    sensitivity_class,
    retention_class,
    source_contract_sha256
  ) values (
    v_decision_id,
    p_decision ->> 'contract_version',
    p_decision ->> 'schema_version',
    v_fingerprint,
    v_decided_at,
    v_recorded_at,
    v_correlation_id,
    v_context_id,
    v_principal_id,
    v_actor_id,
    v_device_id,
    v_app_code,
    v_permission_key,
    v_operation_kind,
    v_request_source,
    v_resource_type,
    v_resource_ids,
    v_outcome,
    v_authorizing_lanes,
    v_reason_codes,
    v_context_fingerprint,
    v_resource_fingerprint,
    v_catalog_hash,
    v_dataset_hashes,
    v_evaluator_name,
    v_evaluator_version,
    v_evidence_mode,
    v_payload,
    v_sensitivity,
    v_retention,
    'b4ac332aebb731370919938eb29bb491ded5f17df360ce1fc731733a63b9c925'
  )
  on conflict (decision_id) do nothing
  returning true into v_inserted;

  if not coalesce(v_inserted, false) then
    select d.decision_record_fingerprint
    into v_existing_fingerprint
    from audit.authorization_decisions d
    where d.decision_id = v_decision_id;

    if v_existing_fingerprint is distinct from v_fingerprint then
      raise exception using errcode = '23505', message = 'AUTH_DB_032_DECISION_INTEGRITY_CONFLICT';
    end if;

    select coalesce(pg_catalog.array_agg(r.resource_id order by r.resource_ordinal), '{}'::text[])
    into v_child_ids
    from audit.authorization_decision_resources r
    where r.decision_id = v_decision_id;

    if v_child_ids is distinct from v_resource_ids then
      raise exception using errcode = '55000', message = 'AUTH_DB_032_DECISION_RESOURCE_LINK_MISMATCH';
    end if;

    return v_decision_id;
  end if;

  if pg_catalog.cardinality(v_resource_ids) > 0 then
    for v_index in 1..pg_catalog.cardinality(v_resource_ids) loop
      insert into audit.authorization_decision_resources (
        decision_id,
        resource_ordinal,
        resource_type,
        resource_id,
        resource_fingerprint,
        decided_at,
        recorded_at,
        link_fingerprint
      ) values (
        v_decision_id,
        v_index,
        v_resource_type,
        v_resource_ids[v_index],
        v_resource_fingerprint,
        v_decided_at,
        v_recorded_at,
        'sha256:' || pg_catalog.encode(
          extensions.digest(
            app_private.canonicalize_authorization_payload(
              pg_catalog.jsonb_build_object(
                'decision_id', v_decision_id,
                'resource_ordinal', v_index,
                'resource_type', v_resource_type,
                'resource_id', v_resource_ids[v_index],
                'resource_fingerprint', v_resource_fingerprint,
                'decided_at', pg_catalog.to_char(v_decided_at at time zone 'UTC', 'YYYY-MM-DD"T"HH24:MI:SS.MS"Z"')
              )
            ),
            'sha256'
          ),
          'hex'
        )
      );
    end loop;
  end if;

  select coalesce(pg_catalog.array_agg(r.resource_id order by r.resource_ordinal), '{}'::text[])
  into v_child_ids
  from audit.authorization_decision_resources r
  where r.decision_id = v_decision_id;

  if v_child_ids is distinct from v_resource_ids then
    raise exception using errcode = '55000', message = 'AUTH_DB_032_DECISION_RESOURCE_LINK_MISMATCH';
  end if;

  return v_decision_id;
end
$auth_db_032_append_decision$;

create or replace function audit.append_authorization_decision_link(
  p_link jsonb
)
returns text
language plpgsql
volatile
security definer
strict
set search_path = pg_catalog, audit, app_private
as $auth_db_032_append_link$
declare
  v_decision_id text;
  v_link_kind text;
  v_reference_type text;
  v_reference_id text;
  v_decision_correlation text;
  v_correlation_id text;
  v_occurred_at timestamptz;
  v_recorded_at timestamptz := pg_catalog.statement_timestamp();
  v_fingerprint text;
  v_existing_id text;
  v_existing_fingerprint text;
  v_link_id text;
begin
  if pg_catalog.jsonb_typeof(p_link) <> 'object' then
    raise exception using errcode = '22023', message = 'AUTH_DB_032_DECISION_LINK_INVALID';
  end if;

  v_decision_id := nullif(p_link ->> 'decision_id', '');
  v_link_kind := nullif(p_link ->> 'link_kind', '');
  v_reference_type := nullif(p_link ->> 'reference_type', '');
  v_reference_id := nullif(p_link ->> 'reference_id', '');
  v_correlation_id := nullif(p_link ->> 'correlation_id', '');

  if v_decision_id is null or v_reference_type is null or v_reference_id is null
     or v_link_kind not in ('COMMAND', 'EXECUTION_RESULT', 'BUSINESS_EVENT', 'ERROR', 'COMPENSATION', 'RECONCILIATION', 'AUDIT_ENTRY') then
    raise exception using errcode = '22023', message = 'AUTH_DB_032_DECISION_LINK_SHAPE_INVALID';
  end if;

  select d.correlation_id
  into v_decision_correlation
  from audit.authorization_decisions d
  where d.decision_id = v_decision_id;

  if not found then
    raise exception using errcode = '23503', message = 'AUTH_DB_032_DECISION_LINK_DECISION_MISSING';
  end if;
  if v_correlation_id is distinct from v_decision_correlation then
    raise exception using errcode = '22023', message = 'AUTH_DB_032_DECISION_LINK_CORRELATION_MISMATCH';
  end if;

  begin
    v_occurred_at := (p_link ->> 'occurred_at')::timestamptz;
  exception when others then
    raise exception using errcode = '22023', message = 'AUTH_DB_032_DECISION_LINK_OCCURRED_AT_INVALID';
  end;
  if v_recorded_at < v_occurred_at then
    raise exception using errcode = '22023', message = 'AUTH_DB_032_DECISION_LINK_RECORDED_AT_INVALID';
  end if;

  v_fingerprint := 'sha256:' || pg_catalog.encode(
    extensions.digest(
      app_private.canonicalize_authorization_payload(
        pg_catalog.jsonb_build_object(
          'decision_id', v_decision_id,
          'link_kind', v_link_kind,
          'reference_type', v_reference_type,
          'reference_id', v_reference_id,
          'process_id', p_link ->> 'process_id',
          'process_instance_id', p_link ->> 'process_instance_id',
          'correlation_id', v_correlation_id,
          'causation_id', p_link ->> 'causation_id',
          'occurred_at', pg_catalog.to_char(v_occurred_at at time zone 'UTC', 'YYYY-MM-DD"T"HH24:MI:SS.MS"Z"'),
          'result_code', p_link ->> 'result_code',
          'result_reference', p_link ->> 'result_reference',
          'error_class', p_link ->> 'error_class',
          'expected_resource_version', p_link ->> 'expected_resource_version',
          'observed_resource_version', p_link ->> 'observed_resource_version',
          'idempotency_key_reference', p_link ->> 'idempotency_key_reference'
        )
      ),
      'sha256'
    ),
    'hex'
  );

  select l.decision_link_id, l.link_fingerprint
  into v_existing_id, v_existing_fingerprint
  from audit.authorization_decision_links l
  where l.decision_id = v_decision_id
    and l.link_kind = v_link_kind
    and l.reference_type = v_reference_type
    and l.reference_id = v_reference_id;

  if found then
    if v_existing_fingerprint is distinct from v_fingerprint then
      raise exception using errcode = '23505', message = 'AUTH_DB_032_DECISION_LINK_INTEGRITY_CONFLICT';
    end if;
    return v_existing_id;
  end if;

  v_link_id := extensions.gen_random_uuid()::text;
  insert into audit.authorization_decision_links (
    decision_link_id,
    decision_id,
    link_kind,
    reference_type,
    reference_id,
    process_id,
    process_instance_id,
    correlation_id,
    causation_id,
    occurred_at,
    recorded_at,
    result_code,
    result_reference,
    error_class,
    expected_resource_version,
    observed_resource_version,
    idempotency_key_reference,
    link_fingerprint
  ) values (
    v_link_id,
    v_decision_id,
    v_link_kind,
    v_reference_type,
    v_reference_id,
    nullif(p_link ->> 'process_id', ''),
    nullif(p_link ->> 'process_instance_id', ''),
    v_correlation_id,
    nullif(p_link ->> 'causation_id', ''),
    v_occurred_at,
    v_recorded_at,
    nullif(p_link ->> 'result_code', ''),
    nullif(p_link ->> 'result_reference', ''),
    nullif(p_link ->> 'error_class', ''),
    nullif(p_link ->> 'expected_resource_version', ''),
    nullif(p_link ->> 'observed_resource_version', ''),
    nullif(p_link ->> 'idempotency_key_reference', ''),
    v_fingerprint
  );
  return v_link_id;
end
$auth_db_032_append_link$;

create or replace function audit.append_authorization_evaluation_failure(
  p_failure jsonb
)
returns text
language plpgsql
volatile
security definer
strict
set search_path = pg_catalog, audit, app_private
as $auth_db_032_append_failure$
declare
  v_attempt_id text;
  v_occurred_at timestamptz;
  v_recorded_at timestamptz := pg_catalog.statement_timestamp();
  v_retry_count integer;
  v_retry_budget integer;
  v_duration bigint;
  v_fingerprint text;
  v_existing_fingerprint text;
begin
  if pg_catalog.jsonb_typeof(p_failure) <> 'object'
     or p_failure ->> 'contract' <> 'AUTHORIZATION-TECHNICAL-UNAVAILABILITY-CONTRACT-001'
     or p_failure ->> 'contract_version' <> '1.0.0'
     or p_failure ->> 'result_status' <> 'TECHNICAL_FAILURE'
     or coalesce((p_failure ->> 'decision_produced')::boolean, true)
     or coalesce((p_failure ->> 'executable')::boolean, true)
     or not coalesce((p_failure ->> 'session_preserved')::boolean, false)
     or coalesce((p_failure ->> 'effects_committed')::boolean, true)
     or p_failure ? 'decision_id' then
    raise exception using errcode = '22023', message = 'AUTH_DB_032_TECHNICAL_FAILURE_CONTRACT_INVALID';
  end if;

  v_attempt_id := nullif(p_failure ->> 'evaluation_attempt_id', '');
  if v_attempt_id is null
     or nullif(p_failure ->> 'support_code', '') is null
     or nullif(p_failure ->> 'app_code', '') is null
     or nullif(p_failure ->> 'failure_stage', '') is null
     or nullif(p_failure ->> 'private_failure_family', '') is null then
    raise exception using errcode = '22023', message = 'AUTH_DB_032_TECHNICAL_FAILURE_IDENTITY_INVALID';
  end if;

  begin
    v_occurred_at := (p_failure ->> 'occurred_at')::timestamptz;
    v_retry_count := coalesce((p_failure ->> 'retry_count')::integer, 0);
    v_retry_budget := coalesce((p_failure ->> 'retry_budget')::integer, 0);
    v_duration := coalesce((p_failure ->> 'duration_ms')::bigint, 0);
  exception when others then
    raise exception using errcode = '22023', message = 'AUTH_DB_032_TECHNICAL_FAILURE_NUMERIC_OR_TIME_INVALID';
  end;

  if v_recorded_at < v_occurred_at
     or v_retry_count < 0
     or v_retry_budget < 0
     or v_retry_count > v_retry_budget
     or v_duration < 0 then
    raise exception using errcode = '22023', message = 'AUTH_DB_032_TECHNICAL_FAILURE_INVARIANT_INVALID';
  end if;

  if p_failure ->> 'request_source' not in ('SERVER_ACTION', 'RPC', 'RLS', 'API', 'UI_GUARD', 'JOB')
     or p_failure ->> 'operation_kind' not in ('READ', 'CREATE', 'UPDATE', 'DELETE', 'EXECUTE', 'TRANSITION', 'EXPORT', 'APP_ACCESS') then
    raise exception using errcode = '22023', message = 'AUTH_DB_032_TECHNICAL_FAILURE_REQUEST_INVALID';
  end if;

  v_fingerprint := 'sha256:' || pg_catalog.encode(
    extensions.digest(
      app_private.canonicalize_authorization_payload(
        pg_catalog.jsonb_build_object(
          'evaluation_attempt_id', v_attempt_id,
          'correlation_id', p_failure ->> 'correlation_id',
          'support_code', p_failure ->> 'support_code',
          'request_source', p_failure ->> 'request_source',
          'consumer_id', p_failure ->> 'consumer_id',
          'app_code', p_failure ->> 'app_code',
          'permission_key', p_failure ->> 'permission_key',
          'operation_kind', p_failure ->> 'operation_kind',
          'failure_stage', p_failure ->> 'failure_stage',
          'private_failure_family', p_failure ->> 'private_failure_family',
          'sanitized_provider_code', p_failure ->> 'sanitized_provider_code',
          'source_status', 'UNAVAILABLE',
          'retry_count', v_retry_count,
          'retry_budget', v_retry_budget,
          'duration_ms', v_duration,
          'source_versions', coalesce(p_failure -> 'source_versions', '{}'::jsonb),
          'source_fingerprints', coalesce(p_failure -> 'source_fingerprints', '{}'::jsonb),
          'session_preserved', true,
          'effects_committed', false,
          'occurred_at', pg_catalog.to_char(v_occurred_at at time zone 'UTC', 'YYYY-MM-DD"T"HH24:MI:SS.MS"Z"')
        )
      ),
      'sha256'
    ),
    'hex'
  );

  insert into audit.authorization_evaluation_failures (
    evaluation_attempt_id,
    correlation_id,
    support_code,
    request_source,
    consumer_id,
    app_code,
    permission_key,
    operation_kind,
    failure_stage,
    private_failure_family,
    sanitized_provider_code,
    source_status,
    retry_count,
    retry_budget,
    duration_ms,
    source_versions,
    source_fingerprints,
    session_preserved,
    effects_committed,
    occurred_at,
    recorded_at,
    failure_fingerprint,
    sensitivity_class,
    retention_class
  ) values (
    v_attempt_id,
    nullif(p_failure ->> 'correlation_id', ''),
    p_failure ->> 'support_code',
    p_failure ->> 'request_source',
    nullif(p_failure ->> 'consumer_id', ''),
    p_failure ->> 'app_code',
    nullif(p_failure ->> 'permission_key', ''),
    p_failure ->> 'operation_kind',
    p_failure ->> 'failure_stage',
    p_failure ->> 'private_failure_family',
    nullif(p_failure ->> 'sanitized_provider_code', ''),
    'UNAVAILABLE',
    v_retry_count,
    v_retry_budget,
    v_duration,
    coalesce(p_failure -> 'source_versions', '{}'::jsonb),
    coalesce(p_failure -> 'source_fingerprints', '{}'::jsonb),
    true,
    false,
    v_occurred_at,
    v_recorded_at,
    v_fingerprint,
    'FUNCTIONAL_SENSITIVE',
    'RET_OBLIGATION'
  )
  on conflict (evaluation_attempt_id) do nothing;

  if not found then
    select f.failure_fingerprint
    into v_existing_fingerprint
    from audit.authorization_evaluation_failures f
    where f.evaluation_attempt_id = v_attempt_id;
    if v_existing_fingerprint is distinct from v_fingerprint then
      raise exception using errcode = '23505', message = 'AUTH_DB_032_TECHNICAL_FAILURE_INTEGRITY_CONFLICT';
    end if;
  end if;

  return v_attempt_id;
end
$auth_db_032_append_failure$;

create or replace function audit.append_authorization_evaluation_failure_attempt(
  p_attempt jsonb
)
returns text
language plpgsql
volatile
security definer
strict
set search_path = pg_catalog, audit, app_private
as $auth_db_032_append_failure_attempt$
declare
  v_attempt_id text;
  v_ordinal integer;
  v_started_at timestamptz;
  v_completed_at timestamptz;
  v_duration bigint;
  v_retry_after integer;
  v_retry_budget integer;
  v_max_ordinal integer;
  v_fingerprint text;
  v_existing_fingerprint text;
begin
  if pg_catalog.jsonb_typeof(p_attempt) <> 'object' then
    raise exception using errcode = '22023', message = 'AUTH_DB_032_FAILURE_ATTEMPT_INVALID';
  end if;

  v_attempt_id := nullif(p_attempt ->> 'evaluation_attempt_id', '');
  begin
    v_ordinal := (p_attempt ->> 'attempt_ordinal')::integer;
    v_started_at := (p_attempt ->> 'started_at')::timestamptz;
    v_completed_at := (p_attempt ->> 'completed_at')::timestamptz;
    v_duration := (p_attempt ->> 'duration_ms')::bigint;
    v_retry_after := case when p_attempt ->> 'retry_after_seconds' is null then null else (p_attempt ->> 'retry_after_seconds')::integer end;
  exception when others then
    raise exception using errcode = '22023', message = 'AUTH_DB_032_FAILURE_ATTEMPT_NUMERIC_OR_TIME_INVALID';
  end;

  if v_attempt_id is null
     or v_ordinal < 1
     or nullif(p_attempt ->> 'source_key', '') is null
     or nullif(p_attempt ->> 'attempt_result', '') is null
     or v_completed_at < v_started_at
     or v_duration < 0
     or (v_retry_after is not null and v_retry_after < 0) then
    raise exception using errcode = '22023', message = 'AUTH_DB_032_FAILURE_ATTEMPT_INVARIANT_INVALID';
  end if;

  select f.retry_budget
  into v_retry_budget
  from audit.authorization_evaluation_failures f
  where f.evaluation_attempt_id = v_attempt_id;
  if not found then
    raise exception using errcode = '23503', message = 'AUTH_DB_032_FAILURE_ATTEMPT_PARENT_MISSING';
  end if;
  if v_ordinal > v_retry_budget + 1 then
    raise exception using errcode = '22023', message = 'AUTH_DB_032_FAILURE_ATTEMPT_BUDGET_EXCEEDED';
  end if;

  v_fingerprint := 'sha256:' || pg_catalog.encode(
    extensions.digest(
      app_private.canonicalize_authorization_payload(
        pg_catalog.jsonb_build_object(
          'evaluation_attempt_id', v_attempt_id,
          'attempt_ordinal', v_ordinal,
          'source_key', p_attempt ->> 'source_key',
          'started_at', pg_catalog.to_char(v_started_at at time zone 'UTC', 'YYYY-MM-DD"T"HH24:MI:SS.MS"Z"'),
          'completed_at', pg_catalog.to_char(v_completed_at at time zone 'UTC', 'YYYY-MM-DD"T"HH24:MI:SS.MS"Z"'),
          'duration_ms', v_duration,
          'sanitized_provider_code', p_attempt ->> 'sanitized_provider_code',
          'retryable', coalesce((p_attempt ->> 'retryable')::boolean, false),
          'retry_after_seconds', v_retry_after,
          'attempt_result', p_attempt ->> 'attempt_result'
        )
      ),
      'sha256'
    ),
    'hex'
  );

  select a.attempt_fingerprint
  into v_existing_fingerprint
  from audit.authorization_evaluation_failure_attempts a
  where a.evaluation_attempt_id = v_attempt_id
    and a.attempt_ordinal = v_ordinal;
  if found then
    if v_existing_fingerprint is distinct from v_fingerprint then
      raise exception using errcode = '23505', message = 'AUTH_DB_032_FAILURE_ATTEMPT_INTEGRITY_CONFLICT';
    end if;
    return v_attempt_id || ':' || v_ordinal::text;
  end if;

  select coalesce(pg_catalog.max(a.attempt_ordinal), 0)
  into v_max_ordinal
  from audit.authorization_evaluation_failure_attempts a
  where a.evaluation_attempt_id = v_attempt_id;
  if v_ordinal <> v_max_ordinal + 1 then
    raise exception using errcode = '22023', message = 'AUTH_DB_032_FAILURE_ATTEMPT_NON_MONOTONIC';
  end if;

  insert into audit.authorization_evaluation_failure_attempts (
    evaluation_attempt_id,
    attempt_ordinal,
    source_key,
    started_at,
    completed_at,
    duration_ms,
    sanitized_provider_code,
    retryable,
    retry_after_seconds,
    attempt_result,
    attempt_fingerprint
  ) values (
    v_attempt_id,
    v_ordinal,
    p_attempt ->> 'source_key',
    v_started_at,
    v_completed_at,
    v_duration,
    nullif(p_attempt ->> 'sanitized_provider_code', ''),
    coalesce((p_attempt ->> 'retryable')::boolean, false),
    v_retry_after,
    p_attempt ->> 'attempt_result',
    v_fingerprint
  );

  return v_attempt_id || ':' || v_ordinal::text;
end
$auth_db_032_append_failure_attempt$;

create or replace function audit.get_authorization_decision(
  p_decision_id text
)
returns jsonb
language sql
stable
strict
set search_path = pg_catalog, audit
as $auth_db_032_get_decision$
  select pg_catalog.to_jsonb(d)
  from audit.authorization_decisions d
  where d.decision_id = p_decision_id;
$auth_db_032_get_decision$;

create or replace function audit.list_authorization_decision_links(
  p_decision_id text
)
returns jsonb
language sql
stable
strict
set search_path = pg_catalog, audit
as $auth_db_032_list_links$
  select coalesce(
    pg_catalog.jsonb_agg(pg_catalog.to_jsonb(l) order by l.occurred_at, l.decision_link_id),
    '[]'::jsonb
  )
  from audit.authorization_decision_links l
  where l.decision_id = p_decision_id;
$auth_db_032_list_links$;

create or replace function audit.search_authorization_decisions(
  p_search jsonb
)
returns jsonb
language plpgsql
stable
strict
set search_path = pg_catalog, audit
as $auth_db_032_search_decisions$
declare
  v_limit integer;
  v_cursor_at timestamptz;
  v_cursor_id text;
  v_decided_from timestamptz;
  v_decided_to timestamptz;
  v_items jsonb;
  v_next_cursor jsonb;
begin
  if pg_catalog.jsonb_typeof(p_search) <> 'object' then
    raise exception using errcode = '22023', message = 'AUTH_DB_032_SEARCH_REQUEST_INVALID';
  end if;
  if exists (
    select 1
    from pg_catalog.jsonb_object_keys(p_search) k
    where k not in (
      'decision_id', 'correlation_id', 'actor_id', 'principal_id', 'device_id',
      'app_code', 'permission_key', 'resource_type', 'resource_id', 'outcome',
      'decided_from', 'decided_to', 'limit', 'cursor'
    )
  ) then
    raise exception using errcode = '22023', message = 'AUTH_DB_032_SEARCH_FILTER_FORBIDDEN';
  end if;
  if not (p_search ? 'limit') then
    raise exception using errcode = '22023', message = 'AUTH_DB_032_SEARCH_LIMIT_REQUIRED';
  end if;
  begin
    v_limit := (p_search ->> 'limit')::integer;
  exception when others then
    raise exception using errcode = '22023', message = 'AUTH_DB_032_SEARCH_LIMIT_INVALID';
  end;
  if v_limit < 1 or v_limit > 100 then
    raise exception using errcode = '22023', message = 'AUTH_DB_032_SEARCH_LIMIT_INVALID';
  end if;
  if p_search ? 'outcome' and p_search ->> 'outcome' not in ('ALLOW', 'DENY') then
    raise exception using errcode = '22023', message = 'AUTH_DB_032_SEARCH_OUTCOME_INVALID';
  end if;

  begin
    if nullif(p_search ->> 'decided_from', '') is not null then
      v_decided_from := (p_search ->> 'decided_from')::timestamptz;
    end if;
    if nullif(p_search ->> 'decided_to', '') is not null then
      v_decided_to := (p_search ->> 'decided_to')::timestamptz;
    end if;
    if p_search ? 'cursor' and p_search -> 'cursor' <> 'null'::jsonb then
      if pg_catalog.jsonb_typeof(p_search -> 'cursor') <> 'object'
         or nullif(p_search #>> '{cursor,decided_at}', '') is null
         or nullif(p_search #>> '{cursor,decision_id}', '') is null then
        raise exception 'CURSOR';
      end if;
      v_cursor_at := (p_search #>> '{cursor,decided_at}')::timestamptz;
      v_cursor_id := p_search #>> '{cursor,decision_id}';
    end if;
  exception when others then
    raise exception using errcode = '22023', message = 'AUTH_DB_032_SEARCH_TIME_OR_CURSOR_INVALID';
  end;

  with filtered as (
    select d.*
    from audit.authorization_decisions d
    where (nullif(p_search ->> 'decision_id', '') is null or d.decision_id = p_search ->> 'decision_id')
      and (nullif(p_search ->> 'correlation_id', '') is null or d.correlation_id = p_search ->> 'correlation_id')
      and (nullif(p_search ->> 'actor_id', '') is null or d.actor_id = p_search ->> 'actor_id')
      and (nullif(p_search ->> 'principal_id', '') is null or d.principal_id = p_search ->> 'principal_id')
      and (nullif(p_search ->> 'device_id', '') is null or d.device_id = p_search ->> 'device_id')
      and (nullif(p_search ->> 'app_code', '') is null or d.app_code = p_search ->> 'app_code')
      and (nullif(p_search ->> 'permission_key', '') is null or d.permission_key = p_search ->> 'permission_key')
      and (nullif(p_search ->> 'resource_type', '') is null or d.resource_type = p_search ->> 'resource_type')
      and (nullif(p_search ->> 'outcome', '') is null or d.outcome = p_search ->> 'outcome')
      and (v_decided_from is null or d.decided_at >= v_decided_from)
      and (v_decided_to is null or d.decided_at <= v_decided_to)
      and (
        nullif(p_search ->> 'resource_id', '') is null
        or exists (
          select 1
          from audit.authorization_decision_resources r
          where r.decision_id = d.decision_id
            and r.resource_type = coalesce(nullif(p_search ->> 'resource_type', ''), d.resource_type)
            and r.resource_id = p_search ->> 'resource_id'
        )
      )
      and (
        v_cursor_at is null
        or (d.decided_at, d.decision_id) < (v_cursor_at, v_cursor_id)
      )
    order by d.decided_at desc, d.decision_id desc
    limit v_limit + 1
  ), page_rows as (
    select * from filtered
    order by decided_at desc, decision_id desc
    limit v_limit
  )
  select
    coalesce(
      pg_catalog.jsonb_agg(
        pg_catalog.jsonb_build_object(
          'decision_id', d.decision_id,
          'decided_at', d.decided_at,
          'recorded_at', d.recorded_at,
          'correlation_id', d.correlation_id,
          'context_id', d.context_id,
          'principal_id', d.principal_id,
          'actor_id', d.actor_id,
          'device_id', d.device_id,
          'app_code', d.app_code,
          'permission_key', d.permission_key,
          'operation_kind', d.operation_kind,
          'request_source', d.request_source,
          'resource_type', d.resource_type,
          'resource_ids', d.resource_ids,
          'outcome', d.outcome,
          'authorizing_lanes', d.authorizing_lanes,
          'authorization_reason_codes', d.authorization_reason_codes,
          'context_fingerprint', d.context_fingerprint,
          'resource_fingerprint', d.resource_fingerprint,
          'catalog_hash', d.catalog_hash,
          'dataset_hashes', d.dataset_hashes,
          'evaluator_name', d.evaluator_name,
          'evaluator_version', d.evaluator_version,
          'evidence_storage_mode', d.evidence_storage_mode,
          'sensitivity_class', d.sensitivity_class,
          'retention_class', d.retention_class,
          'source_contract_sha256', d.source_contract_sha256,
          'decision_record_fingerprint', d.decision_record_fingerprint
        )
        order by d.decided_at desc, d.decision_id desc
      ),
      '[]'::jsonb
    ),
    case
      when (select pg_catalog.count(*) from filtered) > v_limit then (
        select pg_catalog.jsonb_build_object(
          'decided_at', pg_catalog.to_char(p.decided_at at time zone 'UTC', 'YYYY-MM-DD"T"HH24:MI:SS.MS"Z"'),
          'decision_id', p.decision_id
        )
        from page_rows p
        order by p.decided_at asc, p.decision_id asc
        limit 1
      )
      else null
    end
  into v_items, v_next_cursor
  from page_rows d;

  return pg_catalog.jsonb_build_object('items', v_items, 'next_cursor', v_next_cursor);
end
$auth_db_032_search_decisions$;

create or replace function app_private.evaluate_and_record_authorization(
  p_evaluation_request jsonb
)
returns jsonb
language plpgsql
volatile
security definer
strict
set search_path = pg_catalog, app_private, audit
as $auth_db_032_evaluate_and_record$
declare
  v_decision jsonb;
  v_recorded_id text;
begin
  v_decision := app_private.evaluate_authorization(p_evaluation_request);
  v_recorded_id := audit.append_authorization_decision(v_decision);
  if v_recorded_id is distinct from v_decision ->> 'decision_id' then
    raise exception using errcode = '55000', message = 'AUTH_DB_032_COORDINATOR_PERSISTENCE_ID_MISMATCH';
  end if;
  return v_decision;
end
$auth_db_032_evaluate_and_record$;

create or replace function api.get_safe_authorization_decision(
  p_evaluation_request jsonb
)
returns jsonb
language sql
volatile
security definer
set search_path = pg_catalog, app_private
as $auth_db_032_api_safe$
  select app_private.project_safe_authorization_decision(
    app_private.evaluate_and_record_authorization(p_evaluation_request)
  );
$auth_db_032_api_safe$;

-- Append-only trigger surface. The policy registry is intentionally excluded because
-- policy evolution requires governed state transitions rather than historical mutation.
drop trigger if exists trg_auth_db_032_authorization_decisions_append_only on audit.authorization_decisions;
create trigger trg_auth_db_032_authorization_decisions_append_only
before update or delete on audit.authorization_decisions
for each row execute function audit.reject_authorization_record_mutation();

drop trigger if exists trg_auth_db_032_authorization_decision_resources_append_only on audit.authorization_decision_resources;
create trigger trg_auth_db_032_authorization_decision_resources_append_only
before update or delete on audit.authorization_decision_resources
for each row execute function audit.reject_authorization_record_mutation();

drop trigger if exists trg_auth_db_032_authorization_decision_links_append_only on audit.authorization_decision_links;
create trigger trg_auth_db_032_authorization_decision_links_append_only
before update or delete on audit.authorization_decision_links
for each row execute function audit.reject_authorization_record_mutation();

drop trigger if exists trg_auth_db_032_authorization_evaluation_failures_append_only on audit.authorization_evaluation_failures;
create trigger trg_auth_db_032_authorization_evaluation_failures_append_only
before update or delete on audit.authorization_evaluation_failures
for each row execute function audit.reject_authorization_record_mutation();

drop trigger if exists trg_auth_db_032_authorization_evaluation_failure_attempts_append_only on audit.authorization_evaluation_failure_attempts;
create trigger trg_auth_db_032_authorization_evaluation_failure_attempts_append_only
before update or delete on audit.authorization_evaluation_failure_attempts
for each row execute function audit.reject_authorization_record_mutation();

alter table audit.authorization_decision_persistence_policies enable row level security;
alter table audit.authorization_decisions enable row level security;
alter table audit.authorization_decision_resources enable row level security;
alter table audit.authorization_decision_links enable row level security;
alter table audit.authorization_evaluation_failures enable row level security;
alter table audit.authorization_evaluation_failure_attempts enable row level security;

revoke all on table
  audit.authorization_decision_persistence_policies,
  audit.authorization_decisions,
  audit.authorization_decision_resources,
  audit.authorization_decision_links,
  audit.authorization_evaluation_failures,
  audit.authorization_evaluation_failure_attempts
from public, anon, authenticated, service_role;

revoke all on function
  audit.append_authorization_decision(jsonb),
  audit.append_authorization_decision_link(jsonb),
  audit.append_authorization_evaluation_failure(jsonb),
  audit.append_authorization_evaluation_failure_attempt(jsonb),
  audit.get_authorization_decision(text),
  audit.search_authorization_decisions(jsonb),
  audit.list_authorization_decision_links(text),
  audit.reject_authorization_record_mutation(),
  app_private.resolve_authorization_persistence_profile(jsonb),
  app_private.evaluate_and_record_authorization(jsonb)
from public, anon, authenticated, service_role;

revoke all on function api.get_safe_authorization_decision(jsonb)
from public, anon, authenticated, service_role;

grant execute on function
  audit.append_authorization_decision(jsonb),
  audit.append_authorization_decision_link(jsonb),
  audit.append_authorization_evaluation_failure(jsonb),
  audit.append_authorization_evaluation_failure_attempt(jsonb),
  audit.get_authorization_decision(text),
  audit.search_authorization_decisions(jsonb),
  audit.list_authorization_decision_links(text),
  app_private.resolve_authorization_persistence_profile(jsonb),
  app_private.evaluate_and_record_authorization(jsonb)
to postgres;

grant select on table
  audit.authorization_decision_persistence_policies,
  audit.authorization_decisions,
  audit.authorization_decision_resources,
  audit.authorization_decision_links,
  audit.authorization_evaluation_failures,
  audit.authorization_evaluation_failure_attempts
to postgres;

grant execute on function api.get_safe_authorization_decision(jsonb) to authenticated;

reset role;

revoke all on schema audit from public, anon, authenticated, service_role;

do $auth_db_032_postconditions$
declare
  v_count bigint;
  v_wrapper text;
  v_policy text;
begin
  select pg_catalog.count(*) into v_count
  from pg_catalog.pg_class c
  join pg_catalog.pg_namespace n on n.oid = c.relnamespace
  where n.nspname = 'audit'
    and c.relname in (
      'authorization_decision_persistence_policies',
      'authorization_decisions',
      'authorization_decision_resources',
      'authorization_decision_links',
      'authorization_evaluation_failures',
      'authorization_evaluation_failure_attempts'
    )
    and c.relkind in ('r', 'p');
  if v_count <> 6 then
    raise exception 'AUTH_DB_032_TABLE_INVENTORY_INVALID:%', v_count;
  end if;

  select pg_catalog.count(*) into v_count
  from audit.authorization_decision_persistence_policies
  where status = 'ACTIVE';
  if v_count <> 8 then
    raise exception 'AUTH_DB_032_ACTIVE_POLICY_COUNT_INVALID:%', v_count;
  end if;

  if exists (
    select 1
    from pg_catalog.pg_class c
    join pg_catalog.pg_namespace n on n.oid = c.relnamespace
    where n.nspname = 'audit'
      and c.relname in (
        'authorization_decision_persistence_policies',
        'authorization_decisions',
        'authorization_decision_resources',
        'authorization_decision_links',
        'authorization_evaluation_failures',
        'authorization_evaluation_failure_attempts'
      )
      and (not c.relrowsecurity or c.relforcerowsecurity)
  ) then
    raise exception 'AUTH_DB_032_RLS_POSTURE_INVALID';
  end if;

  if exists (
    select 1
    from pg_catalog.pg_class c
    join pg_catalog.pg_namespace n on n.oid = c.relnamespace
    where n.nspname = 'audit'
      and c.relname in (
        'authorization_decision_persistence_policies',
        'authorization_decisions',
        'authorization_decision_resources',
        'authorization_decision_links',
        'authorization_evaluation_failures',
        'authorization_evaluation_failure_attempts'
      )
      and (
        pg_catalog.has_table_privilege('anon', c.oid, 'SELECT')
        or pg_catalog.has_table_privilege('authenticated', c.oid, 'SELECT')
        or pg_catalog.has_table_privilege('service_role', c.oid, 'SELECT')
        or pg_catalog.has_table_privilege('anon', c.oid, 'INSERT')
        or pg_catalog.has_table_privilege('authenticated', c.oid, 'INSERT')
        or pg_catalog.has_table_privilege('service_role', c.oid, 'INSERT')
        or pg_catalog.has_table_privilege('anon', c.oid, 'UPDATE')
        or pg_catalog.has_table_privilege('authenticated', c.oid, 'UPDATE')
        or pg_catalog.has_table_privilege('service_role', c.oid, 'UPDATE')
        or pg_catalog.has_table_privilege('anon', c.oid, 'DELETE')
        or pg_catalog.has_table_privilege('authenticated', c.oid, 'DELETE')
        or pg_catalog.has_table_privilege('service_role', c.oid, 'DELETE')
      )
  ) then
    raise exception 'AUTH_DB_032_CLIENT_TABLE_PRIVILEGE_LEAK';
  end if;

  select pg_catalog.pg_get_functiondef('api.get_safe_authorization_decision(jsonb)'::regprocedure)
  into v_wrapper;
  if v_wrapper not ilike '%evaluate_and_record_authorization%'
     or v_wrapper ilike '%evaluate_authorization(%' then
    raise exception 'AUTH_DB_032_SAFE_WRAPPER_ROUTE_INVALID';
  end if;

  select pg_catalog.pg_get_functiondef('app_private.authorization_policy_allows(jsonb)'::regprocedure)
  into v_policy;
  if v_policy ilike '%evaluate_and_record_authorization%'
     or v_policy not ilike '%evaluate_authorization%'
  then
    raise exception 'AUTH_DB_032_RLS_PREDICATE_SIDE_EFFECT_DRIFT';
  end if;
end
$auth_db_032_postconditions$;

commit;
