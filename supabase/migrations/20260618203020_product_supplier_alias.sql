alter table public.product_suppliers
  add column if not exists supplier_product_alias text null;

comment on column public.product_suppliers.supplier_product_alias is
  'Nombre comercial opcional del producto como lo entiende este proveedor. Se usa en ORIGO para WhatsApp/PDF proveedor sin exponer SKU ni unidad interna.';
