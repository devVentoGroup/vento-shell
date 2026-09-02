-- AUTH-DB-014::GLOBAL
-- Canonical append-only authorization device lifecycle audit foundation.
-- source_contract_sha256 = 17823df588e49b5ac27dec4fa2b75e222d1797841818611629f306a9a34ee11c
-- This file is migration CONTENT only. The repository migration filename must be created by Supabase CLI.
-- AUTH-DB-020 owns progressive writer adoption; AUTH-DEV-007..016 own operational device behavior.
-- Legacy shared-device rows are preserved as evidence without becoming a second source of authority.
-- No hosted Supabase target is mutated directly by this migration authoring flow.

begin;

do $auth_db_014_preconditions$
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
    raise exception 'AUTH_DB_014_AUTHORIZATION_OWNER_MISSING_OR_UNSAFE';
  end if;

  if pg_catalog.to_regnamespace('audit') is null
     or pg_catalog.to_regnamespace('app_private') is null
     or pg_catalog.to_regnamespace('extensions') is null then
    raise exception 'AUTH_DB_014_REQUIRED_SCHEMA_MISSING';
  end if;

  if pg_catalog.to_regclass('audit.authorization_decisions') is null then
    raise exception 'AUTH_DB_014_AUTHORIZATION_DECISION_STORE_MISSING';
  end if;

  if pg_catalog.to_regprocedure('app_private.canonicalize_authorization_payload(jsonb)') is null
     or pg_catalog.to_regprocedure('extensions.digest(text,text)') is null
     or pg_catalog.to_regprocedure('extensions.gen_random_uuid()') is null then
    raise exception 'AUTH_DB_014_CANONICAL_FINGERPRINT_GRAPH_MISSING';
  end if;

  if pg_catalog.to_regclass('public.shared_operational_devices') is null
     or pg_catalog.to_regclass('public.shared_operational_device_apps') is null
     or pg_catalog.to_regclass('public.shared_operational_device_actor_sessions') is null
     or pg_catalog.to_regclass('public.shared_operational_device_events') is null
     or pg_catalog.to_regclass('public.shared_operational_device_templates') is null
     or pg_catalog.to_regclass('public.shared_operational_device_template_apps') is null
     or pg_catalog.to_regclass('public.shared_operational_device_actor_policies') is null
     or pg_catalog.to_regclass('public.shared_operational_device_template_actor_policies') is null then
    raise exception 'AUTH_DB_014_LEGACY_DEVICE_SURFACE_MISSING';
  end if;

  if not exists (
    select 1
    from pg_catalog.pg_class c
    where c.oid = 'audit.authorization_decisions'::regclass
      and pg_catalog.pg_get_userbyid(c.relowner) = 'vento_authorization_owner'
  ) then
    raise exception 'AUTH_DB_014_AUTHORIZATION_DECISION_OWNER_DRIFT';
  end if;

  if exists (
    select 1
    from pg_catalog.pg_class c
    join pg_catalog.pg_namespace n on n.oid = c.relnamespace
    where n.nspname = 'audit'
      and c.relname in (
        'authorization_devices',
        'authorization_device_revisions',
        'authorization_device_events',
        'authorization_device_attempts',
        'authorization_device_links',
        'authorization_device_corrections'
      )
  ) then
    raise exception 'AUTH_DB_014_TARGET_RELATION_ALREADY_EXISTS';
  end if;

  if exists (
    select 1
    from pg_catalog.pg_proc p
    join pg_catalog.pg_namespace n on n.oid = p.pronamespace
    where n.nspname = 'app_private'
      and p.proname in (
        'canonicalize_authorization_device',
        'fingerprint_authorization_device',
        'derive_authorization_device_state',
        'append_authorization_device',
        'append_authorization_device_revision',
        'append_authorization_device_event',
        'append_authorization_device_attempt',
        'link_authorization_device_evidence',
        'correct_authorization_device_audit',
        'import_authorization_device_legacy_event',
        'reject_authorization_device_audit_mutation'
      )
  ) then
    raise exception 'AUTH_DB_014_TARGET_FUNCTION_ALREADY_EXISTS';
  end if;

  raise notice 'AUTH_DB_014_LEGACY_COUNTS devices=% device_apps=% actor_sessions=% events=% templates=% template_apps=% actor_policies=% template_actor_policies=%',
    (select pg_catalog.count(*) from public.shared_operational_devices),
    (select pg_catalog.count(*) from public.shared_operational_device_apps),
    (select pg_catalog.count(*) from public.shared_operational_device_actor_sessions),
    (select pg_catalog.count(*) from public.shared_operational_device_events),
    (select pg_catalog.count(*) from public.shared_operational_device_templates),
    (select pg_catalog.count(*) from public.shared_operational_device_template_apps),
    (select pg_catalog.count(*) from public.shared_operational_device_actor_policies),
    (select pg_catalog.count(*) from public.shared_operational_device_template_actor_policies);
end
$auth_db_014_preconditions$;

grant usage, create on schema audit, app_private to vento_authorization_owner;
grant usage on schema extensions to vento_authorization_owner;
grant execute on function extensions.digest(text, text), extensions.gen_random_uuid() to vento_authorization_owner;
-- Temporary replay-only reads. These grants are revoked before commit and do not alter the final legacy ACL.
grant select on table
  public.shared_operational_devices,
  public.shared_operational_device_events
to vento_authorization_owner;

set local role vento_authorization_owner;

alter default privileges in schema audit revoke all on tables from public;
alter default privileges in schema audit revoke execute on functions from public;
alter default privileges in schema app_private revoke execute on functions from public;

create table audit.authorization_devices (
  device_audit_id uuid primary key,
  device_id uuid not null,
  device_code text not null,
  contract_family text not null,
  contract_family_version text not null,
  contract_name text not null,
  contract_version text not null,
  schema_version text not null,
  first_observed_at timestamptz not null,
  first_event_id uuid not null,
  source_registry text not null,
  source_identity_version text not null,
  creation_idempotency_key_hash text not null,
  creation_request_fingerprint text not null,
  created_at timestamptz not null default pg_catalog.statement_timestamp(),
  source_contract_sha256 text not null,
  constraint uq_authorization_devices_device_id unique (device_id),
  constraint uq_authorization_devices_device_code unique (device_code),
  constraint uq_authorization_devices_idempotency unique (creation_idempotency_key_hash),
  constraint ck_authorization_devices_contract check (
    contract_family = 'vento.authorization.device-audit'
    and contract_family_version = '1.0.0'
    and contract_name = 'AuthorizationDeviceAudit'
    and contract_version = '1.0.0'
    and schema_version = '1.0.0'
  ),
  constraint ck_authorization_devices_code check (
    pg_catalog.length(pg_catalog.btrim(device_code)) between 3 and 128
    and device_code !~ '[[:space:]]'
  ),
  constraint ck_authorization_devices_source check (
    pg_catalog.length(pg_catalog.btrim(source_registry)) between 3 and 160
    and pg_catalog.length(pg_catalog.btrim(source_identity_version)) between 1 and 160
    and pg_catalog.lower(source_identity_version) not in ('latest', 'current', 'unknown')
  ),
  constraint ck_authorization_devices_fingerprints check (
    creation_idempotency_key_hash ~ '^sha256:[0-9a-f]{64}$'
    and creation_request_fingerprint ~ '^sha256:[0-9a-f]{64}$'
  ),
  constraint ck_authorization_devices_time check (created_at >= first_observed_at),
  constraint ck_authorization_devices_source_contract check (
    source_contract_sha256 = '17823df588e49b5ac27dec4fa2b75e222d1797841818611629f306a9a34ee11c'
  )
);

create table audit.authorization_device_revisions (
  device_revision_id uuid primary key,
  device_audit_id uuid not null,
  device_id uuid not null,
  revision_number integer not null,
  revision_kind text not null,
  lifecycle_state text not null,
  configuration_snapshot jsonb not null,
  configuration_fingerprint text not null,
  source_versions jsonb not null,
  source_fingerprints jsonb not null,
  valid_from timestamptz not null,
  recorded_at timestamptz not null default pg_catalog.statement_timestamp(),
  recorded_by_actor_id text,
  authorization_decision_id text,
  correlation_id text not null,
  causation_id text,
  transition_idempotency_key_hash text not null,
  transition_request_fingerprint text not null,
  source_contract_sha256 text not null,
  constraint fk_authorization_device_revisions_root foreign key (device_audit_id)
    references audit.authorization_devices(device_audit_id),
  constraint fk_authorization_device_revisions_decision foreign key (authorization_decision_id)
    references audit.authorization_decisions(decision_id),
  constraint uq_authorization_device_revisions_number unique (device_audit_id, revision_number),
  constraint uq_authorization_device_revisions_idempotency unique (device_audit_id, transition_idempotency_key_hash),
  constraint ck_authorization_device_revisions_number check (revision_number > 0),
  constraint ck_authorization_device_revisions_kind check (revision_kind in (
    'INITIAL', 'ENROLLMENT', 'ACTIVATION', 'SUSPENSION', 'RESUMPTION', 'CREDENTIAL',
    'ENDPOINT', 'HARDWARE', 'TERRITORY', 'APPLICATIONS', 'PERMISSIONS', 'TEMPLATE',
    'ACTOR_POLICY', 'REVOCATION', 'RETIREMENT', 'CONFLICT', 'RECOVERY'
  )),
  constraint ck_authorization_device_revisions_state check (lifecycle_state in (
    'DRAFT', 'ENROLLING', 'ACTIVE', 'SUSPENDED', 'REVOKED', 'RETIRED', 'CONFLICTED', 'RECOVERY_REQUIRED'
  )),
  constraint ck_authorization_device_revisions_snapshot check (
    pg_catalog.jsonb_typeof(configuration_snapshot) = 'object'
    and pg_catalog.octet_length(configuration_snapshot::text) <= 65536
  ),
  constraint ck_authorization_device_revisions_sources check (
    pg_catalog.jsonb_typeof(source_versions) = 'object'
    and pg_catalog.jsonb_typeof(source_fingerprints) = 'object'
  ),
  constraint ck_authorization_device_revisions_fingerprints check (
    configuration_fingerprint ~ '^sha256:[0-9a-f]{64}$'
    and transition_idempotency_key_hash ~ '^sha256:[0-9a-f]{64}$'
    and transition_request_fingerprint ~ '^sha256:[0-9a-f]{64}$'
  ),
  constraint ck_authorization_device_revisions_time check (recorded_at >= valid_from),
  constraint ck_authorization_device_revisions_source_contract check (
    source_contract_sha256 = '17823df588e49b5ac27dec4fa2b75e222d1797841818611629f306a9a34ee11c'
  )
);

create table audit.authorization_device_events (
  device_event_id uuid primary key,
  device_audit_id uuid not null,
  device_id uuid not null,
  device_revision_id uuid,
  event_sequence integer not null,
  event_type text not null,
  event_family text not null,
  event_outcome text not null,
  occurred_at timestamptz not null,
  recorded_at timestamptz not null default pg_catalog.statement_timestamp(),
  administrative_actor_id text,
  actor_employee_id uuid,
  actor_session_id uuid,
  technical_principal_id text,
  endpoint_id text,
  credential_binding_id text,
  authorization_decision_id text,
  correlation_id text not null,
  causation_id text,
  source_system text not null,
  source_operation_id text not null,
  idempotency_key_hash text not null,
  operation_fingerprint text not null,
  contract_version text not null,
  source_versions jsonb not null,
  source_fingerprints jsonb not null,
  event_payload jsonb not null default '{}'::jsonb,
  event_fingerprint text not null,
  source_contract_sha256 text not null,
  constraint fk_authorization_device_events_root foreign key (device_audit_id)
    references audit.authorization_devices(device_audit_id),
  constraint fk_authorization_device_events_revision foreign key (device_revision_id)
    references audit.authorization_device_revisions(device_revision_id),
  constraint fk_authorization_device_events_decision foreign key (authorization_decision_id)
    references audit.authorization_decisions(decision_id),
  constraint uq_authorization_device_events_sequence unique (device_audit_id, event_sequence),
  constraint uq_authorization_device_events_source unique (source_system, source_operation_id),
  constraint uq_authorization_device_events_idempotency unique (device_audit_id, idempotency_key_hash),
  constraint ck_authorization_device_events_sequence check (event_sequence > 0),
  constraint ck_authorization_device_events_type check (event_type in (
    'DEVICE_REGISTERED',
    'ENROLLMENT_STARTED', 'ENROLLMENT_SUCCEEDED', 'ENROLLMENT_FAILED',
    'DEVICE_ACTIVATED', 'DEVICE_SUSPENDED', 'DEVICE_RESUMED',
    'CREDENTIAL_ROTATION_STARTED', 'CREDENTIAL_ROTATED', 'CREDENTIAL_ROTATION_FAILED', 'CREDENTIAL_REVOKED',
    'ENDPOINT_REINSTALLED', 'ENDPOINT_REVOKED', 'HARDWARE_REPLACED',
    'SITE_BINDING_CHANGED', 'AREA_POLICY_CHANGED',
    'APPLICATION_SET_CHANGED', 'DEFAULT_APPLICATION_CHANGED',
    'PERMISSION_PACKAGE_CHANGED', 'TEMPLATE_BINDING_CHANGED',
    'ACTOR_SESSION_STARTED', 'ACTOR_SESSION_ENDED', 'ACTOR_SESSION_EXPIRED', 'ACTOR_SESSION_REVOKED', 'ACTOR_CHANGED',
    'DEVICE_BECAME_UNHEALTHY', 'DEVICE_RECOVERED_HEALTH',
    'DEVICE_REVOKED', 'RETIREMENT_STARTED', 'DEVICE_RETIRED',
    'IDENTITY_CONFLICT_DETECTED', 'IDENTITY_CONFLICT_RESOLVED',
    'RECOVERY_STARTED', 'RECOVERY_COMPLETED', 'LEGACY_RECORD_IMPORTED'
  )),
  constraint ck_authorization_device_events_family check (
    event_family = case
      when event_type = 'DEVICE_REGISTERED' then 'IDENTITY'
      when event_type in ('ENROLLMENT_STARTED','ENROLLMENT_SUCCEEDED','ENROLLMENT_FAILED') then 'ENROLLMENT'
      when event_type = 'DEVICE_ACTIVATED' then 'ACTIVATION'
      when event_type in ('CREDENTIAL_ROTATION_STARTED','CREDENTIAL_ROTATED','CREDENTIAL_ROTATION_FAILED','CREDENTIAL_REVOKED') then 'CREDENTIAL'
      when event_type in ('ENDPOINT_REINSTALLED','ENDPOINT_REVOKED') then 'ENDPOINT'
      when event_type = 'HARDWARE_REPLACED' then 'HARDWARE'
      when event_type in ('SITE_BINDING_CHANGED','AREA_POLICY_CHANGED') then 'TERRITORY'
      when event_type in ('APPLICATION_SET_CHANGED','DEFAULT_APPLICATION_CHANGED') then 'APPLICATIONS'
      when event_type = 'PERMISSION_PACKAGE_CHANGED' then 'PERMISSIONS'
      when event_type = 'TEMPLATE_BINDING_CHANGED' then 'TEMPLATE'
      when event_type in ('ACTOR_SESSION_STARTED','ACTOR_SESSION_ENDED','ACTOR_SESSION_EXPIRED','ACTOR_SESSION_REVOKED','ACTOR_CHANGED') then 'ACTOR_SESSION'
      when event_type in ('DEVICE_BECAME_UNHEALTHY','DEVICE_RECOVERED_HEALTH') then 'HEALTH_STATE'
      when event_type in ('DEVICE_SUSPENDED','DEVICE_RESUMED') then 'SUSPENSION'
      when event_type = 'DEVICE_REVOKED' then 'REVOCATION'
      when event_type in ('RETIREMENT_STARTED','DEVICE_RETIRED') then 'RETIREMENT'
      when event_type in ('IDENTITY_CONFLICT_DETECTED','IDENTITY_CONFLICT_RESOLVED') then 'CONFLICT'
      when event_type in ('RECOVERY_STARTED','RECOVERY_COMPLETED') then 'RECOVERY'
      when event_type = 'LEGACY_RECORD_IMPORTED' then 'MIGRATION'
      else null
    end
  ),
  constraint ck_authorization_device_events_outcome check (event_outcome in ('SUCCEEDED','NO_OP_CONFIRMED')),
  constraint ck_authorization_device_events_revision_required check (
    event_type = 'LEGACY_RECORD_IMPORTED' or device_revision_id is not null
  ),
  constraint ck_authorization_device_events_payload check (
    pg_catalog.jsonb_typeof(event_payload) = 'object'
    and pg_catalog.octet_length(event_payload::text) <= 32768
  ),
  constraint ck_authorization_device_events_sources check (
    pg_catalog.jsonb_typeof(source_versions) = 'object'
    and pg_catalog.jsonb_typeof(source_fingerprints) = 'object'
  ),
  constraint ck_authorization_device_events_fingerprints check (
    idempotency_key_hash ~ '^sha256:[0-9a-f]{64}$'
    and operation_fingerprint ~ '^sha256:[0-9a-f]{64}$'
    and event_fingerprint ~ '^sha256:[0-9a-f]{64}$'
  ),
  constraint ck_authorization_device_events_contract check (contract_version = '1.0.0'),
  constraint ck_authorization_device_events_time check (recorded_at >= occurred_at),
  constraint ck_authorization_device_events_source_contract check (
    source_contract_sha256 = '17823df588e49b5ac27dec4fa2b75e222d1797841818611629f306a9a34ee11c'
  )
);

alter table audit.authorization_devices
  add constraint fk_authorization_devices_first_event
  foreign key (first_event_id)
  references audit.authorization_device_events(device_event_id)
  deferrable initially deferred;

create table audit.authorization_device_attempts (
  device_attempt_id uuid primary key,
  device_audit_id uuid,
  device_id uuid,
  requested_operation text not null,
  expected_revision integer,
  requested_at timestamptz not null,
  resolved_at timestamptz,
  outcome text not null,
  reason_codes text[] not null,
  administrative_actor_id text,
  actor_employee_id uuid,
  technical_principal_id text,
  endpoint_id text,
  credential_binding_id text,
  authorization_decision_id text,
  correlation_id text not null,
  idempotency_key_hash text not null,
  source_system text not null,
  source_operation_id text not null,
  safe_request_snapshot jsonb not null default '{}'::jsonb,
  safe_result_snapshot jsonb not null default '{}'::jsonb,
  contract_version text not null,
  source_versions jsonb not null,
  source_fingerprints jsonb not null,
  attempt_fingerprint text not null,
  source_contract_sha256 text not null,
  constraint fk_authorization_device_attempts_root foreign key (device_audit_id)
    references audit.authorization_devices(device_audit_id),
  constraint fk_authorization_device_attempts_decision foreign key (authorization_decision_id)
    references audit.authorization_decisions(decision_id),
  constraint uq_authorization_device_attempts_source unique (source_system, source_operation_id),
  constraint uq_authorization_device_attempts_idempotency unique (correlation_id, idempotency_key_hash),
  constraint ck_authorization_device_attempts_operation check (requested_operation ~ '^[A-Z][A-Z0-9_]{2,127}$'),
  constraint ck_authorization_device_attempts_expected_revision check (expected_revision is null or expected_revision >= 0),
  constraint ck_authorization_device_attempts_outcome check (outcome in (
    'DENIED','FAILED','CONFLICT','RETRYABLE_FAILURE','UNKNOWN_OUTCOME','NO_EFFECT'
  )),
  constraint ck_authorization_device_attempts_resolution check (
    (outcome = 'UNKNOWN_OUTCOME' and resolved_at is null)
    or (outcome <> 'UNKNOWN_OUTCOME' and resolved_at is not null and resolved_at >= requested_at)
  ),
  constraint ck_authorization_device_attempts_reasons check (
    pg_catalog.cardinality(reason_codes) > 0 and pg_catalog.array_position(reason_codes, null) is null
  ),
  constraint ck_authorization_device_attempts_snapshots check (
    pg_catalog.jsonb_typeof(safe_request_snapshot) = 'object'
    and pg_catalog.jsonb_typeof(safe_result_snapshot) = 'object'
    and pg_catalog.octet_length(safe_request_snapshot::text) <= 32768
    and pg_catalog.octet_length(safe_result_snapshot::text) <= 32768
  ),
  constraint ck_authorization_device_attempts_sources check (
    pg_catalog.jsonb_typeof(source_versions) = 'object'
    and pg_catalog.jsonb_typeof(source_fingerprints) = 'object'
  ),
  constraint ck_authorization_device_attempts_fingerprints check (
    idempotency_key_hash ~ '^sha256:[0-9a-f]{64}$'
    and attempt_fingerprint ~ '^sha256:[0-9a-f]{64}$'
  ),
  constraint ck_authorization_device_attempts_contract check (contract_version = '1.0.0'),
  constraint ck_authorization_device_attempts_source_contract check (
    source_contract_sha256 = '17823df588e49b5ac27dec4fa2b75e222d1797841818611629f306a9a34ee11c'
  )
);

create table audit.authorization_device_links (
  device_link_id uuid primary key,
  device_audit_id uuid not null,
  device_id uuid not null,
  source_type text not null,
  source_id text not null,
  target_type text not null,
  target_id text not null,
  relationship text not null,
  correlation_id text,
  causation_id text,
  recorded_at timestamptz not null default pg_catalog.statement_timestamp(),
  link_fingerprint text not null,
  source_contract_sha256 text not null,
  constraint fk_authorization_device_links_root foreign key (device_audit_id)
    references audit.authorization_devices(device_audit_id),
  constraint uq_authorization_device_links_identity unique (
    device_audit_id, source_type, source_id, target_type, target_id, relationship
  ),
  constraint ck_authorization_device_links_source_type check (source_type in (
    'DEVICE_EVENT','AUTHORIZATION_DECISION','PERMISSION_CHANGE','SIMULATION','FRESHNESS_EVENT',
    'ACTOR_SESSION','BUSINESS_RESOURCE','MIGRATION','EXTERNAL_PROVIDER_OPERATION','EVIDENCE_OBJECT','INCIDENT'
  )),
  constraint ck_authorization_device_links_target_type check (target_type in (
    'DEVICE_EVENT','AUTHORIZATION_DECISION','PERMISSION_CHANGE','SIMULATION','FRESHNESS_EVENT',
    'ACTOR_SESSION','BUSINESS_RESOURCE','MIGRATION','EXTERNAL_PROVIDER_OPERATION','EVIDENCE_OBJECT','INCIDENT'
  )),
  constraint ck_authorization_device_links_ids check (
    pg_catalog.length(pg_catalog.btrim(source_id)) > 0
    and pg_catalog.length(pg_catalog.btrim(target_id)) > 0
    and relationship ~ '^[A-Z][A-Z0-9_]{2,127}$'
  ),
  constraint ck_authorization_device_links_fingerprint check (link_fingerprint ~ '^sha256:[0-9a-f]{64}$'),
  constraint ck_authorization_device_links_source_contract check (
    source_contract_sha256 = '17823df588e49b5ac27dec4fa2b75e222d1797841818611629f306a9a34ee11c'
  )
);

create table audit.authorization_device_corrections (
  device_correction_id uuid primary key,
  device_audit_id uuid not null,
  device_id uuid not null,
  target_record_type text not null,
  target_record_id text not null,
  correction_kind text not null,
  reason text not null,
  authorized_by_actor_id text not null,
  authorization_decision_id text not null,
  before_reference jsonb not null,
  after_reference jsonb not null,
  correlation_id text not null,
  recorded_at timestamptz not null default pg_catalog.statement_timestamp(),
  correction_fingerprint text not null,
  source_contract_sha256 text not null,
  constraint fk_authorization_device_corrections_root foreign key (device_audit_id)
    references audit.authorization_devices(device_audit_id),
  constraint fk_authorization_device_corrections_decision foreign key (authorization_decision_id)
    references audit.authorization_decisions(decision_id),
  constraint uq_authorization_device_corrections_fingerprint unique (correction_fingerprint),
  constraint ck_authorization_device_corrections_target_type check (target_record_type in (
    'DEVICE_ROOT','DEVICE_REVISION','DEVICE_EVENT','DEVICE_ATTEMPT','DEVICE_LINK'
  )),
  constraint ck_authorization_device_corrections_kind check (correction_kind in (
    'METADATA_CLARIFICATION','EVIDENCE_LINK_ADDED','CLASSIFICATION_CLARIFIED','REFERENCE_CORRECTED'
  )),
  constraint ck_authorization_device_corrections_reason check (
    pg_catalog.length(pg_catalog.btrim(reason)) between 3 and 1024
  ),
  constraint ck_authorization_device_corrections_references check (
    pg_catalog.jsonb_typeof(before_reference) = 'object'
    and pg_catalog.jsonb_typeof(after_reference) = 'object'
    and pg_catalog.octet_length(before_reference::text) <= 16384
    and pg_catalog.octet_length(after_reference::text) <= 16384
  ),
  constraint ck_authorization_device_corrections_fingerprint check (correction_fingerprint ~ '^sha256:[0-9a-f]{64}$'),
  constraint ck_authorization_device_corrections_source_contract check (
    source_contract_sha256 = '17823df588e49b5ac27dec4fa2b75e222d1797841818611629f306a9a34ee11c'
  )
);

create index ix_authorization_device_revisions_configuration_fingerprint
  on audit.authorization_device_revisions (configuration_fingerprint);
create index ix_authorization_device_events_device_sequence
  on audit.authorization_device_events (device_id, event_sequence);
create index ix_authorization_device_events_device_time
  on audit.authorization_device_events (device_id, occurred_at desc, device_event_id desc);
create index ix_authorization_device_events_correlation
  on audit.authorization_device_events (correlation_id);
create index ix_authorization_device_events_admin_actor_time
  on audit.authorization_device_events (administrative_actor_id, occurred_at desc)
  where administrative_actor_id is not null;
create index ix_authorization_device_events_actor_time
  on audit.authorization_device_events (actor_employee_id, occurred_at desc)
  where actor_employee_id is not null;
create index ix_authorization_device_events_type_time
  on audit.authorization_device_events (event_type, occurred_at desc);
create index ix_authorization_device_events_source_operation
  on audit.authorization_device_events (source_operation_id);
create index ix_authorization_device_events_fingerprint
  on audit.authorization_device_events (event_fingerprint);
create index ix_authorization_device_attempts_device_time
  on audit.authorization_device_attempts (device_id, requested_at desc)
  where device_id is not null;
create index ix_authorization_device_attempts_correlation
  on audit.authorization_device_attempts (correlation_id);
create index ix_authorization_device_links_device_time
  on audit.authorization_device_links (device_id, recorded_at desc);
create index ix_authorization_device_corrections_device_time
  on audit.authorization_device_corrections (device_id, recorded_at desc);

create or replace function app_private.canonicalize_authorization_device(p_payload jsonb)
returns text
language sql
immutable
strict
set search_path = pg_catalog, app_private
as $auth_db_014_canonicalize$
  with normalized as (
    select case
      when pg_catalog.jsonb_typeof(p_payload) <> 'object' then p_payload
      else p_payload
        || case when p_payload ? 'application_set' then pg_catalog.jsonb_build_object(
          'application_set', coalesce((
            select pg_catalog.jsonb_agg(x.value order by x.value collate "C")
            from (select distinct value from pg_catalog.jsonb_array_elements_text(p_payload -> 'application_set')) x
          ), '[]'::jsonb)
        ) else '{}'::jsonb end
        || case when p_payload ? 'permission_package_set' then pg_catalog.jsonb_build_object(
          'permission_package_set', coalesce((
            select pg_catalog.jsonb_agg(x.value order by x.value collate "C")
            from (select distinct value from pg_catalog.jsonb_array_elements_text(p_payload -> 'permission_package_set')) x
          ), '[]'::jsonb)
        ) else '{}'::jsonb end
        || case
          when pg_catalog.jsonb_typeof(p_payload -> 'area_policy') = 'object'
               and (p_payload -> 'area_policy') ? 'allowed_area_ids'
          then pg_catalog.jsonb_build_object(
            'area_policy', (p_payload -> 'area_policy') || pg_catalog.jsonb_build_object(
              'allowed_area_ids', coalesce((
                select pg_catalog.jsonb_agg(x.value order by x.value collate "C")
                from (select distinct value from pg_catalog.jsonb_array_elements_text(p_payload #> '{area_policy,allowed_area_ids}')) x
              ), '[]'::jsonb)
            )
          ) else '{}'::jsonb
        end
    end as payload
  )
  select app_private.canonicalize_authorization_payload(payload)
  from normalized;
$auth_db_014_canonicalize$;

create or replace function app_private.fingerprint_authorization_device(p_payload jsonb)
returns text
language sql
immutable
strict
set search_path = pg_catalog, app_private, extensions
as $auth_db_014_fingerprint$
  select 'sha256:' || pg_catalog.encode(
    extensions.digest(app_private.canonicalize_authorization_device(p_payload), 'sha256'),
    'hex'
  );
$auth_db_014_fingerprint$;

create or replace function app_private.derive_authorization_device_state(p_device_id uuid)
returns text
language plpgsql
stable
strict
set search_path = pg_catalog, audit
as $auth_db_014_derive_state$
declare
  v_state text;
begin
  select r.lifecycle_state into v_state
  from audit.authorization_device_revisions r
  where r.device_id = p_device_id
  order by r.revision_number desc
  limit 1;
  if v_state is null then
    raise exception using errcode = 'P0002', message = 'AUTH_DB_014_DEVICE_NOT_FOUND';
  end if;
  return v_state;
end
$auth_db_014_derive_state$;

create or replace function app_private.reject_authorization_device_audit_mutation()
returns trigger
language plpgsql
volatile
set search_path = pg_catalog
as $auth_db_014_reject_mutation$
begin
  raise exception using errcode = '55000', message = 'AUTH_DB_014_APPEND_ONLY_MUTATION_FORBIDDEN';
end
$auth_db_014_reject_mutation$;

create or replace function app_private.append_authorization_device(p_device jsonb)
returns jsonb
language plpgsql
volatile
security definer
strict
set search_path = pg_catalog, audit, app_private, extensions
as $auth_db_014_append_root$
declare
  v_now timestamptz := pg_catalog.statement_timestamp();
  v_device_id uuid;
  v_device_code text;
  v_decision_id text;
  v_decision audit.authorization_decisions%rowtype;
  v_correlation text;
  v_causation text;
  v_idempotency text;
  v_key_hash text;
  v_request_fp text;
  v_source_registry text;
  v_source_identity_version text;
  v_source_operation_id text;
  v_sources jsonb;
  v_source_fps jsonb;
  v_configuration jsonb;
  v_configuration_fp text;
  v_device_audit_id uuid := extensions.gen_random_uuid();
  v_revision_id uuid := extensions.gen_random_uuid();
  v_event_id uuid := extensions.gen_random_uuid();
  v_event_sequence integer;
  v_event_fp text;
  v_operation_fp text;
  v_existing audit.authorization_devices%rowtype;
  v_existing_revision audit.authorization_device_revisions%rowtype;
  v_banned_pattern text := '"(jwt|refresh_token|access_token|service_role|api_key|pin|password|secret|credential_secret|private_key|passkey|passkey_material|otp|recovery_code|cookie|session_secret|authorization_header|authorization|email|phone|full_name|employee_name|login_email|legacy_auth_email|document|salary|diagnosis|disciplinary)"[[:space:]]*:';
begin
  if pg_catalog.jsonb_typeof(p_device) <> 'object'
     or pg_catalog.octet_length(p_device::text) > 65536
     or p_device::text ~* v_banned_pattern
     or exists (select 1 from pg_catalog.jsonb_object_keys(p_device) k where k not in (
       'device_id','device_code','authorization_decision_id','correlation_id','causation_id',
       'idempotency_key','source_registry','source_identity_version','source_operation_id',
       'source_versions','source_fingerprints','configuration'
     )) then
    raise exception using errcode = '22023', message = 'AUTH_DB_014_DEVICE_AUDIT_INVALID_INPUT';
  end if;

  begin
    v_device_id := (p_device ->> 'device_id')::uuid;
  exception when others then
    raise exception using errcode = '22023', message = 'AUTH_DB_014_DEVICE_ID_INVALID';
  end;
  v_device_code := nullif(p_device ->> 'device_code','');
  v_decision_id := nullif(p_device ->> 'authorization_decision_id','');
  v_correlation := nullif(p_device ->> 'correlation_id','');
  v_causation := nullif(p_device ->> 'causation_id','');
  v_idempotency := nullif(p_device ->> 'idempotency_key','');
  v_source_registry := nullif(p_device ->> 'source_registry','');
  v_source_identity_version := nullif(p_device ->> 'source_identity_version','');
  v_source_operation_id := nullif(p_device ->> 'source_operation_id','');
  v_sources := coalesce(p_device -> 'source_versions','{}'::jsonb);
  v_source_fps := coalesce(p_device -> 'source_fingerprints','{}'::jsonb);
  v_configuration := p_device -> 'configuration';

  if v_device_code is null or v_device_code ~ '[[:space:]]' or pg_catalog.length(v_device_code) > 128
     or v_decision_id is null or v_idempotency is null or pg_catalog.length(v_idempotency) > 160
     or v_source_registry is null or v_source_identity_version is null
     or pg_catalog.lower(v_source_identity_version) in ('latest','current','unknown')
     or v_source_operation_id is null or pg_catalog.length(v_source_operation_id) > 200
     or pg_catalog.jsonb_typeof(v_sources) <> 'object'
     or pg_catalog.jsonb_typeof(v_source_fps) <> 'object'
     or pg_catalog.jsonb_typeof(v_configuration) <> 'object' then
    raise exception using errcode = '22023', message = 'AUTH_DB_014_DEVICE_IDENTITY_INVALID';
  end if;

  if exists (
    select 1 from pg_catalog.jsonb_object_keys(v_sources) k
    where k not in (
      'device_registry','endpoint_registry','technical_principal_registry','credential_binding_registry',
      'device_template_catalog','site_catalog','area_catalog','application_catalog','permission_catalog',
      'device_permission_package_catalog','actor_policy_catalog','authorization_contract','freshness_contract'
    )
  ) or exists (
    select 1 from pg_catalog.jsonb_each_text(v_sources) x
    where pg_catalog.length(pg_catalog.btrim(x.value)) = 0 or pg_catalog.lower(x.value) in ('latest','current','unknown')
  ) or exists (
    select 1 from pg_catalog.jsonb_object_keys(v_source_fps) k where not (v_sources ? k)
  ) or exists (
    select 1 from pg_catalog.jsonb_each_text(v_source_fps) x where x.value !~ '^sha256:[0-9a-f]{64}$'
  ) then
    raise exception using errcode = '22023', message = 'AUTH_DB_014_SOURCE_IDENTITY_INVALID';
  end if;

  select d.* into v_decision
  from audit.authorization_decisions d
  where d.decision_id = v_decision_id;
  if not found or v_decision.outcome <> 'ALLOW' or v_decision.actor_id is null or v_decision.principal_id is null then
    raise exception using errcode = '42501', message = 'AUTH_DB_014_DEVICE_AUDIT_NOT_AUTHORIZED';
  end if;
  if v_decision.device_id is not null and v_decision.device_id is distinct from v_device_id::text then
    raise exception using errcode = '22023', message = 'AUTH_DB_014_DECISION_DEVICE_MISMATCH';
  end if;
  if v_correlation is not null and v_decision.correlation_id is not null and v_correlation is distinct from v_decision.correlation_id then
    raise exception using errcode = '22023', message = 'AUTH_DB_014_CORRELATION_DECISION_MISMATCH';
  end if;
  v_correlation := coalesce(v_correlation, v_decision.correlation_id);
  if v_correlation is null then
    raise exception using errcode = '22023', message = 'AUTH_DB_014_CORRELATION_REQUIRED';
  end if;

  v_key_hash := app_private.fingerprint_authorization_device(pg_catalog.to_jsonb(v_idempotency));
  v_request_fp := app_private.fingerprint_authorization_device(p_device - 'idempotency_key');

  v_configuration_fp := app_private.fingerprint_authorization_device(
    pg_catalog.jsonb_build_object(
      'contract_name','AuthorizationDeviceAudit','contract_version','1.0.0','device_id',v_device_id,
      'revision_number',1,'endpoint_id',v_configuration -> 'endpoint_id',
      'technical_principal_id',v_configuration -> 'technical_principal_id',
      'credential_binding_id',v_configuration -> 'credential_binding_id','asset_id',v_configuration -> 'asset_id',
      'station_instance_id',v_configuration -> 'station_instance_id','activation_state','DRAFT',
      'template_code',v_configuration -> 'template_code','template_version',v_configuration -> 'template_version',
      'site_binding',v_configuration -> 'site_binding','area_policy',v_configuration -> 'area_policy',
      'application_set',coalesce(v_configuration -> 'application_set','[]'::jsonb),
      'permission_package_set',coalesce(v_configuration -> 'permission_package_set','[]'::jsonb),
      'actor_policy',v_configuration -> 'actor_policy','installation_generation',v_configuration -> 'installation_generation',
      'credential_generation',v_configuration -> 'credential_generation','source_versions',v_sources
    )
  );
  select a.* into v_existing
  from audit.authorization_devices a
  where a.device_id = v_device_id or a.device_code = v_device_code or a.creation_idempotency_key_hash = v_key_hash
  order by case when a.device_id = v_device_id then 0 when a.device_code = v_device_code then 1 else 2 end
  limit 1;
  if found then
    if v_existing.device_id <> v_device_id or v_existing.device_code <> v_device_code then
      raise exception using errcode = '23505', message = 'AUTH_DB_014_DEVICE_AUDIT_IDENTITY_CONFLICT';
    end if;

    if v_existing.creation_idempotency_key_hash = v_key_hash
       and v_existing.creation_request_fingerprint = v_request_fp then
      return pg_catalog.jsonb_build_object(
        'device_audit_id', v_existing.device_audit_id,
        'device_id', v_existing.device_id,
        'first_event_id', v_existing.first_event_id,
        'state', app_private.derive_authorization_device_state(v_existing.device_id),
        'idempotent', true
      );
    end if;

    if v_existing.source_registry = 'public.shared_operational_devices' then
      select r.* into v_existing_revision
      from audit.authorization_device_revisions r
      where r.device_audit_id = v_existing.device_audit_id
        and r.transition_idempotency_key_hash = v_key_hash;
      if found then
        if v_existing_revision.transition_request_fingerprint <> v_request_fp then
          raise exception using errcode = '23505', message = 'AUTH_DB_014_IDEMPOTENCY_CONFLICT';
        end if;
        return pg_catalog.jsonb_build_object(
          'device_audit_id',v_existing.device_audit_id,'device_id',v_device_id,
          'device_revision_id',v_existing_revision.device_revision_id,'revision_number',v_existing_revision.revision_number,
          'state',v_existing_revision.lifecycle_state,'idempotent',true,'legacy_root_adopted',true
        );
      end if;

      if exists (
        select 1 from audit.authorization_device_revisions r
        where r.device_audit_id = v_existing.device_audit_id
      ) then
        raise exception using errcode = '23505', message = 'AUTH_DB_014_DEVICE_AUDIT_IDENTITY_CONFLICT';
      end if;

      v_device_audit_id := v_existing.device_audit_id;
      select coalesce(max(e.event_sequence),0) + 1 into v_event_sequence
      from audit.authorization_device_events e
      where e.device_audit_id = v_device_audit_id;

      v_operation_fp := app_private.fingerprint_authorization_device(pg_catalog.jsonb_build_object(
        'device_id',v_device_id,'event_type','DEVICE_REGISTERED','device_code',v_device_code,
        'configuration_fingerprint',v_configuration_fp,'authorization_decision_id',v_decision_id,
        'correlation_id',v_correlation,'source_operation_id',v_source_operation_id
      ));
      v_event_fp := app_private.fingerprint_authorization_device(pg_catalog.jsonb_build_object(
        'device_id',v_device_id,'event_sequence',v_event_sequence,'event_type','DEVICE_REGISTERED','event_family','IDENTITY',
        'event_outcome','SUCCEEDED','operation_fingerprint',v_operation_fp,'source_versions',v_sources,
        'source_fingerprints',v_source_fps
      ));

      insert into audit.authorization_device_revisions (
        device_revision_id,device_audit_id,device_id,revision_number,revision_kind,lifecycle_state,
        configuration_snapshot,configuration_fingerprint,source_versions,source_fingerprints,valid_from,
        recorded_by_actor_id,authorization_decision_id,correlation_id,causation_id,
        transition_idempotency_key_hash,transition_request_fingerprint,source_contract_sha256
      ) values (
        v_revision_id,v_device_audit_id,v_device_id,1,'INITIAL','DRAFT',v_configuration,v_configuration_fp,
        v_sources,v_source_fps,v_now,v_decision.actor_id,v_decision_id,v_correlation,v_causation,
        v_key_hash,v_request_fp,'17823df588e49b5ac27dec4fa2b75e222d1797841818611629f306a9a34ee11c'
      );

      insert into audit.authorization_device_events (
        device_event_id,device_audit_id,device_id,device_revision_id,event_sequence,event_type,event_family,
        event_outcome,occurred_at,administrative_actor_id,technical_principal_id,authorization_decision_id,
        correlation_id,causation_id,source_system,source_operation_id,idempotency_key_hash,operation_fingerprint,
        contract_version,source_versions,source_fingerprints,event_payload,event_fingerprint,source_contract_sha256
      ) values (
        v_event_id,v_device_audit_id,v_device_id,v_revision_id,v_event_sequence,'DEVICE_REGISTERED','IDENTITY','SUCCEEDED',v_now,
        v_decision.actor_id,v_decision.principal_id,v_decision_id,v_correlation,v_causation,v_source_registry,
        v_source_operation_id,v_key_hash,v_operation_fp,'1.0.0',v_sources,v_source_fps,
        pg_catalog.jsonb_build_object('device_code',v_device_code,'configuration_fingerprint',v_configuration_fp,'legacy_root_adopted',true),
        v_event_fp,'17823df588e49b5ac27dec4fa2b75e222d1797841818611629f306a9a34ee11c'
      );

      return pg_catalog.jsonb_build_object(
        'device_audit_id',v_device_audit_id,'device_id',v_device_id,'device_revision_id',v_revision_id,
        'device_event_id',v_event_id,'revision_number',1,'event_sequence',v_event_sequence,'state','DRAFT',
        'configuration_fingerprint',v_configuration_fp,'event_fingerprint',v_event_fp,'idempotent',false,
        'legacy_root_adopted',true
      );
    end if;

    raise exception using errcode = '23505', message = 'AUTH_DB_014_DEVICE_AUDIT_IDENTITY_CONFLICT';
  end if;

  v_event_sequence := 1;
  v_operation_fp := app_private.fingerprint_authorization_device(pg_catalog.jsonb_build_object(
    'device_id',v_device_id,'event_type','DEVICE_REGISTERED','device_code',v_device_code,
    'configuration_fingerprint',v_configuration_fp,'authorization_decision_id',v_decision_id,
    'correlation_id',v_correlation,'source_operation_id',v_source_operation_id
  ));
  v_event_fp := app_private.fingerprint_authorization_device(pg_catalog.jsonb_build_object(
    'device_id',v_device_id,'event_sequence',v_event_sequence,'event_type','DEVICE_REGISTERED','event_family','IDENTITY',
    'event_outcome','SUCCEEDED','operation_fingerprint',v_operation_fp,'source_versions',v_sources,
    'source_fingerprints',v_source_fps
  ));

  insert into audit.authorization_devices (
    device_audit_id,device_id,device_code,contract_family,contract_family_version,contract_name,
    contract_version,schema_version,first_observed_at,first_event_id,source_registry,
    source_identity_version,creation_idempotency_key_hash,creation_request_fingerprint,source_contract_sha256
  ) values (
    v_device_audit_id,v_device_id,v_device_code,'vento.authorization.device-audit','1.0.0',
    'AuthorizationDeviceAudit','1.0.0','1.0.0',v_now,v_event_id,v_source_registry,v_source_identity_version,
    v_key_hash,v_request_fp,'17823df588e49b5ac27dec4fa2b75e222d1797841818611629f306a9a34ee11c'
  );

  insert into audit.authorization_device_revisions (
    device_revision_id,device_audit_id,device_id,revision_number,revision_kind,lifecycle_state,
    configuration_snapshot,configuration_fingerprint,source_versions,source_fingerprints,valid_from,
    recorded_by_actor_id,authorization_decision_id,correlation_id,causation_id,
    transition_idempotency_key_hash,transition_request_fingerprint,source_contract_sha256
  ) values (
    v_revision_id,v_device_audit_id,v_device_id,1,'INITIAL','DRAFT',v_configuration,v_configuration_fp,
    v_sources,v_source_fps,v_now,v_decision.actor_id,v_decision_id,v_correlation,v_causation,
    v_key_hash,v_request_fp,'17823df588e49b5ac27dec4fa2b75e222d1797841818611629f306a9a34ee11c'
  );

  insert into audit.authorization_device_events (
    device_event_id,device_audit_id,device_id,device_revision_id,event_sequence,event_type,event_family,
    event_outcome,occurred_at,administrative_actor_id,technical_principal_id,authorization_decision_id,
    correlation_id,causation_id,source_system,source_operation_id,idempotency_key_hash,operation_fingerprint,
    contract_version,source_versions,source_fingerprints,event_payload,event_fingerprint,source_contract_sha256
  ) values (
    v_event_id,v_device_audit_id,v_device_id,v_revision_id,v_event_sequence,'DEVICE_REGISTERED','IDENTITY','SUCCEEDED',v_now,
    v_decision.actor_id,v_decision.principal_id,v_decision_id,v_correlation,v_causation,v_source_registry,
    v_source_operation_id,v_key_hash,v_operation_fp,'1.0.0',v_sources,v_source_fps,
    pg_catalog.jsonb_build_object('device_code',v_device_code,'configuration_fingerprint',v_configuration_fp),
    v_event_fp,'17823df588e49b5ac27dec4fa2b75e222d1797841818611629f306a9a34ee11c'
  );

  return pg_catalog.jsonb_build_object(
    'device_audit_id',v_device_audit_id,'device_id',v_device_id,'device_revision_id',v_revision_id,
    'device_event_id',v_event_id,'revision_number',1,'event_sequence',v_event_sequence,'state','DRAFT',
    'configuration_fingerprint',v_configuration_fp,'event_fingerprint',v_event_fp,'idempotent',false
  );
end
$auth_db_014_append_root$;

create or replace function app_private.append_authorization_device_revision(p_transition jsonb)
returns jsonb
language plpgsql
volatile
security definer
strict
set search_path = pg_catalog, audit, app_private, extensions
as $auth_db_014_append_revision$
declare
  v_now timestamptz := pg_catalog.statement_timestamp();
  v_device_id uuid;
  v_root audit.authorization_devices%rowtype;
  v_decision audit.authorization_decisions%rowtype;
  v_decision_id text;
  v_expected integer;
  v_expected_event_sequence integer;
  v_current integer;
  v_current_event_sequence integer;
  v_revision_kind text;
  v_state text;
  v_event_type text;
  v_event_family text;
  v_event_outcome text;
  v_reason text;
  v_correlation text;
  v_causation text;
  v_source_system text;
  v_source_operation_id text;
  v_idempotency text;
  v_key_hash text;
  v_request_fp text;
  v_sources jsonb;
  v_source_fps jsonb;
  v_configuration jsonb;
  v_configuration_fp text;
  v_previous_snapshot jsonb;
  v_revision_id uuid := extensions.gen_random_uuid();
  v_event_id uuid := extensions.gen_random_uuid();
  v_event_sequence integer;
  v_operation_fp text;
  v_event_fp text;
  v_existing audit.authorization_device_revisions%rowtype;
  v_banned_pattern text := '"(jwt|refresh_token|access_token|service_role|api_key|pin|password|secret|credential_secret|private_key|passkey|passkey_material|otp|recovery_code|cookie|session_secret|authorization_header|authorization|email|phone|full_name|employee_name|login_email|legacy_auth_email|document|salary|diagnosis|disciplinary)"[[:space:]]*:';
begin
  if pg_catalog.jsonb_typeof(p_transition) <> 'object'
     or pg_catalog.octet_length(p_transition::text) > 65536
     or p_transition::text ~* v_banned_pattern
     or exists (select 1 from pg_catalog.jsonb_object_keys(p_transition) k where k not in (
       'device_id','expected_revision','expected_event_sequence','revision_kind','lifecycle_state','event_type','event_outcome',
       'reason_code','authorization_decision_id','correlation_id','causation_id','source_system',
       'source_operation_id','idempotency_key','source_versions','source_fingerprints','configuration'
     )) then
    raise exception using errcode = '22023', message = 'AUTH_DB_014_DEVICE_AUDIT_INVALID_INPUT';
  end if;
  begin
    v_device_id := (p_transition ->> 'device_id')::uuid;
    v_expected := (p_transition ->> 'expected_revision')::integer;
    v_expected_event_sequence := (p_transition ->> 'expected_event_sequence')::integer;
  exception when others then
    raise exception using errcode = '22023', message = 'AUTH_DB_014_REVISION_IDENTITY_INVALID';
  end;
  v_revision_kind := nullif(p_transition ->> 'revision_kind','');
  v_state := nullif(p_transition ->> 'lifecycle_state','');
  v_event_type := nullif(p_transition ->> 'event_type','');
  v_event_outcome := coalesce(nullif(p_transition ->> 'event_outcome',''),'SUCCEEDED');
  v_reason := nullif(p_transition ->> 'reason_code','');
  v_decision_id := nullif(p_transition ->> 'authorization_decision_id','');
  v_correlation := nullif(p_transition ->> 'correlation_id','');
  v_causation := nullif(p_transition ->> 'causation_id','');
  v_source_system := nullif(p_transition ->> 'source_system','');
  v_source_operation_id := nullif(p_transition ->> 'source_operation_id','');
  v_idempotency := nullif(p_transition ->> 'idempotency_key','');
  v_sources := coalesce(p_transition -> 'source_versions','{}'::jsonb);
  v_source_fps := coalesce(p_transition -> 'source_fingerprints','{}'::jsonb);
  v_configuration := p_transition -> 'configuration';

  if v_expected < 1 or v_expected_event_sequence < 1
     or v_revision_kind not in (
       'ENROLLMENT','ACTIVATION','SUSPENSION','RESUMPTION','CREDENTIAL','ENDPOINT','HARDWARE',
       'TERRITORY','APPLICATIONS','PERMISSIONS','TEMPLATE','ACTOR_POLICY','REVOCATION','RETIREMENT','CONFLICT','RECOVERY'
     )
     or v_state not in ('DRAFT','ENROLLING','ACTIVE','SUSPENDED','REVOKED','RETIRED','CONFLICTED','RECOVERY_REQUIRED')
     or v_event_type is null or v_event_type = 'LEGACY_RECORD_IMPORTED'
     or v_event_outcome not in ('SUCCEEDED','NO_OP_CONFIRMED')
     or v_reason !~ '^[A-Z][A-Z0-9_]{2,127}$'
     or v_decision_id is null
     or v_source_system is null or v_source_operation_id is null
     or v_idempotency is null or pg_catalog.length(v_idempotency) > 160
     or pg_catalog.jsonb_typeof(v_sources) <> 'object' or pg_catalog.jsonb_typeof(v_source_fps) <> 'object'
     or pg_catalog.jsonb_typeof(v_configuration) <> 'object' then
    raise exception using errcode = '22023', message = 'AUTH_DB_014_REVISION_IDENTITY_INVALID';
  end if;

  v_event_family := case
    when v_event_type in ('ENROLLMENT_STARTED','ENROLLMENT_SUCCEEDED','ENROLLMENT_FAILED') then 'ENROLLMENT'
    when v_event_type = 'DEVICE_ACTIVATED' then 'ACTIVATION'
    when v_event_type in ('CREDENTIAL_ROTATION_STARTED','CREDENTIAL_ROTATED','CREDENTIAL_ROTATION_FAILED','CREDENTIAL_REVOKED') then 'CREDENTIAL'
    when v_event_type in ('ENDPOINT_REINSTALLED','ENDPOINT_REVOKED') then 'ENDPOINT'
    when v_event_type = 'HARDWARE_REPLACED' then 'HARDWARE'
    when v_event_type in ('SITE_BINDING_CHANGED','AREA_POLICY_CHANGED') then 'TERRITORY'
    when v_event_type in ('APPLICATION_SET_CHANGED','DEFAULT_APPLICATION_CHANGED') then 'APPLICATIONS'
    when v_event_type = 'PERMISSION_PACKAGE_CHANGED' then 'PERMISSIONS'
    when v_event_type = 'TEMPLATE_BINDING_CHANGED' then 'TEMPLATE'
    when v_event_type in ('ACTOR_SESSION_STARTED','ACTOR_SESSION_ENDED','ACTOR_SESSION_EXPIRED','ACTOR_SESSION_REVOKED','ACTOR_CHANGED') then 'ACTOR_SESSION'
    when v_event_type in ('DEVICE_BECAME_UNHEALTHY','DEVICE_RECOVERED_HEALTH') then 'HEALTH_STATE'
    when v_event_type in ('DEVICE_SUSPENDED','DEVICE_RESUMED') then 'SUSPENSION'
    when v_event_type = 'DEVICE_REVOKED' then 'REVOCATION'
    when v_event_type in ('RETIREMENT_STARTED','DEVICE_RETIRED') then 'RETIREMENT'
    when v_event_type in ('IDENTITY_CONFLICT_DETECTED','IDENTITY_CONFLICT_RESOLVED') then 'CONFLICT'
    when v_event_type in ('RECOVERY_STARTED','RECOVERY_COMPLETED') then 'RECOVERY'
    else null
  end;
  if v_event_family is null then
    raise exception using errcode = '22023', message = 'AUTH_DB_014_EVENT_TYPE_UNKNOWN';
  end if;
  if (v_event_type = 'DEVICE_ACTIVATED' and v_state <> 'ACTIVE')
     or (v_event_type = 'DEVICE_SUSPENDED' and v_state <> 'SUSPENDED')
     or (v_event_type = 'DEVICE_RESUMED' and v_state <> 'ACTIVE')
     or (v_event_type = 'DEVICE_REVOKED' and v_state <> 'REVOKED')
     or (v_event_type = 'DEVICE_RETIRED' and v_state <> 'RETIRED')
     or (v_event_type = 'IDENTITY_CONFLICT_DETECTED' and v_state <> 'CONFLICTED')
     or (v_event_type = 'RECOVERY_STARTED' and v_state <> 'RECOVERY_REQUIRED') then
    raise exception using errcode = '22023', message = 'AUTH_DB_014_EVENT_STATE_MISMATCH';
  end if;

  if exists (select 1 from pg_catalog.jsonb_object_keys(v_sources) k where k not in (
    'device_registry','endpoint_registry','technical_principal_registry','credential_binding_registry',
    'device_template_catalog','site_catalog','area_catalog','application_catalog','permission_catalog',
    'device_permission_package_catalog','actor_policy_catalog','authorization_contract','freshness_contract'
  )) or exists (select 1 from pg_catalog.jsonb_each_text(v_sources) x where pg_catalog.length(pg_catalog.btrim(x.value)) = 0 or pg_catalog.lower(x.value) in ('latest','current','unknown'))
     or exists (select 1 from pg_catalog.jsonb_object_keys(v_source_fps) k where not (v_sources ? k))
     or exists (select 1 from pg_catalog.jsonb_each_text(v_source_fps) x where x.value !~ '^sha256:[0-9a-f]{64}$') then
    raise exception using errcode = '22023', message = 'AUTH_DB_014_SOURCE_IDENTITY_INVALID';
  end if;

  select a.* into v_root from audit.authorization_devices a where a.device_id = v_device_id for update;
  if not found then raise exception using errcode = 'P0002', message = 'AUTH_DB_014_DEVICE_NOT_FOUND'; end if;

  v_key_hash := app_private.fingerprint_authorization_device(pg_catalog.to_jsonb(v_idempotency));
  v_request_fp := app_private.fingerprint_authorization_device(p_transition - 'idempotency_key');
  select r.* into v_existing from audit.authorization_device_revisions r
  where r.device_audit_id = v_root.device_audit_id and r.transition_idempotency_key_hash = v_key_hash;
  if found then
    if v_existing.transition_request_fingerprint <> v_request_fp then
      raise exception using errcode = '23505', message = 'AUTH_DB_014_IDEMPOTENCY_CONFLICT';
    end if;
    return pg_catalog.jsonb_build_object(
      'device_revision_id',v_existing.device_revision_id,'device_id',v_device_id,
      'revision_number',v_existing.revision_number,'state',v_existing.lifecycle_state,'idempotent',true
    );
  end if;

  select max(r.revision_number) into v_current from audit.authorization_device_revisions r where r.device_audit_id = v_root.device_audit_id;
  select coalesce(max(e.event_sequence),0) into v_current_event_sequence from audit.authorization_device_events e where e.device_audit_id = v_root.device_audit_id;
  if v_current <> v_expected then
    raise exception using errcode = '40001', message = 'AUTH_DB_014_DEVICE_AUDIT_STALE_REVISION';
  end if;
  if v_current_event_sequence <> v_expected_event_sequence then
    raise exception using errcode = '40001', message = 'AUTH_DB_014_EVENT_SEQUENCE_CONFLICT';
  end if;
  if app_private.derive_authorization_device_state(v_device_id) = 'RETIRED' then
    raise exception using errcode = '55000', message = 'AUTH_DB_014_RETIRED_DEVICE_TRANSITION_FORBIDDEN';
  end if;

  select d.* into v_decision from audit.authorization_decisions d where d.decision_id = v_decision_id;
  if not found or v_decision.outcome <> 'ALLOW' or v_decision.actor_id is null or v_decision.principal_id is null then
    raise exception using errcode = '42501', message = 'AUTH_DB_014_DEVICE_AUDIT_NOT_AUTHORIZED';
  end if;
  if v_decision.device_id is not null and v_decision.device_id is distinct from v_device_id::text then
    raise exception using errcode = '22023', message = 'AUTH_DB_014_DECISION_DEVICE_MISMATCH';
  end if;
  if v_correlation is not null and v_decision.correlation_id is not null and v_correlation is distinct from v_decision.correlation_id then
    raise exception using errcode = '22023', message = 'AUTH_DB_014_CORRELATION_DECISION_MISMATCH';
  end if;
  v_correlation := coalesce(v_correlation,v_decision.correlation_id);
  if v_correlation is null then raise exception using errcode = '22023', message = 'AUTH_DB_014_CORRELATION_REQUIRED'; end if;

  select r.configuration_snapshot into v_previous_snapshot
  from audit.authorization_device_revisions r
  where r.device_audit_id = v_root.device_audit_id and r.revision_number = v_current;
  v_configuration_fp := app_private.fingerprint_authorization_device(
    pg_catalog.jsonb_build_object(
      'contract_name','AuthorizationDeviceAudit','contract_version','1.0.0','device_id',v_device_id,
      'revision_number',v_current + 1,'endpoint_id',v_configuration -> 'endpoint_id',
      'technical_principal_id',v_configuration -> 'technical_principal_id','credential_binding_id',v_configuration -> 'credential_binding_id',
      'asset_id',v_configuration -> 'asset_id','station_instance_id',v_configuration -> 'station_instance_id',
      'activation_state',v_state,'template_code',v_configuration -> 'template_code','template_version',v_configuration -> 'template_version',
      'site_binding',v_configuration -> 'site_binding','area_policy',v_configuration -> 'area_policy',
      'application_set',coalesce(v_configuration -> 'application_set','[]'::jsonb),
      'permission_package_set',coalesce(v_configuration -> 'permission_package_set','[]'::jsonb),
      'actor_policy',v_configuration -> 'actor_policy','installation_generation',v_configuration -> 'installation_generation',
      'credential_generation',v_configuration -> 'credential_generation','source_versions',v_sources
    )
  );
  if app_private.canonicalize_authorization_device(v_configuration)
       = app_private.canonicalize_authorization_device(v_previous_snapshot) then
    raise exception using errcode = '22023', message = 'AUTH_DB_014_NO_MATERIAL_REVISION_CHANGE';
  end if;

  select coalesce(max(e.event_sequence),0) + 1 into v_event_sequence
  from audit.authorization_device_events e where e.device_audit_id = v_root.device_audit_id;
  v_operation_fp := app_private.fingerprint_authorization_device(pg_catalog.jsonb_build_object(
    'device_id',v_device_id,'expected_revision',v_expected,'expected_event_sequence',v_expected_event_sequence,'revision_number',v_current + 1,
    'revision_kind',v_revision_kind,'lifecycle_state',v_state,'event_type',v_event_type,
    'event_outcome',v_event_outcome,'configuration_fingerprint',v_configuration_fp,
    'authorization_decision_id',v_decision_id,'reason_code',v_reason,'correlation_id',v_correlation,
    'source_system',v_source_system,'source_operation_id',v_source_operation_id
  ));
  v_event_fp := app_private.fingerprint_authorization_device(pg_catalog.jsonb_build_object(
    'device_id',v_device_id,'event_sequence',v_event_sequence,'event_type',v_event_type,
    'event_family',v_event_family,'event_outcome',v_event_outcome,'operation_fingerprint',v_operation_fp,
    'source_versions',v_sources,'source_fingerprints',v_source_fps
  ));

  insert into audit.authorization_device_revisions (
    device_revision_id,device_audit_id,device_id,revision_number,revision_kind,lifecycle_state,
    configuration_snapshot,configuration_fingerprint,source_versions,source_fingerprints,valid_from,
    recorded_by_actor_id,authorization_decision_id,correlation_id,causation_id,
    transition_idempotency_key_hash,transition_request_fingerprint,source_contract_sha256
  ) values (
    v_revision_id,v_root.device_audit_id,v_device_id,v_current + 1,v_revision_kind,v_state,v_configuration,
    v_configuration_fp,v_sources,v_source_fps,v_now,v_decision.actor_id,v_decision_id,v_correlation,v_causation,
    v_key_hash,v_request_fp,'17823df588e49b5ac27dec4fa2b75e222d1797841818611629f306a9a34ee11c'
  );

  insert into audit.authorization_device_events (
    device_event_id,device_audit_id,device_id,device_revision_id,event_sequence,event_type,event_family,
    event_outcome,occurred_at,administrative_actor_id,technical_principal_id,authorization_decision_id,
    correlation_id,causation_id,source_system,source_operation_id,idempotency_key_hash,operation_fingerprint,
    contract_version,source_versions,source_fingerprints,event_payload,event_fingerprint,source_contract_sha256
  ) values (
    v_event_id,v_root.device_audit_id,v_device_id,v_revision_id,v_event_sequence,v_event_type,v_event_family,
    v_event_outcome,v_now,v_decision.actor_id,v_decision.principal_id,v_decision_id,v_correlation,v_causation,
    v_source_system,v_source_operation_id,v_key_hash,v_operation_fp,'1.0.0',v_sources,v_source_fps,
    pg_catalog.jsonb_build_object('reason_code',v_reason,'configuration_fingerprint',v_configuration_fp),
    v_event_fp,'17823df588e49b5ac27dec4fa2b75e222d1797841818611629f306a9a34ee11c'
  );

  return pg_catalog.jsonb_build_object(
    'device_revision_id',v_revision_id,'device_event_id',v_event_id,'device_id',v_device_id,
    'revision_number',v_current + 1,'event_sequence',v_event_sequence,'state',v_state,
    'configuration_fingerprint',v_configuration_fp,'event_fingerprint',v_event_fp,'idempotent',false
  );
end
$auth_db_014_append_revision$;

create or replace function app_private.append_authorization_device_event(p_event jsonb)
returns jsonb
language plpgsql
volatile
security definer
strict
set search_path = pg_catalog, audit, app_private, extensions
as $auth_db_014_append_event$
declare
  v_now timestamptz := pg_catalog.statement_timestamp();
  v_device_id uuid;
  v_root audit.authorization_devices%rowtype;
  v_revision audit.authorization_device_revisions%rowtype;
  v_decision audit.authorization_decisions%rowtype;
  v_expected integer;
  v_expected_event_sequence integer;
  v_current_event_sequence integer;
  v_event_type text;
  v_event_family text;
  v_event_outcome text;
  v_decision_id text;
  v_reason text;
  v_correlation text;
  v_causation text;
  v_source_system text;
  v_source_operation_id text;
  v_idempotency text;
  v_key_hash text;
  v_request_fp text;
  v_sources jsonb;
  v_source_fps jsonb;
  v_payload jsonb;
  v_event_id uuid := extensions.gen_random_uuid();
  v_event_sequence integer;
  v_operation_fp text;
  v_event_fp text;
  v_existing audit.authorization_device_events%rowtype;
  v_banned_pattern text := '"(jwt|refresh_token|access_token|service_role|api_key|pin|password|secret|credential_secret|private_key|passkey|passkey_material|otp|recovery_code|cookie|session_secret|authorization_header|authorization|email|phone|full_name|employee_name|login_email|legacy_auth_email|document|salary|diagnosis|disciplinary)"[[:space:]]*:';
begin
  if pg_catalog.jsonb_typeof(p_event) <> 'object'
     or pg_catalog.octet_length(p_event::text) > 65536
     or p_event::text ~* v_banned_pattern
     or exists (select 1 from pg_catalog.jsonb_object_keys(p_event) k where k not in (
       'device_id','expected_revision','expected_event_sequence','event_type','event_outcome','reason_code','authorization_decision_id',
       'correlation_id','causation_id','source_system','source_operation_id','idempotency_key',
       'source_versions','source_fingerprints','event_payload','actor_employee_id','actor_session_id',
       'technical_principal_id','endpoint_id','credential_binding_id','occurred_at'
     )) then
    raise exception using errcode = '22023', message = 'AUTH_DB_014_DEVICE_AUDIT_INVALID_INPUT';
  end if;
  begin
    v_device_id := (p_event ->> 'device_id')::uuid;
    v_expected := (p_event ->> 'expected_revision')::integer;
    v_expected_event_sequence := (p_event ->> 'expected_event_sequence')::integer;
  exception when others then
    raise exception using errcode = '22023', message = 'AUTH_DB_014_EVENT_IDENTITY_INVALID';
  end;
  v_event_type := nullif(p_event ->> 'event_type','');
  v_event_outcome := coalesce(nullif(p_event ->> 'event_outcome',''),'SUCCEEDED');
  v_decision_id := nullif(p_event ->> 'authorization_decision_id','');
  v_reason := nullif(p_event ->> 'reason_code','');
  v_correlation := nullif(p_event ->> 'correlation_id','');
  v_causation := nullif(p_event ->> 'causation_id','');
  v_source_system := nullif(p_event ->> 'source_system','');
  v_source_operation_id := nullif(p_event ->> 'source_operation_id','');
  v_idempotency := nullif(p_event ->> 'idempotency_key','');
  v_sources := coalesce(p_event -> 'source_versions','{}'::jsonb);
  v_source_fps := coalesce(p_event -> 'source_fingerprints','{}'::jsonb);
  v_payload := coalesce(p_event -> 'event_payload','{}'::jsonb);

  if v_expected < 1 or v_expected_event_sequence < 1 or v_event_type is null or v_event_type in ('DEVICE_REGISTERED','LEGACY_RECORD_IMPORTED')
     or v_event_outcome not in ('SUCCEEDED','NO_OP_CONFIRMED')
     or v_reason !~ '^[A-Z][A-Z0-9_]{2,127}$'
     or v_source_system is null or v_source_operation_id is null or v_idempotency is null
     or pg_catalog.jsonb_typeof(v_sources) <> 'object' or pg_catalog.jsonb_typeof(v_source_fps) <> 'object'
     or pg_catalog.jsonb_typeof(v_payload) <> 'object' then
    raise exception using errcode = '22023', message = 'AUTH_DB_014_EVENT_IDENTITY_INVALID';
  end if;
  v_event_family := case
    when v_event_type in ('ENROLLMENT_STARTED','ENROLLMENT_SUCCEEDED','ENROLLMENT_FAILED') then 'ENROLLMENT'
    when v_event_type = 'DEVICE_ACTIVATED' then 'ACTIVATION'
    when v_event_type in ('CREDENTIAL_ROTATION_STARTED','CREDENTIAL_ROTATED','CREDENTIAL_ROTATION_FAILED','CREDENTIAL_REVOKED') then 'CREDENTIAL'
    when v_event_type in ('ENDPOINT_REINSTALLED','ENDPOINT_REVOKED') then 'ENDPOINT'
    when v_event_type = 'HARDWARE_REPLACED' then 'HARDWARE'
    when v_event_type in ('SITE_BINDING_CHANGED','AREA_POLICY_CHANGED') then 'TERRITORY'
    when v_event_type in ('APPLICATION_SET_CHANGED','DEFAULT_APPLICATION_CHANGED') then 'APPLICATIONS'
    when v_event_type = 'PERMISSION_PACKAGE_CHANGED' then 'PERMISSIONS'
    when v_event_type = 'TEMPLATE_BINDING_CHANGED' then 'TEMPLATE'
    when v_event_type in ('ACTOR_SESSION_STARTED','ACTOR_SESSION_ENDED','ACTOR_SESSION_EXPIRED','ACTOR_SESSION_REVOKED','ACTOR_CHANGED') then 'ACTOR_SESSION'
    when v_event_type in ('DEVICE_BECAME_UNHEALTHY','DEVICE_RECOVERED_HEALTH') then 'HEALTH_STATE'
    when v_event_type in ('DEVICE_SUSPENDED','DEVICE_RESUMED') then 'SUSPENSION'
    when v_event_type = 'DEVICE_REVOKED' then 'REVOCATION'
    when v_event_type in ('RETIREMENT_STARTED','DEVICE_RETIRED') then 'RETIREMENT'
    when v_event_type in ('IDENTITY_CONFLICT_DETECTED','IDENTITY_CONFLICT_RESOLVED') then 'CONFLICT'
    when v_event_type in ('RECOVERY_STARTED','RECOVERY_COMPLETED') then 'RECOVERY'
    else null
  end;
  if v_event_family is null then raise exception using errcode = '22023', message = 'AUTH_DB_014_EVENT_TYPE_UNKNOWN'; end if;

  select a.* into v_root from audit.authorization_devices a where a.device_id = v_device_id for update;
  if not found then raise exception using errcode = 'P0002', message = 'AUTH_DB_014_DEVICE_NOT_FOUND'; end if;
  select r.* into v_revision from audit.authorization_device_revisions r
  where r.device_audit_id = v_root.device_audit_id order by r.revision_number desc limit 1;

  v_key_hash := app_private.fingerprint_authorization_device(pg_catalog.to_jsonb(v_idempotency));
  v_request_fp := app_private.fingerprint_authorization_device(p_event - 'idempotency_key');
  select e.* into v_existing from audit.authorization_device_events e
  where e.device_audit_id = v_root.device_audit_id and e.idempotency_key_hash = v_key_hash;
  if found then
    if v_existing.operation_fingerprint <> v_request_fp then
      raise exception using errcode = '23505', message = 'AUTH_DB_014_IDEMPOTENCY_CONFLICT';
    end if;
    return pg_catalog.jsonb_build_object('device_event_id',v_existing.device_event_id,'event_sequence',v_existing.event_sequence,'idempotent',true);
  end if;

  if v_revision.revision_number <> v_expected then
    raise exception using errcode = '40001', message = 'AUTH_DB_014_DEVICE_AUDIT_STALE_REVISION';
  end if;
  select coalesce(max(e.event_sequence),0) into v_current_event_sequence
  from audit.authorization_device_events e where e.device_audit_id = v_root.device_audit_id;
  if v_current_event_sequence <> v_expected_event_sequence then
    raise exception using errcode = '40001', message = 'AUTH_DB_014_EVENT_SEQUENCE_CONFLICT';
  end if;
  if v_revision.lifecycle_state = 'RETIRED' then
    raise exception using errcode = '55000', message = 'AUTH_DB_014_RETIRED_DEVICE_EVENT_FORBIDDEN';
  end if;

  if v_decision_id is not null then
    select d.* into v_decision from audit.authorization_decisions d where d.decision_id = v_decision_id;
    if not found or v_decision.outcome <> 'ALLOW' or v_decision.actor_id is null then
      raise exception using errcode = '42501', message = 'AUTH_DB_014_DEVICE_AUDIT_NOT_AUTHORIZED';
    end if;
    if v_decision.device_id is not null and v_decision.device_id is distinct from v_device_id::text then
      raise exception using errcode = '22023', message = 'AUTH_DB_014_DECISION_DEVICE_MISMATCH';
    end if;
    if v_correlation is not null and v_decision.correlation_id is not null and v_correlation is distinct from v_decision.correlation_id then
      raise exception using errcode = '22023', message = 'AUTH_DB_014_CORRELATION_DECISION_MISMATCH';
    end if;
    v_correlation := coalesce(v_correlation,v_decision.correlation_id);
  elsif v_source_system not in ('MIGRATION','RECOVERY','SYSTEM_RECONCILIATION','HEALTH_MONITOR') then
    raise exception using errcode = '42501', message = 'AUTH_DB_014_EVENT_DECISION_REQUIRED';
  end if;
  if v_correlation is null then raise exception using errcode = '22023', message = 'AUTH_DB_014_CORRELATION_REQUIRED'; end if;

  if exists (select 1 from pg_catalog.jsonb_object_keys(v_sources) k where k not in (
    'device_registry','endpoint_registry','technical_principal_registry','credential_binding_registry',
    'device_template_catalog','site_catalog','area_catalog','application_catalog','permission_catalog',
    'device_permission_package_catalog','actor_policy_catalog','authorization_contract','freshness_contract'
  )) or exists (select 1 from pg_catalog.jsonb_each_text(v_sources) x where pg_catalog.length(pg_catalog.btrim(x.value)) = 0 or pg_catalog.lower(x.value) in ('latest','current','unknown'))
     or exists (select 1 from pg_catalog.jsonb_object_keys(v_source_fps) k where not (v_sources ? k))
     or exists (select 1 from pg_catalog.jsonb_each_text(v_source_fps) x where x.value !~ '^sha256:[0-9a-f]{64}$') then
    raise exception using errcode = '22023', message = 'AUTH_DB_014_SOURCE_IDENTITY_INVALID';
  end if;

  v_event_sequence := v_current_event_sequence + 1;
  v_operation_fp := v_request_fp;
  v_event_fp := app_private.fingerprint_authorization_device(pg_catalog.jsonb_build_object(
    'device_id',v_device_id,'event_sequence',v_event_sequence,'event_type',v_event_type,'event_family',v_event_family,
    'event_outcome',v_event_outcome,'operation_fingerprint',v_operation_fp,'source_versions',v_sources,'source_fingerprints',v_source_fps
  ));

  insert into audit.authorization_device_events (
    device_event_id,device_audit_id,device_id,device_revision_id,event_sequence,event_type,event_family,event_outcome,
    occurred_at,administrative_actor_id,actor_employee_id,actor_session_id,technical_principal_id,endpoint_id,
    credential_binding_id,authorization_decision_id,correlation_id,causation_id,source_system,source_operation_id,
    idempotency_key_hash,operation_fingerprint,contract_version,source_versions,source_fingerprints,event_payload,
    event_fingerprint,source_contract_sha256
  ) values (
    v_event_id,v_root.device_audit_id,v_device_id,v_revision.device_revision_id,v_event_sequence,v_event_type,v_event_family,
    v_event_outcome,coalesce((p_event ->> 'occurred_at')::timestamptz,v_now),
    case when v_decision_id is null then null else v_decision.actor_id end,
    nullif(p_event ->> 'actor_employee_id','')::uuid,nullif(p_event ->> 'actor_session_id','')::uuid,
    coalesce(nullif(p_event ->> 'technical_principal_id',''),case when v_decision_id is null then null else v_decision.principal_id end),
    nullif(p_event ->> 'endpoint_id',''),nullif(p_event ->> 'credential_binding_id',''),v_decision_id,
    v_correlation,v_causation,v_source_system,v_source_operation_id,v_key_hash,v_operation_fp,'1.0.0',v_sources,v_source_fps,
    v_payload || pg_catalog.jsonb_build_object('reason_code',v_reason),v_event_fp,
    '17823df588e49b5ac27dec4fa2b75e222d1797841818611629f306a9a34ee11c'
  );
  return pg_catalog.jsonb_build_object('device_event_id',v_event_id,'event_sequence',v_event_sequence,'event_type',v_event_type,'idempotent',false);
exception
  when invalid_text_representation or datetime_field_overflow then
    raise exception using errcode = '22023', message = 'AUTH_DB_014_EVENT_IDENTITY_INVALID';
end
$auth_db_014_append_event$;

create or replace function app_private.append_authorization_device_attempt(p_attempt jsonb)
returns jsonb
language plpgsql
volatile
security definer
strict
set search_path = pg_catalog, audit, app_private, extensions
as $auth_db_014_append_attempt$
declare
  v_now timestamptz := pg_catalog.statement_timestamp();
  v_device_id uuid;
  v_root audit.authorization_devices%rowtype;
  v_attempt_id uuid := extensions.gen_random_uuid();
  v_operation text;
  v_expected integer;
  v_outcome text;
  v_reason_codes text[];
  v_decision_id text;
  v_decision audit.authorization_decisions%rowtype;
  v_correlation text;
  v_idempotency text;
  v_key_hash text;
  v_source_system text;
  v_source_operation_id text;
  v_sources jsonb;
  v_source_fps jsonb;
  v_request jsonb;
  v_result jsonb;
  v_attempt_fp text;
  v_existing audit.authorization_device_attempts%rowtype;
  v_banned_pattern text := '"(jwt|refresh_token|access_token|service_role|api_key|pin|password|secret|credential_secret|private_key|passkey|passkey_material|otp|recovery_code|cookie|session_secret|authorization_header|authorization|email|phone|full_name|employee_name|login_email|legacy_auth_email|document|salary|diagnosis|disciplinary)"[[:space:]]*:';
begin
  if pg_catalog.jsonb_typeof(p_attempt) <> 'object'
     or pg_catalog.octet_length(p_attempt::text) > 65536
     or p_attempt::text ~* v_banned_pattern
     or exists (select 1 from pg_catalog.jsonb_object_keys(p_attempt) k where k not in (
       'device_id','requested_operation','expected_revision','outcome','reason_codes','authorization_decision_id',
       'correlation_id','idempotency_key','source_system','source_operation_id','source_versions','source_fingerprints',
       'safe_request_snapshot','safe_result_snapshot','actor_employee_id','technical_principal_id','endpoint_id',
       'credential_binding_id','requested_at','resolved_at'
     )) then
    raise exception using errcode = '22023', message = 'AUTH_DB_014_DEVICE_AUDIT_INVALID_INPUT';
  end if;

  if nullif(p_attempt ->> 'device_id','') is not null then
    begin v_device_id := (p_attempt ->> 'device_id')::uuid;
    exception when others then raise exception using errcode = '22023', message = 'AUTH_DB_014_ATTEMPT_DEVICE_ID_INVALID'; end;
  end if;
  if nullif(p_attempt ->> 'expected_revision','') is not null then
    begin v_expected := (p_attempt ->> 'expected_revision')::integer;
    exception when others then raise exception using errcode = '22023', message = 'AUTH_DB_014_ATTEMPT_REVISION_INVALID'; end;
  end if;
  v_operation := nullif(p_attempt ->> 'requested_operation','');
  v_outcome := nullif(p_attempt ->> 'outcome','');
  v_decision_id := nullif(p_attempt ->> 'authorization_decision_id','');
  v_correlation := nullif(p_attempt ->> 'correlation_id','');
  v_idempotency := nullif(p_attempt ->> 'idempotency_key','');
  v_source_system := nullif(p_attempt ->> 'source_system','');
  v_source_operation_id := nullif(p_attempt ->> 'source_operation_id','');
  v_sources := coalesce(p_attempt -> 'source_versions','{}'::jsonb);
  v_source_fps := coalesce(p_attempt -> 'source_fingerprints','{}'::jsonb);
  v_request := coalesce(p_attempt -> 'safe_request_snapshot','{}'::jsonb);
  v_result := coalesce(p_attempt -> 'safe_result_snapshot','{}'::jsonb);
  select coalesce(pg_catalog.array_agg(x.value order by x.value collate "C"),'{}'::text[]) into v_reason_codes
  from (select distinct value from pg_catalog.jsonb_array_elements_text(coalesce(p_attempt -> 'reason_codes','[]'::jsonb))) x;

  if v_operation !~ '^[A-Z][A-Z0-9_]{2,127}$'
     or v_outcome not in ('DENIED','FAILED','CONFLICT','RETRYABLE_FAILURE','UNKNOWN_OUTCOME','NO_EFFECT')
     or pg_catalog.cardinality(v_reason_codes) < 1
     or v_correlation is null or v_idempotency is null or v_source_system is null or v_source_operation_id is null
     or pg_catalog.jsonb_typeof(v_sources) <> 'object' or pg_catalog.jsonb_typeof(v_source_fps) <> 'object'
     or pg_catalog.jsonb_typeof(v_request) <> 'object' or pg_catalog.jsonb_typeof(v_result) <> 'object' then
    raise exception using errcode = '22023', message = 'AUTH_DB_014_ATTEMPT_IDENTITY_INVALID';
  end if;

  if v_device_id is not null then
    select a.* into v_root from audit.authorization_devices a where a.device_id = v_device_id;
  end if;
  if v_decision_id is not null then
    select d.* into v_decision from audit.authorization_decisions d where d.decision_id = v_decision_id;
    if not found then raise exception using errcode = '23503', message = 'AUTH_DB_014_ATTEMPT_DECISION_MISSING'; end if;
  end if;
  if exists (select 1 from pg_catalog.jsonb_object_keys(v_sources) k where k not in (
    'device_registry','endpoint_registry','technical_principal_registry','credential_binding_registry',
    'device_template_catalog','site_catalog','area_catalog','application_catalog','permission_catalog',
    'device_permission_package_catalog','actor_policy_catalog','authorization_contract','freshness_contract'
  )) or exists (select 1 from pg_catalog.jsonb_each_text(v_sources) x where pg_catalog.length(pg_catalog.btrim(x.value)) = 0 or pg_catalog.lower(x.value) in ('latest','current','unknown'))
     or exists (select 1 from pg_catalog.jsonb_object_keys(v_source_fps) k where not (v_sources ? k))
     or exists (select 1 from pg_catalog.jsonb_each_text(v_source_fps) x where x.value !~ '^sha256:[0-9a-f]{64}$') then
    raise exception using errcode = '22023', message = 'AUTH_DB_014_SOURCE_IDENTITY_INVALID';
  end if;

  v_key_hash := app_private.fingerprint_authorization_device(pg_catalog.to_jsonb(v_idempotency));
  v_attempt_fp := app_private.fingerprint_authorization_device(p_attempt - 'idempotency_key');
  select a.* into v_existing from audit.authorization_device_attempts a
  where a.correlation_id = v_correlation and a.idempotency_key_hash = v_key_hash;
  if found then
    if v_existing.attempt_fingerprint <> v_attempt_fp then
      raise exception using errcode = '23505', message = 'AUTH_DB_014_IDEMPOTENCY_CONFLICT';
    end if;
    return pg_catalog.jsonb_build_object('device_attempt_id',v_existing.device_attempt_id,'outcome',v_existing.outcome,'idempotent',true);
  end if;

  insert into audit.authorization_device_attempts (
    device_attempt_id,device_audit_id,device_id,requested_operation,expected_revision,requested_at,resolved_at,
    outcome,reason_codes,administrative_actor_id,actor_employee_id,technical_principal_id,endpoint_id,
    credential_binding_id,authorization_decision_id,correlation_id,idempotency_key_hash,source_system,
    source_operation_id,safe_request_snapshot,safe_result_snapshot,contract_version,source_versions,
    source_fingerprints,attempt_fingerprint,source_contract_sha256
  ) values (
    v_attempt_id,v_root.device_audit_id,v_device_id,v_operation,v_expected,
    coalesce(nullif(p_attempt ->> 'requested_at','')::timestamptz,v_now),
    case when v_outcome = 'UNKNOWN_OUTCOME' then null else coalesce(nullif(p_attempt ->> 'resolved_at','')::timestamptz,v_now) end,
    v_outcome,v_reason_codes,case when v_decision_id is null then null else v_decision.actor_id end,
    nullif(p_attempt ->> 'actor_employee_id','')::uuid,
    coalesce(nullif(p_attempt ->> 'technical_principal_id',''),case when v_decision_id is null then null else v_decision.principal_id end),
    nullif(p_attempt ->> 'endpoint_id',''),nullif(p_attempt ->> 'credential_binding_id',''),v_decision_id,
    v_correlation,v_key_hash,v_source_system,v_source_operation_id,v_request,v_result,'1.0.0',v_sources,v_source_fps,
    v_attempt_fp,'17823df588e49b5ac27dec4fa2b75e222d1797841818611629f306a9a34ee11c'
  );
  return pg_catalog.jsonb_build_object('device_attempt_id',v_attempt_id,'outcome',v_outcome,'idempotent',false);
exception
  when invalid_text_representation or datetime_field_overflow then
    raise exception using errcode = '22023', message = 'AUTH_DB_014_ATTEMPT_IDENTITY_INVALID';
end
$auth_db_014_append_attempt$;

create or replace function app_private.link_authorization_device_evidence(p_link jsonb)
returns jsonb
language plpgsql
volatile
security definer
strict
set search_path = pg_catalog, audit, app_private, extensions
as $auth_db_014_link$
declare
  v_device_id uuid;
  v_root audit.authorization_devices%rowtype;
  v_link_id uuid := extensions.gen_random_uuid();
  v_source_type text;
  v_source_id text;
  v_target_type text;
  v_target_id text;
  v_relationship text;
  v_correlation text;
  v_causation text;
  v_fp text;
  v_existing audit.authorization_device_links%rowtype;
begin
  if pg_catalog.jsonb_typeof(p_link) <> 'object'
     or pg_catalog.octet_length(p_link::text) > 32768
     or p_link::text ~* '"(jwt|refresh_token|access_token|service_role|api_key|pin|password|secret|credential_secret|private_key|passkey|passkey_material|otp|recovery_code|cookie|session_secret|authorization_header|authorization|email|phone|full_name|employee_name|login_email|legacy_auth_email|document|salary|diagnosis|disciplinary)"[[:space:]]*:'
     or exists (select 1 from pg_catalog.jsonb_object_keys(p_link) k where k not in (
       'device_id','source_type','source_id','target_type','target_id','relationship','correlation_id','causation_id'
     )) then
    raise exception using errcode = '22023', message = 'AUTH_DB_014_DEVICE_AUDIT_INVALID_INPUT';
  end if;
  begin v_device_id := (p_link ->> 'device_id')::uuid;
  exception when others then raise exception using errcode = '22023', message = 'AUTH_DB_014_LINK_IDENTITY_INVALID'; end;
  v_source_type := nullif(p_link ->> 'source_type','');
  v_source_id := nullif(p_link ->> 'source_id','');
  v_target_type := nullif(p_link ->> 'target_type','');
  v_target_id := nullif(p_link ->> 'target_id','');
  v_relationship := nullif(p_link ->> 'relationship','');
  v_correlation := nullif(p_link ->> 'correlation_id','');
  v_causation := nullif(p_link ->> 'causation_id','');
  if v_source_type not in ('DEVICE_EVENT','AUTHORIZATION_DECISION','PERMISSION_CHANGE','SIMULATION','FRESHNESS_EVENT','ACTOR_SESSION','BUSINESS_RESOURCE','MIGRATION','EXTERNAL_PROVIDER_OPERATION','EVIDENCE_OBJECT','INCIDENT')
     or v_target_type not in ('DEVICE_EVENT','AUTHORIZATION_DECISION','PERMISSION_CHANGE','SIMULATION','FRESHNESS_EVENT','ACTOR_SESSION','BUSINESS_RESOURCE','MIGRATION','EXTERNAL_PROVIDER_OPERATION','EVIDENCE_OBJECT','INCIDENT')
     or v_source_id is null or v_target_id is null or v_relationship !~ '^[A-Z][A-Z0-9_]{2,127}$' then
    raise exception using errcode = '22023', message = 'AUTH_DB_014_LINK_IDENTITY_INVALID';
  end if;
  select a.* into v_root from audit.authorization_devices a where a.device_id = v_device_id;
  if not found then raise exception using errcode = 'P0002', message = 'AUTH_DB_014_DEVICE_NOT_FOUND'; end if;
  v_fp := app_private.fingerprint_authorization_device(p_link);
  select l.* into v_existing from audit.authorization_device_links l
  where l.device_audit_id = v_root.device_audit_id and l.source_type = v_source_type and l.source_id = v_source_id
    and l.target_type = v_target_type and l.target_id = v_target_id and l.relationship = v_relationship;
  if found then
    if v_existing.link_fingerprint <> v_fp then raise exception using errcode = '23505', message = 'AUTH_DB_014_IDEMPOTENCY_CONFLICT'; end if;
    return pg_catalog.jsonb_build_object('device_link_id',v_existing.device_link_id,'idempotent',true);
  end if;
  insert into audit.authorization_device_links (
    device_link_id,device_audit_id,device_id,source_type,source_id,target_type,target_id,relationship,
    correlation_id,causation_id,link_fingerprint,source_contract_sha256
  ) values (
    v_link_id,v_root.device_audit_id,v_device_id,v_source_type,v_source_id,v_target_type,v_target_id,
    v_relationship,v_correlation,v_causation,v_fp,
    '17823df588e49b5ac27dec4fa2b75e222d1797841818611629f306a9a34ee11c'
  );
  return pg_catalog.jsonb_build_object('device_link_id',v_link_id,'idempotent',false);
end
$auth_db_014_link$;

create or replace function app_private.correct_authorization_device_audit(p_correction jsonb)
returns jsonb
language plpgsql
volatile
security definer
strict
set search_path = pg_catalog, audit, app_private, extensions
as $auth_db_014_correct$
declare
  v_device_id uuid;
  v_root audit.authorization_devices%rowtype;
  v_decision audit.authorization_decisions%rowtype;
  v_decision_id text;
  v_target_type text;
  v_target_id text;
  v_kind text;
  v_reason text;
  v_correlation text;
  v_before jsonb;
  v_after jsonb;
  v_fp text;
  v_id uuid := extensions.gen_random_uuid();
  v_exists boolean := false;
begin
  if pg_catalog.jsonb_typeof(p_correction) <> 'object'
     or pg_catalog.octet_length(p_correction::text) > 32768
     or p_correction::text ~* '"(jwt|refresh_token|access_token|service_role|api_key|pin|password|secret|credential_secret|private_key|passkey|passkey_material|otp|recovery_code|cookie|session_secret|authorization_header|authorization|email|phone|full_name|employee_name|login_email|legacy_auth_email|document|salary|diagnosis|disciplinary)"[[:space:]]*:'
     or exists (select 1 from pg_catalog.jsonb_object_keys(p_correction) k where k not in (
       'device_id','target_record_type','target_record_id','correction_kind','reason',
       'authorization_decision_id','correlation_id','before_reference','after_reference'
     )) then
    raise exception using errcode = '22023', message = 'AUTH_DB_014_DEVICE_AUDIT_INVALID_INPUT';
  end if;
  begin v_device_id := (p_correction ->> 'device_id')::uuid;
  exception when others then raise exception using errcode = '22023', message = 'AUTH_DB_014_CORRECTION_IDENTITY_INVALID'; end;
  v_target_type := nullif(p_correction ->> 'target_record_type','');
  v_target_id := nullif(p_correction ->> 'target_record_id','');
  v_kind := nullif(p_correction ->> 'correction_kind','');
  v_reason := nullif(p_correction ->> 'reason','');
  v_decision_id := nullif(p_correction ->> 'authorization_decision_id','');
  v_correlation := nullif(p_correction ->> 'correlation_id','');
  v_before := coalesce(p_correction -> 'before_reference','{}'::jsonb);
  v_after := coalesce(p_correction -> 'after_reference','{}'::jsonb);
  if v_target_type not in ('DEVICE_ROOT','DEVICE_REVISION','DEVICE_EVENT','DEVICE_ATTEMPT','DEVICE_LINK')
     or v_target_id is null
     or v_kind not in ('METADATA_CLARIFICATION','EVIDENCE_LINK_ADDED','CLASSIFICATION_CLARIFIED','REFERENCE_CORRECTED')
     or pg_catalog.length(pg_catalog.btrim(v_reason)) < 3 or v_decision_id is null or v_correlation is null
     or pg_catalog.jsonb_typeof(v_before) <> 'object' or pg_catalog.jsonb_typeof(v_after) <> 'object' then
    raise exception using errcode = '22023', message = 'AUTH_DB_014_CORRECTION_IDENTITY_INVALID';
  end if;
  select a.* into v_root from audit.authorization_devices a where a.device_id = v_device_id;
  if not found then raise exception using errcode = 'P0002', message = 'AUTH_DB_014_DEVICE_NOT_FOUND'; end if;
  select d.* into v_decision from audit.authorization_decisions d where d.decision_id = v_decision_id;
  if not found or v_decision.outcome <> 'ALLOW' or v_decision.actor_id is null then
    raise exception using errcode = '42501', message = 'AUTH_DB_014_DEVICE_AUDIT_NOT_AUTHORIZED';
  end if;
  if v_decision.device_id is not null and v_decision.device_id is distinct from v_device_id::text then
    raise exception using errcode = '22023', message = 'AUTH_DB_014_DECISION_DEVICE_MISMATCH';
  end if;
  if v_decision.correlation_id is not null and v_decision.correlation_id is distinct from v_correlation then
    raise exception using errcode = '22023', message = 'AUTH_DB_014_CORRELATION_DECISION_MISMATCH';
  end if;
  if v_target_type = 'DEVICE_ROOT' then
    select exists(select 1 from audit.authorization_devices x where x.device_audit_id::text = v_target_id and x.device_audit_id = v_root.device_audit_id) into v_exists;
  elsif v_target_type = 'DEVICE_REVISION' then
    select exists(select 1 from audit.authorization_device_revisions x where x.device_revision_id::text = v_target_id and x.device_audit_id = v_root.device_audit_id) into v_exists;
  elsif v_target_type = 'DEVICE_EVENT' then
    select exists(select 1 from audit.authorization_device_events x where x.device_event_id::text = v_target_id and x.device_audit_id = v_root.device_audit_id) into v_exists;
  elsif v_target_type = 'DEVICE_ATTEMPT' then
    select exists(select 1 from audit.authorization_device_attempts x where x.device_attempt_id::text = v_target_id and x.device_audit_id = v_root.device_audit_id) into v_exists;
  else
    select exists(select 1 from audit.authorization_device_links x where x.device_link_id::text = v_target_id and x.device_audit_id = v_root.device_audit_id) into v_exists;
  end if;
  if not v_exists then raise exception using errcode = '23503', message = 'AUTH_DB_014_CORRECTION_TARGET_MISSING'; end if;
  v_fp := app_private.fingerprint_authorization_device(pg_catalog.jsonb_build_object(
    'device_id',v_device_id,'target_record_type',v_target_type,'target_record_id',v_target_id,
    'correction_kind',v_kind,'reason',v_reason,'authorization_decision_id',v_decision_id,
    'correlation_id',v_correlation,'before_reference',v_before,'after_reference',v_after
  ));
  insert into audit.authorization_device_corrections (
    device_correction_id,device_audit_id,device_id,target_record_type,target_record_id,correction_kind,reason,
    authorized_by_actor_id,authorization_decision_id,before_reference,after_reference,correlation_id,
    correction_fingerprint,source_contract_sha256
  ) values (
    v_id,v_root.device_audit_id,v_device_id,v_target_type,v_target_id,v_kind,v_reason,v_decision.actor_id,
    v_decision_id,v_before,v_after,v_correlation,v_fp,
    '17823df588e49b5ac27dec4fa2b75e222d1797841818611629f306a9a34ee11c'
  );
  return pg_catalog.jsonb_build_object('device_correction_id',v_id,'correction_fingerprint',v_fp);
end
$auth_db_014_correct$;

create or replace function app_private.import_authorization_device_legacy_event(
  p_legacy_event jsonb,
  p_device_code text
)
returns jsonb
language plpgsql
volatile
called on null input
set search_path = pg_catalog, audit, app_private, extensions
as $auth_db_014_import_legacy$
declare
  v_now timestamptz := pg_catalog.statement_timestamp();
  v_legacy_id uuid;
  v_device_id uuid;
  v_actor_employee_id uuid;
  v_event_type text;
  v_source text;
  v_occurred_at timestamptz;
  v_app_code text;
  v_site_id text;
  v_area_id text;
  v_root audit.authorization_devices%rowtype;
  v_event_id uuid := extensions.gen_random_uuid();
  v_event_sequence integer;
  v_record_fp text;
  v_key_hash text;
  v_operation_fp text;
  v_event_fp text;
  v_attempt_id uuid := extensions.gen_random_uuid();
  v_attempt_fp text;
  v_link_id uuid := extensions.gen_random_uuid();
  v_link_fp text;
  v_source_operation_id text;
  v_existing_event audit.authorization_device_events%rowtype;
  v_existing_attempt audit.authorization_device_attempts%rowtype;
begin
  if pg_catalog.jsonb_typeof(p_legacy_event) <> 'object'
     or exists (select 1 from pg_catalog.jsonb_object_keys(p_legacy_event) k where k not in (
       'id','device_id','session_user_id','actor_employee_id','actor_shift_id','app_code','site_id','area_id',
       'event_type','event_payload','source','occurred_at','created_at'
     )) then
    raise exception using errcode = '22023', message = 'AUTH_DB_014_LEGACY_EVENT_SHAPE_INVALID';
  end if;
  begin
    v_legacy_id := (p_legacy_event ->> 'id')::uuid;
    if nullif(p_legacy_event ->> 'device_id','') is not null then v_device_id := (p_legacy_event ->> 'device_id')::uuid; end if;
    if nullif(p_legacy_event ->> 'actor_employee_id','') is not null then v_actor_employee_id := (p_legacy_event ->> 'actor_employee_id')::uuid; end if;
    v_occurred_at := (p_legacy_event ->> 'occurred_at')::timestamptz;
  exception when others then
    raise exception using errcode = '22023', message = 'AUTH_DB_014_LEGACY_EVENT_IDENTITY_INVALID';
  end;
  v_event_type := nullif(p_legacy_event ->> 'event_type','');
  v_source := nullif(p_legacy_event ->> 'source','');
  v_app_code := nullif(p_legacy_event ->> 'app_code','');
  v_site_id := nullif(p_legacy_event ->> 'site_id','');
  v_area_id := nullif(p_legacy_event ->> 'area_id','');
  if v_legacy_id is null or v_event_type is null or v_source is null or v_occurred_at is null then
    raise exception using errcode = '22023', message = 'AUTH_DB_014_LEGACY_EVENT_IDENTITY_INVALID';
  end if;
  v_source_operation_id := 'public.shared_operational_device_events:' || v_legacy_id::text;
  v_record_fp := app_private.fingerprint_authorization_device(p_legacy_event);
  v_key_hash := app_private.fingerprint_authorization_device(pg_catalog.to_jsonb('legacy-import:' || v_legacy_id::text));

  select e.* into v_existing_event from audit.authorization_device_events e
  where e.source_system = 'public.shared_operational_device_events' and e.source_operation_id = v_source_operation_id;
  if found then
    return pg_catalog.jsonb_build_object('classification','LEGACY_PARTIAL','device_event_id',v_existing_event.device_event_id,'idempotent',true);
  end if;
  select a.* into v_existing_attempt from audit.authorization_device_attempts a
  where a.source_system = 'public.shared_operational_device_events' and a.source_operation_id = v_source_operation_id;
  if found then
    return pg_catalog.jsonb_build_object('classification','LEGACY_UNVERIFIABLE','device_attempt_id',v_existing_attempt.device_attempt_id,'idempotent',true);
  end if;

  if v_device_id is null or nullif(p_device_code,'') is null then
    v_attempt_fp := app_private.fingerprint_authorization_device(pg_catalog.jsonb_build_object(
      'legacy_event_id',v_legacy_id,'legacy_record_fingerprint',v_record_fp,'classification','LEGACY_UNVERIFIABLE'
    ));
    insert into audit.authorization_device_attempts (
      device_attempt_id,device_audit_id,device_id,requested_operation,expected_revision,requested_at,resolved_at,
      outcome,reason_codes,correlation_id,idempotency_key_hash,source_system,source_operation_id,safe_request_snapshot,
      safe_result_snapshot,contract_version,source_versions,source_fingerprints,attempt_fingerprint,source_contract_sha256
    ) values (
      v_attempt_id,null,v_device_id,'LEGACY_IMPORT',null,v_now,v_now,'NO_EFFECT',array['DEVICE_AUDIT_LEGACY_UNVERIFIABLE'],
      'AUTH-DB-014-LEGACY-' || v_legacy_id::text,v_key_hash,'public.shared_operational_device_events',v_source_operation_id,
      pg_catalog.jsonb_build_object('legacy_event_id',v_legacy_id,'legacy_record_fingerprint',v_record_fp),
      pg_catalog.jsonb_build_object('classification','LEGACY_UNVERIFIABLE'),'1.0.0',
      pg_catalog.jsonb_build_object('device_registry','legacy-shared-operational-device-v1'),
      pg_catalog.jsonb_build_object('device_registry',v_record_fp),v_attempt_fp,
      '17823df588e49b5ac27dec4fa2b75e222d1797841818611629f306a9a34ee11c'
    );
    return pg_catalog.jsonb_build_object('classification','LEGACY_UNVERIFIABLE','device_attempt_id',v_attempt_id,'idempotent',false);
  end if;

  select a.* into v_root from audit.authorization_devices a where a.device_id = v_device_id;
  if not found then
    insert into audit.authorization_devices (
      device_audit_id,device_id,device_code,contract_family,contract_family_version,contract_name,contract_version,
      schema_version,first_observed_at,first_event_id,source_registry,source_identity_version,
      creation_idempotency_key_hash,creation_request_fingerprint,source_contract_sha256
    ) values (
      extensions.gen_random_uuid(),v_device_id,p_device_code,'vento.authorization.device-audit','1.0.0',
      'AuthorizationDeviceAudit','1.0.0','1.0.0',v_occurred_at,v_event_id,'public.shared_operational_devices',
      'legacy-shared-operational-device-v1',v_key_hash,
      app_private.fingerprint_authorization_device(pg_catalog.jsonb_build_object(
        'device_id',v_device_id,'device_code',p_device_code,'legacy_first_event_id',v_legacy_id,'legacy_record_fingerprint',v_record_fp
      )),'17823df588e49b5ac27dec4fa2b75e222d1797841818611629f306a9a34ee11c'
    ) returning * into v_root;
  end if;

  select coalesce(max(e.event_sequence),0) + 1 into v_event_sequence
  from audit.authorization_device_events e where e.device_audit_id = v_root.device_audit_id;
  v_operation_fp := app_private.fingerprint_authorization_device(pg_catalog.jsonb_build_object(
    'device_id',v_device_id,'legacy_event_id',v_legacy_id,'legacy_record_fingerprint',v_record_fp,
    'legacy_event_type',v_event_type,'classification','LEGACY_PARTIAL'
  ));
  v_event_fp := app_private.fingerprint_authorization_device(pg_catalog.jsonb_build_object(
    'device_id',v_device_id,'event_sequence',v_event_sequence,'event_type','LEGACY_RECORD_IMPORTED',
    'event_family','MIGRATION','event_outcome','SUCCEEDED','operation_fingerprint',v_operation_fp,
    'legacy_record_fingerprint',v_record_fp
  ));
  insert into audit.authorization_device_events (
    device_event_id,device_audit_id,device_id,device_revision_id,event_sequence,event_type,event_family,event_outcome,
    occurred_at,actor_employee_id,correlation_id,source_system,source_operation_id,idempotency_key_hash,operation_fingerprint,
    contract_version,source_versions,source_fingerprints,event_payload,event_fingerprint,source_contract_sha256
  ) values (
    v_event_id,v_root.device_audit_id,v_device_id,null,v_event_sequence,'LEGACY_RECORD_IMPORTED','MIGRATION','SUCCEEDED',
    v_occurred_at,v_actor_employee_id,'AUTH-DB-014-LEGACY-' || v_legacy_id::text,
    'public.shared_operational_device_events',v_source_operation_id,v_key_hash,v_operation_fp,'1.0.0',
    pg_catalog.jsonb_build_object('device_registry','legacy-shared-operational-device-v1'),
    pg_catalog.jsonb_build_object('device_registry',v_record_fp),
    pg_catalog.jsonb_strip_nulls(pg_catalog.jsonb_build_object(
      'legacy_classification','LEGACY_PARTIAL','legacy_event_type',v_event_type,'legacy_source',v_source,
      'app_code',v_app_code,'site_id',v_site_id,'area_id',v_area_id,'legacy_record_fingerprint',v_record_fp
    )),v_event_fp,'17823df588e49b5ac27dec4fa2b75e222d1797841818611629f306a9a34ee11c'
  );
  v_link_fp := app_private.fingerprint_authorization_device(pg_catalog.jsonb_build_object(
    'device_id',v_device_id,'source_type','MIGRATION','source_id',v_source_operation_id,
    'target_type','DEVICE_EVENT','target_id',v_event_id::text,'relationship','LEGACY_SOURCE_OF'
  ));
  insert into audit.authorization_device_links (
    device_link_id,device_audit_id,device_id,source_type,source_id,target_type,target_id,relationship,
    correlation_id,link_fingerprint,source_contract_sha256
  ) values (
    v_link_id,v_root.device_audit_id,v_device_id,'MIGRATION',v_source_operation_id,'DEVICE_EVENT',v_event_id::text,
    'LEGACY_SOURCE_OF','AUTH-DB-014-LEGACY-' || v_legacy_id::text,v_link_fp,
    '17823df588e49b5ac27dec4fa2b75e222d1797841818611629f306a9a34ee11c'
  );
  return pg_catalog.jsonb_build_object('classification','LEGACY_PARTIAL','device_event_id',v_event_id,'device_link_id',v_link_id,'idempotent',false);
end
$auth_db_014_import_legacy$;

-- All six canonical audit tables are append-only. The owner can INSERT through hardened writers,
-- but even the owner cannot rewrite history through ordinary UPDATE/DELETE/TRUNCATE paths.
do $auth_db_014_triggers$
declare
  v_spec text;
  v_table text;
  v_code text;
begin
  foreach v_spec in array array[
    'authorization_devices|dev',
    'authorization_device_revisions|rev',
    'authorization_device_events|evt',
    'authorization_device_attempts|att',
    'authorization_device_links|lnk',
    'authorization_device_corrections|cor'
  ] loop
    v_table := pg_catalog.split_part(v_spec, '|', 1);
    v_code := pg_catalog.split_part(v_spec, '|', 2);
    execute pg_catalog.format(
      'create trigger %I before update or delete on audit.%I for each row execute function app_private.reject_authorization_device_audit_mutation()',
      'trg_auth_db_014_' || v_code || '_row', v_table
    );
    execute pg_catalog.format(
      'create trigger %I before truncate on audit.%I for each statement execute function app_private.reject_authorization_device_audit_mutation()',
      'trg_auth_db_014_' || v_code || '_truncate', v_table
    );
  end loop;
end
$auth_db_014_triggers$;

alter table audit.authorization_devices enable row level security;
alter table audit.authorization_device_revisions enable row level security;
alter table audit.authorization_device_events enable row level security;
alter table audit.authorization_device_attempts enable row level security;
alter table audit.authorization_device_links enable row level security;
alter table audit.authorization_device_corrections enable row level security;

revoke all on table
  audit.authorization_devices,
  audit.authorization_device_revisions,
  audit.authorization_device_events,
  audit.authorization_device_attempts,
  audit.authorization_device_links,
  audit.authorization_device_corrections
from public, anon, authenticated, service_role;

revoke all on function
  app_private.canonicalize_authorization_device(jsonb),
  app_private.fingerprint_authorization_device(jsonb),
  app_private.derive_authorization_device_state(uuid),
  app_private.append_authorization_device(jsonb),
  app_private.append_authorization_device_revision(jsonb),
  app_private.append_authorization_device_event(jsonb),
  app_private.append_authorization_device_attempt(jsonb),
  app_private.link_authorization_device_evidence(jsonb),
  app_private.correct_authorization_device_audit(jsonb),
  app_private.import_authorization_device_legacy_event(jsonb,text),
  app_private.reject_authorization_device_audit_mutation()
from public, anon, authenticated, service_role;

-- The local database harness runs as postgres. Mirror the AUTH-DB-013 internal test/operator boundary:
-- postgres may read evidence and call hardened operational writers, but receives no direct mutation grant.
grant execute on function
  app_private.derive_authorization_device_state(uuid),
  app_private.append_authorization_device(jsonb),
  app_private.append_authorization_device_revision(jsonb),
  app_private.append_authorization_device_event(jsonb),
  app_private.append_authorization_device_attempt(jsonb),
  app_private.link_authorization_device_evidence(jsonb),
  app_private.correct_authorization_device_audit(jsonb)
to postgres;

grant select on table
  audit.authorization_devices,
  audit.authorization_device_revisions,
  audit.authorization_device_events,
  audit.authorization_device_attempts,
  audit.authorization_device_links,
  audit.authorization_device_corrections
to postgres;

-- Import whatever verifiable legacy evidence exists in the environment at migration time.
-- Clean replay may legitimately contain zero legacy rows; hosted deployment may contain the audited snapshot.
do $auth_db_014_legacy_import$
declare
  v_row record;
  v_result jsonb;
begin
  for v_row in
    select e.*, d.code as device_code
    from public.shared_operational_device_events e
    left join public.shared_operational_devices d on d.id = e.device_id
    order by e.occurred_at, e.id
  loop
    v_result := app_private.import_authorization_device_legacy_event(to_jsonb(v_row) - 'device_code', v_row.device_code);
    raise notice 'AUTH_DB_014_LEGACY_IMPORT source_id=% classification=%', v_row.id, v_result ->> 'classification';
  end loop;
end
$auth_db_014_legacy_import$;

-- Post-import invariants: every promotable legacy row has one canonical event; unverifiable rows have one attempt.
do $auth_db_014_post_import$
declare
  v_source_count bigint;
  v_accounted_count bigint;
begin
  select pg_catalog.count(*) into v_source_count from public.shared_operational_device_events;
  select
    (select pg_catalog.count(*) from audit.authorization_device_events e where e.source_system = 'public.shared_operational_device_events')
    +
    (select pg_catalog.count(*) from audit.authorization_device_attempts a where a.source_system = 'public.shared_operational_device_events')
  into v_accounted_count;
  if v_accounted_count <> v_source_count then
    raise exception 'AUTH_DB_014_LEGACY_RECONCILIATION_MISMATCH source=% accounted=%', v_source_count, v_accounted_count;
  end if;
  if exists (
    select 1
    from audit.authorization_device_events e
    where e.source_system = 'public.shared_operational_device_events'
      and e.event_type <> 'LEGACY_RECORD_IMPORTED'
  ) then
    raise exception 'AUTH_DB_014_LEGACY_HISTORY_FABRICATION_DETECTED';
  end if;
end
$auth_db_014_post_import$;

reset role;
revoke select on table
  public.shared_operational_devices,
  public.shared_operational_device_events
from vento_authorization_owner;

-- Restore schema creation to default-deny after the installation transaction.
revoke create on schema audit, app_private from vento_authorization_owner;

commit;
