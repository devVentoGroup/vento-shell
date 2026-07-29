### MINI-BLOQUE — CLASIFICACIÓN FUNCIONAL DE PANTALLAS

<!-- PLAN-SECTION-META:START -->
Esta sección organiza **clasificación funcional de pantallas** dentro de **E2 PROCESOS Y EXPERIENCIA**. Agrupa tareas que producen un resultado funcional común y deben mantenerse juntas para conservar contexto, trazabilidad y orden de ejecución.

**Cobertura canónica:** `PROC-SCREEN-005` a `PROC-SCREEN-011` — 7 tareas.

**Resultado esperado:** al cerrar este mini-bloque, su resultado debe quedar definido, verificable y coherente con las secciones anterior y siguiente antes de avanzar.

**Límites funcionales:** comienza con “Clasificar pantalla operativa” y concluye con “Clasificar pantalla de cliente”.
<!-- PLAN-SECTION-META:END -->

### ✅ PROC-SCREEN-005 — Clasificar pantalla operativa

**Estado:** APROBADA

**Bloque:** E2 — Arquitectura funcional, procesos y experiencia transversal

**Marcador exacto que reemplaza:** `### [ ] PROC-SCREEN-005 — Clasificar pantalla operativa`

**Tarea anterior:** `PROC-SCREEN-004 — Vincular cada pantalla con un paso del proceso` — APROBADA

**Siguiente tarea reservada:** `PROC-SCREEN-006 — Clasificar pantalla administrativa` — NO INICIADA

**Artefactos lógicos contenidos en esta tarea:**

- `SCREEN-OPERATIONAL-CLASSIFICATION-CONTRACT-001`;
- `SCREEN-OPERATIONAL-PATTERN-VOCABULARY-001`;
- `SCREEN-OPERATIONAL-CLASSIFICATION-REGISTER-001`;
- `SCREEN-OPERATIONAL-COVERAGE-MATRIX-001`;
- `SCREEN-OPERATIONAL-CLASSIFICATION-CHANGE-POLICY-001`;
- `SCREEN-OPERATIONAL-CLASSIFICATION-VALIDATION-GATE-001`;
- `SCREEN-OPERATIONAL-CARRYOVER-REGISTER-001`.

**Resultado cuantitativo:** **177 pantallas clasificadas**, de las cuales **54** quedan como `PRIMARY_OPERATIONAL`, **30** como `SECONDARY_OPERATIONAL` y **93** como `OUTSIDE_OPERATIONAL_CLASS`; se utilizan **11 patrones operativos**, existen **84 pantallas con relevancia operativa** y no se crean pantallas para AURA.

**Naturaleza:** clasificación documental del grado de relación de cada pantalla con la ejecución operativa interna. No define todavía clasificación administrativa, de supervisión, configuración, auditoría, personal o de cliente; tampoco define actores, dispositivos, acciones, estados de interfaz, sensibilidad, permisos, rutas u operaciones técnicas.

**Cambios en código de producto, componentes, rutas, repositorios consumidores, Supabase, tablas, migraciones, RLS, RPC, eventos, analítica o producción:** no autorizados por esta tarea.

---

#### 1. Propósito

Determinar cuáles pantallas constituyen el espacio principal de ejecución operativa interna de Vento Group, cuáles solo prestan soporte inmediato a esa ejecución y cuáles quedan fuera de la clase operativa.

```text
PANTALLA
    +
PROCESO Y PASO DOMINANTES
    +
EFECTO SOBRE TRABAJO VIVO
    +
URGENCIA Y CONTINUIDAD OPERATIVA
    =
CLASIFICACION OPERATIVA TRAZABLE
```

La clasificación responde **qué grado de relación tiene la pantalla con la operación viva**. No concede acceso, no asigna actores, no exige por sí sola turno, check-in, sede, área, estación o dispositivo compartido y no sustituye los permisos atómicos.

---

#### 2. Dependencias consumidas

- `PROC-SCREEN-001` y la identidad estable `VSCREEN-*`;
- `PROC-SCREEN-002` y las aplicaciones primarias;
- `PROC-SCREEN-003` y los procesos primarios;
- `PROC-SCREEN-004` y los pasos dominantes;
- `PROC-CAT-001` a `PROC-CAT-020`;
- `PROC-ACTOR-001` a `PROC-ACTOR-010`;
- `UX-BASE-001` a `UX-BASE-015`;
- `UX-STATION-001` a `UX-STATION-012`;
- `UX-ADMIN-001` a `UX-ADMIN-005`;
- los contratos aprobados de contexto operativo, estaciones compartidas, handoff, canal personal y canal de cliente.

La tarea consume estas fuentes sin reabrirlas. Una pantalla no se clasifica como operativa por pertenecer a NEXO, FOGO o PULSO, ni deja de serlo por vivir en SHELL, VISO, ANIMA u ORIGO.

---

#### 3. Alcance

1. incorporar `operational_fit` a las 177 pantallas;
2. distinguir operación primaria, soporte operativo secundario y ausencia de clase operativa;
3. definir once patrones operativos reutilizables;
4. clasificar cada pantalla mediante proceso, paso, objeto, efecto y urgencia;
5. evitar que configuración, auditoría, análisis, canal personal o canal de cliente sean tratados automáticamente como operación interna;
6. conservar las fronteras entre aplicaciones;
7. impedir que la clasificación otorgue permisos o contexto;
8. establecer versionado, validaciones y carryovers exactos;
9. dejar preparada la continuidad hacia `PROC-SCREEN-006` a `PROC-SCREEN-011`;
10. exigir que la última tarea de clasificación cierre una única clase primaria por pantalla.

---

#### 4. Exclusiones

Esta tarea no:

- clasifica formalmente pantallas administrativas, de supervisión, configuración, auditoría, personales o de cliente;
- decide actores, roles o segregación;
- define dispositivos, estaciones o periféricos;
- define acción principal o acciones secundarias;
- define condiciones de entrada o salida;
- diseña estados vacíos, carga, bloqueo o recuperación de interfaz;
- decide información sensible visible;
- asigna permisos de lectura o acción;
- vincula Server Actions, APIs, RPC, eventos o tablas;
- mapea rutas o componentes legacy;
- activa AURA;
- convierte toda pantalla de una aplicación operativa en pantalla operativa.

---

#### 5. Definición canónica de pantalla operativa

Una pantalla tiene relevancia operativa cuando interviene sobre un trabajo empresarial **activo**, con efecto temporalmente sensible, y cumple al menos una de estas condiciones:

- ejecuta o confirma una mutación física, productiva, comercial, logística o de servicio;
- captura un hecho operacional necesario para continuar;
- admite o prioriza una cola de trabajo vivo;
- valida o decide una excepción que bloquea la continuidad;
- monitorea un compromiso abierto y permite actuar sobre desvíos;
- cierra un ciclo operativo;
- recupera o contiene una interrupción operacional;
- aporta consulta o identificación inmediata indispensable para ejecutar.

No basta con:

- mostrar información;
- pertenecer a una aplicación operativa;
- usar una tableta o dispositivo compartido;
- estar disponible durante un turno;
- consultar una tabla transaccional;
- contener un botón;
- tener un paso `EXECUTE`;
- ser importante para la empresa.

---

#### 6. Estados de clasificación

| Valor                       | Significado                                                                                                            | Efecto documental                                                    |
| --------------------------- | ---------------------------------------------------------------------------------------------------------------------- | -------------------------------------------------------------------- |
| `PRIMARY_OPERATIONAL`       | ejecutar, entrar, identificar, consultar o guiar trabajo vivo es la intención dominante e indispensable de la pantalla | reserva `OPERATIONAL` como clase primaria                            |
| `SECONDARY_OPERATIONAL`     | la pantalla presta soporte inmediato a la operación, pero otra clase será primaria                                     | agrega relevancia operativa secundaria sin cerrar la clase principal |
| `OUTSIDE_OPERATIONAL_CLASS` | la pantalla no representa ejecución ni soporte operativo interno bajo este contrato                                    | queda disponible para las clasificaciones posteriores                |

Cada pantalla recibe exactamente uno de estos tres valores en esta tarea.

`SECONDARY_OPERATIONAL` no significa menor importancia. Significa que la pantalla apoya la operación mediante planificación, consulta, cola, control, monitoreo, recuperación o autoservicio, mientras su intención primaria pertenece probablemente a otro carril que deberá aprobarse después.

Una entrada, identificación, consulta o guía puede ser `PRIMARY_OPERATIONAL` cuando constituye el trabajo dominante del paso activo y su ausencia o demora impide ejecutar correctamente. No se exige una mutación material artificial para reconocer esa intención.

---

#### 7. Contrato mínimo

| Campo                                | Obligación                                                           |
| ------------------------------------ | -------------------------------------------------------------------- |
| `screen_id`                          | `VSCREEN-*` canónico                                                 |
| `primary_application_id`             | aplicación aprobada en `PROC-SCREEN-002`                             |
| `primary_process_id`                 | proceso aprobado en `PROC-SCREEN-003`                                |
| `primary_process_step_ref`           | paso aprobado en `PROC-SCREEN-004`                                   |
| `operational_fit`                    | uno de los tres estados aprobados                                    |
| `operational_pattern`                | uno de los once patrones o `NONE`                                    |
| `operational_reason`                 | fundamento verificable                                               |
| `operational_classification_version` | versión semántica                                                    |
| `operational_classification_status`  | `CANONICAL`, `CHANGE_PROPOSED`, `SUPERSEDED` o `RETIRED_WITH_SCREEN` |
| `operational_classification_task`    | tarea que aprobó o modificó la decisión                              |

Valores iniciales:

```text
operational_classification_version: 1.0.0
operational_classification_status: CANONICAL
operational_classification_task: PROC-SCREEN-005
decision_record: INITIAL_OPERATIONAL_CLASSIFICATION
```

---

#### 8. SCREEN-OPERATIONAL-PATTERN-VOCABULARY-001

| Patrón                   | Uso                                                                        |
| ------------------------ | -------------------------------------------------------------------------- |
| `OPERATIONAL_ENTRY`      | habilita la entrada inmediata a un espacio o contexto de trabajo operativo |
| `OPERATIONAL_QUEUE`      | admite, ordena o prioriza trabajo operativo pendiente                      |
| `OPERATIONAL_LOOKUP`     | identifica o consulta información imprescindible para ejecutar             |
| `OPERATIONAL_PLANNING`   | prepara capacidad, secuencia, ruta, mantenimiento o producción próxima     |
| `OPERATIONAL_CAPTURE`    | registra hechos, cantidades, tiempos, avances o condiciones                |
| `OPERATIONAL_EXECUTION`  | ejecuta o confirma una mutación material de la operación                   |
| `OPERATIONAL_CONTROL`    | valida, revisa, reconcilia o decide sobre trabajo activo                   |
| `OPERATIONAL_MONITORING` | sigue un compromiso operativo abierto                                      |
| `OPERATIONAL_EXCEPTION`  | resuelve rechazo, devolución, diferencia, reversión o retorno              |
| `OPERATIONAL_CLOSURE`    | cierra una sesión, lote o ciclo operativo                                  |
| `OPERATIONAL_RECOVERY`   | restablece o contiene la continuidad operacional                           |
| `NONE`                   | no existe relevancia operativa bajo esta tarea                             |

El patrón no sustituye el paso del proceso ni anticipa acciones de interfaz.

---

#### 9. Algoritmo de decisión

Se clasifica `PRIMARY_OPERATIONAL` cuando:

1. existe un caso, objeto, sesión, lote, pedido, movimiento, ruta, recepción o servicio activo;
2. la pantalla modifica, confirma, concilia o cierra su estado material;
3. la omisión o demora bloquea o degrada la operación inmediata;
4. la persona reconoce la pantalla como lugar principal para realizar ese trabajo;
5. la intención persiste aunque cambie ruta, componente o dispositivo.

Se clasifica `SECONDARY_OPERATIONAL` cuando:

1. la pantalla sirve a trabajo vivo mediante consulta, cola, planificación, control, monitoreo, recuperación o autoservicio;
2. no concentra la mutación material principal;
3. otra clase será probablemente dominante;
4. retirar la pantalla degrada la operación, pero no elimina el espacio propietario de ejecución.

Se clasifica `OUTSIDE_OPERATIONAL_CLASS` cuando predomina:

- gobierno o administración;
- configuración de maestros o políticas;
- auditoría histórica;
- análisis estratégico o financiero;
- autoservicio personal no operativo;
- experiencia de cliente;
- acceso o cuenta transversal sin trabajo operativo material.

---

#### 10. SCREEN-OPERATIONAL-CLASSIFICATION-REGISTER-001

| Screen ID      | Pantalla                                              | Aplicación | Paso dominante                                              | Clasificación operativa     | Patrón                   | Fundamento                                                                                                                                                                                                                                         |
| -------------- | ----------------------------------------------------- | ---------- | ----------------------------------------------------------- | --------------------------- | ------------------------ | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `VSCREEN-0001` | Hub Vento OS                                          | `shell`    | `VPROC-0059::STEP-ENTER_ECOSYSTEM`                          | `OUTSIDE_OPERATIONAL_CLASS` | `NONE`                   | Acceso, cuenta o navegación transversal; no constituye por sí misma una superficie operativa.                                                                                                                                                      |
| `VSCREEN-0002` | Inicio de sesión y recuperación                       | `shell`    | `VPROC-0059::STEP-AUTHENTICATE_OR_RECOVER`                  | `OUTSIDE_OPERATIONAL_CLASS` | `NONE`                   | Acceso, cuenta o navegación transversal; no constituye por sí misma una superficie operativa.                                                                                                                                                      |
| `VSCREEN-0003` | Resolución de contexto y acceso                       | `shell`    | `VPROC-0059::STEP-RESOLVE_EFFECTIVE_CONTEXT`                | `SECONDARY_OPERATIONAL`     | `OPERATIONAL_ENTRY`      | La pantalla habilita la entrada inmediata a trabajo operativo, pero no concentra la ejecución material principal. Conserva relevancia operativa secundaria y su clase primaria se resolverá en PROC-SCREEN-006 a PROC-SCREEN-011.                  |
| `VSCREEN-0004` | Activación de dispositivo compartido                  | `shell`    | `VPROC-0059::STEP-ACTIVATE_SHARED_DEVICE`                   | `SECONDARY_OPERATIONAL`     | `OPERATIONAL_ENTRY`      | La pantalla habilita la entrada inmediata a trabajo operativo, pero no concentra la ejecución material principal. Conserva relevancia operativa secundaria y su clase primaria se resolverá en PROC-SCREEN-006 a PROC-SCREEN-011.                  |
| `VSCREEN-0005` | Bandeja transversal de tareas y notificaciones        | `shell`    | `VPROC-0004::STEP-TRIAGE_TRANSVERSAL_WORK`                  | `SECONDARY_OPERATIONAL`     | `OPERATIONAL_QUEUE`      | La pantalla prioriza o admite trabajo operativo pendiente, pero no concentra la ejecución material principal. Conserva relevancia operativa secundaria y su clase primaria se resolverá en PROC-SCREEN-006 a PROC-SCREEN-011.                      |
| `VSCREEN-0006` | Centro de soporte y diagnóstico                       | `shell`    | `VPROC-0058::STEP-DIAGNOSE_AND_ROUTE_SUPPORT`               | `SECONDARY_OPERATIONAL`     | `OPERATIONAL_RECOVERY`   | La pantalla restablece o contiene la continuidad de la operación, pero no concentra la ejecución material principal. Conserva relevancia operativa secundaria y su clase primaria se resolverá en PROC-SCREEN-006 a PROC-SCREEN-011.               |
| `VSCREEN-0007` | Inicio ejecutivo y gerencial                          | `viso`     | `VPROC-0001::STEP-REVIEW_EXECUTIVE_WORK`                    | `OUTSIDE_OPERATIONAL_CLASS` | `NONE`                   | Trabajo administrativo, de gobierno o decisión de backoffice; no tiene ejecución operativa interna dominante.                                                                                                                                      |
| `VSCREEN-0008` | Estructura organizativa                               | `viso`     | `VPROC-0002::STEP-MAINTAIN_ORGANIZATIONAL_STRUCTURE`        | `OUTSIDE_OPERATIONAL_CLASS` | `NONE`                   | Gobierno, configuración o publicación de reglas y maestros; no ejecuta trabajo operativo vivo y se revisará en PROC-SCREEN-008.                                                                                                                    |
| `VSCREEN-0009` | Políticas, delegaciones y límites                     | `viso`     | `VPROC-0003::STEP-AUTHOR_POLICIES_AND_LIMITS`               | `OUTSIDE_OPERATIONAL_CLASS` | `NONE`                   | Gobierno, configuración o publicación de reglas y maestros; no ejecuta trabajo operativo vivo y se revisará en PROC-SCREEN-008.                                                                                                                    |
| `VSCREEN-0010` | Compromisos y transferencias internas                 | `viso`     | `VPROC-0004::STEP-TRACK_INTERNAL_COMMITMENTS`               | `SECONDARY_OPERATIONAL`     | `OPERATIONAL_MONITORING` | La pantalla sigue un compromiso operativo todavía abierto, pero no concentra la ejecución material principal. Conserva relevancia operativa secundaria y su clase primaria se resolverá en PROC-SCREEN-006 a PROC-SCREEN-011.                      |
| `VSCREEN-0011` | Embudo de candidatos                                  | `viso`     | `VPROC-0005::STEP-TRIAGE_CANDIDATES`                        | `OUTSIDE_OPERATIONAL_CLASS` | `NONE`                   | Trabajo administrativo, de gobierno o decisión de backoffice; no tiene ejecución operativa interna dominante.                                                                                                                                      |
| `VSCREEN-0012` | Caso de selección                                     | `viso`     | `VPROC-0005::STEP-EVALUATE_AND_DECIDE_CANDIDATE`            | `OUTSIDE_OPERATIONAL_CLASS` | `NONE`                   | Trabajo administrativo, de gobierno o decisión de backoffice; no tiene ejecución operativa interna dominante.                                                                                                                                      |
| `VSCREEN-0013` | Vinculación e incorporación                           | `viso`     | `VPROC-0006::STEP-ORCHESTRATE_ONBOARDING`                   | `OUTSIDE_OPERATIONAL_CLASS` | `NONE`                   | Trabajo administrativo, de gobierno o decisión de backoffice; no tiene ejecución operativa interna dominante.                                                                                                                                      |
| `VSCREEN-0014` | Directorio y expediente laboral                       | `viso`     | `VPROC-0006::STEP-MAINTAIN_EMPLOYMENT_RECORD`               | `OUTSIDE_OPERATIONAL_CLASS` | `NONE`                   | Gobierno, configuración o publicación de reglas y maestros; no ejecuta trabajo operativo vivo y se revisará en PROC-SCREEN-008.                                                                                                                    |
| `VSCREEN-0015` | Programación laboral                                  | `viso`     | `VPROC-0007::STEP-PLAN_AND_PUBLISH_SCHEDULE`                | `SECONDARY_OPERATIONAL`     | `OPERATIONAL_PLANNING`   | La pantalla prepara capacidad o secuencia de ejecución próxima, pero no concentra la ejecución material principal. Conserva relevancia operativa secundaria y su clase primaria se resolverá en PROC-SCREEN-006 a PROC-SCREEN-011.                 |
| `VSCREEN-0016` | Revisión de asistencia                                | `viso`     | `VPROC-0008::STEP-REVIEW_ATTENDANCE_EXCEPTION`              | `SECONDARY_OPERATIONAL`     | `OPERATIONAL_CONTROL`    | La pantalla valida, revisa, reconcilia o decide sobre trabajo activo, pero no concentra la ejecución material principal. Conserva relevancia operativa secundaria y su clase primaria se resolverá en PROC-SCREEN-006 a PROC-SCREEN-011.           |
| `VSCREEN-0017` | Novedades, ausencias y reemplazos                     | `viso`     | `VPROC-0009::STEP-RESOLVE_WORKFORCE_CASE`                   | `SECONDARY_OPERATIONAL`     | `OPERATIONAL_CONTROL`    | La pantalla valida, revisa, reconcilia o decide sobre trabajo activo, pero no concentra la ejecución material principal. Conserva relevancia operativa secundaria y su clase primaria se resolverá en PROC-SCREEN-006 a PROC-SCREEN-011.           |
| `VSCREEN-0018` | Retiro y revocación coordinada                        | `viso`     | `VPROC-0011::STEP-CLOSE_EMPLOYMENT_AND_REVOKE`              | `OUTSIDE_OPERATIONAL_CLASS` | `NONE`                   | Trabajo administrativo, de gobierno o decisión de backoffice; no tiene ejecución operativa interna dominante.                                                                                                                                      |
| `VSCREEN-0019` | Catálogo de roles y permisos                          | `viso`     | `VPROC-0059::STEP-MAINTAIN_ACCESS_CATALOG`                  | `OUTSIDE_OPERATIONAL_CLASS` | `NONE`                   | Gobierno, configuración o publicación de reglas y maestros; no ejecuta trabajo operativo vivo y se revisará en PROC-SCREEN-008.                                                                                                                    |
| `VSCREEN-0020` | Perfil de acceso del trabajador                       | `viso`     | `VPROC-0059::STEP-ASSIGN_EFFECTIVE_ACCESS`                  | `OUTSIDE_OPERATIONAL_CLASS` | `NONE`                   | Gobierno, configuración o publicación de reglas y maestros; no ejecuta trabajo operativo vivo y se revisará en PROC-SCREEN-008.                                                                                                                    |
| `VSCREEN-0021` | Simulación de permisos y conflictos                   | `viso`     | `VPROC-0059::STEP-SIMULATE_ACCESS_DECISION`                 | `OUTSIDE_OPERATIONAL_CLASS` | `NONE`                   | Análisis o simulación sin ejecución material inmediata; su carril primario se resolverá en las clasificaciones posteriores.                                                                                                                        |
| `VSCREEN-0022` | Gobierno de dispositivos compartidos                  | `viso`     | `VPROC-0059::STEP-GOVERN_SHARED_DEVICES`                    | `OUTSIDE_OPERATIONAL_CLASS` | `NONE`                   | Gobierno, configuración o publicación de reglas y maestros; no ejecuta trabajo operativo vivo y se revisará en PROC-SCREEN-008.                                                                                                                    |
| `VSCREEN-0023` | Riesgos de seguridad y salud                          | `viso`     | `VPROC-0012::STEP-ASSESS_SST_RISK`                          | `OUTSIDE_OPERATIONAL_CLASS` | `NONE`                   | Trabajo administrativo, de gobierno o decisión de backoffice; no tiene ejecución operativa interna dominante.                                                                                                                                      |
| `VSCREEN-0024` | Incidentes y emergencias                              | `viso`     | `VPROC-0013::STEP-MANAGE_INCIDENT_RESPONSE`                 | `SECONDARY_OPERATIONAL`     | `OPERATIONAL_RECOVERY`   | La pantalla restablece o contiene la continuidad de la operación, pero no concentra la ejecución material principal. Conserva relevancia operativa secundaria y su clase primaria se resolverá en PROC-SCREEN-006 a PROC-SCREEN-011.               |
| `VSCREEN-0025` | Controles de higiene y cumplimiento                   | `viso`     | `VPROC-0014::STEP-REVIEW_HYGIENE_COMPLIANCE`                | `SECONDARY_OPERATIONAL`     | `OPERATIONAL_CONTROL`    | La pantalla valida, revisa, reconcilia o decide sobre trabajo activo, pero no concentra la ejecución material principal. Conserva relevancia operativa secundaria y su clase primaria se resolverá en PROC-SCREEN-006 a PROC-SCREEN-011.           |
| `VSCREEN-0026` | Bandeja de casos administrativos transversales        | `viso`     | `VPROC-0004::STEP-TRIAGE_ADMIN_CASES`                       | `SECONDARY_OPERATIONAL`     | `OPERATIONAL_QUEUE`      | La pantalla prioriza o admite trabajo operativo pendiente, pero no concentra la ejecución material principal. Conserva relevancia operativa secundaria y su clase primaria se resolverá en PROC-SCREEN-006 a PROC-SCREEN-011.                      |
| `VSCREEN-0027` | Inicio personal del trabajador                        | `anima`    | `VPROC-0007::STEP-ENTER_PERSONAL_WORKSPACE`                 | `OUTSIDE_OPERATIONAL_CLASS` | `NONE`                   | Canal personal del trabajador sin ejecución operativa interna dominante. Su clasificación primaria queda reservada a PROC-SCREEN-010.                                                                                                              |
| `VSCREEN-0028` | Registro de entrada, pausa y salida                   | `anima`    | `VPROC-0008::STEP-CAPTURE_ATTENDANCE_EVENT`                 | `PRIMARY_OPERATIONAL`       | `OPERATIONAL_CAPTURE`    | La intención dominante registra hechos, cantidades, tiempos o condiciones de la operación sobre un caso activo; un retraso o error afecta de forma inmediata la continuidad, custodia, producción, servicio, venta o entrega.                      |
| `VSCREEN-0029` | Mi programación                                       | `anima`    | `VPROC-0007::STEP-CONSULT_PUBLISHED_SCHEDULE`               | `SECONDARY_OPERATIONAL`     | `OPERATIONAL_LOOKUP`     | La pantalla aporta consulta o identificación necesaria para ejecutar, pero no concentra la ejecución material principal. Conserva relevancia operativa secundaria y su clase primaria se resolverá en PROC-SCREEN-006 a PROC-SCREEN-011.           |
| `VSCREEN-0030` | Mi asistencia y solicitud de corrección               | `anima`    | `VPROC-0008::STEP-CONSULT_OR_REQUEST_ATTENDANCE_CORRECTION` | `SECONDARY_OPERATIONAL`     | `OPERATIONAL_CONTROL`    | La pantalla valida, revisa, reconcilia o decide sobre trabajo activo, pero no concentra la ejecución material principal. Conserva relevancia operativa secundaria y su clase primaria se resolverá en PROC-SCREEN-006 a PROC-SCREEN-011.           |
| `VSCREEN-0031` | Mis novedades, permisos y ausencias                   | `anima`    | `VPROC-0009::STEP-SUBMIT_PERSONAL_WORKFORCE_CASE`           | `SECONDARY_OPERATIONAL`     | `OPERATIONAL_CAPTURE`    | La pantalla registra hechos, cantidades, tiempos o condiciones de la operación, pero no concentra la ejecución material principal. Conserva relevancia operativa secundaria y su clase primaria se resolverá en PROC-SCREEN-006 a PROC-SCREEN-011. |
| `VSCREEN-0032` | Mi perfil laboral                                     | `anima`    | `VPROC-0006::STEP-MAINTAIN_SELF_SERVICE_PROFILE`            | `OUTSIDE_OPERATIONAL_CLASS` | `NONE`                   | Canal personal del trabajador sin ejecución operativa interna dominante. Su clasificación primaria queda reservada a PROC-SCREEN-010.                                                                                                              |
| `VSCREEN-0033` | Resumen de inventario y abastecimiento interno        | `nexo`     | `VPROC-0028::STEP-MONITOR_INTERNAL_SUPPLY`                  | `SECONDARY_OPERATIONAL`     | `OPERATIONAL_MONITORING` | La pantalla sigue un compromiso operativo todavía abierto, pero no concentra la ejecución material principal. Conserva relevancia operativa secundaria y su clase primaria se resolverá en PROC-SCREEN-006 a PROC-SCREEN-011.                      |
| `VSCREEN-0034` | Catálogo de productos físicos                         | `nexo`     | `VPROC-0015::STEP-CONSULT_PHYSICAL_PRODUCT_CATALOG`         | `SECONDARY_OPERATIONAL`     | `OPERATIONAL_LOOKUP`     | La pantalla aporta consulta o identificación necesaria para ejecutar, pero no concentra la ejecución material principal. Conserva relevancia operativa secundaria y su clase primaria se resolverá en PROC-SCREEN-006 a PROC-SCREEN-011.           |
| `VSCREEN-0035` | Editor de producto, unidad y presentación             | `nexo`     | `VPROC-0015::STEP-MAINTAIN_PRODUCT_PRESENTATION`            | `OUTSIDE_OPERATIONAL_CLASS` | `NONE`                   | Gobierno, configuración o publicación de reglas y maestros; no ejecuta trabajo operativo vivo y se revisará en PROC-SCREEN-008.                                                                                                                    |
| `VSCREEN-0036` | Especificaciones y criterios de calidad               | `nexo`     | `VPROC-0018::STEP-MAINTAIN_QUALITY_SPECIFICATION`           | `OUTSIDE_OPERATIONAL_CLASS` | `NONE`                   | Gobierno, configuración o publicación de reglas y maestros; no ejecuta trabajo operativo vivo y se revisará en PROC-SCREEN-008.                                                                                                                    |
| `VSCREEN-0037` | Catálogo de ubicaciones                               | `nexo`     | `VPROC-0023::STEP-MAINTAIN_LOCATION_CATALOG`                | `OUTSIDE_OPERATIONAL_CLASS` | `NONE`                   | Gobierno, configuración o publicación de reglas y maestros; no ejecuta trabajo operativo vivo y se revisará en PROC-SCREEN-008.                                                                                                                    |
| `VSCREEN-0038` | Identificación y detalle de ubicación                 | `nexo`     | `VPROC-0023::STEP-IDENTIFY_LOCATION_AND_CONTENT`            | `PRIMARY_OPERATIONAL`       | `OPERATIONAL_LOOKUP`     | La identificación y consulta inmediata de la ubicación es el trabajo operativo dominante del paso activo.                                                                                                                                          |
| `VSCREEN-0039` | Consulta de existencias                               | `nexo`     | `VPROC-0024::STEP-CONSULT_STOCK_POSITION`                   | `SECONDARY_OPERATIONAL`     | `OPERATIONAL_LOOKUP`     | La pantalla aporta consulta o identificación necesaria para ejecutar, pero no concentra la ejecución material principal. Conserva relevancia operativa secundaria y su clase primaria se resolverá en PROC-SCREEN-006 a PROC-SCREEN-011.           |
| `VSCREEN-0040` | Conteo de inventario                                  | `nexo`     | `VPROC-0026::STEP-CAPTURE_PHYSICAL_COUNT`                   | `PRIMARY_OPERATIONAL`       | `OPERATIONAL_CAPTURE`    | La intención dominante registra hechos, cantidades, tiempos o condiciones de la operación sobre un caso activo; un retraso o error afecta de forma inmediata la continuidad, custodia, producción, servicio, venta o entrega.                      |
| `VSCREEN-0041` | Revisión de conteo y diferencias                      | `nexo`     | `VPROC-0026::STEP-REVIEW_COUNT_VARIANCE`                    | `PRIMARY_OPERATIONAL`       | `OPERATIONAL_CONTROL`    | La intención dominante valida, revisa, reconcilia o decide sobre trabajo activo sobre un caso activo; un retraso o error afecta de forma inmediata la continuidad, custodia, producción, servicio, venta o entrega.                                |
| `VSCREEN-0042` | Caso de ajuste de inventario                          | `nexo`     | `VPROC-0026::STEP-DECIDE_INVENTORY_ADJUSTMENT`              | `PRIMARY_OPERATIONAL`       | `OPERATIONAL_CONTROL`    | La intención dominante valida, revisa, reconcilia o decide sobre trabajo activo sobre un caso activo; un retraso o error afecta de forma inmediata la continuidad, custodia, producción, servicio, venta o entrega.                                |
| `VSCREEN-0043` | Confirmación de entrada a inventario                  | `nexo`     | `VPROC-0024::STEP-CONFIRM_STOCK_ENTRY`                      | `PRIMARY_OPERATIONAL`       | `OPERATIONAL_EXECUTION`  | La intención dominante ejecuta o confirma una mutación material de la operación sobre un caso activo; un retraso o error afecta de forma inmediata la continuidad, custodia, producción, servicio, venta o entrega.                                |
| `VSCREEN-0044` | Retiro y consumo de existencias                       | `nexo`     | `VPROC-0025::STEP-EXECUTE_STOCK_WITHDRAWAL`                 | `PRIMARY_OPERATIONAL`       | `OPERATIONAL_EXECUTION`  | La intención dominante ejecuta o confirma una mutación material de la operación sobre un caso activo; un retraso o error afecta de forma inmediata la continuidad, custodia, producción, servicio, venta o entrega.                                |
| `VSCREEN-0045` | Traslado interno de existencias                       | `nexo`     | `VPROC-0025::STEP-EXECUTE_INTERNAL_TRANSFER`                | `PRIMARY_OPERATIONAL`       | `OPERATIONAL_EXECUTION`  | La intención dominante ejecuta o confirma una mutación material de la operación sobre un caso activo; un retraso o error afecta de forma inmediata la continuidad, custodia, producción, servicio, venta o entrega.                                |
| `VSCREEN-0046` | Solicitud de remisión                                 | `nexo`     | `VPROC-0028::STEP-SUBMIT_REPLENISHMENT_REQUEST`             | `PRIMARY_OPERATIONAL`       | `OPERATIONAL_EXECUTION`  | La intención dominante ejecuta o confirma una mutación material de la operación sobre un caso activo; un retraso o error afecta de forma inmediata la continuidad, custodia, producción, servicio, venta o entrega.                                |
| `VSCREEN-0047` | Preparación de remisión                               | `nexo`     | `VPROC-0028::STEP-PREPARE_REPLENISHMENT`                    | `PRIMARY_OPERATIONAL`       | `OPERATIONAL_EXECUTION`  | La intención dominante ejecuta o confirma una mutación material de la operación sobre un caso activo; un retraso o error afecta de forma inmediata la continuidad, custodia, producción, servicio, venta o entrega.                                |
| `VSCREEN-0048` | Carga y despacho de remisión                          | `nexo`     | `VPROC-0028::STEP-LOAD_AND_DISPATCH_REPLENISHMENT`          | `PRIMARY_OPERATIONAL`       | `OPERATIONAL_EXECUTION`  | La intención dominante ejecuta o confirma una mutación material de la operación sobre un caso activo; un retraso o error afecta de forma inmediata la continuidad, custodia, producción, servicio, venta o entrega.                                |
| `VSCREEN-0049` | Seguimiento de remisión en tránsito                   | `nexo`     | `VPROC-0028::STEP-MONITOR_REPLENISHMENT_TRANSIT`            | `PRIMARY_OPERATIONAL`       | `OPERATIONAL_MONITORING` | La intención dominante sigue un compromiso operativo todavía abierto sobre un caso activo; un retraso o error afecta de forma inmediata la continuidad, custodia, producción, servicio, venta o entrega.                                           |
| `VSCREEN-0050` | Recepción de remisión                                 | `nexo`     | `VPROC-0028::STEP-RECEIVE_REPLENISHMENT`                    | `PRIMARY_OPERATIONAL`       | `OPERATIONAL_CONTROL`    | La intención dominante valida, revisa, reconcilia o decide sobre trabajo activo sobre un caso activo; un retraso o error afecta de forma inmediata la continuidad, custodia, producción, servicio, venta o entrega.                                |
| `VSCREEN-0051` | Vencimiento, cuarentena, daño y merma                 | `nexo`     | `VPROC-0027::STEP-RESOLVE_STOCK_CONDITION`                  | `PRIMARY_OPERATIONAL`       | `OPERATIONAL_EXCEPTION`  | La intención dominante resuelve una excepción, reversión, rechazo o retorno operativo sobre un caso activo; un retraso o error afecta de forma inmediata la continuidad, custodia, producción, servicio, venta o entrega.                          |
| `VSCREEN-0052` | LPN, contenedores y reutilizables                     | `nexo`     | `VPROC-0032::STEP-MANAGE_LPN_AND_REUSABLES`                 | `PRIMARY_OPERATIONAL`       | `OPERATIONAL_EXECUTION`  | La intención dominante ejecuta o confirma una mutación material de la operación sobre un caso activo; un retraso o error afecta de forma inmediata la continuidad, custodia, producción, servicio, venta o entrega.                                |
| `VSCREEN-0053` | Activos y custodia                                    | `nexo`     | `VPROC-0029::STEP-MANAGE_ASSET_CUSTODY`                     | `PRIMARY_OPERATIONAL`       | `OPERATIONAL_EXECUTION`  | La intención dominante ejecuta o confirma una mutación material de la operación sobre un caso activo; un retraso o error afecta de forma inmediata la continuidad, custodia, producción, servicio, venta o entrega.                                |
| `VSCREEN-0054` | Etiquetas e impresión logística                       | `nexo`     | `VPROC-0024::STEP-ISSUE_LOGISTICS_LABEL`                    | `PRIMARY_OPERATIONAL`       | `OPERATIONAL_EXECUTION`  | La intención dominante ejecuta o confirma una mutación material de la operación sobre un caso activo; un retraso o error afecta de forma inmediata la continuidad, custodia, producción, servicio, venta o entrega.                                |
| `VSCREEN-0055` | Inicio y cola de producción                           | `fogo`     | `VPROC-0033::STEP-TRIAGE_PRODUCTION_QUEUE`                  | `SECONDARY_OPERATIONAL`     | `OPERATIONAL_QUEUE`      | La pantalla prioriza o admite trabajo operativo pendiente, pero no concentra la ejecución material principal. Conserva relevancia operativa secundaria y su clase primaria se resolverá en PROC-SCREEN-006 a PROC-SCREEN-011.                      |
| `VSCREEN-0056` | Planeación de producción                              | `fogo`     | `VPROC-0033::STEP-PLAN_PRODUCTION`                          | `SECONDARY_OPERATIONAL`     | `OPERATIONAL_PLANNING`   | La pantalla prepara capacidad o secuencia de ejecución próxima, pero no concentra la ejecución material principal. Conserva relevancia operativa secundaria y su clase primaria se resolverá en PROC-SCREEN-006 a PROC-SCREEN-011.                 |
| `VSCREEN-0057` | Preparación e inicio de lote                          | `fogo`     | `VPROC-0034::STEP-PREPARE_AND_START_BATCH`                  | `PRIMARY_OPERATIONAL`       | `OPERATIONAL_EXECUTION`  | La intención dominante ejecuta o confirma una mutación material de la operación sobre un caso activo; un retraso o error afecta de forma inmediata la continuidad, custodia, producción, servicio, venta o entrega.                                |
| `VSCREEN-0058` | Ejecución de lote                                     | `fogo`     | `VPROC-0034::STEP-EXECUTE_BATCH`                            | `PRIMARY_OPERATIONAL`       | `OPERATIONAL_EXECUTION`  | La intención dominante ejecuta o confirma una mutación material de la operación sobre un caso activo; un retraso o error afecta de forma inmediata la continuidad, custodia, producción, servicio, venta o entrega.                                |
| `VSCREEN-0059` | Registro parcial de producción                        | `fogo`     | `VPROC-0034::STEP-CAPTURE_BATCH_PROGRESS`                   | `PRIMARY_OPERATIONAL`       | `OPERATIONAL_CAPTURE`    | La intención dominante registra hechos, cantidades, tiempos o condiciones de la operación sobre un caso activo; un retraso o error afecta de forma inmediata la continuidad, custodia, producción, servicio, venta o entrega.                      |
| `VSCREEN-0060` | Finalización y cierre de lote                         | `fogo`     | `VPROC-0037::STEP-CLOSE_BATCH`                              | `PRIMARY_OPERATIONAL`       | `OPERATIONAL_CLOSURE`    | La intención dominante cierra una sesión, lote o ciclo operativo sobre un caso activo; un retraso o error afecta de forma inmediata la continuidad, custodia, producción, servicio, venta o entrega.                                               |
| `VSCREEN-0061` | Receta operativa                                      | `fogo`     | `VPROC-0016::STEP-CONSULT_APPLICABLE_RECIPE`                | `PRIMARY_OPERATIONAL`       | `OPERATIONAL_LOOKUP`     | Consultar la receta aplicable es indispensable para ejecutar correctamente el lote activo y constituye la guía operativa dominante.                                                                                                                |
| `VSCREEN-0062` | Catálogo y editor de recetas                          | `fogo`     | `VPROC-0016::STEP-AUTHOR_RECIPE`                            | `OUTSIDE_OPERATIONAL_CLASS` | `NONE`                   | Gobierno, configuración o publicación de reglas y maestros; no ejecuta trabajo operativo vivo y se revisará en PROC-SCREEN-008.                                                                                                                    |
| `VSCREEN-0063` | Revisión, aprobación y publicación de receta          | `fogo`     | `VPROC-0016::STEP-APPROVE_AND_PUBLISH_RECIPE`               | `OUTSIDE_OPERATIONAL_CLASS` | `NONE`                   | Gobierno o auditoría del dominio productivo; no corresponde a ejecución operativa dominante en esta pantalla.                                                                                                                                      |
| `VSCREEN-0064` | Prueba de receta y rendimiento                        | `fogo`     | `VPROC-0016::STEP-TEST_RECIPE_AND_YIELD`                    | `PRIMARY_OPERATIONAL`       | `OPERATIONAL_CONTROL`    | La intención dominante valida, revisa, reconcilia o decide sobre trabajo activo sobre un caso activo; un retraso o error afecta de forma inmediata la continuidad, custodia, producción, servicio, venta o entrega.                                |
| `VSCREEN-0065` | Control de calidad y liberación                       | `fogo`     | `VPROC-0035::STEP-DECIDE_QUALITY_RELEASE`                   | `PRIMARY_OPERATIONAL`       | `OPERATIONAL_CONTROL`    | La intención dominante valida, revisa, reconcilia o decide sobre trabajo activo sobre un caso activo; un retraso o error afecta de forma inmediata la continuidad, custodia, producción, servicio, venta o entrega.                                |
| `VSCREEN-0066` | Empaque, etiquetado y almacenamiento de terminado     | `fogo`     | `VPROC-0036::STEP-PACK_AND_TRANSFER_FINISHED_GOOD`          | `PRIMARY_OPERATIONAL`       | `OPERATIONAL_EXECUTION`  | La intención dominante ejecuta o confirma una mutación material de la operación sobre un caso activo; un retraso o error afecta de forma inmediata la continuidad, custodia, producción, servicio, venta o entrega.                                |
| `VSCREEN-0067` | Reproceso, aprovechamiento, merma y cierre productivo | `fogo`     | `VPROC-0037::STEP-RESOLVE_PRODUCTION_DISPOSITION`           | `PRIMARY_OPERATIONAL`       | `OPERATIONAL_EXCEPTION`  | La intención dominante resuelve una excepción, reversión, rechazo o retorno operativo sobre un caso activo; un retraso o error afecta de forma inmediata la continuidad, custodia, producción, servicio, venta o entrega.                          |
| `VSCREEN-0068` | Bandeja de necesidades de compra                      | `origo`    | `VPROC-0019::STEP-TRIAGE_PURCHASE_NEEDS`                    | `SECONDARY_OPERATIONAL`     | `OPERATIONAL_QUEUE`      | La pantalla prioriza o admite trabajo operativo pendiente, pero no concentra la ejecución material principal. Conserva relevancia operativa secundaria y su clase primaria se resolverá en PROC-SCREEN-006 a PROC-SCREEN-011.                      |
| `VSCREEN-0069` | Solicitud de compra                                   | `origo`    | `VPROC-0019::STEP-SUBMIT_PURCHASE_REQUEST`                  | `OUTSIDE_OPERATIONAL_CLASS` | `NONE`                   | Trabajo administrativo, de gobierno o decisión de backoffice; no tiene ejecución operativa interna dominante.                                                                                                                                      |
| `VSCREEN-0070` | Catálogo de proveedores                               | `origo`    | `VPROC-0020::STEP-CONSULT_SUPPLIER_CATALOG`                 | `OUTSIDE_OPERATIONAL_CLASS` | `NONE`                   | Trabajo administrativo, de gobierno o decisión de backoffice; no tiene ejecución operativa interna dominante.                                                                                                                                      |
| `VSCREEN-0071` | Alta y expediente de proveedor                        | `origo`    | `VPROC-0020::STEP-ONBOARD_SUPPLIER`                         | `OUTSIDE_OPERATIONAL_CLASS` | `NONE`                   | Gobierno, configuración o publicación de reglas y maestros; no ejecuta trabajo operativo vivo y se revisará en PROC-SCREEN-008.                                                                                                                    |
| `VSCREEN-0072` | Comparación de cotizaciones                           | `origo`    | `VPROC-0020::STEP-COMPARE_QUOTES`                           | `OUTSIDE_OPERATIONAL_CLASS` | `NONE`                   | Trabajo administrativo, de gobierno o decisión de backoffice; no tiene ejecución operativa interna dominante.                                                                                                                                      |
| `VSCREEN-0073` | Editor de orden de compra                             | `origo`    | `VPROC-0021::STEP-PREPARE_PURCHASE_ORDER`                   | `OUTSIDE_OPERATIONAL_CLASS` | `NONE`                   | Gobierno, configuración o publicación de reglas y maestros; no ejecuta trabajo operativo vivo y se revisará en PROC-SCREEN-008.                                                                                                                    |
| `VSCREEN-0074` | Bandeja de aprobaciones de compra                     | `origo`    | `VPROC-0021::STEP-APPROVE_PURCHASE`                         | `OUTSIDE_OPERATIONAL_CLASS` | `NONE`                   | Trabajo administrativo, de gobierno o decisión de backoffice; no tiene ejecución operativa interna dominante.                                                                                                                                      |
| `VSCREEN-0075` | Detalle y seguimiento de orden                        | `origo`    | `VPROC-0021::STEP-MONITOR_PURCHASE_ORDER`                   | `SECONDARY_OPERATIONAL`     | `OPERATIONAL_MONITORING` | La pantalla sigue un compromiso operativo todavía abierto, pero no concentra la ejecución material principal. Conserva relevancia operativa secundaria y su clase primaria se resolverá en PROC-SCREEN-006 a PROC-SCREEN-011.                      |
| `VSCREEN-0076` | Cola de recepciones                                   | `origo`    | `VPROC-0022::STEP-TRIAGE_RECEIPT_QUEUE`                     | `SECONDARY_OPERATIONAL`     | `OPERATIONAL_QUEUE`      | La pantalla prioriza o admite trabajo operativo pendiente, pero no concentra la ejecución material principal. Conserva relevancia operativa secundaria y su clase primaria se resolverá en PROC-SCREEN-006 a PROC-SCREEN-011.                      |
| `VSCREEN-0077` | Recepción total o parcial                             | `origo`    | `VPROC-0022::STEP-RECEIVE_PURCHASE`                         | `PRIMARY_OPERATIONAL`       | `OPERATIONAL_EXECUTION`  | La intención dominante ejecuta o confirma una mutación material de la operación sobre un caso activo; un retraso o error afecta de forma inmediata la continuidad, custodia, producción, servicio, venta o entrega.                                |
| `VSCREEN-0078` | Resolución de diferencias de recepción                | `origo`    | `VPROC-0022::STEP-RESOLVE_RECEIPT_VARIANCE`                 | `PRIMARY_OPERATIONAL`       | `OPERATIONAL_EXCEPTION`  | La intención dominante resuelve una excepción, reversión, rechazo o retorno operativo sobre un caso activo; un retraso o error afecta de forma inmediata la continuidad, custodia, producción, servicio, venta o entrega.                          |
| `VSCREEN-0079` | Historial y auditoría de abastecimiento               | `origo`    | `VPROC-0022::STEP-AUDIT_PROCUREMENT_CYCLE`                  | `OUTSIDE_OPERATIONAL_CLASS` | `NONE`                   | Superficie histórica o de auditoría; no opera el caso vivo y se revisará en PROC-SCREEN-009.                                                                                                                                                       |
| `VSCREEN-0080` | Inicio POS                                            | `pulso`    | `VPROC-0039::STEP-ENTER_POS_WORKSPACE`                      | `PRIMARY_OPERATIONAL`       | `OPERATIONAL_ENTRY`      | Es la entrada inmediata al trabajo vivo de venta, salón, mostrador o caja; no es un tablero supervisor por defecto.                                                                                                                                |
| `VSCREEN-0081` | Creación de venta o pedido                            | `pulso`    | `VPROC-0039::STEP-CREATE_SALE_OR_ORDER`                     | `PRIMARY_OPERATIONAL`       | `OPERATIONAL_EXECUTION`  | La intención dominante ejecuta o confirma una mutación material de la operación sobre un caso activo; un retraso o error afecta de forma inmediata la continuidad, custodia, producción, servicio, venta o entrega.                                |
| `VSCREEN-0082` | Mapa de salón y mesas                                 | `pulso`    | `VPROC-0038::STEP-MANAGE_TABLE_SERVICE`                     | `PRIMARY_OPERATIONAL`       | `OPERATIONAL_EXECUTION`  | La intención dominante ejecuta o confirma una mutación material de la operación sobre un caso activo; un retraso o error afecta de forma inmediata la continuidad, custodia, producción, servicio, venta o entrega.                                |
| `VSCREEN-0083` | Detalle y modificación de pedido                      | `pulso`    | `VPROC-0038::STEP-MODIFY_ACTIVE_ORDER`                      | `PRIMARY_OPERATIONAL`       | `OPERATIONAL_EXCEPTION`  | La intención dominante resuelve una excepción, reversión, rechazo o retorno operativo sobre un caso activo; un retraso o error afecta de forma inmediata la continuidad, custodia, producción, servicio, venta o entrega.                          |
| `VSCREEN-0084` | Cobro y medios de pago                                | `pulso`    | `VPROC-0043::STEP-COLLECT_PAYMENT`                          | `PRIMARY_OPERATIONAL`       | `OPERATIONAL_EXECUTION`  | La intención dominante ejecuta o confirma una mutación material de la operación sobre un caso activo; un retraso o error afecta de forma inmediata la continuidad, custodia, producción, servicio, venta o entrega.                                |
| `VSCREEN-0085` | Identificación de cliente y acumulación               | `pulso`    | `VPROC-0045::STEP-IDENTIFY_CUSTOMER_AND_ACCRUE`             | `PRIMARY_OPERATIONAL`       | `OPERATIONAL_EXECUTION`  | La intención dominante ejecuta o confirma una mutación material de la operación sobre un caso activo; un retraso o error afecta de forma inmediata la continuidad, custodia, producción, servicio, venta o entrega.                                |
| `VSCREEN-0086` | Redención de puntos o beneficios                      | `pulso`    | `VPROC-0045::STEP-REDEEM_LOYALTY_VALUE`                     | `PRIMARY_OPERATIONAL`       | `OPERATIONAL_EXECUTION`  | La intención dominante ejecuta o confirma una mutación material de la operación sobre un caso activo; un retraso o error afecta de forma inmediata la continuidad, custodia, producción, servicio, venta o entrega.                                |
| `VSCREEN-0087` | Bandeja de pedidos de canales externos                | `pulso`    | `VPROC-0040::STEP-ADMIT_EXTERNAL_ORDER`                     | `PRIMARY_OPERATIONAL`       | `OPERATIONAL_CONTROL`    | La intención dominante valida, revisa, reconcilia o decide sobre trabajo activo sobre un caso activo; un retraso o error afecta de forma inmediata la continuidad, custodia, producción, servicio, venta o entrega.                                |
| `VSCREEN-0088` | Seguimiento de preparación y entrega                  | `pulso`    | `VPROC-0039::STEP-MONITOR_ORDER_FULFILLMENT`                | `PRIMARY_OPERATIONAL`       | `OPERATIONAL_MONITORING` | La intención dominante sigue un compromiso operativo todavía abierto sobre un caso activo; un retraso o error afecta de forma inmediata la continuidad, custodia, producción, servicio, venta o entrega.                                           |
| `VSCREEN-0089` | Apertura de caja                                      | `pulso`    | `VPROC-0044::STEP-OPEN_CASH_SESSION`                        | `PRIMARY_OPERATIONAL`       | `OPERATIONAL_EXECUTION`  | La intención dominante ejecuta o confirma una mutación material de la operación sobre un caso activo; un retraso o error afecta de forma inmediata la continuidad, custodia, producción, servicio, venta o entrega.                                |
| `VSCREEN-0090` | Cierre de caja                                        | `pulso`    | `VPROC-0044::STEP-CLOSE_CASH_SESSION`                       | `PRIMARY_OPERATIONAL`       | `OPERATIONAL_CLOSURE`    | La intención dominante cierra una sesión, lote o ciclo operativo sobre un caso activo; un retraso o error afecta de forma inmediata la continuidad, custodia, producción, servicio, venta o entrega.                                               |
| `VSCREEN-0091` | Anulación, devolución y reembolso                     | `pulso`    | `VPROC-0042::STEP-RESOLVE_REVERSAL_OR_REFUND`               | `PRIMARY_OPERATIONAL`       | `OPERATIONAL_EXCEPTION`  | La intención dominante resuelve una excepción, reversión, rechazo o retorno operativo sobre un caso activo; un retraso o error afecta de forma inmediata la continuidad, custodia, producción, servicio, venta o entrega.                          |
| `VSCREEN-0092` | Oferta, menú, precio comercial y disponibilidad       | `pulso`    | `VPROC-0017::STEP-PUBLISH_COMMERCIAL_OFFER`                 | `OUTSIDE_OPERATIONAL_CLASS` | `NONE`                   | Gobierno, configuración o publicación de reglas y maestros; no ejecuta trabajo operativo vivo y se revisará en PROC-SCREEN-008.                                                                                                                    |
| `VSCREEN-0093` | Revisión de ventas, caja y terminales                 | `pulso`    | `VPROC-0044::STEP-REVIEW_SALES_AND_TERMINALS`               | `SECONDARY_OPERATIONAL`     | `OPERATIONAL_CONTROL`    | La pantalla valida, revisa, reconcilia o decide sobre trabajo activo, pero no concentra la ejecución material principal. Conserva relevancia operativa secundaria y su clase primaria se resolverá en PROC-SCREEN-006 a PROC-SCREEN-011.           |
| `VSCREEN-0094` | Inicio financiero y ejecutivo                         | `numera`   | `VPROC-0061::STEP-REVIEW_FINANCIAL_POSITION`                | `OUTSIDE_OPERATIONAL_CLASS` | `NONE`                   | Backoffice financiero y contable; su intención dominante es administrativa, de conciliación o análisis y se revisará en PROC-SCREEN-006.                                                                                                           |
| `VSCREEN-0095` | Bandeja de hechos económicos                          | `numera`   | `VPROC-0051::STEP-TRIAGE_ECONOMIC_FACTS`                    | `OUTSIDE_OPERATIONAL_CLASS` | `NONE`                   | Backoffice financiero y contable; su intención dominante es administrativa, de conciliación o análisis y se revisará en PROC-SCREEN-006.                                                                                                           |
| `VSCREEN-0096` | Registro de gasto y soporte                           | `numera`   | `VPROC-0051::STEP-CAPTURE_EXPENSE_AND_EVIDENCE`             | `OUTSIDE_OPERATIONAL_CLASS` | `NONE`                   | Backoffice financiero y contable; su intención dominante es administrativa, de conciliación o análisis y se revisará en PROC-SCREEN-006.                                                                                                           |
| `VSCREEN-0097` | Bandeja de aprobaciones financieras                   | `numera`   | `VPROC-0052::STEP-APPROVE_FINANCIAL_DECISION`               | `OUTSIDE_OPERATIONAL_CLASS` | `NONE`                   | Backoffice financiero y contable; su intención dominante es administrativa, de conciliación o análisis y se revisará en PROC-SCREEN-006.                                                                                                           |
| `VSCREEN-0098` | Cuentas por pagar y obligaciones                      | `numera`   | `VPROC-0052::STEP-MANAGE_PAYABLE_OBLIGATION`                | `OUTSIDE_OPERATIONAL_CLASS` | `NONE`                   | Backoffice financiero y contable; su intención dominante es administrativa, de conciliación o análisis y se revisará en PROC-SCREEN-006.                                                                                                           |
| `VSCREEN-0099` | Cuentas por cobrar y cartera                          | `numera`   | `VPROC-0053::STEP-MANAGE_RECEIVABLE`                        | `OUTSIDE_OPERATIONAL_CLASS` | `NONE`                   | Backoffice financiero y contable; su intención dominante es administrativa, de conciliación o análisis y se revisará en PROC-SCREEN-006.                                                                                                           |
| `VSCREEN-0100` | Caja, bancos y movimientos financieros                | `numera`   | `VPROC-0052::STEP-EXECUTE_TREASURY_MOVEMENT`                | `OUTSIDE_OPERATIONAL_CLASS` | `NONE`                   | Backoffice financiero y contable; su intención dominante es administrativa, de conciliación o análisis y se revisará en PROC-SCREEN-006.                                                                                                           |
| `VSCREEN-0101` | Conciliación de ventas y pagos                        | `numera`   | `VPROC-0051::STEP-RECONCILE_SALES_AND_PAYMENTS`             | `OUTSIDE_OPERATIONAL_CLASS` | `NONE`                   | Backoffice financiero y contable; su intención dominante es administrativa, de conciliación o análisis y se revisará en PROC-SCREEN-006.                                                                                                           |
| `VSCREEN-0102` | Conciliación de compras y recepciones                 | `numera`   | `VPROC-0051::STEP-RECONCILE_PURCHASES_AND_RECEIPTS`         | `OUTSIDE_OPERATIONAL_CLASS` | `NONE`                   | Backoffice financiero y contable; su intención dominante es administrativa, de conciliación o análisis y se revisará en PROC-SCREEN-006.                                                                                                           |
| `VSCREEN-0103` | Conciliación de inventario, producción y variaciones  | `numera`   | `VPROC-0054::STEP-RECONCILE_OPERATING_VARIANCES`            | `OUTSIDE_OPERATIONAL_CLASS` | `NONE`                   | Backoffice financiero y contable; su intención dominante es administrativa, de conciliación o análisis y se revisará en PROC-SCREEN-006.                                                                                                           |
| `VSCREEN-0104` | Costos, rentabilidad y escenarios                     | `numera`   | `VPROC-0054::STEP-ANALYZE_COST_AND_PROFITABILITY`           | `OUTSIDE_OPERATIONAL_CLASS` | `NONE`                   | Backoffice financiero y contable; su intención dominante es administrativa, de conciliación o análisis y se revisará en PROC-SCREEN-006.                                                                                                           |
| `VSCREEN-0105` | Cierre, reapertura y corrección de periodo            | `numera`   | `VPROC-0054::STEP-CLOSE_OR_REOPEN_PERIOD`                   | `OUTSIDE_OPERATIONAL_CLASS` | `NONE`                   | Backoffice financiero y contable; su intención dominante es administrativa, de conciliación o análisis y se revisará en PROC-SCREEN-006.                                                                                                           |
| `VSCREEN-0106` | Reportes y exportaciones financieras                  | `numera`   | `VPROC-0061::STEP-PUBLISH_FINANCIAL_REPORT`                 | `OUTSIDE_OPERATIONAL_CLASS` | `NONE`                   | Backoffice financiero y contable; su intención dominante es administrativa, de conciliación o análisis y se revisará en PROC-SCREEN-006.                                                                                                           |
| `VSCREEN-0107` | Inicio del cliente y resumen de beneficios            | `pass`     | `VPROC-0045::STEP-ENTER_LOYALTY_HOME`                       | `OUTSIDE_OPERATIONAL_CLASS` | `NONE`                   | Canal de cliente; no es superficie de ejecución operativa interna. Su clasificación primaria queda reservada a PROC-SCREEN-011.                                                                                                                    |
| `VSCREEN-0108` | QR personal de identificación                         | `pass`     | `VPROC-0045::STEP-PRESENT_CUSTOMER_ID`                      | `OUTSIDE_OPERATIONAL_CLASS` | `NONE`                   | Canal de cliente; no es superficie de ejecución operativa interna. Su clasificación primaria queda reservada a PROC-SCREEN-011.                                                                                                                    |
| `VSCREEN-0109` | Catálogo de beneficios y recompensas                  | `pass`     | `VPROC-0045::STEP-CONSULT_REWARDS_CATALOG`                  | `OUTSIDE_OPERATIONAL_CLASS` | `NONE`                   | Canal de cliente; no es superficie de ejecución operativa interna. Su clasificación primaria queda reservada a PROC-SCREEN-011.                                                                                                                    |
| `VSCREEN-0110` | Ticket o QR de redención                              | `pass`     | `VPROC-0045::STEP-CREATE_REDEMPTION_INTENT`                 | `OUTSIDE_OPERATIONAL_CLASS` | `NONE`                   | Canal de cliente; no es superficie de ejecución operativa interna. Su clasificación primaria queda reservada a PROC-SCREEN-011.                                                                                                                    |
| `VSCREEN-0111` | Historial de puntos y redenciones                     | `pass`     | `VPROC-0045::STEP-AUDIT_PERSONAL_LOYALTY_LEDGER`            | `OUTSIDE_OPERATIONAL_CLASS` | `NONE`                   | Canal de cliente; no es superficie de ejecución operativa interna. Su clasificación primaria queda reservada a PROC-SCREEN-011.                                                                                                                    |
| `VSCREEN-0112` | Perfil, privacidad y consentimientos                  | `pass`     | `VPROC-0045::STEP-MAINTAIN_CUSTOMER_PROFILE_AND_CONSENT`    | `OUTSIDE_OPERATIONAL_CLASS` | `NONE`                   | Canal de cliente; no es superficie de ejecución operativa interna. Su clasificación primaria queda reservada a PROC-SCREEN-011.                                                                                                                    |
| `VSCREEN-0113` | Registro y seguimiento de decisiones empresariales    | `viso`     | `VPROC-0001::STEP-RECORD_AND_TRACK_DECISION`                | `OUTSIDE_OPERATIONAL_CLASS` | `NONE`                   | Trabajo administrativo, de gobierno o decisión de backoffice; no tiene ejecución operativa interna dominante.                                                                                                                                      |
| `VSCREEN-0114` | Solicitudes y certificaciones de acceso               | `viso`     | `VPROC-0059::STEP-REVIEW_AND_CERTIFY_ACCESS`                | `OUTSIDE_OPERATIONAL_CLASS` | `NONE`                   | Trabajo administrativo, de gobierno o decisión de backoffice; no tiene ejecución operativa interna dominante.                                                                                                                                      |
| `VSCREEN-0115` | Gobierno de documentos y evidencia                    | `viso`     | `VPROC-0060::STEP-GOVERN_DOCUMENT_EVIDENCE`                 | `OUTSIDE_OPERATIONAL_CLASS` | `NONE`                   | Gobierno, configuración o publicación de reglas y maestros; no ejecuta trabajo operativo vivo y se revisará en PROC-SCREEN-008.                                                                                                                    |
| `VSCREEN-0116` | Registro de riesgos empresariales                     | `viso`     | `VPROC-0063::STEP-ASSESS_ENTERPRISE_RISK`                   | `OUTSIDE_OPERATIONAL_CLASS` | `NONE`                   | Trabajo administrativo, de gobierno o decisión de backoffice; no tiene ejecución operativa interna dominante.                                                                                                                                      |
| `VSCREEN-0117` | Requerimientos de asesores y autoridades              | `viso`     | `VPROC-0064::STEP-MANAGE_EXTERNAL_REQUIREMENT`              | `OUTSIDE_OPERATIONAL_CLASS` | `NONE`                   | Trabajo administrativo, de gobierno o decisión de backoffice; no tiene ejecución operativa interna dominante.                                                                                                                                      |
| `VSCREEN-0118` | Gestión de desempeño y desarrollo                     | `viso`     | `VPROC-0065::STEP-REVIEW_PERFORMANCE_AND_DEVELOPMENT`       | `OUTSIDE_OPERATIONAL_CLASS` | `NONE`                   | Trabajo administrativo, de gobierno o decisión de backoffice; no tiene ejecución operativa interna dominante.                                                                                                                                      |
| `VSCREEN-0119` | Asignación y control de elementos de protección       | `viso`     | `VPROC-0066::STEP-ASSIGN_PROTECTIVE_EQUIPMENT`              | `SECONDARY_OPERATIONAL`     | `OPERATIONAL_CONTROL`    | La pantalla valida, revisa, reconcilia o decide sobre trabajo activo, pero no concentra la ejecución material principal. Conserva relevancia operativa secundaria y su clase primaria se resolverá en PROC-SCREEN-006 a PROC-SCREEN-011.           |
| `VSCREEN-0120` | Mesa de servicio tecnológico                          | `viso`     | `VPROC-0058::STEP-RESOLVE_TECH_SERVICE_CASE`                | `SECONDARY_OPERATIONAL`     | `OPERATIONAL_RECOVERY`   | La pantalla restablece o contiene la continuidad de la operación, pero no concentra la ejecución material principal. Conserva relevancia operativa secundaria y su clase primaria se resolverá en PROC-SCREEN-006 a PROC-SCREEN-011.               |
| `VSCREEN-0121` | Continuidad, contingencia y recuperación              | `viso`     | `VPROC-0062::STEP-ACTIVATE_AND_RECOVER_CONTINUITY`          | `SECONDARY_OPERATIONAL`     | `OPERATIONAL_RECOVERY`   | La pantalla restablece o contiene la continuidad de la operación, pero no concentra la ejecución material principal. Conserva relevancia operativa secundaria y su clase primaria se resolverá en PROC-SCREEN-006 a PROC-SCREEN-011.               |
| `VSCREEN-0122` | Privacidad, cumplimiento y conservación               | `viso`     | `VPROC-0060::STEP-GOVERN_PRIVACY_AND_RETENTION`             | `OUTSIDE_OPERATIONAL_CLASS` | `NONE`                   | Gobierno, configuración o publicación de reglas y maestros; no ejecuta trabajo operativo vivo y se revisará en PROC-SCREEN-008.                                                                                                                    |
| `VSCREEN-0123` | Gestión de comunicaciones internas                    | `viso`     | `VPROC-0004::STEP-PUBLISH_INTERNAL_COMMUNICATION`           | `OUTSIDE_OPERATIONAL_CLASS` | `NONE`                   | Gobierno, configuración o publicación de reglas y maestros; no ejecuta trabajo operativo vivo y se revisará en PROC-SCREEN-008.                                                                                                                    |
| `VSCREEN-0124` | Mis comunicados laborales                             | `anima`    | `VPROC-0004::STEP-CONSULT_AND_ACKNOWLEDGE_COMMUNICATION`    | `OUTSIDE_OPERATIONAL_CLASS` | `NONE`                   | Canal personal del trabajador sin ejecución operativa interna dominante. Su clasificación primaria queda reservada a PROC-SCREEN-010.                                                                                                              |
| `VSCREEN-0125` | Mi carnet laboral                                     | `anima`    | `VPROC-0006::STEP-PRESENT_EMPLOYEE_CREDENTIAL`              | `OUTSIDE_OPERATIONAL_CLASS` | `NONE`                   | Canal personal del trabajador sin ejecución operativa interna dominante. Su clasificación primaria queda reservada a PROC-SCREEN-010.                                                                                                              |
| `VSCREEN-0126` | Mis documentos laborales                              | `anima`    | `VPROC-0060::STEP-CONSULT_OR_SUBMIT_EMPLOYMENT_DOCUMENT`    | `OUTSIDE_OPERATIONAL_CLASS` | `NONE`                   | Canal personal del trabajador sin ejecución operativa interna dominante. Su clasificación primaria queda reservada a PROC-SCREEN-010.                                                                                                              |
| `VSCREEN-0127` | Mi capacitación                                       | `anima`    | `VPROC-0065::STEP-COMPLETE_ASSIGNED_TRAINING`               | `OUTSIDE_OPERATIONAL_CLASS` | `NONE`                   | Canal personal del trabajador sin ejecución operativa interna dominante. Su clasificación primaria queda reservada a PROC-SCREEN-010.                                                                                                              |
| `VSCREEN-0128` | Mis objetivos y retroalimentación                     | `anima`    | `VPROC-0065::STEP-REVIEW_PERSONAL_OBJECTIVES`               | `OUTSIDE_OPERATIONAL_CLASS` | `NONE`                   | Canal personal del trabajador sin ejecución operativa interna dominante. Su clasificación primaria queda reservada a PROC-SCREEN-010.                                                                                                              |
| `VSCREEN-0129` | Mis solicitudes de soporte                            | `anima`    | `VPROC-0058::STEP-SUBMIT_AND_TRACK_SUPPORT_REQUEST`         | `SECONDARY_OPERATIONAL`     | `OPERATIONAL_ENTRY`      | La pantalla habilita la entrada inmediata a trabajo operativo, pero no concentra la ejecución material principal. Conserva relevancia operativa secundaria y su clase primaria se resolverá en PROC-SCREEN-006 a PROC-SCREEN-011.                  |
| `VSCREEN-0130` | Mis reportes de seguridad y salud                     | `anima`    | `VPROC-0013::STEP-REPORT_SST_EVENT`                         | `SECONDARY_OPERATIONAL`     | `OPERATIONAL_CAPTURE`    | La pantalla registra hechos, cantidades, tiempos o condiciones de la operación, pero no concentra la ejecución material principal. Conserva relevancia operativa secundaria y su clase primaria se resolverá en PROC-SCREEN-006 a PROC-SCREEN-011. |
| `VSCREEN-0131` | Mis elementos de protección                           | `anima`    | `VPROC-0066::STEP-ACKNOWLEDGE_PROTECTIVE_EQUIPMENT`         | `SECONDARY_OPERATIONAL`     | `OPERATIONAL_CAPTURE`    | La pantalla registra hechos, cantidades, tiempos o condiciones de la operación, pero no concentra la ejecución material principal. Conserva relevancia operativa secundaria y su clase primaria se resolverá en PROC-SCREEN-006 a PROC-SCREEN-011. |
| `VSCREEN-0132` | Reservas de inventario                                | `nexo`     | `VPROC-0028::STEP-RESERVE_STOCK`                            | `PRIMARY_OPERATIONAL`       | `OPERATIONAL_EXECUTION`  | La intención dominante ejecuta o confirma una mutación material de la operación sobre un caso activo; un retraso o error afecta de forma inmediata la continuidad, custodia, producción, servicio, venta o entrega.                                |
| `VSCREEN-0133` | Planes y órdenes de mantenimiento de activos          | `nexo`     | `VPROC-0030::STEP-PLAN_AND_EXECUTE_ASSET_MAINTENANCE`       | `PRIMARY_OPERATIONAL`       | `OPERATIONAL_PLANNING`   | La intención dominante prepara capacidad o secuencia de ejecución próxima sobre un caso activo; un retraso o error afecta de forma inmediata la continuidad, custodia, producción, servicio, venta o entrega.                                      |
| `VSCREEN-0134` | Garantías, seguros y reclamaciones de activos         | `nexo`     | `VPROC-0030::STEP-MANAGE_ASSET_CLAIM`                       | `OUTSIDE_OPERATIONAL_CLASS` | `NONE`                   | Maestro, configuración o gestión no inmediata del dominio logístico; no corresponde a ejecución operativa dominante.                                                                                                                               |
| `VSCREEN-0135` | Instancias y operación de kits                        | `nexo`     | `VPROC-0067::STEP-ASSEMBLE_AND_CONTROL_KIT`                 | `PRIMARY_OPERATIONAL`       | `OPERATIONAL_EXECUTION`  | La intención dominante ejecuta o confirma una mutación material de la operación sobre un caso activo; un retraso o error afecta de forma inmediata la continuidad, custodia, producción, servicio, venta o entrega.                                |
| `VSCREEN-0136` | Flota y vehículos                                     | `nexo`     | `VPROC-0031::STEP-MANAGE_FLEET_ASSET`                       | `SECONDARY_OPERATIONAL`     | `OPERATIONAL_LOOKUP`     | La pantalla aporta consulta o identificación necesaria para ejecutar, pero no concentra la ejecución material principal. Conserva relevancia operativa secundaria y su clase primaria se resolverá en PROC-SCREEN-006 a PROC-SCREEN-011.           |
| `VSCREEN-0137` | Kilometraje y combustible                             | `nexo`     | `VPROC-0031::STEP-CAPTURE_MILEAGE_AND_FUEL`                 | `PRIMARY_OPERATIONAL`       | `OPERATIONAL_CAPTURE`    | La intención dominante registra hechos, cantidades, tiempos o condiciones de la operación sobre un caso activo; un retraso o error afecta de forma inmediata la continuidad, custodia, producción, servicio, venta o entrega.                      |
| `VSCREEN-0138` | Planeación de rutas y despachos                       | `nexo`     | `VPROC-0048::STEP-PLAN_ROUTE_AND_DISPATCH`                  | `PRIMARY_OPERATIONAL`       | `OPERATIONAL_PLANNING`   | La intención dominante prepara capacidad o secuencia de ejecución próxima sobre un caso activo; un retraso o error afecta de forma inmediata la continuidad, custodia, producción, servicio, venta o entrega.                                      |
| `VSCREEN-0139` | Ejecución de ruta y prueba de entrega                 | `nexo`     | `VPROC-0049::STEP-EXECUTE_ROUTE_AND_PROVE_DELIVERY`         | `PRIMARY_OPERATIONAL`       | `OPERATIONAL_EXECUTION`  | La intención dominante ejecuta o confirma una mutación material de la operación sobre un caso activo; un retraso o error afecta de forma inmediata la continuidad, custodia, producción, servicio, venta o entrega.                                |
| `VSCREEN-0140` | Novedades, rechazos y retornos logísticos             | `nexo`     | `VPROC-0049::STEP-RESOLVE_LOGISTICS_EXCEPTION`              | `PRIMARY_OPERATIONAL`       | `OPERATIONAL_EXCEPTION`  | La intención dominante resuelve una excepción, reversión, rechazo o retorno operativo sobre un caso activo; un retraso o error afecta de forma inmediata la continuidad, custodia, producción, servicio, venta o entrega.                          |
| `VSCREEN-0141` | Instalaciones, servicios y mantenimiento locativo     | `nexo`     | `VPROC-0055::STEP-MANAGE_FACILITY_SERVICE`                  | `PRIMARY_OPERATIONAL`       | `OPERATIONAL_EXECUTION`  | La intención dominante ejecuta o confirma una mutación material de la operación sobre un caso activo; un retraso o error afecta de forma inmediata la continuidad, custodia, producción, servicio, venta o entrega.                                |
| `VSCREEN-0142` | Configuración de políticas y rutas logísticas         | `nexo`     | `VPROC-0048::STEP-CONFIGURE_LOGISTICS_POLICY`               | `OUTSIDE_OPERATIONAL_CLASS` | `NONE`                   | Gobierno, configuración o publicación de reglas y maestros; no ejecuta trabajo operativo vivo y se revisará en PROC-SCREEN-008.                                                                                                                    |
| `VSCREEN-0143` | Diseñador de etiquetas logísticas                     | `nexo`     | `VPROC-0015::STEP-AUTHOR_LOGISTICS_LABEL_TEMPLATE`          | `OUTSIDE_OPERATIONAL_CLASS` | `NONE`                   | Gobierno, configuración o publicación de reglas y maestros; no ejecuta trabajo operativo vivo y se revisará en PROC-SCREEN-008.                                                                                                                    |
| `VSCREEN-0144` | Cola y trabajos de impresión logística                | `nexo`     | `VPROC-0024::STEP-OPERATE_PRINT_QUEUE`                      | `PRIMARY_OPERATIONAL`       | `OPERATIONAL_EXECUTION`  | La intención dominante ejecuta o confirma una mutación material de la operación sobre un caso activo; un retraso o error afecta de forma inmediata la continuidad, custodia, producción, servicio, venta o entrega.                                |
| `VSCREEN-0145` | Contratos, precios y condiciones de proveedor         | `origo`    | `VPROC-0020::STEP-GOVERN_SUPPLIER_TERMS`                    | `OUTSIDE_OPERATIONAL_CLASS` | `NONE`                   | Gobierno, configuración o publicación de reglas y maestros; no ejecuta trabajo operativo vivo y se revisará en PROC-SCREEN-008.                                                                                                                    |
| `VSCREEN-0146` | Desempeño y reclamaciones de proveedor                | `origo`    | `VPROC-0020::STEP-REVIEW_SUPPLIER_PERFORMANCE`              | `OUTSIDE_OPERATIONAL_CLASS` | `NONE`                   | Trabajo administrativo, de gobierno o decisión de backoffice; no tiene ejecución operativa interna dominante.                                                                                                                                      |
| `VSCREEN-0147` | Oportunidades y cotizaciones de catering o B2B        | `pulso`    | `VPROC-0041::STEP-QUALIFY_B2B_OPPORTUNITY`                  | `OUTSIDE_OPERATIONAL_CLASS` | `NONE`                   | Configuración, análisis o desarrollo comercial fuera de la ejecución operativa inmediata.                                                                                                                                                          |
| `VSCREEN-0148` | Ejecución de catering o venta B2B                     | `pulso`    | `VPROC-0041::STEP-EXECUTE_B2B_COMMITMENT`                   | `PRIMARY_OPERATIONAL`       | `OPERATIONAL_EXECUTION`  | La intención dominante ejecuta o confirma una mutación material de la operación sobre un caso activo; un retraso o error afecta de forma inmediata la continuidad, custodia, producción, servicio, venta o entrega.                                |
| `VSCREEN-0149` | Operación de reservas y eventos                       | `pulso`    | `VPROC-0047::STEP-MANAGE_RESERVATION_OR_EVENT`              | `PRIMARY_OPERATIONAL`       | `OPERATIONAL_EXECUTION`  | La intención dominante ejecuta o confirma una mutación material de la operación sobre un caso activo; un retraso o error afecta de forma inmediata la continuidad, custodia, producción, servicio, venta o entrega.                                |
| `VSCREEN-0150` | Casos de reclamo y compensación                       | `pulso`    | `VPROC-0046::STEP-RESOLVE_CUSTOMER_CLAIM`                   | `PRIMARY_OPERATIONAL`       | `OPERATIONAL_EXCEPTION`  | La intención dominante resuelve una excepción, reversión, rechazo o retorno operativo sobre un caso activo; un retraso o error afecta de forma inmediata la continuidad, custodia, producción, servicio, venta o entrega.                          |
| `VSCREEN-0151` | Coordinación de entrega mediante tercero              | `pulso`    | `VPROC-0050::STEP-COORDINATE_THIRD_PARTY_DELIVERY`          | `PRIMARY_OPERATIONAL`       | `OPERATIONAL_MONITORING` | La intención dominante sigue un compromiso operativo todavía abierto sobre un caso activo; un retraso o error afecta de forma inmediata la continuidad, custodia, producción, servicio, venta o entrega.                                           |
| `VSCREEN-0152` | Análisis de satisfacción y servicio                   | `pulso`    | `VPROC-0068::STEP-ANALYZE_SERVICE_SATISFACTION`             | `OUTSIDE_OPERATIONAL_CLASS` | `NONE`                   | Análisis o simulación sin ejecución material inmediata; su carril primario se resolverá en las clasificaciones posteriores.                                                                                                                        |
| `VSCREEN-0153` | Paquete laboral para pagos y beneficios               | `numera`   | `VPROC-0010::STEP-PREPARE_LABOR_PAYMENT_PACKAGE`            | `OUTSIDE_OPERATIONAL_CLASS` | `NONE`                   | Backoffice financiero y contable; su intención dominante es administrativa, de conciliación o análisis y se revisará en PROC-SCREEN-006.                                                                                                           |
| `VSCREEN-0154` | Facturas y documentos fiscales                        | `numera`   | `VPROC-0051::STEP-MANAGE_FISCAL_DOCUMENT`                   | `OUTSIDE_OPERATIONAL_CLASS` | `NONE`                   | Backoffice financiero y contable; su intención dominante es administrativa, de conciliación o análisis y se revisará en PROC-SCREEN-006.                                                                                                           |
| `VSCREEN-0155` | Tesorería y programación de pagos                     | `numera`   | `VPROC-0052::STEP-PLAN_AND_EXECUTE_PAYMENTS`                | `OUTSIDE_OPERATIONAL_CLASS` | `NONE`                   | Backoffice financiero y contable; su intención dominante es administrativa, de conciliación o análisis y se revisará en PROC-SCREEN-006.                                                                                                           |
| `VSCREEN-0156` | Presupuestos, escenarios y forecast                   | `numera`   | `VPROC-0069::STEP-PLAN_BUDGET_AND_FORECAST`                 | `OUTSIDE_OPERATIONAL_CLASS` | `NONE`                   | Backoffice financiero y contable; su intención dominante es administrativa, de conciliación o análisis y se revisará en PROC-SCREEN-006.                                                                                                           |
| `VSCREEN-0157` | Impuestos y obligaciones de cumplimiento              | `numera`   | `VPROC-0052::STEP-MANAGE_TAX_OBLIGATION`                    | `OUTSIDE_OPERATIONAL_CLASS` | `NONE`                   | Backoffice financiero y contable; su intención dominante es administrativa, de conciliación o análisis y se revisará en PROC-SCREEN-006.                                                                                                           |
| `VSCREEN-0158` | Distribución y asignación de costos                   | `numera`   | `VPROC-0054::STEP-ALLOCATE_COSTS`                           | `OUTSIDE_OPERATIONAL_CLASS` | `NONE`                   | Backoffice financiero y contable; su intención dominante es administrativa, de conciliación o análisis y se revisará en PROC-SCREEN-006.                                                                                                           |
| `VSCREEN-0159` | Indicadores, análisis y planes de mejora              | `numera`   | `VPROC-0061::STEP-ANALYZE_AND_PLAN_IMPROVEMENT`             | `OUTSIDE_OPERATIONAL_CLASS` | `NONE`                   | Backoffice financiero y contable; su intención dominante es administrativa, de conciliación o análisis y se revisará en PROC-SCREEN-006.                                                                                                           |
| `VSCREEN-0160` | Inicio y selección del portal de compras              | `pass`     | `VPROC-0039::STEP-ENTER_CUSTOMER_COMMERCE`                  | `OUTSIDE_OPERATIONAL_CLASS` | `NONE`                   | Canal de cliente; no es superficie de ejecución operativa interna. Su clasificación primaria queda reservada a PROC-SCREEN-011.                                                                                                                    |
| `VSCREEN-0161` | Menú y catálogo comercial del cliente                 | `pass`     | `VPROC-0017::STEP-BROWSE_COMMERCIAL_OFFER`                  | `OUTSIDE_OPERATIONAL_CLASS` | `NONE`                   | Canal de cliente; no es superficie de ejecución operativa interna. Su clasificación primaria queda reservada a PROC-SCREEN-011.                                                                                                                    |
| `VSCREEN-0162` | Carrito y configuración del pedido                    | `pass`     | `VPROC-0039::STEP-CONFIGURE_CART`                           | `OUTSIDE_OPERATIONAL_CLASS` | `NONE`                   | Canal de cliente; no es superficie de ejecución operativa interna. Su clasificación primaria queda reservada a PROC-SCREEN-011.                                                                                                                    |
| `VSCREEN-0163` | Dirección, modalidad y programación de entrega        | `pass`     | `VPROC-0050::STEP-SELECT_FULFILLMENT`                       | `OUTSIDE_OPERATIONAL_CLASS` | `NONE`                   | Canal de cliente; no es superficie de ejecución operativa interna. Su clasificación primaria queda reservada a PROC-SCREEN-011.                                                                                                                    |
| `VSCREEN-0164` | Revisión, checkout e inicio de pago                   | `pass`     | `VPROC-0043::STEP-REVIEW_AND_START_PAYMENT`                 | `OUTSIDE_OPERATIONAL_CLASS` | `NONE`                   | Canal de cliente; no es superficie de ejecución operativa interna. Su clasificación primaria queda reservada a PROC-SCREEN-011.                                                                                                                    |
| `VSCREEN-0165` | Confirmación de pedido y retorno de pago              | `pass`     | `VPROC-0043::STEP-PRESENT_ORDER_RECEIPT`                    | `OUTSIDE_OPERATIONAL_CLASS` | `NONE`                   | Canal de cliente; no es superficie de ejecución operativa interna. Su clasificación primaria queda reservada a PROC-SCREEN-011.                                                                                                                    |
| `VSCREEN-0166` | Mis pedidos y detalle                                 | `pass`     | `VPROC-0039::STEP-CONSULT_PERSONAL_ORDERS`                  | `OUTSIDE_OPERATIONAL_CLASS` | `NONE`                   | Canal de cliente; no es superficie de ejecución operativa interna. Su clasificación primaria queda reservada a PROC-SCREEN-011.                                                                                                                    |
| `VSCREEN-0167` | Seguimiento de preparación y entrega del cliente      | `pass`     | `VPROC-0050::STEP-TRACK_PERSONAL_FULFILLMENT`               | `OUTSIDE_OPERATIONAL_CLASS` | `NONE`                   | Canal de cliente; no es superficie de ejecución operativa interna. Su clasificación primaria queda reservada a PROC-SCREEN-011.                                                                                                                    |
| `VSCREEN-0168` | Chat y comunicación asociada al pedido                | `pass`     | `VPROC-0047::STEP-COMMUNICATE_ABOUT_ORDER`                  | `OUTSIDE_OPERATIONAL_CLASS` | `NONE`                   | Canal de cliente; no es superficie de ejecución operativa interna. Su clasificación primaria queda reservada a PROC-SCREEN-011.                                                                                                                    |
| `VSCREEN-0169` | Mis reclamos y casos de servicio                      | `pass`     | `VPROC-0046::STEP-SUBMIT_AND_TRACK_CLAIM`                   | `OUTSIDE_OPERATIONAL_CLASS` | `NONE`                   | Canal de cliente; no es superficie de ejecución operativa interna. Su clasificación primaria queda reservada a PROC-SCREEN-011.                                                                                                                    |
| `VSCREEN-0170` | Mis reservas y eventos                                | `pass`     | `VPROC-0047::STEP-MANAGE_PERSONAL_RESERVATION`              | `OUTSIDE_OPERATIONAL_CLASS` | `NONE`                   | Canal de cliente; no es superficie de ejecución operativa interna. Su clasificación primaria queda reservada a PROC-SCREEN-011.                                                                                                                    |
| `VSCREEN-0171` | Calificación y satisfacción                           | `pass`     | `VPROC-0068::STEP-SUBMIT_SATISFACTION_RATING`               | `OUTSIDE_OPERATIONAL_CLASS` | `NONE`                   | Canal de cliente; no es superficie de ejecución operativa interna. Su clasificación primaria queda reservada a PROC-SCREEN-011.                                                                                                                    |
| `VSCREEN-0172` | Comunicaciones y notificaciones del cliente           | `pass`     | `VPROC-0047::STEP-CONSULT_CUSTOMER_COMMUNICATION`           | `OUTSIDE_OPERATIONAL_CLASS` | `NONE`                   | Canal de cliente; no es superficie de ejecución operativa interna. Su clasificación primaria queda reservada a PROC-SCREEN-011.                                                                                                                    |
| `VSCREEN-0173` | Trazabilidad e investigación de lote                  | `fogo`     | `VPROC-0035::STEP-INVESTIGATE_BATCH_TRACEABILITY`           | `OUTSIDE_OPERATIONAL_CLASS` | `NONE`                   | Superficie histórica o de auditoría; no opera el caso vivo y se revisará en PROC-SCREEN-009.                                                                                                                                                       |
| `VSCREEN-0174` | Controles operativos de inocuidad                     | `fogo`     | `VPROC-0014::STEP-EXECUTE_FOOD_SAFETY_CONTROL`              | `PRIMARY_OPERATIONAL`       | `OPERATIONAL_CONTROL`    | La intención dominante valida, revisa, reconcilia o decide sobre trabajo activo sobre un caso activo; un retraso o error afecta de forma inmediata la continuidad, custodia, producción, servicio, venta o entrega.                                |
| `VSCREEN-0175` | Seguridad de cuenta y sesiones                        | `shell`    | `VPROC-0059::STEP-MANAGE_ACCOUNT_SECURITY`                  | `OUTSIDE_OPERATIONAL_CLASS` | `NONE`                   | Acceso, cuenta o navegación transversal; no constituye por sí misma una superficie operativa.                                                                                                                                                      |
| `VSCREEN-0176` | Definición de kits y conjuntos                        | `nexo`     | `VPROC-0067::STEP-MAINTAIN_KIT_DEFINITION`                  | `OUTSIDE_OPERATIONAL_CLASS` | `NONE`                   | Mantiene una definición reutilizable; no opera una instancia de kit.                                                                                                                                                                               |
| `VSCREEN-0177` | Configuración de impresoras logísticas                | `nexo`     | `VPROC-0024::STEP-CONFIGURE_LOGISTICS_PRINTERS`             | `OUTSIDE_OPERATIONAL_CLASS` | `NONE`                   | Mantiene recursos y políticas reutilizables; no opera un trabajo de impresión.                                                                                                                                                                     |

---

#### 11. Resumen por aplicación

| Aplicación | Primaria operativa | Secundaria operativa | Fuera de clase operativa |   Total |
| ---------- | -----------------: | -------------------: | -----------------------: | ------: |
| `shell`    |                  0 |                    4 |                        3 |       7 |
| `viso`     |                  0 |                   10 |                       21 |      31 |
| `anima`    |                  1 |                    6 |                        7 |      14 |
| `nexo`     |                 25 |                    4 |                        8 |      37 |
| `fogo`     |                 10 |                    2 |                        3 |      15 |
| `origo`    |                  2 |                    3 |                        9 |      14 |
| `pulso`    |                 16 |                    1 |                        3 |      20 |
| `numera`   |                  0 |                    0 |                       20 |      20 |
| `pass`     |                  0 |                    0 |                       19 |      19 |
| **Total**  |             **54** |               **30** |                   **93** | **177** |

Las aplicaciones no determinan la clasificación. La tabla solo comprueba que la matriz física y sus conteos coincidan.

---

#### 12. Resumen por patrón

| Patrón                             | Pantallas |
| ---------------------------------- | --------: |
| `OPERATIONAL_ENTRY`                |         4 |
| `OPERATIONAL_QUEUE`                |         5 |
| `OPERATIONAL_LOOKUP`               |         6 |
| `OPERATIONAL_PLANNING`             |         4 |
| `OPERATIONAL_CAPTURE`              |         7 |
| `OPERATIONAL_EXECUTION`            |        26 |
| `OPERATIONAL_CONTROL`              |        13 |
| `OPERATIONAL_MONITORING`           |         6 |
| `OPERATIONAL_EXCEPTION`            |         7 |
| `OPERATIONAL_CLOSURE`              |         2 |
| `OPERATIONAL_RECOVERY`             |         4 |
| **Total con relevancia operativa** |    **84** |

Las 91 pantallas con `NONE` continúan hacia las tareas posteriores sin recibir una categoría inventada.

---

#### 13. Fronteras especiales

1. **SHELL:** contexto, dispositivo compartido, notificaciones y diagnóstico pueden ser soporte operativo, pero acceso, cuenta y navegación no son operación por sí solos.
2. **VISO:** programación, revisión, incidentes, cumplimiento, EPP, soporte y continuidad pueden tener relevancia secundaria; la aplicación no se convierte por eso en superficie operativa universal.
3. **ANIMA:** el registro de asistencia es operación primaria; consultas y solicitudes personales pueden apoyar la operación, pero la clasificación personal se resolverá en `PROC-SCREEN-010`.
4. **NEXO:** movimientos, conteos, remisiones, LPN, activos, rutas, mantenimiento, instalaciones e impresión operativa pueden ser primarios; maestros y plantillas no lo son automáticamente.
5. **FOGO:** lote, avance, calidad, empaque, disposición e inocuidad son operativos; edición y publicación de recetas o auditoría de trazabilidad conservan otra intención dominante.
6. **ORIGO:** recepción y resolución de diferencias son operativas; solicitud, comparación, aprobación y gobierno de proveedores son backoffice.
7. **PULSO:** venta, servicio de mesa, pago, caja, pedidos externos, devoluciones, catering, reservas, reclamos y entrega son operativos; configuración comercial y análisis no.
8. **NUMERA:** permanece fuera de la clase operativa en este corte; sus pantallas son backoffice financiero y se evaluarán en `PROC-SCREEN-006`.
9. **PASS:** permanece fuera de la operación interna; sus superficies se clasificarán como cliente en `PROC-SCREEN-011`.
10. **AURA:** continúa sin pantallas y sin clasificación.

---

#### 14. Relación con las clasificaciones posteriores

Las clasificaciones son acumulativas, pero solo una podrá quedar como clase primaria.

```text
PRIMARY_OPERATIONAL
→ operational es la clase primaria

SECONDARY_OPERATIONAL
→ operational queda como clase secundaria
→ la clase primaria se decide en PROC-SCREEN-006 a PROC-SCREEN-011

OUTSIDE_OPERATIONAL_CLASS
→ no agrega operational
→ la clase primaria se decide en PROC-SCREEN-006 a PROC-SCREEN-011
```

`PROC-SCREEN-011`, como última tarea de este subtramo, deberá ejecutar la puerta de cierre que confirme:

- exactamente una clase primaria por pantalla;
- cero o más clases secundarias compatibles;
- ninguna pantalla sin clasificación;
- ninguna pareja de clases primarias competidoras;
- fundamentos y versiones conservados.

---

#### 15. Cambio y versionado

Cambiar `operational_fit` o `operational_pattern` exige:

1. propuesta trazable;
2. comparación de intención, objeto, paso, urgencia, efecto y usuario;
3. explicación de por qué el trabajo dejó de ser o pasó a ser operativo;
4. nueva versión de clasificación;
5. conservación del valor anterior;
6. revisión coordinada de actores, dispositivos, acciones, estados, permisos, métricas y pruebas posteriores;
7. nueva identidad de pantalla cuando el cambio destruya su intención principal.

Un cambio de aplicación, ruta o componente no cambia automáticamente la clasificación.

---

#### 16. Validaciones obligatorias

La compilación deberá fallar cuando:

1. falte una de las 177 pantallas;
2. una pantalla aparezca más de una vez;
3. falte `operational_fit`;
4. el valor no pertenezca al vocabulario;
5. una pantalla primaria o secundaria use `NONE`;
6. una pantalla fuera de clase use un patrón operativo;
7. falte fundamento;
8. proceso o paso no coincidan con las tareas anteriores;
9. los conteos no sean 54, 30 y 93;
10. la distribución por aplicación no coincida;
11. los patrones no sumen 84;
12. PASS o NUMERA reciban `PRIMARY_OPERATIONAL` sin una nueva decisión aprobada;
13. una pantalla de configuración o auditoría sea primaria solo por pertenecer a una aplicación operativa;
14. la clasificación sea utilizada como permiso, rol, contexto o acceso;
15. un cambio elimine el historial anterior;
16. AURA reciba una clasificación sin pantalla admitida;
17. la puerta final deje más de una clase primaria o ninguna clase primaria.

---

#### 17. Seguridad y autorización

La clasificación operativa no concede:

- acceso a la pantalla;
- lectura de información;
- ejecución de acciones;
- uso de dispositivo compartido;
- turno o check-in;
- sede o área activa;
- autoridad para aprobar;
- capacidad de corregir o cerrar;
- acceso a procesos relacionados;
- confianza en handoffs.

Cada aplicación deberá resolver identidad, actor, permiso, contexto, recurso, territorio, estado, versión y segregación.

---

#### 18. SCREEN-OPERATIONAL-CARRYOVER-REGISTER-001

| Pendiente                                                              | Propietario exacto                                        |
| ---------------------------------------------------------------------- | --------------------------------------------------------- |
| clasificar pantallas administrativas                                   | `PROC-SCREEN-006`                                         |
| clasificar pantallas de supervisión                                    | `PROC-SCREEN-007`                                         |
| clasificar pantallas de configuración                                  | `PROC-SCREEN-008`                                         |
| clasificar pantallas de auditoría                                      | `PROC-SCREEN-009`                                         |
| clasificar pantallas personales                                        | `PROC-SCREEN-010`                                         |
| clasificar pantallas de cliente y cerrar la puerta de clases primarias | `PROC-SCREEN-011`                                         |
| definir actores objetivo                                               | `PROC-SCREEN-012`                                         |
| definir dispositivos soportados                                        | `PROC-SCREEN-013`                                         |
| definir acciones                                                       | `PROC-SCREEN-014` y `PROC-SCREEN-015`                     |
| definir entradas, salidas y estados de interfaz                        | `PROC-SCREEN-016` a `PROC-SCREEN-021`                     |
| definir sensibilidad y permisos                                        | `PROC-SCREEN-022` a `PROC-SCREEN-024`                     |
| vincular operaciones técnicas                                          | `PROC-SCREEN-025`                                         |
| mapear rutas y legado                                                  | `PROC-SCREEN-026`                                         |
| definir métricas y aceptación operativa                                | `PROC-SCREEN-027` y `PROC-SCREEN-028`                     |
| implementar tipos y validadores                                        | paquetes E5 y CI documental                               |
| validar con usuarios y estaciones reales                               | `UX-QA-*` y pilotos E5                                    |
| admitir AURA                                                           | tareas canónicas de AURA y nueva admisión `PROC-SCREEN-*` |

No queda pendiente narrativo sin tarea o puerta de resolución.

---

#### 19. Requisitos de prueba derivados

**Resultado:** GENERA 30 REQUISITOS DE PRUEBA.

Se incorporan `TREQ-UX-609` a `TREQ-UX-638` al Registro Canónico completo. Permanecen en estado `IDENTIFICADO`; automatización, implementación y evidencia corresponden a CI documental, paquetes E5, BLOQUE U, staging y pilotos.

---

#### 20. Criterios de aceptación

- [x] Se clasifican las 177 pantallas sin renumerarlas.
- [x] Cada pantalla recibe exactamente un `operational_fit`.
- [x] Se distinguen 54 primarias, 30 secundarias y 93 fuera de clase.
- [x] Las 84 pantallas con relevancia operativa utilizan once patrones cerrados.
- [x] La clasificación se deriva de proceso, paso, efecto y urgencia, no de aplicación o repositorio.
- [x] Se preservan las fronteras de SHELL, VISO, ANIMA, NEXO, FOGO, ORIGO, PULSO, NUMERA y PASS.
- [x] AURA conserva cero pantallas.
- [x] La clasificación no concede permisos ni contexto.
- [x] Se define la convivencia entre clase primaria y clases secundarias.
- [x] Se asigna a `PROC-SCREEN-011` la puerta final de completitud.
- [x] Se definen cambio, versionado, historial y validaciones.
- [x] Se generan `TREQ-UX-609` a `TREQ-UX-638`.
- [x] No se anticipan actores, dispositivos, acciones, estados, permisos, rutas o APIs.
- [x] No se implementa código ni se avanza a `PROC-SCREEN-006`.

---

#### 21. Resultado y continuidad

```text
PROC-SCREEN-004 APROBADA
PROC-SCREEN-005 APROBADA
PROC-SCREEN-006 NO INICIADA
```

La continuidad documental pasa exclusivamente a:

```text
PROC-SCREEN-006 — Clasificar pantalla administrativa
```


### ✅ PROC-SCREEN-006 — Clasificar pantalla administrativa

**Estado:** APROBADA

**Bloque:** E2 — Arquitectura funcional, procesos y experiencia transversal

**Marcador exacto que reemplaza:** `### [ ] PROC-SCREEN-006 — Clasificar pantalla administrativa`

**Tarea anterior:** `PROC-SCREEN-005 — Clasificar pantalla operativa` — APROBADA

**Siguiente tarea reservada:** `PROC-SCREEN-007 — Clasificar pantalla de supervisión` — NO INICIADA

**Artefactos lógicos contenidos en esta tarea:**

- `SCREEN-ADMINISTRATIVE-CLASSIFICATION-CONTRACT-001`;
- `SCREEN-ADMINISTRATIVE-PATTERN-VOCABULARY-001`;
- `SCREEN-ADMINISTRATIVE-CLASSIFICATION-REGISTER-001`;
- `SCREEN-ADMINISTRATIVE-COVERAGE-MATRIX-001`;
- `SCREEN-ADMINISTRATIVE-CLASSIFICATION-CHANGE-POLICY-001`;
- `SCREEN-ADMINISTRATIVE-CLASSIFICATION-VALIDATION-GATE-001`;
- `SCREEN-ADMINISTRATIVE-CARRYOVER-REGISTER-001`.

**Resultado cuantitativo:** **177 pantallas clasificadas**, de las cuales **53** quedan como `PRIMARY_ADMINISTRATIVE`, **51** como `SECONDARY_ADMINISTRATIVE` y **73** como `OUTSIDE_ADMINISTRATIVE_CLASS`; se utilizan **12 patrones administrativos**, existen **104 pantallas con relevancia administrativa** y ninguna pantalla recibe simultáneamente clase primaria operativa y administrativa.

**Naturaleza:** clasificación documental del grado de relación de cada pantalla con el trabajo administrativo interno, el backoffice y el gobierno empresarial. No define todavía clasificación de supervisión, configuración, auditoría, personal o cliente; tampoco define actores, dispositivos, acciones, estados de interfaz, sensibilidad, permisos, rutas u operaciones técnicas.

**Cambios en código de producto, componentes, rutas, repositorios consumidores, Supabase, tablas, migraciones, RLS, RPC, eventos, analítica o producción:** no autorizados por esta tarea.

---

#### 1. Propósito

Determinar cuáles pantallas constituyen el espacio principal de trabajo administrativo de Vento Group, cuáles aportan soporte administrativo a otra intención dominante y cuáles quedan fuera de esta clase.

```text
PANTALLA
    +
PROCESO Y PASO DOMINANTES
    +
EXPEDIENTE, CASO, RECURSO, OBLIGACION O DECISION
    +
RESPONSABILIDAD DE BACKOFFICE
    =
CLASIFICACION ADMINISTRATIVA TRAZABLE
```

La clasificación responde **qué grado de relación tiene la pantalla con la administración y el gobierno interno**. No concede acceso, no asigna roles, no implica autoridad de aprobación y no convierte toda pantalla no operativa en administrativa.

---

#### 2. Dependencias consumidas

- `PROC-SCREEN-001` y la identidad estable `VSCREEN-*`;
- `PROC-SCREEN-002` y las aplicaciones primarias;
- `PROC-SCREEN-003` y los procesos primarios;
- `PROC-SCREEN-004` y los pasos dominantes;
- `PROC-SCREEN-005` y la clasificación operativa;
- `PROC-CAT-001` a `PROC-CAT-020`;
- `PROC-ACTOR-001` a `PROC-ACTOR-010`;
- `UX-BASE-001` a `UX-BASE-015`;
- `UX-ADMIN-001` a `UX-ADMIN-005`;
- los contratos aprobados de autorización, contexto, segregación, ayuda, validación preventiva y vista previa de impacto.

La tarea no utiliza la aplicación, el repositorio ni el rol histórico como sustituto de la intención administrativa.

---

#### 3. Alcance

1. incorporar `administrative_fit` a las 177 pantallas;
2. distinguir trabajo administrativo primario, relevancia administrativa secundaria y ausencia de clase administrativa;
3. definir doce patrones administrativos reutilizables;
4. clasificar cada pantalla mediante objeto, expediente, caso, decisión, responsabilidad y resultado;
5. separar administración de operación, supervisión, configuración, auditoría, autoservicio personal y experiencia de cliente;
6. impedir que una pantalla sea primaria operativa y primaria administrativa a la vez;
7. conservar relevancias secundarias sin diluir la clase primaria;
8. establecer versionado, validaciones y carryovers exactos;
9. dejar preparada la continuidad hacia `PROC-SCREEN-007` a `PROC-SCREEN-011`;
10. mantener una puerta final de exactamente una clase primaria por pantalla.

---

#### 4. Exclusiones

Esta tarea no:

- clasifica formalmente pantallas de supervisión, configuración, auditoría, personales o de cliente;
- convierte dashboards, reportes o historiales en administrativos por defecto;
- considera todo maestro o editor como administración primaria;
- decide actores, roles o segregación;
- define dispositivos, estaciones o periféricos;
- define acciones principales o secundarias;
- diseña condiciones de entrada, salida, vacío, carga, bloqueo o recuperación;
- decide información sensible visible;
- asigna permisos de lectura o acción;
- vincula Server Actions, APIs, RPC, eventos o tablas;
- mapea rutas o componentes legacy;
- activa AURA.

---

#### 5. Definición canónica de pantalla administrativa

Una pantalla tiene relevancia administrativa cuando organiza, conserva, decide o coordina trabajo de backoffice sobre uno o más de estos objetos:

- expedientes y registros;
- casos y solicitudes;
- personas, proveedores, activos o recursos;
- planes, presupuestos y obligaciones;
- aprobaciones, certificaciones y delegaciones;
- políticas, riesgos y cumplimiento;
- conciliaciones y cierres;
- comunicaciones formales y compromisos;
- análisis utilizados para decisión administrativa.

No basta con:

- no ser operativa;
- vivir en VISO, ORIGO o NUMERA;
- mostrar una tabla;
- requerir permiso elevado;
- contener configuración;
- producir un reporte;
- permitir búsqueda o filtros;
- ser utilizada por un gerente.

---

#### 6. Estados de clasificación

| Valor                          | Significado                                                    | Efecto documental                                 |
| ------------------------------ | -------------------------------------------------------------- | ------------------------------------------------- |
| `PRIMARY_ADMINISTRATIVE`       | el trabajo de backoffice es la intención dominante             | reserva `ADMINISTRATIVE` como clase primaria      |
| `SECONDARY_ADMINISTRATIVE`     | existe soporte administrativo, pero otra clase es dominante    | agrega relevancia administrativa secundaria       |
| `OUTSIDE_ADMINISTRATIVE_CLASS` | no existe trabajo administrativo suficiente bajo este contrato | queda disponible para clasificaciones posteriores |

Cada pantalla recibe exactamente uno de estos tres valores.

`SECONDARY_ADMINISTRATIVE` no convierte una pantalla operativa, de supervisión, configuración o auditoría en backoffice principal. Conserva únicamente la responsabilidad administrativa que deberá ser visible en navegación, ayuda, métricas y permisos posteriores.

---

#### 7. Contrato mínimo

| Campo                                   | Obligación                                                           |
| --------------------------------------- | -------------------------------------------------------------------- |
| `screen_id`                             | `VSCREEN-*` canónico                                                 |
| `primary_application_id`                | aplicación aprobada en `PROC-SCREEN-002`                             |
| `primary_process_id`                    | proceso aprobado en `PROC-SCREEN-003`                                |
| `primary_process_step_ref`              | paso aprobado en `PROC-SCREEN-004`                                   |
| `operational_fit`                       | valor aprobado en `PROC-SCREEN-005`                                  |
| `administrative_fit`                    | uno de los tres estados de esta tarea                                |
| `administrative_pattern`                | uno de los doce patrones o `NONE`                                    |
| `administrative_reason`                 | fundamento verificable                                               |
| `administrative_classification_version` | versión semántica                                                    |
| `administrative_classification_status`  | `CANONICAL`, `CHANGE_PROPOSED`, `SUPERSEDED` o `RETIRED_WITH_SCREEN` |
| `administrative_classification_task`    | tarea que aprobó o modificó la decisión                              |

Valores iniciales:

```text
administrative_classification_version: 1.0.0
administrative_classification_status: CANONICAL
administrative_classification_task: PROC-SCREEN-006
decision_record: INITIAL_ADMINISTRATIVE_CLASSIFICATION
```

---

#### 8. SCREEN-ADMINISTRATIVE-PATTERN-VOCABULARY-001

| Patrón                      | Uso                                                             |
| --------------------------- | --------------------------------------------------------------- |
| `ADMIN_QUEUE`               | admite, prioriza o distribuye trabajo administrativo pendiente  |
| `ADMIN_RECORD`              | mantiene expediente, documento o registro canónico              |
| `ADMIN_CASE`                | gestiona un caso desde apertura hasta resolución                |
| `ADMIN_PLANNING`            | planifica recursos, capacidad, obligaciones o trabajo futuro    |
| `ADMIN_REVIEW`              | revisa o evalúa información para decidir                        |
| `ADMIN_APPROVAL`            | aplica aprobación, certificación o autoridad explícita          |
| `ADMIN_COORDINATION`        | coordina participantes, dependencias, compromisos y handoffs    |
| `ADMIN_RECONCILIATION`      | concilia hechos, saldos, obligaciones, periodos o variaciones   |
| `ADMIN_COMPLIANCE`          | gobierna riesgo, política, obligación, evidencia o cumplimiento |
| `ADMIN_RESOURCE_MANAGEMENT` | administra maestros, activos, proveedores, personas o recursos  |
| `ADMIN_COMMUNICATION`       | gobierna comunicación formal, entrega, acuse y seguimiento      |
| `ADMIN_ANALYSIS`            | consolida análisis, escenarios o indicadores para decisión      |
| `NONE`                      | no existe relevancia administrativa bajo esta tarea             |

El patrón no sustituye el proceso, el paso, la acción, el permiso ni la clase primaria final.

---

#### 9. Algoritmo de decisión

Se clasifica `PRIMARY_ADMINISTRATIVE` cuando:

1. existe un expediente, caso, registro, obligación, plan, recurso o decisión administrativa;
2. la pantalla es el espacio propietario para crear, organizar, evaluar, aprobar, coordinar, conciliar o cerrar ese trabajo;
3. el resultado principal es de backoffice y no una mutación física u operativa inmediata;
4. la responsabilidad continúa aunque cambie la ruta o el componente;
5. otra clase especializada no explica mejor la intención dominante.

Se clasifica `SECONDARY_ADMINISTRATIVE` cuando:

1. la pantalla contiene revisión, planificación, conciliación, gobierno, registro o configuración administrativa;
2. su intención primaria es operativa o probablemente corresponde a supervisión, configuración o auditoría;
3. la administración actúa como soporte y no como espacio propietario;
4. eliminar esa capa degrada control, trazabilidad o coordinación, pero no elimina el trabajo principal.

Se clasifica `OUTSIDE_ADMINISTRATIVE_CLASS` cuando predomina:

- ejecución operativa sin carga administrativa material;
- autoservicio personal;
- experiencia de cliente;
- acceso o cuenta transversal;
- consulta simple sin expediente, caso ni decisión;
- una clase especializada sin soporte administrativo relevante.

---

#### 10. SCREEN-ADMINISTRATIVE-CLASSIFICATION-REGISTER-001

| Screen ID      | Pantalla                                              | Aplicación | Paso dominante                                              | Clasificación operativa     | Clasificación administrativa   | Patrón                      | Fundamento                                                                                                                                                                                                                                                     |
| -------------- | ----------------------------------------------------- | ---------- | ----------------------------------------------------------- | --------------------------- | ------------------------------ | --------------------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `VSCREEN-0001` | Hub Vento OS                                          | `shell`    | `VPROC-0059::STEP-ENTER_ECOSYSTEM`                          | `OUTSIDE_OPERATIONAL_CLASS` | `OUTSIDE_ADMINISTRATIVE_CLASS` | `NONE`                      | Superficie transversal de acceso, cuenta o navegación sin expediente, planificación ni decisión administrativa empresarial dominante.                                                                                                                          |
| `VSCREEN-0002` | Inicio de sesión y recuperación                       | `shell`    | `VPROC-0059::STEP-AUTHENTICATE_OR_RECOVER`                  | `OUTSIDE_OPERATIONAL_CLASS` | `OUTSIDE_ADMINISTRATIVE_CLASS` | `NONE`                      | Superficie transversal de acceso, cuenta o navegación sin expediente, planificación ni decisión administrativa empresarial dominante.                                                                                                                          |
| `VSCREEN-0003` | Resolución de contexto y acceso                       | `shell`    | `VPROC-0059::STEP-RESOLVE_EFFECTIVE_CONTEXT`                | `SECONDARY_OPERATIONAL`     | `SECONDARY_ADMINISTRATIVE`     | `ADMIN_REVIEW`              | La pantalla revisa, contrasta o evalúa información para una decisión de backoffice, pero su intención primaria es operativa o corresponde a supervisión, configuración o auditoría. La relevancia administrativa se conserva como secundaria.                  |
| `VSCREEN-0004` | Activación de dispositivo compartido                  | `shell`    | `VPROC-0059::STEP-ACTIVATE_SHARED_DEVICE`                   | `SECONDARY_OPERATIONAL`     | `OUTSIDE_ADMINISTRATIVE_CLASS` | `NONE`                      | Superficie transversal de acceso, cuenta o navegación sin expediente, planificación ni decisión administrativa empresarial dominante.                                                                                                                          |
| `VSCREEN-0005` | Bandeja transversal de tareas y notificaciones        | `shell`    | `VPROC-0004::STEP-TRIAGE_TRANSVERSAL_WORK`                  | `SECONDARY_OPERATIONAL`     | `SECONDARY_ADMINISTRATIVE`     | `ADMIN_QUEUE`               | La pantalla admite, prioriza o distribuye trabajo administrativo pendiente, pero su intención primaria es operativa o corresponde a supervisión, configuración o auditoría. La relevancia administrativa se conserva como secundaria.                          |
| `VSCREEN-0006` | Centro de soporte y diagnóstico                       | `shell`    | `VPROC-0058::STEP-DIAGNOSE_AND_ROUTE_SUPPORT`               | `SECONDARY_OPERATIONAL`     | `SECONDARY_ADMINISTRATIVE`     | `ADMIN_CASE`                | La pantalla gestiona un caso administrativo desde apertura hasta resolución, pero su intención primaria es operativa o corresponde a supervisión, configuración o auditoría. La relevancia administrativa se conserva como secundaria.                         |
| `VSCREEN-0007` | Inicio ejecutivo y gerencial                          | `viso`     | `VPROC-0001::STEP-REVIEW_EXECUTIVE_WORK`                    | `OUTSIDE_OPERATIONAL_CLASS` | `SECONDARY_ADMINISTRATIVE`     | `ADMIN_ANALYSIS`            | La pantalla consolida análisis, escenarios o indicadores para decisión administrativa, pero su intención primaria es operativa o corresponde a supervisión, configuración o auditoría. La relevancia administrativa se conserva como secundaria.               |
| `VSCREEN-0008` | Estructura organizativa                               | `viso`     | `VPROC-0002::STEP-MAINTAIN_ORGANIZATIONAL_STRUCTURE`        | `OUTSIDE_OPERATIONAL_CLASS` | `SECONDARY_ADMINISTRATIVE`     | `ADMIN_RESOURCE_MANAGEMENT` | La pantalla administra maestros, recursos, activos, proveedores o configuraciones de apoyo, pero su intención primaria es operativa o corresponde a supervisión, configuración o auditoría. La relevancia administrativa se conserva como secundaria.          |
| `VSCREEN-0009` | Políticas, delegaciones y límites                     | `viso`     | `VPROC-0003::STEP-AUTHOR_POLICIES_AND_LIMITS`               | `OUTSIDE_OPERATIONAL_CLASS` | `SECONDARY_ADMINISTRATIVE`     | `ADMIN_COMPLIANCE`          | La pantalla gobierna riesgo, política, obligación, evidencia o cumplimiento, pero su intención primaria es operativa o corresponde a supervisión, configuración o auditoría. La relevancia administrativa se conserva como secundaria.                         |
| `VSCREEN-0010` | Compromisos y transferencias internas                 | `viso`     | `VPROC-0004::STEP-TRACK_INTERNAL_COMMITMENTS`               | `SECONDARY_OPERATIONAL`     | `PRIMARY_ADMINISTRATIVE`       | `ADMIN_COORDINATION`        | La intención dominante coordina participantes, dependencias, compromisos y handoffs administrativos y conserva responsabilidad de backoffice sobre un expediente, caso, recurso, obligación o decisión; no ejecuta la mutación operativa material principal.   |
| `VSCREEN-0011` | Embudo de candidatos                                  | `viso`     | `VPROC-0005::STEP-TRIAGE_CANDIDATES`                        | `OUTSIDE_OPERATIONAL_CLASS` | `PRIMARY_ADMINISTRATIVE`       | `ADMIN_QUEUE`               | La intención dominante admite, prioriza o distribuye trabajo administrativo pendiente y conserva responsabilidad de backoffice sobre un expediente, caso, recurso, obligación o decisión; no ejecuta la mutación operativa material principal.                 |
| `VSCREEN-0012` | Caso de selección                                     | `viso`     | `VPROC-0005::STEP-EVALUATE_AND_DECIDE_CANDIDATE`            | `OUTSIDE_OPERATIONAL_CLASS` | `PRIMARY_ADMINISTRATIVE`       | `ADMIN_CASE`                | La intención dominante gestiona un caso administrativo desde apertura hasta resolución y conserva responsabilidad de backoffice sobre un expediente, caso, recurso, obligación o decisión; no ejecuta la mutación operativa material principal.                |
| `VSCREEN-0013` | Vinculación e incorporación                           | `viso`     | `VPROC-0006::STEP-ORCHESTRATE_ONBOARDING`                   | `OUTSIDE_OPERATIONAL_CLASS` | `PRIMARY_ADMINISTRATIVE`       | `ADMIN_COORDINATION`        | La intención dominante coordina participantes, dependencias, compromisos y handoffs administrativos y conserva responsabilidad de backoffice sobre un expediente, caso, recurso, obligación o decisión; no ejecuta la mutación operativa material principal.   |
| `VSCREEN-0014` | Directorio y expediente laboral                       | `viso`     | `VPROC-0006::STEP-MAINTAIN_EMPLOYMENT_RECORD`               | `OUTSIDE_OPERATIONAL_CLASS` | `PRIMARY_ADMINISTRATIVE`       | `ADMIN_RECORD`              | La intención dominante mantiene un expediente, registro o documento administrativo canónico y conserva responsabilidad de backoffice sobre un expediente, caso, recurso, obligación o decisión; no ejecuta la mutación operativa material principal.           |
| `VSCREEN-0015` | Programación laboral                                  | `viso`     | `VPROC-0007::STEP-PLAN_AND_PUBLISH_SCHEDULE`                | `SECONDARY_OPERATIONAL`     | `PRIMARY_ADMINISTRATIVE`       | `ADMIN_PLANNING`            | La intención dominante planifica capacidad, recursos, obligaciones o trabajo futuro y conserva responsabilidad de backoffice sobre un expediente, caso, recurso, obligación o decisión; no ejecuta la mutación operativa material principal.                   |
| `VSCREEN-0016` | Revisión de asistencia                                | `viso`     | `VPROC-0008::STEP-REVIEW_ATTENDANCE_EXCEPTION`              | `SECONDARY_OPERATIONAL`     | `SECONDARY_ADMINISTRATIVE`     | `ADMIN_REVIEW`              | La pantalla revisa, contrasta o evalúa información para una decisión de backoffice, pero su intención primaria es operativa o corresponde a supervisión, configuración o auditoría. La relevancia administrativa se conserva como secundaria.                  |
| `VSCREEN-0017` | Novedades, ausencias y reemplazos                     | `viso`     | `VPROC-0009::STEP-RESOLVE_WORKFORCE_CASE`                   | `SECONDARY_OPERATIONAL`     | `PRIMARY_ADMINISTRATIVE`       | `ADMIN_CASE`                | La intención dominante gestiona un caso administrativo desde apertura hasta resolución y conserva responsabilidad de backoffice sobre un expediente, caso, recurso, obligación o decisión; no ejecuta la mutación operativa material principal.                |
| `VSCREEN-0018` | Retiro y revocación coordinada                        | `viso`     | `VPROC-0011::STEP-CLOSE_EMPLOYMENT_AND_REVOKE`              | `OUTSIDE_OPERATIONAL_CLASS` | `PRIMARY_ADMINISTRATIVE`       | `ADMIN_COORDINATION`        | La intención dominante coordina participantes, dependencias, compromisos y handoffs administrativos y conserva responsabilidad de backoffice sobre un expediente, caso, recurso, obligación o decisión; no ejecuta la mutación operativa material principal.   |
| `VSCREEN-0019` | Catálogo de roles y permisos                          | `viso`     | `VPROC-0059::STEP-MAINTAIN_ACCESS_CATALOG`                  | `OUTSIDE_OPERATIONAL_CLASS` | `SECONDARY_ADMINISTRATIVE`     | `ADMIN_RESOURCE_MANAGEMENT` | La pantalla administra maestros, recursos, activos, proveedores o configuraciones de apoyo, pero su intención primaria es operativa o corresponde a supervisión, configuración o auditoría. La relevancia administrativa se conserva como secundaria.          |
| `VSCREEN-0020` | Perfil de acceso del trabajador                       | `viso`     | `VPROC-0059::STEP-ASSIGN_EFFECTIVE_ACCESS`                  | `OUTSIDE_OPERATIONAL_CLASS` | `PRIMARY_ADMINISTRATIVE`       | `ADMIN_RECORD`              | La intención dominante mantiene un expediente, registro o documento administrativo canónico y conserva responsabilidad de backoffice sobre un expediente, caso, recurso, obligación o decisión; no ejecuta la mutación operativa material principal.           |
| `VSCREEN-0021` | Simulación de permisos y conflictos                   | `viso`     | `VPROC-0059::STEP-SIMULATE_ACCESS_DECISION`                 | `OUTSIDE_OPERATIONAL_CLASS` | `PRIMARY_ADMINISTRATIVE`       | `ADMIN_REVIEW`              | La intención dominante revisa, contrasta o evalúa información para una decisión de backoffice y conserva responsabilidad de backoffice sobre un expediente, caso, recurso, obligación o decisión; no ejecuta la mutación operativa material principal.         |
| `VSCREEN-0022` | Gobierno de dispositivos compartidos                  | `viso`     | `VPROC-0059::STEP-GOVERN_SHARED_DEVICES`                    | `OUTSIDE_OPERATIONAL_CLASS` | `SECONDARY_ADMINISTRATIVE`     | `ADMIN_RESOURCE_MANAGEMENT` | La pantalla administra maestros, recursos, activos, proveedores o configuraciones de apoyo, pero su intención primaria es operativa o corresponde a supervisión, configuración o auditoría. La relevancia administrativa se conserva como secundaria.          |
| `VSCREEN-0023` | Riesgos de seguridad y salud                          | `viso`     | `VPROC-0012::STEP-ASSESS_SST_RISK`                          | `OUTSIDE_OPERATIONAL_CLASS` | `PRIMARY_ADMINISTRATIVE`       | `ADMIN_COMPLIANCE`          | La intención dominante gobierna riesgo, política, obligación, evidencia o cumplimiento y conserva responsabilidad de backoffice sobre un expediente, caso, recurso, obligación o decisión; no ejecuta la mutación operativa material principal.                |
| `VSCREEN-0024` | Incidentes y emergencias                              | `viso`     | `VPROC-0013::STEP-MANAGE_INCIDENT_RESPONSE`                 | `SECONDARY_OPERATIONAL`     | `PRIMARY_ADMINISTRATIVE`       | `ADMIN_CASE`                | La intención dominante gestiona un caso administrativo desde apertura hasta resolución y conserva responsabilidad de backoffice sobre un expediente, caso, recurso, obligación o decisión; no ejecuta la mutación operativa material principal.                |
| `VSCREEN-0025` | Controles de higiene y cumplimiento                   | `viso`     | `VPROC-0014::STEP-REVIEW_HYGIENE_COMPLIANCE`                | `SECONDARY_OPERATIONAL`     | `SECONDARY_ADMINISTRATIVE`     | `ADMIN_COMPLIANCE`          | La pantalla gobierna riesgo, política, obligación, evidencia o cumplimiento, pero su intención primaria es operativa o corresponde a supervisión, configuración o auditoría. La relevancia administrativa se conserva como secundaria.                         |
| `VSCREEN-0026` | Bandeja de casos administrativos transversales        | `viso`     | `VPROC-0004::STEP-TRIAGE_ADMIN_CASES`                       | `SECONDARY_OPERATIONAL`     | `PRIMARY_ADMINISTRATIVE`       | `ADMIN_QUEUE`               | La intención dominante admite, prioriza o distribuye trabajo administrativo pendiente y conserva responsabilidad de backoffice sobre un expediente, caso, recurso, obligación o decisión; no ejecuta la mutación operativa material principal.                 |
| `VSCREEN-0027` | Inicio personal del trabajador                        | `anima`    | `VPROC-0007::STEP-ENTER_PERSONAL_WORKSPACE`                 | `OUTSIDE_OPERATIONAL_CLASS` | `OUTSIDE_ADMINISTRATIVE_CLASS` | `NONE`                      | Experiencia personal del trabajador sin gestión de poblaciones ni backoffice; su clase primaria se resolverá en PROC-SCREEN-010.                                                                                                                               |
| `VSCREEN-0028` | Registro de entrada, pausa y salida                   | `anima`    | `VPROC-0008::STEP-CAPTURE_ATTENDANCE_EVENT`                 | `PRIMARY_OPERATIONAL`       | `OUTSIDE_ADMINISTRATIVE_CLASS` | `NONE`                      | La ejecución operativa ya es la intención primaria y no existe una carga administrativa suficiente para añadir esta clase; gobierno, permisos y auditoría permanecen separados.                                                                                |
| `VSCREEN-0029` | Mi programación                                       | `anima`    | `VPROC-0007::STEP-CONSULT_PUBLISHED_SCHEDULE`               | `SECONDARY_OPERATIONAL`     | `OUTSIDE_ADMINISTRATIVE_CLASS` | `NONE`                      | Experiencia personal del trabajador sin gestión de poblaciones ni backoffice; su clase primaria se resolverá en PROC-SCREEN-010.                                                                                                                               |
| `VSCREEN-0030` | Mi asistencia y solicitud de corrección               | `anima`    | `VPROC-0008::STEP-CONSULT_OR_REQUEST_ATTENDANCE_CORRECTION` | `SECONDARY_OPERATIONAL`     | `OUTSIDE_ADMINISTRATIVE_CLASS` | `NONE`                      | Experiencia personal del trabajador sin gestión de poblaciones ni backoffice; su clase primaria se resolverá en PROC-SCREEN-010.                                                                                                                               |
| `VSCREEN-0031` | Mis novedades, permisos y ausencias                   | `anima`    | `VPROC-0009::STEP-SUBMIT_PERSONAL_WORKFORCE_CASE`           | `SECONDARY_OPERATIONAL`     | `OUTSIDE_ADMINISTRATIVE_CLASS` | `NONE`                      | Experiencia personal del trabajador sin gestión de poblaciones ni backoffice; su clase primaria se resolverá en PROC-SCREEN-010.                                                                                                                               |
| `VSCREEN-0032` | Mi perfil laboral                                     | `anima`    | `VPROC-0006::STEP-MAINTAIN_SELF_SERVICE_PROFILE`            | `OUTSIDE_OPERATIONAL_CLASS` | `OUTSIDE_ADMINISTRATIVE_CLASS` | `NONE`                      | Experiencia personal del trabajador sin gestión de poblaciones ni backoffice; su clase primaria se resolverá en PROC-SCREEN-010.                                                                                                                               |
| `VSCREEN-0033` | Resumen de inventario y abastecimiento interno        | `nexo`     | `VPROC-0028::STEP-MONITOR_INTERNAL_SUPPLY`                  | `SECONDARY_OPERATIONAL`     | `SECONDARY_ADMINISTRATIVE`     | `ADMIN_ANALYSIS`            | La pantalla consolida análisis, escenarios o indicadores para decisión administrativa, pero su intención primaria es operativa o corresponde a supervisión, configuración o auditoría. La relevancia administrativa se conserva como secundaria.               |
| `VSCREEN-0034` | Catálogo de productos físicos                         | `nexo`     | `VPROC-0015::STEP-CONSULT_PHYSICAL_PRODUCT_CATALOG`         | `SECONDARY_OPERATIONAL`     | `SECONDARY_ADMINISTRATIVE`     | `ADMIN_RESOURCE_MANAGEMENT` | La pantalla administra maestros, recursos, activos, proveedores o configuraciones de apoyo, pero su intención primaria es operativa o corresponde a supervisión, configuración o auditoría. La relevancia administrativa se conserva como secundaria.          |
| `VSCREEN-0035` | Editor de producto, unidad y presentación             | `nexo`     | `VPROC-0015::STEP-MAINTAIN_PRODUCT_PRESENTATION`            | `OUTSIDE_OPERATIONAL_CLASS` | `SECONDARY_ADMINISTRATIVE`     | `ADMIN_RESOURCE_MANAGEMENT` | La pantalla administra maestros, recursos, activos, proveedores o configuraciones de apoyo, pero su intención primaria es operativa o corresponde a supervisión, configuración o auditoría. La relevancia administrativa se conserva como secundaria.          |
| `VSCREEN-0036` | Especificaciones y criterios de calidad               | `nexo`     | `VPROC-0018::STEP-MAINTAIN_QUALITY_SPECIFICATION`           | `OUTSIDE_OPERATIONAL_CLASS` | `SECONDARY_ADMINISTRATIVE`     | `ADMIN_COMPLIANCE`          | La pantalla gobierna riesgo, política, obligación, evidencia o cumplimiento, pero su intención primaria es operativa o corresponde a supervisión, configuración o auditoría. La relevancia administrativa se conserva como secundaria.                         |
| `VSCREEN-0037` | Catálogo de ubicaciones                               | `nexo`     | `VPROC-0023::STEP-MAINTAIN_LOCATION_CATALOG`                | `OUTSIDE_OPERATIONAL_CLASS` | `SECONDARY_ADMINISTRATIVE`     | `ADMIN_RESOURCE_MANAGEMENT` | La pantalla administra maestros, recursos, activos, proveedores o configuraciones de apoyo, pero su intención primaria es operativa o corresponde a supervisión, configuración o auditoría. La relevancia administrativa se conserva como secundaria.          |
| `VSCREEN-0038` | Identificación y detalle de ubicación                 | `nexo`     | `VPROC-0023::STEP-IDENTIFY_LOCATION_AND_CONTENT`            | `PRIMARY_OPERATIONAL`       | `OUTSIDE_ADMINISTRATIVE_CLASS` | `NONE`                      | No cumple los criterios de backoffice, coordinación, expediente, aprobación, planificación, cumplimiento o conciliación definidos para esta clase.                                                                                                             |
| `VSCREEN-0039` | Consulta de existencias                               | `nexo`     | `VPROC-0024::STEP-CONSULT_STOCK_POSITION`                   | `SECONDARY_OPERATIONAL`     | `OUTSIDE_ADMINISTRATIVE_CLASS` | `NONE`                      | No cumple los criterios de backoffice, coordinación, expediente, aprobación, planificación, cumplimiento o conciliación definidos para esta clase.                                                                                                             |
| `VSCREEN-0040` | Conteo de inventario                                  | `nexo`     | `VPROC-0026::STEP-CAPTURE_PHYSICAL_COUNT`                   | `PRIMARY_OPERATIONAL`       | `OUTSIDE_ADMINISTRATIVE_CLASS` | `NONE`                      | La ejecución operativa ya es la intención primaria y no existe una carga administrativa suficiente para añadir esta clase; gobierno, permisos y auditoría permanecen separados.                                                                                |
| `VSCREEN-0041` | Revisión de conteo y diferencias                      | `nexo`     | `VPROC-0026::STEP-REVIEW_COUNT_VARIANCE`                    | `PRIMARY_OPERATIONAL`       | `SECONDARY_ADMINISTRATIVE`     | `ADMIN_REVIEW`              | La pantalla revisa, contrasta o evalúa información para una decisión de backoffice, pero su intención primaria es operativa o corresponde a supervisión, configuración o auditoría. La relevancia administrativa se conserva como secundaria.                  |
| `VSCREEN-0042` | Caso de ajuste de inventario                          | `nexo`     | `VPROC-0026::STEP-DECIDE_INVENTORY_ADJUSTMENT`              | `PRIMARY_OPERATIONAL`       | `SECONDARY_ADMINISTRATIVE`     | `ADMIN_APPROVAL`            | La pantalla aplica aprobación, certificación o autoridad administrativa explícita, pero su intención primaria es operativa o corresponde a supervisión, configuración o auditoría. La relevancia administrativa se conserva como secundaria.                   |
| `VSCREEN-0043` | Confirmación de entrada a inventario                  | `nexo`     | `VPROC-0024::STEP-CONFIRM_STOCK_ENTRY`                      | `PRIMARY_OPERATIONAL`       | `OUTSIDE_ADMINISTRATIVE_CLASS` | `NONE`                      | La ejecución operativa ya es la intención primaria y no existe una carga administrativa suficiente para añadir esta clase; gobierno, permisos y auditoría permanecen separados.                                                                                |
| `VSCREEN-0044` | Retiro y consumo de existencias                       | `nexo`     | `VPROC-0025::STEP-EXECUTE_STOCK_WITHDRAWAL`                 | `PRIMARY_OPERATIONAL`       | `OUTSIDE_ADMINISTRATIVE_CLASS` | `NONE`                      | La ejecución operativa ya es la intención primaria y no existe una carga administrativa suficiente para añadir esta clase; gobierno, permisos y auditoría permanecen separados.                                                                                |
| `VSCREEN-0045` | Traslado interno de existencias                       | `nexo`     | `VPROC-0025::STEP-EXECUTE_INTERNAL_TRANSFER`                | `PRIMARY_OPERATIONAL`       | `OUTSIDE_ADMINISTRATIVE_CLASS` | `NONE`                      | La ejecución operativa ya es la intención primaria y no existe una carga administrativa suficiente para añadir esta clase; gobierno, permisos y auditoría permanecen separados.                                                                                |
| `VSCREEN-0046` | Solicitud de remisión                                 | `nexo`     | `VPROC-0028::STEP-SUBMIT_REPLENISHMENT_REQUEST`             | `PRIMARY_OPERATIONAL`       | `OUTSIDE_ADMINISTRATIVE_CLASS` | `NONE`                      | La ejecución operativa ya es la intención primaria y no existe una carga administrativa suficiente para añadir esta clase; gobierno, permisos y auditoría permanecen separados.                                                                                |
| `VSCREEN-0047` | Preparación de remisión                               | `nexo`     | `VPROC-0028::STEP-PREPARE_REPLENISHMENT`                    | `PRIMARY_OPERATIONAL`       | `OUTSIDE_ADMINISTRATIVE_CLASS` | `NONE`                      | La ejecución operativa ya es la intención primaria y no existe una carga administrativa suficiente para añadir esta clase; gobierno, permisos y auditoría permanecen separados.                                                                                |
| `VSCREEN-0048` | Carga y despacho de remisión                          | `nexo`     | `VPROC-0028::STEP-LOAD_AND_DISPATCH_REPLENISHMENT`          | `PRIMARY_OPERATIONAL`       | `OUTSIDE_ADMINISTRATIVE_CLASS` | `NONE`                      | La ejecución operativa ya es la intención primaria y no existe una carga administrativa suficiente para añadir esta clase; gobierno, permisos y auditoría permanecen separados.                                                                                |
| `VSCREEN-0049` | Seguimiento de remisión en tránsito                   | `nexo`     | `VPROC-0028::STEP-MONITOR_REPLENISHMENT_TRANSIT`            | `PRIMARY_OPERATIONAL`       | `OUTSIDE_ADMINISTRATIVE_CLASS` | `NONE`                      | La ejecución operativa ya es la intención primaria y no existe una carga administrativa suficiente para añadir esta clase; gobierno, permisos y auditoría permanecen separados.                                                                                |
| `VSCREEN-0050` | Recepción de remisión                                 | `nexo`     | `VPROC-0028::STEP-RECEIVE_REPLENISHMENT`                    | `PRIMARY_OPERATIONAL`       | `OUTSIDE_ADMINISTRATIVE_CLASS` | `NONE`                      | La ejecución operativa ya es la intención primaria y no existe una carga administrativa suficiente para añadir esta clase; gobierno, permisos y auditoría permanecen separados.                                                                                |
| `VSCREEN-0051` | Vencimiento, cuarentena, daño y merma                 | `nexo`     | `VPROC-0027::STEP-RESOLVE_STOCK_CONDITION`                  | `PRIMARY_OPERATIONAL`       | `SECONDARY_ADMINISTRATIVE`     | `ADMIN_COMPLIANCE`          | La pantalla gobierna riesgo, política, obligación, evidencia o cumplimiento, pero su intención primaria es operativa o corresponde a supervisión, configuración o auditoría. La relevancia administrativa se conserva como secundaria.                         |
| `VSCREEN-0052` | LPN, contenedores y reutilizables                     | `nexo`     | `VPROC-0032::STEP-MANAGE_LPN_AND_REUSABLES`                 | `PRIMARY_OPERATIONAL`       | `OUTSIDE_ADMINISTRATIVE_CLASS` | `NONE`                      | La ejecución operativa ya es la intención primaria y no existe una carga administrativa suficiente para añadir esta clase; gobierno, permisos y auditoría permanecen separados.                                                                                |
| `VSCREEN-0053` | Activos y custodia                                    | `nexo`     | `VPROC-0029::STEP-MANAGE_ASSET_CUSTODY`                     | `PRIMARY_OPERATIONAL`       | `SECONDARY_ADMINISTRATIVE`     | `ADMIN_RESOURCE_MANAGEMENT` | La pantalla administra maestros, recursos, activos, proveedores o configuraciones de apoyo, pero su intención primaria es operativa o corresponde a supervisión, configuración o auditoría. La relevancia administrativa se conserva como secundaria.          |
| `VSCREEN-0054` | Etiquetas e impresión logística                       | `nexo`     | `VPROC-0024::STEP-ISSUE_LOGISTICS_LABEL`                    | `PRIMARY_OPERATIONAL`       | `OUTSIDE_ADMINISTRATIVE_CLASS` | `NONE`                      | La ejecución operativa ya es la intención primaria y no existe una carga administrativa suficiente para añadir esta clase; gobierno, permisos y auditoría permanecen separados.                                                                                |
| `VSCREEN-0055` | Inicio y cola de producción                           | `fogo`     | `VPROC-0033::STEP-TRIAGE_PRODUCTION_QUEUE`                  | `SECONDARY_OPERATIONAL`     | `SECONDARY_ADMINISTRATIVE`     | `ADMIN_QUEUE`               | La pantalla admite, prioriza o distribuye trabajo administrativo pendiente, pero su intención primaria es operativa o corresponde a supervisión, configuración o auditoría. La relevancia administrativa se conserva como secundaria.                          |
| `VSCREEN-0056` | Planeación de producción                              | `fogo`     | `VPROC-0033::STEP-PLAN_PRODUCTION`                          | `SECONDARY_OPERATIONAL`     | `SECONDARY_ADMINISTRATIVE`     | `ADMIN_PLANNING`            | La pantalla planifica capacidad, recursos, obligaciones o trabajo futuro, pero su intención primaria es operativa o corresponde a supervisión, configuración o auditoría. La relevancia administrativa se conserva como secundaria.                            |
| `VSCREEN-0057` | Preparación e inicio de lote                          | `fogo`     | `VPROC-0034::STEP-PREPARE_AND_START_BATCH`                  | `PRIMARY_OPERATIONAL`       | `OUTSIDE_ADMINISTRATIVE_CLASS` | `NONE`                      | La ejecución operativa ya es la intención primaria y no existe una carga administrativa suficiente para añadir esta clase; gobierno, permisos y auditoría permanecen separados.                                                                                |
| `VSCREEN-0058` | Ejecución de lote                                     | `fogo`     | `VPROC-0034::STEP-EXECUTE_BATCH`                            | `PRIMARY_OPERATIONAL`       | `OUTSIDE_ADMINISTRATIVE_CLASS` | `NONE`                      | La ejecución operativa ya es la intención primaria y no existe una carga administrativa suficiente para añadir esta clase; gobierno, permisos y auditoría permanecen separados.                                                                                |
| `VSCREEN-0059` | Registro parcial de producción                        | `fogo`     | `VPROC-0034::STEP-CAPTURE_BATCH_PROGRESS`                   | `PRIMARY_OPERATIONAL`       | `OUTSIDE_ADMINISTRATIVE_CLASS` | `NONE`                      | La ejecución operativa ya es la intención primaria y no existe una carga administrativa suficiente para añadir esta clase; gobierno, permisos y auditoría permanecen separados.                                                                                |
| `VSCREEN-0060` | Finalización y cierre de lote                         | `fogo`     | `VPROC-0037::STEP-CLOSE_BATCH`                              | `PRIMARY_OPERATIONAL`       | `OUTSIDE_ADMINISTRATIVE_CLASS` | `NONE`                      | La ejecución operativa ya es la intención primaria y no existe una carga administrativa suficiente para añadir esta clase; gobierno, permisos y auditoría permanecen separados.                                                                                |
| `VSCREEN-0061` | Receta operativa                                      | `fogo`     | `VPROC-0016::STEP-CONSULT_APPLICABLE_RECIPE`                | `PRIMARY_OPERATIONAL`       | `OUTSIDE_ADMINISTRATIVE_CLASS` | `NONE`                      | No cumple los criterios de backoffice, coordinación, expediente, aprobación, planificación, cumplimiento o conciliación definidos para esta clase.                                                                                                             |
| `VSCREEN-0062` | Catálogo y editor de recetas                          | `fogo`     | `VPROC-0016::STEP-AUTHOR_RECIPE`                            | `OUTSIDE_OPERATIONAL_CLASS` | `SECONDARY_ADMINISTRATIVE`     | `ADMIN_RESOURCE_MANAGEMENT` | La pantalla administra maestros, recursos, activos, proveedores o configuraciones de apoyo, pero su intención primaria es operativa o corresponde a supervisión, configuración o auditoría. La relevancia administrativa se conserva como secundaria.          |
| `VSCREEN-0063` | Revisión, aprobación y publicación de receta          | `fogo`     | `VPROC-0016::STEP-APPROVE_AND_PUBLISH_RECIPE`               | `OUTSIDE_OPERATIONAL_CLASS` | `SECONDARY_ADMINISTRATIVE`     | `ADMIN_APPROVAL`            | La pantalla aplica aprobación, certificación o autoridad administrativa explícita, pero su intención primaria es operativa o corresponde a supervisión, configuración o auditoría. La relevancia administrativa se conserva como secundaria.                   |
| `VSCREEN-0064` | Prueba de receta y rendimiento                        | `fogo`     | `VPROC-0016::STEP-TEST_RECIPE_AND_YIELD`                    | `PRIMARY_OPERATIONAL`       | `SECONDARY_ADMINISTRATIVE`     | `ADMIN_REVIEW`              | La pantalla revisa, contrasta o evalúa información para una decisión de backoffice, pero su intención primaria es operativa o corresponde a supervisión, configuración o auditoría. La relevancia administrativa se conserva como secundaria.                  |
| `VSCREEN-0065` | Control de calidad y liberación                       | `fogo`     | `VPROC-0035::STEP-DECIDE_QUALITY_RELEASE`                   | `PRIMARY_OPERATIONAL`       | `SECONDARY_ADMINISTRATIVE`     | `ADMIN_APPROVAL`            | La pantalla aplica aprobación, certificación o autoridad administrativa explícita, pero su intención primaria es operativa o corresponde a supervisión, configuración o auditoría. La relevancia administrativa se conserva como secundaria.                   |
| `VSCREEN-0066` | Empaque, etiquetado y almacenamiento de terminado     | `fogo`     | `VPROC-0036::STEP-PACK_AND_TRANSFER_FINISHED_GOOD`          | `PRIMARY_OPERATIONAL`       | `OUTSIDE_ADMINISTRATIVE_CLASS` | `NONE`                      | La ejecución operativa ya es la intención primaria y no existe una carga administrativa suficiente para añadir esta clase; gobierno, permisos y auditoría permanecen separados.                                                                                |
| `VSCREEN-0067` | Reproceso, aprovechamiento, merma y cierre productivo | `fogo`     | `VPROC-0037::STEP-RESOLVE_PRODUCTION_DISPOSITION`           | `PRIMARY_OPERATIONAL`       | `SECONDARY_ADMINISTRATIVE`     | `ADMIN_RECONCILIATION`      | La pantalla concilia hechos, obligaciones, saldos, periodos o variaciones, pero su intención primaria es operativa o corresponde a supervisión, configuración o auditoría. La relevancia administrativa se conserva como secundaria.                           |
| `VSCREEN-0068` | Bandeja de necesidades de compra                      | `origo`    | `VPROC-0019::STEP-TRIAGE_PURCHASE_NEEDS`                    | `SECONDARY_OPERATIONAL`     | `PRIMARY_ADMINISTRATIVE`       | `ADMIN_QUEUE`               | La intención dominante admite, prioriza o distribuye trabajo administrativo pendiente y conserva responsabilidad de backoffice sobre un expediente, caso, recurso, obligación o decisión; no ejecuta la mutación operativa material principal.                 |
| `VSCREEN-0069` | Solicitud de compra                                   | `origo`    | `VPROC-0019::STEP-SUBMIT_PURCHASE_REQUEST`                  | `OUTSIDE_OPERATIONAL_CLASS` | `PRIMARY_ADMINISTRATIVE`       | `ADMIN_RECORD`              | La intención dominante mantiene un expediente, registro o documento administrativo canónico y conserva responsabilidad de backoffice sobre un expediente, caso, recurso, obligación o decisión; no ejecuta la mutación operativa material principal.           |
| `VSCREEN-0070` | Catálogo de proveedores                               | `origo`    | `VPROC-0020::STEP-CONSULT_SUPPLIER_CATALOG`                 | `OUTSIDE_OPERATIONAL_CLASS` | `SECONDARY_ADMINISTRATIVE`     | `ADMIN_RESOURCE_MANAGEMENT` | La pantalla administra maestros, recursos, activos, proveedores o configuraciones de apoyo, pero su intención primaria es operativa o corresponde a supervisión, configuración o auditoría. La relevancia administrativa se conserva como secundaria.          |
| `VSCREEN-0071` | Alta y expediente de proveedor                        | `origo`    | `VPROC-0020::STEP-ONBOARD_SUPPLIER`                         | `OUTSIDE_OPERATIONAL_CLASS` | `PRIMARY_ADMINISTRATIVE`       | `ADMIN_RECORD`              | La intención dominante mantiene un expediente, registro o documento administrativo canónico y conserva responsabilidad de backoffice sobre un expediente, caso, recurso, obligación o decisión; no ejecuta la mutación operativa material principal.           |
| `VSCREEN-0072` | Comparación de cotizaciones                           | `origo`    | `VPROC-0020::STEP-COMPARE_QUOTES`                           | `OUTSIDE_OPERATIONAL_CLASS` | `PRIMARY_ADMINISTRATIVE`       | `ADMIN_REVIEW`              | La intención dominante revisa, contrasta o evalúa información para una decisión de backoffice y conserva responsabilidad de backoffice sobre un expediente, caso, recurso, obligación o decisión; no ejecuta la mutación operativa material principal.         |
| `VSCREEN-0073` | Editor de orden de compra                             | `origo`    | `VPROC-0021::STEP-PREPARE_PURCHASE_ORDER`                   | `OUTSIDE_OPERATIONAL_CLASS` | `PRIMARY_ADMINISTRATIVE`       | `ADMIN_RECORD`              | La intención dominante mantiene un expediente, registro o documento administrativo canónico y conserva responsabilidad de backoffice sobre un expediente, caso, recurso, obligación o decisión; no ejecuta la mutación operativa material principal.           |
| `VSCREEN-0074` | Bandeja de aprobaciones de compra                     | `origo`    | `VPROC-0021::STEP-APPROVE_PURCHASE`                         | `OUTSIDE_OPERATIONAL_CLASS` | `PRIMARY_ADMINISTRATIVE`       | `ADMIN_APPROVAL`            | La intención dominante aplica aprobación, certificación o autoridad administrativa explícita y conserva responsabilidad de backoffice sobre un expediente, caso, recurso, obligación o decisión; no ejecuta la mutación operativa material principal.          |
| `VSCREEN-0075` | Detalle y seguimiento de orden                        | `origo`    | `VPROC-0021::STEP-MONITOR_PURCHASE_ORDER`                   | `SECONDARY_OPERATIONAL`     | `PRIMARY_ADMINISTRATIVE`       | `ADMIN_COORDINATION`        | La intención dominante coordina participantes, dependencias, compromisos y handoffs administrativos y conserva responsabilidad de backoffice sobre un expediente, caso, recurso, obligación o decisión; no ejecuta la mutación operativa material principal.   |
| `VSCREEN-0076` | Cola de recepciones                                   | `origo`    | `VPROC-0022::STEP-TRIAGE_RECEIPT_QUEUE`                     | `SECONDARY_OPERATIONAL`     | `SECONDARY_ADMINISTRATIVE`     | `ADMIN_QUEUE`               | La pantalla admite, prioriza o distribuye trabajo administrativo pendiente, pero su intención primaria es operativa o corresponde a supervisión, configuración o auditoría. La relevancia administrativa se conserva como secundaria.                          |
| `VSCREEN-0077` | Recepción total o parcial                             | `origo`    | `VPROC-0022::STEP-RECEIVE_PURCHASE`                         | `PRIMARY_OPERATIONAL`       | `SECONDARY_ADMINISTRATIVE`     | `ADMIN_RECORD`              | La pantalla mantiene un expediente, registro o documento administrativo canónico, pero su intención primaria es operativa o corresponde a supervisión, configuración o auditoría. La relevancia administrativa se conserva como secundaria.                    |
| `VSCREEN-0078` | Resolución de diferencias de recepción                | `origo`    | `VPROC-0022::STEP-RESOLVE_RECEIPT_VARIANCE`                 | `PRIMARY_OPERATIONAL`       | `SECONDARY_ADMINISTRATIVE`     | `ADMIN_CASE`                | La pantalla gestiona un caso administrativo desde apertura hasta resolución, pero su intención primaria es operativa o corresponde a supervisión, configuración o auditoría. La relevancia administrativa se conserva como secundaria.                         |
| `VSCREEN-0079` | Historial y auditoría de abastecimiento               | `origo`    | `VPROC-0022::STEP-AUDIT_PROCUREMENT_CYCLE`                  | `OUTSIDE_OPERATIONAL_CLASS` | `SECONDARY_ADMINISTRATIVE`     | `ADMIN_REVIEW`              | La pantalla revisa, contrasta o evalúa información para una decisión de backoffice, pero su intención primaria es operativa o corresponde a supervisión, configuración o auditoría. La relevancia administrativa se conserva como secundaria.                  |
| `VSCREEN-0080` | Inicio POS                                            | `pulso`    | `VPROC-0039::STEP-ENTER_POS_WORKSPACE`                      | `PRIMARY_OPERATIONAL`       | `OUTSIDE_ADMINISTRATIVE_CLASS` | `NONE`                      | No cumple los criterios de backoffice, coordinación, expediente, aprobación, planificación, cumplimiento o conciliación definidos para esta clase.                                                                                                             |
| `VSCREEN-0081` | Creación de venta o pedido                            | `pulso`    | `VPROC-0039::STEP-CREATE_SALE_OR_ORDER`                     | `PRIMARY_OPERATIONAL`       | `OUTSIDE_ADMINISTRATIVE_CLASS` | `NONE`                      | La ejecución operativa ya es la intención primaria y no existe una carga administrativa suficiente para añadir esta clase; gobierno, permisos y auditoría permanecen separados.                                                                                |
| `VSCREEN-0082` | Mapa de salón y mesas                                 | `pulso`    | `VPROC-0038::STEP-MANAGE_TABLE_SERVICE`                     | `PRIMARY_OPERATIONAL`       | `OUTSIDE_ADMINISTRATIVE_CLASS` | `NONE`                      | La ejecución operativa ya es la intención primaria y no existe una carga administrativa suficiente para añadir esta clase; gobierno, permisos y auditoría permanecen separados.                                                                                |
| `VSCREEN-0083` | Detalle y modificación de pedido                      | `pulso`    | `VPROC-0038::STEP-MODIFY_ACTIVE_ORDER`                      | `PRIMARY_OPERATIONAL`       | `OUTSIDE_ADMINISTRATIVE_CLASS` | `NONE`                      | La ejecución operativa ya es la intención primaria y no existe una carga administrativa suficiente para añadir esta clase; gobierno, permisos y auditoría permanecen separados.                                                                                |
| `VSCREEN-0084` | Cobro y medios de pago                                | `pulso`    | `VPROC-0043::STEP-COLLECT_PAYMENT`                          | `PRIMARY_OPERATIONAL`       | `OUTSIDE_ADMINISTRATIVE_CLASS` | `NONE`                      | La ejecución operativa ya es la intención primaria y no existe una carga administrativa suficiente para añadir esta clase; gobierno, permisos y auditoría permanecen separados.                                                                                |
| `VSCREEN-0085` | Identificación de cliente y acumulación               | `pulso`    | `VPROC-0045::STEP-IDENTIFY_CUSTOMER_AND_ACCRUE`             | `PRIMARY_OPERATIONAL`       | `OUTSIDE_ADMINISTRATIVE_CLASS` | `NONE`                      | La ejecución operativa ya es la intención primaria y no existe una carga administrativa suficiente para añadir esta clase; gobierno, permisos y auditoría permanecen separados.                                                                                |
| `VSCREEN-0086` | Redención de puntos o beneficios                      | `pulso`    | `VPROC-0045::STEP-REDEEM_LOYALTY_VALUE`                     | `PRIMARY_OPERATIONAL`       | `OUTSIDE_ADMINISTRATIVE_CLASS` | `NONE`                      | La ejecución operativa ya es la intención primaria y no existe una carga administrativa suficiente para añadir esta clase; gobierno, permisos y auditoría permanecen separados.                                                                                |
| `VSCREEN-0087` | Bandeja de pedidos de canales externos                | `pulso`    | `VPROC-0040::STEP-ADMIT_EXTERNAL_ORDER`                     | `PRIMARY_OPERATIONAL`       | `OUTSIDE_ADMINISTRATIVE_CLASS` | `NONE`                      | La ejecución operativa ya es la intención primaria y no existe una carga administrativa suficiente para añadir esta clase; gobierno, permisos y auditoría permanecen separados.                                                                                |
| `VSCREEN-0088` | Seguimiento de preparación y entrega                  | `pulso`    | `VPROC-0039::STEP-MONITOR_ORDER_FULFILLMENT`                | `PRIMARY_OPERATIONAL`       | `OUTSIDE_ADMINISTRATIVE_CLASS` | `NONE`                      | La ejecución operativa ya es la intención primaria y no existe una carga administrativa suficiente para añadir esta clase; gobierno, permisos y auditoría permanecen separados.                                                                                |
| `VSCREEN-0089` | Apertura de caja                                      | `pulso`    | `VPROC-0044::STEP-OPEN_CASH_SESSION`                        | `PRIMARY_OPERATIONAL`       | `OUTSIDE_ADMINISTRATIVE_CLASS` | `NONE`                      | La ejecución operativa ya es la intención primaria y no existe una carga administrativa suficiente para añadir esta clase; gobierno, permisos y auditoría permanecen separados.                                                                                |
| `VSCREEN-0090` | Cierre de caja                                        | `pulso`    | `VPROC-0044::STEP-CLOSE_CASH_SESSION`                       | `PRIMARY_OPERATIONAL`       | `SECONDARY_ADMINISTRATIVE`     | `ADMIN_RECONCILIATION`      | La pantalla concilia hechos, obligaciones, saldos, periodos o variaciones, pero su intención primaria es operativa o corresponde a supervisión, configuración o auditoría. La relevancia administrativa se conserva como secundaria.                           |
| `VSCREEN-0091` | Anulación, devolución y reembolso                     | `pulso`    | `VPROC-0042::STEP-RESOLVE_REVERSAL_OR_REFUND`               | `PRIMARY_OPERATIONAL`       | `SECONDARY_ADMINISTRATIVE`     | `ADMIN_CASE`                | La pantalla gestiona un caso administrativo desde apertura hasta resolución, pero su intención primaria es operativa o corresponde a supervisión, configuración o auditoría. La relevancia administrativa se conserva como secundaria.                         |
| `VSCREEN-0092` | Oferta, menú, precio comercial y disponibilidad       | `pulso`    | `VPROC-0017::STEP-PUBLISH_COMMERCIAL_OFFER`                 | `OUTSIDE_OPERATIONAL_CLASS` | `SECONDARY_ADMINISTRATIVE`     | `ADMIN_RESOURCE_MANAGEMENT` | La pantalla administra maestros, recursos, activos, proveedores o configuraciones de apoyo, pero su intención primaria es operativa o corresponde a supervisión, configuración o auditoría. La relevancia administrativa se conserva como secundaria.          |
| `VSCREEN-0093` | Revisión de ventas, caja y terminales                 | `pulso`    | `VPROC-0044::STEP-REVIEW_SALES_AND_TERMINALS`               | `SECONDARY_OPERATIONAL`     | `SECONDARY_ADMINISTRATIVE`     | `ADMIN_REVIEW`              | La pantalla revisa, contrasta o evalúa información para una decisión de backoffice, pero su intención primaria es operativa o corresponde a supervisión, configuración o auditoría. La relevancia administrativa se conserva como secundaria.                  |
| `VSCREEN-0094` | Inicio financiero y ejecutivo                         | `numera`   | `VPROC-0061::STEP-REVIEW_FINANCIAL_POSITION`                | `OUTSIDE_OPERATIONAL_CLASS` | `SECONDARY_ADMINISTRATIVE`     | `ADMIN_ANALYSIS`            | La pantalla consolida análisis, escenarios o indicadores para decisión administrativa, pero su intención primaria es operativa o corresponde a supervisión, configuración o auditoría. La relevancia administrativa se conserva como secundaria.               |
| `VSCREEN-0095` | Bandeja de hechos económicos                          | `numera`   | `VPROC-0051::STEP-TRIAGE_ECONOMIC_FACTS`                    | `OUTSIDE_OPERATIONAL_CLASS` | `PRIMARY_ADMINISTRATIVE`       | `ADMIN_QUEUE`               | La intención dominante admite, prioriza o distribuye trabajo administrativo pendiente y conserva responsabilidad de backoffice sobre un expediente, caso, recurso, obligación o decisión; no ejecuta la mutación operativa material principal.                 |
| `VSCREEN-0096` | Registro de gasto y soporte                           | `numera`   | `VPROC-0051::STEP-CAPTURE_EXPENSE_AND_EVIDENCE`             | `OUTSIDE_OPERATIONAL_CLASS` | `PRIMARY_ADMINISTRATIVE`       | `ADMIN_RECORD`              | La intención dominante mantiene un expediente, registro o documento administrativo canónico y conserva responsabilidad de backoffice sobre un expediente, caso, recurso, obligación o decisión; no ejecuta la mutación operativa material principal.           |
| `VSCREEN-0097` | Bandeja de aprobaciones financieras                   | `numera`   | `VPROC-0052::STEP-APPROVE_FINANCIAL_DECISION`               | `OUTSIDE_OPERATIONAL_CLASS` | `PRIMARY_ADMINISTRATIVE`       | `ADMIN_APPROVAL`            | La intención dominante aplica aprobación, certificación o autoridad administrativa explícita y conserva responsabilidad de backoffice sobre un expediente, caso, recurso, obligación o decisión; no ejecuta la mutación operativa material principal.          |
| `VSCREEN-0098` | Cuentas por pagar y obligaciones                      | `numera`   | `VPROC-0052::STEP-MANAGE_PAYABLE_OBLIGATION`                | `OUTSIDE_OPERATIONAL_CLASS` | `PRIMARY_ADMINISTRATIVE`       | `ADMIN_CASE`                | La intención dominante gestiona un caso administrativo desde apertura hasta resolución y conserva responsabilidad de backoffice sobre un expediente, caso, recurso, obligación o decisión; no ejecuta la mutación operativa material principal.                |
| `VSCREEN-0099` | Cuentas por cobrar y cartera                          | `numera`   | `VPROC-0053::STEP-MANAGE_RECEIVABLE`                        | `OUTSIDE_OPERATIONAL_CLASS` | `PRIMARY_ADMINISTRATIVE`       | `ADMIN_CASE`                | La intención dominante gestiona un caso administrativo desde apertura hasta resolución y conserva responsabilidad de backoffice sobre un expediente, caso, recurso, obligación o decisión; no ejecuta la mutación operativa material principal.                |
| `VSCREEN-0100` | Caja, bancos y movimientos financieros                | `numera`   | `VPROC-0052::STEP-EXECUTE_TREASURY_MOVEMENT`                | `OUTSIDE_OPERATIONAL_CLASS` | `PRIMARY_ADMINISTRATIVE`       | `ADMIN_RECORD`              | La intención dominante mantiene un expediente, registro o documento administrativo canónico y conserva responsabilidad de backoffice sobre un expediente, caso, recurso, obligación o decisión; no ejecuta la mutación operativa material principal.           |
| `VSCREEN-0101` | Conciliación de ventas y pagos                        | `numera`   | `VPROC-0051::STEP-RECONCILE_SALES_AND_PAYMENTS`             | `OUTSIDE_OPERATIONAL_CLASS` | `PRIMARY_ADMINISTRATIVE`       | `ADMIN_RECONCILIATION`      | La intención dominante concilia hechos, obligaciones, saldos, periodos o variaciones y conserva responsabilidad de backoffice sobre un expediente, caso, recurso, obligación o decisión; no ejecuta la mutación operativa material principal.                  |
| `VSCREEN-0102` | Conciliación de compras y recepciones                 | `numera`   | `VPROC-0051::STEP-RECONCILE_PURCHASES_AND_RECEIPTS`         | `OUTSIDE_OPERATIONAL_CLASS` | `PRIMARY_ADMINISTRATIVE`       | `ADMIN_RECONCILIATION`      | La intención dominante concilia hechos, obligaciones, saldos, periodos o variaciones y conserva responsabilidad de backoffice sobre un expediente, caso, recurso, obligación o decisión; no ejecuta la mutación operativa material principal.                  |
| `VSCREEN-0103` | Conciliación de inventario, producción y variaciones  | `numera`   | `VPROC-0054::STEP-RECONCILE_OPERATING_VARIANCES`            | `OUTSIDE_OPERATIONAL_CLASS` | `PRIMARY_ADMINISTRATIVE`       | `ADMIN_RECONCILIATION`      | La intención dominante concilia hechos, obligaciones, saldos, periodos o variaciones y conserva responsabilidad de backoffice sobre un expediente, caso, recurso, obligación o decisión; no ejecuta la mutación operativa material principal.                  |
| `VSCREEN-0104` | Costos, rentabilidad y escenarios                     | `numera`   | `VPROC-0054::STEP-ANALYZE_COST_AND_PROFITABILITY`           | `OUTSIDE_OPERATIONAL_CLASS` | `PRIMARY_ADMINISTRATIVE`       | `ADMIN_ANALYSIS`            | La intención dominante consolida análisis, escenarios o indicadores para decisión administrativa y conserva responsabilidad de backoffice sobre un expediente, caso, recurso, obligación o decisión; no ejecuta la mutación operativa material principal.      |
| `VSCREEN-0105` | Cierre, reapertura y corrección de periodo            | `numera`   | `VPROC-0054::STEP-CLOSE_OR_REOPEN_PERIOD`                   | `OUTSIDE_OPERATIONAL_CLASS` | `PRIMARY_ADMINISTRATIVE`       | `ADMIN_RECONCILIATION`      | La intención dominante concilia hechos, obligaciones, saldos, periodos o variaciones y conserva responsabilidad de backoffice sobre un expediente, caso, recurso, obligación o decisión; no ejecuta la mutación operativa material principal.                  |
| `VSCREEN-0106` | Reportes y exportaciones financieras                  | `numera`   | `VPROC-0061::STEP-PUBLISH_FINANCIAL_REPORT`                 | `OUTSIDE_OPERATIONAL_CLASS` | `SECONDARY_ADMINISTRATIVE`     | `ADMIN_ANALYSIS`            | La pantalla consolida análisis, escenarios o indicadores para decisión administrativa, pero su intención primaria es operativa o corresponde a supervisión, configuración o auditoría. La relevancia administrativa se conserva como secundaria.               |
| `VSCREEN-0107` | Inicio del cliente y resumen de beneficios            | `pass`     | `VPROC-0045::STEP-ENTER_LOYALTY_HOME`                       | `OUTSIDE_OPERATIONAL_CLASS` | `OUTSIDE_ADMINISTRATIVE_CLASS` | `NONE`                      | Canal de cliente sin trabajo administrativo interno dominante; su clase primaria se resolverá en PROC-SCREEN-011.                                                                                                                                              |
| `VSCREEN-0108` | QR personal de identificación                         | `pass`     | `VPROC-0045::STEP-PRESENT_CUSTOMER_ID`                      | `OUTSIDE_OPERATIONAL_CLASS` | `OUTSIDE_ADMINISTRATIVE_CLASS` | `NONE`                      | Canal de cliente sin trabajo administrativo interno dominante; su clase primaria se resolverá en PROC-SCREEN-011.                                                                                                                                              |
| `VSCREEN-0109` | Catálogo de beneficios y recompensas                  | `pass`     | `VPROC-0045::STEP-CONSULT_REWARDS_CATALOG`                  | `OUTSIDE_OPERATIONAL_CLASS` | `OUTSIDE_ADMINISTRATIVE_CLASS` | `NONE`                      | Canal de cliente sin trabajo administrativo interno dominante; su clase primaria se resolverá en PROC-SCREEN-011.                                                                                                                                              |
| `VSCREEN-0110` | Ticket o QR de redención                              | `pass`     | `VPROC-0045::STEP-CREATE_REDEMPTION_INTENT`                 | `OUTSIDE_OPERATIONAL_CLASS` | `OUTSIDE_ADMINISTRATIVE_CLASS` | `NONE`                      | Canal de cliente sin trabajo administrativo interno dominante; su clase primaria se resolverá en PROC-SCREEN-011.                                                                                                                                              |
| `VSCREEN-0111` | Historial de puntos y redenciones                     | `pass`     | `VPROC-0045::STEP-AUDIT_PERSONAL_LOYALTY_LEDGER`            | `OUTSIDE_OPERATIONAL_CLASS` | `OUTSIDE_ADMINISTRATIVE_CLASS` | `NONE`                      | Canal de cliente sin trabajo administrativo interno dominante; su clase primaria se resolverá en PROC-SCREEN-011.                                                                                                                                              |
| `VSCREEN-0112` | Perfil, privacidad y consentimientos                  | `pass`     | `VPROC-0045::STEP-MAINTAIN_CUSTOMER_PROFILE_AND_CONSENT`    | `OUTSIDE_OPERATIONAL_CLASS` | `OUTSIDE_ADMINISTRATIVE_CLASS` | `NONE`                      | Canal de cliente sin trabajo administrativo interno dominante; su clase primaria se resolverá en PROC-SCREEN-011.                                                                                                                                              |
| `VSCREEN-0113` | Registro y seguimiento de decisiones empresariales    | `viso`     | `VPROC-0001::STEP-RECORD_AND_TRACK_DECISION`                | `OUTSIDE_OPERATIONAL_CLASS` | `PRIMARY_ADMINISTRATIVE`       | `ADMIN_COORDINATION`        | La intención dominante coordina participantes, dependencias, compromisos y handoffs administrativos y conserva responsabilidad de backoffice sobre un expediente, caso, recurso, obligación o decisión; no ejecuta la mutación operativa material principal.   |
| `VSCREEN-0114` | Solicitudes y certificaciones de acceso               | `viso`     | `VPROC-0059::STEP-REVIEW_AND_CERTIFY_ACCESS`                | `OUTSIDE_OPERATIONAL_CLASS` | `PRIMARY_ADMINISTRATIVE`       | `ADMIN_APPROVAL`            | La intención dominante aplica aprobación, certificación o autoridad administrativa explícita y conserva responsabilidad de backoffice sobre un expediente, caso, recurso, obligación o decisión; no ejecuta la mutación operativa material principal.          |
| `VSCREEN-0115` | Gobierno de documentos y evidencia                    | `viso`     | `VPROC-0060::STEP-GOVERN_DOCUMENT_EVIDENCE`                 | `OUTSIDE_OPERATIONAL_CLASS` | `PRIMARY_ADMINISTRATIVE`       | `ADMIN_COMPLIANCE`          | La intención dominante gobierna riesgo, política, obligación, evidencia o cumplimiento y conserva responsabilidad de backoffice sobre un expediente, caso, recurso, obligación o decisión; no ejecuta la mutación operativa material principal.                |
| `VSCREEN-0116` | Registro de riesgos empresariales                     | `viso`     | `VPROC-0063::STEP-ASSESS_ENTERPRISE_RISK`                   | `OUTSIDE_OPERATIONAL_CLASS` | `PRIMARY_ADMINISTRATIVE`       | `ADMIN_COMPLIANCE`          | La intención dominante gobierna riesgo, política, obligación, evidencia o cumplimiento y conserva responsabilidad de backoffice sobre un expediente, caso, recurso, obligación o decisión; no ejecuta la mutación operativa material principal.                |
| `VSCREEN-0117` | Requerimientos de asesores y autoridades              | `viso`     | `VPROC-0064::STEP-MANAGE_EXTERNAL_REQUIREMENT`              | `OUTSIDE_OPERATIONAL_CLASS` | `PRIMARY_ADMINISTRATIVE`       | `ADMIN_COMPLIANCE`          | La intención dominante gobierna riesgo, política, obligación, evidencia o cumplimiento y conserva responsabilidad de backoffice sobre un expediente, caso, recurso, obligación o decisión; no ejecuta la mutación operativa material principal.                |
| `VSCREEN-0118` | Gestión de desempeño y desarrollo                     | `viso`     | `VPROC-0065::STEP-REVIEW_PERFORMANCE_AND_DEVELOPMENT`       | `OUTSIDE_OPERATIONAL_CLASS` | `PRIMARY_ADMINISTRATIVE`       | `ADMIN_PLANNING`            | La intención dominante planifica capacidad, recursos, obligaciones o trabajo futuro y conserva responsabilidad de backoffice sobre un expediente, caso, recurso, obligación o decisión; no ejecuta la mutación operativa material principal.                   |
| `VSCREEN-0119` | Asignación y control de elementos de protección       | `viso`     | `VPROC-0066::STEP-ASSIGN_PROTECTIVE_EQUIPMENT`              | `SECONDARY_OPERATIONAL`     | `PRIMARY_ADMINISTRATIVE`       | `ADMIN_RESOURCE_MANAGEMENT` | La intención dominante administra maestros, recursos, activos, proveedores o configuraciones de apoyo y conserva responsabilidad de backoffice sobre un expediente, caso, recurso, obligación o decisión; no ejecuta la mutación operativa material principal. |
| `VSCREEN-0120` | Mesa de servicio tecnológico                          | `viso`     | `VPROC-0058::STEP-RESOLVE_TECH_SERVICE_CASE`                | `SECONDARY_OPERATIONAL`     | `PRIMARY_ADMINISTRATIVE`       | `ADMIN_CASE`                | La intención dominante gestiona un caso administrativo desde apertura hasta resolución y conserva responsabilidad de backoffice sobre un expediente, caso, recurso, obligación o decisión; no ejecuta la mutación operativa material principal.                |
| `VSCREEN-0121` | Continuidad, contingencia y recuperación              | `viso`     | `VPROC-0062::STEP-ACTIVATE_AND_RECOVER_CONTINUITY`          | `SECONDARY_OPERATIONAL`     | `PRIMARY_ADMINISTRATIVE`       | `ADMIN_PLANNING`            | La intención dominante planifica capacidad, recursos, obligaciones o trabajo futuro y conserva responsabilidad de backoffice sobre un expediente, caso, recurso, obligación o decisión; no ejecuta la mutación operativa material principal.                   |
| `VSCREEN-0122` | Privacidad, cumplimiento y conservación               | `viso`     | `VPROC-0060::STEP-GOVERN_PRIVACY_AND_RETENTION`             | `OUTSIDE_OPERATIONAL_CLASS` | `PRIMARY_ADMINISTRATIVE`       | `ADMIN_COMPLIANCE`          | La intención dominante gobierna riesgo, política, obligación, evidencia o cumplimiento y conserva responsabilidad de backoffice sobre un expediente, caso, recurso, obligación o decisión; no ejecuta la mutación operativa material principal.                |
| `VSCREEN-0123` | Gestión de comunicaciones internas                    | `viso`     | `VPROC-0004::STEP-PUBLISH_INTERNAL_COMMUNICATION`           | `OUTSIDE_OPERATIONAL_CLASS` | `PRIMARY_ADMINISTRATIVE`       | `ADMIN_COMMUNICATION`       | La intención dominante gobierna comunicación formal, entrega, acuse y seguimiento y conserva responsabilidad de backoffice sobre un expediente, caso, recurso, obligación o decisión; no ejecuta la mutación operativa material principal.                     |
| `VSCREEN-0124` | Mis comunicados laborales                             | `anima`    | `VPROC-0004::STEP-CONSULT_AND_ACKNOWLEDGE_COMMUNICATION`    | `OUTSIDE_OPERATIONAL_CLASS` | `OUTSIDE_ADMINISTRATIVE_CLASS` | `NONE`                      | Experiencia personal del trabajador sin gestión de poblaciones ni backoffice; su clase primaria se resolverá en PROC-SCREEN-010.                                                                                                                               |
| `VSCREEN-0125` | Mi carnet laboral                                     | `anima`    | `VPROC-0006::STEP-PRESENT_EMPLOYEE_CREDENTIAL`              | `OUTSIDE_OPERATIONAL_CLASS` | `OUTSIDE_ADMINISTRATIVE_CLASS` | `NONE`                      | Experiencia personal del trabajador sin gestión de poblaciones ni backoffice; su clase primaria se resolverá en PROC-SCREEN-010.                                                                                                                               |
| `VSCREEN-0126` | Mis documentos laborales                              | `anima`    | `VPROC-0060::STEP-CONSULT_OR_SUBMIT_EMPLOYMENT_DOCUMENT`    | `OUTSIDE_OPERATIONAL_CLASS` | `OUTSIDE_ADMINISTRATIVE_CLASS` | `NONE`                      | Experiencia personal del trabajador sin gestión de poblaciones ni backoffice; su clase primaria se resolverá en PROC-SCREEN-010.                                                                                                                               |
| `VSCREEN-0127` | Mi capacitación                                       | `anima`    | `VPROC-0065::STEP-COMPLETE_ASSIGNED_TRAINING`               | `OUTSIDE_OPERATIONAL_CLASS` | `OUTSIDE_ADMINISTRATIVE_CLASS` | `NONE`                      | Experiencia personal del trabajador sin gestión de poblaciones ni backoffice; su clase primaria se resolverá en PROC-SCREEN-010.                                                                                                                               |
| `VSCREEN-0128` | Mis objetivos y retroalimentación                     | `anima`    | `VPROC-0065::STEP-REVIEW_PERSONAL_OBJECTIVES`               | `OUTSIDE_OPERATIONAL_CLASS` | `OUTSIDE_ADMINISTRATIVE_CLASS` | `NONE`                      | Experiencia personal del trabajador sin gestión de poblaciones ni backoffice; su clase primaria se resolverá en PROC-SCREEN-010.                                                                                                                               |
| `VSCREEN-0129` | Mis solicitudes de soporte                            | `anima`    | `VPROC-0058::STEP-SUBMIT_AND_TRACK_SUPPORT_REQUEST`         | `SECONDARY_OPERATIONAL`     | `OUTSIDE_ADMINISTRATIVE_CLASS` | `NONE`                      | Experiencia personal del trabajador sin gestión de poblaciones ni backoffice; su clase primaria se resolverá en PROC-SCREEN-010.                                                                                                                               |
| `VSCREEN-0130` | Mis reportes de seguridad y salud                     | `anima`    | `VPROC-0013::STEP-REPORT_SST_EVENT`                         | `SECONDARY_OPERATIONAL`     | `OUTSIDE_ADMINISTRATIVE_CLASS` | `NONE`                      | Experiencia personal del trabajador sin gestión de poblaciones ni backoffice; su clase primaria se resolverá en PROC-SCREEN-010.                                                                                                                               |
| `VSCREEN-0131` | Mis elementos de protección                           | `anima`    | `VPROC-0066::STEP-ACKNOWLEDGE_PROTECTIVE_EQUIPMENT`         | `SECONDARY_OPERATIONAL`     | `OUTSIDE_ADMINISTRATIVE_CLASS` | `NONE`                      | Experiencia personal del trabajador sin gestión de poblaciones ni backoffice; su clase primaria se resolverá en PROC-SCREEN-010.                                                                                                                               |
| `VSCREEN-0132` | Reservas de inventario                                | `nexo`     | `VPROC-0028::STEP-RESERVE_STOCK`                            | `PRIMARY_OPERATIONAL`       | `OUTSIDE_ADMINISTRATIVE_CLASS` | `NONE`                      | La ejecución operativa ya es la intención primaria y no existe una carga administrativa suficiente para añadir esta clase; gobierno, permisos y auditoría permanecen separados.                                                                                |
| `VSCREEN-0133` | Planes y órdenes de mantenimiento de activos          | `nexo`     | `VPROC-0030::STEP-PLAN_AND_EXECUTE_ASSET_MAINTENANCE`       | `PRIMARY_OPERATIONAL`       | `SECONDARY_ADMINISTRATIVE`     | `ADMIN_PLANNING`            | La pantalla planifica capacidad, recursos, obligaciones o trabajo futuro, pero su intención primaria es operativa o corresponde a supervisión, configuración o auditoría. La relevancia administrativa se conserva como secundaria.                            |
| `VSCREEN-0134` | Garantías, seguros y reclamaciones de activos         | `nexo`     | `VPROC-0030::STEP-MANAGE_ASSET_CLAIM`                       | `OUTSIDE_OPERATIONAL_CLASS` | `PRIMARY_ADMINISTRATIVE`       | `ADMIN_CASE`                | La intención dominante gestiona un caso administrativo desde apertura hasta resolución y conserva responsabilidad de backoffice sobre un expediente, caso, recurso, obligación o decisión; no ejecuta la mutación operativa material principal.                |
| `VSCREEN-0135` | Instancias y operación de kits                        | `nexo`     | `VPROC-0067::STEP-ASSEMBLE_AND_CONTROL_KIT`                 | `PRIMARY_OPERATIONAL`       | `OUTSIDE_ADMINISTRATIVE_CLASS` | `NONE`                      | La ejecución operativa ya es la intención primaria y no existe una carga administrativa suficiente para añadir esta clase; gobierno, permisos y auditoría permanecen separados.                                                                                |
| `VSCREEN-0136` | Flota y vehículos                                     | `nexo`     | `VPROC-0031::STEP-MANAGE_FLEET_ASSET`                       | `SECONDARY_OPERATIONAL`     | `PRIMARY_ADMINISTRATIVE`       | `ADMIN_RESOURCE_MANAGEMENT` | La intención dominante administra maestros, recursos, activos, proveedores o configuraciones de apoyo y conserva responsabilidad de backoffice sobre un expediente, caso, recurso, obligación o decisión; no ejecuta la mutación operativa material principal. |
| `VSCREEN-0137` | Kilometraje y combustible                             | `nexo`     | `VPROC-0031::STEP-CAPTURE_MILEAGE_AND_FUEL`                 | `PRIMARY_OPERATIONAL`       | `OUTSIDE_ADMINISTRATIVE_CLASS` | `NONE`                      | La ejecución operativa ya es la intención primaria y no existe una carga administrativa suficiente para añadir esta clase; gobierno, permisos y auditoría permanecen separados.                                                                                |
| `VSCREEN-0138` | Planeación de rutas y despachos                       | `nexo`     | `VPROC-0048::STEP-PLAN_ROUTE_AND_DISPATCH`                  | `PRIMARY_OPERATIONAL`       | `OUTSIDE_ADMINISTRATIVE_CLASS` | `NONE`                      | La ejecución operativa ya es la intención primaria y no existe una carga administrativa suficiente para añadir esta clase; gobierno, permisos y auditoría permanecen separados.                                                                                |
| `VSCREEN-0139` | Ejecución de ruta y prueba de entrega                 | `nexo`     | `VPROC-0049::STEP-EXECUTE_ROUTE_AND_PROVE_DELIVERY`         | `PRIMARY_OPERATIONAL`       | `OUTSIDE_ADMINISTRATIVE_CLASS` | `NONE`                      | La ejecución operativa ya es la intención primaria y no existe una carga administrativa suficiente para añadir esta clase; gobierno, permisos y auditoría permanecen separados.                                                                                |
| `VSCREEN-0140` | Novedades, rechazos y retornos logísticos             | `nexo`     | `VPROC-0049::STEP-RESOLVE_LOGISTICS_EXCEPTION`              | `PRIMARY_OPERATIONAL`       | `OUTSIDE_ADMINISTRATIVE_CLASS` | `NONE`                      | La ejecución operativa ya es la intención primaria y no existe una carga administrativa suficiente para añadir esta clase; gobierno, permisos y auditoría permanecen separados.                                                                                |
| `VSCREEN-0141` | Instalaciones, servicios y mantenimiento locativo     | `nexo`     | `VPROC-0055::STEP-MANAGE_FACILITY_SERVICE`                  | `PRIMARY_OPERATIONAL`       | `SECONDARY_ADMINISTRATIVE`     | `ADMIN_CASE`                | La pantalla gestiona un caso administrativo desde apertura hasta resolución, pero su intención primaria es operativa o corresponde a supervisión, configuración o auditoría. La relevancia administrativa se conserva como secundaria.                         |
| `VSCREEN-0142` | Configuración de políticas y rutas logísticas         | `nexo`     | `VPROC-0048::STEP-CONFIGURE_LOGISTICS_POLICY`               | `OUTSIDE_OPERATIONAL_CLASS` | `SECONDARY_ADMINISTRATIVE`     | `ADMIN_PLANNING`            | La pantalla planifica capacidad, recursos, obligaciones o trabajo futuro, pero su intención primaria es operativa o corresponde a supervisión, configuración o auditoría. La relevancia administrativa se conserva como secundaria.                            |
| `VSCREEN-0143` | Diseñador de etiquetas logísticas                     | `nexo`     | `VPROC-0015::STEP-AUTHOR_LOGISTICS_LABEL_TEMPLATE`          | `OUTSIDE_OPERATIONAL_CLASS` | `SECONDARY_ADMINISTRATIVE`     | `ADMIN_RESOURCE_MANAGEMENT` | La pantalla administra maestros, recursos, activos, proveedores o configuraciones de apoyo, pero su intención primaria es operativa o corresponde a supervisión, configuración o auditoría. La relevancia administrativa se conserva como secundaria.          |
| `VSCREEN-0144` | Cola y trabajos de impresión logística                | `nexo`     | `VPROC-0024::STEP-OPERATE_PRINT_QUEUE`                      | `PRIMARY_OPERATIONAL`       | `OUTSIDE_ADMINISTRATIVE_CLASS` | `NONE`                      | Opera trabajos de impresión; la administración del recurso técnico quedó separada en VSCREEN-0177.                                                                                                                                                             |
| `VSCREEN-0145` | Contratos, precios y condiciones de proveedor         | `origo`    | `VPROC-0020::STEP-GOVERN_SUPPLIER_TERMS`                    | `OUTSIDE_OPERATIONAL_CLASS` | `PRIMARY_ADMINISTRATIVE`       | `ADMIN_RESOURCE_MANAGEMENT` | La intención dominante administra maestros, recursos, activos, proveedores o configuraciones de apoyo y conserva responsabilidad de backoffice sobre un expediente, caso, recurso, obligación o decisión; no ejecuta la mutación operativa material principal. |
| `VSCREEN-0146` | Desempeño y reclamaciones de proveedor                | `origo`    | `VPROC-0020::STEP-REVIEW_SUPPLIER_PERFORMANCE`              | `OUTSIDE_OPERATIONAL_CLASS` | `PRIMARY_ADMINISTRATIVE`       | `ADMIN_REVIEW`              | La intención dominante revisa, contrasta o evalúa información para una decisión de backoffice y conserva responsabilidad de backoffice sobre un expediente, caso, recurso, obligación o decisión; no ejecuta la mutación operativa material principal.         |
| `VSCREEN-0147` | Oportunidades y cotizaciones de catering o B2B        | `pulso`    | `VPROC-0041::STEP-QUALIFY_B2B_OPPORTUNITY`                  | `OUTSIDE_OPERATIONAL_CLASS` | `PRIMARY_ADMINISTRATIVE`       | `ADMIN_CASE`                | La intención dominante gestiona un caso administrativo desde apertura hasta resolución y conserva responsabilidad de backoffice sobre un expediente, caso, recurso, obligación o decisión; no ejecuta la mutación operativa material principal.                |
| `VSCREEN-0148` | Ejecución de catering o venta B2B                     | `pulso`    | `VPROC-0041::STEP-EXECUTE_B2B_COMMITMENT`                   | `PRIMARY_OPERATIONAL`       | `SECONDARY_ADMINISTRATIVE`     | `ADMIN_COORDINATION`        | La pantalla coordina participantes, dependencias, compromisos y handoffs administrativos, pero su intención primaria es operativa o corresponde a supervisión, configuración o auditoría. La relevancia administrativa se conserva como secundaria.            |
| `VSCREEN-0149` | Operación de reservas y eventos                       | `pulso`    | `VPROC-0047::STEP-MANAGE_RESERVATION_OR_EVENT`              | `PRIMARY_OPERATIONAL`       | `SECONDARY_ADMINISTRATIVE`     | `ADMIN_COORDINATION`        | La pantalla coordina participantes, dependencias, compromisos y handoffs administrativos, pero su intención primaria es operativa o corresponde a supervisión, configuración o auditoría. La relevancia administrativa se conserva como secundaria.            |
| `VSCREEN-0150` | Casos de reclamo y compensación                       | `pulso`    | `VPROC-0046::STEP-RESOLVE_CUSTOMER_CLAIM`                   | `PRIMARY_OPERATIONAL`       | `SECONDARY_ADMINISTRATIVE`     | `ADMIN_CASE`                | La pantalla gestiona un caso administrativo desde apertura hasta resolución, pero su intención primaria es operativa o corresponde a supervisión, configuración o auditoría. La relevancia administrativa se conserva como secundaria.                         |
| `VSCREEN-0151` | Coordinación de entrega mediante tercero              | `pulso`    | `VPROC-0050::STEP-COORDINATE_THIRD_PARTY_DELIVERY`          | `PRIMARY_OPERATIONAL`       | `SECONDARY_ADMINISTRATIVE`     | `ADMIN_COORDINATION`        | La pantalla coordina participantes, dependencias, compromisos y handoffs administrativos, pero su intención primaria es operativa o corresponde a supervisión, configuración o auditoría. La relevancia administrativa se conserva como secundaria.            |
| `VSCREEN-0152` | Análisis de satisfacción y servicio                   | `pulso`    | `VPROC-0068::STEP-ANALYZE_SERVICE_SATISFACTION`             | `OUTSIDE_OPERATIONAL_CLASS` | `SECONDARY_ADMINISTRATIVE`     | `ADMIN_ANALYSIS`            | La pantalla consolida análisis, escenarios o indicadores para decisión administrativa, pero su intención primaria es operativa o corresponde a supervisión, configuración o auditoría. La relevancia administrativa se conserva como secundaria.               |
| `VSCREEN-0153` | Paquete laboral para pagos y beneficios               | `numera`   | `VPROC-0010::STEP-PREPARE_LABOR_PAYMENT_PACKAGE`            | `OUTSIDE_OPERATIONAL_CLASS` | `PRIMARY_ADMINISTRATIVE`       | `ADMIN_RECONCILIATION`      | La intención dominante concilia hechos, obligaciones, saldos, periodos o variaciones y conserva responsabilidad de backoffice sobre un expediente, caso, recurso, obligación o decisión; no ejecuta la mutación operativa material principal.                  |
| `VSCREEN-0154` | Facturas y documentos fiscales                        | `numera`   | `VPROC-0051::STEP-MANAGE_FISCAL_DOCUMENT`                   | `OUTSIDE_OPERATIONAL_CLASS` | `PRIMARY_ADMINISTRATIVE`       | `ADMIN_RECORD`              | La intención dominante mantiene un expediente, registro o documento administrativo canónico y conserva responsabilidad de backoffice sobre un expediente, caso, recurso, obligación o decisión; no ejecuta la mutación operativa material principal.           |
| `VSCREEN-0155` | Tesorería y programación de pagos                     | `numera`   | `VPROC-0052::STEP-PLAN_AND_EXECUTE_PAYMENTS`                | `OUTSIDE_OPERATIONAL_CLASS` | `PRIMARY_ADMINISTRATIVE`       | `ADMIN_PLANNING`            | La intención dominante planifica capacidad, recursos, obligaciones o trabajo futuro y conserva responsabilidad de backoffice sobre un expediente, caso, recurso, obligación o decisión; no ejecuta la mutación operativa material principal.                   |
| `VSCREEN-0156` | Presupuestos, escenarios y forecast                   | `numera`   | `VPROC-0069::STEP-PLAN_BUDGET_AND_FORECAST`                 | `OUTSIDE_OPERATIONAL_CLASS` | `PRIMARY_ADMINISTRATIVE`       | `ADMIN_PLANNING`            | La intención dominante planifica capacidad, recursos, obligaciones o trabajo futuro y conserva responsabilidad de backoffice sobre un expediente, caso, recurso, obligación o decisión; no ejecuta la mutación operativa material principal.                   |
| `VSCREEN-0157` | Impuestos y obligaciones de cumplimiento              | `numera`   | `VPROC-0052::STEP-MANAGE_TAX_OBLIGATION`                    | `OUTSIDE_OPERATIONAL_CLASS` | `PRIMARY_ADMINISTRATIVE`       | `ADMIN_COMPLIANCE`          | La intención dominante gobierna riesgo, política, obligación, evidencia o cumplimiento y conserva responsabilidad de backoffice sobre un expediente, caso, recurso, obligación o decisión; no ejecuta la mutación operativa material principal.                |
| `VSCREEN-0158` | Distribución y asignación de costos                   | `numera`   | `VPROC-0054::STEP-ALLOCATE_COSTS`                           | `OUTSIDE_OPERATIONAL_CLASS` | `PRIMARY_ADMINISTRATIVE`       | `ADMIN_RECONCILIATION`      | La intención dominante concilia hechos, obligaciones, saldos, periodos o variaciones y conserva responsabilidad de backoffice sobre un expediente, caso, recurso, obligación o decisión; no ejecuta la mutación operativa material principal.                  |
| `VSCREEN-0159` | Indicadores, análisis y planes de mejora              | `numera`   | `VPROC-0061::STEP-ANALYZE_AND_PLAN_IMPROVEMENT`             | `OUTSIDE_OPERATIONAL_CLASS` | `SECONDARY_ADMINISTRATIVE`     | `ADMIN_ANALYSIS`            | La pantalla consolida análisis, escenarios o indicadores para decisión administrativa, pero su intención primaria es operativa o corresponde a supervisión, configuración o auditoría. La relevancia administrativa se conserva como secundaria.               |
| `VSCREEN-0160` | Inicio y selección del portal de compras              | `pass`     | `VPROC-0039::STEP-ENTER_CUSTOMER_COMMERCE`                  | `OUTSIDE_OPERATIONAL_CLASS` | `OUTSIDE_ADMINISTRATIVE_CLASS` | `NONE`                      | Canal de cliente sin trabajo administrativo interno dominante; su clase primaria se resolverá en PROC-SCREEN-011.                                                                                                                                              |
| `VSCREEN-0161` | Menú y catálogo comercial del cliente                 | `pass`     | `VPROC-0017::STEP-BROWSE_COMMERCIAL_OFFER`                  | `OUTSIDE_OPERATIONAL_CLASS` | `OUTSIDE_ADMINISTRATIVE_CLASS` | `NONE`                      | Canal de cliente sin trabajo administrativo interno dominante; su clase primaria se resolverá en PROC-SCREEN-011.                                                                                                                                              |
| `VSCREEN-0162` | Carrito y configuración del pedido                    | `pass`     | `VPROC-0039::STEP-CONFIGURE_CART`                           | `OUTSIDE_OPERATIONAL_CLASS` | `OUTSIDE_ADMINISTRATIVE_CLASS` | `NONE`                      | Canal de cliente sin trabajo administrativo interno dominante; su clase primaria se resolverá en PROC-SCREEN-011.                                                                                                                                              |
| `VSCREEN-0163` | Dirección, modalidad y programación de entrega        | `pass`     | `VPROC-0050::STEP-SELECT_FULFILLMENT`                       | `OUTSIDE_OPERATIONAL_CLASS` | `OUTSIDE_ADMINISTRATIVE_CLASS` | `NONE`                      | Canal de cliente sin trabajo administrativo interno dominante; su clase primaria se resolverá en PROC-SCREEN-011.                                                                                                                                              |
| `VSCREEN-0164` | Revisión, checkout e inicio de pago                   | `pass`     | `VPROC-0043::STEP-REVIEW_AND_START_PAYMENT`                 | `OUTSIDE_OPERATIONAL_CLASS` | `OUTSIDE_ADMINISTRATIVE_CLASS` | `NONE`                      | Canal de cliente sin trabajo administrativo interno dominante; su clase primaria se resolverá en PROC-SCREEN-011.                                                                                                                                              |
| `VSCREEN-0165` | Confirmación de pedido y retorno de pago              | `pass`     | `VPROC-0043::STEP-PRESENT_ORDER_RECEIPT`                    | `OUTSIDE_OPERATIONAL_CLASS` | `OUTSIDE_ADMINISTRATIVE_CLASS` | `NONE`                      | Canal de cliente sin trabajo administrativo interno dominante; su clase primaria se resolverá en PROC-SCREEN-011.                                                                                                                                              |
| `VSCREEN-0166` | Mis pedidos y detalle                                 | `pass`     | `VPROC-0039::STEP-CONSULT_PERSONAL_ORDERS`                  | `OUTSIDE_OPERATIONAL_CLASS` | `OUTSIDE_ADMINISTRATIVE_CLASS` | `NONE`                      | Canal de cliente sin trabajo administrativo interno dominante; su clase primaria se resolverá en PROC-SCREEN-011.                                                                                                                                              |
| `VSCREEN-0167` | Seguimiento de preparación y entrega del cliente      | `pass`     | `VPROC-0050::STEP-TRACK_PERSONAL_FULFILLMENT`               | `OUTSIDE_OPERATIONAL_CLASS` | `OUTSIDE_ADMINISTRATIVE_CLASS` | `NONE`                      | Canal de cliente sin trabajo administrativo interno dominante; su clase primaria se resolverá en PROC-SCREEN-011.                                                                                                                                              |
| `VSCREEN-0168` | Chat y comunicación asociada al pedido                | `pass`     | `VPROC-0047::STEP-COMMUNICATE_ABOUT_ORDER`                  | `OUTSIDE_OPERATIONAL_CLASS` | `OUTSIDE_ADMINISTRATIVE_CLASS` | `NONE`                      | Canal de cliente sin trabajo administrativo interno dominante; su clase primaria se resolverá en PROC-SCREEN-011.                                                                                                                                              |
| `VSCREEN-0169` | Mis reclamos y casos de servicio                      | `pass`     | `VPROC-0046::STEP-SUBMIT_AND_TRACK_CLAIM`                   | `OUTSIDE_OPERATIONAL_CLASS` | `OUTSIDE_ADMINISTRATIVE_CLASS` | `NONE`                      | Canal de cliente sin trabajo administrativo interno dominante; su clase primaria se resolverá en PROC-SCREEN-011.                                                                                                                                              |
| `VSCREEN-0170` | Mis reservas y eventos                                | `pass`     | `VPROC-0047::STEP-MANAGE_PERSONAL_RESERVATION`              | `OUTSIDE_OPERATIONAL_CLASS` | `OUTSIDE_ADMINISTRATIVE_CLASS` | `NONE`                      | Canal de cliente sin trabajo administrativo interno dominante; su clase primaria se resolverá en PROC-SCREEN-011.                                                                                                                                              |
| `VSCREEN-0171` | Calificación y satisfacción                           | `pass`     | `VPROC-0068::STEP-SUBMIT_SATISFACTION_RATING`               | `OUTSIDE_OPERATIONAL_CLASS` | `OUTSIDE_ADMINISTRATIVE_CLASS` | `NONE`                      | Canal de cliente sin trabajo administrativo interno dominante; su clase primaria se resolverá en PROC-SCREEN-011.                                                                                                                                              |
| `VSCREEN-0172` | Comunicaciones y notificaciones del cliente           | `pass`     | `VPROC-0047::STEP-CONSULT_CUSTOMER_COMMUNICATION`           | `OUTSIDE_OPERATIONAL_CLASS` | `OUTSIDE_ADMINISTRATIVE_CLASS` | `NONE`                      | Canal de cliente sin trabajo administrativo interno dominante; su clase primaria se resolverá en PROC-SCREEN-011.                                                                                                                                              |
| `VSCREEN-0173` | Trazabilidad e investigación de lote                  | `fogo`     | `VPROC-0035::STEP-INVESTIGATE_BATCH_TRACEABILITY`           | `OUTSIDE_OPERATIONAL_CLASS` | `SECONDARY_ADMINISTRATIVE`     | `ADMIN_REVIEW`              | La pantalla revisa, contrasta o evalúa información para una decisión de backoffice, pero su intención primaria es operativa o corresponde a supervisión, configuración o auditoría. La relevancia administrativa se conserva como secundaria.                  |
| `VSCREEN-0174` | Controles operativos de inocuidad                     | `fogo`     | `VPROC-0014::STEP-EXECUTE_FOOD_SAFETY_CONTROL`              | `PRIMARY_OPERATIONAL`       | `SECONDARY_ADMINISTRATIVE`     | `ADMIN_COMPLIANCE`          | La pantalla gobierna riesgo, política, obligación, evidencia o cumplimiento, pero su intención primaria es operativa o corresponde a supervisión, configuración o auditoría. La relevancia administrativa se conserva como secundaria.                         |
| `VSCREEN-0175` | Seguridad de cuenta y sesiones                        | `shell`    | `VPROC-0059::STEP-MANAGE_ACCOUNT_SECURITY`                  | `OUTSIDE_OPERATIONAL_CLASS` | `OUTSIDE_ADMINISTRATIVE_CLASS` | `NONE`                      | Superficie transversal de acceso, cuenta o navegación sin expediente, planificación ni decisión administrativa empresarial dominante.                                                                                                                          |
| `VSCREEN-0176` | Definición de kits y conjuntos                        | `nexo`     | `VPROC-0067::STEP-MAINTAIN_KIT_DEFINITION`                  | `OUTSIDE_OPERATIONAL_CLASS` | `SECONDARY_ADMINISTRATIVE`     | `ADMIN_RESOURCE_MANAGEMENT` | Administra una definición maestra de apoyo, mientras configuración conserva la intención primaria.                                                                                                                                                             |
| `VSCREEN-0177` | Configuración de impresoras logísticas                | `nexo`     | `VPROC-0024::STEP-CONFIGURE_LOGISTICS_PRINTERS`             | `OUTSIDE_OPERATIONAL_CLASS` | `SECONDARY_ADMINISTRATIVE`     | `ADMIN_RESOURCE_MANAGEMENT` | Administra el recurso técnico de apoyo, mientras configuración conserva la intención primaria.                                                                                                                                                                 |

---

#### 11. Resumen por aplicación

| Aplicación | Primaria administrativa | Secundaria administrativa | Fuera de clase administrativa |   Total |
| ---------- | ----------------------: | ------------------------: | ----------------------------: | ------: |
| `shell`    |                       0 |                         3 |                             4 |       7 |
| `viso`     |                      24 |                         7 |                             0 |      31 |
| `anima`    |                       0 |                         0 |                            14 |      14 |
| `nexo`     |                       2 |                        15 |                            20 |      37 |
| `fogo`     |                       0 |                         9 |                             6 |      15 |
| `origo`    |                       9 |                         5 |                             0 |      14 |
| `pulso`    |                       1 |                         9 |                            10 |      20 |
| `numera`   |                      17 |                         3 |                             0 |      20 |
| `pass`     |                       0 |                         0 |                            19 |      19 |
| **Total**  |                  **53** |                    **51** |                        **73** | **177** |

La aplicación no determina la clasificación. El resumen comprueba únicamente que las 177 filas y sus conteos coincidan.

---

#### 12. Resumen por patrón

| Patrón                                  | Pantallas |
| --------------------------------------- | --------: |
| `ADMIN_QUEUE`                           |         7 |
| `ADMIN_RECORD`                          |         9 |
| `ADMIN_CASE`                            |        13 |
| `ADMIN_PLANNING`                        |         8 |
| `ADMIN_REVIEW`                          |        10 |
| `ADMIN_APPROVAL`                        |         6 |
| `ADMIN_COORDINATION`                    |         8 |
| `ADMIN_RECONCILIATION`                  |         8 |
| `ADMIN_COMPLIANCE`                      |        11 |
| `ADMIN_RESOURCE_MANAGEMENT`             |        16 |
| `ADMIN_COMMUNICATION`                   |         1 |
| `ADMIN_ANALYSIS`                        |         7 |
| **Total con relevancia administrativa** |   **104** |

Las 72 pantallas con `NONE` continúan hacia las tareas posteriores sin recibir una categoría inventada.

---

#### 13. Fronteras especiales

1. **SHELL:** bandejas, contexto y soporte pueden tener relevancia administrativa secundaria; acceso, cuenta y navegación no son backoffice empresarial.
2. **VISO:** concentra trabajo administrativo de organización, personas, acceso, cumplimiento y casos, pero dashboards, configuración y auditoría conservan clases especializadas.
3. **ANIMA:** no administra poblaciones; sus superficies siguen siendo personales, aunque inicien solicitudes que consumirá un backoffice.
4. **NEXO:** garantías y gobierno de flota pueden ser administrativos; movimientos físicos siguen siendo operativos y maestros o políticas se reservan a configuración.
5. **FOGO:** planeación y aprobación de receta pueden tener relevancia administrativa; ejecución, calidad y cierre productivo conservan intención operativa.
6. **ORIGO:** necesidades, solicitudes, proveedores, cotizaciones, órdenes, aprobaciones y contratos son backoffice; la recepción física conserva clase operativa.
7. **PULSO:** oportunidades B2B pueden ser administrativas; POS, salón, pagos, caja y entrega permanecen operativos y la oferta comercial se reserva a configuración.
8. **NUMERA:** hechos, gastos, obligaciones, cartera, tesorería, conciliaciones, cierres, presupuesto, fiscalidad y costos forman backoffice financiero; dashboards y reportes pueden conservar clases de supervisión o auditoría.
9. **PASS:** no recibe clase administrativa; es experiencia de cliente.
10. **AURA:** continúa sin pantallas y sin clasificación.

---

#### 14. Compatibilidad con la clasificación operativa

```text
PRIMARY_OPERATIONAL + PRIMARY_ADMINISTRATIVE
= PROHIBIDO

PRIMARY_OPERATIONAL + SECONDARY_ADMINISTRATIVE
= PERMITIDO CUANDO EXISTE CONTROL O TRAZABILIDAD DE BACKOFFICE

SECONDARY_OPERATIONAL + PRIMARY_ADMINISTRATIVE
= PERMITIDO CUANDO EL BACKOFFICE APOYA TRABAJO VIVO

OUTSIDE_OPERATIONAL_CLASS + PRIMARY_ADMINISTRATIVE
= PERMITIDO
```

La puerta final de `PROC-SCREEN-011` deberá impedir dos clases primarias y exigir al menos una.

---

#### 15. Relación con las clasificaciones posteriores

- dashboards y revisión transversal podrán recibir clase primaria de supervisión en `PROC-SCREEN-007`;
- maestros, reglas, políticas y plantillas podrán recibir clase primaria de configuración en `PROC-SCREEN-008`;
- historiales, reconstrucción y evidencia podrán recibir clase primaria de auditoría en `PROC-SCREEN-009`;
- ANIMA podrá recibir clase primaria personal en `PROC-SCREEN-010`;
- PASS podrá recibir clase primaria de cliente en `PROC-SCREEN-011`.

Una pantalla marcada `SECONDARY_ADMINISTRATIVE` debe conservar esa relevancia aunque otra tarea le asigne una clase primaria diferente.

---

#### 16. Cambio y versionado

Cambiar `administrative_fit` o `administrative_pattern` exige:

1. propuesta trazable;
2. comparación de objeto, expediente, caso, paso, responsabilidad y resultado;
3. explicación de por qué el trabajo pasó a ser o dejó de ser administrativo;
4. nueva versión de clasificación;
5. conservación del valor anterior;
6. revisión coordinada de clases, actores, acciones, permisos, métricas y pruebas posteriores;
7. nueva identidad de pantalla cuando cambie materialmente la intención principal.

Un cambio de rol, ruta, aplicación o componente no cambia automáticamente la clasificación.

---

#### 17. Validaciones obligatorias

La compilación deberá fallar cuando:

1. falte una de las 177 pantallas;
2. una pantalla aparezca más de una vez;
3. falte `administrative_fit`;
4. el valor no pertenezca al vocabulario;
5. una pantalla primaria o secundaria use `NONE`;
6. una pantalla fuera de clase use un patrón administrativo;
7. falte fundamento;
8. proceso, paso o clasificación operativa no coincidan con tareas anteriores;
9. los conteos no sean 53, 51 y 73;
10. la distribución por aplicación no coincida;
11. los patrones no sumen 104;
12. exista una pantalla primaria operativa y primaria administrativa;
13. PASS o ANIMA reciban clase primaria administrativa sin una nueva decisión aprobada;
14. una pantalla de configuración, supervisión o auditoría sea primaria administrativa solo por vivir en backoffice;
15. la clasificación sea usada como permiso, rol o autoridad;
16. un cambio elimine el historial anterior;
17. AURA reciba una clasificación sin pantalla admitida;
18. la puerta final deje más de una clase primaria o ninguna clase primaria.

---

#### 18. Seguridad y autorización

La clasificación administrativa no concede:

- acceso a la pantalla;
- lectura de expedientes;
- modificación de maestros;
- aprobación o certificación;
- consulta de información sensible;
- alcance global o territorial;
- autoridad jerárquica;
- ejecución de acciones;
- exportación;
- simulación de permisos;
- acceso directo por URL.

Cada aplicación deberá resolver identidad, actor, permiso, contexto, recurso, territorio, estado, versión y segregación.

---

#### 19. SCREEN-ADMINISTRATIVE-CARRYOVER-REGISTER-001

| Pendiente                                                    | Propietario exacto                                        |
| ------------------------------------------------------------ | --------------------------------------------------------- |
| clasificar pantallas de supervisión                          | `PROC-SCREEN-007`                                         |
| clasificar pantallas de configuración                        | `PROC-SCREEN-008`                                         |
| clasificar pantallas de auditoría                            | `PROC-SCREEN-009`                                         |
| clasificar pantallas personales                              | `PROC-SCREEN-010`                                         |
| clasificar pantallas de cliente y cerrar la puerta de clases | `PROC-SCREEN-011`                                         |
| definir actores objetivo                                     | `PROC-SCREEN-012`                                         |
| definir dispositivos soportados                              | `PROC-SCREEN-013`                                         |
| definir acciones                                             | `PROC-SCREEN-014` y `PROC-SCREEN-015`                     |
| definir entradas, salidas y estados de interfaz              | `PROC-SCREEN-016` a `PROC-SCREEN-021`                     |
| definir sensibilidad y permisos                              | `PROC-SCREEN-022` a `PROC-SCREEN-024`                     |
| vincular operaciones técnicas                                | `PROC-SCREEN-025`                                         |
| mapear rutas y legado                                        | `PROC-SCREEN-026`                                         |
| definir métricas y aceptación operativa                      | `PROC-SCREEN-027` y `PROC-SCREEN-028`                     |
| implementar tipos y validadores                              | paquetes E5 y CI documental                               |
| validar con usuarios administrativos                         | `UX-QA-*` y pilotos E5                                    |
| admitir AURA                                                 | tareas canónicas de AURA y nueva admisión `PROC-SCREEN-*` |

No queda pendiente narrativo sin tarea o puerta de resolución.

---

#### 20. Requisitos de prueba derivados

**Resultado:** GENERA 30 REQUISITOS DE PRUEBA.

Se incorporan `TREQ-UX-639` a `TREQ-UX-668` al Registro Canónico completo. Permanecen en estado `IDENTIFICADO`; automatización, implementación y evidencia corresponden a CI documental, paquetes E5, BLOQUE U, staging y pilotos.

---

#### 21. Criterios de aceptación

- [x] Se clasifican las 177 pantallas sin renumerarlas.
- [x] Cada pantalla recibe exactamente un `administrative_fit`.
- [x] Se distinguen 53 primarias, 51 secundarias y 73 fuera de clase.
- [x] Las 104 pantallas con relevancia administrativa utilizan doce patrones cerrados.
- [x] Ninguna pantalla queda primaria operativa y primaria administrativa simultáneamente.
- [x] La clasificación deriva de objeto, expediente, caso, decisión y responsabilidad, no de aplicación o repositorio.
- [x] Se preservan las fronteras entre VISO, ANIMA, NEXO, FOGO, ORIGO, PULSO, NUMERA, PASS y SHELL.
- [x] AURA conserva cero pantallas.
- [x] La clasificación no concede permisos ni autoridad.
- [x] Se conserva la coexistencia entre clase primaria y relevancias secundarias.
- [x] Se mantiene en `PROC-SCREEN-011` la puerta final de completitud.
- [x] Se definen cambio, versionado, historial y validaciones.
- [x] Se generan `TREQ-UX-639` a `TREQ-UX-668`.
- [x] No se anticipan actores, dispositivos, acciones, estados, permisos, rutas o APIs.
- [x] No se implementa código ni se avanza a `PROC-SCREEN-007`.

---

#### 22. Resultado y continuidad

```text
PROC-SCREEN-005 APROBADA
PROC-SCREEN-006 APROBADA
PROC-SCREEN-007 NO INICIADA
```

La continuidad documental pasa exclusivamente a:

```text
PROC-SCREEN-007 — Clasificar pantalla de supervisión
```


### ✅ PROC-SCREEN-007 — Clasificar pantalla de supervisión

**Estado:** APROBADA

**Bloque:** E2 — Arquitectura funcional, procesos y experiencia transversal

**Marcador exacto que reemplaza:** `### [ ] PROC-SCREEN-007 — Clasificar pantalla de supervisión`

**Tarea anterior:** `PROC-SCREEN-006 — Clasificar pantalla administrativa` — APROBADA

**Siguiente tarea reservada:** `PROC-SCREEN-008 — Clasificar pantalla de configuración` — NO INICIADA

**Artefactos lógicos contenidos en esta tarea:**

- `SCREEN-SUPERVISION-CLASSIFICATION-CONTRACT-001`;
- `SCREEN-SUPERVISION-PATTERN-VOCABULARY-001`;
- `SCREEN-SUPERVISION-CLASSIFICATION-REGISTER-001`;
- `SCREEN-SUPERVISION-COVERAGE-MATRIX-001`;
- `SCREEN-SUPERVISION-DRILLDOWN-CONTRACT-001`;
- `SCREEN-SUPERVISION-CLASSIFICATION-CHANGE-POLICY-001`;
- `SCREEN-SUPERVISION-CLASSIFICATION-VALIDATION-GATE-001`;
- `SCREEN-SUPERVISION-CARRYOVER-REGISTER-001`.

**Resultado cuantitativo:** **177 pantallas clasificadas**, de las cuales **12** quedan como `PRIMARY_SUPERVISION`, **60** como `SECONDARY_SUPERVISION` y **105** como `OUTSIDE_SUPERVISION_CLASS`; se utilizan **12 patrones de supervisión**, existen **72 pantallas con relevancia de supervisión** y ninguna pantalla recibe simultáneamente dos clases primarias aprobadas.

**Naturaleza:** clasificación documental del grado en que cada pantalla permite vigilar, priorizar, coordinar, controlar o intervenir sobre trabajo de terceros, poblaciones, colas, recursos, compromisos o resultados agregados. No define todavía clasificación de configuración, auditoría, personal o cliente; tampoco define actores, dispositivos, acciones, estados de interfaz, sensibilidad, permisos, rutas u operaciones técnicas.

**Cambios en código de producto, componentes, rutas, repositorios consumidores, Supabase, tablas, migraciones, RLS, RPC, eventos, analítica o producción:** no autorizados por esta tarea.

---

#### 1. Propósito

Distinguir las pantallas cuya intención principal es supervisar trabajo empresarial de aquellas que solo incorporan controles de supervisión secundarios o que no pertenecen a esta clase.

```text
TRABAJO DE TERCEROS O AGREGADO
        +
ESTADO, CARGA, RIESGO O DESVIACION
        +
CAPACIDAD DE PRIORIZAR, ESCALAR O INTERVENIR
        +
DRILL-DOWN TRAZABLE
        =
CLASIFICACION DE SUPERVISION
```

La clasificación responde **si la pantalla permite comprender y conducir trabajo más allá del caso propio de quien la utiliza**. No concede jerarquía, autoridad de aprobación, acceso a datos sensibles ni capacidad de modificar el objeto supervisado.

---

#### 2. Dependencias consumidas

- `PROC-SCREEN-001` y la identidad estable `VSCREEN-*`;
- `PROC-SCREEN-002` y las aplicaciones primarias;
- `PROC-SCREEN-003` y los procesos primarios;
- `PROC-SCREEN-004` y los pasos dominantes;
- `PROC-SCREEN-005` y la clasificación operativa;
- `PROC-SCREEN-006` y la clasificación administrativa;
- `PROC-CAT-001` a `PROC-CAT-020`;
- `PROC-ACTOR-001` a `PROC-ACTOR-010`;
- `UX-BASE-001` a `UX-BASE-015`;
- `UX-STATION-001` a `UX-STATION-012`;
- `UX-ADMIN-001` a `UX-ADMIN-005`;
- los contratos aprobados de autorización, contexto, segregación, auditoría, métricas, handoff y recuperación.

La tarea no utiliza títulos jerárquicos, nombres de rol, aplicación o repositorio como sustituto de la intención de supervisión.

---

#### 3. Alcance

1. incorporar `supervision_fit` a las 177 pantallas;
2. distinguir supervisión primaria, supervisión secundaria y ausencia de clase;
3. definir doce patrones de supervisión reutilizables;
4. clasificar cada pantalla mediante población, amplitud, señal, desvío, intervención y drill-down;
5. separar supervisión de operación directa, administración de casos, configuración y auditoría;
6. impedir dos clases primarias simultáneas;
7. conservar controles secundarios dentro de pantallas operativas o administrativas;
8. establecer reglas de frescura, procedencia y navegación hacia el objeto propietario;
9. definir cambio, versionado, validaciones y carryovers;
10. mantener la puerta final de una clase primaria por pantalla en `PROC-SCREEN-011`.

---

#### 4. Exclusiones

Esta tarea no:

- concede autoridad jerárquica;
- define quién puede supervisar;
- asigna ámbitos por empresa, sede, área o territorio;
- convierte cada dashboard o reporte en supervisión;
- convierte cada aprobación en supervisión;
- clasifica formalmente configuración, auditoría, pantallas personales o de cliente;
- define actores, dispositivos, acciones, estados de interfaz o permisos;
- permite modificar directamente fuentes ajenas desde una proyección;
- diseña métricas definitivas;
- vincula APIs, RPC, eventos o tablas;
- mapea rutas o componentes legacy;
- activa AURA.

---

#### 5. Definición canónica de pantalla de supervisión

Una pantalla tiene relevancia de supervisión cuando permite observar y conducir trabajo que excede el caso estrictamente propio del usuario y presenta uno o más de estos elementos:

- varias personas, casos, pedidos, lotes, recursos, ubicaciones o compromisos;
- una cola priorizable;
- carga, capacidad o disponibilidad;
- cumplimiento de tiempos o SLA;
- desvíos, excepciones o riesgos;
- comparación entre resultado esperado y real;
- necesidad de escalar, reasignar, intervenir o solicitar corrección;
- navegación trazable desde el agregado hasta el objeto propietario.

No basta con:

- mostrar indicadores decorativos;
- ser utilizada por un gerente;
- requerir un permiso sensible;
- contener filtros o gráficos;
- listar varios registros;
- aprobar un caso individual;
- consultar un historial;
- pertenecer a VISO o NUMERA;
- llamarse “inicio”, “resumen” o “dashboard”.

La clase primaria exige evidencia conjunta de amplitud o terceros, señal accionable, posibilidad real de intervención y drill-down trazable. Una bandeja propia, un diagnóstico técnico, una guía de ejecución o la publicación de un reporte no cumplen el contrato por el nombre de la superficie.

---

#### 6. Estados de clasificación

| Valor                       | Significado                                                                           | Efecto documental                                              |
| --------------------------- | ------------------------------------------------------------------------------------- | -------------------------------------------------------------- |
| `PRIMARY_SUPERVISION`       | vigilar y conducir trabajo agregado o de terceros es la intención dominante           | reserva `SUPERVISION` como clase primaria                      |
| `SECONDARY_SUPERVISION`     | la pantalla ejecuta o administra trabajo, pero incorpora control supervisor relevante | agrega supervisión secundaria sin reemplazar la clase primaria |
| `OUTSIDE_SUPERVISION_CLASS` | no existe una función supervisora material bajo este contrato                         | continúa hacia las clases posteriores                          |

`SECONDARY_SUPERVISION` no convierte una pantalla operativa o administrativa en dashboard ni autoriza a supervisar.

---

#### 7. Contrato mínimo

| Campo                                | Obligación                                                           |
| ------------------------------------ | -------------------------------------------------------------------- |
| `screen_id`                          | `VSCREEN-*` canónico                                                 |
| `primary_application_id`             | aplicación aprobada                                                  |
| `primary_process_id`                 | proceso aprobado                                                     |
| `primary_process_step_ref`           | paso aprobado                                                        |
| `operational_fit`                    | clasificación aprobada en `PROC-SCREEN-005`                          |
| `administrative_fit`                 | clasificación aprobada en `PROC-SCREEN-006`                          |
| `supervision_fit`                    | uno de los tres estados aprobados                                    |
| `supervision_pattern`                | patrón aprobado o `NONE`                                             |
| `supervision_reason`                 | fundamento verificable                                               |
| `supervision_classification_version` | versión semántica                                                    |
| `supervision_classification_status`  | `CANONICAL`, `CHANGE_PROPOSED`, `SUPERSEDED` o `RETIRED_WITH_SCREEN` |
| `supervision_classification_task`    | tarea que aprobó o modificó la decisión                              |

Valores iniciales:

```text
supervision_classification_version: 1.0.0
supervision_classification_status: CANONICAL
supervision_classification_task: PROC-SCREEN-007
decision_record: INITIAL_SUPERVISION_CLASSIFICATION
```

---

#### 8. SCREEN-SUPERVISION-PATTERN-VOCABULARY-001

| Patrón                     | Uso                                                              |
| -------------------------- | ---------------------------------------------------------------- |
| `SUPERVISION_DASHBOARD`    | consolida señales, carga, desviaciones y prioridades             |
| `SUPERVISION_QUEUE`        | admite, prioriza, distribuye o escala trabajo pendiente          |
| `SUPERVISION_MONITORING`   | sigue casos, recursos o compromisos abiertos                     |
| `SUPERVISION_REVIEW`       | contrasta evidencia antes de continuar o intervenir              |
| `SUPERVISION_CONTROL`      | verifica coherencia, cumplimiento o resultado de un ciclo activo |
| `SUPERVISION_EXCEPTION`    | concentra diferencias, rechazos, retornos o correcciones         |
| `SUPERVISION_CAPACITY`     | equilibra demanda, programación y disponibilidad                 |
| `SUPERVISION_COMPLIANCE`   | vigila controles, obligaciones y hallazgos                       |
| `SUPERVISION_PERFORMANCE`  | evalúa resultados, tendencias y mejora                           |
| `SUPERVISION_RISK`         | vigila exposición, continuidad y tratamientos                    |
| `SUPERVISION_SERVICE`      | coordina atención, SLA, recuperación y escalamiento              |
| `SUPERVISION_COORDINATION` | articula responsables, transferencias y dependencias             |
| `NONE`                     | no existe relevancia de supervisión bajo esta tarea              |

---

#### 9. Algoritmo de decisión

Se clasifica `PRIMARY_SUPERVISION` cuando:

1. la pantalla presenta una población, cola, carga o conjunto de resultados;
2. su propósito dominante es detectar situación, desvío o prioridad;
3. permite orientar intervención, escalamiento, reasignación o seguimiento;
4. conserva drill-down hacia el caso o aplicación propietaria;
5. no ejecuta directamente la mutación principal ni administra el expediente como intención dominante.

Se clasifica `SECONDARY_SUPERVISION` cuando:

1. la pantalla ya es primaria operativa o administrativa;
2. incorpora revisión, control, monitoreo, capacidad, cumplimiento o excepción;
3. la función supervisora es material pero subordinada;
4. suprimir esa función reduciría control, aunque el trabajo principal seguiría existiendo.

Se clasifica `OUTSIDE_SUPERVISION_CLASS` cuando predomina:

- ejecución individual directa;
- administración de un expediente o caso concreto;
- mantenimiento de maestros o reglas;
- auditoría histórica;
- autoservicio personal;
- experiencia de cliente;
- acceso o cuenta transversal sin vigilancia de trabajo empresarial.

---

#### 10. SCREEN-SUPERVISION-CLASSIFICATION-REGISTER-001

| Screen ID      | Pantalla                                              | Aplicación | Paso dominante                                              | Clase operativa             | Clase administrativa           | Clasificación de supervisión | Patrón                     | Fundamento                                                                                                                                                                                                                                                                                      |
| -------------- | ----------------------------------------------------- | ---------- | ----------------------------------------------------------- | --------------------------- | ------------------------------ | ---------------------------- | -------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `VSCREEN-0001` | Hub Vento OS                                          | `shell`    | `VPROC-0059::STEP-ENTER_ECOSYSTEM`                          | `OUTSIDE_OPERATIONAL_CLASS` | `OUTSIDE_ADMINISTRATIVE_CLASS` | `OUTSIDE_SUPERVISION_CLASS`  | `NONE`                     | Acceso, cuenta, activación técnica o navegación transversal sin vigilancia dominante sobre trabajo empresarial de terceros.                                                                                                                                                                     |
| `VSCREEN-0002` | Inicio de sesión y recuperación                       | `shell`    | `VPROC-0059::STEP-AUTHENTICATE_OR_RECOVER`                  | `OUTSIDE_OPERATIONAL_CLASS` | `OUTSIDE_ADMINISTRATIVE_CLASS` | `OUTSIDE_SUPERVISION_CLASS`  | `NONE`                     | Acceso, cuenta, activación técnica o navegación transversal sin vigilancia dominante sobre trabajo empresarial de terceros.                                                                                                                                                                     |
| `VSCREEN-0003` | Resolución de contexto y acceso                       | `shell`    | `VPROC-0059::STEP-RESOLVE_EFFECTIVE_CONTEXT`                | `SECONDARY_OPERATIONAL`     | `SECONDARY_ADMINISTRATIVE`     | `OUTSIDE_SUPERVISION_CLASS`  | `NONE`                     | Acceso, cuenta, activación técnica o navegación transversal sin vigilancia dominante sobre trabajo empresarial de terceros.                                                                                                                                                                     |
| `VSCREEN-0004` | Activación de dispositivo compartido                  | `shell`    | `VPROC-0059::STEP-ACTIVATE_SHARED_DEVICE`                   | `SECONDARY_OPERATIONAL`     | `OUTSIDE_ADMINISTRATIVE_CLASS` | `OUTSIDE_SUPERVISION_CLASS`  | `NONE`                     | Acceso, cuenta, activación técnica o navegación transversal sin vigilancia dominante sobre trabajo empresarial de terceros.                                                                                                                                                                     |
| `VSCREEN-0005` | Bandeja transversal de tareas y notificaciones        | `shell`    | `VPROC-0004::STEP-TRIAGE_TRANSVERSAL_WORK`                  | `SECONDARY_OPERATIONAL`     | `SECONDARY_ADMINISTRATIVE`     | `OUTSIDE_SUPERVISION_CLASS`  | `NONE`                     | La bandeja personal o transversal no demuestra población ajena, agregado, intervención ni drill-down supervisor.                                                                                                                                                                                |
| `VSCREEN-0006` | Centro de soporte y diagnóstico                       | `shell`    | `VPROC-0058::STEP-DIAGNOSE_AND_ROUTE_SUPPORT`               | `SECONDARY_OPERATIONAL`     | `SECONDARY_ADMINISTRATIVE`     | `OUTSIDE_SUPERVISION_CLASS`  | `NONE`                     | Diagnostica y deriva soporte; la supervisión de casos de servicio pertenece a una superficie distinta.                                                                                                                                                                                          |
| `VSCREEN-0007` | Inicio ejecutivo y gerencial                          | `viso`     | `VPROC-0001::STEP-REVIEW_EXECUTIVE_WORK`                    | `OUTSIDE_OPERATIONAL_CLASS` | `SECONDARY_ADMINISTRATIVE`     | `PRIMARY_SUPERVISION`        | `SUPERVISION_DASHBOARD`    | La intención dominante consolida señales, carga, desviaciones y prioridades para orientar intervención. La pantalla permite comprender el estado de trabajo ajeno o agregado, detectar desvíos y orientar intervención sin convertirse en el espacio principal de ejecución o backoffice.       |
| `VSCREEN-0008` | Estructura organizativa                               | `viso`     | `VPROC-0002::STEP-MAINTAIN_ORGANIZATIONAL_STRUCTURE`        | `OUTSIDE_OPERATIONAL_CLASS` | `SECONDARY_ADMINISTRATIVE`     | `OUTSIDE_SUPERVISION_CLASS`  | `NONE`                     | No existe vigilancia dominante sobre múltiples casos, personas, recursos, compromisos o desviaciones; la pantalla continuará hacia las clases posteriores.                                                                                                                                      |
| `VSCREEN-0009` | Políticas, delegaciones y límites                     | `viso`     | `VPROC-0003::STEP-AUTHOR_POLICIES_AND_LIMITS`               | `OUTSIDE_OPERATIONAL_CLASS` | `SECONDARY_ADMINISTRATIVE`     | `OUTSIDE_SUPERVISION_CLASS`  | `NONE`                     | La intención dominante es mantener maestros, reglas, políticas o plantillas; la posible clase de configuración se resolverá en PROC-SCREEN-008.                                                                                                                                                 |
| `VSCREEN-0010` | Compromisos y transferencias internas                 | `viso`     | `VPROC-0004::STEP-TRACK_INTERNAL_COMMITMENTS`               | `SECONDARY_OPERATIONAL`     | `PRIMARY_ADMINISTRATIVE`       | `SECONDARY_SUPERVISION`      | `SUPERVISION_COORDINATION` | La pantalla articula responsables, dependencias, transferencias y compromisos, pero su intención primaria ya es operativa o administrativa. Conserva supervisión secundaria sin duplicar la ejecución, el expediente ni la fuente de verdad.                                                    |
| `VSCREEN-0011` | Embudo de candidatos                                  | `viso`     | `VPROC-0005::STEP-TRIAGE_CANDIDATES`                        | `OUTSIDE_OPERATIONAL_CLASS` | `PRIMARY_ADMINISTRATIVE`       | `OUTSIDE_SUPERVISION_CLASS`  | `NONE`                     | La pantalla administra un expediente, caso, obligación o recurso concreto; no predomina la supervisión transversal o agregada.                                                                                                                                                                  |
| `VSCREEN-0012` | Caso de selección                                     | `viso`     | `VPROC-0005::STEP-EVALUATE_AND_DECIDE_CANDIDATE`            | `OUTSIDE_OPERATIONAL_CLASS` | `PRIMARY_ADMINISTRATIVE`       | `OUTSIDE_SUPERVISION_CLASS`  | `NONE`                     | La pantalla administra un expediente, caso, obligación o recurso concreto; no predomina la supervisión transversal o agregada.                                                                                                                                                                  |
| `VSCREEN-0013` | Vinculación e incorporación                           | `viso`     | `VPROC-0006::STEP-ORCHESTRATE_ONBOARDING`                   | `OUTSIDE_OPERATIONAL_CLASS` | `PRIMARY_ADMINISTRATIVE`       | `OUTSIDE_SUPERVISION_CLASS`  | `NONE`                     | La pantalla administra un expediente, caso, obligación o recurso concreto; no predomina la supervisión transversal o agregada.                                                                                                                                                                  |
| `VSCREEN-0014` | Directorio y expediente laboral                       | `viso`     | `VPROC-0006::STEP-MAINTAIN_EMPLOYMENT_RECORD`               | `OUTSIDE_OPERATIONAL_CLASS` | `PRIMARY_ADMINISTRATIVE`       | `OUTSIDE_SUPERVISION_CLASS`  | `NONE`                     | La pantalla administra un expediente, caso, obligación o recurso concreto; no predomina la supervisión transversal o agregada.                                                                                                                                                                  |
| `VSCREEN-0015` | Programación laboral                                  | `viso`     | `VPROC-0007::STEP-PLAN_AND_PUBLISH_SCHEDULE`                | `SECONDARY_OPERATIONAL`     | `PRIMARY_ADMINISTRATIVE`       | `SECONDARY_SUPERVISION`      | `SUPERVISION_CAPACITY`     | La pantalla equilibra demanda, capacidad, programación o disponibilidad, pero su intención primaria ya es operativa o administrativa. Conserva supervisión secundaria sin duplicar la ejecución, el expediente ni la fuente de verdad.                                                          |
| `VSCREEN-0016` | Revisión de asistencia                                | `viso`     | `VPROC-0008::STEP-REVIEW_ATTENDANCE_EXCEPTION`              | `SECONDARY_OPERATIONAL`     | `SECONDARY_ADMINISTRATIVE`     | `PRIMARY_SUPERVISION`        | `SUPERVISION_REVIEW`       | La intención dominante contrasta evidencia y determina si el trabajo puede continuar o requiere intervención. La pantalla permite comprender el estado de trabajo ajeno o agregado, detectar desvíos y orientar intervención sin convertirse en el espacio principal de ejecución o backoffice. |
| `VSCREEN-0017` | Novedades, ausencias y reemplazos                     | `viso`     | `VPROC-0009::STEP-RESOLVE_WORKFORCE_CASE`                   | `SECONDARY_OPERATIONAL`     | `PRIMARY_ADMINISTRATIVE`       | `SECONDARY_SUPERVISION`      | `SUPERVISION_EXCEPTION`    | La pantalla concentra desvíos, diferencias, rechazos, retornos o correcciones, pero su intención primaria ya es operativa o administrativa. Conserva supervisión secundaria sin duplicar la ejecución, el expediente ni la fuente de verdad.                                                    |
| `VSCREEN-0018` | Retiro y revocación coordinada                        | `viso`     | `VPROC-0011::STEP-CLOSE_EMPLOYMENT_AND_REVOKE`              | `OUTSIDE_OPERATIONAL_CLASS` | `PRIMARY_ADMINISTRATIVE`       | `OUTSIDE_SUPERVISION_CLASS`  | `NONE`                     | La pantalla administra un expediente, caso, obligación o recurso concreto; no predomina la supervisión transversal o agregada.                                                                                                                                                                  |
| `VSCREEN-0019` | Catálogo de roles y permisos                          | `viso`     | `VPROC-0059::STEP-MAINTAIN_ACCESS_CATALOG`                  | `OUTSIDE_OPERATIONAL_CLASS` | `SECONDARY_ADMINISTRATIVE`     | `OUTSIDE_SUPERVISION_CLASS`  | `NONE`                     | La intención dominante es mantener maestros, reglas, políticas o plantillas; la posible clase de configuración se resolverá en PROC-SCREEN-008.                                                                                                                                                 |
| `VSCREEN-0020` | Perfil de acceso del trabajador                       | `viso`     | `VPROC-0059::STEP-ASSIGN_EFFECTIVE_ACCESS`                  | `OUTSIDE_OPERATIONAL_CLASS` | `PRIMARY_ADMINISTRATIVE`       | `OUTSIDE_SUPERVISION_CLASS`  | `NONE`                     | La pantalla administra un expediente, caso, obligación o recurso concreto; no predomina la supervisión transversal o agregada.                                                                                                                                                                  |
| `VSCREEN-0021` | Simulación de permisos y conflictos                   | `viso`     | `VPROC-0059::STEP-SIMULATE_ACCESS_DECISION`                 | `OUTSIDE_OPERATIONAL_CLASS` | `PRIMARY_ADMINISTRATIVE`       | `SECONDARY_SUPERVISION`      | `SUPERVISION_CONTROL`      | La pantalla verifica coherencia, cumplimiento o resultado de un ciclo activo, pero su intención primaria ya es operativa o administrativa. Conserva supervisión secundaria sin duplicar la ejecución, el expediente ni la fuente de verdad.                                                     |
| `VSCREEN-0022` | Gobierno de dispositivos compartidos                  | `viso`     | `VPROC-0059::STEP-GOVERN_SHARED_DEVICES`                    | `OUTSIDE_OPERATIONAL_CLASS` | `SECONDARY_ADMINISTRATIVE`     | `OUTSIDE_SUPERVISION_CLASS`  | `NONE`                     | No existe vigilancia dominante sobre múltiples casos, personas, recursos, compromisos o desviaciones; la pantalla continuará hacia las clases posteriores.                                                                                                                                      |
| `VSCREEN-0023` | Riesgos de seguridad y salud                          | `viso`     | `VPROC-0012::STEP-ASSESS_SST_RISK`                          | `OUTSIDE_OPERATIONAL_CLASS` | `PRIMARY_ADMINISTRATIVE`       | `SECONDARY_SUPERVISION`      | `SUPERVISION_RISK`         | La pantalla vigila exposición, continuidad y tratamientos de riesgo, pero su intención primaria ya es operativa o administrativa. Conserva supervisión secundaria sin duplicar la ejecución, el expediente ni la fuente de verdad.                                                              |
| `VSCREEN-0024` | Incidentes y emergencias                              | `viso`     | `VPROC-0013::STEP-MANAGE_INCIDENT_RESPONSE`                 | `SECONDARY_OPERATIONAL`     | `PRIMARY_ADMINISTRATIVE`       | `SECONDARY_SUPERVISION`      | `SUPERVISION_EXCEPTION`    | La pantalla concentra desvíos, diferencias, rechazos, retornos o correcciones, pero su intención primaria ya es operativa o administrativa. Conserva supervisión secundaria sin duplicar la ejecución, el expediente ni la fuente de verdad.                                                    |
| `VSCREEN-0025` | Controles de higiene y cumplimiento                   | `viso`     | `VPROC-0014::STEP-REVIEW_HYGIENE_COMPLIANCE`                | `SECONDARY_OPERATIONAL`     | `SECONDARY_ADMINISTRATIVE`     | `PRIMARY_SUPERVISION`        | `SUPERVISION_COMPLIANCE`   | La intención dominante vigila controles, obligaciones y hallazgos que requieren seguimiento. La pantalla permite comprender el estado de trabajo ajeno o agregado, detectar desvíos y orientar intervención sin convertirse en el espacio principal de ejecución o backoffice.                  |
| `VSCREEN-0026` | Bandeja de casos administrativos transversales        | `viso`     | `VPROC-0004::STEP-TRIAGE_ADMIN_CASES`                       | `SECONDARY_OPERATIONAL`     | `PRIMARY_ADMINISTRATIVE`       | `SECONDARY_SUPERVISION`      | `SUPERVISION_QUEUE`        | La pantalla presenta trabajo pendiente y permite priorizar, distribuir o escalar, pero su intención primaria ya es operativa o administrativa. Conserva supervisión secundaria sin duplicar la ejecución, el expediente ni la fuente de verdad.                                                 |
| `VSCREEN-0027` | Inicio personal del trabajador                        | `anima`    | `VPROC-0007::STEP-ENTER_PERSONAL_WORKSPACE`                 | `OUTSIDE_OPERATIONAL_CLASS` | `OUTSIDE_ADMINISTRATIVE_CLASS` | `OUTSIDE_SUPERVISION_CLASS`  | `NONE`                     | Autoservicio personal del trabajador; consulta o registra su propio caso sin supervisar a terceros. Su clase primaria se resolverá en PROC-SCREEN-010.                                                                                                                                          |
| `VSCREEN-0028` | Registro de entrada, pausa y salida                   | `anima`    | `VPROC-0008::STEP-CAPTURE_ATTENDANCE_EVENT`                 | `PRIMARY_OPERATIONAL`       | `OUTSIDE_ADMINISTRATIVE_CLASS` | `OUTSIDE_SUPERVISION_CLASS`  | `NONE`                     | Autoservicio personal del trabajador; consulta o registra su propio caso sin supervisar a terceros. Su clase primaria se resolverá en PROC-SCREEN-010.                                                                                                                                          |
| `VSCREEN-0029` | Mi programación                                       | `anima`    | `VPROC-0007::STEP-CONSULT_PUBLISHED_SCHEDULE`               | `SECONDARY_OPERATIONAL`     | `OUTSIDE_ADMINISTRATIVE_CLASS` | `OUTSIDE_SUPERVISION_CLASS`  | `NONE`                     | Autoservicio personal del trabajador; consulta o registra su propio caso sin supervisar a terceros. Su clase primaria se resolverá en PROC-SCREEN-010.                                                                                                                                          |
| `VSCREEN-0030` | Mi asistencia y solicitud de corrección               | `anima`    | `VPROC-0008::STEP-CONSULT_OR_REQUEST_ATTENDANCE_CORRECTION` | `SECONDARY_OPERATIONAL`     | `OUTSIDE_ADMINISTRATIVE_CLASS` | `OUTSIDE_SUPERVISION_CLASS`  | `NONE`                     | Autoservicio personal del trabajador; consulta o registra su propio caso sin supervisar a terceros. Su clase primaria se resolverá en PROC-SCREEN-010.                                                                                                                                          |
| `VSCREEN-0031` | Mis novedades, permisos y ausencias                   | `anima`    | `VPROC-0009::STEP-SUBMIT_PERSONAL_WORKFORCE_CASE`           | `SECONDARY_OPERATIONAL`     | `OUTSIDE_ADMINISTRATIVE_CLASS` | `OUTSIDE_SUPERVISION_CLASS`  | `NONE`                     | Autoservicio personal del trabajador; consulta o registra su propio caso sin supervisar a terceros. Su clase primaria se resolverá en PROC-SCREEN-010.                                                                                                                                          |
| `VSCREEN-0032` | Mi perfil laboral                                     | `anima`    | `VPROC-0006::STEP-MAINTAIN_SELF_SERVICE_PROFILE`            | `OUTSIDE_OPERATIONAL_CLASS` | `OUTSIDE_ADMINISTRATIVE_CLASS` | `OUTSIDE_SUPERVISION_CLASS`  | `NONE`                     | Autoservicio personal del trabajador; consulta o registra su propio caso sin supervisar a terceros. Su clase primaria se resolverá en PROC-SCREEN-010.                                                                                                                                          |
| `VSCREEN-0033` | Resumen de inventario y abastecimiento interno        | `nexo`     | `VPROC-0028::STEP-MONITOR_INTERNAL_SUPPLY`                  | `SECONDARY_OPERATIONAL`     | `SECONDARY_ADMINISTRATIVE`     | `PRIMARY_SUPERVISION`        | `SUPERVISION_DASHBOARD`    | La intención dominante consolida señales, carga, desviaciones y prioridades para orientar intervención. La pantalla permite comprender el estado de trabajo ajeno o agregado, detectar desvíos y orientar intervención sin convertirse en el espacio principal de ejecución o backoffice.       |
| `VSCREEN-0034` | Catálogo de productos físicos                         | `nexo`     | `VPROC-0015::STEP-CONSULT_PHYSICAL_PRODUCT_CATALOG`         | `SECONDARY_OPERATIONAL`     | `SECONDARY_ADMINISTRATIVE`     | `OUTSIDE_SUPERVISION_CLASS`  | `NONE`                     | La intención dominante es mantener maestros, reglas, políticas o plantillas; la posible clase de configuración se resolverá en PROC-SCREEN-008.                                                                                                                                                 |
| `VSCREEN-0035` | Editor de producto, unidad y presentación             | `nexo`     | `VPROC-0015::STEP-MAINTAIN_PRODUCT_PRESENTATION`            | `OUTSIDE_OPERATIONAL_CLASS` | `SECONDARY_ADMINISTRATIVE`     | `OUTSIDE_SUPERVISION_CLASS`  | `NONE`                     | La intención dominante es mantener maestros, reglas, políticas o plantillas; la posible clase de configuración se resolverá en PROC-SCREEN-008.                                                                                                                                                 |
| `VSCREEN-0036` | Especificaciones y criterios de calidad               | `nexo`     | `VPROC-0018::STEP-MAINTAIN_QUALITY_SPECIFICATION`           | `OUTSIDE_OPERATIONAL_CLASS` | `SECONDARY_ADMINISTRATIVE`     | `OUTSIDE_SUPERVISION_CLASS`  | `NONE`                     | No existe vigilancia dominante sobre múltiples casos, personas, recursos, compromisos o desviaciones; la pantalla continuará hacia las clases posteriores.                                                                                                                                      |
| `VSCREEN-0037` | Catálogo de ubicaciones                               | `nexo`     | `VPROC-0023::STEP-MAINTAIN_LOCATION_CATALOG`                | `OUTSIDE_OPERATIONAL_CLASS` | `SECONDARY_ADMINISTRATIVE`     | `OUTSIDE_SUPERVISION_CLASS`  | `NONE`                     | La intención dominante es mantener maestros, reglas, políticas o plantillas; la posible clase de configuración se resolverá en PROC-SCREEN-008.                                                                                                                                                 |
| `VSCREEN-0038` | Identificación y detalle de ubicación                 | `nexo`     | `VPROC-0023::STEP-IDENTIFY_LOCATION_AND_CONTENT`            | `PRIMARY_OPERATIONAL`       | `OUTSIDE_ADMINISTRATIVE_CLASS` | `OUTSIDE_SUPERVISION_CLASS`  | `NONE`                     | No existe vigilancia dominante sobre múltiples casos, personas, recursos, compromisos o desviaciones; la pantalla continuará hacia las clases posteriores.                                                                                                                                      |
| `VSCREEN-0039` | Consulta de existencias                               | `nexo`     | `VPROC-0024::STEP-CONSULT_STOCK_POSITION`                   | `SECONDARY_OPERATIONAL`     | `OUTSIDE_ADMINISTRATIVE_CLASS` | `PRIMARY_SUPERVISION`        | `SUPERVISION_MONITORING`   | La intención dominante sigue casos, recursos o compromisos todavía abiertos. La pantalla permite comprender el estado de trabajo ajeno o agregado, detectar desvíos y orientar intervención sin convertirse en el espacio principal de ejecución o backoffice.                                  |
| `VSCREEN-0040` | Conteo de inventario                                  | `nexo`     | `VPROC-0026::STEP-CAPTURE_PHYSICAL_COUNT`                   | `PRIMARY_OPERATIONAL`       | `OUTSIDE_ADMINISTRATIVE_CLASS` | `OUTSIDE_SUPERVISION_CLASS`  | `NONE`                     | La pantalla ejecuta trabajo operativo directo y no contiene una función independiente de supervisión sobre una población, cola o resultado agregado.                                                                                                                                            |
| `VSCREEN-0041` | Revisión de conteo y diferencias                      | `nexo`     | `VPROC-0026::STEP-REVIEW_COUNT_VARIANCE`                    | `PRIMARY_OPERATIONAL`       | `SECONDARY_ADMINISTRATIVE`     | `SECONDARY_SUPERVISION`      | `SUPERVISION_REVIEW`       | La pantalla contrasta evidencia y determina si el trabajo puede continuar o requiere intervención, pero su intención primaria ya es operativa o administrativa. Conserva supervisión secundaria sin duplicar la ejecución, el expediente ni la fuente de verdad.                                |
| `VSCREEN-0042` | Caso de ajuste de inventario                          | `nexo`     | `VPROC-0026::STEP-DECIDE_INVENTORY_ADJUSTMENT`              | `PRIMARY_OPERATIONAL`       | `SECONDARY_ADMINISTRATIVE`     | `SECONDARY_SUPERVISION`      | `SUPERVISION_EXCEPTION`    | La pantalla concentra desvíos, diferencias, rechazos, retornos o correcciones, pero su intención primaria ya es operativa o administrativa. Conserva supervisión secundaria sin duplicar la ejecución, el expediente ni la fuente de verdad.                                                    |
| `VSCREEN-0043` | Confirmación de entrada a inventario                  | `nexo`     | `VPROC-0024::STEP-CONFIRM_STOCK_ENTRY`                      | `PRIMARY_OPERATIONAL`       | `OUTSIDE_ADMINISTRATIVE_CLASS` | `OUTSIDE_SUPERVISION_CLASS`  | `NONE`                     | La pantalla ejecuta trabajo operativo directo y no contiene una función independiente de supervisión sobre una población, cola o resultado agregado.                                                                                                                                            |
| `VSCREEN-0044` | Retiro y consumo de existencias                       | `nexo`     | `VPROC-0025::STEP-EXECUTE_STOCK_WITHDRAWAL`                 | `PRIMARY_OPERATIONAL`       | `OUTSIDE_ADMINISTRATIVE_CLASS` | `OUTSIDE_SUPERVISION_CLASS`  | `NONE`                     | La pantalla ejecuta trabajo operativo directo y no contiene una función independiente de supervisión sobre una población, cola o resultado agregado.                                                                                                                                            |
| `VSCREEN-0045` | Traslado interno de existencias                       | `nexo`     | `VPROC-0025::STEP-EXECUTE_INTERNAL_TRANSFER`                | `PRIMARY_OPERATIONAL`       | `OUTSIDE_ADMINISTRATIVE_CLASS` | `OUTSIDE_SUPERVISION_CLASS`  | `NONE`                     | La pantalla ejecuta trabajo operativo directo y no contiene una función independiente de supervisión sobre una población, cola o resultado agregado.                                                                                                                                            |
| `VSCREEN-0046` | Solicitud de remisión                                 | `nexo`     | `VPROC-0028::STEP-SUBMIT_REPLENISHMENT_REQUEST`             | `PRIMARY_OPERATIONAL`       | `OUTSIDE_ADMINISTRATIVE_CLASS` | `OUTSIDE_SUPERVISION_CLASS`  | `NONE`                     | La pantalla ejecuta trabajo operativo directo y no contiene una función independiente de supervisión sobre una población, cola o resultado agregado.                                                                                                                                            |
| `VSCREEN-0047` | Preparación de remisión                               | `nexo`     | `VPROC-0028::STEP-PREPARE_REPLENISHMENT`                    | `PRIMARY_OPERATIONAL`       | `OUTSIDE_ADMINISTRATIVE_CLASS` | `OUTSIDE_SUPERVISION_CLASS`  | `NONE`                     | La pantalla ejecuta trabajo operativo directo y no contiene una función independiente de supervisión sobre una población, cola o resultado agregado.                                                                                                                                            |
| `VSCREEN-0048` | Carga y despacho de remisión                          | `nexo`     | `VPROC-0028::STEP-LOAD_AND_DISPATCH_REPLENISHMENT`          | `PRIMARY_OPERATIONAL`       | `OUTSIDE_ADMINISTRATIVE_CLASS` | `OUTSIDE_SUPERVISION_CLASS`  | `NONE`                     | La pantalla ejecuta trabajo operativo directo y no contiene una función independiente de supervisión sobre una población, cola o resultado agregado.                                                                                                                                            |
| `VSCREEN-0049` | Seguimiento de remisión en tránsito                   | `nexo`     | `VPROC-0028::STEP-MONITOR_REPLENISHMENT_TRANSIT`            | `PRIMARY_OPERATIONAL`       | `OUTSIDE_ADMINISTRATIVE_CLASS` | `SECONDARY_SUPERVISION`      | `SUPERVISION_MONITORING`   | La pantalla sigue casos, recursos o compromisos todavía abiertos, pero su intención primaria ya es operativa o administrativa. Conserva supervisión secundaria sin duplicar la ejecución, el expediente ni la fuente de verdad.                                                                 |
| `VSCREEN-0050` | Recepción de remisión                                 | `nexo`     | `VPROC-0028::STEP-RECEIVE_REPLENISHMENT`                    | `PRIMARY_OPERATIONAL`       | `OUTSIDE_ADMINISTRATIVE_CLASS` | `SECONDARY_SUPERVISION`      | `SUPERVISION_CONTROL`      | La pantalla verifica coherencia, cumplimiento o resultado de un ciclo activo, pero su intención primaria ya es operativa o administrativa. Conserva supervisión secundaria sin duplicar la ejecución, el expediente ni la fuente de verdad.                                                     |
| `VSCREEN-0051` | Vencimiento, cuarentena, daño y merma                 | `nexo`     | `VPROC-0027::STEP-RESOLVE_STOCK_CONDITION`                  | `PRIMARY_OPERATIONAL`       | `SECONDARY_ADMINISTRATIVE`     | `SECONDARY_SUPERVISION`      | `SUPERVISION_EXCEPTION`    | La pantalla concentra desvíos, diferencias, rechazos, retornos o correcciones, pero su intención primaria ya es operativa o administrativa. Conserva supervisión secundaria sin duplicar la ejecución, el expediente ni la fuente de verdad.                                                    |
| `VSCREEN-0052` | LPN, contenedores y reutilizables                     | `nexo`     | `VPROC-0032::STEP-MANAGE_LPN_AND_REUSABLES`                 | `PRIMARY_OPERATIONAL`       | `OUTSIDE_ADMINISTRATIVE_CLASS` | `OUTSIDE_SUPERVISION_CLASS`  | `NONE`                     | La pantalla ejecuta trabajo operativo directo y no contiene una función independiente de supervisión sobre una población, cola o resultado agregado.                                                                                                                                            |
| `VSCREEN-0053` | Activos y custodia                                    | `nexo`     | `VPROC-0029::STEP-MANAGE_ASSET_CUSTODY`                     | `PRIMARY_OPERATIONAL`       | `SECONDARY_ADMINISTRATIVE`     | `SECONDARY_SUPERVISION`      | `SUPERVISION_MONITORING`   | La pantalla sigue casos, recursos o compromisos todavía abiertos, pero su intención primaria ya es operativa o administrativa. Conserva supervisión secundaria sin duplicar la ejecución, el expediente ni la fuente de verdad.                                                                 |
| `VSCREEN-0054` | Etiquetas e impresión logística                       | `nexo`     | `VPROC-0024::STEP-ISSUE_LOGISTICS_LABEL`                    | `PRIMARY_OPERATIONAL`       | `OUTSIDE_ADMINISTRATIVE_CLASS` | `OUTSIDE_SUPERVISION_CLASS`  | `NONE`                     | La pantalla ejecuta trabajo operativo directo y no contiene una función independiente de supervisión sobre una población, cola o resultado agregado.                                                                                                                                            |
| `VSCREEN-0055` | Inicio y cola de producción                           | `fogo`     | `VPROC-0033::STEP-TRIAGE_PRODUCTION_QUEUE`                  | `SECONDARY_OPERATIONAL`     | `SECONDARY_ADMINISTRATIVE`     | `PRIMARY_SUPERVISION`        | `SUPERVISION_QUEUE`        | La intención dominante presenta trabajo pendiente y permite priorizar, distribuir o escalar. La pantalla permite comprender el estado de trabajo ajeno o agregado, detectar desvíos y orientar intervención sin convertirse en el espacio principal de ejecución o backoffice.                  |
| `VSCREEN-0056` | Planeación de producción                              | `fogo`     | `VPROC-0033::STEP-PLAN_PRODUCTION`                          | `SECONDARY_OPERATIONAL`     | `SECONDARY_ADMINISTRATIVE`     | `PRIMARY_SUPERVISION`        | `SUPERVISION_CAPACITY`     | La intención dominante equilibra demanda, capacidad, programación o disponibilidad. La pantalla permite comprender el estado de trabajo ajeno o agregado, detectar desvíos y orientar intervención sin convertirse en el espacio principal de ejecución o backoffice.                           |
| `VSCREEN-0057` | Preparación e inicio de lote                          | `fogo`     | `VPROC-0034::STEP-PREPARE_AND_START_BATCH`                  | `PRIMARY_OPERATIONAL`       | `OUTSIDE_ADMINISTRATIVE_CLASS` | `OUTSIDE_SUPERVISION_CLASS`  | `NONE`                     | La pantalla ejecuta trabajo operativo directo y no contiene una función independiente de supervisión sobre una población, cola o resultado agregado.                                                                                                                                            |
| `VSCREEN-0058` | Ejecución de lote                                     | `fogo`     | `VPROC-0034::STEP-EXECUTE_BATCH`                            | `PRIMARY_OPERATIONAL`       | `OUTSIDE_ADMINISTRATIVE_CLASS` | `OUTSIDE_SUPERVISION_CLASS`  | `NONE`                     | La pantalla ejecuta trabajo operativo directo y no contiene una función independiente de supervisión sobre una población, cola o resultado agregado.                                                                                                                                            |
| `VSCREEN-0059` | Registro parcial de producción                        | `fogo`     | `VPROC-0034::STEP-CAPTURE_BATCH_PROGRESS`                   | `PRIMARY_OPERATIONAL`       | `OUTSIDE_ADMINISTRATIVE_CLASS` | `SECONDARY_SUPERVISION`      | `SUPERVISION_MONITORING`   | La pantalla sigue casos, recursos o compromisos todavía abiertos, pero su intención primaria ya es operativa o administrativa. Conserva supervisión secundaria sin duplicar la ejecución, el expediente ni la fuente de verdad.                                                                 |
| `VSCREEN-0060` | Finalización y cierre de lote                         | `fogo`     | `VPROC-0037::STEP-CLOSE_BATCH`                              | `PRIMARY_OPERATIONAL`       | `OUTSIDE_ADMINISTRATIVE_CLASS` | `SECONDARY_SUPERVISION`      | `SUPERVISION_PERFORMANCE`  | La pantalla evalúa resultados, tendencias, variaciones y planes de mejora, pero su intención primaria ya es operativa o administrativa. Conserva supervisión secundaria sin duplicar la ejecución, el expediente ni la fuente de verdad.                                                        |
| `VSCREEN-0061` | Receta operativa                                      | `fogo`     | `VPROC-0016::STEP-CONSULT_APPLICABLE_RECIPE`                | `PRIMARY_OPERATIONAL`       | `OUTSIDE_ADMINISTRATIVE_CLASS` | `OUTSIDE_SUPERVISION_CLASS`  | `NONE`                     | Guía la ejecución del lote activo; no vigila una población, cola o resultado agregado.                                                                                                                                                                                                          |
| `VSCREEN-0062` | Catálogo y editor de recetas                          | `fogo`     | `VPROC-0016::STEP-AUTHOR_RECIPE`                            | `OUTSIDE_OPERATIONAL_CLASS` | `SECONDARY_ADMINISTRATIVE`     | `OUTSIDE_SUPERVISION_CLASS`  | `NONE`                     | La intención dominante es mantener maestros, reglas, políticas o plantillas; la posible clase de configuración se resolverá en PROC-SCREEN-008.                                                                                                                                                 |
| `VSCREEN-0063` | Revisión, aprobación y publicación de receta          | `fogo`     | `VPROC-0016::STEP-APPROVE_AND_PUBLISH_RECIPE`               | `OUTSIDE_OPERATIONAL_CLASS` | `SECONDARY_ADMINISTRATIVE`     | `OUTSIDE_SUPERVISION_CLASS`  | `NONE`                     | No existe vigilancia dominante sobre múltiples casos, personas, recursos, compromisos o desviaciones; la pantalla continuará hacia las clases posteriores.                                                                                                                                      |
| `VSCREEN-0064` | Prueba de receta y rendimiento                        | `fogo`     | `VPROC-0016::STEP-TEST_RECIPE_AND_YIELD`                    | `PRIMARY_OPERATIONAL`       | `SECONDARY_ADMINISTRATIVE`     | `SECONDARY_SUPERVISION`      | `SUPERVISION_REVIEW`       | La pantalla contrasta evidencia y determina si el trabajo puede continuar o requiere intervención, pero su intención primaria ya es operativa o administrativa. Conserva supervisión secundaria sin duplicar la ejecución, el expediente ni la fuente de verdad.                                |
| `VSCREEN-0065` | Control de calidad y liberación                       | `fogo`     | `VPROC-0035::STEP-DECIDE_QUALITY_RELEASE`                   | `PRIMARY_OPERATIONAL`       | `SECONDARY_ADMINISTRATIVE`     | `SECONDARY_SUPERVISION`      | `SUPERVISION_CONTROL`      | La pantalla verifica coherencia, cumplimiento o resultado de un ciclo activo, pero su intención primaria ya es operativa o administrativa. Conserva supervisión secundaria sin duplicar la ejecución, el expediente ni la fuente de verdad.                                                     |
| `VSCREEN-0066` | Empaque, etiquetado y almacenamiento de terminado     | `fogo`     | `VPROC-0036::STEP-PACK_AND_TRANSFER_FINISHED_GOOD`          | `PRIMARY_OPERATIONAL`       | `OUTSIDE_ADMINISTRATIVE_CLASS` | `OUTSIDE_SUPERVISION_CLASS`  | `NONE`                     | La pantalla ejecuta trabajo operativo directo y no contiene una función independiente de supervisión sobre una población, cola o resultado agregado.                                                                                                                                            |
| `VSCREEN-0067` | Reproceso, aprovechamiento, merma y cierre productivo | `fogo`     | `VPROC-0037::STEP-RESOLVE_PRODUCTION_DISPOSITION`           | `PRIMARY_OPERATIONAL`       | `SECONDARY_ADMINISTRATIVE`     | `SECONDARY_SUPERVISION`      | `SUPERVISION_EXCEPTION`    | La pantalla concentra desvíos, diferencias, rechazos, retornos o correcciones, pero su intención primaria ya es operativa o administrativa. Conserva supervisión secundaria sin duplicar la ejecución, el expediente ni la fuente de verdad.                                                    |
| `VSCREEN-0068` | Bandeja de necesidades de compra                      | `origo`    | `VPROC-0019::STEP-TRIAGE_PURCHASE_NEEDS`                    | `SECONDARY_OPERATIONAL`     | `PRIMARY_ADMINISTRATIVE`       | `SECONDARY_SUPERVISION`      | `SUPERVISION_QUEUE`        | La pantalla presenta trabajo pendiente y permite priorizar, distribuir o escalar, pero su intención primaria ya es operativa o administrativa. Conserva supervisión secundaria sin duplicar la ejecución, el expediente ni la fuente de verdad.                                                 |
| `VSCREEN-0069` | Solicitud de compra                                   | `origo`    | `VPROC-0019::STEP-SUBMIT_PURCHASE_REQUEST`                  | `OUTSIDE_OPERATIONAL_CLASS` | `PRIMARY_ADMINISTRATIVE`       | `OUTSIDE_SUPERVISION_CLASS`  | `NONE`                     | La pantalla administra un expediente, caso, obligación o recurso concreto; no predomina la supervisión transversal o agregada.                                                                                                                                                                  |
| `VSCREEN-0070` | Catálogo de proveedores                               | `origo`    | `VPROC-0020::STEP-CONSULT_SUPPLIER_CATALOG`                 | `OUTSIDE_OPERATIONAL_CLASS` | `SECONDARY_ADMINISTRATIVE`     | `OUTSIDE_SUPERVISION_CLASS`  | `NONE`                     | La intención dominante es mantener maestros, reglas, políticas o plantillas; la posible clase de configuración se resolverá en PROC-SCREEN-008.                                                                                                                                                 |
| `VSCREEN-0071` | Alta y expediente de proveedor                        | `origo`    | `VPROC-0020::STEP-ONBOARD_SUPPLIER`                         | `OUTSIDE_OPERATIONAL_CLASS` | `PRIMARY_ADMINISTRATIVE`       | `OUTSIDE_SUPERVISION_CLASS`  | `NONE`                     | La pantalla administra un expediente, caso, obligación o recurso concreto; no predomina la supervisión transversal o agregada.                                                                                                                                                                  |
| `VSCREEN-0072` | Comparación de cotizaciones                           | `origo`    | `VPROC-0020::STEP-COMPARE_QUOTES`                           | `OUTSIDE_OPERATIONAL_CLASS` | `PRIMARY_ADMINISTRATIVE`       | `OUTSIDE_SUPERVISION_CLASS`  | `NONE`                     | La pantalla administra un expediente, caso, obligación o recurso concreto; no predomina la supervisión transversal o agregada.                                                                                                                                                                  |
| `VSCREEN-0073` | Editor de orden de compra                             | `origo`    | `VPROC-0021::STEP-PREPARE_PURCHASE_ORDER`                   | `OUTSIDE_OPERATIONAL_CLASS` | `PRIMARY_ADMINISTRATIVE`       | `OUTSIDE_SUPERVISION_CLASS`  | `NONE`                     | La intención dominante es mantener maestros, reglas, políticas o plantillas; la posible clase de configuración se resolverá en PROC-SCREEN-008.                                                                                                                                                 |
| `VSCREEN-0074` | Bandeja de aprobaciones de compra                     | `origo`    | `VPROC-0021::STEP-APPROVE_PURCHASE`                         | `OUTSIDE_OPERATIONAL_CLASS` | `PRIMARY_ADMINISTRATIVE`       | `SECONDARY_SUPERVISION`      | `SUPERVISION_REVIEW`       | La pantalla contrasta evidencia y determina si el trabajo puede continuar o requiere intervención, pero su intención primaria ya es operativa o administrativa. Conserva supervisión secundaria sin duplicar la ejecución, el expediente ni la fuente de verdad.                                |
| `VSCREEN-0075` | Detalle y seguimiento de orden                        | `origo`    | `VPROC-0021::STEP-MONITOR_PURCHASE_ORDER`                   | `SECONDARY_OPERATIONAL`     | `PRIMARY_ADMINISTRATIVE`       | `SECONDARY_SUPERVISION`      | `SUPERVISION_MONITORING`   | La pantalla sigue casos, recursos o compromisos todavía abiertos, pero su intención primaria ya es operativa o administrativa. Conserva supervisión secundaria sin duplicar la ejecución, el expediente ni la fuente de verdad.                                                                 |
| `VSCREEN-0076` | Cola de recepciones                                   | `origo`    | `VPROC-0022::STEP-TRIAGE_RECEIPT_QUEUE`                     | `SECONDARY_OPERATIONAL`     | `SECONDARY_ADMINISTRATIVE`     | `PRIMARY_SUPERVISION`        | `SUPERVISION_QUEUE`        | La intención dominante presenta trabajo pendiente y permite priorizar, distribuir o escalar. La pantalla permite comprender el estado de trabajo ajeno o agregado, detectar desvíos y orientar intervención sin convertirse en el espacio principal de ejecución o backoffice.                  |
| `VSCREEN-0077` | Recepción total o parcial                             | `origo`    | `VPROC-0022::STEP-RECEIVE_PURCHASE`                         | `PRIMARY_OPERATIONAL`       | `SECONDARY_ADMINISTRATIVE`     | `SECONDARY_SUPERVISION`      | `SUPERVISION_CONTROL`      | La pantalla verifica coherencia, cumplimiento o resultado de un ciclo activo, pero su intención primaria ya es operativa o administrativa. Conserva supervisión secundaria sin duplicar la ejecución, el expediente ni la fuente de verdad.                                                     |
| `VSCREEN-0078` | Resolución de diferencias de recepción                | `origo`    | `VPROC-0022::STEP-RESOLVE_RECEIPT_VARIANCE`                 | `PRIMARY_OPERATIONAL`       | `SECONDARY_ADMINISTRATIVE`     | `SECONDARY_SUPERVISION`      | `SUPERVISION_EXCEPTION`    | La pantalla concentra desvíos, diferencias, rechazos, retornos o correcciones, pero su intención primaria ya es operativa o administrativa. Conserva supervisión secundaria sin duplicar la ejecución, el expediente ni la fuente de verdad.                                                    |
| `VSCREEN-0079` | Historial y auditoría de abastecimiento               | `origo`    | `VPROC-0022::STEP-AUDIT_PROCUREMENT_CYCLE`                  | `OUTSIDE_OPERATIONAL_CLASS` | `SECONDARY_ADMINISTRATIVE`     | `OUTSIDE_SUPERVISION_CLASS`  | `NONE`                     | La intención dominante es reconstrucción histórica, evidencia o auditoría; la clase correspondiente se resolverá en PROC-SCREEN-009.                                                                                                                                                            |
| `VSCREEN-0080` | Inicio POS                                            | `pulso`    | `VPROC-0039::STEP-ENTER_POS_WORKSPACE`                      | `PRIMARY_OPERATIONAL`       | `OUTSIDE_ADMINISTRATIVE_CLASS` | `SECONDARY_SUPERVISION`      | `SUPERVISION_DASHBOARD`    | Puede mostrar señales de la estación como apoyo, pero su intención primaria es entrar al trabajo operativo vivo.                                                                                                                                                                                |
| `VSCREEN-0081` | Creación de venta o pedido                            | `pulso`    | `VPROC-0039::STEP-CREATE_SALE_OR_ORDER`                     | `PRIMARY_OPERATIONAL`       | `OUTSIDE_ADMINISTRATIVE_CLASS` | `OUTSIDE_SUPERVISION_CLASS`  | `NONE`                     | La pantalla ejecuta trabajo operativo directo y no contiene una función independiente de supervisión sobre una población, cola o resultado agregado.                                                                                                                                            |
| `VSCREEN-0082` | Mapa de salón y mesas                                 | `pulso`    | `VPROC-0038::STEP-MANAGE_TABLE_SERVICE`                     | `PRIMARY_OPERATIONAL`       | `OUTSIDE_ADMINISTRATIVE_CLASS` | `SECONDARY_SUPERVISION`      | `SUPERVISION_MONITORING`   | La pantalla sigue casos, recursos o compromisos todavía abiertos, pero su intención primaria ya es operativa o administrativa. Conserva supervisión secundaria sin duplicar la ejecución, el expediente ni la fuente de verdad.                                                                 |
| `VSCREEN-0083` | Detalle y modificación de pedido                      | `pulso`    | `VPROC-0038::STEP-MODIFY_ACTIVE_ORDER`                      | `PRIMARY_OPERATIONAL`       | `OUTSIDE_ADMINISTRATIVE_CLASS` | `OUTSIDE_SUPERVISION_CLASS`  | `NONE`                     | La pantalla ejecuta trabajo operativo directo y no contiene una función independiente de supervisión sobre una población, cola o resultado agregado.                                                                                                                                            |
| `VSCREEN-0084` | Cobro y medios de pago                                | `pulso`    | `VPROC-0043::STEP-COLLECT_PAYMENT`                          | `PRIMARY_OPERATIONAL`       | `OUTSIDE_ADMINISTRATIVE_CLASS` | `OUTSIDE_SUPERVISION_CLASS`  | `NONE`                     | La pantalla ejecuta trabajo operativo directo y no contiene una función independiente de supervisión sobre una población, cola o resultado agregado.                                                                                                                                            |
| `VSCREEN-0085` | Identificación de cliente y acumulación               | `pulso`    | `VPROC-0045::STEP-IDENTIFY_CUSTOMER_AND_ACCRUE`             | `PRIMARY_OPERATIONAL`       | `OUTSIDE_ADMINISTRATIVE_CLASS` | `OUTSIDE_SUPERVISION_CLASS`  | `NONE`                     | La pantalla ejecuta trabajo operativo directo y no contiene una función independiente de supervisión sobre una población, cola o resultado agregado.                                                                                                                                            |
| `VSCREEN-0086` | Redención de puntos o beneficios                      | `pulso`    | `VPROC-0045::STEP-REDEEM_LOYALTY_VALUE`                     | `PRIMARY_OPERATIONAL`       | `OUTSIDE_ADMINISTRATIVE_CLASS` | `OUTSIDE_SUPERVISION_CLASS`  | `NONE`                     | La pantalla ejecuta trabajo operativo directo y no contiene una función independiente de supervisión sobre una población, cola o resultado agregado.                                                                                                                                            |
| `VSCREEN-0087` | Bandeja de pedidos de canales externos                | `pulso`    | `VPROC-0040::STEP-ADMIT_EXTERNAL_ORDER`                     | `PRIMARY_OPERATIONAL`       | `OUTSIDE_ADMINISTRATIVE_CLASS` | `SECONDARY_SUPERVISION`      | `SUPERVISION_QUEUE`        | La pantalla presenta trabajo pendiente y permite priorizar, distribuir o escalar, pero su intención primaria ya es operativa o administrativa. Conserva supervisión secundaria sin duplicar la ejecución, el expediente ni la fuente de verdad.                                                 |
| `VSCREEN-0088` | Seguimiento de preparación y entrega                  | `pulso`    | `VPROC-0039::STEP-MONITOR_ORDER_FULFILLMENT`                | `PRIMARY_OPERATIONAL`       | `OUTSIDE_ADMINISTRATIVE_CLASS` | `SECONDARY_SUPERVISION`      | `SUPERVISION_MONITORING`   | La pantalla sigue casos, recursos o compromisos todavía abiertos, pero su intención primaria ya es operativa o administrativa. Conserva supervisión secundaria sin duplicar la ejecución, el expediente ni la fuente de verdad.                                                                 |
| `VSCREEN-0089` | Apertura de caja                                      | `pulso`    | `VPROC-0044::STEP-OPEN_CASH_SESSION`                        | `PRIMARY_OPERATIONAL`       | `OUTSIDE_ADMINISTRATIVE_CLASS` | `OUTSIDE_SUPERVISION_CLASS`  | `NONE`                     | La pantalla ejecuta trabajo operativo directo y no contiene una función independiente de supervisión sobre una población, cola o resultado agregado.                                                                                                                                            |
| `VSCREEN-0090` | Cierre de caja                                        | `pulso`    | `VPROC-0044::STEP-CLOSE_CASH_SESSION`                       | `PRIMARY_OPERATIONAL`       | `SECONDARY_ADMINISTRATIVE`     | `SECONDARY_SUPERVISION`      | `SUPERVISION_REVIEW`       | La pantalla contrasta evidencia y determina si el trabajo puede continuar o requiere intervención, pero su intención primaria ya es operativa o administrativa. Conserva supervisión secundaria sin duplicar la ejecución, el expediente ni la fuente de verdad.                                |
| `VSCREEN-0091` | Anulación, devolución y reembolso                     | `pulso`    | `VPROC-0042::STEP-RESOLVE_REVERSAL_OR_REFUND`               | `PRIMARY_OPERATIONAL`       | `SECONDARY_ADMINISTRATIVE`     | `SECONDARY_SUPERVISION`      | `SUPERVISION_EXCEPTION`    | La pantalla concentra desvíos, diferencias, rechazos, retornos o correcciones, pero su intención primaria ya es operativa o administrativa. Conserva supervisión secundaria sin duplicar la ejecución, el expediente ni la fuente de verdad.                                                    |
| `VSCREEN-0092` | Oferta, menú, precio comercial y disponibilidad       | `pulso`    | `VPROC-0017::STEP-PUBLISH_COMMERCIAL_OFFER`                 | `OUTSIDE_OPERATIONAL_CLASS` | `SECONDARY_ADMINISTRATIVE`     | `OUTSIDE_SUPERVISION_CLASS`  | `NONE`                     | No existe vigilancia dominante sobre múltiples casos, personas, recursos, compromisos o desviaciones; la pantalla continuará hacia las clases posteriores.                                                                                                                                      |
| `VSCREEN-0093` | Revisión de ventas, caja y terminales                 | `pulso`    | `VPROC-0044::STEP-REVIEW_SALES_AND_TERMINALS`               | `SECONDARY_OPERATIONAL`     | `SECONDARY_ADMINISTRATIVE`     | `PRIMARY_SUPERVISION`        | `SUPERVISION_CONTROL`      | La intención dominante verifica coherencia, cumplimiento o resultado de un ciclo activo. La pantalla permite comprender el estado de trabajo ajeno o agregado, detectar desvíos y orientar intervención sin convertirse en el espacio principal de ejecución o backoffice.                      |
| `VSCREEN-0094` | Inicio financiero y ejecutivo                         | `numera`   | `VPROC-0061::STEP-REVIEW_FINANCIAL_POSITION`                | `OUTSIDE_OPERATIONAL_CLASS` | `SECONDARY_ADMINISTRATIVE`     | `PRIMARY_SUPERVISION`        | `SUPERVISION_DASHBOARD`    | La intención dominante consolida señales, carga, desviaciones y prioridades para orientar intervención. La pantalla permite comprender el estado de trabajo ajeno o agregado, detectar desvíos y orientar intervención sin convertirse en el espacio principal de ejecución o backoffice.       |
| `VSCREEN-0095` | Bandeja de hechos económicos                          | `numera`   | `VPROC-0051::STEP-TRIAGE_ECONOMIC_FACTS`                    | `OUTSIDE_OPERATIONAL_CLASS` | `PRIMARY_ADMINISTRATIVE`       | `OUTSIDE_SUPERVISION_CLASS`  | `NONE`                     | La pantalla administra un expediente, caso, obligación o recurso concreto; no predomina la supervisión transversal o agregada.                                                                                                                                                                  |
| `VSCREEN-0096` | Registro de gasto y soporte                           | `numera`   | `VPROC-0051::STEP-CAPTURE_EXPENSE_AND_EVIDENCE`             | `OUTSIDE_OPERATIONAL_CLASS` | `PRIMARY_ADMINISTRATIVE`       | `OUTSIDE_SUPERVISION_CLASS`  | `NONE`                     | La pantalla administra un expediente, caso, obligación o recurso concreto; no predomina la supervisión transversal o agregada.                                                                                                                                                                  |
| `VSCREEN-0097` | Bandeja de aprobaciones financieras                   | `numera`   | `VPROC-0052::STEP-APPROVE_FINANCIAL_DECISION`               | `OUTSIDE_OPERATIONAL_CLASS` | `PRIMARY_ADMINISTRATIVE`       | `SECONDARY_SUPERVISION`      | `SUPERVISION_REVIEW`       | La pantalla contrasta evidencia y determina si el trabajo puede continuar o requiere intervención, pero su intención primaria ya es operativa o administrativa. Conserva supervisión secundaria sin duplicar la ejecución, el expediente ni la fuente de verdad.                                |
| `VSCREEN-0098` | Cuentas por pagar y obligaciones                      | `numera`   | `VPROC-0052::STEP-MANAGE_PAYABLE_OBLIGATION`                | `OUTSIDE_OPERATIONAL_CLASS` | `PRIMARY_ADMINISTRATIVE`       | `OUTSIDE_SUPERVISION_CLASS`  | `NONE`                     | La pantalla administra un expediente, caso, obligación o recurso concreto; no predomina la supervisión transversal o agregada.                                                                                                                                                                  |
| `VSCREEN-0099` | Cuentas por cobrar y cartera                          | `numera`   | `VPROC-0053::STEP-MANAGE_RECEIVABLE`                        | `OUTSIDE_OPERATIONAL_CLASS` | `PRIMARY_ADMINISTRATIVE`       | `OUTSIDE_SUPERVISION_CLASS`  | `NONE`                     | La pantalla administra un expediente, caso, obligación o recurso concreto; no predomina la supervisión transversal o agregada.                                                                                                                                                                  |
| `VSCREEN-0100` | Caja, bancos y movimientos financieros                | `numera`   | `VPROC-0052::STEP-EXECUTE_TREASURY_MOVEMENT`                | `OUTSIDE_OPERATIONAL_CLASS` | `PRIMARY_ADMINISTRATIVE`       | `OUTSIDE_SUPERVISION_CLASS`  | `NONE`                     | La pantalla administra un expediente, caso, obligación o recurso concreto; no predomina la supervisión transversal o agregada.                                                                                                                                                                  |
| `VSCREEN-0101` | Conciliación de ventas y pagos                        | `numera`   | `VPROC-0051::STEP-RECONCILE_SALES_AND_PAYMENTS`             | `OUTSIDE_OPERATIONAL_CLASS` | `PRIMARY_ADMINISTRATIVE`       | `SECONDARY_SUPERVISION`      | `SUPERVISION_CONTROL`      | La pantalla verifica coherencia, cumplimiento o resultado de un ciclo activo, pero su intención primaria ya es operativa o administrativa. Conserva supervisión secundaria sin duplicar la ejecución, el expediente ni la fuente de verdad.                                                     |
| `VSCREEN-0102` | Conciliación de compras y recepciones                 | `numera`   | `VPROC-0051::STEP-RECONCILE_PURCHASES_AND_RECEIPTS`         | `OUTSIDE_OPERATIONAL_CLASS` | `PRIMARY_ADMINISTRATIVE`       | `SECONDARY_SUPERVISION`      | `SUPERVISION_CONTROL`      | La pantalla verifica coherencia, cumplimiento o resultado de un ciclo activo, pero su intención primaria ya es operativa o administrativa. Conserva supervisión secundaria sin duplicar la ejecución, el expediente ni la fuente de verdad.                                                     |
| `VSCREEN-0103` | Conciliación de inventario, producción y variaciones  | `numera`   | `VPROC-0054::STEP-RECONCILE_OPERATING_VARIANCES`            | `OUTSIDE_OPERATIONAL_CLASS` | `PRIMARY_ADMINISTRATIVE`       | `SECONDARY_SUPERVISION`      | `SUPERVISION_CONTROL`      | La pantalla verifica coherencia, cumplimiento o resultado de un ciclo activo, pero su intención primaria ya es operativa o administrativa. Conserva supervisión secundaria sin duplicar la ejecución, el expediente ni la fuente de verdad.                                                     |
| `VSCREEN-0104` | Costos, rentabilidad y escenarios                     | `numera`   | `VPROC-0054::STEP-ANALYZE_COST_AND_PROFITABILITY`           | `OUTSIDE_OPERATIONAL_CLASS` | `PRIMARY_ADMINISTRATIVE`       | `SECONDARY_SUPERVISION`      | `SUPERVISION_PERFORMANCE`  | La pantalla evalúa resultados, tendencias, variaciones y planes de mejora, pero su intención primaria ya es operativa o administrativa. Conserva supervisión secundaria sin duplicar la ejecución, el expediente ni la fuente de verdad.                                                        |
| `VSCREEN-0105` | Cierre, reapertura y corrección de periodo            | `numera`   | `VPROC-0054::STEP-CLOSE_OR_REOPEN_PERIOD`                   | `OUTSIDE_OPERATIONAL_CLASS` | `PRIMARY_ADMINISTRATIVE`       | `SECONDARY_SUPERVISION`      | `SUPERVISION_CONTROL`      | La pantalla verifica coherencia, cumplimiento o resultado de un ciclo activo, pero su intención primaria ya es operativa o administrativa. Conserva supervisión secundaria sin duplicar la ejecución, el expediente ni la fuente de verdad.                                                     |
| `VSCREEN-0106` | Reportes y exportaciones financieras                  | `numera`   | `VPROC-0061::STEP-PUBLISH_FINANCIAL_REPORT`                 | `OUTSIDE_OPERATIONAL_CLASS` | `SECONDARY_ADMINISTRATIVE`     | `OUTSIDE_SUPERVISION_CLASS`  | `NONE`                     | Publica evidencia financiera; su clasificación primaria especializada se reserva para auditoría en PROC-SCREEN-009.                                                                                                                                                                             |
| `VSCREEN-0107` | Inicio del cliente y resumen de beneficios            | `pass`     | `VPROC-0045::STEP-ENTER_LOYALTY_HOME`                       | `OUTSIDE_OPERATIONAL_CLASS` | `OUTSIDE_ADMINISTRATIVE_CLASS` | `OUTSIDE_SUPERVISION_CLASS`  | `NONE`                     | Canal personal de cliente; no supervisa poblaciones, equipos, colas ni resultados internos. Su clase primaria se resolverá en PROC-SCREEN-011.                                                                                                                                                  |
| `VSCREEN-0108` | QR personal de identificación                         | `pass`     | `VPROC-0045::STEP-PRESENT_CUSTOMER_ID`                      | `OUTSIDE_OPERATIONAL_CLASS` | `OUTSIDE_ADMINISTRATIVE_CLASS` | `OUTSIDE_SUPERVISION_CLASS`  | `NONE`                     | Canal personal de cliente; no supervisa poblaciones, equipos, colas ni resultados internos. Su clase primaria se resolverá en PROC-SCREEN-011.                                                                                                                                                  |
| `VSCREEN-0109` | Catálogo de beneficios y recompensas                  | `pass`     | `VPROC-0045::STEP-CONSULT_REWARDS_CATALOG`                  | `OUTSIDE_OPERATIONAL_CLASS` | `OUTSIDE_ADMINISTRATIVE_CLASS` | `OUTSIDE_SUPERVISION_CLASS`  | `NONE`                     | Canal personal de cliente; no supervisa poblaciones, equipos, colas ni resultados internos. Su clase primaria se resolverá en PROC-SCREEN-011.                                                                                                                                                  |
| `VSCREEN-0110` | Ticket o QR de redención                              | `pass`     | `VPROC-0045::STEP-CREATE_REDEMPTION_INTENT`                 | `OUTSIDE_OPERATIONAL_CLASS` | `OUTSIDE_ADMINISTRATIVE_CLASS` | `OUTSIDE_SUPERVISION_CLASS`  | `NONE`                     | Canal personal de cliente; no supervisa poblaciones, equipos, colas ni resultados internos. Su clase primaria se resolverá en PROC-SCREEN-011.                                                                                                                                                  |
| `VSCREEN-0111` | Historial de puntos y redenciones                     | `pass`     | `VPROC-0045::STEP-AUDIT_PERSONAL_LOYALTY_LEDGER`            | `OUTSIDE_OPERATIONAL_CLASS` | `OUTSIDE_ADMINISTRATIVE_CLASS` | `OUTSIDE_SUPERVISION_CLASS`  | `NONE`                     | Canal personal de cliente; no supervisa poblaciones, equipos, colas ni resultados internos. Su clase primaria se resolverá en PROC-SCREEN-011.                                                                                                                                                  |
| `VSCREEN-0112` | Perfil, privacidad y consentimientos                  | `pass`     | `VPROC-0045::STEP-MAINTAIN_CUSTOMER_PROFILE_AND_CONSENT`    | `OUTSIDE_OPERATIONAL_CLASS` | `OUTSIDE_ADMINISTRATIVE_CLASS` | `OUTSIDE_SUPERVISION_CLASS`  | `NONE`                     | Canal personal de cliente; no supervisa poblaciones, equipos, colas ni resultados internos. Su clase primaria se resolverá en PROC-SCREEN-011.                                                                                                                                                  |
| `VSCREEN-0113` | Registro y seguimiento de decisiones empresariales    | `viso`     | `VPROC-0001::STEP-RECORD_AND_TRACK_DECISION`                | `OUTSIDE_OPERATIONAL_CLASS` | `PRIMARY_ADMINISTRATIVE`       | `SECONDARY_SUPERVISION`      | `SUPERVISION_MONITORING`   | La pantalla sigue casos, recursos o compromisos todavía abiertos, pero su intención primaria ya es operativa o administrativa. Conserva supervisión secundaria sin duplicar la ejecución, el expediente ni la fuente de verdad.                                                                 |
| `VSCREEN-0114` | Solicitudes y certificaciones de acceso               | `viso`     | `VPROC-0059::STEP-REVIEW_AND_CERTIFY_ACCESS`                | `OUTSIDE_OPERATIONAL_CLASS` | `PRIMARY_ADMINISTRATIVE`       | `SECONDARY_SUPERVISION`      | `SUPERVISION_QUEUE`        | La pantalla presenta trabajo pendiente y permite priorizar, distribuir o escalar, pero su intención primaria ya es operativa o administrativa. Conserva supervisión secundaria sin duplicar la ejecución, el expediente ni la fuente de verdad.                                                 |
| `VSCREEN-0115` | Gobierno de documentos y evidencia                    | `viso`     | `VPROC-0060::STEP-GOVERN_DOCUMENT_EVIDENCE`                 | `OUTSIDE_OPERATIONAL_CLASS` | `PRIMARY_ADMINISTRATIVE`       | `OUTSIDE_SUPERVISION_CLASS`  | `NONE`                     | La pantalla administra un expediente, caso, obligación o recurso concreto; no predomina la supervisión transversal o agregada.                                                                                                                                                                  |
| `VSCREEN-0116` | Registro de riesgos empresariales                     | `viso`     | `VPROC-0063::STEP-ASSESS_ENTERPRISE_RISK`                   | `OUTSIDE_OPERATIONAL_CLASS` | `PRIMARY_ADMINISTRATIVE`       | `SECONDARY_SUPERVISION`      | `SUPERVISION_RISK`         | La pantalla vigila exposición, continuidad y tratamientos de riesgo, pero su intención primaria ya es operativa o administrativa. Conserva supervisión secundaria sin duplicar la ejecución, el expediente ni la fuente de verdad.                                                              |
| `VSCREEN-0117` | Requerimientos de asesores y autoridades              | `viso`     | `VPROC-0064::STEP-MANAGE_EXTERNAL_REQUIREMENT`              | `OUTSIDE_OPERATIONAL_CLASS` | `PRIMARY_ADMINISTRATIVE`       | `SECONDARY_SUPERVISION`      | `SUPERVISION_COMPLIANCE`   | La pantalla vigila controles, obligaciones y hallazgos que requieren seguimiento, pero su intención primaria ya es operativa o administrativa. Conserva supervisión secundaria sin duplicar la ejecución, el expediente ni la fuente de verdad.                                                 |
| `VSCREEN-0118` | Gestión de desempeño y desarrollo                     | `viso`     | `VPROC-0065::STEP-REVIEW_PERFORMANCE_AND_DEVELOPMENT`       | `OUTSIDE_OPERATIONAL_CLASS` | `PRIMARY_ADMINISTRATIVE`       | `SECONDARY_SUPERVISION`      | `SUPERVISION_PERFORMANCE`  | La pantalla evalúa resultados, tendencias, variaciones y planes de mejora, pero su intención primaria ya es operativa o administrativa. Conserva supervisión secundaria sin duplicar la ejecución, el expediente ni la fuente de verdad.                                                        |
| `VSCREEN-0119` | Asignación y control de elementos de protección       | `viso`     | `VPROC-0066::STEP-ASSIGN_PROTECTIVE_EQUIPMENT`              | `SECONDARY_OPERATIONAL`     | `PRIMARY_ADMINISTRATIVE`       | `SECONDARY_SUPERVISION`      | `SUPERVISION_COMPLIANCE`   | La pantalla vigila controles, obligaciones y hallazgos que requieren seguimiento, pero su intención primaria ya es operativa o administrativa. Conserva supervisión secundaria sin duplicar la ejecución, el expediente ni la fuente de verdad.                                                 |
| `VSCREEN-0120` | Mesa de servicio tecnológico                          | `viso`     | `VPROC-0058::STEP-RESOLVE_TECH_SERVICE_CASE`                | `SECONDARY_OPERATIONAL`     | `PRIMARY_ADMINISTRATIVE`       | `SECONDARY_SUPERVISION`      | `SUPERVISION_SERVICE`      | La pantalla coordina diagnóstico, atención, SLA, recuperación y escalamiento, pero su intención primaria ya es operativa o administrativa. Conserva supervisión secundaria sin duplicar la ejecución, el expediente ni la fuente de verdad.                                                     |
| `VSCREEN-0121` | Continuidad, contingencia y recuperación              | `viso`     | `VPROC-0062::STEP-ACTIVATE_AND_RECOVER_CONTINUITY`          | `SECONDARY_OPERATIONAL`     | `PRIMARY_ADMINISTRATIVE`       | `SECONDARY_SUPERVISION`      | `SUPERVISION_RISK`         | La pantalla vigila exposición, continuidad y tratamientos de riesgo, pero su intención primaria ya es operativa o administrativa. Conserva supervisión secundaria sin duplicar la ejecución, el expediente ni la fuente de verdad.                                                              |
| `VSCREEN-0122` | Privacidad, cumplimiento y conservación               | `viso`     | `VPROC-0060::STEP-GOVERN_PRIVACY_AND_RETENTION`             | `OUTSIDE_OPERATIONAL_CLASS` | `PRIMARY_ADMINISTRATIVE`       | `SECONDARY_SUPERVISION`      | `SUPERVISION_COMPLIANCE`   | La pantalla vigila controles, obligaciones y hallazgos que requieren seguimiento, pero su intención primaria ya es operativa o administrativa. Conserva supervisión secundaria sin duplicar la ejecución, el expediente ni la fuente de verdad.                                                 |
| `VSCREEN-0123` | Gestión de comunicaciones internas                    | `viso`     | `VPROC-0004::STEP-PUBLISH_INTERNAL_COMMUNICATION`           | `OUTSIDE_OPERATIONAL_CLASS` | `PRIMARY_ADMINISTRATIVE`       | `OUTSIDE_SUPERVISION_CLASS`  | `NONE`                     | La pantalla administra un expediente, caso, obligación o recurso concreto; no predomina la supervisión transversal o agregada.                                                                                                                                                                  |
| `VSCREEN-0124` | Mis comunicados laborales                             | `anima`    | `VPROC-0004::STEP-CONSULT_AND_ACKNOWLEDGE_COMMUNICATION`    | `OUTSIDE_OPERATIONAL_CLASS` | `OUTSIDE_ADMINISTRATIVE_CLASS` | `OUTSIDE_SUPERVISION_CLASS`  | `NONE`                     | Autoservicio personal del trabajador; consulta o registra su propio caso sin supervisar a terceros. Su clase primaria se resolverá en PROC-SCREEN-010.                                                                                                                                          |
| `VSCREEN-0125` | Mi carnet laboral                                     | `anima`    | `VPROC-0006::STEP-PRESENT_EMPLOYEE_CREDENTIAL`              | `OUTSIDE_OPERATIONAL_CLASS` | `OUTSIDE_ADMINISTRATIVE_CLASS` | `OUTSIDE_SUPERVISION_CLASS`  | `NONE`                     | Autoservicio personal del trabajador; consulta o registra su propio caso sin supervisar a terceros. Su clase primaria se resolverá en PROC-SCREEN-010.                                                                                                                                          |
| `VSCREEN-0126` | Mis documentos laborales                              | `anima`    | `VPROC-0060::STEP-CONSULT_OR_SUBMIT_EMPLOYMENT_DOCUMENT`    | `OUTSIDE_OPERATIONAL_CLASS` | `OUTSIDE_ADMINISTRATIVE_CLASS` | `OUTSIDE_SUPERVISION_CLASS`  | `NONE`                     | Autoservicio personal del trabajador; consulta o registra su propio caso sin supervisar a terceros. Su clase primaria se resolverá en PROC-SCREEN-010.                                                                                                                                          |
| `VSCREEN-0127` | Mi capacitación                                       | `anima`    | `VPROC-0065::STEP-COMPLETE_ASSIGNED_TRAINING`               | `OUTSIDE_OPERATIONAL_CLASS` | `OUTSIDE_ADMINISTRATIVE_CLASS` | `OUTSIDE_SUPERVISION_CLASS`  | `NONE`                     | Autoservicio personal del trabajador; consulta o registra su propio caso sin supervisar a terceros. Su clase primaria se resolverá en PROC-SCREEN-010.                                                                                                                                          |
| `VSCREEN-0128` | Mis objetivos y retroalimentación                     | `anima`    | `VPROC-0065::STEP-REVIEW_PERSONAL_OBJECTIVES`               | `OUTSIDE_OPERATIONAL_CLASS` | `OUTSIDE_ADMINISTRATIVE_CLASS` | `OUTSIDE_SUPERVISION_CLASS`  | `NONE`                     | Autoservicio personal del trabajador; consulta o registra su propio caso sin supervisar a terceros. Su clase primaria se resolverá en PROC-SCREEN-010.                                                                                                                                          |
| `VSCREEN-0129` | Mis solicitudes de soporte                            | `anima`    | `VPROC-0058::STEP-SUBMIT_AND_TRACK_SUPPORT_REQUEST`         | `SECONDARY_OPERATIONAL`     | `OUTSIDE_ADMINISTRATIVE_CLASS` | `OUTSIDE_SUPERVISION_CLASS`  | `NONE`                     | Autoservicio personal del trabajador; consulta o registra su propio caso sin supervisar a terceros. Su clase primaria se resolverá en PROC-SCREEN-010.                                                                                                                                          |
| `VSCREEN-0130` | Mis reportes de seguridad y salud                     | `anima`    | `VPROC-0013::STEP-REPORT_SST_EVENT`                         | `SECONDARY_OPERATIONAL`     | `OUTSIDE_ADMINISTRATIVE_CLASS` | `OUTSIDE_SUPERVISION_CLASS`  | `NONE`                     | Autoservicio personal del trabajador; consulta o registra su propio caso sin supervisar a terceros. Su clase primaria se resolverá en PROC-SCREEN-010.                                                                                                                                          |
| `VSCREEN-0131` | Mis elementos de protección                           | `anima`    | `VPROC-0066::STEP-ACKNOWLEDGE_PROTECTIVE_EQUIPMENT`         | `SECONDARY_OPERATIONAL`     | `OUTSIDE_ADMINISTRATIVE_CLASS` | `OUTSIDE_SUPERVISION_CLASS`  | `NONE`                     | Autoservicio personal del trabajador; consulta o registra su propio caso sin supervisar a terceros. Su clase primaria se resolverá en PROC-SCREEN-010.                                                                                                                                          |
| `VSCREEN-0132` | Reservas de inventario                                | `nexo`     | `VPROC-0028::STEP-RESERVE_STOCK`                            | `PRIMARY_OPERATIONAL`       | `OUTSIDE_ADMINISTRATIVE_CLASS` | `OUTSIDE_SUPERVISION_CLASS`  | `NONE`                     | La pantalla ejecuta trabajo operativo directo y no contiene una función independiente de supervisión sobre una población, cola o resultado agregado.                                                                                                                                            |
| `VSCREEN-0133` | Planes y órdenes de mantenimiento de activos          | `nexo`     | `VPROC-0030::STEP-PLAN_AND_EXECUTE_ASSET_MAINTENANCE`       | `PRIMARY_OPERATIONAL`       | `SECONDARY_ADMINISTRATIVE`     | `SECONDARY_SUPERVISION`      | `SUPERVISION_CAPACITY`     | La pantalla equilibra demanda, capacidad, programación o disponibilidad, pero su intención primaria ya es operativa o administrativa. Conserva supervisión secundaria sin duplicar la ejecución, el expediente ni la fuente de verdad.                                                          |
| `VSCREEN-0134` | Garantías, seguros y reclamaciones de activos         | `nexo`     | `VPROC-0030::STEP-MANAGE_ASSET_CLAIM`                       | `OUTSIDE_OPERATIONAL_CLASS` | `PRIMARY_ADMINISTRATIVE`       | `SECONDARY_SUPERVISION`      | `SUPERVISION_EXCEPTION`    | La pantalla concentra desvíos, diferencias, rechazos, retornos o correcciones, pero su intención primaria ya es operativa o administrativa. Conserva supervisión secundaria sin duplicar la ejecución, el expediente ni la fuente de verdad.                                                    |
| `VSCREEN-0135` | Instancias y operación de kits                        | `nexo`     | `VPROC-0067::STEP-ASSEMBLE_AND_CONTROL_KIT`                 | `PRIMARY_OPERATIONAL`       | `OUTSIDE_ADMINISTRATIVE_CLASS` | `OUTSIDE_SUPERVISION_CLASS`  | `NONE`                     | La pantalla ejecuta trabajo operativo directo y no contiene una función independiente de supervisión sobre una población, cola o resultado agregado.                                                                                                                                            |
| `VSCREEN-0136` | Flota y vehículos                                     | `nexo`     | `VPROC-0031::STEP-MANAGE_FLEET_ASSET`                       | `SECONDARY_OPERATIONAL`     | `PRIMARY_ADMINISTRATIVE`       | `SECONDARY_SUPERVISION`      | `SUPERVISION_CAPACITY`     | La pantalla equilibra demanda, capacidad, programación o disponibilidad, pero su intención primaria ya es operativa o administrativa. Conserva supervisión secundaria sin duplicar la ejecución, el expediente ni la fuente de verdad.                                                          |
| `VSCREEN-0137` | Kilometraje y combustible                             | `nexo`     | `VPROC-0031::STEP-CAPTURE_MILEAGE_AND_FUEL`                 | `PRIMARY_OPERATIONAL`       | `OUTSIDE_ADMINISTRATIVE_CLASS` | `OUTSIDE_SUPERVISION_CLASS`  | `NONE`                     | La pantalla ejecuta trabajo operativo directo y no contiene una función independiente de supervisión sobre una población, cola o resultado agregado.                                                                                                                                            |
| `VSCREEN-0138` | Planeación de rutas y despachos                       | `nexo`     | `VPROC-0048::STEP-PLAN_ROUTE_AND_DISPATCH`                  | `PRIMARY_OPERATIONAL`       | `OUTSIDE_ADMINISTRATIVE_CLASS` | `SECONDARY_SUPERVISION`      | `SUPERVISION_CAPACITY`     | La pantalla equilibra demanda, capacidad, programación o disponibilidad, pero su intención primaria ya es operativa o administrativa. Conserva supervisión secundaria sin duplicar la ejecución, el expediente ni la fuente de verdad.                                                          |
| `VSCREEN-0139` | Ejecución de ruta y prueba de entrega                 | `nexo`     | `VPROC-0049::STEP-EXECUTE_ROUTE_AND_PROVE_DELIVERY`         | `PRIMARY_OPERATIONAL`       | `OUTSIDE_ADMINISTRATIVE_CLASS` | `SECONDARY_SUPERVISION`      | `SUPERVISION_MONITORING`   | La pantalla sigue casos, recursos o compromisos todavía abiertos, pero su intención primaria ya es operativa o administrativa. Conserva supervisión secundaria sin duplicar la ejecución, el expediente ni la fuente de verdad.                                                                 |
| `VSCREEN-0140` | Novedades, rechazos y retornos logísticos             | `nexo`     | `VPROC-0049::STEP-RESOLVE_LOGISTICS_EXCEPTION`              | `PRIMARY_OPERATIONAL`       | `OUTSIDE_ADMINISTRATIVE_CLASS` | `SECONDARY_SUPERVISION`      | `SUPERVISION_EXCEPTION`    | La pantalla concentra desvíos, diferencias, rechazos, retornos o correcciones, pero su intención primaria ya es operativa o administrativa. Conserva supervisión secundaria sin duplicar la ejecución, el expediente ni la fuente de verdad.                                                    |
| `VSCREEN-0141` | Instalaciones, servicios y mantenimiento locativo     | `nexo`     | `VPROC-0055::STEP-MANAGE_FACILITY_SERVICE`                  | `PRIMARY_OPERATIONAL`       | `SECONDARY_ADMINISTRATIVE`     | `SECONDARY_SUPERVISION`      | `SUPERVISION_MONITORING`   | La pantalla sigue casos, recursos o compromisos todavía abiertos, pero su intención primaria ya es operativa o administrativa. Conserva supervisión secundaria sin duplicar la ejecución, el expediente ni la fuente de verdad.                                                                 |
| `VSCREEN-0142` | Configuración de políticas y rutas logísticas         | `nexo`     | `VPROC-0048::STEP-CONFIGURE_LOGISTICS_POLICY`               | `OUTSIDE_OPERATIONAL_CLASS` | `SECONDARY_ADMINISTRATIVE`     | `OUTSIDE_SUPERVISION_CLASS`  | `NONE`                     | La intención dominante es mantener maestros, reglas, políticas o plantillas; la posible clase de configuración se resolverá en PROC-SCREEN-008.                                                                                                                                                 |
| `VSCREEN-0143` | Diseñador de etiquetas logísticas                     | `nexo`     | `VPROC-0015::STEP-AUTHOR_LOGISTICS_LABEL_TEMPLATE`          | `OUTSIDE_OPERATIONAL_CLASS` | `SECONDARY_ADMINISTRATIVE`     | `OUTSIDE_SUPERVISION_CLASS`  | `NONE`                     | La intención dominante es mantener maestros, reglas, políticas o plantillas; la posible clase de configuración se resolverá en PROC-SCREEN-008.                                                                                                                                                 |
| `VSCREEN-0144` | Cola y trabajos de impresión logística                | `nexo`     | `VPROC-0024::STEP-OPERATE_PRINT_QUEUE`                      | `PRIMARY_OPERATIONAL`       | `OUTSIDE_ADMINISTRATIVE_CLASS` | `OUTSIDE_SUPERVISION_CLASS`  | `NONE`                     | Opera trabajos de impresión; no configura el recurso ni supervisa una población agregada.                                                                                                                                                                                                       |
| `VSCREEN-0145` | Contratos, precios y condiciones de proveedor         | `origo`    | `VPROC-0020::STEP-GOVERN_SUPPLIER_TERMS`                    | `OUTSIDE_OPERATIONAL_CLASS` | `PRIMARY_ADMINISTRATIVE`       | `OUTSIDE_SUPERVISION_CLASS`  | `NONE`                     | La pantalla administra un expediente, caso, obligación o recurso concreto; no predomina la supervisión transversal o agregada.                                                                                                                                                                  |
| `VSCREEN-0146` | Desempeño y reclamaciones de proveedor                | `origo`    | `VPROC-0020::STEP-REVIEW_SUPPLIER_PERFORMANCE`              | `OUTSIDE_OPERATIONAL_CLASS` | `PRIMARY_ADMINISTRATIVE`       | `SECONDARY_SUPERVISION`      | `SUPERVISION_PERFORMANCE`  | La pantalla evalúa resultados, tendencias, variaciones y planes de mejora, pero su intención primaria ya es operativa o administrativa. Conserva supervisión secundaria sin duplicar la ejecución, el expediente ni la fuente de verdad.                                                        |
| `VSCREEN-0147` | Oportunidades y cotizaciones de catering o B2B        | `pulso`    | `VPROC-0041::STEP-QUALIFY_B2B_OPPORTUNITY`                  | `OUTSIDE_OPERATIONAL_CLASS` | `PRIMARY_ADMINISTRATIVE`       | `OUTSIDE_SUPERVISION_CLASS`  | `NONE`                     | La pantalla administra un expediente, caso, obligación o recurso concreto; no predomina la supervisión transversal o agregada.                                                                                                                                                                  |
| `VSCREEN-0148` | Ejecución de catering o venta B2B                     | `pulso`    | `VPROC-0041::STEP-EXECUTE_B2B_COMMITMENT`                   | `PRIMARY_OPERATIONAL`       | `SECONDARY_ADMINISTRATIVE`     | `SECONDARY_SUPERVISION`      | `SUPERVISION_MONITORING`   | La pantalla sigue casos, recursos o compromisos todavía abiertos, pero su intención primaria ya es operativa o administrativa. Conserva supervisión secundaria sin duplicar la ejecución, el expediente ni la fuente de verdad.                                                                 |
| `VSCREEN-0149` | Operación de reservas y eventos                       | `pulso`    | `VPROC-0047::STEP-MANAGE_RESERVATION_OR_EVENT`              | `PRIMARY_OPERATIONAL`       | `SECONDARY_ADMINISTRATIVE`     | `SECONDARY_SUPERVISION`      | `SUPERVISION_CAPACITY`     | La pantalla equilibra demanda, capacidad, programación o disponibilidad, pero su intención primaria ya es operativa o administrativa. Conserva supervisión secundaria sin duplicar la ejecución, el expediente ni la fuente de verdad.                                                          |
| `VSCREEN-0150` | Casos de reclamo y compensación                       | `pulso`    | `VPROC-0046::STEP-RESOLVE_CUSTOMER_CLAIM`                   | `PRIMARY_OPERATIONAL`       | `SECONDARY_ADMINISTRATIVE`     | `SECONDARY_SUPERVISION`      | `SUPERVISION_EXCEPTION`    | La pantalla concentra desvíos, diferencias, rechazos, retornos o correcciones, pero su intención primaria ya es operativa o administrativa. Conserva supervisión secundaria sin duplicar la ejecución, el expediente ni la fuente de verdad.                                                    |
| `VSCREEN-0151` | Coordinación de entrega mediante tercero              | `pulso`    | `VPROC-0050::STEP-COORDINATE_THIRD_PARTY_DELIVERY`          | `PRIMARY_OPERATIONAL`       | `SECONDARY_ADMINISTRATIVE`     | `SECONDARY_SUPERVISION`      | `SUPERVISION_MONITORING`   | La pantalla sigue casos, recursos o compromisos todavía abiertos, pero su intención primaria ya es operativa o administrativa. Conserva supervisión secundaria sin duplicar la ejecución, el expediente ni la fuente de verdad.                                                                 |
| `VSCREEN-0152` | Análisis de satisfacción y servicio                   | `pulso`    | `VPROC-0068::STEP-ANALYZE_SERVICE_SATISFACTION`             | `OUTSIDE_OPERATIONAL_CLASS` | `SECONDARY_ADMINISTRATIVE`     | `PRIMARY_SUPERVISION`        | `SUPERVISION_PERFORMANCE`  | La intención dominante evalúa resultados, tendencias, variaciones y planes de mejora. La pantalla permite comprender el estado de trabajo ajeno o agregado, detectar desvíos y orientar intervención sin convertirse en el espacio principal de ejecución o backoffice.                         |
| `VSCREEN-0153` | Paquete laboral para pagos y beneficios               | `numera`   | `VPROC-0010::STEP-PREPARE_LABOR_PAYMENT_PACKAGE`            | `OUTSIDE_OPERATIONAL_CLASS` | `PRIMARY_ADMINISTRATIVE`       | `OUTSIDE_SUPERVISION_CLASS`  | `NONE`                     | La pantalla administra un expediente, caso, obligación o recurso concreto; no predomina la supervisión transversal o agregada.                                                                                                                                                                  |
| `VSCREEN-0154` | Facturas y documentos fiscales                        | `numera`   | `VPROC-0051::STEP-MANAGE_FISCAL_DOCUMENT`                   | `OUTSIDE_OPERATIONAL_CLASS` | `PRIMARY_ADMINISTRATIVE`       | `OUTSIDE_SUPERVISION_CLASS`  | `NONE`                     | La pantalla administra un expediente, caso, obligación o recurso concreto; no predomina la supervisión transversal o agregada.                                                                                                                                                                  |
| `VSCREEN-0155` | Tesorería y programación de pagos                     | `numera`   | `VPROC-0052::STEP-PLAN_AND_EXECUTE_PAYMENTS`                | `OUTSIDE_OPERATIONAL_CLASS` | `PRIMARY_ADMINISTRATIVE`       | `SECONDARY_SUPERVISION`      | `SUPERVISION_CAPACITY`     | La pantalla equilibra demanda, capacidad, programación o disponibilidad, pero su intención primaria ya es operativa o administrativa. Conserva supervisión secundaria sin duplicar la ejecución, el expediente ni la fuente de verdad.                                                          |
| `VSCREEN-0156` | Presupuestos, escenarios y forecast                   | `numera`   | `VPROC-0069::STEP-PLAN_BUDGET_AND_FORECAST`                 | `OUTSIDE_OPERATIONAL_CLASS` | `PRIMARY_ADMINISTRATIVE`       | `SECONDARY_SUPERVISION`      | `SUPERVISION_PERFORMANCE`  | La pantalla evalúa resultados, tendencias, variaciones y planes de mejora, pero su intención primaria ya es operativa o administrativa. Conserva supervisión secundaria sin duplicar la ejecución, el expediente ni la fuente de verdad.                                                        |
| `VSCREEN-0157` | Impuestos y obligaciones de cumplimiento              | `numera`   | `VPROC-0052::STEP-MANAGE_TAX_OBLIGATION`                    | `OUTSIDE_OPERATIONAL_CLASS` | `PRIMARY_ADMINISTRATIVE`       | `SECONDARY_SUPERVISION`      | `SUPERVISION_COMPLIANCE`   | La pantalla vigila controles, obligaciones y hallazgos que requieren seguimiento, pero su intención primaria ya es operativa o administrativa. Conserva supervisión secundaria sin duplicar la ejecución, el expediente ni la fuente de verdad.                                                 |
| `VSCREEN-0158` | Distribución y asignación de costos                   | `numera`   | `VPROC-0054::STEP-ALLOCATE_COSTS`                           | `OUTSIDE_OPERATIONAL_CLASS` | `PRIMARY_ADMINISTRATIVE`       | `OUTSIDE_SUPERVISION_CLASS`  | `NONE`                     | La pantalla administra un expediente, caso, obligación o recurso concreto; no predomina la supervisión transversal o agregada.                                                                                                                                                                  |
| `VSCREEN-0159` | Indicadores, análisis y planes de mejora              | `numera`   | `VPROC-0061::STEP-ANALYZE_AND_PLAN_IMPROVEMENT`             | `OUTSIDE_OPERATIONAL_CLASS` | `SECONDARY_ADMINISTRATIVE`     | `PRIMARY_SUPERVISION`        | `SUPERVISION_PERFORMANCE`  | La intención dominante evalúa resultados, tendencias, variaciones y planes de mejora. La pantalla permite comprender el estado de trabajo ajeno o agregado, detectar desvíos y orientar intervención sin convertirse en el espacio principal de ejecución o backoffice.                         |
| `VSCREEN-0160` | Inicio y selección del portal de compras              | `pass`     | `VPROC-0039::STEP-ENTER_CUSTOMER_COMMERCE`                  | `OUTSIDE_OPERATIONAL_CLASS` | `OUTSIDE_ADMINISTRATIVE_CLASS` | `OUTSIDE_SUPERVISION_CLASS`  | `NONE`                     | Canal personal de cliente; no supervisa poblaciones, equipos, colas ni resultados internos. Su clase primaria se resolverá en PROC-SCREEN-011.                                                                                                                                                  |
| `VSCREEN-0161` | Menú y catálogo comercial del cliente                 | `pass`     | `VPROC-0017::STEP-BROWSE_COMMERCIAL_OFFER`                  | `OUTSIDE_OPERATIONAL_CLASS` | `OUTSIDE_ADMINISTRATIVE_CLASS` | `OUTSIDE_SUPERVISION_CLASS`  | `NONE`                     | Canal personal de cliente; no supervisa poblaciones, equipos, colas ni resultados internos. Su clase primaria se resolverá en PROC-SCREEN-011.                                                                                                                                                  |
| `VSCREEN-0162` | Carrito y configuración del pedido                    | `pass`     | `VPROC-0039::STEP-CONFIGURE_CART`                           | `OUTSIDE_OPERATIONAL_CLASS` | `OUTSIDE_ADMINISTRATIVE_CLASS` | `OUTSIDE_SUPERVISION_CLASS`  | `NONE`                     | Canal personal de cliente; no supervisa poblaciones, equipos, colas ni resultados internos. Su clase primaria se resolverá en PROC-SCREEN-011.                                                                                                                                                  |
| `VSCREEN-0163` | Dirección, modalidad y programación de entrega        | `pass`     | `VPROC-0050::STEP-SELECT_FULFILLMENT`                       | `OUTSIDE_OPERATIONAL_CLASS` | `OUTSIDE_ADMINISTRATIVE_CLASS` | `OUTSIDE_SUPERVISION_CLASS`  | `NONE`                     | Canal personal de cliente; no supervisa poblaciones, equipos, colas ni resultados internos. Su clase primaria se resolverá en PROC-SCREEN-011.                                                                                                                                                  |
| `VSCREEN-0164` | Revisión, checkout e inicio de pago                   | `pass`     | `VPROC-0043::STEP-REVIEW_AND_START_PAYMENT`                 | `OUTSIDE_OPERATIONAL_CLASS` | `OUTSIDE_ADMINISTRATIVE_CLASS` | `OUTSIDE_SUPERVISION_CLASS`  | `NONE`                     | Canal personal de cliente; no supervisa poblaciones, equipos, colas ni resultados internos. Su clase primaria se resolverá en PROC-SCREEN-011.                                                                                                                                                  |
| `VSCREEN-0165` | Confirmación de pedido y retorno de pago              | `pass`     | `VPROC-0043::STEP-PRESENT_ORDER_RECEIPT`                    | `OUTSIDE_OPERATIONAL_CLASS` | `OUTSIDE_ADMINISTRATIVE_CLASS` | `OUTSIDE_SUPERVISION_CLASS`  | `NONE`                     | Canal personal de cliente; no supervisa poblaciones, equipos, colas ni resultados internos. Su clase primaria se resolverá en PROC-SCREEN-011.                                                                                                                                                  |
| `VSCREEN-0166` | Mis pedidos y detalle                                 | `pass`     | `VPROC-0039::STEP-CONSULT_PERSONAL_ORDERS`                  | `OUTSIDE_OPERATIONAL_CLASS` | `OUTSIDE_ADMINISTRATIVE_CLASS` | `OUTSIDE_SUPERVISION_CLASS`  | `NONE`                     | Canal personal de cliente; no supervisa poblaciones, equipos, colas ni resultados internos. Su clase primaria se resolverá en PROC-SCREEN-011.                                                                                                                                                  |
| `VSCREEN-0167` | Seguimiento de preparación y entrega del cliente      | `pass`     | `VPROC-0050::STEP-TRACK_PERSONAL_FULFILLMENT`               | `OUTSIDE_OPERATIONAL_CLASS` | `OUTSIDE_ADMINISTRATIVE_CLASS` | `OUTSIDE_SUPERVISION_CLASS`  | `NONE`                     | Canal personal de cliente; no supervisa poblaciones, equipos, colas ni resultados internos. Su clase primaria se resolverá en PROC-SCREEN-011.                                                                                                                                                  |
| `VSCREEN-0168` | Chat y comunicación asociada al pedido                | `pass`     | `VPROC-0047::STEP-COMMUNICATE_ABOUT_ORDER`                  | `OUTSIDE_OPERATIONAL_CLASS` | `OUTSIDE_ADMINISTRATIVE_CLASS` | `OUTSIDE_SUPERVISION_CLASS`  | `NONE`                     | Canal personal de cliente; no supervisa poblaciones, equipos, colas ni resultados internos. Su clase primaria se resolverá en PROC-SCREEN-011.                                                                                                                                                  |
| `VSCREEN-0169` | Mis reclamos y casos de servicio                      | `pass`     | `VPROC-0046::STEP-SUBMIT_AND_TRACK_CLAIM`                   | `OUTSIDE_OPERATIONAL_CLASS` | `OUTSIDE_ADMINISTRATIVE_CLASS` | `OUTSIDE_SUPERVISION_CLASS`  | `NONE`                     | Canal personal de cliente; no supervisa poblaciones, equipos, colas ni resultados internos. Su clase primaria se resolverá en PROC-SCREEN-011.                                                                                                                                                  |
| `VSCREEN-0170` | Mis reservas y eventos                                | `pass`     | `VPROC-0047::STEP-MANAGE_PERSONAL_RESERVATION`              | `OUTSIDE_OPERATIONAL_CLASS` | `OUTSIDE_ADMINISTRATIVE_CLASS` | `OUTSIDE_SUPERVISION_CLASS`  | `NONE`                     | Canal personal de cliente; no supervisa poblaciones, equipos, colas ni resultados internos. Su clase primaria se resolverá en PROC-SCREEN-011.                                                                                                                                                  |
| `VSCREEN-0171` | Calificación y satisfacción                           | `pass`     | `VPROC-0068::STEP-SUBMIT_SATISFACTION_RATING`               | `OUTSIDE_OPERATIONAL_CLASS` | `OUTSIDE_ADMINISTRATIVE_CLASS` | `OUTSIDE_SUPERVISION_CLASS`  | `NONE`                     | Canal personal de cliente; no supervisa poblaciones, equipos, colas ni resultados internos. Su clase primaria se resolverá en PROC-SCREEN-011.                                                                                                                                                  |
| `VSCREEN-0172` | Comunicaciones y notificaciones del cliente           | `pass`     | `VPROC-0047::STEP-CONSULT_CUSTOMER_COMMUNICATION`           | `OUTSIDE_OPERATIONAL_CLASS` | `OUTSIDE_ADMINISTRATIVE_CLASS` | `OUTSIDE_SUPERVISION_CLASS`  | `NONE`                     | Canal personal de cliente; no supervisa poblaciones, equipos, colas ni resultados internos. Su clase primaria se resolverá en PROC-SCREEN-011.                                                                                                                                                  |
| `VSCREEN-0173` | Trazabilidad e investigación de lote                  | `fogo`     | `VPROC-0035::STEP-INVESTIGATE_BATCH_TRACEABILITY`           | `OUTSIDE_OPERATIONAL_CLASS` | `SECONDARY_ADMINISTRATIVE`     | `OUTSIDE_SUPERVISION_CLASS`  | `NONE`                     | La intención dominante es reconstrucción histórica, evidencia o auditoría; la clase correspondiente se resolverá en PROC-SCREEN-009.                                                                                                                                                            |
| `VSCREEN-0174` | Controles operativos de inocuidad                     | `fogo`     | `VPROC-0014::STEP-EXECUTE_FOOD_SAFETY_CONTROL`              | `PRIMARY_OPERATIONAL`       | `SECONDARY_ADMINISTRATIVE`     | `SECONDARY_SUPERVISION`      | `SUPERVISION_COMPLIANCE`   | La pantalla vigila controles, obligaciones y hallazgos que requieren seguimiento, pero su intención primaria ya es operativa o administrativa. Conserva supervisión secundaria sin duplicar la ejecución, el expediente ni la fuente de verdad.                                                 |
| `VSCREEN-0175` | Seguridad de cuenta y sesiones                        | `shell`    | `VPROC-0059::STEP-MANAGE_ACCOUNT_SECURITY`                  | `OUTSIDE_OPERATIONAL_CLASS` | `OUTSIDE_ADMINISTRATIVE_CLASS` | `OUTSIDE_SUPERVISION_CLASS`  | `NONE`                     | Acceso, cuenta, activación técnica o navegación transversal sin vigilancia dominante sobre trabajo empresarial de terceros.                                                                                                                                                                     |
| `VSCREEN-0176` | Definición de kits y conjuntos                        | `nexo`     | `VPROC-0067::STEP-MAINTAIN_KIT_DEFINITION`                  | `OUTSIDE_OPERATIONAL_CLASS` | `SECONDARY_ADMINISTRATIVE`     | `OUTSIDE_SUPERVISION_CLASS`  | `NONE`                     | Mantiene configuración reutilizable; no supervisa trabajo vivo.                                                                                                                                                                                                                                 |
| `VSCREEN-0177` | Configuración de impresoras logísticas                | `nexo`     | `VPROC-0024::STEP-CONFIGURE_LOGISTICS_PRINTERS`             | `OUTSIDE_OPERATIONAL_CLASS` | `SECONDARY_ADMINISTRATIVE`     | `OUTSIDE_SUPERVISION_CLASS`  | `NONE`                     | Mantiene configuración reutilizable; no supervisa una cola operativa.                                                                                                                                                                                                                           |

---

#### 11. Resumen por aplicación

| Aplicación | Primaria supervisión | Secundaria supervisión | Fuera de clase |   Total |
| ---------- | -------------------: | ---------------------: | -------------: | ------: |
| `shell`    |                    0 |                      0 |              7 |       7 |
| `viso`     |                    3 |                     16 |             12 |      31 |
| `anima`    |                    0 |                      0 |             14 |      14 |
| `nexo`     |                    2 |                     13 |             22 |      37 |
| `fogo`     |                    2 |                      6 |              7 |      15 |
| `origo`    |                    1 |                      6 |              7 |      14 |
| `pulso`    |                    2 |                     10 |              8 |      20 |
| `numera`   |                    2 |                      9 |              9 |      20 |
| `pass`     |                    0 |                      0 |             19 |      19 |
| **Total**  |               **12** |                 **60** |        **105** | **177** |

La distribución por aplicación es una comprobación de integridad, no una regla de clasificación.

---

#### 12. Resumen por patrón

| Patrón                                  | Pantallas |
| --------------------------------------- | --------: |
| `SUPERVISION_DASHBOARD`                 |         4 |
| `SUPERVISION_QUEUE`                     |         6 |
| `SUPERVISION_MONITORING`                |        12 |
| `SUPERVISION_REVIEW`                    |         6 |
| `SUPERVISION_CONTROL`                   |         9 |
| `SUPERVISION_EXCEPTION`                 |        10 |
| `SUPERVISION_CAPACITY`                  |         7 |
| `SUPERVISION_COMPLIANCE`                |         6 |
| `SUPERVISION_PERFORMANCE`               |         7 |
| `SUPERVISION_RISK`                      |         3 |
| `SUPERVISION_SERVICE`                   |         1 |
| `SUPERVISION_COORDINATION`              |         1 |
| **Total con relevancia de supervisión** |    **72** |

Las 99 pantallas con `NONE` continúan hacia configuración, auditoría, personal o cliente sin recibir una clase inventada.

---

#### 13. Contrato de amplitud y drill-down

Toda pantalla de supervisión deberá declarar posteriormente:

```text
supervised_subject_type
supervised_scope
aggregation_window
freshness_indicator
source_application
source_process
drilldown_target_screen_id
intervention_boundary
escalation_target
```

Reglas:

1. el agregado no puede ocultar la fuente;
2. la frescura debe ser visible;
3. un indicador no sustituye el caso;
4. el drill-down debe abrir el objeto propietario o una proyección autorizada;
5. una acción desde supervisión deberá revalidar permiso, contexto, versión y estado;
6. una proyección no podrá escribir directamente sobre una fuente ajena;
7. no se podrá deducir desempeño individual desde datos incompletos o fuera de contexto;
8. filtros y exportaciones deberán respetar territorio y minimización.

Los campos se materializarán en tareas posteriores de acciones, permisos, métricas e implementación.

---

#### 14. Fronteras especiales

1. **SHELL:** una bandeja transversal o diagnóstico puede ser supervisión primaria; autenticación, cuenta y navegación no.
2. **VISO:** un dashboard o revisión transversal puede ser supervisión; administrar un expediente no se convierte automáticamente en supervisión.
3. **ANIMA:** las pantallas personales no supervisan a terceros.
4. **NEXO:** resumen de inventario, disponibilidad y seguimiento pueden supervisar; movimientos y conteos conservan ejecución primaria.
5. **FOGO:** cola, planeación y receta operativa pueden conducir producción; ejecución de lote permanece operativa.
6. **ORIGO:** cola de recepciones puede supervisar carga; compra, proveedor y orden conservan administración primaria.
7. **PULSO:** inicio y revisión transversal pueden supervisar; venta, caja, pedido y servicio conservan operación primaria.
8. **NUMERA:** inicio financiero, reportes e indicadores pueden supervisar; registros y conciliaciones conservan backoffice administrativo.
9. **PASS:** no supervisa la operación interna ni a otros clientes.
10. **AURA:** continúa sin pantallas.

---

#### 15. Compatibilidad con clases anteriores

```text
PRIMARY_SUPERVISION
+ PRIMARY_OPERATIONAL
= PROHIBIDO

PRIMARY_SUPERVISION
+ PRIMARY_ADMINISTRATIVE
= PROHIBIDO

SECONDARY_SUPERVISION
+ PRIMARY_OPERATIONAL
= PERMITIDO

SECONDARY_SUPERVISION
+ PRIMARY_ADMINISTRATIVE
= PERMITIDO
```

Una aprobación individual no es automáticamente supervisión. Debe existir amplitud sobre trabajo, carga, población, desviación o desempeño.

---

#### 16. Cambio y versionado

Cambiar `supervision_fit` o `supervision_pattern` exige:

1. propuesta trazable;
2. comparación de población, amplitud, señal, intervención y drill-down;
3. explicación de por qué la pantalla pasó a supervisar o dejó de hacerlo;
4. nueva versión;
5. conservación del valor anterior;
6. revisión de actores, territorio, acciones, sensibilidad, métricas y pruebas;
7. nueva identidad cuando cambie materialmente la intención principal.

Cambiar el título del rol, la ruta o el gráfico no cambia automáticamente la clasificación.

---

#### 17. Validaciones obligatorias

La compilación deberá fallar cuando:

1. falte una de las 177 pantallas;
2. una pantalla aparezca más de una vez;
3. falte `supervision_fit`;
4. el valor no pertenezca al vocabulario;
5. una pantalla primaria o secundaria use `NONE`;
6. una pantalla fuera de clase use un patrón;
7. falte fundamento;
8. proceso, paso o clases anteriores no coincidan;
9. los conteos no sean 12, 60 y 105;
10. los patrones no sumen 72;
11. exista una pantalla primaria de supervisión y primaria operativa;
12. exista una pantalla primaria de supervisión y primaria administrativa;
13. PASS o ANIMA reciban supervisión primaria sin nueva decisión;
14. una pantalla histórica sea supervisión solo por mostrar varios registros;
15. un dashboard carezca de fuente, frescura o drill-down;
16. la clasificación sea usada como permiso o jerarquía;
17. AURA reciba clasificación sin pantalla;
18. la puerta final deje más de una clase primaria o ninguna.

---

#### 18. Seguridad, privacidad y autorización

La clasificación de supervisión no concede:

- lectura transversal;
- autoridad sobre subordinados;
- acceso global;
- exportación;
- reasignación;
- aprobación;
- corrección;
- intervención sobre otro territorio;
- acceso a información individual sensible;
- acceso por URL directa.

Toda vista supervisora deberá aplicar minimización, alcance territorial, segregación, trazabilidad y revalidación servidor.

---

#### 19. SCREEN-SUPERVISION-CARRYOVER-REGISTER-001

| Pendiente                                                    | Propietario exacto                                        |
| ------------------------------------------------------------ | --------------------------------------------------------- |
| clasificar pantallas de configuración                        | `PROC-SCREEN-008`                                         |
| clasificar pantallas de auditoría                            | `PROC-SCREEN-009`                                         |
| clasificar pantallas personales                              | `PROC-SCREEN-010`                                         |
| clasificar pantallas de cliente y cerrar la puerta de clases | `PROC-SCREEN-011`                                         |
| definir actores y alcance supervisor                         | `PROC-SCREEN-012`                                         |
| definir dispositivos soportados                              | `PROC-SCREEN-013`                                         |
| definir acciones e intervenciones                            | `PROC-SCREEN-014` y `PROC-SCREEN-015`                     |
| definir estados y recuperación                               | `PROC-SCREEN-016` a `PROC-SCREEN-021`                     |
| definir sensibilidad y permisos                              | `PROC-SCREEN-022` a `PROC-SCREEN-024`                     |
| vincular operaciones técnicas                                | `PROC-SCREEN-025`                                         |
| mapear rutas y legado                                        | `PROC-SCREEN-026`                                         |
| definir métricas y aceptación                                | `PROC-SCREEN-027` y `PROC-SCREEN-028`                     |
| materializar fuente, frescura y drill-down                   | paquetes E5 y CI                                          |
| validar con supervisores reales                              | `UX-QA-*` y pilotos E5                                    |
| admitir AURA                                                 | tareas canónicas de AURA y nueva admisión `PROC-SCREEN-*` |

No queda pendiente narrativo sin tarea o puerta de resolución.

---

#### 20. Requisitos de prueba derivados

**Resultado:** GENERA 30 REQUISITOS DE PRUEBA.

Se incorporan `TREQ-UX-669` a `TREQ-UX-698` al Registro Canónico completo. Permanecen en estado `IDENTIFICADO`; automatización, implementación y evidencia corresponden a CI documental, paquetes E5, BLOQUE U, staging y pilotos.

---

#### 21. Criterios de aceptación

- [x] Se clasifican las 177 pantallas.
- [x] Cada pantalla recibe exactamente un `supervision_fit`.
- [x] Se distinguen 12 primarias, 60 secundarias y 105 fuera de clase.
- [x] Las 72 pantallas relevantes usan doce patrones.
- [x] Ninguna pantalla acumula dos clases primarias aprobadas.
- [x] Supervisión se separa de operación, administración, configuración y auditoría.
- [x] Se definen amplitud, frescura, fuente, drill-down e intervención.
- [x] PASS y ANIMA no se convierten en canales supervisores.
- [x] AURA conserva cero pantallas.
- [x] La clasificación no concede jerarquía ni permisos.
- [x] Se mantienen historia y versionado.
- [x] Se generan `TREQ-UX-669` a `TREQ-UX-698`.
- [x] No se anticipan actores, dispositivos, acciones, estados, permisos, rutas o APIs.
- [x] No se implementa código ni se avanza a `PROC-SCREEN-008`.

---

#### 22. Resultado y continuidad

```text
PROC-SCREEN-006 APROBADA
PROC-SCREEN-007 APROBADA
PROC-SCREEN-008 NO INICIADA
```

La continuidad documental pasa exclusivamente a:

```text
PROC-SCREEN-008 — Clasificar pantalla de configuración
```


### ✅ PROC-SCREEN-008 — Clasificar pantalla de configuración

**Estado:** APROBADA

**Bloque:** E2 — Arquitectura funcional, procesos y experiencia transversal

**Marcador exacto que reemplaza:** `### [ ] PROC-SCREEN-008 — Clasificar pantalla de configuración`

**Tarea anterior:** `PROC-SCREEN-007 — Clasificar pantalla de supervisión` — APROBADA

**Siguiente tarea reservada:** `PROC-SCREEN-009 — Clasificar pantalla de auditoría` — NO INICIADA

**Fuente canónica obligatoria de nombres:** `PROC-SCREEN-002 / SCREEN-CANONICAL-CATALOG-001`

**Artefactos lógicos contenidos en esta tarea:**

- `SCREEN-CONFIGURATION-CLASSIFICATION-CONTRACT-001`;
- `SCREEN-CONFIGURATION-PATTERN-VOCABULARY-001`;
- `SCREEN-CONFIGURATION-CLASSIFICATION-REGISTER-001`;
- `SCREEN-CANONICAL-NAME-INTEGRITY-GATE-001`;
- `SCREEN-CONFIGURATION-COVERAGE-MATRIX-001`;
- `SCREEN-CONFIGURATION-CHANGE-POLICY-001`;
- `SCREEN-CONFIGURATION-VALIDATION-GATE-001`;
- `SCREEN-CONFIGURATION-CARRYOVER-REGISTER-001`.

**Resultado cuantitativo:** **177 pantallas clasificadas**, de las cuales **16** quedan como `PRIMARY_CONFIGURATION`, **12** como `SECONDARY_CONFIGURATION` y **149** como `OUTSIDE_CONFIGURATION_CLASS`; se utilizan **12 patrones**, existen **28 pantallas con relevancia de configuración**, AURA conserva cero pantallas y ningún nombre canónico fue modificado.

**Huella de nombres `screen_id|working_name`:** `cebd5daf5e5fadff5beb5fb45b9963c5a8a3808cf0972092fc63f97168d49984`

**Naturaleza:** clasificación documental del grado en que cada pantalla define, mantiene, versiona o publica estructuras, políticas, maestros, especificaciones, plantillas, términos, planes o reglas reutilizables que condicionan múltiples instancias futuras. No define todavía auditoría, pantallas personales o de cliente; tampoco define actores, dispositivos, acciones, estados de interfaz, sensibilidad, permisos, rutas u operaciones técnicas.

**Cambios en nombres canónicos, identificadores, aplicaciones, procesos, pasos, código de producto, componentes, rutas, Supabase, tablas, migraciones, RLS, RPC, eventos, analítica o producción:** no autorizados por esta tarea.

---

#### 1. Propósito

Distinguir las superficies cuyo trabajo principal consiste en configurar comportamiento empresarial reutilizable de aquellas que solo incorporan ajustes secundarios o que operan sobre una instancia concreta.

```text
ESTRUCTURA, POLITICA, MAESTRO, ESPECIFICACION, PLANTILLA O REGLA
        +
REUTILIZACION EN MULTIPLES INSTANCIAS FUTURAS
        +
VERSION, VIGENCIA, IMPACTO Y PUBLICACION CONTROLADA
        =
CLASIFICACION DE CONFIGURACION
```

La clasificación responde **si la pantalla gobierna una definición reutilizable**, no si contiene campos editables ni si utiliza la palabra “configuración”.

---

#### 2. Dependencias consumidas

- `PROC-SCREEN-001` y la identidad estable `VSCREEN-*`;
- `PROC-SCREEN-002` y `SCREEN-CANONICAL-CATALOG-001`;
- `PROC-SCREEN-003` y los procesos primarios;
- `PROC-SCREEN-004` y los pasos dominantes;
- `PROC-SCREEN-005` y la clasificación operativa;
- `PROC-SCREEN-006` y la clasificación administrativa;
- `PROC-SCREEN-007` y la clasificación de supervisión;
- `PROC-CAT-001` a `PROC-CAT-020`;
- `PROC-ACTOR-001` a `PROC-ACTOR-010`;
- `UX-BASE-001` a `UX-BASE-015`;
- `UX-STATION-001` a `UX-STATION-012`;
- `UX-ADMIN-001` a `UX-ADMIN-005`;
- los contratos aprobados de catálogo, versionado, publicación, autorización, segregación, impacto, auditoría y recuperación.

La tarea consume los nombres canónicos sin reinterpretarlos, abreviarlos, corregirlos, pluralizarlos ni sustituirlos por sinónimos.

---

#### 3. Integridad obligatoria de nombres canónicos

`SCREEN-CANONICAL-NAME-INTEGRITY-GATE-001` establece:

1. `screen_id` es la clave de unión con `SCREEN-CANONICAL-CATALOG-001`;
2. la columna `Pantalla` deberá ser una copia textual exacta de `working_name`;
3. una tarea de clasificación no puede renombrar una pantalla;
4. no se permiten normalizaciones de mayúsculas, tildes, singular, plural, abreviaturas o sinónimos;
5. cualquier diferencia deberá fallar antes de validar la clasificación;
6. un cambio legítimo de nombre deberá aprobarse primero en el catálogo propietario, versionarse y regenerar todas las matrices consumidoras;
7. los nombres no sustituyen `screen_id`, pero se conservan exactos para detectar divergencia documental.

Casos de regresión obligatorios:

```text
VSCREEN-0026 = Bandeja de casos administrativos transversales
VSCREEN-0032 = Mi perfil laboral
```

---

#### 4. Alcance

1. incorporar `configuration_fit` a las 177 pantallas;
2. distinguir configuración primaria, secundaria y ausencia de clase;
3. definir doce patrones cerrados;
4. separar configuración reusable de edición de casos, planificación, operación y preferencias personales;
5. clasificar catálogos, maestros, políticas, especificaciones, plantillas, publicaciones y reglas;
6. conservar las clases aprobadas en `PROC-SCREEN-005` a `PROC-SCREEN-007`;
7. impedir dos clases primarias simultáneas;
8. establecer versionado, vigencia, impacto, publicación y rollback;
9. conservar exactos los 177 nombres del catálogo;
10. preparar la continuidad hacia auditoría, personal y cliente.

---

#### 5. Exclusiones

Esta tarea no:

- renombra pantallas;
- cambia `screen_id`, aplicación, proceso o paso;
- convierte todo formulario editable en configuración;
- convierte planificación de un caso en política reutilizable;
- convierte ajustes de un pedido, una reserva o una preferencia personal en configuración empresarial;
- define actores, dispositivos o estaciones;
- define acciones principales o secundarias;
- define estados de interfaz;
- concede permisos;
- vincula APIs, RPC, Server Actions, eventos o tablas;
- mapea rutas o componentes legacy;
- activa AURA.

---

#### 6. Definición canónica

Una pantalla tiene relevancia de configuración cuando su objeto principal o secundario es una definición reutilizable que:

- afecta múltiples instancias futuras;
- posee versión, vigencia o estado de publicación;
- requiere validación de consistencia e impacto;
- puede reemplazarse, retirarse o revertirse sin reescribir casos históricos;
- conserva fuente, autoridad y trazabilidad;
- no representa únicamente el avance de un caso vivo.

No basta con:

- tener campos editables;
- utilizar selectores;
- permitir ordenar una lista;
- contener la palabra “configuración”;
- modificar un pedido o reserva individual;
- administrar un expediente;
- planear una jornada, ruta, pago o presupuesto concreto;
- consultar un historial;
- cambiar preferencias o datos propios.

---

#### 7. Estados de clasificación

| Valor                         | Significado                                                        | Efecto documental                           |
| ----------------------------- | ------------------------------------------------------------------ | ------------------------------------------- |
| `PRIMARY_CONFIGURATION`       | mantener una definición reutilizable es la intención dominante     | reserva `CONFIGURATION` como clase primaria |
| `SECONDARY_CONFIGURATION`     | otra clase es primaria, pero existe configuración reusable acotada | agrega configuración secundaria             |
| `OUTSIDE_CONFIGURATION_CLASS` | no existe configuración empresarial material bajo este contrato    | continúa hacia las clases posteriores       |

---

#### 8. Contrato mínimo

| Campo                                  | Obligación                                                           |
| -------------------------------------- | -------------------------------------------------------------------- |
| `screen_id`                            | `VSCREEN-*` canónico                                                 |
| `canonical_screen_name`                | nombre exacto de `SCREEN-CANONICAL-CATALOG-001`                      |
| `primary_application_id`               | aplicación aprobada                                                  |
| `primary_process_id`                   | proceso aprobado                                                     |
| `primary_process_step_ref`             | paso aprobado                                                        |
| `operational_fit`                      | clasificación aprobada                                               |
| `administrative_fit`                   | clasificación aprobada                                               |
| `supervision_fit`                      | clasificación aprobada                                               |
| `configuration_fit`                    | uno de los tres estados aprobados                                    |
| `configuration_pattern`                | patrón aprobado o `NONE`                                             |
| `configuration_reason`                 | fundamento verificable                                               |
| `configuration_classification_version` | versión semántica                                                    |
| `configuration_classification_status`  | `CANONICAL`, `CHANGE_PROPOSED`, `SUPERSEDED` o `RETIRED_WITH_SCREEN` |
| `configuration_classification_task`    | tarea que aprobó o modificó la decisión                              |

Valores iniciales:

```text
configuration_classification_version: 1.0.0
configuration_classification_status: CANONICAL
configuration_classification_task: PROC-SCREEN-008
decision_record: INITIAL_CONFIGURATION_CLASSIFICATION
canonical_name_source: SCREEN-CANONICAL-CATALOG-001
```

---

#### 9. SCREEN-CONFIGURATION-PATTERN-VOCABULARY-001

| Patrón                   | Uso                                                        |
| ------------------------ | ---------------------------------------------------------- |
| `CONFIG_STRUCTURE`       | estructura organizativa, territorial o física reutilizable |
| `CONFIG_POLICY`          | política, límite o regla transversal versionada            |
| `CONFIG_ACCESS_MODEL`    | modelo o asignación de acceso                              |
| `CONFIG_DEVICE_POLICY`   | gobierno y parámetros de dispositivos                      |
| `CONFIG_CATALOG`         | catálogo canónico de entidades maestras                    |
| `CONFIG_MASTER_DATA`     | mantenimiento de datos maestros                            |
| `CONFIG_SPECIFICATION`   | especificaciones y criterios reutilizables                 |
| `CONFIG_PUBLICATION`     | aprobación y publicación de una versión reutilizable       |
| `CONFIG_TEMPLATE`        | plantilla versionada                                       |
| `CONFIG_CONTROL_PLAN`    | plan, calendario o control recurrente                      |
| `CONFIG_TERMS`           | condiciones contractuales o comerciales                    |
| `CONFIG_ALLOCATION_RULE` | regla de distribución o asignación                         |
| `NONE`                   | sin relevancia de configuración                            |

---

#### 10. Algoritmo de decisión

Se clasifica `PRIMARY_CONFIGURATION` cuando:

1. la pantalla trabaja principalmente sobre una definición reutilizable;
2. el objeto afecta múltiples casos posteriores;
3. exige versión, vigencia, publicación o retiro;
4. el cambio requiere análisis de impacto;
5. no ejecuta como intención dominante un caso vivo.

Se clasifica `SECONDARY_CONFIGURATION` cuando:

1. la pantalla ya posee otra clase primaria;
2. incorpora una regla, maestro, plan o parámetro reusable claramente delimitado;
3. la configuración no absorbe el expediente ni la ejecución;
4. conserva versión, autoridad y efecto identificable.

Se clasifica `OUTSIDE_CONFIGURATION_CLASS` cuando predomina:

- operación sobre una instancia;
- administración de un caso;
- supervisión;
- auditoría histórica;
- autoservicio personal;
- experiencia del cliente;
- selección o personalización de una instancia concreta.

---

#### 11. Fronteras críticas

1. Activar un dispositivo compartido es ejecución; gobernar sus capacidades y vigencia es configuración.
2. Emitir una etiqueta es operación; diseñar su plantilla es configuración.
3. Gestionar la cola de impresión es operación; parametrizar impresoras es configuración secundaria.
4. Ejecutar una receta es operación; mantener y publicar su versión es configuración.
5. Crear un pedido es operación o cliente; configurar el contenido de ese pedido no es configuración empresarial.
6. Mantener el catálogo físico es configuración; consultar existencias es supervisión u operación.
7. Planear una ruta concreta no es política logística; versionar políticas y restricciones de rutas sí.
8. Registrar un proveedor es administración con configuración secundaria; consultar el catálogo maestro es configuración primaria.
9. Preferencias, consentimiento y seguridad de cuenta propios pertenecen a personal o cliente, no a configuración empresarial.
10. Presupuesto, programación y planificación de casos no se convierten en configuración solo por tener supuestos.

---

#### 12. SCREEN-CONFIGURATION-CLASSIFICATION-REGISTER-001

| Screen ID      | Pantalla                                              | Aplicación | Paso dominante                                              | Clase operativa             | Clase administrativa           | Clase de supervisión        | Clasificación de configuración | Patrón                   | Fundamento                                                                                                                                                                                                                                                 |
| -------------- | ----------------------------------------------------- | ---------- | ----------------------------------------------------------- | --------------------------- | ------------------------------ | --------------------------- | ------------------------------ | ------------------------ | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `VSCREEN-0001` | Hub Vento OS                                          | `shell`    | `VPROC-0059::STEP-ENTER_ECOSYSTEM`                          | `OUTSIDE_OPERATIONAL_CLASS` | `OUTSIDE_ADMINISTRATIVE_CLASS` | `OUTSIDE_SUPERVISION_CLASS` | `OUTSIDE_CONFIGURATION_CLASS`  | `NONE`                   | Resuelve acceso, sesión, contexto o cuenta en tiempo de ejecución; no mantiene configuración empresarial reutilizable.                                                                                                                                     |
| `VSCREEN-0002` | Inicio de sesión y recuperación                       | `shell`    | `VPROC-0059::STEP-AUTHENTICATE_OR_RECOVER`                  | `OUTSIDE_OPERATIONAL_CLASS` | `OUTSIDE_ADMINISTRATIVE_CLASS` | `OUTSIDE_SUPERVISION_CLASS` | `OUTSIDE_CONFIGURATION_CLASS`  | `NONE`                   | Resuelve acceso, sesión, contexto o cuenta en tiempo de ejecución; no mantiene configuración empresarial reutilizable.                                                                                                                                     |
| `VSCREEN-0003` | Resolución de contexto y acceso                       | `shell`    | `VPROC-0059::STEP-RESOLVE_EFFECTIVE_CONTEXT`                | `SECONDARY_OPERATIONAL`     | `SECONDARY_ADMINISTRATIVE`     | `OUTSIDE_SUPERVISION_CLASS` | `OUTSIDE_CONFIGURATION_CLASS`  | `NONE`                   | Resuelve acceso, sesión, contexto o cuenta en tiempo de ejecución; no mantiene configuración empresarial reutilizable.                                                                                                                                     |
| `VSCREEN-0004` | Activación de dispositivo compartido                  | `shell`    | `VPROC-0059::STEP-ACTIVATE_SHARED_DEVICE`                   | `SECONDARY_OPERATIONAL`     | `OUTSIDE_ADMINISTRATIVE_CLASS` | `OUTSIDE_SUPERVISION_CLASS` | `OUTSIDE_CONFIGURATION_CLASS`  | `NONE`                   | Resuelve acceso, sesión, contexto o cuenta en tiempo de ejecución; no mantiene configuración empresarial reutilizable.                                                                                                                                     |
| `VSCREEN-0005` | Bandeja transversal de tareas y notificaciones        | `shell`    | `VPROC-0004::STEP-TRIAGE_TRANSVERSAL_WORK`                  | `SECONDARY_OPERATIONAL`     | `SECONDARY_ADMINISTRATIVE`     | `OUTSIDE_SUPERVISION_CLASS` | `OUTSIDE_CONFIGURATION_CLASS`  | `NONE`                   | La intención dominante es vigilar carga, riesgo, desviaciones o resultados; la pantalla no mantiene configuración como objeto principal.                                                                                                                   |
| `VSCREEN-0006` | Centro de soporte y diagnóstico                       | `shell`    | `VPROC-0058::STEP-DIAGNOSE_AND_ROUTE_SUPPORT`               | `SECONDARY_OPERATIONAL`     | `SECONDARY_ADMINISTRATIVE`     | `OUTSIDE_SUPERVISION_CLASS` | `OUTSIDE_CONFIGURATION_CLASS`  | `NONE`                   | La intención dominante es vigilar carga, riesgo, desviaciones o resultados; la pantalla no mantiene configuración como objeto principal.                                                                                                                   |
| `VSCREEN-0007` | Inicio ejecutivo y gerencial                          | `viso`     | `VPROC-0001::STEP-REVIEW_EXECUTIVE_WORK`                    | `OUTSIDE_OPERATIONAL_CLASS` | `SECONDARY_ADMINISTRATIVE`     | `PRIMARY_SUPERVISION`       | `OUTSIDE_CONFIGURATION_CLASS`  | `NONE`                   | La intención dominante es vigilar carga, riesgo, desviaciones o resultados; la pantalla no mantiene configuración como objeto principal.                                                                                                                   |
| `VSCREEN-0008` | Estructura organizativa                               | `viso`     | `VPROC-0002::STEP-MAINTAIN_ORGANIZATIONAL_STRUCTURE`        | `OUTSIDE_OPERATIONAL_CLASS` | `SECONDARY_ADMINISTRATIVE`     | `OUTSIDE_SUPERVISION_CLASS` | `PRIMARY_CONFIGURATION`        | `CONFIG_STRUCTURE`       | La intención dominante mantiene una estructura reutilizable que organiza entidades, ubicaciones o ámbitos. La configuración afecta múltiples instancias futuras, conserva versión y no ejecuta por sí sola un caso operativo.                              |
| `VSCREEN-0009` | Políticas, delegaciones y límites                     | `viso`     | `VPROC-0003::STEP-AUTHOR_POLICIES_AND_LIMITS`               | `OUTSIDE_OPERATIONAL_CLASS` | `SECONDARY_ADMINISTRATIVE`     | `OUTSIDE_SUPERVISION_CLASS` | `PRIMARY_CONFIGURATION`        | `CONFIG_POLICY`          | La intención dominante define y versiona políticas, límites o reglas transversales reutilizables. La configuración afecta múltiples instancias futuras, conserva versión y no ejecuta por sí sola un caso operativo.                                       |
| `VSCREEN-0010` | Compromisos y transferencias internas                 | `viso`     | `VPROC-0004::STEP-TRACK_INTERNAL_COMMITMENTS`               | `SECONDARY_OPERATIONAL`     | `PRIMARY_ADMINISTRATIVE`       | `SECONDARY_SUPERVISION`     | `OUTSIDE_CONFIGURATION_CLASS`  | `NONE`                   | La intención dominante es administrar un caso, expediente, obligación o decisión; no mantener una regla o maestro reutilizable independiente.                                                                                                              |
| `VSCREEN-0011` | Embudo de candidatos                                  | `viso`     | `VPROC-0005::STEP-TRIAGE_CANDIDATES`                        | `OUTSIDE_OPERATIONAL_CLASS` | `PRIMARY_ADMINISTRATIVE`       | `OUTSIDE_SUPERVISION_CLASS` | `OUTSIDE_CONFIGURATION_CLASS`  | `NONE`                   | La intención dominante es administrar un caso, expediente, obligación o decisión; no mantener una regla o maestro reutilizable independiente.                                                                                                              |
| `VSCREEN-0012` | Caso de selección                                     | `viso`     | `VPROC-0005::STEP-EVALUATE_AND_DECIDE_CANDIDATE`            | `OUTSIDE_OPERATIONAL_CLASS` | `PRIMARY_ADMINISTRATIVE`       | `OUTSIDE_SUPERVISION_CLASS` | `OUTSIDE_CONFIGURATION_CLASS`  | `NONE`                   | La intención dominante es administrar un caso, expediente, obligación o decisión; no mantener una regla o maestro reutilizable independiente.                                                                                                              |
| `VSCREEN-0013` | Vinculación e incorporación                           | `viso`     | `VPROC-0006::STEP-ORCHESTRATE_ONBOARDING`                   | `OUTSIDE_OPERATIONAL_CLASS` | `PRIMARY_ADMINISTRATIVE`       | `OUTSIDE_SUPERVISION_CLASS` | `OUTSIDE_CONFIGURATION_CLASS`  | `NONE`                   | La intención dominante es administrar un caso, expediente, obligación o decisión; no mantener una regla o maestro reutilizable independiente.                                                                                                              |
| `VSCREEN-0014` | Directorio y expediente laboral                       | `viso`     | `VPROC-0006::STEP-MAINTAIN_EMPLOYMENT_RECORD`               | `OUTSIDE_OPERATIONAL_CLASS` | `PRIMARY_ADMINISTRATIVE`       | `OUTSIDE_SUPERVISION_CLASS` | `OUTSIDE_CONFIGURATION_CLASS`  | `NONE`                   | La intención dominante es administrar un caso, expediente, obligación o decisión; no mantener una regla o maestro reutilizable independiente.                                                                                                              |
| `VSCREEN-0015` | Programación laboral                                  | `viso`     | `VPROC-0007::STEP-PLAN_AND_PUBLISH_SCHEDULE`                | `SECONDARY_OPERATIONAL`     | `PRIMARY_ADMINISTRATIVE`       | `SECONDARY_SUPERVISION`     | `OUTSIDE_CONFIGURATION_CLASS`  | `NONE`                   | La intención dominante es administrar un caso, expediente, obligación o decisión; no mantener una regla o maestro reutilizable independiente.                                                                                                              |
| `VSCREEN-0016` | Revisión de asistencia                                | `viso`     | `VPROC-0008::STEP-REVIEW_ATTENDANCE_EXCEPTION`              | `SECONDARY_OPERATIONAL`     | `SECONDARY_ADMINISTRATIVE`     | `PRIMARY_SUPERVISION`       | `OUTSIDE_CONFIGURATION_CLASS`  | `NONE`                   | La intención dominante es vigilar carga, riesgo, desviaciones o resultados; la pantalla no mantiene configuración como objeto principal.                                                                                                                   |
| `VSCREEN-0017` | Novedades, ausencias y reemplazos                     | `viso`     | `VPROC-0009::STEP-RESOLVE_WORKFORCE_CASE`                   | `SECONDARY_OPERATIONAL`     | `PRIMARY_ADMINISTRATIVE`       | `SECONDARY_SUPERVISION`     | `OUTSIDE_CONFIGURATION_CLASS`  | `NONE`                   | La intención dominante es administrar un caso, expediente, obligación o decisión; no mantener una regla o maestro reutilizable independiente.                                                                                                              |
| `VSCREEN-0018` | Retiro y revocación coordinada                        | `viso`     | `VPROC-0011::STEP-CLOSE_EMPLOYMENT_AND_REVOKE`              | `OUTSIDE_OPERATIONAL_CLASS` | `PRIMARY_ADMINISTRATIVE`       | `OUTSIDE_SUPERVISION_CLASS` | `OUTSIDE_CONFIGURATION_CLASS`  | `NONE`                   | La intención dominante es administrar un caso, expediente, obligación o decisión; no mantener una regla o maestro reutilizable independiente.                                                                                                              |
| `VSCREEN-0019` | Catálogo de roles y permisos                          | `viso`     | `VPROC-0059::STEP-MAINTAIN_ACCESS_CATALOG`                  | `OUTSIDE_OPERATIONAL_CLASS` | `SECONDARY_ADMINISTRATIVE`     | `OUTSIDE_SUPERVISION_CLASS` | `PRIMARY_CONFIGURATION`        | `CONFIG_ACCESS_MODEL`    | La intención dominante mantiene el modelo o asignación versionada de acceso. La configuración afecta múltiples instancias futuras, conserva versión y no ejecuta por sí sola un caso operativo.                                                            |
| `VSCREEN-0020` | Perfil de acceso del trabajador                       | `viso`     | `VPROC-0059::STEP-ASSIGN_EFFECTIVE_ACCESS`                  | `OUTSIDE_OPERATIONAL_CLASS` | `PRIMARY_ADMINISTRATIVE`       | `OUTSIDE_SUPERVISION_CLASS` | `SECONDARY_CONFIGURATION`      | `CONFIG_ACCESS_MODEL`    | La pantalla mantiene el modelo o asignación versionada de acceso, pero su intención primaria ya es operativa, administrativa o de supervisión. La configuración permanece acotada, versionada y subordinada al contrato propietario.                       |
| `VSCREEN-0021` | Simulación de permisos y conflictos                   | `viso`     | `VPROC-0059::STEP-SIMULATE_ACCESS_DECISION`                 | `OUTSIDE_OPERATIONAL_CLASS` | `PRIMARY_ADMINISTRATIVE`       | `SECONDARY_SUPERVISION`     | `OUTSIDE_CONFIGURATION_CLASS`  | `NONE`                   | La intención dominante es administrar un caso, expediente, obligación o decisión; no mantener una regla o maestro reutilizable independiente.                                                                                                              |
| `VSCREEN-0022` | Gobierno de dispositivos compartidos                  | `viso`     | `VPROC-0059::STEP-GOVERN_SHARED_DEVICES`                    | `OUTSIDE_OPERATIONAL_CLASS` | `SECONDARY_ADMINISTRATIVE`     | `OUTSIDE_SUPERVISION_CLASS` | `PRIMARY_CONFIGURATION`        | `CONFIG_DEVICE_POLICY`   | La intención dominante gobierna capacidades, vigencia o parámetros de dispositivos. La configuración afecta múltiples instancias futuras, conserva versión y no ejecuta por sí sola un caso operativo.                                                     |
| `VSCREEN-0023` | Riesgos de seguridad y salud                          | `viso`     | `VPROC-0012::STEP-ASSESS_SST_RISK`                          | `OUTSIDE_OPERATIONAL_CLASS` | `PRIMARY_ADMINISTRATIVE`       | `SECONDARY_SUPERVISION`     | `OUTSIDE_CONFIGURATION_CLASS`  | `NONE`                   | La intención dominante es administrar un caso, expediente, obligación o decisión; no mantener una regla o maestro reutilizable independiente.                                                                                                              |
| `VSCREEN-0024` | Incidentes y emergencias                              | `viso`     | `VPROC-0013::STEP-MANAGE_INCIDENT_RESPONSE`                 | `SECONDARY_OPERATIONAL`     | `PRIMARY_ADMINISTRATIVE`       | `SECONDARY_SUPERVISION`     | `OUTSIDE_CONFIGURATION_CLASS`  | `NONE`                   | La intención dominante es administrar un caso, expediente, obligación o decisión; no mantener una regla o maestro reutilizable independiente.                                                                                                              |
| `VSCREEN-0025` | Controles de higiene y cumplimiento                   | `viso`     | `VPROC-0014::STEP-REVIEW_HYGIENE_COMPLIANCE`                | `SECONDARY_OPERATIONAL`     | `SECONDARY_ADMINISTRATIVE`     | `PRIMARY_SUPERVISION`       | `SECONDARY_CONFIGURATION`      | `CONFIG_CONTROL_PLAN`    | La pantalla mantiene planes, calendarios o controles recurrentes, pero su intención primaria ya es operativa, administrativa o de supervisión. La configuración permanece acotada, versionada y subordinada al contrato propietario.                       |
| `VSCREEN-0026` | Bandeja de casos administrativos transversales        | `viso`     | `VPROC-0004::STEP-TRIAGE_ADMIN_CASES`                       | `SECONDARY_OPERATIONAL`     | `PRIMARY_ADMINISTRATIVE`       | `SECONDARY_SUPERVISION`     | `OUTSIDE_CONFIGURATION_CLASS`  | `NONE`                   | La intención dominante es administrar un caso, expediente, obligación o decisión; no mantener una regla o maestro reutilizable independiente.                                                                                                              |
| `VSCREEN-0027` | Inicio personal del trabajador                        | `anima`    | `VPROC-0007::STEP-ENTER_PERSONAL_WORKSPACE`                 | `OUTSIDE_OPERATIONAL_CLASS` | `OUTSIDE_ADMINISTRATIVE_CLASS` | `OUTSIDE_SUPERVISION_CLASS` | `OUTSIDE_CONFIGURATION_CLASS`  | `NONE`                   | Es una superficie personal del trabajador. Consultar o modificar el caso propio no equivale a configurar el comportamiento empresarial.                                                                                                                    |
| `VSCREEN-0028` | Registro de entrada, pausa y salida                   | `anima`    | `VPROC-0008::STEP-CAPTURE_ATTENDANCE_EVENT`                 | `PRIMARY_OPERATIONAL`       | `OUTSIDE_ADMINISTRATIVE_CLASS` | `OUTSIDE_SUPERVISION_CLASS` | `OUTSIDE_CONFIGURATION_CLASS`  | `NONE`                   | La intención dominante es ejecutar o cerrar trabajo operativo vivo; los valores del caso no constituyen configuración reutilizable.                                                                                                                        |
| `VSCREEN-0029` | Mi programación                                       | `anima`    | `VPROC-0007::STEP-CONSULT_PUBLISHED_SCHEDULE`               | `SECONDARY_OPERATIONAL`     | `OUTSIDE_ADMINISTRATIVE_CLASS` | `OUTSIDE_SUPERVISION_CLASS` | `OUTSIDE_CONFIGURATION_CLASS`  | `NONE`                   | Es una superficie personal del trabajador. Consultar o modificar el caso propio no equivale a configurar el comportamiento empresarial.                                                                                                                    |
| `VSCREEN-0030` | Mi asistencia y solicitud de corrección               | `anima`    | `VPROC-0008::STEP-CONSULT_OR_REQUEST_ATTENDANCE_CORRECTION` | `SECONDARY_OPERATIONAL`     | `OUTSIDE_ADMINISTRATIVE_CLASS` | `OUTSIDE_SUPERVISION_CLASS` | `OUTSIDE_CONFIGURATION_CLASS`  | `NONE`                   | Es una superficie personal del trabajador. Consultar o modificar el caso propio no equivale a configurar el comportamiento empresarial.                                                                                                                    |
| `VSCREEN-0031` | Mis novedades, permisos y ausencias                   | `anima`    | `VPROC-0009::STEP-SUBMIT_PERSONAL_WORKFORCE_CASE`           | `SECONDARY_OPERATIONAL`     | `OUTSIDE_ADMINISTRATIVE_CLASS` | `OUTSIDE_SUPERVISION_CLASS` | `OUTSIDE_CONFIGURATION_CLASS`  | `NONE`                   | Es una superficie personal del trabajador. Consultar o modificar el caso propio no equivale a configurar el comportamiento empresarial.                                                                                                                    |
| `VSCREEN-0032` | Mi perfil laboral                                     | `anima`    | `VPROC-0006::STEP-MAINTAIN_SELF_SERVICE_PROFILE`            | `OUTSIDE_OPERATIONAL_CLASS` | `OUTSIDE_ADMINISTRATIVE_CLASS` | `OUTSIDE_SUPERVISION_CLASS` | `OUTSIDE_CONFIGURATION_CLASS`  | `NONE`                   | Es una superficie personal del trabajador. Consultar o modificar el caso propio no equivale a configurar el comportamiento empresarial.                                                                                                                    |
| `VSCREEN-0033` | Resumen de inventario y abastecimiento interno        | `nexo`     | `VPROC-0028::STEP-MONITOR_INTERNAL_SUPPLY`                  | `SECONDARY_OPERATIONAL`     | `SECONDARY_ADMINISTRATIVE`     | `PRIMARY_SUPERVISION`       | `OUTSIDE_CONFIGURATION_CLASS`  | `NONE`                   | La intención dominante es vigilar carga, riesgo, desviaciones o resultados; la pantalla no mantiene configuración como objeto principal.                                                                                                                   |
| `VSCREEN-0034` | Catálogo de productos físicos                         | `nexo`     | `VPROC-0015::STEP-CONSULT_PHYSICAL_PRODUCT_CATALOG`         | `SECONDARY_OPERATIONAL`     | `SECONDARY_ADMINISTRATIVE`     | `OUTSIDE_SUPERVISION_CLASS` | `PRIMARY_CONFIGURATION`        | `CONFIG_CATALOG`         | La intención dominante presenta el catálogo canónico de una entidad maestra reutilizable. La configuración afecta múltiples instancias futuras, conserva versión y no ejecuta por sí sola un caso operativo.                                               |
| `VSCREEN-0035` | Editor de producto, unidad y presentación             | `nexo`     | `VPROC-0015::STEP-MAINTAIN_PRODUCT_PRESENTATION`            | `OUTSIDE_OPERATIONAL_CLASS` | `SECONDARY_ADMINISTRATIVE`     | `OUTSIDE_SUPERVISION_CLASS` | `PRIMARY_CONFIGURATION`        | `CONFIG_MASTER_DATA`     | La intención dominante crea o mantiene datos maestros utilizados por múltiples instancias futuras. La configuración afecta múltiples instancias futuras, conserva versión y no ejecuta por sí sola un caso operativo.                                      |
| `VSCREEN-0036` | Especificaciones y criterios de calidad               | `nexo`     | `VPROC-0018::STEP-MAINTAIN_QUALITY_SPECIFICATION`           | `OUTSIDE_OPERATIONAL_CLASS` | `SECONDARY_ADMINISTRATIVE`     | `OUTSIDE_SUPERVISION_CLASS` | `PRIMARY_CONFIGURATION`        | `CONFIG_SPECIFICATION`   | La intención dominante define especificaciones y criterios reutilizables de aceptación. La configuración afecta múltiples instancias futuras, conserva versión y no ejecuta por sí sola un caso operativo.                                                 |
| `VSCREEN-0037` | Catálogo de ubicaciones                               | `nexo`     | `VPROC-0023::STEP-MAINTAIN_LOCATION_CATALOG`                | `OUTSIDE_OPERATIONAL_CLASS` | `SECONDARY_ADMINISTRATIVE`     | `OUTSIDE_SUPERVISION_CLASS` | `PRIMARY_CONFIGURATION`        | `CONFIG_STRUCTURE`       | La intención dominante mantiene una estructura reutilizable que organiza entidades, ubicaciones o ámbitos. La configuración afecta múltiples instancias futuras, conserva versión y no ejecuta por sí sola un caso operativo.                              |
| `VSCREEN-0038` | Identificación y detalle de ubicación                 | `nexo`     | `VPROC-0023::STEP-IDENTIFY_LOCATION_AND_CONTENT`            | `PRIMARY_OPERATIONAL`       | `OUTSIDE_ADMINISTRATIVE_CLASS` | `OUTSIDE_SUPERVISION_CLASS` | `OUTSIDE_CONFIGURATION_CLASS`  | `NONE`                   | Identifica una ubicación concreta y consulta su contenido; el catálogo reutilizable permanece en VSCREEN-0037.                                                                                                                                             |
| `VSCREEN-0039` | Consulta de existencias                               | `nexo`     | `VPROC-0024::STEP-CONSULT_STOCK_POSITION`                   | `SECONDARY_OPERATIONAL`     | `OUTSIDE_ADMINISTRATIVE_CLASS` | `PRIMARY_SUPERVISION`       | `OUTSIDE_CONFIGURATION_CLASS`  | `NONE`                   | La intención dominante es vigilar carga, riesgo, desviaciones o resultados; la pantalla no mantiene configuración como objeto principal.                                                                                                                   |
| `VSCREEN-0040` | Conteo de inventario                                  | `nexo`     | `VPROC-0026::STEP-CAPTURE_PHYSICAL_COUNT`                   | `PRIMARY_OPERATIONAL`       | `OUTSIDE_ADMINISTRATIVE_CLASS` | `OUTSIDE_SUPERVISION_CLASS` | `OUTSIDE_CONFIGURATION_CLASS`  | `NONE`                   | La intención dominante es ejecutar o cerrar trabajo operativo vivo; los valores del caso no constituyen configuración reutilizable.                                                                                                                        |
| `VSCREEN-0041` | Revisión de conteo y diferencias                      | `nexo`     | `VPROC-0026::STEP-REVIEW_COUNT_VARIANCE`                    | `PRIMARY_OPERATIONAL`       | `SECONDARY_ADMINISTRATIVE`     | `SECONDARY_SUPERVISION`     | `OUTSIDE_CONFIGURATION_CLASS`  | `NONE`                   | La intención dominante es ejecutar o cerrar trabajo operativo vivo; los valores del caso no constituyen configuración reutilizable.                                                                                                                        |
| `VSCREEN-0042` | Caso de ajuste de inventario                          | `nexo`     | `VPROC-0026::STEP-DECIDE_INVENTORY_ADJUSTMENT`              | `PRIMARY_OPERATIONAL`       | `SECONDARY_ADMINISTRATIVE`     | `SECONDARY_SUPERVISION`     | `OUTSIDE_CONFIGURATION_CLASS`  | `NONE`                   | La intención dominante es ejecutar o cerrar trabajo operativo vivo; los valores del caso no constituyen configuración reutilizable.                                                                                                                        |
| `VSCREEN-0043` | Confirmación de entrada a inventario                  | `nexo`     | `VPROC-0024::STEP-CONFIRM_STOCK_ENTRY`                      | `PRIMARY_OPERATIONAL`       | `OUTSIDE_ADMINISTRATIVE_CLASS` | `OUTSIDE_SUPERVISION_CLASS` | `OUTSIDE_CONFIGURATION_CLASS`  | `NONE`                   | La intención dominante es ejecutar o cerrar trabajo operativo vivo; los valores del caso no constituyen configuración reutilizable.                                                                                                                        |
| `VSCREEN-0044` | Retiro y consumo de existencias                       | `nexo`     | `VPROC-0025::STEP-EXECUTE_STOCK_WITHDRAWAL`                 | `PRIMARY_OPERATIONAL`       | `OUTSIDE_ADMINISTRATIVE_CLASS` | `OUTSIDE_SUPERVISION_CLASS` | `OUTSIDE_CONFIGURATION_CLASS`  | `NONE`                   | La intención dominante es ejecutar o cerrar trabajo operativo vivo; los valores del caso no constituyen configuración reutilizable.                                                                                                                        |
| `VSCREEN-0045` | Traslado interno de existencias                       | `nexo`     | `VPROC-0025::STEP-EXECUTE_INTERNAL_TRANSFER`                | `PRIMARY_OPERATIONAL`       | `OUTSIDE_ADMINISTRATIVE_CLASS` | `OUTSIDE_SUPERVISION_CLASS` | `OUTSIDE_CONFIGURATION_CLASS`  | `NONE`                   | La intención dominante es ejecutar o cerrar trabajo operativo vivo; los valores del caso no constituyen configuración reutilizable.                                                                                                                        |
| `VSCREEN-0046` | Solicitud de remisión                                 | `nexo`     | `VPROC-0028::STEP-SUBMIT_REPLENISHMENT_REQUEST`             | `PRIMARY_OPERATIONAL`       | `OUTSIDE_ADMINISTRATIVE_CLASS` | `OUTSIDE_SUPERVISION_CLASS` | `OUTSIDE_CONFIGURATION_CLASS`  | `NONE`                   | La intención dominante es ejecutar o cerrar trabajo operativo vivo; los valores del caso no constituyen configuración reutilizable.                                                                                                                        |
| `VSCREEN-0047` | Preparación de remisión                               | `nexo`     | `VPROC-0028::STEP-PREPARE_REPLENISHMENT`                    | `PRIMARY_OPERATIONAL`       | `OUTSIDE_ADMINISTRATIVE_CLASS` | `OUTSIDE_SUPERVISION_CLASS` | `OUTSIDE_CONFIGURATION_CLASS`  | `NONE`                   | La intención dominante es ejecutar o cerrar trabajo operativo vivo; los valores del caso no constituyen configuración reutilizable.                                                                                                                        |
| `VSCREEN-0048` | Carga y despacho de remisión                          | `nexo`     | `VPROC-0028::STEP-LOAD_AND_DISPATCH_REPLENISHMENT`          | `PRIMARY_OPERATIONAL`       | `OUTSIDE_ADMINISTRATIVE_CLASS` | `OUTSIDE_SUPERVISION_CLASS` | `OUTSIDE_CONFIGURATION_CLASS`  | `NONE`                   | La intención dominante es ejecutar o cerrar trabajo operativo vivo; los valores del caso no constituyen configuración reutilizable.                                                                                                                        |
| `VSCREEN-0049` | Seguimiento de remisión en tránsito                   | `nexo`     | `VPROC-0028::STEP-MONITOR_REPLENISHMENT_TRANSIT`            | `PRIMARY_OPERATIONAL`       | `OUTSIDE_ADMINISTRATIVE_CLASS` | `SECONDARY_SUPERVISION`     | `OUTSIDE_CONFIGURATION_CLASS`  | `NONE`                   | La intención dominante es ejecutar o cerrar trabajo operativo vivo; los valores del caso no constituyen configuración reutilizable.                                                                                                                        |
| `VSCREEN-0050` | Recepción de remisión                                 | `nexo`     | `VPROC-0028::STEP-RECEIVE_REPLENISHMENT`                    | `PRIMARY_OPERATIONAL`       | `OUTSIDE_ADMINISTRATIVE_CLASS` | `SECONDARY_SUPERVISION`     | `OUTSIDE_CONFIGURATION_CLASS`  | `NONE`                   | La intención dominante es ejecutar o cerrar trabajo operativo vivo; los valores del caso no constituyen configuración reutilizable.                                                                                                                        |
| `VSCREEN-0051` | Vencimiento, cuarentena, daño y merma                 | `nexo`     | `VPROC-0027::STEP-RESOLVE_STOCK_CONDITION`                  | `PRIMARY_OPERATIONAL`       | `SECONDARY_ADMINISTRATIVE`     | `SECONDARY_SUPERVISION`     | `OUTSIDE_CONFIGURATION_CLASS`  | `NONE`                   | La intención dominante es ejecutar o cerrar trabajo operativo vivo; los valores del caso no constituyen configuración reutilizable.                                                                                                                        |
| `VSCREEN-0052` | LPN, contenedores y reutilizables                     | `nexo`     | `VPROC-0032::STEP-MANAGE_LPN_AND_REUSABLES`                 | `PRIMARY_OPERATIONAL`       | `OUTSIDE_ADMINISTRATIVE_CLASS` | `OUTSIDE_SUPERVISION_CLASS` | `OUTSIDE_CONFIGURATION_CLASS`  | `NONE`                   | La intención dominante es ejecutar o cerrar trabajo operativo vivo; los valores del caso no constituyen configuración reutilizable.                                                                                                                        |
| `VSCREEN-0053` | Activos y custodia                                    | `nexo`     | `VPROC-0029::STEP-MANAGE_ASSET_CUSTODY`                     | `PRIMARY_OPERATIONAL`       | `SECONDARY_ADMINISTRATIVE`     | `SECONDARY_SUPERVISION`     | `OUTSIDE_CONFIGURATION_CLASS`  | `NONE`                   | La intención dominante es ejecutar o cerrar trabajo operativo vivo; los valores del caso no constituyen configuración reutilizable.                                                                                                                        |
| `VSCREEN-0054` | Etiquetas e impresión logística                       | `nexo`     | `VPROC-0024::STEP-ISSUE_LOGISTICS_LABEL`                    | `PRIMARY_OPERATIONAL`       | `OUTSIDE_ADMINISTRATIVE_CLASS` | `OUTSIDE_SUPERVISION_CLASS` | `OUTSIDE_CONFIGURATION_CLASS`  | `NONE`                   | La intención dominante es ejecutar o cerrar trabajo operativo vivo; los valores del caso no constituyen configuración reutilizable.                                                                                                                        |
| `VSCREEN-0055` | Inicio y cola de producción                           | `fogo`     | `VPROC-0033::STEP-TRIAGE_PRODUCTION_QUEUE`                  | `SECONDARY_OPERATIONAL`     | `SECONDARY_ADMINISTRATIVE`     | `PRIMARY_SUPERVISION`       | `OUTSIDE_CONFIGURATION_CLASS`  | `NONE`                   | La intención dominante es vigilar carga, riesgo, desviaciones o resultados; la pantalla no mantiene configuración como objeto principal.                                                                                                                   |
| `VSCREEN-0056` | Planeación de producción                              | `fogo`     | `VPROC-0033::STEP-PLAN_PRODUCTION`                          | `SECONDARY_OPERATIONAL`     | `SECONDARY_ADMINISTRATIVE`     | `PRIMARY_SUPERVISION`       | `OUTSIDE_CONFIGURATION_CLASS`  | `NONE`                   | La intención dominante es vigilar carga, riesgo, desviaciones o resultados; la pantalla no mantiene configuración como objeto principal.                                                                                                                   |
| `VSCREEN-0057` | Preparación e inicio de lote                          | `fogo`     | `VPROC-0034::STEP-PREPARE_AND_START_BATCH`                  | `PRIMARY_OPERATIONAL`       | `OUTSIDE_ADMINISTRATIVE_CLASS` | `OUTSIDE_SUPERVISION_CLASS` | `OUTSIDE_CONFIGURATION_CLASS`  | `NONE`                   | La intención dominante es ejecutar o cerrar trabajo operativo vivo; los valores del caso no constituyen configuración reutilizable.                                                                                                                        |
| `VSCREEN-0058` | Ejecución de lote                                     | `fogo`     | `VPROC-0034::STEP-EXECUTE_BATCH`                            | `PRIMARY_OPERATIONAL`       | `OUTSIDE_ADMINISTRATIVE_CLASS` | `OUTSIDE_SUPERVISION_CLASS` | `OUTSIDE_CONFIGURATION_CLASS`  | `NONE`                   | La intención dominante es ejecutar o cerrar trabajo operativo vivo; los valores del caso no constituyen configuración reutilizable.                                                                                                                        |
| `VSCREEN-0059` | Registro parcial de producción                        | `fogo`     | `VPROC-0034::STEP-CAPTURE_BATCH_PROGRESS`                   | `PRIMARY_OPERATIONAL`       | `OUTSIDE_ADMINISTRATIVE_CLASS` | `SECONDARY_SUPERVISION`     | `OUTSIDE_CONFIGURATION_CLASS`  | `NONE`                   | La intención dominante es ejecutar o cerrar trabajo operativo vivo; los valores del caso no constituyen configuración reutilizable.                                                                                                                        |
| `VSCREEN-0060` | Finalización y cierre de lote                         | `fogo`     | `VPROC-0037::STEP-CLOSE_BATCH`                              | `PRIMARY_OPERATIONAL`       | `OUTSIDE_ADMINISTRATIVE_CLASS` | `SECONDARY_SUPERVISION`     | `OUTSIDE_CONFIGURATION_CLASS`  | `NONE`                   | La intención dominante es ejecutar o cerrar trabajo operativo vivo; los valores del caso no constituyen configuración reutilizable.                                                                                                                        |
| `VSCREEN-0061` | Receta operativa                                      | `fogo`     | `VPROC-0016::STEP-CONSULT_APPLICABLE_RECIPE`                | `PRIMARY_OPERATIONAL`       | `OUTSIDE_ADMINISTRATIVE_CLASS` | `OUTSIDE_SUPERVISION_CLASS` | `OUTSIDE_CONFIGURATION_CLASS`  | `NONE`                   | La intención dominante es vigilar carga, riesgo, desviaciones o resultados; la pantalla no mantiene configuración como objeto principal.                                                                                                                   |
| `VSCREEN-0062` | Catálogo y editor de recetas                          | `fogo`     | `VPROC-0016::STEP-AUTHOR_RECIPE`                            | `OUTSIDE_OPERATIONAL_CLASS` | `SECONDARY_ADMINISTRATIVE`     | `OUTSIDE_SUPERVISION_CLASS` | `PRIMARY_CONFIGURATION`        | `CONFIG_MASTER_DATA`     | La intención dominante crea o mantiene datos maestros utilizados por múltiples instancias futuras. La configuración afecta múltiples instancias futuras, conserva versión y no ejecuta por sí sola un caso operativo.                                      |
| `VSCREEN-0063` | Revisión, aprobación y publicación de receta          | `fogo`     | `VPROC-0016::STEP-APPROVE_AND_PUBLISH_RECIPE`               | `OUTSIDE_OPERATIONAL_CLASS` | `SECONDARY_ADMINISTRATIVE`     | `OUTSIDE_SUPERVISION_CLASS` | `PRIMARY_CONFIGURATION`        | `CONFIG_PUBLICATION`     | La intención dominante revisa y publica una versión reutilizable que condiciona operación posterior. La configuración afecta múltiples instancias futuras, conserva versión y no ejecuta por sí sola un caso operativo.                                    |
| `VSCREEN-0064` | Prueba de receta y rendimiento                        | `fogo`     | `VPROC-0016::STEP-TEST_RECIPE_AND_YIELD`                    | `PRIMARY_OPERATIONAL`       | `SECONDARY_ADMINISTRATIVE`     | `SECONDARY_SUPERVISION`     | `OUTSIDE_CONFIGURATION_CLASS`  | `NONE`                   | La intención dominante es ejecutar o cerrar trabajo operativo vivo; los valores del caso no constituyen configuración reutilizable.                                                                                                                        |
| `VSCREEN-0065` | Control de calidad y liberación                       | `fogo`     | `VPROC-0035::STEP-DECIDE_QUALITY_RELEASE`                   | `PRIMARY_OPERATIONAL`       | `SECONDARY_ADMINISTRATIVE`     | `SECONDARY_SUPERVISION`     | `OUTSIDE_CONFIGURATION_CLASS`  | `NONE`                   | La intención dominante es ejecutar o cerrar trabajo operativo vivo; los valores del caso no constituyen configuración reutilizable.                                                                                                                        |
| `VSCREEN-0066` | Empaque, etiquetado y almacenamiento de terminado     | `fogo`     | `VPROC-0036::STEP-PACK_AND_TRANSFER_FINISHED_GOOD`          | `PRIMARY_OPERATIONAL`       | `OUTSIDE_ADMINISTRATIVE_CLASS` | `OUTSIDE_SUPERVISION_CLASS` | `OUTSIDE_CONFIGURATION_CLASS`  | `NONE`                   | La intención dominante es ejecutar o cerrar trabajo operativo vivo; los valores del caso no constituyen configuración reutilizable.                                                                                                                        |
| `VSCREEN-0067` | Reproceso, aprovechamiento, merma y cierre productivo | `fogo`     | `VPROC-0037::STEP-RESOLVE_PRODUCTION_DISPOSITION`           | `PRIMARY_OPERATIONAL`       | `SECONDARY_ADMINISTRATIVE`     | `SECONDARY_SUPERVISION`     | `OUTSIDE_CONFIGURATION_CLASS`  | `NONE`                   | La intención dominante es ejecutar o cerrar trabajo operativo vivo; los valores del caso no constituyen configuración reutilizable.                                                                                                                        |
| `VSCREEN-0068` | Bandeja de necesidades de compra                      | `origo`    | `VPROC-0019::STEP-TRIAGE_PURCHASE_NEEDS`                    | `SECONDARY_OPERATIONAL`     | `PRIMARY_ADMINISTRATIVE`       | `SECONDARY_SUPERVISION`     | `OUTSIDE_CONFIGURATION_CLASS`  | `NONE`                   | La intención dominante es administrar un caso, expediente, obligación o decisión; no mantener una regla o maestro reutilizable independiente.                                                                                                              |
| `VSCREEN-0069` | Solicitud de compra                                   | `origo`    | `VPROC-0019::STEP-SUBMIT_PURCHASE_REQUEST`                  | `OUTSIDE_OPERATIONAL_CLASS` | `PRIMARY_ADMINISTRATIVE`       | `OUTSIDE_SUPERVISION_CLASS` | `OUTSIDE_CONFIGURATION_CLASS`  | `NONE`                   | La intención dominante es administrar un caso, expediente, obligación o decisión; no mantener una regla o maestro reutilizable independiente.                                                                                                              |
| `VSCREEN-0070` | Catálogo de proveedores                               | `origo`    | `VPROC-0020::STEP-CONSULT_SUPPLIER_CATALOG`                 | `OUTSIDE_OPERATIONAL_CLASS` | `SECONDARY_ADMINISTRATIVE`     | `OUTSIDE_SUPERVISION_CLASS` | `PRIMARY_CONFIGURATION`        | `CONFIG_CATALOG`         | La intención dominante presenta el catálogo canónico de una entidad maestra reutilizable. La configuración afecta múltiples instancias futuras, conserva versión y no ejecuta por sí sola un caso operativo.                                               |
| `VSCREEN-0071` | Alta y expediente de proveedor                        | `origo`    | `VPROC-0020::STEP-ONBOARD_SUPPLIER`                         | `OUTSIDE_OPERATIONAL_CLASS` | `PRIMARY_ADMINISTRATIVE`       | `OUTSIDE_SUPERVISION_CLASS` | `SECONDARY_CONFIGURATION`      | `CONFIG_MASTER_DATA`     | La pantalla crea o mantiene datos maestros utilizados por múltiples instancias futuras, pero su intención primaria ya es operativa, administrativa o de supervisión. La configuración permanece acotada, versionada y subordinada al contrato propietario. |
| `VSCREEN-0072` | Comparación de cotizaciones                           | `origo`    | `VPROC-0020::STEP-COMPARE_QUOTES`                           | `OUTSIDE_OPERATIONAL_CLASS` | `PRIMARY_ADMINISTRATIVE`       | `OUTSIDE_SUPERVISION_CLASS` | `OUTSIDE_CONFIGURATION_CLASS`  | `NONE`                   | La intención dominante es administrar un caso, expediente, obligación o decisión; no mantener una regla o maestro reutilizable independiente.                                                                                                              |
| `VSCREEN-0073` | Editor de orden de compra                             | `origo`    | `VPROC-0021::STEP-PREPARE_PURCHASE_ORDER`                   | `OUTSIDE_OPERATIONAL_CLASS` | `PRIMARY_ADMINISTRATIVE`       | `OUTSIDE_SUPERVISION_CLASS` | `OUTSIDE_CONFIGURATION_CLASS`  | `NONE`                   | La intención dominante es administrar un caso, expediente, obligación o decisión; no mantener una regla o maestro reutilizable independiente.                                                                                                              |
| `VSCREEN-0074` | Bandeja de aprobaciones de compra                     | `origo`    | `VPROC-0021::STEP-APPROVE_PURCHASE`                         | `OUTSIDE_OPERATIONAL_CLASS` | `PRIMARY_ADMINISTRATIVE`       | `SECONDARY_SUPERVISION`     | `OUTSIDE_CONFIGURATION_CLASS`  | `NONE`                   | La intención dominante es administrar un caso, expediente, obligación o decisión; no mantener una regla o maestro reutilizable independiente.                                                                                                              |
| `VSCREEN-0075` | Detalle y seguimiento de orden                        | `origo`    | `VPROC-0021::STEP-MONITOR_PURCHASE_ORDER`                   | `SECONDARY_OPERATIONAL`     | `PRIMARY_ADMINISTRATIVE`       | `SECONDARY_SUPERVISION`     | `OUTSIDE_CONFIGURATION_CLASS`  | `NONE`                   | La intención dominante es administrar un caso, expediente, obligación o decisión; no mantener una regla o maestro reutilizable independiente.                                                                                                              |
| `VSCREEN-0076` | Cola de recepciones                                   | `origo`    | `VPROC-0022::STEP-TRIAGE_RECEIPT_QUEUE`                     | `SECONDARY_OPERATIONAL`     | `SECONDARY_ADMINISTRATIVE`     | `PRIMARY_SUPERVISION`       | `OUTSIDE_CONFIGURATION_CLASS`  | `NONE`                   | La intención dominante es vigilar carga, riesgo, desviaciones o resultados; la pantalla no mantiene configuración como objeto principal.                                                                                                                   |
| `VSCREEN-0077` | Recepción total o parcial                             | `origo`    | `VPROC-0022::STEP-RECEIVE_PURCHASE`                         | `PRIMARY_OPERATIONAL`       | `SECONDARY_ADMINISTRATIVE`     | `SECONDARY_SUPERVISION`     | `OUTSIDE_CONFIGURATION_CLASS`  | `NONE`                   | La intención dominante es ejecutar o cerrar trabajo operativo vivo; los valores del caso no constituyen configuración reutilizable.                                                                                                                        |
| `VSCREEN-0078` | Resolución de diferencias de recepción                | `origo`    | `VPROC-0022::STEP-RESOLVE_RECEIPT_VARIANCE`                 | `PRIMARY_OPERATIONAL`       | `SECONDARY_ADMINISTRATIVE`     | `SECONDARY_SUPERVISION`     | `OUTSIDE_CONFIGURATION_CLASS`  | `NONE`                   | La intención dominante es ejecutar o cerrar trabajo operativo vivo; los valores del caso no constituyen configuración reutilizable.                                                                                                                        |
| `VSCREEN-0079` | Historial y auditoría de abastecimiento               | `origo`    | `VPROC-0022::STEP-AUDIT_PROCUREMENT_CYCLE`                  | `OUTSIDE_OPERATIONAL_CLASS` | `SECONDARY_ADMINISTRATIVE`     | `OUTSIDE_SUPERVISION_CLASS` | `OUTSIDE_CONFIGURATION_CLASS`  | `NONE`                   | No define ni mantiene una estructura, política, maestro, especificación, plantilla, publicación o regla reutilizable bajo este contrato.                                                                                                                   |
| `VSCREEN-0080` | Inicio POS                                            | `pulso`    | `VPROC-0039::STEP-ENTER_POS_WORKSPACE`                      | `PRIMARY_OPERATIONAL`       | `OUTSIDE_ADMINISTRATIVE_CLASS` | `SECONDARY_SUPERVISION`     | `OUTSIDE_CONFIGURATION_CLASS`  | `NONE`                   | La intención dominante es vigilar carga, riesgo, desviaciones o resultados; la pantalla no mantiene configuración como objeto principal.                                                                                                                   |
| `VSCREEN-0081` | Creación de venta o pedido                            | `pulso`    | `VPROC-0039::STEP-CREATE_SALE_OR_ORDER`                     | `PRIMARY_OPERATIONAL`       | `OUTSIDE_ADMINISTRATIVE_CLASS` | `OUTSIDE_SUPERVISION_CLASS` | `OUTSIDE_CONFIGURATION_CLASS`  | `NONE`                   | La intención dominante es ejecutar o cerrar trabajo operativo vivo; los valores del caso no constituyen configuración reutilizable.                                                                                                                        |
| `VSCREEN-0082` | Mapa de salón y mesas                                 | `pulso`    | `VPROC-0038::STEP-MANAGE_TABLE_SERVICE`                     | `PRIMARY_OPERATIONAL`       | `OUTSIDE_ADMINISTRATIVE_CLASS` | `SECONDARY_SUPERVISION`     | `OUTSIDE_CONFIGURATION_CLASS`  | `NONE`                   | La intención dominante es ejecutar o cerrar trabajo operativo vivo; los valores del caso no constituyen configuración reutilizable.                                                                                                                        |
| `VSCREEN-0083` | Detalle y modificación de pedido                      | `pulso`    | `VPROC-0038::STEP-MODIFY_ACTIVE_ORDER`                      | `PRIMARY_OPERATIONAL`       | `OUTSIDE_ADMINISTRATIVE_CLASS` | `OUTSIDE_SUPERVISION_CLASS` | `OUTSIDE_CONFIGURATION_CLASS`  | `NONE`                   | La intención dominante es ejecutar o cerrar trabajo operativo vivo; los valores del caso no constituyen configuración reutilizable.                                                                                                                        |
| `VSCREEN-0084` | Cobro y medios de pago                                | `pulso`    | `VPROC-0043::STEP-COLLECT_PAYMENT`                          | `PRIMARY_OPERATIONAL`       | `OUTSIDE_ADMINISTRATIVE_CLASS` | `OUTSIDE_SUPERVISION_CLASS` | `OUTSIDE_CONFIGURATION_CLASS`  | `NONE`                   | La intención dominante es ejecutar o cerrar trabajo operativo vivo; los valores del caso no constituyen configuración reutilizable.                                                                                                                        |
| `VSCREEN-0085` | Identificación de cliente y acumulación               | `pulso`    | `VPROC-0045::STEP-IDENTIFY_CUSTOMER_AND_ACCRUE`             | `PRIMARY_OPERATIONAL`       | `OUTSIDE_ADMINISTRATIVE_CLASS` | `OUTSIDE_SUPERVISION_CLASS` | `OUTSIDE_CONFIGURATION_CLASS`  | `NONE`                   | La intención dominante es ejecutar o cerrar trabajo operativo vivo; los valores del caso no constituyen configuración reutilizable.                                                                                                                        |
| `VSCREEN-0086` | Redención de puntos o beneficios                      | `pulso`    | `VPROC-0045::STEP-REDEEM_LOYALTY_VALUE`                     | `PRIMARY_OPERATIONAL`       | `OUTSIDE_ADMINISTRATIVE_CLASS` | `OUTSIDE_SUPERVISION_CLASS` | `OUTSIDE_CONFIGURATION_CLASS`  | `NONE`                   | La intención dominante es ejecutar o cerrar trabajo operativo vivo; los valores del caso no constituyen configuración reutilizable.                                                                                                                        |
| `VSCREEN-0087` | Bandeja de pedidos de canales externos                | `pulso`    | `VPROC-0040::STEP-ADMIT_EXTERNAL_ORDER`                     | `PRIMARY_OPERATIONAL`       | `OUTSIDE_ADMINISTRATIVE_CLASS` | `SECONDARY_SUPERVISION`     | `OUTSIDE_CONFIGURATION_CLASS`  | `NONE`                   | La intención dominante es ejecutar o cerrar trabajo operativo vivo; los valores del caso no constituyen configuración reutilizable.                                                                                                                        |
| `VSCREEN-0088` | Seguimiento de preparación y entrega                  | `pulso`    | `VPROC-0039::STEP-MONITOR_ORDER_FULFILLMENT`                | `PRIMARY_OPERATIONAL`       | `OUTSIDE_ADMINISTRATIVE_CLASS` | `SECONDARY_SUPERVISION`     | `OUTSIDE_CONFIGURATION_CLASS`  | `NONE`                   | La intención dominante es ejecutar o cerrar trabajo operativo vivo; los valores del caso no constituyen configuración reutilizable.                                                                                                                        |
| `VSCREEN-0089` | Apertura de caja                                      | `pulso`    | `VPROC-0044::STEP-OPEN_CASH_SESSION`                        | `PRIMARY_OPERATIONAL`       | `OUTSIDE_ADMINISTRATIVE_CLASS` | `OUTSIDE_SUPERVISION_CLASS` | `OUTSIDE_CONFIGURATION_CLASS`  | `NONE`                   | La intención dominante es ejecutar o cerrar trabajo operativo vivo; los valores del caso no constituyen configuración reutilizable.                                                                                                                        |
| `VSCREEN-0090` | Cierre de caja                                        | `pulso`    | `VPROC-0044::STEP-CLOSE_CASH_SESSION`                       | `PRIMARY_OPERATIONAL`       | `SECONDARY_ADMINISTRATIVE`     | `SECONDARY_SUPERVISION`     | `OUTSIDE_CONFIGURATION_CLASS`  | `NONE`                   | La intención dominante es ejecutar o cerrar trabajo operativo vivo; los valores del caso no constituyen configuración reutilizable.                                                                                                                        |
| `VSCREEN-0091` | Anulación, devolución y reembolso                     | `pulso`    | `VPROC-0042::STEP-RESOLVE_REVERSAL_OR_REFUND`               | `PRIMARY_OPERATIONAL`       | `SECONDARY_ADMINISTRATIVE`     | `SECONDARY_SUPERVISION`     | `OUTSIDE_CONFIGURATION_CLASS`  | `NONE`                   | La intención dominante es ejecutar o cerrar trabajo operativo vivo; los valores del caso no constituyen configuración reutilizable.                                                                                                                        |
| `VSCREEN-0092` | Oferta, menú, precio comercial y disponibilidad       | `pulso`    | `VPROC-0017::STEP-PUBLISH_COMMERCIAL_OFFER`                 | `OUTSIDE_OPERATIONAL_CLASS` | `SECONDARY_ADMINISTRATIVE`     | `OUTSIDE_SUPERVISION_CLASS` | `PRIMARY_CONFIGURATION`        | `CONFIG_PUBLICATION`     | La intención dominante revisa y publica una versión reutilizable que condiciona operación posterior. La configuración afecta múltiples instancias futuras, conserva versión y no ejecuta por sí sola un caso operativo.                                    |
| `VSCREEN-0093` | Revisión de ventas, caja y terminales                 | `pulso`    | `VPROC-0044::STEP-REVIEW_SALES_AND_TERMINALS`               | `SECONDARY_OPERATIONAL`     | `SECONDARY_ADMINISTRATIVE`     | `PRIMARY_SUPERVISION`       | `OUTSIDE_CONFIGURATION_CLASS`  | `NONE`                   | La intención dominante es vigilar carga, riesgo, desviaciones o resultados; la pantalla no mantiene configuración como objeto principal.                                                                                                                   |
| `VSCREEN-0094` | Inicio financiero y ejecutivo                         | `numera`   | `VPROC-0061::STEP-REVIEW_FINANCIAL_POSITION`                | `OUTSIDE_OPERATIONAL_CLASS` | `SECONDARY_ADMINISTRATIVE`     | `PRIMARY_SUPERVISION`       | `OUTSIDE_CONFIGURATION_CLASS`  | `NONE`                   | La intención dominante es vigilar carga, riesgo, desviaciones o resultados; la pantalla no mantiene configuración como objeto principal.                                                                                                                   |
| `VSCREEN-0095` | Bandeja de hechos económicos                          | `numera`   | `VPROC-0051::STEP-TRIAGE_ECONOMIC_FACTS`                    | `OUTSIDE_OPERATIONAL_CLASS` | `PRIMARY_ADMINISTRATIVE`       | `OUTSIDE_SUPERVISION_CLASS` | `OUTSIDE_CONFIGURATION_CLASS`  | `NONE`                   | La intención dominante es administrar un caso, expediente, obligación o decisión; no mantener una regla o maestro reutilizable independiente.                                                                                                              |
| `VSCREEN-0096` | Registro de gasto y soporte                           | `numera`   | `VPROC-0051::STEP-CAPTURE_EXPENSE_AND_EVIDENCE`             | `OUTSIDE_OPERATIONAL_CLASS` | `PRIMARY_ADMINISTRATIVE`       | `OUTSIDE_SUPERVISION_CLASS` | `OUTSIDE_CONFIGURATION_CLASS`  | `NONE`                   | La intención dominante es administrar un caso, expediente, obligación o decisión; no mantener una regla o maestro reutilizable independiente.                                                                                                              |
| `VSCREEN-0097` | Bandeja de aprobaciones financieras                   | `numera`   | `VPROC-0052::STEP-APPROVE_FINANCIAL_DECISION`               | `OUTSIDE_OPERATIONAL_CLASS` | `PRIMARY_ADMINISTRATIVE`       | `SECONDARY_SUPERVISION`     | `OUTSIDE_CONFIGURATION_CLASS`  | `NONE`                   | La intención dominante es administrar un caso, expediente, obligación o decisión; no mantener una regla o maestro reutilizable independiente.                                                                                                              |
| `VSCREEN-0098` | Cuentas por pagar y obligaciones                      | `numera`   | `VPROC-0052::STEP-MANAGE_PAYABLE_OBLIGATION`                | `OUTSIDE_OPERATIONAL_CLASS` | `PRIMARY_ADMINISTRATIVE`       | `OUTSIDE_SUPERVISION_CLASS` | `OUTSIDE_CONFIGURATION_CLASS`  | `NONE`                   | La intención dominante es administrar un caso, expediente, obligación o decisión; no mantener una regla o maestro reutilizable independiente.                                                                                                              |
| `VSCREEN-0099` | Cuentas por cobrar y cartera                          | `numera`   | `VPROC-0053::STEP-MANAGE_RECEIVABLE`                        | `OUTSIDE_OPERATIONAL_CLASS` | `PRIMARY_ADMINISTRATIVE`       | `OUTSIDE_SUPERVISION_CLASS` | `OUTSIDE_CONFIGURATION_CLASS`  | `NONE`                   | La intención dominante es administrar un caso, expediente, obligación o decisión; no mantener una regla o maestro reutilizable independiente.                                                                                                              |
| `VSCREEN-0100` | Caja, bancos y movimientos financieros                | `numera`   | `VPROC-0052::STEP-EXECUTE_TREASURY_MOVEMENT`                | `OUTSIDE_OPERATIONAL_CLASS` | `PRIMARY_ADMINISTRATIVE`       | `OUTSIDE_SUPERVISION_CLASS` | `OUTSIDE_CONFIGURATION_CLASS`  | `NONE`                   | La intención dominante es administrar un caso, expediente, obligación o decisión; no mantener una regla o maestro reutilizable independiente.                                                                                                              |
| `VSCREEN-0101` | Conciliación de ventas y pagos                        | `numera`   | `VPROC-0051::STEP-RECONCILE_SALES_AND_PAYMENTS`             | `OUTSIDE_OPERATIONAL_CLASS` | `PRIMARY_ADMINISTRATIVE`       | `SECONDARY_SUPERVISION`     | `OUTSIDE_CONFIGURATION_CLASS`  | `NONE`                   | La intención dominante es administrar un caso, expediente, obligación o decisión; no mantener una regla o maestro reutilizable independiente.                                                                                                              |
| `VSCREEN-0102` | Conciliación de compras y recepciones                 | `numera`   | `VPROC-0051::STEP-RECONCILE_PURCHASES_AND_RECEIPTS`         | `OUTSIDE_OPERATIONAL_CLASS` | `PRIMARY_ADMINISTRATIVE`       | `SECONDARY_SUPERVISION`     | `OUTSIDE_CONFIGURATION_CLASS`  | `NONE`                   | La intención dominante es administrar un caso, expediente, obligación o decisión; no mantener una regla o maestro reutilizable independiente.                                                                                                              |
| `VSCREEN-0103` | Conciliación de inventario, producción y variaciones  | `numera`   | `VPROC-0054::STEP-RECONCILE_OPERATING_VARIANCES`            | `OUTSIDE_OPERATIONAL_CLASS` | `PRIMARY_ADMINISTRATIVE`       | `SECONDARY_SUPERVISION`     | `OUTSIDE_CONFIGURATION_CLASS`  | `NONE`                   | La intención dominante es administrar un caso, expediente, obligación o decisión; no mantener una regla o maestro reutilizable independiente.                                                                                                              |
| `VSCREEN-0104` | Costos, rentabilidad y escenarios                     | `numera`   | `VPROC-0054::STEP-ANALYZE_COST_AND_PROFITABILITY`           | `OUTSIDE_OPERATIONAL_CLASS` | `PRIMARY_ADMINISTRATIVE`       | `SECONDARY_SUPERVISION`     | `OUTSIDE_CONFIGURATION_CLASS`  | `NONE`                   | La intención dominante es administrar un caso, expediente, obligación o decisión; no mantener una regla o maestro reutilizable independiente.                                                                                                              |
| `VSCREEN-0105` | Cierre, reapertura y corrección de periodo            | `numera`   | `VPROC-0054::STEP-CLOSE_OR_REOPEN_PERIOD`                   | `OUTSIDE_OPERATIONAL_CLASS` | `PRIMARY_ADMINISTRATIVE`       | `SECONDARY_SUPERVISION`     | `OUTSIDE_CONFIGURATION_CLASS`  | `NONE`                   | La intención dominante es administrar un caso, expediente, obligación o decisión; no mantener una regla o maestro reutilizable independiente.                                                                                                              |
| `VSCREEN-0106` | Reportes y exportaciones financieras                  | `numera`   | `VPROC-0061::STEP-PUBLISH_FINANCIAL_REPORT`                 | `OUTSIDE_OPERATIONAL_CLASS` | `SECONDARY_ADMINISTRATIVE`     | `OUTSIDE_SUPERVISION_CLASS` | `OUTSIDE_CONFIGURATION_CLASS`  | `NONE`                   | La intención dominante es vigilar carga, riesgo, desviaciones o resultados; la pantalla no mantiene configuración como objeto principal.                                                                                                                   |
| `VSCREEN-0107` | Inicio del cliente y resumen de beneficios            | `pass`     | `VPROC-0045::STEP-ENTER_LOYALTY_HOME`                       | `OUTSIDE_OPERATIONAL_CLASS` | `OUTSIDE_ADMINISTRATIVE_CLASS` | `OUTSIDE_SUPERVISION_CLASS` | `OUTSIDE_CONFIGURATION_CLASS`  | `NONE`                   | Es una superficie de cliente. Preferencias, consentimientos, direcciones o elecciones propias no se clasifican como configuración empresarial.                                                                                                             |
| `VSCREEN-0108` | QR personal de identificación                         | `pass`     | `VPROC-0045::STEP-PRESENT_CUSTOMER_ID`                      | `OUTSIDE_OPERATIONAL_CLASS` | `OUTSIDE_ADMINISTRATIVE_CLASS` | `OUTSIDE_SUPERVISION_CLASS` | `OUTSIDE_CONFIGURATION_CLASS`  | `NONE`                   | Es una superficie de cliente. Preferencias, consentimientos, direcciones o elecciones propias no se clasifican como configuración empresarial.                                                                                                             |
| `VSCREEN-0109` | Catálogo de beneficios y recompensas                  | `pass`     | `VPROC-0045::STEP-CONSULT_REWARDS_CATALOG`                  | `OUTSIDE_OPERATIONAL_CLASS` | `OUTSIDE_ADMINISTRATIVE_CLASS` | `OUTSIDE_SUPERVISION_CLASS` | `OUTSIDE_CONFIGURATION_CLASS`  | `NONE`                   | Es una superficie de cliente. Preferencias, consentimientos, direcciones o elecciones propias no se clasifican como configuración empresarial.                                                                                                             |
| `VSCREEN-0110` | Ticket o QR de redención                              | `pass`     | `VPROC-0045::STEP-CREATE_REDEMPTION_INTENT`                 | `OUTSIDE_OPERATIONAL_CLASS` | `OUTSIDE_ADMINISTRATIVE_CLASS` | `OUTSIDE_SUPERVISION_CLASS` | `OUTSIDE_CONFIGURATION_CLASS`  | `NONE`                   | Es una superficie de cliente. Preferencias, consentimientos, direcciones o elecciones propias no se clasifican como configuración empresarial.                                                                                                             |
| `VSCREEN-0111` | Historial de puntos y redenciones                     | `pass`     | `VPROC-0045::STEP-AUDIT_PERSONAL_LOYALTY_LEDGER`            | `OUTSIDE_OPERATIONAL_CLASS` | `OUTSIDE_ADMINISTRATIVE_CLASS` | `OUTSIDE_SUPERVISION_CLASS` | `OUTSIDE_CONFIGURATION_CLASS`  | `NONE`                   | Es una superficie de cliente. Preferencias, consentimientos, direcciones o elecciones propias no se clasifican como configuración empresarial.                                                                                                             |
| `VSCREEN-0112` | Perfil, privacidad y consentimientos                  | `pass`     | `VPROC-0045::STEP-MAINTAIN_CUSTOMER_PROFILE_AND_CONSENT`    | `OUTSIDE_OPERATIONAL_CLASS` | `OUTSIDE_ADMINISTRATIVE_CLASS` | `OUTSIDE_SUPERVISION_CLASS` | `OUTSIDE_CONFIGURATION_CLASS`  | `NONE`                   | Es una superficie de cliente. Preferencias, consentimientos, direcciones o elecciones propias no se clasifican como configuración empresarial.                                                                                                             |
| `VSCREEN-0113` | Registro y seguimiento de decisiones empresariales    | `viso`     | `VPROC-0001::STEP-RECORD_AND_TRACK_DECISION`                | `OUTSIDE_OPERATIONAL_CLASS` | `PRIMARY_ADMINISTRATIVE`       | `SECONDARY_SUPERVISION`     | `OUTSIDE_CONFIGURATION_CLASS`  | `NONE`                   | La intención dominante es administrar un caso, expediente, obligación o decisión; no mantener una regla o maestro reutilizable independiente.                                                                                                              |
| `VSCREEN-0114` | Solicitudes y certificaciones de acceso               | `viso`     | `VPROC-0059::STEP-REVIEW_AND_CERTIFY_ACCESS`                | `OUTSIDE_OPERATIONAL_CLASS` | `PRIMARY_ADMINISTRATIVE`       | `SECONDARY_SUPERVISION`     | `OUTSIDE_CONFIGURATION_CLASS`  | `NONE`                   | La intención dominante es administrar un caso, expediente, obligación o decisión; no mantener una regla o maestro reutilizable independiente.                                                                                                              |
| `VSCREEN-0115` | Gobierno de documentos y evidencia                    | `viso`     | `VPROC-0060::STEP-GOVERN_DOCUMENT_EVIDENCE`                 | `OUTSIDE_OPERATIONAL_CLASS` | `PRIMARY_ADMINISTRATIVE`       | `OUTSIDE_SUPERVISION_CLASS` | `SECONDARY_CONFIGURATION`      | `CONFIG_POLICY`          | La pantalla define y versiona políticas, límites o reglas transversales reutilizables, pero su intención primaria ya es operativa, administrativa o de supervisión. La configuración permanece acotada, versionada y subordinada al contrato propietario.  |
| `VSCREEN-0116` | Registro de riesgos empresariales                     | `viso`     | `VPROC-0063::STEP-ASSESS_ENTERPRISE_RISK`                   | `OUTSIDE_OPERATIONAL_CLASS` | `PRIMARY_ADMINISTRATIVE`       | `SECONDARY_SUPERVISION`     | `OUTSIDE_CONFIGURATION_CLASS`  | `NONE`                   | La intención dominante es administrar un caso, expediente, obligación o decisión; no mantener una regla o maestro reutilizable independiente.                                                                                                              |
| `VSCREEN-0117` | Requerimientos de asesores y autoridades              | `viso`     | `VPROC-0064::STEP-MANAGE_EXTERNAL_REQUIREMENT`              | `OUTSIDE_OPERATIONAL_CLASS` | `PRIMARY_ADMINISTRATIVE`       | `SECONDARY_SUPERVISION`     | `OUTSIDE_CONFIGURATION_CLASS`  | `NONE`                   | La intención dominante es administrar un caso, expediente, obligación o decisión; no mantener una regla o maestro reutilizable independiente.                                                                                                              |
| `VSCREEN-0118` | Gestión de desempeño y desarrollo                     | `viso`     | `VPROC-0065::STEP-REVIEW_PERFORMANCE_AND_DEVELOPMENT`       | `OUTSIDE_OPERATIONAL_CLASS` | `PRIMARY_ADMINISTRATIVE`       | `SECONDARY_SUPERVISION`     | `OUTSIDE_CONFIGURATION_CLASS`  | `NONE`                   | La intención dominante es administrar un caso, expediente, obligación o decisión; no mantener una regla o maestro reutilizable independiente.                                                                                                              |
| `VSCREEN-0119` | Asignación y control de elementos de protección       | `viso`     | `VPROC-0066::STEP-ASSIGN_PROTECTIVE_EQUIPMENT`              | `SECONDARY_OPERATIONAL`     | `PRIMARY_ADMINISTRATIVE`       | `SECONDARY_SUPERVISION`     | `OUTSIDE_CONFIGURATION_CLASS`  | `NONE`                   | La intención dominante es administrar un caso, expediente, obligación o decisión; no mantener una regla o maestro reutilizable independiente.                                                                                                              |
| `VSCREEN-0120` | Mesa de servicio tecnológico                          | `viso`     | `VPROC-0058::STEP-RESOLVE_TECH_SERVICE_CASE`                | `SECONDARY_OPERATIONAL`     | `PRIMARY_ADMINISTRATIVE`       | `SECONDARY_SUPERVISION`     | `OUTSIDE_CONFIGURATION_CLASS`  | `NONE`                   | La intención dominante es administrar un caso, expediente, obligación o decisión; no mantener una regla o maestro reutilizable independiente.                                                                                                              |
| `VSCREEN-0121` | Continuidad, contingencia y recuperación              | `viso`     | `VPROC-0062::STEP-ACTIVATE_AND_RECOVER_CONTINUITY`          | `SECONDARY_OPERATIONAL`     | `PRIMARY_ADMINISTRATIVE`       | `SECONDARY_SUPERVISION`     | `SECONDARY_CONFIGURATION`      | `CONFIG_CONTROL_PLAN`    | La pantalla mantiene planes, calendarios o controles recurrentes, pero su intención primaria ya es operativa, administrativa o de supervisión. La configuración permanece acotada, versionada y subordinada al contrato propietario.                       |
| `VSCREEN-0122` | Privacidad, cumplimiento y conservación               | `viso`     | `VPROC-0060::STEP-GOVERN_PRIVACY_AND_RETENTION`             | `OUTSIDE_OPERATIONAL_CLASS` | `PRIMARY_ADMINISTRATIVE`       | `SECONDARY_SUPERVISION`     | `SECONDARY_CONFIGURATION`      | `CONFIG_POLICY`          | La pantalla define y versiona políticas, límites o reglas transversales reutilizables, pero su intención primaria ya es operativa, administrativa o de supervisión. La configuración permanece acotada, versionada y subordinada al contrato propietario.  |
| `VSCREEN-0123` | Gestión de comunicaciones internas                    | `viso`     | `VPROC-0004::STEP-PUBLISH_INTERNAL_COMMUNICATION`           | `OUTSIDE_OPERATIONAL_CLASS` | `PRIMARY_ADMINISTRATIVE`       | `OUTSIDE_SUPERVISION_CLASS` | `OUTSIDE_CONFIGURATION_CLASS`  | `NONE`                   | La intención dominante es administrar un caso, expediente, obligación o decisión; no mantener una regla o maestro reutilizable independiente.                                                                                                              |
| `VSCREEN-0124` | Mis comunicados laborales                             | `anima`    | `VPROC-0004::STEP-CONSULT_AND_ACKNOWLEDGE_COMMUNICATION`    | `OUTSIDE_OPERATIONAL_CLASS` | `OUTSIDE_ADMINISTRATIVE_CLASS` | `OUTSIDE_SUPERVISION_CLASS` | `OUTSIDE_CONFIGURATION_CLASS`  | `NONE`                   | Es una superficie personal del trabajador. Consultar o modificar el caso propio no equivale a configurar el comportamiento empresarial.                                                                                                                    |
| `VSCREEN-0125` | Mi carnet laboral                                     | `anima`    | `VPROC-0006::STEP-PRESENT_EMPLOYEE_CREDENTIAL`              | `OUTSIDE_OPERATIONAL_CLASS` | `OUTSIDE_ADMINISTRATIVE_CLASS` | `OUTSIDE_SUPERVISION_CLASS` | `OUTSIDE_CONFIGURATION_CLASS`  | `NONE`                   | Es una superficie personal del trabajador. Consultar o modificar el caso propio no equivale a configurar el comportamiento empresarial.                                                                                                                    |
| `VSCREEN-0126` | Mis documentos laborales                              | `anima`    | `VPROC-0060::STEP-CONSULT_OR_SUBMIT_EMPLOYMENT_DOCUMENT`    | `OUTSIDE_OPERATIONAL_CLASS` | `OUTSIDE_ADMINISTRATIVE_CLASS` | `OUTSIDE_SUPERVISION_CLASS` | `OUTSIDE_CONFIGURATION_CLASS`  | `NONE`                   | Es una superficie personal del trabajador. Consultar o modificar el caso propio no equivale a configurar el comportamiento empresarial.                                                                                                                    |
| `VSCREEN-0127` | Mi capacitación                                       | `anima`    | `VPROC-0065::STEP-COMPLETE_ASSIGNED_TRAINING`               | `OUTSIDE_OPERATIONAL_CLASS` | `OUTSIDE_ADMINISTRATIVE_CLASS` | `OUTSIDE_SUPERVISION_CLASS` | `OUTSIDE_CONFIGURATION_CLASS`  | `NONE`                   | Es una superficie personal del trabajador. Consultar o modificar el caso propio no equivale a configurar el comportamiento empresarial.                                                                                                                    |
| `VSCREEN-0128` | Mis objetivos y retroalimentación                     | `anima`    | `VPROC-0065::STEP-REVIEW_PERSONAL_OBJECTIVES`               | `OUTSIDE_OPERATIONAL_CLASS` | `OUTSIDE_ADMINISTRATIVE_CLASS` | `OUTSIDE_SUPERVISION_CLASS` | `OUTSIDE_CONFIGURATION_CLASS`  | `NONE`                   | Es una superficie personal del trabajador. Consultar o modificar el caso propio no equivale a configurar el comportamiento empresarial.                                                                                                                    |
| `VSCREEN-0129` | Mis solicitudes de soporte                            | `anima`    | `VPROC-0058::STEP-SUBMIT_AND_TRACK_SUPPORT_REQUEST`         | `SECONDARY_OPERATIONAL`     | `OUTSIDE_ADMINISTRATIVE_CLASS` | `OUTSIDE_SUPERVISION_CLASS` | `OUTSIDE_CONFIGURATION_CLASS`  | `NONE`                   | Es una superficie personal del trabajador. Consultar o modificar el caso propio no equivale a configurar el comportamiento empresarial.                                                                                                                    |
| `VSCREEN-0130` | Mis reportes de seguridad y salud                     | `anima`    | `VPROC-0013::STEP-REPORT_SST_EVENT`                         | `SECONDARY_OPERATIONAL`     | `OUTSIDE_ADMINISTRATIVE_CLASS` | `OUTSIDE_SUPERVISION_CLASS` | `OUTSIDE_CONFIGURATION_CLASS`  | `NONE`                   | Es una superficie personal del trabajador. Consultar o modificar el caso propio no equivale a configurar el comportamiento empresarial.                                                                                                                    |
| `VSCREEN-0131` | Mis elementos de protección                           | `anima`    | `VPROC-0066::STEP-ACKNOWLEDGE_PROTECTIVE_EQUIPMENT`         | `SECONDARY_OPERATIONAL`     | `OUTSIDE_ADMINISTRATIVE_CLASS` | `OUTSIDE_SUPERVISION_CLASS` | `OUTSIDE_CONFIGURATION_CLASS`  | `NONE`                   | Es una superficie personal del trabajador. Consultar o modificar el caso propio no equivale a configurar el comportamiento empresarial.                                                                                                                    |
| `VSCREEN-0132` | Reservas de inventario                                | `nexo`     | `VPROC-0028::STEP-RESERVE_STOCK`                            | `PRIMARY_OPERATIONAL`       | `OUTSIDE_ADMINISTRATIVE_CLASS` | `OUTSIDE_SUPERVISION_CLASS` | `OUTSIDE_CONFIGURATION_CLASS`  | `NONE`                   | La intención dominante es ejecutar o cerrar trabajo operativo vivo; los valores del caso no constituyen configuración reutilizable.                                                                                                                        |
| `VSCREEN-0133` | Planes y órdenes de mantenimiento de activos          | `nexo`     | `VPROC-0030::STEP-PLAN_AND_EXECUTE_ASSET_MAINTENANCE`       | `PRIMARY_OPERATIONAL`       | `SECONDARY_ADMINISTRATIVE`     | `SECONDARY_SUPERVISION`     | `SECONDARY_CONFIGURATION`      | `CONFIG_CONTROL_PLAN`    | La pantalla mantiene planes, calendarios o controles recurrentes, pero su intención primaria ya es operativa, administrativa o de supervisión. La configuración permanece acotada, versionada y subordinada al contrato propietario.                       |
| `VSCREEN-0134` | Garantías, seguros y reclamaciones de activos         | `nexo`     | `VPROC-0030::STEP-MANAGE_ASSET_CLAIM`                       | `OUTSIDE_OPERATIONAL_CLASS` | `PRIMARY_ADMINISTRATIVE`       | `SECONDARY_SUPERVISION`     | `OUTSIDE_CONFIGURATION_CLASS`  | `NONE`                   | La intención dominante es administrar un caso, expediente, obligación o decisión; no mantener una regla o maestro reutilizable independiente.                                                                                                              |
| `VSCREEN-0135` | Instancias y operación de kits                        | `nexo`     | `VPROC-0067::STEP-ASSEMBLE_AND_CONTROL_KIT`                 | `PRIMARY_OPERATIONAL`       | `OUTSIDE_ADMINISTRATIVE_CLASS` | `OUTSIDE_SUPERVISION_CLASS` | `OUTSIDE_CONFIGURATION_CLASS`  | `NONE`                   | Opera instancias de kit; la definición reutilizable quedó separada en VSCREEN-0176.                                                                                                                                                                        |
| `VSCREEN-0136` | Flota y vehículos                                     | `nexo`     | `VPROC-0031::STEP-MANAGE_FLEET_ASSET`                       | `SECONDARY_OPERATIONAL`     | `PRIMARY_ADMINISTRATIVE`       | `SECONDARY_SUPERVISION`     | `SECONDARY_CONFIGURATION`      | `CONFIG_MASTER_DATA`     | La pantalla crea o mantiene datos maestros utilizados por múltiples instancias futuras, pero su intención primaria ya es operativa, administrativa o de supervisión. La configuración permanece acotada, versionada y subordinada al contrato propietario. |
| `VSCREEN-0137` | Kilometraje y combustible                             | `nexo`     | `VPROC-0031::STEP-CAPTURE_MILEAGE_AND_FUEL`                 | `PRIMARY_OPERATIONAL`       | `OUTSIDE_ADMINISTRATIVE_CLASS` | `OUTSIDE_SUPERVISION_CLASS` | `OUTSIDE_CONFIGURATION_CLASS`  | `NONE`                   | La intención dominante es ejecutar o cerrar trabajo operativo vivo; los valores del caso no constituyen configuración reutilizable.                                                                                                                        |
| `VSCREEN-0138` | Planeación de rutas y despachos                       | `nexo`     | `VPROC-0048::STEP-PLAN_ROUTE_AND_DISPATCH`                  | `PRIMARY_OPERATIONAL`       | `OUTSIDE_ADMINISTRATIVE_CLASS` | `SECONDARY_SUPERVISION`     | `OUTSIDE_CONFIGURATION_CLASS`  | `NONE`                   | La intención dominante es ejecutar o cerrar trabajo operativo vivo; los valores del caso no constituyen configuración reutilizable.                                                                                                                        |
| `VSCREEN-0139` | Ejecución de ruta y prueba de entrega                 | `nexo`     | `VPROC-0049::STEP-EXECUTE_ROUTE_AND_PROVE_DELIVERY`         | `PRIMARY_OPERATIONAL`       | `OUTSIDE_ADMINISTRATIVE_CLASS` | `SECONDARY_SUPERVISION`     | `OUTSIDE_CONFIGURATION_CLASS`  | `NONE`                   | La intención dominante es ejecutar o cerrar trabajo operativo vivo; los valores del caso no constituyen configuración reutilizable.                                                                                                                        |
| `VSCREEN-0140` | Novedades, rechazos y retornos logísticos             | `nexo`     | `VPROC-0049::STEP-RESOLVE_LOGISTICS_EXCEPTION`              | `PRIMARY_OPERATIONAL`       | `OUTSIDE_ADMINISTRATIVE_CLASS` | `SECONDARY_SUPERVISION`     | `OUTSIDE_CONFIGURATION_CLASS`  | `NONE`                   | La intención dominante es ejecutar o cerrar trabajo operativo vivo; los valores del caso no constituyen configuración reutilizable.                                                                                                                        |
| `VSCREEN-0141` | Instalaciones, servicios y mantenimiento locativo     | `nexo`     | `VPROC-0055::STEP-MANAGE_FACILITY_SERVICE`                  | `PRIMARY_OPERATIONAL`       | `SECONDARY_ADMINISTRATIVE`     | `SECONDARY_SUPERVISION`     | `SECONDARY_CONFIGURATION`      | `CONFIG_CONTROL_PLAN`    | La pantalla mantiene planes, calendarios o controles recurrentes, pero su intención primaria ya es operativa, administrativa o de supervisión. La configuración permanece acotada, versionada y subordinada al contrato propietario.                       |
| `VSCREEN-0142` | Configuración de políticas y rutas logísticas         | `nexo`     | `VPROC-0048::STEP-CONFIGURE_LOGISTICS_POLICY`               | `OUTSIDE_OPERATIONAL_CLASS` | `SECONDARY_ADMINISTRATIVE`     | `OUTSIDE_SUPERVISION_CLASS` | `PRIMARY_CONFIGURATION`        | `CONFIG_POLICY`          | La intención dominante define y versiona políticas, límites o reglas transversales reutilizables. La configuración afecta múltiples instancias futuras, conserva versión y no ejecuta por sí sola un caso operativo.                                       |
| `VSCREEN-0143` | Diseñador de etiquetas logísticas                     | `nexo`     | `VPROC-0015::STEP-AUTHOR_LOGISTICS_LABEL_TEMPLATE`          | `OUTSIDE_OPERATIONAL_CLASS` | `SECONDARY_ADMINISTRATIVE`     | `OUTSIDE_SUPERVISION_CLASS` | `PRIMARY_CONFIGURATION`        | `CONFIG_TEMPLATE`        | La intención dominante diseña y versiona una plantilla reutilizable. La configuración afecta múltiples instancias futuras, conserva versión y no ejecuta por sí sola un caso operativo.                                                                    |
| `VSCREEN-0144` | Cola y trabajos de impresión logística                | `nexo`     | `VPROC-0024::STEP-OPERATE_PRINT_QUEUE`                      | `PRIMARY_OPERATIONAL`       | `OUTSIDE_ADMINISTRATIVE_CLASS` | `OUTSIDE_SUPERVISION_CLASS` | `OUTSIDE_CONFIGURATION_CLASS`  | `NONE`                   | Opera trabajos de impresión; la configuración de impresoras quedó separada en VSCREEN-0177.                                                                                                                                                                |
| `VSCREEN-0145` | Contratos, precios y condiciones de proveedor         | `origo`    | `VPROC-0020::STEP-GOVERN_SUPPLIER_TERMS`                    | `OUTSIDE_OPERATIONAL_CLASS` | `PRIMARY_ADMINISTRATIVE`       | `OUTSIDE_SUPERVISION_CLASS` | `SECONDARY_CONFIGURATION`      | `CONFIG_TERMS`           | La pantalla versiona condiciones contractuales o comerciales reutilizables, pero su intención primaria ya es operativa, administrativa o de supervisión. La configuración permanece acotada, versionada y subordinada al contrato propietario.             |
| `VSCREEN-0146` | Desempeño y reclamaciones de proveedor                | `origo`    | `VPROC-0020::STEP-REVIEW_SUPPLIER_PERFORMANCE`              | `OUTSIDE_OPERATIONAL_CLASS` | `PRIMARY_ADMINISTRATIVE`       | `SECONDARY_SUPERVISION`     | `OUTSIDE_CONFIGURATION_CLASS`  | `NONE`                   | La intención dominante es administrar un caso, expediente, obligación o decisión; no mantener una regla o maestro reutilizable independiente.                                                                                                              |
| `VSCREEN-0147` | Oportunidades y cotizaciones de catering o B2B        | `pulso`    | `VPROC-0041::STEP-QUALIFY_B2B_OPPORTUNITY`                  | `OUTSIDE_OPERATIONAL_CLASS` | `PRIMARY_ADMINISTRATIVE`       | `OUTSIDE_SUPERVISION_CLASS` | `OUTSIDE_CONFIGURATION_CLASS`  | `NONE`                   | La intención dominante es administrar un caso, expediente, obligación o decisión; no mantener una regla o maestro reutilizable independiente.                                                                                                              |
| `VSCREEN-0148` | Ejecución de catering o venta B2B                     | `pulso`    | `VPROC-0041::STEP-EXECUTE_B2B_COMMITMENT`                   | `PRIMARY_OPERATIONAL`       | `SECONDARY_ADMINISTRATIVE`     | `SECONDARY_SUPERVISION`     | `OUTSIDE_CONFIGURATION_CLASS`  | `NONE`                   | La intención dominante es ejecutar o cerrar trabajo operativo vivo; los valores del caso no constituyen configuración reutilizable.                                                                                                                        |
| `VSCREEN-0149` | Operación de reservas y eventos                       | `pulso`    | `VPROC-0047::STEP-MANAGE_RESERVATION_OR_EVENT`              | `PRIMARY_OPERATIONAL`       | `SECONDARY_ADMINISTRATIVE`     | `SECONDARY_SUPERVISION`     | `OUTSIDE_CONFIGURATION_CLASS`  | `NONE`                   | La intención dominante es ejecutar o cerrar trabajo operativo vivo; los valores del caso no constituyen configuración reutilizable.                                                                                                                        |
| `VSCREEN-0150` | Casos de reclamo y compensación                       | `pulso`    | `VPROC-0046::STEP-RESOLVE_CUSTOMER_CLAIM`                   | `PRIMARY_OPERATIONAL`       | `SECONDARY_ADMINISTRATIVE`     | `SECONDARY_SUPERVISION`     | `OUTSIDE_CONFIGURATION_CLASS`  | `NONE`                   | La intención dominante es ejecutar o cerrar trabajo operativo vivo; los valores del caso no constituyen configuración reutilizable.                                                                                                                        |
| `VSCREEN-0151` | Coordinación de entrega mediante tercero              | `pulso`    | `VPROC-0050::STEP-COORDINATE_THIRD_PARTY_DELIVERY`          | `PRIMARY_OPERATIONAL`       | `SECONDARY_ADMINISTRATIVE`     | `SECONDARY_SUPERVISION`     | `OUTSIDE_CONFIGURATION_CLASS`  | `NONE`                   | La intención dominante es ejecutar o cerrar trabajo operativo vivo; los valores del caso no constituyen configuración reutilizable.                                                                                                                        |
| `VSCREEN-0152` | Análisis de satisfacción y servicio                   | `pulso`    | `VPROC-0068::STEP-ANALYZE_SERVICE_SATISFACTION`             | `OUTSIDE_OPERATIONAL_CLASS` | `SECONDARY_ADMINISTRATIVE`     | `PRIMARY_SUPERVISION`       | `OUTSIDE_CONFIGURATION_CLASS`  | `NONE`                   | La intención dominante es vigilar carga, riesgo, desviaciones o resultados; la pantalla no mantiene configuración como objeto principal.                                                                                                                   |
| `VSCREEN-0153` | Paquete laboral para pagos y beneficios               | `numera`   | `VPROC-0010::STEP-PREPARE_LABOR_PAYMENT_PACKAGE`            | `OUTSIDE_OPERATIONAL_CLASS` | `PRIMARY_ADMINISTRATIVE`       | `OUTSIDE_SUPERVISION_CLASS` | `OUTSIDE_CONFIGURATION_CLASS`  | `NONE`                   | La intención dominante es administrar un caso, expediente, obligación o decisión; no mantener una regla o maestro reutilizable independiente.                                                                                                              |
| `VSCREEN-0154` | Facturas y documentos fiscales                        | `numera`   | `VPROC-0051::STEP-MANAGE_FISCAL_DOCUMENT`                   | `OUTSIDE_OPERATIONAL_CLASS` | `PRIMARY_ADMINISTRATIVE`       | `OUTSIDE_SUPERVISION_CLASS` | `OUTSIDE_CONFIGURATION_CLASS`  | `NONE`                   | La intención dominante es administrar un caso, expediente, obligación o decisión; no mantener una regla o maestro reutilizable independiente.                                                                                                              |
| `VSCREEN-0155` | Tesorería y programación de pagos                     | `numera`   | `VPROC-0052::STEP-PLAN_AND_EXECUTE_PAYMENTS`                | `OUTSIDE_OPERATIONAL_CLASS` | `PRIMARY_ADMINISTRATIVE`       | `SECONDARY_SUPERVISION`     | `OUTSIDE_CONFIGURATION_CLASS`  | `NONE`                   | La intención dominante es administrar un caso, expediente, obligación o decisión; no mantener una regla o maestro reutilizable independiente.                                                                                                              |
| `VSCREEN-0156` | Presupuestos, escenarios y forecast                   | `numera`   | `VPROC-0069::STEP-PLAN_BUDGET_AND_FORECAST`                 | `OUTSIDE_OPERATIONAL_CLASS` | `PRIMARY_ADMINISTRATIVE`       | `SECONDARY_SUPERVISION`     | `OUTSIDE_CONFIGURATION_CLASS`  | `NONE`                   | La intención dominante es administrar un caso, expediente, obligación o decisión; no mantener una regla o maestro reutilizable independiente.                                                                                                              |
| `VSCREEN-0157` | Impuestos y obligaciones de cumplimiento              | `numera`   | `VPROC-0052::STEP-MANAGE_TAX_OBLIGATION`                    | `OUTSIDE_OPERATIONAL_CLASS` | `PRIMARY_ADMINISTRATIVE`       | `SECONDARY_SUPERVISION`     | `SECONDARY_CONFIGURATION`      | `CONFIG_CONTROL_PLAN`    | La pantalla mantiene planes, calendarios o controles recurrentes, pero su intención primaria ya es operativa, administrativa o de supervisión. La configuración permanece acotada, versionada y subordinada al contrato propietario.                       |
| `VSCREEN-0158` | Distribución y asignación de costos                   | `numera`   | `VPROC-0054::STEP-ALLOCATE_COSTS`                           | `OUTSIDE_OPERATIONAL_CLASS` | `PRIMARY_ADMINISTRATIVE`       | `OUTSIDE_SUPERVISION_CLASS` | `SECONDARY_CONFIGURATION`      | `CONFIG_ALLOCATION_RULE` | La pantalla define reglas reutilizables de distribución o asignación, pero su intención primaria ya es operativa, administrativa o de supervisión. La configuración permanece acotada, versionada y subordinada al contrato propietario.                   |
| `VSCREEN-0159` | Indicadores, análisis y planes de mejora              | `numera`   | `VPROC-0061::STEP-ANALYZE_AND_PLAN_IMPROVEMENT`             | `OUTSIDE_OPERATIONAL_CLASS` | `SECONDARY_ADMINISTRATIVE`     | `PRIMARY_SUPERVISION`       | `OUTSIDE_CONFIGURATION_CLASS`  | `NONE`                   | La intención dominante es vigilar carga, riesgo, desviaciones o resultados; la pantalla no mantiene configuración como objeto principal.                                                                                                                   |
| `VSCREEN-0160` | Inicio y selección del portal de compras              | `pass`     | `VPROC-0039::STEP-ENTER_CUSTOMER_COMMERCE`                  | `OUTSIDE_OPERATIONAL_CLASS` | `OUTSIDE_ADMINISTRATIVE_CLASS` | `OUTSIDE_SUPERVISION_CLASS` | `OUTSIDE_CONFIGURATION_CLASS`  | `NONE`                   | Es una superficie de cliente. Preferencias, consentimientos, direcciones o elecciones propias no se clasifican como configuración empresarial.                                                                                                             |
| `VSCREEN-0161` | Menú y catálogo comercial del cliente                 | `pass`     | `VPROC-0017::STEP-BROWSE_COMMERCIAL_OFFER`                  | `OUTSIDE_OPERATIONAL_CLASS` | `OUTSIDE_ADMINISTRATIVE_CLASS` | `OUTSIDE_SUPERVISION_CLASS` | `OUTSIDE_CONFIGURATION_CLASS`  | `NONE`                   | Es una superficie de cliente. Preferencias, consentimientos, direcciones o elecciones propias no se clasifican como configuración empresarial.                                                                                                             |
| `VSCREEN-0162` | Carrito y configuración del pedido                    | `pass`     | `VPROC-0039::STEP-CONFIGURE_CART`                           | `OUTSIDE_OPERATIONAL_CLASS` | `OUTSIDE_ADMINISTRATIVE_CLASS` | `OUTSIDE_SUPERVISION_CLASS` | `OUTSIDE_CONFIGURATION_CLASS`  | `NONE`                   | Configura una instancia concreta del pedido desde el canal de cliente; no define reglas, maestros ni parámetros reutilizables del sistema.                                                                                                                 |
| `VSCREEN-0163` | Dirección, modalidad y programación de entrega        | `pass`     | `VPROC-0050::STEP-SELECT_FULFILLMENT`                       | `OUTSIDE_OPERATIONAL_CLASS` | `OUTSIDE_ADMINISTRATIVE_CLASS` | `OUTSIDE_SUPERVISION_CLASS` | `OUTSIDE_CONFIGURATION_CLASS`  | `NONE`                   | Es una superficie de cliente. Preferencias, consentimientos, direcciones o elecciones propias no se clasifican como configuración empresarial.                                                                                                             |
| `VSCREEN-0164` | Revisión, checkout e inicio de pago                   | `pass`     | `VPROC-0043::STEP-REVIEW_AND_START_PAYMENT`                 | `OUTSIDE_OPERATIONAL_CLASS` | `OUTSIDE_ADMINISTRATIVE_CLASS` | `OUTSIDE_SUPERVISION_CLASS` | `OUTSIDE_CONFIGURATION_CLASS`  | `NONE`                   | Es una superficie de cliente. Preferencias, consentimientos, direcciones o elecciones propias no se clasifican como configuración empresarial.                                                                                                             |
| `VSCREEN-0165` | Confirmación de pedido y retorno de pago              | `pass`     | `VPROC-0043::STEP-PRESENT_ORDER_RECEIPT`                    | `OUTSIDE_OPERATIONAL_CLASS` | `OUTSIDE_ADMINISTRATIVE_CLASS` | `OUTSIDE_SUPERVISION_CLASS` | `OUTSIDE_CONFIGURATION_CLASS`  | `NONE`                   | Es una superficie de cliente. Preferencias, consentimientos, direcciones o elecciones propias no se clasifican como configuración empresarial.                                                                                                             |
| `VSCREEN-0166` | Mis pedidos y detalle                                 | `pass`     | `VPROC-0039::STEP-CONSULT_PERSONAL_ORDERS`                  | `OUTSIDE_OPERATIONAL_CLASS` | `OUTSIDE_ADMINISTRATIVE_CLASS` | `OUTSIDE_SUPERVISION_CLASS` | `OUTSIDE_CONFIGURATION_CLASS`  | `NONE`                   | Es una superficie de cliente. Preferencias, consentimientos, direcciones o elecciones propias no se clasifican como configuración empresarial.                                                                                                             |
| `VSCREEN-0167` | Seguimiento de preparación y entrega del cliente      | `pass`     | `VPROC-0050::STEP-TRACK_PERSONAL_FULFILLMENT`               | `OUTSIDE_OPERATIONAL_CLASS` | `OUTSIDE_ADMINISTRATIVE_CLASS` | `OUTSIDE_SUPERVISION_CLASS` | `OUTSIDE_CONFIGURATION_CLASS`  | `NONE`                   | Es una superficie de cliente. Preferencias, consentimientos, direcciones o elecciones propias no se clasifican como configuración empresarial.                                                                                                             |
| `VSCREEN-0168` | Chat y comunicación asociada al pedido                | `pass`     | `VPROC-0047::STEP-COMMUNICATE_ABOUT_ORDER`                  | `OUTSIDE_OPERATIONAL_CLASS` | `OUTSIDE_ADMINISTRATIVE_CLASS` | `OUTSIDE_SUPERVISION_CLASS` | `OUTSIDE_CONFIGURATION_CLASS`  | `NONE`                   | Es una superficie de cliente. Preferencias, consentimientos, direcciones o elecciones propias no se clasifican como configuración empresarial.                                                                                                             |
| `VSCREEN-0169` | Mis reclamos y casos de servicio                      | `pass`     | `VPROC-0046::STEP-SUBMIT_AND_TRACK_CLAIM`                   | `OUTSIDE_OPERATIONAL_CLASS` | `OUTSIDE_ADMINISTRATIVE_CLASS` | `OUTSIDE_SUPERVISION_CLASS` | `OUTSIDE_CONFIGURATION_CLASS`  | `NONE`                   | Es una superficie de cliente. Preferencias, consentimientos, direcciones o elecciones propias no se clasifican como configuración empresarial.                                                                                                             |
| `VSCREEN-0170` | Mis reservas y eventos                                | `pass`     | `VPROC-0047::STEP-MANAGE_PERSONAL_RESERVATION`              | `OUTSIDE_OPERATIONAL_CLASS` | `OUTSIDE_ADMINISTRATIVE_CLASS` | `OUTSIDE_SUPERVISION_CLASS` | `OUTSIDE_CONFIGURATION_CLASS`  | `NONE`                   | Es una superficie de cliente. Preferencias, consentimientos, direcciones o elecciones propias no se clasifican como configuración empresarial.                                                                                                             |
| `VSCREEN-0171` | Calificación y satisfacción                           | `pass`     | `VPROC-0068::STEP-SUBMIT_SATISFACTION_RATING`               | `OUTSIDE_OPERATIONAL_CLASS` | `OUTSIDE_ADMINISTRATIVE_CLASS` | `OUTSIDE_SUPERVISION_CLASS` | `OUTSIDE_CONFIGURATION_CLASS`  | `NONE`                   | Es una superficie de cliente. Preferencias, consentimientos, direcciones o elecciones propias no se clasifican como configuración empresarial.                                                                                                             |
| `VSCREEN-0172` | Comunicaciones y notificaciones del cliente           | `pass`     | `VPROC-0047::STEP-CONSULT_CUSTOMER_COMMUNICATION`           | `OUTSIDE_OPERATIONAL_CLASS` | `OUTSIDE_ADMINISTRATIVE_CLASS` | `OUTSIDE_SUPERVISION_CLASS` | `OUTSIDE_CONFIGURATION_CLASS`  | `NONE`                   | Es una superficie de cliente. Preferencias, consentimientos, direcciones o elecciones propias no se clasifican como configuración empresarial.                                                                                                             |
| `VSCREEN-0173` | Trazabilidad e investigación de lote                  | `fogo`     | `VPROC-0035::STEP-INVESTIGATE_BATCH_TRACEABILITY`           | `OUTSIDE_OPERATIONAL_CLASS` | `SECONDARY_ADMINISTRATIVE`     | `OUTSIDE_SUPERVISION_CLASS` | `OUTSIDE_CONFIGURATION_CLASS`  | `NONE`                   | Reconstruye e investiga historia de lote; su clase primaria corresponde a auditoría y se resolverá en PROC-SCREEN-009.                                                                                                                                     |
| `VSCREEN-0174` | Controles operativos de inocuidad                     | `fogo`     | `VPROC-0014::STEP-EXECUTE_FOOD_SAFETY_CONTROL`              | `PRIMARY_OPERATIONAL`       | `SECONDARY_ADMINISTRATIVE`     | `SECONDARY_SUPERVISION`     | `OUTSIDE_CONFIGURATION_CLASS`  | `NONE`                   | La intención dominante es ejecutar o cerrar trabajo operativo vivo; los valores del caso no constituyen configuración reutilizable.                                                                                                                        |
| `VSCREEN-0175` | Seguridad de cuenta y sesiones                        | `shell`    | `VPROC-0059::STEP-MANAGE_ACCOUNT_SECURITY`                  | `OUTSIDE_OPERATIONAL_CLASS` | `OUTSIDE_ADMINISTRATIVE_CLASS` | `OUTSIDE_SUPERVISION_CLASS` | `OUTSIDE_CONFIGURATION_CLASS`  | `NONE`                   | Resuelve acceso, sesión, contexto o cuenta en tiempo de ejecución; no mantiene configuración empresarial reutilizable.                                                                                                                                     |
| `VSCREEN-0176` | Definición de kits y conjuntos                        | `nexo`     | `VPROC-0067::STEP-MAINTAIN_KIT_DEFINITION`                  | `OUTSIDE_OPERATIONAL_CLASS` | `SECONDARY_ADMINISTRATIVE`     | `OUTSIDE_SUPERVISION_CLASS` | `PRIMARY_CONFIGURATION`        | `CONFIG_MASTER_DATA`     | Define y versiona el maestro reutilizable consumido por futuras instancias de kit.                                                                                                                                                                         |
| `VSCREEN-0177` | Configuración de impresoras logísticas                | `nexo`     | `VPROC-0024::STEP-CONFIGURE_LOGISTICS_PRINTERS`             | `OUTSIDE_OPERATIONAL_CLASS` | `SECONDARY_ADMINISTRATIVE`     | `OUTSIDE_SUPERVISION_CLASS` | `PRIMARY_CONFIGURATION`        | `CONFIG_DEVICE_POLICY`   | Mantiene impresoras, capacidades, destinos, vigencia y políticas reutilizables.                                                                                                                                                                            |

---

#### 13. Resumen por aplicación

| Aplicación | Primaria configuración | Secundaria configuración | Fuera de clase |   Total |
| ---------- | ---------------------: | -----------------------: | -------------: | ------: |
| `shell`    |                      0 |                        0 |              7 |       7 |
| `viso`     |                      4 |                        5 |             22 |      31 |
| `anima`    |                      0 |                        0 |             14 |      14 |
| `nexo`     |                      8 |                        3 |             26 |      37 |
| `fogo`     |                      2 |                        0 |             13 |      15 |
| `origo`    |                      1 |                        2 |             11 |      14 |
| `pulso`    |                      1 |                        0 |             19 |      20 |
| `numera`   |                      0 |                        2 |             18 |      20 |
| `pass`     |                      0 |                        0 |             19 |      19 |
| **Total**  |                 **16** |                   **12** |        **149** | **177** |

La aplicación no determina la clase. El resumen solo reconcilia las 177 filas físicas.

---

#### 14. Resumen por patrón

| Patrón                                    | Pantallas |
| ----------------------------------------- | --------: |
| `CONFIG_STRUCTURE`                        |         2 |
| `CONFIG_POLICY`                           |         4 |
| `CONFIG_ACCESS_MODEL`                     |         2 |
| `CONFIG_DEVICE_POLICY`                    |         2 |
| `CONFIG_CATALOG`                          |         2 |
| `CONFIG_MASTER_DATA`                      |         5 |
| `CONFIG_SPECIFICATION`                    |         1 |
| `CONFIG_PUBLICATION`                      |         2 |
| `CONFIG_TEMPLATE`                         |         1 |
| `CONFIG_CONTROL_PLAN`                     |         5 |
| `CONFIG_TERMS`                            |         1 |
| `CONFIG_ALLOCATION_RULE`                  |         1 |
| **Total con relevancia de configuración** |    **28** |

Las 146 pantallas con `NONE` continúan hacia auditoría, personal o cliente, o conservan una clase primaria ya aprobada.

---

#### 15. Publicación, vigencia e impacto

Toda configuración material deberá declarar posteriormente:

```text
configuration_object_id
configuration_version
lifecycle_status
effective_from
effective_until
scope
affected_processes
affected_screens
impact_summary
validation_result
approved_by
published_at
supersedes
rollback_target
```

Reglas:

1. editar no equivale a publicar;
2. publicar no reescribe casos históricos;
3. el consumidor deberá conocer la versión efectiva;
4. una vigencia futura no podrá aplicarse prematuramente;
5. la retirada conservará historia;
6. el rollback creará una nueva decisión o reactivación trazable;
7. cambios materiales repetirán validación y aprobación;
8. configuraciones sensibles exigirán segregación y autorización de servidor.

---

#### 16. Compatibilidad con clases anteriores

```text
PRIMARY_CONFIGURATION + cualquier otra clase primaria = PROHIBIDO

SECONDARY_CONFIGURATION + PRIMARY_OPERATIONAL = PERMITIDO
SECONDARY_CONFIGURATION + PRIMARY_ADMINISTRATIVE = PERMITIDO
SECONDARY_CONFIGURATION + PRIMARY_SUPERVISION = PERMITIDO
```

La coexistencia secundaria deberá tener fundamento y patrón explícitos.

---

#### 17. Cambio y versionado

Cambiar `configuration_fit` o `configuration_pattern` exige:

1. propuesta trazable;
2. comparación de intención, reutilización, alcance, versión e impacto;
3. conservación del valor anterior;
4. nueva versión de clasificación;
5. revisión de actores, permisos, acciones, auditoría, métricas y pruebas;
6. actualización coordinada del catálogo cuando cambie legítimamente el nombre;
7. nueva identidad de pantalla cuando cambie materialmente la intención principal.

Una tarea de clasificación nunca podrá corregir un nombre “de paso”.

---

#### 18. Validaciones obligatorias

La compilación deberá fallar cuando:

1. falte una de las 177 pantallas;
2. una pantalla aparezca más de una vez;
3. un nombre difiera del catálogo canónico;
4. falte `configuration_fit`;
5. el valor no pertenezca al vocabulario;
6. una primaria o secundaria use `NONE`;
7. una pantalla fuera de clase use un patrón;
8. falte fundamento;
9. las clases anteriores no coincidan;
10. exista otra clase primaria junto con `PRIMARY_CONFIGURATION`;
11. los conteos no sean 16, 12 y 149;
12. los patrones no sumen 29;
13. una personalización de caso se clasifique como configuración;
14. una preferencia personal o de cliente sea configuración empresarial;
15. AURA reciba clasificación;
16. un cambio elimine historia;
17. la puerta final deje más de una clase primaria o ninguna.

---

#### 19. Seguridad y autorización

La clasificación de configuración no concede:

- acceso a catálogos;
- creación o edición;
- publicación;
- aprobación;
- cambio de vigencia;
- rollback;
- exportación;
- administración global;
- acceso territorial;
- acceso por URL directa.

Toda mutación deberá validar permiso, actor, contexto, alcance, versión, impacto, estado y segregación.

---

#### 20. SCREEN-CONFIGURATION-CARRYOVER-REGISTER-001

| Pendiente                                                    | Propietario exacto                                        |
| ------------------------------------------------------------ | --------------------------------------------------------- |
| clasificar pantallas de auditoría                            | `PROC-SCREEN-009`                                         |
| clasificar pantallas personales                              | `PROC-SCREEN-010`                                         |
| clasificar pantallas de cliente y cerrar la puerta de clases | `PROC-SCREEN-011`                                         |
| definir actores                                              | `PROC-SCREEN-012`                                         |
| definir dispositivos                                         | `PROC-SCREEN-013`                                         |
| definir acciones                                             | `PROC-SCREEN-014` y `PROC-SCREEN-015`                     |
| definir estados de interfaz                                  | `PROC-SCREEN-016` a `PROC-SCREEN-021`                     |
| definir sensibilidad y permisos                              | `PROC-SCREEN-022` a `PROC-SCREEN-024`                     |
| vincular operaciones técnicas                                | `PROC-SCREEN-025`                                         |
| resolver rutas y legado                                      | `PROC-SCREEN-026`                                         |
| definir métricas y aceptación                                | `PROC-SCREEN-027` y `PROC-SCREEN-028`                     |
| materializar contratos y validadores                         | paquetes E5 y CI documental                               |
| validar con responsables reales                              | `UX-QA-*` y pilotos E5                                    |
| admitir AURA                                                 | tareas canónicas de AURA y nueva admisión `PROC-SCREEN-*` |

No queda pendiente narrativo sin tarea o puerta de resolución.

---

#### 21. Requisitos de prueba derivados

**Resultado:** GENERA 30 REQUISITOS DE PRUEBA.

Se incorporan `TREQ-UX-699` a `TREQ-UX-728` al Registro Canónico completo. Permanecen en estado `IDENTIFICADO`; automatización, implementación y evidencia corresponden a CI documental, paquetes E5, BLOQUE U, staging y pilotos.

---

#### 22. Criterios de aceptación

- [x] Se clasifican las 177 pantallas.
- [x] Los 177 nombres se conservan exactamente.
- [x] Cada pantalla recibe exactamente un `configuration_fit`.
- [x] Se distinguen 16 primarias, 12 secundarias y 149 fuera de clase.
- [x] Las 28 pantallas relevantes usan doce patrones.
- [x] Ninguna primaria de configuración compite con otra clase primaria.
- [x] Se separa configuración de operación, administración, supervisión y auditoría.
- [x] Se separa configuración reusable de personalización de casos.
- [x] Se definen versión, vigencia, impacto, publicación y rollback.
- [x] AURA conserva cero pantallas.
- [x] La clasificación no concede permisos.
- [x] Se generan `TREQ-UX-699` a `TREQ-UX-728`.
- [x] No se anticipan actores, dispositivos, acciones, estados, permisos, rutas o APIs.
- [x] No se implementa código ni se avanza a `PROC-SCREEN-009`.

---

#### 23. Resultado y continuidad

```text
PROC-SCREEN-007 APROBADA
PROC-SCREEN-008 APROBADA
PROC-SCREEN-009 NO INICIADA
```

La continuidad documental pasa exclusivamente a:

```text
PROC-SCREEN-009 — Clasificar pantalla de auditoría
```


### ✅ PROC-SCREEN-009 — Clasificar pantalla de auditoría

**Estado:** APROBADA

**Bloque:** E2 — Arquitectura funcional, procesos y experiencia transversal

**Marcador exacto que reemplaza:** `### [ ] PROC-SCREEN-009 — Clasificar pantalla de auditoría`

**Tarea anterior:** `PROC-SCREEN-008 — Clasificar pantalla de configuración` — APROBADA

**Siguiente tarea reservada:** `PROC-SCREEN-010 — Clasificar pantalla personal` — NO INICIADA

**Fuente canónica obligatoria de identidades y nombres:** `PROC-SCREEN-002 / SCREEN-CANONICAL-CATALOG-001`, corte vigente de **177 pantallas**.

**Artefactos lógicos contenidos en esta tarea:**

- `SCREEN-AUDIT-CLASSIFICATION-CONTRACT-001`;
- `SCREEN-AUDIT-PATTERN-VOCABULARY-001`;
- `SCREEN-AUDIT-CLASSIFICATION-REGISTER-001`;
- `SCREEN-AUDIT-EVIDENCE-MINIMUM-CONTRACT-001`;
- `SCREEN-AUDIT-READONLY-BOUNDARY-001`;
- `SCREEN-AUDIT-TEMPORAL-INTEGRITY-CONTRACT-001`;
- `SCREEN-AUDIT-COVERAGE-MATRIX-001`;
- `SCREEN-AUDIT-CLASSIFICATION-CHANGE-POLICY-001`;
- `SCREEN-AUDIT-CLASSIFICATION-VALIDATION-GATE-001`;
- `SCREEN-AUDIT-CARRYOVER-REGISTER-001`.

**Resultado cuantitativo:** **177 pantallas clasificadas**, de las cuales **3** quedan como `PRIMARY_AUDIT`, **108** como `SECONDARY_AUDIT` y **66** como `OUTSIDE_AUDIT_CLASS`; se utilizan **12 patrones**, existen **111 pantallas con relevancia de auditoría**, AURA conserva cero pantallas y ninguna identidad, nombre, aplicación, proceso, paso o clasificación anterior fue modificada.

**Huella de nombres `screen_id|working_name`:** `f9e15f46d8e1658f8435185e18a359581179eb47f283484b94218c46734a9a31`

**Naturaleza:** clasificación documental del grado en que cada pantalla permite reconstruir, verificar, certificar o investigar hechos, decisiones, cambios, movimientos, custodia, evidencia, cumplimiento y cronologías. No define todavía pantallas personales o de cliente; tampoco define actores, dispositivos, acciones, estados de interfaz, sensibilidad, permisos, rutas u operaciones técnicas.

**Cambios en identidades, nombres, aplicaciones, procesos, pasos, clasificaciones aprobadas, código, rutas, componentes, Supabase, tablas, migraciones, RLS, RPC, eventos o producción:** no autorizados por esta tarea.

---

#### 1. Propósito

Distinguir las superficies cuyo propósito dominante es reconstruir o publicar evidencia histórica de aquellas que incorporan trazabilidad secundaria para soportar otra intención principal y de aquellas que no presentan una experiencia material de auditoría.

```text
HECHO, DECISION, CAMBIO, MOVIMIENTO O EVIDENCIA
        +
ACTOR, CONTEXTO, TIEMPO, VERSION Y FUENTE
        +
CRONOLOGIA, CORRELACION Y RESULTADO REPRODUCIBLE
        +
LECTURA SEGURA SIN REESCRIBIR EL ORIGINAL
        =
CLASIFICACION DE AUDITORIA
```

La clasificación responde **si la pantalla permite demostrar qué ocurrió, cuándo, por quién, bajo qué contexto, sobre qué versión y con qué resultado**. No convierte cada evento auditable del backend en una pantalla de auditoría.

---

#### 2. Dependencias consumidas

- `PROC-SCREEN-001` y la identidad estable `VSCREEN-*`;
- `PROC-SCREEN-002` y el catálogo vigente de 177 pantallas;
- `PROC-SCREEN-003` y los 177 vínculos primarios más 272 relacionados;
- `PROC-SCREEN-004` y las 177 anclas de paso;
- `PROC-SCREEN-005` a `PROC-SCREEN-008` y sus clasificaciones corregidas;
- `PROC-CAT-009` a `PROC-CAT-018`, especialmente estados, transiciones, excepciones, correcciones, información, eventos y auditoría necesaria;
- `AUTH-CTX-*`, `AUTH-SRV-*`, `AUTH-DB-*` y `AUTH-QA-*`;
- `EVID-ARC-*`, `AUD-EVT-*`, `DATA-DOM-*`, `QUEUE-ARC-*`, `INT-APP-*` e `INT-EXT-*`;
- `UX-BASE-001` a `UX-BASE-015`;
- `UX-STATION-001` a `UX-STATION-012`;
- `UX-ADMIN-001` a `UX-ADMIN-005`;
- las decisiones de privacidad, conservación, legal hold, segregación, idempotencia, receipts, recuperación y evidencia ya aprobadas.

La tarea consume estas fuentes sin reabrirlas y sin deducir auditoría únicamente por nombre de aplicación, tabla, rol o permiso.

---

#### 3. Alcance

1. incorporar `audit_fit` a las 177 pantallas;
2. distinguir auditoría primaria, auditoría secundaria y ausencia de clase;
3. definir doce patrones cerrados;
4. conservar exactos nombres, aplicaciones, procesos, pasos y cuatro clasificaciones previas;
5. separar auditoría de operación, administración, supervisión, configuración, personal y cliente;
6. exigir evidencia mínima, procedencia, cronología y correlación;
7. establecer lectura segura y handoff hacia la pantalla propietaria para toda corrección;
8. impedir sobrescritura destructiva del hecho original;
9. definir temporalidad, zona horaria, secuencia, integridad y conservación;
10. establecer cambio, versionado, validaciones y carryovers;
11. dejar `PROC-SCREEN-010` y `PROC-SCREEN-011` como responsables de cerrar las clases personal y cliente;
12. mantener en `PROC-SCREEN-011` la puerta de exactamente una clase primaria por pantalla.

---

#### 4. Exclusiones

Esta tarea no:

- convierte toda pantalla transaccional en pantalla de auditoría;
- afirma que un log técnico es evidencia empresarial suficiente;
- define el esquema físico del ledger o repositorio de eventos;
- decide qué actor puede consultar, exportar o descargar evidencia;
- concede lectura transversal o acceso global;
- habilita correcciones desde una proyección histórica;
- define acciones principales o secundarias;
- define dispositivos, estaciones o periféricos;
- diseña estados de interfaz;
- asigna permisos;
- vincula APIs, RPC, eventos, tablas o Storage;
- establece periodos legales definitivos de conservación;
- clasifica todavía pantallas personales o de cliente;
- activa AURA.

---

#### 5. Definición canónica de pantalla de auditoría

Una pantalla tiene relevancia de auditoría cuando su interfaz permite de forma material uno o más de estos resultados:

- reconstruir una cronología verificable;
- comparar versiones, estados, valores anteriores y posteriores;
- consultar decisiones, razones, aprobaciones, rechazos o revocaciones;
- seguir custodia, entrega, recepción, devolución o prueba física;
- reconciliar fuentes, cantidades o efectos;
- inspeccionar documentos, evidencias, receipts o correlaciones;
- demostrar cumplimiento, conservación, obligación o tratamiento;
- investigar genealogía, causa, impacto o alcance;
- producir un reporte o exportación reproducible con fuente y corte explícitos.

No basta con:

- que la acción genere un evento de auditoría;
- mostrar una tabla de registros actuales;
- tener filtros, fecha o usuario;
- ser de solo lectura;
- utilizar un permiso sensible;
- presentar métricas actuales;
- pertenecer a NUMERA, VISO o una aplicación regulada;
- consultar una fuente transaccional;
- contener la palabra “historial” sin procedencia ni integridad.

---

#### 6. Estados de clasificación

| Valor                 | Significado                                                                                                               | Efecto documental                                                   |
| --------------------- | ------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------- |
| `PRIMARY_AUDIT`       | reconstruir, verificar, investigar o publicar evidencia histórica es la intención dominante                               | reserva `AUDIT` como clase primaria                                 |
| `SECONDARY_AUDIT`     | otra clase es primaria, pero la pantalla incorpora historia o evidencia material para comprender y demostrar el resultado | agrega auditoría secundaria sin absorber la fuente propietaria      |
| `OUTSIDE_AUDIT_CLASS` | la pantalla no presenta una experiencia material de auditoría bajo este contrato                                          | continúa hacia personal o cliente, o conserva una primaria anterior |

Una operación auditable puede permanecer `OUTSIDE_AUDIT_CLASS` cuando la pantalla solo ejecuta el trabajo y la evidencia se consulta en otra superficie.

---

#### 7. Contrato mínimo

| Campo                          | Obligación                                                           |
| ------------------------------ | -------------------------------------------------------------------- |
| `screen_id`                    | `VSCREEN-*` canónico                                                 |
| `canonical_screen_name`        | nombre exacto de `SCREEN-CANONICAL-CATALOG-001`                      |
| `primary_application_id`       | aplicación aprobada                                                  |
| `primary_process_id`           | proceso aprobado                                                     |
| `primary_process_step_ref`     | paso aprobado                                                        |
| `operational_fit`              | clasificación aprobada en `PROC-SCREEN-005`                          |
| `administrative_fit`           | clasificación aprobada en `PROC-SCREEN-006`                          |
| `supervision_fit`              | clasificación aprobada en `PROC-SCREEN-007`                          |
| `configuration_fit`            | clasificación aprobada en `PROC-SCREEN-008`                          |
| `audit_fit`                    | uno de los tres estados aprobados                                    |
| `audit_pattern`                | patrón aprobado o `NONE`                                             |
| `audit_reason`                 | fundamento verificable                                               |
| `audit_classification_version` | versión semántica                                                    |
| `audit_classification_status`  | `CANONICAL`, `CHANGE_PROPOSED`, `SUPERSEDED` o `RETIRED_WITH_SCREEN` |
| `audit_classification_task`    | tarea que aprobó o modificó la decisión                              |

Valores iniciales:

```text
audit_classification_version: 1.0.0
audit_classification_status: CANONICAL
audit_classification_task: PROC-SCREEN-009
decision_record: INITIAL_AUDIT_CLASSIFICATION
canonical_name_source: SCREEN-CANONICAL-CATALOG-001
```

---

#### 8. SCREEN-AUDIT-PATTERN-VOCABULARY-001

| Patrón                             | Uso                                                                    |
| ---------------------------------- | ---------------------------------------------------------------------- |
| `AUDIT_PROCUREMENT_HISTORY`        | reconstrucción integral del ciclo de abastecimiento                    |
| `AUDIT_FINANCIAL_REPORTING`        | reporte y exportación financiera reproducibles                         |
| `AUDIT_TRACEABILITY_INVESTIGATION` | genealogía e investigación de lote                                     |
| `AUDIT_ACCESS_SECURITY`            | historia de acceso, dispositivos, certificaciones y sesiones           |
| `AUDIT_CHANGE_HISTORY`             | versiones, vigencias, autores, aprobaciones y publicaciones            |
| `AUDIT_DECISION_RECORD`            | decisiones, razones, autoridad y resultados                            |
| `AUDIT_EVIDENCE_RECORD`            | expedientes, documentos y paquetes de evidencia                        |
| `AUDIT_RECONCILIATION`             | contraste entre fuentes y resolución trazable de diferencias           |
| `AUDIT_CUSTODY_CHAIN`              | tenencia, ubicación, entrega, recepción, devolución y condición        |
| `AUDIT_TRANSACTION_LEDGER`         | movimientos, receipts, reversiones y efectos económicos o comerciales  |
| `AUDIT_CASE_CHRONOLOGY`            | secuencia material de casos, solicitudes, comunicaciones y compromisos |
| `AUDIT_COMPLIANCE_CONTROL`         | obligaciones, hallazgos, conservación y tratamientos regulatorios      |
| `NONE`                             | sin relevancia de auditoría bajo esta tarea                            |

---

#### 9. Algoritmo de decisión

Se clasifica `PRIMARY_AUDIT` cuando:

1. la pregunta principal de la persona es qué ocurrió y cómo demostrarlo;
2. la pantalla reúne historia procedente de una o varias fuentes identificables;
3. la navegación parte de periodo, objeto, evento, evidencia, actor o correlación;
4. el resultado es una reconstrucción, investigación, certificación, reporte o exportación;
5. la pantalla no es la fuente mutable del hecho original;
6. cualquier corrección exige handoff a la propietaria y conserva el original.

Se clasifica `SECONDARY_AUDIT` cuando:

1. la pantalla ya posee o recibirá otra clase primaria;
2. historia, evidencia, comparación, receipt o custodia son indispensables para comprender o decidir;
3. la función histórica está acotada y no transforma la pantalla en ledger universal;
4. retirar esa evidencia impediría justificar el resultado, aunque el flujo principal seguiría existiendo.

Se clasifica `OUTSIDE_AUDIT_CLASS` cuando:

- solo se ejecuta trabajo vivo;
- solo se presenta estado actual o supervisión;
- solo se mantiene configuración sin historial material visible;
- solo se navega o autentica;
- solo se personaliza un caso;
- el canal personal o de cliente no presenta evidencia material bajo esta tarea;
- la trazabilidad existe en backend, pero no forma parte de la intención de la pantalla.

---

#### 10. SCREEN-AUDIT-EVIDENCE-MINIMUM-CONTRACT-001

Toda superficie con relevancia de auditoría deberá poder resolver posteriormente, según aplicabilidad:

```text
audit_record_id
subject_type
subject_id
subject_version
event_or_decision_type
occurred_at
recorded_at
time_source
timezone
principal_id
actor_id
actor_mode
role_and_context_snapshot
site_id
area_id
device_id
source_application_id
source_process_id
source_screen_id
source_operation_id
correlation_id
causation_id
idempotency_key
before_snapshot_ref
after_snapshot_ref
reason_code
approval_or_policy_ref
evidence_refs[]
receipt_ref
integrity_proof
retention_class
legal_hold_status
supersedes_or_corrects
```

No todos los campos serán visibles a todos los actores. La proyección deberá aplicar minimización, sensibilidad, territorio, finalidad y retención.

---

#### 11. Lectura, corrección y no reescritura

1. una pantalla de auditoría será de solo lectura respecto del hecho original;
2. anotar, solicitar aclaración o iniciar una corrección serán acciones distintas del hecho auditado;
3. corregir abrirá la pantalla propietaria o un caso de corrección autorizado;
4. el original permanecerá visible y enlazado con la corrección;
5. una reapertura, reversión o ajuste creará nuevos hechos correlacionados;
6. ningún export, filtro o vista previa podrá modificar la fuente;
7. las denegaciones y accesos sensibles también deberán ser auditables;
8. una pantalla histórica no concederá autoridad por mostrar un actor, rol o aprobación anterior.

---

#### 12. Integridad temporal y orden

La interfaz deberá distinguir:

```text
occurred_at       = momento del hecho empresarial
recorded_at       = momento de persistencia
effective_at      = momento desde el cual produce efecto
received_at       = momento de recepción por otro sistema
corrected_at      = momento de la corrección posterior
```

Reglas:

- toda fecha mostrará zona horaria o regla de conversión;
- los empates usarán secuencia o identificador estable;
- eventos offline conservarán hora observada y hora recibida;
- el orden visual no podrá ocultar latencia o reintentos;
- una importación histórica deberá distinguirse de un hecho ocurrido en línea;
- reloj de dispositivo no será autoridad única para decisiones sensibles;
- la ausencia de hora confiable se mostrará como limitación, no como precisión falsa.

---

#### 13. Fronteras con otras clases

1. **Operación:** ejecuta el hecho; auditoría lo reconstruye o demuestra.
2. **Administración:** gestiona el caso vigente; auditoría conserva su cronología y decisiones.
3. **Supervisión:** observa situación actual y orienta intervención; auditoría explica cómo se llegó al estado.
4. **Configuración:** define reglas futuras; auditoría compara versiones, vigencias y publicaciones.
5. **Personal:** presenta información y acciones propias; auditoría secundaria solo muestra historia propia permitida.
6. **Cliente:** presenta experiencia propia; auditoría secundaria solo muestra receipts, historial o comunicaciones propias.
7. **Backend auditable:** generar un evento no crea automáticamente una pantalla de auditoría.

---

#### 14. SCREEN-AUDIT-CLASSIFICATION-REGISTER-001

| Screen ID      | Pantalla                                              | Aplicación | Paso dominante                                              | Clase operativa             | Clase administrativa           | Clase de supervisión        | Clase de configuración        | Clasificación de auditoría | Patrón                             | Fundamento                                                                                                                                                                                                                                                                                                                                                          |
| -------------- | ----------------------------------------------------- | ---------- | ----------------------------------------------------------- | --------------------------- | ------------------------------ | --------------------------- | ----------------------------- | -------------------------- | ---------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `VSCREEN-0001` | Hub Vento OS                                          | `shell`    | `VPROC-0059::STEP-ENTER_ECOSYSTEM`                          | `OUTSIDE_OPERATIONAL_CLASS` | `OUTSIDE_ADMINISTRATIVE_CLASS` | `OUTSIDE_SUPERVISION_CLASS` | `OUTSIDE_CONFIGURATION_CLASS` | `OUTSIDE_AUDIT_CLASS`      | `NONE`                             | La superficie resuelve acceso, navegación, contexto o soporte actual sin constituir por sí misma un espacio de reconstrucción histórica.                                                                                                                                                                                                                            |
| `VSCREEN-0002` | Inicio de sesión y recuperación                       | `shell`    | `VPROC-0059::STEP-AUTHENTICATE_OR_RECOVER`                  | `OUTSIDE_OPERATIONAL_CLASS` | `OUTSIDE_ADMINISTRATIVE_CLASS` | `OUTSIDE_SUPERVISION_CLASS` | `OUTSIDE_CONFIGURATION_CLASS` | `OUTSIDE_AUDIT_CLASS`      | `NONE`                             | La superficie resuelve acceso, navegación, contexto o soporte actual sin constituir por sí misma un espacio de reconstrucción histórica.                                                                                                                                                                                                                            |
| `VSCREEN-0003` | Resolución de contexto y acceso                       | `shell`    | `VPROC-0059::STEP-RESOLVE_EFFECTIVE_CONTEXT`                | `SECONDARY_OPERATIONAL`     | `SECONDARY_ADMINISTRATIVE`     | `OUTSIDE_SUPERVISION_CLASS` | `OUTSIDE_CONFIGURATION_CLASS` | `OUTSIDE_AUDIT_CLASS`      | `NONE`                             | La superficie resuelve acceso, navegación, contexto o soporte actual sin constituir por sí misma un espacio de reconstrucción histórica.                                                                                                                                                                                                                            |
| `VSCREEN-0004` | Activación de dispositivo compartido                  | `shell`    | `VPROC-0059::STEP-ACTIVATE_SHARED_DEVICE`                   | `SECONDARY_OPERATIONAL`     | `OUTSIDE_ADMINISTRATIVE_CLASS` | `OUTSIDE_SUPERVISION_CLASS` | `OUTSIDE_CONFIGURATION_CLASS` | `OUTSIDE_AUDIT_CLASS`      | `NONE`                             | La superficie resuelve acceso, navegación, contexto o soporte actual sin constituir por sí misma un espacio de reconstrucción histórica.                                                                                                                                                                                                                            |
| `VSCREEN-0005` | Bandeja transversal de tareas y notificaciones        | `shell`    | `VPROC-0004::STEP-TRIAGE_TRANSVERSAL_WORK`                  | `SECONDARY_OPERATIONAL`     | `SECONDARY_ADMINISTRATIVE`     | `OUTSIDE_SUPERVISION_CLASS` | `OUTSIDE_CONFIGURATION_CLASS` | `OUTSIDE_AUDIT_CLASS`      | `NONE`                             | La superficie resuelve acceso, navegación, contexto o soporte actual sin constituir por sí misma un espacio de reconstrucción histórica.                                                                                                                                                                                                                            |
| `VSCREEN-0006` | Centro de soporte y diagnóstico                       | `shell`    | `VPROC-0058::STEP-DIAGNOSE_AND_ROUTE_SUPPORT`               | `SECONDARY_OPERATIONAL`     | `SECONDARY_ADMINISTRATIVE`     | `OUTSIDE_SUPERVISION_CLASS` | `OUTSIDE_CONFIGURATION_CLASS` | `OUTSIDE_AUDIT_CLASS`      | `NONE`                             | La superficie resuelve acceso, navegación, contexto o soporte actual sin constituir por sí misma un espacio de reconstrucción histórica.                                                                                                                                                                                                                            |
| `VSCREEN-0007` | Inicio ejecutivo y gerencial                          | `viso`     | `VPROC-0001::STEP-REVIEW_EXECUTIVE_WORK`                    | `OUTSIDE_OPERATIONAL_CLASS` | `SECONDARY_ADMINISTRATIVE`     | `PRIMARY_SUPERVISION`       | `OUTSIDE_CONFIGURATION_CLASS` | `OUTSIDE_AUDIT_CLASS`      | `NONE`                             | La intención dominante es supervisar situación actual, carga o desvíos; no reconstruir hechos históricos como propósito material.                                                                                                                                                                                                                                   |
| `VSCREEN-0008` | Estructura organizativa                               | `viso`     | `VPROC-0002::STEP-MAINTAIN_ORGANIZATIONAL_STRUCTURE`        | `OUTSIDE_OPERATIONAL_CLASS` | `SECONDARY_ADMINISTRATIVE`     | `OUTSIDE_SUPERVISION_CLASS` | `PRIMARY_CONFIGURATION`       | `SECONDARY_AUDIT`          | `AUDIT_CHANGE_HISTORY`             | La pantalla permite comparar versiones, vigencias, autores, aprobaciones y publicaciones de una definición reutilizable, pero su intención primaria continúa siendo operativa, administrativa, de supervisión, configuración, personal o de cliente. La auditoría queda acotada a evidencia, historia y drill-down sin habilitar mutación retroactiva.              |
| `VSCREEN-0009` | Políticas, delegaciones y límites                     | `viso`     | `VPROC-0003::STEP-AUTHOR_POLICIES_AND_LIMITS`               | `OUTSIDE_OPERATIONAL_CLASS` | `SECONDARY_ADMINISTRATIVE`     | `OUTSIDE_SUPERVISION_CLASS` | `PRIMARY_CONFIGURATION`       | `SECONDARY_AUDIT`          | `AUDIT_CHANGE_HISTORY`             | La pantalla permite comparar versiones, vigencias, autores, aprobaciones y publicaciones de una definición reutilizable, pero su intención primaria continúa siendo operativa, administrativa, de supervisión, configuración, personal o de cliente. La auditoría queda acotada a evidencia, historia y drill-down sin habilitar mutación retroactiva.              |
| `VSCREEN-0010` | Compromisos y transferencias internas                 | `viso`     | `VPROC-0004::STEP-TRACK_INTERNAL_COMMITMENTS`               | `SECONDARY_OPERATIONAL`     | `PRIMARY_ADMINISTRATIVE`       | `SECONDARY_SUPERVISION`     | `OUTSIDE_CONFIGURATION_CLASS` | `OUTSIDE_AUDIT_CLASS`      | `NONE`                             | La intención dominante es administrar un caso o recurso vigente; la trazabilidad técnica obligatoria no convierte por sí sola la pantalla en superficie de auditoría.                                                                                                                                                                                               |
| `VSCREEN-0011` | Embudo de candidatos                                  | `viso`     | `VPROC-0005::STEP-TRIAGE_CANDIDATES`                        | `OUTSIDE_OPERATIONAL_CLASS` | `PRIMARY_ADMINISTRATIVE`       | `OUTSIDE_SUPERVISION_CLASS` | `OUTSIDE_CONFIGURATION_CLASS` | `OUTSIDE_AUDIT_CLASS`      | `NONE`                             | La intención dominante es administrar un caso o recurso vigente; la trazabilidad técnica obligatoria no convierte por sí sola la pantalla en superficie de auditoría.                                                                                                                                                                                               |
| `VSCREEN-0012` | Caso de selección                                     | `viso`     | `VPROC-0005::STEP-EVALUATE_AND_DECIDE_CANDIDATE`            | `OUTSIDE_OPERATIONAL_CLASS` | `PRIMARY_ADMINISTRATIVE`       | `OUTSIDE_SUPERVISION_CLASS` | `OUTSIDE_CONFIGURATION_CLASS` | `SECONDARY_AUDIT`          | `AUDIT_DECISION_RECORD`            | La pantalla conserva evidencia, autoridad, razón, versión y resultado de una revisión, aprobación, corrección o decisión, pero su intención primaria continúa siendo operativa, administrativa, de supervisión, configuración, personal o de cliente. La auditoría queda acotada a evidencia, historia y drill-down sin habilitar mutación retroactiva.             |
| `VSCREEN-0013` | Vinculación e incorporación                           | `viso`     | `VPROC-0006::STEP-ORCHESTRATE_ONBOARDING`                   | `OUTSIDE_OPERATIONAL_CLASS` | `PRIMARY_ADMINISTRATIVE`       | `OUTSIDE_SUPERVISION_CLASS` | `OUTSIDE_CONFIGURATION_CLASS` | `OUTSIDE_AUDIT_CLASS`      | `NONE`                             | La intención dominante es administrar un caso o recurso vigente; la trazabilidad técnica obligatoria no convierte por sí sola la pantalla en superficie de auditoría.                                                                                                                                                                                               |
| `VSCREEN-0014` | Directorio y expediente laboral                       | `viso`     | `VPROC-0006::STEP-MAINTAIN_EMPLOYMENT_RECORD`               | `OUTSIDE_OPERATIONAL_CLASS` | `PRIMARY_ADMINISTRATIVE`       | `OUTSIDE_SUPERVISION_CLASS` | `OUTSIDE_CONFIGURATION_CLASS` | `SECONDARY_AUDIT`          | `AUDIT_EVIDENCE_RECORD`            | La pantalla presenta un expediente documental o paquete de evidencia necesario para demostrar qué ocurrió y con qué soporte, pero su intención primaria continúa siendo operativa, administrativa, de supervisión, configuración, personal o de cliente. La auditoría queda acotada a evidencia, historia y drill-down sin habilitar mutación retroactiva.          |
| `VSCREEN-0015` | Programación laboral                                  | `viso`     | `VPROC-0007::STEP-PLAN_AND_PUBLISH_SCHEDULE`                | `SECONDARY_OPERATIONAL`     | `PRIMARY_ADMINISTRATIVE`       | `SECONDARY_SUPERVISION`     | `OUTSIDE_CONFIGURATION_CLASS` | `OUTSIDE_AUDIT_CLASS`      | `NONE`                             | La intención dominante es administrar un caso o recurso vigente; la trazabilidad técnica obligatoria no convierte por sí sola la pantalla en superficie de auditoría.                                                                                                                                                                                               |
| `VSCREEN-0016` | Revisión de asistencia                                | `viso`     | `VPROC-0008::STEP-REVIEW_ATTENDANCE_EXCEPTION`              | `SECONDARY_OPERATIONAL`     | `SECONDARY_ADMINISTRATIVE`     | `PRIMARY_SUPERVISION`       | `OUTSIDE_CONFIGURATION_CLASS` | `SECONDARY_AUDIT`          | `AUDIT_DECISION_RECORD`            | La pantalla conserva evidencia, autoridad, razón, versión y resultado de una revisión, aprobación, corrección o decisión, pero su intención primaria continúa siendo operativa, administrativa, de supervisión, configuración, personal o de cliente. La auditoría queda acotada a evidencia, historia y drill-down sin habilitar mutación retroactiva.             |
| `VSCREEN-0017` | Novedades, ausencias y reemplazos                     | `viso`     | `VPROC-0009::STEP-RESOLVE_WORKFORCE_CASE`                   | `SECONDARY_OPERATIONAL`     | `PRIMARY_ADMINISTRATIVE`       | `SECONDARY_SUPERVISION`     | `OUTSIDE_CONFIGURATION_CLASS` | `OUTSIDE_AUDIT_CLASS`      | `NONE`                             | La intención dominante es administrar un caso o recurso vigente; la trazabilidad técnica obligatoria no convierte por sí sola la pantalla en superficie de auditoría.                                                                                                                                                                                               |
| `VSCREEN-0018` | Retiro y revocación coordinada                        | `viso`     | `VPROC-0011::STEP-CLOSE_EMPLOYMENT_AND_REVOKE`              | `OUTSIDE_OPERATIONAL_CLASS` | `PRIMARY_ADMINISTRATIVE`       | `OUTSIDE_SUPERVISION_CLASS` | `OUTSIDE_CONFIGURATION_CLASS` | `SECONDARY_AUDIT`          | `AUDIT_ACCESS_SECURITY`            | La pantalla expone historia y evidencia de asignaciones, certificaciones, revocaciones, dispositivos o sesiones de seguridad, pero su intención primaria continúa siendo operativa, administrativa, de supervisión, configuración, personal o de cliente. La auditoría queda acotada a evidencia, historia y drill-down sin habilitar mutación retroactiva.         |
| `VSCREEN-0019` | Catálogo de roles y permisos                          | `viso`     | `VPROC-0059::STEP-MAINTAIN_ACCESS_CATALOG`                  | `OUTSIDE_OPERATIONAL_CLASS` | `SECONDARY_ADMINISTRATIVE`     | `OUTSIDE_SUPERVISION_CLASS` | `PRIMARY_CONFIGURATION`       | `SECONDARY_AUDIT`          | `AUDIT_CHANGE_HISTORY`             | La pantalla permite comparar versiones, vigencias, autores, aprobaciones y publicaciones de una definición reutilizable, pero su intención primaria continúa siendo operativa, administrativa, de supervisión, configuración, personal o de cliente. La auditoría queda acotada a evidencia, historia y drill-down sin habilitar mutación retroactiva.              |
| `VSCREEN-0020` | Perfil de acceso del trabajador                       | `viso`     | `VPROC-0059::STEP-ASSIGN_EFFECTIVE_ACCESS`                  | `OUTSIDE_OPERATIONAL_CLASS` | `PRIMARY_ADMINISTRATIVE`       | `OUTSIDE_SUPERVISION_CLASS` | `SECONDARY_CONFIGURATION`     | `SECONDARY_AUDIT`          | `AUDIT_ACCESS_SECURITY`            | La pantalla expone historia y evidencia de asignaciones, certificaciones, revocaciones, dispositivos o sesiones de seguridad, pero su intención primaria continúa siendo operativa, administrativa, de supervisión, configuración, personal o de cliente. La auditoría queda acotada a evidencia, historia y drill-down sin habilitar mutación retroactiva.         |
| `VSCREEN-0021` | Simulación de permisos y conflictos                   | `viso`     | `VPROC-0059::STEP-SIMULATE_ACCESS_DECISION`                 | `OUTSIDE_OPERATIONAL_CLASS` | `PRIMARY_ADMINISTRATIVE`       | `SECONDARY_SUPERVISION`     | `OUTSIDE_CONFIGURATION_CLASS` | `OUTSIDE_AUDIT_CLASS`      | `NONE`                             | La intención dominante es administrar un caso o recurso vigente; la trazabilidad técnica obligatoria no convierte por sí sola la pantalla en superficie de auditoría.                                                                                                                                                                                               |
| `VSCREEN-0022` | Gobierno de dispositivos compartidos                  | `viso`     | `VPROC-0059::STEP-GOVERN_SHARED_DEVICES`                    | `OUTSIDE_OPERATIONAL_CLASS` | `SECONDARY_ADMINISTRATIVE`     | `OUTSIDE_SUPERVISION_CLASS` | `PRIMARY_CONFIGURATION`       | `SECONDARY_AUDIT`          | `AUDIT_ACCESS_SECURITY`            | La pantalla expone historia y evidencia de asignaciones, certificaciones, revocaciones, dispositivos o sesiones de seguridad, pero su intención primaria continúa siendo operativa, administrativa, de supervisión, configuración, personal o de cliente. La auditoría queda acotada a evidencia, historia y drill-down sin habilitar mutación retroactiva.         |
| `VSCREEN-0023` | Riesgos de seguridad y salud                          | `viso`     | `VPROC-0012::STEP-ASSESS_SST_RISK`                          | `OUTSIDE_OPERATIONAL_CLASS` | `PRIMARY_ADMINISTRATIVE`       | `SECONDARY_SUPERVISION`     | `OUTSIDE_CONFIGURATION_CLASS` | `SECONDARY_AUDIT`          | `AUDIT_EVIDENCE_RECORD`            | La pantalla presenta un expediente documental o paquete de evidencia necesario para demostrar qué ocurrió y con qué soporte, pero su intención primaria continúa siendo operativa, administrativa, de supervisión, configuración, personal o de cliente. La auditoría queda acotada a evidencia, historia y drill-down sin habilitar mutación retroactiva.          |
| `VSCREEN-0024` | Incidentes y emergencias                              | `viso`     | `VPROC-0013::STEP-MANAGE_INCIDENT_RESPONSE`                 | `SECONDARY_OPERATIONAL`     | `PRIMARY_ADMINISTRATIVE`       | `SECONDARY_SUPERVISION`     | `OUTSIDE_CONFIGURATION_CLASS` | `SECONDARY_AUDIT`          | `AUDIT_EVIDENCE_RECORD`            | La pantalla presenta un expediente documental o paquete de evidencia necesario para demostrar qué ocurrió y con qué soporte, pero su intención primaria continúa siendo operativa, administrativa, de supervisión, configuración, personal o de cliente. La auditoría queda acotada a evidencia, historia y drill-down sin habilitar mutación retroactiva.          |
| `VSCREEN-0025` | Controles de higiene y cumplimiento                   | `viso`     | `VPROC-0014::STEP-REVIEW_HYGIENE_COMPLIANCE`                | `SECONDARY_OPERATIONAL`     | `SECONDARY_ADMINISTRATIVE`     | `PRIMARY_SUPERVISION`       | `SECONDARY_CONFIGURATION`     | `SECONDARY_AUDIT`          | `AUDIT_DECISION_RECORD`            | La pantalla conserva evidencia, autoridad, razón, versión y resultado de una revisión, aprobación, corrección o decisión, pero su intención primaria continúa siendo operativa, administrativa, de supervisión, configuración, personal o de cliente. La auditoría queda acotada a evidencia, historia y drill-down sin habilitar mutación retroactiva.             |
| `VSCREEN-0026` | Bandeja de casos administrativos transversales        | `viso`     | `VPROC-0004::STEP-TRIAGE_ADMIN_CASES`                       | `SECONDARY_OPERATIONAL`     | `PRIMARY_ADMINISTRATIVE`       | `SECONDARY_SUPERVISION`     | `OUTSIDE_CONFIGURATION_CLASS` | `OUTSIDE_AUDIT_CLASS`      | `NONE`                             | La intención dominante es administrar un caso o recurso vigente; la trazabilidad técnica obligatoria no convierte por sí sola la pantalla en superficie de auditoría.                                                                                                                                                                                               |
| `VSCREEN-0027` | Inicio personal del trabajador                        | `anima`    | `VPROC-0007::STEP-ENTER_PERSONAL_WORKSPACE`                 | `OUTSIDE_OPERATIONAL_CLASS` | `OUTSIDE_ADMINISTRATIVE_CLASS` | `OUTSIDE_SUPERVISION_CLASS` | `OUTSIDE_CONFIGURATION_CLASS` | `OUTSIDE_AUDIT_CLASS`      | `NONE`                             | La superficie pertenece al canal personal del trabajador y no presenta historia o evidencia material suficiente bajo este contrato; su clase primaria se resolverá en PROC-SCREEN-010.                                                                                                                                                                              |
| `VSCREEN-0028` | Registro de entrada, pausa y salida                   | `anima`    | `VPROC-0008::STEP-CAPTURE_ATTENDANCE_EVENT`                 | `PRIMARY_OPERATIONAL`       | `OUTSIDE_ADMINISTRATIVE_CLASS` | `OUTSIDE_SUPERVISION_CLASS` | `OUTSIDE_CONFIGURATION_CLASS` | `OUTSIDE_AUDIT_CLASS`      | `NONE`                             | La superficie pertenece al canal personal del trabajador y no presenta historia o evidencia material suficiente bajo este contrato; su clase primaria se resolverá en PROC-SCREEN-010.                                                                                                                                                                              |
| `VSCREEN-0029` | Mi programación                                       | `anima`    | `VPROC-0007::STEP-CONSULT_PUBLISHED_SCHEDULE`               | `SECONDARY_OPERATIONAL`     | `OUTSIDE_ADMINISTRATIVE_CLASS` | `OUTSIDE_SUPERVISION_CLASS` | `OUTSIDE_CONFIGURATION_CLASS` | `OUTSIDE_AUDIT_CLASS`      | `NONE`                             | La superficie pertenece al canal personal del trabajador y no presenta historia o evidencia material suficiente bajo este contrato; su clase primaria se resolverá en PROC-SCREEN-010.                                                                                                                                                                              |
| `VSCREEN-0030` | Mi asistencia y solicitud de corrección               | `anima`    | `VPROC-0008::STEP-CONSULT_OR_REQUEST_ATTENDANCE_CORRECTION` | `SECONDARY_OPERATIONAL`     | `OUTSIDE_ADMINISTRATIVE_CLASS` | `OUTSIDE_SUPERVISION_CLASS` | `OUTSIDE_CONFIGURATION_CLASS` | `SECONDARY_AUDIT`          | `AUDIT_CASE_CHRONOLOGY`            | La pantalla muestra la cronología material de un caso, comunicación, solicitud o compromiso con responsables y resultados, pero su intención primaria continúa siendo operativa, administrativa, de supervisión, configuración, personal o de cliente. La auditoría queda acotada a evidencia, historia y drill-down sin habilitar mutación retroactiva.            |
| `VSCREEN-0031` | Mis novedades, permisos y ausencias                   | `anima`    | `VPROC-0009::STEP-SUBMIT_PERSONAL_WORKFORCE_CASE`           | `SECONDARY_OPERATIONAL`     | `OUTSIDE_ADMINISTRATIVE_CLASS` | `OUTSIDE_SUPERVISION_CLASS` | `OUTSIDE_CONFIGURATION_CLASS` | `SECONDARY_AUDIT`          | `AUDIT_CASE_CHRONOLOGY`            | La pantalla muestra la cronología material de un caso, comunicación, solicitud o compromiso con responsables y resultados, pero su intención primaria continúa siendo operativa, administrativa, de supervisión, configuración, personal o de cliente. La auditoría queda acotada a evidencia, historia y drill-down sin habilitar mutación retroactiva.            |
| `VSCREEN-0032` | Mi perfil laboral                                     | `anima`    | `VPROC-0006::STEP-MAINTAIN_SELF_SERVICE_PROFILE`            | `OUTSIDE_OPERATIONAL_CLASS` | `OUTSIDE_ADMINISTRATIVE_CLASS` | `OUTSIDE_SUPERVISION_CLASS` | `OUTSIDE_CONFIGURATION_CLASS` | `OUTSIDE_AUDIT_CLASS`      | `NONE`                             | La superficie pertenece al canal personal del trabajador y no presenta historia o evidencia material suficiente bajo este contrato; su clase primaria se resolverá en PROC-SCREEN-010.                                                                                                                                                                              |
| `VSCREEN-0033` | Resumen de inventario y abastecimiento interno        | `nexo`     | `VPROC-0028::STEP-MONITOR_INTERNAL_SUPPLY`                  | `SECONDARY_OPERATIONAL`     | `SECONDARY_ADMINISTRATIVE`     | `PRIMARY_SUPERVISION`       | `OUTSIDE_CONFIGURATION_CLASS` | `OUTSIDE_AUDIT_CLASS`      | `NONE`                             | La intención dominante es supervisar situación actual, carga o desvíos; no reconstruir hechos históricos como propósito material.                                                                                                                                                                                                                                   |
| `VSCREEN-0034` | Catálogo de productos físicos                         | `nexo`     | `VPROC-0015::STEP-CONSULT_PHYSICAL_PRODUCT_CATALOG`         | `SECONDARY_OPERATIONAL`     | `SECONDARY_ADMINISTRATIVE`     | `OUTSIDE_SUPERVISION_CLASS` | `PRIMARY_CONFIGURATION`       | `OUTSIDE_AUDIT_CLASS`      | `NONE`                             | La intención dominante es mantener configuración reutilizable y la pantalla no presenta historia de versiones material bajo esta clasificación.                                                                                                                                                                                                                     |
| `VSCREEN-0035` | Editor de producto, unidad y presentación             | `nexo`     | `VPROC-0015::STEP-MAINTAIN_PRODUCT_PRESENTATION`            | `OUTSIDE_OPERATIONAL_CLASS` | `SECONDARY_ADMINISTRATIVE`     | `OUTSIDE_SUPERVISION_CLASS` | `PRIMARY_CONFIGURATION`       | `SECONDARY_AUDIT`          | `AUDIT_CHANGE_HISTORY`             | La pantalla permite comparar versiones, vigencias, autores, aprobaciones y publicaciones de una definición reutilizable, pero su intención primaria continúa siendo operativa, administrativa, de supervisión, configuración, personal o de cliente. La auditoría queda acotada a evidencia, historia y drill-down sin habilitar mutación retroactiva.              |
| `VSCREEN-0036` | Especificaciones y criterios de calidad               | `nexo`     | `VPROC-0018::STEP-MAINTAIN_QUALITY_SPECIFICATION`           | `OUTSIDE_OPERATIONAL_CLASS` | `SECONDARY_ADMINISTRATIVE`     | `OUTSIDE_SUPERVISION_CLASS` | `PRIMARY_CONFIGURATION`       | `SECONDARY_AUDIT`          | `AUDIT_CHANGE_HISTORY`             | La pantalla permite comparar versiones, vigencias, autores, aprobaciones y publicaciones de una definición reutilizable, pero su intención primaria continúa siendo operativa, administrativa, de supervisión, configuración, personal o de cliente. La auditoría queda acotada a evidencia, historia y drill-down sin habilitar mutación retroactiva.              |
| `VSCREEN-0037` | Catálogo de ubicaciones                               | `nexo`     | `VPROC-0023::STEP-MAINTAIN_LOCATION_CATALOG`                | `OUTSIDE_OPERATIONAL_CLASS` | `SECONDARY_ADMINISTRATIVE`     | `OUTSIDE_SUPERVISION_CLASS` | `PRIMARY_CONFIGURATION`       | `SECONDARY_AUDIT`          | `AUDIT_CHANGE_HISTORY`             | La pantalla permite comparar versiones, vigencias, autores, aprobaciones y publicaciones de una definición reutilizable, pero su intención primaria continúa siendo operativa, administrativa, de supervisión, configuración, personal o de cliente. La auditoría queda acotada a evidencia, historia y drill-down sin habilitar mutación retroactiva.              |
| `VSCREEN-0038` | Identificación y detalle de ubicación                 | `nexo`     | `VPROC-0023::STEP-IDENTIFY_LOCATION_AND_CONTENT`            | `PRIMARY_OPERATIONAL`       | `OUTSIDE_ADMINISTRATIVE_CLASS` | `OUTSIDE_SUPERVISION_CLASS` | `OUTSIDE_CONFIGURATION_CLASS` | `OUTSIDE_AUDIT_CLASS`      | `NONE`                             | La intención dominante es ejecutar trabajo vivo y la pantalla no incorpora una superficie material de historia, evidencia o investigación independiente.                                                                                                                                                                                                            |
| `VSCREEN-0039` | Consulta de existencias                               | `nexo`     | `VPROC-0024::STEP-CONSULT_STOCK_POSITION`                   | `SECONDARY_OPERATIONAL`     | `OUTSIDE_ADMINISTRATIVE_CLASS` | `PRIMARY_SUPERVISION`       | `OUTSIDE_CONFIGURATION_CLASS` | `OUTSIDE_AUDIT_CLASS`      | `NONE`                             | La intención dominante es supervisar situación actual, carga o desvíos; no reconstruir hechos históricos como propósito material.                                                                                                                                                                                                                                   |
| `VSCREEN-0040` | Conteo de inventario                                  | `nexo`     | `VPROC-0026::STEP-CAPTURE_PHYSICAL_COUNT`                   | `PRIMARY_OPERATIONAL`       | `OUTSIDE_ADMINISTRATIVE_CLASS` | `OUTSIDE_SUPERVISION_CLASS` | `OUTSIDE_CONFIGURATION_CLASS` | `OUTSIDE_AUDIT_CLASS`      | `NONE`                             | La intención dominante es ejecutar trabajo vivo y la pantalla no incorpora una superficie material de historia, evidencia o investigación independiente.                                                                                                                                                                                                            |
| `VSCREEN-0041` | Revisión de conteo y diferencias                      | `nexo`     | `VPROC-0026::STEP-REVIEW_COUNT_VARIANCE`                    | `PRIMARY_OPERATIONAL`       | `SECONDARY_ADMINISTRATIVE`     | `SECONDARY_SUPERVISION`     | `OUTSIDE_CONFIGURATION_CLASS` | `SECONDARY_AUDIT`          | `AUDIT_RECONCILIATION`             | La pantalla contrasta fuentes o cantidades, identifica diferencias y conserva la conciliación sin sobrescribir los hechos originales, pero su intención primaria continúa siendo operativa, administrativa, de supervisión, configuración, personal o de cliente. La auditoría queda acotada a evidencia, historia y drill-down sin habilitar mutación retroactiva. |
| `VSCREEN-0042` | Caso de ajuste de inventario                          | `nexo`     | `VPROC-0026::STEP-DECIDE_INVENTORY_ADJUSTMENT`              | `PRIMARY_OPERATIONAL`       | `SECONDARY_ADMINISTRATIVE`     | `SECONDARY_SUPERVISION`     | `OUTSIDE_CONFIGURATION_CLASS` | `SECONDARY_AUDIT`          | `AUDIT_DECISION_RECORD`            | La pantalla conserva evidencia, autoridad, razón, versión y resultado de una revisión, aprobación, corrección o decisión, pero su intención primaria continúa siendo operativa, administrativa, de supervisión, configuración, personal o de cliente. La auditoría queda acotada a evidencia, historia y drill-down sin habilitar mutación retroactiva.             |
| `VSCREEN-0043` | Confirmación de entrada a inventario                  | `nexo`     | `VPROC-0024::STEP-CONFIRM_STOCK_ENTRY`                      | `PRIMARY_OPERATIONAL`       | `OUTSIDE_ADMINISTRATIVE_CLASS` | `OUTSIDE_SUPERVISION_CLASS` | `OUTSIDE_CONFIGURATION_CLASS` | `SECONDARY_AUDIT`          | `AUDIT_RECONCILIATION`             | La pantalla contrasta fuentes o cantidades, identifica diferencias y conserva la conciliación sin sobrescribir los hechos originales, pero su intención primaria continúa siendo operativa, administrativa, de supervisión, configuración, personal o de cliente. La auditoría queda acotada a evidencia, historia y drill-down sin habilitar mutación retroactiva. |
| `VSCREEN-0044` | Retiro y consumo de existencias                       | `nexo`     | `VPROC-0025::STEP-EXECUTE_STOCK_WITHDRAWAL`                 | `PRIMARY_OPERATIONAL`       | `OUTSIDE_ADMINISTRATIVE_CLASS` | `OUTSIDE_SUPERVISION_CLASS` | `OUTSIDE_CONFIGURATION_CLASS` | `OUTSIDE_AUDIT_CLASS`      | `NONE`                             | La intención dominante es ejecutar trabajo vivo y la pantalla no incorpora una superficie material de historia, evidencia o investigación independiente.                                                                                                                                                                                                            |
| `VSCREEN-0045` | Traslado interno de existencias                       | `nexo`     | `VPROC-0025::STEP-EXECUTE_INTERNAL_TRANSFER`                | `PRIMARY_OPERATIONAL`       | `OUTSIDE_ADMINISTRATIVE_CLASS` | `OUTSIDE_SUPERVISION_CLASS` | `OUTSIDE_CONFIGURATION_CLASS` | `OUTSIDE_AUDIT_CLASS`      | `NONE`                             | La intención dominante es ejecutar trabajo vivo y la pantalla no incorpora una superficie material de historia, evidencia o investigación independiente.                                                                                                                                                                                                            |
| `VSCREEN-0046` | Solicitud de remisión                                 | `nexo`     | `VPROC-0028::STEP-SUBMIT_REPLENISHMENT_REQUEST`             | `PRIMARY_OPERATIONAL`       | `OUTSIDE_ADMINISTRATIVE_CLASS` | `OUTSIDE_SUPERVISION_CLASS` | `OUTSIDE_CONFIGURATION_CLASS` | `OUTSIDE_AUDIT_CLASS`      | `NONE`                             | La intención dominante es ejecutar trabajo vivo y la pantalla no incorpora una superficie material de historia, evidencia o investigación independiente.                                                                                                                                                                                                            |
| `VSCREEN-0047` | Preparación de remisión                               | `nexo`     | `VPROC-0028::STEP-PREPARE_REPLENISHMENT`                    | `PRIMARY_OPERATIONAL`       | `OUTSIDE_ADMINISTRATIVE_CLASS` | `OUTSIDE_SUPERVISION_CLASS` | `OUTSIDE_CONFIGURATION_CLASS` | `OUTSIDE_AUDIT_CLASS`      | `NONE`                             | La intención dominante es ejecutar trabajo vivo y la pantalla no incorpora una superficie material de historia, evidencia o investigación independiente.                                                                                                                                                                                                            |
| `VSCREEN-0048` | Carga y despacho de remisión                          | `nexo`     | `VPROC-0028::STEP-LOAD_AND_DISPATCH_REPLENISHMENT`          | `PRIMARY_OPERATIONAL`       | `OUTSIDE_ADMINISTRATIVE_CLASS` | `OUTSIDE_SUPERVISION_CLASS` | `OUTSIDE_CONFIGURATION_CLASS` | `OUTSIDE_AUDIT_CLASS`      | `NONE`                             | La intención dominante es ejecutar trabajo vivo y la pantalla no incorpora una superficie material de historia, evidencia o investigación independiente.                                                                                                                                                                                                            |
| `VSCREEN-0049` | Seguimiento de remisión en tránsito                   | `nexo`     | `VPROC-0028::STEP-MONITOR_REPLENISHMENT_TRANSIT`            | `PRIMARY_OPERATIONAL`       | `OUTSIDE_ADMINISTRATIVE_CLASS` | `SECONDARY_SUPERVISION`     | `OUTSIDE_CONFIGURATION_CLASS` | `SECONDARY_AUDIT`          | `AUDIT_CUSTODY_CHAIN`              | La pantalla reconstruye tenencia, ubicación, entrega, recepción, devolución, condición o prueba de custodia física, pero su intención primaria continúa siendo operativa, administrativa, de supervisión, configuración, personal o de cliente. La auditoría queda acotada a evidencia, historia y drill-down sin habilitar mutación retroactiva.                   |
| `VSCREEN-0050` | Recepción de remisión                                 | `nexo`     | `VPROC-0028::STEP-RECEIVE_REPLENISHMENT`                    | `PRIMARY_OPERATIONAL`       | `OUTSIDE_ADMINISTRATIVE_CLASS` | `SECONDARY_SUPERVISION`     | `OUTSIDE_CONFIGURATION_CLASS` | `SECONDARY_AUDIT`          | `AUDIT_RECONCILIATION`             | La pantalla contrasta fuentes o cantidades, identifica diferencias y conserva la conciliación sin sobrescribir los hechos originales, pero su intención primaria continúa siendo operativa, administrativa, de supervisión, configuración, personal o de cliente. La auditoría queda acotada a evidencia, historia y drill-down sin habilitar mutación retroactiva. |
| `VSCREEN-0051` | Vencimiento, cuarentena, daño y merma                 | `nexo`     | `VPROC-0027::STEP-RESOLVE_STOCK_CONDITION`                  | `PRIMARY_OPERATIONAL`       | `SECONDARY_ADMINISTRATIVE`     | `SECONDARY_SUPERVISION`     | `OUTSIDE_CONFIGURATION_CLASS` | `SECONDARY_AUDIT`          | `AUDIT_CUSTODY_CHAIN`              | La pantalla reconstruye tenencia, ubicación, entrega, recepción, devolución, condición o prueba de custodia física, pero su intención primaria continúa siendo operativa, administrativa, de supervisión, configuración, personal o de cliente. La auditoría queda acotada a evidencia, historia y drill-down sin habilitar mutación retroactiva.                   |
| `VSCREEN-0052` | LPN, contenedores y reutilizables                     | `nexo`     | `VPROC-0032::STEP-MANAGE_LPN_AND_REUSABLES`                 | `PRIMARY_OPERATIONAL`       | `OUTSIDE_ADMINISTRATIVE_CLASS` | `OUTSIDE_SUPERVISION_CLASS` | `OUTSIDE_CONFIGURATION_CLASS` | `SECONDARY_AUDIT`          | `AUDIT_CUSTODY_CHAIN`              | La pantalla reconstruye tenencia, ubicación, entrega, recepción, devolución, condición o prueba de custodia física, pero su intención primaria continúa siendo operativa, administrativa, de supervisión, configuración, personal o de cliente. La auditoría queda acotada a evidencia, historia y drill-down sin habilitar mutación retroactiva.                   |
| `VSCREEN-0053` | Activos y custodia                                    | `nexo`     | `VPROC-0029::STEP-MANAGE_ASSET_CUSTODY`                     | `PRIMARY_OPERATIONAL`       | `SECONDARY_ADMINISTRATIVE`     | `SECONDARY_SUPERVISION`     | `OUTSIDE_CONFIGURATION_CLASS` | `SECONDARY_AUDIT`          | `AUDIT_CUSTODY_CHAIN`              | La pantalla reconstruye tenencia, ubicación, entrega, recepción, devolución, condición o prueba de custodia física, pero su intención primaria continúa siendo operativa, administrativa, de supervisión, configuración, personal o de cliente. La auditoría queda acotada a evidencia, historia y drill-down sin habilitar mutación retroactiva.                   |
| `VSCREEN-0054` | Etiquetas e impresión logística                       | `nexo`     | `VPROC-0024::STEP-ISSUE_LOGISTICS_LABEL`                    | `PRIMARY_OPERATIONAL`       | `OUTSIDE_ADMINISTRATIVE_CLASS` | `OUTSIDE_SUPERVISION_CLASS` | `OUTSIDE_CONFIGURATION_CLASS` | `OUTSIDE_AUDIT_CLASS`      | `NONE`                             | La intención dominante es ejecutar trabajo vivo y la pantalla no incorpora una superficie material de historia, evidencia o investigación independiente.                                                                                                                                                                                                            |
| `VSCREEN-0055` | Inicio y cola de producción                           | `fogo`     | `VPROC-0033::STEP-TRIAGE_PRODUCTION_QUEUE`                  | `SECONDARY_OPERATIONAL`     | `SECONDARY_ADMINISTRATIVE`     | `PRIMARY_SUPERVISION`       | `OUTSIDE_CONFIGURATION_CLASS` | `OUTSIDE_AUDIT_CLASS`      | `NONE`                             | La intención dominante es supervisar situación actual, carga o desvíos; no reconstruir hechos históricos como propósito material.                                                                                                                                                                                                                                   |
| `VSCREEN-0056` | Planeación de producción                              | `fogo`     | `VPROC-0033::STEP-PLAN_PRODUCTION`                          | `SECONDARY_OPERATIONAL`     | `SECONDARY_ADMINISTRATIVE`     | `PRIMARY_SUPERVISION`       | `OUTSIDE_CONFIGURATION_CLASS` | `OUTSIDE_AUDIT_CLASS`      | `NONE`                             | La intención dominante es supervisar situación actual, carga o desvíos; no reconstruir hechos históricos como propósito material.                                                                                                                                                                                                                                   |
| `VSCREEN-0057` | Preparación e inicio de lote                          | `fogo`     | `VPROC-0034::STEP-PREPARE_AND_START_BATCH`                  | `PRIMARY_OPERATIONAL`       | `OUTSIDE_ADMINISTRATIVE_CLASS` | `OUTSIDE_SUPERVISION_CLASS` | `OUTSIDE_CONFIGURATION_CLASS` | `OUTSIDE_AUDIT_CLASS`      | `NONE`                             | La intención dominante es ejecutar trabajo vivo y la pantalla no incorpora una superficie material de historia, evidencia o investigación independiente.                                                                                                                                                                                                            |
| `VSCREEN-0058` | Ejecución de lote                                     | `fogo`     | `VPROC-0034::STEP-EXECUTE_BATCH`                            | `PRIMARY_OPERATIONAL`       | `OUTSIDE_ADMINISTRATIVE_CLASS` | `OUTSIDE_SUPERVISION_CLASS` | `OUTSIDE_CONFIGURATION_CLASS` | `OUTSIDE_AUDIT_CLASS`      | `NONE`                             | La intención dominante es ejecutar trabajo vivo y la pantalla no incorpora una superficie material de historia, evidencia o investigación independiente.                                                                                                                                                                                                            |
| `VSCREEN-0059` | Registro parcial de producción                        | `fogo`     | `VPROC-0034::STEP-CAPTURE_BATCH_PROGRESS`                   | `PRIMARY_OPERATIONAL`       | `OUTSIDE_ADMINISTRATIVE_CLASS` | `SECONDARY_SUPERVISION`     | `OUTSIDE_CONFIGURATION_CLASS` | `OUTSIDE_AUDIT_CLASS`      | `NONE`                             | La intención dominante es ejecutar trabajo vivo y la pantalla no incorpora una superficie material de historia, evidencia o investigación independiente.                                                                                                                                                                                                            |
| `VSCREEN-0060` | Finalización y cierre de lote                         | `fogo`     | `VPROC-0037::STEP-CLOSE_BATCH`                              | `PRIMARY_OPERATIONAL`       | `OUTSIDE_ADMINISTRATIVE_CLASS` | `SECONDARY_SUPERVISION`     | `OUTSIDE_CONFIGURATION_CLASS` | `OUTSIDE_AUDIT_CLASS`      | `NONE`                             | La intención dominante es ejecutar trabajo vivo y la pantalla no incorpora una superficie material de historia, evidencia o investigación independiente.                                                                                                                                                                                                            |
| `VSCREEN-0061` | Receta operativa                                      | `fogo`     | `VPROC-0016::STEP-CONSULT_APPLICABLE_RECIPE`                | `PRIMARY_OPERATIONAL`       | `OUTSIDE_ADMINISTRATIVE_CLASS` | `OUTSIDE_SUPERVISION_CLASS` | `OUTSIDE_CONFIGURATION_CLASS` | `OUTSIDE_AUDIT_CLASS`      | `NONE`                             | La intención dominante es ejecutar trabajo vivo y la pantalla no incorpora una superficie material de historia, evidencia o investigación independiente.                                                                                                                                                                                                            |
| `VSCREEN-0062` | Catálogo y editor de recetas                          | `fogo`     | `VPROC-0016::STEP-AUTHOR_RECIPE`                            | `OUTSIDE_OPERATIONAL_CLASS` | `SECONDARY_ADMINISTRATIVE`     | `OUTSIDE_SUPERVISION_CLASS` | `PRIMARY_CONFIGURATION`       | `SECONDARY_AUDIT`          | `AUDIT_CHANGE_HISTORY`             | La pantalla permite comparar versiones, vigencias, autores, aprobaciones y publicaciones de una definición reutilizable, pero su intención primaria continúa siendo operativa, administrativa, de supervisión, configuración, personal o de cliente. La auditoría queda acotada a evidencia, historia y drill-down sin habilitar mutación retroactiva.              |
| `VSCREEN-0063` | Revisión, aprobación y publicación de receta          | `fogo`     | `VPROC-0016::STEP-APPROVE_AND_PUBLISH_RECIPE`               | `OUTSIDE_OPERATIONAL_CLASS` | `SECONDARY_ADMINISTRATIVE`     | `OUTSIDE_SUPERVISION_CLASS` | `PRIMARY_CONFIGURATION`       | `SECONDARY_AUDIT`          | `AUDIT_CHANGE_HISTORY`             | La pantalla permite comparar versiones, vigencias, autores, aprobaciones y publicaciones de una definición reutilizable, pero su intención primaria continúa siendo operativa, administrativa, de supervisión, configuración, personal o de cliente. La auditoría queda acotada a evidencia, historia y drill-down sin habilitar mutación retroactiva.              |
| `VSCREEN-0064` | Prueba de receta y rendimiento                        | `fogo`     | `VPROC-0016::STEP-TEST_RECIPE_AND_YIELD`                    | `PRIMARY_OPERATIONAL`       | `SECONDARY_ADMINISTRATIVE`     | `SECONDARY_SUPERVISION`     | `OUTSIDE_CONFIGURATION_CLASS` | `SECONDARY_AUDIT`          | `AUDIT_EVIDENCE_RECORD`            | La pantalla presenta un expediente documental o paquete de evidencia necesario para demostrar qué ocurrió y con qué soporte, pero su intención primaria continúa siendo operativa, administrativa, de supervisión, configuración, personal o de cliente. La auditoría queda acotada a evidencia, historia y drill-down sin habilitar mutación retroactiva.          |
| `VSCREEN-0065` | Control de calidad y liberación                       | `fogo`     | `VPROC-0035::STEP-DECIDE_QUALITY_RELEASE`                   | `PRIMARY_OPERATIONAL`       | `SECONDARY_ADMINISTRATIVE`     | `SECONDARY_SUPERVISION`     | `OUTSIDE_CONFIGURATION_CLASS` | `SECONDARY_AUDIT`          | `AUDIT_DECISION_RECORD`            | La pantalla conserva evidencia, autoridad, razón, versión y resultado de una revisión, aprobación, corrección o decisión, pero su intención primaria continúa siendo operativa, administrativa, de supervisión, configuración, personal o de cliente. La auditoría queda acotada a evidencia, historia y drill-down sin habilitar mutación retroactiva.             |
| `VSCREEN-0066` | Empaque, etiquetado y almacenamiento de terminado     | `fogo`     | `VPROC-0036::STEP-PACK_AND_TRANSFER_FINISHED_GOOD`          | `PRIMARY_OPERATIONAL`       | `OUTSIDE_ADMINISTRATIVE_CLASS` | `OUTSIDE_SUPERVISION_CLASS` | `OUTSIDE_CONFIGURATION_CLASS` | `SECONDARY_AUDIT`          | `AUDIT_CUSTODY_CHAIN`              | La pantalla reconstruye tenencia, ubicación, entrega, recepción, devolución, condición o prueba de custodia física, pero su intención primaria continúa siendo operativa, administrativa, de supervisión, configuración, personal o de cliente. La auditoría queda acotada a evidencia, historia y drill-down sin habilitar mutación retroactiva.                   |
| `VSCREEN-0067` | Reproceso, aprovechamiento, merma y cierre productivo | `fogo`     | `VPROC-0037::STEP-RESOLVE_PRODUCTION_DISPOSITION`           | `PRIMARY_OPERATIONAL`       | `SECONDARY_ADMINISTRATIVE`     | `SECONDARY_SUPERVISION`     | `OUTSIDE_CONFIGURATION_CLASS` | `OUTSIDE_AUDIT_CLASS`      | `NONE`                             | La intención dominante es ejecutar trabajo vivo y la pantalla no incorpora una superficie material de historia, evidencia o investigación independiente.                                                                                                                                                                                                            |
| `VSCREEN-0068` | Bandeja de necesidades de compra                      | `origo`    | `VPROC-0019::STEP-TRIAGE_PURCHASE_NEEDS`                    | `SECONDARY_OPERATIONAL`     | `PRIMARY_ADMINISTRATIVE`       | `SECONDARY_SUPERVISION`     | `OUTSIDE_CONFIGURATION_CLASS` | `OUTSIDE_AUDIT_CLASS`      | `NONE`                             | La intención dominante es administrar un caso o recurso vigente; la trazabilidad técnica obligatoria no convierte por sí sola la pantalla en superficie de auditoría.                                                                                                                                                                                               |
| `VSCREEN-0069` | Solicitud de compra                                   | `origo`    | `VPROC-0019::STEP-SUBMIT_PURCHASE_REQUEST`                  | `OUTSIDE_OPERATIONAL_CLASS` | `PRIMARY_ADMINISTRATIVE`       | `OUTSIDE_SUPERVISION_CLASS` | `OUTSIDE_CONFIGURATION_CLASS` | `OUTSIDE_AUDIT_CLASS`      | `NONE`                             | La intención dominante es administrar un caso o recurso vigente; la trazabilidad técnica obligatoria no convierte por sí sola la pantalla en superficie de auditoría.                                                                                                                                                                                               |
| `VSCREEN-0070` | Catálogo de proveedores                               | `origo`    | `VPROC-0020::STEP-CONSULT_SUPPLIER_CATALOG`                 | `OUTSIDE_OPERATIONAL_CLASS` | `SECONDARY_ADMINISTRATIVE`     | `OUTSIDE_SUPERVISION_CLASS` | `PRIMARY_CONFIGURATION`       | `OUTSIDE_AUDIT_CLASS`      | `NONE`                             | La intención dominante es mantener configuración reutilizable y la pantalla no presenta historia de versiones material bajo esta clasificación.                                                                                                                                                                                                                     |
| `VSCREEN-0071` | Alta y expediente de proveedor                        | `origo`    | `VPROC-0020::STEP-ONBOARD_SUPPLIER`                         | `OUTSIDE_OPERATIONAL_CLASS` | `PRIMARY_ADMINISTRATIVE`       | `OUTSIDE_SUPERVISION_CLASS` | `SECONDARY_CONFIGURATION`     | `SECONDARY_AUDIT`          | `AUDIT_EVIDENCE_RECORD`            | La pantalla presenta un expediente documental o paquete de evidencia necesario para demostrar qué ocurrió y con qué soporte, pero su intención primaria continúa siendo operativa, administrativa, de supervisión, configuración, personal o de cliente. La auditoría queda acotada a evidencia, historia y drill-down sin habilitar mutación retroactiva.          |
| `VSCREEN-0072` | Comparación de cotizaciones                           | `origo`    | `VPROC-0020::STEP-COMPARE_QUOTES`                           | `OUTSIDE_OPERATIONAL_CLASS` | `PRIMARY_ADMINISTRATIVE`       | `OUTSIDE_SUPERVISION_CLASS` | `OUTSIDE_CONFIGURATION_CLASS` | `SECONDARY_AUDIT`          | `AUDIT_DECISION_RECORD`            | La pantalla conserva evidencia, autoridad, razón, versión y resultado de una revisión, aprobación, corrección o decisión, pero su intención primaria continúa siendo operativa, administrativa, de supervisión, configuración, personal o de cliente. La auditoría queda acotada a evidencia, historia y drill-down sin habilitar mutación retroactiva.             |
| `VSCREEN-0073` | Editor de orden de compra                             | `origo`    | `VPROC-0021::STEP-PREPARE_PURCHASE_ORDER`                   | `OUTSIDE_OPERATIONAL_CLASS` | `PRIMARY_ADMINISTRATIVE`       | `OUTSIDE_SUPERVISION_CLASS` | `OUTSIDE_CONFIGURATION_CLASS` | `SECONDARY_AUDIT`          | `AUDIT_CASE_CHRONOLOGY`            | La pantalla muestra la cronología material de un caso, comunicación, solicitud o compromiso con responsables y resultados, pero su intención primaria continúa siendo operativa, administrativa, de supervisión, configuración, personal o de cliente. La auditoría queda acotada a evidencia, historia y drill-down sin habilitar mutación retroactiva.            |
| `VSCREEN-0074` | Bandeja de aprobaciones de compra                     | `origo`    | `VPROC-0021::STEP-APPROVE_PURCHASE`                         | `OUTSIDE_OPERATIONAL_CLASS` | `PRIMARY_ADMINISTRATIVE`       | `SECONDARY_SUPERVISION`     | `OUTSIDE_CONFIGURATION_CLASS` | `SECONDARY_AUDIT`          | `AUDIT_DECISION_RECORD`            | La pantalla conserva evidencia, autoridad, razón, versión y resultado de una revisión, aprobación, corrección o decisión, pero su intención primaria continúa siendo operativa, administrativa, de supervisión, configuración, personal o de cliente. La auditoría queda acotada a evidencia, historia y drill-down sin habilitar mutación retroactiva.             |
| `VSCREEN-0075` | Detalle y seguimiento de orden                        | `origo`    | `VPROC-0021::STEP-MONITOR_PURCHASE_ORDER`                   | `SECONDARY_OPERATIONAL`     | `PRIMARY_ADMINISTRATIVE`       | `SECONDARY_SUPERVISION`     | `OUTSIDE_CONFIGURATION_CLASS` | `SECONDARY_AUDIT`          | `AUDIT_CASE_CHRONOLOGY`            | La pantalla muestra la cronología material de un caso, comunicación, solicitud o compromiso con responsables y resultados, pero su intención primaria continúa siendo operativa, administrativa, de supervisión, configuración, personal o de cliente. La auditoría queda acotada a evidencia, historia y drill-down sin habilitar mutación retroactiva.            |
| `VSCREEN-0076` | Cola de recepciones                                   | `origo`    | `VPROC-0022::STEP-TRIAGE_RECEIPT_QUEUE`                     | `SECONDARY_OPERATIONAL`     | `SECONDARY_ADMINISTRATIVE`     | `PRIMARY_SUPERVISION`       | `OUTSIDE_CONFIGURATION_CLASS` | `OUTSIDE_AUDIT_CLASS`      | `NONE`                             | La intención dominante es supervisar situación actual, carga o desvíos; no reconstruir hechos históricos como propósito material.                                                                                                                                                                                                                                   |
| `VSCREEN-0077` | Recepción total o parcial                             | `origo`    | `VPROC-0022::STEP-RECEIVE_PURCHASE`                         | `PRIMARY_OPERATIONAL`       | `SECONDARY_ADMINISTRATIVE`     | `SECONDARY_SUPERVISION`     | `OUTSIDE_CONFIGURATION_CLASS` | `SECONDARY_AUDIT`          | `AUDIT_RECONCILIATION`             | La pantalla contrasta fuentes o cantidades, identifica diferencias y conserva la conciliación sin sobrescribir los hechos originales, pero su intención primaria continúa siendo operativa, administrativa, de supervisión, configuración, personal o de cliente. La auditoría queda acotada a evidencia, historia y drill-down sin habilitar mutación retroactiva. |
| `VSCREEN-0078` | Resolución de diferencias de recepción                | `origo`    | `VPROC-0022::STEP-RESOLVE_RECEIPT_VARIANCE`                 | `PRIMARY_OPERATIONAL`       | `SECONDARY_ADMINISTRATIVE`     | `SECONDARY_SUPERVISION`     | `OUTSIDE_CONFIGURATION_CLASS` | `SECONDARY_AUDIT`          | `AUDIT_RECONCILIATION`             | La pantalla contrasta fuentes o cantidades, identifica diferencias y conserva la conciliación sin sobrescribir los hechos originales, pero su intención primaria continúa siendo operativa, administrativa, de supervisión, configuración, personal o de cliente. La auditoría queda acotada a evidencia, historia y drill-down sin habilitar mutación retroactiva. |
| `VSCREEN-0079` | Historial y auditoría de abastecimiento               | `origo`    | `VPROC-0022::STEP-AUDIT_PROCUREMENT_CYCLE`                  | `OUTSIDE_OPERATIONAL_CLASS` | `SECONDARY_ADMINISTRATIVE`     | `OUTSIDE_SUPERVISION_CLASS` | `OUTSIDE_CONFIGURATION_CLASS` | `PRIMARY_AUDIT`            | `AUDIT_PROCUREMENT_HISTORY`        | La intención dominante reconstruye de extremo a extremo el ciclo de abastecimiento, sus documentos, decisiones, recepciones y diferencias. La pantalla existe para reconstruir, verificar o publicar evidencia histórica sin convertirse en la fuente mutable del hecho original.                                                                                   |
| `VSCREEN-0080` | Inicio POS                                            | `pulso`    | `VPROC-0039::STEP-ENTER_POS_WORKSPACE`                      | `PRIMARY_OPERATIONAL`       | `OUTSIDE_ADMINISTRATIVE_CLASS` | `SECONDARY_SUPERVISION`     | `OUTSIDE_CONFIGURATION_CLASS` | `OUTSIDE_AUDIT_CLASS`      | `NONE`                             | La intención dominante es ejecutar trabajo vivo y la pantalla no incorpora una superficie material de historia, evidencia o investigación independiente.                                                                                                                                                                                                            |
| `VSCREEN-0081` | Creación de venta o pedido                            | `pulso`    | `VPROC-0039::STEP-CREATE_SALE_OR_ORDER`                     | `PRIMARY_OPERATIONAL`       | `OUTSIDE_ADMINISTRATIVE_CLASS` | `OUTSIDE_SUPERVISION_CLASS` | `OUTSIDE_CONFIGURATION_CLASS` | `OUTSIDE_AUDIT_CLASS`      | `NONE`                             | La intención dominante es ejecutar trabajo vivo y la pantalla no incorpora una superficie material de historia, evidencia o investigación independiente.                                                                                                                                                                                                            |
| `VSCREEN-0082` | Mapa de salón y mesas                                 | `pulso`    | `VPROC-0038::STEP-MANAGE_TABLE_SERVICE`                     | `PRIMARY_OPERATIONAL`       | `OUTSIDE_ADMINISTRATIVE_CLASS` | `SECONDARY_SUPERVISION`     | `OUTSIDE_CONFIGURATION_CLASS` | `OUTSIDE_AUDIT_CLASS`      | `NONE`                             | La intención dominante es ejecutar trabajo vivo y la pantalla no incorpora una superficie material de historia, evidencia o investigación independiente.                                                                                                                                                                                                            |
| `VSCREEN-0083` | Detalle y modificación de pedido                      | `pulso`    | `VPROC-0038::STEP-MODIFY_ACTIVE_ORDER`                      | `PRIMARY_OPERATIONAL`       | `OUTSIDE_ADMINISTRATIVE_CLASS` | `OUTSIDE_SUPERVISION_CLASS` | `OUTSIDE_CONFIGURATION_CLASS` | `SECONDARY_AUDIT`          | `AUDIT_TRANSACTION_LEDGER`         | La pantalla presenta movimientos, receipts, reversiones o efectos económicos/comerciales como secuencia verificable, pero su intención primaria continúa siendo operativa, administrativa, de supervisión, configuración, personal o de cliente. La auditoría queda acotada a evidencia, historia y drill-down sin habilitar mutación retroactiva.                  |
| `VSCREEN-0084` | Cobro y medios de pago                                | `pulso`    | `VPROC-0043::STEP-COLLECT_PAYMENT`                          | `PRIMARY_OPERATIONAL`       | `OUTSIDE_ADMINISTRATIVE_CLASS` | `OUTSIDE_SUPERVISION_CLASS` | `OUTSIDE_CONFIGURATION_CLASS` | `SECONDARY_AUDIT`          | `AUDIT_TRANSACTION_LEDGER`         | La pantalla presenta movimientos, receipts, reversiones o efectos económicos/comerciales como secuencia verificable, pero su intención primaria continúa siendo operativa, administrativa, de supervisión, configuración, personal o de cliente. La auditoría queda acotada a evidencia, historia y drill-down sin habilitar mutación retroactiva.                  |
| `VSCREEN-0085` | Identificación de cliente y acumulación               | `pulso`    | `VPROC-0045::STEP-IDENTIFY_CUSTOMER_AND_ACCRUE`             | `PRIMARY_OPERATIONAL`       | `OUTSIDE_ADMINISTRATIVE_CLASS` | `OUTSIDE_SUPERVISION_CLASS` | `OUTSIDE_CONFIGURATION_CLASS` | `OUTSIDE_AUDIT_CLASS`      | `NONE`                             | La intención dominante es ejecutar trabajo vivo y la pantalla no incorpora una superficie material de historia, evidencia o investigación independiente.                                                                                                                                                                                                            |
| `VSCREEN-0086` | Redención de puntos o beneficios                      | `pulso`    | `VPROC-0045::STEP-REDEEM_LOYALTY_VALUE`                     | `PRIMARY_OPERATIONAL`       | `OUTSIDE_ADMINISTRATIVE_CLASS` | `OUTSIDE_SUPERVISION_CLASS` | `OUTSIDE_CONFIGURATION_CLASS` | `SECONDARY_AUDIT`          | `AUDIT_TRANSACTION_LEDGER`         | La pantalla presenta movimientos, receipts, reversiones o efectos económicos/comerciales como secuencia verificable, pero su intención primaria continúa siendo operativa, administrativa, de supervisión, configuración, personal o de cliente. La auditoría queda acotada a evidencia, historia y drill-down sin habilitar mutación retroactiva.                  |
| `VSCREEN-0087` | Bandeja de pedidos de canales externos                | `pulso`    | `VPROC-0040::STEP-ADMIT_EXTERNAL_ORDER`                     | `PRIMARY_OPERATIONAL`       | `OUTSIDE_ADMINISTRATIVE_CLASS` | `SECONDARY_SUPERVISION`     | `OUTSIDE_CONFIGURATION_CLASS` | `SECONDARY_AUDIT`          | `AUDIT_TRANSACTION_LEDGER`         | La pantalla presenta movimientos, receipts, reversiones o efectos económicos/comerciales como secuencia verificable, pero su intención primaria continúa siendo operativa, administrativa, de supervisión, configuración, personal o de cliente. La auditoría queda acotada a evidencia, historia y drill-down sin habilitar mutación retroactiva.                  |
| `VSCREEN-0088` | Seguimiento de preparación y entrega                  | `pulso`    | `VPROC-0039::STEP-MONITOR_ORDER_FULFILLMENT`                | `PRIMARY_OPERATIONAL`       | `OUTSIDE_ADMINISTRATIVE_CLASS` | `SECONDARY_SUPERVISION`     | `OUTSIDE_CONFIGURATION_CLASS` | `SECONDARY_AUDIT`          | `AUDIT_TRANSACTION_LEDGER`         | La pantalla presenta movimientos, receipts, reversiones o efectos económicos/comerciales como secuencia verificable, pero su intención primaria continúa siendo operativa, administrativa, de supervisión, configuración, personal o de cliente. La auditoría queda acotada a evidencia, historia y drill-down sin habilitar mutación retroactiva.                  |
| `VSCREEN-0089` | Apertura de caja                                      | `pulso`    | `VPROC-0044::STEP-OPEN_CASH_SESSION`                        | `PRIMARY_OPERATIONAL`       | `OUTSIDE_ADMINISTRATIVE_CLASS` | `OUTSIDE_SUPERVISION_CLASS` | `OUTSIDE_CONFIGURATION_CLASS` | `SECONDARY_AUDIT`          | `AUDIT_TRANSACTION_LEDGER`         | La pantalla presenta movimientos, receipts, reversiones o efectos económicos/comerciales como secuencia verificable, pero su intención primaria continúa siendo operativa, administrativa, de supervisión, configuración, personal o de cliente. La auditoría queda acotada a evidencia, historia y drill-down sin habilitar mutación retroactiva.                  |
| `VSCREEN-0090` | Cierre de caja                                        | `pulso`    | `VPROC-0044::STEP-CLOSE_CASH_SESSION`                       | `PRIMARY_OPERATIONAL`       | `SECONDARY_ADMINISTRATIVE`     | `SECONDARY_SUPERVISION`     | `OUTSIDE_CONFIGURATION_CLASS` | `SECONDARY_AUDIT`          | `AUDIT_RECONCILIATION`             | La pantalla contrasta fuentes o cantidades, identifica diferencias y conserva la conciliación sin sobrescribir los hechos originales, pero su intención primaria continúa siendo operativa, administrativa, de supervisión, configuración, personal o de cliente. La auditoría queda acotada a evidencia, historia y drill-down sin habilitar mutación retroactiva. |
| `VSCREEN-0091` | Anulación, devolución y reembolso                     | `pulso`    | `VPROC-0042::STEP-RESOLVE_REVERSAL_OR_REFUND`               | `PRIMARY_OPERATIONAL`       | `SECONDARY_ADMINISTRATIVE`     | `SECONDARY_SUPERVISION`     | `OUTSIDE_CONFIGURATION_CLASS` | `SECONDARY_AUDIT`          | `AUDIT_TRANSACTION_LEDGER`         | La pantalla presenta movimientos, receipts, reversiones o efectos económicos/comerciales como secuencia verificable, pero su intención primaria continúa siendo operativa, administrativa, de supervisión, configuración, personal o de cliente. La auditoría queda acotada a evidencia, historia y drill-down sin habilitar mutación retroactiva.                  |
| `VSCREEN-0092` | Oferta, menú, precio comercial y disponibilidad       | `pulso`    | `VPROC-0017::STEP-PUBLISH_COMMERCIAL_OFFER`                 | `OUTSIDE_OPERATIONAL_CLASS` | `SECONDARY_ADMINISTRATIVE`     | `OUTSIDE_SUPERVISION_CLASS` | `PRIMARY_CONFIGURATION`       | `SECONDARY_AUDIT`          | `AUDIT_CHANGE_HISTORY`             | La pantalla permite comparar versiones, vigencias, autores, aprobaciones y publicaciones de una definición reutilizable, pero su intención primaria continúa siendo operativa, administrativa, de supervisión, configuración, personal o de cliente. La auditoría queda acotada a evidencia, historia y drill-down sin habilitar mutación retroactiva.              |
| `VSCREEN-0093` | Revisión de ventas, caja y terminales                 | `pulso`    | `VPROC-0044::STEP-REVIEW_SALES_AND_TERMINALS`               | `SECONDARY_OPERATIONAL`     | `SECONDARY_ADMINISTRATIVE`     | `PRIMARY_SUPERVISION`       | `OUTSIDE_CONFIGURATION_CLASS` | `SECONDARY_AUDIT`          | `AUDIT_RECONCILIATION`             | La pantalla contrasta fuentes o cantidades, identifica diferencias y conserva la conciliación sin sobrescribir los hechos originales, pero su intención primaria continúa siendo operativa, administrativa, de supervisión, configuración, personal o de cliente. La auditoría queda acotada a evidencia, historia y drill-down sin habilitar mutación retroactiva. |
| `VSCREEN-0094` | Inicio financiero y ejecutivo                         | `numera`   | `VPROC-0061::STEP-REVIEW_FINANCIAL_POSITION`                | `OUTSIDE_OPERATIONAL_CLASS` | `SECONDARY_ADMINISTRATIVE`     | `PRIMARY_SUPERVISION`       | `OUTSIDE_CONFIGURATION_CLASS` | `OUTSIDE_AUDIT_CLASS`      | `NONE`                             | La intención dominante es supervisar situación actual, carga o desvíos; no reconstruir hechos históricos como propósito material.                                                                                                                                                                                                                                   |
| `VSCREEN-0095` | Bandeja de hechos económicos                          | `numera`   | `VPROC-0051::STEP-TRIAGE_ECONOMIC_FACTS`                    | `OUTSIDE_OPERATIONAL_CLASS` | `PRIMARY_ADMINISTRATIVE`       | `OUTSIDE_SUPERVISION_CLASS` | `OUTSIDE_CONFIGURATION_CLASS` | `SECONDARY_AUDIT`          | `AUDIT_TRANSACTION_LEDGER`         | La pantalla presenta movimientos, receipts, reversiones o efectos económicos/comerciales como secuencia verificable, pero su intención primaria continúa siendo operativa, administrativa, de supervisión, configuración, personal o de cliente. La auditoría queda acotada a evidencia, historia y drill-down sin habilitar mutación retroactiva.                  |
| `VSCREEN-0096` | Registro de gasto y soporte                           | `numera`   | `VPROC-0051::STEP-CAPTURE_EXPENSE_AND_EVIDENCE`             | `OUTSIDE_OPERATIONAL_CLASS` | `PRIMARY_ADMINISTRATIVE`       | `OUTSIDE_SUPERVISION_CLASS` | `OUTSIDE_CONFIGURATION_CLASS` | `SECONDARY_AUDIT`          | `AUDIT_EVIDENCE_RECORD`            | La pantalla presenta un expediente documental o paquete de evidencia necesario para demostrar qué ocurrió y con qué soporte, pero su intención primaria continúa siendo operativa, administrativa, de supervisión, configuración, personal o de cliente. La auditoría queda acotada a evidencia, historia y drill-down sin habilitar mutación retroactiva.          |
| `VSCREEN-0097` | Bandeja de aprobaciones financieras                   | `numera`   | `VPROC-0052::STEP-APPROVE_FINANCIAL_DECISION`               | `OUTSIDE_OPERATIONAL_CLASS` | `PRIMARY_ADMINISTRATIVE`       | `SECONDARY_SUPERVISION`     | `OUTSIDE_CONFIGURATION_CLASS` | `SECONDARY_AUDIT`          | `AUDIT_DECISION_RECORD`            | La pantalla conserva evidencia, autoridad, razón, versión y resultado de una revisión, aprobación, corrección o decisión, pero su intención primaria continúa siendo operativa, administrativa, de supervisión, configuración, personal o de cliente. La auditoría queda acotada a evidencia, historia y drill-down sin habilitar mutación retroactiva.             |
| `VSCREEN-0098` | Cuentas por pagar y obligaciones                      | `numera`   | `VPROC-0052::STEP-MANAGE_PAYABLE_OBLIGATION`                | `OUTSIDE_OPERATIONAL_CLASS` | `PRIMARY_ADMINISTRATIVE`       | `OUTSIDE_SUPERVISION_CLASS` | `OUTSIDE_CONFIGURATION_CLASS` | `SECONDARY_AUDIT`          | `AUDIT_TRANSACTION_LEDGER`         | La pantalla presenta movimientos, receipts, reversiones o efectos económicos/comerciales como secuencia verificable, pero su intención primaria continúa siendo operativa, administrativa, de supervisión, configuración, personal o de cliente. La auditoría queda acotada a evidencia, historia y drill-down sin habilitar mutación retroactiva.                  |
| `VSCREEN-0099` | Cuentas por cobrar y cartera                          | `numera`   | `VPROC-0053::STEP-MANAGE_RECEIVABLE`                        | `OUTSIDE_OPERATIONAL_CLASS` | `PRIMARY_ADMINISTRATIVE`       | `OUTSIDE_SUPERVISION_CLASS` | `OUTSIDE_CONFIGURATION_CLASS` | `SECONDARY_AUDIT`          | `AUDIT_TRANSACTION_LEDGER`         | La pantalla presenta movimientos, receipts, reversiones o efectos económicos/comerciales como secuencia verificable, pero su intención primaria continúa siendo operativa, administrativa, de supervisión, configuración, personal o de cliente. La auditoría queda acotada a evidencia, historia y drill-down sin habilitar mutación retroactiva.                  |
| `VSCREEN-0100` | Caja, bancos y movimientos financieros                | `numera`   | `VPROC-0052::STEP-EXECUTE_TREASURY_MOVEMENT`                | `OUTSIDE_OPERATIONAL_CLASS` | `PRIMARY_ADMINISTRATIVE`       | `OUTSIDE_SUPERVISION_CLASS` | `OUTSIDE_CONFIGURATION_CLASS` | `SECONDARY_AUDIT`          | `AUDIT_TRANSACTION_LEDGER`         | La pantalla presenta movimientos, receipts, reversiones o efectos económicos/comerciales como secuencia verificable, pero su intención primaria continúa siendo operativa, administrativa, de supervisión, configuración, personal o de cliente. La auditoría queda acotada a evidencia, historia y drill-down sin habilitar mutación retroactiva.                  |
| `VSCREEN-0101` | Conciliación de ventas y pagos                        | `numera`   | `VPROC-0051::STEP-RECONCILE_SALES_AND_PAYMENTS`             | `OUTSIDE_OPERATIONAL_CLASS` | `PRIMARY_ADMINISTRATIVE`       | `SECONDARY_SUPERVISION`     | `OUTSIDE_CONFIGURATION_CLASS` | `SECONDARY_AUDIT`          | `AUDIT_RECONCILIATION`             | La pantalla contrasta fuentes o cantidades, identifica diferencias y conserva la conciliación sin sobrescribir los hechos originales, pero su intención primaria continúa siendo operativa, administrativa, de supervisión, configuración, personal o de cliente. La auditoría queda acotada a evidencia, historia y drill-down sin habilitar mutación retroactiva. |
| `VSCREEN-0102` | Conciliación de compras y recepciones                 | `numera`   | `VPROC-0051::STEP-RECONCILE_PURCHASES_AND_RECEIPTS`         | `OUTSIDE_OPERATIONAL_CLASS` | `PRIMARY_ADMINISTRATIVE`       | `SECONDARY_SUPERVISION`     | `OUTSIDE_CONFIGURATION_CLASS` | `SECONDARY_AUDIT`          | `AUDIT_RECONCILIATION`             | La pantalla contrasta fuentes o cantidades, identifica diferencias y conserva la conciliación sin sobrescribir los hechos originales, pero su intención primaria continúa siendo operativa, administrativa, de supervisión, configuración, personal o de cliente. La auditoría queda acotada a evidencia, historia y drill-down sin habilitar mutación retroactiva. |
| `VSCREEN-0103` | Conciliación de inventario, producción y variaciones  | `numera`   | `VPROC-0054::STEP-RECONCILE_OPERATING_VARIANCES`            | `OUTSIDE_OPERATIONAL_CLASS` | `PRIMARY_ADMINISTRATIVE`       | `SECONDARY_SUPERVISION`     | `OUTSIDE_CONFIGURATION_CLASS` | `SECONDARY_AUDIT`          | `AUDIT_RECONCILIATION`             | La pantalla contrasta fuentes o cantidades, identifica diferencias y conserva la conciliación sin sobrescribir los hechos originales, pero su intención primaria continúa siendo operativa, administrativa, de supervisión, configuración, personal o de cliente. La auditoría queda acotada a evidencia, historia y drill-down sin habilitar mutación retroactiva. |
| `VSCREEN-0104` | Costos, rentabilidad y escenarios                     | `numera`   | `VPROC-0054::STEP-ANALYZE_COST_AND_PROFITABILITY`           | `OUTSIDE_OPERATIONAL_CLASS` | `PRIMARY_ADMINISTRATIVE`       | `SECONDARY_SUPERVISION`     | `OUTSIDE_CONFIGURATION_CLASS` | `OUTSIDE_AUDIT_CLASS`      | `NONE`                             | La intención dominante es administrar un caso o recurso vigente; la trazabilidad técnica obligatoria no convierte por sí sola la pantalla en superficie de auditoría.                                                                                                                                                                                               |
| `VSCREEN-0105` | Cierre, reapertura y corrección de periodo            | `numera`   | `VPROC-0054::STEP-CLOSE_OR_REOPEN_PERIOD`                   | `OUTSIDE_OPERATIONAL_CLASS` | `PRIMARY_ADMINISTRATIVE`       | `SECONDARY_SUPERVISION`     | `OUTSIDE_CONFIGURATION_CLASS` | `SECONDARY_AUDIT`          | `AUDIT_DECISION_RECORD`            | La pantalla conserva evidencia, autoridad, razón, versión y resultado de una revisión, aprobación, corrección o decisión, pero su intención primaria continúa siendo operativa, administrativa, de supervisión, configuración, personal o de cliente. La auditoría queda acotada a evidencia, historia y drill-down sin habilitar mutación retroactiva.             |
| `VSCREEN-0106` | Reportes y exportaciones financieras                  | `numera`   | `VPROC-0061::STEP-PUBLISH_FINANCIAL_REPORT`                 | `OUTSIDE_OPERATIONAL_CLASS` | `SECONDARY_ADMINISTRATIVE`     | `OUTSIDE_SUPERVISION_CLASS` | `OUTSIDE_CONFIGURATION_CLASS` | `PRIMARY_AUDIT`            | `AUDIT_FINANCIAL_REPORTING`        | La intención dominante produce reportes y exportaciones financieras reproducibles con periodo, fuente, corte y trazabilidad al hecho económico. La pantalla existe para reconstruir, verificar o publicar evidencia histórica sin convertirse en la fuente mutable del hecho original.                                                                              |
| `VSCREEN-0107` | Inicio del cliente y resumen de beneficios            | `pass`     | `VPROC-0045::STEP-ENTER_LOYALTY_HOME`                       | `OUTSIDE_OPERATIONAL_CLASS` | `OUTSIDE_ADMINISTRATIVE_CLASS` | `OUTSIDE_SUPERVISION_CLASS` | `OUTSIDE_CONFIGURATION_CLASS` | `OUTSIDE_AUDIT_CLASS`      | `NONE`                             | La superficie pertenece al canal de cliente y no presenta historia o evidencia material suficiente bajo este contrato; su clase primaria se resolverá en PROC-SCREEN-011.                                                                                                                                                                                           |
| `VSCREEN-0108` | QR personal de identificación                         | `pass`     | `VPROC-0045::STEP-PRESENT_CUSTOMER_ID`                      | `OUTSIDE_OPERATIONAL_CLASS` | `OUTSIDE_ADMINISTRATIVE_CLASS` | `OUTSIDE_SUPERVISION_CLASS` | `OUTSIDE_CONFIGURATION_CLASS` | `OUTSIDE_AUDIT_CLASS`      | `NONE`                             | La superficie pertenece al canal de cliente y no presenta historia o evidencia material suficiente bajo este contrato; su clase primaria se resolverá en PROC-SCREEN-011.                                                                                                                                                                                           |
| `VSCREEN-0109` | Catálogo de beneficios y recompensas                  | `pass`     | `VPROC-0045::STEP-CONSULT_REWARDS_CATALOG`                  | `OUTSIDE_OPERATIONAL_CLASS` | `OUTSIDE_ADMINISTRATIVE_CLASS` | `OUTSIDE_SUPERVISION_CLASS` | `OUTSIDE_CONFIGURATION_CLASS` | `OUTSIDE_AUDIT_CLASS`      | `NONE`                             | La superficie pertenece al canal de cliente y no presenta historia o evidencia material suficiente bajo este contrato; su clase primaria se resolverá en PROC-SCREEN-011.                                                                                                                                                                                           |
| `VSCREEN-0110` | Ticket o QR de redención                              | `pass`     | `VPROC-0045::STEP-CREATE_REDEMPTION_INTENT`                 | `OUTSIDE_OPERATIONAL_CLASS` | `OUTSIDE_ADMINISTRATIVE_CLASS` | `OUTSIDE_SUPERVISION_CLASS` | `OUTSIDE_CONFIGURATION_CLASS` | `SECONDARY_AUDIT`          | `AUDIT_TRANSACTION_LEDGER`         | La pantalla presenta movimientos, receipts, reversiones o efectos económicos/comerciales como secuencia verificable, pero su intención primaria continúa siendo operativa, administrativa, de supervisión, configuración, personal o de cliente. La auditoría queda acotada a evidencia, historia y drill-down sin habilitar mutación retroactiva.                  |
| `VSCREEN-0111` | Historial de puntos y redenciones                     | `pass`     | `VPROC-0045::STEP-AUDIT_PERSONAL_LOYALTY_LEDGER`            | `OUTSIDE_OPERATIONAL_CLASS` | `OUTSIDE_ADMINISTRATIVE_CLASS` | `OUTSIDE_SUPERVISION_CLASS` | `OUTSIDE_CONFIGURATION_CLASS` | `SECONDARY_AUDIT`          | `AUDIT_TRANSACTION_LEDGER`         | La pantalla presenta movimientos, receipts, reversiones o efectos económicos/comerciales como secuencia verificable, pero su intención primaria continúa siendo operativa, administrativa, de supervisión, configuración, personal o de cliente. La auditoría queda acotada a evidencia, historia y drill-down sin habilitar mutación retroactiva.                  |
| `VSCREEN-0112` | Perfil, privacidad y consentimientos                  | `pass`     | `VPROC-0045::STEP-MAINTAIN_CUSTOMER_PROFILE_AND_CONSENT`    | `OUTSIDE_OPERATIONAL_CLASS` | `OUTSIDE_ADMINISTRATIVE_CLASS` | `OUTSIDE_SUPERVISION_CLASS` | `OUTSIDE_CONFIGURATION_CLASS` | `OUTSIDE_AUDIT_CLASS`      | `NONE`                             | La superficie pertenece al canal de cliente y no presenta historia o evidencia material suficiente bajo este contrato; su clase primaria se resolverá en PROC-SCREEN-011.                                                                                                                                                                                           |
| `VSCREEN-0113` | Registro y seguimiento de decisiones empresariales    | `viso`     | `VPROC-0001::STEP-RECORD_AND_TRACK_DECISION`                | `OUTSIDE_OPERATIONAL_CLASS` | `PRIMARY_ADMINISTRATIVE`       | `SECONDARY_SUPERVISION`     | `OUTSIDE_CONFIGURATION_CLASS` | `SECONDARY_AUDIT`          | `AUDIT_DECISION_RECORD`            | La pantalla conserva evidencia, autoridad, razón, versión y resultado de una revisión, aprobación, corrección o decisión, pero su intención primaria continúa siendo operativa, administrativa, de supervisión, configuración, personal o de cliente. La auditoría queda acotada a evidencia, historia y drill-down sin habilitar mutación retroactiva.             |
| `VSCREEN-0114` | Solicitudes y certificaciones de acceso               | `viso`     | `VPROC-0059::STEP-REVIEW_AND_CERTIFY_ACCESS`                | `OUTSIDE_OPERATIONAL_CLASS` | `PRIMARY_ADMINISTRATIVE`       | `SECONDARY_SUPERVISION`     | `OUTSIDE_CONFIGURATION_CLASS` | `SECONDARY_AUDIT`          | `AUDIT_ACCESS_SECURITY`            | La pantalla expone historia y evidencia de asignaciones, certificaciones, revocaciones, dispositivos o sesiones de seguridad, pero su intención primaria continúa siendo operativa, administrativa, de supervisión, configuración, personal o de cliente. La auditoría queda acotada a evidencia, historia y drill-down sin habilitar mutación retroactiva.         |
| `VSCREEN-0115` | Gobierno de documentos y evidencia                    | `viso`     | `VPROC-0060::STEP-GOVERN_DOCUMENT_EVIDENCE`                 | `OUTSIDE_OPERATIONAL_CLASS` | `PRIMARY_ADMINISTRATIVE`       | `OUTSIDE_SUPERVISION_CLASS` | `SECONDARY_CONFIGURATION`     | `SECONDARY_AUDIT`          | `AUDIT_EVIDENCE_RECORD`            | La pantalla presenta un expediente documental o paquete de evidencia necesario para demostrar qué ocurrió y con qué soporte, pero su intención primaria continúa siendo operativa, administrativa, de supervisión, configuración, personal o de cliente. La auditoría queda acotada a evidencia, historia y drill-down sin habilitar mutación retroactiva.          |
| `VSCREEN-0116` | Registro de riesgos empresariales                     | `viso`     | `VPROC-0063::STEP-ASSESS_ENTERPRISE_RISK`                   | `OUTSIDE_OPERATIONAL_CLASS` | `PRIMARY_ADMINISTRATIVE`       | `SECONDARY_SUPERVISION`     | `OUTSIDE_CONFIGURATION_CLASS` | `OUTSIDE_AUDIT_CLASS`      | `NONE`                             | La intención dominante es administrar un caso o recurso vigente; la trazabilidad técnica obligatoria no convierte por sí sola la pantalla en superficie de auditoría.                                                                                                                                                                                               |
| `VSCREEN-0117` | Requerimientos de asesores y autoridades              | `viso`     | `VPROC-0064::STEP-MANAGE_EXTERNAL_REQUIREMENT`              | `OUTSIDE_OPERATIONAL_CLASS` | `PRIMARY_ADMINISTRATIVE`       | `SECONDARY_SUPERVISION`     | `OUTSIDE_CONFIGURATION_CLASS` | `SECONDARY_AUDIT`          | `AUDIT_EVIDENCE_RECORD`            | La pantalla presenta un expediente documental o paquete de evidencia necesario para demostrar qué ocurrió y con qué soporte, pero su intención primaria continúa siendo operativa, administrativa, de supervisión, configuración, personal o de cliente. La auditoría queda acotada a evidencia, historia y drill-down sin habilitar mutación retroactiva.          |
| `VSCREEN-0118` | Gestión de desempeño y desarrollo                     | `viso`     | `VPROC-0065::STEP-REVIEW_PERFORMANCE_AND_DEVELOPMENT`       | `OUTSIDE_OPERATIONAL_CLASS` | `PRIMARY_ADMINISTRATIVE`       | `SECONDARY_SUPERVISION`     | `OUTSIDE_CONFIGURATION_CLASS` | `OUTSIDE_AUDIT_CLASS`      | `NONE`                             | La intención dominante es administrar un caso o recurso vigente; la trazabilidad técnica obligatoria no convierte por sí sola la pantalla en superficie de auditoría.                                                                                                                                                                                               |
| `VSCREEN-0119` | Asignación y control de elementos de protección       | `viso`     | `VPROC-0066::STEP-ASSIGN_PROTECTIVE_EQUIPMENT`              | `SECONDARY_OPERATIONAL`     | `PRIMARY_ADMINISTRATIVE`       | `SECONDARY_SUPERVISION`     | `OUTSIDE_CONFIGURATION_CLASS` | `SECONDARY_AUDIT`          | `AUDIT_CUSTODY_CHAIN`              | La pantalla reconstruye tenencia, ubicación, entrega, recepción, devolución, condición o prueba de custodia física, pero su intención primaria continúa siendo operativa, administrativa, de supervisión, configuración, personal o de cliente. La auditoría queda acotada a evidencia, historia y drill-down sin habilitar mutación retroactiva.                   |
| `VSCREEN-0120` | Mesa de servicio tecnológico                          | `viso`     | `VPROC-0058::STEP-RESOLVE_TECH_SERVICE_CASE`                | `SECONDARY_OPERATIONAL`     | `PRIMARY_ADMINISTRATIVE`       | `SECONDARY_SUPERVISION`     | `OUTSIDE_CONFIGURATION_CLASS` | `SECONDARY_AUDIT`          | `AUDIT_CASE_CHRONOLOGY`            | La pantalla muestra la cronología material de un caso, comunicación, solicitud o compromiso con responsables y resultados, pero su intención primaria continúa siendo operativa, administrativa, de supervisión, configuración, personal o de cliente. La auditoría queda acotada a evidencia, historia y drill-down sin habilitar mutación retroactiva.            |
| `VSCREEN-0121` | Continuidad, contingencia y recuperación              | `viso`     | `VPROC-0062::STEP-ACTIVATE_AND_RECOVER_CONTINUITY`          | `SECONDARY_OPERATIONAL`     | `PRIMARY_ADMINISTRATIVE`       | `SECONDARY_SUPERVISION`     | `SECONDARY_CONFIGURATION`     | `SECONDARY_AUDIT`          | `AUDIT_CASE_CHRONOLOGY`            | La pantalla muestra la cronología material de un caso, comunicación, solicitud o compromiso con responsables y resultados, pero su intención primaria continúa siendo operativa, administrativa, de supervisión, configuración, personal o de cliente. La auditoría queda acotada a evidencia, historia y drill-down sin habilitar mutación retroactiva.            |
| `VSCREEN-0122` | Privacidad, cumplimiento y conservación               | `viso`     | `VPROC-0060::STEP-GOVERN_PRIVACY_AND_RETENTION`             | `OUTSIDE_OPERATIONAL_CLASS` | `PRIMARY_ADMINISTRATIVE`       | `SECONDARY_SUPERVISION`     | `SECONDARY_CONFIGURATION`     | `SECONDARY_AUDIT`          | `AUDIT_COMPLIANCE_CONTROL`         | La pantalla demuestra cumplimiento, conservación, obligación, vencimiento, hallazgo y tratamiento regulatorio, pero su intención primaria continúa siendo operativa, administrativa, de supervisión, configuración, personal o de cliente. La auditoría queda acotada a evidencia, historia y drill-down sin habilitar mutación retroactiva.                        |
| `VSCREEN-0123` | Gestión de comunicaciones internas                    | `viso`     | `VPROC-0004::STEP-PUBLISH_INTERNAL_COMMUNICATION`           | `OUTSIDE_OPERATIONAL_CLASS` | `PRIMARY_ADMINISTRATIVE`       | `OUTSIDE_SUPERVISION_CLASS` | `OUTSIDE_CONFIGURATION_CLASS` | `SECONDARY_AUDIT`          | `AUDIT_CASE_CHRONOLOGY`            | La pantalla muestra la cronología material de un caso, comunicación, solicitud o compromiso con responsables y resultados, pero su intención primaria continúa siendo operativa, administrativa, de supervisión, configuración, personal o de cliente. La auditoría queda acotada a evidencia, historia y drill-down sin habilitar mutación retroactiva.            |
| `VSCREEN-0124` | Mis comunicados laborales                             | `anima`    | `VPROC-0004::STEP-CONSULT_AND_ACKNOWLEDGE_COMMUNICATION`    | `OUTSIDE_OPERATIONAL_CLASS` | `OUTSIDE_ADMINISTRATIVE_CLASS` | `OUTSIDE_SUPERVISION_CLASS` | `OUTSIDE_CONFIGURATION_CLASS` | `SECONDARY_AUDIT`          | `AUDIT_CASE_CHRONOLOGY`            | La pantalla muestra la cronología material de un caso, comunicación, solicitud o compromiso con responsables y resultados, pero su intención primaria continúa siendo operativa, administrativa, de supervisión, configuración, personal o de cliente. La auditoría queda acotada a evidencia, historia y drill-down sin habilitar mutación retroactiva.            |
| `VSCREEN-0125` | Mi carnet laboral                                     | `anima`    | `VPROC-0006::STEP-PRESENT_EMPLOYEE_CREDENTIAL`              | `OUTSIDE_OPERATIONAL_CLASS` | `OUTSIDE_ADMINISTRATIVE_CLASS` | `OUTSIDE_SUPERVISION_CLASS` | `OUTSIDE_CONFIGURATION_CLASS` | `OUTSIDE_AUDIT_CLASS`      | `NONE`                             | La superficie pertenece al canal personal del trabajador y no presenta historia o evidencia material suficiente bajo este contrato; su clase primaria se resolverá en PROC-SCREEN-010.                                                                                                                                                                              |
| `VSCREEN-0126` | Mis documentos laborales                              | `anima`    | `VPROC-0060::STEP-CONSULT_OR_SUBMIT_EMPLOYMENT_DOCUMENT`    | `OUTSIDE_OPERATIONAL_CLASS` | `OUTSIDE_ADMINISTRATIVE_CLASS` | `OUTSIDE_SUPERVISION_CLASS` | `OUTSIDE_CONFIGURATION_CLASS` | `SECONDARY_AUDIT`          | `AUDIT_EVIDENCE_RECORD`            | La pantalla presenta un expediente documental o paquete de evidencia necesario para demostrar qué ocurrió y con qué soporte, pero su intención primaria continúa siendo operativa, administrativa, de supervisión, configuración, personal o de cliente. La auditoría queda acotada a evidencia, historia y drill-down sin habilitar mutación retroactiva.          |
| `VSCREEN-0127` | Mi capacitación                                       | `anima`    | `VPROC-0065::STEP-COMPLETE_ASSIGNED_TRAINING`               | `OUTSIDE_OPERATIONAL_CLASS` | `OUTSIDE_ADMINISTRATIVE_CLASS` | `OUTSIDE_SUPERVISION_CLASS` | `OUTSIDE_CONFIGURATION_CLASS` | `SECONDARY_AUDIT`          | `AUDIT_EVIDENCE_RECORD`            | La pantalla presenta un expediente documental o paquete de evidencia necesario para demostrar qué ocurrió y con qué soporte, pero su intención primaria continúa siendo operativa, administrativa, de supervisión, configuración, personal o de cliente. La auditoría queda acotada a evidencia, historia y drill-down sin habilitar mutación retroactiva.          |
| `VSCREEN-0128` | Mis objetivos y retroalimentación                     | `anima`    | `VPROC-0065::STEP-REVIEW_PERSONAL_OBJECTIVES`               | `OUTSIDE_OPERATIONAL_CLASS` | `OUTSIDE_ADMINISTRATIVE_CLASS` | `OUTSIDE_SUPERVISION_CLASS` | `OUTSIDE_CONFIGURATION_CLASS` | `SECONDARY_AUDIT`          | `AUDIT_CASE_CHRONOLOGY`            | La pantalla muestra la cronología material de un caso, comunicación, solicitud o compromiso con responsables y resultados, pero su intención primaria continúa siendo operativa, administrativa, de supervisión, configuración, personal o de cliente. La auditoría queda acotada a evidencia, historia y drill-down sin habilitar mutación retroactiva.            |
| `VSCREEN-0129` | Mis solicitudes de soporte                            | `anima`    | `VPROC-0058::STEP-SUBMIT_AND_TRACK_SUPPORT_REQUEST`         | `SECONDARY_OPERATIONAL`     | `OUTSIDE_ADMINISTRATIVE_CLASS` | `OUTSIDE_SUPERVISION_CLASS` | `OUTSIDE_CONFIGURATION_CLASS` | `SECONDARY_AUDIT`          | `AUDIT_CASE_CHRONOLOGY`            | La pantalla muestra la cronología material de un caso, comunicación, solicitud o compromiso con responsables y resultados, pero su intención primaria continúa siendo operativa, administrativa, de supervisión, configuración, personal o de cliente. La auditoría queda acotada a evidencia, historia y drill-down sin habilitar mutación retroactiva.            |
| `VSCREEN-0130` | Mis reportes de seguridad y salud                     | `anima`    | `VPROC-0013::STEP-REPORT_SST_EVENT`                         | `SECONDARY_OPERATIONAL`     | `OUTSIDE_ADMINISTRATIVE_CLASS` | `OUTSIDE_SUPERVISION_CLASS` | `OUTSIDE_CONFIGURATION_CLASS` | `SECONDARY_AUDIT`          | `AUDIT_EVIDENCE_RECORD`            | La pantalla presenta un expediente documental o paquete de evidencia necesario para demostrar qué ocurrió y con qué soporte, pero su intención primaria continúa siendo operativa, administrativa, de supervisión, configuración, personal o de cliente. La auditoría queda acotada a evidencia, historia y drill-down sin habilitar mutación retroactiva.          |
| `VSCREEN-0131` | Mis elementos de protección                           | `anima`    | `VPROC-0066::STEP-ACKNOWLEDGE_PROTECTIVE_EQUIPMENT`         | `SECONDARY_OPERATIONAL`     | `OUTSIDE_ADMINISTRATIVE_CLASS` | `OUTSIDE_SUPERVISION_CLASS` | `OUTSIDE_CONFIGURATION_CLASS` | `SECONDARY_AUDIT`          | `AUDIT_CUSTODY_CHAIN`              | La pantalla reconstruye tenencia, ubicación, entrega, recepción, devolución, condición o prueba de custodia física, pero su intención primaria continúa siendo operativa, administrativa, de supervisión, configuración, personal o de cliente. La auditoría queda acotada a evidencia, historia y drill-down sin habilitar mutación retroactiva.                   |
| `VSCREEN-0132` | Reservas de inventario                                | `nexo`     | `VPROC-0028::STEP-RESERVE_STOCK`                            | `PRIMARY_OPERATIONAL`       | `OUTSIDE_ADMINISTRATIVE_CLASS` | `OUTSIDE_SUPERVISION_CLASS` | `OUTSIDE_CONFIGURATION_CLASS` | `OUTSIDE_AUDIT_CLASS`      | `NONE`                             | La intención dominante es ejecutar trabajo vivo y la pantalla no incorpora una superficie material de historia, evidencia o investigación independiente.                                                                                                                                                                                                            |
| `VSCREEN-0133` | Planes y órdenes de mantenimiento de activos          | `nexo`     | `VPROC-0030::STEP-PLAN_AND_EXECUTE_ASSET_MAINTENANCE`       | `PRIMARY_OPERATIONAL`       | `SECONDARY_ADMINISTRATIVE`     | `SECONDARY_SUPERVISION`     | `SECONDARY_CONFIGURATION`     | `OUTSIDE_AUDIT_CLASS`      | `NONE`                             | La intención dominante es ejecutar trabajo vivo y la pantalla no incorpora una superficie material de historia, evidencia o investigación independiente.                                                                                                                                                                                                            |
| `VSCREEN-0134` | Garantías, seguros y reclamaciones de activos         | `nexo`     | `VPROC-0030::STEP-MANAGE_ASSET_CLAIM`                       | `OUTSIDE_OPERATIONAL_CLASS` | `PRIMARY_ADMINISTRATIVE`       | `SECONDARY_SUPERVISION`     | `OUTSIDE_CONFIGURATION_CLASS` | `SECONDARY_AUDIT`          | `AUDIT_EVIDENCE_RECORD`            | La pantalla presenta un expediente documental o paquete de evidencia necesario para demostrar qué ocurrió y con qué soporte, pero su intención primaria continúa siendo operativa, administrativa, de supervisión, configuración, personal o de cliente. La auditoría queda acotada a evidencia, historia y drill-down sin habilitar mutación retroactiva.          |
| `VSCREEN-0135` | Instancias y operación de kits                        | `nexo`     | `VPROC-0067::STEP-ASSEMBLE_AND_CONTROL_KIT`                 | `PRIMARY_OPERATIONAL`       | `OUTSIDE_ADMINISTRATIVE_CLASS` | `OUTSIDE_SUPERVISION_CLASS` | `OUTSIDE_CONFIGURATION_CLASS` | `SECONDARY_AUDIT`          | `AUDIT_CUSTODY_CHAIN`              | La pantalla reconstruye tenencia, ubicación, entrega, recepción, devolución, condición o prueba de custodia física, pero su intención primaria continúa siendo operativa, administrativa, de supervisión, configuración, personal o de cliente. La auditoría queda acotada a evidencia, historia y drill-down sin habilitar mutación retroactiva.                   |
| `VSCREEN-0136` | Flota y vehículos                                     | `nexo`     | `VPROC-0031::STEP-MANAGE_FLEET_ASSET`                       | `SECONDARY_OPERATIONAL`     | `PRIMARY_ADMINISTRATIVE`       | `SECONDARY_SUPERVISION`     | `SECONDARY_CONFIGURATION`     | `SECONDARY_AUDIT`          | `AUDIT_CUSTODY_CHAIN`              | La pantalla reconstruye tenencia, ubicación, entrega, recepción, devolución, condición o prueba de custodia física, pero su intención primaria continúa siendo operativa, administrativa, de supervisión, configuración, personal o de cliente. La auditoría queda acotada a evidencia, historia y drill-down sin habilitar mutación retroactiva.                   |
| `VSCREEN-0137` | Kilometraje y combustible                             | `nexo`     | `VPROC-0031::STEP-CAPTURE_MILEAGE_AND_FUEL`                 | `PRIMARY_OPERATIONAL`       | `OUTSIDE_ADMINISTRATIVE_CLASS` | `OUTSIDE_SUPERVISION_CLASS` | `OUTSIDE_CONFIGURATION_CLASS` | `OUTSIDE_AUDIT_CLASS`      | `NONE`                             | La intención dominante es ejecutar trabajo vivo y la pantalla no incorpora una superficie material de historia, evidencia o investigación independiente.                                                                                                                                                                                                            |
| `VSCREEN-0138` | Planeación de rutas y despachos                       | `nexo`     | `VPROC-0048::STEP-PLAN_ROUTE_AND_DISPATCH`                  | `PRIMARY_OPERATIONAL`       | `OUTSIDE_ADMINISTRATIVE_CLASS` | `SECONDARY_SUPERVISION`     | `OUTSIDE_CONFIGURATION_CLASS` | `OUTSIDE_AUDIT_CLASS`      | `NONE`                             | La intención dominante es ejecutar trabajo vivo y la pantalla no incorpora una superficie material de historia, evidencia o investigación independiente.                                                                                                                                                                                                            |
| `VSCREEN-0139` | Ejecución de ruta y prueba de entrega                 | `nexo`     | `VPROC-0049::STEP-EXECUTE_ROUTE_AND_PROVE_DELIVERY`         | `PRIMARY_OPERATIONAL`       | `OUTSIDE_ADMINISTRATIVE_CLASS` | `SECONDARY_SUPERVISION`     | `OUTSIDE_CONFIGURATION_CLASS` | `SECONDARY_AUDIT`          | `AUDIT_CUSTODY_CHAIN`              | La pantalla reconstruye tenencia, ubicación, entrega, recepción, devolución, condición o prueba de custodia física, pero su intención primaria continúa siendo operativa, administrativa, de supervisión, configuración, personal o de cliente. La auditoría queda acotada a evidencia, historia y drill-down sin habilitar mutación retroactiva.                   |
| `VSCREEN-0140` | Novedades, rechazos y retornos logísticos             | `nexo`     | `VPROC-0049::STEP-RESOLVE_LOGISTICS_EXCEPTION`              | `PRIMARY_OPERATIONAL`       | `OUTSIDE_ADMINISTRATIVE_CLASS` | `SECONDARY_SUPERVISION`     | `OUTSIDE_CONFIGURATION_CLASS` | `SECONDARY_AUDIT`          | `AUDIT_CUSTODY_CHAIN`              | La pantalla reconstruye tenencia, ubicación, entrega, recepción, devolución, condición o prueba de custodia física, pero su intención primaria continúa siendo operativa, administrativa, de supervisión, configuración, personal o de cliente. La auditoría queda acotada a evidencia, historia y drill-down sin habilitar mutación retroactiva.                   |
| `VSCREEN-0141` | Instalaciones, servicios y mantenimiento locativo     | `nexo`     | `VPROC-0055::STEP-MANAGE_FACILITY_SERVICE`                  | `PRIMARY_OPERATIONAL`       | `SECONDARY_ADMINISTRATIVE`     | `SECONDARY_SUPERVISION`     | `SECONDARY_CONFIGURATION`     | `SECONDARY_AUDIT`          | `AUDIT_CUSTODY_CHAIN`              | La pantalla reconstruye tenencia, ubicación, entrega, recepción, devolución, condición o prueba de custodia física, pero su intención primaria continúa siendo operativa, administrativa, de supervisión, configuración, personal o de cliente. La auditoría queda acotada a evidencia, historia y drill-down sin habilitar mutación retroactiva.                   |
| `VSCREEN-0142` | Configuración de políticas y rutas logísticas         | `nexo`     | `VPROC-0048::STEP-CONFIGURE_LOGISTICS_POLICY`               | `OUTSIDE_OPERATIONAL_CLASS` | `SECONDARY_ADMINISTRATIVE`     | `OUTSIDE_SUPERVISION_CLASS` | `PRIMARY_CONFIGURATION`       | `SECONDARY_AUDIT`          | `AUDIT_CHANGE_HISTORY`             | La pantalla permite comparar versiones, vigencias, autores, aprobaciones y publicaciones de una definición reutilizable, pero su intención primaria continúa siendo operativa, administrativa, de supervisión, configuración, personal o de cliente. La auditoría queda acotada a evidencia, historia y drill-down sin habilitar mutación retroactiva.              |
| `VSCREEN-0143` | Diseñador de etiquetas logísticas                     | `nexo`     | `VPROC-0015::STEP-AUTHOR_LOGISTICS_LABEL_TEMPLATE`          | `OUTSIDE_OPERATIONAL_CLASS` | `SECONDARY_ADMINISTRATIVE`     | `OUTSIDE_SUPERVISION_CLASS` | `PRIMARY_CONFIGURATION`       | `SECONDARY_AUDIT`          | `AUDIT_CHANGE_HISTORY`             | La pantalla permite comparar versiones, vigencias, autores, aprobaciones y publicaciones de una definición reutilizable, pero su intención primaria continúa siendo operativa, administrativa, de supervisión, configuración, personal o de cliente. La auditoría queda acotada a evidencia, historia y drill-down sin habilitar mutación retroactiva.              |
| `VSCREEN-0144` | Cola y trabajos de impresión logística                | `nexo`     | `VPROC-0024::STEP-OPERATE_PRINT_QUEUE`                      | `PRIMARY_OPERATIONAL`       | `SECONDARY_ADMINISTRATIVE`     | `OUTSIDE_SUPERVISION_CLASS` | `OUTSIDE_CONFIGURATION_CLASS` | `SECONDARY_AUDIT`          | `AUDIT_CUSTODY_CHAIN`              | La pantalla reconstruye tenencia, ubicación, entrega, recepción, devolución, condición o prueba de custodia física, pero su intención primaria continúa siendo operativa, administrativa, de supervisión, configuración, personal o de cliente. La auditoría queda acotada a evidencia, historia y drill-down sin habilitar mutación retroactiva.                   |
| `VSCREEN-0145` | Contratos, precios y condiciones de proveedor         | `origo`    | `VPROC-0020::STEP-GOVERN_SUPPLIER_TERMS`                    | `OUTSIDE_OPERATIONAL_CLASS` | `PRIMARY_ADMINISTRATIVE`       | `OUTSIDE_SUPERVISION_CLASS` | `SECONDARY_CONFIGURATION`     | `SECONDARY_AUDIT`          | `AUDIT_CHANGE_HISTORY`             | La pantalla permite comparar versiones, vigencias, autores, aprobaciones y publicaciones de una definición reutilizable, pero su intención primaria continúa siendo operativa, administrativa, de supervisión, configuración, personal o de cliente. La auditoría queda acotada a evidencia, historia y drill-down sin habilitar mutación retroactiva.              |
| `VSCREEN-0146` | Desempeño y reclamaciones de proveedor                | `origo`    | `VPROC-0020::STEP-REVIEW_SUPPLIER_PERFORMANCE`              | `OUTSIDE_OPERATIONAL_CLASS` | `PRIMARY_ADMINISTRATIVE`       | `SECONDARY_SUPERVISION`     | `OUTSIDE_CONFIGURATION_CLASS` | `SECONDARY_AUDIT`          | `AUDIT_DECISION_RECORD`            | La pantalla conserva evidencia, autoridad, razón, versión y resultado de una revisión, aprobación, corrección o decisión, pero su intención primaria continúa siendo operativa, administrativa, de supervisión, configuración, personal o de cliente. La auditoría queda acotada a evidencia, historia y drill-down sin habilitar mutación retroactiva.             |
| `VSCREEN-0147` | Oportunidades y cotizaciones de catering o B2B        | `pulso`    | `VPROC-0041::STEP-QUALIFY_B2B_OPPORTUNITY`                  | `OUTSIDE_OPERATIONAL_CLASS` | `PRIMARY_ADMINISTRATIVE`       | `OUTSIDE_SUPERVISION_CLASS` | `OUTSIDE_CONFIGURATION_CLASS` | `SECONDARY_AUDIT`          | `AUDIT_CASE_CHRONOLOGY`            | La pantalla muestra la cronología material de un caso, comunicación, solicitud o compromiso con responsables y resultados, pero su intención primaria continúa siendo operativa, administrativa, de supervisión, configuración, personal o de cliente. La auditoría queda acotada a evidencia, historia y drill-down sin habilitar mutación retroactiva.            |
| `VSCREEN-0148` | Ejecución de catering o venta B2B                     | `pulso`    | `VPROC-0041::STEP-EXECUTE_B2B_COMMITMENT`                   | `PRIMARY_OPERATIONAL`       | `SECONDARY_ADMINISTRATIVE`     | `SECONDARY_SUPERVISION`     | `OUTSIDE_CONFIGURATION_CLASS` | `SECONDARY_AUDIT`          | `AUDIT_CASE_CHRONOLOGY`            | La pantalla muestra la cronología material de un caso, comunicación, solicitud o compromiso con responsables y resultados, pero su intención primaria continúa siendo operativa, administrativa, de supervisión, configuración, personal o de cliente. La auditoría queda acotada a evidencia, historia y drill-down sin habilitar mutación retroactiva.            |
| `VSCREEN-0149` | Operación de reservas y eventos                       | `pulso`    | `VPROC-0047::STEP-MANAGE_RESERVATION_OR_EVENT`              | `PRIMARY_OPERATIONAL`       | `SECONDARY_ADMINISTRATIVE`     | `SECONDARY_SUPERVISION`     | `OUTSIDE_CONFIGURATION_CLASS` | `SECONDARY_AUDIT`          | `AUDIT_CASE_CHRONOLOGY`            | La pantalla muestra la cronología material de un caso, comunicación, solicitud o compromiso con responsables y resultados, pero su intención primaria continúa siendo operativa, administrativa, de supervisión, configuración, personal o de cliente. La auditoría queda acotada a evidencia, historia y drill-down sin habilitar mutación retroactiva.            |
| `VSCREEN-0150` | Casos de reclamo y compensación                       | `pulso`    | `VPROC-0046::STEP-RESOLVE_CUSTOMER_CLAIM`                   | `PRIMARY_OPERATIONAL`       | `SECONDARY_ADMINISTRATIVE`     | `SECONDARY_SUPERVISION`     | `OUTSIDE_CONFIGURATION_CLASS` | `SECONDARY_AUDIT`          | `AUDIT_DECISION_RECORD`            | La pantalla conserva evidencia, autoridad, razón, versión y resultado de una revisión, aprobación, corrección o decisión, pero su intención primaria continúa siendo operativa, administrativa, de supervisión, configuración, personal o de cliente. La auditoría queda acotada a evidencia, historia y drill-down sin habilitar mutación retroactiva.             |
| `VSCREEN-0151` | Coordinación de entrega mediante tercero              | `pulso`    | `VPROC-0050::STEP-COORDINATE_THIRD_PARTY_DELIVERY`          | `PRIMARY_OPERATIONAL`       | `SECONDARY_ADMINISTRATIVE`     | `SECONDARY_SUPERVISION`     | `OUTSIDE_CONFIGURATION_CLASS` | `SECONDARY_AUDIT`          | `AUDIT_CUSTODY_CHAIN`              | La pantalla reconstruye tenencia, ubicación, entrega, recepción, devolución, condición o prueba de custodia física, pero su intención primaria continúa siendo operativa, administrativa, de supervisión, configuración, personal o de cliente. La auditoría queda acotada a evidencia, historia y drill-down sin habilitar mutación retroactiva.                   |
| `VSCREEN-0152` | Análisis de satisfacción y servicio                   | `pulso`    | `VPROC-0068::STEP-ANALYZE_SERVICE_SATISFACTION`             | `OUTSIDE_OPERATIONAL_CLASS` | `SECONDARY_ADMINISTRATIVE`     | `PRIMARY_SUPERVISION`       | `OUTSIDE_CONFIGURATION_CLASS` | `OUTSIDE_AUDIT_CLASS`      | `NONE`                             | La intención dominante es supervisar situación actual, carga o desvíos; no reconstruir hechos históricos como propósito material.                                                                                                                                                                                                                                   |
| `VSCREEN-0153` | Paquete laboral para pagos y beneficios               | `numera`   | `VPROC-0010::STEP-PREPARE_LABOR_PAYMENT_PACKAGE`            | `OUTSIDE_OPERATIONAL_CLASS` | `PRIMARY_ADMINISTRATIVE`       | `OUTSIDE_SUPERVISION_CLASS` | `OUTSIDE_CONFIGURATION_CLASS` | `SECONDARY_AUDIT`          | `AUDIT_EVIDENCE_RECORD`            | La pantalla presenta un expediente documental o paquete de evidencia necesario para demostrar qué ocurrió y con qué soporte, pero su intención primaria continúa siendo operativa, administrativa, de supervisión, configuración, personal o de cliente. La auditoría queda acotada a evidencia, historia y drill-down sin habilitar mutación retroactiva.          |
| `VSCREEN-0154` | Facturas y documentos fiscales                        | `numera`   | `VPROC-0051::STEP-MANAGE_FISCAL_DOCUMENT`                   | `OUTSIDE_OPERATIONAL_CLASS` | `PRIMARY_ADMINISTRATIVE`       | `OUTSIDE_SUPERVISION_CLASS` | `OUTSIDE_CONFIGURATION_CLASS` | `SECONDARY_AUDIT`          | `AUDIT_EVIDENCE_RECORD`            | La pantalla presenta un expediente documental o paquete de evidencia necesario para demostrar qué ocurrió y con qué soporte, pero su intención primaria continúa siendo operativa, administrativa, de supervisión, configuración, personal o de cliente. La auditoría queda acotada a evidencia, historia y drill-down sin habilitar mutación retroactiva.          |
| `VSCREEN-0155` | Tesorería y programación de pagos                     | `numera`   | `VPROC-0052::STEP-PLAN_AND_EXECUTE_PAYMENTS`                | `OUTSIDE_OPERATIONAL_CLASS` | `PRIMARY_ADMINISTRATIVE`       | `SECONDARY_SUPERVISION`     | `OUTSIDE_CONFIGURATION_CLASS` | `SECONDARY_AUDIT`          | `AUDIT_TRANSACTION_LEDGER`         | La pantalla presenta movimientos, receipts, reversiones o efectos económicos/comerciales como secuencia verificable, pero su intención primaria continúa siendo operativa, administrativa, de supervisión, configuración, personal o de cliente. La auditoría queda acotada a evidencia, historia y drill-down sin habilitar mutación retroactiva.                  |
| `VSCREEN-0156` | Presupuestos, escenarios y forecast                   | `numera`   | `VPROC-0069::STEP-PLAN_BUDGET_AND_FORECAST`                 | `OUTSIDE_OPERATIONAL_CLASS` | `PRIMARY_ADMINISTRATIVE`       | `SECONDARY_SUPERVISION`     | `OUTSIDE_CONFIGURATION_CLASS` | `SECONDARY_AUDIT`          | `AUDIT_CHANGE_HISTORY`             | La pantalla permite comparar versiones, vigencias, autores, aprobaciones y publicaciones de una definición reutilizable, pero su intención primaria continúa siendo operativa, administrativa, de supervisión, configuración, personal o de cliente. La auditoría queda acotada a evidencia, historia y drill-down sin habilitar mutación retroactiva.              |
| `VSCREEN-0157` | Impuestos y obligaciones de cumplimiento              | `numera`   | `VPROC-0052::STEP-MANAGE_TAX_OBLIGATION`                    | `OUTSIDE_OPERATIONAL_CLASS` | `PRIMARY_ADMINISTRATIVE`       | `SECONDARY_SUPERVISION`     | `SECONDARY_CONFIGURATION`     | `SECONDARY_AUDIT`          | `AUDIT_COMPLIANCE_CONTROL`         | La pantalla demuestra cumplimiento, conservación, obligación, vencimiento, hallazgo y tratamiento regulatorio, pero su intención primaria continúa siendo operativa, administrativa, de supervisión, configuración, personal o de cliente. La auditoría queda acotada a evidencia, historia y drill-down sin habilitar mutación retroactiva.                        |
| `VSCREEN-0158` | Distribución y asignación de costos                   | `numera`   | `VPROC-0054::STEP-ALLOCATE_COSTS`                           | `OUTSIDE_OPERATIONAL_CLASS` | `PRIMARY_ADMINISTRATIVE`       | `OUTSIDE_SUPERVISION_CLASS` | `SECONDARY_CONFIGURATION`     | `SECONDARY_AUDIT`          | `AUDIT_CHANGE_HISTORY`             | La pantalla permite comparar versiones, vigencias, autores, aprobaciones y publicaciones de una definición reutilizable, pero su intención primaria continúa siendo operativa, administrativa, de supervisión, configuración, personal o de cliente. La auditoría queda acotada a evidencia, historia y drill-down sin habilitar mutación retroactiva.              |
| `VSCREEN-0159` | Indicadores, análisis y planes de mejora              | `numera`   | `VPROC-0061::STEP-ANALYZE_AND_PLAN_IMPROVEMENT`             | `OUTSIDE_OPERATIONAL_CLASS` | `SECONDARY_ADMINISTRATIVE`     | `PRIMARY_SUPERVISION`       | `OUTSIDE_CONFIGURATION_CLASS` | `OUTSIDE_AUDIT_CLASS`      | `NONE`                             | La intención dominante es supervisar situación actual, carga o desvíos; no reconstruir hechos históricos como propósito material.                                                                                                                                                                                                                                   |
| `VSCREEN-0160` | Inicio y selección del portal de compras              | `pass`     | `VPROC-0039::STEP-ENTER_CUSTOMER_COMMERCE`                  | `OUTSIDE_OPERATIONAL_CLASS` | `OUTSIDE_ADMINISTRATIVE_CLASS` | `OUTSIDE_SUPERVISION_CLASS` | `OUTSIDE_CONFIGURATION_CLASS` | `OUTSIDE_AUDIT_CLASS`      | `NONE`                             | La superficie pertenece al canal de cliente y no presenta historia o evidencia material suficiente bajo este contrato; su clase primaria se resolverá en PROC-SCREEN-011.                                                                                                                                                                                           |
| `VSCREEN-0161` | Menú y catálogo comercial del cliente                 | `pass`     | `VPROC-0017::STEP-BROWSE_COMMERCIAL_OFFER`                  | `OUTSIDE_OPERATIONAL_CLASS` | `OUTSIDE_ADMINISTRATIVE_CLASS` | `OUTSIDE_SUPERVISION_CLASS` | `OUTSIDE_CONFIGURATION_CLASS` | `OUTSIDE_AUDIT_CLASS`      | `NONE`                             | La superficie pertenece al canal de cliente y no presenta historia o evidencia material suficiente bajo este contrato; su clase primaria se resolverá en PROC-SCREEN-011.                                                                                                                                                                                           |
| `VSCREEN-0162` | Carrito y configuración del pedido                    | `pass`     | `VPROC-0039::STEP-CONFIGURE_CART`                           | `OUTSIDE_OPERATIONAL_CLASS` | `OUTSIDE_ADMINISTRATIVE_CLASS` | `OUTSIDE_SUPERVISION_CLASS` | `OUTSIDE_CONFIGURATION_CLASS` | `OUTSIDE_AUDIT_CLASS`      | `NONE`                             | La superficie pertenece al canal de cliente y no presenta historia o evidencia material suficiente bajo este contrato; su clase primaria se resolverá en PROC-SCREEN-011.                                                                                                                                                                                           |
| `VSCREEN-0163` | Dirección, modalidad y programación de entrega        | `pass`     | `VPROC-0050::STEP-SELECT_FULFILLMENT`                       | `OUTSIDE_OPERATIONAL_CLASS` | `OUTSIDE_ADMINISTRATIVE_CLASS` | `OUTSIDE_SUPERVISION_CLASS` | `OUTSIDE_CONFIGURATION_CLASS` | `OUTSIDE_AUDIT_CLASS`      | `NONE`                             | La superficie pertenece al canal de cliente y no presenta historia o evidencia material suficiente bajo este contrato; su clase primaria se resolverá en PROC-SCREEN-011.                                                                                                                                                                                           |
| `VSCREEN-0164` | Revisión, checkout e inicio de pago                   | `pass`     | `VPROC-0043::STEP-REVIEW_AND_START_PAYMENT`                 | `OUTSIDE_OPERATIONAL_CLASS` | `OUTSIDE_ADMINISTRATIVE_CLASS` | `OUTSIDE_SUPERVISION_CLASS` | `OUTSIDE_CONFIGURATION_CLASS` | `OUTSIDE_AUDIT_CLASS`      | `NONE`                             | La superficie pertenece al canal de cliente y no presenta historia o evidencia material suficiente bajo este contrato; su clase primaria se resolverá en PROC-SCREEN-011.                                                                                                                                                                                           |
| `VSCREEN-0165` | Confirmación de pedido y retorno de pago              | `pass`     | `VPROC-0043::STEP-PRESENT_ORDER_RECEIPT`                    | `OUTSIDE_OPERATIONAL_CLASS` | `OUTSIDE_ADMINISTRATIVE_CLASS` | `OUTSIDE_SUPERVISION_CLASS` | `OUTSIDE_CONFIGURATION_CLASS` | `SECONDARY_AUDIT`          | `AUDIT_TRANSACTION_LEDGER`         | La pantalla presenta movimientos, receipts, reversiones o efectos económicos/comerciales como secuencia verificable, pero su intención primaria continúa siendo operativa, administrativa, de supervisión, configuración, personal o de cliente. La auditoría queda acotada a evidencia, historia y drill-down sin habilitar mutación retroactiva.                  |
| `VSCREEN-0166` | Mis pedidos y detalle                                 | `pass`     | `VPROC-0039::STEP-CONSULT_PERSONAL_ORDERS`                  | `OUTSIDE_OPERATIONAL_CLASS` | `OUTSIDE_ADMINISTRATIVE_CLASS` | `OUTSIDE_SUPERVISION_CLASS` | `OUTSIDE_CONFIGURATION_CLASS` | `SECONDARY_AUDIT`          | `AUDIT_TRANSACTION_LEDGER`         | La pantalla presenta movimientos, receipts, reversiones o efectos económicos/comerciales como secuencia verificable, pero su intención primaria continúa siendo operativa, administrativa, de supervisión, configuración, personal o de cliente. La auditoría queda acotada a evidencia, historia y drill-down sin habilitar mutación retroactiva.                  |
| `VSCREEN-0167` | Seguimiento de preparación y entrega del cliente      | `pass`     | `VPROC-0050::STEP-TRACK_PERSONAL_FULFILLMENT`               | `OUTSIDE_OPERATIONAL_CLASS` | `OUTSIDE_ADMINISTRATIVE_CLASS` | `OUTSIDE_SUPERVISION_CLASS` | `OUTSIDE_CONFIGURATION_CLASS` | `SECONDARY_AUDIT`          | `AUDIT_CASE_CHRONOLOGY`            | La pantalla muestra la cronología material de un caso, comunicación, solicitud o compromiso con responsables y resultados, pero su intención primaria continúa siendo operativa, administrativa, de supervisión, configuración, personal o de cliente. La auditoría queda acotada a evidencia, historia y drill-down sin habilitar mutación retroactiva.            |
| `VSCREEN-0168` | Chat y comunicación asociada al pedido                | `pass`     | `VPROC-0047::STEP-COMMUNICATE_ABOUT_ORDER`                  | `OUTSIDE_OPERATIONAL_CLASS` | `OUTSIDE_ADMINISTRATIVE_CLASS` | `OUTSIDE_SUPERVISION_CLASS` | `OUTSIDE_CONFIGURATION_CLASS` | `SECONDARY_AUDIT`          | `AUDIT_CASE_CHRONOLOGY`            | La pantalla muestra la cronología material de un caso, comunicación, solicitud o compromiso con responsables y resultados, pero su intención primaria continúa siendo operativa, administrativa, de supervisión, configuración, personal o de cliente. La auditoría queda acotada a evidencia, historia y drill-down sin habilitar mutación retroactiva.            |
| `VSCREEN-0169` | Mis reclamos y casos de servicio                      | `pass`     | `VPROC-0046::STEP-SUBMIT_AND_TRACK_CLAIM`                   | `OUTSIDE_OPERATIONAL_CLASS` | `OUTSIDE_ADMINISTRATIVE_CLASS` | `OUTSIDE_SUPERVISION_CLASS` | `OUTSIDE_CONFIGURATION_CLASS` | `SECONDARY_AUDIT`          | `AUDIT_CASE_CHRONOLOGY`            | La pantalla muestra la cronología material de un caso, comunicación, solicitud o compromiso con responsables y resultados, pero su intención primaria continúa siendo operativa, administrativa, de supervisión, configuración, personal o de cliente. La auditoría queda acotada a evidencia, historia y drill-down sin habilitar mutación retroactiva.            |
| `VSCREEN-0170` | Mis reservas y eventos                                | `pass`     | `VPROC-0047::STEP-MANAGE_PERSONAL_RESERVATION`              | `OUTSIDE_OPERATIONAL_CLASS` | `OUTSIDE_ADMINISTRATIVE_CLASS` | `OUTSIDE_SUPERVISION_CLASS` | `OUTSIDE_CONFIGURATION_CLASS` | `SECONDARY_AUDIT`          | `AUDIT_CASE_CHRONOLOGY`            | La pantalla muestra la cronología material de un caso, comunicación, solicitud o compromiso con responsables y resultados, pero su intención primaria continúa siendo operativa, administrativa, de supervisión, configuración, personal o de cliente. La auditoría queda acotada a evidencia, historia y drill-down sin habilitar mutación retroactiva.            |
| `VSCREEN-0171` | Calificación y satisfacción                           | `pass`     | `VPROC-0068::STEP-SUBMIT_SATISFACTION_RATING`               | `OUTSIDE_OPERATIONAL_CLASS` | `OUTSIDE_ADMINISTRATIVE_CLASS` | `OUTSIDE_SUPERVISION_CLASS` | `OUTSIDE_CONFIGURATION_CLASS` | `OUTSIDE_AUDIT_CLASS`      | `NONE`                             | La superficie pertenece al canal de cliente y no presenta historia o evidencia material suficiente bajo este contrato; su clase primaria se resolverá en PROC-SCREEN-011.                                                                                                                                                                                           |
| `VSCREEN-0172` | Comunicaciones y notificaciones del cliente           | `pass`     | `VPROC-0047::STEP-CONSULT_CUSTOMER_COMMUNICATION`           | `OUTSIDE_OPERATIONAL_CLASS` | `OUTSIDE_ADMINISTRATIVE_CLASS` | `OUTSIDE_SUPERVISION_CLASS` | `OUTSIDE_CONFIGURATION_CLASS` | `SECONDARY_AUDIT`          | `AUDIT_CASE_CHRONOLOGY`            | La pantalla muestra la cronología material de un caso, comunicación, solicitud o compromiso con responsables y resultados, pero su intención primaria continúa siendo operativa, administrativa, de supervisión, configuración, personal o de cliente. La auditoría queda acotada a evidencia, historia y drill-down sin habilitar mutación retroactiva.            |
| `VSCREEN-0173` | Trazabilidad e investigación de lote                  | `fogo`     | `VPROC-0035::STEP-INVESTIGATE_BATCH_TRACEABILITY`           | `OUTSIDE_OPERATIONAL_CLASS` | `SECONDARY_ADMINISTRATIVE`     | `OUTSIDE_SUPERVISION_CLASS` | `OUTSIDE_CONFIGURATION_CLASS` | `PRIMARY_AUDIT`            | `AUDIT_TRACEABILITY_INVESTIGATION` | La intención dominante reconstruye genealogía, consumos, resultados, controles, decisiones y custodia de un lote para investigación. La pantalla existe para reconstruir, verificar o publicar evidencia histórica sin convertirse en la fuente mutable del hecho original.                                                                                         |
| `VSCREEN-0174` | Controles operativos de inocuidad                     | `fogo`     | `VPROC-0014::STEP-EXECUTE_FOOD_SAFETY_CONTROL`              | `PRIMARY_OPERATIONAL`       | `SECONDARY_ADMINISTRATIVE`     | `SECONDARY_SUPERVISION`     | `OUTSIDE_CONFIGURATION_CLASS` | `SECONDARY_AUDIT`          | `AUDIT_EVIDENCE_RECORD`            | La pantalla presenta un expediente documental o paquete de evidencia necesario para demostrar qué ocurrió y con qué soporte, pero su intención primaria continúa siendo operativa, administrativa, de supervisión, configuración, personal o de cliente. La auditoría queda acotada a evidencia, historia y drill-down sin habilitar mutación retroactiva.          |
| `VSCREEN-0175` | Seguridad de cuenta y sesiones                        | `shell`    | `VPROC-0059::STEP-MANAGE_ACCOUNT_SECURITY`                  | `OUTSIDE_OPERATIONAL_CLASS` | `OUTSIDE_ADMINISTRATIVE_CLASS` | `OUTSIDE_SUPERVISION_CLASS` | `OUTSIDE_CONFIGURATION_CLASS` | `SECONDARY_AUDIT`          | `AUDIT_ACCESS_SECURITY`            | La pantalla expone historia y evidencia de asignaciones, certificaciones, revocaciones, dispositivos o sesiones de seguridad, pero su intención primaria continúa siendo operativa, administrativa, de supervisión, configuración, personal o de cliente. La auditoría queda acotada a evidencia, historia y drill-down sin habilitar mutación retroactiva.         |
| `VSCREEN-0176` | Definición de kits y conjuntos                        | `nexo`     | `VPROC-0067::STEP-MAINTAIN_KIT_DEFINITION`                  | `OUTSIDE_OPERATIONAL_CLASS` | `SECONDARY_ADMINISTRATIVE`     | `OUTSIDE_SUPERVISION_CLASS` | `PRIMARY_CONFIGURATION`       | `SECONDARY_AUDIT`          | `AUDIT_CHANGE_HISTORY`             | La pantalla permite comparar versiones, vigencias, autores, aprobaciones y publicaciones de una definición reutilizable, pero su intención primaria continúa siendo operativa, administrativa, de supervisión, configuración, personal o de cliente. La auditoría queda acotada a evidencia, historia y drill-down sin habilitar mutación retroactiva.              |
| `VSCREEN-0177` | Configuración de impresoras logísticas                | `nexo`     | `VPROC-0024::STEP-CONFIGURE_LOGISTICS_PRINTERS`             | `OUTSIDE_OPERATIONAL_CLASS` | `SECONDARY_ADMINISTRATIVE`     | `OUTSIDE_SUPERVISION_CLASS` | `PRIMARY_CONFIGURATION`       | `SECONDARY_AUDIT`          | `AUDIT_CHANGE_HISTORY`             | La pantalla permite comparar versiones, vigencias, autores, aprobaciones y publicaciones de una definición reutilizable, pero su intención primaria continúa siendo operativa, administrativa, de supervisión, configuración, personal o de cliente. La auditoría queda acotada a evidencia, historia y drill-down sin habilitar mutación retroactiva.              |

---

#### 15. Resumen por aplicación

| Aplicación | Primaria auditoría | Secundaria auditoría | Fuera de clase |   Total |
| ---------- | -----------------: | -------------------: | -------------: | ------: |
| `shell`    |                  0 |                    1 |              6 |       7 |
| `viso`     |                  0 |                   21 |             10 |      31 |
| `anima`    |                  0 |                    9 |              5 |      14 |
| `nexo`     |                  0 |                   22 |             15 |      37 |
| `fogo`     |                  1 |                    6 |              8 |      15 |
| `origo`    |                  1 |                    9 |              4 |      14 |
| `pulso`    |                  0 |                   15 |              5 |      20 |
| `numera`   |                  1 |                   16 |              3 |      20 |
| `pass`     |                  0 |                    9 |             10 |      19 |
| **Total**  |              **3** |              **108** |         **66** | **177** |

La distribución por aplicación es una reconciliación física, no una regla de clasificación.

---

#### 16. Resumen por patrón

| Patrón                                | Pantallas |
| ------------------------------------- | --------: |
| `AUDIT_PROCUREMENT_HISTORY`           |         1 |
| `AUDIT_FINANCIAL_REPORTING`           |         1 |
| `AUDIT_TRACEABILITY_INVESTIGATION`    |         1 |
| `AUDIT_ACCESS_SECURITY`               |         5 |
| `AUDIT_CHANGE_HISTORY`                |        16 |
| `AUDIT_DECISION_RECORD`               |        12 |
| `AUDIT_EVIDENCE_RECORD`               |        15 |
| `AUDIT_RECONCILIATION`                |        10 |
| `AUDIT_CUSTODY_CHAIN`                 |        14 |
| `AUDIT_TRANSACTION_LEDGER`            |        16 |
| `AUDIT_CASE_CHRONOLOGY`               |        18 |
| `AUDIT_COMPLIANCE_CONTROL`            |         2 |
| **Total con relevancia de auditoría** |   **111** |

Las 66 pantallas con `NONE` no quedan exentas de logging técnico o empresarial; únicamente no presentan una experiencia material de auditoría en esta clasificación.

---

#### 17. Exportación y evidencia derivada

Toda exportación de auditoría deberá:

1. declarar filtros, periodo, alcance, zona horaria y momento de generación;
2. incluir fuente y versión del contrato;
3. conservar identificador del export y hash cuando aplique;
4. respetar minimización, privacidad, territorio y legal hold;
5. impedir que CSV, PDF o archivo temporal amplíe permisos;
6. registrar solicitante, finalidad y resultado;
7. informar datos omitidos, incompletos o no disponibles;
8. ser reproducible o declarar por qué no puede reproducirse;
9. no presentarse como certificación externa salvo contrato y autoridad aprobados.

---

#### 18. Cambio y versionado

Cambiar `audit_fit` o `audit_pattern` exige:

1. propuesta trazable;
2. comparación de intención, evidencia visible, procedencia, temporalidad y frontera de corrección;
3. conservación de la decisión anterior;
4. nueva versión de clasificación;
5. revisión de actores, sensibilidad, permisos, exportaciones, métricas y pruebas;
6. actualización coordinada cuando cambie una identidad, proceso o paso;
7. nueva identidad cuando la superficie histórica se mezcle materialmente con ejecución o configuración incompatible.

---

#### 19. Validaciones obligatorias

La compilación deberá fallar cuando:

1. falte una de las 177 pantallas;
2. una pantalla aparezca más de una vez;
3. un nombre, aplicación, proceso, paso o clase anterior difiera de su fuente;
4. falte `audit_fit`;
5. el valor no pertenezca al vocabulario;
6. una primaria o secundaria use `NONE`;
7. una pantalla fuera de clase use patrón;
8. falte fundamento;
9. exista `PRIMARY_AUDIT` junto con otra clase primaria;
10. los conteos no sean 3, 108 y 66;
11. los patrones no sumen 111;
12. `VSCREEN-0079`, `VSCREEN-0106` o `VSCREEN-0173` dejen de ser primarias de auditoría sin una nueva decisión;
13. una pantalla transaccional sea auditora solo porque genera logs;
14. una pantalla primaria de auditoría permita modificar el hecho original;
15. una corrección carezca de vínculo con el original;
16. una exportación omita periodo, alcance, fuente o actor;
17. AURA reciba clasificación sin pantalla admitida;
18. la puerta final deje más de una clase primaria o ninguna.

---

#### 20. Seguridad, privacidad y autorización

La clasificación de auditoría no concede:

- lectura global;
- acceso a información médica, laboral, financiera o personal;
- exportación;
- descarga de evidencia;
- consulta entre sedes, marcas o territorios;
- acceso a notas internas;
- corrección, reversión o reapertura;
- autoridad para certificar;
- acceso por URL directa;
- acceso a logs técnicos secretos.

Toda lectura deberá revalidar identidad, actor, finalidad, permiso, territorio, sensibilidad, relación con el caso, retención y legal hold. Los accesos y exportaciones sensibles deberán generar su propia evidencia.

---

#### 21. SCREEN-AUDIT-CARRYOVER-REGISTER-001

| Pendiente                                                              | Propietario exacto                                        |
| ---------------------------------------------------------------------- | --------------------------------------------------------- |
| clasificar pantallas personales                                        | `PROC-SCREEN-010`                                         |
| clasificar pantallas de cliente y cerrar la puerta de clases primarias | `PROC-SCREEN-011`                                         |
| definir actores y alcance de consulta                                  | `PROC-SCREEN-012`                                         |
| definir dispositivos soportados                                        | `PROC-SCREEN-013`                                         |
| definir acciones, handoffs y exportaciones                             | `PROC-SCREEN-014` y `PROC-SCREEN-015`                     |
| definir entrada, salida, carga, vacío, bloqueo y recuperación          | `PROC-SCREEN-016` a `PROC-SCREEN-021`                     |
| definir sensibilidad y permisos                                        | `PROC-SCREEN-022` a `PROC-SCREEN-024`                     |
| vincular operaciones, eventos, ledgers y evidencia técnica             | `PROC-SCREEN-025`; `AUD-EVT-*`; `EVID-ARC-*`              |
| mapear rutas, reportes y superficies legacy                            | `PROC-SCREEN-026`                                         |
| definir métricas y aceptación                                          | `PROC-SCREEN-027` y `PROC-SCREEN-028`                     |
| materializar contratos, retención, integridad y validadores            | paquetes E3, E4, E5 y CI documental                       |
| validar con auditores, responsables y usuarios reales                  | `UX-QA-*`, `AUTH-QA-*` y pilotos E5                       |
| definir certificaciones o reportes externos                            | `PROC-SCREEN-015`; `INT-EXT-*`; paquete E5 propietario    |
| admitir AURA                                                           | tareas canónicas de AURA y nueva admisión `PROC-SCREEN-*` |

No queda pendiente narrativo sin tarea o puerta de resolución.

---

#### 22. Requisitos de prueba derivados

**Resultado:** GENERA 30 REQUISITOS DE PRUEBA.

Se incorporan `TREQ-UX-737` a `TREQ-UX-766` al Registro Canónico completo. Permanecen en estado `IDENTIFICADO`; automatización, implementación y evidencia corresponden a CI documental, arquitectura E3/E4, paquetes E5, BLOQUE U, staging y pilotos.

---

#### 23. Criterios de aceptación

- [x] Se clasifican las 177 pantallas sin renumerarlas ni renombrarlas.
- [x] Se conservan aplicaciones, procesos, pasos y clases anteriores.
- [x] Cada pantalla recibe exactamente un `audit_fit`.
- [x] Se distinguen 3 primarias, 108 secundarias y 66 fuera de clase.
- [x] Las 111 pantallas relevantes utilizan doce patrones cerrados.
- [x] Ninguna primaria de auditoría compite con otra clase primaria.
- [x] Se protegen `VSCREEN-0079`, `VSCREEN-0106` y `VSCREEN-0173` como superficies auditoras primarias.
- [x] Se separa auditoría de logging, operación, administración, supervisión y configuración.
- [x] Se definen evidencia mínima, cronología, temporalidad, correlación, exportación y no reescritura.
- [x] Se mantiene el handoff obligatorio para correcciones.
- [x] AURA conserva cero pantallas.
- [x] La clasificación no concede permisos ni exportación.
- [x] Se generan `TREQ-UX-737` a `TREQ-UX-766`.
- [x] No se anticipan actores, dispositivos, acciones, estados, permisos, rutas o implementaciones.
- [x] No se implementa código ni se avanza a `PROC-SCREEN-010`.

---

#### 24. Resultado y continuidad

```text
PROC-SCREEN-008 APROBADA
PROC-SCREEN-009 APROBADA
PROC-SCREEN-010 NO INICIADA
```

La continuidad documental pasa exclusivamente a:

```text
PROC-SCREEN-010 — Clasificar pantalla personal
```


### ✅ PROC-SCREEN-010 — Clasificar pantalla personal

**Estado:** APROBADA

**Bloque:** E2 — Arquitectura funcional, procesos y experiencia transversal

**Marcador exacto que reemplaza:** `### [ ] PROC-SCREEN-010 — Clasificar pantalla personal`

**Tarea anterior:** `PROC-SCREEN-009 — Clasificar pantalla de auditoría` — APROBADA

**Siguiente tarea reservada:** `PROC-SCREEN-011 — Clasificar pantalla de cliente` — NO INICIADA

**Fuente canónica obligatoria de identidades y nombres:** `PROC-SCREEN-002 / SCREEN-CANONICAL-CATALOG-001`, corte vigente de **177 pantallas**.

**Artefactos lógicos contenidos en esta tarea:**

- `SCREEN-PERSONAL-CLASSIFICATION-CONTRACT-001`;
- `SCREEN-PERSONAL-PATTERN-VOCABULARY-001`;
- `SCREEN-PERSONAL-CLASSIFICATION-REGISTER-001`;
- `SCREEN-PERSONAL-SELF-SCOPE-CONTRACT-001`;
- `SCREEN-PERSONAL-SHARED-DEVICE-BOUNDARY-001`;
- `SCREEN-PERSONAL-PRIVACY-MINIMIZATION-CONTRACT-001`;
- `SCREEN-PERSONAL-COVERAGE-MATRIX-001`;
- `SCREEN-PERSONAL-CLASSIFICATION-CHANGE-POLICY-001`;
- `SCREEN-PERSONAL-CLASSIFICATION-VALIDATION-GATE-001`;
- `SCREEN-PERSONAL-CARRYOVER-REGISTER-001`.

**Resultado cuantitativo:** **177 pantallas clasificadas**, de las cuales **20** quedan como `PRIMARY_PERSONAL`, **1** como `SECONDARY_PERSONAL` y **156** como `OUTSIDE_PERSONAL_CLASS`; se utilizan **12 patrones**, existen **21 pantallas con relevancia personal**, quedan exactamente **19 pantallas PASS** sin clase primaria para `PROC-SCREEN-011`, AURA conserva cero pantallas y ninguna identidad, nombre, aplicación, proceso, paso o clasificación anterior fue modificada.

**Huella de nombres `screen_id|working_name`:** `f9e15f46d8e1658f8435185e18a359581179eb47f283484b94218c46734a9a31`

**Naturaleza:** clasificación documental del grado en que cada pantalla permite a la persona autenticada consultar, mantener, reconocer o presentar información, solicitudes, contexto, seguridad y compromisos estrictamente propios. No define todavía la clase de cliente; tampoco define actores, dispositivos, acciones, estados de interfaz, sensibilidad, permisos, rutas u operaciones técnicas.

**Cambios en identidades, nombres, aplicaciones, procesos, pasos, clasificaciones aprobadas, código, rutas, componentes, Supabase, tablas, migraciones, RLS, RPC, eventos o producción:** no autorizados por esta tarea.

---

#### 1. Propósito

Distinguir las superficies de autoservicio individual de aquellas que administran, supervisan, configuran, auditan o ejecutan trabajo sobre poblaciones, recursos o casos empresariales, y separarlas de la experiencia de cliente que será clasificada en `PROC-SCREEN-011`.

```text
PERSONA AUTENTICADA
        +
SU PROPIA IDENTIDAD, CUENTA, CONTEXTO O EXPEDIENTE
        +
AUTOSERVICIO, CONSULTA, RECONOCIMIENTO O SOLICITUD PROPIA
        +
AISLAMIENTO ESTRICTO FRENTE A TERCEROS
        =
CLASIFICACION PERSONAL
```

La clasificación responde **si la pantalla está orientada al caso propio del actor actual**. No significa que la pantalla sea privada por usar un dispositivo personal, ni que cualquier interfaz personalizada sea una pantalla personal.

---

#### 2. Dependencias consumidas

- `PROC-SCREEN-001` y la identidad estable `VSCREEN-*`;
- `PROC-SCREEN-002` y el catálogo vigente de 177 pantallas;
- `PROC-SCREEN-003` y los 177 vínculos primarios más 272 relacionados;
- `PROC-SCREEN-004` y las 177 anclas de paso;
- `PROC-SCREEN-005` a `PROC-SCREEN-009` y sus cinco clasificaciones aprobadas;
- `PROC-ACTOR-001` a `PROC-ACTOR-010`;
- `AUTH-CTX-*`, `AUTH-SRV-*`, `AUTH-DB-*`, `AUTH-QA-*` y los contratos de sesión, actor, territorio y dispositivo compartido;
- `UX-BASE-001` a `UX-BASE-015`;
- `UX-STATION-001` a `UX-STATION-012`;
- `UX-ADMIN-001` a `UX-ADMIN-005`;
- los contratos aprobados de privacidad, minimización, consentimiento, autoservicio, evidencia, recuperación y handoff.

La tarea consume estas fuentes sin inferir clase personal por el nombre de la ruta, por el uso del pronombre “mi”, por el dispositivo o por la aplicación de origen.

---

#### 3. Alcance

1. incorporar `personal_fit` a las 177 pantallas;
2. distinguir personal primaria, personal secundaria y ausencia de clase;
3. definir doce patrones cerrados;
4. conservar exactos nombres, aplicaciones, procesos, pasos y cinco clasificaciones previas;
5. delimitar el sujeto propio mediante principal, actor y expediente vinculados;
6. separar autoservicio personal de administración de personas y de experiencia de cliente;
7. tratar correctamente el contexto personal en dispositivos compartidos;
8. establecer minimización, aislamiento, revalidación y handoff;
9. impedir que una pantalla personal permita seleccionar arbitrariamente a otra persona;
10. dejar exactamente las 19 pantallas PASS pendientes de clase primaria para `PROC-SCREEN-011`;
11. establecer cambio, versionado, validaciones y carryovers;
12. preparar la puerta final de exactamente una clase primaria por pantalla.

---

#### 4. Exclusiones

Esta tarea no:

- clasifica pantallas de cliente;
- convierte todo contenido personalizado en autoservicio personal;
- convierte un dispositivo personal en criterio de clasificación;
- permite administrar registros de otros trabajadores;
- reemplaza la autorización de servidor;
- concede lectura, modificación, descarga o envío;
- define campos autoadministrables definitivos;
- define actores, dispositivos o acciones;
- diseña estados de interfaz;
- vincula APIs, RPC, Server Actions, eventos o tablas;
- mapea rutas o componentes legacy;
- activa AURA.

---

#### 5. Definición canónica de pantalla personal

Una pantalla tiene relevancia personal cuando el sujeto funcional es la propia persona autenticada y la interfaz le permite materialmente:

- entrar a su espacio individual;
- autenticar o recuperar su cuenta;
- resolver su contexto efectivo;
- activar su identidad en un dispositivo compartido;
- consultar tareas, avisos o comunicaciones dirigidas a ella;
- diagnosticar o solicitar soporte propio;
- revisar la seguridad de su cuenta y sesiones;
- registrar o consultar su asistencia y programación;
- presentar y seguir solicitudes laborales propias;
- consultar o mantener su perfil y credenciales;
- consultar o aportar sus documentos;
- completar formación y revisar objetivos propios;
- reportar eventos propios de seguridad o reconocer elementos asignados.

No basta con:

- mostrar el nombre del usuario;
- recordar filtros o preferencias;
- ser utilizada por una sola persona a la vez;
- ejecutarse en teléfono, tableta o computador personal;
- contener información personal de terceros;
- estar personalizada por rol;
- exigir autenticación;
- presentar una lista “asignada a mí” dentro de un workspace operacional propietario;
- pertenecer a ANIMA o SHELL sin cumplir el autoservicio propio.

---

#### 6. Estados de clasificación

| Valor                    | Significado                                                                    | Efecto documental                                   |
| ------------------------ | ------------------------------------------------------------------------------ | --------------------------------------------------- |
| `PRIMARY_PERSONAL`       | el autoservicio del caso propio es la intención dominante                      | reserva `PERSONAL` como clase primaria              |
| `SECONDARY_PERSONAL`     | otra clase es primaria, pero el flujo conserva una interacción propia material | agrega relevancia personal secundaria               |
| `OUTSIDE_PERSONAL_CLASS` | no existe autoservicio individual material bajo este contrato                  | conserva la clase anterior o continúa hacia cliente |

`OUTSIDE_PERSONAL_CLASS` no significa que la pantalla sea anónima, pública o incapaz de mostrar datos del actor. Significa que su intención dominante no es gestionar el caso propio.

---

#### 7. Contrato mínimo

| Campo                             | Obligación                                                           |
| --------------------------------- | -------------------------------------------------------------------- |
| `screen_id`                       | `VSCREEN-*` canónico                                                 |
| `canonical_screen_name`           | nombre exacto del catálogo                                           |
| `primary_application_id`          | aplicación aprobada                                                  |
| `primary_process_id`              | proceso aprobado                                                     |
| `primary_process_step_ref`        | paso aprobado                                                        |
| `operational_fit`                 | clasificación aprobada                                               |
| `administrative_fit`              | clasificación aprobada                                               |
| `supervision_fit`                 | clasificación aprobada                                               |
| `configuration_fit`               | clasificación aprobada                                               |
| `audit_fit`                       | clasificación aprobada                                               |
| `personal_fit`                    | uno de los tres estados aprobados                                    |
| `personal_pattern`                | patrón aprobado o `NONE`                                             |
| `personal_subject_rule`           | regla que enlaza la pantalla con el actor actual                     |
| `personal_reason`                 | fundamento verificable                                               |
| `personal_classification_version` | versión semántica                                                    |
| `personal_classification_status`  | `CANONICAL`, `CHANGE_PROPOSED`, `SUPERSEDED` o `RETIRED_WITH_SCREEN` |
| `personal_classification_task`    | tarea que aprobó o modificó la decisión                              |

Valores iniciales:

```text
personal_classification_version: 1.0.0
personal_classification_status: CANONICAL
personal_classification_task: PROC-SCREEN-010
decision_record: INITIAL_PERSONAL_CLASSIFICATION
canonical_name_source: SCREEN-CANONICAL-CATALOG-001
```

---

#### 8. SCREEN-PERSONAL-PATTERN-VOCABULARY-001

| Patrón                          | Uso                                                                 |
| ------------------------------- | ------------------------------------------------------------------- |
| `PERSONAL_HOME`                 | entrada individualizada al ecosistema o espacio personal            |
| `PERSONAL_IDENTITY_ACCESS`      | autenticación, recuperación, contexto y activación del actor actual |
| `PERSONAL_INBOX`                | tareas, avisos y comunicaciones propias                             |
| `PERSONAL_SUPPORT`              | diagnóstico, solicitud y seguimiento de soporte propio              |
| `PERSONAL_ACCOUNT_SECURITY`     | cuenta, sesiones y seguridad propias                                |
| `PERSONAL_TIME_ATTENDANCE`      | eventos, consulta y corrección de asistencia propia                 |
| `PERSONAL_SCHEDULE`             | programación laboral propia                                         |
| `PERSONAL_WORKFORCE_REQUESTS`   | novedades, permisos y ausencias propias                             |
| `PERSONAL_PROFILE_CREDENTIALS`  | perfil y credenciales laborales propias                             |
| `PERSONAL_DOCUMENTS`            | documentos del propio expediente                                    |
| `PERSONAL_LEARNING_DEVELOPMENT` | formación, objetivos y retroalimentación propios                    |
| `PERSONAL_SAFETY_EQUIPMENT`     | reportes propios de seguridad y elementos asignados                 |
| `NONE`                          | sin relevancia personal bajo esta tarea                             |

---

#### 9. Algoritmo de decisión

Se clasifica `PRIMARY_PERSONAL` cuando:

1. el sujeto es inequívocamente el principal o actor actual;
2. la persona entra para consultar, reconocer, mantener o solicitar algo propio;
3. no existe selector libre de otra persona como objeto principal;
4. la operación no administra una población ni un expediente ajeno;
5. la intención persiste aunque cambien ruta, dispositivo o componente.

Se clasifica `SECONDARY_PERSONAL` cuando:

1. la pantalla ya posee otra clase primaria;
2. el flujo incorpora una acción propia material y delimitada;
3. el backend deriva el sujeto desde la sesión y no desde un identificador manipulable;
4. la dimensión personal no absorbe la operación propietaria.

Se clasifica `OUTSIDE_PERSONAL_CLASS` cuando predomina:

- operación sobre recursos, pedidos, lotes, inventarios o caja;
- administración de personas, casos o expedientes de terceros;
- supervisión de equipos o poblaciones;
- configuración reutilizable;
- auditoría empresarial;
- experiencia comercial del cliente;
- cualquier pantalla que únicamente adapte contenido al usuario sin autoservicio propio.

---

#### 10. SCREEN-PERSONAL-SELF-SCOPE-CONTRACT-001

Toda pantalla personal deberá resolver el sujeto con este orden:

```text
authenticated_principal
    -> effective_actor
        -> self_subject_binding
            -> authorized_personal_projection
```

Reglas:

1. el identificador del sujeto no podrá confiarse exclusivamente al cliente;
2. la URL no podrá ampliar el sujeto a otra persona;
3. el servidor deberá contrastar principal, actor, relación laboral o cuenta y estado vigente;
4. el modo de simulación no convertirá una pantalla personal en expediente ajeno;
5. la delegación administrativa deberá abrir la pantalla administrativa propietaria, no reutilizar el autoservicio;
6. los campos autoadministrables deberán separarse de los protegidos;
7. una proyección personal no expondrá notas internas, investigaciones, decisiones reservadas ni datos de terceros;
8. toda escritura deberá revalidar versión, estado y pertenencia del sujeto.

---

#### 11. SCREEN-PERSONAL-SHARED-DEVICE-BOUNDARY-001

`PERSONAL` describe el alcance del caso, no la propiedad del dispositivo.

En dispositivos compartidos:

1. la identidad activa deberá mostrarse de forma inequívoca;
2. cambiar de actor invalidará caché, borradores, adjuntos, historial local y navegación privada del actor anterior;
3. la sesión personal no podrá persistir después de check-out, expiración, revocación o cierre;
4. notificaciones y documentos no podrán quedar visibles en pantalla de espera;
5. credenciales, tokens y secretos no podrán almacenarse en texto plano;
6. una acción pendiente deberá revalidarse al recuperar conectividad;
7. `VSCREEN-0004` seguirá siendo personal porque vincula al actor actual, aunque el hardware sea compartido;
8. la capacidad de usar un dispositivo compartido continuará gobernada por autorización y contexto, no por esta clasificación.

---

#### 12. Fronteras críticas

1. **Personal vs. administrativo:** consultar o solicitar sobre el expediente propio es personal; mantener el expediente de otra persona es administrativo.
2. **Personal vs. operativo:** registrar asistencia propia conserva `SECONDARY_PERSONAL`, pero el hecho de asistencia sigue siendo `PRIMARY_OPERATIONAL`.
3. **Personal vs. cliente:** PASS se reserva a `CLIENT`; no se utiliza `PERSONAL` como categoría genérica de cualquier individuo.
4. **Personal vs. supervisión:** una bandeja propia no supervisa trabajo de terceros; una cola agregada con reasignación sí puede ser supervisión.
5. **Personal vs. auditoría:** consultar el historial propio puede ser personal con auditoría secundaria; investigar o certificar hechos empresariales es auditoría.
6. **Personal vs. configuración:** preferencias o datos propios no equivalen a configuración empresarial reutilizable.
7. **Personal vs. autenticación:** autenticarse no basta por sí solo, pero la superficie que gestiona identidad y acceso estrictamente propios pertenece al carril personal.
8. **SHELL vs. ANIMA:** SHELL conserva identidad, cuenta, contexto e inbox transversal; ANIMA conserva el autoservicio laboral del trabajador.
9. **Soporte propio vs. mesa de servicio:** diagnóstico o solicitud propios son personales; resolver casos de terceros pertenece al backoffice de soporte.
10. **Comunicaciones propias vs. publicación:** reconocer un comunicado es personal; crear y publicar comunicaciones es administrativo.

---

#### 13. SCREEN-PERSONAL-CLASSIFICATION-REGISTER-001

| Screen ID      | Pantalla                                              | Aplicación | Paso dominante                                              | Clase operativa             | Clase administrativa           | Clase de supervisión        | Clase de configuración        | Clase de auditoría    | Clasificación personal   | Patrón                          | Fundamento                                                                                                                                                                                                                                                                                          |
| -------------- | ----------------------------------------------------- | ---------- | ----------------------------------------------------------- | --------------------------- | ------------------------------ | --------------------------- | ----------------------------- | --------------------- | ------------------------ | ------------------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `VSCREEN-0001` | Hub Vento OS                                          | `shell`    | `VPROC-0059::STEP-ENTER_ECOSYSTEM`                          | `OUTSIDE_OPERATIONAL_CLASS` | `OUTSIDE_ADMINISTRATIVE_CLASS` | `OUTSIDE_SUPERVISION_CLASS` | `OUTSIDE_CONFIGURATION_CLASS` | `OUTSIDE_AUDIT_CLASS` | `PRIMARY_PERSONAL`       | `PERSONAL_HOME`                 | La intención dominante presenta el punto de entrada individualizado y las capacidades propias disponibles para la persona autenticada. El sujeto del caso es el actor actual y la pantalla no permite administrar, supervisar ni consultar por defecto el expediente de otra persona.               |
| `VSCREEN-0002` | Inicio de sesión y recuperación                       | `shell`    | `VPROC-0059::STEP-AUTHENTICATE_OR_RECOVER`                  | `OUTSIDE_OPERATIONAL_CLASS` | `OUTSIDE_ADMINISTRATIVE_CLASS` | `OUTSIDE_SUPERVISION_CLASS` | `OUTSIDE_CONFIGURATION_CLASS` | `OUTSIDE_AUDIT_CLASS` | `PRIMARY_PERSONAL`       | `PERSONAL_IDENTITY_ACCESS`      | La intención dominante resuelve autenticación, recuperación, contexto efectivo o vinculación del actor actual sin administrar identidades ajenas. El sujeto del caso es el actor actual y la pantalla no permite administrar, supervisar ni consultar por defecto el expediente de otra persona.    |
| `VSCREEN-0003` | Resolución de contexto y acceso                       | `shell`    | `VPROC-0059::STEP-RESOLVE_EFFECTIVE_CONTEXT`                | `SECONDARY_OPERATIONAL`     | `SECONDARY_ADMINISTRATIVE`     | `OUTSIDE_SUPERVISION_CLASS` | `OUTSIDE_CONFIGURATION_CLASS` | `OUTSIDE_AUDIT_CLASS` | `PRIMARY_PERSONAL`       | `PERSONAL_IDENTITY_ACCESS`      | La intención dominante resuelve autenticación, recuperación, contexto efectivo o vinculación del actor actual sin administrar identidades ajenas. El sujeto del caso es el actor actual y la pantalla no permite administrar, supervisar ni consultar por defecto el expediente de otra persona.    |
| `VSCREEN-0004` | Activación de dispositivo compartido                  | `shell`    | `VPROC-0059::STEP-ACTIVATE_SHARED_DEVICE`                   | `SECONDARY_OPERATIONAL`     | `OUTSIDE_ADMINISTRATIVE_CLASS` | `OUTSIDE_SUPERVISION_CLASS` | `OUTSIDE_CONFIGURATION_CLASS` | `OUTSIDE_AUDIT_CLASS` | `PRIMARY_PERSONAL`       | `PERSONAL_IDENTITY_ACCESS`      | La intención dominante resuelve autenticación, recuperación, contexto efectivo o vinculación del actor actual sin administrar identidades ajenas. El sujeto del caso es el actor actual y la pantalla no permite administrar, supervisar ni consultar por defecto el expediente de otra persona.    |
| `VSCREEN-0005` | Bandeja transversal de tareas y notificaciones        | `shell`    | `VPROC-0004::STEP-TRIAGE_TRANSVERSAL_WORK`                  | `SECONDARY_OPERATIONAL`     | `SECONDARY_ADMINISTRATIVE`     | `OUTSIDE_SUPERVISION_CLASS` | `OUTSIDE_CONFIGURATION_CLASS` | `OUTSIDE_AUDIT_CLASS` | `PRIMARY_PERSONAL`       | `PERSONAL_INBOX`                | La intención dominante presenta tareas, avisos o comunicaciones dirigidas a la persona y permite su reconocimiento o navegación al caso propietario. El sujeto del caso es el actor actual y la pantalla no permite administrar, supervisar ni consultar por defecto el expediente de otra persona. |
| `VSCREEN-0006` | Centro de soporte y diagnóstico                       | `shell`    | `VPROC-0058::STEP-DIAGNOSE_AND_ROUTE_SUPPORT`               | `SECONDARY_OPERATIONAL`     | `SECONDARY_ADMINISTRATIVE`     | `OUTSIDE_SUPERVISION_CLASS` | `OUTSIDE_CONFIGURATION_CLASS` | `OUTSIDE_AUDIT_CLASS` | `PRIMARY_PERSONAL`       | `PERSONAL_SUPPORT`              | La intención dominante permite diagnosticar, solicitar o seguir soporte del propio actor sin convertirse en la mesa administrativa de terceros. El sujeto del caso es el actor actual y la pantalla no permite administrar, supervisar ni consultar por defecto el expediente de otra persona.      |
| `VSCREEN-0007` | Inicio ejecutivo y gerencial                          | `viso`     | `VPROC-0001::STEP-REVIEW_EXECUTIVE_WORK`                    | `OUTSIDE_OPERATIONAL_CLASS` | `SECONDARY_ADMINISTRATIVE`     | `PRIMARY_SUPERVISION`       | `OUTSIDE_CONFIGURATION_CLASS` | `OUTSIDE_AUDIT_CLASS` | `OUTSIDE_PERSONAL_CLASS` | `NONE`                          | La intención dominante ya está resuelta como `PRIMARY_SUPERVISION` y la pantalla trabaja sobre operación, administración, supervisión, configuración o auditoría más allá del caso propio del actor. Que una persona la utilice no la convierte en pantalla personal.                               |
| `VSCREEN-0008` | Estructura organizativa                               | `viso`     | `VPROC-0002::STEP-MAINTAIN_ORGANIZATIONAL_STRUCTURE`        | `OUTSIDE_OPERATIONAL_CLASS` | `SECONDARY_ADMINISTRATIVE`     | `OUTSIDE_SUPERVISION_CLASS` | `PRIMARY_CONFIGURATION`       | `SECONDARY_AUDIT`     | `OUTSIDE_PERSONAL_CLASS` | `NONE`                          | La intención dominante ya está resuelta como `PRIMARY_CONFIGURATION` y la pantalla trabaja sobre operación, administración, supervisión, configuración o auditoría más allá del caso propio del actor. Que una persona la utilice no la convierte en pantalla personal.                             |
| `VSCREEN-0009` | Políticas, delegaciones y límites                     | `viso`     | `VPROC-0003::STEP-AUTHOR_POLICIES_AND_LIMITS`               | `OUTSIDE_OPERATIONAL_CLASS` | `SECONDARY_ADMINISTRATIVE`     | `OUTSIDE_SUPERVISION_CLASS` | `PRIMARY_CONFIGURATION`       | `SECONDARY_AUDIT`     | `OUTSIDE_PERSONAL_CLASS` | `NONE`                          | La intención dominante ya está resuelta como `PRIMARY_CONFIGURATION` y la pantalla trabaja sobre operación, administración, supervisión, configuración o auditoría más allá del caso propio del actor. Que una persona la utilice no la convierte en pantalla personal.                             |
| `VSCREEN-0010` | Compromisos y transferencias internas                 | `viso`     | `VPROC-0004::STEP-TRACK_INTERNAL_COMMITMENTS`               | `SECONDARY_OPERATIONAL`     | `PRIMARY_ADMINISTRATIVE`       | `SECONDARY_SUPERVISION`     | `OUTSIDE_CONFIGURATION_CLASS` | `OUTSIDE_AUDIT_CLASS` | `OUTSIDE_PERSONAL_CLASS` | `NONE`                          | La intención dominante ya está resuelta como `PRIMARY_ADMINISTRATIVE` y la pantalla trabaja sobre operación, administración, supervisión, configuración o auditoría más allá del caso propio del actor. Que una persona la utilice no la convierte en pantalla personal.                            |
| `VSCREEN-0011` | Embudo de candidatos                                  | `viso`     | `VPROC-0005::STEP-TRIAGE_CANDIDATES`                        | `OUTSIDE_OPERATIONAL_CLASS` | `PRIMARY_ADMINISTRATIVE`       | `OUTSIDE_SUPERVISION_CLASS` | `OUTSIDE_CONFIGURATION_CLASS` | `OUTSIDE_AUDIT_CLASS` | `OUTSIDE_PERSONAL_CLASS` | `NONE`                          | La intención dominante ya está resuelta como `PRIMARY_ADMINISTRATIVE` y la pantalla trabaja sobre operación, administración, supervisión, configuración o auditoría más allá del caso propio del actor. Que una persona la utilice no la convierte en pantalla personal.                            |
| `VSCREEN-0012` | Caso de selección                                     | `viso`     | `VPROC-0005::STEP-EVALUATE_AND_DECIDE_CANDIDATE`            | `OUTSIDE_OPERATIONAL_CLASS` | `PRIMARY_ADMINISTRATIVE`       | `OUTSIDE_SUPERVISION_CLASS` | `OUTSIDE_CONFIGURATION_CLASS` | `SECONDARY_AUDIT`     | `OUTSIDE_PERSONAL_CLASS` | `NONE`                          | La intención dominante ya está resuelta como `PRIMARY_ADMINISTRATIVE` y la pantalla trabaja sobre operación, administración, supervisión, configuración o auditoría más allá del caso propio del actor. Que una persona la utilice no la convierte en pantalla personal.                            |
| `VSCREEN-0013` | Vinculación e incorporación                           | `viso`     | `VPROC-0006::STEP-ORCHESTRATE_ONBOARDING`                   | `OUTSIDE_OPERATIONAL_CLASS` | `PRIMARY_ADMINISTRATIVE`       | `OUTSIDE_SUPERVISION_CLASS` | `OUTSIDE_CONFIGURATION_CLASS` | `OUTSIDE_AUDIT_CLASS` | `OUTSIDE_PERSONAL_CLASS` | `NONE`                          | La intención dominante ya está resuelta como `PRIMARY_ADMINISTRATIVE` y la pantalla trabaja sobre operación, administración, supervisión, configuración o auditoría más allá del caso propio del actor. Que una persona la utilice no la convierte en pantalla personal.                            |
| `VSCREEN-0014` | Directorio y expediente laboral                       | `viso`     | `VPROC-0006::STEP-MAINTAIN_EMPLOYMENT_RECORD`               | `OUTSIDE_OPERATIONAL_CLASS` | `PRIMARY_ADMINISTRATIVE`       | `OUTSIDE_SUPERVISION_CLASS` | `OUTSIDE_CONFIGURATION_CLASS` | `SECONDARY_AUDIT`     | `OUTSIDE_PERSONAL_CLASS` | `NONE`                          | La intención dominante ya está resuelta como `PRIMARY_ADMINISTRATIVE` y la pantalla trabaja sobre operación, administración, supervisión, configuración o auditoría más allá del caso propio del actor. Que una persona la utilice no la convierte en pantalla personal.                            |
| `VSCREEN-0015` | Programación laboral                                  | `viso`     | `VPROC-0007::STEP-PLAN_AND_PUBLISH_SCHEDULE`                | `SECONDARY_OPERATIONAL`     | `PRIMARY_ADMINISTRATIVE`       | `SECONDARY_SUPERVISION`     | `OUTSIDE_CONFIGURATION_CLASS` | `OUTSIDE_AUDIT_CLASS` | `OUTSIDE_PERSONAL_CLASS` | `NONE`                          | La intención dominante ya está resuelta como `PRIMARY_ADMINISTRATIVE` y la pantalla trabaja sobre operación, administración, supervisión, configuración o auditoría más allá del caso propio del actor. Que una persona la utilice no la convierte en pantalla personal.                            |
| `VSCREEN-0016` | Revisión de asistencia                                | `viso`     | `VPROC-0008::STEP-REVIEW_ATTENDANCE_EXCEPTION`              | `SECONDARY_OPERATIONAL`     | `SECONDARY_ADMINISTRATIVE`     | `PRIMARY_SUPERVISION`       | `OUTSIDE_CONFIGURATION_CLASS` | `SECONDARY_AUDIT`     | `OUTSIDE_PERSONAL_CLASS` | `NONE`                          | La intención dominante ya está resuelta como `PRIMARY_SUPERVISION` y la pantalla trabaja sobre operación, administración, supervisión, configuración o auditoría más allá del caso propio del actor. Que una persona la utilice no la convierte en pantalla personal.                               |
| `VSCREEN-0017` | Novedades, ausencias y reemplazos                     | `viso`     | `VPROC-0009::STEP-RESOLVE_WORKFORCE_CASE`                   | `SECONDARY_OPERATIONAL`     | `PRIMARY_ADMINISTRATIVE`       | `SECONDARY_SUPERVISION`     | `OUTSIDE_CONFIGURATION_CLASS` | `OUTSIDE_AUDIT_CLASS` | `OUTSIDE_PERSONAL_CLASS` | `NONE`                          | La intención dominante ya está resuelta como `PRIMARY_ADMINISTRATIVE` y la pantalla trabaja sobre operación, administración, supervisión, configuración o auditoría más allá del caso propio del actor. Que una persona la utilice no la convierte en pantalla personal.                            |
| `VSCREEN-0018` | Retiro y revocación coordinada                        | `viso`     | `VPROC-0011::STEP-CLOSE_EMPLOYMENT_AND_REVOKE`              | `OUTSIDE_OPERATIONAL_CLASS` | `PRIMARY_ADMINISTRATIVE`       | `OUTSIDE_SUPERVISION_CLASS` | `OUTSIDE_CONFIGURATION_CLASS` | `SECONDARY_AUDIT`     | `OUTSIDE_PERSONAL_CLASS` | `NONE`                          | La intención dominante ya está resuelta como `PRIMARY_ADMINISTRATIVE` y la pantalla trabaja sobre operación, administración, supervisión, configuración o auditoría más allá del caso propio del actor. Que una persona la utilice no la convierte en pantalla personal.                            |
| `VSCREEN-0019` | Catálogo de roles y permisos                          | `viso`     | `VPROC-0059::STEP-MAINTAIN_ACCESS_CATALOG`                  | `OUTSIDE_OPERATIONAL_CLASS` | `SECONDARY_ADMINISTRATIVE`     | `OUTSIDE_SUPERVISION_CLASS` | `PRIMARY_CONFIGURATION`       | `SECONDARY_AUDIT`     | `OUTSIDE_PERSONAL_CLASS` | `NONE`                          | La intención dominante ya está resuelta como `PRIMARY_CONFIGURATION` y la pantalla trabaja sobre operación, administración, supervisión, configuración o auditoría más allá del caso propio del actor. Que una persona la utilice no la convierte en pantalla personal.                             |
| `VSCREEN-0020` | Perfil de acceso del trabajador                       | `viso`     | `VPROC-0059::STEP-ASSIGN_EFFECTIVE_ACCESS`                  | `OUTSIDE_OPERATIONAL_CLASS` | `PRIMARY_ADMINISTRATIVE`       | `OUTSIDE_SUPERVISION_CLASS` | `SECONDARY_CONFIGURATION`     | `SECONDARY_AUDIT`     | `OUTSIDE_PERSONAL_CLASS` | `NONE`                          | La intención dominante ya está resuelta como `PRIMARY_ADMINISTRATIVE` y la pantalla trabaja sobre operación, administración, supervisión, configuración o auditoría más allá del caso propio del actor. Que una persona la utilice no la convierte en pantalla personal.                            |
| `VSCREEN-0021` | Simulación de permisos y conflictos                   | `viso`     | `VPROC-0059::STEP-SIMULATE_ACCESS_DECISION`                 | `OUTSIDE_OPERATIONAL_CLASS` | `PRIMARY_ADMINISTRATIVE`       | `SECONDARY_SUPERVISION`     | `OUTSIDE_CONFIGURATION_CLASS` | `OUTSIDE_AUDIT_CLASS` | `OUTSIDE_PERSONAL_CLASS` | `NONE`                          | La intención dominante ya está resuelta como `PRIMARY_ADMINISTRATIVE` y la pantalla trabaja sobre operación, administración, supervisión, configuración o auditoría más allá del caso propio del actor. Que una persona la utilice no la convierte en pantalla personal.                            |
| `VSCREEN-0022` | Gobierno de dispositivos compartidos                  | `viso`     | `VPROC-0059::STEP-GOVERN_SHARED_DEVICES`                    | `OUTSIDE_OPERATIONAL_CLASS` | `SECONDARY_ADMINISTRATIVE`     | `OUTSIDE_SUPERVISION_CLASS` | `PRIMARY_CONFIGURATION`       | `SECONDARY_AUDIT`     | `OUTSIDE_PERSONAL_CLASS` | `NONE`                          | La intención dominante ya está resuelta como `PRIMARY_CONFIGURATION` y la pantalla trabaja sobre operación, administración, supervisión, configuración o auditoría más allá del caso propio del actor. Que una persona la utilice no la convierte en pantalla personal.                             |
| `VSCREEN-0023` | Riesgos de seguridad y salud                          | `viso`     | `VPROC-0012::STEP-ASSESS_SST_RISK`                          | `OUTSIDE_OPERATIONAL_CLASS` | `PRIMARY_ADMINISTRATIVE`       | `SECONDARY_SUPERVISION`     | `OUTSIDE_CONFIGURATION_CLASS` | `SECONDARY_AUDIT`     | `OUTSIDE_PERSONAL_CLASS` | `NONE`                          | La intención dominante ya está resuelta como `PRIMARY_ADMINISTRATIVE` y la pantalla trabaja sobre operación, administración, supervisión, configuración o auditoría más allá del caso propio del actor. Que una persona la utilice no la convierte en pantalla personal.                            |
| `VSCREEN-0024` | Incidentes y emergencias                              | `viso`     | `VPROC-0013::STEP-MANAGE_INCIDENT_RESPONSE`                 | `SECONDARY_OPERATIONAL`     | `PRIMARY_ADMINISTRATIVE`       | `SECONDARY_SUPERVISION`     | `OUTSIDE_CONFIGURATION_CLASS` | `SECONDARY_AUDIT`     | `OUTSIDE_PERSONAL_CLASS` | `NONE`                          | La intención dominante ya está resuelta como `PRIMARY_ADMINISTRATIVE` y la pantalla trabaja sobre operación, administración, supervisión, configuración o auditoría más allá del caso propio del actor. Que una persona la utilice no la convierte en pantalla personal.                            |
| `VSCREEN-0025` | Controles de higiene y cumplimiento                   | `viso`     | `VPROC-0014::STEP-REVIEW_HYGIENE_COMPLIANCE`                | `SECONDARY_OPERATIONAL`     | `SECONDARY_ADMINISTRATIVE`     | `PRIMARY_SUPERVISION`       | `SECONDARY_CONFIGURATION`     | `SECONDARY_AUDIT`     | `OUTSIDE_PERSONAL_CLASS` | `NONE`                          | La intención dominante ya está resuelta como `PRIMARY_SUPERVISION` y la pantalla trabaja sobre operación, administración, supervisión, configuración o auditoría más allá del caso propio del actor. Que una persona la utilice no la convierte en pantalla personal.                               |
| `VSCREEN-0026` | Bandeja de casos administrativos transversales        | `viso`     | `VPROC-0004::STEP-TRIAGE_ADMIN_CASES`                       | `SECONDARY_OPERATIONAL`     | `PRIMARY_ADMINISTRATIVE`       | `SECONDARY_SUPERVISION`     | `OUTSIDE_CONFIGURATION_CLASS` | `OUTSIDE_AUDIT_CLASS` | `OUTSIDE_PERSONAL_CLASS` | `NONE`                          | La intención dominante ya está resuelta como `PRIMARY_ADMINISTRATIVE` y la pantalla trabaja sobre operación, administración, supervisión, configuración o auditoría más allá del caso propio del actor. Que una persona la utilice no la convierte en pantalla personal.                            |
| `VSCREEN-0027` | Inicio personal del trabajador                        | `anima`    | `VPROC-0007::STEP-ENTER_PERSONAL_WORKSPACE`                 | `OUTSIDE_OPERATIONAL_CLASS` | `OUTSIDE_ADMINISTRATIVE_CLASS` | `OUTSIDE_SUPERVISION_CLASS` | `OUTSIDE_CONFIGURATION_CLASS` | `OUTSIDE_AUDIT_CLASS` | `PRIMARY_PERSONAL`       | `PERSONAL_HOME`                 | La intención dominante presenta el punto de entrada individualizado y las capacidades propias disponibles para la persona autenticada. El sujeto del caso es el actor actual y la pantalla no permite administrar, supervisar ni consultar por defecto el expediente de otra persona.               |
| `VSCREEN-0028` | Registro de entrada, pausa y salida                   | `anima`    | `VPROC-0008::STEP-CAPTURE_ATTENDANCE_EVENT`                 | `PRIMARY_OPERATIONAL`       | `OUTSIDE_ADMINISTRATIVE_CLASS` | `OUTSIDE_SUPERVISION_CLASS` | `OUTSIDE_CONFIGURATION_CLASS` | `OUTSIDE_AUDIT_CLASS` | `SECONDARY_PERSONAL`     | `PERSONAL_TIME_ATTENDANCE`      | La pantalla permite registrar, consultar o solicitar corrección de eventos de tiempo y asistencia de la propia persona, pero su intención primaria continúa siendo operativa. El autoservicio personal queda limitado al actor actual y no altera la fuente administrativa del registro.            |
| `VSCREEN-0029` | Mi programación                                       | `anima`    | `VPROC-0007::STEP-CONSULT_PUBLISHED_SCHEDULE`               | `SECONDARY_OPERATIONAL`     | `OUTSIDE_ADMINISTRATIVE_CLASS` | `OUTSIDE_SUPERVISION_CLASS` | `OUTSIDE_CONFIGURATION_CLASS` | `OUTSIDE_AUDIT_CLASS` | `PRIMARY_PERSONAL`       | `PERSONAL_SCHEDULE`             | La intención dominante permite consultar la programación laboral publicada para la propia persona. El sujeto del caso es el actor actual y la pantalla no permite administrar, supervisar ni consultar por defecto el expediente de otra persona.                                                   |
| `VSCREEN-0030` | Mi asistencia y solicitud de corrección               | `anima`    | `VPROC-0008::STEP-CONSULT_OR_REQUEST_ATTENDANCE_CORRECTION` | `SECONDARY_OPERATIONAL`     | `OUTSIDE_ADMINISTRATIVE_CLASS` | `OUTSIDE_SUPERVISION_CLASS` | `OUTSIDE_CONFIGURATION_CLASS` | `SECONDARY_AUDIT`     | `PRIMARY_PERSONAL`       | `PERSONAL_TIME_ATTENDANCE`      | La intención dominante permite registrar, consultar o solicitar corrección de eventos de tiempo y asistencia de la propia persona. El sujeto del caso es el actor actual y la pantalla no permite administrar, supervisar ni consultar por defecto el expediente de otra persona.                   |
| `VSCREEN-0031` | Mis novedades, permisos y ausencias                   | `anima`    | `VPROC-0009::STEP-SUBMIT_PERSONAL_WORKFORCE_CASE`           | `SECONDARY_OPERATIONAL`     | `OUTSIDE_ADMINISTRATIVE_CLASS` | `OUTSIDE_SUPERVISION_CLASS` | `OUTSIDE_CONFIGURATION_CLASS` | `SECONDARY_AUDIT`     | `PRIMARY_PERSONAL`       | `PERSONAL_WORKFORCE_REQUESTS`   | La intención dominante permite presentar y seguir novedades, permisos o ausencias del propio expediente laboral. El sujeto del caso es el actor actual y la pantalla no permite administrar, supervisar ni consultar por defecto el expediente de otra persona.                                     |
| `VSCREEN-0032` | Mi perfil laboral                                     | `anima`    | `VPROC-0006::STEP-MAINTAIN_SELF_SERVICE_PROFILE`            | `OUTSIDE_OPERATIONAL_CLASS` | `OUTSIDE_ADMINISTRATIVE_CLASS` | `OUTSIDE_SUPERVISION_CLASS` | `OUTSIDE_CONFIGURATION_CLASS` | `OUTSIDE_AUDIT_CLASS` | `PRIMARY_PERSONAL`       | `PERSONAL_PROFILE_CREDENTIALS`  | La intención dominante permite consultar o mantener el perfil y credenciales laborales propios dentro de los campos autoadministrables. El sujeto del caso es el actor actual y la pantalla no permite administrar, supervisar ni consultar por defecto el expediente de otra persona.              |
| `VSCREEN-0033` | Resumen de inventario y abastecimiento interno        | `nexo`     | `VPROC-0028::STEP-MONITOR_INTERNAL_SUPPLY`                  | `SECONDARY_OPERATIONAL`     | `SECONDARY_ADMINISTRATIVE`     | `PRIMARY_SUPERVISION`       | `OUTSIDE_CONFIGURATION_CLASS` | `OUTSIDE_AUDIT_CLASS` | `OUTSIDE_PERSONAL_CLASS` | `NONE`                          | La intención dominante ya está resuelta como `PRIMARY_SUPERVISION` y la pantalla trabaja sobre operación, administración, supervisión, configuración o auditoría más allá del caso propio del actor. Que una persona la utilice no la convierte en pantalla personal.                               |
| `VSCREEN-0034` | Catálogo de productos físicos                         | `nexo`     | `VPROC-0015::STEP-CONSULT_PHYSICAL_PRODUCT_CATALOG`         | `SECONDARY_OPERATIONAL`     | `SECONDARY_ADMINISTRATIVE`     | `OUTSIDE_SUPERVISION_CLASS` | `PRIMARY_CONFIGURATION`       | `OUTSIDE_AUDIT_CLASS` | `OUTSIDE_PERSONAL_CLASS` | `NONE`                          | La intención dominante ya está resuelta como `PRIMARY_CONFIGURATION` y la pantalla trabaja sobre operación, administración, supervisión, configuración o auditoría más allá del caso propio del actor. Que una persona la utilice no la convierte en pantalla personal.                             |
| `VSCREEN-0035` | Editor de producto, unidad y presentación             | `nexo`     | `VPROC-0015::STEP-MAINTAIN_PRODUCT_PRESENTATION`            | `OUTSIDE_OPERATIONAL_CLASS` | `SECONDARY_ADMINISTRATIVE`     | `OUTSIDE_SUPERVISION_CLASS` | `PRIMARY_CONFIGURATION`       | `SECONDARY_AUDIT`     | `OUTSIDE_PERSONAL_CLASS` | `NONE`                          | La intención dominante ya está resuelta como `PRIMARY_CONFIGURATION` y la pantalla trabaja sobre operación, administración, supervisión, configuración o auditoría más allá del caso propio del actor. Que una persona la utilice no la convierte en pantalla personal.                             |
| `VSCREEN-0036` | Especificaciones y criterios de calidad               | `nexo`     | `VPROC-0018::STEP-MAINTAIN_QUALITY_SPECIFICATION`           | `OUTSIDE_OPERATIONAL_CLASS` | `SECONDARY_ADMINISTRATIVE`     | `OUTSIDE_SUPERVISION_CLASS` | `PRIMARY_CONFIGURATION`       | `SECONDARY_AUDIT`     | `OUTSIDE_PERSONAL_CLASS` | `NONE`                          | La intención dominante ya está resuelta como `PRIMARY_CONFIGURATION` y la pantalla trabaja sobre operación, administración, supervisión, configuración o auditoría más allá del caso propio del actor. Que una persona la utilice no la convierte en pantalla personal.                             |
| `VSCREEN-0037` | Catálogo de ubicaciones                               | `nexo`     | `VPROC-0023::STEP-MAINTAIN_LOCATION_CATALOG`                | `OUTSIDE_OPERATIONAL_CLASS` | `SECONDARY_ADMINISTRATIVE`     | `OUTSIDE_SUPERVISION_CLASS` | `PRIMARY_CONFIGURATION`       | `SECONDARY_AUDIT`     | `OUTSIDE_PERSONAL_CLASS` | `NONE`                          | La intención dominante ya está resuelta como `PRIMARY_CONFIGURATION` y la pantalla trabaja sobre operación, administración, supervisión, configuración o auditoría más allá del caso propio del actor. Que una persona la utilice no la convierte en pantalla personal.                             |
| `VSCREEN-0038` | Identificación y detalle de ubicación                 | `nexo`     | `VPROC-0023::STEP-IDENTIFY_LOCATION_AND_CONTENT`            | `PRIMARY_OPERATIONAL`       | `OUTSIDE_ADMINISTRATIVE_CLASS` | `OUTSIDE_SUPERVISION_CLASS` | `OUTSIDE_CONFIGURATION_CLASS` | `OUTSIDE_AUDIT_CLASS` | `OUTSIDE_PERSONAL_CLASS` | `NONE`                          | La intención dominante ya está resuelta como `PRIMARY_OPERATIONAL` y la pantalla trabaja sobre operación, administración, supervisión, configuración o auditoría más allá del caso propio del actor. Que una persona la utilice no la convierte en pantalla personal.                               |
| `VSCREEN-0039` | Consulta de existencias                               | `nexo`     | `VPROC-0024::STEP-CONSULT_STOCK_POSITION`                   | `SECONDARY_OPERATIONAL`     | `OUTSIDE_ADMINISTRATIVE_CLASS` | `PRIMARY_SUPERVISION`       | `OUTSIDE_CONFIGURATION_CLASS` | `OUTSIDE_AUDIT_CLASS` | `OUTSIDE_PERSONAL_CLASS` | `NONE`                          | La intención dominante ya está resuelta como `PRIMARY_SUPERVISION` y la pantalla trabaja sobre operación, administración, supervisión, configuración o auditoría más allá del caso propio del actor. Que una persona la utilice no la convierte en pantalla personal.                               |
| `VSCREEN-0040` | Conteo de inventario                                  | `nexo`     | `VPROC-0026::STEP-CAPTURE_PHYSICAL_COUNT`                   | `PRIMARY_OPERATIONAL`       | `OUTSIDE_ADMINISTRATIVE_CLASS` | `OUTSIDE_SUPERVISION_CLASS` | `OUTSIDE_CONFIGURATION_CLASS` | `OUTSIDE_AUDIT_CLASS` | `OUTSIDE_PERSONAL_CLASS` | `NONE`                          | La intención dominante ya está resuelta como `PRIMARY_OPERATIONAL` y la pantalla trabaja sobre operación, administración, supervisión, configuración o auditoría más allá del caso propio del actor. Que una persona la utilice no la convierte en pantalla personal.                               |
| `VSCREEN-0041` | Revisión de conteo y diferencias                      | `nexo`     | `VPROC-0026::STEP-REVIEW_COUNT_VARIANCE`                    | `PRIMARY_OPERATIONAL`       | `SECONDARY_ADMINISTRATIVE`     | `SECONDARY_SUPERVISION`     | `OUTSIDE_CONFIGURATION_CLASS` | `SECONDARY_AUDIT`     | `OUTSIDE_PERSONAL_CLASS` | `NONE`                          | La intención dominante ya está resuelta como `PRIMARY_OPERATIONAL` y la pantalla trabaja sobre operación, administración, supervisión, configuración o auditoría más allá del caso propio del actor. Que una persona la utilice no la convierte en pantalla personal.                               |
| `VSCREEN-0042` | Caso de ajuste de inventario                          | `nexo`     | `VPROC-0026::STEP-DECIDE_INVENTORY_ADJUSTMENT`              | `PRIMARY_OPERATIONAL`       | `SECONDARY_ADMINISTRATIVE`     | `SECONDARY_SUPERVISION`     | `OUTSIDE_CONFIGURATION_CLASS` | `SECONDARY_AUDIT`     | `OUTSIDE_PERSONAL_CLASS` | `NONE`                          | La intención dominante ya está resuelta como `PRIMARY_OPERATIONAL` y la pantalla trabaja sobre operación, administración, supervisión, configuración o auditoría más allá del caso propio del actor. Que una persona la utilice no la convierte en pantalla personal.                               |
| `VSCREEN-0043` | Confirmación de entrada a inventario                  | `nexo`     | `VPROC-0024::STEP-CONFIRM_STOCK_ENTRY`                      | `PRIMARY_OPERATIONAL`       | `OUTSIDE_ADMINISTRATIVE_CLASS` | `OUTSIDE_SUPERVISION_CLASS` | `OUTSIDE_CONFIGURATION_CLASS` | `SECONDARY_AUDIT`     | `OUTSIDE_PERSONAL_CLASS` | `NONE`                          | La intención dominante ya está resuelta como `PRIMARY_OPERATIONAL` y la pantalla trabaja sobre operación, administración, supervisión, configuración o auditoría más allá del caso propio del actor. Que una persona la utilice no la convierte en pantalla personal.                               |
| `VSCREEN-0044` | Retiro y consumo de existencias                       | `nexo`     | `VPROC-0025::STEP-EXECUTE_STOCK_WITHDRAWAL`                 | `PRIMARY_OPERATIONAL`       | `OUTSIDE_ADMINISTRATIVE_CLASS` | `OUTSIDE_SUPERVISION_CLASS` | `OUTSIDE_CONFIGURATION_CLASS` | `OUTSIDE_AUDIT_CLASS` | `OUTSIDE_PERSONAL_CLASS` | `NONE`                          | La intención dominante ya está resuelta como `PRIMARY_OPERATIONAL` y la pantalla trabaja sobre operación, administración, supervisión, configuración o auditoría más allá del caso propio del actor. Que una persona la utilice no la convierte en pantalla personal.                               |
| `VSCREEN-0045` | Traslado interno de existencias                       | `nexo`     | `VPROC-0025::STEP-EXECUTE_INTERNAL_TRANSFER`                | `PRIMARY_OPERATIONAL`       | `OUTSIDE_ADMINISTRATIVE_CLASS` | `OUTSIDE_SUPERVISION_CLASS` | `OUTSIDE_CONFIGURATION_CLASS` | `OUTSIDE_AUDIT_CLASS` | `OUTSIDE_PERSONAL_CLASS` | `NONE`                          | La intención dominante ya está resuelta como `PRIMARY_OPERATIONAL` y la pantalla trabaja sobre operación, administración, supervisión, configuración o auditoría más allá del caso propio del actor. Que una persona la utilice no la convierte en pantalla personal.                               |
| `VSCREEN-0046` | Solicitud de remisión                                 | `nexo`     | `VPROC-0028::STEP-SUBMIT_REPLENISHMENT_REQUEST`             | `PRIMARY_OPERATIONAL`       | `OUTSIDE_ADMINISTRATIVE_CLASS` | `OUTSIDE_SUPERVISION_CLASS` | `OUTSIDE_CONFIGURATION_CLASS` | `OUTSIDE_AUDIT_CLASS` | `OUTSIDE_PERSONAL_CLASS` | `NONE`                          | La intención dominante ya está resuelta como `PRIMARY_OPERATIONAL` y la pantalla trabaja sobre operación, administración, supervisión, configuración o auditoría más allá del caso propio del actor. Que una persona la utilice no la convierte en pantalla personal.                               |
| `VSCREEN-0047` | Preparación de remisión                               | `nexo`     | `VPROC-0028::STEP-PREPARE_REPLENISHMENT`                    | `PRIMARY_OPERATIONAL`       | `OUTSIDE_ADMINISTRATIVE_CLASS` | `OUTSIDE_SUPERVISION_CLASS` | `OUTSIDE_CONFIGURATION_CLASS` | `OUTSIDE_AUDIT_CLASS` | `OUTSIDE_PERSONAL_CLASS` | `NONE`                          | La intención dominante ya está resuelta como `PRIMARY_OPERATIONAL` y la pantalla trabaja sobre operación, administración, supervisión, configuración o auditoría más allá del caso propio del actor. Que una persona la utilice no la convierte en pantalla personal.                               |
| `VSCREEN-0048` | Carga y despacho de remisión                          | `nexo`     | `VPROC-0028::STEP-LOAD_AND_DISPATCH_REPLENISHMENT`          | `PRIMARY_OPERATIONAL`       | `OUTSIDE_ADMINISTRATIVE_CLASS` | `OUTSIDE_SUPERVISION_CLASS` | `OUTSIDE_CONFIGURATION_CLASS` | `OUTSIDE_AUDIT_CLASS` | `OUTSIDE_PERSONAL_CLASS` | `NONE`                          | La intención dominante ya está resuelta como `PRIMARY_OPERATIONAL` y la pantalla trabaja sobre operación, administración, supervisión, configuración o auditoría más allá del caso propio del actor. Que una persona la utilice no la convierte en pantalla personal.                               |
| `VSCREEN-0049` | Seguimiento de remisión en tránsito                   | `nexo`     | `VPROC-0028::STEP-MONITOR_REPLENISHMENT_TRANSIT`            | `PRIMARY_OPERATIONAL`       | `OUTSIDE_ADMINISTRATIVE_CLASS` | `SECONDARY_SUPERVISION`     | `OUTSIDE_CONFIGURATION_CLASS` | `SECONDARY_AUDIT`     | `OUTSIDE_PERSONAL_CLASS` | `NONE`                          | La intención dominante ya está resuelta como `PRIMARY_OPERATIONAL` y la pantalla trabaja sobre operación, administración, supervisión, configuración o auditoría más allá del caso propio del actor. Que una persona la utilice no la convierte en pantalla personal.                               |
| `VSCREEN-0050` | Recepción de remisión                                 | `nexo`     | `VPROC-0028::STEP-RECEIVE_REPLENISHMENT`                    | `PRIMARY_OPERATIONAL`       | `OUTSIDE_ADMINISTRATIVE_CLASS` | `SECONDARY_SUPERVISION`     | `OUTSIDE_CONFIGURATION_CLASS` | `SECONDARY_AUDIT`     | `OUTSIDE_PERSONAL_CLASS` | `NONE`                          | La intención dominante ya está resuelta como `PRIMARY_OPERATIONAL` y la pantalla trabaja sobre operación, administración, supervisión, configuración o auditoría más allá del caso propio del actor. Que una persona la utilice no la convierte en pantalla personal.                               |
| `VSCREEN-0051` | Vencimiento, cuarentena, daño y merma                 | `nexo`     | `VPROC-0027::STEP-RESOLVE_STOCK_CONDITION`                  | `PRIMARY_OPERATIONAL`       | `SECONDARY_ADMINISTRATIVE`     | `SECONDARY_SUPERVISION`     | `OUTSIDE_CONFIGURATION_CLASS` | `SECONDARY_AUDIT`     | `OUTSIDE_PERSONAL_CLASS` | `NONE`                          | La intención dominante ya está resuelta como `PRIMARY_OPERATIONAL` y la pantalla trabaja sobre operación, administración, supervisión, configuración o auditoría más allá del caso propio del actor. Que una persona la utilice no la convierte en pantalla personal.                               |
| `VSCREEN-0052` | LPN, contenedores y reutilizables                     | `nexo`     | `VPROC-0032::STEP-MANAGE_LPN_AND_REUSABLES`                 | `PRIMARY_OPERATIONAL`       | `OUTSIDE_ADMINISTRATIVE_CLASS` | `OUTSIDE_SUPERVISION_CLASS` | `OUTSIDE_CONFIGURATION_CLASS` | `SECONDARY_AUDIT`     | `OUTSIDE_PERSONAL_CLASS` | `NONE`                          | La intención dominante ya está resuelta como `PRIMARY_OPERATIONAL` y la pantalla trabaja sobre operación, administración, supervisión, configuración o auditoría más allá del caso propio del actor. Que una persona la utilice no la convierte en pantalla personal.                               |
| `VSCREEN-0053` | Activos y custodia                                    | `nexo`     | `VPROC-0029::STEP-MANAGE_ASSET_CUSTODY`                     | `PRIMARY_OPERATIONAL`       | `SECONDARY_ADMINISTRATIVE`     | `SECONDARY_SUPERVISION`     | `OUTSIDE_CONFIGURATION_CLASS` | `SECONDARY_AUDIT`     | `OUTSIDE_PERSONAL_CLASS` | `NONE`                          | La intención dominante ya está resuelta como `PRIMARY_OPERATIONAL` y la pantalla trabaja sobre operación, administración, supervisión, configuración o auditoría más allá del caso propio del actor. Que una persona la utilice no la convierte en pantalla personal.                               |
| `VSCREEN-0054` | Etiquetas e impresión logística                       | `nexo`     | `VPROC-0024::STEP-ISSUE_LOGISTICS_LABEL`                    | `PRIMARY_OPERATIONAL`       | `OUTSIDE_ADMINISTRATIVE_CLASS` | `OUTSIDE_SUPERVISION_CLASS` | `OUTSIDE_CONFIGURATION_CLASS` | `OUTSIDE_AUDIT_CLASS` | `OUTSIDE_PERSONAL_CLASS` | `NONE`                          | La intención dominante ya está resuelta como `PRIMARY_OPERATIONAL` y la pantalla trabaja sobre operación, administración, supervisión, configuración o auditoría más allá del caso propio del actor. Que una persona la utilice no la convierte en pantalla personal.                               |
| `VSCREEN-0055` | Inicio y cola de producción                           | `fogo`     | `VPROC-0033::STEP-TRIAGE_PRODUCTION_QUEUE`                  | `SECONDARY_OPERATIONAL`     | `SECONDARY_ADMINISTRATIVE`     | `PRIMARY_SUPERVISION`       | `OUTSIDE_CONFIGURATION_CLASS` | `OUTSIDE_AUDIT_CLASS` | `OUTSIDE_PERSONAL_CLASS` | `NONE`                          | La intención dominante ya está resuelta como `PRIMARY_SUPERVISION` y la pantalla trabaja sobre operación, administración, supervisión, configuración o auditoría más allá del caso propio del actor. Que una persona la utilice no la convierte en pantalla personal.                               |
| `VSCREEN-0056` | Planeación de producción                              | `fogo`     | `VPROC-0033::STEP-PLAN_PRODUCTION`                          | `SECONDARY_OPERATIONAL`     | `SECONDARY_ADMINISTRATIVE`     | `PRIMARY_SUPERVISION`       | `OUTSIDE_CONFIGURATION_CLASS` | `OUTSIDE_AUDIT_CLASS` | `OUTSIDE_PERSONAL_CLASS` | `NONE`                          | La intención dominante ya está resuelta como `PRIMARY_SUPERVISION` y la pantalla trabaja sobre operación, administración, supervisión, configuración o auditoría más allá del caso propio del actor. Que una persona la utilice no la convierte en pantalla personal.                               |
| `VSCREEN-0057` | Preparación e inicio de lote                          | `fogo`     | `VPROC-0034::STEP-PREPARE_AND_START_BATCH`                  | `PRIMARY_OPERATIONAL`       | `OUTSIDE_ADMINISTRATIVE_CLASS` | `OUTSIDE_SUPERVISION_CLASS` | `OUTSIDE_CONFIGURATION_CLASS` | `OUTSIDE_AUDIT_CLASS` | `OUTSIDE_PERSONAL_CLASS` | `NONE`                          | La intención dominante ya está resuelta como `PRIMARY_OPERATIONAL` y la pantalla trabaja sobre operación, administración, supervisión, configuración o auditoría más allá del caso propio del actor. Que una persona la utilice no la convierte en pantalla personal.                               |
| `VSCREEN-0058` | Ejecución de lote                                     | `fogo`     | `VPROC-0034::STEP-EXECUTE_BATCH`                            | `PRIMARY_OPERATIONAL`       | `OUTSIDE_ADMINISTRATIVE_CLASS` | `OUTSIDE_SUPERVISION_CLASS` | `OUTSIDE_CONFIGURATION_CLASS` | `OUTSIDE_AUDIT_CLASS` | `OUTSIDE_PERSONAL_CLASS` | `NONE`                          | La intención dominante ya está resuelta como `PRIMARY_OPERATIONAL` y la pantalla trabaja sobre operación, administración, supervisión, configuración o auditoría más allá del caso propio del actor. Que una persona la utilice no la convierte en pantalla personal.                               |
| `VSCREEN-0059` | Registro parcial de producción                        | `fogo`     | `VPROC-0034::STEP-CAPTURE_BATCH_PROGRESS`                   | `PRIMARY_OPERATIONAL`       | `OUTSIDE_ADMINISTRATIVE_CLASS` | `SECONDARY_SUPERVISION`     | `OUTSIDE_CONFIGURATION_CLASS` | `OUTSIDE_AUDIT_CLASS` | `OUTSIDE_PERSONAL_CLASS` | `NONE`                          | La intención dominante ya está resuelta como `PRIMARY_OPERATIONAL` y la pantalla trabaja sobre operación, administración, supervisión, configuración o auditoría más allá del caso propio del actor. Que una persona la utilice no la convierte en pantalla personal.                               |
| `VSCREEN-0060` | Finalización y cierre de lote                         | `fogo`     | `VPROC-0037::STEP-CLOSE_BATCH`                              | `PRIMARY_OPERATIONAL`       | `OUTSIDE_ADMINISTRATIVE_CLASS` | `SECONDARY_SUPERVISION`     | `OUTSIDE_CONFIGURATION_CLASS` | `OUTSIDE_AUDIT_CLASS` | `OUTSIDE_PERSONAL_CLASS` | `NONE`                          | La intención dominante ya está resuelta como `PRIMARY_OPERATIONAL` y la pantalla trabaja sobre operación, administración, supervisión, configuración o auditoría más allá del caso propio del actor. Que una persona la utilice no la convierte en pantalla personal.                               |
| `VSCREEN-0061` | Receta operativa                                      | `fogo`     | `VPROC-0016::STEP-CONSULT_APPLICABLE_RECIPE`                | `PRIMARY_OPERATIONAL`       | `OUTSIDE_ADMINISTRATIVE_CLASS` | `OUTSIDE_SUPERVISION_CLASS` | `OUTSIDE_CONFIGURATION_CLASS` | `OUTSIDE_AUDIT_CLASS` | `OUTSIDE_PERSONAL_CLASS` | `NONE`                          | La intención dominante ya está resuelta como `PRIMARY_OPERATIONAL` y la pantalla trabaja sobre operación, administración, supervisión, configuración o auditoría más allá del caso propio del actor. Que una persona la utilice no la convierte en pantalla personal.                               |
| `VSCREEN-0062` | Catálogo y editor de recetas                          | `fogo`     | `VPROC-0016::STEP-AUTHOR_RECIPE`                            | `OUTSIDE_OPERATIONAL_CLASS` | `SECONDARY_ADMINISTRATIVE`     | `OUTSIDE_SUPERVISION_CLASS` | `PRIMARY_CONFIGURATION`       | `SECONDARY_AUDIT`     | `OUTSIDE_PERSONAL_CLASS` | `NONE`                          | La intención dominante ya está resuelta como `PRIMARY_CONFIGURATION` y la pantalla trabaja sobre operación, administración, supervisión, configuración o auditoría más allá del caso propio del actor. Que una persona la utilice no la convierte en pantalla personal.                             |
| `VSCREEN-0063` | Revisión, aprobación y publicación de receta          | `fogo`     | `VPROC-0016::STEP-APPROVE_AND_PUBLISH_RECIPE`               | `OUTSIDE_OPERATIONAL_CLASS` | `SECONDARY_ADMINISTRATIVE`     | `OUTSIDE_SUPERVISION_CLASS` | `PRIMARY_CONFIGURATION`       | `SECONDARY_AUDIT`     | `OUTSIDE_PERSONAL_CLASS` | `NONE`                          | La intención dominante ya está resuelta como `PRIMARY_CONFIGURATION` y la pantalla trabaja sobre operación, administración, supervisión, configuración o auditoría más allá del caso propio del actor. Que una persona la utilice no la convierte en pantalla personal.                             |
| `VSCREEN-0064` | Prueba de receta y rendimiento                        | `fogo`     | `VPROC-0016::STEP-TEST_RECIPE_AND_YIELD`                    | `PRIMARY_OPERATIONAL`       | `SECONDARY_ADMINISTRATIVE`     | `SECONDARY_SUPERVISION`     | `OUTSIDE_CONFIGURATION_CLASS` | `SECONDARY_AUDIT`     | `OUTSIDE_PERSONAL_CLASS` | `NONE`                          | La intención dominante ya está resuelta como `PRIMARY_OPERATIONAL` y la pantalla trabaja sobre operación, administración, supervisión, configuración o auditoría más allá del caso propio del actor. Que una persona la utilice no la convierte en pantalla personal.                               |
| `VSCREEN-0065` | Control de calidad y liberación                       | `fogo`     | `VPROC-0035::STEP-DECIDE_QUALITY_RELEASE`                   | `PRIMARY_OPERATIONAL`       | `SECONDARY_ADMINISTRATIVE`     | `SECONDARY_SUPERVISION`     | `OUTSIDE_CONFIGURATION_CLASS` | `SECONDARY_AUDIT`     | `OUTSIDE_PERSONAL_CLASS` | `NONE`                          | La intención dominante ya está resuelta como `PRIMARY_OPERATIONAL` y la pantalla trabaja sobre operación, administración, supervisión, configuración o auditoría más allá del caso propio del actor. Que una persona la utilice no la convierte en pantalla personal.                               |
| `VSCREEN-0066` | Empaque, etiquetado y almacenamiento de terminado     | `fogo`     | `VPROC-0036::STEP-PACK_AND_TRANSFER_FINISHED_GOOD`          | `PRIMARY_OPERATIONAL`       | `OUTSIDE_ADMINISTRATIVE_CLASS` | `OUTSIDE_SUPERVISION_CLASS` | `OUTSIDE_CONFIGURATION_CLASS` | `SECONDARY_AUDIT`     | `OUTSIDE_PERSONAL_CLASS` | `NONE`                          | La intención dominante ya está resuelta como `PRIMARY_OPERATIONAL` y la pantalla trabaja sobre operación, administración, supervisión, configuración o auditoría más allá del caso propio del actor. Que una persona la utilice no la convierte en pantalla personal.                               |
| `VSCREEN-0067` | Reproceso, aprovechamiento, merma y cierre productivo | `fogo`     | `VPROC-0037::STEP-RESOLVE_PRODUCTION_DISPOSITION`           | `PRIMARY_OPERATIONAL`       | `SECONDARY_ADMINISTRATIVE`     | `SECONDARY_SUPERVISION`     | `OUTSIDE_CONFIGURATION_CLASS` | `OUTSIDE_AUDIT_CLASS` | `OUTSIDE_PERSONAL_CLASS` | `NONE`                          | La intención dominante ya está resuelta como `PRIMARY_OPERATIONAL` y la pantalla trabaja sobre operación, administración, supervisión, configuración o auditoría más allá del caso propio del actor. Que una persona la utilice no la convierte en pantalla personal.                               |
| `VSCREEN-0068` | Bandeja de necesidades de compra                      | `origo`    | `VPROC-0019::STEP-TRIAGE_PURCHASE_NEEDS`                    | `SECONDARY_OPERATIONAL`     | `PRIMARY_ADMINISTRATIVE`       | `SECONDARY_SUPERVISION`     | `OUTSIDE_CONFIGURATION_CLASS` | `OUTSIDE_AUDIT_CLASS` | `OUTSIDE_PERSONAL_CLASS` | `NONE`                          | La intención dominante ya está resuelta como `PRIMARY_ADMINISTRATIVE` y la pantalla trabaja sobre operación, administración, supervisión, configuración o auditoría más allá del caso propio del actor. Que una persona la utilice no la convierte en pantalla personal.                            |
| `VSCREEN-0069` | Solicitud de compra                                   | `origo`    | `VPROC-0019::STEP-SUBMIT_PURCHASE_REQUEST`                  | `OUTSIDE_OPERATIONAL_CLASS` | `PRIMARY_ADMINISTRATIVE`       | `OUTSIDE_SUPERVISION_CLASS` | `OUTSIDE_CONFIGURATION_CLASS` | `OUTSIDE_AUDIT_CLASS` | `OUTSIDE_PERSONAL_CLASS` | `NONE`                          | La intención dominante ya está resuelta como `PRIMARY_ADMINISTRATIVE` y la pantalla trabaja sobre operación, administración, supervisión, configuración o auditoría más allá del caso propio del actor. Que una persona la utilice no la convierte en pantalla personal.                            |
| `VSCREEN-0070` | Catálogo de proveedores                               | `origo`    | `VPROC-0020::STEP-CONSULT_SUPPLIER_CATALOG`                 | `OUTSIDE_OPERATIONAL_CLASS` | `SECONDARY_ADMINISTRATIVE`     | `OUTSIDE_SUPERVISION_CLASS` | `PRIMARY_CONFIGURATION`       | `OUTSIDE_AUDIT_CLASS` | `OUTSIDE_PERSONAL_CLASS` | `NONE`                          | La intención dominante ya está resuelta como `PRIMARY_CONFIGURATION` y la pantalla trabaja sobre operación, administración, supervisión, configuración o auditoría más allá del caso propio del actor. Que una persona la utilice no la convierte en pantalla personal.                             |
| `VSCREEN-0071` | Alta y expediente de proveedor                        | `origo`    | `VPROC-0020::STEP-ONBOARD_SUPPLIER`                         | `OUTSIDE_OPERATIONAL_CLASS` | `PRIMARY_ADMINISTRATIVE`       | `OUTSIDE_SUPERVISION_CLASS` | `SECONDARY_CONFIGURATION`     | `SECONDARY_AUDIT`     | `OUTSIDE_PERSONAL_CLASS` | `NONE`                          | La intención dominante ya está resuelta como `PRIMARY_ADMINISTRATIVE` y la pantalla trabaja sobre operación, administración, supervisión, configuración o auditoría más allá del caso propio del actor. Que una persona la utilice no la convierte en pantalla personal.                            |
| `VSCREEN-0072` | Comparación de cotizaciones                           | `origo`    | `VPROC-0020::STEP-COMPARE_QUOTES`                           | `OUTSIDE_OPERATIONAL_CLASS` | `PRIMARY_ADMINISTRATIVE`       | `OUTSIDE_SUPERVISION_CLASS` | `OUTSIDE_CONFIGURATION_CLASS` | `SECONDARY_AUDIT`     | `OUTSIDE_PERSONAL_CLASS` | `NONE`                          | La intención dominante ya está resuelta como `PRIMARY_ADMINISTRATIVE` y la pantalla trabaja sobre operación, administración, supervisión, configuración o auditoría más allá del caso propio del actor. Que una persona la utilice no la convierte en pantalla personal.                            |
| `VSCREEN-0073` | Editor de orden de compra                             | `origo`    | `VPROC-0021::STEP-PREPARE_PURCHASE_ORDER`                   | `OUTSIDE_OPERATIONAL_CLASS` | `PRIMARY_ADMINISTRATIVE`       | `OUTSIDE_SUPERVISION_CLASS` | `OUTSIDE_CONFIGURATION_CLASS` | `SECONDARY_AUDIT`     | `OUTSIDE_PERSONAL_CLASS` | `NONE`                          | La intención dominante ya está resuelta como `PRIMARY_ADMINISTRATIVE` y la pantalla trabaja sobre operación, administración, supervisión, configuración o auditoría más allá del caso propio del actor. Que una persona la utilice no la convierte en pantalla personal.                            |
| `VSCREEN-0074` | Bandeja de aprobaciones de compra                     | `origo`    | `VPROC-0021::STEP-APPROVE_PURCHASE`                         | `OUTSIDE_OPERATIONAL_CLASS` | `PRIMARY_ADMINISTRATIVE`       | `SECONDARY_SUPERVISION`     | `OUTSIDE_CONFIGURATION_CLASS` | `SECONDARY_AUDIT`     | `OUTSIDE_PERSONAL_CLASS` | `NONE`                          | La intención dominante ya está resuelta como `PRIMARY_ADMINISTRATIVE` y la pantalla trabaja sobre operación, administración, supervisión, configuración o auditoría más allá del caso propio del actor. Que una persona la utilice no la convierte en pantalla personal.                            |
| `VSCREEN-0075` | Detalle y seguimiento de orden                        | `origo`    | `VPROC-0021::STEP-MONITOR_PURCHASE_ORDER`                   | `SECONDARY_OPERATIONAL`     | `PRIMARY_ADMINISTRATIVE`       | `SECONDARY_SUPERVISION`     | `OUTSIDE_CONFIGURATION_CLASS` | `SECONDARY_AUDIT`     | `OUTSIDE_PERSONAL_CLASS` | `NONE`                          | La intención dominante ya está resuelta como `PRIMARY_ADMINISTRATIVE` y la pantalla trabaja sobre operación, administración, supervisión, configuración o auditoría más allá del caso propio del actor. Que una persona la utilice no la convierte en pantalla personal.                            |
| `VSCREEN-0076` | Cola de recepciones                                   | `origo`    | `VPROC-0022::STEP-TRIAGE_RECEIPT_QUEUE`                     | `SECONDARY_OPERATIONAL`     | `SECONDARY_ADMINISTRATIVE`     | `PRIMARY_SUPERVISION`       | `OUTSIDE_CONFIGURATION_CLASS` | `OUTSIDE_AUDIT_CLASS` | `OUTSIDE_PERSONAL_CLASS` | `NONE`                          | La intención dominante ya está resuelta como `PRIMARY_SUPERVISION` y la pantalla trabaja sobre operación, administración, supervisión, configuración o auditoría más allá del caso propio del actor. Que una persona la utilice no la convierte en pantalla personal.                               |
| `VSCREEN-0077` | Recepción total o parcial                             | `origo`    | `VPROC-0022::STEP-RECEIVE_PURCHASE`                         | `PRIMARY_OPERATIONAL`       | `SECONDARY_ADMINISTRATIVE`     | `SECONDARY_SUPERVISION`     | `OUTSIDE_CONFIGURATION_CLASS` | `SECONDARY_AUDIT`     | `OUTSIDE_PERSONAL_CLASS` | `NONE`                          | La intención dominante ya está resuelta como `PRIMARY_OPERATIONAL` y la pantalla trabaja sobre operación, administración, supervisión, configuración o auditoría más allá del caso propio del actor. Que una persona la utilice no la convierte en pantalla personal.                               |
| `VSCREEN-0078` | Resolución de diferencias de recepción                | `origo`    | `VPROC-0022::STEP-RESOLVE_RECEIPT_VARIANCE`                 | `PRIMARY_OPERATIONAL`       | `SECONDARY_ADMINISTRATIVE`     | `SECONDARY_SUPERVISION`     | `OUTSIDE_CONFIGURATION_CLASS` | `SECONDARY_AUDIT`     | `OUTSIDE_PERSONAL_CLASS` | `NONE`                          | La intención dominante ya está resuelta como `PRIMARY_OPERATIONAL` y la pantalla trabaja sobre operación, administración, supervisión, configuración o auditoría más allá del caso propio del actor. Que una persona la utilice no la convierte en pantalla personal.                               |
| `VSCREEN-0079` | Historial y auditoría de abastecimiento               | `origo`    | `VPROC-0022::STEP-AUDIT_PROCUREMENT_CYCLE`                  | `OUTSIDE_OPERATIONAL_CLASS` | `SECONDARY_ADMINISTRATIVE`     | `OUTSIDE_SUPERVISION_CLASS` | `OUTSIDE_CONFIGURATION_CLASS` | `PRIMARY_AUDIT`       | `OUTSIDE_PERSONAL_CLASS` | `NONE`                          | La intención dominante ya está resuelta como `PRIMARY_AUDIT` y la pantalla trabaja sobre operación, administración, supervisión, configuración o auditoría más allá del caso propio del actor. Que una persona la utilice no la convierte en pantalla personal.                                     |
| `VSCREEN-0080` | Inicio POS                                            | `pulso`    | `VPROC-0039::STEP-ENTER_POS_WORKSPACE`                      | `PRIMARY_OPERATIONAL`       | `OUTSIDE_ADMINISTRATIVE_CLASS` | `SECONDARY_SUPERVISION`     | `OUTSIDE_CONFIGURATION_CLASS` | `OUTSIDE_AUDIT_CLASS` | `OUTSIDE_PERSONAL_CLASS` | `NONE`                          | La intención dominante ya está resuelta como `PRIMARY_OPERATIONAL` y la pantalla trabaja sobre operación, administración, supervisión, configuración o auditoría más allá del caso propio del actor. Que una persona la utilice no la convierte en pantalla personal.                               |
| `VSCREEN-0081` | Creación de venta o pedido                            | `pulso`    | `VPROC-0039::STEP-CREATE_SALE_OR_ORDER`                     | `PRIMARY_OPERATIONAL`       | `OUTSIDE_ADMINISTRATIVE_CLASS` | `OUTSIDE_SUPERVISION_CLASS` | `OUTSIDE_CONFIGURATION_CLASS` | `OUTSIDE_AUDIT_CLASS` | `OUTSIDE_PERSONAL_CLASS` | `NONE`                          | La intención dominante ya está resuelta como `PRIMARY_OPERATIONAL` y la pantalla trabaja sobre operación, administración, supervisión, configuración o auditoría más allá del caso propio del actor. Que una persona la utilice no la convierte en pantalla personal.                               |
| `VSCREEN-0082` | Mapa de salón y mesas                                 | `pulso`    | `VPROC-0038::STEP-MANAGE_TABLE_SERVICE`                     | `PRIMARY_OPERATIONAL`       | `OUTSIDE_ADMINISTRATIVE_CLASS` | `SECONDARY_SUPERVISION`     | `OUTSIDE_CONFIGURATION_CLASS` | `OUTSIDE_AUDIT_CLASS` | `OUTSIDE_PERSONAL_CLASS` | `NONE`                          | La intención dominante ya está resuelta como `PRIMARY_OPERATIONAL` y la pantalla trabaja sobre operación, administración, supervisión, configuración o auditoría más allá del caso propio del actor. Que una persona la utilice no la convierte en pantalla personal.                               |
| `VSCREEN-0083` | Detalle y modificación de pedido                      | `pulso`    | `VPROC-0038::STEP-MODIFY_ACTIVE_ORDER`                      | `PRIMARY_OPERATIONAL`       | `OUTSIDE_ADMINISTRATIVE_CLASS` | `OUTSIDE_SUPERVISION_CLASS` | `OUTSIDE_CONFIGURATION_CLASS` | `SECONDARY_AUDIT`     | `OUTSIDE_PERSONAL_CLASS` | `NONE`                          | La intención dominante ya está resuelta como `PRIMARY_OPERATIONAL` y la pantalla trabaja sobre operación, administración, supervisión, configuración o auditoría más allá del caso propio del actor. Que una persona la utilice no la convierte en pantalla personal.                               |
| `VSCREEN-0084` | Cobro y medios de pago                                | `pulso`    | `VPROC-0043::STEP-COLLECT_PAYMENT`                          | `PRIMARY_OPERATIONAL`       | `OUTSIDE_ADMINISTRATIVE_CLASS` | `OUTSIDE_SUPERVISION_CLASS` | `OUTSIDE_CONFIGURATION_CLASS` | `SECONDARY_AUDIT`     | `OUTSIDE_PERSONAL_CLASS` | `NONE`                          | La intención dominante ya está resuelta como `PRIMARY_OPERATIONAL` y la pantalla trabaja sobre operación, administración, supervisión, configuración o auditoría más allá del caso propio del actor. Que una persona la utilice no la convierte en pantalla personal.                               |
| `VSCREEN-0085` | Identificación de cliente y acumulación               | `pulso`    | `VPROC-0045::STEP-IDENTIFY_CUSTOMER_AND_ACCRUE`             | `PRIMARY_OPERATIONAL`       | `OUTSIDE_ADMINISTRATIVE_CLASS` | `OUTSIDE_SUPERVISION_CLASS` | `OUTSIDE_CONFIGURATION_CLASS` | `OUTSIDE_AUDIT_CLASS` | `OUTSIDE_PERSONAL_CLASS` | `NONE`                          | La intención dominante ya está resuelta como `PRIMARY_OPERATIONAL` y la pantalla trabaja sobre operación, administración, supervisión, configuración o auditoría más allá del caso propio del actor. Que una persona la utilice no la convierte en pantalla personal.                               |
| `VSCREEN-0086` | Redención de puntos o beneficios                      | `pulso`    | `VPROC-0045::STEP-REDEEM_LOYALTY_VALUE`                     | `PRIMARY_OPERATIONAL`       | `OUTSIDE_ADMINISTRATIVE_CLASS` | `OUTSIDE_SUPERVISION_CLASS` | `OUTSIDE_CONFIGURATION_CLASS` | `SECONDARY_AUDIT`     | `OUTSIDE_PERSONAL_CLASS` | `NONE`                          | La intención dominante ya está resuelta como `PRIMARY_OPERATIONAL` y la pantalla trabaja sobre operación, administración, supervisión, configuración o auditoría más allá del caso propio del actor. Que una persona la utilice no la convierte en pantalla personal.                               |
| `VSCREEN-0087` | Bandeja de pedidos de canales externos                | `pulso`    | `VPROC-0040::STEP-ADMIT_EXTERNAL_ORDER`                     | `PRIMARY_OPERATIONAL`       | `OUTSIDE_ADMINISTRATIVE_CLASS` | `SECONDARY_SUPERVISION`     | `OUTSIDE_CONFIGURATION_CLASS` | `SECONDARY_AUDIT`     | `OUTSIDE_PERSONAL_CLASS` | `NONE`                          | La intención dominante ya está resuelta como `PRIMARY_OPERATIONAL` y la pantalla trabaja sobre operación, administración, supervisión, configuración o auditoría más allá del caso propio del actor. Que una persona la utilice no la convierte en pantalla personal.                               |
| `VSCREEN-0088` | Seguimiento de preparación y entrega                  | `pulso`    | `VPROC-0039::STEP-MONITOR_ORDER_FULFILLMENT`                | `PRIMARY_OPERATIONAL`       | `OUTSIDE_ADMINISTRATIVE_CLASS` | `SECONDARY_SUPERVISION`     | `OUTSIDE_CONFIGURATION_CLASS` | `SECONDARY_AUDIT`     | `OUTSIDE_PERSONAL_CLASS` | `NONE`                          | La intención dominante ya está resuelta como `PRIMARY_OPERATIONAL` y la pantalla trabaja sobre operación, administración, supervisión, configuración o auditoría más allá del caso propio del actor. Que una persona la utilice no la convierte en pantalla personal.                               |
| `VSCREEN-0089` | Apertura de caja                                      | `pulso`    | `VPROC-0044::STEP-OPEN_CASH_SESSION`                        | `PRIMARY_OPERATIONAL`       | `OUTSIDE_ADMINISTRATIVE_CLASS` | `OUTSIDE_SUPERVISION_CLASS` | `OUTSIDE_CONFIGURATION_CLASS` | `SECONDARY_AUDIT`     | `OUTSIDE_PERSONAL_CLASS` | `NONE`                          | La intención dominante ya está resuelta como `PRIMARY_OPERATIONAL` y la pantalla trabaja sobre operación, administración, supervisión, configuración o auditoría más allá del caso propio del actor. Que una persona la utilice no la convierte en pantalla personal.                               |
| `VSCREEN-0090` | Cierre de caja                                        | `pulso`    | `VPROC-0044::STEP-CLOSE_CASH_SESSION`                       | `PRIMARY_OPERATIONAL`       | `SECONDARY_ADMINISTRATIVE`     | `SECONDARY_SUPERVISION`     | `OUTSIDE_CONFIGURATION_CLASS` | `SECONDARY_AUDIT`     | `OUTSIDE_PERSONAL_CLASS` | `NONE`                          | La intención dominante ya está resuelta como `PRIMARY_OPERATIONAL` y la pantalla trabaja sobre operación, administración, supervisión, configuración o auditoría más allá del caso propio del actor. Que una persona la utilice no la convierte en pantalla personal.                               |
| `VSCREEN-0091` | Anulación, devolución y reembolso                     | `pulso`    | `VPROC-0042::STEP-RESOLVE_REVERSAL_OR_REFUND`               | `PRIMARY_OPERATIONAL`       | `SECONDARY_ADMINISTRATIVE`     | `SECONDARY_SUPERVISION`     | `OUTSIDE_CONFIGURATION_CLASS` | `SECONDARY_AUDIT`     | `OUTSIDE_PERSONAL_CLASS` | `NONE`                          | La intención dominante ya está resuelta como `PRIMARY_OPERATIONAL` y la pantalla trabaja sobre operación, administración, supervisión, configuración o auditoría más allá del caso propio del actor. Que una persona la utilice no la convierte en pantalla personal.                               |
| `VSCREEN-0092` | Oferta, menú, precio comercial y disponibilidad       | `pulso`    | `VPROC-0017::STEP-PUBLISH_COMMERCIAL_OFFER`                 | `OUTSIDE_OPERATIONAL_CLASS` | `SECONDARY_ADMINISTRATIVE`     | `OUTSIDE_SUPERVISION_CLASS` | `PRIMARY_CONFIGURATION`       | `SECONDARY_AUDIT`     | `OUTSIDE_PERSONAL_CLASS` | `NONE`                          | La intención dominante ya está resuelta como `PRIMARY_CONFIGURATION` y la pantalla trabaja sobre operación, administración, supervisión, configuración o auditoría más allá del caso propio del actor. Que una persona la utilice no la convierte en pantalla personal.                             |
| `VSCREEN-0093` | Revisión de ventas, caja y terminales                 | `pulso`    | `VPROC-0044::STEP-REVIEW_SALES_AND_TERMINALS`               | `SECONDARY_OPERATIONAL`     | `SECONDARY_ADMINISTRATIVE`     | `PRIMARY_SUPERVISION`       | `OUTSIDE_CONFIGURATION_CLASS` | `SECONDARY_AUDIT`     | `OUTSIDE_PERSONAL_CLASS` | `NONE`                          | La intención dominante ya está resuelta como `PRIMARY_SUPERVISION` y la pantalla trabaja sobre operación, administración, supervisión, configuración o auditoría más allá del caso propio del actor. Que una persona la utilice no la convierte en pantalla personal.                               |
| `VSCREEN-0094` | Inicio financiero y ejecutivo                         | `numera`   | `VPROC-0061::STEP-REVIEW_FINANCIAL_POSITION`                | `OUTSIDE_OPERATIONAL_CLASS` | `SECONDARY_ADMINISTRATIVE`     | `PRIMARY_SUPERVISION`       | `OUTSIDE_CONFIGURATION_CLASS` | `OUTSIDE_AUDIT_CLASS` | `OUTSIDE_PERSONAL_CLASS` | `NONE`                          | La intención dominante ya está resuelta como `PRIMARY_SUPERVISION` y la pantalla trabaja sobre operación, administración, supervisión, configuración o auditoría más allá del caso propio del actor. Que una persona la utilice no la convierte en pantalla personal.                               |
| `VSCREEN-0095` | Bandeja de hechos económicos                          | `numera`   | `VPROC-0051::STEP-TRIAGE_ECONOMIC_FACTS`                    | `OUTSIDE_OPERATIONAL_CLASS` | `PRIMARY_ADMINISTRATIVE`       | `OUTSIDE_SUPERVISION_CLASS` | `OUTSIDE_CONFIGURATION_CLASS` | `SECONDARY_AUDIT`     | `OUTSIDE_PERSONAL_CLASS` | `NONE`                          | La intención dominante ya está resuelta como `PRIMARY_ADMINISTRATIVE` y la pantalla trabaja sobre operación, administración, supervisión, configuración o auditoría más allá del caso propio del actor. Que una persona la utilice no la convierte en pantalla personal.                            |
| `VSCREEN-0096` | Registro de gasto y soporte                           | `numera`   | `VPROC-0051::STEP-CAPTURE_EXPENSE_AND_EVIDENCE`             | `OUTSIDE_OPERATIONAL_CLASS` | `PRIMARY_ADMINISTRATIVE`       | `OUTSIDE_SUPERVISION_CLASS` | `OUTSIDE_CONFIGURATION_CLASS` | `SECONDARY_AUDIT`     | `OUTSIDE_PERSONAL_CLASS` | `NONE`                          | La intención dominante ya está resuelta como `PRIMARY_ADMINISTRATIVE` y la pantalla trabaja sobre operación, administración, supervisión, configuración o auditoría más allá del caso propio del actor. Que una persona la utilice no la convierte en pantalla personal.                            |
| `VSCREEN-0097` | Bandeja de aprobaciones financieras                   | `numera`   | `VPROC-0052::STEP-APPROVE_FINANCIAL_DECISION`               | `OUTSIDE_OPERATIONAL_CLASS` | `PRIMARY_ADMINISTRATIVE`       | `SECONDARY_SUPERVISION`     | `OUTSIDE_CONFIGURATION_CLASS` | `SECONDARY_AUDIT`     | `OUTSIDE_PERSONAL_CLASS` | `NONE`                          | La intención dominante ya está resuelta como `PRIMARY_ADMINISTRATIVE` y la pantalla trabaja sobre operación, administración, supervisión, configuración o auditoría más allá del caso propio del actor. Que una persona la utilice no la convierte en pantalla personal.                            |
| `VSCREEN-0098` | Cuentas por pagar y obligaciones                      | `numera`   | `VPROC-0052::STEP-MANAGE_PAYABLE_OBLIGATION`                | `OUTSIDE_OPERATIONAL_CLASS` | `PRIMARY_ADMINISTRATIVE`       | `OUTSIDE_SUPERVISION_CLASS` | `OUTSIDE_CONFIGURATION_CLASS` | `SECONDARY_AUDIT`     | `OUTSIDE_PERSONAL_CLASS` | `NONE`                          | La intención dominante ya está resuelta como `PRIMARY_ADMINISTRATIVE` y la pantalla trabaja sobre operación, administración, supervisión, configuración o auditoría más allá del caso propio del actor. Que una persona la utilice no la convierte en pantalla personal.                            |
| `VSCREEN-0099` | Cuentas por cobrar y cartera                          | `numera`   | `VPROC-0053::STEP-MANAGE_RECEIVABLE`                        | `OUTSIDE_OPERATIONAL_CLASS` | `PRIMARY_ADMINISTRATIVE`       | `OUTSIDE_SUPERVISION_CLASS` | `OUTSIDE_CONFIGURATION_CLASS` | `SECONDARY_AUDIT`     | `OUTSIDE_PERSONAL_CLASS` | `NONE`                          | La intención dominante ya está resuelta como `PRIMARY_ADMINISTRATIVE` y la pantalla trabaja sobre operación, administración, supervisión, configuración o auditoría más allá del caso propio del actor. Que una persona la utilice no la convierte en pantalla personal.                            |
| `VSCREEN-0100` | Caja, bancos y movimientos financieros                | `numera`   | `VPROC-0052::STEP-EXECUTE_TREASURY_MOVEMENT`                | `OUTSIDE_OPERATIONAL_CLASS` | `PRIMARY_ADMINISTRATIVE`       | `OUTSIDE_SUPERVISION_CLASS` | `OUTSIDE_CONFIGURATION_CLASS` | `SECONDARY_AUDIT`     | `OUTSIDE_PERSONAL_CLASS` | `NONE`                          | La intención dominante ya está resuelta como `PRIMARY_ADMINISTRATIVE` y la pantalla trabaja sobre operación, administración, supervisión, configuración o auditoría más allá del caso propio del actor. Que una persona la utilice no la convierte en pantalla personal.                            |
| `VSCREEN-0101` | Conciliación de ventas y pagos                        | `numera`   | `VPROC-0051::STEP-RECONCILE_SALES_AND_PAYMENTS`             | `OUTSIDE_OPERATIONAL_CLASS` | `PRIMARY_ADMINISTRATIVE`       | `SECONDARY_SUPERVISION`     | `OUTSIDE_CONFIGURATION_CLASS` | `SECONDARY_AUDIT`     | `OUTSIDE_PERSONAL_CLASS` | `NONE`                          | La intención dominante ya está resuelta como `PRIMARY_ADMINISTRATIVE` y la pantalla trabaja sobre operación, administración, supervisión, configuración o auditoría más allá del caso propio del actor. Que una persona la utilice no la convierte en pantalla personal.                            |
| `VSCREEN-0102` | Conciliación de compras y recepciones                 | `numera`   | `VPROC-0051::STEP-RECONCILE_PURCHASES_AND_RECEIPTS`         | `OUTSIDE_OPERATIONAL_CLASS` | `PRIMARY_ADMINISTRATIVE`       | `SECONDARY_SUPERVISION`     | `OUTSIDE_CONFIGURATION_CLASS` | `SECONDARY_AUDIT`     | `OUTSIDE_PERSONAL_CLASS` | `NONE`                          | La intención dominante ya está resuelta como `PRIMARY_ADMINISTRATIVE` y la pantalla trabaja sobre operación, administración, supervisión, configuración o auditoría más allá del caso propio del actor. Que una persona la utilice no la convierte en pantalla personal.                            |
| `VSCREEN-0103` | Conciliación de inventario, producción y variaciones  | `numera`   | `VPROC-0054::STEP-RECONCILE_OPERATING_VARIANCES`            | `OUTSIDE_OPERATIONAL_CLASS` | `PRIMARY_ADMINISTRATIVE`       | `SECONDARY_SUPERVISION`     | `OUTSIDE_CONFIGURATION_CLASS` | `SECONDARY_AUDIT`     | `OUTSIDE_PERSONAL_CLASS` | `NONE`                          | La intención dominante ya está resuelta como `PRIMARY_ADMINISTRATIVE` y la pantalla trabaja sobre operación, administración, supervisión, configuración o auditoría más allá del caso propio del actor. Que una persona la utilice no la convierte en pantalla personal.                            |
| `VSCREEN-0104` | Costos, rentabilidad y escenarios                     | `numera`   | `VPROC-0054::STEP-ANALYZE_COST_AND_PROFITABILITY`           | `OUTSIDE_OPERATIONAL_CLASS` | `PRIMARY_ADMINISTRATIVE`       | `SECONDARY_SUPERVISION`     | `OUTSIDE_CONFIGURATION_CLASS` | `OUTSIDE_AUDIT_CLASS` | `OUTSIDE_PERSONAL_CLASS` | `NONE`                          | La intención dominante ya está resuelta como `PRIMARY_ADMINISTRATIVE` y la pantalla trabaja sobre operación, administración, supervisión, configuración o auditoría más allá del caso propio del actor. Que una persona la utilice no la convierte en pantalla personal.                            |
| `VSCREEN-0105` | Cierre, reapertura y corrección de periodo            | `numera`   | `VPROC-0054::STEP-CLOSE_OR_REOPEN_PERIOD`                   | `OUTSIDE_OPERATIONAL_CLASS` | `PRIMARY_ADMINISTRATIVE`       | `SECONDARY_SUPERVISION`     | `OUTSIDE_CONFIGURATION_CLASS` | `SECONDARY_AUDIT`     | `OUTSIDE_PERSONAL_CLASS` | `NONE`                          | La intención dominante ya está resuelta como `PRIMARY_ADMINISTRATIVE` y la pantalla trabaja sobre operación, administración, supervisión, configuración o auditoría más allá del caso propio del actor. Que una persona la utilice no la convierte en pantalla personal.                            |
| `VSCREEN-0106` | Reportes y exportaciones financieras                  | `numera`   | `VPROC-0061::STEP-PUBLISH_FINANCIAL_REPORT`                 | `OUTSIDE_OPERATIONAL_CLASS` | `SECONDARY_ADMINISTRATIVE`     | `OUTSIDE_SUPERVISION_CLASS` | `OUTSIDE_CONFIGURATION_CLASS` | `PRIMARY_AUDIT`       | `OUTSIDE_PERSONAL_CLASS` | `NONE`                          | La intención dominante ya está resuelta como `PRIMARY_AUDIT` y la pantalla trabaja sobre operación, administración, supervisión, configuración o auditoría más allá del caso propio del actor. Que una persona la utilice no la convierte en pantalla personal.                                     |
| `VSCREEN-0107` | Inicio del cliente y resumen de beneficios            | `pass`     | `VPROC-0045::STEP-ENTER_LOYALTY_HOME`                       | `OUTSIDE_OPERATIONAL_CLASS` | `OUTSIDE_ADMINISTRATIVE_CLASS` | `OUTSIDE_SUPERVISION_CLASS` | `OUTSIDE_CONFIGURATION_CLASS` | `OUTSIDE_AUDIT_CLASS` | `OUTSIDE_PERSONAL_CLASS` | `NONE`                          | La superficie pertenece al canal de cliente y su clase primaria se resolverá exclusivamente en PROC-SCREEN-011; no se reutiliza PERSONAL para absorber la experiencia de cliente.                                                                                                                   |
| `VSCREEN-0108` | QR personal de identificación                         | `pass`     | `VPROC-0045::STEP-PRESENT_CUSTOMER_ID`                      | `OUTSIDE_OPERATIONAL_CLASS` | `OUTSIDE_ADMINISTRATIVE_CLASS` | `OUTSIDE_SUPERVISION_CLASS` | `OUTSIDE_CONFIGURATION_CLASS` | `OUTSIDE_AUDIT_CLASS` | `OUTSIDE_PERSONAL_CLASS` | `NONE`                          | La superficie pertenece al canal de cliente y su clase primaria se resolverá exclusivamente en PROC-SCREEN-011; no se reutiliza PERSONAL para absorber la experiencia de cliente.                                                                                                                   |
| `VSCREEN-0109` | Catálogo de beneficios y recompensas                  | `pass`     | `VPROC-0045::STEP-CONSULT_REWARDS_CATALOG`                  | `OUTSIDE_OPERATIONAL_CLASS` | `OUTSIDE_ADMINISTRATIVE_CLASS` | `OUTSIDE_SUPERVISION_CLASS` | `OUTSIDE_CONFIGURATION_CLASS` | `OUTSIDE_AUDIT_CLASS` | `OUTSIDE_PERSONAL_CLASS` | `NONE`                          | La superficie pertenece al canal de cliente y su clase primaria se resolverá exclusivamente en PROC-SCREEN-011; no se reutiliza PERSONAL para absorber la experiencia de cliente.                                                                                                                   |
| `VSCREEN-0110` | Ticket o QR de redención                              | `pass`     | `VPROC-0045::STEP-CREATE_REDEMPTION_INTENT`                 | `OUTSIDE_OPERATIONAL_CLASS` | `OUTSIDE_ADMINISTRATIVE_CLASS` | `OUTSIDE_SUPERVISION_CLASS` | `OUTSIDE_CONFIGURATION_CLASS` | `SECONDARY_AUDIT`     | `OUTSIDE_PERSONAL_CLASS` | `NONE`                          | La superficie pertenece al canal de cliente y su clase primaria se resolverá exclusivamente en PROC-SCREEN-011; no se reutiliza PERSONAL para absorber la experiencia de cliente.                                                                                                                   |
| `VSCREEN-0111` | Historial de puntos y redenciones                     | `pass`     | `VPROC-0045::STEP-AUDIT_PERSONAL_LOYALTY_LEDGER`            | `OUTSIDE_OPERATIONAL_CLASS` | `OUTSIDE_ADMINISTRATIVE_CLASS` | `OUTSIDE_SUPERVISION_CLASS` | `OUTSIDE_CONFIGURATION_CLASS` | `SECONDARY_AUDIT`     | `OUTSIDE_PERSONAL_CLASS` | `NONE`                          | La superficie pertenece al canal de cliente y su clase primaria se resolverá exclusivamente en PROC-SCREEN-011; no se reutiliza PERSONAL para absorber la experiencia de cliente.                                                                                                                   |
| `VSCREEN-0112` | Perfil, privacidad y consentimientos                  | `pass`     | `VPROC-0045::STEP-MAINTAIN_CUSTOMER_PROFILE_AND_CONSENT`    | `OUTSIDE_OPERATIONAL_CLASS` | `OUTSIDE_ADMINISTRATIVE_CLASS` | `OUTSIDE_SUPERVISION_CLASS` | `OUTSIDE_CONFIGURATION_CLASS` | `OUTSIDE_AUDIT_CLASS` | `OUTSIDE_PERSONAL_CLASS` | `NONE`                          | La superficie pertenece al canal de cliente y su clase primaria se resolverá exclusivamente en PROC-SCREEN-011; no se reutiliza PERSONAL para absorber la experiencia de cliente.                                                                                                                   |
| `VSCREEN-0113` | Registro y seguimiento de decisiones empresariales    | `viso`     | `VPROC-0001::STEP-RECORD_AND_TRACK_DECISION`                | `OUTSIDE_OPERATIONAL_CLASS` | `PRIMARY_ADMINISTRATIVE`       | `SECONDARY_SUPERVISION`     | `OUTSIDE_CONFIGURATION_CLASS` | `SECONDARY_AUDIT`     | `OUTSIDE_PERSONAL_CLASS` | `NONE`                          | La intención dominante ya está resuelta como `PRIMARY_ADMINISTRATIVE` y la pantalla trabaja sobre operación, administración, supervisión, configuración o auditoría más allá del caso propio del actor. Que una persona la utilice no la convierte en pantalla personal.                            |
| `VSCREEN-0114` | Solicitudes y certificaciones de acceso               | `viso`     | `VPROC-0059::STEP-REVIEW_AND_CERTIFY_ACCESS`                | `OUTSIDE_OPERATIONAL_CLASS` | `PRIMARY_ADMINISTRATIVE`       | `SECONDARY_SUPERVISION`     | `OUTSIDE_CONFIGURATION_CLASS` | `SECONDARY_AUDIT`     | `OUTSIDE_PERSONAL_CLASS` | `NONE`                          | La intención dominante ya está resuelta como `PRIMARY_ADMINISTRATIVE` y la pantalla trabaja sobre operación, administración, supervisión, configuración o auditoría más allá del caso propio del actor. Que una persona la utilice no la convierte en pantalla personal.                            |
| `VSCREEN-0115` | Gobierno de documentos y evidencia                    | `viso`     | `VPROC-0060::STEP-GOVERN_DOCUMENT_EVIDENCE`                 | `OUTSIDE_OPERATIONAL_CLASS` | `PRIMARY_ADMINISTRATIVE`       | `OUTSIDE_SUPERVISION_CLASS` | `SECONDARY_CONFIGURATION`     | `SECONDARY_AUDIT`     | `OUTSIDE_PERSONAL_CLASS` | `NONE`                          | La intención dominante ya está resuelta como `PRIMARY_ADMINISTRATIVE` y la pantalla trabaja sobre operación, administración, supervisión, configuración o auditoría más allá del caso propio del actor. Que una persona la utilice no la convierte en pantalla personal.                            |
| `VSCREEN-0116` | Registro de riesgos empresariales                     | `viso`     | `VPROC-0063::STEP-ASSESS_ENTERPRISE_RISK`                   | `OUTSIDE_OPERATIONAL_CLASS` | `PRIMARY_ADMINISTRATIVE`       | `SECONDARY_SUPERVISION`     | `OUTSIDE_CONFIGURATION_CLASS` | `OUTSIDE_AUDIT_CLASS` | `OUTSIDE_PERSONAL_CLASS` | `NONE`                          | La intención dominante ya está resuelta como `PRIMARY_ADMINISTRATIVE` y la pantalla trabaja sobre operación, administración, supervisión, configuración o auditoría más allá del caso propio del actor. Que una persona la utilice no la convierte en pantalla personal.                            |
| `VSCREEN-0117` | Requerimientos de asesores y autoridades              | `viso`     | `VPROC-0064::STEP-MANAGE_EXTERNAL_REQUIREMENT`              | `OUTSIDE_OPERATIONAL_CLASS` | `PRIMARY_ADMINISTRATIVE`       | `SECONDARY_SUPERVISION`     | `OUTSIDE_CONFIGURATION_CLASS` | `SECONDARY_AUDIT`     | `OUTSIDE_PERSONAL_CLASS` | `NONE`                          | La intención dominante ya está resuelta como `PRIMARY_ADMINISTRATIVE` y la pantalla trabaja sobre operación, administración, supervisión, configuración o auditoría más allá del caso propio del actor. Que una persona la utilice no la convierte en pantalla personal.                            |
| `VSCREEN-0118` | Gestión de desempeño y desarrollo                     | `viso`     | `VPROC-0065::STEP-REVIEW_PERFORMANCE_AND_DEVELOPMENT`       | `OUTSIDE_OPERATIONAL_CLASS` | `PRIMARY_ADMINISTRATIVE`       | `SECONDARY_SUPERVISION`     | `OUTSIDE_CONFIGURATION_CLASS` | `OUTSIDE_AUDIT_CLASS` | `OUTSIDE_PERSONAL_CLASS` | `NONE`                          | La intención dominante ya está resuelta como `PRIMARY_ADMINISTRATIVE` y la pantalla trabaja sobre operación, administración, supervisión, configuración o auditoría más allá del caso propio del actor. Que una persona la utilice no la convierte en pantalla personal.                            |
| `VSCREEN-0119` | Asignación y control de elementos de protección       | `viso`     | `VPROC-0066::STEP-ASSIGN_PROTECTIVE_EQUIPMENT`              | `SECONDARY_OPERATIONAL`     | `PRIMARY_ADMINISTRATIVE`       | `SECONDARY_SUPERVISION`     | `OUTSIDE_CONFIGURATION_CLASS` | `SECONDARY_AUDIT`     | `OUTSIDE_PERSONAL_CLASS` | `NONE`                          | La intención dominante ya está resuelta como `PRIMARY_ADMINISTRATIVE` y la pantalla trabaja sobre operación, administración, supervisión, configuración o auditoría más allá del caso propio del actor. Que una persona la utilice no la convierte en pantalla personal.                            |
| `VSCREEN-0120` | Mesa de servicio tecnológico                          | `viso`     | `VPROC-0058::STEP-RESOLVE_TECH_SERVICE_CASE`                | `SECONDARY_OPERATIONAL`     | `PRIMARY_ADMINISTRATIVE`       | `SECONDARY_SUPERVISION`     | `OUTSIDE_CONFIGURATION_CLASS` | `SECONDARY_AUDIT`     | `OUTSIDE_PERSONAL_CLASS` | `NONE`                          | La intención dominante ya está resuelta como `PRIMARY_ADMINISTRATIVE` y la pantalla trabaja sobre operación, administración, supervisión, configuración o auditoría más allá del caso propio del actor. Que una persona la utilice no la convierte en pantalla personal.                            |
| `VSCREEN-0121` | Continuidad, contingencia y recuperación              | `viso`     | `VPROC-0062::STEP-ACTIVATE_AND_RECOVER_CONTINUITY`          | `SECONDARY_OPERATIONAL`     | `PRIMARY_ADMINISTRATIVE`       | `SECONDARY_SUPERVISION`     | `SECONDARY_CONFIGURATION`     | `SECONDARY_AUDIT`     | `OUTSIDE_PERSONAL_CLASS` | `NONE`                          | La intención dominante ya está resuelta como `PRIMARY_ADMINISTRATIVE` y la pantalla trabaja sobre operación, administración, supervisión, configuración o auditoría más allá del caso propio del actor. Que una persona la utilice no la convierte en pantalla personal.                            |
| `VSCREEN-0122` | Privacidad, cumplimiento y conservación               | `viso`     | `VPROC-0060::STEP-GOVERN_PRIVACY_AND_RETENTION`             | `OUTSIDE_OPERATIONAL_CLASS` | `PRIMARY_ADMINISTRATIVE`       | `SECONDARY_SUPERVISION`     | `SECONDARY_CONFIGURATION`     | `SECONDARY_AUDIT`     | `OUTSIDE_PERSONAL_CLASS` | `NONE`                          | La intención dominante ya está resuelta como `PRIMARY_ADMINISTRATIVE` y la pantalla trabaja sobre operación, administración, supervisión, configuración o auditoría más allá del caso propio del actor. Que una persona la utilice no la convierte en pantalla personal.                            |
| `VSCREEN-0123` | Gestión de comunicaciones internas                    | `viso`     | `VPROC-0004::STEP-PUBLISH_INTERNAL_COMMUNICATION`           | `OUTSIDE_OPERATIONAL_CLASS` | `PRIMARY_ADMINISTRATIVE`       | `OUTSIDE_SUPERVISION_CLASS` | `OUTSIDE_CONFIGURATION_CLASS` | `SECONDARY_AUDIT`     | `OUTSIDE_PERSONAL_CLASS` | `NONE`                          | La intención dominante ya está resuelta como `PRIMARY_ADMINISTRATIVE` y la pantalla trabaja sobre operación, administración, supervisión, configuración o auditoría más allá del caso propio del actor. Que una persona la utilice no la convierte en pantalla personal.                            |
| `VSCREEN-0124` | Mis comunicados laborales                             | `anima`    | `VPROC-0004::STEP-CONSULT_AND_ACKNOWLEDGE_COMMUNICATION`    | `OUTSIDE_OPERATIONAL_CLASS` | `OUTSIDE_ADMINISTRATIVE_CLASS` | `OUTSIDE_SUPERVISION_CLASS` | `OUTSIDE_CONFIGURATION_CLASS` | `SECONDARY_AUDIT`     | `PRIMARY_PERSONAL`       | `PERSONAL_INBOX`                | La intención dominante presenta tareas, avisos o comunicaciones dirigidas a la persona y permite su reconocimiento o navegación al caso propietario. El sujeto del caso es el actor actual y la pantalla no permite administrar, supervisar ni consultar por defecto el expediente de otra persona. |
| `VSCREEN-0125` | Mi carnet laboral                                     | `anima`    | `VPROC-0006::STEP-PRESENT_EMPLOYEE_CREDENTIAL`              | `OUTSIDE_OPERATIONAL_CLASS` | `OUTSIDE_ADMINISTRATIVE_CLASS` | `OUTSIDE_SUPERVISION_CLASS` | `OUTSIDE_CONFIGURATION_CLASS` | `OUTSIDE_AUDIT_CLASS` | `PRIMARY_PERSONAL`       | `PERSONAL_PROFILE_CREDENTIALS`  | La intención dominante permite consultar o mantener el perfil y credenciales laborales propios dentro de los campos autoadministrables. El sujeto del caso es el actor actual y la pantalla no permite administrar, supervisar ni consultar por defecto el expediente de otra persona.              |
| `VSCREEN-0126` | Mis documentos laborales                              | `anima`    | `VPROC-0060::STEP-CONSULT_OR_SUBMIT_EMPLOYMENT_DOCUMENT`    | `OUTSIDE_OPERATIONAL_CLASS` | `OUTSIDE_ADMINISTRATIVE_CLASS` | `OUTSIDE_SUPERVISION_CLASS` | `OUTSIDE_CONFIGURATION_CLASS` | `SECONDARY_AUDIT`     | `PRIMARY_PERSONAL`       | `PERSONAL_DOCUMENTS`            | La intención dominante permite consultar, aportar o reconocer documentos vinculados al propio expediente. El sujeto del caso es el actor actual y la pantalla no permite administrar, supervisar ni consultar por defecto el expediente de otra persona.                                            |
| `VSCREEN-0127` | Mi capacitación                                       | `anima`    | `VPROC-0065::STEP-COMPLETE_ASSIGNED_TRAINING`               | `OUTSIDE_OPERATIONAL_CLASS` | `OUTSIDE_ADMINISTRATIVE_CLASS` | `OUTSIDE_SUPERVISION_CLASS` | `OUTSIDE_CONFIGURATION_CLASS` | `SECONDARY_AUDIT`     | `PRIMARY_PERSONAL`       | `PERSONAL_LEARNING_DEVELOPMENT` | La intención dominante permite completar formación y consultar objetivos o retroalimentación propios. El sujeto del caso es el actor actual y la pantalla no permite administrar, supervisar ni consultar por defecto el expediente de otra persona.                                                |
| `VSCREEN-0128` | Mis objetivos y retroalimentación                     | `anima`    | `VPROC-0065::STEP-REVIEW_PERSONAL_OBJECTIVES`               | `OUTSIDE_OPERATIONAL_CLASS` | `OUTSIDE_ADMINISTRATIVE_CLASS` | `OUTSIDE_SUPERVISION_CLASS` | `OUTSIDE_CONFIGURATION_CLASS` | `SECONDARY_AUDIT`     | `PRIMARY_PERSONAL`       | `PERSONAL_LEARNING_DEVELOPMENT` | La intención dominante permite completar formación y consultar objetivos o retroalimentación propios. El sujeto del caso es el actor actual y la pantalla no permite administrar, supervisar ni consultar por defecto el expediente de otra persona.                                                |
| `VSCREEN-0129` | Mis solicitudes de soporte                            | `anima`    | `VPROC-0058::STEP-SUBMIT_AND_TRACK_SUPPORT_REQUEST`         | `SECONDARY_OPERATIONAL`     | `OUTSIDE_ADMINISTRATIVE_CLASS` | `OUTSIDE_SUPERVISION_CLASS` | `OUTSIDE_CONFIGURATION_CLASS` | `SECONDARY_AUDIT`     | `PRIMARY_PERSONAL`       | `PERSONAL_SUPPORT`              | La intención dominante permite diagnosticar, solicitar o seguir soporte del propio actor sin convertirse en la mesa administrativa de terceros. El sujeto del caso es el actor actual y la pantalla no permite administrar, supervisar ni consultar por defecto el expediente de otra persona.      |
| `VSCREEN-0130` | Mis reportes de seguridad y salud                     | `anima`    | `VPROC-0013::STEP-REPORT_SST_EVENT`                         | `SECONDARY_OPERATIONAL`     | `OUTSIDE_ADMINISTRATIVE_CLASS` | `OUTSIDE_SUPERVISION_CLASS` | `OUTSIDE_CONFIGURATION_CLASS` | `SECONDARY_AUDIT`     | `PRIMARY_PERSONAL`       | `PERSONAL_SAFETY_EQUIPMENT`     | La intención dominante permite reportar eventos propios de seguridad y reconocer elementos de protección asignados a la persona. El sujeto del caso es el actor actual y la pantalla no permite administrar, supervisar ni consultar por defecto el expediente de otra persona.                     |
| `VSCREEN-0131` | Mis elementos de protección                           | `anima`    | `VPROC-0066::STEP-ACKNOWLEDGE_PROTECTIVE_EQUIPMENT`         | `SECONDARY_OPERATIONAL`     | `OUTSIDE_ADMINISTRATIVE_CLASS` | `OUTSIDE_SUPERVISION_CLASS` | `OUTSIDE_CONFIGURATION_CLASS` | `SECONDARY_AUDIT`     | `PRIMARY_PERSONAL`       | `PERSONAL_SAFETY_EQUIPMENT`     | La intención dominante permite reportar eventos propios de seguridad y reconocer elementos de protección asignados a la persona. El sujeto del caso es el actor actual y la pantalla no permite administrar, supervisar ni consultar por defecto el expediente de otra persona.                     |
| `VSCREEN-0132` | Reservas de inventario                                | `nexo`     | `VPROC-0028::STEP-RESERVE_STOCK`                            | `PRIMARY_OPERATIONAL`       | `OUTSIDE_ADMINISTRATIVE_CLASS` | `OUTSIDE_SUPERVISION_CLASS` | `OUTSIDE_CONFIGURATION_CLASS` | `OUTSIDE_AUDIT_CLASS` | `OUTSIDE_PERSONAL_CLASS` | `NONE`                          | La intención dominante ya está resuelta como `PRIMARY_OPERATIONAL` y la pantalla trabaja sobre operación, administración, supervisión, configuración o auditoría más allá del caso propio del actor. Que una persona la utilice no la convierte en pantalla personal.                               |
| `VSCREEN-0133` | Planes y órdenes de mantenimiento de activos          | `nexo`     | `VPROC-0030::STEP-PLAN_AND_EXECUTE_ASSET_MAINTENANCE`       | `PRIMARY_OPERATIONAL`       | `SECONDARY_ADMINISTRATIVE`     | `SECONDARY_SUPERVISION`     | `SECONDARY_CONFIGURATION`     | `OUTSIDE_AUDIT_CLASS` | `OUTSIDE_PERSONAL_CLASS` | `NONE`                          | La intención dominante ya está resuelta como `PRIMARY_OPERATIONAL` y la pantalla trabaja sobre operación, administración, supervisión, configuración o auditoría más allá del caso propio del actor. Que una persona la utilice no la convierte en pantalla personal.                               |
| `VSCREEN-0134` | Garantías, seguros y reclamaciones de activos         | `nexo`     | `VPROC-0030::STEP-MANAGE_ASSET_CLAIM`                       | `OUTSIDE_OPERATIONAL_CLASS` | `PRIMARY_ADMINISTRATIVE`       | `SECONDARY_SUPERVISION`     | `OUTSIDE_CONFIGURATION_CLASS` | `SECONDARY_AUDIT`     | `OUTSIDE_PERSONAL_CLASS` | `NONE`                          | La intención dominante ya está resuelta como `PRIMARY_ADMINISTRATIVE` y la pantalla trabaja sobre operación, administración, supervisión, configuración o auditoría más allá del caso propio del actor. Que una persona la utilice no la convierte en pantalla personal.                            |
| `VSCREEN-0135` | Instancias y operación de kits                        | `nexo`     | `VPROC-0067::STEP-ASSEMBLE_AND_CONTROL_KIT`                 | `PRIMARY_OPERATIONAL`       | `OUTSIDE_ADMINISTRATIVE_CLASS` | `OUTSIDE_SUPERVISION_CLASS` | `OUTSIDE_CONFIGURATION_CLASS` | `SECONDARY_AUDIT`     | `OUTSIDE_PERSONAL_CLASS` | `NONE`                          | La intención dominante ya está resuelta como `PRIMARY_OPERATIONAL` y la pantalla trabaja sobre operación, administración, supervisión, configuración o auditoría más allá del caso propio del actor. Que una persona la utilice no la convierte en pantalla personal.                               |
| `VSCREEN-0136` | Flota y vehículos                                     | `nexo`     | `VPROC-0031::STEP-MANAGE_FLEET_ASSET`                       | `SECONDARY_OPERATIONAL`     | `PRIMARY_ADMINISTRATIVE`       | `SECONDARY_SUPERVISION`     | `SECONDARY_CONFIGURATION`     | `SECONDARY_AUDIT`     | `OUTSIDE_PERSONAL_CLASS` | `NONE`                          | La intención dominante ya está resuelta como `PRIMARY_ADMINISTRATIVE` y la pantalla trabaja sobre operación, administración, supervisión, configuración o auditoría más allá del caso propio del actor. Que una persona la utilice no la convierte en pantalla personal.                            |
| `VSCREEN-0137` | Kilometraje y combustible                             | `nexo`     | `VPROC-0031::STEP-CAPTURE_MILEAGE_AND_FUEL`                 | `PRIMARY_OPERATIONAL`       | `OUTSIDE_ADMINISTRATIVE_CLASS` | `OUTSIDE_SUPERVISION_CLASS` | `OUTSIDE_CONFIGURATION_CLASS` | `OUTSIDE_AUDIT_CLASS` | `OUTSIDE_PERSONAL_CLASS` | `NONE`                          | La intención dominante ya está resuelta como `PRIMARY_OPERATIONAL` y la pantalla trabaja sobre operación, administración, supervisión, configuración o auditoría más allá del caso propio del actor. Que una persona la utilice no la convierte en pantalla personal.                               |
| `VSCREEN-0138` | Planeación de rutas y despachos                       | `nexo`     | `VPROC-0048::STEP-PLAN_ROUTE_AND_DISPATCH`                  | `PRIMARY_OPERATIONAL`       | `OUTSIDE_ADMINISTRATIVE_CLASS` | `SECONDARY_SUPERVISION`     | `OUTSIDE_CONFIGURATION_CLASS` | `OUTSIDE_AUDIT_CLASS` | `OUTSIDE_PERSONAL_CLASS` | `NONE`                          | La intención dominante ya está resuelta como `PRIMARY_OPERATIONAL` y la pantalla trabaja sobre operación, administración, supervisión, configuración o auditoría más allá del caso propio del actor. Que una persona la utilice no la convierte en pantalla personal.                               |
| `VSCREEN-0139` | Ejecución de ruta y prueba de entrega                 | `nexo`     | `VPROC-0049::STEP-EXECUTE_ROUTE_AND_PROVE_DELIVERY`         | `PRIMARY_OPERATIONAL`       | `OUTSIDE_ADMINISTRATIVE_CLASS` | `SECONDARY_SUPERVISION`     | `OUTSIDE_CONFIGURATION_CLASS` | `SECONDARY_AUDIT`     | `OUTSIDE_PERSONAL_CLASS` | `NONE`                          | La intención dominante ya está resuelta como `PRIMARY_OPERATIONAL` y la pantalla trabaja sobre operación, administración, supervisión, configuración o auditoría más allá del caso propio del actor. Que una persona la utilice no la convierte en pantalla personal.                               |
| `VSCREEN-0140` | Novedades, rechazos y retornos logísticos             | `nexo`     | `VPROC-0049::STEP-RESOLVE_LOGISTICS_EXCEPTION`              | `PRIMARY_OPERATIONAL`       | `OUTSIDE_ADMINISTRATIVE_CLASS` | `SECONDARY_SUPERVISION`     | `OUTSIDE_CONFIGURATION_CLASS` | `SECONDARY_AUDIT`     | `OUTSIDE_PERSONAL_CLASS` | `NONE`                          | La intención dominante ya está resuelta como `PRIMARY_OPERATIONAL` y la pantalla trabaja sobre operación, administración, supervisión, configuración o auditoría más allá del caso propio del actor. Que una persona la utilice no la convierte en pantalla personal.                               |
| `VSCREEN-0141` | Instalaciones, servicios y mantenimiento locativo     | `nexo`     | `VPROC-0055::STEP-MANAGE_FACILITY_SERVICE`                  | `PRIMARY_OPERATIONAL`       | `SECONDARY_ADMINISTRATIVE`     | `SECONDARY_SUPERVISION`     | `SECONDARY_CONFIGURATION`     | `SECONDARY_AUDIT`     | `OUTSIDE_PERSONAL_CLASS` | `NONE`                          | La intención dominante ya está resuelta como `PRIMARY_OPERATIONAL` y la pantalla trabaja sobre operación, administración, supervisión, configuración o auditoría más allá del caso propio del actor. Que una persona la utilice no la convierte en pantalla personal.                               |
| `VSCREEN-0142` | Configuración de políticas y rutas logísticas         | `nexo`     | `VPROC-0048::STEP-CONFIGURE_LOGISTICS_POLICY`               | `OUTSIDE_OPERATIONAL_CLASS` | `SECONDARY_ADMINISTRATIVE`     | `OUTSIDE_SUPERVISION_CLASS` | `PRIMARY_CONFIGURATION`       | `SECONDARY_AUDIT`     | `OUTSIDE_PERSONAL_CLASS` | `NONE`                          | La intención dominante ya está resuelta como `PRIMARY_CONFIGURATION` y la pantalla trabaja sobre operación, administración, supervisión, configuración o auditoría más allá del caso propio del actor. Que una persona la utilice no la convierte en pantalla personal.                             |
| `VSCREEN-0143` | Diseñador de etiquetas logísticas                     | `nexo`     | `VPROC-0015::STEP-AUTHOR_LOGISTICS_LABEL_TEMPLATE`          | `OUTSIDE_OPERATIONAL_CLASS` | `SECONDARY_ADMINISTRATIVE`     | `OUTSIDE_SUPERVISION_CLASS` | `PRIMARY_CONFIGURATION`       | `SECONDARY_AUDIT`     | `OUTSIDE_PERSONAL_CLASS` | `NONE`                          | La intención dominante ya está resuelta como `PRIMARY_CONFIGURATION` y la pantalla trabaja sobre operación, administración, supervisión, configuración o auditoría más allá del caso propio del actor. Que una persona la utilice no la convierte en pantalla personal.                             |
| `VSCREEN-0144` | Cola y trabajos de impresión logística                | `nexo`     | `VPROC-0024::STEP-OPERATE_PRINT_QUEUE`                      | `PRIMARY_OPERATIONAL`       | `SECONDARY_ADMINISTRATIVE`     | `OUTSIDE_SUPERVISION_CLASS` | `OUTSIDE_CONFIGURATION_CLASS` | `SECONDARY_AUDIT`     | `OUTSIDE_PERSONAL_CLASS` | `NONE`                          | La intención dominante ya está resuelta como `PRIMARY_OPERATIONAL` y la pantalla trabaja sobre operación, administración, supervisión, configuración o auditoría más allá del caso propio del actor. Que una persona la utilice no la convierte en pantalla personal.                               |
| `VSCREEN-0145` | Contratos, precios y condiciones de proveedor         | `origo`    | `VPROC-0020::STEP-GOVERN_SUPPLIER_TERMS`                    | `OUTSIDE_OPERATIONAL_CLASS` | `PRIMARY_ADMINISTRATIVE`       | `OUTSIDE_SUPERVISION_CLASS` | `SECONDARY_CONFIGURATION`     | `SECONDARY_AUDIT`     | `OUTSIDE_PERSONAL_CLASS` | `NONE`                          | La intención dominante ya está resuelta como `PRIMARY_ADMINISTRATIVE` y la pantalla trabaja sobre operación, administración, supervisión, configuración o auditoría más allá del caso propio del actor. Que una persona la utilice no la convierte en pantalla personal.                            |
| `VSCREEN-0146` | Desempeño y reclamaciones de proveedor                | `origo`    | `VPROC-0020::STEP-REVIEW_SUPPLIER_PERFORMANCE`              | `OUTSIDE_OPERATIONAL_CLASS` | `PRIMARY_ADMINISTRATIVE`       | `SECONDARY_SUPERVISION`     | `OUTSIDE_CONFIGURATION_CLASS` | `SECONDARY_AUDIT`     | `OUTSIDE_PERSONAL_CLASS` | `NONE`                          | La intención dominante ya está resuelta como `PRIMARY_ADMINISTRATIVE` y la pantalla trabaja sobre operación, administración, supervisión, configuración o auditoría más allá del caso propio del actor. Que una persona la utilice no la convierte en pantalla personal.                            |
| `VSCREEN-0147` | Oportunidades y cotizaciones de catering o B2B        | `pulso`    | `VPROC-0041::STEP-QUALIFY_B2B_OPPORTUNITY`                  | `OUTSIDE_OPERATIONAL_CLASS` | `PRIMARY_ADMINISTRATIVE`       | `OUTSIDE_SUPERVISION_CLASS` | `OUTSIDE_CONFIGURATION_CLASS` | `SECONDARY_AUDIT`     | `OUTSIDE_PERSONAL_CLASS` | `NONE`                          | La intención dominante ya está resuelta como `PRIMARY_ADMINISTRATIVE` y la pantalla trabaja sobre operación, administración, supervisión, configuración o auditoría más allá del caso propio del actor. Que una persona la utilice no la convierte en pantalla personal.                            |
| `VSCREEN-0148` | Ejecución de catering o venta B2B                     | `pulso`    | `VPROC-0041::STEP-EXECUTE_B2B_COMMITMENT`                   | `PRIMARY_OPERATIONAL`       | `SECONDARY_ADMINISTRATIVE`     | `SECONDARY_SUPERVISION`     | `OUTSIDE_CONFIGURATION_CLASS` | `SECONDARY_AUDIT`     | `OUTSIDE_PERSONAL_CLASS` | `NONE`                          | La intención dominante ya está resuelta como `PRIMARY_OPERATIONAL` y la pantalla trabaja sobre operación, administración, supervisión, configuración o auditoría más allá del caso propio del actor. Que una persona la utilice no la convierte en pantalla personal.                               |
| `VSCREEN-0149` | Operación de reservas y eventos                       | `pulso`    | `VPROC-0047::STEP-MANAGE_RESERVATION_OR_EVENT`              | `PRIMARY_OPERATIONAL`       | `SECONDARY_ADMINISTRATIVE`     | `SECONDARY_SUPERVISION`     | `OUTSIDE_CONFIGURATION_CLASS` | `SECONDARY_AUDIT`     | `OUTSIDE_PERSONAL_CLASS` | `NONE`                          | La intención dominante ya está resuelta como `PRIMARY_OPERATIONAL` y la pantalla trabaja sobre operación, administración, supervisión, configuración o auditoría más allá del caso propio del actor. Que una persona la utilice no la convierte en pantalla personal.                               |
| `VSCREEN-0150` | Casos de reclamo y compensación                       | `pulso`    | `VPROC-0046::STEP-RESOLVE_CUSTOMER_CLAIM`                   | `PRIMARY_OPERATIONAL`       | `SECONDARY_ADMINISTRATIVE`     | `SECONDARY_SUPERVISION`     | `OUTSIDE_CONFIGURATION_CLASS` | `SECONDARY_AUDIT`     | `OUTSIDE_PERSONAL_CLASS` | `NONE`                          | La intención dominante ya está resuelta como `PRIMARY_OPERATIONAL` y la pantalla trabaja sobre operación, administración, supervisión, configuración o auditoría más allá del caso propio del actor. Que una persona la utilice no la convierte en pantalla personal.                               |
| `VSCREEN-0151` | Coordinación de entrega mediante tercero              | `pulso`    | `VPROC-0050::STEP-COORDINATE_THIRD_PARTY_DELIVERY`          | `PRIMARY_OPERATIONAL`       | `SECONDARY_ADMINISTRATIVE`     | `SECONDARY_SUPERVISION`     | `OUTSIDE_CONFIGURATION_CLASS` | `SECONDARY_AUDIT`     | `OUTSIDE_PERSONAL_CLASS` | `NONE`                          | La intención dominante ya está resuelta como `PRIMARY_OPERATIONAL` y la pantalla trabaja sobre operación, administración, supervisión, configuración o auditoría más allá del caso propio del actor. Que una persona la utilice no la convierte en pantalla personal.                               |
| `VSCREEN-0152` | Análisis de satisfacción y servicio                   | `pulso`    | `VPROC-0068::STEP-ANALYZE_SERVICE_SATISFACTION`             | `OUTSIDE_OPERATIONAL_CLASS` | `SECONDARY_ADMINISTRATIVE`     | `PRIMARY_SUPERVISION`       | `OUTSIDE_CONFIGURATION_CLASS` | `OUTSIDE_AUDIT_CLASS` | `OUTSIDE_PERSONAL_CLASS` | `NONE`                          | La intención dominante ya está resuelta como `PRIMARY_SUPERVISION` y la pantalla trabaja sobre operación, administración, supervisión, configuración o auditoría más allá del caso propio del actor. Que una persona la utilice no la convierte en pantalla personal.                               |
| `VSCREEN-0153` | Paquete laboral para pagos y beneficios               | `numera`   | `VPROC-0010::STEP-PREPARE_LABOR_PAYMENT_PACKAGE`            | `OUTSIDE_OPERATIONAL_CLASS` | `PRIMARY_ADMINISTRATIVE`       | `OUTSIDE_SUPERVISION_CLASS` | `OUTSIDE_CONFIGURATION_CLASS` | `SECONDARY_AUDIT`     | `OUTSIDE_PERSONAL_CLASS` | `NONE`                          | La intención dominante ya está resuelta como `PRIMARY_ADMINISTRATIVE` y la pantalla trabaja sobre operación, administración, supervisión, configuración o auditoría más allá del caso propio del actor. Que una persona la utilice no la convierte en pantalla personal.                            |
| `VSCREEN-0154` | Facturas y documentos fiscales                        | `numera`   | `VPROC-0051::STEP-MANAGE_FISCAL_DOCUMENT`                   | `OUTSIDE_OPERATIONAL_CLASS` | `PRIMARY_ADMINISTRATIVE`       | `OUTSIDE_SUPERVISION_CLASS` | `OUTSIDE_CONFIGURATION_CLASS` | `SECONDARY_AUDIT`     | `OUTSIDE_PERSONAL_CLASS` | `NONE`                          | La intención dominante ya está resuelta como `PRIMARY_ADMINISTRATIVE` y la pantalla trabaja sobre operación, administración, supervisión, configuración o auditoría más allá del caso propio del actor. Que una persona la utilice no la convierte en pantalla personal.                            |
| `VSCREEN-0155` | Tesorería y programación de pagos                     | `numera`   | `VPROC-0052::STEP-PLAN_AND_EXECUTE_PAYMENTS`                | `OUTSIDE_OPERATIONAL_CLASS` | `PRIMARY_ADMINISTRATIVE`       | `SECONDARY_SUPERVISION`     | `OUTSIDE_CONFIGURATION_CLASS` | `SECONDARY_AUDIT`     | `OUTSIDE_PERSONAL_CLASS` | `NONE`                          | La intención dominante ya está resuelta como `PRIMARY_ADMINISTRATIVE` y la pantalla trabaja sobre operación, administración, supervisión, configuración o auditoría más allá del caso propio del actor. Que una persona la utilice no la convierte en pantalla personal.                            |
| `VSCREEN-0156` | Presupuestos, escenarios y forecast                   | `numera`   | `VPROC-0069::STEP-PLAN_BUDGET_AND_FORECAST`                 | `OUTSIDE_OPERATIONAL_CLASS` | `PRIMARY_ADMINISTRATIVE`       | `SECONDARY_SUPERVISION`     | `OUTSIDE_CONFIGURATION_CLASS` | `SECONDARY_AUDIT`     | `OUTSIDE_PERSONAL_CLASS` | `NONE`                          | La intención dominante ya está resuelta como `PRIMARY_ADMINISTRATIVE` y la pantalla trabaja sobre operación, administración, supervisión, configuración o auditoría más allá del caso propio del actor. Que una persona la utilice no la convierte en pantalla personal.                            |
| `VSCREEN-0157` | Impuestos y obligaciones de cumplimiento              | `numera`   | `VPROC-0052::STEP-MANAGE_TAX_OBLIGATION`                    | `OUTSIDE_OPERATIONAL_CLASS` | `PRIMARY_ADMINISTRATIVE`       | `SECONDARY_SUPERVISION`     | `SECONDARY_CONFIGURATION`     | `SECONDARY_AUDIT`     | `OUTSIDE_PERSONAL_CLASS` | `NONE`                          | La intención dominante ya está resuelta como `PRIMARY_ADMINISTRATIVE` y la pantalla trabaja sobre operación, administración, supervisión, configuración o auditoría más allá del caso propio del actor. Que una persona la utilice no la convierte en pantalla personal.                            |
| `VSCREEN-0158` | Distribución y asignación de costos                   | `numera`   | `VPROC-0054::STEP-ALLOCATE_COSTS`                           | `OUTSIDE_OPERATIONAL_CLASS` | `PRIMARY_ADMINISTRATIVE`       | `OUTSIDE_SUPERVISION_CLASS` | `SECONDARY_CONFIGURATION`     | `SECONDARY_AUDIT`     | `OUTSIDE_PERSONAL_CLASS` | `NONE`                          | La intención dominante ya está resuelta como `PRIMARY_ADMINISTRATIVE` y la pantalla trabaja sobre operación, administración, supervisión, configuración o auditoría más allá del caso propio del actor. Que una persona la utilice no la convierte en pantalla personal.                            |
| `VSCREEN-0159` | Indicadores, análisis y planes de mejora              | `numera`   | `VPROC-0061::STEP-ANALYZE_AND_PLAN_IMPROVEMENT`             | `OUTSIDE_OPERATIONAL_CLASS` | `SECONDARY_ADMINISTRATIVE`     | `PRIMARY_SUPERVISION`       | `OUTSIDE_CONFIGURATION_CLASS` | `OUTSIDE_AUDIT_CLASS` | `OUTSIDE_PERSONAL_CLASS` | `NONE`                          | La intención dominante ya está resuelta como `PRIMARY_SUPERVISION` y la pantalla trabaja sobre operación, administración, supervisión, configuración o auditoría más allá del caso propio del actor. Que una persona la utilice no la convierte en pantalla personal.                               |
| `VSCREEN-0160` | Inicio y selección del portal de compras              | `pass`     | `VPROC-0039::STEP-ENTER_CUSTOMER_COMMERCE`                  | `OUTSIDE_OPERATIONAL_CLASS` | `OUTSIDE_ADMINISTRATIVE_CLASS` | `OUTSIDE_SUPERVISION_CLASS` | `OUTSIDE_CONFIGURATION_CLASS` | `OUTSIDE_AUDIT_CLASS` | `OUTSIDE_PERSONAL_CLASS` | `NONE`                          | La superficie pertenece al canal de cliente y su clase primaria se resolverá exclusivamente en PROC-SCREEN-011; no se reutiliza PERSONAL para absorber la experiencia de cliente.                                                                                                                   |
| `VSCREEN-0161` | Menú y catálogo comercial del cliente                 | `pass`     | `VPROC-0017::STEP-BROWSE_COMMERCIAL_OFFER`                  | `OUTSIDE_OPERATIONAL_CLASS` | `OUTSIDE_ADMINISTRATIVE_CLASS` | `OUTSIDE_SUPERVISION_CLASS` | `OUTSIDE_CONFIGURATION_CLASS` | `OUTSIDE_AUDIT_CLASS` | `OUTSIDE_PERSONAL_CLASS` | `NONE`                          | La superficie pertenece al canal de cliente y su clase primaria se resolverá exclusivamente en PROC-SCREEN-011; no se reutiliza PERSONAL para absorber la experiencia de cliente.                                                                                                                   |
| `VSCREEN-0162` | Carrito y configuración del pedido                    | `pass`     | `VPROC-0039::STEP-CONFIGURE_CART`                           | `OUTSIDE_OPERATIONAL_CLASS` | `OUTSIDE_ADMINISTRATIVE_CLASS` | `OUTSIDE_SUPERVISION_CLASS` | `OUTSIDE_CONFIGURATION_CLASS` | `OUTSIDE_AUDIT_CLASS` | `OUTSIDE_PERSONAL_CLASS` | `NONE`                          | La superficie pertenece al canal de cliente y su clase primaria se resolverá exclusivamente en PROC-SCREEN-011; no se reutiliza PERSONAL para absorber la experiencia de cliente.                                                                                                                   |
| `VSCREEN-0163` | Dirección, modalidad y programación de entrega        | `pass`     | `VPROC-0050::STEP-SELECT_FULFILLMENT`                       | `OUTSIDE_OPERATIONAL_CLASS` | `OUTSIDE_ADMINISTRATIVE_CLASS` | `OUTSIDE_SUPERVISION_CLASS` | `OUTSIDE_CONFIGURATION_CLASS` | `OUTSIDE_AUDIT_CLASS` | `OUTSIDE_PERSONAL_CLASS` | `NONE`                          | La superficie pertenece al canal de cliente y su clase primaria se resolverá exclusivamente en PROC-SCREEN-011; no se reutiliza PERSONAL para absorber la experiencia de cliente.                                                                                                                   |
| `VSCREEN-0164` | Revisión, checkout e inicio de pago                   | `pass`     | `VPROC-0043::STEP-REVIEW_AND_START_PAYMENT`                 | `OUTSIDE_OPERATIONAL_CLASS` | `OUTSIDE_ADMINISTRATIVE_CLASS` | `OUTSIDE_SUPERVISION_CLASS` | `OUTSIDE_CONFIGURATION_CLASS` | `OUTSIDE_AUDIT_CLASS` | `OUTSIDE_PERSONAL_CLASS` | `NONE`                          | La superficie pertenece al canal de cliente y su clase primaria se resolverá exclusivamente en PROC-SCREEN-011; no se reutiliza PERSONAL para absorber la experiencia de cliente.                                                                                                                   |
| `VSCREEN-0165` | Confirmación de pedido y retorno de pago              | `pass`     | `VPROC-0043::STEP-PRESENT_ORDER_RECEIPT`                    | `OUTSIDE_OPERATIONAL_CLASS` | `OUTSIDE_ADMINISTRATIVE_CLASS` | `OUTSIDE_SUPERVISION_CLASS` | `OUTSIDE_CONFIGURATION_CLASS` | `SECONDARY_AUDIT`     | `OUTSIDE_PERSONAL_CLASS` | `NONE`                          | La superficie pertenece al canal de cliente y su clase primaria se resolverá exclusivamente en PROC-SCREEN-011; no se reutiliza PERSONAL para absorber la experiencia de cliente.                                                                                                                   |
| `VSCREEN-0166` | Mis pedidos y detalle                                 | `pass`     | `VPROC-0039::STEP-CONSULT_PERSONAL_ORDERS`                  | `OUTSIDE_OPERATIONAL_CLASS` | `OUTSIDE_ADMINISTRATIVE_CLASS` | `OUTSIDE_SUPERVISION_CLASS` | `OUTSIDE_CONFIGURATION_CLASS` | `SECONDARY_AUDIT`     | `OUTSIDE_PERSONAL_CLASS` | `NONE`                          | La superficie pertenece al canal de cliente y su clase primaria se resolverá exclusivamente en PROC-SCREEN-011; no se reutiliza PERSONAL para absorber la experiencia de cliente.                                                                                                                   |
| `VSCREEN-0167` | Seguimiento de preparación y entrega del cliente      | `pass`     | `VPROC-0050::STEP-TRACK_PERSONAL_FULFILLMENT`               | `OUTSIDE_OPERATIONAL_CLASS` | `OUTSIDE_ADMINISTRATIVE_CLASS` | `OUTSIDE_SUPERVISION_CLASS` | `OUTSIDE_CONFIGURATION_CLASS` | `SECONDARY_AUDIT`     | `OUTSIDE_PERSONAL_CLASS` | `NONE`                          | La superficie pertenece al canal de cliente y su clase primaria se resolverá exclusivamente en PROC-SCREEN-011; no se reutiliza PERSONAL para absorber la experiencia de cliente.                                                                                                                   |
| `VSCREEN-0168` | Chat y comunicación asociada al pedido                | `pass`     | `VPROC-0047::STEP-COMMUNICATE_ABOUT_ORDER`                  | `OUTSIDE_OPERATIONAL_CLASS` | `OUTSIDE_ADMINISTRATIVE_CLASS` | `OUTSIDE_SUPERVISION_CLASS` | `OUTSIDE_CONFIGURATION_CLASS` | `SECONDARY_AUDIT`     | `OUTSIDE_PERSONAL_CLASS` | `NONE`                          | La superficie pertenece al canal de cliente y su clase primaria se resolverá exclusivamente en PROC-SCREEN-011; no se reutiliza PERSONAL para absorber la experiencia de cliente.                                                                                                                   |
| `VSCREEN-0169` | Mis reclamos y casos de servicio                      | `pass`     | `VPROC-0046::STEP-SUBMIT_AND_TRACK_CLAIM`                   | `OUTSIDE_OPERATIONAL_CLASS` | `OUTSIDE_ADMINISTRATIVE_CLASS` | `OUTSIDE_SUPERVISION_CLASS` | `OUTSIDE_CONFIGURATION_CLASS` | `SECONDARY_AUDIT`     | `OUTSIDE_PERSONAL_CLASS` | `NONE`                          | La superficie pertenece al canal de cliente y su clase primaria se resolverá exclusivamente en PROC-SCREEN-011; no se reutiliza PERSONAL para absorber la experiencia de cliente.                                                                                                                   |
| `VSCREEN-0170` | Mis reservas y eventos                                | `pass`     | `VPROC-0047::STEP-MANAGE_PERSONAL_RESERVATION`              | `OUTSIDE_OPERATIONAL_CLASS` | `OUTSIDE_ADMINISTRATIVE_CLASS` | `OUTSIDE_SUPERVISION_CLASS` | `OUTSIDE_CONFIGURATION_CLASS` | `SECONDARY_AUDIT`     | `OUTSIDE_PERSONAL_CLASS` | `NONE`                          | La superficie pertenece al canal de cliente y su clase primaria se resolverá exclusivamente en PROC-SCREEN-011; no se reutiliza PERSONAL para absorber la experiencia de cliente.                                                                                                                   |
| `VSCREEN-0171` | Calificación y satisfacción                           | `pass`     | `VPROC-0068::STEP-SUBMIT_SATISFACTION_RATING`               | `OUTSIDE_OPERATIONAL_CLASS` | `OUTSIDE_ADMINISTRATIVE_CLASS` | `OUTSIDE_SUPERVISION_CLASS` | `OUTSIDE_CONFIGURATION_CLASS` | `OUTSIDE_AUDIT_CLASS` | `OUTSIDE_PERSONAL_CLASS` | `NONE`                          | La superficie pertenece al canal de cliente y su clase primaria se resolverá exclusivamente en PROC-SCREEN-011; no se reutiliza PERSONAL para absorber la experiencia de cliente.                                                                                                                   |
| `VSCREEN-0172` | Comunicaciones y notificaciones del cliente           | `pass`     | `VPROC-0047::STEP-CONSULT_CUSTOMER_COMMUNICATION`           | `OUTSIDE_OPERATIONAL_CLASS` | `OUTSIDE_ADMINISTRATIVE_CLASS` | `OUTSIDE_SUPERVISION_CLASS` | `OUTSIDE_CONFIGURATION_CLASS` | `SECONDARY_AUDIT`     | `OUTSIDE_PERSONAL_CLASS` | `NONE`                          | La superficie pertenece al canal de cliente y su clase primaria se resolverá exclusivamente en PROC-SCREEN-011; no se reutiliza PERSONAL para absorber la experiencia de cliente.                                                                                                                   |
| `VSCREEN-0173` | Trazabilidad e investigación de lote                  | `fogo`     | `VPROC-0035::STEP-INVESTIGATE_BATCH_TRACEABILITY`           | `OUTSIDE_OPERATIONAL_CLASS` | `SECONDARY_ADMINISTRATIVE`     | `OUTSIDE_SUPERVISION_CLASS` | `OUTSIDE_CONFIGURATION_CLASS` | `PRIMARY_AUDIT`       | `OUTSIDE_PERSONAL_CLASS` | `NONE`                          | La intención dominante ya está resuelta como `PRIMARY_AUDIT` y la pantalla trabaja sobre operación, administración, supervisión, configuración o auditoría más allá del caso propio del actor. Que una persona la utilice no la convierte en pantalla personal.                                     |
| `VSCREEN-0174` | Controles operativos de inocuidad                     | `fogo`     | `VPROC-0014::STEP-EXECUTE_FOOD_SAFETY_CONTROL`              | `PRIMARY_OPERATIONAL`       | `SECONDARY_ADMINISTRATIVE`     | `SECONDARY_SUPERVISION`     | `OUTSIDE_CONFIGURATION_CLASS` | `SECONDARY_AUDIT`     | `OUTSIDE_PERSONAL_CLASS` | `NONE`                          | La intención dominante ya está resuelta como `PRIMARY_OPERATIONAL` y la pantalla trabaja sobre operación, administración, supervisión, configuración o auditoría más allá del caso propio del actor. Que una persona la utilice no la convierte en pantalla personal.                               |
| `VSCREEN-0175` | Seguridad de cuenta y sesiones                        | `shell`    | `VPROC-0059::STEP-MANAGE_ACCOUNT_SECURITY`                  | `OUTSIDE_OPERATIONAL_CLASS` | `OUTSIDE_ADMINISTRATIVE_CLASS` | `OUTSIDE_SUPERVISION_CLASS` | `OUTSIDE_CONFIGURATION_CLASS` | `SECONDARY_AUDIT`     | `PRIMARY_PERSONAL`       | `PERSONAL_ACCOUNT_SECURITY`     | La intención dominante permite revisar y proteger sesiones, credenciales y seguridad de la cuenta propia. El sujeto del caso es el actor actual y la pantalla no permite administrar, supervisar ni consultar por defecto el expediente de otra persona.                                            |
| `VSCREEN-0176` | Definición de kits y conjuntos                        | `nexo`     | `VPROC-0067::STEP-MAINTAIN_KIT_DEFINITION`                  | `OUTSIDE_OPERATIONAL_CLASS` | `SECONDARY_ADMINISTRATIVE`     | `OUTSIDE_SUPERVISION_CLASS` | `PRIMARY_CONFIGURATION`       | `SECONDARY_AUDIT`     | `OUTSIDE_PERSONAL_CLASS` | `NONE`                          | La intención dominante ya está resuelta como `PRIMARY_CONFIGURATION` y la pantalla trabaja sobre operación, administración, supervisión, configuración o auditoría más allá del caso propio del actor. Que una persona la utilice no la convierte en pantalla personal.                             |
| `VSCREEN-0177` | Configuración de impresoras logísticas                | `nexo`     | `VPROC-0024::STEP-CONFIGURE_LOGISTICS_PRINTERS`             | `OUTSIDE_OPERATIONAL_CLASS` | `SECONDARY_ADMINISTRATIVE`     | `OUTSIDE_SUPERVISION_CLASS` | `PRIMARY_CONFIGURATION`       | `SECONDARY_AUDIT`     | `OUTSIDE_PERSONAL_CLASS` | `NONE`                          | La intención dominante ya está resuelta como `PRIMARY_CONFIGURATION` y la pantalla trabaja sobre operación, administración, supervisión, configuración o auditoría más allá del caso propio del actor. Que una persona la utilice no la convierte en pantalla personal.                             |

---

#### 14. Resumen por aplicación

| Aplicación | Primaria personal | Secundaria personal | Fuera de clase |   Total |
| ---------- | ----------------: | ------------------: | -------------: | ------: |
| `shell`    |                 7 |                   0 |              0 |       7 |
| `viso`     |                 0 |                   0 |             31 |      31 |
| `anima`    |                13 |                   1 |              0 |      14 |
| `nexo`     |                 0 |                   0 |             37 |      37 |
| `fogo`     |                 0 |                   0 |             15 |      15 |
| `origo`    |                 0 |                   0 |             14 |      14 |
| `pulso`    |                 0 |                   0 |             20 |      20 |
| `numera`   |                 0 |                   0 |             20 |      20 |
| `pass`     |                 0 |                   0 |             19 |      19 |
| **Total**  |            **20** |               **1** |        **156** | **177** |

La aplicación no determina la clase. La distribución demuestra que `PERSONAL` queda concentrada en SHELL y ANIMA, mientras PASS permanece reservado para `CLIENT`.

---

#### 15. Resumen por patrón

| Patrón                            | Pantallas |
| --------------------------------- | --------: |
| `PERSONAL_HOME`                   |         2 |
| `PERSONAL_IDENTITY_ACCESS`        |         3 |
| `PERSONAL_INBOX`                  |         2 |
| `PERSONAL_SUPPORT`                |         2 |
| `PERSONAL_ACCOUNT_SECURITY`       |         1 |
| `PERSONAL_TIME_ATTENDANCE`        |         2 |
| `PERSONAL_SCHEDULE`               |         1 |
| `PERSONAL_WORKFORCE_REQUESTS`     |         1 |
| `PERSONAL_PROFILE_CREDENTIALS`    |         2 |
| `PERSONAL_DOCUMENTS`              |         1 |
| `PERSONAL_LEARNING_DEVELOPMENT`   |         2 |
| `PERSONAL_SAFETY_EQUIPMENT`       |         2 |
| **Total con relevancia personal** |    **21** |

Las 156 pantallas con `NONE` conservan su clase primaria anterior o quedan reservadas exclusivamente para `PROC-SCREEN-011`.

---

#### 16. Compatibilidad con clases anteriores

```text
PRIMARY_PERSONAL + cualquier otra clase primaria = PROHIBIDO

SECONDARY_PERSONAL + PRIMARY_OPERATIONAL = PERMITIDO
SECONDARY_PERSONAL + PRIMARY_ADMINISTRATIVE = PERMITIDO CON FUNDAMENTO
SECONDARY_PERSONAL + PRIMARY_AUDIT = PERMITIDO CON MINIMIZACION
```

En el corte aprobado solo `VSCREEN-0028 — Registro de entrada, pausa y salida` recibe `SECONDARY_PERSONAL`; conserva `PRIMARY_OPERATIONAL` porque su resultado principal es el hecho operativo de asistencia.

---

#### 17. Puerta de continuidad hacia cliente

Después de esta tarea:

```text
pantallas con una clase primaria: 158
pantallas todavía sin clase primaria: 19
pantallas pendientes: VSCREEN-0107..VSCREEN-0112 y VSCREEN-0160..VSCREEN-0172
aplicación pendiente: pass
propietario: PROC-SCREEN-011
```

`PROC-SCREEN-011` deberá:

1. clasificar las 19 pantallas PASS como cliente primarias o justificar cualquier excepción;
2. confirmar exactamente una clase primaria para cada una de las 177 pantallas;
3. rechazar toda pantalla sin clase o con clases primarias competidoras;
4. conservar clases secundarias compatibles;
5. cerrar el subtramo de clasificación antes de definir actores.

---

#### 18. Cambio y versionado

Cambiar `personal_fit` o `personal_pattern` exige:

1. propuesta trazable;
2. comparación del sujeto, alcance, intención y canal;
3. análisis de privacidad y autorización;
4. conservación del valor anterior;
5. nueva versión de clasificación;
6. revisión de acciones, datos sensibles, permisos, dispositivos y pruebas;
7. actualización coordinada de la puerta final de clases;
8. nueva identidad cuando cambie materialmente el sujeto o la intención principal.

Renombrar una ruta, mover una pantalla entre SHELL y ANIMA o cambiar el dispositivo no modifica automáticamente la clasificación.

---

#### 19. Validaciones obligatorias

La compilación deberá fallar cuando:

1. falte una de las 177 pantallas;
2. una pantalla aparezca más de una vez;
3. identidad, nombre, aplicación, proceso, paso o clasificación previa difieran de la tarea anterior;
4. falte `personal_fit`;
5. el valor no pertenezca al vocabulario;
6. una primaria o secundaria use `NONE`;
7. una pantalla fuera de clase use un patrón personal;
8. falte fundamento;
9. una primaria personal tenga otra clase primaria;
10. los conteos no sean 20, 1 y 156;
11. los patrones no sumen 21;
12. PASS reciba `PRIMARY_PERSONAL`;
13. una pantalla administrativa de personas sea clasificada personal por contener datos personales;
14. una pantalla personal admita seleccionar otra persona sin handoff autorizado;
15. un dispositivo compartido conserve contexto del actor anterior;
16. después de la tarea queden pantallas sin clase primaria fuera de PASS;
17. la lista pendiente no sea exactamente las 19 pantallas PASS;
18. AURA reciba clasificación sin pantalla admitida.

---

#### 20. Privacidad, seguridad y autorización

La clasificación personal no concede:

- autenticación válida;
- lectura del perfil;
- escritura autoadministrable;
- corrección de asistencia;
- descarga de documentos;
- acceso a entrenamiento;
- consulta de sesiones;
- uso de dispositivo compartido;
- visibilidad de datos laborales protegidos;
- acceso por URL directa.

Toda operación deberá validar principal, actor, sujeto, relación, contexto, permiso, territorio cuando aplique, versión, estado, propósito y minimización.

---

#### 21. SCREEN-PERSONAL-CARRYOVER-REGISTER-001

| Pendiente                                          | Propietario exacto                                        |
| -------------------------------------------------- | --------------------------------------------------------- |
| clasificar las 19 pantallas de cliente             | `PROC-SCREEN-011`                                         |
| cerrar exactamente una clase primaria por pantalla | `PROC-SCREEN-011`                                         |
| definir actores objetivo                           | `PROC-SCREEN-012`                                         |
| definir dispositivos soportados                    | `PROC-SCREEN-013`                                         |
| definir acciones principales y secundarias         | `PROC-SCREEN-014` y `PROC-SCREEN-015`                     |
| definir condiciones y estados de interfaz          | `PROC-SCREEN-016` a `PROC-SCREEN-021`                     |
| definir información sensible y permisos            | `PROC-SCREEN-022` a `PROC-SCREEN-024`                     |
| vincular operaciones técnicas                      | `PROC-SCREEN-025`                                         |
| mapear rutas y legado                              | `PROC-SCREEN-026`                                         |
| definir métricas y aceptación                      | `PROC-SCREEN-027` y `PROC-SCREEN-028`                     |
| materializar contratos y validadores               | paquetes E5 y CI documental                               |
| validar con trabajadores reales                    | `UX-QA-*` y pilotos E5                                    |
| admitir AURA                                       | tareas canónicas de AURA y nueva admisión `PROC-SCREEN-*` |

No queda pendiente narrativo sin tarea o puerta de resolución.

---

#### 22. Requisitos de prueba derivados

**Resultado:** GENERA 30 REQUISITOS DE PRUEBA.

Se incorporan `TREQ-UX-767` a `TREQ-UX-796` al Registro Canónico completo. Permanecen en estado `IDENTIFICADO`; automatización, implementación y evidencia corresponden a CI documental, paquetes E5, BLOQUE U, staging y pilotos.

---

#### 23. Criterios de aceptación

- [x] Se clasifican las 177 pantallas.
- [x] Se conservan exactamente nombres, aplicaciones, procesos, pasos y cinco clasificaciones anteriores.
- [x] Cada pantalla recibe exactamente un `personal_fit`.
- [x] Se distinguen 20 primarias, 1 secundaria y 156 fuera de clase.
- [x] Las 21 pantallas relevantes usan doce patrones.
- [x] Ninguna primaria personal compite con otra clase primaria.
- [x] Se delimita el sujeto propio y se prohíbe seleccionar arbitrariamente a terceros.
- [x] Se define la frontera de dispositivo compartido.
- [x] PASS conserva sus 19 pantallas para `PROC-SCREEN-011`.
- [x] Después de la tarea no queda ninguna pantalla no PASS sin clase primaria.
- [x] AURA conserva cero pantallas.
- [x] La clasificación no concede permisos.
- [x] Se generan `TREQ-UX-767` a `TREQ-UX-796`.
- [x] No se anticipan actores, dispositivos, acciones, estados, permisos, rutas o APIs.
- [x] No se implementa código ni se avanza a `PROC-SCREEN-011`.

---

#### 24. Resultado y continuidad

```text
PROC-SCREEN-009 APROBADA
PROC-SCREEN-010 APROBADA
PROC-SCREEN-011 NO INICIADA
```

La continuidad documental pasa exclusivamente a:

```text
PROC-SCREEN-011 — Clasificar pantalla de cliente
```


### ✅ PROC-SCREEN-011 — Clasificar pantalla de cliente

**Estado:** APROBADA

**Bloque:** E2 — Arquitectura funcional, procesos y experiencia transversal

**Marcador exacto que reemplaza:** `### [ ] PROC-SCREEN-011 — Clasificar pantalla de cliente`

**Tarea anterior:** `PROC-SCREEN-010 — Clasificar pantalla personal` — APROBADA

**Siguiente tarea reservada:** `PROC-SCREEN-012 — Definir actores objetivo` — NO INICIADA

**Fuente canónica obligatoria de identidades y nombres:** `PROC-SCREEN-002 / SCREEN-CANONICAL-CATALOG-001`, corte vigente de **177 pantallas**.

**Artefactos lógicos contenidos en esta tarea:**

- `SCREEN-CLIENT-CLASSIFICATION-CONTRACT-001`;
- `SCREEN-CLIENT-PATTERN-VOCABULARY-001`;
- `SCREEN-CLIENT-CLASSIFICATION-REGISTER-001`;
- `SCREEN-CLIENT-CHANNEL-BOUNDARY-001`;
- `SCREEN-CLIENT-IDENTITY-OWNERSHIP-CONTRACT-001`;
- `SCREEN-CLIENT-GUEST-SESSION-CONTRACT-001`;
- `SCREEN-CLIENT-COMMERCE-LOYALTY-BOUNDARY-001`;
- `SCREEN-PRIMARY-CLASS-CLOSURE-GATE-001`;
- `SCREEN-CLIENT-COVERAGE-MATRIX-001`;
- `SCREEN-CLIENT-CLASSIFICATION-CHANGE-POLICY-001`;
- `SCREEN-CLIENT-CLASSIFICATION-VALIDATION-GATE-001`;
- `SCREEN-CLIENT-CARRYOVER-REGISTER-001`.

**Resultado cuantitativo:** **177 pantallas clasificadas**, de las cuales **19** quedan como `PRIMARY_CLIENT`, **0** como `SECONDARY_CLIENT` y **158** como `OUTSIDE_CLIENT_CLASS`; se utilizan **12 patrones**, las **19 pantallas PASS** reciben clase primaria de cliente y la puerta final confirma exactamente **una clase primaria para cada una de las 177 pantallas**. AURA conserva cero pantallas y ninguna identidad, nombre, aplicación, proceso, paso o clasificación anterior fue modificada.

**Huella de nombres `screen_id|working_name`:** `f9e15f46d8e1658f8435185e18a359581179eb47f283484b94218c46734a9a31`

**Naturaleza:** clasificación documental de las superficies destinadas directamente a una persona cliente o visitante del canal PASS para fidelización, comercio, pedidos, cumplimiento, comunicación, servicio, reservas y retroalimentación. Cierra el subtramo de clasificación; no define todavía actores objetivo, dispositivos, acciones, estados de interfaz, sensibilidad, permisos, rutas u operaciones técnicas.

**Cambios en identidades, nombres, aplicaciones, procesos, pasos, clasificaciones aprobadas, código, rutas, componentes, Supabase, tablas, migraciones, RLS, RPC, eventos o producción:** no autorizados por esta tarea.

---

#### 1. Propósito

Distinguir las superficies que forman parte directa del canal de cliente de aquellas que, aunque procesan pedidos, datos, pagos, reclamos o fidelización, son utilizadas por personal interno y conservan otra clase primaria.

```text
PERSONA CLIENTE O VISITANTE
        +
CANAL EXTERNO PASS
        +
FIDELIZACION, COMPRA, PEDIDO, ENTREGA, SERVICIO O COMUNICACION PROPIOS
        +
PROYECCION SEGURA Y AUTORIZADA
        =
CLASIFICACION DE CLIENTE
```

La clasificación responde **si la pantalla está diseñada para ser utilizada directamente desde el canal de cliente**. No responde si una pantalla contiene datos de clientes ni si una tarea interna produce efectos visibles para ellos.

---

#### 2. Dependencias consumidas

- `PROC-SCREEN-001` y la identidad estable `VSCREEN-*`;
- `PROC-SCREEN-002` y el catálogo vigente de 177 pantallas;
- `PROC-SCREEN-003` y los 177 vínculos primarios más 272 relacionados;
- `PROC-SCREEN-004` y las 177 anclas de paso;
- `PROC-SCREEN-005` a `PROC-SCREEN-010` y sus seis clasificaciones aprobadas;
- `PROC-CAT-001` a `PROC-CAT-020`;
- `PROC-ACTOR-001` a `PROC-ACTOR-010`;
- `AUTH-CTX-*`, `AUTH-SRV-*`, `AUTH-DB-*` y `AUTH-QA-*`;
- `UX-BASE-001` a `UX-BASE-015`;
- `UX-STATION-001` a `UX-STATION-012`;
- `UX-ADMIN-001` a `UX-ADMIN-005`;
- los contratos aprobados de fidelización, identidad de cliente, privacidad, consentimiento, precio, disponibilidad, pago, pedidos, redención, reclamos, reservas, comunicación, idempotencia, evidencia y handoff.

La tarea consume estas fuentes sin inferir clase de cliente por la presencia de un `customer_id`, un pedido, una venta o un reclamo dentro de una pantalla interna.

---

#### 3. Alcance

1. incorporar `client_fit` a las 177 pantallas;
2. distinguir cliente primaria, cliente secundaria y ausencia de clase;
3. clasificar exactamente las 19 pantallas PASS pendientes;
4. definir doce patrones cerrados;
5. conservar exactos nombres, aplicaciones, procesos, pasos y seis clasificaciones previas;
6. separar canal de cliente de backoffice, POS y operación interna;
7. delimitar visitante anónimo, cliente autenticado y acceso mediante token acotado;
8. proteger propiedad de cuenta, pedido, fidelización, reclamo, reserva y comunicación;
9. establecer fronteras entre comercio, fidelización y servicio;
10. cerrar exactamente una clase primaria por cada una de las 177 pantallas;
11. establecer cambio, versionado, validaciones y carryovers;
12. habilitar exclusivamente `PROC-SCREEN-012`.

---

#### 4. Exclusiones

Esta tarea no:

- convierte en cliente toda pantalla que manipule datos de clientes;
- clasifica PULSO, VISO, NUMERA, NEXO, ORIGO o FOGO como canales externos;
- concede acceso público;
- define autenticación definitiva para cada pantalla;
- concede lectura de cuenta, puntos, pedidos, pagos o reclamos;
- define actores objetivo ni dispositivos soportados;
- define acciones principales o secundarias;
- diseña estados de interfaz;
- vincula APIs, RPC, Server Actions, eventos o tablas;
- mapea rutas o componentes legacy;
- activa AURA.

---

#### 5. Definición canónica de pantalla de cliente

Una pantalla tiene relevancia de cliente cuando está diseñada para que una persona externa a la operación interna pueda materialmente:

- entrar al espacio de fidelización o comercio;
- presentar su identidad de cliente;
- consultar beneficios y recompensas;
- crear una intención de redención;
- consultar el historial de fidelización propio;
- mantener perfil, privacidad y consentimientos propios;
- explorar la oferta comercial vigente;
- configurar una instancia concreta de carrito;
- seleccionar modalidad y programación de entrega;
- revisar una compra, iniciar pago y recibir confirmación;
- consultar y seguir pedidos propios;
- comunicarse sobre su pedido;
- crear y seguir reclamos o casos propios;
- gestionar reservas y eventos propios;
- enviar calificación y satisfacción;
- consultar comunicaciones y notificaciones del canal.

No basta con:

- contener datos de un cliente;
- identificar al cliente en caja;
- acumular o redimir puntos desde un POS interno;
- resolver un reclamo desde el backoffice;
- coordinar una entrega desde PULSO o NEXO;
- consultar ventas o satisfacción agregadas;
- tener una ruta pública técnicamente accesible;
- presentar contenido personalizado a un trabajador;
- pertenecer a una aplicación que intercambia datos con PASS.

---

#### 6. Estados de clasificación

| Valor                  | Significado                                                                                                    | Efecto documental                                              |
| ---------------------- | -------------------------------------------------------------------------------------------------------------- | -------------------------------------------------------------- |
| `PRIMARY_CLIENT`       | la experiencia directa del canal de cliente es la intención dominante                                          | reserva `CLIENT` como clase primaria                           |
| `SECONDARY_CLIENT`     | otra clase es primaria, pero existe una interacción directa y material del cliente dentro de la misma pantalla | agrega relevancia secundaria, solo mediante decisión explícita |
| `OUTSIDE_CLIENT_CLASS` | la pantalla no es utilizada directamente como superficie del canal de cliente                                  | conserva su clase primaria anterior                            |

En el corte aprobado no existe `SECONDARY_CLIENT`. Esta ausencia es deliberada: la clase describe **quién usa directamente la pantalla y desde qué canal**, no si el objeto empresarial está relacionado con un cliente.

---

#### 7. Contrato mínimo

| Campo                           | Obligación                                                           |
| ------------------------------- | -------------------------------------------------------------------- |
| `screen_id`                     | `VSCREEN-*` canónico                                                 |
| `canonical_screen_name`         | nombre exacto del catálogo                                           |
| `primary_application_id`        | aplicación aprobada                                                  |
| `primary_process_id`            | proceso aprobado                                                     |
| `primary_process_step_ref`      | paso aprobado                                                        |
| `operational_fit`               | clasificación aprobada                                               |
| `administrative_fit`            | clasificación aprobada                                               |
| `supervision_fit`               | clasificación aprobada                                               |
| `configuration_fit`             | clasificación aprobada                                               |
| `audit_fit`                     | clasificación aprobada                                               |
| `personal_fit`                  | clasificación aprobada                                               |
| `client_fit`                    | uno de los tres estados aprobados                                    |
| `client_pattern`                | patrón aprobado o `NONE`                                             |
| `client_channel_rule`           | canal, sesión y sujeto permitidos                                    |
| `client_ownership_rule`         | propiedad o token exigidos para recursos propios                     |
| `client_reason`                 | fundamento verificable                                               |
| `client_classification_version` | versión semántica                                                    |
| `client_classification_status`  | `CANONICAL`, `CHANGE_PROPOSED`, `SUPERSEDED` o `RETIRED_WITH_SCREEN` |
| `client_classification_task`    | tarea que aprobó o modificó la decisión                              |

Valores iniciales:

```text
client_classification_version: 1.0.0
client_classification_status: CANONICAL
client_classification_task: PROC-SCREEN-011
decision_record: INITIAL_CLIENT_CLASSIFICATION
canonical_name_source: SCREEN-CANONICAL-CATALOG-001
```

---

#### 8. SCREEN-CLIENT-PATTERN-VOCABULARY-001

| Patrón                        | Uso                                               |
| ----------------------------- | ------------------------------------------------- |
| `CLIENT_HOME_ENTRY`           | entrada a fidelización, beneficios o comercio     |
| `CLIENT_IDENTITY`             | presentación de identidad de cliente              |
| `CLIENT_LOYALTY`              | beneficios, redención e historial de fidelización |
| `CLIENT_PROFILE_PRIVACY`      | perfil, privacidad y consentimientos propios      |
| `CLIENT_OFFER_BROWSE`         | exploración de oferta comercial vigente           |
| `CLIENT_CART`                 | configuración de una instancia de carrito         |
| `CLIENT_FULFILLMENT`          | selección y seguimiento de preparación o entrega  |
| `CLIENT_CHECKOUT_PAYMENT`     | revisión, pago y confirmación segura              |
| `CLIENT_ORDER_SELF_SERVICE`   | consulta de pedidos propios                       |
| `CLIENT_COMMUNICATION`        | comunicaciones de cuenta o pedido                 |
| `CLIENT_SERVICE_RELATIONSHIP` | reclamos, casos, reservas y eventos propios       |
| `CLIENT_FEEDBACK`             | calificación y satisfacción                       |
| `NONE`                        | sin relevancia de cliente bajo esta tarea         |

---

#### 9. Algoritmo de decisión

Se clasifica `PRIMARY_CLIENT` cuando:

1. la pantalla está destinada directamente a cliente o visitante;
2. el canal propietario es PASS;
3. la intención dominante es fidelización, comercio, pedido, cumplimiento, servicio o comunicación propios;
4. el acceso a recursos personales se deriva de sesión, propiedad o token acotado;
5. la pantalla no funciona como backoffice interno ni como estación de trabajo del personal.

Se clasifica `SECONDARY_CLIENT` únicamente cuando:

1. otra clase continúa siendo primaria;
2. el cliente interactúa directamente dentro de la misma pantalla;
3. no se trata solo de datos, efectos o handoffs relacionados con clientes;
4. existe una decisión explícita que justifica compartir la superficie entre canal interno y externo.

Se clasifica `OUTSIDE_CLIENT_CLASS` cuando:

- la pantalla es utilizada por personal interno;
- pertenece a autoservicio laboral;
- opera POS, inventario, producción, compras, finanzas o backoffice;
- supervisa o audita trabajo empresarial;
- configura reglas o maestros;
- procesa información de clientes sin ser presentada directamente al cliente.

---

#### 10. SCREEN-CLIENT-CHANNEL-BOUNDARY-001

La clase de cliente deberá resolver el canal con este orden:

```text
channel_session
    -> visitor_or_customer_principal
        -> customer_subject_scope
            -> resource_ownership_or_scoped_token
                -> authorized_client_projection
```

Reglas:

1. una pantalla de cliente puede admitir visitante anónimo, cliente autenticado o acceso acotado mediante token, según la acción;
2. que una pantalla sea de cliente no significa que sea pública;
3. el servidor deberá determinar qué operaciones requieren autenticación;
4. un identificador enviado por el cliente no probará propiedad;
5. una sesión interna de trabajador no podrá reutilizarse como sesión de cliente;
6. una cuenta de cliente no concederá acceso a aplicaciones internas;
7. toda proyección deberá minimizar estados, notas y datos internos;
8. cualquier handoff hacia PULSO, ORIGO, NEXO, FOGO, NUMERA o VISO conservará propietario, correlación y frontera de datos.

---

#### 11. SCREEN-CLIENT-IDENTITY-OWNERSHIP-CONTRACT-001

Para recursos propios se deberá validar posteriormente:

```text
customer_account_id
customer_profile_id
loyalty_account_id
order_id
claim_id
reservation_id
conversation_id
ownership_basis
access_token_scope
access_token_expiry
```

Reglas:

1. QR, correo, teléfono o documento pueden identificar, pero no conceden por sí solos autorización;
2. pedidos, puntos, redenciones, reclamos, reservas y conversaciones deberán quedar vinculados con la cuenta o token autorizado;
3. un retorno de pago no probará por sí solo que el pago fue aprobado;
4. un enlace de seguimiento deberá ser acotado, revocable y no enumerar otros recursos;
5. la fusión entre visitante y cuenta autenticada deberá evitar apropiación de carritos o pedidos ajenos;
6. cualquier cambio de identidad relevante deberá conservar evidencia y reglas antifraude.

---

#### 12. Fronteras críticas

1. **Cliente vs. personal:** PERSONAL cubre cuenta y autoservicio laboral; CLIENT cubre la relación comercial externa mediante PASS.
2. **Cliente vs. operativo:** crear o seguir un pedido en PASS es cliente; preparar, cobrar o entregar desde PULSO, FOGO o NEXO es operativo.
3. **Cliente vs. administrativo:** presentar un reclamo es cliente; investigarlo, decidir compensación o cerrar el caso internamente conserva su clase propietaria.
4. **Cliente vs. supervisión:** consultar el estado seguro de un pedido propio es cliente; analizar carga, SLA o satisfacción agregada es supervisión.
5. **Cliente vs. configuración:** configurar un carrito es elegir una instancia; mantener oferta, precios o disponibilidad es configuración interna.
6. **Cliente vs. auditoría:** consultar historial propio puede ser cliente con auditoría secundaria; investigar el ledger empresarial es auditoría.
7. **Identidad vs. autorización:** presentar QR identifica al cliente, pero acumular, redimir o consultar saldo exige reglas de servidor.
8. **Checkout vs. pago:** PASS inicia y presenta el resultado; el proveedor y el backend propietario confirman el estado financiero.
9. **Comunicación vs. notas internas:** el cliente solo recibe mensajes autorizados; diagnósticos, deliberaciones y notas internas permanecen ocultos.
10. **PASS vs. PULSO:** PASS es canal externo; PULSO conserva POS, caja, atención y operación interna aunque trate directamente con el cliente.

---

#### 13. SCREEN-CLIENT-CLASSIFICATION-REGISTER-001

| Screen ID      | Pantalla                                              | Aplicación | Paso dominante                                              | Clase operativa             | Clase administrativa           | Clase de supervisión        | Clase de configuración        | Clase de auditoría    | Clase personal           | Clasificación de cliente | Patrón                        | Fundamento                                                                                                                                                                                                                                                                                                                               |
| -------------- | ----------------------------------------------------- | ---------- | ----------------------------------------------------------- | --------------------------- | ------------------------------ | --------------------------- | ----------------------------- | --------------------- | ------------------------ | ------------------------ | ----------------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `VSCREEN-0001` | Hub Vento OS                                          | `shell`    | `VPROC-0059::STEP-ENTER_ECOSYSTEM`                          | `OUTSIDE_OPERATIONAL_CLASS` | `OUTSIDE_ADMINISTRATIVE_CLASS` | `OUTSIDE_SUPERVISION_CLASS` | `OUTSIDE_CONFIGURATION_CLASS` | `OUTSIDE_AUDIT_CLASS` | `PRIMARY_PERSONAL`       | `OUTSIDE_CLIENT_CLASS`   | `NONE`                        | La intención dominante ya está resuelta como `PRIMARY_PERSONAL`. La superficie pertenece al ecosistema laboral o de cuenta interna y no al canal comercial de cliente PASS.                                                                                                                                                              |
| `VSCREEN-0002` | Inicio de sesión y recuperación                       | `shell`    | `VPROC-0059::STEP-AUTHENTICATE_OR_RECOVER`                  | `OUTSIDE_OPERATIONAL_CLASS` | `OUTSIDE_ADMINISTRATIVE_CLASS` | `OUTSIDE_SUPERVISION_CLASS` | `OUTSIDE_CONFIGURATION_CLASS` | `OUTSIDE_AUDIT_CLASS` | `PRIMARY_PERSONAL`       | `OUTSIDE_CLIENT_CLASS`   | `NONE`                        | La intención dominante ya está resuelta como `PRIMARY_PERSONAL`. La superficie pertenece al ecosistema laboral o de cuenta interna y no al canal comercial de cliente PASS.                                                                                                                                                              |
| `VSCREEN-0003` | Resolución de contexto y acceso                       | `shell`    | `VPROC-0059::STEP-RESOLVE_EFFECTIVE_CONTEXT`                | `SECONDARY_OPERATIONAL`     | `SECONDARY_ADMINISTRATIVE`     | `OUTSIDE_SUPERVISION_CLASS` | `OUTSIDE_CONFIGURATION_CLASS` | `OUTSIDE_AUDIT_CLASS` | `PRIMARY_PERSONAL`       | `OUTSIDE_CLIENT_CLASS`   | `NONE`                        | La intención dominante ya está resuelta como `PRIMARY_PERSONAL`. La superficie pertenece al ecosistema laboral o de cuenta interna y no al canal comercial de cliente PASS.                                                                                                                                                              |
| `VSCREEN-0004` | Activación de dispositivo compartido                  | `shell`    | `VPROC-0059::STEP-ACTIVATE_SHARED_DEVICE`                   | `SECONDARY_OPERATIONAL`     | `OUTSIDE_ADMINISTRATIVE_CLASS` | `OUTSIDE_SUPERVISION_CLASS` | `OUTSIDE_CONFIGURATION_CLASS` | `OUTSIDE_AUDIT_CLASS` | `PRIMARY_PERSONAL`       | `OUTSIDE_CLIENT_CLASS`   | `NONE`                        | La intención dominante ya está resuelta como `PRIMARY_PERSONAL`. La superficie pertenece al ecosistema laboral o de cuenta interna y no al canal comercial de cliente PASS.                                                                                                                                                              |
| `VSCREEN-0005` | Bandeja transversal de tareas y notificaciones        | `shell`    | `VPROC-0004::STEP-TRIAGE_TRANSVERSAL_WORK`                  | `SECONDARY_OPERATIONAL`     | `SECONDARY_ADMINISTRATIVE`     | `OUTSIDE_SUPERVISION_CLASS` | `OUTSIDE_CONFIGURATION_CLASS` | `OUTSIDE_AUDIT_CLASS` | `PRIMARY_PERSONAL`       | `OUTSIDE_CLIENT_CLASS`   | `NONE`                        | La intención dominante ya está resuelta como `PRIMARY_PERSONAL`. La superficie pertenece al ecosistema laboral o de cuenta interna y no al canal comercial de cliente PASS.                                                                                                                                                              |
| `VSCREEN-0006` | Centro de soporte y diagnóstico                       | `shell`    | `VPROC-0058::STEP-DIAGNOSE_AND_ROUTE_SUPPORT`               | `SECONDARY_OPERATIONAL`     | `SECONDARY_ADMINISTRATIVE`     | `OUTSIDE_SUPERVISION_CLASS` | `OUTSIDE_CONFIGURATION_CLASS` | `OUTSIDE_AUDIT_CLASS` | `PRIMARY_PERSONAL`       | `OUTSIDE_CLIENT_CLASS`   | `NONE`                        | La intención dominante ya está resuelta como `PRIMARY_PERSONAL`. La superficie pertenece al ecosistema laboral o de cuenta interna y no al canal comercial de cliente PASS.                                                                                                                                                              |
| `VSCREEN-0007` | Inicio ejecutivo y gerencial                          | `viso`     | `VPROC-0001::STEP-REVIEW_EXECUTIVE_WORK`                    | `OUTSIDE_OPERATIONAL_CLASS` | `SECONDARY_ADMINISTRATIVE`     | `PRIMARY_SUPERVISION`       | `OUTSIDE_CONFIGURATION_CLASS` | `OUTSIDE_AUDIT_CLASS` | `OUTSIDE_PERSONAL_CLASS` | `OUTSIDE_CLIENT_CLASS`   | `NONE`                        | La intención dominante ya está resuelta como `PRIMARY_SUPERVISION` y la pantalla pertenece a trabajo interno operativo, administrativo, supervisor, configurable o auditable. Procesar información relacionada con clientes no la convierte en pantalla de cliente.                                                                      |
| `VSCREEN-0008` | Estructura organizativa                               | `viso`     | `VPROC-0002::STEP-MAINTAIN_ORGANIZATIONAL_STRUCTURE`        | `OUTSIDE_OPERATIONAL_CLASS` | `SECONDARY_ADMINISTRATIVE`     | `OUTSIDE_SUPERVISION_CLASS` | `PRIMARY_CONFIGURATION`       | `SECONDARY_AUDIT`     | `OUTSIDE_PERSONAL_CLASS` | `OUTSIDE_CLIENT_CLASS`   | `NONE`                        | La intención dominante ya está resuelta como `PRIMARY_CONFIGURATION` y la pantalla pertenece a trabajo interno operativo, administrativo, supervisor, configurable o auditable. Procesar información relacionada con clientes no la convierte en pantalla de cliente.                                                                    |
| `VSCREEN-0009` | Políticas, delegaciones y límites                     | `viso`     | `VPROC-0003::STEP-AUTHOR_POLICIES_AND_LIMITS`               | `OUTSIDE_OPERATIONAL_CLASS` | `SECONDARY_ADMINISTRATIVE`     | `OUTSIDE_SUPERVISION_CLASS` | `PRIMARY_CONFIGURATION`       | `SECONDARY_AUDIT`     | `OUTSIDE_PERSONAL_CLASS` | `OUTSIDE_CLIENT_CLASS`   | `NONE`                        | La intención dominante ya está resuelta como `PRIMARY_CONFIGURATION` y la pantalla pertenece a trabajo interno operativo, administrativo, supervisor, configurable o auditable. Procesar información relacionada con clientes no la convierte en pantalla de cliente.                                                                    |
| `VSCREEN-0010` | Compromisos y transferencias internas                 | `viso`     | `VPROC-0004::STEP-TRACK_INTERNAL_COMMITMENTS`               | `SECONDARY_OPERATIONAL`     | `PRIMARY_ADMINISTRATIVE`       | `SECONDARY_SUPERVISION`     | `OUTSIDE_CONFIGURATION_CLASS` | `OUTSIDE_AUDIT_CLASS` | `OUTSIDE_PERSONAL_CLASS` | `OUTSIDE_CLIENT_CLASS`   | `NONE`                        | La intención dominante ya está resuelta como `PRIMARY_ADMINISTRATIVE` y la pantalla pertenece a trabajo interno operativo, administrativo, supervisor, configurable o auditable. Procesar información relacionada con clientes no la convierte en pantalla de cliente.                                                                   |
| `VSCREEN-0011` | Embudo de candidatos                                  | `viso`     | `VPROC-0005::STEP-TRIAGE_CANDIDATES`                        | `OUTSIDE_OPERATIONAL_CLASS` | `PRIMARY_ADMINISTRATIVE`       | `OUTSIDE_SUPERVISION_CLASS` | `OUTSIDE_CONFIGURATION_CLASS` | `OUTSIDE_AUDIT_CLASS` | `OUTSIDE_PERSONAL_CLASS` | `OUTSIDE_CLIENT_CLASS`   | `NONE`                        | La intención dominante ya está resuelta como `PRIMARY_ADMINISTRATIVE` y la pantalla pertenece a trabajo interno operativo, administrativo, supervisor, configurable o auditable. Procesar información relacionada con clientes no la convierte en pantalla de cliente.                                                                   |
| `VSCREEN-0012` | Caso de selección                                     | `viso`     | `VPROC-0005::STEP-EVALUATE_AND_DECIDE_CANDIDATE`            | `OUTSIDE_OPERATIONAL_CLASS` | `PRIMARY_ADMINISTRATIVE`       | `OUTSIDE_SUPERVISION_CLASS` | `OUTSIDE_CONFIGURATION_CLASS` | `SECONDARY_AUDIT`     | `OUTSIDE_PERSONAL_CLASS` | `OUTSIDE_CLIENT_CLASS`   | `NONE`                        | La intención dominante ya está resuelta como `PRIMARY_ADMINISTRATIVE` y la pantalla pertenece a trabajo interno operativo, administrativo, supervisor, configurable o auditable. Procesar información relacionada con clientes no la convierte en pantalla de cliente.                                                                   |
| `VSCREEN-0013` | Vinculación e incorporación                           | `viso`     | `VPROC-0006::STEP-ORCHESTRATE_ONBOARDING`                   | `OUTSIDE_OPERATIONAL_CLASS` | `PRIMARY_ADMINISTRATIVE`       | `OUTSIDE_SUPERVISION_CLASS` | `OUTSIDE_CONFIGURATION_CLASS` | `OUTSIDE_AUDIT_CLASS` | `OUTSIDE_PERSONAL_CLASS` | `OUTSIDE_CLIENT_CLASS`   | `NONE`                        | La intención dominante ya está resuelta como `PRIMARY_ADMINISTRATIVE` y la pantalla pertenece a trabajo interno operativo, administrativo, supervisor, configurable o auditable. Procesar información relacionada con clientes no la convierte en pantalla de cliente.                                                                   |
| `VSCREEN-0014` | Directorio y expediente laboral                       | `viso`     | `VPROC-0006::STEP-MAINTAIN_EMPLOYMENT_RECORD`               | `OUTSIDE_OPERATIONAL_CLASS` | `PRIMARY_ADMINISTRATIVE`       | `OUTSIDE_SUPERVISION_CLASS` | `OUTSIDE_CONFIGURATION_CLASS` | `SECONDARY_AUDIT`     | `OUTSIDE_PERSONAL_CLASS` | `OUTSIDE_CLIENT_CLASS`   | `NONE`                        | La intención dominante ya está resuelta como `PRIMARY_ADMINISTRATIVE` y la pantalla pertenece a trabajo interno operativo, administrativo, supervisor, configurable o auditable. Procesar información relacionada con clientes no la convierte en pantalla de cliente.                                                                   |
| `VSCREEN-0015` | Programación laboral                                  | `viso`     | `VPROC-0007::STEP-PLAN_AND_PUBLISH_SCHEDULE`                | `SECONDARY_OPERATIONAL`     | `PRIMARY_ADMINISTRATIVE`       | `SECONDARY_SUPERVISION`     | `OUTSIDE_CONFIGURATION_CLASS` | `OUTSIDE_AUDIT_CLASS` | `OUTSIDE_PERSONAL_CLASS` | `OUTSIDE_CLIENT_CLASS`   | `NONE`                        | La intención dominante ya está resuelta como `PRIMARY_ADMINISTRATIVE` y la pantalla pertenece a trabajo interno operativo, administrativo, supervisor, configurable o auditable. Procesar información relacionada con clientes no la convierte en pantalla de cliente.                                                                   |
| `VSCREEN-0016` | Revisión de asistencia                                | `viso`     | `VPROC-0008::STEP-REVIEW_ATTENDANCE_EXCEPTION`              | `SECONDARY_OPERATIONAL`     | `SECONDARY_ADMINISTRATIVE`     | `PRIMARY_SUPERVISION`       | `OUTSIDE_CONFIGURATION_CLASS` | `SECONDARY_AUDIT`     | `OUTSIDE_PERSONAL_CLASS` | `OUTSIDE_CLIENT_CLASS`   | `NONE`                        | La intención dominante ya está resuelta como `PRIMARY_SUPERVISION` y la pantalla pertenece a trabajo interno operativo, administrativo, supervisor, configurable o auditable. Procesar información relacionada con clientes no la convierte en pantalla de cliente.                                                                      |
| `VSCREEN-0017` | Novedades, ausencias y reemplazos                     | `viso`     | `VPROC-0009::STEP-RESOLVE_WORKFORCE_CASE`                   | `SECONDARY_OPERATIONAL`     | `PRIMARY_ADMINISTRATIVE`       | `SECONDARY_SUPERVISION`     | `OUTSIDE_CONFIGURATION_CLASS` | `OUTSIDE_AUDIT_CLASS` | `OUTSIDE_PERSONAL_CLASS` | `OUTSIDE_CLIENT_CLASS`   | `NONE`                        | La intención dominante ya está resuelta como `PRIMARY_ADMINISTRATIVE` y la pantalla pertenece a trabajo interno operativo, administrativo, supervisor, configurable o auditable. Procesar información relacionada con clientes no la convierte en pantalla de cliente.                                                                   |
| `VSCREEN-0018` | Retiro y revocación coordinada                        | `viso`     | `VPROC-0011::STEP-CLOSE_EMPLOYMENT_AND_REVOKE`              | `OUTSIDE_OPERATIONAL_CLASS` | `PRIMARY_ADMINISTRATIVE`       | `OUTSIDE_SUPERVISION_CLASS` | `OUTSIDE_CONFIGURATION_CLASS` | `SECONDARY_AUDIT`     | `OUTSIDE_PERSONAL_CLASS` | `OUTSIDE_CLIENT_CLASS`   | `NONE`                        | La intención dominante ya está resuelta como `PRIMARY_ADMINISTRATIVE` y la pantalla pertenece a trabajo interno operativo, administrativo, supervisor, configurable o auditable. Procesar información relacionada con clientes no la convierte en pantalla de cliente.                                                                   |
| `VSCREEN-0019` | Catálogo de roles y permisos                          | `viso`     | `VPROC-0059::STEP-MAINTAIN_ACCESS_CATALOG`                  | `OUTSIDE_OPERATIONAL_CLASS` | `SECONDARY_ADMINISTRATIVE`     | `OUTSIDE_SUPERVISION_CLASS` | `PRIMARY_CONFIGURATION`       | `SECONDARY_AUDIT`     | `OUTSIDE_PERSONAL_CLASS` | `OUTSIDE_CLIENT_CLASS`   | `NONE`                        | La intención dominante ya está resuelta como `PRIMARY_CONFIGURATION` y la pantalla pertenece a trabajo interno operativo, administrativo, supervisor, configurable o auditable. Procesar información relacionada con clientes no la convierte en pantalla de cliente.                                                                    |
| `VSCREEN-0020` | Perfil de acceso del trabajador                       | `viso`     | `VPROC-0059::STEP-ASSIGN_EFFECTIVE_ACCESS`                  | `OUTSIDE_OPERATIONAL_CLASS` | `PRIMARY_ADMINISTRATIVE`       | `OUTSIDE_SUPERVISION_CLASS` | `SECONDARY_CONFIGURATION`     | `SECONDARY_AUDIT`     | `OUTSIDE_PERSONAL_CLASS` | `OUTSIDE_CLIENT_CLASS`   | `NONE`                        | La intención dominante ya está resuelta como `PRIMARY_ADMINISTRATIVE` y la pantalla pertenece a trabajo interno operativo, administrativo, supervisor, configurable o auditable. Procesar información relacionada con clientes no la convierte en pantalla de cliente.                                                                   |
| `VSCREEN-0021` | Simulación de permisos y conflictos                   | `viso`     | `VPROC-0059::STEP-SIMULATE_ACCESS_DECISION`                 | `OUTSIDE_OPERATIONAL_CLASS` | `PRIMARY_ADMINISTRATIVE`       | `SECONDARY_SUPERVISION`     | `OUTSIDE_CONFIGURATION_CLASS` | `OUTSIDE_AUDIT_CLASS` | `OUTSIDE_PERSONAL_CLASS` | `OUTSIDE_CLIENT_CLASS`   | `NONE`                        | La intención dominante ya está resuelta como `PRIMARY_ADMINISTRATIVE` y la pantalla pertenece a trabajo interno operativo, administrativo, supervisor, configurable o auditable. Procesar información relacionada con clientes no la convierte en pantalla de cliente.                                                                   |
| `VSCREEN-0022` | Gobierno de dispositivos compartidos                  | `viso`     | `VPROC-0059::STEP-GOVERN_SHARED_DEVICES`                    | `OUTSIDE_OPERATIONAL_CLASS` | `SECONDARY_ADMINISTRATIVE`     | `OUTSIDE_SUPERVISION_CLASS` | `PRIMARY_CONFIGURATION`       | `SECONDARY_AUDIT`     | `OUTSIDE_PERSONAL_CLASS` | `OUTSIDE_CLIENT_CLASS`   | `NONE`                        | La intención dominante ya está resuelta como `PRIMARY_CONFIGURATION` y la pantalla pertenece a trabajo interno operativo, administrativo, supervisor, configurable o auditable. Procesar información relacionada con clientes no la convierte en pantalla de cliente.                                                                    |
| `VSCREEN-0023` | Riesgos de seguridad y salud                          | `viso`     | `VPROC-0012::STEP-ASSESS_SST_RISK`                          | `OUTSIDE_OPERATIONAL_CLASS` | `PRIMARY_ADMINISTRATIVE`       | `SECONDARY_SUPERVISION`     | `OUTSIDE_CONFIGURATION_CLASS` | `SECONDARY_AUDIT`     | `OUTSIDE_PERSONAL_CLASS` | `OUTSIDE_CLIENT_CLASS`   | `NONE`                        | La intención dominante ya está resuelta como `PRIMARY_ADMINISTRATIVE` y la pantalla pertenece a trabajo interno operativo, administrativo, supervisor, configurable o auditable. Procesar información relacionada con clientes no la convierte en pantalla de cliente.                                                                   |
| `VSCREEN-0024` | Incidentes y emergencias                              | `viso`     | `VPROC-0013::STEP-MANAGE_INCIDENT_RESPONSE`                 | `SECONDARY_OPERATIONAL`     | `PRIMARY_ADMINISTRATIVE`       | `SECONDARY_SUPERVISION`     | `OUTSIDE_CONFIGURATION_CLASS` | `SECONDARY_AUDIT`     | `OUTSIDE_PERSONAL_CLASS` | `OUTSIDE_CLIENT_CLASS`   | `NONE`                        | La intención dominante ya está resuelta como `PRIMARY_ADMINISTRATIVE` y la pantalla pertenece a trabajo interno operativo, administrativo, supervisor, configurable o auditable. Procesar información relacionada con clientes no la convierte en pantalla de cliente.                                                                   |
| `VSCREEN-0025` | Controles de higiene y cumplimiento                   | `viso`     | `VPROC-0014::STEP-REVIEW_HYGIENE_COMPLIANCE`                | `SECONDARY_OPERATIONAL`     | `SECONDARY_ADMINISTRATIVE`     | `PRIMARY_SUPERVISION`       | `SECONDARY_CONFIGURATION`     | `SECONDARY_AUDIT`     | `OUTSIDE_PERSONAL_CLASS` | `OUTSIDE_CLIENT_CLASS`   | `NONE`                        | La intención dominante ya está resuelta como `PRIMARY_SUPERVISION` y la pantalla pertenece a trabajo interno operativo, administrativo, supervisor, configurable o auditable. Procesar información relacionada con clientes no la convierte en pantalla de cliente.                                                                      |
| `VSCREEN-0026` | Bandeja de casos administrativos transversales        | `viso`     | `VPROC-0004::STEP-TRIAGE_ADMIN_CASES`                       | `SECONDARY_OPERATIONAL`     | `PRIMARY_ADMINISTRATIVE`       | `SECONDARY_SUPERVISION`     | `OUTSIDE_CONFIGURATION_CLASS` | `OUTSIDE_AUDIT_CLASS` | `OUTSIDE_PERSONAL_CLASS` | `OUTSIDE_CLIENT_CLASS`   | `NONE`                        | La intención dominante ya está resuelta como `PRIMARY_ADMINISTRATIVE` y la pantalla pertenece a trabajo interno operativo, administrativo, supervisor, configurable o auditable. Procesar información relacionada con clientes no la convierte en pantalla de cliente.                                                                   |
| `VSCREEN-0027` | Inicio personal del trabajador                        | `anima`    | `VPROC-0007::STEP-ENTER_PERSONAL_WORKSPACE`                 | `OUTSIDE_OPERATIONAL_CLASS` | `OUTSIDE_ADMINISTRATIVE_CLASS` | `OUTSIDE_SUPERVISION_CLASS` | `OUTSIDE_CONFIGURATION_CLASS` | `OUTSIDE_AUDIT_CLASS` | `PRIMARY_PERSONAL`       | `OUTSIDE_CLIENT_CLASS`   | `NONE`                        | La intención dominante ya está resuelta como `PRIMARY_PERSONAL`. La superficie pertenece al ecosistema laboral o de cuenta interna y no al canal comercial de cliente PASS.                                                                                                                                                              |
| `VSCREEN-0028` | Registro de entrada, pausa y salida                   | `anima`    | `VPROC-0008::STEP-CAPTURE_ATTENDANCE_EVENT`                 | `PRIMARY_OPERATIONAL`       | `OUTSIDE_ADMINISTRATIVE_CLASS` | `OUTSIDE_SUPERVISION_CLASS` | `OUTSIDE_CONFIGURATION_CLASS` | `OUTSIDE_AUDIT_CLASS` | `SECONDARY_PERSONAL`     | `OUTSIDE_CLIENT_CLASS`   | `NONE`                        | La intención dominante ya está resuelta como `PRIMARY_OPERATIONAL`. La superficie pertenece al ecosistema laboral o de cuenta interna y no al canal comercial de cliente PASS.                                                                                                                                                           |
| `VSCREEN-0029` | Mi programación                                       | `anima`    | `VPROC-0007::STEP-CONSULT_PUBLISHED_SCHEDULE`               | `SECONDARY_OPERATIONAL`     | `OUTSIDE_ADMINISTRATIVE_CLASS` | `OUTSIDE_SUPERVISION_CLASS` | `OUTSIDE_CONFIGURATION_CLASS` | `OUTSIDE_AUDIT_CLASS` | `PRIMARY_PERSONAL`       | `OUTSIDE_CLIENT_CLASS`   | `NONE`                        | La intención dominante ya está resuelta como `PRIMARY_PERSONAL`. La superficie pertenece al ecosistema laboral o de cuenta interna y no al canal comercial de cliente PASS.                                                                                                                                                              |
| `VSCREEN-0030` | Mi asistencia y solicitud de corrección               | `anima`    | `VPROC-0008::STEP-CONSULT_OR_REQUEST_ATTENDANCE_CORRECTION` | `SECONDARY_OPERATIONAL`     | `OUTSIDE_ADMINISTRATIVE_CLASS` | `OUTSIDE_SUPERVISION_CLASS` | `OUTSIDE_CONFIGURATION_CLASS` | `SECONDARY_AUDIT`     | `PRIMARY_PERSONAL`       | `OUTSIDE_CLIENT_CLASS`   | `NONE`                        | La intención dominante ya está resuelta como `PRIMARY_PERSONAL`. La superficie pertenece al ecosistema laboral o de cuenta interna y no al canal comercial de cliente PASS.                                                                                                                                                              |
| `VSCREEN-0031` | Mis novedades, permisos y ausencias                   | `anima`    | `VPROC-0009::STEP-SUBMIT_PERSONAL_WORKFORCE_CASE`           | `SECONDARY_OPERATIONAL`     | `OUTSIDE_ADMINISTRATIVE_CLASS` | `OUTSIDE_SUPERVISION_CLASS` | `OUTSIDE_CONFIGURATION_CLASS` | `SECONDARY_AUDIT`     | `PRIMARY_PERSONAL`       | `OUTSIDE_CLIENT_CLASS`   | `NONE`                        | La intención dominante ya está resuelta como `PRIMARY_PERSONAL`. La superficie pertenece al ecosistema laboral o de cuenta interna y no al canal comercial de cliente PASS.                                                                                                                                                              |
| `VSCREEN-0032` | Mi perfil laboral                                     | `anima`    | `VPROC-0006::STEP-MAINTAIN_SELF_SERVICE_PROFILE`            | `OUTSIDE_OPERATIONAL_CLASS` | `OUTSIDE_ADMINISTRATIVE_CLASS` | `OUTSIDE_SUPERVISION_CLASS` | `OUTSIDE_CONFIGURATION_CLASS` | `OUTSIDE_AUDIT_CLASS` | `PRIMARY_PERSONAL`       | `OUTSIDE_CLIENT_CLASS`   | `NONE`                        | La intención dominante ya está resuelta como `PRIMARY_PERSONAL`. La superficie pertenece al ecosistema laboral o de cuenta interna y no al canal comercial de cliente PASS.                                                                                                                                                              |
| `VSCREEN-0033` | Resumen de inventario y abastecimiento interno        | `nexo`     | `VPROC-0028::STEP-MONITOR_INTERNAL_SUPPLY`                  | `SECONDARY_OPERATIONAL`     | `SECONDARY_ADMINISTRATIVE`     | `PRIMARY_SUPERVISION`       | `OUTSIDE_CONFIGURATION_CLASS` | `OUTSIDE_AUDIT_CLASS` | `OUTSIDE_PERSONAL_CLASS` | `OUTSIDE_CLIENT_CLASS`   | `NONE`                        | La intención dominante ya está resuelta como `PRIMARY_SUPERVISION` y la pantalla pertenece a trabajo interno operativo, administrativo, supervisor, configurable o auditable. Procesar información relacionada con clientes no la convierte en pantalla de cliente.                                                                      |
| `VSCREEN-0034` | Catálogo de productos físicos                         | `nexo`     | `VPROC-0015::STEP-CONSULT_PHYSICAL_PRODUCT_CATALOG`         | `SECONDARY_OPERATIONAL`     | `SECONDARY_ADMINISTRATIVE`     | `OUTSIDE_SUPERVISION_CLASS` | `PRIMARY_CONFIGURATION`       | `OUTSIDE_AUDIT_CLASS` | `OUTSIDE_PERSONAL_CLASS` | `OUTSIDE_CLIENT_CLASS`   | `NONE`                        | La intención dominante ya está resuelta como `PRIMARY_CONFIGURATION` y la pantalla pertenece a trabajo interno operativo, administrativo, supervisor, configurable o auditable. Procesar información relacionada con clientes no la convierte en pantalla de cliente.                                                                    |
| `VSCREEN-0035` | Editor de producto, unidad y presentación             | `nexo`     | `VPROC-0015::STEP-MAINTAIN_PRODUCT_PRESENTATION`            | `OUTSIDE_OPERATIONAL_CLASS` | `SECONDARY_ADMINISTRATIVE`     | `OUTSIDE_SUPERVISION_CLASS` | `PRIMARY_CONFIGURATION`       | `SECONDARY_AUDIT`     | `OUTSIDE_PERSONAL_CLASS` | `OUTSIDE_CLIENT_CLASS`   | `NONE`                        | La intención dominante ya está resuelta como `PRIMARY_CONFIGURATION` y la pantalla pertenece a trabajo interno operativo, administrativo, supervisor, configurable o auditable. Procesar información relacionada con clientes no la convierte en pantalla de cliente.                                                                    |
| `VSCREEN-0036` | Especificaciones y criterios de calidad               | `nexo`     | `VPROC-0018::STEP-MAINTAIN_QUALITY_SPECIFICATION`           | `OUTSIDE_OPERATIONAL_CLASS` | `SECONDARY_ADMINISTRATIVE`     | `OUTSIDE_SUPERVISION_CLASS` | `PRIMARY_CONFIGURATION`       | `SECONDARY_AUDIT`     | `OUTSIDE_PERSONAL_CLASS` | `OUTSIDE_CLIENT_CLASS`   | `NONE`                        | La intención dominante ya está resuelta como `PRIMARY_CONFIGURATION` y la pantalla pertenece a trabajo interno operativo, administrativo, supervisor, configurable o auditable. Procesar información relacionada con clientes no la convierte en pantalla de cliente.                                                                    |
| `VSCREEN-0037` | Catálogo de ubicaciones                               | `nexo`     | `VPROC-0023::STEP-MAINTAIN_LOCATION_CATALOG`                | `OUTSIDE_OPERATIONAL_CLASS` | `SECONDARY_ADMINISTRATIVE`     | `OUTSIDE_SUPERVISION_CLASS` | `PRIMARY_CONFIGURATION`       | `SECONDARY_AUDIT`     | `OUTSIDE_PERSONAL_CLASS` | `OUTSIDE_CLIENT_CLASS`   | `NONE`                        | La intención dominante ya está resuelta como `PRIMARY_CONFIGURATION` y la pantalla pertenece a trabajo interno operativo, administrativo, supervisor, configurable o auditable. Procesar información relacionada con clientes no la convierte en pantalla de cliente.                                                                    |
| `VSCREEN-0038` | Identificación y detalle de ubicación                 | `nexo`     | `VPROC-0023::STEP-IDENTIFY_LOCATION_AND_CONTENT`            | `PRIMARY_OPERATIONAL`       | `OUTSIDE_ADMINISTRATIVE_CLASS` | `OUTSIDE_SUPERVISION_CLASS` | `OUTSIDE_CONFIGURATION_CLASS` | `OUTSIDE_AUDIT_CLASS` | `OUTSIDE_PERSONAL_CLASS` | `OUTSIDE_CLIENT_CLASS`   | `NONE`                        | La intención dominante ya está resuelta como `PRIMARY_OPERATIONAL` y la pantalla pertenece a trabajo interno operativo, administrativo, supervisor, configurable o auditable. Procesar información relacionada con clientes no la convierte en pantalla de cliente.                                                                      |
| `VSCREEN-0039` | Consulta de existencias                               | `nexo`     | `VPROC-0024::STEP-CONSULT_STOCK_POSITION`                   | `SECONDARY_OPERATIONAL`     | `OUTSIDE_ADMINISTRATIVE_CLASS` | `PRIMARY_SUPERVISION`       | `OUTSIDE_CONFIGURATION_CLASS` | `OUTSIDE_AUDIT_CLASS` | `OUTSIDE_PERSONAL_CLASS` | `OUTSIDE_CLIENT_CLASS`   | `NONE`                        | La intención dominante ya está resuelta como `PRIMARY_SUPERVISION` y la pantalla pertenece a trabajo interno operativo, administrativo, supervisor, configurable o auditable. Procesar información relacionada con clientes no la convierte en pantalla de cliente.                                                                      |
| `VSCREEN-0040` | Conteo de inventario                                  | `nexo`     | `VPROC-0026::STEP-CAPTURE_PHYSICAL_COUNT`                   | `PRIMARY_OPERATIONAL`       | `OUTSIDE_ADMINISTRATIVE_CLASS` | `OUTSIDE_SUPERVISION_CLASS` | `OUTSIDE_CONFIGURATION_CLASS` | `OUTSIDE_AUDIT_CLASS` | `OUTSIDE_PERSONAL_CLASS` | `OUTSIDE_CLIENT_CLASS`   | `NONE`                        | La intención dominante ya está resuelta como `PRIMARY_OPERATIONAL` y la pantalla pertenece a trabajo interno operativo, administrativo, supervisor, configurable o auditable. Procesar información relacionada con clientes no la convierte en pantalla de cliente.                                                                      |
| `VSCREEN-0041` | Revisión de conteo y diferencias                      | `nexo`     | `VPROC-0026::STEP-REVIEW_COUNT_VARIANCE`                    | `PRIMARY_OPERATIONAL`       | `SECONDARY_ADMINISTRATIVE`     | `SECONDARY_SUPERVISION`     | `OUTSIDE_CONFIGURATION_CLASS` | `SECONDARY_AUDIT`     | `OUTSIDE_PERSONAL_CLASS` | `OUTSIDE_CLIENT_CLASS`   | `NONE`                        | La intención dominante ya está resuelta como `PRIMARY_OPERATIONAL` y la pantalla pertenece a trabajo interno operativo, administrativo, supervisor, configurable o auditable. Procesar información relacionada con clientes no la convierte en pantalla de cliente.                                                                      |
| `VSCREEN-0042` | Caso de ajuste de inventario                          | `nexo`     | `VPROC-0026::STEP-DECIDE_INVENTORY_ADJUSTMENT`              | `PRIMARY_OPERATIONAL`       | `SECONDARY_ADMINISTRATIVE`     | `SECONDARY_SUPERVISION`     | `OUTSIDE_CONFIGURATION_CLASS` | `SECONDARY_AUDIT`     | `OUTSIDE_PERSONAL_CLASS` | `OUTSIDE_CLIENT_CLASS`   | `NONE`                        | La intención dominante ya está resuelta como `PRIMARY_OPERATIONAL` y la pantalla pertenece a trabajo interno operativo, administrativo, supervisor, configurable o auditable. Procesar información relacionada con clientes no la convierte en pantalla de cliente.                                                                      |
| `VSCREEN-0043` | Confirmación de entrada a inventario                  | `nexo`     | `VPROC-0024::STEP-CONFIRM_STOCK_ENTRY`                      | `PRIMARY_OPERATIONAL`       | `OUTSIDE_ADMINISTRATIVE_CLASS` | `OUTSIDE_SUPERVISION_CLASS` | `OUTSIDE_CONFIGURATION_CLASS` | `SECONDARY_AUDIT`     | `OUTSIDE_PERSONAL_CLASS` | `OUTSIDE_CLIENT_CLASS`   | `NONE`                        | La intención dominante ya está resuelta como `PRIMARY_OPERATIONAL` y la pantalla pertenece a trabajo interno operativo, administrativo, supervisor, configurable o auditable. Procesar información relacionada con clientes no la convierte en pantalla de cliente.                                                                      |
| `VSCREEN-0044` | Retiro y consumo de existencias                       | `nexo`     | `VPROC-0025::STEP-EXECUTE_STOCK_WITHDRAWAL`                 | `PRIMARY_OPERATIONAL`       | `OUTSIDE_ADMINISTRATIVE_CLASS` | `OUTSIDE_SUPERVISION_CLASS` | `OUTSIDE_CONFIGURATION_CLASS` | `OUTSIDE_AUDIT_CLASS` | `OUTSIDE_PERSONAL_CLASS` | `OUTSIDE_CLIENT_CLASS`   | `NONE`                        | La intención dominante ya está resuelta como `PRIMARY_OPERATIONAL` y la pantalla pertenece a trabajo interno operativo, administrativo, supervisor, configurable o auditable. Procesar información relacionada con clientes no la convierte en pantalla de cliente.                                                                      |
| `VSCREEN-0045` | Traslado interno de existencias                       | `nexo`     | `VPROC-0025::STEP-EXECUTE_INTERNAL_TRANSFER`                | `PRIMARY_OPERATIONAL`       | `OUTSIDE_ADMINISTRATIVE_CLASS` | `OUTSIDE_SUPERVISION_CLASS` | `OUTSIDE_CONFIGURATION_CLASS` | `OUTSIDE_AUDIT_CLASS` | `OUTSIDE_PERSONAL_CLASS` | `OUTSIDE_CLIENT_CLASS`   | `NONE`                        | La intención dominante ya está resuelta como `PRIMARY_OPERATIONAL` y la pantalla pertenece a trabajo interno operativo, administrativo, supervisor, configurable o auditable. Procesar información relacionada con clientes no la convierte en pantalla de cliente.                                                                      |
| `VSCREEN-0046` | Solicitud de remisión                                 | `nexo`     | `VPROC-0028::STEP-SUBMIT_REPLENISHMENT_REQUEST`             | `PRIMARY_OPERATIONAL`       | `OUTSIDE_ADMINISTRATIVE_CLASS` | `OUTSIDE_SUPERVISION_CLASS` | `OUTSIDE_CONFIGURATION_CLASS` | `OUTSIDE_AUDIT_CLASS` | `OUTSIDE_PERSONAL_CLASS` | `OUTSIDE_CLIENT_CLASS`   | `NONE`                        | La intención dominante ya está resuelta como `PRIMARY_OPERATIONAL` y la pantalla pertenece a trabajo interno operativo, administrativo, supervisor, configurable o auditable. Procesar información relacionada con clientes no la convierte en pantalla de cliente.                                                                      |
| `VSCREEN-0047` | Preparación de remisión                               | `nexo`     | `VPROC-0028::STEP-PREPARE_REPLENISHMENT`                    | `PRIMARY_OPERATIONAL`       | `OUTSIDE_ADMINISTRATIVE_CLASS` | `OUTSIDE_SUPERVISION_CLASS` | `OUTSIDE_CONFIGURATION_CLASS` | `OUTSIDE_AUDIT_CLASS` | `OUTSIDE_PERSONAL_CLASS` | `OUTSIDE_CLIENT_CLASS`   | `NONE`                        | La intención dominante ya está resuelta como `PRIMARY_OPERATIONAL` y la pantalla pertenece a trabajo interno operativo, administrativo, supervisor, configurable o auditable. Procesar información relacionada con clientes no la convierte en pantalla de cliente.                                                                      |
| `VSCREEN-0048` | Carga y despacho de remisión                          | `nexo`     | `VPROC-0028::STEP-LOAD_AND_DISPATCH_REPLENISHMENT`          | `PRIMARY_OPERATIONAL`       | `OUTSIDE_ADMINISTRATIVE_CLASS` | `OUTSIDE_SUPERVISION_CLASS` | `OUTSIDE_CONFIGURATION_CLASS` | `OUTSIDE_AUDIT_CLASS` | `OUTSIDE_PERSONAL_CLASS` | `OUTSIDE_CLIENT_CLASS`   | `NONE`                        | La intención dominante ya está resuelta como `PRIMARY_OPERATIONAL` y la pantalla pertenece a trabajo interno operativo, administrativo, supervisor, configurable o auditable. Procesar información relacionada con clientes no la convierte en pantalla de cliente.                                                                      |
| `VSCREEN-0049` | Seguimiento de remisión en tránsito                   | `nexo`     | `VPROC-0028::STEP-MONITOR_REPLENISHMENT_TRANSIT`            | `PRIMARY_OPERATIONAL`       | `OUTSIDE_ADMINISTRATIVE_CLASS` | `SECONDARY_SUPERVISION`     | `OUTSIDE_CONFIGURATION_CLASS` | `SECONDARY_AUDIT`     | `OUTSIDE_PERSONAL_CLASS` | `OUTSIDE_CLIENT_CLASS`   | `NONE`                        | La intención dominante ya está resuelta como `PRIMARY_OPERATIONAL` y la pantalla pertenece a trabajo interno operativo, administrativo, supervisor, configurable o auditable. Procesar información relacionada con clientes no la convierte en pantalla de cliente.                                                                      |
| `VSCREEN-0050` | Recepción de remisión                                 | `nexo`     | `VPROC-0028::STEP-RECEIVE_REPLENISHMENT`                    | `PRIMARY_OPERATIONAL`       | `OUTSIDE_ADMINISTRATIVE_CLASS` | `SECONDARY_SUPERVISION`     | `OUTSIDE_CONFIGURATION_CLASS` | `SECONDARY_AUDIT`     | `OUTSIDE_PERSONAL_CLASS` | `OUTSIDE_CLIENT_CLASS`   | `NONE`                        | La intención dominante ya está resuelta como `PRIMARY_OPERATIONAL` y la pantalla pertenece a trabajo interno operativo, administrativo, supervisor, configurable o auditable. Procesar información relacionada con clientes no la convierte en pantalla de cliente.                                                                      |
| `VSCREEN-0051` | Vencimiento, cuarentena, daño y merma                 | `nexo`     | `VPROC-0027::STEP-RESOLVE_STOCK_CONDITION`                  | `PRIMARY_OPERATIONAL`       | `SECONDARY_ADMINISTRATIVE`     | `SECONDARY_SUPERVISION`     | `OUTSIDE_CONFIGURATION_CLASS` | `SECONDARY_AUDIT`     | `OUTSIDE_PERSONAL_CLASS` | `OUTSIDE_CLIENT_CLASS`   | `NONE`                        | La intención dominante ya está resuelta como `PRIMARY_OPERATIONAL` y la pantalla pertenece a trabajo interno operativo, administrativo, supervisor, configurable o auditable. Procesar información relacionada con clientes no la convierte en pantalla de cliente.                                                                      |
| `VSCREEN-0052` | LPN, contenedores y reutilizables                     | `nexo`     | `VPROC-0032::STEP-MANAGE_LPN_AND_REUSABLES`                 | `PRIMARY_OPERATIONAL`       | `OUTSIDE_ADMINISTRATIVE_CLASS` | `OUTSIDE_SUPERVISION_CLASS` | `OUTSIDE_CONFIGURATION_CLASS` | `SECONDARY_AUDIT`     | `OUTSIDE_PERSONAL_CLASS` | `OUTSIDE_CLIENT_CLASS`   | `NONE`                        | La intención dominante ya está resuelta como `PRIMARY_OPERATIONAL` y la pantalla pertenece a trabajo interno operativo, administrativo, supervisor, configurable o auditable. Procesar información relacionada con clientes no la convierte en pantalla de cliente.                                                                      |
| `VSCREEN-0053` | Activos y custodia                                    | `nexo`     | `VPROC-0029::STEP-MANAGE_ASSET_CUSTODY`                     | `PRIMARY_OPERATIONAL`       | `SECONDARY_ADMINISTRATIVE`     | `SECONDARY_SUPERVISION`     | `OUTSIDE_CONFIGURATION_CLASS` | `SECONDARY_AUDIT`     | `OUTSIDE_PERSONAL_CLASS` | `OUTSIDE_CLIENT_CLASS`   | `NONE`                        | La intención dominante ya está resuelta como `PRIMARY_OPERATIONAL` y la pantalla pertenece a trabajo interno operativo, administrativo, supervisor, configurable o auditable. Procesar información relacionada con clientes no la convierte en pantalla de cliente.                                                                      |
| `VSCREEN-0054` | Etiquetas e impresión logística                       | `nexo`     | `VPROC-0024::STEP-ISSUE_LOGISTICS_LABEL`                    | `PRIMARY_OPERATIONAL`       | `OUTSIDE_ADMINISTRATIVE_CLASS` | `OUTSIDE_SUPERVISION_CLASS` | `OUTSIDE_CONFIGURATION_CLASS` | `OUTSIDE_AUDIT_CLASS` | `OUTSIDE_PERSONAL_CLASS` | `OUTSIDE_CLIENT_CLASS`   | `NONE`                        | La intención dominante ya está resuelta como `PRIMARY_OPERATIONAL` y la pantalla pertenece a trabajo interno operativo, administrativo, supervisor, configurable o auditable. Procesar información relacionada con clientes no la convierte en pantalla de cliente.                                                                      |
| `VSCREEN-0055` | Inicio y cola de producción                           | `fogo`     | `VPROC-0033::STEP-TRIAGE_PRODUCTION_QUEUE`                  | `SECONDARY_OPERATIONAL`     | `SECONDARY_ADMINISTRATIVE`     | `PRIMARY_SUPERVISION`       | `OUTSIDE_CONFIGURATION_CLASS` | `OUTSIDE_AUDIT_CLASS` | `OUTSIDE_PERSONAL_CLASS` | `OUTSIDE_CLIENT_CLASS`   | `NONE`                        | La intención dominante ya está resuelta como `PRIMARY_SUPERVISION` y la pantalla pertenece a trabajo interno operativo, administrativo, supervisor, configurable o auditable. Procesar información relacionada con clientes no la convierte en pantalla de cliente.                                                                      |
| `VSCREEN-0056` | Planeación de producción                              | `fogo`     | `VPROC-0033::STEP-PLAN_PRODUCTION`                          | `SECONDARY_OPERATIONAL`     | `SECONDARY_ADMINISTRATIVE`     | `PRIMARY_SUPERVISION`       | `OUTSIDE_CONFIGURATION_CLASS` | `OUTSIDE_AUDIT_CLASS` | `OUTSIDE_PERSONAL_CLASS` | `OUTSIDE_CLIENT_CLASS`   | `NONE`                        | La intención dominante ya está resuelta como `PRIMARY_SUPERVISION` y la pantalla pertenece a trabajo interno operativo, administrativo, supervisor, configurable o auditable. Procesar información relacionada con clientes no la convierte en pantalla de cliente.                                                                      |
| `VSCREEN-0057` | Preparación e inicio de lote                          | `fogo`     | `VPROC-0034::STEP-PREPARE_AND_START_BATCH`                  | `PRIMARY_OPERATIONAL`       | `OUTSIDE_ADMINISTRATIVE_CLASS` | `OUTSIDE_SUPERVISION_CLASS` | `OUTSIDE_CONFIGURATION_CLASS` | `OUTSIDE_AUDIT_CLASS` | `OUTSIDE_PERSONAL_CLASS` | `OUTSIDE_CLIENT_CLASS`   | `NONE`                        | La intención dominante ya está resuelta como `PRIMARY_OPERATIONAL` y la pantalla pertenece a trabajo interno operativo, administrativo, supervisor, configurable o auditable. Procesar información relacionada con clientes no la convierte en pantalla de cliente.                                                                      |
| `VSCREEN-0058` | Ejecución de lote                                     | `fogo`     | `VPROC-0034::STEP-EXECUTE_BATCH`                            | `PRIMARY_OPERATIONAL`       | `OUTSIDE_ADMINISTRATIVE_CLASS` | `OUTSIDE_SUPERVISION_CLASS` | `OUTSIDE_CONFIGURATION_CLASS` | `OUTSIDE_AUDIT_CLASS` | `OUTSIDE_PERSONAL_CLASS` | `OUTSIDE_CLIENT_CLASS`   | `NONE`                        | La intención dominante ya está resuelta como `PRIMARY_OPERATIONAL` y la pantalla pertenece a trabajo interno operativo, administrativo, supervisor, configurable o auditable. Procesar información relacionada con clientes no la convierte en pantalla de cliente.                                                                      |
| `VSCREEN-0059` | Registro parcial de producción                        | `fogo`     | `VPROC-0034::STEP-CAPTURE_BATCH_PROGRESS`                   | `PRIMARY_OPERATIONAL`       | `OUTSIDE_ADMINISTRATIVE_CLASS` | `SECONDARY_SUPERVISION`     | `OUTSIDE_CONFIGURATION_CLASS` | `OUTSIDE_AUDIT_CLASS` | `OUTSIDE_PERSONAL_CLASS` | `OUTSIDE_CLIENT_CLASS`   | `NONE`                        | La intención dominante ya está resuelta como `PRIMARY_OPERATIONAL` y la pantalla pertenece a trabajo interno operativo, administrativo, supervisor, configurable o auditable. Procesar información relacionada con clientes no la convierte en pantalla de cliente.                                                                      |
| `VSCREEN-0060` | Finalización y cierre de lote                         | `fogo`     | `VPROC-0037::STEP-CLOSE_BATCH`                              | `PRIMARY_OPERATIONAL`       | `OUTSIDE_ADMINISTRATIVE_CLASS` | `SECONDARY_SUPERVISION`     | `OUTSIDE_CONFIGURATION_CLASS` | `OUTSIDE_AUDIT_CLASS` | `OUTSIDE_PERSONAL_CLASS` | `OUTSIDE_CLIENT_CLASS`   | `NONE`                        | La intención dominante ya está resuelta como `PRIMARY_OPERATIONAL` y la pantalla pertenece a trabajo interno operativo, administrativo, supervisor, configurable o auditable. Procesar información relacionada con clientes no la convierte en pantalla de cliente.                                                                      |
| `VSCREEN-0061` | Receta operativa                                      | `fogo`     | `VPROC-0016::STEP-CONSULT_APPLICABLE_RECIPE`                | `PRIMARY_OPERATIONAL`       | `OUTSIDE_ADMINISTRATIVE_CLASS` | `OUTSIDE_SUPERVISION_CLASS` | `OUTSIDE_CONFIGURATION_CLASS` | `OUTSIDE_AUDIT_CLASS` | `OUTSIDE_PERSONAL_CLASS` | `OUTSIDE_CLIENT_CLASS`   | `NONE`                        | La intención dominante ya está resuelta como `PRIMARY_OPERATIONAL` y la pantalla pertenece a trabajo interno operativo, administrativo, supervisor, configurable o auditable. Procesar información relacionada con clientes no la convierte en pantalla de cliente.                                                                      |
| `VSCREEN-0062` | Catálogo y editor de recetas                          | `fogo`     | `VPROC-0016::STEP-AUTHOR_RECIPE`                            | `OUTSIDE_OPERATIONAL_CLASS` | `SECONDARY_ADMINISTRATIVE`     | `OUTSIDE_SUPERVISION_CLASS` | `PRIMARY_CONFIGURATION`       | `SECONDARY_AUDIT`     | `OUTSIDE_PERSONAL_CLASS` | `OUTSIDE_CLIENT_CLASS`   | `NONE`                        | La intención dominante ya está resuelta como `PRIMARY_CONFIGURATION` y la pantalla pertenece a trabajo interno operativo, administrativo, supervisor, configurable o auditable. Procesar información relacionada con clientes no la convierte en pantalla de cliente.                                                                    |
| `VSCREEN-0063` | Revisión, aprobación y publicación de receta          | `fogo`     | `VPROC-0016::STEP-APPROVE_AND_PUBLISH_RECIPE`               | `OUTSIDE_OPERATIONAL_CLASS` | `SECONDARY_ADMINISTRATIVE`     | `OUTSIDE_SUPERVISION_CLASS` | `PRIMARY_CONFIGURATION`       | `SECONDARY_AUDIT`     | `OUTSIDE_PERSONAL_CLASS` | `OUTSIDE_CLIENT_CLASS`   | `NONE`                        | La intención dominante ya está resuelta como `PRIMARY_CONFIGURATION` y la pantalla pertenece a trabajo interno operativo, administrativo, supervisor, configurable o auditable. Procesar información relacionada con clientes no la convierte en pantalla de cliente.                                                                    |
| `VSCREEN-0064` | Prueba de receta y rendimiento                        | `fogo`     | `VPROC-0016::STEP-TEST_RECIPE_AND_YIELD`                    | `PRIMARY_OPERATIONAL`       | `SECONDARY_ADMINISTRATIVE`     | `SECONDARY_SUPERVISION`     | `OUTSIDE_CONFIGURATION_CLASS` | `SECONDARY_AUDIT`     | `OUTSIDE_PERSONAL_CLASS` | `OUTSIDE_CLIENT_CLASS`   | `NONE`                        | La intención dominante ya está resuelta como `PRIMARY_OPERATIONAL` y la pantalla pertenece a trabajo interno operativo, administrativo, supervisor, configurable o auditable. Procesar información relacionada con clientes no la convierte en pantalla de cliente.                                                                      |
| `VSCREEN-0065` | Control de calidad y liberación                       | `fogo`     | `VPROC-0035::STEP-DECIDE_QUALITY_RELEASE`                   | `PRIMARY_OPERATIONAL`       | `SECONDARY_ADMINISTRATIVE`     | `SECONDARY_SUPERVISION`     | `OUTSIDE_CONFIGURATION_CLASS` | `SECONDARY_AUDIT`     | `OUTSIDE_PERSONAL_CLASS` | `OUTSIDE_CLIENT_CLASS`   | `NONE`                        | La intención dominante ya está resuelta como `PRIMARY_OPERATIONAL` y la pantalla pertenece a trabajo interno operativo, administrativo, supervisor, configurable o auditable. Procesar información relacionada con clientes no la convierte en pantalla de cliente.                                                                      |
| `VSCREEN-0066` | Empaque, etiquetado y almacenamiento de terminado     | `fogo`     | `VPROC-0036::STEP-PACK_AND_TRANSFER_FINISHED_GOOD`          | `PRIMARY_OPERATIONAL`       | `OUTSIDE_ADMINISTRATIVE_CLASS` | `OUTSIDE_SUPERVISION_CLASS` | `OUTSIDE_CONFIGURATION_CLASS` | `SECONDARY_AUDIT`     | `OUTSIDE_PERSONAL_CLASS` | `OUTSIDE_CLIENT_CLASS`   | `NONE`                        | La intención dominante ya está resuelta como `PRIMARY_OPERATIONAL` y la pantalla pertenece a trabajo interno operativo, administrativo, supervisor, configurable o auditable. Procesar información relacionada con clientes no la convierte en pantalla de cliente.                                                                      |
| `VSCREEN-0067` | Reproceso, aprovechamiento, merma y cierre productivo | `fogo`     | `VPROC-0037::STEP-RESOLVE_PRODUCTION_DISPOSITION`           | `PRIMARY_OPERATIONAL`       | `SECONDARY_ADMINISTRATIVE`     | `SECONDARY_SUPERVISION`     | `OUTSIDE_CONFIGURATION_CLASS` | `OUTSIDE_AUDIT_CLASS` | `OUTSIDE_PERSONAL_CLASS` | `OUTSIDE_CLIENT_CLASS`   | `NONE`                        | La intención dominante ya está resuelta como `PRIMARY_OPERATIONAL` y la pantalla pertenece a trabajo interno operativo, administrativo, supervisor, configurable o auditable. Procesar información relacionada con clientes no la convierte en pantalla de cliente.                                                                      |
| `VSCREEN-0068` | Bandeja de necesidades de compra                      | `origo`    | `VPROC-0019::STEP-TRIAGE_PURCHASE_NEEDS`                    | `SECONDARY_OPERATIONAL`     | `PRIMARY_ADMINISTRATIVE`       | `SECONDARY_SUPERVISION`     | `OUTSIDE_CONFIGURATION_CLASS` | `OUTSIDE_AUDIT_CLASS` | `OUTSIDE_PERSONAL_CLASS` | `OUTSIDE_CLIENT_CLASS`   | `NONE`                        | La intención dominante ya está resuelta como `PRIMARY_ADMINISTRATIVE` y la pantalla pertenece a trabajo interno operativo, administrativo, supervisor, configurable o auditable. Procesar información relacionada con clientes no la convierte en pantalla de cliente.                                                                   |
| `VSCREEN-0069` | Solicitud de compra                                   | `origo`    | `VPROC-0019::STEP-SUBMIT_PURCHASE_REQUEST`                  | `OUTSIDE_OPERATIONAL_CLASS` | `PRIMARY_ADMINISTRATIVE`       | `OUTSIDE_SUPERVISION_CLASS` | `OUTSIDE_CONFIGURATION_CLASS` | `OUTSIDE_AUDIT_CLASS` | `OUTSIDE_PERSONAL_CLASS` | `OUTSIDE_CLIENT_CLASS`   | `NONE`                        | La intención dominante ya está resuelta como `PRIMARY_ADMINISTRATIVE` y la pantalla pertenece a trabajo interno operativo, administrativo, supervisor, configurable o auditable. Procesar información relacionada con clientes no la convierte en pantalla de cliente.                                                                   |
| `VSCREEN-0070` | Catálogo de proveedores                               | `origo`    | `VPROC-0020::STEP-CONSULT_SUPPLIER_CATALOG`                 | `OUTSIDE_OPERATIONAL_CLASS` | `SECONDARY_ADMINISTRATIVE`     | `OUTSIDE_SUPERVISION_CLASS` | `PRIMARY_CONFIGURATION`       | `OUTSIDE_AUDIT_CLASS` | `OUTSIDE_PERSONAL_CLASS` | `OUTSIDE_CLIENT_CLASS`   | `NONE`                        | La intención dominante ya está resuelta como `PRIMARY_CONFIGURATION` y la pantalla pertenece a trabajo interno operativo, administrativo, supervisor, configurable o auditable. Procesar información relacionada con clientes no la convierte en pantalla de cliente.                                                                    |
| `VSCREEN-0071` | Alta y expediente de proveedor                        | `origo`    | `VPROC-0020::STEP-ONBOARD_SUPPLIER`                         | `OUTSIDE_OPERATIONAL_CLASS` | `PRIMARY_ADMINISTRATIVE`       | `OUTSIDE_SUPERVISION_CLASS` | `SECONDARY_CONFIGURATION`     | `SECONDARY_AUDIT`     | `OUTSIDE_PERSONAL_CLASS` | `OUTSIDE_CLIENT_CLASS`   | `NONE`                        | La intención dominante ya está resuelta como `PRIMARY_ADMINISTRATIVE` y la pantalla pertenece a trabajo interno operativo, administrativo, supervisor, configurable o auditable. Procesar información relacionada con clientes no la convierte en pantalla de cliente.                                                                   |
| `VSCREEN-0072` | Comparación de cotizaciones                           | `origo`    | `VPROC-0020::STEP-COMPARE_QUOTES`                           | `OUTSIDE_OPERATIONAL_CLASS` | `PRIMARY_ADMINISTRATIVE`       | `OUTSIDE_SUPERVISION_CLASS` | `OUTSIDE_CONFIGURATION_CLASS` | `SECONDARY_AUDIT`     | `OUTSIDE_PERSONAL_CLASS` | `OUTSIDE_CLIENT_CLASS`   | `NONE`                        | La intención dominante ya está resuelta como `PRIMARY_ADMINISTRATIVE` y la pantalla pertenece a trabajo interno operativo, administrativo, supervisor, configurable o auditable. Procesar información relacionada con clientes no la convierte en pantalla de cliente.                                                                   |
| `VSCREEN-0073` | Editor de orden de compra                             | `origo`    | `VPROC-0021::STEP-PREPARE_PURCHASE_ORDER`                   | `OUTSIDE_OPERATIONAL_CLASS` | `PRIMARY_ADMINISTRATIVE`       | `OUTSIDE_SUPERVISION_CLASS` | `OUTSIDE_CONFIGURATION_CLASS` | `SECONDARY_AUDIT`     | `OUTSIDE_PERSONAL_CLASS` | `OUTSIDE_CLIENT_CLASS`   | `NONE`                        | La intención dominante ya está resuelta como `PRIMARY_ADMINISTRATIVE` y la pantalla pertenece a trabajo interno operativo, administrativo, supervisor, configurable o auditable. Procesar información relacionada con clientes no la convierte en pantalla de cliente.                                                                   |
| `VSCREEN-0074` | Bandeja de aprobaciones de compra                     | `origo`    | `VPROC-0021::STEP-APPROVE_PURCHASE`                         | `OUTSIDE_OPERATIONAL_CLASS` | `PRIMARY_ADMINISTRATIVE`       | `SECONDARY_SUPERVISION`     | `OUTSIDE_CONFIGURATION_CLASS` | `SECONDARY_AUDIT`     | `OUTSIDE_PERSONAL_CLASS` | `OUTSIDE_CLIENT_CLASS`   | `NONE`                        | La intención dominante ya está resuelta como `PRIMARY_ADMINISTRATIVE` y la pantalla pertenece a trabajo interno operativo, administrativo, supervisor, configurable o auditable. Procesar información relacionada con clientes no la convierte en pantalla de cliente.                                                                   |
| `VSCREEN-0075` | Detalle y seguimiento de orden                        | `origo`    | `VPROC-0021::STEP-MONITOR_PURCHASE_ORDER`                   | `SECONDARY_OPERATIONAL`     | `PRIMARY_ADMINISTRATIVE`       | `SECONDARY_SUPERVISION`     | `OUTSIDE_CONFIGURATION_CLASS` | `SECONDARY_AUDIT`     | `OUTSIDE_PERSONAL_CLASS` | `OUTSIDE_CLIENT_CLASS`   | `NONE`                        | La intención dominante ya está resuelta como `PRIMARY_ADMINISTRATIVE` y la pantalla pertenece a trabajo interno operativo, administrativo, supervisor, configurable o auditable. Procesar información relacionada con clientes no la convierte en pantalla de cliente.                                                                   |
| `VSCREEN-0076` | Cola de recepciones                                   | `origo`    | `VPROC-0022::STEP-TRIAGE_RECEIPT_QUEUE`                     | `SECONDARY_OPERATIONAL`     | `SECONDARY_ADMINISTRATIVE`     | `PRIMARY_SUPERVISION`       | `OUTSIDE_CONFIGURATION_CLASS` | `OUTSIDE_AUDIT_CLASS` | `OUTSIDE_PERSONAL_CLASS` | `OUTSIDE_CLIENT_CLASS`   | `NONE`                        | La intención dominante ya está resuelta como `PRIMARY_SUPERVISION` y la pantalla pertenece a trabajo interno operativo, administrativo, supervisor, configurable o auditable. Procesar información relacionada con clientes no la convierte en pantalla de cliente.                                                                      |
| `VSCREEN-0077` | Recepción total o parcial                             | `origo`    | `VPROC-0022::STEP-RECEIVE_PURCHASE`                         | `PRIMARY_OPERATIONAL`       | `SECONDARY_ADMINISTRATIVE`     | `SECONDARY_SUPERVISION`     | `OUTSIDE_CONFIGURATION_CLASS` | `SECONDARY_AUDIT`     | `OUTSIDE_PERSONAL_CLASS` | `OUTSIDE_CLIENT_CLASS`   | `NONE`                        | La intención dominante ya está resuelta como `PRIMARY_OPERATIONAL` y la pantalla pertenece a trabajo interno operativo, administrativo, supervisor, configurable o auditable. Procesar información relacionada con clientes no la convierte en pantalla de cliente.                                                                      |
| `VSCREEN-0078` | Resolución de diferencias de recepción                | `origo`    | `VPROC-0022::STEP-RESOLVE_RECEIPT_VARIANCE`                 | `PRIMARY_OPERATIONAL`       | `SECONDARY_ADMINISTRATIVE`     | `SECONDARY_SUPERVISION`     | `OUTSIDE_CONFIGURATION_CLASS` | `SECONDARY_AUDIT`     | `OUTSIDE_PERSONAL_CLASS` | `OUTSIDE_CLIENT_CLASS`   | `NONE`                        | La intención dominante ya está resuelta como `PRIMARY_OPERATIONAL` y la pantalla pertenece a trabajo interno operativo, administrativo, supervisor, configurable o auditable. Procesar información relacionada con clientes no la convierte en pantalla de cliente.                                                                      |
| `VSCREEN-0079` | Historial y auditoría de abastecimiento               | `origo`    | `VPROC-0022::STEP-AUDIT_PROCUREMENT_CYCLE`                  | `OUTSIDE_OPERATIONAL_CLASS` | `SECONDARY_ADMINISTRATIVE`     | `OUTSIDE_SUPERVISION_CLASS` | `OUTSIDE_CONFIGURATION_CLASS` | `PRIMARY_AUDIT`       | `OUTSIDE_PERSONAL_CLASS` | `OUTSIDE_CLIENT_CLASS`   | `NONE`                        | La intención dominante ya está resuelta como `PRIMARY_AUDIT` y la pantalla pertenece a trabajo interno operativo, administrativo, supervisor, configurable o auditable. Procesar información relacionada con clientes no la convierte en pantalla de cliente.                                                                            |
| `VSCREEN-0080` | Inicio POS                                            | `pulso`    | `VPROC-0039::STEP-ENTER_POS_WORKSPACE`                      | `PRIMARY_OPERATIONAL`       | `OUTSIDE_ADMINISTRATIVE_CLASS` | `SECONDARY_SUPERVISION`     | `OUTSIDE_CONFIGURATION_CLASS` | `OUTSIDE_AUDIT_CLASS` | `OUTSIDE_PERSONAL_CLASS` | `OUTSIDE_CLIENT_CLASS`   | `NONE`                        | La intención dominante ya está resuelta como `PRIMARY_OPERATIONAL`. Aunque PULSO pueda identificar, atender o resolver asuntos de clientes, la pantalla es utilizada por personal interno y no constituye una superficie del canal de cliente.                                                                                           |
| `VSCREEN-0081` | Creación de venta o pedido                            | `pulso`    | `VPROC-0039::STEP-CREATE_SALE_OR_ORDER`                     | `PRIMARY_OPERATIONAL`       | `OUTSIDE_ADMINISTRATIVE_CLASS` | `OUTSIDE_SUPERVISION_CLASS` | `OUTSIDE_CONFIGURATION_CLASS` | `OUTSIDE_AUDIT_CLASS` | `OUTSIDE_PERSONAL_CLASS` | `OUTSIDE_CLIENT_CLASS`   | `NONE`                        | La intención dominante ya está resuelta como `PRIMARY_OPERATIONAL`. Aunque PULSO pueda identificar, atender o resolver asuntos de clientes, la pantalla es utilizada por personal interno y no constituye una superficie del canal de cliente.                                                                                           |
| `VSCREEN-0082` | Mapa de salón y mesas                                 | `pulso`    | `VPROC-0038::STEP-MANAGE_TABLE_SERVICE`                     | `PRIMARY_OPERATIONAL`       | `OUTSIDE_ADMINISTRATIVE_CLASS` | `SECONDARY_SUPERVISION`     | `OUTSIDE_CONFIGURATION_CLASS` | `OUTSIDE_AUDIT_CLASS` | `OUTSIDE_PERSONAL_CLASS` | `OUTSIDE_CLIENT_CLASS`   | `NONE`                        | La intención dominante ya está resuelta como `PRIMARY_OPERATIONAL`. Aunque PULSO pueda identificar, atender o resolver asuntos de clientes, la pantalla es utilizada por personal interno y no constituye una superficie del canal de cliente.                                                                                           |
| `VSCREEN-0083` | Detalle y modificación de pedido                      | `pulso`    | `VPROC-0038::STEP-MODIFY_ACTIVE_ORDER`                      | `PRIMARY_OPERATIONAL`       | `OUTSIDE_ADMINISTRATIVE_CLASS` | `OUTSIDE_SUPERVISION_CLASS` | `OUTSIDE_CONFIGURATION_CLASS` | `SECONDARY_AUDIT`     | `OUTSIDE_PERSONAL_CLASS` | `OUTSIDE_CLIENT_CLASS`   | `NONE`                        | La intención dominante ya está resuelta como `PRIMARY_OPERATIONAL`. Aunque PULSO pueda identificar, atender o resolver asuntos de clientes, la pantalla es utilizada por personal interno y no constituye una superficie del canal de cliente.                                                                                           |
| `VSCREEN-0084` | Cobro y medios de pago                                | `pulso`    | `VPROC-0043::STEP-COLLECT_PAYMENT`                          | `PRIMARY_OPERATIONAL`       | `OUTSIDE_ADMINISTRATIVE_CLASS` | `OUTSIDE_SUPERVISION_CLASS` | `OUTSIDE_CONFIGURATION_CLASS` | `SECONDARY_AUDIT`     | `OUTSIDE_PERSONAL_CLASS` | `OUTSIDE_CLIENT_CLASS`   | `NONE`                        | La intención dominante ya está resuelta como `PRIMARY_OPERATIONAL`. Aunque PULSO pueda identificar, atender o resolver asuntos de clientes, la pantalla es utilizada por personal interno y no constituye una superficie del canal de cliente.                                                                                           |
| `VSCREEN-0085` | Identificación de cliente y acumulación               | `pulso`    | `VPROC-0045::STEP-IDENTIFY_CUSTOMER_AND_ACCRUE`             | `PRIMARY_OPERATIONAL`       | `OUTSIDE_ADMINISTRATIVE_CLASS` | `OUTSIDE_SUPERVISION_CLASS` | `OUTSIDE_CONFIGURATION_CLASS` | `OUTSIDE_AUDIT_CLASS` | `OUTSIDE_PERSONAL_CLASS` | `OUTSIDE_CLIENT_CLASS`   | `NONE`                        | La intención dominante ya está resuelta como `PRIMARY_OPERATIONAL`. Aunque PULSO pueda identificar, atender o resolver asuntos de clientes, la pantalla es utilizada por personal interno y no constituye una superficie del canal de cliente.                                                                                           |
| `VSCREEN-0086` | Redención de puntos o beneficios                      | `pulso`    | `VPROC-0045::STEP-REDEEM_LOYALTY_VALUE`                     | `PRIMARY_OPERATIONAL`       | `OUTSIDE_ADMINISTRATIVE_CLASS` | `OUTSIDE_SUPERVISION_CLASS` | `OUTSIDE_CONFIGURATION_CLASS` | `SECONDARY_AUDIT`     | `OUTSIDE_PERSONAL_CLASS` | `OUTSIDE_CLIENT_CLASS`   | `NONE`                        | La intención dominante ya está resuelta como `PRIMARY_OPERATIONAL`. Aunque PULSO pueda identificar, atender o resolver asuntos de clientes, la pantalla es utilizada por personal interno y no constituye una superficie del canal de cliente.                                                                                           |
| `VSCREEN-0087` | Bandeja de pedidos de canales externos                | `pulso`    | `VPROC-0040::STEP-ADMIT_EXTERNAL_ORDER`                     | `PRIMARY_OPERATIONAL`       | `OUTSIDE_ADMINISTRATIVE_CLASS` | `SECONDARY_SUPERVISION`     | `OUTSIDE_CONFIGURATION_CLASS` | `SECONDARY_AUDIT`     | `OUTSIDE_PERSONAL_CLASS` | `OUTSIDE_CLIENT_CLASS`   | `NONE`                        | La intención dominante ya está resuelta como `PRIMARY_OPERATIONAL`. Aunque PULSO pueda identificar, atender o resolver asuntos de clientes, la pantalla es utilizada por personal interno y no constituye una superficie del canal de cliente.                                                                                           |
| `VSCREEN-0088` | Seguimiento de preparación y entrega                  | `pulso`    | `VPROC-0039::STEP-MONITOR_ORDER_FULFILLMENT`                | `PRIMARY_OPERATIONAL`       | `OUTSIDE_ADMINISTRATIVE_CLASS` | `SECONDARY_SUPERVISION`     | `OUTSIDE_CONFIGURATION_CLASS` | `SECONDARY_AUDIT`     | `OUTSIDE_PERSONAL_CLASS` | `OUTSIDE_CLIENT_CLASS`   | `NONE`                        | La intención dominante ya está resuelta como `PRIMARY_OPERATIONAL`. Aunque PULSO pueda identificar, atender o resolver asuntos de clientes, la pantalla es utilizada por personal interno y no constituye una superficie del canal de cliente.                                                                                           |
| `VSCREEN-0089` | Apertura de caja                                      | `pulso`    | `VPROC-0044::STEP-OPEN_CASH_SESSION`                        | `PRIMARY_OPERATIONAL`       | `OUTSIDE_ADMINISTRATIVE_CLASS` | `OUTSIDE_SUPERVISION_CLASS` | `OUTSIDE_CONFIGURATION_CLASS` | `SECONDARY_AUDIT`     | `OUTSIDE_PERSONAL_CLASS` | `OUTSIDE_CLIENT_CLASS`   | `NONE`                        | La intención dominante ya está resuelta como `PRIMARY_OPERATIONAL`. Aunque PULSO pueda identificar, atender o resolver asuntos de clientes, la pantalla es utilizada por personal interno y no constituye una superficie del canal de cliente.                                                                                           |
| `VSCREEN-0090` | Cierre de caja                                        | `pulso`    | `VPROC-0044::STEP-CLOSE_CASH_SESSION`                       | `PRIMARY_OPERATIONAL`       | `SECONDARY_ADMINISTRATIVE`     | `SECONDARY_SUPERVISION`     | `OUTSIDE_CONFIGURATION_CLASS` | `SECONDARY_AUDIT`     | `OUTSIDE_PERSONAL_CLASS` | `OUTSIDE_CLIENT_CLASS`   | `NONE`                        | La intención dominante ya está resuelta como `PRIMARY_OPERATIONAL`. Aunque PULSO pueda identificar, atender o resolver asuntos de clientes, la pantalla es utilizada por personal interno y no constituye una superficie del canal de cliente.                                                                                           |
| `VSCREEN-0091` | Anulación, devolución y reembolso                     | `pulso`    | `VPROC-0042::STEP-RESOLVE_REVERSAL_OR_REFUND`               | `PRIMARY_OPERATIONAL`       | `SECONDARY_ADMINISTRATIVE`     | `SECONDARY_SUPERVISION`     | `OUTSIDE_CONFIGURATION_CLASS` | `SECONDARY_AUDIT`     | `OUTSIDE_PERSONAL_CLASS` | `OUTSIDE_CLIENT_CLASS`   | `NONE`                        | La intención dominante ya está resuelta como `PRIMARY_OPERATIONAL`. Aunque PULSO pueda identificar, atender o resolver asuntos de clientes, la pantalla es utilizada por personal interno y no constituye una superficie del canal de cliente.                                                                                           |
| `VSCREEN-0092` | Oferta, menú, precio comercial y disponibilidad       | `pulso`    | `VPROC-0017::STEP-PUBLISH_COMMERCIAL_OFFER`                 | `OUTSIDE_OPERATIONAL_CLASS` | `SECONDARY_ADMINISTRATIVE`     | `OUTSIDE_SUPERVISION_CLASS` | `PRIMARY_CONFIGURATION`       | `SECONDARY_AUDIT`     | `OUTSIDE_PERSONAL_CLASS` | `OUTSIDE_CLIENT_CLASS`   | `NONE`                        | La intención dominante ya está resuelta como `PRIMARY_CONFIGURATION`. Aunque PULSO pueda identificar, atender o resolver asuntos de clientes, la pantalla es utilizada por personal interno y no constituye una superficie del canal de cliente.                                                                                         |
| `VSCREEN-0093` | Revisión de ventas, caja y terminales                 | `pulso`    | `VPROC-0044::STEP-REVIEW_SALES_AND_TERMINALS`               | `SECONDARY_OPERATIONAL`     | `SECONDARY_ADMINISTRATIVE`     | `PRIMARY_SUPERVISION`       | `OUTSIDE_CONFIGURATION_CLASS` | `SECONDARY_AUDIT`     | `OUTSIDE_PERSONAL_CLASS` | `OUTSIDE_CLIENT_CLASS`   | `NONE`                        | La intención dominante ya está resuelta como `PRIMARY_SUPERVISION`. Aunque PULSO pueda identificar, atender o resolver asuntos de clientes, la pantalla es utilizada por personal interno y no constituye una superficie del canal de cliente.                                                                                           |
| `VSCREEN-0094` | Inicio financiero y ejecutivo                         | `numera`   | `VPROC-0061::STEP-REVIEW_FINANCIAL_POSITION`                | `OUTSIDE_OPERATIONAL_CLASS` | `SECONDARY_ADMINISTRATIVE`     | `PRIMARY_SUPERVISION`       | `OUTSIDE_CONFIGURATION_CLASS` | `OUTSIDE_AUDIT_CLASS` | `OUTSIDE_PERSONAL_CLASS` | `OUTSIDE_CLIENT_CLASS`   | `NONE`                        | La intención dominante ya está resuelta como `PRIMARY_SUPERVISION` y la pantalla pertenece a trabajo interno operativo, administrativo, supervisor, configurable o auditable. Procesar información relacionada con clientes no la convierte en pantalla de cliente.                                                                      |
| `VSCREEN-0095` | Bandeja de hechos económicos                          | `numera`   | `VPROC-0051::STEP-TRIAGE_ECONOMIC_FACTS`                    | `OUTSIDE_OPERATIONAL_CLASS` | `PRIMARY_ADMINISTRATIVE`       | `OUTSIDE_SUPERVISION_CLASS` | `OUTSIDE_CONFIGURATION_CLASS` | `SECONDARY_AUDIT`     | `OUTSIDE_PERSONAL_CLASS` | `OUTSIDE_CLIENT_CLASS`   | `NONE`                        | La intención dominante ya está resuelta como `PRIMARY_ADMINISTRATIVE` y la pantalla pertenece a trabajo interno operativo, administrativo, supervisor, configurable o auditable. Procesar información relacionada con clientes no la convierte en pantalla de cliente.                                                                   |
| `VSCREEN-0096` | Registro de gasto y soporte                           | `numera`   | `VPROC-0051::STEP-CAPTURE_EXPENSE_AND_EVIDENCE`             | `OUTSIDE_OPERATIONAL_CLASS` | `PRIMARY_ADMINISTRATIVE`       | `OUTSIDE_SUPERVISION_CLASS` | `OUTSIDE_CONFIGURATION_CLASS` | `SECONDARY_AUDIT`     | `OUTSIDE_PERSONAL_CLASS` | `OUTSIDE_CLIENT_CLASS`   | `NONE`                        | La intención dominante ya está resuelta como `PRIMARY_ADMINISTRATIVE` y la pantalla pertenece a trabajo interno operativo, administrativo, supervisor, configurable o auditable. Procesar información relacionada con clientes no la convierte en pantalla de cliente.                                                                   |
| `VSCREEN-0097` | Bandeja de aprobaciones financieras                   | `numera`   | `VPROC-0052::STEP-APPROVE_FINANCIAL_DECISION`               | `OUTSIDE_OPERATIONAL_CLASS` | `PRIMARY_ADMINISTRATIVE`       | `SECONDARY_SUPERVISION`     | `OUTSIDE_CONFIGURATION_CLASS` | `SECONDARY_AUDIT`     | `OUTSIDE_PERSONAL_CLASS` | `OUTSIDE_CLIENT_CLASS`   | `NONE`                        | La intención dominante ya está resuelta como `PRIMARY_ADMINISTRATIVE` y la pantalla pertenece a trabajo interno operativo, administrativo, supervisor, configurable o auditable. Procesar información relacionada con clientes no la convierte en pantalla de cliente.                                                                   |
| `VSCREEN-0098` | Cuentas por pagar y obligaciones                      | `numera`   | `VPROC-0052::STEP-MANAGE_PAYABLE_OBLIGATION`                | `OUTSIDE_OPERATIONAL_CLASS` | `PRIMARY_ADMINISTRATIVE`       | `OUTSIDE_SUPERVISION_CLASS` | `OUTSIDE_CONFIGURATION_CLASS` | `SECONDARY_AUDIT`     | `OUTSIDE_PERSONAL_CLASS` | `OUTSIDE_CLIENT_CLASS`   | `NONE`                        | La intención dominante ya está resuelta como `PRIMARY_ADMINISTRATIVE` y la pantalla pertenece a trabajo interno operativo, administrativo, supervisor, configurable o auditable. Procesar información relacionada con clientes no la convierte en pantalla de cliente.                                                                   |
| `VSCREEN-0099` | Cuentas por cobrar y cartera                          | `numera`   | `VPROC-0053::STEP-MANAGE_RECEIVABLE`                        | `OUTSIDE_OPERATIONAL_CLASS` | `PRIMARY_ADMINISTRATIVE`       | `OUTSIDE_SUPERVISION_CLASS` | `OUTSIDE_CONFIGURATION_CLASS` | `SECONDARY_AUDIT`     | `OUTSIDE_PERSONAL_CLASS` | `OUTSIDE_CLIENT_CLASS`   | `NONE`                        | La intención dominante ya está resuelta como `PRIMARY_ADMINISTRATIVE` y la pantalla pertenece a trabajo interno operativo, administrativo, supervisor, configurable o auditable. Procesar información relacionada con clientes no la convierte en pantalla de cliente.                                                                   |
| `VSCREEN-0100` | Caja, bancos y movimientos financieros                | `numera`   | `VPROC-0052::STEP-EXECUTE_TREASURY_MOVEMENT`                | `OUTSIDE_OPERATIONAL_CLASS` | `PRIMARY_ADMINISTRATIVE`       | `OUTSIDE_SUPERVISION_CLASS` | `OUTSIDE_CONFIGURATION_CLASS` | `SECONDARY_AUDIT`     | `OUTSIDE_PERSONAL_CLASS` | `OUTSIDE_CLIENT_CLASS`   | `NONE`                        | La intención dominante ya está resuelta como `PRIMARY_ADMINISTRATIVE` y la pantalla pertenece a trabajo interno operativo, administrativo, supervisor, configurable o auditable. Procesar información relacionada con clientes no la convierte en pantalla de cliente.                                                                   |
| `VSCREEN-0101` | Conciliación de ventas y pagos                        | `numera`   | `VPROC-0051::STEP-RECONCILE_SALES_AND_PAYMENTS`             | `OUTSIDE_OPERATIONAL_CLASS` | `PRIMARY_ADMINISTRATIVE`       | `SECONDARY_SUPERVISION`     | `OUTSIDE_CONFIGURATION_CLASS` | `SECONDARY_AUDIT`     | `OUTSIDE_PERSONAL_CLASS` | `OUTSIDE_CLIENT_CLASS`   | `NONE`                        | La intención dominante ya está resuelta como `PRIMARY_ADMINISTRATIVE` y la pantalla pertenece a trabajo interno operativo, administrativo, supervisor, configurable o auditable. Procesar información relacionada con clientes no la convierte en pantalla de cliente.                                                                   |
| `VSCREEN-0102` | Conciliación de compras y recepciones                 | `numera`   | `VPROC-0051::STEP-RECONCILE_PURCHASES_AND_RECEIPTS`         | `OUTSIDE_OPERATIONAL_CLASS` | `PRIMARY_ADMINISTRATIVE`       | `SECONDARY_SUPERVISION`     | `OUTSIDE_CONFIGURATION_CLASS` | `SECONDARY_AUDIT`     | `OUTSIDE_PERSONAL_CLASS` | `OUTSIDE_CLIENT_CLASS`   | `NONE`                        | La intención dominante ya está resuelta como `PRIMARY_ADMINISTRATIVE` y la pantalla pertenece a trabajo interno operativo, administrativo, supervisor, configurable o auditable. Procesar información relacionada con clientes no la convierte en pantalla de cliente.                                                                   |
| `VSCREEN-0103` | Conciliación de inventario, producción y variaciones  | `numera`   | `VPROC-0054::STEP-RECONCILE_OPERATING_VARIANCES`            | `OUTSIDE_OPERATIONAL_CLASS` | `PRIMARY_ADMINISTRATIVE`       | `SECONDARY_SUPERVISION`     | `OUTSIDE_CONFIGURATION_CLASS` | `SECONDARY_AUDIT`     | `OUTSIDE_PERSONAL_CLASS` | `OUTSIDE_CLIENT_CLASS`   | `NONE`                        | La intención dominante ya está resuelta como `PRIMARY_ADMINISTRATIVE` y la pantalla pertenece a trabajo interno operativo, administrativo, supervisor, configurable o auditable. Procesar información relacionada con clientes no la convierte en pantalla de cliente.                                                                   |
| `VSCREEN-0104` | Costos, rentabilidad y escenarios                     | `numera`   | `VPROC-0054::STEP-ANALYZE_COST_AND_PROFITABILITY`           | `OUTSIDE_OPERATIONAL_CLASS` | `PRIMARY_ADMINISTRATIVE`       | `SECONDARY_SUPERVISION`     | `OUTSIDE_CONFIGURATION_CLASS` | `OUTSIDE_AUDIT_CLASS` | `OUTSIDE_PERSONAL_CLASS` | `OUTSIDE_CLIENT_CLASS`   | `NONE`                        | La intención dominante ya está resuelta como `PRIMARY_ADMINISTRATIVE` y la pantalla pertenece a trabajo interno operativo, administrativo, supervisor, configurable o auditable. Procesar información relacionada con clientes no la convierte en pantalla de cliente.                                                                   |
| `VSCREEN-0105` | Cierre, reapertura y corrección de periodo            | `numera`   | `VPROC-0054::STEP-CLOSE_OR_REOPEN_PERIOD`                   | `OUTSIDE_OPERATIONAL_CLASS` | `PRIMARY_ADMINISTRATIVE`       | `SECONDARY_SUPERVISION`     | `OUTSIDE_CONFIGURATION_CLASS` | `SECONDARY_AUDIT`     | `OUTSIDE_PERSONAL_CLASS` | `OUTSIDE_CLIENT_CLASS`   | `NONE`                        | La intención dominante ya está resuelta como `PRIMARY_ADMINISTRATIVE` y la pantalla pertenece a trabajo interno operativo, administrativo, supervisor, configurable o auditable. Procesar información relacionada con clientes no la convierte en pantalla de cliente.                                                                   |
| `VSCREEN-0106` | Reportes y exportaciones financieras                  | `numera`   | `VPROC-0061::STEP-PUBLISH_FINANCIAL_REPORT`                 | `OUTSIDE_OPERATIONAL_CLASS` | `SECONDARY_ADMINISTRATIVE`     | `OUTSIDE_SUPERVISION_CLASS` | `OUTSIDE_CONFIGURATION_CLASS` | `PRIMARY_AUDIT`       | `OUTSIDE_PERSONAL_CLASS` | `OUTSIDE_CLIENT_CLASS`   | `NONE`                        | La intención dominante ya está resuelta como `PRIMARY_AUDIT` y la pantalla pertenece a trabajo interno operativo, administrativo, supervisor, configurable o auditable. Procesar información relacionada con clientes no la convierte en pantalla de cliente.                                                                            |
| `VSCREEN-0107` | Inicio del cliente y resumen de beneficios            | `pass`     | `VPROC-0045::STEP-ENTER_LOYALTY_HOME`                       | `OUTSIDE_OPERATIONAL_CLASS` | `OUTSIDE_ADMINISTRATIVE_CLASS` | `OUTSIDE_SUPERVISION_CLASS` | `OUTSIDE_CONFIGURATION_CLASS` | `OUTSIDE_AUDIT_CLASS` | `OUTSIDE_PERSONAL_CLASS` | `PRIMARY_CLIENT`         | `CLIENT_HOME_ENTRY`           | La intención dominante presenta la entrada al canal de cliente, beneficios o comercio sin apropiarse del backoffice. La pantalla está diseñada para una persona cliente o visitante del canal PASS y opera exclusivamente sobre una proyección comercial, de fidelización o servicio autorizada para ese sujeto o sesión.                |
| `VSCREEN-0108` | QR personal de identificación                         | `pass`     | `VPROC-0045::STEP-PRESENT_CUSTOMER_ID`                      | `OUTSIDE_OPERATIONAL_CLASS` | `OUTSIDE_ADMINISTRATIVE_CLASS` | `OUTSIDE_SUPERVISION_CLASS` | `OUTSIDE_CONFIGURATION_CLASS` | `OUTSIDE_AUDIT_CLASS` | `OUTSIDE_PERSONAL_CLASS` | `PRIMARY_CLIENT`         | `CLIENT_IDENTITY`             | La intención dominante presenta la identidad de cliente necesaria para reconocimiento, acumulación o vinculación autorizada. La pantalla está diseñada para una persona cliente o visitante del canal PASS y opera exclusivamente sobre una proyección comercial, de fidelización o servicio autorizada para ese sujeto o sesión.        |
| `VSCREEN-0109` | Catálogo de beneficios y recompensas                  | `pass`     | `VPROC-0045::STEP-CONSULT_REWARDS_CATALOG`                  | `OUTSIDE_OPERATIONAL_CLASS` | `OUTSIDE_ADMINISTRATIVE_CLASS` | `OUTSIDE_SUPERVISION_CLASS` | `OUTSIDE_CONFIGURATION_CLASS` | `OUTSIDE_AUDIT_CLASS` | `OUTSIDE_PERSONAL_CLASS` | `PRIMARY_CLIENT`         | `CLIENT_LOYALTY`              | La intención dominante permite consultar beneficios, crear una intención de redención o revisar el ledger personal de fidelización. La pantalla está diseñada para una persona cliente o visitante del canal PASS y opera exclusivamente sobre una proyección comercial, de fidelización o servicio autorizada para ese sujeto o sesión. |
| `VSCREEN-0110` | Ticket o QR de redención                              | `pass`     | `VPROC-0045::STEP-CREATE_REDEMPTION_INTENT`                 | `OUTSIDE_OPERATIONAL_CLASS` | `OUTSIDE_ADMINISTRATIVE_CLASS` | `OUTSIDE_SUPERVISION_CLASS` | `OUTSIDE_CONFIGURATION_CLASS` | `SECONDARY_AUDIT`     | `OUTSIDE_PERSONAL_CLASS` | `PRIMARY_CLIENT`         | `CLIENT_LOYALTY`              | La intención dominante permite consultar beneficios, crear una intención de redención o revisar el ledger personal de fidelización. La pantalla está diseñada para una persona cliente o visitante del canal PASS y opera exclusivamente sobre una proyección comercial, de fidelización o servicio autorizada para ese sujeto o sesión. |
| `VSCREEN-0111` | Historial de puntos y redenciones                     | `pass`     | `VPROC-0045::STEP-AUDIT_PERSONAL_LOYALTY_LEDGER`            | `OUTSIDE_OPERATIONAL_CLASS` | `OUTSIDE_ADMINISTRATIVE_CLASS` | `OUTSIDE_SUPERVISION_CLASS` | `OUTSIDE_CONFIGURATION_CLASS` | `SECONDARY_AUDIT`     | `OUTSIDE_PERSONAL_CLASS` | `PRIMARY_CLIENT`         | `CLIENT_LOYALTY`              | La intención dominante permite consultar beneficios, crear una intención de redención o revisar el ledger personal de fidelización. La pantalla está diseñada para una persona cliente o visitante del canal PASS y opera exclusivamente sobre una proyección comercial, de fidelización o servicio autorizada para ese sujeto o sesión. |
| `VSCREEN-0112` | Perfil, privacidad y consentimientos                  | `pass`     | `VPROC-0045::STEP-MAINTAIN_CUSTOMER_PROFILE_AND_CONSENT`    | `OUTSIDE_OPERATIONAL_CLASS` | `OUTSIDE_ADMINISTRATIVE_CLASS` | `OUTSIDE_SUPERVISION_CLASS` | `OUTSIDE_CONFIGURATION_CLASS` | `OUTSIDE_AUDIT_CLASS` | `OUTSIDE_PERSONAL_CLASS` | `PRIMARY_CLIENT`         | `CLIENT_PROFILE_PRIVACY`      | La intención dominante permite mantener datos autoadministrables, privacidad y consentimientos de la cuenta de cliente. La pantalla está diseñada para una persona cliente o visitante del canal PASS y opera exclusivamente sobre una proyección comercial, de fidelización o servicio autorizada para ese sujeto o sesión.             |
| `VSCREEN-0113` | Registro y seguimiento de decisiones empresariales    | `viso`     | `VPROC-0001::STEP-RECORD_AND_TRACK_DECISION`                | `OUTSIDE_OPERATIONAL_CLASS` | `PRIMARY_ADMINISTRATIVE`       | `SECONDARY_SUPERVISION`     | `OUTSIDE_CONFIGURATION_CLASS` | `SECONDARY_AUDIT`     | `OUTSIDE_PERSONAL_CLASS` | `OUTSIDE_CLIENT_CLASS`   | `NONE`                        | La intención dominante ya está resuelta como `PRIMARY_ADMINISTRATIVE` y la pantalla pertenece a trabajo interno operativo, administrativo, supervisor, configurable o auditable. Procesar información relacionada con clientes no la convierte en pantalla de cliente.                                                                   |
| `VSCREEN-0114` | Solicitudes y certificaciones de acceso               | `viso`     | `VPROC-0059::STEP-REVIEW_AND_CERTIFY_ACCESS`                | `OUTSIDE_OPERATIONAL_CLASS` | `PRIMARY_ADMINISTRATIVE`       | `SECONDARY_SUPERVISION`     | `OUTSIDE_CONFIGURATION_CLASS` | `SECONDARY_AUDIT`     | `OUTSIDE_PERSONAL_CLASS` | `OUTSIDE_CLIENT_CLASS`   | `NONE`                        | La intención dominante ya está resuelta como `PRIMARY_ADMINISTRATIVE` y la pantalla pertenece a trabajo interno operativo, administrativo, supervisor, configurable o auditable. Procesar información relacionada con clientes no la convierte en pantalla de cliente.                                                                   |
| `VSCREEN-0115` | Gobierno de documentos y evidencia                    | `viso`     | `VPROC-0060::STEP-GOVERN_DOCUMENT_EVIDENCE`                 | `OUTSIDE_OPERATIONAL_CLASS` | `PRIMARY_ADMINISTRATIVE`       | `OUTSIDE_SUPERVISION_CLASS` | `SECONDARY_CONFIGURATION`     | `SECONDARY_AUDIT`     | `OUTSIDE_PERSONAL_CLASS` | `OUTSIDE_CLIENT_CLASS`   | `NONE`                        | La intención dominante ya está resuelta como `PRIMARY_ADMINISTRATIVE` y la pantalla pertenece a trabajo interno operativo, administrativo, supervisor, configurable o auditable. Procesar información relacionada con clientes no la convierte en pantalla de cliente.                                                                   |
| `VSCREEN-0116` | Registro de riesgos empresariales                     | `viso`     | `VPROC-0063::STEP-ASSESS_ENTERPRISE_RISK`                   | `OUTSIDE_OPERATIONAL_CLASS` | `PRIMARY_ADMINISTRATIVE`       | `SECONDARY_SUPERVISION`     | `OUTSIDE_CONFIGURATION_CLASS` | `OUTSIDE_AUDIT_CLASS` | `OUTSIDE_PERSONAL_CLASS` | `OUTSIDE_CLIENT_CLASS`   | `NONE`                        | La intención dominante ya está resuelta como `PRIMARY_ADMINISTRATIVE` y la pantalla pertenece a trabajo interno operativo, administrativo, supervisor, configurable o auditable. Procesar información relacionada con clientes no la convierte en pantalla de cliente.                                                                   |
| `VSCREEN-0117` | Requerimientos de asesores y autoridades              | `viso`     | `VPROC-0064::STEP-MANAGE_EXTERNAL_REQUIREMENT`              | `OUTSIDE_OPERATIONAL_CLASS` | `PRIMARY_ADMINISTRATIVE`       | `SECONDARY_SUPERVISION`     | `OUTSIDE_CONFIGURATION_CLASS` | `SECONDARY_AUDIT`     | `OUTSIDE_PERSONAL_CLASS` | `OUTSIDE_CLIENT_CLASS`   | `NONE`                        | La intención dominante ya está resuelta como `PRIMARY_ADMINISTRATIVE` y la pantalla pertenece a trabajo interno operativo, administrativo, supervisor, configurable o auditable. Procesar información relacionada con clientes no la convierte en pantalla de cliente.                                                                   |
| `VSCREEN-0118` | Gestión de desempeño y desarrollo                     | `viso`     | `VPROC-0065::STEP-REVIEW_PERFORMANCE_AND_DEVELOPMENT`       | `OUTSIDE_OPERATIONAL_CLASS` | `PRIMARY_ADMINISTRATIVE`       | `SECONDARY_SUPERVISION`     | `OUTSIDE_CONFIGURATION_CLASS` | `OUTSIDE_AUDIT_CLASS` | `OUTSIDE_PERSONAL_CLASS` | `OUTSIDE_CLIENT_CLASS`   | `NONE`                        | La intención dominante ya está resuelta como `PRIMARY_ADMINISTRATIVE` y la pantalla pertenece a trabajo interno operativo, administrativo, supervisor, configurable o auditable. Procesar información relacionada con clientes no la convierte en pantalla de cliente.                                                                   |
| `VSCREEN-0119` | Asignación y control de elementos de protección       | `viso`     | `VPROC-0066::STEP-ASSIGN_PROTECTIVE_EQUIPMENT`              | `SECONDARY_OPERATIONAL`     | `PRIMARY_ADMINISTRATIVE`       | `SECONDARY_SUPERVISION`     | `OUTSIDE_CONFIGURATION_CLASS` | `SECONDARY_AUDIT`     | `OUTSIDE_PERSONAL_CLASS` | `OUTSIDE_CLIENT_CLASS`   | `NONE`                        | La intención dominante ya está resuelta como `PRIMARY_ADMINISTRATIVE` y la pantalla pertenece a trabajo interno operativo, administrativo, supervisor, configurable o auditable. Procesar información relacionada con clientes no la convierte en pantalla de cliente.                                                                   |
| `VSCREEN-0120` | Mesa de servicio tecnológico                          | `viso`     | `VPROC-0058::STEP-RESOLVE_TECH_SERVICE_CASE`                | `SECONDARY_OPERATIONAL`     | `PRIMARY_ADMINISTRATIVE`       | `SECONDARY_SUPERVISION`     | `OUTSIDE_CONFIGURATION_CLASS` | `SECONDARY_AUDIT`     | `OUTSIDE_PERSONAL_CLASS` | `OUTSIDE_CLIENT_CLASS`   | `NONE`                        | La intención dominante ya está resuelta como `PRIMARY_ADMINISTRATIVE` y la pantalla pertenece a trabajo interno operativo, administrativo, supervisor, configurable o auditable. Procesar información relacionada con clientes no la convierte en pantalla de cliente.                                                                   |
| `VSCREEN-0121` | Continuidad, contingencia y recuperación              | `viso`     | `VPROC-0062::STEP-ACTIVATE_AND_RECOVER_CONTINUITY`          | `SECONDARY_OPERATIONAL`     | `PRIMARY_ADMINISTRATIVE`       | `SECONDARY_SUPERVISION`     | `SECONDARY_CONFIGURATION`     | `SECONDARY_AUDIT`     | `OUTSIDE_PERSONAL_CLASS` | `OUTSIDE_CLIENT_CLASS`   | `NONE`                        | La intención dominante ya está resuelta como `PRIMARY_ADMINISTRATIVE` y la pantalla pertenece a trabajo interno operativo, administrativo, supervisor, configurable o auditable. Procesar información relacionada con clientes no la convierte en pantalla de cliente.                                                                   |
| `VSCREEN-0122` | Privacidad, cumplimiento y conservación               | `viso`     | `VPROC-0060::STEP-GOVERN_PRIVACY_AND_RETENTION`             | `OUTSIDE_OPERATIONAL_CLASS` | `PRIMARY_ADMINISTRATIVE`       | `SECONDARY_SUPERVISION`     | `SECONDARY_CONFIGURATION`     | `SECONDARY_AUDIT`     | `OUTSIDE_PERSONAL_CLASS` | `OUTSIDE_CLIENT_CLASS`   | `NONE`                        | La intención dominante ya está resuelta como `PRIMARY_ADMINISTRATIVE` y la pantalla pertenece a trabajo interno operativo, administrativo, supervisor, configurable o auditable. Procesar información relacionada con clientes no la convierte en pantalla de cliente.                                                                   |
| `VSCREEN-0123` | Gestión de comunicaciones internas                    | `viso`     | `VPROC-0004::STEP-PUBLISH_INTERNAL_COMMUNICATION`           | `OUTSIDE_OPERATIONAL_CLASS` | `PRIMARY_ADMINISTRATIVE`       | `OUTSIDE_SUPERVISION_CLASS` | `OUTSIDE_CONFIGURATION_CLASS` | `SECONDARY_AUDIT`     | `OUTSIDE_PERSONAL_CLASS` | `OUTSIDE_CLIENT_CLASS`   | `NONE`                        | La intención dominante ya está resuelta como `PRIMARY_ADMINISTRATIVE` y la pantalla pertenece a trabajo interno operativo, administrativo, supervisor, configurable o auditable. Procesar información relacionada con clientes no la convierte en pantalla de cliente.                                                                   |
| `VSCREEN-0124` | Mis comunicados laborales                             | `anima`    | `VPROC-0004::STEP-CONSULT_AND_ACKNOWLEDGE_COMMUNICATION`    | `OUTSIDE_OPERATIONAL_CLASS` | `OUTSIDE_ADMINISTRATIVE_CLASS` | `OUTSIDE_SUPERVISION_CLASS` | `OUTSIDE_CONFIGURATION_CLASS` | `SECONDARY_AUDIT`     | `PRIMARY_PERSONAL`       | `OUTSIDE_CLIENT_CLASS`   | `NONE`                        | La intención dominante ya está resuelta como `PRIMARY_PERSONAL`. La superficie pertenece al ecosistema laboral o de cuenta interna y no al canal comercial de cliente PASS.                                                                                                                                                              |
| `VSCREEN-0125` | Mi carnet laboral                                     | `anima`    | `VPROC-0006::STEP-PRESENT_EMPLOYEE_CREDENTIAL`              | `OUTSIDE_OPERATIONAL_CLASS` | `OUTSIDE_ADMINISTRATIVE_CLASS` | `OUTSIDE_SUPERVISION_CLASS` | `OUTSIDE_CONFIGURATION_CLASS` | `OUTSIDE_AUDIT_CLASS` | `PRIMARY_PERSONAL`       | `OUTSIDE_CLIENT_CLASS`   | `NONE`                        | La intención dominante ya está resuelta como `PRIMARY_PERSONAL`. La superficie pertenece al ecosistema laboral o de cuenta interna y no al canal comercial de cliente PASS.                                                                                                                                                              |
| `VSCREEN-0126` | Mis documentos laborales                              | `anima`    | `VPROC-0060::STEP-CONSULT_OR_SUBMIT_EMPLOYMENT_DOCUMENT`    | `OUTSIDE_OPERATIONAL_CLASS` | `OUTSIDE_ADMINISTRATIVE_CLASS` | `OUTSIDE_SUPERVISION_CLASS` | `OUTSIDE_CONFIGURATION_CLASS` | `SECONDARY_AUDIT`     | `PRIMARY_PERSONAL`       | `OUTSIDE_CLIENT_CLASS`   | `NONE`                        | La intención dominante ya está resuelta como `PRIMARY_PERSONAL`. La superficie pertenece al ecosistema laboral o de cuenta interna y no al canal comercial de cliente PASS.                                                                                                                                                              |
| `VSCREEN-0127` | Mi capacitación                                       | `anima`    | `VPROC-0065::STEP-COMPLETE_ASSIGNED_TRAINING`               | `OUTSIDE_OPERATIONAL_CLASS` | `OUTSIDE_ADMINISTRATIVE_CLASS` | `OUTSIDE_SUPERVISION_CLASS` | `OUTSIDE_CONFIGURATION_CLASS` | `SECONDARY_AUDIT`     | `PRIMARY_PERSONAL`       | `OUTSIDE_CLIENT_CLASS`   | `NONE`                        | La intención dominante ya está resuelta como `PRIMARY_PERSONAL`. La superficie pertenece al ecosistema laboral o de cuenta interna y no al canal comercial de cliente PASS.                                                                                                                                                              |
| `VSCREEN-0128` | Mis objetivos y retroalimentación                     | `anima`    | `VPROC-0065::STEP-REVIEW_PERSONAL_OBJECTIVES`               | `OUTSIDE_OPERATIONAL_CLASS` | `OUTSIDE_ADMINISTRATIVE_CLASS` | `OUTSIDE_SUPERVISION_CLASS` | `OUTSIDE_CONFIGURATION_CLASS` | `SECONDARY_AUDIT`     | `PRIMARY_PERSONAL`       | `OUTSIDE_CLIENT_CLASS`   | `NONE`                        | La intención dominante ya está resuelta como `PRIMARY_PERSONAL`. La superficie pertenece al ecosistema laboral o de cuenta interna y no al canal comercial de cliente PASS.                                                                                                                                                              |
| `VSCREEN-0129` | Mis solicitudes de soporte                            | `anima`    | `VPROC-0058::STEP-SUBMIT_AND_TRACK_SUPPORT_REQUEST`         | `SECONDARY_OPERATIONAL`     | `OUTSIDE_ADMINISTRATIVE_CLASS` | `OUTSIDE_SUPERVISION_CLASS` | `OUTSIDE_CONFIGURATION_CLASS` | `SECONDARY_AUDIT`     | `PRIMARY_PERSONAL`       | `OUTSIDE_CLIENT_CLASS`   | `NONE`                        | La intención dominante ya está resuelta como `PRIMARY_PERSONAL`. La superficie pertenece al ecosistema laboral o de cuenta interna y no al canal comercial de cliente PASS.                                                                                                                                                              |
| `VSCREEN-0130` | Mis reportes de seguridad y salud                     | `anima`    | `VPROC-0013::STEP-REPORT_SST_EVENT`                         | `SECONDARY_OPERATIONAL`     | `OUTSIDE_ADMINISTRATIVE_CLASS` | `OUTSIDE_SUPERVISION_CLASS` | `OUTSIDE_CONFIGURATION_CLASS` | `SECONDARY_AUDIT`     | `PRIMARY_PERSONAL`       | `OUTSIDE_CLIENT_CLASS`   | `NONE`                        | La intención dominante ya está resuelta como `PRIMARY_PERSONAL`. La superficie pertenece al ecosistema laboral o de cuenta interna y no al canal comercial de cliente PASS.                                                                                                                                                              |
| `VSCREEN-0131` | Mis elementos de protección                           | `anima`    | `VPROC-0066::STEP-ACKNOWLEDGE_PROTECTIVE_EQUIPMENT`         | `SECONDARY_OPERATIONAL`     | `OUTSIDE_ADMINISTRATIVE_CLASS` | `OUTSIDE_SUPERVISION_CLASS` | `OUTSIDE_CONFIGURATION_CLASS` | `SECONDARY_AUDIT`     | `PRIMARY_PERSONAL`       | `OUTSIDE_CLIENT_CLASS`   | `NONE`                        | La intención dominante ya está resuelta como `PRIMARY_PERSONAL`. La superficie pertenece al ecosistema laboral o de cuenta interna y no al canal comercial de cliente PASS.                                                                                                                                                              |
| `VSCREEN-0132` | Reservas de inventario                                | `nexo`     | `VPROC-0028::STEP-RESERVE_STOCK`                            | `PRIMARY_OPERATIONAL`       | `OUTSIDE_ADMINISTRATIVE_CLASS` | `OUTSIDE_SUPERVISION_CLASS` | `OUTSIDE_CONFIGURATION_CLASS` | `OUTSIDE_AUDIT_CLASS` | `OUTSIDE_PERSONAL_CLASS` | `OUTSIDE_CLIENT_CLASS`   | `NONE`                        | La intención dominante ya está resuelta como `PRIMARY_OPERATIONAL` y la pantalla pertenece a trabajo interno operativo, administrativo, supervisor, configurable o auditable. Procesar información relacionada con clientes no la convierte en pantalla de cliente.                                                                      |
| `VSCREEN-0133` | Planes y órdenes de mantenimiento de activos          | `nexo`     | `VPROC-0030::STEP-PLAN_AND_EXECUTE_ASSET_MAINTENANCE`       | `PRIMARY_OPERATIONAL`       | `SECONDARY_ADMINISTRATIVE`     | `SECONDARY_SUPERVISION`     | `SECONDARY_CONFIGURATION`     | `OUTSIDE_AUDIT_CLASS` | `OUTSIDE_PERSONAL_CLASS` | `OUTSIDE_CLIENT_CLASS`   | `NONE`                        | La intención dominante ya está resuelta como `PRIMARY_OPERATIONAL` y la pantalla pertenece a trabajo interno operativo, administrativo, supervisor, configurable o auditable. Procesar información relacionada con clientes no la convierte en pantalla de cliente.                                                                      |
| `VSCREEN-0134` | Garantías, seguros y reclamaciones de activos         | `nexo`     | `VPROC-0030::STEP-MANAGE_ASSET_CLAIM`                       | `OUTSIDE_OPERATIONAL_CLASS` | `PRIMARY_ADMINISTRATIVE`       | `SECONDARY_SUPERVISION`     | `OUTSIDE_CONFIGURATION_CLASS` | `SECONDARY_AUDIT`     | `OUTSIDE_PERSONAL_CLASS` | `OUTSIDE_CLIENT_CLASS`   | `NONE`                        | La intención dominante ya está resuelta como `PRIMARY_ADMINISTRATIVE` y la pantalla pertenece a trabajo interno operativo, administrativo, supervisor, configurable o auditable. Procesar información relacionada con clientes no la convierte en pantalla de cliente.                                                                   |
| `VSCREEN-0135` | Instancias y operación de kits                        | `nexo`     | `VPROC-0067::STEP-ASSEMBLE_AND_CONTROL_KIT`                 | `PRIMARY_OPERATIONAL`       | `OUTSIDE_ADMINISTRATIVE_CLASS` | `OUTSIDE_SUPERVISION_CLASS` | `OUTSIDE_CONFIGURATION_CLASS` | `SECONDARY_AUDIT`     | `OUTSIDE_PERSONAL_CLASS` | `OUTSIDE_CLIENT_CLASS`   | `NONE`                        | La intención dominante ya está resuelta como `PRIMARY_OPERATIONAL` y la pantalla pertenece a trabajo interno operativo, administrativo, supervisor, configurable o auditable. Procesar información relacionada con clientes no la convierte en pantalla de cliente.                                                                      |
| `VSCREEN-0136` | Flota y vehículos                                     | `nexo`     | `VPROC-0031::STEP-MANAGE_FLEET_ASSET`                       | `SECONDARY_OPERATIONAL`     | `PRIMARY_ADMINISTRATIVE`       | `SECONDARY_SUPERVISION`     | `SECONDARY_CONFIGURATION`     | `SECONDARY_AUDIT`     | `OUTSIDE_PERSONAL_CLASS` | `OUTSIDE_CLIENT_CLASS`   | `NONE`                        | La intención dominante ya está resuelta como `PRIMARY_ADMINISTRATIVE` y la pantalla pertenece a trabajo interno operativo, administrativo, supervisor, configurable o auditable. Procesar información relacionada con clientes no la convierte en pantalla de cliente.                                                                   |
| `VSCREEN-0137` | Kilometraje y combustible                             | `nexo`     | `VPROC-0031::STEP-CAPTURE_MILEAGE_AND_FUEL`                 | `PRIMARY_OPERATIONAL`       | `OUTSIDE_ADMINISTRATIVE_CLASS` | `OUTSIDE_SUPERVISION_CLASS` | `OUTSIDE_CONFIGURATION_CLASS` | `OUTSIDE_AUDIT_CLASS` | `OUTSIDE_PERSONAL_CLASS` | `OUTSIDE_CLIENT_CLASS`   | `NONE`                        | La intención dominante ya está resuelta como `PRIMARY_OPERATIONAL` y la pantalla pertenece a trabajo interno operativo, administrativo, supervisor, configurable o auditable. Procesar información relacionada con clientes no la convierte en pantalla de cliente.                                                                      |
| `VSCREEN-0138` | Planeación de rutas y despachos                       | `nexo`     | `VPROC-0048::STEP-PLAN_ROUTE_AND_DISPATCH`                  | `PRIMARY_OPERATIONAL`       | `OUTSIDE_ADMINISTRATIVE_CLASS` | `SECONDARY_SUPERVISION`     | `OUTSIDE_CONFIGURATION_CLASS` | `OUTSIDE_AUDIT_CLASS` | `OUTSIDE_PERSONAL_CLASS` | `OUTSIDE_CLIENT_CLASS`   | `NONE`                        | La intención dominante ya está resuelta como `PRIMARY_OPERATIONAL` y la pantalla pertenece a trabajo interno operativo, administrativo, supervisor, configurable o auditable. Procesar información relacionada con clientes no la convierte en pantalla de cliente.                                                                      |
| `VSCREEN-0139` | Ejecución de ruta y prueba de entrega                 | `nexo`     | `VPROC-0049::STEP-EXECUTE_ROUTE_AND_PROVE_DELIVERY`         | `PRIMARY_OPERATIONAL`       | `OUTSIDE_ADMINISTRATIVE_CLASS` | `SECONDARY_SUPERVISION`     | `OUTSIDE_CONFIGURATION_CLASS` | `SECONDARY_AUDIT`     | `OUTSIDE_PERSONAL_CLASS` | `OUTSIDE_CLIENT_CLASS`   | `NONE`                        | La intención dominante ya está resuelta como `PRIMARY_OPERATIONAL` y la pantalla pertenece a trabajo interno operativo, administrativo, supervisor, configurable o auditable. Procesar información relacionada con clientes no la convierte en pantalla de cliente.                                                                      |
| `VSCREEN-0140` | Novedades, rechazos y retornos logísticos             | `nexo`     | `VPROC-0049::STEP-RESOLVE_LOGISTICS_EXCEPTION`              | `PRIMARY_OPERATIONAL`       | `OUTSIDE_ADMINISTRATIVE_CLASS` | `SECONDARY_SUPERVISION`     | `OUTSIDE_CONFIGURATION_CLASS` | `SECONDARY_AUDIT`     | `OUTSIDE_PERSONAL_CLASS` | `OUTSIDE_CLIENT_CLASS`   | `NONE`                        | La intención dominante ya está resuelta como `PRIMARY_OPERATIONAL` y la pantalla pertenece a trabajo interno operativo, administrativo, supervisor, configurable o auditable. Procesar información relacionada con clientes no la convierte en pantalla de cliente.                                                                      |
| `VSCREEN-0141` | Instalaciones, servicios y mantenimiento locativo     | `nexo`     | `VPROC-0055::STEP-MANAGE_FACILITY_SERVICE`                  | `PRIMARY_OPERATIONAL`       | `SECONDARY_ADMINISTRATIVE`     | `SECONDARY_SUPERVISION`     | `SECONDARY_CONFIGURATION`     | `SECONDARY_AUDIT`     | `OUTSIDE_PERSONAL_CLASS` | `OUTSIDE_CLIENT_CLASS`   | `NONE`                        | La intención dominante ya está resuelta como `PRIMARY_OPERATIONAL` y la pantalla pertenece a trabajo interno operativo, administrativo, supervisor, configurable o auditable. Procesar información relacionada con clientes no la convierte en pantalla de cliente.                                                                      |
| `VSCREEN-0142` | Configuración de políticas y rutas logísticas         | `nexo`     | `VPROC-0048::STEP-CONFIGURE_LOGISTICS_POLICY`               | `OUTSIDE_OPERATIONAL_CLASS` | `SECONDARY_ADMINISTRATIVE`     | `OUTSIDE_SUPERVISION_CLASS` | `PRIMARY_CONFIGURATION`       | `SECONDARY_AUDIT`     | `OUTSIDE_PERSONAL_CLASS` | `OUTSIDE_CLIENT_CLASS`   | `NONE`                        | La intención dominante ya está resuelta como `PRIMARY_CONFIGURATION` y la pantalla pertenece a trabajo interno operativo, administrativo, supervisor, configurable o auditable. Procesar información relacionada con clientes no la convierte en pantalla de cliente.                                                                    |
| `VSCREEN-0143` | Diseñador de etiquetas logísticas                     | `nexo`     | `VPROC-0015::STEP-AUTHOR_LOGISTICS_LABEL_TEMPLATE`          | `OUTSIDE_OPERATIONAL_CLASS` | `SECONDARY_ADMINISTRATIVE`     | `OUTSIDE_SUPERVISION_CLASS` | `PRIMARY_CONFIGURATION`       | `SECONDARY_AUDIT`     | `OUTSIDE_PERSONAL_CLASS` | `OUTSIDE_CLIENT_CLASS`   | `NONE`                        | La intención dominante ya está resuelta como `PRIMARY_CONFIGURATION` y la pantalla pertenece a trabajo interno operativo, administrativo, supervisor, configurable o auditable. Procesar información relacionada con clientes no la convierte en pantalla de cliente.                                                                    |
| `VSCREEN-0144` | Cola y trabajos de impresión logística                | `nexo`     | `VPROC-0024::STEP-OPERATE_PRINT_QUEUE`                      | `PRIMARY_OPERATIONAL`       | `SECONDARY_ADMINISTRATIVE`     | `OUTSIDE_SUPERVISION_CLASS` | `OUTSIDE_CONFIGURATION_CLASS` | `SECONDARY_AUDIT`     | `OUTSIDE_PERSONAL_CLASS` | `OUTSIDE_CLIENT_CLASS`   | `NONE`                        | La intención dominante ya está resuelta como `PRIMARY_OPERATIONAL` y la pantalla pertenece a trabajo interno operativo, administrativo, supervisor, configurable o auditable. Procesar información relacionada con clientes no la convierte en pantalla de cliente.                                                                      |
| `VSCREEN-0145` | Contratos, precios y condiciones de proveedor         | `origo`    | `VPROC-0020::STEP-GOVERN_SUPPLIER_TERMS`                    | `OUTSIDE_OPERATIONAL_CLASS` | `PRIMARY_ADMINISTRATIVE`       | `OUTSIDE_SUPERVISION_CLASS` | `SECONDARY_CONFIGURATION`     | `SECONDARY_AUDIT`     | `OUTSIDE_PERSONAL_CLASS` | `OUTSIDE_CLIENT_CLASS`   | `NONE`                        | La intención dominante ya está resuelta como `PRIMARY_ADMINISTRATIVE` y la pantalla pertenece a trabajo interno operativo, administrativo, supervisor, configurable o auditable. Procesar información relacionada con clientes no la convierte en pantalla de cliente.                                                                   |
| `VSCREEN-0146` | Desempeño y reclamaciones de proveedor                | `origo`    | `VPROC-0020::STEP-REVIEW_SUPPLIER_PERFORMANCE`              | `OUTSIDE_OPERATIONAL_CLASS` | `PRIMARY_ADMINISTRATIVE`       | `SECONDARY_SUPERVISION`     | `OUTSIDE_CONFIGURATION_CLASS` | `SECONDARY_AUDIT`     | `OUTSIDE_PERSONAL_CLASS` | `OUTSIDE_CLIENT_CLASS`   | `NONE`                        | La intención dominante ya está resuelta como `PRIMARY_ADMINISTRATIVE` y la pantalla pertenece a trabajo interno operativo, administrativo, supervisor, configurable o auditable. Procesar información relacionada con clientes no la convierte en pantalla de cliente.                                                                   |
| `VSCREEN-0147` | Oportunidades y cotizaciones de catering o B2B        | `pulso`    | `VPROC-0041::STEP-QUALIFY_B2B_OPPORTUNITY`                  | `OUTSIDE_OPERATIONAL_CLASS` | `PRIMARY_ADMINISTRATIVE`       | `OUTSIDE_SUPERVISION_CLASS` | `OUTSIDE_CONFIGURATION_CLASS` | `SECONDARY_AUDIT`     | `OUTSIDE_PERSONAL_CLASS` | `OUTSIDE_CLIENT_CLASS`   | `NONE`                        | La intención dominante ya está resuelta como `PRIMARY_ADMINISTRATIVE`. Aunque PULSO pueda identificar, atender o resolver asuntos de clientes, la pantalla es utilizada por personal interno y no constituye una superficie del canal de cliente.                                                                                        |
| `VSCREEN-0148` | Ejecución de catering o venta B2B                     | `pulso`    | `VPROC-0041::STEP-EXECUTE_B2B_COMMITMENT`                   | `PRIMARY_OPERATIONAL`       | `SECONDARY_ADMINISTRATIVE`     | `SECONDARY_SUPERVISION`     | `OUTSIDE_CONFIGURATION_CLASS` | `SECONDARY_AUDIT`     | `OUTSIDE_PERSONAL_CLASS` | `OUTSIDE_CLIENT_CLASS`   | `NONE`                        | La intención dominante ya está resuelta como `PRIMARY_OPERATIONAL`. Aunque PULSO pueda identificar, atender o resolver asuntos de clientes, la pantalla es utilizada por personal interno y no constituye una superficie del canal de cliente.                                                                                           |
| `VSCREEN-0149` | Operación de reservas y eventos                       | `pulso`    | `VPROC-0047::STEP-MANAGE_RESERVATION_OR_EVENT`              | `PRIMARY_OPERATIONAL`       | `SECONDARY_ADMINISTRATIVE`     | `SECONDARY_SUPERVISION`     | `OUTSIDE_CONFIGURATION_CLASS` | `SECONDARY_AUDIT`     | `OUTSIDE_PERSONAL_CLASS` | `OUTSIDE_CLIENT_CLASS`   | `NONE`                        | La intención dominante ya está resuelta como `PRIMARY_OPERATIONAL`. Aunque PULSO pueda identificar, atender o resolver asuntos de clientes, la pantalla es utilizada por personal interno y no constituye una superficie del canal de cliente.                                                                                           |
| `VSCREEN-0150` | Casos de reclamo y compensación                       | `pulso`    | `VPROC-0046::STEP-RESOLVE_CUSTOMER_CLAIM`                   | `PRIMARY_OPERATIONAL`       | `SECONDARY_ADMINISTRATIVE`     | `SECONDARY_SUPERVISION`     | `OUTSIDE_CONFIGURATION_CLASS` | `SECONDARY_AUDIT`     | `OUTSIDE_PERSONAL_CLASS` | `OUTSIDE_CLIENT_CLASS`   | `NONE`                        | La intención dominante ya está resuelta como `PRIMARY_OPERATIONAL`. Aunque PULSO pueda identificar, atender o resolver asuntos de clientes, la pantalla es utilizada por personal interno y no constituye una superficie del canal de cliente.                                                                                           |
| `VSCREEN-0151` | Coordinación de entrega mediante tercero              | `pulso`    | `VPROC-0050::STEP-COORDINATE_THIRD_PARTY_DELIVERY`          | `PRIMARY_OPERATIONAL`       | `SECONDARY_ADMINISTRATIVE`     | `SECONDARY_SUPERVISION`     | `OUTSIDE_CONFIGURATION_CLASS` | `SECONDARY_AUDIT`     | `OUTSIDE_PERSONAL_CLASS` | `OUTSIDE_CLIENT_CLASS`   | `NONE`                        | La intención dominante ya está resuelta como `PRIMARY_OPERATIONAL`. Aunque PULSO pueda identificar, atender o resolver asuntos de clientes, la pantalla es utilizada por personal interno y no constituye una superficie del canal de cliente.                                                                                           |
| `VSCREEN-0152` | Análisis de satisfacción y servicio                   | `pulso`    | `VPROC-0068::STEP-ANALYZE_SERVICE_SATISFACTION`             | `OUTSIDE_OPERATIONAL_CLASS` | `SECONDARY_ADMINISTRATIVE`     | `PRIMARY_SUPERVISION`       | `OUTSIDE_CONFIGURATION_CLASS` | `OUTSIDE_AUDIT_CLASS` | `OUTSIDE_PERSONAL_CLASS` | `OUTSIDE_CLIENT_CLASS`   | `NONE`                        | La intención dominante ya está resuelta como `PRIMARY_SUPERVISION`. Aunque PULSO pueda identificar, atender o resolver asuntos de clientes, la pantalla es utilizada por personal interno y no constituye una superficie del canal de cliente.                                                                                           |
| `VSCREEN-0153` | Paquete laboral para pagos y beneficios               | `numera`   | `VPROC-0010::STEP-PREPARE_LABOR_PAYMENT_PACKAGE`            | `OUTSIDE_OPERATIONAL_CLASS` | `PRIMARY_ADMINISTRATIVE`       | `OUTSIDE_SUPERVISION_CLASS` | `OUTSIDE_CONFIGURATION_CLASS` | `SECONDARY_AUDIT`     | `OUTSIDE_PERSONAL_CLASS` | `OUTSIDE_CLIENT_CLASS`   | `NONE`                        | La intención dominante ya está resuelta como `PRIMARY_ADMINISTRATIVE` y la pantalla pertenece a trabajo interno operativo, administrativo, supervisor, configurable o auditable. Procesar información relacionada con clientes no la convierte en pantalla de cliente.                                                                   |
| `VSCREEN-0154` | Facturas y documentos fiscales                        | `numera`   | `VPROC-0051::STEP-MANAGE_FISCAL_DOCUMENT`                   | `OUTSIDE_OPERATIONAL_CLASS` | `PRIMARY_ADMINISTRATIVE`       | `OUTSIDE_SUPERVISION_CLASS` | `OUTSIDE_CONFIGURATION_CLASS` | `SECONDARY_AUDIT`     | `OUTSIDE_PERSONAL_CLASS` | `OUTSIDE_CLIENT_CLASS`   | `NONE`                        | La intención dominante ya está resuelta como `PRIMARY_ADMINISTRATIVE` y la pantalla pertenece a trabajo interno operativo, administrativo, supervisor, configurable o auditable. Procesar información relacionada con clientes no la convierte en pantalla de cliente.                                                                   |
| `VSCREEN-0155` | Tesorería y programación de pagos                     | `numera`   | `VPROC-0052::STEP-PLAN_AND_EXECUTE_PAYMENTS`                | `OUTSIDE_OPERATIONAL_CLASS` | `PRIMARY_ADMINISTRATIVE`       | `SECONDARY_SUPERVISION`     | `OUTSIDE_CONFIGURATION_CLASS` | `SECONDARY_AUDIT`     | `OUTSIDE_PERSONAL_CLASS` | `OUTSIDE_CLIENT_CLASS`   | `NONE`                        | La intención dominante ya está resuelta como `PRIMARY_ADMINISTRATIVE` y la pantalla pertenece a trabajo interno operativo, administrativo, supervisor, configurable o auditable. Procesar información relacionada con clientes no la convierte en pantalla de cliente.                                                                   |
| `VSCREEN-0156` | Presupuestos, escenarios y forecast                   | `numera`   | `VPROC-0069::STEP-PLAN_BUDGET_AND_FORECAST`                 | `OUTSIDE_OPERATIONAL_CLASS` | `PRIMARY_ADMINISTRATIVE`       | `SECONDARY_SUPERVISION`     | `OUTSIDE_CONFIGURATION_CLASS` | `SECONDARY_AUDIT`     | `OUTSIDE_PERSONAL_CLASS` | `OUTSIDE_CLIENT_CLASS`   | `NONE`                        | La intención dominante ya está resuelta como `PRIMARY_ADMINISTRATIVE` y la pantalla pertenece a trabajo interno operativo, administrativo, supervisor, configurable o auditable. Procesar información relacionada con clientes no la convierte en pantalla de cliente.                                                                   |
| `VSCREEN-0157` | Impuestos y obligaciones de cumplimiento              | `numera`   | `VPROC-0052::STEP-MANAGE_TAX_OBLIGATION`                    | `OUTSIDE_OPERATIONAL_CLASS` | `PRIMARY_ADMINISTRATIVE`       | `SECONDARY_SUPERVISION`     | `SECONDARY_CONFIGURATION`     | `SECONDARY_AUDIT`     | `OUTSIDE_PERSONAL_CLASS` | `OUTSIDE_CLIENT_CLASS`   | `NONE`                        | La intención dominante ya está resuelta como `PRIMARY_ADMINISTRATIVE` y la pantalla pertenece a trabajo interno operativo, administrativo, supervisor, configurable o auditable. Procesar información relacionada con clientes no la convierte en pantalla de cliente.                                                                   |
| `VSCREEN-0158` | Distribución y asignación de costos                   | `numera`   | `VPROC-0054::STEP-ALLOCATE_COSTS`                           | `OUTSIDE_OPERATIONAL_CLASS` | `PRIMARY_ADMINISTRATIVE`       | `OUTSIDE_SUPERVISION_CLASS` | `SECONDARY_CONFIGURATION`     | `SECONDARY_AUDIT`     | `OUTSIDE_PERSONAL_CLASS` | `OUTSIDE_CLIENT_CLASS`   | `NONE`                        | La intención dominante ya está resuelta como `PRIMARY_ADMINISTRATIVE` y la pantalla pertenece a trabajo interno operativo, administrativo, supervisor, configurable o auditable. Procesar información relacionada con clientes no la convierte en pantalla de cliente.                                                                   |
| `VSCREEN-0159` | Indicadores, análisis y planes de mejora              | `numera`   | `VPROC-0061::STEP-ANALYZE_AND_PLAN_IMPROVEMENT`             | `OUTSIDE_OPERATIONAL_CLASS` | `SECONDARY_ADMINISTRATIVE`     | `PRIMARY_SUPERVISION`       | `OUTSIDE_CONFIGURATION_CLASS` | `OUTSIDE_AUDIT_CLASS` | `OUTSIDE_PERSONAL_CLASS` | `OUTSIDE_CLIENT_CLASS`   | `NONE`                        | La intención dominante ya está resuelta como `PRIMARY_SUPERVISION` y la pantalla pertenece a trabajo interno operativo, administrativo, supervisor, configurable o auditable. Procesar información relacionada con clientes no la convierte en pantalla de cliente.                                                                      |
| `VSCREEN-0160` | Inicio y selección del portal de compras              | `pass`     | `VPROC-0039::STEP-ENTER_CUSTOMER_COMMERCE`                  | `OUTSIDE_OPERATIONAL_CLASS` | `OUTSIDE_ADMINISTRATIVE_CLASS` | `OUTSIDE_SUPERVISION_CLASS` | `OUTSIDE_CONFIGURATION_CLASS` | `OUTSIDE_AUDIT_CLASS` | `OUTSIDE_PERSONAL_CLASS` | `PRIMARY_CLIENT`         | `CLIENT_HOME_ENTRY`           | La intención dominante presenta la entrada al canal de cliente, beneficios o comercio sin apropiarse del backoffice. La pantalla está diseñada para una persona cliente o visitante del canal PASS y opera exclusivamente sobre una proyección comercial, de fidelización o servicio autorizada para ese sujeto o sesión.                |
| `VSCREEN-0161` | Menú y catálogo comercial del cliente                 | `pass`     | `VPROC-0017::STEP-BROWSE_COMMERCIAL_OFFER`                  | `OUTSIDE_OPERATIONAL_CLASS` | `OUTSIDE_ADMINISTRATIVE_CLASS` | `OUTSIDE_SUPERVISION_CLASS` | `OUTSIDE_CONFIGURATION_CLASS` | `OUTSIDE_AUDIT_CLASS` | `OUTSIDE_PERSONAL_CLASS` | `PRIMARY_CLIENT`         | `CLIENT_OFFER_BROWSE`         | La intención dominante permite explorar la oferta comercial vigente y sus condiciones visibles. La pantalla está diseñada para una persona cliente o visitante del canal PASS y opera exclusivamente sobre una proyección comercial, de fidelización o servicio autorizada para ese sujeto o sesión.                                     |
| `VSCREEN-0162` | Carrito y configuración del pedido                    | `pass`     | `VPROC-0039::STEP-CONFIGURE_CART`                           | `OUTSIDE_OPERATIONAL_CLASS` | `OUTSIDE_ADMINISTRATIVE_CLASS` | `OUTSIDE_SUPERVISION_CLASS` | `OUTSIDE_CONFIGURATION_CLASS` | `OUTSIDE_AUDIT_CLASS` | `OUTSIDE_PERSONAL_CLASS` | `PRIMARY_CLIENT`         | `CLIENT_CART`                 | La intención dominante permite configurar una instancia concreta de compra sin modificar la oferta ni reglas empresariales. La pantalla está diseñada para una persona cliente o visitante del canal PASS y opera exclusivamente sobre una proyección comercial, de fidelización o servicio autorizada para ese sujeto o sesión.         |
| `VSCREEN-0163` | Dirección, modalidad y programación de entrega        | `pass`     | `VPROC-0050::STEP-SELECT_FULFILLMENT`                       | `OUTSIDE_OPERATIONAL_CLASS` | `OUTSIDE_ADMINISTRATIVE_CLASS` | `OUTSIDE_SUPERVISION_CLASS` | `OUTSIDE_CONFIGURATION_CLASS` | `OUTSIDE_AUDIT_CLASS` | `OUTSIDE_PERSONAL_CLASS` | `PRIMARY_CLIENT`         | `CLIENT_FULFILLMENT`          | La intención dominante permite seleccionar o seguir la modalidad de preparación, entrega y cumplimiento del pedido propio. La pantalla está diseñada para una persona cliente o visitante del canal PASS y opera exclusivamente sobre una proyección comercial, de fidelización o servicio autorizada para ese sujeto o sesión.          |
| `VSCREEN-0164` | Revisión, checkout e inicio de pago                   | `pass`     | `VPROC-0043::STEP-REVIEW_AND_START_PAYMENT`                 | `OUTSIDE_OPERATIONAL_CLASS` | `OUTSIDE_ADMINISTRATIVE_CLASS` | `OUTSIDE_SUPERVISION_CLASS` | `OUTSIDE_CONFIGURATION_CLASS` | `OUTSIDE_AUDIT_CLASS` | `OUTSIDE_PERSONAL_CLASS` | `PRIMARY_CLIENT`         | `CLIENT_CHECKOUT_PAYMENT`     | La intención dominante permite revisar la compra, iniciar el pago y recibir una confirmación segura del resultado. La pantalla está diseñada para una persona cliente o visitante del canal PASS y opera exclusivamente sobre una proyección comercial, de fidelización o servicio autorizada para ese sujeto o sesión.                  |
| `VSCREEN-0165` | Confirmación de pedido y retorno de pago              | `pass`     | `VPROC-0043::STEP-PRESENT_ORDER_RECEIPT`                    | `OUTSIDE_OPERATIONAL_CLASS` | `OUTSIDE_ADMINISTRATIVE_CLASS` | `OUTSIDE_SUPERVISION_CLASS` | `OUTSIDE_CONFIGURATION_CLASS` | `SECONDARY_AUDIT`     | `OUTSIDE_PERSONAL_CLASS` | `PRIMARY_CLIENT`         | `CLIENT_CHECKOUT_PAYMENT`     | La intención dominante permite revisar la compra, iniciar el pago y recibir una confirmación segura del resultado. La pantalla está diseñada para una persona cliente o visitante del canal PASS y opera exclusivamente sobre una proyección comercial, de fidelización o servicio autorizada para ese sujeto o sesión.                  |
| `VSCREEN-0166` | Mis pedidos y detalle                                 | `pass`     | `VPROC-0039::STEP-CONSULT_PERSONAL_ORDERS`                  | `OUTSIDE_OPERATIONAL_CLASS` | `OUTSIDE_ADMINISTRATIVE_CLASS` | `OUTSIDE_SUPERVISION_CLASS` | `OUTSIDE_CONFIGURATION_CLASS` | `SECONDARY_AUDIT`     | `OUTSIDE_PERSONAL_CLASS` | `PRIMARY_CLIENT`         | `CLIENT_ORDER_SELF_SERVICE`   | La intención dominante permite consultar pedidos propios y su detalle autorizado. La pantalla está diseñada para una persona cliente o visitante del canal PASS y opera exclusivamente sobre una proyección comercial, de fidelización o servicio autorizada para ese sujeto o sesión.                                                   |
| `VSCREEN-0167` | Seguimiento de preparación y entrega del cliente      | `pass`     | `VPROC-0050::STEP-TRACK_PERSONAL_FULFILLMENT`               | `OUTSIDE_OPERATIONAL_CLASS` | `OUTSIDE_ADMINISTRATIVE_CLASS` | `OUTSIDE_SUPERVISION_CLASS` | `OUTSIDE_CONFIGURATION_CLASS` | `SECONDARY_AUDIT`     | `OUTSIDE_PERSONAL_CLASS` | `PRIMARY_CLIENT`         | `CLIENT_FULFILLMENT`          | La intención dominante permite seleccionar o seguir la modalidad de preparación, entrega y cumplimiento del pedido propio. La pantalla está diseñada para una persona cliente o visitante del canal PASS y opera exclusivamente sobre una proyección comercial, de fidelización o servicio autorizada para ese sujeto o sesión.          |
| `VSCREEN-0168` | Chat y comunicación asociada al pedido                | `pass`     | `VPROC-0047::STEP-COMMUNICATE_ABOUT_ORDER`                  | `OUTSIDE_OPERATIONAL_CLASS` | `OUTSIDE_ADMINISTRATIVE_CLASS` | `OUTSIDE_SUPERVISION_CLASS` | `OUTSIDE_CONFIGURATION_CLASS` | `SECONDARY_AUDIT`     | `OUTSIDE_PERSONAL_CLASS` | `PRIMARY_CLIENT`         | `CLIENT_COMMUNICATION`        | La intención dominante permite consultar o intercambiar comunicaciones vinculadas con la cuenta o pedido propio. La pantalla está diseñada para una persona cliente o visitante del canal PASS y opera exclusivamente sobre una proyección comercial, de fidelización o servicio autorizada para ese sujeto o sesión.                    |
| `VSCREEN-0169` | Mis reclamos y casos de servicio                      | `pass`     | `VPROC-0046::STEP-SUBMIT_AND_TRACK_CLAIM`                   | `OUTSIDE_OPERATIONAL_CLASS` | `OUTSIDE_ADMINISTRATIVE_CLASS` | `OUTSIDE_SUPERVISION_CLASS` | `OUTSIDE_CONFIGURATION_CLASS` | `SECONDARY_AUDIT`     | `OUTSIDE_PERSONAL_CLASS` | `PRIMARY_CLIENT`         | `CLIENT_SERVICE_RELATIONSHIP` | La intención dominante permite crear y seguir reclamos, casos, reservas o eventos propios. La pantalla está diseñada para una persona cliente o visitante del canal PASS y opera exclusivamente sobre una proyección comercial, de fidelización o servicio autorizada para ese sujeto o sesión.                                          |
| `VSCREEN-0170` | Mis reservas y eventos                                | `pass`     | `VPROC-0047::STEP-MANAGE_PERSONAL_RESERVATION`              | `OUTSIDE_OPERATIONAL_CLASS` | `OUTSIDE_ADMINISTRATIVE_CLASS` | `OUTSIDE_SUPERVISION_CLASS` | `OUTSIDE_CONFIGURATION_CLASS` | `SECONDARY_AUDIT`     | `OUTSIDE_PERSONAL_CLASS` | `PRIMARY_CLIENT`         | `CLIENT_SERVICE_RELATIONSHIP` | La intención dominante permite crear y seguir reclamos, casos, reservas o eventos propios. La pantalla está diseñada para una persona cliente o visitante del canal PASS y opera exclusivamente sobre una proyección comercial, de fidelización o servicio autorizada para ese sujeto o sesión.                                          |
| `VSCREEN-0171` | Calificación y satisfacción                           | `pass`     | `VPROC-0068::STEP-SUBMIT_SATISFACTION_RATING`               | `OUTSIDE_OPERATIONAL_CLASS` | `OUTSIDE_ADMINISTRATIVE_CLASS` | `OUTSIDE_SUPERVISION_CLASS` | `OUTSIDE_CONFIGURATION_CLASS` | `OUTSIDE_AUDIT_CLASS` | `OUTSIDE_PERSONAL_CLASS` | `PRIMARY_CLIENT`         | `CLIENT_FEEDBACK`             | La intención dominante permite registrar satisfacción o retroalimentación del cliente sobre una experiencia elegible. La pantalla está diseñada para una persona cliente o visitante del canal PASS y opera exclusivamente sobre una proyección comercial, de fidelización o servicio autorizada para ese sujeto o sesión.               |
| `VSCREEN-0172` | Comunicaciones y notificaciones del cliente           | `pass`     | `VPROC-0047::STEP-CONSULT_CUSTOMER_COMMUNICATION`           | `OUTSIDE_OPERATIONAL_CLASS` | `OUTSIDE_ADMINISTRATIVE_CLASS` | `OUTSIDE_SUPERVISION_CLASS` | `OUTSIDE_CONFIGURATION_CLASS` | `SECONDARY_AUDIT`     | `OUTSIDE_PERSONAL_CLASS` | `PRIMARY_CLIENT`         | `CLIENT_COMMUNICATION`        | La intención dominante permite consultar o intercambiar comunicaciones vinculadas con la cuenta o pedido propio. La pantalla está diseñada para una persona cliente o visitante del canal PASS y opera exclusivamente sobre una proyección comercial, de fidelización o servicio autorizada para ese sujeto o sesión.                    |
| `VSCREEN-0173` | Trazabilidad e investigación de lote                  | `fogo`     | `VPROC-0035::STEP-INVESTIGATE_BATCH_TRACEABILITY`           | `OUTSIDE_OPERATIONAL_CLASS` | `SECONDARY_ADMINISTRATIVE`     | `OUTSIDE_SUPERVISION_CLASS` | `OUTSIDE_CONFIGURATION_CLASS` | `PRIMARY_AUDIT`       | `OUTSIDE_PERSONAL_CLASS` | `OUTSIDE_CLIENT_CLASS`   | `NONE`                        | La intención dominante ya está resuelta como `PRIMARY_AUDIT` y la pantalla pertenece a trabajo interno operativo, administrativo, supervisor, configurable o auditable. Procesar información relacionada con clientes no la convierte en pantalla de cliente.                                                                            |
| `VSCREEN-0174` | Controles operativos de inocuidad                     | `fogo`     | `VPROC-0014::STEP-EXECUTE_FOOD_SAFETY_CONTROL`              | `PRIMARY_OPERATIONAL`       | `SECONDARY_ADMINISTRATIVE`     | `SECONDARY_SUPERVISION`     | `OUTSIDE_CONFIGURATION_CLASS` | `SECONDARY_AUDIT`     | `OUTSIDE_PERSONAL_CLASS` | `OUTSIDE_CLIENT_CLASS`   | `NONE`                        | La intención dominante ya está resuelta como `PRIMARY_OPERATIONAL` y la pantalla pertenece a trabajo interno operativo, administrativo, supervisor, configurable o auditable. Procesar información relacionada con clientes no la convierte en pantalla de cliente.                                                                      |
| `VSCREEN-0175` | Seguridad de cuenta y sesiones                        | `shell`    | `VPROC-0059::STEP-MANAGE_ACCOUNT_SECURITY`                  | `OUTSIDE_OPERATIONAL_CLASS` | `OUTSIDE_ADMINISTRATIVE_CLASS` | `OUTSIDE_SUPERVISION_CLASS` | `OUTSIDE_CONFIGURATION_CLASS` | `SECONDARY_AUDIT`     | `PRIMARY_PERSONAL`       | `OUTSIDE_CLIENT_CLASS`   | `NONE`                        | La intención dominante ya está resuelta como `PRIMARY_PERSONAL`. La superficie pertenece al ecosistema laboral o de cuenta interna y no al canal comercial de cliente PASS.                                                                                                                                                              |
| `VSCREEN-0176` | Definición de kits y conjuntos                        | `nexo`     | `VPROC-0067::STEP-MAINTAIN_KIT_DEFINITION`                  | `OUTSIDE_OPERATIONAL_CLASS` | `SECONDARY_ADMINISTRATIVE`     | `OUTSIDE_SUPERVISION_CLASS` | `PRIMARY_CONFIGURATION`       | `SECONDARY_AUDIT`     | `OUTSIDE_PERSONAL_CLASS` | `OUTSIDE_CLIENT_CLASS`   | `NONE`                        | La intención dominante ya está resuelta como `PRIMARY_CONFIGURATION` y la pantalla pertenece a trabajo interno operativo, administrativo, supervisor, configurable o auditable. Procesar información relacionada con clientes no la convierte en pantalla de cliente.                                                                    |
| `VSCREEN-0177` | Configuración de impresoras logísticas                | `nexo`     | `VPROC-0024::STEP-CONFIGURE_LOGISTICS_PRINTERS`             | `OUTSIDE_OPERATIONAL_CLASS` | `SECONDARY_ADMINISTRATIVE`     | `OUTSIDE_SUPERVISION_CLASS` | `PRIMARY_CONFIGURATION`       | `SECONDARY_AUDIT`     | `OUTSIDE_PERSONAL_CLASS` | `OUTSIDE_CLIENT_CLASS`   | `NONE`                        | La intención dominante ya está resuelta como `PRIMARY_CONFIGURATION` y la pantalla pertenece a trabajo interno operativo, administrativo, supervisor, configurable o auditable. Procesar información relacionada con clientes no la convierte en pantalla de cliente.                                                                    |

---

#### 14. Resumen por aplicación

| Aplicación | Primaria cliente | Secundaria cliente | Fuera de clase |   Total |
| ---------- | ---------------: | -----------------: | -------------: | ------: |
| `shell`    |                0 |                  0 |              7 |       7 |
| `viso`     |                0 |                  0 |             31 |      31 |
| `anima`    |                0 |                  0 |             14 |      14 |
| `nexo`     |                0 |                  0 |             37 |      37 |
| `fogo`     |                0 |                  0 |             15 |      15 |
| `origo`    |                0 |                  0 |             14 |      14 |
| `pulso`    |                0 |                  0 |             20 |      20 |
| `numera`   |                0 |                  0 |             20 |      20 |
| `pass`     |               19 |                  0 |              0 |      19 |
| **Total**  |           **19** |              **0** |        **158** | **177** |

La concentración de las 19 primarias en PASS es resultado del contrato de canal, no una regla que permita clasificar automáticamente cualquier pantalla futura por aplicación.

---

#### 15. Resumen por patrón

| Patrón                              | Pantallas |
| ----------------------------------- | --------: |
| `CLIENT_HOME_ENTRY`                 |         2 |
| `CLIENT_IDENTITY`                   |         1 |
| `CLIENT_LOYALTY`                    |         3 |
| `CLIENT_PROFILE_PRIVACY`            |         1 |
| `CLIENT_OFFER_BROWSE`               |         1 |
| `CLIENT_CART`                       |         1 |
| `CLIENT_FULFILLMENT`                |         2 |
| `CLIENT_CHECKOUT_PAYMENT`           |         2 |
| `CLIENT_ORDER_SELF_SERVICE`         |         1 |
| `CLIENT_COMMUNICATION`              |         2 |
| `CLIENT_SERVICE_RELATIONSHIP`       |         2 |
| `CLIENT_FEEDBACK`                   |         1 |
| **Total con relevancia de cliente** |    **19** |

No existe `SECONDARY_CLIENT` en el corte aprobado. Una pantalla interna no recibe relevancia de cliente solo porque procese datos o produzca efectos para clientes.

---

#### 16. SCREEN-PRIMARY-CLASS-CLOSURE-GATE-001

| Clase primaria final     | Pantallas |
| ------------------------ | --------: |
| `PRIMARY_OPERATIONAL`    |        54 |
| `PRIMARY_ADMINISTRATIVE` |        53 |
| `PRIMARY_SUPERVISION`    |        12 |
| `PRIMARY_CONFIGURATION`  |        16 |
| `PRIMARY_AUDIT`          |         3 |
| `PRIMARY_PERSONAL`       |        20 |
| `PRIMARY_CLIENT`         |        19 |
| **Total**                |   **177** |

Resultado obligatorio:

```text
pantallas con exactamente una clase primaria: 177
pantallas sin clase primaria: 0
pantallas con más de una clase primaria: 0
```

La puerta queda cerrada antes de iniciar actores, dispositivos, acciones, estados, información sensible, permisos e integraciones.

---

#### 17. Comercio, fidelización y servicio

1. la oferta, precio, disponibilidad, saldo, estado de pedido y elegibilidad deberán provenir de fuentes autorizadas;
2. el carrito es una instancia mutable, no una fuente de precios ni disponibilidad;
3. checkout y redención deberán ser idempotentes;
4. el cliente no podrá autoconcederse puntos, descuentos, compensaciones o estados;
5. los retornos de pago deberán reconciliarse con proveedor y backend;
6. seguimiento y notificaciones solo expondrán estados aprobados para cliente;
7. reclamos, reservas y chat conservarán cronología, propiedad y handoff al backoffice;
8. consentimientos y preferencias deberán versionarse y separarse de campos protegidos;
9. las comunicaciones promocionales respetarán opt-in, opt-out, propósito y canal;
10. la experiencia de cliente no duplicará ledgers, maestros ni estados propietarios de aplicaciones internas.

---

#### 18. Compatibilidad con clases anteriores

```text
PRIMARY_CLIENT + cualquier otra clase primaria = PROHIBIDO

PRIMARY_CLIENT + SECONDARY_AUDIT = PERMITIDO
PRIMARY_CLIENT + cualquier otra clase secundaria = SOLO CON FUNDAMENTO Y NUEVA DECISION
```

En el corte aprobado varias pantallas PASS conservan `SECONDARY_AUDIT` para historial, redención, confirmación, pedidos, seguimiento, comunicación, casos, reservas y notificaciones. Esto no las convierte en superficies auditoras empresariales.

---

#### 19. Cambio y versionado

Cambiar `client_fit` o `client_pattern` exige:

1. propuesta trazable;
2. comparación de actor, canal, sujeto, propiedad e intención;
3. revisión de privacidad, autenticación, autorización y fraude;
4. conservación del valor anterior;
5. nueva versión de clasificación;
6. revisión de acciones, datos sensibles, permisos, dispositivos, handoffs y pruebas;
7. reevaluación de la puerta de una clase primaria por pantalla;
8. nueva identidad cuando cambie materialmente el canal o la intención principal.

Mover una ruta, habilitar acceso web o mostrar información de cliente en una pantalla interna no modifica automáticamente la clasificación.

---

#### 20. Validaciones obligatorias

La compilación deberá fallar cuando:

1. falte una de las 177 pantallas;
2. una pantalla aparezca más de una vez;
3. identidad, nombre, aplicación, proceso, paso o clasificación previa difieran de `PROC-SCREEN-010`;
4. falte `client_fit`;
5. el valor no pertenezca al vocabulario;
6. una primaria o secundaria use `NONE`;
7. una pantalla fuera de clase use patrón de cliente;
8. falte fundamento;
9. una primaria de cliente tenga otra clase primaria;
10. los conteos no sean 19, 0 y 158;
11. los patrones no sumen 19;
12. una de las 19 pantallas PASS no reciba `PRIMARY_CLIENT`;
13. una pantalla no PASS reciba `PRIMARY_CLIENT` sin nueva decisión de canal;
14. una pantalla interna reciba `SECONDARY_CLIENT` solo por procesar datos de clientes;
15. una pantalla de cliente confíe en un identificador sin validar propiedad o token;
16. queden pantallas sin clase primaria;
17. exista más de una clase primaria en cualquier pantalla;
18. la distribución final no sea 54, 53, 12, 16, 3, 20 y 19;
19. AURA reciba clasificación sin pantalla admitida;
20. la continuidad no pase exclusivamente a `PROC-SCREEN-012`.

---

#### 21. Privacidad, seguridad y autorización

La clasificación de cliente no concede:

- acceso público;
- autenticación válida;
- consulta de saldo o puntos;
- creación de redención;
- acceso a pedidos;
- inicio o confirmación de pagos;
- modificación de perfil;
- consulta de reclamos o reservas;
- acceso a chat o notificaciones;
- lectura de información interna;
- acceso por URL directa.

Toda operación deberá validar canal, sesión, sujeto, propiedad o token, propósito, versión, estado, idempotencia, minimización y autorización de servidor.

---

#### 22. SCREEN-CLIENT-CARRYOVER-REGISTER-001

| Pendiente                                     | Propietario exacto                                        |
| --------------------------------------------- | --------------------------------------------------------- |
| definir actores objetivo de las 177 pantallas | `PROC-SCREEN-012`                                         |
| definir dispositivos soportados               | `PROC-SCREEN-013`                                         |
| definir acciones principales y secundarias    | `PROC-SCREEN-014` y `PROC-SCREEN-015`                     |
| definir condiciones y estados de interfaz     | `PROC-SCREEN-016` a `PROC-SCREEN-021`                     |
| definir información sensible y permisos       | `PROC-SCREEN-022` a `PROC-SCREEN-024`                     |
| vincular operaciones técnicas                 | `PROC-SCREEN-025`                                         |
| mapear rutas y legado                         | `PROC-SCREEN-026`                                         |
| definir métricas y aceptación                 | `PROC-SCREEN-027` y `PROC-SCREEN-028`                     |
| materializar contratos y validadores          | paquetes E5 y CI documental                               |
| validar con clientes y trabajadores reales    | `UX-QA-*` y pilotos E5                                    |
| admitir AURA                                  | tareas canónicas de AURA y nueva admisión `PROC-SCREEN-*` |

No queda pendiente narrativo sin tarea o puerta de resolución.

---

#### 23. Requisitos de prueba derivados

**Resultado:** GENERA 30 REQUISITOS DE PRUEBA.

Se incorporan `TREQ-UX-797` a `TREQ-UX-826` al Registro Canónico completo. Permanecen en estado `IDENTIFICADO`; automatización, implementación y evidencia corresponden a CI documental, paquetes E5, BLOQUE U, staging y pilotos.

---

#### 24. Criterios de aceptación

- [x] Se clasifican las 177 pantallas.
- [x] Se conservan exactamente nombres, aplicaciones, procesos, pasos y seis clasificaciones anteriores.
- [x] Cada pantalla recibe exactamente un `client_fit`.
- [x] Se distinguen 19 primarias, 0 secundarias y 158 fuera de clase.
- [x] Las 19 pantallas relevantes usan doce patrones.
- [x] Las 19 pantallas PASS reciben `PRIMARY_CLIENT`.
- [x] Ninguna pantalla interna recibe cliente por procesar datos de clientes.
- [x] Se delimitan visitante, cliente autenticado, propiedad y token acotado.
- [x] Se separan PASS, PULSO y el backoffice.
- [x] Se preserva auditoría secundaria compatible.
- [x] Cada una de las 177 pantallas queda con exactamente una clase primaria.
- [x] No quedan pantallas sin clase ni con clases primarias competidoras.
- [x] AURA conserva cero pantallas.
- [x] La clasificación no concede permisos.
- [x] Se generan `TREQ-UX-797` a `TREQ-UX-826`.
- [x] No se anticipan actores, dispositivos, acciones, estados, permisos, rutas o APIs.
- [x] No se implementa código ni se avanza a `PROC-SCREEN-012`.

---

#### 25. Resultado y continuidad

```text
PROC-SCREEN-010 APROBADA
PROC-SCREEN-011 APROBADA
PROC-SCREEN-012 NO INICIADA
```

La continuidad documental pasa exclusivamente a:

```text
PROC-SCREEN-012 — Definir actores objetivo
```
