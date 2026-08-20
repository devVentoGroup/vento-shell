// GENERATED FILE. DO NOT EDIT.
// Sources:
// - authorization/catalog/versions/1.0.0/applications.json
// - authorization/catalog/versions/1.0.0/permissions.json

import type {
  AppCode,
  ApplicationByCode,
  ApplicationDefinition,
  PermissionByKey,
  PermissionIdentityDefinition,
  PermissionKey,
} from "./catalog.types.js";

export const APPLICATION_CODES = [
  "shell",
  "anima",
  "viso",
  "nexo",
  "fogo",
  "origo",
  "pulso",
  "numera",
  "aura",
  "pass",
] as const satisfies readonly AppCode[];

export const APPLICATIONS = [
  {
    app_code: "shell",
    display_name: "Vento OS",
    app_kind: "hub",
    domain: "laboral",
    roadmap_scope: "core",
    lifecycle_status: "active",
    repository_owner: "devVentoGroup/vento-shell",
    permission_namespace: "shell",
    is_authorization_catalog_member: true
  },
  {
    app_code: "anima",
    display_name: "ANIMA",
    app_kind: "hybrid",
    domain: "laboral",
    roadmap_scope: "core",
    lifecycle_status: "active",
    repository_owner: "devVentoGroup/vento-anima",
    permission_namespace: "anima",
    is_authorization_catalog_member: true
  },
  {
    app_code: "viso",
    display_name: "VISO",
    app_kind: "administrative",
    domain: "laboral",
    roadmap_scope: "core",
    lifecycle_status: "active",
    repository_owner: "devVentoGroup/vento-viso",
    permission_namespace: "viso",
    is_authorization_catalog_member: true
  },
  {
    app_code: "nexo",
    display_name: "NEXO",
    app_kind: "hybrid",
    domain: "laboral",
    roadmap_scope: "core",
    lifecycle_status: "active",
    repository_owner: "devVentoGroup/vento-nexo",
    permission_namespace: "nexo",
    is_authorization_catalog_member: true
  },
  {
    app_code: "fogo",
    display_name: "FOGO",
    app_kind: "operational",
    domain: "laboral",
    roadmap_scope: "core",
    lifecycle_status: "active",
    repository_owner: "devVentoGroup/vento-fogo",
    permission_namespace: "fogo",
    is_authorization_catalog_member: true
  },
  {
    app_code: "origo",
    display_name: "ORIGO",
    app_kind: "hybrid",
    domain: "laboral",
    roadmap_scope: "core",
    lifecycle_status: "active",
    repository_owner: "devVentoGroup/vento-origo",
    permission_namespace: "origo",
    is_authorization_catalog_member: true
  },
  {
    app_code: "pulso",
    display_name: "PULSO",
    app_kind: "operational",
    domain: "laboral",
    roadmap_scope: "core",
    lifecycle_status: "active",
    repository_owner: "devVentoGroup/vento-pulso",
    permission_namespace: "pulso",
    is_authorization_catalog_member: true
  },
  {
    app_code: "numera",
    display_name: "NUMERA",
    app_kind: "hybrid",
    domain: "laboral",
    roadmap_scope: "core",
    lifecycle_status: "active",
    repository_owner: "devVentoGroup/vento-numera",
    permission_namespace: "numera",
    is_authorization_catalog_member: true
  },
  {
    app_code: "aura",
    display_name: "AURA",
    app_kind: "administrative",
    domain: "laboral",
    roadmap_scope: "deferred",
    lifecycle_status: "active",
    permission_namespace: "aura",
    is_authorization_catalog_member: true
  },
  {
    app_code: "pass",
    display_name: "Vento Pass",
    app_kind: "customer",
    domain: "cliente",
    roadmap_scope: "adjacent",
    lifecycle_status: "active",
    repository_owner: "devVentoGroup/vento-pass",
    permission_namespace: "pass",
    is_authorization_catalog_member: true
  }
] as const satisfies readonly ApplicationDefinition[];

export const APPLICATION_BY_CODE = {
  shell: APPLICATIONS[0],
  anima: APPLICATIONS[1],
  viso: APPLICATIONS[2],
  nexo: APPLICATIONS[3],
  fogo: APPLICATIONS[4],
  origo: APPLICATIONS[5],
  pulso: APPLICATIONS[6],
  numera: APPLICATIONS[7],
  aura: APPLICATIONS[8],
  pass: APPLICATIONS[9],
} as const satisfies ApplicationByCode;

export const PERMISSION_KEYS = [
  "shell.access",
  "anima.access",
  "anima.workforce.employee_documents.view",
  "anima.workforce.employee_documents.upload",
  "anima.workforce.employee_documents.delete",
  "anima.workforce.employee_photos.upload",
  "anima.workforce.team_members.view",
  "anima.workforce.staff_invitations.create",
  "anima.attendance.shifts.create",
  "anima.attendance.shifts.update",
  "anima.attendance.shifts.cancel",
  "aura.access",
  "fogo.access",
  "fogo.production.batches.view",
  "fogo.production.batches.create",
  "fogo.production.orders.view",
  "fogo.production.recipe_book.view",
  "fogo.production.recipes.view",
  "nexo.access",
  "nexo.catalog.products.view",
  "nexo.catalog.products.create",
  "nexo.catalog.presentations.view",
  "nexo.catalog.request_policies.view",
  "nexo.catalog.categories.view",
  "nexo.catalog.units.view",
  "nexo.assets.items.view",
  "nexo.assets.items.create",
  "nexo.assets.groups.view",
  "nexo.assets.counts.view",
  "nexo.inventory.adjustments.view",
  "nexo.inventory.adjustments.register",
  "nexo.inventory.entries.view",
  "nexo.inventory.entries.register",
  "nexo.inventory.entries.override",
  "nexo.inventory.locations.view",
  "nexo.inventory.location_assignments.assign",
  "nexo.inventory.location_catalog.update",
  "nexo.inventory.lpns.view",
  "nexo.inventory.movements.view",
  "nexo.inventory.stock.view",
  "nexo.inventory.production_batches.view",
  "nexo.inventory.transfers.view",
  "nexo.inventory.transfers.create",
  "nexo.inventory.withdrawals.view",
  "nexo.inventory.withdrawals.register",
  "nexo.inventory.zones.view",
  "nexo.inventory.storage_positions.view",
  "nexo.inventory.warehouse_operations.view",
  "nexo.inventory.stock_validations.perform",
  "nexo.inventory.stock_counts.view",
  "nexo.inventory.stock_counts.perform",
  "nexo.inventory.stock_count_variances.approve",
  "nexo.inventory.stock_count_variances.resolve",
  "nexo.inventory.initial_counts.view",
  "nexo.inventory.remissions.view",
  "nexo.inventory.remissions.update",
  "nexo.inventory.remissions.request",
  "nexo.inventory.remissions.prepare",
  "nexo.inventory.remissions.accept_custody",
  "nexo.inventory.remissions.start_transit",
  "nexo.inventory.remissions.deliver",
  "nexo.inventory.remissions.receive",
  "nexo.inventory.remissions.cancel",
  "nexo.logistics.operations_board.view",
  "nexo.logistics.operations.view",
  "nexo.logistics.driver_operations.view",
  "nexo.logistics.fulfillment.view",
  "nexo.logistics.fulfillment_routes.view",
  "nexo.logistics.supply_routes.view",
  "nexo.finance.internal_invoices.view",
  "nexo.finance.internal_invoices.generate",
  "nexo.finance.internal_invoices.issue",
  "nexo.finance.internal_invoices.cancel",
  "nexo.finance.internal_invoice_amounts.view",
  "nexo.finance.internal_prices.view",
  "nexo.finance.internal_variances.view",
  "nexo.finance.internal_variances.approve",
  "nexo.finance.internal_variances.resolve",
  "nexo.finance.cost_centers.view",
  "nexo.analytics.internal_reports.view",
  "nexo.analytics.margin_reports.view",
  "nexo.printing.templates.update",
  "nexo.printing.jobs.view",
  "nexo.settings.sites.view",
  "nexo.settings.remission_policies.view",
  "numera.access",
  "numera.finance.cost_centers.view",
  "numera.finance.expenses.view",
  "numera.analytics.break_even.view",
  "numera.analytics.profitability.view",
  "numera.analytics.financial_reports.view",
  "origo.access",
  "origo.procurement.purchase_orders.view",
  "origo.procurement.receipts.view",
  "origo.procurement.receipts.register",
  "origo.procurement.suppliers.view",
  "origo.catalog.product_reviews.view",
  "pass.access",
  "pulso.access",
  "pulso.delivery.deliveries.override",
  "pulso.sales.orders.create",
  "pulso.payments.transactions.collect",
  "pulso.payments.transactions.reverse",
  "pulso.cash.sessions.start",
  "pulso.cash.sessions.close",
  "pulso.sales.orders.cancel",
  "pulso.sales.returns.create",
  "pulso.payments.transactions.refund",
  "pulso.sales.discounts.apply",
  "viso.access",
  "viso.platform.app_updates.view",
  "viso.organization.businesses.view",
  "viso.workforce.employees.view",
  "viso.workforce.staff_calendar.view",
  "viso.workforce.schedules.view",
  "viso.workforce.vacancies.view",
  "viso.authorization.context_simulations.view",
  "viso.authorization.audit_logs.view",
  "viso.authorization.base_grants.view",
  "viso.authorization.base_grants.create",
  "viso.authorization.base_grants.approve",
  "viso.authorization.base_grants.suspend",
  "viso.authorization.base_grants.revoke",
  "viso.authorization.operational_grants.view",
  "viso.authorization.operational_grants.create",
  "viso.authorization.operational_grants.approve",
  "viso.authorization.operational_grants.suspend",
  "viso.authorization.operational_grants.revoke",
  "viso.authorization.denials.view",
  "viso.authorization.denials.create",
  "viso.authorization.denials.approve",
  "viso.authorization.denials.revoke",
  "viso.catalog.commercial_categories.view",
  "viso.content.content_blocks.view",
  "viso.content.menu.view",
  "viso.content.website_content.view",
  "viso.finance.accounting.view",
  "viso.delivery.rates.view",
  "viso.loyalty.products.view",
  "viso.loyalty.customers.view",
] as const satisfies readonly PermissionKey[];

export const PERMISSION_IDENTITIES = [
  {
    permission_key: "shell.access",
    app_code: "shell",
    lifecycle_status: "active"
  },
  {
    permission_key: "anima.access",
    app_code: "anima",
    lifecycle_status: "active"
  },
  {
    permission_key: "anima.workforce.employee_documents.view",
    app_code: "anima",
    lifecycle_status: "active"
  },
  {
    permission_key: "anima.workforce.employee_documents.upload",
    app_code: "anima",
    lifecycle_status: "active"
  },
  {
    permission_key: "anima.workforce.employee_documents.delete",
    app_code: "anima",
    lifecycle_status: "active"
  },
  {
    permission_key: "anima.workforce.employee_photos.upload",
    app_code: "anima",
    lifecycle_status: "active"
  },
  {
    permission_key: "anima.workforce.team_members.view",
    app_code: "anima",
    lifecycle_status: "active"
  },
  {
    permission_key: "anima.workforce.staff_invitations.create",
    app_code: "anima",
    lifecycle_status: "active"
  },
  {
    permission_key: "anima.attendance.shifts.create",
    app_code: "anima",
    lifecycle_status: "active"
  },
  {
    permission_key: "anima.attendance.shifts.update",
    app_code: "anima",
    lifecycle_status: "active"
  },
  {
    permission_key: "anima.attendance.shifts.cancel",
    app_code: "anima",
    lifecycle_status: "active"
  },
  {
    permission_key: "aura.access",
    app_code: "aura",
    lifecycle_status: "active"
  },
  {
    permission_key: "fogo.access",
    app_code: "fogo",
    lifecycle_status: "active"
  },
  {
    permission_key: "fogo.production.batches.view",
    app_code: "fogo",
    lifecycle_status: "active"
  },
  {
    permission_key: "fogo.production.batches.create",
    app_code: "fogo",
    lifecycle_status: "active"
  },
  {
    permission_key: "fogo.production.orders.view",
    app_code: "fogo",
    lifecycle_status: "active"
  },
  {
    permission_key: "fogo.production.recipe_book.view",
    app_code: "fogo",
    lifecycle_status: "active"
  },
  {
    permission_key: "fogo.production.recipes.view",
    app_code: "fogo",
    lifecycle_status: "active"
  },
  {
    permission_key: "nexo.access",
    app_code: "nexo",
    lifecycle_status: "active"
  },
  {
    permission_key: "nexo.catalog.products.view",
    app_code: "nexo",
    lifecycle_status: "active"
  },
  {
    permission_key: "nexo.catalog.products.create",
    app_code: "nexo",
    lifecycle_status: "active"
  },
  {
    permission_key: "nexo.catalog.presentations.view",
    app_code: "nexo",
    lifecycle_status: "active"
  },
  {
    permission_key: "nexo.catalog.request_policies.view",
    app_code: "nexo",
    lifecycle_status: "active"
  },
  {
    permission_key: "nexo.catalog.categories.view",
    app_code: "nexo",
    lifecycle_status: "active"
  },
  {
    permission_key: "nexo.catalog.units.view",
    app_code: "nexo",
    lifecycle_status: "active"
  },
  {
    permission_key: "nexo.assets.items.view",
    app_code: "nexo",
    lifecycle_status: "active"
  },
  {
    permission_key: "nexo.assets.items.create",
    app_code: "nexo",
    lifecycle_status: "active"
  },
  {
    permission_key: "nexo.assets.groups.view",
    app_code: "nexo",
    lifecycle_status: "active"
  },
  {
    permission_key: "nexo.assets.counts.view",
    app_code: "nexo",
    lifecycle_status: "active"
  },
  {
    permission_key: "nexo.inventory.adjustments.view",
    app_code: "nexo",
    lifecycle_status: "active"
  },
  {
    permission_key: "nexo.inventory.adjustments.register",
    app_code: "nexo",
    lifecycle_status: "active"
  },
  {
    permission_key: "nexo.inventory.entries.view",
    app_code: "nexo",
    lifecycle_status: "active"
  },
  {
    permission_key: "nexo.inventory.entries.register",
    app_code: "nexo",
    lifecycle_status: "active"
  },
  {
    permission_key: "nexo.inventory.entries.override",
    app_code: "nexo",
    lifecycle_status: "active"
  },
  {
    permission_key: "nexo.inventory.locations.view",
    app_code: "nexo",
    lifecycle_status: "active"
  },
  {
    permission_key: "nexo.inventory.location_assignments.assign",
    app_code: "nexo",
    lifecycle_status: "active"
  },
  {
    permission_key: "nexo.inventory.location_catalog.update",
    app_code: "nexo",
    lifecycle_status: "active"
  },
  {
    permission_key: "nexo.inventory.lpns.view",
    app_code: "nexo",
    lifecycle_status: "active"
  },
  {
    permission_key: "nexo.inventory.movements.view",
    app_code: "nexo",
    lifecycle_status: "active"
  },
  {
    permission_key: "nexo.inventory.stock.view",
    app_code: "nexo",
    lifecycle_status: "active"
  },
  {
    permission_key: "nexo.inventory.production_batches.view",
    app_code: "nexo",
    lifecycle_status: "active"
  },
  {
    permission_key: "nexo.inventory.transfers.view",
    app_code: "nexo",
    lifecycle_status: "active"
  },
  {
    permission_key: "nexo.inventory.transfers.create",
    app_code: "nexo",
    lifecycle_status: "active"
  },
  {
    permission_key: "nexo.inventory.withdrawals.view",
    app_code: "nexo",
    lifecycle_status: "active"
  },
  {
    permission_key: "nexo.inventory.withdrawals.register",
    app_code: "nexo",
    lifecycle_status: "active"
  },
  {
    permission_key: "nexo.inventory.zones.view",
    app_code: "nexo",
    lifecycle_status: "active"
  },
  {
    permission_key: "nexo.inventory.storage_positions.view",
    app_code: "nexo",
    lifecycle_status: "active"
  },
  {
    permission_key: "nexo.inventory.warehouse_operations.view",
    app_code: "nexo",
    lifecycle_status: "active"
  },
  {
    permission_key: "nexo.inventory.stock_validations.perform",
    app_code: "nexo",
    lifecycle_status: "active"
  },
  {
    permission_key: "nexo.inventory.stock_counts.view",
    app_code: "nexo",
    lifecycle_status: "active"
  },
  {
    permission_key: "nexo.inventory.stock_counts.perform",
    app_code: "nexo",
    lifecycle_status: "active"
  },
  {
    permission_key: "nexo.inventory.stock_count_variances.approve",
    app_code: "nexo",
    lifecycle_status: "active"
  },
  {
    permission_key: "nexo.inventory.stock_count_variances.resolve",
    app_code: "nexo",
    lifecycle_status: "active"
  },
  {
    permission_key: "nexo.inventory.initial_counts.view",
    app_code: "nexo",
    lifecycle_status: "active"
  },
  {
    permission_key: "nexo.inventory.remissions.view",
    app_code: "nexo",
    lifecycle_status: "active"
  },
  {
    permission_key: "nexo.inventory.remissions.update",
    app_code: "nexo",
    lifecycle_status: "active"
  },
  {
    permission_key: "nexo.inventory.remissions.request",
    app_code: "nexo",
    lifecycle_status: "active"
  },
  {
    permission_key: "nexo.inventory.remissions.prepare",
    app_code: "nexo",
    lifecycle_status: "active"
  },
  {
    permission_key: "nexo.inventory.remissions.accept_custody",
    app_code: "nexo",
    lifecycle_status: "active"
  },
  {
    permission_key: "nexo.inventory.remissions.start_transit",
    app_code: "nexo",
    lifecycle_status: "active"
  },
  {
    permission_key: "nexo.inventory.remissions.deliver",
    app_code: "nexo",
    lifecycle_status: "active"
  },
  {
    permission_key: "nexo.inventory.remissions.receive",
    app_code: "nexo",
    lifecycle_status: "active"
  },
  {
    permission_key: "nexo.inventory.remissions.cancel",
    app_code: "nexo",
    lifecycle_status: "active"
  },
  {
    permission_key: "nexo.logistics.operations_board.view",
    app_code: "nexo",
    lifecycle_status: "active"
  },
  {
    permission_key: "nexo.logistics.operations.view",
    app_code: "nexo",
    lifecycle_status: "active"
  },
  {
    permission_key: "nexo.logistics.driver_operations.view",
    app_code: "nexo",
    lifecycle_status: "active"
  },
  {
    permission_key: "nexo.logistics.fulfillment.view",
    app_code: "nexo",
    lifecycle_status: "active"
  },
  {
    permission_key: "nexo.logistics.fulfillment_routes.view",
    app_code: "nexo",
    lifecycle_status: "active"
  },
  {
    permission_key: "nexo.logistics.supply_routes.view",
    app_code: "nexo",
    lifecycle_status: "active"
  },
  {
    permission_key: "nexo.finance.internal_invoices.view",
    app_code: "nexo",
    lifecycle_status: "active"
  },
  {
    permission_key: "nexo.finance.internal_invoices.generate",
    app_code: "nexo",
    lifecycle_status: "active"
  },
  {
    permission_key: "nexo.finance.internal_invoices.issue",
    app_code: "nexo",
    lifecycle_status: "active"
  },
  {
    permission_key: "nexo.finance.internal_invoices.cancel",
    app_code: "nexo",
    lifecycle_status: "active"
  },
  {
    permission_key: "nexo.finance.internal_invoice_amounts.view",
    app_code: "nexo",
    lifecycle_status: "active"
  },
  {
    permission_key: "nexo.finance.internal_prices.view",
    app_code: "nexo",
    lifecycle_status: "active"
  },
  {
    permission_key: "nexo.finance.internal_variances.view",
    app_code: "nexo",
    lifecycle_status: "active"
  },
  {
    permission_key: "nexo.finance.internal_variances.approve",
    app_code: "nexo",
    lifecycle_status: "active"
  },
  {
    permission_key: "nexo.finance.internal_variances.resolve",
    app_code: "nexo",
    lifecycle_status: "active"
  },
  {
    permission_key: "nexo.finance.cost_centers.view",
    app_code: "nexo",
    lifecycle_status: "active"
  },
  {
    permission_key: "nexo.analytics.internal_reports.view",
    app_code: "nexo",
    lifecycle_status: "active"
  },
  {
    permission_key: "nexo.analytics.margin_reports.view",
    app_code: "nexo",
    lifecycle_status: "active"
  },
  {
    permission_key: "nexo.printing.templates.update",
    app_code: "nexo",
    lifecycle_status: "active"
  },
  {
    permission_key: "nexo.printing.jobs.view",
    app_code: "nexo",
    lifecycle_status: "active"
  },
  {
    permission_key: "nexo.settings.sites.view",
    app_code: "nexo",
    lifecycle_status: "active"
  },
  {
    permission_key: "nexo.settings.remission_policies.view",
    app_code: "nexo",
    lifecycle_status: "active"
  },
  {
    permission_key: "numera.access",
    app_code: "numera",
    lifecycle_status: "active"
  },
  {
    permission_key: "numera.finance.cost_centers.view",
    app_code: "numera",
    lifecycle_status: "active"
  },
  {
    permission_key: "numera.finance.expenses.view",
    app_code: "numera",
    lifecycle_status: "active"
  },
  {
    permission_key: "numera.analytics.break_even.view",
    app_code: "numera",
    lifecycle_status: "active"
  },
  {
    permission_key: "numera.analytics.profitability.view",
    app_code: "numera",
    lifecycle_status: "active"
  },
  {
    permission_key: "numera.analytics.financial_reports.view",
    app_code: "numera",
    lifecycle_status: "active"
  },
  {
    permission_key: "origo.access",
    app_code: "origo",
    lifecycle_status: "active"
  },
  {
    permission_key: "origo.procurement.purchase_orders.view",
    app_code: "origo",
    lifecycle_status: "active"
  },
  {
    permission_key: "origo.procurement.receipts.view",
    app_code: "origo",
    lifecycle_status: "active"
  },
  {
    permission_key: "origo.procurement.receipts.register",
    app_code: "origo",
    lifecycle_status: "active"
  },
  {
    permission_key: "origo.procurement.suppliers.view",
    app_code: "origo",
    lifecycle_status: "active"
  },
  {
    permission_key: "origo.catalog.product_reviews.view",
    app_code: "origo",
    lifecycle_status: "active"
  },
  {
    permission_key: "pass.access",
    app_code: "pass",
    lifecycle_status: "active"
  },
  {
    permission_key: "pulso.access",
    app_code: "pulso",
    lifecycle_status: "active"
  },
  {
    permission_key: "pulso.delivery.deliveries.override",
    app_code: "pulso",
    lifecycle_status: "active"
  },
  {
    permission_key: "pulso.sales.orders.create",
    app_code: "pulso",
    lifecycle_status: "active"
  },
  {
    permission_key: "pulso.payments.transactions.collect",
    app_code: "pulso",
    lifecycle_status: "active"
  },
  {
    permission_key: "pulso.payments.transactions.reverse",
    app_code: "pulso",
    lifecycle_status: "active"
  },
  {
    permission_key: "pulso.cash.sessions.start",
    app_code: "pulso",
    lifecycle_status: "active"
  },
  {
    permission_key: "pulso.cash.sessions.close",
    app_code: "pulso",
    lifecycle_status: "active"
  },
  {
    permission_key: "pulso.sales.orders.cancel",
    app_code: "pulso",
    lifecycle_status: "active"
  },
  {
    permission_key: "pulso.sales.returns.create",
    app_code: "pulso",
    lifecycle_status: "active"
  },
  {
    permission_key: "pulso.payments.transactions.refund",
    app_code: "pulso",
    lifecycle_status: "active"
  },
  {
    permission_key: "pulso.sales.discounts.apply",
    app_code: "pulso",
    lifecycle_status: "active"
  },
  {
    permission_key: "viso.access",
    app_code: "viso",
    lifecycle_status: "active"
  },
  {
    permission_key: "viso.platform.app_updates.view",
    app_code: "viso",
    lifecycle_status: "active"
  },
  {
    permission_key: "viso.organization.businesses.view",
    app_code: "viso",
    lifecycle_status: "active"
  },
  {
    permission_key: "viso.workforce.employees.view",
    app_code: "viso",
    lifecycle_status: "active"
  },
  {
    permission_key: "viso.workforce.staff_calendar.view",
    app_code: "viso",
    lifecycle_status: "active"
  },
  {
    permission_key: "viso.workforce.schedules.view",
    app_code: "viso",
    lifecycle_status: "active"
  },
  {
    permission_key: "viso.workforce.vacancies.view",
    app_code: "viso",
    lifecycle_status: "active"
  },
  {
    permission_key: "viso.authorization.context_simulations.view",
    app_code: "viso",
    lifecycle_status: "active"
  },
  {
    permission_key: "viso.authorization.audit_logs.view",
    app_code: "viso",
    lifecycle_status: "active"
  },
  {
    permission_key: "viso.authorization.base_grants.view",
    app_code: "viso",
    lifecycle_status: "active"
  },
  {
    permission_key: "viso.authorization.base_grants.create",
    app_code: "viso",
    lifecycle_status: "active"
  },
  {
    permission_key: "viso.authorization.base_grants.approve",
    app_code: "viso",
    lifecycle_status: "active"
  },
  {
    permission_key: "viso.authorization.base_grants.suspend",
    app_code: "viso",
    lifecycle_status: "active"
  },
  {
    permission_key: "viso.authorization.base_grants.revoke",
    app_code: "viso",
    lifecycle_status: "active"
  },
  {
    permission_key: "viso.authorization.operational_grants.view",
    app_code: "viso",
    lifecycle_status: "active"
  },
  {
    permission_key: "viso.authorization.operational_grants.create",
    app_code: "viso",
    lifecycle_status: "active"
  },
  {
    permission_key: "viso.authorization.operational_grants.approve",
    app_code: "viso",
    lifecycle_status: "active"
  },
  {
    permission_key: "viso.authorization.operational_grants.suspend",
    app_code: "viso",
    lifecycle_status: "active"
  },
  {
    permission_key: "viso.authorization.operational_grants.revoke",
    app_code: "viso",
    lifecycle_status: "active"
  },
  {
    permission_key: "viso.authorization.denials.view",
    app_code: "viso",
    lifecycle_status: "active"
  },
  {
    permission_key: "viso.authorization.denials.create",
    app_code: "viso",
    lifecycle_status: "active"
  },
  {
    permission_key: "viso.authorization.denials.approve",
    app_code: "viso",
    lifecycle_status: "active"
  },
  {
    permission_key: "viso.authorization.denials.revoke",
    app_code: "viso",
    lifecycle_status: "active"
  },
  {
    permission_key: "viso.catalog.commercial_categories.view",
    app_code: "viso",
    lifecycle_status: "active"
  },
  {
    permission_key: "viso.content.content_blocks.view",
    app_code: "viso",
    lifecycle_status: "active"
  },
  {
    permission_key: "viso.content.menu.view",
    app_code: "viso",
    lifecycle_status: "active"
  },
  {
    permission_key: "viso.content.website_content.view",
    app_code: "viso",
    lifecycle_status: "active"
  },
  {
    permission_key: "viso.finance.accounting.view",
    app_code: "viso",
    lifecycle_status: "active"
  },
  {
    permission_key: "viso.delivery.rates.view",
    app_code: "viso",
    lifecycle_status: "active"
  },
  {
    permission_key: "viso.loyalty.products.view",
    app_code: "viso",
    lifecycle_status: "active"
  },
  {
    permission_key: "viso.loyalty.customers.view",
    app_code: "viso",
    lifecycle_status: "active"
  }
] as const satisfies readonly PermissionIdentityDefinition[];

export const PERMISSION_BY_KEY = {
  "shell.access": PERMISSION_IDENTITIES[0],
  "anima.access": PERMISSION_IDENTITIES[1],
  "anima.workforce.employee_documents.view": PERMISSION_IDENTITIES[2],
  "anima.workforce.employee_documents.upload": PERMISSION_IDENTITIES[3],
  "anima.workforce.employee_documents.delete": PERMISSION_IDENTITIES[4],
  "anima.workforce.employee_photos.upload": PERMISSION_IDENTITIES[5],
  "anima.workforce.team_members.view": PERMISSION_IDENTITIES[6],
  "anima.workforce.staff_invitations.create": PERMISSION_IDENTITIES[7],
  "anima.attendance.shifts.create": PERMISSION_IDENTITIES[8],
  "anima.attendance.shifts.update": PERMISSION_IDENTITIES[9],
  "anima.attendance.shifts.cancel": PERMISSION_IDENTITIES[10],
  "aura.access": PERMISSION_IDENTITIES[11],
  "fogo.access": PERMISSION_IDENTITIES[12],
  "fogo.production.batches.view": PERMISSION_IDENTITIES[13],
  "fogo.production.batches.create": PERMISSION_IDENTITIES[14],
  "fogo.production.orders.view": PERMISSION_IDENTITIES[15],
  "fogo.production.recipe_book.view": PERMISSION_IDENTITIES[16],
  "fogo.production.recipes.view": PERMISSION_IDENTITIES[17],
  "nexo.access": PERMISSION_IDENTITIES[18],
  "nexo.catalog.products.view": PERMISSION_IDENTITIES[19],
  "nexo.catalog.products.create": PERMISSION_IDENTITIES[20],
  "nexo.catalog.presentations.view": PERMISSION_IDENTITIES[21],
  "nexo.catalog.request_policies.view": PERMISSION_IDENTITIES[22],
  "nexo.catalog.categories.view": PERMISSION_IDENTITIES[23],
  "nexo.catalog.units.view": PERMISSION_IDENTITIES[24],
  "nexo.assets.items.view": PERMISSION_IDENTITIES[25],
  "nexo.assets.items.create": PERMISSION_IDENTITIES[26],
  "nexo.assets.groups.view": PERMISSION_IDENTITIES[27],
  "nexo.assets.counts.view": PERMISSION_IDENTITIES[28],
  "nexo.inventory.adjustments.view": PERMISSION_IDENTITIES[29],
  "nexo.inventory.adjustments.register": PERMISSION_IDENTITIES[30],
  "nexo.inventory.entries.view": PERMISSION_IDENTITIES[31],
  "nexo.inventory.entries.register": PERMISSION_IDENTITIES[32],
  "nexo.inventory.entries.override": PERMISSION_IDENTITIES[33],
  "nexo.inventory.locations.view": PERMISSION_IDENTITIES[34],
  "nexo.inventory.location_assignments.assign": PERMISSION_IDENTITIES[35],
  "nexo.inventory.location_catalog.update": PERMISSION_IDENTITIES[36],
  "nexo.inventory.lpns.view": PERMISSION_IDENTITIES[37],
  "nexo.inventory.movements.view": PERMISSION_IDENTITIES[38],
  "nexo.inventory.stock.view": PERMISSION_IDENTITIES[39],
  "nexo.inventory.production_batches.view": PERMISSION_IDENTITIES[40],
  "nexo.inventory.transfers.view": PERMISSION_IDENTITIES[41],
  "nexo.inventory.transfers.create": PERMISSION_IDENTITIES[42],
  "nexo.inventory.withdrawals.view": PERMISSION_IDENTITIES[43],
  "nexo.inventory.withdrawals.register": PERMISSION_IDENTITIES[44],
  "nexo.inventory.zones.view": PERMISSION_IDENTITIES[45],
  "nexo.inventory.storage_positions.view": PERMISSION_IDENTITIES[46],
  "nexo.inventory.warehouse_operations.view": PERMISSION_IDENTITIES[47],
  "nexo.inventory.stock_validations.perform": PERMISSION_IDENTITIES[48],
  "nexo.inventory.stock_counts.view": PERMISSION_IDENTITIES[49],
  "nexo.inventory.stock_counts.perform": PERMISSION_IDENTITIES[50],
  "nexo.inventory.stock_count_variances.approve": PERMISSION_IDENTITIES[51],
  "nexo.inventory.stock_count_variances.resolve": PERMISSION_IDENTITIES[52],
  "nexo.inventory.initial_counts.view": PERMISSION_IDENTITIES[53],
  "nexo.inventory.remissions.view": PERMISSION_IDENTITIES[54],
  "nexo.inventory.remissions.update": PERMISSION_IDENTITIES[55],
  "nexo.inventory.remissions.request": PERMISSION_IDENTITIES[56],
  "nexo.inventory.remissions.prepare": PERMISSION_IDENTITIES[57],
  "nexo.inventory.remissions.accept_custody": PERMISSION_IDENTITIES[58],
  "nexo.inventory.remissions.start_transit": PERMISSION_IDENTITIES[59],
  "nexo.inventory.remissions.deliver": PERMISSION_IDENTITIES[60],
  "nexo.inventory.remissions.receive": PERMISSION_IDENTITIES[61],
  "nexo.inventory.remissions.cancel": PERMISSION_IDENTITIES[62],
  "nexo.logistics.operations_board.view": PERMISSION_IDENTITIES[63],
  "nexo.logistics.operations.view": PERMISSION_IDENTITIES[64],
  "nexo.logistics.driver_operations.view": PERMISSION_IDENTITIES[65],
  "nexo.logistics.fulfillment.view": PERMISSION_IDENTITIES[66],
  "nexo.logistics.fulfillment_routes.view": PERMISSION_IDENTITIES[67],
  "nexo.logistics.supply_routes.view": PERMISSION_IDENTITIES[68],
  "nexo.finance.internal_invoices.view": PERMISSION_IDENTITIES[69],
  "nexo.finance.internal_invoices.generate": PERMISSION_IDENTITIES[70],
  "nexo.finance.internal_invoices.issue": PERMISSION_IDENTITIES[71],
  "nexo.finance.internal_invoices.cancel": PERMISSION_IDENTITIES[72],
  "nexo.finance.internal_invoice_amounts.view": PERMISSION_IDENTITIES[73],
  "nexo.finance.internal_prices.view": PERMISSION_IDENTITIES[74],
  "nexo.finance.internal_variances.view": PERMISSION_IDENTITIES[75],
  "nexo.finance.internal_variances.approve": PERMISSION_IDENTITIES[76],
  "nexo.finance.internal_variances.resolve": PERMISSION_IDENTITIES[77],
  "nexo.finance.cost_centers.view": PERMISSION_IDENTITIES[78],
  "nexo.analytics.internal_reports.view": PERMISSION_IDENTITIES[79],
  "nexo.analytics.margin_reports.view": PERMISSION_IDENTITIES[80],
  "nexo.printing.templates.update": PERMISSION_IDENTITIES[81],
  "nexo.printing.jobs.view": PERMISSION_IDENTITIES[82],
  "nexo.settings.sites.view": PERMISSION_IDENTITIES[83],
  "nexo.settings.remission_policies.view": PERMISSION_IDENTITIES[84],
  "numera.access": PERMISSION_IDENTITIES[85],
  "numera.finance.cost_centers.view": PERMISSION_IDENTITIES[86],
  "numera.finance.expenses.view": PERMISSION_IDENTITIES[87],
  "numera.analytics.break_even.view": PERMISSION_IDENTITIES[88],
  "numera.analytics.profitability.view": PERMISSION_IDENTITIES[89],
  "numera.analytics.financial_reports.view": PERMISSION_IDENTITIES[90],
  "origo.access": PERMISSION_IDENTITIES[91],
  "origo.procurement.purchase_orders.view": PERMISSION_IDENTITIES[92],
  "origo.procurement.receipts.view": PERMISSION_IDENTITIES[93],
  "origo.procurement.receipts.register": PERMISSION_IDENTITIES[94],
  "origo.procurement.suppliers.view": PERMISSION_IDENTITIES[95],
  "origo.catalog.product_reviews.view": PERMISSION_IDENTITIES[96],
  "pass.access": PERMISSION_IDENTITIES[97],
  "pulso.access": PERMISSION_IDENTITIES[98],
  "pulso.delivery.deliveries.override": PERMISSION_IDENTITIES[99],
  "pulso.sales.orders.create": PERMISSION_IDENTITIES[100],
  "pulso.payments.transactions.collect": PERMISSION_IDENTITIES[101],
  "pulso.payments.transactions.reverse": PERMISSION_IDENTITIES[102],
  "pulso.cash.sessions.start": PERMISSION_IDENTITIES[103],
  "pulso.cash.sessions.close": PERMISSION_IDENTITIES[104],
  "pulso.sales.orders.cancel": PERMISSION_IDENTITIES[105],
  "pulso.sales.returns.create": PERMISSION_IDENTITIES[106],
  "pulso.payments.transactions.refund": PERMISSION_IDENTITIES[107],
  "pulso.sales.discounts.apply": PERMISSION_IDENTITIES[108],
  "viso.access": PERMISSION_IDENTITIES[109],
  "viso.platform.app_updates.view": PERMISSION_IDENTITIES[110],
  "viso.organization.businesses.view": PERMISSION_IDENTITIES[111],
  "viso.workforce.employees.view": PERMISSION_IDENTITIES[112],
  "viso.workforce.staff_calendar.view": PERMISSION_IDENTITIES[113],
  "viso.workforce.schedules.view": PERMISSION_IDENTITIES[114],
  "viso.workforce.vacancies.view": PERMISSION_IDENTITIES[115],
  "viso.authorization.context_simulations.view": PERMISSION_IDENTITIES[116],
  "viso.authorization.audit_logs.view": PERMISSION_IDENTITIES[117],
  "viso.authorization.base_grants.view": PERMISSION_IDENTITIES[118],
  "viso.authorization.base_grants.create": PERMISSION_IDENTITIES[119],
  "viso.authorization.base_grants.approve": PERMISSION_IDENTITIES[120],
  "viso.authorization.base_grants.suspend": PERMISSION_IDENTITIES[121],
  "viso.authorization.base_grants.revoke": PERMISSION_IDENTITIES[122],
  "viso.authorization.operational_grants.view": PERMISSION_IDENTITIES[123],
  "viso.authorization.operational_grants.create": PERMISSION_IDENTITIES[124],
  "viso.authorization.operational_grants.approve": PERMISSION_IDENTITIES[125],
  "viso.authorization.operational_grants.suspend": PERMISSION_IDENTITIES[126],
  "viso.authorization.operational_grants.revoke": PERMISSION_IDENTITIES[127],
  "viso.authorization.denials.view": PERMISSION_IDENTITIES[128],
  "viso.authorization.denials.create": PERMISSION_IDENTITIES[129],
  "viso.authorization.denials.approve": PERMISSION_IDENTITIES[130],
  "viso.authorization.denials.revoke": PERMISSION_IDENTITIES[131],
  "viso.catalog.commercial_categories.view": PERMISSION_IDENTITIES[132],
  "viso.content.content_blocks.view": PERMISSION_IDENTITIES[133],
  "viso.content.menu.view": PERMISSION_IDENTITIES[134],
  "viso.content.website_content.view": PERMISSION_IDENTITIES[135],
  "viso.finance.accounting.view": PERMISSION_IDENTITIES[136],
  "viso.delivery.rates.view": PERMISSION_IDENTITIES[137],
  "viso.loyalty.products.view": PERMISSION_IDENTITIES[138],
  "viso.loyalty.customers.view": PERMISSION_IDENTITIES[139],
} as const satisfies PermissionByKey;

const APPLICATION_CODE_SET = new Set<string>(APPLICATION_CODES);
const PERMISSION_KEY_SET = new Set<string>(PERMISSION_KEYS);

export function isAppCode(value: unknown): value is AppCode {
  return typeof value === "string" && APPLICATION_CODE_SET.has(value);
}

export function isPermissionKey(value: unknown): value is PermissionKey {
  return typeof value === "string" && PERMISSION_KEY_SET.has(value);
}
