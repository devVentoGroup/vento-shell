-- AUTH-DB-002::GLOBAL
-- Forward-only RLS hardening for the exact approved policy universe.
-- No grants, functions, buckets, data, historical migrations or unrelated policies are modified.

do $auth_db_002_precheck$
declare
  v_count bigint;
  v_md5 text;
  v_document_policy_present boolean;
  v_document_types_rls boolean;
  v_document_types_force boolean;
begin
  with target(schemaname, tablename, policyname) as (
    values
      ('public', 'users', 'users_update_self'),
      ('public', 'users', 'staff_select_all_users'),
      ('public', 'users', 'users_select_cashier'),
      ('public', 'users', 'users_select_cashier_for_qr'),
      ('public', 'users', 'users_select_self'),
      ('pass', 'loyalty_transactions', 'Users can insert their own transactions'),
      ('pass', 'loyalty_redemptions', 'staff_select_all_redemptions'),
      ('pass', 'loyalty_redemptions', 'staff_validate_redemptions'),
      ('pass', 'loyalty_redemptions', 'loyalty_redemptions_select_cashier'),
      ('pass', 'loyalty_redemptions', 'loyalty_redemptions_validate_cashier'),
      ('pass', 'loyalty_redemptions', 'loyalty_redemptions_select_own'),
      ('public', 'purchase_orders', 'employees_crud_purchase_orders'),
      ('public', 'orders', 'orders_update_staff'),
      ('public', 'order_items', 'order_items_update_staff'),
      ('public', 'documents', 'documents_select_self_or_permission'),
      ('storage', 'objects', 'documents_select_visible'),
      ('public', 'document_types', 'document_types_write_admin'),
      ('public', 'required_document_rules', 'required_document_rules_insert'),
      ('public', 'required_document_rules', 'required_document_rules_update'),
      ('public', 'required_document_rules', 'required_document_rules_delete')
  ),
  policy_rows as (
    select
      p.schemaname,
      p.tablename,
      p.policyname,
      p.permissive,
      p.roles::text as roles_text,
      p.cmd,
      coalesce(p.qual, '') as qual_text,
      coalesce(p.with_check, '') as check_text
    from pg_catalog.pg_policies p
    join target t
      using (schemaname, tablename, policyname)
    order by p.schemaname, p.tablename, p.policyname
  )
  select
    count(*),
    md5(
      coalesce(
        string_agg(
          schemaname || '|' ||
          tablename || '|' ||
          policyname || '|' ||
          permissive || '|' ||
          roles_text || '|' ||
          cmd || '|' ||
          qual_text || '|' ||
          check_text,
          E'\n'
          order by schemaname, tablename, policyname
        ),
        ''
      )
    )
  into v_count, v_md5
  from policy_rows;

  if to_regclass('public.document_types') is null then
    raise exception
      'AUTH_DB_002_PRECONDITION_FAILED: public.document_types does not exist';
  end if;

  select exists (
    select 1
    from pg_catalog.pg_policies
    where schemaname = 'public'
      and tablename = 'document_types'
      and policyname = 'document_types_write_admin'
  )
  into v_document_policy_present;

  select
    c.relrowsecurity,
    c.relforcerowsecurity
  into
    v_document_types_rls,
    v_document_types_force
  from pg_catalog.pg_class c
  join pg_catalog.pg_namespace n
    on n.oid = c.relnamespace
  where n.nspname = 'public'
    and c.relname = 'document_types'
    and c.relkind = 'r';

  if v_document_types_force is distinct from false then
    raise exception
      'AUTH_DB_002_PRECONDITION_FAILED: public.document_types FORCE RLS changed';
  end if;

  if v_count = 20 then
    if v_md5 <> 'bbde94326ddde8fb0cd0fd5ad1475914' then
      raise exception
        'AUTH_DB_002_PRECONDITION_FAILED: hosted snapshot md5 % does not match expected',
        coalesce(v_md5, 'NULL');
    end if;

    if not v_document_policy_present then
      raise exception
        'AUTH_DB_002_PRECONDITION_FAILED: hosted baseline missing document_types_write_admin';
    end if;

    if v_document_types_rls is distinct from true then
      raise exception
        'AUTH_DB_002_PRECONDITION_FAILED: hosted baseline document_types RLS is not enabled';
    end if;

  elsif v_count = 19 then
    if v_md5 <> '9fb866b9bbd27e8db75e0b1af3300e12' then
      raise exception
        'AUTH_DB_002_PRECONDITION_FAILED: reproducible snapshot md5 % does not match expected',
        coalesce(v_md5, 'NULL');
    end if;

    if v_document_policy_present then
      raise exception
        'AUTH_DB_002_PRECONDITION_FAILED: reproducible baseline unexpectedly contains document_types_write_admin';
    end if;

    if v_document_types_rls is distinct from false then
      raise exception
        'AUTH_DB_002_PRECONDITION_FAILED: reproducible baseline document_types RLS is not disabled';
    end if;

  else
    raise exception
      'AUTH_DB_002_PRECONDITION_FAILED: expected hosted 20-policy or reproducible 19-policy baseline, observed %',
      v_count;
  end if;
end
$auth_db_002_precheck$;

alter table public.document_types enable row level security;

drop policy users_update_self
on public.users;

drop policy staff_select_all_users
on public.users;

drop policy users_select_cashier
on public.users;

drop policy users_select_cashier_for_qr
on public.users;

drop policy "Users can insert their own transactions"
on pass.loyalty_transactions;

drop policy staff_select_all_redemptions
on pass.loyalty_redemptions;

drop policy staff_validate_redemptions
on pass.loyalty_redemptions;

drop policy employees_crud_purchase_orders
on public.purchase_orders;

drop policy orders_update_staff
on public.orders;

drop policy order_items_update_staff
on public.order_items;

drop policy documents_select_self_or_permission
on public.documents;

create policy documents_select_self_or_permission
on public.documents
for select
to authenticated
using (
  owner_employee_id = auth.uid()
  or target_employee_id = auth.uid()
  or public.has_permission('anima.documents.view_all')
  or public.has_permission('viso.staff.documents.manage')
  or exists (
    select 1
    from public.employee_sites target_site
    where target_site.employee_id = documents.target_employee_id
      and target_site.is_active = true
      and public.has_permission(
        'anima.documents.upload',
        target_site.site_id
      )
  )
);

drop policy documents_select_visible
on storage.objects;

create policy documents_select_visible
on storage.objects
for select
to authenticated
using (
  bucket_id = 'documents'
  and exists (
    select 1
    from public.documents d
    where d.storage_path = objects.name
      and (
        d.owner_employee_id = auth.uid()
        or d.target_employee_id = auth.uid()
        or public.has_permission('anima.documents.view_all')
        or public.has_permission('viso.staff.documents.manage')
        or exists (
          select 1
          from public.employee_sites target_site
          where target_site.employee_id = d.target_employee_id
            and target_site.is_active = true
            and public.has_permission(
              'anima.documents.upload',
              target_site.site_id
            )
        )
      )
  )
);

drop policy if exists document_types_write_admin
on public.document_types;

create policy document_types_write_admin
on public.document_types
for all
to authenticated
using (
  public.is_owner()
  or public.is_global_manager()
)
with check (
  public.is_owner()
  or public.is_global_manager()
);

drop policy required_document_rules_insert
on public.required_document_rules;

create policy required_document_rules_insert
on public.required_document_rules
for insert
to authenticated
with check (
  public.is_owner()
  or public.is_global_manager()
);

drop policy required_document_rules_update
on public.required_document_rules;

create policy required_document_rules_update
on public.required_document_rules
for update
to authenticated
using (
  public.is_owner()
  or public.is_global_manager()
)
with check (
  public.is_owner()
  or public.is_global_manager()
);

drop policy required_document_rules_delete
on public.required_document_rules;

create policy required_document_rules_delete
on public.required_document_rules
for delete
to authenticated
using (
  public.is_owner()
  or public.is_global_manager()
);

do $auth_db_002_postcheck$
declare
  v_count bigint;
begin
  select count(*)
  into v_count
  from pg_catalog.pg_policies p
  where
    (p.schemaname = 'public' and p.tablename = 'users' and p.policyname in (
      'users_update_self',
      'staff_select_all_users',
      'users_select_cashier',
      'users_select_cashier_for_qr'
    ))
    or
    (p.schemaname = 'pass' and p.tablename = 'loyalty_transactions'
      and p.policyname = 'Users can insert their own transactions')
    or
    (p.schemaname = 'pass' and p.tablename = 'loyalty_redemptions'
      and p.policyname in (
        'staff_select_all_redemptions',
        'staff_validate_redemptions'
      ))
    or
    (p.schemaname = 'public' and p.tablename = 'purchase_orders'
      and p.policyname = 'employees_crud_purchase_orders')
    or
    (p.schemaname = 'public' and p.tablename = 'orders'
      and p.policyname = 'orders_update_staff')
    or
    (p.schemaname = 'public' and p.tablename = 'order_items'
      and p.policyname = 'order_items_update_staff');

  if v_count <> 0 then
    raise exception
      'AUTH_DB_002_POSTCHECK_FAILED: % broad policies remain',
      v_count;
  end if;

  with expected(schemaname, tablename, policyname, cmd) as (
    values
      ('public', 'documents', 'documents_select_self_or_permission', 'SELECT'),
      ('storage', 'objects', 'documents_select_visible', 'SELECT'),
      ('public', 'document_types', 'document_types_write_admin', 'ALL'),
      ('public', 'required_document_rules', 'required_document_rules_insert', 'INSERT'),
      ('public', 'required_document_rules', 'required_document_rules_update', 'UPDATE'),
      ('public', 'required_document_rules', 'required_document_rules_delete', 'DELETE')
  )
  select count(*)
  into v_count
  from expected e
  join pg_catalog.pg_policies p
    on p.schemaname = e.schemaname
   and p.tablename = e.tablename
   and p.policyname = e.policyname
   and p.cmd = e.cmd
  where p.roles::text = '{authenticated}';

  if v_count <> 6 then
    raise exception
      'AUTH_DB_002_POSTCHECK_FAILED: expected 6 hardened policies, observed %',
      v_count;
  end if;

  if exists (
    select 1
    from pg_catalog.pg_policies p
    where p.schemaname = 'public'
      and p.tablename = 'documents'
      and p.policyname = 'documents_select_self_or_permission'
      and position(
        'es.employee_id = auth.uid()'
        in coalesce(p.qual, '')
      ) > 0
  ) then
    raise exception
      'AUTH_DB_002_POSTCHECK_FAILED: naked same-site document branch remains';
  end if;

  if not exists (
    select 1
    from pg_catalog.pg_policies p
    where p.schemaname = 'public'
      and p.tablename = 'documents'
      and p.policyname = 'documents_select_self_or_permission'
      and position('owner_employee_id = auth.uid()' in coalesce(p.qual, '')) > 0
      and position('target_employee_id = auth.uid()' in coalesce(p.qual, '')) > 0
      and position('anima.documents.view_all' in coalesce(p.qual, '')) > 0
      and position('viso.staff.documents.manage' in coalesce(p.qual, '')) > 0
      and position('anima.documents.upload' in coalesce(p.qual, '')) > 0
  ) then
    raise exception
      'AUTH_DB_002_POSTCHECK_FAILED: approved document branches not preserved';
  end if;

  if exists (
    select 1
    from pg_catalog.pg_policies p
    where p.schemaname = 'storage'
      and p.tablename = 'objects'
      and p.policyname = 'documents_select_visible'
      and position(
        'es.employee_id = auth.uid()'
        in coalesce(p.qual, '')
      ) > 0
  ) then
    raise exception
      'AUTH_DB_002_POSTCHECK_FAILED: naked same-site storage branch remains';
  end if;

  if not exists (
    select 1
    from pg_catalog.pg_policies p
    where p.schemaname = 'storage'
      and p.tablename = 'objects'
      and p.policyname = 'documents_select_visible'
      and position('owner_employee_id = auth.uid()' in coalesce(p.qual, '')) > 0
      and position('target_employee_id = auth.uid()' in coalesce(p.qual, '')) > 0
      and position('anima.documents.view_all' in coalesce(p.qual, '')) > 0
      and position('viso.staff.documents.manage' in coalesce(p.qual, '')) > 0
      and position('anima.documents.upload' in coalesce(p.qual, '')) > 0
  ) then
    raise exception
      'AUTH_DB_002_POSTCHECK_FAILED: approved storage branches not preserved';
  end if;

  if exists (
    select 1
    from pg_catalog.pg_policies p
    where
      (
        p.schemaname = 'public'
        and p.tablename = 'document_types'
        and p.policyname = 'document_types_write_admin'
      )
      or
      (
        p.schemaname = 'public'
        and p.tablename = 'required_document_rules'
        and p.policyname in (
          'required_document_rules_insert',
          'required_document_rules_update',
          'required_document_rules_delete'
        )
      )
    group by
      p.schemaname,
      p.tablename,
      p.policyname,
      p.qual,
      p.with_check
    having position(
      'gerente'
      in coalesce(p.qual, '') || ' ' || coalesce(p.with_check, '')
    ) > 0
  ) then
    raise exception
      'AUTH_DB_002_POSTCHECK_FAILED: gerente remains in global admin RLS';
  end if;

  select count(*)
  into v_count
  from pg_catalog.pg_policies p
  where
    (
      p.schemaname = 'public'
      and p.tablename = 'users'
      and p.policyname = 'users_select_self'
    )
    or
    (
      p.schemaname = 'pass'
      and p.tablename = 'loyalty_redemptions'
      and p.policyname in (
        'loyalty_redemptions_select_cashier',
        'loyalty_redemptions_validate_cashier',
        'loyalty_redemptions_select_own'
      )
    );

  if v_count <> 4 then
    raise exception
      'AUTH_DB_002_POSTCHECK_FAILED: positive dependency policies changed; observed %',
      v_count;
  end if;
end
$auth_db_002_postcheck$;

do $auth_db_002_document_types_rls_postcheck$
declare
  v_rls boolean;
  v_force boolean;
  v_policy_count integer;
begin
  select
    c.relrowsecurity,
    c.relforcerowsecurity
  into
    v_rls,
    v_force
  from pg_catalog.pg_class c
  join pg_catalog.pg_namespace n
    on n.oid = c.relnamespace
  where n.nspname = 'public'
    and c.relname = 'document_types'
    and c.relkind = 'r';

  if v_rls is distinct from true then
    raise exception
      'AUTH_DB_002_POSTCONDITION_FAILED: public.document_types RLS is not enabled';
  end if;

  if v_force is distinct from false then
    raise exception
      'AUTH_DB_002_POSTCONDITION_FAILED: public.document_types FORCE RLS changed';
  end if;

  select count(*)
  into v_policy_count
  from pg_catalog.pg_policies p
  where p.schemaname = 'public'
    and p.tablename = 'document_types'
    and p.policyname = 'document_types_write_admin'
    and p.cmd = 'ALL'
    and p.roles::text = '{authenticated}'
    and position(
      'is_owner()'
      in coalesce(p.qual, '') || ' ' || coalesce(p.with_check, '')
    ) > 0
    and position(
      'is_global_manager()'
      in coalesce(p.qual, '') || ' ' || coalesce(p.with_check, '')
    ) > 0
    and position(
      'gerente'
      in coalesce(p.qual, '') || ' ' || coalesce(p.with_check, '')
    ) = 0;

  if v_policy_count <> 1 then
    raise exception
      'AUTH_DB_002_POSTCONDITION_FAILED: document_types_write_admin hardened policy mismatch count=%',
      v_policy_count;
  end if;
end
$auth_db_002_document_types_rls_postcheck$;
