-- TRANSITION-MAP-001@1.0.0
-- SUPA-TRANS-001 - Mapeo read-only de objetos actuales hacia coordenadas logicas objetivo.
-- No decide conservar, mover, fusionar, dividir, renombrar ni retirar.
-- disposition_status permanece RESERVED_FOR_SUPA_TRANS_002 para todas las filas.

with recursive
relation_base as (
  select
    c.oid as relation_oid,
    n.nspname as schema_name,
    c.relname as object_name,
    n.nspname || '.' || c.relname as object_key,
    case c.relkind
      when 'r' then 'TABLE'
      when 'p' then 'PARTITIONED_TABLE'
      when 'v' then 'VIEW'
      when 'm' then 'MATERIALIZED_VIEW'
    end as object_type,
    coalesce(obj_description(c.oid, 'pg_class'), '') as object_comment,
    c.relrowsecurity as rls_enabled,
    c.relforcerowsecurity as rls_forced
  from pg_class c
  join pg_namespace n on n.oid = c.relnamespace
  where n.nspname in (
    'app_private', 'public', 'pass', 'payments', 'pos',
    'viso', 'talento', 'club', 'vital'
  )
    and c.relkind in ('r', 'p', 'v', 'm')
),
relation_capability as (
  select
    rb.*,
    case
      when schema_name = 'vital' then 'OUTSIDE_VENTO_OS'
      when object_key in (
        'public.product_categories_backup_20260316_preparaciones',
        'public.staging_insumos_import'
      ) then 'NO_CAPACITY_TEMPORARY'
      when schema_name = 'app_private' then 'CAP-11'
      when schema_name = 'talento' then 'CAP-02'
      when schema_name = 'viso' and object_name like 'demand_%' then 'CAP-17'
      when schema_name = 'viso' then 'CAP-02'
      when schema_name = 'club' and object_name = 'audit_events' then 'CAP-16'
      when schema_name = 'club' then 'CAP-10'
      when schema_name = 'payments' then 'CAP-09'
      when schema_name = 'pos'
        and object_name in ('pos_cash_movements', 'pos_cash_shifts', 'pos_payments') then 'CAP-12'
      when schema_name = 'pos' then 'CAP-09'
      when schema_name = 'pass'
        and (
          object_name like 'catalog_%'
          or object_name like 'commercial_%'
          or object_name = 'sell_products_by_site'
        ) then 'CAP-04'
      when schema_name = 'pass'
        and (object_name like 'loyalty_%' or object_name = 'user_favorites') then 'CAP-10'
      when schema_name = 'pass' then 'CAP-11'
      when schema_name = 'public'
        and object_name in (
          'area_kinds', 'areas', 'operational_sites',
          'site_area_purpose_rules', 'site_operational_capabilities',
          'site_purpose_settings', 'sites', 'v_ops_site_readiness',
          'v_site_area_operational_diagnostics'
        ) then 'CAP-01'
      when schema_name = 'public' and object_name = 'account_deletion_requests' then 'CAP-18'
      when schema_name = 'public'
        and object_name in ('asset_documents', 'document_types', 'documents', 'required_document_rules') then 'CAP-16'
      when schema_name = 'public'
        and (
          object_name = 'announcements'
          or object_name = 'app_content_blocks'
          or object_name like 'website_%'
        ) then 'CAP-14'
      when schema_name = 'public'
        and (
          object_name like 'asset_%'
          or object_name like 'product_asset_%'
          or object_name like 'v_asset_%'
        ) then 'CAP-07'
      when schema_name = 'public'
        and (
          object_name like 'procurement_%'
          or object_name like 'purchase_%'
          or object_name in ('product_suppliers', 'suppliers', 'v_procurement_price_book')
        ) then 'CAP-05'
      when schema_name = 'public'
        and (
          object_name like 'inventory_%'
          or object_name like 'restock_%'
          or object_name like 'product_request_polic%'
          or object_name in (
            'v_inventory_catalog', 'v_inventory_stock_by_location',
            'v_ops_restock_product_gaps'
          )
        ) then 'CAP-06'
      when schema_name = 'public'
        and (
          object_name like 'production_%'
          or object_name like 'recipe_%'
          or object_name = 'recipes'
          or object_name in (
            'product_site_production_routes', 'site_production_pick_order',
            'v_site_production_route_diagnostics'
          )
        ) then 'CAP-08'
      when schema_name = 'public'
        and (
          object_name like 'remission_%'
          or object_name in (
            'product_fulfillment_routes',
            'product_site_area_remission_categories',
            'site_supply_routes', 'pass_delivery_distance_rates', 'pass_satellites'
          )
        ) then 'CAP-11'
      when schema_name = 'public'
        and (
          object_name like 'order_%'
          or object_name like 'pulso_%'
          or (
            object_name like 'pos_%'
            and object_name not in ('pos_cash_movements', 'pos_cash_shifts', 'pos_payments')
          )
        ) then 'CAP-09'
      when schema_name = 'public'
        and (
          object_name like 'client_%'
          or object_name like 'gift_%'
          or object_name like 'loyalty_%'
          or object_name like 'wallet_%'
          or object_name in ('users', 'user_favorites')
        ) then 'CAP-10'
      when schema_name = 'public'
        and (
          object_name in ('cost_centers', 'product_cost_events')
          or object_name like 'internal_pos_%'
          or object_name like 'internal_price_%'
          or object_name like 'internal_transfer_%'
          or object_name like 'numera_%'
          or object_name in ('pos_cash_movements', 'pos_cash_shifts', 'pos_payments')
        ) then 'CAP-12'
      when schema_name = 'public'
        and (
          object_name = 'apps'
          or object_name like 'app_%'
          or object_name like 'shared_%'
          or object_name like 'support_%'
          or object_name in (
            'context_simulation_sessions', 'internal_job_secrets',
            'printing_label_templates', 'user_feedback'
          )
        ) then 'CAP-15'
      when schema_name = 'public'
        and (
          object_name like 'asistencia_%'
          or object_name like 'attendance_%'
          or object_name like 'employee_%'
          or object_name like 'operational_role_%'
          or object_name like 'permission_%'
          or object_name like 'role_%'
          or object_name = 'roles'
          or object_name like 'shift_%'
          or object_name like 'site_attendance_%'
          or object_name = 'site_operational_roles'
          or object_name like 'staff_%'
          or object_name like 'vento_%'
          or object_name like 'viso_%'
        ) then 'CAP-02'
      when schema_name = 'public'
        and (
          object_name like 'catalog_%'
          or object_name like 'commercial_%'
          or object_name = 'sell_products_by_site'
          or object_name like 'product_%'
          or object_name = 'products'
        ) then 'CAP-04'
      else 'UNCLASSIFIED'
    end as capability_key
  from relation_base rb
),
relation_owned as (
  select
    rc.*,
    case
      when capability_key = 'OUTSIDE_VENTO_OS' then 'VITAL'
      when capability_key = 'NO_CAPACITY_TEMPORARY' then 'CUSTODIO_TECNICO_ONLY: vento-shell'
      when capability_key = 'CAP-01' then 'VISO'
      when capability_key = 'CAP-02' and schema_name = 'talento' then 'TALENTO'
      when capability_key = 'CAP-02' and schema_name = 'viso' then 'VISO'
      when capability_key = 'CAP-02'
        and object_name in (
          'asistencia_logs', 'attendance_breaks', 'attendance_logs',
          'attendance_policy', 'attendance_shift_events', 'attendance_sync_conflicts',
          'employee_attendance_status', 'employee_devices', 'employee_push_tokens',
          'employee_settings', 'employee_shifts', 'employee_wallet_cards',
          'shift_calendar_view', 'shift_policy', 'shift_runtime_events',
          'site_attendance_policy', 'staff_invitations',
          'staff_manual_calendar_events', 'staff_schedule_hidden_employees'
        ) then 'ANIMA'
      when capability_key = 'CAP-02' then 'VISO'
      when capability_key = 'CAP-04'
        and (
          schema_name = 'pass'
          or object_type = 'VIEW'
          or object_name like 'catalog_%'
          or object_name like 'commercial_%'
          or object_name = 'sell_products_by_site'
        ) then 'PASS'
      when capability_key = 'CAP-04' then 'NEXO'
      when capability_key = 'CAP-05' then 'ORIGO'
      when capability_key = 'CAP-06' then 'NEXO'
      when capability_key = 'CAP-07' then 'NEXO'
      when capability_key = 'CAP-08' then 'FOGO'
      when capability_key = 'CAP-09'
        and (
          schema_name = 'pos'
          or object_name like 'pos_%'
          or object_name like 'pulso_%'
        ) then 'PULSO'
      when capability_key = 'CAP-09' then 'PASS/PULSO'
      when capability_key = 'CAP-10' and schema_name = 'club' then 'PASS/CLUB'
      when capability_key = 'CAP-10' and schema_name = 'pass' then 'PASS'
      when capability_key = 'CAP-10' then 'PASS/PULSO'
      when capability_key = 'CAP-11'
        and schema_name = 'public'
        and (
          object_name like 'remission_%'
          or object_name in (
            'product_fulfillment_routes',
            'product_site_area_remission_categories', 'site_supply_routes'
          )
        ) then 'NEXO'
      when capability_key = 'CAP-11' then 'PASS/PULSO'
      when capability_key = 'CAP-12'
        and (
          schema_name = 'pos'
          or object_name like 'pos_%'
          or object_name like 'internal_pos_%'
        ) then 'PULSO'
      when capability_key = 'CAP-12' then 'NUMERA'
      when capability_key = 'CAP-14' and object_name = 'announcements' then 'ANIMA'
      when capability_key = 'CAP-14' and object_name = 'app_content_blocks' then 'SHELL'
      when capability_key = 'CAP-14' then 'PASS/AURA'
      when capability_key = 'CAP-15' and object_name = 'printing_label_templates' then 'NEXO'
      when capability_key = 'CAP-15'
        and (
          object_name = 'app_permissions'
          or object_name = 'context_simulation_sessions'
          or object_name like 'shared_%'
        ) then 'VISO/SHELL'
      when capability_key = 'CAP-15' then 'SHELL'
      when capability_key = 'CAP-16' and schema_name = 'club' then 'PASS/CLUB'
      when capability_key = 'CAP-16' and object_name = 'asset_documents' then 'NEXO'
      when capability_key = 'CAP-16' then 'ANIMA/VISO'
      when capability_key = 'CAP-17' then 'VISO'
      when capability_key = 'CAP-18' then 'PASS/SHELL'
      else 'UNRESOLVED_OWNER'
    end as current_owner,
    case capability_key
      when 'CAP-01' then 'SHELL, ANIMA, NEXO, FOGO, ORIGO, PULSO, NUMERA, PASS'
      when 'CAP-02' then 'SHELL, VISO, ANIMA, NEXO, FOGO, ORIGO, PULSO, NUMERA'
      when 'CAP-04' then 'ORIGO, NEXO, FOGO, PULSO, PASS, NUMERA, AURA'
      when 'CAP-05' then 'NEXO, NUMERA, FOGO, VISO'
      when 'CAP-06' then 'ORIGO, FOGO, PULSO, NUMERA, VISO'
      when 'CAP-07' then 'VISO, NUMERA'
      when 'CAP-08' then 'NEXO, PULSO, NUMERA, VISO'
      when 'CAP-09' then 'PASS, PULSO, FOGO, NEXO, NUMERA, AURA'
      when 'CAP-10' then 'PASS, PULSO, AURA, NUMERA, VISO'
      when 'CAP-11' then 'NEXO, PULSO, PASS, NUMERA, FOGO, ORIGO'
      when 'CAP-12' then 'NUMERA, PULSO, ORIGO, NEXO, VISO'
      when 'CAP-14' then 'ANIMA, SHELL, PASS, PULSO, AURA, NUMERA'
      when 'CAP-15' then 'SHELL, VISO, ANIMA, NEXO, FOGO, ORIGO, PULSO, PASS'
      when 'CAP-16' then 'ANIMA, VISO, NEXO, PASS y consumidores autorizados del hecho'
      when 'CAP-17' then 'VISO, PULSO, NUMERA, FOGO'
      when 'CAP-18' then 'PASS, SHELL, VISO'
      when 'NO_CAPACITY_TEMPORARY' then 'NONE_AUTHORIZED'
      when 'OUTSIDE_VENTO_OS' then 'vento-vital y servicios VITAL'
      else 'UNRESOLVED_CONSUMERS'
    end as current_consumers,
    case capability_key
      when 'CAP-01' then 'CONFIRMED_CURRENT_WITH_BOUNDARY'
      when 'CAP-02' then 'SHARED_CURRENT'
      when 'CAP-04' then 'FRAGMENTED_CURRENT'
      when 'CAP-05' then 'CONFIRMED_CURRENT'
      when 'CAP-06' then 'CONFIRMED_CURRENT'
      when 'CAP-07' then 'CONFIRMED_CURRENT_WITH_BOUNDARY'
      when 'CAP-08' then 'CONFIRMED_CURRENT'
      when 'CAP-09' then 'FRAGMENTED_CURRENT'
      when 'CAP-10' then 'SHARED_CURRENT'
      when 'CAP-11' then 'REQUIRES_RESULT_SPLIT'
      when 'CAP-12' then 'SHARED_CURRENT'
      when 'CAP-14' then 'FRAGMENTED_CURRENT'
      when 'CAP-15' then 'SHARED_CURRENT'
      when 'CAP-16' then 'REQUIRES_RESULT_SPLIT'
      when 'CAP-17' then 'CONFIRMED_CURRENT_WITH_BOUNDARY'
      when 'CAP-18' then 'SHARED_CURRENT'
      when 'NO_CAPACITY_TEMPORARY' then 'TEMPORARY_OR_LEGACY'
      when 'OUTSIDE_VENTO_OS' then 'OUTSIDE_VENTO_OS'
      else 'UNRESOLVED_STATE'
    end as current_ownership_state
  from relation_capability rc
),
relation_targeted as (
  select
    ro.*,
    case capability_key
      when 'CAP-01' then 'OPERATING_STRUCTURE_AND_GOVERNANCE'
      when 'CAP-02' then 'WORKFORCE_AND_WORK'
      when 'CAP-04' then 'PRODUCT_CATALOG_AND_KNOWLEDGE'
      when 'CAP-05' then 'PROCUREMENT'
      when 'CAP-06' then 'INVENTORY_AND_STORAGE'
      when 'CAP-07' then 'ASSETS_AND_REUSABLES'
      when 'CAP-08' then 'PRODUCTION'
      when 'CAP-09' then 'ORDERS_SALES_AND_COLLECTION'
      when 'CAP-10' then 'CUSTOMERS_AND_RELATIONSHIPS'
      when 'CAP-11' then 'TRANSPORT_DISPATCH_AND_DELIVERY'
      when 'CAP-12' then 'FINANCE_COSTS_AND_OBLIGATIONS'
      when 'CAP-14' then 'COMMUNICATION_AND_PROMOTION'
      when 'CAP-15' then 'TECHNOLOGY_AND_SUPPORT'
      when 'CAP-16' then 'INFORMATION_DOCUMENTS_AND_EVIDENCE'
      when 'CAP-17' then 'MEASUREMENT_ANALYTICS_AND_IMPROVEMENT'
      when 'CAP-18' then 'CONTINUITY_AND_INCIDENTS'
      when 'NO_CAPACITY_TEMPORARY' then 'TEMPORARY_OR_LEGACY'
      when 'OUTSIDE_VENTO_OS' then 'VITAL_PRODUCT_BOUNDARY'
      else 'UNRESOLVED_TARGET_DOMAIN'
    end as target_domain_or_special_class,
    case
      when capability_key = 'OUTSIDE_VENTO_OS' then 'VITAL'
      when capability_key = 'NO_CAPACITY_TEMPORARY' then 'TEMPORARY'
      when object_type = 'VIEW'
        and (
          object_comment ilike '%compat view%'
          or (schema_name = 'public' and object_name like 'pos_%')
          or object_name in (
            'catalog_item_customization_template_assignments',
            'catalog_item_customization_template_groups',
            'catalog_item_customization_templates',
            'catalog_item_option_consumption_rules', 'catalog_item_option_groups',
            'catalog_item_option_recipe_effects', 'catalog_item_options',
            'catalog_item_presentation', 'catalog_items', 'catalog_option_visual_assets',
            'commercial_categories', 'commercial_collection_categories',
            'commercial_collections', 'loyalty_redemptions', 'loyalty_rewards',
            'loyalty_transactions', 'user_favorites', 'pass_delivery_distance_rates',
            'pass_satellites', 'sell_products_by_site'
          )
        ) then 'ADAPTER'
      when object_type = 'VIEW' then 'PROJECTION'
      when object_name like '%history%' then 'HISTORY'
      when object_name ~ '(events|logs|ledger|movements|transactions|postings|conflicts|snapshots|reviews)$' then 'LEDGER'
      when object_name ~ '(summary|status|forecast|forecasts|stock_by|readiness)' then 'PROJECTION'
      when object_name ~ '(types|kinds|categories|catalog|catalogs|policies|policy|rules|settings|profiles|templates|units|roles|permissions|capabilities|limits|requirements|sequences|rates|prices|routes|mappings)$' then 'REFERENCE'
      else 'AGGREGATE'
    end as target_component_role
  from relation_owned ro
),
relation_map as (
  select
    relation_oid,
    object_key as current_object_key,
    'RELATION'::text as current_object_class,
    case
      when capability_key = 'OUTSIDE_VENTO_OS' then 'OUTSIDE_VENTO_OS'
      when capability_key = 'NO_CAPACITY_TEMPORARY' then 'TEMPORARY_OR_LEGACY'
      when target_component_role = 'ADAPTER' then 'CURRENT_COMPATIBILITY_PROJECTION'
      when object_type in ('VIEW', 'MATERIALIZED_VIEW') then 'CURRENT_PROJECTION'
      else 'CURRENT_PERSISTED_RELATION'
    end as current_source_status,
    case
      when capability_key = 'OUTSIDE_VENTO_OS' then 'VITAL'
      when capability_key = 'NO_CAPACITY_TEMPORARY' then 'VENTO_OS_TECHNICAL_RESIDUE'
      else 'VENTO_OS'
    end as current_product_boundary,
    capability_key as current_capability_key,
    current_owner,
    current_consumers,
    current_ownership_state,
    target_domain_or_special_class,
    target_component_role,
    case target_component_role
      when 'ADAPTER' then 'DERIVED_READ_MODEL'
      when 'PROJECTION' then 'DERIVED_READ_MODEL'
      when 'LEDGER' then 'APPEND_ONLY_OR_CONTROLLED_HISTORY'
      when 'HISTORY' then 'APPEND_ONLY_OR_CONTROLLED_HISTORY'
      when 'REFERENCE' then 'AUTHORITATIVE_REFERENCE'
      when 'VITAL' then 'VITAL_AUTHORITY'
      when 'TEMPORARY' then 'NO_BUSINESS_AUTHORITY'
      else 'AUTHORITATIVE_WRITE_MODEL'
    end as target_authority_mode,
    case target_component_role
      when 'ADAPTER' then 'COMPATIBILITY'
      when 'PROJECTION' then 'PROJECTION'
      when 'LEDGER' then 'AUDIT'
      when 'HISTORY' then 'AUDIT'
      when 'REFERENCE' then 'REFERENCE'
      when 'VITAL' then 'PLATFORM_INTERNAL'
      when 'TEMPORARY' then 'COMPATIBILITY'
      else 'COMMAND'
    end as target_contract_mode,
    case
      when schema_name = 'app_private' then 'SERVER_ONLY_PRIVATE_SCHEMA'
      when capability_key = 'OUTSIDE_VENTO_OS' then 'VITAL_SEPARATE_PRODUCT_BOUNDARY'
      when object_type in ('VIEW', 'MATERIALIZED_VIEW') then 'DATA_API_READ_MODEL_REVIEW'
      when rls_enabled then 'RLS_GOVERNED_DATA_API'
      else 'NON_RLS_PRIVATE_OR_BLOCKED_REVIEW'
    end as target_security_boundary,
    case
      when target_component_role = 'ADAPTER' then 'SUPA-TRANS-003;SUPA-TRANS-006;SUPA-TRANS-007;SUPA-TRANS-014'
      when target_component_role = 'PROJECTION' then 'SUPA-TRANS-003;SUPA-TRANS-006;SUPA-TRANS-007;SUPA-TRANS-009'
      when capability_key = 'NO_CAPACITY_TEMPORARY' then 'SUPA-TRANS-002;SUPA-TRANS-005;SUPA-TRANS-012'
      when capability_key = 'OUTSIDE_VENTO_OS' then 'SUPA-TRANS-003;SUPA-TRANS-007;SUPA-TRANS-013;SUPA-TRANS-014'
      else 'SUPA-TRANS-003;SUPA-TRANS-005;SUPA-TRANS-007;SUPA-TRANS-008;SUPA-TRANS-009'
    end as target_compatibility_dependencies,
    'TRANS::RELATION::' || object_key as target_transition_key,
    'MAPPED_CURRENT_TO_LOGICAL_TARGET'::text as mapping_status,
    'RESERVED_FOR_SUPA_TRANS_002'::text as disposition_status,
    'SUPA-AUD-022;SUPA-ARC-025;REMOTE_CATALOG_2026-07-31'::text as evidence_refs
  from relation_targeted
),
trigger_parent as (
  select
    p.oid as function_oid,
    count(distinct rm.current_capability_key)::int as capability_count,
    min(rm.current_capability_key) as single_capability,
    count(distinct rm.current_owner)::int as owner_count,
    min(rm.current_owner) as single_owner,
    string_agg(distinct rm.current_consumers, ' | ' order by rm.current_consumers) as consumers,
    string_agg(distinct rm.target_domain_or_special_class, ' | ' order by rm.target_domain_or_special_class) as target_domains,
    string_agg(distinct rm.current_object_key, ', ' order by rm.current_object_key) as parent_relations
  from pg_proc p
  join pg_trigger t on t.tgfoid = p.oid and not t.tgisinternal
  join relation_map rm on rm.relation_oid = t.tgrelid
  group by p.oid
),
function_base as (
  select
    p.oid as function_oid,
    n.nspname as schema_name,
    p.proname as function_name,
    n.nspname || '.' || p.proname || '(' || pg_get_function_identity_arguments(p.oid) || ')' as object_key,
    p.prosecdef as security_definer,
    p.provolatile,
    pg_get_function_result(p.oid) as result_type,
    l.lanname as language_name,
    tp.capability_count,
    tp.single_capability,
    tp.owner_count,
    tp.single_owner,
    tp.consumers as trigger_consumers,
    tp.target_domains as trigger_target_domains,
    tp.parent_relations
  from pg_proc p
  join pg_namespace n on n.oid = p.pronamespace
  join pg_language l on l.oid = p.prolang
  left join trigger_parent tp on tp.function_oid = p.oid
  where n.nspname in (
    'app_private', 'public', 'pass', 'payments', 'pos',
    'viso', 'talento', 'club', 'vital'
  )
    and p.prokind = 'f'
),
function_classified as (
  select
    fb.*,
    case
      when capability_count = 1 then single_capability
      when capability_count > 1 then 'MULTI_CAPABILITY_REVIEW'
      when schema_name = 'vital' then 'OUTSIDE_VENTO_OS'
      when schema_name = 'talento' then 'CAP-02'
      when schema_name = 'viso' and function_name like 'demand_%' then 'CAP-17'
      when schema_name = 'viso' then 'CAP-02'
      when schema_name = 'club' and function_name like '%audit%' then 'CAP-16'
      when schema_name = 'club' then 'CAP-10'
      when schema_name = 'payments' then 'CAP-09'
      when schema_name = 'pos' and function_name ~ '(cash|payment)' then 'CAP-12'
      when schema_name = 'pos' then 'CAP-09'
      when schema_name = 'pass' and function_name ~ '(catalog|commercial|product|collection|option)' then 'CAP-04'
      when schema_name = 'pass' and function_name ~ '(loyalty|wallet|reward|redemption|favorite)' then 'CAP-10'
      when schema_name = 'pass' and function_name ~ '(delivery|address|satellite|schedule|business_hour)' then 'CAP-11'
      when schema_name = 'app_private' then 'CAP-11'
      when function_name ~ '(attendance|shift|staff|employee|role|permission|checkin|checkout)' then 'CAP-02'
      when function_name ~ '(procurement|purchase|supplier)' then 'CAP-05'
      when function_name ~ '(inventory|restock|stock|lpn|location|transfer)' then 'CAP-06'
      when function_name ~ '(asset)' then 'CAP-07'
      when function_name ~ '(production|recipe|fogo)' then 'CAP-08'
      when function_name ~ '(order|payment|checkout|pos_|pulso|sales)' then 'CAP-09'
      when function_name ~ '(loyalty|wallet|client|user_|gift|reward|redemption)' then 'CAP-10'
      when function_name ~ '(delivery|remission|shipment|dispatch|route)' then 'CAP-11'
      when function_name ~ '(numera|cost|expense|price|cash)' then 'CAP-12'
      when function_name ~ '(announcement|website|content)' then 'CAP-14'
      when function_name ~ '(document)' then 'CAP-16'
      else 'CAP-15'
    end as capability_key
  from function_base fb
),
function_map as (
  select
    object_key as current_object_key,
    'FUNCTION'::text as current_object_class,
    case when capability_count is not null then 'CURRENT_TRIGGER_FUNCTION' else 'CURRENT_DATABASE_FUNCTION' end as current_source_status,
    case when schema_name = 'vital' then 'VITAL' else 'VENTO_OS' end as current_product_boundary,
    capability_key as current_capability_key,
    case
      when owner_count = 1 then single_owner
      when owner_count > 1 then 'MULTI_PARENT_OWNER_REVIEW'
      when capability_key = 'OUTSIDE_VENTO_OS' then 'VITAL'
      when capability_key = 'CAP-01' then 'VISO'
      when capability_key = 'CAP-02' and schema_name = 'talento' then 'TALENTO'
      when capability_key = 'CAP-02' and schema_name = 'viso' then 'VISO'
      when capability_key = 'CAP-02' then 'ANIMA/VISO'
      when capability_key = 'CAP-04' then case when schema_name = 'pass' then 'PASS' else 'NEXO' end
      when capability_key = 'CAP-05' then 'ORIGO'
      when capability_key = 'CAP-06' then 'NEXO'
      when capability_key = 'CAP-07' then 'NEXO'
      when capability_key = 'CAP-08' then 'FOGO'
      when capability_key = 'CAP-09' then 'PASS/PULSO'
      when capability_key = 'CAP-10' then case when schema_name = 'club' then 'PASS/CLUB' else 'PASS/PULSO' end
      when capability_key = 'CAP-11' then 'NEXO/PASS/PULSO'
      when capability_key = 'CAP-12' then 'NUMERA/PULSO'
      when capability_key = 'CAP-14' then 'ANIMA/AURA/SHELL'
      when capability_key = 'CAP-15' then 'CUSTODIO_TECNICO_ONLY: vento-shell'
      when capability_key = 'CAP-16' then 'ANIMA/VISO/NEXO'
      when capability_key = 'CAP-17' then 'VISO'
      when capability_key = 'CAP-18' then 'PASS/SHELL'
      else 'UNRESOLVED_OWNER'
    end as current_owner,
    coalesce(trigger_consumers,
      case capability_key
        when 'CAP-02' then 'SHELL, VISO, ANIMA, NEXO, FOGO, ORIGO, PULSO, NUMERA'
        when 'CAP-04' then 'ORIGO, NEXO, FOGO, PULSO, PASS, NUMERA, AURA'
        when 'CAP-05' then 'NEXO, NUMERA, FOGO, VISO'
        when 'CAP-06' then 'ORIGO, FOGO, PULSO, NUMERA, VISO'
        when 'CAP-07' then 'VISO, NUMERA'
        when 'CAP-08' then 'NEXO, PULSO, NUMERA, VISO'
        when 'CAP-09' then 'PASS, PULSO, FOGO, NEXO, NUMERA, AURA'
        when 'CAP-10' then 'PASS, PULSO, AURA, NUMERA, VISO'
        when 'CAP-11' then 'NEXO, PULSO, PASS, NUMERA, FOGO, ORIGO'
        when 'CAP-12' then 'NUMERA, PULSO, ORIGO, NEXO, VISO'
        when 'CAP-14' then 'ANIMA, SHELL, PASS, PULSO, AURA, NUMERA'
        when 'CAP-15' then 'SHELL, VISO, ANIMA, NEXO, FOGO, ORIGO, PULSO, PASS'
        when 'CAP-16' then 'ANIMA, VISO, NEXO, PASS y consumidores autorizados del hecho'
        when 'CAP-17' then 'VISO, PULSO, NUMERA, FOGO'
        when 'CAP-18' then 'PASS, SHELL, VISO'
        when 'OUTSIDE_VENTO_OS' then 'vento-vital y servicios VITAL'
        else 'DEPENDENCY_DISCOVERY_REQUIRED'
      end
    ) as current_consumers,
    case
      when capability_count = 1 then 'INHERITED_FROM_TRIGGER_PARENT'
      when capability_count > 1 then 'MULTI_PARENT_REVIEW'
      else 'DEPENDENCY_REFINEMENT_REQUIRED'
    end as current_ownership_state,
    coalesce(
      case when capability_count = 1 then trigger_target_domains end,
      case capability_key
        when 'CAP-01' then 'OPERATING_STRUCTURE_AND_GOVERNANCE'
        when 'CAP-02' then 'WORKFORCE_AND_WORK'
        when 'CAP-04' then 'PRODUCT_CATALOG_AND_KNOWLEDGE'
        when 'CAP-05' then 'PROCUREMENT'
        when 'CAP-06' then 'INVENTORY_AND_STORAGE'
        when 'CAP-07' then 'ASSETS_AND_REUSABLES'
        when 'CAP-08' then 'PRODUCTION'
        when 'CAP-09' then 'ORDERS_SALES_AND_COLLECTION'
        when 'CAP-10' then 'CUSTOMERS_AND_RELATIONSHIPS'
        when 'CAP-11' then 'TRANSPORT_DISPATCH_AND_DELIVERY'
        when 'CAP-12' then 'FINANCE_COSTS_AND_OBLIGATIONS'
        when 'CAP-14' then 'COMMUNICATION_AND_PROMOTION'
        when 'CAP-15' then 'TECHNOLOGY_AND_SUPPORT'
        when 'CAP-16' then 'INFORMATION_DOCUMENTS_AND_EVIDENCE'
        when 'CAP-17' then 'MEASUREMENT_ANALYTICS_AND_IMPROVEMENT'
        when 'CAP-18' then 'CONTINUITY_AND_INCIDENTS'
        when 'OUTSIDE_VENTO_OS' then 'VITAL_PRODUCT_BOUNDARY'
        else 'MULTI_DOMAIN_REVIEW'
      end
    ) as target_domain_or_special_class,
    case when capability_count is not null then 'AUTOMATION' else 'ENDPOINT' end as target_component_role,
    case when capability_count is not null then 'DERIVED_AUTOMATION' else 'COMMAND_OR_QUERY_ENDPOINT' end as target_authority_mode,
    case
      when capability_count is not null then 'DOMAIN_EVENT'
      when function_name ~ '^(get|list|find|search|can|is|has|resolve|calculate|compute|preview|validate|check|current|fetch)' then 'QUERY'
      else 'COMMAND'
    end as target_contract_mode,
    case
      when security_definer then 'SECURITY_DEFINER_REVIEW'
      when schema_name = 'app_private' then 'SERVER_ONLY_PRIVATE_SCHEMA'
      when schema_name = 'vital' then 'VITAL_SEPARATE_PRODUCT_BOUNDARY'
      else 'FUNCTION_EXECUTION_PRIVILEGE_REVIEW'
    end as target_security_boundary,
    'SUPA-TRANS-003;SUPA-TRANS-007;SUPA-TRANS-008;SUPA-TRANS-009;SUPA-TRANS-010' as target_compatibility_dependencies,
    'TRANS::FUNCTION::' || object_key as target_transition_key,
    case
      when capability_count is not null then 'MAPPED_BY_TRIGGER_PARENT'
      else 'MAPPED_BY_SCHEMA_AND_EFFECT;DEPENDENCY_REFINEMENT_SUPA_TRANS_003'
    end as mapping_status,
    'RESERVED_FOR_SUPA_TRANS_002' as disposition_status,
    'SUPA-AUD-022;SUPA-ARC-013;SUPA-ARC-016;REMOTE_CATALOG_2026-07-31' as evidence_refs
  from function_classified
),
trigger_map as (
  select
    rm.current_object_key || '::trigger::' || t.tgname as current_object_key,
    'TRIGGER'::text as current_object_class,
    'CURRENT_DATABASE_AUTOMATION'::text as current_source_status,
    rm.current_product_boundary,
    rm.current_capability_key,
    rm.current_owner,
    rm.current_consumers,
    'INHERITED_FROM_RELATION_PARENT'::text as current_ownership_state,
    rm.target_domain_or_special_class,
    'AUTOMATION'::text as target_component_role,
    'DERIVED_AUTOMATION'::text as target_authority_mode,
    'DOMAIN_EVENT'::text as target_contract_mode,
    case when p.prosecdef then 'SECURITY_DEFINER_TRIGGER_REVIEW' else 'TRIGGER_PRIVILEGE_REVIEW' end as target_security_boundary,
    'SUPA-TRANS-003;SUPA-TRANS-008;SUPA-TRANS-009;SUPA-TRANS-010'::text as target_compatibility_dependencies,
    'TRANS::TRIGGER::' || rm.current_object_key || '::' || t.tgname as target_transition_key,
    'MAPPED_BY_RELATION_PARENT'::text as mapping_status,
    'RESERVED_FOR_SUPA_TRANS_002'::text as disposition_status,
    'SUPA-AUD-022;SUPA-ARC-013;REMOTE_CATALOG_2026-07-31'::text as evidence_refs
  from pg_trigger t
  join relation_map rm on rm.relation_oid = t.tgrelid
  join pg_proc p on p.oid = t.tgfoid
  where not t.tgisinternal
),
bucket_map as (
  select
    'storage.bucket.' || b.id as current_object_key,
    'STORAGE_BUCKET'::text as current_object_class,
    case when b.public then 'CURRENT_PUBLIC_BUCKET' else 'CURRENT_PRIVATE_BUCKET' end as current_source_status,
    'VENTO_OS'::text as current_product_boundary,
    case b.id
      when 'commercial-menu-images' then 'CAP-04'
      when 'documents' then 'CAP-16'
      when 'employee-photos' then 'CAP-02'
      when 'nexo-ai-documents' then 'CAP-15'
      when 'nexo-catalog-images' then 'CAP-04'
      when 'pass-satellite-logos' then 'CAP-10'
      when 'product-images' then 'CAP-04'
      when 'public-documents' then 'CAP-14'
      when 'recipe-media' then 'CAP-08'
      when 'recipe-step-photos' then 'CAP-08'
      when 'talento-cv' then 'CAP-02'
      when 'talento-documents' then 'CAP-02'
      when 'talento-medical' then 'CAP-02'
      when 'website-media' then 'CAP-14'
      else 'UNCLASSIFIED_BUCKET'
    end as current_capability_key,
    case b.id
      when 'commercial-menu-images' then 'PASS/AURA'
      when 'documents' then 'ANIMA/VISO'
      when 'employee-photos' then 'ANIMA/VISO'
      when 'nexo-ai-documents' then 'NEXO'
      when 'nexo-catalog-images' then 'NEXO'
      when 'pass-satellite-logos' then 'PASS'
      when 'product-images' then 'NEXO'
      when 'public-documents' then 'AURA/PASS'
      when 'recipe-media' then 'FOGO'
      when 'recipe-step-photos' then 'FOGO'
      when 'talento-cv' then 'TALENTO'
      when 'talento-documents' then 'TALENTO'
      when 'talento-medical' then 'TALENTO'
      when 'website-media' then 'AURA/PASS'
      else 'UNRESOLVED_OWNER'
    end as current_owner,
    case b.id
      when 'commercial-menu-images' then 'PASS, PULSO, AURA'
      when 'documents' then 'ANIMA, VISO y destinatarios autorizados'
      when 'employee-photos' then 'ANIMA, VISO y superficies laborales autorizadas'
      when 'nexo-ai-documents' then 'NEXO server-side'
      when 'nexo-catalog-images' then 'NEXO, PASS, PULSO, ORIGO, FOGO'
      when 'pass-satellite-logos' then 'PASS, website y PULSO'
      when 'product-images' then 'NEXO, PASS, PULSO, ORIGO, FOGO'
      when 'public-documents' then 'website, PASS y publico autorizado'
      when 'recipe-media' then 'FOGO y NEXO autorizado'
      when 'recipe-step-photos' then 'FOGO y ejecucion productiva'
      when 'talento-cv' then 'TALENTO y VISO autorizado'
      when 'talento-documents' then 'TALENTO y VISO autorizado'
      when 'talento-medical' then 'TALENTO y responsables medicos autorizados'
      when 'website-media' then 'website y AURA'
      else 'UNRESOLVED_CONSUMERS'
    end as current_consumers,
    'CONFIRMED_CURRENT_WITH_BOUNDARY'::text as current_ownership_state,
    case b.id
      when 'commercial-menu-images' then 'PRODUCT_CATALOG_AND_KNOWLEDGE'
      when 'documents' then 'INFORMATION_DOCUMENTS_AND_EVIDENCE'
      when 'employee-photos' then 'WORKFORCE_AND_WORK'
      when 'nexo-ai-documents' then 'TECHNOLOGY_AND_SUPPORT'
      when 'nexo-catalog-images' then 'PRODUCT_CATALOG_AND_KNOWLEDGE'
      when 'pass-satellite-logos' then 'CUSTOMERS_AND_RELATIONSHIPS'
      when 'product-images' then 'PRODUCT_CATALOG_AND_KNOWLEDGE'
      when 'public-documents' then 'COMMUNICATION_AND_PROMOTION'
      when 'recipe-media' then 'PRODUCTION'
      when 'recipe-step-photos' then 'PRODUCTION'
      when 'talento-cv' then 'WORKFORCE_AND_WORK'
      when 'talento-documents' then 'WORKFORCE_AND_WORK'
      when 'talento-medical' then 'WORKFORCE_AND_WORK'
      when 'website-media' then 'COMMUNICATION_AND_PROMOTION'
      else 'UNRESOLVED_TARGET_DOMAIN'
    end as target_domain_or_special_class,
    'FILE'::text as target_component_role,
    'AUTHORITATIVE_FILE_ASSET'::text as target_authority_mode,
    'FILE_ASSET'::text as target_contract_mode,
    case when b.public then 'PUBLIC_BUCKET_POLICY_REVIEW' else 'PRIVATE_BUCKET_RLS_REVIEW' end as target_security_boundary,
    'SUPA-TRANS-003;SUPA-TRANS-005;SUPA-TRANS-007;SUPA-TRANS-009;SUPA-TRANS-010'::text as target_compatibility_dependencies,
    'TRANS::STORAGE_BUCKET::' || b.id as target_transition_key,
    'MAPPED_CURRENT_TO_LOGICAL_TARGET'::text as mapping_status,
    'RESERVED_FOR_SUPA_TRANS_002'::text as disposition_status,
    'SUPA-AUD-022;SUPA-ARC-018;storage.buckets;REMOTE_CATALOG_2026-07-31'::text as evidence_refs
  from storage.buckets b
),
edge_source(slug, capability_key, owner_name, consumers, verify_jwt) as (
  values
    ('wallet-pass', 'CAP-10', 'PASS', 'usuario PASS', true),
    ('attendance-report', 'CAP-02', 'ANIMA', 'usuario laboral autorizado', true),
    ('staff-invitations-create', 'CAP-02', 'VISO/ANIMA', 'administrador laboral', true),
    ('request-account-deletion', 'CAP-18', 'PASS', 'cliente autenticado', true),
    ('account-deletion', 'CAP-18', 'PASS', 'cliente autenticado y worker', true),
    ('payments-create-intent', 'CAP-09', 'PASS/PULSO', 'cliente o caja autorizada', true),
    ('shift-publish-notify', 'CAP-02', 'ANIMA', 'ANIMA y notificaciones', true),
    ('pass-delivery-quote', 'CAP-11', 'PASS/PULSO', 'cliente PASS', true),
    ('pass-address-search', 'CAP-11', 'PASS', 'cliente PASS', true),
    ('support-message-notify', 'CAP-15', 'SHELL/ANIMA', 'soporte y notificaciones', true),
    ('pass-register-push-token', 'CAP-10', 'PASS', 'cliente PASS', true),
    ('order-message-notify', 'CAP-09', 'PASS/PULSO', 'participantes del pedido', true),
    ('staff-invitations-accept', 'CAP-02', 'VISO/ANIMA', 'trabajador invitado', false),
    ('document-alerts', 'CAP-16', 'ANIMA', 'cron y trabajadores', false),
    ('process-account-deletions', 'CAP-18', 'PASS', 'workflow GitHub Actions', false),
    ('register-push-token', 'CAP-02', 'ANIMA', 'trabajador autenticado', false),
    ('announcement-notify', 'CAP-14', 'ANIMA/AURA', 'trabajadores y canales autorizados', false),
    ('employee-delete', 'CAP-02', 'VISO', 'administracion laboral', false),
    ('payments-webhook', 'CAP-09', 'PASS/PULSO', 'Wompi y dominio de pagos', false),
    ('staff-invitations-resend', 'CAP-02', 'VISO/ANIMA', 'administrador laboral', false),
    ('staff-invitations-cancel', 'CAP-02', 'VISO/ANIMA', 'administrador laboral', false),
    ('shift-runtime-processor', 'CAP-02', 'ANIMA', 'cron y runtime de turnos', false),
    ('payments-return', 'CAP-09', 'PASS', 'navegador y aplicacion PASS', false),
    ('delivery-portal', 'CAP-11', 'PULSO/PASS', 'repartidor externo por token de capacidad', false)
),
edge_map as (
  select
    'edge.' || slug as current_object_key,
    'EDGE_FUNCTION'::text as current_object_class,
    'ACTIVE_EDGE_FUNCTION'::text as current_source_status,
    'VENTO_OS'::text as current_product_boundary,
    capability_key as current_capability_key,
    owner_name as current_owner,
    consumers as current_consumers,
    'CONFIRMED_CURRENT_WITH_BOUNDARY'::text as current_ownership_state,
    case capability_key
      when 'CAP-02' then 'WORKFORCE_AND_WORK'
      when 'CAP-09' then 'ORDERS_SALES_AND_COLLECTION'
      when 'CAP-10' then 'CUSTOMERS_AND_RELATIONSHIPS'
      when 'CAP-11' then 'TRANSPORT_DISPATCH_AND_DELIVERY'
      when 'CAP-14' then 'COMMUNICATION_AND_PROMOTION'
      when 'CAP-15' then 'TECHNOLOGY_AND_SUPPORT'
      when 'CAP-16' then 'INFORMATION_DOCUMENTS_AND_EVIDENCE'
      when 'CAP-18' then 'CONTINUITY_AND_INCIDENTS'
      else 'UNRESOLVED_TARGET_DOMAIN'
    end as target_domain_or_special_class,
    'ENDPOINT'::text as target_component_role,
    'COMMAND_OR_QUERY_ENDPOINT'::text as target_authority_mode,
    'COMMAND'::text as target_contract_mode,
    case when verify_jwt then 'JWT_VERIFIED_EDGE_ENDPOINT' else 'CUSTOM_AUTH_OR_PUBLIC_ENDPOINT_REVIEW' end as target_security_boundary,
    'SUPA-TRANS-003;SUPA-TRANS-007;SUPA-TRANS-008;SUPA-TRANS-009;SUPA-TRANS-010'::text as target_compatibility_dependencies,
    'TRANS::EDGE_FUNCTION::' || slug as target_transition_key,
    'MAPPED_DEPLOYED_EDGE_FUNCTION'::text as mapping_status,
    'RESERVED_FOR_SUPA_TRANS_002'::text as disposition_status,
    'SUPA-AUD-022;SUPA-ARC-020;REMOTE_EDGE_FUNCTION_LIST_2026-07-31'::text as evidence_refs
  from edge_source
),
cron_map as (
  select
    'cron.' || j.jobname as current_object_key,
    'CRON_JOB'::text as current_object_class,
    case when j.active then 'ACTIVE_CRON_JOB' else 'DISABLED_CRON_JOB' end as current_source_status,
    'VENTO_OS'::text as current_product_boundary,
    case
      when j.jobname = 'document-alerts-daily' then 'CAP-16'
      when j.jobname in (
        'auto-close-attendance', 'anima_shift_runtime_processor_every_5m',
        'anima_attendance_day_end_close_0005',
        'attendance_stale_open_shift_autoclose_daily_bogota'
      ) then 'CAP-02'
      when j.jobname = 'pass_delivery_quotes_cleanup_hourly' then 'CAP-11'
      when j.jobname = 'pass_payment_checkout_expiry_reconciliation' then 'CAP-09'
      else 'UNCLASSIFIED_CRON'
    end as current_capability_key,
    case
      when j.jobname = 'document-alerts-daily' then 'ANIMA'
      when j.jobname in (
        'auto-close-attendance', 'anima_shift_runtime_processor_every_5m',
        'anima_attendance_day_end_close_0005',
        'attendance_stale_open_shift_autoclose_daily_bogota'
      ) then 'ANIMA'
      when j.jobname = 'pass_delivery_quotes_cleanup_hourly' then 'PASS'
      when j.jobname = 'pass_payment_checkout_expiry_reconciliation' then 'PASS/PULSO'
      else 'UNRESOLVED_OWNER'
    end as current_owner,
    'scheduler, endpoint objetivo y dominio propietario'::text as current_consumers,
    'CONFIRMED_CURRENT_WITH_BOUNDARY'::text as current_ownership_state,
    case
      when j.jobname = 'document-alerts-daily' then 'INFORMATION_DOCUMENTS_AND_EVIDENCE'
      when j.jobname in (
        'auto-close-attendance', 'anima_shift_runtime_processor_every_5m',
        'anima_attendance_day_end_close_0005',
        'attendance_stale_open_shift_autoclose_daily_bogota'
      ) then 'WORKFORCE_AND_WORK'
      when j.jobname = 'pass_delivery_quotes_cleanup_hourly' then 'TRANSPORT_DISPATCH_AND_DELIVERY'
      when j.jobname = 'pass_payment_checkout_expiry_reconciliation' then 'ORDERS_SALES_AND_COLLECTION'
      else 'UNRESOLVED_TARGET_DOMAIN'
    end as target_domain_or_special_class,
    'AUTOMATION'::text as target_component_role,
    'DERIVED_AUTOMATION'::text as target_authority_mode,
    'JOB'::text as target_contract_mode,
    'SCHEDULER_SECRET_AND_DELIVERY_REVIEW'::text as target_security_boundary,
    'SUPA-TRANS-003;SUPA-TRANS-008;SUPA-TRANS-009;SUPA-TRANS-010;SUPA-TRANS-011'::text as target_compatibility_dependencies,
    'TRANS::CRON_JOB::' || j.jobname as target_transition_key,
    'MAPPED_CURRENT_TO_LOGICAL_TARGET'::text as mapping_status,
    'RESERVED_FOR_SUPA_TRANS_002'::text as disposition_status,
    'SUPA-AUD-022;SUPA-ARC-020;cron.job;REMOTE_CATALOG_2026-07-31'::text as evidence_refs
  from cron.job j
),
migration_map as (
  select
    'migration.' || m.version || '_' || m.name as current_object_key,
    'MIGRATION_EVIDENCE'::text as current_object_class,
    'DEPLOYED_REMOTE_MIGRATION_EVIDENCE'::text as current_source_status,
    'VENTO_OS'::text as current_product_boundary,
    'CAP-02'::text as current_capability_key,
    'VISO/ANIMA'::text as current_owner,
    'VISO, ANIMA y consumidores de employee_shifts'::text as current_consumers,
    'PROVISIONAL_OPERATIONAL_RULE'::text as current_ownership_state,
    'WORKFORCE_AND_WORK'::text as target_domain_or_special_class,
    'SUPPORT'::text as target_component_role,
    'MIGRATION_EVIDENCE_ONLY'::text as target_authority_mode,
    'COMPATIBILITY'::text as target_contract_mode,
    'SECURITY_DEFINER_AND_TRIGGER_REVIEW'::text as target_security_boundary,
    'SUPA-TRANS-003;SUPA-TRANS-008;SUPA-TRANS-009;SUPA-TRANS-010;SUPA-TRANS-011;SUPA-TRANS-013'::text as target_compatibility_dependencies,
    'TRANS::MIGRATION_EVIDENCE::' || m.version || '::' || m.name as target_transition_key,
    'MAPPED_AS_DEPLOYED_EVIDENCE_NOT_STABLE_ARCHITECTURE'::text as mapping_status,
    'RESERVED_FOR_SUPA_TRANS_002'::text as disposition_status,
    '06_PLAN_DE_TRANSICION.md;supabase_migrations.schema_migrations;REMOTE_CATALOG_2026-07-31'::text as evidence_refs
  from supabase_migrations.schema_migrations m
  where m.version = '20260731082600'
    and m.name = 'viso_monthly_schedule_186_hour_publish_guard'
),
transition_map as (
  select
    current_object_key, current_object_class, current_source_status,
    current_product_boundary, current_capability_key, current_owner,
    current_consumers, current_ownership_state,
    target_domain_or_special_class, target_component_role,
    target_authority_mode, target_contract_mode, target_security_boundary,
    target_compatibility_dependencies, target_transition_key,
    mapping_status, disposition_status, evidence_refs
  from relation_map
  union all
  select * from function_map
  union all
  select * from trigger_map
  union all
  select * from bucket_map
  union all
  select * from edge_map
  union all
  select * from cron_map
  union all
  select * from migration_map
)
select *
from transition_map
order by current_object_class, current_object_key;
