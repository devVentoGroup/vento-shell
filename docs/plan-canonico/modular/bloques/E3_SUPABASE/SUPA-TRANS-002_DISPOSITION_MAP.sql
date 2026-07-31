-- DISPOSITION-MAP-002@1.0.2
-- SUPA-TRANS-002 - Clasificacion read-only del universo producido por SUPA-TRANS-001.
-- Ejecutar con psql. No modifica objetos persistentes ni configuracion remota.
-- Usa tablas temporales de sesion y archivos CSV locales bajo /tmp.

\set ON_ERROR_STOP on
\pset footer off
\pset tuples_only off
\pset format csv
\o /tmp/supa_trans_001_transition_map.csv
\ir SUPA-TRANS-001_TRANSITION_MAP.sql
\o
\pset format aligned
\pset footer on

create temporary table supa_trans_001_transition_map (
  current_object_key text,
  current_object_class text,
  current_source_status text,
  current_product_boundary text,
  current_capability_key text,
  current_owner text,
  current_consumers text,
  current_ownership_state text,
  target_domain_or_special_class text,
  target_component_role text,
  target_authority_mode text,
  target_contract_mode text,
  target_security_boundary text,
  target_compatibility_dependencies text,
  target_transition_key text,
  mapping_status text,
  disposition_status text,
  evidence_refs text
) on commit preserve rows;

\copy supa_trans_001_transition_map from '/tmp/supa_trans_001_transition_map.csv' with (format csv, header true)

do $$
declare
  total_rows integer;
  unique_rows integer;
begin
  select count(*), count(distinct current_object_class || E'\\x1f' || current_object_key)
    into total_rows, unique_rows
  from supa_trans_001_transition_map;

  if total_rows <> 970 then
    raise exception 'SUPA-TRANS-001 devolvio % filas; se esperaban 970', total_rows;
  end if;

  if unique_rows <> total_rows then
    raise exception 'SUPA-TRANS-001 contiene identidades duplicadas: % filas y % identidades unicas', total_rows, unique_rows;
  end if;

  if exists (
    select 1
    from supa_trans_001_transition_map
    where disposition_status is distinct from 'RESERVED_FOR_SUPA_TRANS_002'
  ) then
    raise exception 'SUPA-TRANS-001 contiene disposiciones anticipadas';
  end if;
end
$$;

create temporary table supa_trans_002_disposition_map as
with disposition_classified as (
  select
    tm.*,
    case
      when tm.current_product_boundary = 'VITAL' then 'CONSERVAR'
      when tm.current_object_key in (
        'public.product_categories_backup_20260316_preparaciones',
        'public.staging_insumos_import',
        'public.role_capabilities'
      ) then 'RETIRAR'
      when tm.current_object_class = 'RELATION'
        and tm.current_source_status = 'CURRENT_COMPATIBILITY_PROJECTION' then 'RETIRAR'
      when tm.current_object_key in (
        'public.notify_shift_published()',
        'public.update_loyalty_balance()'
      ) then 'RETIRAR'
      when tm.current_object_key in (
        'public.asistencia_logs',
        'public.attendance_logs'
      ) then 'FUSIONAR'
      when tm.current_object_class = 'TRIGGER'
        and (
          tm.current_object_key like 'public.asistencia_logs::trigger::%'
          or tm.current_object_key like 'public.attendance_logs::trigger::%'
        ) then 'FUSIONAR'
      when tm.current_object_key in (
        'public.site_operational_roles',
        'viso.site_operational_roles'
      ) then 'FUSIONAR'
      when tm.current_object_class = 'TRIGGER'
        and (
          tm.current_object_key like 'public.site_operational_roles::trigger::%'
          or tm.current_object_key like 'viso.site_operational_roles::trigger::%'
        ) then 'FUSIONAR'
      when tm.current_object_key in (
        'cron.auto-close-attendance',
        'cron.anima_attendance_day_end_close_0005'
      ) then 'FUSIONAR'
      when tm.current_object_key in (
        'public.documents',
        'public.document_types',
        'public.required_document_rules',
        'storage.bucket.documents',
        'storage.bucket.employee-photos',
        'storage.bucket.public-documents'
      ) then 'DIVIDIR'
      when tm.current_object_key = 'public.internal_job_secrets' then 'MOVER'
      when tm.current_object_key = 'public.viso_enforce_monthly_schedule_publish_limit()' then 'MOVER'
      when tm.current_object_key like 'public.employee_shifts::trigger::trg_viso_monthly_schedule_publish_limit' then 'MOVER'
      when tm.current_object_class = 'RELATION'
        and tm.current_object_key like 'public.%'
        and tm.target_component_role not in ('ADAPTER', 'PROJECTION') then 'MOVER'
      when tm.current_object_class = 'TRIGGER'
        and tm.current_object_key like 'public.%' then 'MOVER'
      when tm.current_object_class = 'FUNCTION'
        and tm.current_object_key like 'public.%'
        and (
          tm.current_source_status = 'CURRENT_TRIGGER_FUNCTION'
          or tm.target_security_boundary = 'SECURITY_DEFINER_REVIEW'
        ) then 'MOVER'
      else 'CONSERVAR'
    end as resolved_disposition_status,
    case
      when tm.current_product_boundary = 'VITAL' then 'DISP::VITAL_BOUNDARY'
      when tm.current_object_key = 'public.product_categories_backup_20260316_preparaciones' then 'DISP::RETIRE::PRODUCT_CATEGORY_BACKUP'
      when tm.current_object_key = 'public.staging_insumos_import' then 'DISP::RETIRE::INSUMOS_STAGING'
      when tm.current_object_key = 'public.role_capabilities' then 'DISP::RETIRE::LEGACY_ROLE_CAPABILITIES'
      when tm.current_object_class = 'RELATION' and tm.current_source_status = 'CURRENT_COMPATIBILITY_PROJECTION' then 'DISP::RETIRE::COMPATIBILITY_PROJECTION'
      when tm.current_object_key in ('public.notify_shift_published()', 'public.update_loyalty_balance()') then 'DISP::RETIRE::ORPHAN_TRIGGER_FUNCTION'
      when tm.current_object_key in ('public.asistencia_logs', 'public.attendance_logs')
        or (tm.current_object_class = 'TRIGGER' and (tm.current_object_key like 'public.asistencia_logs::trigger::%' or tm.current_object_key like 'public.attendance_logs::trigger::%'))
        then 'DISP::MERGE::ATTENDANCE_LOGS'
      when tm.current_object_key in ('public.site_operational_roles', 'viso.site_operational_roles')
        or (tm.current_object_class = 'TRIGGER' and (tm.current_object_key like 'public.site_operational_roles::trigger::%' or tm.current_object_key like 'viso.site_operational_roles::trigger::%'))
        then 'DISP::MERGE::SITE_OPERATIONAL_ROLES'
      when tm.current_object_key in ('cron.auto-close-attendance', 'cron.anima_attendance_day_end_close_0005') then 'DISP::MERGE::ATTENDANCE_DAY_END_CLOSE_JOB'
      when tm.current_object_key in ('public.documents', 'public.document_types', 'public.required_document_rules', 'storage.bucket.documents', 'storage.bucket.employee-photos', 'storage.bucket.public-documents') then 'DISP::SPLIT::DOCUMENT_OWNERSHIP_AND_SENSITIVITY'
      when tm.current_object_key = 'public.internal_job_secrets' then 'DISP::MOVE::PRIVATE_JOB_SECRETS'
      when tm.current_object_key = 'public.viso_enforce_monthly_schedule_publish_limit()'
        or tm.current_object_key like 'public.employee_shifts::trigger::trg_viso_monthly_schedule_publish_limit'
        then 'DISP::MOVE::VISO_MONTHLY_LIMIT_GUARD'
      when tm.current_object_class = 'RELATION' and tm.current_object_key like 'public.%' and tm.target_component_role not in ('ADAPTER', 'PROJECTION') then 'DISP::MOVE::PUBLIC_WRITE_MODEL_TO_TARGET_DOMAIN'
      when tm.current_object_class = 'TRIGGER' and tm.current_object_key like 'public.%' then 'DISP::MOVE::PUBLIC_TRIGGER_WITH_PARENT_DOMAIN'
      when tm.current_object_class = 'FUNCTION' and tm.current_object_key like 'public.%' and (tm.current_source_status = 'CURRENT_TRIGGER_FUNCTION' or tm.target_security_boundary = 'SECURITY_DEFINER_REVIEW') then 'DISP::MOVE::PUBLIC_PRIVILEGED_OR_TRIGGER_FUNCTION'
      else 'DISP::KEEP::CURRENT_IDENTITY'
    end as disposition_group_key,
    case
      when tm.current_product_boundary = 'VITAL' then 'Mantener el objeto dentro de la frontera separada de VITAL; estar fuera de Vento OS no lo convierte en legacy.'
      when tm.current_object_key in ('public.product_categories_backup_20260316_preparaciones', 'public.staging_insumos_import') then 'Residuo tecnico sin capacidad empresarial vigente; retirar solo despues de reconciliacion, retencion y rollback.'
      when tm.current_object_key = 'public.role_capabilities' then 'Objeto declarado legacy; la autoridad vigente se distribuye entre app_permissions, role_permissions y operational_role_permissions.'
      when tm.current_object_class = 'RELATION' and tm.current_source_status = 'CURRENT_COMPATIBILITY_PROJECTION' then 'Proyeccion de compatibilidad con fuente canonica distinta; retirar despues de adaptar y certificar cero consumidores.'
      when tm.current_object_key in ('public.notify_shift_published()', 'public.update_loyalty_balance()') then 'Funcion de trigger sin trigger asociado ni consumidor vigente certificado en la auditoria canónica.'
      when tm.current_object_key like 'public.asistencia_logs%' or tm.current_object_key like 'public.attendance_logs%' then 'Dos superficies registran el mismo resultado de asistencia; converger en una unica autoridad e integrar automatismos.'
      when tm.current_object_key like 'public.site_operational_roles%' or tm.current_object_key like 'viso.site_operational_roles%' then 'Fuentes competidoras para roles operativos por sede; converger sin mantener doble escritura.'
      when tm.current_object_key in ('cron.auto-close-attendance', 'cron.anima_attendance_day_end_close_0005') then 'Jobs solapados sobre el cierre diario de asistencia; consolidar una programacion canonica e idempotente.'
      when tm.current_object_key in ('public.documents', 'public.document_types', 'public.required_document_rules', 'storage.bucket.documents', 'storage.bucket.employee-photos', 'storage.bucket.public-documents') then 'La identidad mezcla propietarios, finalidades o sensibilidades; separar contratos y ciclos de vida antes de migrar datos.'
      when tm.current_object_key = 'public.internal_job_secrets' then 'Secretos internos no deben permanecer en una superficie empresarial compartida; trasladar a limite privado server-only.'
      when tm.current_object_key = 'public.viso_enforce_monthly_schedule_publish_limit()' or tm.current_object_key like 'public.employee_shifts::trigger::trg_viso_monthly_schedule_publish_limit' then 'Guardia SECURITY DEFINER provisional en public; conservar el efecto pero moverlo a una frontera interna gobernada.'
      when tm.current_object_class = 'RELATION' and tm.current_object_key like 'public.%' and tm.target_component_role not in ('ADAPTER', 'PROJECTION') then 'Modelo escribible de dominio alojado en public; preservar identidad empresarial y moverlo al limite objetivo ya mapeado.'
      when tm.current_object_class = 'TRIGGER' and tm.current_object_key like 'public.%' then 'Automatismo ligado a un modelo de dominio que se mueve; trasladarlo con el padre y revalidar orden, privilegios e idempotencia.'
      when tm.current_object_class = 'FUNCTION' and tm.current_object_key like 'public.%' and (tm.current_source_status = 'CURRENT_TRIGGER_FUNCTION' or tm.target_security_boundary = 'SECURITY_DEFINER_REVIEW') then 'Funcion privilegiada o de trigger alojada en public; mover a la frontera del dominio o capa interna correspondiente.'
      else 'La identidad actual ya coincide con una frontera valida o actua como proyeccion/endpoint gobernado; conservar sujeto a dependencias y pruebas posteriores.'
    end as disposition_reason,
    case
      when tm.current_object_key in (
        'public.product_categories_backup_20260316_preparaciones', 'public.staging_insumos_import', 'public.role_capabilities',
        'public.notify_shift_published()', 'public.update_loyalty_balance()',
        'public.asistencia_logs', 'public.attendance_logs', 'public.site_operational_roles', 'viso.site_operational_roles',
        'cron.auto-close-attendance', 'cron.anima_attendance_day_end_close_0005',
        'public.internal_job_secrets', 'public.viso_enforce_monthly_schedule_publish_limit()'
      ) then 'HIGH'
      when tm.current_source_status = 'CURRENT_COMPATIBILITY_PROJECTION' then 'HIGH'
      when tm.current_product_boundary = 'VITAL' then 'HIGH'
      when tm.current_object_key in ('public.documents', 'public.document_types', 'public.required_document_rules', 'storage.bucket.documents', 'storage.bucket.employee-photos', 'storage.bucket.public-documents') then 'HIGH'
      when tm.current_object_class in ('RELATION', 'FUNCTION', 'TRIGGER') and tm.current_object_key like 'public.%' then 'MEDIUM'
      else 'HIGH'
    end as decision_confidence,
    case
      when tm.current_product_boundary = 'VITAL' then 'SUPA-TRANS-003;SUPA-TRANS-013;SUPA-TRANS-014'
      when tm.current_object_key in ('public.product_categories_backup_20260316_preparaciones', 'public.staging_insumos_import', 'public.role_capabilities')
        or tm.current_source_status = 'CURRENT_COMPATIBILITY_PROJECTION'
        or tm.current_object_key in ('public.notify_shift_published()', 'public.update_loyalty_balance()')
        then 'SUPA-TRANS-003;SUPA-TRANS-005;SUPA-TRANS-006;SUPA-TRANS-007;SUPA-TRANS-009;SUPA-TRANS-011;SUPA-TRANS-012'
      when tm.current_object_key like 'public.asistencia_logs%' or tm.current_object_key like 'public.attendance_logs%'
        or tm.current_object_key like 'public.site_operational_roles%' or tm.current_object_key like 'viso.site_operational_roles%'
        or tm.current_object_key in ('cron.auto-close-attendance', 'cron.anima_attendance_day_end_close_0005')
        then 'SUPA-TRANS-003;SUPA-TRANS-004;SUPA-TRANS-005;SUPA-TRANS-007;SUPA-TRANS-008;SUPA-TRANS-009;SUPA-TRANS-011'
      when tm.current_object_key in ('public.documents', 'public.document_types', 'public.required_document_rules', 'storage.bucket.documents', 'storage.bucket.employee-photos', 'storage.bucket.public-documents')
        then 'SUPA-TRANS-003;SUPA-TRANS-004;SUPA-TRANS-005;SUPA-TRANS-006;SUPA-TRANS-007;SUPA-TRANS-008;SUPA-TRANS-009;SUPA-TRANS-011;SUPA-TRANS-014'
      when tm.current_object_key = 'public.internal_job_secrets'
        or tm.current_object_key = 'public.viso_enforce_monthly_schedule_publish_limit()'
        or tm.current_object_key like 'public.employee_shifts::trigger::trg_viso_monthly_schedule_publish_limit'
        then 'SUPA-TRANS-003;SUPA-TRANS-004;SUPA-TRANS-006;SUPA-TRANS-008;SUPA-TRANS-009;SUPA-TRANS-010;SUPA-TRANS-011'
      when tm.current_object_class in ('RELATION', 'FUNCTION', 'TRIGGER') and tm.current_object_key like 'public.%'
        then 'SUPA-TRANS-003;SUPA-TRANS-004;SUPA-TRANS-005;SUPA-TRANS-006;SUPA-TRANS-007;SUPA-TRANS-008;SUPA-TRANS-009;SUPA-TRANS-011;SUPA-TRANS-014'
      else tm.target_compatibility_dependencies
    end as execution_gate,
    case
      when tm.current_object_class = 'RELATION' and tm.current_source_status = 'CURRENT_COMPATIBILITY_PROJECTION' and tm.current_object_key like 'public.pos_%'
        then 'TRANS::RELATION::pos.' || replace(tm.current_object_key, 'public.', '')
      when tm.current_object_class = 'RELATION' and tm.current_source_status = 'CURRENT_COMPATIBILITY_PROJECTION'
        then 'TRANS::RELATION::pass.' || replace(tm.current_object_key, 'public.', '')
      when tm.current_object_key in ('public.asistencia_logs', 'public.attendance_logs')
        or (tm.current_object_class = 'TRIGGER' and (tm.current_object_key like 'public.asistencia_logs::trigger::%' or tm.current_object_key like 'public.attendance_logs::trigger::%'))
        then 'TRANS::RELATION::public.attendance_logs'
      when tm.current_object_key in ('public.site_operational_roles', 'viso.site_operational_roles')
        or (tm.current_object_class = 'TRIGGER' and (tm.current_object_key like 'public.site_operational_roles::trigger::%' or tm.current_object_key like 'viso.site_operational_roles::trigger::%'))
        then 'TRANS::RELATION::public.site_operational_roles'
      when tm.current_object_key in ('cron.auto-close-attendance', 'cron.anima_attendance_day_end_close_0005') then 'TRANS::CRON_JOB::anima_attendance_day_end_close_0005'
      when tm.current_object_key = 'public.role_capabilities' then 'MULTIPLE::TRANS::RELATION::public.app_permissions|TRANS::RELATION::public.role_permissions|TRANS::RELATION::public.operational_role_permissions'
      else null
    end as successor_transition_key,
    tm.evidence_refs || ';SUPA-TRANS-002;DISPOSITION-MAP-002@1.0.2' as disposition_evidence_refs
  from supa_trans_001_transition_map tm
),
disposition_map as (
  select
    current_object_key,
    current_object_class,
    current_source_status,
    current_product_boundary,
    current_capability_key,
    current_owner,
    current_consumers,
    current_ownership_state,
    target_domain_or_special_class,
    target_component_role,
    target_authority_mode,
    target_contract_mode,
    target_security_boundary,
    target_transition_key,
    resolved_disposition_status as disposition_status,
    disposition_group_key,
    disposition_reason,
    decision_confidence,
    execution_gate,
    successor_transition_key,
    mapping_status,
    disposition_evidence_refs as evidence_refs
  from disposition_classified
)
select *
from disposition_map;

do $$
declare
  total_rows integer;
  invalid_rows integer;
  reserved_rows integer;
  merge_without_authority integer;
  split_without_gate integer;
  actual_counts jsonb;
  expected_counts constant jsonb := '{"CONSERVAR":420,"MOVER":494,"FUSIONAR":11,"DIVIDIR":6,"RENOMBRAR":0,"RETIRAR":39}'::jsonb;
begin
  select count(*) into total_rows from supa_trans_002_disposition_map;
  select count(*) into invalid_rows
  from supa_trans_002_disposition_map
  where disposition_status not in ('CONSERVAR', 'MOVER', 'FUSIONAR', 'DIVIDIR', 'RENOMBRAR', 'RETIRAR');
  select count(*) into reserved_rows
  from supa_trans_002_disposition_map
  where disposition_status = 'RESERVED_FOR_SUPA_TRANS_002';
  select count(*) into merge_without_authority
  from supa_trans_002_disposition_map
  where disposition_status = 'FUSIONAR'
    and (disposition_group_key is null or successor_transition_key is null);
  select count(*) into split_without_gate
  from supa_trans_002_disposition_map
  where disposition_status = 'DIVIDIR'
    and (disposition_group_key is null or execution_gate is null);

  select jsonb_object_agg(disposition, quantity)
    into actual_counts
  from (
    select expected.disposition, count(actual.disposition_status)::integer as quantity
    from jsonb_object_keys(expected_counts) as expected(disposition)
    left join supa_trans_002_disposition_map actual
      on actual.disposition_status = expected.disposition
    group by expected.disposition
  ) counts;

  if total_rows <> 970 then
    raise exception 'SUPA-TRANS-002 produjo % filas; se esperaban 970', total_rows;
  end if;

  if invalid_rows <> 0 or reserved_rows <> 0 then
    raise exception 'SUPA-TRANS-002 contiene % disposiciones invalidas y % reservas sin resolver', invalid_rows, reserved_rows;
  end if;

  if actual_counts <> expected_counts then
    raise exception 'Conteos de disposicion divergentes. Esperado %, actual %', expected_counts, actual_counts;
  end if;

  if merge_without_authority <> 0 or split_without_gate <> 0 then
    raise exception 'Invariantes de convergencia divergentes: % fusiones sin autoridad y % divisiones sin gate', merge_without_authority, split_without_gate;
  end if;
end
$$;

\copy (select * from supa_trans_002_disposition_map order by current_object_class, current_object_key) to '/tmp/supa_trans_002_disposition_map.csv' with (format csv, header true)

select *
from supa_trans_002_disposition_map
order by current_object_class, current_object_key;
