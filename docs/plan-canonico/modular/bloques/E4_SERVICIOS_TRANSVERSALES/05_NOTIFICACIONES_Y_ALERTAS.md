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


### ✅ NOTIFY-ARC-003 — Definir destinatarios por responsabilidad y contexto

**Estado:** APROBADA
**Tarea anterior:** `NOTIFY-ARC-002 — Definir evento empresarial que origina cada notificación` — APROBADA
**Tarea siguiente:** `NOTIFY-ARC-004 — Definir prioridad, vigencia y deduplicación` — RESERVADA
**Tipo de tarea:** documental; definición materializada de destinatarios por relación directa, responsabilidad empresarial y contexto vigente, sin implementación de transporte, prioridad, preferencias, escalamiento, reintentos ni métricas
**Repositorio propietario:** `vento-shell`
**Archivo propietario:** `docs/plan-canonico/modular/bloques/E4_SERVICIOS_TRANSVERSALES/05_NOTIFICACIONES_Y_ALERTAS.md`
**Universo recibido:** 15 orígenes `NOTIFY-ORIGIN-*` que cubren 16 familias `NOTIFY-ASIS-*`
**Reglas de destinatario materializadas:** 15
**Cambios físicos autorizados:** ninguno; no crea ni modifica código, roles, permisos, Edge Functions, tablas, RLS, migraciones, cron, colas, tokens, canales, proveedores ni configuración de Supabase
**Requisitos de prueba creados o modificados:** 0

**Qué se hace:** definir quién debe considerarse destinatario de cada necesidad de notificación ya originada en `NOTIFY-ARC-002`, utilizando exclusivamente relación directa con el hecho, responsabilidad vigente sobre la instancia y contexto empresarial resoluble. La tarea impide sustituir responsabilidad por pertenencia genérica a una aplicación, nombre de rol, sede seleccionada, canal técnico o presencia accidental en una interfaz.

---

#### 1. Propósito y resultado sustantivo

`NOTIFY-ARC-003` fija el contrato documental de resolución de destinatarios para las 15 reglas `NOTIFY-ORIGIN-*`.

La relación obligatoria es:

```text
NOTIFY-ORIGIN-###
        ↓
RELACIÓN DIRECTA O RESPONSABILIDAD EMPRESARIAL
        +
CONTEXTO VIGENTE Y RESOLUBLE
        ↓
NOTIFY-RECIPIENT-###
        ↓
CONJUNTO DE DESTINATARIOS RESUELTO
        ↓
PRIORIDAD / CANAL / PREFERENCIA / ENTREGA / ESCALAMIENTO
        reservados a NOTIFY-ARC-004 a NOTIFY-ARC-010
```

Ser destinatario de una notificación no concede permiso sobre el recurso, no amplía acceso, no cambia propiedad del proceso y no convierte al receptor en aprobador, ejecutor o responsable si el proceso no le asigna esa función.

---

#### 2. Fuentes canónicas consumidas

La tarea consume y conserva:

- `NOTIFY-ARC-001`, con 16 familias de aviso y sus mecanismos actuales;
- `NOTIFY-ARC-002`, con 15 orígenes semánticos que cubren las 16 familias;
- `PROC-CAT-007`, que define iniciadores, actor de registro y condiciones canónicas de inicio;
- `PROC-CAT-008`, que define continuadores principales, apoyos, control o aceptación y participantes externos/técnicos por proceso;
- las reglas aprobadas de `AccessContext` para principal, actor efectivo, identidad laboral, sedes y áreas asignadas, cobertura administrativa, turno publicado vigente y sesión de check-in activa;
- los contratos de proceso asociados a `VPROC-0006`, `VPROC-0007`, `VPROC-0008`, `VPROC-0038` a `VPROC-0045`, `VPROC-0058`, `VPROC-0060` y `VPROC-0068`;
- la continuidad aprobada `NOTIFY-ARC-002 → NOTIFY-ARC-003 → NOTIFY-ARC-004`.

Esta tarea no crea funciones laborales nuevas, no redefine actores de proceso y no convierte códigos funcionales en roles de autorización.

---

#### 3. Clases de resolución de destinatario

| Clase                       | Uso                                                                                                                                              |
| --------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------ |
| `DECLARED_AUDIENCE_SET`     | La propia comunicación autorizada declara una audiencia empresarial explícita y cada identidad debe satisfacerla.                                |
| `DOCUMENT_RESPONSIBILITY`   | El destinatario se resuelve por responsabilidad vigente de mantener, renovar, validar o custodiar el documento afectado.                         |
| `DIRECT_SUBJECT`            | El hecho afecta inequívocamente a una identidad concreta y esa identidad recibe la comunicación.                                                 |
| `DIRECT_SUBJECT_SET`        | Un cambio afecta a más de una identidad concreta; se resuelve el conjunto exacto de sujetos afectados.                                           |
| `CONVERSATION_COUNTERPARTY` | El destinatario es la contraparte o conjunto de contrapartes explícitas de un mensaje persistido; el autor no se incluye por inferencia.         |
| `INSTANCE_RESPONSIBILITY`   | El destinatario se resuelve desde la persona o función que mantiene responsabilidad vigente sobre la siguiente acción de una instancia concreta. |

Una clase de destinatario describe cómo resolver identidades. No define canal, prioridad, frecuencia, vigencia, preferencia ni escalamiento.

---

#### 4. Reglas transversales de responsabilidad y contexto

1. **Relación antes que rol.** Una identidad deberá demostrar relación directa con el sujeto, recurso, caso, documento, pedido, turno o conversación que originó la necesidad de comunicación.
2. **Responsabilidad vigente.** Cuando la regla use responsabilidad funcional, deberá existir una asignación vigente sobre la instancia o un vínculo canónico de función con el proceso y su contexto.
3. **Sin broadcast por conveniencia.** Pertenecer a una aplicación, empresa, sede, rol humano o equipo no convierte a todas sus identidades en destinatarias.
4. **Contexto resuelto en fuente confiable.** Sede, área, turno, check-in, función, actor efectivo y relación con la instancia no se aceptan como autoridad desde filtros visuales, query strings, estado de cliente, caché o nombres de pantalla.
5. **Asignación no equivale a permiso.** La coincidencia de sede, área o función permite resolver responsabilidad, pero no autoriza por sí sola a consultar datos adicionales.
6. **Actor efectivo.** En dispositivos compartidos, la identidad humana destinataria es la persona o función empresarial resuelta; el usuario técnico del dispositivo no se convierte en destinatario.
7. **Turno y check-in solo cuando aplican.** Un destinatario administrativo o documental no requiere un turno activo por defecto. Un destinatario operativo ligado a ejecución en turno deberá satisfacer el contexto laboral que el proceso exija.
8. **Sede y área exactas.** Una responsabilidad territorial se evalúa contra la sede y área autoritativas del recurso o instancia; la sede seleccionada por navegación no amplía audiencia.
9. **Sujeto directo estable.** Trabajador, cliente, invitado o participante exacto se resuelve desde la identidad empresarial vinculada al hecho, no desde texto, correo, teléfono o identificadores enviados sin validación.
10. **Remitente no se autoagrega.** En conversaciones, el autor solo será destinatario cuando exista una relación de destinatario explícita distinta de su autoría; no se agrega como copia implícita.
11. **Gerencia no es copia universal.** `GERENCIA_GENERAL`, `GERENCIA_O_SUPERVISION_DE_SEDE`, controles o propietarios de proceso solo reciben una comunicación cuando esta regla los selecciona por responsabilidad directa. El escalamiento posterior pertenece a `NOTIFY-ARC-007`.
12. **Fallo cerrado.** Si la identidad, responsabilidad o contexto requerido es ambiguo, contradictorio o no resoluble, la regla produce `UNRESOLVED_RECIPIENT`; no amplía la audiencia. El tratamiento técnico de ese fallo pertenece a `NOTIFY-ARC-008`.
13. **Sin inferencia por canal.** Tener token push, correo, sesión abierta, navegador activo o bandeja visible no convierte a una identidad en destinataria.
14. **Sin inferencia por productor técnico.** La aplicación o servicio que produjo, detectó o transportó el aviso no determina quién debe recibirlo.
15. **Mínima audiencia suficiente.** Cuando varias identidades cumplen la misma responsabilidad, se incluye únicamente el conjunto necesario para que la responsabilidad empresarial pueda continuar según el proceso; agrupación y deduplicación quedan para `NOTIFY-ARC-004`.

---

#### 5. Contrato documental de resolución

Cada regla `NOTIFY-RECIPIENT-*` materializa:

| Campo                    | Contenido                                                                       |
| ------------------------ | ------------------------------------------------------------------------------- |
| `recipient_rule_id`      | Identidad estable `NOTIFY-RECIPIENT-###`.                                       |
| `origin_id`              | `NOTIFY-ORIGIN-*` que habilitó la necesidad de comunicación.                    |
| `family_refs[]`          | Familias `NOTIFY-ASIS-*` cubiertas.                                             |
| `resolution_class`       | Clase de resolución definida en esta tarea.                                     |
| `primary_selector`       | Relación o responsabilidad que selecciona las identidades.                      |
| `context_requirements[]` | Condiciones empresariales que deben ser verdaderas para esa identidad.          |
| `excluded_by_default[]`  | Actores o conjuntos que no se agregan por inferencia.                           |
| `resolution_state`       | `RESOLVED`, `NO_APLICA` o `UNRESOLVED_RECIPIENT`.                               |
| `resolution_basis`       | Evidencia o referencia que explica por qué una identidad pertenece al conjunto. |

No se define todavía un esquema SQL, DTO, tabla de audiencia, plantilla, transportista o proveedor.

---

#### 6. Matriz materializada de destinatarios

| Regla                  | Origen / familia(s)                                        | Clase                       | Destinatario primario                                                                                                                                                                                                                                                                                                                 | Contexto obligatorio                                                                                                                                                                                               | Exclusiones y frontera                                                                                                                                                                    |
| ---------------------- | ---------------------------------------------------------- | --------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `NOTIFY-RECIPIENT-001` | `NOTIFY-ORIGIN-001` / `NOTIFY-ASIS-001`                    | `DECLARED_AUDIENCE_SET`     | Identidades internas activas que coincidan exactamente con la audiencia empresarial declarada por la comunicación autorizada: identidad específica, función, organización, sede o área, según lo que la publicación haya fijado.                                                                                                      | Relación laboral o de dominio vigente; función y territorio resueltos desde fuentes autoritativas; una publicación organizacional solo incluye toda la organización cuando ese alcance fue declarado y autorizado. | No se presume “todos los trabajadores”; no se usa la app abierta, la sede seleccionada ni la existencia de token como criterio.                                                           |
| `NOTIFY-RECIPIENT-002` | `NOTIFY-ORIGIN-002` / `NOTIFY-ASIS-002`                    | `DOCUMENT_RESPONSIBILITY`   | Persona o función con responsabilidad vigente de renovar, actualizar, aportar, validar o mantener vigente el documento; cuando esa obligación pertenezca a custodia, el `CUSTODIO_DOCUMENTAL` asignado.                                                                                                                               | Documento y responsabilidad vigentes; vínculo exacto con `VPROC-0060` y con el sujeto o proceso respaldado; territorio solo cuando el documento esté territorialmente asignado.                                    | No se notifica a toda gerencia, RR. HH. o custodios documentales por pertenencia general. Escalamiento por incumplimiento queda fuera de esta tarea.                                      |
| `NOTIFY-RECIPIENT-003` | `NOTIFY-ORIGIN-003` / `NOTIFY-ASIS-003`                    | `DIRECT_SUBJECT`            | Trabajador exacto al que fue publicada la asignación o turno.                                                                                                                                                                                                                                                                         | Identidad laboral activa y asignación publicada vinculada al mismo `employee_id`; sede, área y periodo provienen de la versión publicada.                                                                          | `RESPONSABLE_DE_PROGRAMACION_LABORAL`, supervisión y coordinación no se agregan como copias automáticas.                                                                                  |
| `NOTIFY-RECIPIENT-004` | `NOTIFY-ORIGIN-004` / `NOTIFY-ASIS-004`                    | `DIRECT_SUBJECT_SET`        | Conjunto exacto de trabajadores cuya obligación publicada cambia materialmente; incluye a quien pierde, recibe o ve modificada su asignación cuando el antes/después lo demuestre.                                                                                                                                                    | Comparación autoritativa entre versión publicada anterior y nueva; cada identidad debe aparecer en el cambio material de obligación, sede, área, función, horario o cobertura.                                     | Una edición sin cambio para una persona no la convierte en destinataria. Supervisores no son copia universal.                                                                             |
| `NOTIFY-RECIPIENT-005` | `NOTIFY-ORIGIN-005` / `NOTIFY-ASIS-005`                    | `DIRECT_SUBJECT`            | Trabajador dueño del turno y de la sesión de asistencia abierta que entra en la ventana previa al fin.                                                                                                                                                                                                                                | `actor_effective` laboral resoluble; `active_shift` corresponde al turno origen; `active_checkin_session` activa y vinculada al mismo trabajador y turno.                                                          | No se notifica a trabajadores de la misma sede sin sesión aplicable. Supervisión se reserva a escalamiento posterior.                                                                     |
| `NOTIFY-RECIPIENT-006` | `NOTIFY-ORIGIN-006` / `NOTIFY-ASIS-006`                    | `DIRECT_SUBJECT`            | Trabajador cuya sesión de asistencia continúa abierta después de la condición de fin aplicable.                                                                                                                                                                                                                                       | Misma identidad laboral, turno y sesión abierta que sustentan la condición temporal; ausencia de cierre autoritativo.                                                                                              | No se agrega supervisión en esta etapa; su eventual intervención se define en `NOTIFY-ARC-007`.                                                                                           |
| `NOTIFY-RECIPIENT-007` | `NOTIFY-ORIGIN-007` / `NOTIFY-ASIS-007`                    | `DIRECT_SUBJECT`            | Trabajador cuya asistencia fue cerrada automáticamente por el hecho de salida geográfica validado.                                                                                                                                                                                                                                    | El efecto de check-out pertenece al mismo `employee_id`, turno y sesión; en dispositivo compartido se usa el actor humano efectivo, no el principal técnico.                                                       | No se informa a toda la sede ni a otros trabajadores por compartir punto de marcación.                                                                                                    |
| `NOTIFY-RECIPIENT-008` | `NOTIFY-ORIGIN-008` / `NOTIFY-ASIS-008`                    | `CONVERSATION_COUNTERPARTY` | Si el mensaje va hacia soporte: asignado vigente del caso o conjunto mínimo de `RESPONSABLE_TECNOLOGICO` con responsabilidad sobre el servicio afectado. Si el mensaje va hacia el solicitante: trabajador o solicitante exacto vinculado al caso.                                                                                    | Caso `VPROC-0058` existente; autor y contraparte identificados; asignación o responsabilidad tecnológica vigente; sede/servicio aplicables cuando el caso los limite.                                              | El autor no se agrega por inferencia; no se notifica a todo el equipo tecnológico. Si no puede resolverse asignado ni responsabilidad de servicio, resulta `UNRESOLVED_RECIPIENT`.        |
| `NOTIFY-RECIPIENT-009` | `NOTIFY-ORIGIN-009` / `NOTIFY-ASIS-009`                    | `DIRECT_SUBJECT`            | Persona exacta a la que se emitió la invitación de incorporación.                                                                                                                                                                                                                                                                     | Caso de `VPROC-0006` válido; identidad objetivo y medio de contacto de la invitación vinculados a esa persona; invitación vigente para esa emisión.                                                                | `RESPONSABLE_DE_PERSONAS`, selección, supervisión y gerencia no se agregan como destinatarios de la invitación por haber participado en el proceso.                                       |
| `NOTIFY-RECIPIENT-010` | `NOTIFY-ORIGIN-010` / `NOTIFY-ASIS-010`                    | `DIRECT_SUBJECT`            | Cliente exacto cuyo ledger de fidelización produjo el ascenso de nivel.                                                                                                                                                                                                                                                               | Identidad de cliente resoluble y vínculo inequívoco con el ledger/interacción `VPROC-0045` que produjo el antes/después.                                                                                           | No se notifica a otros integrantes de una compra, dispositivo, sede o cuenta no vinculada.                                                                                                |
| `NOTIFY-RECIPIENT-011` | `NOTIFY-ORIGIN-011` / `NOTIFY-ASIS-011`                    | `DIRECT_SUBJECT`            | Cliente exacto cuya elegibilidad de recompensa pasó de no redimible a redimible.                                                                                                                                                                                                                                                      | Identidad de cliente vinculada al saldo/regla/recompensa autoritativos y transición de elegibilidad confirmada.                                                                                                    | No se crea audiencia promocional general ni se agrega a clientes con recompensas similares.                                                                                               |
| `NOTIFY-RECIPIENT-012` | `NOTIFY-ORIGIN-012` / `NOTIFY-ASIS-012`                    | `DIRECT_SUBJECT`            | Cliente exacto de la redención validada o conciliada que habilitó la medición de satisfacción.                                                                                                                                                                                                                                        | Misma identidad de cliente y referencia de redención que produce el handoff funcional hacia `VPROC-0068`.                                                                                                          | No se notifica a toda la muestra de satisfacción ni se define opt-in/opt-out; preferencias corresponden a `NOTIFY-ARC-006`.                                                               |
| `NOTIFY-RECIPIENT-013` | `NOTIFY-ORIGIN-013` / `NOTIFY-ASIS-013`, `NOTIFY-ASIS-016` | `CONVERSATION_COUNTERPARTY` | El contrato de conversación determina el lado receptor. Para mensaje dirigido al cliente: cliente o participante externo explícitamente vinculado al pedido. Para mensaje dirigido a operación: asignado vigente del pedido o conjunto mínimo de funciones continuadoras responsables de revisar esa conversación en la etapa actual. | Pedido y conversación correlacionados; lado receptor explícito; para operación, sede/área y responsabilidad vigentes; para funciones de turno, contexto laboral aplicable.                                         | La autoría no basta para inferir visibilidad; notas internas no se envían al cliente por defecto; el autor queda excluido salvo destinatario explícito independiente.                     |
| `NOTIFY-RECIPIENT-014` | `NOTIFY-ORIGIN-014` / `NOTIFY-ASIS-014`                    | `INSTANCE_RESPONSIBILITY`   | Actor o conjunto mínimo que posee la primera responsabilidad operativa pendiente del pedido en su proceso canónico. Se prioriza asignación explícita; si no existe, se resuelve la función continuadora correspondiente a la etapa del pedido.                                                                                        | `process_id` real del pedido; sede y área del pedido; etapa accionable actual; identidad laboral activa; si la función es de turno, turno vigente y demás prerrequisitos operativos aplicables.                    | No se notifica a toda la sede. `GERENCIA_O_SUPERVISION_DE_SEDE` solo entra si la responsabilidad de la etapa le corresponde realmente, no como copia general.                             |
| `NOTIFY-RECIPIENT-015` | `NOTIFY-ORIGIN-015` / `NOTIFY-ASIS-015`                    | `INSTANCE_RESPONSIBILITY`   | Actor o conjunto mínimo cuya siguiente acción sobre el pedido de domicilio queda habilitada por el pago conciliado, resuelto desde la instancia del pedido y no desde el proceso de pago aislado.                                                                                                                                     | Pago `VPROC-0043` conciliado; pedido de domicilio correlacionado; proceso y etapa de cumplimiento vigentes; sede/área y responsabilidad operativa actuales.                                                        | El cliente no se agrega porque esta familia inventariada corresponde al aviso operativo actual; una confirmación al cliente requeriría una necesidad de notificación distinta y aprobada. |

---

#### 7. Resolución de responsabilidad operativa en pedidos

Para `NOTIFY-RECIPIENT-013`, `014` y `015`, una función interna solo puede formar parte del conjunto cuando el proceso de pedido y su etapa la reconocen como continuadora o responsable.

Referencias funcionales vigentes que pueden participar según el proceso concreto:

- `VPROC-0038`: `SERVICIO_DE_SALON`, `EQUIPO_OPERATIVO_DEL_AREA`, `CAJA_MOSTRADOR_O_SERVICIO`;
- `VPROC-0039`: `CAJA_MOSTRADOR_O_SERVICIO`, `EQUIPO_OPERATIVO_DEL_AREA`, con apoyo de `RESPONSABLE_DE_CLIENTE_Y_SERVICIO`;
- `VPROC-0040`: `CAJA_MOSTRADOR_O_SERVICIO`, `RESPONSABLE_COMERCIAL`, con apoyos operativos declarados;
- `VPROC-0041`: `RESPONSABLE_COMERCIAL`, `COORDINACION_DE_OPERACIONES` y las funciones de apoyo que correspondan a la etapa;
- `VPROC-0043`: `CAJA_MOSTRADOR_O_SERVICIO`, con apoyo financiero y de servicio para la conciliación del pago.

Reglas:

1. la modalidad del pedido no se deduce de la interfaz; se resuelve desde su contrato;
2. una asignación nominal vigente tiene precedencia sobre un pool funcional genérico para la misma responsabilidad;
3. si se usa un pool funcional, se limita al proceso, etapa, sede y área aplicables;
4. una función de control no se añade mientras no sea responsable de la acción actual;
5. la notificación no transfiere propiedad ni aceptación del pedido;
6. ausencia de responsable resoluble produce `UNRESOLVED_RECIPIENT` y no un broadcast de contingencia.

---

#### 8. Resolución de contexto laboral

Para destinatarios internos humanos:

```text
IDENTIDAD EMPRESARIAL RESOLUBLE
        +
RELACIÓN LABORAL VIGENTE
        +
RESPONSABILIDAD SOBRE SUJETO / RECURSO / INSTANCIA
        +
SEDE / ÁREA CUANDO APLIQUEN
        +
TURNO / CHECK-IN SOLO CUANDO LA RESPONSABILIDAD SEA OPERATIVA EN TURNO
        ↓
DESTINATARIO ELEGIBLE
```

Aplican estas fronteras:

- una sede asignada no concede automáticamente responsabilidad sobre toda la sede;
- una cobertura administrativa no equivale a una audiencia de notificación;
- una sede o área seleccionada en UI no amplía responsabilidad;
- un turno en borrador no crea contexto operativo;
- una sesión de check-in debe pertenecer al mismo actor efectivo y turno cuando sea requisito;
- una persona inactiva, sustituida o fuera de asignación no permanece elegible por historial;
- la falta de contexto no se corrige con el nombre humano del rol.

---

#### 9. Resolución de sujetos externos o de cliente

Para clientes, invitados y demás sujetos externos:

1. la identidad se resuelve por vínculo canónico con pedido, ledger, redención, invitación o conversación;
2. correo, teléfono, QR, código de pedido o identificador recibido del cliente no sustituyen esa relación por sí solos;
3. el mismo dispositivo no convierte a varias identidades en destinatarias;
4. la relación de cliente no concede acceso a otro pedido, cuenta o conversación;
5. esta tarea define quién es el sujeto candidato a recibir; consentimiento, preferencia, contenido sensible y canal permanecen en `NOTIFY-ARC-006`, `NOTIFY-ARC-009` y `NOTIFY-ARC-005`;
6. una identidad externa no resoluble produce `UNRESOLVED_RECIPIENT`.

---

#### 10. Reconciliación cuantitativa

| Control                                                            | Resultado |
| ------------------------------------------------------------------ | --------: |
| Familias recibidas de `NOTIFY-ARC-001`                             |    **16** |
| Orígenes recibidos de `NOTIFY-ARC-002`                             |    **15** |
| Reglas `NOTIFY-RECIPIENT-*` materializadas                         |    **15** |
| Orígenes sin regla de destinatario                                 |     **0** |
| Familias sin cobertura de destinatario                             |     **0** |
| Reglas `DECLARED_AUDIENCE_SET`                                     |     **1** |
| Reglas `DOCUMENT_RESPONSIBILITY`                                   |     **1** |
| Reglas de sujeto directo (`DIRECT_SUBJECT` o `DIRECT_SUBJECT_SET`) |     **9** |
| Reglas `CONVERSATION_COUNTERPARTY`                                 |     **2** |
| Reglas `INSTANCE_RESPONSIBILITY`                                   |     **2** |
| Nuevas funciones laborales creadas                                 |     **0** |
| Nuevos roles o permisos creados                                    |     **0** |
| Cambios físicos ejecutados                                         |     **0** |

La suma de reglas por clase es `1 + 1 + 9 + 2 + 2 = 15`.

---

#### 11. Decisiones reservadas y propietarios exactos

| Decisión no tomada                                                                                 | Tarea propietaria |
| -------------------------------------------------------------------------------------------------- | ----------------- |
| Prioridad, vigencia, agrupación y deduplicación de una misma necesidad o conjunto de destinatarios | `NOTIFY-ARC-004`  |
| Canal interno, correo, push o mensajería externa y resolución técnica de la ruta PASS              | `NOTIFY-ARC-005`  |
| Preferencias, opt-in/opt-out y avisos que no pueden ocultarse                                      | `NOTIFY-ARC-006`  |
| Confirmación, lectura, atención, escalamiento y cuándo incorporar supervisión o control            | `NOTIFY-ARC-007`  |
| Reintentos, fallos, resultado `UNRESOLVED_RECIPIENT` y contingencia de entrega                     | `NOTIFY-ARC-008`  |
| Contenido sensible, minimización y exposición por canal                                            | `NOTIFY-ARC-009`  |
| Métricas, trazas y auditoría de entrega                                                            | `NOTIFY-ARC-010`  |

No queda un pendiente de destinatarios sin tarea propietaria.

---

#### 12. Requisitos de prueba derivados

**Resultado:** NO GENERA REQUISITOS DE PRUEBA

**Justificación:** `NOTIFY-ARC-003` materializa una especialización documental de relaciones ya aprobadas entre sujetos, iniciadores, continuadores, responsabilidades y contexto efectivo. No crea una función laboral, rol, permiso, dimensión de contexto, evento empresarial, canal, política de prioridad, preferencia, reintento, contenido o comportamiento ejecutable nuevo. La implementación futura deberá respetar las reglas de actores, segregación, identidad y contexto ya definidas por sus fuentes propietarias, sin que esta tarea modifique el registro de requisitos.

**Balance:** 0 creados; 0 modificados; 0 diferidos; 0 descartados; 0 obsoletos.

---

#### 13. Criterios de aceptación

- [x] `NOTIFY-ARC-002` figura aprobada y entrega 15 orígenes que cubren 16 familias;
- [x] cada uno de los 15 orígenes tiene exactamente una regla `NOTIFY-RECIPIENT-*`;
- [x] las 16 familias conservan cobertura de destinatario;
- [x] la selección distingue sujeto directo, audiencia declarada, responsabilidad documental, contraparte conversacional y responsabilidad sobre instancia;
- [x] ningún destinatario se selecciona únicamente por aplicación, token, correo disponible, ruta, pantalla, sede seleccionada o nombre humano de rol;
- [x] trabajadores de turnos y asistencia se vinculan al `employee_id`, turno y sesión aplicables;
- [x] la publicación y modificación de programación notifican únicamente a las personas realmente afectadas;
- [x] soporte tecnológico resuelve contraparte o responsabilidad vigente sin notificar a todo el equipo;
- [x] invitaciones se dirigen a la persona exacta de la invitación;
- [x] fidelización y satisfacción se dirigen al cliente exacto vinculado al hecho;
- [x] conversaciones de pedido resuelven explícitamente el lado receptor y excluyen al autor por defecto;
- [x] pedidos operativos resuelven asignación o función responsable por proceso, etapa, sede y área, sin broadcast general;
- [x] supervisión y gerencia no se convierten en copia automática; el escalamiento permanece reservado;
- [x] una ambigüedad de identidad o contexto falla cerrado como `UNRESOLVED_RECIPIENT`;
- [x] no se redefine ninguno de los 15 orígenes `NOTIFY-ORIGIN-*`;
- [x] no se define prioridad, vigencia, deduplicación, canal, preferencia, confirmación, escalamiento, reintento, privacidad ni métrica;
- [x] no se modifica código, Supabase, migraciones, aplicaciones, proveedores ni operación;
- [x] la tarea genera cero cambios en requisitos de prueba;
- [x] `NOTIFY-ARC-004` permanece reservada y no iniciada.

---

#### 14. Handoff cerrado hacia NOTIFY-ARC-004

`NOTIFY-ARC-003` entrega a `NOTIFY-ARC-004` un registro de **15 reglas de destinatario** que cubre los **15 orígenes** y las **16 familias** heredadas. Cada regla ya distingue sujeto o responsabilidad, contexto necesario, exclusiones y condición de fallo cerrado.

`NOTIFY-ARC-004` recibe exclusivamente la responsabilidad de definir prioridad, vigencia, agrupación y deduplicación. No recibe autorización para cambiar los destinatarios aquí materializados, redefinir los orígenes, escoger canales, configurar preferencias ni implementar entrega.

La aprobación de `NOTIFY-ARC-003` no inicia, desarrolla ni aprueba `NOTIFY-ARC-004`.


### [ ] NOTIFY-ARC-004 — Definir prioridad, vigencia y deduplicación
### [ ] NOTIFY-ARC-005 — Definir canales internos, correo, push o mensajería externa
### [ ] NOTIFY-ARC-006 — Definir preferencias sin ocultar alertas obligatorias
### [ ] NOTIFY-ARC-007 — Definir confirmación, lectura y escalamiento
### [ ] NOTIFY-ARC-008 — Definir reintentos, fallos y contingencia
### [ ] NOTIFY-ARC-009 — Definir privacidad y contenido sensible
### [ ] NOTIFY-ARC-010 — Definir métricas y auditoría de entrega
