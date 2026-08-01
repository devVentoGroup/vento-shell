-- DATA-NORM-ROLLBACK-PLAN-008@1.0.0
-- Manifiesto ejecutable y read-only para DATA-NORM-TRANS-008.
-- No ejecuta rollback ni toca datos persistentes; usa tablas temporales y termina en ROLLBACK.

begin;

create temporary table data_norm_trans_008_recovery_class (
  recovery_class text primary key,
  before_point_of_no_return text not null,
  after_point_of_no_return text not null,
  preserves_history boolean not null,
  allows_blind_source_overwrite boolean not null
) on commit drop;

insert into data_norm_trans_008_recovery_class values
  ('REVERSIBLE_THEN_COMPENSATABLE',
    'transaction abort or exact reverse-delta with crosswalk',
    'forward compensation with domain decision and reconciliation',
    true, false),
  ('REBUILD_DERIVATION',
    'suspend candidate, route to compatible prior version and rebuild',
    'same rebuild strategy while authoritative source remains intact',
    true, false),
  ('NO_MUTATION_TO_ROLL_BACK',
    'close, suspend or supersede run/review without business DML',
    'any detected mutation becomes a recovery incident',
    true, false),
  ('ESCALATE_RECOVERY',
    'stop before unsafe recovery',
    'selective restore, compensation or extraordinary PITR by blast radius',
    true, false);

create temporary table data_norm_trans_008_rollback_plan (
  rollback_order integer not null,
  rollback_plan_id text primary key,
  backfill_plan_id text unique not null,
  validation_plan_id text unique not null,
  domain_key text not null,
  recovery_class text not null references data_norm_trans_008_recovery_class(recovery_class),
  point_of_no_return text not null,
  primary_recovery text not null,
  current_status text not null,
  physical_change_observed boolean not null,
  drill_pass_claimed boolean not null,
  rollback_pass_claimed boolean not null,
  blocked_by text not null
) on commit drop;

insert into data_norm_trans_008_rollback_plan values
  (10, 'DNT008-UOM-GOUDA-MERGE-V1',
    'DNT005-UOM-GOUDA-MERGE-V1', 'DNT007-UOM-GOUDA-MERGE-V1', 'INVENTORY_UOM',
    'REVERSIBLE_THEN_COMPENSATABLE',
    'first new fact that cannot be assigned unambiguously to either prior profile',
    'abort or exact reverse-delta before; preserve crosswalk and compensate after',
    'BLOCKED_INPUT_MISSING', false, false, false,
    'no physical merge, before-image manifest, reverse-delta or drill'),
  (20, 'DNT008-UOM-STRUCTURAL-V1',
    'DNT005-UOM-STRUCTURAL-DERIVATION-V1', 'DNT007-UOM-STRUCTURAL-V1', 'INVENTORY_UOM',
    'REBUILD_DERIVATION',
    'none while authoritative source remains intact and versioned',
    'suspend candidate, route back and rebuild prior structural derivation',
    'BLOCKED_INPUT_MISSING', false, false, false,
    'no materialized target, prior compatible version or drill'),
  (30, 'DNT008-POSITION-SCOPE-V1',
    'DNT005-INVENTORY-POSITION-SCOPE-V1', 'DNT007-POSITION-SCOPE-V1', 'INVENTORY_LOCATIONS',
    'REBUILD_DERIVATION',
    'none while authoritative hierarchy remains intact and versioned',
    'route back and rebuild by site, location, parent and code',
    'BLOCKED_INPUT_MISSING', false, false, false,
    'no materialized target, prior compatible version or drill'),
  (40, 'DNT008-SEARCH-REPRESENTATIONS-V1',
    'DNT005-SEARCH-REPRESENTATIONS-V1', 'DNT007-SEARCH-REPRESENTATIONS-V1', 'CROSS_DOMAIN_SEARCH',
    'REBUILD_DERIVATION',
    'none while source, corpus and algorithm versions remain intact',
    'remove candidate from reads and rebuild prior search derivations/indexes',
    'BLOCKED_INPUT_MISSING', false, false, false,
    'no materialized derivation, prior compatible version or drill'),
  (50, 'DNT008-VISIBLE-FORM-QUARANTINE-V1',
    'DNT005-VISIBLE-FORM-CANDIDATES-V1', 'DNT007-VISIBLE-FORM-QUARANTINE-V1', 'VISIBLE_BUSINESS_TEXT',
    'NO_MUTATION_TO_ROLL_BACK',
    'not applicable',
    'supersede or close run and preserve source and cases',
    'BLOCKED_INPUT_MISSING', false, false, false,
    'no quarantine run or no-mutation evidence'),
  (60, 'DNT008-DICTIONARY-QUARANTINE-V1',
    'DNT005-DICTIONARY-TOKEN-CANDIDATES-V1', 'DNT007-DICTIONARY-QUARANTINE-V1', 'VISIBLE_BUSINESS_TEXT',
    'NO_MUTATION_TO_ROLL_BACK',
    'not applicable',
    'suspend proposal or reprocess without touching source',
    'BLOCKED_INPUT_MISSING', false, false, false,
    'no candidate run or no-mutation evidence'),
  (70, 'DNT008-PASS-PRESERVATION-V1',
    'DNT005-PASS-LIFECYCLE-PRESERVATION-V1', 'DNT007-PASS-PRESERVATION-V1', 'PASS_CATALOG_AND_REQUEST_POLICIES',
    'NO_MUTATION_TO_ROLL_BACK',
    'not applicable',
    'certify no mutation; escalate any unauthorized state or validity change',
    'BLOCKED_INPUT_MISSING', false, false, false,
    'no after snapshot or no-mutation evidence'),
  (80, 'DNT008-PERSON-PRESERVATION-V1',
    'DNT005-PERSON-NAME-PRESERVATION-V1', 'DNT007-PERSON-PRESERVATION-V1', 'IDENTITY_AND_WORKFORCE',
    'NO_MUTATION_TO_ROLL_BACK',
    'not applicable',
    'certify no mutation; recover only through stable authorized identity',
    'BLOCKED_INPUT_MISSING', false, false, false,
    'no after snapshot or negative textual-identity evidence'),
  (90, 'DNT008-IDENTITY-BLOCKERS-V1',
    'DNT005-OPEN-IDENTITY-BLOCKERS-V1', 'DNT007-IDENTITY-BLOCKERS-V1', 'PRODUCT_AND_REMITTANCE_IDENTITY',
    'NO_MUTATION_TO_ROLL_BACK',
    'not applicable',
    'preserve eight members and cases; escalate any unauthorized merge',
    'BLOCKED_INPUT_MISSING', false, false, false,
    'no after snapshot or zero-effect evidence');

do $$
declare
  class_count integer;
  unit_count integer;
begin
  select count(*) into class_count
  from data_norm_trans_008_recovery_class;

  select count(*) into unit_count
  from data_norm_trans_008_rollback_plan;

  if class_count <> 4 then
    raise exception 'DATA-NORM-TRANS-008 produced % recovery classes; expected 4', class_count;
  end if;

  if unit_count <> 9 then
    raise exception 'DATA-NORM-TRANS-008 produced % rollback units; expected 9', unit_count;
  end if;

  if exists (
    select 1
    from data_norm_trans_008_recovery_class
    where not preserves_history or allows_blind_source_overwrite
  ) then
    raise exception 'Every recovery class must preserve history and prohibit blind source overwrite';
  end if;

  if exists (
    select 1
    from data_norm_trans_008_rollback_plan
    where physical_change_observed
       or drill_pass_claimed
       or rollback_pass_claimed
       or current_status in ('READY_FOR_DRILL', 'DRILL_PASS', 'ROLLBACK_PASS', 'FORWARD_RECOVERY_PASS')
  ) then
    raise exception 'DATA-NORM-TRANS-008 cannot claim physical change, drill or rollback success in E3';
  end if;

  if (select count(*) from data_norm_trans_008_rollback_plan
      where recovery_class = 'REVERSIBLE_THEN_COMPENSATABLE') <> 1 then
    raise exception 'Exactly one unit, Gouda, must be reversible then compensatable';
  end if;

  if (select count(*) from data_norm_trans_008_rollback_plan
      where recovery_class = 'REBUILD_DERIVATION') <> 3 then
    raise exception 'Exactly three units must rebuild derivations';
  end if;

  if (select count(*) from data_norm_trans_008_rollback_plan
      where recovery_class = 'NO_MUTATION_TO_ROLL_BACK') <> 5 then
    raise exception 'Exactly five units must have no authorized business mutation to roll back';
  end if;
end
$$;

select
  recovery_class,
  before_point_of_no_return,
  after_point_of_no_return,
  preserves_history,
  allows_blind_source_overwrite
from data_norm_trans_008_recovery_class
order by recovery_class;

select
  rollback_order,
  rollback_plan_id,
  backfill_plan_id,
  validation_plan_id,
  domain_key,
  recovery_class,
  point_of_no_return,
  primary_recovery,
  current_status,
  physical_change_observed,
  drill_pass_claimed,
  rollback_pass_claimed,
  blocked_by
from data_norm_trans_008_rollback_plan
order by rollback_order;

rollback;
