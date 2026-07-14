create table public.product_request_policies (
  id uuid primary key default gen_random_uuid(),
  product_id uuid not null references public.products(id) on delete cascade,
  label text not null,
  request_unit_code text not null,
  base_unit_code text not null references public.inventory_units(code),
  base_qty_per_request_unit numeric not null,
  constraint_mode text not null default 'free',
  minimum_request_qty numeric null,
  request_step_qty numeric null