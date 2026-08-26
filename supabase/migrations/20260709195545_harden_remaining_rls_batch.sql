begin;

-- Security Advisor batch: enable RLS on remaining exposed tables without
-- turning internal/staging data into client-readable data.

alter table pos.pos_cash_movements enable row level security;
alter table pos.pos_cash_shifts enable row level security;
alter table pos.pos_modifier_options enable row level security;
alter table pos.pos_modifiers enable row level security;
alter table pos.pos_order_item_modifiers enable row level security;
alter table pos.pos_product_modifiers enable row level security;
alter table pos.pos_tables enable row level security;
alter table pos.pos_zones enable row level security;

alter table public.asistencia_logs enable row level security;
alter table public.asset_documents enable row level security;
alter table public.asset_groups enable row level security;
alter table public.asset_items enable row level security;
alter table public.asset_maintenance_records enable row level security;
alter table public.asset_movements enable row level security;
alter table public.inventory_cost_policies enable row level security;
alter table public.inventory_unit_aliases enable row level security;
alter table public.inventory_units enable row level security;
alter table public.operational_roles enable row level security;
alter table public.procurement_supplier_product_costs enable row level security;
do $$
begin
  if to_regclass('public.product_categories_backup_20260316_preparaciones') is not null then
    execute 'alter table public.product_categories_backup_20260316_preparaciones enable row level security';
    execute 'drop policy if exists no_client_access_product_categories_backup_preparaciones on public.product_categories_backup_20260316_preparaciones';
    execute 'create policy no_client_access_product_categories_backup_preparaciones on public.product_categories_backup_20260316_preparaciones for all to anon, authenticated using (false) with check (false)';
  else
    raise notice 'Backup-table RLS hardening skipped: public.product_categories_backup_20260316_preparaciones does not exist.';
  end if;
end
$$;
alter table public.product_cost_events enable row level security;
alter table public.product_site_production_routes enable row level security;
alter table public.production_batch_consumptions enable row level security;
alter table public.purchase_order_items enable row level security;
alter table public.shift_runtime_events enable row level security;
alter table public.site_production_pick_order enable row level security;
alter table public.staging_insumos_import enable row level security;
alter table public.wallet_devices enable row level security;
alter table public.wallet_passes enable row level security;

drop policy if exists pos_cash_shifts_site_access on pos.pos_cash_shifts;
create policy pos_cash_shifts_site_access
on pos.pos_cash_shifts
for all
to authenticated
using (public.has_permission('pulso.pos.main', site_id))
with check (public.has_permission('pulso.pos.main', site_id));

drop policy if exists pos_cash_movements_shift_access on pos.pos_cash_movements;
create policy pos_cash_movements_shift_access
on pos.pos_cash_movements
for all
to authenticated
using (
  exists (
    select 1
    from pos.pos_cash_shifts s
    where s.id = pos_cash_movements.shift_id
      and public.has_permission('pulso.pos.main', s.site_id)
  )
)
with check (
  exists (
    select 1
    from pos.pos_cash_shifts s
    where s.id = pos_cash_movements.shift_id
      and public.has_permission('pulso.pos.main', s.site_id)
  )
);

drop policy if exists pos_zones_site_access on pos.pos_zones;
create policy pos_zones_site_access
on pos.pos_zones
for all
to authenticated
using (public.has_permission('pulso.pos.main', site_id))
with check (public.has_permission('pulso.pos.main', site_id));

drop policy if exists pos_tables_site_access on pos.pos_tables;
create policy pos_tables_site_access
on pos.pos_tables
for all
to authenticated
using (public.has_permission('pulso.pos.main', site_id))
with check (public.has_permission('pulso.pos.main', site_id));

drop policy if exists pos_modifiers_select_site_or_global on pos.pos_modifiers;
create policy pos_modifiers_select_site_or_global
on pos.pos_modifiers
for select
to authenticated
using (
  (site_id is null and public.is_employee())
  or public.has_permission('pulso.pos.main', site_id)
);

drop policy if exists pos_modifiers_write_site on pos.pos_modifiers;
create policy pos_modifiers_write_site
on pos.pos_modifiers
for all
to authenticated
using (site_id is not null and public.has_permission('pulso.pos.main', site_id))
with check (site_id is not null and public.has_permission('pulso.pos.main', site_id));

drop policy if exists pos_modifier_options_select_parent_access on pos.pos_modifier_options;
create policy pos_modifier_options_select_parent_access
on pos.pos_modifier_options
for select
to authenticated
using (
  exists (
    select 1
    from pos.pos_modifiers m
    where m.id = pos_modifier_options.modifier_id
      and (
        (m.site_id is null and public.is_employee())
        or public.has_permission('pulso.pos.main', m.site_id)
      )
  )
);

drop policy if exists pos_modifier_options_write_parent_site on pos.pos_modifier_options;
create policy pos_modifier_options_write_parent_site
on pos.pos_modifier_options
for all
to authenticated
using (
  exists (
    select 1
    from pos.pos_modifiers m
    where m.id = pos_modifier_options.modifier_id
      and m.site_id is not null
      and public.has_permission('pulso.pos.main', m.site_id)
  )
)
with check (
  exists (
    select 1
    from pos.pos_modifiers m
    where m.id = pos_modifier_options.modifier_id
      and m.site_id is not null
      and public.has_permission('pulso.pos.main', m.site_id)
  )
);

drop policy if exists pos_product_modifiers_parent_access on pos.pos_product_modifiers;
create policy pos_product_modifiers_parent_access
on pos.pos_product_modifiers
for all
to authenticated
using (
  exists (
    select 1
    from pos.pos_modifiers m
    where m.id = pos_product_modifiers.modifier_id
      and (
        (m.site_id is null and public.is_employee())
        or public.has_permission('pulso.pos.main', m.site_id)
      )
  )
)
with check (
  exists (
    select 1
    from pos.pos_modifiers m
    where m.id = pos_product_modifiers.modifier_id
      and (
        (m.site_id is null and public.is_employee())
        or public.has_permission('pulso.pos.main', m.site_id)
      )
  )
);

drop policy if exists pos_order_item_modifiers_order_access on pos.pos_order_item_modifiers;
create policy pos_order_item_modifiers_order_access
on pos.pos_order_item_modifiers
for all
to authenticated
using (
  exists (
    select 1
    from public.order_items oi
    join public.orders o on o.id = oi.order_id
    where oi.id = pos_order_item_modifiers.order_item_id
      and public.has_permission('pulso.pos.main', o.site_id)
  )
)
with check (
  exists (
    select 1
    from public.order_items oi
    join public.orders o on o.id = oi.order_id
    where oi.id = pos_order_item_modifiers.order_item_id
      and public.has_permission('pulso.pos.main', o.site_id)
  )
);

drop policy if exists inventory_units_select_authenticated on public.inventory_units;
create policy inventory_units_select_authenticated
on public.inventory_units
for select
to authenticated
using (true);

drop policy if exists inventory_unit_aliases_select_authenticated on public.inventory_unit_aliases;
create policy inventory_unit_aliases_select_authenticated
on public.inventory_unit_aliases
for select
to authenticated
using (true);

drop policy if exists operational_roles_select_authenticated on public.operational_roles;
create policy operational_roles_select_authenticated
on public.operational_roles
for select
to authenticated
using (true);

drop policy if exists inventory_cost_policies_site_access on public.inventory_cost_policies;
create policy inventory_cost_policies_site_access
on public.inventory_cost_policies
for all
to authenticated
using (
  public.has_permission('nexo.inventory.stock', site_id)
  or public.has_permission('nexo.inventory.entries', site_id)
  or public.has_permission('origo.procurement.receipts', site_id)
)
with check (
  public.has_permission('nexo.inventory.stock', site_id)
  or public.has_permission('nexo.inventory.entries', site_id)
  or public.has_permission('origo.procurement.receipts', site_id)
);

drop policy if exists procurement_supplier_product_costs_select_authorized on public.procurement_supplier_product_costs;
create policy procurement_supplier_product_costs_select_authorized
on public.procurement_supplier_product_costs
for select
to authenticated
using (
  public.has_permission('origo.procurement.receipts')
  or public.has_permission('nexo.inventory.entries')
  or public.has_permission('nexo.inventory.stock')
);

drop policy if exists product_cost_events_select_site_access on public.product_cost_events;
create policy product_cost_events_select_site_access
on public.product_cost_events
for select
to authenticated
using (
  public.has_permission('nexo.inventory.stock', site_id)
  or public.has_permission('nexo.inventory.entries', site_id)
  or public.has_permission('origo.procurement.receipts', site_id)
);

drop policy if exists purchase_order_items_parent_access on public.purchase_order_items;
create policy purchase_order_items_parent_access
on public.purchase_order_items
for all
to authenticated
using (
  exists (
    select 1
    from public.purchase_orders po
    where po.id = purchase_order_items.purchase_order_id
      and public.has_permission('origo.procurement.receipts', po.site_id)
  )
)
with check (
  exists (
    select 1
    from public.purchase_orders po
    where po.id = purchase_order_items.purchase_order_id
      and public.has_permission('origo.procurement.receipts', po.site_id)
  )
);

drop policy if exists product_site_production_routes_site_access on public.product_site_production_routes;
create policy product_site_production_routes_site_access
on public.product_site_production_routes
for all
to authenticated
using (
  public.has_permission('fogo.production.batches', site_id)
  or public.has_permission('nexo.inventory.production_batches', site_id)
)
with check (
  public.has_permission('fogo.production.batches', site_id)
  or public.has_permission('nexo.inventory.production_batches', site_id)
);

drop policy if exists production_batch_consumptions_batch_access on public.production_batch_consumptions;
create policy production_batch_consumptions_batch_access
on public.production_batch_consumptions
for all
to authenticated
using (
  exists (
    select 1
    from public.production_batches b
    where b.id = production_batch_consumptions.batch_id
      and (
        public.has_permission('fogo.production.batches', b.site_id)
        or public.has_permission('nexo.inventory.production_batches', b.site_id)
      )
  )
)
with check (
  exists (
    select 1
    from public.production_batches b
    where b.id = production_batch_consumptions.batch_id
      and (
        public.has_permission('fogo.production.batches', b.site_id)
        or public.has_permission('nexo.inventory.production_batches', b.site_id)
      )
  )
);

drop policy if exists site_production_pick_order_site_access on public.site_production_pick_order;
create policy site_production_pick_order_site_access
on public.site_production_pick_order
for all
to authenticated
using (
  public.has_permission('fogo.production.batches', site_id)
  or public.has_permission('nexo.inventory.production_batches', site_id)
)
with check (
  public.has_permission('fogo.production.batches', site_id)
  or public.has_permission('nexo.inventory.production_batches', site_id)
);

drop policy if exists asset_groups_site_access on public.asset_groups;
create policy asset_groups_site_access
on public.asset_groups
for all
to authenticated
using (
  public.can_access_site(site_id)
  and (
    public.has_permission('nexo.inventory.stock', site_id)
    or public.has_permission('nexo.inventory.locations', site_id)
    or public.has_permission('nexo.inventory.counts', site_id)
  )
)
with check (
  public.can_access_site(site_id)
  and (
    public.has_permission('nexo.inventory.stock', site_id)
    or public.has_permission('nexo.inventory.locations', site_id)
    or public.has_permission('nexo.inventory.counts', site_id)
  )
);

drop policy if exists asset_items_site_access on public.asset_items;
create policy asset_items_site_access
on public.asset_items
for all
to authenticated
using (
  public.can_access_site(site_id)
  and (
    public.has_permission('nexo.inventory.stock', site_id)
    or public.has_permission('nexo.inventory.locations', site_id)
    or public.has_permission('nexo.inventory.counts', site_id)
  )
)
with check (
  public.can_access_site(site_id)
  and (
    public.has_permission('nexo.inventory.stock', site_id)
    or public.has_permission('nexo.inventory.locations', site_id)
    or public.has_permission('nexo.inventory.counts', site_id)
  )
);

drop policy if exists asset_movements_site_access on public.asset_movements;
create policy asset_movements_site_access
on public.asset_movements
for all
to authenticated
using (
  (
    (from_site_id is not null and public.can_access_site(from_site_id))
    or (to_site_id is not null and public.can_access_site(to_site_id))
    or exists (
      select 1
      from public.asset_items ai
      where ai.id = asset_movements.asset_item_id
        and public.can_access_site(ai.site_id)
    )
  )
)
with check (
  (
    from_site_id is null
    or public.has_permission('nexo.inventory.locations', from_site_id)
    or public.has_permission('nexo.inventory.stock', from_site_id)
  )
  and (
    to_site_id is null
    or public.has_permission('nexo.inventory.locations', to_site_id)
    or public.has_permission('nexo.inventory.stock', to_site_id)
  )
);

drop policy if exists asset_documents_subject_access on public.asset_documents;
create policy asset_documents_subject_access
on public.asset_documents
for all
to authenticated
using (
  exists (
    select 1
    from public.asset_items ai
    where ai.id = asset_documents.asset_item_id
      and public.can_access_site(ai.site_id)
  )
  or exists (
    select 1
    from public.asset_groups ag
    where ag.id = asset_documents.asset_group_id
      and public.can_access_site(ag.site_id)
  )
)
with check (
  exists (
    select 1
    from public.asset_items ai
    where ai.id = asset_documents.asset_item_id
      and (
        public.has_permission('nexo.inventory.locations', ai.site_id)
        or public.has_permission('nexo.inventory.stock', ai.site_id)
        or public.has_permission('nexo.inventory.counts', ai.site_id)
      )
  )
  or exists (
    select 1
    from public.asset_groups ag
    where ag.id = asset_documents.asset_group_id
      and (
        public.has_permission('nexo.inventory.locations', ag.site_id)
        or public.has_permission('nexo.inventory.stock', ag.site_id)
        or public.has_permission('nexo.inventory.counts', ag.site_id)
      )
  )
);

drop policy if exists asset_maintenance_records_item_access on public.asset_maintenance_records;
create policy asset_maintenance_records_item_access
on public.asset_maintenance_records
for all
to authenticated
using (
  exists (
    select 1
    from public.asset_items ai
    where ai.id = asset_maintenance_records.asset_item_id
      and public.can_access_site(ai.site_id)
  )
)
with check (
  exists (
    select 1
    from public.asset_items ai
    where ai.id = asset_maintenance_records.asset_item_id
      and (
        public.has_permission('nexo.inventory.locations', ai.site_id)
        or public.has_permission('nexo.inventory.stock', ai.site_id)
        or public.has_permission('nexo.inventory.counts', ai.site_id)
      )
  )
);

drop policy if exists no_client_access_asistencia_logs on public.asistencia_logs;
create policy no_client_access_asistencia_logs
on public.asistencia_logs
for all
to anon, authenticated
using (false)
with check (false);

drop policy if exists no_client_access_shift_runtime_events on public.shift_runtime_events;
create policy no_client_access_shift_runtime_events
on public.shift_runtime_events
for all
to anon, authenticated
using (false)
with check (false);

drop policy if exists no_client_access_staging_insumos_import on public.staging_insumos_import;
create policy no_client_access_staging_insumos_import
on public.staging_insumos_import
for all
to anon, authenticated
using (false)
with check (false);

drop policy if exists no_client_access_wallet_devices on public.wallet_devices;
create policy no_client_access_wallet_devices
on public.wallet_devices
for all
to anon, authenticated
using (false)
with check (false);

drop policy if exists no_client_access_wallet_passes on public.wallet_passes;
create policy no_client_access_wallet_passes
on public.wallet_passes
for all
to anon, authenticated
using (false)
with check (false);

commit;
