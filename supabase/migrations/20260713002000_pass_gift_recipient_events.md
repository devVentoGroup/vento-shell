# Vento Pass — fechas especiales de destinatarios

Estado: **aplicado directamente en Supabase** el 13 de julio de 2026.

Proyecto: `clzdpinthhtknkmefsxx`.

## Migración aplicada

- `pass_gift_recipient_events`

## Tabla

`public.gift_recipient_events`

Campos principales:

- `id`
- `owner_id`
- `recipient_id`
- `event_type`: `birthday`, `anniversary`, `other`
- `label`
- `event_month`
- `event_day`
- `remind_days_before`
- `is_active`
- timestamps

## Seguridad

- RLS activa.
- El usuario solo puede operar fechas propias.
- La fecha debe pertenecer a uno de sus destinatarios.
- `anon` no tiene acceso.
- `authenticated` tiene `select`, `insert`, `update`, `delete` bajo RLS.

## RPC

`public.get_upcoming_gift_events(integer)`

Devuelve próximas fechas anuales del usuario autenticado, calculando:

- próxima ocurrencia;
- días faltantes;
- destinatario;
- tipo y etiqueta de la fecha.

El límite permitido es 1–50.

Permisos:

- `authenticated`: ejecución permitida.
- `anon`: ejecución revocada.

## Integración de Pass

Rama:

`devVentoGroup/vento-pass:agent/gift-orders-v1`

Archivos principales:

- `src/components/settings/GiftCenterPanel.tsx`
- `src/components/settings/AccountSettings.tsx`
- `src/lib/giftLaunchContext.ts`
- `src/components/OrderCheckout.tsx`

Funciones implementadas:

- crear, editar y eliminar destinatarios;
- crear y eliminar fechas especiales;
- listar próximas fechas;
- preparar un regalo desde un destinatario o evento;
- precargar destinatario y configuración de regalo en el checkout.

No se implementaron todavía notificaciones push. Los recordatorios son visibles dentro de la app.
