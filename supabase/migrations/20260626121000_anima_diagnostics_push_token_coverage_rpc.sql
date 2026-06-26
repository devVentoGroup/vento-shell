begin;

create or replace function public.anima_diagnostic_push_token_coverage()
returns table (
  employee_id uuid,
  full_name text,
  alias text,
  role text,
  site_id uuid,
  site_name text,
  has_active_token boolean,
  active_token_count bigint,
  latest_token_at timestamptz
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
    e.id as employee_id,
    e.full_name,
    e.alias,
    e.role,
    e.site_id,
    s.name as site_name,
    coalesce(count(t.id) filter (where t.is_active = true), 0) > 0 as has_active_token,
    coalesce(count(t.id) filter (where t.is_active = true), 0) as active_token_count,
    max(coalesce(t.last_seen, t.updated_at, t.created_at)) as latest_token_at
  from public.employees e
  left join public.sites s on s.id = e.site_id
  left join public.employee_push_tokens t on t.employee_id = e.id
  where e.is_active = true
  group by e.id, e.full_name, e.alias, e.role, e.site_id, s.name
  order by has_active_token asc, e.full_name asc nulls last;
end;
$function$;

revoke all on function public.anima_diagnostic_push_token_coverage() from public;
revoke all on function public.anima_diagnostic_push_token_coverage() from anon;
grant execute on function public.anima_diagnostic_push_token_coverage() to authenticated;

commit;
