-- Estos módulos siguen disponibles en /inventory/settings; se retiran del
-- sidebar para conservar una sola entrada de configuración.
update public.app_navigation_items
set is_active = false
where app_code = 'nexo'
  and href in (
    '/inventory/locations',
    '/inventory/locations/zone',
    '/inventory/cost-center'
  );
