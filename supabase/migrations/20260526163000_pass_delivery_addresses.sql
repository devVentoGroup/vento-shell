begin;

create table if not exists pass.delivery_addresses (
  id uuid primary key default gen_random_uuid(),
  user_id uuid not null references auth.users(id) on delete cascade,
  label text not null default 'Direccion',
  address text not null,
  latitude double precision not null,
  longitude double precision not null,
  address_type text not null default 'Casa',
  details text,
  receiver_label text,
  delivery_option text not null default 'Recibir en la puerta',
  courier_instructions text,
  is_default boolean not null default false,
  last_used_at timestamptz not null default now(),
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now(),
  constraint pass_delivery_addresses_lat_chk check (latitude between -90 and 90),
  constraint pass_delivery_addresses_lng_chk check (longitude between -180 and 180),
  constraint pass_delivery_addresses_address_chk check (length(trim(address)) > 0),
  constraint pass_delivery_addresses_label_chk check (length(trim(label)) > 0)
);

comment on table pass.delivery_addresses is
  'Direcciones guardadas por usuario para domicilios de Vento Pass.';

create index if not exists pass_delivery_addresses_user_recent_idx
  on pass.delivery_addresses (user_id, last_used_at desc, created_at desc);

create unique index if not exists pass_delivery_addresses_one_default_per_user_uidx
  on pass.delivery_addresses (user_id)
  where is_default = true;

drop trigger if exists pass_delivery_addresses_set_updated_at on pass.delivery_addresses;
create trigger pass_delivery_addresses_set_updated_at
before update on pass.delivery_addresses
for each row
execute function public._set_updated_at();

alter table pass.delivery_addresses enable row level security;

grant select, insert, update, delete on table pass.delivery_addresses to authenticated, service_role;

drop policy if exists pass_delivery_addresses_select_own on pass.delivery_addresses;
create policy pass_delivery_addresses_select_own
on pass.delivery_addresses
for select
to authenticated
using (user_id = auth.uid());

drop policy if exists pass_delivery_addresses_insert_own on pass.delivery_addresses;
create policy pass_delivery_addresses_insert_own
on pass.delivery_addresses
for insert
to authenticated
with check (user_id = auth.uid());

drop policy if exists pass_delivery_addresses_update_own on pass.delivery_addresses;
create policy pass_delivery_addresses_update_own
on pass.delivery_addresses
for update
to authenticated
using (user_id = auth.uid())
with check (user_id = auth.uid());

drop policy if exists pass_delivery_addresses_delete_own on pass.delivery_addresses;
create policy pass_delivery_addresses_delete_own
on pass.delivery_addresses
for delete
to authenticated
using (user_id = auth.uid());

create or replace function pass.ensure_single_default_delivery_address()
returns trigger
language plpgsql
security definer
set search_path = pass, public
as $$
begin
  if new.is_default then
    update pass.delivery_addresses
       set is_default = false
     where user_id = new.user_id
       and id <> new.id
       and is_default = true;
  end if;

  return new;
end;
$$;

drop trigger if exists pass_delivery_addresses_single_default on pass.delivery_addresses;
create trigger pass_delivery_addresses_single_default
after insert or update of is_default on pass.delivery_addresses
for each row
when (new.is_default = true)
execute function pass.ensure_single_default_delivery_address();

notify pgrst, 'reload schema';

commit;
