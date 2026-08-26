-- Contrato inicial y portable de políticas de solicitud.
-- Las validaciones que requieren consultar otras tablas se instalan después como trigger.

create table public.product_request_policies (
  id uuid primary key default gen_random_uuid(),
  product_id uuid not null references public.products(id) on delete cascade,
  label text not null,
  request_unit_code text not null,
  base_unit_code text not null references public.inventory_units(code),
  base_qty_per_request_unit numeric not null check (base_qty_per_request_unit > 0),
  constraint_mode text not null default 'free' check (constraint_mode in ('free', 'strict_multiple', 'preferred_multiple')),
  minimum_request_qty numeric null check (minimum_request_qty is null or minimum_request_qty > 0),
  request_step_qty numeric null check (request_step_qty is null or request_step_qty > 0),
  allow_fraction boolean not null default false,
  is_default boolean not null default false,
  is_active boolean not null default true,
  policy_kind text not null default 'base_unit' check (policy_kind in ('base_unit', 'logical_group', 'physical_presentation', 'actual_quantity')),
  physical_uom_profile_id uuid null references public.product_uom_profiles(id) on delete restrict,
  source text not null default 'manual' check (source in ('manual', 'migration', 'system', 'uom_profile', 'supplier_primary', 'recipe_portion')),
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now(),
  created_by uuid null references auth.users(id) on delete set null,
  version_number integer not null default 1 check (version_number > 0),
  supersedes_policy_id uuid null references public.product_request_policies(id) on delete restrict,
  change_reason text null,
  constraint product_request_policy_physical_kind_check check ((policy_kind = 'physical_presentation' and physical_uom_profile_id is not null) or (policy_kind <> 'physical_presentation' and physical_uom_profile_id is null)),
  constraint product_request_policy_base_kind_check check (policy_kind <> 'base_unit' or (request_unit_code = base_unit_code and base_qty_per_request_unit = 1))
);

create unique index product_request_policies_one_active_default_idx on public.product_request_policies(product_id) where is_active and is_default;
create unique index product_request_policies_active_label_idx on public.product_request_policies(product_id, lower(btrim(label))) where is_active;
create index product_request_policies_product_idx on public.product_request_policies(product_id, is_active);
