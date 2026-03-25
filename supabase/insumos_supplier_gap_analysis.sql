-- Analisis en vivo: brecha de proveedor para insumos/reventa.
-- Ejecutar en la BD actual (desde vento-shell).
-- No modifica datos; solo diagnostica y propone candidatos.

-- 1) Universo actual sin proveedor.
with missing_products as (
  select
    p.id,
    p.name,
    p.product_type,
    pip.inventory_kind,
    lower(regexp_replace(trim(p.name), '\s+', ' ', 'g')) as norm_name
  from public.products p
  join public.product_inventory_profiles pip
    on pip.product_id = p.id
  left join public.product_suppliers ps
    on ps.product_id = p.id
  where p.is_active = true
    and (
      (p.product_type = 'insumo' and coalesce(pip.inventory_kind, '') <> 'asset')
      or (p.product_type = 'venta' and coalesce(pip.inventory_kind, '') = 'resale')
    )
  group by p.id, p.name, p.product_type, pip.inventory_kind
  having count(ps.id) = 0
)
select count(*) as missing_supplier_products
from missing_products;

-- 2) Cobertura exacta contra staging_insumos_import (por nombre normalizado).
with missing_products as (
  select
    p.id,
    p.name,
    lower(regexp_replace(trim(p.name), '\s+', ' ', 'g')) as norm_name
  from public.products p
  join public.product_inventory_profiles pip
    on pip.product_id = p.id
  left join public.product_suppliers ps
    on ps.product_id = p.id
  where p.is_active = true
    and (
      (p.product_type = 'insumo' and coalesce(pip.inventory_kind, '') <> 'asset')
      or (p.product_type = 'venta' and coalesce(pip.inventory_kind, '') = 'resale')
    )
  group by p.id, p.name
  having count(ps.id) = 0
),
staging_rows as (
  select
    lower(regexp_replace(trim(producto), '\s+', ' ', 'g')) as norm_producto,
    trim(proveedor) as proveedor,
    precio_cop,
    issues
  from public.staging_insumos_import
  where coalesce(trim(producto), '') <> ''
)
select
  count(distinct mp.id) as missing_with_exact_staging_match,
  count(distinct mp.id) filter (where coalesce(sr.proveedor, '') <> '') as missing_with_supplier_candidate
from missing_products mp
left join staging_rows sr
  on sr.norm_producto = mp.norm_name;

-- 3) Productos sin proveedor y sin match exacto en staging.
with missing_products as (
  select
    p.id,
    p.name,
    lower(regexp_replace(trim(p.name), '\s+', ' ', 'g')) as norm_name
  from public.products p
  join public.product_inventory_profiles pip
    on pip.product_id = p.id
  left join public.product_suppliers ps
    on ps.product_id = p.id
  where p.is_active = true
    and (
      (p.product_type = 'insumo' and coalesce(pip.inventory_kind, '') <> 'asset')
      or (p.product_type = 'venta' and coalesce(pip.inventory_kind, '') = 'resale')
    )
  group by p.id, p.name
  having count(ps.id) = 0
),
staging_rows as (
  select
    lower(regexp_replace(trim(producto), '\s+', ' ', 'g')) as norm_producto
  from public.staging_insumos_import
  where coalesce(trim(producto), '') <> ''
)
select mp.id, mp.name
from missing_products mp
where not exists (
  select 1
  from staging_rows sr
  where sr.norm_producto = mp.norm_name
)
order by mp.name;

-- 4) Candidato sugerido de proveedor por producto (mejor match exacto).
-- Prioriza filas con proveedor + precio + sin issues graves.
with missing_products as (
  select
    p.id,
    p.name,
    lower(regexp_replace(trim(p.name), '\s+', ' ', 'g')) as norm_name
  from public.products p
  join public.product_inventory_profiles pip
    on pip.product_id = p.id
  left join public.product_suppliers ps
    on ps.product_id = p.id
  where p.is_active = true
    and (
      (p.product_type = 'insumo' and coalesce(pip.inventory_kind, '') <> 'asset')
      or (p.product_type = 'venta' and coalesce(pip.inventory_kind, '') = 'resale')
    )
  group by p.id, p.name
  having count(ps.id) = 0
),
staging_ranked as (
  select
    lower(regexp_replace(trim(producto), '\s+', ' ', 'g')) as norm_producto,
    trim(proveedor) as proveedor,
    precio_cop,
    issues,
    row_number() over (
      partition by lower(regexp_replace(trim(producto), '\s+', ' ', 'g'))
      order by
        case when coalesce(trim(proveedor), '') <> '' then 0 else 1 end,
        case when precio_cop is not null then 0 else 1 end,
        case when coalesce(issues, '') ilike '%missing_supplier%' then 1 else 0 end,
        case when coalesce(issues, '') ilike '%missing_price%' then 1 else 0 end,
        precio_cop desc nulls last
    ) as rn
  from public.staging_insumos_import
  where coalesce(trim(producto), '') <> ''
)
select
  mp.id as product_id,
  mp.name as product_name,
  sr.proveedor as suggested_supplier_name,
  sr.precio_cop as suggested_price_cop,
  sr.issues as staging_issues
from missing_products mp
left join staging_ranked sr
  on sr.norm_producto = mp.norm_name
 and sr.rn = 1
order by mp.name;
