-- Controlled worker list for NEXO kiosk withdrawals.
-- The bodega tablet account must not get broad employee/employee_sites access,
-- but it needs to select active workers from the source LOC site.

create or replace function public.nexo_kiosk_withdraw_workers(p_source_location_id uuid)
returns table (
  employee_id uuid,
  label text,
  role text,
  destination_label text,
  has_destination boolean
)
language sql
security definer
set search_path = public
as $$
  with source as (
    select il.id, il.site_id
    from public.inventory_locations il
    where il.id = p_source_location_id
      and il.is_active = true
    limit 1
  ),
  allowed as (
    select s.site_id
    from source s
    where public.has_permission('nexo.inventory.withdraw', s.site_id)
       or public.has_permission('nexo.inventory.transfers', s.site_id)
  ),
  site_workers as (
    select e.id, e.full_name, e.alias, e.role
    from allowed a
    join public.employee_sites es
      on es.site_id = a.site_id
     and es.is_active = true
    join public.employees e
      on e.id = es.employee_id
     and coalesce(e.is_active, true) = true

    union

    select e.id, e.full_name, e.alias, e.role
    from allowed a
    join public.employees e
      on e.site_id = a.site_id
     and coalesce(e.is_active, true) = true
  ),
  assignments as (
    select distinct on (a.employee_id)
      a.employee_id,
      a.location_id,
      coalesce(nullif(il.description, ''), nullif(il.zone, ''), nullif(il.code, ''), il.id::text) as destination_label
    from allowed src
    join public.employee_inventory_location_assignments a
      on a.site_id = src.site_id
     and a.purpose = 'kiosk_withdraw'
     and a.is_active = true
    join public.inventory_locations il
      on il.id = a.location_id
     and il.is_active = true
    where a.location_id <> p_source_location_id
    order by a.employee_id, a.updated_at desc
  )
  select
    sw.id as employee_id,
    coalesce(nullif(sw.alias, ''), nullif(sw.full_name, ''), sw.id::text) as label,
    sw.role,
    coalesce(a.destination_label, 'Sin destino (descuento)') as destination_label,
    (a.location_id is not null) as has_destination
  from site_workers sw
  left join assignments a on a.employee_id = sw.id
  where sw.id <> auth.uid()
  order by coalesce(nullif(sw.alias, ''), nullif(sw.full_name, ''), sw.id::text);
$$;

revoke all on function public.nexo_kiosk_withdraw_workers(uuid) from public;
grant execute on function public.nexo_kiosk_withdraw_workers(uuid) to authenticated, service_role;

comment on function public.nexo_kiosk_withdraw_workers(uuid) is
  'Returns active workers for a kiosk source LOC site, including their kiosk withdrawal destination when configured.';
