-- El sidebar expone un único centro de configuración. Las pantallas internas
-- permanecen accesibles desde ese centro, pero no saturan la navegación.
update public.app_navigation_items
set is_active = false
where app_code = 'nexo'
  and href like '/inventory/settings/%';

insert into public.app_navigation_items (
  app_code, group_key, group_label, group_order, item_key, label, description,
  href, icon, required_permission_code, sort_order, is_active
) values (
  'nexo', 'configuracion', 'Configuración', 80, 'inventory_settings',
  'Configuración', 'Productos, sedes, LOCs, solicitudes y control.',
  '/inventory/settings', 'settings', 'nexo.inventory.stock', 10, true
)
on conflict (app_code, href) do update set
  group_key = excluded.group_key,
  group_label = excluded.group_label,
  group_order = excluded.group_order,
  item_key = excluded.item_key,
  label = excluded.label,
  description = excluded.description,
  icon = excluded.icon,
  required_permission_code = excluded.required_permission_code,
  sort_order = excluded.sort_order,
  is_active = true;
