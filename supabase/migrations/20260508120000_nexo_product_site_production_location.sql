begin;

alter table if exists public.product_site_settings
  add column if not exists production_location_id uuid references public.inventory_locations(id) on delete set null;

create index if not exists idx_product_site_settings_production_location
  on public.product_site_settings(production_location_id)
  where production_location_id is not null;

comment on column public.product_site_settings.production_location_id is
  'LOC operativo donde se consume la receta y se suma el producto terminado para esta sede/producto.';

create or replace function public.validate_product_site_production_location()
returns trigger
language plpgsql
as $$
declare
  v_location_site_id uuid;
  v_location_type text;
begin
  if new.production_location_id is null then
    return new;
  end if;

  select site_id, location_type
    into v_location_site_id, v_location_type
  from public.inventory_locations
  where id = new.production_location_id;

  if v_location_site_id is null then
    raise exception 'production_location_id % does not exist', new.production_location_id;
  end if;

  if v_location_site_id <> new.site_id then
    raise exception 'production_location_id % does not belong to product site %', new.production_location_id, new.site_id;
  end if;

  if coalesce(v_location_type, '') <> 'production' then
    raise exception 'production_location_id % must be a production LOC', new.production_location_id;
  end if;

  return new;
end;
$$;

drop trigger if exists trg_product_site_settings_production_location on public.product_site_settings;
create trigger trg_product_site_settings_production_location
before insert or update of site_id, production_location_id
on public.product_site_settings
for each row
execute function public.validate_product_site_production_location();

commit;
