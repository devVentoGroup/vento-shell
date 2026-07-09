begin;

-- Shells can ask for operational context before Supabase has attached the
-- authenticated role to the PostgREST request. RLS has no anon policies on
-- these tables, so anon still receives zero rows; this only avoids 42501 noise.
grant select on table public.employee_shifts to anon;
grant select on table public.sites to anon;

commit;
