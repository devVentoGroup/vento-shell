-- VENTO_DB_TEST_CATEGORY: RPC
begin;

create extension if not exists pgtap with schema extensions;

select plan(208);


set local role vento_authorization_owner;

insert into audit.authorization_decisions (
  decision_id, decision_contract_version, decision_schema_version, decision_record_fingerprint,
  decided_at, recorded_at, correlation_id, context_id, principal_id, actor_id, device_id,
  app_code, permission_key, operation_kind, request_source, resource_type, resource_ids,
  outcome, authorizing_lanes, authorization_reason_codes, context_fingerprint,
  resource_fingerprint, catalog_hash, dataset_hashes, evaluator_name, evaluator_version,
  evidence_storage_mode, decision_payload, sensitivity_class, retention_class, source_contract_sha256
) values
  (
    '01200000-0000-4000-8000-000000000100', '1.0.0', '1.0.0', 'sha256:' || repeat('1',64),
    '2000-01-01T00:00:00Z', '2000-01-01T00:00:00Z', 'AUTH-DB-012-CORR-ALLOW',
    '01200000-0000-4000-8000-000000000110', '01200000-0000-4000-8000-000000000111',
    '01200000-0000-4000-8000-000000000112', '01200000-0000-4000-8000-000000000113',
    'shell', 'shell.authorization.permission.manage', 'UPDATE', 'SERVER_ACTION',
    'AUTHORIZATION_PERMISSION', '{}'::text[], 'ALLOW', array['BASE']::text[], '{}'::text[],
    'sha256:' || repeat('2',64), 'sha256:' || repeat('3',64), 'sha256:' || repeat('4',64),
    '{}'::jsonb, 'vento.authorization.evaluate_authorization', '20260902', 'AUDIT_ANCHOR', null,
    'FUNCTIONAL_SENSITIVE', 'RET_OBLIGATION', 'b4ac332aebb731370919938eb29bb491ded5f17df360ce1fc731733a63b9c925'
  ),
  (
    '01200000-0000-4000-8000-000000000101', '1.0.0', '1.0.0', 'sha256:' || repeat('5',64),
    '2000-01-01T00:00:00Z', '2000-01-01T00:00:00Z', 'AUTH-DB-012-CORR-DENY',
    '01200000-0000-4000-8000-000000000120', '01200000-0000-4000-8000-000000000121',
    '01200000-0000-4000-8000-000000000122', null,
    'shell', 'shell.authorization.permission.manage', 'UPDATE', 'SERVER_ACTION',
    'AUTHORIZATION_PERMISSION', '{}'::text[], 'DENY', '{}'::text[], array['AUTH_ADMIN_PERMISSION_DENIED']::text[],
    'sha256:' || repeat('6',64), 'sha256:' || repeat('7',64), 'sha256:' || repeat('8',64),
    '{}'::jsonb, 'vento.authorization.evaluate_authorization', '20260902', 'AUDIT_ANCHOR', null,
    'FUNCTIONAL_SENSITIVE', 'RET_OBLIGATION', 'b4ac332aebb731370919938eb29bb491ded5f17df360ce1fc731733a63b9c925'
  )
on conflict (decision_id) do nothing;

reset role;

create function pg_temp.auth_db_012_item(
  p_item_id text,
  p_ordinal integer default 1,
  p_source_kind text default 'BASE_ROLE_GRANT',
  p_subject_kind text default 'BASE_ROLE',
  p_subject_reference text default 'gerente',
  p_permission_key text default 'shell.access',
  p_lane text default 'BASE',
  p_effect text default 'ALLOW',
  p_change_kind text default 'CREATE',
  p_before_status text default 'ACTIVE',
  p_after_status text default 'SUSPENDED'
)
returns jsonb
language sql
immutable
as $auth_db_012_item$
  select jsonb_build_object(
    'permission_change_id', p_item_id,
    'change_ordinal', p_ordinal,
    'source_kind', p_source_kind,
    'authorization_record_reference', 'AUTHREC-' || p_item_id,
    'subject_kind', p_subject_kind,
    'subject_reference', p_subject_reference,
    'permission_key', p_permission_key,
    'lane', p_lane,
    'effect', p_effect,
    'change_kind', p_change_kind,
    'changed_fields', jsonb_build_array('lifecycle_status'),
    'before_state', case when p_change_kind = 'CREATE' then null else jsonb_build_object(
      'subject_reference', p_subject_reference,
      'permission_key', p_permission_key,
      'lane', p_lane,
      'effect', p_effect,
      'lifecycle_status', p_before_status
    ) end,
    'after_state', jsonb_build_object(
      'subject_reference', p_subject_reference,
      'permission_key', p_permission_key,
      'lane', p_lane,
      'effect', p_effect,
      'lifecycle_status', case when p_change_kind = 'CREATE' then 'ACTIVE' else p_after_status end
    ),
    'source_dataset_id', 'vento.authorization.fixture',
    'source_dataset_version', '1.0.0',
    'source_dataset_hash', 'sha256:' || repeat('a',64),
    'item_reason_code', 'RESPONSIBILITY_APPROVED'
  );
$auth_db_012_item$;

create function pg_temp.auth_db_012_change(
  p_set_id text,
  p_item_id text,
  p_command_id text,
  p_decision_id text default '01200000-0000-4000-8000-000000000100',
  p_items jsonb default null
)
returns jsonb
language sql
immutable
as $auth_db_012_change$
  select jsonb_build_object(
    'change_set_id', p_set_id,
    'occurred_at', '2000-01-01T00:00:01.000Z',
    'session_id', 'SESSION-012-FIXTURE',
    'app_code', 'shell',
    'request_source', case when p_decision_id is null then 'MIGRATION' else 'SERVER_ACTION' end,
    'command_id', p_command_id,
    'authorization_decision_id', p_decision_id,
    'correlation_id', case when p_decision_id = '01200000-0000-4000-8000-000000000101' then 'AUTH-DB-012-CORR-DENY' else 'AUTH-DB-012-CORR-ALLOW' end,
    'causation_id', 'CAUSE-AUTH-DB-012',
    'reason_code', 'RESPONSIBILITY_APPROVED',
    'justification_reference', 'CASE-AUTH-DB-012',
    'source_reference', 'SOURCE-AUTH-DB-012',
    'approval_reference', 'APPROVAL-AUTH-DB-012',
    'source_dataset_versions', jsonb_build_object('base_grants','1.0.0'),
    'source_dataset_hashes', jsonb_build_object('base_grants','sha256:' || repeat('b',64)),
    'items', coalesce(p_items, jsonb_build_array(pg_temp.auth_db_012_item(p_item_id))),
    'links', '[]'::jsonb
  );
$auth_db_012_change$;

create function pg_temp.auth_db_012_attempt(
  p_attempt_id text,
  p_command_id text,
  p_result text,
  p_decision_id text default null,
  p_error_class text default null,
  p_result_reference text default null
)
returns jsonb
language sql
immutable
as $auth_db_012_attempt$
  select jsonb_build_object(
    'change_attempt_id', p_attempt_id,
    'occurred_at', '2000-01-01T00:00:02.000Z',
    'app_code', 'shell',
    'request_source', case when p_decision_id is null then 'MIGRATION' else 'SERVER_ACTION' end,
    'command_id', p_command_id,
    'authorization_decision_id', p_decision_id,
    'correlation_id', case when p_decision_id = '01200000-0000-4000-8000-000000000101' then 'AUTH-DB-012-CORR-DENY' else 'AUTH-DB-012-CORR-ALLOW' end,
    'permission_key', 'shell.access',
    'source_kind', 'BASE_ROLE_GRANT',
    'subject_kind', 'BASE_ROLE',
    'subject_reference', 'gerente',
    'requested_change_kind', 'CREATE',
    'attempt_result', p_result,
    'reason_code', case when p_result='DENIED' then 'AUTH_ADMIN_PERMISSION_DENIED' else 'CONTROLLED_ATTEMPT' end,
    'error_class', p_error_class,
    'result_reference', p_result_reference
  );
$auth_db_012_attempt$;

create function pg_temp.auth_db_012_explain(p_sql text)
returns text
language plpgsql
volatile
as $auth_db_012_explain$
declare
  v_line text;
  v_plan text := '';
begin
  perform pg_catalog.set_config('enable_seqscan', 'off', true);
  for v_line in execute 'explain (costs off) ' || p_sql loop
    v_plan := v_plan || E'\n' || v_line;
  end loop;
  return v_plan;
end
$auth_db_012_explain$;

-- Baseline successful set used by read/query/integrity assertions.
do $auth_db_012_setup$
begin
  perform audit.append_authorization_permission_change(
    pg_temp.auth_db_012_change(
      '01200000-0000-4000-8000-000000000200',
      '01200000-0000-4000-8000-000000000201',
      'AUTH-DB-012-CMD-200'
    )
  );
end
$auth_db_012_setup$;



do $auth_db_012_attempt_setup$
begin
  perform audit.append_authorization_permission_change_attempt(
    pg_temp.auth_db_012_attempt('01200000-0000-4000-8000-000000000250','AUTH-DB-012-ATTEMPT-CMD-250','NO_CHANGE')
  );
end
$auth_db_012_attempt_setup$;


-- SCHEMA
-- 1
select ok(to_regclass('audit.authorization_permission_change_sets') is not null, 'table audit.authorization_permission_change_sets exists');

-- 2
select ok(to_regclass('audit.authorization_permission_changes') is not null, 'table audit.authorization_permission_changes exists');

-- 3
select ok(to_regclass('audit.authorization_permission_change_attempts') is not null, 'table audit.authorization_permission_change_attempts exists');

-- 4
select ok(to_regclass('audit.authorization_permission_change_links') is not null, 'table audit.authorization_permission_change_links exists');

-- 5
select ok(to_regprocedure('audit.append_authorization_permission_change(jsonb)') is not null, 'function audit.append_authorization_permission_change(jsonb) exists');

-- 6
select ok(to_regprocedure('audit.append_authorization_permission_change_attempt(jsonb)') is not null, 'function audit.append_authorization_permission_change_attempt(jsonb) exists');

-- 7
select ok(to_regprocedure('audit.get_authorization_permission_change(text)') is not null, 'function audit.get_authorization_permission_change(text) exists');

-- 8
select ok(to_regprocedure('audit.search_authorization_permission_changes(jsonb)') is not null, 'function audit.search_authorization_permission_changes(jsonb) exists');

-- 9
select ok(to_regprocedure('audit.list_authorization_permission_change_items(text)') is not null, 'function audit.list_authorization_permission_change_items(text) exists');

-- 10
select ok(to_regprocedure('audit.reject_authorization_permission_audit_mutation()') is not null, 'function audit.reject_authorization_permission_audit_mutation() exists');

-- 11
select ok(to_regprocedure('app_private.canonicalize_authorization_permission_change(jsonb)') is not null, 'function app_private.canonicalize_authorization_permission_change(jsonb) exists');

-- 12
select ok(to_regprocedure('app_private.fingerprint_authorization_permission_change(jsonb)') is not null, 'function app_private.fingerprint_authorization_permission_change(jsonb) exists');


-- ATOMIC_SET
-- 13
select is(audit.append_authorization_permission_change(pg_temp.auth_db_012_change('01200000-0000-4000-8000-000000000202','01200000-0000-4000-8000-000000000203','AUTH-DB-012-CMD-202'))->>'result_code','APPLIED','confirmed change returns APPLIED');

-- 14
select is((select change_count from audit.authorization_permission_change_sets where change_set_id='01200000-0000-4000-8000-000000000202'),1,'change_count is materialized atomically');

-- 15
select is((select count(*) from audit.authorization_permission_changes where change_set_id='01200000-0000-4000-8000-000000000202'),1::bigint,'exactly one item is materialized');

-- 16
select ok(exists(select 1 from audit.authorization_permission_change_links where change_set_id='01200000-0000-4000-8000-000000000202' and link_kind='AUTHORIZATION_DECISION'),'decision link is materialized in same append');

-- 17
select ok(exists(select 1 from audit.authorization_permission_change_links where change_set_id='01200000-0000-4000-8000-000000000202' and link_kind='SOURCE_EVIDENCE'),'source evidence link is materialized');

-- 18
select ok(exists(select 1 from audit.authorization_permission_change_links where change_set_id='01200000-0000-4000-8000-000000000202' and link_kind='APPROVAL'),'approval link is materialized');

-- 19
select ok((select recorded_at>=occurred_at from audit.authorization_permission_change_sets where change_set_id='01200000-0000-4000-8000-000000000202'),'set chronology is monotonic');

-- 20
select ok((select recorded_at>=occurred_at from audit.authorization_permission_changes where permission_change_id='01200000-0000-4000-8000-000000000203'),'item chronology is monotonic');

-- 21
select is((select recorded_at from audit.authorization_permission_changes where permission_change_id='01200000-0000-4000-8000-000000000203'),(select recorded_at from audit.authorization_permission_change_sets where change_set_id='01200000-0000-4000-8000-000000000202'),'set and item share audit recording instant');

-- 22
select is((select change_ordinal from audit.authorization_permission_changes where permission_change_id='01200000-0000-4000-8000-000000000203'),1,'first item ordinal is one');

-- 23
select ok(not exists(select 1 from audit.authorization_permission_changes i left join audit.authorization_permission_change_sets s using(change_set_id) where s.change_set_id is null),'no orphan items exist');

-- 24
select ok(not exists(select 1 from audit.authorization_permission_change_links l left join audit.authorization_permission_change_sets s using(change_set_id) where s.change_set_id is null),'no orphan links exist');

-- 25
select ok(not exists(select 1 from audit.authorization_permission_change_links l left join audit.authorization_permission_changes i on i.permission_change_id=l.permission_change_id where l.permission_change_id is not null and i.permission_change_id is null),'no orphan item links exist');

-- 26
select ok(not exists(select 1 from audit.authorization_permission_change_sets s where s.authorization_decision_id is not null and not exists(select 1 from audit.authorization_decisions d where d.decision_id=s.authorization_decision_id)),'decision references are not orphaned');

-- 27
select ok(not exists(select 1 from audit.authorization_permission_change_sets where change_count<=0),'successful sets cannot be empty');

-- 28
select ok(not exists(select 1 from audit.authorization_permission_change_sets s where s.change_count<>(select count(*) from audit.authorization_permission_changes i where i.change_set_id=s.change_set_id)),'declared cardinality equals stored item cardinality');


-- FINGERPRINT
set local role vento_authorization_owner;

-- 29
select is(app_private.canonicalize_authorization_permission_change('{"b":2,"a":1}'::jsonb),app_private.canonicalize_authorization_permission_change('{"a":1,"b":2}'::jsonb),'canonical JSON ignores object key input order');

-- 30
select is(app_private.fingerprint_authorization_permission_change('{"b":2,"a":1}'::jsonb),app_private.fingerprint_authorization_permission_change('{"a":1,"b":2}'::jsonb),'fingerprint is deterministic across object key order');

-- 31
select isnt(app_private.fingerprint_authorization_permission_change('{"a":1}'::jsonb),app_private.fingerprint_authorization_permission_change('{"a":2}'::jsonb),'semantic payload change changes fingerprint');

-- 32
select matches(app_private.fingerprint_authorization_permission_change('{}'::jsonb),'^sha256:[0-9a-f]{64}$','fingerprint format is sha256 plus lowercase hex');

reset role;

-- 33
select matches((select change_set_fingerprint from audit.authorization_permission_change_sets where change_set_id='01200000-0000-4000-8000-000000000200'),'^sha256:[0-9a-f]{64}$','stored set fingerprint format is canonical');

-- 34
select matches((select item_fingerprint from audit.authorization_permission_changes where permission_change_id='01200000-0000-4000-8000-000000000201'),'^sha256:[0-9a-f]{64}$','stored item fingerprint format is canonical');

-- 35
select is((select before_fingerprint from audit.authorization_permission_changes where permission_change_id='01200000-0000-4000-8000-000000000201'),null::text,'CREATE has null before fingerprint');

-- 36
select matches((select after_fingerprint from audit.authorization_permission_changes where permission_change_id='01200000-0000-4000-8000-000000000201'),'^sha256:[0-9a-f]{64}$','CREATE has after fingerprint');

-- 37
select isnt((select change_set_fingerprint from audit.authorization_permission_change_sets where change_set_id='01200000-0000-4000-8000-000000000200'),(select after_fingerprint from audit.authorization_permission_changes where permission_change_id='01200000-0000-4000-8000-000000000201'),'set and state fingerprints have distinct preimages');

-- 38
select ok(position('canonicalize_authorization_permission_change' in pg_get_functiondef('app_private.fingerprint_authorization_permission_change(jsonb)'::regprocedure))>0,'fingerprint helper calls canonicalizer');

-- 39
select ok(position('extensions.digest' in pg_get_functiondef('app_private.fingerprint_authorization_permission_change(jsonb)'::regprocedure))>0,'fingerprint helper uses extensions.digest');

-- 40
select ok(position('jsonb::text' in lower(pg_get_functiondef('app_private.fingerprint_authorization_permission_change(jsonb)'::regprocedure)))=0,'fingerprint helper does not use jsonb::text as canonical contract');

-- 41
select is((select provolatile from pg_proc where oid='app_private.canonicalize_authorization_permission_change(jsonb)'::regprocedure),'i','canonicalizer is immutable');

-- 42
select ok(not (select prosecdef from pg_proc where oid='app_private.canonicalize_authorization_permission_change(jsonb)'::regprocedure),'canonicalizer is SECURITY INVOKER');

-- 43
select is((select provolatile from pg_proc where oid='app_private.fingerprint_authorization_permission_change(jsonb)'::regprocedure),'i','fingerprint helper is immutable');

-- 44
select is((select source_contract_sha256 from audit.authorization_permission_change_sets where change_set_id='01200000-0000-4000-8000-000000000200'),'ed13f66b299c7e6479201345309ce3e362d15c268249ee905d0c0655e61c0ff7','stored set anchors exact AUTH-DB-012 contract');


-- APPEND_ONLY
-- 45
select ok(exists(select 1 from pg_trigger t where t.tgrelid='audit.authorization_permission_change_sets'::regclass and not t.tgisinternal and t.tgname like 'trg_auth_db_012%'),'append-only trigger exists on authorization_permission_change_sets');

-- 46
select ok(exists(select 1 from pg_trigger t where t.tgrelid='audit.authorization_permission_changes'::regclass and not t.tgisinternal and t.tgname like 'trg_auth_db_012%'),'append-only trigger exists on authorization_permission_changes');

-- 47
select ok(exists(select 1 from pg_trigger t where t.tgrelid='audit.authorization_permission_change_attempts'::regclass and not t.tgisinternal and t.tgname like 'trg_auth_db_012%'),'append-only trigger exists on authorization_permission_change_attempts');

-- 48
select ok(exists(select 1 from pg_trigger t where t.tgrelid='audit.authorization_permission_change_links'::regclass and not t.tgisinternal and t.tgname like 'trg_auth_db_012%'),'append-only trigger exists on authorization_permission_change_links');

set local role vento_authorization_owner;

-- 49
select throws_ok($$update audit.authorization_permission_change_sets set reason_code=reason_code where change_set_id='01200000-0000-4000-8000-000000000200'$$,'55000','AUTH_DB_012_APPEND_ONLY_MUTATION_FORBIDDEN','UPDATE is rejected on authorization_permission_change_sets');

-- 50
select throws_ok($$update audit.authorization_permission_changes set item_reason_code=item_reason_code where permission_change_id='01200000-0000-4000-8000-000000000201'$$,'55000','AUTH_DB_012_APPEND_ONLY_MUTATION_FORBIDDEN','UPDATE is rejected on authorization_permission_changes');

-- 51
select throws_ok($$update audit.authorization_permission_change_attempts set reason_code=reason_code where change_attempt_id='01200000-0000-4000-8000-000000000250'$$,'55000','AUTH_DB_012_APPEND_ONLY_MUTATION_FORBIDDEN','UPDATE is rejected on authorization_permission_change_attempts');

-- 52
select throws_ok($$update audit.authorization_permission_change_links set reference_id=reference_id where change_set_id='01200000-0000-4000-8000-000000000200'$$,'55000','AUTH_DB_012_APPEND_ONLY_MUTATION_FORBIDDEN','UPDATE is rejected on authorization_permission_change_links');

-- 53
select throws_ok($$delete from audit.authorization_permission_change_sets where change_set_id='01200000-0000-4000-8000-000000000200'$$,'55000','AUTH_DB_012_APPEND_ONLY_MUTATION_FORBIDDEN','DELETE is rejected on authorization_permission_change_sets');

-- 54
select throws_ok($$delete from audit.authorization_permission_changes where permission_change_id='01200000-0000-4000-8000-000000000201'$$,'55000','AUTH_DB_012_APPEND_ONLY_MUTATION_FORBIDDEN','DELETE is rejected on authorization_permission_changes');

-- 55
select throws_ok($$delete from audit.authorization_permission_change_attempts where change_attempt_id='01200000-0000-4000-8000-000000000250'$$,'55000','AUTH_DB_012_APPEND_ONLY_MUTATION_FORBIDDEN','DELETE is rejected on authorization_permission_change_attempts');

-- 56
select throws_ok($$delete from audit.authorization_permission_change_links where change_set_id='01200000-0000-4000-8000-000000000200'$$,'55000','AUTH_DB_012_APPEND_ONLY_MUTATION_FORBIDDEN','DELETE is rejected on authorization_permission_change_links');

reset role;


-- IDEMPOTENCY
-- 57
select is((audit.append_authorization_permission_change(pg_temp.auth_db_012_change('01200000-0000-4000-8000-000000000200','01200000-0000-4000-8000-000000000201','AUTH-DB-012-CMD-200'))->>'idempotent')::boolean,true,'exact duplicate set is idempotent');

-- 58
select is((select count(*) from audit.authorization_permission_change_sets where change_set_id='01200000-0000-4000-8000-000000000200'),1::bigint,'idempotent set retry does not duplicate parent');

-- 59
select is((select count(*) from audit.authorization_permission_changes where change_set_id='01200000-0000-4000-8000-000000000200'),1::bigint,'idempotent set retry does not duplicate items');

-- 60
select is((select count(*) from audit.authorization_permission_change_links where change_set_id='01200000-0000-4000-8000-000000000200'),3::bigint,'idempotent set retry does not duplicate automatic links');

-- 61
select throws_ok($$select audit.append_authorization_permission_change(jsonb_set(pg_temp.auth_db_012_change('01200000-0000-4000-8000-000000000200','01200000-0000-4000-8000-000000000201','AUTH-DB-012-CMD-200'),'{reason_code}','"SECURITY_CORRECTION"'::jsonb))$$,'23505','AUTH_DB_012_CHANGE_SET_INTEGRITY_CONFLICT','same set identity with different semantics conflicts');

-- 62
select throws_ok($$select audit.append_authorization_permission_change(pg_temp.auth_db_012_change('01200000-0000-4000-8000-000000000260','01200000-0000-4000-8000-000000000261','AUTH-DB-012-CMD-200'))$$,'23505','AUTH_DB_012_CHANGE_SET_INTEGRITY_CONFLICT','same command cannot resolve to another set');

-- 63
select throws_ok($$select audit.append_authorization_permission_change(pg_temp.auth_db_012_change('01200000-0000-4000-8000-000000000200','01200000-0000-4000-8000-000000000201','AUTH-DB-012-CMD-DIFFERENT'))$$,'23505','AUTH_DB_012_CHANGE_SET_INTEGRITY_CONFLICT','same set cannot be replayed as another command');

-- 64
select is(audit.append_authorization_permission_change_attempt(pg_temp.auth_db_012_attempt('01200000-0000-4000-8000-000000000250','AUTH-DB-012-ATTEMPT-CMD-250','NO_CHANGE')),'01200000-0000-4000-8000-000000000250','exact duplicate attempt is idempotent');

-- 65
select is((select count(*) from audit.authorization_permission_change_attempts where change_attempt_id='01200000-0000-4000-8000-000000000250'),1::bigint,'attempt retry does not duplicate evidence');

-- 66
select throws_ok($$select audit.append_authorization_permission_change_attempt(pg_temp.auth_db_012_attempt('01200000-0000-4000-8000-000000000250','AUTH-DB-012-ATTEMPT-CMD-250','CONFLICT'))$$,'23505','AUTH_DB_012_ATTEMPT_INTEGRITY_CONFLICT','attempt identity cannot be reused with different semantics');

-- 67
select throws_ok($$select audit.append_authorization_permission_change(jsonb_set(pg_temp.auth_db_012_change('01200000-0000-4000-8000-000000000262','01200000-0000-4000-8000-000000000263','AUTH-DB-012-CMD-262'),'{items}',jsonb_build_array(pg_temp.auth_db_012_item('01200000-0000-4000-8000-000000000263',1),pg_temp.auth_db_012_item('01200000-0000-4000-8000-000000000264',1))))$$,'22023','AUTH_DB_012_CHANGE_ORDINAL_INVALID_OR_DUPLICATE','duplicate ordinals fail closed');

-- 68
select throws_ok($$select audit.append_authorization_permission_change(jsonb_set(pg_temp.auth_db_012_change('01200000-0000-4000-8000-000000000265','01200000-0000-4000-8000-000000000266','AUTH-DB-012-CMD-265'),'{items}',jsonb_build_array(pg_temp.auth_db_012_item('01200000-0000-4000-8000-000000000266',1),pg_temp.auth_db_012_item('01200000-0000-4000-8000-000000000267',3))))$$,'22023','AUTH_DB_012_CHANGE_ORDINAL_NOT_CONTIGUOUS','gapped ordinals fail closed');


-- ACL_RLS
-- 69
select ok((select relrowsecurity from pg_class where oid='audit.authorization_permission_change_sets'::regclass),'RLS enabled on authorization_permission_change_sets');

-- 70
select ok((select relrowsecurity from pg_class where oid='audit.authorization_permission_changes'::regclass),'RLS enabled on authorization_permission_changes');

-- 71
select ok((select relrowsecurity from pg_class where oid='audit.authorization_permission_change_attempts'::regclass),'RLS enabled on authorization_permission_change_attempts');

-- 72
select ok((select relrowsecurity from pg_class where oid='audit.authorization_permission_change_links'::regclass),'RLS enabled on authorization_permission_change_links');

-- 73
select ok(not (select relforcerowsecurity from pg_class where oid='audit.authorization_permission_change_sets'::regclass),'FORCE RLS is explicitly not used on owner-written authorization_permission_change_sets');

-- 74
select ok(not (select relforcerowsecurity from pg_class where oid='audit.authorization_permission_changes'::regclass),'FORCE RLS is explicitly not used on owner-written authorization_permission_changes');

-- 75
select ok(not (select relforcerowsecurity from pg_class where oid='audit.authorization_permission_change_attempts'::regclass),'FORCE RLS is explicitly not used on owner-written authorization_permission_change_attempts');

-- 76
select ok(not (select relforcerowsecurity from pg_class where oid='audit.authorization_permission_change_links'::regclass),'FORCE RLS is explicitly not used on owner-written authorization_permission_change_links');

-- 77
select ok(not exists(select 1 from (values ('audit.authorization_permission_change_sets'::regclass),('audit.authorization_permission_changes'::regclass),('audit.authorization_permission_change_attempts'::regclass),('audit.authorization_permission_change_links'::regclass)) t(oid) where has_table_privilege('anon',t.oid,'SELECT') or has_table_privilege('anon',t.oid,'INSERT') or has_table_privilege('anon',t.oid,'UPDATE') or has_table_privilege('anon',t.oid,'DELETE')),'anon has zero direct table privileges on AUTH-DB-012 audit');

-- 78
select ok(not exists(select 1 from (values ('audit.authorization_permission_change_sets'::regclass),('audit.authorization_permission_changes'::regclass),('audit.authorization_permission_change_attempts'::regclass),('audit.authorization_permission_change_links'::regclass)) t(oid) where has_table_privilege('authenticated',t.oid,'SELECT') or has_table_privilege('authenticated',t.oid,'INSERT') or has_table_privilege('authenticated',t.oid,'UPDATE') or has_table_privilege('authenticated',t.oid,'DELETE')),'authenticated has zero direct table privileges on AUTH-DB-012 audit');

-- 79
select ok(not exists(select 1 from (values ('audit.authorization_permission_change_sets'::regclass),('audit.authorization_permission_changes'::regclass),('audit.authorization_permission_change_attempts'::regclass),('audit.authorization_permission_change_links'::regclass)) t(oid) where has_table_privilege('service_role',t.oid,'SELECT') or has_table_privilege('service_role',t.oid,'INSERT') or has_table_privilege('service_role',t.oid,'UPDATE') or has_table_privilege('service_role',t.oid,'DELETE')),'service_role has zero direct table privileges on AUTH-DB-012 audit');

-- 80
select ok(not has_function_privilege('anon','audit.append_authorization_permission_change(jsonb)'::regprocedure,'EXECUTE') and not has_function_privilege('anon','audit.append_authorization_permission_change_attempt(jsonb)'::regprocedure,'EXECUTE'),'anon cannot execute AUTH-DB-012 append functions');

-- 81
select ok(not has_function_privilege('authenticated','audit.append_authorization_permission_change(jsonb)'::regprocedure,'EXECUTE') and not has_function_privilege('authenticated','audit.append_authorization_permission_change_attempt(jsonb)'::regprocedure,'EXECUTE'),'authenticated cannot execute AUTH-DB-012 append functions');

-- 82
select ok(not has_function_privilege('service_role','audit.append_authorization_permission_change(jsonb)'::regprocedure,'EXECUTE') and not has_function_privilege('service_role','audit.append_authorization_permission_change_attempt(jsonb)'::regprocedure,'EXECUTE'),'service_role cannot execute AUTH-DB-012 append functions');

-- 83
select ok((select not rolcanlogin and not rolinherit and not rolsuper and not rolcreatedb and not rolcreaterole and not rolreplication and not rolbypassrls from pg_roles where rolname='vento_authorization_owner'),'authorization owner is noninteractive and non-bypass');

-- 84
select ok(not has_schema_privilege('authenticated','audit','USAGE'),'authenticated has no direct audit schema usage');


-- QUERY_CONTRACTS
-- 85
select is(jsonb_typeof(audit.get_authorization_permission_change('01200000-0000-4000-8000-000000000200')),'object','get returns a private JSON object');

-- 86
select is(jsonb_array_length(audit.get_authorization_permission_change('01200000-0000-4000-8000-000000000200')->'items'),1,'get returns ordered items');

-- 87
select is(jsonb_typeof(audit.list_authorization_permission_change_items('01200000-0000-4000-8000-000000000200')),'array','list items returns array');

-- 88
select throws_ok($$select audit.search_authorization_permission_changes('{}'::jsonb)$$,'22023','AUTH_DB_012_SEARCH_LIMIT_REQUIRED','search requires an explicit limit');

-- 89
select throws_ok($$select audit.search_authorization_permission_changes('{"limit":1,"sql":"select 1"}'::jsonb)$$,'22023','AUTH_DB_012_SEARCH_FILTER_FORBIDDEN','search rejects free SQL/filter injection');

-- 90
select throws_ok($$select audit.search_authorization_permission_changes('{"limit":101}'::jsonb)$$,'22023','AUTH_DB_012_SEARCH_LIMIT_INVALID','search enforces maximum page size');

-- 91
select throws_ok($$select audit.search_authorization_permission_changes('{"limit":1,"subject_kind":"ANY"}'::jsonb)$$,'22023','AUTH_DB_012_SEARCH_SUBJECT_KIND_INVALID','search rejects generic subject kinds');

-- 92
select throws_ok($$select audit.search_authorization_permission_changes('{"limit":1,"lane":"GLOBAL"}'::jsonb)$$,'22023','AUTH_DB_012_SEARCH_LANE_INVALID','search rejects unknown lane');

-- 93
select throws_ok($$select audit.search_authorization_permission_changes('{"limit":1,"effect":"MAYBE"}'::jsonb)$$,'22023','AUTH_DB_012_SEARCH_EFFECT_INVALID','search rejects unknown effect');

-- 94
select throws_ok($$select audit.search_authorization_permission_changes('{"limit":1,"source_kind":"TABLE"}'::jsonb)$$,'22023','AUTH_DB_012_SEARCH_SOURCE_KIND_INVALID','search rejects physical-table source kind');

-- 95
select throws_ok($$select audit.search_authorization_permission_changes('{"limit":1,"change_kind":"UPSERT"}'::jsonb)$$,'22023','AUTH_DB_012_SEARCH_CHANGE_KIND_INVALID','search rejects unknown change kind');

-- 96
select is(jsonb_array_length(audit.search_authorization_permission_changes('{"limit":10,"permission_key":"shell.access"}'::jsonb)->'items'),(select count(distinct change_set_id)::integer from audit.authorization_permission_changes where permission_key='shell.access'),'permission search returns matching sets');

-- 97
select ok(jsonb_array_length(audit.search_authorization_permission_changes('{"limit":10,"subject_kind":"BASE_ROLE","subject_reference":"gerente"}'::jsonb)->'items')>0,'subject search is supported');

-- 98
select ok(jsonb_array_length(audit.search_authorization_permission_changes('{"limit":10,"authorization_decision_id":"01200000-0000-4000-8000-000000000100"}'::jsonb)->'items')>0,'decision search is supported');

-- 99
select is((select provolatile from pg_proc where oid='audit.search_authorization_permission_changes(jsonb)'::regprocedure),'s','search function is read-only stable');

-- 100
select ok(position(' offset ' in lower(pg_get_functiondef('audit.search_authorization_permission_changes(jsonb)'::regprocedure)))=0,'search uses keyset cursor instead of OFFSET pagination');


-- ACTOR_CONTEXT
-- 101
select is((select principal_id from audit.authorization_permission_change_sets where change_set_id='01200000-0000-4000-8000-000000000200'),'01200000-0000-4000-8000-000000000111','principal is derived from persisted decision');

-- 102
select is((select effective_actor_id from audit.authorization_permission_change_sets where change_set_id='01200000-0000-4000-8000-000000000200'),'01200000-0000-4000-8000-000000000112','effective actor is derived from persisted decision');

-- 103
select is((select technical_principal_id from audit.authorization_permission_change_sets where change_set_id='01200000-0000-4000-8000-000000000200'),session_user::text,'technical principal is derived from SQL session');

-- 104
select is((select device_id from audit.authorization_permission_change_sets where change_set_id='01200000-0000-4000-8000-000000000200'),'01200000-0000-4000-8000-000000000113','device is copied from authorization context, not User-Agent');

-- 105
select is((select app_code from audit.authorization_permission_change_sets where change_set_id='01200000-0000-4000-8000-000000000200'),'shell','app code is decision-bound');

-- 106
select is((select request_source from audit.authorization_permission_change_sets where change_set_id='01200000-0000-4000-8000-000000000200'),'SERVER_ACTION','request source is decision-bound');

-- 107
select is((select correlation_id from audit.authorization_permission_change_sets where change_set_id='01200000-0000-4000-8000-000000000200'),'AUTH-DB-012-CORR-ALLOW','correlation is decision-bound');

-- 108
select throws_ok($$select audit.append_authorization_permission_change(jsonb_set(pg_temp.auth_db_012_change('01200000-0000-4000-8000-000000000300','01200000-0000-4000-8000-000000000301','AUTH-DB-012-CMD-300'),'{app_code}','"other"'::jsonb))$$,'22023','AUTH_DB_012_APP_CODE_DECISION_MISMATCH','caller cannot override decision app');

-- 109
select throws_ok($$select audit.append_authorization_permission_change(jsonb_set(pg_temp.auth_db_012_change('01200000-0000-4000-8000-000000000302','01200000-0000-4000-8000-000000000303','AUTH-DB-012-CMD-302'),'{correlation_id}','"OTHER-CORR"'::jsonb))$$,'22023','AUTH_DB_012_CORRELATION_DECISION_MISMATCH','caller cannot override decision correlation');

-- 110
select throws_ok($$select audit.append_authorization_permission_change(pg_temp.auth_db_012_change('01200000-0000-4000-8000-000000000304','01200000-0000-4000-8000-000000000305','AUTH-DB-012-CMD-304','01200000-0000-4000-8000-000000000101'))$$,'42501','AUTH_DB_012_AUTHORIZATION_DECISION_NOT_ALLOW','DENY decision cannot materialize a successful change');

-- 111
select throws_ok($$select audit.append_authorization_permission_change(pg_temp.auth_db_012_change('01200000-0000-4000-8000-000000000306','01200000-0000-4000-8000-000000000307','AUTH-DB-012-CMD-306','MISSING-DECISION'))$$,'23503','AUTH_DB_012_AUTHORIZATION_DECISION_MISSING','orphan decision reference fails closed');

-- 112
select throws_ok($$select audit.append_authorization_permission_change(jsonb_set((pg_temp.auth_db_012_change('01200000-0000-4000-8000-000000000308','01200000-0000-4000-8000-000000000309','AUTH-DB-012-CMD-308',null)),'{request_source}','"SERVER_ACTION"'::jsonb))$$,'42501','AUTH_DB_012_DECISION_REQUIRED_FOR_INTERACTIVE_CHANGE','interactive change requires persisted decision');

-- 113
select is(audit.append_authorization_permission_change(pg_temp.auth_db_012_change('01200000-0000-4000-8000-000000000310','01200000-0000-4000-8000-000000000311','AUTH-DB-012-CMD-310',null))->>'result_code','APPLIED','controlled migration may record a system change without fabricated human decision');

-- 114
select is((select principal_id from audit.authorization_permission_change_sets where change_set_id='01200000-0000-4000-8000-000000000310'),null::text,'system migration does not invent human principal');

-- 115
select is((select effective_actor_id from audit.authorization_permission_change_sets where change_set_id='01200000-0000-4000-8000-000000000310'),null::text,'system migration does not invent effective human actor');

-- 116
select is((select technical_principal_id from audit.authorization_permission_change_sets where change_set_id='01200000-0000-4000-8000-000000000310'),session_user::text,'system migration still records technical principal');


-- TARGET_STATE
-- 117
select throws_ok($$select audit.append_authorization_permission_change(jsonb_set(pg_temp.auth_db_012_change('01200000-0000-4000-8000-000000000320','01200000-0000-4000-8000-000000000321','AUTH-DB-012-CMD-320'),'{items,0,source_kind}','"TABLE"'::jsonb))$$,'22023','AUTH_DB_012_CHANGE_ITEM_VOCABULARY_INVALID','physical table name is not a source kind');

-- 118
select throws_ok($$select audit.append_authorization_permission_change(jsonb_set(pg_temp.auth_db_012_change('01200000-0000-4000-8000-000000000320','01200000-0000-4000-8000-000000000321','AUTH-DB-012-CMD-320'),'{items,0,subject_kind}','"ANY"'::jsonb))$$,'22023','AUTH_DB_012_CHANGE_ITEM_VOCABULARY_INVALID','generic subject is rejected');

-- 119
select throws_ok($$select audit.append_authorization_permission_change(jsonb_set(pg_temp.auth_db_012_change('01200000-0000-4000-8000-000000000320','01200000-0000-4000-8000-000000000321','AUTH-DB-012-CMD-320'),'{items,0,permission_key}','"shell.*"'::jsonb))$$,'22023','AUTH_DB_012_CHANGE_ITEM_IDENTITY_INVALID','wildcard permission key is rejected');

-- 120
select throws_ok($$select audit.append_authorization_permission_change(jsonb_set(pg_temp.auth_db_012_change('01200000-0000-4000-8000-000000000320','01200000-0000-4000-8000-000000000321','AUTH-DB-012-CMD-320'),'{items,0,lane}','"ALL_COMPATIBLE"'::jsonb))$$,'22023','AUTH_DB_012_CHANGE_ITEM_SEMANTIC_IDENTITY_INVALID','ALL_COMPATIBLE cannot widen an allow');

-- 121
select is(audit.append_authorization_permission_change(pg_temp.auth_db_012_change('01200000-0000-4000-8000-000000000322','01200000-0000-4000-8000-000000000323','AUTH-DB-012-CMD-322',null,jsonb_build_array(pg_temp.auth_db_012_item('01200000-0000-4000-8000-000000000323',1,'EXPLICIT_DENIAL','EMPLOYEE','01200000-0000-4000-8000-000000000999','shell.access','ALL_COMPATIBLE','DENY','CREATE'))))->>'result_code','APPLIED','actor-wide explicit deny is representable without default-deny fabrication');

-- 122
select is(audit.append_authorization_permission_change(pg_temp.auth_db_012_change('01200000-0000-4000-8000-000000000324','01200000-0000-4000-8000-000000000325','AUTH-DB-012-CMD-324',null,jsonb_build_array(pg_temp.auth_db_012_item('01200000-0000-4000-8000-000000000325',1,'PERMISSION_CATALOG_RELEASE','CATALOG','CATALOG-1.0.0','shell.access','NOT_APPLICABLE','NOT_APPLICABLE','CREATE'))))->>'result_code','APPLIED','catalog release change uses NOT_APPLICABLE lane/effect');

-- 123
select throws_ok($$select audit.append_authorization_permission_change(jsonb_set(pg_temp.auth_db_012_change('01200000-0000-4000-8000-000000000320','01200000-0000-4000-8000-000000000321','AUTH-DB-012-CMD-320'),'{items,0,before_state}','{"lifecycle_status":"OLD"}'::jsonb))$$,'22023','AUTH_DB_012_CREATE_STATE_INVALID','CREATE forbids before_state');

-- 124
select throws_ok($$select audit.append_authorization_permission_change(jsonb_set(pg_temp.auth_db_012_change('01200000-0000-4000-8000-000000000326','01200000-0000-4000-8000-000000000327','AUTH-DB-012-CMD-326',null,jsonb_build_array(pg_temp.auth_db_012_item('01200000-0000-4000-8000-000000000327',1,'BASE_ROLE_GRANT','BASE_ROLE','gerente','shell.access','BASE','ALLOW','SUSPEND'))),'{items,0,before_state}','null'::jsonb))$$,'22023','AUTH_DB_012_EXISTING_CHANGE_STATE_INVALID','existing-record change requires before_state');

-- 125
select throws_ok($$select audit.append_authorization_permission_change(jsonb_set(pg_temp.auth_db_012_change('01200000-0000-4000-8000-000000000320','01200000-0000-4000-8000-000000000321','AUTH-DB-012-CMD-320'),'{items,0,after_state,subject_reference}','"otro"'::jsonb))$$,'22023','AUTH_DB_012_AFTER_STATE_IDENTITY_FLIP_FORBIDDEN','subject identity cannot flip in place');

-- 126
select throws_ok($$select audit.append_authorization_permission_change(jsonb_set(pg_temp.auth_db_012_change('01200000-0000-4000-8000-000000000320','01200000-0000-4000-8000-000000000321','AUTH-DB-012-CMD-320'),'{items,0,after_state,permission_key}','"shell.other"'::jsonb))$$,'22023','AUTH_DB_012_AFTER_STATE_IDENTITY_FLIP_FORBIDDEN','permission identity cannot flip in place');

-- 127
select throws_ok($$select audit.append_authorization_permission_change(jsonb_set(pg_temp.auth_db_012_change('01200000-0000-4000-8000-000000000320','01200000-0000-4000-8000-000000000321','AUTH-DB-012-CMD-320'),'{items,0,after_state,lane}','"OPERATIONAL"'::jsonb))$$,'22023','AUTH_DB_012_AFTER_STATE_IDENTITY_FLIP_FORBIDDEN','lane identity cannot flip in place');

-- 128
select throws_ok($$select audit.append_authorization_permission_change(jsonb_set(pg_temp.auth_db_012_change('01200000-0000-4000-8000-000000000320','01200000-0000-4000-8000-000000000321','AUTH-DB-012-CMD-320'),'{items,0,after_state,effect}','"DENY"'::jsonb))$$,'22023','AUTH_DB_012_AFTER_STATE_IDENTITY_FLIP_FORBIDDEN','effect identity cannot flip in place');

-- 129
select throws_ok($$select audit.append_authorization_permission_change(pg_temp.auth_db_012_change('01200000-0000-4000-8000-000000000328','01200000-0000-4000-8000-000000000329','AUTH-DB-012-CMD-328',null,jsonb_build_array(pg_temp.auth_db_012_item('01200000-0000-4000-8000-000000000329',1,'BASE_ROLE_GRANT','BASE_ROLE','gerente','shell.access','BASE','ALLOW','CHANGE_SCOPE','ACTIVE','ACTIVE'))))$$,'22023','AUTH_DB_012_NO_CHANGE_ITEM_FORBIDDEN','semantic no-op cannot become a confirmed permission change');

-- 130
select is(audit.append_authorization_permission_change(pg_temp.auth_db_012_change('01200000-0000-4000-8000-000000000330','01200000-0000-4000-8000-000000000331','AUTH-DB-012-CMD-330',null,jsonb_build_array(pg_temp.auth_db_012_item('01200000-0000-4000-8000-000000000331',1,'BASE_ROLE_GRANT','BASE_ROLE','gerente','shell.access','BASE','ALLOW','CORRECT_METADATA','ACTIVE','ACTIVE'))))->>'result_code','APPLIED','CORRECT_METADATA may preserve authority fingerprint');

-- 131
select throws_ok($$select audit.append_authorization_permission_change((pg_temp.auth_db_012_change('01200000-0000-4000-8000-000000000320','01200000-0000-4000-8000-000000000321','AUTH-DB-012-CMD-320') #- '{items,0,source_dataset_id}') #- '{items,0,source_dataset_version}' #- '{items,0,source_dataset_hash}')$$,'22023','AUTH_DB_012_ITEM_DATASET_IDENTITY_REQUIRED','matrix grant requires dataset identity');

-- 132
select throws_ok($$select audit.append_authorization_permission_change(jsonb_set(pg_temp.auth_db_012_change('01200000-0000-4000-8000-000000000320','01200000-0000-4000-8000-000000000321','AUTH-DB-012-CMD-320'),'{items,0,changed_fields}','["scope","lifecycle_status"]'::jsonb))$$,'22023','AUTH_DB_012_CHANGED_FIELDS_NOT_CANONICAL','changed_fields must be deterministic sorted/deduplicated');


-- CONCURRENCY
-- 133
select ok(exists(select 1 from pg_constraint where conrelid='audit.authorization_permission_change_sets'::regclass and conname='uq_authorization_permission_change_sets_command'),'successful command identity is unique');

-- 134
select throws_ok($$select audit.append_authorization_permission_change(pg_temp.auth_db_012_change('01200000-0000-4000-8000-000000000340','01200000-0000-4000-8000-000000000341','AUTH-DB-012-CMD-200'))$$,'23505','AUTH_DB_012_CHANGE_SET_INTEGRITY_CONFLICT','concurrent reuse of command identity fails closed');

-- 135
select throws_ok($$select audit.append_authorization_permission_change(pg_temp.auth_db_012_change('01200000-0000-4000-8000-000000000200','01200000-0000-4000-8000-000000000201','AUTH-DB-012-CMD-340'))$$,'23505','AUTH_DB_012_CHANGE_SET_INTEGRITY_CONFLICT','concurrent reuse of set identity fails closed');

-- 136
select is(audit.append_authorization_permission_change_attempt(pg_temp.auth_db_012_attempt('01200000-0000-4000-8000-000000000342','AUTH-DB-012-ATTEMPT-CMD-342','CONFLICT')),'01200000-0000-4000-8000-000000000342','CONFLICT attempt is preserved instead of last-write-wins');

-- 137
select is(audit.append_authorization_permission_change_attempt(pg_temp.auth_db_012_attempt('01200000-0000-4000-8000-000000000343','AUTH-DB-012-ATTEMPT-CMD-343','NO_CHANGE')),'01200000-0000-4000-8000-000000000343','NO_CHANGE attempt is preserved without fake item');

-- 138
select throws_ok($$select audit.append_authorization_permission_change_attempt(pg_temp.auth_db_012_attempt('01200000-0000-4000-8000-000000000344','AUTH-DB-012-ATTEMPT-CMD-344','ROLLED_BACK'))$$,'22023','AUTH_DB_012_ROLLED_BACK_REQUIRES_EVIDENCE_REFERENCE','ROLLED_BACK requires durable evidence reference');

-- 139
select is(audit.append_authorization_permission_change_attempt(pg_temp.auth_db_012_attempt('01200000-0000-4000-8000-000000000345','AUTH-DB-012-ATTEMPT-CMD-345','ROLLED_BACK',null,null,'ROLLBACK-EVIDENCE-345')),'01200000-0000-4000-8000-000000000345','ROLLED_BACK is accepted only with evidence reference');

-- 140
select throws_ok($$select audit.append_authorization_permission_change_attempt(pg_temp.auth_db_012_attempt('01200000-0000-4000-8000-000000000346','AUTH-DB-012-ATTEMPT-CMD-346','TECHNICAL_FAILURE'))$$,'22023','AUTH_DB_012_TECHNICAL_FAILURE_REQUIRES_ERROR_CLASS','technical failure requires classified error');

-- 141
select is(audit.append_authorization_permission_change_attempt(pg_temp.auth_db_012_attempt('01200000-0000-4000-8000-000000000347','AUTH-DB-012-ATTEMPT-CMD-347','TECHNICAL_FAILURE',null,'DEPENDENCY_UNAVAILABLE')),'01200000-0000-4000-8000-000000000347','technical failure with error class is audit-preserved');

-- 142
select throws_ok($$select audit.append_authorization_permission_change_attempt(pg_temp.auth_db_012_attempt('01200000-0000-4000-8000-000000000348','AUTH-DB-012-ATTEMPT-CMD-348','DENIED','01200000-0000-4000-8000-000000000100'))$$,'22023','AUTH_DB_012_DENIED_ATTEMPT_REQUIRES_DENY_DECISION','DENIED attempt cannot point to ALLOW decision');

-- 143
select is(audit.append_authorization_permission_change_attempt(pg_temp.auth_db_012_attempt('01200000-0000-4000-8000-000000000349','AUTH-DB-012-ATTEMPT-CMD-349','DENIED','01200000-0000-4000-8000-000000000101')),'01200000-0000-4000-8000-000000000349','DENIED attempt links to persisted DENY decision');

-- 144
select is((audit.append_authorization_permission_change(pg_temp.auth_db_012_change('01200000-0000-4000-8000-000000000350','01200000-0000-4000-8000-000000000351','AUTH-DB-012-CMD-350',null,jsonb_build_array(pg_temp.auth_db_012_item('01200000-0000-4000-8000-000000000351',1),pg_temp.auth_db_012_item('01200000-0000-4000-8000-000000000352',2))))->>'change_count')::integer,2,'atomic bulk persists complete contiguous item set');

-- 145
select throws_ok($$select audit.append_authorization_permission_change(pg_temp.auth_db_012_change('01200000-0000-4000-8000-000000000353','01200000-0000-4000-8000-000000000354','AUTH-DB-012-CMD-353',null,jsonb_build_array(pg_temp.auth_db_012_item('01200000-0000-4000-8000-000000000354',1),jsonb_set(pg_temp.auth_db_012_item('01200000-0000-4000-8000-000000000355',2),'{permission_key}','"bad.*"'::jsonb))))$$,'22023','AUTH_DB_012_CHANGE_ITEM_IDENTITY_INVALID','one invalid bulk item aborts the atomic set');

-- 146
select ok(not exists(select 1 from audit.authorization_permission_change_sets where change_set_id='01200000-0000-4000-8000-000000000353'),'failed bulk leaves no partial parent');


-- RECOVERY
-- 147
select ok(exists(select 1 from pg_constraint where conname='fk_authorization_permission_changes_set'),'restore contract preserves fk_authorization_permission_changes_set');

-- 148
select ok(exists(select 1 from pg_constraint where conname='fk_authorization_permission_change_attempts_decision'),'restore contract preserves fk_authorization_permission_change_attempts_decision');

-- 149
select ok(exists(select 1 from pg_constraint where conname='fk_authorization_permission_change_links_set'),'restore contract preserves fk_authorization_permission_change_links_set');

-- 150
select ok(exists(select 1 from pg_constraint where conname='fk_authorization_permission_change_links_item'),'restore contract preserves fk_authorization_permission_change_links_item');

-- 151
select ok(exists(select 1 from pg_constraint where conrelid='audit.authorization_permission_changes'::regclass and conname='uq_authorization_permission_changes_ordinal'),'restore contract preserves ordinal uniqueness');

-- 152
select ok(exists(select 1 from pg_constraint where conrelid='audit.authorization_permission_change_links'::regclass and conname='uq_authorization_permission_change_links_reference'),'restore contract preserves link uniqueness');

-- 153
select ok(not exists(select 1 from audit.authorization_permission_change_sets s where s.change_count<>(select count(*) from audit.authorization_permission_changes i where i.change_set_id=s.change_set_id)),'restore reconciliation can verify set/item cardinality');

-- 154
select ok(not exists(select 1 from audit.authorization_permission_change_sets where change_set_fingerprint !~ '^sha256:[0-9a-f]{64}$'),'restore reconciliation can verify set fingerprints');

-- 155
select ok(not exists(select 1 from audit.authorization_permission_changes where item_fingerprint !~ '^sha256:[0-9a-f]{64}$'),'restore reconciliation can verify item fingerprints');

-- 156
select ok(not exists(select 1 from audit.authorization_permission_change_attempts where attempt_fingerprint !~ '^sha256:[0-9a-f]{64}$'),'restore reconciliation can verify attempt fingerprints');

-- 157
select is((select count(*) from pg_class c join pg_namespace n on n.oid=c.relnamespace where n.nspname='audit' and c.relname in ('authorization_permission_change_sets','authorization_permission_changes','authorization_permission_change_attempts','authorization_permission_change_links') and pg_get_userbyid(c.relowner)='vento_authorization_owner'),4::bigint,'all four restored tables retain isolated owner');

-- 158
select is((select count(*) from pg_proc p join pg_namespace n on n.oid=p.pronamespace where (n.nspname,p.proname) in (('audit','append_authorization_permission_change'),('audit','append_authorization_permission_change_attempt'),('audit','get_authorization_permission_change'),('audit','search_authorization_permission_changes'),('audit','list_authorization_permission_change_items'),('audit','reject_authorization_permission_audit_mutation'),('app_private','canonicalize_authorization_permission_change'),('app_private','fingerprint_authorization_permission_change'))),8::bigint,'restore inventory contains exact eight frozen primitives');


-- WRITER_COVERAGE
-- 159
select ok(to_regclass('public.app_permissions') is not null,'legacy writer inventory includes public.app_permissions');

-- 160
select ok(to_regclass('public.role_permissions') is not null,'legacy writer inventory includes public.role_permissions');

-- 161
select ok(to_regclass('public.employee_permissions') is not null,'legacy writer inventory includes public.employee_permissions');

-- 162
select ok(to_regclass('public.operational_role_permissions') is not null,'legacy writer inventory includes public.operational_role_permissions');

-- 163
select ok(to_regclass('public.role_capabilities') is not null,'legacy writer inventory includes public.role_capabilities');

-- 164
select ok(not exists(select 1 from pg_trigger tr where tr.tgrelid='public.app_permissions'::regclass and not tr.tgisinternal and tr.tgname like 'trg_auth_db_012%'),'AUTH-DB-012 does not prematurely adopt public.app_permissions');

-- 165
select ok(not exists(select 1 from pg_trigger tr where tr.tgrelid='public.role_permissions'::regclass and not tr.tgisinternal and tr.tgname like 'trg_auth_db_012%'),'AUTH-DB-012 does not prematurely adopt public.role_permissions');

-- 166
select ok(not exists(select 1 from pg_trigger tr where tr.tgrelid='public.employee_permissions'::regclass and not tr.tgisinternal and tr.tgname like 'trg_auth_db_012%'),'AUTH-DB-012 does not prematurely adopt public.employee_permissions');

-- 167
select ok(not exists(select 1 from pg_trigger tr where tr.tgrelid='public.operational_role_permissions'::regclass and not tr.tgisinternal and tr.tgname like 'trg_auth_db_012%'),'AUTH-DB-012 does not prematurely adopt public.operational_role_permissions');

-- 168
select ok(not exists(select 1 from pg_trigger tr where tr.tgrelid='public.role_capabilities'::regclass and not tr.tgisinternal and tr.tgname like 'trg_auth_db_012%'),'AUTH-DB-012 does not prematurely adopt public.role_capabilities');

-- 169
select ok(position('public.app_permissions' in pg_get_functiondef('audit.append_authorization_permission_change(jsonb)'::regprocedure))=0 and position('public.role_permissions' in pg_get_functiondef('audit.append_authorization_permission_change(jsonb)'::regprocedure))=0 and position('public.employee_permissions' in pg_get_functiondef('audit.append_authorization_permission_change(jsonb)'::regprocedure))=0 and position('public.operational_role_permissions' in pg_get_functiondef('audit.append_authorization_permission_change(jsonb)'::regprocedure))=0 and position('public.role_capabilities' in pg_get_functiondef('audit.append_authorization_permission_change(jsonb)'::regprocedure))=0,'global append primitive is table-agnostic and leaves writer adoption to AUTH-DB-020');

-- 170
select ok(to_regprocedure('api.append_authorization_permission_change(jsonb)') is null and to_regprocedure('api.search_authorization_permission_changes(jsonb)') is null,'AUTH-DB-012 creates no generic client Data API surface');


-- SENSITIVITY
-- 171
select is((select sensitivity_class from audit.authorization_permission_change_sets where change_set_id='01200000-0000-4000-8000-000000000200'),'FUNCTIONAL_SENSITIVE','permission changes receive server-side sensitive classification');

-- 172
select is((select sensitivity_class from audit.authorization_permission_change_attempts where change_attempt_id='01200000-0000-4000-8000-000000000250'),'FUNCTIONAL_SENSITIVE','permission attempts receive server-side sensitive classification');

-- 173
select throws_ok($$select audit.append_authorization_permission_change(jsonb_set(pg_temp.auth_db_012_change('01200000-0000-4000-8000-000000000360','01200000-0000-4000-8000-000000000361','AUTH-DB-012-CMD-360'),'{sensitivity_class}','"FUNCTIONAL"'::jsonb))$$,'22023','AUTH_DB_012_CHANGE_FIELD_FORBIDDEN','caller cannot downgrade set sensitivity');

-- 174
select throws_ok($$select audit.append_authorization_permission_change_attempt(jsonb_set(pg_temp.auth_db_012_attempt('01200000-0000-4000-8000-000000000362','AUTH-DB-012-ATTEMPT-CMD-362','NO_CHANGE'),'{sensitivity_class}','"FUNCTIONAL"'::jsonb))$$,'22023','AUTH_DB_012_ATTEMPT_ENVELOPE_INVALID','caller cannot downgrade attempt sensitivity');

-- 175
select throws_ok($$select audit.append_authorization_permission_change(jsonb_set(pg_temp.auth_db_012_change('01200000-0000-4000-8000-000000000363','01200000-0000-4000-8000-000000000383','AUTH-DB-012-CMD-363'),'{items,0,after_state,metadata}',jsonb_build_object('email','secret')))$$,'22023','AUTH_DB_012_SENSITIVE_OR_SECRET_STATE_FORBIDDEN','email is rejected from authorization snapshots');

-- 176
select throws_ok($$select audit.append_authorization_permission_change(jsonb_set(pg_temp.auth_db_012_change('01200000-0000-4000-8000-000000000364','01200000-0000-4000-8000-000000000384','AUTH-DB-012-CMD-364'),'{items,0,after_state,metadata}',jsonb_build_object('password','secret')))$$,'22023','AUTH_DB_012_SENSITIVE_OR_SECRET_STATE_FORBIDDEN','password is rejected from authorization snapshots');

-- 177
select throws_ok($$select audit.append_authorization_permission_change(jsonb_set(pg_temp.auth_db_012_change('01200000-0000-4000-8000-000000000365','01200000-0000-4000-8000-000000000385','AUTH-DB-012-CMD-365'),'{items,0,after_state,metadata}',jsonb_build_object('jwt','secret')))$$,'22023','AUTH_DB_012_SENSITIVE_OR_SECRET_STATE_FORBIDDEN','jwt is rejected from authorization snapshots');

-- 178
select throws_ok($$select audit.append_authorization_permission_change(jsonb_set(pg_temp.auth_db_012_change('01200000-0000-4000-8000-000000000366','01200000-0000-4000-8000-000000000386','AUTH-DB-012-CMD-366'),'{items,0,after_state,metadata}',jsonb_build_object('refresh_token','secret')))$$,'22023','AUTH_DB_012_SENSITIVE_OR_SECRET_STATE_FORBIDDEN','refresh_token is rejected from authorization snapshots');

-- 179
select throws_ok($$select audit.append_authorization_permission_change(jsonb_set(pg_temp.auth_db_012_change('01200000-0000-4000-8000-000000000367','01200000-0000-4000-8000-000000000387','AUTH-DB-012-CMD-367'),'{items,0,after_state,metadata}',jsonb_build_object('api_key','secret')))$$,'22023','AUTH_DB_012_SENSITIVE_OR_SECRET_STATE_FORBIDDEN','api_key is rejected from authorization snapshots');

-- 180
select throws_ok($$select audit.append_authorization_permission_change(jsonb_set(pg_temp.auth_db_012_change('01200000-0000-4000-8000-000000000368','01200000-0000-4000-8000-000000000388','AUTH-DB-012-CMD-368'),'{items,0,after_state,metadata}',jsonb_build_object('pin','secret')))$$,'22023','AUTH_DB_012_SENSITIVE_OR_SECRET_STATE_FORBIDDEN','pin is rejected from authorization snapshots');

-- 181
select ok(position('before_state' in audit.search_authorization_permission_changes('{"limit":10}'::jsonb)::text)=0 and position('after_state' in audit.search_authorization_permission_changes('{"limit":10}'::jsonb)::text)=0,'search projection does not expose before/after snapshots by default');

-- 182
select ok(not has_function_privilege('authenticated','audit.get_authorization_permission_change(text)'::regprocedure,'EXECUTE'),'authenticated cannot enumerate private change detail');


-- RETENTION
-- 183
select is((select retention_class from audit.authorization_permission_change_sets where change_set_id='01200000-0000-4000-8000-000000000200'),'RET_OBLIGATION','confirmed permission changes receive server-side retention class');

-- 184
select is((select retention_class from audit.authorization_permission_change_attempts where change_attempt_id='01200000-0000-4000-8000-000000000250'),'RET_OBLIGATION','attempts receive server-side retention class');

-- 185
select throws_ok($$select audit.append_authorization_permission_change(jsonb_set(pg_temp.auth_db_012_change('01200000-0000-4000-8000-000000000390','01200000-0000-4000-8000-000000000391','AUTH-DB-012-CMD-390'),'{retention_class}','"RET_ACTIVE_CASE"'::jsonb))$$,'22023','AUTH_DB_012_CHANGE_FIELD_FORBIDDEN','caller cannot choose set retention');

-- 186
select throws_ok($$select audit.append_authorization_permission_change_attempt(jsonb_set(pg_temp.auth_db_012_attempt('01200000-0000-4000-8000-000000000392','AUTH-DB-012-ATTEMPT-CMD-392','NO_CHANGE'),'{retention_class}','"RET_ACTIVE_CASE"'::jsonb))$$,'22023','AUTH_DB_012_ATTEMPT_ENVELOPE_INVALID','caller cannot choose attempt retention');

-- 187
select ok(position('RET_ACTIVE_CASE' in pg_get_constraintdef((select oid from pg_constraint where conrelid='audit.authorization_permission_change_sets'::regclass and conname='ck_authorization_permission_change_sets_retention')))>0,'retention contract recognizes RET_ACTIVE_CASE without inventing days');

-- 188
select ok(position('RET_BUSINESS_CYCLE' in pg_get_constraintdef((select oid from pg_constraint where conrelid='audit.authorization_permission_change_sets'::regclass and conname='ck_authorization_permission_change_sets_retention')))>0,'retention contract recognizes RET_BUSINESS_CYCLE without inventing days');

-- 189
select ok(position('RET_RELATIONSHIP' in pg_get_constraintdef((select oid from pg_constraint where conrelid='audit.authorization_permission_change_sets'::regclass and conname='ck_authorization_permission_change_sets_retention')))>0,'retention contract recognizes RET_RELATIONSHIP without inventing days');

-- 190
select ok(position('RET_OBLIGATION' in pg_get_constraintdef((select oid from pg_constraint where conrelid='audit.authorization_permission_change_sets'::regclass and conname='ck_authorization_permission_change_sets_retention')))>0,'retention contract recognizes RET_OBLIGATION without inventing days');

-- 191
select ok(position('RET_ARCHIVAL' in pg_get_constraintdef((select oid from pg_constraint where conrelid='audit.authorization_permission_change_sets'::regclass and conname='ck_authorization_permission_change_sets_retention')))>0,'retention contract recognizes RET_ARCHIVAL without inventing days');

-- 192
select ok(position('RET_HOLD' in pg_get_constraintdef((select oid from pg_constraint where conrelid='audit.authorization_permission_change_sets'::regclass and conname='ck_authorization_permission_change_sets_retention')))>0,'retention contract recognizes RET_HOLD without inventing days');

-- 193
select ok(position('RET_PERMANENT_EXCEPTION' in pg_get_constraintdef((select oid from pg_constraint where conrelid='audit.authorization_permission_change_sets'::regclass and conname='ck_authorization_permission_change_sets_retention')))>0,'retention contract recognizes RET_PERMANENT_EXCEPTION without inventing days');

-- 194
select ok(position('RET_UNRESOLVED' in pg_get_constraintdef((select oid from pg_constraint where conrelid='audit.authorization_permission_change_sets'::regclass and conname='ck_authorization_permission_change_sets_retention')))>0,'retention contract recognizes RET_UNRESOLVED without inventing days');


-- PERFORMANCE_OPERABILITY
-- 195
select ok(to_regclass('audit.ix_auth_permission_change_sets_occurred') is not null,'critical index ix_auth_permission_change_sets_occurred exists');

-- 196
select ok(to_regclass('audit.ix_auth_permission_change_sets_decision_time') is not null,'critical index ix_auth_permission_change_sets_decision_time exists');

-- 197
select ok(to_regclass('audit.ix_auth_permission_change_sets_correlation_time') is not null,'critical index ix_auth_permission_change_sets_correlation_time exists');

-- 198
select ok(to_regclass('audit.ix_auth_permission_change_sets_actor_time') is not null,'critical index ix_auth_permission_change_sets_actor_time exists');

-- 199
select ok(to_regclass('audit.ix_auth_permission_changes_permission_time') is not null,'critical index ix_auth_permission_changes_permission_time exists');

-- 200
select ok(to_regclass('audit.ix_auth_permission_changes_subject_time') is not null,'critical index ix_auth_permission_changes_subject_time exists');

-- 201
select ok(to_regclass('audit.ix_auth_permission_changes_source_time') is not null,'critical index ix_auth_permission_changes_source_time exists');

-- 202
select ok(to_regclass('audit.ix_auth_permission_changes_kind_time') is not null,'critical index ix_auth_permission_changes_kind_time exists');

-- 203
select ok(to_regclass('audit.ix_auth_permission_change_attempts_result_time') is not null,'critical index ix_auth_permission_change_attempts_result_time exists');

-- 204
select ok(to_regclass('audit.ix_auth_permission_change_attempts_correlation_time') is not null,'critical index ix_auth_permission_change_attempts_correlation_time exists');

-- 205
select ok(to_regclass('audit.ix_auth_permission_change_links_set_time') is not null,'critical index ix_auth_permission_change_links_set_time exists');

-- 206
select ok(to_regclass('audit.ix_auth_permission_change_links_reference') is not null,'critical index ix_auth_permission_change_links_reference exists');

-- 207
select ok(
  position(
    'ix_auth_permission_change_sets_decision_time'
    in pg_temp.auth_db_012_explain(
      $plan$select s.change_set_id from audit.authorization_permission_change_sets s where s.authorization_decision_id = '01200000-0000-4000-8000-000000000100' order by s.occurred_at desc, s.change_set_id desc limit 10$plan$
    )
  ) > 0,
  'EXPLAIN evidence uses decision plus time index for critical change-set lookup'
);

-- 208
select ok(
  position(
    'ix_auth_permission_changes_permission_time'
    in pg_temp.auth_db_012_explain(
      $plan$select i.permission_change_id from audit.authorization_permission_changes i where i.permission_key = 'shell.access' order by i.occurred_at desc, i.change_set_id desc, i.change_ordinal limit 10$plan$
    )
  ) > 0,
  'EXPLAIN evidence uses permission plus time index for critical item lookup'
);

select * from finish();
rollback;
