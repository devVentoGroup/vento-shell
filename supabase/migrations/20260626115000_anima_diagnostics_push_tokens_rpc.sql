begin;

create or replace function public.anima_diagnostic_employee_push_tokens(
  p_employee_id uuid
)
returns table (
  id uuid,
  employee_id uuid,
  platform text,
  device_id text,
  is_active boolean,
  last_seen timestamptz,
  created_at timestamptz,
  updated_at timestamptz,
  token_preview text
)
language plpgsql
stable
security definer
set search_path to 'public', 'auth'
as $function$
declare
  v_requester_email text;
begin
  select lower(btrim(u.email))
    into v_requester_email
  from auth.users u
  where u.id = auth.uid();

  if v_requester_email not in (
    'carlosaaibarra@gmail.com',
    'nathalia@ventocafe.com'
  ) then
    raise exception 'not authorized';
  end if;

  return query
  select
    t.id,
    t.employee_id,
    t.platform,
    t.device_id,
    t.is_active,
    t.last_seen,
    t.created_at,
    t.updated_at,
    case
      when t.token is null then null
      when length(t.token) <= 12 then repeat('*', length(t.token))
      else left(t.token, 8) || '...' || right(t.token, 6)
    end as token_preview
  from public.employee_push_tokens t
  where t.employee_id = p_employee_id
  order by t.updated_at desc nulls last, t.created_at desc;
end;
$function$;

revoke all on function public.anima_diagnostic_employee_push_tokens(uuid) from public;
revoke all on function public.anima_diagnostic_employee_push_tokens(uuid) from anon;
grant execute on function public.anima_diagnostic_employee_push_tokens(uuid) to authenticated;

commit;
