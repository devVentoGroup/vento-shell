begin;

create index if not exists pass_delivery_quotes_cleanup_idx
  on pass.delivery_quotes (used_at, expires_at, created_at);

create index if not exists pass_delivery_quotes_reuse_idx
  on pass.delivery_quotes (
    user_id,
    site_id,
    rate_id,
    used_at,
    expires_at,
    billed_distance_km,
    customer_fee_amount,
    destination_latitude,
    destination_longitude,
    created_at desc
  );

create or replace function pass.cleanup_delivery_quotes()
returns jsonb
language plpgsql
security definer
set search_path = pass, public
as $$
declare
  v_expired_unused integer := 0;
  v_old_used integer := 0;
begin
  delete from pass.delivery_quotes
  where used_at is null
    and expires_at < now()
  ;
  get diagnostics v_expired_unused = row_count;

  delete from pass.delivery_quotes
  where used_at is not null
    and used_at < now() - interval '30 days'
  ;
  get diagnostics v_old_used = row_count;

  return jsonb_build_object(
    'ok', true,
    'expired_unused_deleted', v_expired_unused,
    'old_used_deleted', v_old_used
  );
end;
$$;

alter function pass.cleanup_delivery_quotes() owner to postgres;
grant execute on function pass.cleanup_delivery_quotes() to service_role;

select pass.cleanup_delivery_quotes();

do $do$
begin
  if exists (select 1 from pg_extension where extname = 'pg_cron')
     and exists (
       select 1
       from information_schema.tables
       where table_schema = 'cron'
         and table_name = 'job'
     ) then
    begin
      perform cron.unschedule('pass_delivery_quotes_cleanup_hourly');
    exception
      when others then
        null;
    end;

    perform cron.schedule(
      'pass_delivery_quotes_cleanup_hourly',
      '17 * * * *',
      $sql$select pass.cleanup_delivery_quotes();$sql$
    );
  else
    raise notice 'Skipping delivery quote cleanup cron because pg_cron is unavailable.';
  end if;
exception
  when insufficient_privilege then
    raise notice 'Skipping delivery quote cleanup cron due to insufficient privilege.';
end;
$do$;

comment on function pass.cleanup_delivery_quotes() is
  'Elimina cotizaciones de domicilio vencidas sin usar y cotizaciones usadas con mas de 30 dias.';

commit;
