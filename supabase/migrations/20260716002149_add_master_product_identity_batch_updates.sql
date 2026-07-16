create table public.product_configuration_batches (
  id uuid primary key default gen_random_uuid(),
  zone text not null check (zone in ('identity')),
  summary jsonb not null default '{}'::jsonb,
  product_count integer not null check (product_count > 0),
  created_by uuid not null references auth.users(id),
  created_at timestamptz not null default now()
);

alter table public.product_configuration_batches enable row level security;
grant select, insert on public.product_configuration_batches to authenticated;
create policy product_configuration_batches_select on public.product_configuration_batches for select to authenticated using (public.is_owner() or public.is_global_manager());
create policy product_configuration_batches_insert on public.product_configuration_batches for insert to authenticated with check ((public.is_owner() or public.is_global_manager()) and created_by = auth.uid());

create or replace function public.apply_master_product_identity_batch(p_changes jsonb)
returns uuid
language plpgsql
security invoker
set search_path = public
as $$
declare
  v_change jsonb;
  v_product_id uuid;
  v_name text;
  v_sku text;
  v_batch_id uuid;
  v_count integer := 0;
begin
  if not (public.is_owner() or public.is_global_manager()) then
    raise exception 'No tienes permiso para aplicar configuración masiva.';
  end if;
  if jsonb_typeof(p_changes) <> 'array' or jsonb_array_length(p_changes) = 0 then
    raise exception 'No hay cambios para aplicar.';
  end if;
  for v_change in select value from jsonb_array_elements(p_changes) loop
    v_product_id := (v_change->>'product_id')::uuid;
    v_name := nullif(trim(v_change->>'name'), '');
    v_sku := nullif(trim(v_change->>'sku'), '');
    if v_name is null then raise exception 'El nombre es obligatorio.'; end if;
    update public.products set name = v_name, sku = v_sku, updated_at = now() where id = v_product_id;
    if not found then raise exception 'Producto no encontrado.'; end if;
    v_count := v_count + 1;
  end loop;
  insert into public.product_configuration_batches(zone, summary, product_count, created_by)
  values ('identity', jsonb_build_object('changes', p_changes), v_count, auth.uid()) returning id into v_batch_id;
  return v_batch_id;
end;
$$;
revoke all on function public.apply_master_product_identity_batch(jsonb) from public;
grant execute on function public.apply_master_product_identity_batch(jsonb) to authenticated;
