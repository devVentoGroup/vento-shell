begin;

create table if not exists pass.catalog_item_collections (
  id uuid primary key default gen_random_uuid(),
  catalog_item_id uuid not null references pass.catalog_items(id) on delete cascade,
  commercial_collection_id uuid not null references pass.commercial_collections(id) on delete cascade,
  sort_order integer not null default 0,
  is_active boolean not null default true,
  is_primary boolean not null default false,
  metadata jsonb not null default '{}'::jsonb,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now(),
  constraint pass_catalog_item_collections_unique unique (catalog_item_id, commercial_collection_id),
  constraint pass_catalog_item_collections