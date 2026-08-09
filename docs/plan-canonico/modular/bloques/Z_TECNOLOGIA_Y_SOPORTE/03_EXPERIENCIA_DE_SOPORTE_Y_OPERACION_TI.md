### MINI-BLOQUE — EXPERIENCIA DE SOPORTE Y OPERACION TI

<!-- PLAN-SECTION-META:START -->
Esta sección organiza **experiencia de soporte y operacion ti** dentro de **Z TECNOLOGÍA Y SOPORTE**. Agrupa tareas que producen un resultado funcional común y deben mantenerse juntas para conservar contexto, trazabilidad y orden de ejecución.

**Cobertura canónica:** `TI-UX-001` a `TI-UX-006` — 6 tareas.

**Resultado esperado:** al cerrar este mini-bloque, su resultado debe quedar definido, verificable y coherente con las secciones anterior y siguiente antes de avanzar.

**Contenido funcional:**

- `TI-UX-001`: Diseñar portal simple de soporte para trabajadores dentro de ANIMA
- `TI-UX-002`: Diseñar mesa de servicio de VISO con colas, prioridad, SLA, asignación, comunicación y validación
- `TI-UX-003`: Diseñar mapa de dispositivos, redes, impresoras, aplicaciones y salud técnica
- `TI-UX-004`: Diseñar flujos de incidente, problema, cambio, mantenimiento y recuperación
- `TI-UX-005`: Diseñar gestión de aplicaciones, proveedores, licencias, contratos, renovaciones y costos
- `TI-UX-006`: Diseñar diagnóstico guiado, base de conocimiento y capacitación contextual sin saturación técnica
<!-- PLAN-SECTION-META:END -->

### ✅ TI-UX-001 — Diseñar portal simple de soporte para trabajadores dentro de ANIMA

**Estado:** APROBADA
**Tarea anterior:** `TI-AUTH-004 — Proteger diagnósticos, logs, exportaciones, capturas, secretos y datos personales en soporte` — APROBADA
**Tarea siguiente:** `TI-UX-002 — Diseñar mesa de servicio de VISO con colas, prioridad, SLA, asignación, comunicación y validación` — RESERVADA
**Tipo de tarea:** documental; diseño normativo y materializado de la experiencia personal de soporte de ANIMA para reporte contextual, consulta, comunicación, seguimiento, validación y handoff al caso tecnológico de VISO
**Repositorio propietario:** `vento-shell`
**Archivo propietario:** `docs/plan-canonico/modular/bloques/Z_TECNOLOGIA_Y_SOPORTE/03_EXPERIENCIA_DE_SOPORTE_Y_OPERACION_TI.md`
**Superficie objetivo:** ANIMA `/support`
**Cambios físicos autorizados:** ninguno; no crea ni modifica código, rutas, componentes, tablas, enums, RLS, RPC, Edge Functions, migraciones, datos, notificaciones desplegadas, permisos, dispositivos, aplicaciones ni configuración de Supabase
**Requisitos de prueba creados o modificados:** 0

**Qué se hace:** convertir documentalmente la experiencia existente de tickets y chat de `/support` en un portal personal de soporte para el trabajador, conservando la pestaña actual de ANIMA y su mensajería como canal, pero trasladando al caso tecnológico de VISO la clasificación, prioridad, SLA, diagnóstico, restauración, validación y cierre canónicos que no deben decidirse desde el cliente.

---

#### 1. Propósito

Diseñar una experiencia de soporte que permita a cualquier trabajador reportar una necesidad tecnológica, entender qué está ocurriendo, aportar información, recibir comunicaciones y confirmar si el servicio volvió a funcionar sin exigirle conocer categorías ITSM, nombres técnicos, prioridad, SLA, infraestructura, logs o estados internos de VISO.

La experiencia deberá responder de forma inmediata y comprensible:

```text
¿QUÉ NECESITO HACER?
→ reportar, consultar, responder o validar

¿QUÉ INFORMACIÓN YA CONOCE EL SISTEMA?
→ identidad, sede, área, aplicación, dispositivo y contexto cuando sean resolubles

¿QUÉ ESTÁ PASANDO CON MI CASO?
→ estado humano, última actualización y siguiente acción

¿QUÉ DEBO HACER YO?
→ aportar información, seguir un workaround seguro o confirmar recuperación

¿QUÉ NO DEBO DECIDIR?
→ clasificación técnica, prioridad, SLA, causa, asignación o cierre canónico
```

El objetivo no es construir una nueva aplicación ni una segunda mesa de servicio. ANIMA conserva el canal simple del trabajador y VISO conserva el expediente tecnológico y su gobierno.

---

#### 2. Resultado sustantivo

Se materializa el diseño completo del portal del trabajador con este balance:

| Elemento                                             |          Resultado |
| ---------------------------------------------------- | -----------------: |
| Ruta móvil reutilizada                               | **1 — `/support`** |
| Pestañas nuevas de ANIMA                             |              **0** |
| Bloques primarios del portal                         |              **4** |
| Flujo primario de reporte                            |              **1** |
| Estados canónicos reconciliados para presentación    |         **9 de 9** |
| Condiciones de espera con traducción humana          |         **4 de 4** |
| Acciones de cierre canónico concedidas al trabajador |              **0** |
| Cambios físicos                                      |              **0** |
| Requisitos de prueba nuevos o modificados            |              **0** |

Los cuatro bloques primarios son:

1. **Reportar un problema**;
2. **Mis solicitudes**;
3. **Avisos de servicio**;
4. **Ayuda rápida**.

La experiencia conserva una única intención principal: que el trabajador pueda obtener soporte sobre su propia necesidad. La cola administrativa, el triage técnico y la operación de mesa de servicio permanecen fuera de esta superficie.

---

#### 3. Entradas y autoridades conservadas

La tarea consume y preserva sin redefinir:

- `CAP-SCOPE-015` y la decisión `REUSE_OR_REFACTOR` de `support_tickets` y `support_messages`;
- `TI-DOM-001`, especialmente `TI-SERVICE-006`, `TI-SERVICE-007`, `TI-SERVICE-011` y los niveles `TI-ATTN-001` a `TI-ATTN-004`;
- `TI-DOM-007`, incluido el caso único de `VPROC-0058`, su entrada mínima, clasificación, impacto, urgencia, prioridad, SLA, comunicación, restauración, validación, cierre y reapertura;
- `TI-AUTH-001`, respecto de quién puede reportar, aportar evidencia y confirmar recuperación sin adquirir privilegios técnicos;
- `TI-AUTH-004`, respecto de minimización, logs, capturas, adjuntos, secretos, datos personales, notificaciones y divulgación;
- `UX-BASE-001` a `UX-BASE-010`, respecto de carriles, tarea principal, lenguaje humano, contexto, captura no duplicada, excepciones y divulgación progresiva;
- la navegación autenticada vigente de ANIMA y la identidad existente de `/support`;
- `TREQ-ANIMA-013`, que conserva exactamente nueve pestañas autenticadas;
- `TREQ-ANIMA-014`, que conserva el destino `/support` para `support_message`;
- `TREQ-ANIMA-022`, que protege tickets, mensajes, estados, no leídos, territorio y conversaciones autorizadas en `/support`;
- `TREQ-VISO-002`, que ya asigna a `TI-UX-001` la obligación de permitir reportar y consultar desde ANIMA sin conocimiento técnico;
- `TREQ-UX-001`, `TREQ-UX-002`, `TREQ-UX-003`, `TREQ-UX-005`, `TREQ-UX-006`, `TREQ-UX-008` y `TREQ-UX-009` como cobertura transversal de simplicidad, contexto, estados, fallos y separación de superficies.

No se crea un proceso paralelo, una identidad de caso nueva, una clasificación local de incidentes ni un modelo de autorización específico de ANIMA.

---

#### 4. Estado AS-IS verificable de ANIMA

La implementación actual observada ya dispone de una pestaña `Soporte` en la navegación autenticada y de una ruta `/support` con no leídos y apertura desde notificaciones `support_message`.

La superficie actual contiene:

- un hero `Soporte`;
- un contador de tickets;
- un indicador de chat activo;
- acción `Crear ticket`;
- para funciones gerenciales, acciones `Enviar aviso` y `Conversación`;
- una bandeja denominada `Tickets`;
- un hilo denominado `Chat interno`;
- estados legacy `open`, `in_progress`, `resolved` y `closed`;
- mensajes y contador de no leídos;
- acción `Cerrar`;
- acción `Ocultar`;
- preguntas frecuentes centradas principalmente en asistencia, sede, GPS, permisos Android, turnos y exportación.

El formulario actual de creación solicita únicamente:

```text
Asunto
Descripción libre
```

El comportamiento cliente observado conserva además:

- `category = "attendance"` en los flujos de creación revisados;
- creación de un primer `support_message` al abrir el ticket;
- cambio de `status` a `in_progress` al enviar un mensaje;
- cambio de `status` a `closed` y escritura de `resolved_at` mediante la acción actual de cierre;
- lectura de `support_tickets`, `support_messages` y `support_ticket_reads` para bandeja, conversación, ocultamiento y no leídos.

Ese comportamiento es funcional como bandeja de ticket/chat, pero no representa el contrato objetivo de `VPROC-0058`.

Se conserva la reconciliación aprobada:

```text
MENSAJE
≠ CAMBIO DE ESTADO DEL CASO

CERRAR CONVERSACIÓN
≠ VALIDAR RESTAURACIÓN
≠ CERRAR CASO TECNOLÓGICO

TICKET LEGACY
≠ EXPEDIENTE COMPLETO DE VISO
```

La ausencia de filtros territoriales explícitos en una consulta cliente no se utiliza aquí para afirmar exposición de datos: la autorización efectiva continúa gobernada por los controles de servidor y RLS aplicables y por los requisitos existentes.

---

#### 5. Decisiones rectoras del diseño

1. **Se reutiliza `/support`.** No se crea una pestaña adicional, un portal separado ni una segunda aplicación.
2. **La pestaña deja de presentarse conceptualmente como bandeja de tickets y chat.** Su intención primaria pasa a ser obtener soporte y seguir el propio caso.
3. **El chat se conserva como canal de comunicación dentro del caso.** No determina clasificación, prioridad, diagnóstico ni estado por el simple hecho de recibir un mensaje.
4. **ANIMA captura el reporte; VISO gobierna el triage y el caso tecnológico cuando permanece en `VPROC-0058`.** Si la clasificación exige acceso, problema, cambio, seguridad o continuidad, se conserva el handoff al proceso propietario; ANIMA no convierte el motivo visible en clasificación canónica ni escribe prioridad final, SLA, causa, estado técnico final o cierre desde decisión libre del cliente.
5. **El trabajador describe síntomas y necesidades.** No debe escoger `INCIDENT`, `SERVICE_REQUEST`, `P1`, `L2`, un SLA o una causa técnica.
6. **El contexto se propone antes de pedirlo.** Identidad, sede, área, aplicación, dispositivo, instante y origen se reutilizan cuando existe una fuente autorizada.
7. **Solo se pregunta lo que falta.** Ningún dato ya resuelto se vuelve a solicitar como texto libre.
8. **Los detalles técnicos quedan detrás de autorización y divulgación progresiva.** El trabajador no necesita ver logs, IP, topología, secretos, payloads ni hipótesis internas.
9. **Restauración y cierre permanecen separados.** El trabajador participa mediante validación explícita cuando corresponda.
10. **La experiencia administrativa no compite con la personal.** Las acciones gerenciales actuales se separan visual y semánticamente del portal del trabajador.
11. **Ayuda rápida no sustituye el caso.** Si una guía no resuelve el síntoma, el reporte continúa con el contexto ya conocido.
12. **Un fallo al enviar no se presenta como caso creado.** La interfaz distingue borrador, pendiente de envío y caso confirmado.

---

#### 6. Arquitectura de información de `/support`

La superficie se organiza en este orden:

```text
SOPORTE

1. ACCIÓN PRINCIPAL
   Reportar un problema

2. MIS SOLICITUDES
   Casos que requieren atención, respuesta o validación

3. AVISOS DE SERVICIO
   Interrupciones o cambios relevantes para el trabajador

4. AYUDA RÁPIDA
   Guías breves y contextualizadas
```

La acción principal no compite con contadores administrativos, herramientas de contacto a terceros ni controles técnicos.

Si no existen casos abiertos, la superficie sigue siendo útil: mantiene `Reportar un problema`, avisos relevantes y ayuda rápida.

Si existe una acción requerida por el trabajador, `Mis solicitudes` la eleva por encima de información pasiva.

---

#### 7. Composición material de la portada

La referencia de composición es:

```text
┌──────────────────────────────────────┐
│ Soporte                              │
│ ¿Necesitas ayuda con tu trabajo?     │
│                                      │
│ [ Reportar un problema ]             │
└──────────────────────────────────────┘

MIS SOLICITUDES
┌──────────────────────────────────────┐
│ No puedo ingresar a una aplicación  │
│ Estamos investigando                │
│ Próxima actualización: 2:30 p. m.   │
│ [ Ver caso ]                         │
└──────────────────────────────────────┘

┌──────────────────────────────────────┐
│ Impresora no responde               │
│ Necesitamos información tuya        │
│ [ Responder ]                        │
└──────────────────────────────────────┘

AVISOS DE SERVICIO
┌──────────────────────────────────────┐
│ Conectividad degradada en tu sede   │
│ Puedes seguir usando: ...            │
│ Próxima actualización: ...           │
└──────────────────────────────────────┘

AYUDA RÁPIDA
[ Problemas frecuentes y guías ]
```

Los textos son una proyección humana del estado. No son identificadores de dominio ni fuente de lógica.

---

#### 8. Flujo material de reporte

El reporte se resuelve como un flujo corto y progresivo.

##### 8.1. Paso 1 — identificar el síntoma o necesidad

La primera pregunta será:

```text
¿Qué está pasando?
```

La superficie puede proponer, según contexto, opciones humanas como:

- `No puedo entrar o usar mi cuenta`;
- `Una aplicación no funciona`;
- `Un equipo no funciona`;
- `Una impresora no funciona`;
- `Internet o la conexión falla`;
- `Necesito ayuda para hacer algo`;
- `Otro / no sé cuál elegir`.

Estas opciones son **motivos de presentación** y no clasificación canónica. No equivalen a `SERVICE_REQUEST`, `INCIDENT`, servicio técnico definitivo, impacto, urgencia o prioridad.

La opción `Otro / no sé cuál elegir` es siempre válida. La falta de conocimiento técnico nunca bloquea el reporte.

##### 8.2. Paso 2 — reutilizar contexto

Antes de pedir datos manuales, ANIMA presenta el contexto resoluble:

```text
Detectamos para este reporte:
Sede: <contexto autorizado>
Área: <si aplica>
Aplicación: <si se conoce>
Dispositivo: <descripción humana si se conoce>
Hora observada: <instante>
```

El trabajador confirma o corrige únicamente valores que realmente puedan variar dentro de su alcance.

##### 8.3. Paso 3 — obtener señales observables

Cuando el contexto no basta para triage, se realizan preguntas humanas de efecto, por ejemplo:

```text
¿Puedes seguir trabajando con una alternativa segura?
¿Le está pasando a más personas que puedas observar?
¿Necesitas resolverlo durante este turno o ventana de trabajo?
```

Las respuestas son señales de entrada. No permiten al trabajador fijar impacto, urgencia o prioridad canónicos.

Las preguntas solo aparecen cuando aportan información material. No se convierten en un cuestionario fijo para cada reporte.

##### 8.4. Paso 4 — detalle y evidencia opcional

Se solicita una descripción breve del síntoma observable:

```text
Cuéntanos qué ves o qué necesitas.
```

No se exige escribir una causa.

Los adjuntos son opcionales. Antes de adjuntar, la interfaz recuerda de forma compacta que no deben incluirse contraseñas, códigos de acceso, tokens, información personal de terceros ni contenido ajeno al problema.

##### 8.5. Paso 5 — confirmar envío

Antes del envío se resume únicamente la información necesaria:

```text
Problema: <motivo humano>
Contexto: <sede / aplicación / dispositivo si aplica>
Descripción: <texto>
Adjuntos: <cantidad>
```

El resultado de un envío confirmado será una referencia segura del caso y una presentación equivalente a:

```text
Reporte recibido
Ya quedó registrado.
Te avisaremos aquí cuando haya una actualización o necesitemos información.
[ Ver caso ]
```

La prioridad, el SLA y la causa no se muestran como si el trabajador los hubiera decidido.

---

#### 9. Matriz de resolución contextual

| Dato                | Fuente preferida                                                    | Presentación al trabajador              | Regla si falta                                                       |
| ------------------- | ------------------------------------------------------------------- | --------------------------------------- | -------------------------------------------------------------------- |
| solicitante         | sesión e identidad autorizada                                       | no editable como texto libre            | el reporte no avanza sin identidad atribuible                        |
| sede                | contexto efectivo                                                   | nombre humano de sede                   | si existen varias válidas, se ofrecen solo opciones autorizadas      |
| área                | contexto efectivo cuando aplique                                    | nombre humano                           | se pregunta solo si es necesaria y no puede resolverse               |
| turno               | contexto laboral cuando sea pertinente                              | se muestra únicamente si aporta al caso | no se inventa ni se exige para casos que no dependen del turno       |
| aplicación          | superficie desde la que se originó el soporte o catálogo autorizado | nombre de aplicación                    | desde soporte global puede preguntarse con opciones humanas          |
| dispositivo         | identidad de dispositivo o endpoint cuando sea resoluble            | descripción humana mínima               | puede quedar sin resolver para triage; no se inventa por nombre o IP |
| elemento físico     | grafo tecnológico cuando exista relación demostrada                 | etiqueta humana mínima                  | opcional al reportar; VISO completa cuando exista evidencia          |
| momento observado   | interacción del trabajador                                          | fecha y hora comprensibles              | puede ajustarse si el hecho comenzó antes del reporte                |
| síntoma o necesidad | trabajador                                                          | texto humano                            | obligatorio en forma mínima                                          |
| evidencia           | trabajador / fuente autorizada                                      | adjunto o referencia                    | opcional y sometida a controles de sensibilidad                      |
| impacto declarado   | preguntas de efecto                                                 | lenguaje humano                         | es señal, no valor canónico                                          |
| urgencia declarada  | preguntas de ventana                                                | lenguaje humano                         | es señal, no prioridad                                               |

La dirección IP, hostname, serial, identificador interno o referencia técnica solo se presenta cuando sea imprescindible y esté autorizada; normalmente permanece oculta detrás de la correlación del caso.

---

#### 10. Diseño de `Mis solicitudes`

La lista personal no se ordena conceptualmente como una consola ITSM. Cada tarjeta muestra únicamente:

- título o síntoma comprensible;
- referencia segura del caso;
- estado humano;
- sede o contexto cuando ayude a distinguir casos;
- última actualización relevante;
- siguiente acción del trabajador, si existe;
- siguiente actualización o compromiso comunicable, cuando exista;
- indicador de mensajes no leídos.

Las tarjetas con acción requerida del trabajador se priorizan visualmente sobre los casos sin acción pendiente.

Un caso cerrado no desaparece automáticamente. Puede mantenerse en historial o ser ocultado de la bandeja personal sin alterar el expediente de VISO.

`Ocultar` o una futura acción equivalente solo afecta presentación personal; nunca se interpreta como cierre del caso.

---

#### 11. Diseño del detalle de caso

El detalle se compone en este orden:

1. **Estado y siguiente acción**;
2. **qué se reportó**;
3. **contexto seguro del caso**;
4. **actualización más reciente**;
5. **workaround o instrucción segura, si existe**;
6. **conversación**;
7. **evidencia que el trabajador puede aportar o consultar**;
8. **validación**, cuando el caso llegue a esa etapa;
9. **historial compacto de hitos comprensibles**.

La conversación no se denomina expediente técnico ni expone notas internas.

El trabajador puede entender el avance sin conocer el state machine completo de VISO.

---

#### 12. Reconciliación de los nueve estados canónicos con lenguaje humano

Los nueve estados de `VPROC-0058` se conservan sin renombrar en el dominio. ANIMA utiliza una proyección de presentación:

| Estado canónico             | Presentación principal en ANIMA     | Acción esperada del trabajador                                            |
| --------------------------- | ----------------------------------- | ------------------------------------------------------------------------- |
| `TECH_CASE_REPORTED`        | `Reporte recibido`                  | ninguna salvo completar información solicitada                            |
| `TRIAGE_IN_PROGRESS`        | `Estamos revisándolo`               | ninguna                                                                   |
| `PRIORITIZED`               | `En atención`                       | ninguna; no se expone prioridad técnica por defecto                       |
| `DIAGNOSIS_IN_PROGRESS`     | `Estamos investigando`              | responder solo si se solicita información concreta                        |
| `WORKAROUND_APPLIED`        | `Hay una solución temporal`         | seguir únicamente instrucciones seguras y reportar resultado              |
| `RESOLUTION_IN_PROGRESS`    | `Estamos trabajando en la solución` | ninguna o aportar información solicitada                                  |
| `USER_VALIDATION_PENDING`   | `Confirma si ya funciona`           | validar explícitamente el resultado                                       |
| `KNOWLEDGE_CAPTURE_PENDING` | `Solución confirmada`               | ninguna; la captura interna de conocimiento no compite con la experiencia |
| `TECH_CASE_CLOSED`          | `Caso cerrado`                      | consultar historial; reapertura solo mediante mecanismo permitido         |

La presentación no crea otro state machine. Un cambio de texto o estilo en ANIMA no modifica por sí solo el estado canónico.

---

#### 13. Condiciones de espera y mensajes de acción

Las cuatro condiciones de espera aprobadas se traducen sin exponer jerga:

| Condición de caso            | Presentación humana                       | Regla de experiencia                                                                             |
| ---------------------------- | ----------------------------------------- | ------------------------------------------------------------------------------------------------ |
| `WAITING_REQUESTER_INFO`     | `Necesitamos información tuya`            | muestra la pregunta exacta y una acción de respuesta                                             |
| `WAITING_REQUIRED_APPROVAL`  | `Esperando una aprobación necesaria`      | explica que el caso sigue registrado y quién debe decidir en términos permitidos                 |
| `PLANNED_WINDOW_NOT_STARTED` | `Programado`                              | muestra fecha o ventana comprometida cuando esté disponible                                      |
| `WAITING_EXTERNAL_PROVIDER`  | `Seguimos gestionándolo con un proveedor` | VENTO conserva ownership y próxima actualización; no se abandona al trabajador frente al tercero |

Todo bloqueo o fallo de la interfaz aplica lenguaje humano y debe indicar, cuando corresponda:

- qué ocurrió;
- qué quedó guardado;
- qué puede hacer el trabajador;
- quién continúa gestionando;
- cuándo revisar o reintentar;
- una referencia segura para soporte.

No se muestran códigos de base de datos, permisos internos, stack traces ni excepciones como explicación principal.

---

#### 14. Matriz de acciones del trabajador

| Acción                                       | ANIMA trabajador                           | Efecto canónico                                                                                                         |
| -------------------------------------------- | ------------------------------------------ | ----------------------------------------------------------------------------------------------------------------------- |
| reportar síntoma o necesidad                 | permitida dentro de su contexto autorizado | origina una entrada de soporte; VISO clasifica si permanece en `VPROC-0058` o si requiere el handoff canónico aplicable |
| consultar sus casos autorizados              | permitida                                  | solo lectura/proyección personal                                                                                        |
| leer comunicaciones                          | permitida                                  | no cambia estado por sí sola                                                                                            |
| enviar mensaje                               | permitida mientras el canal corresponda    | comunicación; no fuerza `in_progress` ni otro estado                                                                    |
| aportar evidencia                            | permitida con controles aplicables         | agrega evidencia o referencia, no diagnóstico                                                                           |
| responder información solicitada             | permitida                                  | satisface una entrada pendiente; VISO reevalúa el caso                                                                  |
| confirmar que ya funciona                    | permitida cuando se solicite validación    | valida restauración o fulfillment según contrato                                                                        |
| indicar que sigue fallando                   | permitida cuando se solicite validación    | retorna el trabajo a resolución; no crea cierre falso                                                                   |
| ocultar de su bandeja                        | permitida como preferencia de presentación | no cierra ni elimina el caso                                                                                            |
| elegir prioridad final                       | no permitida                               | VISO la deriva desde impacto y urgencia                                                                                 |
| elegir SLA                                   | no permitida                               | VISO aplica el perfil correspondiente                                                                                   |
| declarar causa técnica                       | no requerida ni autoritativa               | diagnóstico pertenece al soporte autorizado                                                                             |
| asignar técnico o proveedor                  | no permitida                               | asignación pertenece a VISO                                                                                             |
| marcar cierre canónico                       | no permitida                               | cierre pertenece al proceso y sus autoridades                                                                           |
| consultar logs, IP o diagnóstico restringido | no disponible por defecto                  | requiere superficie y autorización técnica separadas                                                                    |

---

#### 15. Validación de recuperación

Cuando el caso llegue a `USER_VALIDATION_PENDING`, ANIMA presenta una interacción inequívoca:

```text
¿Ya puedes continuar normalmente?

[ Sí, ya funciona ]
[ No, sigue fallando ]
```

Si el trabajador elige `Sí, ya funciona`:

- se registra la validación atribuible;
- se presenta que la solución fue confirmada;
- VISO continúa conocimiento y cierre según el contrato;
- ANIMA no escribe `closed` por decisión local independiente.

Si el trabajador elige `No, sigue fallando`:

- se conserva su respuesta como validación negativa;
- el caso vuelve al trabajo de resolución correspondiente;
- se mantiene el historial de la restauración intentada;
- no se crea un segundo ticket por defecto.

El silencio no equivale a aceptación.

Si el solicitante no puede validar, la autoridad alternativa definida por `TI-DOM-007` conserva esa decisión fuera de esta interacción personal.

---

#### 16. Comunicación y notificaciones

La comunicación visible al trabajador debe responder, según el momento:

- qué se sabe con certeza;
- qué está afectado;
- qué sigue funcionando;
- qué acción segura debe realizar o evitar;
- quién continúa gestionando el caso;
- cuándo habrá una nueva actualización o compromiso;
- si existe una solución temporal;
- cuándo se necesita su validación;
- qué quedó resuelto y qué permanece pendiente.

La vista personal no presenta como hecho una hipótesis técnica no confirmada.

Las notificaciones de soporte se tratan como una superficie de divulgación independiente. Por defecto su preview debe ser mínimo y seguro, por ejemplo:

```text
Tu caso de soporte tiene una actualización.
Abre ANIMA para verla.
```

Puede añadirse una referencia segura cuando sea necesaria. No se proyecta por defecto el cuerpo libre completo de un mensaje, secretos, datos personales sensibles, logs, IP, causa restringida o información de terceros.

El deep link conserva `/support`. Si una notificación identifica un caso, ANIMA puede seleccionar ese caso dentro de la misma ruta únicamente después de comprobar que el actor puede verlo. Una notificación no concede acceso.

---

#### 17. `Avisos de servicio`

`Avisos de servicio` es una superficie personal de información relevante, no una consola de incidentes.

Puede mostrar interrupciones, degradaciones, mantenimiento o recuperación que afecten al contexto del trabajador.

Cada aviso visible debe limitarse a:

- servicio o capacidad afectada en lenguaje humano;
- alcance relevante para el trabajador;
- estado actual;
- alternativa segura o instrucción, si existe;
- próxima actualización cuando esté comprometida;
- referencia segura cuando sea útil.

No muestra por defecto:

- prioridad interna;
- topología;
- IP;
- logs;
- proveedor culpable;
- hipótesis de causa;
- datos de otros trabajadores;
- detalles de seguridad.

La gestión administrativa de incidentes y comunicaciones masivas pertenece a VISO y a sus tareas propietarias; ANIMA solo proyecta el aviso autorizado para el trabajador.

---

#### 18. `Ayuda rápida`

La ayuda existente se conserva como capacidad útil, pero se reorganiza para no quedar limitada a asistencia.

Reglas:

1. las guías contextuales pueden aparecer antes de crear un caso cuando exista una comprobación segura de L0;
2. la guía no obliga al trabajador a completar una secuencia larga antes de poder reportar;
3. una guía nunca solicita secretos ni privilegios;
4. si la guía falla, `Sigue sin funcionar` abre el reporte conservando el contexto y el síntoma ya capturados;
5. la ayuda puede priorizar contenido relacionado con la aplicación o superficie desde la cual llegó el trabajador;
6. la ayuda no marca un caso como resuelto sin evidencia y validación;
7. el diseño completo de diagnóstico guiado, conocimiento y capacitación permanece en `TI-UX-006`.

TI-UX-001 define el acceso y el handoff; no duplica la tarea de conocimiento.

---

#### 19. Separación de experiencia personal y funciones gerenciales

Las acciones actuales `Enviar aviso` y `Conversación` disponibles para funciones gerenciales no forman parte de la intención primaria del portal personal del trabajador.

Se fija esta regla:

```text
SOLICITAR O SEGUIR MI SOPORTE
→ SUPERFICIE PERSONAL PRINCIPAL

CONTACTAR A OTRO TRABAJADOR
→ SUPERFICIE SECUNDARIA DE SUPERVISIÓN O GESTIÓN
```

La disponibilidad de una función gerencial no modifica la composición primaria de `/support`.

Si esas acciones permanecen dentro de la misma ruta en una implementación posterior deberán:

- estar separadas visualmente del bloque personal;
- aparecer únicamente tras la resolución de autorización correspondiente;
- no usar el mismo CTA primario de `Reportar un problema`;
- no convertir un aviso o conversación administrativa en caso tecnológico por defecto;
- conservar la protección territorial y de actor existente.

La cola administrativa, prioridad, SLA, asignación, comunicación operativa de mesa de servicio y validación administrativa pertenecen a `TI-UX-002`.

---

#### 20. Operación sin red, fallo parcial y reintento

El portal distingue cuatro resultados de captura:

```text
BORRADOR LOCAL
PENDIENTE DE ENVÍO DURABLE
CASO CONFIRMADO
ENVÍO FALLIDO / REQUIERE ACCIÓN
```

Reglas:

1. `Caso confirmado` solo se muestra después de recibir una identidad o referencia de caso confirmada por la autoridad correspondiente;
2. `Pendiente de envío` solo puede mostrarse cuando la intención quedó persistida durablemente en el dispositivo mediante el contrato aplicable;
3. si la persistencia durable no está disponible, el texto debe indicar que el reporte todavía no fue enviado y conservar el borrador mientras sea posible;
4. reintentar la misma intención no debe crear múltiples efectos cuando exista un identificador idempotente aplicable;
5. un reporte capturado offline no fija prioridad, SLA ni cierre;
6. al recuperar conectividad se reconcilia el resultado antes de afirmar éxito;
7. si el contexto o la autorización cambiaron mientras estuvo offline, se reevalúan antes de ejecutar una acción protegida;
8. un fallo de adjunto no borra el resto del reporte; se informa qué archivo no pudo incorporarse y qué quedó preservado;
9. un error técnico se traduce a una explicación humana y conserva una referencia segura cuando exista.

Esta tarea define la experiencia. No afirma que la persistencia durable del reporte de soporte ya esté implementada físicamente.

---

#### 21. Composición visual y accesibilidad

El portal reutiliza el lenguaje visual vigente de ANIMA en lugar de introducir un sistema paralelo.

Se fijan estas reglas de composición:

- una sola acción primaria destacada por pantalla;
- tarjetas compactas para casos y avisos;
- chips de estado con texto, nunca solo color;
- jerarquía visual basada en siguiente acción antes que en métricas internas;
- no usar `Tickets`, `Chat activo`, `P1`, `SLA`, `L1`, `L2`, `L3` o códigos de estado como conceptos dominantes para el trabajador;
- tipografía y controles legibles en móvil;
- áreas táctiles suficientes para acciones críticas de respuesta y validación;
- estados de carga, vacío, error y sin conexión explícitos;
- compatibilidad con lector de pantalla mediante etiquetas semánticas en la implementación posterior;
- no depender únicamente de color para distinguir abierto, espera, acción requerida, restauración o cierre;
- divulgación progresiva para historial, adjuntos y detalles secundarios;
- la conversación aparece después del estado y de la siguiente acción, no al revés.

La densidad administrativa queda fuera del portal personal.

---

#### 22. Reconciliación AS-IS → diseño objetivo

| AS-IS observado                                                                        | Diseño objetivo de TI-UX-001                                                                  | Efecto esperado                                          |
| -------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------- | -------------------------------------------------------- |
| pestaña `Soporte` existente                                                            | se conserva                                                                                   | cero crecimiento de navegación superior                  |
| hero centrado en tickets y chat                                                        | hero centrado en `Reportar un problema`                                                       | el trabajador entiende la tarea principal                |
| contador `Tickets`                                                                     | resumen de casos solo cuando aporte acción                                                    | se reduce lenguaje interno                               |
| `Chat activo` como indicador principal                                                 | estado y siguiente acción del caso                                                            | la conversación deja de representar el proceso           |
| formulario `Asunto + descripción`                                                      | reporte contextual y progresivo                                                               | menos texto libre y menos información duplicada          |
| `category = attendance` en creación observada                                          | el motivo visible deja de estar ligado a asistencia; VISO resuelve clasificación y servicio   | soporte transversal sin exigir categoría técnica         |
| `open/in_progress/resolved/closed` visibles como modelo                                | proyección humana de los nueve estados canónicos                                              | estado comprensible sin crear otro state machine         |
| enviar mensaje mueve a `in_progress`                                                   | mensaje solo comunica                                                                         | se separa mensajería de transición de proceso            |
| botón `Cerrar` escribe `closed` y `resolved_at`                                        | trabajador valida `Sí, ya funciona` / `No, sigue fallando`; cierre canónico permanece en VISO | elimina cierre prematuro desde cliente                   |
| bandeja `Tickets`                                                                      | `Mis solicitudes`                                                                             | enfoque en necesidad del trabajador                      |
| `Chat interno`                                                                         | `Conversación` dentro del detalle                                                             | el canal deja de ser la identidad del caso               |
| FAQ principalmente de asistencia                                                       | ayuda rápida contextual + handoff a reporte                                                   | soporte útil más allá de check-in                        |
| acciones gerenciales compiten en el hero                                               | funciones de gestión separadas de la superficie personal                                      | preserva carriles UX                                     |
| preview de soporte puede transportar texto libre en el flujo observado por TI-AUTH-004 | preview mínimo y seguro                                                                       | reduce exposición en pantalla bloqueada y proveedor push |
| ocultamiento personal                                                                  | puede mantenerse como preferencia de bandeja                                                  | no altera estado canónico                                |

La columna objetivo es especificación documental. No se presenta como código ya implementado.

---

#### 23. Fronteras con las siguientes tareas de experiencia TI

| Materia                                                                                        | Propietario | Límite de TI-UX-001                                                          |
| ---------------------------------------------------------------------------------------------- | ----------- | ---------------------------------------------------------------------------- |
| portal personal ANIMA                                                                          | `TI-UX-001` | queda completamente diseñado aquí                                            |
| cola administrativa, prioridad, SLA, asignación, comunicación y validación de mesa de servicio | `TI-UX-002` | no se diseña la consola VISO                                                 |
| mapa visual de dispositivos, redes, impresoras, aplicaciones y salud                           | `TI-UX-003` | ANIMA solo muestra contexto humano mínimo                                    |
| experiencia de incidente, problema, cambio, mantenimiento y recuperación                       | `TI-UX-004` | no se diseñan flujos técnicos avanzados dentro del portal personal           |
| aplicaciones, proveedores, licencias, contratos, renovaciones y costos                         | `TI-UX-005` | no se muestran datos administrativos o comerciales al trabajador por defecto |
| diagnóstico guiado, conocimiento y capacitación                                                | `TI-UX-006` | se conserva únicamente `Ayuda rápida` y su handoff                           |

No se adelanta ninguna de esas tareas.

---

#### 24. Handoff hacia implementación física

El resultado de esta tarea es consumible por una implementación posterior sin tomar nuevas decisiones de UX sobre el flujo primario.

La etapa vigente `NEXO-REMISSIONS-001::CONDITIONAL_IMPLEMENTATION_SCOPE` deberá decidir si los cambios físicos de soporte pertenecen al paquete prioritario actual. Si se incluyen, su ejecución corresponde a `NEXO-REMISSIONS-001::CONDITIONAL_IMPLEMENTATION_EXECUTION` dentro de los repositorios propietarios y con las autorizaciones que correspondan.

El handoff físico deberá preservar, como mínimo:

1. `/support` como ruta existente;
2. las nueve pestañas autenticadas de ANIMA;
3. creación y consulta personal sin términos técnicos;
4. separación de mensajería y estado de proceso;
5. eliminación del cierre canónico decidido libremente por cliente;
6. validación explícita de recuperación;
7. contexto propuesto desde fuentes autorizadas;
8. proyección humana de estados;
9. protección de notificaciones, adjuntos y contenido sensible;
10. separación de funciones gerenciales;
11. autorización de servidor/RLS para toda lectura o acción protegida;
12. compatibilidad y reconciliación con datos legacy antes de retirar comportamientos existentes.

La implementación no podrá mapear `open`, `in_progress`, `resolved` o `closed` a estados canónicos únicamente por nombre. El contrato de transición aprobado en `TI-DOM-007` permanece obligatorio.

Los hallazgos `H-TI-DOM-007-003` y `H-TI-DOM-007-004` reciben en TI-UX-001 una decisión concreta de experiencia objetivo, pero no cambian de estado físico ni satisfacen su condición de salida hasta que una implementación autorizada separe mensajería, validación y cierre en servidor.

La minimización física del preview push detectada por `TI-AUTH-004` conserva como propietario de decisión de alcance `NEXO-REMISSIONS-001::CONDITIONAL_IMPLEMENTATION_SCOPE`; TI-UX-001 fija únicamente la presentación segura que la implementación deberá respetar.

---

#### 25. Estado del resultado

| Resultado material                         | Estado             |
| ------------------------------------------ | ------------------ |
| reutilización de `/support`                | `ESPECIFICADO`     |
| arquitectura de cuatro bloques             | `ESPECIFICADO`     |
| flujo contextual de reporte                | `ESPECIFICADO`     |
| resolución y presentación de contexto      | `ESPECIFICADO`     |
| lista y detalle de casos personales        | `ESPECIFICADO`     |
| proyección humana de nueve estados         | `ESPECIFICADO`     |
| traducción de cuatro condiciones de espera | `ESPECIFICADO`     |
| validación de recuperación por trabajador  | `ESPECIFICADO`     |
| comunicación y avisos de servicio          | `ESPECIFICADO`     |
| reglas de notificación segura              | `ESPECIFICADO`     |
| ayuda rápida y handoff a conocimiento      | `ESPECIFICADO`     |
| separación de funciones gerenciales        | `ESPECIFICADO`     |
| experiencia offline y de fallo parcial     | `ESPECIFICADO`     |
| implementación de componentes ANIMA        | `FUERA_DE_ALCANCE` |
| modelo físico completo de caso VISO        | `FUERA_DE_ALCANCE` |
| migración o reconciliación de datos legacy | `FUERA_DE_ALCANCE` |
| cambios Supabase                           | `NO_APLICA`        |
| validación operativa en dispositivo        | `FUERA_DE_ALCANCE` |

No queda una decisión de experiencia primaria del portal diferida a `TI-UX-002` a `TI-UX-006`; esas tareas conservan únicamente sus materias propietarias.

---

#### 26. Invariantes

1. ANIMA conserva `/support` y no crea una décima pestaña.
2. ANIMA es canal personal; VISO conserva el caso tecnológico.
3. reporte no equivale a clasificación.
4. síntoma no equivale a causa.
5. impacto declarado no equivale a impacto canónico.
6. urgencia declarada no equivale a prioridad.
7. prioridad no es editable libremente por el trabajador.
8. SLA no es editable por el trabajador.
9. mensaje no cambia por sí solo el estado del caso.
10. conversación no equivale a expediente.
11. `resolved` legacy no equivale a restauración validada.
12. `closed` legacy no equivale a cierre canónico.
13. ocultar un caso no lo cierra.
14. restauración no equivale a causa eliminada.
15. restauración no equivale a cierre.
16. validación negativa no crea un cierre exitoso.
17. silencio del trabajador no equivale a aceptación.
18. un proveedor no sustituye ownership VENTO.
19. una notificación no concede acceso al caso.
20. el preview de notificación no expone contenido sensible por defecto.
21. contexto sugerido no puede fabricarse desde texto libre o identificadores no autoritativos.
22. datos ya conocidos no se vuelven a pedir sin necesidad.
23. no saber la categoría técnica no impide reportar.
24. ayuda rápida no bloquea el acceso al reporte.
25. una guía no concede privilegio ni autoriza cambios.
26. un caso offline pendiente no se presenta como confirmado.
27. un reintento no debe producir duplicados cuando exista contrato idempotente.
28. las funciones gerenciales no compiten con la acción personal primaria.
29. logs, IP, secretos y diagnóstico restringido permanecen fuera de la vista ordinaria.
30. un motivo visible relacionado con acceso no sustituye `ACCESS_REQUEST_HANDOFF` ni crea el ciclo de acceso dentro de `VPROC-0058`; `VPROC-0059` conserva su propiedad;
31. esta tarea no modifica código, datos, Supabase ni navegación física.

---

#### 27. Requisitos de prueba derivados

**Resultado:** NO GENERA REQUISITOS DE PRUEBA

**Justificación:** el registro vigente ya protege la experiencia operativa simple, el lenguaje humano, la separación de superficies, el contexto, la recuperación ante fallos, la navegación autenticada de ANIMA, la protección de `/support` y el comportamiento completo de la mesa de servicio tecnológica, incluyendo expresamente que ANIMA permita reportar y consultar sin conocimientos técnicos. TI-UX-001 materializa la proyección de experiencia de esas obligaciones sobre la superficie existente y no introduce una regla empresarial, riesgo, mecanismo de seguridad o comportamiento ejecutable nuevo que requiera una identidad adicional.

**Balance:** 0 creados; 0 modificados; 0 diferidos; 0 descartados; 0 obsoletos.

---

#### 28. Criterios de aceptación

- [x] la tarea corresponde a la continuidad vigente `TI-AUTH-004 → TI-UX-001 → TI-UX-002`;
- [x] la tarea permanece exclusivamente documental;
- [x] se reutiliza `/support` y se crean cero pestañas nuevas;
- [x] la experiencia primaria queda definida como portal personal del trabajador;
- [x] se materializan exactamente cuatro bloques primarios: reportar, mis solicitudes, avisos y ayuda rápida;
- [x] el reporte puede iniciarse sin conocimiento técnico;
- [x] el trabajador no selecciona clasificación ITSM, prioridad, SLA, causa ni nivel de atención;
- [x] se define un flujo corto y progresivo de reporte;
- [x] identidad, sede, área, aplicación, dispositivo y contexto se reutilizan cuando son resolubles;
- [x] solo se solicita manualmente la información faltante;
- [x] se distinguen señales humanas de impacto y urgencia de sus valores canónicos;
- [x] se define comportamiento para adjuntos sin pedir secretos;
- [x] se diseña `Mis solicitudes` alrededor de estado y siguiente acción;
- [x] se reconcilian los nueve estados canónicos con presentación humana sin crear otro state machine;
- [x] se traducen las cuatro condiciones de espera a lenguaje humano;
- [x] se separan mensajería y transición de proceso;
- [x] se elimina del diseño objetivo el cierre canónico libre desde cliente;
- [x] se define validación explícita `Sí, ya funciona` / `No, sigue fallando`;
- [x] silencio no equivale a aceptación;
- [x] ocultar una conversación no equivale a cerrar el caso;
- [x] se define comunicación segura, siguiente actualización y workaround;
- [x] se define un preview de notificación mínimo y compatible con exposición en pantalla bloqueada;
- [x] el deep link conserva `/support` y no crea una ruta adicional;
- [x] los avisos de servicio muestran solo información necesaria para el trabajador;
- [x] ayuda rápida conserva handoff sin absorber `TI-UX-006`;
- [x] las funciones gerenciales quedan separadas de la intención personal primaria;
- [x] se define comportamiento de borrador, pendiente de envío, confirmado y fallo;
- [x] no se afirma persistencia offline física que no haya sido implementada;
- [x] se materializa la reconciliación entre la experiencia AS-IS y el diseño objetivo;
- [x] los hallazgos de cierre y mensajería legacy reciben una salida de experiencia concreta sin declarar implementación física;
- [x] se preservan las fronteras con `TI-UX-002` a `TI-UX-006`;
- [x] se identifica la etapa canónica que decidirá el alcance de implementación física;
- [x] se crean cero requisitos de prueba y se modifican cero requisitos existentes;
- [x] no se modifica código, Supabase, rutas, permisos, datos ni notificaciones desplegadas;
- [x] `TI-UX-002` permanece únicamente reservada.

---

#### 29. Continuidad

ÚLTIMA TAREA APROBADA
`TI-AUTH-004 — Proteger diagnósticos, logs, exportaciones, capturas, secretos y datos personales en soporte`

TAREA ACTUAL APROBADA
`TI-UX-001 — Diseñar portal simple de soporte para trabajadores dentro de ANIMA`

SIGUIENTE TAREA RESERVADA
`TI-UX-002 — Diseñar mesa de servicio de VISO con colas, prioridad, SLA, asignación, comunicación y validación`


### ✅ TI-UX-002 — Diseñar mesa de servicio de VISO con colas, prioridad, SLA, asignación, comunicación y validación

**Estado:** APROBADA
**Tarea anterior:** `TI-UX-001 — Diseñar portal simple de soporte para trabajadores dentro de ANIMA` — APROBADA
**Tarea siguiente:** `TI-UX-003 — Diseñar mapa de dispositivos, redes, impresoras, aplicaciones y salud técnica` — RESERVADA
**Tipo de tarea:** documental; diseño normativo y materializado de la experiencia administrativa de mesa de servicio en VISO para colas, triage, prioridad, SLA, asignación, comunicación, restauración, validación y cierre del caso tecnológico
**Repositorio propietario:** `vento-shell`
**Archivo propietario:** `docs/plan-canonico/modular/bloques/Z_TECNOLOGIA_Y_SOPORTE/03_EXPERIENCIA_DE_SOPORTE_Y_OPERACION_TI.md`
**Aplicación objetivo:** VISO
**Proceso propietario:** `VPROC-0058 — Gestionar solicitudes e incidentes tecnológicos con diagnóstico, prioridad, resolución y conocimiento`
**Artefactos producidos:** `TI-SERVICE-DESK-UX-CONTRACT-001`; `TI-SERVICE-DESK-QUEUE-MATRIX-001`; `TI-CASE-WORKSPACE-UX-CONTRACT-001`; `TI-SERVICE-DESK-UX-RECONCILIATION-001`
**Cambios físicos autorizados:** ninguno; no crea ni modifica código, componentes, navegación desplegada, tablas, enums, RLS, RPC, funciones, triggers, Edge Functions, migraciones, datos, permisos, notificaciones, integraciones ni configuración de Supabase
**Requisitos de prueba creados o modificados:** 0

**Qué se hace:** diseñar la mesa administrativa con la que el equipo autorizado de soporte recibe en VISO los casos reportados desde ANIMA u otros iniciadores permitidos, los clasifica, prioriza, organiza por colas, controla compromisos SLA, asigna y escala trabajo, comunica al solicitante, registra restauración y obtiene validación antes del cierre, sin convertir la mensajería, el color de una tarjeta, una asignación o un estado legacy en autoridad sobre el expediente.

---

#### 1. Propósito

Materializar la experiencia administrativa de `VPROC-0058` dentro de VISO de manera que un actor autorizado pueda responder, sin reconstruir manualmente el caso desde mensajes dispersos:

```text
¿QUÉ CASOS REQUIEREN ATENCIÓN AHORA?
→ cola, prioridad, riesgo SLA y siguiente compromiso

¿QUÉ ESTÁ AFECTADO?
→ servicio, elemento, sede, actor y alcance empresarial

¿QUIÉN RESPONDE?
→ propietario vigente, asignación aceptada y escalamiento

¿QUÉ SE SABE Y QUÉ FALTA?
→ triage, diagnóstico, evidencia, dependencias y pendientes

¿QUÉ DEBE COMUNICARSE?
→ mensaje seguro al solicitante, próxima actualización y workaround

¿EL SERVICIO VOLVIÓ A FUNCIONAR?
→ restauración o cumplimiento con evidencia

¿EL RESULTADO FUE VALIDADO?
→ respuesta del solicitante o validación equivalente autorizada

¿SE PUEDE CERRAR?
→ criterios completos, pendientes transferidos y autoridad aplicable
```

La mesa de servicio no crea un segundo proceso ni sustituye a ANIMA. ANIMA conserva la experiencia personal del trabajador; VISO conserva la experiencia administrativa y el expediente tecnológico.

---

#### 2. Resultado sustantivo

Se materializa una mesa de servicio administrativa completa con el siguiente balance:

| Elemento                                          |  Resultado |
| ------------------------------------------------- | ---------: |
| Aplicaciones nuevas                               |      **0** |
| Procesos nuevos                                   |      **0** |
| Máquinas de estado nuevas                         |      **0** |
| Artefactos documentales de UX                     |      **4** |
| Vistas operativas de cola definidas               |     **10** |
| Prioridades canónicas representadas               | **4 de 4** |
| Perfiles SLA representados                        | **4 de 4** |
| Estados canónicos representados                   | **9 de 9** |
| Condiciones estructuradas de espera representadas | **4 de 4** |
| Clases de escalamiento representadas              | **5 de 5** |
| Cambios físicos                                   |      **0** |
| Requisitos de prueba nuevos o modificados         |      **0** |

La solución documental se compone de:

1. `TI-SERVICE-DESK-UX-CONTRACT-001`: arquitectura de información, reglas de interacción y fronteras de la mesa de servicio;
2. `TI-SERVICE-DESK-QUEUE-MATRIX-001`: definición material de las diez vistas de cola y su orden operativo;
3. `TI-CASE-WORKSPACE-UX-CONTRACT-001`: composición del espacio de trabajo de cada caso, triage, SLA, asignación, comunicación, diagnóstico, evidencia, validación y cierre;
4. `TI-SERVICE-DESK-UX-RECONCILIATION-001`: reconciliación entre el soporte AS-IS y el diseño objetivo de VISO.

---

#### 3. Entradas y autoridades conservadas

La tarea consume y preserva, sin redefinir:

- `CAP-SCOPE-015` y la decisión de convertir el soporte existente en portal del trabajador y mesa de servicio coordinados;
- `TI-DOM-001`, incluidos `TI-SERVICE-006`, `TI-SERVICE-007` y `TI-ATTN-001` a `TI-ATTN-004`;
- `TI-DOM-007`, incluido `TI-SERVICE-CASE-CONTRACT-001`;
- `TI-CASE-CLASSIFICATION-MATRIX-001`;
- `TI-IMPACT-URGENCY-PRIORITY-MATRIX-001`;
- `TI-SLA-COMMITMENT-MATRIX-001`;
- `TI-ESCALATION-COMMUNICATION-MATRIX-001`;
- `TI-CASE-CLOSURE-REOPEN-CONTRACT-001`;
- `TI-SERVICE-DESK-ASIS-RECONCILIATION-001`;
- `TI-AUTH-001`, para responsabilidades, segregación y autoridad de soporte;
- `TI-AUTH-002` a `TI-AUTH-004`, para privilegio, configuración protegida, evidencia, secretos y divulgación;
- `TI-UX-001`, como contrato de la experiencia personal de soporte en ANIMA;
- `UX-BASE-001` a `UX-BASE-010`, para separación de carriles, foco, lenguaje humano, contexto, captura no duplicada y divulgación progresiva;
- `TREQ-VISO-002`, que protege la mesa de servicio tecnológica completa;
- `TREQ-VISO-046`, que protege la matriz de prioridad, los perfiles SLA, el reloj, las pausas y el escalamiento preventivo;
- `TREQ-ANIMA-022`, que protege la proyección personal de soporte y las conversaciones autorizadas del trabajador.

No se modifica ninguna definición de impacto, urgencia, prioridad, SLA, estado, cierre, autorización o propiedad ya aprobada.

---

#### 4. Frontera entre ANIMA y VISO

Se fija la separación de experiencia:

```text
ANIMA
→ trabajador reporta
→ trabajador consulta su caso
→ trabajador responde preguntas
→ trabajador recibe comunicación segura
→ trabajador confirma si el resultado volvió a funcionar

VISO
→ recibe y organiza la cola
→ clasifica
→ resuelve impacto y urgencia
→ deriva prioridad
→ aplica SLA
→ asigna y escala
→ diagnostica
→ controla workaround y restauración
→ comunica
→ solicita y registra validación
→ verifica criterios de cierre
→ cierra o correlaciona reapertura
```

Regla obligatoria:

```text
PORTAL DEL TRABAJADOR
≠
MESA DE SERVICIO ADMINISTRATIVA
```

El caso conserva una sola identidad. Cambiar de ANIMA a VISO o entre niveles de atención no crea un expediente nuevo.

---

#### 5. Qué cambia respecto del soporte actual

El cambio objetivo no consiste en eliminar el soporte que ya funciona. Consiste en convertir el backend funcional de tickets y mensajes en una experiencia administrativa capaz de gobernar el ciclo completo.

| AS-IS verificable                                                         | Diseño objetivo de TI-UX-002                                                                                                        |
| ------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------------------------------------- |
| `support_tickets` conserva datos básicos y estado legacy                  | VISO presenta el caso con servicio, elemento, impacto, urgencia, prioridad, SLA, propietario, restauración, validación y relaciones |
| `open`, `in_progress`, `resolved`, `closed` no prueban el ciclo canónico  | la interfaz usa los nueve estados de `VPROC-0058` y trata los estados legacy solo como transición técnica pendiente                 |
| mensajería y estado pueden quedar acoplados en el soporte actual          | enviar un mensaje no cambia por sí solo la etapa empresarial                                                                        |
| ANIMA puede marcar una conversación como cerrada                          | el cierre canónico se gobierna desde VISO con validación, evidencia, conocimiento y segregación aplicables                          |
| no se demuestra una mesa VISO completa                                    | se especifica la superficie administrativa completa que deberá materializarse en la etapa de implementación autorizada              |
| prioridad y SLA no están materializados en la estructura básica observada | VISO muestra impacto, urgencia, prioridad derivada, objetivos SLA y riesgo temporal de forma estructurada                           |
| `assigned_to` puede representar una asignación básica                     | la experiencia distingue propuesta de asignación, aceptación efectiva, propietario vigente, reasignación y escalamiento             |
| ticket y chat constituyen la experiencia principal                        | el caso se trabaja desde un espacio administrativo con resumen, comunicación, diagnóstico, evidencia e historial                    |
| cierre o resolución pueden aparentar finalización                         | restauración, validación y cierre quedan separados visual y funcionalmente                                                          |

La transición física de datos, estados y permisos no pertenece a esta tarea.

---

#### 6. Para qué sirve realmente la mesa de servicio

La mesa de servicio resuelve cinco problemas operativos concretos:

1. **Priorizar trabajo real:** evita que diez mensajes nuevos oculten un incidente crítico o que la antigüedad de un ticket se confunda con prioridad.
2. **Controlar compromisos:** permite saber qué caso está próximo a incumplir acuse, primera respuesta, restauración, cumplimiento o comunicación.
3. **Conservar propietario:** evita que un caso quede sin responsable durante reasignaciones, esperas de proveedor o cambios de turno.
4. **Separar conversación de proceso:** permite hablar con el trabajador sin falsear diagnóstico, restauración o cierre.
5. **Cerrar con evidencia:** impide presentar como terminado un caso que aún no fue validado o que dejó pendientes sin aceptación.

El resultado esperado es que el responsable tecnológico pueda operar una cola priorizada y que el trabajador siga viendo en ANIMA únicamente la parte que necesita comprender o contestar.

---

#### 7. `TI-SERVICE-DESK-UX-CONTRACT-001`

La mesa de servicio se integra conceptualmente al shell administrativo vigente de VISO. No se crea una aplicación paralela.

Su arquitectura de información se organiza en tres niveles:

```text
NIVEL 1 — COLAS
qué requiere atención y por qué

NIVEL 2 — CASO
qué ocurre, quién responde y cuál es la siguiente acción

NIVEL 3 — DETALLE AUTORIZADO
triage, diagnóstico, evidencia, relaciones, historial y decisiones protegidas
```

La profundidad técnica se revela progresivamente. La primera vista no obliga a abrir cada caso para identificar prioridad, riesgo SLA, propietario o próxima acción.

---

#### 8. Portada administrativa de la mesa

La portada prioriza trabajo pendiente, no métricas decorativas.

Composición objetivo:

```text
┌──────────────────────────────────────────────────────────────────────────────┐
│ Mesa de servicio                                                            │
│ Casos tecnológicos que requieren atención                                   │
│                                                                              │
│ [ Nuevos 12 ] [ P1/P2 5 ] [ SLA en riesgo 3 ] [ Validación pendiente 7 ]  │
│                                                                              │
│ Buscar caso, servicio, sede o solicitante                                    │
│ Filtros: cola · servicio · sede · prioridad · propietario · estado · fecha  │
└──────────────────────────────────────────────────────────────────────────────┘

COLA ACTUAL: SLA EN RIESGO
┌────┬──────────────────────┬──────────────┬────────┬──────────────┬────────────┐
│ P1 │ Venta sin servicio   │ Sede Centro  │ Caso…  │ Responsable… │ 00:18      │
│ P2 │ Impresión degradada  │ Sede Norte   │ Caso…  │ Sin aceptar  │ 00:42      │
│ P3 │ Solicitud de soporte │ Oficina      │ Caso…  │ Responsable… │ 03:15      │
└────┴──────────────────────┴──────────────┴────────┴──────────────┴────────────┘
```

Los contadores son accesos a conjuntos de trabajo. No sustituyen indicadores analíticos ni crean estados.

---

#### 9. `TI-SERVICE-DESK-QUEUE-MATRIX-001`

Las colas son vistas derivadas sobre atributos canónicos. No son estados de dominio y no modifican el expediente por incluirlo o excluirlo de una vista.

| Vista de cola               | Condición material                                                            | Acción principal esperada                                               | No significa                              |
| --------------------------- | ----------------------------------------------------------------------------- | ----------------------------------------------------------------------- | ----------------------------------------- |
| **Nuevos / por clasificar** | caso en `TECH_CASE_REPORTED` o `TRIAGE_IN_PROGRESS` con triage pendiente      | completar clasificación y contexto mínimo                               | prioridad conocida                        |
| **Sin aceptación**          | existe asignación propuesta o transferencia pendiente sin aceptación efectiva | obtener aceptación o resolver reasignación                              | caso sin propietario anterior             |
| **Mi trabajo**              | el actor actual es propietario aceptado dentro de su autorización             | ejecutar siguiente acción del caso                                      | autoridad ilimitada sobre el recurso      |
| **SLA en riesgo**           | se alcanzó umbral preventivo o existe incumplimiento activo                   | escalar, definir estrategia y comunicar                                 | cambio automático de prioridad            |
| **Esperando información**   | condición `WAITING_REQUESTER_INFO` vigente                                    | obtener dato estrictamente necesario y mantener trazabilidad            | pausa total de toda obligación            |
| **Esperando aprobación**    | condición `WAITING_REQUIRED_APPROVAL` vigente                                 | mostrar decisión requerida, autoridad y siguiente revisión              | soporte liberado de contener un incidente |
| **Esperando proveedor**     | condición `WAITING_EXTERNAL_PROVIDER` vigente                                 | seguir subcaso externo, mantener ownership y comunicación               | transferencia del caso a tercero          |
| **Validación pendiente**    | estado `USER_VALIDATION_PENDING`                                              | obtener confirmación explícita o evidencia equivalente autorizada       | caso cerrado                              |
| **Reabiertos**              | existe reapertura correlacionada o referencia `reopened_from_ref`             | recalcular contexto, impacto, urgencia, prioridad y SLA                 | reescritura del cierre anterior           |
| **Incidentes mayores**      | marca `MAJOR_INCIDENT` vigente                                                | coordinación, línea de tiempo, comunicación y evaluación de continuidad | activación automática de continuidad      |

Una misma fila puede aparecer en más de una vista porque las colas son perspectivas de trabajo, no identidades mutuamente excluyentes.

---

#### 10. Orden operativo predeterminado

Dentro de una cola, el orden se resuelve sin alterar la prioridad del caso:

```text
1. incidente mayor activo con necesidad inmediata de coordinación
2. objetivo SLA ya incumplido
3. umbral preventivo de escalamiento alcanzado
4. prioridad P1 → P2 → P3 → P4
5. siguiente compromiso más próximo
6. momento de reporte más antiguo como desempate
```

Reglas:

- la antigüedad no eleva prioridad;
- el orden visual puede cambiar por riesgo SLA sin reescribir la matriz de impacto y urgencia;
- un caso esperando proveedor puede seguir arriba si mantiene riesgo o comunicación vencida;
- los filtros personales no cambian propiedad, territorio ni autorización;
- una fila fuera de la vista actual no deja de existir ni pierde sus obligaciones.

---

#### 11. Filtros y vistas guardadas

La mesa puede ofrecer filtros por:

- servicio tecnológico;
- clase de caso;
- sede y área cuando correspondan;
- clase de elemento afectado;
- prioridad;
- estado canónico;
- condición de espera;
- propietario actual;
- nivel de atención;
- proveedor relacionado;
- incidente mayor;
- breach o riesgo SLA;
- validación pendiente;
- periodo de reporte.

Una vista guardada es una preferencia de presentación. No concede acceso a casos fuera del alcance del actor ni reemplaza el filtro de autorización de servidor.

---

#### 12. Fila mínima de cola

Cada fila deberá permitir decidir si abrir el caso sin exponer diagnóstico sensible.

Contenido mínimo:

```text
referencia del caso
título humano o síntoma resumido
servicio afectado
sede o alcance permitido
prioridad
estado humano
propietario actual o transferencia pendiente
objetivo SLA vigente y tiempo restante/incumplido
siguiente compromiso o acción
última actualización relevante
```

Contenido que no aparece por defecto en la cola:

- logs completos;
- IP o topología no necesarias;
- secretos;
- credenciales;
- payloads;
- datos personales de terceros;
- hipótesis técnicas no confirmadas;
- capturas sin sanitización.

---

#### 13. Presentación de prioridad

La interfaz conserva cuatro prioridades:

```text
P1_CRITICAL
P2_HIGH
P3_MEDIUM
P4_LOW
```

Presentación recomendada:

```text
P1 · Crítica
P2 · Alta
P3 · Media
P4 · Baja
```

La prioridad nunca se escribe libremente. VISO resuelve primero impacto y urgencia y obtiene el resultado mediante la matriz canónica.

Matriz conservada:

| Impacto / Urgencia | `IMMEDIATE`   | `CURRENT_WINDOW` | `CURRENT_CYCLE` | `PLANNED`   |
| ------------------ | ------------- | ---------------- | --------------- | ----------- |
| `CRITICAL`         | `P1_CRITICAL` | `P1_CRITICAL`    | `P2_HIGH`       | `P3_MEDIUM` |
| `HIGH`             | `P1_CRITICAL` | `P2_HIGH`        | `P2_HIGH`       | `P3_MEDIUM` |
| `MEDIUM`           | `P2_HIGH`     | `P2_HIGH`        | `P3_MEDIUM`     | `P4_LOW`    |
| `LOW`              | `P3_MEDIUM`   | `P3_MEDIUM`      | `P4_LOW`        | `P4_LOW`    |

La ficha de prioridad muestra además:

- impacto resuelto;
- urgencia resuelta;
- razón y evidencia de la última evaluación;
- actor que efectuó la revisión;
- momento de la revisión;
- historial de recalculaciones.

Una reducción de prioridad exige demostrar reducción real de impacto o urgencia y nunca borra un breach previo.

---

#### 14. Uso del color y accesibilidad de prioridad

El color puede reforzar la lectura, pero no será la única señal.

Toda prioridad deberá conservar simultáneamente:

- código `P1` a `P4`;
- nombre humano;
- icono o forma distinguible;
- texto de SLA y siguiente acción.

Un usuario con baja percepción de color deberá poder ordenar y operar la cola sin perder la diferencia de prioridad.

---

#### 15. Presentación de SLA

La mesa no muestra un único contador genérico llamado “SLA”. Presenta el compromiso actualmente relevante y conserva los demás objetivos en detalle.

Objetivos visibles cuando apliquen:

```text
acuse
primera respuesta
restauración o workaround seguro
cumplimiento de solicitud
próxima comunicación
```

Cada objetivo muestra:

- perfil aplicable;
- fecha y hora objetivo;
- calendario y zona horaria aplicables;
- tiempo restante o tiempo excedido;
- estado `en tiempo`, `en riesgo` o `incumplido`;
- pausa estructurada cuando realmente afecte ese objetivo;
- siguiente escalamiento preventivo;
- responsable del próximo compromiso.

El cierre administrativo nunca borra el historial de objetivos.

---

#### 16. Perfiles SLA conservados

| Perfil       | Prioridad     | Acuse            | Primera respuesta | Restauración / workaround                          | Solicitud                                              | Comunicación                                      |
| ------------ | ------------- | ---------------- | ----------------- | -------------------------------------------------- | ------------------------------------------------------ | ------------------------------------------------- |
| `TI-SLA-001` | `P1_CRITICAL` | ≤ 5 min          | ≤ 15 min          | ≤ 60 min                                           | acción preautorizada o plan/autoridad ≤ 60 min         | cada ≤ 30 min                                     |
| `TI-SLA-002` | `P2_HIGH`     | ≤ 15 min         | ≤ 30 min          | ≤ 4 h                                              | ≤ 8 h de ventana o fecha comprometida aceptada         | cada ≤ 60 min                                     |
| `TI-SLA-003` | `P3_MEDIUM`   | ≤ 4 h de ventana | ≤ 8 h de ventana  | ≤ 2 días hábiles de servicio o workaround acordado | ≤ 2 días hábiles o fecha comprometida                  | al menos una vez por día hábil con trabajo activo |
| `TI-SLA-004` | `P4_LOW`      | ≤ 1 día hábil    | ≤ 1 día hábil     | planificada; ordinario ≤ 5 días hábiles            | programación o cumplimiento ordinario ≤ 5 días hábiles | por hito o cambio de fecha                        |

Los tiempos no prometen eliminación de causa raíz. Restauración y resolución definitiva permanecen separadas.

---

#### 17. Riesgo e incumplimiento SLA

La interfaz distingue tres situaciones:

```text
EN TIEMPO
→ el objetivo conserva margen operativo

EN RIESGO
→ se alcanzó el umbral preventivo aplicable

INCUMPLIDO
→ el objetivo venció y debe conservar evidencia de breach
```

Umbrales preventivos conservados:

- P1: 50 % del objetivo de restauración sin estrategia validada;
- P2: 50 % del objetivo de restauración sin diagnóstico o workaround viable;
- P3: 75 % del objetivo vigente sin siguiente acción y propietario;
- P4: fecha comprometida en riesgo o dependencia material modificada.

El banner de incumplimiento no desaparece por bajar prioridad, reasignar o esperar un tercero.

---

#### 18. Condiciones estructuradas de espera

La mesa representa exactamente las cuatro condiciones ya aprobadas:

| Condición                    | Presentación humana                   | Información visible                                                        |
| ---------------------------- | ------------------------------------- | -------------------------------------------------------------------------- |
| `WAITING_REQUESTER_INFO`     | Esperando información del solicitante | pregunta concreta, fecha de solicitud, canal, próximo seguimiento          |
| `WAITING_REQUIRED_APPROVAL`  | Esperando aprobación requerida        | decisión exacta, autoridad, propietario y condición para continuar         |
| `PLANNED_WINDOW_NOT_STARTED` | Trabajo programado                    | ventana aceptada, inicio previsto y prerrequisitos                         |
| `WAITING_EXTERNAL_PROVIDER`  | Esperando proveedor                   | proveedor/subcaso correlacionado, última respuesta y siguiente seguimiento |

La interfaz muestra qué objetivo puede estar pausado y qué obligaciones continúan. En particular, esperar proveedor no elimina ownership interno ni cadencia de comunicación.

---

#### 19. `TI-CASE-WORKSPACE-UX-CONTRACT-001`

Al abrir un caso, VISO presenta un espacio de trabajo único con encabezado persistente y detalle progresivo.

Encabezado mínimo:

```text
referencia del caso
clase de caso
servicio afectado
elemento afectado cuando esté resuelto
sede / alcance
solicitante
prioridad
estado SLA
propietario vigente
estado canónico
siguiente acción o compromiso
```

El encabezado permanece visible al cambiar entre secciones del caso para evitar que diagnóstico, comunicación o evidencia pierdan contexto.

---

#### 20. Composición del espacio de trabajo

La composición lógica usa cinco secciones primarias:

1. **Resumen** — contexto, clasificación, impacto, urgencia, prioridad, SLA, propietario y relaciones;
2. **Comunicación** — mensajes al solicitante, solicitudes de información y compromisos;
3. **Diagnóstico y trabajo** — hipótesis, comprobaciones, workaround, acciones y resultado técnico;
4. **Evidencia** — referencias sanitizadas, adjuntos permitidos y acceso protegido;
5. **Historial** — cambios de estado, prioridad, SLA, asignación, comunicaciones, escalamiento, restauración, validación y cierre.

La separación evita que un comentario técnico se publique accidentalmente al trabajador.

---

#### 21. Ejemplo de espacio de trabajo

```text
┌────────────────────────────────────────────────────────────────────────────┐
│ Caso TEC-…                 P2 · Alta              SLA restauración 01:42   │
│ Aplicación afectada · Sede Centro · Responsable tecnológico               │
│ Estado: En diagnóstico              Próxima actualización: 2:30 p. m.     │
├────────────────────────────────────────────────────────────────────────────┤
│ [ Resumen ] [ Comunicación ] [ Diagnóstico ] [ Evidencia ] [ Historial ]  │
├────────────────────────────────────────────────────────────────────────────┤
│ QUÉ ESTÁ PASANDO                                                         │
│ Síntoma observado …                                                       │
│ Servicio …      Elemento …      Alcance …                                 │
│                                                                            │
│ PRIORIDAD Y SLA                                                           │
│ Impacto: Alto   Urgencia: Ventana actual   Resultado: P2                  │
│ Restauración: 01:42 restantes      Comunicación: vence en 00:28           │
│                                                                            │
│ SIGUIENTE ACCIÓN                                                          │
│ Verificar dependencia …                                                   │
│                                                                            │
│ PROPIEDAD                                                                 │
│ Responsable actual …  Aceptada: …   Nivel de atención …                   │
└────────────────────────────────────────────────────────────────────────────┘
```

Los textos de ejemplo no sustituyen identificadores canónicos ni crean datos reales.

---

#### 22. Triage administrativo

La superficie de triage permite resolver de forma estructurada:

- `SERVICE_REQUEST`, `INCIDENT` o `CONSULTATION` cuando el caso permanece en `VPROC-0058`;
- servicio afectado;
- elemento afectado cuando exista evidencia suficiente;
- impacto;
- urgencia;
- prioridad derivada;
- perfil SLA derivado;
- necesidad de incidente mayor;
- nivel de atención requerido;
- handoff de acceso, problema o cambio cuando aplique.

Reglas de interacción:

1. no se presenta un campo libre de prioridad final;
2. impacto y urgencia muestran criterios y evidencia, no solo un selector;
3. si el servicio o elemento no puede resolverse, se conserva como no resuelto durante triage en vez de inventarlo;
4. clasificación de acceso produce handoff a `VPROC-0059` y no crea el ciclo de acceso dentro del caso tecnológico;
5. problema candidato y cambio requerido conservan vínculos separados;
6. la información ya disponible desde ANIMA, contexto o grafo no se vuelve a digitar sin necesidad.

---

#### 23. Asignación, aceptación y reasignación

La experiencia distingue:

```text
PROPONER ASIGNACIÓN
≠
ACEPTAR ASIGNACIÓN
≠
TRANSFERIR RESPONSABILIDAD EFECTIVA
```

Toda asignación visible conserva:

- propietario anterior;
- destinatario o función propuesta;
- motivo;
- momento;
- pendientes;
- evidencia relevante;
- fecha objetivo;
- `accepted_at` cuando la transferencia sea aceptada.

Hasta la aceptación, la interfaz no presenta al propietario anterior como liberado de responsabilidad.

Una reasignación:

- no crea otro caso;
- no reinicia SLA;
- no borra breach;
- no amplía autorización;
- conserva historial;
- requiere que la persona receptora vea contexto suficiente para aceptar de forma informada.

---

#### 24. Asignación frente a autorización

La interfaz deberá poder mostrar simultáneamente:

```text
CASO ASIGNADO
+
ACCIÓN NO AUTORIZADA SOBRE EL RECURSO
```

Asignar un caso no concede:

- privilegio;
- acceso remoto;
- lectura de logs sensibles;
- administración de cuentas;
- modificación de configuración;
- aprobación de cambio;
- acceso a secretos.

Cuando una acción esté bloqueada por autorización, la mesa explica la condición y conserva el caso en propiedad del responsable correspondiente.

---

#### 25. Escalamiento

La mesa expone las cinco clases aprobadas:

| Clase            | Presentación                | Resultado UX                                                    |
| ---------------- | --------------------------- | --------------------------------------------------------------- |
| `ESC_FUNCTIONAL` | Requiere decisión funcional | incorporar responsable funcional sin perder owner tecnológico   |
| `ESC_TECHNICAL`  | Requiere especialista       | transferir a nivel técnico superior con aceptación y contexto   |
| `ESC_PROVIDER`   | Requiere proveedor          | crear o vincular subcaso externo manteniendo caso maestro VENTO |
| `ESC_SECURITY`   | Requiere seguridad          | restringir detalle y activar responsable/controles de seguridad |
| `ESC_CONTINUITY` | Evaluar continuidad         | mostrar evaluación y vínculo eventual sin fusionar expedientes  |

Escalar es una acción explícita. No se infiere únicamente por tiempo transcurrido, cargo del solicitante o número de mensajes.

---

#### 26. Comunicación al solicitante

La sección `Comunicación` separa al menos:

```text
MENSAJE AL SOLICITANTE
≠
NOTA INTERNA DE DIAGNÓSTICO
≠
COMUNICACIÓN A PROVEEDOR
```

Antes de enviar un mensaje al solicitante, VISO muestra la proyección exacta que será visible en ANIMA.

La comunicación externa deberá responder, cuando aplique:

1. qué se sabe;
2. qué está afectado;
3. qué funciona;
4. qué acción segura debe realizar o evitar la persona;
5. quién responde;
6. cuándo será la siguiente actualización o compromiso;
7. si existe workaround;
8. cuándo se solicita validación;
9. qué quedó cerrado y qué continúa pendiente.

El formulario favorece contenido estructurado y breve sin impedir una explicación humana adicional.

---

#### 27. Nota interna y diagnóstico restringido

La nota interna puede conservar hipótesis y contexto técnico únicamente para actores autorizados.

No se proyecta automáticamente hacia ANIMA ni hacia proveedor.

La mesa no muestra por defecto:

- contraseñas;
- tokens;
- secretos;
- cookies o materiales de sesión;
- IP o topología innecesarias;
- logs completos;
- datos personales de terceros;
- payloads sensibles;
- hipótesis como causa confirmada.

Una vista técnica ampliada sigue sometida a finalidad, recurso, permiso, alcance y segregación; estar asignado al caso no basta.

---

#### 28. Evidencia

La sección `Evidencia` presenta referencias y metadatos antes que contenido sensible.

Cada elemento debe poder mostrar, según aplique:

- tipo;
- origen;
- fecha;
- actor o principal técnico;
- clasificación;
- recurso relacionado;
- estado de sanitización;
- acceso autorizado o expirado;
- relación con diagnóstico, restauración o decisión.

Una captura, log o adjunto no se convierte en verdad del caso por existir. La interfaz distingue evidencia aportada, comprobación técnica e hipótesis.

---

#### 29. Diagnóstico y trabajo

El panel técnico conserva la secuencia real del trabajo sin forzar una falsa causa definitiva:

```text
síntoma
→ hipótesis
→ comprobación
→ resultado
→ siguiente hipótesis o acción
→ workaround cuando aplique
→ restauración o cumplimiento
```

Debe ser posible registrar `UNKNOWN` como causa después de restaurar cuando la causa raíz todavía no esté demostrada y exista el handoff correspondiente.

Diagnóstico no autoriza cambio. Si la solución exige cambio no preautorizado, el caso conserva el origen y se vincula con el gobierno de cambio correspondiente.

---

#### 30. Workaround

Cuando exista workaround, VISO muestra de forma separada:

- acción temporal;
- alcance;
- actor o población aplicable;
- fecha de aplicación;
- vigencia;
- riesgos o limitaciones;
- evidencia de que funciona;
- responsable de retirarlo o revisarlo;
- problema o cambio relacionado cuando corresponda.

El badge `Workaround aplicado` nunca se presenta como `Causa resuelta`.

---

#### 31. Restauración y cumplimiento

La mesa exige una acción explícita y evidenciada para declarar:

- restauración de incidente; o
- fulfillment de solicitud.

Al registrar el resultado debe quedar visible:

```text
qué resultado volvió a estar disponible o fue entregado
qué evidencia lo demuestra
qué workaround continúa vigente
qué dependencia permanece pendiente
qué actor puede validar
qué queda abierto después de restaurar
```

La interfaz no ofrece una equivalencia automática entre `resolved` legacy y restauración canónica.

---

#### 32. Validación del solicitante

Después de restauración o cumplimiento, el caso entra en:

```text
VPROC-0058.USER_VALIDATION_PENDING
```

VISO muestra:

- quién debe validar;
- cuándo se solicitó;
- qué resultado se pide comprobar;
- respuesta recibida desde ANIMA u otro canal autorizado;
- evidencia asociada;
- siguiente acción.

Resultados:

```text
VALIDACIÓN POSITIVA
→ continúa hacia conocimiento y cierre

VALIDACIÓN NEGATIVA
→ regresa a RESOLUTION_IN_PROGRESS

SIN RESPUESTA
→ permanece pendiente; no se convierte en aceptación
```

Cuando el solicitante no pueda validar, una validación equivalente exige actor autorizado, fundamento y evidencia. La verificación de proveedor no sustituye la validación VENTO.

---

#### 33. Cierre

El control de cierre se presenta como una verificación de condiciones, no como un botón genérico de finalización.

Antes de habilitar el cierre, VISO comprueba visualmente:

- restauración o fulfillment comprobados;
- validación aceptada o equivalente autorizada;
- prioridad y SLA final registrados;
- comunicaciones requeridas emitidas;
- acciones técnicas y cambios relacionados registrados;
- problema relacionado cuando corresponda;
- conocimiento capturado o excepción justificada;
- pendientes transferidos y aceptados;
- evidencia referenciada;
- actor, tiempo y código de cierre;
- segregación adicional cuando sea un caso protegido o incidente mayor.

Si falta una condición, la interfaz explica exactamente cuál falta y quién puede resolverla.

---

#### 34. Reapertura

La experiencia de reapertura conserva el cierre anterior inmutable.

VISO muestra:

- referencia al expediente cerrado;
- motivo actual;
- nuevo contexto;
- nuevo impacto;
- nueva urgencia;
- prioridad recalculada;
- SLA actual;
- relación con problema si existe recurrencia.

La reapertura no reutiliza silenciosamente el SLA anterior ni transforma una validación negativa previa al cierre en `REOPEN`.

---

#### 35. Presentación de los nueve estados canónicos

| Estado canónico             | Etiqueta administrativa principal | Acción que debe quedar clara                    |
| --------------------------- | --------------------------------- | ----------------------------------------------- |
| `TECH_CASE_REPORTED`        | Reportado                         | iniciar triage                                  |
| `TRIAGE_IN_PROGRESS`        | En clasificación                  | completar contexto, impacto y urgencia          |
| `PRIORITIZED`               | Priorizado                        | aceptar owner e iniciar diagnóstico             |
| `DIAGNOSIS_IN_PROGRESS`     | En diagnóstico                    | comprobar hipótesis y definir acción segura     |
| `WORKAROUND_APPLIED`        | Operando con workaround           | verificar estabilidad y continuar resolución    |
| `RESOLUTION_IN_PROGRESS`    | En resolución                     | ejecutar o coordinar solución/restauración      |
| `USER_VALIDATION_PENDING`   | Esperando validación              | obtener confirmación explícita                  |
| `KNOWLEDGE_CAPTURE_PENDING` | Documentando solución             | registrar conocimiento o excepción justificada  |
| `TECH_CASE_CLOSED`          | Cerrado                           | solo consulta, auditoría o reapertura vinculada |

El código canónico puede aparecer como metadato secundario para soporte avanzado, pero la acción principal se expresa en lenguaje operativo.

---

#### 36. Incidente mayor

Un caso marcado `MAJOR_INCIDENT` incorpora una superficie de coordinación sin crear otro proceso.

Cabecera mínima:

```text
referencia
inicio
servicios afectados
alcance empresarial afectado
estado actual
workaround
próxima actualización
coordinador
estado de evaluación de continuidad
estado de restauración
```

La vista añade:

- línea de tiempo visible;
- cadencia de comunicación;
- responsables activos;
- escalamiento preventivo;
- dependencias críticas;
- vínculo con cambio de emergencia cuando corresponda;
- estado de evaluación de continuidad.

La prioridad o condición de incidente mayor no concede acceso adicional a información sensible.

---

#### 37. Notificaciones y compromisos

VISO presenta el próximo compromiso del caso como dato operativo de primera clase.

Ejemplos:

```text
Responder antes de 14:30
Actualizar al solicitante antes de 15:00
Revisar respuesta del proveedor a las 16:00
Solicitar validación después de la prueba
Escalar si no existe estrategia antes del umbral
```

La notificación es transporte. La política del caso conserva destinatario, contenido, obligatoriedad y cadencia.

El preview externo usa contexto mínimo y no incluye diagnóstico restringido.

---

#### 38. Comportamiento ante datos desactualizados o dependencia no disponible

La mesa no permite que una vista desactualizada produzca una mutación silenciosa.

Cuando el estado de servidor no pueda confirmarse:

- se muestra la hora del último estado confirmado;
- se diferencia `información desactualizada` de `caso sin cambios`;
- una acción protegida exige refrescar y revalidar contexto antes de continuar;
- no se inventa un estado local como fuente autoritativa;
- no se declara prioridad, restauración, validación o cierre desde una copia no reconciliada;
- un fallo de red no se interpreta automáticamente como operación no ejecutada.

La implementación física de reintentos, receipts o persistencia pertenece al paquete técnico que materialice la mesa.

---

#### 39. Navegación y densidad administrativa

La mesa de servicio pertenece al carril `ADMINISTRATIVE_WORK` y puede utilizar mayor densidad que el portal personal de ANIMA, pero mantiene jerarquía visual clara.

Principios:

1. la cola responde primero qué requiere atención;
2. el encabezado del caso responde qué está ocurriendo y cuál es la próxima acción;
3. el detalle técnico se abre solo cuando es necesario;
4. la autorización no se deduce de que un panel esté visible;
5. filtros y vistas guardadas no fabrican alcance;
6. acciones excepcionales permanecen fuera de la acción ordinaria;
7. estado, prioridad y SLA se expresan con texto además de color;
8. las acciones críticas exigen confirmación proporcional al efecto;
9. los bloqueos explican causa segura, responsable y condición de salida;
10. el diseño evita pedir de nuevo información ya resuelta por fuentes canónicas.

---

#### 40. Separación de funciones gerenciales heredadas de ANIMA

La experiencia objetivo de `TI-UX-001` separó las acciones gerenciales `Enviar aviso` y `Conversación` del portal personal del trabajador.

`TI-UX-002` fija su destino conceptual:

- la comunicación iniciada por soporte o coordinación se realiza desde el contexto de un caso, incidente mayor o comunicación administrativa autorizada;
- contactar a un trabajador no crea por sí solo un caso tecnológico exitoso;
- una conversación administrativa no adquiere prioridad o SLA hasta que exista un caso clasificado que lo requiera;
- comunicación masiva de un incidente se gobierna desde la coordinación del incidente, no desde un chat personal improvisado;
- el destinatario se limita por autorización, caso y territorio.

La implementación no elimina todavía controles existentes de ANIMA; esa transición física queda fuera de esta fase.

---

#### 41. `TI-SERVICE-DESK-UX-RECONCILIATION-001`

| Componente                      | Estado AS-IS                                                      | Estado objetivo                           | Decisión de esta tarea                                       |
| ------------------------------- | ----------------------------------------------------------------- | ----------------------------------------- | ------------------------------------------------------------ |
| canal de reporte del trabajador | existe en ANIMA                                                   | conservar                                 | `TI-UX-001` permanece propietario de la experiencia personal |
| caso tecnológico completo       | modelo documental definido; implementación completa no demostrada | expediente único VISO                     | espacio de trabajo administrativo especificado               |
| colas administrativas           | no demostradas integralmente                                      | diez vistas derivadas                     | matriz materializada sin crear estados nuevos                |
| prioridad                       | no materializada en ticket básico                                 | 4 niveles derivados                       | matriz exacta consumida y presentación definida              |
| SLA                             | no materializado en ticket básico                                 | 4 perfiles y objetivos múltiples          | presentación, riesgo, breach y compromiso definidos          |
| asignación                      | campo básico observado                                            | transferencia con aceptación e historial  | UX de propiedad y reasignación definida                      |
| mensajería                      | existente                                                         | canal separado del estado                 | comunicación externa, nota interna y proveedor separados     |
| diagnóstico                     | no probado como ciclo completo VISO                               | panel restringido y trazable              | contrato de interacción definido                             |
| restauración                    | `resolved` legacy insuficiente                                    | evidencia explícita                       | acción y resultado diferenciados                             |
| validación                      | no materializada en ticket básico                                 | `USER_VALIDATION_PENDING`                 | interacción VISO↔ANIMA definida                              |
| cierre                          | `closed` legacy insuficiente                                      | checklist canónico                        | condiciones y segregación visibles                           |
| reapertura                      | no demostrada como ciclo completo                                 | expediente vinculado, historial inmutable | presentación definida                                        |
| incidente mayor                 | no demostrado como superficie completa                            | coordinación y timeline                   | superficie conceptual definida                               |
| evidencia sensible              | controles transversales documentados                              | detalle progresivo autorizado             | proyección segura definida                                   |

---

#### 42. Lo que no cambia en esta tarea

No se modifica:

- la identidad de `VPROC-0058`;
- la definición de solicitud, incidente o consulta;
- la matriz de impacto y urgencia;
- la matriz de prioridad;
- los tiempos SLA;
- las condiciones de pausa;
- las clases de escalamiento;
- los nueve estados canónicos;
- las reglas de cierre y reapertura;
- la propiedad de ANIMA sobre el portal personal;
- la propiedad de VISO sobre el caso;
- la propiedad de NEXO sobre activos físicos;
- la propiedad de otros procesos sobre acceso, problema, cambio o continuidad;
- los controles de autorización y evidencia aprobados.

La tarea define cómo esas decisiones se presentan y operan en la experiencia administrativa.

---

#### 43. Fronteras con las siguientes tareas

| Tema                                                                 | Propietario | Límite de TI-UX-002                                                                      |
| -------------------------------------------------------------------- | ----------- | ---------------------------------------------------------------------------------------- |
| mapa visual de dispositivos, redes, impresoras, aplicaciones y salud | `TI-UX-003` | la mesa solo muestra referencias del elemento afectado                                   |
| flujo completo de problema, cambio, mantenimiento y recuperación     | `TI-UX-004` | la mesa presenta handoffs y relaciones, no diseña esas experiencias completas            |
| proveedores, licencias, contratos, renovaciones y costos             | `TI-UX-005` | la mesa puede mostrar proveedor relacionado, no administra su ciclo comercial            |
| diagnóstico guiado, conocimiento y capacitación contextual           | `TI-UX-006` | la mesa captura conocimiento y puede referenciar guía, no diseña su experiencia completa |

Ninguna de estas tareas se inicia desde TI-UX-002.

---

#### 44. Pendientes físicos con propietario y condición de salida

| Pendiente físico                                                          | Bloqueo concreto                                                            | Propietario o destino exacto                                                                        | Condición de salida                                                         |
| ------------------------------------------------------------------------- | --------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------- |
| identidad física de navegación y registro en inventario de pantallas VISO | la fase actual no autoriza implementación ni alta física de superficie      | `NEXO-REMISSIONS-001::CONDITIONAL_IMPLEMENTATION_SCOPE` y paquete E5 VISO que resulte autorizado    | alcance físico aprobado y superficie registrada antes de implementación     |
| materialización de campos de caso, estados, SLA, validación y relaciones  | `support_tickets` AS-IS no demuestra el contrato completo                   | paquete de implementación VISO/Supabase gobernado desde `vento-shell` cuando el alcance lo autorice | modelo físico compatible, transición determinista y pruebas aprobadas       |
| desacoplar mensajería de cambio de estado                                 | comportamiento legacy conserva acoplamiento en el flujo observado           | paquete E5 ANIMA/VISO cuando sea incluido por el alcance de implementación                          | enviar mensaje no muta estado empresarial y existe regresión comprobada     |
| retirar cierre canónico desde experiencia personal                        | ANIMA legacy puede marcar conversación `closed` y `resolved_at`             | paquete E5 ANIMA/VISO + autorización de servidor                                                    | cerrar conversación queda separado de validar y cerrar el caso              |
| evidencia histórica de cumplimiento SLA                                   | no existe ejecución histórica probada del modelo objetivo                   | `TI-DOM-010` + paquete E5 VISO                                                                      | instrumentación y datos reales permiten calcular los SLI aprobados          |
| calendario real de cobertura humana por servicio y sede                   | la disponibilidad operativa real no está materializada de extremo a extremo | `TI-DOM-012` para soporte contratado + operación VISO para calendario interno                       | cada servicio referencia una ventana vigente sin reducir obligaciones P1/A0 |

La existencia de estos pendientes no rebaja el contrato documental definido en esta tarea.

---

#### 45. Estado de materialización

| Resultado                                | Estado                                                    |
| ---------------------------------------- | --------------------------------------------------------- |
| contrato UX de mesa de servicio VISO     | `ESPECIFICADO`                                            |
| matriz de diez vistas de cola            | `ESPECIFICADO`                                            |
| orden operativo de cola                  | `ESPECIFICADO`                                            |
| presentación de prioridad                | `ESPECIFICADO`                                            |
| presentación de cuatro perfiles SLA      | `ESPECIFICADO`                                            |
| riesgo, breach y escalamiento preventivo | `ESPECIFICADO`                                            |
| asignación, aceptación y reasignación    | `ESPECIFICADO`                                            |
| workspace único de caso                  | `ESPECIFICADO`                                            |
| comunicación externa vs nota interna     | `ESPECIFICADO`                                            |
| diagnóstico y evidencia restringidos     | `ESPECIFICADO`                                            |
| restauración y fulfillment               | `ESPECIFICADO`                                            |
| validación VISO↔ANIMA                    | `ESPECIFICADO`                                            |
| cierre y reapertura                      | `ESPECIFICADO`                                            |
| coordinación de incidente mayor          | `ESPECIFICADO`                                            |
| reconciliación AS-IS→objetivo            | `ESPECIFICADO`                                            |
| implementación física VISO               | `FUERA_DE_ALCANCE`                                        |
| cambios Supabase                         | `FUERA_DE_ALCANCE`                                        |
| validación operativa con casos reales    | `FUERA_DE_ALCANCE`                                        |
| evidencia histórica de SLA               | `PENDIENTE_DE_EVIDENCIA` — `TI-DOM-010` + paquete E5 VISO |

---

#### 46. Invariantes

1. VISO conserva el caso tecnológico; ANIMA conserva el portal personal.
2. `VPROC-0058` mantiene una sola identidad de caso.
3. una cola no es un estado.
4. una vista guardada no concede autorización.
5. un filtro no cambia territorio ni propiedad.
6. antigüedad no equivale a prioridad.
7. prioridad se deriva de impacto y urgencia.
8. prioridad no equivale a criticidad del servicio.
9. prioridad no equivale a nivel L0-L3.
10. prioridad alta no concede privilegios.
11. SLA no es un único reloj genérico.
12. acuse no detiene el objetivo de primera respuesta.
13. primera respuesta no detiene restauración o fulfillment.
14. esperar proveedor no elimina ownership ni comunicación.
15. breach no se borra por reclasificar o reasignar.
16. asignación no equivale a autorización.
17. transferencia sin aceptación no libera al propietario anterior.
18. reasignación no crea otro caso.
19. mensaje no cambia estado empresarial por sí solo.
20. nota interna no se publica al trabajador.
21. proveedor no recibe el expediente completo por defecto.
22. diagnóstico no autoriza cambio.
23. workaround no equivale a causa eliminada.
24. restauración no equivale a cierre.
25. `resolved` legacy no equivale a restauración validada.
26. `closed` legacy no equivale a `TECH_CASE_CLOSED`.
27. validación negativa regresa a resolución.
28. silencio no equivale a aceptación.
29. proveedor no valida por VENTO.
30. cierre exige pendientes transferidos y aceptados.
31. cierre protegido conserva segregación aplicable.
32. reapertura no reescribe el cierre anterior.
33. incidente mayor no equivale automáticamente a continuidad.
34. color no es la única señal de prioridad o riesgo.
35. logs y secretos no aparecen por defecto en la cola.
36. un estado desactualizado no autoriza mutaciones silenciosas.
37. esta tarea no modifica código, datos ni Supabase.
38. `TI-UX-003` permanece únicamente reservada.

---

#### 47. Cobertura de prueba consumida

La tarea consume cobertura vigente que ya protege:

- el expediente completo de mesa de servicio, su clasificación y sus estados;
- la matriz exacta de impacto, urgencia y prioridad;
- los cuatro perfiles SLA, reloj, calendarios, pausas y escalamiento preventivo;
- la separación entre restauración, validación y cierre;
- la experiencia personal segura de ANIMA;
- autorización territorial y por recurso;
- segregación de funciones para decisiones protegidas;
- protección de diagnóstico, logs, secretos, capturas y datos personales;
- comunicación, notificaciones y evidencia;
- operación frente a estado desconocido o conectividad degradada;
- experiencia administrativa, lenguaje humano y divulgación progresiva.

Entre las coberturas vigentes se encuentran `TREQ-VISO-002`, `TREQ-VISO-046`, `TREQ-ANIMA-022` y los requisitos transversales de autorización y experiencia que ya gobiernan estas superficies.

La tarea especializa la presentación y operación administrativa de obligaciones existentes sin cambiar la regla protegida.

---

#### 48. Requisitos de prueba derivados

**Resultado:** NO GENERA REQUISITOS DE PRUEBA

**Justificación:** las conductas verificables de cola, clasificación, prioridad derivada, compromisos temporales, asignación, escalamiento, comunicación, restauración, validación, cierre, seguridad y experiencia administrativa ya están protegidas por el registro canónico vigente. Esta tarea materializa su diseño de experiencia en VISO sin crear un nuevo proceso, estado, regla empresarial, mecanismo de autorización, integración física o comportamiento ejecutable adicional.

**Balance:** 0 creados; 0 modificados; 0 diferidos; 0 descartados; 0 obsoletos.

---

#### 49. Criterios de aceptación

- [x] la continuidad vigente es `TI-UX-001 → TI-UX-002 → TI-UX-003`;
- [x] la tarea permanece exclusivamente documental;
- [x] VISO conserva el caso tecnológico y ANIMA el portal personal;
- [x] no se crea aplicación, proceso ni máquina de estados nueva;
- [x] se materializan cuatro artefactos documentales de UX;
- [x] se materializan exactamente diez vistas de cola;
- [x] las colas quedan definidas como vistas derivadas y no como estados;
- [x] se define un orden operativo reproducible sin alterar prioridad;
- [x] filtros y vistas guardadas no amplían autorización;
- [x] cada fila de cola muestra prioridad, SLA, owner y siguiente acción sin exponer diagnóstico sensible;
- [x] se conservan exactamente cuatro prioridades;
- [x] se conserva la matriz completa de 16 combinaciones impacto × urgencia;
- [x] la prioridad final no puede escribirse libremente;
- [x] se conservan exactamente cuatro perfiles SLA;
- [x] se distinguen acuse, primera respuesta, restauración/fulfillment y comunicación;
- [x] se muestran estado en tiempo, riesgo e incumplimiento;
- [x] se conservan los umbrales preventivos por prioridad;
- [x] se representan las cuatro condiciones estructuradas de espera;
- [x] esperar proveedor no elimina ownership ni comunicación;
- [x] se diseña un único espacio de trabajo de caso;
- [x] el encabezado del caso conserva contexto, owner, prioridad, SLA y siguiente acción;
- [x] triage separa clasificación, impacto, urgencia y prioridad;
- [x] se conservan los handoffs de acceso, problema y cambio;
- [x] asignación y aceptación quedan separadas;
- [x] transferencia sin aceptación no libera al propietario anterior;
- [x] asignación no amplía permisos;
- [x] se representan las cinco clases de escalamiento;
- [x] comunicación externa, nota interna y proveedor quedan separadas;
- [x] la proyección hacia ANIMA puede previsualizarse antes de enviar;
- [x] diagnóstico sensible se mantiene detrás de autorización;
- [x] evidencia se presenta mediante referencias y metadatos seguros;
- [x] workaround se distingue de causa eliminada;
- [x] restauración se distingue de cierre;
- [x] validación positiva, negativa y ausencia de respuesta quedan diferenciadas;
- [x] silencio no equivale a aceptación;
- [x] cierre se presenta como checklist de condiciones y no como acción genérica;
- [x] reapertura preserva historial inmutable;
- [x] se representan los nueve estados canónicos;
- [x] incidente mayor dispone de coordinación y timeline sin fusionarse con continuidad;
- [x] prioridad y riesgo no dependen únicamente de color;
- [x] un estado desactualizado no autoriza mutaciones silenciosas;
- [x] se materializa la reconciliación AS-IS→objetivo;
- [x] todos los pendientes físicos tienen propietario/destino y condición de salida;
- [x] se crean cero requisitos de prueba y se modifican cero existentes;
- [x] no se modifica código, Supabase, permisos, datos ni navegación desplegada;
- [x] `TI-UX-003` permanece únicamente reservada.

---

#### 50. Continuidad

ÚLTIMA TAREA APROBADA
`TI-UX-001 — Diseñar portal simple de soporte para trabajadores dentro de ANIMA`

TAREA ACTUAL APROBADA
`TI-UX-002 — Diseñar mesa de servicio de VISO con colas, prioridad, SLA, asignación, comunicación y validación`

SIGUIENTE TAREA RESERVADA
`TI-UX-003 — Diseñar mapa de dispositivos, redes, impresoras, aplicaciones y salud técnica`


### ✅ TI-UX-003 — Diseñar mapa de dispositivos, redes, impresoras, aplicaciones y salud técnica

**Estado:** APROBADA  
**Tarea anterior:** `TI-UX-002 — Diseñar mesa de servicio de VISO con colas, prioridad, SLA, asignación, comunicación y validación` — APROBADA  
**Tarea siguiente:** `TI-UX-004 — Diseñar flujos de incidente, problema, cambio, mantenimiento y recuperación` — RESERVADA  
**Tipo de tarea:** documental; diseño normativo y materializado de la experiencia administrativa de VISO para consultar el mapa tecnológico federado, sus dependencias, salud técnica, frescura de evidencia y brechas de observación sin crear una fuente de verdad paralela ni una consola de configuración  
**Repositorio propietario:** `vento-shell`  
**Archivo propietario:** `docs/plan-canonico/modular/bloques/Z_TECNOLOGIA_Y_SOPORTE/03_EXPERIENCIA_DE_SOPORTE_Y_OPERACION_TI.md`  
**Aplicación objetivo:** VISO  
**Cambios físicos autorizados:** ninguno; no crea ni modifica rutas, componentes, código, tablas, vistas, RLS, RPC, funciones, triggers, Edge Functions, migraciones, datos, dispositivos, redes, impresoras, aplicaciones, telemetría, alertas, integraciones, permisos ni configuración de Supabase  
**Requisitos de prueba creados o modificados:** 0

**Qué se hace:** materializar cómo VISO deberá presentar un mapa técnico explicable de dispositivos, endpoints, redes, impresoras, aplicaciones y servicios a partir de las identidades y relaciones canónicas existentes; separar salud de condición física, configuración, disponibilidad y evidencia; hacer visible cuándo la información es desconocida o está obsoleta; permitir navegar dependencias e impacto sin inferir causalidad; y conectar el mapa con la mesa de servicio sin absorber los flujos de incidente, problema, cambio, mantenimiento, licencias o diagnóstico guiado que pertenecen a tareas posteriores.

---

#### 1. Propósito

VISO deberá permitir que una persona autorizada para soporte responda, sin reconstruir manualmente información distribuida entre múltiples fuentes:

```text
¿QUÉ ELEMENTOS TECNOLÓGICOS CONOCE VENTO?
¿DÓNDE ESTÁN Y A QUÉ SERVICIOS CONTRIBUYEN?
¿QUÉ DEPENDE DE QUÉ?
¿QUÉ SALUD TIENE CADA CAPACIDAD Y CON QUÉ EVIDENCIA?
¿QUÉ INFORMACIÓN ESTÁ FRESCA, RETRASADA, OBSOLETA O AUSENTE?
¿QUÉ SERVICIOS PUEDEN ESTAR AFECTADOS POR UNA CONDICIÓN OBSERVADA?
¿QUÉ CASOS, ALERTAS O CAMBIOS YA ESTÁN CORRELACIONADOS?
¿QUÉ SE DESCONOCE TODAVÍA?
```

El resultado no será una CMDB paralela, una tabla maestra nueva ni una pantalla que decida causalidad. Será una proyección administrativa federada de identidades, relaciones y señales cuyas autoridades ya están distribuidas entre NEXO, SHELL, PRINT-ARC, VISO y los contratos tecnológicos aprobados.

---

#### 2. Resultado sustantivo

Se materializa el diseño del mapa técnico con el siguiente balance:

| Elemento                                                 |    Resultado |
| -------------------------------------------------------- | -----------: |
| Aplicación administrativa propietaria de la experiencia  | **1 — VISO** |
| Modos primarios de presentación                          |        **4** |
| Clases de configuración preservadas                      |   **7 de 7** |
| Relaciones directas tipadas preservadas                  | **15 de 15** |
| Estados de salud preservados                             |   **5 de 5** |
| Servicios tecnológicos proyectados                       | **11 de 11** |
| Subtipos de recurso de red proyectados                   |   **7 de 7** |
| Impresoras con decisión explícita de presentación        |   **9 de 9** |
| Aplicaciones con decisión explícita de presentación      | **10 de 10** |
| Dispositivos compartidos AS-IS reconciliados             |   **2 de 2** |
| Vínculos AS-IS dispositivo–aplicación reconciliados      |   **4 de 4** |
| Instancias de red AS-IS declaradas `VALIDADO`            |        **0** |
| Relaciones impresora–activo físico declaradas `VALIDADO` |        **0** |
| Cambios físicos                                          |        **0** |
| Requisitos de prueba nuevos o modificados                |        **0** |

Los cuatro modos primarios son:

1. **Resumen de salud**;
2. **Mapa de dependencias**;
3. **Inventario técnico**;
4. **Evidencia y desconocidos**.

El detalle de un elemento es un drill-down contextual desde cualquiera de esos modos y no constituye una quinta fuente de verdad.

---

#### 3. Entradas y autoridades conservadas

La tarea consume y preserva sin redefinir:

- `TI-DOM-002` y las siete clases `ASSET`, `ENDPOINT`, `SHARED_DEVICE`, `NETWORK_RESOURCE`, `PRINTER`, `APPLICATION` y `TECH_SERVICE`;
- `TI-DOM-002` y las quince relaciones directas `TI-REL-001` a `TI-REL-015`;
- `TI-DOM-003`, incluidos lifecycle, baseline, postura, estado deseado, estado observado, evidencia y frescura de endpoints;
- `TI-DOM-004`, incluidos los siete subtipos de red, las seis capas de arquitectura, segmentación, direccionamiento, contingencia y handoff a observabilidad;
- `TI-DOM-005`, incluidas las nueve identidades `PRN-*`, su condición física, bindings, canal, cola, adaptador, routing, fallback y separación frente a health y resultado de impresión;
- `TI-DOM-006`, incluidas las diez aplicaciones canónicas, ambientes, dependencias, proveedores técnicos y separación entre catálogo activo, despliegue, salud, disponibilidad empresarial y autorización;
- `TI-DOM-010`, incluidos señal, observación, frescura, los cinco estados de salud y la separación entre señal, alerta, incidente, problema y cambio;
- `TI-AUTH-003`, respecto de consulta frente a mutación de configuración protegida;
- `TI-AUTH-004`, respecto de logs, diagnósticos, IP, topología sensible, exportaciones, capturas, secretos y datos personales;
- `TI-UX-002`, respecto de mesa de servicio, caso tecnológico y referencia del elemento afectado;
- `TREQ-VISO-002`, `TREQ-NEXO-019`, `TREQ-PROC-457`, `TREQ-PROC-461` a `TREQ-PROC-500`, `TREQ-UX-003`, `TREQ-UX-005` y `TREQ-UX-010` como cobertura verificable vigente.

No se reasigna propiedad de datos. El mapa consulta y compone referencias; no se convierte en maestro de activos, configuración, impresoras, aplicaciones, servicios, alertas o casos.

---

#### 4. Decisiones rectoras

1. **VISO presenta; las fuentes propietarias mandan.** El mapa nunca conserva una copia editable de un dato solo para poder visualizarlo.
2. **La identidad se conserva por clase.** `ASSET`, `ENDPOINT`, `SHARED_DEVICE`, `NETWORK_RESOURCE`, `PRINTER`, `APPLICATION` y `TECH_SERVICE` no se fusionan en un objeto genérico que pierda semántica.
3. **Una relación visible requiere relación canónica o una derivación declarada.** Coincidencia de nombre, IP, MAC, serial, sede, URL o tiempo no crea un vínculo.
4. **Salud no es condición física, lifecycle, posture, configuración, disponibilidad empresarial ni autorización.** Cada dimensión se presenta por separado.
5. **`UNKNOWN` es un estado material.** No se pinta como verde, no desaparece del resumen y no se interpreta como ausencia de problema.
6. **La evidencia tiene edad.** Toda salud visible debe declarar fuente y frescura suficiente para que el operador sepa si está viendo el presente o una observación vencida.
7. **Componente y servicio no heredan salud mecánicamente.** La salud del servicio debe explicar dependencia, redundancia, alcance e impacto.
8. **El mapa no diagnostica causa por correlación visual.** Un camino de dependencia indica posibilidad de afectación, no causalidad confirmada.
9. **El mapa no cambia configuración.** Toda mutación protegida requiere el gobierno de `TI-AUTH-003` y el cambio válido de `TI-DOM-009` cuando corresponda.
10. **El mapa no abre privilegio.** Ver un recurso no concede soporte remoto, consola, log sensible, secreto o acción administrativa.
11. **La mesa de servicio y el mapa se enlazan.** Un caso puede referenciar el elemento afectado y el mapa puede mostrar casos relacionados sin duplicar expediente.
12. **No se crea una ruta física en esta fase.** La experiencia, navegación conceptual y comportamiento quedan definidos; la ruta concreta se materializará únicamente dentro de un alcance de implementación autorizado.

---

#### 5. Unidad visual mínima

Todo nodo mostrado deberá conservar, cuando exista en su fuente:

```text
CLASE CANÓNICA
+
IDENTIDAD CANÓNICA
+
ETIQUETA HUMANA
+
FUENTE PROPIETARIA
+
SEDE / ÁREA CUANDO APLIQUE
+
ESTADO DE RECONCILIACIÓN
+
SALUD TÉCNICA CUANDO EXISTA EVIDENCIA
+
FRESCURA DE LA EVIDENCIA
+
RELACIONES DIRECTAS
+
SERVICIOS RELACIONADOS
+
REFERENCIAS A ALERTAS / CASOS / CAMBIOS CUANDO EXISTAN
```

Una tarjeta nunca deberá colapsar en una sola etiqueta de “activo/inactivo”.

Ejemplo conceptual:

```text
Impresora cocina
PRINTER · PRN-VC-COCINA-DIGE200I-01

Condición física: OPERATIVA
Salud técnica: UNKNOWN
Evidencia runtime: no demostrada como vigente
Vínculo con activo NEXO: PENDIENTE_DE_EVIDENCIA
Red relacionada: solo si existe relación canónica
Servicio relacionado: Impresoras y periféricos

[ Ver detalle ]
```

El ejemplo demuestra deliberadamente que una condición física `OPERATIVA` no fabrica health `HEALTHY`.

---

#### 6. Arquitectura de información

La superficie administrativa se presentará como **Mapa técnico** dentro del carril de soporte de VISO. El rótulo es de experiencia; no crea una ruta de aplicación ni un identificador de dominio.

Orden de lectura:

```text
MAPA TÉCNICO

1. RESUMEN DE SALUD
   Qué requiere atención y qué permanece desconocido

2. MAPA DE DEPENDENCIAS
   Servicios, elementos y relaciones demostradas

3. INVENTARIO TÉCNICO
   Exploración por clase, sede, área y fuente

4. EVIDENCIA Y DESCONOCIDOS
   Frescura, reconciliación y brechas que impiden concluir salud
```

Las cuatro vistas comparten filtros y contexto; ninguna mantiene una copia propia del objeto.

---

#### 7. Resumen de salud

La entrada deberá priorizar comprensión antes que densidad técnica.

Composición objetivo:

```text
MAPA TÉCNICO
Estado técnico de Vento

SERVICIOS
Salud demostrada: ...
Degradados: ...
Fuera de línea: ...
Configuración incorrecta: ...
Salud desconocida: ...

REQUIERE ATENCIÓN
- condiciones con alerta o caso activo
- servicios con degradación demostrada
- componentes críticos con evidencia vencida
- divergencias de configuración demostradas

EVIDENCIA INSUFICIENTE
- elementos sin señal vigente
- relaciones pendientes de reconciliación
- fuentes todavía no integradas

[ Ver dependencias ]   [ Ver inventario ]
```

No se calcula un “porcentaje saludable” si el denominador incluye elementos sin observabilidad suficiente. Si se presenta cualquier proporción deberá declarar población, exclusiones, estado `UNKNOWN` y momento de corte.

---

#### 8. Mapa de dependencias

El mapa de dependencias permite comenzar desde:

- un `TECH_SERVICE`;
- una de las otras seis clases del grafo;
- una sede o área cuando la relación territorial exista;
- un caso tecnológico que ya contenga `affected_element_ref` o equivalente;
- una alerta ya correlacionada con elemento o servicio.

La vista debe distinguir tres tipos de línea:

| Presentación     | Significado                                                 | Regla                                                                                                      |
| ---------------- | ----------------------------------------------------------- | ---------------------------------------------------------------------------------------------------------- |
| Relación directa | una de `TI-REL-001` a `TI-REL-015`                          | puede mostrarse como vínculo autoritativo de configuración                                                 |
| Lectura inversa  | la misma relación directa navegada desde el extremo opuesto | no crea otra relación ni otro ID                                                                           |
| Ruta derivada    | cadena de dos o más relaciones directas                     | se marca como “ruta de dependencia derivada”; no se presenta como causa ni se persiste como relación nueva |

Una ruta derivada deberá poder desplegar sus aristas originales. No será válida una línea agregada que oculte qué relaciones demostradas la sustentan.

---

#### 9. Las siete clases del mapa

| Clase              | Autoridad conservada                         | Qué muestra VISO                                                                           | Qué no debe inferir                                                       |
| ------------------ | -------------------------------------------- | ------------------------------------------------------------------------------------------ | ------------------------------------------------------------------------- |
| `ASSET`            | NEXO / fuente física                         | identidad, ubicación, custodia, condición, mantenimiento y relaciones técnicas confirmadas | que todo activo es endpoint o dispositivo compartido                      |
| `ENDPOINT`         | `TI-DOM-003` / futura persistencia canónica  | lifecycle, baseline, posture, configuración observada, frescura y health                   | que serial, IP, `employee_devices` o asset equivalen a endpoint           |
| `SHARED_DEVICE`    | dispositivo compartido canónico              | código, sede, área, modo, aplicaciones autorizadas, heartbeat cuando exista y health       | actor humano, permiso del trabajador o endpoint implícito                 |
| `NETWORK_RESOURCE` | `TI-DOM-004`                                 | subtipo, topología demostrada, finalidad, addressing seguro, health y frescura             | topología desde coincidencias o que reachability implica salud            |
| `PRINTER`          | `TI-DOM-005` + NEXO + PRINT-ARC              | condición, canal, health, cola/routing/adaptador relacionados y evidencia                  | que impresión física, cola, job y resultado son el mismo estado           |
| `APPLICATION`      | `TI-DOM-006` + SHELL + propietaria funcional | catálogo, ambiente, despliegue demostrado, health, dependencias y servicio                 | que `is_active`, una URL o un repositorio prueban disponibilidad          |
| `TECH_SERVICE`     | `TI-DOM-001` + `TI-DOM-010`                  | health derivada, SLI, dependencias, alertas y casos correlacionados                        | que el peor nodo siempre define el servicio o que health define prioridad |

Cobertura: **7 de 7 clases**.

---

#### 10. Las quince relaciones directas

El mapa conservará exactamente estas relaciones:

| Relación                                        | Semántica de presentación                                      |
| ----------------------------------------------- | -------------------------------------------------------------- |
| `TI-REL-001 — ENDPOINT_RUNS_ON_ASSET`           | endpoint ejecutándose sobre un activo físico identificado      |
| `TI-REL-002 — SHARED_DEVICE_USES_ENDPOINT`      | dispositivo compartido sustentado por un endpoint identificado |
| `TI-REL-003 — SHARED_DEVICE_ALLOWS_APPLICATION` | aplicación permitida en un dispositivo compartido              |
| `TI-REL-004 — ENDPOINT_CONNECTS_VIA_NETWORK`    | endpoint conectado mediante recurso de red identificado        |
| `TI-REL-005 — ENDPOINT_CLIENT_FOR_APPLICATION`  | endpoint cliente de una aplicación                             |
| `TI-REL-006 — NETWORK_RESOURCE_RUNS_ON_ASSET`   | recurso de red materializado sobre un activo físico            |
| `TI-REL-007 — PRINTER_REPRESENTS_ASSET`         | identidad de impresora reconciliada con activo físico          |
| `TI-REL-008 — PRINTER_CONNECTS_VIA_NETWORK`     | impresora conectada mediante recurso de red identificado       |
| `TI-REL-009 — PRINTER_ATTACHED_TO_ENDPOINT`     | impresora conectada o adjunta a endpoint identificado          |
| `TI-REL-010 — SERVICE_DEPENDS_ON_ASSET`         | servicio dependiente de activo físico                          |
| `TI-REL-011 — SERVICE_DEPENDS_ON_ENDPOINT`      | servicio dependiente de endpoint                               |
| `TI-REL-012 — SERVICE_DEPENDS_ON_SHARED_DEVICE` | servicio dependiente de dispositivo compartido                 |
| `TI-REL-013 — SERVICE_DEPENDS_ON_NETWORK`       | servicio dependiente de recurso de red                         |
| `TI-REL-014 — SERVICE_DEPENDS_ON_PRINTER`       | servicio dependiente de impresora                              |
| `TI-REL-015 — SERVICE_DEPENDS_ON_APPLICATION`   | servicio dependiente de aplicación                             |

Cobertura: **15 de 15 relaciones**, sin alias nuevas ni renumeración.

La interfaz puede usar verbos humanos, pero el detalle técnico deberá poder revelar la relación canónica que sustenta el vínculo.

---

#### 11. Salud técnica

Se preservan exactamente los cinco estados aprobados:

| Estado          | Presentación humana      | Condición mínima                                                                                     |
| --------------- | ------------------------ | ---------------------------------------------------------------------------------------------------- |
| `HEALTHY`       | Saludable                | evidencia fresca y suficiente demuestra la capacidad esperada                                        |
| `DEGRADED`      | Degradado                | capacidad parcial con reducción, error repetido, retraso, saturación o pérdida de calidad demostrada |
| `OFFLINE`       | Fuera de línea           | evidencia suficiente demuestra indisponibilidad de la capacidad observada                            |
| `MISCONFIGURED` | Configuración incorrecta | el estado observado diverge demostrablemente del perfil esperado                                     |
| `UNKNOWN`       | Salud desconocida        | evidencia ausente, obsoleta, contradictoria o insuficiente                                           |

Reglas de interfaz:

1. el texto del estado siempre acompaña al color;
2. `UNKNOWN` utiliza una representación propia y visible;
3. health incluye momento de última observación y fuente;
4. una observación manual se identifica como manual;
5. una recuperación puntual no oculta la necesidad de estabilidad posterior;
6. una señal `RECOVERY` no cierra caso ni incidente;
7. una alerta y health se muestran por separado;
8. health histórico puede consultarse sin sustituir el estado vigente;
9. si la evidencia requerida vence, la presentación deja de mantener `HEALTHY` por inercia.

---

#### 12. Frescura y suficiencia de evidencia

Junto a health se presenta una condición de frescura humana equivalente a:

- **Vigente**;
- **Retrasada**;
- **Obsoleta**;
- **Desconocida**.

La vista deberá responder:

```text
ÚLTIMA OBSERVACIÓN
FUENTE
FORMA DE OBSERVACIÓN
EDAD DE LA EVIDENCIA
CONDICIÓN ESPERADA DE FRESCURA
```

No se inventa un tiempo universal de expiración. Cada fuente conserva su contrato de frescura.

Si un operador abre un elemento con health `UNKNOWN`, la interfaz debe explicar la razón, por ejemplo:

```text
No hay una observación vigente para concluir la salud de este elemento.
El registro existe, pero la última comprobación no está disponible.
```

No deberá decir “sin problemas detectados” cuando no existe evidencia suficiente para comprobarlo.

---

#### 13. Reconciliación frente a health

El mapa muestra por separado:

```text
RECONCILIACIÓN DE IDENTIDAD / CONFIGURACIÓN
≠
HEALTH TÉCNICA
```

Los estados documentales de reconciliación conservados son:

- `ESPECIFICADO`;
- `IMPLEMENTADO`;
- `VALIDADO`;
- `BLOQUEADO`;
- `PENDIENTE_DE_EVIDENCIA`;
- `NO_APLICA`;
- `FUERA_DE_ALCANCE`.

Ejemplos:

- una impresora puede tener identidad `ESPECIFICADO`, condición física `OPERATIVA`, relación con activo `PENDIENTE_DE_EVIDENCIA` y health `UNKNOWN`;
- una aplicación puede estar `is_active = true` en catálogo y continuar con despliegue o health `PENDIENTE_DE_EVIDENCIA` / `UNKNOWN`;
- un recurso de red puede estar `ESPECIFICADO` como subtipo sin existir todavía una instancia `VALIDADO` en el inventario AS-IS.

La interfaz no resume estas dimensiones en un único estado.

---

#### 14. Servicios tecnológicos — 11 de 11

Cada servicio es una raíz navegable del mapa y conserva su identidad:

| Servicio         | Nombre                                                                  | Foco de la vista de salud                                            |
| ---------------- | ----------------------------------------------------------------------- | -------------------------------------------------------------------- |
| `TI-SERVICE-001` | Cuentas, identidad y acceso tecnológico                                 | disponibilidad y resultado del ciclo autorizado de acceso            |
| `TI-SERVICE-002` | Endpoints, computadores, celulares, tabletas y dispositivos compartidos | health, postura y frescura de endpoint/dispositivo                   |
| `TI-SERVICE-003` | Redes y conectividad                                                    | disponibilidad y calidad de conectividad                             |
| `TI-SERVICE-004` | Impresoras y periféricos                                                | health de impresora y camino de impresión                            |
| `TI-SERVICE-005` | Aplicaciones, ambientes y proveedores tecnológicos                      | disponibilidad, rendimiento y dependencias de la capacidad publicada |
| `TI-SERVICE-006` | Solicitudes de soporte tecnológico                                      | salud del flujo de atención y sus dependencias                       |
| `TI-SERVICE-007` | Incidentes y restauración tecnológica                                   | estado del servicio afectado y evolución de restauración             |
| `TI-SERVICE-008` | Cambios, configuración y versiones tecnológicas                         | comportamiento antes, durante y después del cambio                   |
| `TI-SERVICE-009` | Pruebas y aceptación técnica de soluciones                              | resultado verificable de pruebas y dependencias técnicas             |
| `TI-SERVICE-010` | Licencias, garantías, contratos y costos tecnológicos                   | condiciones técnicas que pueden afectar disponibilidad               |
| `TI-SERVICE-011` | Conocimiento, capacitación y adopción tecnológica                       | disponibilidad y vigencia del soporte guiado                         |

El mapa no asigna health fija a estos servicios por diseño. La health se deriva únicamente cuando las señales, dependencias y evidencia aplicables lo permiten.

---

#### 15. Salud de servicio frente a salud de componente

Un servicio no hereda automáticamente el peor estado de todos sus nodos.

La presentación de un servicio deberá explicar, cuando exista evidencia:

- dependencia afectada;
- criticidad de esa dependencia para el servicio;
- redundancia o camino alterno conocido;
- alcance territorial;
- capacidad empresarial todavía disponible;
- señales o SLI relevantes;
- health resultante y su evidencia;
- alertas y casos correlacionados.

Ejemplo:

```text
Red principal de una sede: DEGRADED
Wi-Fi de contingencia: HEALTHY
Servicio Redes y conectividad: DEGRADED

Razón visible:
La sede conserva conectividad parcial por el camino alterno,
pero la capacidad principal está degradada.
```

Ejemplo contrario:

```text
Un periférico no crítico: OFFLINE
Servicio: HEALTHY

Razón visible:
El elemento no participa en la capacidad mínima del servicio actual.
```

La explicación requiere relaciones reales. No se crea redundancia por intuición del operador.

---

#### 16. Endpoints

El mapa de endpoint deberá poder presentar:

- identidad canónica de endpoint;
- form factor;
- modo de uso;
- lifecycle;
- activo físico relacionado cuando exista `TI-REL-001`;
- dispositivo compartido relacionado cuando exista `TI-REL-002`;
- aplicaciones cliente cuando exista `TI-REL-005`;
- red cuando exista `TI-REL-004`;
- baseline asignado;
- estado deseado y observado;
- posture;
- estado de actualización;
- última evaluación;
- health y frescura;
- servicios dependientes;
- casos, alertas y cambios correlacionados.

La línea base actual no demuestra una persistencia transversal consolidada de endpoints con identidades materializadas suficientes para poblar un inventario canónico completo. Por tanto:

```text
ENDPOINTS DISEÑADOS EN EL MAPA
=
SÍ

ENDPOINTS AS-IS INVENTADOS PARA LLENAR EL MAPA
=
NO
```

Hasta disponer de identidades canónicas, el mapa muestra la brecha de evidencia y no transforma `employee_devices`, activo físico, IP, MAC, serial o fingerprint en endpoint.

---

#### 17. Dispositivos compartidos AS-IS

La lectura canónica y remota disponible conserva **2 registros activos** y **4 vínculos activos dispositivo–aplicación**.

| Código               | Etiqueta           | Tipo                 | Aplicación predeterminada | Otras aplicaciones activas   | Estado de activación | `last_seen_at` | Presentación health                                           |
| -------------------- | ------------------ | -------------------- | ------------------------- | ---------------------------- | -------------------- | -------------- | ------------------------------------------------------------- |
| `CAJA_VENTO_CAFE_01` | Caja Vento Café 01 | `pos_terminal`       | `pulso`                   | `nexo`, `shell`              | `active`             | `null`         | `UNKNOWN` hasta evidencia de heartbeat o comprobación vigente |
| `KIOSCO_BODEGA_CP`   | Kiosco Bodega CP   | `warehouse_terminal` | `nexo`                    | ninguna adicional registrada | `active`             | `null`         | `UNKNOWN` hasta evidencia de heartbeat o comprobación vigente |

Reglas:

1. `active` es activación/configuración, no health;
2. `last_seen_at = null` no se convierte automáticamente en `OFFLINE`;
3. la ausencia de heartbeat produce incertidumbre conforme al contrato de frescura;
4. las cuatro relaciones dispositivo–aplicación pueden proyectarse como `TI-REL-003` únicamente cuando la reconciliación canónica de esa relación lo sostenga;
5. el dispositivo no identifica al trabajador y no concede sus permisos.

---

#### 18. Redes

El mapa conserva los siete subtipos de `NETWORK_RESOURCE`:

| Subtipo               | Presentación mínima                                                                                            |
| --------------------- | -------------------------------------------------------------------------------------------------------------- |
| `NETWORK_LINK`        | proveedor o camino referenciado, extremos, alcance, health y evidencia                                         |
| `ROUTER`              | identidad, activo relacionado si existe, uplinks, segmentos y health                                           |
| `SWITCH`              | identidad, uplinks, segmentos presentes y health                                                               |
| `ACCESS_POINT`        | identidad, SSID publicados demostrados, segmento y health                                                      |
| `SEGMENT`             | finalidad, sedes/áreas aplicables, direccionamiento seguro y health                                            |
| `SSID`                | finalidad, AP relacionados, segmento y health                                                                  |
| `ADDRESS_RESERVATION` | recurso autorizado, segmento y estado de reconciliación; dirección sensible solo bajo necesidad y autorización |

La línea base de `TI-DOM-004` contiene **0 instancias AS-IS declaradas `VALIDADO`**.

Por tanto, la primera versión documental del mapa no dibuja routers, switches, AP, VLAN, SSID o reservas ficticias. Presenta:

```text
MODELO DE RED DEFINIDO
7 SUBTIPOS DISPONIBLES
INVENTARIO VALIDADO ACTUAL: 0

Estado:
Se requiere evidencia reconciliada para poblar la topología.
```

La ausencia de instancias validadas no se interpreta como ausencia física de red.

---

#### 19. Reglas específicas de topología de red

Cuando existan instancias reconciliadas, se preservarán las seis relaciones de topología de `TI-DOM-004` dentro de la proyección de red:

1. enlace termina en router;
2. uplink de red;
3. segmento presente en nodo;
4. SSID emitido por AP;
5. SSID asociado a segmento;
6. reserva perteneciente a segmento.

La vista deberá distinguir:

- enlace;
- equipo;
- interfaz;
- segmento;
- SSID;
- direccionamiento;
- reachability;
- latencia;
- pérdida;
- saturación;
- estado esperado y observado;
- cambio activo;
- dependencia de servicio.

No se mostrarán PSK, secretos, credenciales o configuraciones completas. La dirección IP podrá quedar oculta en la vista ordinaria si una etiqueta segura y la identidad canónica son suficientes.

---

#### 20. Impresoras — 9 de 9

Cada identidad `PRN-*` recibe decisión explícita de presentación:

| ID                          | Contexto                       | Condición física aprobada | Health runtime inicial | Decisión del mapa                                                                            |
| --------------------------- | ------------------------------ | ------------------------- | ---------------------- | -------------------------------------------------------------------------------------------- |
| `PRN-VP-ZD230-01`           | Vento Producción · Zebra ZD230 | `ALMACENADA`              | `UNKNOWN`              | mostrar condición física y ausencia de canal activo por separado; no declarar disponibilidad |
| `PRN-VP-L5590-01`           | Vento Producción · Epson L5590 | `REQUIERE_MANTENIMIENTO`  | `UNKNOWN`              | elevar condición física; health no sustituye mantenimiento ni rehabilita el equipo           |
| `PRN-ADMIN-L4260-01`        | Administración · Epson L4260   | `OPERATIVA`               | `UNKNOWN`              | mostrar interfaz documentada y exigir evidencia runtime antes de `HEALTHY`                   |
| `PRN-MOLKA-DIGE200I-01`     | Molka · caja                   | `OPERATIVA`               | `UNKNOWN`              | conservar USB como canal documentado; no inferir job o receipt                               |
| `PRN-SAUDO-DIGE200I-01`     | Saudo · caja                   | `OPERATIVA`               | `UNKNOWN`              | conservar USB como canal documentado; no inferir job o receipt                               |
| `PRN-VC-CAJA-DIGE200I-01`   | Vento Café · caja/mostrador    | `OPERATIVA`               | `UNKNOWN`              | conservar USB como canal documentado; mostrar servicio y casos relacionados cuando existan   |
| `PRN-VC-BARRA-DIGE200I-01`  | Vento Café · barra calientes   | `OPERATIVA`               | `UNKNOWN`              | conservar LAN como canal documentado; red solo se enlaza con relación reconciliada           |
| `PRN-VC-BAR-DIGE200I-01`    | Vento Café · bar bebidas frías | `OPERATIVA`               | `UNKNOWN`              | conservar LAN como canal documentado; red solo se enlaza con relación reconciliada           |
| `PRN-VC-COCINA-DIGE200I-01` | Vento Café · cocina            | `OPERATIVA`               | `UNKNOWN`              | conservar LAN como canal documentado; red solo se enlaza con relación reconciliada           |

Cobertura: **9 de 9 impresoras**.

Para las nueve, la relación física `PRINTER_REPRESENTS_ASSET` permanece sin una reconciliación `VALIDADO` demostrada. El mapa deberá mostrar esa deuda de evidencia y no asociar impresoras a activos por similitud de descripción.

---

#### 21. Camino de impresión

El detalle de impresora separa:

```text
IMPRESORA
≠ CONDICIÓN FÍSICA
≠ INTERFAZ
≠ RECURSO DE RED
≠ COLA
≠ ROUTING
≠ ADAPTADOR
≠ JOB
≠ INTENTO
≠ RECEIPT
≠ RESULTADO EMPRESARIAL
≠ HEALTH
```

Una impresora puede estar físicamente operativa y tener health `UNKNOWN`; puede tener health técnico `HEALTHY` y una cola degradada; o un job puede fallar aun con impresora saludable.

La vista muestra esos objetos como referencias relacionadas cuando existan. No crea una nueva cola, un nuevo job ni un receipt dentro del mapa.

---

#### 22. Aplicaciones — 10 de 10

Cada aplicación canónica recibe decisión explícita de presentación:

| Código   | Nombre     | Superficie canónica                 | Catálogo           | Health runtime inicial      | Decisión del mapa                                                                                           |
| -------- | ---------- | ----------------------------------- | ------------------ | --------------------------- | ----------------------------------------------------------------------------------------------------------- |
| `shell`  | Vento OS   | Hub · laboral · núcleo              | activa             | `UNKNOWN` sin señal vigente | mostrar dependencias y diferenciar origen/hub cuando exista evidencia de ambiente                           |
| `anima`  | ANIMA      | híbrida · laboral · núcleo          | activa             | `UNKNOWN` sin señal vigente | mostrar disponibilidad y dependencias sin equiparar EAS/configuración con despliegue saludable              |
| `viso`   | VISO       | administrativa · laboral · núcleo   | activa             | `UNKNOWN` sin señal vigente | mostrar salud de la propia mesa administrativa sin usar la apertura del mapa como health check              |
| `nexo`   | NEXO       | híbrida · laboral · núcleo          | activa             | `UNKNOWN` sin señal vigente | relacionar dispositivos, impresión y procesos solo mediante dependencias demostradas                        |
| `fogo`   | FOGO       | operativa · laboral · núcleo        | activa             | `UNKNOWN` sin señal vigente | separar catálogo, ambiente, health y disponibilidad empresarial                                             |
| `origo`  | ORIGO      | híbrida · laboral · núcleo          | activa             | `UNKNOWN` sin señal vigente | mostrar dependencias técnicas; contratos y costos permanecen fuera de esta tarea                            |
| `pulso`  | PULSO      | operativa · laboral · núcleo        | activa             | `UNKNOWN` sin señal vigente | relacionar con dispositivo compartido donde la relación esté materializada                                  |
| `numera` | NUMERA     | híbrida · laboral · núcleo          | activa             | `UNKNOWN` sin señal vigente | mostrar dependencias técnicas; compromisos y costos conservan su autoridad                                  |
| `aura`   | AURA       | administrativa · laboral · diferido | activa en catálogo | `UNKNOWN`                   | destacar evidencia de implementación/despliegue pendiente; catálogo activo no reactiva el producto diferido |
| `pass`   | Vento Pass | cliente · adyacente                 | activa             | `UNKNOWN` sin señal vigente | presentar como superficie de cliente y conservar dependencias sin mezclarla con carril laboral              |

Cobertura: **10 de 10 aplicaciones**.

Para cada una se mantienen separadas estas dimensiones:

```text
CATALOG_ACTIVE
DEPLOYMENT_PRESENT
TECHNICALLY_HEALTHY
BUSINESS_AVAILABLE
AUTHORIZED_FOR_ACTOR
DEPENDENCY_AVAILABLE
```

Ninguna implica automáticamente otra.

---

#### 23. Ambientes y versiones

Cuando una aplicación disponga de evidencia, el detalle puede mostrar los roles de ambiente ya aprobados:

- `DEVELOPMENT`;
- `CI`;
- `PREVIEW`;
- `STAGING`;
- `PRODUCTION`;
- `SANDBOX`.

La interfaz deberá identificar si la evidencia está:

- configurada en repositorio;
- referenciada en código;
- verificada como despliegue;
- pendiente de evidencia;
- no aplicable.

Una URL observable, un perfil de build, un repositorio o una fila `apps.is_active` no se presentarán como “Producción saludable”.

---

#### 24. Detalle de elemento

El drill-down se organiza en este orden:

1. **Identidad y fuente**;
2. **Salud y frescura**;
3. **Estado físico, lifecycle o configuración aplicables**;
4. **Dependencias directas**;
5. **Servicios relacionados**;
6. **Alertas y casos relacionados**;
7. **Cambios relacionados**;
8. **Evidencia y brechas de reconciliación**;
9. **Acciones autorizables por handoff**.

Ejemplo:

```text
Kiosco Bodega CP
SHARED_DEVICE · KIOSCO_BODEGA_CP

Salud: UNKNOWN
Última observación: no disponible
Activación: active
Aplicación predeterminada: NEXO
Aplicaciones permitidas: NEXO
Endpoint relacionado: no demostrado
Activo físico relacionado: no demostrado

Evidencia
- configuración del dispositivo: disponible
- heartbeat vigente: no disponible
- vínculo endpoint/activo: pendiente

Casos relacionados
- mostrar solo referencias autorizadas existentes
```

---

#### 25. Búsqueda y filtros

La exploración admite filtros combinables por:

- clase canónica;
- servicio;
- sede;
- área;
- health;
- frescura;
- estado de reconciliación;
- aplicación;
- tipo de red;
- impresora;
- presencia de alerta activa;
- presencia de caso activo;
- presencia de cambio relacionado.

La búsqueda puede resolver código o etiqueta humana autorizada. No se convierte IP, MAC, serial, correo, nombre de persona o payload técnico en una búsqueda global indiscriminada.

Filtros de presentación no crean alcance ni autorización. El servidor deberá conservar el control real de qué objetos y atributos puede consultar cada actor cuando la implementación sea autorizada.

---

#### 26. Qué requiere atención

La sección de atención no inventa una prioridad técnica global.

Puede agrupar elementos por condiciones verificables como:

- alerta accionable correlacionada;
- caso activo relacionado;
- health `OFFLINE`;
- health `DEGRADED`;
- health `MISCONFIGURED`;
- evidencia crítica obsoleta o ausente;
- relación esencial `PENDIENTE_DE_EVIDENCIA`;
- cambio activo relacionado.

La ordenación deberá considerar la autoridad de los contratos de servicio, impacto, criticidad, alerta y caso cuando existan. El estado de health por sí solo no escribe prioridad P1–P4 ni SLA.

---

#### 27. Estado desconocido y deuda de evidencia

La vista **Evidencia y desconocidos** separa al menos:

```text
SIN IDENTIDAD CANÓNICA SUFICIENTE
SIN RELACIÓN RECONCILIADA
SIN FUENTE DE TELEMETRÍA
SIN OBSERVACIÓN RECIENTE
OBSERVACIÓN CONTRADICTORIA
FUENTE AÚN NO INTEGRADA
OBJETO FUERA DE ALCANCE DE MONITOREO
```

Cada fila debe indicar:

- objeto o clase afectada;
- qué falta exactamente;
- qué conclusión no puede emitirse;
- fuente propietaria;
- propietario documental/técnico del cierre cuando exista;
- condición de salida.

El objetivo es que `UNKNOWN` sea operable como deuda de evidencia, no un cajón sin explicación.

---

#### 28. Alertas, casos y cambios

La interfaz conserva:

```text
SEÑAL
≠ ALERTA
≠ CASO
≠ INCIDENTE
≠ PROBLEMA
≠ CAMBIO
≠ HEALTH
```

Reglas:

1. una señal puede cambiar health sin crear incidente automáticamente;
2. una alerta puede aparecer relacionada con un nodo sin convertirlo en causa;
3. un caso de `TI-UX-002` puede referenciar servicio y elemento afectados;
4. desde el caso se puede abrir el contexto del elemento en el mapa;
5. desde el mapa se puede entregar el `element_ref` al flujo de mesa de servicio cuando el actor decida reportar o relacionar una afectación;
6. el mapa no cambia estado del caso al visualizar health;
7. `HEALTHY` posterior no cierra caso ni valida al solicitante;
8. el diseño detallado de incidente, problema, cambio, mantenimiento y recuperación permanece en `TI-UX-004`.

---

#### 29. Acciones y handoffs

El mapa es predominantemente de consulta y contextualización.

Acciones permitidas por diseño, siempre sujetas a autorización:

- ver detalle del elemento;
- navegar a una dependencia directa;
- ver el servicio relacionado;
- ver un caso existente;
- entregar referencia del elemento a la mesa de servicio;
- consultar evidencia segura disponible;
- abrir una superficie propietaria de configuración o cambio cuando exista y el actor tenga derecho a usarla.

Acciones que el mapa no ejecuta directamente:

- cambiar IP, VLAN, SSID, driver, firmware o routing;
- instalar o retirar aplicaciones;
- cambiar baseline o posture;
- modificar regla, threshold, silencio o routing de monitoreo;
- elevar privilegios;
- abrir sesión remota;
- leer logs sensibles por defecto;
- cerrar incidente, problema o cambio;
- alterar condición física o custodia del activo;
- cambiar contratos, licencias o costos.

Una acción de configuración será un handoff a la autoridad propietaria, no un control escondido dentro del nodo.

---

#### 30. Protección de información

La presentación ordinaria aplica minimización:

**Visible cuando sea necesario y autorizado:**

- código y etiqueta segura;
- clase;
- sede/área;
- health;
- frescura;
- estado de reconciliación;
- versión o ambiente no sensible;
- relaciones y servicios;
- resumen de alerta/caso no sensible.

**No visible por defecto:**

- contraseñas;
- tokens;
- API keys;
- PSK;
- credenciales de proveedor;
- cookies o cabeceras de autorización;
- logs completos;
- payloads completos;
- dumps de configuración;
- topología sensible innecesaria;
- direcciones o identificadores técnicos cuando una etiqueta segura sea suficiente;
- datos personales de trabajadores o terceros no requeridos por la acción.

El acceso progresivo a diagnóstico sensible conserva finalidad, recurso, intervalo, autorización y trazabilidad de `TI-AUTH-004`.

---

#### 31. Accesibilidad y densidad

El mapa administrativo no dependerá exclusivamente de una visualización gráfica.

Debe existir representación equivalente mediante lista o tabla para:

- navegación por teclado;
- lector de pantalla;
- búsqueda;
- filtros;
- revisión de relaciones;
- comparación de estados;
- exportación solo cuando una tarea autorizada la habilite.

Reglas:

1. health usa texto e iconografía además de color;
2. las relaciones tienen nombre visible;
3. el foco del teclado es identificable;
4. el detalle no depende de hover;
5. los nodos con `UNKNOWN` no se atenúan hasta parecer irrelevantes;
6. una red grande admite agrupación y expansión progresiva;
7. la densidad técnica avanzada se revela progresivamente;
8. la vista inicial prioriza atención y desconocidos, no una nube completa de nodos.

---

#### 32. Composición material — resumen

```text
┌──────────────────────────────────────────────────────────────┐
│ Mapa técnico                                                │
│ Estado de servicios, equipos y dependencias                 │
├──────────────────────────────────────────────────────────────┤
│ Resumen | Dependencias | Inventario | Evidencia             │
├──────────────────────────────────────────────────────────────┤
│ SERVICIOS                                                   │
│ Saludable ...  Degradado ...  Offline ...  Unknown ...     │
│                                                              │
│ REQUIERE ATENCIÓN                                           │
│ [Servicio / elemento]  Estado  Evidencia  Caso/alerta       │
│                                                              │
│ EVIDENCIA INSUFICIENTE                                      │
│ [Elemento]  Qué falta  Desde cuándo  Fuente propietaria     │
└──────────────────────────────────────────────────────────────┘
```

Los contadores solo usan poblaciones que puedan explicarse. El diseño no obliga a mostrar cero como si hubiera existido una comprobación.

---

#### 33. Composición material — dependencias

```text
Servicio: Impresoras y periféricos

                  ┌─────────────────────┐
                  │ TI-SERVICE-004      │
                  │ Salud: UNKNOWN      │
                  └──────────┬──────────┘
                             │ depende de
             ┌───────────────┴────────────────┐
             │                                │
┌─────────────────────────┐       ┌──────────────────────────┐
│ PRINTER                  │       │ APPLICATION / ENDPOINT   │
│ PRN-VC-COCINA-...        │       │ solo si relación existe  │
│ Condición: OPERATIVA     │       │                          │
│ Health: UNKNOWN          │       │                          │
└────────────┬────────────┘       └──────────────────────────┘
             │
             │ red relacionada solo con TI-REL-008
             ▼
┌─────────────────────────┐
│ NETWORK_RESOURCE        │
│ si existe identidad     │
│ reconciliada            │
└─────────────────────────┘
```

Si `TI-REL-008` no existe, la interfaz no dibuja la arista aunque la impresora esté documentada como LAN.

---

#### 34. Estados vacíos, degradados y parciales

##### Sin inventario validado

```text
Todavía no hay elementos reconciliados para esta clase.
El modelo está definido, pero falta evidencia para poblar el mapa.
```

##### Fuente sin telemetría

```text
Conocemos este elemento, pero no existe una observación vigente para concluir su salud.
Salud: UNKNOWN
```

##### Fuente temporalmente no disponible

```text
No pudimos actualizar esta fuente.
Se conserva la última observación con su fecha original.
La información puede estar obsoleta.
```

##### Relaciones parciales

```text
Este elemento tiene identidad válida, pero algunas dependencias todavía no están reconciliadas.
No se completará el grafo mediante coincidencias automáticas no aprobadas.
```

##### Resultado contradictorio

```text
Las fuentes disponibles no permiten concluir un estado único.
Salud: UNKNOWN
Requiere revisión de evidencia.
```

---

#### 35. Reconciliación AS-IS → diseño objetivo

| Elemento                 | AS-IS verificable                                                                                               | Resultado de TI-UX-003                                                         |
| ------------------------ | --------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------ |
| Grafo de configuración   | contrato de siete clases y quince relaciones `ESPECIFICADO`; materialización transversal completa no demostrada | experiencia de proyección definida sin crear fuente paralela                   |
| Endpoints                | contrato completo; persistencia transversal consolidada `PENDIENTE_DE_EVIDENCIA`                                | vista definida; cero endpoints ficticios                                       |
| Dispositivos compartidos | 2 activos; 4 vínculos activos con aplicaciones; ambos sin `last_seen_at`                                        | 2/2 reciben presentación explícita con health `UNKNOWN`                        |
| Redes                    | siete subtipos y topología definidos; 0 instancias AS-IS `VALIDADO`                                             | mapa muestra modelo y deuda de evidencia, no topología inventada               |
| Impresoras               | 9 identidades con condición física; relación física con activo no `VALIDADO`; runtime health no demostrado      | 9/9 reciben decisión explícita y separan condición de health                   |
| Aplicaciones             | 10 identidades activas en catálogo; despliegue/health requieren evidencia independiente                         | 10/10 reciben decisión explícita; catálogo activo no equivale a disponibilidad |
| Servicios                | 11 servicios definidos y matriz de observabilidad aprobada                                                      | 11/11 son raíces navegables de dependencias y health explicable                |
| Health                   | cinco estados y contrato de observabilidad `ESPECIFICADO`; plataforma transversal completa no demostrada        | semántica visual, frescura, desconocidos y explicación quedan definidas        |
| VISO                     | mesa de servicio diseñada en TI-UX-002; panel técnico unificado no se declara implementado                      | mapa técnico queda `ESPECIFICADO` documentalmente                              |
| Configuración            | gobierno protegido `ESPECIFICADO`                                                                               | mapa permanece de consulta/handoff; no se convierte en consola de cambio       |
| Datos sensibles          | minimización y diagnóstico protegido `ESPECIFICADO`                                                             | detalle técnico restringido y progresivo                                       |
| Implementación física    | fase actual exclusivamente documental                                                                           | `NO_APLICA` en esta tarea                                                      |

---

#### 36. Brechas y destinos exactos

| Brecha o resultado pendiente                                                           | Estado tras TI-UX-003                    | Propietario / destino                                                                                              | Condición de salida                                                                             |
| -------------------------------------------------------------------------------------- | ---------------------------------------- | ------------------------------------------------------------------------------------------------------------------ | ----------------------------------------------------------------------------------------------- |
| adaptadores reales de telemetría para endpoint, red, impresora, aplicación y proveedor | `FUERA_DE_ALCANCE`                       | `TI-INT-001`                                                                                                       | fuente, autenticación, reloj, mapping, retries, idempotencia y señales implementables definidos |
| contratos entre fuentes VENTO y capa tecnológica                                       | `FUERA_DE_ALCANCE`                       | `TI-INT-002`                                                                                                       | interfaces, propietarios y mappings aprobados                                                   |
| MDM, soporte remoto, ISP, fabricantes y herramientas externas                          | `FUERA_DE_ALCANCE`                       | `TI-INT-003`                                                                                                       | integración concreta definida con alcance, autenticación, auditoría y salida                    |
| flujos visuales de incidente, problema, cambio, mantenimiento y recuperación           | `FUERA_DE_ALCANCE`                       | `TI-UX-004`                                                                                                        | diseño de correlación y acciones operativas aprobado                                            |
| proveedores, licencias, contratos, renovaciones y costos en experiencia TI             | `FUERA_DE_ALCANCE`                       | `TI-UX-005`                                                                                                        | experiencia administrativa económica/contractual aprobada                                       |
| diagnóstico guiado, runbooks y aprendizaje contextual                                  | `FUERA_DE_ALCANCE`                       | `TI-UX-006`                                                                                                        | experiencia guiada y gobierno de conocimiento aprobados                                         |
| configuración protegida desde cualquier superficie futura                              | `ESPECIFICADO`; implementación pendiente | `TI-AUTH-003` + alcance de implementación aplicable                                                                | enforcement real de actor, permiso, recurso, cambio, privilegio y evidencia                     |
| logs y diagnóstico sensible desde cualquier drill-down futuro                          | `ESPECIFICADO`; implementación pendiente | `TI-AUTH-004` + alcance de implementación aplicable                                                                | acceso minimizado, autorizado y auditable implementado                                          |
| poblamiento validado de topología de red                                               | `PENDIENTE_DE_EVIDENCIA`                 | autoridad `TI-DOM-004`; materialización bajo `NEXO-REMISSIONS-001::CONDITIONAL_IMPLEMENTATION_SCOPE` si se aprueba | identidades y relaciones verificadas sin inferencias por IP, nombre o ubicación                 |
| reconciliación impresora ↔ activo físico                                               | `PENDIENTE_DE_EVIDENCIA`                 | NEXO + PRINT-ARC; materialización bajo `NEXO-REMISSIONS-001::CONDITIONAL_IMPLEMENTATION_SCOPE` si se aprueba       | las 9 impresoras resuelven o justifican explícitamente su relación física                       |
| persistencia transversal de endpoint                                                   | `PENDIENTE_DE_EVIDENCIA`                 | autoridad `TI-DOM-003`; materialización bajo `NEXO-REMISSIONS-001::CONDITIONAL_IMPLEMENTATION_SCOPE` si se aprueba | identidades, lifecycle, baseline, posture y relaciones disponibles en fuente canónica           |
| implementación física de la experiencia de mapa en VISO                                | `NO_APLICA` en esta fase                 | `NEXO-REMISSIONS-001::CONDITIONAL_IMPLEMENTATION_SCOPE` si resulta aprobado                                        | alcance de implementación autoriza explícitamente la superficie y sus consumidores              |

No queda una decisión documental propia de TI-UX-003 diferida. Las brechas listadas corresponden a datos, integración, autorización, tareas vecinas o implementación física ya asignados.

---

#### 37. Fronteras con las tareas siguientes

##### TI-UX-004

Recibe del mapa:

- elemento y servicio afectados;
- health y frescura;
- alertas relacionadas;
- dependencias demostradas;
- cambios relacionados;
- evidencia segura.

Conserva como propia la experiencia de incidente, problema, cambio, mantenimiento y recuperación.

##### TI-UX-005

Puede reutilizar la identidad de aplicación, proveedor o elemento, pero conserva la experiencia de licencias, contratos, renovaciones y costos. El mapa no muestra valores económicos como health.

##### TI-UX-006

Puede recibir síntoma, elemento y contexto técnico seguro para iniciar diagnóstico guiado. El mapa no incorpora un árbol de resolución ni publica runbooks completos.

---

#### 38. Frontera con TI-UX-002

La mesa de servicio conserva el caso; el mapa conserva contexto tecnológico.

```text
CASO VISO
affected_service_ref
+
affected_element_ref
        ↓
ABRIR CONTEXTO EN MAPA
        ↓
IDENTIDAD + SALUD + FRESCURA + DEPENDENCIAS
```

Y en sentido inverso:

```text
ELEMENTO EN MAPA
        ↓
REPORTAR O RELACIONAR AFECTACIÓN
        ↓
ENTREGAR REFERENCIA A LA MESA DE SERVICIO
```

La transferencia de contexto evita volver a escribir manualmente sede, aplicación o elemento cuando ya están resueltos, pero la mesa de servicio conserva clasificación, prioridad, SLA, asignación, diagnóstico, restauración, validación y cierre.

---

#### 39. Requisitos de prueba derivados

**Resultado:** NO GENERA REQUISITOS DE PRUEBA

**Justificación:** el registro canónico vigente ya asigna expresamente a `TI-UX-003` la protección del inventario y relaciones tecnológicas mediante `TREQ-NEXO-019`, mientras `TREQ-VISO-002` gobierna la mesa de servicio y el elemento afectado; `TREQ-PROC-457` exige anticipar disponibilidad, conexión, energía, red, periférico, consumible y ausencia de telemetría; `TREQ-PROC-461` a `TREQ-PROC-500` protegen observabilidad, salud, señal, alerta, evidencia y correlación; y `TREQ-UX-003`, `TREQ-UX-005` y `TREQ-UX-010` protegen densidad administrativa, fuente de verdad, estado, contexto y minimización. TI-UX-003 materializa la experiencia de esas obligaciones sobre VISO sin introducir un nuevo estado de dominio, algoritmo de prioridad, permiso, mecanismo de seguridad, relación tecnológica o efecto persistente que requiera otra identidad de prueba.

**Balance:** 0 creados; 0 modificados; 0 diferidos; 0 descartados; 0 obsoletos.

---

#### 40. Criterios de aceptación

- [x] la continuidad vigente es `TI-UX-002 → TI-UX-003 → TI-UX-004`;
- [x] la tarea permanece exclusivamente documental;
- [x] VISO queda definido como aplicación objetivo de la experiencia administrativa;
- [x] no se inventa una ruta física;
- [x] se materializan exactamente cuatro modos primarios de presentación;
- [x] se preservan 7 de 7 clases del grafo tecnológico;
- [x] se preservan 15 de 15 relaciones directas `TI-REL-*`;
- [x] se distingue relación directa, lectura inversa y ruta derivada;
- [x] una ruta derivada no se presenta como causa;
- [x] se preservan 5 de 5 estados de health;
- [x] `UNKNOWN` queda visible y no equivale a saludable;
- [x] toda health requiere fuente y frescura;
- [x] health, condición física, lifecycle, posture, configuración y disponibilidad permanecen separados;
- [x] la salud de servicio no adopta mecánicamente el peor nodo;
- [x] los 11 servicios `TI-SERVICE-*` reciben una raíz de presentación explícita;
- [x] los siete subtipos de `NETWORK_RESOURCE` quedan cubiertos;
- [x] la ausencia actual de instancias de red `VALIDADO` no produce topología ficticia;
- [x] los 2 dispositivos compartidos AS-IS reciben decisión explícita;
- [x] los 4 vínculos activos dispositivo–aplicación quedan reconciliados;
- [x] `last_seen_at = null` en ambos dispositivos se traduce a health `UNKNOWN`, no `OFFLINE` automático;
- [x] las 9 impresoras `PRN-*` reciben decisión explícita;
- [x] condición física de impresora y runtime health permanecen separados;
- [x] ninguna de las 9 relaciones impresora–activo se declara validada sin evidencia;
- [x] las 10 aplicaciones canónicas reciben decisión explícita;
- [x] catálogo activo no equivale a despliegue, health, disponibilidad empresarial ni autorización;
- [x] AURA no se reactiva por existir como aplicación activa en catálogo;
- [x] se define drill-down de identidad, health, evidencia, relaciones, servicios, casos y cambios;
- [x] se definen búsqueda y filtros sin convertirlos en autorización;
- [x] se define una vista explícita de deuda de evidencia y desconocidos;
- [x] señal, alerta, caso, incidente, problema, cambio y health permanecen separados;
- [x] el mapa se integra con TI-UX-002 mediante referencias, no duplicación de expedientes;
- [x] el mapa no ejecuta configuración protegida;
- [x] el mapa no concede privilegio ni acceso sensible;
- [x] logs, IP, topología sensible, secretos y datos personales se minimizan por defecto;
- [x] la experiencia tiene alternativa tabular/lista y no depende exclusivamente del grafo ni del color;
- [x] se materializan estados vacíos, sin telemetría, obsoletos, parciales y contradictorios;
- [x] la reconciliación AS-IS diferencia especificado, implementado parcial, pendiente de evidencia y no aplica;
- [x] toda brecha conserva propietario y condición de salida;
- [x] no se modifica código, Supabase, datos, redes, impresoras, aplicaciones ni telemetría;
- [x] se crean cero requisitos de prueba y se modifican cero requisitos existentes;
- [x] `TI-UX-004` permanece únicamente reservada.

---

#### 41. Estado del resultado

| Resultado                                                      | Estado                                                               |
| -------------------------------------------------------------- | -------------------------------------------------------------------- |
| experiencia administrativa del mapa técnico de VISO            | `ESPECIFICADO`                                                       |
| arquitectura de cuatro modos de presentación                   | `ESPECIFICADO`                                                       |
| proyección de siete clases y quince relaciones                 | `ESPECIFICADO`                                                       |
| presentación de health y frescura                              | `ESPECIFICADO`                                                       |
| proyección de 11 servicios                                     | `ESPECIFICADO`                                                       |
| presentación de endpoints                                      | `ESPECIFICADO`; población canónica completa `PENDIENTE_DE_EVIDENCIA` |
| presentación de 2 dispositivos compartidos AS-IS               | `ESPECIFICADO`                                                       |
| presentación de red                                            | `ESPECIFICADO`; instancias validadas AS-IS: 0                        |
| presentación de 9 impresoras                                   | `ESPECIFICADO`                                                       |
| presentación de 10 aplicaciones                                | `ESPECIFICADO`                                                       |
| integración contextual con mesa de servicio                    | `ESPECIFICADO`                                                       |
| protección de configuración y diagnóstico                      | `ESPECIFICADO` mediante contratos propietarios                       |
| adaptadores de telemetría                                      | `FUERA_DE_ALCANCE` — `TI-INT-001` a `TI-INT-003`                     |
| flujos de incidente/problema/cambio/mantenimiento/recuperación | `FUERA_DE_ALCANCE` — `TI-UX-004`                                     |
| implementación física del mapa                                 | `NO_APLICA` en esta fase                                             |
| cambios de código o Supabase                                   | `NO_APLICA`                                                          |

---

#### 42. Continuidad

ÚLTIMA TAREA APROBADA
`TI-UX-002 — Diseñar mesa de servicio de VISO con colas, prioridad, SLA, asignación, comunicación y validación`

TAREA ACTUAL APROBADA
`TI-UX-003 — Diseñar mapa de dispositivos, redes, impresoras, aplicaciones y salud técnica`

SIGUIENTE TAREA RESERVADA
`TI-UX-004 — Diseñar flujos de incidente, problema, cambio, mantenimiento y recuperación`


### [ ] TI-UX-004 — Diseñar flujos de incidente, problema, cambio, mantenimiento y recuperación
### [ ] TI-UX-005 — Diseñar gestión de aplicaciones, proveedores, licencias, contratos, renovaciones y costos
### [ ] TI-UX-006 — Diseñar diagnóstico guiado, base de conocimiento y capacitación contextual sin saturación técnica
