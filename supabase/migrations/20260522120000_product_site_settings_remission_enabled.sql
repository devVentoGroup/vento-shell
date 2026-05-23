begin;

alter table public.product_site_settings
  add column if not exists remission_enabled boolean;

comment on column public.product_site_settings.remission_enabled is
  'Control explicito para remisiones. null mantiene comportamiento legacy; true habilita remision; false excluye de remisiones aunque el producto este disponible en la sede.';

commit;