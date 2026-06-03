-- NEXO 7.3
-- Remisiones: soporte inicial para empaques reales FOGO en items.
--
-- Esto NO descuenta empaques al crear la solicitud.
-- Guarda el plan solicitado para que preparación/despacho consuma production_batch_packages
-- y pueda fraccionar un empaque con trazabilidad.

BEGIN;

ALTER TABLE public.restock_request_items
  ADD COLUMN IF NOT EXISTS production_package_plan jsonb NOT NULL DEFAULT '[]'::jsonb,
  ADD COLUMN IF NOT EXISTS requires_package_dispatch boolean NOT NULL DEFAULT false;

CREATE INDEX IF NOT EXISTS restock_request_items_requires_package_dispatch_idx
  ON public.restock_request_items (requires_package_dispatch)
  WHERE requires_package_dispatch = true;

COMMIT;
