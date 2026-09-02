-- VENTO_DB_TEST_CATEGORY: RPC
begin;

create extension if not exists pgtap with schema extensions;

select plan(457);


create function pg_temp.auth_db_032_decision(
  p_decision_id text,
  p_outcome text default 'ALLOW',
  p_operation text default 'APP_ACCESS',
  p_source text default 'SERVER_ACTION',
  p_resource_mode text default 'NON_RESOURCE',
  p_resource_ids text[] default '{}'::text[],
  p_sensitive boolean default false,
  p_audit_policy_id text default 'audit.standard.v1',
  p_device_id text default null,
  p_decided_at text default '2000-01-01T00:00:00.000Z'
)
returns jsonb
language sql
immutable
as $auth_db_032_decision$
  select pg_catalog.jsonb_build_object(
    'contract_family', 'vento.authorization.response-contracts',
    'contract_family_version', '1.0.0',
    'contract_name', 'AuthorizationDecision',
    'contract_version', '1.0.0',
    'schema_version', '1.0.0',
    'decision_id', p_decision_id,
    'decided_at', p_decided_at,
    'correlation_id', 'AUTH-DB-032-PGTAP',
    'access_context_ref', pg_catalog.jsonb_build_object(
      'context_id', '03200000-0000-0000-0000-000000000100',
      'context_contract_version', '1.0.0',
      'resolved_at', '2000-01-01T00:00:00.000Z',
      'actor_type', 'EMPLOYEE',
      'actor_id', '03200000-0000-0000-0000-000000000101',
      'principal_type', 'HUMAN_USER',
      'principal_id', '03200000-0000-0000-0000-000000000102',
      'context_fingerprint', 'sha256:' || pg_catalog.repeat('a', 64)
    ),
    'request', pg_catalog.jsonb_build_object(
      'app_code', 'shell',
      'permission_key', 'shell.access',
      'operation_kind', p_operation,
      'resource_request', case p_resource_mode
        when 'NON_RESOURCE' then pg_catalog.jsonb_build_object('mode', p_resource_mode)
        when 'AGGREGATE' then pg_catalog.jsonb_build_object('mode', p_resource_mode, 'server_filter', pg_catalog.jsonb_build_object('fixture', true))
        else pg_catalog.jsonb_build_object('mode', p_resource_mode, 'locator', pg_catalog.jsonb_build_object('id', 'AUTH-DB-032-FIXTURE'))
      end,
      'requested_fields', '[]'::jsonb,
      'request_source', p_source
    ),
    'permission_contract', pg_catalog.jsonb_build_object(
      'catalog_id', 'vento.authorization',
      'catalog_version', '1.1.0',
      'catalog_hash', 'sha256:' || pg_catalog.repeat('c', 64),
      'app_code', 'shell',
      'permission_key', 'shell.access',
      'permission_status', 'ACTIVE',
      'authorization_requirement', 'BASE_ONLY',
      'base_prerequisite', 'N',
      'operational_prerequisite', 'NOT_APPLICABLE',
      'requires_active_area', false,
      'device_policy_code', null,
      'is_sensitive', p_sensitive,
      'sensitivity_class', case when p_sensitive then 'FUNCTIONAL_SENSITIVE' else 'FUNCTIONAL' end,
      'simulation_policy', 'DECISION_ONLY',
      'resource_contract_id', 'shell.surface.v1',
      'dependency_permission_keys', '[]'::jsonb,
      'audit_policy_id', p_audit_policy_id
    ),
    'resource', pg_catalog.jsonb_build_object(
      'resource_type', 'TEST_RESOURCE',
      'request_mode', p_resource_mode,
      'resolution_state', case when p_resource_mode = 'NON_RESOURCE' then 'NOT_APPLICABLE' else 'RESOLVED' end,
      'resource_ids', pg_catalog.to_jsonb(p_resource_ids),
      'resource_fingerprint', 'sha256:' || pg_catalog.repeat('b', 64),
      'safe_resource_reference', null
    ),
    'required_lanes', case when p_outcome = 'ALLOW' then '["BASE"]'::jsonb else '["BASE"]'::jsonb end,
    'base_decision', pg_catalog.jsonb_build_object('evaluated', true, 'outcome', p_outcome, 'reason_codes', case when p_outcome='DENY' then '["AUTH_ADMIN_PERMISSION_DENIED"]'::jsonb else '[]'::jsonb end),
    'operational_decision', pg_catalog.jsonb_build_object('evaluated', false, 'outcome', 'NOT_APPLICABLE', 'reason_codes', '[]'::jsonb),
    'prerequisite_decisions', '[]'::jsonb,
    'device_decision', pg_catalog.jsonb_build_object('outcome', 'ALLOW', 'status', 'NOT_APPLICABLE', 'reason_codes', '[]'::jsonb),
    'sensitivity_decision', pg_catalog.jsonb_build_object('outcome', 'ALLOW', 'status', 'NOT_APPLICABLE', 'reason_codes', '[]'::jsonb),
    'field_policy_decision', pg_catalog.jsonb_build_object('outcome', 'ALLOW', 'visible_fields', '[]'::jsonb),
    'matched_allows', case when p_outcome='ALLOW' then '[{"lane":"BASE","id":"fixture"}]'::jsonb else '[]'::jsonb end,
    'matched_denies', '[]'::jsonb,
    'structural_denies', '[]'::jsonb,
    'actor_wide_denies', '[]'::jsonb,
    'lane_denies', '[]'::jsonb,
    'blocked_reasons', case when p_outcome='DENY' then '["AUTH_ADMIN_PERMISSION_DENIED"]'::jsonb else '[]'::jsonb end,
    'combination', pg_catalog.jsonb_build_object('authorization_requirement','BASE_ONLY','outcome',p_outcome),
    'final_decision', p_outcome,
    'audit', pg_catalog.jsonb_build_object(
      'decision_id', p_decision_id,
      'correlation_id', 'AUTH-DB-032-PGTAP',
      'actor_id', '03200000-0000-0000-0000-000000000101',
      'principal_id', '03200000-0000-0000-0000-000000000102',
      'device_id', p_device_id,
      'app_code', 'shell',
      'permission_key', 'shell.access',
      'request_source', p_source,
      'resource_type', 'TEST_RESOURCE',
      'resource_ids', pg_catalog.to_jsonb(p_resource_ids),
      'outcome', p_outcome,
      'authorizing_lanes', case when p_outcome='ALLOW' then '["BASE"]'::jsonb else '[]'::jsonb end,
      'context_fingerprint', 'sha256:' || pg_catalog.repeat('a', 64),
      'resource_fingerprint', 'sha256:' || pg_catalog.repeat('b', 64),
      'catalog_hash', 'sha256:' || pg_catalog.repeat('c', 64),
      'dataset_hashes', pg_catalog.jsonb_build_object('base_grants', 'sha256:' || pg_catalog.repeat('d', 64)),
      'evaluator_name', 'vento.authorization.evaluate_authorization',
      'evaluator_version', '20260901230518',
      'request_fingerprint', 'sha256:' || pg_catalog.repeat('e',64),
      'permission_contract_fingerprint', 'sha256:' || pg_catalog.repeat('f',64),
      'contract_release_hash', 'sha256:' || pg_catalog.repeat('1',64),
      'identity_registry_sha256', 'sha256:' || pg_catalog.repeat('2',64),
      'dataset_evidence', '[]'::jsonb
    )
  );
$auth_db_032_decision$;

create function pg_temp.auth_db_032_link(
  p_decision_id text,
  p_kind text,
  p_reference_id text,
  p_result_code text default null
)
returns jsonb
language sql
immutable
as $auth_db_032_link$
  select pg_catalog.jsonb_build_object(
    'decision_id', p_decision_id,
    'link_kind', p_kind,
    'reference_type', p_kind || '_REF',
    'reference_id', p_reference_id,
    'process_id', 'PROC-AUTH-032',
    'process_instance_id', 'PROC-AUTH-032-INSTANCE',
    'correlation_id', 'AUTH-DB-032-PGTAP',
    'causation_id', 'CAUSE-AUTH-DB-032',
    'occurred_at', '2000-01-01T00:00:01.000Z',
    'result_code', p_result_code,
    'result_reference', case when p_result_code is null then null else 'RESULT-REF' end,
    'error_class', case when p_kind = 'ERROR' then 'TECHNICAL' else null end,
    'expected_resource_version', '10',
    'observed_resource_version', '11',
    'idempotency_key_reference', 'IDEMPOTENCY-REF-032'
  );
$auth_db_032_link$;

create function pg_temp.auth_db_032_failure(p_id text)
returns jsonb
language sql
immutable
as $auth_db_032_failure$
  select pg_catalog.jsonb_build_object(
    'contract', 'AUTHORIZATION-TECHNICAL-UNAVAILABILITY-CONTRACT-001',
    'contract_version', '1.0.0',
    'reason_code', 'AUTH_AUTHORIZATION_EVALUATION_UNAVAILABLE',
    'state', 'AUTHORIZATION_EVALUATION_UNAVAILABLE',
    'category', 'TECHNICAL_UNAVAILABLE',
    'result_status', 'TECHNICAL_FAILURE',
    'decision_produced', false,
    'executable', false,
    'retryable', true,
    'retry_after_seconds', 5,
    'session_preserved', true,
    'effects_committed', false,
    'recovery_action', 'RETRY_LATER',
    'evaluation_attempt_id', p_id,
    'correlation_id', 'AUTH-DB-032-PGTAP-FAILURE',
    'support_code', 'AUTH032SUPPORT',
    'occurred_at', '2000-01-01T00:00:00.000Z',
    'request_source', 'SERVER_ACTION',
    'consumer_id', 'vento-shell',
    'app_code', 'shell',
    'permission_key', 'shell.access',
    'operation_kind', 'APP_ACCESS',
    'failure_stage', 'DATASET_LOAD',
    'private_failure_family', 'DEPENDENCY_UNAVAILABLE',
    'sanitized_provider_code', 'LOCAL_TEST_DEPENDENCY',
    'retry_count', 1,
    'retry_budget', 2,
    'duration_ms', 15,
    'source_versions', pg_catalog.jsonb_build_object('catalog','1.1.0'),
    'source_fingerprints', pg_catalog.jsonb_build_object('catalog','sha256:' || pg_catalog.repeat('c',64))
  );
$auth_db_032_failure$;

create function pg_temp.auth_db_032_failure_attempt(p_id text, p_ordinal integer, p_result text default 'UNAVAILABLE')
returns jsonb
language sql
immutable
as $auth_db_032_failure_attempt$
  select pg_catalog.jsonb_build_object(
    'evaluation_attempt_id', p_id,
    'attempt_ordinal', p_ordinal,
    'source_key', 'AUTH_DATASET',
    'started_at', '2000-01-01T00:00:00.000Z',
    'completed_at', '2000-01-01T00:00:00.010Z',
    'duration_ms', 10,
    'sanitized_provider_code', 'LOCAL_TEST_DEPENDENCY',
    'retryable', true,
    'retry_after_seconds', 5,
    'attempt_result', p_result
  );
$auth_db_032_failure_attempt$;

create function pg_temp.auth_db_032_evaluation_request()
returns jsonb
language sql
immutable
as $auth_db_032_evaluation_request$
  select pg_catalog.jsonb_build_object(
    'contract_family', 'vento.authorization.request-contracts',
    'contract_family_version', '1.0.0',
    'contract_name', 'AuthorizationEvaluationRequest',
    'contract_version', '1.0.0',
    'schema_version', '1.0.0',
    'correlation_id', 'AUTH-DB-032-WRAPPER-PGTAP',
    'request', pg_catalog.jsonb_build_object(
      'app_code', 'shell',
      'permission_key', 'shell.access',
      'operation_kind', 'APP_ACCESS',
      'resource_request', pg_catalog.jsonb_build_object('mode','NON_RESOURCE'),
      'requested_fields', '[]'::jsonb,
      'request_source', 'SERVER_ACTION'
    )
  );
$auth_db_032_evaluation_request$;

-- 1
select ok(pg_catalog.to_regclass('audit.authorization_decision_persistence_policies') is not null, 'table audit.authorization_decision_persistence_policies exists');

-- 2
select ok(pg_catalog.to_regclass('audit.authorization_decisions') is not null, 'table audit.authorization_decisions exists');

-- 3
select ok(pg_catalog.to_regclass('audit.authorization_decision_resources') is not null, 'table audit.authorization_decision_resources exists');

-- 4
select ok(pg_catalog.to_regclass('audit.authorization_decision_links') is not null, 'table audit.authorization_decision_links exists');

-- 5
select ok(pg_catalog.to_regclass('audit.authorization_evaluation_failures') is not null, 'table audit.authorization_evaluation_failures exists');

-- 6
select ok(pg_catalog.to_regclass('audit.authorization_evaluation_failure_attempts') is not null, 'table audit.authorization_evaluation_failure_attempts exists');

-- 7
select is((select pg_catalog.pg_get_userbyid(c.relowner) from pg_catalog.pg_class c where c.oid='audit.authorization_decision_persistence_policies'::regclass), 'vento_authorization_owner', 'audit.authorization_decision_persistence_policies owner is isolated authorization owner');

-- 8
select is((select pg_catalog.pg_get_userbyid(c.relowner) from pg_catalog.pg_class c where c.oid='audit.authorization_decisions'::regclass), 'vento_authorization_owner', 'audit.authorization_decisions owner is isolated authorization owner');

-- 9
select is((select pg_catalog.pg_get_userbyid(c.relowner) from pg_catalog.pg_class c where c.oid='audit.authorization_decision_resources'::regclass), 'vento_authorization_owner', 'audit.authorization_decision_resources owner is isolated authorization owner');

-- 10
select is((select pg_catalog.pg_get_userbyid(c.relowner) from pg_catalog.pg_class c where c.oid='audit.authorization_decision_links'::regclass), 'vento_authorization_owner', 'audit.authorization_decision_links owner is isolated authorization owner');

-- 11
select is((select pg_catalog.pg_get_userbyid(c.relowner) from pg_catalog.pg_class c where c.oid='audit.authorization_evaluation_failures'::regclass), 'vento_authorization_owner', 'audit.authorization_evaluation_failures owner is isolated authorization owner');

-- 12
select is((select pg_catalog.pg_get_userbyid(c.relowner) from pg_catalog.pg_class c where c.oid='audit.authorization_evaluation_failure_attempts'::regclass), 'vento_authorization_owner', 'audit.authorization_evaluation_failure_attempts owner is isolated authorization owner');

-- 13
select ok((select c.relrowsecurity from pg_catalog.pg_class c where c.oid='audit.authorization_decision_persistence_policies'::regclass), 'audit.authorization_decision_persistence_policies has RLS enabled');

-- 14
select ok((select c.relrowsecurity from pg_catalog.pg_class c where c.oid='audit.authorization_decisions'::regclass), 'audit.authorization_decisions has RLS enabled');

-- 15
select ok((select c.relrowsecurity from pg_catalog.pg_class c where c.oid='audit.authorization_decision_resources'::regclass), 'audit.authorization_decision_resources has RLS enabled');

-- 16
select ok((select c.relrowsecurity from pg_catalog.pg_class c where c.oid='audit.authorization_decision_links'::regclass), 'audit.authorization_decision_links has RLS enabled');

-- 17
select ok((select c.relrowsecurity from pg_catalog.pg_class c where c.oid='audit.authorization_evaluation_failures'::regclass), 'audit.authorization_evaluation_failures has RLS enabled');

-- 18
select ok((select c.relrowsecurity from pg_catalog.pg_class c where c.oid='audit.authorization_evaluation_failure_attempts'::regclass), 'audit.authorization_evaluation_failure_attempts has RLS enabled');

-- 19
select ok(not (select c.relforcerowsecurity from pg_catalog.pg_class c where c.oid='audit.authorization_decision_persistence_policies'::regclass), 'audit.authorization_decision_persistence_policies intentionally does not FORCE RLS for owner-definer append');

-- 20
select ok(not (select c.relforcerowsecurity from pg_catalog.pg_class c where c.oid='audit.authorization_decisions'::regclass), 'audit.authorization_decisions intentionally does not FORCE RLS for owner-definer append');

-- 21
select ok(not (select c.relforcerowsecurity from pg_catalog.pg_class c where c.oid='audit.authorization_decision_resources'::regclass), 'audit.authorization_decision_resources intentionally does not FORCE RLS for owner-definer append');

-- 22
select ok(not (select c.relforcerowsecurity from pg_catalog.pg_class c where c.oid='audit.authorization_decision_links'::regclass), 'audit.authorization_decision_links intentionally does not FORCE RLS for owner-definer append');

-- 23
select ok(not (select c.relforcerowsecurity from pg_catalog.pg_class c where c.oid='audit.authorization_evaluation_failures'::regclass), 'audit.authorization_evaluation_failures intentionally does not FORCE RLS for owner-definer append');

-- 24
select ok(not (select c.relforcerowsecurity from pg_catalog.pg_class c where c.oid='audit.authorization_evaluation_failure_attempts'::regclass), 'audit.authorization_evaluation_failure_attempts intentionally does not FORCE RLS for owner-definer append');

-- 25
select ok(not pg_catalog.has_table_privilege('public', 'audit.authorization_decision_persistence_policies', 'SELECT') and not pg_catalog.has_table_privilege('public', 'audit.authorization_decision_persistence_policies', 'INSERT') and not pg_catalog.has_table_privilege('public', 'audit.authorization_decision_persistence_policies', 'UPDATE') and not pg_catalog.has_table_privilege('public', 'audit.authorization_decision_persistence_policies', 'DELETE'), 'public has zero direct DML on audit.authorization_decision_persistence_policies');

-- 26
select ok(not pg_catalog.has_table_privilege('anon', 'audit.authorization_decision_persistence_policies', 'SELECT') and not pg_catalog.has_table_privilege('anon', 'audit.authorization_decision_persistence_policies', 'INSERT') and not pg_catalog.has_table_privilege('anon', 'audit.authorization_decision_persistence_policies', 'UPDATE') and not pg_catalog.has_table_privilege('anon', 'audit.authorization_decision_persistence_policies', 'DELETE'), 'anon has zero direct DML on audit.authorization_decision_persistence_policies');

-- 27
select ok(not pg_catalog.has_table_privilege('authenticated', 'audit.authorization_decision_persistence_policies', 'SELECT') and not pg_catalog.has_table_privilege('authenticated', 'audit.authorization_decision_persistence_policies', 'INSERT') and not pg_catalog.has_table_privilege('authenticated', 'audit.authorization_decision_persistence_policies', 'UPDATE') and not pg_catalog.has_table_privilege('authenticated', 'audit.authorization_decision_persistence_policies', 'DELETE'), 'authenticated has zero direct DML on audit.authorization_decision_persistence_policies');

-- 28
select ok(not pg_catalog.has_table_privilege('service_role', 'audit.authorization_decision_persistence_policies', 'SELECT') and not pg_catalog.has_table_privilege('service_role', 'audit.authorization_decision_persistence_policies', 'INSERT') and not pg_catalog.has_table_privilege('service_role', 'audit.authorization_decision_persistence_policies', 'UPDATE') and not pg_catalog.has_table_privilege('service_role', 'audit.authorization_decision_persistence_policies', 'DELETE'), 'service_role has zero direct DML on audit.authorization_decision_persistence_policies');

-- 29
select ok(not pg_catalog.has_table_privilege('public', 'audit.authorization_decisions', 'SELECT') and not pg_catalog.has_table_privilege('public', 'audit.authorization_decisions', 'INSERT') and not pg_catalog.has_table_privilege('public', 'audit.authorization_decisions', 'UPDATE') and not pg_catalog.has_table_privilege('public', 'audit.authorization_decisions', 'DELETE'), 'public has zero direct DML on audit.authorization_decisions');

-- 30
select ok(not pg_catalog.has_table_privilege('anon', 'audit.authorization_decisions', 'SELECT') and not pg_catalog.has_table_privilege('anon', 'audit.authorization_decisions', 'INSERT') and not pg_catalog.has_table_privilege('anon', 'audit.authorization_decisions', 'UPDATE') and not pg_catalog.has_table_privilege('anon', 'audit.authorization_decisions', 'DELETE'), 'anon has zero direct DML on audit.authorization_decisions');

-- 31
select ok(not pg_catalog.has_table_privilege('authenticated', 'audit.authorization_decisions', 'SELECT') and not pg_catalog.has_table_privilege('authenticated', 'audit.authorization_decisions', 'INSERT') and not pg_catalog.has_table_privilege('authenticated', 'audit.authorization_decisions', 'UPDATE') and not pg_catalog.has_table_privilege('authenticated', 'audit.authorization_decisions', 'DELETE'), 'authenticated has zero direct DML on audit.authorization_decisions');

-- 32
select ok(not pg_catalog.has_table_privilege('service_role', 'audit.authorization_decisions', 'SELECT') and not pg_catalog.has_table_privilege('service_role', 'audit.authorization_decisions', 'INSERT') and not pg_catalog.has_table_privilege('service_role', 'audit.authorization_decisions', 'UPDATE') and not pg_catalog.has_table_privilege('service_role', 'audit.authorization_decisions', 'DELETE'), 'service_role has zero direct DML on audit.authorization_decisions');

-- 33
select ok(not pg_catalog.has_table_privilege('public', 'audit.authorization_decision_resources', 'SELECT') and not pg_catalog.has_table_privilege('public', 'audit.authorization_decision_resources', 'INSERT') and not pg_catalog.has_table_privilege('public', 'audit.authorization_decision_resources', 'UPDATE') and not pg_catalog.has_table_privilege('public', 'audit.authorization_decision_resources', 'DELETE'), 'public has zero direct DML on audit.authorization_decision_resources');

-- 34
select ok(not pg_catalog.has_table_privilege('anon', 'audit.authorization_decision_resources', 'SELECT') and not pg_catalog.has_table_privilege('anon', 'audit.authorization_decision_resources', 'INSERT') and not pg_catalog.has_table_privilege('anon', 'audit.authorization_decision_resources', 'UPDATE') and not pg_catalog.has_table_privilege('anon', 'audit.authorization_decision_resources', 'DELETE'), 'anon has zero direct DML on audit.authorization_decision_resources');

-- 35
select ok(not pg_catalog.has_table_privilege('authenticated', 'audit.authorization_decision_resources', 'SELECT') and not pg_catalog.has_table_privilege('authenticated', 'audit.authorization_decision_resources', 'INSERT') and not pg_catalog.has_table_privilege('authenticated', 'audit.authorization_decision_resources', 'UPDATE') and not pg_catalog.has_table_privilege('authenticated', 'audit.authorization_decision_resources', 'DELETE'), 'authenticated has zero direct DML on audit.authorization_decision_resources');

-- 36
select ok(not pg_catalog.has_table_privilege('service_role', 'audit.authorization_decision_resources', 'SELECT') and not pg_catalog.has_table_privilege('service_role', 'audit.authorization_decision_resources', 'INSERT') and not pg_catalog.has_table_privilege('service_role', 'audit.authorization_decision_resources', 'UPDATE') and not pg_catalog.has_table_privilege('service_role', 'audit.authorization_decision_resources', 'DELETE'), 'service_role has zero direct DML on audit.authorization_decision_resources');

-- 37
select ok(not pg_catalog.has_table_privilege('public', 'audit.authorization_decision_links', 'SELECT') and not pg_catalog.has_table_privilege('public', 'audit.authorization_decision_links', 'INSERT') and not pg_catalog.has_table_privilege('public', 'audit.authorization_decision_links', 'UPDATE') and not pg_catalog.has_table_privilege('public', 'audit.authorization_decision_links', 'DELETE'), 'public has zero direct DML on audit.authorization_decision_links');

-- 38
select ok(not pg_catalog.has_table_privilege('anon', 'audit.authorization_decision_links', 'SELECT') and not pg_catalog.has_table_privilege('anon', 'audit.authorization_decision_links', 'INSERT') and not pg_catalog.has_table_privilege('anon', 'audit.authorization_decision_links', 'UPDATE') and not pg_catalog.has_table_privilege('anon', 'audit.authorization_decision_links', 'DELETE'), 'anon has zero direct DML on audit.authorization_decision_links');

-- 39
select ok(not pg_catalog.has_table_privilege('authenticated', 'audit.authorization_decision_links', 'SELECT') and not pg_catalog.has_table_privilege('authenticated', 'audit.authorization_decision_links', 'INSERT') and not pg_catalog.has_table_privilege('authenticated', 'audit.authorization_decision_links', 'UPDATE') and not pg_catalog.has_table_privilege('authenticated', 'audit.authorization_decision_links', 'DELETE'), 'authenticated has zero direct DML on audit.authorization_decision_links');

-- 40
select ok(not pg_catalog.has_table_privilege('service_role', 'audit.authorization_decision_links', 'SELECT') and not pg_catalog.has_table_privilege('service_role', 'audit.authorization_decision_links', 'INSERT') and not pg_catalog.has_table_privilege('service_role', 'audit.authorization_decision_links', 'UPDATE') and not pg_catalog.has_table_privilege('service_role', 'audit.authorization_decision_links', 'DELETE'), 'service_role has zero direct DML on audit.authorization_decision_links');

-- 41
select ok(not pg_catalog.has_table_privilege('public', 'audit.authorization_evaluation_failures', 'SELECT') and not pg_catalog.has_table_privilege('public', 'audit.authorization_evaluation_failures', 'INSERT') and not pg_catalog.has_table_privilege('public', 'audit.authorization_evaluation_failures', 'UPDATE') and not pg_catalog.has_table_privilege('public', 'audit.authorization_evaluation_failures', 'DELETE'), 'public has zero direct DML on audit.authorization_evaluation_failures');

-- 42
select ok(not pg_catalog.has_table_privilege('anon', 'audit.authorization_evaluation_failures', 'SELECT') and not pg_catalog.has_table_privilege('anon', 'audit.authorization_evaluation_failures', 'INSERT') and not pg_catalog.has_table_privilege('anon', 'audit.authorization_evaluation_failures', 'UPDATE') and not pg_catalog.has_table_privilege('anon', 'audit.authorization_evaluation_failures', 'DELETE'), 'anon has zero direct DML on audit.authorization_evaluation_failures');

-- 43
select ok(not pg_catalog.has_table_privilege('authenticated', 'audit.authorization_evaluation_failures', 'SELECT') and not pg_catalog.has_table_privilege('authenticated', 'audit.authorization_evaluation_failures', 'INSERT') and not pg_catalog.has_table_privilege('authenticated', 'audit.authorization_evaluation_failures', 'UPDATE') and not pg_catalog.has_table_privilege('authenticated', 'audit.authorization_evaluation_failures', 'DELETE'), 'authenticated has zero direct DML on audit.authorization_evaluation_failures');

-- 44
select ok(not pg_catalog.has_table_privilege('service_role', 'audit.authorization_evaluation_failures', 'SELECT') and not pg_catalog.has_table_privilege('service_role', 'audit.authorization_evaluation_failures', 'INSERT') and not pg_catalog.has_table_privilege('service_role', 'audit.authorization_evaluation_failures', 'UPDATE') and not pg_catalog.has_table_privilege('service_role', 'audit.authorization_evaluation_failures', 'DELETE'), 'service_role has zero direct DML on audit.authorization_evaluation_failures');

-- 45
select ok(not pg_catalog.has_table_privilege('public', 'audit.authorization_evaluation_failure_attempts', 'SELECT') and not pg_catalog.has_table_privilege('public', 'audit.authorization_evaluation_failure_attempts', 'INSERT') and not pg_catalog.has_table_privilege('public', 'audit.authorization_evaluation_failure_attempts', 'UPDATE') and not pg_catalog.has_table_privilege('public', 'audit.authorization_evaluation_failure_attempts', 'DELETE'), 'public has zero direct DML on audit.authorization_evaluation_failure_attempts');

-- 46
select ok(not pg_catalog.has_table_privilege('anon', 'audit.authorization_evaluation_failure_attempts', 'SELECT') and not pg_catalog.has_table_privilege('anon', 'audit.authorization_evaluation_failure_attempts', 'INSERT') and not pg_catalog.has_table_privilege('anon', 'audit.authorization_evaluation_failure_attempts', 'UPDATE') and not pg_catalog.has_table_privilege('anon', 'audit.authorization_evaluation_failure_attempts', 'DELETE'), 'anon has zero direct DML on audit.authorization_evaluation_failure_attempts');

-- 47
select ok(not pg_catalog.has_table_privilege('authenticated', 'audit.authorization_evaluation_failure_attempts', 'SELECT') and not pg_catalog.has_table_privilege('authenticated', 'audit.authorization_evaluation_failure_attempts', 'INSERT') and not pg_catalog.has_table_privilege('authenticated', 'audit.authorization_evaluation_failure_attempts', 'UPDATE') and not pg_catalog.has_table_privilege('authenticated', 'audit.authorization_evaluation_failure_attempts', 'DELETE'), 'authenticated has zero direct DML on audit.authorization_evaluation_failure_attempts');

-- 48
select ok(not pg_catalog.has_table_privilege('service_role', 'audit.authorization_evaluation_failure_attempts', 'SELECT') and not pg_catalog.has_table_privilege('service_role', 'audit.authorization_evaluation_failure_attempts', 'INSERT') and not pg_catalog.has_table_privilege('service_role', 'audit.authorization_evaluation_failure_attempts', 'UPDATE') and not pg_catalog.has_table_privilege('service_role', 'audit.authorization_evaluation_failure_attempts', 'DELETE'), 'service_role has zero direct DML on audit.authorization_evaluation_failure_attempts');

-- 49
select ok(exists(select 1 from pg_catalog.pg_attribute a where a.attrelid='audit.authorization_decision_persistence_policies'::regclass and a.attname='policy_version' and a.attnum>0 and not a.attisdropped), 'audit.authorization_decision_persistence_policies.policy_version exists');

-- 50
select ok(exists(select 1 from pg_catalog.pg_attribute a where a.attrelid='audit.authorization_decision_persistence_policies'::regclass and a.attname='category' and a.attnum>0 and not a.attisdropped), 'audit.authorization_decision_persistence_policies.category exists');

-- 51
select ok(exists(select 1 from pg_catalog.pg_attribute a where a.attrelid='audit.authorization_decision_persistence_policies'::regclass and a.attname='evidence_storage_mode' and a.attnum>0 and not a.attisdropped), 'audit.authorization_decision_persistence_policies.evidence_storage_mode exists');

-- 52
select ok(exists(select 1 from pg_catalog.pg_attribute a where a.attrelid='audit.authorization_decision_persistence_policies'::regclass and a.attname='sensitivity_floor' and a.attnum>0 and not a.attisdropped), 'audit.authorization_decision_persistence_policies.sensitivity_floor exists');

-- 53
select ok(exists(select 1 from pg_catalog.pg_attribute a where a.attrelid='audit.authorization_decision_persistence_policies'::regclass and a.attname='retention_class' and a.attnum>0 and not a.attisdropped), 'audit.authorization_decision_persistence_policies.retention_class exists');

-- 54
select ok(exists(select 1 from pg_catalog.pg_attribute a where a.attrelid='audit.authorization_decision_persistence_policies'::regclass and a.attname='source_contract_fingerprint' and a.attnum>0 and not a.attisdropped), 'audit.authorization_decision_persistence_policies.source_contract_fingerprint exists');

-- 55
select ok(exists(select 1 from pg_catalog.pg_attribute a where a.attrelid='audit.authorization_decision_persistence_policies'::regclass and a.attname='status' and a.attnum>0 and not a.attisdropped), 'audit.authorization_decision_persistence_policies.status exists');

-- 56
select ok(exists(select 1 from pg_catalog.pg_attribute a where a.attrelid='audit.authorization_decision_persistence_policies'::regclass and a.attname='activated_at' and a.attnum>0 and not a.attisdropped), 'audit.authorization_decision_persistence_policies.activated_at exists');

-- 57
select ok(exists(select 1 from pg_catalog.pg_attribute a where a.attrelid='audit.authorization_decision_persistence_policies'::regclass and a.attname='superseded_at' and a.attnum>0 and not a.attisdropped), 'audit.authorization_decision_persistence_policies.superseded_at exists');

-- 58
select ok(exists(select 1 from pg_catalog.pg_attribute a where a.attrelid='audit.authorization_decision_persistence_policies'::regclass and a.attname='installed_at' and a.attnum>0 and not a.attisdropped), 'audit.authorization_decision_persistence_policies.installed_at exists');

-- 59
select ok(exists(select 1 from pg_catalog.pg_attribute a where a.attrelid='audit.authorization_decisions'::regclass and a.attname='decision_id' and a.attnum>0 and not a.attisdropped), 'audit.authorization_decisions.decision_id exists');

-- 60
select ok(exists(select 1 from pg_catalog.pg_attribute a where a.attrelid='audit.authorization_decisions'::regclass and a.attname='decision_contract_version' and a.attnum>0 and not a.attisdropped), 'audit.authorization_decisions.decision_contract_version exists');

-- 61
select ok(exists(select 1 from pg_catalog.pg_attribute a where a.attrelid='audit.authorization_decisions'::regclass and a.attname='decision_schema_version' and a.attnum>0 and not a.attisdropped), 'audit.authorization_decisions.decision_schema_version exists');

-- 62
select ok(exists(select 1 from pg_catalog.pg_attribute a where a.attrelid='audit.authorization_decisions'::regclass and a.attname='decision_record_fingerprint' and a.attnum>0 and not a.attisdropped), 'audit.authorization_decisions.decision_record_fingerprint exists');

-- 63
select ok(exists(select 1 from pg_catalog.pg_attribute a where a.attrelid='audit.authorization_decisions'::regclass and a.attname='decided_at' and a.attnum>0 and not a.attisdropped), 'audit.authorization_decisions.decided_at exists');

-- 64
select ok(exists(select 1 from pg_catalog.pg_attribute a where a.attrelid='audit.authorization_decisions'::regclass and a.attname='recorded_at' and a.attnum>0 and not a.attisdropped), 'audit.authorization_decisions.recorded_at exists');

-- 65
select ok(exists(select 1 from pg_catalog.pg_attribute a where a.attrelid='audit.authorization_decisions'::regclass and a.attname='correlation_id' and a.attnum>0 and not a.attisdropped), 'audit.authorization_decisions.correlation_id exists');

-- 66
select ok(exists(select 1 from pg_catalog.pg_attribute a where a.attrelid='audit.authorization_decisions'::regclass and a.attname='context_id' and a.attnum>0 and not a.attisdropped), 'audit.authorization_decisions.context_id exists');

-- 67
select ok(exists(select 1 from pg_catalog.pg_attribute a where a.attrelid='audit.authorization_decisions'::regclass and a.attname='principal_id' and a.attnum>0 and not a.attisdropped), 'audit.authorization_decisions.principal_id exists');

-- 68
select ok(exists(select 1 from pg_catalog.pg_attribute a where a.attrelid='audit.authorization_decisions'::regclass and a.attname='actor_id' and a.attnum>0 and not a.attisdropped), 'audit.authorization_decisions.actor_id exists');

-- 69
select ok(exists(select 1 from pg_catalog.pg_attribute a where a.attrelid='audit.authorization_decisions'::regclass and a.attname='device_id' and a.attnum>0 and not a.attisdropped), 'audit.authorization_decisions.device_id exists');

-- 70
select ok(exists(select 1 from pg_catalog.pg_attribute a where a.attrelid='audit.authorization_decisions'::regclass and a.attname='app_code' and a.attnum>0 and not a.attisdropped), 'audit.authorization_decisions.app_code exists');

-- 71
select ok(exists(select 1 from pg_catalog.pg_attribute a where a.attrelid='audit.authorization_decisions'::regclass and a.attname='permission_key' and a.attnum>0 and not a.attisdropped), 'audit.authorization_decisions.permission_key exists');

-- 72
select ok(exists(select 1 from pg_catalog.pg_attribute a where a.attrelid='audit.authorization_decisions'::regclass and a.attname='operation_kind' and a.attnum>0 and not a.attisdropped), 'audit.authorization_decisions.operation_kind exists');

-- 73
select ok(exists(select 1 from pg_catalog.pg_attribute a where a.attrelid='audit.authorization_decisions'::regclass and a.attname='request_source' and a.attnum>0 and not a.attisdropped), 'audit.authorization_decisions.request_source exists');

-- 74
select ok(exists(select 1 from pg_catalog.pg_attribute a where a.attrelid='audit.authorization_decisions'::regclass and a.attname='resource_type' and a.attnum>0 and not a.attisdropped), 'audit.authorization_decisions.resource_type exists');

-- 75
select ok(exists(select 1 from pg_catalog.pg_attribute a where a.attrelid='audit.authorization_decisions'::regclass and a.attname='resource_ids' and a.attnum>0 and not a.attisdropped), 'audit.authorization_decisions.resource_ids exists');

-- 76
select ok(exists(select 1 from pg_catalog.pg_attribute a where a.attrelid='audit.authorization_decisions'::regclass and a.attname='outcome' and a.attnum>0 and not a.attisdropped), 'audit.authorization_decisions.outcome exists');

-- 77
select ok(exists(select 1 from pg_catalog.pg_attribute a where a.attrelid='audit.authorization_decisions'::regclass and a.attname='authorizing_lanes' and a.attnum>0 and not a.attisdropped), 'audit.authorization_decisions.authorizing_lanes exists');

-- 78
select ok(exists(select 1 from pg_catalog.pg_attribute a where a.attrelid='audit.authorization_decisions'::regclass and a.attname='authorization_reason_codes' and a.attnum>0 and not a.attisdropped), 'audit.authorization_decisions.authorization_reason_codes exists');

-- 79
select ok(exists(select 1 from pg_catalog.pg_attribute a where a.attrelid='audit.authorization_decisions'::regclass and a.attname='context_fingerprint' and a.attnum>0 and not a.attisdropped), 'audit.authorization_decisions.context_fingerprint exists');

-- 80
select ok(exists(select 1 from pg_catalog.pg_attribute a where a.attrelid='audit.authorization_decisions'::regclass and a.attname='resource_fingerprint' and a.attnum>0 and not a.attisdropped), 'audit.authorization_decisions.resource_fingerprint exists');

-- 81
select ok(exists(select 1 from pg_catalog.pg_attribute a where a.attrelid='audit.authorization_decisions'::regclass and a.attname='catalog_hash' and a.attnum>0 and not a.attisdropped), 'audit.authorization_decisions.catalog_hash exists');

-- 82
select ok(exists(select 1 from pg_catalog.pg_attribute a where a.attrelid='audit.authorization_decisions'::regclass and a.attname='dataset_hashes' and a.attnum>0 and not a.attisdropped), 'audit.authorization_decisions.dataset_hashes exists');

-- 83
select ok(exists(select 1 from pg_catalog.pg_attribute a where a.attrelid='audit.authorization_decisions'::regclass and a.attname='evaluator_name' and a.attnum>0 and not a.attisdropped), 'audit.authorization_decisions.evaluator_name exists');

-- 84
select ok(exists(select 1 from pg_catalog.pg_attribute a where a.attrelid='audit.authorization_decisions'::regclass and a.attname='evaluator_version' and a.attnum>0 and not a.attisdropped), 'audit.authorization_decisions.evaluator_version exists');

-- 85
select ok(exists(select 1 from pg_catalog.pg_attribute a where a.attrelid='audit.authorization_decisions'::regclass and a.attname='evidence_storage_mode' and a.attnum>0 and not a.attisdropped), 'audit.authorization_decisions.evidence_storage_mode exists');

-- 86
select ok(exists(select 1 from pg_catalog.pg_attribute a where a.attrelid='audit.authorization_decisions'::regclass and a.attname='decision_payload' and a.attnum>0 and not a.attisdropped), 'audit.authorization_decisions.decision_payload exists');

-- 87
select ok(exists(select 1 from pg_catalog.pg_attribute a where a.attrelid='audit.authorization_decisions'::regclass and a.attname='sensitivity_class' and a.attnum>0 and not a.attisdropped), 'audit.authorization_decisions.sensitivity_class exists');

-- 88
select ok(exists(select 1 from pg_catalog.pg_attribute a where a.attrelid='audit.authorization_decisions'::regclass and a.attname='retention_class' and a.attnum>0 and not a.attisdropped), 'audit.authorization_decisions.retention_class exists');

-- 89
select ok(exists(select 1 from pg_catalog.pg_attribute a where a.attrelid='audit.authorization_decisions'::regclass and a.attname='source_contract_sha256' and a.attnum>0 and not a.attisdropped), 'audit.authorization_decisions.source_contract_sha256 exists');

-- 90
select ok(exists(select 1 from pg_catalog.pg_attribute a where a.attrelid='audit.authorization_decision_resources'::regclass and a.attname='decision_id' and a.attnum>0 and not a.attisdropped), 'audit.authorization_decision_resources.decision_id exists');

-- 91
select ok(exists(select 1 from pg_catalog.pg_attribute a where a.attrelid='audit.authorization_decision_resources'::regclass and a.attname='resource_ordinal' and a.attnum>0 and not a.attisdropped), 'audit.authorization_decision_resources.resource_ordinal exists');

-- 92
select ok(exists(select 1 from pg_catalog.pg_attribute a where a.attrelid='audit.authorization_decision_resources'::regclass and a.attname='resource_type' and a.attnum>0 and not a.attisdropped), 'audit.authorization_decision_resources.resource_type exists');

-- 93
select ok(exists(select 1 from pg_catalog.pg_attribute a where a.attrelid='audit.authorization_decision_resources'::regclass and a.attname='resource_id' and a.attnum>0 and not a.attisdropped), 'audit.authorization_decision_resources.resource_id exists');

-- 94
select ok(exists(select 1 from pg_catalog.pg_attribute a where a.attrelid='audit.authorization_decision_resources'::regclass and a.attname='resource_fingerprint' and a.attnum>0 and not a.attisdropped), 'audit.authorization_decision_resources.resource_fingerprint exists');

-- 95
select ok(exists(select 1 from pg_catalog.pg_attribute a where a.attrelid='audit.authorization_decision_resources'::regclass and a.attname='decided_at' and a.attnum>0 and not a.attisdropped), 'audit.authorization_decision_resources.decided_at exists');

-- 96
select ok(exists(select 1 from pg_catalog.pg_attribute a where a.attrelid='audit.authorization_decision_resources'::regclass and a.attname='recorded_at' and a.attnum>0 and not a.attisdropped), 'audit.authorization_decision_resources.recorded_at exists');

-- 97
select ok(exists(select 1 from pg_catalog.pg_attribute a where a.attrelid='audit.authorization_decision_resources'::regclass and a.attname='link_fingerprint' and a.attnum>0 and not a.attisdropped), 'audit.authorization_decision_resources.link_fingerprint exists');

-- 98
select ok(exists(select 1 from pg_catalog.pg_attribute a where a.attrelid='audit.authorization_decision_links'::regclass and a.attname='decision_link_id' and a.attnum>0 and not a.attisdropped), 'audit.authorization_decision_links.decision_link_id exists');

-- 99
select ok(exists(select 1 from pg_catalog.pg_attribute a where a.attrelid='audit.authorization_decision_links'::regclass and a.attname='decision_id' and a.attnum>0 and not a.attisdropped), 'audit.authorization_decision_links.decision_id exists');

-- 100
select ok(exists(select 1 from pg_catalog.pg_attribute a where a.attrelid='audit.authorization_decision_links'::regclass and a.attname='link_kind' and a.attnum>0 and not a.attisdropped), 'audit.authorization_decision_links.link_kind exists');

-- 101
select ok(exists(select 1 from pg_catalog.pg_attribute a where a.attrelid='audit.authorization_decision_links'::regclass and a.attname='reference_type' and a.attnum>0 and not a.attisdropped), 'audit.authorization_decision_links.reference_type exists');

-- 102
select ok(exists(select 1 from pg_catalog.pg_attribute a where a.attrelid='audit.authorization_decision_links'::regclass and a.attname='reference_id' and a.attnum>0 and not a.attisdropped), 'audit.authorization_decision_links.reference_id exists');

-- 103
select ok(exists(select 1 from pg_catalog.pg_attribute a where a.attrelid='audit.authorization_decision_links'::regclass and a.attname='process_id' and a.attnum>0 and not a.attisdropped), 'audit.authorization_decision_links.process_id exists');

-- 104
select ok(exists(select 1 from pg_catalog.pg_attribute a where a.attrelid='audit.authorization_decision_links'::regclass and a.attname='process_instance_id' and a.attnum>0 and not a.attisdropped), 'audit.authorization_decision_links.process_instance_id exists');

-- 105
select ok(exists(select 1 from pg_catalog.pg_attribute a where a.attrelid='audit.authorization_decision_links'::regclass and a.attname='correlation_id' and a.attnum>0 and not a.attisdropped), 'audit.authorization_decision_links.correlation_id exists');

-- 106
select ok(exists(select 1 from pg_catalog.pg_attribute a where a.attrelid='audit.authorization_decision_links'::regclass and a.attname='causation_id' and a.attnum>0 and not a.attisdropped), 'audit.authorization_decision_links.causation_id exists');

-- 107
select ok(exists(select 1 from pg_catalog.pg_attribute a where a.attrelid='audit.authorization_decision_links'::regclass and a.attname='occurred_at' and a.attnum>0 and not a.attisdropped), 'audit.authorization_decision_links.occurred_at exists');

-- 108
select ok(exists(select 1 from pg_catalog.pg_attribute a where a.attrelid='audit.authorization_decision_links'::regclass and a.attname='recorded_at' and a.attnum>0 and not a.attisdropped), 'audit.authorization_decision_links.recorded_at exists');

-- 109
select ok(exists(select 1 from pg_catalog.pg_attribute a where a.attrelid='audit.authorization_decision_links'::regclass and a.attname='result_code' and a.attnum>0 and not a.attisdropped), 'audit.authorization_decision_links.result_code exists');

-- 110
select ok(exists(select 1 from pg_catalog.pg_attribute a where a.attrelid='audit.authorization_decision_links'::regclass and a.attname='result_reference' and a.attnum>0 and not a.attisdropped), 'audit.authorization_decision_links.result_reference exists');

-- 111
select ok(exists(select 1 from pg_catalog.pg_attribute a where a.attrelid='audit.authorization_decision_links'::regclass and a.attname='error_class' and a.attnum>0 and not a.attisdropped), 'audit.authorization_decision_links.error_class exists');

-- 112
select ok(exists(select 1 from pg_catalog.pg_attribute a where a.attrelid='audit.authorization_decision_links'::regclass and a.attname='expected_resource_version' and a.attnum>0 and not a.attisdropped), 'audit.authorization_decision_links.expected_resource_version exists');

-- 113
select ok(exists(select 1 from pg_catalog.pg_attribute a where a.attrelid='audit.authorization_decision_links'::regclass and a.attname='observed_resource_version' and a.attnum>0 and not a.attisdropped), 'audit.authorization_decision_links.observed_resource_version exists');

-- 114
select ok(exists(select 1 from pg_catalog.pg_attribute a where a.attrelid='audit.authorization_decision_links'::regclass and a.attname='idempotency_key_reference' and a.attnum>0 and not a.attisdropped), 'audit.authorization_decision_links.idempotency_key_reference exists');

-- 115
select ok(exists(select 1 from pg_catalog.pg_attribute a where a.attrelid='audit.authorization_decision_links'::regclass and a.attname='link_fingerprint' and a.attnum>0 and not a.attisdropped), 'audit.authorization_decision_links.link_fingerprint exists');

-- 116
select ok(exists(select 1 from pg_catalog.pg_attribute a where a.attrelid='audit.authorization_evaluation_failures'::regclass and a.attname='evaluation_attempt_id' and a.attnum>0 and not a.attisdropped), 'audit.authorization_evaluation_failures.evaluation_attempt_id exists');

-- 117
select ok(exists(select 1 from pg_catalog.pg_attribute a where a.attrelid='audit.authorization_evaluation_failures'::regclass and a.attname='correlation_id' and a.attnum>0 and not a.attisdropped), 'audit.authorization_evaluation_failures.correlation_id exists');

-- 118
select ok(exists(select 1 from pg_catalog.pg_attribute a where a.attrelid='audit.authorization_evaluation_failures'::regclass and a.attname='support_code' and a.attnum>0 and not a.attisdropped), 'audit.authorization_evaluation_failures.support_code exists');

-- 119
select ok(exists(select 1 from pg_catalog.pg_attribute a where a.attrelid='audit.authorization_evaluation_failures'::regclass and a.attname='request_source' and a.attnum>0 and not a.attisdropped), 'audit.authorization_evaluation_failures.request_source exists');

-- 120
select ok(exists(select 1 from pg_catalog.pg_attribute a where a.attrelid='audit.authorization_evaluation_failures'::regclass and a.attname='consumer_id' and a.attnum>0 and not a.attisdropped), 'audit.authorization_evaluation_failures.consumer_id exists');

-- 121
select ok(exists(select 1 from pg_catalog.pg_attribute a where a.attrelid='audit.authorization_evaluation_failures'::regclass and a.attname='app_code' and a.attnum>0 and not a.attisdropped), 'audit.authorization_evaluation_failures.app_code exists');

-- 122
select ok(exists(select 1 from pg_catalog.pg_attribute a where a.attrelid='audit.authorization_evaluation_failures'::regclass and a.attname='permission_key' and a.attnum>0 and not a.attisdropped), 'audit.authorization_evaluation_failures.permission_key exists');

-- 123
select ok(exists(select 1 from pg_catalog.pg_attribute a where a.attrelid='audit.authorization_evaluation_failures'::regclass and a.attname='operation_kind' and a.attnum>0 and not a.attisdropped), 'audit.authorization_evaluation_failures.operation_kind exists');

-- 124
select ok(exists(select 1 from pg_catalog.pg_attribute a where a.attrelid='audit.authorization_evaluation_failures'::regclass and a.attname='failure_stage' and a.attnum>0 and not a.attisdropped), 'audit.authorization_evaluation_failures.failure_stage exists');

-- 125
select ok(exists(select 1 from pg_catalog.pg_attribute a where a.attrelid='audit.authorization_evaluation_failures'::regclass and a.attname='private_failure_family' and a.attnum>0 and not a.attisdropped), 'audit.authorization_evaluation_failures.private_failure_family exists');

-- 126
select ok(exists(select 1 from pg_catalog.pg_attribute a where a.attrelid='audit.authorization_evaluation_failures'::regclass and a.attname='sanitized_provider_code' and a.attnum>0 and not a.attisdropped), 'audit.authorization_evaluation_failures.sanitized_provider_code exists');

-- 127
select ok(exists(select 1 from pg_catalog.pg_attribute a where a.attrelid='audit.authorization_evaluation_failures'::regclass and a.attname='source_status' and a.attnum>0 and not a.attisdropped), 'audit.authorization_evaluation_failures.source_status exists');

-- 128
select ok(exists(select 1 from pg_catalog.pg_attribute a where a.attrelid='audit.authorization_evaluation_failures'::regclass and a.attname='retry_count' and a.attnum>0 and not a.attisdropped), 'audit.authorization_evaluation_failures.retry_count exists');

-- 129
select ok(exists(select 1 from pg_catalog.pg_attribute a where a.attrelid='audit.authorization_evaluation_failures'::regclass and a.attname='retry_budget' and a.attnum>0 and not a.attisdropped), 'audit.authorization_evaluation_failures.retry_budget exists');

-- 130
select ok(exists(select 1 from pg_catalog.pg_attribute a where a.attrelid='audit.authorization_evaluation_failures'::regclass and a.attname='duration_ms' and a.attnum>0 and not a.attisdropped), 'audit.authorization_evaluation_failures.duration_ms exists');

-- 131
select ok(exists(select 1 from pg_catalog.pg_attribute a where a.attrelid='audit.authorization_evaluation_failures'::regclass and a.attname='source_versions' and a.attnum>0 and not a.attisdropped), 'audit.authorization_evaluation_failures.source_versions exists');

-- 132
select ok(exists(select 1 from pg_catalog.pg_attribute a where a.attrelid='audit.authorization_evaluation_failures'::regclass and a.attname='source_fingerprints' and a.attnum>0 and not a.attisdropped), 'audit.authorization_evaluation_failures.source_fingerprints exists');

-- 133
select ok(exists(select 1 from pg_catalog.pg_attribute a where a.attrelid='audit.authorization_evaluation_failures'::regclass and a.attname='session_preserved' and a.attnum>0 and not a.attisdropped), 'audit.authorization_evaluation_failures.session_preserved exists');

-- 134
select ok(exists(select 1 from pg_catalog.pg_attribute a where a.attrelid='audit.authorization_evaluation_failures'::regclass and a.attname='effects_committed' and a.attnum>0 and not a.attisdropped), 'audit.authorization_evaluation_failures.effects_committed exists');

-- 135
select ok(exists(select 1 from pg_catalog.pg_attribute a where a.attrelid='audit.authorization_evaluation_failures'::regclass and a.attname='occurred_at' and a.attnum>0 and not a.attisdropped), 'audit.authorization_evaluation_failures.occurred_at exists');

-- 136
select ok(exists(select 1 from pg_catalog.pg_attribute a where a.attrelid='audit.authorization_evaluation_failures'::regclass and a.attname='recorded_at' and a.attnum>0 and not a.attisdropped), 'audit.authorization_evaluation_failures.recorded_at exists');

-- 137
select ok(exists(select 1 from pg_catalog.pg_attribute a where a.attrelid='audit.authorization_evaluation_failures'::regclass and a.attname='failure_fingerprint' and a.attnum>0 and not a.attisdropped), 'audit.authorization_evaluation_failures.failure_fingerprint exists');

-- 138
select ok(exists(select 1 from pg_catalog.pg_attribute a where a.attrelid='audit.authorization_evaluation_failures'::regclass and a.attname='sensitivity_class' and a.attnum>0 and not a.attisdropped), 'audit.authorization_evaluation_failures.sensitivity_class exists');

-- 139
select ok(exists(select 1 from pg_catalog.pg_attribute a where a.attrelid='audit.authorization_evaluation_failures'::regclass and a.attname='retention_class' and a.attnum>0 and not a.attisdropped), 'audit.authorization_evaluation_failures.retention_class exists');

-- 140
select ok(exists(select 1 from pg_catalog.pg_attribute a where a.attrelid='audit.authorization_evaluation_failure_attempts'::regclass and a.attname='evaluation_attempt_id' and a.attnum>0 and not a.attisdropped), 'audit.authorization_evaluation_failure_attempts.evaluation_attempt_id exists');

-- 141
select ok(exists(select 1 from pg_catalog.pg_attribute a where a.attrelid='audit.authorization_evaluation_failure_attempts'::regclass and a.attname='attempt_ordinal' and a.attnum>0 and not a.attisdropped), 'audit.authorization_evaluation_failure_attempts.attempt_ordinal exists');

-- 142
select ok(exists(select 1 from pg_catalog.pg_attribute a where a.attrelid='audit.authorization_evaluation_failure_attempts'::regclass and a.attname='source_key' and a.attnum>0 and not a.attisdropped), 'audit.authorization_evaluation_failure_attempts.source_key exists');

-- 143
select ok(exists(select 1 from pg_catalog.pg_attribute a where a.attrelid='audit.authorization_evaluation_failure_attempts'::regclass and a.attname='started_at' and a.attnum>0 and not a.attisdropped), 'audit.authorization_evaluation_failure_attempts.started_at exists');

-- 144
select ok(exists(select 1 from pg_catalog.pg_attribute a where a.attrelid='audit.authorization_evaluation_failure_attempts'::regclass and a.attname='completed_at' and a.attnum>0 and not a.attisdropped), 'audit.authorization_evaluation_failure_attempts.completed_at exists');

-- 145
select ok(exists(select 1 from pg_catalog.pg_attribute a where a.attrelid='audit.authorization_evaluation_failure_attempts'::regclass and a.attname='duration_ms' and a.attnum>0 and not a.attisdropped), 'audit.authorization_evaluation_failure_attempts.duration_ms exists');

-- 146
select ok(exists(select 1 from pg_catalog.pg_attribute a where a.attrelid='audit.authorization_evaluation_failure_attempts'::regclass and a.attname='sanitized_provider_code' and a.attnum>0 and not a.attisdropped), 'audit.authorization_evaluation_failure_attempts.sanitized_provider_code exists');

-- 147
select ok(exists(select 1 from pg_catalog.pg_attribute a where a.attrelid='audit.authorization_evaluation_failure_attempts'::regclass and a.attname='retryable' and a.attnum>0 and not a.attisdropped), 'audit.authorization_evaluation_failure_attempts.retryable exists');

-- 148
select ok(exists(select 1 from pg_catalog.pg_attribute a where a.attrelid='audit.authorization_evaluation_failure_attempts'::regclass and a.attname='retry_after_seconds' and a.attnum>0 and not a.attisdropped), 'audit.authorization_evaluation_failure_attempts.retry_after_seconds exists');

-- 149
select ok(exists(select 1 from pg_catalog.pg_attribute a where a.attrelid='audit.authorization_evaluation_failure_attempts'::regclass and a.attname='attempt_result' and a.attnum>0 and not a.attisdropped), 'audit.authorization_evaluation_failure_attempts.attempt_result exists');

-- 150
select ok(exists(select 1 from pg_catalog.pg_attribute a where a.attrelid='audit.authorization_evaluation_failure_attempts'::regclass and a.attname='recorded_at' and a.attnum>0 and not a.attisdropped), 'audit.authorization_evaluation_failure_attempts.recorded_at exists');

-- 151
select ok(exists(select 1 from pg_catalog.pg_attribute a where a.attrelid='audit.authorization_evaluation_failure_attempts'::regclass and a.attname='attempt_fingerprint' and a.attnum>0 and not a.attisdropped), 'audit.authorization_evaluation_failure_attempts.attempt_fingerprint exists');

-- 152
select ok(pg_catalog.to_regprocedure('audit.append_authorization_decision(jsonb)') is not null, 'function audit.append_authorization_decision(jsonb) exists');

-- 153
select ok(pg_catalog.to_regprocedure('audit.append_authorization_decision_link(jsonb)') is not null, 'function audit.append_authorization_decision_link(jsonb) exists');

-- 154
select ok(pg_catalog.to_regprocedure('audit.append_authorization_evaluation_failure(jsonb)') is not null, 'function audit.append_authorization_evaluation_failure(jsonb) exists');

-- 155
select ok(pg_catalog.to_regprocedure('audit.append_authorization_evaluation_failure_attempt(jsonb)') is not null, 'function audit.append_authorization_evaluation_failure_attempt(jsonb) exists');

-- 156
select ok(pg_catalog.to_regprocedure('audit.get_authorization_decision(text)') is not null, 'function audit.get_authorization_decision(text) exists');

-- 157
select ok(pg_catalog.to_regprocedure('audit.search_authorization_decisions(jsonb)') is not null, 'function audit.search_authorization_decisions(jsonb) exists');

-- 158
select ok(pg_catalog.to_regprocedure('audit.list_authorization_decision_links(text)') is not null, 'function audit.list_authorization_decision_links(text) exists');

-- 159
select ok(pg_catalog.to_regprocedure('audit.reject_authorization_record_mutation()') is not null, 'function audit.reject_authorization_record_mutation() exists');

-- 160
select ok(pg_catalog.to_regprocedure('app_private.resolve_authorization_persistence_profile(jsonb)') is not null, 'function app_private.resolve_authorization_persistence_profile(jsonb) exists');

-- 161
select ok(pg_catalog.to_regprocedure('app_private.evaluate_and_record_authorization(jsonb)') is not null, 'function app_private.evaluate_and_record_authorization(jsonb) exists');

-- 162
select ok((select p.prosecdef from pg_catalog.pg_proc p where p.oid='audit.append_authorization_decision(jsonb)'::regprocedure), 'function audit.append_authorization_decision(jsonb) SECURITY DEFINER posture is correct');

-- 163
select ok((select p.prosecdef from pg_catalog.pg_proc p where p.oid='audit.append_authorization_decision_link(jsonb)'::regprocedure), 'function audit.append_authorization_decision_link(jsonb) SECURITY DEFINER posture is correct');

-- 164
select ok((select p.prosecdef from pg_catalog.pg_proc p where p.oid='audit.append_authorization_evaluation_failure(jsonb)'::regprocedure), 'function audit.append_authorization_evaluation_failure(jsonb) SECURITY DEFINER posture is correct');

-- 165
select ok((select p.prosecdef from pg_catalog.pg_proc p where p.oid='audit.append_authorization_evaluation_failure_attempt(jsonb)'::regprocedure), 'function audit.append_authorization_evaluation_failure_attempt(jsonb) SECURITY DEFINER posture is correct');

-- 166
select ok(not (select p.prosecdef from pg_catalog.pg_proc p where p.oid='audit.get_authorization_decision(text)'::regprocedure), 'function audit.get_authorization_decision(text) SECURITY DEFINER posture is correct');

-- 167
select ok(not (select p.prosecdef from pg_catalog.pg_proc p where p.oid='audit.search_authorization_decisions(jsonb)'::regprocedure), 'function audit.search_authorization_decisions(jsonb) SECURITY DEFINER posture is correct');

-- 168
select ok(not (select p.prosecdef from pg_catalog.pg_proc p where p.oid='audit.list_authorization_decision_links(text)'::regprocedure), 'function audit.list_authorization_decision_links(text) SECURITY DEFINER posture is correct');

-- 169
select ok(not (select p.prosecdef from pg_catalog.pg_proc p where p.oid='audit.reject_authorization_record_mutation()'::regprocedure), 'function audit.reject_authorization_record_mutation() SECURITY DEFINER posture is correct');

-- 170
select ok(not (select p.prosecdef from pg_catalog.pg_proc p where p.oid='app_private.resolve_authorization_persistence_profile(jsonb)'::regprocedure), 'function app_private.resolve_authorization_persistence_profile(jsonb) SECURITY DEFINER posture is correct');

-- 171
select ok((select p.prosecdef from pg_catalog.pg_proc p where p.oid='app_private.evaluate_and_record_authorization(jsonb)'::regprocedure), 'function app_private.evaluate_and_record_authorization(jsonb) SECURITY DEFINER posture is correct');

-- 172
select is((select pg_catalog.pg_get_userbyid(p.proowner) from pg_catalog.pg_proc p where p.oid='audit.append_authorization_decision(jsonb)'::regprocedure), 'vento_authorization_owner', 'function audit.append_authorization_decision(jsonb) owner is authorization owner');

-- 173
select is((select pg_catalog.pg_get_userbyid(p.proowner) from pg_catalog.pg_proc p where p.oid='audit.append_authorization_decision_link(jsonb)'::regprocedure), 'vento_authorization_owner', 'function audit.append_authorization_decision_link(jsonb) owner is authorization owner');

-- 174
select is((select pg_catalog.pg_get_userbyid(p.proowner) from pg_catalog.pg_proc p where p.oid='audit.append_authorization_evaluation_failure(jsonb)'::regprocedure), 'vento_authorization_owner', 'function audit.append_authorization_evaluation_failure(jsonb) owner is authorization owner');

-- 175
select is((select pg_catalog.pg_get_userbyid(p.proowner) from pg_catalog.pg_proc p where p.oid='audit.append_authorization_evaluation_failure_attempt(jsonb)'::regprocedure), 'vento_authorization_owner', 'function audit.append_authorization_evaluation_failure_attempt(jsonb) owner is authorization owner');

-- 176
select is((select pg_catalog.pg_get_userbyid(p.proowner) from pg_catalog.pg_proc p where p.oid='audit.get_authorization_decision(text)'::regprocedure), 'vento_authorization_owner', 'function audit.get_authorization_decision(text) owner is authorization owner');

-- 177
select is((select pg_catalog.pg_get_userbyid(p.proowner) from pg_catalog.pg_proc p where p.oid='audit.search_authorization_decisions(jsonb)'::regprocedure), 'vento_authorization_owner', 'function audit.search_authorization_decisions(jsonb) owner is authorization owner');

-- 178
select is((select pg_catalog.pg_get_userbyid(p.proowner) from pg_catalog.pg_proc p where p.oid='audit.list_authorization_decision_links(text)'::regprocedure), 'vento_authorization_owner', 'function audit.list_authorization_decision_links(text) owner is authorization owner');

-- 179
select is((select pg_catalog.pg_get_userbyid(p.proowner) from pg_catalog.pg_proc p where p.oid='audit.reject_authorization_record_mutation()'::regprocedure), 'vento_authorization_owner', 'function audit.reject_authorization_record_mutation() owner is authorization owner');

-- 180
select is((select pg_catalog.pg_get_userbyid(p.proowner) from pg_catalog.pg_proc p where p.oid='app_private.resolve_authorization_persistence_profile(jsonb)'::regprocedure), 'vento_authorization_owner', 'function app_private.resolve_authorization_persistence_profile(jsonb) owner is authorization owner');

-- 181
select is((select pg_catalog.pg_get_userbyid(p.proowner) from pg_catalog.pg_proc p where p.oid='app_private.evaluate_and_record_authorization(jsonb)'::regprocedure), 'vento_authorization_owner', 'function app_private.evaluate_and_record_authorization(jsonb) owner is authorization owner');

-- 182
select ok((select p.proconfig @> array['search_path=pg_catalog, audit, app_private']::text[] from pg_catalog.pg_proc p where p.oid='audit.append_authorization_decision(jsonb)'::regprocedure), 'function audit.append_authorization_decision(jsonb) has fixed search_path');

-- 183
select ok((select p.proconfig @> array['search_path=pg_catalog, audit, app_private']::text[] from pg_catalog.pg_proc p where p.oid='audit.append_authorization_decision_link(jsonb)'::regprocedure), 'function audit.append_authorization_decision_link(jsonb) has fixed search_path');

-- 184
select ok((select p.proconfig @> array['search_path=pg_catalog, audit, app_private']::text[] from pg_catalog.pg_proc p where p.oid='audit.append_authorization_evaluation_failure(jsonb)'::regprocedure), 'function audit.append_authorization_evaluation_failure(jsonb) has fixed search_path');

-- 185
select ok((select p.proconfig @> array['search_path=pg_catalog, audit, app_private']::text[] from pg_catalog.pg_proc p where p.oid='audit.append_authorization_evaluation_failure_attempt(jsonb)'::regprocedure), 'function audit.append_authorization_evaluation_failure_attempt(jsonb) has fixed search_path');

-- 186
select ok((select p.proconfig @> array['search_path=pg_catalog, audit']::text[] from pg_catalog.pg_proc p where p.oid='audit.get_authorization_decision(text)'::regprocedure), 'function audit.get_authorization_decision(text) has fixed search_path');

-- 187
select ok((select p.proconfig @> array['search_path=pg_catalog, audit']::text[] from pg_catalog.pg_proc p where p.oid='audit.search_authorization_decisions(jsonb)'::regprocedure), 'function audit.search_authorization_decisions(jsonb) has fixed search_path');

-- 188
select ok((select p.proconfig @> array['search_path=pg_catalog, audit']::text[] from pg_catalog.pg_proc p where p.oid='audit.list_authorization_decision_links(text)'::regprocedure), 'function audit.list_authorization_decision_links(text) has fixed search_path');

-- 189
select ok((select p.proconfig @> array['search_path=pg_catalog, audit']::text[] from pg_catalog.pg_proc p where p.oid='audit.reject_authorization_record_mutation()'::regprocedure), 'function audit.reject_authorization_record_mutation() has fixed search_path');

-- 190
select ok((select p.proconfig @> array['search_path=pg_catalog, app_private, audit']::text[] from pg_catalog.pg_proc p where p.oid='app_private.resolve_authorization_persistence_profile(jsonb)'::regprocedure), 'function app_private.resolve_authorization_persistence_profile(jsonb) has fixed search_path');

-- 191
select ok((select p.proconfig @> array['search_path=pg_catalog, app_private, audit']::text[] from pg_catalog.pg_proc p where p.oid='app_private.evaluate_and_record_authorization(jsonb)'::regprocedure), 'function app_private.evaluate_and_record_authorization(jsonb) has fixed search_path');

-- 192
select ok(not pg_catalog.has_function_privilege('public', 'audit.append_authorization_decision(jsonb)', 'EXECUTE'), 'public cannot execute private audit.append_authorization_decision(jsonb)');

-- 193
select ok(not pg_catalog.has_function_privilege('anon', 'audit.append_authorization_decision(jsonb)', 'EXECUTE'), 'anon cannot execute private audit.append_authorization_decision(jsonb)');

-- 194
select ok(not pg_catalog.has_function_privilege('authenticated', 'audit.append_authorization_decision(jsonb)', 'EXECUTE'), 'authenticated cannot execute private audit.append_authorization_decision(jsonb)');

-- 195
select ok(not pg_catalog.has_function_privilege('service_role', 'audit.append_authorization_decision(jsonb)', 'EXECUTE'), 'service_role cannot execute private audit.append_authorization_decision(jsonb)');

-- 196
select ok(not pg_catalog.has_function_privilege('public', 'audit.append_authorization_decision_link(jsonb)', 'EXECUTE'), 'public cannot execute private audit.append_authorization_decision_link(jsonb)');

-- 197
select ok(not pg_catalog.has_function_privilege('anon', 'audit.append_authorization_decision_link(jsonb)', 'EXECUTE'), 'anon cannot execute private audit.append_authorization_decision_link(jsonb)');

-- 198
select ok(not pg_catalog.has_function_privilege('authenticated', 'audit.append_authorization_decision_link(jsonb)', 'EXECUTE'), 'authenticated cannot execute private audit.append_authorization_decision_link(jsonb)');

-- 199
select ok(not pg_catalog.has_function_privilege('service_role', 'audit.append_authorization_decision_link(jsonb)', 'EXECUTE'), 'service_role cannot execute private audit.append_authorization_decision_link(jsonb)');

-- 200
select ok(not pg_catalog.has_function_privilege('public', 'audit.append_authorization_evaluation_failure(jsonb)', 'EXECUTE'), 'public cannot execute private audit.append_authorization_evaluation_failure(jsonb)');

-- 201
select ok(not pg_catalog.has_function_privilege('anon', 'audit.append_authorization_evaluation_failure(jsonb)', 'EXECUTE'), 'anon cannot execute private audit.append_authorization_evaluation_failure(jsonb)');

-- 202
select ok(not pg_catalog.has_function_privilege('authenticated', 'audit.append_authorization_evaluation_failure(jsonb)', 'EXECUTE'), 'authenticated cannot execute private audit.append_authorization_evaluation_failure(jsonb)');

-- 203
select ok(not pg_catalog.has_function_privilege('service_role', 'audit.append_authorization_evaluation_failure(jsonb)', 'EXECUTE'), 'service_role cannot execute private audit.append_authorization_evaluation_failure(jsonb)');

-- 204
select ok(not pg_catalog.has_function_privilege('public', 'audit.append_authorization_evaluation_failure_attempt(jsonb)', 'EXECUTE'), 'public cannot execute private audit.append_authorization_evaluation_failure_attempt(jsonb)');

-- 205
select ok(not pg_catalog.has_function_privilege('anon', 'audit.append_authorization_evaluation_failure_attempt(jsonb)', 'EXECUTE'), 'anon cannot execute private audit.append_authorization_evaluation_failure_attempt(jsonb)');

-- 206
select ok(not pg_catalog.has_function_privilege('authenticated', 'audit.append_authorization_evaluation_failure_attempt(jsonb)', 'EXECUTE'), 'authenticated cannot execute private audit.append_authorization_evaluation_failure_attempt(jsonb)');

-- 207
select ok(not pg_catalog.has_function_privilege('service_role', 'audit.append_authorization_evaluation_failure_attempt(jsonb)', 'EXECUTE'), 'service_role cannot execute private audit.append_authorization_evaluation_failure_attempt(jsonb)');

-- 208
select ok(not pg_catalog.has_function_privilege('public', 'audit.get_authorization_decision(text)', 'EXECUTE'), 'public cannot execute private audit.get_authorization_decision(text)');

-- 209
select ok(not pg_catalog.has_function_privilege('anon', 'audit.get_authorization_decision(text)', 'EXECUTE'), 'anon cannot execute private audit.get_authorization_decision(text)');

-- 210
select ok(not pg_catalog.has_function_privilege('authenticated', 'audit.get_authorization_decision(text)', 'EXECUTE'), 'authenticated cannot execute private audit.get_authorization_decision(text)');

-- 211
select ok(not pg_catalog.has_function_privilege('service_role', 'audit.get_authorization_decision(text)', 'EXECUTE'), 'service_role cannot execute private audit.get_authorization_decision(text)');

-- 212
select ok(not pg_catalog.has_function_privilege('public', 'audit.search_authorization_decisions(jsonb)', 'EXECUTE'), 'public cannot execute private audit.search_authorization_decisions(jsonb)');

-- 213
select ok(not pg_catalog.has_function_privilege('anon', 'audit.search_authorization_decisions(jsonb)', 'EXECUTE'), 'anon cannot execute private audit.search_authorization_decisions(jsonb)');

-- 214
select ok(not pg_catalog.has_function_privilege('authenticated', 'audit.search_authorization_decisions(jsonb)', 'EXECUTE'), 'authenticated cannot execute private audit.search_authorization_decisions(jsonb)');

-- 215
select ok(not pg_catalog.has_function_privilege('service_role', 'audit.search_authorization_decisions(jsonb)', 'EXECUTE'), 'service_role cannot execute private audit.search_authorization_decisions(jsonb)');

-- 216
select ok(not pg_catalog.has_function_privilege('public', 'audit.list_authorization_decision_links(text)', 'EXECUTE'), 'public cannot execute private audit.list_authorization_decision_links(text)');

-- 217
select ok(not pg_catalog.has_function_privilege('anon', 'audit.list_authorization_decision_links(text)', 'EXECUTE'), 'anon cannot execute private audit.list_authorization_decision_links(text)');

-- 218
select ok(not pg_catalog.has_function_privilege('authenticated', 'audit.list_authorization_decision_links(text)', 'EXECUTE'), 'authenticated cannot execute private audit.list_authorization_decision_links(text)');

-- 219
select ok(not pg_catalog.has_function_privilege('service_role', 'audit.list_authorization_decision_links(text)', 'EXECUTE'), 'service_role cannot execute private audit.list_authorization_decision_links(text)');

-- 220
select ok(not pg_catalog.has_function_privilege('public', 'audit.reject_authorization_record_mutation()', 'EXECUTE'), 'public cannot execute private audit.reject_authorization_record_mutation()');

-- 221
select ok(not pg_catalog.has_function_privilege('anon', 'audit.reject_authorization_record_mutation()', 'EXECUTE'), 'anon cannot execute private audit.reject_authorization_record_mutation()');

-- 222
select ok(not pg_catalog.has_function_privilege('authenticated', 'audit.reject_authorization_record_mutation()', 'EXECUTE'), 'authenticated cannot execute private audit.reject_authorization_record_mutation()');

-- 223
select ok(not pg_catalog.has_function_privilege('service_role', 'audit.reject_authorization_record_mutation()', 'EXECUTE'), 'service_role cannot execute private audit.reject_authorization_record_mutation()');

-- 224
select ok(not pg_catalog.has_function_privilege('public', 'app_private.resolve_authorization_persistence_profile(jsonb)', 'EXECUTE'), 'public cannot execute private app_private.resolve_authorization_persistence_profile(jsonb)');

-- 225
select ok(not pg_catalog.has_function_privilege('anon', 'app_private.resolve_authorization_persistence_profile(jsonb)', 'EXECUTE'), 'anon cannot execute private app_private.resolve_authorization_persistence_profile(jsonb)');

-- 226
select ok(not pg_catalog.has_function_privilege('authenticated', 'app_private.resolve_authorization_persistence_profile(jsonb)', 'EXECUTE'), 'authenticated cannot execute private app_private.resolve_authorization_persistence_profile(jsonb)');

-- 227
select ok(not pg_catalog.has_function_privilege('service_role', 'app_private.resolve_authorization_persistence_profile(jsonb)', 'EXECUTE'), 'service_role cannot execute private app_private.resolve_authorization_persistence_profile(jsonb)');

-- 228
select ok(not pg_catalog.has_function_privilege('public', 'app_private.evaluate_and_record_authorization(jsonb)', 'EXECUTE'), 'public cannot execute private app_private.evaluate_and_record_authorization(jsonb)');

-- 229
select ok(not pg_catalog.has_function_privilege('anon', 'app_private.evaluate_and_record_authorization(jsonb)', 'EXECUTE'), 'anon cannot execute private app_private.evaluate_and_record_authorization(jsonb)');

-- 230
select ok(not pg_catalog.has_function_privilege('authenticated', 'app_private.evaluate_and_record_authorization(jsonb)', 'EXECUTE'), 'authenticated cannot execute private app_private.evaluate_and_record_authorization(jsonb)');

-- 231
select ok(not pg_catalog.has_function_privilege('service_role', 'app_private.evaluate_and_record_authorization(jsonb)', 'EXECUTE'), 'service_role cannot execute private app_private.evaluate_and_record_authorization(jsonb)');

-- 232
select is((select pg_catalog.count(*) from audit.authorization_decision_persistence_policies where status='ACTIVE'), 8::bigint, 'exactly eight persistence categories are active');

-- 233
select is((select p.evidence_storage_mode from audit.authorization_decision_persistence_policies p where p.category='NAVIGATION' and p.status='ACTIVE'), 'AUDIT_ANCHOR', 'NAVIGATION evidence mode is canonical minimum');

-- 234
select is((select p.retention_class from audit.authorization_decision_persistence_policies p where p.category='NAVIGATION' and p.status='ACTIVE'), 'RET_BUSINESS_CYCLE', 'NAVIGATION uses canonical retention class without days');

-- 235
select is((select p.sensitivity_floor from audit.authorization_decision_persistence_policies p where p.category='NAVIGATION' and p.status='ACTIVE'), 'FUNCTIONAL', 'NAVIGATION sensitivity floor is deterministic');

-- 236
select is((select p.evidence_storage_mode from audit.authorization_decision_persistence_policies p where p.category='UI_GUARD' and p.status='ACTIVE'), 'AUDIT_ANCHOR', 'UI_GUARD evidence mode is canonical minimum');

-- 237
select is((select p.retention_class from audit.authorization_decision_persistence_policies p where p.category='UI_GUARD' and p.status='ACTIVE'), 'RET_BUSINESS_CYCLE', 'UI_GUARD uses canonical retention class without days');

-- 238
select is((select p.sensitivity_floor from audit.authorization_decision_persistence_policies p where p.category='UI_GUARD' and p.status='ACTIVE'), 'FUNCTIONAL', 'UI_GUARD sensitivity floor is deterministic');

-- 239
select is((select p.evidence_storage_mode from audit.authorization_decision_persistence_policies p where p.category='ORDINARY_READ' and p.status='ACTIVE'), 'AUDIT_ANCHOR', 'ORDINARY_READ evidence mode is canonical minimum');

-- 240
select is((select p.retention_class from audit.authorization_decision_persistence_policies p where p.category='ORDINARY_READ' and p.status='ACTIVE'), 'RET_BUSINESS_CYCLE', 'ORDINARY_READ uses canonical retention class without days');

-- 241
select is((select p.sensitivity_floor from audit.authorization_decision_persistence_policies p where p.category='ORDINARY_READ' and p.status='ACTIVE'), 'FUNCTIONAL', 'ORDINARY_READ sensitivity floor is deterministic');

-- 242
select is((select p.evidence_storage_mode from audit.authorization_decision_persistence_policies p where p.category='AGGREGATE' and p.status='ACTIVE'), 'AUDIT_ANCHOR', 'AGGREGATE evidence mode is canonical minimum');

-- 243
select is((select p.retention_class from audit.authorization_decision_persistence_policies p where p.category='AGGREGATE' and p.status='ACTIVE'), 'RET_BUSINESS_CYCLE', 'AGGREGATE uses canonical retention class without days');

-- 244
select is((select p.sensitivity_floor from audit.authorization_decision_persistence_policies p where p.category='AGGREGATE' and p.status='ACTIVE'), 'FUNCTIONAL', 'AGGREGATE sensitivity floor is deterministic');

-- 245
select is((select p.evidence_storage_mode from audit.authorization_decision_persistence_policies p where p.category='SENSITIVE_READ' and p.status='ACTIVE'), 'FULL_DECISION', 'SENSITIVE_READ evidence mode is canonical minimum');

-- 246
select is((select p.retention_class from audit.authorization_decision_persistence_policies p where p.category='SENSITIVE_READ' and p.status='ACTIVE'), 'RET_OBLIGATION', 'SENSITIVE_READ uses canonical retention class without days');

-- 247
select is((select p.sensitivity_floor from audit.authorization_decision_persistence_policies p where p.category='SENSITIVE_READ' and p.status='ACTIVE'), 'FUNCTIONAL_SENSITIVE', 'SENSITIVE_READ sensitivity floor is deterministic');

-- 248
select is((select p.evidence_storage_mode from audit.authorization_decision_persistence_policies p where p.category='EXPORT' and p.status='ACTIVE'), 'FULL_DECISION', 'EXPORT evidence mode is canonical minimum');

-- 249
select is((select p.retention_class from audit.authorization_decision_persistence_policies p where p.category='EXPORT' and p.status='ACTIVE'), 'RET_OBLIGATION', 'EXPORT uses canonical retention class without days');

-- 250
select is((select p.sensitivity_floor from audit.authorization_decision_persistence_policies p where p.category='EXPORT' and p.status='ACTIVE'), 'FUNCTIONAL_SENSITIVE', 'EXPORT sensitivity floor is deterministic');

-- 251
select is((select p.evidence_storage_mode from audit.authorization_decision_persistence_policies p where p.category='SUPPORT' and p.status='ACTIVE'), 'FULL_DECISION', 'SUPPORT evidence mode is canonical minimum');

-- 252
select is((select p.retention_class from audit.authorization_decision_persistence_policies p where p.category='SUPPORT' and p.status='ACTIVE'), 'RET_OBLIGATION', 'SUPPORT uses canonical retention class without days');

-- 253
select is((select p.sensitivity_floor from audit.authorization_decision_persistence_policies p where p.category='SUPPORT' and p.status='ACTIVE'), 'FUNCTIONAL_SENSITIVE', 'SUPPORT sensitivity floor is deterministic');

-- 254
select is((select p.evidence_storage_mode from audit.authorization_decision_persistence_policies p where p.category='MUTATION' and p.status='ACTIVE'), 'FULL_DECISION', 'MUTATION evidence mode is canonical minimum');

-- 255
select is((select p.retention_class from audit.authorization_decision_persistence_policies p where p.category='MUTATION' and p.status='ACTIVE'), 'RET_OBLIGATION', 'MUTATION uses canonical retention class without days');

-- 256
select is((select p.sensitivity_floor from audit.authorization_decision_persistence_policies p where p.category='MUTATION' and p.status='ACTIVE'), 'FUNCTIONAL_SENSITIVE', 'MUTATION sensitivity floor is deterministic');

-- 257
select is(app_private.resolve_authorization_persistence_profile(pg_temp.auth_db_032_decision('03200000-0000-0000-0000-000000000010','ALLOW','APP_ACCESS','SERVER_ACTION','NON_RESOURCE','{}',false)) ->> 'category', 'NAVIGATION', 'resolver classifies NAVIGATION server-side');

-- 258
select is(app_private.resolve_authorization_persistence_profile(pg_temp.auth_db_032_decision('03200000-0000-0000-0000-000000000010','ALLOW','APP_ACCESS','SERVER_ACTION','NON_RESOURCE','{}',false)) ->> 'evidence_storage_mode', 'AUDIT_ANCHOR', 'resolver returns AUDIT_ANCHOR for NAVIGATION');

-- 259
select is(app_private.resolve_authorization_persistence_profile(pg_temp.auth_db_032_decision('03200000-0000-0000-0000-000000000010','ALLOW','APP_ACCESS','SERVER_ACTION','NON_RESOURCE','{}',false)) ->> 'audit_commit_class', 'AUDIT_ATOMIC_REQUIRED', 'NAVIGATION uses AUDIT_ATOMIC_REQUIRED');

-- 260
select is(app_private.resolve_authorization_persistence_profile(pg_temp.auth_db_032_decision('03200000-0000-0000-0000-000000000011','ALLOW','READ','UI_GUARD','NON_RESOURCE','{}',false)) ->> 'category', 'UI_GUARD', 'resolver classifies UI_GUARD server-side');

-- 261
select is(app_private.resolve_authorization_persistence_profile(pg_temp.auth_db_032_decision('03200000-0000-0000-0000-000000000011','ALLOW','READ','UI_GUARD','NON_RESOURCE','{}',false)) ->> 'evidence_storage_mode', 'AUDIT_ANCHOR', 'resolver returns AUDIT_ANCHOR for UI_GUARD');

-- 262
select is(app_private.resolve_authorization_persistence_profile(pg_temp.auth_db_032_decision('03200000-0000-0000-0000-000000000011','ALLOW','READ','UI_GUARD','NON_RESOURCE','{}',false)) ->> 'audit_commit_class', 'AUDIT_ATOMIC_REQUIRED', 'UI_GUARD uses AUDIT_ATOMIC_REQUIRED');

-- 263
select is(app_private.resolve_authorization_persistence_profile(pg_temp.auth_db_032_decision('03200000-0000-0000-0000-000000000012','ALLOW','READ','SERVER_ACTION','EXISTING_RESOURCE',array['R1'],false)) ->> 'category', 'ORDINARY_READ', 'resolver classifies ORDINARY_READ server-side');

-- 264
select is(app_private.resolve_authorization_persistence_profile(pg_temp.auth_db_032_decision('03200000-0000-0000-0000-000000000012','ALLOW','READ','SERVER_ACTION','EXISTING_RESOURCE',array['R1'],false)) ->> 'evidence_storage_mode', 'AUDIT_ANCHOR', 'resolver returns AUDIT_ANCHOR for ORDINARY_READ');

-- 265
select is(app_private.resolve_authorization_persistence_profile(pg_temp.auth_db_032_decision('03200000-0000-0000-0000-000000000012','ALLOW','READ','SERVER_ACTION','EXISTING_RESOURCE',array['R1'],false)) ->> 'audit_commit_class', 'AUDIT_ATOMIC_REQUIRED', 'ORDINARY_READ uses AUDIT_ATOMIC_REQUIRED');

-- 266
select is(app_private.resolve_authorization_persistence_profile(pg_temp.auth_db_032_decision('03200000-0000-0000-0000-000000000013','ALLOW','READ','SERVER_ACTION','AGGREGATE','{}',false)) ->> 'category', 'AGGREGATE', 'resolver classifies AGGREGATE server-side');

-- 267
select is(app_private.resolve_authorization_persistence_profile(pg_temp.auth_db_032_decision('03200000-0000-0000-0000-000000000013','ALLOW','READ','SERVER_ACTION','AGGREGATE','{}',false)) ->> 'evidence_storage_mode', 'AUDIT_ANCHOR', 'resolver returns AUDIT_ANCHOR for AGGREGATE');

-- 268
select is(app_private.resolve_authorization_persistence_profile(pg_temp.auth_db_032_decision('03200000-0000-0000-0000-000000000013','ALLOW','READ','SERVER_ACTION','AGGREGATE','{}',false)) ->> 'audit_commit_class', 'AUDIT_ATOMIC_REQUIRED', 'AGGREGATE uses AUDIT_ATOMIC_REQUIRED');

-- 269
select is(app_private.resolve_authorization_persistence_profile(pg_temp.auth_db_032_decision('03200000-0000-0000-0000-000000000014','ALLOW','READ','SERVER_ACTION','EXISTING_RESOURCE',array['R1'],true)) ->> 'category', 'SENSITIVE_READ', 'resolver classifies SENSITIVE_READ server-side');

-- 270
select is(app_private.resolve_authorization_persistence_profile(pg_temp.auth_db_032_decision('03200000-0000-0000-0000-000000000014','ALLOW','READ','SERVER_ACTION','EXISTING_RESOURCE',array['R1'],true)) ->> 'evidence_storage_mode', 'FULL_DECISION', 'resolver returns FULL_DECISION for SENSITIVE_READ');

-- 271
select is(app_private.resolve_authorization_persistence_profile(pg_temp.auth_db_032_decision('03200000-0000-0000-0000-000000000014','ALLOW','READ','SERVER_ACTION','EXISTING_RESOURCE',array['R1'],true)) ->> 'audit_commit_class', 'AUDIT_ATOMIC_REQUIRED', 'SENSITIVE_READ uses AUDIT_ATOMIC_REQUIRED');

-- 272
select is(app_private.resolve_authorization_persistence_profile(pg_temp.auth_db_032_decision('03200000-0000-0000-0000-000000000015','ALLOW','EXPORT','SERVER_ACTION','EXISTING_RESOURCE',array['R1'],false)) ->> 'category', 'EXPORT', 'resolver classifies EXPORT server-side');

-- 273
select is(app_private.resolve_authorization_persistence_profile(pg_temp.auth_db_032_decision('03200000-0000-0000-0000-000000000015','ALLOW','EXPORT','SERVER_ACTION','EXISTING_RESOURCE',array['R1'],false)) ->> 'evidence_storage_mode', 'FULL_DECISION', 'resolver returns FULL_DECISION for EXPORT');

-- 274
select is(app_private.resolve_authorization_persistence_profile(pg_temp.auth_db_032_decision('03200000-0000-0000-0000-000000000015','ALLOW','EXPORT','SERVER_ACTION','EXISTING_RESOURCE',array['R1'],false)) ->> 'audit_commit_class', 'AUDIT_ATOMIC_REQUIRED', 'EXPORT uses AUDIT_ATOMIC_REQUIRED');

-- 275
select is(app_private.resolve_authorization_persistence_profile(pg_temp.auth_db_032_decision('03200000-0000-0000-0000-000000000016','ALLOW','READ','SERVER_ACTION','EXISTING_RESOURCE',array['R1'],false,'audit.support.read.v1')) ->> 'category', 'SUPPORT', 'resolver classifies SUPPORT server-side');

-- 276
select is(app_private.resolve_authorization_persistence_profile(pg_temp.auth_db_032_decision('03200000-0000-0000-0000-000000000016','ALLOW','READ','SERVER_ACTION','EXISTING_RESOURCE',array['R1'],false,'audit.support.read.v1')) ->> 'evidence_storage_mode', 'FULL_DECISION', 'resolver returns FULL_DECISION for SUPPORT');

-- 277
select is(app_private.resolve_authorization_persistence_profile(pg_temp.auth_db_032_decision('03200000-0000-0000-0000-000000000016','ALLOW','READ','SERVER_ACTION','EXISTING_RESOURCE',array['R1'],false,'audit.support.read.v1')) ->> 'audit_commit_class', 'AUDIT_ATOMIC_REQUIRED', 'SUPPORT uses AUDIT_ATOMIC_REQUIRED');

-- 278
select is(app_private.resolve_authorization_persistence_profile(pg_temp.auth_db_032_decision('03200000-0000-0000-0000-000000000017','ALLOW','UPDATE','SERVER_ACTION','EXISTING_RESOURCE',array['R1'],false)) ->> 'category', 'MUTATION', 'resolver classifies MUTATION server-side');

-- 279
select is(app_private.resolve_authorization_persistence_profile(pg_temp.auth_db_032_decision('03200000-0000-0000-0000-000000000017','ALLOW','UPDATE','SERVER_ACTION','EXISTING_RESOURCE',array['R1'],false)) ->> 'evidence_storage_mode', 'FULL_DECISION', 'resolver returns FULL_DECISION for MUTATION');

-- 280
select is(app_private.resolve_authorization_persistence_profile(pg_temp.auth_db_032_decision('03200000-0000-0000-0000-000000000017','ALLOW','UPDATE','SERVER_ACTION','EXISTING_RESOURCE',array['R1'],false)) ->> 'audit_commit_class', 'AUDIT_ATOMIC_REQUIRED', 'MUTATION uses AUDIT_ATOMIC_REQUIRED');

create temporary table auth_db_032_results(id text primary key, returned_id text) on commit drop;

insert into auth_db_032_results values ('anchor', audit.append_authorization_decision(pg_temp.auth_db_032_decision('03200000-0000-0000-0000-000000000201','ALLOW','APP_ACCESS','SERVER_ACTION','NON_RESOURCE','{}',false)));

-- 281
select is((select returned_id from auth_db_032_results where id='anchor'), '03200000-0000-0000-0000-000000000201', 'append returns exact anchor decision_id');

insert into auth_db_032_results values ('resource', audit.append_authorization_decision(pg_temp.auth_db_032_decision('03200000-0000-0000-0000-000000000202','ALLOW','READ','SERVER_ACTION','EXISTING_RESOURCE',array['R2','R1','R2'],false)));

-- 282
select is((select returned_id from auth_db_032_results where id='resource'), '03200000-0000-0000-0000-000000000202', 'append returns exact resource decision_id');

insert into auth_db_032_results values ('sensitive', audit.append_authorization_decision(pg_temp.auth_db_032_decision('03200000-0000-0000-0000-000000000203','ALLOW','READ','SERVER_ACTION','EXISTING_RESOURCE',array['S1'],true)));

-- 283
select is((select returned_id from auth_db_032_results where id='sensitive'), '03200000-0000-0000-0000-000000000203', 'append returns exact sensitive decision_id');

insert into auth_db_032_results values ('deny', audit.append_authorization_decision(pg_temp.auth_db_032_decision('03200000-0000-0000-0000-000000000204','DENY','APP_ACCESS','SERVER_ACTION','NON_RESOURCE','{}',false)));

-- 284
select is((select returned_id from auth_db_032_results where id='deny'), '03200000-0000-0000-0000-000000000204', 'append returns exact deny decision_id');

-- 285
select is((select decision_contract_version from audit.authorization_decisions where decision_id='03200000-0000-0000-0000-000000000201'), '1.0.0', 'persisted anchor decision_contract_version matches contract');

-- 286
select is((select decision_schema_version from audit.authorization_decisions where decision_id='03200000-0000-0000-0000-000000000201'), '1.0.0', 'persisted anchor decision_schema_version matches contract');

-- 287
select is((select correlation_id from audit.authorization_decisions where decision_id='03200000-0000-0000-0000-000000000201'), 'AUTH-DB-032-PGTAP', 'persisted anchor correlation_id matches contract');

-- 288
select is((select context_id from audit.authorization_decisions where decision_id='03200000-0000-0000-0000-000000000201'), '03200000-0000-0000-0000-000000000100', 'persisted anchor context_id matches contract');

-- 289
select is((select principal_id from audit.authorization_decisions where decision_id='03200000-0000-0000-0000-000000000201'), '03200000-0000-0000-0000-000000000102', 'persisted anchor principal_id matches contract');

-- 290
select is((select actor_id from audit.authorization_decisions where decision_id='03200000-0000-0000-0000-000000000201'), '03200000-0000-0000-0000-000000000101', 'persisted anchor actor_id matches contract');

-- 291
select is((select app_code from audit.authorization_decisions where decision_id='03200000-0000-0000-0000-000000000201'), 'shell', 'persisted anchor app_code matches contract');

-- 292
select is((select permission_key from audit.authorization_decisions where decision_id='03200000-0000-0000-0000-000000000201'), 'shell.access', 'persisted anchor permission_key matches contract');

-- 293
select is((select operation_kind from audit.authorization_decisions where decision_id='03200000-0000-0000-0000-000000000201'), 'APP_ACCESS', 'persisted anchor operation_kind matches contract');

-- 294
select is((select request_source from audit.authorization_decisions where decision_id='03200000-0000-0000-0000-000000000201'), 'SERVER_ACTION', 'persisted anchor request_source matches contract');

-- 295
select is((select resource_type from audit.authorization_decisions where decision_id='03200000-0000-0000-0000-000000000201'), 'TEST_RESOURCE', 'persisted anchor resource_type matches contract');

-- 296
select is((select outcome from audit.authorization_decisions where decision_id='03200000-0000-0000-0000-000000000201'), 'ALLOW', 'persisted anchor outcome matches contract');

-- 297
select is((select evidence_storage_mode from audit.authorization_decisions where decision_id='03200000-0000-0000-0000-000000000201'), 'AUDIT_ANCHOR', 'persisted anchor evidence_storage_mode matches contract');

-- 298
select is((select sensitivity_class from audit.authorization_decisions where decision_id='03200000-0000-0000-0000-000000000201'), 'FUNCTIONAL', 'persisted anchor sensitivity_class matches contract');

-- 299
select is((select retention_class from audit.authorization_decisions where decision_id='03200000-0000-0000-0000-000000000201'), 'RET_BUSINESS_CYCLE', 'persisted anchor retention_class matches contract');

-- 300
select is((select source_contract_sha256 from audit.authorization_decisions where decision_id='03200000-0000-0000-0000-000000000201'), 'b4ac332aebb731370919938eb29bb491ded5f17df360ce1fc731733a63b9c925', 'persisted anchor source_contract_sha256 matches contract');

-- 301
select ok((select decision_record_fingerprint from audit.authorization_decisions where decision_id='03200000-0000-0000-0000-000000000201') ~ '^sha256:[0-9a-f]{64}$', 'persisted decision_record_fingerprint has sha256 format');

-- 302
select ok((select context_fingerprint from audit.authorization_decisions where decision_id='03200000-0000-0000-0000-000000000201') ~ '^sha256:[0-9a-f]{64}$', 'persisted context_fingerprint has sha256 format');

-- 303
select ok((select resource_fingerprint from audit.authorization_decisions where decision_id='03200000-0000-0000-0000-000000000201') ~ '^sha256:[0-9a-f]{64}$', 'persisted resource_fingerprint has sha256 format');

-- 304
select ok((select catalog_hash from audit.authorization_decisions where decision_id='03200000-0000-0000-0000-000000000201') ~ '^sha256:[0-9a-f]{64}$', 'persisted catalog_hash has sha256 format');

-- 305
select ok((select recorded_at >= decided_at from audit.authorization_decisions where decision_id='03200000-0000-0000-0000-000000000201'), 'recorded_at does not precede decided_at');

-- 306
select is((select authorizing_lanes from audit.authorization_decisions where decision_id='03200000-0000-0000-0000-000000000201'), array['BASE']::text[], 'ALLOW persists one canonical authorizing lane');

-- 307
select is((select pg_catalog.cardinality(authorization_reason_codes) from audit.authorization_decisions where decision_id='03200000-0000-0000-0000-000000000201'), 0, 'ALLOW persists zero blocked reason codes');

-- 308
select ok((select decision_payload is null from audit.authorization_decisions where decision_id='03200000-0000-0000-0000-000000000201'), 'AUDIT_ANCHOR does not persist full decision payload');

-- 309
select is((select evidence_storage_mode from audit.authorization_decisions where decision_id='03200000-0000-0000-0000-000000000203'), 'FULL_DECISION', 'sensitive read persists FULL_DECISION');

-- 310
select ok((select decision_payload is not null from audit.authorization_decisions where decision_id='03200000-0000-0000-0000-000000000203'), 'FULL_DECISION persists complete private payload');

-- 311
select is((select decision_payload ->> 'decision_id' from audit.authorization_decisions where decision_id='03200000-0000-0000-0000-000000000203'), '03200000-0000-0000-0000-000000000203', 'FULL_DECISION payload decision_id equals row');

-- 312
select is((select decision_payload ->> 'final_decision' from audit.authorization_decisions where decision_id='03200000-0000-0000-0000-000000000203'), 'ALLOW', 'FULL_DECISION payload outcome equals row');

-- 313
select is((select sensitivity_class from audit.authorization_decisions where decision_id='03200000-0000-0000-0000-000000000203'), 'FUNCTIONAL_SENSITIVE', 'sensitive read retains sensitive classification');

-- 314
select is((select retention_class from audit.authorization_decisions where decision_id='03200000-0000-0000-0000-000000000203'), 'RET_OBLIGATION', 'sensitive read retains obligation retention class');

-- 315
select is((select pg_catalog.cardinality(authorizing_lanes) from audit.authorization_decisions where decision_id='03200000-0000-0000-0000-000000000204'), 0, 'DENY persists zero authorizing lanes');

-- 316
select is((select authorization_reason_codes from audit.authorization_decisions where decision_id='03200000-0000-0000-0000-000000000204'), array['AUTH_ADMIN_PERMISSION_DENIED']::text[], 'DENY persists canonical reason code');

-- 317
select is(audit.append_authorization_decision(pg_temp.auth_db_032_decision('03200000-0000-0000-0000-000000000201','ALLOW','APP_ACCESS','SERVER_ACTION','NON_RESOURCE','{}',false)), '03200000-0000-0000-0000-000000000201', 'same decision id and fingerprint is idempotent');

-- 318
select is((select pg_catalog.count(*) from audit.authorization_decisions where decision_id='03200000-0000-0000-0000-000000000201'), 1::bigint, 'idempotent append does not duplicate decision');

-- 319
select throws_ok($$select audit.append_authorization_decision(pg_catalog.jsonb_set(pg_temp.auth_db_032_decision('03200000-0000-0000-0000-000000000201','ALLOW','APP_ACCESS','SERVER_ACTION','NON_RESOURCE','{}',false), '{audit,resource_fingerprint}', to_jsonb('sha256:' || repeat('9',64)), true))$$, '23505', 'AUTH_DB_032_DECISION_INTEGRITY_CONFLICT', 'same decision id with incompatible fingerprint fails closed');

-- 320
select throws_ok($$select audit.append_authorization_decision(pg_catalog.jsonb_set(pg_temp.auth_db_032_decision('03200000-0000-0000-0000-000000000205','ALLOW','APP_ACCESS','SERVER_ACTION','NON_RESOURCE','{}',false), '{audit,decision_id}', '"DIFFERENT"'::jsonb, true))$$, '22023', 'AUTH_DB_032_DECISION_ID_MISMATCH', 'root and audit decision_id mismatch is rejected');

-- 321
select throws_ok($$select audit.append_authorization_decision(pg_catalog.jsonb_set(pg_temp.auth_db_032_decision('03200000-0000-0000-0000-000000000206','ALLOW','APP_ACCESS','SERVER_ACTION','NON_RESOURCE','{}',false), '{audit,app_code}', '"other"'::jsonb, true))$$, '22023', 'AUTH_DB_032_REQUEST_AUDIT_MISMATCH', 'request and audit app mismatch is rejected');

-- 322
select throws_ok($$select audit.append_authorization_decision(pg_catalog.jsonb_set(pg_temp.auth_db_032_decision('03200000-0000-0000-0000-000000000207','ALLOW','APP_ACCESS','SERVER_ACTION','NON_RESOURCE','{}',false), '{audit,outcome}', '"DENY"'::jsonb, true))$$, '22023', 'AUTH_DB_032_OUTCOME_MISMATCH', 'root and audit outcome mismatch is rejected');

-- 323
select throws_ok($$select audit.append_authorization_decision(pg_catalog.jsonb_set(pg_temp.auth_db_032_decision('03200000-0000-0000-0000-000000000208','DENY','APP_ACCESS','SERVER_ACTION','NON_RESOURCE','{}',false), '{audit,authorizing_lanes}', '["BASE"]'::jsonb, true))$$, '22023', 'AUTH_DB_032_AUTHORIZING_LANES_OUTCOME_INVALID', 'DENY cannot retain authorizing lanes');

-- 324
select is((select resource_ids from audit.authorization_decisions where decision_id='03200000-0000-0000-0000-000000000202'), array['R1','R2']::text[], 'resource ids are sorted and deduplicated');

-- 325
select is((select pg_catalog.count(*) from audit.authorization_decision_resources where decision_id='03200000-0000-0000-0000-000000000202'), 2::bigint, 'resource child count equals normalized resource ids');

-- 326
select is((select pg_catalog.array_agg(resource_id order by resource_ordinal) from audit.authorization_decision_resources where decision_id='03200000-0000-0000-0000-000000000202'), array['R1','R2']::text[], 'resource child order equals persisted resource array');

-- 327
select is((select pg_catalog.array_agg(resource_ordinal order by resource_ordinal) from audit.authorization_decision_resources where decision_id='03200000-0000-0000-0000-000000000202'), array[1,2]::integer[], 'resource ordinals are contiguous');

-- 328
select is((select pg_catalog.count(distinct resource_id) from audit.authorization_decision_resources where decision_id='03200000-0000-0000-0000-000000000202'), 2::bigint, 'resource links contain no duplicates');

-- 329
select ok(not exists(select 1 from audit.authorization_decision_resources r left join audit.authorization_decisions d using(decision_id) where d.decision_id is null), 'resource children cannot be orphaned');

-- 330
select ok((select bool_and(link_fingerprint ~ '^sha256:[0-9a-f]{64}$') from audit.authorization_decision_resources where decision_id='03200000-0000-0000-0000-000000000202'), 'resource link fingerprints are canonical sha256');

-- 331
select is((select pg_catalog.count(*) from audit.authorization_decision_resources where decision_id='03200000-0000-0000-0000-000000000201'), 0::bigint, 'non-resource decision has zero child resources');

-- 332
select throws_ok($$update audit.authorization_decisions set recorded_at=recorded_at where decision_id='03200000-0000-0000-0000-000000000201'$$, '55000', 'AUTH_DB_032_APPEND_ONLY_MUTATION_FORBIDDEN', 'UPDATE is rejected on append-only authorization_decisions');

-- 333
select throws_ok($$delete from audit.authorization_decisions where decision_id='03200000-0000-0000-0000-000000000201'$$, '55000', 'AUTH_DB_032_APPEND_ONLY_MUTATION_FORBIDDEN', 'DELETE is rejected on append-only authorization_decisions');

-- 334
select throws_ok($$update audit.authorization_decision_resources set recorded_at=recorded_at where decision_id='03200000-0000-0000-0000-000000000202' and resource_ordinal=1$$, '55000', 'AUTH_DB_032_APPEND_ONLY_MUTATION_FORBIDDEN', 'UPDATE is rejected on append-only authorization_decision_resources');

-- 335
select throws_ok($$delete from audit.authorization_decision_resources where decision_id='03200000-0000-0000-0000-000000000202' and resource_ordinal=1$$, '55000', 'AUTH_DB_032_APPEND_ONLY_MUTATION_FORBIDDEN', 'DELETE is rejected on append-only authorization_decision_resources');

select audit.append_authorization_decision_link(pg_temp.auth_db_032_link('03200000-0000-0000-0000-000000000202','COMMAND','REF-1',null));

-- 336
select is((select pg_catalog.count(*) from audit.authorization_decision_links where decision_id='03200000-0000-0000-0000-000000000202' and link_kind='COMMAND'), 1::bigint, 'COMMAND link is persisted');

-- 337
select ok((select link_fingerprint from audit.authorization_decision_links where decision_id='03200000-0000-0000-0000-000000000202' and link_kind='COMMAND') ~ '^sha256:[0-9a-f]{64}$', 'COMMAND link has integrity fingerprint');

select audit.append_authorization_decision_link(pg_temp.auth_db_032_link('03200000-0000-0000-0000-000000000202','EXECUTION_RESULT','REF-2','RESULT_OK'));

-- 338
select is((select pg_catalog.count(*) from audit.authorization_decision_links where decision_id='03200000-0000-0000-0000-000000000202' and link_kind='EXECUTION_RESULT'), 1::bigint, 'EXECUTION_RESULT link is persisted');

-- 339
select ok((select link_fingerprint from audit.authorization_decision_links where decision_id='03200000-0000-0000-0000-000000000202' and link_kind='EXECUTION_RESULT') ~ '^sha256:[0-9a-f]{64}$', 'EXECUTION_RESULT link has integrity fingerprint');

select audit.append_authorization_decision_link(pg_temp.auth_db_032_link('03200000-0000-0000-0000-000000000202','BUSINESS_EVENT','REF-3',null));

-- 340
select is((select pg_catalog.count(*) from audit.authorization_decision_links where decision_id='03200000-0000-0000-0000-000000000202' and link_kind='BUSINESS_EVENT'), 1::bigint, 'BUSINESS_EVENT link is persisted');

-- 341
select ok((select link_fingerprint from audit.authorization_decision_links where decision_id='03200000-0000-0000-0000-000000000202' and link_kind='BUSINESS_EVENT') ~ '^sha256:[0-9a-f]{64}$', 'BUSINESS_EVENT link has integrity fingerprint');

select audit.append_authorization_decision_link(pg_temp.auth_db_032_link('03200000-0000-0000-0000-000000000202','ERROR','REF-4',null));

-- 342
select is((select pg_catalog.count(*) from audit.authorization_decision_links where decision_id='03200000-0000-0000-0000-000000000202' and link_kind='ERROR'), 1::bigint, 'ERROR link is persisted');

-- 343
select ok((select link_fingerprint from audit.authorization_decision_links where decision_id='03200000-0000-0000-0000-000000000202' and link_kind='ERROR') ~ '^sha256:[0-9a-f]{64}$', 'ERROR link has integrity fingerprint');

select audit.append_authorization_decision_link(pg_temp.auth_db_032_link('03200000-0000-0000-0000-000000000202','COMPENSATION','REF-5',null));

-- 344
select is((select pg_catalog.count(*) from audit.authorization_decision_links where decision_id='03200000-0000-0000-0000-000000000202' and link_kind='COMPENSATION'), 1::bigint, 'COMPENSATION link is persisted');

-- 345
select ok((select link_fingerprint from audit.authorization_decision_links where decision_id='03200000-0000-0000-0000-000000000202' and link_kind='COMPENSATION') ~ '^sha256:[0-9a-f]{64}$', 'COMPENSATION link has integrity fingerprint');

select audit.append_authorization_decision_link(pg_temp.auth_db_032_link('03200000-0000-0000-0000-000000000202','RECONCILIATION','REF-6',null));

-- 346
select is((select pg_catalog.count(*) from audit.authorization_decision_links where decision_id='03200000-0000-0000-0000-000000000202' and link_kind='RECONCILIATION'), 1::bigint, 'RECONCILIATION link is persisted');

-- 347
select ok((select link_fingerprint from audit.authorization_decision_links where decision_id='03200000-0000-0000-0000-000000000202' and link_kind='RECONCILIATION') ~ '^sha256:[0-9a-f]{64}$', 'RECONCILIATION link has integrity fingerprint');

select audit.append_authorization_decision_link(pg_temp.auth_db_032_link('03200000-0000-0000-0000-000000000202','AUDIT_ENTRY','REF-7',null));

-- 348
select is((select pg_catalog.count(*) from audit.authorization_decision_links where decision_id='03200000-0000-0000-0000-000000000202' and link_kind='AUDIT_ENTRY'), 1::bigint, 'AUDIT_ENTRY link is persisted');

-- 349
select ok((select link_fingerprint from audit.authorization_decision_links where decision_id='03200000-0000-0000-0000-000000000202' and link_kind='AUDIT_ENTRY') ~ '^sha256:[0-9a-f]{64}$', 'AUDIT_ENTRY link has integrity fingerprint');

-- 350
select is(audit.append_authorization_decision_link(pg_temp.auth_db_032_link('03200000-0000-0000-0000-000000000202','COMMAND','REF-1',null)), (select decision_link_id from audit.authorization_decision_links where decision_id='03200000-0000-0000-0000-000000000202' and link_kind='COMMAND'), 'exact duplicate decision link is idempotent');

-- 351
select throws_ok($$select audit.append_authorization_decision_link(pg_temp.auth_db_032_link('03200000-0000-0000-0000-000000000202','COMMAND','REF-1','DIFFERENT'))$$, '23505', 'AUTH_DB_032_DECISION_LINK_INTEGRITY_CONFLICT', 'incompatible duplicate decision link fails closed');

-- 352
select throws_ok($$select audit.append_authorization_decision_link(pg_temp.auth_db_032_link('MISSING-DECISION','COMMAND','MISSING',null))$$, '23503', 'AUTH_DB_032_DECISION_LINK_DECISION_MISSING', 'link to missing decision fails closed');

-- 353
select throws_ok($$select audit.append_authorization_decision_link(pg_catalog.jsonb_set(pg_temp.auth_db_032_link('03200000-0000-0000-0000-000000000202','COMMAND','CORR-MISMATCH',null), '{correlation_id}', '"OTHER"'::jsonb, true))$$, '22023', 'AUTH_DB_032_DECISION_LINK_CORRELATION_MISMATCH', 'link correlation must match decision');

-- 354
select is((select expected_resource_version from audit.authorization_decision_links where decision_id='03200000-0000-0000-0000-000000000202' and link_kind='COMMAND'), '10', 'expected resource version is preserved in link');

-- 355
select is((select observed_resource_version from audit.authorization_decision_links where decision_id='03200000-0000-0000-0000-000000000202' and link_kind='COMMAND'), '11', 'observed resource version is preserved in link');

-- 356
select is((select idempotency_key_reference from audit.authorization_decision_links where decision_id='03200000-0000-0000-0000-000000000202' and link_kind='COMMAND'), 'IDEMPOTENCY-REF-032', 'idempotency reference is persisted without payload');

-- 357
select throws_ok($$update audit.authorization_decision_links set result_code='X' where decision_id='03200000-0000-0000-0000-000000000202' and link_kind='COMMAND'$$, '55000', 'AUTH_DB_032_APPEND_ONLY_MUTATION_FORBIDDEN', 'decision links are append-only on UPDATE');

-- 358
select throws_ok($$delete from audit.authorization_decision_links where decision_id='03200000-0000-0000-0000-000000000202' and link_kind='COMMAND'$$, '55000', 'AUTH_DB_032_APPEND_ONLY_MUTATION_FORBIDDEN', 'decision links are append-only on DELETE');

select audit.append_authorization_evaluation_failure(pg_temp.auth_db_032_failure('AUTH-DB-032-FAILURE-001'));

-- 359
select is((select source_status from audit.authorization_evaluation_failures where evaluation_attempt_id='AUTH-DB-032-FAILURE-001'), 'UNAVAILABLE', 'technical failure source_status is persisted separately');

-- 360
select is((select request_source from audit.authorization_evaluation_failures where evaluation_attempt_id='AUTH-DB-032-FAILURE-001'), 'SERVER_ACTION', 'technical failure request_source is persisted separately');

-- 361
select is((select app_code from audit.authorization_evaluation_failures where evaluation_attempt_id='AUTH-DB-032-FAILURE-001'), 'shell', 'technical failure app_code is persisted separately');

-- 362
select is((select operation_kind from audit.authorization_evaluation_failures where evaluation_attempt_id='AUTH-DB-032-FAILURE-001'), 'APP_ACCESS', 'technical failure operation_kind is persisted separately');

-- 363
select is((select failure_stage from audit.authorization_evaluation_failures where evaluation_attempt_id='AUTH-DB-032-FAILURE-001'), 'DATASET_LOAD', 'technical failure failure_stage is persisted separately');

-- 364
select is((select support_code from audit.authorization_evaluation_failures where evaluation_attempt_id='AUTH-DB-032-FAILURE-001'), 'AUTH032SUPPORT', 'technical failure support_code is persisted separately');

-- 365
select is((select sensitivity_class from audit.authorization_evaluation_failures where evaluation_attempt_id='AUTH-DB-032-FAILURE-001'), 'FUNCTIONAL_SENSITIVE', 'technical failure sensitivity_class is persisted separately');

-- 366
select is((select retention_class from audit.authorization_evaluation_failures where evaluation_attempt_id='AUTH-DB-032-FAILURE-001'), 'RET_OBLIGATION', 'technical failure retention_class is persisted separately');

-- 367
select ok((select session_preserved from audit.authorization_evaluation_failures where evaluation_attempt_id='AUTH-DB-032-FAILURE-001'), 'technical failure preserves session');

-- 368
select ok(not (select effects_committed from audit.authorization_evaluation_failures where evaluation_attempt_id='AUTH-DB-032-FAILURE-001'), 'pre-effect technical failure records effects_committed false');

-- 369
select is((select retry_count from audit.authorization_evaluation_failures where evaluation_attempt_id='AUTH-DB-032-FAILURE-001'), 1, 'technical failure retry_count is retained');

-- 370
select is((select retry_budget from audit.authorization_evaluation_failures where evaluation_attempt_id='AUTH-DB-032-FAILURE-001'), 2, 'technical failure retry_budget is retained');

-- 371
select is((select duration_ms from audit.authorization_evaluation_failures where evaluation_attempt_id='AUTH-DB-032-FAILURE-001'), 15::bigint, 'technical failure duration is retained');

-- 372
select ok((select failure_fingerprint from audit.authorization_evaluation_failures where evaluation_attempt_id='AUTH-DB-032-FAILURE-001') ~ '^sha256:[0-9a-f]{64}$', 'technical failure has integrity fingerprint');

-- 373
select is((select pg_catalog.count(*) from audit.authorization_decisions where decision_id='AUTH-DB-032-FAILURE-001'), 0::bigint, 'technical failure never creates decision row');

-- 374
select ok(not exists(select 1 from pg_catalog.pg_attribute where attrelid='audit.authorization_evaluation_failures'::regclass and attname='decision_id' and attnum>0 and not attisdropped), 'technical failure table has no authoritative decision_id column');

-- 375
select is(audit.append_authorization_evaluation_failure(pg_temp.auth_db_032_failure('AUTH-DB-032-FAILURE-001')), 'AUTH-DB-032-FAILURE-001', 'same technical failure retry is idempotent');

-- 376
select throws_ok($$select audit.append_authorization_evaluation_failure(pg_catalog.jsonb_set(pg_temp.auth_db_032_failure('AUTH-DB-032-FAILURE-001'), '{duration_ms}', '16'::jsonb, true))$$, '23505', 'AUTH_DB_032_TECHNICAL_FAILURE_INTEGRITY_CONFLICT', 'same evaluation attempt with different evidence fails closed');

-- 377
select throws_ok($$update audit.authorization_evaluation_failures set duration_ms=16 where evaluation_attempt_id='AUTH-DB-032-FAILURE-001'$$, '55000', 'AUTH_DB_032_APPEND_ONLY_MUTATION_FORBIDDEN', 'technical failures are append-only on UPDATE');

-- 378
select throws_ok($$delete from audit.authorization_evaluation_failures where evaluation_attempt_id='AUTH-DB-032-FAILURE-001'$$, '55000', 'AUTH_DB_032_APPEND_ONLY_MUTATION_FORBIDDEN', 'technical failures are append-only on DELETE');

select audit.append_authorization_evaluation_failure_attempt(pg_temp.auth_db_032_failure_attempt('AUTH-DB-032-FAILURE-001',1));

-- 379
select is((select attempt_ordinal from audit.authorization_evaluation_failure_attempts where evaluation_attempt_id='AUTH-DB-032-FAILURE-001' and attempt_ordinal=1), 1, 'failure attempt ordinal 1 is persisted');

select audit.append_authorization_evaluation_failure_attempt(pg_temp.auth_db_032_failure_attempt('AUTH-DB-032-FAILURE-001',2));

-- 380
select is((select attempt_ordinal from audit.authorization_evaluation_failure_attempts where evaluation_attempt_id='AUTH-DB-032-FAILURE-001' and attempt_ordinal=2), 2, 'failure attempt ordinal 2 is persisted');

select audit.append_authorization_evaluation_failure_attempt(pg_temp.auth_db_032_failure_attempt('AUTH-DB-032-FAILURE-001',3));

-- 381
select is((select attempt_ordinal from audit.authorization_evaluation_failure_attempts where evaluation_attempt_id='AUTH-DB-032-FAILURE-001' and attempt_ordinal=3), 3, 'failure attempt ordinal 3 is persisted');

-- 382
select is((select pg_catalog.array_agg(attempt_ordinal order by attempt_ordinal) from audit.authorization_evaluation_failure_attempts where evaluation_attempt_id='AUTH-DB-032-FAILURE-001'), array[1,2,3]::integer[], 'failure attempts are monotonic');

-- 383
select is(audit.append_authorization_evaluation_failure_attempt(pg_temp.auth_db_032_failure_attempt('AUTH-DB-032-FAILURE-001',2)), 'AUTH-DB-032-FAILURE-001:2', 'same failure attempt ordinal is idempotent');

-- 384
select throws_ok($$select audit.append_authorization_evaluation_failure_attempt(pg_catalog.jsonb_set(pg_temp.auth_db_032_failure_attempt('AUTH-DB-032-FAILURE-001',2), '{duration_ms}', '11'::jsonb, true))$$, '23505', 'AUTH_DB_032_FAILURE_ATTEMPT_INTEGRITY_CONFLICT', 'same failure attempt ordinal with changed evidence fails');

-- 385
select throws_ok($$select audit.append_authorization_evaluation_failure_attempt(pg_temp.auth_db_032_failure_attempt('AUTH-DB-032-FAILURE-001',4))$$, '22023', 'AUTH_DB_032_FAILURE_ATTEMPT_BUDGET_EXCEEDED', 'failure attempt cannot exceed retry budget');

-- 386
select throws_ok($$select audit.append_authorization_evaluation_failure_attempt(pg_temp.auth_db_032_failure_attempt('MISSING-FAILURE',1))$$, '23503', 'AUTH_DB_032_FAILURE_ATTEMPT_PARENT_MISSING', 'failure attempt requires parent technical failure');

-- 387
select throws_ok($$update audit.authorization_evaluation_failure_attempts set duration_ms=11 where evaluation_attempt_id='AUTH-DB-032-FAILURE-001' and attempt_ordinal=1$$, '55000', 'AUTH_DB_032_APPEND_ONLY_MUTATION_FORBIDDEN', 'failure attempts are append-only on UPDATE');

-- 388
select throws_ok($$delete from audit.authorization_evaluation_failure_attempts where evaluation_attempt_id='AUTH-DB-032-FAILURE-001' and attempt_ordinal=1$$, '55000', 'AUTH_DB_032_APPEND_ONLY_MUTATION_FORBIDDEN', 'failure attempts are append-only on DELETE');

-- 389
select is(audit.get_authorization_decision('03200000-0000-0000-0000-000000000201') ->> 'decision_id', '03200000-0000-0000-0000-000000000201', 'private get returns requested decision');

-- 390
select ok(audit.get_authorization_decision('03200000-0000-0000-0000-000000000203') ? 'decision_payload', 'private get may include full private payload for technical caller');

-- 391
select is(pg_catalog.jsonb_array_length(audit.list_authorization_decision_links('03200000-0000-0000-0000-000000000202')), 7, 'private link list returns all seven typed links');

-- 392
select throws_ok($$select audit.search_authorization_decisions('{}'::jsonb)$$, '22023', 'AUTH_DB_032_SEARCH_LIMIT_REQUIRED', 'search requires explicit limit');

-- 393
select throws_ok($$select audit.search_authorization_decisions('{"limit":101}'::jsonb)$$, '22023', 'AUTH_DB_032_SEARCH_LIMIT_INVALID', 'search rejects limit above physical maximum');

-- 394
select throws_ok($$select audit.search_authorization_decisions('{"limit":10,"order_by":"decision_id"}'::jsonb)$$, '22023', 'AUTH_DB_032_SEARCH_FILTER_FORBIDDEN', 'search rejects arbitrary order expressions');

-- 395
select throws_ok($$select audit.search_authorization_decisions('{"limit":10,"sql":"select 1"}'::jsonb)$$, '22023', 'AUTH_DB_032_SEARCH_FILTER_FORBIDDEN', 'search rejects arbitrary SQL');

-- 396
select throws_ok($$select audit.search_authorization_decisions('{"limit":10,"outcome":"MAYBE"}'::jsonb)$$, '22023', 'AUTH_DB_032_SEARCH_OUTCOME_INVALID', 'search rejects noncanonical outcome');

-- 397
select ok(pg_catalog.jsonb_array_length(audit.search_authorization_decisions(pg_catalog.jsonb_build_object('limit',100,'decision_id','03200000-0000-0000-0000-000000000201')) -> 'items') >= 1, 'search filters by decision_id');

-- 398
select ok(pg_catalog.jsonb_array_length(audit.search_authorization_decisions(pg_catalog.jsonb_build_object('limit',100,'correlation_id','AUTH-DB-032-PGTAP')) -> 'items') >= 4, 'search filters by correlation_id');

-- 399
select ok(pg_catalog.jsonb_array_length(audit.search_authorization_decisions(pg_catalog.jsonb_build_object('limit',100,'actor_id','03200000-0000-0000-0000-000000000101')) -> 'items') >= 4, 'search filters by actor_id');

-- 400
select ok(pg_catalog.jsonb_array_length(audit.search_authorization_decisions(pg_catalog.jsonb_build_object('limit',100,'principal_id','03200000-0000-0000-0000-000000000102')) -> 'items') >= 4, 'search filters by principal_id');

-- 401
select ok(pg_catalog.jsonb_array_length(audit.search_authorization_decisions(pg_catalog.jsonb_build_object('limit',100,'app_code','shell')) -> 'items') >= 4, 'search filters by app_code');

-- 402
select ok(pg_catalog.jsonb_array_length(audit.search_authorization_decisions(pg_catalog.jsonb_build_object('limit',100,'permission_key','shell.access')) -> 'items') >= 4, 'search filters by permission_key');

-- 403
select ok(pg_catalog.jsonb_array_length(audit.search_authorization_decisions(pg_catalog.jsonb_build_object('limit',100,'resource_type','TEST_RESOURCE')) -> 'items') >= 4, 'search filters by resource_type');

-- 404
select ok(pg_catalog.jsonb_array_length(audit.search_authorization_decisions(pg_catalog.jsonb_build_object('limit',100,'resource_id','R1')) -> 'items') >= 1, 'search filters by resource_id');

-- 405
select ok(pg_catalog.jsonb_array_length(audit.search_authorization_decisions(pg_catalog.jsonb_build_object('limit',100,'outcome','DENY')) -> 'items') >= 1, 'search filters by outcome');

-- 406
select ok(not ((audit.search_authorization_decisions('{"limit":100}'::jsonb) #> '{items,0}') ? 'decision_payload'), 'search excludes decision_payload by default');

-- 407
select ok(audit.search_authorization_decisions('{"limit":1}'::jsonb) -> 'next_cursor' <> 'null'::jsonb, 'search emits stable cursor when another page exists');

-- 408
select ok(pg_catalog.jsonb_array_length(audit.search_authorization_decisions('{"limit":1}'::jsonb) -> 'items') = 1, 'search enforces page limit');

-- 409
select ok(pg_catalog.jsonb_array_length(audit.search_authorization_decisions('{"limit":100,"decided_from":"1999-01-01T00:00:00Z","decided_to":"2001-01-01T00:00:00Z"}'::jsonb) -> 'items') >= 4, 'search honors temporal bounds');

-- 410
select ok(pg_catalog.has_function_privilege('authenticated','api.get_safe_authorization_decision(jsonb)','EXECUTE'), 'authenticated retains exact safe wrapper execute');

-- 411
select ok(not pg_catalog.has_function_privilege('public','api.get_safe_authorization_decision(jsonb)','EXECUTE'), 'public cannot execute safe wrapper');

-- 412
select ok(not pg_catalog.has_function_privilege('anon','api.get_safe_authorization_decision(jsonb)','EXECUTE'), 'anon cannot execute safe wrapper');

-- 413
select ok(not pg_catalog.has_function_privilege('service_role','api.get_safe_authorization_decision(jsonb)','EXECUTE'), 'service_role cannot execute safe wrapper');

-- 414
select ok(pg_catalog.pg_get_functiondef('api.get_safe_authorization_decision(jsonb)'::regprocedure) ilike '%evaluate_and_record_authorization%', 'safe wrapper routes through persistent coordinator');

-- 415
select ok(pg_catalog.pg_get_functiondef('api.get_safe_authorization_decision(jsonb)'::regprocedure) not ilike '%evaluate_authorization(%', 'safe wrapper no longer bypasses persistence');

-- 416
select ok(pg_catalog.pg_get_functiondef('app_private.authorization_policy_allows(jsonb)'::regprocedure) ilike '%evaluate_authorization%', 'RLS predicate retains side-effect-free evaluator');

-- 417
select ok(pg_catalog.pg_get_functiondef('app_private.authorization_policy_allows(jsonb)'::regprocedure) not ilike '%evaluate_and_record_authorization%', 'RLS predicate does not write audit');

select pg_catalog.set_config('request.jwt.claims','{}',true);
select pg_catalog.set_config('request.jwt.claim.sub','',true);

create temporary table auth_db_032_wrapper_before on commit drop as select count(*)::bigint as c from audit.authorization_decisions;

create temporary table auth_db_032_wrapper_result on commit drop as select api.get_safe_authorization_decision(pg_temp.auth_db_032_evaluation_request()) as result;

-- 418
select is((select count(*)::bigint from audit.authorization_decisions), (select c+1 from auth_db_032_wrapper_before), 'safe wrapper persists exactly one decision before returning');

-- 419
select ok((select result ->> 'outcome' in ('ALLOW','DENY') from auth_db_032_wrapper_result), 'safe wrapper semantic outcome remains ALLOW or DENY');

-- 420
select ok(not (select result ? 'audit' from auth_db_032_wrapper_result), 'safe wrapper does not expose raw audit');

-- 421
select ok(not (select result ? 'decision_payload' from auth_db_032_wrapper_result), 'safe wrapper does not expose full private payload');

-- 422
select ok((select result ? 'correlation_id' from auth_db_032_wrapper_result), 'safe wrapper preserves safe correlation metadata');

create temporary table auth_db_032_policy_before on commit drop as select count(*)::bigint as c from audit.authorization_decisions;

select app_private.authorization_policy_allows(pg_temp.auth_db_032_evaluation_request());

-- 423
select is((select count(*)::bigint from audit.authorization_decisions), (select c from auth_db_032_policy_before), 'authorization_policy_allows has zero persistence side effects');

-- 424
select is((select pg_catalog.count(*) from pg_catalog.pg_trigger tg where tg.tgrelid='audit.authorization_decisions'::regclass and not tg.tgisinternal and tg.tgname like 'trg_auth_db_032%append_only'), 1::bigint, 'authorization_decisions has one append-only trigger');

-- 425
select is((select pg_catalog.count(*) from pg_catalog.pg_trigger tg where tg.tgrelid='audit.authorization_decision_resources'::regclass and not tg.tgisinternal and tg.tgname like 'trg_auth_db_032%append_only'), 1::bigint, 'authorization_decision_resources has one append-only trigger');

-- 426
select is((select pg_catalog.count(*) from pg_catalog.pg_trigger tg where tg.tgrelid='audit.authorization_decision_links'::regclass and not tg.tgisinternal and tg.tgname like 'trg_auth_db_032%append_only'), 1::bigint, 'authorization_decision_links has one append-only trigger');

-- 427
select is((select pg_catalog.count(*) from pg_catalog.pg_trigger tg where tg.tgrelid='audit.authorization_evaluation_failures'::regclass and not tg.tgisinternal and tg.tgname like 'trg_auth_db_032%append_only'), 1::bigint, 'authorization_evaluation_failures has one append-only trigger');

-- 428
select is((select pg_catalog.count(*) from pg_catalog.pg_trigger tg where tg.tgrelid='audit.authorization_evaluation_failure_attempts'::regclass and not tg.tgisinternal and tg.tgname like 'trg_auth_db_032%append_only'), 1::bigint, 'authorization_evaluation_failure_attempts has one append-only trigger');

-- 429
select ok(pg_catalog.to_regclass('audit.uq_authorization_decision_persistence_policy_active') is not null, 'index uq_authorization_decision_persistence_policy_active exists for required query pattern');

-- 430
select ok(pg_catalog.to_regclass('audit.ix_authorization_decisions_correlation_time') is not null, 'index ix_authorization_decisions_correlation_time exists for required query pattern');

-- 431
select ok(pg_catalog.to_regclass('audit.ix_authorization_decisions_actor_time') is not null, 'index ix_authorization_decisions_actor_time exists for required query pattern');

-- 432
select ok(pg_catalog.to_regclass('audit.ix_authorization_decisions_principal_time') is not null, 'index ix_authorization_decisions_principal_time exists for required query pattern');

-- 433
select ok(pg_catalog.to_regclass('audit.ix_authorization_decisions_device_time') is not null, 'index ix_authorization_decisions_device_time exists for required query pattern');

-- 434
select ok(pg_catalog.to_regclass('audit.ix_authorization_decisions_permission_time') is not null, 'index ix_authorization_decisions_permission_time exists for required query pattern');

-- 435
select ok(pg_catalog.to_regclass('audit.ix_authorization_decisions_outcome_time') is not null, 'index ix_authorization_decisions_outcome_time exists for required query pattern');

-- 436
select ok(pg_catalog.to_regclass('audit.ix_authorization_decision_resources_lookup') is not null, 'index ix_authorization_decision_resources_lookup exists for required query pattern');

-- 437
select ok(pg_catalog.to_regclass('audit.ix_authorization_decision_links_decision_time') is not null, 'index ix_authorization_decision_links_decision_time exists for required query pattern');

-- 438
select ok(pg_catalog.to_regclass('audit.ix_authorization_evaluation_failures_correlation_time') is not null, 'index ix_authorization_evaluation_failures_correlation_time exists for required query pattern');

-- 439
select ok(pg_catalog.to_regclass('audit.ix_authorization_evaluation_failures_permission_time') is not null, 'index ix_authorization_evaluation_failures_permission_time exists for required query pattern');

-- 440
select ok(pg_catalog.to_regclass('audit.ix_authorization_evaluation_failures_stage_time') is not null, 'index ix_authorization_evaluation_failures_stage_time exists for required query pattern');

-- 441
select ok(not pg_catalog.has_schema_privilege('anon','audit','USAGE'), 'anon has no audit schema usage');

-- 442
select ok(not pg_catalog.has_schema_privilege('authenticated','audit','USAGE'), 'authenticated has no audit schema usage');

-- 443
select ok(not pg_catalog.has_schema_privilege('service_role','audit','USAGE'), 'service_role has no broad audit schema usage');

-- 444
select is((select count(*) from pg_catalog.pg_policy p where p.polrelid in ('audit.authorization_decisions'::regclass,'audit.authorization_decision_resources'::regclass,'audit.authorization_decision_links'::regclass,'audit.authorization_evaluation_failures'::regclass,'audit.authorization_evaluation_failure_attempts'::regclass,'audit.authorization_decision_persistence_policies'::regclass)), 0::bigint, '032 creates no direct-client RLS policies');

-- 445
select ok(not exists(select 1 from pg_catalog.pg_class c join pg_catalog.pg_namespace n on n.oid=c.relnamespace where n.nspname='audit' and c.relname in ('business_event_record','outbox_item','inbox_item')), '032 does not create generic event outbox or inbox');

-- 446
select ok(not exists(select 1 from audit.authorization_decisions where outcome not in ('ALLOW','DENY')), 'persisted decision outcomes remain binary');

-- 447
select ok(not exists(select 1 from audit.authorization_decisions where outcome='DENY' and cardinality(authorizing_lanes)<>0), 'persisted DENY rows have zero authorizing lanes');

-- 448
select ok(not exists(select 1 from audit.authorization_decisions where outcome='ALLOW' and cardinality(authorizing_lanes)=0), 'persisted ALLOW rows retain authorization lane evidence');

-- 449
select ok(not exists(select 1 from audit.authorization_decision_resources r join audit.authorization_decisions d using(decision_id) where r.resource_fingerprint is distinct from d.resource_fingerprint), 'resource child fingerprint remains equal to parent decision resource fingerprint');

-- 450
select ok(not exists(select 1 from audit.authorization_evaluation_failures where source_status<>'UNAVAILABLE' or not session_preserved or effects_committed), 'technical failure invariants hold across persisted rows');

-- 451
select ok(not exists(select 1 from audit.authorization_evaluation_failure_attempts a left join audit.authorization_evaluation_failures f using(evaluation_attempt_id) where f.evaluation_attempt_id is null), 'failure attempts remain linked to technical failure parent');

-- 452
select ok((select decision_record_fingerprint from audit.authorization_decisions where decision_id='03200000-0000-0000-0000-000000000201') = (select decision_record_fingerprint from audit.authorization_decisions where decision_id='03200000-0000-0000-0000-000000000201'), 'decision record fingerprint is stable inside transaction');

-- 453
select is((select source_contract_fingerprint from audit.authorization_decision_persistence_policies where category='NAVIGATION' and status='ACTIVE'), 'sha256:b4ac332aebb731370919938eb29bb491ded5f17df360ce1fc731733a63b9c925', 'persistence policy records exact source contract fingerprint');

-- 454
select is((select count(*) from audit.authorization_decision_persistence_policies where retention_class not in ('RET_TRANSIENT','RET_ACTIVE_CASE','RET_BUSINESS_CYCLE','RET_RELATIONSHIP','RET_OBLIGATION','RET_ARCHIVAL','RET_HOLD','RET_PERMANENT_EXCEPTION','RET_UNRESOLVED')), 0::bigint, 'policy registry uses only canonical retention classes');

-- 455
select ok(not exists(select 1 from pg_catalog.pg_proc p join pg_catalog.pg_namespace n on n.oid=p.pronamespace where n.nspname='api' and p.proname like '%authorization%audit%search%'), '032 creates no generic authenticated audit search API');


-- 456
select is(
  app_private.resolve_authorization_persistence_profile(
    pg_temp.auth_db_032_decision(
      '03200000-0000-0000-0000-000000000018',
      'ALLOW',
      'READ',
      'SERVER_ACTION',
      'AGGREGATE',
      '{}'::text[],
      true
    )
  ) ->> 'evidence_storage_mode',
  'FULL_DECISION',
  'sensitive aggregate escalates from anchor to full decision'
);

set local role vento_authorization_owner;

update audit.authorization_decision_persistence_policies
set evidence_storage_mode = 'FULL_DECISION',
    sensitivity_floor = 'FUNCTIONAL_SENSITIVE',
    retention_class = 'RET_OBLIGATION'
where category = 'NAVIGATION'
  and status = 'ACTIVE';

reset role;

-- 457
select is(
  audit.append_authorization_decision(
    pg_temp.auth_db_032_decision(
      '03200000-0000-0000-0000-000000000201',
      'ALLOW',
      'APP_ACCESS',
      'SERVER_ACTION',
      'NON_RESOURCE',
      '{}'::text[],
      false
    )
  ),
  '03200000-0000-0000-0000-000000000201',
  'historical retry reuses persisted profile after policy evolution'
);

set local role vento_authorization_owner;

update audit.authorization_decision_persistence_policies
set evidence_storage_mode = 'AUDIT_ANCHOR',
    sensitivity_floor = 'FUNCTIONAL',
    retention_class = 'RET_BUSINESS_CYCLE'
where category = 'NAVIGATION'
  and status = 'ACTIVE';

reset role;

select * from finish();
rollback;
