begin;

insert into public.inventory_movement_types (code, name, description, affects_stock, is_active)
values (
  'receipt_reversal',
  'Reversión de recepción',
  'Movimiento negativo generado al reversar una recepción ORIGO.',
  -1,
  true
)
on conflict (code) do update set
  name = excluded.name,
  description = excluded.description,
  affects_stock = excluded.affects_stock,
  is_active = true;

do $$
begin
  if exists (
    select 1
    from pg_constraint
    where conrelid = 'public.product_cost_events'::regclass
      and conname = 'product_cost_events_source_chk'
  ) then
    alter table public.product_cost_events
      drop constraint product_cost_events_source_chk;
  end if;

  alter table public.product_cost_events
    add constraint product_cost_events_source_chk
    check (
      source = any (
        array[
          'entry'::text,
          'adjust'::text,
          'production'::text,
          'entry_reversal'::text
        ]
      )
    );
end $$;

commit;
