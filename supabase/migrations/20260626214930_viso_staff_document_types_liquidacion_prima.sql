alter table public.document_types
  add column if not exists allow_multiple boolean not null default false;

comment on column public.document_types.allow_multiple is
  'Permite conservar varios documentos del mismo tipo para el mismo trabajador.';

update public.document_types
set
  system_key = 'settlement_certificate',
  allow_multiple = false,
  is_active = true,
  updated_at = now()
where name = 'Acta de liquidación'
  and scope = 'employee'::public.document_scope
  and system_key is null;

update public.document_types
set
  system_key = 'paid_bonus_document',
  allow_multiple = true,
  is_active = true,
  updated_at = now()
where name = 'Documento de prima pagada'
  and scope = 'employee'::public.document_scope
  and system_key is null;

insert into public.document_types (
  name,
  scope,
  requires_expiry,
  validity_months,
  reminder_days,
  is_active,
  display_order,
  system_key,
  allow_multiple
)
values
  (
    'Acta de liquidación',
    'employee'::public.document_scope,
    false,
    null,
    7,
    true,
    320,
    'settlement_certificate',
    false
  ),
  (
    'Documento de prima pagada',
    'employee'::public.document_scope,
    false,
    null,
    7,
    true,
    330,
    'paid_bonus_document',
    true
  )
on conflict (system_key) where system_key is not null do update
set
  name = excluded.name,
  scope = excluded.scope,
  requires_expiry = excluded.requires_expiry,
  validity_months = excluded.validity_months,
  reminder_days = excluded.reminder_days,
  is_active = true,
  display_order = excluded.display_order,
  allow_multiple = excluded.allow_multiple,
  updated_at = now();
