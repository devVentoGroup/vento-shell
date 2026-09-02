-- AUTH-DB-034::CORR-001
-- Restores AuthorizationDecision.audit contract conformance without rewriting
-- the historical AUTH-DB-034 migration or changing authorization semantics.
-- No AuthorizationDecision is persisted by this correction.
-- No legacy policy, role, grant or Data API exposure is changed.

begin;

do $auth_db_034_corr_001_preconditions$
begin
  if not exists (
    select 1
    from pg_catalog.pg_roles r
    where r.rolname = 'vento_authorization_owner'
      and not r.rolcanlogin
      and not r.rolinherit
      and not r.rolsuper
      and not r.rolcreatedb
      and not r.rolcreaterole
      and not r.rolreplication
      and not r.rolbypassrls
  ) then
    raise exception 'AUTH_DB_034_CORR_001_OWNER_MISSING_OR_UNSAFE';
  end if;

  if pg_catalog.to_regprocedure(
       'app_private.evaluate_authorization(jsonb)'
     ) is null
     or pg_catalog.to_regprocedure(
       'app_private.evaluate_authorization_core(jsonb,jsonb,uuid,timestamptz,text[],integer)'
     ) is null
     or pg_catalog.to_regprocedure(
       'app_private.validate_authorization_evaluation_request(jsonb)'
     ) is null
     or pg_catalog.to_regprocedure(
       'app_private.get_access_context(text)'
     ) is null
     or pg_catalog.to_regprocedure(
       'extensions.gen_random_uuid()'
     ) is null then
    raise exception 'AUTH_DB_034_CORR_001_REQUIRED_GRAPH_MISSING';
  end if;

  if not exists (
    select 1
    from pg_catalog.pg_proc p
    where p.oid =
      'app_private.evaluate_authorization(jsonb)'::regprocedure
      and pg_catalog.pg_get_userbyid(p.proowner) =
          'vento_authorization_owner'
      and p.provolatile = 'v'
      and p.prosecdef
      and p.proconfig @>
          array[
            'search_path=pg_catalog, app_private'
          ]::text[]
  ) then
    raise exception 'AUTH_DB_034_CORR_001_ISSUER_BASELINE_DRIFT';
  end if;
end
$auth_db_034_corr_001_preconditions$;

set local role vento_authorization_owner;

create or replace function
  app_private.evaluate_authorization(
    p_evaluation_request jsonb
  )
returns jsonb
language plpgsql
volatile
security definer
set search_path = pg_catalog, app_private
as $auth_db_034_corr_001_evaluate$
declare
  v_validated jsonb;
  v_context jsonb;
  v_app_code text;
  v_decision_id uuid;
  v_decided_at timestamptz;
  v_decision jsonb;
  v_dataset_evidence jsonb;
  v_dataset_hashes jsonb;
  v_resource_ids jsonb;
  v_authorizing_lanes jsonb;
  v_audit jsonb;
begin
  v_validated :=
    app_private.validate_authorization_evaluation_request(
      p_evaluation_request
    );

  v_app_code :=
    v_validated #>>
      '{request,app_code}';

  v_context :=
    app_private.get_access_context(
      v_app_code
    );

  v_decision_id :=
    extensions.gen_random_uuid();

  v_decided_at :=
    pg_catalog.statement_timestamp();

  v_decision :=
    app_private.evaluate_authorization_core(
      v_validated,
      v_context,
      v_decision_id,
      v_decided_at,
      '{}'::text[],
      0
    );

  v_dataset_evidence :=
    case
      when pg_catalog.jsonb_typeof(
             v_decision #>
               '{audit,dataset_evidence}'
           ) = 'array'
      then v_decision #>
             '{audit,dataset_evidence}'
      else '[]'::jsonb
    end;

  if pg_catalog.jsonb_typeof(
       v_decision #>
         '{audit,dataset_hashes}'
     ) = 'object' then
    v_dataset_hashes :=
      v_decision #>
        '{audit,dataset_hashes}';
  else
    select coalesce(
      pg_catalog.jsonb_object_agg(
        row_data.dataset_key,
        row_data.dataset_fingerprint
        order by row_data.dataset_key
      ),
      '{}'::jsonb
    )
    into v_dataset_hashes
    from (
      select distinct
        item ->> 'dataset_key'
          as dataset_key,
        item ->> 'dataset_fingerprint'
          as dataset_fingerprint
      from pg_catalog.jsonb_array_elements(
        v_dataset_evidence
      ) as evidence(item)
      where pg_catalog.jsonb_typeof(item) =
            'object'
        and nullif(
              item ->> 'dataset_key',
              ''
            ) is not null
        and nullif(
              item ->> 'dataset_fingerprint',
              ''
            ) is not null
    ) as row_data;
  end if;

  select coalesce(
    pg_catalog.jsonb_agg(
      candidate.resource_id
      order by candidate.resource_id
    ),
    '[]'::jsonb
  )
  into v_resource_ids
  from (
    select distinct raw.resource_id
    from (
      select ids.resource_id
      from pg_catalog.jsonb_array_elements_text(
        case
          when pg_catalog.jsonb_typeof(
                 v_decision #>
                   '{resource,resource_ids}'
               ) = 'array'
          then v_decision #>
                 '{resource,resource_ids}'
          when pg_catalog.jsonb_typeof(
                 v_decision #>
                   '{resource,safe_resource_reference,resource_ids}'
               ) = 'array'
          then v_decision #>
                 '{resource,safe_resource_reference,resource_ids}'
          else '[]'::jsonb
        end
      ) as ids(resource_id)

      union all

      select
        v_decision #>>
          '{resource,resource_id}'

      union all

      select
        v_decision #>>
          '{resource,safe_resource_reference,resource_id}'
    ) as raw
    where nullif(
            raw.resource_id,
            ''
          ) is not null
  ) as candidate;

  select coalesce(
    pg_catalog.jsonb_agg(
      lane.lane
      order by lane.lane
    ),
    '[]'::jsonb
  )
  into v_authorizing_lanes
  from (
    select 'BASE'::text as lane
    where v_decision ->>
            'final_decision' =
          'ALLOW'
      and v_decision #>>
            '{base_decision,outcome}' =
          'ALLOW'

    union all

    select 'OPERATIONAL'::text as lane
    where v_decision ->>
            'final_decision' =
          'ALLOW'
      and v_decision #>>
            '{operational_decision,outcome}' =
          'ALLOW'
  ) as lane;

  v_audit :=
    coalesce(
      v_decision -> 'audit',
      '{}'::jsonb
    )
    ||
    pg_catalog.jsonb_build_object(
      'decision_id',
      v_decision ->> 'decision_id',
      'correlation_id',
      v_decision -> 'correlation_id',
      'actor_id',
      v_context #>>
        '{actor_effective,actor_id}',
      'principal_id',
      v_context #>>
        '{principal,auth_user_id}',
      'device_id',
      v_context #>>
        '{device_context,device_id}',
      'app_code',
      v_decision #>>
        '{request,app_code}',
      'permission_key',
      v_decision #>>
        '{request,permission_key}',
      'resource_type',
      v_decision #>>
        '{resource,resource_type}',
      'resource_ids',
      v_resource_ids,
      'outcome',
      v_decision ->>
        'final_decision',
      'authorizing_lanes',
      v_authorizing_lanes,
      'context_fingerprint',
      coalesce(
        v_decision #>>
          '{access_context_ref,context_fingerprint}',
        v_decision #>>
          '{audit,context_fingerprint}'
      ),
      'resource_fingerprint',
      coalesce(
        v_decision #>>
          '{resource,resource_fingerprint}',
        v_decision #>>
          '{audit,resource_fingerprint}'
      ),
      'catalog_hash',
      coalesce(
        v_decision #>>
          '{audit,catalog_hash}',
        v_decision #>>
          '{audit,contract_release_hash}'
      ),
      'dataset_hashes',
      v_dataset_hashes,
      'evaluator_name',
      'vento.authorization.evaluate_authorization',
      'evaluator_version',
      '20260901230518'
    );

  return pg_catalog.jsonb_set(
    v_decision,
    array['audit'],
    v_audit,
    true
  );
end
$auth_db_034_corr_001_evaluate$;

reset role;

commit;