begin;

create or replace function public.origo_mark_inventory_entry_corrected(
  p_original_entry_id uuid,
  p_replacement_entry_id uuid
)
returns void
language plpgsql
security definer
set search_path = public
as $$
declare
  v_user_id uuid := auth.uid();
  v_original public.inventory_entries%rowtype;
  v_replacement public.inventory_entries%rowtype;
  v_updated_count integer := 0;
begin
  if v_user_id is null then
    raise exception 'Usuario no autenticado.';
  end if;

  if p_original_entry_id is null or p_replacement_entry_id is null then
    raise exception 'Recepción original y recepción corregida son obligatorias.';
  end if;

  if p_original_entry_id = p_replacement_entry_id then
    raise exception 'La recepción original y la recepción corregida no pueden ser la misma.';
  end if;

  select *
  into v_original
  from public.inventory_entries
  where id = p_original_entry_id
  for update;

  if not found then
    raise exception 'Recepción original no encontrada.';
  end if;

  select *
  into v_replacement
  from public.inventory_entries
  where id = p_replacement_entry_id
  for update;

  if not found then
    raise exception 'Recepción corregida no encontrada.';
  end if;

  if v_original.site_id is distinct from v_replacement.site_id then
    raise exception 'La recepción corregida no pertenece a la misma sede.';
  end if;

  if coalesce(v_original.status, '') <> 'reversed' then
    raise exception 'La recepción original debe estar reversada antes de marcarla como corregida.';
  end if;

  if coalesce(v_replacement.status, '') <> 'received' then
    raise exception 'La recepción corregida debe quedar en estado Recibida.';
  end if;

  if not public.has_permission('origo.procurement.receipts'::text, v_original.site_id, null) then
    raise exception 'No tienes permiso para cerrar esta corrección.';
  end if;

  update public.inventory_entries
  set status = 'corrected',
      updated_at = now()
  where id = p_original_entry_id;

  update public.inventory_entry_corrections
  set correction_type = 'edit',
      replacement_entry_id = p_replacement_entry_id
  where entry_id = p_original_entry_id
    and replacement_entry_id is null;

  get diagnostics v_updated_count = row_count;

  if v_updated_count <= 0 then
    raise exception 'No se encontró la auditoría de reversión para enlazar la corrección.';
  end if;
end;
$$;

grant execute on function public.origo_mark_inventory_entry_corrected(uuid, uuid) to authenticated;

commit;
