-- Reconcile stale staff invitations with already-active employee accounts.
-- This keeps ANIMA/VISO pending invitation lists clean when a worker used
-- password recovery or another auth path instead of the original invite link.

create or replace function public.reconcile_staff_invitations()
returns table(accepted_count integer, expired_count integer)
language plpgsql
security definer
set search_path = public, auth
as $$
declare
  v_actor_role text;
  v_actor_site_id uuid;
  v_is_global_manager boolean;
begin
  select e.role, e.site_id
    into v_actor_role, v_actor_site_id
  from public.employees e
  where e.id = auth.uid()
    and e.is_active is distinct from false;

  if v_actor_role is null
     or v_actor_role <> any (array['propietario', 'gerente_general', 'gerente']) then
    raise exception 'Forbidden' using errcode = '42501';
  end if;

  v_is_global_manager := v_actor_role = any (array['propietario', 'gerente_general']);

  with expired_rows as (
    update public.staff_invitations si
       set status = 'expired',
           expired_at = coalesce(si.expired_at, si.expires_at, now()),
           updated_at = now(),
           metadata = coalesce(si.metadata, '{}'::jsonb)
             || jsonb_build_object(
               'reconciled_by', auth.uid(),
               'reconciled_reason', 'invite_expired'
             )
     where si.status = 'sent'
       and coalesce(si.expires_at, si.expired_at) is not null
       and coalesce(si.expires_at, si.expired_at) < now()
       and (
         v_is_global_manager
         or coalesce(si.site_id, si.staff_site_id) = v_actor_site_id
       )
     returning si.id
  ),
  matched_active_employee as (
    select distinct on (si.id)
      si.id as invitation_id,
      e.id as employee_id
    from public.staff_invitations si
    join public.employees e
      on e.is_active is distinct from false
     and (
       si.auth_user_id = e.id
       or si.employee_id = e.id
       or exists (
         select 1
         from public.users u
         where u.id = e.id
           and si.email is not null
           and lower(u.email) = lower(si.email)
       )
     )
    where si.status in ('sent', 'expired')
      and (
        v_is_global_manager
        or coalesce(si.site_id, si.staff_site_id) = v_actor_site_id
      )
    order by si.id, e.updated_at desc nulls last, e.joined_at desc nulls last
  ),
  accepted_rows as (
    update public.staff_invitations si
       set status = 'accepted',
           accepted_at = coalesce(si.accepted_at, now()),
           auth_user_id = coalesce(si.auth_user_id, m.employee_id),
           employee_id = coalesce(si.employee_id, m.employee_id),
           updated_at = now(),
           metadata = coalesce(si.metadata, '{}'::jsonb)
             || jsonb_build_object(
               'reconciled_by', auth.uid(),
               'reconciled_reason', 'active_employee_exists'
             )
      from matched_active_employee m
     where si.id = m.invitation_id
     returning si.id
  )
  select
    (select count(*)::integer from accepted_rows),
    (select count(*)::integer from expired_rows)
  into accepted_count, expired_count;

  return next;
end;
$$;

revoke all on function public.reconcile_staff_invitations() from public;
grant execute on function public.reconcile_staff_invitations() to authenticated;
