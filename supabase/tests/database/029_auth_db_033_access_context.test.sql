-- VENTO_DB_TEST_CATEGORY: SCHEMA
begin;

create extension if not exists pgtap with schema extensions;

select plan(87);

-- Ownership and role posture (1-10).
select ok(exists(select 1 from pg_roles where rolname = 'vento_access_context_owner'), 'isolated owner role exists');
select ok(exists(select 1 from pg_roles where rolname = 'vento_access_context_owner' and not rolcanlogin and not rolinherit and not rolsuper and not rolcreatedb and not rolcreaterole and not rolreplication and not rolbypassrls), 'isolated owner posture is fail closed');
select is((select count(*) from pg_auth_members m join pg_roles member on member.oid = m.member join pg_roles role_ on role_.oid = m.roleid where role_.rolname = 'vento_access_context_owner' and member.rolname in ('anon', 'authenticated', 'service_role')), 0::bigint, 'runtime roles are not owner members');
select ok(pg_has_role('postgres', 'vento_access_context_owner', 'SET'), 'postgres may SET the isolated owner for governed DDL');
select is((select count(*) from (values ('anon'), ('authenticated'), ('service_role')) r(name) where has_schema_privilege(name, 'app_private', 'USAGE')), 0::bigint, 'runtime roles have no app_private usage');
select ok(not has_schema_privilege('vento_access_context_owner', 'app_private', 'CREATE'), 'owner cannot create future app_private objects');
select ok(not has_schema_privilege('vento_access_context_owner', 'api', 'CREATE'), 'owner cannot create future api objects');
select ok(has_table_privilege('vento_access_context_owner', 'identity_access.principals', 'SELECT'), 'owner has exact principal read dependency');
select ok(has_table_privilege('vento_access_context_owner', 'identity_access.enterprise_identity_links', 'SELECT'), 'owner has exact identity-link read dependency');
select ok(not has_table_privilege('vento_access_context_owner', 'identity_access.identity_resolution_cases', 'SELECT'), 'owner has no unused resolution-case dependency');

-- Exact graph and ownership (11-34).
select ok(to_regprocedure(signature) is not null, description)
from (values
  ('app_private.resolve_access_application(text,timestamp with time zone)', 'application helper exists'),
  ('app_private.resolve_access_principal(text,timestamp with time zone,jsonb)', 'principal helper exists'),
  ('app_private.resolve_access_actor(text,timestamp with time zone,jsonb,jsonb)', 'actor helper exists'),
  ('app_private.resolve_access_base_lane(text,timestamp with time zone,jsonb,jsonb)', 'base-lane helper exists'),
  ('app_private.resolve_access_operational_lane(text,timestamp with time zone,jsonb,jsonb)', 'operational-lane helper exists'),
  ('app_private.resolve_access_device(text,timestamp with time zone,jsonb,jsonb,jsonb)', 'device helper exists'),
  ('app_private.validate_access_context(jsonb)', 'context validator exists'),
  ('app_private.canonicalize_access_context(jsonb)', 'canonicalizer exists'),
  ('app_private.fingerprint_access_context(jsonb)', 'fingerprinter exists'),
  ('app_private.project_safe_access_context(text,jsonb)', 'safe projector exists'),
  ('app_private.get_access_context(text)', 'full resolver exists'),
  ('api.get_safe_access_context(text)', 'safe wrapper exists')
) graph(signature, description);

select is(pg_get_userbyid(p.proowner), 'vento_access_context_owner', description)
from (values
  ('app_private.resolve_access_application(text,timestamp with time zone)'::regprocedure, 'application helper owner'),
  ('app_private.resolve_access_principal(text,timestamp with time zone,jsonb)'::regprocedure, 'principal helper owner'),
  ('app_private.resolve_access_actor(text,timestamp with time zone,jsonb,jsonb)'::regprocedure, 'actor helper owner'),
  ('app_private.resolve_access_base_lane(text,timestamp with time zone,jsonb,jsonb)'::regprocedure, 'base-lane helper owner'),
  ('app_private.resolve_access_operational_lane(text,timestamp with time zone,jsonb,jsonb)'::regprocedure, 'operational-lane helper owner'),
  ('app_private.resolve_access_device(text,timestamp with time zone,jsonb,jsonb,jsonb)'::regprocedure, 'device helper owner'),
  ('app_private.validate_access_context(jsonb)'::regprocedure, 'context validator owner'),
  ('app_private.canonicalize_access_context(jsonb)'::regprocedure, 'canonicalizer owner'),
  ('app_private.fingerprint_access_context(jsonb)'::regprocedure, 'fingerprinter owner'),
  ('app_private.project_safe_access_context(text,jsonb)'::regprocedure, 'safe projector owner'),
  ('app_private.get_access_context(text)'::regprocedure, 'full resolver owner'),
  ('api.get_safe_access_context(text)'::regprocedure, 'safe wrapper owner')
) expected(oid, description)
join pg_proc p on p.oid = expected.oid;

-- Function security and invocation boundary (35-50).
select ok((select prosecdef from pg_proc where oid = 'app_private.get_access_context(text)'::regprocedure), 'full resolver is security definer');
select ok((select prosecdef from pg_proc where oid = 'api.get_safe_access_context(text)'::regprocedure), 'safe wrapper is security definer');
select is((select count(*) from pg_proc p join pg_namespace n on n.oid = p.pronamespace where n.nspname = 'app_private' and p.proname in ('resolve_access_application','resolve_access_principal','resolve_access_actor','resolve_access_base_lane','resolve_access_operational_lane','resolve_access_device','validate_access_context','canonicalize_access_context','fingerprint_access_context','project_safe_access_context') and not p.prosecdef), 8::bigint, 'pure helpers remain security invoker; the two source readers are isolated definers');
select is((select provolatile from pg_proc where oid = 'app_private.get_access_context(text)'::regprocedure), 's', 'full resolver is stable');
select is((select provolatile from pg_proc where oid = 'api.get_safe_access_context(text)'::regprocedure), 's', 'safe wrapper is stable');
select ok((select proconfig @> array['search_path=pg_catalog, app_private'] from pg_proc where oid = 'app_private.get_access_context(text)'::regprocedure), 'full resolver search path is fixed');
select ok((select proconfig @> array['search_path=pg_catalog, app_private'] from pg_proc where oid = 'api.get_safe_access_context(text)'::regprocedure), 'safe wrapper search path is fixed');
select ok(not has_function_privilege('public', 'app_private.get_access_context(text)', 'EXECUTE'), 'PUBLIC cannot execute full resolver');
select ok(not has_function_privilege('anon', 'app_private.get_access_context(text)', 'EXECUTE'), 'anon cannot execute full resolver');
select ok(not has_function_privilege('authenticated', 'app_private.get_access_context(text)', 'EXECUTE'), 'authenticated cannot execute full resolver');
select ok(not has_function_privilege('service_role', 'app_private.get_access_context(text)', 'EXECUTE'), 'service_role cannot execute full resolver');
select ok(not has_function_privilege('public', 'api.get_safe_access_context(text)', 'EXECUTE'), 'PUBLIC cannot execute safe wrapper');
select ok(not has_function_privilege('anon', 'api.get_safe_access_context(text)', 'EXECUTE'), 'anon cannot execute safe wrapper');
select ok(has_function_privilege('authenticated', 'api.get_safe_access_context(text)', 'EXECUTE'), 'authenticated explicitly executes safe wrapper');
select ok(not has_function_privilege('service_role', 'api.get_safe_access_context(text)', 'EXECUTE'), 'service_role has no implicit safe-wrapper grant');
select is((select count(*) from pg_proc p join pg_namespace n on n.oid = p.pronamespace cross join (values ('anon'),('authenticated'),('service_role')) r(name) where n.nspname = 'app_private' and p.proname like '%access_%' and has_function_privilege(r.name, p.oid, 'EXECUTE')), 0::bigint, 'runtime roles have zero direct execution across private graph');

-- Contract, validation, and unresolved behavior (51-69).
select throws_ok($$select app_private.get_access_context(null)$$, '22023', 'AUTH_DB_033_APPLICATION_CODE_REQUIRED', 'null application fails with 22023');
select throws_ok($$select app_private.get_access_context('   ')$$, '22023', 'AUTH_DB_033_APPLICATION_CODE_REQUIRED', 'blank application fails with 22023');
select set_config('request.jwt.claim.sub', '', true);
create temporary table auth_db_033_unknown on commit drop as select app_private.get_access_context('unknown-app') as context;
create temporary table auth_db_033_unlinked on commit drop as select app_private.get_access_context('nexo') as context;
select is(context ->> 'contract_family', 'vento.authorization.response-contracts', 'contract family is exact') from auth_db_033_unknown;
select is(context ->> 'contract_family_version', '1.0.0', 'contract family version is exact') from auth_db_033_unknown;
select is(context ->> 'contract_name', 'AccessContext', 'contract name is exact') from auth_db_033_unknown;
select is(context ->> 'contract_version', '1.0.0', 'contract version is exact') from auth_db_033_unknown;
select is(context ->> 'schema_version', '1.0.0', 'schema version is exact') from auth_db_033_unknown;
select ok((context ->> 'context_id')::uuid is not null, 'context id is a server UUID') from auth_db_033_unknown;
select ok((context ->> 'resolved_at')::timestamptz is not null, 'resolved_at is a server timestamp') from auth_db_033_unknown;
select ok(context ?& array['principal','actor_effective','domain_identity','employee','base_role','assigned_sites','assigned_areas','administrative_coverage','active_shift','active_checkin_session','operational_role','operational_site','operational_area','device_context','lane_readiness','structural_issues','resolution_metadata'], 'full context contains every required section') from auth_db_033_unknown;
select ok(context @? '$.structural_issues[*] ? (@.issue_code == "RESOLVER_CONFIGURATION_MISSING")', 'unknown valid-shaped app returns structural configuration issue') from auth_db_033_unknown;
select is(context #>> '{principal,principal_type}', 'ANONYMOUS', 'missing JWT resolves anonymous principal') from auth_db_033_unlinked;
select is(context #>> '{principal,principal_status}', 'ANONYMOUS', 'missing JWT has anonymous status') from auth_db_033_unlinked;
select ok(context @? '$.structural_issues[*] ? (@.issue_code == "AUTH_UNAUTHENTICATED")', 'missing JWT emits canonical unauthenticated issue') from auth_db_033_unlinked;
select is(context #>> '{actor_effective,actor_type}', 'UNRESOLVED', 'anonymous actor remains unresolved') from auth_db_033_unlinked;
select is(context #>> '{lane_readiness,base,status}', 'UNAVAILABLE', 'base lane fails closed') from auth_db_033_unlinked;
select is(context #>> '{lane_readiness,operational,status}', 'UNAVAILABLE', 'operational lane fails closed') from auth_db_033_unlinked;
select is(context #>> '{resolution_metadata,resolver}', 'vento.authorization.get_access_context', 'resolver identity is exact') from auth_db_033_unlinked;
select is(context #>> '{resolution_metadata,cache_status}', 'NOT_IMPLEMENTED', 'cache truthfully remains not implemented') from auth_db_033_unlinked;
select is((select array_agg(key order by key) from jsonb_object_keys((select context #> '{resolution_metadata,source_versions}' from auth_db_033_unlinked)) key), array['actor_resolution_model','application_catalog','domain_identity_policy','enterprise_identity_links','principal_registry','structural_issue_catalog'], 'source_versions is closed to used sources');
select is((select array_agg(key order by key) from jsonb_object_keys((select context #> '{resolution_metadata,source_fingerprints}' from auth_db_033_unlinked)) key), array['actor_resolution_model','application_catalog','domain_identity_policy','enterprise_identity_links','principal_registry','structural_issue_catalog'], 'fingerprint keys exactly match version keys');

-- Safe projection, identity link behavior, determinism, and rollback (70-87).
set local role vento_ddl_owner;
insert into identity_access.principals(id, auth_subject_id, principal_kind, source_version, audit_reference)
values (
  '10000000-0000-4000-8000-000000000001',
  '10000000-0000-4000-8000-000000000002',
  'HUMAN_USER', 'AUTH-DB-033-TEST', 'pgTAP rollback fixture'
);
insert into identity_access.enterprise_identity_links(
  principal_id, auth_subject_id, principal_kind, enterprise_identity_kind,
  enterprise_identity_id, link_state, link_origin, assurance_level,
  authority_reference, reason_code, verified_at, activated_at,
  source_version, audit_reference
)
values (
  '10000000-0000-4000-8000-000000000001',
  '10000000-0000-4000-8000-000000000002',
  'HUMAN_USER', 'CUSTOMER', '10000000-0000-4000-8000-000000000003',
  'ACTIVE', 'MANUAL_RECONCILIATION', 'TEST', 'AUTH-DB-033-TEST',
  'TEST_FIXTURE', now(), now(), 'AUTH-DB-033-TEST', 'pgTAP rollback fixture'
);
reset role;
select set_config('request.jwt.claim.sub', '10000000-0000-4000-8000-000000000002', true);
create temporary table auth_db_033_linked on commit drop as select app_private.get_access_context('pass') as context;
create temporary table auth_db_033_safe on commit drop as select api.get_safe_access_context('pass') as context;
select is(context #>> '{principal,principal_type}', 'HUMAN_USER', 'linked JWT resolves human principal') from auth_db_033_linked;
select is(context #>> '{principal,principal_status}', 'VALID', 'linked principal is valid') from auth_db_033_linked;
select is(context #>> '{actor_effective,actor_type}', 'CUSTOMER', 'customer application selects customer identity') from auth_db_033_linked;
select is(context #>> '{domain_identity,status}', 'ACTIVE', 'active domain link resolves active identity') from auth_db_033_linked;
select ok((context ->> 'context_id')::uuid is not null, 'safe projection preserves context id') from auth_db_033_safe;
select ok((context ->> 'resolved_at')::timestamptz is not null, 'safe projection preserves resolved timestamp') from auth_db_033_safe;
select ok((context ->> 'expires_at')::timestamptz > (context ->> 'resolved_at')::timestamptz, 'safe projection has later expiry') from auth_db_033_safe;
select matches(context ->> 'context_fingerprint', '^sha256:[0-9a-f]{64}$', 'fingerprint has canonical sha256 format') from auth_db_033_safe;
select ok(context ?& array['context_id','resolved_at','context_fingerprint','expires_at','safe_fields'], 'safe projection has exact envelope fields') from auth_db_033_safe;
select is((select count(*) from jsonb_object_keys((select context from auth_db_033_safe)) key where key not in ('context_id','resolved_at','context_fingerprint','expires_at','safe_fields')), 0::bigint, 'safe envelope has no extra fields');
select ok(not ((select context from auth_db_033_safe)::text ~ 'source_versions|source_fingerprints|auth_user_id|session_id|identity_id|employee_id|actor_id'), 'safe projection leaks no internal identity or source fields');
select ok(not ((select context from auth_db_033_safe)::text ~ 'permissions|grants|denies|checkin_session_id|shift_id'), 'safe projection leaks no authority or session data');
select lives_ok($$set local role authenticated; select api.get_safe_access_context('pass'); reset role$$, 'authenticated can invoke safe wrapper end to end');
select throws_ok($$set local role anon; select api.get_safe_access_context('pass')$$, '42501', null, 'anon invocation is denied');
select is(app_private.canonicalize_access_context(context), app_private.canonicalize_access_context(context || jsonb_build_object('context_id', gen_random_uuid(), 'resolved_at', now())), 'canonical form excludes volatile snapshot identity') from auth_db_033_linked;
select is(app_private.fingerprint_access_context(context), app_private.fingerprint_access_context(context || jsonb_build_object('context_id', gen_random_uuid(), 'resolved_at', now())), 'fingerprint is stable across volatile snapshot identity') from auth_db_033_linked;

select * from finish();
rollback;
