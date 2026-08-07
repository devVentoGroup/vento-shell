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


### [ ] NOTIFY-ARC-002 — Definir evento empresarial que origina cada notificación
### [ ] NOTIFY-ARC-003 — Definir destinatarios por responsabilidad y contexto
### [ ] NOTIFY-ARC-004 — Definir prioridad, vigencia y deduplicación
### [ ] NOTIFY-ARC-005 — Definir canales internos, correo, push o mensajería externa
### [ ] NOTIFY-ARC-006 — Definir preferencias sin ocultar alertas obligatorias
### [ ] NOTIFY-ARC-007 — Definir confirmación, lectura y escalamiento
### [ ] NOTIFY-ARC-008 — Definir reintentos, fallos y contingencia
### [ ] NOTIFY-ARC-009 — Definir privacidad y contenido sensible
### [ ] NOTIFY-ARC-010 — Definir métricas y auditoría de entrega
