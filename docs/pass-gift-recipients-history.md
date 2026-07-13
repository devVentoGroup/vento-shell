# Vento Pass — destinatarios guardados e historial de regalos

Estado: **aplicado directamente en Supabase** el 13 de julio de 2026.

Proyecto Supabase: `clzdpinthhtknkmefsxx`.

## Migraciones aplicadas

- `pass_saved_gift_recipients_and_history`
- `pass_checkout_saved_gift_recipient_link`

## Modelo

### `public.gift_recipients`

Destinatarios reutilizables propiedad de un usuario autenticado.

Campos principales:

- `id`
- `owner_id`
- `name`
- `phone`
- `relationship`
- `last_used_at`
- `created_at`
- `updated_at`

La combinación normalizada `owner_id + phone` es única.

## Seguridad

La tabla tiene RLS activa.

Políticas:

- seleccionar únicamente destinatarios propios;
- insertar únicamente con `owner_id = auth.uid()`;
- actualizar únicamente destinatarios propios;
- eliminar únicamente destinatarios propios.

`anon` no tiene acceso.

## Funciones

### `public.save_or_touch_gift_recipient(text, text, text)`

Crea o actualiza un destinatario por teléfono para el usuario autenticado.

- exige sesión autenticada;
- valida nombre y teléfono;
- actualiza `last_used_at`;
- no permite operar destinatarios de otros usuarios.

### `public.get_client_gift_history(integer)`

Devuelve los últimos regalos del usuario autenticado con:

- pedido y fecha;
- sede;
- total;
- modalidad y programación;
- destinatario;
- relación;
- sorpresa;
- política de contacto;
- tarjeta.

Límite permitido: 1–25 registros.

### `public.create_scheduled_order_checkout_draft(...)`

Se amplió el contenido de `p_gift_data` con:

```json
{
  "saved_recipient_id": "uuid o null",
  "save_recipient": true
}
```

Comportamiento:

- valida que `saved_recipient_id` pertenezca al comprador;
- actualiza el destinatario seleccionado con los datos actuales;
- crea o reutiliza el destinatario cuando `save_recipient = true`;
- guarda `saved_recipient_id` en `order_gift_details`;
- conserva el snapshot histórico del pedido aunque el destinatario cambie después;
- devuelve `saved_recipient_id` en la respuesta de creación.

## Validación realizada

- tabla creada;
- RPC de historial ejecutable por `authenticated` y no por `anon`;
- RPC de guardado ejecutable por `authenticated` y no por `anon`;
- checkout enlaza `saved_recipient_id`.

## Integración de Vento Pass

Implementada en la rama:

`devVentoGroup/vento-pass:agent/gift-orders-v1`

Archivos principales:

- `src/components/GiftRecipientHistory.tsx`
- `src/components/GiftRecipientLists.tsx`
- `src/lib/giftRecipientSelectionContext.ts`
- `src/lib/orderGiftContext.ts`
- `src/components/OrderCheckout.tsx`

Pass permanece fuera de `main` hasta validación manual.
