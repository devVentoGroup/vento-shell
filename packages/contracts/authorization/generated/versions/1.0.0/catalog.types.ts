// GENERATED FILE. DO NOT EDIT.
// Sources:
// - authorization/catalog/versions/1.0.0/applications.json
// - authorization/catalog/versions/1.0.0/permissions.json

export type AppCode = "shell" | "anima" | "viso" | "nexo" | "fogo" | "origo" | "pulso" | "numera" | "aura" | "pass";

export type AppDomain = "laboral" | "cliente";

export type AppKind = "hub" | "hybrid" | "administrative" | "operational" | "customer";

export type RoadmapScope = "core" | "deferred" | "adjacent";

export type ApplicationLifecycleStatus =
  | "active"
  | "deprecated"
  | "retired"
  | "reserved";

export interface ApplicationDefinition {
  readonly app_code: AppCode;
  readonly display_name: string;
  readonly app_kind: AppKind;
  readonly domain: AppDomain;
  readonly roadmap_scope: RoadmapScope;
  readonly lifecycle_status: ApplicationLifecycleStatus;
  readonly repository_owner?: string;
  readonly permission_namespace: AppCode;
  readonly is_authorization_catalog_member: boolean;
}

export type ApplicationByCode = Readonly<Record<AppCode, ApplicationDefinition>>;

export type PermissionKey =
  | "shell.access"
  | "anima.access"
  | "anima.workforce.employee_documents.view"
  | "anima.workforce.employee_documents.upload"
  | "anima.workforce.employee_documents.delete"
  | "anima.workforce.employee_photos.upload"
  | "anima.workforce.team_members.view"
  | "anima.workforce.staff_invitations.create"
  | "anima.attendance.shifts.create"
  | "anima.attendance.shifts.update"
  | "anima.attendance.shifts.cancel"
  | "aura.access"
  | "fogo.access"
  | "fogo.production.batches.view"
  | "fogo.production.batches.create"
  | "fogo.production.orders.view"
  | "fogo.production.recipe_book.view"
  | "fogo.production.recipes.view"
  | "nexo.access"
  | "nexo.catalog.products.view"
  | "nexo.catalog.products.create"
  | "nexo.catalog.presentations.view"
  | "nexo.catalog.request_policies.view"
  | "nexo.catalog.categories.view"
  | "nexo.catalog.units.view"
  | "nexo.assets.items.view"
  | "nexo.assets.items.create"
  | "nexo.assets.groups.view"
  | "nexo.assets.counts.view"
  | "nexo.inventory.adjustments.view"
  | "nexo.inventory.adjustments.register"
  | "nexo.inventory.entries.view"
  | "nexo.inventory.entries.register"
  | "nexo.inventory.entries.override"
  | "nexo.inventory.locations.view"
  | "nexo.inventory.location_assignments.assign"
  | "nexo.inventory.location_catalog.update"
  | "nexo.inventory.lpns.view"
  | "nexo.inventory.movements.view"
  | "nexo.inventory.stock.view"
  | "nexo.inventory.production_batches.view"
  | "nexo.inventory.transfers.view"
  | "nexo.inventory.transfers.create"
  | "nexo.inventory.withdrawals.view"
  | "nexo.inventory.withdrawals.register"
  | "nexo.inventory.zones.view"
  | "nexo.inventory.storage_positions.view"
  | "nexo.inventory.warehouse_operations.view"
  | "nexo.inventory.stock_validations.perform"
  | "nexo.inventory.stock_counts.view"
  | "nexo.inventory.stock_counts.perform"
  | "nexo.inventory.stock_count_variances.approve"
  | "nexo.inventory.stock_count_variances.resolve"
  | "nexo.inventory.initial_counts.view"
  | "nexo.inventory.remissions.view"
  | "nexo.inventory.remissions.update"
  | "nexo.inventory.remissions.request"
  | "nexo.inventory.remissions.prepare"
  | "nexo.inventory.remissions.accept_custody"
  | "nexo.inventory.remissions.start_transit"
  | "nexo.inventory.remissions.deliver"
  | "nexo.inventory.remissions.receive"
  | "nexo.inventory.remissions.cancel"
  | "nexo.logistics.operations_board.view"
  | "nexo.logistics.operations.view"
  | "nexo.logistics.driver_operations.view"
  | "nexo.logistics.fulfillment.view"
  | "nexo.logistics.fulfillment_routes.view"
  | "nexo.logistics.supply_routes.view"
  | "nexo.finance.internal_invoices.view"
  | "nexo.finance.internal_invoices.generate"
  | "nexo.finance.internal_invoices.issue"
  | "nexo.finance.internal_invoices.cancel"
  | "nexo.finance.internal_invoice_amounts.view"
  | "nexo.finance.internal_prices.view"
  | "nexo.finance.internal_variances.view"
  | "nexo.finance.internal_variances.approve"
  | "nexo.finance.internal_variances.resolve"
  | "nexo.finance.cost_centers.view"
  | "nexo.analytics.internal_reports.view"
  | "nexo.analytics.margin_reports.view"
  | "nexo.printing.templates.update"
  | "nexo.printing.jobs.view"
  | "nexo.settings.sites.view"
  | "nexo.settings.remission_policies.view"
  | "numera.access"
  | "numera.finance.cost_centers.view"
  | "numera.finance.expenses.view"
  | "numera.analytics.break_even.view"
  | "numera.analytics.profitability.view"
  | "numera.analytics.financial_reports.view"
  | "origo.access"
  | "origo.procurement.purchase_orders.view"
  | "origo.procurement.receipts.view"
  | "origo.procurement.receipts.register"
  | "origo.procurement.suppliers.view"
  | "origo.catalog.product_reviews.view"
  | "pass.access"
  | "pulso.access"
  | "pulso.delivery.deliveries.override"
  | "pulso.sales.orders.create"
  | "pulso.payments.transactions.collect"
  | "pulso.payments.transactions.reverse"
  | "pulso.cash.sessions.start"
  | "pulso.cash.sessions.close"
  | "pulso.sales.orders.cancel"
  | "pulso.sales.returns.create"
  | "pulso.payments.transactions.refund"
  | "pulso.sales.discounts.apply"
  | "viso.access"
  | "viso.platform.app_updates.view"
  | "viso.organization.businesses.view"
  | "viso.workforce.employees.view"
  | "viso.workforce.staff_calendar.view"
  | "viso.workforce.schedules.view"
  | "viso.workforce.vacancies.view"
  | "viso.authorization.context_simulations.view"
  | "viso.authorization.audit_logs.view"
  | "viso.authorization.base_grants.view"
  | "viso.authorization.base_grants.create"
  | "viso.authorization.base_grants.approve"
  | "viso.authorization.base_grants.suspend"
  | "viso.authorization.base_grants.revoke"
  | "viso.authorization.operational_grants.view"
  | "viso.authorization.operational_grants.create"
  | "viso.authorization.operational_grants.approve"
  | "viso.authorization.operational_grants.suspend"
  | "viso.authorization.operational_grants.revoke"
  | "viso.authorization.denials.view"
  | "viso.authorization.denials.create"
  | "viso.authorization.denials.approve"
  | "viso.authorization.denials.revoke"
  | "viso.catalog.commercial_categories.view"
  | "viso.content.content_blocks.view"
  | "viso.content.menu.view"
  | "viso.content.website_content.view"
  | "viso.finance.accounting.view"
  | "viso.delivery.rates.view"
  | "viso.loyalty.products.view"
  | "viso.loyalty.customers.view";

export type PermissionLifecycleStatus =
  | "active"
  | "deprecated"
  | "retired"
  | "reserved";

export interface PermissionIdentityDefinition {
  readonly permission_key: PermissionKey;
  readonly app_code: AppCode;
  readonly lifecycle_status: PermissionLifecycleStatus;
}

export type PermissionByKey = Readonly<Record<PermissionKey, PermissionIdentityDefinition>>;
