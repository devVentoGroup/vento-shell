-- La implementación completa y sus triggers se consolidan en 20260715173100.
-- Esta migración conserva una función válida para no interrumpir la cadena histórica.

create or replace function public.validate_product_request_policy()
returns trigger
language plpgsql
set search_path to 'public', 'auth', 'storage', 'extensions'
as $function$
begin
  new.label := btrim(new.label);
  new.request_unit_code := lower(btrim(new.request_unit_code));
  new.base_unit_code := lower(btrim(new.base_unit_code));
  new.updated_at := now();
  if new.label = '' or new.request_unit_code = '' or new.base_unit_code = '' then
    raise exception 'La política debe tener etiqueta y unidades válidas.';
  end if;
  return new;
end;
$function$;