-- VENTO_DB_TEST_CATEGORY: RLS
begin;

create extension if not exists pgtap with schema extensions;

insert into auth.users (id, email)
values
  ('a0020000-0000-0000-0000-000000000001', 'auth-db-002-client@test.local'),
  ('a0020000-0000-0000-0000-000000000002', 'auth-db-002-cashier@test.local'),
  ('a0020000-0000-0000-0000-000000000003', 'auth-db-002-manager@test.local'),
  ('a0020000-0000-0000-0000-000000000004', 'auth-db-002-owner@test.local'),
  ('a0020000-0000-0000-0000-000000000005', 'auth-db-002-peer@test.local')
on conflict (id) do nothing;

insert into public.users (
  id,
  full_name,
  email,
  role,
  is_active,
  loyalty_points,
  is_client
)
values
  (
    'a0020000-0000-0000-0000-000000000001',
    'AUTH DB 002 Client',
    'auth-db-002-client@test.local',
    'client',
    true,
    0,
    true
  ),
  (
    'a0020000-0000-0000-0000-000000000002',
    'AUTH DB 002 Cashier',
    'auth-db-002-cashier@test.local',
    'client',
    true,
    0,
    true
  ),
  (
    'a0020000-0000-0000-0000-000000000003',
    'AUTH DB 002 Manager',
    'auth-db-002-manager@test.local',
    'client',
    true,
    0,
    true
  ),
  (
    'a0020000-0000-0000-0000-000000000004',
    'AUTH DB 002 Owner',
    'auth-db-002-owner@test.local',
    'client',
    true,
    0,
    true
  ),
  (
    'a0020000-0000-0000-0000-000000000005',
    'AUTH DB 002 Peer',
    'auth-db-002-peer@test.local',
    'client',
    true,
    0,
    true
  )
on conflict (id) do update
set
  full_name = excluded.full_name,
  email = excluded.email,
  role = excluded.role,
  is_active = excluded.is_active,
  loyalty_points = excluded.loyalty_points,
  is_client = excluded.is_client;

insert into public.sites (
  id,
  code,
  name,
  type,
  site_kind,
  is_active
)
values
  (
    'a0021000-0000-0000-0000-000000000001',
    'AUTH_DB_002_SITE_A',
    'AUTH DB 002 Site A',
    'satellite',
    'satellite',
    true
  ),
  (
    'a0021000-0000-0000-0000-000000000002',
    'AUTH_DB_002_SITE_B',
    'AUTH DB 002 Site B',
    'satellite',
    'satellite',
    true
  );

insert into public.employees (
  id,
  site_id,
  role,
  full_name,
  is_active
)
values
  (
    'a0020000-0000-0000-0000-000000000002',
    'a0021000-0000-0000-0000-000000000001',
    'cajero',
    'AUTH DB 002 Cashier',
    true
  ),
  (
    'a0020000-0000-0000-0000-000000000003',
    'a0021000-0000-0000-0000-000000000001',
    'gerente',
    'AUTH DB 002 Manager',
    true
  ),
  (
    'a0020000-0000-0000-0000-000000000004',
    'a0021000-0000-0000-0000-000000000001',
    'propietario',
    'AUTH DB 002 Owner',
    true
  ),
  (
    'a0020000-0000-0000-0000-000000000005',
    'a0021000-0000-0000-0000-000000000001',
    'cajero',
    'AUTH DB 002 Peer',
    true
  );

insert into public.employee_sites (
  employee_id,
  site_id,
  is_primary,
  is_active
)
values
  (
    'a0020000-0000-0000-0000-000000000002',
    'a0021000-0000-0000-0000-000000000001',
    true,
    true
  ),
  (
    'a0020000-0000-0000-0000-000000000003',
    'a0021000-0000-0000-0000-000000000001',
    true,
    true
  ),
  (
    'a0020000-0000-0000-0000-000000000004',
    'a0021000-0000-0000-0000-000000000001',
    true,
    true
  ),
  (
    'a0020000-0000-0000-0000-000000000005',
    'a0021000-0000-0000-0000-000000000001',
    true,
    true
  )
on conflict (employee_id, site_id) do nothing;

insert into public.documents (
  id,
  scope,
  owner_employee_id,
  target_employee_id,
  site_id,
  title,
  storage_path,
  file_name
)
values
  (
    'a0022000-0000-0000-0000-000000000001',
    'employee',
    'a0020000-0000-0000-0000-000000000002',
    'a0020000-0000-0000-0000-000000000002',
    'a0021000-0000-0000-0000-000000000001',
    'AUTH DB 002 own document',
    'auth-db-002/cashier/own.pdf',
    'own.pdf'
  ),
  (
    'a0022000-0000-0000-0000-000000000002',
    'employee',
    'a0020000-0000-0000-0000-000000000005',
    'a0020000-0000-0000-0000-000000000005',
    'a0021000-0000-0000-0000-000000000001',
    'AUTH DB 002 peer document',
    'auth-db-002/peer/private.pdf',
    'private.pdf'
  );

-- AUTH-DB-002 test-only parent fixture for storage.objects FK.
-- Transactional: this row is rolled back with the pgTAP test.
insert into storage.buckets (
  id,
  name,
  public
)
values (
  'documents',
  'documents',
  true
)
on conflict (id) do nothing;

insert into storage.objects (
  id,
  bucket_id,
  name
)
values
  (
    'a0023000-0000-0000-0000-000000000001',
    'documents',
    'auth-db-002/cashier/own.pdf'
  ),
  (
    'a0023000-0000-0000-0000-000000000002',
    'documents',
    'auth-db-002/peer/private.pdf'
  );

insert into pass.loyalty_rewards (
  id,
  code,
  name,
  points_cost,
  site_id
)
values
  (
    'a0024000-0000-0000-0000-000000000001',
    'AUTH_DB_002_REWARD_A',
    'AUTH DB 002 Reward A',
    10,
    'a0021000-0000-0000-0000-000000000001'
  ),
  (
    'a0024000-0000-0000-0000-000000000002',
    'AUTH_DB_002_REWARD_B',
    'AUTH DB 002 Reward B',
    10,
    'a0021000-0000-0000-0000-000000000002'
  );

insert into pass.loyalty_redemptions (
  id,
  user_id,
  reward_id,
  points_spent,
  status
)
values
  (
    'a0025000-0000-0000-0000-000000000001',
    'a0020000-0000-0000-0000-000000000005',
    'a0024000-0000-0000-0000-000000000001',
    10,
    'pending'
  ),
  (
    'a0025000-0000-0000-0000-000000000002',
    'a0020000-0000-0000-0000-000000000005',
    'a0024000-0000-0000-0000-000000000002',
    10,
    'pending'
  );

select plan(40);

select ok(
  not exists (
    select 1
    from pg_catalog.pg_policies
    where schemaname = 'public'
      and tablename = 'users'
      and policyname = 'users_update_self'
  ),
  'users_update_self is removed'
);

select ok(
  not exists (
    select 1
    from pg_catalog.pg_policies
    where schemaname = 'public'
      and tablename = 'users'
      and policyname = 'staff_select_all_users'
  ),
  'staff_select_all_users is removed'
);

select ok(
  not exists (
    select 1
    from pg_catalog.pg_policies
    where schemaname = 'public'
      and tablename = 'users'
      and policyname = 'users_select_cashier'
  ),
  'users_select_cashier is removed'
);

select ok(
  not exists (
    select 1
    from pg_catalog.pg_policies
    where schemaname = 'public'
      and tablename = 'users'
      and policyname = 'users_select_cashier_for_qr'
  ),
  'users_select_cashier_for_qr is removed'
);

select ok(
  not exists (
    select 1
    from pg_catalog.pg_policies
    where schemaname = 'pass'
      and tablename = 'loyalty_transactions'
      and policyname = 'Users can insert their own transactions'
  ),
  'client loyalty ledger insert policy is removed'
);

select ok(
  not exists (
    select 1
    from pg_catalog.pg_policies
    where schemaname = 'pass'
      and tablename = 'loyalty_redemptions'
      and policyname = 'staff_select_all_redemptions'
  ),
  'broad redemption select policy is removed'
);

select ok(
  not exists (
    select 1
    from pg_catalog.pg_policies
    where schemaname = 'pass'
      and tablename = 'loyalty_redemptions'
      and policyname = 'staff_validate_redemptions'
  ),
  'broad redemption update policy is removed'
);

select ok(
  not exists (
    select 1
    from pg_catalog.pg_policies
    where schemaname = 'public'
      and tablename = 'purchase_orders'
      and policyname = 'employees_crud_purchase_orders'
  ),
  'generic employee purchase order CRUD policy is removed'
);

select ok(
  not exists (
    select 1
    from pg_catalog.pg_policies
    where schemaname = 'public'
      and tablename = 'orders'
      and policyname = 'orders_update_staff'
  ),
  'generic order staff update policy is removed'
);

select ok(
  not exists (
    select 1
    from pg_catalog.pg_policies
    where schemaname = 'public'
      and tablename = 'order_items'
      and policyname = 'order_items_update_staff'
  ),
  'generic order item staff update policy is removed'
);

select ok(
  exists (
    select 1
    from pg_catalog.pg_policies
    where schemaname = 'public'
      and tablename = 'documents'
      and policyname = 'documents_select_self_or_permission'
      and cmd = 'SELECT'
      and roles::text = '{authenticated}'
  ),
  'hardened documents policy exists'
);

select ok(
  exists (
    select 1
    from pg_catalog.pg_policies
    where schemaname = 'public'
      and tablename = 'documents'
      and policyname = 'documents_select_self_or_permission'
      and position(
        'es.employee_id = auth.uid()'
        in coalesce(qual, '')
      ) = 0
  ),
  'documents policy has no naked same-site branch'
);

select ok(
  exists (
    select 1
    from pg_catalog.pg_policies
    where schemaname = 'public'
      and tablename = 'documents'
      and policyname = 'documents_select_self_or_permission'
      and position('owner_employee_id = auth.uid()' in coalesce(qual, '')) > 0
      and position('target_employee_id = auth.uid()' in coalesce(qual, '')) > 0
      and position('anima.documents.view_all' in coalesce(qual, '')) > 0
      and position('viso.staff.documents.manage' in coalesce(qual, '')) > 0
      and position('anima.documents.upload' in coalesce(qual, '')) > 0
  ),
  'documents self and explicit permission branches are retained'
);

select ok(
  exists (
    select 1
    from pg_catalog.pg_policies
    where schemaname = 'storage'
      and tablename = 'objects'
      and policyname = 'documents_select_visible'
      and cmd = 'SELECT'
      and roles::text = '{authenticated}'
  ),
  'hardened document storage policy exists'
);

select ok(
  exists (
    select 1
    from pg_catalog.pg_policies
    where schemaname = 'storage'
      and tablename = 'objects'
      and policyname = 'documents_select_visible'
      and position(
        'es.employee_id = auth.uid()'
        in coalesce(qual, '')
      ) = 0
  ),
  'document storage policy has no naked same-site branch'
);

select ok(
  exists (
    select 1
    from pg_catalog.pg_policies
    where schemaname = 'storage'
      and tablename = 'objects'
      and policyname = 'documents_select_visible'
      and position('owner_employee_id = auth.uid()' in coalesce(qual, '')) > 0
      and position('target_employee_id = auth.uid()' in coalesce(qual, '')) > 0
      and position('anima.documents.view_all' in coalesce(qual, '')) > 0
      and position('viso.staff.documents.manage' in coalesce(qual, '')) > 0
      and position('anima.documents.upload' in coalesce(qual, '')) > 0
  ),
  'storage self and explicit permission branches are retained'
);

select ok(
  exists (
    select 1
    from pg_catalog.pg_policies
    where schemaname = 'public'
      and tablename = 'document_types'
      and policyname = 'document_types_write_admin'
      and cmd = 'ALL'
      and roles::text = '{authenticated}'
      and position(
        'gerente'
        in coalesce(qual, '') || ' ' || coalesce(with_check, '')
      ) = 0
  ),
  'document types admin policy excludes gerente'
);

select ok(
  exists (
    select 1
    from pg_catalog.pg_policies
    where schemaname = 'public'
      and tablename = 'required_document_rules'
      and policyname = 'required_document_rules_insert'
      and cmd = 'INSERT'
      and position('gerente' in coalesce(with_check, '')) = 0
  ),
  'required document insert excludes gerente'
);

select ok(
  exists (
    select 1
    from pg_catalog.pg_policies
    where schemaname = 'public'
      and tablename = 'required_document_rules'
      and policyname = 'required_document_rules_update'
      and cmd = 'UPDATE'
      and position(
        'gerente'
        in coalesce(qual, '') || ' ' || coalesce(with_check, '')
      ) = 0
  ),
  'required document update excludes gerente'
);

select ok(
  exists (
    select 1
    from pg_catalog.pg_policies
    where schemaname = 'public'
      and tablename = 'required_document_rules'
      and policyname = 'required_document_rules_delete'
      and cmd = 'DELETE'
      and position('gerente' in coalesce(qual, '')) = 0
  ),
  'required document delete excludes gerente'
);

select ok(
  exists (
    select 1
    from pg_catalog.pg_policies
    where schemaname = 'pass'
      and tablename = 'loyalty_redemptions'
      and policyname = 'loyalty_redemptions_select_cashier'
      and cmd = 'SELECT'
  ),
  'site-scoped cashier redemption select remains'
);

select ok(
  exists (
    select 1
    from pg_catalog.pg_policies
    where schemaname = 'pass'
      and tablename = 'loyalty_redemptions'
      and policyname = 'loyalty_redemptions_validate_cashier'
      and cmd = 'UPDATE'
  ),
  'site-scoped cashier redemption update remains'
);

set local role authenticated;
set local request.jwt.claim.sub = 'a0020000-0000-0000-0000-000000000001';

select is(
  (
    select count(*)
    from public.users
    where id = 'a0020000-0000-0000-0000-000000000001'
  ),
  1::bigint,
  'client sees own public.users row'
);

select is(
  (
    select count(*)
    from public.users
    where id = 'a0020000-0000-0000-0000-000000000005'
  ),
  0::bigint,
  'client cannot see foreign public.users row'
);

update public.users
set loyalty_points = 999999
where id = 'a0020000-0000-0000-0000-000000000001';

reset role;

select is(
  (
    select loyalty_points
    from public.users
    where id = 'a0020000-0000-0000-0000-000000000001'
  ),
  0,
  'client cannot update protected own-row fields'
);

set local role authenticated;
set local request.jwt.claim.sub = 'a0020000-0000-0000-0000-000000000001';

select throws_ok(
  $$
    insert into pass.loyalty_transactions (
      user_id,
      kind,
      points_delta,
      description
    )
    values (
      'a0020000-0000-0000-0000-000000000001',
      'earn',
      50,
      'AUTH DB 002 forbidden direct insert'
    )
  $$,
  '42501',
  'new row violates row-level security policy for table "loyalty_transactions"',
  'client cannot insert loyalty ledger directly'
);

reset role;

select is(
  (
    select loyalty_points
    from public.users
    where id = 'a0020000-0000-0000-0000-000000000001'
  ),
  0,
  'failed direct ledger insert does not alter loyalty balance'
);

set local role authenticated;
set local request.jwt.claim.sub = 'a0020000-0000-0000-0000-000000000002';

select ok(
  not public.has_permission('anima.documents.view_all')
  and not public.has_permission('viso.staff.documents.manage')
  and not public.has_permission(
    'anima.documents.upload',
    'a0021000-0000-0000-0000-000000000001'
  ),
  'cashier fixture has no broad document permission'
);

select is(
  (select count(*) from public.users),
  1::bigint,
  'cashier cannot enumerate customer rows'
);

select is(
  (
    select count(*)
    from pass.loyalty_redemptions
    where id = 'a0025000-0000-0000-0000-000000000001'
  ),
  1::bigint,
  'cashier sees redemption in authorized site'
);

select is(
  (
    select count(*)
    from pass.loyalty_redemptions
    where id = 'a0025000-0000-0000-0000-000000000002'
  ),
  0::bigint,
  'cashier cannot see redemption in foreign site'
);

update pass.loyalty_redemptions
set status = 'validated'
where id = 'a0025000-0000-0000-0000-000000000001';

update pass.loyalty_redemptions
set status = 'validated'
where id = 'a0025000-0000-0000-0000-000000000002';

reset role;

select is(
  (
    select status
    from pass.loyalty_redemptions
    where id = 'a0025000-0000-0000-0000-000000000001'
  ),
  'validated',
  'cashier validates same-site redemption'
);

select is(
  (
    select status
    from pass.loyalty_redemptions
    where id = 'a0025000-0000-0000-0000-000000000002'
  ),
  'pending',
  'cashier cannot validate foreign-site redemption'
);

set local role authenticated;
set local request.jwt.claim.sub = 'a0020000-0000-0000-0000-000000000002';

select is(
  (
    select count(*)
    from public.documents
    where id = 'a0022000-0000-0000-0000-000000000002'
  ),
  0::bigint,
  'same-site membership alone cannot read peer document'
);

select is(
  (
    select count(*)
    from public.documents
    where id = 'a0022000-0000-0000-0000-000000000001'
  ),
  1::bigint,
  'own document remains visible'
);

select is(
  (
    select count(*)
    from storage.objects
    where id = 'a0023000-0000-0000-0000-000000000002'
  ),
  0::bigint,
  'knowing peer storage path does not grant access'
);

select is(
  (
    select count(*)
    from storage.objects
    where id = 'a0023000-0000-0000-0000-000000000001'
  ),
  1::bigint,
  'own document storage object remains visible'
);

reset role;

set local role authenticated;
set local request.jwt.claim.sub = 'a0020000-0000-0000-0000-000000000003';

select throws_ok(
  $$
    insert into public.document_types (
      id,
      name
    )
    values (
      'a0026000-0000-0000-0000-000000000002',
      'AUTH DB 002 Manager Forbidden'
    )
  $$,
  '42501',
  'new row violates row-level security policy for table "document_types"',
  'site manager cannot administer global document types by role alone'
);

reset role;

set local role authenticated;
set local request.jwt.claim.sub = 'a0020000-0000-0000-0000-000000000004';

select lives_ok(
  $$
    insert into public.document_types (
      id,
      name
    )
    values (
      'a0026000-0000-0000-0000-000000000001',
      'AUTH DB 002 Owner Allowed'
    )
  $$,
  'owner retains approved document type administration'
);

select lives_ok(
  $$
    insert into public.required_document_rules (
      id,
      document_type_id,
      is_required,
      active
    )
    values (
      'a0027000-0000-0000-0000-000000000001',
      'a0026000-0000-0000-0000-000000000001',
      true,
      true
    )
  $$,
  'owner retains approved required document rule administration'
);

reset role;

select * from finish();
rollback;
