begin;

-- Las preparaciones producidas localmente no deben heredar una presentacion
-- de remision manual si ninguna sede las remisiona. La salida operativa debe
-- venir de FOGO (recipe_portion) o de una habilitacion explicita de remision.
update public.product_uom_profiles uom
set
  is_active = false,
  updated_at = now()
from public.products p
join public.product_inventory_profiles pip
  on pip.product_id = p.id
where uom.product_id = p.id
  and p.product_type = 'preparacion'
  and pip.inventory_kind = 'finished'
  and uom.is_active = true
  and uom.usage_context = 'remission'
  and uom.source = 'manual'
  and not exists (
    select 1
    from public.product_site_settings pss
    where pss.product_id = p.id
      and pss.remission_enabled is true
  );

commit;
