alter table public.inventory_entry_items
  add column if not exists iva_rate numeric default 0,
  add column if not exists iva_amount numeric default 0,
  add column if not exists icui_rate numeric default 0,
  add column if not exists icui_amount numeric default 0,
  add column if not exists total_tax_rate numeric default 0;

comment on column public.inventory_entry_items.iva_rate is
  'Porcentaje de IVA aplicado en la línea de recepción ORIGO.';

comment on column public.inventory_entry_items.iva_amount is
  'Valor de IVA calculado para la línea de recepción ORIGO.';

comment on column public.inventory_entry_items.icui_rate is
  'Porcentaje de ICUI aplicado en la línea de recepción ORIGO.';

comment on column public.inventory_entry_items.icui_amount is
  'Valor de ICUI calculado para la línea de recepción ORIGO.';

comment on column public.inventory_entry_items.total_tax_rate is
  'Suma operativa de impuestos aplicados en la línea: IVA + ICUI.';