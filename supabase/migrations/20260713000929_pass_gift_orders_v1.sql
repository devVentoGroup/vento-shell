-- Respaldo canónico de la migración aplicada directamente en Supabase.
-- Proyecto: vento-os-dev (clzdpinthhtknkmefsxx)
-- Versión remota: 20260713000929
-- Nombre remoto: pass_gift_orders_v1

alter table public.orders
  add column if not exists is_gift boolean not null default false;

create table if not exists public.order_gift_details (
  id uuid primary key default gen_random_uuid(),
  order_id uuid not null unique references public.orders(id) on delete cascade,
  purchaser_id uuid not null references auth.users(id) on delete restrict,
  saved_recipient_id uuid,
  saved_address_id uuid,
  buyer_name text not null,
  buyer_phone text not null,
  recipient_name text not null,
  recipient_phone text not null,
  recipient_relationship text,
  is_surprise boolean not null default false,
  contact_policy text not null default 'buyer_first'
   