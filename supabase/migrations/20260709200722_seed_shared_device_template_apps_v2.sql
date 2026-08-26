insert into public.shared_operational_device_template_apps (template_id, app_code, is_default, is_active, sort_order)
select t.id, x.app_code, x.app_code = t.default_app_code, true, x.sort_order
from public.shared_operational_device_templates t
join (
  values
    ('pos_satellite', 'pulso', 100),
    ('pos_satellite', 'nexo', 200),
    ('pos_satellite', 'shell', 300),
    ('bar_satellite', 'pulso', 100),
    ('bar_satellite', 'nexo', 200),
    ('bar_satellite', 'shell', 300),
    ('warehouse_kiosk', 'nexo', 100),
    ('warehouse_kiosk', 'shell', 200),
    ('procurement_reception', 'origo', 100),
    ('procurement_reception', 'nexo', 200),
    ('procurement_reception', 'shell', 300),
    ('production_center', 'fogo', 100),
    ('production_center', 'nexo', 200),
    ('production_center', 'shell', 300),
    ('management_terminal', 'numera', 100),
    ('management_terminal', 'viso', 200),
    ('management_terminal', 'shell', 300)
) as x(template_code, app_code, sort_order)
  on x.template_code = t.code
on conflict (template_id, app_code) do update set
  is_default = excluded.is_default,
  is_active = true,
  sort_order = excluded.sort_order;
