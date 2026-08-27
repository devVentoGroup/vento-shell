-- VENTO_DB_TEST_CATEGORY: RPC
begin;

create extension if not exists pgtap with schema extensions;

insert into auth.users (id, email)
values
  ('a0030000-0000-0000-0000-000000000001', 'auth-db-003-owner@test.local'),
  ('a0030000-0000-0000-0000-000000000002', 'auth-db-003-global@test.local'),
  ('a0030000-0000-0000-0000-000000000003', 'auth-db-003-manager@test.local'),
  ('a0030000-0000-0000-0000-000000000004', 'auth-db-003-cashier@test.local'),
  ('a0030000-0000-0000-0000-000000000005', 'auth-db-003-outsider@test.local')
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
    'a0030000-0000-0000-0000-000000000001',
    'AUTH DB 003 Owner',
    'auth-db-003-owner@test.local',
    'client',
    true,
    0,
    true
  ),
  (
    'a0030000-0000-0000-0000-000000000002',
    'AUTH DB 003 Global Manager',
    'auth-db-003-global@test.local',
    'client',
    true,
    0,
    true
  ),
  (
    'a0030000-0000-0000-0000-000000000003',
    'AUTH DB 003 Manager',
    'auth-db-003-manager@test.local',
    'client',
    true,
    0,
    true
  ),
  (
    'a0030000-0000-0000-0000-000000000004',
    'AUTH DB 003 Cashier',
    'auth-db-003-cashier@test.local',
    'client',
    true,
    0,
    true
  ),
  (
    'a0030000-0000-0000-0000-000000000005',
    'AUTH DB 003 Outsider',
    'auth-db-003-outsider@test.local',
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
values (
  'a0031000-0000-0000-0000-000000000001',
  'AUTH_DB_003_SITE_A',
  'AUTH DB 003 Site A',
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
    'a0030000-0000-0000-0000-000000000001',
    'a0031000-0000-0000-0000-000000000001',
    'propietario',
    'AUTH DB 003 Owner',
    true
  ),
  (
    'a0030000-0000-0000-0000-000000000002',
    'a0031000-0000-0000-0000-000000000001',
    'gerente_general',
    'AUTH DB 003 Global Manager',
    true
  ),
  (
    'a0030000-0000-0000-0000-000000000003',
    'a0031000-0000-0000-0000-000000000001',
    'gerente',
    'AUTH DB 003 Manager',
    true
  ),
  (
    'a0030000-0000-0000-0000-000000000004',
    'a0031000-0000-0000-0000-000000000001',
    'cajero',
    'AUTH DB 003 Cashier',
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
    'a0030000-0000-0000-0000-000000000001',
    'a0031000-0000-0000-0000-000000000001',
    true,
    true
  ),
  (
    'a0030000-0000-0000-0000-000000000002',
    'a0031000-0000-0000-0000-000000000001',
    true,
    true
  ),
  (
    'a0030000-0000-0000-0000-000000000003',
    'a0031000-0000-0000-0000-000000000001',
    true,
    true
  ),
  (
    'a0030000-0000-0000-0000-000000000004',
    'a0031000-0000-0000-0000-000000000001',
    true,
    true
  )
on conflict (employee_id, site_id) do nothing;

select plan(34);

select is(
  (
    select count(*)
    from pg_catalog.pg_proc p
    join pg_catalog.pg_namespace n
      on n.oid = p.pronamespace
    where n.nspname in (
      'app_private',
      'club',
      'pass',
      'public',
      'talento',
      'vital'
    )
  ),
  348::bigint,
  'governed function universe remains 348'
);

select is(
  (
    select count(*)
    from pg_catalog.pg_proc p
    join pg_catalog.pg_namespace n
      on n.oid = p.pronamespace
    where n.nspname in (
      'app_private',
      'club',
      'pass',
      'public',
      'talento',
      'vital'
    )
      and p.prosecdef
  ),
  203::bigint,
  'SECURITY DEFINER total reduced by exactly eight'
);

select is(
  (
    select count(*)
    from pg_catalog.pg_proc p
    join pg_catalog.pg_namespace n
      on n.oid = p.pronamespace
    where n.nspname in (
      'app_private',
      'club',
      'pass',
      'public',
      'talento'
    )
      and p.prosecdef
  ),
  198::bigint,
  'Vento SECURITY DEFINER total is 198'
);

select is(
  (
    select count(*)
    from pg_catalog.pg_proc p
    join pg_catalog.pg_namespace n
      on n.oid = p.pronamespace
    where n.nspname = 'vital'
      and p.prosecdef
  ),
  5::bigint,
  'VITAL SECURITY DEFINER boundary remains untouched'
);

select is(
  (
    select count(*)
    from pg_catalog.pg_proc p
    join pg_catalog.pg_namespace n
      on n.oid = p.pronamespace
    where n.nspname in (
      'app_private',
      'club',
      'pass',
      'public',
      'talento',
      'vital'
    )
      and p.prosecdef
      and p.prorettype <> 'trigger'::regtype
  ),
  171::bigint,
  'direct SECURITY DEFINER total reduced by eight'
);

select is(
  (
    select count(*)
    from pg_catalog.pg_proc p
    join pg_catalog.pg_namespace n
      on n.oid = p.pronamespace
    where n.nspname in (
      'app_private',
      'club',
      'pass',
      'public',
      'talento',
      'vital'
    )
      and p.prosecdef
      and p.prorettype = 'trigger'::regtype
  ),
  32::bigint,
  'trigger SECURITY DEFINER cohort remains 32'
);

select is(
  (
    select count(*)
    from pg_catalog.pg_proc p
    join pg_catalog.pg_namespace n
      on n.oid = p.pronamespace
    where n.nspname in (
      'app_private',
      'club',
      'pass',
      'public',
      'talento'
    )
      and p.prosecdef
      and p.prorettype = 'trigger'::regtype
      and exists (
        select 1
        from pg_catalog.pg_trigger t
        where t.tgfoid = p.oid
          and not t.tgisinternal
      )
  ),
  30::bigint,
  'thirty privileged trigger functions remain live'
);

select is(
  (
    select count(*)
    from pg_catalog.pg_proc p
    join pg_catalog.pg_namespace n
      on n.oid = p.pronamespace
    where n.nspname in (
      'app_private',
      'club',
      'pass',
      'public',
      'talento'
    )
      and p.prosecdef
      and p.prorettype = 'trigger'::regtype
      and not exists (
        select 1
        from pg_catalog.pg_trigger t
        where t.tgfoid = p.oid
          and not t.tgisinternal
      )
  ),
  2::bigint,
  'two canonical orphan trigger functions remain pending retirement'
);

select is(
  (
    select count(*)
    from pg_catalog.pg_proc p
    join pg_catalog.pg_namespace n
      on n.oid = p.pronamespace
    where n.nspname in (
      'app_private',
      'club',
      'pass',
      'public',
      'talento',
      'vital'
    )
      and p.prosecdef
      and has_function_privilege(
        'anon',
        p.oid,
        'EXECUTE'
      )
  ),
  38::bigint,
  'anon effective SECURITY DEFINER exposure drops by eight'
);

select is(
  (
    select count(*)
    from pg_catalog.pg_proc p
    join pg_catalog.pg_namespace n
      on n.oid = p.pronamespace
    where n.nspname in (
      'app_private',
      'club',
      'pass',
      'public',
      'talento',
      'vital'
    )
      and p.prosecdef
      and has_function_privilege(
        'authenticated',
        p.oid,
        'EXECUTE'
      )
  ),
  144::bigint,
  'authenticated effective SECURITY DEFINER exposure drops by eight'
);

select is(
  (
    select count(*)
    from pg_catalog.pg_proc p
    join pg_catalog.pg_namespace n
      on n.oid = p.pronamespace
    where n.nspname in (
      'app_private',
      'club',
      'pass',
      'public',
      'talento',
      'vital'
    )
      and p.prosecdef
      and coalesce(array_to_string(p.proconfig, ','), '')
        like '%row_security=off%'
  ),
  7::bigint,
  'row_security off remains only on seven unresolved privileged cores'
);

with expected(signature, body_md5) as (
  values
    (
      'public.can_access_recipe_scope(p_site_id uuid, p_area_id uuid)',
      'a43d76af47c6e3f2c10fcb504cab4803'
    ),
    (
      'public.current_employee_area_id()',
      '96dc4c7b968dd4525510b9c66c59f7a4'
    ),
    (
      'public.current_employee_site_id()',
      '2e478f29e06c7bafb9214a17d384a028'
    ),
    (
      'public.is_active_staff()',
      '96927b1f831a1e97b006b9ea2d25cc6c'
    ),
    (
      'public.is_global_manager()',
      'bd7997fcfba09712e790ae3c9213890b'
    ),
    (
      'public.is_manager()',
      'c64498e4160030d5115b43e9c18a4dec'
    ),
    (
      'public.is_manager_or_owner()',
      '25f4a2af9ba3f056e95091413fc5a43d'
    ),
    (
      'public.is_owner()',
      'd67bd14c118d7b7e6fa1e1575215855d'
    )
)
select is(
  (
    select count(*)
    from expected e
    join pg_catalog.pg_proc p
      on format(
        '%I.%I(%s)',
        (
          select n.nspname
          from pg_catalog.pg_namespace n
          where n.oid = p.pronamespace
        ),
        p.proname,
        pg_get_function_identity_arguments(p.oid)
      ) = e.signature
    where not p.prosecdef
  ),
  8::bigint,
  'exactly eight approved wrappers are SECURITY INVOKER'
);

with expected(signature) as (
  values
    ('public.can_access_recipe_scope(p_site_id uuid, p_area_id uuid)'),
    ('public.current_employee_area_id()'),
    ('public.current_employee_site_id()'),
    ('public.is_active_staff()'),
    ('public.is_global_manager()'),
    ('public.is_manager()'),
    ('public.is_manager_or_owner()'),
    ('public.is_owner()')
)
select is(
  (
    select count(*)
    from expected e
    join pg_catalog.pg_proc p
      on format(
        '%I.%I(%s)',
        (
          select n.nspname
          from pg_catalog.pg_namespace n
          where n.oid = p.pronamespace
        ),
        p.proname,
        pg_get_function_identity_arguments(p.oid)
      ) = e.signature
    where coalesce(array_to_string(p.proconfig, ','), '')
      = 'search_path=public'
  ),
  8::bigint,
  'converted wrappers retain only explicit public search_path'
);

with expected(signature, body_md5) as (
  values
    (
      'public.can_access_recipe_scope(p_site_id uuid, p_area_id uuid)',
      'a43d76af47c6e3f2c10fcb504cab4803'
    ),
    (
      'public.current_employee_area_id()',
      '96dc4c7b968dd4525510b9c66c59f7a4'
    ),
    (
      'public.current_employee_site_id()',
      '2e478f29e06c7bafb9214a17d384a028'
    ),
    (
      'public.is_active_staff()',
      '96927b1f831a1e97b006b9ea2d25cc6c'
    ),
    (
      'public.is_global_manager()',
      'bd7997fcfba09712e790ae3c9213890b'
    ),
    (
      'public.is_manager()',
      'c64498e4160030d5115b43e9c18a4dec'
    ),
    (
      'public.is_manager_or_owner()',
      '25f4a2af9ba3f056e95091413fc5a43d'
    ),
    (
      'public.is_owner()',
      'd67bd14c118d7b7e6fa1e1575215855d'
    )
)
select is(
  (
    select count(*)
    from expected e
    join pg_catalog.pg_proc p
      on format(
        '%I.%I(%s)',
        (
          select n.nspname
          from pg_catalog.pg_namespace n
          where n.oid = p.pronamespace
        ),
        p.proname,
        pg_get_function_identity_arguments(p.oid)
      ) = e.signature
    where md5(
      replace(
        p.prosrc,
        E'\r\n',
        E'\n'
      )
    ) = e.body_md5
  ),
  8::bigint,
  'converted wrapper bodies are byte-semantically preserved'
);

with expected(signature) as (
  values
    ('public.can_access_recipe_scope(p_site_id uuid, p_area_id uuid)'),
    ('public.current_employee_area_id()'),
    ('public.current_employee_site_id()'),
    ('public.is_active_staff()'),
    ('public.is_global_manager()'),
    ('public.is_manager()'),
    ('public.is_manager_or_owner()'),
    ('public.is_owner()')
)
select is(
  (
    select count(*)
    from expected e
    join pg_catalog.pg_proc p
      on format(
        '%I.%I(%s)',
        (
          select n.nspname
          from pg_catalog.pg_namespace n
          where n.oid = p.pronamespace
        ),
        p.proname,
        pg_get_function_identity_arguments(p.oid)
      ) = e.signature
    where has_function_privilege('anon', p.oid, 'EXECUTE')
      and has_function_privilege(
        'authenticated',
        p.oid,
        'EXECUTE'
      )
      and has_function_privilege(
        'service_role',
        p.oid,
        'EXECUTE'
      )
  ),
  8::bigint,
  'converted wrappers preserve existing effective EXECUTE audiences'
);

select is(
  (
    select count(*)
    from pg_catalog.pg_proc p
    join pg_catalog.pg_namespace n
      on n.oid = p.pronamespace
    where n.nspname = 'public'
      and p.proname in (
        'notify_shift_published',
        'update_loyalty_balance'
      )
      and p.prosecdef
      and p.prorettype = 'trigger'::regtype
      and not exists (
        select 1
        from pg_catalog.pg_trigger t
        where t.tgfoid = p.oid
          and not t.tgisinternal
      )
  ),
  2::bigint,
  'RETIRE dispositions are recorded but not executed without zero-consumer gate'
);

select is(
  (
    select count(*)
    from pg_catalog.pg_proc p
    join pg_catalog.pg_namespace n
      on n.oid = p.pronamespace
    where n.nspname = 'public'
      and p.proname =
        'viso_enforce_monthly_schedule_publish_limit'
      and p.prosecdef
      and exists (
        select 1
        from pg_catalog.pg_trigger t
        where t.tgfoid = p.oid
          and not t.tgisinternal
      )
  ),
  1::bigint,
  'VISO monthly guard remains blocked and unchanged'
);

select is(
  (
    select
      (
        select count(*)
        from pg_catalog.pg_proc p
        join pg_catalog.pg_namespace n
          on n.oid = p.pronamespace
        where n.nspname in (
          'app_private',
          'club',
          'pass',
          'public',
          'talento'
        )
          and p.prosecdef
      )
      +
      (
        select count(*)
        from pg_catalog.pg_proc p
        join pg_catalog.pg_namespace n
          on n.oid = p.pronamespace
        where n.nspname = 'public'
          and p.proname in (
            'can_access_recipe_scope',
            'current_employee_area_id',
            'current_employee_site_id',
            'is_active_staff',
            'is_global_manager',
            'is_manager',
            'is_manager_or_owner',
            'is_owner'
          )
          and not p.prosecdef
      )
  ),
  206::bigint,
  'original Vento hardening universe reconstructs to 206'
);

set local role authenticated;
set local request.jwt.claim.sub =
  'a0030000-0000-0000-0000-000000000001';

select is(
  public.is_owner(),
  true,
  'owner remains recognized through invoker wrapper'
);

select is(
  public.is_manager_or_owner(),
  true,
  'owner remains inside manager-or-owner contract'
);

select is(
  public.can_access_recipe_scope(
    null::uuid,
    null::uuid
  ),
  true,
  'owner retains recipe scope through delegated core'
);

reset role;

set local role authenticated;
set local request.jwt.claim.sub =
  'a0030000-0000-0000-0000-000000000002';

select is(
  public.is_global_manager(),
  true,
  'global manager remains recognized'
);

select is(
  public.is_manager_or_owner(),
  true,
  'global manager remains inside manager-or-owner contract'
);

select is(
  public.is_owner(),
  false,
  'global manager is not promoted to owner'
);

reset role;

set local role authenticated;
set local request.jwt.claim.sub =
  'a0030000-0000-0000-0000-000000000003';

select is(
  public.is_manager(),
  true,
  'site manager remains recognized'
);

select is(
  public.is_manager_or_owner(),
  true,
  'site manager remains inside manager-or-owner contract'
);

select is(
  public.is_owner(),
  false,
  'site manager is not promoted to owner'
);

reset role;

set local role authenticated;
set local request.jwt.claim.sub =
  'a0030000-0000-0000-0000-000000000004';

select is(
  public.is_active_staff(),
  true,
  'active cashier remains recognized as active staff'
);

select is(
  public.is_manager_or_owner(),
  false,
  'cashier is not promoted to management'
);

select is(
  public.current_employee_site_id(),
  'a0031000-0000-0000-0000-000000000001'::uuid,
  'current employee site wrapper preserves delegated result'
);

select is(
  public.current_employee_area_id(),
  null::uuid,
  'current employee area wrapper preserves null area'
);

select is(
  public.can_access_recipe_scope(
    null::uuid,
    null::uuid
  ),
  false,
  'cashier receives no recipe scope without site and area'
);

reset role;

set local role authenticated;
set local request.jwt.claim.sub =
  'a0030000-0000-0000-0000-000000000005';

select is(
  public.is_active_staff(),
  false,
  'authenticated user without employee identity is not active staff'
);

select is(
  public.is_owner(),
  false,
  'authenticated user without employee identity is not owner'
);

reset role;

select * from finish();
rollback;
