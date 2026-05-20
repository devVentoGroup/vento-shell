begin;

-- Replace broad legacy document table policies with the permission-scoped set.
drop policy if exists "documents_select" on public.documents;
drop policy if exists "documents_insert" on public.documents;
drop policy if exists "documents_delete" on public.documents;
drop policy if exists "documents_update_owner" on public.documents;
drop policy if exists "documents_update_review" on public.documents;
drop policy if exists "documents_update_gerente_by_target_employee" on public.documents;

-- The documents storage bucket previously allowed any authenticated user to
-- select/insert/update/delete any object in the bucket. Client uploads happen
-- before the public.documents row exists, so inserts are constrained to a
-- per-user prefix. Reads are constrained to visible document records.
drop policy if exists "INSERT_AUTH flreew_0" on storage.objects;
drop policy if exists "SELECT_AUTH flreew_0" on storage.objects;
drop policy if exists "documents_insert" on storage.objects;
drop policy if exists "documents_update" on storage.objects;
drop policy if exists "documents_delete" on storage.objects;
drop policy if exists "documents_select_visible" on storage.objects;
drop policy if exists "documents_insert_own_prefix" on storage.objects;
drop policy if exists "documents_update_owned_or_managed" on storage.objects;
drop policy if exists "documents_delete_owned_or_managed" on storage.objects;

create policy "documents_select_visible"
on storage.objects
for select
to authenticated
using (
  bucket_id = 'documents'
  and exists (
    select 1
    from public.documents d
    where d.storage_path = storage.objects.name
      and (
        d.owner_employee_id = auth.uid()
        or d.target_employee_id = auth.uid()
        or public.has_permission('anima.documents.view_all')
        or public.has_permission('viso.staff.documents.manage')
        or (
          d.site_id is not null
          and exists (
            select 1
            from public.employee_sites es
            where es.employee_id = auth.uid()
              and es.site_id = d.site_id
              and es.is_active = true
          )
        )
        or exists (
          select 1
          from public.employee_sites target_site
          where target_site.employee_id = d.target_employee_id
            and target_site.is_active = true
            and public.has_permission('anima.documents.upload', target_site.site_id)
        )
      )
  )
);

create policy "documents_insert_own_prefix"
on storage.objects
for insert
to authenticated
with check (
  bucket_id = 'documents'
  and auth.uid() is not null
  and name like auth.uid()::text || '/%'
);

create policy "documents_update_owned_or_managed"
on storage.objects
for update
to authenticated
using (
  bucket_id = 'documents'
  and (
    name like auth.uid()::text || '/%'
    or exists (
      select 1
      from public.documents d
      where d.storage_path = storage.objects.name
        and (
          public.has_permission('viso.staff.documents.manage')
          or public.has_permission('anima.documents.upload', d.site_id)
          or exists (
            select 1
            from public.employee_sites target_site
            where target_site.employee_id = d.target_employee_id
              and target_site.is_active = true
              and public.has_permission('anima.documents.upload', target_site.site_id)
          )
        )
    )
  )
)
with check (
  bucket_id = 'documents'
  and (
    name like auth.uid()::text || '/%'
    or exists (
      select 1
      from public.documents d
      where d.storage_path = storage.objects.name
        and (
          public.has_permission('viso.staff.documents.manage')
          or public.has_permission('anima.documents.upload', d.site_id)
          or exists (
            select 1
            from public.employee_sites target_site
            where target_site.employee_id = d.target_employee_id
              and target_site.is_active = true
              and public.has_permission('anima.documents.upload', target_site.site_id)
          )
        )
    )
  )
);

create policy "documents_delete_owned_or_managed"
on storage.objects
for delete
to authenticated
using (
  bucket_id = 'documents'
  and (
    name like auth.uid()::text || '/%'
    or exists (
      select 1
      from public.documents d
      where d.storage_path = storage.objects.name
        and (
          public.has_permission('viso.staff.documents.manage')
          or public.has_permission('anima.documents.delete', d.site_id)
          or exists (
            select 1
            from public.employee_sites target_site
            where target_site.employee_id = d.target_employee_id
              and target_site.is_active = true
              and public.has_permission('anima.documents.delete', target_site.site_id)
          )
        )
    )
  )
);

-- Scope wallet-card visibility and mutations for managers to their assigned
-- sites instead of every wallet card in the company.
drop policy if exists "employee_wallet_cards_insert" on public.employee_wallet_cards;
drop policy if exists "employee_wallet_cards_select" on public.employee_wallet_cards;
drop policy if exists "employee_wallet_cards_update" on public.employee_wallet_cards;

create policy "employee_wallet_cards_select_scoped"
on public.employee_wallet_cards
for select
to authenticated
using (
  employee_id = auth.uid()
  or public.is_owner()
  or public.is_global_manager()
  or exists (
    select 1
    from public.employee_sites manager_site
    join public.employee_sites target_site
      on target_site.site_id = manager_site.site_id
     and target_site.employee_id = employee_wallet_cards.employee_id
     and target_site.is_active = true
    where manager_site.employee_id = auth.uid()
      and manager_site.is_active = true
      and public.current_employee_role() = 'gerente'
  )
);

create policy "employee_wallet_cards_insert_scoped"
on public.employee_wallet_cards
for insert
to authenticated
with check (
  public.is_owner()
  or public.is_global_manager()
  or exists (
    select 1
    from public.employee_sites manager_site
    join public.employee_sites target_site
      on target_site.site_id = manager_site.site_id
     and target_site.employee_id = employee_wallet_cards.employee_id
     and target_site.is_active = true
    where manager_site.employee_id = auth.uid()
      and manager_site.is_active = true
      and public.current_employee_role() = 'gerente'
  )
);

create policy "employee_wallet_cards_update_scoped"
on public.employee_wallet_cards
for update
to authenticated
using (
  public.is_owner()
  or public.is_global_manager()
  or exists (
    select 1
    from public.employee_sites manager_site
    join public.employee_sites target_site
      on target_site.site_id = manager_site.site_id
     and target_site.employee_id = employee_wallet_cards.employee_id
     and target_site.is_active = true
    where manager_site.employee_id = auth.uid()
      and manager_site.is_active = true
      and public.current_employee_role() = 'gerente'
  )
)
with check (
  public.is_owner()
  or public.is_global_manager()
  or exists (
    select 1
    from public.employee_sites manager_site
    join public.employee_sites target_site
      on target_site.site_id = manager_site.site_id
     and target_site.employee_id = employee_wallet_cards.employee_id
     and target_site.is_active = true
    where manager_site.employee_id = auth.uid()
      and manager_site.is_active = true
      and public.current_employee_role() = 'gerente'
  )
);

commit;
