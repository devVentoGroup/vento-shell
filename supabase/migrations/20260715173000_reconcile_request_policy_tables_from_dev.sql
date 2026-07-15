-- Reproduce en Git el contrato efectivo de políticas de solicitud existente en vento-os-dev.
-- Idempotente: no modifica datos históricos ni vuelve a sembrar políticas.

create table if not exists public.product_request_policies (
  id uuid primary key default gen_random_uuid(),
  product_id uuid not null references public.products(id) on delete cascade,
  label text not null,
  request_unit_code text not null,
  base_unit_code text not null references public.inventory_units(code),
  base_qty_per_request_unit numeric not null,
  constraint_mode text not null default 'free',
  minimum_request_qty numeric null,
  request_step_qty numeric null,
  allow_fraction boolean not null default false,
  is_default boolean not null default false,
  is_active boolean not null default true,
  policy_kind text not null default 'base_unit',
  physical_uom_profile_id uuid null references public.product_uom_profiles(id) on delete restrict,
  source text not null default 'manual',
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now(),
  created_by uuid null references auth.users(id) on delete set null,
  version_number integer not null default 1,
  supersedes_policy_id uuid null references public.product_request_policies(id) on delete restrict,
  change_reason text null
);

alter table public.product_request_policies
  add column if not exists allow_fraction boolean not null default false,
  add column if not exists is_default boolean not null default false,
  add column if not exists is_active boolean not null default true,
  add column if not exists policy_kind text not null default 'base_unit',
  add column if not exists physical_uom_profile_id uuid null,
  add column if not exists source text not null default 'manual',
  add column if not exists created_at timestamptz not null default now(),
  add column if not exists updated_at timestamptz not null default now(),
  add column if not exists created_by uuid null,
  add column if not exists version_number integer not null default 1,
  add column if not exists supersedes_policy_id uuid null,
  add column if not exists change_reason text null;

create table if not exists public.product_request_policy_presentations (
  request_policy_id uuid not null references public.product_request_policies(id) on delete cascade,
  uom_profile_id uuid not null references public.product_uom_profiles(id) on delete cascade,
  is_preferred boolean not null default false,
  allow_substitution boolean not null default true,
  priority integer not null default 100 check (priority >= 0),
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now(),
  primary key (request_policy_id, uom_profile_id)
);

alter table public.restock_request_items
  add column if not exists request_policy_id uuid null references public.product_request_policies(id) on delete restrict,
  add column if not exists request_policy_kind text null,
  add column if not exists request_policy_label text null,
  add column if not exists requested_policy_qty numeric null,
  add column if not exists request_unit_code text null,
  add column if not exists base_qty_per_request_unit numeric null,
  add column if not exists request_constraint_mode text null,
  add column if not exists request_minimum_qty numeric null,
  add column if not exists request_step_qty numeric null,
  add column if not exists request_allow_fraction boolean null;

create unique index if not exists product_request_policies_one_active_default_idx
  on public.product_request_policies(product_id)
  where is_active and is_default;

create unique index if not exists product_request_policies_active_label_idx
  on public.product_request_policies(product_id, lower(btrim(label)))
  where is_active;

create index if not exists product_request_policies_product_idx
  on public.product_request_policies(product_id, is_active);

create index if not exists product_request_policies_physical_uom_idx
  on public.product_request_policies(physical_uom_profile_id)
  where physical_uom_profile_id is not null;

create index if not exists product_request_policies_supersedes_idx
  on public.product_request_policies(supersedes_policy_id)
  where supersedes_policy_id is not null;

create index if not exists product_request_policy_presentations_uom_idx
  on public.product_request_policy_presentations(uom_profile_id);

comment on table public.product_request_policies is
  'Define cómo se solicita un producto sin convertir agrupaciones lógicas en inventario físico.';
comment on table public.product_request_policy_presentations is
  'Relaciona una política de solicitud con presentaciones físicas compatibles, sin alterar existencias.';