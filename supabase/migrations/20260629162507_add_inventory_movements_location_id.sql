alter table public.inventory_movements
  add column if not exists location_id uuid;

do $$
begin
  if not exists (
    select 1
    from pg_constraint
    where conname = 'inventory_movements_location_id_fkey'
  ) then
    alter table public.inventory_movements
      add constraint inventory_movements_location_id_fkey
      foreign key (location_id)
      references public.inventory_locations(id)
      on delete set null;
  end if;
end $$;

create index if not exists inventory_movements_location_id_idx
  on public.inventory_movements(location_id)
  where location_id is not null;

comment on column public.inventory_movements.location_id is
  'LOC operativo impactado por el movimiento. Complementa location_position_id para auditoria por ubicacion.';
