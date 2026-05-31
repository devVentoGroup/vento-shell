-- =====================================================================================
-- VENTO / NEXO
-- Migration: Seed cost centers from existing sites
-- File: 20260530174500_seed_cost_centers_from_sites.sql
--
-- Scope:
-- - Populate public.cost_centers from current public.sites.
-- - Keep one active cost center per site using the existing partial unique index.
-- - Classify sites by site_type:
--     production_center -> production_center
--     satellite         -> satellite
--     admin             -> admin
--
-- Notes:
-- - public.cost_centers already existed before the internal billing foundation migration.
-- - The previous migration extended cost_centers with code, type and updated_at.
-- - This seed is idempotent: it can run more than once without duplicating active
--   cost centers for the same site.
-- =====================================================================================

begin;

insert into public.cost_centers (
  site_id,
  code,
  name,
  type,
  monthly_budget,
  current_month_spend,
  is_active,
  created_at,
  updated_at
)
select
  s.id as site_id,
  case s.code
    when 'CENTRO_PROD' then 'CP-CENTRO-PROD'
    when 'MOLKA_PRINCIPAL' then 'SAT-MOLKA-PRINCIPAL'
    when 'SAUDO' then 'SAT-SAUDO'
    when 'VENTO_CAFE' then 'SAT-VENTO-CAFE'
    when 'APP-REVIEW' then 'ADM-APP-REVIEW'
    when 'VENTO_GROUP' then 'ADM-VENTO-GROUP'
    else upper(
      regexp_replace(
        case
          when s.site_type::text = 'production_center' then 'CP-' || s.code
          when s.site_type::text = 'satellite' then 'SAT-' || s.code
          when s.site_type::text = 'admin' then 'ADM-' || s.code
          else 'CC-' || s.code
        end,
        '[^A-Z0-9_-]+',
        '-',
        'g'
      )
    )
  end as code,
  s.name as name,
  case
    when s.site_type::text = 'production_center' then 'production_center'
    when s.site_type::text = 'satellite' then 'satellite'
    when s.site_type::text = 'admin' then 'admin'
    else 'other'
  end as type,
  0 as monthly_budget,
  0 as current_month_spend,
  true as is_active,
  now() as created_at,
  now() as updated_at
from public.sites s
where s.is_active = true
  and s.code in (
    'CENTRO_PROD',
    'MOLKA_PRINCIPAL',
    'SAUDO',
    'VENTO_CAFE',
    'APP-REVIEW',
    'VENTO_GROUP'
  )
on conflict (site_id)
where site_id is not null and is_active is not false
do update set
  code = excluded.code,
  name = excluded.name,
  type = excluded.type,
  is_active = true,
  updated_at = now();

commit;

-- =====================================================================================
-- Post-migration validation queries
-- =====================================================================================

select
  'cost_centers_seeded' as check_name,
  cc.code,
  cc.name,
  cc.type,
  s.code as site_code,
  s.site_type,
  cc.is_active
from public.cost_centers cc
left join public.sites s
  on s.id = cc.site_id
where cc.site_id is not null
order by cc.type, cc.name;

select
  'cost_centers_by_type' as check_name,
  type,
  count(*) as total
from public.cost_centers
where is_active is not false
group by type
order by type;
