-- VENTO OS - RPC for controlled site operational role matrix
-- Required by src/app/operations/site-roles/page.tsx

create or replace function public.upsert_site_operational_role(
  p_site_id uuid,
  p_area_id uuid,
  p_role_code text,
  p_is_default boolean default false,
  p_is_active boolean default true
)
returns uuid
language plpgsql
security definer
set search_path = public
as $$
declare
  v_id uuid;
begin
  if p_site_id is null then
    raise exception 'site_id is required';
  end if;

  if nullif(trim(p_role_code), '') is null then
    raise exception 'role_code is required';
  end if;

  if not exists (
    select 1
    from public.operational_roles
    where code = p_role_code
      and is_active = true
  ) then
    raise exception 'Operational role % does not exist or is inactive', p_role_code;
  end if;

  if p_area_id is not null and not exists (
    select 1
    from public.areas
    where id = p_area_id
      and site_id = p_site_id
  ) then
    raise exception 'The selected area does not belong to the selected site';
  end if;

  if p_is_default then
    update public.site_operational_roles
    set
      is_default = false,
      updated_at = now()
    where site_id = p_site_id
      and (
        (area_id is null and p_area_id is null)
        or area_id = p_area_id
      );
  end if;

  select id
  into v_id
  from public.site_operational_roles
  where site_id = p_site_id
    and (
      (area_id is null and p_area_id is null)
      or area_id = p_area_id
    )
    and role_code = p_role_code
  limit 1;

  if v_id is null then
    insert into public.site_operational_roles (
      site_id,
      area_id,
      role_code,
      is_default,
      is_active
    )
    values (
      p_site_id,
      p_area_id,
      p_role_code,
      p_is_default,
      p_is_active
    )
    returning id into v_id;
  else
    update public.site_operational_roles
    set
      is_default = p_is_default,
      is_active = p_is_active,
      updated_at = now()
    where id = v_id;
  end if;

  return v_id;
end;
$$;

grant execute on function public.upsert_site_operational_role(uuid, uuid, text, boolean, boolean) to authenticated;

notify pgrst, 'reload schema';
