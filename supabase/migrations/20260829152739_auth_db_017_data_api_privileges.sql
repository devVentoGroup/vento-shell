begin;


    create temporary table auth_db_017_governed_schemas
        (
            schema_name  text primary key,
            schema_class text not null
        )
    on commit drop;
    insert into auth_db_017_governed_schemas
        (
            schema_name,
            schema_class
        )
    values
        (
            'org_governance',
            'OWNER_SCHEMA'
        )
        ,
        (
            'recruiting',
            'OWNER_SCHEMA'
        )
        ,
        (
            'workforce',
            'OWNER_SCHEMA'
        )
        ,
        (
            'work_scheduling',
            'OWNER_SCHEMA'
        )
        ,
        (
            'attendance',
            'OWNER_SCHEMA'
        )
        ,
        (
            'payroll',
            'OWNER_SCHEMA'
        )
        ,
        (
            'operational_compliance',
            'OWNER_SCHEMA'
        )
        ,
        (
            'product_catalog',
            'OWNER_SCHEMA'
        )
        ,
        (
            'recipes',
            'OWNER_SCHEMA'
        )
        ,
        (
            'commercial_offer',
            'OWNER_SCHEMA'
        )
        ,
        (
            'procurement',
            'OWNER_SCHEMA'
        )
        ,
        (
            'inventory',
            'OWNER_SCHEMA'
        )
        ,
        (
            'assets',
            'OWNER_SCHEMA'
        )
        ,
        (
            'production',
            'OWNER_SCHEMA'
        )
        ,
        (
            'sales_orders',
            'OWNER_SCHEMA'
        )
        ,
        (
            'payments',
            'OWNER_SCHEMA'
        )
        ,
        (
            'customer_engagement',
            'OWNER_SCHEMA'
        )
        ,
        (
            'logistics',
            'OWNER_SCHEMA'
        )
        ,
        (
            'finance',
            'OWNER_SCHEMA'
        )
        ,
        (
            'facilities',
            'OWNER_SCHEMA'
        )
        ,
        (
            'marketing',
            'OWNER_SCHEMA'
        )
        ,
        (
            'technology_operations',
            'OWNER_SCHEMA'
        )
        ,
        (
            'identity_access',
            'OWNER_SCHEMA'
        )
        ,
        (
            'business_records',
            'OWNER_SCHEMA'
        )
        ,
        (
            'business_insights',
            'OWNER_SCHEMA'
        )
        ,
        (
            'operational_continuity',
            'OWNER_SCHEMA'
        )
        ,
        (
            'api',
            'VENTO_EXPOSED_CONTRACT_LAYER'
        )
        ,
        (
            'app_private',
            'VENTO_PRIVATE_TECHNICAL_LAYER'
        )
        ,
        (
            'audit',
            'VENTO_TRANSVERSAL_AUDIT_EVENT_LAYER'
        )
        ,
        (
            'club',
            'LEGACY_COMPATIBILITY'
        )
        ,
        (
            'pass',
            'LEGACY_COMPATIBILITY'
        )
        ,
        (
            'pos',
            'LEGACY_COMPATIBILITY'
        )
        ,
        (
            'public',
            'LEGACY_COMPATIBILITY'
        )
        ,
        (
            'talento',
            'LEGACY_COMPATIBILITY'
        )
        ,
        (
            'viso',
            'LEGACY_COMPATIBILITY'
        )
    ;
    create temporary table auth_db_017_grant_manifest
        (
            physical_identity         text primary key,
            object_kind               text not null   ,
            contract_type             text not null   ,
            source_disposition        text not null   ,
            target_schema             text not null   ,
            audience                  text not null   ,
            schema_usage_required     boolean not null,
            object_privilege          text not null   ,
            security_mode             text not null   ,
            rls_dependency            text not null   ,
            legacy_privilege_before   text not null   ,
            target_privilege_after    text not null   ,
            compatibility_requirement text not null   ,
            blocking_reason           text            ,
            exit_condition            text not null   ,
            migration_reference       text not null   ,
            environment               text not null   ,
            evidence                  text not null
        )
    on commit drop;
    insert into auth_db_017_grant_manifest
        (
            physical_identity        ,
            object_kind              ,
            contract_type            ,
            source_disposition       ,
            target_schema            ,
            audience                 ,
            schema_usage_required    ,
            object_privilege         ,
            security_mode            ,
            rls_dependency           ,
            legacy_privilege_before  ,
            target_privilege_after   ,
            compatibility_requirement,
            blocking_reason          ,
            exit_condition           ,
            migration_reference      ,
            environment              ,
            evidence
        )
    select
        format('%I.%I', n.nspname, c.relname)
        ,
        'VIEW'
        ,
        'READ_VIEW'
        ,
        'PUBLISH_API'
        ,
        'api'
        ,
        'authenticated'
        ,
        true
        ,
        'SELECT'
        ,
        'SECURITY_INVOKER'
        ,
        'SOURCE_OBJECT_AUTHORIZATION_AND_RLS'
        ,
        format( 'public_select=%s;anon_select=%s;authenticated_select=%s;service_role_select=%s', exists
        (
            select
                1
            from
                pg_catalog.aclexplode(coalesce(c.relacl, pg_catalog.acldefault('r', c.relowner))) a
            where
                a.grantee        = 0::oid
            and a.privilege_type = 'SELECT' ), has_table_privilege('anon', c.oid, 'SELECT'), has_table_privilege('authenticated', c.oid, 'SELECT'), has_table_privilege('service_role', c.oid, 'SELECT') )
        ,
        'authenticated:SELECT;anon:NONE;service_role:NONE;PUBLIC:NONE'
        ,
        'LEGACY_SOURCE_ACL_PRESERVED_UNTIL_CONSUMERS_MIGRATED'
        ,
        null
        ,
        'MIGRATE_CONSUMERS_TO_API_THEN_RETIRE_LEGACY_ACCESS'
        ,
        '20260829152739_auth_db_017_data_api_privileges.sql'
        ,
        'LOCAL_CANDIDATE'
        ,
        'AUTH-DB-018_VERIFIED;AUTH-DB-017_CONSUMER_AWARE_CUTOVER'
    from
        pg_catalog.pg_class c
    join
        pg_catalog.pg_namespace n
    on
        n.oid = c.relnamespace
    where
        n.nspname = 'api'
    and c.relkind = 'v';
    insert into auth_db_017_grant_manifest
        (
            physical_identity        ,
            object_kind              ,
            contract_type            ,
            source_disposition       ,
            target_schema            ,
            audience                 ,
            schema_usage_required    ,
            object_privilege         ,
            security_mode            ,
            rls_dependency           ,
            legacy_privilege_before  ,
            target_privilege_after   ,
            compatibility_requirement,
            blocking_reason          ,
            exit_condition           ,
            migration_reference      ,
            environment              ,
            evidence
        )
    select
        format('%I.%I(%s)', n.nspname, p.proname, pg_get_function_identity_arguments(p.oid))
        ,
        'FUNCTION'
        ,
        case
            when
                p.proname ~ '^(get|list|find|search|can|is|has|resolve|calculate|compute|preview|validate|check|current|fetch)'
            then 'QUERY_RPC'
            else 'COMMAND_RPC'
        end
        ,
        'PUBLISH_API'
        ,
        'api'
        ,
        'authenticated'
        ,
        true
        ,
        'EXECUTE'
        ,
        'SECURITY_INVOKER'
        ,
        'OWNER_FUNCTION_AUTHORIZATION'
        ,
        format( 'public_execute=%s;anon_execute=%s;authenticated_execute=%s;service_role_execute=%s', exists
        (
            select
                1
            from
                pg_catalog.aclexplode(coalesce(p.proacl, pg_catalog.acldefault('f', p.proowner))) a
            where
                a.grantee        = 0::oid
            and a.privilege_type = 'EXECUTE' ), has_function_privilege('anon', p.oid, 'EXECUTE'), has_function_privilege('authenticated', p.oid, 'EXECUTE'), has_function_privilege('service_role', p.oid, 'EXECUTE') )
        ,
        'authenticated:EXECUTE;anon:NONE;service_role:NONE;PUBLIC:NONE'
        ,
        'LEGACY_SOURCE_ACL_PRESERVED_UNTIL_CONSUMERS_MIGRATED'
        ,
        null
        ,
        'MIGRATE_CONSUMERS_TO_API_THEN_RETIRE_LEGACY_ACCESS'
        ,
        '20260829152739_auth_db_017_data_api_privileges.sql'
        ,
        'LOCAL_CANDIDATE'
        ,
        'AUTH-DB-018_VERIFIED;SIGNATURE_PRESERVED_WRAPPER;AUTH-DB-017_CONSUMER_AWARE_CUTOVER'
    from
        pg_catalog.pg_proc p
    join
        pg_catalog.pg_namespace n
    on
        n.oid = p.pronamespace
    where
        n.nspname = 'api'
    and p.prokind = 'f';
    do $auth_db_017_preconditions$ declare v_count bigint;
    v_expected                                     bigint;
    v_actual                                       bigint;
    begin
        if to_regnamespace('api') is null
        then
            raise exception 'AUTH_DB_017_API_SCHEMA_MISSING';
        end
        if;
            if to_regnamespace('app_private') is null
            then
                raise exception 'AUTH_DB_017_APP_PRIVATE_SCHEMA_MISSING';
            end
            if;
                if to_regnamespace('audit') is null
                then
                    raise exception 'AUTH_DB_017_AUDIT_SCHEMA_MISSING';
                end
                if;
                    if to_regnamespace('vital') is null
                    then
                        raise exception 'AUTH_DB_017_VITAL_BOUNDARY_MISSING';
                    end
                    if;
                        select
                            count(*)
                        into
                            v_count
                        from
                            auth_db_017_governed_schemas
                        where
                            schema_name = 'vital';
                        if v_count <> 0
                        then
                            raise exception 'AUTH_DB_017_VITAL_BOUNDARY_VIOLATION';
                        end
                        if;
                            select
                                count(*)
                            into
                                v_count
                            from
                                auth_db_017_governed_schemas g
                            where
                                to_regnamespace(g.schema_name) is null;
                            if v_count <> 0
                            then
                                raise exception 'AUTH_DB_017_GOVERNED_SCHEMA_DRIFT:%',
                                v_count;
                            end
                            if;
                                select
                                    count(*)
                                into
                                    v_count
                                from
                                    pg_catalog.pg_class c
                                join
                                    pg_catalog.pg_namespace n
                                on
                                    n.oid = c.relnamespace
                                where
                                    n.nspname = 'api'
                                and c.relkind = 'v';
                                if v_count <> 57
                                then
                                    raise exception 'AUTH_DB_017_API_VIEW_COUNT_DRIFT:%',
                                    v_count;
                                end
                                if;
                                    if exists
                                        (
                                            select
                                                1
                                            from
                                                pg_catalog.pg_class c
                                            join
                                                pg_catalog.pg_namespace n
                                            on
                                                n.oid = c.relnamespace
                                            where
                                                n.nspname = 'api'
                                            and c.relkind in ('r'
                                                              ,
                                                              'p'
                                                              ,
                                                              'S'
                                                              ,
                                                              'm'
                                                              ,
                                                              'f') )
                                    then
                                        raise exception 'AUTH_DB_017_API_AUTHORITATIVE_RELATION_FORBIDDEN';
                                    end
                                    if;
                                        if exists
                                            (
                                                select
                                                    1
                                                from
                                                    pg_catalog.pg_class c
                                                join
                                                    pg_catalog.pg_namespace n
                                                on
                                                    n.oid = c.relnamespace
                                                where
                                                    n.nspname = 'api'
                                                and c.relkind = 'v'
                                                and not (
                                                        coalesce(c.reloptions, array[]::text[]) @> array['security_invoker=true']::text[]) )
                                        then
                                            raise exception 'AUTH_DB_017_API_VIEW_SECURITY_MODE_DRIFT';
                                        end
                                        if;
                                            if exists
                                                (
                                                    select
                                                        1
                                                    from
                                                        pg_catalog.pg_proc p
                                                    join
                                                        pg_catalog.pg_namespace n
                                                    on
                                                        n.oid = p.pronamespace
                                                    where
                                                        n.nspname = 'api'
                                                    and p.prokind = 'f'
                                                    and p.prosecdef )
                                            then
                                                raise exception 'AUTH_DB_017_API_SECURITY_DEFINER_FORBIDDEN';
                                            end
                                            if;
                                                if exists
                                                    (
                                                        select
                                                            1
                                                        from
                                                            pg_catalog.pg_proc p
                                                        join
                                                            pg_catalog.pg_namespace n
                                                        on
                                                            n.oid = p.pronamespace
                                                        where
                                                            n.nspname = 'api'
                                                        and p.prokind = 'f'
                                                        and p.prorettype in ('trigger'::regtype
                                                                             ,
                                                                             'event_trigger'::regtype) )
                                                then
                                                    raise exception 'AUTH_DB_017_API_TRIGGER_FUNCTION_FORBIDDEN';
                                                end
                                                if;
                                                    select
                                                        count(*)
                                                    into
                                                        v_expected
                                                    from
                                                        pg_catalog.pg_class c
                                                    join
                                                        pg_catalog.pg_namespace n
                                                    on
                                                        n.oid = c.relnamespace
                                                    where
                                                        n.nspname = 'api'
                                                    and c.relkind = 'v';
                                                    select
                                                        v_expected + count(*)
                                                    into
                                                        v_expected
                                                    from
                                                        pg_catalog.pg_proc p
                                                    join
                                                        pg_catalog.pg_namespace n
                                                    on
                                                        n.oid = p.pronamespace
                                                    where
                                                        n.nspname = 'api'
                                                    and p.prokind = 'f';
                                                    select
                                                        count(*)
                                                    into
                                                        v_actual
                                                    from
                                                        auth_db_017_grant_manifest;
                                                    if v_actual <> v_expected
                                                    then
                                                        raise exception 'AUTH_DB_017_GRANT_MANIFEST_COVERAGE_MISMATCH expected=% actual=%',
                                                        v_expected                                                                        ,
                                                        v_actual;
                                                    end
                                                    if;
                                                        if exists
                                                            (
                                                                select
                                                                    1
                                                                from
                                                                    auth_db_017_grant_manifest
                                                                where
                                                                    target_schema      <> 'api'
                                                                or  audience           <> 'authenticated'
                                                                or  source_disposition <> 'PUBLISH_API'
                                                                or  object_privilege not in ('SELECT'
                                                                                             ,
                                                                                             'EXECUTE')
                                                                or  contract_type not in ('READ_VIEW'
                                                                                          ,
                                                                                          'QUERY_RPC'
                                                                                          ,
                                                                                          'COMMAND_RPC') )
                                                        then
                                                            raise exception 'AUTH_DB_017_GRANT_MANIFEST_INVALID_ROW';
                                                        end
                                                        if;
                                                            if to_regclass('public.sell_products_by_site') is null
                                                            then
                                                                raise exception 'AUTH_DB_017_PUBLIC_COMPATIBILITY_VIEW_MISSING';
                                                            end
                                                            if;
                                                            end $auth_db_017_preconditions$;
                                                            revoke create on schema api from public, anon, authenticated, service_role;
                                                            revoke usage on schema api from public , anon, authenticated, service_role;
                                                            grant usage on schema api to authenticated;
                                                            do $auth_db_017_object_grants$ declare r record;
                                                            begin for r in
                                                                select
                                                                    c.relname
                                                                from
                                                                    pg_catalog.pg_class c
                                                                join
                                                                    pg_catalog.pg_namespace n
                                                                on
                                                                    n.oid = c.relnamespace
                                                                where
                                                                    n.nspname = 'api'
                                                                and c.relkind = 'v'
                                                                order by
                                                                    c.relname loop execute format( 'revoke all privileges on table api.%I from public, anon, authenticated, service_role', r.relname );
                                                                execute format( 'grant select on table api.%I to authenticated', r.relname );
                                                            end loop;
                                                            for r in
                                                            select
                                                                p.proname
                                                                ,
                                                                pg_get_function_identity_arguments(p.oid) as identity_arguments
                                                            from
                                                                pg_catalog.pg_proc p
                                                            join
                                                                pg_catalog.pg_namespace n
                                                            on
                                                                n.oid = p.pronamespace
                                                            where
                                                                n.nspname = 'api'
                                                            and p.prokind = 'f'
                                                            order by
                                                                p.proname
                                                                ,
                                                                pg_get_function_identity_arguments(p.oid) loop execute format( 'revoke all privileges on function api.%I(%s) from public, anon, authenticated, service_role', r.proname, r.identity_arguments );
                                                            execute format( 'grant execute on function api.%I(%s) to authenticated', r.proname, r.identity_arguments );
                                                        end loop;
                                                    end $auth_db_017_object_grants$;
grant usage, create on schema api to vento_ddl_owner;
grant select on auth_db_017_governed_schemas to vento_ddl_owner;

set local role vento_ddl_owner;

alter default privileges for role vento_ddl_owner
  revoke execute on functions from public;
do $auth_db_017_default_privileges$ declare r record;
                                                    begin for r in
                                                        select
                                                            schema_name
                                                        from
                                                            auth_db_017_governed_schemas
                                                        order by
                                                            schema_name loop execute format( 'alter default privileges for role vento_ddl_owner in schema %I revoke all on tables from public, anon, authenticated, service_role', r.schema_name );
                                                        execute format( 'alter default privileges for role vento_ddl_owner in schema %I revoke all on sequences from public, anon, authenticated, service_role', r.schema_name );
                                                        execute format( 'alter default privileges for role vento_ddl_owner in schema %I revoke all on functions from public, anon, authenticated, service_role', r.schema_name );
                                                    end loop;
                                                end $auth_db_017_default_privileges$;

reset role;

do $auth_db_017_ddl_owner_postconditions$
declare
  v_bad bigint;
begin
  if not exists (
    select 1
    from pg_catalog.pg_roles r
    where r.rolname = 'vento_ddl_owner'
      and not r.rolcanlogin
      and not r.rolinherit
      and not r.rolsuper
      and not r.rolcreatedb
      and not r.rolcreaterole
      and not r.rolreplication
      and not r.rolbypassrls
  ) then
    raise exception 'AUTH_DB_017_DDL_OWNER_POSTURE_INVALID';
  end if;

  if not pg_catalog.pg_has_role(
    'postgres',
    'vento_ddl_owner',
    'SET'
  ) then
    raise exception 'AUTH_DB_017_DDL_OWNER_SET_MEMBERSHIP_MISSING';
  end if;

  if not has_schema_privilege(
    'vento_ddl_owner',
    'api',
    'USAGE'
  )
  or not has_schema_privilege(
    'vento_ddl_owner',
    'api',
    'CREATE'
  ) then
    raise exception 'AUTH_DB_017_DDL_OWNER_API_CREATE_MISSING';
  end if;

  if has_schema_privilege(
    'vento_ddl_owner',
    'vital',
    'CREATE'
  ) then
    raise exception 'AUTH_DB_017_DDL_OWNER_VITAL_CREATE_FORBIDDEN';
  end if;

  select count(*)
  into v_bad
  from auth_db_017_governed_schemas g
  where g.schema_name <> 'api'
    and has_schema_privilege(
      'vento_ddl_owner',
      g.schema_name,
      'CREATE'
    );

  if v_bad <> 0 then
    raise exception
      'AUTH_DB_017_DDL_OWNER_CREATE_BOUNDARY_VIOLATION:%',
      v_bad;
  end if;

  if exists (
    select 1
    from pg_catalog.pg_default_acl d
    cross join lateral pg_catalog.aclexplode(
      d.defaclacl
    ) a
    where d.defaclrole = 'vento_ddl_owner'::regrole
      and d.defaclnamespace = 0
      and d.defaclobjtype = 'f'
      and a.grantee = 0::oid
      and a.privilege_type = 'EXECUTE'
  ) then
    raise exception
      'AUTH_DB_017_DDL_OWNER_PUBLIC_EXECUTE_DEFAULT_PRESENT';
  end if;
end
$auth_db_017_ddl_owner_postconditions$;
do $auth_db_017_postconditions$ declare v_views bigint;
                                                v_functions                                     bigint;
                                                v_bad                                           bigint;
                                                begin
                                                    if not has_schema_privilege('authenticated', 'api', 'USAGE')
                                                    then
                                                        raise exception 'AUTH_DB_017_AUTHENTICATED_API_USAGE_MISSING';
                                                    end
                                                    if;
                                                        if has_schema_privilege('anon', 'api', 'USAGE')
                                                        then
                                                            raise exception 'AUTH_DB_017_ANON_API_USAGE_UNCLASSIFIED';
                                                        end
                                                        if;
                                                            if has_schema_privilege('service_role', 'api', 'USAGE')
                                                            then
                                                                raise exception 'AUTH_DB_017_SERVICE_ROLE_API_USAGE_UNCLASSIFIED';
                                                            end
                                                            if;
                                                                if has_schema_privilege('authenticated', 'api', 'CREATE')
                                                                    or
                                                                    has_schema_privilege('anon', 'api', 'CREATE')
                                                                    or
                                                                    has_schema_privilege('service_role', 'api', 'CREATE')
                                                                then
                                                                    raise exception 'AUTH_DB_017_RUNTIME_API_CREATE_FORBIDDEN';
                                                                end
                                                                if;
                                                                    select
                                                                        count(*)
                                                                    into
                                                                        v_views
                                                                    from
                                                                        pg_catalog.pg_class c
                                                                    join
                                                                        pg_catalog.pg_namespace n
                                                                    on
                                                                        n.oid = c.relnamespace
                                                                    where
                                                                        n.nspname = 'api'
                                                                    and c.relkind = 'v';
                                                                    select
                                                                        count(*)
                                                                    into
                                                                        v_bad
                                                                    from
                                                                        pg_catalog.pg_class c
                                                                    join
                                                                        pg_catalog.pg_namespace n
                                                                    on
                                                                        n.oid = c.relnamespace
                                                                    where
                                                                        n.nspname = 'api'
                                                                    and c.relkind = 'v'
                                                                    and not has_table_privilege('authenticated', c.oid, 'SELECT');
                                                                    if v_bad <> 0
                                                                    then
                                                                        raise exception 'AUTH_DB_017_AUTHENTICATED_VIEW_GRANTS_INCOMPLETE:%',
                                                                        v_bad;
                                                                    end
                                                                    if;
                                                                        select
                                                                            count(*)
                                                                        into
                                                                            v_bad
                                                                        from
                                                                            pg_catalog.pg_class c
                                                                        join
                                                                            pg_catalog.pg_namespace n
                                                                        on
                                                                            n.oid = c.relnamespace
                                                                        where
                                                                            n.nspname = 'api'
                                                                        and c.relkind = 'v'
                                                                        and (
                                                                                has_table_privilege('anon', c.oid, 'SELECT')
                                                                                or has_table_privilege('service_role', c.oid, 'SELECT')
                                                                                or exists
                                                                                (
                                                                                    select
                                                                                        1
                                                                                    from
                                                                                        pg_catalog.aclexplode(coalesce(c.relacl, pg_catalog.acldefault('r', c.relowner))) a
                                                                                    where
                                                                                        a.grantee        = 0::oid
                                                                                    and a.privilege_type = 'SELECT' ) );
                                                                        if v_bad <> 0
                                                                        then
                                                                            raise exception 'AUTH_DB_017_UNCLASSIFIED_VIEW_GRANT:%',
                                                                            v_bad;
                                                                        end
                                                                        if;
                                                                            select
                                                                                count(*)
                                                                            into
                                                                                v_functions
                                                                            from
                                                                                pg_catalog.pg_proc p
                                                                            join
                                                                                pg_catalog.pg_namespace n
                                                                            on
                                                                                n.oid = p.pronamespace
                                                                            where
                                                                                n.nspname = 'api'
                                                                            and p.prokind = 'f';
                                                                            select
                                                                                count(*)
                                                                            into
                                                                                v_bad
                                                                            from
                                                                                pg_catalog.pg_proc p
                                                                            join
                                                                                pg_catalog.pg_namespace n
                                                                            on
                                                                                n.oid = p.pronamespace
                                                                            where
                                                                                n.nspname = 'api'
                                                                            and p.prokind = 'f'
                                                                            and not has_function_privilege('authenticated', p.oid, 'EXECUTE');
                                                                            if v_bad <> 0
                                                                            then
                                                                                raise exception 'AUTH_DB_017_AUTHENTICATED_RPC_GRANTS_INCOMPLETE:%',
                                                                                v_bad;
                                                                            end
                                                                            if;
                                                                                select
                                                                                    count(*)
                                                                                into
                                                                                    v_bad
                                                                                from
                                                                                    pg_catalog.pg_proc p
                                                                                join
                                                                                    pg_catalog.pg_namespace n
                                                                                on
                                                                                    n.oid = p.pronamespace
                                                                                where
                                                                                    n.nspname = 'api'
                                                                                and p.prokind = 'f'
                                                                                and (
                                                                                        has_function_privilege('anon', p.oid, 'EXECUTE')
                                                                                        or has_function_privilege('service_role', p.oid, 'EXECUTE')
                                                                                        or exists
                                                                                        (
                                                                                            select
                                                                                                1
                                                                                            from
                                                                                                pg_catalog.aclexplode(coalesce(p.proacl, pg_catalog.acldefault('f', p.proowner))) a
                                                                                            where
                                                                                                a.grantee        = 0::oid
                                                                                            and a.privilege_type = 'EXECUTE' ) );
                                                                                if v_bad <> 0
                                                                                then
                                                                                    raise exception 'AUTH_DB_017_UNCLASSIFIED_RPC_GRANT:%',
                                                                                    v_bad;
                                                                                end
                                                                                if;
                                                                                    if v_views <> 57
                                                                                    then
                                                                                        raise exception 'AUTH_DB_017_API_VIEW_COUNT_CHANGED:%',
                                                                                        v_views;
                                                                                    end
                                                                                    if;
                                                                                        if v_functions = 0
                                                                                        then
                                                                                            raise exception 'AUTH_DB_017_API_RPC_SURFACE_EMPTY';
                                                                                        end
                                                                                        if;
                                                                                            if has_schema_privilege('anon', 'app_private', 'USAGE')
                                                                                                or
                                                                                                has_schema_privilege('authenticated', 'app_private', 'USAGE')
                                                                                            then
                                                                                                raise exception 'AUTH_DB_017_APP_PRIVATE_CLIENT_USAGE_FORBIDDEN';
                                                                                            end
                                                                                            if;
                                                                                                if has_schema_privilege('anon', 'audit', 'USAGE')
                                                                                                    or
                                                                                                    has_schema_privilege('authenticated', 'audit', 'USAGE')
                                                                                                then
                                                                                                    raise exception 'AUTH_DB_017_AUDIT_CLIENT_USAGE_FORBIDDEN';
                                                                                                end
                                                                                                if;
                                                                                                end $auth_db_017_postconditions$;
                                                                                                commit;
