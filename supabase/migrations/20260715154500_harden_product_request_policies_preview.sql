alter table public.product_request_policies
  add column if not exists version_number integer not null default 1,
  add column if not exists supersedes_policy_id uuid null,
  add column if not exists change_reason text null;

do $$
begin
  if not exists (
    select 1 from pg_constraint
    where conrelid = 'public.product_request_policies'::regclass
      and conname = 'product_request_policies_version_positive_chk'
  ) then
    alter table public.product_request_policies
      add constraint product_request_policies_version_positive_chk
      check (version_number > 0);
  end if;

  if not exists (
    select 1 from pg_constraint
    where conrelid = '