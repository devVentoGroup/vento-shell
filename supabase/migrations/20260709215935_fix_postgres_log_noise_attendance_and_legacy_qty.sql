begin;

-- PostgREST can hit attendance_logs with the anon role while SSR/auth cookies
-- are being refreshed. RLS has no anon policy, so this returns zero rows
-- instead of logging noisy permission errors.
grant select on table public.attendance_logs to anon;

drop policy if exists attendance_logs_insert_active_self_restrictive
on public.attendance_logs;

-- Compatibility-only read aliases for older dashboard/query code. The
-- canonical write columns remain quantity_ordered and quantity_received/input_qty.
alter table public.purchase_order_items
  add column if not exists qty numeric
  generated always as (quantity_ordered) stored;

comment on column public.purchase_order_items.qty is
  'Legacy read alias for quantity_ordered. Do not write new code against this column.';

alter table public.inventory_entry_items
  add column if not exists qty_base numeric
  generated always as (
    coalesce(
      quantity_received,
      case
        when input_qty is not null and conversion_factor_to_stock is not null
          then input_qty * conversion_factor_to_stock
        else null
      end
    )
  ) stored;

comment on column public.inventory_entry_items.qty_base is
  'Legacy read alias for received stock quantity. Prefer quantity_received or input_qty with conversion_factor_to_stock.';

grant select (qty) on table public.purchase_order_items to authenticated;
grant select (qty_base) on table public.inventory_entry_items to authenticated;

commit;
