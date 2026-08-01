-- SUPA-TRANS-016
-- Manifiesto read-only de la puerta final de transición antes de BLOQUE R.
-- Valida la forma declarativa de la decisión propuesta; el estado real de los
-- Markdown se verifica con docs:plan:check. No concede permisos ni modifica
-- objetos persistentes.

begin;

create temporary table supa_trans_016_predecessor (
  task_order integer primary key,
  task_id text unique not null,
  task_family text not null check (task_family in ('SUPA_TRANSITION', 'DATA_NORMALIZATION_TRANSITION')),
  documentary_state text not null check (documentary_state = 'APROBADA')
) on commit drop;

insert into supa_trans_016_predecessor values
  (10,  'SUPA-TRANS-001', 'SUPA_TRANSITION', 'APROBADA'),
  (20,  'SUPA-TRANS-002', 'SUPA_TRANSITION', 'APROBADA'),
  (30,  'SUPA-TRANS-003', 'SUPA_TRANSITION', 'APROBADA'),
  (40,  'SUPA-TRANS-004', 'SUPA_TRANSITION', 'APROBADA'),
  (50,  'SUPA-TRANS-005', 'SUPA_TRANSITION', 'APROBADA'),
  (60,  'SUPA-TRANS-006', 'SUPA_TRANSITION', 'APROBADA'),
  (70,  'SUPA-TRANS-007', 'SUPA_TRANSITION', 'APROBADA'),
  (80,  'SUPA-TRANS-008', 'SUPA_TRANSITION', 'APROBADA'),
  (90,  'SUPA-TRANS-009', 'SUPA_TRANSITION', 'APROBADA'),
  (100, 'SUPA-TRANS-010', 'SUPA_TRANSITION', 'APROBADA'),
  (110, 'SUPA-TRANS-011', 'SUPA_TRANSITION', 'APROBADA'),
  (120, 'SUPA-TRANS-012', 'SUPA_TRANSITION', 'APROBADA'),
  (130, 'SUPA-TRANS-013', 'SUPA_TRANSITION', 'APROBADA'),
  (140, 'SUPA-TRANS-014', 'SUPA_TRANSITION', 'APROBADA'),
  (150, 'SUPA-TRANS-015', 'SUPA_TRANSITION', 'APROBADA'),
  (160, 'DATA-NORM-TRANS-001', 'DATA_NORMALIZATION_TRANSITION', 'APROBADA'),
  (170, 'DATA-NORM-TRANS-002', 'DATA_NORMALIZATION_TRANSITION', 'APROBADA'),
  (180, 'DATA-NORM-TRANS-003', 'DATA_NORMALIZATION_TRANSITION', 'APROBADA'),
  (190, 'DATA-NORM-TRANS-004', 'DATA_NORMALIZATION_TRANSITION', 'APROBADA'),
  (200, 'DATA-NORM-TRANS-005', 'DATA_NORMALIZATION_TRANSITION', 'APROBADA'),
  (210, 'DATA-NORM-TRANS-006', 'DATA_NORMALIZATION_TRANSITION', 'APROBADA'),
  (220, 'DATA-NORM-TRANS-007', 'DATA_NORMALIZATION_TRANSITION', 'APROBADA'),
  (230, 'DATA-NORM-TRANS-008', 'DATA_NORMALIZATION_TRANSITION', 'APROBADA'),
  (240, 'DATA-NORM-TRANS-009', 'DATA_NORMALIZATION_TRANSITION', 'APROBADA');

create temporary table supa_trans_016_gate_condition (
  condition_order integer primary key,
  condition_key text unique not null,
  current_status text not null check (current_status in ('PASS_DOCUMENTAL', 'BLOCKED_FUTURE_GATE', 'MISSING_NOT_EXECUTED')),
  required_for_contract_approval boolean not null,
  required_for_physical_entry boolean not null,
  evidence_summary text not null
) on commit drop;

insert into supa_trans_016_gate_condition values
  (10,  'GENERAL_TRANSITION_001_015_APPROVED',       'PASS_DOCUMENTAL',      true,  true, '15 SUPA-TRANS predecessors approved'),
  (20,  'NORMALIZATION_TRANSITION_001_009_APPROVED', 'PASS_DOCUMENTAL',      true,  true, '9 DATA-NORM-TRANS predecessors approved'),
  (30,  'TRANSITION_CONTRACT_COHERENT',              'PASS_DOCUMENTAL',      true,  true, 'roadmap, rollback, parity, contracts and evidence reconciled'),
  (40,  'POST_E3_DESIGN_STAGES_005_016_COMPLETE',    'BLOCKED_FUTURE_GATE',  false, true, 'priority-lane stages 5..16 remain pending'),
  (50,  'PACKAGE_ID_AND_SCOPE_SELECTED',             'BLOCKED_FUTURE_GATE',  false, true, 'resolved later in DELIV-PKG for an exact package_id'),
  (60,  'E5_READINESS_PLAN_001_015_COMPLETE',        'BLOCKED_FUTURE_GATE',  false, true, 'READY-GATE-001..015 remain pending'),
  (70,  'E5_CUTOVER_PLAN_001_010_COMPLETE',          'BLOCKED_FUTURE_GATE',  false, true, 'CUTOVER-OPS-001..010 remain pending'),
  (80,  'E5_HYPERCARE_PLAN_001_010_COMPLETE',        'BLOCKED_FUTURE_GATE',  false, true, 'HYPERCARE-OPS-001..010 remain pending'),
  (90,  'CI_FOUNDATION_001_019_CERTIFIED',           'BLOCKED_FUTURE_GATE',  false, true, 'SHELL-CI-001..019 not certified by this task'),
  (100, 'E5_ENTRY_GATES_001_007_APPROVED',           'BLOCKED_FUTURE_GATE',  false, true, 'E5-GATE-001..007 remain pending'),
  (110, 'E5_PACKAGE_GATE_008_APPROVED',              'BLOCKED_FUTURE_GATE',  false, true, 'E5-GATE-008::<package_id> not granted'),
  (120, 'SHELL_CI_020_EXECUTION_OPENED',             'BLOCKED_FUTURE_GATE',  false, true, 'implementation cycle not opened'),
  (130, 'LOCAL_PHYSICAL_EVIDENCE_COMPLETE',          'MISSING_NOT_EXECUTED', false, true, 'no physical implementation executed by this gate'),
  (140, 'STAGING_EVIDENCE_COMPLETE',                 'MISSING_NOT_EXECUTED', false, true, 'no staging deployment executed by this gate'),
  (150, 'PRODUCTION_EVIDENCE_COMPLETE',              'MISSING_NOT_EXECUTED', false, true, 'no production deployment executed by this gate');

create temporary table supa_trans_016_proposed_decision (
  decision_id text primary key,
  decision_outcome text not null check (decision_outcome = 'APPROVE_TRANSITION_CONTRACT_ONLY'),
  transition_design_approvable boolean not null,
  block_r_physical_entry_authorized boolean not null,
  local_migration_execution_authorized boolean not null,
  staging_deployment_authorized boolean not null,
  production_deployment_authorized boolean not null
) on commit drop;

insert into supa_trans_016_proposed_decision values
  ('ST016-PROPOSED-20260801', 'APPROVE_TRANSITION_CONTRACT_ONLY', true, false, false, false, false);

do $assertions$
declare
  actual integer;
begin
  select count(*) into actual from supa_trans_016_predecessor;
  if actual <> 24 then raise exception 'Expected 24 predecessors, got %', actual; end if;

  select count(*) into actual from supa_trans_016_predecessor where task_family = 'SUPA_TRANSITION';
  if actual <> 15 then raise exception 'Expected 15 SUPA-TRANS predecessors, got %', actual; end if;

  select count(*) into actual from supa_trans_016_predecessor where task_family = 'DATA_NORMALIZATION_TRANSITION';
  if actual <> 9 then raise exception 'Expected 9 DATA-NORM-TRANS predecessors, got %', actual; end if;

  select count(*) into actual from supa_trans_016_predecessor where documentary_state <> 'APROBADA';
  if actual <> 0 then raise exception 'Found % predecessor tasks not approved', actual; end if;

  select count(*) into actual from supa_trans_016_gate_condition;
  if actual <> 15 then raise exception 'Expected 15 gate conditions, got %', actual; end if;

  select count(*) into actual
  from supa_trans_016_gate_condition
  where required_for_contract_approval and current_status <> 'PASS_DOCUMENTAL';
  if actual <> 0 then raise exception 'Found % failing contract-approval conditions', actual; end if;

  select count(*) into actual
  from supa_trans_016_gate_condition
  where required_for_physical_entry and current_status <> 'PASS_DOCUMENTAL';
  if actual <> 12 then raise exception 'Expected 12 unresolved physical-entry conditions, got %', actual; end if;

  select count(*) into actual
  from supa_trans_016_proposed_decision
  where not transition_design_approvable
     or block_r_physical_entry_authorized
     or local_migration_execution_authorized
     or staging_deployment_authorized
     or production_deployment_authorized;
  if actual <> 0 then raise exception 'Proposed decision crosses the authorization boundary'; end if;
end
$assertions$;

select task_order, task_id, task_family, documentary_state
from supa_trans_016_predecessor
order by task_order;

select condition_order, condition_key, current_status,
       required_for_contract_approval, required_for_physical_entry
from supa_trans_016_gate_condition
order by condition_order;

select * from supa_trans_016_proposed_decision;

rollback;
