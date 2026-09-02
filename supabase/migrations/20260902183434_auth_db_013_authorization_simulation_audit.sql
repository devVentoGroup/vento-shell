-- AUTH-DB-013::GLOBAL
-- Canonical append-only authorization simulation audit foundation.
-- source_contract_sha256 = 4ec891da4fdf4bc85ccc3a2084f50add7d7957fcb53e28a949039eb2f79075a7
-- This file is migration CONTENT only. The repository migration filename must be created by Supabase CLI.
-- AUTH-SRV-015 remains responsible for the authoritative simulation service and client-facing contracts.
-- Legacy context-simulation objects remain NOT_ADOPTED as canonical persistence.
-- Their consumed signatures are preserved only as fail-closed compatibility while simulated authority is neutralized.
-- No hosted Supabase target is mutated directly by this migration authoring flow.

begin;

do $auth_db_013_preconditions$
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
    raise exception 'AUTH_DB_013_AUTHORIZATION_OWNER_MISSING_OR_UNSAFE';
  end if;

  if pg_catalog.to_regnamespace('audit') is null
     or pg_catalog.to_regnamespace('app_private') is null
     or pg_catalog.to_regnamespace('extensions') is null then
    raise exception 'AUTH_DB_013_REQUIRED_SCHEMA_MISSING';
  end if;

  if pg_catalog.to_regclass('audit.authorization_decisions') is null then
    raise exception 'AUTH_DB_013_AUTHORIZATION_DECISION_STORE_MISSING';
  end if;

  if pg_catalog.to_regclass('public.context_simulation_sessions') is null
     or pg_catalog.to_regprocedure('public.can_manage_context_simulation_v1(uuid)') is null
     or pg_catalog.to_regprocedure('public.get_active_context_simulation_v1()') is null
     or pg_catalog.to_regprocedure('public.get_effective_context_v1(text)') is null
     or pg_catalog.to_regprocedure('public.has_effective_permission_v1(text,text)') is null
     or pg_catalog.to_regprocedure('public.start_context_simulation_v1(uuid,uuid,text,text,integer,jsonb)') is null
     or pg_catalog.to_regprocedure('public.stop_context_simulation_v1()') is null then
    raise exception 'AUTH_DB_013_LEGACY_SIMULATION_SURFACE_MISSING';
  end if;

  if (select pg_catalog.count(*) from public.context_simulation_sessions) <> 0 then
    raise exception 'AUTH_DB_013_LEGACY_ROWS_REQUIRE_RECONCILIATION';
  end if;
  raise notice 'AUTH_DB_013_LEGACY_ROW_COUNT: 0';

  if pg_catalog.to_regprocedure('app_private.canonicalize_authorization_payload(jsonb)') is null
     or pg_catalog.to_regprocedure('extensions.digest(text,text)') is null
     or pg_catalog.to_regprocedure('extensions.gen_random_uuid()') is null then
    raise exception 'AUTH_DB_013_CANONICAL_FINGERPRINT_GRAPH_MISSING';
  end if;

  if not exists (
    select 1
    from pg_catalog.pg_class c
    where c.oid = 'audit.authorization_decisions'::regclass
      and pg_catalog.pg_get_userbyid(c.relowner) = 'vento_authorization_owner'
  ) then
    raise exception 'AUTH_DB_013_AUTHORIZATION_DECISION_OWNER_DRIFT';
  end if;

  if exists (
    select 1
    from pg_catalog.pg_class c
    join pg_catalog.pg_namespace n on n.oid = c.relnamespace
    where n.nspname = 'audit'
      and c.relname in (
        'authorization_simulations',
        'authorization_simulation_revisions',
        'authorization_simulation_evaluations',
        'authorization_simulation_events',
        'authorization_simulation_attempts',
        'authorization_simulation_links',
        'authorization_simulation_corrections'
      )
  ) then
    raise exception 'AUTH_DB_013_TARGET_RELATION_ALREADY_EXISTS';
  end if;

  if exists (
    select 1
    from pg_catalog.pg_proc p
    join pg_catalog.pg_namespace n on n.oid = p.pronamespace
    where n.nspname = 'app_private'
      and p.proname in (
        'canonicalize_authorization_simulation',
        'fingerprint_authorization_simulation',
        'derive_authorization_simulation_status',
        'append_authorization_simulation',
        'append_authorization_simulation_revision',
        'append_authorization_simulation_evaluation',
        'append_authorization_simulation_event',
        'append_authorization_simulation_attempt',
        'link_authorization_simulation_evidence',
        'correct_authorization_simulation_audit',
        'reject_authorization_simulation_audit_mutation'
      )
  ) then
    raise exception 'AUTH_DB_013_TARGET_FUNCTION_ALREADY_EXISTS';
  end if;
end
$auth_db_013_preconditions$;

grant usage, create on schema audit, app_private to vento_authorization_owner;
grant usage on schema extensions to vento_authorization_owner;
grant execute on function extensions.digest(text, text), extensions.gen_random_uuid() to vento_authorization_owner;

set local role vento_authorization_owner;

alter default privileges in schema audit revoke all on tables from public;
alter default privileges in schema audit revoke execute on functions from public;
alter default privileges in schema app_private revoke execute on functions from public;

create table audit.authorization_simulations (
  simulation_id uuid primary key,
  contract_name text not null,
  contract_version text not null,
  schema_version text not null,
  created_at timestamptz not null,
  expires_at timestamptz not null,
  purpose_code text not null,
  reason_code text not null,
  justification_reference text,
  real_principal_id text not null,
  real_actor_id text not null,
  real_employee_id text not null,
  technical_principal_id text not null,
  real_session_reference text not null,
  real_access_context_id text not null,
  real_access_context_fingerprint text not null,
  requester_authorization_decision_id text not null,
  initial_revision_id uuid not null,
  correlation_id text not null,
  causation_id text,
  creation_idempotency_key text not null,
  request_fingerprint text not null,
  recorded_at timestamptz not null default pg_catalog.statement_timestamp(),
  source_versions jsonb not null,
  source_fingerprints jsonb not null,
  root_fingerprint text not null,
  source_contract_sha256 text not null,
  constraint uq_authorization_simulations_idempotency
    unique (real_actor_id, real_session_reference, creation_idempotency_key),
  constraint fk_authorization_simulations_requester_decision
    foreign key (requester_authorization_decision_id)
    references audit.authorization_decisions(decision_id),
  constraint ck_authorization_simulations_contract
    check (contract_name = 'SimulationContext' and contract_version = '1.0.0' and schema_version = '1.0.0'),
  constraint ck_authorization_simulations_lifetime
    check (expires_at > created_at and recorded_at >= created_at),
  constraint ck_authorization_simulations_purpose
    check (purpose_code ~ '^[A-Z][A-Z0-9_]{2,127}$' and reason_code ~ '^[A-Z][A-Z0-9_]{2,127}$'),
  constraint ck_authorization_simulations_context_fingerprint
    check (real_access_context_fingerprint ~ '^sha256:[0-9a-f]{64}$'),
  constraint ck_authorization_simulations_source_versions
    check (pg_catalog.jsonb_typeof(source_versions) = 'object'),
  constraint ck_authorization_simulations_source_fingerprints
    check (pg_catalog.jsonb_typeof(source_fingerprints) = 'object'),
  constraint ck_authorization_simulations_request_fingerprint
    check (request_fingerprint ~ '^sha256:[0-9a-f]{64}$'),
  constraint ck_authorization_simulations_root_fingerprint
    check (root_fingerprint ~ '^sha256:[0-9a-f]{64}$'),
  constraint ck_authorization_simulations_source_contract
    check (source_contract_sha256 = '4ec891da4fdf4bc85ccc3a2084f50add7d7957fcb53e28a949039eb2f79075a7')
);

create table audit.authorization_simulation_revisions (
  simulation_revision_id uuid primary key,
  simulation_id uuid not null,
  revision_number integer not null,
  created_at timestamptz not null,
  created_by_real_actor_id text not null,
  requester_authorization_decision_id text not null,
  scenario_kind text not null,
  simulated_subject jsonb not null,
  simulated_role jsonb,
  simulated_site jsonb,
  simulated_area jsonb,
  simulated_shift jsonb,
  simulated_checkin jsonb,
  simulated_resource jsonb,
  simulated_resolved_at timestamptz not null,
  policy_snapshot jsonb not null,
  source_versions jsonb not null,
  source_fingerprints jsonb not null,
  scenario_fingerprint text not null,
  recorded_at timestamptz not null default pg_catalog.statement_timestamp(),
  source_contract_sha256 text not null,
  constraint fk_authorization_simulation_revisions_root
    foreign key (simulation_id) references audit.authorization_simulations(simulation_id),
  constraint fk_authorization_simulation_revisions_decision
    foreign key (requester_authorization_decision_id) references audit.authorization_decisions(decision_id),
  constraint uq_authorization_simulation_revisions_number unique (simulation_id, revision_number),
  constraint ck_authorization_simulation_revisions_number check (revision_number > 0),
  constraint ck_authorization_simulation_revisions_scenario_kind
    check (scenario_kind ~ '^[A-Z][A-Z0-9_]{2,127}$'),
  constraint ck_authorization_simulation_revisions_shapes
    check (
      pg_catalog.jsonb_typeof(simulated_subject) = 'object'
      and (simulated_role is null or pg_catalog.jsonb_typeof(simulated_role) = 'object')
      and (simulated_site is null or pg_catalog.jsonb_typeof(simulated_site) = 'object')
      and (simulated_area is null or pg_catalog.jsonb_typeof(simulated_area) = 'object')
      and (simulated_shift is null or pg_catalog.jsonb_typeof(simulated_shift) = 'object')
      and (simulated_checkin is null or pg_catalog.jsonb_typeof(simulated_checkin) = 'object')
      and (simulated_resource is null or pg_catalog.jsonb_typeof(simulated_resource) = 'object')
      and pg_catalog.jsonb_typeof(policy_snapshot) = 'object'
      and pg_catalog.jsonb_typeof(source_versions) = 'object'
      and pg_catalog.jsonb_typeof(source_fingerprints) = 'object'
    ),
  constraint ck_authorization_simulation_revisions_fingerprint
    check (scenario_fingerprint ~ '^sha256:[0-9a-f]{64}$'),
  constraint ck_authorization_simulation_revisions_time check (recorded_at >= created_at),
  constraint ck_authorization_simulation_revisions_source_contract
    check (source_contract_sha256 = '4ec891da4fdf4bc85ccc3a2084f50add7d7957fcb53e28a949039eb2f79075a7')
);

alter table audit.authorization_simulations
  add constraint fk_authorization_simulations_initial_revision
  foreign key (initial_revision_id)
  references audit.authorization_simulation_revisions(simulation_revision_id)
  deferrable initially deferred;

create table audit.authorization_simulation_evaluations (
  simulated_decision_id uuid primary key,
  simulation_id uuid not null,
  simulation_revision_id uuid not null,
  requester_authorization_decision_id text not null,
  evaluation_request_id text not null,
  evaluated_at timestamptz not null,
  app_code text not null,
  permission_key text not null,
  simulation_requirement text not null,
  resource_scenario_id text,
  hypothetical_context_id text not null,
  outcome text not null,
  reason_codes text[] not null,
  executable boolean not null default false,
  scenario_fingerprint text not null,
  authorization_contract_version text not null,
  catalog_version text not null,
  source_versions jsonb not null,
  source_fingerprints jsonb not null,
  request_fingerprint text not null,
  evaluation_fingerprint text not null,
  recorded_at timestamptz not null default pg_catalog.statement_timestamp(),
  source_contract_sha256 text not null,
  constraint fk_authorization_simulation_evaluations_root
    foreign key (simulation_id) references audit.authorization_simulations(simulation_id),
  constraint fk_authorization_simulation_evaluations_revision
    foreign key (simulation_revision_id) references audit.authorization_simulation_revisions(simulation_revision_id),
  constraint fk_authorization_simulation_evaluations_decision
    foreign key (requester_authorization_decision_id) references audit.authorization_decisions(decision_id),
  constraint uq_authorization_simulation_evaluations_request unique (simulation_revision_id, evaluation_request_id),
  constraint ck_authorization_simulation_evaluations_permission
    check (permission_key ~ '^[a-z0-9][a-z0-9_.:-]*$' and permission_key !~ '[*%]'),
  constraint ck_authorization_simulation_evaluations_requirement
    check (simulation_requirement in ('FULL_PREVIEW', 'DECISION_ONLY', 'NOT_ALLOWED')),
  constraint ck_authorization_simulation_evaluations_outcome
    check (outcome in ('WOULD_ALLOW', 'WOULD_DENY', 'INDETERMINATE')),
  constraint ck_authorization_simulation_evaluations_not_executable check (not executable),
  constraint ck_authorization_simulation_evaluations_reasons
    check (pg_catalog.cardinality(reason_codes) > 0 and pg_catalog.array_position(reason_codes, null) is null),
  constraint ck_authorization_simulation_evaluations_fingerprints
    check (
      scenario_fingerprint ~ '^sha256:[0-9a-f]{64}$'
      and request_fingerprint ~ '^sha256:[0-9a-f]{64}$'
      and evaluation_fingerprint ~ '^sha256:[0-9a-f]{64}$'
    ),
  constraint ck_authorization_simulation_evaluations_sources
    check (pg_catalog.jsonb_typeof(source_versions) = 'object' and pg_catalog.jsonb_typeof(source_fingerprints) = 'object'),
  constraint ck_authorization_simulation_evaluations_time check (recorded_at >= evaluated_at),
  constraint ck_authorization_simulation_evaluations_source_contract
    check (source_contract_sha256 = '4ec891da4fdf4bc85ccc3a2084f50add7d7957fcb53e28a949039eb2f79075a7')
);

create table audit.authorization_simulation_events (
  event_id uuid primary key,
  simulation_id uuid not null,
  simulation_revision_id uuid,
  simulated_decision_id uuid,
  event_type text not null,
  operation_id text not null,
  real_actor_id text,
  technical_principal_id text not null,
  authorization_decision_id text,
  reason_code text not null,
  correlation_id text not null,
  causation_id text,
  occurred_at timestamptz not null,
  recorded_at timestamptz not null default pg_catalog.statement_timestamp(),
  operation_fingerprint text not null,
  event_fingerprint text not null,
  source_contract_sha256 text not null,
  constraint fk_authorization_simulation_events_root
    foreign key (simulation_id) references audit.authorization_simulations(simulation_id),
  constraint fk_authorization_simulation_events_revision
    foreign key (simulation_revision_id) references audit.authorization_simulation_revisions(simulation_revision_id),
  constraint fk_authorization_simulation_events_evaluation
    foreign key (simulated_decision_id) references audit.authorization_simulation_evaluations(simulated_decision_id),
  constraint fk_authorization_simulation_events_decision
    foreign key (authorization_decision_id) references audit.authorization_decisions(decision_id),
  constraint uq_authorization_simulation_events_operation unique (simulation_id, operation_id),
  constraint ck_authorization_simulation_events_type
    check (event_type in (
      'SIMULATION_CREATED', 'SIMULATION_ACTIVATED', 'SIMULATION_REVISED', 'SIMULATION_EVALUATED',
      'SIMULATION_COMPLETED', 'SIMULATION_EXPIRED', 'SIMULATION_REVOKED',
      'SIMULATION_INVALIDATED', 'SIMULATION_CORRECTION_LINKED'
    )),
  constraint ck_authorization_simulation_events_reason check (reason_code ~ '^[A-Z][A-Z0-9_]{2,127}$'),
  constraint ck_authorization_simulation_events_fingerprints
    check (operation_fingerprint ~ '^sha256:[0-9a-f]{64}$' and event_fingerprint ~ '^sha256:[0-9a-f]{64}$'),
  constraint ck_authorization_simulation_events_time check (recorded_at >= occurred_at),
  constraint ck_authorization_simulation_events_source_contract
    check (source_contract_sha256 = '4ec891da4fdf4bc85ccc3a2084f50add7d7957fcb53e28a949039eb2f79075a7')
);

create unique index uq_authorization_simulation_terminal_event
  on audit.authorization_simulation_events (simulation_id)
  where event_type in ('SIMULATION_COMPLETED', 'SIMULATION_EXPIRED', 'SIMULATION_REVOKED', 'SIMULATION_INVALIDATED');

create table audit.authorization_simulation_attempts (
  attempt_id uuid primary key,
  simulation_id uuid,
  occurred_at timestamptz not null,
  recorded_at timestamptz not null default pg_catalog.statement_timestamp(),
  real_principal_id text,
  real_actor_id text,
  technical_principal_id text not null,
  real_session_reference text,
  authorization_decision_id text,
  operation_kind text not null,
  attempt_result text not null,
  reason_code text not null,
  error_class text,
  result_reference text,
  correlation_id text not null,
  causation_id text,
  request_fingerprint text not null,
  source_versions jsonb not null,
  source_fingerprints jsonb not null,
  attempt_fingerprint text not null,
  source_contract_sha256 text not null,
  constraint fk_authorization_simulation_attempts_root
    foreign key (simulation_id) references audit.authorization_simulations(simulation_id),
  constraint fk_authorization_simulation_attempts_decision
    foreign key (authorization_decision_id) references audit.authorization_decisions(decision_id),
  constraint ck_authorization_simulation_attempts_operation
    check (operation_kind in (
      'CREATE_SIMULATION', 'ACTIVATE_SIMULATION', 'REVISE_SIMULATION', 'EVALUATE_SIMULATION',
      'COMPLETE_SIMULATION', 'EXPIRE_SIMULATION', 'REVOKE_SIMULATION', 'INVALIDATE_SIMULATION',
      'CORRECT_AUDIT', 'LINK_EVIDENCE'
    )),
  constraint ck_authorization_simulation_attempts_result
    check (attempt_result in ('DENIED', 'INVALID', 'CONFLICT', 'TECHNICAL_FAILURE', 'NO_CHANGE', 'ROLLED_BACK')),
  constraint ck_authorization_simulation_attempts_reason check (reason_code ~ '^[A-Z][A-Z0-9_]{2,127}$'),
  constraint ck_authorization_simulation_attempts_result_fields
    check (
      (attempt_result <> 'TECHNICAL_FAILURE' or error_class is not null)
      and (attempt_result <> 'ROLLED_BACK' or result_reference is not null)
    ),
  constraint ck_authorization_simulation_attempts_fingerprints
    check (request_fingerprint ~ '^sha256:[0-9a-f]{64}$' and attempt_fingerprint ~ '^sha256:[0-9a-f]{64}$'),
  constraint ck_authorization_simulation_attempts_sources
    check (pg_catalog.jsonb_typeof(source_versions) = 'object' and pg_catalog.jsonb_typeof(source_fingerprints) = 'object'),
  constraint ck_authorization_simulation_attempts_time check (recorded_at >= occurred_at),
  constraint ck_authorization_simulation_attempts_source_contract
    check (source_contract_sha256 = '4ec891da4fdf4bc85ccc3a2084f50add7d7957fcb53e28a949039eb2f79075a7')
);

create table audit.authorization_simulation_links (
  simulation_link_id uuid primary key,
  simulation_id uuid not null,
  simulation_revision_id uuid,
  simulated_decision_id uuid,
  link_kind text not null,
  reference_type text not null,
  reference_id text not null,
  correlation_id text,
  causation_id text,
  occurred_at timestamptz not null,
  recorded_at timestamptz not null default pg_catalog.statement_timestamp(),
  link_fingerprint text not null,
  source_contract_sha256 text not null,
  constraint fk_authorization_simulation_links_root
    foreign key (simulation_id) references audit.authorization_simulations(simulation_id),
  constraint fk_authorization_simulation_links_revision
    foreign key (simulation_revision_id) references audit.authorization_simulation_revisions(simulation_revision_id),
  constraint fk_authorization_simulation_links_evaluation
    foreign key (simulated_decision_id) references audit.authorization_simulation_evaluations(simulated_decision_id),
  constraint uq_authorization_simulation_links_reference
    unique nulls not distinct (simulation_id, simulation_revision_id, simulated_decision_id, link_kind, reference_type, reference_id),
  constraint ck_authorization_simulation_links_kind
    check (link_kind in (
      'REQUESTER_AUTHORIZATION_DECISION', 'REAL_ACCESS_CONTEXT', 'REAL_AUTH_SESSION', 'DEVICE_CONTEXT',
      'SIMULATED_EVALUATION', 'RESOURCE_REFERENCE', 'EVIDENCE_REFERENCE', 'CORRECTION'
    )),
  constraint ck_authorization_simulation_links_reference
    check (pg_catalog.length(pg_catalog.btrim(reference_type)) > 0 and pg_catalog.length(pg_catalog.btrim(reference_id)) > 0),
  constraint ck_authorization_simulation_links_fingerprint check (link_fingerprint ~ '^sha256:[0-9a-f]{64}$'),
  constraint ck_authorization_simulation_links_time check (recorded_at >= occurred_at),
  constraint ck_authorization_simulation_links_source_contract
    check (source_contract_sha256 = '4ec891da4fdf4bc85ccc3a2084f50add7d7957fcb53e28a949039eb2f79075a7')
);

create table audit.authorization_simulation_corrections (
  correction_id uuid primary key,
  simulation_id uuid not null,
  target_kind text not null,
  target_id text not null,
  reason_code text not null,
  real_actor_id text not null,
  technical_principal_id text not null,
  authorization_decision_id text not null,
  correction_payload jsonb not null,
  correlation_id text not null,
  causation_id text,
  occurred_at timestamptz not null,
  recorded_at timestamptz not null default pg_catalog.statement_timestamp(),
  correction_fingerprint text not null,
  source_contract_sha256 text not null,
  constraint fk_authorization_simulation_corrections_root
    foreign key (simulation_id) references audit.authorization_simulations(simulation_id),
  constraint fk_authorization_simulation_corrections_decision
    foreign key (authorization_decision_id) references audit.authorization_decisions(decision_id),
  constraint ck_authorization_simulation_corrections_target
    check (target_kind in ('ROOT', 'REVISION', 'EVALUATION', 'EVENT', 'ATTEMPT', 'LINK')),
  constraint ck_authorization_simulation_corrections_reason check (reason_code ~ '^[A-Z][A-Z0-9_]{2,127}$'),
  constraint ck_authorization_simulation_corrections_payload check (pg_catalog.jsonb_typeof(correction_payload) = 'object'),
  constraint ck_authorization_simulation_corrections_fingerprint check (correction_fingerprint ~ '^sha256:[0-9a-f]{64}$'),
  constraint ck_authorization_simulation_corrections_time check (recorded_at >= occurred_at),
  constraint ck_authorization_simulation_corrections_source_contract
    check (source_contract_sha256 = '4ec891da4fdf4bc85ccc3a2084f50add7d7957fcb53e28a949039eb2f79075a7')
);

create index ix_authorization_simulations_actor_time
  on audit.authorization_simulations (real_actor_id, created_at desc, simulation_id desc);
create index ix_authorization_simulations_decision_time
  on audit.authorization_simulations (requester_authorization_decision_id, created_at desc, simulation_id desc);
create index ix_authorization_simulations_correlation_time
  on audit.authorization_simulations (correlation_id, created_at desc, simulation_id desc);
create index ix_authorization_simulation_revisions_sequence
  on audit.authorization_simulation_revisions (simulation_id, revision_number desc);
create index ix_authorization_simulation_evaluations_time
  on audit.authorization_simulation_evaluations (simulation_id, evaluated_at desc, simulated_decision_id desc);
create index ix_authorization_simulation_evaluations_permission_time
  on audit.authorization_simulation_evaluations (permission_key, evaluated_at desc, simulated_decision_id desc);
create index ix_authorization_simulation_events_time
  on audit.authorization_simulation_events (simulation_id, occurred_at, event_id);
create index ix_authorization_simulation_events_correlation
  on audit.authorization_simulation_events (correlation_id, occurred_at desc, event_id desc);
create index ix_authorization_simulation_attempts_result_time
  on audit.authorization_simulation_attempts (attempt_result, occurred_at desc, attempt_id desc);
create index ix_authorization_simulation_links_reference
  on audit.authorization_simulation_links (link_kind, reference_type, reference_id, occurred_at desc);
create index ix_authorization_simulation_corrections_time
  on audit.authorization_simulation_corrections (simulation_id, occurred_at desc, correction_id desc);

create or replace function app_private.canonicalize_authorization_simulation(p_payload jsonb)
returns text
language sql
immutable
strict
set search_path = pg_catalog, app_private
as $auth_db_013_canonicalize$
  select app_private.canonicalize_authorization_payload(p_payload);
$auth_db_013_canonicalize$;

create or replace function app_private.fingerprint_authorization_simulation(p_payload jsonb)
returns text
language sql
immutable
strict
set search_path = pg_catalog, app_private, extensions
as $auth_db_013_fingerprint$
  select 'sha256:' || pg_catalog.encode(
    extensions.digest(app_private.canonicalize_authorization_simulation(p_payload), 'sha256'),
    'hex'
  );
$auth_db_013_fingerprint$;

create or replace function app_private.derive_authorization_simulation_status(p_simulation_id uuid)
returns text
language plpgsql
stable
strict
set search_path = pg_catalog, audit
as $auth_db_013_derive_status$
declare
  v_root audit.authorization_simulations%rowtype;
begin
  select s.* into v_root
  from audit.authorization_simulations s
  where s.simulation_id = p_simulation_id;

  if not found then
    raise exception using errcode = 'P0002', message = 'AUTH_DB_013_SIMULATION_NOT_FOUND';
  end if;

  if exists (select 1 from audit.authorization_simulation_events e where e.simulation_id = p_simulation_id and e.event_type = 'SIMULATION_INVALIDATED') then
    return 'INVALID';
  end if;
  if exists (select 1 from audit.authorization_simulation_events e where e.simulation_id = p_simulation_id and e.event_type = 'SIMULATION_REVOKED') then
    return 'REVOKED';
  end if;
  if exists (select 1 from audit.authorization_simulation_events e where e.simulation_id = p_simulation_id and e.event_type = 'SIMULATION_COMPLETED') then
    return 'COMPLETED';
  end if;
  if exists (select 1 from audit.authorization_simulation_events e where e.simulation_id = p_simulation_id and e.event_type = 'SIMULATION_EXPIRED')
     or v_root.expires_at <= pg_catalog.statement_timestamp() then
    return 'EXPIRED';
  end if;
  if exists (select 1 from audit.authorization_simulation_events e where e.simulation_id = p_simulation_id and e.event_type = 'SIMULATION_ACTIVATED') then
    return 'ACTIVE';
  end if;
  return 'DRAFT';
end
$auth_db_013_derive_status$;

create or replace function app_private.reject_authorization_simulation_audit_mutation()
returns trigger
language plpgsql
volatile
set search_path = pg_catalog
as $auth_db_013_reject_mutation$
begin
  raise exception using errcode = '55000', message = 'AUTH_DB_013_APPEND_ONLY_MUTATION_FORBIDDEN';
end
$auth_db_013_reject_mutation$;

create or replace function app_private.append_authorization_simulation(p_simulation jsonb)
returns jsonb
language plpgsql
volatile
security definer
strict
set search_path = pg_catalog, audit, app_private, extensions
as $auth_db_013_append_root$
declare
  v_now timestamptz := pg_catalog.statement_timestamp();
  v_decision audit.authorization_decisions%rowtype;
  v_simulation_id uuid;
  v_revision_id uuid;
  v_event_id uuid;
  v_expires_at timestamptz;
  v_decision_id text;
  v_session text;
  v_context_id text;
  v_context_fp text;
  v_purpose text;
  v_reason text;
  v_justification text;
  v_correlation text;
  v_causation text;
  v_idempotency text;
  v_sources jsonb;
  v_source_fps jsonb;
  v_scenario jsonb;
  v_scenario_kind text;
  v_scenario_fp text;
  v_request_fp text;
  v_root_fp text;
  v_event_operation_fp text;
  v_event_fp text;
  v_existing audit.authorization_simulations%rowtype;
  v_banned_pattern text := '"(jwt|refresh_token|access_token|service_role|api_key|pin|password|credential_secret|private_key|raw_session_token|cookie|authorization_header)"[[:space:]]*:';
begin
  if pg_catalog.jsonb_typeof(p_simulation) <> 'object' then
    raise exception using errcode = '22023', message = 'AUTH_DB_013_SIMULATION_ENVELOPE_INVALID';
  end if;
  if p_simulation::text ~* v_banned_pattern or pg_catalog.octet_length(p_simulation::text) > 65536 then
    raise exception using errcode = '22023', message = 'AUTH_DB_013_SIMULATION_PAYLOAD_FORBIDDEN_OR_TOO_LARGE';
  end if;
  if exists (
    select 1 from pg_catalog.jsonb_object_keys(p_simulation) k
    where k not in (
      'expires_at', 'purpose_code', 'reason_code', 'justification_reference',
      'requester_authorization_decision_id', 'real_session_reference',
      'real_access_context_id', 'real_access_context_fingerprint', 'correlation_id',
      'causation_id', 'idempotency_key', 'source_versions', 'source_fingerprints', 'scenario'
    )
  ) then
    raise exception using errcode = '22023', message = 'AUTH_DB_013_SIMULATION_FIELD_FORBIDDEN';
  end if;

  v_decision_id := nullif(p_simulation ->> 'requester_authorization_decision_id', '');
  v_session := nullif(p_simulation ->> 'real_session_reference', '');
  v_context_id := nullif(p_simulation ->> 'real_access_context_id', '');
  v_context_fp := nullif(p_simulation ->> 'real_access_context_fingerprint', '');
  v_purpose := nullif(p_simulation ->> 'purpose_code', '');
  v_reason := nullif(p_simulation ->> 'reason_code', '');
  v_justification := nullif(p_simulation ->> 'justification_reference', '');
  v_correlation := nullif(p_simulation ->> 'correlation_id', '');
  v_causation := nullif(p_simulation ->> 'causation_id', '');
  v_idempotency := nullif(p_simulation ->> 'idempotency_key', '');
  v_sources := coalesce(p_simulation -> 'source_versions', '{}'::jsonb);
  v_source_fps := coalesce(p_simulation -> 'source_fingerprints', '{}'::jsonb);
  v_scenario := p_simulation -> 'scenario';

  begin
    v_expires_at := (p_simulation ->> 'expires_at')::timestamptz;
  exception when others then
    raise exception using errcode = '22023', message = 'AUTH_DB_013_EXPIRES_AT_INVALID';
  end;

  if v_decision_id is null or v_session is null or v_context_id is null
     or v_context_fp !~ '^sha256:[0-9a-f]{64}$'
     or v_purpose !~ '^[A-Z][A-Z0-9_]{2,127}$'
     or v_reason !~ '^[A-Z][A-Z0-9_]{2,127}$'
     or v_idempotency is null or pg_catalog.length(v_idempotency) > 160
     or v_expires_at <= v_now
     or pg_catalog.jsonb_typeof(v_sources) <> 'object'
     or pg_catalog.jsonb_typeof(v_source_fps) <> 'object'
     or pg_catalog.jsonb_typeof(v_scenario) <> 'object' then
    raise exception using errcode = '22023', message = 'AUTH_DB_013_SIMULATION_IDENTITY_INVALID';
  end if;

  if exists (select 1 from pg_catalog.jsonb_each_text(v_sources) x where pg_catalog.lower(x.value) in ('latest', 'current', 'unknown'))
     or exists (select 1 from pg_catalog.jsonb_each_text(v_source_fps) x where x.value !~ '^sha256:[0-9a-f]{64}$') then
    raise exception using errcode = '22023', message = 'AUTH_DB_013_SOURCE_IDENTITY_INVALID';
  end if;

  select d.* into v_decision
  from audit.authorization_decisions d
  where d.decision_id = v_decision_id;
  if not found then
    raise exception using errcode = '23503', message = 'AUTH_DB_013_REQUESTER_DECISION_MISSING';
  end if;
  if v_decision.outcome <> 'ALLOW' or v_decision.actor_id is null or v_decision.principal_id is null
     or v_decision.permission_key <> 'viso.authorization.context_simulations.view'
     or pg_catalog.lower(v_decision.app_code) <> 'viso'
     or v_decision.request_source not in ('SERVER_ACTION', 'RPC', 'API') then
    raise exception using errcode = '42501', message = 'AUTH_DB_013_REQUESTER_DECISION_NOT_AUTHORIZED';
  end if;
  if v_decision.context_id <> v_context_id or v_decision.context_fingerprint <> v_context_fp then
    raise exception using errcode = '22023', message = 'AUTH_DB_013_REAL_CONTEXT_DECISION_MISMATCH';
  end if;
  if v_correlation is not null and v_decision.correlation_id is distinct from v_correlation then
    raise exception using errcode = '22023', message = 'AUTH_DB_013_CORRELATION_DECISION_MISMATCH';
  end if;
  v_correlation := coalesce(v_correlation, v_decision.correlation_id);
  if v_correlation is null then
    raise exception using errcode = '22023', message = 'AUTH_DB_013_CORRELATION_REQUIRED';
  end if;

  if exists (select 1 from pg_catalog.jsonb_object_keys(v_scenario) k where k not in (
    'scenario_kind', 'simulated_subject', 'simulated_role', 'simulated_site', 'simulated_area',
    'simulated_shift', 'simulated_checkin', 'simulated_resource', 'simulated_resolved_at',
    'policy_snapshot', 'source_versions', 'source_fingerprints'
  )) then
    raise exception using errcode = '22023', message = 'AUTH_DB_013_SCENARIO_FIELD_FORBIDDEN';
  end if;
  if exists (select 1 from pg_catalog.jsonb_object_keys(v_scenario -> 'simulated_subject') k where k not in ('subject_kind', 'subject_id', 'subject_reference'))
     or (v_scenario -> 'simulated_role' is not null and v_scenario -> 'simulated_role' <> 'null'::jsonb and exists (select 1 from pg_catalog.jsonb_object_keys(v_scenario -> 'simulated_role') k where k not in ('role_kind', 'role_code', 'role_catalog_version', 'matrix_version')))
     or (v_scenario -> 'simulated_site' is not null and v_scenario -> 'simulated_site' <> 'null'::jsonb and exists (select 1 from pg_catalog.jsonb_object_keys(v_scenario -> 'simulated_site') k where k not in ('simulated_site_id', 'simulated_site_code', 'simulated_site_type', 'simulated_site_kind', 'site_catalog_version')))
     or (v_scenario -> 'simulated_area' is not null and v_scenario -> 'simulated_area' <> 'null'::jsonb and exists (select 1 from pg_catalog.jsonb_object_keys(v_scenario -> 'simulated_area') k where k not in ('simulated_site_id', 'simulated_area_id', 'area_code', 'area_class', 'area_kind', 'area_catalog_version')))
     or (v_scenario -> 'simulated_shift' is not null and v_scenario -> 'simulated_shift' <> 'null'::jsonb and exists (select 1 from pg_catalog.jsonb_object_keys(v_scenario -> 'simulated_shift') k where k not in (
       'mode', 'simulated_shift_reference', 'source_shift_id', 'published_revision_reference', 'row_fingerprint',
       'simulated_shift_kind', 'simulated_publication_state', 'simulated_shift_status', 'simulated_starts_at',
       'simulated_ends_at', 'simulated_resolved_at', 'simulated_site_id', 'simulated_area_id',
       'simulated_operational_role_code', 'timezone', 'shift_contract_version', 'role_catalog_version',
       'site_catalog_version', 'area_catalog_version'
     )))
     or (v_scenario -> 'simulated_checkin' is not null and v_scenario -> 'simulated_checkin' <> 'null'::jsonb and exists (select 1 from pg_catalog.jsonb_object_keys(v_scenario -> 'simulated_checkin') k where k not in ('simulated_checkin_state', 'simulated_checkin_point_id')))
     or (v_scenario -> 'simulated_resource' is not null and v_scenario -> 'simulated_resource' <> 'null'::jsonb and exists (select 1 from pg_catalog.jsonb_object_keys(v_scenario -> 'simulated_resource') k where k not in ('mode', 'resource_type', 'resource_id', 'resource_fingerprint', 'masked_fields', 'draft_reference')))
     or exists (select 1 from pg_catalog.jsonb_object_keys(v_scenario -> 'policy_snapshot') k where k not in ('schema_version', 'simulation_requirement', 'permission_key', 'app_code', 'authorization_contract_version', 'catalog_version')) then
    raise exception using errcode = '22023', message = 'AUTH_DB_013_SCENARIO_NODE_FIELD_FORBIDDEN';
  end if;
  v_scenario_kind := nullif(v_scenario ->> 'scenario_kind', '');
  if v_scenario_kind !~ '^[A-Z][A-Z0-9_]{2,127}$'
     or pg_catalog.jsonb_typeof(v_scenario -> 'simulated_subject') <> 'object'
     or pg_catalog.jsonb_typeof(v_scenario -> 'policy_snapshot') <> 'object'
     or pg_catalog.jsonb_typeof(v_scenario -> 'source_versions') <> 'object'
     or pg_catalog.jsonb_typeof(v_scenario -> 'source_fingerprints') <> 'object' then
    raise exception using errcode = '22023', message = 'AUTH_DB_013_SCENARIO_SHAPE_INVALID';
  end if;
  if v_scenario -> 'simulated_role' is not null and v_scenario -> 'simulated_role' <> 'null'::jsonb then
    if pg_catalog.jsonb_typeof(v_scenario -> 'simulated_role') <> 'object'
       or (v_scenario #>> '{simulated_role,role_kind}') not in ('BASE', 'OPERATIONAL')
       or nullif(v_scenario #>> '{simulated_role,role_code}', '') is null
       or nullif(v_scenario #>> '{simulated_role,role_catalog_version}', '') is null
       or nullif(v_scenario #>> '{simulated_role,matrix_version}', '') is null then
      raise exception using errcode = '22023', message = 'AUTH_DB_013_SIMULATED_ROLE_INVALID';
    end if;
  end if;
  if v_scenario -> 'simulated_site' is not null and v_scenario -> 'simulated_site' <> 'null'::jsonb
     and nullif(v_scenario #>> '{simulated_site,simulated_site_id}', '') is null then
    raise exception using errcode = '22023', message = 'AUTH_DB_013_SIMULATED_SITE_INVALID';
  end if;
  if v_scenario -> 'simulated_area' is not null and v_scenario -> 'simulated_area' <> 'null'::jsonb then
    if nullif(v_scenario #>> '{simulated_area,simulated_area_id}', '') is null
       or nullif(v_scenario #>> '{simulated_area,simulated_site_id}', '') is null
       or v_scenario -> 'simulated_site' is null or v_scenario -> 'simulated_site' = 'null'::jsonb
       or (v_scenario #>> '{simulated_area,simulated_site_id}') is distinct from (v_scenario #>> '{simulated_site,simulated_site_id}') then
      raise exception using errcode = '22023', message = 'AUTH_DB_013_SIMULATED_AREA_SITE_MISMATCH';
    end if;
  end if;
  if pg_catalog.jsonb_typeof(v_scenario -> 'simulated_shift') <> 'object' then
    raise exception using errcode = '22023', message = 'AUTH_DB_013_SIMULATED_SHIFT_INVALID';
  end if;
  if (v_scenario #>> '{simulated_shift,mode}') not in ('NO_SHIFT', 'HYPOTHETICAL_SHIFT', 'EXACT_PUBLISHED_SHIFT') then
    raise exception using errcode = '22023', message = 'AUTH_DB_013_SIMULATED_SHIFT_MODE_INVALID';
  end if;
  if not ((v_scenario -> 'simulated_shift') ? 'simulated_resolved_at')
     or nullif(v_scenario #>> '{simulated_shift,simulated_resolved_at}', '') is null
     or (v_scenario #>> '{simulated_shift,simulated_resolved_at}') is distinct from (v_scenario ->> 'simulated_resolved_at')
     or nullif(v_scenario #>> '{simulated_shift,timezone}', '') is null
     or nullif(v_scenario #>> '{simulated_shift,shift_contract_version}', '') is null then
    raise exception using errcode = '22023', message = 'AUTH_DB_013_SIMULATED_SHIFT_IDENTITY_INVALID';
  end if;
  if (v_scenario #>> '{simulated_shift,timezone}') <> 'America/Bogota' then
    raise exception using errcode = '22023', message = 'AUTH_DB_013_SIMULATED_SHIFT_TIMEZONE_INVALID';
  end if;
  if (v_scenario #>> '{simulated_shift,mode}') = 'NO_SHIFT' then
    if not ((v_scenario -> 'simulated_shift') ? 'simulated_shift_reference')
       or not ((v_scenario -> 'simulated_shift') ? 'source_shift_id')
       or not ((v_scenario -> 'simulated_shift') ? 'published_revision_reference')
       or not ((v_scenario -> 'simulated_shift') ? 'row_fingerprint')
       or (v_scenario #> '{simulated_shift,simulated_shift_reference}') <> 'null'::jsonb
       or (v_scenario #> '{simulated_shift,source_shift_id}') <> 'null'::jsonb
       or (v_scenario #> '{simulated_shift,published_revision_reference}') <> 'null'::jsonb
       or (v_scenario #> '{simulated_shift,row_fingerprint}') <> 'null'::jsonb
       or exists (
         select 1 from pg_catalog.jsonb_object_keys(v_scenario -> 'simulated_shift') k
         where k not in (
           'mode', 'simulated_shift_reference', 'source_shift_id', 'published_revision_reference',
           'row_fingerprint', 'simulated_resolved_at', 'timezone', 'shift_contract_version'
         )
       ) then
      raise exception using errcode = '22023', message = 'AUTH_DB_013_NO_SHIFT_SHAPE_INVALID';
    end if;
  else
    if nullif(v_scenario #>> '{simulated_shift,simulated_shift_reference}', '') is null
       or nullif(v_scenario #>> '{simulated_shift,published_revision_reference}', '') is null
       or (v_scenario #>> '{simulated_shift,row_fingerprint}') !~ '^sha256:[0-9a-f]{64}$'
       or (v_scenario #>> '{simulated_shift,simulated_shift_kind}') not in ('LABORAL', 'DESCANSO')
       or (v_scenario #>> '{simulated_shift,simulated_shift_status}') not in ('SCHEDULED', 'CONFIRMED', 'COMPLETED', 'CANCELLED', 'NO_SHOW')
       or nullif(v_scenario #>> '{simulated_shift,simulated_starts_at}', '') is null
       or nullif(v_scenario #>> '{simulated_shift,simulated_ends_at}', '') is null
       or nullif(v_scenario #>> '{simulated_shift,simulated_site_id}', '') is null
       or not ((v_scenario -> 'simulated_shift') ? 'simulated_area_id')
       or nullif(v_scenario #>> '{simulated_shift,simulated_operational_role_code}', '') is null
       or nullif(v_scenario #>> '{simulated_shift,role_catalog_version}', '') is null
       or nullif(v_scenario #>> '{simulated_shift,site_catalog_version}', '') is null
       or nullif(v_scenario #>> '{simulated_shift,area_catalog_version}', '') is null then
      raise exception using errcode = '22023', message = 'AUTH_DB_013_SIMULATED_SHIFT_SHAPE_INVALID';
    end if;
    if (v_scenario #>> '{simulated_shift,mode}') = 'HYPOTHETICAL_SHIFT' then
      if (v_scenario #> '{simulated_shift,source_shift_id}') is distinct from 'null'::jsonb
         or (v_scenario #>> '{simulated_shift,simulated_publication_state}') not in ('DRAFT', 'PUBLISHED', 'WITHDRAWN') then
        raise exception using errcode = '22023', message = 'AUTH_DB_013_HYPOTHETICAL_SHIFT_SHAPE_INVALID';
      end if;
    elsif nullif(v_scenario #>> '{simulated_shift,source_shift_id}', '') is null
       or (v_scenario #>> '{simulated_shift,simulated_publication_state}') not in ('PUBLISHED', 'WITHDRAWN') then
      raise exception using errcode = '22023', message = 'AUTH_DB_013_EXACT_SHIFT_SHAPE_INVALID';
    end if;
    begin
      if (v_scenario #>> '{simulated_shift,simulated_ends_at}')::timestamptz <= (v_scenario #>> '{simulated_shift,simulated_starts_at}')::timestamptz then
        raise exception using errcode = '22023', message = 'AUTH_DB_013_SIMULATED_SHIFT_INTERVAL_INVALID';
      end if;
      perform (v_scenario #>> '{simulated_shift,simulated_resolved_at}')::timestamptz;
    exception when invalid_text_representation or datetime_field_overflow then
      raise exception using errcode = '22023', message = 'AUTH_DB_013_SIMULATED_SHIFT_TIME_INVALID';
    end;
  end if;
  if pg_catalog.jsonb_typeof(v_scenario -> 'simulated_checkin') <> 'object'
     or not ((v_scenario -> 'simulated_checkin') ? 'simulated_checkin_state')
     or not ((v_scenario -> 'simulated_checkin') ? 'simulated_checkin_point_id') then
    raise exception using errcode = '22023', message = 'AUTH_DB_013_SIMULATED_CHECKIN_INVALID';
  end if;
  if (v_scenario #>> '{simulated_checkin,simulated_checkin_state}') not in (
    'NOT_APPLICABLE', 'ABSENT', 'ACTIVE_HYPOTHETICAL', 'CLOSED_HYPOTHETICAL', 'INVALID_HYPOTHETICAL'
  ) then
    raise exception using errcode = '22023', message = 'AUTH_DB_013_SIMULATED_CHECKIN_STATE_INVALID';
  end if;
  if (v_scenario #>> '{simulated_shift,mode}') = 'NO_SHIFT'
     and (v_scenario #>> '{simulated_checkin,simulated_checkin_state}') = 'ACTIVE_HYPOTHETICAL' then
    raise exception using errcode = '22023', message = 'AUTH_DB_013_SIMULATED_CHECKIN_WITHOUT_SHIFT';
  end if;
  if v_scenario -> 'simulated_resource' is not null and v_scenario -> 'simulated_resource' <> 'null'::jsonb then
    if (v_scenario #>> '{simulated_resource,mode}') not in (
      'SYNTHETIC_RESOURCE', 'MASKED_REAL_RESOURCE', 'AUTHORIZED_REAL_REFERENCE', 'RESOURCE_DRAFT', 'UNRESOLVED'
    ) then
      raise exception using errcode = '22023', message = 'AUTH_DB_013_SIMULATED_RESOURCE_MODE_INVALID';
    end if;
  end if;
  if (v_scenario #>> '{policy_snapshot,simulation_requirement}') not in ('FULL_PREVIEW', 'DECISION_ONLY', 'NOT_ALLOWED') then
    raise exception using errcode = '22023', message = 'AUTH_DB_013_SIMULATION_REQUIREMENT_INVALID';
  end if;
  if exists (select 1 from pg_catalog.jsonb_each_text(v_scenario -> 'source_versions') x where pg_catalog.lower(x.value) in ('latest', 'current', 'unknown'))
     or exists (select 1 from pg_catalog.jsonb_each_text(v_scenario -> 'source_fingerprints') x where x.value !~ '^sha256:[0-9a-f]{64}$') then
    raise exception using errcode = '22023', message = 'AUTH_DB_013_SCENARIO_SOURCE_IDENTITY_INVALID';
  end if;

  begin
    perform (v_scenario ->> 'simulated_resolved_at')::timestamptz;
  exception when others then
    raise exception using errcode = '22023', message = 'AUTH_DB_013_SIMULATED_RESOLVED_AT_INVALID';
  end;

  v_request_fp := app_private.fingerprint_authorization_simulation(p_simulation - 'idempotency_key');
  select s.* into v_existing
  from audit.authorization_simulations s
  where s.real_actor_id = v_decision.actor_id
    and s.real_session_reference = v_session
    and s.creation_idempotency_key = v_idempotency;
  if found then
    if v_existing.request_fingerprint <> v_request_fp then
      raise exception using errcode = '23505', message = 'AUTH_DB_013_IDEMPOTENCY_CONFLICT';
    end if;
    return pg_catalog.jsonb_build_object(
      'simulation_id', v_existing.simulation_id,
      'simulation_revision_id', v_existing.initial_revision_id,
      'status', app_private.derive_authorization_simulation_status(v_existing.simulation_id),
      'idempotent', true,
      'executable', false
    );
  end if;

  v_simulation_id := extensions.gen_random_uuid();
  v_revision_id := extensions.gen_random_uuid();
  v_event_id := extensions.gen_random_uuid();
  v_scenario_fp := app_private.fingerprint_authorization_simulation(v_scenario);
  v_root_fp := app_private.fingerprint_authorization_simulation(pg_catalog.jsonb_build_object(
    'simulation_id', v_simulation_id, 'contract_name', 'SimulationContext', 'contract_version', '1.0.0',
    'schema_version', '1.0.0', 'created_at', v_now, 'expires_at', v_expires_at,
    'purpose_code', v_purpose, 'real_principal_id', v_decision.principal_id,
    'real_actor_id', v_decision.actor_id, 'real_session_reference', v_session,
    'real_access_context_id', v_context_id, 'real_access_context_fingerprint', v_context_fp,
    'requester_authorization_decision_id', v_decision_id, 'initial_revision_id', v_revision_id,
    'correlation_id', v_correlation, 'source_versions', v_sources, 'source_fingerprints', v_source_fps,
    'scenario_fingerprint', v_scenario_fp
  ));

  insert into audit.authorization_simulations (
    simulation_id, contract_name, contract_version, schema_version, created_at, expires_at,
    purpose_code, reason_code, justification_reference, real_principal_id, real_actor_id,
    real_employee_id, technical_principal_id, real_session_reference, real_access_context_id,
    real_access_context_fingerprint, requester_authorization_decision_id, initial_revision_id,
    correlation_id, causation_id, creation_idempotency_key, request_fingerprint, source_versions,
    source_fingerprints, root_fingerprint, source_contract_sha256
  ) values (
    v_simulation_id, 'SimulationContext', '1.0.0', '1.0.0', v_now, v_expires_at,
    v_purpose, v_reason, v_justification, v_decision.principal_id, v_decision.actor_id,
    v_decision.actor_id, session_user, v_session, v_context_id, v_context_fp, v_decision_id,
    v_revision_id, v_correlation, v_causation, v_idempotency, v_request_fp, v_sources, v_source_fps,
    v_root_fp,
    '4ec891da4fdf4bc85ccc3a2084f50add7d7957fcb53e28a949039eb2f79075a7'
  );

  insert into audit.authorization_simulation_revisions (
    simulation_revision_id, simulation_id, revision_number, created_at, created_by_real_actor_id,
    requester_authorization_decision_id, scenario_kind, simulated_subject, simulated_role,
    simulated_site, simulated_area, simulated_shift, simulated_checkin, simulated_resource,
    simulated_resolved_at, policy_snapshot, source_versions, source_fingerprints,
    scenario_fingerprint, source_contract_sha256
  ) values (
    v_revision_id, v_simulation_id, 1, v_now, v_decision.actor_id, v_decision_id,
    v_scenario_kind, v_scenario -> 'simulated_subject', nullif(v_scenario -> 'simulated_role', 'null'::jsonb),
    nullif(v_scenario -> 'simulated_site', 'null'::jsonb), nullif(v_scenario -> 'simulated_area', 'null'::jsonb),
    nullif(v_scenario -> 'simulated_shift', 'null'::jsonb), nullif(v_scenario -> 'simulated_checkin', 'null'::jsonb),
    nullif(v_scenario -> 'simulated_resource', 'null'::jsonb), (v_scenario ->> 'simulated_resolved_at')::timestamptz,
    v_scenario -> 'policy_snapshot', v_scenario -> 'source_versions', v_scenario -> 'source_fingerprints',
    v_scenario_fp, '4ec891da4fdf4bc85ccc3a2084f50add7d7957fcb53e28a949039eb2f79075a7'
  );

  v_event_operation_fp := app_private.fingerprint_authorization_simulation(pg_catalog.jsonb_build_object(
    'event_type', 'SIMULATION_CREATED', 'operation_id', 'CREATE:' || v_idempotency,
    'simulation_id', v_simulation_id, 'revision_id', v_revision_id, 'authorization_decision_id', v_decision_id,
    'reason_code', v_reason, 'correlation_id', v_correlation
  ));
  v_event_fp := app_private.fingerprint_authorization_simulation(pg_catalog.jsonb_build_object(
    'event_id', v_event_id, 'operation_fingerprint', v_event_operation_fp, 'occurred_at', v_now
  ));
  insert into audit.authorization_simulation_events (
    event_id, simulation_id, simulation_revision_id, event_type, operation_id, real_actor_id,
    technical_principal_id, authorization_decision_id, reason_code, correlation_id, causation_id,
    occurred_at, operation_fingerprint, event_fingerprint, source_contract_sha256
  ) values (
    v_event_id, v_simulation_id, v_revision_id, 'SIMULATION_CREATED', 'CREATE:' || v_idempotency,
    v_decision.actor_id, session_user, v_decision_id, v_reason, v_correlation, v_causation,
    v_now, v_event_operation_fp, v_event_fp,
    '4ec891da4fdf4bc85ccc3a2084f50add7d7957fcb53e28a949039eb2f79075a7'
  );

  insert into audit.authorization_simulation_links (
    simulation_link_id, simulation_id, simulation_revision_id, link_kind, reference_type,
    reference_id, correlation_id, causation_id, occurred_at, link_fingerprint, source_contract_sha256
  ) values
  (
    extensions.gen_random_uuid(), v_simulation_id, v_revision_id, 'REQUESTER_AUTHORIZATION_DECISION',
    'AuthorizationDecision', v_decision_id, v_correlation, v_causation, v_now,
    app_private.fingerprint_authorization_simulation(pg_catalog.jsonb_build_object('simulation_id', v_simulation_id, 'kind', 'REQUESTER_AUTHORIZATION_DECISION', 'reference_id', v_decision_id)),
    '4ec891da4fdf4bc85ccc3a2084f50add7d7957fcb53e28a949039eb2f79075a7'
  ),
  (
    extensions.gen_random_uuid(), v_simulation_id, v_revision_id, 'REAL_ACCESS_CONTEXT',
    'AccessContext', v_context_id, v_correlation, v_causation, v_now,
    app_private.fingerprint_authorization_simulation(pg_catalog.jsonb_build_object('simulation_id', v_simulation_id, 'kind', 'REAL_ACCESS_CONTEXT', 'reference_id', v_context_id, 'fingerprint', v_context_fp)),
    '4ec891da4fdf4bc85ccc3a2084f50add7d7957fcb53e28a949039eb2f79075a7'
  ),
  (
    extensions.gen_random_uuid(), v_simulation_id, v_revision_id, 'REAL_AUTH_SESSION',
    'AuthSession', v_session, v_correlation, v_causation, v_now,
    app_private.fingerprint_authorization_simulation(pg_catalog.jsonb_build_object('simulation_id', v_simulation_id, 'kind', 'REAL_AUTH_SESSION', 'reference_id', v_session)),
    '4ec891da4fdf4bc85ccc3a2084f50add7d7957fcb53e28a949039eb2f79075a7'
  );

  if v_decision.device_id is not null then
    insert into audit.authorization_simulation_links (
      simulation_link_id, simulation_id, simulation_revision_id, link_kind, reference_type,
      reference_id, correlation_id, causation_id, occurred_at, link_fingerprint, source_contract_sha256
    ) values (
      extensions.gen_random_uuid(), v_simulation_id, v_revision_id, 'DEVICE_CONTEXT', 'Device',
      v_decision.device_id, v_correlation, v_causation, v_now,
      app_private.fingerprint_authorization_simulation(pg_catalog.jsonb_build_object('simulation_id', v_simulation_id, 'kind', 'DEVICE_CONTEXT', 'reference_id', v_decision.device_id)),
      '4ec891da4fdf4bc85ccc3a2084f50add7d7957fcb53e28a949039eb2f79075a7'
    );
  end if;

  return pg_catalog.jsonb_build_object(
    'simulation_id', v_simulation_id,
    'simulation_revision_id', v_revision_id,
    'status', 'DRAFT',
    'scenario_fingerprint', v_scenario_fp,
    'root_fingerprint', v_root_fp,
    'idempotent', false,
    'executable', false
  );
end
$auth_db_013_append_root$;

create or replace function app_private.append_authorization_simulation_revision(p_revision jsonb)
returns jsonb
language plpgsql
volatile
security definer
strict
set search_path = pg_catalog, audit, app_private, extensions
as $auth_db_013_append_revision$
declare
  v_now timestamptz := pg_catalog.statement_timestamp();
  v_simulation_id uuid;
  v_base integer;
  v_current integer;
  v_revision_id uuid := extensions.gen_random_uuid();
  v_event_id uuid := extensions.gen_random_uuid();
  v_decision_id text;
  v_decision audit.authorization_decisions%rowtype;
  v_root audit.authorization_simulations%rowtype;
  v_status text;
  v_scenario jsonb;
  v_scenario_fp text;
  v_reason text;
  v_correlation text;
  v_causation text;
  v_event_operation_fp text;
  v_event_fp text;
begin
  if pg_catalog.jsonb_typeof(p_revision) <> 'object'
     or p_revision::text ~* '"(jwt|refresh_token|access_token|service_role|api_key|pin|password|credential_secret|private_key|raw_session_token|cookie|authorization_header)"[[:space:]]*:'
     or pg_catalog.octet_length(p_revision::text) > 65536
     or exists (select 1 from pg_catalog.jsonb_object_keys(p_revision) k where k not in (
       'simulation_id', 'base_revision_number', 'authorization_decision_id', 'reason_code',
       'correlation_id', 'causation_id', 'scenario'
     )) then
    raise exception using errcode = '22023', message = 'AUTH_DB_013_REVISION_ENVELOPE_INVALID';
  end if;
  begin
    v_simulation_id := (p_revision ->> 'simulation_id')::uuid;
    v_base := (p_revision ->> 'base_revision_number')::integer;
  exception when others then
    raise exception using errcode = '22023', message = 'AUTH_DB_013_REVISION_IDENTITY_INVALID';
  end;
  v_decision_id := nullif(p_revision ->> 'authorization_decision_id', '');
  v_reason := nullif(p_revision ->> 'reason_code', '');
  v_correlation := nullif(p_revision ->> 'correlation_id', '');
  v_causation := nullif(p_revision ->> 'causation_id', '');
  v_scenario := p_revision -> 'scenario';
  if v_base < 1 or v_decision_id is null or v_reason !~ '^[A-Z][A-Z0-9_]{2,127}$'
     or pg_catalog.jsonb_typeof(v_scenario) <> 'object' then
    raise exception using errcode = '22023', message = 'AUTH_DB_013_REVISION_IDENTITY_INVALID';
  end if;

  select s.* into v_root from audit.authorization_simulations s where s.simulation_id = v_simulation_id for update;
  if not found then raise exception using errcode = 'P0002', message = 'AUTH_DB_013_SIMULATION_NOT_FOUND'; end if;
  v_status := app_private.derive_authorization_simulation_status(v_simulation_id);
  if v_status not in ('DRAFT', 'ACTIVE') then
    raise exception using errcode = '55000', message = 'AUTH_DB_013_REVISION_TERMINAL_FORBIDDEN';
  end if;

  select max(r.revision_number) into v_current from audit.authorization_simulation_revisions r where r.simulation_id = v_simulation_id;
  if v_current <> v_base then
    raise exception using errcode = '40001', message = 'AUTH_DB_013_REVISION_CONFLICT';
  end if;

  select d.* into v_decision from audit.authorization_decisions d where d.decision_id = v_decision_id;
  if not found or v_decision.outcome <> 'ALLOW' or v_decision.actor_id is null then
    raise exception using errcode = '42501', message = 'AUTH_DB_013_REVISION_DECISION_NOT_AUTHORIZED';
  end if;
  v_correlation := coalesce(v_correlation, v_decision.correlation_id, v_root.correlation_id);
  if v_correlation is null then raise exception using errcode = '22023', message = 'AUTH_DB_013_CORRELATION_REQUIRED'; end if;

  if exists (select 1 from pg_catalog.jsonb_object_keys(v_scenario) k where k not in (
    'scenario_kind', 'simulated_subject', 'simulated_role', 'simulated_site', 'simulated_area',
    'simulated_shift', 'simulated_checkin', 'simulated_resource', 'simulated_resolved_at',
    'policy_snapshot', 'source_versions', 'source_fingerprints'
  )) or pg_catalog.jsonb_typeof(v_scenario -> 'simulated_subject') <> 'object'
     or exists (select 1 from pg_catalog.jsonb_object_keys(v_scenario -> 'simulated_subject') k where k not in ('subject_kind', 'subject_id', 'subject_reference'))
     or (v_scenario -> 'simulated_role' is not null and v_scenario -> 'simulated_role' <> 'null'::jsonb and exists (select 1 from pg_catalog.jsonb_object_keys(v_scenario -> 'simulated_role') k where k not in ('role_kind', 'role_code', 'role_catalog_version', 'matrix_version')))
     or (v_scenario -> 'simulated_site' is not null and v_scenario -> 'simulated_site' <> 'null'::jsonb and exists (select 1 from pg_catalog.jsonb_object_keys(v_scenario -> 'simulated_site') k where k not in ('simulated_site_id', 'simulated_site_code', 'simulated_site_type', 'simulated_site_kind', 'site_catalog_version')))
     or (v_scenario -> 'simulated_area' is not null and v_scenario -> 'simulated_area' <> 'null'::jsonb and exists (select 1 from pg_catalog.jsonb_object_keys(v_scenario -> 'simulated_area') k where k not in ('simulated_site_id', 'simulated_area_id', 'area_code', 'area_class', 'area_kind', 'area_catalog_version')))
     or (v_scenario -> 'simulated_shift' is not null and v_scenario -> 'simulated_shift' <> 'null'::jsonb and exists (select 1 from pg_catalog.jsonb_object_keys(v_scenario -> 'simulated_shift') k where k not in (
       'mode', 'simulated_shift_reference', 'source_shift_id', 'published_revision_reference', 'row_fingerprint',
       'simulated_shift_kind', 'simulated_publication_state', 'simulated_shift_status', 'simulated_starts_at',
       'simulated_ends_at', 'simulated_resolved_at', 'simulated_site_id', 'simulated_area_id',
       'simulated_operational_role_code', 'timezone', 'shift_contract_version', 'role_catalog_version',
       'site_catalog_version', 'area_catalog_version'
     )))
     or (v_scenario -> 'simulated_checkin' is not null and v_scenario -> 'simulated_checkin' <> 'null'::jsonb and exists (select 1 from pg_catalog.jsonb_object_keys(v_scenario -> 'simulated_checkin') k where k not in ('simulated_checkin_state', 'simulated_checkin_point_id')))
     or (v_scenario -> 'simulated_resource' is not null and v_scenario -> 'simulated_resource' <> 'null'::jsonb and exists (select 1 from pg_catalog.jsonb_object_keys(v_scenario -> 'simulated_resource') k where k not in ('mode', 'resource_type', 'resource_id', 'resource_fingerprint', 'masked_fields', 'draft_reference')))
     or exists (select 1 from pg_catalog.jsonb_object_keys(v_scenario -> 'policy_snapshot') k where k not in ('schema_version', 'simulation_requirement', 'permission_key', 'app_code', 'authorization_contract_version', 'catalog_version'))
     or pg_catalog.jsonb_typeof(v_scenario -> 'policy_snapshot') <> 'object'
     or pg_catalog.jsonb_typeof(v_scenario -> 'source_versions') <> 'object'
     or pg_catalog.jsonb_typeof(v_scenario -> 'source_fingerprints') <> 'object'
     or (v_scenario ->> 'scenario_kind') !~ '^[A-Z][A-Z0-9_]{2,127}$'
     or (v_scenario #>> '{policy_snapshot,simulation_requirement}') not in ('FULL_PREVIEW', 'DECISION_ONLY', 'NOT_ALLOWED')
     or (v_scenario -> 'simulated_role' is not null and v_scenario -> 'simulated_role' <> 'null'::jsonb and (
       (v_scenario #>> '{simulated_role,role_kind}') not in ('BASE','OPERATIONAL')
       or nullif(v_scenario #>> '{simulated_role,role_code}', '') is null
       or nullif(v_scenario #>> '{simulated_role,role_catalog_version}', '') is null
       or nullif(v_scenario #>> '{simulated_role,matrix_version}', '') is null
     ))
     or (v_scenario -> 'simulated_site' is not null and v_scenario -> 'simulated_site' <> 'null'::jsonb and nullif(v_scenario #>> '{simulated_site,simulated_site_id}', '') is null)
     or (v_scenario -> 'simulated_area' is not null and v_scenario -> 'simulated_area' <> 'null'::jsonb and nullif(v_scenario #>> '{simulated_area,simulated_area_id}', '') is null)
     or pg_catalog.jsonb_typeof(v_scenario -> 'simulated_shift') <> 'object'
     or (v_scenario #>> '{simulated_shift,mode}') not in ('NO_SHIFT','HYPOTHETICAL_SHIFT','EXACT_PUBLISHED_SHIFT')
     or nullif(v_scenario #>> '{simulated_shift,simulated_resolved_at}', '') is null
     or (v_scenario #>> '{simulated_shift,simulated_resolved_at}') is distinct from (v_scenario ->> 'simulated_resolved_at')
     or nullif(v_scenario #>> '{simulated_shift,timezone}', '') is null
     or (v_scenario #>> '{simulated_shift,timezone}') <> 'America/Bogota'
     or nullif(v_scenario #>> '{simulated_shift,shift_contract_version}', '') is null
     or ((v_scenario #>> '{simulated_shift,mode}') = 'NO_SHIFT' and (
       not ((v_scenario -> 'simulated_shift') ? 'simulated_shift_reference')
       or not ((v_scenario -> 'simulated_shift') ? 'source_shift_id')
       or not ((v_scenario -> 'simulated_shift') ? 'published_revision_reference')
       or not ((v_scenario -> 'simulated_shift') ? 'row_fingerprint')
       or (v_scenario #> '{simulated_shift,simulated_shift_reference}') <> 'null'::jsonb
       or (v_scenario #> '{simulated_shift,source_shift_id}') <> 'null'::jsonb
       or (v_scenario #> '{simulated_shift,published_revision_reference}') <> 'null'::jsonb
       or (v_scenario #> '{simulated_shift,row_fingerprint}') <> 'null'::jsonb
       or exists (
         select 1 from pg_catalog.jsonb_object_keys(v_scenario -> 'simulated_shift') k
         where k not in (
           'mode', 'simulated_shift_reference', 'source_shift_id', 'published_revision_reference',
           'row_fingerprint', 'simulated_resolved_at', 'timezone', 'shift_contract_version'
         )
       )
     ))
     or ((v_scenario #>> '{simulated_shift,mode}') in ('HYPOTHETICAL_SHIFT','EXACT_PUBLISHED_SHIFT') and (
       nullif(v_scenario #>> '{simulated_shift,simulated_shift_reference}', '') is null
       or nullif(v_scenario #>> '{simulated_shift,published_revision_reference}', '') is null
       or (v_scenario #>> '{simulated_shift,row_fingerprint}') !~ '^sha256:[0-9a-f]{64}$'
       or (v_scenario #>> '{simulated_shift,simulated_shift_kind}') not in ('LABORAL','DESCANSO')
       or (v_scenario #>> '{simulated_shift,simulated_shift_status}') not in ('SCHEDULED','CONFIRMED','COMPLETED','CANCELLED','NO_SHOW')
       or nullif(v_scenario #>> '{simulated_shift,simulated_starts_at}', '') is null
       or nullif(v_scenario #>> '{simulated_shift,simulated_ends_at}', '') is null
       or nullif(v_scenario #>> '{simulated_shift,simulated_site_id}', '') is null
       or not ((v_scenario -> 'simulated_shift') ? 'simulated_area_id')
       or nullif(v_scenario #>> '{simulated_shift,simulated_operational_role_code}', '') is null
       or nullif(v_scenario #>> '{simulated_shift,role_catalog_version}', '') is null
       or nullif(v_scenario #>> '{simulated_shift,site_catalog_version}', '') is null
       or nullif(v_scenario #>> '{simulated_shift,area_catalog_version}', '') is null
     ))
     or ((v_scenario #>> '{simulated_shift,mode}') = 'HYPOTHETICAL_SHIFT' and (
       (v_scenario #> '{simulated_shift,source_shift_id}') is distinct from 'null'::jsonb
       or (v_scenario #>> '{simulated_shift,simulated_publication_state}') not in ('DRAFT','PUBLISHED','WITHDRAWN')
     ))
     or ((v_scenario #>> '{simulated_shift,mode}') = 'EXACT_PUBLISHED_SHIFT' and (
       nullif(v_scenario #>> '{simulated_shift,source_shift_id}', '') is null
       or (v_scenario #>> '{simulated_shift,simulated_publication_state}') not in ('PUBLISHED','WITHDRAWN')
     ))
     or pg_catalog.jsonb_typeof(v_scenario -> 'simulated_checkin') <> 'object'
     or not ((v_scenario -> 'simulated_checkin') ? 'simulated_checkin_state')
     or not ((v_scenario -> 'simulated_checkin') ? 'simulated_checkin_point_id')
     or (v_scenario #>> '{simulated_checkin,simulated_checkin_state}') not in ('NOT_APPLICABLE','ABSENT','ACTIVE_HYPOTHETICAL','CLOSED_HYPOTHETICAL','INVALID_HYPOTHETICAL')
     or ((v_scenario #>> '{simulated_shift,mode}') = 'NO_SHIFT' and (v_scenario #>> '{simulated_checkin,simulated_checkin_state}') = 'ACTIVE_HYPOTHETICAL')
     or (v_scenario -> 'simulated_resource' is not null and v_scenario -> 'simulated_resource' <> 'null'::jsonb and (v_scenario #>> '{simulated_resource,mode}') not in ('SYNTHETIC_RESOURCE','MASKED_REAL_RESOURCE','AUTHORIZED_REAL_REFERENCE','RESOURCE_DRAFT','UNRESOLVED'))
     or exists (select 1 from pg_catalog.jsonb_each_text(v_scenario -> 'source_versions') x where pg_catalog.lower(x.value) in ('latest','current','unknown'))
     or exists (select 1 from pg_catalog.jsonb_each_text(v_scenario -> 'source_fingerprints') x where x.value !~ '^sha256:[0-9a-f]{64}$') then
    raise exception using errcode = '22023', message = 'AUTH_DB_013_REVISION_SCENARIO_INVALID';
  end if;
  if v_scenario -> 'simulated_area' is not null and v_scenario -> 'simulated_area' <> 'null'::jsonb
     and (v_scenario -> 'simulated_site' is null or v_scenario -> 'simulated_site' = 'null'::jsonb
       or (v_scenario #>> '{simulated_area,simulated_site_id}') is distinct from (v_scenario #>> '{simulated_site,simulated_site_id}')) then
    raise exception using errcode = '22023', message = 'AUTH_DB_013_SIMULATED_AREA_SITE_MISMATCH';
  end if;
  begin
    perform (v_scenario ->> 'simulated_resolved_at')::timestamptz;
    perform (v_scenario #>> '{simulated_shift,simulated_resolved_at}')::timestamptz;
    if (v_scenario #>> '{simulated_shift,mode}') <> 'NO_SHIFT'
       and (v_scenario #>> '{simulated_shift,simulated_ends_at}')::timestamptz <= (v_scenario #>> '{simulated_shift,simulated_starts_at}')::timestamptz then
      raise exception using errcode = '22023', message = 'AUTH_DB_013_SIMULATED_SHIFT_INTERVAL_INVALID';
    end if;
  exception when invalid_text_representation or datetime_field_overflow then
    raise exception using errcode = '22023', message = 'AUTH_DB_013_SIMULATED_SHIFT_TIME_INVALID';
  end;

  v_scenario_fp := app_private.fingerprint_authorization_simulation(v_scenario);
  insert into audit.authorization_simulation_revisions (
    simulation_revision_id, simulation_id, revision_number, created_at, created_by_real_actor_id,
    requester_authorization_decision_id, scenario_kind, simulated_subject, simulated_role, simulated_site,
    simulated_area, simulated_shift, simulated_checkin, simulated_resource, simulated_resolved_at,
    policy_snapshot, source_versions, source_fingerprints, scenario_fingerprint, source_contract_sha256
  ) values (
    v_revision_id, v_simulation_id, v_current + 1, v_now, v_decision.actor_id, v_decision_id,
    v_scenario ->> 'scenario_kind', v_scenario -> 'simulated_subject', nullif(v_scenario -> 'simulated_role', 'null'::jsonb),
    nullif(v_scenario -> 'simulated_site', 'null'::jsonb), nullif(v_scenario -> 'simulated_area', 'null'::jsonb),
    nullif(v_scenario -> 'simulated_shift', 'null'::jsonb), nullif(v_scenario -> 'simulated_checkin', 'null'::jsonb),
    nullif(v_scenario -> 'simulated_resource', 'null'::jsonb), (v_scenario ->> 'simulated_resolved_at')::timestamptz,
    v_scenario -> 'policy_snapshot', v_scenario -> 'source_versions', v_scenario -> 'source_fingerprints',
    v_scenario_fp, '4ec891da4fdf4bc85ccc3a2084f50add7d7957fcb53e28a949039eb2f79075a7'
  );

  v_event_operation_fp := app_private.fingerprint_authorization_simulation(pg_catalog.jsonb_build_object(
    'event_type', 'SIMULATION_REVISED', 'simulation_id', v_simulation_id, 'revision_id', v_revision_id,
    'base_revision_number', v_base, 'authorization_decision_id', v_decision_id, 'reason_code', v_reason,
    'correlation_id', v_correlation, 'scenario_fingerprint', v_scenario_fp
  ));
  v_event_fp := app_private.fingerprint_authorization_simulation(pg_catalog.jsonb_build_object('event_id', v_event_id, 'operation_fingerprint', v_event_operation_fp, 'occurred_at', v_now));
  insert into audit.authorization_simulation_events (
    event_id, simulation_id, simulation_revision_id, event_type, operation_id, real_actor_id,
    technical_principal_id, authorization_decision_id, reason_code, correlation_id, causation_id,
    occurred_at, operation_fingerprint, event_fingerprint, source_contract_sha256
  ) values (
    v_event_id, v_simulation_id, v_revision_id, 'SIMULATION_REVISED', 'REVISION:' || v_revision_id::text,
    v_decision.actor_id, session_user, v_decision_id, v_reason, v_correlation, v_causation,
    v_now, v_event_operation_fp, v_event_fp,
    '4ec891da4fdf4bc85ccc3a2084f50add7d7957fcb53e28a949039eb2f79075a7'
  );

  return pg_catalog.jsonb_build_object('simulation_id', v_simulation_id, 'simulation_revision_id', v_revision_id,
    'revision_number', v_current + 1, 'scenario_fingerprint', v_scenario_fp, 'status', v_status, 'executable', false);
end
$auth_db_013_append_revision$;

create or replace function app_private.append_authorization_simulation_event(p_event jsonb)
returns jsonb
language plpgsql
volatile
security definer
strict
set search_path = pg_catalog, audit, app_private, extensions
as $auth_db_013_append_event$
declare
  v_now timestamptz := pg_catalog.statement_timestamp();
  v_simulation_id uuid;
  v_revision_id uuid;
  v_event_id uuid := extensions.gen_random_uuid();
  v_event_type text;
  v_operation_id text;
  v_decision_id text;
  v_reason text;
  v_correlation text;
  v_causation text;
  v_status text;
  v_root audit.authorization_simulations%rowtype;
  v_decision audit.authorization_decisions%rowtype;
  v_operation_fp text;
  v_event_fp text;
  v_existing audit.authorization_simulation_events%rowtype;
begin
  if pg_catalog.jsonb_typeof(p_event) <> 'object'
     or p_event::text ~* '"(jwt|refresh_token|access_token|service_role|api_key|pin|password|credential_secret|private_key|raw_session_token|cookie|authorization_header)"[[:space:]]*:'
     or exists (select 1 from pg_catalog.jsonb_object_keys(p_event) k where k not in (
       'simulation_id', 'simulation_revision_id', 'event_type', 'operation_id', 'authorization_decision_id',
       'reason_code', 'correlation_id', 'causation_id'
     )) then
    raise exception using errcode = '22023', message = 'AUTH_DB_013_EVENT_ENVELOPE_INVALID';
  end if;
  begin v_simulation_id := (p_event ->> 'simulation_id')::uuid;
  exception when others then raise exception using errcode = '22023', message = 'AUTH_DB_013_EVENT_SIMULATION_ID_INVALID'; end;
  if nullif(p_event ->> 'simulation_revision_id', '') is not null then
    begin v_revision_id := (p_event ->> 'simulation_revision_id')::uuid;
    exception when others then raise exception using errcode = '22023', message = 'AUTH_DB_013_EVENT_REVISION_ID_INVALID'; end;
  end if;
  v_event_type := nullif(p_event ->> 'event_type', '');
  v_operation_id := nullif(p_event ->> 'operation_id', '');
  v_decision_id := nullif(p_event ->> 'authorization_decision_id', '');
  v_reason := nullif(p_event ->> 'reason_code', '');
  v_correlation := nullif(p_event ->> 'correlation_id', '');
  v_causation := nullif(p_event ->> 'causation_id', '');
  if v_event_type not in ('SIMULATION_ACTIVATED', 'SIMULATION_COMPLETED', 'SIMULATION_EXPIRED', 'SIMULATION_REVOKED', 'SIMULATION_INVALIDATED')
     or v_operation_id is null or pg_catalog.length(v_operation_id) > 160
     or v_reason !~ '^[A-Z][A-Z0-9_]{2,127}$' then
    raise exception using errcode = '22023', message = 'AUTH_DB_013_EVENT_IDENTITY_INVALID';
  end if;

  select s.* into v_root from audit.authorization_simulations s where s.simulation_id = v_simulation_id for update;
  if not found then raise exception using errcode = 'P0002', message = 'AUTH_DB_013_SIMULATION_NOT_FOUND'; end if;
  v_status := app_private.derive_authorization_simulation_status(v_simulation_id);
  if v_revision_id is null then
    select r.simulation_revision_id into v_revision_id
    from audit.authorization_simulation_revisions r
    where r.simulation_id = v_simulation_id order by r.revision_number desc limit 1;
  end if;

  if v_event_type <> 'SIMULATION_EXPIRED' then
    if v_decision_id is null then raise exception using errcode = '42501', message = 'AUTH_DB_013_EVENT_DECISION_REQUIRED'; end if;
    select d.* into v_decision from audit.authorization_decisions d where d.decision_id = v_decision_id;
    if not found or v_decision.outcome <> 'ALLOW' or v_decision.actor_id is null then
      raise exception using errcode = '42501', message = 'AUTH_DB_013_EVENT_DECISION_NOT_AUTHORIZED';
    end if;
    v_correlation := coalesce(v_correlation, v_decision.correlation_id, v_root.correlation_id);
  else
    if v_decision_id is not null then
      select d.* into v_decision from audit.authorization_decisions d where d.decision_id = v_decision_id;
      if not found or v_decision.outcome <> 'ALLOW' then
        raise exception using errcode = '42501', message = 'AUTH_DB_013_EVENT_DECISION_NOT_AUTHORIZED';
      end if;
    end if;
    v_correlation := coalesce(v_correlation, v_root.correlation_id);
  end if;
  if v_correlation is null then raise exception using errcode = '22023', message = 'AUTH_DB_013_CORRELATION_REQUIRED'; end if;

  v_operation_fp := app_private.fingerprint_authorization_simulation(pg_catalog.jsonb_build_object(
    'simulation_id', v_simulation_id, 'revision_id', v_revision_id, 'event_type', v_event_type,
    'operation_id', v_operation_id, 'authorization_decision_id', v_decision_id, 'reason_code', v_reason,
    'correlation_id', v_correlation, 'causation_id', v_causation
  ));
  select e.* into v_existing from audit.authorization_simulation_events e
  where e.simulation_id = v_simulation_id and e.operation_id = v_operation_id;
  if found then
    if v_existing.operation_fingerprint <> v_operation_fp then
      raise exception using errcode = '23505', message = 'AUTH_DB_013_EVENT_IDEMPOTENCY_CONFLICT';
    end if;
    return pg_catalog.jsonb_build_object('event_id', v_existing.event_id, 'simulation_id', v_simulation_id,
      'event_type', v_existing.event_type, 'status', app_private.derive_authorization_simulation_status(v_simulation_id), 'idempotent', true);
  end if;

  if v_event_type = 'SIMULATION_ACTIVATED' and v_status <> 'DRAFT' then
    raise exception using errcode = '55000', message = 'AUTH_DB_013_ACTIVATION_TRANSITION_INVALID';
  elsif v_event_type = 'SIMULATION_COMPLETED' and v_status <> 'ACTIVE' then
    raise exception using errcode = '55000', message = 'AUTH_DB_013_COMPLETION_TRANSITION_INVALID';
  elsif v_event_type in ('SIMULATION_REVOKED', 'SIMULATION_INVALIDATED') and v_status not in ('DRAFT', 'ACTIVE') then
    raise exception using errcode = '55000', message = 'AUTH_DB_013_TERMINAL_TRANSITION_INVALID';
  elsif v_event_type = 'SIMULATION_EXPIRED' and (v_status not in ('DRAFT', 'ACTIVE', 'EXPIRED') or v_root.expires_at > v_now) then
    raise exception using errcode = '55000', message = 'AUTH_DB_013_EXPIRATION_TRANSITION_INVALID';
  end if;

  v_event_fp := app_private.fingerprint_authorization_simulation(pg_catalog.jsonb_build_object(
    'event_id', v_event_id, 'operation_fingerprint', v_operation_fp, 'occurred_at', v_now
  ));
  insert into audit.authorization_simulation_events (
    event_id, simulation_id, simulation_revision_id, event_type, operation_id, real_actor_id,
    technical_principal_id, authorization_decision_id, reason_code, correlation_id, causation_id,
    occurred_at, operation_fingerprint, event_fingerprint, source_contract_sha256
  ) values (
    v_event_id, v_simulation_id, v_revision_id, v_event_type, v_operation_id,
    case when v_decision_id is null then null else v_decision.actor_id end,
    session_user, v_decision_id, v_reason, v_correlation, v_causation, v_now, v_operation_fp, v_event_fp,
    '4ec891da4fdf4bc85ccc3a2084f50add7d7957fcb53e28a949039eb2f79075a7'
  );
  return pg_catalog.jsonb_build_object('event_id', v_event_id, 'simulation_id', v_simulation_id,
    'event_type', v_event_type, 'status', app_private.derive_authorization_simulation_status(v_simulation_id), 'idempotent', false);
end
$auth_db_013_append_event$;

create or replace function app_private.append_authorization_simulation_evaluation(p_evaluation jsonb)
returns jsonb
language plpgsql
volatile
security definer
strict
set search_path = pg_catalog, audit, app_private, extensions
as $auth_db_013_append_evaluation$
declare
  v_now timestamptz := pg_catalog.statement_timestamp();
  v_simulation_id uuid;
  v_revision_id uuid;
  v_decision_id text;
  v_decision audit.authorization_decisions%rowtype;
  v_root audit.authorization_simulations%rowtype;
  v_current_revision audit.authorization_simulation_revisions%rowtype;
  v_simulated_decision_id uuid := extensions.gen_random_uuid();
  v_event_id uuid := extensions.gen_random_uuid();
  v_request_id text;
  v_app_code text;
  v_permission_key text;
  v_requirement text;
  v_expected_requirement text;
  v_resource_scenario_id text;
  v_hypothetical_context_id text;
  v_outcome text;
  v_reason_codes text[];
  v_auth_version text;
  v_catalog_version text;
  v_sources jsonb;
  v_source_fps jsonb;
  v_request jsonb;
  v_request_fp text;
  v_eval_fp text;
  v_correlation text;
  v_causation text;
  v_event_operation_fp text;
  v_event_fp text;
  v_existing audit.authorization_simulation_evaluations%rowtype;
begin
  if pg_catalog.jsonb_typeof(p_evaluation) <> 'object'
     or p_evaluation::text ~* '"(jwt|refresh_token|access_token|service_role|api_key|pin|password|credential_secret|private_key|raw_session_token|cookie|authorization_header)"[[:space:]]*:'
     or exists (select 1 from pg_catalog.jsonb_object_keys(p_evaluation) k where k not in (
       'simulation_id', 'simulation_revision_id', 'authorization_decision_id', 'evaluation_request_id',
       'app_code', 'permission_key', 'simulation_requirement', 'resource_scenario_id',
       'hypothetical_context_id', 'outcome', 'reason_codes', 'authorization_contract_version',
       'catalog_version', 'source_versions', 'source_fingerprints', 'request', 'correlation_id', 'causation_id'
     )) then
    raise exception using errcode = '22023', message = 'AUTH_DB_013_EVALUATION_ENVELOPE_INVALID';
  end if;
  begin
    v_simulation_id := (p_evaluation ->> 'simulation_id')::uuid;
    v_revision_id := (p_evaluation ->> 'simulation_revision_id')::uuid;
  exception when others then
    raise exception using errcode = '22023', message = 'AUTH_DB_013_EVALUATION_IDENTITY_INVALID';
  end;
  v_decision_id := nullif(p_evaluation ->> 'authorization_decision_id', '');
  v_request_id := nullif(p_evaluation ->> 'evaluation_request_id', '');
  v_app_code := nullif(p_evaluation ->> 'app_code', '');
  v_permission_key := nullif(p_evaluation ->> 'permission_key', '');
  v_requirement := nullif(p_evaluation ->> 'simulation_requirement', '');
  v_resource_scenario_id := nullif(p_evaluation ->> 'resource_scenario_id', '');
  v_hypothetical_context_id := nullif(p_evaluation ->> 'hypothetical_context_id', '');
  v_outcome := nullif(p_evaluation ->> 'outcome', '');
  v_auth_version := nullif(p_evaluation ->> 'authorization_contract_version', '');
  v_catalog_version := nullif(p_evaluation ->> 'catalog_version', '');
  v_sources := coalesce(p_evaluation -> 'source_versions', '{}'::jsonb);
  v_source_fps := coalesce(p_evaluation -> 'source_fingerprints', '{}'::jsonb);
  v_request := p_evaluation -> 'request';
  v_correlation := nullif(p_evaluation ->> 'correlation_id', '');
  v_causation := nullif(p_evaluation ->> 'causation_id', '');
  select coalesce(pg_catalog.array_agg(x.value order by x.value collate "C"), '{}'::text[])
    into v_reason_codes
  from (select distinct value from pg_catalog.jsonb_array_elements_text(coalesce(p_evaluation -> 'reason_codes', '[]'::jsonb))) x;

  if v_decision_id is null or v_request_id is null or v_app_code is null
     or v_permission_key !~ '^[a-z0-9][a-z0-9_.:-]*$' or v_permission_key ~ '[*%]'
     or pg_catalog.lower(v_app_code) is distinct from pg_catalog.split_part(v_permission_key, '.', 1)
     or v_requirement not in ('FULL_PREVIEW', 'DECISION_ONLY', 'NOT_ALLOWED')
     or v_hypothetical_context_id is null
     or v_outcome not in ('WOULD_ALLOW', 'WOULD_DENY', 'INDETERMINATE')
     or pg_catalog.cardinality(v_reason_codes) < 1
     or v_auth_version is null or v_catalog_version is null
     or pg_catalog.jsonb_typeof(v_sources) <> 'object' or pg_catalog.jsonb_typeof(v_source_fps) <> 'object'
     or pg_catalog.jsonb_typeof(v_request) <> 'object' or pg_catalog.octet_length(v_request::text) > 32768 then
    raise exception using errcode = '22023', message = 'AUTH_DB_013_EVALUATION_IDENTITY_INVALID';
  end if;
  select c.simulation_requirement
  into v_expected_requirement
  from (
    values
      ('shell.access', 'FULL_PREVIEW'),
      ('anima.access', 'FULL_PREVIEW'),
      ('anima.attendance.shifts.create', 'FULL_PREVIEW'),
      ('anima.attendance.shifts.update', 'FULL_PREVIEW'),
      ('anima.attendance.shifts.cancel', 'FULL_PREVIEW'),
      ('anima.workforce.employee_documents.view', 'DECISION_ONLY'),
      ('anima.workforce.employee_documents.upload', 'DECISION_ONLY'),
      ('anima.workforce.employee_documents.delete', 'DECISION_ONLY'),
      ('anima.workforce.employee_photos.upload', 'DECISION_ONLY'),
      ('anima.workforce.team_members.view', 'DECISION_ONLY'),
      ('anima.workforce.staff_invitations.create', 'DECISION_ONLY'),
      ('aura.access', 'NOT_ALLOWED'),
      ('fogo.access', 'FULL_PREVIEW'),
      ('fogo.production.batches.view', 'FULL_PREVIEW'),
      ('fogo.production.batches.create', 'FULL_PREVIEW'),
      ('fogo.production.orders.view', 'FULL_PREVIEW'),
      ('fogo.production.recipe_book.view', 'FULL_PREVIEW'),
      ('fogo.production.recipes.view', 'DECISION_ONLY'),
      ('nexo.access', 'FULL_PREVIEW'),
      ('nexo.catalog.products.view', 'FULL_PREVIEW'),
      ('nexo.catalog.products.create', 'FULL_PREVIEW'),
      ('nexo.catalog.presentations.view', 'FULL_PREVIEW'),
      ('nexo.catalog.request_policies.view', 'FULL_PREVIEW'),
      ('nexo.catalog.categories.view', 'FULL_PREVIEW'),
      ('nexo.catalog.units.view', 'FULL_PREVIEW'),
      ('nexo.assets.items.view', 'FULL_PREVIEW'),
      ('nexo.assets.items.create', 'FULL_PREVIEW'),
      ('nexo.assets.groups.view', 'FULL_PREVIEW'),
      ('nexo.assets.counts.view', 'FULL_PREVIEW'),
      ('nexo.inventory.adjustments.view', 'FULL_PREVIEW'),
      ('nexo.inventory.adjustments.register', 'FULL_PREVIEW'),
      ('nexo.inventory.entries.view', 'FULL_PREVIEW'),
      ('nexo.inventory.entries.register', 'FULL_PREVIEW'),
      ('nexo.inventory.entries.override', 'FULL_PREVIEW'),
      ('nexo.inventory.locations.view', 'FULL_PREVIEW'),
      ('nexo.inventory.location_assignments.assign', 'FULL_PREVIEW'),
      ('nexo.inventory.location_catalog.update', 'FULL_PREVIEW'),
      ('nexo.inventory.lpns.view', 'FULL_PREVIEW'),
      ('nexo.inventory.movements.view', 'FULL_PREVIEW'),
      ('nexo.inventory.stock.view', 'FULL_PREVIEW'),
      ('nexo.inventory.production_batches.view', 'FULL_PREVIEW'),
      ('nexo.inventory.transfers.view', 'FULL_PREVIEW'),
      ('nexo.inventory.transfers.create', 'FULL_PREVIEW'),
      ('nexo.inventory.withdrawals.view', 'FULL_PREVIEW'),
      ('nexo.inventory.withdrawals.register', 'FULL_PREVIEW'),
      ('nexo.inventory.zones.view', 'FULL_PREVIEW'),
      ('nexo.inventory.storage_positions.view', 'FULL_PREVIEW'),
      ('nexo.inventory.warehouse_operations.view', 'FULL_PREVIEW'),
      ('nexo.inventory.stock_validations.perform', 'FULL_PREVIEW'),
      ('nexo.inventory.stock_counts.view', 'FULL_PREVIEW'),
      ('nexo.inventory.stock_counts.perform', 'FULL_PREVIEW'),
      ('nexo.inventory.initial_counts.view', 'FULL_PREVIEW'),
      ('nexo.inventory.remissions.view', 'FULL_PREVIEW'),
      ('nexo.inventory.remissions.update', 'FULL_PREVIEW'),
      ('nexo.inventory.remissions.request', 'FULL_PREVIEW'),
      ('nexo.inventory.remissions.prepare', 'FULL_PREVIEW'),
      ('nexo.inventory.remissions.receive', 'FULL_PREVIEW'),
      ('nexo.inventory.remissions.cancel', 'FULL_PREVIEW'),
      ('nexo.logistics.operations_board.view', 'FULL_PREVIEW'),
      ('nexo.logistics.operations.view', 'FULL_PREVIEW'),
      ('nexo.logistics.driver_operations.view', 'FULL_PREVIEW'),
      ('nexo.logistics.fulfillment.view', 'FULL_PREVIEW'),
      ('nexo.logistics.fulfillment_routes.view', 'FULL_PREVIEW'),
      ('nexo.logistics.supply_routes.view', 'FULL_PREVIEW'),
      ('nexo.printing.templates.update', 'FULL_PREVIEW'),
      ('nexo.printing.jobs.view', 'FULL_PREVIEW'),
      ('nexo.settings.sites.view', 'FULL_PREVIEW'),
      ('nexo.settings.remission_policies.view', 'FULL_PREVIEW'),
      ('nexo.finance.internal_invoices.view', 'DECISION_ONLY'),
      ('nexo.finance.internal_invoices.generate', 'DECISION_ONLY'),
      ('nexo.finance.internal_invoices.issue', 'DECISION_ONLY'),
      ('nexo.finance.internal_invoices.cancel', 'DECISION_ONLY'),
      ('nexo.finance.internal_invoice_amounts.view', 'DECISION_ONLY'),
      ('nexo.finance.internal_prices.view', 'DECISION_ONLY'),
      ('nexo.finance.internal_variances.view', 'DECISION_ONLY'),
      ('nexo.finance.internal_variances.approve', 'DECISION_ONLY'),
      ('nexo.finance.internal_variances.resolve', 'DECISION_ONLY'),
      ('nexo.finance.cost_centers.view', 'DECISION_ONLY'),
      ('nexo.analytics.internal_reports.view', 'DECISION_ONLY'),
      ('nexo.analytics.margin_reports.view', 'DECISION_ONLY'),
      ('numera.access', 'FULL_PREVIEW'),
      ('numera.finance.cost_centers.view', 'DECISION_ONLY'),
      ('numera.finance.expenses.view', 'DECISION_ONLY'),
      ('numera.analytics.break_even.view', 'DECISION_ONLY'),
      ('numera.analytics.profitability.view', 'DECISION_ONLY'),
      ('numera.analytics.financial_reports.view', 'DECISION_ONLY'),
      ('origo.access', 'FULL_PREVIEW'),
      ('origo.catalog.product_reviews.view', 'FULL_PREVIEW'),
      ('origo.procurement.purchase_orders.view', 'DECISION_ONLY'),
      ('origo.procurement.receipts.view', 'DECISION_ONLY'),
      ('origo.procurement.suppliers.view', 'DECISION_ONLY'),
      ('pass.access', 'NOT_ALLOWED'),
      ('pulso.access', 'FULL_PREVIEW'),
      ('pulso.delivery.deliveries.override', 'FULL_PREVIEW'),
      ('viso.access', 'FULL_PREVIEW'),
      ('viso.platform.app_updates.view', 'FULL_PREVIEW'),
      ('viso.organization.businesses.view', 'FULL_PREVIEW'),
      ('viso.workforce.staff_calendar.view', 'FULL_PREVIEW'),
      ('viso.workforce.schedules.view', 'FULL_PREVIEW'),
      ('viso.workforce.vacancies.view', 'FULL_PREVIEW'),
      ('viso.catalog.commercial_categories.view', 'FULL_PREVIEW'),
      ('viso.content.content_blocks.view', 'FULL_PREVIEW'),
      ('viso.content.menu.view', 'FULL_PREVIEW'),
      ('viso.content.website_content.view', 'FULL_PREVIEW'),
      ('viso.delivery.rates.view', 'FULL_PREVIEW'),
      ('viso.loyalty.products.view', 'FULL_PREVIEW'),
      ('viso.workforce.employees.view', 'DECISION_ONLY'),
      ('viso.authorization.audit_logs.view', 'DECISION_ONLY'),
      ('viso.finance.accounting.view', 'DECISION_ONLY'),
      ('viso.loyalty.customers.view', 'DECISION_ONLY'),
      ('viso.authorization.context_simulations.view', 'NOT_ALLOWED'),
      ('pulso.sales.orders.create', 'FULL_PREVIEW'),
      ('pulso.payments.transactions.collect', 'FULL_PREVIEW'),
      ('pulso.cash.sessions.start', 'FULL_PREVIEW'),
      ('pulso.cash.sessions.close', 'FULL_PREVIEW'),
      ('pulso.payments.transactions.reverse', 'DECISION_ONLY'),
      ('pulso.sales.orders.cancel', 'DECISION_ONLY'),
      ('pulso.sales.returns.create', 'DECISION_ONLY'),
      ('pulso.payments.transactions.refund', 'DECISION_ONLY'),
      ('pulso.sales.discounts.apply', 'DECISION_ONLY'),
      ('nexo.inventory.remissions.accept_custody', 'FULL_PREVIEW'),
      ('nexo.inventory.remissions.start_transit', 'FULL_PREVIEW'),
      ('nexo.inventory.remissions.deliver', 'FULL_PREVIEW'),
      ('nexo.inventory.stock_count_variances.approve', 'DECISION_ONLY'),
      ('nexo.inventory.stock_count_variances.resolve', 'DECISION_ONLY'),
      ('origo.procurement.receipts.register', 'FULL_PREVIEW'),
      ('viso.authorization.base_grants.view', 'DECISION_ONLY'),
      ('viso.authorization.base_grants.create', 'DECISION_ONLY'),
      ('viso.authorization.base_grants.approve', 'DECISION_ONLY'),
      ('viso.authorization.base_grants.suspend', 'DECISION_ONLY'),
      ('viso.authorization.base_grants.revoke', 'DECISION_ONLY'),
      ('viso.authorization.operational_grants.view', 'DECISION_ONLY'),
      ('viso.authorization.operational_grants.create', 'DECISION_ONLY'),
      ('viso.authorization.operational_grants.approve', 'DECISION_ONLY'),
      ('viso.authorization.operational_grants.suspend', 'DECISION_ONLY'),
      ('viso.authorization.operational_grants.revoke', 'DECISION_ONLY'),
      ('viso.authorization.denials.view', 'DECISION_ONLY'),
      ('viso.authorization.denials.create', 'DECISION_ONLY'),
      ('viso.authorization.denials.approve', 'DECISION_ONLY'),
      ('viso.authorization.denials.revoke', 'DECISION_ONLY')
  ) as c(permission_key, simulation_requirement)
  where c.permission_key = v_permission_key;

  if v_expected_requirement is null then
    raise exception using errcode = '42501', message = 'AUTH_DB_013_PERMISSION_NOT_CLASSIFIED';
  end if;
  if v_requirement is distinct from v_expected_requirement then
    raise exception using errcode = '42501', message = 'AUTH_DB_013_SIMULATION_REQUIREMENT_MISMATCH';
  end if;
  if v_expected_requirement = 'NOT_ALLOWED' then
    raise exception using errcode = '42501', message = 'AUTH_DB_013_EVALUATION_NOT_ALLOWED';
  end if;
  if exists (select 1 from pg_catalog.jsonb_each_text(v_source_fps) x where x.value !~ '^sha256:[0-9a-f]{64}$') then
    raise exception using errcode = '22023', message = 'AUTH_DB_013_EVALUATION_SOURCE_FINGERPRINT_INVALID';
  end if;

  select s.* into v_root from audit.authorization_simulations s where s.simulation_id = v_simulation_id for update;
  if not found then raise exception using errcode = 'P0002', message = 'AUTH_DB_013_SIMULATION_NOT_FOUND'; end if;
  if app_private.derive_authorization_simulation_status(v_simulation_id) <> 'ACTIVE' then
    raise exception using errcode = '55000', message = 'AUTH_DB_013_EVALUATION_REQUIRES_ACTIVE';
  end if;
  select r.* into v_current_revision from audit.authorization_simulation_revisions r
  where r.simulation_id = v_simulation_id order by r.revision_number desc limit 1;
  if v_current_revision.simulation_revision_id <> v_revision_id then
    raise exception using errcode = '40001', message = 'AUTH_DB_013_EVALUATION_REVISION_STALE';
  end if;
  if v_current_revision.policy_snapshot ->> 'permission_key' is distinct from v_permission_key
     or pg_catalog.lower(v_current_revision.policy_snapshot ->> 'app_code') is distinct from pg_catalog.lower(v_app_code)
     or v_current_revision.policy_snapshot ->> 'simulation_requirement' is distinct from v_expected_requirement then
    raise exception using errcode = '42501', message = 'AUTH_DB_013_POLICY_SNAPSHOT_MISMATCH';
  end if;

  select d.* into v_decision from audit.authorization_decisions d where d.decision_id = v_decision_id;
  if not found or v_decision.outcome <> 'ALLOW' or v_decision.actor_id is null then
    raise exception using errcode = '42501', message = 'AUTH_DB_013_EVALUATION_DECISION_NOT_AUTHORIZED';
  end if;
  v_correlation := coalesce(v_correlation, v_decision.correlation_id, v_root.correlation_id);
  if v_correlation is null then raise exception using errcode = '22023', message = 'AUTH_DB_013_CORRELATION_REQUIRED'; end if;

  v_request_fp := app_private.fingerprint_authorization_simulation(v_request);
  select e.* into v_existing from audit.authorization_simulation_evaluations e
  where e.simulation_revision_id = v_revision_id and e.evaluation_request_id = v_request_id;
  if found then
    if v_existing.request_fingerprint <> v_request_fp then
      raise exception using errcode = '23505', message = 'AUTH_DB_013_EVALUATION_IDEMPOTENCY_CONFLICT';
    end if;
    return pg_catalog.jsonb_build_object('simulated_decision_id', v_existing.simulated_decision_id,
      'simulation_id', v_simulation_id, 'simulation_revision_id', v_revision_id,
      'outcome', v_existing.outcome, 'executable', false, 'idempotent', true);
  end if;

  v_eval_fp := app_private.fingerprint_authorization_simulation(pg_catalog.jsonb_build_object(
    'simulation_id', v_simulation_id, 'simulation_revision_id', v_revision_id,
    'scenario_fingerprint', v_current_revision.scenario_fingerprint, 'request_fingerprint', v_request_fp,
    'permission_key', v_permission_key, 'resource_scenario_id', v_resource_scenario_id,
    'outcome', v_outcome, 'reason_codes', to_jsonb(v_reason_codes),
    'authorization_contract_version', v_auth_version, 'catalog_version', v_catalog_version,
    'source_fingerprints', v_source_fps
  ));
  insert into audit.authorization_simulation_evaluations (
    simulated_decision_id, simulation_id, simulation_revision_id, requester_authorization_decision_id,
    evaluation_request_id, evaluated_at, app_code, permission_key, simulation_requirement,
    resource_scenario_id, hypothetical_context_id, outcome, reason_codes, executable,
    scenario_fingerprint, authorization_contract_version, catalog_version, source_versions,
    source_fingerprints, request_fingerprint, evaluation_fingerprint, source_contract_sha256
  ) values (
    v_simulated_decision_id, v_simulation_id, v_revision_id, v_decision_id, v_request_id, v_now,
    v_app_code, v_permission_key, v_requirement, v_resource_scenario_id, v_hypothetical_context_id,
    v_outcome, v_reason_codes, false, v_current_revision.scenario_fingerprint, v_auth_version,
    v_catalog_version, v_sources, v_source_fps, v_request_fp, v_eval_fp,
    '4ec891da4fdf4bc85ccc3a2084f50add7d7957fcb53e28a949039eb2f79075a7'
  );

  v_event_operation_fp := app_private.fingerprint_authorization_simulation(pg_catalog.jsonb_build_object(
    'event_type', 'SIMULATION_EVALUATED', 'simulation_id', v_simulation_id, 'revision_id', v_revision_id,
    'simulated_decision_id', v_simulated_decision_id, 'authorization_decision_id', v_decision_id,
    'correlation_id', v_correlation
  ));
  v_event_fp := app_private.fingerprint_authorization_simulation(pg_catalog.jsonb_build_object('event_id', v_event_id, 'operation_fingerprint', v_event_operation_fp, 'occurred_at', v_now));
  insert into audit.authorization_simulation_events (
    event_id, simulation_id, simulation_revision_id, simulated_decision_id, event_type, operation_id,
    real_actor_id, technical_principal_id, authorization_decision_id, reason_code, correlation_id,
    causation_id, occurred_at, operation_fingerprint, event_fingerprint, source_contract_sha256
  ) values (
    v_event_id, v_simulation_id, v_revision_id, v_simulated_decision_id, 'SIMULATION_EVALUATED',
    'EVALUATION:' || v_simulated_decision_id::text, v_decision.actor_id, session_user, v_decision_id,
    'SIMULATION_EVALUATED', v_correlation, v_causation, v_now, v_event_operation_fp, v_event_fp,
    '4ec891da4fdf4bc85ccc3a2084f50add7d7957fcb53e28a949039eb2f79075a7'
  );

  insert into audit.authorization_simulation_links (
    simulation_link_id, simulation_id, simulation_revision_id, simulated_decision_id, link_kind,
    reference_type, reference_id, correlation_id, causation_id, occurred_at, link_fingerprint,
    source_contract_sha256
  ) values (
    extensions.gen_random_uuid(), v_simulation_id, v_revision_id, v_simulated_decision_id,
    'SIMULATED_EVALUATION', 'SimulatedAuthorizationDecision', v_simulated_decision_id::text,
    v_correlation, v_causation, v_now,
    app_private.fingerprint_authorization_simulation(pg_catalog.jsonb_build_object('simulation_id', v_simulation_id, 'kind', 'SIMULATED_EVALUATION', 'reference_id', v_simulated_decision_id)),
    '4ec891da4fdf4bc85ccc3a2084f50add7d7957fcb53e28a949039eb2f79075a7'
  );

  return pg_catalog.jsonb_build_object('simulated_decision_id', v_simulated_decision_id,
    'simulation_id', v_simulation_id, 'simulation_revision_id', v_revision_id,
    'outcome', v_outcome, 'reason_codes', to_jsonb(v_reason_codes), 'executable', false,
    'evaluation_fingerprint', v_eval_fp, 'idempotent', false);
end
$auth_db_013_append_evaluation$;

create or replace function app_private.append_authorization_simulation_attempt(p_attempt jsonb)
returns jsonb
language plpgsql
volatile
security definer
strict
set search_path = pg_catalog, audit, app_private, extensions
as $auth_db_013_append_attempt$
declare
  v_now timestamptz := pg_catalog.statement_timestamp();
  v_attempt_id uuid := extensions.gen_random_uuid();
  v_simulation_id uuid;
  v_decision_id text;
  v_decision audit.authorization_decisions%rowtype;
  v_operation text;
  v_result text;
  v_reason text;
  v_error text;
  v_result_reference text;
  v_session text;
  v_correlation text;
  v_causation text;
  v_request jsonb;
  v_sources jsonb;
  v_source_fps jsonb;
  v_request_fp text;
  v_attempt_fp text;
begin
  if pg_catalog.jsonb_typeof(p_attempt) <> 'object'
     or p_attempt::text ~* '"(jwt|refresh_token|access_token|service_role|api_key|pin|password|credential_secret|private_key|raw_session_token|cookie|authorization_header)"[[:space:]]*:'
     or exists (select 1 from pg_catalog.jsonb_object_keys(p_attempt) k where k not in (
       'simulation_id', 'authorization_decision_id', 'operation_kind', 'attempt_result', 'reason_code',
       'error_class', 'result_reference', 'real_session_reference', 'correlation_id', 'causation_id',
       'request', 'source_versions', 'source_fingerprints'
     )) then
    raise exception using errcode = '22023', message = 'AUTH_DB_013_ATTEMPT_ENVELOPE_INVALID';
  end if;
  if nullif(p_attempt ->> 'simulation_id', '') is not null then
    begin v_simulation_id := (p_attempt ->> 'simulation_id')::uuid;
    exception when others then raise exception using errcode = '22023', message = 'AUTH_DB_013_ATTEMPT_SIMULATION_ID_INVALID'; end;
  end if;
  v_decision_id := nullif(p_attempt ->> 'authorization_decision_id', '');
  v_operation := nullif(p_attempt ->> 'operation_kind', '');
  v_result := nullif(p_attempt ->> 'attempt_result', '');
  v_reason := nullif(p_attempt ->> 'reason_code', '');
  v_error := nullif(p_attempt ->> 'error_class', '');
  v_result_reference := nullif(p_attempt ->> 'result_reference', '');
  v_session := nullif(p_attempt ->> 'real_session_reference', '');
  v_correlation := nullif(p_attempt ->> 'correlation_id', '');
  v_causation := nullif(p_attempt ->> 'causation_id', '');
  v_request := p_attempt -> 'request';
  v_sources := coalesce(p_attempt -> 'source_versions', '{}'::jsonb);
  v_source_fps := coalesce(p_attempt -> 'source_fingerprints', '{}'::jsonb);
  if v_operation not in ('CREATE_SIMULATION', 'ACTIVATE_SIMULATION', 'REVISE_SIMULATION', 'EVALUATE_SIMULATION',
      'COMPLETE_SIMULATION', 'EXPIRE_SIMULATION', 'REVOKE_SIMULATION', 'INVALIDATE_SIMULATION', 'CORRECT_AUDIT', 'LINK_EVIDENCE')
     or v_result not in ('DENIED', 'INVALID', 'CONFLICT', 'TECHNICAL_FAILURE', 'NO_CHANGE', 'ROLLED_BACK')
     or v_reason !~ '^[A-Z][A-Z0-9_]{2,127}$'
     or (v_result = 'TECHNICAL_FAILURE' and v_error is null)
     or (v_result = 'ROLLED_BACK' and v_result_reference is null)
     or pg_catalog.jsonb_typeof(v_request) <> 'object'
     or pg_catalog.jsonb_typeof(v_sources) <> 'object' or pg_catalog.jsonb_typeof(v_source_fps) <> 'object' then
    raise exception using errcode = '22023', message = 'AUTH_DB_013_ATTEMPT_IDENTITY_INVALID';
  end if;
  if v_decision_id is not null then
    select d.* into v_decision from audit.authorization_decisions d where d.decision_id = v_decision_id;
    if not found then raise exception using errcode = '23503', message = 'AUTH_DB_013_ATTEMPT_DECISION_MISSING'; end if;
    if v_result = 'DENIED' and v_decision.outcome <> 'DENY' then
      raise exception using errcode = '22023', message = 'AUTH_DB_013_DENIED_ATTEMPT_REQUIRES_DENY';
    end if;
    v_correlation := coalesce(v_correlation, v_decision.correlation_id);
  elsif v_result = 'DENIED' then
    raise exception using errcode = '22023', message = 'AUTH_DB_013_DENIED_ATTEMPT_REQUIRES_DECISION';
  end if;
  if v_correlation is null then raise exception using errcode = '22023', message = 'AUTH_DB_013_CORRELATION_REQUIRED'; end if;
  v_request_fp := app_private.fingerprint_authorization_simulation(v_request);
  v_attempt_fp := app_private.fingerprint_authorization_simulation(pg_catalog.jsonb_build_object(
    'attempt_id', v_attempt_id, 'simulation_id', v_simulation_id, 'operation_kind', v_operation,
    'attempt_result', v_result, 'reason_code', v_reason, 'error_class', v_error,
    'result_reference', v_result_reference, 'request_fingerprint', v_request_fp,
    'correlation_id', v_correlation, 'source_fingerprints', v_source_fps
  ));
  insert into audit.authorization_simulation_attempts (
    attempt_id, simulation_id, occurred_at, real_principal_id, real_actor_id, technical_principal_id,
    real_session_reference, authorization_decision_id, operation_kind, attempt_result, reason_code,
    error_class, result_reference, correlation_id, causation_id, request_fingerprint, source_versions,
    source_fingerprints, attempt_fingerprint, source_contract_sha256
  ) values (
    v_attempt_id, v_simulation_id, v_now,
    case when v_decision_id is null then null else v_decision.principal_id end,
    case when v_decision_id is null then null else v_decision.actor_id end,
    session_user, v_session, v_decision_id, v_operation, v_result, v_reason, v_error, v_result_reference,
    v_correlation, v_causation, v_request_fp, v_sources, v_source_fps, v_attempt_fp,
    '4ec891da4fdf4bc85ccc3a2084f50add7d7957fcb53e28a949039eb2f79075a7'
  );
  return pg_catalog.jsonb_build_object('attempt_id', v_attempt_id, 'simulation_id', v_simulation_id,
    'attempt_result', v_result, 'attempt_fingerprint', v_attempt_fp);
end
$auth_db_013_append_attempt$;

create or replace function app_private.link_authorization_simulation_evidence(p_link jsonb)
returns jsonb
language plpgsql
volatile
security definer
strict
set search_path = pg_catalog, audit, app_private, extensions
as $auth_db_013_link$
declare
  v_now timestamptz := pg_catalog.statement_timestamp();
  v_link_id uuid := extensions.gen_random_uuid();
  v_simulation_id uuid;
  v_revision_id uuid;
  v_evaluation_id uuid;
  v_kind text;
  v_reference_type text;
  v_reference_id text;
  v_correlation text;
  v_causation text;
  v_fp text;
  v_existing audit.authorization_simulation_links%rowtype;
begin
  if pg_catalog.jsonb_typeof(p_link) <> 'object'
     or p_link::text ~* '"(jwt|refresh_token|access_token|service_role|api_key|pin|password|credential_secret|private_key|raw_session_token|cookie|authorization_header)"[[:space:]]*:'
     or exists (select 1 from pg_catalog.jsonb_object_keys(p_link) k where k not in (
       'simulation_id', 'simulation_revision_id', 'simulated_decision_id', 'link_kind',
       'reference_type', 'reference_id', 'correlation_id', 'causation_id'
     )) then
    raise exception using errcode = '22023', message = 'AUTH_DB_013_LINK_ENVELOPE_INVALID';
  end if;
  begin v_simulation_id := (p_link ->> 'simulation_id')::uuid;
  exception when others then raise exception using errcode = '22023', message = 'AUTH_DB_013_LINK_SIMULATION_ID_INVALID'; end;
  if nullif(p_link ->> 'simulation_revision_id', '') is not null then v_revision_id := (p_link ->> 'simulation_revision_id')::uuid; end if;
  if nullif(p_link ->> 'simulated_decision_id', '') is not null then v_evaluation_id := (p_link ->> 'simulated_decision_id')::uuid; end if;
  v_kind := nullif(p_link ->> 'link_kind', '');
  v_reference_type := nullif(p_link ->> 'reference_type', '');
  v_reference_id := nullif(p_link ->> 'reference_id', '');
  v_correlation := nullif(p_link ->> 'correlation_id', '');
  v_causation := nullif(p_link ->> 'causation_id', '');
  if v_kind not in ('REQUESTER_AUTHORIZATION_DECISION', 'REAL_ACCESS_CONTEXT', 'REAL_AUTH_SESSION', 'DEVICE_CONTEXT',
       'SIMULATED_EVALUATION', 'RESOURCE_REFERENCE', 'EVIDENCE_REFERENCE', 'CORRECTION')
     or v_reference_type is null or v_reference_id is null then
    raise exception using errcode = '22023', message = 'AUTH_DB_013_LINK_IDENTITY_INVALID';
  end if;
  v_fp := app_private.fingerprint_authorization_simulation(pg_catalog.jsonb_build_object(
    'simulation_id', v_simulation_id, 'revision_id', v_revision_id, 'evaluation_id', v_evaluation_id,
    'link_kind', v_kind, 'reference_type', v_reference_type, 'reference_id', v_reference_id,
    'correlation_id', v_correlation, 'causation_id', v_causation
  ));
  select l.* into v_existing from audit.authorization_simulation_links l
  where l.simulation_id = v_simulation_id
    and l.simulation_revision_id is not distinct from v_revision_id
    and l.simulated_decision_id is not distinct from v_evaluation_id
    and l.link_kind = v_kind and l.reference_type = v_reference_type and l.reference_id = v_reference_id;
  if found then
    if v_existing.link_fingerprint <> v_fp then raise exception using errcode = '23505', message = 'AUTH_DB_013_LINK_IDEMPOTENCY_CONFLICT'; end if;
    return pg_catalog.jsonb_build_object('simulation_link_id', v_existing.simulation_link_id, 'idempotent', true);
  end if;
  insert into audit.authorization_simulation_links (
    simulation_link_id, simulation_id, simulation_revision_id, simulated_decision_id, link_kind,
    reference_type, reference_id, correlation_id, causation_id, occurred_at, link_fingerprint,
    source_contract_sha256
  ) values (
    v_link_id, v_simulation_id, v_revision_id, v_evaluation_id, v_kind, v_reference_type, v_reference_id,
    v_correlation, v_causation, v_now, v_fp,
    '4ec891da4fdf4bc85ccc3a2084f50add7d7957fcb53e28a949039eb2f79075a7'
  );
  return pg_catalog.jsonb_build_object('simulation_link_id', v_link_id, 'idempotent', false);
end
$auth_db_013_link$;

create or replace function app_private.correct_authorization_simulation_audit(p_correction jsonb)
returns jsonb
language plpgsql
volatile
security definer
strict
set search_path = pg_catalog, audit, app_private, extensions
as $auth_db_013_correct$
declare
  v_now timestamptz := pg_catalog.statement_timestamp();
  v_correction_id uuid := extensions.gen_random_uuid();
  v_event_id uuid := extensions.gen_random_uuid();
  v_simulation_id uuid;
  v_target_kind text;
  v_target_id text;
  v_reason text;
  v_decision_id text;
  v_decision audit.authorization_decisions%rowtype;
  v_payload jsonb;
  v_correlation text;
  v_causation text;
  v_fp text;
  v_event_operation_fp text;
  v_event_fp text;
begin
  if pg_catalog.jsonb_typeof(p_correction) <> 'object'
     or p_correction::text ~* '"(jwt|refresh_token|access_token|service_role|api_key|pin|password|credential_secret|private_key|raw_session_token|cookie|authorization_header)"[[:space:]]*:'
     or exists (select 1 from pg_catalog.jsonb_object_keys(p_correction) k where k not in (
       'simulation_id', 'target_kind', 'target_id', 'reason_code', 'authorization_decision_id',
       'correction_payload', 'correlation_id', 'causation_id'
     )) then
    raise exception using errcode = '22023', message = 'AUTH_DB_013_CORRECTION_ENVELOPE_INVALID';
  end if;
  begin v_simulation_id := (p_correction ->> 'simulation_id')::uuid;
  exception when others then raise exception using errcode = '22023', message = 'AUTH_DB_013_CORRECTION_SIMULATION_ID_INVALID'; end;
  v_target_kind := nullif(p_correction ->> 'target_kind', '');
  v_target_id := nullif(p_correction ->> 'target_id', '');
  v_reason := nullif(p_correction ->> 'reason_code', '');
  v_decision_id := nullif(p_correction ->> 'authorization_decision_id', '');
  v_payload := p_correction -> 'correction_payload';
  v_correlation := nullif(p_correction ->> 'correlation_id', '');
  v_causation := nullif(p_correction ->> 'causation_id', '');
  if v_target_kind not in ('ROOT', 'REVISION', 'EVALUATION', 'EVENT', 'ATTEMPT', 'LINK')
     or v_target_id is null or v_reason !~ '^[A-Z][A-Z0-9_]{2,127}$' or v_decision_id is null
     or pg_catalog.jsonb_typeof(v_payload) <> 'object'
     or exists (select 1 from pg_catalog.jsonb_object_keys(v_payload) k where k not in (
       'schema_version', 'correction_kind', 'clarification', 'replacement_reference', 'source_evidence_reference'
     )) then
    raise exception using errcode = '22023', message = 'AUTH_DB_013_CORRECTION_IDENTITY_INVALID';
  end if;
  if v_payload ?| array['outcome', 'executable', 'status', 'can_operate', 'permission', 'token'] then
    raise exception using errcode = '22023', message = 'AUTH_DB_013_CORRECTION_AUTHORITY_MUTATION_FORBIDDEN';
  end if;
  select d.* into v_decision from audit.authorization_decisions d where d.decision_id = v_decision_id;
  if not found or v_decision.outcome <> 'ALLOW' or v_decision.actor_id is null then
    raise exception using errcode = '42501', message = 'AUTH_DB_013_CORRECTION_DECISION_NOT_AUTHORIZED';
  end if;
  v_correlation := coalesce(v_correlation, v_decision.correlation_id);
  if v_correlation is null then raise exception using errcode = '22023', message = 'AUTH_DB_013_CORRELATION_REQUIRED'; end if;

  if v_target_kind = 'ROOT' and not exists (select 1 from audit.authorization_simulations s where s.simulation_id = v_simulation_id and s.simulation_id::text = v_target_id) then
    raise exception using errcode = 'P0002', message = 'AUTH_DB_013_CORRECTION_TARGET_MISSING';
  elsif v_target_kind = 'REVISION' and not exists (select 1 from audit.authorization_simulation_revisions r where r.simulation_id = v_simulation_id and r.simulation_revision_id::text = v_target_id) then
    raise exception using errcode = 'P0002', message = 'AUTH_DB_013_CORRECTION_TARGET_MISSING';
  elsif v_target_kind = 'EVALUATION' and not exists (select 1 from audit.authorization_simulation_evaluations e where e.simulation_id = v_simulation_id and e.simulated_decision_id::text = v_target_id) then
    raise exception using errcode = 'P0002', message = 'AUTH_DB_013_CORRECTION_TARGET_MISSING';
  elsif v_target_kind = 'EVENT' and not exists (select 1 from audit.authorization_simulation_events e where e.simulation_id = v_simulation_id and e.event_id::text = v_target_id) then
    raise exception using errcode = 'P0002', message = 'AUTH_DB_013_CORRECTION_TARGET_MISSING';
  elsif v_target_kind = 'ATTEMPT' and not exists (select 1 from audit.authorization_simulation_attempts a where a.simulation_id = v_simulation_id and a.attempt_id::text = v_target_id) then
    raise exception using errcode = 'P0002', message = 'AUTH_DB_013_CORRECTION_TARGET_MISSING';
  elsif v_target_kind = 'LINK' and not exists (select 1 from audit.authorization_simulation_links l where l.simulation_id = v_simulation_id and l.simulation_link_id::text = v_target_id) then
    raise exception using errcode = 'P0002', message = 'AUTH_DB_013_CORRECTION_TARGET_MISSING';
  end if;

  v_fp := app_private.fingerprint_authorization_simulation(pg_catalog.jsonb_build_object(
    'correction_id', v_correction_id, 'simulation_id', v_simulation_id, 'target_kind', v_target_kind,
    'target_id', v_target_id, 'reason_code', v_reason, 'real_actor_id', v_decision.actor_id,
    'authorization_decision_id', v_decision_id, 'correction_payload', v_payload, 'correlation_id', v_correlation
  ));
  insert into audit.authorization_simulation_corrections (
    correction_id, simulation_id, target_kind, target_id, reason_code, real_actor_id,
    technical_principal_id, authorization_decision_id, correction_payload, correlation_id,
    causation_id, occurred_at, correction_fingerprint, source_contract_sha256
  ) values (
    v_correction_id, v_simulation_id, v_target_kind, v_target_id, v_reason, v_decision.actor_id,
    session_user, v_decision_id, v_payload, v_correlation, v_causation, v_now, v_fp,
    '4ec891da4fdf4bc85ccc3a2084f50add7d7957fcb53e28a949039eb2f79075a7'
  );

  v_event_operation_fp := app_private.fingerprint_authorization_simulation(pg_catalog.jsonb_build_object(
    'event_type', 'SIMULATION_CORRECTION_LINKED', 'simulation_id', v_simulation_id,
    'correction_id', v_correction_id, 'authorization_decision_id', v_decision_id, 'correlation_id', v_correlation
  ));
  v_event_fp := app_private.fingerprint_authorization_simulation(pg_catalog.jsonb_build_object('event_id', v_event_id, 'operation_fingerprint', v_event_operation_fp, 'occurred_at', v_now));
  insert into audit.authorization_simulation_events (
    event_id, simulation_id, event_type, operation_id, real_actor_id, technical_principal_id,
    authorization_decision_id, reason_code, correlation_id, causation_id, occurred_at,
    operation_fingerprint, event_fingerprint, source_contract_sha256
  ) values (
    v_event_id, v_simulation_id, 'SIMULATION_CORRECTION_LINKED', 'CORRECTION:' || v_correction_id::text,
    v_decision.actor_id, session_user, v_decision_id, v_reason, v_correlation, v_causation, v_now,
    v_event_operation_fp, v_event_fp,
    '4ec891da4fdf4bc85ccc3a2084f50add7d7957fcb53e28a949039eb2f79075a7'
  );
  return pg_catalog.jsonb_build_object('correction_id', v_correction_id, 'simulation_id', v_simulation_id,
    'correction_fingerprint', v_fp);
end
$auth_db_013_correct$;

-- AUTH-DB-013 legacy compatibility containment.
-- The legacy table remains present for consumer-owned retirement, but direct client access is removed.
reset role;

create or replace function public.can_manage_context_simulation_v1(p_user_id uuid default auth.uid())
returns boolean
language sql
stable
security invoker
set search_path = ''
as $auth_db_013_legacy_can_manage$
  select false;
$auth_db_013_legacy_can_manage$;

create or replace function public.get_active_context_simulation_v1()
returns table(
  id uuid,
  user_id uuid,
  site_id uuid,
  area_id uuid,
  area_kind text,
  operational_role text,
  administrative_role text,
  expires_at timestamptz,
  metadata jsonb
)
language sql
stable
security invoker
set search_path = ''
as $auth_db_013_legacy_get_active$
  select
    null::uuid,
    null::uuid,
    null::uuid,
    null::uuid,
    null::text,
    null::text,
    null::text,
    null::timestamptz,
    null::jsonb
  where false;
$auth_db_013_legacy_get_active$;

create or replace function public.get_effective_context_v1(p_app_code text default null::text)
returns table(
  source text,
  session_mode text,
  app_code text,
  user_id uuid,
  real_administrative_role text,
  effective_administrative_role text,
  effective_operational_role text,
  site_id uuid,
  area_id uuid,
  area_kind text,
  shift_id uuid,
  simulation_id uuid,
  shared_device_id uuid,
  is_simulation boolean,
  is_shared_device boolean,
  bypass_applied boolean,
  can_operate boolean,
  blocked_reasons text[],
  metadata jsonb
)
language plpgsql
stable
security definer
set search_path = ''
as $auth_db_013_legacy_effective_context$
declare
  v_app_code text := nullif(pg_catalog.btrim(pg_catalog.lower(coalesce(p_app_code, ''))), '');
  v_device record;
  v_real record;
  v_real_role text;
  v_area_kind text;
begin
  select e.role
  into v_real_role
  from public.employees e
  where e.id = auth.uid()
  limit 1;

  select *
  into v_device
  from public.current_shared_operational_device_v1()
  limit 1;

  if v_device.id is not null then
    select a.kind
    into v_area_kind
    from public.areas a
    where a.id = v_device.area_id
    limit 1;

    source := 'shared_device';
    session_mode := 'shared_device';
    app_code := v_app_code;
    user_id := auth.uid();
    real_administrative_role := v_real_role;
    effective_administrative_role := null;
    effective_operational_role := nullif(pg_catalog.btrim(coalesce(v_device.navigation_role, '')), '');
    site_id := v_device.site_id;
    area_id := v_device.area_id;
    area_kind := v_area_kind;
    shift_id := null;
    simulation_id := null;
    shared_device_id := v_device.id;
    is_simulation := false;
    is_shared_device := true;
    bypass_applied := false;
    can_operate := v_app_code is null or v_app_code = any(coalesce(v_device.allowed_app_codes, '{}'::text[]));
    blocked_reasons := case when can_operate then '{}'::text[] else array['app_not_allowed']::text[] end;
    metadata := coalesce(v_device.metadata, '{}'::jsonb);
    return next;
    return;
  end if;

  select *
  into v_real
  from public.get_operational_context(auth.uid(), null, coalesce(v_app_code, 'nexo'))
  limit 1;

  source := case
    when coalesce(v_real.bypass_applied, false) then 'administrative_bypass'
    when coalesce(v_real.on_shift_now, false) or coalesce(v_real.checked_in_now, false) then 'anima'
    else 'real'
  end;
  session_mode := 'employee';
  app_code := coalesce(v_real.app_code, v_app_code);
  user_id := auth.uid();
  real_administrative_role := v_real_role;
  effective_administrative_role := v_real_role;
  effective_operational_role := v_real.active_operational_role;
  site_id := v_real.active_site_id;
  area_id := v_real.active_area_id;
  area_kind := v_real.active_area_kind;
  shift_id := v_real.active_shift_id;
  simulation_id := null;
  shared_device_id := null;
  is_simulation := false;
  is_shared_device := false;
  bypass_applied := coalesce(v_real.bypass_applied, false);
  can_operate := coalesce(v_real.can_operate, false);
  blocked_reasons := coalesce(v_real.blocked_reasons, '{}'::text[]);
  metadata := '{}'::jsonb;
  return next;
end;
$auth_db_013_legacy_effective_context$;

create or replace function public.has_effective_permission_v1(
  p_permission_code text,
  p_app_code text default null::text
)
returns boolean
language plpgsql
stable
security definer
set search_path = ''
as $auth_db_013_legacy_effective_permission$
declare
  v_permission text := nullif(pg_catalog.btrim(coalesce(p_permission_code, '')), '');
  v_app text := nullif(pg_catalog.btrim(pg_catalog.lower(coalesce(p_app_code, ''))), '');
  v_context record;
begin
  if v_permission is null then
    return false;
  end if;
  if v_app is null then
    v_app := pg_catalog.split_part(v_permission, '.', 1);
  end if;

  select *
  into v_context
  from public.get_effective_context_v1(v_app)
  limit 1;

  if v_context.user_id is null or not coalesce(v_context.can_operate, false) then
    return false;
  end if;

  if v_context.source = 'shared_device' then
    return nullif(pg_catalog.btrim(coalesce(v_context.effective_operational_role, '')), '') is not null
      and public.has_operational_role_permission(
        v_context.effective_operational_role,
        v_permission,
        v_context.site_id,
        v_context.area_id,
        v_app
      );
  end if;

  return public.has_permission(v_permission, v_context.site_id, v_context.area_id)
    or public.has_operational_permission(v_permission, v_context.site_id, v_context.area_id, v_app);
end;
$auth_db_013_legacy_effective_permission$;

create or replace function public.start_context_simulation_v1(
  p_site_id uuid,
  p_area_id uuid default null::uuid,
  p_operational_role text default null::text,
  p_administrative_role text default null::text,
  p_duration_minutes integer default 240,
  p_metadata jsonb default '{}'::jsonb
)
returns uuid
language plpgsql
volatile
security invoker
set search_path = ''
as $auth_db_013_legacy_start$
begin
  raise exception using errcode = '0A000', message = 'AUTH_DB_013_LEGACY_SIMULATION_START_DISABLED';
end;
$auth_db_013_legacy_start$;

create or replace function public.stop_context_simulation_v1()
returns boolean
language sql
volatile
security invoker
set search_path = ''
as $auth_db_013_legacy_stop$
  select false;
$auth_db_013_legacy_stop$;

revoke all privileges on table public.context_simulation_sessions
from public, anon, authenticated, service_role;

revoke all on function
  public.can_manage_context_simulation_v1(uuid),
  public.get_active_context_simulation_v1(),
  public.get_effective_context_v1(text),
  public.has_effective_permission_v1(text,text),
  public.start_context_simulation_v1(uuid,uuid,text,text,integer,jsonb),
  public.stop_context_simulation_v1()
from public, anon, authenticated, service_role;

grant execute on function
  public.get_effective_context_v1(text),
  public.has_effective_permission_v1(text,text),
  public.start_context_simulation_v1(uuid,uuid,text,text,integer,jsonb),
  public.stop_context_simulation_v1()
to authenticated, service_role;

set local role vento_authorization_owner;

-- Append-only evidence. Direct client DML is also revoked below.
do $auth_db_013_triggers$
declare
  v_table text;
begin
  foreach v_table in array array[
    'authorization_simulations', 'authorization_simulation_revisions', 'authorization_simulation_evaluations',
    'authorization_simulation_events', 'authorization_simulation_attempts', 'authorization_simulation_links',
    'authorization_simulation_corrections'
  ] loop
    execute pg_catalog.format(
      'create trigger %I before update or delete on audit.%I for each row execute function app_private.reject_authorization_simulation_audit_mutation()',
      'trg_auth_db_013_append_only_row', v_table
    );
    execute pg_catalog.format(
      'create trigger %I before truncate on audit.%I for each statement execute function app_private.reject_authorization_simulation_audit_mutation()',
      'trg_auth_db_013_append_only_truncate', v_table
    );
  end loop;
end
$auth_db_013_triggers$;

alter table audit.authorization_simulations enable row level security;
alter table audit.authorization_simulation_revisions enable row level security;
alter table audit.authorization_simulation_evaluations enable row level security;
alter table audit.authorization_simulation_events enable row level security;
alter table audit.authorization_simulation_attempts enable row level security;
alter table audit.authorization_simulation_links enable row level security;
alter table audit.authorization_simulation_corrections enable row level security;

revoke all on table
  audit.authorization_simulations,
  audit.authorization_simulation_revisions,
  audit.authorization_simulation_evaluations,
  audit.authorization_simulation_events,
  audit.authorization_simulation_attempts,
  audit.authorization_simulation_links,
  audit.authorization_simulation_corrections
from public, anon, authenticated, service_role;

revoke all on function
  app_private.canonicalize_authorization_simulation(jsonb),
  app_private.fingerprint_authorization_simulation(jsonb),
  app_private.derive_authorization_simulation_status(uuid),
  app_private.append_authorization_simulation(jsonb),
  app_private.append_authorization_simulation_revision(jsonb),
  app_private.append_authorization_simulation_evaluation(jsonb),
  app_private.append_authorization_simulation_event(jsonb),
  app_private.append_authorization_simulation_attempt(jsonb),
  app_private.link_authorization_simulation_evidence(jsonb),
  app_private.correct_authorization_simulation_audit(jsonb),
  app_private.reject_authorization_simulation_audit_mutation()
from public, anon, authenticated, service_role;

grant execute on function
  app_private.derive_authorization_simulation_status(uuid),
  app_private.append_authorization_simulation(jsonb),
  app_private.append_authorization_simulation_revision(jsonb),
  app_private.append_authorization_simulation_evaluation(jsonb),
  app_private.append_authorization_simulation_event(jsonb),
  app_private.append_authorization_simulation_attempt(jsonb),
  app_private.link_authorization_simulation_evidence(jsonb),
  app_private.correct_authorization_simulation_audit(jsonb)
to postgres;

grant select on table
  audit.authorization_simulations,
  audit.authorization_simulation_revisions,
  audit.authorization_simulation_evaluations,
  audit.authorization_simulation_events,
  audit.authorization_simulation_attempts,
  audit.authorization_simulation_links,
  audit.authorization_simulation_corrections
to postgres;

reset role;

revoke all on schema audit from public, anon, authenticated, service_role;

do $auth_db_013_postconditions$
declare
  v_count bigint;
begin
  select pg_catalog.count(*) into v_count
  from pg_catalog.pg_class c
  join pg_catalog.pg_namespace n on n.oid = c.relnamespace
  where n.nspname = 'audit'
    and c.relname in (
      'authorization_simulations', 'authorization_simulation_revisions', 'authorization_simulation_evaluations',
      'authorization_simulation_events', 'authorization_simulation_attempts', 'authorization_simulation_links',
      'authorization_simulation_corrections'
    ) and c.relkind in ('r', 'p');
  if v_count <> 7 then raise exception 'AUTH_DB_013_TABLE_INVENTORY_INVALID:%', v_count; end if;

  select pg_catalog.count(*) into v_count
  from pg_catalog.pg_proc p join pg_catalog.pg_namespace n on n.oid = p.pronamespace
  where n.nspname = 'app_private' and p.proname in (
    'canonicalize_authorization_simulation', 'fingerprint_authorization_simulation',
    'derive_authorization_simulation_status', 'append_authorization_simulation',
    'append_authorization_simulation_revision', 'append_authorization_simulation_evaluation',
    'append_authorization_simulation_event', 'append_authorization_simulation_attempt',
    'link_authorization_simulation_evidence', 'correct_authorization_simulation_audit',
    'reject_authorization_simulation_audit_mutation'
  );
  if v_count <> 11 then raise exception 'AUTH_DB_013_FUNCTION_INVENTORY_INVALID:%', v_count; end if;

  select pg_catalog.count(*) into v_count
  from pg_catalog.pg_proc p join pg_catalog.pg_namespace n on n.oid = p.pronamespace
  where n.nspname = 'app_private'
    and p.proname in (
      'append_authorization_simulation', 'append_authorization_simulation_revision',
      'append_authorization_simulation_evaluation', 'append_authorization_simulation_event',
      'append_authorization_simulation_attempt', 'link_authorization_simulation_evidence',
      'correct_authorization_simulation_audit'
    ) and p.prosecdef;
  if v_count <> 7 then raise exception 'AUTH_DB_013_SECURITY_DEFINER_INVENTORY_INVALID:%', v_count; end if;

  if exists (
    select 1 from pg_catalog.pg_class c join pg_catalog.pg_namespace n on n.oid = c.relnamespace
    where n.nspname = 'audit' and c.relname like 'authorization_simulation%'
      and c.relkind in ('r','p')
      and (not c.relrowsecurity or c.relforcerowsecurity or pg_catalog.pg_get_userbyid(c.relowner) <> 'vento_authorization_owner')
  ) then raise exception 'AUTH_DB_013_TABLE_SECURITY_POSTURE_INVALID'; end if;

  if exists (
    select 1 from pg_catalog.pg_class c join pg_catalog.pg_namespace n on n.oid = c.relnamespace
    where n.nspname = 'audit' and c.relname like 'authorization_simulation%'
      and c.relkind in ('r','p') and (
        pg_catalog.has_table_privilege('anon', c.oid, 'SELECT') or pg_catalog.has_table_privilege('authenticated', c.oid, 'SELECT')
        or pg_catalog.has_table_privilege('service_role', c.oid, 'SELECT')
        or pg_catalog.has_table_privilege('anon', c.oid, 'INSERT') or pg_catalog.has_table_privilege('authenticated', c.oid, 'INSERT')
        or pg_catalog.has_table_privilege('service_role', c.oid, 'INSERT')
        or pg_catalog.has_table_privilege('anon', c.oid, 'UPDATE') or pg_catalog.has_table_privilege('authenticated', c.oid, 'UPDATE')
        or pg_catalog.has_table_privilege('service_role', c.oid, 'UPDATE')
        or pg_catalog.has_table_privilege('anon', c.oid, 'DELETE') or pg_catalog.has_table_privilege('authenticated', c.oid, 'DELETE')
        or pg_catalog.has_table_privilege('service_role', c.oid, 'DELETE')
        or pg_catalog.has_table_privilege('anon', c.oid, 'TRUNCATE') or pg_catalog.has_table_privilege('authenticated', c.oid, 'TRUNCATE')
        or pg_catalog.has_table_privilege('service_role', c.oid, 'TRUNCATE')
      )
  ) then raise exception 'AUTH_DB_013_CLIENT_TABLE_PRIVILEGE_LEAK'; end if;

  if exists (
    select 1 from pg_catalog.pg_proc p join pg_catalog.pg_namespace n on n.oid = p.pronamespace
    where n.nspname = 'app_private' and p.proname like '%authorization_simulation%'
      and (pg_catalog.has_function_privilege('anon', p.oid, 'EXECUTE')
        or pg_catalog.has_function_privilege('authenticated', p.oid, 'EXECUTE')
        or pg_catalog.has_function_privilege('service_role', p.oid, 'EXECUTE'))
  ) then raise exception 'AUTH_DB_013_CLIENT_FUNCTION_PRIVILEGE_LEAK'; end if;

  if exists (
    select 1 from pg_catalog.pg_proc p join pg_catalog.pg_namespace n on n.oid = p.pronamespace
    where n.nspname = 'app_private'
      and p.proname in (
        'append_authorization_simulation', 'append_authorization_simulation_revision',
        'append_authorization_simulation_evaluation', 'append_authorization_simulation_event',
        'append_authorization_simulation_attempt', 'link_authorization_simulation_evidence',
        'correct_authorization_simulation_audit'
      ) and (not p.prosecdef or coalesce(pg_catalog.array_to_string(p.proconfig, ','), '') <> 'search_path=pg_catalog, audit, app_private, extensions')
  ) then raise exception 'AUTH_DB_013_PRIVILEGED_FUNCTION_POSTURE_INVALID'; end if;

  select pg_catalog.count(*) into v_count
  from pg_catalog.pg_trigger t
  join pg_catalog.pg_class c on c.oid = t.tgrelid
  join pg_catalog.pg_namespace n on n.oid = c.relnamespace
  where n.nspname = 'audit'
    and c.relname like 'authorization_simulation%'
    and not t.tgisinternal
    and t.tgname in ('trg_auth_db_013_append_only_row', 'trg_auth_db_013_append_only_truncate');
  if v_count <> 14 then raise exception 'AUTH_DB_013_APPEND_ONLY_TRIGGER_INVENTORY_INVALID:%', v_count; end if;

  if exists (
    select 1 from pg_catalog.pg_constraint con
    join pg_catalog.pg_class c on c.oid = con.conrelid
    join pg_catalog.pg_namespace n on n.oid = c.relnamespace
    where n.nspname = 'audit' and c.relname like 'authorization_simulation%'
      and con.contype = 'f' and con.confdeltype = 'c'
  ) then raise exception 'AUTH_DB_013_DELETE_CASCADE_FORBIDDEN'; end if;

  if exists (
    select 1 from pg_catalog.pg_trigger t
    where t.tgrelid = pg_catalog.to_regclass('public.context_simulation_sessions')
      and not t.tgisinternal and t.tgname like 'trg_auth_db_013%'
  ) then raise exception 'AUTH_DB_013_LEGACY_WRITER_ADOPTION_FORBIDDEN'; end if;

  if exists (
    select 1
    from (values ('anon'), ('authenticated'), ('service_role')) r(role_name)
    where pg_catalog.has_table_privilege(r.role_name, 'public.context_simulation_sessions', 'SELECT')
       or pg_catalog.has_table_privilege(r.role_name, 'public.context_simulation_sessions', 'INSERT')
       or pg_catalog.has_table_privilege(r.role_name, 'public.context_simulation_sessions', 'UPDATE')
       or pg_catalog.has_table_privilege(r.role_name, 'public.context_simulation_sessions', 'DELETE')
       or pg_catalog.has_table_privilege(r.role_name, 'public.context_simulation_sessions', 'TRUNCATE')
  ) then raise exception 'AUTH_DB_013_LEGACY_TABLE_GRANT_NOT_CONTAINED'; end if;

  if (select pg_catalog.count(*)
      from pg_catalog.pg_proc p
      join pg_catalog.pg_namespace n on n.oid = p.pronamespace
      where n.nspname = 'public'
        and p.proname in (
          'can_manage_context_simulation_v1', 'get_active_context_simulation_v1',
          'get_effective_context_v1', 'has_effective_permission_v1',
          'start_context_simulation_v1', 'stop_context_simulation_v1'
        )) <> 6 then
    raise exception 'AUTH_DB_013_LEGACY_FUNCTION_INVENTORY_INVALID';
  end if;

  if exists (
    select 1
    from pg_catalog.pg_proc p
    join pg_catalog.pg_namespace n on n.oid = p.pronamespace
    where n.nspname = 'public'
      and p.proname in ('can_manage_context_simulation_v1','get_active_context_simulation_v1','start_context_simulation_v1','stop_context_simulation_v1')
      and p.prosecdef
  ) then raise exception 'AUTH_DB_013_LEGACY_PRIVILEGED_AUTHORITY_NOT_NEUTRALIZED'; end if;

  if (select pg_catalog.count(*)
      from pg_catalog.pg_proc p
      join pg_catalog.pg_namespace n on n.oid = p.pronamespace
      where n.nspname = 'public'
        and p.proname in ('get_effective_context_v1','has_effective_permission_v1')
        and p.prosecdef
        and p.proconfig is not null
        and coalesce(pg_catalog.array_to_string(p.proconfig, ','), '') not like '%public%'
        and coalesce(pg_catalog.array_to_string(p.proconfig, ','), '') not like '%auth%') <> 2 then
    raise exception 'AUTH_DB_013_LEGACY_EFFECTIVE_WRAPPER_POSTURE_INVALID';
  end if;
end
$auth_db_013_postconditions$;

commit;
