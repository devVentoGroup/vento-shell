-- DATA-NORM-TRANS-009
-- Manifiesto read-only del contrato de evidencia de aprobación por dominio.
-- No concede aprobaciones ni modifica objetos persistentes.

begin;

create temp table data_norm_trans_009_evidence_gate (
  gate_order integer primary key,
  gate_key text unique not null,
  evidence_required text not null,
  current_status text not null check (current_status in ('PASS_DOCUMENTAL', 'MISSING_NOT_EXECUTED')),
  is_operational boolean not null
) on commit drop;

insert into data_norm_trans_009_evidence_gate values
  (10,  'DESIGN_CHAIN_001_008',              'Tareas 001..008 aprobadas, artefactos y trazabilidad',                                'PASS_DOCUMENTAL',     false),
  (20,  'PHYSICAL_PACKAGE_AND_MIGRATIONS',   'Migraciones reales, checksums, orden y candidato',                                    'MISSING_NOT_EXECUTED', true),
  (30,  'BASELINE_DRYRUN_COLLISIONS',        'Baseline, dry-run y colisiones recalculados en el entorno objetivo',                  'MISSING_NOT_EXECUTED', true),
  (40,  'BACKFILL_AND_OUTCOMES',             'Lotes, resultados y reconciliacion',                                                  'MISSING_NOT_EXECUTED', true),
  (50,  'ACTIVATION_AND_WRITERS',            'Etapa activa, versiones y cobertura de writers',                                     'MISSING_NOT_EXECUTED', true),
  (60,  'POST_BACKFILL_VALIDATION',          'Siete carriles de validacion por unidad y consumidor',                               'MISSING_NOT_EXECUTED', true),
  (70,  'SECURITY_RLS_GRANTS',               'RLS, grants, roles, privacidad y pruebas positivas/negativas',                        'MISSING_NOT_EXECUTED', true),
  (80,  'PERFORMANCE_AND_OPERABILITY',       'Planes, latencia, locks, observabilidad y capacidad',                                 'MISSING_NOT_EXECUTED', true),
  (90,  'ROLLBACK_DRILL',                    'Clase de recuperacion, ensayo, RPO/RTO y verificacion',                                'MISSING_NOT_EXECUTED', true),
  (100, 'ENVIRONMENT_PARITY_AND_SIGNOFF',    'Paridad local/CI/staging/produccion y firmas vigentes',                               'MISSING_NOT_EXECUTED', true);

create temp table data_norm_trans_009_domain_package (
  package_order integer primary key,
  bundle_id text unique not null,
  domain_key text unique not null,
  declared_unit_count integer not null check (declared_unit_count > 0),
  required_authorities text not null,
  current_readiness text not null check (current_readiness = 'DESIGN_EVIDENCE_COMPLETE_OPERATIONAL_BLOCKED'),
  operational_approval_claimed boolean not null default false,
  staging_approval_claimed boolean not null default false,
  production_approval_claimed boolean not null default false,
  blocked_by text not null
) on commit drop;

insert into data_norm_trans_009_domain_package values
  (10, 'DNE-009-INVENTORY-UOM',       'INVENTORY_UOM',                    2, 'DOMAIN_OWNER,DATA_STEWARD,PLATFORM_DATABASE_OWNER,SECURITY_PRIVACY_OWNER,CONSUMER_OWNER', 'DESIGN_EVIDENCE_COMPLETE_OPERATIONAL_BLOCKED', false, false, false, 'PHYSICAL_PACKAGE_AND_MIGRATIONS'),
  (20, 'DNE-009-INVENTORY-LOCATIONS', 'INVENTORY_LOCATIONS',              1, 'DOMAIN_OWNER,DATA_STEWARD,PLATFORM_DATABASE_OWNER,SECURITY_PRIVACY_OWNER,CONSUMER_OWNER', 'DESIGN_EVIDENCE_COMPLETE_OPERATIONAL_BLOCKED', false, false, false, 'PHYSICAL_PACKAGE_AND_MIGRATIONS'),
  (30, 'DNE-009-CROSS-SEARCH',        'CROSS_DOMAIN_SEARCH',              1, 'DOMAIN_OWNER,DATA_STEWARD,PLATFORM_DATABASE_OWNER,SECURITY_PRIVACY_OWNER,CONSUMER_OWNER,QA_PERFORMANCE_OWNER', 'DESIGN_EVIDENCE_COMPLETE_OPERATIONAL_BLOCKED', false, false, false, 'PHYSICAL_PACKAGE_AND_MIGRATIONS'),
  (40, 'DNE-009-VISIBLE-TEXT',        'VISIBLE_BUSINESS_TEXT',            2, 'DOMAIN_OWNER,DATA_STEWARD,SECURITY_PRIVACY_OWNER,CONSUMER_OWNER', 'DESIGN_EVIDENCE_COMPLETE_OPERATIONAL_BLOCKED', false, false, false, 'PHYSICAL_PACKAGE_AND_MIGRATIONS'),
  (50, 'DNE-009-PASS',                'PASS_CATALOG_AND_REQUEST_POLICIES', 1, 'DOMAIN_OWNER,DATA_STEWARD,PLATFORM_DATABASE_OWNER,SECURITY_PRIVACY_OWNER,CONSUMER_OWNER', 'DESIGN_EVIDENCE_COMPLETE_OPERATIONAL_BLOCKED', false, false, false, 'PHYSICAL_PACKAGE_AND_MIGRATIONS'),
  (60, 'DNE-009-IDENTITY-WORKFORCE',  'IDENTITY_AND_WORKFORCE',           1, 'DOMAIN_OWNER,DATA_STEWARD,PLATFORM_DATABASE_OWNER,SECURITY_PRIVACY_OWNER,CONSUMER_OWNER', 'DESIGN_EVIDENCE_COMPLETE_OPERATIONAL_BLOCKED', false, false, false, 'PHYSICAL_PACKAGE_AND_MIGRATIONS'),
  (70, 'DNE-009-PRODUCT-REMITTANCE',  'PRODUCT_AND_REMITTANCE_IDENTITY',  1, 'DOMAIN_OWNER,DATA_STEWARD,PLATFORM_DATABASE_OWNER,SECURITY_PRIVACY_OWNER,CONSUMER_OWNER', 'DESIGN_EVIDENCE_COMPLETE_OPERATIONAL_BLOCKED', false, false, false, 'PHYSICAL_PACKAGE_AND_MIGRATIONS');

create temp table data_norm_trans_009_unit_link (
  unit_order integer primary key,
  unit_id text unique not null,
  domain_key text not null references data_norm_trans_009_domain_package(domain_key),
  validation_unit_id text unique not null,
  rollback_unit_id text unique not null
) on commit drop;

insert into data_norm_trans_009_unit_link values
  (10, 'GOUDA_ALIAS_MERGE',          'INVENTORY_UOM',                    'DNT007-UOM-GOUDA-MERGE-V1',          'DNT008-UOM-GOUDA-MERGE-V1'),
  (20, 'UOM_STRUCTURAL_DERIVATION',  'INVENTORY_UOM',                    'DNT007-UOM-STRUCTURAL-V1',           'DNT008-UOM-STRUCTURAL-V1'),
  (30, 'INVENTORY_POSITION_SCOPE',   'INVENTORY_LOCATIONS',              'DNT007-POSITION-SCOPE-V1',           'DNT008-POSITION-SCOPE-V1'),
  (40, 'SEARCH_REPRESENTATIONS',     'CROSS_DOMAIN_SEARCH',              'DNT007-SEARCH-REPRESENTATIONS-V1',   'DNT008-SEARCH-REPRESENTATIONS-V1'),
  (50, 'VISIBLE_FORM_CANDIDATES',    'VISIBLE_BUSINESS_TEXT',            'DNT007-VISIBLE-FORM-QUARANTINE-V1', 'DNT008-VISIBLE-FORM-QUARANTINE-V1'),
  (60, 'DICTIONARY_CANDIDATES',      'VISIBLE_BUSINESS_TEXT',            'DNT007-DICTIONARY-QUARANTINE-V1',   'DNT008-DICTIONARY-QUARANTINE-V1'),
  (70, 'PASS_LIFECYCLE_PRESERVATION','PASS_CATALOG_AND_REQUEST_POLICIES', 'DNT007-PASS-PRESERVATION-V1',        'DNT008-PASS-PRESERVATION-V1'),
  (80, 'PERSON_NAME_PRESERVATION',   'IDENTITY_AND_WORKFORCE',           'DNT007-PERSON-PRESERVATION-V1',      'DNT008-PERSON-PRESERVATION-V1'),
  (90, 'OPEN_IDENTITY_BLOCKERS',     'PRODUCT_AND_REMITTANCE_IDENTITY',  'DNT007-IDENTITY-BLOCKERS-V1',        'DNT008-IDENTITY-BLOCKERS-V1');

do $assertions$
declare
  actual integer;
begin
  select count(*) into actual from data_norm_trans_009_evidence_gate;
  if actual <> 10 then raise exception 'Expected 10 evidence gates, got %', actual; end if;

  select count(*) into actual from data_norm_trans_009_domain_package;
  if actual <> 7 then raise exception 'Expected 7 domain packages, got %', actual; end if;

  select count(*) into actual from data_norm_trans_009_unit_link;
  if actual <> 9 then raise exception 'Expected 9 unit links, got %', actual; end if;

  select count(*) into actual
  from data_norm_trans_009_domain_package p
  left join (
    select domain_key, count(*) as actual_unit_count
    from data_norm_trans_009_unit_link
    group by domain_key
  ) u using (domain_key)
  where p.declared_unit_count <> coalesce(u.actual_unit_count, 0);
  if actual <> 0 then raise exception 'Declared unit counts do not match links for % packages', actual; end if;

  select count(*) into actual
  from data_norm_trans_009_domain_package
  where operational_approval_claimed or staging_approval_claimed or production_approval_claimed;
  if actual <> 0 then raise exception 'Found % false operational approval claims', actual; end if;

  select count(*) into actual
  from data_norm_trans_009_evidence_gate
  where not is_operational and current_status = 'PASS_DOCUMENTAL';
  if actual <> 1 then raise exception 'Expected exactly one documentary PASS, got %', actual; end if;

  select count(*) into actual
  from data_norm_trans_009_evidence_gate
  where is_operational and current_status <> 'MISSING_NOT_EXECUTED';
  if actual <> 0 then raise exception 'Found % operational gates with a false pass', actual; end if;

  select count(*) into actual
  from data_norm_trans_009_domain_package p
  where not exists (
    select 1 from data_norm_trans_009_evidence_gate g where g.gate_key = p.blocked_by and g.is_operational
  );
  if actual <> 0 then raise exception 'Found % packages without a valid operational blocker', actual; end if;
end
$assertions$;

select gate_order, gate_key, current_status, is_operational
from data_norm_trans_009_evidence_gate
order by gate_order;

select package_order, bundle_id, domain_key, declared_unit_count, current_readiness,
       operational_approval_claimed, staging_approval_claimed, production_approval_claimed
from data_norm_trans_009_domain_package
order by package_order;

select unit_order, unit_id, domain_key, validation_unit_id, rollback_unit_id
from data_norm_trans_009_unit_link
order by unit_order;

rollback;
