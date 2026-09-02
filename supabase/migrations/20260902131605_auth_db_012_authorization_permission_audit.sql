-- AUTH-DB-012::GLOBAL
-- Canonical append-only authorization permission-change audit foundation.
-- source_contract_sha256 = ed13f66b299c7e6479201345309ce3e362d15c268249ee905d0c0655e61c0ff7
-- This file is migration CONTENT only. The repository migration filename must be created by Supabase CLI.
-- AUTH-DB-020 remains responsible for adopting/rewiring concrete permission writers.
-- No hosted Supabase target is mutated directly by this migration authoring flow.

begin;

do $auth_db_012_preconditions$
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
    raise exception 'AUTH_DB_012_AUTHORIZATION_OWNER_MISSING_OR_UNSAFE';
  end if;

  if pg_catalog.to_regnamespace('audit') is null
     or pg_catalog.to_regnamespace('app_private') is null
     or pg_catalog.to_regnamespace('extensions') is null then
    raise exception 'AUTH_DB_012_REQUIRED_SCHEMA_MISSING';
  end if;

  if pg_catalog.to_regclass('audit.authorization_decisions') is null then
    raise exception 'AUTH_DB_012_AUTHORIZATION_DECISION_STORE_MISSING';
  end if;

  if pg_catalog.to_regprocedure('app_private.canonicalize_authorization_payload(jsonb)') is null
     or pg_catalog.to_regprocedure('extensions.digest(text,text)') is null
     or pg_catalog.to_regprocedure('extensions.gen_random_uuid()') is null then
    raise exception 'AUTH_DB_012_CANONICAL_FINGERPRINT_GRAPH_MISSING';
  end if;

  if not exists (
    select 1
    from pg_catalog.pg_class c
    where c.oid = 'audit.authorization_decisions'::regclass
      and pg_catalog.pg_get_userbyid(c.relowner) = 'vento_authorization_owner'
  ) then
    raise exception 'AUTH_DB_012_AUTHORIZATION_DECISION_OWNER_DRIFT';
  end if;
end
$auth_db_012_preconditions$;

grant usage, create on schema audit, app_private to vento_authorization_owner;
grant usage on schema extensions to vento_authorization_owner;
grant execute on function extensions.digest(text, text), extensions.gen_random_uuid() to vento_authorization_owner;

set local role vento_authorization_owner;

alter default privileges in schema audit revoke all on tables from public;
alter default privileges in schema audit revoke execute on functions from public;
alter default privileges in schema app_private revoke execute on functions from public;

create table if not exists audit.authorization_permission_change_sets (
  change_set_id text primary key,
  audit_schema_version text not null,
  occurred_at timestamptz not null,
  recorded_at timestamptz not null default pg_catalog.statement_timestamp(),
  principal_id text,
  effective_actor_id text,
  technical_principal_id text not null,
  session_id text,
  device_id text,
  app_code text not null,
  request_source text not null,
  command_id text not null,
  authorization_decision_id text,
  correlation_id text not null,
  causation_id text,
  reason_code text not null,
  justification_reference text,
  source_reference text not null,
  approval_reference text,
  source_dataset_versions jsonb not null default '{}'::jsonb,
  source_dataset_hashes jsonb not null default '{}'::jsonb,
  change_count integer not null,
  result_code text not null,
  sensitivity_class text not null,
  retention_class text not null,
  change_set_fingerprint text not null,
  source_contract_sha256 text not null,
  constraint uq_authorization_permission_change_sets_command unique (command_id),
  constraint fk_authorization_permission_change_sets_decision
    foreign key (authorization_decision_id)
    references audit.authorization_decisions(decision_id),
  constraint ck_authorization_permission_change_sets_id
    check (change_set_id ~ '^[0-9a-f]{8}-[0-9a-f]{4}-[1-5][0-9a-f]{3}-[89ab][0-9a-f]{3}-[0-9a-f]{12}$'),
  constraint ck_authorization_permission_change_sets_schema
    check (audit_schema_version = '1.0.0'),
  constraint ck_authorization_permission_change_sets_time
    check (recorded_at >= occurred_at),
  constraint ck_authorization_permission_change_sets_request_source
    check (request_source in ('SERVER_ACTION', 'RPC', 'JOB', 'MIGRATION', 'ADMIN_TOOL', 'RECOVERY')),
  constraint ck_authorization_permission_change_sets_reason
    check (reason_code ~ '^[A-Z][A-Z0-9_]{2,127}$'),
  constraint ck_authorization_permission_change_sets_count
    check (change_count > 0),
  constraint ck_authorization_permission_change_sets_result
    check (result_code = 'APPLIED'),
  constraint ck_authorization_permission_change_sets_sensitivity
    check (sensitivity_class in ('FUNCTIONAL', 'FUNCTIONAL_SENSITIVE', 'ADMINISTRATIVE', 'PRIVILEGED')),
  constraint ck_authorization_permission_change_sets_retention
    check (retention_class in ('RET_ACTIVE_CASE', 'RET_BUSINESS_CYCLE', 'RET_RELATIONSHIP', 'RET_OBLIGATION', 'RET_ARCHIVAL', 'RET_HOLD', 'RET_PERMANENT_EXCEPTION', 'RET_UNRESOLVED')),
  constraint ck_authorization_permission_change_sets_dataset_versions
    check (pg_catalog.jsonb_typeof(source_dataset_versions) = 'object'),
  constraint ck_authorization_permission_change_sets_dataset_hashes
    check (pg_catalog.jsonb_typeof(source_dataset_hashes) = 'object'),
  constraint ck_authorization_permission_change_sets_fingerprint
    check (change_set_fingerprint ~ '^sha256:[0-9a-f]{64}$'),
  constraint ck_authorization_permission_change_sets_source_contract
    check (source_contract_sha256 = 'ed13f66b299c7e6479201345309ce3e362d15c268249ee905d0c0655e61c0ff7')
);

create table if not exists audit.authorization_permission_changes (
  permission_change_id text primary key,
  change_set_id text not null,
  change_ordinal integer not null,
  source_kind text not null,
  authorization_record_reference text not null,
  subject_kind text not null,
  subject_reference text not null,
  permission_key text not null,
  lane text not null,
  effect text not null,
  change_kind text not null,
  changed_fields text[] not null,
  before_state jsonb,
  after_state jsonb,
  before_fingerprint text,
  after_fingerprint text,
  source_dataset_id text,
  source_dataset_version text,
  source_dataset_hash text,
  item_reason_code text not null,
  occurred_at timestamptz not null,
  recorded_at timestamptz not null default pg_catalog.statement_timestamp(),
  item_fingerprint text not null,
  constraint fk_authorization_permission_changes_set
    foreign key (change_set_id)
    references audit.authorization_permission_change_sets(change_set_id),
  constraint uq_authorization_permission_changes_ordinal
    unique (change_set_id, change_ordinal),
  constraint ck_authorization_permission_changes_id
    check (permission_change_id ~ '^[0-9a-f]{8}-[0-9a-f]{4}-[1-5][0-9a-f]{3}-[89ab][0-9a-f]{3}-[0-9a-f]{12}$'),
  constraint ck_authorization_permission_changes_ordinal
    check (change_ordinal > 0),
  constraint ck_authorization_permission_changes_source_kind
    check (source_kind in ('PERMISSION_CATALOG_RELEASE', 'BASE_ROLE_GRANT', 'OPERATIONAL_ROLE_GRANT', 'INDIVIDUAL_OVERRIDE', 'EXPLICIT_DENIAL')),
  constraint ck_authorization_permission_changes_subject_kind
    check (subject_kind in ('BASE_ROLE', 'OPERATIONAL_ROLE', 'EMPLOYEE', 'CATALOG')),
  constraint ck_authorization_permission_changes_permission_key
    check (permission_key ~ '^[a-z0-9][a-z0-9_.:-]*$' and permission_key !~ '[*%]'),
  constraint ck_authorization_permission_changes_lane
    check (lane in ('BASE', 'OPERATIONAL', 'ALL_COMPATIBLE', 'NOT_APPLICABLE')),
  constraint ck_authorization_permission_changes_effect
    check (effect in ('ALLOW', 'DENY', 'NOT_APPLICABLE')),
  constraint ck_authorization_permission_changes_change_kind
    check (change_kind in ('CREATE', 'ACTIVATE', 'CHANGE_SCOPE', 'CHANGE_VALIDITY', 'SUSPEND', 'REVOKE', 'EXPIRE', 'REJECT', 'SUPERSEDE', 'MIGRATE', 'CORRECT_METADATA', 'CATALOG_RELEASE_ACTIVATED')),
  constraint ck_authorization_permission_changes_changed_fields
    check (pg_catalog.array_position(changed_fields, null) is null and pg_catalog.cardinality(changed_fields) > 0),
  constraint ck_authorization_permission_changes_state_shapes
    check (
      (before_state is null or pg_catalog.jsonb_typeof(before_state) = 'object')
      and (after_state is null or pg_catalog.jsonb_typeof(after_state) = 'object')
    ),
  constraint ck_authorization_permission_changes_state_fingerprints
    check (
      (before_state is null and before_fingerprint is null or before_state is not null and before_fingerprint ~ '^sha256:[0-9a-f]{64}$')
      and (after_state is null and after_fingerprint is null or after_state is not null and after_fingerprint ~ '^sha256:[0-9a-f]{64}$')
    ),
  constraint ck_authorization_permission_changes_dataset_identity
    check (
      (source_dataset_id is null and source_dataset_version is null and source_dataset_hash is null)
      or (
        source_dataset_id is not null
        and source_dataset_version is not null
        and source_dataset_hash ~ '^sha256:[0-9a-f]{64}$'
      )
    ),
  constraint ck_authorization_permission_changes_reason
    check (item_reason_code ~ '^[A-Z][A-Z0-9_]{2,127}$'),
  constraint ck_authorization_permission_changes_time
    check (recorded_at >= occurred_at),
  constraint ck_authorization_permission_changes_item_fingerprint
    check (item_fingerprint ~ '^sha256:[0-9a-f]{64}$')
);

create table if not exists audit.authorization_permission_change_attempts (
  change_attempt_id text primary key,
  occurred_at timestamptz not null,
  recorded_at timestamptz not null default pg_catalog.statement_timestamp(),
  principal_id text,
  effective_actor_id text,
  technical_principal_id text not null,
  device_id text,
  app_code text not null,
  request_source text not null,
  command_id text not null,
  authorization_decision_id text,
  correlation_id text not null,
  permission_key text not null,
  source_kind text not null,
  subject_kind text not null,
  subject_reference text not null,
  requested_change_kind text not null,
  attempt_result text not null,
  reason_code text not null,
  error_class text,
  result_reference text,
  request_fingerprint text not null,
  sensitivity_class text not null,
  retention_class text not null,
  attempt_fingerprint text not null,
  source_contract_sha256 text not null,
  constraint fk_authorization_permission_change_attempts_decision
    foreign key (authorization_decision_id)
    references audit.authorization_decisions(decision_id),
  constraint ck_authorization_permission_change_attempts_id
    check (change_attempt_id ~ '^[0-9a-f]{8}-[0-9a-f]{4}-[1-5][0-9a-f]{3}-[89ab][0-9a-f]{3}-[0-9a-f]{12}$'),
  constraint ck_authorization_permission_change_attempts_time
    check (recorded_at >= occurred_at),
  constraint ck_authorization_permission_change_attempts_request_source
    check (request_source in ('SERVER_ACTION', 'RPC', 'JOB', 'MIGRATION', 'ADMIN_TOOL', 'RECOVERY')),
  constraint ck_authorization_permission_change_attempts_permission_key
    check (permission_key ~ '^[a-z0-9][a-z0-9_.:-]*$' and permission_key !~ '[*%]'),
  constraint ck_authorization_permission_change_attempts_source_kind
    check (source_kind in ('PERMISSION_CATALOG_RELEASE', 'BASE_ROLE_GRANT', 'OPERATIONAL_ROLE_GRANT', 'INDIVIDUAL_OVERRIDE', 'EXPLICIT_DENIAL')),
  constraint ck_authorization_permission_change_attempts_subject_kind
    check (subject_kind in ('BASE_ROLE', 'OPERATIONAL_ROLE', 'EMPLOYEE', 'CATALOG')),
  constraint ck_authorization_permission_change_attempts_requested_change_kind
    check (requested_change_kind in ('CREATE', 'ACTIVATE', 'CHANGE_SCOPE', 'CHANGE_VALIDITY', 'SUSPEND', 'REVOKE', 'EXPIRE', 'REJECT', 'SUPERSEDE', 'MIGRATE', 'CORRECT_METADATA', 'CATALOG_RELEASE_ACTIVATED')),
  constraint ck_authorization_permission_change_attempts_result
    check (attempt_result in ('DENIED', 'INVALID', 'CONFLICT', 'TECHNICAL_FAILURE', 'NO_CHANGE', 'ROLLED_BACK')),
  constraint ck_authorization_permission_change_attempts_reason
    check (reason_code ~ '^[A-Z][A-Z0-9_]{2,127}$'),
  constraint ck_authorization_permission_change_attempts_request_fingerprint
    check (request_fingerprint ~ '^sha256:[0-9a-f]{64}$'),
  constraint ck_authorization_permission_change_attempts_sensitivity
    check (sensitivity_class in ('FUNCTIONAL', 'FUNCTIONAL_SENSITIVE', 'ADMINISTRATIVE', 'PRIVILEGED')),
  constraint ck_authorization_permission_change_attempts_retention
    check (retention_class in ('RET_ACTIVE_CASE', 'RET_BUSINESS_CYCLE', 'RET_RELATIONSHIP', 'RET_OBLIGATION', 'RET_ARCHIVAL', 'RET_HOLD', 'RET_PERMANENT_EXCEPTION', 'RET_UNRESOLVED')),
  constraint ck_authorization_permission_change_attempts_fingerprint
    check (attempt_fingerprint ~ '^sha256:[0-9a-f]{64}$'),
  constraint ck_authorization_permission_change_attempts_source_contract
    check (source_contract_sha256 = 'ed13f66b299c7e6479201345309ce3e362d15c268249ee905d0c0655e61c0ff7')
);

create table if not exists audit.authorization_permission_change_links (
  permission_change_link_id text primary key,
  change_set_id text not null,
  permission_change_id text,
  link_kind text not null,
  reference_type text not null,
  reference_id text not null,
  correlation_id text,
  causation_id text,
  occurred_at timestamptz not null,
  recorded_at timestamptz not null default pg_catalog.statement_timestamp(),
  link_fingerprint text not null,
  constraint fk_authorization_permission_change_links_set
    foreign key (change_set_id)
    references audit.authorization_permission_change_sets(change_set_id),
  constraint fk_authorization_permission_change_links_item
    foreign key (permission_change_id)
    references audit.authorization_permission_changes(permission_change_id),
  constraint uq_authorization_permission_change_links_reference
    unique nulls not distinct (change_set_id, permission_change_id, link_kind, reference_type, reference_id),
  constraint ck_authorization_permission_change_links_id
    check (permission_change_link_id ~ '^[0-9a-f]{8}-[0-9a-f]{4}-[1-5][0-9a-f]{3}-[89ab][0-9a-f]{3}-[0-9a-f]{12}$'),
  constraint ck_authorization_permission_change_links_kind
    check (link_kind in ('AUTHORIZATION_DECISION', 'APPROVAL', 'SOURCE_EVIDENCE', 'INCIDENT', 'CORRECTION', 'MIGRATION', 'AUDIT_ENTRY')),
  constraint ck_authorization_permission_change_links_reference
    check (pg_catalog.length(pg_catalog.btrim(reference_type)) > 0 and pg_catalog.length(pg_catalog.btrim(reference_id)) > 0),
  constraint ck_authorization_permission_change_links_time
    check (recorded_at >= occurred_at),
  constraint ck_authorization_permission_change_links_fingerprint
    check (link_fingerprint ~ '^sha256:[0-9a-f]{64}$')
);

create index if not exists ix_auth_permission_change_sets_occurred
  on audit.authorization_permission_change_sets (occurred_at desc, change_set_id desc);
create index if not exists ix_auth_permission_change_sets_decision_time
  on audit.authorization_permission_change_sets (authorization_decision_id, occurred_at desc, change_set_id desc);
create index if not exists ix_auth_permission_change_sets_correlation_time
  on audit.authorization_permission_change_sets (correlation_id, occurred_at desc, change_set_id desc);
create index if not exists ix_auth_permission_change_sets_actor_time
  on audit.authorization_permission_change_sets (effective_actor_id, occurred_at desc, change_set_id desc);
create index if not exists ix_auth_permission_change_sets_principal_time
  on audit.authorization_permission_change_sets (principal_id, occurred_at desc, change_set_id desc);
create index if not exists ix_auth_permission_changes_permission_time
  on audit.authorization_permission_changes (permission_key, occurred_at desc, change_set_id desc, change_ordinal);
create index if not exists ix_auth_permission_changes_subject_time
  on audit.authorization_permission_changes (subject_kind, subject_reference, occurred_at desc, change_set_id desc, change_ordinal);
create index if not exists ix_auth_permission_changes_source_time
  on audit.authorization_permission_changes (source_kind, occurred_at desc, change_set_id desc, change_ordinal);
create index if not exists ix_auth_permission_changes_kind_time
  on audit.authorization_permission_changes (change_kind, occurred_at desc, change_set_id desc, change_ordinal);
create index if not exists ix_auth_permission_changes_lane_effect_time
  on audit.authorization_permission_changes (lane, effect, occurred_at desc, change_set_id desc, change_ordinal);
create index if not exists ix_auth_permission_change_attempts_result_time
  on audit.authorization_permission_change_attempts (attempt_result, occurred_at desc, change_attempt_id desc);
create index if not exists ix_auth_permission_change_attempts_correlation_time
  on audit.authorization_permission_change_attempts (correlation_id, occurred_at desc, change_attempt_id desc);
create index if not exists ix_auth_permission_change_attempts_actor_time
  on audit.authorization_permission_change_attempts (effective_actor_id, occurred_at desc, change_attempt_id desc);
create index if not exists ix_auth_permission_change_attempts_permission_time
  on audit.authorization_permission_change_attempts (permission_key, occurred_at desc, change_attempt_id desc);
create index if not exists ix_auth_permission_change_links_set_time
  on audit.authorization_permission_change_links (change_set_id, occurred_at, permission_change_link_id);
create index if not exists ix_auth_permission_change_links_reference
  on audit.authorization_permission_change_links (link_kind, reference_type, reference_id, occurred_at desc);

create or replace function app_private.canonicalize_authorization_permission_change(
  p_payload jsonb
)
returns text
language sql
immutable
strict
set search_path = pg_catalog, app_private
as $auth_db_012_canonicalize$
  select app_private.canonicalize_authorization_payload(p_payload);
$auth_db_012_canonicalize$;

create or replace function app_private.fingerprint_authorization_permission_change(
  p_payload jsonb
)
returns text
language sql
immutable
strict
set search_path = pg_catalog, app_private, extensions
as $auth_db_012_fingerprint$
  select 'sha256:' || pg_catalog.encode(
    extensions.digest(app_private.canonicalize_authorization_permission_change(p_payload), 'sha256'),
    'hex'
  );
$auth_db_012_fingerprint$;

create or replace function audit.reject_authorization_permission_audit_mutation()
returns trigger
language plpgsql
volatile
set search_path = pg_catalog, audit
as $auth_db_012_reject_mutation$
begin
  raise exception using errcode = '55000', message = 'AUTH_DB_012_APPEND_ONLY_MUTATION_FORBIDDEN';
end
$auth_db_012_reject_mutation$;

create or replace function audit.append_authorization_permission_change(
  change jsonb
)
returns jsonb
language plpgsql
volatile
security definer
strict
set search_path = pg_catalog, audit, app_private
as $auth_db_012_append_change$
declare
  v_change_set_id text;
  v_occurred_at timestamptz;
  v_recorded_at timestamptz := pg_catalog.statement_timestamp();
  v_principal_id text;
  v_effective_actor_id text;
  v_technical_principal_id text := session_user;
  v_session_id text;
  v_device_id text;
  v_app_code text;
  v_request_source text;
  v_command_id text;
  v_decision_id text;
  v_decision audit.authorization_decisions%rowtype;
  v_correlation_id text;
  v_causation_id text;
  v_reason_code text;
  v_justification_reference text;
  v_source_reference text;
  v_approval_reference text;
  v_dataset_versions jsonb;
  v_dataset_hashes jsonb;
  v_items jsonb;
  v_links jsonb;
  v_item jsonb;
  v_link jsonb;
  v_item_count integer;
  v_ordinal integer;
  v_expected_ordinal integer := 1;
  v_permission_change_id text;
  v_source_kind text;
  v_authorization_record_reference text;
  v_subject_kind text;
  v_subject_reference text;
  v_permission_key text;
  v_lane text;
  v_effect text;
  v_change_kind text;
  v_changed_fields text[];
  v_sorted_fields text[];
  v_before jsonb;
  v_after jsonb;
  v_before_fp text;
  v_after_fp text;
  v_source_dataset_id text;
  v_source_dataset_version text;
  v_source_dataset_hash text;
  v_item_reason_code text;
  v_item_fp text;
  v_item_fps jsonb := '[]'::jsonb;
  v_set_preimage jsonb;
  v_set_fp text;
  v_existing_fp text;
  v_existing_id text;
  v_existing_count integer;
  v_sensitivity text := 'FUNCTIONAL_SENSITIVE';
  v_retention text := 'RET_OBLIGATION';
  v_link_kind text;
  v_reference_type text;
  v_reference_id text;
  v_link_item_id text;
  v_link_fp text;
  v_existing_link_fp text;
  v_link_id text;
  v_required_link jsonb;
  v_all_links jsonb := '[]'::jsonb;
  v_banned_pattern text := '"(jwt|refresh_token|api_key|pin|password|credential_secret|private_key|raw_session_token|email|phone|document|address|photo|medical|disciplinary_text)"[[:space:]]*:';
begin
  if pg_catalog.jsonb_typeof(change) <> 'object' then
    raise exception using errcode = '22023', message = 'AUTH_DB_012_CHANGE_ENVELOPE_INVALID';
  end if;

  if exists (
    select 1
    from pg_catalog.jsonb_object_keys(change) k
    where k not in (
      'change_set_id', 'occurred_at', 'session_id', 'app_code', 'request_source', 'command_id',
      'authorization_decision_id', 'correlation_id', 'causation_id', 'reason_code',
      'justification_reference', 'source_reference', 'approval_reference',
      'source_dataset_versions', 'source_dataset_hashes', 'items', 'links'
    )
  ) then
    raise exception using errcode = '22023', message = 'AUTH_DB_012_CHANGE_FIELD_FORBIDDEN';
  end if;

  v_change_set_id := nullif(change ->> 'change_set_id', '');
  v_command_id := nullif(change ->> 'command_id', '');
  v_decision_id := nullif(change ->> 'authorization_decision_id', '');
  v_session_id := nullif(change ->> 'session_id', '');
  v_causation_id := nullif(change ->> 'causation_id', '');
  v_reason_code := nullif(change ->> 'reason_code', '');
  v_justification_reference := nullif(change ->> 'justification_reference', '');
  v_source_reference := nullif(change ->> 'source_reference', '');
  v_approval_reference := nullif(change ->> 'approval_reference', '');
  v_dataset_versions := coalesce(change -> 'source_dataset_versions', '{}'::jsonb);
  v_dataset_hashes := coalesce(change -> 'source_dataset_hashes', '{}'::jsonb);
  v_items := change -> 'items';
  v_links := coalesce(change -> 'links', '[]'::jsonb);

  if v_change_set_id is null
     or v_change_set_id !~ '^[0-9a-f]{8}-[0-9a-f]{4}-[1-5][0-9a-f]{3}-[89ab][0-9a-f]{3}-[0-9a-f]{12}$'
     or v_command_id is null
     or v_reason_code is null
     or v_reason_code !~ '^[A-Z][A-Z0-9_]{2,127}$'
     or v_source_reference is null
     or pg_catalog.jsonb_typeof(v_dataset_versions) <> 'object'
     or pg_catalog.jsonb_typeof(v_dataset_hashes) <> 'object'
     or pg_catalog.jsonb_typeof(v_items) <> 'array'
     or pg_catalog.jsonb_typeof(v_links) <> 'array' then
    raise exception using errcode = '22023', message = 'AUTH_DB_012_CHANGE_IDENTITY_INVALID';
  end if;

  if exists (
    select 1 from pg_catalog.jsonb_each_text(v_dataset_hashes) h
    where h.value !~ '^sha256:[0-9a-f]{64}$'
  ) then
    raise exception using errcode = '22023', message = 'AUTH_DB_012_CHANGE_DATASET_HASH_INVALID';
  end if;

  begin
    v_occurred_at := (change ->> 'occurred_at')::timestamptz;
  exception when others then
    raise exception using errcode = '22023', message = 'AUTH_DB_012_CHANGE_OCCURRED_AT_INVALID';
  end;
  if v_recorded_at < v_occurred_at then
    raise exception using errcode = '22023', message = 'AUTH_DB_012_CHANGE_RECORDED_AT_PRECEDES_OCCURRED_AT';
  end if;

  if v_session_id is not null and (pg_catalog.length(v_session_id) > 128 or v_session_id ~ '[[:space:]]') then
    raise exception using errcode = '22023', message = 'AUTH_DB_012_SESSION_REFERENCE_INVALID';
  end if;

  if v_decision_id is not null then
    select d.* into v_decision
    from audit.authorization_decisions d
    where d.decision_id = v_decision_id;
    if not found then
      raise exception using errcode = '23503', message = 'AUTH_DB_012_AUTHORIZATION_DECISION_MISSING';
    end if;
    if v_decision.outcome <> 'ALLOW' then
      raise exception using errcode = '42501', message = 'AUTH_DB_012_AUTHORIZATION_DECISION_NOT_ALLOW';
    end if;
    v_principal_id := v_decision.principal_id;
    v_effective_actor_id := v_decision.actor_id;
    v_device_id := v_decision.device_id;
    v_app_code := v_decision.app_code;
    v_request_source := v_decision.request_source;
    v_correlation_id := v_decision.correlation_id;

    if nullif(change ->> 'app_code', '') is not null and change ->> 'app_code' is distinct from v_app_code then
      raise exception using errcode = '22023', message = 'AUTH_DB_012_APP_CODE_DECISION_MISMATCH';
    end if;
    if nullif(change ->> 'correlation_id', '') is not null and change ->> 'correlation_id' is distinct from v_correlation_id then
      raise exception using errcode = '22023', message = 'AUTH_DB_012_CORRELATION_DECISION_MISMATCH';
    end if;
  else
    v_app_code := nullif(change ->> 'app_code', '');
    v_request_source := nullif(change ->> 'request_source', '');
    v_correlation_id := nullif(change ->> 'correlation_id', '');
    if v_app_code is null or v_correlation_id is null
       or v_request_source not in ('JOB', 'MIGRATION', 'RECOVERY') then
      raise exception using errcode = '42501', message = 'AUTH_DB_012_DECISION_REQUIRED_FOR_INTERACTIVE_CHANGE';
    end if;
    v_principal_id := null;
    v_effective_actor_id := null;
    v_device_id := null;
  end if;

  if v_request_source not in ('SERVER_ACTION', 'RPC', 'JOB', 'MIGRATION', 'ADMIN_TOOL', 'RECOVERY') then
    raise exception using errcode = '22023', message = 'AUTH_DB_012_REQUEST_SOURCE_INVALID';
  end if;

  v_item_count := pg_catalog.jsonb_array_length(v_items);
  if v_item_count < 1 then
    raise exception using errcode = '22023', message = 'AUTH_DB_012_EMPTY_CHANGE_SET_FORBIDDEN';
  end if;

  if (
    select pg_catalog.count(distinct x.item ->> 'permission_change_id')
    from pg_catalog.jsonb_array_elements(v_items) x(item)
  ) <> v_item_count then
    raise exception using errcode = '22023', message = 'AUTH_DB_012_DUPLICATE_PERMISSION_CHANGE_ID';
  end if;

  if (
    select pg_catalog.count(distinct (x.item ->> 'change_ordinal')::integer)
    from pg_catalog.jsonb_array_elements(v_items) x(item)
    where x.item ->> 'change_ordinal' ~ '^[0-9]+$'
  ) <> v_item_count then
    raise exception using errcode = '22023', message = 'AUTH_DB_012_CHANGE_ORDINAL_INVALID_OR_DUPLICATE';
  end if;

  for v_item in
    select x.item
    from pg_catalog.jsonb_array_elements(v_items) x(item)
    order by (x.item ->> 'change_ordinal')::integer
  loop
    if pg_catalog.jsonb_typeof(v_item) <> 'object' or exists (
      select 1
      from pg_catalog.jsonb_object_keys(v_item) k
      where k not in (
        'permission_change_id', 'change_ordinal', 'source_kind', 'authorization_record_reference',
        'subject_kind', 'subject_reference', 'permission_key', 'lane', 'effect', 'change_kind',
        'changed_fields', 'before_state', 'after_state', 'source_dataset_id',
        'source_dataset_version', 'source_dataset_hash', 'item_reason_code'
      )
    ) then
      raise exception using errcode = '22023', message = 'AUTH_DB_012_CHANGE_ITEM_FIELD_FORBIDDEN';
    end if;

    begin
      v_ordinal := (v_item ->> 'change_ordinal')::integer;
    exception when others then
      raise exception using errcode = '22023', message = 'AUTH_DB_012_CHANGE_ORDINAL_INVALID';
    end;
    if v_ordinal <> v_expected_ordinal then
      raise exception using errcode = '22023', message = 'AUTH_DB_012_CHANGE_ORDINAL_NOT_CONTIGUOUS';
    end if;
    v_expected_ordinal := v_expected_ordinal + 1;

    v_permission_change_id := nullif(v_item ->> 'permission_change_id', '');
    v_source_kind := nullif(v_item ->> 'source_kind', '');
    v_authorization_record_reference := nullif(v_item ->> 'authorization_record_reference', '');
    v_subject_kind := nullif(v_item ->> 'subject_kind', '');
    v_subject_reference := nullif(v_item ->> 'subject_reference', '');
    v_permission_key := nullif(v_item ->> 'permission_key', '');
    v_lane := nullif(v_item ->> 'lane', '');
    v_effect := nullif(v_item ->> 'effect', '');
    v_change_kind := nullif(v_item ->> 'change_kind', '');
    v_before := v_item -> 'before_state';
    v_after := v_item -> 'after_state';
    if v_before = 'null'::jsonb then v_before := null; end if;
    if v_after = 'null'::jsonb then v_after := null; end if;
    v_source_dataset_id := nullif(v_item ->> 'source_dataset_id', '');
    v_source_dataset_version := nullif(v_item ->> 'source_dataset_version', '');
    v_source_dataset_hash := nullif(v_item ->> 'source_dataset_hash', '');
    v_item_reason_code := coalesce(nullif(v_item ->> 'item_reason_code', ''), v_reason_code);

    if v_permission_change_id is null
       or v_permission_change_id !~ '^[0-9a-f]{8}-[0-9a-f]{4}-[1-5][0-9a-f]{3}-[89ab][0-9a-f]{3}-[0-9a-f]{12}$'
       or v_authorization_record_reference is null
       or v_subject_reference is null
       or v_permission_key is null
       or v_permission_key !~ '^[a-z0-9][a-z0-9_.:-]*$'
       or v_permission_key ~ '[*%]'
       or v_item_reason_code !~ '^[A-Z][A-Z0-9_]{2,127}$' then
      raise exception using errcode = '22023', message = 'AUTH_DB_012_CHANGE_ITEM_IDENTITY_INVALID';
    end if;

    if v_source_kind not in ('PERMISSION_CATALOG_RELEASE', 'BASE_ROLE_GRANT', 'OPERATIONAL_ROLE_GRANT', 'INDIVIDUAL_OVERRIDE', 'EXPLICIT_DENIAL')
       or v_subject_kind not in ('BASE_ROLE', 'OPERATIONAL_ROLE', 'EMPLOYEE', 'CATALOG')
       or v_lane not in ('BASE', 'OPERATIONAL', 'ALL_COMPATIBLE', 'NOT_APPLICABLE')
       or v_effect not in ('ALLOW', 'DENY', 'NOT_APPLICABLE')
       or v_change_kind not in ('CREATE', 'ACTIVATE', 'CHANGE_SCOPE', 'CHANGE_VALIDITY', 'SUSPEND', 'REVOKE', 'EXPIRE', 'REJECT', 'SUPERSEDE', 'MIGRATE', 'CORRECT_METADATA', 'CATALOG_RELEASE_ACTIVATED') then
      raise exception using errcode = '22023', message = 'AUTH_DB_012_CHANGE_ITEM_VOCABULARY_INVALID';
    end if;

    if (v_source_kind = 'PERMISSION_CATALOG_RELEASE' and (v_subject_kind <> 'CATALOG' or v_lane <> 'NOT_APPLICABLE' or v_effect <> 'NOT_APPLICABLE'))
       or (v_source_kind = 'BASE_ROLE_GRANT' and (v_subject_kind <> 'BASE_ROLE' or v_lane <> 'BASE' or v_effect <> 'ALLOW'))
       or (v_source_kind = 'OPERATIONAL_ROLE_GRANT' and (v_subject_kind <> 'OPERATIONAL_ROLE' or v_lane <> 'OPERATIONAL' or v_effect <> 'ALLOW'))
       or (v_source_kind = 'INDIVIDUAL_OVERRIDE' and (v_subject_kind <> 'EMPLOYEE' or v_effect <> 'ALLOW' or v_lane not in ('BASE', 'OPERATIONAL')))
       or (v_source_kind = 'EXPLICIT_DENIAL' and (v_subject_kind <> 'EMPLOYEE' or v_effect <> 'DENY' or v_lane not in ('BASE', 'OPERATIONAL', 'ALL_COMPATIBLE'))) then
      raise exception using errcode = '22023', message = 'AUTH_DB_012_CHANGE_ITEM_SEMANTIC_IDENTITY_INVALID';
    end if;

    if v_lane = 'ALL_COMPATIBLE' and not (v_source_kind = 'EXPLICIT_DENIAL' and v_subject_kind = 'EMPLOYEE' and v_effect = 'DENY') then
      raise exception using errcode = '22023', message = 'AUTH_DB_012_ALL_COMPATIBLE_INVALID';
    end if;

    if pg_catalog.jsonb_typeof(v_item -> 'changed_fields') <> 'array' then
      raise exception using errcode = '22023', message = 'AUTH_DB_012_CHANGED_FIELDS_INVALID';
    end if;
    select coalesce(pg_catalog.array_agg(x.value order by x.value collate "C"), '{}'::text[])
    into v_sorted_fields
    from (
      select distinct value
      from pg_catalog.jsonb_array_elements_text(v_item -> 'changed_fields')
    ) x;
    select coalesce(pg_catalog.array_agg(value), '{}'::text[])
    into v_changed_fields
    from pg_catalog.jsonb_array_elements_text(v_item -> 'changed_fields');

    if pg_catalog.cardinality(v_changed_fields) < 1
       or v_changed_fields is distinct from v_sorted_fields
       or exists (
         select 1 from pg_catalog.unnest(v_changed_fields) f
         where f not in (
           'authorization_requirement', 'catalog_version', 'effective_from', 'effective_until',
           'lifecycle_status', 'max_scope', 'metadata', 'prerequisite', 'reason_code',
           'resource_constraint', 'scope', 'sensitivity_class', 'source_reference', 'status'
         )
       ) then
      raise exception using errcode = '22023', message = 'AUTH_DB_012_CHANGED_FIELDS_NOT_CANONICAL';
    end if;

    if (v_before is not null and pg_catalog.jsonb_typeof(v_before) <> 'object')
       or (v_after is not null and pg_catalog.jsonb_typeof(v_after) <> 'object') then
      raise exception using errcode = '22023', message = 'AUTH_DB_012_STATE_SHAPE_INVALID';
    end if;

    if v_change_kind = 'CREATE' then
      if v_before is not null or v_after is null then
        raise exception using errcode = '22023', message = 'AUTH_DB_012_CREATE_STATE_INVALID';
      end if;
    elsif v_before is null or v_after is null then
      raise exception using errcode = '22023', message = 'AUTH_DB_012_EXISTING_CHANGE_STATE_INVALID';
    end if;

    if v_before is not null and exists (
      select 1 from pg_catalog.jsonb_object_keys(v_before) k
      where k not in ('subject_reference', 'permission_key', 'lane', 'effect', 'scope', 'resource_constraint', 'effective_from', 'effective_until', 'lifecycle_status', 'reason_code', 'source_reference', 'status', 'metadata')
    ) then
      raise exception using errcode = '22023', message = 'AUTH_DB_012_BEFORE_STATE_FIELD_FORBIDDEN';
    end if;
    if v_after is not null and exists (
      select 1 from pg_catalog.jsonb_object_keys(v_after) k
      where k not in ('subject_reference', 'permission_key', 'lane', 'effect', 'scope', 'resource_constraint', 'effective_from', 'effective_until', 'lifecycle_status', 'reason_code', 'source_reference', 'status', 'metadata')
    ) then
      raise exception using errcode = '22023', message = 'AUTH_DB_012_AFTER_STATE_FIELD_FORBIDDEN';
    end if;

    if (v_before is not null and pg_catalog.lower(app_private.canonicalize_authorization_permission_change(v_before)) ~ v_banned_pattern)
       or (v_after is not null and pg_catalog.lower(app_private.canonicalize_authorization_permission_change(v_after)) ~ v_banned_pattern) then
      raise exception using errcode = '22023', message = 'AUTH_DB_012_SENSITIVE_OR_SECRET_STATE_FORBIDDEN';
    end if;

    if v_before is not null and (
      coalesce(v_before ->> 'subject_reference', v_subject_reference) is distinct from v_subject_reference
      or coalesce(v_before ->> 'permission_key', v_permission_key) is distinct from v_permission_key
      or coalesce(v_before ->> 'lane', v_lane) is distinct from v_lane
      or coalesce(v_before ->> 'effect', v_effect) is distinct from v_effect
    ) then
      raise exception using errcode = '22023', message = 'AUTH_DB_012_BEFORE_STATE_IDENTITY_FLIP_FORBIDDEN';
    end if;
    if v_after is not null and (
      coalesce(v_after ->> 'subject_reference', v_subject_reference) is distinct from v_subject_reference
      or coalesce(v_after ->> 'permission_key', v_permission_key) is distinct from v_permission_key
      or coalesce(v_after ->> 'lane', v_lane) is distinct from v_lane
      or coalesce(v_after ->> 'effect', v_effect) is distinct from v_effect
    ) then
      raise exception using errcode = '22023', message = 'AUTH_DB_012_AFTER_STATE_IDENTITY_FLIP_FORBIDDEN';
    end if;

    if (v_source_dataset_id is null) <> (v_source_dataset_version is null)
       or (v_source_dataset_id is null) <> (v_source_dataset_hash is null)
       or (v_source_dataset_hash is not null and v_source_dataset_hash !~ '^sha256:[0-9a-f]{64}$') then
      raise exception using errcode = '22023', message = 'AUTH_DB_012_ITEM_DATASET_IDENTITY_INVALID';
    end if;
    if v_source_kind in ('PERMISSION_CATALOG_RELEASE', 'BASE_ROLE_GRANT', 'OPERATIONAL_ROLE_GRANT') and v_source_dataset_id is null then
      raise exception using errcode = '22023', message = 'AUTH_DB_012_ITEM_DATASET_IDENTITY_REQUIRED';
    end if;

    v_before_fp := case when v_before is null then null else app_private.fingerprint_authorization_permission_change(v_before) end;
    v_after_fp := case when v_after is null then null else app_private.fingerprint_authorization_permission_change(v_after) end;

    if v_change_kind <> 'CORRECT_METADATA' and v_before_fp is not null and v_before_fp = v_after_fp then
      raise exception using errcode = '22023', message = 'AUTH_DB_012_NO_CHANGE_ITEM_FORBIDDEN';
    end if;

    v_item_fp := app_private.fingerprint_authorization_permission_change(
      pg_catalog.jsonb_build_object(
        'permission_change_id', v_permission_change_id,
        'change_set_id', v_change_set_id,
        'change_ordinal', v_ordinal,
        'source_kind', v_source_kind,
        'authorization_record_reference', v_authorization_record_reference,
        'subject_kind', v_subject_kind,
        'subject_reference', v_subject_reference,
        'permission_key', v_permission_key,
        'lane', v_lane,
        'effect', v_effect,
        'change_kind', v_change_kind,
        'changed_fields', pg_catalog.to_jsonb(v_changed_fields),
        'before_state', v_before,
        'after_state', v_after,
        'before_fingerprint', v_before_fp,
        'after_fingerprint', v_after_fp,
        'source_dataset_id', v_source_dataset_id,
        'source_dataset_version', v_source_dataset_version,
        'source_dataset_hash', v_source_dataset_hash,
        'item_reason_code', v_item_reason_code,
        'occurred_at', pg_catalog.to_char(v_occurred_at at time zone 'UTC', 'YYYY-MM-DD"T"HH24:MI:SS.MS"Z"')
      )
    );

    v_item_fps := v_item_fps || pg_catalog.jsonb_build_array(
      pg_catalog.jsonb_build_object(
        'permission_change_id', v_permission_change_id,
        'change_ordinal', v_ordinal,
        'item_fingerprint', v_item_fp
      )
    );
  end loop;

  v_set_preimage := pg_catalog.jsonb_build_object(
    'change_set_id', v_change_set_id,
    'audit_schema_version', '1.0.0',
    'occurred_at', pg_catalog.to_char(v_occurred_at at time zone 'UTC', 'YYYY-MM-DD"T"HH24:MI:SS.MS"Z"'),
    'principal_id', v_principal_id,
    'effective_actor_id', v_effective_actor_id,
    'technical_principal_id', v_technical_principal_id,
    'session_id', v_session_id,
    'device_id', v_device_id,
    'app_code', v_app_code,
    'request_source', v_request_source,
    'command_id', v_command_id,
    'authorization_decision_id', v_decision_id,
    'correlation_id', v_correlation_id,
    'causation_id', v_causation_id,
    'reason_code', v_reason_code,
    'justification_reference', v_justification_reference,
    'source_reference', v_source_reference,
    'approval_reference', v_approval_reference,
    'source_dataset_versions', v_dataset_versions,
    'source_dataset_hashes', v_dataset_hashes,
    'change_count', v_item_count,
    'result_code', 'APPLIED',
    'sensitivity_class', v_sensitivity,
    'retention_class', v_retention,
    'source_contract_sha256', 'ed13f66b299c7e6479201345309ce3e362d15c268249ee905d0c0655e61c0ff7',
    'items', v_item_fps,
    'requested_links', v_links
  );
  v_set_fp := app_private.fingerprint_authorization_permission_change(v_set_preimage);

  select s.change_set_id, s.change_set_fingerprint, s.change_count
  into v_existing_id, v_existing_fp, v_existing_count
  from audit.authorization_permission_change_sets s
  where s.change_set_id = v_change_set_id or s.command_id = v_command_id
  order by case when s.change_set_id = v_change_set_id then 0 else 1 end
  limit 1;

  if found then
    if v_existing_id is distinct from v_change_set_id
       or v_existing_fp is distinct from v_set_fp
       or v_existing_count <> v_item_count then
      raise exception using errcode = '23505', message = 'AUTH_DB_012_CHANGE_SET_INTEGRITY_CONFLICT';
    end if;
    if (
      select pg_catalog.count(*)
      from audit.authorization_permission_changes i
      where i.change_set_id = v_change_set_id
    ) <> v_item_count then
      raise exception using errcode = '55000', message = 'AUTH_DB_012_CHANGE_SET_CARDINALITY_MISMATCH';
    end if;
    return pg_catalog.jsonb_build_object(
      'change_set_id', v_existing_id,
      'change_count', v_existing_count,
      'change_set_fingerprint', v_existing_fp,
      'result_code', 'APPLIED',
      'idempotent', true
    );
  end if;

  insert into audit.authorization_permission_change_sets (
    change_set_id, audit_schema_version, occurred_at, recorded_at, principal_id,
    effective_actor_id, technical_principal_id, session_id, device_id, app_code,
    request_source, command_id, authorization_decision_id, correlation_id, causation_id,
    reason_code, justification_reference, source_reference, approval_reference,
    source_dataset_versions, source_dataset_hashes, change_count, result_code,
    sensitivity_class, retention_class, change_set_fingerprint, source_contract_sha256
  ) values (
    v_change_set_id, '1.0.0', v_occurred_at, v_recorded_at, v_principal_id,
    v_effective_actor_id, v_technical_principal_id, v_session_id, v_device_id, v_app_code,
    v_request_source, v_command_id, v_decision_id, v_correlation_id, v_causation_id,
    v_reason_code, v_justification_reference, v_source_reference, v_approval_reference,
    v_dataset_versions, v_dataset_hashes, v_item_count, 'APPLIED',
    v_sensitivity, v_retention, v_set_fp, 'ed13f66b299c7e6479201345309ce3e362d15c268249ee905d0c0655e61c0ff7'
  );

  v_expected_ordinal := 1;
  for v_item in
    select x.item
    from pg_catalog.jsonb_array_elements(v_items) x(item)
    order by (x.item ->> 'change_ordinal')::integer
  loop
    v_ordinal := (v_item ->> 'change_ordinal')::integer;
    v_permission_change_id := v_item ->> 'permission_change_id';
    v_source_kind := v_item ->> 'source_kind';
    v_authorization_record_reference := v_item ->> 'authorization_record_reference';
    v_subject_kind := v_item ->> 'subject_kind';
    v_subject_reference := v_item ->> 'subject_reference';
    v_permission_key := v_item ->> 'permission_key';
    v_lane := v_item ->> 'lane';
    v_effect := v_item ->> 'effect';
    v_change_kind := v_item ->> 'change_kind';
    v_before := v_item -> 'before_state'; if v_before = 'null'::jsonb then v_before := null; end if;
    v_after := v_item -> 'after_state'; if v_after = 'null'::jsonb then v_after := null; end if;
    v_source_dataset_id := nullif(v_item ->> 'source_dataset_id', '');
    v_source_dataset_version := nullif(v_item ->> 'source_dataset_version', '');
    v_source_dataset_hash := nullif(v_item ->> 'source_dataset_hash', '');
    v_item_reason_code := coalesce(nullif(v_item ->> 'item_reason_code', ''), v_reason_code);
    select coalesce(pg_catalog.array_agg(value), '{}'::text[])
    into v_changed_fields
    from pg_catalog.jsonb_array_elements_text(v_item -> 'changed_fields');
    v_before_fp := case when v_before is null then null else app_private.fingerprint_authorization_permission_change(v_before) end;
    v_after_fp := case when v_after is null then null else app_private.fingerprint_authorization_permission_change(v_after) end;
    v_item_fp := app_private.fingerprint_authorization_permission_change(
      pg_catalog.jsonb_build_object(
        'permission_change_id', v_permission_change_id, 'change_set_id', v_change_set_id,
        'change_ordinal', v_ordinal, 'source_kind', v_source_kind,
        'authorization_record_reference', v_authorization_record_reference,
        'subject_kind', v_subject_kind, 'subject_reference', v_subject_reference,
        'permission_key', v_permission_key, 'lane', v_lane, 'effect', v_effect,
        'change_kind', v_change_kind, 'changed_fields', pg_catalog.to_jsonb(v_changed_fields),
        'before_state', v_before, 'after_state', v_after,
        'before_fingerprint', v_before_fp, 'after_fingerprint', v_after_fp,
        'source_dataset_id', v_source_dataset_id, 'source_dataset_version', v_source_dataset_version,
        'source_dataset_hash', v_source_dataset_hash, 'item_reason_code', v_item_reason_code,
        'occurred_at', pg_catalog.to_char(v_occurred_at at time zone 'UTC', 'YYYY-MM-DD"T"HH24:MI:SS.MS"Z"')
      )
    );

    insert into audit.authorization_permission_changes (
      permission_change_id, change_set_id, change_ordinal, source_kind,
      authorization_record_reference, subject_kind, subject_reference, permission_key,
      lane, effect, change_kind, changed_fields, before_state, after_state,
      before_fingerprint, after_fingerprint, source_dataset_id, source_dataset_version,
      source_dataset_hash, item_reason_code, occurred_at, recorded_at, item_fingerprint
    ) values (
      v_permission_change_id, v_change_set_id, v_ordinal, v_source_kind,
      v_authorization_record_reference, v_subject_kind, v_subject_reference, v_permission_key,
      v_lane, v_effect, v_change_kind, v_changed_fields, v_before, v_after,
      v_before_fp, v_after_fp, v_source_dataset_id, v_source_dataset_version,
      v_source_dataset_hash, v_item_reason_code, v_occurred_at, v_recorded_at, v_item_fp
    );
  end loop;

  if v_decision_id is not null then
    v_required_link := pg_catalog.jsonb_build_object(
      'link_kind', 'AUTHORIZATION_DECISION',
      'reference_type', 'AuthorizationDecision',
      'reference_id', v_decision_id
    );
    v_all_links := v_all_links || pg_catalog.jsonb_build_array(v_required_link);
  end if;
  v_required_link := pg_catalog.jsonb_build_object(
    'link_kind', 'SOURCE_EVIDENCE',
    'reference_type', 'SOURCE_REFERENCE',
    'reference_id', v_source_reference
  );
  v_all_links := v_all_links || pg_catalog.jsonb_build_array(v_required_link);
  if v_approval_reference is not null then
    v_required_link := pg_catalog.jsonb_build_object(
      'link_kind', 'APPROVAL',
      'reference_type', 'APPROVAL_REFERENCE',
      'reference_id', v_approval_reference
    );
    v_all_links := v_all_links || pg_catalog.jsonb_build_array(v_required_link);
  end if;
  v_all_links := v_all_links || v_links;

  for v_link in select x.link from pg_catalog.jsonb_array_elements(v_all_links) x(link)
  loop
    if pg_catalog.jsonb_typeof(v_link) <> 'object' or exists (
      select 1 from pg_catalog.jsonb_object_keys(v_link) k
      where k not in ('permission_change_id', 'link_kind', 'reference_type', 'reference_id', 'correlation_id', 'causation_id')
    ) then
      raise exception using errcode = '22023', message = 'AUTH_DB_012_LINK_FIELD_FORBIDDEN';
    end if;
    v_link_item_id := nullif(v_link ->> 'permission_change_id', '');
    v_link_kind := nullif(v_link ->> 'link_kind', '');
    v_reference_type := nullif(v_link ->> 'reference_type', '');
    v_reference_id := nullif(v_link ->> 'reference_id', '');
    if v_link_kind not in ('AUTHORIZATION_DECISION', 'APPROVAL', 'SOURCE_EVIDENCE', 'INCIDENT', 'CORRECTION', 'MIGRATION', 'AUDIT_ENTRY')
       or v_reference_type is null or v_reference_id is null then
      raise exception using errcode = '22023', message = 'AUTH_DB_012_LINK_IDENTITY_INVALID';
    end if;
    if v_link_item_id is not null and not exists (
      select 1 from audit.authorization_permission_changes i
      where i.change_set_id = v_change_set_id and i.permission_change_id = v_link_item_id
    ) then
      raise exception using errcode = '23503', message = 'AUTH_DB_012_LINK_ITEM_MISSING';
    end if;

    v_link_fp := app_private.fingerprint_authorization_permission_change(
      pg_catalog.jsonb_build_object(
        'change_set_id', v_change_set_id,
        'permission_change_id', v_link_item_id,
        'link_kind', v_link_kind,
        'reference_type', v_reference_type,
        'reference_id', v_reference_id,
        'correlation_id', coalesce(nullif(v_link ->> 'correlation_id', ''), v_correlation_id),
        'causation_id', coalesce(nullif(v_link ->> 'causation_id', ''), v_causation_id),
        'occurred_at', pg_catalog.to_char(v_occurred_at at time zone 'UTC', 'YYYY-MM-DD"T"HH24:MI:SS.MS"Z"')
      )
    );

    select l.link_fingerprint into v_existing_link_fp
    from audit.authorization_permission_change_links l
    where l.change_set_id = v_change_set_id
      and l.permission_change_id is not distinct from v_link_item_id
      and l.link_kind = v_link_kind
      and l.reference_type = v_reference_type
      and l.reference_id = v_reference_id;
    if found then
      if v_existing_link_fp is distinct from v_link_fp then
        raise exception using errcode = '23505', message = 'AUTH_DB_012_LINK_INTEGRITY_CONFLICT';
      end if;
      continue;
    end if;

    v_link_id := extensions.gen_random_uuid()::text;
    insert into audit.authorization_permission_change_links (
      permission_change_link_id, change_set_id, permission_change_id, link_kind,
      reference_type, reference_id, correlation_id, causation_id, occurred_at,
      recorded_at, link_fingerprint
    ) values (
      v_link_id, v_change_set_id, v_link_item_id, v_link_kind,
      v_reference_type, v_reference_id,
      coalesce(nullif(v_link ->> 'correlation_id', ''), v_correlation_id),
      coalesce(nullif(v_link ->> 'causation_id', ''), v_causation_id),
      v_occurred_at, v_recorded_at, v_link_fp
    );
  end loop;

  if (select pg_catalog.count(*) from audit.authorization_permission_changes i where i.change_set_id = v_change_set_id) <> v_item_count then
    raise exception using errcode = '55000', message = 'AUTH_DB_012_CHANGE_SET_CARDINALITY_MISMATCH';
  end if;

  return pg_catalog.jsonb_build_object(
    'change_set_id', v_change_set_id,
    'change_count', v_item_count,
    'change_set_fingerprint', v_set_fp,
    'result_code', 'APPLIED',
    'idempotent', false
  );
end
$auth_db_012_append_change$;

create or replace function audit.append_authorization_permission_change_attempt(
  change jsonb
)
returns text
language plpgsql
volatile
security definer
strict
set search_path = pg_catalog, audit, app_private
as $auth_db_012_append_attempt$
declare
  v_id text;
  v_occurred_at timestamptz;
  v_recorded_at timestamptz := pg_catalog.statement_timestamp();
  v_principal_id text;
  v_actor_id text;
  v_technical_principal_id text := session_user;
  v_device_id text;
  v_app_code text;
  v_request_source text;
  v_command_id text;
  v_decision_id text;
  v_decision audit.authorization_decisions%rowtype;
  v_correlation_id text;
  v_permission_key text;
  v_source_kind text;
  v_subject_kind text;
  v_subject_reference text;
  v_requested_change_kind text;
  v_attempt_result text;
  v_reason_code text;
  v_error_class text;
  v_result_reference text;
  v_request_fp text;
  v_attempt_fp text;
  v_existing_fp text;
  v_sensitivity text := 'FUNCTIONAL_SENSITIVE';
  v_retention text := 'RET_OBLIGATION';
begin
  if pg_catalog.jsonb_typeof(change) <> 'object' or exists (
    select 1 from pg_catalog.jsonb_object_keys(change) k
    where k not in (
      'change_attempt_id', 'occurred_at', 'app_code', 'request_source', 'command_id',
      'authorization_decision_id', 'correlation_id', 'permission_key', 'source_kind',
      'subject_kind', 'subject_reference', 'requested_change_kind', 'attempt_result',
      'reason_code', 'error_class', 'result_reference'
    )
  ) then
    raise exception using errcode = '22023', message = 'AUTH_DB_012_ATTEMPT_ENVELOPE_INVALID';
  end if;

  v_id := nullif(change ->> 'change_attempt_id', '');
  v_command_id := nullif(change ->> 'command_id', '');
  v_decision_id := nullif(change ->> 'authorization_decision_id', '');
  v_permission_key := nullif(change ->> 'permission_key', '');
  v_source_kind := nullif(change ->> 'source_kind', '');
  v_subject_kind := nullif(change ->> 'subject_kind', '');
  v_subject_reference := nullif(change ->> 'subject_reference', '');
  v_requested_change_kind := nullif(change ->> 'requested_change_kind', '');
  v_attempt_result := nullif(change ->> 'attempt_result', '');
  v_reason_code := nullif(change ->> 'reason_code', '');
  v_error_class := nullif(change ->> 'error_class', '');
  v_result_reference := nullif(change ->> 'result_reference', '');

  if v_id is null or v_id !~ '^[0-9a-f]{8}-[0-9a-f]{4}-[1-5][0-9a-f]{3}-[89ab][0-9a-f]{3}-[0-9a-f]{12}$'
     or v_command_id is null or v_permission_key is null or v_permission_key ~ '[*%]'
     or v_permission_key !~ '^[a-z0-9][a-z0-9_.:-]*$'
     or v_subject_reference is null
     or v_source_kind not in ('PERMISSION_CATALOG_RELEASE', 'BASE_ROLE_GRANT', 'OPERATIONAL_ROLE_GRANT', 'INDIVIDUAL_OVERRIDE', 'EXPLICIT_DENIAL')
     or v_subject_kind not in ('BASE_ROLE', 'OPERATIONAL_ROLE', 'EMPLOYEE', 'CATALOG')
     or v_requested_change_kind not in ('CREATE', 'ACTIVATE', 'CHANGE_SCOPE', 'CHANGE_VALIDITY', 'SUSPEND', 'REVOKE', 'EXPIRE', 'REJECT', 'SUPERSEDE', 'MIGRATE', 'CORRECT_METADATA', 'CATALOG_RELEASE_ACTIVATED')
     or v_attempt_result not in ('DENIED', 'INVALID', 'CONFLICT', 'TECHNICAL_FAILURE', 'NO_CHANGE', 'ROLLED_BACK')
     or v_reason_code !~ '^[A-Z][A-Z0-9_]{2,127}$' then
    raise exception using errcode = '22023', message = 'AUTH_DB_012_ATTEMPT_IDENTITY_INVALID';
  end if;

  if v_attempt_result = 'DENIED' and v_decision_id is null then
    raise exception using errcode = '22023', message = 'AUTH_DB_012_DENIED_ATTEMPT_REQUIRES_DECISION';
  end if;
  if v_attempt_result = 'TECHNICAL_FAILURE' and v_error_class is null then
    raise exception using errcode = '22023', message = 'AUTH_DB_012_TECHNICAL_FAILURE_REQUIRES_ERROR_CLASS';
  end if;
  if v_attempt_result = 'ROLLED_BACK' and v_result_reference is null then
    raise exception using errcode = '22023', message = 'AUTH_DB_012_ROLLED_BACK_REQUIRES_EVIDENCE_REFERENCE';
  end if;

  begin
    v_occurred_at := (change ->> 'occurred_at')::timestamptz;
  exception when others then
    raise exception using errcode = '22023', message = 'AUTH_DB_012_ATTEMPT_OCCURRED_AT_INVALID';
  end;
  if v_recorded_at < v_occurred_at then
    raise exception using errcode = '22023', message = 'AUTH_DB_012_ATTEMPT_RECORDED_AT_PRECEDES_OCCURRED_AT';
  end if;

  if v_decision_id is not null then
    select d.* into v_decision from audit.authorization_decisions d where d.decision_id = v_decision_id;
    if not found then
      raise exception using errcode = '23503', message = 'AUTH_DB_012_ATTEMPT_DECISION_MISSING';
    end if;
    if v_attempt_result = 'DENIED' and v_decision.outcome <> 'DENY' then
      raise exception using errcode = '22023', message = 'AUTH_DB_012_DENIED_ATTEMPT_REQUIRES_DENY_DECISION';
    end if;
    v_principal_id := v_decision.principal_id;
    v_actor_id := v_decision.actor_id;
    v_device_id := v_decision.device_id;
    v_app_code := v_decision.app_code;
    v_request_source := v_decision.request_source;
    v_correlation_id := v_decision.correlation_id;
  else
    v_principal_id := null;
    v_actor_id := null;
    v_device_id := null;
    v_app_code := nullif(change ->> 'app_code', '');
    v_request_source := nullif(change ->> 'request_source', '');
    v_correlation_id := nullif(change ->> 'correlation_id', '');
    if v_app_code is null or v_correlation_id is null or v_request_source not in ('JOB', 'MIGRATION', 'RECOVERY') then
      raise exception using errcode = '42501', message = 'AUTH_DB_012_ATTEMPT_DECISION_REQUIRED_FOR_INTERACTIVE_REQUEST';
    end if;
  end if;

  v_request_fp := app_private.fingerprint_authorization_permission_change(
    pg_catalog.jsonb_build_object(
      'change_attempt_id', v_id,
      'command_id', v_command_id,
      'authorization_decision_id', v_decision_id,
      'correlation_id', v_correlation_id,
      'permission_key', v_permission_key,
      'source_kind', v_source_kind,
      'subject_kind', v_subject_kind,
      'subject_reference', v_subject_reference,
      'requested_change_kind', v_requested_change_kind
    )
  );
  v_attempt_fp := app_private.fingerprint_authorization_permission_change(
    pg_catalog.jsonb_build_object(
      'change_attempt_id', v_id,
      'occurred_at', pg_catalog.to_char(v_occurred_at at time zone 'UTC', 'YYYY-MM-DD"T"HH24:MI:SS.MS"Z"'),
      'principal_id', v_principal_id,
      'effective_actor_id', v_actor_id,
      'technical_principal_id', v_technical_principal_id,
      'device_id', v_device_id,
      'app_code', v_app_code,
      'request_source', v_request_source,
      'command_id', v_command_id,
      'authorization_decision_id', v_decision_id,
      'correlation_id', v_correlation_id,
      'permission_key', v_permission_key,
      'source_kind', v_source_kind,
      'subject_kind', v_subject_kind,
      'subject_reference', v_subject_reference,
      'requested_change_kind', v_requested_change_kind,
      'attempt_result', v_attempt_result,
      'reason_code', v_reason_code,
      'error_class', v_error_class,
      'result_reference', v_result_reference,
      'request_fingerprint', v_request_fp,
      'sensitivity_class', v_sensitivity,
      'retention_class', v_retention,
      'source_contract_sha256', 'ed13f66b299c7e6479201345309ce3e362d15c268249ee905d0c0655e61c0ff7'
    )
  );

  select a.attempt_fingerprint into v_existing_fp
  from audit.authorization_permission_change_attempts a
  where a.change_attempt_id = v_id;
  if found then
    if v_existing_fp is distinct from v_attempt_fp then
      raise exception using errcode = '23505', message = 'AUTH_DB_012_ATTEMPT_INTEGRITY_CONFLICT';
    end if;
    return v_id;
  end if;

  insert into audit.authorization_permission_change_attempts (
    change_attempt_id, occurred_at, recorded_at, principal_id, effective_actor_id,
    technical_principal_id, device_id, app_code, request_source, command_id,
    authorization_decision_id, correlation_id, permission_key, source_kind, subject_kind,
    subject_reference, requested_change_kind, attempt_result, reason_code, error_class,
    result_reference, request_fingerprint, sensitivity_class, retention_class,
    attempt_fingerprint, source_contract_sha256
  ) values (
    v_id, v_occurred_at, v_recorded_at, v_principal_id, v_actor_id,
    v_technical_principal_id, v_device_id, v_app_code, v_request_source, v_command_id,
    v_decision_id, v_correlation_id, v_permission_key, v_source_kind, v_subject_kind,
    v_subject_reference, v_requested_change_kind, v_attempt_result, v_reason_code, v_error_class,
    v_result_reference, v_request_fp, v_sensitivity, v_retention,
    v_attempt_fp, 'ed13f66b299c7e6479201345309ce3e362d15c268249ee905d0c0655e61c0ff7'
  );

  return v_id;
end
$auth_db_012_append_attempt$;

create or replace function audit.get_authorization_permission_change(
  p_change_set_id text
)
returns jsonb
language sql
stable
security definer
strict
set search_path = pg_catalog, audit, app_private
as $auth_db_012_get_change$
  select pg_catalog.jsonb_build_object(
    'change_set', pg_catalog.to_jsonb(s),
    'items', coalesce((
      select pg_catalog.jsonb_agg(pg_catalog.to_jsonb(i) order by i.change_ordinal)
      from audit.authorization_permission_changes i
      where i.change_set_id = s.change_set_id
    ), '[]'::jsonb),
    'links', coalesce((
      select pg_catalog.jsonb_agg(pg_catalog.to_jsonb(l) order by l.occurred_at, l.permission_change_link_id)
      from audit.authorization_permission_change_links l
      where l.change_set_id = s.change_set_id
    ), '[]'::jsonb)
  )
  from audit.authorization_permission_change_sets s
  where s.change_set_id = p_change_set_id;
$auth_db_012_get_change$;

create or replace function audit.list_authorization_permission_change_items(
  p_change_set_id text
)
returns jsonb
language sql
stable
security definer
strict
set search_path = pg_catalog, audit, app_private
as $auth_db_012_list_items$
  select coalesce(
    pg_catalog.jsonb_agg(pg_catalog.to_jsonb(i) order by i.change_ordinal),
    '[]'::jsonb
  )
  from audit.authorization_permission_changes i
  where i.change_set_id = p_change_set_id;
$auth_db_012_list_items$;

create or replace function audit.search_authorization_permission_changes(
  p_search jsonb
)
returns jsonb
language plpgsql
stable
security definer
strict
set search_path = pg_catalog, audit, app_private
as $auth_db_012_search_changes$
declare
  v_limit integer;
  v_cursor_at timestamptz;
  v_cursor_id text;
  v_from timestamptz;
  v_to timestamptz;
  v_items jsonb;
  v_next_cursor jsonb;
begin
  if pg_catalog.jsonb_typeof(p_search) <> 'object' then
    raise exception using errcode = '22023', message = 'AUTH_DB_012_SEARCH_REQUEST_INVALID';
  end if;
  if exists (
    select 1 from pg_catalog.jsonb_object_keys(p_search) k
    where k not in (
      'change_set_id', 'permission_change_id', 'authorization_decision_id', 'correlation_id',
      'effective_actor_id', 'principal_id', 'subject_kind', 'subject_reference',
      'permission_key', 'lane', 'effect', 'source_kind', 'change_kind',
      'occurred_from', 'occurred_to', 'limit', 'cursor'
    )
  ) then
    raise exception using errcode = '22023', message = 'AUTH_DB_012_SEARCH_FILTER_FORBIDDEN';
  end if;
  if not (p_search ? 'limit') then
    raise exception using errcode = '22023', message = 'AUTH_DB_012_SEARCH_LIMIT_REQUIRED';
  end if;
  begin
    v_limit := (p_search ->> 'limit')::integer;
    if nullif(p_search ->> 'occurred_from', '') is not null then v_from := (p_search ->> 'occurred_from')::timestamptz; end if;
    if nullif(p_search ->> 'occurred_to', '') is not null then v_to := (p_search ->> 'occurred_to')::timestamptz; end if;
    if p_search ? 'cursor' and p_search -> 'cursor' <> 'null'::jsonb then
      if pg_catalog.jsonb_typeof(p_search -> 'cursor') <> 'object'
         or nullif(p_search #>> '{cursor,occurred_at}', '') is null
         or nullif(p_search #>> '{cursor,change_set_id}', '') is null then
        raise exception 'CURSOR';
      end if;
      v_cursor_at := (p_search #>> '{cursor,occurred_at}')::timestamptz;
      v_cursor_id := p_search #>> '{cursor,change_set_id}';
    end if;
  exception when others then
    raise exception using errcode = '22023', message = 'AUTH_DB_012_SEARCH_LIMIT_TIME_OR_CURSOR_INVALID';
  end;
  if v_limit < 1 or v_limit > 100 then
    raise exception using errcode = '22023', message = 'AUTH_DB_012_SEARCH_LIMIT_INVALID';
  end if;
  if p_search ? 'subject_kind' and p_search ->> 'subject_kind' not in ('BASE_ROLE', 'OPERATIONAL_ROLE', 'EMPLOYEE', 'CATALOG') then
    raise exception using errcode = '22023', message = 'AUTH_DB_012_SEARCH_SUBJECT_KIND_INVALID';
  end if;
  if p_search ? 'lane' and p_search ->> 'lane' not in ('BASE', 'OPERATIONAL', 'ALL_COMPATIBLE', 'NOT_APPLICABLE') then
    raise exception using errcode = '22023', message = 'AUTH_DB_012_SEARCH_LANE_INVALID';
  end if;
  if p_search ? 'effect' and p_search ->> 'effect' not in ('ALLOW', 'DENY', 'NOT_APPLICABLE') then
    raise exception using errcode = '22023', message = 'AUTH_DB_012_SEARCH_EFFECT_INVALID';
  end if;
  if p_search ? 'source_kind' and p_search ->> 'source_kind' not in ('PERMISSION_CATALOG_RELEASE', 'BASE_ROLE_GRANT', 'OPERATIONAL_ROLE_GRANT', 'INDIVIDUAL_OVERRIDE', 'EXPLICIT_DENIAL') then
    raise exception using errcode = '22023', message = 'AUTH_DB_012_SEARCH_SOURCE_KIND_INVALID';
  end if;
  if p_search ? 'change_kind' and p_search ->> 'change_kind' not in ('CREATE', 'ACTIVATE', 'CHANGE_SCOPE', 'CHANGE_VALIDITY', 'SUSPEND', 'REVOKE', 'EXPIRE', 'REJECT', 'SUPERSEDE', 'MIGRATE', 'CORRECT_METADATA', 'CATALOG_RELEASE_ACTIVATED') then
    raise exception using errcode = '22023', message = 'AUTH_DB_012_SEARCH_CHANGE_KIND_INVALID';
  end if;

  with filtered as (
    select s.*
    from audit.authorization_permission_change_sets s
    where (nullif(p_search ->> 'change_set_id', '') is null or s.change_set_id = p_search ->> 'change_set_id')
      and (nullif(p_search ->> 'authorization_decision_id', '') is null or s.authorization_decision_id = p_search ->> 'authorization_decision_id')
      and (nullif(p_search ->> 'correlation_id', '') is null or s.correlation_id = p_search ->> 'correlation_id')
      and (nullif(p_search ->> 'effective_actor_id', '') is null or s.effective_actor_id = p_search ->> 'effective_actor_id')
      and (nullif(p_search ->> 'principal_id', '') is null or s.principal_id = p_search ->> 'principal_id')
      and (v_from is null or s.occurred_at >= v_from)
      and (v_to is null or s.occurred_at <= v_to)
      and (
        nullif(p_search ->> 'permission_change_id', '') is null
        or exists (select 1 from audit.authorization_permission_changes i where i.change_set_id = s.change_set_id and i.permission_change_id = p_search ->> 'permission_change_id')
      )
      and (
        nullif(p_search ->> 'subject_kind', '') is null
        or exists (select 1 from audit.authorization_permission_changes i where i.change_set_id = s.change_set_id and i.subject_kind = p_search ->> 'subject_kind')
      )
      and (
        nullif(p_search ->> 'subject_reference', '') is null
        or exists (select 1 from audit.authorization_permission_changes i where i.change_set_id = s.change_set_id and i.subject_reference = p_search ->> 'subject_reference')
      )
      and (
        nullif(p_search ->> 'permission_key', '') is null
        or exists (select 1 from audit.authorization_permission_changes i where i.change_set_id = s.change_set_id and i.permission_key = p_search ->> 'permission_key')
      )
      and (
        nullif(p_search ->> 'lane', '') is null
        or exists (select 1 from audit.authorization_permission_changes i where i.change_set_id = s.change_set_id and i.lane = p_search ->> 'lane')
      )
      and (
        nullif(p_search ->> 'effect', '') is null
        or exists (select 1 from audit.authorization_permission_changes i where i.change_set_id = s.change_set_id and i.effect = p_search ->> 'effect')
      )
      and (
        nullif(p_search ->> 'source_kind', '') is null
        or exists (select 1 from audit.authorization_permission_changes i where i.change_set_id = s.change_set_id and i.source_kind = p_search ->> 'source_kind')
      )
      and (
        nullif(p_search ->> 'change_kind', '') is null
        or exists (select 1 from audit.authorization_permission_changes i where i.change_set_id = s.change_set_id and i.change_kind = p_search ->> 'change_kind')
      )
      and (v_cursor_at is null or (s.occurred_at, s.change_set_id) < (v_cursor_at, v_cursor_id))
    order by s.occurred_at desc, s.change_set_id desc
    limit v_limit + 1
  ), page_rows as (
    select * from filtered order by occurred_at desc, change_set_id desc limit v_limit
  )
  select
    coalesce(pg_catalog.jsonb_agg(
      pg_catalog.jsonb_build_object(
        'change_set_id', s.change_set_id,
        'occurred_at', s.occurred_at,
        'recorded_at', s.recorded_at,
        'principal_id', s.principal_id,
        'effective_actor_id', s.effective_actor_id,
        'technical_principal_id', s.technical_principal_id,
        'device_id', s.device_id,
        'app_code', s.app_code,
        'request_source', s.request_source,
        'command_id', s.command_id,
        'authorization_decision_id', s.authorization_decision_id,
        'correlation_id', s.correlation_id,
        'reason_code', s.reason_code,
        'source_reference', s.source_reference,
        'change_count', s.change_count,
        'result_code', s.result_code,
        'sensitivity_class', s.sensitivity_class,
        'retention_class', s.retention_class,
        'change_set_fingerprint', s.change_set_fingerprint
      ) order by s.occurred_at desc, s.change_set_id desc
    ), '[]'::jsonb),
    case when (select pg_catalog.count(*) from filtered) > v_limit then (
      select pg_catalog.jsonb_build_object(
        'occurred_at', pg_catalog.to_char(p.occurred_at at time zone 'UTC', 'YYYY-MM-DD"T"HH24:MI:SS.MS"Z"'),
        'change_set_id', p.change_set_id
      )
      from page_rows p order by p.occurred_at asc, p.change_set_id asc limit 1
    ) else null end
  into v_items, v_next_cursor
  from page_rows s;

  return pg_catalog.jsonb_build_object('items', v_items, 'next_cursor', v_next_cursor);
end
$auth_db_012_search_changes$;

drop trigger if exists trg_auth_db_012_permission_change_sets_append_only on audit.authorization_permission_change_sets;
create trigger trg_auth_db_012_permission_change_sets_append_only
before update or delete on audit.authorization_permission_change_sets
for each row execute function audit.reject_authorization_permission_audit_mutation();

drop trigger if exists trg_auth_db_012_permission_changes_append_only on audit.authorization_permission_changes;
create trigger trg_auth_db_012_permission_changes_append_only
before update or delete on audit.authorization_permission_changes
for each row execute function audit.reject_authorization_permission_audit_mutation();

drop trigger if exists trg_auth_db_012_permission_change_attempts_append_only on audit.authorization_permission_change_attempts;
create trigger trg_auth_db_012_permission_change_attempts_append_only
before update or delete on audit.authorization_permission_change_attempts
for each row execute function audit.reject_authorization_permission_audit_mutation();

drop trigger if exists trg_auth_db_012_permission_change_links_append_only on audit.authorization_permission_change_links;
create trigger trg_auth_db_012_permission_change_links_append_only
before update or delete on audit.authorization_permission_change_links
for each row execute function audit.reject_authorization_permission_audit_mutation();

alter table audit.authorization_permission_change_sets enable row level security;
alter table audit.authorization_permission_changes enable row level security;
alter table audit.authorization_permission_change_attempts enable row level security;
alter table audit.authorization_permission_change_links enable row level security;

revoke all on table
  audit.authorization_permission_change_sets,
  audit.authorization_permission_changes,
  audit.authorization_permission_change_attempts,
  audit.authorization_permission_change_links
from public, anon, authenticated, service_role;

revoke all on function
  audit.append_authorization_permission_change(jsonb),
  audit.append_authorization_permission_change_attempt(jsonb),
  audit.get_authorization_permission_change(text),
  audit.search_authorization_permission_changes(jsonb),
  audit.list_authorization_permission_change_items(text),
  audit.reject_authorization_permission_audit_mutation(),
  app_private.canonicalize_authorization_permission_change(jsonb),
  app_private.fingerprint_authorization_permission_change(jsonb)
from public, anon, authenticated, service_role;

grant execute on function
  audit.append_authorization_permission_change(jsonb),
  audit.append_authorization_permission_change_attempt(jsonb),
  audit.get_authorization_permission_change(text),
  audit.search_authorization_permission_changes(jsonb),
  audit.list_authorization_permission_change_items(text)
to postgres;

grant select on table
  audit.authorization_permission_change_sets,
  audit.authorization_permission_changes,
  audit.authorization_permission_change_attempts,
  audit.authorization_permission_change_links
to postgres;

reset role;

revoke all on schema audit from public, anon, authenticated, service_role;

do $auth_db_012_postconditions$
declare
  v_count bigint;
begin
  select pg_catalog.count(*) into v_count
  from pg_catalog.pg_class c
  join pg_catalog.pg_namespace n on n.oid = c.relnamespace
  where n.nspname = 'audit'
    and c.relname in (
      'authorization_permission_change_sets',
      'authorization_permission_changes',
      'authorization_permission_change_attempts',
      'authorization_permission_change_links'
    )
    and c.relkind in ('r', 'p');
  if v_count <> 4 then
    raise exception 'AUTH_DB_012_TABLE_INVENTORY_INVALID:%', v_count;
  end if;

  select pg_catalog.count(*) into v_count
  from pg_catalog.pg_proc p
  join pg_catalog.pg_namespace n on n.oid = p.pronamespace
  where (n.nspname, p.proname) in (
    ('audit', 'append_authorization_permission_change'),
    ('audit', 'append_authorization_permission_change_attempt'),
    ('audit', 'get_authorization_permission_change'),
    ('audit', 'search_authorization_permission_changes'),
    ('audit', 'list_authorization_permission_change_items'),
    ('audit', 'reject_authorization_permission_audit_mutation'),
    ('app_private', 'canonicalize_authorization_permission_change'),
    ('app_private', 'fingerprint_authorization_permission_change')
  );
  if v_count <> 8 then
    raise exception 'AUTH_DB_012_FUNCTION_INVENTORY_INVALID:%', v_count;
  end if;

  if exists (
    select 1
    from pg_catalog.pg_class c
    join pg_catalog.pg_namespace n on n.oid = c.relnamespace
    where n.nspname = 'audit'
      and c.relname in (
        'authorization_permission_change_sets',
        'authorization_permission_changes',
        'authorization_permission_change_attempts',
        'authorization_permission_change_links'
      )
      and (not c.relrowsecurity or c.relforcerowsecurity)
  ) then
    raise exception 'AUTH_DB_012_RLS_POSTURE_INVALID';
  end if;

  if exists (
    select 1
    from pg_catalog.pg_class c
    join pg_catalog.pg_namespace n on n.oid = c.relnamespace
    where n.nspname = 'audit'
      and c.relname in (
        'authorization_permission_change_sets',
        'authorization_permission_changes',
        'authorization_permission_change_attempts',
        'authorization_permission_change_links'
      )
      and pg_catalog.pg_get_userbyid(c.relowner) <> 'vento_authorization_owner'
  ) then
    raise exception 'AUTH_DB_012_TABLE_OWNER_INVALID';
  end if;

  if exists (
    select 1
    from pg_catalog.pg_class c
    join pg_catalog.pg_namespace n on n.oid = c.relnamespace
    where n.nspname = 'audit'
      and c.relname in (
        'authorization_permission_change_sets',
        'authorization_permission_changes',
        'authorization_permission_change_attempts',
        'authorization_permission_change_links'
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
    raise exception 'AUTH_DB_012_CLIENT_TABLE_PRIVILEGE_LEAK';
  end if;

  if exists (
    select 1
    from (
      values
        ('audit.append_authorization_permission_change(jsonb)'::regprocedure),
        ('audit.append_authorization_permission_change_attempt(jsonb)'::regprocedure),
        ('audit.get_authorization_permission_change(text)'::regprocedure),
        ('audit.search_authorization_permission_changes(jsonb)'::regprocedure),
        ('audit.list_authorization_permission_change_items(text)'::regprocedure),
        ('audit.reject_authorization_permission_audit_mutation()'::regprocedure),
        ('app_private.canonicalize_authorization_permission_change(jsonb)'::regprocedure),
        ('app_private.fingerprint_authorization_permission_change(jsonb)'::regprocedure)
    ) f(oid)
    where pg_catalog.has_function_privilege('anon', f.oid, 'EXECUTE')
       or pg_catalog.has_function_privilege('authenticated', f.oid, 'EXECUTE')
       or pg_catalog.has_function_privilege('service_role', f.oid, 'EXECUTE')
  ) then
    raise exception 'AUTH_DB_012_CLIENT_FUNCTION_PRIVILEGE_LEAK';
  end if;

  if exists (
    select 1
    from (
      values
        ('audit.append_authorization_permission_change(jsonb)'::regprocedure),
        ('audit.append_authorization_permission_change_attempt(jsonb)'::regprocedure),
        ('audit.get_authorization_permission_change(text)'::regprocedure),
        ('audit.search_authorization_permission_changes(jsonb)'::regprocedure),
        ('audit.list_authorization_permission_change_items(text)'::regprocedure)
    ) f(oid)
    join pg_catalog.pg_proc p on p.oid = f.oid
    where not p.prosecdef
       or coalesce(pg_catalog.array_to_string(p.proconfig, ','), '') <> 'search_path=pg_catalog, audit, app_private'
  ) then
    raise exception 'AUTH_DB_012_PRIVILEGED_FUNCTION_POSTURE_INVALID';
  end if;

  if exists (
    select 1
    from pg_catalog.pg_trigger t
    where t.tgrelid in (
      'public.app_permissions'::regclass,
      'public.role_permissions'::regclass,
      'public.employee_permissions'::regclass,
      'public.operational_role_permissions'::regclass,
      'public.role_capabilities'::regclass
    )
      and not t.tgisinternal
      and t.tgname like 'trg_auth_db_012%'
  ) then
    raise exception 'AUTH_DB_012_LEGACY_WRITER_ADOPTION_FORBIDDEN';
  end if;
end
$auth_db_012_postconditions$;

commit;
