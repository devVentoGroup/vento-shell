-- DATA-NORM-BACKFILL-PLAN-005@1.0.0
-- Manifiesto ejecutable y read-only para DATA-NORM-TRANS-005.
-- No modifica objetos persistentes ni datos: toda estructura es temporal y la transaccion termina en ROLLBACK.

begin;

create temporary table data_norm_trans_005_backfill_plan (
  execution_order integer not null,
  backfill_plan_id text primary key,
  domain_key text not null,
  source_scope text not null,
  observed_item_count integer,
  count_basis text not null,
  backfill_mode text not null,
  mapping_mode text not null,
  source_cut_strategy text not null,
  chunk_size integer not null check (chunk_size > 0),
  deterministic_order text not null,
  target_effect text not null,
  plan_status text not null,
  rollback_class text not null,
  blocked_by text not null
) on commit drop;

insert into data_norm_trans_005_backfill_plan values
  (10, 'DNT005-UOM-GOUDA-MERGE-V1',
    'INVENTORY_UOM',
    'public.product_uom_profiles / Queso Gouda / general / Empaque / 1 un -> 10 un',
    2, 'EXACT_MEMBERS_FROM_APPROVED_CASE',
    'APPROVED_MERGE_PLAN', 'EXACT_CONTRACT_MAPPING', 'QUIESCED_SNAPSHOT', 1,
    'product_id, usage_context, id',
    'crosswalk + remap authorized live references + deactivate non-survivor',
    'READY_CONDITIONAL_REVALIDATION', 'REVERSIBLE_THEN_COMPENSATABLE',
    'current member versions, full reference inventory, writer freeze and R approval'),
  (20, 'DNT005-UOM-STRUCTURAL-DERIVATION-V1',
    'INVENTORY_UOM',
    'public.product_uom_profiles + public.product_request_policies',
    2312, 'HISTORICAL_AUDIT_CUT',
    'VERSIONED_TRANSFORMATION', 'STRUCTURED_COMPONENT_MAPPING', 'HIGH_WATERMARK_PLUS_DELTA', 250,
    'product_id, usage_context, id',
    'derive structural comparison representation without source mutation',
    'BLOCKED_TARGET_AND_WRITERS', 'REBUILD_DERIVATION',
    'physical target contract and SUPA-TRANS-008 writer/delta strategy'),
  (30, 'DNT005-INVENTORY-POSITION-SCOPE-V1',
    'INVENTORY_LOCATIONS',
    '72 active positions named Nivel 1 through Nivel 6',
    72, 'APPROVED_FALSE_POSITIVE_CORPUS',
    'VERSIONED_TRANSFORMATION', 'DERIVE_WITHOUT_SOURCE_MUTATION', 'HIGH_WATERMARK_PLUS_DELTA', 50,
    'site_id, location_id, parent_position_id, code, id',
    'derive hierarchical scope representation; preserve name and identity',
    'BLOCKED_TARGET_AND_WRITERS', 'REBUILD_DERIVATION',
    'physical target contract and SUPA-TRANS-008 writer/delta strategy'),
  (40, 'DNT005-SEARCH-REPRESENTATIONS-V1',
    'CROSS_DOMAIN_SEARCH',
    '4,030 historically audited eligible rows across approved entity cuts',
    4030, 'HISTORICAL_AUDIT_CUT',
    'VERSIONED_TRANSFORMATION', 'DERIVE_WITHOUT_SOURCE_MUTATION', 'HIGH_WATERMARK_PLUS_DELTA', 250,
    'domain_key, entity_key, source_primary_key',
    'derive SEARCH_FORM_KEY and SEARCH_ACCENT_KEY separately from source value',
    'BLOCKED_TARGET_AND_WRITERS', 'REBUILD_DERIVATION',
    'physical target, complete coordinates, algorithm implementation and delta strategy'),
  (50, 'DNT005-VISIBLE-FORM-CANDIDATES-V1',
    'VISIBLE_BUSINESS_TEXT',
    'trim, repeated separators and punctuation candidate observations',
    46, 'NON_DEDUPLICATED_OBSERVATIONS_4_PLUS_32_PLUS_1_PLUS_9',
    'QUARANTINE_ONLY', 'PRESERVE_AND_DEFER', 'QUIESCED_SNAPSHOT', 100,
    'domain_key, entity_key, field_key, source_primary_key',
    'preserve source and open coordinate-specific review; no automatic correction',
    'BLOCKED_MISSING_COORDINATE', 'NO_MUTATION_TO_ROLL_BACK',
    'deduplicated row set, field class, owner, source role and approved visible form'),
  (60, 'DNT005-DICTIONARY-TOKEN-CANDIDATES-V1',
    'VISIBLE_BUSINESS_TEXT',
    'eligible exact-token candidates for maiz, clasico and frio',
    null, 'SOURCE_SCAN_REQUIRED',
    'QUARANTINE_ONLY', 'PRESERVE_AND_DEFER', 'QUIESCED_SNAPSHOT', 250,
    'dictionary_rule_id, domain_key, entity_key, field_key, source_primary_key',
    'preserve source and defer until coordinate and identity are certified',
    'BLOCKED_MISSING_COORDINATE', 'NO_MUTATION_TO_ROLL_BACK',
    'eligible source scan, field coordinates, identity decisions and approved target representation'),
  (70, 'DNT005-PASS-LIFECYCLE-PRESERVATION-V1',
    'PASS_CATALOG_AND_REQUEST_POLICIES',
    '8 catalog pairs plus 2 request-policy pairs',
    20, 'APPROVED_LIFECYCLE_ROWS',
    'NO_BACKFILL_REQUIRED', 'PRESERVE_AND_DEFER', 'QUIESCED_SNAPSHOT', 20,
    'site_id, product_id, validity, id',
    'preserve active/inactive history without consolidation',
    'CERTIFIED_NO_DATA_MUTATION', 'NO_MUTATION_TO_ROLL_BACK',
    'none for preservation; future temporal uniqueness remains separately gated'),
  (80, 'DNT005-PERSON-NAME-PRESERVATION-V1',
    'IDENTITY_AND_WORKFORCE',
    '106 representations and 24 normalized-name groups',
    106, 'APPROVED_PERSON_CORPUS',
    'NO_BACKFILL_REQUIRED', 'PRESERVE_AND_DEFER', 'QUIESCED_SNAPSHOT', 100,
    'source_system, stable_identity_link, id',
    'preserve names; never derive person identity from normalized text',
    'CERTIFIED_NO_DATA_MUTATION', 'NO_MUTATION_TO_ROLL_BACK',
    'none for name preservation; identity backfills require separate authorized scope'),
  (90, 'DNT005-OPEN-IDENTITY-BLOCKERS-V1',
    'PRODUCT_AND_REMITTANCE_IDENTITY',
    'Chai, Latte Frio, Choco Bites and VIVERES category cases',
    8, 'SIX_PRODUCT_ROWS_PLUS_TWO_CATEGORY_ROWS',
    'QUARANTINE_ONLY', 'ESCALATE_STRUCTURAL_OR_IDENTITY', 'QUIESCED_SNAPSHOT', 8,
    'collision_case_id, member_id',
    'preserve all members and exclude them from mutation and uniqueness activation',
    'BLOCKED_IDENTITY_AUTHORITY', 'NO_MUTATION_TO_ROLL_BACK',
    'domain authority, complete relations, facts, routing and superseding decision');

do $$
declare
  total_rows integer;
  merge_rows integer;
begin
  select count(*), count(*) filter (where backfill_mode = 'APPROVED_MERGE_PLAN')
    into total_rows, merge_rows
  from data_norm_trans_005_backfill_plan;

  if total_rows <> 9 then
    raise exception 'DATA-NORM-TRANS-005 produced % units; expected 9', total_rows;
  end if;

  if merge_rows <> 1 then
    raise exception 'DATA-NORM-TRANS-005 requires exactly one approved merge plan; found %', merge_rows;
  end if;

  if exists (
    select 1
    from data_norm_trans_005_backfill_plan
    where backfill_mode not in (
      'NO_BACKFILL_REQUIRED',
      'VERSIONED_TRANSFORMATION',
      'APPROVED_MERGE_PLAN',
      'QUARANTINE_ONLY'
    )
  ) then
    raise exception 'DATA-NORM-TRANS-005 contains an unsupported backfill mode';
  end if;

  if exists (
    select 1
    from data_norm_trans_005_backfill_plan
    where plan_status in ('EXECUTING', 'EXECUTED', 'COMPLETED')
  ) then
    raise exception 'DATA-NORM-TRANS-005 cannot claim physical execution in E3';
  end if;

  if exists (
    select 1
    from data_norm_trans_005_backfill_plan
    where backfill_plan_id in (
      'DNT005-VISIBLE-FORM-CANDIDATES-V1',
      'DNT005-DICTIONARY-TOKEN-CANDIDATES-V1',
      'DNT005-OPEN-IDENTITY-BLOCKERS-V1'
    )
      and backfill_mode <> 'QUARANTINE_ONLY'
  ) then
    raise exception 'Blocked candidates must remain quarantine-only';
  end if;
end
$$;

select
  execution_order,
  backfill_plan_id,
  domain_key,
  source_scope,
  observed_item_count,
  count_basis,
  backfill_mode,
  mapping_mode,
  source_cut_strategy,
  chunk_size,
  deterministic_order,
  target_effect,
  plan_status,
  rollback_class,
  blocked_by
from data_norm_trans_005_backfill_plan
order by execution_order;

rollback;
