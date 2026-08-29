begin;

-- AUTH-DB-019
-- Non-destructive foundation for enterprise principals and identity links.
-- No Auth row, VITAL object, legacy FK, Data API, RLS, policy, or consumer is mutated.

create temporary table auth_db_019_reference_manifest (
  source_identity text primary key,
  source_schema text not null,
  source_table text not null,
  source_column text not null,
  constraint_name text not null,
  on_delete text not null,
  reference_purpose text not null,
  principal_kind text,
  enterprise_identity_kind text,
  enterprise_identity_id_source text,
  link_origin text,
  initial_link_state text,
  authority_reference text not null,
  conflict_class text,
  consumer_inventory text not null,
  compatibility_requirement text not null,
  target_identity text,
  migration_action text not null,
  rollback_action text not null,
  evidence text not null,
  constraint ck_auth_db_019_manifest_reference_purpose check (
    reference_purpose in (
      'CANONICAL_IDENTITY_LINK',
      'HISTORICAL_OR_AUDIT_ATTRIBUTION',
      'CUSTOMER_TRANSACTIONAL_REFERENCE',
      'DEVICE_REFERENCE',
      'ACTOR_OR_APPROVER_REFERENCE',
      'LEGACY_COMPATIBILITY',
      'ALLOWED_MANAGED_TECHNICAL_REFERENCE',
      'BLOCKED'
    )
  ),
  constraint ck_auth_db_019_manifest_principal_kind check (
    principal_kind is null or principal_kind in ('HUMAN_USER', 'SHARED_DEVICE', 'SERVICE')
  ),
  constraint ck_auth_db_019_manifest_identity_kind check (
    enterprise_identity_kind is null or enterprise_identity_kind in ('EMPLOYEE', 'CUSTOMER', 'DEVICE', 'SYSTEM_ACTOR')
  ),
  constraint ck_auth_db_019_manifest_link_origin check (
    link_origin is null or link_origin in (
      'STAFF_INVITATION',
      'CUSTOMER_SELF_ENROLLMENT',
      'ADMIN_DEVICE_PROVISIONING',
      'VERIFIED_IDENTITY_CLAIM',
      'LEGACY_MIGRATION',
      'MANUAL_RECONCILIATION'
    )
  ),
  constraint ck_auth_db_019_manifest_link_state check (
    initial_link_state is null or initial_link_state in (
      'PENDING_VERIFICATION',
      'ACTIVE',
      'SUSPENDED',
      'REVOKED',
      'SUPERSEDED',
      'CONFLICT'
    )
  ),
  constraint ck_auth_db_019_manifest_conflict_class check (
    conflict_class is null or conflict_class in (
      'AUTH_ACCOUNT_DUPLICATE',
      'ENTERPRISE_IDENTITY_DUPLICATE',
      'IDENTITY_LINK_DUPLICATE',
      'CROSS_CLASS_COLLISION',
      'CONTACT_MATCH_ONLY',
      'ORPHAN_PROFILE',
      'LEGACY_SHARED_UUID',
      'DEVICE_HUMAN_COLLISION'
    )
  )
) on commit drop;

insert into auth_db_019_reference_manifest (
  source_identity,
  source_schema,
  source_table,
  source_column,
  constraint_name,
  on_delete,
  reference_purpose,
  principal_kind,
  enterprise_identity_kind,
  enterprise_identity_id_source,
  link_origin,
  initial_link_state,
  authority_reference,
  conflict_class,
  consumer_inventory,
  compatibility_requirement,
  target_identity,
  migration_action,
  rollback_action,
  evidence
)
values
('club.audit_events.user_id#audit_events_user_id_fkey', 'club', 'audit_events', 'user_id', 'audit_events_user_id_fkey', 'SET NULL', 'HISTORICAL_OR_AUDIT_ATTRIBUTION', null, null, null, null, null, 'AUTH-DB-019', null, 'LEGACY_CONSUMERS_PRESERVED;REQUIRES_TRANSITION_INVENTORY', 'PRESERVE_UNTIL_ZERO_DEPENDENCIES', 'audit.actor_reference', 'PRESERVE_HISTORICAL_REFERENCE', 'NO_OP_REFERENCE_UNCHANGED', 'FK:audit_events_user_id_fkey;ON_DELETE:SET NULL'),
('club.beta_access.user_id#beta_access_user_id_fkey', 'club', 'beta_access', 'user_id', 'beta_access_user_id_fkey', 'CASCADE', 'CUSTOMER_TRANSACTIONAL_REFERENCE', null, null, null, null, null, 'AUTH-DB-019', null, 'LEGACY_CONSUMERS_PRESERVED;REQUIRES_TRANSITION_INVENTORY', 'PRESERVE_UNTIL_ZERO_DEPENDENCIES', 'customer_engagement.customer', 'PRESERVE_REFERENCE_NO_LINK', 'NO_OP_REFERENCE_UNCHANGED', 'FK:beta_access_user_id_fkey;ON_DELETE:CASCADE'),
('club.earn_events.user_id#earn_events_user_id_fkey', 'club', 'earn_events', 'user_id', 'earn_events_user_id_fkey', 'CASCADE', 'CUSTOMER_TRANSACTIONAL_REFERENCE', null, null, null, null, null, 'AUTH-DB-019', null, 'LEGACY_CONSUMERS_PRESERVED;REQUIRES_TRANSITION_INVENTORY', 'PRESERVE_UNTIL_ZERO_DEPENDENCIES', 'customer_engagement.customer', 'PRESERVE_REFERENCE_NO_LINK', 'NO_OP_REFERENCE_UNCHANGED', 'FK:earn_events_user_id_fkey;ON_DELETE:CASCADE'),
('club.entitlements.user_id#entitlements_user_id_fkey', 'club', 'entitlements', 'user_id', 'entitlements_user_id_fkey', 'CASCADE', 'CUSTOMER_TRANSACTIONAL_REFERENCE', null, null, null, null, null, 'AUTH-DB-019', null, 'LEGACY_CONSUMERS_PRESERVED;REQUIRES_TRANSITION_INVENTORY', 'PRESERVE_UNTIL_ZERO_DEPENDENCIES', 'customer_engagement.customer', 'PRESERVE_REFERENCE_NO_LINK', 'NO_OP_REFERENCE_UNCHANGED', 'FK:entitlements_user_id_fkey;ON_DELETE:CASCADE'),
('club.redemption_links.user_id#redemption_links_user_id_fkey', 'club', 'redemption_links', 'user_id', 'redemption_links_user_id_fkey', 'CASCADE', 'CUSTOMER_TRANSACTIONAL_REFERENCE', null, null, null, null, null, 'AUTH-DB-019', null, 'LEGACY_CONSUMERS_PRESERVED;REQUIRES_TRANSITION_INVENTORY', 'PRESERVE_UNTIL_ZERO_DEPENDENCIES', 'customer_engagement.customer', 'PRESERVE_REFERENCE_NO_LINK', 'NO_OP_REFERENCE_UNCHANGED', 'FK:redemption_links_user_id_fkey;ON_DELETE:CASCADE'),
('club.subscriptions.user_id#subscriptions_user_id_fkey', 'club', 'subscriptions', 'user_id', 'subscriptions_user_id_fkey', 'CASCADE', 'CUSTOMER_TRANSACTIONAL_REFERENCE', null, null, null, null, null, 'AUTH-DB-019', null, 'LEGACY_CONSUMERS_PRESERVED;REQUIRES_TRANSITION_INVENTORY', 'PRESERVE_UNTIL_ZERO_DEPENDENCIES', 'customer_engagement.customer', 'PRESERVE_REFERENCE_NO_LINK', 'NO_OP_REFERENCE_UNCHANGED', 'FK:subscriptions_user_id_fkey;ON_DELETE:CASCADE'),
('club.wallet_accounts.user_id#wallet_accounts_user_id_fkey', 'club', 'wallet_accounts', 'user_id', 'wallet_accounts_user_id_fkey', 'CASCADE', 'CUSTOMER_TRANSACTIONAL_REFERENCE', null, null, null, null, null, 'AUTH-DB-019', null, 'LEGACY_CONSUMERS_PRESERVED;REQUIRES_TRANSITION_INVENTORY', 'PRESERVE_UNTIL_ZERO_DEPENDENCIES', 'customer_engagement.customer', 'PRESERVE_REFERENCE_NO_LINK', 'NO_OP_REFERENCE_UNCHANGED', 'FK:wallet_accounts_user_id_fkey;ON_DELETE:CASCADE'),
('club.wallet_ledger.user_id#wallet_ledger_user_id_fkey', 'club', 'wallet_ledger', 'user_id', 'wallet_ledger_user_id_fkey', 'CASCADE', 'CUSTOMER_TRANSACTIONAL_REFERENCE', null, null, null, null, null, 'AUTH-DB-019', null, 'LEGACY_CONSUMERS_PRESERVED;REQUIRES_TRANSITION_INVENTORY', 'PRESERVE_UNTIL_ZERO_DEPENDENCIES', 'customer_engagement.customer', 'PRESERVE_REFERENCE_NO_LINK', 'NO_OP_REFERENCE_UNCHANGED', 'FK:wallet_ledger_user_id_fkey;ON_DELETE:CASCADE'),
('pass.delivery_addresses.user_id#delivery_addresses_user_id_fkey', 'pass', 'delivery_addresses', 'user_id', 'delivery_addresses_user_id_fkey', 'CASCADE', 'CUSTOMER_TRANSACTIONAL_REFERENCE', null, null, null, null, null, 'AUTH-DB-019', null, 'LEGACY_CONSUMERS_PRESERVED;REQUIRES_TRANSITION_INVENTORY', 'PRESERVE_UNTIL_ZERO_DEPENDENCIES', 'customer_engagement.customer', 'PRESERVE_REFERENCE_NO_LINK', 'NO_OP_REFERENCE_UNCHANGED', 'FK:delivery_addresses_user_id_fkey;ON_DELETE:CASCADE'),
('pass.delivery_quotes.user_id#delivery_quotes_user_id_fkey', 'pass', 'delivery_quotes', 'user_id', 'delivery_quotes_user_id_fkey', 'CASCADE', 'CUSTOMER_TRANSACTIONAL_REFERENCE', null, null, null, null, null, 'AUTH-DB-019', null, 'LEGACY_CONSUMERS_PRESERVED;REQUIRES_TRANSITION_INVENTORY', 'PRESERVE_UNTIL_ZERO_DEPENDENCIES', 'customer_engagement.customer', 'PRESERVE_REFERENCE_NO_LINK', 'NO_OP_REFERENCE_UNCHANGED', 'FK:delivery_quotes_user_id_fkey;ON_DELETE:CASCADE'),
('pass.site_schedule_exception_resolutions.decided_by#site_schedule_exception_resolutions_decided_by_fkey', 'pass', 'site_schedule_exception_resolutions', 'decided_by', 'site_schedule_exception_resolutions_decided_by_fkey', 'RESTRICT', 'ACTOR_OR_APPROVER_REFERENCE', null, null, null, null, null, 'AUTH-DB-019', null, 'LEGACY_CONSUMERS_PRESERVED;REQUIRES_TRANSITION_INVENTORY', 'PRESERVE_UNTIL_ZERO_DEPENDENCIES', 'workforce.employee', 'PRESERVE_REFERENCE_NO_LINK', 'NO_OP_REFERENCE_UNCHANGED', 'FK:site_schedule_exception_resolutions_decided_by_fkey;ON_DELETE:RESTRICT'),
('pass.user_favorites.user_id#user_favorites_user_id_fkey', 'pass', 'user_favorites', 'user_id', 'user_favorites_user_id_fkey', 'CASCADE', 'CUSTOMER_TRANSACTIONAL_REFERENCE', null, null, null, null, null, 'AUTH-DB-019', null, 'LEGACY_CONSUMERS_PRESERVED;REQUIRES_TRANSITION_INVENTORY', 'PRESERVE_UNTIL_ZERO_DEPENDENCIES', 'customer_engagement.customer', 'PRESERVE_REFERENCE_NO_LINK', 'NO_OP_REFERENCE_UNCHANGED', 'FK:user_favorites_user_id_fkey;ON_DELETE:CASCADE'),
('payments.transactions.user_id#transactions_user_id_fkey', 'payments', 'transactions', 'user_id', 'transactions_user_id_fkey', 'CASCADE', 'CUSTOMER_TRANSACTIONAL_REFERENCE', null, null, null, null, null, 'AUTH-DB-019', null, 'LEGACY_CONSUMERS_PRESERVED;REQUIRES_TRANSITION_INVENTORY', 'PRESERVE_UNTIL_ZERO_DEPENDENCIES', 'customer_engagement.customer', 'PRESERVE_REFERENCE_NO_LINK', 'NO_OP_REFERENCE_UNCHANGED', 'FK:transactions_user_id_fkey;ON_DELETE:CASCADE'),
('public.account_deletion_requests.user_id#account_deletion_requests_user_id_fkey', 'public', 'account_deletion_requests', 'user_id', 'account_deletion_requests_user_id_fkey', 'SET NULL', 'CUSTOMER_TRANSACTIONAL_REFERENCE', null, null, null, null, null, 'AUTH-DB-019', null, 'LEGACY_CONSUMERS_PRESERVED;REQUIRES_TRANSITION_INVENTORY', 'PRESERVE_UNTIL_ZERO_DEPENDENCIES', 'customer_engagement.customer', 'PRESERVE_REFERENCE_NO_LINK', 'NO_OP_REFERENCE_UNCHANGED', 'FK:account_deletion_requests_user_id_fkey;ON_DELETE:SET NULL'),
('public.announcements.created_by#announcements_created_by_fkey', 'public', 'announcements', 'created_by', 'announcements_created_by_fkey', 'SET NULL', 'ACTOR_OR_APPROVER_REFERENCE', null, null, null, null, null, 'AUTH-DB-019', null, 'LEGACY_CONSUMERS_PRESERVED;REQUIRES_TRANSITION_INVENTORY', 'PRESERVE_UNTIL_ZERO_DEPENDENCIES', 'workforce.employee', 'PRESERVE_REFERENCE_NO_LINK', 'NO_OP_REFERENCE_UNCHANGED', 'FK:announcements_created_by_fkey;ON_DELETE:SET NULL'),
('public.app_runtime_settings.updated_by#app_runtime_settings_updated_by_fkey', 'public', 'app_runtime_settings', 'updated_by', 'app_runtime_settings_updated_by_fkey', 'NO ACTION', 'ACTOR_OR_APPROVER_REFERENCE', null, null, null, null, null, 'AUTH-DB-019', null, 'LEGACY_CONSUMERS_PRESERVED;REQUIRES_TRANSITION_INVENTORY', 'PRESERVE_UNTIL_ZERO_DEPENDENCIES', 'workforce.employee', 'PRESERVE_REFERENCE_NO_LINK', 'NO_OP_REFERENCE_UNCHANGED', 'FK:app_runtime_settings_updated_by_fkey;ON_DELETE:NO ACTION'),
('public.client_billing_profiles.user_id#client_billing_profiles_user_id_fkey', 'public', 'client_billing_profiles', 'user_id', 'client_billing_profiles_user_id_fkey', 'CASCADE', 'CUSTOMER_TRANSACTIONAL_REFERENCE', null, null, null, null, null, 'AUTH-DB-019', null, 'LEGACY_CONSUMERS_PRESERVED;REQUIRES_TRANSITION_INVENTORY', 'PRESERVE_UNTIL_ZERO_DEPENDENCIES', 'customer_engagement.customer', 'PRESERVE_REFERENCE_NO_LINK', 'NO_OP_REFERENCE_UNCHANGED', 'FK:client_billing_profiles_user_id_fkey;ON_DELETE:CASCADE'),
('public.client_push_tokens.user_id#client_push_tokens_user_id_fkey', 'public', 'client_push_tokens', 'user_id', 'client_push_tokens_user_id_fkey', 'CASCADE', 'CUSTOMER_TRANSACTIONAL_REFERENCE', null, null, null, null, null, 'AUTH-DB-019', null, 'LEGACY_CONSUMERS_PRESERVED;REQUIRES_TRANSITION_INVENTORY', 'PRESERVE_UNTIL_ZERO_DEPENDENCIES', 'customer_engagement.customer', 'PRESERVE_REFERENCE_NO_LINK', 'NO_OP_REFERENCE_UNCHANGED', 'FK:client_push_tokens_user_id_fkey;ON_DELETE:CASCADE'),
('public.context_simulation_sessions.user_id#context_simulation_sessions_user_id_fkey', 'public', 'context_simulation_sessions', 'user_id', 'context_simulation_sessions_user_id_fkey', 'CASCADE', 'LEGACY_COMPATIBILITY', null, null, null, null, null, 'AUTH-DB-019', null, 'LEGACY_CONSUMERS_PRESERVED;REQUIRES_TRANSITION_INVENTORY', 'PRESERVE_UNTIL_ZERO_DEPENDENCIES', 'identity_access.principal', 'PRESERVE_LEGACY_COMPATIBILITY', 'NO_OP_REFERENCE_UNCHANGED', 'FK:context_simulation_sessions_user_id_fkey;ON_DELETE:CASCADE'),
('public.employees.id#employees_id_fkey', 'public', 'employees', 'id', 'employees_id_fkey', 'CASCADE', 'CANONICAL_IDENTITY_LINK', 'HUMAN_USER', 'EMPLOYEE', 'public.employees.id', 'LEGACY_MIGRATION', 'PENDING_VERIFICATION', 'AUTH-DB-019', 'LEGACY_SHARED_UUID', 'LEGACY_CONSUMERS_PRESERVED;REQUIRES_TRANSITION_INVENTORY', 'PRESERVE_UNTIL_ZERO_DEPENDENCIES', 'workforce.employee', 'DEFER_LINK_MATERIALIZATION', 'NO_OP_REFERENCE_UNCHANGED', 'FK:employees_id_fkey;ON_DELETE:CASCADE'),
('public.gift_recipient_events.owner_id#gift_recipient_events_owner_id_fkey', 'public', 'gift_recipient_events', 'owner_id', 'gift_recipient_events_owner_id_fkey', 'CASCADE', 'CUSTOMER_TRANSACTIONAL_REFERENCE', null, null, null, null, null, 'AUTH-DB-019', null, 'LEGACY_CONSUMERS_PRESERVED;REQUIRES_TRANSITION_INVENTORY', 'PRESERVE_UNTIL_ZERO_DEPENDENCIES', 'customer_engagement.customer', 'PRESERVE_REFERENCE_NO_LINK', 'NO_OP_REFERENCE_UNCHANGED', 'FK:gift_recipient_events_owner_id_fkey;ON_DELETE:CASCADE'),
('public.gift_recipients.owner_id#gift_recipients_owner_id_fkey', 'public', 'gift_recipients', 'owner_id', 'gift_recipients_owner_id_fkey', 'CASCADE', 'CUSTOMER_TRANSACTIONAL_REFERENCE', null, null, null, null, null, 'AUTH-DB-019', null, 'LEGACY_CONSUMERS_PRESERVED;REQUIRES_TRANSITION_INVENTORY', 'PRESERVE_UNTIL_ZERO_DEPENDENCIES', 'customer_engagement.customer', 'PRESERVE_REFERENCE_NO_LINK', 'NO_OP_REFERENCE_UNCHANGED', 'FK:gift_recipients_owner_id_fkey;ON_DELETE:CASCADE'),
('public.inventory_cost_policies.updated_by#inventory_cost_policies_updated_by_fkey', 'public', 'inventory_cost_policies', 'updated_by', 'inventory_cost_policies_updated_by_fkey', 'SET NULL', 'ACTOR_OR_APPROVER_REFERENCE', null, null, null, null, null, 'AUTH-DB-019', null, 'LEGACY_CONSUMERS_PRESERVED;REQUIRES_TRANSITION_INVENTORY', 'PRESERVE_UNTIL_ZERO_DEPENDENCIES', 'workforce.employee', 'PRESERVE_REFERENCE_NO_LINK', 'NO_OP_REFERENCE_UNCHANGED', 'FK:inventory_cost_policies_updated_by_fkey;ON_DELETE:SET NULL'),
('public.inventory_count_sessions.closed_by#inventory_count_sessions_closed_by_fkey', 'public', 'inventory_count_sessions', 'closed_by', 'inventory_count_sessions_closed_by_fkey', 'SET NULL', 'ACTOR_OR_APPROVER_REFERENCE', null, null, null, null, null, 'AUTH-DB-019', null, 'LEGACY_CONSUMERS_PRESERVED;REQUIRES_TRANSITION_INVENTORY', 'PRESERVE_UNTIL_ZERO_DEPENDENCIES', 'workforce.employee', 'PRESERVE_REFERENCE_NO_LINK', 'NO_OP_REFERENCE_UNCHANGED', 'FK:inventory_count_sessions_closed_by_fkey;ON_DELETE:SET NULL'),
('public.inventory_count_sessions.created_by#inventory_count_sessions_created_by_fkey', 'public', 'inventory_count_sessions', 'created_by', 'inventory_count_sessions_created_by_fkey', 'SET NULL', 'ACTOR_OR_APPROVER_REFERENCE', null, null, null, null, null, 'AUTH-DB-019', null, 'LEGACY_CONSUMERS_PRESERVED;REQUIRES_TRANSITION_INVENTORY', 'PRESERVE_UNTIL_ZERO_DEPENDENCIES', 'workforce.employee', 'PRESERVE_REFERENCE_NO_LINK', 'NO_OP_REFERENCE_UNCHANGED', 'FK:inventory_count_sessions_created_by_fkey;ON_DELETE:SET NULL'),
('public.inventory_form_drafts.user_id#inventory_form_drafts_user_id_fkey', 'public', 'inventory_form_drafts', 'user_id', 'inventory_form_drafts_user_id_fkey', 'CASCADE', 'ACTOR_OR_APPROVER_REFERENCE', null, null, null, null, null, 'AUTH-DB-019', null, 'LEGACY_CONSUMERS_PRESERVED;REQUIRES_TRANSITION_INVENTORY', 'PRESERVE_UNTIL_ZERO_DEPENDENCIES', 'workforce.employee', 'PRESERVE_REFERENCE_NO_LINK', 'NO_OP_REFERENCE_UNCHANGED', 'FK:inventory_form_drafts_user_id_fkey;ON_DELETE:CASCADE'),
('public.inventory_location_product_catalog.created_by#inventory_location_product_catalog_created_by_fkey', 'public', 'inventory_location_product_catalog', 'created_by', 'inventory_location_product_catalog_created_by_fkey', 'NO ACTION', 'ACTOR_OR_APPROVER_REFERENCE', null, null, null, null, null, 'AUTH-DB-019', null, 'LEGACY_CONSUMERS_PRESERVED;REQUIRES_TRANSITION_INVENTORY', 'PRESERVE_UNTIL_ZERO_DEPENDENCIES', 'workforce.employee', 'PRESERVE_REFERENCE_NO_LINK', 'NO_OP_REFERENCE_UNCHANGED', 'FK:inventory_location_product_catalog_created_by_fkey;ON_DELETE:NO ACTION'),
('public.order_billing_requests.client_id#order_billing_requests_client_id_fkey', 'public', 'order_billing_requests', 'client_id', 'order_billing_requests_client_id_fkey', 'RESTRICT', 'CUSTOMER_TRANSACTIONAL_REFERENCE', null, null, null, null, null, 'AUTH-DB-019', null, 'LEGACY_CONSUMERS_PRESERVED;REQUIRES_TRANSITION_INVENTORY', 'PRESERVE_UNTIL_ZERO_DEPENDENCIES', 'customer_engagement.customer', 'PRESERVE_REFERENCE_NO_LINK', 'NO_OP_REFERENCE_UNCHANGED', 'FK:order_billing_requests_client_id_fkey;ON_DELETE:RESTRICT'),
('public.order_conversations.archived_by#order_conversations_archived_by_fkey', 'public', 'order_conversations', 'archived_by', 'order_conversations_archived_by_fkey', 'SET NULL', 'ACTOR_OR_APPROVER_REFERENCE', null, null, null, null, null, 'AUTH-DB-019', null, 'LEGACY_CONSUMERS_PRESERVED;REQUIRES_TRANSITION_INVENTORY', 'PRESERVE_UNTIL_ZERO_DEPENDENCIES', 'workforce.employee', 'PRESERVE_REFERENCE_NO_LINK', 'NO_OP_REFERENCE_UNCHANGED', 'FK:order_conversations_archived_by_fkey;ON_DELETE:SET NULL'),
('public.order_conversations.client_id#order_conversations_client_id_fkey', 'public', 'order_conversations', 'client_id', 'order_conversations_client_id_fkey', 'CASCADE', 'CUSTOMER_TRANSACTIONAL_REFERENCE', null, null, null, null, null, 'AUTH-DB-019', null, 'LEGACY_CONSUMERS_PRESERVED;REQUIRES_TRANSITION_INVENTORY', 'PRESERVE_UNTIL_ZERO_DEPENDENCIES', 'customer_engagement.customer', 'PRESERVE_REFERENCE_NO_LINK', 'NO_OP_REFERENCE_UNCHANGED', 'FK:order_conversations_client_id_fkey;ON_DELETE:CASCADE'),
('public.order_gift_details.card_included_by#order_gift_details_card_included_by_fkey', 'public', 'order_gift_details', 'card_included_by', 'order_gift_details_card_included_by_fkey', 'SET NULL', 'ACTOR_OR_APPROVER_REFERENCE', null, null, null, null, null, 'AUTH-DB-019', null, 'LEGACY_CONSUMERS_PRESERVED;REQUIRES_TRANSITION_INVENTORY', 'PRESERVE_UNTIL_ZERO_DEPENDENCIES', 'workforce.employee', 'PRESERVE_REFERENCE_NO_LINK', 'NO_OP_REFERENCE_UNCHANGED', 'FK:order_gift_details_card_included_by_fkey;ON_DELETE:SET NULL'),
('public.order_gift_details.card_prepared_by#order_gift_details_card_prepared_by_fkey', 'public', 'order_gift_details', 'card_prepared_by', 'order_gift_details_card_prepared_by_fkey', 'SET NULL', 'ACTOR_OR_APPROVER_REFERENCE', null, null, null, null, null, 'AUTH-DB-019', null, 'LEGACY_CONSUMERS_PRESERVED;REQUIRES_TRANSITION_INVENTORY', 'PRESERVE_UNTIL_ZERO_DEPENDENCIES', 'workforce.employee', 'PRESERVE_REFERENCE_NO_LINK', 'NO_OP_REFERENCE_UNCHANGED', 'FK:order_gift_details_card_prepared_by_fkey;ON_DELETE:SET NULL'),
('public.order_gift_details.price_free_packaging_confirmed_by#order_gift_details_price_free_packaging_confirmed_by_fkey', 'public', 'order_gift_details', 'price_free_packaging_confirmed_by', 'order_gift_details_price_free_packaging_confirmed_by_fkey', 'SET NULL', 'ACTOR_OR_APPROVER_REFERENCE', null, null, null, null, null, 'AUTH-DB-019', null, 'LEGACY_CONSUMERS_PRESERVED;REQUIRES_TRANSITION_INVENTORY', 'PRESERVE_UNTIL_ZERO_DEPENDENCIES', 'workforce.employee', 'PRESERVE_REFERENCE_NO_LINK', 'NO_OP_REFERENCE_UNCHANGED', 'FK:order_gift_details_price_free_packaging_confirmed_by_fkey;ON_DELETE:SET NULL'),
('public.order_gift_details.purchaser_id#order_gift_details_purchaser_id_fkey', 'public', 'order_gift_details', 'purchaser_id', 'order_gift_details_purchaser_id_fkey', 'RESTRICT', 'CUSTOMER_TRANSACTIONAL_REFERENCE', null, null, null, null, null, 'AUTH-DB-019', null, 'LEGACY_CONSUMERS_PRESERVED;REQUIRES_TRANSITION_INVENTORY', 'PRESERVE_UNTIL_ZERO_DEPENDENCIES', 'customer_engagement.customer', 'PRESERVE_REFERENCE_NO_LINK', 'NO_OP_REFERENCE_UNCHANGED', 'FK:order_gift_details_purchaser_id_fkey;ON_DELETE:RESTRICT'),
('public.order_messages.author_id#order_messages_author_id_fkey', 'public', 'order_messages', 'author_id', 'order_messages_author_id_fkey', 'CASCADE', 'BLOCKED', null, null, null, null, null, 'AUTH-DB-019', null, 'LEGACY_CONSUMERS_PRESERVED;REQUIRES_TRANSITION_INVENTORY', 'PRESERVE_UNTIL_ZERO_DEPENDENCIES', null, 'BLOCKED_REQUIRES_SEMANTIC_RECONCILIATION', 'NO_OP_REFERENCE_UNCHANGED', 'FK:order_messages_author_id_fkey;ON_DELETE:CASCADE'),
('public.order_status_events.changed_by#order_status_events_changed_by_fkey', 'public', 'order_status_events', 'changed_by', 'order_status_events_changed_by_fkey', 'SET NULL', 'ACTOR_OR_APPROVER_REFERENCE', null, null, null, null, null, 'AUTH-DB-019', null, 'LEGACY_CONSUMERS_PRESERVED;REQUIRES_TRANSITION_INVENTORY', 'PRESERVE_UNTIL_ZERO_DEPENDENCIES', 'workforce.employee', 'PRESERVE_REFERENCE_NO_LINK', 'NO_OP_REFERENCE_UNCHANGED', 'FK:order_status_events_changed_by_fkey;ON_DELETE:SET NULL'),
('public.printing_label_templates.user_id#printing_label_templates_user_id_fkey', 'public', 'printing_label_templates', 'user_id', 'printing_label_templates_user_id_fkey', 'CASCADE', 'ACTOR_OR_APPROVER_REFERENCE', null, null, null, null, null, 'AUTH-DB-019', null, 'LEGACY_CONSUMERS_PRESERVED;REQUIRES_TRANSITION_INVENTORY', 'PRESERVE_UNTIL_ZERO_DEPENDENCIES', 'workforce.employee', 'PRESERVE_REFERENCE_NO_LINK', 'NO_OP_REFERENCE_UNCHANGED', 'FK:printing_label_templates_user_id_fkey;ON_DELETE:CASCADE'),
('public.procurement_receptions.received_by#procurement_receptions_received_by_fkey', 'public', 'procurement_receptions', 'received_by', 'procurement_receptions_received_by_fkey', 'NO ACTION', 'ACTOR_OR_APPROVER_REFERENCE', null, null, null, null, null, 'AUTH-DB-019', null, 'LEGACY_CONSUMERS_PRESERVED;REQUIRES_TRANSITION_INVENTORY', 'PRESERVE_UNTIL_ZERO_DEPENDENCIES', 'workforce.employee', 'PRESERVE_REFERENCE_NO_LINK', 'NO_OP_REFERENCE_UNCHANGED', 'FK:procurement_receptions_received_by_fkey;ON_DELETE:NO ACTION'),
('public.product_configuration_batches.created_by#product_configuration_batches_created_by_fkey', 'public', 'product_configuration_batches', 'created_by', 'product_configuration_batches_created_by_fkey', 'NO ACTION', 'ACTOR_OR_APPROVER_REFERENCE', null, null, null, null, null, 'AUTH-DB-019', null, 'LEGACY_CONSUMERS_PRESERVED;REQUIRES_TRANSITION_INVENTORY', 'PRESERVE_UNTIL_ZERO_DEPENDENCIES', 'workforce.employee', 'PRESERVE_REFERENCE_NO_LINK', 'NO_OP_REFERENCE_UNCHANGED', 'FK:product_configuration_batches_created_by_fkey;ON_DELETE:NO ACTION'),
('public.product_cost_events.created_by#product_cost_events_created_by_fkey', 'public', 'product_cost_events', 'created_by', 'product_cost_events_created_by_fkey', 'SET NULL', 'ACTOR_OR_APPROVER_REFERENCE', null, null, null, null, null, 'AUTH-DB-019', null, 'LEGACY_CONSUMERS_PRESERVED;REQUIRES_TRANSITION_INVENTORY', 'PRESERVE_UNTIL_ZERO_DEPENDENCIES', 'workforce.employee', 'PRESERVE_REFERENCE_NO_LINK', 'NO_OP_REFERENCE_UNCHANGED', 'FK:product_cost_events_created_by_fkey;ON_DELETE:SET NULL'),
('public.product_fulfillment_routes.created_by#product_fulfillment_routes_created_by_fkey', 'public', 'product_fulfillment_routes', 'created_by', 'product_fulfillment_routes_created_by_fkey', 'NO ACTION', 'ACTOR_OR_APPROVER_REFERENCE', null, null, null, null, null, 'AUTH-DB-019', null, 'LEGACY_CONSUMERS_PRESERVED;REQUIRES_TRANSITION_INVENTORY', 'PRESERVE_UNTIL_ZERO_DEPENDENCIES', 'workforce.employee', 'PRESERVE_REFERENCE_NO_LINK', 'NO_OP_REFERENCE_UNCHANGED', 'FK:product_fulfillment_routes_created_by_fkey;ON_DELETE:NO ACTION'),
('public.product_fulfillment_routes.updated_by#product_fulfillment_routes_updated_by_fkey', 'public', 'product_fulfillment_routes', 'updated_by', 'product_fulfillment_routes_updated_by_fkey', 'NO ACTION', 'ACTOR_OR_APPROVER_REFERENCE', null, null, null, null, null, 'AUTH-DB-019', null, 'LEGACY_CONSUMERS_PRESERVED;REQUIRES_TRANSITION_INVENTORY', 'PRESERVE_UNTIL_ZERO_DEPENDENCIES', 'workforce.employee', 'PRESERVE_REFERENCE_NO_LINK', 'NO_OP_REFERENCE_UNCHANGED', 'FK:product_fulfillment_routes_updated_by_fkey;ON_DELETE:NO ACTION'),
('public.product_images.created_by#product_images_created_by_fkey', 'public', 'product_images', 'created_by', 'product_images_created_by_fkey', 'NO ACTION', 'ACTOR_OR_APPROVER_REFERENCE', null, null, null, null, null, 'AUTH-DB-019', null, 'LEGACY_CONSUMERS_PRESERVED;REQUIRES_TRANSITION_INVENTORY', 'PRESERVE_UNTIL_ZERO_DEPENDENCIES', 'workforce.employee', 'PRESERVE_REFERENCE_NO_LINK', 'NO_OP_REFERENCE_UNCHANGED', 'FK:product_images_created_by_fkey;ON_DELETE:NO ACTION'),
('public.product_request_policies.created_by#product_request_policies_created_by_fkey', 'public', 'product_request_policies', 'created_by', 'product_request_policies_created_by_fkey', 'SET NULL', 'ACTOR_OR_APPROVER_REFERENCE', null, null, null, null, null, 'AUTH-DB-019', null, 'LEGACY_CONSUMERS_PRESERVED;REQUIRES_TRANSITION_INVENTORY', 'PRESERVE_UNTIL_ZERO_DEPENDENCIES', 'workforce.employee', 'PRESERVE_REFERENCE_NO_LINK', 'NO_OP_REFERENCE_UNCHANGED', 'FK:product_request_policies_created_by_fkey;ON_DELETE:SET NULL'),
('public.product_site_area_remission_categories.updated_by#product_site_area_remission_categories_updated_by_fkey', 'public', 'product_site_area_remission_categories', 'updated_by', 'product_site_area_remission_categories_updated_by_fkey', 'NO ACTION', 'ACTOR_OR_APPROVER_REFERENCE', null, null, null, null, null, 'AUTH-DB-019', null, 'LEGACY_CONSUMERS_PRESERVED;REQUIRES_TRANSITION_INVENTORY', 'PRESERVE_UNTIL_ZERO_DEPENDENCIES', 'workforce.employee', 'PRESERVE_REFERENCE_NO_LINK', 'NO_OP_REFERENCE_UNCHANGED', 'FK:product_site_area_remission_categories_updated_by_fkey;ON_DELETE:NO ACTION'),
('public.production_batch_consumptions.created_by#production_batch_consumptions_created_by_fkey', 'public', 'production_batch_consumptions', 'created_by', 'production_batch_consumptions_created_by_fkey', 'SET NULL', 'ACTOR_OR_APPROVER_REFERENCE', null, null, null, null, null, 'AUTH-DB-019', null, 'LEGACY_CONSUMERS_PRESERVED;REQUIRES_TRANSITION_INVENTORY', 'PRESERVE_UNTIL_ZERO_DEPENDENCIES', 'workforce.employee', 'PRESERVE_REFERENCE_NO_LINK', 'NO_OP_REFERENCE_UNCHANGED', 'FK:production_batch_consumptions_created_by_fkey;ON_DELETE:SET NULL'),
('public.production_batch_packages.created_by#production_batch_packages_created_by_fkey', 'public', 'production_batch_packages', 'created_by', 'production_batch_packages_created_by_fkey', 'SET NULL', 'ACTOR_OR_APPROVER_REFERENCE', null, null, null, null, null, 'AUTH-DB-019', null, 'LEGACY_CONSUMERS_PRESERVED;REQUIRES_TRANSITION_INVENTORY', 'PRESERVE_UNTIL_ZERO_DEPENDENCIES', 'workforce.employee', 'PRESERVE_REFERENCE_NO_LINK', 'NO_OP_REFERENCE_UNCHANGED', 'FK:production_batch_packages_created_by_fkey;ON_DELETE:SET NULL'),
('public.pulso_daily_sales_import_batches.imported_by#pulso_daily_sales_import_batches_imported_by_fkey', 'public', 'pulso_daily_sales_import_batches', 'imported_by', 'pulso_daily_sales_import_batches_imported_by_fkey', 'SET NULL', 'ACTOR_OR_APPROVER_REFERENCE', null, null, null, null, null, 'AUTH-DB-019', null, 'LEGACY_CONSUMERS_PRESERVED;REQUIRES_TRANSITION_INVENTORY', 'PRESERVE_UNTIL_ZERO_DEPENDENCIES', 'workforce.employee', 'PRESERVE_REFERENCE_NO_LINK', 'NO_OP_REFERENCE_UNCHANGED', 'FK:pulso_daily_sales_import_batches_imported_by_fkey;ON_DELETE:SET NULL'),
('public.pulso_external_sales_item_mappings.created_by#pulso_external_sales_item_mappings_created_by_fkey', 'public', 'pulso_external_sales_item_mappings', 'created_by', 'pulso_external_sales_item_mappings_created_by_fkey', 'SET NULL', 'ACTOR_OR_APPROVER_REFERENCE', null, null, null, null, null, 'AUTH-DB-019', null, 'LEGACY_CONSUMERS_PRESERVED;REQUIRES_TRANSITION_INVENTORY', 'PRESERVE_UNTIL_ZERO_DEPENDENCIES', 'workforce.employee', 'PRESERVE_REFERENCE_NO_LINK', 'NO_OP_REFERENCE_UNCHANGED', 'FK:pulso_external_sales_item_mappings_created_by_fkey;ON_DELETE:SET NULL'),
('public.pulso_external_sales_item_mappings.updated_by#pulso_external_sales_item_mappings_updated_by_fkey', 'public', 'pulso_external_sales_item_mappings', 'updated_by', 'pulso_external_sales_item_mappings_updated_by_fkey', 'SET NULL', 'ACTOR_OR_APPROVER_REFERENCE', null, null, null, null, null, 'AUTH-DB-019', null, 'LEGACY_CONSUMERS_PRESERVED;REQUIRES_TRANSITION_INVENTORY', 'PRESERVE_UNTIL_ZERO_DEPENDENCIES', 'workforce.employee', 'PRESERVE_REFERENCE_NO_LINK', 'NO_OP_REFERENCE_UNCHANGED', 'FK:pulso_external_sales_item_mappings_updated_by_fkey;ON_DELETE:SET NULL'),
('public.pulso_sales_consumption_rules.created_by#pulso_sales_consumption_rules_created_by_fkey', 'public', 'pulso_sales_consumption_rules', 'created_by', 'pulso_sales_consumption_rules_created_by_fkey', 'SET NULL', 'ACTOR_OR_APPROVER_REFERENCE', null, null, null, null, null, 'AUTH-DB-019', null, 'LEGACY_CONSUMERS_PRESERVED;REQUIRES_TRANSITION_INVENTORY', 'PRESERVE_UNTIL_ZERO_DEPENDENCIES', 'workforce.employee', 'PRESERVE_REFERENCE_NO_LINK', 'NO_OP_REFERENCE_UNCHANGED', 'FK:pulso_sales_consumption_rules_created_by_fkey;ON_DELETE:SET NULL'),
('public.pulso_sales_consumption_rules.updated_by#pulso_sales_consumption_rules_updated_by_fkey', 'public', 'pulso_sales_consumption_rules', 'updated_by', 'pulso_sales_consumption_rules_updated_by_fkey', 'SET NULL', 'ACTOR_OR_APPROVER_REFERENCE', null, null, null, null, null, 'AUTH-DB-019', null, 'LEGACY_CONSUMERS_PRESERVED;REQUIRES_TRANSITION_INVENTORY', 'PRESERVE_UNTIL_ZERO_DEPENDENCIES', 'workforce.employee', 'PRESERVE_REFERENCE_NO_LINK', 'NO_OP_REFERENCE_UNCHANGED', 'FK:pulso_sales_consumption_rules_updated_by_fkey;ON_DELETE:SET NULL'),
('public.purchase_orders.approved_by#purchase_orders_approved_by_fkey', 'public', 'purchase_orders', 'approved_by', 'purchase_orders_approved_by_fkey', 'NO ACTION', 'ACTOR_OR_APPROVER_REFERENCE', null, null, null, null, null, 'AUTH-DB-019', null, 'LEGACY_CONSUMERS_PRESERVED;REQUIRES_TRANSITION_INVENTORY', 'PRESERVE_UNTIL_ZERO_DEPENDENCIES', 'workforce.employee', 'PRESERVE_REFERENCE_NO_LINK', 'NO_OP_REFERENCE_UNCHANGED', 'FK:purchase_orders_approved_by_fkey;ON_DELETE:NO ACTION'),
('public.recipe_site_uses.created_by#recipe_site_uses_created_by_fkey', 'public', 'recipe_site_uses', 'created_by', 'recipe_site_uses_created_by_fkey', 'SET NULL', 'ACTOR_OR_APPROVER_REFERENCE', null, null, null, null, null, 'AUTH-DB-019', null, 'LEGACY_CONSUMERS_PRESERVED;REQUIRES_TRANSITION_INVENTORY', 'PRESERVE_UNTIL_ZERO_DEPENDENCIES', 'workforce.employee', 'PRESERVE_REFERENCE_NO_LINK', 'NO_OP_REFERENCE_UNCHANGED', 'FK:recipe_site_uses_created_by_fkey;ON_DELETE:SET NULL'),
('public.recipe_site_uses.updated_by#recipe_site_uses_updated_by_fkey', 'public', 'recipe_site_uses', 'updated_by', 'recipe_site_uses_updated_by_fkey', 'SET NULL', 'ACTOR_OR_APPROVER_REFERENCE', null, null, null, null, null, 'AUTH-DB-019', null, 'LEGACY_CONSUMERS_PRESERVED;REQUIRES_TRANSITION_INVENTORY', 'PRESERVE_UNTIL_ZERO_DEPENDENCIES', 'workforce.employee', 'PRESERVE_REFERENCE_NO_LINK', 'NO_OP_REFERENCE_UNCHANGED', 'FK:recipe_site_uses_updated_by_fkey;ON_DELETE:SET NULL'),
('public.remission_dispatch_runs.created_by#remission_dispatch_runs_created_by_fkey', 'public', 'remission_dispatch_runs', 'created_by', 'remission_dispatch_runs_created_by_fkey', 'NO ACTION', 'ACTOR_OR_APPROVER_REFERENCE', null, null, null, null, null, 'AUTH-DB-019', null, 'LEGACY_CONSUMERS_PRESERVED;REQUIRES_TRANSITION_INVENTORY', 'PRESERVE_UNTIL_ZERO_DEPENDENCIES', 'workforce.employee', 'PRESERVE_REFERENCE_NO_LINK', 'NO_OP_REFERENCE_UNCHANGED', 'FK:remission_dispatch_runs_created_by_fkey;ON_DELETE:NO ACTION'),
('public.remission_dispatch_runs.updated_by#remission_dispatch_runs_updated_by_fkey', 'public', 'remission_dispatch_runs', 'updated_by', 'remission_dispatch_runs_updated_by_fkey', 'NO ACTION', 'ACTOR_OR_APPROVER_REFERENCE', null, null, null, null, null, 'AUTH-DB-019', null, 'LEGACY_CONSUMERS_PRESERVED;REQUIRES_TRANSITION_INVENTORY', 'PRESERVE_UNTIL_ZERO_DEPENDENCIES', 'workforce.employee', 'PRESERVE_REFERENCE_NO_LINK', 'NO_OP_REFERENCE_UNCHANGED', 'FK:remission_dispatch_runs_updated_by_fkey;ON_DELETE:NO ACTION'),
('public.remission_exceptions.created_by#remission_exceptions_created_by_fkey', 'public', 'remission_exceptions', 'created_by', 'remission_exceptions_created_by_fkey', 'NO ACTION', 'ACTOR_OR_APPROVER_REFERENCE', null, null, null, null, null, 'AUTH-DB-019', null, 'LEGACY_CONSUMERS_PRESERVED;REQUIRES_TRANSITION_INVENTORY', 'PRESERVE_UNTIL_ZERO_DEPENDENCIES', 'workforce.employee', 'PRESERVE_REFERENCE_NO_LINK', 'NO_OP_REFERENCE_UNCHANGED', 'FK:remission_exceptions_created_by_fkey;ON_DELETE:NO ACTION'),
('public.remission_exceptions.updated_by#remission_exceptions_updated_by_fkey', 'public', 'remission_exceptions', 'updated_by', 'remission_exceptions_updated_by_fkey', 'NO ACTION', 'ACTOR_OR_APPROVER_REFERENCE', null, null, null, null, null, 'AUTH-DB-019', null, 'LEGACY_CONSUMERS_PRESERVED;REQUIRES_TRANSITION_INVENTORY', 'PRESERVE_UNTIL_ZERO_DEPENDENCIES', 'workforce.employee', 'PRESERVE_REFERENCE_NO_LINK', 'NO_OP_REFERENCE_UNCHANGED', 'FK:remission_exceptions_updated_by_fkey;ON_DELETE:NO ACTION'),
('public.remission_product_categories.updated_by#remission_product_categories_updated_by_fkey', 'public', 'remission_product_categories', 'updated_by', 'remission_product_categories_updated_by_fkey', 'NO ACTION', 'ACTOR_OR_APPROVER_REFERENCE', null, null, null, null, null, 'AUTH-DB-019', null, 'LEGACY_CONSUMERS_PRESERVED;REQUIRES_TRANSITION_INVENTORY', 'PRESERVE_UNTIL_ZERO_DEPENDENCIES', 'workforce.employee', 'PRESERVE_REFERENCE_NO_LINK', 'NO_OP_REFERENCE_UNCHANGED', 'FK:remission_product_categories_updated_by_fkey;ON_DELETE:NO ACTION'),
('public.remission_receipt_items.created_by#remission_receipt_items_created_by_fkey', 'public', 'remission_receipt_items', 'created_by', 'remission_receipt_items_created_by_fkey', 'NO ACTION', 'ACTOR_OR_APPROVER_REFERENCE', null, null, null, null, null, 'AUTH-DB-019', null, 'LEGACY_CONSUMERS_PRESERVED;REQUIRES_TRANSITION_INVENTORY', 'PRESERVE_UNTIL_ZERO_DEPENDENCIES', 'workforce.employee', 'PRESERVE_REFERENCE_NO_LINK', 'NO_OP_REFERENCE_UNCHANGED', 'FK:remission_receipt_items_created_by_fkey;ON_DELETE:NO ACTION'),
('public.remission_receipts.created_by#remission_receipts_created_by_fkey', 'public', 'remission_receipts', 'created_by', 'remission_receipts_created_by_fkey', 'NO ACTION', 'ACTOR_OR_APPROVER_REFERENCE', null, null, null, null, null, 'AUTH-DB-019', null, 'LEGACY_CONSUMERS_PRESERVED;REQUIRES_TRANSITION_INVENTORY', 'PRESERVE_UNTIL_ZERO_DEPENDENCIES', 'workforce.employee', 'PRESERVE_REFERENCE_NO_LINK', 'NO_OP_REFERENCE_UNCHANGED', 'FK:remission_receipts_created_by_fkey;ON_DELETE:NO ACTION'),
('public.remission_receipts.updated_by#remission_receipts_updated_by_fkey', 'public', 'remission_receipts', 'updated_by', 'remission_receipts_updated_by_fkey', 'NO ACTION', 'ACTOR_OR_APPROVER_REFERENCE', null, null, null, null, null, 'AUTH-DB-019', null, 'LEGACY_CONSUMERS_PRESERVED;REQUIRES_TRANSITION_INVENTORY', 'PRESERVE_UNTIL_ZERO_DEPENDENCIES', 'workforce.employee', 'PRESERVE_REFERENCE_NO_LINK', 'NO_OP_REFERENCE_UNCHANGED', 'FK:remission_receipts_updated_by_fkey;ON_DELETE:NO ACTION'),
('public.remission_shipment_items.created_by#remission_shipment_items_created_by_fkey', 'public', 'remission_shipment_items', 'created_by', 'remission_shipment_items_created_by_fkey', 'NO ACTION', 'ACTOR_OR_APPROVER_REFERENCE', null, null, null, null, null, 'AUTH-DB-019', null, 'LEGACY_CONSUMERS_PRESERVED;REQUIRES_TRANSITION_INVENTORY', 'PRESERVE_UNTIL_ZERO_DEPENDENCIES', 'workforce.employee', 'PRESERVE_REFERENCE_NO_LINK', 'NO_OP_REFERENCE_UNCHANGED', 'FK:remission_shipment_items_created_by_fkey;ON_DELETE:NO ACTION'),
('public.remission_shipments.created_by#remission_shipments_created_by_fkey', 'public', 'remission_shipments', 'created_by', 'remission_shipments_created_by_fkey', 'NO ACTION', 'ACTOR_OR_APPROVER_REFERENCE', null, null, null, null, null, 'AUTH-DB-019', null, 'LEGACY_CONSUMERS_PRESERVED;REQUIRES_TRANSITION_INVENTORY', 'PRESERVE_UNTIL_ZERO_DEPENDENCIES', 'workforce.employee', 'PRESERVE_REFERENCE_NO_LINK', 'NO_OP_REFERENCE_UNCHANGED', 'FK:remission_shipments_created_by_fkey;ON_DELETE:NO ACTION'),
('public.remission_shipments.updated_by#remission_shipments_updated_by_fkey', 'public', 'remission_shipments', 'updated_by', 'remission_shipments_updated_by_fkey', 'NO ACTION', 'ACTOR_OR_APPROVER_REFERENCE', null, null, null, null, null, 'AUTH-DB-019', null, 'LEGACY_CONSUMERS_PRESERVED;REQUIRES_TRANSITION_INVENTORY', 'PRESERVE_UNTIL_ZERO_DEPENDENCIES', 'workforce.employee', 'PRESERVE_REFERENCE_NO_LINK', 'NO_OP_REFERENCE_UNCHANGED', 'FK:remission_shipments_updated_by_fkey;ON_DELETE:NO ACTION'),
('public.restock_item_fulfillments.created_by#restock_item_fulfillments_created_by_fkey', 'public', 'restock_item_fulfillments', 'created_by', 'restock_item_fulfillments_created_by_fkey', 'NO ACTION', 'ACTOR_OR_APPROVER_REFERENCE', null, null, null, null, null, 'AUTH-DB-019', null, 'LEGACY_CONSUMERS_PRESERVED;REQUIRES_TRANSITION_INVENTORY', 'PRESERVE_UNTIL_ZERO_DEPENDENCIES', 'workforce.employee', 'PRESERVE_REFERENCE_NO_LINK', 'NO_OP_REFERENCE_UNCHANGED', 'FK:restock_item_fulfillments_created_by_fkey;ON_DELETE:NO ACTION'),
('public.restock_item_fulfillments.updated_by#restock_item_fulfillments_updated_by_fkey', 'public', 'restock_item_fulfillments', 'updated_by', 'restock_item_fulfillments_updated_by_fkey', 'NO ACTION', 'ACTOR_OR_APPROVER_REFERENCE', null, null, null, null, null, 'AUTH-DB-019', null, 'LEGACY_CONSUMERS_PRESERVED;REQUIRES_TRANSITION_INVENTORY', 'PRESERVE_UNTIL_ZERO_DEPENDENCIES', 'workforce.employee', 'PRESERVE_REFERENCE_NO_LINK', 'NO_OP_REFERENCE_UNCHANGED', 'FK:restock_item_fulfillments_updated_by_fkey;ON_DELETE:NO ACTION'),
('public.shared_device_actor_signatures.auth_user_id#shared_device_actor_signatures_auth_user_id_fkey', 'public', 'shared_device_actor_signatures', 'auth_user_id', 'shared_device_actor_signatures_auth_user_id_fkey', 'CASCADE', 'ACTOR_OR_APPROVER_REFERENCE', null, null, null, null, null, 'AUTH-DB-019', null, 'LEGACY_CONSUMERS_PRESERVED;REQUIRES_TRANSITION_INVENTORY', 'PRESERVE_UNTIL_ZERO_DEPENDENCIES', 'workforce.employee', 'PRESERVE_REFERENCE_NO_LINK', 'NO_OP_REFERENCE_UNCHANGED', 'FK:shared_device_actor_signatures_auth_user_id_fkey;ON_DELETE:CASCADE'),
('public.shared_operational_device_events.session_user_id#shared_operational_device_events_session_user_id_fkey', 'public', 'shared_operational_device_events', 'session_user_id', 'shared_operational_device_events_session_user_id_fkey', 'SET NULL', 'HISTORICAL_OR_AUDIT_ATTRIBUTION', null, null, null, null, null, 'AUTH-DB-019', null, 'LEGACY_CONSUMERS_PRESERVED;REQUIRES_TRANSITION_INVENTORY', 'PRESERVE_UNTIL_ZERO_DEPENDENCIES', 'audit.actor_reference', 'PRESERVE_HISTORICAL_REFERENCE', 'NO_OP_REFERENCE_UNCHANGED', 'FK:shared_operational_device_events_session_user_id_fkey;ON_DELETE:SET NULL'),
('public.shared_operational_devices.auth_user_id#shared_operational_devices_auth_user_id_fkey', 'public', 'shared_operational_devices', 'auth_user_id', 'shared_operational_devices_auth_user_id_fkey', 'SET NULL', 'DEVICE_REFERENCE', 'SHARED_DEVICE', 'DEVICE', 'public.shared_operational_devices.id', 'LEGACY_MIGRATION', 'PENDING_VERIFICATION', 'AUTH-DB-019', null, 'LEGACY_CONSUMERS_PRESERVED;REQUIRES_TRANSITION_INVENTORY', 'PRESERVE_UNTIL_ZERO_DEPENDENCIES', 'technology_operations.device', 'DEFER_LINK_MATERIALIZATION', 'NO_OP_REFERENCE_UNCHANGED', 'FK:shared_operational_devices_auth_user_id_fkey;ON_DELETE:SET NULL'),
('public.site_operational_capabilities.updated_by#site_operational_capabilities_updated_by_fkey', 'public', 'site_operational_capabilities', 'updated_by', 'site_operational_capabilities_updated_by_fkey', 'NO ACTION', 'ACTOR_OR_APPROVER_REFERENCE', null, null, null, null, null, 'AUTH-DB-019', null, 'LEGACY_CONSUMERS_PRESERVED;REQUIRES_TRANSITION_INVENTORY', 'PRESERVE_UNTIL_ZERO_DEPENDENCIES', 'workforce.employee', 'PRESERVE_REFERENCE_NO_LINK', 'NO_OP_REFERENCE_UNCHANGED', 'FK:site_operational_capabilities_updated_by_fkey;ON_DELETE:NO ACTION'),
('public.site_purpose_settings.updated_by#site_purpose_settings_updated_by_fkey', 'public', 'site_purpose_settings', 'updated_by', 'site_purpose_settings_updated_by_fkey', 'NO ACTION', 'ACTOR_OR_APPROVER_REFERENCE', null, null, null, null, null, 'AUTH-DB-019', null, 'LEGACY_CONSUMERS_PRESERVED;REQUIRES_TRANSITION_INVENTORY', 'PRESERVE_UNTIL_ZERO_DEPENDENCIES', 'workforce.employee', 'PRESERVE_REFERENCE_NO_LINK', 'NO_OP_REFERENCE_UNCHANGED', 'FK:site_purpose_settings_updated_by_fkey;ON_DELETE:NO ACTION')
;

create temporary table auth_db_019_actual_auth_fks on commit drop as
select
  format('%s.%s.%s#%s', sn.nspname, sc.relname, sa.attname, con.conname) as source_identity,
  sn.nspname::text as source_schema,
  sc.relname::text as source_table,
  sa.attname::text as source_column,
  con.conname::text as constraint_name,
  case con.confdeltype
    when 'a' then 'NO ACTION'
    when 'r' then 'RESTRICT'
    when 'c' then 'CASCADE'
    when 'n' then 'SET NULL'
    when 'd' then 'SET DEFAULT'
    else 'UNKNOWN'
  end::text as on_delete
from pg_catalog.pg_constraint con
join pg_catalog.pg_class sc
  on sc.oid = con.conrelid
join pg_catalog.pg_namespace sn
  on sn.oid = sc.relnamespace
join pg_catalog.pg_attribute sa
  on sa.attrelid = sc.oid
 and sa.attnum = con.conkey[1]
join pg_catalog.pg_class tc
  on tc.oid = con.confrelid
join pg_catalog.pg_namespace tn
  on tn.oid = tc.relnamespace
join pg_catalog.pg_attribute ta
  on ta.attrelid = tc.oid
 and ta.attnum = con.confkey[1]
where con.contype = 'f'
  and pg_catalog.cardinality(con.conkey) = 1
  and pg_catalog.cardinality(con.confkey) = 1
  and sn.nspname in ('app_private', 'club', 'pass', 'payments', 'pos', 'public', 'talento', 'viso')
  and tn.nspname = 'auth'
  and tc.relname = 'users'
  and ta.attname = 'id';

do $auth_db_019_preconditions$
declare
  v_count bigint;
begin
  if to_regnamespace('identity_access') is null then
    raise exception 'AUTH_DB_019_IDENTITY_ACCESS_SCHEMA_MISSING';
  end if;

  if to_regnamespace('vital') is null then
    raise exception 'AUTH_DB_019_VITAL_BOUNDARY_MISSING';
  end if;

  if not exists (
    select 1
    from pg_catalog.pg_roles
    where rolname = 'vento_ddl_owner'
      and not rolcanlogin
      and not rolinherit
      and not rolsuper
      and not rolcreatedb
      and not rolcreaterole
      and not rolreplication
      and not rolbypassrls
  ) then
    raise exception 'AUTH_DB_019_DDL_OWNER_POSTURE_INVALID';
  end if;

  select count(*) into v_count from auth_db_019_reference_manifest;
  if v_count <> 73 then
    raise exception 'AUTH_DB_019_REFERENCE_MANIFEST_COUNT_INVALID:%', v_count;
  end if;

  select count(*) into v_count from auth_db_019_actual_auth_fks;
  if v_count <> 73 then
    raise exception 'AUTH_DB_019_ACTUAL_AUTH_FK_COUNT_DRIFT:%', v_count;
  end if;

  if exists (
    select source_identity, source_schema, source_table, source_column, constraint_name, on_delete
    from auth_db_019_reference_manifest
    except
    select source_identity, source_schema, source_table, source_column, constraint_name, on_delete
    from auth_db_019_actual_auth_fks
  ) or exists (
    select source_identity, source_schema, source_table, source_column, constraint_name, on_delete
    from auth_db_019_actual_auth_fks
    except
    select source_identity, source_schema, source_table, source_column, constraint_name, on_delete
    from auth_db_019_reference_manifest
  ) then
    raise exception 'AUTH_DB_019_REFERENCE_MANIFEST_SET_MISMATCH';
  end if;

  if exists (
    select 1
    from auth_db_019_reference_manifest
    where source_schema = 'vital'
  ) then
    raise exception 'AUTH_DB_019_VITAL_REFERENCE_MANIFEST_VIOLATION';
  end if;

  if not exists (
    select 1
    from auth_db_019_actual_auth_fks
    where source_schema = 'public'
      and source_table = 'employees'
      and source_column = 'id'
      and constraint_name = 'employees_id_fkey'
      and on_delete = 'CASCADE'
  ) then
    raise exception 'AUTH_DB_019_EMPLOYEE_LEGACY_CASCADE_DRIFT';
  end if;

  if to_regclass('identity_access.principals') is not null
     or to_regclass('identity_access.identity_resolution_cases') is not null
     or to_regclass('identity_access.enterprise_identity_links') is not null then
    raise exception 'AUTH_DB_019_TARGET_OBJECT_ALREADY_EXISTS';
  end if;
end
$auth_db_019_preconditions$;

grant usage, create on schema identity_access to vento_ddl_owner;

set local role vento_ddl_owner;

create table identity_access.principals (
  id uuid not null default gen_random_uuid(),
  auth_subject_id uuid,
  principal_kind text not null,
  source_version text not null,
  audit_reference text,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now(),
  constraint pk_principals primary key (id),
  constraint uq_principals_id_kind unique (id, principal_kind),
  constraint ck_principals_kind check (
    principal_kind in ('HUMAN_USER', 'SHARED_DEVICE', 'SERVICE')
  ),
  constraint ck_principals_timestamps check (
    updated_at >= created_at
  )
);

create unique index ux_principals_auth_subject
  on identity_access.principals (auth_subject_id)
  where auth_subject_id is not null;

create table identity_access.identity_resolution_cases (
  id uuid not null default gen_random_uuid(),
  conflict_class text not null,
  candidate_references jsonb not null default '[]'::jsonb,
  source_references jsonb not null default '[]'::jsonb,
  evidence_references jsonb not null default '[]'::jsonb,
  risk_reference text not null,
  decision_required text not null,
  authority_reference text not null,
  resolution_result text,
  resolved_at timestamptz,
  source_version text not null,
  audit_reference text,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now(),
  constraint pk_identity_resolution_cases primary key (id),
  constraint ck_identity_resolution_cases_conflict_class check (
    conflict_class in (
      'AUTH_ACCOUNT_DUPLICATE',
      'ENTERPRISE_IDENTITY_DUPLICATE',
      'IDENTITY_LINK_DUPLICATE',
      'CROSS_CLASS_COLLISION',
      'CONTACT_MATCH_ONLY',
      'ORPHAN_PROFILE',
      'LEGACY_SHARED_UUID',
      'DEVICE_HUMAN_COLLISION'
    )
  ),
  constraint ck_identity_resolution_cases_result check (
    resolution_result is null or resolution_result in (
      'LINK_EXISTING_IDENTITY',
      'CREATE_NEW_ENTERPRISE_IDENTITY',
      'KEEP_UNLINKED',
      'SPLIT_PRINCIPAL',
      'SUPERSEDE_LINK',
      'REJECT_AND_ESCALATE'
    )
  ),
  constraint ck_identity_resolution_cases_resolution_pair check (
    (resolution_result is null and resolved_at is null)
    or (resolution_result is not null and resolved_at is not null)
  ),
  constraint ck_identity_resolution_cases_json_shapes check (
    jsonb_typeof(candidate_references) = 'array'
    and jsonb_typeof(source_references) = 'array'
    and jsonb_typeof(evidence_references) = 'array'
  ),
  constraint ck_identity_resolution_cases_timestamps check (
    updated_at >= created_at
    and (resolved_at is null or resolved_at >= created_at)
  )
);

create table identity_access.enterprise_identity_links (
  id uuid not null default gen_random_uuid(),
  principal_id uuid not null,
  auth_subject_id uuid,
  principal_kind text not null,
  enterprise_identity_kind text not null,
  enterprise_identity_id uuid not null,
  link_state text not null,
  link_origin text not null,
  assurance_level text,
  authority_reference text not null,
  reason_code text not null,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now(),
  verified_at timestamptz,
  activated_at timestamptz,
  suspended_at timestamptz,
  revoked_at timestamptz,
  superseded_at timestamptz,
  supersedes_link_id uuid,
  resolution_case_id uuid,
  source_version text not null,
  audit_reference text,
  constraint pk_enterprise_identity_links primary key (id),
  constraint fk_enterprise_identity_links_principal_kind
    foreign key (principal_id, principal_kind)
    references identity_access.principals (id, principal_kind)
    on update restrict
    on delete restrict,
  constraint fk_enterprise_identity_links_supersedes
    foreign key (supersedes_link_id)
    references identity_access.enterprise_identity_links (id)
    on update restrict
    on delete restrict,
  constraint fk_enterprise_identity_links_resolution_case
    foreign key (resolution_case_id)
    references identity_access.identity_resolution_cases (id)
    on update restrict
    on delete restrict,
  constraint ck_enterprise_identity_links_principal_kind check (
    principal_kind in ('HUMAN_USER', 'SHARED_DEVICE', 'SERVICE')
  ),
  constraint ck_enterprise_identity_links_identity_kind check (
    enterprise_identity_kind in ('EMPLOYEE', 'CUSTOMER', 'DEVICE', 'SYSTEM_ACTOR')
  ),
  constraint ck_enterprise_identity_links_compatibility check (
    (principal_kind = 'HUMAN_USER' and enterprise_identity_kind in ('EMPLOYEE', 'CUSTOMER'))
    or (principal_kind = 'SHARED_DEVICE' and enterprise_identity_kind = 'DEVICE')
    or (principal_kind = 'SERVICE' and enterprise_identity_kind = 'SYSTEM_ACTOR')
  ),
  constraint ck_enterprise_identity_links_state check (
    link_state in (
      'PENDING_VERIFICATION',
      'ACTIVE',
      'SUSPENDED',
      'REVOKED',
      'SUPERSEDED',
      'CONFLICT'
    )
  ),
  constraint ck_enterprise_identity_links_origin check (
    link_origin in (
      'STAFF_INVITATION',
      'CUSTOMER_SELF_ENROLLMENT',
      'ADMIN_DEVICE_PROVISIONING',
      'VERIFIED_IDENTITY_CLAIM',
      'LEGACY_MIGRATION',
      'MANUAL_RECONCILIATION'
    )
  ),
  constraint ck_enterprise_identity_links_origin_compatibility check (
    (link_origin = 'STAFF_INVITATION'
      and principal_kind = 'HUMAN_USER'
      and enterprise_identity_kind = 'EMPLOYEE')
    or (link_origin = 'CUSTOMER_SELF_ENROLLMENT'
      and principal_kind = 'HUMAN_USER'
      and enterprise_identity_kind = 'CUSTOMER')
    or (link_origin = 'ADMIN_DEVICE_PROVISIONING'
      and principal_kind = 'SHARED_DEVICE'
      and enterprise_identity_kind = 'DEVICE')
    or (link_origin = 'VERIFIED_IDENTITY_CLAIM'
      and principal_kind = 'HUMAN_USER'
      and enterprise_identity_kind in ('EMPLOYEE', 'CUSTOMER'))
    or link_origin in ('LEGACY_MIGRATION', 'MANUAL_RECONCILIATION')
  ),
  constraint ck_enterprise_identity_links_legacy_evidence check (
    link_origin <> 'LEGACY_MIGRATION' or audit_reference is not null
  ),
  constraint ck_enterprise_identity_links_active_milestones check (
    link_state <> 'ACTIVE'
    or (verified_at is not null and activated_at is not null and activated_at >= verified_at)
  ),
  constraint ck_enterprise_identity_links_suspended_milestone check (
    link_state <> 'SUSPENDED' or suspended_at is not null
  ),
  constraint ck_enterprise_identity_links_revoked_milestone check (
    link_state <> 'REVOKED' or revoked_at is not null
  ),
  constraint ck_enterprise_identity_links_superseded_milestone check (
    link_state <> 'SUPERSEDED' or superseded_at is not null
  ),
  constraint ck_enterprise_identity_links_conflict_case check (
    link_state <> 'CONFLICT' or resolution_case_id is not null
  ),
  constraint ck_enterprise_identity_links_no_self_supersession check (
    supersedes_link_id is null or supersedes_link_id <> id
  ),
  constraint ck_enterprise_identity_links_timestamps check (
    updated_at >= created_at
    and (verified_at is null or verified_at >= created_at)
    and (activated_at is null or activated_at >= created_at)
    and (suspended_at is null or suspended_at >= created_at)
    and (revoked_at is null or revoked_at >= created_at)
    and (superseded_at is null or superseded_at >= created_at)
  )
);

create unique index ux_enterprise_identity_links_active_principal_kind
  on identity_access.enterprise_identity_links (principal_id, enterprise_identity_kind)
  where link_state = 'ACTIVE';

create unique index ux_enterprise_identity_links_active_auth_subject_kind
  on identity_access.enterprise_identity_links (auth_subject_id, enterprise_identity_kind)
  where link_state = 'ACTIVE' and auth_subject_id is not null;

create unique index ux_enterprise_identity_links_active_enterprise_identity
  on identity_access.enterprise_identity_links (enterprise_identity_kind, enterprise_identity_id)
  where link_state = 'ACTIVE';

create index ix_enterprise_identity_links_principal_history
  on identity_access.enterprise_identity_links (principal_id, created_at desc);

create index ix_enterprise_identity_links_resolution_case
  on identity_access.enterprise_identity_links (resolution_case_id)
  where resolution_case_id is not null;

comment on table identity_access.principals is
  'AUTH-DB-019 stable enterprise principals. auth_subject_id is a replaceable technical reference, not an enterprise identity.';
comment on table identity_access.identity_resolution_cases is
  'AUTH-DB-019 controlled reconciliation cases for ambiguous, duplicate, orphan, legacy-shared-UUID, and device-human identity conditions.';
comment on table identity_access.enterprise_identity_links is
  'AUTH-DB-019 explicit lifecycle-preserving links between principals, Auth subjects, and domain identities. No contact or UUID equality implies activation.';
comment on column identity_access.principals.auth_subject_id is
  'Current technical Auth subject reference when applicable. Deliberately not a foreign key so account replacement/deletion cannot cascade into the enterprise principal.';
comment on column identity_access.enterprise_identity_links.auth_subject_id is
  'Technical Auth subject reference captured by the link lifecycle; deliberately independent from enterprise_identity_id.';
comment on column identity_access.enterprise_identity_links.enterprise_identity_id is
  'Stable domain identity reference. No foreign key is added until workforce/customer_engagement/technology_operations identity sources are physically materialized.';

revoke all privileges on table
  identity_access.principals,
  identity_access.identity_resolution_cases,
  identity_access.enterprise_identity_links
from public, anon, authenticated, service_role;

reset role;

revoke create on schema identity_access from vento_ddl_owner;

do $auth_db_019_postconditions$
declare
  v_count bigint;
begin
  select count(*) into v_count
  from pg_catalog.pg_class c
  join pg_catalog.pg_namespace n on n.oid = c.relnamespace
  where n.nspname = 'identity_access'
    and c.relname in ('principals', 'identity_resolution_cases', 'enterprise_identity_links')
    and c.relkind = 'r'
    and pg_catalog.pg_get_userbyid(c.relowner) = 'vento_ddl_owner';
  if v_count <> 3 then
    raise exception 'AUTH_DB_019_TARGET_TABLE_OWNER_MISMATCH:%', v_count;
  end if;

  if has_schema_privilege('vento_ddl_owner', 'identity_access', 'CREATE') then
    raise exception 'AUTH_DB_019_DDL_OWNER_CREATE_NOT_REVOKED';
  end if;

  if exists (
    select 1
    from pg_catalog.pg_class c
    join pg_catalog.pg_namespace n on n.oid = c.relnamespace
    cross join lateral pg_catalog.aclexplode(coalesce(c.relacl, pg_catalog.acldefault('r', c.relowner))) a
    where n.nspname = 'identity_access'
      and c.relname in ('principals', 'identity_resolution_cases', 'enterprise_identity_links')
      and (
        a.grantee = 0::oid
        or a.grantee = 'anon'::regrole::oid
        or a.grantee = 'authenticated'::regrole::oid
        or a.grantee = 'service_role'::regrole::oid
      )
  ) then
    raise exception 'AUTH_DB_019_CLIENT_TABLE_PRIVILEGE_VIOLATION';
  end if;

  if exists (
    select 1
    from pg_catalog.pg_constraint con
    join pg_catalog.pg_class sc on sc.oid = con.conrelid
    join pg_catalog.pg_namespace sn on sn.oid = sc.relnamespace
    join pg_catalog.pg_class tc on tc.oid = con.confrelid
    join pg_catalog.pg_namespace tn on tn.oid = tc.relnamespace
    where con.contype = 'f'
      and sn.nspname = 'identity_access'
      and sc.relname in ('principals', 'identity_resolution_cases', 'enterprise_identity_links')
      and tn.nspname = 'auth'
  ) then
    raise exception 'AUTH_DB_019_TARGET_AUTH_FK_FORBIDDEN';
  end if;

  if (select count(*) from identity_access.principals) <> 0
     or (select count(*) from identity_access.identity_resolution_cases) <> 0
     or (select count(*) from identity_access.enterprise_identity_links) <> 0 then
    raise exception 'AUTH_DB_019_BACKFILL_FORBIDDEN';
  end if;

  if (select count(*) from auth_db_019_actual_auth_fks) <> 73 then
    raise exception 'AUTH_DB_019_LEGACY_AUTH_FK_COUNT_CHANGED';
  end if;

  if not exists (
    select 1
    from auth_db_019_actual_auth_fks
    where source_schema = 'public'
      and source_table = 'employees'
      and source_column = 'id'
      and constraint_name = 'employees_id_fkey'
      and on_delete = 'CASCADE'
  ) then
    raise exception 'AUTH_DB_019_EMPLOYEE_LEGACY_CASCADE_CHANGED';
  end if;
end
$auth_db_019_postconditions$;

commit;
