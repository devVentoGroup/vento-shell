alter table public.employees
  add column if not exists document_type text not null default 'CC',
  add column if not exists document_number text,
  add column if not exists document_number_normalized text
    generated always as (
      nullif(regexp_replace(coalesce(document_number, ''), '[^0-9A-Za-z]', '', 'g'), '')
    ) stored;

do $$
begin
  if not exists (
    select 1
    from pg_constraint
    where conname = 'employees_document_type_not_blank'
      and conrelid = 'public.employees'::regclass
  ) then
    alter table public.employees
      add constraint employees_document_type_not_blank
      check (length(btrim(document_type)) > 0);
  end if;
end;
$$;

do $$
begin
  if not exists (
    select 1
    from pg_constraint
    where conname = 'employees_document_number_not_blank'
      and conrelid = 'public.employees'::regclass
  ) then
    alter table public.employees
      add constraint employees_document_number_not_blank
      check (document_number is null or length(btrim(document_number)) > 0);
  end if;
end;
$$;

create unique index if not exists employees_document_identity_uidx
  on public.employees (document_type, document_number_normalized)
  where document_number_normalized is not null;

comment on column public.employees.document_type is
  'Tipo de documento laboral usado para identificar trabajadores en importaciones y administración. Valor por defecto: CC.';

comment on column public.employees.document_number is
  'Número de documento laboral visible para administración. Se usa como llave estable para importar horarios desde Excel.';

comment on column public.employees.document_number_normalized is
  'Documento normalizado sin espacios, puntos ni guiones. Columna generada para búsquedas e índice único.';
