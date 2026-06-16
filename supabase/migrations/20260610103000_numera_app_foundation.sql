-- =====================================================================================
-- VENTO OS / NUMERA
-- Foundation: app registration, permissions and navigation.
--
-- Scope intentionally excludes financial tables. Numera starts as the economic
-- intelligence surface; canonical data models must be designed in vento-shell
-- once source facts and allocation rules are explicit.
-- =====================================================================================

begin;

insert into public.apps (code, name, description, is_active)
values ('numera', 'NUMERA', 'Inteligencia economica operativa', true)
on conflict (code)
do update set
  name = excluded.name,
  description = excluded.description,
  is_active = true,
  updated_at = now();

with numera_app as (
  select id from public.apps where code = 'numera'
)
insert into public.app_permissions (app_id, code, name, description, is_active)
select
  numera_app.id,
  permission.code,
  permission.name,
  permission.description,
  true
from numera_app
cross join (
  values
    ('access', 'Acceder a NUMERA', 'Permite abrir NUMERA.'),
    ('cost_centers.view', 'Centros de costo - Ver', 'Ver centros de costo y estructura economica.'),
    ('cost_centers.manage', 'Centros de costo - Gestionar', 'Administrar centros de costo y reglas asociadas.'),
    ('expenses.view', 'Gastos - Ver', 'Ver gastos fijos y variables por sede y periodo.'),
    ('expenses.manage', 'Gastos - Gestionar', 'Registrar y clasificar gastos economicos.'),
    ('break_even.view', 'Punto de equilibrio - Ver', 'Ver punto de equilibrio por sede y periodo.'),
    ('profitability.view', 'Rentabilidad - Ver', 'Ver rentabilidad por producto, categoria, sede y canal.'),
    ('reports.view', 'Reportes economicos - Ver', 'Ver reportes economicos consolidados.')
) as permission(code, name, description)
on conflict (app_id, code)
do update set
  name = excluded.name,
  description = excluded.description,
  is_active = true,
  updated_at = now();

insert into public.app_navigation_items (
  app_code,
  group_key,
  group_label,
  group_order,
  item_key,
  label,
  description,
  href,
  icon,
  required_permission_code,
  sort_order,
  is_active
)
values
  ('numera', 'inicio', 'Inicio', 10, 'panel', 'Panel', 'Resumen economico', '/', 'dashboard', 'numera.access', 10, true),
  ('numera', 'estructura', 'Estructura', 20, 'cost_centers', 'Centros de costo', 'Sedes, areas y unidades economicas', '/cost-centers', 'accounting', 'numera.cost_centers.view', 10, true),
  ('numera', 'gastos', 'Gastos', 30, 'expenses', 'Gastos', 'Gastos fijos y variables', '/expenses', 'fileText', 'numera.expenses.view', 10, true),
  ('numera', 'analisis', 'Analisis', 40, 'break_even', 'Punto de equilibrio', 'Equilibrio por sede y periodo', '/break-even', 'dashboard', 'numera.break_even.view', 10, true),
  ('numera', 'analisis', 'Analisis', 40, 'profitability', 'Rentabilidad', 'Margenes por producto, categoria y canal', '/profitability', 'accounting', 'numera.profitability.view', 20, true)
on conflict (app_code, item_key)
do update set
  group_key = excluded.group_key,
  group_label = excluded.group_label,
  group_order = excluded.group_order,
  label = excluded.label,
  description = excluded.description,
  href = excluded.href,
  icon = excluded.icon,
  required_permission_code = excluded.required_permission_code,
  sort_order = excluded.sort_order,
  is_active = excluded.is_active,
  updated_at = now();

-- Directivos: acceso completo global a Numera.
insert into public.role_permissions (role, permission_id, scope_type)
select role_name.role, ap.id, 'global'
from (values ('propietario'), ('gerente_general')) as role_name(role)
join public.apps a on a.code = 'numera'
join public.app_permissions ap on ap.app_id = a.id and ap.is_active = true
on conflict (role, permission_id, scope_type, scope_site_type, scope_area_kind)
do update set is_allowed = true;


commit;

select
  'numera_permissions' as check_name,
  a.code as app_code,
  count(ap.id) as permissions
from public.apps a
left join public.app_permissions ap on ap.app_id = a.id and ap.is_active = true
where a.code = 'numera'
group by a.code;

select
  'numera_navigation' as check_name,
  app_code,
  item_key,
  href,
  required_permission_code,
  is_active
from public.app_navigation_items
where app_code = 'numera'
order by group_order, sort_order;

