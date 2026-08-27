begin;

do $auth_db_003_precheck$
declare
  v_governed bigint;
  v_sd bigint;
  v_vento_sd bigint;
  v_vital_sd bigint;
  v_direct_sd bigint;
  v_trigger_sd bigint;
  v_live_trigger_sd bigint;
  v_orphan_trigger_sd bigint;
  v_anon_sd bigint;
  v_auth_sd bigint;
  v_row_security_off bigint;
  v_postgres_owned_vento bigint;
  v_target_matches bigint;
  v_orphan_matches bigint;
  v_viso_guard bigint;
begin
  select
    count(*),
    count(*) filter (where p.prosecdef),
    count(*) filter (
      where p.prosecdef
        and n.nspname <> 'vital'
    ),
    count(*) filter (
      where p.prosecdef
        and n.nspname = 'vital'
    ),
    count(*) filter (
      where p.prosecdef
        and p.prorettype <> 'trigger'::regtype
    ),
    count(*) filter (
      where p.prosecdef
        and p.prorettype = 'trigger'::regtype
    ),
    count(*) filter (
      where p.prosecdef
        and p.prorettype = 'trigger'::regtype
        and exists (
          select 1
          from pg_catalog.pg_trigger t
          where t.tgfoid = p.oid
            and not t.tgisinternal
        )
    ),
    count(*) filter (
      where p.prosecdef
        and p.prorettype = 'trigger'::regtype
        and not exists (
          select 1
          from pg_catalog.pg_trigger t
          where t.tgfoid = p.oid
            and not t.tgisinternal
        )
    ),
    count(*) filter (
      where p.prosecdef
        and has_function_privilege('anon', p.oid, 'EXECUTE')
    ),
    count(*) filter (
      where p.prosecdef
        and has_function_privilege(
          'authenticated',
          p.oid,
          'EXECUTE'
        )
    ),
    count(*) filter (
      where p.prosecdef
        and coalesce(array_to_string(p.proconfig, ','), '')
          like '%row_security=off%'
    ),
    count(*) filter (
      where p.prosecdef
        and n.nspname <> 'vital'
        and pg_get_userbyid(p.proowner) = 'postgres'
    )
  into
    v_governed,
    v_sd,
    v_vento_sd,
    v_vital_sd,
    v_direct_sd,
    v_trigger_sd,
    v_live_trigger_sd,
    v_orphan_trigger_sd,
    v_anon_sd,
    v_auth_sd,
    v_row_security_off,
    v_postgres_owned_vento
  from pg_catalog.pg_proc p
  join pg_catalog.pg_namespace n
    on n.oid = p.pronamespace
  where n.nspname in (
    'app_private',
    'club',
    'pass',
    'public',
    'talento',
    'vital'
  );

  if v_governed <> 348 then
    raise exception
      'AUTH_DB_003_PRECONDITION_FAILED: governed functions expected 348 observed %',
      v_governed;
  end if;

  if v_sd <> 211 then
    raise exception
      'AUTH_DB_003_PRECONDITION_FAILED: SECURITY DEFINER expected 211 observed %',
      v_sd;
  end if;

  if v_vento_sd <> 206 or v_vital_sd <> 5 then
    raise exception
      'AUTH_DB_003_PRECONDITION_FAILED: Vento/VITAL split expected 206/5 observed %/%',
      v_vento_sd,
      v_vital_sd;
  end if;

  if v_direct_sd <> 179 then
    raise exception
      'AUTH_DB_003_PRECONDITION_FAILED: direct SECURITY DEFINER expected 179 observed %',
      v_direct_sd;
  end if;

  if
    v_trigger_sd <> 32
    or v_live_trigger_sd <> 30
    or v_orphan_trigger_sd <> 2
  then
    raise exception
      'AUTH_DB_003_PRECONDITION_FAILED: trigger cohort expected 32/30/2 observed %/%/%',
      v_trigger_sd,
      v_live_trigger_sd,
      v_orphan_trigger_sd;
  end if;

  if v_anon_sd <> 46 or v_auth_sd <> 152 then
    raise exception
      'AUTH_DB_003_PRECONDITION_FAILED: effective audiences expected anon/auth 46/152 observed %/%',
      v_anon_sd,
      v_auth_sd;
  end if;

  if v_row_security_off <> 14 then
    raise exception
      'AUTH_DB_003_PRECONDITION_FAILED: row_security=off expected 14 observed %',
      v_row_security_off;
  end if;

  if v_postgres_owned_vento <> 206 then
    raise exception
      'AUTH_DB_003_PRECONDITION_FAILED: postgres-owned Vento definers expected 206 observed %',
      v_postgres_owned_vento;
  end if;

  with expected(
    qualified_signature,
    definition_md5,
    proconfig
  ) as (
    values
      (
        'public.can_access_recipe_scope(p_site_id uuid, p_area_id uuid)',
        '9708f0280f23dfa7bef5eddf267a1253',
        'search_path=public'
      ),
      (
        'public.current_employee_area_id()',
        'a132dc51d8694daacda66011fb96ee56',
        'search_path=public,row_security=off'
      ),
      (
        'public.current_employee_site_id()',
        'c73982ad5453180a9ebd058c9d754d1b',
        'search_path=public,row_security=off'
      ),
      (
        'public.is_active_staff()',
        '30043009b774f1755d03a32f84c34e81',
        'search_path=public,row_security=off'
      ),
      (
        'public.is_global_manager()',
        '5df563f247dc0aef90f53eaedd588d12',
        'search_path=public,row_security=off'
      ),
      (
        'public.is_manager()',
        '073d54140717476b8fe3cca9f1ff5baa',
        'search_path=public,row_security=off'
      ),
      (
        'public.is_manager_or_owner()',
        '3fd3eedb392d81e86759f21d9605663e',
        'search_path=public,row_security=off'
      ),
      (
        'public.is_owner()',
        '1c303b01997da85933ab0efa48707996',
        'search_path=public,row_security=off'
      )
  )
  select count(*)
  into v_target_matches
  from expected e
  join pg_catalog.pg_proc p
    on format(
      '%I.%I(%s)',
      (
        select n.nspname
        from pg_catalog.pg_namespace n
        where n.oid = p.pronamespace
      ),
      p.proname,
      pg_get_function_identity_arguments(p.oid)
    ) = e.qualified_signature
  join pg_catalog.pg_language l
    on l.oid = p.prolang
  where p.prosecdef
    and l.lanname = 'sql'
    and pg_get_userbyid(p.proowner) = 'postgres'
    and coalesce(array_to_string(p.proconfig, ','), '')
      = e.proconfig
    and md5(
      replace(
        pg_get_functiondef(p.oid),
        E'\r\n',
        E'\n'
      )
    ) = e.definition_md5
    and has_function_privilege(
      'anon',
      p.oid,
      'EXECUTE'
    )
    and has_function_privilege(
      'authenticated',
      p.oid,
      'EXECUTE'
    )
    and has_function_privilege(
      'service_role',
      p.oid,
      'EXECUTE'
    );

  if v_target_matches <> 8 then
    raise exception
      'AUTH_DB_003_PRECONDITION_FAILED: exact invoker target matches expected 8 observed %',
      v_target_matches;
  end if;

  select count(*)
  into v_orphan_matches
  from pg_catalog.pg_proc p
  join pg_catalog.pg_namespace n
    on n.oid = p.pronamespace
  where n.nspname = 'public'
    and p.proname in (
      'notify_shift_published',
      'update_loyalty_balance'
    )
    and p.prosecdef
    and p.prorettype = 'trigger'::regtype
    and not exists (
      select 1
      from pg_catalog.pg_trigger t
      where t.tgfoid = p.oid
        and not t.tgisinternal
    );

  if v_orphan_matches <> 2 then
    raise exception
      'AUTH_DB_003_PRECONDITION_FAILED: orphan trigger dispositions expected 2 observed %',
      v_orphan_matches;
  end if;

  select count(*)
  into v_viso_guard
  from pg_catalog.pg_proc p
  join pg_catalog.pg_namespace n
    on n.oid = p.pronamespace
  where n.nspname = 'public'
    and p.proname = 'viso_enforce_monthly_schedule_publish_limit'
    and p.prosecdef
    and p.prorettype = 'trigger'::regtype
    and exists (
      select 1
      from pg_catalog.pg_trigger t
      where t.tgfoid = p.oid
        and not t.tgisinternal
    );

  if v_viso_guard <> 1 then
    raise exception
      'AUTH_DB_003_PRECONDITION_FAILED: VISO monthly guard drifted';
  end if;
end
$auth_db_003_precheck$;

create temporary table auth_db_003_hardening_manifest
on commit drop
as
with base as (
  select
    p.oid,
    format(
      '%I.%I(%s)',
      n.nspname,
      p.proname,
      pg_get_function_identity_arguments(p.oid)
    ) as qualified_signature,
    n.nspname as schema_name,
    p.prosecdef,
    p.proowner,
    p.proconfig,
    p.proacl,
    p.prosrc,
    p.prorettype
  from pg_catalog.pg_proc p
  join pg_catalog.pg_namespace n
    on n.oid = p.pronamespace
  where n.nspname in (
    'app_private',
    'club',
    'pass',
    'public',
    'talento'
  )
    and p.prosecdef
)
select
  b.qualified_signature,
  'VENTO_OS'::text as product_boundary,
  'SECURITY_DEFINER'::text as current_security_mode,
  pg_get_userbyid(b.proowner) as current_owner,
  jsonb_build_object(
    'superuser',
    r.rolsuper,
    'bypassrls',
    r.rolbypassrls,
    'canlogin',
    r.rolcanlogin
  ) as current_owner_attributes,
  coalesce(
    array_to_string(b.proconfig, ','),
    ''
  ) as current_search_path,
  jsonb_build_object(
    'anon',
    has_function_privilege(
      'anon',
      b.oid,
      'EXECUTE'
    ),
    'authenticated',
    has_function_privilege(
      'authenticated',
      b.oid,
      'EXECUTE'
    ),
    'service_role',
    has_function_privilege(
      'service_role',
      b.oid,
      'EXECUTE'
    )
  ) as current_execute_audiences,
  coalesce(
    (
      select split_part(setting, '=', 2)
      from unnest(
        coalesce(b.proconfig, '{}'::text[])
      ) setting
      where setting like 'row_security=%'
      limit 1
    ),
    'default'
  ) as current_row_security_config,
  coalesce(
    (
      select jsonb_agg(
        jsonb_build_object(
          'trigger',
          t.tgname,
          'schema',
          tn.nspname,
          'relation',
          c.relname
        )
        order by tn.nspname, c.relname, t.tgname
      )
      from pg_catalog.pg_trigger t
      join pg_catalog.pg_class c
        on c.oid = t.tgrelid
      join pg_catalog.pg_namespace tn
        on tn.oid = c.relnamespace
      where t.tgfoid = b.oid
        and not t.tgisinternal
    ),
    '[]'::jsonb
  ) as trigger_associations,
  'md5:' || md5(
    replace(
      pg_get_functiondef(b.oid),
      E'\r\n',
      E'\n'
    )
  ) as current_definition_hash,
  'md5:' || md5(
    replace(
      b.prosrc,
      E'\r\n',
      E'\n'
    )
  ) as current_body_hash,
  case
    when b.qualified_signature in (
      'public.can_access_recipe_scope(p_site_id uuid, p_area_id uuid)',
      'public.current_employee_area_id()',
      'public.current_employee_site_id()',
      'public.is_active_staff()',
      'public.is_global_manager()',
      'public.is_manager()',
      'public.is_manager_or_owner()',
      'public.is_owner()'
    )
      then 'CONVERT_TO_INVOKER'
    when b.qualified_signature in (
      'public.notify_shift_published()',
      'public.update_loyalty_balance()'
    )
      then 'RETIRE'
    else 'BLOCKED_PENDING_EVIDENCE'
  end as canonical_disposition,
  case
    when b.qualified_signature in (
      'public.can_access_recipe_scope(p_site_id uuid, p_area_id uuid)',
      'public.current_employee_area_id()',
      'public.current_employee_site_id()',
      'public.is_active_staff()',
      'public.is_global_manager()',
      'public.is_manager()',
      'public.is_manager_or_owner()',
      'public.is_owner()',
      'public.notify_shift_published()',
      'public.update_loyalty_balance()'
    )
      then 'NOT_APPLICABLE'
    else 'UNRESOLVED'
  end as exception_class,
  case
    when b.qualified_signature in (
      'public.can_access_recipe_scope(p_site_id uuid, p_area_id uuid)',
      'public.current_employee_area_id()',
      'public.current_employee_site_id()',
      'public.is_active_staff()',
      'public.is_global_manager()',
      'public.is_manager()',
      'public.is_manager_or_owner()',
      'public.is_owner()'
    )
      then 'CURRENT_SIGNATURE'
    when b.qualified_signature in (
      'public.notify_shift_published()',
      'public.update_loyalty_balance()'
    )
      then 'RETIRE_AFTER_ZERO_CONSUMER_GATE'
    when b.qualified_signature =
      'public.viso_enforce_monthly_schedule_publish_limit()'
      then 'DISP::MOVE::VISO_MONTHLY_LIMIT_GUARD'
    else 'UNRESOLVED'
  end as target_location,
  case
    when b.qualified_signature in (
      'public.can_access_recipe_scope(p_site_id uuid, p_area_id uuid)',
      'public.current_employee_area_id()',
      'public.current_employee_site_id()',
      'public.is_active_staff()',
      'public.is_global_manager()',
      'public.is_manager()',
      'public.is_manager_or_owner()',
      'public.is_owner()'
    )
      then 'SECURITY_INVOKER'
    when b.qualified_signature in (
      'public.notify_shift_published()',
      'public.update_loyalty_balance()'
    )
      then 'RETIRED'
    else 'UNRESOLVED'
  end as target_security_mode,
  case
    when b.qualified_signature in (
      'public.can_access_recipe_scope(p_site_id uuid, p_area_id uuid)',
      'public.current_employee_area_id()',
      'public.current_employee_site_id()',
      'public.is_active_staff()',
      'public.is_global_manager()',
      'public.is_manager()',
      'public.is_manager_or_owner()',
      'public.is_owner()'
    )
      then 'NOT_APPLICABLE_SECURITY_INVOKER'
    when b.qualified_signature in (
      'public.notify_shift_published()',
      'public.update_loyalty_balance()'
    )
      then 'NOT_APPLICABLE_AFTER_RETIRE'
    else 'SUPA_ARC_015_DEDICATED_NOLOGIN_ROLE_UNRESOLVED'
  end as target_owner_contract,
  case
    when b.qualified_signature in (
      'public.can_access_recipe_scope(p_site_id uuid, p_area_id uuid)',
      'public.current_employee_area_id()',
      'public.current_employee_site_id()',
      'public.is_active_staff()',
      'public.is_global_manager()',
      'public.is_manager()',
      'public.is_manager_or_owner()',
      'public.is_owner()'
    )
      then 'DELEGATION_ONLY_PRIVILEGED_CORE_RETAINED'
    when b.qualified_signature in (
      'public.notify_shift_published()',
      'public.update_loyalty_balance()'
    )
      then 'ZERO_CONSUMER_GATE_REQUIRED'
    else 'BLOCKED_PENDING_EVIDENCE'
  end as authorization_contract,
  'AUTH-DB-004+AUTH-DB-005'::text
    as grant_contract_reference,
  case
    when b.qualified_signature in (
      'public.can_access_recipe_scope(p_site_id uuid, p_area_id uuid)',
      'public.current_employee_area_id()',
      'public.current_employee_site_id()',
      'public.is_active_staff()',
      'public.is_global_manager()',
      'public.is_manager()',
      'public.is_manager_or_owner()',
      'public.is_owner()'
    )
      then 'DELEGATED_FUNCTION_DEPENDENCIES_VERIFIED'
    else 'SUPA-TRANS-* EVIDENCE REQUIRED'
  end as dependencies,
  case
    when b.qualified_signature in (
      'public.can_access_recipe_scope(p_site_id uuid, p_area_id uuid)',
      'public.current_employee_area_id()',
      'public.current_employee_site_id()',
      'public.is_active_staff()',
      'public.is_global_manager()',
      'public.is_manager()',
      'public.is_manager_or_owner()',
      'public.is_owner()'
    )
      then 'NO_DIRECT_TABLE_READ'
    else 'UNRESOLVED_OR_NOT_EXECUTED'
  end as read_set,
  case
    when b.qualified_signature in (
      'public.can_access_recipe_scope(p_site_id uuid, p_area_id uuid)',
      'public.current_employee_area_id()',
      'public.current_employee_site_id()',
      'public.is_active_staff()',
      'public.is_global_manager()',
      'public.is_manager()',
      'public.is_manager_or_owner()',
      'public.is_owner()'
    )
      then 'NONE_DIRECT'
    else 'UNRESOLVED_OR_NOT_EXECUTED'
  end as write_set,
  'AUTH-DB-003::GLOBAL_FORWARD_MIGRATION'::text
    as migration_reference,
  case
    when b.qualified_signature in (
      'public.can_access_recipe_scope(p_site_id uuid, p_area_id uuid)',
      'public.current_employee_area_id()',
      'public.current_employee_site_id()',
      'public.is_active_staff()',
      'public.is_global_manager()',
      'public.is_manager()',
      'public.is_manager_or_owner()',
      'public.is_owner()'
    )
      then 'FORWARD_FIX_ONLY_DO_NOT_RESTORE_DEFINER_WITHOUT_NEW_APPROVAL'
    else 'NO_CHANGE_IN_THIS_MIGRATION'
  end as rollback,
  case
    when b.qualified_signature in (
      'public.can_access_recipe_scope(p_site_id uuid, p_area_id uuid)',
      'public.current_employee_area_id()',
      'public.current_employee_site_id()',
      'public.is_active_staff()',
      'public.is_global_manager()',
      'public.is_manager()',
      'public.is_manager_or_owner()',
      'public.is_owner()'
    )
      then 'BODY_HASH_AND_EXECUTE_AUDIENCE_MATCHED'
    when b.qualified_signature in (
      'public.notify_shift_published()',
      'public.update_loyalty_balance()'
    )
      then 'CANONICAL_RETIRE_DISPOSITION_ZERO_CONSUMER_NOT_PROVEN'
    else 'INSUFFICIENT_EXCEPTION_OWNER_AUTHORIZATION_EVIDENCE'
  end as evidence,
  coalesce(b.proacl::text, '') as current_acl
from base b
join pg_catalog.pg_roles r
  on r.oid = b.proowner;

do $auth_db_003_manifest_check$
declare
  v_total bigint;
  v_convert bigint;
  v_retire bigint;
  v_blocked bigint;
  v_keep bigint;
begin
  select
    count(*),
    count(*) filter (
      where canonical_disposition = 'CONVERT_TO_INVOKER'
    ),
    count(*) filter (
      where canonical_disposition = 'RETIRE'
    ),
    count(*) filter (
      where canonical_disposition = 'BLOCKED_PENDING_EVIDENCE'
    ),
    count(*) filter (
      where canonical_disposition = 'KEEP_AS_DEFINER'
    )
  into
    v_total,
    v_convert,
    v_retire,
    v_blocked,
    v_keep
  from auth_db_003_hardening_manifest;

  if
    v_total <> 206
    or v_convert <> 8
    or v_retire <> 2
    or v_blocked <> 196
    or v_keep <> 0
  then
    raise exception
      'AUTH_DB_003_MANIFEST_FAILED: expected 206/8/2/196/0 observed %/%/%/%/%',
      v_total,
      v_convert,
      v_retire,
      v_blocked,
      v_keep;
  end if;
end
$auth_db_003_manifest_check$;

alter function public.can_access_recipe_scope(uuid, uuid)
  security invoker;

alter function public.current_employee_area_id()
  security invoker;
alter function public.current_employee_area_id()
  reset row_security;

alter function public.current_employee_site_id()
  security invoker;
alter function public.current_employee_site_id()
  reset row_security;

alter function public.is_active_staff()
  security invoker;
alter function public.is_active_staff()
  reset row_security;

alter function public.is_global_manager()
  security invoker;
alter function public.is_global_manager()
  reset row_security;

alter function public.is_manager()
  security invoker;
alter function public.is_manager()
  reset row_security;

alter function public.is_manager_or_owner()
  security invoker;
alter function public.is_manager_or_owner()
  reset row_security;

alter function public.is_owner()
  security invoker;
alter function public.is_owner()
  reset row_security;

do $auth_db_003_postcheck$
declare
  v_target_count bigint;
  v_body_acl_count bigint;
  v_governed bigint;
  v_sd bigint;
  v_vento_sd bigint;
  v_vital_sd bigint;
  v_direct_sd bigint;
  v_trigger_sd bigint;
  v_live_trigger_sd bigint;
  v_orphan_trigger_sd bigint;
  v_anon_sd bigint;
  v_auth_sd bigint;
  v_row_security_off bigint;
begin
  select count(*)
  into v_target_count
  from auth_db_003_hardening_manifest m
  join pg_catalog.pg_proc p
    on format(
      '%I.%I(%s)',
      (
        select n.nspname
        from pg_catalog.pg_namespace n
        where n.oid = p.pronamespace
      ),
      p.proname,
      pg_get_function_identity_arguments(p.oid)
    ) = m.qualified_signature
  join pg_catalog.pg_language l
    on l.oid = p.prolang
  where m.canonical_disposition = 'CONVERT_TO_INVOKER'
    and not p.prosecdef
    and l.lanname = 'sql'
    and pg_get_userbyid(p.proowner) = 'postgres'
    and coalesce(array_to_string(p.proconfig, ','), '')
      = 'search_path=public'
    and has_function_privilege('anon', p.oid, 'EXECUTE')
    and has_function_privilege(
      'authenticated',
      p.oid,
      'EXECUTE'
    )
    and has_function_privilege(
      'service_role',
      p.oid,
      'EXECUTE'
    );

  if v_target_count <> 8 then
    raise exception
      'AUTH_DB_003_POSTCONDITION_FAILED: invoker target count expected 8 observed %',
      v_target_count;
  end if;

  select count(*)
  into v_body_acl_count
  from auth_db_003_hardening_manifest m
  join pg_catalog.pg_proc p
    on format(
      '%I.%I(%s)',
      (
        select n.nspname
        from pg_catalog.pg_namespace n
        where n.oid = p.pronamespace
      ),
      p.proname,
      pg_get_function_identity_arguments(p.oid)
    ) = m.qualified_signature
  where m.canonical_disposition = 'CONVERT_TO_INVOKER'
    and (
      'md5:' || md5(
        replace(
          p.prosrc,
          E'\r\n',
          E'\n'
        )
      )
    ) = m.current_body_hash
    and coalesce(p.proacl::text, '') = m.current_acl;

  if v_body_acl_count <> 8 then
    raise exception
      'AUTH_DB_003_POSTCONDITION_FAILED: body or ACL drift detected';
  end if;

  select
    count(*),
    count(*) filter (where p.prosecdef),
    count(*) filter (
      where p.prosecdef
        and n.nspname <> 'vital'
    ),
    count(*) filter (
      where p.prosecdef
        and n.nspname = 'vital'
    ),
    count(*) filter (
      where p.prosecdef
        and p.prorettype <> 'trigger'::regtype
    ),
    count(*) filter (
      where p.prosecdef
        and p.prorettype = 'trigger'::regtype
    ),
    count(*) filter (
      where p.prosecdef
        and p.prorettype = 'trigger'::regtype
        and exists (
          select 1
          from pg_catalog.pg_trigger t
          where t.tgfoid = p.oid
            and not t.tgisinternal
        )
    ),
    count(*) filter (
      where p.prosecdef
        and p.prorettype = 'trigger'::regtype
        and not exists (
          select 1
          from pg_catalog.pg_trigger t
          where t.tgfoid = p.oid
            and not t.tgisinternal
        )
    ),
    count(*) filter (
      where p.prosecdef
        and has_function_privilege('anon', p.oid, 'EXECUTE')
    ),
    count(*) filter (
      where p.prosecdef
        and has_function_privilege(
          'authenticated',
          p.oid,
          'EXECUTE'
        )
    ),
    count(*) filter (
      where p.prosecdef
        and coalesce(array_to_string(p.proconfig, ','), '')
          like '%row_security=off%'
    )
  into
    v_governed,
    v_sd,
    v_vento_sd,
    v_vital_sd,
    v_direct_sd,
    v_trigger_sd,
    v_live_trigger_sd,
    v_orphan_trigger_sd,
    v_anon_sd,
    v_auth_sd,
    v_row_security_off
  from pg_catalog.pg_proc p
  join pg_catalog.pg_namespace n
    on n.oid = p.pronamespace
  where n.nspname in (
    'app_private',
    'club',
    'pass',
    'public',
    'talento',
    'vital'
  );

  if
    v_governed <> 348
    or v_sd <> 203
    or v_vento_sd <> 198
    or v_vital_sd <> 5
    or v_direct_sd <> 171
    or v_trigger_sd <> 32
    or v_live_trigger_sd <> 30
    or v_orphan_trigger_sd <> 2
    or v_anon_sd <> 38
    or v_auth_sd <> 144
    or v_row_security_off <> 7
  then
    raise exception
      'AUTH_DB_003_POSTCONDITION_FAILED: cardinality mismatch';
  end if;
end
$auth_db_003_postcheck$;

commit;
