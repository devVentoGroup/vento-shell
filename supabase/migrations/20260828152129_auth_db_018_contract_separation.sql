begin;

create temporary table auth_db_018_rpc_contracts (
  rpc_schema text not null,
  rpc_name text not null,
  primary key (rpc_schema, rpc_name)
) on commit drop;

insert into auth_db_018_rpc_contracts (rpc_schema, rpc_name)
values
  ('club', 'can_access_beta'),
  ('club', 'get_my_membership'),
  ('club', 'get_my_wallet'),
  ('club', 'list_my_wallet_ledger'),
  ('pass', 'get_my_total_earned_points'),
  ('public', 'anima_diagnostic_employee_push_tokens'),
  ('public', 'anima_diagnostic_push_token_coverage'),
  ('public', 'anonymize_user_personal_data'),
  ('public', 'apply_inventory_count_adjustments'),
  ('public', 'apply_master_inventory_profile_batch'),
  ('public', 'apply_master_presentation_version_batch'),
  ('public', 'apply_master_product_identity_batch'),
  ('public', 'apply_master_product_site_batch'),
  ('public', 'apply_master_production_route_batch'),
  ('public', 'apply_master_request_policy_batch'),
  ('public', 'apply_master_request_policy_rules_batch'),
  ('public', 'apply_master_request_policy_units_batch'),
  ('public', 'apply_master_supplier_purchase_batch'),
  ('public', 'apply_restock_receipt'),
  ('public', 'apply_restock_shipment_from_picks'),
  ('public', 'apply_shared_device_template_actor_policies_v1'),
  ('public', 'archive_finished_order_conversations'),
  ('public', 'assign_inventory_stock_to_location'),
  ('public', 'assign_inventory_stock_to_position'),
  ('public', 'attach_shared_device_action_signature_target'),
  ('public', 'award_loyalty_points_external'),
  ('public', 'bootstrap_my_candidate'),
  ('public', 'checkout_fail_payment_transaction'),
  ('public', 'checkout_find_payment_transaction_by_reference'),
  ('public', 'checkout_get_payment_transaction'),
  ('public', 'checkout_get_payment_webhook_event'),
  ('public', 'checkout_mark_payment_transaction_requires_action'),
  ('public', 'checkout_record_payment_webhook_event'),
  ('public', 'close_inventory_count_session'),
  ('public', 'confirm_interview'),
  ('public', 'confirm_remission_shipment_receipt'),
  ('public', 'consume_inventory_stock_by_uom_profile'),
  ('public', 'consume_inventory_stock_from_positions'),
  ('public', 'create_gift_aware_scheduled_order_checkout_draft'),
  ('public', 'create_inventory_count_session_with_lines'),
  ('public', 'create_order_delivery_courier_link'),
  ('public', 'create_remission_shipment_from_fulfillments'),
  ('public', 'current_employee_site_id'),
  ('public', 'current_shared_operational_device_v1'),
  ('public', 'deactivate_master_request_policy_batch'),
  ('public', 'employee_wallet_eligibility'),
  ('public', 'end_attendance_break'),
  ('public', 'ensure_order_conversation'),
  ('public', 'fogo_recipe_area_options'),
  ('public', 'generate_manual_daily_internal_pos_documents'),
  ('public', 'get_client_order_chat_unread_counts'),
  ('public', 'get_effective_context_v1'),
  ('public', 'get_operational_context'),
  ('public', 'get_order_delivery_pin'),
  ('public', 'get_order_delivery_slots'),
  ('public', 'get_order_reschedule_slots_admin'),
  ('public', 'get_restock_request_operational_summary'),
  ('public', 'get_site_order_status'),
  ('public', 'get_staff_order_chat_unread_counts'),
  ('public', 'has_effective_permission_v1'),
  ('public', 'has_operational_permission'),
  ('public', 'has_operational_role_permission'),
  ('public', 'has_permission'),
  ('public', 'mark_order_conversation_read'),
  ('public', 'mark_payment_transaction_status'),
  ('public', 'nexo_kiosk_withdraw_workers'),
  ('public', 'origo_mark_inventory_entry_corrected'),
  ('public', 'origo_reverse_inventory_entry'),
  ('public', 'override_order_delivery_confirmation'),
  ('public', 'preview_manual_daily_internal_pos_documents'),
  ('public', 'price_restock_request_internal_transfer'),
  ('public', 'promote_app_screen_to_navigation'),
  ('public', 'pulso_post_daily_sales_import'),
  ('public', 'reconcile_staff_invitations'),
  ('public', 'reconcile_zero_internal_positions_for_location_product'),
  ('public', 'register_shift_departure_event'),
  ('public', 'register_shift_departure_event_autoclose'),
  ('public', 'reschedule_scheduled_order_admin'),
  ('public', 'resolve_scheduled_order_contact_admin'),
  ('public', 'respond_to_offer'),
  ('public', 'reverse_restock_request'),
  ('public', 'set_employee_kiosk_pin'),
  ('public', 'set_order_conversation_archived'),
  ('public', 'sign_shared_device_action'),
  ('public', 'split_restock_request_item'),
  ('public', 'start_attendance_break'),
  ('public', 'start_context_simulation_v1'),
  ('public', 'stop_context_simulation_v1'),
  ('public', 'submit_application'),
  ('public', 'sync_attendance_events'),
  ('public', 'sync_restock_request_status_from_items'),
  ('public', 'update_order_gift_operational_state'),
  ('public', 'update_order_operational_state'),
  ('public', 'upsert_app_screen_registry'),
  ('public', 'upsert_employee_site_operational_profile'),
  ('public', 'upsert_inventory_stock_by_location'),
  ('public', 'upsert_inventory_stock_by_uom_profile'),
  ('public', 'upsert_operational_checkin_point'),
  ('public', 'upsert_site_operational_role'),
  ('public', 'viso_accounting_dashboard');

create temporary table auth_db_018_manifest (
  source_oid oid,
  source_name text,
  physical_identity text primary key,
  object_kind text not null,
  source_schema_name text not null,
  current_security_mode text not null,
  logical_owner text not null,
  contract_type text,
  target_layer text not null,
  disposition text not null,
  consumer_evidence text not null,
  compatibility_requirement text,
  security_gate text not null,
  blocking_reason text,
  exit_condition text,
  observed_state_before text not null,
  expected_state_after text not null,
  migration_reference text not null,
  environment text not null,
  drift_result text not null,
  evidence text not null,
  primary_universe boolean not null
) on commit drop;

insert into auth_db_018_manifest (
  source_oid,
  source_name,
  physical_identity,
  object_kind,
  source_schema_name,
  current_security_mode,
  logical_owner,
  contract_type,
  target_layer,
  disposition,
  consumer_evidence,
  compatibility_requirement,
  security_gate,
  blocking_reason,
  exit_condition,
  observed_state_before,
  expected_state_after,
  migration_reference,
  environment,
  drift_result,
  evidence,
  primary_universe
)
select
  c.oid,
  c.relname,
  n.nspname || '.' || c.relname,
  'VIEW',
  n.nspname,
  case
    when coalesce(c.reloptions, array[]::text[]) @> array['security_invoker=true']::text[]
      then 'SECURITY_INVOKER'
    else 'PRIVILEGED_VIEW'
  end,
  case
    when n.nspname = 'pass' then 'PASS'
    when n.nspname = 'club' then 'PASS/CLUB'
    when n.nspname = 'talento' then 'TALENTO'
    when n.nspname = 'viso' then 'VISO'
    when c.relname ~ '(attendance|shift|staff|employee|role|permission|checkin|checkout)' then 'ANIMA/VISO'
    when c.relname ~ '(procurement|purchase|supplier)' then 'ORIGO'
    when c.relname ~ '(inventory|restock|stock|lpn|location|transfer)' then 'NEXO'
    when c.relname ~ '(asset)' then 'NEXO'
    when c.relname ~ '(production|recipe|fogo)' then 'FOGO'
    when c.relname ~ '(order|payment|checkout|pos_|pulso|sales)' then 'PASS/PULSO'
    when c.relname ~ '(loyalty|wallet|client|user_|gift|reward|redemption)' then 'PASS/PULSO'
    when c.relname ~ '(delivery|remission|shipment|dispatch|route)' then 'NEXO/PASS/PULSO'
    when c.relname ~ '(numera|cost|expense|price|cash)' then 'NUMERA/PULSO'
    when c.relname ~ '(announcement|website|content)' then 'ANIMA/AURA/SHELL'
    when c.relname ~ '(document)' then 'ANIMA/VISO/NEXO'
    else 'CUSTODIO_TECNICO_ONLY: vento-shell'
  end,
  case
    when coalesce(c.reloptions, array[]::text[]) @> array['security_invoker=true']::text[]
      and has_table_privilege('authenticated', c.oid, 'SELECT')
      then 'READ_VIEW'
    else null
  end,
  case
    when coalesce(c.reloptions, array[]::text[]) @> array['security_invoker=true']::text[]
      and has_table_privilege('authenticated', c.oid, 'SELECT')
      then 'api'
    else 'OWNER_SCHEMA'
  end,
  case
    when coalesce(c.reloptions, array[]::text[]) @> array['security_invoker=true']::text[]
      and has_table_privilege('authenticated', c.oid, 'SELECT')
      then 'PUBLISH_API'
    else 'BLOCKED'
  end,
  case
    when has_table_privilege('authenticated', c.oid, 'SELECT')
      then 'CURRENT_AUTHENTICATED_SELECT;E3_TRANSITION_MAP'
    else 'E3_TRANSITION_MAP_ONLY'
  end,
  case
    when coalesce(c.reloptions, array[]::text[]) @> array['security_invoker=true']::text[]
      then 'KEEP_LEGACY_VIEW_UNTIL_CONSUMERS_MIGRATED'
    else null
  end,
  case
    when coalesce(c.reloptions, array[]::text[]) @> array['security_invoker=true']::text[]
      then 'SECURITY_INVOKER_REQUIRED;NO_AUTH_DB_017_GRANTS'
    else 'PRIVILEGED_VIEW_REDESIGN_REQUIRED'
  end,
  case
    when coalesce(c.reloptions, array[]::text[]) @> array['security_invoker=true']::text[]
      then null
    else 'VIEW_DEPENDS_ON_CREATOR_PRIVILEGES'
  end,
  case
    when coalesce(c.reloptions, array[]::text[]) @> array['security_invoker=true']::text[]
      then 'MIGRATE_CONSUMERS_TO_API_THEN_REMOVE_LEGACY_COMPATIBILITY'
    else 'EXPLICIT_SECURITY_REDESIGN_BEFORE_PUBLICATION'
  end,
  'LEGACY_VIEW_PRESENT',
  case
    when coalesce(c.reloptions, array[]::text[]) @> array['security_invoker=true']::text[]
      and has_table_privilege('authenticated', c.oid, 'SELECT')
      then 'API_SECURITY_INVOKER_PROJECTION_PLUS_LEGACY_COMPATIBILITY'
    else 'LEGACY_VIEW_PRESERVED_AND_API_PUBLICATION_BLOCKED'
  end,
  '20260828152129_auth_db_018_contract_separation.sql',
  'LOCAL',
  'VIEWS_62_MATCH_HISTORICAL_BASELINE',
  'AUTH-DB-018;SUPA-TRANS-001;SUPA-TRANS-002;CURRENT_CATALOG',
  true
from pg_catalog.pg_class c
join pg_catalog.pg_namespace n on n.oid = c.relnamespace
where n.nspname in (
  'app_private', 'club', 'pass', 'payments', 'pos', 'public', 'talento', 'viso'
)
  and c.relkind = 'v';

insert into auth_db_018_manifest (
  source_oid,
  source_name,
  physical_identity,
  object_kind,
  source_schema_name,
  current_security_mode,
  logical_owner,
  contract_type,
  target_layer,
  disposition,
  consumer_evidence,
  compatibility_requirement,
  security_gate,
  blocking_reason,
  exit_condition,
  observed_state_before,
  expected_state_after,
  migration_reference,
  environment,
  drift_result,
  evidence,
  primary_universe
)
select
  p.oid,
  p.proname,
  n.nspname || '.' || p.proname || '(' || pg_get_function_identity_arguments(p.oid) || ')',
  'FUNCTION',
  n.nspname,
  case when p.prosecdef then 'SECURITY_DEFINER' else 'SECURITY_INVOKER' end,
  case
    when n.nspname = 'talento' then 'TALENTO'
    when n.nspname = 'viso' then 'VISO'
    when n.nspname = 'club' and p.proname like '%audit%' then 'PASS/CLUB'
    when n.nspname = 'club' then 'PASS/CLUB'
    when n.nspname = 'pass' and p.proname ~ '(catalog|commercial|product|collection|option)' then 'PASS'
    when n.nspname = 'pass' and p.proname ~ '(loyalty|wallet|reward|redemption|favorite)' then 'PASS'
    when n.nspname = 'pass' and p.proname ~ '(delivery|address|satellite|schedule|business_hour)' then 'PASS'
    when n.nspname = 'app_private' then 'NEXO/PASS/PULSO'
    when p.proname ~ '(attendance|shift|staff|employee|role|permission|checkin|checkout)' then 'ANIMA/VISO'
    when p.proname ~ '(procurement|purchase|supplier)' then 'ORIGO'
    when p.proname ~ '(inventory|restock|stock|lpn|location|transfer)' then 'NEXO'
    when p.proname ~ '(asset)' then 'NEXO'
    when p.proname ~ '(production|recipe|fogo)' then 'FOGO'
    when p.proname ~ '(order|payment|checkout|pos_|pulso|sales)' then 'PASS/PULSO'
    when p.proname ~ '(loyalty|wallet|client|user_|gift|reward|redemption)' then 'PASS/PULSO'
    when p.proname ~ '(delivery|remission|shipment|dispatch|route)' then 'NEXO/PASS/PULSO'
    when p.proname ~ '(numera|cost|expense|price|cash)' then 'NUMERA/PULSO'
    when p.proname ~ '(announcement|website|content)' then 'ANIMA/AURA/SHELL'
    when p.proname ~ '(document)' then 'ANIMA/VISO/NEXO'
    else 'CUSTODIO_TECNICO_ONLY: vento-shell'
  end,
  case
    when r.rpc_name is not null
      and (
        has_function_privilege('authenticated', p.oid, 'EXECUTE')
      )
      then case
        when p.proname ~ '^(get|list|find|search|can|is|has|resolve|calculate|compute|preview|validate|check|current|fetch)'
          then 'QUERY_RPC'
        else 'COMMAND_RPC'
      end
    else null
  end,
  case
    when r.rpc_name is not null
      and (
        has_function_privilege('authenticated', p.oid, 'EXECUTE')
      )
      then 'api'
    when n.nspname = 'app_private' then 'app_private'
    else 'OWNER_SCHEMA'
  end,
  case
    when r.rpc_name is not null
      and (
        has_function_privilege('authenticated', p.oid, 'EXECUTE')
      )
      then 'PUBLISH_API'
    else 'KEEP_OWNER_INTERNAL'
  end,
  case
    when r.rpc_name is not null then 'AUTH-SRV-003_OBSERVED_RPC'
    else 'NO_RPC_CONSUMER_IN_AUTH-SRV-003;E3_TRANSITION_MAP'
  end,
  case
    when r.rpc_name is not null then 'KEEP_LEGACY_RPC_UNTIL_CONSUMERS_MIGRATED'
    else 'KEEP_LEGACY_IDENTITY_UNTIL_OWNER_VERTICALIZATION'
  end,
  case
    when r.rpc_name is not null
      and (
        has_function_privilege('authenticated', p.oid, 'EXECUTE')
      )
      then case
        when p.prosecdef then 'API_WRAPPER_SECURITY_INVOKER;LEGACY_SECURITY_DEFINER_REVIEW;NO_AUTH_DB_017_GRANTS'
        else 'API_WRAPPER_SECURITY_INVOKER;NO_AUTH_DB_017_GRANTS'
      end
    when p.prosecdef then 'OWNER_SECURITY_DEFINER_REVIEW'
    else 'OWNER_INTERNAL_EXECUTION_REVIEW'
  end,
  null,
  case
    when r.rpc_name is not null then 'MIGRATE_CONSUMERS_TO_CANONICAL_TARGET_THEN_REMOVE_LEGACY_COMPATIBILITY'
    else 'VERTICAL_OWNER_MIGRATION_OR_EXPLICIT_RETIREMENT_WITH_NEGATIVE_EVIDENCE'
  end,
  'LEGACY_FUNCTION_PRESENT',
  case
    when r.rpc_name is not null
      and (
        has_function_privilege('authenticated', p.oid, 'EXECUTE')
      )
      then 'API_INVOKER_WRAPPER_PLUS_LEGACY_COMPATIBILITY'
    else 'LEGACY_FUNCTION_PRESERVED_FOR_OWNER_TRANSITION'
  end,
  '20260828152129_auth_db_018_contract_separation.sql',
  'LOCAL',
  'RECONCILED_HISTORICAL_226_TO_CURRENT_224',
  case when r.rpc_name is not null
    then 'AUTH-DB-018;AUTH-SRV-003;SUPA-TRANS-001;SUPA-TRANS-002;CURRENT_CATALOG'
    else 'AUTH-DB-018;SUPA-TRANS-001;SUPA-TRANS-002;CURRENT_CATALOG'
  end,
  true
from pg_catalog.pg_proc p
join pg_catalog.pg_namespace n on n.oid = p.pronamespace
left join auth_db_018_rpc_contracts r
  on r.rpc_schema = n.nspname
 and r.rpc_name = p.proname
where n.nspname in (
  'app_private', 'club', 'pass', 'payments', 'pos', 'public', 'talento', 'viso'
)
  and p.prokind = 'f'
  and p.prorettype <> 'trigger'::regtype
  and p.prorettype <> 'event_trigger'::regtype
  and not exists (
    select 1
    from pg_catalog.pg_depend d
    where d.classid = 'pg_proc'::regclass
      and d.objid = p.oid
      and d.deptype = 'e'
  );

insert into auth_db_018_manifest (
  source_oid,
  source_name,
  physical_identity,
  object_kind,
  source_schema_name,
  current_security_mode,
  logical_owner,
  contract_type,
  target_layer,
  disposition,
  consumer_evidence,
  compatibility_requirement,
  security_gate,
  blocking_reason,
  exit_condition,
  observed_state_before,
  expected_state_after,
  migration_reference,
  environment,
  drift_result,
  evidence,
  primary_universe
)
select
  p.oid,
  p.proname,
  n.nspname || '.' || p.proname || '(' || pg_get_function_identity_arguments(p.oid) || ')',
  'TRIGGER_FUNCTION',
  n.nspname,
  case when p.prosecdef then 'SECURITY_DEFINER' else 'SECURITY_INVOKER' end,
  case
    when n.nspname = 'talento' then 'TALENTO'
    when n.nspname = 'pass' then 'PASS'
    when p.proname ~ '(attendance|shift|staff|employee|role|permission|checkin|checkout)' then 'ANIMA/VISO'
    when p.proname ~ '(inventory|restock|stock|lpn|location|transfer|asset)' then 'NEXO'
    when p.proname ~ '(production|recipe|fogo)' then 'FOGO'
    when p.proname ~ '(order|payment|checkout|pos_|pulso|sales)' then 'PASS/PULSO'
    when p.proname ~ '(delivery|remission|shipment|dispatch|route)' then 'NEXO/PASS/PULSO'
    else 'CUSTODIO_TECNICO_ONLY: vento-shell'
  end,
  null,
  'OWNER_SCHEMA',
  'KEEP_OWNER_INTERNAL',
  'TRIGGER_FUNCTION_NOT_RPC',
  'KEEP_WITH_PARENT_UNTIL_OWNER_MIGRATION',
  'NEVER_PUBLISH_API;TRIGGER_OWNER_REVIEW',
  null,
  'MOVE_WITH_PARENT_OR_RETAIN_UNTIL_VERTICAL_OWNER_MIGRATION',
  'LEGACY_TRIGGER_FUNCTION_PRESENT',
  'PRESERVED_OUTSIDE_API',
  '20260828152129_auth_db_018_contract_separation.sql',
  'LOCAL',
  'RECONCILED_HISTORICAL_71_TO_CURRENT_73',
  'AUTH-DB-018;SUPA-TRANS-001;SUPA-TRANS-002;CURRENT_CATALOG',
  false
from pg_catalog.pg_proc p
join pg_catalog.pg_namespace n on n.oid = p.pronamespace
where n.nspname in (
  'app_private', 'club', 'pass', 'payments', 'pos', 'public', 'talento', 'viso'
)
  and p.prokind = 'f'
  and p.prorettype in ('trigger'::regtype, 'event_trigger'::regtype)
  and not exists (
    select 1
    from pg_catalog.pg_depend d
    where d.classid = 'pg_proc'::regclass
      and d.objid = p.oid
      and d.deptype = 'e'
  );

insert into auth_db_018_manifest (
  source_oid,
  source_name,
  physical_identity,
  object_kind,
  source_schema_name,
  current_security_mode,
  logical_owner,
  contract_type,
  target_layer,
  disposition,
  consumer_evidence,
  compatibility_requirement,
  security_gate,
  blocking_reason,
  exit_condition,
  observed_state_before,
  expected_state_after,
  migration_reference,
  environment,
  drift_result,
  evidence,
  primary_universe
)
select
  p.oid,
  p.proname,
  n.nspname || '.' || p.proname || '(' || pg_get_function_identity_arguments(p.oid) || ')',
  'FUNCTION',
  n.nspname,
  case when p.prosecdef then 'SECURITY_DEFINER' else 'SECURITY_INVOKER' end,
  'PLATFORM_EXTENSION',
  null,
  'PLATFORM_MANAGED',
  'PLATFORM_MANAGED',
  'PG_EXTENSION_MEMBERSHIP',
  null,
  'EXCLUDED_FROM_VENTO_RELOCATION',
  null,
  null,
  'EXTENSION_MANAGED_FUNCTION_PRESENT',
  'UNCHANGED_PLATFORM_MANAGED',
  '20260828152129_auth_db_018_contract_separation.sql',
  'LOCAL',
  'EXCLUDED_FROM_DIRECT_VENTO_ROUTINES',
  'AUTH-DB-018;PG_DEPEND_EXTENSION_MEMBERSHIP',
  false
from pg_catalog.pg_proc p
join pg_catalog.pg_namespace n on n.oid = p.pronamespace
where n.nspname in (
  'app_private', 'club', 'pass', 'payments', 'pos', 'public', 'talento', 'viso'
)
  and p.prokind = 'f'
  and p.prorettype <> 'trigger'::regtype
  and p.prorettype <> 'event_trigger'::regtype
  and exists (
    select 1
    from pg_catalog.pg_depend d
    where d.classid = 'pg_proc'::regclass
      and d.objid = p.oid
      and d.deptype = 'e'
  );

update auth_db_018_manifest
set
  logical_owner = 'PASS',
  contract_type = null,
  target_layer = 'COMPATIBILITY',
  disposition = 'KEEP_COMPATIBILITY',
  consumer_evidence = 'CURRENT_AUTHENTICATED_SELECT;E3_TRANSITION_MAP;PUBLIC_COMPAT_VIEW',
  compatibility_requirement = 'KEEP_LEGACY_VIEW_UNTIL_CONSUMERS_MIGRATED',
  security_gate = 'SECURITY_INVOKER_REQUIRED;NO_AUTH_DB_017_GRANTS',
  blocking_reason = null,
  exit_condition = 'MIGRATE_CONSUMERS_TO_API_SELL_PRODUCTS_BY_SITE_THEN_REMOVE_PUBLIC_COMPATIBILITY',
  observed_state_before = 'LEGACY_COMPATIBILITY_VIEW_PRESENT',
  expected_state_after = 'PUBLIC_COMPATIBILITY_PRESERVED;API_CONTRACT_SOURCED_FROM_PASS_SELL_PRODUCTS_BY_SITE',
  drift_result = 'RECONCILED_PUBLIC_COMPATIBILITY_TO_PASS_CANONICAL_VIEW',
  evidence = 'AUTH-DB-018;SUPA-TRANS-001;SUPA-TRANS-002;VIEW_COMMENT_CANONICAL_PASS_SOURCE;CURRENT_CATALOG'
where object_kind = 'VIEW'
  and physical_identity = 'public.sell_products_by_site';
do $auth_db_018_pre_mutation$
declare
  v_count bigint;
begin
  if to_regnamespace('api') is null
    or to_regnamespace('app_private') is null
    or to_regnamespace('audit') is null then
    raise exception 'AUTH_DB_018_REQUIRES_AUTH_DB_016_TARGET_SCHEMAS';
  end if;

  select count(*) into v_count from auth_db_018_rpc_contracts;
  if v_count <> 100 then
    raise exception 'AUTH_DB_018_RPC_CANONICAL_COUNT_INVALID:%', v_count;
  end if;

  select count(*) into v_count
  from auth_db_018_manifest
  where object_kind = 'VIEW';
  if v_count <> 62 then
    raise exception 'AUTH_DB_018_VIEW_COUNT_INVALID:%', v_count;
  end if;

  select count(*) into v_count
  from auth_db_018_manifest
  where object_kind = 'VIEW'
    and current_security_mode = 'SECURITY_INVOKER';
  if v_count <> 58 then
    raise exception 'AUTH_DB_018_SECURITY_INVOKER_VIEW_COUNT_INVALID:%', v_count;
  end if;

  select count(*) into v_count
  from auth_db_018_manifest
  where object_kind = 'VIEW'
    and current_security_mode = 'PRIVILEGED_VIEW';
  if v_count <> 4 then
    raise exception 'AUTH_DB_018_PRIVILEGED_VIEW_COUNT_INVALID:%', v_count;
  end if;
  select count(*) into v_count
  from auth_db_018_manifest
  where object_kind = 'VIEW'
    and disposition = 'PUBLISH_API';
  if v_count <> 57 then
    raise exception 'AUTH_DB_018_API_VIEW_CLASSIFICATION_COUNT_INVALID:%', v_count;
  end if;

  select count(*) into v_count
  from auth_db_018_manifest
  where object_kind = 'VIEW'
    and disposition = 'KEEP_COMPATIBILITY';
  if v_count <> 1 then
    raise exception 'AUTH_DB_018_COMPATIBILITY_VIEW_COUNT_INVALID:%', v_count;
  end if;

  select count(*) into v_count
  from auth_db_018_manifest
  where object_kind = 'VIEW'
    and disposition = 'BLOCKED';
  if v_count <> 4 then
    raise exception 'AUTH_DB_018_BLOCKED_VIEW_COUNT_INVALID:%', v_count;
  end if;

  if not exists (
    select 1
    from auth_db_018_manifest
    where physical_identity = 'pass.sell_products_by_site'
      and object_kind = 'VIEW'
      and disposition = 'PUBLISH_API'
      and contract_type = 'READ_VIEW'
  ) then
    raise exception 'AUTH_DB_018_CANONICAL_SELL_PRODUCTS_VIEW_NOT_PUBLISHED';
  end if;

  if not exists (
    select 1
    from auth_db_018_manifest
    where physical_identity = 'public.sell_products_by_site'
      and object_kind = 'VIEW'
      and disposition = 'KEEP_COMPATIBILITY'
  ) then
    raise exception 'AUTH_DB_018_PUBLIC_SELL_PRODUCTS_COMPATIBILITY_NOT_PRESERVED';
  end if;

  select count(*) into v_count
  from auth_db_018_manifest
  where object_kind = 'FUNCTION'
    and primary_universe;
  if v_count <> 224 then
    raise exception 'AUTH_DB_018_DIRECT_VENTO_ROUTINE_COUNT_INVALID:%', v_count;
  end if;

  select count(*) into v_count
  from auth_db_018_manifest
  where object_kind = 'FUNCTION'
    and primary_universe
    and current_security_mode = 'SECURITY_DEFINER';
  if v_count <> 166 then
    raise exception 'AUTH_DB_018_DIRECT_SECURITY_DEFINER_COUNT_INVALID:%', v_count;
  end if;

  select count(*) into v_count
  from auth_db_018_manifest
  where object_kind = 'TRIGGER_FUNCTION';
  if v_count <> 73 then
    raise exception 'AUTH_DB_018_TRIGGER_FUNCTION_COUNT_INVALID:%', v_count;
  end if;

  select count(*) into v_count
  from auth_db_018_manifest
  where disposition = 'PLATFORM_MANAGED';
  if v_count <> 4 then
    raise exception 'AUTH_DB_018_PLATFORM_MANAGED_COUNT_INVALID:%', v_count;
  end if;

  select count(*) into v_count
  from auth_db_018_manifest
  where primary_universe;
  if v_count <> 286 then
    raise exception 'AUTH_DB_018_PRIMARY_UNIVERSE_COUNT_INVALID:%', v_count;
  end if;

  select count(distinct r.rpc_schema || '.' || r.rpc_name) into v_count
  from auth_db_018_rpc_contracts r
  where exists (
    select 1
    from pg_catalog.pg_proc p
    join pg_catalog.pg_namespace n on n.oid = p.pronamespace
    where n.nspname = r.rpc_schema
      and p.proname = r.rpc_name
      and p.prokind = 'f'
      and p.prorettype <> 'trigger'::regtype
      and p.prorettype <> 'event_trigger'::regtype
      and not exists (
        select 1
        from pg_catalog.pg_depend d
        where d.classid = 'pg_proc'::regclass
          and d.objid = p.oid
          and d.deptype = 'e'
      )
  );
  if v_count <> 93 then
    raise exception 'AUTH_DB_018_CURRENT_RPC_CONTRACT_COUNT_INVALID:%', v_count;
  end if;

  select count(distinct r.rpc_schema || '.' || r.rpc_name) into v_count
  from auth_db_018_rpc_contracts r
  where exists (
    select 1
    from pg_catalog.pg_proc p
    join pg_catalog.pg_namespace n on n.oid = p.pronamespace
    where n.nspname = r.rpc_schema
      and p.proname = r.rpc_name
      and p.prokind = 'f'
      and p.prorettype <> 'trigger'::regtype
      and p.prorettype <> 'event_trigger'::regtype
      and not exists (
        select 1
        from pg_catalog.pg_depend d
        where d.classid = 'pg_proc'::regclass
          and d.objid = p.oid
          and d.deptype = 'e'
      )
      and (
        has_function_privilege('authenticated', p.oid, 'EXECUTE')
      )
  );
  if v_count <> 83 then
    raise exception 'AUTH_DB_018_CLIENT_RPC_CONTRACT_COUNT_INVALID:%', v_count;
  end if;

  select count(distinct r.rpc_schema || '.' || r.rpc_name) into v_count
  from auth_db_018_rpc_contracts r
  where exists (
    select 1
    from pg_catalog.pg_proc p
    join pg_catalog.pg_namespace n on n.oid = p.pronamespace
    where n.nspname = r.rpc_schema
      and p.proname = r.rpc_name
      and p.prokind = 'f'
      and p.prorettype <> 'trigger'::regtype
      and p.prorettype <> 'event_trigger'::regtype
      and not exists (
        select 1
        from pg_catalog.pg_depend d
        where d.classid = 'pg_proc'::regclass
          and d.objid = p.oid
          and d.deptype = 'e'
      )
      and not has_function_privilege('authenticated', p.oid, 'EXECUTE')
  );
  if v_count <> 10 then
    raise exception 'AUTH_DB_018_SERVER_ONLY_RPC_CONTRACT_COUNT_INVALID:%', v_count;
  end if;

  if exists (
    select 1
    from auth_db_018_manifest
    where primary_universe
      and disposition is null
  ) then
    raise exception 'AUTH_DB_018_UNCLASSIFIED_PRIMARY_IDENTITY';
  end if;

  if exists (
    select physical_identity
    from auth_db_018_manifest
    group by physical_identity
    having count(*) > 1
  ) then
    raise exception 'AUTH_DB_018_DUPLICATE_PHYSICAL_IDENTITY';
  end if;

  if exists (
    select 1
    from auth_db_018_manifest
    where disposition = 'PUBLISH_API'
      and contract_type not in ('READ_VIEW', 'QUERY_RPC', 'COMMAND_RPC')
  ) then
    raise exception 'AUTH_DB_018_INVALID_API_CONTRACT_TYPE';
  end if;

  if exists (
    select 1
    from auth_db_018_manifest
    where object_kind = 'TRIGGER_FUNCTION'
      and disposition = 'PUBLISH_API'
  ) then
    raise exception 'AUTH_DB_018_TRIGGER_FUNCTION_PUBLISH_ATTEMPT';
  end if;

  if exists (
    select 1
    from auth_db_018_manifest
    where object_kind = 'VIEW'
      and current_security_mode = 'PRIVILEGED_VIEW'
      and disposition = 'PUBLISH_API'
  ) then
    raise exception 'AUTH_DB_018_PRIVILEGED_VIEW_PUBLISH_ATTEMPT';
  end if;

  if exists (
    select 1
    from auth_db_018_manifest m
    join pg_catalog.pg_proc p on p.oid = m.source_oid
    where m.object_kind = 'FUNCTION'
      and m.disposition = 'PUBLISH_API'
      and p.provariadic <> 0
  ) then
    raise exception 'AUTH_DB_018_VARIADIC_API_WRAPPER_REQUIRES_EXPLICIT_DESIGN';
  end if;

  if exists (
    select m.source_name, pg_get_function_identity_arguments(p.oid)
    from auth_db_018_manifest m
    join pg_catalog.pg_proc p on p.oid = m.source_oid
    where m.object_kind = 'FUNCTION'
      and m.disposition = 'PUBLISH_API'
    group by m.source_name, pg_get_function_identity_arguments(p.oid)
    having count(*) > 1
  ) then
    raise exception 'AUTH_DB_018_API_FUNCTION_SIGNATURE_COLLISION';
  end if;

  if exists (
    select source_name
    from auth_db_018_manifest
    where object_kind = 'VIEW'
      and disposition = 'PUBLISH_API'
    group by source_name
    having count(*) > 1
  ) then
    raise exception 'AUTH_DB_018_API_VIEW_NAME_COLLISION';
  end if;
end
$auth_db_018_pre_mutation$;

do $auth_db_018_materialize_views$
declare
  r record;
begin
  for r in
    select source_name, source_schema_name
    from auth_db_018_manifest
    where object_kind = 'VIEW'
      and disposition = 'PUBLISH_API'
    order by physical_identity
  loop
    execute format(
      'create or replace view api.%I with (security_invoker=true) as select * from %I.%I',
      r.source_name,
      r.source_schema_name,
      r.source_name
    );
  end loop;
end
$auth_db_018_materialize_views$;

do $auth_db_018_materialize_functions$
declare
  r record;
  v_call_args text;
  v_body text;
  v_volatility text;
begin
  for r in
    select
      m.source_oid,
      m.source_name,
      m.source_schema_name,
      m.contract_type,
      p.pronargs,
      p.proretset,
      p.provolatile,
      pg_get_function_arguments(p.oid) as function_arguments,
      pg_get_function_result(p.oid) as function_result,
      pg_get_function_identity_arguments(p.oid) as identity_arguments
    from auth_db_018_manifest m
    join pg_catalog.pg_proc p on p.oid = m.source_oid
    where m.object_kind = 'FUNCTION'
      and m.disposition = 'PUBLISH_API'
    order by m.physical_identity
  loop
    select coalesce(string_agg(format('$%s', i), ', ' order by i), '')
    into v_call_args
    from generate_series(1, r.pronargs) as g(i);

    v_volatility := case r.provolatile
      when 'i' then 'immutable'
      when 's' then 'stable'
      else 'volatile'
    end;

    if r.proretset or r.function_result like 'TABLE(%' then
      v_body := format(
        'select * from %I.%I(%s)',
        r.source_schema_name,
        r.source_name,
        v_call_args
      );
    else
      v_body := format(
        'select %I.%I(%s)',
        r.source_schema_name,
        r.source_name,
        v_call_args
      );
    end if;

    execute format(
      'create or replace function api.%I(%s) returns %s language sql %s security invoker set search_path = pg_catalog, api as $auth_db_018_wrapper$ %s $auth_db_018_wrapper$',
      r.source_name,
      r.function_arguments,
      r.function_result,
      v_volatility,
      v_body
    );
  end loop;
end
$auth_db_018_materialize_functions$;

do $auth_db_018_post_mutation$
declare
  v_expected bigint;
  v_actual bigint;
begin
  select count(*) into v_expected
  from auth_db_018_manifest
  where object_kind = 'VIEW'
    and disposition = 'PUBLISH_API';

  select count(*) into v_actual
  from pg_catalog.pg_class c
  join pg_catalog.pg_namespace n on n.oid = c.relnamespace
  where n.nspname = 'api'
    and c.relkind = 'v';

  if v_actual <> v_expected then
    raise exception 'AUTH_DB_018_API_VIEW_COUNT_MISMATCH expected=% actual=%', v_expected, v_actual;
  end if;

  select count(*) into v_expected
  from auth_db_018_manifest
  where object_kind = 'FUNCTION'
    and disposition = 'PUBLISH_API';

  select count(*) into v_actual
  from pg_catalog.pg_proc p
  join pg_catalog.pg_namespace n on n.oid = p.pronamespace
  where n.nspname = 'api'
    and p.prokind = 'f';

  if v_actual <> v_expected then
    raise exception 'AUTH_DB_018_API_FUNCTION_COUNT_MISMATCH expected=% actual=%', v_expected, v_actual;
  end if;

  if exists (
    select 1
    from pg_catalog.pg_class c
    join pg_catalog.pg_namespace n on n.oid = c.relnamespace
    where n.nspname = 'api'
      and c.relkind in ('r', 'p', 'S')
  ) then
    raise exception 'AUTH_DB_018_API_AUTHORITATIVE_RELATION_FORBIDDEN';
  end if;

  if exists (
    select 1
    from pg_catalog.pg_proc p
    join pg_catalog.pg_namespace n on n.oid = p.pronamespace
    where n.nspname = 'api'
      and p.prorettype in ('trigger'::regtype, 'event_trigger'::regtype)
  ) then
    raise exception 'AUTH_DB_018_API_TRIGGER_FUNCTION_FORBIDDEN';
  end if;

  if exists (
    select 1
    from pg_catalog.pg_proc p
    join pg_catalog.pg_namespace n on n.oid = p.pronamespace
    where n.nspname = 'api'
      and p.prosecdef
  ) then
    raise exception 'AUTH_DB_018_API_SECURITY_DEFINER_FORBIDDEN';
  end if;

  if exists (
    select 1
    from pg_catalog.pg_class c
    join pg_catalog.pg_namespace n on n.oid = c.relnamespace
    where n.nspname = 'api'
      and c.relkind = 'v'
      and not (
        coalesce(c.reloptions, array[]::text[]) @> array['security_invoker=true']::text[]
      )
  ) then
    raise exception 'AUTH_DB_018_API_VIEW_NOT_SECURITY_INVOKER';
  end if;

  if has_schema_privilege('anon', 'api', 'USAGE') then
    raise exception 'AUTH_DB_018_ADVANCED_AUTH_DB_017_ANON_USAGE';
  end if;

  if has_schema_privilege('authenticated', 'api', 'USAGE') then
    raise exception 'AUTH_DB_018_ADVANCED_AUTH_DB_017_AUTHENTICATED_USAGE';
  end if;
end
$auth_db_018_post_mutation$;

commit;
