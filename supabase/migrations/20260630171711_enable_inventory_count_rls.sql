begin;

alter table public.inventory_count_sessions enable row level security;
alter table public.inventory_count_lines enable row level security;

drop policy if exists "inventory_count_sessions_select_permission"
  on public.inventory_count_sessions;
create policy "inventory_count_sessions_select_permission"
  on public.inventory_count_sessions
  for select
  to authenticated
  using (public.has_permission('nexo.inventory.counts', site_id));

drop policy if exists "inventory_count_sessions_write_permission"
  on public.inventory_count_sessions;
create policy "inventory_count_sessions_write_permission"
  on public.inventory_count_sessions
  for all
  to authenticated
  using (public.has_permission('nexo.inventory.counts', site_id))
  with check (public.has_permission('nexo.inventory.counts', site_id));

drop policy if exists "inventory_count_lines_select_permission"
  on public.inventory_count_lines;
create policy "inventory_count_lines_select_permission"
  on public.inventory_count_lines
  for select
  to authenticated
  using (
    exists (
      select 1
      from public.inventory_count_sessions session
      where session.id = inventory_count_lines.session_id
        and public.has_permission('nexo.inventory.counts', session.site_id)
    )
  );

drop policy if exists "inventory_count_lines_write_permission"
  on public.inventory_count_lines;
create policy "inventory_count_lines_write_permission"
  on public.inventory_count_lines
  for all
  to authenticated
  using (
    exists (
      select 1
      from public.inventory_count_sessions session
      where session.id = inventory_count_lines.session_id
        and public.has_permission('nexo.inventory.counts', session.site_id)
    )
  )
  with check (
    exists (
      select 1
      from public.inventory_count_sessions session
      where session.id = inventory_count_lines.session_id
        and public.has_permission('nexo.inventory.counts', session.site_id)
    )
  );

commit;
