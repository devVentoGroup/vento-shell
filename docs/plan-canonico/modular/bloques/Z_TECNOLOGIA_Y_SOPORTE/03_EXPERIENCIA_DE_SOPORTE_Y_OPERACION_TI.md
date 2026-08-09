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


### ✅ TI-UX-004 — Diseñar flujos de incidente, problema, cambio, mantenimiento y recuperación

**Estado:** APROBADA
**Tarea anterior:** `TI-UX-003 — Diseñar mapa de dispositivos, redes, impresoras, aplicaciones y salud técnica` — APROBADA
**Tarea siguiente:** `TI-UX-005 — Diseñar gestión de aplicaciones, proveedores, licencias, contratos, renovaciones y costos` — RESERVADA
**Tipo de tarea:** documental; diseño materializado de la experiencia administrativa y operativa de VISO para incidentes, problemas, cambios, mantenimiento tecnológico y recuperación técnica, conservando los ciclos, autoridades, evidencias y handoffs canónicos
**Repositorio propietario:** `vento-shell`
**Archivo propietario:** `docs/plan-canonico/modular/bloques/Z_TECNOLOGIA_Y_SOPORTE/03_EXPERIENCIA_DE_SOPORTE_Y_OPERACION_TI.md`
**Cambios físicos autorizados:** ninguno; no crea ni modifica código, pantallas desplegadas, tablas, vistas, RLS, RPC, funciones, triggers, Edge Functions, migraciones, datos, redes, dispositivos, impresoras, aplicaciones, configuraciones, respaldos, restauraciones, proveedores, secretos ni configuración de Supabase
**Requisitos de prueba creados o modificados:** 0

**Qué se hace:** diseñar en VISO una experiencia integrada que permita operar y comprender cinco flujos tecnológicos relacionados —incidente, problema, cambio, mantenimiento y recuperación— sin convertirlos en un ticket genérico ni crear ciclos competidores. La experiencia reutiliza la mesa de servicio de `TI-UX-002`, el mapa técnico de `TI-UX-003` y los contratos aprobados de incidente, problema, cambio, observabilidad y recuperación; hace visibles estado, próxima acción, evidencia, dependencias y handoffs; y preserva que restauración, causa, cambio, mantenimiento, recuperación técnica, continuidad empresarial y cierre son hitos distintos.

---

#### 1. Resultado sustantivo

`TI-UX-004` queda documentalmente cerrada con una experiencia concreta de operación tecnológica en VISO compuesta por cinco lentes coordinadas:

1. **Incidente:** restaurar o contener una interrupción, degradación o resultado desconocido sin confundir restauración con cierre.
2. **Problema:** investigar recurrencia y causalidad sin promover hipótesis, coincidencias o workarounds a causa confirmada.
3. **Cambio:** gobernar una modificación tecnológica desde evaluación hasta validación y revisión posterior sin convertir aprobación en ejecución.
4. **Mantenimiento:** coordinar intervención física o técnica planificada o correctiva sobre un elemento, conservando autoridad física, soporte, prueba posterior y cambio formal cuando la intervención altera configuración administrada.
5. **Recuperación:** coordinar restauración y recuperación técnica desde objetos y políticas verificables, separando backup, restore, validación técnica, validación empresarial, reconciliación y continuidad.

La solución no crea cinco aplicaciones ni cinco fuentes de verdad. Proyecta en VISO objetos y estados propietarios con una navegación administrativa coherente.

Cobertura materializada:

| Control                                           | Resultado |
| ------------------------------------------------- | --------: |
| Lentes coordinadas                                |     **5** |
| Estados canónicos del incidente preservados       |     **9** |
| Esperas estructuradas del caso preservadas        |     **4** |
| Clases de escalamiento preservadas                |     **5** |
| Disparadores de problema preservados              |     **6** |
| Estados del problema preservados                  |     **7** |
| Transiciones del problema preservadas             |     **9** |
| Estados de evidencia causal preservados           |     **4** |
| Estados de error conocido preservados             |     **4** |
| Estados de workaround preservados                 |     **5** |
| Estados de eficacia preservados                   |     **5** |
| Clases de cambio preservadas                      |     **3** |
| Estados del cambio preservados                    |    **10** |
| Niveles de riesgo del cambio preservados          |     **4** |
| Estados de aprobación del cambio preservados      |     **5** |
| Resultados de ejecución del cambio preservados    |     **4** |
| Códigos de cierre del cambio preservados          |     **4** |
| Perfiles cualitativos de recuperación preservados |     **5** |
| Estados del ciclo de respaldo preservados         |     **9** |
| Nuevos ciclos de estado inventados                |     **0** |
| Cambios físicos                                   |     **0** |
| Cambios en requisitos de prueba                   |     **0** |

---

#### 2. Entradas canónicas conservadas

La tarea consume y conserva sin redefinir autoridad:

- `TI-UX-002`, para cola de mesa de servicio, prioridad, SLA, asignación, comunicación, validación y cierre del caso;
- `TI-UX-003`, para servicio y elemento afectados, salud, frescura, alertas, dependencias demostradas, cambios relacionados y evidencia segura;
- `TI-DOM-007`, para caso tecnológico, incidente, impacto, urgencia, prioridad, SLA, escalamiento, restauración, validación, conocimiento, cierre y reapertura;
- `TI-DOM-008`, para problema, hipótesis, causa raíz, error conocido, workaround, recurrencia, prevención y eficacia;
- `TI-DOM-009`, para cambio tecnológico, clases, riesgo, aprobación, ventana, prueba, ejecución, rollback y revisión posterior;
- `TI-DOM-010`, para señales, salud, alertas, logs y observabilidad;
- `TI-DOM-011`, para respaldo, restauración, recuperación técnica y handoff hacia continuidad empresarial;
- `TI-DOM-013`, para conocimiento, runbooks, capacitación y adopción;
- `TI-AUTH-001` a `TI-AUTH-004`, para segregación, privilegio, configuración protegida y evidencia sensible;
- `VPROC-0058`, como proceso propietario de solicitudes e incidentes tecnológicos;
- `VPROC-0059`, como proceso separado de acceso tecnológico;
- `VPROC-0062`, como proceso separado de continuidad empresarial;
- NEXO, como autoridad del activo físico, ubicación, custodia, mantenimiento físico, garantía y ciclo de vida cuando corresponda;
- BLOQUE T, E5, R y U, como autoridades posteriores de pruebas, release, implementación, migraciones, readiness, piloto y certificación;
- `NOTIFY-ARC`, `EVID-ARC`, `QUEUE-ARC` y `PRINT-ARC`, cuando sus servicios participen en comunicación, evidencia, trabajos asíncronos o impresión.

La interfaz no convierte una proyección en fuente autoritativa y no cambia el propietario del objeto por mostrarlo en VISO.

---

#### 3. Problema de experiencia que se cierra

Sin una experiencia integrada, un operador técnico puede ver un ticket, una alerta, un dispositivo o un cambio como objetos aislados y perder la secuencia real:

```text
QUÉ FALLÓ
→ QUÉ SERVICIO Y ELEMENTO ESTÁN AFECTADOS
→ QUÉ ESTÁ CONFIRMADO Y QUÉ ES HIPÓTESIS
→ QUÉ SE ESTÁ HACIENDO PARA RESTAURAR
→ SI EXISTE UN PROBLEMA DE CAUSA O RECURRENCIA
→ SI HAY UN CAMBIO NECESARIO O EN CURSO
→ SI EXISTE MANTENIMIENTO FÍSICO O TÉCNICO RELACIONADO
→ SI SE REQUIERE RECUPERACIÓN
→ QUÉ VALIDACIÓN FALTA
→ QUÉ PENDIENTES CONTINÚAN DESPUÉS DE RESTAURAR
```

`TI-UX-004` resuelve esa fragmentación sin fusionar objetos ni ciclos.

Regla de experiencia:

```text
CORRELACIONAR
≠
FUSIONAR
```

y:

```text
VER TODO LO RELACIONADO
≠
PODER MODIFICAR TODO LO RELACIONADO
```

---

#### 4. Arquitectura de información

La experiencia administrativa de VISO se organiza conceptualmente en una superficie de **Operación TI** con cinco vistas de trabajo:

- **Incidentes**
- **Problemas**
- **Cambios**
- **Mantenimiento**
- **Recuperación**

Estas vistas son lentes sobre objetos canónicos relacionados. No obligan a crear una dirección web, menú, tabla o módulo físico en esta fase.

La composición de escritorio utiliza tres zonas:

1. **Lista de trabajo:** elementos que requieren atención del actor.
2. **Expediente principal:** ciclo, estado, siguiente acción, decisiones y evidencia del objeto seleccionado.
3. **Contexto correlacionado:** servicio, elemento, salud, dependencias, incidentes, problemas, cambios, mantenimiento, recuperación, proveedor y continuidad relacionados según autorización.

La interfaz prioriza el trabajo actual y la siguiente acción. Métricas, historial amplio, configuración y evidencia avanzada permanecen en segundo nivel.

---

#### 5. Regla de entrada y preservación de contexto

Los flujos pueden abrirse desde:

- un caso de `TI-UX-002`;
- un elemento o servicio de `TI-UX-003`;
- una alerta accionable;
- un problema existente;
- un cambio;
- una intervención de mantenimiento;
- una solicitud de recuperación;
- un handoff documentado desde otro dominio autorizado.

Al cruzar entre lentes se conserva, cuando exista:

```text
objeto_origen
servicio
elemento
sede
área
ambiente
estado
salud_y_frescura
caso_relacionado
problema_relacionado
cambio_relacionado
evidencia
actor_efectivo
alcance_autorizado
```

El cruce no hereda autorización. Cada acción se resuelve nuevamente bajo su autoridad.

---

#### 6. Cabecera común del expediente

Todo expediente visible en estas cinco lentes muestra primero:

- tipo de objeto;
- referencia estable;
- título humano;
- estado canónico y etiqueta humana;
- servicio afectado;
- elemento o alcance técnico cuando esté demostrado;
- sede, área o ambiente cuando sean pertinentes;
- propietario o responsable actual;
- siguiente acción;
- bloqueo o espera actual;
- última actualización material;
- salud y frescura cuando exista evidencia;
- relaciones activas con otros flujos;
- indicador de información sensible restringida cuando corresponda.

No se muestran como cabecera primaria:

- IP completa;
- topología detallada;
- payloads;
- logs;
- secretos;
- tokens;
- credenciales;
- datos personales innecesarios;
- hipótesis como si fueran hechos;
- métricas decorativas que compitan con la acción.

---

#### 7. Línea de tiempo común

La línea de tiempo separa visualmente:

- hecho observado;
- señal técnica;
- decisión;
- acción ejecutada;
- resultado;
- comunicación;
- validación;
- handoff;
- evidencia añadida.

Cada entrada muestra fuente, actor o principal técnico cuando aplique, momento observado y momento recibido cuando sean distintos, y relación con el objeto propietario.

La interfaz diferencia:

```text
HECHO CONFIRMADO
≠
HIPÓTESIS
≠
DECISIÓN
≠
ACCIÓN
≠
RESULTADO
```

Una corrección histórica se presenta como nueva entrada o revisión. No se reescribe silenciosamente la línea de tiempo.

---

#### 8. Flujo de incidente

El incidente se opera dentro del caso de `VPROC-0058`. `TI-UX-004` no crea una segunda identidad de incidente.

La vista de incidente enfatiza:

1. impacto y alcance actual;
2. prioridad y SLA provenientes de `TI-UX-002`;
3. servicio y elementos afectados;
4. salud y evidencia fresca;
5. owner y nivel de atención;
6. estrategia actual de restauración;
7. workaround cuando exista;
8. cambios, problemas, proveedores y recuperación relacionados;
9. próxima comunicación;
10. validación pendiente;
11. deuda que continuará después de restaurar.

La pantalla debe responder rápidamente:

```text
¿QUÉ ESTÁ AFECTADO?
¿QUÉ FUNCIONA?
¿QUÉ ESTAMOS HACIENDO AHORA?
¿QUÉ BLOQUEA?
¿CUÁNDO ES LA PRÓXIMA ACTUALIZACIÓN?
¿QUÉ NECESITA VALIDACIÓN?
```

---

#### 9. Estados del incidente en la experiencia

Se preservan exactamente los nueve estados de `VPROC-0058`.

| Estado canónico             | Etiqueta humana de VISO       | Foco principal                                     |
| --------------------------- | ----------------------------- | -------------------------------------------------- |
| `TECH_CASE_REPORTED`        | Reportado                     | completar entrada y contexto                       |
| `TRIAGE_IN_PROGRESS`        | En triage                     | clasificar, resolver alcance inicial e impacto     |
| `PRIORITIZED`               | Priorizado                    | confirmar owner, SLA y siguiente acción            |
| `DIAGNOSIS_IN_PROGRESS`     | En diagnóstico                | trabajar con evidencia y dependencias              |
| `WORKAROUND_APPLIED`        | Workaround aplicado           | comprobar efecto, riesgo y vigencia                |
| `RESOLUTION_IN_PROGRESS`    | Resolución en curso           | ejecutar trabajo autorizado y restaurar            |
| `USER_VALIDATION_PENDING`   | Esperando validación          | comprobar que el resultado volvió                  |
| `KNOWLEDGE_CAPTURE_PENDING` | Cierre técnico en preparación | transferir conocimiento y pendientes               |
| `TECH_CASE_CLOSED`          | Cerrado                       | mostrar cierre, resultado y relaciones posteriores |

La etiqueta humana no sustituye el estado canónico ni crea otra máquina de estados.

---

#### 10. Esperas y bloqueos del incidente

Las cuatro esperas estructuradas se muestran como bloque visible, nunca como texto libre enterrado:

| Condición                    | Presentación                     | Información obligatoria                          |
| ---------------------------- | -------------------------------- | ------------------------------------------------ |
| `WAITING_REQUESTER_INFO`     | Esperando información solicitada | pregunta exacta, destinatario y fecha            |
| `WAITING_REQUIRED_APPROVAL`  | Esperando aprobación necesaria   | decisión, autoridad y alcance                    |
| `PLANNED_WINDOW_NOT_STARTED` | Esperando ventana programada     | inicio, zona horaria y condición                 |
| `WAITING_EXTERNAL_PROVIDER`  | Esperando proveedor              | caso externo, owner interno y próximo compromiso |

La interfaz no presenta una espera como ausencia de responsable y no oculta incumplimientos de SLA.

---

#### 11. Escalamiento desde el incidente

Se preservan cinco clases:

- `ESC_FUNCTIONAL`
- `ESC_TECHNICAL`
- `ESC_PROVIDER`
- `ESC_SECURITY`
- `ESC_CONTINUITY`

La acción de escalar abre una vista de handoff con:

- origen;
- destino;
- motivo;
- pendientes;
- evidencia;
- fecha objetivo;
- aceptación del receptor;
- comunicación requerida.

La reasignación no se muestra como completada hasta que el receptor acepta cuando el contrato lo exige.

---

#### 12. Incidente mayor

`MAJOR_INCIDENT` se muestra como marcador reforzado sobre el incidente, no como un proceso separado.

La vista de coordinación añade un panel persistente con:

- inicio del incidente;
- servicios afectados;
- alcance empresarial conocido;
- alcance todavía desconocido;
- prioridad;
- coordinador;
- estado de operación mínima;
- workaround o contención;
- cambios de emergencia relacionados;
- estado de recuperación técnica;
- evaluación de continuidad;
- última comunicación;
- próxima actualización;
- línea de tiempo resumida.

El diagnóstico sensible permanece separado de la comunicación operativa.

La vista nunca declara causa definitiva antes de confirmación ni presenta `RECOVERY` de una señal como cierre del incidente.

---

#### 13. Restauración, validación y cierre del incidente

La interfaz muestra hitos separados:

```text
CONTENCIÓN
→ WORKAROUND
→ RESTAURACIÓN TÉCNICA
→ VALIDACIÓN
→ CONOCIMIENTO / HANDOFF
→ CIERRE
```

Un botón o acción de cierre no aparece como acción ordinaria mientras falte restauración o fulfillment, validación, conocimiento aplicable o aceptación de pendientes.

En `USER_VALIDATION_PENDING` se hace visible:

- qué debe validar;
- quién puede validar;
- evidencia disponible;
- opción de validación positiva;
- opción de validación negativa;
- impacto de la respuesta.

Una validación negativa devuelve el trabajo a resolución. El silencio no se presenta como aceptación.

---

#### 14. Handoff incidente → problema

La interfaz ofrece el handoff a problema cuando existe al menos uno de los seis disparadores canónicos:

1. recurrencia material;
2. incidentes con síntoma o dependencia compartida;
3. causa desconocida después de restaurar;
4. workaround temporal recurrente;
5. incidente relacionado con cambio que requiere análisis causal;
6. incumplimiento del guardrail de recurrencia.

El handoff muestra:

- disparador;
- incidentes relacionados;
- evidencia inicial;
- servicio y elementos;
- patrón observado;
- pregunta causal todavía abierta;
- responsable propuesto según autoridad.

No presenta el problema como creado automáticamente por duración, prioridad o similitud de texto.

---

#### 15. Flujo de problema

La vista de problema se divide en seis zonas de trabajo:

1. **Enunciado y alcance**
2. **Incidentes y recurrencia**
3. **Hipótesis y evidencia**
4. **Causa, error conocido y workaround**
5. **Acciones preventivas**
6. **Eficacia y cierre**

La cabecera evita una falsa certeza: mientras no exista causa confirmada, la interfaz utiliza lenguaje como **“causa en investigación”** y mantiene visible la evidencia contradictoria.

---

#### 16. Estados del problema

Se preservan exactamente siete estados.

| Estado                   | Etiqueta humana        | Acción dominante                      |
| ------------------------ | ---------------------- | ------------------------------------- |
| `IDENTIFIED`             | Identificado           | aceptar alcance y owner               |
| `ANALYSIS_IN_PROGRESS`   | Análisis en curso      | comparar hipótesis y evidencia        |
| `CAUSE_CONFIRMED`        | Causa confirmada       | definir prevención                    |
| `PREVENTION_PLANNED`     | Prevención planificada | aceptar acciones y responsables       |
| `PREVENTION_IN_PROGRESS` | Prevención en curso    | seguir acciones propietarias          |
| `EFFECTIVENESS_REVIEW`   | Evaluando eficacia     | observar resultado posterior          |
| `CLOSED`                 | Cerrado                | conservar resultado y riesgo residual |

Las nueve transiciones aprobadas permanecen gobernadas por `TI-DOM-008`; la interfaz no añade atajos.

---

#### 17. Panel de hipótesis y causalidad

Cada hipótesis aparece como una tarjeta versionada con:

- enunciado;
- alcance;
- autor;
- observaciones esperadas;
- evidencia compatible;
- evidencia contradictoria;
- prueba o comparación;
- revisión;
- estado de evidencia;
- razón de decisión.

Estados de evidencia:

- `HYPOTHESIS`
- `SUPPORTED`
- `CONFIRMED`
- `REFUTED`

La interfaz impide visualmente estas equivalencias:

```text
CORRELACIÓN TEMPORAL = CAUSA
```

```text
CAMBIO CERCANO EN EL TIEMPO = CULPABLE
```

```text
WORKAROUND FUNCIONÓ = CAUSA CONFIRMADA
```

Esas equivalencias se muestran como inválidas.

---

#### 18. Relación incidente ↔ problema

Los cuatro vínculos canónicos se muestran explícitamente:

- `PRIMARY_CAUSAL_CANDIDATE`
- `CONTRIBUTING_RELATION`
- `RECURRENCE_INSTANCE`
- `POST_INCIDENT_FINDING`

La tarjeta del incidente muestra el tipo de relación, no solo un enlace genérico.

Un vínculo causal candidato nunca se representa con el mismo tratamiento visual que una causa confirmada.

---

#### 19. Error conocido y workaround

El problema puede mostrar un **error conocido** únicamente bajo el contrato de `TI-DOM-008`.

Estados del error conocido:

- `DRAFT`
- `ACTIVE`
- `SUPERSEDED`
- `RETIRED`

Estados del workaround:

- `DRAFT`
- `VALIDATED`
- `ACTIVE`
- `SUSPENDED`
- `RETIRED`

La interfaz muestra siempre:

- alcance;
- versión;
- precondiciones;
- contraindicaciones;
- riesgo;
- autorización requerida;
- resultado esperado;
- método de validación;
- vigencia;
- revisión;
- owner.

`DRAFT` nunca aparece como recomendación operativa y `ACTIVE` nunca concede permisos.

---

#### 20. Recurrencia y prevención

La experiencia de problema ofrece una vista de recurrencia basada en las señales canónicas:

- mismo servicio y firma de síntoma;
- mismo componente o dependencia;
- mismo código o firma de error verificable;
- mismo cambio o familia de versión;
- reutilización del mismo workaround;
- reapertura o validación negativa repetida;
- mismo proveedor o dependencia externa;
- patrón temporal, carga, sede o contexto con evidencia adicional.

Los niveles visibles son:

- `RECURRENCE_SIGNAL`
- `RECURRENCE_CORRELATED`
- `RECURRENCE_CONFIRMED`

No se define un umbral universal de cantidad o tiempo.

Las acciones preventivas permanecen ligadas a su autoridad: cambio, hardware, proveedor, monitoreo, recuperación, conocimiento o proceso.

---

#### 21. Eficacia y cierre del problema

Los cinco estados de eficacia se muestran separados del estado del problema:

- `NOT_READY`
- `OBSERVING`
- `EFFECTIVE`
- `INEFFECTIVE`
- `INCONCLUSIVE`

La vista de eficacia muestra:

- criterio de éxito;
- ventana de observación;
- evidencia recogida;
- recurrencias durante la ventana;
- health relevante;
- validación del proceso;
- efectos adversos;
- decisión.

Un cambio exitoso no marca automáticamente `EFFECTIVE`.

Los códigos de cierre disponibles bajo autoridad son:

- `PREVENTION_EFFECTIVE`
- `DUPLICATE_MERGED`
- `INVALIDATED_BY_EVIDENCE`
- `RISK_ACCEPTED_BY_AUTHORIZED_OWNER`

La aceptación de riesgo no puede ejecutarla unilateralmente el técnico.

---

#### 22. Handoff problema → cambio

Cuando una causa confirmada o acción preventiva requiere modificación tecnológica, el problema muestra:

```text
CHANGE_REQUIRED
```

como relación pendiente.

El handoff incluye:

- causa o condición;
- objetivo preventivo;
- servicios y elementos;
- riesgo;
- evidencia;
- criterio de éxito;
- restricciones;
- relación con incidentes;
- propietario de la acción.

El problema continúa visible hasta conocer el resultado y la eficacia posterior del cambio.

---

#### 23. Flujo de cambio

La vista de cambio organiza el expediente en:

1. motivo y origen;
2. alcance y elementos afectados;
3. clase y riesgo;
4. estado anterior y estado propuesto;
5. dependencias;
6. aprobación;
7. ventana;
8. plan de prueba;
9. rollback;
10. ejecución;
11. validación;
12. revisión posterior;
13. cierre.

Las clases preservadas son:

- `STANDARD`
- `NORMAL`
- `EMERGENCY`

La clase aparece junto al riesgo; no se usa como sustituto del riesgo.

---

#### 24. Estados del cambio

Se preservan exactamente diez estados:

| Estado                       | Etiqueta humana            |
| ---------------------------- | -------------------------- |
| `DRAFT`                      | Borrador                   |
| `ASSESSMENT_IN_PROGRESS`     | En evaluación              |
| `APPROVAL_PENDING`           | Esperando aprobación       |
| `APPROVED`                   | Aprobado                   |
| `SCHEDULED`                  | Programado                 |
| `IMPLEMENTATION_IN_PROGRESS` | En implementación          |
| `VALIDATION_PENDING`         | Esperando validación       |
| `POST_IMPLEMENTATION_REVIEW` | Revisión posterior         |
| `CLOSED`                     | Cerrado                    |
| `CANCELLED`                  | Cancelado antes del efecto |

La interfaz no ofrece `CANCELLED` después de producir un efecto técnico.

---

#### 25. Riesgo y aprobación de cambio

Los cuatro niveles de riesgo se muestran con explicación de la dimensión que gobierna:

- `LOW`
- `MEDIUM`
- `HIGH`
- `CRITICAL`

La vista de evaluación presenta las ocho dimensiones aprobadas:

- servicio y proceso;
- alcance;
- seguridad y autorización;
- datos y estado;
- dependencias;
- reversibilidad;
- prueba y observabilidad;
- ventana y continuidad.

Estados de aprobación:

- `NOT_READY_FOR_APPROVAL`
- `PENDING`
- `APPROVED`
- `CHANGES_REQUIRED`
- `REJECTED`

La interfaz hace visible cuando una aprobación quedó obsoleta por cambio material de alcance, riesgo, ventana, baseline o dependencia.

---

#### 26. Ventana y go/no-go

El bloque de ventana muestra:

- sede, ambiente o alcance;
- zona horaria;
- inicio;
- fin esperado;
- límite de rollback;
- etapa crítica;
- dependencias externas;
- freeze;
- conflictos;
- decisión go/no-go.

Inmediatamente antes de ejecución se presenta un checklist de readiness:

```text
APROBACIÓN VIGENTE
+ VENTANA VIGENTE
+ BASELINE DISPONIBLE
+ DEPENDENCIAS LISTAS
+ PLAN DE PRUEBA LISTO
+ ROLLBACK LISTO
+ EJECUTORES LISTOS
+ COMUNICACIÓN LISTA
```

La interfaz devuelve **NO-GO** cuando falta una condición obligatoria y muestra cuál falta.

Un cambio de emergencia puede aceptar una limitación únicamente bajo la autoridad correspondiente; la interfaz no presenta la emergencia como bypass.

---

#### 27. Ejecución y resultado del cambio

Durante implementación se muestra un registro paso a paso con:

- actor o principal;
- momento;
- paso;
- estado anterior;
- resultado;
- evidencia;
- desviación;
- decisión de continuar, detener o revertir.

Se preservan cuatro resultados de ejecución:

- `IMPLEMENTED`
- `ROLLED_BACK`
- `STOPPED_NO_EFFECT`
- `FAILED_OR_UNKNOWN`

Ninguno se presenta como cierre automático.

`FAILED_OR_UNKNOWN` activa un tratamiento visual de incertidumbre y exige contención, evidencia y correlación con incidente cuando pueda existir afectación.

---

#### 28. Rollback

La vista de rollback muestra, antes de ejecutar:

- estado objetivo de retorno;
- mecanismo;
- actor;
- trigger;
- punto de no retorno;
- dependencias;
- tratamiento de datos y efectos producidos;
- compatibilidad;
- evidencia de reversibilidad;
- validación posterior.

La interfaz evita un botón genérico **“Revertir”** cuando el objeto exige compensación, restauración de configuración, retorno de routing, recovery o forward-fix.

Un rollback ejecutado conserva el intento fallido y sus efectos; no borra historia.

---

#### 29. Revisión posterior y cierre del cambio

La revisión posterior muestra:

- plan original;
- ejecución real;
- desviaciones;
- evidencia;
- incidentes relacionados;
- rollback;
- baseline recuperado o nuevo estado;
- deuda;
- aprendizaje;
- nuevos handoffs.

Los cuatro códigos de cierre preservados son:

- `IMPLEMENTED_VALIDATED`
- `ROLLED_BACK_VALIDATED`
- `CANCELLED_BEFORE_EFFECT`
- `CLOSED_WITH_CONTROLLED_HANDOFF`

La última opción exige que cada deuda o riesgo tenga expediente y propietario aceptado; no puede ocultar un resultado todavía desconocido con capacidad de producir efecto.

---

#### 30. Cambio de emergencia

Cuando `change_class = EMERGENCY`, la interfaz activa una presentación reforzada que exige:

- incidente, seguridad o condición urgente relacionada;
- motivo de urgencia;
- alcance mínimo;
- autoridad aplicable;
- ejecutor;
- riesgo;
- baseline disponible;
- estrategia de rollback, contención o recuperación;
- criterio de éxito;
- criterio de detención;
- prueba posterior;
- comunicación;
- evidencia;
- revisión posterior obligatoria.

La experiencia nunca presenta **“emergencia”** como una opción para saltar aprobación, privilegio, evidencia, rollback o revisión.

---

#### 31. Flujo de mantenimiento

**Mantenimiento es una lente coordinadora, no una nueva máquina de estados canónica.**

La vista reúne intervenciones sobre activos, endpoints, redes, impresoras, periféricos y otros elementos cuando exista autoridad y evidencia, conservando:

- identidad del elemento;
- servicio dependiente;
- ubicación y custodia;
- condición o síntoma;
- owner de soporte;
- procedimiento de diagnóstico;
- nivel de mantenimiento permitido en sede;
- repuesto, sustituto o contingencia;
- configuración reproducible;
- consumible, cable, cargador, batería o pieza crítica cuando aplique;
- criterio de reparación frente a reemplazo;
- ventana;
- proveedor o garantía relacionados;
- prueba posterior;
- resultado;
- cambio relacionado cuando corresponda;
- incidente relacionado cuando exista;
- evidencia;
- pendientes y próximo control cuando provenga de una fuente autoritativa.

La vista no crea un mantenimiento genérico que compita con NEXO, garantía, proveedor o cambio.

---

#### 32. Regla mantenimiento ↔ cambio

Se fija en la experiencia:

```text
MANTENIMIENTO FÍSICO
≠
CAMBIO TECNOLÓGICO
```

pero:

```text
MANTENIMIENTO
+ MODIFICACIÓN MATERIAL DE CONFIGURACIÓN
→ CAMBIO TECNOLÓGICO REQUERIDO
```

Ejemplos que exigen correlación con cambio cuando alteran estado administrado:

- IP, DHCP, DNS, segmento o SSID;
- firmware;
- driver;
- versión o release;
- baseline;
- binding o routing;
- configuración de aplicación;
- integración;
- política de identidad o seguridad;
- configuración que afecta disponibilidad o dependencia.

Limpieza, inspección o sustitución de consumible no se convierten automáticamente en cambio si no alteran configuración administrada ni introducen otro efecto material, pero conservan el registro físico o técnico en su autoridad.

---

#### 33. Mantenimiento correctivo relacionado con incidente

Cuando una falla requiere intervención física:

```text
INCIDENTE
→ IDENTIFICA ELEMENTO
→ INTERVENCIÓN / MANTENIMIENTO
→ PRUEBA POSTERIOR
→ RESTAURACIÓN DEL SERVICIO
→ VALIDACIÓN DEL CASO
```

La intervención puede terminar mientras el incidente continúa abierto.

Si la reparación exige configuración protegida, el flujo muestra el cambio relacionado.

Si exige sustitución física, la interfaz conserva el handoff hacia NEXO y verifica que el reemplazo no herede credenciales, sesiones o datos locales de manera no autorizada.

---

#### 34. Mantenimiento preventivo y disponibilidad

La vista de mantenimiento puede mostrar trabajos programados provenientes de fuentes propietarias, pero no inventa una periodicidad.

Para un trabajo planificado se muestran:

- fuente de la necesidad;
- elemento;
- servicio afectable;
- ventana;
- riesgo de indisponibilidad;
- contingencia;
- repuesto;
- prueba posterior;
- cambios relacionados;
- comunicación;
- owner.

La fecha de mantenimiento solo es autoritativa cuando proviene de una fuente vigente. Una recomendación, garantía o hábito operativo no se presenta como plan confirmado.

---

#### 35. Flujo de recuperación técnica

La experiencia de recuperación sigue la secuencia aprobada de `TI-DOM-011`:

```text
OBJETO AUTORITATIVO
→ PERFIL DE RECUPERACIÓN
→ OBJETIVO DE CONTINUIDAD RECIBIDO
→ POLÍTICA DE PROTECCIÓN
→ CREACIÓN DE COPIA
→ VERIFICACIÓN
→ PRUEBA DE RESTAURACIÓN
→ SOLICITUD DE RECUPERACIÓN
→ AUTORIZACIÓN
→ RESTAURACIÓN AISLADA O CONTROLADA
→ VALIDACIÓN TÉCNICA
→ VALIDACIÓN EMPRESARIAL
→ RECONCILIACIÓN
→ RETORNO CONTROLADO
→ EVIDENCIA Y APRENDIZAJE
```

La secuencia se presenta como fases de trabajo y evidencia; no crea un state machine adicional.

---

#### 36. Perfiles de recuperación

Se preservan los cinco perfiles cualitativos:

| Perfil                    | Presentación                            |
| ------------------------- | --------------------------------------- |
| `RC0_SAFETY_INTEGRITY`    | Seguridad e integridad crítica          |
| `RC1_CRITICAL_OPERATION`  | Operación crítica                       |
| `RC2_IMPORTANT_OPERATION` | Operación importante                    |
| `RC3_SUPPORTING`          | Capacidad de soporte                    |
| `RC4_RECONSTRUCTIBLE`     | Reconstruible desde fuente autoritativa |

La interfaz no inventa tiempos numéricos a partir del perfil.

RTO, RPO, MTPD, MBCO u otros objetivos solo se muestran cuando existe una referencia aprobada y vigente.

---

#### 37. Estado de las copias y restaurabilidad

Cuando el flujo depende de una copia, se preservan los nueve estados:

- `SCHEDULED`
- `RUNNING`
- `COMPLETED_UNVERIFIED`
- `VERIFIED`
- `FAILED`
- `DEGRADED`
- `QUARANTINED`
- `EXPIRED`
- `DELETED`

La presentación aplica reglas estrictas:

- `COMPLETED_UNVERIFIED` se muestra como **no verificado**, nunca como listo para restaurar;
- `QUARANTINED` bloquea uso;
- `EXPIRED` no se presenta como vigente;
- `DELETED` conserva solo la evidencia permitida;
- `VERIFIED` no sustituye una prueba de restauración cuando la política la exige.

---

#### 38. Solicitud y autorización de recuperación

Antes de cualquier restauración, la vista debe mostrar:

- objeto o servicio;
- incidente, cambio o continuidad relacionados;
- motivo;
- impacto actual;
- perfil de recuperación;
- objetivo recibido;
- punto recuperable;
- integridad y verificación;
- dependencias;
- autorización;
- riesgo de sobrescritura;
- efectos externos que deben inhibirse;
- ambiente o aislamiento;
- estrategia de reconciliación;
- owner.

La interfaz no ofrece una restauración destructiva con confirmación genérica.

Una recuperación que toca Supabase, datos, Auth, Storage, Realtime, Edge Functions, secretos, migraciones o integraciones conserva los controles y paquetes propietarios; esta tarea no ejecuta ninguno.

---

#### 39. Restauración aislada y validación

Cuando sea técnicamente posible y seguro, la experiencia privilegia primero una restauración aislada o controlada.

La vista diferencia:

```text
RESTAURACIÓN EJECUTADA
≠
VALIDACIÓN TÉCNICA
≠
VALIDACIÓN EMPRESARIAL
≠
RECUPERACIÓN COMPLETA
```

La validación técnica comprueba integridad, configuración, dependencias, seguridad y health aplicables.

La validación empresarial comprueba el resultado mínimo del proceso.

Una pantalla que abre o un servicio que responde no se presenta como recuperación empresarial suficiente.

---

#### 40. Reconciliación y retorno controlado

Después de recuperar, la interfaz hace visibles:

- trabajos generados durante la interrupción;
- backlog;
- operaciones pendientes;
- duplicados potenciales;
- resultados desconocidos;
- conciliaciones;
- cambios temporales;
- contingencias activas;
- datos o documentos que deban reconstruirse;
- accesos temporales que deban terminar;
- diferencias entre estado recuperado y estado actual;
- validación de retorno al modo normal.

El retorno a operación normal exige reconciliación proporcional al proceso. No se ocultan efectos pendientes bajo la etiqueta **“recuperado”**.

---

#### 41. Recuperación técnica ↔ continuidad empresarial

La interfaz mantiene:

```text
RECUPERACIÓN TÉCNICA
≠
CONTINUIDAD EMPRESARIAL
```

VISO muestra un bloque de continuidad cuando:

- el resultado mínimo empresarial no está disponible;
- se activó un modo alterno;
- existe una sede, canal o procedimiento de contingencia;
- quedan trabajos degradados que deben reconciliarse;
- el alcance supera la coordinación ordinaria de soporte.

El expediente de continuidad conserva su identidad `VPROC-0062`.

Un servicio técnicamente restaurado puede coexistir con continuidad todavía abierta.

---

#### 42. Matriz de handoffs entre las cinco lentes

| Origen        | Condición                        | Destino       | Qué se conserva                                                |
| ------------- | -------------------------------- | ------------- | -------------------------------------------------------------- |
| Incidente     | recurrencia o causa abierta      | Problema      | caso, evidencia, servicio, elementos, patrón                   |
| Incidente     | modificación necesaria           | Cambio        | motivo, prioridad, riesgo, elementos, objetivo de restauración |
| Incidente     | intervención física              | Mantenimiento | elemento, síntoma, ubicación, owner, prueba requerida          |
| Incidente     | pérdida o corrupción recuperable | Recuperación  | alcance, impacto, objetos y punto de recuperación              |
| Problema      | prevención mediante modificación | Cambio        | causa, acción preventiva, criterio de eficacia                 |
| Problema      | control de recuperación          | Recuperación  | riesgo, objeto, criterio preventivo                            |
| Cambio        | efecto adverso                   | Incidente     | efecto, ventana, baseline, evidencia                           |
| Cambio        | rollback o restore necesario     | Recuperación  | estado objetivo, punto de retorno, datos y dependencias        |
| Mantenimiento | modificación de configuración    | Cambio        | elemento, estado anterior, intervención propuesta, prueba      |
| Mantenimiento | falla detectada                  | Incidente     | síntoma, elemento, evidencia, impacto                          |
| Recuperación  | servicio no disponible           | Incidente     | estado técnico, fallos, evidencia                              |
| Recuperación  | operación mínima no restituida   | Continuidad   | servicio mínimo, backlog, modo alterno, pendientes             |

Ningún handoff borra o convierte el objeto origen.

---

#### 43. Panel de relaciones

El panel contextual muestra relaciones por identidad y tipo, no una lista plana.

Agrupaciones:

- **Caso e incidente**
- **Problema**
- **Cambio**
- **Mantenimiento**
- **Recuperación**
- **Servicio y elementos**
- **Alertas y salud**
- **Proveedor**
- **Continuidad**
- **Conocimiento**

Cada relación indica:

- tipo;
- estado;
- owner;
- momento relevante;
- motivo de relación;
- acción disponible según autorización.

La ausencia de relación se muestra como ausencia de evidencia, no como certeza de que no existe dependencia.

---

#### 44. Integración con el mapa técnico de TI-UX-003

Desde el contexto de un flujo, el actor puede abrir el elemento o servicio correlacionado y consultar:

- clase;
- identidad;
- salud;
- frescura;
- relaciones demostradas;
- alertas;
- cambios;
- evidencia segura.

Desde el mapa puede abrir un flujo relacionado preservando el contexto.

Regla:

```text
MAPA EXPLICA DEPENDENCIAS
→ FLUJO EXPLICA TRABAJO Y DECISIONES
```

El mapa no ejecuta el flujo y el flujo no redefine el grafo.

---

#### 45. Integración con la mesa de servicio de TI-UX-002

`TI-UX-002` conserva la cola principal y las acciones ordinarias de caso.

`TI-UX-004` profundiza únicamente cuando existe trabajo especializado:

- incidente activo;
- coordinación de incidente mayor;
- análisis de problema;
- cambio;
- intervención de mantenimiento;
- recuperación.

Un operador no debe mantener datos duplicados en una pantalla de cola y otra de flujo. La lista de TI-UX-002 proyecta el estado propietario del expediente especializado.

---

#### 46. Seguridad, autorización y minimización

La experiencia aplica:

```text
VISIBILIDAD
≠
AUTORIDAD DE ACCIÓN
```

y:

```text
DIAGNÓSTICO
≠
ACCESO ILIMITADO
```

Reglas:

1. logs sensibles permanecen ocultos hasta autorización compatible;
2. la vista primaria usa resúmenes minimizados;
3. secretos no aparecen en timeline, cambio, mantenimiento, recovery o conocimiento;
4. evidencia sensible se referencia;
5. proveedor recibe solo contexto autorizado;
6. soporte remoto no hereda permisos del trabajador;
7. cambio aprobado no concede sesión privilegiada;
8. prioridad crítica no amplía acceso;
9. exportar o capturar evidencia es acción distinta de verla;
10. el historial de autorización permanece auditable.

---

#### 47. Acciones peligrosas y confirmación reforzada

Las siguientes acciones, cuando sean materializadas en una fase posterior, no usan confirmación genérica:

- aplicar configuración;
- ejecutar cambio;
- iniciar rollback;
- retirar capacidad;
- restaurar sobre un destino;
- retornar un objeto recuperado a operación;
- aceptar riesgo;
- cerrar un incidente mayor;
- cerrar un problema por riesgo aceptado.

La experiencia previa a la acción muestra:

- objeto exacto;
- alcance;
- estado actual;
- estado esperado;
- autoridad;
- impacto;
- dependencias;
- evidencia requerida;
- reversibilidad;
- próximo paso.

La implementación real de controles pertenece a sus tareas y paquetes propietarios.

---

#### 48. Estados desconocidos, evidencia obsoleta y contradicción

Se diseñan explícitamente cuatro condiciones de incertidumbre:

1. **Sin evidencia:** no existe dato suficiente.
2. **Evidencia obsoleta:** existe dato pero su frescura no permite confiar.
3. **Evidencia contradictoria:** fuentes válidas discrepan.
4. **Resultado desconocido:** una acción pudo producir efecto, pero no existe confirmación suficiente.

Ninguna se transforma en verde o éxito por defecto.

La interfaz muestra:

- qué falta;
- fuente;
- última observación;
- owner;
- acción segura;
- bloqueo;
- condición para resolver.

---

#### 49. Concurrencia y actualización del expediente

Cuando otro actor modifica el objeto mientras se edita:

- el borrador no se pierde;
- la interfaz muestra qué cambió;
- acciones con estado obsoleto se bloquean;
- el actor revisa la nueva versión;
- aprobación y autoridad se recalculan cuando corresponde;
- no se sobrescribe una revisión más reciente;
- reintentos no duplican efectos.

Un cambio, rollback o recuperación no se ejecuta sobre una versión de contexto que dejó de ser válida.

---

#### 50. Degradación, pérdida de conexión y reanudación

La superficie administrativa distingue:

- cargando;
- sin conexión;
- dato cacheado;
- pendiente local no autoritativo;
- guardado confirmado;
- conflicto;
- error;
- acción bloqueada.

Una pérdida de conexión nunca permite:

- cerrar un caso autoritativamente;
- aprobar un cambio;
- declarar rollback;
- declarar recuperación;
- aceptar riesgo;
- modificar configuración.

Si una futura implementación conserva borradores locales, la interfaz declara que son borradores hasta confirmación del servidor.

---

#### 51. Accesibilidad y densidad

La experiencia está diseñada para escritorio administrativo, pero conserva comportamiento accesible:

- estado expresado por texto, no solo color;
- foco visible;
- navegación por teclado;
- tablas con encabezados y lectura ordenada;
- stepper con estado textual;
- timeline con orden semántico;
- relaciones comprensibles sin depender de líneas visuales;
- confirmaciones con objeto y consecuencia explícitos;
- contenido sensible no expuesto mediante tooltip accidental;
- gráficos siempre acompañados por representación textual equivalente;
- densidad progresiva: resumen primero, detalle técnico bajo demanda.

---

#### 52. Reconciliación AS-IS

La evidencia actual demuestra una base parcial de soporte y no una implementación transversal completa de los cinco flujos.

| Superficie                             | Estado observado o documental                                                     | Decisión de TI-UX-004                                                  |
| -------------------------------------- | --------------------------------------------------------------------------------- | ---------------------------------------------------------------------- |
| `support_tickets` / `support_messages` | soporte básico existente                                                          | no reinterpretar como problema, cambio, mantenimiento o recuperación   |
| Mesa de servicio completa en VISO      | no demostrada integralmente en las fuentes inspeccionadas                         | diseño queda especificado; implementación futura                       |
| Problema con identidad propia          | no materializado físicamente en la fundación de soporte revisada                  | no reutilizar `category` ni descripción libre como problema            |
| Cambio tecnológico transversal         | no demostrada persistencia dedicada en las fuentes revisadas                      | conservar diseño y handoff; implementación posterior                   |
| Mantenimiento físico                   | existe autoridad distribuida en activos, perfiles técnicos y fuentes propietarias | VISO coordina; no crea maestro físico                                  |
| Recovery técnico transversal           | contrato documental especificado                                                  | no afirmar restore, failover o recuperación desplegados por esta tarea |
| Observabilidad transversal             | contrato documental especificado; implementación completa no demostrada           | consumir health y señales cuando existan, conservar `UNKNOWN`          |
| Implementación de controles            | fuera del alcance de la fase                                                      | no realizar cambios físicos                                            |

La ausencia de una superficie dedicada en la evidencia inspeccionada no se utiliza como prueba de ausencia absoluta de capacidades externas o manuales; únicamente impide presentarlas como implementación canónica demostrada.

---

#### 53. Frontera con TI-UX-005

`TI-UX-004` puede mostrar referencia a proveedor, garantía, contrato, licencia, renovación o costo únicamente como contexto relacionado.

`TI-UX-005` conserva el diseño de:

- catálogo y detalle de aplicaciones;
- proveedores;
- licencias;
- asientos;
- contratos;
- renovaciones;
- uso;
- costos;
- garantías como gobierno económico o contractual.

Un incidente o mantenimiento no se convierte en pantalla de procurement.

---

#### 54. Frontera con TI-UX-006

`TI-UX-004` muestra:

- referencia a runbook;
- workaround activo;
- guía aplicable;
- conocimiento relacionado;
- advertencia de versión.

`TI-UX-006` conserva:

- diagnóstico guiado;
- base de conocimiento;
- navegación contextual de artículos;
- capacitación;
- entrenamiento por rol;
- adopción.

Esta tarea no construye un editor de conocimiento ni un asistente de diagnóstico completo.

---

#### 55. Frontera con implementación

La decisión documental de esta tarea no autoriza:

- crear nuevas pantallas productivas;
- crear persistencia de problemas o cambios;
- modificar `support_tickets`;
- crear enums;
- ejecutar cambios de configuración;
- realizar mantenimiento físico;
- desplegar software;
- crear jobs de backup;
- ejecutar restore;
- cambiar red, endpoints o impresoras;
- alterar proveedores;
- modificar Supabase.

Si el alcance físico de tecnología resulta incluido por la autoridad de implementación del carril prioritario, los paquetes propietarios deberán consumir este diseño y sus contratos de dominio.

---

#### 56. Pendientes y destinos exactos

| Pendiente                                              | Estado             | Propietario                                                             | Condición de salida                                       |
| ------------------------------------------------------ | ------------------ | ----------------------------------------------------------------------- | --------------------------------------------------------- |
| implementación de la superficie VISO para estos flujos | `FUERA_DE_ALCANCE` | etapa de implementación que resulte autorizada en el carril prioritario | alcance físico aprobado, implementación y pruebas         |
| persistencia de problema                               | `FUERA_DE_ALCANCE` | paquete VISO / modelo E3 autorizado                                     | identidad, relaciones, estados y evidencia materializados |
| persistencia de cambio                                 | `FUERA_DE_ALCANCE` | paquete VISO + BLOQUE T y autoridad de datos cuando aplique             | expediente de cambio materializado sin conflar release    |
| integración con activos y mantenimiento                | `FUERA_DE_ALCANCE` | NEXO + integraciones TI propietarias                                    | relaciones demostradas y acciones bajo autoridad          |
| telemetría y salud runtime                             | `FUERA_DE_ALCANCE` | `TI-INT-001` a `TI-INT-003` y paquetes propietarios                     | señales, frescura y health disponibles con evidencia      |
| recovery técnico ejecutable                            | `FUERA_DE_ALCANCE` | `TI-DOM-011`, continuidad y paquetes de implementación                  | restore/recovery implementados y probados                 |
| protección física de acciones sensibles                | `FUERA_DE_ALCANCE` | AUTH + paquetes propietarios                                            | enforcement servidor y auditoría implementados            |
| runbooks y diagnóstico guiado                          | `FUERA_DE_ALCANCE` | `TI-UX-006` + `TI-DOM-013`                                              | contenido versionado y experiencia aprobada               |

No queda pendiente narrativo sin propietario y condición de salida.

---

#### 57. Cobertura de prueba vigente consumida

La tarea consume cobertura existente que ya protege, entre otros comportamientos:

- mesa de servicio trazable con incidente, problema y cambio separados;
- problema con ciclo, causalidad, error conocido, workaround, recurrencia y eficacia;
- cambio con clases, riesgo, aprobación, ventana, prueba, rollback, ejecución y revisión posterior;
- mantenimiento, repuesto, sustitución y prueba posterior de dependencias técnicas;
- clasificación de mantenimiento dentro de soporte sin mezclarlo con otros tipos de caso;
- runbooks con recuperación, rollback y guardrails;
- restauración técnica, recuperación empresarial, conciliación y cierre como hitos distintos;
- perfil de recuperación, objetos, dependencias, orden, validación y ejercicios;
- separación entre backup, réplica, snapshot, rollback, failover, restore y recovery;
- privacidad, autorización, evidencia, observabilidad, operación degradada y continuidad.

La cobertura relevante vigente incluye `TREQ-VISO-002`, `TREQ-VISO-047`, `TREQ-VISO-048`, `TREQ-PROC-454`, `TREQ-PROC-490`, `TREQ-PROC-493`, `TREQ-PROC-495`, `TREQ-PROC-501`, `TREQ-PROC-502`, `TREQ-PROC-506`, `TREQ-PROC-781` y `TREQ-PROC-782`, además de sus relaciones existentes.

`TI-UX-004` materializa la experiencia que permite consumir esas reglas sin introducir una nueva conducta protegida.

---

#### 58. Requisitos de prueba derivados

**Resultado:** NO GENERA REQUISITOS DE PRUEBA

**Justificación:** el diseño no incorpora una regla empresarial, autorización, transición, estado, integración, persistencia, efecto técnico o riesgo verificable distinto de los contratos ya protegidos. Materializa en experiencia administrativa los ciclos y separaciones vigentes de incidente, problema, cambio, mantenimiento y recuperación, conserva sus autoridades y handoffs y deja la implementación física para los paquetes propietarios.

**Balance:** 0 creados; 0 modificados; 0 diferidos; 0 descartados; 0 obsoletos.

---

#### 59. Criterios de aceptación

- [x] se conserva la continuidad `TI-UX-003 → TI-UX-004 → TI-UX-005`;
- [x] la tarea permanece exclusivamente documental;
- [x] se diseñan exactamente cinco lentes coordinadas;
- [x] no se crea una aplicación, proceso o fuente de verdad paralela;
- [x] `VPROC-0058` permanece propietario del incidente;
- [x] `VPROC-0059` permanece separado para accesos;
- [x] `VPROC-0062` permanece separado para continuidad;
- [x] se preservan los nueve estados del incidente;
- [x] se preservan las cuatro esperas estructuradas;
- [x] se preservan las cinco clases de escalamiento;
- [x] se diseña la coordinación de incidente mayor sin crear otro proceso;
- [x] restauración, validación y cierre permanecen separados;
- [x] se preservan los seis disparadores de problema;
- [x] se preservan los siete estados y nueve transiciones del problema;
- [x] se preservan los cuatro estados de evidencia causal;
- [x] correlación temporal no se presenta como causa;
- [x] se preservan error conocido, workaround, recurrencia, prevención y eficacia;
- [x] se preservan las tres clases de cambio;
- [x] se preservan los diez estados del cambio;
- [x] se preservan los cuatro riesgos y cinco estados de aprobación;
- [x] se diseña go/no-go con las ocho condiciones aprobadas;
- [x] se preservan los cuatro resultados de ejecución;
- [x] rollback conserva estado, evidencia y efectos;
- [x] se preservan los cuatro códigos de cierre del cambio;
- [x] emergencia no funciona como bypass de aprobación o privilegio;
- [x] mantenimiento queda como lente coordinadora y no como ciclo inventado;
- [x] mantenimiento físico conserva NEXO como autoridad;
- [x] una intervención que altera configuración material exige cambio cuando corresponda;
- [x] sustitución no hereda credenciales, sesiones o datos de forma implícita;
- [x] se preserva la secuencia de recuperación técnica;
- [x] se preservan los cinco perfiles cualitativos de recuperación;
- [x] se preservan los nueve estados del ciclo de respaldo;
- [x] una copia no verificada no se presenta como restaurable;
- [x] restauración técnica y validación empresarial permanecen separadas;
- [x] reconciliación y retorno controlado son visibles;
- [x] continuidad empresarial conserva identidad separada;
- [x] se materializan handoffs entre los cinco flujos;
- [x] `TI-UX-002` conserva cola y trabajo ordinario de caso;
- [x] `TI-UX-003` conserva mapa, salud y dependencias;
- [x] `TI-UX-005` permanece únicamente reservada;
- [x] `TI-UX-006` conserva diagnóstico guiado y conocimiento;
- [x] se protege información sensible y acciones privilegiadas;
- [x] se diseñan estados de incertidumbre, evidencia obsoleta y resultado desconocido;
- [x] se diseña concurrencia sin sobrescritura silenciosa;
- [x] se diseña comportamiento seguro ante pérdida de conexión;
- [x] la reconciliación AS-IS no declara capacidades no demostradas;
- [x] todos los pendientes tienen propietario y condición de salida;
- [x] no se modifica código, datos, infraestructura ni Supabase;
- [x] no se crean ni modifican requisitos de prueba.

---

#### 60. Estado del resultado

| Resultado                                      | Estado             |
| ---------------------------------------------- | ------------------ |
| flujo de incidente                             | `ESPECIFICADO`     |
| flujo de problema                              | `ESPECIFICADO`     |
| flujo de cambio                                | `ESPECIFICADO`     |
| lente de mantenimiento                         | `ESPECIFICADO`     |
| flujo de recuperación técnica                  | `ESPECIFICADO`     |
| handoffs entre flujos                          | `ESPECIFICADO`     |
| integración conceptual con mesa de servicio    | `ESPECIFICADO`     |
| integración conceptual con mapa técnico        | `ESPECIFICADO`     |
| seguridad y minimización de la experiencia     | `ESPECIFICADO`     |
| reconciliación AS-IS                           | `ESPECIFICADO`     |
| implementación física en VISO                  | `FUERA_DE_ALCANCE` |
| persistencia física nueva                      | `FUERA_DE_ALCANCE` |
| ejecución de cambios, mantenimiento o recovery | `FUERA_DE_ALCANCE` |
| cambios Supabase                               | `NO_APLICA`        |

---

#### 61. Invariantes

1. incidente no equivale a problema;
2. problema no equivale a cambio;
3. mantenimiento no equivale a cambio;
4. backup no equivale a restore;
5. restore no equivale a recovery completa;
6. recovery técnica no equivale a continuidad empresarial;
7. restauración no equivale a cierre;
8. workaround no equivale a causa eliminada;
9. correlación no equivale a causalidad;
10. señal no equivale a incidente;
11. salud no equivale a disponibilidad empresarial;
12. evidencia obsoleta no produce estado saludable;
13. aprobación de cambio no equivale a ejecución;
14. release no equivale a cambio aprobado;
15. ejecución no equivale a validación;
16. rollback no borra efectos;
17. cambio implementado no equivale a prevención eficaz;
18. error conocido no equivale a corrección definitiva;
19. mantenimiento físico no mueve la fuente autoritativa del activo;
20. sustitución no concede permiso ni copia credenciales;
21. recovery no inventa objetivos numéricos;
22. copia completada no equivale a copia verificable;
23. proveedor no cierra el expediente VENTO;
24. prioridad no concede privilegio;
25. la interfaz no concede autoridad por visibilidad;
26. un handoff no borra el objeto origen;
27. una relación no fusiona identidades;
28. una lista administrativa no es fuente de verdad;
29. una acción offline no se presenta como confirmada;
30. la tarea no ejecuta ninguna modificación física.

---

#### 62. Continuidad

ÚLTIMA TAREA APROBADA
`TI-UX-003 — Diseñar mapa de dispositivos, redes, impresoras, aplicaciones y salud técnica`

TAREA ACTUAL APROBADA
`TI-UX-004 — Diseñar flujos de incidente, problema, cambio, mantenimiento y recuperación`

SIGUIENTE TAREA RESERVADA
`TI-UX-005 — Diseñar gestión de aplicaciones, proveedores, licencias, contratos, renovaciones y costos`


### ✅ TI-UX-005 — Diseñar gestión de aplicaciones, proveedores, licencias, contratos, renovaciones y costos

**Estado:** APROBADA
**Tarea anterior:** `TI-UX-004 — Diseñar flujos de incidente, problema, cambio, mantenimiento y recuperación` — APROBADA
**Tarea siguiente:** `TI-UX-006 — Diseñar diagnóstico guiado, base de conocimiento y capacitación contextual sin saturación técnica` — RESERVADA
**Tipo de tarea:** documental; diseño normativo y materializado de la experiencia administrativa federada para gestionar aplicaciones y sus relaciones tecnológicas con proveedores, contratos, licencias, entitlements, asientos, uso, renovaciones, garantías y costos sin crear una fuente comercial, económica, patrimonial o de identidad paralela
**Repositorio propietario:** `vento-shell`
**Archivo propietario:** `docs/plan-canonico/modular/bloques/Z_TECNOLOGIA_Y_SOPORTE/03_EXPERIENCIA_DE_SOPORTE_Y_OPERACION_TI.md`
**Aplicación objetivo de coordinación:** VISO
**Fuentes propietarias preservadas:** SHELL para identidad de aplicación y acceso; ORIGO para proveedor, compra y contrato; NUMERA para compromiso, gasto y costo; NEXO para activo físico y garantía; dominios TI para servicio, dependencia, uso técnico, soporte, cambio, observabilidad y recuperación
**Artefactos producidos:** `TI-TECHNOLOGY-PORTFOLIO-UX-CONTRACT-001`; `TI-APPLICATION-COMMERCIAL-WORKSPACE-UX-CONTRACT-001`; `TI-RENEWAL-RIGHTSIZE-UX-CONTRACT-001`; `TI-TECHNOLOGY-COMMERCIAL-UX-RECONCILIATION-001`
**Cambios físicos autorizados:** ninguno; no crea ni modifica aplicaciones, repositorios, ambientes, proveedores, contratos, compras, licencias, entitlements, asientos, cuentas, permisos, garantías, gastos, costos, tablas, vistas, RLS, RPC, funciones, triggers, Edge Functions, migraciones, datos, integraciones, alertas, navegación desplegada ni configuración de Supabase
**Requisitos de prueba creados o modificados:** 0

---

#### 1. Propósito

Diseñar cómo una persona autorizada para administrar tecnología puede entender y conducir desde VISO el portafolio tecnológico de VENTO sin tener que reconstruir manualmente información dispersa entre aplicaciones, compras, proveedores, activos y hechos económicos, y sin convertir VISO en una segunda fuente de verdad.

La experiencia deberá responder, para cualquier aplicación o capacidad tecnológica:

```text
¿QUÉ APLICACIÓN O SERVICIO ESTOY REVISANDO?
¿QUÉ AMBIENTE, DEPENDENCIA Y PROVEEDOR PARTICIPAN?
¿QUÉ ESTÁ DEMOSTRADO Y QUÉ SIGUE PENDIENTE DE EVIDENCIA?
¿QUÉ CONTRATO, LICENCIA, ENTITLEMENT O ASIENTO APLICA?
¿QUÉ USO REAL PUEDE DEMOSTRARSE Y PARA QUÉ PERIODO?
¿QUÉ RENOVACIÓN O VENTANA CONTRACTUAL REQUIERE DECISIÓN?
¿QUÉ GARANTÍA O SOPORTE CUBRE EL ELEMENTO CUANDO APLICA?
¿QUÉ COSTO ESTÁ RECONCILIADO CON SU FUENTE ECONÓMICA?
¿QUÉ CAPACIDAD EMPRESARIAL SE AFECTA SI SE REDUCE O RETIRA?
¿QUÉ ACCIÓN PERTENECE A VISO Y CUÁL DEBE CONTINUAR EN SU FUENTE PROPIETARIA?
```

La tarea diseña una experiencia de coordinación, análisis y decisión. No diseña un ledger económico, un maestro paralelo de proveedores, un sistema alterno de compras, una nueva identidad de aplicaciones ni una consola de secretos.

---

#### 2. Resultado sustantivo

Se materializa una experiencia administrativa completa con el siguiente balance:

| Elemento                                                     |                   Resultado |
| ------------------------------------------------------------ | --------------------------: |
| Aplicación de coordinación administrativa                    |                **1 — VISO** |
| Aplicaciones canónicas preservadas                           |                **10 de 10** |
| Familias externas técnicas heredadas                         |                  **5 de 5** |
| Aplicaciones web con hosting aún no demostrado               |                  **7 de 7** |
| Estados de licencia preservados                              |                  **7 de 7** |
| Modelos normalizados de licencia o entitlement preservados   |                  **7 de 7** |
| Resultados posibles de decisión de renovación preservados    |                  **7 de 7** |
| Estados documentales de garantía preservados                 |                  **5 de 5** |
| Modalidades descriptivas de costo tecnológico preservadas    |                  **9 de 9** |
| Niveles de evidencia comercial presentados de forma separada |                  **6 de 6** |
| Fuentes propietarias explícitamente diferenciadas            | **5 familias de autoridad** |
| Cambios físicos                                              |                       **0** |
| Requisitos de prueba nuevos o modificados                    |                       **0** |

Se diseñan seis modos principales de trabajo dentro de la misma superficie administrativa:

1. **Portafolio de aplicaciones**;
2. **Proveedores y contratos**;
3. **Licencias, entitlements y uso**;
4. **Renovaciones y rightsizing**;
5. **Garantías y soporte**;
6. **Costos y conciliación**.

Los seis modos son proyecciones coordinadas del mismo conjunto de relaciones. No crean seis catálogos independientes.

---

#### 3. Entradas y autoridades conservadas

La tarea consume y preserva sin redefinir:

- `TI-DOM-006`, incluidas las diez aplicaciones canónicas, los ambientes, las dependencias, las cinco familias externas observadas, los siete hostings no demostrados y la criticidad derivada por instancia;
- `TI-DOM-012`, incluido el gobierno de proveedor, producto o plan, contrato, suscripción, licencia, entitlement, asiento, cuenta, garantía, renovación, uso y costo;
- `TI-DOM-001`, especialmente `TI-SERVICE-005 — Aplicaciones, ambientes y proveedores tecnológicos` y `TI-SERVICE-010 — Licencias, garantías, contratos y costos tecnológicos`;
- `TI-DOM-007` y `TI-UX-002` para soporte, caso tecnológico, prioridad, SLA interno y escalamiento;
- `TI-DOM-009` y `TI-UX-004` para cualquier modificación tecnológica producida por cambio de plan, proveedor, capacidad, tenant, autenticación, ambiente o integración;
- `TI-DOM-010` para señales y alertas de vencimiento, utilización, costo, proveedor y garantía cuando exista implementación autorizada;
- `TI-DOM-011` para exportabilidad, recuperación y salida del proveedor;
- `TI-UX-003` para mapa técnico, salud, dependencia y evidencia técnica de aplicaciones y servicios;
- `TI-AUTH-001` a `TI-AUTH-004` para segregación, privilegio, configuración protegida, proveedores y evidencia sensible;
- SHELL como autoridad de identidad canónica de aplicación, sesión, autorización y registro de aplicaciones;
- ORIGO como autoridad de proveedor, compra, contrato y condición comercial;
- NUMERA como autoridad de compromiso, gasto, costo, periodo, centro de costo y conciliación económica;
- NEXO como autoridad de activo físico, compra relacionada, garantía, mantenimiento y retiro;
- el propietario funcional como autoridad de la necesidad empresarial y del efecto de retirar o conservar una capacidad;
- la experiencia administrativa general de E2, que exige vistas expertas para comparación y alto volumen, revisión guiada para decisiones sensibles, trazabilidad de fuente y ausencia de copias competidoras.

Una proyección en VISO nunca convierte la proyección en fuente propietaria.

---

#### 4. Separaciones rectoras

La interfaz deberá mantener visibles estas separaciones:

```text
APPLICATION
≠ REPOSITORY
≠ ENVIRONMENT
≠ DEPLOYMENT
```

```text
PROVIDER
≠ PRODUCT_OR_PLAN
≠ CONTRACT
≠ SUBSCRIPTION
≠ LICENSE
≠ ENTITLEMENT
≠ SEAT
```

```text
SEAT_ASSIGNMENT
≠ ACCESS_GRANT
≠ PROVIDER_ACCOUNT
≠ ACTIVE_SESSION
```

```text
ASSIGNED
≠ USED
≠ NEEDED
≠ CRITICAL
```

```text
CATALOG_PRICE
≠ CONTRACTED_PRICE
≠ INVOICE_AMOUNT
≠ COMMITMENT
≠ PAID_AMOUNT
≠ EXPENSE
≠ ALLOCATED_COST
```

```text
WARRANTY
≠ SUPPORT_CONTRACT
≠ MAINTENANCE_PLAN
≠ ASSET_HEALTH
≠ INCIDENT
≠ REPLACEMENT_ASSET
```

```text
AUTO_RENEWAL_ENABLED
≠ BUSINESS_APPROVAL
```

```text
RIGHTSIZING_CANDIDATE
≠ AUTOMATIC_CANCEL
≠ AUTOMATIC_DOWNGRADE
```

Estas separaciones deben reflejarse en etiquetas, agrupaciones, filtros, estados y acciones; no basta con conservarlas solo en el modelo documental.

---

#### 5. Cambio frente al AS-IS y utilidad

La experiencia actual verificable ya ofrece piezas útiles, pero distribuidas:

- VISO dispone de un shell administrativo y navegación gobernada por registros, además de superficies de administración de aplicaciones y navegación;
- ORIGO dispone de catálogo de proveedores orientado a compras, con datos de contacto, estado y condición de pago;
- NUMERA dispone de captura y consulta de gastos por categoría, periodo y centro de costo;
- el catálogo tecnológico documental ya conserva identidades de aplicaciones, dependencias, familias de proveedor y estados de evidencia;
- no se ha demostrado en las fuentes revisadas una única experiencia completa que una, sin duplicar autoridad, aplicación, proveedor, contrato, entitlement, uso, renovación, garantía, costo, salida y dependencia operativa.

La mejora objetivo consiste en pasar de búsquedas y cruces manuales entre superficies a una vista federada donde:

```text
LA PERSONA EMPIEZA POR LA CAPACIDAD TECNOLÓGICA
→ ENTIENDE SU ESTADO Y EVIDENCIA
→ VE QUÉ FUENTE ES AUTORITATIVA PARA CADA DATO
→ IDENTIFICA QUÉ DECISIÓN REALMENTE ESTÁ PENDIENTE
→ ABRE EL HANDOFF CORRECTO SIN REDIGITAR CONTEXTO
→ CONSERVA LA CORRELACIÓN HASTA EL RESULTADO
```

La utilidad es reducir doble digitación, renovaciones sin decisión, asientos abandonados, costos sin explicación tecnológica, cancelaciones peligrosas y afirmaciones comerciales basadas únicamente en SDK, URL, factura aislada o cuenta existente.

---

#### 6. `TI-TECHNOLOGY-PORTFOLIO-UX-CONTRACT-001`

La entrada administrativa se presentará como un portafolio de tecnología con una sola identidad visual por relación y múltiples dimensiones separadas.

Orden de lectura:

```text
PORTAFOLIO TECNOLÓGICO

1. REQUIERE DECISIÓN
   Renovaciones, evidencia insuficiente y riesgos que necesitan propietario

2. APLICACIONES Y SERVICIOS
   Qué capacidades existen y de qué dependen

3. RELACIONES COMERCIALES
   Proveedores, contratos, licencias, entitlements y soporte

4. USO Y RIGHTSIZING
   Asignación, uso demostrado, necesidad y oportunidades de revisión

5. COSTO Y CONCILIACIÓN
   Hechos económicos referenciados desde su autoridad

6. GARANTÍAS Y SALIDA
   Cobertura física, soporte, exportabilidad y retiro controlado
```

La pantalla principal no deberá comenzar por tablas contractuales densas. Primero mostrará qué requiere atención y qué está bloqueado por falta de evidencia.

---

#### 7. Resumen administrativo

La cabecera deberá poder presentar, sin inventar cifras cuando las fuentes no estén reconciliadas:

```text
TECNOLOGÍA · PORTAFOLIO

Requieren decisión
- renovaciones con decisión pendiente
- relaciones con auto-renovación conocida y revisión pendiente
- rightsizing candidates
- licencias o entitlements con anomalía

Requieren evidencia
- proveedor o hosting no demostrado
- plan o entitlement no demostrado
- costo sin reconciliación económica
- garantía sin evidencia suficiente

Riesgo operativo
- capacidad crítica con salida no demostrada
- proveedor sin propietario interno
- licencia próxima a expiración cuando exista fecha fiable
- relación comercial que puede afectar servicio

[ Aplicaciones ] [ Proveedores ] [ Licencias ] [ Renovaciones ] [ Garantías ] [ Costos ]
```

Una tarjeta solo mostrará un conteo cuando exista un denominador y una consulta reproducibles. Si no existen, mostrará el estado cualitativo y el bloqueo, no un cero ficticio.

---

#### 8. Contexto administrativo persistente

La superficie deberá hacer visible, según aplicabilidad:

```text
EMPRESA / ALCANCE EMPRESARIAL
ACTOR EFECTIVO
PERMISO APLICABLE
MOMENTO DE CORTE
FUENTES CONSULTADAS
FRESCURA O VERSION DE LA EVIDENCIA
FILTROS ACTIVOS
```

Un filtro por aplicación, proveedor o centro de costo no concede autoridad ni cambia la fuente propietaria.

La interfaz distinguirá siempre:

- contexto de consulta;
- alcance autorizado;
- selección visual;
- fuente de verdad;
- acción permitida.

---

#### 9. Portafolio de diez aplicaciones

Se preservan exactamente las diez aplicaciones canónicas y su orden:

| `app_code` | Nombre     | Foco de TI-UX-005                                                              | Decisión inicial de experiencia                                                                             |
| ---------- | ---------- | ------------------------------------------------------------------------------ | ----------------------------------------------------------------------------------------------------------- |
| `shell`    | Vento OS   | identidad, autorización, catálogo, Supabase y relación comercial por demostrar | mostrar relaciones técnicas conocidas y separar cualquier contrato, hosting o costo no demostrado           |
| `anima`    | ANIMA      | Supabase, Expo/EAS, Sentry SDK y dependencias móviles                          | distinguir configuración técnica de relación comercial; plan, uso y costo siguen sujetos a evidencia        |
| `viso`     | VISO       | administración, soporte y Supabase                                             | usar VISO como coordinador visual sin volverlo autoridad de su propia licencia, contrato o costo            |
| `nexo`     | NEXO       | activos, logística, Supabase y hosting no demostrado                           | enlazar garantías a activos reconciliados y mantener hosting/comercial pendiente cuando no exista evidencia |
| `fogo`     | FOGO       | producción, Supabase y hosting no demostrado                                   | mostrar dependencia empresarial sin convertir criticidad en etiqueta global de la aplicación                |
| `origo`    | ORIGO      | compras, proveedores, contratos y Supabase                                     | diferenciar la aplicación ORIGO de los proveedores que ORIGO administra                                     |
| `pulso`    | PULSO      | venta/POS, Supabase y hosting no demostrado                                    | presentar dependencia y costo solo desde referencias demostradas                                            |
| `numera`   | NUMERA     | hechos económicos, costos, Supabase y hosting no demostrado                    | NUMERA registra hechos económicos, pero la aplicación no se autoatribuye su propia licencia o costo         |
| `aura`     | AURA       | continuidad diferida y proveedores no confirmados                              | mostrar `PENDIENTE_DE_EVIDENCIA` y handoff a la auditoría de AURA; no fabricar proveedor o ambiente         |
| `pass`     | Vento Pass | Supabase, Expo/EAS, RevenueCat SDK y dominio cliente                           | separar SDK y producto técnico de plan, contrato, costo y derechos efectivamente demostrados                |

Control:

```text
10 esperadas
10 materializadas
0 omitidas
0 duplicadas
0 añadidas
```

La experiencia no crea otro `app_code` para ambiente, plataforma, proveedor, tenant o canal.

---

#### 10. Tarjeta mínima de aplicación

Cada aplicación deberá mostrar, cuando exista evidencia:

```text
app_code + nombre humano
estado de catálogo
alcance de roadmap
ambientes y nivel de evidencia
repositorio observado
versión de manifiesto observada
servicios y procesos dependientes
familias de proveedor relacionadas
licencia / entitlement / asiento
uso observado y periodo
próxima decisión comercial conocida
estado de costo reconciliado
soporte externo referenciado
salida o recuperación referenciada
health técnico mediante TI-UX-003
casos o cambios relacionados cuando existan
```

La tarjeta no mostrará como equivalentes:

- `active` de catálogo y servicio disponible;
- versión de manifiesto y versión desplegada;
- SDK y contrato;
- proveedor técnico y proveedor comercial reconciliado;
- licencia y acceso;
- gasto y costo de la aplicación.

---

#### 11. Detalle de aplicación — workspace federado

`TI-APPLICATION-COMMERCIAL-WORKSPACE-UX-CONTRACT-001` define cinco pestañas conceptuales dentro del detalle:

1. **Resumen** — identidad, servicios, dependencias, evidencia y decisiones pendientes;
2. **Proveedores y contratos** — relaciones externas y fuente propietaria;
3. **Licencias y uso** — entitlement, asiento, asignación, utilización y necesidad;
4. **Renovaciones y salida** — fechas demostradas, decisión, alternativas y handoffs;
5. **Costo y evidencia** — referencias económicas, soporte, garantía y auditoría.

El encabezado permanece visible y conserva:

```text
app_code
nombre
fuente de identidad
alcance de roadmap
estado de reconciliación
criticidad derivada del contexto consultado
propietario funcional
responsable técnico
último corte de evidencia
```

No se asigna una criticidad global fija a la aplicación.

---

#### 12. Fuerza de evidencia comercial

La experiencia deberá mostrar explícitamente el nivel de evidencia alcanzado por cada relación:

| Nivel | Evidencia                          | Qué permite afirmar                                 | Qué no permite afirmar                                      |
| ----- | ---------------------------------- | --------------------------------------------------- | ----------------------------------------------------------- |
| 1     | `REFERENCIA_TECNICA`               | existe una dependencia o configuración observada    | contrato, plan, costo o uso comercial                       |
| 2     | `EVIDENCIA_DE_CUENTA`              | existe una identidad o cuenta ante proveedor        | asiento, autorización empresarial o costo                   |
| 3     | `EVIDENCIA_DE_PLAN_O_ENTITLEMENT`  | existe derecho o capacidad demostrada               | necesidad, uso o costo final                                |
| 4     | `EVIDENCIA_CONTRACTUAL_COMERCIAL`  | existen términos o condición comercial demostrados  | uso efectivo o necesidad futura                             |
| 5     | `EVIDENCIA_DE_USO`                 | existe consumo o actividad demostrada en un periodo | costo, criticidad o conveniencia de renovación por sí solos |
| 6     | `EVIDENCIA_ECONOMICA_RECONCILIADA` | existe hecho económico trazado hacia la capacidad   | licencia vigente o necesidad técnica por sí solos           |

La interfaz no utilizará una única etiqueta “verificado” para esconder qué capa está realmente demostrada.

---

#### 13. Estado pendiente de evidencia

`PENDIENTE_DE_EVIDENCIA` deberá ser accionable y explicar:

```text
QUÉ DATO FALTA
POR QUÉ ES NECESARIO
QUIÉN ES LA AUTORIDAD QUE PUEDE APORTARLO
QUÉ DECISIÓN QUEDA BLOQUEADA
QUÉ EVIDENCIA PERMITIRÍA SALIR DEL ESTADO
```

Ejemplo humano:

```text
Plan comercial no demostrado
Sabemos que ANIMA utiliza Expo/EAS en su configuración técnica,
pero no existe evidencia suficiente aquí para afirmar qué plan tiene VENTO,
quién lo contrata, cuánto cuesta o cuándo renueva.

Fuente esperada: relación contractual reconciliada con ORIGO.
```

La interfaz no deberá sugerir “Plan gratuito” o “Costo $0” por ausencia de evidencia.

---

#### 14. Proveedores y contratos

La vista de proveedores deberá comenzar por relaciones tecnológicas, no por crear otro maestro de proveedores.

Cada relación proyectada deberá poder mostrar:

```text
provider_ref o identidad pendiente
familia o rol técnico
producto o plan cuando esté demostrado
aplicaciones y servicios relacionados
propietario técnico
propietario empresarial
propietario de compra o contrato
contrato_ref
subscription_ref
support_ref
sla_ref externo
account_ref sin credencial
entitlement_ref
renovación demostrada
exposición de datos
salida o exportabilidad
nivel de evidencia
estado de reconciliación
```

Las acciones sobre identidad de proveedor, compra o contrato continúan en ORIGO o en la autoridad que resulte aplicable. VISO presenta contexto, decisión y handoff.

---

#### 15. Cinco familias externas observadas

Se preservan exactamente las cinco familias reconocidas por evidencia técnica previa:

| Familia    | Alcance técnico heredado                                                   | Presentación en TI-UX-005                                                                                      |
| ---------- | -------------------------------------------------------------------------- | -------------------------------------------------------------------------------------------------------------- |
| GitHub     | repositorios actuales de nueve aplicaciones confirmadas                    | relación técnica confirmada; contrato, plan, renovación, costo y owner comercial no se afirman sin evidencia   |
| Supabase   | cliente presente en nueve repositorios confirmados y plataforma compartida | dependencia técnica visible; plan, costos, capacidad y términos comerciales permanecen independientes          |
| Expo/EAS   | ANIMA y PASS                                                               | configuración y canales de build visibles; plan/cuenta/entitlement/costo se muestran solo si se demuestran     |
| Sentry     | SDK observado en ANIMA                                                     | etiqueta `SDK observado`; no se presenta como servicio contratado o activo sin evidencia adicional             |
| RevenueCat | SDK observado en PASS                                                      | etiqueta `SDK observado`; no se presenta como producto contratado, costo o entitlement sin evidencia adicional |

Control:

```text
5 esperadas
5 materializadas
0 omitidas
0 duplicadas
0 relaciones comerciales inventadas
```

---

#### 16. Hosting no demostrado

Las siete aplicaciones web con repositorio confirmado conservan hosting `PENDIENTE_DE_EVIDENCIA`:

```text
shell
viso
nexo
fogo
origo
pulso
numera
```

La experiencia deberá mostrar el mismo patrón de bloqueo para las siete:

```text
Hosting: pendiente de evidencia

Falta demostrar:
- proveedor
- cuenta o proyecto
- propietario
- plan o condición comercial
- ambiente asociado
- renovación cuando aplique
- costo reconciliado
```

Una URL, DNS, framework, encabezado HTTP o despliegue accesible no se utilizarán como sustitutos de esa evidencia.

---

#### 17. Licencia, entitlement y asiento

La vista de licencias tendrá como unidad primaria la relación comercial-tecnológica, no la persona.

Deberá separar:

```text
PRODUCTO / PLAN
LICENCIA
ENTITLEMENT
MODELO DE ASIENTO
CANTIDAD ENTITLED
ASIGNACIONES
USO OBSERVADO
CAPACIDAD DISPONIBLE CUANDO APLIQUE
NECESIDAD EMPRESARIAL
ESTADO DE RENOVACION
COSTO REFERENCIADO
```

No todos los productos tienen asiento. La interfaz mostrará la unidad únicamente cuando el modelo demostrado la utilice.

---

#### 18. Siete estados de licencia

Se preservan sin renombrar:

| Estado                   | Presentación humana | Regla visual                                                     |
| ------------------------ | ------------------- | ---------------------------------------------------------------- |
| `PENDIENTE_DE_EVIDENCIA` | Evidencia pendiente | no usar color o iconografía de vigencia confirmada               |
| `ACTIVE`                 | Vigente             | exige evidencia suficiente de vigencia, no solo cuenta o SDK     |
| `SUSPENDED`              | Suspendida          | mostrar impacto y causa/referencia cuando esté disponible        |
| `EXPIRING`               | Próxima a expirar   | exige fecha o condición demostrada; no inventar umbral universal |
| `EXPIRED`                | Expirada            | no implica automáticamente retirada técnica o cierre contractual |
| `CANCELLED`              | Cancelada           | no implica datos eliminados, cuenta revocada o gasto conciliado  |
| `NO_APLICA`              | No aplica           | exige fundamento compatible con el producto o modelo             |

El estado se acompaña de evidencia, fuente y momento de corte.

---

#### 19. Modelos de licencia o entitlement

La experiencia conserva exactamente:

- `NAMED_USER`;
- `CONCURRENT_USER`;
- `DEVICE`;
- `ORGANIZATION_OR_TENANT`;
- `CAPACITY_OR_TIER`;
- `USAGE_BASED`;
- `HYBRID`.

La selección del modelo debe provenir de evidencia del proveedor o contrato.

La interfaz nunca forzará una tabla de “asientos” para una relación `ORGANIZATION_OR_TENANT` o `USAGE_BASED` que no utilice esa unidad.

---

#### 20. Asignaciones de asiento

Cuando exista `SEAT`, el detalle deberá permitir entender:

```text
seat_ref
license_ref
target tipo + target ref
fecha de asignación
vigencia
motivo
uso observado
estado de candidato a reclaim
estado de reconciliación
evidencia
```

Alertas de consistencia visual:

- asiento asignado sin licencia o entitlement vigente;
- target retirado o sin vínculo vigente;
- asignación simultánea incompatible con el modelo;
- asiento nominal ligado a una identidad compartida insuficiente;
- acceso revocado pero asiento todavía sin reconciliar;
- asiento liberado pero cuenta o acceso todavía activo cuando requiera revisión separada.

La corrección deberá realizarse en la autoridad aplicable y conservar historia.

---

#### 21. Cantidades y disponibilidad

Para modelos finitos reconciliados:

```text
ENTITLED
- ASSIGNED
= AVAILABLE
```

La interfaz podrá mostrar esa aritmética solo cuando:

- la cantidad contratada o reconocida esté demostrada;
- las asignaciones estén reconciliadas;
- el proveedor no aplique una regla adicional que altere disponibilidad.

Casos visuales obligatorios:

| Caso                               | Presentación                                                |
| ---------------------------------- | ----------------------------------------------------------- |
| cantidad desconocida               | `PENDIENTE_DE_EVIDENCIA`; no mostrar 0                      |
| unlimited                          | “Sin cantidad finita aplicable”; no fabricar un número alto |
| usage-based                        | mostrar unidad de consumo, no “asientos disponibles”        |
| `AVAILABLE < 0`                    | anomalía de conciliación que exige revisión                 |
| cantidad comprada mayor a asignada | capacidad disponible, no ahorro confirmado                  |
| cantidad asignada mayor a uso      | candidato de análisis, no cancelación automática            |

---

#### 22. Uso, necesidad y criticidad

La vista de uso deberá mostrar cuatro columnas conceptualmente independientes:

```text
ASIGNACIÓN
USO OBSERVADO
NECESIDAD APROBADA O JUSTIFICADA
CRITICIDAD DEL RESULTADO DEPENDIENTE
```

El uso deberá declarar:

- fuente;
- periodo;
- unidad;
- población o capacidad observada;
- frescura;
- limitaciones.

Una capacidad de contingencia puede ser necesaria aunque se use poco. Una cuenta con actividad puede ser innecesaria. Un producto muy utilizado puede seguir siendo no crítico. La interfaz no colapsará esas dimensiones en una puntuación única.

---

#### 23. Rightsizing

`TI-RENEWAL-RIGHTSIZE-UX-CONTRACT-001` presenta un candidato de revisión cuando exista evidencia suficiente de alguno de estos patrones:

- asiento asignado a identidad sin vigencia;
- capacidad persistentemente disponible por encima de la necesidad demostrada;
- capacidad contratada muy superior al consumo observado;
- producto duplicado sin justificación demostrada;
- aplicación retirada con relación comercial todavía activa;
- plan con capacidades no utilizadas y alternativa inferior potencialmente suficiente;
- facturación posterior a una cancelación documentada;
- contratos múltiples para la misma capacidad sin causa aprobada.

Cada candidato deberá mostrar:

```text
señal
fuente
periodo
capacidad afectada
impacto si se reduce
criticidad y dependencias
salida o rollback
estimación separada de ahorro, si puede calcularse
propietario de decisión
```

No existirá una acción “optimizar automáticamente”.

---

#### 24. Bandeja de renovaciones

La bandeja de renovaciones no será una simple lista de fechas. Agrupará decisiones por condición:

```text
DECISIÓN REQUERIDA
EVIDENCIA INCOMPLETA
AUTO-RENOVACIÓN CONOCIDA
RIGHTSIZING EN ANÁLISIS
SALIDA O MIGRACIÓN EN PREPARACIÓN
DECISIÓN TOMADA CON HANDOFF PENDIENTE
CONCILIACIÓN POSTERIOR PENDIENTE
```

Orden operativo sugerido, sin inventar prioridad empresarial:

1. ventana contractual demostrada cuya acción irreversible esté más próxima;
2. capacidad cuya pérdida afectaría un proceso crítico sin alternativa demostrada;
3. auto-renovación conocida sin decisión registrada;
4. inconsistencia de entitlement o asignación con riesgo operativo;
5. rightsizing y renegociación ordinarios;
6. relaciones únicamente pendientes de mejor evidencia.

El orden de bandeja es una ayuda de trabajo; no cambia criticidad, prioridad de incidente ni autoridad.

---

#### 25. Ficha de renovación

La ficha guía la decisión con doce dimensiones canónicas:

| Dimensión   | Qué debe responder la experiencia                                                  |
| ----------- | ---------------------------------------------------------------------------------- |
| Necesidad   | qué proceso, aplicación o servicio requiere la capacidad                           |
| Criticidad  | qué resultado se degrada o bloquea si se retira                                    |
| Uso         | qué consumo demostrable existe y en qué periodo                                    |
| Asientos    | qué cantidades habilitadas, asignadas, utilizadas y disponibles pueden demostrarse |
| Costo       | qué hecho económico reconciliado existe                                            |
| Contrato    | qué término, ventana y restricciones se demostraron                                |
| Soporte     | qué soporte, SLA externo o garantía se perderían                                   |
| Seguridad   | qué cuentas, secretos, datos o privilegios dependen del proveedor                  |
| Continuidad | qué fallback, recuperación o dependencia crítica existe                            |
| Salida      | cómo se exportan datos y se retiran cuentas e integraciones                        |
| Alternativa | qué opción equivalente ha sido realmente validada                                  |
| Decisión    | qué resultado documental se adopta y con qué evidencia                             |

La interfaz deberá impedir que una decisión se justifique únicamente por precio o únicamente por utilización.

---

#### 26. Siete resultados de renovación

Se preservan exactamente:

1. `RENEW`;
2. `RIGHTSIZE`;
3. `RENEGOTIATE`;
4. `MIGRATE_OR_EXIT`;
5. `CANCEL`;
6. `NO_ACTION_REQUIRED`;
7. `PENDIENTE_DE_EVIDENCIA`.

Cada decisión mostrará antes de confirmar:

```text
qué cambia
qué no cambia
quién es autoridad
dependencias afectadas
riesgo
handoffs posteriores
condiciones comerciales conocidas
evidencia utilizada
```

`PENDIENTE_DE_EVIDENCIA` es una decisión válida de no afirmar todavía, no un error de interfaz.

---

#### 27. Auto-renovación

Cuando exista evidencia de auto-renovación, el detalle deberá mostrarla con alta visibilidad junto a:

- fuente;
- fecha o condición de término cuando esté demostrada;
- ventana de cancelación cuando esté demostrada;
- propietario de decisión;
- decisión actual;
- estado del handoff comercial.

No deberá existir lenguaje como “se renovará aprobado” por el solo hecho de que el proveedor tenga auto-renovación activada.

Una renovación ocurrida sin decisión previa se muestra como hecho que requiere conciliación y revisión, nunca como aprobación retroactiva.

---

#### 28. Contrato y ORIGO

VISO proyectará el contrato como referencia contextual y no como documento editable duplicado.

Desde una aplicación o proveedor podrá mostrar:

```text
contract_ref
proveedor
producto o plan
vigencia demostrada
condición de renovación
soporte relacionado
aplicaciones/servicios que dependen
compra o relación comercial asociada
estado de evidencia
```

Acciones conceptuales:

- **Ver en ORIGO** — abre la fuente propietaria conservando contexto;
- **Solicitar revisión contractual** — crea o enlaza el handoff apropiado sin duplicar el contrato;
- **Relacionar evidencia** — solo cuando la autoridad y el modelo físico futuro lo permitan;
- **Preparar decisión tecnológica** — conserva análisis en la coordinación TI sin alterar términos comerciales.

No se copiarán contratos completos como texto libre en el expediente tecnológico.

---

#### 29. Costos y NUMERA

La vista de costo es de consulta, explicación tecnológica y conciliación; no es un formulario alterno de gasto.

Debe permitir recorrer:

```text
PROVIDER
→ PRODUCT / PLAN
→ CONTRACT / PURCHASE
→ LICENSE / ENTITLEMENT
→ APPLICATION / SERVICE / ASSET
→ COMMITMENT / EXPENSE
→ COST CENTER
→ RECONCILIATION
```

Para cada cifra monetaria visible se mostrará, según exista:

```text
monto
moneda
periodo económico
fuente económica
centro de costo
estado de conciliación
base de asignación cuando exista distribución
último cambio o versión relevante
```

Un importe sin fuente económica no se presenta como gasto realizado.

---

#### 30. Nueve modalidades descriptivas de costo

Se preservan:

| Modalidad                       | Uso visual                                 |
| ------------------------------- | ------------------------------------------ |
| `FIXED_RECURRING`               | cargo periódico fijo                       |
| `PER_SEAT`                      | cargo relacionado con cantidad de asientos |
| `USAGE_BASED`                   | cargo relacionado con consumo              |
| `CAPACITY_OR_TIER`              | cargo por capacidad o nivel                |
| `ONE_TIME`                      | adquisición o servicio no recurrente       |
| `SUPPORT_OR_MAINTENANCE`        | soporte o mantenimiento contratado         |
| `HARDWARE_ACQUISITION`          | adquisición de activo físico               |
| `WARRANTY_OR_SUPPORT_EXTENSION` | extensión comercial de cobertura           |
| `MIXED`                         | combinación demostrada de modalidades      |

La modalidad explica cómo puede originarse el cargo; no sustituye el hecho económico.

---

#### 31. Conciliación de costo

Un panel de conciliación deberá señalar diferencias como:

- relación tecnológica sin hecho económico reconciliado;
- gasto que referencia tecnología pero no tiene relación suficientemente demostrada;
- centro de costo ausente o inconsistente;
- periodo económico distinto del periodo de uso analizado;
- moneda o importe no reconciliados con la fuente económica;
- estimación de ahorro presentada junto a gasto real pero correctamente diferenciada;
- compra de hardware o `commercial_value` que no debe sumarse automáticamente como gasto tecnológico.

La corrección de un hecho económico permanece en NUMERA. La corrección de proveedor o contrato permanece en ORIGO. VISO conserva el vínculo y muestra si la diferencia quedó resuelta.

---

#### 32. Garantías y soporte

La experiencia de garantía comienza desde un activo NEXO reconciliado, no desde una impresora, aplicación o nombre de producto aislado.

Detalle mínimo:

```text
asset_ref
product_ref
provider_or_manufacturer_ref
purchase_ref
documento o evidencia
alcance de cobertura
inicio
fin
canal de reclamo
soporte relacionado
condiciones de sustitución
estado de garantía
```

Estados preservados:

- `PENDIENTE_DE_EVIDENCIA`;
- `ACTIVE`;
- `EXPIRING`;
- `EXPIRED`;
- `NO_APLICA`.

La interfaz deberá recordar visualmente:

```text
GARANTÍA VIGENTE
≠ ACTIVO SALUDABLE

GARANTÍA VENCIDA
≠ ACTIVO RETIRADO

CASO DE GARANTÍA
≠ INCIDENTE TECNOLÓGICO
```

---

#### 33. Soporte externo y SLA del proveedor

Una aplicación o proveedor podrá mostrar:

- canal de soporte externo;
- alcance contratado;
- horario;
- clasificación propia del proveedor;
- SLA contractual referenciado;
- contacto o mecanismo de escalamiento;
- caso externo correlacionado.

La interfaz deberá distinguir de forma explícita:

```text
SLA EXTERNO DEL PROVEEDOR
≠ SLA INTERNO DEL CASO VENTO
≠ PRIORIDAD DEL INCIDENTE
```

Una severidad P1 del proveedor no reemplaza la matriz interna de impacto y urgencia, y una prioridad interna alta no concede acceso a consolas del proveedor.

---

#### 34. Salida del proveedor

Toda relación externa relevante deberá poder abrir un resumen de salida con:

1. propiedad y exportabilidad de datos;
2. formato y completitud de exportación;
3. cuentas y accesos que deberán revocarse;
4. secretos y material técnico que deberán tratarse;
5. retención y eliminación del proveedor;
6. alternativa o modo degradado;
7. importación o restauración en destino;
8. trabajos pendientes y conciliación;
9. auditoría;
10. cierre comercial y económico;
11. prueba de retorno a operación;
12. evidencia de salida.

La interfaz debe advertir cuando cancelar primero pueda impedir exportar o recuperar datos.

Una decisión `MIGRATE_OR_EXIT` deberá enlazarse con recuperación y cambio tecnológico antes de declarar completada la salida.

---

#### 35. Handoff con el mapa técnico de TI-UX-003

Desde una aplicación, proveedor o licencia se podrá abrir el mapa técnico conservando:

```text
application_ref
tech_service_refs[]
dependency_refs[]
ambiente consultado
momento de corte
```

El mapa devuelve:

- health técnico;
- frescura;
- dependencias demostradas;
- alertas o casos correlacionados;
- evidencia insuficiente.

TI-UX-005 no duplica health ni topología dentro de la ficha comercial.

Regla:

```text
RELACIÓN COMERCIAL VIGENTE
≠ SERVICIO SALUDABLE
```

---

#### 36. Handoff con mesa de servicio TI-UX-002

Una condición comercial puede originar o relacionarse con un caso cuando:

- falta licencia necesaria;
- un asiento no puede asignarse o liberarse;
- proveedor suspende capacidad;
- existe duda de cobertura de garantía;
- renovación amenaza continuidad;
- facturación o condición comercial amenaza servicio;
- se requiere soporte del proveedor.

El handoff llevará únicamente el contexto necesario:

```text
application/service ref
provider/commercial relation ref
síntoma o riesgo
condición conocida
plazo demostrado cuando exista
evidencia seleccionada
propietario actual
```

El caso no modifica contrato, gasto, licencia o asiento por sí mismo.

---

#### 37. Handoff con cambio tecnológico TI-UX-004

Una decisión comercial abrirá o enlazará un cambio únicamente cuando exista efecto técnico material, por ejemplo:

- migrar proveedor;
- cambiar plan con capacidades distintas;
- retirar integración;
- cambiar tenant;
- cambiar región;
- sustituir software;
- reemplazar hardware por garantía;
- cambiar autenticación o cuenta técnica;
- modificar capacidad que afecte servicio.

La interfaz deberá mostrar:

```text
DECISIÓN COMERCIAL
→ puede requerir
CAMBIO TECNOLÓGICO

DECISIÓN COMERCIAL
≠ CAMBIO APROBADO
≠ CAMBIO EJECUTADO
```

Una renovación sin cambio técnico no genera artificialmente un cambio de configuración.

---

#### 38. Autorización y segregación

La experiencia deberá consultar autorización acción por acción.

No se inferirá autoridad por:

- cargo;
- propiedad funcional;
- responsabilidad tecnológica;
- acceso visible a VISO;
- cuenta de proveedor;
- posesión de credencial;
- licencia asignada;
- contrato existente;
- urgencia;
- costo alto.

Acciones sensibles, como aprobar cancelación, modificar un entitlement, operar una consola de proveedor, acceder a precios restringidos, cambiar configuración o retirar una capacidad crítica, deberán usar la autoridad propietaria y la segregación aplicable.

La interfaz puede presentar una acción como disponible para iniciar un handoff sin presentar al actor como autorizado para ejecutar el efecto final.

---

#### 39. Datos sensibles y secretos

No se mostrarán por defecto ni se copiarán al portafolio:

- contraseñas;
- tokens;
- API keys;
- service-role keys;
- recovery codes;
- secretos de webhook;
- claves privadas;
- números bancarios no necesarios para la tarea;
- precios o términos contractuales fuera del alcance autorizado;
- datos personales de usuarios de consolas cuando no sean necesarios;
- payloads o logs completos.

La ficha puede mostrar una referencia a la cuenta o al mecanismo de autenticación, pero no el material de autenticación.

---

#### 40. Filtros, búsqueda y vistas guardadas

La experiencia experta deberá permitir filtrar por:

- aplicación;
- servicio tecnológico;
- proveedor;
- tipo de evidencia;
- estado de licencia;
- modelo de entitlement;
- estado de renovación;
- estado de garantía;
- centro de costo cuando la fuente lo permita;
- propietario técnico;
- propietario funcional;
- estado de conciliación;
- riesgo de salida;
- evidencia pendiente.

Búsqueda permitida por identidad o etiqueta segura:

```text
app_code
nombre de aplicación
provider_ref / nombre autorizado
producto o plan
license_ref
contract_ref
asset_ref
```

Una vista guardada conserva preferencias de consulta; no se convierte en alcance autorizado ni en fuente de verdad.

---

#### 41. Estados vacíos, desconocidos y contradictorios

Se diseñan respuestas explícitas para cuatro situaciones:

| Situación                       | Mensaje y comportamiento                                                     |
| ------------------------------- | ---------------------------------------------------------------------------- |
| sin relación aplicable          | explicar `NO_APLICA` y la evidencia que sustenta esa conclusión              |
| relación esperada sin evidencia | mostrar `PENDIENTE_DE_EVIDENCIA`, propietario y condición de salida          |
| fuentes contradictorias         | mostrar ambas fuentes, momento de corte y bloquear conclusión definitiva     |
| fuente no disponible            | conservar última evidencia con frescura visible y no presentarla como actual |

Ejemplo:

```text
Costo no reconciliado
Existe una relación tecnológica con este proveedor, pero no hay un hecho económico
reconciliado que permita afirmar el costo actual de esta capacidad.

Consulta económica: NUMERA
Relación contractual: ORIGO
Estado: pendiente de evidencia
```

---

#### 42. Alertas y trabajo proactivo

Cuando la implementación posterior conecte observabilidad comercial, VISO podrá recibir señales sobre:

- licencia próxima a expiración;
- contrato próximo a término;
- ventana de cancelación próxima;
- auto-renovación sin decisión;
- asiento sin identidad vigente;
- asignación superior al entitlement;
- capacidad sin evidencia suficiente de uso;
- falla de facturación con posible efecto operativo;
- garantía próxima a vencimiento;
- garantía vencida sobre capacidad crítica;
- proveedor sin propietario;
- diferencia entre costo esperado y hecho económico reconciliado.

La tarea no fija umbrales temporales universales.

Una alerta crea trabajo visible; no renueva, compra, cancela, reasigna, cambia permisos ni modifica un contrato.

---

#### 43. Auditoría administrativa

Toda decisión o corrección material deberá poder reconstruir:

```text
actor real
actor efectivo
acción solicitada
autoridad aplicada
objeto afectado
fuente propietaria
estado antes
estado después o resultado del handoff
motivo
evidencia
momento
correlaciones posteriores
```

La vista de auditoría deberá poder distinguir:

- consulta;
- decisión;
- aprobación;
- handoff;
- mutación en fuente propietaria;
- conciliación posterior.

La actividad de VISO no se presentará como la mutación autoritativa si el cambio ocurrió en ORIGO, NUMERA, NEXO o SHELL.

---

#### 44. Reconciliación AS-IS `TI-TECHNOLOGY-COMMERCIAL-UX-RECONCILIATION-001`

La inspección actual de repositorios permite conservar estas conclusiones:

| Superficie | Evidencia verificable                                                                                                    | Máxima afirmación permitida                                 | Brecha que TI-UX-005 resuelve documentalmente                                                                                      |
| ---------- | ------------------------------------------------------------------------------------------------------------------------ | ----------------------------------------------------------- | ---------------------------------------------------------------------------------------------------------------------------------- |
| VISO       | shell administrativo, navegación gobernada por datos y superficies para administrar registros de aplicaciones/navegación | VISO posee infraestructura administrativa reusable          | no se demostró una experiencia integral de portafolio comercial-tecnológico que reúna relaciones y decisiones sin duplicar fuentes |
| ORIGO      | catálogo de proveedores con contacto, estado, condición de pago y acciones protegidas                                    | existe maestro operativo de proveedores orientado a compras | VISO debe referenciarlo y enlazarlo, no crear otro maestro de proveedor                                                            |
| NUMERA     | captura y consulta de gastos por periodo, categoría y centro de costo                                                    | existe superficie económica para hechos de gasto            | VISO debe consultar referencias conciliadas y nunca capturar el mismo gasto como copia                                             |
| SHELL      | identidad y catálogo de aplicaciones bajo contratos canónicos                                                            | conserva identidad de aplicación y autorización             | VISO no puede editar `app_code` ni convertir una lista local en catálogo canónico                                                  |
| NEXO       | autoridad del activo físico y sus relaciones documentales                                                                | conserva activo, garantía y ciclo físico                    | garantía tecnológica se proyecta solo desde activo reconciliado                                                                    |
| TI-DOM-006 | 10 aplicaciones, cinco familias técnicas y siete hostings pendientes                                                     | catálogo técnico-operativo especificado                     | TI-UX-005 materializa la experiencia de gestión sin inventar datos comerciales faltantes                                           |
| TI-DOM-012 | licencias, asientos, garantías, renovación, uso y costo especificados                                                    | gobierno comercial-tecnológico especificado                 | TI-UX-005 vuelve esos contratos utilizables desde la experiencia administrativa                                                    |

No se afirma ausencia absoluta de otras superficies no demostradas por las fuentes consultadas. La implementación futura deberá reconciliar el inventario real antes de crear cualquier pantalla física.

---

#### 45. Materialización física pendiente y propietarios

| Pendiente físico                                         | Estado documental        | Propietario o destino                                 | Condición de salida                                                                       |
| -------------------------------------------------------- | ------------------------ | ----------------------------------------------------- | ----------------------------------------------------------------------------------------- |
| superficie física de portafolio en VISO                  | `ESPECIFICADO`           | paquete E5 VISO que resulte autorizado                | pantalla, autorización, fuentes, estados y pruebas implementados sin catálogo paralelo    |
| modelo físico de relación comercial-tecnológica          | `FUERA_DE_ALCANCE`       | alcance de implementación autorizado en `vento-shell` | modelo y contratos implementados con migraciones propietarias y compatibilidad comprobada |
| integración con maestro de proveedores y contratos       | `FUERA_DE_ALCANCE`       | `TI-INT-003` + paquete ORIGO/VISO                     | contrato de integración aprobado y fuentes reconciliadas                                  |
| integración con hechos económicos de NUMERA              | `FUERA_DE_ALCANCE`       | `TI-INT-002`/`TI-INT-003` + paquete NUMERA/VISO       | consulta y correlación implementadas sin doble escritura                                  |
| lectura de garantía desde NEXO                           | `FUERA_DE_ALCANCE`       | paquete NEXO/VISO                                     | activo, documento, garantía y autorización reconciliados                                  |
| alertas productivas de renovación, uso, costo y garantía | `FUERA_DE_ALCANCE`       | `TI-DOM-010`; `TI-INT-001`; paquete VISO              | señales implementadas con fuente, condición y owner demostrables                          |
| permisos sobre contratos, precios, licencias y consolas  | `FUERA_DE_ALCANCE`       | `TI-AUTH-001` a `TI-AUTH-004` + implementación AUTH   | acciones protegidas resuelven permiso, alcance y segregación en servidor                  |
| proveedores y hostings no demostrados                    | `PENDIENTE_DE_EVIDENCIA` | TI + ORIGO; AURA mediante sus tareas de auditoría     | proveedor, cuenta, propietario, plan y evidencia técnica/comercial reconciliados          |
| costos tecnológicos reales reconciliados                 | `PENDIENTE_DE_EVIDENCIA` | NUMERA + ORIGO + TI                                   | hecho económico y relación tecnológica demostrados                                        |
| uso real de licencias/capacidad                          | `PENDIENTE_DE_EVIDENCIA` | TI + propietario funcional                            | fuente, periodo, unidad y necesidad reconciliados                                         |

Ningún pendiente detectado queda sin propietario ni condición de salida.

---

#### 46. Estado de materialización

| Componente                                      | Estado                   |
| ----------------------------------------------- | ------------------------ |
| arquitectura de información del portafolio      | `ESPECIFICADO`           |
| portafolio 10/10 aplicaciones                   | `ESPECIFICADO`           |
| relación con cinco familias de proveedor        | `ESPECIFICADO`           |
| tratamiento de siete hostings pendientes        | `ESPECIFICADO`           |
| presentación de evidencia comercial             | `ESPECIFICADO`           |
| estados de licencia y entitlement               | `ESPECIFICADO`           |
| asignación y conciliación de asiento            | `ESPECIFICADO`           |
| uso, necesidad y criticidad separadas           | `ESPECIFICADO`           |
| rightsizing                                     | `ESPECIFICADO`           |
| renovación y siete decisiones                   | `ESPECIFICADO`           |
| auto-renovación                                 | `ESPECIFICADO`           |
| contratos y handoff ORIGO                       | `ESPECIFICADO`           |
| costos y handoff NUMERA                         | `ESPECIFICADO`           |
| garantía y handoff NEXO                         | `ESPECIFICADO`           |
| soporte, salida y recuperación de proveedor     | `ESPECIFICADO`           |
| handoff a mapa, soporte y cambio                | `ESPECIFICADO`           |
| autorización y protección de secretos           | `ESPECIFICADO`           |
| implementación física VISO                      | `FUERA_DE_ALCANCE`       |
| migraciones Supabase                            | `NO_APLICA`              |
| ejecución sobre proveedores reales              | `NO_APLICA`              |
| contratos/licencias/costos reales reconciliados | `PENDIENTE_DE_EVIDENCIA` |

---

#### 47. Invariantes

1. existen exactamente diez aplicaciones canónicas y TI-UX-005 no crea una undécima;
2. `app_code` no cambia por ambiente, proveedor, plan o tenant;
3. VISO coordina la experiencia, pero no sustituye la fuente propietaria;
4. SHELL conserva identidad de aplicación y autorización;
5. ORIGO conserva proveedor, compra y contrato;
6. NUMERA conserva compromiso, gasto y costo;
7. NEXO conserva activo físico y garantía;
8. TI conserva relación técnica, uso observado, soporte y riesgo tecnológico;
9. proveedor no es producto o plan;
10. contrato no es licencia;
11. licencia no es entitlement;
12. entitlement no es asiento;
13. asiento no es cuenta;
14. cuenta no es credencial;
15. asignación de asiento no concede permiso empresarial;
16. revocar acceso no demuestra liberar asiento;
17. liberar asiento no demuestra revocar cuenta;
18. SDK no demuestra contrato;
19. URL no demuestra hosting contratado;
20. factura no demuestra entitlement;
21. gasto no demuestra licencia vigente;
22. uso no demuestra necesidad;
23. poco uso no demuestra prescindibilidad;
24. alta utilización no demuestra criticidad;
25. criticidad se deriva del proceso, recurso y contexto;
26. `NULL` no equivale a cero;
27. unlimited no se representa con una cantidad ficticia;
28. usage-based no se fuerza a modelo por asiento;
29. `AVAILABLE` se calcula solo con cantidad y asignaciones reconciliadas;
30. `AVAILABLE < 0` es anomalía, no estado ordinario;
31. rightsizing es señal de revisión, no cancelación automática;
32. auto-renovación no equivale a aprobación;
33. decisión comercial no equivale a cambio aprobado;
34. contrato renovado no implica servicio saludable;
35. SLA externo no reemplaza SLA interno;
36. garantía no equivale a health;
37. garantía vencida no retira activo;
38. cancelar licencia no elimina datos del proveedor;
39. cancelar contrato no revoca automáticamente cuentas, secretos o integraciones;
40. salida de proveedor conserva exportación, recuperación, revocación, conciliación y evidencia;
41. costo visible conserva fuente económica;
42. estimación de ahorro no se presenta como gasto real;
43. `commercial_value` de un activo no se suma automáticamente como gasto;
44. un filtro no fabrica alcance autorizado;
45. una vista guardada no fabrica fuente de verdad;
46. información pendiente se presenta como pendiente, no como ausencia;
47. fuentes contradictorias se muestran y bloquean conclusión definitiva;
48. secretos no se almacenan ni se muestran como datos del portafolio;
49. una alerta no renueva, compra, cancela ni reasigna;
50. esta tarea no modifica código, datos, proveedores, contratos ni Supabase.

---

#### 48. Criterios de aceptación

- [x] se conserva la continuidad `TI-UX-004 → TI-UX-005 → TI-UX-006`;
- [x] la tarea permanece exclusivamente documental;
- [x] VISO se diseña como coordinador administrativo sin convertirse en fuente comercial paralela;
- [x] se preserva la autoridad de SHELL, ORIGO, NUMERA, NEXO y los dominios TI;
- [x] se materializan exactamente diez aplicaciones;
- [x] las diez aplicaciones reciben una decisión explícita de experiencia;
- [x] se materializan exactamente cinco familias externas heredadas;
- [x] los siete hostings no demostrados quedan explícitos sin inventar proveedor;
- [x] se distinguen proveedor, plan, contrato, suscripción, licencia, entitlement, asiento, cuenta y credencial;
- [x] se preservan los siete estados de licencia;
- [x] se preservan los siete modelos de licencia/entitlement;
- [x] asiento, acceso, cuenta y sesión permanecen separados;
- [x] se definen cantidades, disponibilidad y anomalías sin usar cero para datos desconocidos;
- [x] se separan asignación, uso, necesidad y criticidad;
- [x] rightsizing no ejecuta cancelación automática;
- [x] se diseña bandeja de renovación basada en decisión y evidencia, no solo fecha;
- [x] se preservan exactamente los siete resultados de renovación;
- [x] auto-renovación no equivale a aprobación;
- [x] contrato se consulta desde su autoridad y no se duplica como texto libre en TI;
- [x] costo se consulta y explica desde hechos económicos reconciliados;
- [x] se preservan las nueve modalidades descriptivas de costo;
- [x] garantía permanece vinculada a activo NEXO reconciliado;
- [x] se preservan los cinco estados documentales de garantía;
- [x] SLA externo, SLA interno y prioridad permanecen separados;
- [x] se diseña salida de proveedor con exportación, revocación, recuperación y conciliación;
- [x] se materializan handoffs con TI-UX-002, TI-UX-003 y TI-UX-004;
- [x] autorización y segregación se resuelven por acción;
- [x] secretos y datos sensibles no forman parte del portafolio ordinario;
- [x] estados desconocidos y contradicciones se muestran explícitamente;
- [x] alertas no ejecutan decisiones comerciales;
- [x] la auditoría distingue proyección VISO de mutación en la fuente propietaria;
- [x] el AS-IS de VISO, ORIGO y NUMERA se reconcilia sin afirmar ausencia absoluta por búsquedas incompletas;
- [x] cada pendiente físico o de evidencia tiene propietario y condición de salida;
- [x] no se ejecutan cambios físicos;
- [x] no se modifica Supabase;
- [x] no se crean ni modifican requisitos de prueba;
- [x] `TI-UX-006` permanece únicamente reservada.

---

#### 49. Cobertura de prueba consumida

La tarea se apoya en cobertura vigente que ya protege:

- mesa de servicio tecnológica y administración de VISO;
- separación de fuente de verdad, proyección y conciliación;
- trazabilidad del proveedor y de las condiciones comerciales;
- proveedor, contrato y condición comercial como objetos distintos;
- reconciliación de hechos económicos y costos con sus fuentes;
- experiencia administrativa con contexto, actor, permiso, segregación, impacto y fuente;
- correlación entre aplicaciones, proveedores, licencias, contratos, costos y servicios;
- identidad, garantía, mantenimiento y retiro de activos;
- autorización de configuración protegida, proveedor y cuenta técnica;
- uso de contratos versionados y handoffs entre aplicaciones;
- no exposición de secretos en catálogos y soporte;
- cambio y recuperación al migrar o retirar proveedor;
- piloto y validación posterior de las superficies administrativas.

TI-UX-005 materializa la experiencia que consume esas obligaciones sin introducir una nueva autoridad económica, algoritmo comercial, permiso, esquema físico o efecto empresarial adicional.

---

#### 50. Requisitos de prueba derivados

**Resultado:** NO GENERA REQUISITOS DE PRUEBA

**Justificación:** la tarea materializa documentalmente una experiencia administrativa para comportamientos ya protegidos por el registro canónico vigente: fuente de verdad, conciliación, proveedor y contrato, licencia y acceso, trazabilidad económica, garantías, autorización, handoffs, cambio, recuperación y experiencia administrativa. No introduce una nueva conducta ejecutable, una regla económica nueva, una transición contractual nueva, una autorización nueva, un esquema físico ni una integración implementada. Por ello no corresponde crear ni modificar filas del registro de requisitos.

**Balance:** 0 creados; 0 modificados; 0 diferidos; 0 descartados; 0 obsoletos.

---

#### 51. Continuidad

ÚLTIMA TAREA APROBADA
`TI-UX-004 — Diseñar flujos de incidente, problema, cambio, mantenimiento y recuperación`

TAREA ACTUAL APROBADA
`TI-UX-005 — Diseñar gestión de aplicaciones, proveedores, licencias, contratos, renovaciones y costos`

SIGUIENTE TAREA RESERVADA
`TI-UX-006 — Diseñar diagnóstico guiado, base de conocimiento y capacitación contextual sin saturación técnica`


### ✅ TI-UX-006 — Diseñar diagnóstico guiado, base de conocimiento y capacitación contextual sin saturación técnica

**Estado:** APROBADA
**Tarea anterior:** `TI-UX-005 — Diseñar gestión de aplicaciones, proveedores, licencias, contratos, renovaciones y costos` — APROBADA
**Tarea siguiente:** `TI-INT-001 — Definir adaptadores de telemetría para endpoints, redes, impresoras, aplicaciones y servicios externos` — RESERVADA
**Tipo de tarea:** documental; diseño normativo y materializado de la experiencia de diagnóstico guiado, consulta y gobierno de conocimiento tecnológico y capacitación contextual para ANIMA y VISO, con divulgación progresiva, autorización por sensibilidad y preservación de contexto
**Repositorio propietario:** `vento-shell`
**Archivo propietario:** `docs/plan-canonico/modular/bloques/Z_TECNOLOGIA_Y_SOPORTE/03_EXPERIENCIA_DE_SOPORTE_Y_OPERACION_TI.md`
**Aplicaciones consumidoras principales:** ANIMA y VISO
**Cambios físicos autorizados:** ninguno; no crea ni modifica rutas, componentes, código, tablas, vistas, RLS, RPC, funciones, triggers, Edge Functions, migraciones, datos, artículos persistidos, módulos de capacitación, asignaciones, métricas, permisos, notificaciones, integraciones ni configuración de Supabase
**Requisitos de prueba creados o modificados:** 0

---

#### 1. Propósito

Materializar cómo una persona debe recibir ayuda tecnológica en Vento sin tener que comprender arquitectura, logs, redes, permisos internos, códigos de implementación o terminología especializada antes de poder avanzar.

La experiencia objetivo debe resolver simultáneamente cuatro necesidades:

- que el trabajador encuentre ayuda útil y segura desde su contexto real en ANIMA;
- que la mesa de servicio conduzca un diagnóstico reproducible desde VISO sin empezar por la evidencia más sensible;
- que el conocimiento reutilizable se consulte, revise y publique con identidad, versión, vigencia, audiencia y fuente;
- que la capacitación aparezca cuando el contexto la justifica, sin convertir cada pantalla en un manual o cada cambio en un curso obligatorio.

Regla raíz:

```text
AYUDA CONTEXTUAL
≠ DIAGNÓSTICO TÉCNICO COMPLETO
≠ CONOCIMIENTO PUBLICADO
≠ MENSAJE DE SOPORTE
≠ WORKAROUND
≠ CAPACITACIÓN
≠ COMPETENCIA
≠ AUTORIZACIÓN
```

Y:

```text
MÁS DETALLE TÉCNICO
NO SIGNIFICA
MEJOR EXPERIENCIA
```

La interfaz debe revelar únicamente el nivel de información necesario para la tarea, la decisión y la autoridad vigentes.

---

#### 2. Resultado sustantivo

La tarea deja definido el diseño completo de experiencia para:

- diagnóstico guiado vinculado a un caso tecnológico;
- autoservicio seguro y ayuda contextual para el trabajador;
- búsqueda y consumo de conocimiento vigente;
- navegación entre guía, caso, error conocido, workaround y cambio sin fusionar sus identidades;
- escalamiento que conserva el contexto ya capturado;
- gobierno visual del ciclo de vida del conocimiento;
- revisión y publicación sin transformar mensajes de soporte en verdad automática;
- capacitación contextual por capacidad, versión, audiencia y disparador;
- separación visible entre finalización, comprobación, competencia y autorización;
- feedback y señales de adopción sin convertir telemetría en vigilancia individual;
- tratamiento de contenido sensible mediante divulgación progresiva y autorización;
- comportamiento cuando la guía, la evidencia o la vigencia no pueden comprobarse;
- reconciliación del soporte y las FAQ actuales de ANIMA frente al contrato objetivo.

Se preservan sin renumerar ni ampliar los conjuntos canónicos heredados:

| Conjunto heredado                     | Cobertura conservada |
| ------------------------------------- | -------------------: |
| clases de conocimiento                |         **10 de 10** |
| estados del ciclo de conocimiento     |           **6 de 6** |
| clases de fuente de conocimiento      |         **12 de 12** |
| audiencias de aprendizaje             |           **8 de 8** |
| estados de asignación de aprendizaje  |           **6 de 6** |
| estados de comprobación o competencia |           **5 de 5** |
| clases de comunicación de cambio      |           **7 de 7** |
| clases de señal de adopción           |           **8 de 8** |
| servicios tecnológicos con decisión   |         **11 de 11** |

No se crea una clase adicional para resolver un problema de interfaz.

---

#### 3. Autoridades y entradas conservadas

La experiencia consume sin redefinir:

- `TI-DOM-013` como autoridad del conocimiento tecnológico, su identidad, versión, ciclo de vida, publicación, capacitación, competencia, comunicación y adopción;
- `TI-DOM-007` como autoridad del caso tecnológico, clasificación, prioridad, SLA, comunicación, restauración, validación y cierre;
- `TI-DOM-008` como autoridad del problema, causa raíz, error conocido y workaround;
- `TI-DOM-009` como autoridad del cambio tecnológico, su aprobación, ejecución, rollback y resultado;
- `TI-DOM-010` como autoridad de señales, observaciones, health, frescura, alertas y telemetría;
- `TI-DOM-011` como autoridad de recuperación técnica y runbooks relacionados;
- `TI-AUTH-001` a `TI-AUTH-004` como autoridad de segregación, privilegio, configuración protegida y acceso a evidencia sensible;
- `TI-UX-001` como experiencia personal de reporte y seguimiento del trabajador en ANIMA;
- `TI-UX-002` como mesa de servicio administrativa de VISO;
- `TI-UX-003` como mapa técnico y proyección de salud y dependencias;
- `TI-UX-004` como experiencia de incidente, problema, cambio, mantenimiento y recuperación;
- SHELL como autoridad de identidad de aplicación y política de acceso;
- ANIMA como superficie personal del trabajador;
- VISO como superficie administrativa de soporte;
- la aplicación o servicio propietario como fuente del procedimiento o configuración que corresponda.

La tarea no convierte la experiencia en fuente maestra de datos, configuración, permisos, estado técnico, aprendizaje o caso.

---

#### 4. Separación de carriles de ayuda

La misma necesidad puede producir vistas distintas según intención y actor.

| Carril                 | Propósito                                     | Contenido principal                                                        | Límite                                              |
| ---------------------- | --------------------------------------------- | -------------------------------------------------------------------------- | --------------------------------------------------- |
| personal               | ayudar al trabajador sobre su propio contexto | explicación humana, guía segura, estado del caso, siguiente paso           | no expone diagnóstico restringido ni administración |
| mesa de servicio       | conducir atención y diagnóstico               | caso, síntoma, evidencia mínima, guía diagnóstica, decisión y escalamiento | no concede privilegio por abrir la vista            |
| conocimiento           | consultar o gobernar contenido reutilizable   | artículo, versión, alcance, fuente, vigencia, audiencia, relaciones        | no modifica la fuente técnica ni el caso            |
| aprendizaje contextual | ayudar a aprender una capacidad aplicable     | módulo o referencia vigente, motivo de asignación, progreso y comprobación | no concede permiso ni prueba adopción por sí solo   |
| auditoría              | reconstruir uso, versión, revisión y decisión | historia, fuente, actor, evidencia y cambios                               | no corrige silenciosamente el contenido histórico   |

Una superficie puede enlazar otro carril, pero no debe mezclar en el mismo plano ordinario acciones de trabajador, administración editorial, privilegio técnico y auditoría.

---

#### 5. Principio de divulgación progresiva

La experiencia se organiza desde lo necesario hacia lo especializado:

```text
NECESIDAD HUMANA
→ CONTEXTO YA CONOCIDO
→ SIGUIENTE ACCIÓN SEGURA
→ RESULTADO DE LA COMPROBACIÓN
→ EXPLICACIÓN ADICIONAL SI HACE FALTA
→ DETALLE TÉCNICO SOLO SI ES PERTINENTE Y AUTORIZADO
```

Reglas:

1. el primer plano usa lenguaje humano y orientado a la tarea;
2. no se muestran nombres de tablas, schemas, RPC, RLS, componentes, migraciones, enums, permisos internos o repositorios como lenguaje ordinario;
3. un código técnico puede aparecer en diagnóstico autorizado cuando ayude a identificar el hecho, pero no sustituye la explicación humana;
4. los detalles extensos permanecen bajo demanda;
5. si una persona no necesita una acción, esta no llena la pantalla como control deshabilitado sin explicación;
6. una obligación bloqueada sí permanece visible con causa y siguiente acción;
7. la ayuda contextual no debe interrumpir una tarea con material que no sea aplicable a esa acción;
8. la interfaz no usa la capacitación para compensar copy incomprensible o una arquitectura de navegación deficiente.

---

#### 6. Entrada desde ANIMA

El trabajador conserva una única experiencia personal de soporte. La ayuda contextual se integra conceptualmente con esa superficie y no crea un segundo canal de atención.

La entrada deberá poder usar, cuando ya estén disponibles y autorizados:

- aplicación desde la que se originó la necesidad;
- tarea o capacidad en curso;
- sede y área aplicables;
- dispositivo o tipo de dispositivo;
- servicio tecnológico relacionado;
- mensaje de error seguro;
- referencia de caso existente;
- versión o cambio relevante;
- pasos ya intentados dentro de una guía.

El trabajador no debe volver a digitar esa información solo para abrir ayuda.

La pantalla debe responder primero:

```text
¿QUÉ NECESITAS HACER?
¿QUÉ ESTÁ PASANDO?
¿HAY UNA ACCIÓN SEGURA QUE PUEDES PROBAR?
¿NECESITAS CONTINUAR CON SOPORTE?
```

No debe responder primero con categorías técnicas que el trabajador tenga que diagnosticar por sí mismo.

---

#### 7. Ayuda rápida del trabajador

Cuando exista conocimiento publicado, vigente, apropiado para la audiencia y compatible con el contexto, ANIMA podrá presentar una ayuda breve con:

- título humano;
- a qué situación aplica;
- una acción segura actual;
- resultado esperado;
- qué hacer si no funciona;
- señal clara de cuándo detenerse y pedir soporte;
- referencia de versión o vigencia solo cuando sea material para comprender la aplicabilidad.

La ayuda rápida no muestra de forma ordinaria:

- logs;
- IP;
- topología;
- identificadores de implementación;
- secretos;
- datos de otras personas;
- hipótesis internas no confirmadas;
- instrucciones privilegiadas;
- configuración administrativa que el trabajador no puede ejecutar.

Si la guía deja de ser segura o vigente, deja de presentarse como orientación actual.

---

#### 8. Continuación hacia soporte sin repetición

Cuando la ayuda no resuelve la necesidad, la transición a caso tecnológico conserva:

```text
CONTEXTO DE ORIGEN
+
GUÍA CONSULTADA Y VERSIÓN
+
PASOS REALMENTE EJECUTADOS
+
RESULTADOS OBSERVADOS
+
EVIDENCIA SEGURA APORTADA
+
SÍNTOMA QUE PERSISTE
```

El escalamiento no debe pedir nuevamente al trabajador la misma narración si ya existe de forma estructurada.

La guía no clasifica por sí sola el caso, no fija prioridad, no determina causa raíz y no cierra el ticket.

---

#### 9. Entrada al diagnóstico guiado en VISO

El diagnóstico se abre desde el expediente tecnológico y conserva como contexto, cuando exista:

- referencia del caso;
- clase del caso;
- servicio afectado;
- elemento afectado;
- sede o alcance;
- síntoma reportado;
- prioridad y SLA;
- owner actual;
- señales o health correlacionadas;
- cambio, problema o error conocido relacionado;
- conocimiento ya consultado;
- pasos de diagnóstico previamente ejecutados;
- evidencia que el actor está autorizado a conocer.

Abrir diagnóstico no cambia automáticamente el estado del caso y no amplía autorización.

---

#### 10. Flujo conceptual del diagnóstico guiado

El diagnóstico se conduce como una secuencia verificable y ramificable:

```text
COMPRENDER EL SÍNTOMA
→ REVISAR CONTEXTO SEGURO YA DISPONIBLE
→ EJECUTAR COMPROBACIÓN MENOS INTRUSIVA
→ REGISTRAR RESULTADO
→ EVALUAR PATRÓN / ERROR CONOCIDO / GUÍA APLICABLE
→ CONTINUAR, APLICAR ORIENTACIÓN AUTORIZADA O ESCALAR
→ VERIFICAR EL EFECTO
→ DEVOLVER EL RESULTADO AL CASO
```

No se obliga a completar pasos que no aplican.

Una rama descartada conserva suficiente rastro para evitar repetirla innecesariamente, pero no convierte una hipótesis descartada en causa.

---

#### 11. Unidad de paso diagnóstico

Cada paso de una guía diagnóstica deberá poder presentar:

- objetivo de la comprobación;
- pregunta o instrucción humana;
- precondición;
- información que ya se conoce;
- acción permitida;
- evidencia que se observará;
- resultado esperado;
- opciones de resultado;
- rama siguiente;
- condición de bloqueo;
- condición que exige autorización adicional;
- condición de escalamiento;
- relación con conocimiento, error conocido, workaround o cambio cuando exista.

Los resultados conceptuales deben poder distinguir, según el caso:

- comprobado;
- no comprobado;
- no aplica;
- no se puede determinar con la evidencia disponible;
- bloqueado por precondición;
- requiere autorización adicional;
- requiere escalamiento.

La interfaz no convierte “no se puede determinar” en “sin problema”.

---

#### 12. Diagnóstico por sensibilidad

Se conserva la progresión canónica de menor a mayor intrusión:

| Capa                     | Presentación de experiencia                                                            | Condición                                                  |
| ------------------------ | -------------------------------------------------------------------------------------- | ---------------------------------------------------------- |
| estado y metadata mínima | health, disponibilidad, versión, identificadores seguros y código humano del resultado | primera opción cuando puede resolver la hipótesis          |
| contexto estructurado    | timestamps, correlación, recurso, operación y resultado                                | se revela cuando la hipótesis requiere más contexto        |
| log restringido          | fragmento delimitado del recurso y ventana pertinentes                                 | requiere finalidad y autorización de diagnóstico sensible  |
| contenido de evidencia   | adjunto, payload o detalle restringido imprescindible                                  | solo cuando no existe alternativa menos intrusiva          |
| material para tercero    | subconjunto sanitizado destinado a proveedor o especialista                            | requiere autorización de divulgación, destinatario y canal |

La interfaz debe indicar por qué se necesita avanzar a una capa más sensible antes de revelar su contenido.

---

#### 13. Estado visible de autorización del diagnóstico

El diagnóstico distingue claramente:

```text
PUEDO VER ESTA COMPROBACIÓN
≠
PUEDO EJECUTAR UNA MUTACIÓN
≠
PUEDO ABRIR EVIDENCIA RESTRINGIDA
≠
PUEDO EXPORTARLA
≠
PUEDO COMPARTIRLA
```

Cuando una acción no está autorizada, la experiencia no ofrece un falso workaround de “copiar el dato y pedirle a otra persona que lo mire”.

Si el caso requiere una capacidad distinta, se crea el handoff correspondiente sin transportar el privilegio del actor actual.

---

#### 14. Vista conceptual de diagnóstico en VISO

La superficie objetivo se compone alrededor del caso, no alrededor de una consola técnica genérica.

```text
CASO TECNOLÓGICO
Síntoma · servicio · elemento · prioridad · SLA · owner

DIAGNÓSTICO GUIADO
Qué estamos comprobando
[ paso actual ]
Resultado observado: ...
[ registrar resultado ]

CONTEXTO ÚTIL
- señales seguras ya correlacionadas
- cambios recientes relacionados
- guía o error conocido aplicable

DETALLE TÉCNICO
Disponible solo cuando la tarea y la autorización lo requieren

SIGUIENTE ACCIÓN
Continuar comprobación · aplicar orientación autorizada · escalar
```

No se fija una ruta física ni un componente concreto en esta fase.

---

#### 15. Relación con health y mapa técnico

El diagnóstico puede consumir el mapa técnico y observaciones ya existentes, pero conserva estas diferencias:

```text
HEALTH
≠ DIAGNÓSTICO
≠ CAUSA
≠ PRIORIDAD
≠ RESOLUCIÓN
```

Una dependencia degradada puede orientar la investigación sin demostrar causalidad.

Una señal recuperada puede cerrar una hipótesis técnica sin cerrar el caso.

Una health `UNKNOWN` obliga a explicar que falta evidencia en lugar de recomendar acciones como si el elemento estuviera saludable.

---

#### 16. Error conocido y workaround

Cuando exista un error conocido aplicable, VISO presenta de forma separada:

- condición o patrón reconocido;
- población o versión afectada;
- evidencia que sustenta la coincidencia;
- workaround vigente;
- riesgo y limitaciones;
- condición de retiro;
- relación con problema y corrección definitiva cuando exista.

La interfaz no presenta el workaround como causa eliminada ni como procedimiento permanente.

Si el workaround exige privilegio, cambio o configuración protegida, la guía detiene el flujo ordinario y deriva a la autoridad correspondiente.

---

#### 17. Verificación posterior a una acción

Después de una orientación o acción permitida, el flujo vuelve a comprobar el resultado esperado.

La experiencia distingue:

- acción ejecutada;
- resultado observado;
- servicio restaurado;
- resultado empresarial validado;
- causa resuelta;
- conocimiento candidato.

Ninguno de esos estados se infiere automáticamente de otro.

---

#### 18. Escalamiento técnico

El escalamiento conserva:

- hipótesis evaluadas;
- pasos completados;
- pasos bloqueados;
- evidencia disponible;
- guía y versión utilizadas;
- resultado de cualquier workaround;
- razón exacta del escalamiento;
- siguiente función requerida;
- contenido sensible únicamente dentro del alcance autorizado.

El nivel siguiente no empieza desde cero y tampoco hereda permisos del nivel anterior por recibir el caso.

---

#### 19. Base de conocimiento — consumo

La búsqueda ordinaria solo debe priorizar conocimiento:

- `PUBLISHED`;
- vigente;
- compatible con la audiencia;
- aplicable al servicio, aplicación, capacidad, dispositivo o versión en contexto;
- permitido por sensibilidad y autorización.

Cada resultado deberá permitir comprender, sin abrir el artículo completo:

- qué problema o tarea ayuda a resolver;
- a quién aplica;
- sobre qué aplicación, servicio o capacidad aplica;
- si existe una versión o condición relevante;
- si está vigente;
- si requiere una capacidad que el actor no posee;
- qué alternativa segura existe cuando no aplica.

La relevancia contextual puede ordenar resultados, pero no altera su identidad ni su versión.

---

#### 20. Búsqueda de conocimiento

La búsqueda se diseña alrededor de lenguaje humano y contexto.

Puede usar como señales:

- síntoma;
- tarea que la persona intenta realizar;
- aplicación o servicio;
- dispositivo o periférico;
- cambio reciente;
- error conocido;
- palabra o alias local registrado;
- versión;
- audiencia;
- contexto territorial cuando realmente afecte la aplicabilidad.

Los términos técnicos pueden existir como alias o filtro para soporte autorizado, pero no son requisito de entrada para un trabajador.

Una búsqueda sin resultados no debe sugerir que “no existe problema”; ofrece continuar con soporte y conserva la consulta como señal de mejora.

---

#### 21. Presentación de un artículo

La capa inicial muestra:

- título;
- finalidad;
- situación a la que aplica;
- audiencia;
- versión o condición de aplicabilidad cuando sea material;
- pasos o explicación principal;
- fallback seguro;
- estado de vigencia.

Bajo demanda puede mostrar, según autorización:

- fuente;
- propietario técnico;
- propietario funcional cuando aplique;
- relaciones con caso, problema, error conocido, cambio o runbook;
- revisión;
- historial de versiones;
- evidencia editorial.

La interfaz no convierte la metadata editorial en ruido permanente para el trabajador.

---

#### 22. Ciclo de vida visible del conocimiento

Se conservan exactamente:

1. `DRAFT`;
2. `IN_REVIEW`;
3. `PUBLISHED`;
4. `SUPERSEDED`;
5. `EXPIRED`;
6. `WITHDRAWN`.

Reglas de experiencia:

- `DRAFT` e `IN_REVIEW` no aparecen como guía actual para audiencia ordinaria;
- `PUBLISHED` vigente es el contenido consumible ordinario;
- `SUPERSEDED` informa cuál versión lo sustituyó cuando el actor puede consultar historia;
- `EXPIRED` explica que la orientación ya no debe usarse;
- `WITHDRAWN` no continúa disponible como solución ordinaria;
- una referencia histórica desde un caso conserva la versión utilizada en ese momento;
- la búsqueda ordinaria no promueve una versión histórica por encima de la vigente.

---

#### 23. Experiencia editorial de conocimiento

La administración editorial en VISO debe permitir separar:

```text
CANDIDATO
→ CURACIÓN
→ REVISIÓN
→ PUBLICACIÓN
→ RETROALIMENTACIÓN
→ NUEVA REVISIÓN O RETIRO
```

El intake puede originarse en soporte, incidente, problema, known error, workaround, cambio, proveedor, procedimiento, dispositivo, recuperación, seguridad o feedback.

La interfaz exige antes de publicar, según aplicabilidad:

- audiencia;
- alcance;
- fuente;
- propietario;
- versión;
- condición de revisión o expiración;
- sanitización;
- aplicabilidad técnica;
- fallback seguro;
- evidencia de revisión.

No existe un botón conceptual de “publicar este mensaje del ticket” sin pasar por la puerta de publicabilidad.

---

#### 24. Revisión desde casos de soporte

Un caso puede proponer conocimiento cuando existe aprendizaje reutilizable.

La experiencia debe ayudar a separar:

- síntoma generalizable;
- condición técnica;
- pasos seguros;
- resultado;
- datos específicos del caso;
- datos personales;
- secretos;
- información contractual o interna innecesaria.

El candidato conserva relación con su fuente, pero el artículo resultante no replica el expediente.

---

#### 25. Las diez clases de conocimiento

La interfaz preserva las diez clases aprobadas y no crea sinónimos paralelos:

| Clase                        | Uso de experiencia                                                |
| ---------------------------- | ----------------------------------------------------------------- |
| `QUICK_GUIDE`                | ayuda breve y segura en contexto                                  |
| `DIAGNOSTIC_GUIDE`           | conducción de comprobaciones sin autoridad implícita para cambiar |
| `RUNBOOK`                    | procedimiento técnico controlado para audiencia autorizada        |
| `KNOWN_ERROR_ARTICLE`        | explicación reusable de error conocido y workaround vigente       |
| `APPLICATION_GUIDE`          | uso y soporte de una aplicación o versión                         |
| `DEVICE_OR_PERIPHERAL_GUIDE` | uso o soporte de elemento físico o endpoint                       |
| `NETWORK_GUIDE`              | uso o diagnóstico permitido de conectividad                       |
| `CHANGE_NOTE`                | efecto observable de un cambio aprobado                           |
| `TRAINING_REFERENCE`         | contenido base consumido por una actividad de aprendizaje         |
| `PROVIDER_REFERENCE`         | referencia externa curada y versionada en su aplicabilidad        |

La clase principal orienta la experiencia; relaciones adicionales no duplican la identidad del contenido.

---

#### 26. Capacitación contextual

La capacitación aparece por un motivo demostrable, no como feed indiscriminado.

Disparadores conservados:

- incorporación a una capacidad o herramienta;
- cambio de función o contexto;
- cambio tecnológico con efecto observable;
- nueva aplicación, dispositivo o procedimiento;
- error recurrente que requiere prevención;
- cambio de seguridad que exige nueva práctica;
- actualización de runbook o procedimiento crítico;
- aprendizaje post-incidente o post-cambio;
- evidencia suficiente de adopción insuficiente que justifique refuerzo.

El disparador identifica una necesidad de evaluación; no asigna automáticamente a toda la organización.

---

#### 27. Las ocho audiencias de aprendizaje

Se conservan exactamente:

1. `END_USER`;
2. `SHARED_STATION_OPERATOR`;
3. `SERVICE_DESK_L1`;
4. `TECHNICAL_SUPPORT_L2`;
5. `APPLICATION_OR_SERVICE_OWNER`;
6. `CHANGE_APPROVER_OR_OWNER`;
7. `PRIVILEGED_TECHNICAL_ADMIN`;
8. `EXTERNAL_SUPPORT_PROVIDER`.

La experiencia puede adaptar lenguaje, profundidad y referencias según audiencia, pero ninguna audiencia se convierte en rol o permiso.

---

#### 28. Presentación de aprendizaje en ANIMA

Cuando exista una asignación aplicable al trabajador, ANIMA deberá priorizar:

- por qué aparece;
- qué capacidad o cambio afecta;
- qué debe aprender o comprobar;
- versión del contenido;
- estado de la asignación;
- acción siguiente;
- fecha o condición solo si proviene de una regla autorizada;
- resultado de comprobación cuando aplique.

No se debe bloquear una tarea ordinaria únicamente porque existe contenido recomendado.

Si la formación es realmente obligatoria por una autoridad aplicable, la interfaz explica esa obligación y la condición de salida; no inventa la obligatoriedad desde TI.

---

#### 29. Estados de asignación y competencia

La asignación conserva exactamente:

- `ASSIGNED`;
- `AVAILABLE`;
- `STARTED`;
- `COMPLETED`;
- `CANCELLED`;
- `SUPERSEDED`.

La comprobación o competencia conserva de forma separada:

- `NOT_REQUIRED`;
- `PENDIENTE_DE_EVIDENCIA`;
- `PASSED`;
- `FAILED`;
- `EXPIRED`.

La experiencia debe impedir estas equivalencias falsas:

```text
COMPLETED = PASSED
PASSED = COMPETENT PARA CUALQUIER CONTEXTO
COMPETENCE_EVIDENCE = PERMISSION
TRAINING_ASSIGNMENT = AUTHORIZATION
```

No se inventan nota mínima, duración, vigencia o periodicidad si la autoridad propietaria no las ha fijado.

---

#### 30. Capacitación de soporte técnico

Para `SERVICE_DESK_L1` y `TECHNICAL_SUPPORT_L2`, el aprendizaje debe conectarse con el trabajo real sin convertir el expediente del caso en un curso.

La experiencia puede presentar:

- guía diagnóstica relacionada;
- known error vigente;
- cambio reciente que afecta la capacidad;
- runbook permitido;
- material de aprendizaje asignado;
- señal de que una versión del material fue sustituida;
- retroalimentación posterior a una resolución.

El acceso a contenido restringido sigue dependiendo de autorización, no de pertenencia a la audiencia de aprendizaje.

---

#### 31. Sin saturación técnica

Se establecen estas reglas de experiencia:

1. **acción antes que explicación extensa**: la vista comienza por la tarea y el siguiente paso;
2. **contexto reutilizado**: no se vuelve a preguntar lo que el sistema ya conoce de forma autorizada;
3. **una guía no se muestra completa si solo un paso es relevante**;
4. **detalle técnico bajo demanda**: logs, topología, códigos y evidencia restringida no compiten con la acción ordinaria;
5. **jerga traducida o explicada**: el término interno no se usa como única instrucción;
6. **sin manuales permanentes dentro del flujo**: el contenido extenso vive en conocimiento y se enlaza contextualmente;
7. **sin curso como castigo por error**: un error puede generar una señal de aprendizaje, no una asignación automática;
8. **sin alertas repetidas por contenido ya completado o sustituido**;
9. **sin duplicación entre FAQ, artículo, mensaje, cambio y capacitación**;
10. **sin privilegio por comprensión**: saber cómo se hace algo no autoriza hacerlo.

---

#### 32. Accesibilidad de la divulgación progresiva

Expandir, colapsar o revelar detalle debe:

- funcionar con teclado y tecnología asistiva en superficies web aplicables;
- conservar nombre y estado del control;
- relacionar control y contenido;
- mantener orden de lectura y foco;
- anunciar cambios relevantes;
- no depender de color, ícono, hover o gesto como único mecanismo;
- no dejar contenido colapsado navegable como si estuviera visible;
- conservar el contexto del caso o artículo al abrir detalle especializado.

En móvil, el patrón equivalente conserva objetivos táctiles suficientes y no depende de hover.

---

#### 33. Mensajes y explicación de bloqueos

Cuando una guía o aprendizaje no puede continuar, el mensaje responde:

```text
QUÉ OCURRIÓ
QUÉ SE CONSERVÓ
POR QUÉ NO PUEDE CONTINUAR
QUIÉN O QUÉ DEBE ACTUAR
QUÉ PUEDE HACER LA PERSONA AHORA
```

Ejemplos de condiciones que deben distinguirse:

- contenido vencido;
- versión incompatible;
- falta de evidencia;
- falta de autorización;
- paso no aplicable;
- servicio no disponible;
- dependencia externa;
- conflicto de contexto;
- guía sustituida;
- información sensible que requiere otro nivel de acceso.

No se usa un único mensaje de “algo salió mal” para todas esas condiciones.

---

#### 34. Comunicación de cambios y ayuda

Las siete clases canónicas de comunicación de cambio permanecen separadas del conocimiento y del aprendizaje:

- `PRE_CHANGE_NOTICE`;
- `IN_WINDOW_STATUS`;
- `CHANGE_AVAILABLE`;
- `DEGRADED_OR_PARTIAL`;
- `ROLLBACK_NOTICE`;
- `KNOWN_ISSUE_NOTICE`;
- `POST_CHANGE_LEARNING`.

La experiencia puede enlazar una comunicación con una guía o capacitación, pero:

- la comunicación no aprueba el cambio;
- un anuncio no se convierte en artículo;
- una nueva versión de conocimiento no demuestra despliegue;
- un rollback invalida cualquier mensaje que presente el cambio como disponible cuando ya no lo está.

---

#### 35. Anuncios

La superficie genérica de anuncios puede presentar una novedad o enlace, pero no debe convertirse en la fuente de identidad de conocimiento o capacitación.

La experiencia objetivo mantiene:

```text
ANNOUNCEMENT
≠ KNOWLEDGE_ITEM
≠ CHANGE_COMMUNICATION
≠ TRAINING_ASSIGNMENT
```

Si una implementación futura reutiliza anuncios, deberá conservar referencias suficientes para resolver audiencia, vigencia y objeto canónico sin duplicar el contenido gobernado.

---

#### 36. Feedback de conocimiento

La persona puede indicar que una guía:

- resolvió la necesidad;
- no resolvió la necesidad;
- no aplicaba;
- estaba desactualizada;
- era confusa;
- produjo bloqueo o escalamiento.

El feedback crea una señal o solicitud de revisión.

No:

- edita el artículo publicado;
- cambia su fuente;
- rebaja controles;
- convierte la opinión individual en nueva verdad;
- marca automáticamente a la persona como competente;
- crea por sí solo una causa raíz.

---

#### 37. Señales de adopción

Se conservan las ocho clases:

1. `DELIVERY_SIGNAL`;
2. `READ_SIGNAL`;
3. `LEARNING_SIGNAL`;
4. `COMPETENCE_SIGNAL`;
5. `USAGE_SIGNAL`;
6. `SUPPORT_SIGNAL`;
7. `ERROR_SIGNAL`;
8. `ROLLBACK_SIGNAL`.

La experiencia administrativa debe explicar la fuente y el periodo de una señal antes de presentar conclusiones.

No se presenta un porcentaje sin denominador, una tendencia sin periodo comparable ni una inferencia de adopción basada únicamente en lectura, finalización o bajo volumen de tickets.

Las señales se usan para mejorar capacidad y experiencia; no se convierten por defecto en medición individual de productividad.

---

#### 38. Frescura, disponibilidad y modo degradado

Si el sistema no puede comprobar que una guía sigue publicada y vigente, no la presenta silenciosamente como orientación actual.

La experiencia diferencia:

- contenido vigente confirmado;
- contenido histórico consultado por referencia de caso;
- contenido sustituido;
- contenido vencido;
- contenido retirado;
- vigencia no comprobable.

En vigencia no comprobable, se ofrece una alternativa segura o escalamiento.

Una copia local o caché no puede elevar por sí sola un artículo a `PUBLISHED` vigente.

---

#### 39. Privacidad y minimización en ayuda y capacitación

La experiencia de ayuda y aprendizaje no debe copiar innecesariamente:

- nombres de terceros;
- contactos;
- información laboral ajena;
- datos financieros;
- contenido de tickets de otras personas;
- secretos;
- tokens;
- credenciales;
- sesiones;
- logs completos;
- payloads no sanitizados.

Los ejemplos de capacitación deben preferir datos ficticios, minimizados o generalizados.

Una captura o evidencia de soporte solo se reutiliza en conocimiento después de sanitización y revisión.

---

#### 40. Cobertura de experiencia por los once servicios

Cada servicio heredado recibe una decisión explícita de ayuda, diagnóstico o aprendizaje sin cambiar su identidad ni su autoridad:

| Servicio         | Nombre canónico                                                         | Decisión de experiencia                                                                                                                                      |
| ---------------- | ----------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| `TI-SERVICE-001` | Cuentas, identidad y acceso tecnológico                                 | ayuda humana sobre acceso y estado; diagnóstico guiado puede comprobar contexto y resultado autorizado, pero nunca revelar secretos ni conceder permisos     |
| `TI-SERVICE-002` | Endpoints, computadores, celulares, tabletas y dispositivos compartidos | ayuda contextual por dispositivo y capacidad; comprobaciones separan activo, endpoint, dispositivo compartido, sesión y actor                                |
| `TI-SERVICE-003` | Redes y conectividad                                                    | la persona recibe lenguaje de conectividad y acciones seguras; el detalle de red, direccionamiento, topología o log se revela solo en diagnóstico autorizado |
| `TI-SERVICE-004` | Impresoras y periféricos                                                | la guía distingue dispositivo físico, conexión, cola, trabajo y resultado; una prueba de envío no se presenta como impresión física confirmada               |
| `TI-SERVICE-005` | Aplicaciones, ambientes y proveedores tecnológicos                      | la ayuda usa aplicación, capacidad, versión y ambiente demostrados; proveedor, contrato o disponibilidad externa no se infieren desde framework o SDK        |
| `TI-SERVICE-006` | Solicitudes de soporte tecnológico                                      | ANIMA permite pedir ayuda sin clasificar técnicamente; VISO conserva el caso y reutiliza contexto, guía y comprobaciones anteriores                          |
| `TI-SERVICE-007` | Incidentes y restauración tecnológica                                   | diagnóstico y conocimiento priorizan restauración segura; restaurar no equivale a eliminar causa ni cerrar automáticamente                                   |
| `TI-SERVICE-008` | Cambios, configuración y versiones tecnológicas                         | comunicación, guía y aprendizaje explican el cambio; ninguna instrucción de conocimiento sustituye aprobación, ejecución o rollback                          |
| `TI-SERVICE-009` | Pruebas y aceptación técnica de soluciones                              | la experiencia relaciona procedimiento, versión, objeto probado, evidencia y resultado; una prueba técnica no sustituye aceptación empresarial               |
| `TI-SERVICE-010` | Licencias, garantías, contratos y costos tecnológicos                   | la ayuda puede explicar capacidad, vigencia o soporte demostrados; no duplica proveedor, contrato, garantía, gasto o costo de sus fuentes propietarias       |
| `TI-SERVICE-011` | Conocimiento, capacitación y adopción tecnológica                       | consume directamente el diseño de búsqueda, publicación, aprendizaje contextual, competencia y señales definido en esta tarea                                |

Control:

```text
11 servicios esperados
11 servicios con decisión explícita
0 omitidos
0 renombrados
0 añadidos
```

---

#### 41. Reconciliación AS-IS de ANIMA

La superficie actual de soporte de ANIMA ya materializa:

- acceso a tickets del trabajador;
- conversación dentro del ticket;
- creación de ticket;
- una sección de preguntas frecuentes;
- seis temas de FAQ codificados actualmente en la aplicación;
- expansión y colapso de cada respuesta;
- contenido redactado como instrucciones breves.

Frente al contrato objetivo:

| Aspecto      | AS-IS observado                                                 | Decisión objetivo                                                         |
| ------------ | --------------------------------------------------------------- | ------------------------------------------------------------------------- |
| FAQ          | contenido estático dentro del cliente                           | consumir conocimiento gobernado y versionado cuando exista implementación |
| vigencia     | no se demuestra ciclo canónico por artículo desde la FAQ actual | resolver `PUBLISHED` y vigencia desde la fuente propietaria               |
| audiencia    | la lista es común a la pantalla                                 | filtrar por contexto y audiencia cuando aplique                           |
| versión      | no se materializa como versión canónica de conocimiento         | conservar versión de contenido y aplicabilidad                            |
| escalamiento | algunas respuestas indican crear ticket                         | conservar contexto y pasos al escalar                                     |
| feedback     | no se demuestra contrato de revisión del conocimiento           | generar señal de feedback sin editar contenido automáticamente            |
| sensibilidad | FAQ ordinaria evita diagnóstico profundo                        | mantener detalle restringido fuera del carril personal                    |

La FAQ actual sirve como referencia de simplicidad visual, no como fuente canónica de conocimiento.

---

#### 42. Reconciliación AS-IS de VISO

La inspección actual de VISO confirma una aplicación administrativa con navegación y superficies existentes, pero las fuentes revisadas no demuestran de extremo a extremo una experiencia física de base de conocimiento versionada ni un diagnóstico guiado bajo el contrato de esta tarea.

La ausencia de resultados en una búsqueda de código no se utiliza como prueba absoluta de inexistencia.

Estado documental:

| Componente objetivo                        | Estado                   |
| ------------------------------------------ | ------------------------ |
| diagnóstico guiado vinculado al caso       | `ESPECIFICADO`           |
| consumo de conocimiento vigente            | `ESPECIFICADO`           |
| administración editorial                   | `ESPECIFICADO`           |
| aprendizaje contextual para soporte        | `ESPECIFICADO`           |
| persistencia física del conocimiento       | `PENDIENTE_DE_EVIDENCIA` |
| persistencia física de capacitación        | `PENDIENTE_DE_EVIDENCIA` |
| medición runtime de adopción bajo contrato | `PENDIENTE_DE_EVIDENCIA` |
| implementación de nuevas superficies       | `NO_APLICA` en esta fase |

---

#### 43. Qué cambia respecto del estado actual

Para el trabajador:

- la FAQ deja de ser conceptualmente una lista fija independiente y pasa a ser una proyección contextual de conocimiento vigente;
- al escalar, el caso recibe lo que ya se comprobó;
- la ayuda no exige identificar la causa técnica;
- capacitación y soporte permanecen relacionados pero separados.

Para soporte:

- el diagnóstico deja de depender de memoria personal o navegación libre por herramientas;
- cada comprobación tiene propósito, resultado y rama;
- el detalle sensible se abre gradualmente y con autorización;
- known errors, workarounds, cambios y artículos quedan relacionados sin confundirse;
- una solución reutilizable puede producir candidato de conocimiento con sanitización y revisión.

Para gobierno:

- conocimiento, anuncio, comunicación y capacitación ya no se tratan como el mismo tipo de contenido;
- versión y vigencia quedan visibles;
- feedback y adopción producen señales trazables;
- contenido obsoleto no permanece como ayuda actual por inercia.

---

#### 44. Utilidad operativa esperada

El diseño reduce:

- repetición de preguntas ya contestadas;
- dependencia de memoria del técnico;
- exposición innecesaria de información técnica;
- soporte basado en prueba y error sin registro;
- FAQ divergente del procedimiento vigente;
- capacitación general enviada a personas no afectadas;
- confusión entre “leí”, “terminé”, “aprobé”, “soy competente” y “estoy autorizado”.

Y mejora:

- reproducibilidad del diagnóstico;
- escalamiento con contexto;
- reutilización segura del conocimiento;
- comprensión del trabajador;
- control de versiones;
- revisión de contenido después de cambios o incidentes;
- trazabilidad entre soporte, conocimiento y aprendizaje.

---

#### 45. Cómo se verá conceptualmente en ANIMA

```text
AYUDA Y SOPORTE

¿En qué necesitas ayuda?
Contexto detectado: tu tarea / aplicación / sede cuando sea pertinente

AYUDA RECOMENDADA
Título humano de la guía
Aplica a: ...
Siguiente acción segura: ...
[ Ver guía ]

Si no se resuelve
[ Continuar con soporte ]

MIS CASOS
- estado humano
- última actualización
- siguiente acción

APRENDIZAJE PARA TI
Solo cuando existe una asignación o recomendación contextual aplicable
```

El detalle editorial, la telemetría y el diagnóstico restringido permanecen fuera de esta vista.

---

#### 46. Cómo se verá conceptualmente en VISO

```text
CASO TECNOLÓGICO

RESUMEN
Síntoma · servicio · elemento · prioridad · SLA · owner

DIAGNÓSTICO
Comprobación actual
Resultado
Siguiente rama
[ Continuar ] [ Escalar ]

CONOCIMIENTO RELACIONADO
- guía diagnóstica vigente
- error conocido aplicable
- workaround vigente
- cambio reciente relacionado

DETALLE RESTRINGIDO
Se muestra únicamente cuando la acción y autorización lo permiten

APRENDIZAJE / MEJORA
- candidato de conocimiento
- feedback de guía
- material actualizado o sustituido
```

Las superficies administrativas de publicación y auditoría se mantienen separadas del trabajo ordinario del caso.

---

#### 47. Handoffs físicos y propietarios

| Pendiente físico                                      | Estado en esta tarea     | Propietario o destino                                                                                      | Condición de salida                                                              |
| ----------------------------------------------------- | ------------------------ | ---------------------------------------------------------------------------------------------------------- | -------------------------------------------------------------------------------- |
| persistencia de artículos, versiones, fuentes y ciclo | `FUERA_DE_ALCANCE`       | `NEXO-REMISSIONS-001::CONDITIONAL_IMPLEMENTATION_SCOPE` y paquete de implementación que resulte autorizado | alcance físico aprobado, modelo persistido y pruebas aplicables                  |
| experiencia física de diagnóstico en VISO             | `FUERA_DE_ALCANCE`       | `NEXO-REMISSIONS-001::CONDITIONAL_IMPLEMENTATION_SCOPE` y paquete VISO autorizado                          | superficie implementada, protegida y validada contra caso y autorización         |
| consumo de conocimiento contextual en ANIMA           | `FUERA_DE_ALCANCE`       | `NEXO-REMISSIONS-001::CONDITIONAL_IMPLEMENTATION_SCOPE` y paquete ANIMA autorizado                         | cliente consume fuente versionada sin FAQ competidora y conserva fallback seguro |
| asignación, progreso y comprobación de capacitación   | `FUERA_DE_ALCANCE`       | `NEXO-REMISSIONS-001::CONDITIONAL_IMPLEMENTATION_SCOPE` y paquete ANIMA/VISO que resulte autorizado        | estados persistidos y separados de autorización                                  |
| vínculo entre anuncio, cambio y conocimiento          | `FUERA_DE_ALCANCE`       | `TI-INT-002` y paquete autorizado                                                                          | contrato interaplicación materializado y probado                                 |
| señales de adopción y frescura                        | `FUERA_DE_ALCANCE`       | `TI-INT-001` y paquete autorizado                                                                          | fuentes instrumentadas y observaciones reconciliables disponibles                |
| integración con documentación o herramientas externas | `FUERA_DE_ALCANCE`       | `TI-INT-003`                                                                                               | contrato de proveedor, autenticación, alcance, sanitización y salida definidos   |
| duración de retención de evidencia de soporte         | `PENDIENTE_DE_EVIDENCIA` | `INFO-DOM-006`                                                                                             | política vigente fija disparador, duración, excepciones, hold y disposición      |

No queda un pendiente propio de esta experiencia sin destino y condición de salida.

---

#### 48. Invariantes

1. la guía no es el caso;
2. el caso no es el artículo;
3. el mensaje no es conocimiento publicado;
4. el error conocido no es artículo por sí solo;
5. el workaround no es resolución permanente;
6. la health no es diagnóstico ni causa;
7. abrir diagnóstico no concede privilegio;
8. leer una guía no autoriza una acción;
9. completar capacitación no concede permiso;
10. una audiencia de aprendizaje no es rol;
11. un artículo histórico no se presenta como vigente por existir en caché;
12. una FAQ estática no sustituye la base gobernada;
13. el trabajador no necesita conocer arquitectura para pedir ayuda;
14. el técnico no empieza por el dato más sensible disponible;
15. una señal de adopción no se convierte automáticamente en conclusión;
16. el feedback no reescribe contenido publicado;
17. una comunicación no prueba despliegue;
18. un anuncio no es asignación de aprendizaje;
19. la experiencia no crea fuente de verdad paralela;
20. ninguna decisión documental de esta tarea modifica Supabase o aplicaciones.

---

#### 49. Estado de materialización

| Componente                                         | Estado                    |
| -------------------------------------------------- | ------------------------- |
| experiencia personal de ayuda contextual           | `ESPECIFICADO`            |
| escalamiento con contexto preservado               | `ESPECIFICADO`            |
| diagnóstico guiado de VISO                         | `ESPECIFICADO`            |
| progresión de sensibilidad diagnóstica             | `ESPECIFICADO`            |
| búsqueda y consumo de conocimiento                 | `ESPECIFICADO`            |
| presentación de ciclo de vida                      | `ESPECIFICADO`            |
| intake, revisión y publicación                     | `ESPECIFICADO`            |
| capacitación contextual                            | `ESPECIFICADO`            |
| separación de estados de aprendizaje y competencia | `ESPECIFICADO`            |
| feedback y adopción                                | `ESPECIFICADO`            |
| reconciliación de FAQ actual de ANIMA              | `ESPECIFICADO`            |
| reconciliación de VISO                             | `ESPECIFICADO`            |
| persistencia runtime bajo este contrato            | `PENDIENTE_DE_EVIDENCIA`  |
| implementación física                              | `NO_APLICA` en esta tarea |

---

#### 50. Criterios de aceptación

- [x] se conserva la continuidad `TI-UX-005 → TI-UX-006 → TI-INT-001`;
- [x] la tarea permanece exclusivamente documental;
- [x] ANIMA y VISO conservan responsabilidades distintas y complementarias;
- [x] la ayuda del trabajador no exige conocimiento técnico previo;
- [x] el escalamiento conserva contexto, guía, pasos y resultados ya capturados;
- [x] el diagnóstico se vincula al caso tecnológico;
- [x] cada comprobación puede expresar objetivo, resultado, bloqueo y rama siguiente;
- [x] se conserva la progresión de cinco capas de sensibilidad diagnóstica;
- [x] health, diagnóstico, causa, prioridad y resolución permanecen separados;
- [x] known error, workaround, artículo y cambio permanecen separados;
- [x] solo conocimiento publicado, vigente, compatible y autorizado se prioriza como ayuda ordinaria;
- [x] se conservan 10/10 clases de conocimiento;
- [x] se conservan 6/6 estados del ciclo de conocimiento;
- [x] candidatos de soporte pasan por curación y puerta de publicación;
- [x] la publicación no replica secretos, datos personales o contenido específico innecesario del caso;
- [x] se conservan 12/12 clases de fuente;
- [x] se conservan 8/8 audiencias de aprendizaje;
- [x] las audiencias no crean roles ni permisos;
- [x] se conservan 6/6 estados de asignación;
- [x] se conservan 5/5 estados de comprobación o competencia;
- [x] finalización, comprobación, competencia, adopción y autorización permanecen separadas;
- [x] la capacitación se activa por contexto y no por envío indiscriminado;
- [x] no se inventan puntajes, duraciones, periodicidades o vigencias;
- [x] se conservan 7/7 clases de comunicación de cambio;
- [x] se conservan 8/8 clases de señal de adopción;
- [x] no se presenta porcentaje sin denominador ni tendencia sin periodo comparable;
- [x] la experiencia aplica divulgación progresiva y lenguaje humano;
- [x] el detalle técnico sensible permanece sujeto a autorización;
- [x] la FAQ actual de ANIMA se reconcilia sin presentarla como base canónica;
- [x] las búsquedas de código no se utilizan como prueba absoluta de ausencia;
- [x] todo pendiente físico tiene propietario y condición de salida;
- [x] no se crean ni modifican requisitos de prueba;
- [x] no se ejecuta ningún cambio físico;
- [x] `TI-INT-001` permanece únicamente reservada.

---

#### 51. Cobertura de prueba consumida

La tarea consume cobertura canónica vigente que ya protege:

- mesa de servicio simple, diagnóstico, error conocido, workaround, conocimiento y ocultamiento de detalles sensibles;
- soporte personal de ANIMA limitado al actor y territorio autorizados;
- lenguaje humano y ausencia de navegación ordinaria por identificadores técnicos;
- relevancia y densidad adecuadas al actor y tarea;
- divulgación progresiva y protección del contenido colapsado;
- preservación de contexto al abrir detalle especializado;
- ayuda y capacitación que no sustituyen comprensión;
- separación de mensajes, estados, fallos, bloqueos y recuperación;
- minimización de datos sensibles y protección de evidencia;
- trazabilidad, autorización y pilotaje posterior.

La tarea materializa estas obligaciones para la experiencia tecnológica sin cambiar la regla protegida ni el mecanismo de seguridad exigido.

---

#### 52. Requisitos de prueba derivados

**Resultado:** NO GENERA REQUISITOS DE PRUEBA

**Justificación:** el comportamiento verificable de diagnóstico, conocimiento, ayuda contextual, soporte personal, autorización, divulgación progresiva, lenguaje humano, capacitación y protección de información sensible ya está cubierto por requisitos canónicos vigentes. Esta tarea organiza esas obligaciones en una experiencia materializada y conserva los contratos aprobados de `TI-DOM-013` y `TI-AUTH-004` sin introducir una nueva transición empresarial, permiso, algoritmo, efecto físico o condición de prueba independiente.

**Balance:** 0 creados; 0 modificados; 0 diferidos; 0 descartados; 0 obsoletos.

---

#### 53. Continuidad

ÚLTIMA TAREA APROBADA
`TI-UX-005 — Diseñar gestión de aplicaciones, proveedores, licencias, contratos, renovaciones y costos`

TAREA ACTUAL APROBADA
`TI-UX-006 — Diseñar diagnóstico guiado, base de conocimiento y capacitación contextual sin saturación técnica`

SIGUIENTE TAREA RESERVADA
`TI-INT-001 — Definir adaptadores de telemetría para endpoints, redes, impresoras, aplicaciones y servicios externos`

