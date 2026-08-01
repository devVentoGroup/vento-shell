-- DATA-NORM-ACTIVATION-PLAN-006@1.0.0
-- Manifiesto ejecutable y read-only para DATA-NORM-TRANS-006.
-- No activa reglas ni modifica objetos persistentes: usa tablas temporales y termina en ROLLBACK.

begin;

create temporary table data_norm_trans_006_activation_plan (
  activation_order integer not null,
  activation_plan_id text primary key,
  policy_coordinate text not null,
  current_status text not null,
  current_mode text,
  max_allowed_mode text not null,
  first_future_stage text not null,
  first_future_mode text not null,
  production_effect_allowed boolean not null,
  enforce_eligible boolean not null,
  blocked_by text not null
) on commit drop;

insert into data_norm_trans_006_activation_plan values
  (10, 'DNT006-PRODUCT-NAME-V1',
    'product + catalog boundary + normalized name',
    'BLOCKED', null, 'WARN_EXPLICIT_CONFIRMATION',
    'LOCAL_CORPUS', 'OBSERVE_ONLY', false, false,
    'Chai, Latte Frio and Choco Bites identity and relations remain open'),
  (20, 'DNT006-REMITTANCE-CATEGORY-V1',
    'site + remittance category + name',
    'BLOCKED', null, 'REVIEW_REQUIRED_BEFORE_WRITE',
    'LOCAL_CORPUS', 'OBSERVE_ONLY', false, false,
    'REM-001 case, routing and authority are incomplete'),
  (30, 'DNT006-UOM-LABEL-DISCOVERY-V1',
    'UOM label without usage context',
    'REJECTED_FOR_IDENTITY', null, 'OBSERVE_ONLY',
    'LOCAL_CORPUS', 'OBSERVE_ONLY', false, false,
    'structural scope is incomplete; promotion is prohibited'),
  (40, 'DNT006-UOM-FULL-COORDINATE-V1',
    'product + usage_context + UOM components',
    'BLOCKED', null, 'REVIEW_REQUIRED_BEFORE_WRITE',
    'LOCAL_CORPUS', 'OBSERVE_ONLY', false, false,
    'Gouda not executed; target, writers and reconciliation pending'),
  (50, 'DNT006-POSITION-NAME-DISCOVERY-V1',
    'location + position name',
    'REJECTED_FOR_IDENTITY', null, 'OBSERVE_ONLY',
    'LOCAL_CORPUS', 'OBSERVE_ONLY', false, false,
    'parent and code absent; promotion is prohibited'),
  (60, 'DNT006-POSITION-FULL-SCOPE-V1',
    'site + location + parent + code',
    'BLOCKED', null, 'REVIEW_REQUIRED_BEFORE_WRITE',
    'LOCAL_CORPUS', 'OBSERVE_ONLY', false, false,
    'target, writer path, physical corpus and reconciliation pending'),
  (70, 'DNT006-PASS-TEMPORAL-V1',
    'site + product + code + active validity',
    'BLOCKED', null, 'WARN_EXPLICIT_CONFIRMATION',
    'LOCAL_CORPUS', 'OBSERVE_ONLY', false, false,
    'temporal overlap and code policy incomplete'),
  (80, 'DNT006-PERSON-NAME-DISCOVERY-V1',
    'source + stable identity link + person name',
    'NON_UNIQUE_DISCOVERY_ONLY', null, 'OBSERVE_ONLY',
    'LOCAL_CORPUS', 'OBSERVE_ONLY', false, false,
    'privacy and identity prohibit textual uniqueness and promotion'),
  (90, 'DNT006-SEARCH-DERIVATIONS-V1',
    'domain + entity + field + stable primary key',
    'BLOCKED', null, 'OBSERVE_ONLY',
    'STAGING_SHADOW', 'OBSERVE_ONLY', false, false,
    'derivations, target, writer delta and parity not materialized'),
  (100, 'DNT006-VISIBLE-DICTIONARY-RULES-V1',
    'rule + domain + entity + field + stable primary key',
    'BLOCKED', null, 'REVIEW_REQUIRED_BEFORE_WRITE',
    'LOCAL_CORPUS', 'OBSERVE_ONLY', false, false,
    '46 observations are not deduplicated and token coordinates are uncertified');

create temporary table data_norm_trans_006_rollout_stage (
  stage_order integer primary key,
  stage_key text unique not null,
  environment_key text not null,
  cohort_percent integer check (cohort_percent between 0 and 100),
  business_effect boolean not null,
  exit_gate text not null
) on commit drop;

insert into data_norm_trans_006_rollout_stage values
  (10, 'LOCAL_CORPUS', 'LOCAL', 0, false,
    'complete corpus, negative, concurrency, idempotency and RLS tests pass'),
  (20, 'STAGING_SHADOW', 'STAGING', 100, false,
    'three comparable runs with explained parity and security/performance pass'),
  (30, 'STAGING_WRITERS', 'STAGING', 100, true,
    'UI, RPC, batch, import, job and integration produce equivalent outcomes'),
  (40, 'PROD_SHADOW', 'PRODUCTION', 100, false,
    'declared observation window has coverage and no drift or bypass'),
  (50, 'PROD_CANARY', 'PRODUCTION', 5, true,
    'all promotion gates remain pass and domain owner approves'),
  (60, 'PROD_EXPANSION_25', 'PRODUCTION', 25, true,
    'cohort reconciliation and guardrails remain pass'),
  (70, 'PROD_EXPANSION_50', 'PRODUCTION', 50, true,
    'cohort reconciliation remains pass and rollback remains executable'),
  (80, 'PROD_FULL', 'PRODUCTION', 100, true,
    'all writers and channels are covered and stabilization evidence is complete');

do $$
declare
  policy_count integer;
  stage_count integer;
begin
  select count(*) into policy_count
  from data_norm_trans_006_activation_plan;

  select count(*) into stage_count
  from data_norm_trans_006_rollout_stage;

  if policy_count <> 10 then
    raise exception 'DATA-NORM-TRANS-006 produced % policy coordinates; expected 10', policy_count;
  end if;

  if stage_count <> 8 then
    raise exception 'DATA-NORM-TRANS-006 produced % rollout stages; expected 8', stage_count;
  end if;

  if exists (
    select 1
    from data_norm_trans_006_activation_plan
    where current_mode is not null
       or production_effect_allowed
       or enforce_eligible
  ) then
    raise exception 'DATA-NORM-TRANS-006 cannot claim a current activation or enforcement eligibility';
  end if;

  if exists (
    select 1
    from data_norm_trans_006_activation_plan
    where max_allowed_mode = 'ENFORCE_CERTIFIED_UNIQUENESS'
  ) then
    raise exception 'No policy may reach ENFORCE_CERTIFIED_UNIQUENESS after DATA-NORM-TRANS-004/005';
  end if;

  if exists (
    select 1
    from data_norm_trans_006_activation_plan
    where current_status in ('REJECTED_FOR_IDENTITY', 'NON_UNIQUE_DISCOVERY_ONLY')
      and max_allowed_mode <> 'OBSERVE_ONLY'
  ) then
    raise exception 'Rejected or discovery-only identity policies cannot be promoted beyond OBSERVE_ONLY';
  end if;

  if (select array_agg(cohort_percent order by stage_order)
      from data_norm_trans_006_rollout_stage
      where environment_key = 'PRODUCTION' and business_effect)
     <> array[5,25,50,100] then
    raise exception 'Production effect cohorts must progress exactly through 5, 25, 50 and 100 percent';
  end if;
end
$$;

select
  activation_order,
  activation_plan_id,
  policy_coordinate,
  current_status,
  current_mode,
  max_allowed_mode,
  first_future_stage,
  first_future_mode,
  production_effect_allowed,
  enforce_eligible,
  blocked_by
from data_norm_trans_006_activation_plan
order by activation_order;

select
  stage_order,
  stage_key,
  environment_key,
  cohort_percent,
  business_effect,
  exit_gate
from data_norm_trans_006_rollout_stage
order by stage_order;

rollback;
