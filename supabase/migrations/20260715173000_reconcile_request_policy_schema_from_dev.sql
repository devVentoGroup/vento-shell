-- Reconciliación del dominio de políticas de solicitud con vento-os-dev.
-- Esta migración es idempotente y no reescribe historial operativo.

create table if not exists public.product_request_policies (
  id uuid primary key default gen_random_uuid(),
  product_id uuid not null references public.products(id) on delete cascade,
  label text not null,
  request_unit