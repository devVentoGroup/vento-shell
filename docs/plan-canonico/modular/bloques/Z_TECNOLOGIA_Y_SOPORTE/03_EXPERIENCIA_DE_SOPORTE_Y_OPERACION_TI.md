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


### [ ] TI-UX-002 — Diseñar mesa de servicio de VISO con colas, prioridad, SLA, asignación, comunicación y validación
### [ ] TI-UX-003 — Diseñar mapa de dispositivos, redes, impresoras, aplicaciones y salud técnica
### [ ] TI-UX-004 — Diseñar flujos de incidente, problema, cambio, mantenimiento y recuperación
### [ ] TI-UX-005 — Diseñar gestión de aplicaciones, proveedores, licencias, contratos, renovaciones y costos
### [ ] TI-UX-006 — Diseñar diagnóstico guiado, base de conocimiento y capacitación contextual sin saturación técnica
