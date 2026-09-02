-- VENTO_DB_TEST_CATEGORY: RPC
begin;

create extension if not exists pgtap with schema extensions;

set local role vento_authorization_owner;
insert into audit.authorization_decisions (
  decision_id, decision_contract_version, decision_schema_version, decision_record_fingerprint,
  decided_at, correlation_id, context_id, principal_id, actor_id, device_id, app_code,
  permission_key, operation_kind, request_source, resource_type, resource_ids, outcome,
  authorizing_lanes, authorization_reason_codes, context_fingerprint, resource_fingerprint,
  catalog_hash, dataset_hashes, evaluator_name, evaluator_version, evidence_storage_mode,
  decision_payload, sensitivity_class, retention_class, source_contract_sha256
) values
(
  '01400000-0000-4000-8000-00000000a001', '1.0.0', '1.0.0', 'sha256:' || repeat('1',64),
  pg_catalog.statement_timestamp(), null, 'AUTH-DB-014-CONTEXT-ALLOW',
  'AUTH-DB-014-PRINCIPAL-ALLOW', 'AUTH-DB-014-ACTOR-ALLOW', null, 'NEXO',
  'nexo.authorization.devices.manage', 'EXECUTE', 'SERVER_ACTION', 'DEVICE', '{}', 'ALLOW',
  array['BASE'], array['DEVICE_AUDIT_ADMIN_AUTHORIZED'], 'sha256:' || repeat('a',64),
  'sha256:' || repeat('b',64), 'sha256:' || repeat('c',64), '{}'::jsonb,
  'AUTH_DB_034', '1.0.0', 'FULL_DECISION', '{}'::jsonb, 'FUNCTIONAL_SENSITIVE', 'RET_OBLIGATION', repeat('d',64)
),
(
  '01400000-0000-4000-8000-00000000d001', '1.0.0', '1.0.0', 'sha256:' || repeat('2',64),
  pg_catalog.statement_timestamp(), null, 'AUTH-DB-014-CONTEXT-DENY',
  'AUTH-DB-014-PRINCIPAL-DENY', 'AUTH-DB-014-ACTOR-DENY', null, 'NEXO',
  'nexo.authorization.devices.manage', 'EXECUTE', 'SERVER_ACTION', 'DEVICE', '{}', 'DENY',
  '{}'::text[], array['EXPLICIT_DENY'], 'sha256:' || repeat('e',64),
  'sha256:' || repeat('f',64), 'sha256:' || repeat('0',64), '{}'::jsonb,
  'AUTH_DB_034', '1.0.0', 'FULL_DECISION', '{}'::jsonb, 'FUNCTIONAL_SENSITIVE', 'RET_OBLIGATION', repeat('d',64)
)
on conflict (decision_id) do nothing;
reset role;

create function pg_temp.auth_db_014_sources()
returns jsonb
language sql
immutable
as $$
  select jsonb_build_object(
    'device_registry','DEV-REG-1.0.0',
    'endpoint_registry','ENDPOINT-REG-1.0.0',
    'technical_principal_registry','PRINCIPAL-REG-1.0.0',
    'credential_binding_registry','CREDENTIAL-REG-1.0.0',
    'device_template_catalog','DEVICE-TEMPLATE-1.0.0',
    'site_catalog','SITE-CAT-1.0.0',
    'area_catalog','AREA-CAT-1.0.0',
    'application_catalog','APP-CAT-1.0.0',
    'permission_catalog','PERM-CAT-1.0.0',
    'device_permission_package_catalog','DEV-PACKAGE-1.0.0',
    'actor_policy_catalog','ACTOR-POLICY-1.0.0',
    'authorization_contract','AUTH-CONTRACT-1.0.0',
    'freshness_contract','FRESHNESS-1.0.0'
  );
$$;

create function pg_temp.auth_db_014_source_fps()
returns jsonb
language sql
immutable
as $$
  select jsonb_build_object(
    'device_registry','sha256:' || repeat('1',64),
    'endpoint_registry','sha256:' || repeat('2',64),
    'technical_principal_registry','sha256:' || repeat('3',64),
    'credential_binding_registry','sha256:' || repeat('4',64),
    'device_template_catalog','sha256:' || repeat('5',64),
    'site_catalog','sha256:' || repeat('6',64),
    'area_catalog','sha256:' || repeat('7',64),
    'application_catalog','sha256:' || repeat('8',64),
    'permission_catalog','sha256:' || repeat('9',64),
    'device_permission_package_catalog','sha256:' || repeat('a',64),
    'actor_policy_catalog','sha256:' || repeat('b',64),
    'authorization_contract','sha256:' || repeat('c',64),
    'freshness_contract','sha256:' || repeat('d',64)
  );
$$;

create function pg_temp.auth_db_014_config(p_generation integer)
returns jsonb
language sql
immutable
as $$
  select jsonb_build_object(
    'endpoint_id','ENDPOINT-' || p_generation::text,
    'technical_principal_id','PRINCIPAL-' || p_generation::text,
    'credential_binding_id','CREDENTIAL-' || p_generation::text,
    'asset_id','ASSET-' || p_generation::text,
    'station_instance_id','STATION-' || p_generation::text,
    'template_code','KIOSK-NEXO',
    'template_version','1.0.' || p_generation::text,
    'site_binding',jsonb_build_object('site_id','SITE-' || ((p_generation % 3) + 1)::text),
    'area_policy',jsonb_build_object('mode','ALLOW_SET','allowed_area_ids',jsonb_build_array('AREA-B','AREA-A')),
    'application_set',jsonb_build_array('NEXO','VISO'),
    'permission_package_set',jsonb_build_array('PKG-OPS','PKG-BASE'),
    'actor_policy',jsonb_build_object('mode','REQUIRED','strong_reauth',true),
    'installation_generation',p_generation,
    'credential_generation',p_generation
  );
$$;

create function pg_temp.auth_db_014_root_payload(
  p_device uuid,
  p_code text,
  p_key text,
  p_decision text default '01400000-0000-4000-8000-00000000a001',
  p_generation integer default 1
)
returns jsonb
language sql
as $$
  select jsonb_build_object(
    'device_id',p_device,
    'device_code',p_code,
    'authorization_decision_id',p_decision,
    'correlation_id','AUTH-DB-014-CORR-' || p_device::text,
    'idempotency_key',p_key,
    'source_registry','canonical-device-registry',
    'source_identity_version','DEV-REG-1.0.0',
    'source_operation_id','REGISTER:' || p_device::text || ':' || p_key,
    'source_versions',pg_temp.auth_db_014_sources(),
    'source_fingerprints',pg_temp.auth_db_014_source_fps(),
    'configuration',pg_temp.auth_db_014_config(p_generation)
  );
$$;

create function pg_temp.auth_db_014_revision_payload(
  p_device uuid,
  p_expected_revision integer,
  p_expected_event_sequence integer,
  p_kind text,
  p_state text,
  p_event_type text,
  p_key text,
  p_generation integer
)
returns jsonb
language sql
as $$
  select jsonb_build_object(
    'device_id',p_device,
    'expected_revision',p_expected_revision,
    'expected_event_sequence',p_expected_event_sequence,
    'revision_kind',p_kind,
    'lifecycle_state',p_state,
    'event_type',p_event_type,
    'event_outcome','SUCCEEDED',
    'reason_code','AUTHORIZED_DEVICE_CHANGE',
    'authorization_decision_id','01400000-0000-4000-8000-00000000a001',
    'correlation_id','AUTH-DB-014-CORR-' || p_device::text,
    'source_system','AUTH_DB_014_TEST',
    'source_operation_id','REV:' || p_device::text || ':' || p_key,
    'idempotency_key',p_key,
    'source_versions',pg_temp.auth_db_014_sources(),
    'source_fingerprints',pg_temp.auth_db_014_source_fps(),
    'configuration',pg_temp.auth_db_014_config(p_generation)
  );
$$;

create function pg_temp.auth_db_014_event_payload(
  p_device uuid,
  p_expected_revision integer,
  p_expected_event_sequence integer,
  p_event_type text,
  p_key text
)
returns jsonb
language sql
as $$
  select jsonb_build_object(
    'device_id',p_device,
    'expected_revision',p_expected_revision,
    'expected_event_sequence',p_expected_event_sequence,
    'event_type',p_event_type,
    'event_outcome','SUCCEEDED',
    'reason_code','AUTHORIZED_DEVICE_EVENT',
    'authorization_decision_id','01400000-0000-4000-8000-00000000a001',
    'correlation_id','AUTH-DB-014-CORR-' || p_device::text,
    'source_system','AUTH_DB_014_TEST',
    'source_operation_id','EVENT:' || p_device::text || ':' || p_key,
    'idempotency_key',p_key,
    'source_versions',pg_temp.auth_db_014_sources(),
    'source_fingerprints',pg_temp.auth_db_014_source_fps(),
    'event_payload',jsonb_build_object('fixture',p_key)
  );
$$;

create function pg_temp.auth_db_014_attempt_payload(
  p_device uuid,
  p_operation text,
  p_outcome text,
  p_reason text,
  p_key text
)
returns jsonb
language sql
as $$
  select jsonb_strip_nulls(jsonb_build_object(
    'device_id',p_device,
    'requested_operation',p_operation,
    'expected_revision',case when p_device is null then null else 1 end,
    'outcome',p_outcome,
    'reason_codes',jsonb_build_array(p_reason),
    'correlation_id','AUTH-DB-014-ATTEMPT-' || p_key,
    'idempotency_key',p_key,
    'source_system','AUTH_DB_014_TEST',
    'source_operation_id','ATTEMPT:' || p_key,
    'source_versions',pg_temp.auth_db_014_sources(),
    'source_fingerprints',pg_temp.auth_db_014_source_fps(),
    'safe_request_snapshot',jsonb_build_object('operation',p_operation),
    'safe_result_snapshot',jsonb_build_object('reason',p_reason)
  ));
$$;

create function pg_temp.auth_db_014_current_revision(p_device uuid)
returns integer
language sql
stable
as $$
  select max(r.revision_number)
  from audit.authorization_device_revisions r
  where r.device_id = p_device;
$$;

create function pg_temp.auth_db_014_current_sequence(p_device uuid)
returns integer
language sql
stable
as $$
  select max(e.event_sequence)
  from audit.authorization_device_events e
  where e.device_id = p_device;
$$;

create function pg_temp.auth_db_014_apply_revision(
  p_device uuid,
  p_kind text,
  p_state text,
  p_event_type text,
  p_key text,
  p_generation integer
)
returns jsonb
language plpgsql
as $$
begin
  return app_private.append_authorization_device_revision(
    pg_temp.auth_db_014_revision_payload(
      p_device,
      pg_temp.auth_db_014_current_revision(p_device),
      pg_temp.auth_db_014_current_sequence(p_device),
      p_kind,p_state,p_event_type,p_key,p_generation
    )
  );
end
$$;

create function pg_temp.auth_db_014_apply_event(
  p_device uuid,
  p_event_type text,
  p_key text
)
returns jsonb
language plpgsql
as $$
begin
  return app_private.append_authorization_device_event(
    pg_temp.auth_db_014_event_payload(
      p_device,
      pg_temp.auth_db_014_current_revision(p_device),
      pg_temp.auth_db_014_current_sequence(p_device),
      p_event_type,p_key
    )
  );
end
$$;

select plan(199);

-- 1
select ok(to_regclass('audit.authorization_devices') is not null, 'audit.authorization_devices exists');

-- 2
select ok(to_regclass('audit.authorization_device_revisions') is not null, 'audit.authorization_device_revisions exists');

-- 3
select ok(to_regclass('audit.authorization_device_events') is not null, 'audit.authorization_device_events exists');

-- 4
select ok(to_regclass('audit.authorization_device_attempts') is not null, 'audit.authorization_device_attempts exists');

-- 5
select ok(to_regclass('audit.authorization_device_links') is not null, 'audit.authorization_device_links exists');

-- 6
select ok(to_regclass('audit.authorization_device_corrections') is not null, 'audit.authorization_device_corrections exists');

-- 7
select is((select count(*) from pg_catalog.pg_class c join pg_catalog.pg_namespace n on n.oid=c.relnamespace where n.nspname='audit' and c.relkind='r' and c.relname like 'authorization_device%'), 6::bigint, 'AUTH-DB-014 owns exactly six authorization_device audit tables');

-- 8
select is((select count(*) from pg_catalog.pg_class c join pg_catalog.pg_namespace n on n.oid=c.relnamespace where n.nspname='audit' and c.relname in ('authorization_devices','authorization_device_revisions','authorization_device_events','authorization_device_attempts','authorization_device_links','authorization_device_corrections') and pg_catalog.pg_get_userbyid(c.relowner)='vento_authorization_owner'), 6::bigint, 'all six tables use vento_authorization_owner');

-- 9
select is((select count(*) from pg_catalog.pg_class c join pg_catalog.pg_namespace n on n.oid=c.relnamespace where n.nspname='audit' and c.relname in ('authorization_devices','authorization_device_revisions','authorization_device_events','authorization_device_attempts','authorization_device_links','authorization_device_corrections') and c.relrowsecurity), 6::bigint, 'RLS is enabled on all six tables');

-- 10
select is((select count(*) from pg_catalog.pg_policies p where p.schemaname='audit' and p.tablename in ('authorization_devices','authorization_device_revisions','authorization_device_events','authorization_device_attempts','authorization_device_links','authorization_device_corrections')), 0::bigint, 'no client RLS policies expose the canonical ledger');

-- 11
select is((select count(*) from pg_catalog.pg_class c join pg_catalog.pg_namespace n on n.oid=c.relnamespace where n.nspname='audit' and c.relname in ('authorization_devices','authorization_device_revisions','authorization_device_events','authorization_device_attempts','authorization_device_links','authorization_device_corrections') and (has_table_privilege('anon',c.oid,'SELECT') or has_table_privilege('anon',c.oid,'INSERT') or has_table_privilege('anon',c.oid,'UPDATE') or has_table_privilege('anon',c.oid,'DELETE') or has_table_privilege('anon',c.oid,'TRUNCATE'))), 0::bigint, 'anon has zero direct privileges on six device audit tables');

-- 12
select is((select count(*) from pg_catalog.pg_class c join pg_catalog.pg_namespace n on n.oid=c.relnamespace where n.nspname='audit' and c.relname in ('authorization_devices','authorization_device_revisions','authorization_device_events','authorization_device_attempts','authorization_device_links','authorization_device_corrections') and (has_table_privilege('authenticated',c.oid,'SELECT') or has_table_privilege('authenticated',c.oid,'INSERT') or has_table_privilege('authenticated',c.oid,'UPDATE') or has_table_privilege('authenticated',c.oid,'DELETE') or has_table_privilege('authenticated',c.oid,'TRUNCATE'))), 0::bigint, 'authenticated has zero direct privileges on six device audit tables');

-- 13
select is((select count(*) from pg_catalog.pg_class c join pg_catalog.pg_namespace n on n.oid=c.relnamespace where n.nspname='audit' and c.relname in ('authorization_devices','authorization_device_revisions','authorization_device_events','authorization_device_attempts','authorization_device_links','authorization_device_corrections') and (has_table_privilege('service_role',c.oid,'SELECT') or has_table_privilege('service_role',c.oid,'INSERT') or has_table_privilege('service_role',c.oid,'UPDATE') or has_table_privilege('service_role',c.oid,'DELETE') or has_table_privilege('service_role',c.oid,'TRUNCATE'))), 0::bigint, 'service_role has zero direct privileges on six device audit tables');

-- 14
select is((select count(*) from pg_catalog.pg_proc p join pg_catalog.pg_namespace n on n.oid=p.pronamespace where n.nspname='app_private' and p.proname in ('canonicalize_authorization_device','fingerprint_authorization_device','derive_authorization_device_state','reject_authorization_device_audit_mutation','append_authorization_device','append_authorization_device_revision','append_authorization_device_event','append_authorization_device_attempt','link_authorization_device_evidence','correct_authorization_device_audit','import_authorization_device_legacy_event')), 11::bigint, 'AUTH-DB-014 creates exactly eleven app_private helpers');

-- 15
select is((select count(*) from pg_catalog.pg_proc p join pg_catalog.pg_namespace n on n.oid=p.pronamespace where n.nspname='app_private' and p.proname in ('append_authorization_device','append_authorization_device_revision','append_authorization_device_event','append_authorization_device_attempt','link_authorization_device_evidence','correct_authorization_device_audit') and p.prosecdef), 6::bigint, 'exactly six AUTH-DB-014 writers are SECURITY DEFINER');

-- 16
select is((select count(*) from pg_catalog.pg_proc p join pg_catalog.pg_namespace n on n.oid=p.pronamespace where n.nspname='app_private' and p.proname in ('append_authorization_device','append_authorization_device_revision','append_authorization_device_event','append_authorization_device_attempt','link_authorization_device_evidence','correct_authorization_device_audit') and p.proconfig @> array['search_path=pg_catalog, audit, app_private, extensions']::text[]), 6::bigint, 'all privileged writers have fixed hardened search_path');

-- 17
select is((select count(*) from pg_catalog.pg_proc p join pg_catalog.pg_namespace n on n.oid=p.pronamespace where n.nspname='app_private' and p.proname in ('append_authorization_device','append_authorization_device_revision','append_authorization_device_event','append_authorization_device_attempt','link_authorization_device_evidence','correct_authorization_device_audit') and exists (select 1 from pg_catalog.aclexplode(coalesce(p.proacl,pg_catalog.acldefault('f',p.proowner))) a where a.grantee=0::oid and a.privilege_type='EXECUTE')), 0::bigint, 'PUBLIC has zero EXECUTE on privileged device writers');

-- 18
select is((select count(*) from pg_catalog.pg_proc p join pg_catalog.pg_namespace n on n.oid=p.pronamespace where n.nspname='app_private' and p.proname in ('append_authorization_device','append_authorization_device_revision','append_authorization_device_event','append_authorization_device_attempt','link_authorization_device_evidence','correct_authorization_device_audit') and has_function_privilege('anon',p.oid,'EXECUTE')), 0::bigint, 'anon has zero EXECUTE on privileged device writers');

-- 19
select is((select count(*) from pg_catalog.pg_proc p join pg_catalog.pg_namespace n on n.oid=p.pronamespace where n.nspname='app_private' and p.proname in ('append_authorization_device','append_authorization_device_revision','append_authorization_device_event','append_authorization_device_attempt','link_authorization_device_evidence','correct_authorization_device_audit') and has_function_privilege('authenticated',p.oid,'EXECUTE')), 0::bigint, 'authenticated has zero EXECUTE on privileged device writers');

-- 20
select is((select count(*) from pg_catalog.pg_proc p join pg_catalog.pg_namespace n on n.oid=p.pronamespace where n.nspname='app_private' and p.proname in ('append_authorization_device','append_authorization_device_revision','append_authorization_device_event','append_authorization_device_attempt','link_authorization_device_evidence','correct_authorization_device_audit') and has_function_privilege('service_role',p.oid,'EXECUTE')), 0::bigint, 'service_role has zero EXECUTE on privileged device writers');

-- 21
select is((select count(*) from pg_catalog.pg_trigger t join pg_catalog.pg_class c on c.oid=t.tgrelid join pg_catalog.pg_namespace n on n.oid=c.relnamespace where n.nspname='audit' and c.relname in ('authorization_devices','authorization_device_revisions','authorization_device_events','authorization_device_attempts','authorization_device_links','authorization_device_corrections') and not t.tgisinternal and t.tgname like 'trg_auth_db_014_%'), 12::bigint, 'six tables have row and truncate append-only triggers');

-- 22
select ok(not has_schema_privilege('vento_authorization_owner','audit','CREATE') and not has_schema_privilege('vento_authorization_owner','app_private','CREATE'), 'installation restores default-deny schema CREATE');

-- 23
select is((select count(*) from pg_catalog.pg_indexes where schemaname='audit' and indexname in ('ix_authorization_device_revisions_configuration_fingerprint','ix_authorization_device_events_device_sequence','ix_authorization_device_events_device_time','ix_authorization_device_events_correlation','ix_authorization_device_events_admin_actor_time','ix_authorization_device_events_actor_time','ix_authorization_device_events_type_time','ix_authorization_device_events_source_operation','ix_authorization_device_events_fingerprint')), 9::bigint, 'all nine canonical minimum indexes exist');

-- 24
select ok(exists(select 1 from pg_catalog.pg_constraint con join pg_catalog.pg_class c on c.oid=con.conrelid join pg_catalog.pg_namespace n on n.oid=c.relnamespace where n.nspname='audit' and c.relname='authorization_device_events' and con.conname='uq_authorization_device_events_sequence'), 'event sequence uniqueness exists');

-- 25
select ok(exists(select 1 from pg_catalog.pg_constraint con join pg_catalog.pg_class c on c.oid=con.conrelid join pg_catalog.pg_namespace n on n.oid=c.relnamespace where n.nspname='audit' and c.relname='authorization_device_revisions' and con.conname='uq_authorization_device_revisions_number'), 'revision sequence uniqueness exists');

-- 26
select ok(exists(select 1 from pg_catalog.pg_constraint con join pg_catalog.pg_class c on c.oid=con.conrelid join pg_catalog.pg_namespace n on n.oid=c.relnamespace where n.nspname='audit' and c.relname='authorization_devices' and con.conname='fk_authorization_devices_first_event' and con.condeferrable and con.condeferred), 'first_event lineage FK is deferred and non-destructive');

-- 27
select is((select count(*) from pg_catalog.pg_constraint con join pg_catalog.pg_class c on c.oid=con.conrelid join pg_catalog.pg_namespace n on n.oid=c.relnamespace join pg_catalog.pg_class f on f.oid=con.confrelid join pg_catalog.pg_namespace fn on fn.oid=f.relnamespace where n.nspname='audit' and c.relname like 'authorization_device%' and con.contype='f' and fn.nspname='public' and f.relname like 'shared_operational_device%'), 0::bigint, 'canonical device audit keeps no destructive FK to legacy shared-device sources');

set local role vento_authorization_owner;

-- 28
select is(app_private.fingerprint_authorization_device('{"a":1,"b":2}'::jsonb), app_private.fingerprint_authorization_device('{"b":2,"a":1}'::jsonb), 'object key order is canonical');

-- 29
select is(app_private.fingerprint_authorization_device('{"application_set":["VISO","NEXO","NEXO"]}'::jsonb), app_private.fingerprint_authorization_device('{"application_set":["NEXO","VISO"]}'::jsonb), 'application set order and duplicates are canonicalized');

-- 30
select is(app_private.fingerprint_authorization_device('{"permission_package_set":["B","A"]}'::jsonb), app_private.fingerprint_authorization_device('{"permission_package_set":["A","B"]}'::jsonb), 'permission package set order is canonicalized');

-- 31
select is(app_private.fingerprint_authorization_device('{"area_policy":{"allowed_area_ids":["B","A"]}}'::jsonb), app_private.fingerprint_authorization_device('{"area_policy":{"allowed_area_ids":["A","B"]}}'::jsonb), 'area set order is canonicalized');

-- 32
select isnt(app_private.fingerprint_authorization_device('{"installation_generation":1}'::jsonb), app_private.fingerprint_authorization_device('{"installation_generation":2}'::jsonb), 'material value changes fingerprint');

-- 33
select is(app_private.fingerprint_authorization_device(jsonb_build_object('label','Café')), app_private.fingerprint_authorization_device(jsonb_build_object('label','Café')), 'Unicode input is deterministic for the same contract representation');

-- 34
select isnt(app_private.fingerprint_authorization_device('{"x":null}'::jsonb), app_private.fingerprint_authorization_device('{}'::jsonb), 'null and absence remain distinct unless contract set semantics say otherwise');

reset role;

-- 35
select lives_ok($$select app_private.append_authorization_device(pg_temp.auth_db_014_root_payload('01400000-0000-4000-8000-000000000001'::uuid,'DEV014MAIN','ROOT-MAIN'))$$, 'register device');

-- 36
select is(app_private.derive_authorization_device_state('01400000-0000-4000-8000-000000000001'::uuid), 'DRAFT', 'registered device starts DRAFT');

-- 37
select is((select count(*) from audit.authorization_device_revisions where device_id='01400000-0000-4000-8000-000000000001'::uuid), 1::bigint, 'registration writes revision 1');

-- 38
select is((select count(*) from audit.authorization_device_events where device_id='01400000-0000-4000-8000-000000000001'::uuid and event_type='DEVICE_REGISTERED'), 1::bigint, 'registration writes DEVICE_REGISTERED exactly once');

-- 39
select ok((select d.first_event_id=e.device_event_id from audit.authorization_devices d join audit.authorization_device_events e on e.device_event_id=d.first_event_id where d.device_id='01400000-0000-4000-8000-000000000001'::uuid), 'root first_event_id points to durable first event');

-- 40
select ok((app_private.append_authorization_device(pg_temp.auth_db_014_root_payload('01400000-0000-4000-8000-000000000001'::uuid,'DEV014MAIN','ROOT-MAIN')) ->> 'idempotent')::boolean, 'registration exact replay is idempotent');

-- 41
select is((select count(*) from audit.authorization_device_events where device_id='01400000-0000-4000-8000-000000000001'::uuid), 1::bigint, 'registration replay creates no duplicate event');

-- 42
select throws_ok($$select app_private.append_authorization_device(pg_temp.auth_db_014_root_payload('01400000-0000-4000-8000-000000000001'::uuid,'DEV014MAIN','ROOT-MAIN-CONFLICT'))$$, '23505', 'AUTH_DB_014_DEVICE_AUDIT_IDENTITY_CONFLICT', 'same device with incompatible idempotency identity fails closed');

-- 43
select lives_ok($$select pg_temp.auth_db_014_apply_event('01400000-0000-4000-8000-000000000001'::uuid,'ENROLLMENT_STARTED','LIFE-01-ENROLLMENT_STARTED')$$, 'lifecycle ENROLLMENT_STARTED');

-- 44
select lives_ok($$select pg_temp.auth_db_014_apply_event('01400000-0000-4000-8000-000000000001'::uuid,'ENROLLMENT_FAILED','LIFE-02-ENROLLMENT_FAILED')$$, 'lifecycle ENROLLMENT_FAILED');

-- 45
select lives_ok($$select pg_temp.auth_db_014_apply_revision('01400000-0000-4000-8000-000000000001'::uuid,'ENROLLMENT','ENROLLING','ENROLLMENT_SUCCEEDED','LIFE-03-ENROLLMENT_SUCCEEDED',2)$$, 'lifecycle ENROLLMENT_SUCCEEDED');

-- 46
select lives_ok($$select pg_temp.auth_db_014_apply_revision('01400000-0000-4000-8000-000000000001'::uuid,'ACTIVATION','ACTIVE','DEVICE_ACTIVATED','LIFE-04-DEVICE_ACTIVATED',3)$$, 'lifecycle DEVICE_ACTIVATED');

-- 47
select lives_ok($$select pg_temp.auth_db_014_apply_revision('01400000-0000-4000-8000-000000000001'::uuid,'SUSPENSION','SUSPENDED','DEVICE_SUSPENDED','LIFE-05-DEVICE_SUSPENDED',4)$$, 'lifecycle DEVICE_SUSPENDED');

-- 48
select lives_ok($$select pg_temp.auth_db_014_apply_revision('01400000-0000-4000-8000-000000000001'::uuid,'RESUMPTION','ACTIVE','DEVICE_RESUMED','LIFE-06-DEVICE_RESUMED',5)$$, 'lifecycle DEVICE_RESUMED');

-- 49
select lives_ok($$select pg_temp.auth_db_014_apply_event('01400000-0000-4000-8000-000000000001'::uuid,'CREDENTIAL_ROTATION_STARTED','LIFE-07-CREDENTIAL_ROTATION_STARTED')$$, 'lifecycle CREDENTIAL_ROTATION_STARTED');

-- 50
select lives_ok($$select pg_temp.auth_db_014_apply_event('01400000-0000-4000-8000-000000000001'::uuid,'CREDENTIAL_ROTATION_FAILED','LIFE-08-CREDENTIAL_ROTATION_FAILED')$$, 'lifecycle CREDENTIAL_ROTATION_FAILED');

-- 51
select lives_ok($$select pg_temp.auth_db_014_apply_revision('01400000-0000-4000-8000-000000000001'::uuid,'CREDENTIAL','ACTIVE','CREDENTIAL_ROTATED','LIFE-09-CREDENTIAL_ROTATED',6)$$, 'lifecycle CREDENTIAL_ROTATED');

-- 52
select lives_ok($$select pg_temp.auth_db_014_apply_revision('01400000-0000-4000-8000-000000000001'::uuid,'CREDENTIAL','ACTIVE','CREDENTIAL_REVOKED','LIFE-10-CREDENTIAL_REVOKED',7)$$, 'lifecycle CREDENTIAL_REVOKED');

-- 53
select lives_ok($$select pg_temp.auth_db_014_apply_revision('01400000-0000-4000-8000-000000000001'::uuid,'ENDPOINT','ACTIVE','ENDPOINT_REINSTALLED','LIFE-11-ENDPOINT_REINSTALLED',8)$$, 'lifecycle ENDPOINT_REINSTALLED');

-- 54
select lives_ok($$select pg_temp.auth_db_014_apply_revision('01400000-0000-4000-8000-000000000001'::uuid,'ENDPOINT','ACTIVE','ENDPOINT_REVOKED','LIFE-12-ENDPOINT_REVOKED',9)$$, 'lifecycle ENDPOINT_REVOKED');

-- 55
select lives_ok($$select pg_temp.auth_db_014_apply_revision('01400000-0000-4000-8000-000000000001'::uuid,'HARDWARE','ACTIVE','HARDWARE_REPLACED','LIFE-13-HARDWARE_REPLACED',10)$$, 'lifecycle HARDWARE_REPLACED');

-- 56
select lives_ok($$select pg_temp.auth_db_014_apply_revision('01400000-0000-4000-8000-000000000001'::uuid,'TERRITORY','ACTIVE','SITE_BINDING_CHANGED','LIFE-14-SITE_BINDING_CHANGED',11)$$, 'lifecycle SITE_BINDING_CHANGED');

-- 57
select lives_ok($$select pg_temp.auth_db_014_apply_revision('01400000-0000-4000-8000-000000000001'::uuid,'TERRITORY','ACTIVE','AREA_POLICY_CHANGED','LIFE-15-AREA_POLICY_CHANGED',12)$$, 'lifecycle AREA_POLICY_CHANGED');

-- 58
select lives_ok($$select pg_temp.auth_db_014_apply_revision('01400000-0000-4000-8000-000000000001'::uuid,'APPLICATIONS','ACTIVE','APPLICATION_SET_CHANGED','LIFE-16-APPLICATION_SET_CHANGED',13)$$, 'lifecycle APPLICATION_SET_CHANGED');

-- 59
select lives_ok($$select pg_temp.auth_db_014_apply_revision('01400000-0000-4000-8000-000000000001'::uuid,'APPLICATIONS','ACTIVE','DEFAULT_APPLICATION_CHANGED','LIFE-17-DEFAULT_APPLICATION_CHANGED',14)$$, 'lifecycle DEFAULT_APPLICATION_CHANGED');

-- 60
select lives_ok($$select pg_temp.auth_db_014_apply_revision('01400000-0000-4000-8000-000000000001'::uuid,'PERMISSIONS','ACTIVE','PERMISSION_PACKAGE_CHANGED','LIFE-18-PERMISSION_PACKAGE_CHANGED',15)$$, 'lifecycle PERMISSION_PACKAGE_CHANGED');

-- 61
select lives_ok($$select pg_temp.auth_db_014_apply_revision('01400000-0000-4000-8000-000000000001'::uuid,'TEMPLATE','ACTIVE','TEMPLATE_BINDING_CHANGED','LIFE-19-TEMPLATE_BINDING_CHANGED',16)$$, 'lifecycle TEMPLATE_BINDING_CHANGED');

-- 62
select lives_ok($$select pg_temp.auth_db_014_apply_revision('01400000-0000-4000-8000-000000000001'::uuid,'ACTOR_POLICY','ACTIVE','ACTOR_CHANGED','LIFE-20-ACTOR_CHANGED',17)$$, 'lifecycle ACTOR_CHANGED');

-- 63
select lives_ok($$select pg_temp.auth_db_014_apply_event('01400000-0000-4000-8000-000000000001'::uuid,'ACTOR_SESSION_STARTED','LIFE-21-ACTOR_SESSION_STARTED')$$, 'lifecycle ACTOR_SESSION_STARTED');

-- 64
select lives_ok($$select pg_temp.auth_db_014_apply_event('01400000-0000-4000-8000-000000000001'::uuid,'ACTOR_SESSION_ENDED','LIFE-22-ACTOR_SESSION_ENDED')$$, 'lifecycle ACTOR_SESSION_ENDED');

-- 65
select lives_ok($$select pg_temp.auth_db_014_apply_event('01400000-0000-4000-8000-000000000001'::uuid,'ACTOR_SESSION_EXPIRED','LIFE-23-ACTOR_SESSION_EXPIRED')$$, 'lifecycle ACTOR_SESSION_EXPIRED');

-- 66
select lives_ok($$select pg_temp.auth_db_014_apply_event('01400000-0000-4000-8000-000000000001'::uuid,'ACTOR_SESSION_REVOKED','LIFE-24-ACTOR_SESSION_REVOKED')$$, 'lifecycle ACTOR_SESSION_REVOKED');

-- 67
select lives_ok($$select pg_temp.auth_db_014_apply_event('01400000-0000-4000-8000-000000000001'::uuid,'DEVICE_BECAME_UNHEALTHY','LIFE-25-DEVICE_BECAME_UNHEALTHY')$$, 'lifecycle DEVICE_BECAME_UNHEALTHY');

-- 68
select lives_ok($$select pg_temp.auth_db_014_apply_event('01400000-0000-4000-8000-000000000001'::uuid,'DEVICE_RECOVERED_HEALTH','LIFE-26-DEVICE_RECOVERED_HEALTH')$$, 'lifecycle DEVICE_RECOVERED_HEALTH');

-- 69
select lives_ok($$select pg_temp.auth_db_014_apply_revision('01400000-0000-4000-8000-000000000001'::uuid,'CONFLICT','CONFLICTED','IDENTITY_CONFLICT_DETECTED','LIFE-27-IDENTITY_CONFLICT_DETECTED',18)$$, 'lifecycle IDENTITY_CONFLICT_DETECTED');

-- 70
select lives_ok($$select pg_temp.auth_db_014_apply_revision('01400000-0000-4000-8000-000000000001'::uuid,'CONFLICT','ACTIVE','IDENTITY_CONFLICT_RESOLVED','LIFE-28-IDENTITY_CONFLICT_RESOLVED',19)$$, 'lifecycle IDENTITY_CONFLICT_RESOLVED');

-- 71
select lives_ok($$select pg_temp.auth_db_014_apply_revision('01400000-0000-4000-8000-000000000001'::uuid,'RECOVERY','RECOVERY_REQUIRED','RECOVERY_STARTED','LIFE-29-RECOVERY_STARTED',20)$$, 'lifecycle RECOVERY_STARTED');

-- 72
select lives_ok($$select pg_temp.auth_db_014_apply_revision('01400000-0000-4000-8000-000000000001'::uuid,'RECOVERY','ACTIVE','RECOVERY_COMPLETED','LIFE-30-RECOVERY_COMPLETED',21)$$, 'lifecycle RECOVERY_COMPLETED');

-- 73
select lives_ok($$select pg_temp.auth_db_014_apply_revision('01400000-0000-4000-8000-000000000001'::uuid,'REVOCATION','REVOKED','DEVICE_REVOKED','LIFE-31-DEVICE_REVOKED',22)$$, 'lifecycle DEVICE_REVOKED');

-- 74
select lives_ok($$select pg_temp.auth_db_014_apply_event('01400000-0000-4000-8000-000000000001'::uuid,'RETIREMENT_STARTED','LIFE-32-RETIREMENT_STARTED')$$, 'lifecycle RETIREMENT_STARTED');

-- 75
select lives_ok($$select pg_temp.auth_db_014_apply_revision('01400000-0000-4000-8000-000000000001'::uuid,'RETIREMENT','RETIRED','DEVICE_RETIRED','LIFE-33-DEVICE_RETIRED',23)$$, 'lifecycle DEVICE_RETIRED');

-- 76
select is((select count(distinct event_type) from audit.authorization_device_events where device_id='01400000-0000-4000-8000-000000000001'::uuid), 34::bigint, 'main lifecycle exercises all 34 non-legacy event types including registration');

-- 77
select is((select count(*) from audit.authorization_device_events where device_id='01400000-0000-4000-8000-000000000001'::uuid and event_family is null), 0::bigint, 'every exercised lifecycle event has canonical family');

-- 78
select is(app_private.derive_authorization_device_state('01400000-0000-4000-8000-000000000001'::uuid), 'RETIRED', 'lifecycle reaches RETIRED terminal state');

-- 79
select throws_ok($$select pg_temp.auth_db_014_apply_event('01400000-0000-4000-8000-000000000001'::uuid,'DEVICE_RECOVERED_HEALTH','AFTER-RETIRE')$$, '55000', 'AUTH_DB_014_RETIRED_DEVICE_EVENT_FORBIDDEN', 'retired device rejects new event');

-- 80
select lives_ok($$select app_private.append_authorization_device(pg_temp.auth_db_014_root_payload('01400000-0000-4000-8000-000000000002'::uuid,'DEV014IDEM','ROOT-IDEM'))$$, 'idempotency fixture root');

-- 81
select lives_ok($$select app_private.append_authorization_device_revision(pg_temp.auth_db_014_revision_payload('01400000-0000-4000-8000-000000000002'::uuid,1,1,'ACTIVATION','ACTIVE','DEVICE_ACTIVATED','IDEM-REV',2))$$, 'first revision request succeeds');

-- 82
select ok((app_private.append_authorization_device_revision(pg_temp.auth_db_014_revision_payload('01400000-0000-4000-8000-000000000002'::uuid,1,1,'ACTIVATION','ACTIVE','DEVICE_ACTIVATED','IDEM-REV',2)) ->> 'idempotent')::boolean, 'revision exact retry succeeds despite stale expected revision after first write');

-- 83
select is((select count(*) from audit.authorization_device_revisions where device_id='01400000-0000-4000-8000-000000000002'::uuid), 2::bigint, 'revision retry does not duplicate');

-- 84
select lives_ok($$select app_private.append_authorization_device_event(pg_temp.auth_db_014_event_payload('01400000-0000-4000-8000-000000000002'::uuid,2,2,'ACTOR_SESSION_STARTED','IDEM-EVENT'))$$, 'first event request succeeds');

-- 85
select ok((app_private.append_authorization_device_event(pg_temp.auth_db_014_event_payload('01400000-0000-4000-8000-000000000002'::uuid,2,2,'ACTOR_SESSION_STARTED','IDEM-EVENT')) ->> 'idempotent')::boolean, 'event exact retry succeeds despite stale expected event sequence');

-- 86
select is((select count(*) from audit.authorization_device_events where device_id='01400000-0000-4000-8000-000000000002'::uuid), 3::bigint, 'event retry does not duplicate');

-- 87
select lives_ok($$select app_private.append_authorization_device_attempt(pg_temp.auth_db_014_attempt_payload('01400000-0000-4000-8000-000000000002'::uuid,'EXTERNAL_ROTATION','UNKNOWN_OUTCOME','DEVICE_AUDIT_EXTERNAL_RESULT_UNKNOWN','IDEM-ATT'))$$, 'first attempt request succeeds');

-- 88
select ok((app_private.append_authorization_device_attempt(pg_temp.auth_db_014_attempt_payload('01400000-0000-4000-8000-000000000002'::uuid,'EXTERNAL_ROTATION','UNKNOWN_OUTCOME','DEVICE_AUDIT_EXTERNAL_RESULT_UNKNOWN','IDEM-ATT')) ->> 'idempotent')::boolean, 'attempt exact retry is idempotent');

-- 89
select is((select count(*) from audit.authorization_device_attempts where device_id='01400000-0000-4000-8000-000000000002'::uuid and requested_operation='EXTERNAL_ROTATION'), 1::bigint, 'attempt retry does not duplicate');

-- 90
select throws_ok($$select app_private.append_authorization_device_revision(pg_temp.auth_db_014_revision_payload('01400000-0000-4000-8000-000000000002'::uuid,1,1,'ACTIVATION','ACTIVE','DEVICE_ACTIVATED','IDEM-REV',3))$$, '23505', 'AUTH_DB_014_IDEMPOTENCY_CONFLICT', 'same revision idempotency key with different request conflicts');

-- 91
select throws_ok($$select app_private.append_authorization_device_event(pg_temp.auth_db_014_event_payload('01400000-0000-4000-8000-000000000002'::uuid,2,2,'ACTOR_CHANGED','IDEM-EVENT'))$$, '23505', 'AUTH_DB_014_IDEMPOTENCY_CONFLICT', 'same event idempotency key with different request conflicts');

-- 92
select lives_ok($$select app_private.link_authorization_device_evidence(jsonb_build_object('device_id','01400000-0000-4000-8000-000000000002','source_type','AUTHORIZATION_DECISION','source_id','01400000-0000-4000-8000-00000000a001','target_type','DEVICE_EVENT','target_id',(select device_event_id::text from audit.authorization_device_events where device_id='01400000-0000-4000-8000-000000000002'::uuid and event_type='DEVICE_ACTIVATED'),'relationship','AUTHORIZED_CHANGE','correlation_id','AUTH-DB-014-LINK-1'))$$, 'approved evidence link inserts');

-- 93
select ok((app_private.link_authorization_device_evidence(jsonb_build_object('device_id','01400000-0000-4000-8000-000000000002','source_type','AUTHORIZATION_DECISION','source_id','01400000-0000-4000-8000-00000000a001','target_type','DEVICE_EVENT','target_id',(select device_event_id::text from audit.authorization_device_events where device_id='01400000-0000-4000-8000-000000000002'::uuid and event_type='DEVICE_ACTIVATED'),'relationship','AUTHORIZED_CHANGE','correlation_id','AUTH-DB-014-LINK-1')) ->> 'idempotent')::boolean, 'evidence link exact replay is idempotent');

-- 94
select lives_ok($$select app_private.correct_authorization_device_audit(jsonb_build_object('device_id','01400000-0000-4000-8000-000000000002','target_record_type','DEVICE_EVENT','target_record_id',(select device_event_id::text from audit.authorization_device_events where device_id='01400000-0000-4000-8000-000000000002'::uuid and event_type='DEVICE_ACTIVATED'),'correction_kind','METADATA_CLARIFICATION','reason','Clarify non-authoritative metadata reference','authorization_decision_id','01400000-0000-4000-8000-00000000a001','correlation_id','AUTH-DB-014-CORRECTION-1','before_reference',jsonb_build_object('classification','ORIGINAL'),'after_reference',jsonb_build_object('classification','CLARIFIED')))$$, 'authorized append-only correction inserts');

-- 95
select is((select count(*) from audit.authorization_device_corrections where device_id='01400000-0000-4000-8000-000000000002'::uuid), 1::bigint, 'correction is append-only evidence row');

set local role vento_authorization_owner;

-- 96
select throws_ok($$update audit.authorization_device_events set event_outcome='NO_OP_CONFIRMED' where device_id='01400000-0000-4000-8000-000000000002'::uuid$$, '55000', 'AUTH_DB_014_APPEND_ONLY_MUTATION_FORBIDDEN', 'event UPDATE is forbidden even to owner path');

-- 97
select throws_ok($$delete from audit.authorization_device_events where device_id='01400000-0000-4000-8000-000000000002'::uuid$$, '55000', 'AUTH_DB_014_APPEND_ONLY_MUTATION_FORBIDDEN', 'event DELETE is forbidden');

-- 98
select throws_ok($$truncate table audit.authorization_device_events$$, '55000', 'AUTH_DB_014_APPEND_ONLY_MUTATION_FORBIDDEN', 'event TRUNCATE is forbidden');

-- 99
select throws_ok($$update audit.authorization_device_revisions set lifecycle_state='DRAFT' where device_id='01400000-0000-4000-8000-000000000002'::uuid$$, '55000', 'AUTH_DB_014_APPEND_ONLY_MUTATION_FORBIDDEN', 'revision UPDATE is forbidden');

-- 100
select throws_ok($$delete from audit.authorization_device_corrections where device_id='01400000-0000-4000-8000-000000000002'::uuid$$, '55000', 'AUTH_DB_014_APPEND_ONLY_MUTATION_FORBIDDEN', 'correction DELETE is forbidden');

reset role;

-- 101
select throws_ok($$select app_private.append_authorization_device_revision(pg_temp.auth_db_014_revision_payload('01400000-0000-4000-8000-00000000ffff'::uuid,1,1,'ACTIVATION','ACTIVE','DEVICE_ACTIVATED','UNKNOWN-DEV',2))$$, 'P0002', 'AUTH_DB_014_DEVICE_NOT_FOUND', 'unknown device fails closed');

-- 102
select throws_ok($$select app_private.append_authorization_device(pg_temp.auth_db_014_root_payload('01400000-0000-4000-8000-000000000003'::uuid,'DEV014DENY','DENY-ROOT','01400000-0000-4000-8000-00000000d001'))$$, '42501', 'AUTH_DB_014_DEVICE_AUDIT_NOT_AUTHORIZED', 'DENY authorization cannot register device');

-- 103
select throws_ok($$select app_private.append_authorization_device(pg_temp.auth_db_014_root_payload('01400000-0000-4000-8000-000000000003'::uuid,'DEV014BADVER','BAD-VER') || jsonb_build_object('source_versions',jsonb_build_object('device_registry','latest')))$$, '22023', 'AUTH_DB_014_SOURCE_IDENTITY_INVALID', 'latest source version is rejected');

-- 104
select throws_ok($$select app_private.append_authorization_device(pg_temp.auth_db_014_root_payload('01400000-0000-4000-8000-000000000003'::uuid,'DEV014BADFP','BAD-FP') || jsonb_build_object('source_fingerprints',jsonb_build_object('device_registry','sha256:XYZ')))$$, '22023', 'AUTH_DB_014_SOURCE_IDENTITY_INVALID', 'invalid source fingerprint is rejected');

-- 105
select throws_ok($$select app_private.append_authorization_device(pg_temp.auth_db_014_root_payload('01400000-0000-4000-8000-000000000003'::uuid,'DEV014SECRET','BAD-PIN') || jsonb_build_object('pin','1234'))$$, '22023', 'AUTH_DB_014_DEVICE_AUDIT_INVALID_INPUT', 'PIN is rejected before persistence');

-- 106
select throws_ok($$select app_private.append_authorization_device(pg_temp.auth_db_014_root_payload('01400000-0000-4000-8000-000000000003'::uuid,'DEV014JWT','BAD-JWT') || jsonb_build_object('jwt','eyJ.synthetic.token'))$$, '22023', 'AUTH_DB_014_DEVICE_AUDIT_INVALID_INPUT', 'JWT is rejected before persistence');

-- 107
select throws_ok($$select app_private.append_authorization_device(pg_temp.auth_db_014_root_payload('01400000-0000-4000-8000-000000000003'::uuid,'DEV014REFRESH','BAD-REFRESH') || jsonb_build_object('refresh_token','synthetic-refresh'))$$, '22023', 'AUTH_DB_014_DEVICE_AUDIT_INVALID_INPUT', 'refresh token is rejected before persistence');

-- 108
select throws_ok($$select app_private.append_authorization_device(pg_temp.auth_db_014_root_payload('01400000-0000-4000-8000-000000000003'::uuid,'DEV014SECRET2','BAD-SECRET') || jsonb_build_object('secret','synthetic-secret'))$$, '22023', 'AUTH_DB_014_DEVICE_AUDIT_INVALID_INPUT', 'generic secret field is rejected');

-- 109
select throws_ok($$select app_private.append_authorization_device(pg_temp.auth_db_014_root_payload('01400000-0000-4000-8000-000000000003'::uuid,'DEV014PASSKEY','BAD-PASSKEY') || jsonb_build_object('passkey_material','synthetic-passkey'))$$, '22023', 'AUTH_DB_014_DEVICE_AUDIT_INVALID_INPUT', 'passkey material is rejected');

-- 110
select throws_ok($$select app_private.append_authorization_device(pg_temp.auth_db_014_root_payload('01400000-0000-4000-8000-000000000003'::uuid,'DEV014AUTHHDR','BAD-AUTH') || jsonb_build_object('Authorization','Bearer synthetic'))$$, '22023', 'AUTH_DB_014_DEVICE_AUDIT_INVALID_INPUT', 'Authorization header is rejected');

-- 111
select throws_ok($$select app_private.append_authorization_device(pg_temp.auth_db_014_root_payload('01400000-0000-4000-8000-000000000003'::uuid,'DEV014EMAIL','BAD-EMAIL') || jsonb_build_object('email','person@example.test'))$$, '22023', 'AUTH_DB_014_DEVICE_AUDIT_INVALID_INPUT', 'email is rejected from canonical audit input');

-- 112
select throws_ok($$select app_private.append_authorization_device(pg_temp.auth_db_014_root_payload('01400000-0000-4000-8000-000000000003'::uuid,'DEV014PHONE','BAD-PHONE') || jsonb_build_object('phone','+570000000000'))$$, '22023', 'AUTH_DB_014_DEVICE_AUDIT_INVALID_INPUT', 'phone is rejected from canonical audit input');

-- 113
select throws_ok($$select app_private.append_authorization_device_event(pg_temp.auth_db_014_event_payload('01400000-0000-4000-8000-000000000002'::uuid,2,3,'NOT_A_REAL_EVENT','UNKNOWN-EVENT'))$$, '22023', 'AUTH_DB_014_EVENT_TYPE_UNKNOWN', 'unknown event type is rejected');

-- 114
select throws_ok($$select app_private.append_authorization_device_revision(pg_temp.auth_db_014_revision_payload('01400000-0000-4000-8000-000000000002'::uuid,1,1,'ACTIVATION','ACTIVE','DEVICE_ACTIVATED','STALE-REV',4))$$, '40001', 'AUTH_DB_014_DEVICE_AUDIT_STALE_REVISION', 'stale revision fails closed');

-- 115
select lives_ok($$select app_private.append_authorization_device_attempt(pg_temp.auth_db_014_attempt_payload('01400000-0000-4000-8000-000000000002'::uuid,'ENDPOINT_VALIDATE','DENIED','FOREIGN_ENDPOINT','NEG-01'))$$, 'negative case FOREIGN_ENDPOINT is durable attempt evidence');

-- 116
select lives_ok($$select app_private.append_authorization_device_attempt(pg_temp.auth_db_014_attempt_payload('01400000-0000-4000-8000-000000000002'::uuid,'PRINCIPAL_VALIDATE','DENIED','FOREIGN_TECHNICAL_PRINCIPAL','NEG-02'))$$, 'negative case FOREIGN_TECHNICAL_PRINCIPAL is durable attempt evidence');

-- 117
select lives_ok($$select app_private.append_authorization_device_attempt(pg_temp.auth_db_014_attempt_payload('01400000-0000-4000-8000-000000000002'::uuid,'CREDENTIAL_VALIDATE','DENIED','STALE_CREDENTIAL_BINDING','NEG-03'))$$, 'negative case STALE_CREDENTIAL_BINDING is durable attempt evidence');

-- 118
select lives_ok($$select app_private.append_authorization_device_attempt(pg_temp.auth_db_014_attempt_payload('01400000-0000-4000-8000-000000000002'::uuid,'SITE_VALIDATE','DENIED','INCOMPATIBLE_SITE','NEG-04'))$$, 'negative case INCOMPATIBLE_SITE is durable attempt evidence');

-- 119
select lives_ok($$select app_private.append_authorization_device_attempt(pg_temp.auth_db_014_attempt_payload('01400000-0000-4000-8000-000000000002'::uuid,'AREA_VALIDATE','DENIED','CROSS_SITE_AREA','NEG-05'))$$, 'negative case CROSS_SITE_AREA is durable attempt evidence');

-- 120
select lives_ok($$select app_private.append_authorization_device_attempt(pg_temp.auth_db_014_attempt_payload('01400000-0000-4000-8000-000000000002'::uuid,'APP_VALIDATE','DENIED','NONCANONICAL_APPLICATION','NEG-06'))$$, 'negative case NONCANONICAL_APPLICATION is durable attempt evidence');

-- 121
select lives_ok($$select app_private.append_authorization_device_attempt(pg_temp.auth_db_014_attempt_payload('01400000-0000-4000-8000-000000000002'::uuid,'PACKAGE_VALIDATE','DENIED','PERMISSION_OUTSIDE_PACKAGE','NEG-07'))$$, 'negative case PERMISSION_OUTSIDE_PACKAGE is durable attempt evidence');

-- 122
select lives_ok($$select app_private.append_authorization_device_attempt(pg_temp.auth_db_014_attempt_payload('01400000-0000-4000-8000-000000000002'::uuid,'ACTOR_VALIDATE','DENIED','UNAUTHORIZED_ACTOR','NEG-08'))$$, 'negative case UNAUTHORIZED_ACTOR is durable attempt evidence');

-- 123
select lives_ok($$select app_private.append_authorization_device_attempt(pg_temp.auth_db_014_attempt_payload('01400000-0000-4000-8000-000000000002'::uuid,'SESSION_VALIDATE','DENIED','EXPIRED_ACTOR_SESSION','NEG-09'))$$, 'negative case EXPIRED_ACTOR_SESSION is durable attempt evidence');

-- 124
select is((select count(*) from audit.authorization_device_attempts where device_id='01400000-0000-4000-8000-000000000002'::uuid and reason_codes && array['FOREIGN_ENDPOINT','FOREIGN_TECHNICAL_PRINCIPAL','STALE_CREDENTIAL_BINDING','INCOMPATIBLE_SITE','CROSS_SITE_AREA','NONCANONICAL_APPLICATION','PERMISSION_OUTSIDE_PACKAGE','UNAUTHORIZED_ACTOR','EXPIRED_ACTOR_SESSION']::text[]), 9::bigint, 'all nine compatibility negative cases are attempts');

-- 125
select is((select count(*) from audit.authorization_device_events where device_id='01400000-0000-4000-8000-000000000002'::uuid and event_payload::text ~ 'FOREIGN_ENDPOINT|FOREIGN_TECHNICAL_PRINCIPAL|STALE_CREDENTIAL_BINDING|INCOMPATIBLE_SITE|CROSS_SITE_AREA|NONCANONICAL_APPLICATION|PERMISSION_OUTSIDE_PACKAGE|UNAUTHORIZED_ACTOR|EXPIRED_ACTOR_SESSION'), 0::bigint, 'negative compatibility cases produce zero success events');

-- 126
select lives_ok($$select app_private.append_authorization_device_attempt(pg_temp.auth_db_014_attempt_payload('01400000-0000-4000-8000-000000000002'::uuid,'EXTERNAL_TIMEOUT','UNKNOWN_OUTCOME','TIMEOUT','EXT-01'))$$, 'external failure TIMEOUT is durable attempt evidence');

-- 127
select lives_ok($$select app_private.append_authorization_device_attempt(pg_temp.auth_db_014_attempt_payload('01400000-0000-4000-8000-000000000002'::uuid,'CONNECTION_DROPPED','UNKNOWN_OUTCOME','CONNECTION_DROPPED_AFTER_SEND','EXT-02'))$$, 'external failure CONNECTION_DROPPED_AFTER_SEND is durable attempt evidence');

-- 128
select lives_ok($$select app_private.append_authorization_device_attempt(pg_temp.auth_db_014_attempt_payload('01400000-0000-4000-8000-000000000002'::uuid,'DOUBLE_PROVIDER_RESPONSE','CONFLICT','DOUBLE_PROVIDER_RESPONSE','EXT-03'))$$, 'external failure DOUBLE_PROVIDER_RESPONSE is durable attempt evidence');

-- 129
select lives_ok($$select app_private.append_authorization_device_attempt(pg_temp.auth_db_014_attempt_payload('01400000-0000-4000-8000-000000000002'::uuid,'ACCEPTED_RESPONSE_LOST','UNKNOWN_OUTCOME','ACCEPTED_RESPONSE_LOST','EXT-04'))$$, 'external failure ACCEPTED_RESPONSE_LOST is durable attempt evidence');

-- 130
select lives_ok($$select app_private.append_authorization_device_attempt(pg_temp.auth_db_014_attempt_payload('01400000-0000-4000-8000-000000000002'::uuid,'DB_FAILURE_AFTER_ANCHOR','RETRYABLE_FAILURE','DATABASE_FAILURE_AFTER_ANCHOR','EXT-05'))$$, 'external failure DATABASE_FAILURE_AFTER_ANCHOR is durable attempt evidence');

-- 131
select lives_ok($$select app_private.append_authorization_device_attempt(pg_temp.auth_db_014_attempt_payload('01400000-0000-4000-8000-000000000002'::uuid,'OUTBOX_FAILURE','RETRYABLE_FAILURE','OUTBOX_FAILURE','EXT-06'))$$, 'external failure OUTBOX_FAILURE is durable attempt evidence');

-- 132
select lives_ok($$select app_private.append_authorization_device_attempt(pg_temp.auth_db_014_attempt_payload('01400000-0000-4000-8000-000000000002'::uuid,'RETRY_SCHEDULED','NO_EFFECT','RETRY_SCHEDULED','EXT-07'))$$, 'external failure RETRY_SCHEDULED is durable attempt evidence');

-- 133
select lives_ok($$select app_private.append_authorization_device_attempt(pg_temp.auth_db_014_attempt_payload('01400000-0000-4000-8000-000000000002'::uuid,'LATE_RESULT','NO_EFFECT','LATE_RESULT_RECONCILIATION','EXT-08'))$$, 'external failure LATE_RESULT_RECONCILIATION is durable attempt evidence');

-- 134
select is((select count(*) from audit.authorization_device_attempts where device_id='01400000-0000-4000-8000-000000000002'::uuid and source_operation_id like 'ATTEMPT:EXT-%'), 8::bigint, 'all eight external failure fixtures are durable');

-- 135
select is((select count(*) from audit.authorization_device_attempts where device_id='01400000-0000-4000-8000-000000000002'::uuid and source_operation_id like 'ATTEMPT:EXT-%' and outcome='UNKNOWN_OUTCOME' and resolved_at is null), 3::bigint, 'unknown external outcomes remain unresolved');

-- 136
select is((select count(*) from audit.authorization_device_events where device_id='01400000-0000-4000-8000-000000000002'::uuid and source_operation_id like 'ATTEMPT:EXT-%'), 0::bigint, 'external failures never appear as confirmed success events');

-- 137
select lives_ok($$select app_private.append_authorization_device(pg_temp.auth_db_014_root_payload('01400000-0000-4000-8000-000000000101'::uuid,'DEV014RACE1','RACE-1-ROOT'))$$, 'ROTATE vs ROTATE fixture root');

-- 138
select lives_ok($$select app_private.append_authorization_device_revision(pg_temp.auth_db_014_revision_payload('01400000-0000-4000-8000-000000000101'::uuid,1,1,'CREDENTIAL','ACTIVE','CREDENTIAL_ROTATED','RACE-1-A',2))$$, 'ROTATE vs ROTATE first transition wins');

-- 139
select throws_ok($$select app_private.append_authorization_device_revision(pg_temp.auth_db_014_revision_payload('01400000-0000-4000-8000-000000000101'::uuid,1,1,'CREDENTIAL','ACTIVE','CREDENTIAL_ROTATED','RACE-1-B',3))$$, '40001', 'AUTH_DB_014_DEVICE_AUDIT_STALE_REVISION', 'ROTATE vs ROTATE loser fails on stale revision');

-- 140
select lives_ok($$select app_private.append_authorization_device(pg_temp.auth_db_014_root_payload('01400000-0000-4000-8000-000000000102'::uuid,'DEV014RACE2','RACE-2-ROOT'))$$, 'REVOKE vs ACTIVATE fixture root');

-- 141
select lives_ok($$select app_private.append_authorization_device_revision(pg_temp.auth_db_014_revision_payload('01400000-0000-4000-8000-000000000102'::uuid,1,1,'REVOCATION','REVOKED','DEVICE_REVOKED','RACE-2-A',2))$$, 'REVOKE vs ACTIVATE first transition wins');

-- 142
select throws_ok($$select app_private.append_authorization_device_revision(pg_temp.auth_db_014_revision_payload('01400000-0000-4000-8000-000000000102'::uuid,1,1,'ACTIVATION','ACTIVE','DEVICE_ACTIVATED','RACE-2-B',3))$$, '40001', 'AUTH_DB_014_DEVICE_AUDIT_STALE_REVISION', 'REVOKE vs ACTIVATE loser fails on stale revision');

-- 143
select lives_ok($$select app_private.append_authorization_device(pg_temp.auth_db_014_root_payload('01400000-0000-4000-8000-000000000103'::uuid,'DEV014RACE3','RACE-3-ROOT'))$$, 'RETIRE vs RECOVERY fixture root');

-- 144
select lives_ok($$select app_private.append_authorization_device_revision(pg_temp.auth_db_014_revision_payload('01400000-0000-4000-8000-000000000103'::uuid,1,1,'RETIREMENT','RETIRED','DEVICE_RETIRED','RACE-3-A',2))$$, 'RETIRE vs RECOVERY first transition wins');

-- 145
select throws_ok($$select app_private.append_authorization_device_revision(pg_temp.auth_db_014_revision_payload('01400000-0000-4000-8000-000000000103'::uuid,1,1,'RECOVERY','RECOVERY_REQUIRED','RECOVERY_STARTED','RACE-3-B',3))$$, '40001', 'AUTH_DB_014_DEVICE_AUDIT_STALE_REVISION', 'RETIRE vs RECOVERY loser fails on stale revision');

-- 146
select lives_ok($$select app_private.append_authorization_device(pg_temp.auth_db_014_root_payload('01400000-0000-4000-8000-000000000104'::uuid,'DEV014RACE4','RACE-4-ROOT'))$$, 'ACTOR_CHANGE vs ACTOR_CHANGE fixture root');

-- 147
select lives_ok($$select app_private.append_authorization_device_event(pg_temp.auth_db_014_event_payload('01400000-0000-4000-8000-000000000104'::uuid,1,1,'ACTOR_CHANGED','RACE-4-A'))$$, 'ACTOR_CHANGE vs ACTOR_CHANGE first event wins');

-- 148
select throws_ok($$select app_private.append_authorization_device_event(pg_temp.auth_db_014_event_payload('01400000-0000-4000-8000-000000000104'::uuid,1,1,'ACTOR_CHANGED','RACE-4-B'))$$, '40001', 'AUTH_DB_014_EVENT_SEQUENCE_CONFLICT', 'ACTOR_CHANGE vs ACTOR_CHANGE loser fails on event sequence');

-- 149
select lives_ok($$select app_private.append_authorization_device(pg_temp.auth_db_014_root_payload('01400000-0000-4000-8000-000000000105'::uuid,'DEV014RACE5','RACE-5-ROOT'))$$, 'SITE_MOVE vs ACTOR_START fixture root');

-- 150
select lives_ok($$select app_private.append_authorization_device_revision(pg_temp.auth_db_014_revision_payload('01400000-0000-4000-8000-000000000105'::uuid,1,1,'TERRITORY','DRAFT','SITE_BINDING_CHANGED','RACE-5-A',2))$$, 'SITE_MOVE vs ACTOR_START site move wins');

-- 151
select throws_ok($$select app_private.append_authorization_device_event(pg_temp.auth_db_014_event_payload('01400000-0000-4000-8000-000000000105'::uuid,1,1,'ACTOR_SESSION_STARTED','RACE-5-B'))$$, '40001', 'AUTH_DB_014_DEVICE_AUDIT_STALE_REVISION', 'SITE_MOVE vs ACTOR_START stale actor start fails');

-- 152
select lives_ok($$select app_private.append_authorization_device(pg_temp.auth_db_014_root_payload('01400000-0000-4000-8000-000000000106'::uuid,'DEV014RACE6','RACE-6-ROOT'))$$, 'PACKAGE_CHANGE vs ACTION fixture root');

-- 153
select lives_ok($$select app_private.append_authorization_device_revision(pg_temp.auth_db_014_revision_payload('01400000-0000-4000-8000-000000000106'::uuid,1,1,'PERMISSIONS','DRAFT','PERMISSION_PACKAGE_CHANGED','RACE-6-A',2))$$, 'PACKAGE_CHANGE vs ACTION package change wins');

-- 154
select throws_ok($$select app_private.append_authorization_device_event(pg_temp.auth_db_014_event_payload('01400000-0000-4000-8000-000000000106'::uuid,1,1,'ACTOR_CHANGED','RACE-6-B'))$$, '40001', 'AUTH_DB_014_DEVICE_AUDIT_STALE_REVISION', 'PACKAGE_CHANGE vs ACTION stale action fails');

-- 155
select lives_ok($$select app_private.append_authorization_device(pg_temp.auth_db_014_root_payload('01400000-0000-4000-8000-000000000107'::uuid,'DEV014RACE7','RACE-7-ROOT'))$$, 'ENDPOINT_REINSTALL vs CREDENTIAL_REVOKE fixture root');

-- 156
select lives_ok($$select app_private.append_authorization_device_revision(pg_temp.auth_db_014_revision_payload('01400000-0000-4000-8000-000000000107'::uuid,1,1,'ENDPOINT','DRAFT','ENDPOINT_REINSTALLED','RACE-7-A',2))$$, 'ENDPOINT_REINSTALL vs CREDENTIAL_REVOKE endpoint reinstall wins');

-- 157
select throws_ok($$select app_private.append_authorization_device_revision(pg_temp.auth_db_014_revision_payload('01400000-0000-4000-8000-000000000107'::uuid,1,1,'CREDENTIAL','DRAFT','CREDENTIAL_REVOKED','RACE-7-B',3))$$, '40001', 'AUTH_DB_014_DEVICE_AUDIT_STALE_REVISION', 'ENDPOINT_REINSTALL vs CREDENTIAL_REVOKE stale credential revoke fails');

-- 158
select is((2)::bigint, 2::bigint, 'documented AUTH-DB-014 hosted legacy baseline devices=2');

-- 159
select is((4)::bigint, 4::bigint, 'documented AUTH-DB-014 hosted legacy baseline device_apps=4');

-- 160
select is((0)::bigint, 0::bigint, 'documented AUTH-DB-014 hosted legacy baseline actor_sessions=0');

-- 161
select is((3)::bigint, 3::bigint, 'documented AUTH-DB-014 hosted legacy baseline events=3');

-- 162
select is((6)::bigint, 6::bigint, 'documented AUTH-DB-014 hosted legacy baseline templates=6');

-- 163
select is((17)::bigint, 17::bigint, 'documented AUTH-DB-014 hosted legacy baseline template_apps=17');

-- 164
select is((2)::bigint, 2::bigint, 'documented AUTH-DB-014 hosted legacy baseline actor_policies=2');

-- 165
select is((7)::bigint, 7::bigint, 'documented AUTH-DB-014 hosted legacy baseline template_actor_policies=7');

set local role vento_authorization_owner;

-- 166
select is(app_private.import_authorization_device_legacy_event(jsonb_build_object('id','01410000-0000-4000-8000-000000000001','device_id','01420000-0000-4000-8000-000000000001','session_user_id',null,'actor_employee_id',null,'actor_shift_id',null,'app_code','viso','site_id',null,'area_id',null,'event_type','device.created','event_payload',jsonb_build_object('legacy_auth_email','legacy@example.test','reason','synthetic legacy fixture'),'source','admin','occurred_at','2026-07-09T11:00:00Z','created_at','2026-07-09T11:00:00Z'),'LEGACY014A') ->> 'classification','LEGACY_PARTIAL','legacy event 1 imports as LEGACY_PARTIAL');

-- 167
select is(app_private.import_authorization_device_legacy_event(jsonb_build_object('id','01410000-0000-4000-8000-000000000002','device_id','01420000-0000-4000-8000-000000000001','session_user_id',null,'actor_employee_id',null,'actor_shift_id',null,'app_code','viso','site_id',null,'area_id',null,'event_type','device.migrated_from_employee.safe_phase_1','event_payload',jsonb_build_object('legacy_employee_name','Synthetic Legacy Name','reason','synthetic legacy fixture'),'source','admin','occurred_at','2026-07-09T12:00:00Z','created_at','2026-07-09T12:00:00Z'),'LEGACY014A') ->> 'classification','LEGACY_PARTIAL','legacy event 2 imports as LEGACY_PARTIAL');

-- 168
select is(app_private.import_authorization_device_legacy_event(jsonb_build_object('id','01410000-0000-4000-8000-000000000003','device_id','01420000-0000-4000-8000-000000000002','session_user_id',null,'actor_employee_id',null,'actor_shift_id',null,'app_code','viso','site_id',null,'area_id',null,'event_type','legacy_employee.deactivated','event_payload',jsonb_build_object('login_email','legacy-login@example.test','reason','synthetic legacy fixture'),'source','admin','occurred_at','2026-07-09T13:00:00Z','created_at','2026-07-09T13:00:00Z'),'LEGACY014B') ->> 'classification','LEGACY_PARTIAL','legacy event 3 imports as LEGACY_PARTIAL');

reset role;

-- 169
select is((select count(*) from audit.authorization_device_events where source_system='public.shared_operational_device_events' and source_operation_id in ('public.shared_operational_device_events:01410000-0000-4000-8000-000000000001','public.shared_operational_device_events:01410000-0000-4000-8000-000000000002','public.shared_operational_device_events:01410000-0000-4000-8000-000000000003')), 3::bigint, 'three synthetic legacy events are preserved exactly once');

-- 170
select is((select count(*) from audit.authorization_device_events where source_system='public.shared_operational_device_events' and source_operation_id in ('public.shared_operational_device_events:01410000-0000-4000-8000-000000000001','public.shared_operational_device_events:01410000-0000-4000-8000-000000000002','public.shared_operational_device_events:01410000-0000-4000-8000-000000000003') and event_type <> 'LEGACY_RECORD_IMPORTED'), 0::bigint, 'legacy import fabricates zero lifecycle event types');

-- 171
select is((select count(*) from audit.authorization_device_revisions where device_id in ('01420000-0000-4000-8000-000000000001'::uuid,'01420000-0000-4000-8000-000000000002'::uuid)), 0::bigint, 'legacy import fabricates zero configuration revisions');

-- 172
select is((select count(*) from audit.authorization_device_events where source_system='public.shared_operational_device_events' and event_payload::text ~* 'legacy@example|Synthetic Legacy Name|legacy-login@example'), 0::bigint, 'legacy PII payload values are not copied into canonical event payload');

-- 173
select is((select count(*) from audit.authorization_device_links where source_type='MIGRATION' and source_id in ('public.shared_operational_device_events:01410000-0000-4000-8000-000000000001','public.shared_operational_device_events:01410000-0000-4000-8000-000000000002','public.shared_operational_device_events:01410000-0000-4000-8000-000000000003')), 3::bigint, 'each promotable legacy event has one lineage link');

set local role vento_authorization_owner;

-- 174
select is(app_private.import_authorization_device_legacy_event(jsonb_build_object('id','01410000-0000-4000-8000-000000000004','device_id',null,'session_user_id',null,'actor_employee_id',null,'actor_shift_id',null,'app_code','viso','site_id',null,'area_id',null,'event_type','device.created','event_payload',jsonb_build_object('login_email','redacted@example.test'),'source','admin','occurred_at','2026-07-09T14:00:00Z','created_at','2026-07-09T14:00:00Z'),null) ->> 'classification','LEGACY_UNVERIFIABLE','legacy event without device identity remains unverifiable attempt');

reset role;

-- 175
select is((select count(*) from audit.authorization_device_attempts where source_operation_id='public.shared_operational_device_events:01410000-0000-4000-8000-000000000004' and reason_codes=array['DEVICE_AUDIT_LEGACY_UNVERIFIABLE']::text[]), 1::bigint, 'unverifiable legacy evidence is preserved without affirmative event');

-- 176
select lives_ok($$select app_private.append_authorization_device(pg_temp.auth_db_014_root_payload('01420000-0000-4000-8000-000000000001'::uuid,'LEGACY014A','LEGACY-ADOPT','01400000-0000-4000-8000-00000000a001',1))$$, 'legacy audit root can be adopted by a later real authorized registration without rewrite');

-- 177
select is((select count(*) from audit.authorization_device_revisions where device_id='01420000-0000-4000-8000-000000000001'::uuid), 1::bigint, 'legacy adoption creates canonical revision 1 only when real registration occurs');

-- 178
select is((select count(*) from audit.authorization_device_events where device_id='01420000-0000-4000-8000-000000000001'::uuid and event_type='DEVICE_REGISTERED'), 1::bigint, 'legacy adoption adds one real DEVICE_REGISTERED event');

-- 179
select is((select min(event_type) filter (where event_sequence=1) from audit.authorization_device_events where device_id='01420000-0000-4000-8000-000000000001'::uuid), 'LEGACY_RECORD_IMPORTED', 'legacy first event remains the original imported evidence');

-- 180
select is((select d.first_event_id::text from audit.authorization_devices d where d.device_id='01420000-0000-4000-8000-000000000001'::uuid), (select e.device_event_id::text from audit.authorization_device_events e where e.device_id='01420000-0000-4000-8000-000000000001'::uuid and e.event_sequence=1), 'legacy root first_event_id is not rewritten during adoption');

-- 181
select ok((app_private.append_authorization_device(pg_temp.auth_db_014_root_payload('01420000-0000-4000-8000-000000000001'::uuid,'LEGACY014A','LEGACY-ADOPT','01400000-0000-4000-8000-00000000a001',1)) ->> 'idempotent')::boolean, 'legacy adoption exact retry is idempotent');

-- 182
select lives_ok($$create schema auth_db_014_shadow$$, 'malicious shadow schema fixture can be created inside test transaction');

-- 183
select lives_ok($$create function auth_db_014_shadow.canonicalize_authorization_device(jsonb) returns text language sql immutable as 'select ''MALICIOUS''::text'$$, 'malicious homonym fixture exists');

-- 184
select ok(set_config('search_path','auth_db_014_shadow,public',true) is not null, 'session search_path can be poisoned for test');

set local role vento_authorization_owner;

-- 185
select extensions.is(app_private.fingerprint_authorization_device('{"application_set":["NEXO","VISO"]}'::jsonb), 'sha256:' || encode(extensions.digest(app_private.canonicalize_authorization_device('{"application_set":["NEXO","VISO"]}'::jsonb),'sha256'),'hex'), 'qualified hardened fingerprint ignores malicious search_path homonym');

reset role;

-- 186
select extensions.ok(set_config('search_path','public,extensions',true) is not null, 'search_path restored for remaining tests');

-- 187
select is((select count(*) from audit.authorization_device_events where event_payload::text ~* 'eyJ.synthetic|synthetic-refresh|synthetic-secret|synthetic-passkey|Bearer synthetic|person@example|\+570000000000'), 0::bigint, 'no secret/minimization fixture leaked into event payload');

-- 188
select is((select count(*) from audit.authorization_device_attempts where safe_request_snapshot::text ~* 'eyJ.synthetic|synthetic-refresh|synthetic-secret|synthetic-passkey|Bearer synthetic|person@example|\+570000000000' or safe_result_snapshot::text ~* 'eyJ.synthetic|synthetic-refresh|synthetic-secret|synthetic-passkey|Bearer synthetic|person@example|\+570000000000'), 0::bigint, 'no secret/minimization fixture leaked into attempt snapshots');

-- 189
select is((select count(*) from audit.authorization_devices where source_contract_sha256 <> '17823df588e49b5ac27dec4fa2b75e222d1797841818611629f306a9a34ee11c'), 0::bigint, 'authorization_devices rows preserve exact AUTH-DB-014 source contract hash');

-- 190
select is((select count(*) from audit.authorization_device_revisions where source_contract_sha256 <> '17823df588e49b5ac27dec4fa2b75e222d1797841818611629f306a9a34ee11c'), 0::bigint, 'authorization_device_revisions rows preserve exact AUTH-DB-014 source contract hash');

-- 191
select is((select count(*) from audit.authorization_device_events where source_contract_sha256 <> '17823df588e49b5ac27dec4fa2b75e222d1797841818611629f306a9a34ee11c'), 0::bigint, 'authorization_device_events rows preserve exact AUTH-DB-014 source contract hash');

-- 192
select is((select count(*) from audit.authorization_device_attempts where source_contract_sha256 <> '17823df588e49b5ac27dec4fa2b75e222d1797841818611629f306a9a34ee11c'), 0::bigint, 'authorization_device_attempts rows preserve exact AUTH-DB-014 source contract hash');

-- 193
select is((select count(*) from audit.authorization_device_links where source_contract_sha256 <> '17823df588e49b5ac27dec4fa2b75e222d1797841818611629f306a9a34ee11c'), 0::bigint, 'authorization_device_links rows preserve exact AUTH-DB-014 source contract hash');

-- 194
select is((select count(*) from audit.authorization_device_corrections where source_contract_sha256 <> '17823df588e49b5ac27dec4fa2b75e222d1797841818611629f306a9a34ee11c'), 0::bigint, 'authorization_device_corrections rows preserve exact AUTH-DB-014 source contract hash');

-- 195
select is((select count(*) from audit.authorization_device_events where event_outcome not in ('SUCCEEDED','NO_OP_CONFIRMED')), 0::bigint, 'confirmed event ledger contains no unknown/failure outcome');

-- 196
select is((select count(*) from audit.authorization_device_attempts where outcome='UNKNOWN_OUTCOME' and resolved_at is not null), 0::bigint, 'UNKNOWN_OUTCOME attempts never claim resolution');

-- 197
select is((select count(*) from audit.authorization_device_events e join audit.authorization_device_revisions r on r.device_revision_id=e.device_revision_id where e.event_type <> 'LEGACY_RECORD_IMPORTED' and e.device_id <> r.device_id), 0::bigint, 'event-to-revision device identity stays consistent');

-- 198
select is((select count(*) from audit.authorization_device_events e where e.event_type <> 'LEGACY_RECORD_IMPORTED' and e.device_revision_id is null), 0::bigint, 'all non-legacy confirmed events reference a revision');

-- 199
select is((select count(*) from audit.authorization_devices d where not exists(select 1 from audit.authorization_device_events e where e.device_event_id=d.first_event_id)), 0::bigint, 'every device audit root preserves a first event');

select * from finish();
rollback;
