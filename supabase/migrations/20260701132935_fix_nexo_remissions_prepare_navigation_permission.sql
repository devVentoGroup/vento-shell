update public.app_navigation_items
set
  label = 'Preparar remisiones',
  description = 'Solicitudes listas para alistar y despachar',
  required_permission_code = 'nexo.inventory.remissions.prepare',
  updated_at = now()
where app_code = 'nexo'
  and (
    item_key = 'inventory_remissions_prepare'
    or href = '/inventory/remissions/prepare'
  );
