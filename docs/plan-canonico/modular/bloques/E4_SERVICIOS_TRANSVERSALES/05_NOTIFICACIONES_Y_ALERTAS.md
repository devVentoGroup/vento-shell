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


### ✅ NOTIFY-ARC-004 — Definir prioridad, vigencia y deduplicación

**Estado:** APROBADA
**Tarea anterior:** `NOTIFY-ARC-003 — Definir destinatarios por responsabilidad y contexto` — APROBADA
**Tarea siguiente:** `NOTIFY-ARC-005 — Definir canales internos, correo, push o mensajería externa` — RESERVADA
**Tipo de tarea:** documental; matriz materializada de prioridad, vigencia semántica, agrupación y deduplicación para las quince necesidades de notificación aprobadas

**Qué se hace:** cerrar para cada `NOTIFY-ORIGIN-*` la prioridad empresarial base, la condición que mantiene vigente la necesidad de notificación, la identidad semántica que impide duplicados y la regla que permite crear una nueva ocurrencia legítima, sin cambiar orígenes, destinatarios, canales, preferencias, escalamiento ni implementación.

---

#### 1. Resultado sustantivo

`NOTIFY-ARC-004` queda documentalmente cerrada con:

- 15 políticas `NOTIFY-POLICY-001` a `NOTIFY-POLICY-015`;
- 15 orígenes `NOTIFY-ORIGIN-001` a `NOTIFY-ORIGIN-015` cubiertos exactamente una vez;
- 16 familias `NOTIFY-ASIS-*` cubiertas, manteniendo `NOTIFY-ASIS-013` y `NOTIFY-ASIS-016` bajo el mismo origen `NOTIFY-ORIGIN-013`;
- 15 reglas de destinatario `NOTIFY-RECIPIENT-*` preservadas sin modificación;
- 3 niveles de prioridad empresarial;
- 4 clases de vigencia semántica;
- una regla de deduplicación explícita por política;
- una condición de rearme explícita por política;
- 0 decisiones abiertas dentro del alcance;
- 0 cambios de código, Supabase, migraciones, proveedores o configuración de entrega.

La prioridad definida aquí es prioridad de la necesidad humana de comunicación. No concede permisos, no cambia responsabilidad empresarial y no selecciona el canal.

La vigencia definida aquí es la vigencia semántica de la necesidad. No equivale a retención física, TTL de un proveedor, tiempo de almacenamiento ni política de reintentos.

---

#### 2. Entradas conservadas y fronteras inmutables

La tarea consume sin reinterpretar:

1. `NOTIFY-ARC-001`: 16 familias AS-IS y sus mecanismos observados.
2. `NOTIFY-ARC-002`: 15 orígenes empresariales que cubren las 16 familias.
3. `NOTIFY-ARC-003`: 15 reglas de destinatario, una por origen.
4. Los procesos, actores, contexto laboral, responsabilidades y hechos empresariales ya referenciados por esas tareas.

Reglas de frontera:

- un origen no se redefine por conveniencia de prioridad;
- un destinatario no se agrega o elimina por conveniencia de entrega;
- prioridad no equivale a escalamiento;
- vigencia no equivale a leído, reconocido, atendido o completado;
- deduplicar no autoriza fusionar necesidades empresariales distintas;
- agrupar no permite compartir estado de atención entre destinatarios diferentes;
- canal, proveedor, token, sesión abierta, app visible o dispositivo no forman parte de la identidad empresarial de una notificación;
- un reintento técnico no constituye por sí mismo una nueva necesidad;
- una nueva necesidad legítima exige una nueva ocurrencia empresarial, una nueva versión autoritativa, un nuevo mensaje persistido o un nuevo episodio válido de condición, según la política aplicable.

---

#### 3. Taxonomía canónica de prioridad

| Prioridad                 | Jerarquía | Definición                                                                                                                                                                   | Criterio de uso                                                                                         |
| ------------------------- | --------: | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------- |
| `P1_URGENTE_OPERATIVA`    |         1 | La demora puede bloquear o degradar una operación que ya está activa, una obligación laboral temporal inmediata o la siguiente acción necesaria de una instancia vigente.    | Se usa únicamente cuando el hecho requiere atención dentro del contexto operativo actual.               |
| `P2_ATENCION_PRIORITARIA` |         2 | La información exige atención oportuna y puede tener vigencia, plazo, cambio material o interacción pendiente, pero no demuestra por sí sola un bloqueo operativo inmediato. | Se usa para cambios relevantes, obligaciones próximas, mensajes e invitaciones que requieren atención.  |
| `P3_INFORMATIVA`          |         3 | Comunica un hecho, beneficio u oportunidad válida sin demostrar una acción inmediata ni bloqueo de la operación.                                                             | Se usa para comunicaciones de valor informativo cuya demora no altera por sí sola una operación activa. |

Reglas obligatorias:

1. `P1` tiene precedencia sobre `P2`; `P2` sobre `P3`.
2. La prioridad se deriva del significado empresarial del origen, no del canal, color, sonido, título, texto, mayúsculas, proveedor, número de intentos ni aplicación emisora.
3. Una prioridad mayor no amplía la audiencia definida en `NOTIFY-ARC-003`.
4. `P1` no incorpora supervisión automáticamente. Confirmación, atención y escalamiento pertenecen a `NOTIFY-ARC-007`.
5. La edad de una notificación no cambia silenciosamente su prioridad base. Cualquier escalamiento posterior deberá conservar la prioridad base y registrar su propia razón.
6. Preferencias del usuario no alteran la prioridad empresarial. Su efecto corresponde a `NOTIFY-ARC-006`.
7. Disponibilidad o indisponibilidad de un canal no altera la prioridad. La ruta de entrega pertenece a `NOTIFY-ARC-005` y la contingencia a `NOTIFY-ARC-008`.

---

#### 4. Clases de vigencia semántica

| Clase                | Inicio                                                                                              | Fin                                                                                                                             | Rearme legítimo                                                                                               |
| -------------------- | --------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------- |
| `VERSION_VIGENTE`    | Una versión o generación empresarial queda autorizada y vigente para el destinatario.               | La versión es revocada, reemplazada, cancelada, deja de aplicar al destinatario o termina el periodo empresarial que gobernaba. | Una nueva versión o generación autoritativa que represente una nueva necesidad.                               |
| `CONDICION_CONTINUA` | Una condición empresarial cambia de falsa a verdadera para el mismo sujeto, recurso y destinatario. | La condición vuelve a falsa, el recurso deja de ser elegible o el destinatario deja de cumplir la responsabilidad aplicable.    | Un nuevo episodio falso → verdadero sustentado por hechos autoritativos; ticks, polling o refresh no rearman. |
| `HECHO_UNICO`        | Se persiste un hecho empresarial durable que justifica una comunicación.                            | El hecho es invalidado, revertido o deja de ser elegible para entrega inicial; su historia puede permanecer auditable.          | Un nuevo hecho empresarial distinto; volver a leer o recalcular el mismo hecho no rearma.                     |
| `MENSAJE_PERSISTIDO` | Un mensaje válido queda persistido con autor, conversación y lado receptor resueltos.               | El mensaje es invalidado o retirado, la conversación deja de permitir la entrega o el destinatario deja de ser válido.          | Un mensaje nuevo y persistido. Mensajes diferentes nunca se colapsan como una sola ocurrencia.                |

Reglas de vigencia:

1. No existe un TTL numérico transversal inventado para las quince políticas.
2. Cuando el proceso propietario ya define fecha, periodo, vencimiento, invitación, turno, sesión, recompensa, conversación o estado autoritativo, esa fuente gobierna el inicio y el fin.
3. Una necesidad vencida deja de ser elegible para una nueva entrega inicial, pero su vencimiento no borra la historia.
4. Un cambio de destinatario por pérdida o adquisición válida de responsabilidad cierra la vigencia para quien deja de cumplirla y permite una proyección nueva para quien pasa a cumplirla, sin convertir el hecho empresarial en un broadcast.
5. Estados de lectura, reconocimiento, atención o cierre no se usan aquí como condición de vigencia; pertenecen a `NOTIFY-ARC-007`.

---

#### 5. Contrato transversal de deduplicación y agrupación

La identidad semántica mínima de una notificación se compone de:

```text
origen empresarial
+ sujeto, recurso, instancia o mensaje que produjo la necesidad
+ versión, hecho o episodio autoritativo aplicable
+ destinatario resuelto
```

La implementación futura podrá representar esta identidad mediante campos o una huella determinista, pero no podrá cambiar su significado.

Reglas obligatorias:

1. **Una necesidad, una identidad semántica.** El mismo hecho para el mismo destinatario no crea otra notificación porque cambie de pantalla, app, dispositivo o canal.
2. **Deduplicación antes del transporte.** Push, correo, bandeja, navegador u otro canal futuro son proyecciones de una misma necesidad cuando comparten la misma identidad semántica.
3. **Sin deduplicación entre orígenes distintos.** Dos orígenes diferentes conservan necesidades diferentes aunque afecten al mismo recurso y destinatario.
4. **Sin deduplicación entre destinatarios.** Cada identidad destinataria conserva su propia proyección y su futuro estado de atención.
5. **Conjunto de destinatarios no equivale a un destinatario colectivo.** Una regla `DIRECT_SUBJECT_SET`, audiencia declarada o pool resuelto se expande a identidades válidas; no comparte lectura, atención ni vencimiento entre ellas.
6. **Reintento técnico no rearma.** Timeout, reconexión, cron repetido, Realtime repetido, refresh, provider retry o reinicio no crean una nueva necesidad.
7. **Cambio empresarial sí puede rearmar.** Una versión nueva, mensaje nuevo, hecho nuevo o episodio nuevo produce una identidad nueva cuando la matriz lo autoriza.
8. **Agrupación solo dentro de la misma ocurrencia.** Varios cambios técnicos o varios campos modificados que pertenecen a una sola revisión empresarial pueden representarse juntos; instancias, mensajes u orígenes diferentes no se fusionan.
9. **Prioridad no se reduce por agrupación.** Una representación agrupada conserva la prioridad de la necesidad que representa.
10. **Sin heurística por contenido.** Textos iguales no demuestran duplicidad; textos diferentes no demuestran necesidades distintas.
11. **`NOTIFY-ASIS-013` y `NOTIFY-ASIS-016` comparten identidad empresarial.** Para un mismo mensaje de pedido y destinatario resuelto existe una sola necesidad `NOTIFY-ORIGIN-013`; PASS y PULSO no generan duplicados por ser superficies distintas.
12. **Publicación y cambio de turno son necesidades separadas.** `NOTIFY-ORIGIN-003` y `NOTIFY-ORIGIN-004` no se deduplican entre sí.
13. **Aviso previo y seguimiento posterior son necesidades separadas.** `NOTIFY-ORIGIN-005` y `NOTIFY-ORIGIN-006` no se deduplican entre sí.
14. **Pedido accionable y pago conciliado son necesidades separadas.** `NOTIFY-ORIGIN-014` y `NOTIFY-ORIGIN-015` no se fusionan aunque correspondan al mismo pedido.
15. El tratamiento de fallos de deduplicación, entrega incierta y reintentos pertenece a `NOTIFY-ARC-008`; esta tarea fija únicamente la identidad que esos mecanismos deberán respetar.

---

#### 6. Matriz materializada de políticas

| Política            | Origen / familia(s)                                        | Regla destinatario     | Prioridad                 | Vigencia             | Identidad de deduplicación                                                                 | Agrupación permitida                                                                                                                                          | Fin y rearme                                                                                                                                                                                                    |
| ------------------- | ---------------------------------------------------------- | ---------------------- | ------------------------- | -------------------- | ------------------------------------------------------------------------------------------ | ------------------------------------------------------------------------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `NOTIFY-POLICY-001` | `NOTIFY-ORIGIN-001` / `NOTIFY-ASIS-001`                    | `NOTIFY-RECIPIENT-001` | `P2_ATENCION_PRIORITARIA` | `VERSION_VIGENTE`    | comunicación autorizada + versión publicada + destinatario                                 | Una sola necesidad por versión y destinatario; los intentos o superficies de esa publicación se colapsan.                                                     | Termina al revocar, vencer o reemplazar la publicación. Una nueva versión autorizada puede rearmar.                                                                                                             |
| `NOTIFY-POLICY-002` | `NOTIFY-ORIGIN-002` / `NOTIFY-ASIS-002`                    | `NOTIFY-RECIPIENT-002` | `P2_ATENCION_PRIORITARIA` | `CONDICION_CONTINUA` | documento + responsabilidad/destinatario + política de aviso vigente + episodio de ventana | Evaluaciones repetidas del scheduler dentro del mismo episodio se colapsan; documentos distintos nunca se agrupan.                                            | Termina cuando el documento se renueva, reemplaza, invalida, deja de estar sujeto a la responsabilidad o sale de la condición aplicable. Un nuevo episodio autoritativo puede rearmar.                          |
| `NOTIFY-POLICY-003` | `NOTIFY-ORIGIN-003` / `NOTIFY-ASIS-003`                    | `NOTIFY-RECIPIENT-003` | `P2_ATENCION_PRIORITARIA` | `VERSION_VIGENTE`    | asignación/turno + versión publicada inicial + trabajador destinatario                     | Una publicación genera como máximo una necesidad por asignación y trabajador.                                                                                 | Termina si la asignación se retira, cancela, termina su periodo o queda reemplazada por una versión materialmente distinta. Una nueva publicación válida de otra ocurrencia rearma.                             |
| `NOTIFY-POLICY-004` | `NOTIFY-ORIGIN-004` / `NOTIFY-ASIS-004`                    | `NOTIFY-RECIPIENT-004` | `P1_URGENTE_OPERATIVA`    | `VERSION_VIGENTE`    | asignación/turno + nueva versión publicada + trabajador afectado                           | Todos los campos que cambian dentro de la misma revisión material se agrupan en una sola necesidad por trabajador; revisiones diferentes no se fusionan.      | Termina al ser reemplazada por otra versión, cancelarse la asignación o finalizar el periodo afectado. Cada nueva revisión material autoritativa rearma.                                                        |
| `NOTIFY-POLICY-005` | `NOTIFY-ORIGIN-005` / `NOTIFY-ASIS-005`                    | `NOTIFY-RECIPIENT-005` | `P1_URGENTE_OPERATIVA`    | `CONDICION_CONTINUA` | turno + sesión de asistencia + trabajador + episodio previo al fin                         | Ticks y evaluaciones repetidas dentro de la misma ventana se colapsan.                                                                                        | Termina al cerrar asistencia, cancelar el turno, dejar de cumplirse la condición o cruzar la frontera que da paso al seguimiento posterior. Un nuevo episodio válido puede rearmar.                             |
| `NOTIFY-POLICY-006` | `NOTIFY-ORIGIN-006` / `NOTIFY-ASIS-006`                    | `NOTIFY-RECIPIENT-006` | `P1_URGENTE_OPERATIVA`    | `CONDICION_CONTINUA` | turno + sesión de asistencia + trabajador + episodio posterior al fin                      | Jobs repetidos mientras la misma sesión continúa abierta se colapsan; la repetición para llamar la atención no crea otra necesidad.                           | Termina con cierre autoritativo, cancelación o corrección que invalide la condición. Un nuevo turno o nueva sesión que entre legítimamente en la condición crea otro episodio.                                  |
| `NOTIFY-POLICY-007` | `NOTIFY-ORIGIN-007` / `NOTIFY-ASIS-007`                    | `NOTIFY-RECIPIENT-007` | `P2_ATENCION_PRIORITARIA` | `HECHO_UNICO`        | efecto persistido de check-out automático + trabajador                                     | Alerta, notificación local, vibración u otras señales del mismo efecto son una sola necesidad.                                                                | El hecho no se rearma por relectura ni recálculo. Una corrección o reversión invalida nueva entrega del hecho original; otro check-out automático válido es otra ocurrencia.                                    |
| `NOTIFY-POLICY-008` | `NOTIFY-ORIGIN-008` / `NOTIFY-ASIS-008`                    | `NOTIFY-RECIPIENT-008` | `P2_ATENCION_PRIORITARIA` | `MENSAJE_PERSISTIDO` | caso de soporte + mensaje persistido + contraparte destinataria                            | Push, badge, Realtime u otra proyección del mismo mensaje se colapsan. Mensajes distintos permanecen separados.                                               | Termina si el mensaje es invalidado o la contraparte deja de ser válida. Cada mensaje nuevo persistido rearma.                                                                                                  |
| `NOTIFY-POLICY-009` | `NOTIFY-ORIGIN-009` / `NOTIFY-ASIS-009`                    | `NOTIFY-RECIPIENT-009` | `P2_ATENCION_PRIORITARIA` | `VERSION_VIGENTE`    | invitación + generación autorizada de entrega + persona invitada                           | Reintentos del proveedor sobre la misma generación se colapsan. Un reenvío deliberado solo es nuevo cuando existe una nueva generación autorizada de entrega. | Termina al usarse, expirar, revocarse o reemplazarse la invitación/generación. Una nueva generación autorizada rearma.                                                                                          |
| `NOTIFY-POLICY-010` | `NOTIFY-ORIGIN-010` / `NOTIFY-ASIS-010`                    | `NOTIFY-RECIPIENT-010` | `P3_INFORMATIVA`          | `HECHO_UNICO`        | transición conciliada de nivel + cliente                                                   | Recalcular, refrescar o volver a mostrar el mismo ascenso no crea otra necesidad.                                                                             | El ascenso confirmado es una ocurrencia única. Otro ascenso empresarial posterior constituye un hecho nuevo.                                                                                                    |
| `NOTIFY-POLICY-011` | `NOTIFY-ORIGIN-011` / `NOTIFY-ASIS-011`                    | `NOTIFY-RECIPIENT-011` | `P3_INFORMATIVA`          | `CONDICION_CONTINUA` | cliente + recompensa + episodio de no redimible → redimible                                | Recalcular el mismo estado elegible se colapsa; recompensas diferentes permanecen separadas.                                                                  | Termina cuando la recompensa deja de ser redimible o deja de estar vigente. Una pérdida real de elegibilidad seguida de una nueva ganancia autoritativa crea otro episodio.                                     |
| `NOTIFY-POLICY-012` | `NOTIFY-ORIGIN-012` / `NOTIFY-ASIS-012`                    | `NOTIFY-RECIPIENT-012` | `P3_INFORMATIVA`          | `CONDICION_CONTINUA` | redención validada + cliente + ciclo de elegibilidad de feedback                           | Aperturas repetidas de app, modal o polling no crean otra necesidad para el mismo ciclo.                                                                      | Termina al cerrarse o consumirse la elegibilidad conforme al proceso de satisfacción, o al invalidarse la redención. Otra redención válida crea otro ciclo.                                                     |
| `NOTIFY-POLICY-013` | `NOTIFY-ORIGIN-013` / `NOTIFY-ASIS-013`, `NOTIFY-ASIS-016` | `NOTIFY-RECIPIENT-013` | `P2_ATENCION_PRIORITARIA` | `MENSAJE_PERSISTIDO` | conversación de pedido + mensaje persistido + lado receptor + destinatario                 | PASS y PULSO son proyecciones de la misma necesidad cuando representan el mismo mensaje y destinatario. Mensajes distintos no se agrupan.                     | Termina si el mensaje o la relación de destinatario se invalida. Cada mensaje nuevo persistido rearma.                                                                                                          |
| `NOTIFY-POLICY-014` | `NOTIFY-ORIGIN-014` / `NOTIFY-ASIS-014`                    | `NOTIFY-RECIPIENT-014` | `P1_URGENTE_OPERATIVA`    | `CONDICION_CONTINUA` | pedido + episodio de accionabilidad + responsabilidad/destinatario                         | Banner, Notification API, sonido, título o Realtime del mismo episodio se colapsan; no se agrupan pedidos diferentes.                                         | Termina cuando el pedido deja de ser accionable para ese destinatario, cambia de etapa, se cancela o cambia la responsabilidad. Una reentrada autoritativa a una nueva etapa/episodio accionable puede rearmar. |
| `NOTIFY-POLICY-015` | `NOTIFY-ORIGIN-015` / `NOTIFY-ASIS-015`                    | `NOTIFY-RECIPIENT-015` | `P1_URGENTE_OPERATIVA`    | `HECHO_UNICO`        | pedido + pago conciliado + responsabilidad/destinatario                                    | Actualizaciones técnicas repetidas que expresan el mismo pago conciliado se colapsan.                                                                         | Termina para nueva entrega si el pago se revierte, el pedido deja de requerir la acción habilitada o el destinatario pierde responsabilidad. Una conciliación empresarial distinta constituye otra ocurrencia.  |

---

#### 7. Reconciliación cuantitativa

| Métrica                                        |    Resultado |
| ---------------------------------------------- | -----------: |
| Orígenes recibidos                             |       **15** |
| Políticas materializadas                       |       **15** |
| Orígenes sin política                          |        **0** |
| Políticas duplicadas por origen                |        **0** |
| Familias AS-IS cubiertas                       | **16 de 16** |
| Reglas de destinatario preservadas             | **15 de 15** |
| Políticas `P1_URGENTE_OPERATIVA`               |        **5** |
| Políticas `P2_ATENCION_PRIORITARIA`            |        **7** |
| Políticas `P3_INFORMATIVA`                     |        **3** |
| Políticas `VERSION_VIGENTE`                    |        **4** |
| Políticas `CONDICION_CONTINUA`                 |        **6** |
| Políticas `HECHO_UNICO`                        |        **3** |
| Políticas `MENSAJE_PERSISTIDO`                 |        **2** |
| Cambios de origen                              |        **0** |
| Cambios de destinatario                        |        **0** |
| Cambios físicos ejecutados                     |        **0** |
| Decisiones abiertas dentro de `NOTIFY-ARC-004` |        **0** |

La suma de prioridades es `5 + 7 + 3 = 15`.

La suma de clases de vigencia es `4 + 6 + 3 + 2 = 15`.

---

#### 8. Decisiones canónicas consolidadas

1. La prioridad es una propiedad empresarial de la necesidad de comunicación y no una propiedad del canal.
2. Las quince necesidades usan exactamente tres niveles de prioridad base.
3. `NOTIFY-ORIGIN-004`, `005`, `006`, `014` y `015` son urgentes operativas porque afectan una obligación o acción dentro de un contexto operativo vigente.
4. Comunicaciones, vencimiento documental, publicación inicial de turnos, cierre automático, soporte, invitaciones y mensajes de pedido requieren atención prioritaria sin convertirse por defecto en urgencias operativas.
5. Fidelización, recompensa y feedback son informativos dentro del universo actual y no crean por sí mismos bloqueo operativo.
6. No se define un TTL transversal. La vigencia se deriva de versión, condición, hecho o mensaje autoritativos.
7. La deduplicación ocurre sobre la necesidad semántica y precede a cualquier decisión de transporte.
8. Múltiples canales o superficies no crean múltiples necesidades.
9. Los destinatarios de un conjunto conservan identidades y futuros estados de atención independientes.
10. `NOTIFY-ASIS-013` y `NOTIFY-ASIS-016` conservan una sola necesidad empresarial por mensaje de pedido y destinatario.
11. Reintentos técnicos, cron repetido, Realtime repetido, refresh y reapertura de app no rearman una necesidad.
12. Una nueva versión, hecho, mensaje o episodio empresarial sí puede rearmar cuando la política lo define.
13. Publicación inicial y cambio material de turno permanecen separados.
14. Aviso previo y seguimiento posterior del turno permanecen separados.
15. Pedido accionable y pago conciliado permanecen separados.
16. Prioridad no cambia permisos, audiencia, propiedad, responsabilidad ni aceptación.
17. La falta de canal no degrada la prioridad; su contingencia se resuelve posteriormente.
18. No se crean esquemas SQL, tablas, columnas, DTO, topics, colas, Edge Functions, jobs, cron, proveedores ni contratos físicos en esta tarea.

---

#### 9. Decisiones posteriores reservadas

| Decisión                                                               | Tarea propietaria |
| ---------------------------------------------------------------------- | ----------------- |
| Canales internos, correo, push, mensajería externa y ruta técnica PASS | `NOTIFY-ARC-005`  |
| Preferencias, opt-in/opt-out y alertas que no pueden ocultarse         | `NOTIFY-ARC-006`  |
| Confirmación, lectura, atención, escalamiento y supervisión            | `NOTIFY-ARC-007`  |
| Reintentos, fallos, `UNRESOLVED_RECIPIENT` y contingencia de entrega   | `NOTIFY-ARC-008`  |
| Privacidad, contenido sensible y minimización por canal                | `NOTIFY-ARC-009`  |
| Métricas, trazas y auditoría de entrega                                | `NOTIFY-ARC-010`  |

Todas las decisiones de prioridad, vigencia, agrupación y deduplicación de las quince políticas quedan cerradas en esta tarea.

---

#### 10. Requisitos de prueba

**Resultado:** NO GENERA REQUISITOS DE PRUEBA

**Justificación:** `NOTIFY-ARC-004` especializa documentalmente comportamientos ya protegidos por requisitos transversales vigentes: separación entre notificación y trabajo, prioridad derivada de reglas empresariales, identidad estable, idempotencia, deduplicación de reintentos, trazabilidad y separación entre evento, notificación y transporte. Esta tarea no implementa un motor nuevo ni modifica esos requisitos. La especialización deberá ser consumida por la implementación posterior sin duplicar requisitos ya registrados.

Cobertura existente relevante: `TREQ-PROC-861`, `TREQ-PROC-863`, `TREQ-PROC-864`, `TREQ-PROC-869`, `TREQ-PROC-881`, `TREQ-PROC-966`, `TREQ-PROC-967`, `TREQ-INTEGRATION-003`, `TREQ-INTEGRATION-004`, `TREQ-INTEGRATION-032` y `TREQ-INTEGRATION-033`.

**Balance:** 0 creados; 0 modificados; 0 diferidos; 0 descartados; 0 obsoletos.

---

#### 11. Criterios de aceptación

- [x] los 15 orígenes heredados están cubiertos exactamente una vez;
- [x] las 16 familias AS-IS conservan cobertura;
- [x] las 15 reglas de destinatario permanecen intactas;
- [x] cada política tiene prioridad explícita;
- [x] cada política tiene clase de vigencia explícita;
- [x] cada política tiene identidad de deduplicación explícita;
- [x] cada política define agrupación permitida;
- [x] cada política define condición de fin y rearme;
- [x] la prioridad no se deriva de canal, proveedor, presentación o preferencia;
- [x] la vigencia no se confunde con lectura, reconocimiento o atención;
- [x] no existe TTL numérico transversal inventado;
- [x] reintentos y evaluaciones técnicas repetidas no crean nuevas necesidades;
- [x] hechos, versiones, mensajes y episodios empresariales nuevos pueden crear nuevas necesidades únicamente según su política;
- [x] no se deduplican orígenes empresariales distintos;
- [x] no se comparte estado entre destinatarios distintos;
- [x] `NOTIFY-ASIS-013` y `NOTIFY-ASIS-016` no duplican el mismo mensaje de pedido;
- [x] no se seleccionan canales;
- [x] no se definen preferencias;
- [x] no se define confirmación, lectura ni escalamiento;
- [x] no se definen reintentos ni contingencia técnica;
- [x] no se define privacidad por canal;
- [x] no se definen métricas ni auditoría de entrega;
- [x] no se modifica código, Supabase, migraciones, proveedores ni operación;
- [x] la tarea genera cero cambios en requisitos de prueba;
- [x] `NOTIFY-ARC-005` permanece únicamente reservada.

---

#### 12. Continuidad

ÚLTIMA TAREA APROBADA
`NOTIFY-ARC-003 — Definir destinatarios por responsabilidad y contexto`

TAREA ACTUAL APROBADA
`NOTIFY-ARC-004 — Definir prioridad, vigencia y deduplicación`

SIGUIENTE TAREA RESERVADA
`NOTIFY-ARC-005 — Definir canales internos, correo, push o mensajería externa`

La aprobación de `NOTIFY-ARC-004` no inicia ni desarrolla `NOTIFY-ARC-005`.


### ✅ NOTIFY-ARC-005 — Definir canales internos, correo, push o mensajería externa

**Estado:** APROBADA
**Tarea anterior:** `NOTIFY-ARC-004 — Definir prioridad, vigencia y deduplicación` — APROBADA
**Tarea siguiente:** `NOTIFY-ARC-006 — Definir preferencias sin ocultar alertas obligatorias` — RESERVADA
**Tipo de tarea:** documental; matriz materializada de canales objetivo y rutas de entrega para las quince políticas de notificación aprobadas
**Repositorio propietario:** `vento-shell`
**Archivo propietario:** `docs/plan-canonico/modular/bloques/E4_SERVICIOS_TRANSVERSALES/05_NOTIFICACIONES_Y_ALERTAS.md`
**Cambios físicos autorizados:** ninguno; no crea ni modifica código, Edge Functions, tablas, RLS, migraciones, cron, tokens, proveedores, secretos, canales desplegados ni configuración de Supabase
**Requisitos de prueba creados o modificados:** 0

**Qué se hace:** definir para cada `NOTIFY-POLICY-*` qué clase de canal constituye su ruta primaria, qué superficies pueden acompañarla, cuándo puede existir una ruta externa y qué evidencia técnica actual respalda o limita esa decisión, sin cambiar origen, destinatario, prioridad, vigencia, deduplicación, preferencias, escalamiento, reintentos, privacidad ni métricas.

---

#### 1. Resultado sustantivo

`NOTIFY-ARC-005` queda documentalmente cerrada con:

- 15 políticas `NOTIFY-POLICY-001` a `NOTIFY-POLICY-015` recibidas y materializadas;
- 15 orígenes `NOTIFY-ORIGIN-001` a `NOTIFY-ORIGIN-015` conservados;
- 15 reglas `NOTIFY-RECIPIENT-001` a `NOTIFY-RECIPIENT-015` conservadas;
- 16 familias `NOTIFY-ASIS-*` cubiertas;
- 6 clases de canal objetivo;
- exactamente una ruta primaria por política;
- rutas complementarias explícitas cuando aportan atención sin crear una segunda necesidad;
- una única elegibilidad condicional de mensajería externa, limitada a `NOTIFY-POLICY-013`;
- resolución documental de la ruta PASS de mensajes de pedido;
- una brecha técnica de paridad repositorio/despliegue registrada con propietario y puerta de salida;
- 0 políticas sin canal primario;
- 0 políticas duplicadas;
- 0 decisiones abiertas dentro del alcance de esta tarea;
- 0 cambios físicos ejecutados.

Todas las filas quedan en estado documental `ESPECIFICADO`. La existencia actual de un mecanismo técnico se registra como evidencia, no como prueba de entrega operativa ni como autorización para modificarlo.

---

#### 2. Entradas conservadas

La tarea consume sin reinterpretar:

1. `NOTIFY-ARC-001`, con dieciséis familias AS-IS y sus mecanismos técnicos observados;
2. `NOTIFY-ARC-002`, con quince orígenes empresariales;
3. `NOTIFY-ARC-003`, con quince reglas de destinatario;
4. `NOTIFY-ARC-004`, con quince políticas de prioridad, vigencia, agrupación y deduplicación;
5. el código vigente de ANIMA, PASS y PULSO relacionado con presentación y recepción de avisos;
6. las Edge Functions vigentes de `vento-shell` relacionadas con push y correo;
7. el estado desplegado accesible de `vento-os-dev` utilizado únicamente para reconciliar existencia y paridad técnica.

Las decisiones heredadas permanecen inmutables. Esta tarea selecciona canales de comunicación; no altera quién debe recibir, qué hecho origina, cuál es la prioridad ni cuándo una necesidad deja de ser vigente.

---

#### 3. Catálogo canónico de clases de canal

| Canal                           | Definición                                                                                                                                               | Puede ser primario                 | Puede complementar | No significa                                                                                                     |
| ------------------------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------- | ---------------------------------- | ------------------ | ---------------------------------------------------------------------------------------------------------------- |
| `CHANNEL_INTERNAL_FEED_INBOX`   | Superficie autenticada y persistente dentro de una aplicación VENTO: feed, bandeja, conversación o contador asociado a contenido recuperable.            | Sí                                 | Sí                 | No es la fuente de verdad del hecho empresarial ni prueba de lectura.                                            |
| `CHANNEL_INTERNAL_CONTEXTUAL`   | Aviso visible dentro del contexto operativo activo: banner, alerta, modal o estado destacado ligado al recurso o proceso que el usuario está utilizando. | Sí                                 | Sí                 | No es entrega fuera de la aplicación ni sustituye un work item.                                                  |
| `CHANNEL_INTERNAL_DEVICE_ALERT` | Aviso generado en el dispositivo o navegador por una aplicación VENTO: notificación local nativa o Notification API del navegador.                       | Sí                                 | Sí                 | Sonido, vibración o título de pestaña no son canales independientes.                                             |
| `CHANNEL_PUSH_REMOTE`           | Entrega remota hacia un endpoint registrado de una aplicación mediante un proveedor de push aprobado.                                                    | Sí                                 | Sí                 | El token no define destinatario, permiso, prioridad ni identidad empresarial.                                    |
| `CHANNEL_EMAIL`                 | Correo transaccional dirigido a una dirección vinculada al destinatario y al propósito autorizado.                                                       | Sí                                 | Sí                 | La existencia de correo no habilita por sí sola este canal.                                                      |
| `CHANNEL_EXTERNAL_MESSAGING`    | Mensajería fuera de las aplicaciones VENTO mediante un adaptador aprobado, por ejemplo una plataforma de mensajería empresarial.                         | Sí, cuando la política lo autoriza | Sí                 | No equivale a WhatsApp, SMS, Instagram, ManyChat u otro proveedor específico hasta que exista contrato aprobado. |

`Realtime`, cron, triggers, webhooks, RPC, Edge Functions, colas y llamadas HTTP son mecanismos técnicos de activación o transporte y no se catalogan como canales humanos.

`SIGNAL_LOCAL_AUDIO`, `SIGNAL_HAPTIC` y cambios en el título de una ventana son señales auxiliares. Pueden reforzar un canal interno, pero nunca constituyen una ruta de entrega autónoma.

---

#### 4. Estados de una ruta

| Estado          | Significado                                                                                                          |
| --------------- | -------------------------------------------------------------------------------------------------------------------- |
| `PRIMARY`       | Ruta objetivo principal de la política. Cada política tiene exactamente una.                                         |
| `COMPLEMENTARY` | Superficie adicional de la misma necesidad semántica; no crea otra notificación empresarial.                         |
| `CONDITIONAL`   | Ruta habilitable únicamente cuando el tipo de destinatario y las condiciones canónicas aplicables la hacen elegible. |
| `NO_APLICA`     | La política no autoriza esa clase de canal en su línea base.                                                         |

Una ruta `CONDITIONAL` no significa fallback técnico. Reintentos, indisponibilidad y contingencia pertenecen a `NOTIFY-ARC-008`.

---

#### 5. Reglas transversales de selección y enrutamiento

1. **La necesidad precede al canal.** Primero deben existir origen, destinatario y política vigentes; luego se proyecta la necesidad por las rutas autorizadas.
2. **Una identidad semántica, múltiples proyecciones.** Feed, push, alerta local, correo o mensajería externa que representen la misma necesidad conservan una identidad común y no crean hechos distintos.
3. **La prioridad no selecciona por sí sola el canal.** `P1`, `P2` y `P3` condicionan atención, pero cada fila de esta tarea fija su ruta explícita.
4. **Canal interno cuando existe contexto VENTO útil.** Feed, bandeja, conversación, banner o modal se utilizan cuando la aplicación puede mostrar el recurso o proceso de forma autenticada y trazable.
5. **Push para alcance remoto oportuno.** `CHANNEL_PUSH_REMOTE` se utiliza únicamente cuando el destinatario dispone de una aplicación VENTO compatible y un endpoint registrado válido. El endpoint no participa en la resolución del destinatario.
6. **Alerta de dispositivo para contexto local.** `CHANNEL_INTERNAL_DEVICE_ALERT` es apropiado cuando la propia aplicación o navegador posee contexto suficiente para mostrar el aviso sin convertir el dispositivo en fuente empresarial.
7. **Correo para artefactos cuyo medio de entrega forma parte del flujo.** El correo no se adopta como copia general de avisos internos. En la línea base actual es primario para invitaciones de incorporación.
8. **Mensajería externa no es ruta general.** Solo se habilita en la política que admite contraparte externa sin superficie VENTO y queda subordinada a identidad/contacto válidos, preferencia aplicable y adaptador aprobado.
9. **Sin broadcast por ausencia de endpoint.** Si falta token, sesión, navegador o correo elegible, no se amplía audiencia ni se cambia de destinatario.
10. **Sin cambio silencioso de canal por error.** Una falla de proveedor no habilita automáticamente correo, mensajería externa u otra ruta. La contingencia corresponde a `NOTIFY-ARC-008`.
11. **Proveedor desacoplado del contrato.** Expo y Resend son implementaciones observadas. La identidad canónica es la clase de canal; cambiar proveedor no cambia por sí solo la política.
12. **Canal no concede autorización.** Recibir una URL, deep link, push, correo o mensaje no autoriza a consultar ni mutar el recurso sin revalidar identidad y permisos.
13. **La presentación no prueba recepción.** Banner mostrado, push aceptado por proveedor, correo enviado o notificación del sistema operativo no equivalen a leído, reconocido o atendido.
14. **Una bandeja no es work item.** El canal de notificación conserva la separación entre comunicación y obligación operativa.
15. **Contenido y exposición quedan fuera de esta tarea.** El canal se selecciona aquí; minimización y contenido sensible se gobiernan en `NOTIFY-ARC-009`.

---

#### 6. Matriz materializada de canales por política

| Política            | Prioridad                 | Ruta primaria                   | Ruta complementaria                                           | Ruta condicional                                                                                                                                            | Evidencia técnica actual                                                                                                         | Resultado / bloqueo                                          |
| ------------------- | ------------------------- | ------------------------------- | ------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------- | -------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------ |
| `NOTIFY-POLICY-001` | `P2_ATENCION_PRIORITARIA` | `CHANNEL_INTERNAL_FEED_INBOX`   | `CHANNEL_PUSH_REMOTE`                                         | `NO_APLICA`                                                                                                                                                 | ANIMA conserva feed `Novedades`; `announcement-notify` materializa push remoto.                                                  | `ESPECIFICADO` / sin bloqueo documental.                     |
| `NOTIFY-POLICY-002` | `P2_ATENCION_PRIORITARIA` | `CHANNEL_PUSH_REMOTE`           | `CHANNEL_INTERNAL_DEVICE_ALERT`                               | `NO_APLICA`                                                                                                                                                 | `document-alerts` materializa push; ANIMA conserva notificación local de respaldo.                                               | `ESPECIFICADO` / sin bloqueo documental.                     |
| `NOTIFY-POLICY-003` | `P2_ATENCION_PRIORITARIA` | `CHANNEL_PUSH_REMOTE`           | `CHANNEL_INTERNAL_CONTEXTUAL`                                 | `NO_APLICA`                                                                                                                                                 | `shift-publish-notify` entrega el aviso remoto y referencia el contexto de turnos en ANIMA.                                      | `ESPECIFICADO` / sin bloqueo documental.                     |
| `NOTIFY-POLICY-004` | `P1_URGENTE_OPERATIVA`    | `CHANNEL_PUSH_REMOTE`           | `CHANNEL_INTERNAL_CONTEXTUAL`                                 | `NO_APLICA`                                                                                                                                                 | `shift-publish-notify` distingue actualización de turno y entrega push.                                                          | `ESPECIFICADO` / sin bloqueo documental.                     |
| `NOTIFY-POLICY-005` | `P1_URGENTE_OPERATIVA`    | `CHANNEL_PUSH_REMOTE`           | `CHANNEL_INTERNAL_CONTEXTUAL`                                 | `NO_APLICA`                                                                                                                                                 | `shift-runtime-processor` materializa el recordatorio remoto previo al fin.                                                      | `ESPECIFICADO` / sin bloqueo documental.                     |
| `NOTIFY-POLICY-006` | `P1_URGENTE_OPERATIVA`    | `CHANNEL_PUSH_REMOTE`           | `CHANNEL_INTERNAL_CONTEXTUAL`                                 | `NO_APLICA`                                                                                                                                                 | `shift-runtime-processor` materializa el seguimiento remoto de turno abierto.                                                    | `ESPECIFICADO` / sin bloqueo documental.                     |
| `NOTIFY-POLICY-007` | `P2_ATENCION_PRIORITARIA` | `CHANNEL_INTERNAL_DEVICE_ALERT` | `CHANNEL_INTERNAL_CONTEXTUAL`                                 | `NO_APLICA`                                                                                                                                                 | ANIMA presenta notificación local y `Alert`; la señal háptica permanece auxiliar.                                                | `ESPECIFICADO` / sin bloqueo documental.                     |
| `NOTIFY-POLICY-008` | `P2_ATENCION_PRIORITARIA` | `CHANNEL_INTERNAL_FEED_INBOX`   | `CHANNEL_PUSH_REMOTE`                                         | `NO_APLICA`                                                                                                                                                 | ANIMA conserva badge/contexto de soporte; `support-message-notify` materializa push remoto.                                      | `ESPECIFICADO` / sin bloqueo documental.                     |
| `NOTIFY-POLICY-009` | `P2_ATENCION_PRIORITARIA` | `CHANNEL_EMAIL`                 | `NO_APLICA`                                                   | `NO_APLICA`                                                                                                                                                 | Las funciones de invitación registran entrega por correo y usan Resend para el envío.                                            | `ESPECIFICADO` / sin bloqueo documental.                     |
| `NOTIFY-POLICY-010` | `P3_INFORMATIVA`          | `CHANNEL_INTERNAL_DEVICE_ALERT` | `CHANNEL_INTERNAL_CONTEXTUAL`                                 | `NO_APLICA`                                                                                                                                                 | PASS programa notificación local para ascenso de nivel.                                                                          | `ESPECIFICADO` / sin bloqueo documental.                     |
| `NOTIFY-POLICY-011` | `P3_INFORMATIVA`          | `CHANNEL_INTERNAL_DEVICE_ALERT` | `CHANNEL_INTERNAL_CONTEXTUAL`                                 | `NO_APLICA`                                                                                                                                                 | PASS programa notificación local cuando una recompensa pasa a ser alcanzable.                                                    | `ESPECIFICADO` / sin bloqueo documental.                     |
| `NOTIFY-POLICY-012` | `P3_INFORMATIVA`          | `CHANNEL_INTERNAL_CONTEXTUAL`   | `CHANNEL_INTERNAL_DEVICE_ALERT`                               | `NO_APLICA`                                                                                                                                                 | PASS conserva modal contextual y notificación local para la oportunidad de feedback.                                             | `ESPECIFICADO` / sin bloqueo documental.                     |
| `NOTIFY-POLICY-013` | `P2_ATENCION_PRIORITARIA` | `CHANNEL_INTERNAL_FEED_INBOX`   | `CHANNEL_PUSH_REMOTE` para cliente PASS con endpoint elegible | `CHANNEL_EXTERNAL_MESSAGING` únicamente para contraparte externa sin superficie VENTO cuando la política de preferencia y un adaptador aprobado lo permitan | PULSO conserva conversación e inbox; PASS registra endpoint push y el estado desplegado contiene la función de aviso de mensaje. | `ESPECIFICADO` / `PARIDAD_REPOSITORIO_DESPLIEGUE_PENDIENTE`. |
| `NOTIFY-POLICY-014` | `P1_URGENTE_OPERATIVA`    | `CHANNEL_INTERNAL_CONTEXTUAL`   | `CHANNEL_INTERNAL_DEVICE_ALERT`                               | `NO_APLICA`                                                                                                                                                 | PULSO presenta banner y Notification API del navegador; audio y título son señales auxiliares.                                   | `ESPECIFICADO` / sin bloqueo documental.                     |
| `NOTIFY-POLICY-015` | `P1_URGENTE_OPERATIVA`    | `CHANNEL_INTERNAL_CONTEXTUAL`   | `CHANNEL_INTERNAL_DEVICE_ALERT`                               | `NO_APLICA`                                                                                                                                                 | PULSO presenta el aviso de pago conciliado mediante la misma superficie operativa y Notification API.                            | `ESPECIFICADO` / sin bloqueo documental.                     |

---

#### 7. Resolución cerrada de la ruta PASS para mensajes de pedido

La brecha heredada de `NOTIFY-ASIS-013` queda resuelta en dos planos diferentes.

##### 7.1 Decisión de canal

Para el lado cliente de `NOTIFY-POLICY-013`:

```text
CONVERSACIÓN PERSISTIDA Y AUTORIZADA
        ↓
CHANNEL_INTERNAL_FEED_INBOX
        +
CHANNEL_PUSH_REMOTE CUANDO EXISTE ENDPOINT ELEGIBLE
```

La conversación persistida es la superficie primaria. Push es una proyección complementaria para llamar la atención del mismo cliente y del mismo mensaje.

Para el lado operativo:

```text
CONVERSACIÓN / INBOX PULSO
        ↓
CHANNEL_INTERNAL_FEED_INBOX
```

No se introduce push operativo por inferencia. La ruta actual de PULSO conserva bandeja y no le asigna una ruta remota que no esté materializada.

Para una contraparte externa explícita sin superficie VENTO:

```text
CHANNEL_EXTERNAL_MESSAGING
        ↓
SOLO CON IDENTIDAD O CONTACTO VERIFICADO
+ PREFERENCIA APLICABLE
+ ADAPTADOR EXTERNO APROBADO
```

La clase externa queda autorizada condicionalmente; no se selecciona WhatsApp, SMS, Instagram, ManyChat ni otro proveedor específico.

##### 7.2 Reconciliación técnica actual

El estado desplegado accesible de `vento-os-dev` contiene activas:

- `pass-register-push-token`;
- `order-message-notify`.

La primera registra endpoints del cliente; la segunda entrega por Expo Push al cliente de la conversación para un mensaje de pedido válido.

En `vento-shell/main`, las fuentes de esas dos funciones no están presentes en sus ubicaciones esperadas. Por tanto:

```text
CANAL OBJETIVO PASS
= DEFINIDO

CAPACIDAD DESPLEGADA OBSERVADA
= PRESENTE

PARIDAD DE FUENTE CANÓNICA EN vento-shell/main
= INCOMPLETA
```

Esta diferencia no impide cerrar el diseño documental de `NOTIFY-ARC-005`, pero impide declarar que la implementación PASS está completamente versionada desde el repositorio propietario.

**Propietario de corrección:** `SUPA-TRANS-007`, que ya gobierna la adaptación exacta de repositorios y consumidores.

**Puerta de inclusión en el carril prioritario:** `NEXO-REMISSIONS-001::CONDITIONAL_IMPLEMENTATION_SCOPE`.

**Condición de salida:** las funciones desplegadas que permanezcan necesarias deberán tener fuente versionada y trazable en `vento-shell`, con consumidores reconciliados, antes de considerarse implementación canónica cerrada.

Esta tarea no copia, despliega, modifica ni elimina esas funciones.

---

#### 8. Política de mensajería externa

`CHANNEL_EXTERNAL_MESSAGING` no se adopta como canal general del ecosistema.

La única política del universo actual que lo admite es `NOTIFY-POLICY-013`, porque su regla de destinatario puede resolver una contraparte externa explícita dentro de una conversación de pedido.

Condiciones acumulativas:

1. la contraparte externa está vinculada de forma inequívoca a la conversación;
2. existe un contacto autorizado para ese propósito;
3. la preferencia o base de obligatoriedad aplicable queda resuelta por `NOTIFY-ARC-006`;
4. la minimización de contenido queda resuelta por `NOTIFY-ARC-009`;
5. existe un adaptador externo aprobado y autenticado;
6. el envío conserva la identidad semántica de la misma necesidad y no crea una conversación paralela como fuente de verdad;
7. respuestas entrantes solo podrán producir efectos mediante el contrato empresarial correspondiente;
8. la indisponibilidad del proveedor no habilita otro canal externo por inferencia.

Los soportes AS-IS WhatsApp, ManyChat, Instagram, llamadas, mensajes, reuniones, Rappi o Shopify no se convierten automáticamente en rutas objetivo de notificación.

---

#### 9. Reconciliación cuantitativa

##### 9.1 Cobertura primaria

| Ruta primaria                   | Políticas |
| ------------------------------- | --------: |
| `CHANNEL_INTERNAL_FEED_INBOX`   |         3 |
| `CHANNEL_INTERNAL_CONTEXTUAL`   |         3 |
| `CHANNEL_INTERNAL_DEVICE_ALERT` |         3 |
| `CHANNEL_PUSH_REMOTE`           |         5 |
| `CHANNEL_EMAIL`                 |         1 |
| `CHANNEL_EXTERNAL_MESSAGING`    |         0 |
| **Total**                       |    **15** |

##### 9.2 Cobertura total por clase

Una política puede utilizar más de una clase porque una ruta complementaria sigue representando la misma necesidad.

| Canal                           | Políticas con uso primario o complementario/condicional |
| ------------------------------- | ------------------------------------------------------: |
| `CHANNEL_INTERNAL_FEED_INBOX`   |                                                       3 |
| `CHANNEL_INTERNAL_CONTEXTUAL`   |                                                      10 |
| `CHANNEL_INTERNAL_DEVICE_ALERT` |                                                       7 |
| `CHANNEL_PUSH_REMOTE`           |                                                       8 |
| `CHANNEL_EMAIL`                 |                                                       1 |
| `CHANNEL_EXTERNAL_MESSAGING`    |                                           1 condicional |

##### 9.3 Integridad

```text
POLÍTICAS RECIBIDAS: 15
POLÍTICAS MATERIALIZADAS: 15
ORÍGENES CUBIERTOS: 15 DE 15
REGLAS DE DESTINATARIO CONSERVADAS: 15 DE 15
FAMILIAS AS-IS CUBIERTAS: 16 DE 16
POLÍTICAS SIN RUTA PRIMARIA: 0
POLÍTICAS CON MÁS DE UNA RUTA PRIMARIA: 0
POLÍTICAS DUPLICADAS: 0
RUTAS EXTERNAS CONDICIONALES: 1
BRECHAS DE PARIDAD REPOSITORIO/DESPLIEGUE: 1
DECISIONES ABIERTAS DENTRO DE NOTIFY-ARC-005: 0
```

---

#### 10. Decisiones canónicas consolidadas

1. El modelo utiliza seis clases de canal y separa canal humano de transporte técnico.
2. Cada una de las quince políticas tiene exactamente una ruta primaria.
3. Una ruta complementaria representa la misma necesidad y no genera otra identidad de notificación.
4. El canal interno persistente es primario para comunicación organizacional, soporte y conversación de pedido.
5. Push remoto es primario para vencimiento documental y las cuatro necesidades de programación/asistencia que requieren alcance oportuno fuera de la superficie activa.
6. La confirmación de check-out y las dos señales informativas de fidelización usan alerta de dispositivo como ruta primaria.
7. La oportunidad de feedback y las dos alertas operativas de PULSO usan una superficie interna contextual como ruta primaria.
8. La invitación de incorporación usa correo como única ruta primaria.
9. Correo no se convierte en copia general de las demás políticas.
10. Mensajería externa no se convierte en fallback general ni en broadcast.
11. `NOTIFY-POLICY-013` es la única política que admite mensajería externa condicional en el universo actual.
12. Para mensajes de pedido hacia clientes PASS, la conversación es primaria y push remoto es complementario.
13. Para mensajes de pedido hacia operación, la bandeja PULSO es primaria y no se agrega push operativo por inferencia.
14. La capacidad push PASS está desplegada, pero su fuente no está completamente versionada en `vento-shell/main`; la brecha queda asignada a una tarea existente y no se oculta.
15. Expo y Resend permanecen como proveedores observados, no como identidades canónicas de canal.
16. Realtime, cron, triggers, Edge Functions y RPC no se clasifican como canales humanos.
17. Audio, háptica y título de ventana permanecen como señales auxiliares.
18. La selección de canal no modifica destinatarios, permisos, prioridad, vigencia, deduplicación ni propiedad empresarial.
19. La preferencia del usuario no se decide en esta tarea.
20. Una falla de entrega no autoriza cambiar de canal; su tratamiento pertenece a la tarea de contingencia.
21. La tarea no crea implementación, configuración, secretos, proveedor, token, tabla, migración ni despliegue.

---

#### 11. Requisitos de prueba derivados

**Resultado:** NO GENERA REQUISITOS DE PRUEBA

**Justificación:** la tarea materializa una especialización documental de rutas de comunicación sobre comportamientos transversales ya registrados en el registro canónico: identidad e idempotencia de operaciones asíncronas, trazabilidad de cadenas de notificación, separación entre hecho empresarial, notificación y transporte, y conservación de comunicaciones entregadas. No crea ni modifica comportamiento ejecutable, proveedor, adaptador, esquema, política de seguridad o mecanismo de entrega. Por tanto, no altera el registro de requisitos.

**Balance:** 0 creados; 0 modificados; 0 diferidos; 0 descartados; 0 obsoletos.

---

#### 12. Decisiones posteriores reservadas y propietarios exactos

| Decisión no tomada                                                             | Tarea propietaria                                       |
| ------------------------------------------------------------------------------ | ------------------------------------------------------- |
| Preferencias, opt-in/opt-out y alertas que no pueden ocultarse                 | `NOTIFY-ARC-006`                                        |
| Confirmación, lectura, atención, escalamiento y supervisión                    | `NOTIFY-ARC-007`                                        |
| Reintentos, fallos, resultado `UNRESOLVED_RECIPIENT` y contingencia de entrega | `NOTIFY-ARC-008`                                        |
| Privacidad, contenido sensible y minimización por canal                        | `NOTIFY-ARC-009`                                        |
| Métricas, trazas y auditoría de entrega                                        | `NOTIFY-ARC-010`                                        |
| Paridad de fuente de Edge Functions y adaptación exacta de consumidores        | `SUPA-TRANS-007`                                        |
| Decisión de incluir esa corrección en la ejecución prioritaria NEXO            | `NEXO-REMISSIONS-001::CONDITIONAL_IMPLEMENTATION_SCOPE` |

No queda una decisión de selección de canal sin resolver dentro de `NOTIFY-ARC-005`.

---

#### 13. Criterios de aceptación

- [x] las 15 políticas heredadas están representadas exactamente una vez;
- [x] los 15 orígenes y las 15 reglas de destinatario permanecen sin cambios;
- [x] las 16 familias AS-IS conservan cobertura;
- [x] cada política tiene exactamente una ruta primaria;
- [x] toda ruta complementaria representa la misma necesidad semántica;
- [x] las clases internas distinguen feed/inbox, aviso contextual y alerta de dispositivo;
- [x] push remoto queda separado de notificación local y de Notification API del navegador;
- [x] correo queda limitado a la política cuya entrega de incorporación lo requiere;
- [x] mensajería externa queda limitada y condicionada, sin seleccionar proveedor;
- [x] Realtime, cron, triggers, RPC y Edge Functions no se confunden con canales humanos;
- [x] audio, háptica y título de ventana permanecen como señales auxiliares;
- [x] la ruta PASS de mensaje de pedido queda definida para cliente, operación y contraparte externa;
- [x] la capacidad desplegada PASS se distingue de la paridad de fuente en `vento-shell/main`;
- [x] la brecha de paridad tiene propietario documental y condición de salida;
- [x] no se altera prioridad, vigencia, deduplicación, origen ni destinatario;
- [x] no se definen preferencias;
- [x] no se define confirmación, lectura ni escalamiento;
- [x] no se definen reintentos ni fallback técnico;
- [x] no se define contenido sensible;
- [x] no se definen métricas ni auditoría de entrega;
- [x] no se modifica código, Supabase, migraciones, proveedores ni operación;
- [x] la tarea genera cero cambios en requisitos de prueba;
- [x] `NOTIFY-ARC-006` permanece únicamente reservada.

---

#### 14. Handoff cerrado hacia NOTIFY-ARC-006

`NOTIFY-ARC-005` entrega quince políticas con canal primario, rutas complementarias y una única elegibilidad externa condicional ya materializadas.

`NOTIFY-ARC-006` recibe exclusivamente la responsabilidad de decidir, sobre esas rutas ya seleccionadas:

- cuáles admiten preferencia del destinatario;
- qué opt-in u opt-out es aplicable;
- qué necesidad no puede ocultarse por preferencia;
- cómo se interpreta una preferencia por identidad, canal y contexto.

`NOTIFY-ARC-006` no recibe autorización para cambiar orígenes, destinatarios, prioridad, vigencia, deduplicación o las clases de canal aprobadas en esta tarea sin una corrección explícita de su fuente propietaria.

La aprobación de `NOTIFY-ARC-005` no inicia ni desarrolla `NOTIFY-ARC-006`.

---

#### 15. Continuidad

ÚLTIMA TAREA APROBADA
`NOTIFY-ARC-004 — Definir prioridad, vigencia y deduplicación`

TAREA ACTUAL APROBADA
`NOTIFY-ARC-005 — Definir canales internos, correo, push o mensajería externa`

SIGUIENTE TAREA RESERVADA
`NOTIFY-ARC-006 — Definir preferencias sin ocultar alertas obligatorias`


### ✅ NOTIFY-ARC-006 — Definir preferencias sin ocultar alertas obligatorias

**Estado:** APROBADA
**Tarea anterior:** `NOTIFY-ARC-005 — Definir canales internos, correo, push o mensajería externa` — APROBADA
**Tarea siguiente:** `NOTIFY-ARC-007 — Definir confirmación, lectura y escalamiento` — RESERVADA
**Tipo de tarea:** documental; matriz materializada de preferencia por política y canal, con precedencia explícita de alertas obligatorias y separación entre preferencia empresarial, permiso técnico y disponibilidad del canal
**Repositorio propietario:** `vento-shell`
**Archivo propietario:** `docs/plan-canonico/modular/bloques/E4_SERVICIOS_TRANSVERSALES/05_NOTIFICACIONES_Y_ALERTAS.md`
**Cambios físicos autorizados:** ninguno; no crea ni modifica código, tablas, RLS, Edge Functions, migraciones, tokens, permisos del sistema operativo, proveedores, secretos, canales desplegados ni configuración de Supabase
**Requisitos de prueba creados o modificados:** 0

**Qué se hace:** definir para cada `NOTIFY-POLICY-*` si la necesidad de notificación es obligatoria o configurable, qué canal puede ser silenciado por preferencia, qué estado inicial aplica, cómo se resuelven preferencias por identidad y cómo se separan de permisos de dispositivo o navegador, sin cambiar origen, destinatario, prioridad, vigencia, deduplicación, selección de canal, confirmación, escalamiento, reintentos, privacidad ni métricas.

---

#### 1. Resultado sustantivo

`NOTIFY-ARC-006` queda documentalmente cerrada con:

- 15 reglas `NOTIFY-PREFERENCE-001` a `NOTIFY-PREFERENCE-015`;
- 15 políticas `NOTIFY-POLICY-001` a `NOTIFY-POLICY-015` cubiertas exactamente una vez;
- 15 orígenes y 15 reglas de destinatario conservados sin modificación;
- 16 familias AS-IS cubiertas mediante las políticas heredadas;
- 3 modos canónicos de preferencia;
- 12 políticas con núcleo obligatorio no silenciable dentro de VENTO;
- 3 políticas informativas configurables;
- 1 canal externo condicionado a habilitación explícita;
- 0 políticas sin decisión de preferencia;
- 0 políticas duplicadas;
- 0 controles globales autorizados para desactivar alertas obligatorias;
- 0 cambios físicos ejecutados.

Toda regla queda en estado documental `ESPECIFICADO`. Una preferencia gobierna la proyección de una necesidad hacia un canal configurable; nunca redefine el hecho empresarial, el destinatario ni la obligación subyacente.

---

#### 2. Entradas conservadas

La tarea consume y preserva:

1. `NOTIFY-ARC-001`, con el inventario AS-IS de avisos y mecanismos técnicos;
2. `NOTIFY-ARC-002`, con quince orígenes empresariales;
3. `NOTIFY-ARC-003`, con quince reglas de destinatario;
4. `NOTIFY-ARC-004`, con prioridad, vigencia, agrupación y deduplicación para quince políticas;
5. `NOTIFY-ARC-005`, con un canal primario por política, canales complementarios y una única elegibilidad de mensajería externa;
6. el modelo de cliente aprobado, que separa persona, cuenta, contacto, consentimiento y preferencia;
7. el comportamiento técnico actual de ANIMA, PASS y PULSO utilizado únicamente como evidencia del estado AS-IS.

Las decisiones heredadas no se reinterpretan. Esta tarea define capacidad de preferencia sobre la comunicación, no sobre la existencia del hecho o de la responsabilidad empresarial.

---

#### 3. Separación obligatoria entre preferencia, permiso y capacidad técnica

Se fijan tres conceptos distintos:

| Concepto               | Qué representa                                                                                                | Propietario de la decisión                         | Puede silenciar una alerta obligatoria                                                                    |
| ---------------------- | ------------------------------------------------------------------------------------------------------------- | -------------------------------------------------- | --------------------------------------------------------------------------------------------------------- |
| `BUSINESS_PREFERENCE`  | Elección persistente de una identidad sobre una comunicación configurable y un canal permitido.               | VENTO, según esta tarea y la identidad autorizada. | No.                                                                                                       |
| `TECHNICAL_PERMISSION` | Permiso concedido o negado por sistema operativo, navegador o dispositivo para usar una capacidad técnica.    | Usuario y plataforma del dispositivo.              | Puede impedir físicamente un canal, pero no convierte la necesidad en opcional ni en opt-out empresarial. |
| `CHANNEL_CAPABILITY`   | Disponibilidad real de token, sesión, navegador, dirección, adaptador o proveedor para materializar el canal. | Estado técnico observable.                         | Puede bloquear la entrega, pero no cambia la preferencia ni elimina la necesidad.                         |

Reglas derivadas:

1. `notifications_enabled`, `permission_status`, un token activo o `Notification.permission` no constituyen por sí solos una preferencia empresarial.
2. Una denegación del sistema operativo no se almacenará conceptualmente como `DISABLED` por preferencia del negocio.
3. Una preferencia `DISABLED` no revoca permisos del sistema operativo ni invalida un token; únicamente evita usarlo para políticas configurables.
4. Una política obligatoria no podrá aceptar `DISABLED` como estado efectivo dentro de VENTO.
5. Si un canal obligatorio queda técnicamente bloqueado, el resultado será una condición de entrega no satisfecha cuya resolución pertenece a `NOTIFY-ARC-008`; no se transformará silenciosamente en opt-out.
6. Una preferencia no concede acceso al recurso ni sustituye autorización, consentimiento o relación de destinatario.

---

#### 4. Catálogo canónico de modos de preferencia

| Modo                           | Estado inicial                                  | Cambio por usuario                                   | Semántica                                                                                                                                                   |
| ------------------------------ | ----------------------------------------------- | ---------------------------------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `PREF_REQUIRED_LOCKED`         | `ENABLED`                                       | No permite `DISABLED` dentro de VENTO.               | La necesidad o el canal indicado son obligatorios mientras la política sea aplicable. Un bloqueo técnico se registra aparte.                                |
| `PREF_CONFIGURABLE_DEFAULT_ON` | `ENABLED` mientras no exista elección explícita | Permite `ENABLED` o `DISABLED`.                      | La comunicación proactiva se mantiene por defecto, pero la identidad puede silenciar esa proyección sin ocultar el estado o recurso empresarial subyacente. |
| `PREF_EXPLICIT_OPT_IN`         | `DISABLED`                                      | Solo pasa a `ENABLED` por elección explícita válida. | El canal no se usa hasta existir habilitación positiva para esa finalidad y ese alcance.                                                                    |

`NO_APLICA` se utiliza únicamente cuando una política no posee ese canal; no es un modo de preferencia.

---

#### 5. Estados y contrato lógico de una preferencia

Una preferencia configurable utilizará:

```text
UNSET
ENABLED
DISABLED
```

`UNSET` significa que no existe elección explícita y debe resolverse el estado inicial del modo. Para `PREF_REQUIRED_LOCKED`, el estado efectivo es siempre `ENABLED` mientras la política sea aplicable.

El contrato lógico mínimo de una preferencia será:

```text
subject_identity
policy_id
channel_class
preference_mode
explicit_state
purpose
scope
source
set_at
effective_state
```

Reglas de identidad:

1. la preferencia pertenece a una identidad, no a un token, navegador, instalación o dispositivo;
2. varios dispositivos de una misma identidad comparten la preferencia empresarial, pero conservan permisos técnicos independientes;
3. un dispositivo compartido no hereda la preferencia del usuario anterior;
4. un cambio de sede, función, turno o responsabilidad no crea una preferencia nueva, pero la política solo se aplica cuando la identidad vuelve a ser destinataria válida;
5. una preferencia de cliente no se transfiere automáticamente a otra cuenta, contacto, persona o relación de marca;
6. una preferencia sobre mensajería externa se vincula además a finalidad, contacto y alcance autorizados.

---

#### 6. Precedencia determinista

El estado efectivo se resuelve en este orden:

```text
1. APLICABILIDAD DE LA POLÍTICA Y DESTINATARIO VÁLIDO
2. PREF_REQUIRED_LOCKED, SI APLICA
3. PREFERENCIA EXPLÍCITA POLÍTICA + CANAL
4. PREFERENCIA EXPLÍCITA DE CATEGORÍA OPCIONAL, SI EXISTE
5. PREFERENCIA GLOBAL PARA COMUNICACIONES OPCIONALES, SI EXISTE
6. ESTADO INICIAL DEL MODO
7. PERMISO TÉCNICO Y CAPACIDAD DEL CANAL
```

Consecuencias obligatorias:

- una preferencia global nunca vence a `PREF_REQUIRED_LOCKED`;
- no existirá un control semántico “desactivar todas las notificaciones” que incluya alertas obligatorias;
- si existe una acción global de silencio, su alcance será únicamente el conjunto configurable y deberá indicarlo expresamente;
- una preferencia específica puede ser más restrictiva que una preferencia global opcional;
- `PREF_EXPLICIT_OPT_IN` no puede activarse por un default global;
- el permiso técnico se evalúa después de la preferencia porque describe posibilidad de entrega, no voluntad empresarial;
- la falta de permiso técnico en una política obligatoria no modifica su estado `ENABLED`.

---

#### 7. Matriz materializada de preferencias por política

| Regla                   | Política            | Prioridad                 | Canal primario / modo                                            | Canal complementario / modo                                                                 | Canal condicional / modo                              | Silencio temporal                                                                   | Resultado      |
| ----------------------- | ------------------- | ------------------------- | ---------------------------------------------------------------- | ------------------------------------------------------------------------------------------- | ----------------------------------------------------- | ----------------------------------------------------------------------------------- | -------------- |
| `NOTIFY-PREFERENCE-001` | `NOTIFY-POLICY-001` | `P2_ATENCION_PRIORITARIA` | `CHANNEL_INTERNAL_FEED_INBOX` / `PREF_REQUIRED_LOCKED`           | `CHANNEL_PUSH_REMOTE` / `PREF_CONFIGURABLE_DEFAULT_ON`                                      | `NO_APLICA`                                           | Solo sobre push configurable.                                                       | `ESPECIFICADO` |
| `NOTIFY-PREFERENCE-002` | `NOTIFY-POLICY-002` | `P2_ATENCION_PRIORITARIA` | `CHANNEL_PUSH_REMOTE` / `PREF_REQUIRED_LOCKED`                   | `CHANNEL_INTERNAL_DEVICE_ALERT` / `PREF_REQUIRED_LOCKED` cuando sea técnicamente posible    | `NO_APLICA`                                           | No aplica.                                                                          | `ESPECIFICADO` |
| `NOTIFY-PREFERENCE-003` | `NOTIFY-POLICY-003` | `P2_ATENCION_PRIORITARIA` | `CHANNEL_PUSH_REMOTE` / `PREF_REQUIRED_LOCKED`                   | `CHANNEL_INTERNAL_CONTEXTUAL` / `PREF_REQUIRED_LOCKED`                                      | `NO_APLICA`                                           | No aplica.                                                                          | `ESPECIFICADO` |
| `NOTIFY-PREFERENCE-004` | `NOTIFY-POLICY-004` | `P1_URGENTE_OPERATIVA`    | `CHANNEL_PUSH_REMOTE` / `PREF_REQUIRED_LOCKED`                   | `CHANNEL_INTERNAL_CONTEXTUAL` / `PREF_REQUIRED_LOCKED`                                      | `NO_APLICA`                                           | No aplica.                                                                          | `ESPECIFICADO` |
| `NOTIFY-PREFERENCE-005` | `NOTIFY-POLICY-005` | `P1_URGENTE_OPERATIVA`    | `CHANNEL_PUSH_REMOTE` / `PREF_REQUIRED_LOCKED`                   | `CHANNEL_INTERNAL_CONTEXTUAL` / `PREF_REQUIRED_LOCKED`                                      | `NO_APLICA`                                           | No aplica.                                                                          | `ESPECIFICADO` |
| `NOTIFY-PREFERENCE-006` | `NOTIFY-POLICY-006` | `P1_URGENTE_OPERATIVA`    | `CHANNEL_PUSH_REMOTE` / `PREF_REQUIRED_LOCKED`                   | `CHANNEL_INTERNAL_CONTEXTUAL` / `PREF_REQUIRED_LOCKED`                                      | `NO_APLICA`                                           | No aplica.                                                                          | `ESPECIFICADO` |
| `NOTIFY-PREFERENCE-007` | `NOTIFY-POLICY-007` | `P2_ATENCION_PRIORITARIA` | `CHANNEL_INTERNAL_DEVICE_ALERT` / `PREF_REQUIRED_LOCKED`         | `CHANNEL_INTERNAL_CONTEXTUAL` / `PREF_REQUIRED_LOCKED`                                      | `NO_APLICA`                                           | No aplica.                                                                          | `ESPECIFICADO` |
| `NOTIFY-PREFERENCE-008` | `NOTIFY-POLICY-008` | `P2_ATENCION_PRIORITARIA` | `CHANNEL_INTERNAL_FEED_INBOX` / `PREF_REQUIRED_LOCKED`           | `CHANNEL_PUSH_REMOTE` / `PREF_CONFIGURABLE_DEFAULT_ON`                                      | `NO_APLICA`                                           | Solo sobre push configurable.                                                       | `ESPECIFICADO` |
| `NOTIFY-PREFERENCE-009` | `NOTIFY-POLICY-009` | `P2_ATENCION_PRIORITARIA` | `CHANNEL_EMAIL` / `PREF_REQUIRED_LOCKED`                         | `NO_APLICA`                                                                                 | `NO_APLICA`                                           | No aplica.                                                                          | `ESPECIFICADO` |
| `NOTIFY-PREFERENCE-010` | `NOTIFY-POLICY-010` | `P3_INFORMATIVA`          | `CHANNEL_INTERNAL_DEVICE_ALERT` / `PREF_CONFIGURABLE_DEFAULT_ON` | `CHANNEL_INTERNAL_CONTEXTUAL` / `PREF_CONFIGURABLE_DEFAULT_ON` para la proyección proactiva | `NO_APLICA`                                           | Permitido.                                                                          | `ESPECIFICADO` |
| `NOTIFY-PREFERENCE-011` | `NOTIFY-POLICY-011` | `P3_INFORMATIVA`          | `CHANNEL_INTERNAL_DEVICE_ALERT` / `PREF_CONFIGURABLE_DEFAULT_ON` | `CHANNEL_INTERNAL_CONTEXTUAL` / `PREF_CONFIGURABLE_DEFAULT_ON` para la proyección proactiva | `NO_APLICA`                                           | Permitido.                                                                          | `ESPECIFICADO` |
| `NOTIFY-PREFERENCE-012` | `NOTIFY-POLICY-012` | `P3_INFORMATIVA`          | `CHANNEL_INTERNAL_CONTEXTUAL` / `PREF_CONFIGURABLE_DEFAULT_ON`   | `CHANNEL_INTERNAL_DEVICE_ALERT` / `PREF_CONFIGURABLE_DEFAULT_ON`                            | `NO_APLICA`                                           | Permitido.                                                                          | `ESPECIFICADO` |
| `NOTIFY-PREFERENCE-013` | `NOTIFY-POLICY-013` | `P2_ATENCION_PRIORITARIA` | `CHANNEL_INTERNAL_FEED_INBOX` / `PREF_REQUIRED_LOCKED`           | `CHANNEL_PUSH_REMOTE` / `PREF_CONFIGURABLE_DEFAULT_ON` para cliente PASS elegible           | `CHANNEL_EXTERNAL_MESSAGING` / `PREF_EXPLICIT_OPT_IN` | Solo sobre push y mensajería configurables; nunca sobre la conversación persistida. | `ESPECIFICADO` |
| `NOTIFY-PREFERENCE-014` | `NOTIFY-POLICY-014` | `P1_URGENTE_OPERATIVA`    | `CHANNEL_INTERNAL_CONTEXTUAL` / `PREF_REQUIRED_LOCKED`           | `CHANNEL_INTERNAL_DEVICE_ALERT` / `PREF_CONFIGURABLE_DEFAULT_ON`                            | `NO_APLICA`                                           | Solo sobre la alerta complementaria; nunca sobre el aviso contextual.               | `ESPECIFICADO` |
| `NOTIFY-PREFERENCE-015` | `NOTIFY-POLICY-015` | `P1_URGENTE_OPERATIVA`    | `CHANNEL_INTERNAL_CONTEXTUAL` / `PREF_REQUIRED_LOCKED`           | `CHANNEL_INTERNAL_DEVICE_ALERT` / `PREF_CONFIGURABLE_DEFAULT_ON`                            | `NO_APLICA`                                           | Solo sobre la alerta complementaria; nunca sobre el aviso contextual.               | `ESPECIFICADO` |

---

#### 8. Políticas obligatorias y frontera de no ocultamiento

Las siguientes doce políticas conservan al menos un núcleo obligatorio:

```text
NOTIFY-POLICY-001
NOTIFY-POLICY-002
NOTIFY-POLICY-003
NOTIFY-POLICY-004
NOTIFY-POLICY-005
NOTIFY-POLICY-006
NOTIFY-POLICY-007
NOTIFY-POLICY-008
NOTIFY-POLICY-009
NOTIFY-POLICY-013
NOTIFY-POLICY-014
NOTIFY-POLICY-015
```

Para estas políticas:

1. la aplicación no mostrará un opt-out que elimine la necesidad obligatoria;
2. una bandeja o aviso contextual obligatorio no podrá ocultarse mediante preferencia global;
3. cuando el canal primario obligatorio sea push, la aplicación no ofrecerá un mute empresarial para esa política;
4. la denegación del sistema operativo se conserva como bloqueo técnico, no como preferencia válida;
5. un canal complementario configurable puede silenciarse cuando el canal primario obligatorio sigue preservando la necesidad;
6. deshabilitar una señal auxiliar como sonido no equivale a deshabilitar el aviso obligatorio;
7. una política obligatoria deja de aplicar únicamente por su vigencia, su destinatario o las condiciones heredadas de `NOTIFY-ARC-002` a `NOTIFY-ARC-004`, no por una preferencia.

---

#### 9. Políticas configurables

`NOTIFY-POLICY-010`, `NOTIFY-POLICY-011` y `NOTIFY-POLICY-012` son comunicaciones proactivas `P3_INFORMATIVA` configurables.

Reglas:

1. su estado inicial es `ENABLED` para conservar el comportamiento informativo vigente mientras no exista una elección explícita;
2. la identidad puede pasar la comunicación proactiva a `DISABLED`;
3. deshabilitar la notificación no elimina nivel de fidelización, elegibilidad de recompensa, redención, historial ni demás estado empresarial cuando el usuario consulta la aplicación;
4. un cambio de `DISABLED` a `ENABLED` no reactiva retrospectivamente ocurrencias ya vencidas;
5. la preferencia se aplica a nuevas ocurrencias todavía vigentes conforme a la política heredada;
6. silencio temporal puede aplicarse a estas políticas sin afectar alertas obligatorias.

---

#### 10. Mensajería externa de NOTIFY-POLICY-013

`CHANNEL_EXTERNAL_MESSAGING` utiliza exclusivamente `PREF_EXPLICIT_OPT_IN`.

Condiciones acumulativas para estado efectivo `ENABLED`:

1. existe una contraparte externa resoluble y vinculada a la conversación;
2. existe un contacto válido para la finalidad correspondiente;
3. existe una habilitación explícita vigente para esa finalidad y canal;
4. la identidad, contacto, finalidad y alcance de la habilitación pueden reconstruirse;
5. existe un adaptador externo aprobado conforme a `NOTIFY-ARC-005`;
6. el canal no sustituye la conversación persistida como fuente de verdad;
7. una revocación posterior cambia el estado efectivo para nuevos envíos, sin borrar comunicaciones ya emitidas.

`UNSET` resuelve a `DISABLED` para mensajería externa. Ninguna preferencia global, permiso de dispositivo o disponibilidad de proveedor podrá activar este canal por inferencia.

---

#### 11. Silencio temporal y controles globales

Se define `QUIET_WINDOW` como una preferencia temporal aplicable únicamente a proyecciones configurables.

Reglas:

1. una ventana de silencio nunca suspende `PREF_REQUIRED_LOCKED`;
2. puede posponer o evitar la proyección configurable solo mientras la ocurrencia siga vigente;
3. al terminar la ventana no se reenvían automáticamente ocurrencias vencidas;
4. no altera deduplicación ni crea una nueva ocurrencia;
5. el tratamiento de una ocurrencia que siga vigente al finalizar la ventana pertenece a la política de entrega y reintento de `NOTIFY-ARC-008`;
6. un control global de comunicaciones opcionales solo modifica políticas o canales configurables;
7. la interfaz deberá indicar que alertas operativas y comunicaciones obligatorias permanecen activas.

La función “No molestar” del sistema operativo o navegador es un estado técnico externo y no se modela como `QUIET_WINDOW` empresarial.

---

#### 12. Reconciliación con el estado técnico actual

##### 12.1. ANIMA

El código actual sincroniza `permission_status` y `notifications_enabled` con el permiso reportado por el dispositivo. La definición física vigente describe `notifications_enabled` como verdadero cuando el dispositivo reporta permiso concedido.

Resultado documental:

```text
ESTADO ACTUAL = CAPACIDAD / PERMISO TÉCNICO
MODELO OBJETIVO DE ESTA TAREA = PREFERENCIA EMPRESARIAL SEPARADA
```

Por tanto, esos campos no deberán reinterpretarse como opt-in u opt-out por política.

##### 12.2. PASS

El cliente actual solicita permiso de notificaciones, registra token cuando el permiso queda concedido y aplica throttling local por tipo de notificación.

Resultado documental:

- permiso del sistema operativo no equivale a preferencia por política;
- throttling y cooldown no equivalen a opt-out;
- las tres políticas informativas requieren una preferencia empresarial separada para permitir desactivación explícita;
- la conversación de pedido conserva su bandeja obligatoria aunque el push complementario quede deshabilitado.

##### 12.3. PULSO

La superficie actual permite activar sonido y Notification API, pero el aviso contextual de pedido se mantiene independientemente de ese control.

Resultado documental:

- el aviso contextual de `NOTIFY-POLICY-014` y `NOTIFY-POLICY-015` permanece obligatorio;
- sonido y alerta de navegador son proyecciones complementarias configurables;
- desactivar el complemento no puede ocultar el aviso contextual ni retirar la responsabilidad operativa.

---

#### 13. Persistencia lógica y trazabilidad

La implementación futura deberá poder reconstruir, sin definir todavía una tabla física:

- identidad que realizó la elección;
- política y canal afectados;
- modo aplicable;
- estado explícito anterior y nuevo;
- finalidad cuando corresponda;
- alcance de marca, relación o contacto cuando corresponda;
- origen de la elección;
- instante de vigencia;
- estado efectivo después de aplicar precedencia;
- diferencia entre preferencia y bloqueo técnico.

Una preferencia podrá actualizarse sin destruir su historia cuando el gobierno de auditoría aplicable lo exija. El detalle de contenido sensible y minimización permanece en `NOTIFY-ARC-009`.

---

#### 14. Fronteras con tareas posteriores

| Decisión no tomada                                                          | Tarea propietaria                                       |
| --------------------------------------------------------------------------- | ------------------------------------------------------- |
| Confirmación, lectura, atención y escalamiento                              | `NOTIFY-ARC-007`                                        |
| Reintentos, fallos de permiso o canal, resultado desconocido y contingencia | `NOTIFY-ARC-008`                                        |
| Privacidad, contenido sensible y minimización de payload por canal          | `NOTIFY-ARC-009`                                        |
| Métricas, auditoría de entrega y observabilidad                             | `NOTIFY-ARC-010`                                        |
| Inclusión física del contrato de preferencias en el paquete prioritario     | `NEXO-REMISSIONS-001::CONDITIONAL_IMPLEMENTATION_SCOPE` |

No queda una decisión de preferencia sin propietario. Esta tarea no selecciona tabla, endpoint, RPC, Edge Function ni mecanismo de almacenamiento.

---

#### 15. Reconciliación cuantitativa

##### 15.1. Por obligación de la política

| Clasificación                                             | Políticas |
| --------------------------------------------------------- | --------: |
| Núcleo obligatorio con al menos un `PREF_REQUIRED_LOCKED` |        12 |
| Totalmente configurables `P3_INFORMATIVA`                 |         3 |
| **Total**                                                 |    **15** |

##### 15.2. Por modo utilizado

| Modo                           | Políticas en las que aparece |
| ------------------------------ | ---------------------------: |
| `PREF_REQUIRED_LOCKED`         |                           12 |
| `PREF_CONFIGURABLE_DEFAULT_ON` |                            8 |
| `PREF_EXPLICIT_OPT_IN`         |                            1 |

Una política puede utilizar más de un modo porque el canal primario, complementario o condicional puede tener reglas distintas.

##### 15.3. Integridad

```text
POLÍTICAS RECIBIDAS: 15
REGLAS DE PREFERENCIA MATERIALIZADAS: 15
ORÍGENES CUBIERTOS: 15 DE 15
DESTINATARIOS CONSERVADOS: 15 DE 15
FAMILIAS AS-IS CUBIERTAS: 16 DE 16
POLÍTICAS SIN DECISIÓN: 0
POLÍTICAS DUPLICADAS: 0
POLÍTICAS CON NÚCLEO OBLIGATORIO: 12
POLÍTICAS TOTALMENTE CONFIGURABLES: 3
CANALES EXTERNOS CON OPT-IN EXPLÍCITO: 1
CONTROLES GLOBALES QUE PUEDEN SILENCIAR OBLIGATORIAS: 0
```

---

#### 16. Decisiones canónicas consolidadas

1. Preferencia empresarial, permiso técnico y disponibilidad del canal son dimensiones distintas.
2. Ningún token, permiso del sistema operativo o navegador se interpreta como preferencia empresarial por sí solo.
3. Doce políticas conservan un núcleo obligatorio que no puede desactivarse desde VENTO.
4. Tres políticas `P3_INFORMATIVA` son configurables y parten habilitadas mientras no exista elección explícita.
5. Las comunicaciones configurables pueden silenciarse sin alterar el estado empresarial subyacente.
6. Un control global solo puede afectar comunicaciones opcionales o canales complementarios configurables.
7. No existe una acción semántica que permita apagar todas las notificaciones incluyendo las obligatorias.
8. Las preferencias pertenecen a la identidad y no al dispositivo.
9. Los permisos técnicos permanecen por dispositivo o navegador y pueden diferir entre endpoints de una misma identidad.
10. Una denegación técnica en una alerta obligatoria no se convierte en opt-out.
11. `NOTIFY-POLICY-001` mantiene el feed interno obligatorio y permite silenciar únicamente su push complementario.
12. `NOTIFY-POLICY-002` a `NOTIFY-POLICY-007` no admiten opt-out empresarial de sus canales obligatorios definidos.
13. `NOTIFY-POLICY-008` mantiene la bandeja de soporte obligatoria y permite silenciar el push complementario.
14. `NOTIFY-POLICY-009` mantiene el correo de invitación como comunicación transaccional obligatoria para esa emisión.
15. `NOTIFY-POLICY-010` a `NOTIFY-POLICY-012` permiten desactivar la comunicación proactiva sin ocultar el estado consultable.
16. `NOTIFY-POLICY-013` mantiene la conversación persistida obligatoria, permite silenciar push complementario y exige opt-in explícito para mensajería externa.
17. `NOTIFY-POLICY-014` y `NOTIFY-POLICY-015` mantienen el aviso contextual obligatorio aunque el usuario silencie sonido o alerta de navegador.
18. `QUIET_WINDOW` solo aplica a proyecciones configurables.
19. La preferencia no cambia prioridad, vigencia, deduplicación, destinatario ni canal permitido.
20. La falta de capacidad técnica se entrega a la política de fallos y contingencia, no se resuelve alterando preferencias.
21. La tarea no crea implementación, persistencia física, migraciones, proveedor, secretos ni despliegues.

---

#### 17. Requisitos de prueba derivados

**Resultado:** NO GENERA REQUISITOS DE PRUEBA

**Justificación:** la tarea especializa documentalmente el tratamiento de preferencias sobre necesidades y canales ya definidos, manteniendo los comportamientos de identidad, consentimiento, comunicación, autorización y trazabilidad ya protegidos por el registro canónico. No crea comportamiento ejecutable, esquema físico, proveedor, adaptador, política RLS, contrato de transporte ni mecanismo nuevo que requiera una fila adicional o modificación de requisitos existentes.

**Balance:** 0 creados; 0 modificados; 0 diferidos; 0 descartados; 0 obsoletos.

---

#### 18. Criterios de aceptación

- [x] las 15 políticas heredadas tienen una regla de preferencia explícita;
- [x] los 15 orígenes y las 15 reglas de destinatario permanecen sin cambios;
- [x] las 16 familias AS-IS mantienen cobertura;
- [x] preferencia empresarial, permiso técnico y capacidad del canal están separados;
- [x] existen exactamente tres modos canónicos de preferencia;
- [x] las doce políticas con núcleo obligatorio no admiten un opt-out que elimine la necesidad;
- [x] las tres políticas informativas permiten desactivación explícita;
- [x] el canal externo de `NOTIFY-POLICY-013` requiere habilitación explícita y parte desactivado;
- [x] una preferencia global no puede vencer una obligación bloqueada;
- [x] el silencio temporal no suspende alertas obligatorias;
- [x] las preferencias se resuelven por identidad y no por token o dispositivo;
- [x] una denegación del sistema operativo no se registra como opt-out empresarial;
- [x] el estado empresarial subyacente no desaparece cuando se desactiva una comunicación opcional;
- [x] no se modifica origen, destinatario, prioridad, vigencia, deduplicación ni selección de canal;
- [x] no se define confirmación, lectura ni escalamiento;
- [x] no se definen reintentos, fallback ni contingencia;
- [x] no se define contenido sensible ni minimización;
- [x] no se definen métricas ni auditoría de entrega;
- [x] no se modifica código, Supabase, migraciones, proveedores ni operación;
- [x] la tarea genera cero cambios en requisitos de prueba;
- [x] `NOTIFY-ARC-007` permanece únicamente reservada.

---

#### 19. Handoff cerrado hacia NOTIFY-ARC-007

`NOTIFY-ARC-006` entrega quince reglas de preferencia con obligación, modo, estado inicial, precedencia y tratamiento de silencio ya materializados.

`NOTIFY-ARC-007` recibe exclusivamente la responsabilidad de definir, sobre las necesidades y preferencias ya resueltas:

- qué significa entregada, presentada, leída, reconocida o atendida;
- qué comunicaciones requieren acuse explícito;
- qué ausencia de lectura o atención escala;
- quién recibe el escalamiento y bajo qué condición.

`NOTIFY-ARC-007` no recibe autorización para convertir una política obligatoria en opcional, reactivar una comunicación deshabilitada ni cambiar canales, destinatarios, prioridad, vigencia o deduplicación sin una corrección explícita de su tarea propietaria.

La aprobación de `NOTIFY-ARC-006` no inicia ni desarrolla `NOTIFY-ARC-007`.

---

#### 20. Continuidad

ÚLTIMA TAREA APROBADA  
`NOTIFY-ARC-005 — Definir canales internos, correo, push o mensajería externa`

TAREA ACTUAL APROBADA  
`NOTIFY-ARC-006 — Definir preferencias sin ocultar alertas obligatorias`

SIGUIENTE TAREA RESERVADA  
`NOTIFY-ARC-007 — Definir confirmación, lectura y escalamiento`


### ✅ NOTIFY-ARC-007 — Definir confirmación, lectura y escalamiento

**Estado:** APROBADA
**Tarea anterior:** `NOTIFY-ARC-006 — Definir preferencias sin ocultar alertas obligatorias` — APROBADA
**Tarea siguiente:** `NOTIFY-ARC-008 — Definir reintentos, fallos y contingencia` — RESERVADA
**Tipo de tarea:** documental; matriz materializada de lectura, confirmación humana, atención y escalamiento para las quince políticas de notificación aprobadas
**Repositorio propietario:** `vento-shell`
**Archivo propietario:** `docs/plan-canonico/modular/bloques/E4_SERVICIOS_TRANSVERSALES/05_NOTIFICACIONES_Y_ALERTAS.md`
**Cambios físicos autorizados:** ninguno; no crea ni modifica código, Edge Functions, tablas, RLS, migraciones, RPC, cron, colas, tokens, proveedores, secretos, aplicaciones ni configuración de Supabase
**Requisitos de prueba creados o modificados:** 0

**Qué se hace:** definir para cada `NOTIFY-POLICY-*` qué significa lectura, qué evidencia constituye confirmación o atención suficiente, qué hecho empresarial cierra la necesidad y cuándo una falta de atención habilita escalamiento hacia otra responsabilidad, sin alterar origen, destinatario inicial, prioridad, vigencia, deduplicación, canales, preferencias, reintentos, privacidad ni métricas.

---

#### 1. Resultado sustantivo

`NOTIFY-ARC-007` queda documentalmente cerrada con:

- 15 reglas `NOTIFY-ATTENTION-001` a `NOTIFY-ATTENTION-015`;
- 15 políticas `NOTIFY-POLICY-001` a `NOTIFY-POLICY-015` cubiertas exactamente una vez;
- 15 reglas de destinatario inicial preservadas;
- 15 reglas de preferencia preservadas;
- 16 familias AS-IS cubiertas mediante las políticas heredadas;
- 3 modos de tratamiento de lectura;
- 4 modos de confirmación o atención;
- 3 modos de escalamiento;
- una condición de escalamiento o ausencia explícita de escalamiento por política;
- separación obligatoria entre receipt técnico, lectura humana, confirmación humana y efecto empresarial;
- 0 políticas sin decisión;
- 0 políticas duplicadas;
- 0 cambios físicos ejecutados;
- 0 cambios en requisitos de prueba.

La tarea no declara que las capacidades aquí definidas estén implementadas. El resultado es `ESPECIFICADO`.

---

#### 2. Fronteras semánticas obligatorias

La arquitectura deberá conservar separadas estas evidencias:

| Evidencia            | Significado                                                                                              | Puede marcar lectura                         | Puede cerrar una obligación                               |
| -------------------- | -------------------------------------------------------------------------------------------------------- | -------------------------------------------- | --------------------------------------------------------- |
| `TRANSPORT_ACCEPTED` | El proveedor o mecanismo técnico aceptó un intento de entrega.                                           | No.                                          | No.                                                       |
| `PRESENTED`          | Una superficie VENTO pudo mostrar el aviso al destinatario autenticado.                                  | No por sí sola.                              | No.                                                       |
| `READ`               | El destinatario cargó de forma autenticada el contenido o contexto asociado a la ocurrencia.             | Sí.                                          | Solo cuando la política declara `CONFIRM_READ`.           |
| `ACKNOWLEDGED`       | El destinatario realizó una confirmación humana explícita sobre la versión u ocurrencia correcta.        | Implica lectura.                             | Solo cuando la política declara `CONFIRM_EXPLICIT_ACK`.   |
| `PROCESS_EFFECT`     | El proceso propietario registró el hecho empresarial que satisface la acción pendiente.                  | Es evidencia de atención superior a lectura. | Sí cuando la política declara `CONFIRM_PROCESS_EFFECT`.   |
| `ESCALATED`          | La condición de falta de atención produjo una proyección adicional hacia una responsabilidad autorizada. | No.                                          | No; el proceso continúa abierto hasta su hecho de cierre. |

Reglas:

1. Una respuesta `2xx`, receipt de Expo, respuesta de Resend, suscripción Realtime, apertura de socket, badge visible o `Notification.permission === "granted"` no demuestra lectura humana.
2. Un tap sobre push, correo, enlace profundo o notificación del navegador solo puede producir `READ` después de autenticar al destinatario y cargar correctamente la ocurrencia o su contexto autorizado.
3. Un pixel de apertura de correo o receipt de mensajería externa no será evidencia autoritativa de lectura para decisiones empresariales.
4. `READ` no equivale a aceptación contractual, aceptación de turno, resolución de ticket, cierre de asistencia, toma de pedido ni ejecución de una acción.
5. `ACKNOWLEDGED` confirma conocimiento de la ocurrencia; no concede permisos, no cambia responsabilidad y no modifica por sí mismo el hecho empresarial.
6. `PROCESS_EFFECT` proviene del proceso propietario, no de un botón cosmético de la notificación.
7. Un aviso puede estar leído y continuar pendiente.
8. Una acción empresarial válida puede cerrar la necesidad aunque no exista una transición `READ` separada.
9. La falta de telemetría de lectura no autoriza a asumir que el destinatario no leyó; únicamente impide afirmar lectura.
10. Las evidencias se conservan por destinatario. La lectura o atención de una persona nunca se propaga a otra identidad.

---

#### 3. Modos canónicos de lectura

| Modo                              | Regla                                                                                                                                                                                          |
| --------------------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `READ_TRACKED`                    | La ocurrencia deberá poder conservar estado de lectura por destinatario cuando la superficie autorizada sea abierta y cargada. La ausencia de lectura no implica automáticamente escalamiento. |
| `READ_NOT_AUTHORITATIVE_EXTERNAL` | El canal puede exponer señales de apertura, pero ninguna de ellas se usa como lectura empresarial autoritativa; la confirmación depende de un hecho posterior del proceso.                     |
| `READ_NOT_REQUIRED`               | La política no necesita un estado de lectura para cumplir su propósito; la atención se demuestra mediante el proceso o no se exige confirmación.                                               |

Una política `READ_TRACKED` deberá conservar al menos la identidad de la ocurrencia, identidad destinataria y momento de transición. El contenido sensible no se duplica dentro del estado de lectura.

---

#### 4. Modos canónicos de confirmación y atención

| Modo                     | Significado                                                                                                                                                                              |
| ------------------------ | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `CONFIRM_NONE`           | No se exige confirmación humana. La notificación cumple su función informativa al quedar disponible por los canales aprobados.                                                           |
| `CONFIRM_READ`           | La lectura autenticada de la ocurrencia es confirmación suficiente de conocimiento. No significa aceptación de la decisión o resultado comunicado.                                       |
| `CONFIRM_EXPLICIT_ACK`   | Se exige una acción humana explícita de conocimiento sobre la ocurrencia y versión correctas.                                                                                            |
| `CONFIRM_PROCESS_EFFECT` | La atención suficiente es el hecho empresarial registrado por el proceso propietario: cerrar, responder, aceptar, reclamar, avanzar, corregir u otro efecto ya definido por ese proceso. |

Reglas:

1. Una política solo puede tener un modo principal de confirmación.
2. `CONFIRM_EXPLICIT_ACK` nunca sustituye una acción empresarial requerida.
3. `CONFIRM_PROCESS_EFFECT` no crea una nueva acción de negocio; consume el efecto ya autorizado del proceso propietario.
4. Un estado visual como “Atendido” solo será confirmación autoritativa si existe persistencia vinculada a la ocurrencia, actor, momento y versión, y la política exige confirmación explícita.
5. Cerrar una ventana, silenciar un canal, archivar visualmente o eliminar un badge no confirma atención.
6. En dispositivos compartidos la confirmación pertenece al actor humano efectivo, no a la sesión técnica del dispositivo.
7. Si el proceso invalida, cancela o deja sin objeto la ocurrencia antes de su confirmación, la necesidad termina por la regla de vigencia aprobada y no se fuerza un acuse tardío.

---

#### 5. Modos canónicos de escalamiento

| Modo                       | Significado                                                                                                                                                                         |
| -------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `ESC_NONE`                 | La falta de lectura o confirmación no incorpora una responsabilidad adicional.                                                                                                      |
| `ESC_POLICY_TRANSITION`    | La falta de resolución produce otra necesidad empresarial ya aprobada como política separada; no se agrega supervisión dentro de la política original.                              |
| `ESC_RESPONSIBILITY_CHAIN` | Un hecho autoritativo de incumplimiento o falta de atención habilita una proyección hacia la siguiente responsabilidad válida del proceso, sin broadcast ni reasignación implícita. |

Reglas obligatorias:

1. El escalamiento se activa por una condición empresarial autoritativa, no por la edad técnica de un push ni por un timer inventado por el servicio de notificaciones.
2. Esta tarea no introduce minutos, horas o SLA universales.
3. Cuando el proceso propietario tenga una frontera de vigencia, vencimiento, turno, etapa, caso o incumplimiento, esa frontera gobierna el escalamiento.
4. Escalar incorpora un destinatario autorizado adicional o una responsabilidad siguiente; no elimina la ocurrencia del destinatario original.
5. La proyección escalada conserva el mismo origen, recurso, versión o episodio raíz y añade su destinatario y nivel de escalamiento.
6. Cada destinatario mantiene lectura, confirmación y atención independientes.
7. El escalamiento no cambia prioridad base; puede registrarse un nivel de escalamiento separado.
8. Un recordatorio técnico al mismo endpoint no es escalamiento.
9. Un reintento de proveedor no es escalamiento.
10. Una repetición de polling, cron o Realtime no es escalamiento.
11. La indisponibilidad de un canal no habilita escalamiento; pertenece a `NOTIFY-ARC-008`.
12. La falta de destinatario resoluble no habilita broadcast; pertenece a `NOTIFY-ARC-008`.
13. La gerencia no se convierte en copia universal. Solo entra cuando la matriz de esta tarea y la responsabilidad vigente del proceso lo autorizan.
14. Una vez producido el `PROCESS_EFFECT` que resuelve la necesidad, ningún escalamiento posterior podrá nacer de esa misma ocurrencia.
15. Las copias ya escaladas conservan historia aunque el proceso quede resuelto.

---

#### 6. Matriz materializada de lectura, confirmación y escalamiento

| Regla                  | Política            | Lectura                           | Confirmación principal   | Hecho que cierra la atención                                                                                                                                                                                                                           | Escalamiento               | Destino o tratamiento                                                                                                                                                                                                                                                                                            | Resultado      |
| ---------------------- | ------------------- | --------------------------------- | ------------------------ | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ | -------------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | -------------- |
| `NOTIFY-ATTENTION-001` | `NOTIFY-POLICY-001` | `READ_TRACKED`                    | `CONFIRM_NONE`           | Fin de vigencia de la publicación o nueva versión conforme a la política aprobada.                                                                                                                                                                     | `ESC_NONE`                 | Un comunicado general no incorpora supervisión por permanecer sin leer. Si una comunicación futura exige aceptación o acción, esa obligación deberá existir en su proceso y no ocultarse dentro del aviso.                                                                                                       | `ESPECIFICADO` |
| `NOTIFY-ATTENTION-002` | `NOTIFY-POLICY-002` | `READ_TRACKED`                    | `CONFIRM_PROCESS_EFFECT` | Renovación, actualización, aporte, validación o corrección autoritativa que saque el documento de la condición pendiente.                                                                                                                              | `ESC_RESPONSIBILITY_CHAIN` | Si la condición evoluciona a incumplimiento mientras la responsabilidad continúa vigente, se proyecta hacia la siguiente responsabilidad documental o de control definida por `VPROC-0060`; nunca hacia toda RR. HH., gerencia o custodia por pertenencia general.                                               | `ESPECIFICADO` |
| `NOTIFY-ATTENTION-003` | `NOTIFY-POLICY-003` | `READ_TRACKED`                    | `CONFIRM_READ`           | Lectura autenticada de la publicación vigente; la asignación sigue gobernada por el proceso de programación.                                                                                                                                           | `ESC_RESPONSIBILITY_CHAIN` | Si la asignación alcanza la frontera empresarial en la que el trabajador debe conocerla y continúa sin lectura, se informa a `RESPONSABLE_DE_PROGRAMACION_LABORAL` para revisión de contacto/cobertura; no se considera rechazo del trabajador.                                                                  | `ESPECIFICADO` |
| `NOTIFY-ATTENTION-004` | `NOTIFY-POLICY-004` | `READ_TRACKED`                    | `CONFIRM_EXPLICIT_ACK`   | Acuse explícito de conocimiento de la nueva versión publicada o un efecto posterior del proceso que demuestre de forma inequívoca que la revisión fue atendida.                                                                                        | `ESC_RESPONSIBILITY_CHAIN` | Si la nueva obligación entra en su frontera efectiva sin acuse, se proyecta a `RESPONSABLE_DE_PROGRAMACION_LABORAL`; la escalada no convierte el acuse en consentimiento ni autoriza cambios adicionales.                                                                                                        | `ESPECIFICADO` |
| `NOTIFY-ATTENTION-005` | `NOTIFY-POLICY-005` | `READ_TRACKED`                    | `CONFIRM_PROCESS_EFFECT` | Cierre autoritativo de la sesión de asistencia, cancelación válida o corrección que elimine la condición previa al fin.                                                                                                                                | `ESC_POLICY_TRANSITION`    | Si llega el fin aplicable y la sesión continúa abierta, no se agrega supervisión dentro de esta política: nace la necesidad ya separada `NOTIFY-POLICY-006`.                                                                                                                                                     | `ESPECIFICADO` |
| `NOTIFY-ATTENTION-006` | `NOTIFY-POLICY-006` | `READ_TRACKED`                    | `CONFIRM_PROCESS_EFFECT` | Cierre autoritativo de la sesión, corrección o cancelación que invalide la condición posterior al fin.                                                                                                                                                 | `ESC_RESPONSIBILITY_CHAIN` | Cuando el proceso de asistencia registre que la sesión continúa incumplida en la frontera de control aplicable, se proyecta a la función vigente de `GERENCIA_O_SUPERVISION_DE_SEDE` correspondiente al trabajador, turno y sede.                                                                                | `ESPECIFICADO` |
| `NOTIFY-ATTENTION-007` | `NOTIFY-POLICY-007` | `READ_TRACKED`                    | `CONFIRM_NONE`           | El check-out automático ya es un hecho persistido; la notificación no tiene acción pendiente.                                                                                                                                                          | `ESC_NONE`                 | La falta de lectura no escala. Si el trabajador objeta el efecto deberá utilizar el proceso de corrección correspondiente; esa corrección no nace de un escalamiento de la notificación.                                                                                                                         | `ESPECIFICADO` |
| `NOTIFY-ATTENTION-008` | `NOTIFY-POLICY-008` | `READ_TRACKED`                    | `CONFIRM_PROCESS_EFFECT` | Para el lado responsable del caso: respuesta, cambio de estado o acción válida en `VPROC-0058`; para el solicitante: la lectura puede evidenciar conocimiento, pero no cierra un caso que siga requiriendo acción.                                     | `ESC_RESPONSIBILITY_CHAIN` | Un caso que alcance su condición empresarial de falta de atención se escala dentro de la cadena de responsabilidad del propio `VPROC-0058`. No se notifica a todo el equipo tecnológico y el estado `READ` no reemplaza la resolución del caso.                                                                  | `ESPECIFICADO` |
| `NOTIFY-ATTENTION-009` | `NOTIFY-POLICY-009` | `READ_NOT_AUTHORITATIVE_EXTERNAL` | `CONFIRM_PROCESS_EFFECT` | Uso o aceptación válida de la invitación, o terminación de su vigencia por expiración, revocación o cancelación.                                                                                                                                       | `ESC_NONE`                 | Un open de correo no se usa como lectura y una invitación pendiente no agrega gerencia o selección como destinatarios automáticos. Un reenvío deliberado conserva la política de generación aprobada y no se trata como escalamiento.                                                                            | `ESPECIFICADO` |
| `NOTIFY-ATTENTION-010` | `NOTIFY-POLICY-010` | `READ_NOT_REQUIRED`               | `CONFIRM_NONE`           | La ocurrencia es informativa y termina por su propia vigencia.                                                                                                                                                                                         | `ESC_NONE`                 | El ascenso de nivel no exige lectura, acuse ni supervisión.                                                                                                                                                                                                                                                      | `ESPECIFICADO` |
| `NOTIFY-ATTENTION-011` | `NOTIFY-POLICY-011` | `READ_NOT_REQUIRED`               | `CONFIRM_NONE`           | La recompensa deja de estar en el episodio vigente de elegibilidad o se consume según su proceso.                                                                                                                                                      | `ESC_NONE`                 | La falta de interacción con una recompensa no genera seguimiento obligatorio ni supervisión.                                                                                                                                                                                                                     | `ESPECIFICADO` |
| `NOTIFY-ATTENTION-012` | `NOTIFY-POLICY-012` | `READ_NOT_REQUIRED`               | `CONFIRM_NONE`           | El ciclo de elegibilidad de feedback se consume, termina o se invalida.                                                                                                                                                                                | `ESC_NONE`                 | No responder una solicitud de opinión no genera escalamiento ni presión operativa.                                                                                                                                                                                                                               | `ESPECIFICADO` |
| `NOTIFY-ATTENTION-013` | `NOTIFY-POLICY-013` | `READ_TRACKED`                    | `CONFIRM_PROCESS_EFFECT` | Para una contraparte interna responsable: respuesta o acción válida sobre la conversación/pedido; para cliente o contraparte externa: la lectura evidencia conocimiento cuando sea autoritativamente observable, pero no se exige respuesta universal. | `ESC_RESPONSIBILITY_CHAIN` | Solo el lado operativo que mantenga una respuesta requerida puede escalar cuando el proceso de pedido marque falta de atención: primero se resuelve la responsabilidad vigente de la instancia y, cuando corresponda, `GERENCIA_O_SUPERVISION_DE_SEDE`. El lado cliente no se escala por no leer o no responder. | `ESPECIFICADO` |
| `NOTIFY-ATTENTION-014` | `NOTIFY-POLICY-014` | `READ_NOT_REQUIRED`               | `CONFIRM_PROCESS_EFFECT` | Primera acción autoritativa que reclame, acepte o haga avanzar el pedido desde la etapa accionable correspondiente.                                                                                                                                    | `ESC_RESPONSIBILITY_CHAIN` | Si el pedido permanece accionable sin dueño efectivo al alcanzar la condición empresarial de falta de atención, se proyecta a `GERENCIA_O_SUPERVISION_DE_SEDE` de la sede aplicable. El botón local “Atendido” no basta sin efecto persistido autorizado.                                                        | `ESPECIFICADO` |
| `NOTIFY-ATTENTION-015` | `NOTIFY-POLICY-015` | `READ_NOT_REQUIRED`               | `CONFIRM_PROCESS_EFFECT` | Primera acción autoritativa del cumplimiento del pedido habilitada por el pago conciliado, o un cambio válido que elimine esa acción pendiente.                                                                                                        | `ESC_RESPONSIBILITY_CHAIN` | Si la siguiente responsabilidad operativa permanece sin ejecutar al alcanzar la condición empresarial de falta de atención, se proyecta a `GERENCIA_O_SUPERVISION_DE_SEDE` de la sede aplicable. El estado del pago no se usa como prueba de que operación atendió el pedido.                                    | `ESPECIFICADO` |

---

#### 7. Reconciliación cuantitativa

##### 7.1. Modos de lectura

| Modo                              | Cantidad |
| --------------------------------- | -------: |
| `READ_TRACKED`                    |    **9** |
| `READ_NOT_AUTHORITATIVE_EXTERNAL` |    **1** |
| `READ_NOT_REQUIRED`               |    **5** |
| **Total**                         |   **15** |

##### 7.2. Modos de confirmación

| Modo                     | Cantidad |
| ------------------------ | -------: |
| `CONFIRM_NONE`           |    **5** |
| `CONFIRM_READ`           |    **1** |
| `CONFIRM_EXPLICIT_ACK`   |    **1** |
| `CONFIRM_PROCESS_EFFECT` |    **8** |
| **Total**                |   **15** |

##### 7.3. Modos de escalamiento

| Modo                       | Cantidad |
| -------------------------- | -------: |
| `ESC_NONE`                 |    **6** |
| `ESC_POLICY_TRANSITION`    |    **1** |
| `ESC_RESPONSIBILITY_CHAIN` |    **8** |
| **Total**                  |   **15** |

##### 7.4. Integridad

```text
POLÍTICAS RECIBIDAS: 15
REGLAS MATERIALIZADAS: 15
POLÍTICAS SIN REGLA: 0
POLÍTICAS DUPLICADAS: 0
DESTINATARIOS INICIALES MODIFICADOS: 0
PREFERENCIAS MODIFICADAS: 0
PRIORIDADES MODIFICADAS: 0
CANALES MODIFICADOS: 0
ESCALAMIENTOS POR TIMER TÉCNICO: 0
ESCALAMIENTOS POR FALLO DE CANAL: 0
DECISIONES ABIERTAS DENTRO DE NOTIFY-ARC-007: 0
```

---

#### 8. Estado técnico actual reconciliado

La implementación existente aporta evidencia parcial y no se eleva automáticamente al contrato objetivo.

##### 8.1. Soporte ANIMA

ANIMA conserva `support_ticket_reads.last_read_at` por trabajador y ticket. Al cargar mensajes de una conversación se actualiza ese estado y el conteo de no leídos vuelve a cero.

Tratamiento canónico:

- constituye una base válida para `READ_TRACKED`;
- no demuestra por sí solo respuesta, resolución ni atención del caso;
- ocultar una conversación no puede convertirse en confirmación de resolución;
- el cierre del caso continúa perteneciendo al proceso de soporte.

##### 8.2. Chat de pedidos PULSO

PULSO utiliza `mark_order_conversation_read` al abrir una conversación y mantiene conteos de mensajes pendientes.

Tratamiento canónico:

- constituye una base válida para lectura del lado operativo;
- lectura y archivo permanecen separados;
- una conversación no puede considerarse atendida únicamente porque su contador llegue a cero;
- la respuesta o acción de pedido requerida sigue gobernada por el proceso.

##### 8.3. Alertas operativas PULSO

La interfaz actual muestra un control visual `Atendido` que limpia estado local de alerta.

Tratamiento canónico:

- ese control no es `CONFIRM_PROCESS_EFFECT`;
- tampoco es `CONFIRM_EXPLICIT_ACK` autoritativo mientras no exista persistencia ligada a ocurrencia, actor y momento;
- pedido nuevo y pago conciliado se consideran atendidos por la primera acción empresarial autoritativa definida en sus políticas.

##### 8.4. Push, navegador y correo

Los receipts técnicos y permisos actuales permanecen desacoplados de la lectura.

Tratamiento canónico:

- endpoint activo no equivale a destinatario atento;
- push aceptado no equivale a leído;
- notificación del navegador mostrada o cerrada no equivale a leído;
- correo aceptado por el proveedor no equivale a leído;
- invitación se confirma mediante el proceso de incorporación, no mediante tracking de apertura.

---

#### 9. Reglas de estado por destinatario

Cada ocurrencia y destinatario podrá conceptualmente conservar estas dimensiones separadas:

```text
delivery_state
presentation_state
read_state
confirmation_state
process_resolution_state
escalation_level
```

Reglas:

1. Ninguna dimensión se deriva automáticamente de otra salvo las implicaciones expresamente definidas.
2. `ACKNOWLEDGED` implica conocimiento de la ocurrencia, pero no implica `PROCESS_EFFECT`.
3. `PROCESS_EFFECT` puede cerrar la atención aunque `read_state` no haya sido registrado separadamente.
4. Una ocurrencia escalada puede estar resuelta para el proceso y conservar evidencia de que un destinatario original nunca la leyó.
5. Un cambio de responsabilidad produce una proyección para la nueva identidad válida; no transfiere falsamente el estado humano de la identidad anterior.
6. La expiración de la necesidad detiene nuevas exigencias de lectura o confirmación, sin borrar estados ya registrados.
7. Una corrección de la fuente puede invalidar la necesidad; la invalidación conserva historia y causa.
8. El escalamiento no puede producir permisos superiores sobre el recurso: la identidad escalada deberá reautorizar cualquier lectura o acción.

---

#### 10. Regla de escalamiento sin ampliación indiscriminada

La cadena de escalamiento se resuelve siempre desde la instancia empresarial vigente.

Orden conceptual:

```text
DESTINATARIO INICIAL
        ↓
CONDICIÓN EMPRESARIAL DE FALTA DE ATENCIÓN
        ↓
RESPONSABILIDAD SIGUIENTE DEL PROCESO
        ↓
CONTEXTO Y AUTORIZACIÓN VIGENTES
        ↓
PROYECCIÓN ESCALADA
```

Queda prohibido:

- escalar a una persona por tener un rol nominal sin responsabilidad vigente;
- incluir gerencia por defecto;
- copiar a toda una sede;
- escalar por un token inactivo;
- escalar por fallo de proveedor;
- escalar porque una app no estaba abierta;
- escalar por una lectura no observable;
- usar la aplicación productora como criterio de destinatario;
- interpretar escalamiento como reasignación automática del trabajo;
- modificar el hecho fuente para representar el escalamiento.

Cuando `GERENCIA_O_SUPERVISION_DE_SEDE` aparece en la matriz, deberá resolverse contra la sede, etapa, turno y responsabilidad vigentes del recurso. No es una audiencia global.

---

#### 11. Decisiones canónicas consolidadas

1. Receipt técnico, lectura, acuse, efecto empresarial y escalamiento son estados distintos.
2. La lectura solo se registra cuando existe identidad destinataria y acceso autenticado a la ocurrencia o su contexto.
3. Abrir un push o enlace no basta hasta cargar el contexto autorizado.
4. El correo no usa tracking de apertura como lectura empresarial autoritativa.
5. Una lectura no prueba aceptación.
6. Un acuse explícito no sustituye una acción empresarial requerida.
7. Un efecto empresarial válido puede cerrar la atención aunque no exista lectura separada.
8. Nueve políticas conservan lectura rastreable.
9. Una política de correo usa lectura externa no autoritativa.
10. Cinco políticas no requieren estado de lectura.
11. Cinco políticas no exigen confirmación.
12. Una política usa lectura como confirmación suficiente.
13. Una política exige acuse explícito de conocimiento.
14. Ocho políticas se confirman por efecto del proceso propietario.
15. Seis políticas no escalan.
16. `NOTIFY-POLICY-005` evoluciona hacia `NOTIFY-POLICY-006` en lugar de incorporar supervisión.
17. Ocho políticas pueden escalar por cadena de responsabilidad.
18. Ningún escalamiento se activa por fallos de canal, receipts, polling, cron o reintentos técnicos.
19. No se fija un SLA transversal nuevo.
20. La frontera temporal o de incumplimiento proviene del proceso propietario.
21. La lectura o atención de un destinatario no cambia la de otro.
22. El escalamiento conserva el destinatario original y vincula la nueva proyección con la misma ocurrencia raíz.
23. Gerencia y supervisión solo entran donde la matriz lo autoriza y el contexto vigente las resuelve.
24. `NOTIFY-POLICY-013` no escala al cliente por falta de lectura o respuesta.
25. El control visual `Atendido` de PULSO no se trata como confirmación canónica sin persistencia autoritativa.
26. La tarea no crea esquemas, estados físicos, RPC, jobs, APIs, botones, proveedores ni mecanismos de tracking.
27. Reintentos y fallos de entrega permanecen reservados a `NOTIFY-ARC-008`.
28. Privacidad y contenido de las evidencias permanecen reservados a `NOTIFY-ARC-009`.
29. Métricas y auditoría de entrega permanecen reservadas a `NOTIFY-ARC-010`.

---

#### 12. Requisitos de prueba derivados

**Resultado:** NO GENERA REQUISITOS DE PRUEBA

**Justificación:** esta tarea materializa la semántica documental de lectura, confirmación y escalamiento sobre controles transversales ya registrados. `TREQ-INTEGRATION-004` exige reconstruir destinatario, intento, resultado, error y efecto final en cadenas de notificación; `TREQ-INTEGRATION-032` exige separar notificación humana, evento empresarial, auditoría y log técnico; `TREQ-INTEGRATION-003` protege idempotencia y resultado recuperable en operaciones asíncronas; y `TREQ-PASS-011` ya protege el ciclo independiente de comunicaciones y casos de servicio. La tarea no implementa persistencia de lectura, motor de escalamiento ni comportamiento ejecutable adicional, por lo que no duplica requisitos existentes.

**Balance:** 0 creados; 0 modificados; 0 diferidos; 0 descartados; 0 obsoletos.

---

#### 13. Decisiones posteriores reservadas y propietarios exactos

| Decisión no tomada                                                                                               | Tarea propietaria                                                                                       |
| ---------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------- |
| Reintentos de entrega, errores técnicos, resultados desconocidos, `UNRESOLVED_RECIPIENT` y contingencia de canal | `NOTIFY-ARC-008`                                                                                        |
| Minimización, contenido sensible y exposición permitida por canal                                                | `NOTIFY-ARC-009`                                                                                        |
| Métricas, trazas, auditoría, SLI y evidencia de entrega                                                          | `NOTIFY-ARC-010`                                                                                        |
| Implementación física de estados de lectura, confirmación y escalamiento dentro de paquetes                      | `NEXO-REMISSIONS-001::CONDITIONAL_IMPLEMENTATION_SCOPE` cuando el alcance de implementación los incluya |

No queda una decisión de confirmación, lectura o escalamiento sin propietario dentro del alcance de `NOTIFY-ARC-007`.

---

#### 14. Criterios de aceptación

- [x] las 15 políticas heredadas están cubiertas exactamente una vez;
- [x] las 15 reglas `NOTIFY-ATTENTION-*` son únicas;
- [x] las 15 reglas de destinatario inicial permanecen intactas;
- [x] las 15 preferencias permanecen intactas;
- [x] cada política declara tratamiento de lectura;
- [x] cada política declara confirmación principal;
- [x] cada política declara el hecho que cierra la atención;
- [x] cada política declara escalamiento o ausencia de escalamiento;
- [x] receipt técnico y lectura humana permanecen separados;
- [x] lectura y aceptación permanecen separadas;
- [x] acuse explícito y efecto empresarial permanecen separados;
- [x] una acción de negocio se confirma desde el proceso propietario;
- [x] correo externo no usa apertura como lectura autoritativa;
- [x] la lectura es independiente por destinatario;
- [x] el escalamiento no comparte estado humano entre destinatarios;
- [x] el escalamiento no amplía permisos;
- [x] el escalamiento no convierte gerencia en copia universal;
- [x] no existe un SLA transversal inventado;
- [x] el aviso previo al fin de turno evoluciona a la política posterior ya aprobada;
- [x] el seguimiento posterior puede incorporar supervisión únicamente con contexto vigente;
- [x] soporte usa el caso como autoridad de atención;
- [x] mensajes de pedido distinguen lado operativo y lado cliente;
- [x] pedido nuevo y pago conciliado se atienden mediante efectos empresariales, no mediante señales visuales locales;
- [x] no se definen reintentos ni contingencia;
- [x] no se define contenido sensible;
- [x] no se definen métricas;
- [x] no se modifica código ni Supabase;
- [x] la tarea genera cero cambios en requisitos de prueba;
- [x] `NOTIFY-ARC-008` permanece únicamente reservada.

---

#### 15. Handoff cerrado hacia NOTIFY-ARC-008

`NOTIFY-ARC-007` entrega quince reglas con lectura, confirmación, hecho de cierre y escalamiento definidos.

`NOTIFY-ARC-008` recibe exclusivamente los fallos técnicos de entrega y resolución:

- intento no aceptado;
- timeout o resultado desconocido;
- proveedor indisponible;
- endpoint inválido;
- canal no disponible;
- destinatario no resoluble;
- reintento y backoff;
- agotamiento de intentos;
- contingencia de canal;
- reconciliación de entrega incierta.

`NOTIFY-ARC-008` no recibe autorización para redefinir quién debe leer, qué constituye acuse, qué efecto empresarial confirma atención ni a quién escala una falta de atención empresarial.

La aprobación de `NOTIFY-ARC-007` no inicia ni desarrolla `NOTIFY-ARC-008`.

---

#### 16. Continuidad

ÚLTIMA TAREA APROBADA
`NOTIFY-ARC-006 — Definir preferencias sin ocultar alertas obligatorias`

TAREA ACTUAL APROBADA
`NOTIFY-ARC-007 — Definir confirmación, lectura y escalamiento`

SIGUIENTE TAREA RESERVADA
`NOTIFY-ARC-008 — Definir reintentos, fallos y contingencia`


### [ ] NOTIFY-ARC-008 — Definir reintentos, fallos y contingencia
### [ ] NOTIFY-ARC-009 — Definir privacidad y contenido sensible
### [ ] NOTIFY-ARC-010 — Definir métricas y auditoría de entrega
