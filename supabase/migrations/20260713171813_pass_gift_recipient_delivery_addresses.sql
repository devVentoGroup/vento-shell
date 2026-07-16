alter table pass.delivery_addresses
  add column if not exists gift_recipient_id uuid null;

alter table pass.delivery_addresses
  drop constraint if exists delivery_addresses_gift_recipient_id_fkey;

alter table pass.delivery_addresses
  add constraint delivery_addresses_gift_recipient_id_fkey
  foreign key (gift_recipient_id)
  references public.gift_recipients(id)
  on delete set null;

create index if not exists delivery_addresses_gift_recipient_idx
  on pass.delivery_addresses(user_id, gift_recipient_id, last_used_at desc);

alter table public.order_gift_details
  drop constraint if exists order_gift_details_saved_address_id_fkey;

alter table public.order_gift_details
  add constraint order_gift_details_saved_address_id_fkey
  foreign key (saved_address_id)
  references pass.delivery_addresses(id)
  on delete set null;

comment on column pass.delivery_addresses.gift_recipient_id is
  'Destinatario guardado al que pertenece esta direccion. Null indica direccion personal o sin clasificar.';

comment on column public.order_gift_details.saved_address_id is
  'Direccion guardada usada como destino del regalo; el pedido conserva su snapshot aunque esta direccion cambie o se elimine.';