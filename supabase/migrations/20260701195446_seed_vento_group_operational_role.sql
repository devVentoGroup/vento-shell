insert into public.site_operational_roles (
  site_id,
  area_id,
  role_code,
  label,
  description,
  is_default,
  sort_order,
  is_active,
  created_at,
  updated_at
)
select
  s.id,
  null::uuid,
  'gerencia_operativa',
  'Gerencia operativa',
  'Rol operativo para sede administrativa con gestion de horarios y operacion transversal.',
  true,
  10,
  true,
  now(),
  now()
from public.sites s
where s.code = 'VENTO_GROUP'
on conflict (
  site_id,
  coalesce(area_id, '00000000-0000-0000-0000-000000000000'::uuid),
  role_code
)
do update set
  label = excluded.label,
  description = excluded.description,
  is_default = true,
  sort_order = excluded.sort_order,
  is_active = true,
  updated_at = now();

notify pgrst, 'reload schema';
