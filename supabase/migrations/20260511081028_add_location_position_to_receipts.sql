alter table public.inventory_entry_items
  add column if not exists location_position_id uuid;

do $$
begin
  if not exists (
    select 1
    from pg_constraint
    where conname = 'inventory_entry_items_location_position_id_fkey'
  ) then
    alter table public.inventory_entry_items
      add constraint inventory_entry_items_location_position_id_fkey
      foreign key (location_position_id)
      references public.inventory_location_positions(id)
      on delete set null;
  end if;
end $$;

create index if not exists idx_inventory_entry_items_location_position_id
  on public.inventory_entry_items(location_position_id);

comment on column public.inventory_entry_items.location_position_id
  is 'Optional internal position inside the destination inventory location for received items.';

alter table public.inventory_movements
  add column if not exists location_position_id uuid;

do $$
begin
  if not exists (
    select 1
    from pg_constraint
    where conname = 'inventory_movements_location_position_id_fkey'
  ) then
    alter table public.inventory_movements
      add constraint inventory_movements_location_position_id_fkey
      foreign key (location_position_id)
      references public.inventory_location_positions(id)
      on delete set null;
  end if;
end $$;

create index if not exists idx_inventory_movements_location_position_id
  on public.inventory_movements(location_position_id);

comment on column public.inventory_movements.location_position_id
  is 'Optional internal position inside the destination inventory location for traceable inventory movements.';
