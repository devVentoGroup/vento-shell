# Storage: fotos de catálogo Nexo (ficha maestra)

Las fotos del producto y de catálogo en **Nexo** se guardan en un bucket distinto al de Vento Pass. Nexo usa `nexo-catalog-images` y guarda las URLs en `products.image_url` y `products.catalog_image_url`.

## 1. Crear el bucket en Supabase

En el **Dashboard** del proyecto: **Storage** → **New bucket**:

- **Name** / **id**: `nexo-catalog-images`
- **Public bucket**: activado (para que las URLs públicas funcionen en listados y ficha)
- **File size limit**: 5 MB
- **Allowed MIME types**: `image/jpeg`, `image/png`, `image/webp`, `image/gif`

(No usar `product-images`: ese nombre suele estar reservado para Vento Pass.)

## 2. Aplicar políticas (migración)

La migración `20260207150000_storage_product_images.sql` define las políticas RLS para el bucket `nexo-catalog-images`:

- **SELECT** (público): cualquiera puede ver archivos del bucket (para mostrar fotos).
- **INSERT / UPDATE / DELETE** (autenticado): solo usuarios autenticados pueden subir, actualizar o borrar. En Nexo la API de subida además exige rol **propietario** o **gerente_general**.

Ejecuta esa migración después de crear el bucket (o antes; las políticas aplican cuando el bucket exista).

## 3. Uso en Nexo

En **Catálogo** → **Ficha de un producto**, en el bloque **Compra y proveedor**:

- **Foto del producto**: botón "Elegir archivo" → se sube a Storage y la URL se guarda en `products.image_url`.
- **Foto de catálogo**: igual, URL en `products.catalog_image_url`.

Al guardar la ficha, esas URLs se persisten en la base de datos. Las rutas en Storage son del tipo:  
`nexo-catalog-images/{productId}/product-{timestamp}.jpg` y `.../catalog-{timestamp}.jpg`.
