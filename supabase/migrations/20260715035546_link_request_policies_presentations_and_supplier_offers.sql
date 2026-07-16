create table if not exists public.product_request_policy_presentations (
  request_policy_id uuid not null references public.product_request_policies(id) on delete cascade,
  uom_profile_id uuid not null references public.product_uom_profiles(id) on delete cascade,
  is_preferred boolean not null default false,
  allow_substitution boolean not null default true,
  priority integer not null default 100,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now(),
  primary key (request_policy_id, uom_profile_id),
  constraint product_request_policy_presentations_priority_chk check (priority >= 0)
);

create index if not exists product_request_policy_presentations_uom_idx
  on public.product_request_policy_presentations(uom_profile_id);

alter table public.product_suppliers
  add column if not exists uom_profile_id uuid null references public.product_uom_profiles(id) on delete set null;

create index if not exists product_suppliers_uom_profile_idx
  on public.product_suppliers(uom_profile_id)
  where uom_profile_id is not null;

alter table public.product_request_policy_presentations enable row level security;

create policy product_request_policy_presentations_select_staff
on public.product_request_policy_presentations
for select
to authenticated
using (
  is_employee()
  or current_shared_device_can_access_nexo_remission_catalog(
    (select prp.product_id from public.product_request_policies prp where prp.id = request_policy_id)
  )
);

create policy product_request_policy_presentations_insert_catalog
on public.product_request_policy_presentations
for insert
to authenticated
with check (
  has_permission('nexo.catalog.products'::text)
  or is_owner()
  or is_global_manager()
);

create policy product_request_policy_presentations_update_catalog
on public.product_request_policy_presentations
for update
to authenticated
using (
  has_permission('nexo.catalog.products'::text)
  or is_owner()
  or is_global_manager()
)
with check (
  has_permission('nexo.catalog.products'::text)
  or is_owner()
  or is_global_manager()
);

create policy product_request_policy_presentations_delete_catalog
on public.product_request_policy_presentations
for delete
to authenticated
using (
  has_permission('nexo.catalog.products'::text)
  or is_owner()
  or is_global_manager()
);

insert into public.product_request_policy_presentations (
  request_policy_id,
  uom_profile_id,
  is_preferred,
  allow_substitution,
  priority
)
select
  prp.id,
  prp.physical_uom_profile_id,
  true,
  true,
  0
from public.product_request_policies prp
where prp.physical_uom_profile_id is not null
on conflict (request_policy_id, uom_profile_id) do update
set is_preferred = excluded.is_preferred,
    priority = excluded.priority,
    updated_at = now();