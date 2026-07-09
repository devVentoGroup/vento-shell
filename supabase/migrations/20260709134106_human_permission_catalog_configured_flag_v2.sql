create or replace view public.permission_catalog_human_v1 as
select
  ap.id,
  a.code as app_code,
  ap.code,
  (a.code || '.' || ap.code) as full_code,
  coalesce(nullif(ap.human_label, ''), nullif(ap.name, ''), ap.code) as label,
  coalesce(nullif(ap.human_description, ''), nullif(ap.description, ''), 'Define que puede hacer este rol dentro de Vento OS.') as description,
  coalesce(nullif(ap.human_group, ''), 'General') as group_label,
  ap.permission_audience,
  ap.is_operational,
  ap.requires_active_work_context,
  ap.human_sort_order,
  ap.is_active,
  ap.created_at,
  ap.updated_at,
  (nullif(ap.human_label, '') is not null) as is_human_configured
from public.app_permissions ap
join public.apps a on a.id = ap.app_id;

comment on view public.permission_catalog_human_v1 is 'Catalogo humano unificado de permisos para VISO. is_human_configured identifica permisos listos para mostrar a usuarios.';
