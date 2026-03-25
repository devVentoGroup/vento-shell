-- Auditoria rapida v2: categorias de venta operativas canonicas
-- Ejecutar en SQL Editor (proyecto remoto) o contra DB ligada.

-- 1) Resumen general de categorias venta
with canonical_root as (
  select id
  from public.product_categories
  where lower(trim(name)) = 'venta'
    and parent_id is null
    and site_id is null
    and coalesce(nullif(trim(domain), ''), '') = ''
  order by id
  limit 1
),
canonical_keep as (
  select id from canonical_root
  union
  select pc.id
  from public.product_categories pc
  cross join canonical_root r
  where pc.parent_id = r.id
    and pc.site_id is null
    and coalesce(nullif(trim(pc.domain), ''), '') = ''
    and lower(coalesce(pc.slug, '')) like 'venta-%'
),
venta_cats as (
  select pc.*
  from public.product_categories pc
  where pc.applies_to_kinds @> array['venta']::text[]
)
select
  count(*) as venta_categories_total,
  count(*) filter (where is_active = true) as venta_categories_active,
  count(*) filter (where id in (select id from canonical_keep)) as canonical_total,
  count(*) filter (where is_active = true and id in (select id from canonical_keep)) as canonical_active,
  count(*) filter (where is_active = true and id not in (select id from canonical_keep)) as legacy_active
from venta_cats;

"| venta_categories_total | venta_categories_active | canonical_total | canonical_active | legacy_active |
| ---------------------- | ----------------------- | --------------- | ---------------- | ------------- |
| 60                     | 19                      | 15              | 15               | 4             |"

-- 2) Categorias venta activas NO canonicas (deberia quedar vacio)
with canonical_root as (
  select id
  from public.product_categories
  where lower(trim(name)) = 'venta'
    and parent_id is null
    and site_id is null
    and coalesce(nullif(trim(domain), ''), '') = ''
  order by id
  limit 1
),
canonical_keep as (
  select id from canonical_root
  union
  select pc.id
  from public.product_categories pc
  cross join canonical_root r
  where pc.parent_id = r.id
    and pc.site_id is null
    and coalesce(nullif(trim(pc.domain), ''), '') = ''
    and lower(coalesce(pc.slug, '')) like 'venta-%'
)
select
  pc.id,
  pc.name,
  pc.slug,
  pc.domain,
  pc.site_id,
  pc.parent_id,
  pc.is_active
from public.product_categories pc
where pc.applies_to_kinds @> array['venta']::text[]
  and pc.is_active = true
  and pc.id not in (select id from canonical_keep)
order by pc.name;

"| id                                   | name                     | slug                 | domain    | site_id | parent_id                            | is_active |
| ------------------------------------ | ------------------------ | -------------------- | --------- | ------- | ------------------------------------ | --------- |
| 5e9bf8b7-2f4a-483b-baf2-518bded97260 | SANDBOX V1               | sbx-v1-root          | INVENTORY | null    | null                                 | true      |
| b0a0b855-d870-4502-918d-70e1b980e2b7 | SANDBOX V1 Insumos       | sbx-v1-insumos       | INVENTORY | null    | 5e9bf8b7-2f4a-483b-baf2-518bded97260 | true      |
| 57231254-0f4d-4791-b615-cbdcd00c99f6 | SANDBOX V1 Preparaciones | sbx-v1-preparaciones | INVENTORY | null    | 5e9bf8b7-2f4a-483b-baf2-518bded97260 | true      |
| da345464-20fb-4fe2-ae23-baee52fed5e8 | SANDBOX V1 Venta         | sbx-v1-venta         | INVENTORY | null    | 5e9bf8b7-2f4a-483b-baf2-518bded97260 | true      |"

-- 3) Productos venta activos fuera de categoria canonica o inactiva (deberia quedar vacio)
with canonical_root as (
  select id
  from public.product_categories
  where lower(trim(name)) = 'venta'
    and parent_id is null
    and site_id is null
    and coalesce(nullif(trim(domain), ''), '') = ''
  order by id
  limit 1
),
canonical_keep as (
  select id from canonical_root
  union
  select pc.id
  from public.product_categories pc
  cross join canonical_root r
  where pc.parent_id = r.id
    and pc.site_id is null
    and coalesce(nullif(trim(pc.domain), ''), '') = ''
    and lower(coalesce(pc.slug, '')) like 'venta-%'
)
select
  p.id as product_id,
  p.name as product_name,
  p.sku,
  p.category_id,
  pc.name as category_name,
  pc.slug as category_slug,
  pc.is_active as category_active
from public.products p
left join public.product_categories pc on pc.id = p.category_id
where lower(coalesce(p.product_type, '')) = 'venta'
  and coalesce(p.is_active, true) = true
  and (
    p.category_id is null
    or p.category_id not in (select id from canonical_keep)
    or coalesce(pc.is_active, false) = false
  )
order by p.name;

"No arrojó nada"

-- 4) Distribucion de productos venta activos por categoria canonica
with canonical_root as (
  select id
  from public.product_categories
  where lower(trim(name)) = 'venta'
    and parent_id is null
    and site_id is null
    and coalesce(nullif(trim(domain), ''), '') = ''
  order by id
  limit 1
),
canonical_keep as (
  select id from canonical_root
  union
  select pc.id
  from public.product_categories pc
  cross join canonical_root r
  where pc.parent_id = r.id
    and pc.site_id is null
    and coalesce(nullif(trim(pc.domain), ''), '') = ''
    and lower(coalesce(pc.slug, '')) like 'venta-%'
)
select
  pc.name as category_name,
  pc.slug as category_slug,
  count(p.id) as active_products
from public.product_categories pc
left join public.products p
  on p.category_id = pc.id
 and lower(coalesce(p.product_type, '')) = 'venta'
 and coalesce(p.is_active, true) = true
where pc.id in (select id from canonical_keep)
group by pc.id, pc.name, pc.slug
order by active_products desc, pc.name;

"| category_name                | category_slug                      | active_products |
| ---------------------------- | ---------------------------------- | --------------- |
| Panaderia y bolleria         | venta-panaderia-y-bolleria         | 14              |
| Bebidas frias                | venta-bebidas-frias                | 13              |
| Cocteles y alcohol           | venta-cocteles-y-alcohol           | 2               |
| Otros de venta               | venta-otros-de-venta               | 2               |
| Cafe y espresso              | venta-cafe-y-espresso              | 0               |
| Desayunos y brunch           | venta-desayunos-y-brunch           | 0               |
| Ensaladas y bowls            | venta-ensaladas-y-bowls            | 0               |
| Entradas y para compartir    | venta-entradas-y-para-compartir    | 0               |
| Helados y frios dulces       | venta-helados-y-frios-dulces       | 0               |
| Otras bebidas calientes      | venta-otras-bebidas-calientes      | 0               |
| Platos fuertes               | venta-platos-fuertes               | 0               |
| Productos empacados y retail | venta-productos-empacados-y-retail | 0               |
| Sanduches, wraps y tostadas  | venta-sanduches-wraps-y-tostadas   | 0               |
| Tortas y postres             | venta-tortas-y-postres             | 0               |
| Venta                        | venta                              | 0               |"