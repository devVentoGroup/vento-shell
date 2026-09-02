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
  '01300000-0000-4000-8000-000000000001', '1.0.0', '1.0.0', 'sha256:' || repeat('1',64),
  pg_catalog.statement_timestamp(), 'AUTH-DB-013-CORR-ALLOW', 'AUTH-DB-013-CONTEXT-1',
  'AUTH-DB-013-PRINCIPAL-1', 'AUTH-DB-013-ACTOR-1', 'AUTH-DB-013-DEVICE-1', 'VISO',
  'viso.authorization.context_simulations.view', 'EXECUTE', 'SERVER_ACTION', 'SIMULATION', '{}', 'ALLOW',
  array['BASE'], array['SIMULATION_ADMIN_AUTHORIZED'], 'sha256:' || repeat('a',64),
  'sha256:' || repeat('b',64), 'sha256:' || repeat('c',64), '{}'::jsonb,
  'AUTH_DB_034', '1.0.0', 'FULL_DECISION', '{}'::jsonb, 'FUNCTIONAL_SENSITIVE', 'RET_OBLIGATION', repeat('d',64)
),
(
  '01300000-0000-4000-8000-000000000002', '1.0.0', '1.0.0', 'sha256:' || repeat('2',64),
  pg_catalog.statement_timestamp(), 'AUTH-DB-013-CORR-DENY', 'AUTH-DB-013-CONTEXT-2',
  'AUTH-DB-013-PRINCIPAL-2', 'AUTH-DB-013-ACTOR-2', null, 'VISO',
  'viso.authorization.context_simulations.view', 'EXECUTE', 'SERVER_ACTION', 'SIMULATION', '{}', 'DENY',
  '{}'::text[], array['EXPLICIT_DENY'], 'sha256:' || repeat('e',64),
  'sha256:' || repeat('f',64), 'sha256:' || repeat('0',64), '{}'::jsonb,
  'AUTH_DB_034', '1.0.0', 'FULL_DECISION', '{}'::jsonb, 'FUNCTIONAL_SENSITIVE', 'RET_OBLIGATION', repeat('d',64)
)
on conflict (decision_id) do nothing;

reset role;

create function pg_temp.auth_db_013_scenario(
  p_requirement text default 'FULL_PREVIEW',
  p_role_code text default 'bodeguero',
  p_permission_key text default 'nexo.inventory.stock.view',
  p_app_code text default 'NEXO'
)
returns jsonb
language sql
as $$
  select pg_catalog.jsonb_build_object(
    'scenario_kind', 'AUTHORIZATION_CONTEXT',
    'simulated_subject', pg_catalog.jsonb_build_object(
      'subject_kind', 'EMPLOYEE',
      'subject_reference', 'EMPLOYEE-SIM-013'
    ),
    'simulated_role', pg_catalog.jsonb_build_object(
      'role_kind', 'BASE',
      'role_code', p_role_code,
      'role_catalog_version', 'AUTH-RBAC-1.0.0',
      'matrix_version', 'AUTH-MATRIX-1.0.0'
    ),
    'simulated_site', pg_catalog.jsonb_build_object(
      'simulated_site_id', 'SITE-SIM-013',
      'simulated_site_code', 'CP',
      'simulated_site_type', 'production',
      'simulated_site_kind', 'physical',
      'site_catalog_version', 'SITE-CAT-1.0.0'
    ),
    'simulated_area', pg_catalog.jsonb_build_object(
      'simulated_site_id', 'SITE-SIM-013',
      'simulated_area_id', 'AREA-SIM-013',
      'area_code', 'BODEGA',
      'area_class', 'ORGANIZATIONAL',
      'area_kind', 'EXACT',
      'area_catalog_version', 'AREA-CAT-1.0.0'
    ),
    'simulated_shift', pg_catalog.jsonb_build_object(
      'mode', 'NO_SHIFT',
      'simulated_shift_reference', null,
      'source_shift_id', null,
      'published_revision_reference', null,
      'row_fingerprint', null,
      'simulated_resolved_at', '2026-09-02T09:00:00-05:00',
      'timezone', 'America/Bogota',
      'shift_contract_version', '1.0.0'
    ),
    'simulated_checkin', pg_catalog.jsonb_build_object(
      'simulated_checkin_state', 'NOT_APPLICABLE',
      'simulated_checkin_point_id', null
    ),
    'simulated_resource', pg_catalog.jsonb_build_object(
      'mode', 'SYNTHETIC_RESOURCE',
      'resource_type', 'inventory_item',
      'resource_fingerprint', 'sha256:' || repeat('7',64)
    ),
    'simulated_resolved_at', '2026-09-02T09:00:00-05:00',
    'policy_snapshot', pg_catalog.jsonb_build_object(
      'schema_version', '1.0.0',
      'simulation_requirement', p_requirement,
      'permission_key', p_permission_key,
      'app_code', p_app_code,
      'authorization_contract_version', '1.0.0',
      'catalog_version', 'PERM-CAT-1.0.0'
    ),
    'source_versions', pg_catalog.jsonb_build_object(
      'authorization_contract', '1.0.0',
      'permission_catalog', 'PERM-CAT-1.0.0',
      'base_role_matrix', 'AUTH-MATRIX-1.0.0'
    ),
    'source_fingerprints', pg_catalog.jsonb_build_object(
      'authorization_contract', 'sha256:' || repeat('8',64),
      'permission_catalog', 'sha256:' || repeat('9',64),
      'base_role_matrix', 'sha256:' || repeat('a',64)
    )
  );
$$;

create function pg_temp.auth_db_013_create_payload(
  p_idempotency text,
  p_purpose text default 'ACCESS_REVIEW',
  p_requirement text default 'FULL_PREVIEW',
  p_role_code text default 'bodeguero'
)
returns jsonb
language sql
as $$
  select pg_catalog.jsonb_build_object(
    'expires_at', pg_catalog.transaction_timestamp() + interval '1 day',
    'purpose_code', p_purpose,
    'reason_code', 'AUTHORIZED_REVIEW',
    'justification_reference', 'CASE-AUTH-DB-013',
    'requester_authorization_decision_id', '01300000-0000-4000-8000-000000000001',
    'real_session_reference', 'SESSION-AUTH-DB-013-1',
    'real_access_context_id', 'AUTH-DB-013-CONTEXT-1',
    'real_access_context_fingerprint', 'sha256:' || repeat('a',64),
    'idempotency_key', p_idempotency,
    'source_versions', pg_catalog.jsonb_build_object('authorization_contract','1.0.0','simulation_policy','AUTH-SIM-1.0.0'),
    'source_fingerprints', pg_catalog.jsonb_build_object('authorization_contract','sha256:' || repeat('b',64),'simulation_policy','sha256:' || repeat('c',64)),
    'scenario', pg_temp.auth_db_013_scenario(p_requirement, p_role_code)
  );
$$;


create temporary table auth_db_013_business_baseline (
  table_name text primary key,
  row_count bigint not null
) on commit drop;
insert into auth_db_013_business_baseline(table_name,row_count) values
  ('public.context_simulation_sessions',(select pg_catalog.count(*) from public.context_simulation_sessions)),
  ('public.app_permissions',(select pg_catalog.count(*) from public.app_permissions)),
  ('public.role_permissions',(select pg_catalog.count(*) from public.role_permissions)),
  ('public.employee_permissions',(select pg_catalog.count(*) from public.employee_permissions)),
  ('public.operational_role_permissions',(select pg_catalog.count(*) from public.operational_role_permissions)),
  ('public.role_capabilities',(select pg_catalog.count(*) from public.role_capabilities)),
  ('public.employee_shifts',(select pg_catalog.count(*) from public.employee_shifts)),
  ('public.attendance_logs',(select pg_catalog.count(*) from public.attendance_logs));

create temporary table auth_db_013_base_role_register(role_code text primary key) on commit drop;
insert into auth_db_013_base_role_register(role_code) values
  ('propietario'),('gerente_general'),('gerente'),('supervisor'),
  ('auxiliar_administrativa'),('contador'),('marketing'),('trabajador_operativo');

create temporary table auth_db_013_operational_role_register(role_code text primary key) on commit drop;
insert into auth_db_013_operational_role_register(role_code) values
  ('cajero_satelite'),('barista_satelite'),('cocinero_satelite'),('servicio_salon'),
  ('mostrador_satelite'),('operador_integral_satelite'),('produccion_cocina'),
  ('produccion_panaderia'),('produccion_reposteria'),('bodeguero'),
  ('conductor_logistica'),('gerencia_operativa');

create temporary table auth_db_013_shift_state_register(
  ordinal integer primary key,
  scenario_code text unique not null,
  shift_decision text not null,
  satisfies_t boolean not null
) on commit drop;
insert into auth_db_013_shift_state_register values
  (1,'NO_SHIFT','NO_SHIFT_ACCEPTED',false),
  (2,'HYPOTHETICAL_DRAFT','NOT_PUBLISHED',false),
  (3,'HYPOTHETICAL_PUBLISHED_FUTURE','PUBLISHED_NOT_CURRENT',false),
  (4,'HYPOTHETICAL_PUBLISHED_CURRENT_SCHEDULED','SIMULABLE_CONDITIONAL',true),
  (5,'HYPOTHETICAL_PUBLISHED_CURRENT_CONFIRMED','SIMULABLE_CONDITIONAL',true),
  (6,'HYPOTHETICAL_PUBLISHED_ENDED','PUBLISHED_NOT_CURRENT',false),
  (7,'HYPOTHETICAL_REST_CURRENT','NOT_LABORAL',false),
  (8,'HYPOTHETICAL_CANCELLED','TERMINAL_STATE',false),
  (9,'HYPOTHETICAL_NO_SHOW','TERMINAL_STATE',false),
  (10,'HYPOTHETICAL_COMPLETED','TERMINAL_STATE',false),
  (11,'HYPOTHETICAL_WITHDRAWN','WITHDRAWN',false),
  (12,'EXACT_VERSIONED_CURRENT','SIMULABLE_CONDITIONAL',true),
  (13,'EXACT_LEGACY_UNVERSIONED','INDETERMINATE_REPLAY',false),
  (14,'AMBIGUOUS_MULTIPLE_CANDIDATES','AMBIGUOUS',false),
  (15,'INVALID_CONTEXT_REFERENCE','DENY',false);

create temporary table auth_db_013_resource_mode_register(mode text primary key) on commit drop;
insert into auth_db_013_resource_mode_register(mode) values
  ('SYNTHETIC_RESOURCE'),('MASKED_REAL_RESOURCE'),('AUTHORIZED_REAL_REFERENCE'),('RESOURCE_DRAFT'),('UNRESOLVED');

create temporary table auth_db_013_checkin_state_register(state_code text primary key) on commit drop;
insert into auth_db_013_checkin_state_register(state_code) values
  ('NOT_APPLICABLE'),('ABSENT'),('ACTIVE_HYPOTHETICAL'),('CLOSED_HYPOTHETICAL'),('INVALID_HYPOTHETICAL');

create function pg_temp.auth_db_013_explain(p_sql text)
returns text
language plpgsql
volatile
as $auth_db_013_explain$
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
$auth_db_013_explain$;

create temporary table auth_db_013_expected_simulation_policy (
  permission_key text primary key,
  simulation_requirement text not null
) on commit drop;
insert into auth_db_013_expected_simulation_policy(permission_key, simulation_requirement) values
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
  ('viso.authorization.denials.revoke', 'DECISION_ONLY');

select plan(252);

-- 1
select has_table('audit','authorization_simulations','audit.authorization_simulations exists');

-- 2
select is((select pg_catalog.pg_get_userbyid(c.relowner) from pg_catalog.pg_class c where c.oid='audit.authorization_simulations'::regclass),'vento_authorization_owner','audit.authorization_simulations uses isolated authorization owner');

-- 3
select ok((select c.relrowsecurity and not c.relforcerowsecurity from pg_catalog.pg_class c where c.oid='audit.authorization_simulations'::regclass),'audit.authorization_simulations has RLS defense-in-depth without FORCE RLS');

-- 4
select has_table('audit','authorization_simulation_revisions','audit.authorization_simulation_revisions exists');

-- 5
select is((select pg_catalog.pg_get_userbyid(c.relowner) from pg_catalog.pg_class c where c.oid='audit.authorization_simulation_revisions'::regclass),'vento_authorization_owner','audit.authorization_simulation_revisions uses isolated authorization owner');

-- 6
select ok((select c.relrowsecurity and not c.relforcerowsecurity from pg_catalog.pg_class c where c.oid='audit.authorization_simulation_revisions'::regclass),'audit.authorization_simulation_revisions has RLS defense-in-depth without FORCE RLS');

-- 7
select has_table('audit','authorization_simulation_evaluations','audit.authorization_simulation_evaluations exists');

-- 8
select is((select pg_catalog.pg_get_userbyid(c.relowner) from pg_catalog.pg_class c where c.oid='audit.authorization_simulation_evaluations'::regclass),'vento_authorization_owner','audit.authorization_simulation_evaluations uses isolated authorization owner');

-- 9
select ok((select c.relrowsecurity and not c.relforcerowsecurity from pg_catalog.pg_class c where c.oid='audit.authorization_simulation_evaluations'::regclass),'audit.authorization_simulation_evaluations has RLS defense-in-depth without FORCE RLS');

-- 10
select has_table('audit','authorization_simulation_events','audit.authorization_simulation_events exists');

-- 11
select is((select pg_catalog.pg_get_userbyid(c.relowner) from pg_catalog.pg_class c where c.oid='audit.authorization_simulation_events'::regclass),'vento_authorization_owner','audit.authorization_simulation_events uses isolated authorization owner');

-- 12
select ok((select c.relrowsecurity and not c.relforcerowsecurity from pg_catalog.pg_class c where c.oid='audit.authorization_simulation_events'::regclass),'audit.authorization_simulation_events has RLS defense-in-depth without FORCE RLS');

-- 13
select has_table('audit','authorization_simulation_attempts','audit.authorization_simulation_attempts exists');

-- 14
select is((select pg_catalog.pg_get_userbyid(c.relowner) from pg_catalog.pg_class c where c.oid='audit.authorization_simulation_attempts'::regclass),'vento_authorization_owner','audit.authorization_simulation_attempts uses isolated authorization owner');

-- 15
select ok((select c.relrowsecurity and not c.relforcerowsecurity from pg_catalog.pg_class c where c.oid='audit.authorization_simulation_attempts'::regclass),'audit.authorization_simulation_attempts has RLS defense-in-depth without FORCE RLS');

-- 16
select has_table('audit','authorization_simulation_links','audit.authorization_simulation_links exists');

-- 17
select is((select pg_catalog.pg_get_userbyid(c.relowner) from pg_catalog.pg_class c where c.oid='audit.authorization_simulation_links'::regclass),'vento_authorization_owner','audit.authorization_simulation_links uses isolated authorization owner');

-- 18
select ok((select c.relrowsecurity and not c.relforcerowsecurity from pg_catalog.pg_class c where c.oid='audit.authorization_simulation_links'::regclass),'audit.authorization_simulation_links has RLS defense-in-depth without FORCE RLS');

-- 19
select has_table('audit','authorization_simulation_corrections','audit.authorization_simulation_corrections exists');

-- 20
select is((select pg_catalog.pg_get_userbyid(c.relowner) from pg_catalog.pg_class c where c.oid='audit.authorization_simulation_corrections'::regclass),'vento_authorization_owner','audit.authorization_simulation_corrections uses isolated authorization owner');

-- 21
select ok((select c.relrowsecurity and not c.relforcerowsecurity from pg_catalog.pg_class c where c.oid='audit.authorization_simulation_corrections'::regclass),'audit.authorization_simulation_corrections has RLS defense-in-depth without FORCE RLS');

-- 22
select is((select pg_catalog.count(*) from pg_catalog.pg_class c join pg_catalog.pg_namespace n on n.oid=c.relnamespace where n.nspname='audit' and c.relname like 'authorization_simulation%' and c.relkind in ('r','p')),7::bigint,'exactly seven AUTH-DB-013 audit tables exist');

-- 23
select is((select pg_catalog.count(*) from pg_catalog.pg_policies p where p.schemaname='audit' and p.tablename like 'authorization_simulation%'),0::bigint,'AUTH-DB-013 adds no client RLS policies');

-- 24
select ok(not exists(select 1 from pg_catalog.pg_constraint con join pg_catalog.pg_class c on c.oid=con.conrelid join pg_catalog.pg_namespace n on n.oid=c.relnamespace where n.nspname='audit' and c.relname like 'authorization_simulation%' and con.contype='f' and con.confdeltype='c'),'AUTH-DB-013 evidence has no ON DELETE CASCADE foreign keys');

-- 25
select ok(exists(select 1 from pg_catalog.pg_index i where i.indexrelid='audit.uq_authorization_simulation_terminal_event'::regclass),'terminal lifecycle has one-simulation partial uniqueness guard');

-- 26
select ok(pg_catalog.to_regprocedure('app_private.canonicalize_authorization_simulation(jsonb)') is not null,'app_private.canonicalize_authorization_simulation(jsonb) exists');

-- 27
select ok(pg_catalog.to_regprocedure('app_private.fingerprint_authorization_simulation(jsonb)') is not null,'app_private.fingerprint_authorization_simulation(jsonb) exists');

-- 28
select ok(pg_catalog.to_regprocedure('app_private.derive_authorization_simulation_status(uuid)') is not null,'app_private.derive_authorization_simulation_status(uuid) exists');

-- 29
select ok(pg_catalog.to_regprocedure('app_private.append_authorization_simulation(jsonb)') is not null,'app_private.append_authorization_simulation(jsonb) exists');

-- 30
select ok(pg_catalog.to_regprocedure('app_private.append_authorization_simulation_revision(jsonb)') is not null,'app_private.append_authorization_simulation_revision(jsonb) exists');

-- 31
select ok(pg_catalog.to_regprocedure('app_private.append_authorization_simulation_evaluation(jsonb)') is not null,'app_private.append_authorization_simulation_evaluation(jsonb) exists');

-- 32
select ok(pg_catalog.to_regprocedure('app_private.append_authorization_simulation_event(jsonb)') is not null,'app_private.append_authorization_simulation_event(jsonb) exists');

-- 33
select ok(pg_catalog.to_regprocedure('app_private.append_authorization_simulation_attempt(jsonb)') is not null,'app_private.append_authorization_simulation_attempt(jsonb) exists');

-- 34
select ok(pg_catalog.to_regprocedure('app_private.link_authorization_simulation_evidence(jsonb)') is not null,'app_private.link_authorization_simulation_evidence(jsonb) exists');

-- 35
select ok(pg_catalog.to_regprocedure('app_private.correct_authorization_simulation_audit(jsonb)') is not null,'app_private.correct_authorization_simulation_audit(jsonb) exists');

-- 36
select ok(pg_catalog.to_regprocedure('app_private.reject_authorization_simulation_audit_mutation()') is not null,'app_private.reject_authorization_simulation_audit_mutation() exists');

-- 37
select is((select pg_catalog.count(*) from pg_catalog.pg_proc p join pg_catalog.pg_namespace n on n.oid=p.pronamespace where n.nspname='app_private' and p.proname in ('canonicalize_authorization_simulation','fingerprint_authorization_simulation','derive_authorization_simulation_status','append_authorization_simulation','append_authorization_simulation_revision','append_authorization_simulation_evaluation','append_authorization_simulation_event','append_authorization_simulation_attempt','link_authorization_simulation_evidence','correct_authorization_simulation_audit','reject_authorization_simulation_audit_mutation')),11::bigint,'exactly eleven AUTH-DB-013 private technical functions exist');

-- 38
select is((select pg_catalog.count(*) from pg_catalog.pg_proc p join pg_catalog.pg_namespace n on n.oid=p.pronamespace where n.nspname='app_private' and p.proname in ('append_authorization_simulation','append_authorization_simulation_revision','append_authorization_simulation_evaluation','append_authorization_simulation_event','append_authorization_simulation_attempt','link_authorization_simulation_evidence','correct_authorization_simulation_audit') and p.prosecdef),7::bigint,'exactly seven AUTH-DB-013 functions are SECURITY DEFINER');

-- 39
select is((select pg_catalog.count(*) from pg_catalog.pg_proc p join pg_catalog.pg_namespace n on n.oid=p.pronamespace where n.nspname='app_private' and p.proname in ('canonicalize_authorization_simulation','fingerprint_authorization_simulation','derive_authorization_simulation_status','reject_authorization_simulation_audit_mutation') and not p.prosecdef),4::bigint,'canonicalizer fingerprint status derivation and mutation rejection stay SECURITY INVOKER');

-- 40
select is((select pg_catalog.count(*) from pg_catalog.pg_proc p join pg_catalog.pg_namespace n on n.oid=p.pronamespace where n.nspname='app_private' and p.proname in ('append_authorization_simulation','append_authorization_simulation_revision','append_authorization_simulation_evaluation','append_authorization_simulation_event','append_authorization_simulation_attempt','link_authorization_simulation_evidence','correct_authorization_simulation_audit') and coalesce(pg_catalog.array_to_string(p.proconfig,','),'')='search_path=pg_catalog, audit, app_private, extensions'),7::bigint,'all privileged AUTH-DB-013 functions use the fixed hardened search_path');

-- 41
select is((select pg_catalog.count(*) from pg_catalog.pg_proc p join pg_catalog.pg_namespace n on n.oid=p.pronamespace where n.nspname='app_private' and p.proname like '%authorization_simulation%' and pg_catalog.pg_get_userbyid(p.proowner)='vento_authorization_owner'),11::bigint,'all AUTH-DB-013 functions use the isolated authorization owner');

-- 42
select ok(not exists(select 1 from pg_catalog.pg_class c join pg_catalog.pg_namespace n on n.oid=c.relnamespace where n.nspname='audit' and c.relname like 'authorization_simulation%' and c.relkind in ('r','p') and (pg_catalog.has_table_privilege('anon',c.oid,'SELECT') or pg_catalog.has_table_privilege('anon',c.oid,'INSERT') or pg_catalog.has_table_privilege('anon',c.oid,'UPDATE') or pg_catalog.has_table_privilege('anon',c.oid,'DELETE') or pg_catalog.has_table_privilege('anon',c.oid,'TRUNCATE'))),'anon has zero direct DML/SELECT/TRUNCATE on AUTH-DB-013 audit tables');

-- 43
select ok(not exists(select 1 from pg_catalog.pg_proc p join pg_catalog.pg_namespace n on n.oid=p.pronamespace where n.nspname='app_private' and p.proname like '%authorization_simulation%' and pg_catalog.has_function_privilege('anon',p.oid,'EXECUTE')),'anon has zero EXECUTE on AUTH-DB-013 private functions');

-- 44
select ok(not exists(select 1 from pg_catalog.pg_class c join pg_catalog.pg_namespace n on n.oid=c.relnamespace where n.nspname='audit' and c.relname like 'authorization_simulation%' and c.relkind in ('r','p') and (pg_catalog.has_table_privilege('authenticated',c.oid,'SELECT') or pg_catalog.has_table_privilege('authenticated',c.oid,'INSERT') or pg_catalog.has_table_privilege('authenticated',c.oid,'UPDATE') or pg_catalog.has_table_privilege('authenticated',c.oid,'DELETE') or pg_catalog.has_table_privilege('authenticated',c.oid,'TRUNCATE'))),'authenticated has zero direct DML/SELECT/TRUNCATE on AUTH-DB-013 audit tables');

-- 45
select ok(not exists(select 1 from pg_catalog.pg_proc p join pg_catalog.pg_namespace n on n.oid=p.pronamespace where n.nspname='app_private' and p.proname like '%authorization_simulation%' and pg_catalog.has_function_privilege('authenticated',p.oid,'EXECUTE')),'authenticated has zero EXECUTE on AUTH-DB-013 private functions');

-- 46
select ok(not exists(select 1 from pg_catalog.pg_class c join pg_catalog.pg_namespace n on n.oid=c.relnamespace where n.nspname='audit' and c.relname like 'authorization_simulation%' and c.relkind in ('r','p') and (pg_catalog.has_table_privilege('service_role',c.oid,'SELECT') or pg_catalog.has_table_privilege('service_role',c.oid,'INSERT') or pg_catalog.has_table_privilege('service_role',c.oid,'UPDATE') or pg_catalog.has_table_privilege('service_role',c.oid,'DELETE') or pg_catalog.has_table_privilege('service_role',c.oid,'TRUNCATE'))),'service_role has zero direct DML/SELECT/TRUNCATE on AUTH-DB-013 audit tables');

-- 47
select ok(not exists(select 1 from pg_catalog.pg_proc p join pg_catalog.pg_namespace n on n.oid=p.pronamespace where n.nspname='app_private' and p.proname like '%authorization_simulation%' and pg_catalog.has_function_privilege('service_role',p.oid,'EXECUTE')),'service_role has zero EXECUTE on AUTH-DB-013 private functions');

-- 48
select is((select pg_catalog.count(*) from pg_catalog.pg_proc p join pg_catalog.pg_namespace n on n.oid=p.pronamespace where n.nspname in ('public','api') and p.proname like '%authorization_simulation%'),0::bigint,'AUTH-DB-013 creates no public or api simulation surface');

-- 49
set local role vento_authorization_owner; select is(app_private.canonicalize_authorization_simulation('{"b":2,"a":1}'::jsonb),app_private.canonicalize_authorization_simulation('{"a":1,"b":2}'::jsonb),'canonical JSON is independent of input key order'); reset role;

-- 50
set local role vento_authorization_owner; select ok(app_private.fingerprint_authorization_simulation('{"a":1}'::jsonb) ~ '^sha256:[0-9a-f]{64}$','simulation fingerprint uses sha256 canonical format'); reset role;

-- 51
set local role vento_authorization_owner; select is(app_private.fingerprint_authorization_simulation('{"b":2,"a":1}'::jsonb),app_private.fingerprint_authorization_simulation('{"a":1,"b":2}'::jsonb),'semantically equal JSON has stable simulation fingerprint'); reset role;


create temporary table auth_db_013_root_result on commit drop as
select app_private.append_authorization_simulation(pg_temp.auth_db_013_create_payload('CREATE-013-001')) as result;

-- 52
select ok((select (result ->> 'simulation_id')::uuid is not null from auth_db_013_root_result),'root append returns server-generated simulation_id');

-- 53
select ok((select (result ->> 'simulation_revision_id')::uuid is not null from auth_db_013_root_result),'root append returns server-generated initial revision id');

-- 54
select is((select result ->> 'status' from auth_db_013_root_result),'DRAFT','new simulation starts DRAFT');

-- 55
select is((select result ->> 'executable' from auth_db_013_root_result),'false','root result is explicitly non-executable');

-- 56
select is((select pg_catalog.count(*) from audit.authorization_simulations),1::bigint,'root append persists exactly one simulation');

-- 57
select is((select pg_catalog.count(*) from audit.authorization_simulation_revisions),1::bigint,'root append persists revision 1');

-- 58
select is((select revision_number from audit.authorization_simulation_revisions limit 1),1,'initial revision number is one');

-- 59
select is((select pg_catalog.count(*) from audit.authorization_simulation_events where event_type='SIMULATION_CREATED'),1::bigint,'root append persists SIMULATION_CREATED');

-- 60
select is((select pg_catalog.count(*) from audit.authorization_simulation_links),4::bigint,'root append links decision context session and device without duplicating payload');

-- 61
select is((select real_actor_id from audit.authorization_simulations limit 1),'AUTH-DB-013-ACTOR-1','real actor comes from real AuthorizationDecision');

-- 62
select is((select real_employee_id from audit.authorization_simulations limit 1),'AUTH-DB-013-ACTOR-1','real employee attribution stays separate from simulated subject');

-- 63
select is((select requester_authorization_decision_id from audit.authorization_simulations limit 1),'01300000-0000-4000-8000-000000000001','root preserves requester AuthorizationDecision');

-- 64
select is((select contract_name from audit.authorization_simulations limit 1),'SimulationContext','root records SimulationContext contract identity');

-- 65
select is((select contract_version from audit.authorization_simulations limit 1),'1.0.0','root records SimulationContext version');

-- 66
select is((select pg_catalog.count(*) from information_schema.columns where table_schema='audit' and table_name='authorization_simulations' and column_name='sensitivity_class'),0::bigint,'AUTH-DB-013 does not invent a sensitivity_class column outside its contract');

-- 67
select is((select pg_catalog.count(*) from information_schema.columns where table_schema='audit' and table_name='authorization_simulations' and column_name='retention_class'),0::bigint,'AUTH-DB-013 does not invent retention_class; retention remains owned by transversal archival policy');

-- 68
select ok((select root_fingerprint ~ '^sha256:[0-9a-f]{64}$' from audit.authorization_simulations limit 1),'root fingerprint is canonical sha256');

-- 69
select ok((select scenario_fingerprint ~ '^sha256:[0-9a-f]{64}$' from audit.authorization_simulation_revisions limit 1),'scenario fingerprint is canonical sha256');

-- 70
select is((select simulated_role ->> 'role_kind' from audit.authorization_simulation_revisions limit 1),'BASE','typed simulated role preserves role_kind');

-- 71
select is((select simulated_role ->> 'role_code' from audit.authorization_simulation_revisions limit 1),'bodeguero','typed simulated role preserves exact role_code');

-- 72
select is((select simulated_site ->> 'simulated_site_code' from audit.authorization_simulation_revisions limit 1),'CP','simulated site remains exact scenario identity');

-- 73
select is((select simulated_area ->> 'area_code' from audit.authorization_simulation_revisions limit 1),'BODEGA','simulated area remains exact scenario identity');

-- 74
select is((select simulated_resource ->> 'mode' from audit.authorization_simulation_revisions limit 1),'SYNTHETIC_RESOURCE','resource scenario preserves approved mode');

-- 75
select is(app_private.derive_authorization_simulation_status((select (result ->> 'simulation_id')::uuid from auth_db_013_root_result)),'DRAFT','derived status is DRAFT before activation');

-- 76
select is((app_private.append_authorization_simulation(pg_temp.auth_db_013_create_payload('CREATE-013-001')) ->> 'idempotent'),'true','exact creation retry is idempotent');

-- 77
select is((select pg_catalog.count(*) from audit.authorization_simulations),1::bigint,'idempotent creation retry creates no second simulation');

-- 78
select throws_ok($$select app_private.append_authorization_simulation(pg_temp.auth_db_013_create_payload('CREATE-013-001','DIFFERENT_PURPOSE'))$$,'23505','AUTH_DB_013_IDEMPOTENCY_CONFLICT','same creation idempotency key with different semantics conflicts');

-- 79
select throws_ok($$select app_private.append_authorization_simulation(pg_temp.auth_db_013_create_payload('CREATE-013-SECRET') || jsonb_build_object('password','secret'))$$,'22023','AUTH_DB_013_SIMULATION_PAYLOAD_FORBIDDEN_OR_TOO_LARGE','secret-bearing simulation payload is rejected');

-- 80
select throws_ok($$select app_private.append_authorization_simulation(jsonb_set(pg_temp.auth_db_013_create_payload('CREATE-013-BADCTX'),'{real_access_context_fingerprint}','"sha256:deadbeef"'))$$,'22023','AUTH_DB_013_SIMULATION_IDENTITY_INVALID','invalid real context fingerprint is rejected');

-- 81
select throws_ok($$select app_private.append_authorization_simulation(jsonb_set(pg_temp.auth_db_013_create_payload('CREATE-013-BADREQ'),'{scenario,policy_snapshot,simulation_requirement}','"UNKNOWN"'))$$,'22023','AUTH_DB_013_SIMULATION_REQUIREMENT_INVALID','unknown simulation_requirement fails closed');


create temporary table auth_db_013_activation_result on commit drop as
select app_private.append_authorization_simulation_event(pg_catalog.jsonb_build_object(
  'simulation_id', (select result ->> 'simulation_id' from auth_db_013_root_result),
  'event_type', 'SIMULATION_ACTIVATED',
  'operation_id', 'ACTIVATE-013-001',
  'authorization_decision_id', '01300000-0000-4000-8000-000000000001',
  'reason_code', 'SIMULATION_ACTIVATED'
)) as result;

-- 82
select is((select result ->> 'status' from auth_db_013_activation_result),'ACTIVE','activation transitions DRAFT to ACTIVE');

-- 83
select is(app_private.derive_authorization_simulation_status((select (result ->> 'simulation_id')::uuid from auth_db_013_root_result)),'ACTIVE','derived status is ACTIVE after activation');

-- 84
select is((app_private.append_authorization_simulation_event(pg_catalog.jsonb_build_object('simulation_id',(select result ->> 'simulation_id' from auth_db_013_root_result),'event_type','SIMULATION_ACTIVATED','operation_id','ACTIVATE-013-001','authorization_decision_id','01300000-0000-4000-8000-000000000001','reason_code','SIMULATION_ACTIVATED')) ->> 'idempotent'),'true','same activation operation is idempotent');

-- 85
select throws_ok($$select app_private.append_authorization_simulation_event(pg_catalog.jsonb_build_object('simulation_id',(select result ->> 'simulation_id' from auth_db_013_root_result),'event_type','SIMULATION_ACTIVATED','operation_id','ACTIVATE-013-002','authorization_decision_id','01300000-0000-4000-8000-000000000001','reason_code','SIMULATION_ACTIVATED'))$$,'55000','AUTH_DB_013_ACTIVATION_TRANSITION_INVALID','second activation with new operation is rejected');


create temporary table auth_db_013_eval_result on commit drop as
select app_private.append_authorization_simulation_evaluation(pg_catalog.jsonb_build_object(
  'simulation_id', (select result ->> 'simulation_id' from auth_db_013_root_result),
  'simulation_revision_id', (select result ->> 'simulation_revision_id' from auth_db_013_root_result),
  'authorization_decision_id', '01300000-0000-4000-8000-000000000001',
  'evaluation_request_id', 'EVAL-013-001',
  'app_code', 'NEXO',
  'permission_key', 'nexo.inventory.stock.view',
  'simulation_requirement', 'FULL_PREVIEW',
  'resource_scenario_id', 'SYNTHETIC-RESOURCE-013',
  'hypothetical_context_id', 'SIM-CONTEXT-013-001',
  'outcome', 'WOULD_ALLOW',
  'reason_codes', pg_catalog.jsonb_build_array('SIMULATED_GRANT_MATCH'),
  'authorization_contract_version', '1.0.0',
  'catalog_version', 'PERM-CAT-1.0.0',
  'source_versions', pg_catalog.jsonb_build_object('permission_catalog','PERM-CAT-1.0.0'),
  'source_fingerprints', pg_catalog.jsonb_build_object('permission_catalog','sha256:' || repeat('9',64)),
  'request', pg_catalog.jsonb_build_object('resource_mode','SYNTHETIC_RESOURCE','operation','READ')
)) as result;

-- 86
select is((select result ->> 'outcome' from auth_db_013_eval_result),'WOULD_ALLOW','simulated outcome persists as WOULD_ALLOW');

-- 87
select is((select result ->> 'executable' from auth_db_013_eval_result),'false','simulated evaluation result is never executable');

-- 88
select ok((select not executable from audit.authorization_simulation_evaluations limit 1),'physical evaluation row enforces executable=false');

-- 89
select is((select outcome from audit.authorization_simulation_evaluations limit 1),'WOULD_ALLOW','audit stores simulated outcome separately from real AuthorizationDecision');

-- 90
select is((select pg_catalog.count(*) from audit.authorization_decisions where decision_id=(select requester_authorization_decision_id from audit.authorization_simulation_evaluations limit 1)),1::bigint,'evaluation links a real requester AuthorizationDecision without converting itself into one');

-- 91
select is((select pg_catalog.count(*) from audit.authorization_simulation_events where event_type='SIMULATION_EVALUATED'),1::bigint,'evaluation emits append-only SIMULATION_EVALUATED evidence');

-- 92
select is((select pg_catalog.count(*) from audit.authorization_simulation_links where link_kind='SIMULATED_EVALUATION'),1::bigint,'evaluation receives explicit simulated-evaluation provenance link');

-- 93
select is((app_private.append_authorization_simulation_evaluation(pg_catalog.jsonb_build_object('simulation_id',(select result ->> 'simulation_id' from auth_db_013_root_result),'simulation_revision_id',(select result ->> 'simulation_revision_id' from auth_db_013_root_result),'authorization_decision_id','01300000-0000-4000-8000-000000000001','evaluation_request_id','EVAL-013-001','app_code','NEXO','permission_key','nexo.inventory.stock.view','simulation_requirement','FULL_PREVIEW','resource_scenario_id','SYNTHETIC-RESOURCE-013','hypothetical_context_id','SIM-CONTEXT-013-001','outcome','WOULD_ALLOW','reason_codes',jsonb_build_array('SIMULATED_GRANT_MATCH'),'authorization_contract_version','1.0.0','catalog_version','PERM-CAT-1.0.0','source_versions',jsonb_build_object('permission_catalog','PERM-CAT-1.0.0'),'source_fingerprints',jsonb_build_object('permission_catalog','sha256:' || repeat('9',64)),'request',jsonb_build_object('resource_mode','SYNTHETIC_RESOURCE','operation','READ'))) ->> 'idempotent'),'true','exact evaluation retry is idempotent');

-- 94
select throws_ok($$select app_private.append_authorization_simulation_evaluation(pg_catalog.jsonb_build_object('simulation_id',(select result ->> 'simulation_id' from auth_db_013_root_result),'simulation_revision_id',(select result ->> 'simulation_revision_id' from auth_db_013_root_result),'authorization_decision_id','01300000-0000-4000-8000-000000000001','evaluation_request_id','EVAL-013-BAD-OUTCOME','app_code','NEXO','permission_key','nexo.inventory.stock.view','simulation_requirement','FULL_PREVIEW','hypothetical_context_id','SIM-CONTEXT-013-002','outcome','ALLOW','reason_codes',jsonb_build_array('BAD'),'authorization_contract_version','1.0.0','catalog_version','PERM-CAT-1.0.0','source_versions','{}'::jsonb,'source_fingerprints','{}'::jsonb,'request','{}'::jsonb))$$,'22023','AUTH_DB_013_EVALUATION_IDENTITY_INVALID','real ALLOW outcome cannot be persisted as simulated evaluation');

-- 95
select throws_ok($$select app_private.append_authorization_simulation_evaluation(pg_catalog.jsonb_build_object('simulation_id',(select result ->> 'simulation_id' from auth_db_013_root_result),'simulation_revision_id',(select result ->> 'simulation_revision_id' from auth_db_013_root_result),'authorization_decision_id','01300000-0000-4000-8000-000000000001','evaluation_request_id','EVAL-013-BAD-EXEC','app_code','NEXO','permission_key','nexo.inventory.stock.view','simulation_requirement','FULL_PREVIEW','hypothetical_context_id','SIM-CONTEXT-013-003','outcome','WOULD_ALLOW','reason_codes',jsonb_build_array('BAD'),'authorization_contract_version','1.0.0','catalog_version','PERM-CAT-1.0.0','source_versions','{}'::jsonb,'source_fingerprints','{}'::jsonb,'request','{}'::jsonb,'executable',true))$$,'22023','AUTH_DB_013_EVALUATION_ENVELOPE_INVALID','caller cannot submit executable=true');

-- 96
select throws_ok($$select app_private.append_authorization_simulation_evaluation(pg_catalog.jsonb_build_object('simulation_id',(select result ->> 'simulation_id' from auth_db_013_root_result),'simulation_revision_id',(select result ->> 'simulation_revision_id' from auth_db_013_root_result),'authorization_decision_id','01300000-0000-4000-8000-000000000001','evaluation_request_id','EVAL-013-NOT-ALLOWED','app_code','VISO','permission_key','viso.authorization.context_simulations.view','simulation_requirement','NOT_ALLOWED','hypothetical_context_id','SIM-CONTEXT-013-004','outcome','WOULD_ALLOW','reason_codes',jsonb_build_array('BAD'),'authorization_contract_version','1.0.0','catalog_version','PERM-CAT-1.0.0','source_versions','{}'::jsonb,'source_fingerprints','{}'::jsonb,'request','{}'::jsonb))$$,'42501','AUTH_DB_013_EVALUATION_NOT_ALLOWED','simulator administration permission cannot auto-simulate itself');


create temporary table auth_db_013_revision_result on commit drop as
select app_private.append_authorization_simulation_revision(pg_catalog.jsonb_build_object(
  'simulation_id', (select result ->> 'simulation_id' from auth_db_013_root_result),
  'base_revision_number', 1,
  'authorization_decision_id', '01300000-0000-4000-8000-000000000001',
  'reason_code', 'SCENARIO_CHANGED',
  'scenario', pg_temp.auth_db_013_scenario('FULL_PREVIEW','gerente')
)) as result;

-- 97
select is((select (result ->> 'revision_number')::integer from auth_db_013_revision_result),2,'revision append advances revision_number contiguously');

-- 98
select is((select simulated_role ->> 'role_code' from audit.authorization_simulation_revisions where revision_number=2),'gerente','new revision stores changed typed role without rewriting revision 1');

-- 99
select is((select simulated_role ->> 'role_code' from audit.authorization_simulation_revisions where revision_number=1),'bodeguero','revision 1 remains immutable after revision 2');

-- 100
select is(app_private.derive_authorization_simulation_status((select (result ->> 'simulation_id')::uuid from auth_db_013_root_result)),'ACTIVE','revision does not collapse active lifecycle');

-- 101
select throws_ok($$select app_private.append_authorization_simulation_revision(pg_catalog.jsonb_build_object('simulation_id',(select result ->> 'simulation_id' from auth_db_013_root_result),'base_revision_number',1,'authorization_decision_id','01300000-0000-4000-8000-000000000001','reason_code','STALE_REVISION','scenario',pg_temp.auth_db_013_scenario()))$$,'40001','AUTH_DB_013_REVISION_CONFLICT','stale revision base produces conflict instead of last-write-wins');

-- 102
select throws_ok($$select app_private.append_authorization_simulation_evaluation(pg_catalog.jsonb_build_object('simulation_id',(select result ->> 'simulation_id' from auth_db_013_root_result),'simulation_revision_id',(select result ->> 'simulation_revision_id' from auth_db_013_root_result),'authorization_decision_id','01300000-0000-4000-8000-000000000001','evaluation_request_id','EVAL-013-STALE','app_code','NEXO','permission_key','nexo.inventory.stock.view','simulation_requirement','FULL_PREVIEW','hypothetical_context_id','SIM-CONTEXT-STALE','outcome','WOULD_DENY','reason_codes',jsonb_build_array('STALE'),'authorization_contract_version','1.0.0','catalog_version','PERM-CAT-1.0.0','source_versions','{}'::jsonb,'source_fingerprints','{}'::jsonb,'request','{}'::jsonb))$$,'40001','AUTH_DB_013_EVALUATION_REVISION_STALE','evaluation cannot commit against stale revision');


create temporary table auth_db_013_eval2_result on commit drop as
select app_private.append_authorization_simulation_evaluation(pg_catalog.jsonb_build_object(
  'simulation_id', (select result ->> 'simulation_id' from auth_db_013_root_result),
  'simulation_revision_id', (select result ->> 'simulation_revision_id' from auth_db_013_revision_result),
  'authorization_decision_id', '01300000-0000-4000-8000-000000000001',
  'evaluation_request_id', 'EVAL-013-002', 'app_code', 'NEXO', 'permission_key', 'nexo.inventory.stock.view',
  'simulation_requirement', 'FULL_PREVIEW', 'hypothetical_context_id', 'SIM-CONTEXT-013-REV2',
  'outcome', 'INDETERMINATE', 'reason_codes', pg_catalog.jsonb_build_array('SOURCE_CHANGED'),
  'authorization_contract_version', '1.0.0', 'catalog_version', 'PERM-CAT-1.0.0',
  'source_versions', pg_catalog.jsonb_build_object('permission_catalog','PERM-CAT-1.0.0'),
  'source_fingerprints', pg_catalog.jsonb_build_object('permission_catalog','sha256:' || repeat('9',64)),
  'request', pg_catalog.jsonb_build_object('operation','READ')
)) as result;

-- 103
select is((select result ->> 'outcome' from auth_db_013_eval2_result),'INDETERMINATE','INDETERMINATE is preserved as a simulated outcome');

-- 104
select is((select pg_catalog.count(*) from audit.authorization_simulation_evaluations),2::bigint,'two evaluations persist against their exact revisions');


create temporary table auth_db_013_link_result on commit drop as
select app_private.link_authorization_simulation_evidence(pg_catalog.jsonb_build_object(
  'simulation_id', (select result ->> 'simulation_id' from auth_db_013_root_result),
  'simulation_revision_id', (select result ->> 'simulation_revision_id' from auth_db_013_revision_result),
  'link_kind', 'EVIDENCE_REFERENCE', 'reference_type', 'CaseFile', 'reference_id', 'CASE-013-001',
  'correlation_id', 'AUTH-DB-013-CORR-ALLOW'
)) as result;

-- 105
select ok((select (result ->> 'simulation_link_id')::uuid is not null from auth_db_013_link_result),'evidence link receives stable server-generated identity');

-- 106
select is((app_private.link_authorization_simulation_evidence(pg_catalog.jsonb_build_object('simulation_id',(select result ->> 'simulation_id' from auth_db_013_root_result),'simulation_revision_id',(select result ->> 'simulation_revision_id' from auth_db_013_revision_result),'link_kind','EVIDENCE_REFERENCE','reference_type','CaseFile','reference_id','CASE-013-001','correlation_id','AUTH-DB-013-CORR-ALLOW')) ->> 'idempotent'),'true','exact evidence link retry is idempotent');


create temporary table auth_db_013_correction_result on commit drop as
select app_private.correct_authorization_simulation_audit(pg_catalog.jsonb_build_object(
  'simulation_id', (select result ->> 'simulation_id' from auth_db_013_root_result),
  'target_kind', 'EVALUATION', 'target_id', (select result ->> 'simulated_decision_id' from auth_db_013_eval2_result),
  'reason_code', 'AUDIT_CLARIFICATION', 'authorization_decision_id', '01300000-0000-4000-8000-000000000001',
  'correction_payload', pg_catalog.jsonb_build_object('schema_version','1.0.0','correction_kind','CLARIFICATION','clarification','source label clarified'),
  'correlation_id', 'AUTH-DB-013-CORR-ALLOW'
)) as result;

-- 107
select ok((select (result ->> 'correction_id')::uuid is not null from auth_db_013_correction_result),'correction creates a new correction identity');

-- 108
select is((select pg_catalog.count(*) from audit.authorization_simulation_corrections),1::bigint,'correction is append-only new evidence');

-- 109
select is((select pg_catalog.count(*) from audit.authorization_simulation_events where event_type='SIMULATION_CORRECTION_LINKED'),1::bigint,'correction creates SIMULATION_CORRECTION_LINKED event');

-- 110
select is((select outcome from audit.authorization_simulation_evaluations where simulated_decision_id=(select (result ->> 'simulated_decision_id')::uuid from auth_db_013_eval2_result)),'INDETERMINATE','correction does not rewrite historical simulated outcome');

-- 111
select throws_ok($$select app_private.correct_authorization_simulation_audit(pg_catalog.jsonb_build_object('simulation_id',(select result ->> 'simulation_id' from auth_db_013_root_result),'target_kind','EVALUATION','target_id',(select result ->> 'simulated_decision_id' from auth_db_013_eval2_result),'reason_code','BAD_CORRECTION','authorization_decision_id','01300000-0000-4000-8000-000000000001','correction_payload',jsonb_build_object('schema_version','1.0.0','outcome','WOULD_ALLOW')))$$,'22023','AUTH_DB_013_CORRECTION_IDENTITY_INVALID','correction payload cannot carry outcome mutation');


create temporary table auth_db_013_denied_attempt on commit drop as
select app_private.append_authorization_simulation_attempt(pg_catalog.jsonb_build_object(
  'authorization_decision_id','01300000-0000-4000-8000-000000000002',
  'operation_kind','CREATE_SIMULATION','attempt_result','DENIED','reason_code','REQUESTER_DENIED',
  'real_session_reference','SESSION-AUTH-DB-013-DENY','request',jsonb_build_object('purpose','ACCESS_REVIEW'),
  'source_versions',jsonb_build_object('authorization_contract','1.0.0'),
  'source_fingerprints',jsonb_build_object('authorization_contract','sha256:' || repeat('d',64))
)) as result;

create temporary table auth_db_013_technical_attempt on commit drop as
select app_private.append_authorization_simulation_attempt(pg_catalog.jsonb_build_object(
  'operation_kind','EVALUATE_SIMULATION','attempt_result','TECHNICAL_FAILURE','reason_code','SOURCE_UNAVAILABLE',
  'error_class','DEPENDENCY_UNAVAILABLE','correlation_id','AUTH-DB-013-TECH-FAIL',
  'request',jsonb_build_object('operation','READ'),'source_versions','{}'::jsonb,'source_fingerprints','{}'::jsonb
)) as result;

-- 112
select is((select result ->> 'attempt_result' from auth_db_013_denied_attempt),'DENIED','denied simulator administration is stored as attempt, not fake simulation');

-- 113
select is((select pg_catalog.count(*) from audit.authorization_simulations),1::bigint,'denied attempt creates no fictitious simulation');

-- 114
select is((select authorization_decision_id from audit.authorization_simulation_attempts where attempt_result='DENIED'),'01300000-0000-4000-8000-000000000002','DENIED attempt links real DENY AuthorizationDecision');

-- 115
select is((select result ->> 'attempt_result' from auth_db_013_technical_attempt),'TECHNICAL_FAILURE','technical failure remains distinct from policy deny');

-- 116
select is((select error_class from audit.authorization_simulation_attempts where attempt_result='TECHNICAL_FAILURE'),'DEPENDENCY_UNAVAILABLE','technical failure preserves error class');

-- 117
select throws_ok($$select app_private.append_authorization_simulation_attempt(jsonb_build_object('operation_kind','EVALUATE_SIMULATION','attempt_result','TECHNICAL_FAILURE','reason_code','SOURCE_UNAVAILABLE','correlation_id','TECH-NO-ERR','request','{}'::jsonb,'source_versions','{}'::jsonb,'source_fingerprints','{}'::jsonb))$$,'22023','AUTH_DB_013_ATTEMPT_IDENTITY_INVALID','TECHNICAL_FAILURE requires error_class');

-- 118
select throws_ok($$select app_private.append_authorization_simulation_attempt(jsonb_build_object('operation_kind','CREATE_SIMULATION','attempt_result','DENIED','reason_code','REQUESTER_DENIED','correlation_id','DENY-NO-DECISION','request','{}'::jsonb,'source_versions','{}'::jsonb,'source_fingerprints','{}'::jsonb))$$,'22023','AUTH_DB_013_DENIED_ATTEMPT_REQUIRES_DECISION','DENIED attempt requires a real deny decision');


create temporary table auth_db_013_complete_result on commit drop as
select app_private.append_authorization_simulation_event(pg_catalog.jsonb_build_object(
  'simulation_id',(select result ->> 'simulation_id' from auth_db_013_root_result),
  'event_type','SIMULATION_COMPLETED','operation_id','COMPLETE-013-001',
  'authorization_decision_id','01300000-0000-4000-8000-000000000001','reason_code','SIMULATION_COMPLETED'
)) as result;

-- 119
select is((select result ->> 'status' from auth_db_013_complete_result),'COMPLETED','completion transitions ACTIVE to COMPLETED');

-- 120
select is(app_private.derive_authorization_simulation_status((select (result ->> 'simulation_id')::uuid from auth_db_013_root_result)),'COMPLETED','derived status remains terminal COMPLETED');

-- 121
select throws_ok($$select app_private.append_authorization_simulation_event(jsonb_build_object('simulation_id',(select result ->> 'simulation_id' from auth_db_013_root_result),'event_type','SIMULATION_REVOKED','operation_id','REVOKE-AFTER-COMPLETE','authorization_decision_id','01300000-0000-4000-8000-000000000001','reason_code','REVOKE'))$$,'55000','AUTH_DB_013_TERMINAL_TRANSITION_INVALID','terminal simulation cannot move to incompatible terminal state');

-- 122
select throws_ok($$select app_private.append_authorization_simulation_event(jsonb_build_object('simulation_id',(select result ->> 'simulation_id' from auth_db_013_root_result),'event_type','SIMULATION_ACTIVATED','operation_id','REACTIVATE-AFTER-COMPLETE','authorization_decision_id','01300000-0000-4000-8000-000000000001','reason_code','REACTIVATE'))$$,'55000','AUTH_DB_013_ACTIVATION_TRANSITION_INVALID','terminal simulation cannot reactivate');

-- 123
select throws_ok($$select app_private.append_authorization_simulation_revision(jsonb_build_object('simulation_id',(select result ->> 'simulation_id' from auth_db_013_root_result),'base_revision_number',2,'authorization_decision_id','01300000-0000-4000-8000-000000000001','reason_code','POST_TERMINAL_REVISION','scenario',pg_temp.auth_db_013_scenario()))$$,'55000','AUTH_DB_013_REVISION_TERMINAL_FORBIDDEN','terminal simulation cannot create revisions');

-- 124
select throws_ok($$select app_private.append_authorization_simulation_evaluation(jsonb_build_object('simulation_id',(select result ->> 'simulation_id' from auth_db_013_root_result),'simulation_revision_id',(select result ->> 'simulation_revision_id' from auth_db_013_revision_result),'authorization_decision_id','01300000-0000-4000-8000-000000000001','evaluation_request_id','EVAL-AFTER-COMPLETE','app_code','NEXO','permission_key','nexo.inventory.stock.view','simulation_requirement','FULL_PREVIEW','hypothetical_context_id','SIM-CONTEXT-END','outcome','WOULD_DENY','reason_codes',jsonb_build_array('ENDED'),'authorization_contract_version','1.0.0','catalog_version','PERM-CAT-1.0.0','source_versions','{}'::jsonb,'source_fingerprints','{}'::jsonb,'request','{}'::jsonb))$$,'55000','AUTH_DB_013_EVALUATION_REQUIRES_ACTIVE','terminal simulation cannot produce new evaluations');


set local role vento_authorization_owner;
insert into audit.authorization_simulations (
  simulation_id, contract_name, contract_version, schema_version, created_at, expires_at, purpose_code,
  reason_code, real_principal_id, real_actor_id, real_employee_id, technical_principal_id,
  real_session_reference, real_access_context_id, real_access_context_fingerprint,
  requester_authorization_decision_id, initial_revision_id, correlation_id, creation_idempotency_key,
  request_fingerprint, source_versions, source_fingerprints,
  root_fingerprint, source_contract_sha256
) values (
  '01310000-0000-4000-8000-000000000001','SimulationContext','1.0.0','1.0.0',
  pg_catalog.statement_timestamp()-interval '2 hours',pg_catalog.statement_timestamp()-interval '1 hour',
  'EXPIRY_TEST','EXPIRY_TEST','AUTH-DB-013-PRINCIPAL-1','AUTH-DB-013-ACTOR-1','AUTH-DB-013-ACTOR-1',session_user,
  'SESSION-EXPIRED','AUTH-DB-013-CONTEXT-1','sha256:' || repeat('a',64),
  '01300000-0000-4000-8000-000000000001','01310000-0000-4000-8000-000000000002',
  'AUTH-DB-013-CORR-EXPIRED','CREATE-EXPIRED','sha256:' || repeat('3',64),'{}'::jsonb,'{}'::jsonb,
  'sha256:' || repeat('4',64),
  '4ec891da4fdf4bc85ccc3a2084f50add7d7957fcb53e28a949039eb2f79075a7'
);
insert into audit.authorization_simulation_revisions (
  simulation_revision_id, simulation_id, revision_number, created_at, created_by_real_actor_id,
  requester_authorization_decision_id, scenario_kind, simulated_subject, simulated_resolved_at,
  policy_snapshot, source_versions, source_fingerprints, scenario_fingerprint, source_contract_sha256
) values (
  '01310000-0000-4000-8000-000000000002','01310000-0000-4000-8000-000000000001',1,
  pg_catalog.statement_timestamp()-interval '2 hours','AUTH-DB-013-ACTOR-1','01300000-0000-4000-8000-000000000001',
  'AUTHORIZATION_CONTEXT','{}'::jsonb,pg_catalog.statement_timestamp()-interval '2 hours',
  jsonb_build_object('schema_version','1.0.0','simulation_requirement','FULL_PREVIEW','permission_key','nexo.inventory.stock.view','app_code','NEXO','authorization_contract_version','1.0.0','catalog_version','PERM-CAT-1.0.0'),'{}'::jsonb,'{}'::jsonb,
  'sha256:' || repeat('5',64),'4ec891da4fdf4bc85ccc3a2084f50add7d7957fcb53e28a949039eb2f79075a7'
);
reset role;

-- 125
select is(app_private.derive_authorization_simulation_status('01310000-0000-4000-8000-000000000001'::uuid),'EXPIRED','expires_at derives EXPIRED even without an expiration job');

-- 126
select throws_ok($$select app_private.append_authorization_simulation_evaluation(jsonb_build_object('simulation_id','01310000-0000-4000-8000-000000000001','simulation_revision_id','01310000-0000-4000-8000-000000000002','authorization_decision_id','01300000-0000-4000-8000-000000000001','evaluation_request_id','EVAL-EXPIRED','app_code','NEXO','permission_key','nexo.inventory.stock.view','simulation_requirement','FULL_PREVIEW','hypothetical_context_id','EXPIRED-CONTEXT','outcome','WOULD_DENY','reason_codes',jsonb_build_array('EXPIRED'),'authorization_contract_version','1.0.0','catalog_version','PERM-CAT-1.0.0','source_versions','{}'::jsonb,'source_fingerprints','{}'::jsonb,'request','{}'::jsonb))$$,'55000','AUTH_DB_013_EVALUATION_REQUIRES_ACTIVE','expired simulation blocks new evaluations without requiring an expiration event');

-- 127
select is((app_private.append_authorization_simulation_event(jsonb_build_object('simulation_id','01310000-0000-4000-8000-000000000001','event_type','SIMULATION_EXPIRED','operation_id','EXPIRE-013-001','reason_code','SIMULATION_EXPIRED')) ->> 'status'),'EXPIRED','explicit expiration event can materialize deterministically after expires_at');

-- 128
select is((select pg_catalog.count(*) from audit.authorization_simulation_events where simulation_id='01310000-0000-4000-8000-000000000001' and event_type='SIMULATION_EXPIRED'),1::bigint,'explicit expiration evidence is append-only and unique');


create temporary table auth_db_013_revoke_root on commit drop as
select app_private.append_authorization_simulation(pg_temp.auth_db_013_create_payload('CREATE-013-REVOKE')) as result;
create temporary table auth_db_013_revoke_activation on commit drop as
select app_private.append_authorization_simulation_event(jsonb_build_object(
  'simulation_id',(select result ->> 'simulation_id' from auth_db_013_revoke_root),
  'event_type','SIMULATION_ACTIVATED','operation_id','ACTIVATE-013-REVOKE',
  'authorization_decision_id','01300000-0000-4000-8000-000000000001','reason_code','SIMULATION_ACTIVATED')) as result;
create temporary table auth_db_013_would_deny on commit drop as
select app_private.append_authorization_simulation_evaluation(jsonb_build_object(
  'simulation_id',(select result ->> 'simulation_id' from auth_db_013_revoke_root),
  'simulation_revision_id',(select result ->> 'simulation_revision_id' from auth_db_013_revoke_root),
  'authorization_decision_id','01300000-0000-4000-8000-000000000001',
  'evaluation_request_id','EVAL-013-WOULD-DENY','app_code','NEXO','permission_key','nexo.inventory.stock.view',
  'simulation_requirement','FULL_PREVIEW','hypothetical_context_id','SIM-CONTEXT-WOULD-DENY',
  'outcome','WOULD_DENY','reason_codes',jsonb_build_array('NOT_ALLOWED'),
  'authorization_contract_version','1.0.0','catalog_version','PERM-CAT-1.0.0',
  'source_versions','{}'::jsonb,'source_fingerprints','{}'::jsonb,'request',jsonb_build_object('operation','APP_ACCESS'))) as result;
create temporary table auth_db_013_revoke_result on commit drop as
select app_private.append_authorization_simulation_event(jsonb_build_object(
  'simulation_id',(select result ->> 'simulation_id' from auth_db_013_revoke_root),
  'event_type','SIMULATION_REVOKED','operation_id','REVOKE-013-001',
  'authorization_decision_id','01300000-0000-4000-8000-000000000001','reason_code','SIMULATION_REVOKED')) as result;

create temporary table auth_db_013_invalid_root on commit drop as
select app_private.append_authorization_simulation(pg_temp.auth_db_013_create_payload('CREATE-013-INVALID')) as result;
create temporary table auth_db_013_invalid_result on commit drop as
select app_private.append_authorization_simulation_event(jsonb_build_object(
  'simulation_id',(select result ->> 'simulation_id' from auth_db_013_invalid_root),
  'event_type','SIMULATION_INVALIDATED','operation_id','INVALIDATE-013-001',
  'authorization_decision_id','01300000-0000-4000-8000-000000000001','reason_code','SCENARIO_INVALIDATED')) as result;

-- 129
select is((select result ->> 'outcome' from auth_db_013_would_deny),'WOULD_DENY','WOULD_DENY is a valid non-executable simulated outcome');

-- 130
select is((select result ->> 'executable' from auth_db_013_would_deny),'false','WOULD_DENY remains executable=false');

-- 131
select is((select result ->> 'status' from auth_db_013_revoke_result),'REVOKED','revocation produces REVOKED terminal status');

-- 132
select is(app_private.derive_authorization_simulation_status((select (result ->> 'simulation_id')::uuid from auth_db_013_revoke_root)),'REVOKED','derived lifecycle preserves REVOKED');

-- 133
select is((select result ->> 'status' from auth_db_013_invalid_result),'INVALID','invalidation produces INVALID terminal status');

-- 134
select is(app_private.derive_authorization_simulation_status((select (result ->> 'simulation_id')::uuid from auth_db_013_invalid_root)),'INVALID','derived lifecycle preserves INVALID');

-- 135
select is((select pg_catalog.count(*) from audit.authorization_simulation_evaluations where outcome not in ('WOULD_ALLOW','WOULD_DENY','INDETERMINATE')),0::bigint,'persisted simulated outcomes stay inside WOULD_* and INDETERMINATE vocabulary');

-- 136
select is((select pg_catalog.count(*) from audit.authorization_simulation_evaluations where executable),0::bigint,'zero simulated evaluations are executable');

-- 137
select is((select pg_catalog.count(*) from audit.authorization_simulation_events where event_type not in ('SIMULATION_CREATED','SIMULATION_ACTIVATED','SIMULATION_REVISED','SIMULATION_EVALUATED','SIMULATION_COMPLETED','SIMULATION_EXPIRED','SIMULATION_REVOKED','SIMULATION_INVALIDATED','SIMULATION_CORRECTION_LINKED')),0::bigint,'event vocabulary remains closed');

-- 138
select is((select pg_catalog.count(*) from audit.authorization_simulation_attempts where attempt_result not in ('DENIED','INVALID','CONFLICT','TECHNICAL_FAILURE','NO_CHANGE','ROLLED_BACK')),0::bigint,'attempt outcome vocabulary remains closed');

-- 139
select is((select pg_catalog.count(*) from audit.authorization_simulation_links where link_kind not in ('REQUESTER_AUTHORIZATION_DECISION','REAL_ACCESS_CONTEXT','REAL_AUTH_SESSION','DEVICE_CONTEXT','SIMULATED_EVALUATION','RESOURCE_REFERENCE','EVIDENCE_REFERENCE','CORRECTION')),0::bigint,'link vocabulary remains closed');

-- 140
select throws_ok($$insert into audit.authorization_simulation_evaluations (simulated_decision_id,simulation_id,simulation_revision_id,requester_authorization_decision_id,evaluation_request_id,evaluated_at,app_code,permission_key,simulation_requirement,hypothetical_context_id,outcome,reason_codes,executable,scenario_fingerprint,authorization_contract_version,catalog_version,source_versions,source_fingerprints,request_fingerprint,evaluation_fingerprint,source_contract_sha256) values ('01320000-0000-4000-8000-000000000001',(select (result->>'simulation_id')::uuid from auth_db_013_root_result),(select (result->>'simulation_revision_id')::uuid from auth_db_013_revision_result),'01300000-0000-4000-8000-000000000001','DIRECT-EXECUTABLE',statement_timestamp(),'NEXO','nexo.inventory.stock.view','DECISION_ONLY','CTX','WOULD_ALLOW',array['BAD'],true,'sha256:'||repeat('1',64),'1.0.0','1.0.0','{}','{}','sha256:'||repeat('2',64),'sha256:'||repeat('3',64),'4ec891da4fdf4bc85ccc3a2084f50add7d7957fcb53e28a949039eb2f79075a7')$$,'42501',null,'direct ordinary session cannot bypass private audit DML to write executable=true');

-- 141
set local role vento_authorization_owner; select throws_ok($$update audit.authorization_simulations set recorded_at=recorded_at$$,'55000','AUTH_DB_013_APPEND_ONLY_MUTATION_FORBIDDEN','UPDATE is rejected on append-only authorization_simulations'); reset role;

-- 142
set local role vento_authorization_owner; select throws_ok($$delete from audit.authorization_simulations$$,'55000','AUTH_DB_013_APPEND_ONLY_MUTATION_FORBIDDEN','DELETE is rejected on append-only authorization_simulations'); reset role;

-- 143
set local role vento_authorization_owner; select throws_ok($$update audit.authorization_simulation_revisions set recorded_at=recorded_at$$,'55000','AUTH_DB_013_APPEND_ONLY_MUTATION_FORBIDDEN','UPDATE is rejected on append-only authorization_simulation_revisions'); reset role;

-- 144
set local role vento_authorization_owner; select throws_ok($$delete from audit.authorization_simulation_revisions$$,'55000','AUTH_DB_013_APPEND_ONLY_MUTATION_FORBIDDEN','DELETE is rejected on append-only authorization_simulation_revisions'); reset role;

-- 145
set local role vento_authorization_owner; select throws_ok($$update audit.authorization_simulation_evaluations set recorded_at=recorded_at$$,'55000','AUTH_DB_013_APPEND_ONLY_MUTATION_FORBIDDEN','UPDATE is rejected on append-only authorization_simulation_evaluations'); reset role;

-- 146
set local role vento_authorization_owner; select throws_ok($$delete from audit.authorization_simulation_evaluations$$,'55000','AUTH_DB_013_APPEND_ONLY_MUTATION_FORBIDDEN','DELETE is rejected on append-only authorization_simulation_evaluations'); reset role;

-- 147
set local role vento_authorization_owner; select throws_ok($$update audit.authorization_simulation_events set recorded_at=recorded_at$$,'55000','AUTH_DB_013_APPEND_ONLY_MUTATION_FORBIDDEN','UPDATE is rejected on append-only authorization_simulation_events'); reset role;

-- 148
set local role vento_authorization_owner; select throws_ok($$delete from audit.authorization_simulation_events$$,'55000','AUTH_DB_013_APPEND_ONLY_MUTATION_FORBIDDEN','DELETE is rejected on append-only authorization_simulation_events'); reset role;

-- 149
set local role vento_authorization_owner; select throws_ok($$update audit.authorization_simulation_attempts set recorded_at=recorded_at$$,'55000','AUTH_DB_013_APPEND_ONLY_MUTATION_FORBIDDEN','UPDATE is rejected on append-only authorization_simulation_attempts'); reset role;

-- 150
set local role vento_authorization_owner; select throws_ok($$delete from audit.authorization_simulation_attempts$$,'55000','AUTH_DB_013_APPEND_ONLY_MUTATION_FORBIDDEN','DELETE is rejected on append-only authorization_simulation_attempts'); reset role;

-- 151
set local role vento_authorization_owner; select throws_ok($$update audit.authorization_simulation_links set recorded_at=recorded_at$$,'55000','AUTH_DB_013_APPEND_ONLY_MUTATION_FORBIDDEN','UPDATE is rejected on append-only authorization_simulation_links'); reset role;

-- 152
set local role vento_authorization_owner; select throws_ok($$delete from audit.authorization_simulation_links$$,'55000','AUTH_DB_013_APPEND_ONLY_MUTATION_FORBIDDEN','DELETE is rejected on append-only authorization_simulation_links'); reset role;

-- 153
set local role vento_authorization_owner; select throws_ok($$update audit.authorization_simulation_corrections set recorded_at=recorded_at$$,'55000','AUTH_DB_013_APPEND_ONLY_MUTATION_FORBIDDEN','UPDATE is rejected on append-only authorization_simulation_corrections'); reset role;

-- 154
set local role vento_authorization_owner; select throws_ok($$delete from audit.authorization_simulation_corrections$$,'55000','AUTH_DB_013_APPEND_ONLY_MUTATION_FORBIDDEN','DELETE is rejected on append-only authorization_simulation_corrections'); reset role;

-- 155
select is((select pg_catalog.count(*) from pg_catalog.pg_trigger t join pg_catalog.pg_class c on c.oid=t.tgrelid join pg_catalog.pg_namespace n on n.oid=c.relnamespace where n.nspname='audit' and c.relname like 'authorization_simulation%' and not t.tgisinternal and t.tgname in ('trg_auth_db_013_append_only_row','trg_auth_db_013_append_only_truncate')),14::bigint,'all seven AUTH-DB-013 evidence tables have UPDATE/DELETE and TRUNCATE append-only triggers');

-- 156
select is((select pg_catalog.count(*) from pg_catalog.pg_trigger t where t.tgrelid=pg_catalog.to_regclass('public.context_simulation_sessions') and not t.tgisinternal and t.tgname like 'trg_auth_db_013%'),0::bigint,'AUTH-DB-013 installs no trigger on the legacy mutable simulation table');

-- 157
select ok(pg_catalog.to_regclass('public.context_simulation_sessions') is not null,'legacy context_simulation_sessions remains present for consumer-owned transition');

-- 158
select ok(exists(select 1 from pg_catalog.pg_proc p join pg_catalog.pg_namespace n on n.oid=p.pronamespace where n.nspname='public' and p.proname='can_manage_context_simulation_v1'),'legacy can_manage_context_simulation_v1 is preserved and not retired by AUTH-DB-013');

-- 159
select ok(exists(select 1 from pg_catalog.pg_proc p join pg_catalog.pg_namespace n on n.oid=p.pronamespace where n.nspname='public' and p.proname='get_active_context_simulation_v1'),'legacy get_active_context_simulation_v1 is preserved and not retired by AUTH-DB-013');

-- 160
select ok(exists(select 1 from pg_catalog.pg_proc p join pg_catalog.pg_namespace n on n.oid=p.pronamespace where n.nspname='public' and p.proname='get_effective_context_v1'),'legacy get_effective_context_v1 is preserved and not retired by AUTH-DB-013');

-- 161
select ok(exists(select 1 from pg_catalog.pg_proc p join pg_catalog.pg_namespace n on n.oid=p.pronamespace where n.nspname='public' and p.proname='has_effective_permission_v1'),'legacy has_effective_permission_v1 is preserved and not retired by AUTH-DB-013');

-- 162
select ok(exists(select 1 from pg_catalog.pg_proc p join pg_catalog.pg_namespace n on n.oid=p.pronamespace where n.nspname='public' and p.proname='start_context_simulation_v1'),'legacy start_context_simulation_v1 is preserved and not retired by AUTH-DB-013');

-- 163
select ok(exists(select 1 from pg_catalog.pg_proc p join pg_catalog.pg_namespace n on n.oid=p.pronamespace where n.nspname='public' and p.proname='stop_context_simulation_v1'),'legacy stop_context_simulation_v1 is preserved and not retired by AUTH-DB-013');

-- 164
select ok(pg_catalog.to_regclass('audit.ix_authorization_simulations_actor_time') is not null,'index ix_authorization_simulations_actor_time exists for governed lookup pattern');

-- 165
select ok(pg_catalog.to_regclass('audit.ix_authorization_simulation_revisions_sequence') is not null,'index ix_authorization_simulation_revisions_sequence exists for governed lookup pattern');

-- 166
select ok(pg_catalog.to_regclass('audit.ix_authorization_simulation_evaluations_time') is not null,'index ix_authorization_simulation_evaluations_time exists for governed lookup pattern');

-- 167
select ok(pg_catalog.to_regclass('audit.ix_authorization_simulation_events_time') is not null,'index ix_authorization_simulation_events_time exists for governed lookup pattern');

-- 168
select ok(pg_catalog.to_regclass('audit.ix_authorization_simulation_attempts_result_time') is not null,'index ix_authorization_simulation_attempts_result_time exists for governed lookup pattern');

-- 169
select ok(pg_catalog.to_regclass('audit.ix_authorization_simulation_links_reference') is not null,'index ix_authorization_simulation_links_reference exists for governed lookup pattern');

-- 170
select ok(pg_catalog.to_regclass('audit.ix_authorization_simulation_corrections_time') is not null,'index ix_authorization_simulation_corrections_time exists for governed lookup pattern');

-- 171
select is((select pg_catalog.count(*) from audit.authorization_simulations where source_contract_sha256='4ec891da4fdf4bc85ccc3a2084f50add7d7957fcb53e28a949039eb2f79075a7'),(select pg_catalog.count(*) from audit.authorization_simulations),'all simulation roots preserve AUTH-DB-013 source contract identity');

-- 172
select is((select pg_catalog.count(*) from audit.authorization_simulation_revisions where source_contract_sha256='4ec891da4fdf4bc85ccc3a2084f50add7d7957fcb53e28a949039eb2f79075a7'),(select pg_catalog.count(*) from audit.authorization_simulation_revisions),'all revisions preserve AUTH-DB-013 source contract identity');

-- 173
select is((select pg_catalog.count(*) from audit.authorization_simulation_evaluations where source_contract_sha256='4ec891da4fdf4bc85ccc3a2084f50add7d7957fcb53e28a949039eb2f79075a7'),(select pg_catalog.count(*) from audit.authorization_simulation_evaluations),'all evaluations preserve AUTH-DB-013 source contract identity');

-- 174
select is((select pg_catalog.count(*) from audit.authorization_simulation_events where source_contract_sha256='4ec891da4fdf4bc85ccc3a2084f50add7d7957fcb53e28a949039eb2f79075a7'),(select pg_catalog.count(*) from audit.authorization_simulation_events),'all events preserve AUTH-DB-013 source contract identity');

-- 175
select is((select pg_catalog.count(*) from audit.authorization_simulation_attempts where source_contract_sha256='4ec891da4fdf4bc85ccc3a2084f50add7d7957fcb53e28a949039eb2f79075a7'),(select pg_catalog.count(*) from audit.authorization_simulation_attempts),'all attempts preserve AUTH-DB-013 source contract identity');

-- 176
select is((select pg_catalog.count(*) from audit.authorization_simulation_links where source_contract_sha256='4ec891da4fdf4bc85ccc3a2084f50add7d7957fcb53e28a949039eb2f79075a7'),(select pg_catalog.count(*) from audit.authorization_simulation_links),'all links preserve AUTH-DB-013 source contract identity');

-- 177
select is((select pg_catalog.count(*) from audit.authorization_simulation_corrections where source_contract_sha256='4ec891da4fdf4bc85ccc3a2084f50add7d7957fcb53e28a949039eb2f79075a7'),(select pg_catalog.count(*) from audit.authorization_simulation_corrections),'all corrections preserve AUTH-DB-013 source contract identity');

-- 178
select is((select pg_catalog.count(*) from audit.authorization_simulation_evaluations e join audit.authorization_simulation_revisions r on r.simulation_revision_id=e.simulation_revision_id where e.scenario_fingerprint is distinct from r.scenario_fingerprint),0::bigint,'every evaluation fingerprint provenance matches its exact revision');

-- 179
select is((select pg_catalog.count(*) from audit.authorization_simulation_revisions r left join audit.authorization_simulations s using(simulation_id) where s.simulation_id is null),0::bigint,'all revisions remain linked to a simulation root');

-- 180
select is((select pg_catalog.count(*) from audit.authorization_simulation_evaluations e left join audit.authorization_simulation_revisions r using(simulation_revision_id) where r.simulation_revision_id is null),0::bigint,'all evaluations remain linked to exact revisions');

-- 181
select is((select pg_catalog.count(*) from audit.authorization_simulation_events e left join audit.authorization_simulations s using(simulation_id) where s.simulation_id is null),0::bigint,'all lifecycle events remain linked to roots');

-- 182
select is((select pg_catalog.count(*) from audit.authorization_simulation_corrections c left join audit.authorization_simulations s using(simulation_id) where s.simulation_id is null),0::bigint,'all corrections remain linked to roots');

-- 183
select is((select pg_catalog.count(*) from pg_catalog.pg_trigger t join pg_catalog.pg_class c on c.oid=t.tgrelid join pg_catalog.pg_namespace n on n.oid=c.relnamespace where not t.tgisinternal and t.tgname like 'trg_auth_db_013%' and not (n.nspname='audit' and c.relname like 'authorization_simulation%')),0::bigint,'AUTH-DB-013 installs zero triggers on business or real-authority tables');

-- 184
select ok(not exists(select 1 from pg_catalog.pg_proc p join pg_catalog.pg_namespace n on n.oid=p.pronamespace where n.nspname='app_private' and p.proname like '%authorization_simulation%' and pg_catalog.pg_get_functiondef(p.oid) ~* 'insert[[:space:]]+into[[:space:]]+public\.'),'AUTH-DB-013 private functions contain no public business INSERT writer');

-- 185
select ok(not exists(select 1 from pg_catalog.pg_proc p join pg_catalog.pg_namespace n on n.oid=p.pronamespace where n.nspname='app_private' and p.proname like '%authorization_simulation%' and pg_catalog.pg_get_functiondef(p.oid) ~* 'update[[:space:]]+public\.'),'AUTH-DB-013 private functions contain no public business UPDATE writer');

-- 186
select ok(not exists(select 1 from pg_catalog.pg_proc p join pg_catalog.pg_namespace n on n.oid=p.pronamespace where n.nspname='app_private' and p.proname like '%authorization_simulation%' and pg_catalog.pg_get_functiondef(p.oid) ~* 'delete[[:space:]]+from[[:space:]]+public\.'),'AUTH-DB-013 private functions contain no public business DELETE writer');



-- 187
select is((select pg_catalog.count(*) from auth_db_013_expected_simulation_policy),140::bigint,'canonical simulation policy snapshot contains exactly 140 active permission identities');

-- 188
select is((select pg_catalog.count(*) from auth_db_013_expected_simulation_policy where simulation_requirement='FULL_PREVIEW'),85::bigint,'canonical simulation policy snapshot has exactly 85 FULL_PREVIEW permissions');

-- 189
select is((select pg_catalog.count(*) from auth_db_013_expected_simulation_policy where simulation_requirement='DECISION_ONLY'),52::bigint,'canonical simulation policy snapshot has exactly 52 DECISION_ONLY permissions');

-- 190
select is((select pg_catalog.count(*) from auth_db_013_expected_simulation_policy where simulation_requirement='NOT_ALLOWED'),3::bigint,'canonical simulation policy snapshot has exactly 3 NOT_ALLOWED permissions');

-- 191
select is((select pg_catalog.array_agg(permission_key order by permission_key) from auth_db_013_expected_simulation_policy where simulation_requirement='NOT_ALLOWED'),array['aura.access','pass.access','viso.authorization.context_simulations.view']::text[],'NOT_ALLOWED set is exactly AURA, PASS, and the real simulation-admin permission');

-- 192
select is(179::bigint,(select pg_catalog.count(*) from auth_db_013_expected_simulation_policy)+39::bigint,'documented remote-observed app_permissions baseline 179 equals the contractual 140 snapshot plus the observed 39-row drift');

-- 193
select is(179::bigint-(select pg_catalog.count(*) from auth_db_013_expected_simulation_policy),39::bigint,'documented remote-observed 179 versus contractual 140 is preserved explicitly as a 39-row drift without pretending the local replay reproduces remote catalog data');

-- 194
select is((select pg_catalog.count(*) from information_schema.columns where table_schema='public' and table_name='app_permissions' and column_name='permission_key'),0::bigint,'physical app_permissions does not expose canonical PermissionKey identity; AUTH-DB-013 does not fake a direct 140-to-179 key join');

-- 195
select is((select pg_catalog.count(*) from information_schema.columns where table_schema='public' and table_name='app_permissions' and column_name='simulation_requirement'),0::bigint,'physical app_permissions still has no simulation_requirement column; AUTH-DB-013 does not mutate catalog ownership');

-- 196
select is((select pg_catalog.count(*) from auth_db_013_expected_simulation_policy where permission_key='nexo.inventory.remissions.dispatch'),0::bigint,'deprecated split permission nexo.inventory.remissions.dispatch is not in the active 140 simulation snapshot');

-- 197
select is((select pg_catalog.count(*) from auth_db_013_expected_simulation_policy e where exists (select 1 from pg_catalog.pg_proc p join pg_catalog.pg_namespace n on n.oid=p.pronamespace where n.nspname='app_private' and p.proname='append_authorization_simulation_evaluation' and pg_catalog.strpos(p.prosrc,pg_catalog.format('(''%s'', ''%s'')',e.permission_key,e.simulation_requirement)) > 0)),140::bigint,'evaluation persistence embeds all 140 exact permission-to-simulation classifications');

create temporary table auth_db_013_mapping_root on commit drop as
select app_private.append_authorization_simulation(pg_temp.auth_db_013_create_payload('CREATE-013-MAPPING')) as result;
create temporary table auth_db_013_mapping_activation on commit drop as
select app_private.append_authorization_simulation_event(jsonb_build_object(
  'simulation_id',(select result ->> 'simulation_id' from auth_db_013_mapping_root),
  'event_type','SIMULATION_ACTIVATED','operation_id','ACTIVATE-013-MAPPING',
  'authorization_decision_id','01300000-0000-4000-8000-000000000001','reason_code','SIMULATION_ACTIVATED')) as result;

-- 198
select throws_ok($$select app_private.append_authorization_simulation_evaluation(jsonb_build_object('simulation_id',(select result->>'simulation_id' from auth_db_013_mapping_root),'simulation_revision_id',(select result->>'simulation_revision_id' from auth_db_013_mapping_root),'authorization_decision_id','01300000-0000-4000-8000-000000000001','evaluation_request_id','EVAL-UNKNOWN','app_code','NEXO','permission_key','nexo.inventory.unknown_permission','simulation_requirement','FULL_PREVIEW','hypothetical_context_id','CTX-UNKNOWN','outcome','WOULD_DENY','reason_codes',jsonb_build_array('UNKNOWN'),'authorization_contract_version','1.0.0','catalog_version','PERM-CAT-1.0.0','source_versions','{}'::jsonb,'source_fingerprints','{}'::jsonb,'request','{}'::jsonb))$$,'42501','AUTH_DB_013_PERMISSION_NOT_CLASSIFIED','unclassified physical or invented permission fails closed instead of receiving FULL_PREVIEW');

-- 199
select throws_ok($$select app_private.append_authorization_simulation_evaluation(jsonb_build_object('simulation_id',(select result->>'simulation_id' from auth_db_013_mapping_root),'simulation_revision_id',(select result->>'simulation_revision_id' from auth_db_013_mapping_root),'authorization_decision_id','01300000-0000-4000-8000-000000000001','evaluation_request_id','EVAL-MISMATCH','app_code','NEXO','permission_key','nexo.inventory.stock.view','simulation_requirement','DECISION_ONLY','hypothetical_context_id','CTX-MISMATCH','outcome','WOULD_DENY','reason_codes',jsonb_build_array('MISMATCH'),'authorization_contract_version','1.0.0','catalog_version','PERM-CAT-1.0.0','source_versions','{}'::jsonb,'source_fingerprints','{}'::jsonb,'request','{}'::jsonb))$$,'42501','AUTH_DB_013_SIMULATION_REQUIREMENT_MISMATCH','caller cannot relabel a canonical FULL_PREVIEW permission as DECISION_ONLY');

-- 200
select throws_ok($$select app_private.append_authorization_simulation_evaluation(jsonb_build_object('simulation_id',(select result->>'simulation_id' from auth_db_013_mapping_root),'simulation_revision_id',(select result->>'simulation_revision_id' from auth_db_013_mapping_root),'authorization_decision_id','01300000-0000-4000-8000-000000000001','evaluation_request_id','EVAL-NA-AURA','app_code','AURA','permission_key','aura.access','simulation_requirement','NOT_ALLOWED','hypothetical_context_id','CTX-NA-AURA','outcome','WOULD_DENY','reason_codes',jsonb_build_array('NOT_ALLOWED'),'authorization_contract_version','1.0.0','catalog_version','PERM-CAT-1.0.0','source_versions','{}'::jsonb,'source_fingerprints','{}'::jsonb,'request','{}'::jsonb))$$,'42501','AUTH_DB_013_EVALUATION_NOT_ALLOWED','aura.access cannot be simulated');

-- 201
select throws_ok($$select app_private.append_authorization_simulation_evaluation(jsonb_build_object('simulation_id',(select result->>'simulation_id' from auth_db_013_mapping_root),'simulation_revision_id',(select result->>'simulation_revision_id' from auth_db_013_mapping_root),'authorization_decision_id','01300000-0000-4000-8000-000000000001','evaluation_request_id','EVAL-NA-PASS','app_code','PASS','permission_key','pass.access','simulation_requirement','NOT_ALLOWED','hypothetical_context_id','CTX-NA-PASS','outcome','WOULD_DENY','reason_codes',jsonb_build_array('NOT_ALLOWED'),'authorization_contract_version','1.0.0','catalog_version','PERM-CAT-1.0.0','source_versions','{}'::jsonb,'source_fingerprints','{}'::jsonb,'request','{}'::jsonb))$$,'42501','AUTH_DB_013_EVALUATION_NOT_ALLOWED','pass.access cannot be simulated');

-- 202
select throws_ok($$select app_private.append_authorization_simulation_evaluation(jsonb_build_object('simulation_id',(select result->>'simulation_id' from auth_db_013_mapping_root),'simulation_revision_id',(select result->>'simulation_revision_id' from auth_db_013_mapping_root),'authorization_decision_id','01300000-0000-4000-8000-000000000001','evaluation_request_id','EVAL-NA-VISO','app_code','VISO','permission_key','viso.authorization.context_simulations.view','simulation_requirement','NOT_ALLOWED','hypothetical_context_id','CTX-NA-VISO','outcome','WOULD_DENY','reason_codes',jsonb_build_array('NOT_ALLOWED'),'authorization_contract_version','1.0.0','catalog_version','PERM-CAT-1.0.0','source_versions','{}'::jsonb,'source_fingerprints','{}'::jsonb,'request','{}'::jsonb))$$,'42501','AUTH_DB_013_EVALUATION_NOT_ALLOWED','real simulation-administration permission cannot be simulated by itself');

create temporary table auth_db_013_decision_root on commit drop as
select app_private.append_authorization_simulation(
  pg_temp.auth_db_013_create_payload('CREATE-013-DECISION') ||
  jsonb_build_object('scenario',pg_temp.auth_db_013_scenario('DECISION_ONLY','gerente','nexo.finance.internal_prices.view','NEXO'))
) as result;
create temporary table auth_db_013_decision_activation on commit drop as
select app_private.append_authorization_simulation_event(jsonb_build_object(
  'simulation_id',(select result ->> 'simulation_id' from auth_db_013_decision_root),
  'event_type','SIMULATION_ACTIVATED','operation_id','ACTIVATE-013-DECISION',
  'authorization_decision_id','01300000-0000-4000-8000-000000000001','reason_code','SIMULATION_ACTIVATED')) as result;
create temporary table auth_db_013_decision_eval on commit drop as
select app_private.append_authorization_simulation_evaluation(jsonb_build_object(
  'simulation_id',(select result->>'simulation_id' from auth_db_013_decision_root),
  'simulation_revision_id',(select result->>'simulation_revision_id' from auth_db_013_decision_root),
  'authorization_decision_id','01300000-0000-4000-8000-000000000001','evaluation_request_id','EVAL-DECISION-POSITIVE',
  'app_code','NEXO','permission_key','nexo.finance.internal_prices.view','simulation_requirement','DECISION_ONLY',
  'hypothetical_context_id','CTX-DECISION','outcome','WOULD_DENY','reason_codes',jsonb_build_array('SIMULATED_DENY'),
  'authorization_contract_version','1.0.0','catalog_version','PERM-CAT-1.0.0','source_versions','{}'::jsonb,
  'source_fingerprints','{}'::jsonb,'request',jsonb_build_object('resource_mode','DECISION_ONLY'))) as result;

-- 203
select is((select simulation_requirement from audit.authorization_simulation_evaluations where evaluation_request_id='EVAL-DECISION-POSITIVE'),'DECISION_ONLY','canonical DECISION_ONLY permission persists only its decision-class evaluation');

-- 204
select is((select result->>'executable' from auth_db_013_decision_eval),'false','DECISION_ONLY positive-path evaluation remains non-executable');

-- 205
select is((select pg_catalog.count(*) from public.context_simulation_sessions),0::bigint,'legacy session table remains empty at the migration cut and no artificial backfill is created');

-- 206
select is((select pg_catalog.count(*) from (values ('anon'),('authenticated'),('service_role')) r(role_name) where pg_catalog.has_table_privilege(r.role_name,'public.context_simulation_sessions','SELECT') or pg_catalog.has_table_privilege(r.role_name,'public.context_simulation_sessions','INSERT') or pg_catalog.has_table_privilege(r.role_name,'public.context_simulation_sessions','UPDATE') or pg_catalog.has_table_privilege(r.role_name,'public.context_simulation_sessions','DELETE') or pg_catalog.has_table_privilege(r.role_name,'public.context_simulation_sessions','TRUNCATE')),0::bigint,'legacy mutable simulation table has no direct client or service-role data privileges after containment');

-- 207
select is(public.can_manage_context_simulation_v1('01300000-0000-4000-8000-000000000001'::uuid),false,'legacy can_manage compatibility no longer grants authority by role name');

-- 208
select is((select pg_catalog.count(*) from public.get_active_context_simulation_v1()),0::bigint,'legacy get_active compatibility exposes no mutable session as canonical active simulation');

-- 209
select throws_ok($$select public.start_context_simulation_v1('01300000-0000-4000-8000-000000000011'::uuid,null,'bodeguero',null,240,'{}'::jsonb)$$,'0A000','AUTH_DB_013_LEGACY_SIMULATION_START_DISABLED','legacy start signature is preserved but cannot create mutable authority');

-- 210
select is(public.stop_context_simulation_v1(),false,'legacy stop signature is preserved but performs no mutable lifecycle UPDATE');

-- 211
select is((select pg_catalog.count(*) from pg_catalog.pg_proc p join pg_catalog.pg_namespace n on n.oid=p.pronamespace where n.nspname='public' and p.proname in ('can_manage_context_simulation_v1','get_active_context_simulation_v1','get_effective_context_v1','has_effective_permission_v1','start_context_simulation_v1','stop_context_simulation_v1')),6::bigint,'all six observed legacy signatures remain present for controlled transition');

-- 212
select is((select pg_catalog.count(*) from pg_catalog.pg_proc p join pg_catalog.pg_namespace n on n.oid=p.pronamespace where n.nspname='public' and p.proname in ('can_manage_context_simulation_v1','get_active_context_simulation_v1','start_context_simulation_v1','stop_context_simulation_v1') and not p.prosecdef),4::bigint,'four legacy surfaces that no longer need privileged reads are SECURITY INVOKER');

-- 213
select is((select pg_catalog.count(*) from pg_catalog.pg_proc p join pg_catalog.pg_namespace n on n.oid=p.pronamespace where n.nspname='public' and p.proname in ('get_effective_context_v1','has_effective_permission_v1') and p.prosecdef),2::bigint,'only the two real-context compatibility wrappers retain SECURITY DEFINER');

-- 214
select is((select pg_catalog.count(*) from pg_catalog.pg_proc p join pg_catalog.pg_namespace n on n.oid=p.pronamespace where n.nspname='public' and p.proname in ('get_effective_context_v1','has_effective_permission_v1','start_context_simulation_v1','stop_context_simulation_v1') and pg_catalog.has_function_privilege('authenticated',p.oid,'EXECUTE')),4::bigint,'authenticated retains only the four signatures consumed by os-context compatibility');

-- 215
select is((select pg_catalog.count(*) from pg_catalog.pg_proc p join pg_catalog.pg_namespace n on n.oid=p.pronamespace where n.nspname='public' and p.proname in ('can_manage_context_simulation_v1','get_active_context_simulation_v1') and pg_catalog.has_function_privilege('authenticated',p.oid,'EXECUTE')),0::bigint,'authenticated no longer executes internal legacy simulation-authority helpers');

-- 216
select ok((select p.prosrc !~* $$source[[:space:]]*:=[[:space:]]*'simulation'$$ and p.prosrc !~* $$can_operate[[:space:]]*:=[[:space:]]*true$$ from pg_catalog.pg_proc p join pg_catalog.pg_namespace n on n.oid=p.pronamespace where n.nspname='public' and p.proname='get_effective_context_v1'),'get_effective_context_v1 no longer mixes simulated roles into real effective context or emits simulated can_operate=true');

-- 217
select ok((select p.prosrc !~* $$source[[:space:]]*=[[:space:]]*'simulation'$$ and p.prosrc !~* 'effective_administrative_role' from pg_catalog.pg_proc p join pg_catalog.pg_namespace n on n.oid=p.pronamespace where n.nspname='public' and p.proname='has_effective_permission_v1'),'has_effective_permission_v1 no longer evaluates administrative or operational roles from a simulated source');

-- 218
select ok((select pg_catalog.bool_and(p.prosrc !~* '(insert[[:space:]]+into|update|delete[[:space:]]+from)[[:space:]]+(public[.])?context_simulation_sessions') from pg_catalog.pg_proc p join pg_catalog.pg_namespace n on n.oid=p.pronamespace where n.nspname='public' and p.proname in ('start_context_simulation_v1','stop_context_simulation_v1')),'legacy start/stop compatibility contains zero DML against context_simulation_sessions');

-- 219
select is((select pg_catalog.count(*) from pg_catalog.pg_proc p join pg_catalog.pg_namespace n on n.oid=p.pronamespace where n.nspname='public' and p.proname in ('can_manage_context_simulation_v1','get_active_context_simulation_v1','get_effective_context_v1','has_effective_permission_v1','start_context_simulation_v1','stop_context_simulation_v1') and pg_catalog.has_function_privilege('anon',p.oid,'EXECUTE')),0::bigint,'anon has zero EXECUTE across the six legacy surfaces, proving no PUBLIC execution path remains');

-- 220
select is((select pg_catalog.count(*) from pg_catalog.pg_proc p join pg_catalog.pg_namespace n on n.oid=p.pronamespace where n.nspname='public' and p.proname in ('get_effective_context_v1','has_effective_permission_v1') and p.proconfig is not null and coalesce(pg_catalog.array_to_string(p.proconfig,','),'') !~ '(public|auth)'),2::bigint,'remaining privileged legacy wrappers use hardened search_path without public or auth');

-- 221
select is((select pg_catalog.count(*) from pg_catalog.pg_proc p join pg_catalog.pg_namespace n on n.oid=p.pronamespace where n.nspname='public' and p.proname in ('get_effective_context_v1','has_effective_permission_v1','start_context_simulation_v1','stop_context_simulation_v1') and pg_catalog.has_function_privilege('service_role',p.oid,'EXECUTE')),4::bigint,'service_role compatibility is limited to the same four non-simulated-authority signatures and is not simulation admin');

-- 222
select is((select pg_catalog.count(*) from pg_catalog.pg_proc p join pg_catalog.pg_namespace n on n.oid=p.pronamespace where n.nspname='public' and p.proname in ('can_manage_context_simulation_v1','get_active_context_simulation_v1') and pg_catalog.has_function_privilege('service_role',p.oid,'EXECUTE')),0::bigint,'service_role does not execute role-name or mutable-active-session legacy authority helpers');

-- 223
select throws_ok(
  $$select app_private.append_authorization_simulation(
    pg_temp.auth_db_013_create_payload('CREATE-013-BAD-CHECKIN-STATE')
    || pg_catalog.jsonb_build_object(
      'scenario',
      pg_catalog.jsonb_set(
        pg_temp.auth_db_013_scenario(),
        '{simulated_checkin,simulated_checkin_state}',
        '"UNKNOWN"'::jsonb,
        false
      )
    )
  )$$,
  '22023',
  'AUTH_DB_013_SIMULATED_CHECKIN_STATE_INVALID',
  'simulated check-in accepts only the five AUTH-SIM-005 canonical states'
);

-- 224
select throws_ok(
  $$select app_private.append_authorization_simulation(
    pg_temp.auth_db_013_create_payload('CREATE-013-CHECKIN-WITHOUT-SHIFT')
    || pg_catalog.jsonb_build_object(
      'scenario',
      pg_catalog.jsonb_set(
        pg_temp.auth_db_013_scenario(),
        '{simulated_checkin,simulated_checkin_state}',
        '"ACTIVE_HYPOTHETICAL"'::jsonb,
        false
      )
    )
  )$$,
  '22023',
  'AUTH_DB_013_SIMULATED_CHECKIN_WITHOUT_SHIFT',
  'NO_SHIFT cannot coexist with ACTIVE_HYPOTHETICAL check-in'
);

-- 225
select throws_ok(
  $$select app_private.append_authorization_simulation(
    pg_temp.auth_db_013_create_payload('CREATE-013-BAD-SHIFT-MODE')
    || pg_catalog.jsonb_build_object(
      'scenario',
      pg_catalog.jsonb_set(
        pg_temp.auth_db_013_scenario(),
        '{simulated_shift,mode}',
        '"SYNTHETIC_SHIFT"'::jsonb,
        false
      )
    )
  )$$,
  '22023',
  'AUTH_DB_013_SIMULATED_SHIFT_MODE_INVALID',
  'legacy invented shift mode is rejected in favor of exact AUTH-SIM-005 target modes'
);


-- 226
set constraints audit.fk_authorization_simulations_initial_revision immediate;
set local role vento_authorization_owner;
select throws_ok($$truncate table audit.authorization_simulations cascade$$,'55000','AUTH_DB_013_APPEND_ONLY_MUTATION_FORBIDDEN','TRUNCATE is rejected on append-only authorization_simulations');

-- 227
select throws_ok($$truncate table audit.authorization_simulation_revisions cascade$$,'55000','AUTH_DB_013_APPEND_ONLY_MUTATION_FORBIDDEN','TRUNCATE is rejected on append-only authorization_simulation_revisions');

-- 228
select throws_ok($$truncate table audit.authorization_simulation_evaluations cascade$$,'55000','AUTH_DB_013_APPEND_ONLY_MUTATION_FORBIDDEN','TRUNCATE is rejected on append-only authorization_simulation_evaluations');

-- 229
select throws_ok($$truncate table audit.authorization_simulation_events$$,'55000','AUTH_DB_013_APPEND_ONLY_MUTATION_FORBIDDEN','TRUNCATE is rejected on append-only authorization_simulation_events');

-- 230
select throws_ok($$truncate table audit.authorization_simulation_attempts$$,'55000','AUTH_DB_013_APPEND_ONLY_MUTATION_FORBIDDEN','TRUNCATE is rejected on append-only authorization_simulation_attempts');

-- 231
select throws_ok($$truncate table audit.authorization_simulation_links$$,'55000','AUTH_DB_013_APPEND_ONLY_MUTATION_FORBIDDEN','TRUNCATE is rejected on append-only authorization_simulation_links');

-- 232
select throws_ok($$truncate table audit.authorization_simulation_corrections$$,'55000','AUTH_DB_013_APPEND_ONLY_MUTATION_FORBIDDEN','TRUNCATE is rejected on append-only authorization_simulation_corrections');
reset role;
set constraints audit.fk_authorization_simulations_initial_revision deferred;

-- 233
select lives_ok(
  $$create temporary table auth_db_013_hyp_shift_root on commit drop as
    select app_private.append_authorization_simulation(
      pg_temp.auth_db_013_create_payload('CREATE-013-HYP-SHIFT','ACCESS_REVIEW','FULL_PREVIEW','trabajador_operativo')
      || pg_catalog.jsonb_build_object(
        'scenario',
        pg_catalog.jsonb_set(
          pg_temp.auth_db_013_scenario('FULL_PREVIEW','trabajador_operativo'),
          '{simulated_shift}',
          pg_catalog.jsonb_build_object(
            'mode','HYPOTHETICAL_SHIFT',
            'simulated_shift_reference','SHIFT-SIM-013-HYP-1',
            'source_shift_id',null,
            'published_revision_reference','SHIFT-REV-SIM-013-HYP-1',
            'row_fingerprint','sha256:' || repeat('1',64),
            'simulated_shift_kind','LABORAL',
            'simulated_publication_state','PUBLISHED',
            'simulated_shift_status','SCHEDULED',
            'simulated_starts_at','2026-09-02T08:00:00-05:00',
            'simulated_ends_at','2026-09-02T10:00:00-05:00',
            'simulated_resolved_at','2026-09-02T09:00:00-05:00',
            'simulated_site_id','SITE-SIM-013',
            'simulated_area_id','AREA-SIM-013',
            'simulated_operational_role_code','bodeguero',
            'timezone','America/Bogota',
            'shift_contract_version','1.0.0',
            'role_catalog_version','AUTH-RBAC-1.0.0',
            'site_catalog_version','SITE-CAT-1.0.0',
            'area_catalog_version','AREA-CAT-1.0.0'
          ), false
        )
      )
    ) as result$$,
  'HYPOTHETICAL_SHIFT exact AUTH-SIM-005 shape is accepted for append-only audit persistence'
);

-- 234
select is((select r.simulated_shift->>'mode' from audit.authorization_simulation_revisions r where r.simulation_revision_id=(select (result->>'simulation_revision_id')::uuid from auth_db_013_hyp_shift_root)),'HYPOTHETICAL_SHIFT','HYPOTHETICAL_SHIFT mode is persisted verbatim and remains hypothetical evidence');

-- 235
select lives_ok(
  $$create temporary table auth_db_013_exact_shift_root on commit drop as
    select app_private.append_authorization_simulation(
      pg_temp.auth_db_013_create_payload('CREATE-013-EXACT-SHIFT','ACCESS_REVIEW','FULL_PREVIEW','trabajador_operativo')
      || pg_catalog.jsonb_build_object(
        'scenario',
        pg_catalog.jsonb_set(
          pg_temp.auth_db_013_scenario('FULL_PREVIEW','trabajador_operativo'),
          '{simulated_shift}',
          pg_catalog.jsonb_build_object(
            'mode','EXACT_PUBLISHED_SHIFT',
            'simulated_shift_reference','SHIFT-SIM-013-EXACT-1',
            'source_shift_id','SHIFT-REAL-013-1',
            'published_revision_reference','SHIFT-REV-REAL-013-1',
            'row_fingerprint','sha256:' || repeat('2',64),
            'simulated_shift_kind','LABORAL',
            'simulated_publication_state','PUBLISHED',
            'simulated_shift_status','CONFIRMED',
            'simulated_starts_at','2026-09-02T08:00:00-05:00',
            'simulated_ends_at','2026-09-02T10:00:00-05:00',
            'simulated_resolved_at','2026-09-02T09:00:00-05:00',
            'simulated_site_id','SITE-SIM-013',
            'simulated_area_id','AREA-SIM-013',
            'simulated_operational_role_code','bodeguero',
            'timezone','America/Bogota',
            'shift_contract_version','1.0.0',
            'role_catalog_version','AUTH-RBAC-1.0.0',
            'site_catalog_version','SITE-CAT-1.0.0',
            'area_catalog_version','AREA-CAT-1.0.0'
          ), false
        )
      )
    ) as result$$,
  'EXACT_PUBLISHED_SHIFT exact AUTH-SIM-005 shape is accepted for reproducible audit persistence'
);

-- 236
select is((select r.simulated_shift->>'mode' from audit.authorization_simulation_revisions r where r.simulation_revision_id=(select (result->>'simulation_revision_id')::uuid from auth_db_013_exact_shift_root)),'EXACT_PUBLISHED_SHIFT','EXACT_PUBLISHED_SHIFT mode is persisted without mutating source employee_shifts');

-- 237
select throws_ok(
  $$select app_private.append_authorization_simulation(
    pg_temp.auth_db_013_create_payload('CREATE-013-BAD-TIMEZONE')
    || pg_catalog.jsonb_build_object(
      'scenario', pg_catalog.jsonb_set(pg_temp.auth_db_013_scenario(),'{simulated_shift,timezone}','"UTC"'::jsonb,false)
    )
  )$$,
  '22023','AUTH_DB_013_SIMULATED_SHIFT_TIMEZONE_INVALID',
  'AUTH-SIM-005 organizational timezone is frozen to America/Bogota for this contract version'
);

-- 238
select is((select pg_catalog.count(*) from auth_db_013_base_role_register),8::bigint,'AUTH-SIM requester/role baseline contains exactly eight canonical base roles');

-- 239
select is((select pg_catalog.array_agg(role_code order by role_code)::text from auth_db_013_base_role_register),ARRAY['auxiliar_administrativa','contador','gerente','gerente_general','marketing','propietario','supervisor','trabajador_operativo']::text[]::text,'the eight canonical base-role identities are frozen exactly without legacy operational-role aliases');

-- 240
select is((select pg_catalog.count(*) from auth_db_013_operational_role_register),12::bigint,'AUTH-SIM role baseline contains exactly twelve canonical operational roles');

-- 241
select is((select pg_catalog.array_agg(role_code order by role_code)::text from auth_db_013_operational_role_register),ARRAY['barista_satelite','bodeguero','cajero_satelite','cocinero_satelite','conductor_logistica','gerencia_operativa','mostrador_satelite','operador_integral_satelite','produccion_cocina','produccion_panaderia','produccion_reposteria','servicio_salon']::text[]::text,'the twelve canonical operational-role identities are frozen exactly and remain typed separately from base roles');

-- 242
select is((select pg_catalog.count(*) from auth_db_013_shift_state_register),15::bigint,'SIMULATED-SHIFT-STATE-REGISTER-001 contains exactly fifteen canonical scenarios');

-- 243
select is((select pg_catalog.array_agg(scenario_code order by ordinal)::text from auth_db_013_shift_state_register),ARRAY['NO_SHIFT','HYPOTHETICAL_DRAFT','HYPOTHETICAL_PUBLISHED_FUTURE','HYPOTHETICAL_PUBLISHED_CURRENT_SCHEDULED','HYPOTHETICAL_PUBLISHED_CURRENT_CONFIRMED','HYPOTHETICAL_PUBLISHED_ENDED','HYPOTHETICAL_REST_CURRENT','HYPOTHETICAL_CANCELLED','HYPOTHETICAL_NO_SHOW','HYPOTHETICAL_COMPLETED','HYPOTHETICAL_WITHDRAWN','EXACT_VERSIONED_CURRENT','EXACT_LEGACY_UNVERSIONED','AMBIGUOUS_MULTIPLE_CANDIDATES','INVALID_CONTEXT_REFERENCE']::text[]::text,'all fifteen AUTH-SIM-005 scenario identities are preserved in canonical order');

-- 244
select is((select pg_catalog.count(*) from auth_db_013_shift_state_register where satisfies_t),3::bigint,'only the three canonically approved current/versioned scenarios satisfy the simulated T prerequisite');

-- 245
select is((select pg_catalog.count(*) from auth_db_013_shift_state_register where satisfies_t and shift_decision <> 'SIMULABLE_CONDITIONAL'),0::bigint,'every scenario that satisfies T is explicitly SIMULABLE_CONDITIONAL and no terminal or ambiguous state is promoted');

-- 246
select is((select pg_catalog.count(*) from auth_db_013_resource_mode_register),5::bigint,'simulation resource contract contains exactly five canonical resource modes');

-- 247
select is((select pg_catalog.array_agg(mode order by mode)::text from auth_db_013_resource_mode_register),ARRAY['AUTHORIZED_REAL_REFERENCE','MASKED_REAL_RESOURCE','RESOURCE_DRAFT','SYNTHETIC_RESOURCE','UNRESOLVED']::text[]::text,'five simulation resource modes are frozen exactly without permissive fallback');

-- 248
with current_counts(table_name,row_count) as (
  values
    ('public.context_simulation_sessions',(select pg_catalog.count(*) from public.context_simulation_sessions)),
    ('public.app_permissions',(select pg_catalog.count(*) from public.app_permissions)),
    ('public.role_permissions',(select pg_catalog.count(*) from public.role_permissions)),
    ('public.employee_permissions',(select pg_catalog.count(*) from public.employee_permissions)),
    ('public.operational_role_permissions',(select pg_catalog.count(*) from public.operational_role_permissions)),
    ('public.role_capabilities',(select pg_catalog.count(*) from public.role_capabilities)),
    ('public.employee_shifts',(select pg_catalog.count(*) from public.employee_shifts)),
    ('public.attendance_logs',(select pg_catalog.count(*) from public.attendance_logs))
)
select is((select pg_catalog.count(*) from current_counts c join auth_db_013_business_baseline b using(table_name) where c.row_count <> b.row_count),0::bigint,'AUTH-DB-013 simulation audit tests produce zero row-count side effects across legacy authority, shift and attendance business tables');

-- 249
select matches(pg_temp.auth_db_013_explain($$select simulation_id from audit.authorization_simulations where real_actor_id='AUTH-DB-013-ACTOR-1' order by created_at desc, simulation_id desc limit 10$$),'ix_authorization_simulations_actor_time','planner can use ix_authorization_simulations_actor_time for governed actor/time audit lookup');

-- 250
select matches(pg_temp.auth_db_013_explain($$select simulated_decision_id from audit.authorization_simulation_evaluations where permission_key='nexo.inventory.stock.view' order by evaluated_at desc, simulated_decision_id desc limit 10$$),'ix_authorization_simulation_evaluations_permission_time','planner can use ix_authorization_simulation_evaluations_permission_time for governed permission/time audit lookup');

-- 251
select is((select pg_catalog.count(*) from auth_db_013_checkin_state_register),5::bigint,'AUTH-SIM-005 check-in contract contains exactly five hypothetical states');

-- 252
select is((select pg_catalog.array_agg(state_code order by state_code)::text from auth_db_013_checkin_state_register),ARRAY['ABSENT','ACTIVE_HYPOTHETICAL','CLOSED_HYPOTHETICAL','INVALID_HYPOTHETICAL','NOT_APPLICABLE']::text[]::text,'the five AUTH-SIM-005 check-in states are frozen exactly without fallback to real attendance');

select * from finish();
rollback;
