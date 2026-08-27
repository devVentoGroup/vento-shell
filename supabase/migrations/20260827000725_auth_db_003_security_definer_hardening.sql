begin;

create temporary table auth_db_003_baseline_snapshot
on commit drop
as
select
  count(*) as governed_total,
  count(*) filter (where p.prosecdef) as security_definer_total,
  count(*) filter (
    where p.prosecdef
      and n.nspname <> 'vital'
  ) as vento_security_definer,
  count(*) filter (
    where p.prosecdef
      and n.nspname = 'vital'
  ) as vital_security_definer,
  count(*) filter (
    where p.prosecdef
      and p.prorettype <> 'trigger'::regtype
  ) as direct_security_definer,
  count(*) filter (
    where p.prosecdef
      and p.prorettype = 'trigger'::regtype
  ) as trigger_security_definer,
  count(*) filter (
    where p.prosecdef
      and has_function_privilege(
        'anon',
        p.oid,
        'EXECUTE'
      )
  ) as anon_security_definer,
  count(*) filter (
    where p.prosecdef
      and has_function_privilege(
        'authenticated',
        p.oid,
        'EXECUTE'
      )
  ) as authenticated_security_definer,
  count(*) filter (
    where p.prosecdef
      and has_function_privilege(
        'service_role',
        p.oid,
        'EXECUTE'
      )
  ) as service_security_definer,
  count(*) filter (
    where p.prosecdef
      and coalesce(
        array_to_string(p.proconfig, ','),
        ''
      ) like '%row_security=off%'
  ) as row_security_off,
  count(*) filter (
    where p.prosecdef
      and n.nspname <> 'vital'
      and pg_get_userbyid(p.proowner) = 'postgres'
  ) as postgres_owned_vento,
  null::text as baseline_profile
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

do $auth_db_003_baseline$
declare
  b auth_db_003_baseline_snapshot%rowtype;
begin
  select *
  into strict b
  from auth_db_003_baseline_snapshot;

  if
    b.governed_total = 318
    and b.security_definer_total = 208
    and b.vento_security_definer = 204
    and b.vital_security_definer = 4
    and b.direct_security_definer = 177
    and b.trigger_security_definer = 31
  then
    update auth_db_003_baseline_snapshot
    set baseline_profile = 'LOCAL_REPLAY';

  elsif
    b.governed_total = 348
    and b.security_definer_total = 211
    and b.vento_security_definer = 206
    and b.vital_security_definer = 5
    and b.direct_security_definer = 179
    and b.trigger_security_definer = 32
  then
    update auth_db_003_baseline_snapshot
    set baseline_profile = 'REMOTE_AUDITED';

  else
    raise exception
      'AUTH_DB_003_BASELINE_UNRECOGNIZED: governed=% sd=% vento=% vital=% direct=% trigger=%',
      b.governed_total,
      b.security_definer_total,
      b.vento_security_definer,
      b.vital_security_definer,
      b.direct_security_definer,
      b.trigger_security_definer;
  end if;
end
$auth_db_003_baseline$;

create temporary table auth_db_003_target_snapshot
on commit drop
as
with expected(
  qualified_signature,
  body_md5,
  exact_config
) as (
  values
    (
      'public.can_access_recipe_scope(p_site_id uuid, p_area_id uuid)',
      'a43d76af47c6e3f2c10fcb504cab4803',
      'search_path=public'
    ),
    (
      'public.current_employee_area_id()',
      '96dc4c7b968dd4525510b9c66c59f7a4',
      null::text
    ),
    (
      'public.current_employee_site_id()',
      '2e478f29e06c7bafb9214a17d384a028',
      null::text
    ),
    (
      'public.is_active_staff()',
      '96927b1f831a1e97b006b9ea2d25cc6c',
      null::text
    ),
    (
      'public.is_global_manager()',
      'bd7997fcfba09712e790ae3c9213890b',
      null::text
    ),
    (
      'public.is_manager()',
      'c64498e4160030d5115b43e9c18a4dec',
      null::text
    ),
    (
      'public.is_manager_or_owner()',
      '25f4a2af9ba3f056e95091413fc5a43d',
      null::text
    ),
    (
      'public.is_owner()',
      'd67bd14c118d7b7e6fa1e1575215855d',
      null::text
    )
),
actual as (
  select
    p.oid,
    format(
      '%I.%I(%s)',
      n.nspname,
      p.proname,
      pg_get_function_identity_arguments(p.oid)
    ) as qualified_signature,
    l.lanname,
    p.provolatile,
    p.prosecdef,
    p.proowner,
    pg_get_userbyid(p.proowner) as owner_name,
    coalesce(
      array_to_string(p.proconfig, ','),
      ''
    ) as current_config,
    p.proacl as current_acl,
    md5(
      replace(
        p.prosrc,
        E'\r\n',
        E'\n'
      )
    ) as current_body_md5,
    has_function_privilege(
      'anon',
      p.oid,
      'EXECUTE'
    ) as anon_execute,
    has_function_privilege(
      'authenticated',
      p.oid,
      'EXECUTE'
    ) as authenticated_execute,
    has_function_privilege(
      'service_role',
      p.oid,
      'EXECUTE'
    ) as service_execute
  from pg_catalog.pg_proc p
  join pg_catalog.pg_namespace n
    on n.oid = p.pronamespace
  join pg_catalog.pg_language l
    on l.oid = p.prolang
)
select
  e.qualified_signature,
  e.body_md5 as expected_body_md5,
  e.exact_config,
  a.oid,
  a.lanname,
  a.provolatile,
  a.prosecdef,
  a.proowner,
  a.owner_name,
  a.current_config,
  a.current_acl,
  a.current_body_md5,
  a.anon_execute,
  a.authenticated_execute,
  a.service_execute
from expected e
left join actual a
  on a.qualified_signature = e.qualified_signature;

do $auth_db_003_targets$
declare
  v_present bigint;
  v_valid bigint;
  v_dependencies bigint;
begin
  select count(*) filter (
    where oid is not null
  )
  into v_present
  from auth_db_003_target_snapshot;

  if v_present <> 8 then
    raise exception
      'AUTH_DB_003_TARGETS_MISSING: expected 8 observed %',
      v_present;
  end if;

  select count(*)
  into v_valid
  from auth_db_003_target_snapshot t
  where t.lanname = 'sql'
    and t.provolatile = 's'
    and t.prosecdef
    and t.owner_name = 'postgres'
    and t.current_body_md5 = t.expected_body_md5
    and t.anon_execute
    and t.authenticated_execute
    and t.service_execute
    and (
      (
        t.exact_config is not null
        and t.current_config = t.exact_config
      )
      or (
        t.exact_config is null
        and t.current_config in (
          'search_path=public',
          'search_path=public,row_security=off'
        )
      )
    );

  if v_valid <> 8 then
    raise exception
      'AUTH_DB_003_TARGETS_DRIFTED: expected 8 exact approved wrappers observed %',
      v_valid;
  end if;

  with expected(signature) as (
    values
      ('public.current_employee_selected_area_id()'),
      ('public.current_employee_selected_site_id()'),
      ('public.is_employee()'),
      ('public.current_employee_role()'),
      ('public.can_access_site(p_site_id uuid)'),
      ('public.can_access_area(p_area_id uuid)')
  )
  select count(*)
  into v_dependencies
  from expected e
  join (
    select
      p.oid,
      format(
        '%I.%I(%s)',
        n.nspname,
        p.proname,
        pg_get_function_identity_arguments(p.oid)
      ) as signature,
      p.prosecdef,
      pg_get_userbyid(p.proowner) as owner_name
    from pg_catalog.pg_proc p
    join pg_catalog.pg_namespace n
      on n.oid = p.pronamespace
  ) a
    on a.signature = e.signature
  where a.prosecdef
    and a.owner_name = 'postgres'
    and has_function_privilege(
      'anon',
      a.oid,
      'EXECUTE'
    )
    and has_function_privilege(
      'authenticated',
      a.oid,
      'EXECUTE'
    )
    and has_function_privilege(
      'service_role',
      a.oid,
      'EXECUTE'
    );

  if v_dependencies <> 6 then
    raise exception
      'AUTH_DB_003_DELEGATED_CORE_DRIFTED: expected 6 privileged dependencies observed %',
      v_dependencies;
  end if;
end
$auth_db_003_targets$;

create temporary table auth_db_003_transition_snapshot
on commit drop
as
with expected(
  qualified_signature,
  body_md5,
  disposition
) as (
  values
    (
      'public.notify_shift_published()',
      '3756e852e9806deaabe419c73f2ce4c2',
      'RETIRE'
    ),
    (
      'public.update_loyalty_balance()',
      '5d6893c0f7dd1e9f8dbd67ecaa60d5b2',
      'RETIRE'
    ),
    (
      'public.viso_enforce_monthly_schedule_publish_limit()',
      'da4848076978767fabe5f79c40a54e25',
      'BLOCKED_PENDING_EVIDENCE'
    )
),
actual as (
  select
    p.oid,
    format(
      '%I.%I(%s)',
      n.nspname,
      p.proname,
      pg_get_function_identity_arguments(p.oid)
    ) as qualified_signature,
    p.prosecdef,
    p.prorettype,
    p.proowner,
    pg_get_userbyid(p.proowner) as owner_name,
    coalesce(
      array_to_string(p.proconfig, ','),
      ''
    ) as current_config,
    p.proacl as current_acl,
    md5(
      replace(
        p.prosrc,
        E'\r\n',
        E'\n'
      )
    ) as current_body_md5,
    (
      select count(*)
      from pg_catalog.pg_trigger t
      where t.tgfoid = p.oid
        and not t.tgisinternal
    ) as trigger_associations
  from pg_catalog.pg_proc p
  join pg_catalog.pg_namespace n
    on n.oid = p.pronamespace
)
select
  e.qualified_signature,
  e.body_md5 as expected_body_md5,
  e.disposition,
  a.oid,
  a.prosecdef,
  a.prorettype,
  a.proowner,
  a.owner_name,
  a.current_config,
  a.current_acl,
  a.current_body_md5,
  a.trigger_associations
from expected e
left join actual a
  on a.qualified_signature = e.qualified_signature;

do $auth_db_003_transition$
declare
  v_exact bigint;
  v_viso bigint;
begin
  select count(*)
  into v_exact
  from auth_db_003_transition_snapshot t
  where t.oid is not null
    and t.prosecdef
    and t.prorettype = 'trigger'::regtype
    and t.owner_name = 'postgres'
    and t.current_body_md5 = t.expected_body_md5;

  if v_exact <> 3 then
    raise exception
      'AUTH_DB_003_TRANSITION_FUNCTION_DRIFT: expected 3 exact functions observed %',
      v_exact;
  end if;

  select count(*)
  into v_viso
  from auth_db_003_transition_snapshot t
  where t.qualified_signature =
      'public.viso_enforce_monthly_schedule_publish_limit()'
    and t.current_config = 'search_path=public';

  if v_viso <> 1 then
    raise exception
      'AUTH_DB_003_VISO_CONFIG_DRIFT';
  end if;
end
$auth_db_003_transition$;

create temporary table auth_db_003_hardening_manifest
on commit drop
as
select
  format(
    '%I.%I(%s)',
    n.nspname,
    p.proname,
    pg_get_function_identity_arguments(p.oid)
  ) as qualified_signature,
  pg_get_userbyid(p.proowner) as current_owner,
  coalesce(
    array_to_string(p.proconfig, ','),
    ''
  ) as current_config,
  jsonb_build_object(
    'anon',
      has_function_privilege(
        'anon',
        p.oid,
        'EXECUTE'
      ),
    'authenticated',
      has_function_privilege(
        'authenticated',
        p.oid,
        'EXECUTE'
      ),
    'service_role',
      has_function_privilege(
        'service_role',
        p.oid,
        'EXECUTE'
      )
  ) as current_execute_audiences,
  case
    when format(
      '%I.%I(%s)',
      n.nspname,
      p.proname,
      pg_get_function_identity_arguments(p.oid)
    ) in (
      'public.can_access_recipe_scope(p_site_id uuid, p_area_id uuid)',
      'public.current_employee_area_id()',
      'public.current_employee_site_id()',
      'public.is_active_staff()',
      'public.is_global_manager()',
      'public.is_manager()',
      'public.is_manager_or_owner()',
      'public.is_owner()'
    ) then 'CONVERT_TO_INVOKER'

    when format(
      '%I.%I(%s)',
      n.nspname,
      p.proname,
      pg_get_function_identity_arguments(p.oid)
    ) in (
      'public.notify_shift_published()',
      'public.update_loyalty_balance()'
    ) then 'RETIRE'

    else 'BLOCKED_PENDING_EVIDENCE'
  end as canonical_disposition,
  case
    when format(
      '%I.%I(%s)',
      n.nspname,
      p.proname,
      pg_get_function_identity_arguments(p.oid)
    ) in (
      'public.can_access_recipe_scope(p_site_id uuid, p_area_id uuid)',
      'public.current_employee_area_id()',
      'public.current_employee_site_id()',
      'public.is_active_staff()',
      'public.is_global_manager()',
      'public.is_manager()',
      'public.is_manager_or_owner()',
      'public.is_owner()'
    ) then 'SECURITY_INVOKER'

    when format(
      '%I.%I(%s)',
      n.nspname,
      p.proname,
      pg_get_function_identity_arguments(p.oid)
    ) in (
      'public.notify_shift_published()',
      'public.update_loyalty_balance()'
    ) then 'RETIRED_AFTER_ZERO_CONSUMER_GATE'

    else 'UNRESOLVED'
  end as target_state,
  case
    when format(
      '%I.%I(%s)',
      n.nspname,
      p.proname,
      pg_get_function_identity_arguments(p.oid)
    ) in (
      'public.can_access_recipe_scope(p_site_id uuid, p_area_id uuid)',
      'public.current_employee_area_id()',
      'public.current_employee_site_id()',
      'public.is_active_staff()',
      'public.is_global_manager()',
      'public.is_manager()',
      'public.is_manager_or_owner()',
      'public.is_owner()'
    ) then 'DELEGATION_ONLY_PRIVILEGED_CORE_RETAINED'

    when format(
      '%I.%I(%s)',
      n.nspname,
      p.proname,
      pg_get_function_identity_arguments(p.oid)
    ) in (
      'public.notify_shift_published()',
      'public.update_loyalty_balance()'
    ) then 'ZERO_CONSUMER_GATE_REQUIRED'

    else 'INSUFFICIENT_EVIDENCE'
  end as evidence_class
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
  and p.prosecdef;

do $auth_db_003_manifest$
declare
  b auth_db_003_baseline_snapshot%rowtype;
  v_total bigint;
  v_convert bigint;
  v_retire bigint;
  v_blocked bigint;
begin
  select *
  into strict b
  from auth_db_003_baseline_snapshot;

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
    )
  into
    v_total,
    v_convert,
    v_retire,
    v_blocked
  from auth_db_003_hardening_manifest;

  if
    v_total <> b.vento_security_definer
    or v_convert <> 8
    or v_retire <> 2
    or v_blocked <> b.vento_security_definer - 10
  then
    raise exception
      'AUTH_DB_003_MANIFEST_INVALID: profile=% total=% convert=% retire=% blocked=%',
      b.baseline_profile,
      v_total,
      v_convert,
      v_retire,
      v_blocked;
  end if;
end
$auth_db_003_manifest$;

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
  b auth_db_003_baseline_snapshot%rowtype;
  p record;
  v_target_row_security_off bigint;
  v_exact_targets bigint;
  v_transition_exact bigint;
begin
  select *
  into strict b
  from auth_db_003_baseline_snapshot;

  select count(*)
  into v_target_row_security_off
  from auth_db_003_target_snapshot
  where current_config like '%row_security=off%';

  select
    count(*) as governed_total,
    count(*) filter (
      where proc.prosecdef
    ) as security_definer_total,
    count(*) filter (
      where proc.prosecdef
        and ns.nspname <> 'vital'
    ) as vento_security_definer,
    count(*) filter (
      where proc.prosecdef
        and ns.nspname = 'vital'
    ) as vital_security_definer,
    count(*) filter (
      where proc.prosecdef
        and proc.prorettype <> 'trigger'::regtype
    ) as direct_security_definer,
    count(*) filter (
      where proc.prosecdef
        and proc.prorettype = 'trigger'::regtype
    ) as trigger_security_definer,
    count(*) filter (
      where proc.prosecdef
        and has_function_privilege(
          'anon',
          proc.oid,
          'EXECUTE'
        )
    ) as anon_security_definer,
    count(*) filter (
      where proc.prosecdef
        and has_function_privilege(
          'authenticated',
          proc.oid,
          'EXECUTE'
        )
    ) as authenticated_security_definer,
    count(*) filter (
      where proc.prosecdef
        and has_function_privilege(
          'service_role',
          proc.oid,
          'EXECUTE'
        )
    ) as service_security_definer,
    count(*) filter (
      where proc.prosecdef
        and coalesce(
          array_to_string(proc.proconfig, ','),
          ''
        ) like '%row_security=off%'
    ) as row_security_off,
    count(*) filter (
      where proc.prosecdef
        and ns.nspname <> 'vital'
        and pg_get_userbyid(proc.proowner) = 'postgres'
    ) as postgres_owned_vento
  into p
  from pg_catalog.pg_proc proc
  join pg_catalog.pg_namespace ns
    on ns.oid = proc.pronamespace
  where ns.nspname in (
    'app_private',
    'club',
    'pass',
    'public',
    'talento',
    'vital'
  );

  if p.governed_total <> b.governed_total then
    raise exception
      'AUTH_DB_003_POSTCHECK: governed function count changed';
  end if;

  if p.security_definer_total <> b.security_definer_total - 8 then
    raise exception
      'AUTH_DB_003_POSTCHECK: SECURITY DEFINER delta is not -8';
  end if;

  if p.vento_security_definer <> b.vento_security_definer - 8 then
    raise exception
      'AUTH_DB_003_POSTCHECK: Vento SECURITY DEFINER delta is not -8';
  end if;

  if p.vital_security_definer <> b.vital_security_definer then
    raise exception
      'AUTH_DB_003_POSTCHECK: VITAL boundary changed';
  end if;

  if p.direct_security_definer <> b.direct_security_definer - 8 then
    raise exception
      'AUTH_DB_003_POSTCHECK: direct SECURITY DEFINER delta is not -8';
  end if;

  if p.trigger_security_definer <> b.trigger_security_definer then
    raise exception
      'AUTH_DB_003_POSTCHECK: trigger SECURITY DEFINER count changed';
  end if;

  if p.anon_security_definer <> b.anon_security_definer - 8 then
    raise exception
      'AUTH_DB_003_POSTCHECK: anon privileged exposure delta is not -8';
  end if;

  if
    p.authenticated_security_definer
    <> b.authenticated_security_definer - 8
  then
    raise exception
      'AUTH_DB_003_POSTCHECK: authenticated privileged exposure delta is not -8';
  end if;

  if p.service_security_definer <> b.service_security_definer - 8 then
    raise exception
      'AUTH_DB_003_POSTCHECK: service privileged exposure delta is not -8';
  end if;

  if
    p.row_security_off
    <> b.row_security_off - v_target_row_security_off
  then
    raise exception
      'AUTH_DB_003_POSTCHECK: row_security function-config delta invalid';
  end if;

  if p.postgres_owned_vento <> b.postgres_owned_vento - 8 then
    raise exception
      'AUTH_DB_003_POSTCHECK: postgres-owned Vento definer delta is not -8';
  end if;

  select count(*)
  into v_exact_targets
  from auth_db_003_target_snapshot s
  join pg_catalog.pg_proc proc
    on proc.oid = s.oid
  join pg_catalog.pg_language lang
    on lang.oid = proc.prolang
  where not proc.prosecdef
    and lang.lanname = 'sql'
    and proc.provolatile = 's'
    and proc.proowner = s.proowner
    and proc.proacl is not distinct from s.current_acl
    and md5(
      replace(
        proc.prosrc,
        E'\r\n',
        E'\n'
      )
    ) = s.expected_body_md5
    and coalesce(
      array_to_string(proc.proconfig, ','),
      ''
    ) = 'search_path=public'
    and has_function_privilege(
      'anon',
      proc.oid,
      'EXECUTE'
    )
    and has_function_privilege(
      'authenticated',
      proc.oid,
      'EXECUTE'
    )
    and has_function_privilege(
      'service_role',
      proc.oid,
      'EXECUTE'
    );

  if v_exact_targets <> 8 then
    raise exception
      'AUTH_DB_003_POSTCHECK: exact invoker wrappers expected 8 observed %',
      v_exact_targets;
  end if;

  select count(*)
  into v_transition_exact
  from auth_db_003_transition_snapshot s
  join pg_catalog.pg_proc proc
    on proc.oid = s.oid
  where proc.prosecdef = s.prosecdef
    and proc.proowner = s.proowner
    and proc.proacl is not distinct from s.current_acl
    and coalesce(
      array_to_string(proc.proconfig, ','),
      ''
    ) = s.current_config
    and md5(
      replace(
        proc.prosrc,
        E'\r\n',
        E'\n'
      )
    ) = s.expected_body_md5
    and (
      select count(*)
      from pg_catalog.pg_trigger trg
      where trg.tgfoid = proc.oid
        and not trg.tgisinternal
    ) = s.trigger_associations;

  if v_transition_exact <> 3 then
    raise exception
      'AUTH_DB_003_POSTCHECK: transition-owned functions changed';
  end if;
end
$auth_db_003_postcheck$;

commit;
