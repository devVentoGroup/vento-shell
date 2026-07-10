begin;

create table if not exists public.client_billing_profiles (
  user_id uuid primary key references auth.users(id) on delete cascade,
  legal_name text not null,
  document_type text not null,
  document_number text not null,
  verification_digit text,
  billing_email text not null,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now(),
  constraint client_billing_profiles_legal_name_required check (length(trim(legal_name)) > 0),
  constraint client_billing_profiles_document_type_required check (length(trim(document_type)) > 0),
  constraint client_billing_profiles_document_number_required check (length(trim(document_number)) > 0),
  constraint client_billing_profiles_email_required check (length(trim(billing_email)) > 0),
  constraint client_billing_profiles_verification_digit_length check (verification_digit is null or length(trim(verification_digit)) <= 2)
);

create table if not exists public.order_billing_requests (
  id uuid primary key default gen_random_uuid(),
  order_id uuid not null unique references public.orders(id) on delete cascade,
  client_id uuid not null references auth.users(id) on delete restrict,
  site_id uuid not null references public.sites(id) on delete restrict,
  legal_name text not null,
  document_type text not null,
  document_number text not null,
  verification_digit text,
  billing_email text not null,
  status text not null default 'requested',
  provider text,
  provider_reference text,
  invoice_number text,
  cufe text,
  pdf_url text,
  xml_url text,
  error_message text,
  metadata jsonb not null default '{}'::jsonb,
  requested_at timestamptz not null default now(),
  submitted_at timestamptz,
  issued_at timestamptz,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now(),
  constraint order_billing_requests_status_check check (
    status in ('requested', 'ready_to_issue', 'submitted', 'issued', 'failed', 'cancelled')
  ),
  constraint order_billing_requests_legal_name_required check (length(trim(legal_name)) > 0),
  constraint order_billing_requests_document_type_required check (length(trim(document_type)) > 0),
  constraint order_billing_requests_document_number_required check (length(trim(document_number)) > 0),
  constraint order_billing_requests_email_required check (length(trim(billing_email)) > 0),
  constraint order_billing_requests_verification_digit_length check (verification_digit is null or length(trim(verification_digit)) <= 2)
);

create index if not exists order_billing_requests_site_status_idx
  on public.order_billing_requests (site_id, status, requested_at desc);

create index if not exists order_billing_requests_client_idx
  on public.order_billing_requests (client_id, requested_at desc);

drop trigger if exists trg_client_billing_profiles_updated_at on public.client_billing_profiles;
create trigger trg_client_billing_profiles_updated_at
before update on public.client_billing_profiles
for each row execute function public.update_updated_at();

drop trigger if exists trg_order_billing_requests_updated_at on public.order_billing_requests;
create trigger trg_order_billing_requests_updated_at
before update on public.order_billing_requests
for each row execute function public.update_updated_at();

alter table public.client_billing_profiles enable row level security;
alter table public.order_billing_requests enable row level security;

drop policy if exists client_billing_profiles_select_own on public.client_billing_profiles;
create policy client_billing_profiles_select_own
on public.client_billing_profiles
for select
to authenticated
using (user_id = auth.uid());

drop policy if exists client_billing_profiles_insert_own on public.client_billing_profiles;
create policy client_billing_profiles_insert_own
on public.client_billing_profiles
for insert
to authenticated
with check (user_id = auth.uid());

drop policy if exists client_billing_profiles_update_own on public.client_billing_profiles;
create policy client_billing_profiles_update_own
on public.client_billing_profiles
for update
to authenticated
using (user_id = auth.uid())
with check (user_id = auth.uid());

drop policy if exists order_billing_requests_select_client on public.order_billing_requests;
create policy order_billing_requests_select_client
on public.order_billing_requests
for select
to authenticated
using (client_id = auth.uid());

drop policy if exists order_billing_requests_select_staff on public.order_billing_requests;
create policy order_billing_requests_select_staff
on public.order_billing_requests
for select
to authenticated
using (public.is_employee() and public.can_access_site(site_id));

create or replace function public.create_order_checkout_draft(
  p_site_id uuid,
  p_satellite_name text,
  p_fulfillment_type text,
  p_contact_name text,
  p_contact_phone text,
  p_address_line text,
  p_address_reference text,
  p_notes text,
  p_items jsonb,
  p_delivery_fee_amount numeric,
  p_source text,
  p_delivery_distance_km integer,
  p_delivery_quote_id uuid,
  p_invoice_requested boolean,
  p_billing_data jsonb
)
returns jsonb
language plpgsql
security definer
set search_path = public, auth, pass
as $$
declare
  v_uid uuid := auth.uid();
  v_result jsonb;
  v_order_id uuid;
  v_billing_request_id uuid;
  v_legal_name text;
  v_document_type text;
  v_document_number text;
  v_verification_digit text;
  v_billing_email text;
  v_order_site_id uuid;
  v_order_payment_status text;
  v_order_fulfillment_type text;
  v_initial_status text := 'requested';
begin
  if v_uid is null then
    raise exception 'authentication_required';
  end if;

  if coalesce(p_invoice_requested, false) then
    if p_billing_data is null or jsonb_typeof(p_billing_data) <> 'object' then
      raise exception 'billing_data_required';
    end if;

    v_legal_name := nullif(trim(coalesce(p_billing_data ->> 'legal_name', '')), '');
    v_document_type := upper(nullif(trim(coalesce(p_billing_data ->> 'document_type', '')), ''));
    v_document_number := nullif(trim(coalesce(p_billing_data ->> 'document_number', '')), '');
    v_verification_digit := nullif(trim(coalesce(p_billing_data ->> 'verification_digit', '')), '');
    v_billing_email := lower(nullif(trim(coalesce(p_billing_data ->> 'billing_email', '')), ''));

    if v_legal_name is null then raise exception 'billing_legal_name_required'; end if;
    if v_document_type is null then raise exception 'billing_document_type_required'; end if;
    if v_document_number is null then raise exception 'billing_document_number_required'; end if;
    if v_billing_email is null then raise exception 'billing_email_required'; end if;

    if v_billing_email !~* '^[^[:space:]@]+@[^[:space:]@]+\.[^[:space:]@]+$' then
      raise exception 'billing_email_invalid';
    end if;

    if v_verification_digit is not null and length(v_verification_digit) > 2 then
      raise exception 'billing_verification_digit_invalid';
    end if;
  end if;

  v_result := public.create_order_checkout_draft(
    p_site_id,
    p_satellite_name,
    p_fulfillment_type,
    p_contact_name,
    p_contact_phone,
    p_address_line,
    p_address_reference,
    p_notes,
    p_items,
    p_delivery_fee_amount,
    p_source,
    p_delivery_distance_km,
    p_delivery_quote_id
  );

  v_order_id := nullif(v_result ->> 'order_id', '')::uuid;
  if v_order_id is null then raise exception 'order_creation_failed'; end if;

  if not coalesce(p_invoice_requested, false) then
    return v_result || jsonb_build_object(
      'invoice_requested', false,
      'billing_request_id', null,
      'billing_status', null
    );
  end if;

  select site_id, payment_status, fulfillment_type
  into v_order_site_id, v_order_payment_status, v_order_fulfillment_type
  from public.orders
  where id = v_order_id and client_id = v_uid;

  if v_order_site_id is null then raise exception 'billing_order_not_found'; end if;

  if v_order_payment_status = 'paid'
     or (v_order_fulfillment_type in ('pickup', 'on_premise') and (v_result ->> 'payment_status') = 'paid') then
    v_initial_status := 'ready_to_issue';
  end if;

  insert into public.client_billing_profiles (
    user_id, legal_name, document_type, document_number, verification_digit, billing_email
  ) values (
    v_uid, v_legal_name, v_document_type, v_document_number, v_verification_digit, v_billing_email
  )
  on conflict (user_id) do update
  set legal_name = excluded.legal_name,
      document_type = excluded.document_type,
      document_number = excluded.document_number,
      verification_digit = excluded.verification_digit,
      billing_email = excluded.billing_email,
      updated_at = now();

  insert into public.order_billing_requests (
    order_id, client_id, site_id, legal_name, document_type, document_number,
    verification_digit, billing_email, status, metadata
  ) values (
    v_order_id, v_uid, v_order_site_id, v_legal_name, v_document_type, v_document_number,
    v_verification_digit, v_billing_email, v_initial_status,
    jsonb_build_object(
      'source', coalesce(nullif(trim(coalesce(p_source, '')), ''), 'vento_pass'),
      'captured_at', now(),
      'fulfillment_type', v_order_fulfillment_type,
      'payment_status_at_capture', v_order_payment_status
    )
  ) returning id into v_billing_request_id;

  return v_result || jsonb_build_object(
    'invoice_requested', true,
    'billing_request_id', v_billing_request_id,
    'billing_status', v_initial_status
  );
end;
$$;

create or replace function public.sync_order_billing_request_status()
returns trigger
language plpgsql
security definer
set search_path = public
as $$
begin
  if new.status = 'cancelled' or new.payment_status in ('failed', 'cancelled') then
    update public.order_billing_requests
    set status = 'cancelled',
        error_message = case
          when new.status = 'cancelled' then 'order_cancelled'
          else 'payment_' || new.payment_status
        end,
        updated_at = now()
    where order_id = new.id
      and status not in ('issued', 'submitted');
  elsif new.payment_status = 'paid'
     or (new.fulfillment_type in ('pickup', 'on_premise') and new.status = 'delivered') then
    update public.order_billing_requests
    set status = 'ready_to_issue',
        error_message = null,
        updated_at = now()
    where order_id = new.id
      and status in ('requested', 'failed', 'cancelled');
  end if;

  return new;
end;
$$;

drop trigger if exists trg_orders_sync_billing_request_status on public.orders;
create trigger trg_orders_sync_billing_request_status
after update of status, payment_status on public.orders
for each row
when (old.status is distinct from new.status or old.payment_status is distinct from new.payment_status)
execute function public.sync_order_billing_request_status();

grant select, insert, update on public.client_billing_profiles to authenticated;
grant select on public.order_billing_requests to authenticated;
grant execute on function public.create_order_checkout_draft(
  uuid, text, text, text, text, text, text, text, jsonb, numeric, text, integer, uuid, boolean, jsonb
) to authenticated, service_role;

comment on table public.client_billing_profiles is 'Datos de facturación reutilizables del cliente de Vento Pass.';
comment on table public.order_billing_requests is 'Snapshot inmutable de los datos solicitados para facturación electrónica de cada pedido.';
comment on function public.create_order_checkout_draft(
  uuid, text, text, text, text, text, text, text, jsonb, numeric, text, integer, uuid, boolean, jsonb
) is 'Crea el checkout y, cuando se solicita factura, guarda el perfil y snapshot de facturación en la misma transacción.';

commit;
