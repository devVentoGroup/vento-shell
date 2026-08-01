-- DATA-NORM-POST-BACKFILL-VALIDATION-007@1.0.0
-- Manifiesto ejecutable y read-only para DATA-NORM-TRANS-007.
-- Define la suite; no consulta ni modifica datos operativos y termina en ROLLBACK.

begin;

create temporary table data_norm_trans_007_validation_lane (
  lane_order integer primary key,
  lane_key text unique not null,
  purpose text not null,
  authoritative_zero_tolerance boolean not null,
  pass_gate text not null
) on commit drop;

insert into data_norm_trans_007_validation_lane values
  (10, 'SOURCE_AND_OUTCOME',
    'source, originals, cuts, mappings, checkpoints and per-item outcomes', true,
    'zero destroyed source, missing outcome or unknown version'),
  (20, 'SEARCH_AND_DISCOVERY',
    'search keys, results, ranking, scope, authorization and cursors', true,
    'zero lost exact result and complete approved corpus'),
  (30, 'RELATIONSHIP_AND_CROSSWALK',
    'foreign keys, references, survivors, crosswalks, hierarchy and validity', true,
    'zero lost, ambiguous, duplicated or orphan authoritative reference'),
  (40, 'INTEGRATION_AND_CONTRACT',
    'external originals, mappings, API, RPC, import, job, webhook, ACK and event', true,
    'zero broken contract, overwritten original or duplicated effect'),
  (50, 'PROPAGATION_AND_PROJECTION',
    'copies, projections, child commands, retries and snapshots', true,
    'zero unexplained divergent copy and all child outcomes closed'),
  (60, 'SECURITY_AND_BOUNDARY',
    'RLS, grants, actors, tenant, site, product, minimization and VITAL', true,
    'zero unauthorized access, boundary mix or secret exposure'),
  (70, 'PERFORMANCE_AND_OPERABILITY',
    'plans, indexes, latency, throughput, locks, alerts and rollback readiness', false,
    'baseline, stricter SLO and SUPA-TRANS-010 budgets pass');

create temporary table data_norm_trans_007_validation_plan (
  validation_order integer not null,
  validation_plan_id text primary key,
  backfill_plan_id text unique not null,
  domain_key text not null,
  required_lanes text[] not null,
  current_status text not null,
  physical_backfill_observed boolean not null,
  post_backfill_pass_claimed boolean not null,
  missing_evidence text not null
) on commit drop;

insert into data_norm_trans_007_validation_plan values
  (10, 'DNT007-UOM-GOUDA-MERGE-V1', 'DNT005-UOM-GOUDA-MERGE-V1',
    'INVENTORY_UOM',
    array['SOURCE_AND_OUTCOME','SEARCH_AND_DISCOVERY','RELATIONSHIP_AND_CROSSWALK','INTEGRATION_AND_CONTRACT','SECURITY_AND_BOUNDARY','PERFORMANCE_AND_OPERABILITY'],
    'BLOCKED_INPUT_MISSING', false, false,
    'merge and crosswalk not executed; references and writers not revalidated'),
  (20, 'DNT007-UOM-STRUCTURAL-V1', 'DNT005-UOM-STRUCTURAL-DERIVATION-V1',
    'INVENTORY_UOM',
    array['SOURCE_AND_OUTCOME','SEARCH_AND_DISCOVERY','RELATIONSHIP_AND_CROSSWALK','PROPAGATION_AND_PROJECTION','SECURITY_AND_BOUNDARY','PERFORMANCE_AND_OPERABILITY'],
    'BLOCKED_INPUT_MISSING', false, false,
    'derived target and writer delta not materialized'),
  (30, 'DNT007-POSITION-SCOPE-V1', 'DNT005-INVENTORY-POSITION-SCOPE-V1',
    'INVENTORY_LOCATIONS',
    array['SOURCE_AND_OUTCOME','SEARCH_AND_DISCOVERY','RELATIONSHIP_AND_CROSSWALK','INTEGRATION_AND_CONTRACT','SECURITY_AND_BOUNDARY','PERFORMANCE_AND_OPERABILITY'],
    'BLOCKED_INPUT_MISSING', false, false,
    'derived scope, target and physical corpus pending'),
  (40, 'DNT007-SEARCH-REPRESENTATIONS-V1', 'DNT005-SEARCH-REPRESENTATIONS-V1',
    'CROSS_DOMAIN_SEARCH',
    array['SOURCE_AND_OUTCOME','SEARCH_AND_DISCOVERY','INTEGRATION_AND_CONTRACT','SECURITY_AND_BOUNDARY','PERFORMANCE_AND_OPERABILITY'],
    'BLOCKED_INPUT_MISSING', false, false,
    '4030 rows not materialized under a physical versioned algorithm'),
  (50, 'DNT007-VISIBLE-FORM-QUARANTINE-V1', 'DNT005-VISIBLE-FORM-CANDIDATES-V1',
    'VISIBLE_BUSINESS_TEXT',
    array['SOURCE_AND_OUTCOME','INTEGRATION_AND_CONTRACT','SECURITY_AND_BOUNDARY'],
    'BLOCKED_INPUT_MISSING', false, false,
    '46 observations not deduplicated and no quarantine run exists'),
  (60, 'DNT007-DICTIONARY-QUARANTINE-V1', 'DNT005-DICTIONARY-TOKEN-CANDIDATES-V1',
    'VISIBLE_BUSINESS_TEXT',
    array['SOURCE_AND_OUTCOME','INTEGRATION_AND_CONTRACT','SECURITY_AND_BOUNDARY'],
    'BLOCKED_INPUT_MISSING', false, false,
    'eligible scan and coordinates for maiz, clasico and frio pending'),
  (70, 'DNT007-PASS-PRESERVATION-V1', 'DNT005-PASS-LIFECYCLE-PRESERVATION-V1',
    'PASS_CATALOG_AND_REQUEST_POLICIES',
    array['SOURCE_AND_OUTCOME','RELATIONSHIP_AND_CROSSWALK','INTEGRATION_AND_CONTRACT','SECURITY_AND_BOUNDARY'],
    'BLOCKED_INPUT_MISSING', false, false,
    'after snapshot and no-mutation evidence not produced'),
  (80, 'DNT007-PERSON-PRESERVATION-V1', 'DNT005-PERSON-NAME-PRESERVATION-V1',
    'IDENTITY_AND_WORKFORCE',
    array['SOURCE_AND_OUTCOME','SEARCH_AND_DISCOVERY','INTEGRATION_AND_CONTRACT','SECURITY_AND_BOUNDARY'],
    'BLOCKED_INPUT_MISSING', false, false,
    'after snapshot and negative textual-identity tests pending'),
  (90, 'DNT007-IDENTITY-BLOCKERS-V1', 'DNT005-OPEN-IDENTITY-BLOCKERS-V1',
    'PRODUCT_AND_REMITTANCE_IDENTITY',
    array['SOURCE_AND_OUTCOME','RELATIONSHIP_AND_CROSSWALK','INTEGRATION_AND_CONTRACT','SECURITY_AND_BOUNDARY'],
    'BLOCKED_INPUT_MISSING', false, false,
    'after snapshot preserving eight members and zero unauthorized effects pending');

do $$
declare
  lane_count integer;
  unit_count integer;
begin
  select count(*) into lane_count
  from data_norm_trans_007_validation_lane;

  select count(*) into unit_count
  from data_norm_trans_007_validation_plan;

  if lane_count <> 7 then
    raise exception 'DATA-NORM-TRANS-007 produced % lanes; expected 7', lane_count;
  end if;

  if unit_count <> 9 then
    raise exception 'DATA-NORM-TRANS-007 produced % units; expected 9', unit_count;
  end if;

  if exists (
    select 1
    from data_norm_trans_007_validation_plan
    where physical_backfill_observed
       or post_backfill_pass_claimed
       or current_status in ('RUNNING', 'PASS')
  ) then
    raise exception 'DATA-NORM-TRANS-007 cannot claim a physical backfill or post-backfill PASS in E3';
  end if;

  if exists (
    select 1
    from data_norm_trans_007_validation_plan p
    cross join lateral unnest(p.required_lanes) required_lane
    left join data_norm_trans_007_validation_lane l
      on l.lane_key = required_lane
    where l.lane_key is null
  ) then
    raise exception 'DATA-NORM-TRANS-007 contains an unknown validation lane';
  end if;

  if exists (
    select 1
    from data_norm_trans_007_validation_plan
    where not ('SOURCE_AND_OUTCOME' = any(required_lanes))
       or not ('SECURITY_AND_BOUNDARY' = any(required_lanes))
  ) then
    raise exception 'Every validation unit requires source/outcome and security/boundary lanes';
  end if;

  if exists (
    select 1
    from data_norm_trans_007_validation_plan
    where current_status <> 'BLOCKED_INPUT_MISSING'
  ) then
    raise exception 'Every unit must remain blocked until its physical backfill evidence exists';
  end if;
end
$$;

select
  lane_order,
  lane_key,
  purpose,
  authoritative_zero_tolerance,
  pass_gate
from data_norm_trans_007_validation_lane
order by lane_order;

select
  validation_order,
  validation_plan_id,
  backfill_plan_id,
  domain_key,
  required_lanes,
  current_status,
  physical_backfill_observed,
  post_backfill_pass_claimed,
  missing_evidence
from data_norm_trans_007_validation_plan
order by validation_order;

rollback;
