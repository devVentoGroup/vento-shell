create or replace function public.attach_shared_device_action_signature_target(
  p_signature_id uuid,
  p_target_table text,
  p_target_id uuid,
  p_metadata jsonb default '{}'::jsonb
)
returns table (
  signature_id uuid,
  target_table text,
  target_id uuid
)
language plpgsql
security definer
set search_path = public, auth
as $$
declare
  v_auth_user_id uuid := auth.uid();
  v_signature public.shared_device_actor_signatures%rowtype;
begin
  if v_auth_user_id is null then
    raise exception 'AUTH_REQUIRED';
  end if;

  if p_signature_id is null then
    raise exception 'SIGNATURE_REQUIRED';
  end if;

  if btrim(coalesce(p_target_table, '')) = '' or p_target_id is null then
    raise exception 'TARGET_REQUIRED';
  end if;

  select s.*
  into v_signature
  from public.shared_device_actor_signatures s
  join public.shared_operational_devices d on d.id = s.shared_device_id
  where s.id = p_signature_id
    and s.auth_user_id = v_auth_user_id
    and d.auth_user_id = v_auth_user_id
    and d.is_active
    and d.activation_status = 'active'
  for update of s;

  if not found then
    raise exception 'SIGNATURE_NOT_FOUND';
  end if;

  if v_signature.expires_at is not null and v_signature.expires_at <= now() then
    raise exception 'SIGNATURE_EXPIRED';
  end if;

  if v_signature.target_id is not null and (
    v_signature.target_id <> p_target_id
    or coalesce(v_signature.target_table, '') <> btrim(p_target_table)
  ) then
    raise exception 'SIGNATURE_ALREADY_ATTACHED';
  end if;

  update public.shared_device_actor_signatures
  set
    target_table = btrim(p_target_table),
    target_id = p_target_id,
    metadata = coalesce(metadata, '{}'::jsonb) || coalesce(p_metadata, '{}'::jsonb)
  where id = p_signature_id
  returning id, shared_device_actor_signatures.target_table, shared_device_actor_signatures.target_id
  into signature_id, target_table, target_id;

  return next;
end;
$$;

revoke all on function public.attach_shared_device_action_signature_target(uuid, text, uuid, jsonb) from public;
revoke all on function public.attach_shared_device_action_signature_target(uuid, text, uuid, jsonb) from anon;
revoke all on function public.attach_shared_device_action_signature_target(uuid, text, uuid, jsonb) from authenticated;
grant execute on function public.attach_shared_device_action_signature_target(uuid, text, uuid, jsonb) to authenticated;

comment on function public.attach_shared_device_action_signature_target(uuid, text, uuid, jsonb) is
  'Adjunta una firma de dispositivo compartido al registro operativo creado por la misma sesion autenticada.';

notify pgrst, 'reload schema';