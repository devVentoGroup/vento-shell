begin;

-- The project does not expose a public app surface. Keep anon away from the
-- application schema and stop future objects from inheriting broad anon grants.
revoke all on all tables in schema public from anon;
revoke all on all sequences in schema public from anon;
revoke all on all functions in schema public from anon;

alter default privileges for role postgres in schema public
  revoke all on tables from anon;
alter default privileges for role postgres in schema public
  revoke all on sequences from anon;
alter default privileges for role postgres in schema public
  revoke all on functions from anon;

drop policy if exists "sites_select_public_vento_pass" on public.sites;
create policy "sites_select_public_vento_pass"
on public.sites
for select
to authenticated
using (is_active = true and is_public = true);

create or replace function public.reverse_restock_request(
  p_request_id uuid
)
returns void
language plpgsql
security definer
set search_path = public
as $$
declare
  v_request public.restock_requests%rowtype;
  v_now timestamptz := timezone('utc', now());
  v_actor uuid := auth.uid();
  v_marker text;
begin
  select *
  into v_request
  from public.restock_requests
  where id = p_request_id;

  if not found then
    raise exception 'request_not_found';
  end if;

  if v_actor is null then
    raise exception 'permission_denied_reverse';
  end if;

  if not public.has_permission('nexo.inventory.remissions.cancel') then
    raise exception 'permission_denied_reverse';
  end if;

  v_marker := '[REVERSA_APLICADA ' || to_char(v_now, 'YYYY-MM-DD"T"HH24:MI:SS"Z"') || ']';

  if coalesce(v_request.notes, '') like '%[REVERSA_APLICADA %' then
    raise exception 'already_reversed';
  end if;

  with movement_net as (
    select
      m.site_id,
      m.product_id,
      sum(
        case
          when m.movement_type = 'transfer_out' then greatest(coalesce(m.quantity, 0), 0)
          when m.movement_type = 'transfer_in' then -greatest(coalesce(m.quantity, 0), 0)
          else 0
        end
      ) as net_qty
    from public.inventory_movements m
    where m.related_restock_request_id = p_request_id
      and m.site_id is not null
      and m.product_id is not null
      and m.movement_type in ('transfer_out', 'transfer_in')
    group by m.site_id, m.product_id
  ),
  reversible_site as (
    select site_id, product_id, net_qty
    from movement_net
    where net_qty > 0
  )
  insert into public.inventory_movements (
    site_id,
    product_id,
    movement_type,
    quantity,
    note,
    related_restock_request_id,
    created_by,
    created_at
  )
  select
    rs.site_id,
    rs.product_id,
    'adjustment_in',
    rs.net_qty,
    'reverse_restock_request',
    p_request_id,
    v_actor,
    v_now
  from reversible_site rs;

  update public.restock_requests
  set
    status = 'cancelled',
    cancelled_at = coalesce(cancelled_at, v_now),
    status_updated_at = v_now,
    notes = trim(
      both E'\n'
      from concat_ws(E'\n', nullif(notes, ''), v_marker)
    )
  where id = p_request_id;
end;
$$;

grant execute on function public.reverse_restock_request(uuid) to authenticated;
revoke all on function public.reverse_restock_request(uuid) from anon;

commit;
