### NOTIFICACIONES Y ALERTAS

### ✅ NOTIFY-ARC-001 — Inventariar notificaciones actuales y canales

**Estado:** APROBADA
**Tarea anterior:** `EVID-ARC-010 — Definir contingencia ante indisponibilidad de Storage` — APROBADA
**Tarea siguiente:** `NOTIFY-ARC-002 — Definir evento empresarial que origina cada notificación` — RESERVADA
**Tipo de tarea:** documental; inventario read-only del estado actual de avisos, notificaciones y canales observables en aplicaciones, backend compartido y operación AS-IS
**Repositorio propietario:** `vento-shell`
**Archivo propietario:** `docs/plan-canonico/modular/bloques/E4_SERVICIOS_TRANSVERSALES/05_NOTIFICACIONES_Y_ALERTAS.md`
**Cambios físicos autorizados:** ninguno; no crea ni modifica código, Edge Functions, tablas, RLS, migraciones, cron, tokens, preferencias, proveedores, canales ni configuración de Supabase
**Requisitos de prueba creados o modificados:** 0

**Qué se hace:** materializar una línea base verificable de las notificaciones y mecanismos de atención actualmente implementados, referenciados o documentados como AS-IS, distinguiendo entrega automática, aviso local, señal en interfaz, correo y comunicación manual/externa, sin convertir la observación actual en política objetivo ni adelantar decisiones reservadas a `NOTIFY-ARC-002` a `NOTIFY-ARC-010`.

---

#### 1. Propósito y criterio de inclusión

El inventario responde únicamente a dos preguntas:

1. ¿qué aviso o notificación puede identificarse hoy en las fuentes actuales?;
2. ¿por qué canal o mecanismo se presenta, entrega o comunica hoy?

Una entrada se incluye cuando existe al menos una de estas evidencias:

- implementación actual en una aplicación VENTO;
- implementación actual en `vento-shell`, incluidas Edge Functions propietarias de Supabase;
- referencia de cliente vigente a un mecanismo de notificación aunque su backend esté incompleto;
- soporte o canal explícitamente observado en `PROC-ASIS-CATALOG-001`.

No se incluye como notificación empresarial cada `toast`, mensaje de validación, error de formulario, `console.*`, loader o confirmación síncrona de una acción. Tampoco se presume una notificación por el solo hecho de existir un evento, tabla, estado o canal técnico.

---

#### 2. Fuentes verificadas y corte del inventario

Fuentes canónicas y técnicas consumidas:

- `00_CABECERA_Y_ESTADO.md`: continuidad vigente `EVID-ARC-010 → NOTIFY-ARC-001 → NOTIFY-ARC-002`;
- `01_PROTOCOLO.md` y `delivery-contract.json`;
- `active-sequence.json`, `execution-route.json`, `priority-route-progress.json` y `continuity-route.json`;
- `05_NOTIFICACIONES_Y_ALERTAS.md`: alcance y secuencia `NOTIFY-ARC-001` a `NOTIFY-ARC-010`;
- `06_ARCHIVOS_DOCUMENTOS_Y_EVIDENCIA.md`: handoff aprobado de `EVID-ARC-010`;
- `PROC-ASIS-CATALOG-001`: canales y soportes observados en la operación AS-IS;
- `SUPA-TRANS-003`: inventario previo de dependencias de aplicaciones y Edge Functions, usado solo como referencia de contraste;
- código actual de `vento-anima`, `vento-pass` y `vento-pulso` localizado para notificaciones;
- `vento-shell/supabase/functions/` y funciones actuales de notificación/correo.

El inventario prioriza el estado físico actual de `main`. Una referencia histórica o documental que no tiene implementación localizable en la fuente actual queda marcada como incompleta y no como implementada.

---

#### 3. Taxonomía de estado aplicada

| Estado                    | Significado en esta tarea                                                                                                 |
| ------------------------- | ------------------------------------------------------------------------------------------------------------------------- |
| `IMPLEMENTADO`            | Existe emisor o presentación actual verificable y el canal correspondiente está materializado en las fuentes revisadas.   |
| `IMPLEMENTADO_LOCAL`      | El aviso se genera en el propio cliente/dispositivo y no depende de un emisor remoto para esa entrega concreta.           |
| `IMPLEMENTADO_EN_APP`     | Existe señal persistente o reactiva dentro de la aplicación, como feed, banner, badge o bandeja.                          |
| `REFERENCIADO_INCOMPLETO` | El cliente contiene contrato/receptor o invocación, pero falta una pieza requerida en la fuente propietaria actual.       |
| `ASIS_MANUAL_OBSERVADO`   | El canal aparece explícitamente en el catálogo AS-IS, sin demostrar automatización ni contrato técnico de notificaciones. |

Estos estados describen el corte actual. No constituyen estados objetivo del futuro servicio transversal.

---

#### 4. Inventario materializado de notificaciones y avisos técnicos actuales

| ID                | Aplicación / propietario técnico | Aviso o notificación observable                                   | Canal(es) actuales                                                                             | Evidencia actual                                                                                                                                                        | Estado                    | Límite de esta tarea                                                                                                                                                                                                   |
| ----------------- | -------------------------------- | ----------------------------------------------------------------- | ---------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ------------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `NOTIFY-ASIS-001` | ANIMA + `vento-shell`            | Novedad/comunicado interno publicado                              | feed `Novedades` en ANIMA + Expo Push                                                          | `vento-anima/src/components/announcements/use-announcements-screen.ts`; `vento-shell/supabase/functions/announcement-notify/index.ts`                                   | `IMPLEMENTADO`            | El filtro actual por sede/rol se inventaría como comportamiento observado; su regla objetivo pertenece a `NOTIFY-ARC-003`.                                                                                             |
| `NOTIFY-ASIS-002` | ANIMA + `vento-shell`            | Documento próximo a vencerse                                      | Expo Push + notificación local nativa de respaldo                                              | `vento-anima/src/components/documents/use-document-notifications.ts`; `vento-shell/supabase/functions/document-alerts/index.ts`                                         | `IMPLEMENTADO`            | El recordatorio actual usa `reminder_days` o 7 días por defecto; prioridad y vigencia objetivo pertenecen a `NOTIFY-ARC-004`.                                                                                          |
| `NOTIFY-ASIS-003` | ANIMA + `vento-shell`            | Turno publicado para trabajador                                   | Expo Push                                                                                      | `vento-shell/supabase/functions/shift-publish-notify/index.ts`                                                                                                          | `IMPLEMENTADO`            | La publicación observada no fija por sí sola el evento canónico de `NOTIFY-ARC-002`.                                                                                                                                   |
| `NOTIFY-ASIS-004` | ANIMA + `vento-shell`            | Turno actualizado                                                 | Expo Push                                                                                      | `vento-shell/supabase/functions/shift-publish-notify/index.ts`                                                                                                          | `IMPLEMENTADO`            | Se conserva como variante actual separada de turno publicado.                                                                                                                                                          |
| `NOTIFY-ASIS-005` | ANIMA + `vento-shell`            | Aviso previo al fin del turno                                     | Expo Push                                                                                      | `vento-shell/supabase/functions/shift-runtime-processor/index.ts` — `shift_end_reminder`                                                                                | `IMPLEMENTADO`            | La anticipación efectiva proviene de la política actual; esta tarea no la convierte en SLA ni prioridad canónica.                                                                                                      |
| `NOTIFY-ASIS-006` | ANIMA + `vento-shell`            | Seguimiento porque el turno continúa abierto                      | Expo Push                                                                                      | `vento-shell/supabase/functions/shift-runtime-processor/index.ts` — `shift_end_reminder_followup`                                                                       | `IMPLEMENTADO`            | Es un seguimiento observado; escalamiento objetivo pertenece a `NOTIFY-ARC-007`.                                                                                                                                       |
| `NOTIFY-ASIS-007` | ANIMA                            | Confirmación de cierre automático por salida geográfica           | notificación local nativa + `Alert` dentro de ANIMA; vibración/háptica como señal auxiliar     | `vento-anima/src/hooks/attendance/use-shift-departure-tracking.ts`                                                                                                      | `IMPLEMENTADO_LOCAL`      | La vibración es señal de atención, no canal de entrega autónomo.                                                                                                                                                       |
| `NOTIFY-ASIS-008` | ANIMA + `vento-shell`            | Nuevo mensaje asociado a soporte tecnológico                      | Expo Push + badge de no leídos en ANIMA                                                        | `vento-shell/supabase/functions/support-message-notify/index.ts`; `vento-anima/src/components/support/use-support-unread-count.ts`; `vento-anima/app/(app)/_layout.tsx` | `IMPLEMENTADO`            | Lectura, confirmación y escalamiento objetivo quedan para `NOTIFY-ARC-007`.                                                                                                                                            |
| `NOTIFY-ASIS-009` | ANIMA + `vento-shell`            | Invitación o reenvío de invitación para incorporación de personal | correo electrónico mediante Resend                                                             | `vento-shell/supabase/functions/staff-invitations-create/index.ts`; `staff-invitations-resend/index.ts`                                                                 | `IMPLEMENTADO`            | Se registra el correo como canal actual; su uso objetivo transversal pertenece a `NOTIFY-ARC-005`.                                                                                                                     |
| `NOTIFY-ASIS-010` | PASS                             | Ascenso de nivel de fidelización                                  | notificación local nativa                                                                      | `vento-pass/src/hooks/useTierNotifications.ts`; `src/hooks/useNotifications.ts`                                                                                         | `IMPLEMENTADO_LOCAL`      | El cooldown actual se observa, pero deduplicación objetivo pertenece a `NOTIFY-ARC-004`.                                                                                                                               |
| `NOTIFY-ASIS-011` | PASS                             | Producto de recompensa que pasa a ser alcanzable por puntos       | notificación local nativa                                                                      | `vento-pass/src/hooks/useProductAffordabilityNotifications.ts`; `src/hooks/useNotifications.ts`                                                                         | `IMPLEMENTADO_LOCAL`      | No se generaliza a otras recomendaciones o promociones.                                                                                                                                                                |
| `NOTIFY-ASIS-012` | PASS                             | Solicitud de opinión después de una redención validada            | notificación local nativa; modal de valoración como continuación en app                        | `vento-pass/src/components/Saudo.tsx`; `src/components/VentoCafe.tsx`; `src/hooks/useNotifications.ts`                                                                  | `IMPLEMENTADO_LOCAL`      | El inventario confirma al menos Saudo y Vento Café; no presume cobertura de sedes no verificadas.                                                                                                                      |
| `NOTIFY-ASIS-013` | PASS                             | Mensaje nuevo asociado a pedido                                   | receptor Expo Push + badge/deep link definidos en cliente                                      | `vento-pass/src/hooks/useNotifications.ts`; referencia previa en `SUPA-TRANS-003` a `order-message-notify` y `pass-register-push-token`                                 | `REFERENCIADO_INCOMPLETO` | `pass-register-push-token` y `order-message-notify` no están presentes en `vento-shell/supabase/functions/` del corte actual. La decisión de conservar, sustituir o retirar este canal corresponde a `NOTIFY-ARC-005`. |
| `NOTIFY-ASIS-014` | PULSO                            | Pedido nuevo recibido por la sede                                 | banner en app + Notification API del navegador + señal sonora + indicador en título de pestaña | `vento-pulso/src/app/orders/orders-live-bridge.tsx` sobre Realtime de `orders`                                                                                          | `IMPLEMENTADO`            | El usuario habilita sonido/notificaciones del navegador; no se redefine preferencia en esta tarea.                                                                                                                     |
| `NOTIFY-ASIS-015` | PULSO                            | Pago de domicilio pasa a aprobado                                 | banner en app + Notification API del navegador + señal sonora + indicador en título de pestaña | `vento-pulso/src/app/orders/orders-live-bridge.tsx` sobre actualización de `orders`                                                                                     | `IMPLEMENTADO`            | Se registra la condición actual `payment_status → paid` para `delivery`; su evento canónico se resolverá en `NOTIFY-ARC-002`.                                                                                          |
| `NOTIFY-ASIS-016` | PULSO                            | Mensajes de chat de pedido pendientes de revisión                 | contador/badge y bandeja in-app actualizados por Realtime                                      | `vento-pulso/src/app/orders/orders-chat-inbox.tsx`                                                                                                                      | `IMPLEMENTADO_EN_APP`     | No se encontró en este componente uso de Notification API del navegador ni push; no se eleva el badge a canal externo.                                                                                                 |

---

#### 5. Catálogo de mecanismos técnicos de entrega o atención observados

| Código de mecanismo            | Naturaleza                                                   | Evidencia actual                                                                                                                | Aplicaciones observadas                                              |
| ------------------------------ | ------------------------------------------------------------ | ------------------------------------------------------------------------------------------------------------------------------- | -------------------------------------------------------------------- |
| `CHANNEL_EXPO_PUSH`            | entrega remota a dispositivo mediante Expo                   | funciones `announcement-notify`, `document-alerts`, `shift-publish-notify`, `shift-runtime-processor`, `support-message-notify` | ANIMA; PASS solo como referencia incompleta para parte de sus flujos |
| `CHANNEL_LOCAL_NATIVE`         | notificación del sistema operativo programada por el cliente | `expo-notifications` con `scheduleNotificationAsync`                                                                            | ANIMA; PASS                                                          |
| `CHANNEL_IN_APP_FEED`          | bandeja/feed persistente dentro de aplicación                | pantalla `Novedades`                                                                                                            | ANIMA                                                                |
| `CHANNEL_IN_APP_ALERT`         | banner/modal/alerta reactiva en la interfaz                  | `Alert` de ANIMA; banner operativo de PULSO                                                                                     | ANIMA; PULSO                                                         |
| `CHANNEL_IN_APP_BADGE`         | contador visual de pendientes/no leídos                      | soporte ANIMA; chats PULSO                                                                                                      | ANIMA; PULSO                                                         |
| `CHANNEL_BROWSER_NOTIFICATION` | Notification API del navegador                               | `new Notification(...)`                                                                                                         | PULSO                                                                |
| `CHANNEL_EMAIL_RESEND`         | correo electrónico transaccional                             | `https://api.resend.com/emails` desde funciones de invitaciones                                                                 | ANIMA / `vento-shell`                                                |
| `SIGNAL_LOCAL_AUDIO`           | señal sonora auxiliar                                        | Web Audio en `orders-live-bridge.tsx`                                                                                           | PULSO                                                                |
| `SIGNAL_HAPTIC`                | señal háptica auxiliar                                       | `expo-haptics`                                                                                                                  | ANIMA                                                                |
| `SIGNAL_DOCUMENT_TITLE`        | indicador auxiliar en título de pestaña                      | contador `document.title`                                                                                                       | PULSO                                                                |

`SIGNAL_LOCAL_AUDIO`, `SIGNAL_HAPTIC` y `SIGNAL_DOCUMENT_TITLE` acompañan un aviso, pero no se consideran por sí solos prueba de entrega a un destinatario.

---

#### 6. Canales manuales y externos observados en el AS-IS

El catálogo de procesos demuestra canales de comunicación vigentes o históricos recientes que deben permanecer visibles para que el diseño posterior no asuma que todo aviso ya ocurre dentro de las aplicaciones.

| Canal / soporte observado      | Referencias AS-IS verificadas                                          | Clasificación en esta tarea | Observación                                                                                                                                                 |
| ------------------------------ | ---------------------------------------------------------------------- | --------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------- |
| WhatsApp                       | `ASIS-SRC-004`, `019`, `028`, `040`, `057`, `058`                      | `ASIS_MANUAL_OBSERVADO`     | Coordinación, solicitudes, remisiones, canales comerciales y soporte; no existe en esta tarea evidencia de un único emisor automático VENTO para esos usos. |
| Llamadas                       | `ASIS-SRC-004`, `020`, `033`                                           | `ASIS_MANUAL_OBSERVADO`     | Coordinación, negociación y planeación; sin contrato técnico de entrega.                                                                                    |
| Mensajes no especificados      | `ASIS-SRC-001`, `005`, `007`, `009`, `020`, `021`, `033`, `049`, `062` | `ASIS_MANUAL_OBSERVADO`     | El medio concreto no puede inferirse; se conserva literalmente como `mensajes`.                                                                             |
| Comunicación verbal / informal | `ASIS-SRC-009`, `011`, `058`                                           | `ASIS_MANUAL_OBSERVADO`     | No se transforma en canal digital supuesto.                                                                                                                 |
| Reuniones                      | `ASIS-SRC-001`, `004`                                                  | `ASIS_MANUAL_OBSERVADO`     | Mecanismo humano de comunicación y coordinación, no transporte automático.                                                                                  |
| ManyChat                       | `ASIS-SRC-017`, `040`, `057`                                           | `ASIS_MANUAL_OBSERVADO`     | Canal/plataforma externa observada; no se acredita integración automática de notificaciones VENTO.                                                          |
| Instagram                      | `ASIS-SRC-017`, `040`, `057`                                           | `ASIS_MANUAL_OBSERVADO`     | Canal externo observado; conversación y pedido permanecen separados en el AS-IS.                                                                            |
| Rappi / Shopify                | `ASIS-SRC-040`                                                         | `ASIS_MANUAL_OBSERVADO`     | Canales externos de entrada de pedidos observados. Su presencia no demuestra que sean hoy un transporte general de notificaciones VENTO.                    |

La selección futura entre canal interno, correo, push o mensajería externa pertenece exclusivamente a `NOTIFY-ARC-005`.

---

#### 7. Reconciliación cuantitativa

| Control                                                       | Resultado |
| ------------------------------------------------------------- | --------: |
| Familias técnicas de aviso/notificación inventariadas         |        16 |
| Familias con implementación verificable                       |        15 |
| Familias `REFERENCIADO_INCOMPLETO`                            |         1 |
| Familias ANIMA / `vento-shell`                                |         9 |
| Familias PASS                                                 |         4 |
| Familias PULSO                                                |         3 |
| Mecanismos técnicos de entrega/atención catalogados           |        10 |
| Canales/soportes manuales o externos AS-IS agrupados          |         8 |
| Referencias AS-IS de WhatsApp materializadas                  |         6 |
| Referencias AS-IS de llamadas materializadas                  |         3 |
| Referencias AS-IS de mensajes no especificados materializadas |         9 |
| Familias inventadas sin evidencia de fuente                   |         0 |
| Cambios físicos ejecutados                                    |         0 |

El conteo de 16 representa familias de aviso distinguibles por comportamiento actual; no representa eventos canónicos, plantillas objetivo, destinatarios, reglas de prioridad ni intentos de entrega.

---

#### 8. Hallazgos y fronteras verificadas

1. **No existe hoy un servicio transversal único de notificaciones.** Los mecanismos están distribuidos entre ANIMA, PASS, PULSO y Edge Functions de `vento-shell`.
2. **ANIMA posee la infraestructura push más completa observada para trabajadores:** permisos, tokens en `employee_push_tokens`, emisor Expo Push y varios casos de uso backend.
3. **ANIMA combina entrega remota y local.** El vencimiento documental tiene push backend y respaldo local; el cierre automático por salida geográfica se informa localmente en el dispositivo.
4. **PULSO usa un modelo distinto:** Realtime + interfaz web + Notification API del navegador + audio local, sin depender de `employee_push_tokens` para las dos alertas operativas inventariadas.
5. **PASS tiene avisos locales funcionales**, pero su ruta remota no puede declararse completa: el cliente invoca `pass-register-push-token` y reconoce `order_message`, mientras el corte actual de `vento-shell/supabase/functions/` no contiene `pass-register-push-token` ni `order-message-notify`.
6. **Correo existe como canal técnico actual** para invitaciones de personal mediante Resend; no se generaliza a otros avisos sin decisión posterior.
7. **Los badges, feeds, banners, sonido, vibración y título de pestaña no son equivalentes a entrega remota.** Se registran separados para evitar que una señal de interfaz se interprete como notificación entregada.
8. **WhatsApp, llamadas, mensajes, comunicación verbal, ManyChat e Instagram permanecen en el AS-IS.** Esta tarea no los legitima como canales objetivo ni declara cumplimiento, trazabilidad o entrega.
9. El barrido literal dirigido sobre `vento-viso`, `vento-nexo`, `vento-fogo`, `vento-origo`, `vento-numera` y `vento-aura` no localizó una implementación dedicada bajo el término `notification`; esto se registra únicamente como búsqueda negativa acotada y no como prueba de ausencia global.
10. Ningún mecanismo observado modifica los contratos EVID cerrados por `EVID-ARC-010`.

---

#### 9. Decisiones que esta tarea no toma

| Decisión reservada                                                                                  | Tarea propietaria |
| --------------------------------------------------------------------------------------------------- | ----------------- |
| Evento empresarial canónico que origina cada aviso                                                  | `NOTIFY-ARC-002`  |
| Destinatarios por responsabilidad y contexto                                                        | `NOTIFY-ARC-003`  |
| Prioridad, vigencia, agrupación y deduplicación                                                     | `NOTIFY-ARC-004`  |
| Canales objetivo internos, correo, push o mensajería externa; resolución de la ruta PASS incompleta | `NOTIFY-ARC-005`  |
| Preferencias y excepciones obligatorias                                                             | `NOTIFY-ARC-006`  |
| Confirmación, lectura y escalamiento                                                                | `NOTIFY-ARC-007`  |
| Reintentos, fallos y contingencia                                                                   | `NOTIFY-ARC-008`  |
| Privacidad y contenido sensible                                                                     | `NOTIFY-ARC-009`  |
| Métricas y auditoría de entrega                                                                     | `NOTIFY-ARC-010`  |

No se crea un nuevo proveedor, transporte, cola, tabla, token, plantilla, cron, evento, preferencia, prioridad o regla de destinatarios dentro de `NOTIFY-ARC-001`.

---

#### 10. Requisitos de prueba derivados

**Resultado:** NO GENERA REQUISITOS DE PRUEBA

**Justificación:** `NOTIFY-ARC-001` inventaría exclusivamente mecanismos y canales ya observables en fuentes canónicas y código actual. No crea ni modifica una regla de negocio, evento canónico, destinatario, autorización, prioridad, deduplicación, preferencia, reintento, privacidad, métrica, integración o comportamiento ejecutable. Las diferencias detectadas se conservan como estado actual y se asignan a las tareas NOTIFY propietarias posteriores, sin introducir una obligación técnica nueva.

**Balance:** 0 creados; 0 modificados; 0 diferidos; 0 descartados; 0 obsoletos.

---

#### 11. Criterios de aceptación

- [x] la continuidad vigente identifica `NOTIFY-ARC-001` como tarea actual y `NOTIFY-ARC-002` como siguiente reservada;
- [x] el inventario distingue implementación verificable, implementación local, señal en app, referencia incompleta y canal manual AS-IS;
- [x] se materializan 16 familias técnicas sin duplicar un mismo aviso solo porque tenga varios canales;
- [x] las 16 familias tienen evidencia concreta y estado explícito;
- [x] las 15 familias implementadas se distinguen de la única ruta referenciada incompleta;
- [x] la ausencia actual de `pass-register-push-token` y `order-message-notify` en `vento-shell` no se oculta ni se presenta como implementación válida;
- [x] se catalogan 10 mecanismos técnicos de entrega o atención y se separan señales auxiliares de canales de entrega;
- [x] los canales manuales/externos del AS-IS se conservan sin inventar automatización;
- [x] no se convierte un `toast`, error de formulario o confirmación síncrona genérica en notificación empresarial;
- [x] no se define el evento empresarial objetivo, destinatario, prioridad, canal futuro, preferencia, confirmación, reintento, política de privacidad o métrica;
- [x] no se ejecutan cambios en aplicaciones, `vento-shell`, Supabase ni proveedores externos;
- [x] la tarea genera cero cambios en requisitos de prueba;
- [x] `NOTIFY-ARC-002` permanece reservada y no iniciada.

---

#### 12. Handoff cerrado hacia NOTIFY-ARC-002

`NOTIFY-ARC-002` recibe un universo de 16 familias técnicas inventariadas, 10 mecanismos técnicos de entrega/atención y 8 grupos de canales/soportes manuales o externos AS-IS. Recibe además una única brecha técnica explícita de canal: la ruta PASS de `order_message` tiene receptor/contrato cliente, pero las funciones `pass-register-push-token` y `order-message-notify` no están presentes en la fuente actual de `vento-shell`.

Su única responsabilidad siguiente será definir el evento empresarial que origina cada notificación que deba conservarse en el modelo objetivo. No deberá asumir que cada aviso actual merece continuidad ni reinterpretar un canal observado como evento empresarial.

La aprobación de `NOTIFY-ARC-001` no inicia, desarrolla ni aprueba `NOTIFY-ARC-002`.


### ✅ NOTIFY-ARC-002 — Definir evento empresarial que origina cada notificación

**Estado:** APROBADA
**Tarea anterior:** `NOTIFY-ARC-001 — Inventariar notificaciones actuales y canales` — APROBADA
**Tarea siguiente:** `NOTIFY-ARC-003 — Definir destinatarios por responsabilidad y contexto` — RESERVADA
**Tipo de tarea:** documental; definición materializada del origen empresarial de las notificaciones inventariadas, sin implementación de transporte, destinatarios, prioridades, preferencias, reintentos ni métricas
**Repositorio propietario:** `vento-shell`
**Archivo propietario:** `docs/plan-canonico/modular/bloques/E4_SERVICIOS_TRANSVERSALES/05_NOTIFICACIONES_Y_ALERTAS.md`
**Universo recibido:** 16 familias `NOTIFY-ASIS-*`
**Orígenes semánticos materializados:** 15
**Cambios físicos autorizados:** ninguno; no crea ni modifica código, eventos persistidos, Edge Functions, tablas, RLS, migraciones, cron, colas, tokens, canales, proveedores ni configuración de Supabase
**Requisitos de prueba creados o modificados:** 0

**Qué se hace:** definir, para cada familia de notificación inventariada en `NOTIFY-ARC-001`, el hecho empresarial durable o la condición empresarial sobre hechos durables que permite originarla en el modelo objetivo, separando explícitamente el origen semántico de los mecanismos técnicos actuales que hoy detectan, transportan o presentan el aviso.

---

#### 1. Propósito y resultado sustantivo

`NOTIFY-ARC-002` fija el contrato de origen de las notificaciones humanas sin crear un segundo catálogo de procesos ni modificar las 395 definiciones de eventos materiales aprobadas en `PROC-CAT-017`.

La relación obligatoria es:

```text
HECHO EMPRESARIAL CONFIRMADO
        o
CONDICIÓN EMPRESARIAL SOBRE HECHOS DURABLES
        ↓
REGLA DE ORIGEN NOTIFY-ORIGIN-###
        ↓
NECESIDAD DE NOTIFICACIÓN
        ↓
DESTINATARIO / PRIORIDAD / CANAL / PREFERENCIA / ENTREGA
        reservados a NOTIFY-ARC-003 a NOTIFY-ARC-010
```

Un `INSERT`, `UPDATE`, webhook, cron, tick de reloj, cambio de UI, mensaje Realtime, respuesta HTTP, receipt de Expo, badge, sonido, vibración o apertura de pantalla puede detectar o transportar una condición, pero no constituye por sí mismo el evento empresarial que origina la notificación.

---

#### 2. Fuentes canónicas consumidas

La tarea parte de:

- `NOTIFY-ARC-001`, que materializa 16 familias de notificación, 10 mecanismos técnicos y 8 grupos de canales o soportes AS-IS;
- `PROC-CAT-017`, que define 395 eventos materiales para `VPROC-0001` a `VPROC-0069`, separa evento empresarial, comando, notificación, integración, auditoría y log técnico, y exige que una notificación se derive de un hecho empresarial confirmado;
- contratos aprobados de procesos, estados, transiciones, entradas, salidas y auditoría que dan significado a los hechos utilizados;
- evidencia técnica ya reconciliada por `NOTIFY-ARC-001` para ANIMA, PASS, PULSO y las Edge Functions propietarias de `vento-shell`;
- la continuidad aprobada `NOTIFY-ARC-001 → NOTIFY-ARC-002 → NOTIFY-ARC-003`.

Esta tarea no reabre `PROC-CAT-017`. Cuando no existe una definición `VPROC-*.EVT-*` con granularidad suficiente para una necesidad humana, la regla `NOTIFY-ORIGIN-*` se ancla al proceso y al hecho durable autoritativo correspondiente sin inventar un nuevo identificador `VPROC-*.EVT-*`.

---

#### 3. Taxonomía del origen empresarial

| Clase                            | Definición                                                                                                                                                | Regla                                                                                                   |
| -------------------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------- |
| `CANONICAL_EVENT`                | Una definición aprobada de `PROC-CAT-017` expresa directamente el hecho que origina la notificación.                                                      | La notificación referencia ese evento y no un cambio técnico equivalente.                               |
| `CANONICAL_EVENT_WITH_PREDICATE` | El evento canónico es más amplio y la necesidad de notificar aparece solo cuando sus datos o el estado autoritativo satisfacen una condición empresarial. | El predicado no cambia el significado del evento ni crea otro `VPROC-*.EVT-*`.                          |
| `DURABLE_BUSINESS_FACT`          | Existe un hecho empresarial persistido y autoritativo con granularidad más fina que el catálogo material publicado por `PROC-CAT-017`.                    | La regla de origen referencia proceso, recurso y hecho; nunca la tabla, callback o UI como significado. |
| `TEMPORAL_BUSINESS_CONDITION`    | La necesidad aparece al alcanzar una ventana temporal sobre hechos autoritativos todavía vigentes.                                                        | El reloj o scheduler solo evalúa la condición; no es el origen empresarial.                             |

Los identificadores `NOTIFY-ORIGIN-*` son identidades documentales de reglas de origen de notificación. No son eventos de proceso, topics, nombres de cola, tablas ni contratos de transporte.

---

#### 4. Decisión de continuidad por las 16 familias inventariadas

| Familia actual    | Decisión para el modelo objetivo          | Origen asignado     | Resultado                                                                                                                                        |
| ----------------- | ----------------------------------------- | ------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------ |
| `NOTIFY-ASIS-001` | `CONSERVAR_NECESIDAD`                     | `NOTIFY-ORIGIN-001` | La comunicación interna autorizada continúa siendo una necesidad notificable, pero el canal actual no define su origen.                          |
| `NOTIFY-ASIS-002` | `CONSERVAR_NECESIDAD`                     | `NOTIFY-ORIGIN-002` | El vencimiento documental se origina por una condición temporal sobre un documento autoritativo vigente.                                         |
| `NOTIFY-ASIS-003` | `CONSERVAR_NECESIDAD`                     | `NOTIFY-ORIGIN-003` | La publicación efectiva de una asignación o turno es el hecho relevante para la persona afectada.                                                |
| `NOTIFY-ASIS-004` | `CONSERVAR_NECESIDAD`                     | `NOTIFY-ORIGIN-004` | Un cambio material autorizado sobre un turno ya publicado requiere distinguirse de la publicación inicial.                                       |
| `NOTIFY-ASIS-005` | `CONSERVAR_NECESIDAD`                     | `NOTIFY-ORIGIN-005` | El recordatorio previo al cierre surge de una condición temporal sobre turno y asistencia vigentes.                                              |
| `NOTIFY-ASIS-006` | `CONSERVAR_NECESIDAD`                     | `NOTIFY-ORIGIN-006` | El seguimiento surge cuando el turno continúa abierto después de la condición temporal aplicable.                                                |
| `NOTIFY-ASIS-007` | `CONSERVAR_NECESIDAD`                     | `NOTIFY-ORIGIN-007` | La salida geográfica solo origina el aviso cuando el cierre automático quedó aplicado como efecto empresarial.                                   |
| `NOTIFY-ASIS-008` | `CONSERVAR_NECESIDAD`                     | `NOTIFY-ORIGIN-008` | Un mensaje de soporte persistido constituye el hecho comunicable; la actualización del badge no lo sustituye.                                    |
| `NOTIFY-ASIS-009` | `CONSERVAR_NECESIDAD`                     | `NOTIFY-ORIGIN-009` | La invitación inicial o reenviada se origina cuando el proceso de incorporación deja un artefacto de invitación autorizado y listo para entrega. |
| `NOTIFY-ASIS-010` | `CONSERVAR_NECESIDAD`                     | `NOTIFY-ORIGIN-010` | El ascenso de nivel se origina en una transición empresarial de fidelización, no en el recálculo visual del cliente.                             |
| `NOTIFY-ASIS-011` | `CONSERVAR_NECESIDAD`                     | `NOTIFY-ORIGIN-011` | La elegibilidad de una recompensa se origina cuando pasa de no redimible a redimible con datos autoritativos.                                    |
| `NOTIFY-ASIS-012` | `CONSERVAR_NECESIDAD`                     | `NOTIFY-ORIGIN-012` | La solicitud de opinión se origina en una redención validada o conciliada que habilita el siguiente ciclo de satisfacción.                       |
| `NOTIFY-ASIS-013` | `CONSERVAR_NECESIDAD_CON_CANAL_PENDIENTE` | `NOTIFY-ORIGIN-013` | Se conserva la necesidad de avisar un mensaje de pedido; la ruta push incompleta sigue siendo responsabilidad de `NOTIFY-ARC-005`.               |
| `NOTIFY-ASIS-014` | `CONSERVAR_NECESIDAD`                     | `NOTIFY-ORIGIN-014` | El aviso operativo nace cuando el pedido queda válido y accionable para la sede, no por el mero `INSERT` técnico.                                |
| `NOTIFY-ASIS-015` | `CONSERVAR_NECESIDAD`                     | `NOTIFY-ORIGIN-015` | El domicilio puede avisarse como pagado únicamente desde un pago empresarial confirmado o conciliado.                                            |
| `NOTIFY-ASIS-016` | `CONSERVAR_NECESIDAD`                     | `NOTIFY-ORIGIN-013` | El badge de PULSO es otra proyección humana del mismo hecho empresarial de mensaje de pedido usado por PASS.                                     |

**Reconciliación:** las 16 familias quedan decididas explícitamente. Se conservan las 16 necesidades, pero se materializan **15 orígenes semánticos** porque `NOTIFY-ASIS-013` y `NOTIFY-ASIS-016` comparten el mismo hecho empresarial y no deben crear eventos duplicados por aplicación o superficie.

---

#### 5. Registro materializado de orígenes empresariales

| Origen              | Familia(s)                           | Evento o condición empresarial que origina                                                                                                                                              | Proceso / fuente empresarial                                                                                                              | Clase                            | Referencia canónica cuando existe                                                                                                                       | Confirmación mínima del origen                                                                                                                     | No puede originarse únicamente por                                                                                             |
| ------------------- | ------------------------------------ | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------- | -------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------- | -------------------------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------ |
| `NOTIFY-ORIGIN-001` | `NOTIFY-ASIS-001`                    | `INTERNAL_COMMUNICATION_AUTHORIZED_AND_PUBLISHED` — una comunicación interna queda autorizada, persistida y publicada como vigente.                                                     | El proceso o decisión empresarial comunicada debe conservar referencia explícita; el registro de anuncio es la proyección comunicacional. | `DURABLE_BUSINESS_FACT`          | Evento o decisión empresarial fuente cuando aplique; no se crea `VPROC-*.EVT-*` nuevo.                                                                  | La comunicación tiene versión/contenido persistido, autoridad de publicación válida y estado publicado/vigente.                                    | Guardar borrador; abrir pantalla; invocar `announcement-notify`; recibir receipt push.                                         |
| `NOTIFY-ORIGIN-002` | `NOTIFY-ASIS-002`                    | `DOCUMENT_EXPIRY_NOTIFICATION_WINDOW_REACHED` — un documento sujeto a vencimiento entra en la ventana de aviso definida por su política mientras sigue siendo elegible.                 | `VPROC-0060` y registro documental autoritativo.                                                                                          | `TEMPORAL_BUSINESS_CONDITION`    | Sin evento material directo; deriva de documento, tipo, vencimiento y política vigentes.                                                                | Documento existente y autorizado, fecha de vencimiento válida, política de recordatorio aplicable y condición documental que no invalide el aviso. | Ejecución de cron; apertura de la app; cálculo local aislado; existencia de un archivo sin vínculo documental.                 |
| `NOTIFY-ORIGIN-003` | `NOTIFY-ASIS-003`                    | `WORK_ASSIGNMENT_PUBLISHED` — una asignación o turno queda publicado de forma autoritativa para ejecución.                                                                              | `VPROC-0007`.                                                                                                                             | `DURABLE_BUSINESS_FACT`          | Se mantiene dentro del contrato de programación de `VPROC-0007`; el catálogo material no contiene un hito separado de publicación.                      | Versión publicada persistida, trabajador y contexto válidos, periodo/turno identificable y publicación no revertida.                               | Guardar borrador; previsualizar calendario; invocar la Edge Function; cambiar estado local.                                    |
| `NOTIFY-ORIGIN-004` | `NOTIFY-ASIS-004`                    | `PUBLISHED_WORK_ASSIGNMENT_MATERIALLY_CHANGED` — un turno ya publicado recibe un cambio autorizado y persistido que altera información relevante para su ejecución.                     | `VPROC-0007`.                                                                                                                             | `DURABLE_BUSINESS_FACT`          | Cuando el cambio corresponda a corrección o excepción se conserva su referencia `CCR-*` o `EX-*`; no se inventa un evento normal adicional.             | Existe versión previa publicada, cambio autorizado, nueva versión persistida y trazabilidad con la versión anterior.                               | Edición no guardada; refresh; reordenamiento visual; resend de la misma publicación sin cambio empresarial.                    |
| `NOTIFY-ORIGIN-005` | `NOTIFY-ASIS-005`                    | `OPEN_SHIFT_APPROACHING_SCHEDULED_END` — un turno vigente con asistencia abierta entra en la ventana previa al fin programado.                                                          | `VPROC-0007` + hechos de asistencia de `VPROC-0008`.                                                                                      | `TEMPORAL_BUSINESS_CONDITION`    | Sin evento material directo; combina programación publicada y asistencia autoritativa.                                                                  | Turno publicado vigente, sesión de asistencia abierta y condición temporal aplicable todavía verdadera.                                            | Tick de scheduler; existencia del turno sin check-in abierto; reloj del dispositivo como única autoridad.                      |
| `NOTIFY-ORIGIN-006` | `NOTIFY-ASIS-006`                    | `SHIFT_REMAINS_OPEN_AFTER_END_CONDITION` — la jornada o turno continúa abierto cuando se alcanza la condición de seguimiento posterior aplicable.                                       | `VPROC-0007` + `VPROC-0008`.                                                                                                              | `TEMPORAL_BUSINESS_CONDITION`    | Sin evento material directo.                                                                                                                            | Fin programado o condición posterior alcanzada y ausencia de cierre autoritativo de asistencia.                                                    | Repetición del job; falta de conectividad; una vista desactualizada que aún muestre el turno abierto.                          |
| `NOTIFY-ORIGIN-007` | `NOTIFY-ASIS-007`                    | `AUTOMATIC_CHECKOUT_APPLIED_AFTER_VALID_DEPARTURE` — la salida geográfica validada produce y persiste un cierre automático de asistencia.                                               | `VPROC-0008`.                                                                                                                             | `DURABLE_BUSINESS_FACT`          | Relacionable con los hechos de asistencia y su posterior conciliación; no se crea un evento material adicional.                                         | Evento de salida validado, efecto de check-out aplicado una sola vez y registro de asistencia resultante persistido.                               | Lectura GPS; cálculo de distancia; vibración; retorno local `outside=true`; intento fallido de RPC.                            |
| `NOTIFY-ORIGIN-008` | `NOTIFY-ASIS-008`                    | `SUPPORT_MESSAGE_RECORDED` — un mensaje queda persistido en un caso de soporte válido y forma parte de su conversación empresarial.                                                     | `VPROC-0058`.                                                                                                                             | `DURABLE_BUSINESS_FACT`          | El caso se mantiene dentro de `VPROC-0058`; el catálogo material no publica cada mensaje individual.                                                    | Ticket existente, autor identificado, mensaje persistido y vínculo íntegro con el caso.                                                            | Cambio de badge; evento Realtime; escritura temporal del compositor; invocación de `support-message-notify`.                   |
| `NOTIFY-ORIGIN-009` | `NOTIFY-ASIS-009`                    | `STAFF_INVITATION_READY_FOR_DELIVERY` — una invitación inicial o reenviada del proceso de incorporación queda autorizada, persistida y con credencial/enlace válido para ser entregada. | `VPROC-0006`.                                                                                                                             | `DURABLE_BUSINESS_FACT`          | Se relaciona con la configuración laboral e incorporación de `VPROC-0006`; no equivale a incorporación completada.                                      | Identidad/correo objetivo validados, invitación registrada, autoridad vigente y artefacto de acceso generado para esa emisión.                     | Llamada a Resend; respuesta HTTP del proveedor; creación de usuario sin invitación válida; clic en “reenviar”.                 |
| `NOTIFY-ORIGIN-010` | `NOTIFY-ASIS-010`                    | `LOYALTY_TIER_INCREASED` — una interacción de fidelización reconciliada cambia el nivel empresarial del cliente a uno superior.                                                         | `VPROC-0045`.                                                                                                                             | `CANONICAL_EVENT_WITH_PREDICATE` | `VPROC-0045.EVT-006` — interacción de fidelización conciliada, con `tier_after` superior a `tier_before`.                                               | Movimiento de fidelización conciliado y comparación autoritativa antes/después que demuestra ascenso.                                              | Recalcular tier en UI; carga inicial; cambio de texto o caché; lectura aislada del saldo.                                      |
| `NOTIFY-ORIGIN-011` | `NOTIFY-ASIS-011`                    | `REWARD_REDEEMABILITY_GAINED` — una recompensa pasa de no redimible a redimible para el cliente conforme a saldo, costo y vigencia autoritativos.                                       | `VPROC-0045` + definición vigente de recompensa/oferta.                                                                                   | `DURABLE_BUSINESS_FACT`          | Puede derivarse de una interacción de fidelización conciliada o de una modificación válida de la recompensa; no se identifica solo por un render.       | Estado anterior no elegible, estado posterior elegible y datos vigentes de saldo/regla/recompensa.                                                 | Carga inicial; refresh; ordenamiento de productos; saldo enviado por cliente; producto inactivo o fuera de vigencia.           |
| `NOTIFY-ORIGIN-012` | `NOTIFY-ASIS-012`                    | `VALIDATED_REDEMPTION_OPENS_FEEDBACK_ELIGIBILITY` — una redención queda validada o conciliada y habilita la oportunidad empresarial de medir satisfacción.                              | `VPROC-0045` con handoff funcional hacia `VPROC-0068`.                                                                                    | `CANONICAL_EVENT_WITH_PREDICATE` | `VPROC-0045.EVT-006` cuando la interacción conciliada corresponde a redención completada.                                                               | Redención válida, efecto de fidelización conciliado y referencia suficiente para iniciar medición de satisfacción sin reinterpretar la redención.  | Polling de pantalla; apertura de modal; entrada a la app; mera antigüedad del registro sin redención válida.                   |
| `NOTIFY-ORIGIN-013` | `NOTIFY-ASIS-013`, `NOTIFY-ASIS-016` | `ORDER_CONVERSATION_MESSAGE_RECORDED` — un mensaje queda persistido en la conversación empresarial de un pedido existente.                                                              | `process_id` canónico del pedido + conversación de pedido correlacionada; no se infiere el proceso por tabla, ruta o aplicación.          | `DURABLE_BUSINESS_FACT`          | El evento material del proceso de pedido conserva la instancia; cada mensaje es un hecho conversacional derivado y correlacionado, no un nuevo proceso. | Pedido y conversación existentes, autor identificado, mensaje persistido y correlación con la instancia correcta.                                  | Evento Realtime; incremento de contador; badge; recepción push; texto aún no persistido.                                       |
| `NOTIFY-ORIGIN-014` | `NOTIFY-ASIS-014`                    | `ORDER_BECAME_ACTIONABLE_AT_SITE` — un pedido válido queda aceptado por el dominio interno y disponible para trabajo de la sede correspondiente.                                        | `process_id` canónico del pedido, resuelto desde su contrato empresarial.                                                                 | `DURABLE_BUSINESS_FACT`          | Puede corresponder a distintos procesos comerciales según origen/modalidad; no se fuerza un único `VPROC-*` por `fulfillment_type`.                     | Pedido persistido, validado, correlacionado a sede y en un estado que exige atención operativa.                                                    | `INSERT` en `orders`; payload externo sin validar; refresh de PULSO; alta Realtime sin semántica de negocio.                   |
| `NOTIFY-ORIGIN-015` | `NOTIFY-ASIS-015`                    | `DELIVERY_PAYMENT_RECONCILED` — el pago de un pedido de domicilio queda confirmado dentro del proceso de pago y el pedido puede continuar bajo esa condición.                           | `VPROC-0043` + referencia al pedido.                                                                                                      | `CANONICAL_EVENT_WITH_PREDICATE` | `VPROC-0043.EVT-006` — `PAYMENT_RECONCILED`, aplicado a un pedido cuyo cumplimiento es domicilio.                                                       | Pago conciliado en fuente propietaria, pedido correlacionado y modalidad de cumplimiento resoluble desde datos autoritativos.                      | `payment_status` mutado solo en cliente; callback del proveedor sin conciliación; `UPDATE` técnico; receipt del medio de pago. |

---

#### 6. Invariantes del contrato de origen

1. **El origen es empresarial.** Ninguna familia se origina por el canal que la entrega.
2. **Persistencia antes de comunicación.** Cuando el origen es un hecho durable, el efecto empresarial debe existir en la fuente propietaria antes de habilitar la necesidad de notificación.
3. **Condición temporal no equivale a scheduler.** Para `NOTIFY-ORIGIN-002`, `005` y `006`, el tiempo habilita una evaluación sobre estado autoritativo; el job, cron o dispositivo que la evalúe no adquiere significado empresarial.
4. **Sin nuevos eventos de proceso.** Esta tarea no agrega, renumera ni redefine las 395 definiciones `VPROC-*.EVT-*` de `PROC-CAT-017`.
5. **Una misma causa puede alimentar varias superficies humanas.** `NOTIFY-ORIGIN-013` origina las necesidades actuales de PASS y PULSO sin duplicar el hecho `ORDER_CONVERSATION_MESSAGE_RECORDED`.
6. **Una notificación puede depender de un predicado.** Cuando un evento canónico es más amplio, la regla de origen solo habilita la necesidad si la condición empresarial documentada es verdadera.
7. **El contexto se resuelve desde la fuente.** Proceso, pedido, trabajador, documento, ticket, redención o recurso no se infieren desde nombres de tablas, componentes, rutas, payloads no confiables ni canales.
8. **La confirmación técnica no sustituye el hecho.** Receipt push, respuesta de Resend, estado del navegador, suscripción Realtime o éxito HTTP se tratarán como evidencia de transporte o ejecución técnica, no como origen de la notificación.
9. **El evento fuente no define destinatario.** La existencia del origen no autoriza todavía a seleccionar una persona, rol, sede, audiencia o tercero.
10. **El evento fuente no define prioridad ni canal.** La urgencia, vigencia, deduplicación, canal, preferencia, lectura, escalamiento, reintento, privacidad y métrica permanecen fuera de esta tarea.

---

#### 7. Tratamiento explícito de la ruta PASS incompleta

`NOTIFY-ASIS-013` conserva su necesidad empresarial porque `ORDER_CONVERSATION_MESSAGE_RECORDED` es independiente del estado técnico de su transporte.

La ausencia actual de `pass-register-push-token` y `order-message-notify` en la fuente propietaria de Supabase:

- no elimina el origen empresarial;
- no permite declarar push remoto implementado;
- no cambia el hecho compartido con `NOTIFY-ASIS-016`;
- no autoriza crear Edge Functions dentro de esta tarea;
- permanece asignada a `NOTIFY-ARC-005 — Definir canales internos, correo, push o mensajería externa`.

Así, la brecha técnica de canal no contamina la definición del evento empresarial.

---

#### 8. Reconciliación cuantitativa

| Control                                   | Resultado |
| ----------------------------------------- | --------: |
| Familias recibidas de `NOTIFY-ARC-001`    |    **16** |
| Familias con decisión explícita           |    **16** |
| Familias conservadas como necesidad       |    **16** |
| Familias retiradas                        |     **0** |
| Orígenes semánticos únicos                |    **15** |
| Orígenes usados por una sola familia      |    **14** |
| Orígenes compartidos por dos familias     |     **1** |
| Orígenes `CANONICAL_EVENT_WITH_PREDICATE` |     **3** |
| Orígenes `DURABLE_BUSINESS_FACT`          |     **9** |
| Orígenes `TEMPORAL_BUSINESS_CONDITION`    |     **3** |
| Nuevos identificadores `VPROC-*.EVT-*`    |     **0** |
| Cambios físicos ejecutados                |     **0** |

La suma de clases de origen es `3 + 9 + 3 = 15`. Ninguna familia queda sin origen y ningún origen se duplica solo por aplicación, canal o superficie.

---

#### 9. Decisiones reservadas y propietarios exactos

| Decisión no tomada en esta tarea                                                                  | Tarea propietaria |
| ------------------------------------------------------------------------------------------------- | ----------------- |
| Selección exacta de personas, roles, responsabilidades, sedes y contexto receptores               | `NOTIFY-ARC-003`  |
| Prioridad, ventanas temporales definitivas, vigencia, agrupación y deduplicación                  | `NOTIFY-ARC-004`  |
| Canales objetivo internos, correo, push o mensajería externa y resolución técnica de la ruta PASS | `NOTIFY-ARC-005`  |
| Preferencias, opt-in/opt-out y alertas que no pueden ocultarse                                    | `NOTIFY-ARC-006`  |
| Confirmación, lectura, atención y escalamiento                                                    | `NOTIFY-ARC-007`  |
| Reintentos, fallos, resultados desconocidos y contingencia                                        | `NOTIFY-ARC-008`  |
| Minimización, contenido sensible y exposición por canal                                           | `NOTIFY-ARC-009`  |
| Métricas, trazas y auditoría de entrega                                                           | `NOTIFY-ARC-010`  |

No queda un pendiente de `NOTIFY-ARC-002` sin tarea propietaria.

---

#### 10. Requisitos de prueba derivados

**Resultado:** NO GENERA REQUISITOS DE PRUEBA

**Justificación:** esta tarea especializa documentalmente la relación entre hechos empresariales confirmados y notificaciones humanas que ya está definida en los contratos aprobados de eventos de proceso. No crea ni modifica un evento de proceso, un comportamiento ejecutable, una regla de transporte, un destinatario, una prioridad, una regla de deduplicación, una preferencia, un reintento, una política de contenido ni una métrica de entrega. La separación entre evento, notificación y acuse técnico, así como la exigencia de que el hecho empresarial exista antes de la reacción consumidora, ya forman parte de las reglas canónicas vigentes consumidas por esta tarea.

**Balance:** 0 creados; 0 modificados; 0 diferidos; 0 descartados; 0 obsoletos.

---

#### 11. Criterios de aceptación

- [x] `NOTIFY-ARC-001` figura aprobada y entrega exactamente 16 familias.
- [x] las 16 familias tienen decisión explícita de continuidad y origen asignado;
- [x] se materializan exactamente 15 identidades `NOTIFY-ORIGIN-*` únicas;
- [x] `NOTIFY-ASIS-013` y `NOTIFY-ASIS-016` comparten un único origen de mensaje de pedido;
- [x] cada origen distingue hecho empresarial, condición temporal, evento canónico o predicado sobre evento;
- [x] ningún `INSERT`, `UPDATE`, cron, webhook, Realtime, UI, badge, sonido, receipt o respuesta HTTP se trata como origen empresarial por sí solo;
- [x] los hechos durables exigen persistencia autoritativa antes de habilitar la necesidad de notificación;
- [x] las condiciones temporales dependen de hechos autoritativos todavía vigentes;
- [x] no se crean ni modifican definiciones `VPROC-*.EVT-*`;
- [x] la ruta PASS incompleta queda separada de su origen empresarial y conserva propietaria exacta en `NOTIFY-ARC-005`;
- [x] destinatarios, prioridad, canal, preferencias, lectura, escalamiento, reintentos, privacidad y métricas permanecen en sus tareas propietarias;
- [x] no se ejecuta código, migración, cambio de Supabase, proveedor, aplicación ni operación;
- [x] la tarea genera cero cambios en requisitos de prueba;
- [x] `NOTIFY-ARC-003` permanece reservada y no iniciada.

---

#### 12. Handoff cerrado hacia NOTIFY-ARC-003

`NOTIFY-ARC-002` entrega a `NOTIFY-ARC-003` un registro de **15 orígenes semánticos** que cubre **16 familias de notificación**. Cada origen ya distingue el hecho o condición empresarial que habilita la necesidad de comunicación y elimina como fuentes semánticas los disparadores puramente técnicos.

`NOTIFY-ARC-003` recibe exclusivamente la responsabilidad de resolver quién debe recibir cada necesidad de notificación según responsabilidad y contexto. No recibe autorización para redefinir los 15 orígenes, escoger canales, fijar prioridad, alterar preferencias, implementar entrega ni iniciar cambios físicos.

La aprobación de `NOTIFY-ARC-002` no inicia, desarrolla ni aprueba `NOTIFY-ARC-003`.


### [ ] NOTIFY-ARC-003 — Definir destinatarios por responsabilidad y contexto
### [ ] NOTIFY-ARC-004 — Definir prioridad, vigencia y deduplicación
### [ ] NOTIFY-ARC-005 — Definir canales internos, correo, push o mensajería externa
### [ ] NOTIFY-ARC-006 — Definir preferencias sin ocultar alertas obligatorias
### [ ] NOTIFY-ARC-007 — Definir confirmación, lectura y escalamiento
### [ ] NOTIFY-ARC-008 — Definir reintentos, fallos y contingencia
### [ ] NOTIFY-ARC-009 — Definir privacidad y contenido sensible
### [ ] NOTIFY-ARC-010 — Definir métricas y auditoría de entrega
