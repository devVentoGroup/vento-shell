-- NEXO 7.4
-- Remisiones: trazabilidad de aplicación de empaques FOGO al poner en tránsito.
--
-- La solicitud guarda el plan en production_package_plan.
-- Esta marca evita descontar dos veces production_batch_packages si se reintenta la acción.

BEGIN;

ALTER TABLE public.restock_request_items
  ADD COLUMN IF NOT EXISTS production_package_dispatch_applied_at timestamp with time zone,
  ADD COLUMN IF NOT EXISTS production_package_dispatch_applied_by uuid;

CREATE INDEX IF NOT EXISTS restock_request_items_package_dispatch_pending_idx
  ON public.restock_request_items (request_id)
  WHERE requires_package_dispatch = true
    AND production_package_dispatch_applied_at IS NULL;

COMMIT;
