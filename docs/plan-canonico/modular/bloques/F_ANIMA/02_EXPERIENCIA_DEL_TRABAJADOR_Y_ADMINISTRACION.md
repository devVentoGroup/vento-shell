### MINI-BLOQUE — EXPERIENCIA DEL TRABAJADOR Y ADMINISTRACION

<!-- PLAN-SECTION-META:START -->
Esta sección organiza **experiencia del trabajador y administracion** dentro de **F ANIMA**. Agrupa tareas que producen un resultado funcional común y deben mantenerse juntas para conservar contexto, trazabilidad y orden de ejecución.

**Cobertura canónica:** `ANIMA-UX-001` a `ANIMA-UX-017` — 17 tareas.

**Resultado esperado:** al cerrar este mini-bloque, su resultado debe quedar definido, verificable y coherente con las secciones anterior y siguiente antes de avanzar.

**Límites funcionales:** comienza con “Inventariar pantallas personales” y concluye con “Diseñar ciclo completo de novedades internas: audiencia, publicación, edición, archivo, notificación y visibilidad”.
<!-- PLAN-SECTION-META:END -->

<!-- EXECUTION-GATE-RECONCILIATION:B601-800:ANIMA-UX -->
### Reconciliación topológica de ANIMA-UX-001 a ANIMA-UX-017

Las tareas de experiencia ANIMA inventarían, diseñan, simplifican, prueban y validan el contrato UX objetivo. No constituyen una segunda unidad física de implementación.

| Propiedad | Valor |
| --- | --- |
| modalidad | `DEFINE_ONCE` |
| gate temporal | `NO_PHYSICAL_INSTANCE` |
| identidad | `<task_id>` |

La implementación de pantallas, flujos y comportamiento resultante pertenece a los paquetes E5 y a las tareas físicas propietarias de ANIMA, autorización, contexto, servidor y datos.

### ✅ ANIMA-UX-001 — Inventariar pantallas personales

**Estado:** APROBADA
**Tarea anterior:** ANIMA-AUTH-020 — Mantener Supabase como fuente de verdad
**Tarea siguiente:** ANIMA-UX-002 — Inventariar pantallas administrativas
**Tipo de tarea:** documental; inventario UX AS-IS de las pantallas y subsuperficies personales de ANIMA, con clasificación de superficies personales puras, mixtas y excluidas, sin rediseño de navegación ni implementación física
**Bloque:** F_ANIMA — EXPERIENCIA DEL TRABAJADOR Y ADMINISTRACION
**Repositorio propietario:** vento-group-sas/vento-shell
**Archivo propietario:** docs/plan-canonico/modular/bloques/F_ANIMA/02_EXPERIENCIA_DEL_TRABAJADOR_Y_ADMINISTRACION.md
**Estado físico resultante:** ESPECIFICADO_NO_MATERIALIZADO
**Cambios físicos autorizados:** ninguno durante esta tarea
**Requisitos de prueba creados o modificados:** 0

---

#### 1. Propósito

Inventariar de forma cerrada y verificable la experiencia personal que ANIMA ofrece actualmente al trabajador, reutilizando el universo estable de pantallas móviles ya identificado y contrastándolo contra el código vigente de la aplicación.

El resultado distingue:

- pantallas cuyo propósito principal es personal;
- pantallas que contienen una experiencia personal válida pero mezclan comportamiento gerencial o administrativo;
- superficies de acceso, administración o diagnóstico que no forman parte del inventario personal;
- subsuperficies embebidas que apoyan la experiencia personal sin convertirse en pantallas independientes.

Esta tarea describe el estado observado. No diseña todavía la experiencia objetivo ni separa físicamente las responsabilidades mezcladas.

---

#### 2. Regla de identidad del inventario

El inventario personal no crea un segundo catálogo de pantallas.

La identidad de cada pantalla continúa siendo la definida por el universo móvil canónico `ANIMA-SCREEN-001` a `ANIMA-SCREEN-014`.

```text
UNIVERSO MOVIL ANIMA
→ 14 módulos de pantalla existentes
→ identidad ANIMA-SCREEN estable
→ clasificación personal derivada sobre esas mismas identidades

INVENTARIO PERSONAL
≠ catálogo paralelo
≠ nueva numeración
≠ nueva navegación
≠ diseño TO-BE
```

---

#### 3. Definición operativa de pantalla personal

Para esta tarea, una pantalla se clasifica como **personal** cuando satisface simultáneamente estos criterios:

1. el actor primario puede ser el trabajador autenticado actuando sobre su propia jornada, información, documentos, comunicaciones, soporte o configuración;
2. la superficie tiene utilidad directa para ese trabajador sin requerir autoridad gerencial;
3. el sujeto principal de la interacción puede resolverse como el propio trabajador, su sesión, su vínculo o su contexto operativo;
4. la utilidad personal existe aunque la misma pantalla contenga además funciones gerenciales o administrativas condicionadas.

Una pantalla no se considera personal únicamente porque sea necesaria para entrar a la aplicación. Las superficies de arranque y autenticación se clasifican por separado como acceso transversal.

---

#### 4. Estados de clasificación

Se establecen cuatro estados documentales:

| Estado | Significado |
| --- | --- |
| `PERSONAL_PURA` | La pantalla observada está orientada al trabajador sobre su propia información o configuración y no contiene una función administrativa principal. |
| `PERSONAL_MIXTA` | La pantalla contiene una experiencia personal válida y además incorpora funciones gerenciales o administrativas observadas. |
| `NO_PERSONAL_ACCESO` | La pantalla participa en arranque o autenticación y no representa por sí misma experiencia laboral personal. |
| `NO_PERSONAL_ADMIN_TECNICA` | La pantalla está orientada a administración, supervisión o diagnóstico técnico y no forma parte de la experiencia personal base. |

Estos estados son clasificación documental AS-IS. No conceden permisos ni deciden la arquitectura física futura.

---

#### 5. Fuentes de evidencia

El inventario se apoya en:

- el inventario móvil aprobado que conserva catorce identidades `ANIMA-SCREEN-*`;
- el árbol actual de `vento-group-sas/vento-anima` en `main`;
- el commit inspeccionado `8bcfaaa3b6ab79d5839c03719edec7b50fd97d2d`;
- la topología Expo Router bajo `app/`;
- la configuración actual de pestañas de la aplicación autenticada;
- las condiciones de rol, capability y sesión observadas en las pantallas que mezclan experiencia personal y administrativa;
- la línea base automatizada existente que enumera catorce archivos de pantalla, tres layouts y nueve pestañas.

---

#### 6. Universo cuantitativo reconciliado

| Métrica | Resultado |
| --- | ---: |
| Módulos de pantalla móviles del universo canónico | **14** |
| Layouts separados del conteo | **3** |
| Patrones móviles dinámicos | **0** |
| Pestañas declaradas en el layout autenticado | **9** |
| Pestañas generales | **7** |
| Pestañas condicionadas | **2** |
| Pantallas con experiencia personal | **8** |
| Pantallas `PERSONAL_PURA` | **3** |
| Pantallas `PERSONAL_MIXTA` | **5** |
| Pantallas excluidas del inventario personal | **6** |
| Subsuperficies personales embebidas identificadas | **7** |

La suma `8 + 6 = 14` cierra el universo sin faltantes ni duplicados.

---

#### 7. Inventario personal canónico

| ID | Patrón visible | Archivo fuente | Propósito personal observado | Estado |
| --- | --- | --- | --- | --- |
| `ANIMA-SCREEN-004` | `/home` | `app/(app)/home.tsx` | Marcación de entrada y salida, geocerca, estado de sincronización, resumen diario y selección contextual de sede para el propio trabajador. | `PERSONAL_MIXTA` |
| `ANIMA-SCREEN-005` | `/shifts` | `app/(app)/shifts.tsx` | Consulta de próximos turnos, semana personal, turnos recientes y contexto de programación aplicable al trabajador. | `PERSONAL_MIXTA` |
| `ANIMA-SCREEN-006` | `/history` | `app/(app)/history.tsx` | Consulta del historial de asistencia propio, detalle de registros y reporte de incidencia sobre la propia jornada. | `PERSONAL_PURA` |
| `ANIMA-SCREEN-007` | `/documents` | `app/(app)/documents.tsx` | Consulta y apertura de documentos laborales visibles para el trabajador y seguimiento de alertas documentales propias. | `PERSONAL_MIXTA` |
| `ANIMA-SCREEN-008` | `/carnet` | `app/(app)/carnet.tsx` | Visualización del carné laboral propio y del estado de elegibilidad asociado al trabajador autenticado. | `PERSONAL_PURA` |
| `ANIMA-SCREEN-009` | `/announcements` | `app/(app)/announcements.tsx` | Lectura de novedades y comunicados visibles para el trabajador según la audiencia resultante. | `PERSONAL_MIXTA` |
| `ANIMA-SCREEN-012` | `/support` | `app/(app)/support.tsx` | Creación y seguimiento de tickets, mensajería asociada y consulta de ayuda operativa por el trabajador. | `PERSONAL_MIXTA` |
| `ANIMA-SCREEN-013` | `/account-settings` | `app/account-settings.tsx` | Gestión de permisos del dispositivo, privacidad, limpieza de datos y ciclo de la propia cuenta. | `PERSONAL_PURA` |

---

#### 8. Pantallas personales puras

Las siguientes identidades no presentan una función administrativa principal en la pantalla observada:

| ID | Núcleo personal |
| --- | --- |
| `ANIMA-SCREEN-006` | Historial propio de asistencia e incidencias asociadas. |
| `ANIMA-SCREEN-008` | Identificación laboral y elegibilidad del propio trabajador. |
| `ANIMA-SCREEN-013` | Permisos, privacidad y cuenta de la propia sesión. |

La clasificación `PERSONAL_PURA` no afirma que cada dependencia técnica esté libre de privilegios internos; afirma únicamente que la experiencia de pantalla observada no incorpora un modo administrativo principal para otro trabajador o para la organización.

---

#### 9. Pantallas personales mixtas

Cinco identidades contienen experiencia personal y comportamiento de mayor alcance en la misma pantalla:

| ID | Experiencia personal | Comportamiento adicional observado | Propietario de separación |
| --- | --- | --- | --- |
| `ANIMA-SCREEN-004` | Marcación y estado propio. | Resúmenes y horas visibles condicionalmente para roles gerenciales. | `ANIMA-UX-003` |
| `ANIMA-SCREEN-005` | Semana y turnos propios. | Gestión de turnos y vista gerencial de sede condicionadas por capability o fallback de rol. | `ANIMA-UX-002` y `ANIMA-UX-003` |
| `ANIMA-SCREEN-007` | Documentos visibles para el trabajador. | Carga, alcance, filtrado amplio y eliminación condicionados por permisos o roles. | `ANIMA-UX-002` y `ANIMA-UX-003` |
| `ANIMA-SCREEN-009` | Lectura de novedades. | Creación, edición, eliminación y selección de audiencia para roles gerenciales. | `ANIMA-UX-002` y `ANIMA-UX-003` |
| `ANIMA-SCREEN-012` | Tickets, conversación y ayuda propias. | Contacto dirigido a trabajadores para roles gerenciales. | `ANIMA-UX-002` y `ANIMA-UX-003` |

Esta tarea registra la mezcla; no decide todavía si la experiencia futura debe separarse por pantalla, flujo, navegación, permiso o aplicación.

---

#### 10. Superficies excluidas del inventario personal

| ID | Patrón visible | Motivo de exclusión | Clasificación |
| --- | --- | --- | --- |
| `ANIMA-SCREEN-001` | `/` | Puente técnico de entrada que redirige al arranque. | `NO_PERSONAL_ACCESO` |
| `ANIMA-SCREEN-002` | `/splash` | Bootstrap y decisión de continuidad según sesión. | `NO_PERSONAL_ACCESO` |
| `ANIMA-SCREEN-003` | `/login` | Autenticación y recuperación de acceso antes de establecer experiencia laboral personal. | `NO_PERSONAL_ACCESO` |
| `ANIMA-SCREEN-010` | `/operativo` | Resumen operativo condicionado a propietario, gerencia general o gerencia. | `NO_PERSONAL_ADMIN_TECNICA` |
| `ANIMA-SCREEN-011` | `/team` | Gestión de equipo, invitaciones y administración laboral. | `NO_PERSONAL_ADMIN_TECNICA` |
| `ANIMA-SCREEN-014` | `/anima-diagnostics` | Diagnóstico técnico con allowlist local observada. | `NO_PERSONAL_ADMIN_TECNICA` |

Las tres identidades administrativas o técnicas quedan como entrada para `ANIMA-UX-002`. Las tres identidades de acceso permanecen transversales y no se fuerzan artificialmente dentro de la experiencia personal o administrativa.

---

#### 11. Relación con la navegación autenticada

El layout autenticado declara nueve pestañas:

- `home`;
- `shifts`;
- `history`;
- `documents`;
- `carnet`;
- `announcements`;
- `operativo`;
- `team`;
- `support`.

Las siete pestañas generales pertenecen al inventario personal porque todas ofrecen una capacidad útil al trabajador autenticado.

Las pestañas `operativo` y `team` están condicionadas y no forman parte del inventario personal base.

`account-settings` es personal pero no es pestaña; permanece como utilidad del stack raíz.

---

#### 12. `ANIMA-SCREEN-004` — Home personal

El núcleo personal observado de Home es la jornada del propio trabajador:

- estado de asistencia;
- check-in y check-out;
- validación de geocerca;
- selección de sede cuando el contexto lo exige;
- conectividad y cola pendiente;
- resumen del día;
- notificaciones relacionadas con la operación propia.

Home también contiene información condicional para roles gerenciales. Esa mezcla impide clasificar la pantalla como personal pura.

La existencia de botones, tarjetas o mensajes en Home no constituye una concesión de autoridad. El inventario UX consume las decisiones canónicas de autorización definidas por el minibloque anterior.

---

#### 13. `ANIMA-SCREEN-005` — Turnos personales

La pantalla conserva como experiencia personal:

- próxima jornada publicada;
- semana propia;
- próximos turnos;
- turnos recientes;
- contexto de compañeros o sede cuando la vista publicada lo permite.

La misma pantalla observa capacidades de gestión y componentes gerenciales. Por tanto, la identidad queda `PERSONAL_MIXTA` y no se descompone durante esta tarea.

---

#### 14. `ANIMA-SCREEN-006` — Historial personal

El historial se resuelve contra la identidad del usuario autenticado y presenta:

- registros propios de asistencia;
- periodos de consulta;
- detalle del evento o jornada;
- reporte de incidencia vinculado al registro personal.

La pantalla se clasifica `PERSONAL_PURA` porque el sujeto funcional observado es el propio trabajador.

---

#### 15. `ANIMA-SCREEN-007` — Documentos personales

La utilidad personal observada es consultar y abrir documentación laboral visible para el trabajador.

La misma identidad incorpora capacidades de administración documental condicionadas por permisos o por fallbacks de rol observados. Esas capacidades incluyen alcance sobre otros trabajadores o sedes y operaciones de carga o eliminación.

Por ello la pantalla queda `PERSONAL_MIXTA` y su parte administrativa se reserva para las tareas siguientes.

---

#### 16. `ANIMA-SCREEN-008` — Carné personal

La pantalla presenta exclusivamente información de identificación laboral y elegibilidad asociada al usuario autenticado y a sus sedes.

Se clasifica `PERSONAL_PURA`.

El carné es una proyección de identidad laboral; no constituye por sí mismo prueba de permiso operativo, turno vigente ni autorización sobre otras capacidades.

---

#### 17. `ANIMA-SCREEN-009` — Novedades personales

La experiencia personal consiste en recibir y leer novedades visibles para el trabajador.

La creación, edición, eliminación y definición de audiencia aparecen en el mismo módulo para roles gerenciales observados. Esa combinación convierte la pantalla en `PERSONAL_MIXTA`.

La separación entre lectura personal y administración editorial se conserva como handoff explícito hacia `ANIMA-UX-002`, `ANIMA-UX-003` y `ANIMA-UX-017`.

---

#### 18. `ANIMA-SCREEN-012` — Soporte personal

La experiencia personal observada permite:

- crear tickets;
- consultar tickets propios;
- intercambiar mensajes;
- revisar preguntas frecuentes y recuperación operativa.

La opción gerencial de contactar trabajadores amplía el alcance de la misma pantalla. Por ello queda `PERSONAL_MIXTA`.

La tarea no convierte soporte en canal de administración laboral ni redefine sus permisos.

---

#### 19. `ANIMA-SCREEN-013` — Configuración personal

La pantalla administra aspectos propios de la sesión y del dispositivo:

- estado y solicitud de permisos del sistema;
- privacidad;
- limpieza de datos de la cuenta;
- solicitud de eliminación de cuenta;
- cierre de sesión;
- acceso restringido a diagnóstico cuando se cumple la condición técnica observada.

Su función principal sigue siendo personal y se clasifica `PERSONAL_PURA`.

El enlace técnico hacia diagnóstico no convierte la configuración completa en una pantalla administrativa.

---

#### 20. Subsuperficies personales embebidas

Las siguientes superficies apoyan el flujo personal pero no crean identidades de pantalla nuevas:

| Subsuperficie | Pantalla propietaria | Función personal observada |
| --- | --- | --- |
| `SitePickerModal` | `ANIMA-SCREEN-004` | Selección contextual de sede para la marcación. |
| `UserMenuModal` | `ANIMA-SCREEN-004` | Acceso a opciones del usuario y navegación personal. |
| `HistoryDetailModal` | `ANIMA-SCREEN-006` | Detalle del registro de asistencia seleccionado. |
| `HistoryIncidentModal` | `ANIMA-SCREEN-006` | Registro de incidencia vinculada a la asistencia propia. |
| `SupportTicketModal` | `ANIMA-SCREEN-012` | Creación de una solicitud de soporte propia. |
| `DataCleanupFlow` | `ANIMA-SCREEN-013` | Solicitud personal de limpieza de datos según el contrato vigente. |
| `DeleteAccountFlow` | `ANIMA-SCREEN-013` | Solicitud personal de eliminación de cuenta. |

No se cuentan como pantallas porque son modales o flujos embebidos dentro de una identidad de pantalla ya existente.

---

#### 21. Superficies embebidas reservadas al inventario administrativo

Se observan componentes administrativos dentro de pantallas mixtas, entre ellos gestión de turnos, carga documental, formulario de novedades y contacto dirigido a trabajadores.

Su inventario detallado, condiciones de acceso y clasificación administrativa corresponden a `ANIMA-UX-002`.

Esta tarea solo registra su existencia para explicar por qué determinadas pantallas no pueden declararse personales puras.

---

#### 22. Reglas antiinflación

El inventario personal preserva estas reglas:

1. un modal no crea una pantalla nueva;
2. una pestaña no crea una identidad distinta de su archivo de pantalla;
3. un estado de formulario no crea una pantalla;
4. un filtro, periodo, trabajador seleccionado o sede seleccionada no crea una pantalla;
5. los route groups de Expo Router no forman parte del patrón visible;
6. los layouts no forman parte del conteo de pantallas;
7. las superficies globales de error o actualización no forman parte del conteo personal;
8. el subproyecto web de autenticación no forma parte del inventario móvil personal.

---

#### 23. Contexto personal mínimo

Una pantalla personal puede proyectar únicamente información coherente con el actor efectivo y el contexto autorizado.

El inventario no trata como equivalentes:

- sesión autenticada;
- trabajador identificado;
- vínculo laboral;
- turno publicado;
- check-in activo;
- sede o área efectiva;
- rol operativo;
- permiso efectivo.

Cada concepto conserva la autoridad y precedencia definidas por las tareas `ANIMA-AUTH-*` ya aprobadas.

---

#### 24. Estado local y caché

La clasificación personal no convierte ningún estado local en fuente de verdad.

Caché, cola offline, estado de navegación, props, contexto React, datos hidratados o resultados anteriores pueden apoyar la experiencia, pero no ampliar el alcance del trabajador ni volver vigente una autorización caducada.

---

#### 25. Hallazgos de mezcla relevantes

El inventario detecta cinco zonas de mezcla que deben conservar trazabilidad:

1. Home: experiencia de marcación propia + información gerencial condicionada.
2. Turnos: consulta personal + gestión gerencial.
3. Documentos: consulta personal + administración documental.
4. Novedades: lectura personal + administración editorial y de audiencia.
5. Soporte: ticket personal + contacto laboral gerencial.

Estas mezclas son hallazgos documentales, no defectos corregidos físicamente en esta tarea.

---

#### 26. Handoff a ANIMA-UX-002

`ANIMA-UX-002 — Inventariar pantallas administrativas` deberá consumir como mínimo:

- `ANIMA-SCREEN-010`;
- `ANIMA-SCREEN-011`;
- `ANIMA-SCREEN-014`;
- los modos administrativos observados dentro de `ANIMA-SCREEN-004`, `005`, `007`, `009` y `012`.

El inventario administrativo deberá conservar las mismas identidades de pantalla y no duplicar una pantalla mixta como si fueran dos archivos o dos patrones distintos.

---

#### 27. Handoff a ANIMA-UX-003

`ANIMA-UX-003 — Separar experiencia del trabajador y del administrador` recibirá una matriz cerrada:

- `3` pantallas personales puras;
- `5` pantallas personales mixtas;
- `3` pantallas administrativas o técnicas sin experiencia personal base;
- `3` pantallas transversales de acceso.

Esa tarea decidirá la separación UX objetivo. ANIMA-UX-001 no decide todavía si la separación se materializa mediante navegación, composición, shells, permisos, aplicaciones distintas u otro mecanismo.

---

#### 28. Relación con las tareas UX posteriores

Este inventario es entrada para:

- `ANIMA-UX-004` y `ANIMA-UX-005`, que precisarán la información del inicio y del turno;
- `ANIMA-UX-006` a `ANIMA-UX-012`, que diseñarán marcación, mensajes y recuperación de cola;
- `ANIMA-UX-013`, que simplificará documentos y datos personales;
- `ANIMA-UX-014`, que tratará administración de equipo autorizada;
- `ANIMA-UX-015`, que validará check-in y check-out con trabajadores reales;
- `ANIMA-UX-016`, que auditará recordatorios de inicio y cierre;
- `ANIMA-UX-017`, que diseñará el ciclo completo de novedades internas.

Ninguna de esas decisiones se adelanta en esta tarea.

---

#### 29. Requisitos de prueba derivados

**NO GENERA REQUISITOS DE PRUEBA.**

Justificación:

- el universo de pantallas móviles, su cardinalidad, sus identidades y la separación entre pantalla, layout y superficie embebida ya están protegidos por requisitos vigentes;
- esta tarea clasifica un subconjunto UX del universo existente sin crear una nueva interfaz técnica, transición física, permiso, esquema, contrato de datos ni comportamiento runtime;
- las futuras decisiones de separación y rediseño pertenecen a tareas posteriores y deberán reutilizar o ampliar la cobertura únicamente cuando materialicen una obligación nueva.

Requisitos creados: **0**.

Requisitos modificados: **0**.

Requisitos diferidos: **0**.

Requisitos obsoletos: **0**.

---

#### 30. Cobertura de prueba vigente reutilizada

Sin modificar el registro, esta tarea reutiliza como trazabilidad:

- `TREQ-ANIMA-006`, que protege la cardinalidad de catorce módulos móviles;
- `TREQ-ANIMA-007`, que protege las identidades estables del inventario;
- `TREQ-ANIMA-008`, que protege la ausencia de patrones dinámicos en el snapshot;
- `TREQ-ANIMA-009`, que evita inflar el inventario con layouts, modales y superficies auxiliares;
- `TREQ-ANIMA-010`, que protege la cadena de arranque entre raíz, splash, home y login;
- `TREQ-ANIMA-011`, que separa la aplicación móvil de superficies web auxiliares;
- `TREQ-ANIMA-012`, que mantiene los providers y superficies globales fuera del conteo de pantallas.

La enumeración anterior es trazabilidad de cobertura existente y no representa actualización del registro.

---

#### 31. Evidencia de validación

| Clase | Estado | Evidencia |
| --- | --- | --- |
| BUILD | `NOT_APPLICABLE` | La tarea no autoriza ni modifica código, bundle, aplicación ni artefactos compilables. |
| LOCAL | `PASS` | El artefacto documental fue comprobado estructuralmente: una tarea, metadata completa, inventario cerrado `8 + 6 = 14`, IDs únicos, cinco clases de evidencia, continuidad y cero requisitos derivados. |
| REMOTA | `PASS` | Se contrastaron el owner canónico vigente y el código actual de `vento-group-sas/vento-anima` en `main`, commit `8bcfaaa3b6ab79d5839c03719edec7b50fd97d2d`; el árbol móvil conserva catorce módulos de pantalla y tres layouts. |
| OPERATIVA | `NOT_EXECUTED` | No se ejecutó ANIMA en dispositivo ni se realizaron pruebas con trabajadores; la tarea es inventario documental AS-IS basado en código y contratos. |
| FÍSICA | `NOT_APPLICABLE` | La topología de `ANIMA-UX-001..017` es `DEFINE_ONCE` con `NO_PHYSICAL_INSTANCE`; no existe instancia física propia de esta tarea. |

---

#### 32. Criterios de aceptación

1. El universo base conserva exactamente `14` identidades de pantalla.
2. El inventario personal contiene exactamente `8` identidades únicas.
3. Las `8` identidades personales pertenecen al universo canónico existente.
4. `3` identidades quedan clasificadas `PERSONAL_PURA`.
5. `5` identidades quedan clasificadas `PERSONAL_MIXTA`.
6. `6` identidades quedan explícitamente fuera del inventario personal.
7. La suma de incluidas y excluidas reconcilia `14` sin duplicados.
8. Las `7` pestañas generales se reconocen como personales y las `2` pestañas condicionadas se mantienen fuera del inventario personal base.
9. `account-settings` se conserva como utilidad personal fuera de la barra de pestañas.
10. Los modales y flujos embebidos no inflan el conteo de pantallas.
11. Las funciones administrativas detectadas dentro de pantallas mixtas quedan asignadas a `ANIMA-UX-002` y `ANIMA-UX-003`.
12. No se define navegación TO-BE ni se ejecuta cambio físico.
13. La tarea no crea ni modifica requisitos de prueba.
14. La continuidad queda reservada exclusivamente hacia `ANIMA-UX-002`.

---

#### 33. Riesgos controlados

El inventario evita:

- considerar todas las pestañas como equivalentes funcionalmente;
- ocultar que varias pantallas personales contienen acciones gerenciales;
- duplicar una pantalla mixta al inventariar experiencia personal y administrativa por separado;
- contar modales como pantallas;
- tratar login o splash como pantallas laborales personales;
- considerar diagnóstico técnico parte de la experiencia personal;
- adelantar el rediseño reservado a tareas posteriores;
- convertir visibilidad de interfaz en decisión de autorización.

---

#### 34. Límites

ANIMA-UX-001 no:

- modifica código de `vento-anima`;
- modifica Supabase;
- cambia Expo Router;
- agrega o retira pestañas;
- cambia permisos;
- crea guardas de navegación;
- modifica la clasificación administrativa completa;
- diseña la separación trabajador/administrador;
- redefine check-in, check-out, geocerca, cola offline o turnos;
- cambia documentos, soporte, novedades o cuenta;
- ejecuta pruebas con trabajadores;
- crea una instancia física;
- modifica el registro de requisitos de prueba.

---

#### 35. Estado de salida documental

La tarea deja materializado un snapshot UX personal reutilizable con:

- universo reconciliado de `14` pantallas;
- subconjunto personal de `8` pantallas;
- distribución `3 PERSONAL_PURA + 5 PERSONAL_MIXTA`;
- exclusión explicada de `6` pantallas;
- siete subsuperficies personales embebidas;
- cinco zonas de mezcla con propietario documental;
- handoff cerrado hacia inventario administrativo y separación de experiencias.

El estado físico permanece sin materialización propia.

---

#### 36. Continuidad

**ÚLTIMA TAREA APROBADA**
`ANIMA-AUTH-020 — Mantener Supabase como fuente de verdad`

**TAREA ACTUAL APROBADA**
`ANIMA-UX-001 — Inventariar pantallas personales`

**SIGUIENTE TAREA RESERVADA**
`ANIMA-UX-002 — Inventariar pantallas administrativas`


### ✅ ANIMA-UX-002 — Inventariar pantallas administrativas

**Estado:** APROBADA
**Tarea anterior:** ANIMA-UX-001 — Inventariar pantallas personales
**Tarea siguiente:** ANIMA-UX-003 — Separar experiencia del trabajador y del administrador
**Tipo de tarea:** documental; inventario UX AS-IS de las pantallas y subsuperficies administrativas de ANIMA, con clasificación de superficies administrativas puras, mixtas, técnicas y excluidas, sin rediseño de navegación ni implementación física
**Bloque:** F_ANIMA — EXPERIENCIA DEL TRABAJADOR Y ADMINISTRACION
**Repositorio propietario:** vento-group-sas/vento-shell
**Archivo propietario:** docs/plan-canonico/modular/bloques/F_ANIMA/02_EXPERIENCIA_DEL_TRABAJADOR_Y_ADMINISTRACION.md
**Estado físico resultante:** ESPECIFICADO_NO_MATERIALIZADO
**Cambios físicos autorizados:** ninguno durante esta tarea
**Requisitos de prueba creados o modificados:** 0

---

#### 1. Propósito

Inventariar de forma cerrada y verificable la experiencia administrativa que ANIMA ofrece actualmente, reutilizando el universo estable de catorce pantallas móviles y contrastándolo contra el código vigente de la aplicación.

El resultado distingue:

- pantallas cuyo propósito principal es administrativo o de supervisión;
- pantallas personales que incorporan capacidades administrativas condicionadas;
- una superficie técnica de diagnóstico con acceso restringido observado;
- pantallas que no contienen una capacidad administrativa material;
- subsuperficies embebidas que materializan acciones administrativas sin convertirse en pantallas independientes.

Esta tarea describe el estado observado. No diseña todavía la separación objetivo entre trabajador y administrador.

---

#### 2. Regla de identidad del inventario

El inventario administrativo no crea un segundo catálogo de pantallas.

La identidad continúa siendo la definida por el universo móvil canónico `ANIMA-SCREEN-001` a `ANIMA-SCREEN-014`.

```text
UNIVERSO MOVIL ANIMA
→ 14 módulos de pantalla existentes
→ identidad ANIMA-SCREEN estable
→ clasificación administrativa derivada sobre esas mismas identidades

INVENTARIO ADMINISTRATIVO
≠ catálogo paralelo
≠ nueva numeración
≠ nueva navegación
≠ permiso
≠ diseño TO-BE
```

---

#### 3. Definición operativa de pantalla administrativa

Para esta tarea, una pantalla participa en la experiencia administrativa cuando contiene una capacidad observada para administrar, supervisar o diagnosticar información o acciones que exceden la gestión exclusiva de la propia cuenta o jornada del trabajador.

Son señales de administración:

1. consultar o gestionar información de otros trabajadores;
2. crear, editar, confirmar, cancelar o publicar programación de terceros;
3. ampliar el alcance desde el actor propio hacia sede, equipo o ámbito global;
4. cargar, filtrar o eliminar documentación de terceros;
5. crear o administrar comunicaciones organizacionales o su audiencia;
6. contactar trabajadores desde una función de gestión;
7. consultar reportes agregados o filtrables de equipo;
8. modificar roles, sedes, invitaciones o estado de integrantes;
9. ejecutar diagnóstico técnico sobre empleados, turnos, sedes, asistencia o notificaciones.

La mera existencia de una pestaña, un botón visible o una condición local de rol no constituye autoridad canónica.

---

#### 4. Estados de clasificación

Se establecen cuatro estados documentales:

| Estado | Significado |
| --- | --- |
| `ADMIN_PURA` | El propósito principal observado de la pantalla es administrar o supervisar información de equipo u organización. |
| `ADMIN_MIXTA` | La pantalla conserva una experiencia personal válida y además incorpora capacidades administrativas observadas. |
| `ADMIN_TECNICA` | La pantalla está destinada a diagnóstico o soporte técnico con alcance sobre datos operativos de terceros. |
| `NO_ADMIN` | La pantalla no contiene una capacidad administrativa material en su experiencia observada. |

Los estados describen el AS-IS. No conceden permisos, no validan seguridad de servidor y no deciden la arquitectura futura.

---

#### 5. Fuentes de evidencia

El inventario se apoya en:

- la continuidad canónica vigente del BLOQUE F;
- `ANIMA-UX-001` aprobado como inventario personal precedente;
- el universo móvil estable `ANIMA-SCREEN-001` a `ANIMA-SCREEN-014`;
- el registro vigente de requisitos que protege inventario, navegación, pantallas mixtas y superficies administrativas;
- el árbol actual de `vento-group-sas/vento-anima`;
- el commit inspeccionado `8bcfaaa3b6ab79d5839c03719edec7b50fd97d2d`;
- el layout autenticado y sus nueve pestañas;
- las condiciones de rol, capability, permiso y allowlist observadas en código;
- los componentes y flujos embebidos materialmente asociados con administración.

---

#### 6. Universo cuantitativo reconciliado

| Métrica | Resultado |
| --- | ---: |
| Módulos de pantalla móviles del universo canónico | **14** |
| Pantallas con experiencia administrativa o técnica | **8** |
| Pantallas `ADMIN_PURA` | **2** |
| Pantallas `ADMIN_MIXTA` | **5** |
| Pantallas `ADMIN_TECNICA` | **1** |
| Pantallas `NO_ADMIN` | **6** |
| Pestañas declaradas en navegación autenticada | **9** |
| Pestañas con alguna capacidad administrativa observada | **7** |
| Pestañas condicionadas específicamente como administrativas | **2** |
| Patrones móviles dinámicos | **0** |

La suma `2 + 5 + 1 + 6 = 14` cierra el universo sin faltantes ni duplicados.

---

#### 7. Inventario administrativo canónico

| ID | Patrón visible | Archivo fuente | Capacidad administrativa observada | Estado |
| --- | --- | --- | --- | --- |
| `ANIMA-SCREEN-004` | `/home` | `app/(app)/home.tsx` | Horas y reportes operativos condicionados para propietario, gerente general o gerente. | `ADMIN_MIXTA` |
| `ANIMA-SCREEN-005` | `/shifts` | `app/(app)/shifts.tsx` | Creación, edición, confirmación, cancelación y gestión de turnos; vista gerencial por día y semana de sede. | `ADMIN_MIXTA` |
| `ANIMA-SCREEN-007` | `/documents` | `app/(app)/documents.tsx` | Vista ampliada, carga, filtrado por trabajador, alcance de sede/global y eliminación de documentos. | `ADMIN_MIXTA` |
| `ANIMA-SCREEN-009` | `/announcements` | `app/(app)/announcements.tsx` | Creación, edición, eliminación y definición de audiencia de novedades. | `ADMIN_MIXTA` |
| `ANIMA-SCREEN-010` | `/operativo` | `app/(app)/operativo.tsx` | Resumen y reportes de asistencia de equipo con alcance gerencial. | `ADMIN_PURA` |
| `ANIMA-SCREEN-011` | `/team` | `app/(app)/team.tsx` | Consulta y gestión de equipo, invitaciones, roles, sedes y flujo de eliminación restringido. | `ADMIN_PURA` |
| `ANIMA-SCREEN-012` | `/support` | `app/(app)/support.tsx` | Contacto dirigido a trabajadores mediante aviso o conversación para roles gerenciales. | `ADMIN_MIXTA` |
| `ANIMA-SCREEN-014` | `/anima-diagnostics` | `app/anima-diagnostics.tsx` | Diagnóstico sobre empleados, turnos, sedes, asistencia, geocerca y cobertura de push. | `ADMIN_TECNICA` |

---

#### 8. Pantallas administrativas puras

Dos identidades tienen propósito administrativo principal:

| ID | Núcleo administrativo |
| --- | --- |
| `ANIMA-SCREEN-010` | Resumen operativo y reportes de asistencia de equipo. |
| `ANIMA-SCREEN-011` | Administración de trabajadores, sedes, roles e invitaciones. |

Estas pantallas no forman parte de la experiencia personal base definida en ANIMA-UX-001.

---

#### 9. Pantallas administrativas mixtas

Cinco identidades comparten experiencia personal y capacidad administrativa:

| ID | Núcleo personal coexistente | Capacidad administrativa coexistente | Propietario de separación UX |
| --- | --- | --- | --- |
| `ANIMA-SCREEN-004` | Jornada, marcación y estado propio. | Horas y reporte operativo de equipo para roles gerenciales. | `ANIMA-UX-003` |
| `ANIMA-SCREEN-005` | Semana y turnos propios. | Crear, editar, confirmar y cancelar turnos; gestionar vista de equipo. | `ANIMA-UX-003` |
| `ANIMA-SCREEN-007` | Documentos visibles para el trabajador. | Alcances ampliados, carga, filtrado y eliminación documental. | `ANIMA-UX-003` |
| `ANIMA-SCREEN-009` | Lectura de novedades. | Crear, editar, eliminar y definir audiencia. | `ANIMA-UX-003` |
| `ANIMA-SCREEN-012` | Tickets, conversación y ayuda propias. | Contactar trabajadores mediante aviso o conversación. | `ANIMA-UX-003` |

El inventario registra la mezcla sin decidir si la separación futura será por pantalla, navegación, componente, acción o aplicación.

---

#### 10. Pantalla administrativa técnica

`ANIMA-SCREEN-014` se clasifica `ADMIN_TECNICA`.

La pantalla permite seleccionar un empleado y revisar información de:

- turnos publicados;
- sedes y coordenadas;
- último registro de asistencia;
- contexto de asistencia;
- tokens push;
- cobertura de tokens;
- condiciones específicas de sede y rol operativo;
- estado de geolocalización del dispositivo utilizado para el diagnóstico.

Su propósito es auditoría y soporte técnico, no gestión laboral cotidiana.

---

#### 11. Superficies excluidas del inventario administrativo

| ID | Patrón visible | Motivo de exclusión | Estado |
| --- | --- | --- | --- |
| `ANIMA-SCREEN-001` | `/` | Puente técnico de entrada. | `NO_ADMIN` |
| `ANIMA-SCREEN-002` | `/splash` | Bootstrap y redirección de sesión. | `NO_ADMIN` |
| `ANIMA-SCREEN-003` | `/login` | Autenticación y recuperación de acceso. | `NO_ADMIN` |
| `ANIMA-SCREEN-006` | `/history` | Historial e incidencias del propio actor. | `NO_ADMIN` |
| `ANIMA-SCREEN-008` | `/carnet` | Identificación laboral y elegibilidad del propio trabajador. | `NO_ADMIN` |
| `ANIMA-SCREEN-013` | `/account-settings` | Permisos, privacidad y cuenta del propio actor; conserva solo un acceso auxiliar condicionado hacia diagnóstico. | `NO_ADMIN` |

La entrada auxiliar a diagnóstico desde `account-settings` no transforma esa pantalla personal en una pantalla administrativa.

---

#### 12. Relación con la navegación autenticada

El layout autenticado declara nueve pestañas.

Siete de ellas contienen alguna capacidad administrativa observada:

- `home`;
- `shifts`;
- `documents`;
- `announcements`;
- `operativo`;
- `team`;
- `support`.

Dentro de ese conjunto:

- `operativo` y `team` son las dos pestañas condicionadas por rol en el layout;
- las otras cinco son pestañas generales que cambian o amplían comportamiento según rol, capability o permiso.

`history` y `carnet` no contienen capacidad administrativa material observada.

---

#### 13. `ANIMA-SCREEN-004` — Home administrativa

Home conserva su núcleo personal, pero incorpora dos ampliaciones administrativas observadas:

1. la visualización de horas en el resumen diario se condiciona a propietario, gerente general o gerente;
2. `OperativoReportScreen` se renderiza para esos mismos roles.

Por tanto, Home no es una pantalla administrativa independiente, sino una pantalla mixta que contiene un bloque gerencial.

La condición observada es una lista local de roles. Esta tarea la registra como evidencia de interfaz, no como decisión canónica de autorización.

---

#### 14. `ANIMA-SCREEN-005` — Turnos administrativos

La pantalla de turnos observa `shift.create` mediante el resolver de capabilities y utiliza como fallback local los roles propietario, gerente general y gerente.

Cuando la gestión está habilitada, la pantalla expone:

- creación de turnos;
- edición de turnos;
- confirmación;
- cancelación;
- agrupación gerencial por día;
- vista de semana de sede con contexto de equipo.

`CreateShiftModal`, `EditShiftModal` y `ManagerShiftDaySection` son subsuperficies administrativas de la misma pantalla y no crean nuevas identidades `ANIMA-SCREEN`.

---

#### 15. `ANIMA-SCREEN-007` — Documentos administrativos

La pantalla observa tres códigos de permiso para:

- lectura ampliada;
- carga;
- eliminación.

El comportamiento actual combina esos permisos con fallbacks locales de rol para propietario, gerente general y gerente.

La experiencia administrativa incluye:

- consulta de documentos fuera del sujeto propio cuando el alcance lo permite;
- filtro por trabajador;
- alcance por sede;
- alcance global para los roles observados;
- carga de documentos;
- selección de tipo, trabajador y sede;
- eliminación de documento;
- interacción con Storage asociada a la eliminación observada.

El inventario registra estas acciones; no declara correcto su mecanismo físico ni sustituye el ciclo documental canónico.

---

#### 16. `ANIMA-SCREEN-009` — Novedades administrativas

La pantalla habilita administración cuando el rol local es propietario, gerente general o gerente.

Las capacidades observadas son:

- crear una novedad;
- editar una novedad;
- eliminar una novedad;
- seleccionar sede;
- seleccionar rol;
- configurar audiencia durante la creación.

El formulario se implementa como modal dentro de la ruta `/announcements`; no constituye una pantalla adicional.

La coherencia entre audiencia persistida, notificada y visible permanece gobernada por sus contratos existentes y por ANIMA-UX-017.

---

#### 17. `ANIMA-SCREEN-010` — Resumen operativo

`/operativo` se clasifica `ADMIN_PURA`.

La pantalla aplica una condición local que admite:

- propietario;
- gerente general;
- gerente.

Si el actor no satisface esa condición, la ruta devuelve un estado de acceso restringido.

Cuando se admite acceso, la ruta materializa `OperativoReportScreen`, que permite presentar indicadores de asistencia y, según alcance, filtrar o exportar información por sede o trabajador.

---

#### 18. `ANIMA-SCREEN-011` — Equipo

`/team` se clasifica `ADMIN_PURA`.

La pantalla resuelve:

- `team.view` para lectura;
- `team.invite` para administración;
- fallback local a propietario, gerente general o gerente mientras las capabilities no están disponibles.

La experiencia administrativa observada incluye:

- búsqueda de trabajadores;
- filtros por sede y estado;
- consulta de activos e inactivos;
- invitación;
- asignación de rol;
- asignación y cambio de sedes;
- reenvío y cancelación de invitaciones;
- edición de integrantes;
- flujo restringido de eliminación.

La posibilidad de eliminar observa además un identificador de usuario configurado por ambiente y comprobaciones locales adicionales.

---

#### 19. `ANIMA-SCREEN-012` — Soporte administrativo

La pantalla de soporte mantiene tickets y ayuda personal, pero habilita una función adicional para propietario, gerente general o gerente.

Esa función permite:

- seleccionar un trabajador;
- enviar un aviso;
- iniciar una conversación;
- limitar para gerente el universo de trabajadores según sede resuelta.

`ContactWorkerModal` es la principal subsuperficie administrativa observada y permanece dentro de la misma identidad de pantalla.

---

#### 20. `ANIMA-SCREEN-014` — Diagnóstico técnico

La pantalla de diagnóstico utiliza una allowlist local de correos para decidir si puede cargar información.

La allowlist observada en la pantalla contiene dos cuentas.

Una vez habilitada, la pantalla puede consultar un universo de empleados y seleccionar un empleado concreto para revisar turnos, sedes, asistencia, ubicación y notificaciones.

La allowlist local se registra únicamente como comportamiento actual. No se considera capacidad empresarial autoritativa ni protección suficiente de servidor.

---

#### 21. Entrada técnica desde `account-settings`

`ANIMA-SCREEN-013` mantiene clasificación `NO_ADMIN`, pero contiene un acceso auxiliar a `/anima-diagnostics`.

El botón se muestra mediante una allowlist local propia.

Se observa una divergencia concreta:

- la allowlist de `account-settings` contiene una cuenta;
- la allowlist dentro de `/anima-diagnostics` contiene dos cuentas.

Por tanto, existe una cuenta admitida por la pantalla de destino que no recibe el acceso equivalente desde la navegación de configuración.

Este hallazgo ya tiene cobertura contractual y no se corrige físicamente en esta tarea.

---

#### 22. Reutilización de `OperativoReportScreen`

El mismo componente de reporte operativo se utiliza en dos ubicaciones:

1. embebido dentro de `/home` para roles gerenciales;
2. como contenido principal de `/operativo`.

Esto produce dos entradas UX distintas hacia una misma capacidad de reporte administrativo.

La tarea registra la duplicidad de entrada sin declararla error, legado ni candidata a retiro. La decisión de separación o simplificación pertenece a ANIMA-UX-003.

---

#### 23. Matriz de acciones administrativas observadas

| Pantalla | Ver equipo/terceros | Crear | Editar | Confirmar/cancelar | Eliminar | Definir alcance/audiencia | Reportar/exportar | Diagnóstico |
| --- | --- | --- | --- | --- | --- | --- | --- | --- |
| `/home` | Sí, mediante reporte | No | No | No | No | Filtros del reporte | Sí | No |
| `/shifts` | Sí | Sí | Sí | Sí | No | Sede/empleado según gestión | No | No |
| `/documents` | Sí | Sí, carga documental | No observado como edición independiente | No | Sí | Personal/sede/global observado | No | No |
| `/announcements` | Sí, por audiencia | Sí | Sí | No | Sí | Sede/rol | No | No |
| `/operativo` | Sí | No | No | No | No | Sede/trabajador según alcance | Sí | No |
| `/team` | Sí | Sí, invitación | Sí | No | Sí, flujo restringido | Rol/sede | No | No |
| `/support` | Sí, contacto dirigido | Sí, aviso/conversación | No | No | No | Trabajador/sede | No | No |
| `/anima-diagnostics` | Sí | No | No | No | No | Empleado/turno | No | Sí |

La matriz representa controles y capacidades observados en interfaz; no reemplaza la autorización de servidor.

---

#### 24. Matriz de evidencia de acceso actual

| Pantalla | Evidencia observada en cliente | Observación contractual |
| --- | --- | --- |
| `/home` | Lista local de roles gerenciales. | Visibilidad no equivale a autoridad. |
| `/shifts` | Capability `shift.create`; fallback de roles gerenciales. | La acción debe conservar autorización efectiva y validación de servidor. |
| `/documents` | Permisos de documentos combinados con fallbacks de rol. | Los alcances y acciones deben respetar privacidad, retención y autorización. |
| `/announcements` | Lista local de roles gerenciales. | La administración no puede depender solo de la condición local. |
| `/operativo` | Lista local de roles tanto en pestaña como en pantalla. | El acceso directo debe converger con la decisión efectiva. |
| `/team` | Pestaña por roles; pantalla por capabilities con fallback de roles. | Existe superficie de divergencia entre navegación y autorización. |
| `/support` | Lista local de roles para contacto dirigido. | Actor y territorio requieren autorización efectiva. |
| `/anima-diagnostics` | Allowlist local de correo. | El correo hardcodeado no es autoridad empresarial ni protección de servidor. |

---

#### 25. Alcance administrativo y sujeto

La administración observada no tiene un único alcance.

| Área | Alcance observado |
| --- | --- |
| Reportes | Personal, sede, trabajador o global según rol y ubicación de uso. |
| Turnos | Propios para lectura; equipo/sede para gestión habilitada. |
| Documentos | Personal, sede o global según permisos y rol observado. |
| Novedades | Lectura personal; administración con audiencia por sede o rol. |
| Equipo | Sede para gerente; alcance mayor para propietario o gerente general. |
| Soporte | Tickets propios; contacto dirigido con alcance territorial para gerente. |
| Diagnóstico | Selección explícita de empleados y turnos dentro del universo retornado. |

La clasificación administrativa no amplía por sí misma ninguno de estos alcances.

---

#### 26. Subsuperficies administrativas embebidas

Se identifican como subsuperficies materialmente administrativas, sin contarlas como pantallas nuevas:

- `OperativoReportScreen`;
- `DateRangeModal`;
- `ReportFilterModal`;
- `CreateShiftModal`;
- `EditShiftModal`;
- `ManagerShiftDaySection`;
- `DocumentsEmployeeFilterCard`;
- `UploadDocumentModal`;
- `DocumentPickerModal` cuando forma parte del flujo administrativo de documentos;
- formulario modal de novedades;
- `TeamEditModal`;
- `TeamInviteModal`;
- `TeamDeleteModal`;
- `ContactWorkerModal`.

Esta lista describe las subsuperficies relevantes para entender la mezcla administrativa; no redefine el catálogo completo de componentes internos de ANIMA.

---

#### 27. Modales, filtros y estados no crean pantallas

La selección de:

- trabajador;
- sede;
- rol;
- fecha;
- rango;
- estado;
- documento;
- turno;
- audiencia;

no crea una nueva pantalla canónica.

Del mismo modo, abrir un modal de edición, carga, invitación, eliminación, reporte o contacto conserva la identidad de la ruta propietaria.

La cardinalidad móvil continúa siendo catorce pantallas.

---

#### 28. Visibilidad de pestaña y acceso directo

El layout autenticado oculta `operativo` y `team` según una lista local de roles.

La pantalla `operativo` repite una lista local equivalente.

La pantalla `team`, en cambio, resuelve capabilities `team.view` y `team.invite` cuando están cargadas, y solo usa roles como fallback.

Por tanto, la navegación de `team` y la lógica interna de la pantalla no consumen exactamente el mismo mecanismo observado.

La tarea registra esta divergencia como hallazgo AS-IS. No modifica el control de acceso ni decide su implementación final.

---

#### 29. Relación con autorización y fuente de verdad

ANIMA-UX-002 consume los contratos aprobados del minibloque de autorización inmediatamente anterior.

En consecuencia:

- una condición local de rol no concede autoridad;
- una capability proyectada en cliente no sustituye la decisión autoritativa;
- una pestaña oculta no constituye frontera de seguridad;
- una allowlist de correo no reemplaza una capacidad técnica canónica;
- una acción administrativa protegida debe converger con autorización efectiva en servidor;
- Supabase conserva el estado runtime autoritativo según la propiedad de cada dominio;
- `vento-shell` conserva contratos, migraciones, configuración y pruebas versionadas.

Esta tarea solo inventaría dónde existe administración en la experiencia actual.

---

#### 30. Hallazgos y carryover

| Hallazgo | Bloquea ANIMA-UX-002 | Propietario | Condición de salida |
| --- | --- | --- | --- |
| Cinco pantallas mezclan experiencia personal y administrativa. | No | `ANIMA-UX-003` | Definir separación objetivo sin perder capacidades personales ni administrativas. |
| `OperativoReportScreen` aparece en Home y en Resumen. | No | `ANIMA-UX-003` | Decidir la ubicación y navegación objetivo del reporte. |
| Navegación de `team` usa roles mientras la pantalla puede resolver capabilities. | No | Contratos vigentes de autorización y protección de vistas/servidor | Hacer converger navegación, acceso directo y decisión efectiva. |
| Las allowlists de entrada y pantalla de diagnóstico no coinciden. | No | Contratos vigentes de protección de vistas y diagnóstico técnico | Sustituir o reconciliar la protección local conforme a capacidad técnica canónica y servidor. |
| Documentos combina permisos canónicos con fallbacks locales de rol. | No | Contratos vigentes de autorización y documentos | Asegurar que alcance y acciones no dependan exclusivamente del fallback local. |
| Novedades administra audiencia desde una pantalla también consumida por trabajadores. | No | `ANIMA-UX-003` y `ANIMA-UX-017` | Separar experiencia y cerrar ciclo completo de audiencia y publicación. |
| Administración de equipo requiere una simplificación específica posterior. | No | `ANIMA-UX-014` | Diseñar la administración de equipo autorizada objetivo. |

Ningún hallazgo requiere inventar una nueva tarea.

---

#### 31. Requisitos de prueba derivados

**NO GENERA REQUISITOS DE PRUEBA.**

Requisitos creados: **0**
Requisitos modificados: **0**
Requisitos diferidos: **0**
Requisitos descartados: **0**
Requisitos obsoletos: **0**

La razón es que el registro vigente ya protege el universo móvil, la navegación autenticada, las pantallas mixtas, las acciones administrativas relevantes, los accesos directos, los documentos, las novedades, soporte y diagnóstico técnico. Esta tarea aporta clasificación y trazabilidad UX, no una obligación de prueba nueva.

---

#### 32. Cobertura de prueba vigente reutilizada

La tarea reutiliza, sin modificarlos:

- `TREQ-ANIMA-005`;
- `TREQ-ANIMA-006`;
- `TREQ-ANIMA-007`;
- `TREQ-ANIMA-008`;
- `TREQ-ANIMA-009`;
- `TREQ-ANIMA-013`;
- `TREQ-ANIMA-016`;
- `TREQ-ANIMA-018`;
- `TREQ-ANIMA-020`;
- `TREQ-ANIMA-021`;
- `TREQ-ANIMA-022`;
- `TREQ-ANIMA-024`.

Esta enumeración es trazabilidad hacia cobertura existente y no una actualización del registro.

---

#### 33. Evidencia de validación

| Clase | Estado | Evidencia |
| --- | --- | --- |
| BUILD | NOT_EXECUTED | No se ejecutó build del repositorio ni de la aplicación durante el desarrollo documental. |
| LOCAL | PASS | El artefacto fue comprobado estructuralmente: metadata, secciones obligatorias, clasificación de catorce identidades, continuidad, ausencia de placeholders y cero requisitos derivados. |
| REMOTA | PASS | Se verificaron en GitHub la continuidad vigente, el archivo propietario, el commit actual de `vento-anima`, el layout autenticado, las ocho pantallas administrativas o técnicas y el registro de requisitos aplicable. |
| OPERATIVA | PASS | La matriz clasifica las catorce identidades exactamente una vez: dos administrativas puras, cinco mixtas, una técnica y seis no administrativas. |
| FÍSICA | NOT_EXECUTED | La topología es `DEFINE_ONCE` con `NO_PHYSICAL_INSTANCE`; no se modificó código, Supabase, navegación, datos ni despliegues. |

---

#### 34. Criterios de aceptación

1. El universo base conserva exactamente `14` identidades de pantalla.
2. El inventario administrativo contiene exactamente `8` identidades únicas.
3. Las `8` identidades pertenecen al universo móvil canónico existente.
4. `2` identidades quedan clasificadas `ADMIN_PURA`.
5. `5` identidades quedan clasificadas `ADMIN_MIXTA`.
6. `1` identidad queda clasificada `ADMIN_TECNICA`.
7. `6` identidades quedan clasificadas `NO_ADMIN`.
8. La suma de las cuatro categorías reconcilia `14` sin faltantes ni duplicados.
9. Se preserva la clasificación personal aprobada de ANIMA-UX-001.
10. Los modales, filtros y componentes internos no inflan el conteo de pantallas.
11. Se registra la duplicidad de entrada hacia `OperativoReportScreen`.
12. Se registra la divergencia de mecanismo entre navegación y pantalla de `team`.
13. Se registra la diferencia entre las allowlists de entrada y pantalla de diagnóstico.
14. Ninguna condición local se trata como concesión canónica de autoridad.
15. La tarea no crea ni modifica requisitos de prueba.
16. La topología permanece `DEFINE_ONCE` sin instancia física.
17. La continuidad queda reservada exclusivamente hacia ANIMA-UX-003.

---

#### 35. Límites y estado de salida

ANIMA-UX-002 no:

- modifica código de `vento-anima`;
- modifica Supabase;
- cambia Expo Router;
- agrega, mueve o retira pestañas;
- modifica roles, capabilities, permisos, RLS o RPC;
- corrige las allowlists observadas;
- elimina la duplicidad de `OperativoReportScreen`;
- separa trabajador y administrador;
- rediseña Home, Turnos, Documentos, Novedades, Equipo o Soporte;
- redefine el ciclo completo de novedades;
- simplifica todavía la administración de equipo;
- ejecuta pruebas con usuarios;
- crea una instancia física;
- modifica el registro de requisitos de prueba.

La salida documental queda compuesta por:

- universo reconciliado de `14` pantallas;
- subconjunto administrativo o técnico de `8`;
- distribución `2 ADMIN_PURA + 5 ADMIN_MIXTA + 1 ADMIN_TECNICA`;
- exclusión explícita de `6` pantallas;
- matriz de acciones;
- matriz de evidencia de acceso;
- hallazgos con propietario y condición de salida;
- handoff cerrado hacia la separación trabajador/administrador.

---

#### 36. Continuidad

**ÚLTIMA TAREA APROBADA**
`ANIMA-UX-001 — Inventariar pantallas personales`

**TAREA ACTUAL APROBADA**
`ANIMA-UX-002 — Inventariar pantallas administrativas`

**SIGUIENTE TAREA RESERVADA**
`ANIMA-UX-003 — Separar experiencia del trabajador y del administrador`


### [ ] ANIMA-UX-003 — Separar experiencia del trabajador y del administrador
### [ ] ANIMA-UX-004 — Diseñar inicio con turno actual y siguiente turno
### [ ] ANIMA-UX-005 — Mostrar sede, área, horario y rol operativo del turno
### [ ] ANIMA-UX-006 — Simplificar el flujo de check-in
### [ ] ANIMA-UX-007 — Simplificar el flujo de check-out
### [ ] ANIMA-UX-008 — Mostrar claramente marcación confirmada o pendiente
### [ ] ANIMA-UX-009 — Explicar por qué no se puede marcar
### [ ] ANIMA-UX-010 — Diferenciar error de ubicación, turno y autorización
### [ ] ANIMA-UX-011 — Diseñar manejo comprensible de cola offline
### [ ] ANIMA-UX-012 — Permitir reanudar una marcación interrumpida
### [ ] ANIMA-UX-013 — Simplificar documentos y datos personales
### [ ] ANIMA-UX-014 — Simplificar administración de equipo autorizada
### [ ] ANIMA-UX-015 — Probar check-in y check-out con trabajadores reales
### [ ] ANIMA-UX-016 — Auditar y completar recordatorios operativos de inicio y cierre de turno
### [ ] ANIMA-UX-017 — Diseñar ciclo completo de novedades internas: audiencia, publicación, edición, archivo, notificación y visibilidad
