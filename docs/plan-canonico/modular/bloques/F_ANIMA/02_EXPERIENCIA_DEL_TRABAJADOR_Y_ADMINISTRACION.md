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


### ✅ ANIMA-UX-003 — Separar experiencia del trabajador y del administrador

**Estado:** APROBADA
**Tarea anterior:** ANIMA-UX-002 — Inventariar pantallas administrativas
**Tarea siguiente:** ANIMA-UX-004 — Diseñar inicio con turno actual y siguiente turno
**Tipo de tarea:** documental; diseño UX TO-BE de la separación entre experiencia personal y operativa del trabajador, supervisión y administración autorizadas, y diagnóstico técnico de ANIMA, sin materialización física
**Bloque:** F_ANIMA — EXPERIENCIA DEL TRABAJADOR Y ADMINISTRACION
**Repositorio propietario:** vento-group-sas/vento-shell
**Archivo propietario:** docs/plan-canonico/modular/bloques/F_ANIMA/02_EXPERIENCIA_DEL_TRABAJADOR_Y_ADMINISTRACION.md
**Estado físico resultante:** ESPECIFICADO_NO_MATERIALIZADO
**Cambios físicos autorizados:** ninguno durante esta tarea
**Requisitos de prueba creados o modificados:** 0

---

#### 1. Propósito

Definir la separación objetivo entre la experiencia cotidiana del trabajador y las capacidades administrativas observadas en ANIMA, consumiendo los inventarios AS-IS cerrados por `ANIMA-UX-001` y `ANIMA-UX-002` y el contrato transversal de separación de carriles aprobado en E2.

La separación debe conseguir simultáneamente que:

- el trabajador use ANIMA para su turno, asistencia, información, documentos, comunicaciones, soporte y cuenta sin que la administración compita con su tarea ordinaria;
- una persona con responsabilidades gerenciales conserve capacidades autorizadas sin convertir la experiencia personal en backoffice;
- la supervisión móvil ligera permanezca posible donde sea útil para la operación inmediata;
- la administración densa, masiva o de configuración se entregue a la aplicación o backoffice propietario cuando corresponda;
- una misma identidad humana pueda pasar explícitamente entre carriles sin heredar filtros, territorio o autoridad incorrectos;
- diagnóstico técnico permanezca separado tanto de la experiencia personal como de la administración laboral;
- ninguna separación visual sustituya autorización efectiva ni protección de servidor.

Esta tarea define el contrato UX objetivo. No modifica rutas, código, permisos, datos, Supabase ni el catálogo físico de pantallas.

---

#### 2. Entradas canónicas consumidas

La tarea consume y preserva:

- `ANIMA-UX-001`, que cerró un subconjunto personal de ocho pantallas: tres personales puras y cinco mixtas;
- `ANIMA-UX-002`, que cerró un subconjunto administrativo o técnico de ocho pantallas: dos administrativas puras, cinco mixtas y una técnica;
- el universo estable `ANIMA-SCREEN-001` a `ANIMA-SCREEN-014`;
- el principio transversal `UX-BASE-001`, según el cual la clasificación pertenece a la acción y a la superficie, no al nombre de la aplicación ni del rol;
- el modelo transversal de experiencia administrativa `UX-ADMIN-*`;
- los contratos de autorización, contexto y protección de servidor ya aprobados;
- la propiedad funcional por aplicación, especialmente las fronteras entre ANIMA, VISO, TALENTO, SHELL y el servicio documental;
- el estado actual de `vento-anima` usado por los dos inventarios precedentes.

La tarea no reabre la exactitud del inventario AS-IS. Lo transforma en una decisión de responsabilidad UX TO-BE.

---

#### 3. Regla rectora de separación

ANIMA no se divide por tipo de persona sino por intención de la acción.

```text
MIS DATOS + MI TURNO + MI ASISTENCIA + MI CASO
→ EXPERIENCIA DEL TRABAJADOR

OBSERVAR OPERACIÓN VIGENTE Y COORDINAR DENTRO DEL ALCANCE AUTORIZADO
→ SUPERVISIÓN LIGERA

PLANIFICAR + GESTIONAR TERCEROS + PUBLICAR + CORREGIR + CONFIGURAR
→ EXPERIENCIA ADMINISTRATIVA

DIAGNOSTICAR SISTEMA, DATOS O INTEGRACIONES
→ EXPERIENCIA TÉCNICA

ARRANQUE + SESIÓN + AUTENTICACIÓN
→ ACCESO TRANSVERSAL
```

Una persona gerente puede usar la experiencia del trabajador sin que su jerarquía transforme Home, Turnos, Documentos, Novedades o Soporte en pantallas administrativas.

La administración se activa por intención y autorización explícitas, no por la mera existencia de un rol gerencial en la sesión.

---

#### 4. La separación no crea cuentas ni identidades paralelas

La misma identidad empresarial y la misma sesión autenticada pueden participar en varios carriles.

La separación no autoriza:

- crear un usuario personal y otro administrativo para la misma persona;
- mantener perfiles duplicados del trabajador;
- copiar datos entre una versión personal y una versión administrativa de ANIMA;
- convertir el rol base en un modo permanente de interfaz;
- usar un correo, allowlist local o nombre de rol como selector de carril autoritativo.

Cada cambio de carril vuelve a resolver contexto y permisos aplicables.

---

#### 5. Etiquetas documentales de esta tarea

Para expresar la decisión sin crear nuevos enums de producto se utilizan estas etiquetas locales:

| Etiqueta | Significado documental |
| --- | --- |
| `TRABAJADOR` | experiencia personal u operativa ligera centrada en el propio actor |
| `SUPERVISION_ANIMA` | observación o coordinación móvil acotada de operación vigente |
| `ADMIN_ANIMA` | administración propia de ANIMA que debe vivir fuera de la navegación personal |
| `HANDOFF_ADMIN` | administración que debe resolverse en la aplicación o backoffice propietario |
| `TECNICA` | diagnóstico, auditoría técnica o soporte especializado |
| `ACCESO` | bootstrap, login y continuidad de sesión |

Estas etiquetas sirven únicamente a `ANIMA-UX-003`. No sustituyen la taxonomía transversal ni crean valores de base de datos.

---

#### 6. Cierre cuantitativo de las catorce pantallas

Cada identidad móvil recibe exactamente un carril primario objetivo:

| Carril primario | Cantidad |
| --- | ---: |
| `TRABAJADOR` | **8** |
| `SUPERVISION_ANIMA` / `ADMIN_ANIMA` | **2** |
| `TECNICA` | **1** |
| `ACCESO` | **3** |
| **TOTAL** | **14** |

La suma `8 + 2 + 1 + 3 = 14` conserva el universo sin duplicar identidades.

Las cinco pantallas actualmente mixtas dejan de ser mixtas como intención primaria: conservan su núcleo personal y expulsan la capacidad administrativa hacia una superficie administrativa, de supervisión o un handoff propietario.

---

#### 7. Matriz objetivo de las catorce identidades

| ID | Patrón AS-IS | Carril primario objetivo | Decisión TO-BE |
| --- | --- | --- | --- |
| `ANIMA-SCREEN-001` | `/` | `ACCESO` | Mantener como puente técnico de entrada; no incorporar funciones laborales ni administrativas. |
| `ANIMA-SCREEN-002` | `/splash` | `ACCESO` | Mantener bootstrap y decisión de sesión; no decidir carril por nombre de rol. |
| `ANIMA-SCREEN-003` | `/login` | `ACCESO` | Mantener autenticación; no ofrecer elección de privilegio ni perfil administrativo paralelo. |
| `ANIMA-SCREEN-004` | `/home` | `TRABAJADOR` | Convertir Home en inicio personal/operativo del trabajador; retirar de su flujo ordinario reportes o controles sobre terceros. |
| `ANIMA-SCREEN-005` | `/shifts` | `TRABAJADOR` | Conservar turno actual, siguiente turno, semana y lectura personal; separar planner y mutaciones administrativas de equipo. |
| `ANIMA-SCREEN-006` | `/history` | `TRABAJADOR` | Mantener historial e incidencias del propio actor. |
| `ANIMA-SCREEN-007` | `/documents` | `TRABAJADOR` | Mantener “mis documentos” y alertas personales; sacar carga, filtrado de terceros y administración documental del flujo personal. |
| `ANIMA-SCREEN-008` | `/carnet` | `TRABAJADOR` | Mantener identificación laboral y elegibilidad del propio trabajador. |
| `ANIMA-SCREEN-009` | `/announcements` | `TRABAJADOR` | Mantener lectura personal de novedades; separar creación, edición, eliminación y audiencia. |
| `ANIMA-SCREEN-010` | `/operativo` | `SUPERVISION_ANIMA` | Reservar para supervisión móvil acotada; separar analítica densa, histórico amplio y backoffice cuando excedan esa finalidad. |
| `ANIMA-SCREEN-011` | `/team` | `ADMIN_ANIMA` | Mantener fuera de la navegación personal; limitarse a administración de equipo autorizada dentro de las fronteras de ANIMA. |
| `ANIMA-SCREEN-012` | `/support` | `TRABAJADOR` | Mantener tickets, mensajes y ayuda propios; separar contacto administrativo dirigido a trabajadores. |
| `ANIMA-SCREEN-013` | `/account-settings` | `TRABAJADOR` | Mantener permisos del dispositivo, privacidad, cuenta y cierre de sesión del propio actor; diagnóstico será un handoff técnico. |
| `ANIMA-SCREEN-014` | `/anima-diagnostics` | `TECNICA` | Mantener aislada de navegación personal y administrativa ordinaria y protegida por capacidad técnica efectiva y servidor. |

Esta matriz asigna intención primaria. No renombra rutas ni autoriza una migración física durante esta tarea.

---

#### 8. Experiencia objetivo del trabajador

El carril del trabajador es el estado ordinario de ANIMA.

Debe presentar únicamente acciones sobre:

- turno y jornada propios;
- check-in, check-out y estados relacionados;
- sede, área, horario y rol operativo aplicables al propio turno;
- historial e incidencias propias;
- documentos propios;
- carné propio;
- novedades visibles para el actor;
- tickets, mensajes y ayuda propios;
- permisos del dispositivo, privacidad y cuenta propia.

Una persona con capacidades administrativas ve el mismo núcleo personal cuando está en este carril. La administración no aparece mezclada dentro de cada pantalla por el solo hecho de que el actor sea gerente o propietario.

---

#### 9. Inicio objetivo de ANIMA

Después de una sesión válida, ANIMA no debe elegir automáticamente una experiencia administrativa porque el rol base sea gerencial.

El inicio normal conduce al carril del trabajador y su contexto actual.

La entrada administrativa, cuando exista autoridad aplicable, debe ser una acción explícita fuera de la acción principal de Home.

Esto deja a `ANIMA-UX-004` una Home limpia para diseñar turno actual y siguiente turno, sin que reportes, filtros de equipo o configuración compitan con ese objetivo.

---

#### 10. Experiencia administrativa y de supervisión

ANIMA puede conservar administración o supervisión móvil cuando la capacidad:

- pertenece funcionalmente a ANIMA o requiere contexto inmediato de su dominio;
- es razonable para uso móvil;
- no necesita una tabla, planner o edición masiva de alta densidad;
- no replica un backoffice ya asignado a otra aplicación;
- puede expresarse con alcance, actor y autoridad inequívocos.

Cuando estas condiciones no se cumplen, ANIMA debe realizar un `HANDOFF_ADMIN` y no construir una segunda fuente de verdad.

---

#### 11. ANIMA no será un planner administrativo denso

El contrato transversal permite a ANIMA experiencia personal, operación móvil ligera y supervisión puntual para managers, pero no un planner administrativo denso.

Por tanto:

- la planificación semanal o masiva de turnos no debe permanecer incrustada en la pantalla personal de turnos;
- reportes históricos densos, segmentación amplia y exportaciones no deben convertir Home en backoffice;
- configuraciones de acceso, roles y permisos no deben resolverse como edición casual dentro de la navegación personal;
- administración de documentos de terceros no debe competir visualmente con “mis documentos”.

La densidad administrativa que exceda el alcance móvil de ANIMA se entrega al backoffice propietario.

---

#### 12. Navegación personal y administrativa son distintas

La separación no se considera cumplida si se mantiene una única barra de navegación y se ocultan botones según rol.

El resultado físico futuro deberá ofrecer uno de los mecanismos admitidos por el contrato transversal:

- un shell o contenedor de navegación administrativo claramente separado;
- una superficie administrativa inequívoca fuera del flujo personal;
- un workflow independiente;
- un handoff hacia la aplicación propietaria.

La selección concreta de rutas físicas pertenece a la materialización posterior. Ningún cambio de cardinalidad o catálogo de pantallas podrá hacerse silenciosamente.

---

#### 13. Entrada al carril administrativo

La entrada administrativa requiere simultáneamente:

1. intención explícita del usuario;
2. sesión válida;
3. contexto de acceso actualizado;
4. al menos una capacidad administrativa o de supervisión aplicable;
5. territorio resoluble para la acción solicitada;
6. protección de servidor para toda mutación o lectura sensible.

Si no existe capacidad administrativa efectiva, la entrada no debe presentarse como opción útil y el acceso directo debe fallar cerrado.

La existencia de `propietario`, `gerente_general` o `gerente` como string local no es suficiente para cumplir esta regla.

---

#### 14. Cambio explícito de carril

El cambio entre trabajador y administración debe hacer visible que cambió el propósito de la interfaz.

Al entrar a administración se debe:

- resolver de nuevo la autorización;
- determinar el territorio de gestión;
- iniciar filtros administrativos sin convertirlos en contexto operativo;
- conservar de forma segura el estado personal que pueda reanudarse;
- impedir que una mutación personal en curso sea abandonada de forma ambigua.

Al volver al trabajador se debe:

- descartar o aislar selecciones administrativas no aplicables;
- resolver de nuevo turno, sede, área y rol operativo activos;
- restaurar la experiencia personal sin heredar población, empleado o sede seleccionados en administración;
- conservar correctamente estados offline o pendientes del propio actor.

---

#### 15. Aislamiento de contexto

La separación exige distinguir conceptualmente:

```text
SEDE DEL TURNO / CHECK-IN
≠
SEDE ELEGIDA PARA FILTRAR O ADMINISTRAR
```

Del mismo modo:

```text
ROL OPERATIVO ACTIVO
≠
ROL BASE USADO PARA AUTORIZACIÓN ADMINISTRATIVA

TRABAJADOR SELECCIONADO EN UN FILTRO
≠
ACTOR EFECTIVO
```

Un mecanismo cliente que hoy reutilice una selección de sede para ambos fines no podrá tratar esa coincidencia como contrato objetivo.

La materialización deberá separar o tipar los estados de contexto para impedir contaminación entre carriles.

---

#### 16. Regla de autorización

La separación UX nunca concede autoridad.

Para cualquier capacidad administrativa:

```text
VISIBILIDAD DEL CARRIL
+
CAPACIDAD PROYECTADA EN CLIENTE
≠
AUTORIZACIÓN SUFICIENTE
```

Toda lectura sensible o mutación debe converger con la decisión efectiva de autorización y la protección de servidor correspondiente.

Ocultar una pestaña, cambiar de shell o retirar un botón de la experiencia personal no reemplaza RLS, RPC, Edge Function, validación de servidor ni otros controles propietarios.

---

#### 17. Separación de Home

`ANIMA-SCREEN-004` queda orientada al trabajador.

Debe conservar:

- situación de asistencia propia;
- acción de marcación propia;
- estado de geocerca;
- estado de conectividad y sincronización;
- turno y contexto propios;
- resumen personal pertinente.

Debe salir del flujo ordinario de Home:

- reporte sobre población de trabajadores;
- filtro de trabajadores o sedes para análisis administrativo;
- exportación administrativa;
- cualquier control cuya finalidad principal sea observar terceros.

Si una métrica se refiere únicamente al propio trabajador puede seguir siendo personal aunque el AS-IS la muestre hoy solo a ciertos roles. La clasificación depende del sujeto y efecto, no del rol que actualmente la visualiza.

---

#### 18. Destino de `OperativoReportScreen`

La capacidad actual de `OperativoReportScreen` debe descomponerse conceptualmente en dos finalidades:

1. **supervisión móvil ligera:** resumen inmediato y acotado de operación vigente, elegible para `SUPERVISION_ANIMA`;
2. **analítica o backoffice denso:** rangos amplios, filtros extensos, comparación histórica, exportación o explotación administrativa, que debe usar `HANDOFF_ADMIN` hacia el backoffice propietario.

La reutilización actual del mismo componente dentro de Home y `/operativo` no forma parte del objetivo final.

El carril del trabajador no renderiza la variante de supervisión.

---

#### 19. Separación de Turnos

`ANIMA-SCREEN-005` conserva como experiencia del trabajador:

- turno actual o siguiente;
- semana propia;
- próximos turnos;
- turnos recientes;
- información necesaria para comprender dónde, cuándo y bajo qué rol operativo trabaja el actor.

Salen de la navegación personal:

- crear turnos;
- editar turnos;
- confirmar o cancelar programación de terceros;
- planner de sede;
- agrupación gerencial usada para administrar programación.

El contrato administrativo transversal asigna a VISO la gestión de plantillas, creación, revisión, publicación, asignación, reemplazos, rotaciones, ausencias y cobertura de programación. ANIMA puede enlazar a ese trabajo, pero no mantener un planner paralelo.

La corrección de asistencia puede involucrar ANIMA y VISO conforme a su contrato propio, sin reintroducirla como acción ordinaria del trabajador sobre terceros.

---

#### 20. Separación de Documentos

`ANIMA-SCREEN-007` queda centrada en el propio trabajador.

Debe conservar:

- documentos visibles para el actor;
- apertura de sus documentos autorizados;
- alertas o vigencias pertinentes a su relación;
- solicitudes personales que el dominio permita.

Deben separarse del flujo personal:

- filtro por otros trabajadores;
- selección administrativa de población;
- carga para terceros;
- alcance de sede o global;
- eliminación o disposición administrativa;
- mantenimiento de tipos, plantillas, retención o clasificación.

La administración documental seguirá el servicio y la aplicación propietaria definidos por los contratos de información. ANIMA no crea una copia administrativa del expediente.

---

#### 21. Separación de Novedades

`ANIMA-SCREEN-009` conserva como experiencia del trabajador:

- lectura de novedades aplicables;
- estado visible de publicación cuando corresponda;
- interacción personal permitida por el ciclo de comunicación.

La creación, edición, eliminación, selección de audiencia, publicación, archivo y notificación pertenecen a una experiencia administrativa separada.

La separación física exacta y el ciclo completo se cierran en `ANIMA-UX-017`.

Hasta entonces, `ANIMA-UX-003` fija una frontera: los controles editoriales no deben competir con la lectura ordinaria del trabajador.

---

#### 22. Destino de `/operativo`

`ANIMA-SCREEN-010` se conserva como identidad de supervisión, no como extensión del Home personal.

Su finalidad objetivo es responder preguntas operativas inmediatas y acotadas, por ejemplo:

- qué está ocurriendo ahora;
- qué cobertura o incidencia requiere atención;
- qué equipo o sede autorizada necesita seguimiento inmediato.

No debe evolucionar en ANIMA hacia un backoffice universal de históricos, configuración, conciliación o analítica corporativa.

Una necesidad de mayor densidad debe abrir el handoff al backoffice correspondiente.

---

#### 23. Destino de `/team`

`ANIMA-SCREEN-011` permanece administrativa y fuera de la navegación personal.

Puede concentrar administración de equipo que sea propia de ANIMA y esté autorizada, pero no adquiere propiedad universal sobre:

- catálogo de roles;
- permisos;
- denegaciones;
- matrices de autorización;
- configuración de dispositivos;
- políticas de acceso.

Esas responsabilidades conservan sus propietarios VISO/SHELL según los contratos transversales.

`ANIMA-UX-014` recibirá esta frontera para simplificar la administración de equipo autorizada sin volver a mezclarla con la experiencia del trabajador.

---

#### 24. Separación de Soporte

`ANIMA-SCREEN-012` conserva en el carril del trabajador:

- crear y seguir tickets propios;
- leer y responder conversaciones propias;
- consultar ayuda y FAQ aplicables;
- ver estados y no leídos propios.

La capacidad de seleccionar a otro trabajador y enviarle un aviso o iniciar una conversación se separa hacia administración o supervisión autorizada.

El alcance territorial del gerente no se obtiene de la navegación; debe resolverse mediante autorización efectiva.

---

#### 25. `account-settings` y diagnóstico

`ANIMA-SCREEN-013` continúa siendo personal.

El acceso a `ANIMA-SCREEN-014` es un handoff técnico y no convierte Configuración en backoffice.

La experiencia técnica:

- no forma parte de la navegación ordinaria del trabajador;
- no forma parte del menú administrativo laboral por defecto;
- requiere capacidad técnica canónica;
- requiere protección de servidor;
- no se autoriza por correo hardcodeado;
- no hereda automáticamente el territorio administrativo previamente seleccionado.

La diferencia AS-IS entre allowlists locales deja de ser una decisión UX válida en el objetivo.

---

#### 26. Matriz de extracción de las cinco pantallas mixtas

| Pantalla | Núcleo que permanece en `TRABAJADOR` | Capacidad extraída | Destino objetivo |
| --- | --- | --- | --- |
| `/home` | jornada, marcación, turno, contexto y estado propio | reportes o métricas sobre terceros | `/operativo` para supervisión ligera; `HANDOFF_ADMIN` para analítica densa |
| `/shifts` | programación propia | crear, editar, publicar, confirmar/cancelar y gestionar programación de equipo | `HANDOFF_ADMIN` hacia VISO; supervisión puntual separada cuando aplique |
| `/documents` | documentos y alertas propios | carga, filtro de terceros, alcance sede/global, eliminación administrativa | experiencia documental administrativa propietaria, fuera del flujo personal |
| `/announcements` | lectura personal | creación, edición, eliminación, audiencia y publicación | `ADMIN_ANIMA`, cierre detallado en `ANIMA-UX-017` |
| `/support` | tickets, mensajes y ayuda propios | contacto dirigido a trabajadores | administración/supervisión separada de ANIMA |

La extracción elimina la competencia de intenciones sin crear duplicados de datos.

---

#### 27. Matriz de propiedad administrativa

| Capacidad | Propiedad UX objetivo |
| --- | --- |
| Programar y publicar turnos de equipo | VISO como backoffice de programación; ANIMA consume la programación publicada. |
| Corregir asistencia de terceros | flujo administrativo autorizado con frontera ANIMA/VISO según contrato; nunca acción personal ordinaria. |
| Administrar equipo dentro de ANIMA | superficie administrativa separada; alcance definitivo simplificado por `ANIMA-UX-014`. |
| Gestionar roles, permisos, denegaciones y políticas de acceso | VISO/SHELL según contratos de autorización; no propiedad de la pantalla Team. |
| Leer documentos propios | ANIMA trabajador. |
| Administrar expedientes, retención, clasificación o documentos de terceros | servicio/aplicación documental propietaria conforme a contratos INFO; no backoffice duplicado en la vista personal. |
| Leer novedades | ANIMA trabajador. |
| Gestionar ciclo editorial de novedades | ANIMA administración, detallado por `ANIMA-UX-017`. |
| Tickets y ayuda propios | ANIMA trabajador. |
| Contacto dirigido a trabajadores | ANIMA administración/supervisión con territorio autorizado. |
| Supervisión inmediata de asistencia | ANIMA supervisión ligera. |
| Analítica histórica densa y exportaciones amplias | backoffice analítico propietario mediante handoff. |
| Diagnóstico técnico | carril técnico protegido, separado de trabajador y administración laboral. |

La matriz no cambia la fuente de verdad de ningún dominio.

---

#### 28. Regla de handoff hacia otra aplicación

Cuando ANIMA entregue una tarea a VISO, TALENTO, SHELL o un servicio propietario, el handoff debe conservar:

- identidad de la persona;
- objeto o referencia de negocio relevante;
- intención solicitada;
- origen ANIMA;
- destino explícito;
- contexto mínimo seguro;
- autorización revalidada en destino;
- correlación suficiente para retorno o trazabilidad.

No debe transferir como autoridad:

- sede elegida en un filtro;
- check-in vigente como permiso administrativo;
- rol operativo como rol de administración;
- población seleccionada previamente;
- datos sensibles innecesarios;
- permisos calculados únicamente en cliente.

El destino lee o muta su fuente de verdad; ANIMA no mantiene una copia competidora.

---

#### 29. Estado al cambiar de carril

| Estado | Trabajador → administración | Administración → trabajador |
| --- | --- | --- |
| Sesión | conservar si sigue válida; revalidar autorización | conservar si sigue válida; revalidar contexto personal |
| Marcación en curso | no abandonar silenciosamente | reanudar o reflejar resultado real |
| Cola offline propia | conservar y aislar de administración | restaurar estado y sincronización correspondientes |
| Sede operativa | no convertirla en filtro administrativo obligatorio | resolver desde turno/contexto, no desde filtro previo |
| Filtro de sede | iniciar como alcance administrativo independiente | limpiar o ignorar para operación |
| Trabajador seleccionado | usar solo como sujeto administrativo autorizado | nunca convertirlo en actor efectivo |
| Formularios/borradores | guardar, cancelar o bloquear salida según contrato | no contaminar pantallas personales |
| Acción sensible pendiente | exigir decisión explícita antes de cambiar | no ejecutarla desde el carril personal |

---

#### 30. Deep links y notificaciones

Un deep link no puede elegir un carril únicamente por la ruta que abre.

Antes de mostrar el destino se debe resolver:

- sesión;
- intención del destino;
- actor;
- contexto;
- autorización;
- territorio cuando aplique.

Los destinos personales como Turnos o Soporte abren su experiencia personal cuando la notificación corresponde al propio actor.

Una futura notificación administrativa deberá entrar al carril administrativo de forma explícita y reautorizada.

Una ruta técnica nunca se habilita porque el actor tenga administración laboral.

---

#### 31. Privacidad y minimización

La separación debe reducir datos de terceros en la experiencia ordinaria.

En el carril del trabajador:

- no se precargan listados de empleados por tener rol gerencial;
- no se muestran filtros globales de población;
- no se cargan documentos ajenos;
- no se exponen conversaciones de terceros;
- no se cargan datos de diagnóstico.

En administración o supervisión solo se carga el universo necesario para la capacidad y territorio autorizados.

La separación visual complementa, pero no reemplaza, controles de servidor y políticas de datos.

---

#### 32. Conservación de identidad de pantalla durante la transición

Esta tarea no altera `ANIMA-SCREEN-001` a `ANIMA-SCREEN-014` ni la cardinalidad física actual.

La separación se especifica primero a nivel de intención, superficie y handoff.

Si la materialización posterior necesita:

- crear una ruta;
- retirar una ruta;
- mover una pestaña;
- crear un shell administrativo;
- cambiar un patrón visible;

el propietario físico deberá producir el delta correspondiente contra el catálogo de pantallas y sus requisitos antes de ejecutar el cambio.

No se permite cambiar el catálogo de forma implícita usando esta tarea como sustituto del lifecycle de pantallas.

---

#### 33. Handoff hacia las tareas siguientes del minibloque

La separación entrega fronteras específicas:

| Tarea posterior | Entrada recibida desde ANIMA-UX-003 |
| --- | --- |
| `ANIMA-UX-004` | Home queda exclusivamente orientada al trabajador, libre de reportes de terceros como acción ordinaria. |
| `ANIMA-UX-005` | el contexto visible de sede, área, horario y rol corresponde al turno del trabajador, no a filtros administrativos. |
| `ANIMA-UX-006` y `ANIMA-UX-007` | check-in y check-out se diseñan dentro del carril personal/operativo. |
| `ANIMA-UX-008` a `ANIMA-UX-012` | estados, errores, offline y reanudación permanecen asociados al actor personal y no se contaminan con administración. |
| `ANIMA-UX-013` | documentos y datos personales parten de una vista propia sin administración de terceros mezclada. |
| `ANIMA-UX-014` | Team se recibe como superficie administrativa separada con ownership de acceso limitado por VISO/SHELL. |
| `ANIMA-UX-015` | las pruebas con trabajadores evalúan el carril personal sin controles administrativos mezclados. |
| `ANIMA-UX-016` | recordatorios operativos se dirigen al actor y turno propios. |
| `ANIMA-UX-017` | lectura de novedades y ciclo editorial llegan ya separados como experiencias distintas. |

---

#### 34. Hallazgos y carryover

| Hallazgo | Bloquea ANIMA-UX-003 | Propietario | Condición de salida |
| --- | --- | --- | --- |
| Home reutiliza hoy el mismo reporte operativo que `/operativo`. | No | materialización física de ANIMA | retirar el reporte administrativo del flujo personal y conservar o rediseñar la supervisión separada. |
| Turnos contiene planner y mutaciones de equipo dentro de la pantalla personal. | No | VISO y materialización física de ANIMA | Home/Turnos personales consumen programación publicada y el planner administrativo se resuelve en su backoffice propietario. |
| Documentos mezcla “mis documentos” con administración de terceros. | No | contratos INFO y materialización propietaria | separar la vista personal de la administración documental sin duplicar fuente de verdad. |
| Novedades mezcla lector y editor. | No | `ANIMA-UX-017` | diseñar el ciclo editorial separado y preservar lectura personal. |
| Team contiene acciones que cruzan administración de equipo y configuración de acceso. | No | `ANIMA-UX-014` y propietarios VISO/SHELL | simplificar Team y derivar a los propietarios de acceso las mutaciones que no pertenecen a ANIMA. |
| Soporte mezcla tickets propios con contacto gerencial. | No | materialización física de ANIMA | separar contacto dirigido del flujo de soporte personal. |
| Diagnóstico se alcanza mediante protección local divergente. | No | contratos técnicos y de autorización vigentes | usar capacidad técnica canónica y protección de servidor, sin allowlist como autoridad. |

Ningún hallazgo requiere crear una tarea nueva.

---

#### 35. Requisitos de prueba derivados

**NO GENERA REQUISITOS DE PRUEBA.**

Requisitos creados: **0**
Requisitos modificados: **0**
Requisitos diferidos: **0**
Requisitos descartados: **0**
Requisitos obsoletos: **0**

La separación ya está protegida transversalmente por requisitos de experiencia que prohíben contaminar operación con administración, exigen clasificar la intención primaria y obligan a separar o crear handoff cuando compiten intenciones materiales. Los requisitos ANIMA vigentes ya protegen navegación, Turnos, Documentos, Novedades, Operativo, Team, Soporte, Configuración y Diagnóstico. Esta tarea aplica esas reglas al inventario ANIMA y no introduce una obligación de prueba distinta.

---

#### 36. Cobertura de prueba vigente reutilizada

Se reutilizan sin modificación, entre otros:

- `TREQ-UX-003`;
- `TREQ-UX-008`;
- `TREQ-UX-009`;
- `TREQ-UX-010`;
- `TREQ-UX-011`;
- `TREQ-ANIMA-005`;
- `TREQ-ANIMA-006`;
- `TREQ-ANIMA-007`;
- `TREQ-ANIMA-009`;
- `TREQ-ANIMA-013`;
- `TREQ-ANIMA-015`;
- `TREQ-ANIMA-016`;
- `TREQ-ANIMA-018`;
- `TREQ-ANIMA-020`;
- `TREQ-ANIMA-021`;
- `TREQ-ANIMA-022`;
- `TREQ-ANIMA-023`;
- `TREQ-ANIMA-024`.

La lista es trazabilidad hacia cobertura existente y no una actualización del registro 04A.

---

#### 37. Evidencia de validación

| Clase | Estado | Evidencia |
| --- | --- | --- |
| BUILD | NOT_APPLICABLE | La tarea no modifica código ni artefactos ejecutables y no requiere build de aplicación para definir el contrato UX. |
| LOCAL | PASS | El artefacto fue verificado estructuralmente: metadata, secciones obligatorias, catorce identidades asignadas una vez, matrices de separación, continuidad y ausencia de requisitos derivados. |
| REMOTA | PASS | Se verificaron la continuidad vigente, los inventarios ANIMA-UX-001/002, el contrato transversal UX-BASE-001, el inventario administrativo UX-ADMIN, los fragmentos 04A aplicables y el commit vigente de `vento-anima`. |
| OPERATIVA | NOT_EXECUTED | La separación aún no fue materializada ni probada con trabajadores o administradores reales; esa validación pertenece a la fase de implementación y a `ANIMA-UX-015`. |
| FÍSICA | NOT_APPLICABLE | La topología de ANIMA-UX es `DEFINE_ONCE` con `NO_PHYSICAL_INSTANCE`; no se ejecutan cambios físicos en esta tarea. |

---

#### 38. Criterios de aceptación

1. Las catorce identidades móviles quedan asignadas exactamente una vez a un carril primario objetivo.
2. Ocho identidades quedan centradas en experiencia del trabajador.
3. Tres identidades de acceso permanecen transversales.
4. `/operativo` y `/team` quedan fuera de la navegación personal ordinaria.
5. `/anima-diagnostics` queda técnica y separada de trabajador y administración laboral.
6. Las cinco pantallas AS-IS mixtas dejan de mezclar intenciones materiales en el objetivo.
7. Home queda preparada para `ANIMA-UX-004` sin reportes de terceros compitiendo con turno y marcación.
8. Turnos conserva lectura personal y entrega el planner de equipo al backoffice propietario.
9. Documentos conserva la vista del propio trabajador y separa administración de terceros.
10. Novedades separa lectura y ciclo editorial sin adelantar el diseño detallado de `ANIMA-UX-017`.
11. Soporte separa tickets propios de contacto administrativo dirigido.
12. Team queda administrativo y recibe una frontera explícita frente a roles, permisos y políticas de acceso.
13. El cambio de carril no hereda sede administrativa como sede operativa ni trabajador seleccionado como actor efectivo.
14. Una persona gerente conserva su experiencia personal sin que el rol convierta automáticamente cada pantalla en administración.
15. La entrada administrativa exige intención explícita y autorización efectiva.
16. La separación no crea usuarios, fuentes de verdad ni copias de datos paralelas.
17. La tarea no modifica el catálogo físico de pantallas ni el registro de requisitos de prueba.
18. Ninguna decisión autoriza implementación física.
19. La continuidad queda reservada exclusivamente hacia `ANIMA-UX-004`.

---

#### 39. Límites y estado de salida

ANIMA-UX-003 no:

- modifica código de `vento-anima`;
- modifica Supabase;
- crea o elimina rutas;
- cambia la barra de pestañas actual;
- crea un shell físico administrativo;
- modifica el catálogo `ANIMA-SCREEN-*`;
- cambia roles, permisos, capabilities, RLS, RPC o Edge Functions;
- decide el copy final del selector de carril;
- diseña el planner de VISO;
- diseña el detalle final de administración de equipo reservado a `ANIMA-UX-014`;
- diseña el ciclo editorial completo reservado a `ANIMA-UX-017`;
- ejecuta migración de datos;
- ejecuta pruebas con usuarios reales;
- crea una instancia física;
- modifica el registro de requisitos de prueba.

La salida documental deja:

- catorce identidades con carril primario objetivo;
- ocho pantallas centradas en trabajador;
- dos pantallas administrativas o de supervisión separadas;
- una pantalla técnica aislada;
- tres pantallas de acceso transversales;
- cinco mezclas AS-IS convertidas en decisiones de extracción y handoff;
- aislamiento explícito entre contexto operativo y filtros administrativos;
- frontera de propiedad con VISO, SHELL, TALENTO y servicios propietarios;
- handoff directo hacia el diseño de Home del trabajador.

---

#### 40. Continuidad

**ÚLTIMA TAREA APROBADA**
`ANIMA-UX-002 — Inventariar pantallas administrativas`

**TAREA ACTUAL APROBADA**
`ANIMA-UX-003 — Separar experiencia del trabajador y del administrador`

**SIGUIENTE TAREA RESERVADA**
`ANIMA-UX-004 — Diseñar inicio con turno actual y siguiente turno`


### ✅ ANIMA-UX-004 — Diseñar inicio con turno actual y siguiente turno

**Estado:** APROBADA
**Tarea anterior:** ANIMA-UX-003 — Separar experiencia del trabajador y del administrador
**Tarea siguiente:** ANIMA-UX-005 — Mostrar sede, área, horario y rol operativo del turno
**Tipo de tarea:** documental; diseño UX TO-BE del inicio personal de ANIMA para resolver y priorizar turno actual y siguiente turno, sin redefinir el modelo de programación, la autorización, la marcación ni la sincronización offline
**Bloque:** F_ANIMA — EXPERIENCIA DEL TRABAJADOR Y ADMINISTRACION
**Repositorio propietario:** vento-group-sas/vento-shell
**Archivo propietario:** docs/plan-canonico/modular/bloques/F_ANIMA/02_EXPERIENCIA_DEL_TRABAJADOR_Y_ADMINISTRACION.md
**Estado físico resultante:** ESPECIFICADO_NO_MATERIALIZADO
**Cambios físicos autorizados:** ninguno durante esta tarea
**Requisitos de prueba creados o modificados:** 0

---

#### 1. Propósito

Diseñar la experiencia objetivo del inicio personal de ANIMA para que el trabajador comprenda, al abrir la aplicación, cuál es su situación laboral inmediata sin tener que interpretar reportes, recorrer una agenda completa ni mezclar programación con administración.

El inicio deberá responder en orden a dos preguntas:

1. **¿Tengo un turno vigente ahora?**
2. **¿Cuál es el siguiente turno publicado que debo tener presente?**

El resultado convierte el turno actual en el contexto temporal principal de Home cuando exista y utiliza el siguiente turno como anticipación secundaria. Cuando no exista turno actual, el siguiente turno podrá ocupar el foco informativo principal sin presentarse falsamente como vigente.

Esta tarea diseña selección, jerarquía y estados de presentación. No redefine todavía los detalles visuales de sede, área, horario y rol operativo, ni los flujos de check-in, check-out, confirmación, bloqueo u offline reservados a las tareas posteriores del mini-bloque.

---

#### 2. Handoff recibido de ANIMA-UX-003

ANIMA-UX-003 dejó el inicio personal libre de administración competitiva y fijó estas fronteras:

- `/home` pertenece al carril `TRABAJADOR`;
- el reporte operativo de terceros no compite con el núcleo personal de Home;
- `/shifts` conserva la programación personal del trabajador;
- la planificación densa de equipo pertenece al backoffice propietario y no al inicio personal;
- una persona con funciones gerenciales sigue viendo su propia experiencia laboral cuando utiliza el carril trabajador;
- seleccionar sede o trabajador con fines administrativos no crea contexto operativo;
- la existencia de una pantalla o tarjeta no concede autoridad.

ANIMA-UX-004 consume estas decisiones y no las reabre.

---

#### 3. Principio rector del inicio

El inicio personal se organiza por **inmediatez laboral**, no por cantidad de datos disponibles.

```text
AHORA
turno vigente del trabajador, si existe

DESPUÉS
siguiente turno publicado, si existe

RESTO DE PROGRAMACIÓN
consulta personal completa en /shifts
```

Reglas:

1. Home muestra como máximo un turno actual y un siguiente turno en la capa inicial.
2. La agenda completa permanece en `/shifts`.
3. Un turno futuro no se etiqueta como actual por cercanía horaria.
4. La ausencia de turno actual no se interpreta como error.
5. La ausencia de programación futura no se interpreta como fallo técnico.
6. Un fallo de carga no se representa como “sin turno”.
7. La programación no concede por sí misma permiso para marcar ni demuestra asistencia.
8. Home no sustituye la fuente propietaria de programación ni conserva una copia mutable paralela.

---

#### 4. Unidad documental de resolución

`turno actual` y `siguiente turno` son **proyecciones de presentación** sobre la programación laboral autoritativa del trabajador.

No son:

- nuevas entidades de base de datos;
- estados persistentes adicionales del turno;
- permisos;
- decisiones de autorización;
- estados de asistencia;
- equivalentes a check-in o check-out;
- filtros administrativos;
- inferencias calculadas desde el último turno visto en el dispositivo.

La identidad de cada asignación continúa perteneciendo al modelo de programación propietario.

---

#### 5. Fuente de verdad consumida por Home

Home deberá consumir únicamente la programación que el contrato laboral vigente permita proyectar al trabajador autenticado.

La selección de turno actual y siguiente turno se calculará sobre datos que cumplan simultáneamente:

1. pertenecen al trabajador efectivo de la sesión personal;
2. forman parte de la programación publicada o equivalente autoritativamente visible para ese trabajador;
3. no están cancelados, retirados, supersedidos ni en un estado que el contrato propietario excluya de la programación vigente;
4. contienen la información temporal suficiente para ser ordenados mediante la semántica canónica de scheduling;
5. conservan una identidad estable que permita distinguir una asignación de otra.

La implementación AS-IS puede consultar estructuras concretas como `employee_shifts`, pero esta tarea no convierte esa tabla, sus estados actuales ni la heurística cliente vigente en el contrato definitivo de scheduling.

---

#### 6. Regla de actor

La resolución se realiza exclusivamente para el trabajador autenticado que está usando el carril personal.

```text
ACTOR DEL INICIO
= trabajador efectivo de la sesión personal

NO ES
= trabajador seleccionado en administración
= último trabajador consultado
= miembro de equipo filtrado
= sujeto de un reporte
= usuario técnico del dispositivo
```

Un propietario, gerente general o gerente que abre su Home personal recibe exactamente la misma regla: sus tarjetas de turno corresponden a su propia programación laboral, no a la programación de su equipo.

---

#### 7. Definición de turno actual

Para ANIMA-UX-004, **turno actual** es la asignación publicada del trabajador que la semántica temporal autoritativa de programación clasifica inequívocamente como vigente en el instante de evaluación.

La interfaz no decidirá por sí sola reglas temporales que pertenecen al dominio de scheduling.

Por tanto:

- no se inventa una ventana de anticipación para convertir un turno futuro en actual;
- no se usa únicamente la fecha calendario si el modelo admite jornadas que crucen medianoche;
- no se asume que `end_time` siempre pertenece al mismo día que `start_time`;
- no se convierte el estado de asistencia en sustituto del intervalo programado;
- no se elige arbitrariamente una asignación cuando dos candidatas compiten y el modelo propietario no declara precedencia.

---

#### 8. Definición de siguiente turno

**Siguiente turno** es la primera asignación futura publicada y elegible del trabajador después del instante actual, distinta del turno vigente que pudiera estar ocupando el foco.

La selección debe ser determinista según la semántica temporal e identidad definidas por el dominio propietario.

Si existe un turno actual:

- el turno actual ocupa el foco;
- el siguiente turno se presenta como anticipo secundario;
- una asignación que solapa de forma no resoluble con el turno actual no se selecciona silenciosamente como “siguiente”.

Si no existe turno actual:

- el primer turno futuro elegible se convierte en el foco informativo de Home;
- su etiqueta deja claro que es **próximo**, no vigente.

---

#### 9. Estados de presentación de programación

Se definen resultados conceptuales de presentación. No constituyen un enum físico obligatorio.

| Resultado | Significado | Foco de Home |
| --- | --- | --- |
| `ACTUAL_Y_SIGUIENTE` | Existe un turno vigente y además uno futuro elegible. | Turno actual principal; siguiente turno secundario. |
| `SOLO_ACTUAL` | Existe un turno vigente y no existe otro futuro publicado. | Turno actual principal; sin tarjeta futura artificial. |
| `SOLO_SIGUIENTE` | No existe turno vigente y sí existe un turno futuro elegible. | Próximo turno como foco informativo. |
| `SIN_PROGRAMACION_VISIBLE` | No existe turno actual ni futuro publicado visible. | Estado vacío explícito; acceso a programación personal cuando corresponda. |
| `PROGRAMACION_NO_RESOLUBLE` | Los datos disponibles no permiten seleccionar de forma segura un único actual o siguiente. | Estado de revisión/actualización; nunca una elección arbitraria. |
| `CARGANDO_PROGRAMACION` | La fuente todavía no respondió. | Skeleton o estado de carga, no “sin turno”. |
| `ERROR_DE_PROGRAMACION` | La consulta o resolución falló. | Estado de error recuperable, no “sin turno”. |

Los textos finales de error y recuperación se alinearán con ANIMA-UX-009, ANIMA-UX-010 y los contratos transversales de mensajes.

---

#### 10. Matriz determinista de resolución

| Turno actual resoluble | Turno futuro resoluble | Resultado | Presentación primaria |
| --- | --- | --- | --- |
| Sí | Sí | `ACTUAL_Y_SIGUIENTE` | Actual + anticipo del siguiente. |
| Sí | No | `SOLO_ACTUAL` | Actual. |
| No | Sí | `SOLO_SIGUIENTE` | Próximo turno. |
| No | No | `SIN_PROGRAMACION_VISIBLE` | Sin turno programado visible. |
| Ambiguo | Cualquiera | `PROGRAMACION_NO_RESOLUBLE` | No elegir por orden accidental. |
| Cualquiera | Ambiguo | `PROGRAMACION_NO_RESOLUBLE` | No elegir por orden accidental. |
| Fuente cargando | — | `CARGANDO_PROGRAMACION` | Carga explícita. |
| Fuente fallida | — | `ERROR_DE_PROGRAMACION` | Error explícito y recuperable. |

La ausencia y el fallo permanecen separados.

---

#### 11. Prioridad visual de Home

La jerarquía objetivo de la capa superior del inicio es:

1. identidad contextual mínima del trabajador;
2. turno vigente, cuando exista;
3. siguiente obligación laboral asociada al turno, cuando las tareas posteriores la definan;
4. siguiente turno publicado;
5. acceso a la programación personal completa;
6. información secundaria no administrativa.

ANIMA-UX-004 solo materializa documentalmente los puntos relacionados con turno actual y siguiente turno. No anticipa la acción primaria de marcación ni los detalles completos del contexto operativo.

---

#### 12. Composición cuando existe turno actual

Cuando el trabajador tiene un turno actual inequívoco, Home presenta:

```text
TURNO ACTUAL
[identidad resumida del turno]
[contexto que ANIMA-UX-005 defina]
[estado/acción que ANIMA-UX-006..012 definan]

DESPUÉS
[Siguiente turno, si existe]
```

El turno vigente recibe mayor peso visual que:

- agenda histórica;
- reportes;
- accesos administrativos;
- promociones internas;
- estadísticas personales no críticas;
- próximos turnos posteriores al primero.

---

#### 13. Composición cuando no existe turno actual

Si no existe un turno vigente pero sí un turno futuro publicado:

```text
PRÓXIMO TURNO
[primera asignación futura elegible]

VER MI PROGRAMACIÓN
[entrada secundaria a /shifts]
```

No se mostrará una tarjeta vacía titulada “Turno actual” ocupando el foco ni se simulará que el trabajador ya está dentro de jornada.

La distancia temporal al próximo turno podrá expresarse de forma humana si la implementación dispone de una semántica horaria segura, pero no altera su condición de futuro.

---

#### 14. Composición cuando no existe programación visible

Si no existe turno vigente ni programación futura visible, Home deberá expresar un estado vacío real.

La experiencia deberá comunicar al menos que:

- no hay un turno publicado visible para el trabajador en ese momento;
- el estado no equivale a error técnico;
- no se inventará una sede, área, rol o jornada por datos históricos;
- la programación personal completa continúa siendo el destino apropiado cuando corresponda revisarla.

No se utilizarán controles administrativos, reportes o configuraciones como relleno del vacío.

---

#### 15. Carga y error no son estados vacíos

`CARGANDO_PROGRAMACION`, `SIN_PROGRAMACION_VISIBLE` y `ERROR_DE_PROGRAMACION` deberán ser distinguibles.

```text
CARGANDO
≠ SIN TURNO
≠ ERROR
```

Mientras la consulta está pendiente, Home no afirma que no existe turno.

Si la consulta falla, Home no reutiliza silenciosamente como actual el último turno almacenado sin un contrato de frescura compatible.

La política exacta de cache, offline y sincronización pertenece a ANIMA-UX-011 y ANIMA-UX-012.

---

#### 16. Ambigüedad y programación no resoluble

Home no resolverá por posición en un arreglo, orden incidental de consulta o preferencia local situaciones como:

- dos asignaciones que el dominio considera simultáneamente candidatas a turno actual;
- dos candidatos a primer turno futuro sin una precedencia temporal o contractual suficiente;
- intervalos incompletos;
- horario nocturno cuya semántica no pueda reconstruirse de forma segura;
- datos publicados contradictorios;
- una versión local que no pueda demostrarse vigente frente a la fuente propietaria.

En esos casos se usa `PROGRAMACION_NO_RESOLUBLE` y el conflicto queda en manos del dominio de programación correspondiente.

Esta regla evita convertir una limitación del modelo de scheduling en una decisión UX inventada.

---

#### 17. Frontera con el modelo mensual de programación

ANIMA consume programación; no define las reglas maestras de scheduling.

ANIMA-UX-004 no decide:

- horizonte mensual definitivo;
- reglas de publicación;
- overnight shifts;
- `end-at-close`;
- DST;
- cierres mensuales;
- conflictos de plantillas;
- bulk scheduling;
- excepciones del planner;
- semántica interna de la versión de programación.

Cuando una de esas reglas sea necesaria para determinar correctamente el turno actual o siguiente, Home consume el resultado del contrato propietario una vez éste exista; no lo reproduce localmente.

---

#### 18. Programación y asistencia son hechos distintos

La presencia de un turno actual responde a programación laboral.

El estado de asistencia responde a marcación y sus transiciones.

```text
TURNO ACTUAL
≠ CHECK-IN CONFIRMADO

TURNO ACTUAL
≠ PERMISO PARA MARCAR

CHECK-IN ABIERTO
≠ PRUEBA SUFICIENTE DE TURNO ACTUAL
```

Home podrá presentar ambos dominios de manera coordinada, pero no utilizar uno para fabricar el otro.

La relación exacta con check-in y check-out pertenece a ANIMA-UX-006 y ANIMA-UX-007.

---

#### 19. Frontera con autorización

Mostrar una asignación en Home no concede autoridad para ejecutar una acción.

Antes de cualquier mutación posterior deberán seguir resolviéndose los contratos efectivos de:

- identidad;
- actor;
- turno;
- sede y área cuando apliquen;
- rol operativo;
- dispositivo;
- permiso;
- estado compatible;
- protección de servidor.

ANIMA-UX-004 define orientación de interfaz, no autorización.

---

#### 20. El siguiente turno no es una cola administrativa

La tarjeta de siguiente turno tiene un propósito exclusivamente personal: anticipar la próxima asignación publicada del trabajador.

No incluye:

- planificación de compañeros;
- cobertura de vacantes;
- creación o edición de turnos;
- aprobación o publicación;
- filtros por trabajador;
- filtros de sede de administración;
- reasignaciones;
- vista semanal de equipo.

Esas funciones permanecen fuera del carril personal según ANIMA-UX-003 y el backoffice propietario.

---

#### 21. Relación entre Home y `/shifts`

Home y `/shifts` no son duplicados.

| Superficie | Responsabilidad objetivo |
| --- | --- |
| `/home` | Orientar el presente inmediato: turno actual y primer turno futuro. |
| `/shifts` | Consultar la programación personal con mayor horizonte y detalle. |

Home no debe replicar la agenda completa.

`/shifts` no obliga al trabajador a entrar para descubrir si tiene turno ahora.

Una entrada `Ver mi programación` o equivalente podrá navegar desde Home hacia `/shifts` sin transferir autoridad administrativa.

---

#### 22. Actualización ante cambios de programación

La proyección de Home deberá recalcularse cuando la programación visible pueda haber cambiado materialmente.

Son disparadores conceptuales válidos:

- apertura del inicio;
- retorno de la aplicación a primer plano;
- retorno desde la programación personal;
- recepción de una señal válida de actualización de turnos;
- actualización manual de datos cuando exista ese patrón de interfaz;
- invalidación o refresco producido por la capa de datos propietaria.

Esta tarea no impone polling, intervalo fijo ni tecnología de sincronización.

Tras recalcular, Home no conservará como actual un turno que la fuente ya haya cancelado, retirado o supersedido.

---

#### 23. Notificaciones no son fuente de verdad

Una notificación sobre un turno puede provocar revalidación o navegación, pero su payload no convierte por sí solo una asignación en turno actual o siguiente.

Al abrir ANIMA desde una notificación:

1. se revalida sesión;
2. se consulta la programación vigente permitida;
3. se recalcula la proyección de Home o `/shifts`;
4. se presenta el estado actual, aunque difiera del contenido histórico de la notificación.

No se congela la programación desde el mensaje recibido.

---

#### 24. Igualdad de experiencia para trabajador y gerente en carril personal

La jerarquía de Home no cambia por tener un rol base con mayor autoridad.

Cuando una persona gerencial usa su carril trabajador:

- ve su turno actual;
- ve su siguiente turno;
- consulta su programación personal;
- no recibe reportes de terceros en el mismo foco;
- no transforma su siguiente turno en planner de equipo;
- no hereda un filtro administrativo de sede o trabajador.

La entrada al carril administrativo permanece explícita y separada.

---

#### 25. Información reservada a ANIMA-UX-005

ANIMA-UX-004 determina **qué turno** ocupa cada posición, pero no cierra todavía la composición detallada del contenido de la tarjeta.

ANIMA-UX-005 es propietaria de decidir cómo mostrar de forma comprensible:

- sede;
- área;
- horario;
- rol operativo;
- jerarquía entre esos campos;
- ausencia o no aplicabilidad de alguno de ellos;
- relación visual de ese contexto con el turno seleccionado.

Por tanto, esta tarea no fija un layout final de esos cuatro datos.

---

#### 26. Acciones reservadas a ANIMA-UX-006 y ANIMA-UX-007

ANIMA-UX-004 no define el CTA de marcación.

Se reserva:

- simplificación de check-in a `ANIMA-UX-006`;
- simplificación de check-out a `ANIMA-UX-007`.

La tarjeta de turno podrá alojar posteriormente la acción correcta, pero esta tarea no decide:

- texto del botón;
- habilitación;
- geocerca;
- validación previa;
- confirmación;
- doble toque;
- transición de asistencia.

---

#### 27. Estados y recuperación reservados a ANIMA-UX-008 a ANIMA-UX-012

La siguiente continuidad mantiene propietarios específicos:

| Tema | Propietario |
| --- | --- |
| Marcación confirmada o pendiente | `ANIMA-UX-008` |
| Explicación de por qué no se puede marcar | `ANIMA-UX-009` |
| Diferenciación ubicación / turno / autorización | `ANIMA-UX-010` |
| Manejo comprensible de cola offline | `ANIMA-UX-011` |
| Sincronización de cola pendiente | `ANIMA-UX-012` |

ANIMA-UX-004 no absorbe esos diseños.

---

#### 28. Delta AS-IS → TO-BE

| Aspecto | AS-IS observado | TO-BE definido por ANIMA-UX-004 |
| --- | --- | --- |
| Home | Prioriza asistencia, geocerca, conectividad y resumen; no proyecta turno actual + siguiente como estructura principal. | Incorpora una proyección explícita y priorizada de turno actual y siguiente turno. |
| Próximo turno | Existe principalmente en `/shifts` mediante una heurística cliente de primer turno futuro. | Se convierte en proyección canónica de presentación consumida también por Home, sin congelar la heurística AS-IS. |
| Turno actual | No existe como contrato UX explícito de Home. | Se define por la semántica temporal autoritativa de scheduling, sin inferencias locales. |
| Ausencia | Puede depender de cómo termine la consulta de cada pantalla. | Se separan sin programación, carga, error y ambigüedad. |
| Agenda completa | `/shifts` contiene programación personal y todavía mezcla funciones administrativas AS-IS. | Home solo anticipa actual + siguiente; `/shifts` conserva consulta personal completa y la administración se separa según ANIMA-UX-003. |
| Gerencia | El código actual puede ampliar Home y Turnos mediante rol/capability. | El carril personal conserva únicamente la programación propia, independientemente de autoridad administrativa adicional. |

---

#### 29. Matriz de escenarios de aceptación UX

| Escenario | Turno actual | Siguiente | Resultado esperado |
| --- | --- | --- | --- |
| Trabajador dentro de un turno y con otro publicado | Sí | Sí | Actual en foco; próximo secundario. |
| Trabajador dentro de su último turno publicado | Sí | No | Actual en foco; no se inventa siguiente. |
| Trabajador entre jornadas con turno futuro | No | Sí | Próximo turno en foco con lenguaje futuro. |
| Trabajador sin programación publicada visible | No | No | Estado vacío real. |
| Consulta todavía en curso | Desconocido | Desconocido | Carga, nunca “sin turno”. |
| Consulta fallida | Desconocido | Desconocido | Error recuperable, nunca “sin turno”. |
| Dos candidatos actuales sin precedencia canónica | Ambiguo | — | Programación no resoluble. |
| Turno futuro cancelado antes de refrescar | No aplicable tras revalidación | Recalcular | No mantenerlo como próximo. |
| Gerente en su Home personal | Según su programación | Según su programación | No mostrar programación de terceros. |
| App abierta desde notificación antigua | Recalcular | Recalcular | Mostrar fuente vigente, no payload histórico. |

---

#### 30. Hallazgos y carryover

| Hallazgo / dependencia | Bloquea ANIMA-UX-004 | Propietario | Condición de salida |
| --- | --- | --- | --- |
| La semántica definitiva de turnos nocturnos y otros casos complejos de scheduling no debe inferirse desde la heurística cliente actual. | No para el diseño de presentación; sí para materializar una resolución temporal incompatible. | Carril de programación laboral VISO y contratos propietarios de scheduling | La fuente de programación expone una semántica temporal suficiente para resolver actual/futuro sin inferencia local. |
| El detalle de sede, área, horario y rol todavía no está diseñado dentro de la tarjeta. | No | `ANIMA-UX-005` | Definir jerarquía y tratamiento de esos datos. |
| El turno seleccionado todavía no define CTA de marcación. | No | `ANIMA-UX-006` y `ANIMA-UX-007` | Diseñar check-in y check-out sobre contexto válido. |
| Los estados de marcación, bloqueo y offline no están cerrados en esta tarea. | No | `ANIMA-UX-008` a `ANIMA-UX-012` | Completar la secuencia documental reservada. |
| `/shifts` AS-IS conserva administración mezclada. | No | Separación aprobada en `ANIMA-UX-003` y materialización física posterior | Implementar el carril personal y el backoffice propietario sin perder programación personal. |

Ningún hallazgo requiere crear una tarea nueva.

---

#### 31. Requisitos de prueba derivados

**NO GENERA REQUISITOS DE PRUEBA.**

Requisitos creados: **0**
Requisitos modificados: **0**
Requisitos diferidos: **0**
Requisitos descartados: **0**
Requisitos obsoletos: **0**

La cobertura vigente ya exige que la experiencia priorice la tarea actual y la siguiente obligación, distinga estados sin turno y datos no sincronizados, resuelva el contexto operativo sin fabricarlo desde filtros y mantenga Home, Turnos y autorización separados. ANIMA-UX-004 concreta ese contrato transversal para la proyección de programación en el inicio de ANIMA sin introducir una obligación de prueba materialmente nueva.

---

#### 32. Cobertura de prueba vigente reutilizada

Se reutilizan sin modificación:

- `TREQ-UX-001` — identificación inmediata de tarea actual, siguiente acción y estado;
- `TREQ-UX-003` — densidad e información adecuadas al actor y su tarea;
- `TREQ-UX-005` — fuente de verdad, estado y frescura visibles;
- `TREQ-UX-008` — clasificación de superficie y separación de intenciones;
- `TREQ-UX-009` — resolución de turno y contexto desde hechos autoritativos;
- `TREQ-UX-013` — navegación operativa organizada por tarea y proceso en curso;
- `TREQ-UX-028` — conservación del foco de una tarea válida ya iniciada;
- `TREQ-UX-029` — foco principal y cola secundaria diferenciada;
- `TREQ-UX-037` — distinción entre sin turno, tareas futuras, bloqueos y datos no sincronizados;
- `TREQ-ANIMA-010` — arranque seguro hacia Home con sesión;
- `TREQ-ANIMA-013` — navegación autenticada sin sustituir autorización;
- `TREQ-ANIMA-015` — separación en Home de asistencia, geocerca, conectividad y sincronización;
- `TREQ-ANIMA-016` — separación de lectura personal y gestión en `/shifts`.

Esta enumeración es trazabilidad hacia cobertura existente y no una actualización del registro de requisitos.

---

#### 33. Evidencia de validación

| Clase | Estado | Evidencia |
| --- | --- | --- |
| BUILD | NOT_EXECUTED | No se ejecutó build del repositorio ni de la aplicación durante el desarrollo documental. |
| LOCAL | PASS | El artefacto se verificó estructuralmente como una sola tarea, con metadata completa, secciones obligatorias, cero requisitos derivados, continuidad cerrada y sin whitespace final. |
| REMOTA | PASS | Se verificaron en GitHub la continuidad vigente, la topología `DEFINE_ONCE`, ANIMA-UX-003 aprobado, el código actual de Home y Turnos, la fuente de programación AS-IS, el contrato transversal UX y los fragmentos 04A aplicables. |
| OPERATIVA | PASS | La matriz de resolución cubre actual + siguiente, solo actual, solo siguiente, vacío, carga, error y ambigüedad sin confundir programación, asistencia o autorización. |
| FÍSICA | NOT_APPLICABLE | ANIMA-UX-004 es `DEFINE_ONCE` con `NO_PHYSICAL_INSTANCE`; no autoriza cambios de código, Supabase, navegación, datos ni despliegue. |

---

#### 34. Criterios de aceptación

1. Home distingue inequívocamente turno actual y siguiente turno.
2. El turno actual se selecciona únicamente mediante semántica autoritativa de programación.
3. Ninguna ventana cliente convierte por anticipación un turno futuro en actual.
4. El siguiente turno es la primera asignación futura elegible y distinta del actual.
5. Cuando existe actual + siguiente, el actual tiene mayor jerarquía.
6. Cuando solo existe siguiente, éste se presenta explícitamente como futuro.
7. Cuando no existe programación visible, Home usa un estado vacío real.
8. Carga, error y ausencia permanecen separados.
9. Una ambigüedad de scheduling no se resuelve por orden incidental del cliente.
10. Home muestra como máximo actual + un siguiente en la capa inicial.
11. La programación personal completa permanece en `/shifts`.
12. Home no reintroduce planner de equipo ni reportes administrativos.
13. Un usuario gerencial en carril personal solo ve su propia programación.
14. La programación visible no concede autorización de marcación.
15. Turno programado y asistencia permanecen como hechos diferentes.
16. Una notificación no se usa como fuente de verdad de programación.
17. La proyección se recalcula ante cambios materiales sin imponer tecnología de polling.
18. Las reglas complejas del scheduling quedan en su dominio propietario.
19. La información de sede, área, horario y rol queda reservada a ANIMA-UX-005.
20. Check-in y check-out quedan reservados a ANIMA-UX-006 y ANIMA-UX-007.
21. Confirmación, bloqueo y offline quedan reservados a ANIMA-UX-008 a ANIMA-UX-012.
22. No se crean ni modifican requisitos de prueba.
23. No existe materialización física propia.
24. La continuidad queda reservada exclusivamente hacia ANIMA-UX-005.

---

#### 35. Límites

ANIMA-UX-004 no:

- modifica `vento-anima`;
- modifica Supabase;
- crea migraciones, tablas, vistas, RPC, triggers o RLS;
- cambia Expo Router;
- cambia las nueve pestañas autenticadas;
- implementa la separación física definida por ANIMA-UX-003;
- redefine el modelo mensual de scheduling;
- define overnight, DST o `end-at-close`;
- congela `employee_shifts` como contrato definitivo;
- convierte `isUpcomingShift` AS-IS en semántica canónica;
- diseña todavía el detalle visual de sede, área, horario y rol;
- diseña check-in o check-out;
- define mensajes finales de marcación bloqueada;
- define tratamiento completo de cola offline;
- cambia permisos, roles, capabilities o protección de servidor;
- modifica el registro de requisitos de prueba;
- crea una instancia física.

---

#### 36. Estado de salida documental

La tarea deja especificado un contrato de inicio personal con:

- una fuente lógica de programación autoritativa;
- reglas separadas para turno actual y siguiente turno;
- siete resultados conceptuales de presentación;
- una matriz determinista de resolución;
- jerarquía actual → siguiente → programación completa;
- separación explícita entre programación, asistencia y autorización;
- tratamiento fail-closed de ambigüedades temporales;
- actualización sin depender de payloads históricos de notificación;
- igualdad de experiencia personal para trabajadores con o sin autoridad administrativa adicional;
- handoff exacto hacia los detalles de contexto del turno.

El estado físico permanece `ESPECIFICADO_NO_MATERIALIZADO`.

---

#### 37. Continuidad

**ÚLTIMA TAREA APROBADA**
`ANIMA-UX-003 — Separar experiencia del trabajador y del administrador`

**TAREA ACTUAL APROBADA**
`ANIMA-UX-004 — Diseñar inicio con turno actual y siguiente turno`

**SIGUIENTE TAREA RESERVADA**
`ANIMA-UX-005 — Mostrar sede, área, horario y rol operativo del turno`


### ✅ ANIMA-UX-005 — Mostrar sede, área, horario y rol operativo del turno

**Estado:** APROBADA
**Tarea anterior:** ANIMA-UX-004 — Diseñar inicio con turno actual y siguiente turno
**Tarea siguiente:** ANIMA-UX-006 — Simplificar el flujo de check-in
**Tipo de tarea:** documental; diseño UX TO-BE del contexto visible del turno personal en ANIMA, con jerarquía y tratamiento de sede, área, horario y rol operativo sin redefinir programación, asistencia, autorización ni marcación
**Bloque:** F_ANIMA — EXPERIENCIA DEL TRABAJADOR Y ADMINISTRACION
**Repositorio propietario:** vento-group-sas/vento-shell
**Archivo propietario:** docs/plan-canonico/modular/bloques/F_ANIMA/02_EXPERIENCIA_DEL_TRABAJADOR_Y_ADMINISTRACION.md
**Estado físico resultante:** ESPECIFICADO_NO_MATERIALIZADO
**Cambios físicos autorizados:** ninguno durante esta tarea
**Requisitos de prueba creados o modificados:** 0

---

#### 1. Propósito

Definir cómo ANIMA presenta al trabajador el contexto humano del turno que `ANIMA-UX-004` ya resolvió como **turno actual** o **siguiente turno**.

La tarjeta debe permitir responder de inmediato y sin interpretar códigos técnicos:

1. **¿Cuándo trabajo?**
2. **¿En qué sede?**
3. **¿En qué área?**
4. **¿Bajo qué rol operativo?**

La tarea fija la semántica visible, la jerarquía entre esos cuatro datos, su origen y el comportamiento cuando alguno no aplica o no puede resolverse de forma segura.

No vuelve a decidir qué asignación ocupa la posición de turno actual o siguiente, no define todavía el CTA de check-in, no determina si una marcación está permitida y no crea una nueva fuente de programación.

---

#### 2. Handoff recibido de ANIMA-UX-004

`ANIMA-UX-004` dejó cerradas estas decisiones que esta tarea consume sin reabrirlas:

- Home muestra como máximo un turno actual y un siguiente turno;
- el turno actual tiene prioridad visual sobre el siguiente;
- cuando no hay turno actual, el siguiente puede ocupar el foco como asignación futura;
- carga, ausencia, error y programación no resoluble son estados diferentes;
- la programación personal completa permanece en `/shifts`;
- programación, asistencia y autorización son hechos distintos;
- la semántica temporal compleja pertenece al dominio propietario de scheduling;
- la asignación mostrada siempre pertenece al trabajador efectivo del carril personal;
- un actor gerencial no recibe programación de terceros dentro de su Home personal.

Por tanto, `ANIMA-UX-005` recibe una **asignación ya seleccionada** y define únicamente cómo proyectar su contexto laboral al trabajador.

---

#### 3. Principio rector

El contexto visible del turno se obtiene de la **asignación publicada seleccionada**, no de preferencias, defaults de perfil ni filtros de interfaz.

```text
CONTEXTO VISIBLE DEL TURNO
=
contexto de la asignación publicada seleccionada

NO ES
=
sede seleccionada para geocerca
sede primaria del empleado
sede filtrada en administración
área usada en un filtro
rol base del empleado
último rol utilizado
último turno mostrado
```

Si la asignación no contiene o no permite resolver un dato requerido, ANIMA lo trata como contexto incompleto o no aplicable según corresponda. Nunca lo fabrica con un fallback de otra finalidad.

---

#### 4. Unidad documental de presentación

La unidad de esta tarea es una **proyección de contexto del turno** asociada a la identidad estable de la asignación seleccionada por `ANIMA-UX-004`.

La proyección no es:

- una nueva tabla;
- un nuevo estado persistente de programación;
- una copia editable del turno;
- un AccessContext alternativo;
- una decisión de autorización;
- una evidencia de asistencia;
- una selección de sede para marcar;
- una inferencia a partir del rol base.

Su función es transformar identificadores y valores autoritativos del turno en información humana coherente entre Home y la programación personal.

---

#### 5. Fuente de verdad del contexto

Para una asignación laboral publicada, ANIMA deberá conservar como base de presentación los identificadores y valores pertenecientes al propio turno:

- identidad estable de la asignación;
- fecha o referencia temporal definida por scheduling;
- hora de inicio;
- hora de fin o semántica de cierre cuando aplique;
- sede asignada;
- área asignada cuando aplique;
- rol operativo asignado cuando aplique;
- clase de asignación necesaria para distinguir trabajo de descanso.

La implementación AS-IS usa actualmente campos como `site_id`, `area_id`, `operational_role`, `start_time`, `end_time`, `shift_kind` y `show_end_as_close` en `employee_shifts`. Esta observación demuestra disponibilidad actual de contexto, pero no convierte la tabla ni sus detalles de implementación en un contrato inmutable.

La presentación deberá seguir la fuente propietaria vigente si el modelo físico evoluciona.

---

#### 6. Correspondencia semántica de los datos

| Dimensión visible | Hecho propietario | Presentación ordinaria | Fallback prohibido |
| --- | --- | --- | --- |
| Horario | intervalo de la asignación publicada y semántica temporal propietaria | rango humano de inicio a fin o inicio a cierre cuando proceda | horario del último turno, horario habitual o jornada base del empleado |
| Sede | sede de trabajo asignada al turno | nombre humano de la sede | sede primaria, sede seleccionada, sede de geocerca o filtro administrativo |
| Área | área asignada al turno cuando la matriz la requiere | nombre humano del área | área del perfil, área anterior o área inferida desde el rol |
| Rol operativo | rol operativo asignado al turno | etiqueta humana exacta del rol operativo | rol base, familia genérica, substring del código o último rol usado |

La interfaz ordinaria no muestra UUID, códigos internos ni claves técnicas como sustituto del nombre humano.

---

#### 7. Jerarquía de información

La tarjeta conserva primero la posición temporal definida por `ANIMA-UX-004` y después organiza el contexto en tres grupos:

1. **Tiempo:** fecha contextual y horario.
2. **Lugar:** sede y, cuando aplique, área.
3. **Función:** rol operativo.

La jerarquía conceptual es:

```text
TURNO ACTUAL / PRÓXIMO TURNO

CUÁNDO
fecha contextual + horario

DÓNDE
sede
área, si aplica

COMO QUÉ
rol operativo
```

La composición visual puede compactar líneas en pantallas pequeñas, pero no debe volver ambiguas las dimensiones ni ocultar una de ellas solo porque el trabajador la use habitualmente.

---

#### 8. Contrato compacto para un turno laboral

Una asignación laboral con contexto completo deberá permitir una lectura equivalente a:

```text
TURNO ACTUAL
Hoy · 08:00–16:00
Centro de Producción · Repostería
Rol: Producción de repostería
```

El ejemplo define jerarquía semántica, no copy final obligatorio ni nombres de catálogo.

Reglas:

- la posición `TURNO ACTUAL` o `PRÓXIMO TURNO` proviene de `ANIMA-UX-004`;
- la fecha ayuda a ubicar el turno sin sustituir el intervalo propietario;
- sede y área se presentan como ubicaciones distintas aunque puedan compartir vocabulario;
- el rol operativo conserva su identidad específica;
- la interfaz no reduce el rol a una familia genérica para ahorrar espacio;
- el contexto no compite con la acción de marcación que definirá la tarea siguiente.

---

#### 9. Composición del turno actual

Cuando existe un turno actual laboral y su contexto es resoluble, Home presenta los cuatro datos sin obligar al trabajador a abrir `/shifts`.

Orden recomendado de lectura:

1. etiqueta de vigencia;
2. horario vigente;
3. sede de la asignación;
4. área de la asignación cuando aplique;
5. rol operativo de la asignación.

El horario recibe mayor jerarquía porque sitúa el intervalo vigente; sede y área responden dónde; rol operativo responde bajo qué función se espera la jornada.

El estado de asistencia, la geocerca y la futura acción de marcación pueden aparecer en la misma región general de Home, pero no sustituyen ninguno de estos datos.

---

#### 10. Composición del siguiente turno

Cuando la asignación es el siguiente turno futuro, la tarjeta conserva la misma semántica de contexto con menor peso visual que un turno actual.

Debe mostrar como mínimo, para una asignación laboral resoluble:

- fecha contextual suficiente para saber cuándo ocurre;
- horario;
- sede;
- área cuando aplique;
- rol operativo.

No se permite mostrar únicamente la fecha y el horario si el sistema ya conoce un cambio material de sede, área o rol que el trabajador necesita anticipar.

La tarjeta futura puede ser más compacta, pero los valores deben coincidir con los que `/shifts` muestra para la misma identidad de turno.

---

#### 11. Horario

El horario visible pertenece a la asignación y se presenta en formato humano consistente con el locale de la experiencia.

Reglas:

1. inicio y fin no se recalculan desde duración estimada;
2. un rango no se sustituye por “mañana”, “tarde” o “noche” como única información;
3. los campos de programación local no se transforman como si fueran timestamps UTC salvo que el contrato propietario declare esa semántica;
4. si el dominio propietario declara que el fin debe expresarse como `Cierre`, ANIMA muestra esa semántica humana y no inventa una hora de finalización;
5. `ANIMA-UX-005` no define qué significa temporalmente `Cierre`, overnight, DST u otras reglas complejas;
6. si el intervalo no puede interpretarse con seguridad, la tarjeta conserva la condición no resoluble heredada de scheduling en lugar de inventar un rango.

El objetivo es mostrar fielmente el horario publicado, no reinterpretarlo.

---

#### 12. Sede del turno

La **sede del turno** es la sede laboral asignada a la programación seleccionada.

Debe presentarse mediante el nombre humano correspondiente al identificador de sede de esa asignación.

No puede sustituirse silenciosamente por:

- `employee.siteId` o sede primaria del perfil;
- `selectedSiteId` de preferencias;
- sede elegida para un filtro de administración;
- sede detectada por geolocalización;
- sede candidata para check-in;
- última sede usada en una marcación.

Esto mantiene la frontera aprobada por `ANIMA-UX-003`: seleccionar o detectar una sede con otra finalidad no transforma el contexto publicado del turno.

---

#### 13. Área del turno

El área representa la unidad operativa asignada al turno cuando la matriz propietaria de sede y rol la utiliza.

La presentación ordinaria usa el nombre humano del área correspondiente al identificador asignado.

Se distinguen dos casos que no deben colapsarse:

- **área no aplicable:** el contrato válido de la asignación no requiere área; la interfaz puede omitir el campo o expresar que no aplica si el contexto lo exige;
- **área no resoluble:** existe una referencia de área que debería poder identificarse, pero su nombre o validez no puede resolverse; la interfaz debe expresar contexto incompleto y no inventar otra área.

Un `null` físicamente observado no se interpreta automáticamente como error ni automáticamente como “sin área”. La decisión depende de la semántica de la asignación y de la matriz propietaria.

---

#### 14. Rol operativo del turno

El rol mostrado es el **rol operativo específico de la asignación**, no el rol base de la cuenta ni una etiqueta aproximada por familia.

Ejemplos conceptuales de diferencias que deben preservarse:

```text
ROL BASE DEL EMPLEADO
≠
ROL OPERATIVO DEL TURNO

FAMILIA DE ROL
≠
ETIQUETA DEL ROL OPERATIVO ASIGNADO
```

Una persona puede tener un rol base administrativo y, en una asignación laboral concreta, un rol operativo distinto. Home personal deberá mostrar el rol de la asignación.

La misma regla aplica a trabajadores que rotan entre barra, servicio, cocina, producción, bodega, logística u otras funciones válidas.

---

#### 15. Resolución de la etiqueta del rol operativo

ANIMA debe preferir la etiqueta humana canónica asociada al rol operativo exacto y a su contexto de sede/área.

La lógica AS-IS que clasifica códigos por substrings o reduce varias funciones a etiquetas genéricas no se convierte en contrato TO-BE.

Por tanto:

- un código de repostería no se presenta como “Cocina” solo por compartir una familia de producción;
- un código técnico no se recorta por guiones para fabricar un nombre;
- un rol inexistente en la referencia vigente no se remapea al rol base;
- una etiqueta legible no concede ni cambia autoridad;
- si el rol exacto no puede resolverse, se comunica que el contexto del rol está incompleto sin mostrar el código técnico como respuesta ordinaria.

La materialización futura deberá consumir una proyección o referencia propietaria de etiquetas en lugar de mantener un diccionario mutable paralelo dentro de ANIMA.

---

#### 16. Consistencia de sede, área y rol

Para una asignación laboral, sede, área y rol deben pertenecer al mismo contexto publicado.

La interfaz no debe producir combinaciones como:

- sede del turno + área del perfil actual;
- sede primaria + rol del turno;
- área del turno + rol inferido desde el empleado;
- sede seleccionada en geocerca + rol de programación;
- nombre vigente de una referencia distinta a la identidad asignada porque la original quedó inactiva.

Si la combinación exacta ya no puede resolverse contra la fuente propietaria, la presentación conserva la asignación y señala que su contexto requiere revisión. No migra silenciosamente la asignación a otro contexto válido.

---

#### 17. Sede laboral y puntos de marcación son dimensiones distintas

La sede visible en esta tarea corresponde al lugar laboral asignado al turno.

Los posibles puntos de entrada o salida pertenecen al flujo de marcación y pueden ser distintos.

```text
SEDE DEL TURNO
≠
PUNTO DE CHECK-IN
≠
PUNTO DE CHECK-OUT
```

`checkin_site_id` y `checkout_site_id`, cuando existan en el modelo físico, no se etiquetan como “Sede” del turno ni reemplazan `site_id` en la tarjeta laboral.

La forma de presentar, seleccionar o validar esos puntos se reserva a `ANIMA-UX-006`, `ANIMA-UX-007` y `ANIMA-UX-010` según corresponda.

---

#### 18. Datos faltantes y contexto incompleto

Una tarjeta puede seguir siendo informativa aunque una dimensión no sea resoluble, pero ANIMA no debe esconder la diferencia entre **desconocido**, **no aplicable** y **fallo de carga**.

Para una asignación laboral:

| Situación | Tratamiento de presentación |
| --- | --- |
| Horario válido, sede válida, área válida, rol válido | Mostrar contexto completo. |
| Sede referenciada pero sin nombre resoluble | Mantener horario y demás datos seguros; indicar que la sede requiere actualización o revisión. |
| Área requerida pero no resoluble | Mantener datos seguros; indicar que el área está pendiente de resolver. |
| Área legítimamente no aplicable | Omitir el campo o expresar “No aplica” cuando sea necesario; no mostrar error. |
| Rol operativo requerido pero no resoluble | Mantener datos seguros; indicar que el rol operativo está pendiente de resolver. |
| Fuente de referencia todavía cargando | No transformar la espera en “Sin sede”, “Sin área” o “Sin rol”. |
| Error al resolver etiquetas | No sustituir por defaults de empleado ni por códigos técnicos. |

El copy final de bloqueo o recuperación se coordina con las tareas posteriores de mensajes; esta tarea fija la semántica que esos mensajes deberán respetar.

---

#### 19. Un contexto incompleto no decide por sí solo la marcación

`ANIMA-UX-005` hace visible un problema de contexto, pero no decide qué acción de asistencia se habilita.

```text
CONTEXTO INCOMPLETO VISIBLE
≠
DENEGACIÓN DE MARCACIÓN DEFINIDA POR ESTA TAREA
```

La materialización posterior deberá consultar los contratos de check-in, check-out, turno, geocerca y autorización para decidir la acción correcta.

Esta frontera evita que un fallback visual se convierta en una regla de seguridad y evita que la tarjeta oculte un dato defectuoso para “dejar funcionar” el botón.

---

#### 20. Asignaciones de descanso

Una asignación de descanso no debe presentarse como un turno laboral artificial.

Cuando el dominio propietario identifica la asignación como descanso:

- la fecha o periodo de descanso continúa siendo visible;
- la experiencia comunica `Descanso` o una expresión humana equivalente;
- no se presenta un rango técnico de persistencia como si fuera horario laboral;
- área y rol operativo se consideran no aplicables salvo que un contrato futuro declare una necesidad distinta;
- una sede almacenada como alcance de planificación no se presenta automáticamente como destino de trabajo;
- no se inventa check-in ni check-out para completar visualmente la tarjeta.

Los valores físicos usados para representar un día completo en almacenamiento no constituyen copy de interfaz.

---

#### 21. Relación entre Home y `/shifts`

Home y `/shifts` pueden tener densidades distintas, pero no semánticas distintas para la misma asignación.

| Dimensión | Home | `/shifts` personal |
| --- | --- | --- |
| Identidad del turno | actual o siguiente seleccionado | misma identidad dentro de la agenda |
| Horario | compacto y prominente | visible con mayor contexto temporal |
| Sede | visible | visible |
| Área | visible cuando aplica | visible cuando aplica |
| Rol operativo | visible | visible |
| Códigos técnicos | no | no en experiencia ordinaria |
| Agenda adicional | no, salvo siguiente | sí, según horizonte personal |

Si dos superficies resuelven nombres diferentes para el mismo `site_id`, `area_id` o rol operativo, la implementación se considera divergente y debe reconciliar la fuente, no escoger una versión por pantalla.

---

#### 22. Igualdad del carril personal para actores gerenciales

La composición de contexto no cambia porque el trabajador tenga autoridad administrativa adicional.

En el carril personal, un gerente, gerente general o propietario:

- ve la sede de su propia asignación;
- ve el área de su propia asignación cuando aplique;
- ve el horario de su propia asignación;
- ve el rol operativo de su propia asignación;
- no reemplaza ese rol por su rol base gerencial;
- no recibe la sede filtrada del backoffice como sede laboral;
- no ve datos de terceros dentro de la tarjeta.

La entrada administrativa sigue siendo explícita y separada según `ANIMA-UX-003`.

---

#### 23. Notas, estado de asistencia y acciones no forman parte del cuarteto esencial

El contexto definido por esta tarea no absorbe otros elementos que el AS-IS pueda mostrar junto al turno.

Quedan separados:

- estado de programación como `scheduled`, `confirmed` u otros estados propietarios;
- notas del turno;
- horas acumuladas;
- conteos de turnos;
- estado de asistencia;
- geocerca;
- cola offline;
- CTA de check-in;
- CTA de check-out;
- mensajes de bloqueo;
- sincronización pendiente.

Esos datos pueden coexistir cuando sus contratos lo autoricen, pero no desplazan sede, área, horario y rol operativo ni cambian su fuente.

---

#### 24. Accesibilidad y lectura rápida

La tarjeta deberá preservar la comprensión de las cuatro dimensiones sin depender únicamente de posición, color, iconos o abreviaturas.

Criterios:

- el lector de pantalla debe poder distinguir horario, sede, área y rol;
- una etiqueta o nombre truncado visualmente debe conservar su valor accesible completo;
- los iconos pueden reforzar significado, no sustituirlo;
- la reducción responsive puede agrupar sede y área, pero ambas dimensiones permanecen identificables;
- un rol operativo no se comunica solo mediante color de pill;
- `Cierre`, `Descanso`, dato no aplicable y dato no resoluble deben mantener semántica textual;
- la jerarquía debe conservarse con tamaños de texto ampliados.

ANIMA continúa siendo una experiencia móvil enfocada, por lo que la tarjeta evita tablas y densidad administrativa.

---

#### 25. Minimización de datos

La tarjeta personal muestra únicamente el contexto necesario para comprender la propia asignación.

No necesita incluir:

- identificadores internos;
- códigos de rol;
- `area_id` o `site_id` en texto técnico;
- nombres de compañeros;
- cobertura de equipo;
- territorio administrativo;
- matrices de permisos;
- reglas de autorización;
- puntos de marcación que no sean necesarios todavía;
- datos de nómina, costos o analítica.

La resolución de etiquetas puede requerir referencias adicionales en la capa propietaria, pero el payload entregado al cliente debe mantenerse limitado a lo necesario para la experiencia autorizada.

---

#### 26. AS-IS observado

El código móvil vigente muestra un contexto fragmentado:

- la consulta personal de turnos ya recupera sede, área, rol operativo y horario;
- el hero de `/shifts` muestra fecha, horario y sede del siguiente turno;
- la lista personal muestra fecha, sede, horario, estado y notas;
- la semana personal puede mostrar un rol derivado por heurística;
- el área no se proyecta al trabajador en las tarjetas observadas;
- el rol puede reducirse localmente a etiquetas genéricas mediante coincidencias de texto;
- Home todavía usa sede de perfil, selección o asistencia para otros fines y no consume una tarjeta canónica de contexto de turno.

Este AS-IS es evidencia para diseñar la convergencia, no el contrato objetivo.

---

#### 27. Delta AS-IS → TO-BE

| Aspecto | AS-IS observado | TO-BE definido por ANIMA-UX-005 |
| --- | --- | --- |
| Sede | Se muestra en Turnos; Home usa además sedes de otros contextos. | La tarjeta laboral usa exclusivamente la sede de la asignación seleccionada. |
| Área | El turno la consulta como identificador, pero las tarjetas personales no la muestran de forma consistente. | Se muestra con nombre humano cuando la asignación la requiere. |
| Horario | Ya existe presentación de rango y `Cierre`. | Se conserva como dato prioritario sin reinterpretar la semántica propietaria. |
| Rol operativo | La semana puede derivar una etiqueta mediante heurística local. | Se resuelve la etiqueta humana exacta desde la referencia propietaria del rol asignado. |
| Rol base | Disponible en auth y usado en varias decisiones AS-IS. | No sustituye el rol operativo del turno. |
| Sede seleccionada | Disponible para preferencias/geocerca. | No sustituye la sede publicada del turno. |
| Descanso | Puede persistirse con valores técnicos de día completo y sede de alcance. | Se presenta como descanso, sin convertir valores técnicos en horario/destino laboral. |
| Consistencia | Distintas superficies componen datos con utilidades diferentes. | Home y `/shifts` muestran los mismos valores semánticos para la misma asignación. |

---

#### 28. Matriz de escenarios de aceptación UX

| Escenario | Resultado esperado |
| --- | --- |
| Turno laboral actual con sede, área, horario y rol válidos | Mostrar los cuatro datos con horario prioritario y contexto humano. |
| Próximo turno cambia de sede frente al actual | Mostrar la sede específica del próximo turno; no heredar la actual. |
| Próximo turno cambia de área dentro de la misma sede | Mostrar el área específica del próximo turno. |
| Próximo turno usa otro rol operativo | Mostrar el rol exacto del próximo turno aunque el rol base del trabajador no cambie. |
| Gerente con turno operativo propio | Mostrar el rol operativo de la asignación, no “Gerente” por defecto. |
| Empleado con varias sedes y una seleccionada para geocerca | Mostrar la sede del turno, no la selección local. |
| Turno con punto externo de check-in | Mostrar la sede laboral como sede; el punto de entrada queda fuera de esta tarjeta. |
| Área válida no aplicable | Omitir o expresar no aplicabilidad sin generar error. |
| Área referenciada pero no resoluble | Mostrar contexto incompleto; no inferir otra área. |
| Rol referenciado pero sin etiqueta resoluble | Mostrar contexto incompleto; no enseñar el código como etiqueta ordinaria. |
| Referencias todavía cargando | Mantener estado de carga; no afirmar ausencia. |
| Asignación de descanso | Mostrar descanso; no mostrar 00:00–23:59 como jornada ni área/rol ficticios. |
| Misma asignación en Home y `/shifts` | Mostrar valores semánticos coincidentes. |
| Matriz propietaria cambia y la asignación deja de resolver | Señalar revisión requerida; no remapear silenciosamente la asignación. |

---

#### 29. Hallazgos y carryover

| Hallazgo / dependencia | Bloquea ANIMA-UX-005 | Propietario | Condición de salida |
| --- | --- | --- | --- |
| ANIMA ya consulta `area_id` y `operational_role`, pero no dispone en la tarjeta personal de una proyección consistente de `area_name` y etiqueta exacta del rol. | No para el contrato documental. | Materialización física posterior del paquete ANIMA y fuente propietaria de contexto operativo | Resolver las etiquetas desde una referencia propietaria sin diccionario paralelo ni fallback por rol base. |
| La heurística AS-IS de rol público agrupa funciones diferentes y no garantiza paridad con la matriz de roles operativos. | No; esta tarea define su retiro conceptual. | Materialización física posterior de ANIMA | Consumir la etiqueta humana exacta del rol asignado y eliminar la heurística como fuente autoritativa. |
| Los puntos de check-in y check-out pueden diferir de la sede laboral. | No | `ANIMA-UX-006`, `ANIMA-UX-007` y `ANIMA-UX-010` | Definir acción y explicación de marcación sin renombrar esos puntos como sede del turno. |
| La semántica definitiva de scheduling mensual, overnight y cierre continúa congelada en su dominio propietario. | No para presentación; sí para inventar una interpretación temporal nueva. | Carril de programación laboral VISO | Proveer semántica temporal suficiente para el intervalo que ANIMA deba mostrar. |
| El tratamiento final de mensajes de contexto inválido no corresponde a esta tarea. | No | `ANIMA-UX-009` y `ANIMA-UX-010` | Diseñar mensajes y diferenciación de causas usando la semántica fijada aquí. |

Ningún hallazgo requiere crear una tarea documental adicional.

---

#### 30. Requisitos de prueba derivados

**NO GENERA REQUISITOS DE PRUEBA.**

Requisitos creados: **0**
Requisitos modificados: **0**
Requisitos diferidos: **0**
Requisitos descartados: **0**
Requisitos obsoletos: **0**

La cobertura vigente ya exige resolver contexto operativo desde hechos autoritativos, minimizar la información al propósito del actor, conservar una experiencia personal separada de administración y mantener coherencia entre programación, Home, navegación y autorización. Esta tarea concreta esa cobertura para la presentación de sede, área, horario y rol de una asignación de ANIMA sin introducir una obligación de prueba materialmente nueva.

---

#### 31. Cobertura de prueba vigente reutilizada

Se reutilizan sin modificación:

- `TREQ-UX-001` — identificación inmediata de tarea, acción y estado;
- `TREQ-UX-003` — información y densidad adecuadas al actor y su finalidad;
- `TREQ-UX-005` — fuente de verdad, estado y frescura visibles;
- `TREQ-UX-008` — clasificación de intención y separación de superficies;
- `TREQ-UX-009` — resolución de sede, área, turno, rol y demás contexto desde hechos autoritativos;
- `TREQ-UX-017` — minimización de datos por finalidad;
- `TREQ-UX-021` — diferenciación visual accesible y no dependiente de color;
- `TREQ-UX-037` — distinción de estados sin turno, bloqueos y datos no sincronizados;
- `TREQ-UX-059` — relevancia contextual sin convertir preferencias o filtros en autoridad;
- `TREQ-UX-060` — proyección de relevancia desde hechos autoritativos;
- `TREQ-UX-063` — contenido mínimo permitido en superficies operativas;
- `TREQ-UX-195` — capa inicial operativa enfocada en contexto y acción relevante;
- `TREQ-ANIMA-015` — separación en Home de asistencia, geocerca, sede, conectividad y sincronización;
- `TREQ-ANIMA-016` — separación entre lectura personal, semana de sede y gestión en `/shifts`.

Esta enumeración es trazabilidad hacia cobertura existente y no modifica el registro canónico de requisitos.

---

#### 32. Evidencia de validación

| Clase | Estado | Evidencia |
| --- | --- | --- |
| BUILD | NOT_EXECUTED | No se ejecutó build del repositorio ni de la aplicación durante el desarrollo documental. |
| LOCAL | PASS | El artefacto se verificó estructuralmente como una sola tarea, con metadata completa, secciones obligatorias, cero requisitos derivados, continuidad cerrada y sin whitespace final. |
| REMOTA | PASS | Se verificaron en GitHub la continuidad vigente, la topología `DEFINE_ONCE`, ANIMA-UX-003 y ANIMA-UX-004 aprobadas, el código actual de Home y Turnos, la persistencia de contexto de programación en VISO, el registro 04A aplicable, `package.json` y los validadores documentales. |
| OPERATIVA | PASS | Las matrices cubren turno laboral completo, cambio de sede/área/rol, actor gerencial en carril personal, punto externo de marcación, datos no aplicables, datos no resolubles, carga, descanso y consistencia Home ↔ `/shifts`. |
| FÍSICA | NOT_APPLICABLE | ANIMA-UX-005 está gobernada por `DEFINE_ONCE`; no crea una instancia física propia ni autoriza cambios de código, Supabase, navegación, datos o despliegue. |

---

#### 33. Criterios de aceptación

1. La tarea consume el turno actual o siguiente ya seleccionado por ANIMA-UX-004 sin recalcular su posición.
2. Todo turno laboral resoluble muestra horario, sede, área cuando aplique y rol operativo.
3. El horario conserva la semántica de la programación publicada y no se reconstruye desde duración estimada.
4. La sede visible pertenece al turno y no a preferencias, geocerca, perfil o filtros administrativos.
5. El área visible pertenece al turno y no se infiere desde rol, perfil o turno anterior.
6. El rol visible es el rol operativo específico de la asignación y no el rol base del empleado.
7. La etiqueta del rol se obtiene de una referencia humana propietaria y no de substrings o familias genéricas.
8. La interfaz ordinaria no usa UUID ni códigos internos como etiquetas de contexto.
9. Área no aplicable y área no resoluble permanecen diferenciadas.
10. Rol no resoluble no se reemplaza por rol base.
11. Sede no resoluble no se reemplaza por sede primaria o seleccionada.
12. Una referencia inválida no provoca remapeo silencioso de la asignación a otro contexto válido.
13. La sede laboral se mantiene separada de puntos de check-in y check-out.
14. Un contexto incompleto puede mostrarse como tal sin que esta tarea decida la autorización de marcación.
15. Una asignación de descanso no muestra valores técnicos de día completo como jornada laboral.
16. Un descanso no recibe área o rol ficticios para completar la tarjeta.
17. Home y `/shifts` muestran valores semánticos coincidentes para la misma asignación.
18. El siguiente turno puede ser más compacto, pero no oculta cambios materiales de sede, área o rol.
19. Una persona gerencial en carril personal ve el contexto de su propia asignación y no el contexto de terceros.
20. La tarjeta es comprensible con lector de pantalla, texto ampliado y sin depender solo de color o iconos.
21. El cliente recibe únicamente la información necesaria para el contexto personal autorizado.
22. No se redefine overnight, DST, `end-at-close` ni otra semántica temporal propietaria.
23. No se define todavía check-in, check-out, geocerca, elegibilidad o mensajes finales de bloqueo.
24. No se crean ni modifican requisitos de prueba.
25. No existe materialización física propia.
26. La continuidad queda reservada exclusivamente hacia ANIMA-UX-006.

---

#### 34. Límites

ANIMA-UX-005 no:

- modifica `vento-anima`;
- modifica `vento-viso`;
- modifica Supabase;
- crea migraciones, tablas, vistas, RPC, triggers o RLS;
- cambia `employee_shifts` ni lo declara contrato físico definitivo;
- cambia el catálogo de sedes, áreas o roles operativos;
- crea un diccionario paralelo de etiquetas;
- reescribe la matriz de sede/área/rol;
- redefine el rol base del empleado;
- define permisos o capacidades;
- cambia Expo Router ni el inventario de pantallas;
- redefine qué turno es actual o siguiente;
- redefine scheduling mensual;
- define overnight, DST, cierres mensuales o reglas de publicación;
- define el significado matemático de `Cierre`;
- diseña el CTA de check-in;
- diseña el CTA de check-out;
- decide la geocerca válida para marcar;
- decide qué contexto incompleto bloquea una marcación;
- define los mensajes finales de error o recuperación;
- diseña cola offline ni sincronización;
- modifica el registro de requisitos de prueba;
- crea una instancia física.

---

#### 35. Estado de salida documental

La tarea deja especificado un contrato de presentación del contexto laboral con:

- la asignación seleccionada por ANIMA-UX-004 como única unidad de referencia;
- horario como dimensión temporal prioritaria;
- sede y área como dimensiones de ubicación diferenciadas;
- rol operativo específico como dimensión funcional;
- separación estricta entre rol operativo y rol base;
- separación estricta entre sede laboral y puntos de marcación;
- resolución humana de nombres desde fuentes propietarias;
- prohibición de fallbacks desde perfil, filtros, geocerca o turno anterior;
- tratamiento distinto de no aplicable, no resoluble, carga y error;
- tratamiento específico de descansos sin exponer valores técnicos de persistencia;
- paridad semántica entre Home y `/shifts`;
- handoff limpio hacia la simplificación de check-in.

El estado físico permanece `ESPECIFICADO_NO_MATERIALIZADO`.

---

#### 36. Continuidad

**ÚLTIMA TAREA APROBADA**
`ANIMA-UX-004 — Diseñar inicio con turno actual y siguiente turno`

**TAREA ACTUAL APROBADA**
`ANIMA-UX-005 — Mostrar sede, área, horario y rol operativo del turno`

**SIGUIENTE TAREA RESERVADA**
`ANIMA-UX-006 — Simplificar el flujo de check-in`

### ✅ ANIMA-UX-006 — Simplificar el flujo de check-in

**Estado:** APROBADA
**Tarea anterior:** ANIMA-UX-005 — Mostrar sede, área, horario y rol operativo del turno
**Tarea siguiente:** ANIMA-UX-007 — Simplificar el flujo de check-out
**Tipo de tarea:** documental; diseño UX TO-BE del flujo personal de check-in en ANIMA para reducir la marcación ordinaria a una acción principal sobre contexto laboral ya resuelto, conservando intactas las validaciones canónicas de turno, territorio, rol, autorización, geocerca, idempotencia y evidencia
**Bloque:** F_ANIMA — EXPERIENCIA DEL TRABAJADOR Y ADMINISTRACION
**Repositorio propietario:** vento-group-sas/vento-shell
**Archivo propietario:** docs/plan-canonico/modular/bloques/F_ANIMA/02_EXPERIENCIA_DEL_TRABAJADOR_Y_ADMINISTRACION.md
**Estado físico resultante:** ESPECIFICADO_NO_MATERIALIZADO
**Cambios físicos autorizados:** ninguno durante esta tarea
**Requisitos de prueba creados o modificados:** 0

---

#### 1. Propósito

Diseñar el flujo TO-BE de check-in de ANIMA para que un trabajador con un turno actual comprensible pueda registrar su entrada mediante una acción principal directa, sin tener que preparar manualmente la marcación mediante pasos técnicos de ubicación, selección de sede, recaptura de contexto o navegación adicional.

La simplificación se aplica a la experiencia, no a la seguridad ni a la autoridad del proceso.

El flujo debe responder con claridad:

1. qué acción debe realizar el trabajador;
2. sobre qué turno se intenta registrar la entrada;
3. qué validaciones ejecuta ANIMA automáticamente;
4. cuándo hace falta una intervención excepcional del trabajador;
5. cómo evita múltiples intenciones por doble toque, retry o reanudación;
6. a qué tareas posteriores se delegan confirmación, bloqueo, diagnóstico, cola offline y recuperación.

La tarea no implementa el flujo, no modifica Supabase, no redefine el contrato de autorización y no diseña todavía check-out.

---

#### 2. Handoff recibido de ANIMA-UX-004 y ANIMA-UX-005

Esta tarea consume sin reabrir las decisiones de las dos tareas anteriores:

- `ANIMA-UX-004` determina si Home tiene un turno actual y cuál es su identidad;
- `ANIMA-UX-005` proyecta para ese turno horario, sede laboral, área y rol operativo;
- el turno actual tiene prioridad visual sobre el siguiente turno;
- programación y asistencia son hechos distintos;
- la programación visible no concede por sí sola autorización de marcación;
- la sede laboral pertenece al turno publicado;
- el punto físico de check-in puede ser diferente de la sede laboral;
- sede, área y rol no se reconstruyen desde perfil, preferencias, filtros administrativos ni una selección local;
- un contexto incompleto no se rellena con fallbacks de otra finalidad.

Por tanto, la entrada normal de `ANIMA-UX-006` es un **turno actual personal ya seleccionado y presentado**, no una pantalla vacía que obligue al trabajador a reconstruir su contexto.

---

#### 3. Principio rector

La regla UX queda:

```text
CONTEXTO LABORAL YA RESUELTO
+
UNA ACCIÓN PRINCIPAL: REGISTRAR ENTRADA
+
VALIDACIONES AUTOMÁTICAS Y AUTORITATIVAS
+
RESULTADO INEQUÍVOCO
=
CHECK-IN SIMPLE
```

No se considera simplificación válida:

```text
SELECCIONAR SEDE
→ ACTUALIZAR UBICACIÓN
→ VALIDAR UBICACIÓN
→ CONFIRMAR TURNO
→ CONFIRMAR CONTEXTO
→ ABRIR OTRO MODAL
→ REGISTRAR ENTRADA
```

cuando esos datos y validaciones pueden resolverse automáticamente desde las fuentes propietarias.

La reducción de pasos nunca autoriza:

- omitir una precondición de servidor;
- aceptar un turno fabricado por el cliente;
- sustituir la sede del turno por una preferencia local;
- omitir geocerca cuando la política vigente la exige;
- convertir una intención pendiente en asistencia confirmada;
- perder identidad idempotente o evidencia;
- habilitar una entrada porque el botón esté visible.

---

#### 4. Resultado UX objetivo

Para el caso ordinario y resoluble, Home debe permitir esta secuencia conceptual:

```text
TURNO ACTUAL
[horario]
[sede · área]
[rol operativo]

[ Registrar entrada ]

TOQUE ÚNICO
→ validación automática
→ resultado
```

El trabajador no necesita visitar `/shifts`, abrir una pantalla técnica de geocerca, elegir su sede laboral ni volver a digitar datos ya contenidos en la asignación.

La interfaz puede mostrar información de contexto y estado alrededor del CTA, pero ninguna acción secundaria ordinaria compite con `Registrar entrada`.

---

#### 5. Unidad de interacción

La unidad de esta tarea es una **intención personal de check-in** iniciada por el trabajador efectivo sobre el turno actual que Home presenta.

La intención no es:

- un permiso;
- una aprobación;
- una sesión operativa ya activa;
- un registro de asistencia confirmado;
- un turno;
- una sede elegida por el cliente;
- una prueba de geocerca;
- un resultado de sincronización.

Es la señal explícita de que el trabajador solicita iniciar su jornada sobre el contexto mostrado.

El servidor y los contratos propietarios deciden si esa intención puede producir el efecto de asistencia.

---

#### 6. Fuente de autoridad

El CTA se apoya visualmente en el turno actual mostrado, pero la operación de check-in debe revalidar las fuentes autoritativas antes del efecto.

La cadena conceptual vigente se conserva:

```text
ACTOR EFECTIVO
→ TURNO PUBLICADO APLICABLE
→ SEDE DEL TURNO
→ ÁREA DEL TURNO
→ ROL OPERATIVO DEL TURNO
→ COMPATIBILIDAD ROL-SEDE
→ COMPATIBILIDAD ROL-ÁREA
→ PUNTO FÍSICO Y GEOFENCE CUANDO APLIQUEN
→ AUTORIZACIÓN Y ESTADO COMPATIBLES
→ EFECTO DE ASISTENCIA
```

Un valor mostrado previamente puede orientar la experiencia, pero no reemplaza la revalidación necesaria en el momento de la mutación.

No son autoridad para admitir la entrada:

- `shift_id` propuesto unilateralmente por el cliente;
- último turno visto;
- última sede usada;
- `selectedSiteId` local;
- sede primaria del empleado;
- rol base;
- caché sin prueba de vigencia;
- geocerca por sí sola;
- texto del botón;
- estado visual de Home.

---

#### 7. Frontera entre UX y autorización

`ANIMA-UX-006` decide **cómo inicia el trabajador la intención y cuántos pasos visibles necesita**.

No decide:

- qué turno es autorizable;
- qué ventana temporal es válida;
- qué permisos conceden el check-in;
- qué sede, área o rol son compatibles;
- qué radio de geocerca se utiliza;
- qué evidencia exacta debe persistirse;
- qué transición física implementa el servidor.

Estas decisiones ya pertenecen a los contratos canónicos de autorización y contexto del minibloque ANIMA-AUTH.

La interfaz no puede convertir una simplificación de pasos en una segunda política de autorización.

---

#### 8. Estado AS-IS observado

La revisión del código vigente de `vento-anima` muestra un flujo funcional pero más complejo de lo deseado para la experiencia objetivo:

- Home usa una acción genérica que decide `checkIn()` o `checkOut()` según el estado de asistencia;
- el CTA solo queda habilitado cuando la geocerca ya aparece como lista;
- existen estados del CTA cuyo texto pide validar o revisar ubicación aunque el propio CTA permanece deshabilitado;
- Home puede mostrar una tarjeta separada para actualizar ubicación;
- cuando hay varias sedes del empleado, la interfaz puede abrir selección de sede;
- el nombre activo puede derivarse de geocerca, selección local, asistencia previa o sede del empleado;
- `checkIn()` vuelve a ejecutar geocerca y otras comprobaciones después del toque;
- el código actual solicita permiso de ubicación en segundo plano durante el flujo cuando todavía no está disponible;
- existe protección contra acciones simultáneas mediante un lock en cliente;
- existe infraestructura de cola e idempotencia para contingencias;
- el código actual dispone de `site_id`, `area_id`, `operational_role`, `checkin_site_id` y `checkout_site_id` en el contexto del turno.

Esta auditoría AS-IS sirve para identificar pasos y ambigüedades que el contrato TO-BE debe eliminar. No convierte los detalles actuales de implementación en contrato permanente.

---

#### 9. Drift AS-IS frente al contrato canónico

Se identifica una divergencia material que la implementación futura no debe conservar:

- el contrato aprobado de `ANIMA-AUTH-001` exige exactamente un turno publicado aplicable antes de admitir un check-in;
- el código AS-IS puede construir una entrada online sin `shiftContext` y registrar una excepción `check_in_without_published_shift`;
- esa excepción física observada no es una alternativa autorizada por el contrato canónico actual.

Decisión de esta tarea:

```text
CHECK-IN TO-BE
NO ADMITE
ENTRADA SIN TURNO PUBLICADO APLICABLE
```

La corrección física de esa divergencia pertenece a la materialización posterior de ANIMA y de sus contratos de autorización. Esta tarea únicamente impide que el comportamiento AS-IS sea promovido a diseño objetivo.

---

#### 10. Camino ordinario de un solo toque

Cuando Home dispone de un turno actual laboral presentado y no existe una entrada activa o una intención previa todavía sin resolver, la experiencia ordinaria debe reducirse a:

1. el trabajador revisa el contexto visible de su turno;
2. toca `Registrar entrada` una sola vez;
3. el CTA entra inmediatamente en estado de procesamiento;
4. ANIMA resuelve automáticamente las precondiciones técnicas y contractuales;
5. el flujo termina en un resultado inequívoco o en un handoff de recuperación.

No se añade una confirmación modal ordinaria del tipo “¿Seguro que deseas registrar entrada?”. El toque sobre un CTA específico, contextual y claramente rotulado constituye la intención explícita.

Una confirmación adicional solo podría existir si una tarea posterior o una política de riesgo concreta la justificara; no forma parte del camino normal definido aquí.

---

#### 11. Estados documentales de interacción

Para describir el flujo se utilizan cinco estados conceptuales locales a esta tarea:

| Estado documental | Significado UX | Acción principal |
| --- | --- | --- |
| `CHECK_IN_AVAILABLE` | existe contexto visual de turno actual suficiente para ofrecer la intención | `Registrar entrada` |
| `CHECK_IN_SUBMITTING` | el toque ya ocurrió y se ejecutan precondiciones o mutación | esperar; no aceptar otro toque |
| `CHECK_IN_PREREQUISITE` | hace falta una intervención excepcional que solo el trabajador puede completar | resolver la condición indicada |
| `CHECK_IN_BLOCKED` | la validación autoritativa impide producir el efecto | handoff a explicación y recuperación |
| `CHECK_IN_RESULT` | existe resultado de la intención | handoff a confirmado, pendiente o estado aplicable |

Estos nombres son herramientas documentales de diseño. No crean enums físicos, reason codes, estados de base de datos ni contratos públicos nuevos.

---

#### 12. Regla de visibilidad del CTA

`Registrar entrada` es la acción principal únicamente cuando la experiencia personal está en una situación donde iniciar una entrada es pertinente.

Reglas:

- con turno actual laboral y sin check-in activo, el CTA puede presentarse como acción ordinaria;
- con un check-in ya activo, el CTA de entrada no se presenta; la continuidad corresponde a `ANIMA-UX-007`;
- con una intención de entrada todavía pendiente de resolver, no se ofrece una segunda intención equivalente;
- con solo un siguiente turno futuro y ningún turno actual, Home no presenta el futuro como si pudiera iniciarse ahora;
- con descanso, Home no presenta un CTA de check-in laboral por completar una tarjeta;
- con estado de carga o programación no resoluble, no se finge disponibilidad;
- que el CTA sea visible no significa autorización concedida.

La revalidación server-side continúa siendo obligatoria antes del efecto.

---

#### 13. Preflight automático después del toque

Las comprobaciones que el sistema puede ejecutar sin una decisión humana se realizan automáticamente después de la intención.

El trabajador no debe tener que encadenar manualmente acciones equivalentes a:

- refrescar turno;
- refrescar sede;
- revalidar área;
- escoger rol;
- ejecutar una pantalla técnica de autorización;
- pulsar primero “validar ubicación” si la propia acción puede solicitar y validar ubicación de manera segura;
- repetir datos ya presentes en el contexto laboral.

El preflight automático puede resolver en paralelo o secuencia interna las dependencias que el contrato técnico permita, pero la UX las presenta como una sola operación coherente.

Si una precondición exige intervención humana real, el flujo pasa a `CHECK_IN_PREREQUISITE` en lugar de simular que la acción terminó.

---

#### 14. Revalidación del turno y su contexto

La información mostrada por Home se utiliza como contexto para comprender la acción, no como snapshot autoritativo suficiente para escribir asistencia.

Al iniciar la intención, el sistema debe preservar la regla de que:

- el actor efectivo se resuelve de nuevo cuando corresponda;
- el turno publicado debe seguir siendo aplicable;
- la publicación no debe haber sido retirada, sustituida o invalidada;
- sede, área y rol deben seguir correspondiendo al mismo turno;
- las compatibilidades de rol y territorio deben seguir siendo válidas;
- una ambigüedad no se resuelve eligiendo silenciosamente la primera fila;
- una indisponibilidad técnica no se traduce en “sin turno”.

Si el contexto cambió materialmente desde lo mostrado, la intención no continúa con el snapshot obsoleto.

---

#### 15. Ubicación y geocerca en el flujo simplificado

Cuando la política aplicable exige ubicación o geocerca para el check-in, la validación forma parte del preflight automático de `Registrar entrada`.

La experiencia objetivo evita exigir dos acciones ordinarias separadas:

```text
ACTUALIZAR UBICACIÓN
→
REGISTRAR ENTRADA
```

El toque en `Registrar entrada` puede iniciar o refrescar la ubicación necesaria y continuar automáticamente si el resultado es válido.

Esto no elimina:

- requisitos de permiso del sistema operativo;
- precisión mínima propietaria;
- radio o punto físico aplicable;
- validación server-side cuando esté definida;
- evidencia de ubicación;
- tratamiento de ubicación manipulada o no concluyente.

La simplificación solo elimina una preparación manual redundante cuando el sistema puede ejecutar la comprobación por sí mismo.

---

#### 16. Sede laboral y punto de marcación

La UX conserva explícitamente la separación aprobada:

```text
SEDE LABORAL DEL TURNO
≠
PUNTO FÍSICO DE CHECK-IN
```

La tarjeta del turno muestra la sede laboral definida por `ANIMA-UX-005`.

El check-in utiliza el punto físico autorizado por el contrato propietario cuando sea diferente.

Consecuencias:

- validar geocerca en un punto permitido no cambia la sede laboral mostrada;
- seleccionar un punto de marcación no reasigna el turno;
- la ubicación física no amplía sede, área, rol ni permisos;
- un nombre técnico de punto no sustituye el contexto laboral;
- el evento de asistencia conserva la relación entre sede operativa y punto físico cuando ambos difieren.

---

#### 17. Permisos del dispositivo

Un permiso del sistema operativo requerido para ubicación, notificaciones u otra capacidad técnica no debe convertirse en un paso manual recurrente si ya fue concedido y sigue vigente.

Para ubicación:

- si el permiso requerido ya existe, el check-in continúa sin pedir una acción adicional;
- si falta un permiso que el trabajador puede conceder, la intención entra en `CHECK_IN_PREREQUISITE` y ofrece la acción concreta para resolverlo;
- después de concederlo, el flujo debe poder continuar o reanudarse sin obligar a reconstruir el turno;
- una denegación persistente no se disfraza como error de turno;
- esta tarea no redefine qué nivel de permiso exige la política física vigente.

La experiencia no debe entrenar al trabajador a abrir ajustes o refrescar permisos antes de cada jornada “por si acaso”.

---

#### 18. Selección excepcional de punto físico

La selección manual no forma parte del flujo ordinario de check-in.

Solo puede aparecer si, después de resolver autoritativamente el turno y su territorio, el contrato propietario declara más de un **punto físico de marcación igualmente válido** y requiere que el trabajador indique cuál está usando.

En ese caso:

- la interfaz habla de **punto de marcación**, no de “cambiar sede”;
- las opciones ya deben estar limitadas por el contexto autoritativo;
- la selección no modifica `site_id`, `area_id`, `operational_role` ni la publicación;
- no se ofrecen sedes ajenas al turno como bypass;
- si el contrato no permite una elección segura, se falla cerrado en lugar de pedir al trabajador que invente contexto.

La existencia AS-IS de un selector de sedes del empleado no autoriza mantenerlo como mecanismo TO-BE para escoger la sede laboral del check-in.

---

#### 19. Prohibición de recaptura

El trabajador no vuelve a proporcionar manualmente información que el turno y el contexto ya contienen de forma autoritativa.

El flujo ordinario no solicita:

- nombre del trabajador;
- sede laboral;
- área;
- rol operativo;
- hora programada;
- identidad del turno;
- motivo de entrada normal;
- una confirmación textual del contexto ya visible.

La captura manual solo puede existir para un hecho nuevo y necesario que no pueda derivarse correctamente de la fuente propietaria.

La simplificación conserva la diferencia entre reutilizar un hecho existente y fabricar un hecho faltante.

---

#### 20. Doble toque, concurrencia e idempotencia

Desde el primer toque aceptado, el CTA queda bloqueado para nuevas intenciones equivalentes mientras la operación se resuelve.

Reglas UX:

1. el primer toque inicia una única intención;
2. los toques adicionales mientras `CHECK_IN_SUBMITTING` no crean eventos nuevos;
3. el progreso se muestra sobre la misma acción o región contextual, sin abrir múltiples flujos;
4. una respuesta lenta no habilita un segundo intento destructivo;
5. un retry técnico reutiliza la identidad idempotente y las reglas ya definidas por el contrato de asistencia;
6. perder la respuesta no autoriza a asumir que la operación no ocurrió;
7. una intención offline o reanudada no se transforma en una segunda entrada.

La UX depende del contrato idempotente existente; no sustituye la deduplicación server-side con un simple `disabled` de frontend.

---

#### 21. Handoff a ANIMA-UX-008 para el resultado

`ANIMA-UX-006` termina cuando la intención ya produjo un resultado clasificable.

La presentación definitiva de:

- entrada confirmada;
- entrada pendiente;
- sincronización en curso;
- resultado todavía no confirmado;

pertenece a `ANIMA-UX-008 — Mostrar claramente marcación confirmada o pendiente`.

Esta tarea fija únicamente que el flujo de check-in debe llegar a un estado explícito y no dejar el CTA aparentando disponibilidad después de que ya existe una intención.

No se define aquí el copy final, iconografía, color ni persistencia visual de esos resultados.

---

#### 22. Handoff a ANIMA-UX-009 y ANIMA-UX-010 para bloqueos

Si una precondición impide el check-in, la experiencia no termina en un botón deshabilitado sin explicación ni en un texto técnico del backend.

La intención pasa a una salida de bloqueo cuya explicación final será propietaria de:

- `ANIMA-UX-009 — Explicar por qué no se puede marcar`;
- `ANIMA-UX-010 — Diferenciar error de ubicación, turno y autorización`.

Esta tarea conserva las categorías materiales que deben permanecer diferenciables:

- ausencia o invalidez de turno;
- ventana temporal incompatible;
- sede/área/rol incompatibles;
- ubicación o geocerca no válidas;
- falta de permiso del dispositivo;
- denegación de autorización;
- fuente técnica no disponible;
- conflicto o contexto cambiado.

No asigna textos finales ni reason codes nuevos.

---

#### 23. Handoff a ANIMA-UX-011 para contingencia offline

La reducción de pasos no convierte una pérdida de red en éxito automático.

Cuando el contrato de asistencia permita preservar una intención offline:

- la intención debe quedar durablemente almacenada antes de mostrarse como encolada;
- conserva su identidad estable y el contexto requerido;
- no se presenta como aplicada si solo está pendiente;
- no se ofrece una segunda entrada mientras la primera siga sin resolución segura;
- el trabajador no debe repetir manualmente el contexto para “volver a intentar”.

La experiencia detallada de cola, sincronización, conflictos y recuperación pertenece a `ANIMA-UX-011 — Diseñar manejo comprensible de cola offline`.

---

#### 24. Handoff a ANIMA-UX-012 para interrupciones

Si el flujo se interrumpe por cambio de aplicación, bloqueo de pantalla, pérdida de señal, permiso del dispositivo o cierre inesperado, la intención no se reinicia ciegamente desde cero.

Esta tarea exige conservar una identidad de interacción suficiente para que la capa propietaria pueda decidir si corresponde:

- continuar;
- consultar el resultado;
- revalidar;
- reanudar un prerequisito;
- mostrar pendiente;
- detener por conflicto.

`ANIMA-UX-012 — Permitir reanudar una marcación interrumpida` diseñará la experiencia completa de esa recuperación.

---

#### 25. Frontera con ANIMA-UX-007

Esta tarea no simplifica el check-out.

La separación es:

```text
SIN ENTRADA ACTIVA
→ ANIMA-UX-006
→ REGISTRAR ENTRADA

CON ENTRADA ACTIVA
→ ANIMA-UX-007
→ CERRAR / REGISTRAR SALIDA
```

No se diseña un CTA genérico cuyo significado cambie de forma ambigua.

La implementación física puede reutilizar componentes, pero la semántica visible debe expresar inequívocamente si la acción inicia o cierra una jornada.

Las reglas de salida, punto físico de salida y comportamiento después del check-in permanecen reservadas a `ANIMA-UX-007` y a los contratos de autorización correspondientes.

---

#### 26. Jerarquía visual y densidad

El check-in es una tarea frecuente y de baja densidad informativa para el trabajador.

Home debe priorizar:

1. turno actual;
2. contexto mínimo de horario, sede, área y rol;
3. acción `Registrar entrada`;
4. estado inmediato del intento.

No deben competir en el camino ordinario:

- diagnósticos técnicos;
- métricas administrativas;
- reportes de terceros;
- filtros;
- acciones de configuración;
- selección libre de sede;
- detalles avanzados de geolocalización;
- historial completo;
- datos de sincronización de bajo nivel.

Los detalles necesarios para resolver una excepción se presentan progresivamente cuando la excepción existe.

---

#### 27. Accesibilidad y comprensión

El CTA ordinario debe:

- tener una etiqueta textual inequívoca equivalente a `Registrar entrada`;
- mantener un objetivo táctil adecuado para móvil;
- comunicar estado de procesamiento sin depender únicamente de color;
- impedir activación repetida mientras procesa;
- conservar lectura correcta con texto ampliado;
- ofrecer semántica accesible para lector de pantalla;
- distinguir la acción principal de enlaces de ayuda o recuperación;
- evitar que un spinner sin texto sea la única explicación de lo que ocurre.

La interfaz no debe exigir que el trabajador conozca términos como geofence, RPC, RLS, cache, resolver o `shift_id` para completar el flujo.

---

#### 28. Minimización y privacidad

El check-in muestra y transmite únicamente la información necesaria para que el trabajador comprenda su acción y para que el sistema la valide y audite.

No se exponen en la pantalla ordinaria:

- UUID internos;
- nombres de tablas;
- permisos atómicos;
- identificadores de otras personas;
- candidatos de turnos alternativos;
- detalles de políticas antifraude;
- coordenadas crudas cuando no sean necesarias para comprender la acción;
- payloads de diagnóstico;
- datos administrativos de terceros.

La evidencia técnica requerida puede persistirse en las capas propietarias sin convertirla en contenido visible de Home.

---

#### 29. Matriz de escenarios de aceptación UX

| Escenario | Resultado esperado |
| --- | --- |
| Turno actual válido, contexto completo y geocerca ya reutilizable | Un toque en `Registrar entrada`; procesar y entregar resultado. |
| Turno actual válido y geocerca requiere lectura nueva | El mismo toque inicia la validación; no exigir primero “Actualizar ubicación”. |
| Falta permiso de ubicación requerido | Handoff a prerequisito concreto; conservar contexto y permitir continuidad segura después de resolverlo. |
| Turno actual con punto de check-in distinto de sede laboral | Mostrar la sede laboral en el turno y validar el punto físico sin reasignar la sede. |
| Existe exactamente un punto físico válido | Resolverlo automáticamente; no pedir selección. |
| Existen varios puntos solo si el contrato autoritativo permite elección | Pedir excepcionalmente elegir el punto de marcación entre opciones ya válidas; no “cambiar sede”. |
| Solo existe siguiente turno futuro | No presentar ese turno como disponible para check-in actual. |
| Día de descanso | No presentar `Registrar entrada` como acción laboral ordinaria. |
| No existe turno publicado aplicable | Cero efectos de asistencia; handoff a bloqueo. |
| Turno se retira entre render y toque | Revalidar; no registrar usando el snapshot mostrado. |
| Turno cambia sede/área/rol antes del efecto | Invalidar contexto previo y volver a resolver; no combinar valores viejos y nuevos. |
| Geocerca válida pero turno inválido | No registrar; ubicación no fabrica autorización. |
| Turno válido pero geocerca requerida falla | No registrar; handoff a causa de ubicación. |
| Doble toque rápido | Una única intención; el resto no genera eventos. |
| Respuesta del servidor se pierde después del commit | Consultar/reconciliar por identidad; no crear una segunda entrada. |
| Red cae y el contrato permite cola | Solo mostrar pendiente después de persistencia durable; no mostrar confirmado. |
| Red cae y no puede preservarse una intención válida | No fingir éxito; handoff a recuperación. |
| Ya existe check-in activo | No ofrecer entrada nueva; continuidad hacia flujo de check-out. |
| Gerente usa su Home personal | Mismo flujo de un toque sobre su propio turno, sin privilegio UX especial para omitir controles. |

---

#### 30. Hallazgos y carryover

| Hallazgo / dependencia | Bloquea ANIMA-UX-006 | Propietario | Condición de salida |
| --- | --- | --- | --- |
| El código AS-IS permite en la ruta online una entrada sin `shiftContext` mediante `check_in_without_published_shift`, incompatible con `ANIMA-AUTH-001`. | No para el contrato documental; sí para materializar el flujo canónico. | Materialización física de ANIMA y contratos `ANIMA-AUTH-001` a `ANIMA-AUTH-007` | El check-in físico falla cerrado cuando no existe exactamente un turno publicado aplicable y elimina el fallback como camino autorizado. |
| El CTA AS-IS depende de geocerca previamente `ready`, lo que puede convertir la ubicación en un paso manual separado. | No | Materialización física de ANIMA | Integrar la validación automática de ubicación en la intención de check-in conservando la política propietaria. |
| El selector AS-IS habla de cambiar sede y puede consumir sedes del empleado. | No | Materialización física de ANIMA y contrato de punto físico | La sede laboral procede del turno; cualquier elección excepcional se limita a puntos físicos autorizados y se etiqueta como tal. |
| La presentación final de confirmado frente a pendiente no pertenece a esta tarea. | No | `ANIMA-UX-008` | Diseñar el resultado visible sin confundir persistencia local con confirmación remota. |
| Los textos y recuperación de bloqueos no pertenecen a esta tarea. | No | `ANIMA-UX-009` y `ANIMA-UX-010` | Diseñar explicación humana y separar causas de ubicación, turno y autorización. |
| La cola offline y la reanudación detallada no pertenecen a esta tarea. | No | `ANIMA-UX-011` y `ANIMA-UX-012` | Diseñar estados de cola y recuperación de una intención interrumpida. |
| La validación con trabajadores reales todavía no corresponde a este cierre documental. | No | `ANIMA-UX-015` | Ejecutar piloto de check-in/check-out con trabajadores y registrar evidencia. |

Ningún hallazgo requiere crear una tarea documental adicional.

---

#### 31. Requisitos de prueba derivados

**NO GENERA REQUISITOS DE PRUEBA.**

Requisitos creados: **0**
Requisitos modificados: **0**
Requisitos diferidos: **0**
Requisitos descartados: **0**
Requisitos obsoletos: **0**

La cobertura vigente ya protege foco en la acción principal, reutilización de contexto autoritativo, separación de estados, explicación de bloqueos, idempotencia, contingencia offline, geocerca, autorización y no duplicación de efectos. Esta tarea especializa esas reglas para reducir pasos visibles en el check-in de ANIMA sin introducir una obligación materialmente nueva.

---

#### 32. Cobertura de prueba vigente reutilizada

Se reutilizan sin modificación:

- `TREQ-UX-001` — tarea actual, siguiente acción principal y estado del proceso comprensibles;
- `TREQ-UX-002` — bloqueo o fallo explicado con recuperación segura y sin duplicar efectos;
- `TREQ-UX-003` — información, acciones y densidad adecuadas al actor;
- `TREQ-UX-005` — fuente de verdad y distinción de estado confirmado o pendiente;
- `TREQ-UX-006` — comportamiento explícito ante interrupción, conectividad y reanudación;
- `TREQ-UX-008` — clasificación de la intención y separación de carriles;
- `TREQ-UX-009` — contexto operativo resuelto desde hechos autoritativos y no desde preferencias o filtros;
- `TREQ-UX-017` — minimización de datos por finalidad;
- `TREQ-UX-021` — estados diferenciables de forma accesible y no solo por color;
- `TREQ-UX-037` — separación entre ausencia de contexto, bloqueo y estados de sincronización;
- `TREQ-UX-059` — relevancia contextual sin transformar preferencias en autoridad;
- `TREQ-UX-060` — proyección de contexto desde fuentes autoritativas;
- `TREQ-UX-063` — contenido mínimo pertinente en la superficie operativa;
- `TREQ-UX-195` — capa inicial operativa enfocada en contexto y acción relevante;
- `TREQ-ANIMA-003` — persistencia durable e idempotencia de una intención offline antes de presentarla como encolada;
- `TREQ-ANIMA-015` — separación en Home entre asistencia, geocerca, sede, conectividad, cola y sincronización.

La enumeración anterior es trazabilidad hacia requisitos existentes. No modifica el registro canónico.

---

#### 33. Evidencia de validación

| Clase | Estado | Evidencia |
| --- | --- | --- |
| BUILD | NOT_EXECUTED | No se ejecutó build de `vento-shell` ni de `vento-anima` durante el desarrollo documental. |
| LOCAL | PASS | El artefacto fue verificado estructuralmente como una sola tarea, con metadata obligatoria, secciones consecutivas, cero requisitos derivados, continuidad cerrada y representación UTF-8/LF sin whitespace final. |
| REMOTA | PASS | Se verificaron en GitHub la continuidad actual, el owner, la topología `DEFINE_ONCE`, las tareas ANIMA-UX-004/005 aprobadas, los contratos ANIMA-AUTH aplicables, el código AS-IS de Home y asistencia, los fragmentos 04A necesarios, `package.json` y los validadores documentales. |
| OPERATIVA | NOT_EXECUTED | La prueba con trabajadores reales queda reservada a ANIMA-UX-015; la matriz de esta tarea es diseño y no sustituye evidencia de uso real. |
| FÍSICA | NOT_APPLICABLE | ANIMA-UX-006 está gobernada por `DEFINE_ONCE`; no crea instancia física ni autoriza cambios de aplicación, datos, Supabase o despliegue. |

---

#### 34. Criterios de aceptación

1. La tarea consume el turno actual y su contexto ya definidos por ANIMA-UX-004 y ANIMA-UX-005 sin recalcularlos en la interfaz.
2. El camino ordinario de check-in requiere una sola acción explícita del trabajador: `Registrar entrada`.
3. No existe un paso ordinario separado de “actualizar ubicación” previo al CTA cuando la ubicación puede resolverse automáticamente.
4. El trabajador no selecciona su sede laboral para poder marcar.
5. La sede laboral del turno permanece separada del punto físico de check-in.
6. Un punto físico único y válido se resuelve automáticamente.
7. Una selección excepcional solo puede elegir entre puntos físicos ya autorizados por el contexto propietario y nunca modifica la sede laboral.
8. La interfaz no vuelve a solicitar sede, área, rol, turno, horario ni identidad ya disponibles de forma autoritativa.
9. El toque sobre el CTA inicia una intención, no una autorización ya concedida.
10. Antes del efecto se revalidan actor, turno publicado, vigencia, sede, área, rol, compatibilidades y controles aplicables.
11. La geocerca no crea turno, territorio, sede, área, rol ni permiso.
12. El flujo TO-BE no admite check-in sin un turno publicado aplicable.
13. La excepción AS-IS `check_in_without_published_shift` no forma parte del contrato objetivo.
14. Un cambio material de turno entre render y mutación invalida el contexto previo y obliga a resolver de nuevo.
15. El CTA no acepta una segunda intención mientras el check-in está procesándose.
16. Doble toque, retry o respuesta perdida no deben producir dos entradas.
17. Un check-in activo elimina la pertinencia del CTA de entrada y entrega continuidad a ANIMA-UX-007.
18. Un siguiente turno futuro no se presenta como check-in disponible ahora.
19. Una asignación de descanso no presenta un CTA laboral de entrada.
20. Los permisos del dispositivo se solicitan solo cuando faltan y el flujo conserva contexto para continuar de forma segura.
21. La presentación final de confirmado o pendiente queda reservada a ANIMA-UX-008.
22. Los mensajes de imposibilidad quedan reservados a ANIMA-UX-009.
23. La diferenciación de ubicación, turno y autorización queda reservada a ANIMA-UX-010.
24. La cola offline queda reservada a ANIMA-UX-011 y nunca se confunde con confirmación.
25. La reanudación de una intención interrumpida queda reservada a ANIMA-UX-012.
26. El CTA es accesible, inequívoco y no depende solo de color para expresar disponibilidad o procesamiento.
27. La experiencia ordinaria no expone detalles técnicos de autorización, geocerca, base de datos o sincronización.
28. La tarea no redefine políticas de geocerca, thresholds, reason codes, permisos, tablas, RPC ni modelo físico de asistencia.
29. No se crean ni modifican requisitos de prueba.
30. No existe materialización física propia.
31. La continuidad queda reservada exclusivamente hacia ANIMA-UX-007.

---

#### 35. Límites

ANIMA-UX-006 no:

- modifica `vento-anima`;
- modifica `vento-shell` fuera de su documentación canónica;
- modifica Supabase;
- crea migraciones, tablas, columnas, vistas, RPC, triggers, Edge Functions, RLS o grants;
- cambia `employee_shifts`;
- cambia `attendance_logs`;
- define el esquema físico de sesiones de asistencia;
- redefine la semántica de turno actual o siguiente;
- redefine horario, sede, área o rol operativo;
- redefine la ventana temporal de un turno;
- redefine radios, precisión, latches o thresholds de geocerca;
- crea una política nueva de permisos del sistema operativo;
- convierte `selectedSiteId` en autoridad;
- autoriza check-in sin turno publicado;
- crea reason codes;
- define copy final de bloqueos;
- define copy final de confirmado o pendiente;
- diseña la cola offline completa;
- diseña la reanudación completa;
- simplifica check-out;
- modifica el catálogo de pantallas;
- cambia navegación física;
- crea componentes;
- modifica el registro de requisitos de prueba;
- ejecuta pruebas con trabajadores reales;
- crea una instancia física.

---

#### 36. Estado de salida documental

La tarea deja especificado un contrato UX de check-in con:

- un turno actual y contexto ya heredados de ANIMA-UX-004/005;
- un único CTA ordinario `Registrar entrada`;
- preflight automático después del toque;
- conservación completa de validaciones autoritativas;
- separación estricta entre sede laboral y punto físico de marcación;
- eliminación conceptual de selección manual de sede como preparación ordinaria;
- eliminación conceptual de actualización manual de ubicación como paso obligatorio previo cuando puede automatizarse;
- tratamiento explícito de permisos del dispositivo como prerequisito excepcional;
- protección contra doble toque y efectos duplicados;
- rechazo del fallback AS-IS de entrada sin turno publicado;
- handoffs cerrados hacia resultado, bloqueos, offline y reanudación;
- frontera explícita con check-out;
- cero nuevos requisitos de prueba;
- cero materialización física durante este cierre.

El estado físico permanece `ESPECIFICADO_NO_MATERIALIZADO`.

---

#### 37. Continuidad

**ÚLTIMA TAREA APROBADA**
`ANIMA-UX-005 — Mostrar sede, área, horario y rol operativo del turno`

**TAREA ACTUAL APROBADA**
`ANIMA-UX-006 — Simplificar el flujo de check-in`

**SIGUIENTE TAREA RESERVADA**
`ANIMA-UX-007 — Simplificar el flujo de check-out`


### ✅ ANIMA-UX-007 — Simplificar el flujo de check-out

**Estado:** APROBADA
**Tarea anterior:** ANIMA-UX-006 — Simplificar el flujo de check-in
**Tarea siguiente:** ANIMA-UX-008 — Mostrar claramente marcación confirmada o pendiente
**Tipo de tarea:** documental; diseño UX TO-BE del flujo personal de check-out en ANIMA para reducir la salida ordinaria a una acción principal sobre una sesión de asistencia activa, conservando intactas la resolución autoritativa de sesión, geocerca, autorización, idempotencia, evidencia y cierre de contexto
**Bloque:** F_ANIMA — EXPERIENCIA DEL TRABAJADOR Y ADMINISTRACION
**Repositorio propietario:** vento-group-sas/vento-shell
**Archivo propietario:** docs/plan-canonico/modular/bloques/F_ANIMA/02_EXPERIENCIA_DEL_TRABAJADOR_Y_ADMINISTRACION.md
**Estado físico resultante:** ESPECIFICADO_NO_MATERIALIZADO
**Cambios físicos autorizados:** ninguno durante esta tarea
**Requisitos de prueba creados o modificados:** 0

---

#### 1. Propósito

Diseñar el flujo TO-BE de check-out de ANIMA para que un trabajador que conserva una sesión personal de asistencia activa pueda registrar su salida mediante una acción principal directa, sin reconstruir manualmente el turno, elegir la sede laboral, preparar una geocerca en una pantalla separada ni repetir información que el sistema ya conoce.

La simplificación se aplica a la interacción humana, no a la autoridad ni a la integridad del cierre.

El flujo debe dejar inequívoco:

1. qué hecho habilita la acción de salida;
2. qué acción ordinaria realiza el trabajador;
3. qué contexto debe reutilizarse de la sesión de asistencia activa;
4. qué validaciones ejecuta ANIMA automáticamente;
5. cuándo hace falta una intervención excepcional;
6. cómo se evita una segunda salida por doble toque, retry o respuesta perdida;
7. qué significa iniciar la salida frente a tenerla confirmada;
8. qué tareas posteriores son propietarias de estados, bloqueos, offline y reanudación.

La tarea no implementa el flujo, no modifica Supabase, no redefine autorización y no decide todavía la presentación final de una marcación confirmada o pendiente.

---

#### 2. Handoff recibido de ANIMA-UX-006

`ANIMA-UX-006` dejó cerradas las reglas de entrada que esta tarea consume sin reabrir:

- la marcación ordinaria debe tener una única acción principal;
- simplificar significa automatizar comprobaciones repetibles, no eliminarlas;
- sede laboral y punto físico de marcación son conceptos distintos;
- el trabajador no reconstruye manualmente turno, sede, área, rol ni identidad;
- un único punto físico elegible se resuelve automáticamente;
- una ambigüedad real entre puntos de marcación puede exigir una selección excepcional sin convertirla en selección de sede laboral;
- la acción se bloquea desde el primer toque para evitar intenciones duplicadas;
- la interfaz no usa un modal genérico de confirmación como paso ordinario;
- permisos del dispositivo se solicitan solo cuando la operación realmente los necesita;
- estado mostrado, autorización y mutación confirmada permanecen separados.

El handoff específico hacia `ANIMA-UX-007` es una **sesión de asistencia activa ya existente**. Desde ese momento la región de acción personal deja de ser propiedad del check-in y pasa a la salida.

---

#### 3. Principio rector

La regla UX aplica a la salida personal las decisiones transversales ya aprobadas en `UX-BASE-007` para reutilizar información existente sin recaptura y en `UX-BASE-008` para reducir pasos de tareas frecuentes sin eliminar controles materiales.

La regla UX queda:

```text
SESIÓN DE ASISTENCIA ACTIVA
+
UNA ACCIÓN PRINCIPAL: REGISTRAR SALIDA
+
VALIDACIONES AUTOMÁTICAS Y AUTORITATIVAS
+
MUTACIÓN IDEMPOTENTE
+
RESULTADO INEQUÍVOCO
=
CHECK-OUT SIMPLE
```

No se considera simplificación válida:

```text
REVISAR TURNO
→ ELEGIR SEDE
→ REVISAR UBICACIÓN
→ ACTUALIZAR UBICACIÓN
→ CONFIRMAR CONTEXTO
→ ABRIR MODAL
→ REGISTRAR SALIDA
```

cuando la sesión activa y las fuentes propietarias permiten resolver automáticamente esos hechos.

La simplificación nunca autoriza:

- cerrar una sesión inexistente;
- vincular la salida a un turno futuro por conveniencia del cliente;
- sustituir la sede laboral por el punto físico de salida;
- omitir una geocerca cuando la política aplicable la exige;
- tratar el toque como confirmación del servidor;
- perder identidad idempotente;
- cerrar autoridad operativa únicamente porque la interfaz cambió de estado local.

---

#### 4. Hecho autoritativo que habilita la salida

La disponibilidad de check-out se deriva de la **sesión personal de asistencia activa resuelta de forma autoritativa**, no de la mera existencia visual de un turno actual.

```text
SESIÓN DE ASISTENCIA ACTIVA Y RESOLUBLE
→ SALIDA PERTINENTE

TURNO VISIBLE SIN SESIÓN ACTIVA
→ NO CREA SALIDA
```

La sesión activa aporta la continuidad necesaria para identificar:

- al trabajador efectivo;
- el check-in que se intenta cerrar;
- la sede operativa asociada a la sesión;
- la referencia del turno utilizada por la entrada cuando exista;
- la evidencia histórica que debe conservarse;
- el contexto cuyo cierre depende de una salida confirmada.

La interfaz puede proyectar ese estado, pero no lo fabrica.

---

#### 5. Independencia frente al fin programado del turno

El fin del horario publicado y el cierre de la sesión de asistencia son hechos distintos.

Un trabajador puede seguir teniendo una entrada activa después de la hora programada de finalización. En ese caso, la experiencia no debe esconder ni bloquear `Registrar salida` únicamente porque el turno ya terminó según programación.

Regla:

```text
FIN PROGRAMADO ALCANZADO
+
SESIÓN DE ASISTENCIA TODAVÍA ACTIVA
→
LA SALIDA SIGUE SIENDO PERTINENTE
```

La programación puede informar que la jornada debía haber terminado, pero no reemplaza el hecho autoritativo de asistencia ni crea por sí sola un check-out.

Esta tarea no define tolerancias, horas extra, redondeos, novedades laborales ni reglas de nómina. Solo evita que el diseño haga imposible cerrar una sesión activa por confundir horario y asistencia.

---

#### 6. Resultado UX objetivo

Para el caso ordinario y resoluble, Home debe permitir una secuencia equivalente a:

```text
JORNADA EN CURSO
[contexto personal relevante]

[ Registrar salida ]

TOQUE ÚNICO
→ validación automática
→ envío de la intención de salida
→ resultado
```

No hace falta volver a abrir `/shifts`, buscar el turno usado al entrar, escoger la sede laboral ni entrar primero a una pantalla técnica de ubicación.

La acción principal puede coexistir con información de contexto y estado, pero ninguna acción secundaria ordinaria debe competir con `Registrar salida`.

---

#### 7. Unidad de interacción

La unidad de esta tarea es una **intención personal de check-out** iniciada por el trabajador efectivo sobre la sesión de asistencia activa que ANIMA resuelve.

La intención debe poder correlacionarse de manera estable con:

- el actor;
- la sesión activa;
- el evento de entrada que originó la sesión;
- la sede operativa de esa sesión;
- el punto físico de salida cuando aplique;
- la evidencia de ubicación cuando la política la exija;
- el instante de la intención;
- una identidad idempotente estable.

La intención no constituye todavía un cierre confirmado.

---

#### 8. Disponibilidad de la acción principal

`Registrar salida` se presenta como acción primaria cuando la proyección vigente indica una sesión personal activa que puede ser objeto de cierre.

La visibilidad no concede autoridad. Al tocar la acción deben revalidarse los hechos necesarios antes del efecto.

La interfaz no utiliza como único criterio:

- que el último botón mostrado fuese `Registrar entrada`;
- que haya un turno en la tarjeta actual;
- que la hora esté dentro del horario programado;
- que exista una sede seleccionada localmente;
- que la geocerca haya estado lista varios minutos antes;
- que el trabajador tenga un rol determinado;
- que una notificación afirme que el turno terminó.

El estado autoritativo de asistencia gobierna la pertinencia de la salida.

---

#### 9. Ausencia de sesión activa

Cuando no existe una sesión de asistencia activa resoluble, ANIMA no presenta `Registrar salida` como una mutación ordinaria ejecutable.

La interfaz no crea una salida sintética a partir de:

- un turno actual sin check-in;
- un turno anterior ya cerrado;
- un próximo turno;
- una notificación de fin de jornada;
- un registro local obsoleto;
- una sede elegida por el trabajador;
- la existencia de contexto de perfil.

La explicación humana de por qué no puede marcar corresponde a `ANIMA-UX-009`; la diferenciación causal entre turno, ubicación y autorización corresponde a `ANIMA-UX-010`.

---

#### 10. Acción primaria: Registrar salida

La acción ordinaria se expresa semánticamente como **Registrar salida**.

Ese verbo representa el hecho empresarial que el trabajador intenta producir. No debe diluirse en una acción genérica como `Marcar`, `Continuar`, `Terminar` o `Actualizar estado` que obligue a inferir si se registrará entrada o salida.

`Terminar turno` puede aparecer como texto explicativo únicamente si no crea una segunda acción ni confunde el cierre de asistencia con la edición del turno programado.

La interfaz debe conservar una sola intención material:

```text
REGISTRAR SALIDA
→ cerrar la sesión de asistencia activa mediante el contrato propietario
```

No significa modificar el horario publicado.

---

#### 11. Preflight automático desde el toque

El toque sobre `Registrar salida` inicia las comprobaciones que puedan resolverse sin pedir pasos previos al trabajador.

Conceptualmente, ANIMA debe poder:

1. refrescar o reconciliar la sesión de asistencia activa cuando sea necesario;
2. recuperar la relación exacta con el check-in que se cerrará;
3. conservar la sede operativa de esa sesión;
4. resolver el punto físico de check-out aplicable;
5. obtener o refrescar ubicación cuando la política lo requiera;
6. validar geocerca y precisión aplicables;
7. revalidar en servidor que la transición siga siendo admisible;
8. crear o reutilizar la identidad idempotente de la intención;
9. enviar la mutación de salida;
10. entregar el resultado a la capa de estado propietaria.

Estas comprobaciones pueden ejecutarse en una operación compuesta o en varias capas físicas futuras. La tarea define la experiencia, no impone una arquitectura de llamadas.

---

#### 12. Orden semántico del cierre

La simplificación no permite invertir autoridad y presentación.

El orden conceptual es:

```text
RESOLVER SESIÓN ACTIVA
→ RESOLVER CONTEXTO DE CIERRE
→ RESOLVER PUNTO FÍSICO SI APLICA
→ OBTENER EVIDENCIA REQUERIDA
→ REVALIDAR
→ ENVIAR INTENCIÓN IDEMPOTENTE
→ RECIBIR O RECONCILIAR RESULTADO
→ PROYECTAR ESTADO
```

No es válido:

```text
CAMBIAR UI A JORNADA CERRADA
→ INTENTAR GUARDAR DESPUÉS
```

como contrato de verdad.

La interfaz puede ofrecer feedback inmediato de que la acción está en curso, pero el significado de confirmada o pendiente queda reservado a la tarea siguiente.

---

#### 13. Reutilización del contexto de la sesión

El trabajador no debe volver a seleccionar ni digitar la información que ya pertenece a la sesión activa.

La salida reutiliza de forma trazable, según el contrato propietario:

- actor;
- identidad de la sesión;
- check-in de origen;
- turno de origen cuando exista;
- sede operativa;
- contexto territorial asociado;
- rol o contexto operativo histórico necesario para trazabilidad.

Reutilizar esos datos no significa mantenerlos como autoridad futura después del cierre. Una salida confirmada invalida el contexto dependiente según el contrato de autorización.

---

#### 14. Sede laboral y punto físico de salida

La **sede laboral u operativa** y el **punto físico de check-out** permanecen separados.

```text
SEDE OPERATIVA
→ pertenece a la sesión y al contexto laboral

PUNTO FÍSICO DE SALIDA
→ indica dónde puede capturarse la evidencia de check-out
```

Aunque ambos identificadores coincidan en algunos casos, la UX no debe convertir uno en alias del otro.

Por tanto:

- el trabajador no elige una nueva sede laboral para salir;
- detectar una ubicación no cambia la sede de la sesión;
- un punto de salida externo no reescribe el turno;
- una geocerca válida no amplía territorio ni permisos;
- una sede operativa válida no elimina la geocerca si la política de salida la exige.

---

#### 15. Un único punto físico aplicable

Cuando la fuente autoritativa determina exactamente un punto físico de check-out aplicable, ANIMA lo resuelve automáticamente.

El trabajador no debe tocar primero `Cambiar sede`, `Elegir sede`, `Seleccionar ubicación` o una acción equivalente para confirmar algo que ya es determinista.

La experiencia puede mostrar el nombre humano del punto cuando sea útil para orientar al trabajador, pero esa presentación no lo convierte en sede laboral.

La acción sigue siendo:

```text
REGISTRAR SALIDA
```

y no:

```text
SELECCIONAR PUNTO
→ REGISTRAR SALIDA
```

cuando solo existe una alternativa válida.

---

#### 16. Varios puntos físicos válidos

Si la política autoritativa admite varios puntos físicos equivalentes y no puede elegir uno de forma segura, la selección es una excepción justificada dentro del flujo de salida.

La interfaz debe nombrar correctamente el concepto, por ejemplo:

- `Punto de marcación`;
- `Punto de salida`;
- otra etiqueta humana definida por el catálogo propietario.

No debe presentarlo como `Cambiar sede` cuando la sede operativa no está cambiando.

La selección excepcional:

- no modifica el turno;
- no modifica área;
- no modifica rol;
- no cambia la sede laboral;
- no concede autorización;
- no elige qué sesión cerrar;
- se limita a resolver la evidencia física requerida para la misma intención de check-out.

---

#### 17. Geocerca y ubicación

La ubicación es una validación de la marcación cuando la política aplicable la exige, no una tarea previa que el trabajador deba completar manualmente en el camino ordinario.

Regla UX:

```text
TOCAR REGISTRAR SALIDA
→ ANIMA VERIFICA UBICACIÓN CUANDO APLICA
```

No se exige por defecto:

```text
TOCAR REVISAR UBICACIÓN
→ ESPERAR ESTADO LISTO
→ TOCAR REGISTRAR SALIDA
```

si el mismo preflight puede obtener evidencia suficientemente fresca.

Una ubicación ya validada y todavía reutilizable según política puede evitar trabajo redundante. Una evidencia vencida o incompatible debe refrescarse, no aceptarse por comodidad.

Esta tarea no define radios, precisión, TTL, número de muestras ni thresholds de geocerca.

---

#### 18. Permisos del dispositivo

Los permisos de ubicación se solicitan únicamente cuando una validación aplicable los necesita y el dispositivo todavía no los concede en el nivel requerido.

No deben convertirse en un paso ritual antes de cada salida.

La UX distingue:

- permiso ya suficiente: continuar sin diálogo;
- permiso faltante y necesario: solicitar en contexto;
- permiso denegado o restringido: entregar el bloqueo a las tareas propietarias de explicación;
- ubicación no requerida por política: no solicitar permiso por rutina.

La tarea no redefine la política móvil de permisos ni el nivel exacto de permiso requerido.

---

#### 19. Sin recaptura de datos ya conocidos

El flujo ordinario no solicita al trabajador volver a introducir:

- nombre o identidad;
- turno;
- fecha de turno;
- hora de entrada;
- sede laboral;
- área;
- rol operativo;
- identificador del check-in;
- motivo genérico de salida;
- datos que la sesión activa ya conserva.

Si una política futura exige una evidencia adicional realmente nueva, deberá pertenecer al contrato propietario y presentarse como tal; no se justifica recapturar el contexto completo.

---

#### 20. Sin confirmación genérica adicional

`Registrar salida` es una acción explícita y suficientemente descriptiva para el caso ordinario. No requiere, por defecto, un modal adicional de tipo:

```text
¿Seguro que deseas registrar tu salida?
```

Ese modal añade fricción sin aportar información nueva cuando el trabajador ya eligió una acción inequívoca.

Una confirmación adicional solo sería justificable si existiera una consecuencia material excepcional que el trabajador no pudiera comprender desde el CTA y el contexto visibles. Esta tarea no crea tal excepción.

---

#### 21. Bloqueo de interacción después del primer toque

Desde que se acepta una intención de salida, la interfaz impide que toques sucesivos equivalentes generen nuevas intenciones concurrentes.

Mientras la misma intención está en curso:

- el CTA no dispara una segunda mutación;
- el feedback indica procesamiento sin afirmar confirmación anticipada;
- volver a tocar no crea otra identidad de evento;
- una re-renderización no libera accidentalmente el bloqueo;
- cambiar de pantalla no debe transformar la misma salida en otra operación.

El bloqueo de interacción es una protección UX. La idempotencia de servidor sigue siendo obligatoria y no puede sustituirse por deshabilitar un botón.

---

#### 22. Identidad idempotente y retries

Cada intención material de salida debe conservar una identidad estable antes del primer envío.

Para la misma intención y el mismo contenido:

```text
RETRY
→ RECUPERAR O REPRODUCIR EL MISMO RESULTADO
→ CERO SEGUNDAS SALIDAS
```

Para la misma identidad con contenido materialmente distinto:

```text
CONFLICTO
→ NO SOBRESCRIBIR
→ NO CREAR OTRA SALIDA
```

Una respuesta perdida después de un commit no autoriza generar una intención nueva. La experiencia debe poder reconciliar el resultado de la intención original.

La estrategia física exacta pertenece a los contratos de asistencia e idempotencia existentes.

---

#### 23. Toque no equivale a salida confirmada

El acto de pulsar `Registrar salida` significa **intención enviada o en proceso**, no prueba de que la sesión ya quedó cerrada autoritativamente.

La frontera es:

```text
TOQUE
≠
CHECK-OUT CONFIRMADO
```

Solo un resultado autoritativo permite afirmar que el cierre se aplicó.

Por tanto, la UX TO-BE no debe adoptar como contrato que actualizar optimistamente el estado local a `checked_out` sea suficiente para declarar jornada cerrada.

La representación exacta de `confirmada` frente a `pendiente` pertenece a `ANIMA-UX-008`.

---

#### 24. Efecto sobre el contexto operativo

Una salida **confirmada** cierra la sesión de asistencia correspondiente y retira el contexto o autoridad operativa que dependa de ella según `ANIMA-AUTH-009`.

La intención local por sí sola no produce esa consecuencia autoritativa.

Regla:

```text
CHECK-OUT CONFIRMADO
→ SESIÓN CERRADA
→ CONTEXTO DEPENDIENTE INVALIDADO

CHECK-OUT SOLO PENDIENTE
→ NO AFIRMAR CIERRE AUTORITATIVO
```

La interfaz no utiliza el próximo turno para reemplazar inmediatamente el contexto de la sesión que todavía está siendo cerrada.

---

#### 25. Frontera con ANIMA-UX-008

`ANIMA-UX-007` diseña **cómo se inicia** una salida simple y segura.

`ANIMA-UX-008` es propietaria de definir cómo se muestra de forma inequívoca si la marcación quedó:

- confirmada;
- pendiente;
- en transición hacia otro estado permitido por sus contratos.

Por tanto, esta tarea no fija todavía:

- copy final de confirmación;
- badges finales;
- animaciones de éxito;
- persistencia visual de una cola pendiente;
- transición completa de tarjeta después del resultado;
- tratamiento final de estados discordantes.

Sí fija que ninguna de esas presentaciones puede declarar `confirmada` solo porque el usuario tocó el CTA.

---

#### 26. Frontera con ANIMA-UX-009 a ANIMA-UX-012

La secuencia posterior conserva ownership estricto:

| Tarea | Responsabilidad recibida desde ANIMA-UX-007 |
| --- | --- |
| `ANIMA-UX-009` | explicar en lenguaje humano por qué una salida no puede ejecutarse o continuar |
| `ANIMA-UX-010` | diferenciar específicamente causas de ubicación, turno/contexto y autorización |
| `ANIMA-UX-011` | diseñar el manejo comprensible de una marcación en cola offline |
| `ANIMA-UX-012` | permitir reanudar una marcación interrumpida sin perder ni duplicar la intención |

`ANIMA-UX-007` entrega a esas tareas una intención de salida con identidad, sesión objetivo y preflight definido, pero no absorbe sus estados ni mensajes finales.

---

#### 27. Recordatorios y reentrada al flujo

Un recordatorio válido de fin de turno o salida puede conducir al trabajador hacia la experiencia de check-out, pero no crea una vía alternativa de mutación.

Al abrir una notificación, ANIMA debe revalidar el estado actual antes de presentar o ejecutar la salida.

```text
NOTIFICACIÓN
→ NAVEGACIÓN / REENTRADA
→ REVALIDACIÓN
→ MISMO FLUJO DE REGISTRAR SALIDA
```

No es válido que una notificación:

- cierre la sesión por sí sola;
- transporte autoridad;
- garantice que todavía exista check-in activo;
- genere un segundo `client_event_id` para la misma intención en curso;
- obligue a cerrar un turno que ya fue cerrado desde otro dispositivo.

La auditoría de recordatorios, su momento, contenido, cobertura y completitud pertenece a `ANIMA-UX-016`.

---

#### 28. Relación con Home y `/shifts`

Home es la superficie ordinaria para ejecutar la salida personal.

`/shifts` conserva la programación personal y puede servir como destino informativo o de navegación, pero consultar un turno no debe convertirse en requisito previo para cerrar una sesión activa.

Si un acceso desde `/shifts`, una notificación u otra superficie conduce al check-out, debe converger en la misma intención autoritativa y no mantener lógica paralela de salida.

La misma sesión activa no puede tener una definición de cierre en Home y otra diferente en `/shifts`.

---

#### 29. Actor gerencial dentro del carril personal

Una persona con atribuciones administrativas que usa su carril personal de ANIMA cierra **su propia sesión de asistencia** con las mismas reglas de interacción.

La acción de salida no se convierte en:

- cierre de la jornada de terceros;
- corrección administrativa;
- cierre masivo;
- aprobación de asistencia;
- sustitución del actor efectivo.

Las capacidades administrativas permanecen separadas por `ANIMA-UX-003` y por los contratos de autorización correspondientes.

---

#### 30. Auditoría del AS-IS y drift identificado

El código vigente demuestra que ANIMA ya posee piezas importantes del flujo, pero no todas coinciden con el contrato TO-BE:

1. el handler de Home usa una acción genérica que decide entre `checkIn()` y `checkOut()` según el estado local `isCheckedIn`;
2. el CTA actual muestra `Registrar salida` cuando la asistencia local aparece activa;
3. la habilitación actual del CTA depende de una geocerca previamente `ready`, lo que puede convertir `Revisar ubicación` en paso previo visible;
4. el check-out actual recupera el último check-in efectivo y conserva su `site_id` y `shift_id` como contexto de cierre;
5. el flujo actual puede resolver geocerca de salida antes de construir el payload;
6. el código actual aplica una actualización optimista de asistencia antes de conocer el resultado final del insert remoto;
7. el envío remoto del checkout se ejecuta después de esa actualización optimista;
8. el recordatorio de salida existente navega actualmente a `/shifts`.

El contrato TO-BE conserva la reutilización de la sesión activa, el bloqueo de acción, la geocerca aplicable y la identidad idempotente, pero rechaza como semántica canónica:

- que la salida sea solo la otra mitad de un toggle genérico;
- que el trabajador deba preparar manualmente la geocerca cuando puede resolverse desde el CTA;
- que cambiar el estado local equivalga a confirmación;
- que una notificación cree un camino de mutación separado.

La materialización física de estas diferencias permanece diferida.

---

#### 31. Matriz de escenarios de aceptación UX

| Escenario | Resultado esperado |
| --- | --- |
| Sesión activa, contexto resoluble y punto de salida único | Mostrar `Registrar salida`; un toque inicia preflight automático y la intención de cierre. |
| Hora programada de fin ya pasó, pero el check-in sigue activo | Mantener la salida disponible; no bloquear solo por horario vencido. |
| Existe turno visible pero nunca hubo check-in | No fabricar un checkout ni una sesión a cerrar. |
| Próximo turno ya está publicado mientras la sesión anterior sigue activa | Cerrar la sesión activa original; no vincular la salida al próximo turno. |
| Punto físico de salida coincide con la sede operativa | Resolverlo sin selección manual redundante. |
| Punto físico de salida es distinto de la sede operativa | Usar el punto autorizado sin renombrarlo como sede laboral ni reescribir el turno. |
| Existen varios puntos físicos equivalentes y no hay resolución determinista | Pedir selección excepcional de punto de marcación, sin cambiar sede, área, rol ni sesión. |
| Geocerca exigida y evidencia fresca reutilizable | Continuar sin exigir otro paso manual innecesario. |
| Geocerca exigida y evidencia vencida | Refrescar desde el flujo; no aceptar evidencia obsoleta por conveniencia. |
| Geocerca no exigida por política | No solicitar ubicación como ritual. |
| Permiso de ubicación faltante y necesario | Solicitarlo en contexto de la acción. |
| Doble toque inmediato | Crear una sola intención material y mantener bloqueada la segunda interacción. |
| Respuesta se pierde después del commit | Reconciliar la intención original; no crear una segunda salida. |
| Mismo identificador llega con contenido diferente | Tratar como conflicto; no sobrescribir ni duplicar. |
| Salida todavía pendiente de confirmación | No afirmar que la jornada está cerrada autoritativamente. |
| Salida confirmada | Permitir a la capa siguiente proyectar cierre confirmado e invalidación del contexto dependiente. |
| Recordatorio de fin de turno abre la app | Revalidar y converger en el mismo flujo de salida. |
| La sesión fue cerrada en otro dispositivo antes de tocar el recordatorio | No ofrecer una segunda salida ejecutable después de reconciliar. |
| Actor gerencial en carril personal | Cerrar únicamente su propia sesión, sin controles administrativos mezclados. |

---

#### 32. Requisitos de prueba derivados

**NO GENERA REQUISITOS DE PRUEBA.**

Requisitos creados: **0**
Requisitos modificados: **0**
Requisitos diferidos: **0**
Requisitos descartados: **0**
Requisitos obsoletos: **0**

La cobertura vigente ya protege acción principal inequívoca, contexto autoritativo, separación entre turno y check-in, estado confirmado frente a pendiente, idempotencia, pérdida de conectividad, revalidación, accesibilidad y flujo operativo mínimo. Esta tarea concreta esas obligaciones para la salida personal de ANIMA sin introducir una obligación material de prueba nueva.

---

#### 33. Cobertura de prueba vigente reutilizada

Se reutilizan sin modificación:

- `TREQ-UX-001` — acción principal y estado identificables sin capacitación extensa;
- `TREQ-UX-002` — recuperación humana y segura sin duplicar efectos;
- `TREQ-UX-003` — información y acciones adecuadas al actor y su autorización;
- `TREQ-UX-005` — fuente de verdad y diferencia entre confirmado y pendiente;
- `TREQ-UX-006` — comportamiento ante interrupciones y distinción de estados de resiliencia;
- `TREQ-UX-009` — contexto operativo resuelto desde hechos autoritativos;
- `TREQ-UX-037` — distinción entre sin turno, sin check-in, sin contexto y otros estados;
- `TREQ-UX-059` — separación entre relevancia, visibilidad, habilitación y autoridad;
- `TREQ-UX-060` — relevancia derivada de hechos autoritativos, no del frontend;
- `TREQ-UX-063` — capa operativa centrada en tarea, estado, bloqueo y acción;
- `TREQ-UX-073` — invalidación y revalidación ante cambios de check-in o contexto;
- `TREQ-UX-081` — turno programado, turno vigente, check-in activo y contexto activo como hechos distintos;
- `TREQ-UX-083` — transiciones autoritativas sin presentar estado activo antes del receipt;
- `TREQ-UX-195` — capa inicial operativa enfocada en contexto y acción relevante;
- `TREQ-ANIMA-003` — persistencia durable e idempotencia para marcaciones offline;
- `TREQ-ANIMA-015` — separación en Home entre asistencia, geocerca, sede, conectividad, cola y sincronización, sin presentar como aplicada una marcación pendiente o fallida.

Esta enumeración es trazabilidad hacia cobertura ya registrada y no modifica el registro canónico de requisitos.

---

#### 34. Evidencia de validación

| Clase | Estado | Evidencia |
| --- | --- | --- |
| BUILD | NOT_EXECUTED | No se ejecutó build del repositorio ni de la aplicación durante el desarrollo documental. |
| LOCAL | PASS | El artefacto se verificó estructuralmente como una sola tarea, con metadata obligatoria, secciones consecutivas, cero requisitos derivados, evidencia completa, continuidad cerrada y formato textual estable. |
| REMOTA | PASS | Se verificaron en GitHub la continuidad vigente, la topología DEFINE_ONCE, ANIMA-UX-006 aprobada, ANIMA-AUTH-009, el código actual de Home y checkout, el recordatorio de salida, los fragmentos 04A aplicables, package.json y el preflight documental. |
| OPERATIVA | PASS | La matriz cubre salida ordinaria, fin programado ya alcanzado, ausencia de check-in, próximo turno, punto físico distinto, ambigüedad de puntos, geocerca, permisos, doble toque, respuesta perdida, pending, recordatorio y actor gerencial en carril personal. |
| FÍSICA | NOT_APPLICABLE | ANIMA-UX-007 está gobernada por DEFINE_ONCE y no crea una instancia física propia ni autoriza cambios de código, Supabase, navegación, datos o despliegue. |

---

#### 35. Criterios de aceptación

1. La acción ordinaria de salida se denomina `Registrar salida` y representa una única mutación material.
2. La pertinencia de salida se deriva de una sesión personal de asistencia activa, no únicamente de un turno visible.
3. Un turno visible sin check-in activo no genera una salida sintética.
4. Un próximo turno no sustituye la sesión que se intenta cerrar.
5. El fin programado del turno no oculta la salida mientras continúe una sesión activa que deba cerrarse.
6. Home permite iniciar la salida sin obligar a consultar previamente `/shifts`.
7. El trabajador no vuelve a seleccionar sede laboral, área, rol, turno ni identidad para salir.
8. La sede operativa se conserva desde la sesión y permanece separada del punto físico de check-out.
9. Un punto físico único se resuelve automáticamente.
10. Varios puntos físicos realmente equivalentes pueden requerir una selección excepcional correctamente etiquetada.
11. Elegir un punto físico no cambia sede, área, rol, turno ni sesión.
12. La geocerca se valida automáticamente desde la acción cuando la política la exige.
13. No se exige un paso manual separado de `Revisar ubicación` cuando el preflight puede resolverlo.
14. Una evidencia de ubicación vencida no se reutiliza silenciosamente.
15. Si la política no requiere ubicación, la UX no la solicita por rutina.
16. Los permisos del dispositivo se solicitan solo cuando son necesarios para continuar.
17. El flujo ordinario no incorpora un modal genérico adicional de confirmación.
18. El primer toque bloquea intenciones equivalentes posteriores mientras la acción está en curso.
19. El bloqueo visual no sustituye la idempotencia de servidor.
20. Un retry de la misma intención reutiliza su identidad estable.
21. Una respuesta perdida después del commit se reconcilia sin crear una segunda salida.
22. Una misma identidad con contenido distinto produce conflicto y no sobrescritura.
23. Tocar `Registrar salida` no se presenta como check-out confirmado.
24. Solo una salida confirmada permite afirmar el cierre autoritativo de la sesión y del contexto dependiente.
25. Una salida pendiente no se usa para declarar autoridad ya cerrada.
26. La presentación de confirmada o pendiente queda en ANIMA-UX-008.
27. Los mensajes de bloqueo quedan en ANIMA-UX-009.
28. La diferenciación de causas queda en ANIMA-UX-010.
29. La cola offline queda en ANIMA-UX-011.
30. La reanudación de una marcación interrumpida queda en ANIMA-UX-012.
31. Un recordatorio converge en el mismo flujo y revalida estado antes de ofrecer o ejecutar la salida.
32. El diseño de recordatorios permanece reservado a ANIMA-UX-016.
33. Una persona gerencial en carril personal solo cierra su propia sesión.
34. El AS-IS optimista no se canoniza como confirmación autoritativa.
35. No se crean ni modifican requisitos de prueba.
36. No existe materialización física propia.
37. La continuidad queda reservada exclusivamente hacia ANIMA-UX-008.

---

#### 36. Límites y estado de salida documental

ANIMA-UX-007 no:

- modifica `vento-anima`;
- modifica `vento-shell` fuera de la documentación de esta tarea;
- modifica Supabase;
- crea migraciones, tablas, vistas, funciones, RPC, triggers, Edge Functions o RLS;
- cambia el esquema físico de asistencia;
- redefine la semántica de `employee_shifts`;
- redefine ventanas de programación;
- define horas extra, tolerancias, redondeos o nómina;
- redefine radios, precisión, TTL o thresholds de geocerca;
- cambia la política de permisos del dispositivo;
- decide el copy final de confirmación o pending;
- diseña mensajes finales de bloqueo;
- clasifica todavía el error visible por ubicación, turno o autorización;
- diseña la cola offline;
- diseña la reanudación completa de una marcación interrumpida;
- modifica recordatorios de inicio o fin de turno;
- define cierres administrativos de asistencia;
- habilita checkout para terceros;
- convierte el próximo turno en contexto de cierre;
- convierte un punto físico en sede laboral;
- declara confirmada una salida únicamente por estado optimista local;
- modifica el registro de requisitos de prueba;
- crea una instancia física.

La tarea deja especificado un contrato de check-out personal con:

- sesión activa como hecho de pertinencia;
- disponibilidad de salida incluso después del fin programado mientras la sesión siga activa;
- CTA único `Registrar salida`;
- preflight automático;
- reutilización del contexto de la sesión;
- separación entre sede operativa y punto físico de salida;
- resolución automática de un único punto;
- selección excepcional solo ante ambigüedad real;
- geocerca integrada al flujo cuando aplica;
- cero recaptura de contexto conocido;
- bloqueo de doble toque;
- identidad idempotente y retry seguro;
- separación entre intención, pending y confirmación;
- cierre de contexto únicamente después de confirmación autoritativa;
- convergencia de recordatorios y accesos alternos hacia una sola mutación propietaria;
- handoff exacto hacia la presentación de marcación confirmada o pendiente.

El estado físico permanece `ESPECIFICADO_NO_MATERIALIZADO`.

---

#### 37. Continuidad

**ÚLTIMA TAREA APROBADA**
`ANIMA-UX-006 — Simplificar el flujo de check-in`

**TAREA ACTUAL APROBADA**
`ANIMA-UX-007 — Simplificar el flujo de check-out`

**SIGUIENTE TAREA RESERVADA**
`ANIMA-UX-008 — Mostrar claramente marcación confirmada o pendiente`


### ✅ ANIMA-UX-008 — Mostrar claramente marcación confirmada o pendiente

**Estado:** APROBADA
**Tarea anterior:** ANIMA-UX-007 — Simplificar el flujo de check-out
**Tarea siguiente:** ANIMA-UX-009 — Explicar por qué no se puede marcar
**Tipo de tarea:** documental; diseño UX TO-BE del estado visible de las marcaciones personales de entrada y salida en ANIMA para distinguir procesamiento, pendiente de confirmación, confirmación autoritativa y resultado todavía no confirmado sin convertir proyecciones optimistas, cola offline o pérdida de respuesta en autoridad de asistencia
**Bloque:** F_ANIMA — EXPERIENCIA DEL TRABAJADOR Y ADMINISTRACION
**Repositorio propietario:** vento-group-sas/vento-shell
**Archivo propietario:** docs/plan-canonico/modular/bloques/F_ANIMA/02_EXPERIENCIA_DEL_TRABAJADOR_Y_ADMINISTRACION.md
**Estado físico resultante:** ESPECIFICADO_NO_MATERIALIZADO
**Cambios físicos autorizados:** ninguno durante esta tarea
**Requisitos de prueba creados o modificados:** 0

---

#### 1. Propósito

Definir cómo ANIMA debe mostrar el resultado de una marcación personal para que el trabajador pueda responder sin ambigüedad una pregunta elemental:

```text
¿MI ENTRADA O MI SALIDA YA QUEDÓ CONFIRMADA?
```

La experiencia debe impedir que una actualización local, un spinner terminado, una vibración de éxito, una intención guardada en el dispositivo, una cola offline o una respuesta perdida se interpreten como confirmación autoritativa cuando el sistema todavía no puede demostrarla.

El contrato cubre tanto check-in como check-out y recibe los flujos simplificados definidos por las dos tareas anteriores. No rediseña cómo se inicia la marcación; define cómo se representa su estado después de iniciar la intención y mientras se alcanza o no una confirmación segura.

La tarea debe dejar inequívoco:

1. qué significa que una marcación esté en procesamiento;
2. qué significa que esté pendiente de confirmación;
3. qué evidencia permite llamarla confirmada;
4. cómo se representa un resultado cuyo efecto todavía no puede determinarse;
5. cómo cambia la presentación del estado general de asistencia según la certeza disponible;
6. cómo impedir una segunda marcación mientras la primera siga sin resolución segura;
7. qué información visible acompaña el estado sin exponer detalles técnicos innecesarios;
8. qué responsabilidades se entregan a las tareas posteriores de bloqueo, clasificación causal, cola offline y recuperación.

---

#### 2. Handoff recibido de ANIMA-UX-006 y ANIMA-UX-007

`ANIMA-UX-006` y `ANIMA-UX-007` dejan a esta tarea una intención de marcación ya iniciada bajo estas reglas:

- check-in y check-out ordinarios tienen una acción principal explícita;
- la acción se bloquea desde el primer toque para evitar intenciones duplicadas;
- cada intención material debe conservar identidad idempotente estable;
- las comprobaciones resolubles se ejecutan automáticamente;
- sede laboral y punto físico de marcación permanecen separados;
- tocar el CTA no equivale a una mutación confirmada;
- una respuesta perdida después de un posible commit debe reconciliarse antes de repetir;
- una salida solo cierra autoritativamente la sesión y el contexto dependiente después de confirmación;
- una entrada solo puede utilizarse como hecho autoritativo de asistencia después de confirmación.

Por tanto, la unidad recibida por `ANIMA-UX-008` no es un botón, sino una **intención de entrada o salida cuya certeza de resultado debe hacerse visible**.

---

#### 3. Principio rector

La regla principal queda:

```text
ESTADO VISUAL
DEBE EXPRESAR
EL NIVEL REAL DE CERTEZA DEL RESULTADO
```

Y, por contraste:

```text
FEEDBACK OPTIMISTA
≠ CONFIRMACIÓN

INTENCIÓN LOCAL
≠ CONFIRMACIÓN

COLA OFFLINE
≠ CONFIRMACIÓN

RESPUESTA PERDIDA
≠ OPERACIÓN FALLIDA

TOQUE DEL CTA
≠ MARCACIÓN APLICADA
```

ANIMA puede ofrecer feedback inmediato para que la interacción se sienta responsiva, pero ese feedback no puede cambiar el significado empresarial de la asistencia.

---

#### 4. Fuente de verdad de la confirmación

Una marcación solo puede presentarse como **confirmada** cuando existe evidencia autoritativa suficiente de que la misma intención fue aplicada.

La evidencia puede provenir, según el contrato físico que se materialice posteriormente, de:

- una respuesta autoritativa de la mutación;
- un receipt estable;
- la lectura reconciliada del registro de asistencia;
- la recuperación idempotente del resultado de la misma intención;
- otra proyección autoritativa expresamente definida por los contratos propietarios.

La interfaz no usa como prueba de confirmación:

- el valor local de `attendanceState.status` por sí solo;
- la finalización de una animación;
- una vibración o feedback háptico;
- que la petición haya sido enviada;
- que exista `client_event_id`;
- que el evento haya sido guardado localmente;
- que exista conectividad aparente;
- que el CTA se haya deshabilitado;
- que haya desaparecido un spinner;
- que una tarjeta haya cambiado optimistamente de texto.

La fuente de verdad de la confirmación no se fabrica en la capa de presentación.

---

#### 5. Modelo conceptual de estados visibles

Esta tarea define un modelo **documental de presentación**, no un enum físico, reason code, contrato de API ni esquema de base de datos.

La experiencia debe poder distinguir, como mínimo:

| Estado conceptual | Significado humano | Puede mostrarse como aplicada |
| --- | --- | --- |
| `PROCESSING` | La intención acaba de iniciarse y ANIMA está ejecutando o esperando su operación inmediata. | No. |
| `PENDING_CONFIRMATION` | La intención está preservada o aceptada para continuar, pero ANIMA todavía no puede demostrar que el efecto autoritativo fue aplicado. | No. |
| `CONFIRMED` | La misma intención tiene evidencia autoritativa o reconciliada de aplicación. | Sí. |
| `UNKNOWN_OUTCOME` | La operación pudo haber sido aplicada, pero el cliente todavía no puede demostrar ni descartar su efecto. | No. |
| `NOT_CONFIRMED` | Existe evidencia suficiente de que la intención no quedó aplicada o requiere otra resolución. | No. |

`NOT_CONFIRMED` es una clase perceptible de resultado, no una explicación causal. El motivo concreto se entrega a las tareas posteriores.

---

#### 6. Transición perceptible normal

El camino ordinario esperado es:

```text
ACCIÓN DE MARCACIÓN
→ PROCESSING
→ CONFIRMED
```

Cuando la operación no puede confirmarse inmediatamente, puede pasar a:

```text
PROCESSING
→ PENDING_CONFIRMATION
```

Cuando hubo pérdida de respuesta o incertidumbre que impide saber si existió efecto:

```text
PROCESSING
→ UNKNOWN_OUTCOME
→ RECONCILIACIÓN
→ CONFIRMED O NOT_CONFIRMED
```

Una transición hacia `PENDING_CONFIRMATION` no requiere que el trabajador vuelva a ejecutar la misma marcación. El estado indica precisamente que existe una intención todavía por resolver.

---

#### 7. Estado PROCESSING

`PROCESSING` es el feedback inmediato después de aceptar el primer toque y antes de clasificar el resultado.

La presentación puede usar lenguaje como:

- `Registrando entrada...`;
- `Registrando salida...`.

Durante este estado:

- no se afirma éxito;
- no se afirma que la jornada ya inició o terminó;
- no se ofrece una segunda marcación equivalente;
- no se cambia la autoridad operativa por un efecto visual;
- la identidad de la intención permanece estable;
- un cambio de pantalla no autoriza crear otra intención.

`PROCESSING` debe ser transitorio. Si la operación deja de tener una respuesta inmediata, la UX debe clasificarla en el estado de certeza que corresponda en lugar de mantener un spinner indefinido.

---

#### 8. Estado PENDING_CONFIRMATION

`PENDING_CONFIRMATION` significa:

```text
EXISTE UNA INTENCIÓN IDENTIFICABLE Y PRESERVADA
+
TODAVÍA NO EXISTE PRUEBA SUFICIENTE DE APLICACIÓN AUTORITATIVA
```

En una contingencia offline, la interfaz solo puede afirmar que la marcación quedó pendiente después de que la intención haya sido preservada durablemente conforme al contrato de cola aplicable.

En otros modelos físicos futuros, un backend podría reconocer una operación como aceptada pero todavía no finalizada. También en ese caso el significado visual sigue siendo pendiente, no confirmada.

La palabra `pendiente` debe referirse al resultado de **esa entrada o esa salida**, no únicamente a un contador genérico de sincronización.

---

#### 9. Estado CONFIRMED

`CONFIRMED` significa que ANIMA puede demostrar que la intención material correspondiente fue aplicada por la fuente autoritativa o recuperada como aplicada mediante reconciliación segura.

La presentación debe identificar el hecho humano:

- `Entrada confirmada`;
- `Salida confirmada`.

Una vez confirmado, el estado general puede reflejar la consecuencia empresarial que corresponda:

```text
ENTRADA CONFIRMADA
→ JORNADA / SESIÓN DE ASISTENCIA ACTIVA SEGÚN CONTRATO

SALIDA CONFIRMADA
→ JORNADA / SESIÓN DE ASISTENCIA CERRADA SEGÚN CONTRATO
```

La confirmación no depende de que el evento haya sido reciente ni de que la pantalla siga abierta. Si la aplicación se reabre, la proyección autoritativa debe poder reconstruir el resultado sin depender de un toast efímero.

---

#### 10. Estado UNKNOWN_OUTCOME

`UNKNOWN_OUTCOME` se usa cuando ANIMA no puede afirmar ni que la intención quedó aplicada ni que no quedó aplicada.

Caso típico:

```text
SE ENVÍA LA MUTACIÓN
→ EL SERVIDOR PUEDE HABER HECHO COMMIT
→ SE PIERDE LA RESPUESTA
→ EL CLIENTE NO CONOCE EL RESULTADO
```

En ese caso no es correcto mostrar:

- `Falló, vuelve a marcar`;
- `No se registró`;
- `Entrada confirmada`;
- `Salida confirmada`.

La interfaz debe comunicar que **todavía no pudo confirmar el resultado** y evitar otra mutación equivalente hasta reconciliar o concluir de forma segura el intento original.

La experiencia completa de recuperación pertenece a `ANIMA-UX-012`.

---

#### 11. Estado NOT_CONFIRMED

`NOT_CONFIRMED` representa la salida perceptible cuando existe evidencia suficiente para no presentar la intención como aplicada y el caso ya no debe permanecer indefinidamente como pendiente o desconocido.

Puede corresponder, según contratos propietarios, a:

- rechazo autoritativo;
- conflicto;
- precondición que cambió;
- agotamiento seguro de un intento que nunca fue aplicado;
- otra resolución inequívoca no exitosa.

Esta tarea no define el reason code, el texto causal ni la recuperación específica. Entrega esos aspectos a `ANIMA-UX-009`, `ANIMA-UX-010`, `ANIMA-UX-011` o `ANIMA-UX-012` según el caso.

La regla que sí fija es:

```text
NO CONFIRMADA
≠ PENDIENTE PARA SIEMPRE
≠ CONFIRMADA
```

---

#### 12. Regla crítica: intención no es autoridad

La interfaz debe conservar tres planos distintos:

```text
INTENCIÓN
→ lo que el trabajador solicitó

ESTADO DE ENTREGA / PROCESAMIENTO
→ qué sabe ANIMA sobre esa intención

ESTADO AUTORITATIVO DE ASISTENCIA
→ qué efecto empresarial está confirmado
```

No se permite colapsarlos en una sola variable visual.

Una intención de check-in pendiente no crea por sí misma un check-in autoritativo.

Una intención de check-out pendiente no cierra por sí misma la sesión autoritativa.

---

#### 13. Entrada pendiente de confirmación

Cuando una entrada está pendiente:

- la superficie principal debe mostrar explícitamente `Entrada pendiente de confirmación` o una formulación humana semánticamente equivalente;
- no debe mostrar `En turno` o `Registro activo` como si el check-in estuviera confirmado;
- no debe ofrecer una segunda entrada equivalente;
- no debe conceder visualmente contexto operativo que dependa de un check-in confirmado;
- puede mostrar la hora de la intención si se etiqueta como hora de intento o marcación pendiente;
- puede mostrar que ANIMA continuará intentando o reconciliando únicamente cuando esa política sea verdadera.

La interfaz puede conservar el turno programado visible, pero debe distinguir programación de asistencia confirmada.

---

#### 14. Salida pendiente de confirmación

Cuando una salida está pendiente:

- la superficie principal debe mostrar explícitamente `Salida pendiente de confirmación` o una formulación humana equivalente;
- no debe mostrar `Jornada cerrada` o `Listo por hoy` como hecho confirmado;
- no debe ofrecer una segunda salida equivalente;
- no debe afirmar que el servidor ya cerró la sesión;
- no debe afirmar que el contexto operativo dependiente ya fue invalidado por la salida;
- puede mostrar la hora de la intención si queda claramente diferenciada de una hora confirmada.

La experiencia debe soportar que, durante ese intervalo, la fuente autoritativa todavía conserve la sesión activa aunque el trabajador ya haya solicitado cerrarla.

---

#### 15. Entrada confirmada

Cuando existe confirmación autoritativa o reconciliada de entrada, ANIMA puede proyectar de forma coherente:

- `Entrada confirmada`;
- hora efectiva de la entrada cuando la fuente autoritativa la provea;
- estado de jornada activa cuando corresponda;
- contexto personal derivado de la sesión confirmada;
- siguiente acción relevante, que normalmente pasa a ser la salida cuando los demás contratos la permitan.

La confirmación puede ser resultado del primer intento online o de una reconciliación posterior. Para el trabajador, ambas rutas convergen en el mismo hecho empresarial confirmado.

---

#### 16. Salida confirmada

Cuando existe confirmación autoritativa o reconciliada de salida, ANIMA puede proyectar:

- `Salida confirmada`;
- hora efectiva de la salida cuando la fuente autoritativa la provea;
- jornada cerrada cuando corresponda;
- ausencia de una sesión activa derivada de ese check-in;
- invalidación del contexto dependiente según los contratos de autorización.

La confirmación puede llegar después de que el trabajador haya abandonado la pantalla o recuperado conectividad. La UX debe poder converger posteriormente al mismo estado confirmado sin exigir una nueva salida.

---

#### 17. El estado principal no puede contradecir la marcación

La jerarquía visual debe evitar mensajes simultáneos incompatibles.

Ejemplos prohibidos:

```text
JORNADA CERRADA
+
SALIDA PENDIENTE DE SINCRONIZACIÓN
```

cuando `JORNADA CERRADA` se presenta como hecho confirmado.

También es inválido:

```text
EN TURNO
+
ENTRADA PENDIENTE DE CONFIRMACIÓN
```

cuando `EN TURNO` implica un check-in autoritativo.

Si existe una intención material pendiente, el estado principal de asistencia debe expresar la incertidumbre o pendiente con suficiente prominencia para no ser eclipsado por una proyección optimista.

---

#### 18. El contador genérico de cola es secundario

Un contador como `1 pendiente`, `PEND 1` o `Registros pendientes: 1` puede ser útil como indicador transversal, pero no responde por sí solo qué marcación está sin confirmar.

La experiencia debe permitir distinguir al menos:

- entrada pendiente;
- salida pendiente;
- cantidad adicional de operaciones en cola cuando corresponda.

El indicador global de cola es complementario. El resultado específico de la marcación debe aparecer asociado al contexto de asistencia que afecta.

Esta tarea no diseña la administración completa de la cola; esa responsabilidad permanece en `ANIMA-UX-011`.

---

#### 19. Copy humano mínimo

La capa visible debe privilegiar frases que expresen el hecho y su certeza.

Familia objetivo para entrada:

```text
Registrando entrada...
Entrada pendiente de confirmación
Entrada confirmada
No pudimos confirmar todavía el resultado de tu entrada
Entrada no confirmada
```

Familia objetivo para salida:

```text
Registrando salida...
Salida pendiente de confirmación
Salida confirmada
No pudimos confirmar todavía el resultado de tu salida
Salida no confirmada
```

Los textos definitivos de causa y recuperación pertenecen a las tareas posteriores. Esta tarea fija la semántica de certeza que esos mensajes deben conservar.

No se usan como único resultado frases ambiguas como:

- `Listo`;
- `Guardado`;
- `Hecho`;
- `Procesado`;
- `Registro completado`;
- `Se enviará`.

Cada una puede ocultar si el dato solo existe localmente o ya fue confirmado.

---

#### 20. Qué significa “guardado”

Si la interfaz usa la palabra `guardado`, debe indicar dónde y con qué efecto.

Ejemplos semánticamente válidos según el caso:

```text
INTENCIÓN GUARDADA EN ESTE DISPOSITIVO
→ PENDIENTE DE CONFIRMACIÓN
```

```text
MARCACIÓN CONFIRMADA POR EL SISTEMA
→ CONFIRMED
```

No es válido usar `Registro guardado` como sinónimo indistinto de ambos estados.

La persistencia durable local es una garantía importante de recuperación, pero no es la fuente de verdad del efecto empresarial.

---

#### 21. Timestamps y certeza temporal

La UX debe diferenciar el instante de la intención del instante o valor efectivo confirmado cuando no sean la misma cosa.

Una intención pendiente puede mostrar, por ejemplo:

```text
Salida solicitada a las 18:07
Pendiente de confirmación
```

sin convertir esa hora local en `Salida: 18:07` confirmada.

Después de reconciliar, la superficie usa el tiempo efectivo autorizado por la fuente de asistencia y evita preservar una etiqueta de pendiente que ya quedó superada.

Esta tarea no redefine reglas de redondeo, zona horaria, nómina ni el valor físico de `occurred_at`; solo exige que la presentación no atribuya certeza inexistente al timestamp.

---

#### 22. Persistencia perceptible del resultado

El resultado no puede depender exclusivamente de un toast, vibración, animación o texto que desaparece a los pocos segundos.

Después de que termine el estado de procesamiento, el trabajador debe poder seguir identificando si su última intención relevante está:

- pendiente;
- confirmada;
- todavía sin resultado determinable;
- no confirmada y necesitada de la salida correspondiente.

La proyección puede compactarse al navegar o pasar el tiempo, pero no debe perder la semántica antes de que el estado haya quedado reconciliado.

---

#### 23. Acciones durante una marcación pendiente

Mientras una entrada o salida equivalente siga pendiente o con resultado desconocido:

- no se ofrece el mismo CTA como si nada hubiera ocurrido;
- no se crea un nuevo `client_event_id` por impaciencia del usuario;
- un botón de consulta o sincronización no se etiqueta como nueva marcación;
- las acciones seguras de recuperación se delegan a sus contratos propietarios;
- la UX conserva suficiente contexto para indicar qué operación está esperando resolución.

Una acción de `Sincronizar ahora`, cuando exista por política de cola, actúa sobre la intención existente y no crea otra entrada o salida.

---

#### 24. Pérdida de conectividad

La ausencia de red no convierte automáticamente una marcación en pendiente.

Para mostrar `Pendiente de confirmación` en un caso offline, primero debe existir evidencia de que la intención se preservó de acuerdo con la política aplicable.

Si el cliente pierde conectividad antes de poder demostrar que la intención quedó durablemente preservada o que el servidor la recibió, la experiencia no inventa una garantía.

La política exacta de cola, backoff, sincronización y reintento pertenece a `ANIMA-UX-011` y a los contratos técnicos correspondientes.

---

#### 25. Respuesta perdida y reconciliación

Una respuesta perdida exige tratar por separado el estado del canal y el estado del efecto.

```text
NO HAY RESPUESTA
≠ NO HUBO COMMIT
```

Mientras el resultado sea incierto:

- no se repite ciegamente la mutación con una nueva identidad;
- no se dice `No se registró` sin evidencia;
- no se dice `Confirmada` sin evidencia;
- se conserva la identidad original para consultar o reconciliar;
- al recuperar el resultado, la presentación converge a confirmado o no confirmado.

La experiencia detallada de reanudación y recuperación pertenece a `ANIMA-UX-012`.

---

#### 26. Reconciliación después de reinicio o cambio de pantalla

Si la aplicación se suspende, se cierra o cambia de superficie durante una intención no resuelta, volver a Home no debe reiniciar la historia visual desde un estado falso de disponibilidad.

La proyección debe poder reconocer, según la evidencia disponible:

- intención todavía pendiente;
- resultado ya confirmado mientras la pantalla no estaba activa;
- resultado todavía desconocido;
- resultado no confirmado.

El trabajador no necesita recordar manualmente qué botón había tocado para que ANIMA pueda recuperar la misma intención.

---

#### 27. Coherencia entre Home, resumen e historial

Las superficies que presenten la misma marcación no pueden asignarle niveles de certeza incompatibles.

Si Home muestra `Salida pendiente de confirmación`, un resumen local no debe decir `Jornada cerrada` como hecho autoritativo por esa misma salida.

Si el historial propietario contiene únicamente eventos confirmados, la intención pendiente no se inserta allí como si ya fuera un registro autoritativo. Home puede mostrar la intención local separadamente hasta que exista reconciliación.

Si una futura superficie decide representar también pendientes, debe etiquetarlos con la misma semántica y no mezclarlos con eventos confirmados.

---

#### 28. Accesibilidad de los estados

La diferencia entre pendiente y confirmado no puede depender solo de:

- color;
- icono;
- animación;
- opacidad;
- posición visual;
- vibración.

Cada estado material debe tener una etiqueta textual o semántica accesible suficiente para que una persona pueda conocer la certeza de su marcación sin distinguir colores ni interpretar símbolos.

La lectura por tecnologías asistivas debe conservar al menos:

- tipo de marcación: entrada o salida;
- estado: procesando, pendiente, confirmada, no confirmada o resultado aún desconocido;
- acción segura disponible cuando corresponda.

---

#### 29. Uso de color e iconografía

Color e iconografía pueden reforzar la comprensión, pero son señales secundarias.

La UX evita usar el mismo tratamiento visual de éxito para:

- una intención apenas aceptada;
- una marcación pendiente;
- una confirmación autoritativa.

Una marca de éxito, check gráfico o tratamiento equivalente queda reservado a un estado que semánticamente pueda interpretarse como confirmado.

Un spinner representa procesamiento, no confirmación.

Un indicador de nube, conectividad o sincronización representa transporte o contingencia, no sustituye el texto de estado de la marcación.

---

#### 30. Actor gerencial dentro del carril personal

Una persona con atribuciones administrativas que usa su experiencia personal debe recibir las mismas garantías de certeza para sus propias marcaciones.

Su rol no permite:

- transformar una entrada pendiente en confirmada localmente;
- cerrar visualmente su jornada antes de la confirmación;
- tratar controles administrativos como mecanismo de reconciliación de su propia marcación;
- ocultar el estado pendiente por disponer de más permisos.

La separación entre experiencia personal y administrativa definida previamente permanece intacta.

---

#### 31. Auditoría del AS-IS y drift identificado

El código vigente de ANIMA ya expone piezas relacionadas con pending, sincronización y estado general, pero mantiene contradicciones que esta tarea no canoniza:

1. `applyOptimisticAttendanceUpdate` proyecta inmediatamente un check-in como `checked_in` antes de una confirmación autoritativa cuando la operación queda en cola;
2. la misma función proyecta inmediatamente un check-out como `checked_out`, cierra visualmente el tramo y actualiza la salida antes de conocer el resultado remoto;
3. el flujo actual de check-out aplica la actualización optimista y feedback háptico de éxito antes de ejecutar `insertAttendanceLogWithRetry`;
4. el insert remoto de check-out se ejecuta en segundo plano y la función puede devolver `success: true` antes de conocer si el servidor confirmó, encoló o rechazó finalmente el intento;
5. si el envío de check-out falla y luego entra en cola, ese cambio puede ocurrir después de que el caller ya recibió éxito;
6. `useHomeAttendanceView` deriva `En turno / Registro activo` y `Jornada cerrada / Listo por hoy` directamente del estado local de asistencia;
7. por ello una entrada solo pendiente puede aparentar `En turno` y una salida todavía no confirmada puede aparentar `Jornada cerrada`;
8. Home sí tiene indicadores de cola y sincronización, pero pueden coexistir con el estado principal optimista;
9. `PendingSyncCard` muestra un conteo genérico de registros pendientes, no identifica por sí solo si la operación material es entrada o salida;
10. el handler de Home solo activa feedback reciente de cola cuando el resultado inmediato devuelve `queued`, condición que no describe necesariamente la cola creada posteriormente por el checkout en segundo plano.

El contrato TO-BE conserva:

- identidad idempotente;
- persistencia durable cuando aplique;
- cola y reconciliación;
- feedback inmediato;
- estados de sincronización.

Pero rechaza como semántica canónica:

```text
ESTADO OPTIMISTA LOCAL
→ PRESENTAR COMO ASISTENCIA CONFIRMADA
```

La materialización de estas diferencias permanece fuera de esta tarea documental.

---

#### 32. Matriz de escenarios de aceptación UX

| Escenario | Resultado esperado |
| --- | --- |
| Entrada online recibe confirmación autoritativa inmediata | Mostrar `Entrada confirmada` y permitir que el estado general refleje sesión activa. |
| Salida online recibe confirmación autoritativa inmediata | Mostrar `Salida confirmada` y permitir que el estado general refleje jornada cerrada. |
| Entrada acaba de enviarse y todavía está en vuelo | Mostrar procesamiento, no `En turno` confirmado. |
| Salida acaba de enviarse y todavía está en vuelo | Mostrar procesamiento, no `Jornada cerrada` confirmada. |
| Entrada se preserva durablemente para sincronización posterior | Mostrar entrada pendiente de confirmación; no ofrecer otra entrada. |
| Salida se preserva durablemente para sincronización posterior | Mostrar salida pendiente de confirmación; no afirmar cierre autoritativo ni ofrecer otra salida. |
| Se pierde la respuesta y puede haber existido commit | Mostrar resultado todavía no confirmado y reconciliar la misma intención. |
| Reconciliación descubre que el evento sí fue aplicado | Converger a confirmado sin crear una segunda marcación. |
| Reconciliación demuestra que la intención no fue aplicada | Dejar de mostrar pendiente y entregar el caso a la experiencia de explicación o recuperación. |
| La cola contiene una entrada pendiente y otros registros | El estado específico identifica la entrada; el contador general puede coexistir como información secundaria. |
| La cola contiene una salida pendiente | El estado específico identifica la salida y evita `Listo por hoy` como hecho confirmado. |
| Home se vuelve a abrir mientras existe una intención pendiente | Recuperar su estado; no volver a presentar el CTA equivalente como disponible. |
| La marcación se confirma mientras Home está fuera de foco | Al reconciliar, Home converge a confirmado sin depender del feedback transitorio original. |
| Hora local de intención existe pero falta confirmación | Puede mostrarse como hora solicitada o pendiente, no como hora confirmada sin etiqueta. |
| Home tiene estado pendiente y el historial solo contiene confirmados | Mantener la intención separada; no insertarla visualmente como registro confirmado. |
| Usuario no distingue colores | El texto y la semántica accesible permiten saber si está pendiente o confirmada. |
| Usuario usa lector de pantalla | La lectura anuncia tipo de marcación y nivel de certeza. |
| Actor gerencial marca su propia asistencia | Recibe las mismas reglas de pending y confirmación que cualquier trabajador en carril personal. |
| Check-out optimista local cambia a `checked_out` antes del servidor | La UI TO-BE no usa ese hecho local como prueba suficiente de cierre. |
| Check-in optimista local cambia a `checked_in` por cola offline | La UI TO-BE no usa ese hecho local como prueba suficiente de entrada confirmada. |

---

#### 33. Requisitos de prueba derivados

**NO GENERA REQUISITOS DE PRUEBA.**

Requisitos creados: **0**
Requisitos modificados: **0**
Requisitos diferidos: **0**
Requisitos descartados: **0**
Requisitos obsoletos: **0**

La cobertura canónica vigente ya protege la visibilidad del estado, la separación entre pendiente y confirmado, la fuente de verdad, la recuperación sin duplicación, la persistencia offline y la prohibición de presentar como aplicada una marcación pendiente o fallida. Esta tarea concreta esas obligaciones para la presentación personal de entrada y salida en ANIMA sin introducir una obligación de prueba material nueva.

---

#### 34. Cobertura de prueba vigente reutilizada

Se reutilizan sin modificación:

- `TREQ-UX-001` — la superficie operativa debe hacer identificables la tarea actual, la acción principal y el estado del proceso;
- `TREQ-UX-002` — un fallo o bloqueo debe explicar el estado preservado y permitir recuperación sin duplicar efectos;
- `TREQ-UX-005` — la interfaz debe hacer visible la fuente de verdad y distinguir estado confirmado de pendiente;
- `TREQ-UX-006` — las tareas críticas deben distinguir pendiente, confirmado, fallido, conflicto y necesidad de intervención ante contingencias;
- `TREQ-UX-009` — el contexto operativo no puede fabricarse desde estado local o preferencias de presentación;
- `TREQ-ANIMA-003` — una marcación offline solo puede presentarse como encolada después de persistencia durable y debe conservar identidad idempotente estable;
- `TREQ-ANIMA-015` — Home debe separar asistencia, geocerca, selección de sede, conectividad, cola, sincronización y diagnóstico, y no presentar como aplicada una marcación pendiente o fallida.

La enumeración anterior documenta cobertura ya registrada y no representa modificación del registro canónico de requisitos.

---

#### 35. Handoff a ANIMA-UX-009 y ANIMA-UX-010

Cuando el resultado sea `NOT_CONFIRMED`, bloqueado, rechazado o requiera intervención, esta tarea entrega el estado de certeza sin absorber la explicación causal.

`ANIMA-UX-009 — Explicar por qué no se puede marcar` es propietaria de convertir el impedimento en una explicación humana que indique qué ocurrió y qué puede hacerse.

`ANIMA-UX-010 — Diferenciar error de ubicación, turno y autorización` es propietaria de conservar causas materialmente distintas y evitar mensajes genéricos que mezclen contexto, geocerca y autorización.

El handoff conserva:

- tipo de marcación;
- identidad de la intención cuando exista;
- nivel de certeza del resultado;
- estado preservado conocido;
- referencia segura necesaria para recuperación.

No entrega autoridad para reclasificar una operación pendiente como confirmada.

---

#### 36. Handoff a ANIMA-UX-011 y ANIMA-UX-012

`ANIMA-UX-011 — Diseñar manejo comprensible de cola offline` recibe los casos en los que una intención se conserva para sincronización posterior y deberá definir la experiencia detallada de cola, reintentos, progreso, conflicto y sincronización.

`ANIMA-UX-012 — Permitir reanudar una marcación interrumpida` recibe los casos de pérdida de respuesta, suspensión, cierre de app, navegación o interrupción donde debe recuperarse la misma intención sin duplicarla.

Esta tarea les impone una frontera común:

```text
RECUPERAR O SINCRONIZAR
NO PUEDE CAMBIAR EL SIGNIFICADO DE CONFIRMACIÓN
```

Hasta que exista evidencia autoritativa, la marcación continúa siendo pendiente o no confirmada según el caso.

---

#### 37. Evidencia de validación

| Clase | Estado | Evidencia |
| --- | --- | --- |
| BUILD | NOT_EXECUTED | No se ejecutó build de `vento-shell` ni de `vento-anima`; la tarea es especificación documental y no autoriza cambios compilables. |
| LOCAL | PASS | El artefacto fue comprobado estructuralmente como una sola tarea, con cabecera completa, secciones numeradas consecutivamente, cero requisitos derivados, cinco clases de evidencia, continuidad cerrada, UTF-8 sin BOM, LF y ausencia de contenido operativo reservado al chat. |
| REMOTA | PASS | Se contrastaron en GitHub protocolo, contrato de entrega, manifest, continuidad, ruta, topología, políticas, owner, tareas 006 y 007, contratos ANIMA de asistencia, fragmentos 04A, `package.json`, validadores documentales y el código vigente de asistencia, Home y cola de `vento-anima`. |
| OPERATIVA | NOT_EXECUTED | No se ejecutó ANIMA en dispositivo ni se observó a trabajadores reales; la validación de comprensión y comportamiento en operación permanece para las tareas y gates de prueba correspondientes. |
| FÍSICA | NOT_APPLICABLE | `ANIMA-UX-008` está gobernada por `DEFINE_ONCE`; no crea instancia física propia ni autoriza cambios de código, Supabase, navegación, datos o despliegue. |

---

#### 38. Criterios de aceptación

1. La UX distingue explícitamente procesamiento, pendiente de confirmación, confirmado, resultado desconocido y no confirmado sin tratarlos como sinónimos.
2. Los nombres conceptuales definidos en esta tarea se reconocen como modelo documental de presentación y no como enum físico obligatorio.
3. Tocar `Registrar entrada` o `Registrar salida` no se presenta como confirmación.
4. Un estado optimista local no constituye prueba suficiente de aplicación autoritativa.
5. Una vibración, animación o spinner completado no constituye prueba suficiente de aplicación.
6. Una intención offline solo se presenta como pendiente cuando su preservación requerida está demostrada.
7. Una intención pendiente no se presenta como aplicada.
8. Una entrada pendiente no hace que Home declare `En turno` como hecho confirmado.
9. Una salida pendiente no hace que Home declare `Jornada cerrada` o `Listo por hoy` como hecho confirmado.
10. Mientras una intención equivalente esté pendiente o tenga resultado desconocido, no se ofrece una segunda marcación como camino ordinario.
11. `Sincronizar ahora`, cuando exista, actúa sobre la intención existente y no crea una marcación nueva.
12. Una respuesta perdida no se interpreta automáticamente como fallo ni como éxito.
13. Una respuesta perdida conserva la identidad original para reconciliación.
14. Una reconciliación que descubre la misma intención aplicada converge a confirmado sin duplicar el evento.
15. Una reconciliación que demuestra no aplicación deja de presentar el caso como pendiente indefinido.
16. `Entrada confirmada` requiere evidencia autoritativa o reconciliada de aplicación.
17. `Salida confirmada` requiere evidencia autoritativa o reconciliada de aplicación.
18. Solo una salida confirmada permite presentar la sesión como autoritativamente cerrada por esa marcación.
19. Solo una entrada confirmada puede usarse como hecho autoritativo de presencia cuando los contratos dependientes así lo requieran.
20. El estado específico de entrada o salida tiene prioridad semántica sobre un contador genérico de cola.
21. El contador de pendientes puede coexistir como información secundaria sin reemplazar la explicación de qué marcación está pendiente.
22. El copy visible identifica el tipo de marcación y su certeza.
23. `Guardado` no se usa sin aclarar si corresponde a persistencia local o confirmación autoritativa.
24. El timestamp de una intención pendiente no se presenta como hora confirmada sin etiqueta que preserve la incertidumbre.
25. El resultado material persiste perceptiblemente más allá de un toast o feedback háptico transitorio.
26. Home, resumen e historial no atribuyen niveles incompatibles de certeza a la misma marcación.
27. Una intención pendiente no se inserta visualmente como registro confirmado en una superficie que represente solo hechos autoritativos.
28. La diferencia entre pending y confirmed no depende solo de color, icono, animación u opacidad.
29. La semántica accesible identifica entrada/salida y nivel de certeza.
30. Un actor gerencial en su carril personal conserva las mismas reglas de certeza para su propia asistencia.
31. El AS-IS que cambia `attendanceState` optimistamente no se canoniza como fuente de confirmación.
32. El AS-IS de check-out que devuelve éxito antes de conocer el resultado remoto no se canoniza como prueba de salida confirmada.
33. La cola genérica actual puede conservarse como componente auxiliar futuro, pero no sustituye el estado específico de la marcación.
34. Las causas y explicaciones de un resultado no confirmado se entregan a ANIMA-UX-009 y ANIMA-UX-010.
35. La experiencia detallada de cola offline se entrega a ANIMA-UX-011.
36. La reanudación de resultado incierto o interacción interrumpida se entrega a ANIMA-UX-012.
37. No se crean ni modifican requisitos de prueba.
38. No existe materialización física propia.
39. La continuidad queda reservada exclusivamente hacia ANIMA-UX-009.

---

#### 39. Límites y estado de salida documental

ANIMA-UX-008 no:

- modifica `vento-anima`;
- modifica `vento-shell` fuera de la documentación de esta tarea;
- modifica Supabase;
- crea migraciones, tablas, vistas, funciones, RPC, triggers, RLS, Realtime, Storage, Edge Functions o cron;
- define el schema físico de una cola;
- crea enums físicos de estado;
- crea reason codes;
- cambia el contrato de `client_event_id`;
- redefine idempotencia;
- redefine qué servidor o función persiste asistencia;
- redefine geocercas ni permisos del dispositivo;
- redefine ventanas de turno;
- concede autoridad operativa desde estado local;
- diseña la explicación final de bloqueos;
- clasifica definitivamente causas de ubicación, turno o autorización;
- diseña la cola offline completa;
- diseña el algoritmo de backoff o retry;
- diseña la reanudación completa de una interacción interrumpida;
- modifica historial, Home, tarjetas o navegación físicamente;
- define pruebas con trabajadores reales;
- modifica el registro de requisitos de prueba;
- crea una instancia física.

La tarea deja especificado un contrato de presentación donde:

- el nivel visible de certeza sigue a la evidencia real;
- pending y confirmed son materialmente distintos;
- processing no se confunde con éxito;
- pérdida de respuesta no se confunde con no ejecución;
- una entrada pendiente no concede visualmente presencia confirmada;
- una salida pendiente no declara jornada cerrada;
- la confirmación exige autoridad o reconciliación de la misma intención;
- el indicador específico de entrada o salida tiene prioridad sobre un contador genérico;
- timestamps, accesibilidad y superficies relacionadas conservan la semántica de certeza;
- los casos causales, offline y de recuperación continúan con propietarios posteriores definidos.

El estado físico permanece `ESPECIFICADO_NO_MATERIALIZADO`.

---

#### 40. Continuidad

**ÚLTIMA TAREA APROBADA**
`ANIMA-UX-007 — Simplificar el flujo de check-out`

**TAREA ACTUAL APROBADA**
`ANIMA-UX-008 — Mostrar claramente marcación confirmada o pendiente`

**SIGUIENTE TAREA RESERVADA**
`ANIMA-UX-009 — Explicar por qué no se puede marcar`


### ✅ ANIMA-UX-009 — Explicar por qué no se puede marcar

**Estado:** APROBADA
**Tarea anterior:** ANIMA-UX-008 — Mostrar claramente marcación confirmada o pendiente
**Tarea siguiente:** ANIMA-UX-010 — Diferenciar error de ubicación, turno y autorización
**Tipo de tarea:** documental; diseño UX TO-BE del contrato de explicación humana cuando una marcación personal de entrada o salida no puede ejecutarse, continuar o confirmarse, preservando estado de certeza, causa estructurada, recuperación segura, idempotencia, accesibilidad y fronteras con clasificación causal, offline y reanudación
**Bloque:** F_ANIMA — EXPERIENCIA DEL TRABAJADOR Y ADMINISTRACION
**Repositorio propietario:** vento-group-sas/vento-shell
**Archivo propietario:** docs/plan-canonico/modular/bloques/F_ANIMA/02_EXPERIENCIA_DEL_TRABAJADOR_Y_ADMINISTRACION.md
**Estado físico resultante:** ESPECIFICADO_NO_MATERIALIZADO
**Cambios físicos autorizados:** ninguno durante esta tarea
**Requisitos de prueba creados o modificados:** 0

---

#### 1. Propósito

Definir cómo debe explicar ANIMA, en lenguaje humano y accionable, por qué una persona no puede registrar o completar una entrada o una salida cuando el sistema ya conoce un impedimento material.

La explicación debe permitir que el trabajador comprenda, sin interpretar códigos técnicos:

1. qué marcación intentaba realizar;
2. qué ocurrió o qué condición impide continuar;
3. qué estado de asistencia sigue siendo cierto;
4. qué información o intención quedó preservada;
5. qué puede hacer ahora sin arriesgar una marcación duplicada;
6. qué condición debe cambiar para volver a intentar cuando corresponda;
7. quién o qué proceso puede resolver el impedimento cuando la persona no puede hacerlo;
8. qué referencia puede conservarse para soporte o auditoría cuando sea necesaria.

La tarea no redefine las reglas que permiten o impiden una marcación. Define su traducción perceptible y segura para el trabajador.

---

#### 2. Handoff recibido de ANIMA-UX-008

`ANIMA-UX-008` separó el nivel de certeza de la marcación de su causa.

Esta tarea consume sin reabrir los estados conceptuales ya definidos:

- procesamiento;
- pendiente de confirmación;
- confirmada;
- resultado desconocido;
- no confirmada.

Una marcación `NOT_CONFIRMED`, bloqueada, rechazada o que requiere intervención necesita una explicación humana, pero el estado de certeza no constituye por sí mismo la causa.

Regla de continuidad:

```text
ESTADO DE CERTEZA
+
CAUSA ESTRUCTURADA
+
ESTADO PRESERVADO
+
RECUPERACION SEGURA
=
EXPLICACION HUMANA
```

No es válido:

```text
NOT_CONFIRMED
=
"OCURRIO UN ERROR"
```

porque una misma falta de confirmación puede provenir de causas materialmente diferentes y exigir acciones distintas.

---

#### 3. Principio rector

La explicación visible no es una fuente de lógica.

ANIMA debe mantener separados:

```text
HECHO EMPRESARIAL
DECISION DE AUTORIZACION
ESTADO DE ASISTENCIA
CAUSA ESTRUCTURADA
ESTADO DE CERTEZA
POLITICA DE RECUPERACION
MENSAJE HUMANO
```

El mensaje humano se deriva de los anteriores y nunca los sustituye.

La regla UX queda:

```text
CAUSA VERIFICADA
+
CONTEXTO SEGURO
+
EFECTO SOBRE LA MARCACION
+
ESTADO PRESERVADO
+
SIGUIENTE ACCION SEGURA
=
EXPLICACION COMPRENSIBLE
```

---

#### 4. Ámbito de aplicación

El contrato aplica cuando una persona, dentro del carril personal de ANIMA:

- intenta `Registrar entrada`;
- intenta `Registrar salida`;
- llega a Home con un impedimento conocido que hace no ejecutable la marcación pertinente;
- recibe un resultado que demuestra que la marcación no quedó confirmada;
- vuelve a la aplicación y el impedimento continúa vigente;
- necesita saber por qué la acción permanece bloqueada después de una revalidación.

También aplica cuando una superficie secundaria conduce de vuelta a la misma marcación personal.

No convierte historial, programación de turnos, diagnóstico técnico o administración en superficies paralelas para explicar la misma mutación.

---

#### 5. Unidad de explicación

La unidad es un **impedimento material de una intención de asistencia concreta**.

La explicación debe quedar correlacionada, cuando las fuentes lo permitan, con:

- actor efectivo;
- tipo de marcación esperado: entrada o salida;
- intención o evento lógico cuando ya existe;
- sesión de asistencia cuando la salida apunta a una sesión;
- contexto laboral relevante;
- estado de certeza;
- causa estructurada;
- estado preservado;
- acción de recuperación permitida;
- instante o versión relevantes;
- referencia segura de soporte cuando corresponda.

La explicación no necesita mostrar todos esos datos al trabajador. La correlación existe para que el texto visible sea correcto y auditable.

---

#### 6. Cuándo debe aparecer una explicación

La explicación aparece cuando existe información suficiente para afirmar que la persona **no puede continuar normalmente** con la marcación o que una marcación intentada **no puede presentarse como confirmada**.

Ejemplos conceptuales:

- falta una condición necesaria antes de enviar;
- una validación requerida no puede completarse;
- el servidor rechaza la transición;
- la realidad cambió y la intención ya no puede aplicarse como estaba;
- una dependencia técnica impide determinar un resultado seguro;
- la acción no está permitida bajo el contexto efectivo;
- una intervención externa o de otro responsable es necesaria.

La interfaz no espera a que el trabajador repita la misma acción varias veces para explicar un bloqueo que ya conoce.

---

#### 7. Cuándo no debe presentarse como bloqueo

No todo estado distinto de confirmación es un bloqueo.

No se presenta como `no se puede marcar` cuando:

- la acción está normalmente en procesamiento;
- una intención quedó durablemente en cola y sigue dentro de su flujo esperado;
- la misma intención está siendo sincronizada;
- el resultado ya está confirmado;
- el sistema todavía está realizando una comprobación automática dentro de una latencia razonable;
- existe un resultado desconocido que primero debe reconciliarse y todavía no permite afirmar fallo.

Regla:

```text
PENDIENTE
!=
FALLIDA

PROCESANDO
!=
BLOQUEADA

RESULTADO DESCONOCIDO
!=
NO EJECUTADA
```

---

#### 8. Identificación de la marcación afectada

Cuando el sistema conoce la intención, la explicación debe nombrar el efecto humano exacto:

- `entrada`;
- `salida`.

Debe preferirse:

```text
No pudimos registrar tu entrada
No pudimos completar tu salida
```

sobre:

```text
No se pudo registrar
No se pudo completar la acción
Marcación inválida
```

Si el estado está realmente en conflicto y no puede determinarse con seguridad si corresponde entrada o salida, ANIMA no inventa una de las dos. Primero debe revalidar o declarar que no puede determinar la marcación aplicable.

---

#### 9. Preguntas mínimas que debe resolver

Una explicación completa responde proporcionalmente a estas preguntas:

| Pregunta | Obligación UX |
| --- | --- |
| ¿Qué intentaba hacer? | Nombrar entrada o salida cuando se conoce. |
| ¿Qué impide continuar? | Expresar la condición humana sin código técnico. |
| ¿Qué quedó igual? | Indicar el estado de asistencia que no cambió cuando sea material. |
| ¿Se guardó algo? | Distinguir nada guardado, intención local preservada, estado incierto o servidor confirmado. |
| ¿Qué puedo hacer ahora? | Dar una acción concreta y segura cuando exista. |
| ¿Puedo reintentar? | Ofrecerlo solo si repetir es seguro. |
| ¿Qué debe cambiar? | Indicar la condición observable de desbloqueo cuando exista. |
| ¿Quién lo resuelve? | Nombrar el responsable funcional cuando el trabajador no puede resolverlo. |
| ¿Cómo lo reporto? | Conservar una referencia segura cuando soporte o auditoría la necesiten. |

La presentación puede compactar información de baja relevancia, pero no puede omitir un dato necesario para evitar una acción incorrecta.

---

#### 10. Contrato conceptual de presentación

La futura materialización debe poder representar, de forma equivalente, información como:

```ts
type AttendanceBlockingExplanation = {
  marking_target: "CHECK_IN" | "CHECK_OUT" | "UNRESOLVED";
  presentation_category:
    | "BLOCKED"
    | "DENIED"
    | "WAITING"
    | "CONFLICT"
    | "TECHNICAL_FAILURE"
    | "VALIDATION_REQUIRED";
  certainty_state: string;
  human_title: string;
  human_summary: string;
  preserved_state: string;
  primary_recovery_action: string | null;
  secondary_recovery_actions: string[];
  resolver_type: string | null;
  review_condition: string | null;
  correlation_reference: string | null;
};
```

Esta forma es documental y no crea un tipo físico, enum público, tabla, columna, RPC, reason code ni payload obligatorio.

Los valores visibles se derivarán de contratos propietarios existentes.

---

#### 11. Título humano

El título debe describir el efecto sobre la persona y su tarea.

Patrones válidos:

- `No puedes registrar tu entrada todavía`;
- `No pudimos completar tu salida`;
- `Tu entrada necesita una validación antes de continuar`;
- `Tu salida cambió mientras la estábamos procesando`;
- `Todavía no podemos confirmar tu marcación`.

No se consideran títulos suficientes:

- `Error`;
- `Error de asistencia`;
- `No se pudo registrar`;
- `P0001`;
- `RLS denied`;
- `RPC failed`;
- `Constraint violation`;
- `Network request failed`.

---

#### 12. Causa segura

La explicación debe traducir una causa estructurada a lenguaje humano sin exponer detalles internos innecesarios.

La causa visible debe:

- describir la condición que afecta al trabajador;
- conservar la distinción entre condición corregible, espera, denegación, conflicto y fallo técnico;
- evitar nombres de tablas, funciones, políticas o excepciones;
- evitar afirmar una causa más específica que la evidencia disponible;
- mantenerse compatible con el estado de certeza de la marcación.

Si la fuente solo demuestra un fallo técnico no clasificado, ANIMA no inventa una causa empresarial.

---

#### 13. Estado preservado

La explicación debe indicar qué ocurrió con la información o el efecto material cuando esa distinción cambia la decisión del trabajador.

Estados humanos admisibles, según evidencia:

- no se registró ningún cambio de asistencia;
- la intención quedó guardada en este dispositivo y sigue pendiente;
- el servidor confirmó la marcación;
- el sistema todavía no puede confirmar si la marcación fue aplicada;
- la intención entró en conflicto y no produjo un segundo efecto;
- la marcación ya había sido aplicada y se recuperó el mismo resultado.

Nunca se afirma `no se guardó` solo porque no llegó una respuesta.

Nunca se afirma `se registró` solo porque cambió el estado local.

---

#### 14. Acción siguiente

Toda explicación debe ofrecer una acción siguiente solo cuando sea segura y ejecutable por el actor actual.

Una acción de recuperación puede consistir en:

- completar una condición faltante que pertenece al trabajador;
- volver a validar un hecho;
- refrescar el estado;
- esperar una condición explícita;
- abrir la superficie propietaria que realmente resuelve el impedimento;
- solicitar revisión al responsable funcional;
- consultar el estado de una intención existente;
- recuperar el resultado de la misma identidad.

La acción no puede ofrecer un bypass, cambio de rol, sustitución de actor ni selección de contexto falsa.

---

#### 15. Regla de reintento

`Reintentar` no es la respuesta universal.

Solo se ofrece cuando:

1. la causa puede ser transitoria;
2. repetir la operación es seguro;
3. la intención inexistente puede crearse una sola vez o la intención existente puede reutilizar su identidad;
4. el sistema conoce qué estado quedó preservado;
5. no existe un resultado desconocido que deba reconciliarse primero;
6. no existe un conflicto que requiera refrescar o resolver contexto;
7. la política de backoff o nueva comprobación permite el intento.

No es válido:

```text
CONFLICTO
→ REINTENTAR AUTOMATICAMENTE HASTA QUE PASE
```

ni:

```text
RESULTADO DESCONOCIDO
→ CREAR OTRA MARCACION
```

---

#### 16. Responsable de resolución

Cuando el trabajador no puede resolver directamente el impedimento, la explicación debe identificar una clase funcional de responsable solo si el contrato permite determinarla.

Puede ser, según el caso:

- la persona o proceso que administra la condición laboral aplicable;
- el responsable operativo correspondiente;
- soporte técnico;
- un proceso automático de sincronización o reconciliación.

No se usa `Contacta al administrador` como respuesta universal.

Si el responsable exacto todavía no puede demostrarse, la UX no inventa un cargo; ofrece una vía segura de soporte o revisión que conserve el contexto.

---

#### 17. Condición de revisión o espera

Cuando el bloqueo sea temporal o dependa de otra acción, la explicación debe indicar qué condición permite revisar de nuevo.

Ejemplos conceptuales:

```text
CUANDO TERMINE LA VALIDACION
CUANDO LA CONEXION SEA ESTABLE
DESPUES DE ACTUALIZAR EL ESTADO
CUANDO EL RESPONSABLE CORRIJA LA CONDICION
```

No se promete un tiempo que el sistema no controla.

La interfaz puede refrescar automáticamente el estado y retirar la explicación cuando la condición deje de existir.

---

#### 18. Referencia para soporte y auditoría

Una explicación que requiera soporte puede mostrar una referencia segura y corta correlacionada con la evidencia técnica o empresarial.

La referencia:

- no reemplaza el mensaje humano;
- no concede acceso;
- no expone secretos;
- no contiene datos sensibles innecesarios;
- no obliga al trabajador a copiar trazas técnicas;
- permite a soporte localizar la misma situación.

La aplicación no muestra stack traces, SQL, políticas RLS, payloads completos, tokens ni coordenadas crudas como referencia humana.

---

#### 19. Bloqueo, denegación, espera y validación

Esta tarea aplica la taxonomía transversal existente sin crear una taxonomía paralela.

A nivel perceptible:

| Clase | Lectura humana |
| --- | --- |
| `BLOCKED` | La marcación puede ser pertinente, pero falta una condición obligatoria. |
| `DENIED` | La operación no está permitida bajo el contexto efectivo. |
| `WAITING` | La marcación depende normalmente de una condición, evento o actor todavía pendiente. |
| `VALIDATION_REQUIRED` | Falta una comprobación o dato que puede completarse sin fabricar autoridad. |
| `CONFLICT` | La realidad cambió y la intención ya no puede aplicarse silenciosamente como estaba. |
| `TECHNICAL_FAILURE` | Una dependencia técnica impide completar o demostrar el resultado con seguridad. |

La clase interna no tiene que mostrarse literalmente al trabajador.

---

#### 20. Resultado desconocido

Un resultado desconocido requiere un tratamiento especial.

La explicación debe indicar:

- que el sistema todavía no puede confirmar el resultado;
- que la marcación no debe repetirse a ciegas;
- que se está consultando o debe consultarse la misma intención;
- qué estado de asistencia puede afirmarse mientras se reconcilia.

No debe decir:

```text
No se registró. Intenta nuevamente.
```

si existe posibilidad material de que el commit ya haya ocurrido.

---

#### 21. Conflicto

Un conflicto no es un simple fallo de red ni un permiso para repetir.

Cuando la intención encuentra una realidad incompatible:

- ANIMA conserva la intención y la evidencia aplicables;
- refresca o reconcilia el estado;
- explica que la situación cambió;
- evita sobrescribir silenciosamente;
- evita una segunda marcación;
- dirige a la resolución propietaria cuando haga falta intervención.

El copy final puede especializarse más adelante, pero la semántica de conflicto debe permanecer distinta de `reintento automático`.

---

#### 22. Fallo técnico

Ante un fallo técnico concluyente, la explicación debe separar:

- qué dependencia no pudo completar la operación a nivel humano;
- si la intención llegó o no a preservarse;
- si existe posibilidad de efecto remoto;
- si es seguro volver a intentar;
- qué continúa disponible.

No se debe convertir `500`, `timeout`, `fetch failed`, `Supabase`, `Postgres` o un nombre de RPC en el mensaje principal.

Un fallo técnico no se traduce automáticamente a un bloqueo empresarial.

---

#### 23. Cola durable y marcación pendiente

Una marcación durablemente encolada no se presenta como `No se pudo registrar`.

Si la intención ya fue preservada conforme al contrato offline:

```text
INTENCION DURABLE
+
SIN CONFIRMACION REMOTA
=
MARCACION PENDIENTE
```

La presentación principal pertenece al estado de certeza definido por `ANIMA-UX-008` y el diseño detallado de cola pertenece a `ANIMA-UX-011`.

UX-009 interviene solo si la cola entra en un estado que requiere explicación o intervención humana.

---

#### 24. Frontera con ubicación, turno/contexto y autorización

`ANIMA-UX-009` define la estructura común de explicación.

No define todavía el catálogo final que determina si un impedimento concreto pertenece a:

- ubicación o evidencia física;
- turno o contexto laboral;
- autorización.

Esa diferenciación corresponde exclusivamente a `ANIMA-UX-010`.

Por tanto, esta tarea no crea frases canónicas finales del tipo:

```text
ERROR_DE_UBICACION
ERROR_DE_TURNO
ERROR_DE_AUTORIZACION
```

ni reason codes nuevos para esas familias.

Sí exige que la arquitectura de mensaje pueda recibir la causa estructurada sin colapsarlas en un único texto genérico.

---

#### 25. Sede laboral, punto físico y geocerca

Las explicaciones no pueden reintroducir la confusión corregida por las tareas anteriores.

Debe mantenerse separado:

```text
SEDE LABORAL / OPERATIVA
PUNTO FISICO DE MARCACION
EVIDENCIA DE UBICACION
GEOFENCE / POLITICA FISICA
```

Un mensaje no debe pedir `Cambiar sede` si el problema real es un punto físico de marcación y la sede laboral no está cambiando.

Tampoco debe sugerir que una ubicación válida concede rol, turno o autorización.

La clasificación final de una causa de ubicación permanece en `ANIMA-UX-010`.

---

#### 26. Botón no ejecutable con explicación visible

Una acción relevante que está bloqueada no puede aparecer únicamente como un botón deshabilitado sin explicación.

La superficie debe hacer comprensible:

1. cuál acción sería pertinente;
2. por qué no puede ejecutarse ahora;
3. qué puede hacer la persona para continuar cuando exista una recuperación.

No se exige mantener siempre un CTA deshabilitado. Puede sustituirse por una presentación de estado cuando esa composición sea más clara, siempre que no desaparezca la tarea que la persona intenta completar.

---

#### 27. Relación entre estado principal y mensaje de bloqueo

El mensaje de bloqueo no debe competir con el estado principal de asistencia ni contradecirlo.

Ejemplos:

```text
ENTRADA NO CONFIRMADA
+
EXPLICACION DE BLOQUEO
```

es coherente.

```text
JORNADA CERRADA
+
NO PUDIMOS REGISTRAR TU SALIDA
```

es contradictorio cuando la salida no está confirmada.

La jerarquía visual debe permitir leer primero el estado real de asistencia y luego la explicación causal aplicable.

---

#### 28. Persistencia de la explicación

Una explicación material no debe depender exclusivamente de un toast efímero.

Debe permanecer disponible mientras:

- la causa siga vigente;
- la acción relevante siga bloqueada;
- el trabajador necesite una recuperación;
- no exista un nuevo estado autoritativo que la vuelva obsoleta.

Cuando la causa cambie, la explicación debe refrescarse o retirarse. No se conserva un error viejo encima de una situación ya resuelta.

---

#### 29. Accesibilidad

La explicación debe ser comprensible sin depender exclusivamente de:

- color;
- icono;
- vibración;
- animación;
- posición visual;
- abreviaturas técnicas.

Debe existir texto accesible que indique:

- acción afectada;
- estado;
- causa humana;
- siguiente acción cuando corresponda.

Los controles de recuperación deben tener etiquetas claras y foco navegable conforme a las capacidades de la plataforma móvil.

---

#### 30. Minimización y seguridad

La explicación no expone:

- nombres de permisos internos;
- reglas de RLS;
- SQL;
- tablas;
- RPC;
- stack traces;
- secretos;
- tokens;
- políticas antifraude;
- información de otros trabajadores;
- roles o privilegios de terceros;
- detalles de seguridad que faciliten bypass;
- coordenadas exactas salvo que otra política propietaria autorice expresamente mostrarlas.

La persona recibe información suficiente para actuar, no un volcado del diagnóstico interno.

---

#### 31. Idempotencia y recuperación

La recuperación visible debe conservar la identidad de la operación cuando la intención ya existe.

Reglas:

```text
MISMA INTENCION NO RESUELTA
→ NO CREAR OTRA INTENCION SOLO POR TOCAR "REINTENTAR"

MISMO EVENTO YA APLICADO
→ RECUPERAR RESULTADO EXISTENTE

MISMA IDENTIDAD + CONTENIDO INCOMPATIBLE
→ CONFLICTO, NO SOBRESCRITURA
```

Una explicación humana no puede inducir al usuario a romper el contrato idempotente.

---

#### 32. Revalidación y desaparición automática del bloqueo

Un bloqueo puede dejar de existir por:

- cambio autoritativo de contexto;
- actualización de una fuente;
- restauración de una dependencia;
- finalización de una sincronización;
- corrección por el responsable propietario.

ANIMA puede revalidar automáticamente y restaurar la acción ordinaria sin exigir que el trabajador descarte manualmente una tarjeta de error.

La desaparición del mensaje debe basarse en nueva evidencia, no en un temporizador cosmético.

---

#### 33. Reentrada desde otra superficie

Si una notificación, `/shifts`, historial u otra superficie conduce al trabajador hacia la marcación:

- se revalida el estado actual;
- se reutiliza el mismo contrato de explicación;
- no se transporta un error viejo como autoridad;
- no se crea un segundo camino de reintento;
- no se inventa una nueva causa por la superficie de origen.

Home continúa siendo la superficie ordinaria de la marcación personal.

---

#### 34. Actor administrativo dentro del carril personal

Una persona con capacidades administrativas que usa su carril personal recibe la misma explicación respecto de **su propia marcación**.

Su rol administrativo no convierte la recuperación inmediata en:

- corrección de asistencia de terceros;
- bypass de geocerca;
- modificación del turno;
- elevación de permisos;
- cierre administrativo de sesión.

Las capacidades administrativas permanecen en sus flujos propietarios.

---

#### 35. Auditoría del AS-IS y drift identificado

La inspección del código vigente de ANIMA demuestra una experiencia funcional pero todavía insuficiente frente al contrato TO-BE:

1. `use-home-attendance-actions` reduce el error de una acción a `string | null`;
2. el fallback visible puede ser `No se pudo completar la acción`, sin indicar entrada o salida;
3. `AttendanceActionErrorCard` utiliza siempre el título genérico `No se pudo registrar` y solo agrega el string recibido;
4. el resultado físico `CheckInOutResult` conserva únicamente `success`, `error`, `timestamp` y `queued`, sin un contrato visible estructurado de causa, estado preservado o recuperación;
5. el check-in produce mensajes locales distintos para identidad ausente, cuenta inactiva, salida pendiente, check-in ya activo, geocerca, sede no determinada, permiso de ubicación y rol operativo;
6. parte de la traducción de errores inspecciona texto o códigos técnicos para devolver mensajes humanos;
7. el traductor actual clasifica conflictos como estado de sincronización pero comunica `Reintentaremos automáticamente`, aunque un conflicto exige reconciliación y no repetición ciega;
8. `AttendanceUxState = failed` también deriva actualmente a `Reintentaremos automáticamente` y ofrece `Reintentar ahora`;
9. Home y la tarjeta de geocerca reparten explicación y recuperación entre varios textos sin una unidad estructurada común;
10. la tarjeta de geocerca puede presentar `Cambiar sede` dentro del mismo espacio de recuperación, aunque sede operativa y punto físico de marcación son conceptos que el contrato TO-BE mantiene separados;
11. la experiencia actual ya evita mostrar directamente varios códigos técnicos al trabajador, lo cual se conserva;
12. la experiencia actual ya posee feedback de cola, geocerca y estado, que deberá reconciliarse con el contrato de certeza y no eliminarse por esta tarea.

El contrato TO-BE no prescribe todavía componentes físicos. Define el significado que una futura materialización deberá conservar.

---

#### 36. Matriz de escenarios de aceptación UX

| Escenario | Explicación esperada |
| --- | --- |
| Falta una condición conocida antes de enviar una entrada | Nombrar que la entrada no puede continuar, explicar humanamente la condición y ofrecer la recuperación permitida. |
| Falta una condición conocida antes de enviar una salida | Nombrar la salida y conservar la sesión real; no inventar una salida confirmada. |
| La acción está realizando una validación normal | Mostrar procesamiento, no un error prematuro. |
| La validación concluye en bloqueo corregible | Explicar qué condición falta y qué puede hacer el trabajador. |
| El contexto efectivo produce una denegación | Explicar la frontera funcional sin revelar códigos de permiso ni ofrecer bypass. |
| Una dependencia técnica falla antes de existir intención material | Indicar fallo técnico humano y ofrecer retry solo si es seguro. |
| Se pierde la respuesta después de un posible commit | Indicar que el resultado aún no puede confirmarse y reconciliar la misma intención; no ofrecer otra marcación ciega. |
| El servidor demuestra que no hubo efecto | Indicar que la marcación no se registró y ofrecer una recuperación compatible con la causa. |
| La misma intención ya había sido aplicada | Recuperar la confirmación existente; no mantener el bloqueo. |
| La intención entra en conflicto con un estado más nuevo | Explicar que la situación cambió y exigir refresco/reconciliación; no `reintento automático` ciego. |
| La entrada quedó durablemente en cola | Presentarla como pendiente, no como error. |
| La salida quedó durablemente en cola | Presentarla como pendiente, no como jornada cerrada ni como fallo. |
| La cola pendiente pasa a fallo que requiere intervención | Mantener estado no confirmado y añadir explicación accionable sin perder identidad. |
| El trabajador vuelve a Home y la causa sigue vigente | Mantener una explicación persistente y actualizada, no depender de un toast anterior. |
| La causa desaparece tras revalidación | Retirar la explicación y restaurar la acción pertinente sin exigir cierre manual del error. |
| Hay una causa relacionada con ubicación | Conservar estructura y handoff; la clasificación y copy específico quedan en ANIMA-UX-010. |
| Hay una causa relacionada con turno/contexto | Conservar estructura y handoff; la clasificación y copy específico quedan en ANIMA-UX-010. |
| Hay una causa relacionada con autorización | Conservar estructura y handoff; la clasificación y copy específico quedan en ANIMA-UX-010. |
| Se requiere soporte | Mostrar contexto humano y referencia segura; no stack trace ni código interno como mensaje principal. |
| Usuario con lector de pantalla | La causa, estado y acción siguiente son comprensibles sin depender del color o icono. |
| Doble toque mientras existe una intención sin resolver | Mantener una sola intención y una sola recuperación. |
| Actor gerencial usa su carril personal | Explicar su propia marcación sin introducir controles administrativos. |

---

#### 37. Requisitos de prueba derivados

**NO GENERA REQUISITOS DE PRUEBA.**

Requisitos creados: **0**
Requisitos modificados: **0**
Requisitos diferidos: **0**
Requisitos descartados: **0**
Requisitos obsoletos: **0**

La cobertura vigente ya exige lenguaje humano ante bloqueos, identificación de estado y acción principal, distinción entre confirmado y pendiente, recuperación sin duplicar efectos, comportamiento ante conflictos y fallos, contexto autoritativo y separación entre estado de asistencia, geocerca, conectividad y cola. Esta tarea especializa esas obligaciones para explicar impedimentos de marcación en ANIMA sin introducir una obligación material nueva.

---

#### 38. Cobertura de prueba vigente reutilizada

Se reutilizan sin modificación:

- `TREQ-UX-001` — tarea, acción principal y estado comprensibles;
- `TREQ-UX-002` — errores, bloqueos y fallos explicados humanamente con estado preservado y recuperación segura;
- `TREQ-UX-005` — fuente de verdad y distinción entre confirmado y pendiente;
- `TREQ-UX-006` — distinción entre pendiente, confirmado, fallido, conflicto y requiere intervención;
- `TREQ-UX-009` — contexto operativo derivado de hechos autoritativos y no fabricado por frontend;
- `TREQ-ANIMA-003` — persistencia durable e idempotencia de marcaciones offline;
- `TREQ-ANIMA-015` — separación en Home entre asistencia, geocerca, sede, conectividad, cola, sincronización y diagnóstico sin mostrar una marcación pendiente o fallida como aplicada.

Esta enumeración es trazabilidad hacia cobertura ya registrada y no modifica el registro canónico de requisitos.

---

#### 39. Evidencia de validación

| Clase | Estado | Evidencia |
| --- | --- | --- |
| BUILD | NOT_EXECUTED | No se ejecutó build del repositorio ni de la aplicación durante el desarrollo documental de esta tarea. |
| LOCAL | PASS | El artefacto aislado fue comprobado por estructura, metadata obligatoria, secciones consecutivas, cero requisitos derivados, cinco clases de evidencia, continuidad exacta, UTF-8, EOL estable y ausencia de contenido reservado al chat. |
| REMOTA | PASS | Se contrastaron en GitHub protocolo, contrato de entrega, manifest, continuidad, ruta activa, topología, políticas de formato y desarrollo, owner ANIMA, ANIMA-UX-008, UX-BASE-006, contrato de cierre de asistencia, fragmentos 04A aplicables, package.json, validadores documentales y código vigente de Home, mensajes y asistencia en vento-anima. |
| OPERATIVA | PASS | La matriz verifica bloqueos previos, validación, denegación, fallo técnico, resultado desconocido, conflicto, cola durable, reentrada, soporte, accesibilidad, doble toque y actor gerencial sin absorber la clasificación causal reservada a la tarea siguiente. |
| FÍSICA | NOT_APPLICABLE | ANIMA-UX-009 está gobernada por DEFINE_ONCE y no crea instancia física propia ni autoriza cambios de código, Supabase, navegación, datos, configuración o despliegue. |

---

#### 40. Criterios de aceptación

1. Toda explicación identifica entrada o salida cuando el sistema conoce la marcación afectada.
2. El título no se limita a `Error`, `No se pudo registrar` o una frase técnica genérica.
3. La explicación distingue estado de certeza de causa.
4. Un estado pendiente normal no se presenta como fallo.
5. Un resultado desconocido no se presenta como operación no ejecutada.
6. Un resultado confirmado no conserva una explicación de bloqueo obsoleta.
7. La causa visible se deriva de una causa estructurada y no se usa como fuente de lógica.
8. El mensaje indica qué estado o información quedó preservado cuando sea material.
9. Una ausencia de respuesta no se traduce automáticamente a `no se guardó`.
10. Un cambio local no se traduce automáticamente a `se registró`.
11. La recuperación propuesta es ejecutable por el actor actual.
12. `Reintentar` se ofrece únicamente cuando la repetición es segura.
13. Un resultado desconocido se reconcilia antes de permitir una nueva intención equivalente.
14. Un conflicto no se reduce a `reintento automático`.
15. Un replay del mismo evento recupera el resultado existente sin un segundo efecto.
16. La explicación no induce a crear un nuevo identificador para una intención no resuelta.
17. Una marcación durablemente encolada se presenta como pendiente y no como error.
18. La tarea no redefine el manejo completo de cola offline.
19. La tarea no redefine la recuperación completa de una marcación interrumpida.
20. La explicación identifica una condición de desbloqueo cuando esta existe.
21. La explicación identifica un responsable funcional solo cuando puede determinarse sin inventarlo.
22. `Contacta al administrador` no se usa como fallback universal.
23. El soporte puede recibir una referencia segura sin exponer diagnóstico sensible al trabajador.
24. No se muestran SQL, RPC, RLS, stack traces, tokens ni códigos internos como explicación principal.
25. Una acción bloqueada no queda representada únicamente por un botón deshabilitado sin contexto.
26. Estado principal y explicación de bloqueo no se contradicen.
27. Una explicación material no depende exclusivamente de un toast efímero.
28. La explicación se actualiza o desaparece cuando cambia la causa.
29. El significado no depende exclusivamente de color, icono, vibración o animación.
30. La reentrada desde otra superficie converge en el mismo estado y explicación actualizados.
31. Una persona administrativa en carril personal recibe el mismo contrato para su propia marcación.
32. Sede laboral, punto físico, geocerca y autorización no se convierten en sinónimos dentro del mensaje.
33. La estructura permite conservar causas distintas sin clasificarlas todavía en las tres familias de la tarea siguiente.
34. La clasificación final de ubicación, turno/contexto y autorización permanece reservada a ANIMA-UX-010.
35. El AS-IS basado en strings genéricos no se canoniza como contrato TO-BE.
36. No se crean ni modifican requisitos de prueba.
37. No existe materialización física propia.
38. La continuidad queda reservada exclusivamente hacia ANIMA-UX-010.

---

#### 41. Límites

ANIMA-UX-009 no:

- modifica `vento-anima`;
- modifica lógica de Home;
- crea componentes;
- cambia copy físico en la aplicación;
- modifica Supabase;
- crea migraciones, tablas, vistas, funciones, RPC, triggers, Edge Functions o RLS;
- crea reason codes;
- crea enums físicos;
- redefine estados de dominio de asistencia;
- redefine la semántica de check-in o check-out;
- redefine geocercas, precisión, radios o TTL;
- redefine turnos;
- redefine autorización;
- clasifica todavía cada error como ubicación, turno/contexto o autorización;
- diseña el funcionamiento completo de cola offline;
- diseña la reanudación completa de una marcación interrumpida;
- corrige administrativamente asistencia;
- crea una vía paralela de marcación desde `/shifts`, historial o notificaciones;
- permite bypass por rol administrativo;
- sustituye idempotencia por bloqueo visual;
- modifica el registro de requisitos de prueba;
- crea una instancia física.

La tarea deja definido un contrato común de explicación humana con acción afectada, causa segura, estado preservado, recuperación segura, responsable cuando sea demostrable, condición de revisión, referencia opcional, persistencia visual, accesibilidad, minimización y respeto por el estado de certeza.

El estado físico permanece `ESPECIFICADO_NO_MATERIALIZADO`.

---

#### 42. Continuidad

**ÚLTIMA TAREA APROBADA**
`ANIMA-UX-008 — Mostrar claramente marcación confirmada o pendiente`

**TAREA ACTUAL APROBADA**
`ANIMA-UX-009 — Explicar por qué no se puede marcar`

**SIGUIENTE TAREA RESERVADA**
`ANIMA-UX-010 — Diferenciar error de ubicación, turno y autorización`


### ✅ ANIMA-UX-010 — Diferenciar error de ubicación, turno y autorización

**Estado:** APROBADA
**Tarea anterior:** ANIMA-UX-009 — Explicar por qué no se puede marcar
**Tarea siguiente:** ANIMA-UX-011 — Diseñar manejo comprensible de cola offline
**Tipo de tarea:** documental; diseño UX TO-BE de la clasificación causal visible para bloqueos de marcación personal en ANIMA, separando evidencia física de ubicación, contexto laboral de turno y decisión de autorización sin convertir fallos técnicos, conectividad, sincronización o estado incierto en denegaciones falsas
**Bloque:** F_ANIMA — EXPERIENCIA DEL TRABAJADOR Y ADMINISTRACION
**Repositorio propietario:** vento-group-sas/vento-shell
**Archivo propietario:** docs/plan-canonico/modular/bloques/F_ANIMA/02_EXPERIENCIA_DEL_TRABAJADOR_Y_ADMINISTRACION.md
**Estado físico resultante:** ESPECIFICADO_NO_MATERIALIZADO
**Cambios físicos autorizados:** ninguno durante esta tarea
**Requisitos de prueba creados o modificados:** 0

---

#### 1. Propósito

Definir de forma única, comprensible y verificable cómo ANIMA debe diferenciar ante el trabajador por qué una marcación personal de entrada o salida no puede continuar cuando la causa demostrada pertenece a una de tres familias que hoy pueden confundirse:

1. ubicación física o evidencia de geocerca;
2. turno o contexto laboral aplicable;
3. autorización o acceso efectivo.

La tarea consume el contrato de explicación humana aprobado en `ANIMA-UX-009` y agrega la clasificación causal que aquella tarea dejó expresamente reservada.

La regla raíz queda:

```text
MISMO RESULTADO VISIBLE: "NO PUEDO MARCAR"
!=
MISMA CAUSA
```

Por tanto:

```text
UBICACION
!=
TURNO / CONTEXTO LABORAL
!=
AUTORIZACION
```

La clasificación visible debe responder al predicado autoritativo que realmente bloqueó la acción y no a palabras encontradas en un mensaje, a la pantalla desde la que se originó el intento ni a una inferencia local de ANIMA.

---

#### 2. Handoff consumido desde ANIMA-UX-009

`ANIMA-UX-009` ya definió que un bloqueo debe explicar, con proporcionalidad:

- la acción que se intentaba realizar;
- qué impide continuar;
- qué estado de asistencia sigue siendo cierto;
- qué información o intención quedó preservada;
- qué acción es segura a continuación;
- quién puede resolver el problema cuando el trabajador no puede;
- qué referencia de soporte puede conservarse cuando sea necesaria.

La tarea actual no reabre esa gramática.

Su responsabilidad específica es determinar qué significado causal se presenta cuando el impedimento pertenece a ubicación, turno/contexto o autorización.

La separación queda:

```text
ANIMA-UX-009
-> COMO EXPLICAR UN BLOQUEO

ANIMA-UX-010
-> QUE CAUSA MATERIAL SE ESTA EXPLICANDO
```

---

#### 3. Unidad de clasificación

La unidad de clasificación es el impedimento material de una intención concreta de asistencia.

Debe existir, como mínimo, esta identidad conceptual:

```text
actor efectivo
+
accion de asistencia
+
estado de asistencia vigente
+
contexto laboral aplicable
+
evidencia fisica aplicable
+
decision de acceso aplicable
+
causa estructurada observada
```

La clasificación no se decide únicamente por:

- texto del error;
- nombre de la excepción;
- prefijo técnico de un código;
- componente visual;
- ruta de navegación;
- estado local del botón;
- palabra `sede`;
- palabra `ubicación`;
- palabra `turno`;
- palabra `autorizado`;
- orden accidental en que el cliente ejecutó validaciones.

---

#### 4. Familias UX objetivo

Las tres familias objetivo son conceptos de presentación y diagnóstico UX.

| Familia UX | Pregunta que responde | Fuente material esperada |
| --- | --- | --- |
| `LOCATION` | ¿La evidencia física necesaria para marcar no es válida o suficiente? | geolocalización, precisión, geocerca, punto físico y evidencia antifraude cuando aplique |
| `SHIFT_CONTEXT` | ¿El contexto laboral publicado o vigente no permite construir la marcación esperada? | turno publicado, ventana temporal, asignación operacional derivada del turno y contexto de asistencia aplicable |
| `AUTHORIZATION` | ¿La política de acceso niega la acción aun cuando el contexto requerido ya pudo resolverse? | decisión efectiva de acceso, capacidad, territorio autorizado, estado de cuenta o restricción de dispositivo cuando sea una regla de acceso |

Estas familias no crean un nuevo catálogo de códigos de servidor.

Los códigos y razones autoritativos existentes conservan su propiedad.

---

#### 5. Las tres familias no forman un universo exhaustivo

Queda prohibido obligar a que todo fallo de marcación caiga en una de las tres familias objetivo.

Deben permanecer fuera cuando correspondan, entre otros:

- conectividad;
- sincronización;
- intención encolada;
- respuesta perdida;
- resultado todavía incierto;
- fallo técnico de servicio;
- configuración incompleta o inválida;
- fallo de base de datos;
- conflicto de idempotencia;
- sesión o identidad no resoluble;
- estado de asistencia incompatible que no sea un problema de turno;
- error desconocido sin causa demostrable.

Regla:

```text
CAUSA NO DEMOSTRADA
->
NO FABRICAR LOCATION
NO FABRICAR SHIFT_CONTEXT
NO FABRICAR AUTHORIZATION
```

---

#### 6. Principio de fuente de verdad causal

La familia visible se deriva de evidencia estructurada y del predicado que falló en la frontera propietaria.

Preferencia contractual:

```text
reason_code / decision / predicate estructurado
>
estado autoritativo consultado
>
diagnostico tipado
>
mensaje humano libre
```

El mensaje libre puede ser mostrado después de saneamiento o utilizado como fallback de compatibilidad, pero no debe convertirse en la fuente canónica de clasificación.

Queda prohibido que el cliente mantenga una taxonomía autoritativa basada principalmente en búsquedas de substrings.

---

#### 7. No clasificar por prefijo técnico

Un prefijo técnico no determina la familia UX.

En particular:

```text
codigo que comienza por AUTH_
!=
familia UX AUTHORIZATION obligatoria
```

El catálogo de bloqueos puede vivir dentro del dominio de autorización y aun representar:

- ausencia de turno publicado;
- ventana temporal de turno;
- check-in requerido;
- rol operativo contextual;
- dispositivo;
- configuración;
- fallo técnico.

La familia se asigna por semántica del predicado, no por namespace.

---

#### 8. Familia LOCATION

`LOCATION` aplica cuando la causa decisiva es que la evidencia física requerida para esa marcación no puede considerarse válida o suficiente.

Ejemplos materiales:

- permiso de ubicación necesario no concedido;
- posición actual no disponible cuando la política exige obtenerla;
- precisión insuficiente para demostrar presencia;
- distancia superior al umbral permitido;
- trabajador fuera del punto o perímetro habilitado para marcar;
- evidencia de ubicación simulada, manipulada o incompatible cuando exista una política aplicable;
- evidencia física caducada cuando deba ser fresca.

La familia describe una condición de evidencia física.

No describe por sí sola:

- la sede laboral asignada;
- el turno publicado;
- el rol operativo;
- el permiso empresarial;
- la conectividad;
- la configuración interna de coordenadas.

---

#### 9. Sede laboral y punto físico no son sinónimos

Deben permanecer separados:

```text
SEDE LABORAL
PUNTO FISICO DE MARCACION
GEOFENCE UTILIZADA PARA EVIDENCIA
```

Una persona puede tener una sede laboral correcta y, al mismo tiempo, no encontrarse dentro del punto físico válido para marcar.

En ese caso:

```text
CAUSE_FAMILY = LOCATION
```

No corresponde pedir un cambio de sede laboral únicamente para resolver una geocerca.

A la inversa, estar físicamente dentro de un perímetro no demuestra que ese lugar sea el contexto laboral autorizado para la persona.

---

#### 10. Recuperación de LOCATION

La recuperación visible debe actuar sobre la evidencia física que falló.

Según la causa estructurada podrá indicar, por ejemplo:

- conceder o revisar el permiso de ubicación;
- volver a obtener la posición;
- mejorar la precisión;
- acercarse al punto habilitado de marcación;
- regresar al perímetro permitido;
- desactivar una fuente de ubicación simulada cuando la política lo exija;
- volver a validar la ubicación.

No debe sugerir como solución primaria:

- cambiar turno;
- pedir que publiquen un turno;
- solicitar permisos empresariales;
- cambiar la sede laboral registrada;

salvo que exista además una causa independiente y demostrada que lo requiera.

---

#### 11. Configuración de geocerca no equivale a LOCATION del trabajador

Si la aplicación no puede validar la ubicación porque la configuración propietaria está ausente, inconsistente o no puede leerse, el trabajador no debe recibir un mensaje que implique que se encuentra en el lugar equivocado.

Ejemplos:

- coordenadas del punto no configuradas;
- radio o política física inválida;
- fuente de sitios no disponible;
- error al cargar parámetros de geocerca;
- datos físicos contradictorios del sistema.

Resultado semántico:

```text
TECHNICAL_OR_CONFIGURATION
!=
LOCATION
```

La interfaz puede informar que la validación de ubicación no está disponible, pero no atribuir al trabajador una posición incorrecta que no pudo demostrarse.

---

#### 12. Familia SHIFT_CONTEXT

`SHIFT_CONTEXT` aplica cuando el predicado decisivo pertenece al contexto laboral necesario para construir o aceptar la marcación y no a la posición física del dispositivo ni a una denegación de capacidad.

Incluye, cuando corresponda al contrato autoritativo:

- ausencia de turno publicado aplicable;
- turno publicado fuera de su ventana vigente;
- contexto temporal todavía no iniciado o ya finalizado;
- asignación operacional requerida por el turno ausente;
- rol operativo requerido por el contexto publicado ausente;
- relación turno-sede o turno-área incompatible cuando el fallo pertenece a la construcción del contexto laboral;
- una condición de asistencia contextual requerida por la acción cuando el propietario la trate como contexto y no como autorización.

La familia responde:

```text
EL CONTEXTO LABORAL VIGENTE NO SUSTENTA ESTA MARCACION
```

---

#### 13. Códigos de turno ya existentes

Cuando las fronteras autoritativas entreguen los contratos ya definidos para:

- `AUTH_PUBLISHED_SHIFT_REQUIRED`;
- `AUTH_SHIFT_OUTSIDE_WINDOW`;

la experiencia de marcación debe preservar su significado de turno/contexto y no traducirlos como problemas de ubicación o como una denegación genérica de permisos.

El prefijo `AUTH_` no cambia esa semántica.

---

#### 14. Rol operativo como dato contextual o decisión de autorización

La expresión “rol operativo” puede participar en dos tipos de fallo y no debe clasificarse por la palabra `rol`.

##### Caso A — contexto no construible

Si el turno publicado debía aportar o resolver un rol operativo y ese dato está ausente, inválido respecto del turno o incoherente con su asignación, la explicación pertenece a `SHIFT_CONTEXT`.

##### Caso B — contexto válido pero capacidad denegada

Si el rol operativo y demás contexto ya fueron resueltos correctamente y la política de acceso concluye que la acción concreta no está permitida, la explicación pertenece a `AUTHORIZATION`.

Regla:

```text
FALLO DE CONSTRUCCION DEL CONTEXTO
!=
DENEGACION SOBRE CONTEXTO YA RESUELTO
```

---

#### 15. Recuperación de SHIFT_CONTEXT

La recuperación debe actuar sobre el contexto laboral.

Según la causa demostrada podrá indicar:

- revisar el turno publicado;
- comprobar la fecha y la ventana de inicio o finalización;
- esperar hasta la ventana aplicable cuando esa sea la regla;
- solicitar corrección de programación cuando el turno publicado sea incorrecto;
- solicitar que se complete una asignación operacional faltante;
- escalar al responsable de horarios o supervisión cuando el trabajador no pueda corregirlo.

No debe indicar como solución primaria:

- caminar hacia otro punto físico;
- activar GPS;
- cambiar de sede desde un selector local;
- pedir un permiso de aplicación;

si el bloqueo demostrado es exclusivamente de turno/contexto.

---

#### 16. Familia AUTHORIZATION

`AUTHORIZATION` aplica cuando existe una decisión efectiva y autoritativa que niega la acción después de resolver los hechos y el contexto necesarios para evaluarla.

Puede comprender, según el contrato propietario:

- cuenta laboral o acceso a aplicación inactivo;
- capacidad requerida ausente;
- acción fuera del alcance territorial autorizado;
- restricción de dispositivo cuando sea una regla explícita de acceso;
- permiso específico denegado;
- segregación o política empresarial que impide la acción.

La familia responde:

```text
EL CONTEXTO PUDO RESOLVERSE
+
LA POLITICA DE ACCESO NEGO LA ACCION
```

No debe utilizarse como sinónimo de “algo falló”.

---

#### 17. Asignación de sede y autorización territorial

La frase “no tienes asignada esta sede” no debe clasificarse como `LOCATION` solo porque contiene la palabra `sede`.

Si el predicado real es que la persona no posee alcance o asignación empresarial para operar en esa sede, la causa pertenece a autorización o territorio autorizado.

Si el predicado real es que el turno publicado pertenece a otra sede, la causa pertenece a `SHIFT_CONTEXT`.

Si el predicado real es que la persona está físicamente fuera del perímetro, la causa pertenece a `LOCATION`.

Por tanto:

```text
MISMA PALABRA "SEDE"
->
TRES SIGNIFICADOS POSIBLES
```

Solo la fuente propietaria puede distinguirlos de forma segura.

---

#### 18. Recuperación de AUTHORIZATION

La recuperación debe actuar sobre acceso o autoridad.

Según la causa demostrada podrá indicar:

- solicitar activación de acceso;
- pedir revisión del permiso o capacidad faltante;
- escalar al responsable que administra el alcance correspondiente;
- usar una superficie permitida cuando exista una alternativa canónica;
- volver a intentar únicamente después de que el acceso haya cambiado o cuando el contrato indique que el retry es seguro.

No debe recomendar como solución primaria:

- moverse físicamente;
- revalidar GPS;
- esperar el inicio de un turno;
- editar localmente la sede;

si el bloqueo demostrado es exclusivamente de autorización.

---

#### 19. Error técnico de autorización no es AUTHORIZATION

Una evaluación que no puede completarse por fallo técnico no demuestra una denegación.

Ejemplos:

- timeout del servicio de decisión;
- RPC indisponible;
- matriz o configuración no legible;
- respuesta malformada;
- dependencia caída;
- error 5xx;
- fallo de base de datos;
- contrato incompatible.

Regla:

```text
NO SE PUDO EVALUAR
!=
EVALUACION = DENY
```

La interfaz debe conservar la distinción de fallo técnico o configuración y no presentar al trabajador como “sin permiso” cuando la política nunca logró resolver la decisión.

---

#### 20. Conectividad no es ninguna de las tres familias

Una pérdida de red no permite inferir:

- que la persona esté fuera de ubicación;
- que no exista turno;
- que la persona no esté autorizada.

Si la política permite conservar o encolar la intención, la experiencia pertenece al contrato de pendiente/offline.

Si la acción no puede continuar por conectividad, la explicación debe identificar conectividad o indisponibilidad sin inventar una causa empresarial.

`ANIMA-UX-011` conserva la propiedad del diseño completo de cola offline.

---

#### 21. Resultado incierto no es una causa de bloqueo empresarial

Cuando el cliente envió una intención y perdió la respuesta, puede desconocer si el servidor la aplicó.

Ese estado no se clasifica como:

- `LOCATION`;
- `SHIFT_CONTEXT`;
- `AUTHORIZATION`.

Debe permanecer como estado incierto o pendiente hasta reconciliación.

La ausencia de respuesta no autoriza un mensaje como:

```text
"No tienes permiso"
```

o:

```text
"Estas fuera de la sede"
```

si esos hechos no fueron demostrados.

---

#### 22. Conflicto no es sinónimo de autorización

Un conflicto idempotente, de secuencia o de sincronización debe conservar su propia semántica.

Puede requerir:

- refrescar estado;
- reconciliar el evento;
- recuperar el resultado existente;
- solicitar intervención cuando el conflicto no sea resoluble automáticamente.

No debe degradarse a una denegación de permiso ni a un error de turno por conveniencia visual.

---

#### 23. Estado de asistencia previo permanece visible

La clasificación causal no cambia por sí misma el estado autoritativo de asistencia.

Ejemplos:

##### Entrada bloqueada por ubicación

```text
estado previo = SIN ENTRADA CONFIRMADA
causa = LOCATION
```

La interfaz no presenta al trabajador como dentro del turno.

##### Salida bloqueada por ubicación

```text
estado previo = SESION DE ASISTENCIA ACTIVA
causa = LOCATION
```

La interfaz no presenta la jornada como cerrada.

##### Entrada bloqueada por turno

```text
estado previo = SIN ENTRADA CONFIRMADA
causa = SHIFT_CONTEXT
```

##### Acción denegada por acceso

El estado previo continúa hasta que exista una mutación autoritativa distinta.

---

#### 24. Regla especial del check-out

La semántica de cierre de asistencia aprobada en ANIMA establece que perder permiso operativo no puede convertirse por sí solo en una razón para impedir el checkout ordinario de una sesión de asistencia realmente abierta.

Por tanto:

```text
PERMISO OPERATIVO YA NO VIGENTE
!=
AUTHORIZATION PARA BLOQUEAR SALIDA
```

Si existe una sesión exacta que debe cerrarse, la aplicación debe preservar el contrato propietario de cierre.

Siguen pudiendo existir otras validaciones legítimas de identidad, sesión, secuencia, evidencia física o integridad según el contrato aplicable.

Esta tarea no modifica esas reglas; evita que la UI fabrique una denegación de salida a partir de autoridad operativa ya retirada.

---

#### 25. Causa primaria y causas simultáneas

Pueden coexistir varias condiciones inválidas.

La UI no debe decidir la causa primaria por el orden accidental de validaciones locales ni ejecutar una carrera entre mensajes.

Regla:

```text
PRIMARY_CAUSE
=
BLOQUEO DECISIVO DEVUELTO O DERIVADO POR LA FRONTERA PROPIETARIA
```

Si la fuente autoritativa entrega múltiples bloqueos estructurados, se aplica la precedencia definida por el contrato propietario de esa decisión.

La tarea actual no crea una nueva precedencia global entre todos los dominios.

Los bloqueos secundarios pueden conservarse para diagnóstico o mostrarse cuando sean accionables y no confundan, pero no deben contradecir la causa primaria.

---

#### 26. Causa estable entre superficies

La misma causa autoritativa debe conservar el mismo significado al aparecer en:

- Home;
- tarjeta de marcación;
- estado posterior a un intento;
- reingreso a la aplicación;
- detalle de asistencia cuando corresponda;
- soporte o diagnóstico autorizado;
- notificación que devuelva al flujo de asistencia.

No se permite que Home llame `LOCATION` a un bloqueo que soporte llama `AUTHORIZATION` sin nueva evidencia autoritativa.

---

#### 27. Contrato conceptual de presentación

Sin imponer todavía una forma física de API, la proyección UX debe poder representar conceptualmente:

| Campo conceptual | Regla |
| --- | --- |
| acción afectada | distingue entrada y salida |
| familia causal | conserva la causa semántica demostrada |
| razón estructurada | referencia el motivo autoritativo cuando exista |
| título humano | nombra el problema sin jerga técnica |
| explicación | indica el predicado que falló |
| estado preservado | explica qué sigue siendo cierto sobre asistencia |
| recuperación | ofrece únicamente una acción segura y pertinente |
| retry seguro | no invita a repetir cuando el contrato exige reconciliación o corrección previa |
| referencia de soporte | opcional y no sensible |

Esta forma es un contrato de información UX.

No crea una tabla, columna, endpoint, RPC, enum público ni tipo compartido físico durante esta tarea.

---

#### 28. Etiquetas humanas recomendadas

Cuando la causa sea segura, el encabezado visible puede utilizar lenguaje humano equivalente a:

| Familia | Etiqueta humana esperada |
| --- | --- |
| `LOCATION` | `Revisa tu ubicación` |
| `SHIFT_CONTEXT` | `Revisa tu turno` |
| `AUTHORIZATION` | `Revisa tu acceso` |

Estas etiquetas no sustituyen la explicación específica.

No deben utilizarse si la evidencia disponible no permite afirmar la familia.

Un fallo técnico de ubicación puede usar una etiqueta como “No pudimos validar la ubicación” sin afirmar que el trabajador está fuera del lugar permitido.

---

#### 29. Copy mínimo de LOCATION

Una explicación de `LOCATION` debe poder responder:

1. qué evidencia física falta o no cumple;
2. si la entrada o salida sigue sin confirmar;
3. qué debe hacer el trabajador con su ubicación;
4. si puede revalidar de forma segura.

Ejemplos semánticos:

```text
No pudimos validar que estas dentro del punto habilitado para marcar.
Tu entrada sigue sin registrarse.
Acercate al punto de marcacion y vuelve a validar la ubicacion.
```

Cuando el problema sea permiso o precisión, el texto cambia para señalar esa condición concreta.

No se utiliza el ejemplo anterior ante una falla de configuración del sistema.

---

#### 30. Copy mínimo de SHIFT_CONTEXT

Una explicación de `SHIFT_CONTEXT` debe poder responder:

1. qué hecho del turno/contexto falta o no está vigente;
2. qué estado de asistencia permanece;
3. si esperar puede resolverlo o si requiere corrección;
4. quién puede corregir la programación cuando el trabajador no puede.

Ejemplos semánticos:

```text
No hay un turno publicado aplicable para tu entrada en este momento.
Tu entrada sigue sin registrarse.
Revisa tu horario; si el turno deberia estar activo, solicita que corrijan la programacion.
```

O, cuando exista turno pero esté fuera de ventana:

```text
Tu turno esta publicado, pero todavia no esta dentro de la ventana permitida para esta marcacion.
```

---

#### 31. Copy mínimo de AUTHORIZATION

Una explicación de `AUTHORIZATION` debe poder responder:

1. qué acceso o capacidad fue denegado sin exponer detalle sensible;
2. qué estado de asistencia permanece;
3. si el trabajador puede resolverlo o debe escalar;
4. por qué repetir sin un cambio de acceso no ayudará.

Ejemplo semántico:

```text
Tu acceso actual no permite completar esta accion.
La marcacion no fue confirmada.
Solicita revision del acceso antes de volver a intentarlo.
```

No se usa esta redacción cuando el sistema no pudo ejecutar la evaluación de acceso.

---

#### 32. Privacidad y minimización

La explicación no expone:

- políticas internas completas;
- matrices globales de permisos;
- grants;
- SQL;
- RLS;
- nombres de funciones internas;
- stack traces;
- tokens;
- secretos;
- datos de otro trabajador;
- detalle de roles o territorios que el actor no deba conocer;
- infraestructura de seguridad innecesaria.

Debe existir información suficiente para actuar sin revelar la implementación de protección.

---

#### 33. Accesibilidad

La diferenciación causal no puede depender únicamente de:

- color;
- icono;
- vibración;
- animación;
- posición visual;
- abreviatura técnica.

La familia y la acción de recuperación deben ser comprensibles mediante texto y semántica accesible.

Un lector de pantalla debe poder distinguir, por significado:

- problema de ubicación;
- problema de turno/contexto;
- problema de acceso;
- estado técnico o pendiente que no pertenece a esas familias.

---

#### 34. Persistencia visual suficiente

Una causa que requiere actuación del trabajador no debe depender únicamente de un toast efímero.

La explicación debe permanecer disponible el tiempo suficiente para:

- ser leída;
- ejecutar la recuperación;
- consultar el turno;
- corregir permisos del dispositivo;
- contactar al responsable;
- recuperar una referencia de soporte cuando aplique.

Si la causa deja de ser válida después de nueva evidencia autoritativa, la interfaz debe actualizarla o retirarla.

---

#### 35. Brechas AS-IS observadas

La auditoría del código actual identifica estas brechas frente al contrato TO-BE:

| Brecha AS-IS | Riesgo |
| --- | --- |
| el resultado de Home reduce el error principalmente a un `string` | se pierde causa estructurada y fuente propietaria |
| la tarjeta de error usa el encabezado genérico `No se pudo registrar` | ubicación, turno y autorización resultan visualmente equivalentes |
| el clasificador de asistencia busca palabras como `gps`, `location`, `sede` y `geofence` | la semántica depende de texto libre y puede clasificar una sede empresarial como ubicación física |
| el clasificador visible no contempla una familia explícita de turno/contexto | fallos de programación pueden caer en fallback o en otras categorías |
| el clasificador visible no contempla una familia explícita de autorización de asistencia | una denegación real no puede distinguirse limpiamente de fallo técnico |
| el estado `blocked` de Home prioriza `Validar ubicación en sede` | un bloqueo no relacionado con geocerca puede recibir recuperación incorrecta |
| la tarjeta de geocerca puede ofrecer `Cambiar sede` | cambiar sede laboral puede presentarse como solución a un problema puramente físico |
| distintas ramas de asistencia devuelven mensajes libres desde capas diferentes | mensajes equivalentes pueden tener significados materiales distintos |

Estas brechas documentan el delta de implementación futuro.

No autorizan cambios físicos dentro de esta tarea.

---

#### 36. Reglas de migración desde mensajes libres

La implementación futura deberá migrar sin romper compatibilidad.

Orden esperado:

1. preservar los reason codes y decisiones estructuradas ya disponibles;
2. crear un mapping explícito y revisable desde causa autoritativa a familia UX;
3. mantener el mensaje humano como contenido, no como discriminador principal;
4. usar heurística textual solo como fallback transitorio para fuentes legacy sin causa estructurada;
5. marcar esos fallbacks como no concluyentes cuando puedan producir una clasificación materialmente falsa;
6. retirar progresivamente la dependencia de substring matching;
7. probar que un cambio de copy no cambia la familia causal.

Una traducción de texto no debe convertirse accidentalmente en un cambio de autorización.

---

#### 37. Matriz de escenarios obligatorios

| Escenario | Familia visible esperada | Regla |
| --- | --- | --- |
| entrada con turno válido y actor autorizado, pero fuera de geocerca | `LOCATION` | el predicado que falla es físico |
| entrada con permiso de ubicación denegado cuando se requiere evidencia | `LOCATION` | falta evidencia física necesaria |
| GPS con precisión insuficiente | `LOCATION` | no se demuestra presencia con calidad suficiente |
| ubicación simulada detectada bajo política aplicable | `LOCATION` | la evidencia física no es aceptable |
| coordenadas de la sede no configuradas | fuera de las tres; técnico/configuración | no atribuir al trabajador una ubicación incorrecta |
| servicio de geocerca indisponible | fuera de las tres; técnico/configuración | no fabricar `LOCATION` |
| no existe turno publicado aplicable | `SHIFT_CONTEXT` | falta contexto laboral publicado |
| turno publicado todavía fuera de ventana | `SHIFT_CONTEXT` | el hecho temporal es el bloqueo |
| turno ya finalizado para una entrada nueva | `SHIFT_CONTEXT` | la ventana laboral no sustenta la marcación |
| rol operativo que debía derivarse del turno está ausente | `SHIFT_CONTEXT` | falla la construcción del contexto laboral |
| sede del turno no coincide con el contexto intentado | `SHIFT_CONTEXT` cuando el predicado propietario es la asignación del turno | no confundir con distancia física |
| sede fuera del alcance empresarial del actor con turno y posición válidos | `AUTHORIZATION` | la política de territorio niega la acción |
| capacidad explícita ausente con contexto válido | `AUTHORIZATION` | existe deny autoritativo |
| cuenta inactiva cuando esa condición bloquea el acceso | `AUTHORIZATION` | el acceso laboral está denegado |
| dispositivo prohibido por política de acceso | `AUTHORIZATION` | restricción explícita de acceso |
| timeout al resolver autorización | fuera de las tres; técnico | no se obtuvo una decisión deny |
| matriz de autorización inconsistente | fuera de las tres; técnico/configuración | fallo de evaluación, no denegación |
| red caída antes de resolver la causa | fuera de las tres; conectividad | no inferir causa empresarial |
| marcación durablemente encolada | fuera de las tres; pendiente/offline | existe intención pendiente, no bloqueo causal equivalente |
| respuesta perdida después de enviar | fuera de las tres; incierto | reconciliar antes de afirmar resultado |
| conflicto idempotente | fuera de las tres; conflicto | no convertir en autorización |
| salida de sesión activa después de perder permiso operativo | no bloquear por `AUTHORIZATION` solo por esa pérdida | el checkout conserva contrato propietario de cierre |
| misma palabra `sede` proveniente de geocerca | `LOCATION` si el predicado es distancia física | clasificar por fuente, no por texto |
| misma palabra `sede` proveniente de turno | `SHIFT_CONTEXT` si el predicado es asignación del turno | clasificar por fuente, no por texto |
| misma palabra `sede` proveniente de alcance permitido | `AUTHORIZATION` | clasificar por fuente, no por texto |
| mensaje traducido cambia de redacción pero conserva reason code | misma familia | copy no gobierna semántica |
| causa remota cambia después de refrescar contexto | nueva familia autoritativa | la UI converge con la nueva evidencia |

---

#### 38. Requisitos de prueba derivados

**Resultado:** NO GENERA REQUISITOS DE PRUEBA.

**Requisitos creados:** 0

**Requisitos modificados:** 0

La cobertura vigente ya exige explicación humana de bloqueos, separación de fuente de verdad, contexto operativo, estados pendientes y experiencia accesible. La tarea actual especializa esas reglas para la clasificación causal de marcación sin ampliar el universo de requisitos.

---

#### 39. Cobertura de prueba vigente reutilizada

La trazabilidad se apoya, sin modificación, en:

- `TREQ-UX-001` — claridad de tarea, acción y estado;
- `TREQ-UX-002` — explicación humana de error o bloqueo y recuperación segura;
- `TREQ-UX-003` — acciones e información adecuadas a autorización;
- `TREQ-UX-005` — fuente de verdad, confirmado o pendiente y conciliación;
- `TREQ-UX-006` — continuidad ante fallos y diferenciación de estados;
- `TREQ-UX-009` — resolución de contexto operativo sin fabricar autoridad;
- `TREQ-UX-021` — diferenciación accesible no dependiente solo de color;
- `TREQ-UX-031` — bloqueos con causa, responsable y siguiente acción;
- `TREQ-ANIMA-003` — marcaciones offline idempotentes y sin confirmación falsa;
- `TREQ-ANIMA-015` — separación en Home de asistencia, geocerca, conectividad, cola, sincronización y diagnóstico.

Estos identificadores se citan únicamente como cobertura existente.

No representan altas ni modificaciones del registro.

---

#### 40. Evidencia de validación

| Clase | Estado | Evidencia |
| --- | --- | --- |
| BUILD | NOT_APPLICABLE | Tarea exclusivamente documental bajo topología DEFINE_ONCE; no autoriza compilación ni cambios físicos. |
| LOCAL | NOT_EXECUTED | La inserción en el archivo propietario y la batería del checkout local corresponden al ciclo documental posterior a esta definición. |
| REMOTA | PASS | Se contrastaron fuentes canónicas vigentes del plan, catálogo de bloqueos, autorización ANIMA, registro modular de requisitos y código actual de `vento-anima` en el commit remoto auditado para identificar la semántica y las brechas AS-IS. |
| OPERATIVA | NOT_EXECUTED | La validación con trabajadores y escenarios reales corresponde a la futura materialización y certificación; esta tarea define el contrato verificable. |
| FÍSICA | NOT_APPLICABLE | No se autorizan modificaciones de dispositivos, geocercas, infraestructura, Supabase ni despliegues. |

---

#### 41. Criterios de aceptación

La tarea queda documentalmente aceptada cuando se cumplen simultáneamente estas condiciones:

1. ubicación, turno/contexto y autorización quedan definidos como causas semánticamente distintas;
2. la clasificación depende del predicado autoritativo y no del texto libre;
3. un prefijo técnico no determina por sí mismo la familia UX;
4. `LOCATION` se limita a evidencia física necesaria para la marcación;
5. sede laboral y punto físico de marcación permanecen separados;
6. configuración rota de geocerca no culpa al trabajador de estar fuera de ubicación;
7. `SHIFT_CONTEXT` cubre ausencia o vigencia de turno y construcción del contexto laboral aplicable;
8. los códigos de turno existentes conservan significado de turno aunque pertenezcan al catálogo de autorización;
9. rol operativo faltante se distingue de una capacidad denegada sobre contexto ya resuelto;
10. `AUTHORIZATION` exige una decisión efectiva de acceso y no un fallo de evaluación;
11. asignación de sede se clasifica por el predicado real y no por la palabra `sede`;
12. timeout, 5xx, configuración inválida o dependencia caída no se muestran como deny;
13. conectividad no se fuerza a ninguna de las tres familias;
14. intención encolada permanece pendiente/offline y no se vuelve error causal falso;
15. respuesta perdida permanece incierta hasta reconciliación;
16. conflicto conserva su propia semántica;
17. el estado de asistencia previo no cambia por mostrar una causa;
18. una entrada bloqueada no se presenta como confirmada;
19. una salida bloqueada no cierra visualmente la sesión;
20. pérdida de permiso operativo no bloquea por sí sola el checkout de una sesión activa;
21. múltiples causas no se priorizan por orden accidental del cliente;
22. la causa primaria proviene de la frontera propietaria o de una precedencia canónica existente;
23. la misma causa mantiene significado entre superficies;
24. la proyección UX puede transportar acción, familia, razón, estado preservado y recuperación sin crear un contrato físico nuevo;
25. cada familia ofrece recuperación pertinente a su dominio;
26. LOCATION no recomienda corregir turno sin causa independiente;
27. SHIFT_CONTEXT no recomienda mover físicamente al trabajador sin causa independiente;
28. AUTHORIZATION no recomienda revalidar GPS sin causa independiente;
29. mensajes técnicos sensibles permanecen ocultos al trabajador;
30. la causa se comunica por texto y semántica accesible, no solo color o icono;
31. el bloqueo permanece visible lo suficiente para actuar;
32. una nueva evidencia autoritativa puede actualizar o retirar la causa;
33. el AS-IS de mensajes libres y clasificación por substrings queda identificado como brecha y no como contrato;
34. la futura migración preserva reason codes estructurados y desacopla copy de semántica;
35. los escenarios obligatorios distinguen correctamente los tres significados de `sede`;
36. no se crean códigos públicos nuevos;
37. no se crean campos físicos nuevos;
38. no se crea ni modifica ningún requisito de prueba;
39. no se ejecutan cambios físicos;
40. el handoff a la siguiente tarea conserva offline como responsabilidad separada.

---

#### 42. Límites

Esta tarea no define:

- la estructura general de una explicación de bloqueo, ya aprobada en `ANIMA-UX-009`;
- el diseño completo de cola offline, propiedad de `ANIMA-UX-011`;
- la recuperación de una marcación interrumpida o de resultado incierto, propiedad de `ANIMA-UX-012`;
- la implementación física de un clasificador de causas;
- nuevos reason codes públicos;
- nuevos enums de base de datos o API;
- nuevas tablas, columnas, vistas, funciones, RPC, triggers, grants o políticas RLS;
- cambios de geocercas productivas;
- cambios de coordenadas o radios físicos;
- cambios de horarios publicados;
- cambios de roles o permisos efectivos;
- una precedencia global nueva para todos los errores del ecosistema;
- una taxonomía completa de soporte técnico;
- el contrato detallado de conectividad y sincronización;
- copy definitivo por cada razón del catálogo global de bloqueos cuando ya exista un propietario específico;
- correcciones administrativas de asistencia;
- overrides de marcación;
- implementación móvil;
- despliegue;
- materialización Supabase.

---

#### 43. Handoff a ANIMA-UX-011

La tarea entrega a `ANIMA-UX-011` una frontera estable:

```text
SI LA CAUSA DEMOSTRADA ES LOCATION
->
MOSTRAR RECUPERACION FISICA

SI LA CAUSA DEMOSTRADA ES SHIFT_CONTEXT
->
MOSTRAR RECUPERACION DE TURNO / CONTEXTO

SI LA CAUSA DEMOSTRADA ES AUTHORIZATION
->
MOSTRAR RECUPERACION DE ACCESO

SI LA INTENCION ESTA ENCOLADA O DEPENDE DE CONECTIVIDAD
->
NO FORZAR NINGUNA DE LAS TRES
->
ENTREGAR A CONTRATO OFFLINE
```

`ANIMA-UX-011` podrá diseñar la experiencia de cola offline sin tener que redefinir ubicación, turno o autorización y sin presentar la cola como una cuarta forma de denegación empresarial.

---

#### 44. Continuidad

**ÚLTIMA TAREA APROBADA**
`ANIMA-UX-009 — Explicar por qué no se puede marcar`

**TAREA ACTUAL APROBADA**
`ANIMA-UX-010 — Diferenciar error de ubicación, turno y autorización`

**SIGUIENTE TAREA RESERVADA**
`ANIMA-UX-011 — Diseñar manejo comprensible de cola offline`


### ✅ ANIMA-UX-011 — Diseñar manejo comprensible de cola offline

**Estado:** APROBADA
**Tarea anterior:** ANIMA-UX-010 — Diferenciar error de ubicación, turno y autorización
**Tarea siguiente:** ANIMA-UX-012 — Permitir reanudar una marcación interrumpida
**Tipo de tarea:** documental; diseño UX TO-BE del manejo comprensible de la cola offline de marcaciones personales en ANIMA, separando intención laboral, persistencia durable local, transporte/sincronización y resultado autoritativo, con recuperación idempotente, tratamiento explícito de incertidumbre y conflicto, sin redefinir la infraestructura transversal de colas ni la reanudación completa de flujos interrumpidos
**Bloque:** F_ANIMA — EXPERIENCIA DEL TRABAJADOR Y ADMINISTRACION
**Repositorio propietario:** vento-group-sas/vento-shell
**Archivo propietario:** docs/plan-canonico/modular/bloques/F_ANIMA/02_EXPERIENCIA_DEL_TRABAJADOR_Y_ADMINISTRACION.md
**Estado físico resultante:** ESPECIFICADO_NO_MATERIALIZADO
**Cambios físicos autorizados:** ninguno durante esta tarea
**Requisitos de prueba creados o modificados:** 0

---

#### 1. Propósito

Diseñar la experiencia objetivo mediante la cual un trabajador entiende qué ocurrió con una marcación de entrada o salida cuando no puede enviarse o confirmarse de inmediato y debe conservarse localmente para procesamiento posterior.

La experiencia debe impedir cinco confusiones críticas:

1. **sin conexión** no significa automáticamente **marcación guardada**;
2. **marcación guardada localmente** no significa **marcación aplicada**;
3. **en cola** no significa **confirmada por la fuente de verdad**;
4. **reintento** no significa **crear una nueva marcación**;
5. **resultado incierto** no significa **fallo** ni autoriza repetir ciegamente la intención.

El resultado de esta tarea es un contrato UX completo para representar persistencia local, espera, sincronización, retry, resultado desconocido, conflicto, intervención y confirmación final sin convertir la cola del dispositivo en fuente de verdad de asistencia.

---

#### 2. Alcance funcional

Esta tarea cubre únicamente la experiencia personal de cola asociada a marcaciones de asistencia del trabajador dentro de ANIMA.

Incluye:

- entrada y salida cuya intención ya fue iniciada;
- persistencia local durable de la intención;
- espera por conectividad o disponibilidad de dependencia;
- sincronización automática o manual de la misma intención;
- retry seguro de la misma identidad idempotente;
- resultado remoto confirmado;
- resultado remoto incierto;
- conflicto de secuencia o contenido;
- necesidad de intervención;
- representación de varias marcaciones pendientes;
- reinicio o reapertura cuando la intención ya quedó durablemente en cola;
- separación entre información útil al trabajador y diagnóstico técnico.

No incluye la implementación física de SecureStore, workers, RPC, tablas, RLS, Edge Functions, contratos de red, política transversal de retry o infraestructura general de colas.

---

#### 3. Handoff recibido de ANIMA-UX-008, ANIMA-UX-009 y ANIMA-UX-010

La tarea consume tres contratos ya aprobados:

- `ANIMA-UX-008` define que una marcación pendiente no puede representarse como confirmada;
- `ANIMA-UX-009` define cómo explicar humanamente que una marcación no pudo completarse o confirmarse;
- `ANIMA-UX-010` separa las causas de ubicación, turno y autorización de fallos técnicos, conectividad, sincronización e incertidumbre.

Por tanto, esta tarea no vuelve a decidir si el bloqueo original fue de ubicación, turno o autorización. Cuando una intención alcanza la cola, la interfaz conserva la causa estructurada disponible y añade exclusivamente el estado de continuidad/transporte correspondiente.

La cola no convierte una denegación de ubicación, turno o autorización en un problema de conectividad y tampoco convierte una indisponibilidad técnica en una denegación empresarial.

---

#### 4. Principio rector: cola no es fuente de verdad de asistencia

La cola offline es un mecanismo de continuidad y transporte.

```text
INTENCIÓN DE MARCAR
+
PERSISTENCIA LOCAL DURABLE
=
INTENCIÓN CONSERVADA PARA PROCESAMIENTO POSTERIOR
```

No equivale a:

```text
MARCACIÓN APLICADA
```

La fuente de verdad de asistencia continúa siendo el resultado autoritativo definido por los contratos propietarios de ANIMA, autorización, servidor y datos.

La UI solo puede utilizar lenguaje de confirmación cuando existe evidencia autoritativa o reconciliada de que la misma intención fue aplicada.

---

#### 5. Cuatro planos que la experiencia debe mantener separados

Toda presentación de cola distingue conceptualmente cuatro planos:

| Plano | Pregunta que responde | Ejemplo |
| --- | --- | --- |
| Intención laboral | ¿Qué quiso hacer el trabajador? | Registrar entrada o registrar salida. |
| Persistencia local | ¿La intención quedó guardada de forma durable en este dispositivo? | Guardada de forma segura o no guardada. |
| Transporte / sincronización | ¿Puede enviarse, está esperando, sincronizando o requiere retry? | Esperando conexión, sincronizando, retry programado. |
| Resultado autoritativo | ¿La fuente de verdad confirmó qué ocurrió? | Confirmada, conflicto, resultado todavía desconocido. |

Ninguno de estos planos sustituye a otro.

Un indicador de conectividad no es evidencia de persistencia; una fila local no es evidencia de aplicación remota; una respuesta de transporte no reemplaza el resultado empresarial.

---

#### 6. Modelo conceptual de estados visibles

Para el diseño UX se establecen los siguientes conceptos de presentación:

| Concepto | Significado para el trabajador | Puede afirmar confirmación |
| --- | --- | --- |
| `SAVING_LOCALLY` | La aplicación intenta conservar de forma durable la intención. | No |
| `QUEUED_DURABLE` | La intención quedó guardada localmente y conserva identidad estable. | No |
| `WAITING_TO_SYNC` | La intención durable espera una condición que permita enviarla. | No |
| `SYNCING` | La misma intención está siendo procesada contra su destino propietario. | No |
| `RETRY_SCHEDULED` | Un fallo transitorio permite otro intento seguro de la misma intención. | No |
| `RESULT_UNKNOWN` | La frontera de efecto pudo haberse cruzado, pero aún no existe prueba suficiente del resultado. | No |
| `CONFLICT` | La fuente o la secuencia vigente impide aceptar silenciosamente el evento como equivalente. | No |
| `REQUIRES_INTERVENTION` | La intención no puede avanzar automáticamente y necesita una resolución controlada. | No |
| `CONFIRMED` | La fuente de verdad confirmó o reconcilió que esa misma intención fue aplicada. | Sí |
| `LOCAL_SAVE_FAILED` | No se pudo demostrar persistencia durable local. | No |

Estos nombres son conceptos documentales de presentación. No crean enums físicos, reason codes, tablas ni contratos de API.

---

#### 7. `SAVING_LOCALLY` — guardado todavía no demostrado

Mientras la persistencia local está en curso:

- la interfaz puede indicar `Guardando la entrada en este dispositivo...` o `Guardando la salida en este dispositivo...`;
- no muestra `Guardado`;
- no muestra `En cola`;
- no muestra `Se sincronizará`;
- no cambia el estado autoritativo de asistencia;
- bloquea una segunda intención equivalente mientras se resuelve si la primera quedó durablemente conservada.

Si la operación de persistencia termina sin confirmación positiva, el estado debe pasar a `LOCAL_SAVE_FAILED` o a una condición técnica explícitamente no concluyente; nunca a `QUEUED_DURABLE` por optimismo.

---

#### 8. `QUEUED_DURABLE` — intención localmente protegida

La etiqueta de encolado solo es válida cuando la capa propietaria puede demostrar que la intención completa fue persistida de forma durable.

La experiencia puede comunicar:

- `Entrada guardada en este dispositivo. Pendiente de sincronización.`
- `Salida guardada en este dispositivo. Pendiente de sincronización.`

El término `guardada` describe exclusivamente persistencia local durable.

Debe quedar explícito, por texto o jerarquía semántica equivalente, que todavía falta confirmación del sistema.

---

#### 9. `WAITING_TO_SYNC` — espera no equivalente a fallo

Una intención durable puede estar en espera por ausencia de red, dependencia temporalmente no disponible, ventana de retry o condición técnica equivalente.

La UI debe expresar que:

- la intención está protegida localmente;
- no hace falta volver a crearla;
- el sistema intentará continuar según la política propietaria;
- la marcación todavía no está confirmada.

Ejemplo:

`No hay conexión estable. Tu entrada está guardada en este dispositivo y sigue pendiente de confirmación.`

La ausencia de conectividad no debe presentarse como error de ubicación, turno o autorización.

---

#### 10. `SYNCING` — procesamiento de la misma intención

Durante sincronización:

- se mantiene la identidad original de la marcación;
- la UI indica `Sincronizando tu entrada guardada...` o `Sincronizando tu salida guardada...`;
- no reaparece un CTA que genere otra entrada o salida equivalente;
- un spinner o animación representa procesamiento, no éxito;
- el estado principal de asistencia permanece sujeto a la última evidencia autoritativa disponible.

La finalización del intento de red no basta por sí sola: la transición a `CONFIRMED` exige resultado empresarial autoritativo o reconciliado.

---

#### 11. `RETRY_SCHEDULED` — continuidad automática segura

Un fallo clasificado como transitorio puede conservar un próximo intento.

La experiencia no necesita exponer algoritmos, backoff, número técnico de lease ni excepciones internas, pero sí debe dejar claro:

- que la intención continúa guardada;
- que el intento anterior no confirmó la marcación;
- que se intentará nuevamente la **misma** intención;
- que el trabajador no debe crear otra marcación equivalente.

Cuando sea útil puede mostrarse `Volveremos a intentar automáticamente` sin prometer una hora exacta que la política de retry no garantice.

---

#### 12. `RESULT_UNKNOWN` — resultado incierto y conciliación

Cuando un envío pudo alcanzar una frontera de efecto pero la aplicación perdió la confirmación autoritativa, la interfaz debe conservar incertidumbre explícita.

Texto base:

- `Todavía no podemos confirmar si tu entrada fue aplicada. Estamos verificando el resultado.`
- `Todavía no podemos confirmar si tu salida fue aplicada. Estamos verificando el resultado.`

En este estado:

- no se declara éxito;
- no se declara fallo;
- no se elimina la intención original;
- no se crea una clave idempotente nueva para repetir ciegamente;
- no se ofrece `Registrar de nuevo` como salida ordinaria;
- la siguiente acción segura es consultar, conciliar o esperar resolución del mismo evento.

---

#### 13. `CONFLICT` — divergencia que no admite retry ciego

Un conflicto significa que el estado vigente, la secuencia, el contenido o la identidad observados no permiten aplicar silenciosamente el evento pendiente.

La experiencia debe:

- identificar si se trata de la entrada o la salida afectada;
- conservar la evidencia original;
- evitar presentar el conflicto como simple falta de conexión;
- evitar repetir automáticamente una operación que podría producir otro efecto;
- explicar qué necesita revisión o cuál es la siguiente acción segura disponible.

Ejemplo genérico:

`Tu entrada guardada no coincide con el estado actual de tu jornada. No la repetiremos automáticamente hasta resolver la diferencia.`

La clasificación humana concreta consume el resultado estructurado propietario; no se infiere por búsqueda de palabras en mensajes técnicos.

---

#### 14. `REQUIRES_INTERVENTION` — continuidad fuera del camino automático

Una intención pasa a intervención cuando el sistema no puede resolverla de forma segura mediante espera o retry ordinario.

La UI debe mostrar:

- qué marcación está afectada;
- que el evento original sigue conservado cuando corresponda;
- que ya no está en un ciclo automático normal;
- qué acción de soporte, revisión o escalamiento está disponible;
- que la ausencia de confirmación no equivale a una marcación aplicada.

La intervención no otorga al trabajador una capacidad de ajuste administrativo, override o edición histórica que no posea.

---

#### 15. `CONFIRMED` — cierre autoritativo de la intención

Solo un resultado autoritativo o reconciliado permite retirar la intención de la experiencia pendiente y presentar confirmación.

Para una entrada:

- `Entrada confirmada`;
- se actualiza la jornada desde la fuente de verdad;
- puede mostrarse la hora efectiva autoritativa según el contrato propietario.

Para una salida:

- `Salida confirmada`;
- se actualiza la jornada desde la fuente de verdad;
- solo entonces puede afirmarse que el contexto de asistencia quedó cerrado cuando así corresponda.

La cola deja de competir visualmente con la marcación una vez reconciliado el mismo evento.

---

#### 16. `LOCAL_SAVE_FAILED` — no existe derecho a decir “en cola”

Si la aplicación no puede demostrar que la intención fue guardada durablemente:

- no muestra `Guardada`;
- no muestra `En cola`;
- no muestra `Se enviará automáticamente`;
- no incrementa un contador visible de pendientes como si el evento estuviera protegido;
- no cambia optimistamente la asistencia a un estado confirmado.

Texto base:

- `No pudimos guardar tu entrada de forma segura en este dispositivo. No está en cola.`
- `No pudimos guardar tu salida de forma segura en este dispositivo. No está en cola.`

La siguiente acción depende del estado real de la intención y de las reglas de recuperación; no se asume que repetir es seguro si existe posibilidad de efecto remoto previo.

---

#### 17. Vocabulario humano para entrada

La familia mínima de mensajes para check-in es:

| Situación | Mensaje principal permitido |
| --- | --- |
| Guardado local en curso | `Guardando la entrada en este dispositivo...` |
| Guardado durable | `Entrada guardada en este dispositivo. Pendiente de sincronización.` |
| Espera por conectividad | `Tu entrada está guardada. Se sincronizará cuando podamos continuar de forma segura.` |
| Sincronizando | `Sincronizando tu entrada guardada...` |
| Retry transitorio | `Tu entrada sigue guardada. Volveremos a intentar automáticamente.` |
| Resultado incierto | `Todavía no podemos confirmar si tu entrada fue aplicada.` |
| Conflicto | `Tu entrada guardada necesita revisión antes de continuar.` |
| Intervención | `Tu entrada sigue sin confirmarse y necesita revisión.` |
| Confirmada | `Entrada confirmada.` |
| Fallo de persistencia | `No pudimos guardar tu entrada de forma segura en este dispositivo. No está en cola.` |

Los textos específicos pueden añadir causa y siguiente acción sin contradecir el estado estructurado.

---

#### 18. Vocabulario humano para salida

La familia mínima de mensajes para check-out es:

| Situación | Mensaje principal permitido |
| --- | --- |
| Guardado local en curso | `Guardando la salida en este dispositivo...` |
| Guardado durable | `Salida guardada en este dispositivo. Pendiente de sincronización.` |
| Espera por conectividad | `Tu salida está guardada. Se sincronizará cuando podamos continuar de forma segura.` |
| Sincronizando | `Sincronizando tu salida guardada...` |
| Retry transitorio | `Tu salida sigue guardada. Volveremos a intentar automáticamente.` |
| Resultado incierto | `Todavía no podemos confirmar si tu salida fue aplicada.` |
| Conflicto | `Tu salida guardada necesita revisión antes de continuar.` |
| Intervención | `Tu salida sigue sin confirmarse y necesita revisión.` |
| Confirmada | `Salida confirmada.` |
| Fallo de persistencia | `No pudimos guardar tu salida de forma segura en este dispositivo. No está en cola.` |

Una salida pendiente nunca utiliza por sí sola `Jornada cerrada`, `Listo por hoy` ni otro lenguaje equivalente a cierre autoritativo.

---

#### 19. Persistencia durable como prerequisito de la afirmación de cola

La UI no deduce durabilidad porque una función local haya sido invocada.

Debe existir una señal positiva de la capa propietaria que permita afirmar que el registro necesario sobrevivirá a cierre o reinicio según el contrato vigente.

Si el mecanismo local captura una excepción y continúa sin propagar un resultado verificable, esa ruta no satisface por sí misma el criterio UX para `QUEUED_DURABLE`.

La materialización futura deberá hacer observable la diferencia entre:

```text
INTENTO DE GUARDAR
```

y:

```text
GUARDADO DURABLE CONFIRMADO
```

---

#### 20. Identidad idempotente de la intención

Cada marcación que entra a continuidad conserva una identidad estable creada antes del primer envío que pueda producir efecto.

En la experiencia esto implica:

- retry automático reutiliza la misma identidad;
- retry manual autorizado reutiliza la misma identidad;
- reapertura de la app recupera la misma identidad;
- una respuesta tardía se asocia al mismo evento;
- el trabajador no debe volver a construir manualmente otra intención equivalente para “destrabar” la primera.

La UI no necesita mostrar el identificador técnico en el camino ordinario, pero su estabilidad es condición de seguridad para la experiencia.

---

#### 21. Evidencia mínima preservada con la intención

La cola de asistencia debe poder mantener la información requerida por el contrato propietario para reconstruir y conciliar el evento, incluyendo cuando aplique:

- actor;
- tipo de acción: entrada o salida;
- sede y contexto laboral resueltos;
- turno o referencia laboral aplicable;
- instante de captura;
- evidencia de geolocalización requerida;
- identidad idempotente;
- versión o contexto necesario para decidir compatibilidad;
- datos de error o intento necesarios para recuperación.

La UI ordinaria muestra solo el subconjunto útil y no sensible. La conservación técnica completa no implica exposición visual completa.

---

#### 22. Conectividad y cola son estados distintos

El indicador de red responde si el dispositivo puede comunicarse razonablemente con sus dependencias.

El estado de cola responde si una intención concreta está durablemente protegida y cuál es su estado de procesamiento.

Por tanto:

- `OFFLINE` sin intención guardada no crea un pendiente;
- `ONLINE` puede coexistir con un pendiente que espera retry, conciliación o dependencia;
- recuperar conectividad no confirma automáticamente ninguna marcación;
- un contador de cola no sustituye el estado de red.

Home debe conservar ambos conceptos separados.

---

#### 23. El contador global de pendientes es información secundaria

Un indicador como `PEND 2` puede existir como resumen, pero nunca es la única explicación del estado relevante.

Cuando la acción actual del trabajador está afectada, la interfaz debe identificar al menos:

- si es una entrada o salida;
- si está guardada durablemente;
- si espera sincronización, está sincronizando, requiere retry, está incierta o necesita revisión.

El contador global no puede convertir varias intenciones heterogéneas en un único estado genérico.

---

#### 24. Relación con el estado principal de asistencia

La cola no modifica por sí misma la verdad presentada de la jornada.

Reglas obligatorias:

1. entrada pendiente no equivale a `En turno`;
2. salida pendiente no equivale a `Jornada cerrada`;
3. una proyección optimista puede apoyar animación o continuidad local, pero no adoptar lenguaje autoritativo;
4. una confirmación remota del mismo evento sí permite actualizar el estado principal;
5. conflicto o resultado incierto mantienen explícita la diferencia entre intención y verdad autoritativa.

Si Home muestra simultáneamente estado de jornada y cola, ambos deben poder leerse sin contradicción.

---

#### 25. Retry manual

La acción `Reintentar ahora` solo se ofrece cuando la clasificación propietaria permite un nuevo intento seguro de la misma intención.

No se ofrece como acción genérica cuando:

- existe `RESULT_UNKNOWN`;
- existe conflicto no resuelto;
- se agotó una política definitiva;
- la intención fue cancelada, revocada o dejó de ser elegible;
- un nuevo intento requeriría crear una intención materialmente distinta.

Cuando sí procede, el retry manual no cambia la identidad idempotente ni reinicia silenciosamente el presupuesto propietario.

---

#### 26. Retry automático y backoff

La sincronización automática puede operar sin exigir interacción del trabajador.

La UX no expone el algoritmo interno, pero debe respetar sus decisiones:

- fallo transitorio puede permanecer en espera;
- throttling puede desplazar el siguiente intento;
- dependencia no disponible puede conservar espera;
- error definitivo no se presenta como `reintentaremos automáticamente`;
- resultado ambiguo no entra en retry ciego;
- agotamiento y conflicto no se disimulan como simple falta de señal.

La capa visual consume el estado resultante; no inventa una política paralela.

---

#### 27. Respuesta perdida después de un posible efecto

Una pérdida de respuesta después del envío puede significar que el servidor aplicó la operación aunque el cliente no haya recibido confirmación.

La experiencia debe pasar a incertidumbre y conciliación:

```text
POSIBLE EFECTO
+
SIN RESULTADO AUTORITATIVO OBSERVABLE
=
RESULTADO DESCONOCIDO
```

No se crea otra entrada o salida como mecanismo de recuperación.

Si posteriormente la fuente de verdad confirma el evento original, la UI transiciona a confirmado y elimina la incertidumbre del mismo evento.

---

#### 28. Conflictos de secuencia

Las secuencias imposibles o divergentes no se resuelven con último-write-gana desde la UI.

Ejemplos conceptuales:

- una salida pendiente cuando la fuente no observa una entrada compatible;
- una entrada pendiente cuando ya existe una entrada activa incompatible;
- una salida asociada a una sede que no coincide con la jornada activa;
- el mismo identificador con contenido materialmente distinto.

La experiencia preserva el evento original, informa que existe una diferencia y dirige a la resolución propietaria correspondiente.

---

#### 29. Fallos definitivos y agotamiento

Cuando una intención durable no puede seguir por una causa definitiva:

- sale del ciclo de retry ordinario;
- no desaparece silenciosamente;
- no se convierte en confirmada;
- conserva evidencia suficiente para trazabilidad y soporte;
- muestra una acción coherente con la causa: revisar, solicitar ayuda, esperar resolución o reconocer el estado cuando corresponda.

La eliminación visual de un pendiente solo ocurre después de una resolución trazable, no porque resulte incómodo mostrarlo.

---

#### 30. Reinicio o reapertura con una intención ya durable

Si el dispositivo se reinicia o la aplicación se vuelve a abrir y la intención estaba durablemente guardada, la experiencia debe poder reconstruir:

- qué acción estaba pendiente;
- la identidad del evento;
- el estado de sincronización conocido;
- la evidencia mínima necesaria;
- la siguiente acción segura.

El reinicio no crea una nueva marcación y no reinicia el evento desde cero.

La reanudación completa de flujos interrumpidos antes o alrededor de esta frontera se desarrolla en `ANIMA-UX-012`; esta tarea únicamente fija la continuidad normal de un elemento que ya pertenece legítimamente a la cola.

---

#### 31. Varias marcaciones pendientes

Cuando existen varios eventos pendientes, cada uno conserva identidad y estado propios.

La experiencia puede resumir el total, pero el detalle debe permitir distinguir:

- entrada o salida;
- instante de captura;
- estado actual;
- si puede seguir automáticamente;
- si requiere atención;
- si existe conflicto o resultado desconocido.

No se utiliza una sola bandera global para inferir que todos los elementos tienen la misma causa o la misma posibilidad de retry.

---

#### 32. Orden y dependencias entre eventos

La cola no debe presentar como independientes eventos cuya semántica dependa de una secuencia laboral.

Por ejemplo, una salida capturada después de una entrada aún pendiente puede depender de que la fuente de verdad reconcilie primero la entrada correspondiente.

La UI:

- no promete un orden físico específico si el contrato de infraestructura no lo garantiza;
- sí informa cuando un elemento espera la resolución de otro;
- no habilita acciones que rompan la secuencia canónica;
- conserva la identidad de cada intención.

La decisión técnica de scheduling, claim y orden pertenece a la infraestructura y al contrato de asistencia, no a la presentación.

---

#### 33. Relación entre dispositivos

La persistencia local pertenece al dispositivo que realmente conserva el evento.

Por tanto:

- otro dispositivo no puede asumir que conoce una cola local que nunca fue sincronizada;
- la ausencia de un pendiente en otro dispositivo no demuestra que la intención original no exista;
- la protección contra duplicados entre dispositivos depende de identidad idempotente y reconciliación de servidor;
- una segunda sesión no debe fabricar una confirmación a partir de una proyección local ajena.

La experiencia ordinaria evita prometer sincronización cross-device de datos que todavía solo existen localmente.

---

#### 34. Tratamiento del tiempo

La cola puede mostrar el instante en que el trabajador generó la intención, pero debe etiquetarlo como captura o intento cuando todavía no existe hora efectiva autoritativa.

Ejemplos:

- `Entrada capturada a las 07:02 — pendiente de confirmación.`
- `Salida capturada a las 17:04 — sincronizando.`

La hora local capturada no se presenta como la hora laboral definitivamente aplicada hasta que el contrato propietario determine el resultado y su tiempo efectivo.

---

#### 35. Tratamiento de sede y contexto

La tarjeta de cola puede mostrar una referencia humana al contexto de la intención para que el trabajador reconozca el evento.

Debe utilizar el contexto que pertenecía legítimamente a la marcación y no permitir que un selector posterior reescriba retroactivamente el evento guardado.

Cambiar la sede visible para una acción futura no muta silenciosamente la sede del evento pendiente.

Si la fuente detecta incompatibilidad de contexto, se presenta como conflicto o causa estructurada propietaria, no se corrige localmente por conveniencia.

---

#### 36. Información técnica y diagnóstico

El camino ordinario del trabajador no expone:

- claves idempotentes completas;
- payloads;
- códigos internos no traducidos;
- stack traces;
- nombres de tablas, RPC o Storage;
- conteos de lease o fencing;
- detalles de backoff sin utilidad operativa.

Cuando soporte autorizado requiera diagnóstico, la aplicación puede ofrecer una referencia segura y mínima que permita correlacionar el evento sin revelar secretos.

La experiencia de diagnóstico permanece separada del mensaje principal.

---

#### 37. Accesibilidad y persistencia visual

Los estados de cola deben entenderse sin depender solo de color, icono, animación, toast o vibración.

Cada estado material necesita:

- texto legible;
- semántica accesible;
- acción identificable cuando exista;
- persistencia suficiente para que el trabajador pueda volver a consultar el estado;
- contraste entre `pendiente`, `sincronizando`, `conflicto`, `requiere revisión` y `confirmado`.

Una notificación transitoria puede complementar el estado, nunca sustituirlo.

---

#### 38. Auditoría AS-IS de ANIMA

El código vigente presenta una base de cola utilizable, pero todavía mezcla señales que esta tarea separa documentalmente.

Hallazgos materiales:

1. la persistencia de la cola de asistencia utiliza almacenamiento seguro local;
2. el helper actual de persistencia captura errores de escritura y registra diagnóstico sin devolver al llamador una confirmación negativa verificable;
3. rutas superiores pueden continuar después del intento de encolado y devolver `queued: true`;
4. el Home actual dispone de estados `queued`, `syncing`, `failed`, conteos de pendientes y retry;
5. `PendingSyncCard` resume `Registros pendientes: N` y puede indicar que se sincronizarán automáticamente;
6. Home puede presentar `Pendiente de sincronización` o `Registro guardado. Se sincroniza automáticamente.` como mensajes genéricos;
7. la lógica de decisiones ya distingue conflictos de secuencia y duplicados en parte del flujo;
8. la representación visible aún no prueba en todos los caminos que `guardado` signifique persistencia durable confirmada ni diferencia de forma completa entrada, salida, incertidumbre y conflicto.

Estos hallazgos son evidencia AS-IS. No autorizan cambios físicos durante esta tarea.

---

#### 39. Matriz de escenarios UX

| Escenario | Estado visible principal | ¿Puede repetir la marcación? | ¿Puede afirmar confirmación? | Siguiente comportamiento |
| --- | --- | --- | --- | --- |
| Sin red y persistencia local todavía en curso | Guardando localmente | No | No | Esperar resultado de persistencia. |
| Sin red y persistencia durable confirmada | Guardada; pendiente de sincronización | No | No | Esperar conectividad o retry seguro. |
| Sin red y persistencia local falló | No quedó guardada en cola | Solo si la capa propietaria demuestra que es seguro | No | Recuperación o explicación técnica segura. |
| Con red, elemento durable listo | Sincronizando | No | No | Procesar misma identidad. |
| Fallo transitorio | Sigue guardada; retry previsto | Solo mediante retry de la misma identidad cuando esté permitido | No | Retry automático/manual según política. |
| Timeout después de posible efecto | Resultado todavía no confirmado | No | No | Conciliar la misma intención. |
| Duplicado reconocido como mismo efecto | Resultado reconciliado | No | Sí cuando la fuente lo confirma | Mostrar estado autoritativo existente. |
| Conflicto de secuencia | Necesita revisión | No como retry ordinario | No | Resolver diferencia. |
| Error definitivo | Requiere intervención | No por defecto | No | Escalar o resolver por flujo propietario. |
| Confirmación remota | Entrada o salida confirmada | No | Sí | Actualizar jornada y retirar pendiente. |
| Dos eventos pendientes distintos | Resumen + detalle por evento | Depende de cada evento | Solo por evento confirmado | Mantener estados independientes. |
| Reinicio de app con evento durable | Pendiente recuperada | No | No | Reanudar procesamiento del mismo evento. |

---

#### 40. Requisitos de prueba derivados

**Resultado:** NO GENERA REQUISITOS DE PRUEBA

**Requisitos creados:** 0

**Requisitos modificados:** 0

**Requisitos diferidos:** 0

**Requisitos descartados:** 0

**Requisitos obsoletos:** 0

La cobertura vigente ya protege durabilidad previa a la afirmación de encolado, idempotencia, separación de estados, recuperación sin duplicados, fuente de verdad, conflictos e incertidumbre. Esta tarea concreta su proyección UX para la cola de asistencia sin ampliar el registro.

---

#### 41. Cobertura de prueba vigente reutilizada

La trazabilidad reutiliza, sin modificar, la cobertura existente:

- `TREQ-ANIMA-003`: una marcación offline solo puede presentarse como encolada después de confirmar persistencia durable, conserva identidad estable y sincroniza sin duplicar efectos;
- `TREQ-ANIMA-015`: Home separa asistencia, geocerca, conectividad, cola, sincronización y diagnóstico, y no presenta como aplicada una marcación pendiente o fallida;
- `TREQ-UX-002`: fallos y bloqueos explican qué ocurrió, qué se conservó y cómo continuar sin duplicar efectos;
- `TREQ-UX-005`: la interfaz hace visible fuente de verdad y diferencia confirmado de pendiente;
- `TREQ-UX-006`: las tareas críticas distinguen pendiente, confirmado, fallido, conflicto y requiere intervención;
- `TREQ-UX-018`: operaciones pendientes conservan estado, propietario e idempotencia y se reanudan sin restaurar contexto obsoleto ni duplicar efectos;
- `TREQ-UX-031`: espera y bloqueo permanecen semánticamente distintos y todo bloqueo conserva responsable y siguiente acción;
- `TREQ-UX-036`: completar offline permanece pendiente de sincronización y la reanudación debe revalidar contexto y resolver conflictos sin último-write-gana destructivo.

Esta enumeración es trazabilidad de cobertura existente y no constituye actualización del registro.

---

#### 42. Evidencia de validación

| Clase | Estado | Evidencia |
| --- | --- | --- |
| BUILD | NOT_APPLICABLE | La tarea es una definición documental `DEFINE_ONCE`; no produce build ni artefacto ejecutable propio. |
| LOCAL | NOT_EXECUTED | No existe evidencia de ejecución local de la tarea ya insertada en el checkout canónico durante esta definición documental. |
| REMOTA | PASS | Se contrastaron las fuentes canónicas vigentes de continuidad, topología, contratos UX/ANIMA, infraestructura transversal de colas y el código actual de cola y Home en los repositorios propietarios antes de cerrar el diseño. |
| OPERATIVA | NOT_EXECUTED | La comprensión del flujo por trabajadores reales se valida posteriormente en la tarea canónica de prueba con usuarios. |
| FÍSICA | NOT_APPLICABLE | La topología `DEFINE_ONCE` y el gate `NO_PHYSICAL_INSTANCE` excluyen materialización física propia para esta tarea. |

---

#### 43. Criterios de aceptación

La tarea queda documentalmente satisfecha cuando se cumplen simultáneamente estos criterios:

1. offline no se utiliza como sinónimo de encolado;
2. una intención solo se presenta como `guardada` o `en cola` tras evidencia positiva de persistencia durable;
3. el fallo de persistencia local tiene un estado propio y no produce falsa promesa de sincronización;
4. entrada y salida pendientes se identifican explícitamente;
5. el contador global de pendientes permanece secundario frente al estado del evento relevante;
6. cola y conectividad se presentan como planos distintos;
7. cola y estado autoritativo de asistencia se presentan como planos distintos;
8. entrada pendiente no se representa como jornada activa confirmada;
9. salida pendiente no se representa como jornada cerrada confirmada;
10. retry automático conserva la identidad original;
11. retry manual, cuando procede, conserva la identidad original;
12. un retry no crea otra intención empresarial equivalente;
13. la UI no reinicia silenciosamente presupuesto, deadline o autoridad de retry;
14. resultado incierto se diferencia de fallo;
15. resultado incierto prohíbe retry ciego;
16. conflicto se diferencia de fallo transitorio;
17. conflicto conserva evidencia y exige resolución propietaria;
18. error definitivo o agotamiento no se presenta como espera ordinaria;
19. intervención no concede capacidades administrativas por presentación;
20. el reinicio recupera el mismo elemento durable sin fabricar otro evento;
21. varias marcaciones pendientes conservan identidad y estado individual;
22. dependencias de secuencia no se ocultan detrás de un único contador;
23. otro dispositivo no se trata como poseedor automático de una cola únicamente local;
24. el instante de captura no se presenta como hora efectiva autoritativa antes de confirmación;
25. sede y contexto del evento pendiente no se reescriben por cambios posteriores de selección;
26. el camino ordinario no expone secretos ni diagnósticos técnicos innecesarios;
27. los estados materiales son accesibles sin depender solo de color, icono, toast o animación;
28. una notificación de background no declara confirmación antes del resultado autoritativo;
29. el diseño consume la clasificación causal de `ANIMA-UX-010` sin redefinirla;
30. la experiencia general de error aprobada en `ANIMA-UX-009` permanece vigente;
31. la distinción confirmado/pendiente de `ANIMA-UX-008` permanece vigente;
32. la reanudación completa de una interacción interrumpida permanece reservada a `ANIMA-UX-012`;
33. la infraestructura general de colas permanece propietaria del bloque transversal correspondiente;
34. no se crean enums físicos, reason codes, RPC, tablas, migraciones, políticas RLS ni cambios de código;
35. no se crean ni modifican requisitos de prueba;
36. no existe materialización física propia.

---

#### 44. Límites

Esta tarea no:

- implementa la cola de ANIMA;
- modifica SecureStore ni otro mecanismo de persistencia;
- define un esquema físico nuevo para eventos pendientes;
- redefine la política transversal de retry, backoff, deadline, claim, lease, fencing, DLQ o cancelación;
- redefine idempotencia de servidor;
- cambia tablas, funciones, RPC, triggers, grants, RLS, Storage, Realtime, Edge Functions o tipos generados;
- cambia la autorización para marcar;
- redefine ubicación, turno o autorización;
- convierte una cola local en fuente de verdad laboral;
- diseña la recuperación completa de un flujo que fue interrumpido antes de quedar legítimamente durable en cola;
- ejecuta pruebas con trabajadores reales;
- autoriza implementación física.

Cualquier cambio físico necesario para cumplir este contrato se materializa únicamente mediante sus tareas y paquetes propietarios posteriores.

---

#### 45. Handoff a ANIMA-UX-012

`ANIMA-UX-012 — Permitir reanudar una marcación interrumpida` recibe la frontera exacta que esta tarea deja preparada.

Esta tarea ya decide qué significa que una intención esté legítimamente guardada, esperando, sincronizando, incierta, en conflicto o resuelta.

La tarea siguiente deberá diseñar qué ocurre cuando la interacción se interrumpe por navegación, suspensión, cierre de aplicación, bloqueo de pantalla, pérdida de permiso, pérdida de respuesta u otra interrupción antes o durante esos puntos, recuperando la misma intención cuando exista y evitando duplicados.

`ANIMA-UX-012` no deberá redefinir que:

- solo persistencia durable habilita lenguaje de cola;
- una intención pendiente no es una marcación confirmada;
- `RESULT_UNKNOWN` exige conciliación;
- retry seguro conserva identidad;
- conflicto no admite repetición ciega.

---

#### 46. Continuidad

**ÚLTIMA TAREA APROBADA**
`ANIMA-UX-010 — Diferenciar error de ubicación, turno y autorización`

**TAREA ACTUAL APROBADA**
`ANIMA-UX-011 — Diseñar manejo comprensible de cola offline`

**SIGUIENTE TAREA RESERVADA**
`ANIMA-UX-012 — Permitir reanudar una marcación interrumpida`


### ✅ ANIMA-UX-012 — Permitir reanudar una marcación interrumpida

**Estado:** APROBADA
**Tarea anterior:** ANIMA-UX-011 — Diseñar manejo comprensible de cola offline
**Tarea siguiente:** ANIMA-UX-013 — Simplificar documentos y datos personales
**Tipo de tarea:** documental; diseño UX TO-BE de reanudación segura de una intención personal de check-in o check-out interrumpida, con recuperación del mismo intento, rehidratación del estado visible, revalidación de contexto y prevención de duplicados, sin materialización física
**Bloque:** F_ANIMA — EXPERIENCIA DEL TRABAJADOR Y ADMINISTRACION
**Repositorio propietario:** vento-group-sas/vento-shell
**Archivo propietario:** docs/plan-canonico/modular/bloques/F_ANIMA/02_EXPERIENCIA_DEL_TRABAJADOR_Y_ADMINISTRACION.md
**Estado físico resultante:** ESPECIFICADO_NO_MATERIALIZADO
**Cambios físicos autorizados:** ninguno durante esta tarea
**Requisitos de prueba creados o modificados:** 0

---

#### 1. Propósito

Definir cómo ANIMA debe recuperar una marcación personal de entrada o salida cuando el flujo se interrumpe antes de que el trabajador obtenga un resultado terminal confiable.

La reanudación debe conservar la continuidad de la misma intención cuando exista evidencia suficiente para hacerlo, recuperar el último punto seguro conocido, revalidar el contexto que pudo cambiar durante la interrupción y evitar que volver a la aplicación genere una segunda marcación o haga pasar como confirmada una operación cuyo resultado continúa pendiente o incierto.

El objetivo no es hacer que toda interrupción continúe automáticamente. El objetivo es que cada regreso al flujo produzca una decisión segura entre continuar, revalidar, esperar, conciliar, pedir intervención o iniciar una nueva intención únicamente cuando se haya demostrado que la anterior ya no puede producir efectos.

#### 2. Resultado canónico

La experiencia de reanudación queda regida por esta secuencia conceptual:

```text
INTENCION DE MARCACION
→ INTERRUPCION
→ RECUPERAR EVIDENCIA DISPONIBLE
→ DETERMINAR ULTIMO PUNTO SEGURO
→ REVALIDAR ESTADO ACTUAL
→ RESOLVER LA MISMA INTENCION
   ├─ continuar paso seguro
   ├─ volver a un prerrequisito
   ├─ mostrar pendiente durable
   ├─ conciliar resultado incierto
   ├─ detener por conflicto
   ├─ pedir intervencion
   └─ cerrar como resultado terminal conocido
```

Una interrupción nunca autoriza por sí misma a:

- crear otra intención;
- cambiar el identificador estable de una intención ya materializada;
- repetir un efecto remoto o físico potencialmente ejecutado;
- reutilizar contexto vencido como si continuara vigente;
- presentar una operación como en cola sin persistencia durable demostrada;
- presentar una operación como confirmada sin resultado autoritativo compatible.

#### 3. Definición de marcación interrumpida

Existe una marcación interrumpida cuando el trabajador inició o intentó iniciar un check-in o check-out y, antes de llegar a una salida terminal inequívoca, el flujo perdió continuidad de ejecución o presentación.

La interrupción puede ocurrir por:

- envío de ANIMA a segundo plano;
- bloqueo y posterior desbloqueo del dispositivo;
- apertura de Ajustes del sistema para resolver un permiso;
- prompt del sistema operativo;
- navegación accidental o deep link que saque temporalmente del flujo;
- pérdida temporal de conectividad;
- timeout o pérdida de respuesta después de una solicitud;
- suspensión del proceso;
- cierre inesperado de la aplicación;
- terminación del proceso por el sistema operativo;
- reapertura de ANIMA después de una terminación;
- reinicio del dispositivo cuando exista estado recuperable;
- renovación o reentrada de sesión;
- cambio de superficie dentro de ANIMA mientras la misma intención sigue sin resolver.

No toda interrupción implica que exista trabajo durable. La experiencia debe determinar primero qué evidencia sobrevivió.

#### 4. Unidad de reanudación

La unidad que se reanuda es la **misma intención de marcación**, no la pantalla, el botón ni la navegación que estaba visible antes de la interrupción.

Cuando la intención ya tenga identidad estable, esa identidad se conserva durante toda recuperación compatible.

Cuando todavía no exista una identidad durable o una operación materializada, la aplicación puede reconstruir la presentación y volver a evaluar prerrequisitos, pero no puede afirmar que existe una operación pendiente ni inventar retroactivamente una identidad para simular que el intento anterior quedó almacenado.

#### 5. Frontera con ANIMA-UX-011

`ANIMA-UX-011` conserva la propiedad sobre la experiencia de una intención que ya alcanzó persistencia durable dentro de la cola offline.

Esta tarea recibe un problema distinto y más amplio: qué ocurre cuando la continuidad se pierde antes, durante o después de cruzar una frontera de persistencia o de ejecución cuyo resultado todavía debe determinarse.

La frontera queda así:

| Situación | Propietario UX primario |
| --- | --- |
| Elemento confirmado como persistido durablemente y pendiente de sincronización | ANIMA-UX-011 |
| Reentrada a una intención durable después de cerrar o reabrir la app | ANIMA-UX-012, consumiendo el estado de ANIMA-UX-011 |
| Interrupción antes de demostrar persistencia durable | ANIMA-UX-012 |
| Interrupción mientras se resuelve un prerrequisito | ANIMA-UX-012 |
| Interrupción con posible efecto remoto pero sin resultado autoritativo | ANIMA-UX-012, con conciliación propietaria |
| Reanudación que descubre conflicto de cola | ANIMA-UX-012 para la entrada a recuperación; ANIMA-UX-011 conserva la semántica de cola y conflicto |

La reanudación no crea una segunda semántica de cola.

#### 6. Frontera con ANIMA-UX-008 a ANIMA-UX-010

La reanudación consume las decisiones previas sin redefinirlas:

- `ANIMA-UX-008` mantiene la diferencia entre resultado confirmado y pendiente;
- `ANIMA-UX-009` mantiene la explicación humana de por qué una acción no puede continuar;
- `ANIMA-UX-010` mantiene la separación causal entre ubicación, turno/contexto y autorización;
- `ANIMA-UX-012` determina cómo recuperar el flujo después de una interrupción y desde qué estado seguro debe volver a presentarse.

Una reanudación puede desembocar en una causa definida por esas tareas, pero no modifica su significado.

#### 7. Regla de evidencia antes de reanudar

Al volver al flujo, ANIMA debe reconstruir la situación desde evidencia vigente y no desde la apariencia previa de la interfaz.

La decisión de reanudación considera, cuando aplique:

1. identidad de la intención o evento ya existente;
2. presencia o ausencia de persistencia local durable;
3. estado remoto autoritativo disponible;
4. estado de asistencia actual del trabajador;
5. turno o contexto laboral vigente;
6. sesión y actor actuales;
7. autorización vigente;
8. estado real de permisos del dispositivo;
9. frescura de la evidencia de ubicación requerida;
10. conectividad disponible;
11. estado de sincronización o conciliación;
12. conflicto detectado;
13. vencimiento o invalidez de un checkpoint recuperado.

La última pantalla observada antes de la interrupción es evidencia de presentación, no fuente de verdad empresarial.

#### 8. Checkpoint conceptual de reanudación

Se define un **checkpoint de reanudación** como el conjunto mínimo de referencias necesarias para reconstruir de forma segura dónde quedó una intención interrumpida.

Es un concepto documental. Esta tarea no ordena crear una tabla, tipo, enum, RPC, almacenamiento específico ni formato físico.

Cuando exista y sea aplicable, un checkpoint puede referenciar conceptualmente:

- intención o identidad estable conocida;
- objetivo `check-in` o `check-out`;
- trabajador o actor al que pertenece;
- contexto laboral o turno de referencia;
- versión o frescura del contexto cuando el dominio la exponga;
- último punto seguro alcanzado;
- clase de persistencia demostrada;
- certeza del resultado;
- instante relevante para evaluar frescura o expiración;
- referencia segura de correlación para conciliación o soporte.

No debe tratar como autoridad persistente:

- un permiso previamente concedido si el sistema operativo ya puede haberlo cambiado;
- una autorización calculada antes de la interrupción;
- una ubicación antigua como prueba vigente;
- un token o secreto;
- una selección visual de pantalla;
- un estado objetivo enviado por el cliente;
- una copia local que contradiga una fuente autoritativa más reciente.

#### 9. Puntos seguros de recuperación

La experiencia distingue como mínimo estos puntos conceptuales:

| Punto | Evidencia disponible | Reanudación permitida |
| --- | --- | --- |
| Antes de materializar la intención | Solo interacción o preparación de UI | Reconstruir la pantalla y reevaluar; no afirmar pendiente |
| Intención identificada, prerrequisitos incompletos | Identidad y contexto parcial compatibles | Volver al prerrequisito faltante después de revalidar |
| Persistencia local en curso sin confirmación | Resultado de persistencia todavía desconocido | Verificar almacenamiento antes de declarar cola o crear otra intención |
| Persistencia local durable confirmada | Misma identidad durable | Mostrar y continuar según ANIMA-UX-011 |
| Envío remoto en curso o respuesta perdida | El efecto pudo cruzar la frontera | Conciliar; no repetir ciegamente |
| Resultado autoritativo confirmado | Resultado terminal conocido | Mostrar resultado; no reanudar la acción |
| Conflicto | Estado incompatible demostrado | Abrir recuperación de conflicto; no retry ordinario |
| Intervención requerida | Automatismo seguro agotado | Mantener evidencia y conducir al resolver correspondiente |

#### 10. Interrupción antes de una intención durable

Si el proceso termina antes de que exista evidencia durable de una intención de marcación:

- ANIMA no muestra “pendiente de sincronización”;
- ANIMA no muestra “guardado”;
- ANIMA no reconstruye una cola ficticia;
- ANIMA no conserva una hora de UI como si fuera un evento laboral ya registrado;
- al regresar, reconstruye el contexto actual y permite una nueva acción solo después de descartar razonablemente que exista una intención anterior durable o un efecto remoto incierto.

Si no es posible demostrar que no existió efecto, la situación deja de ser un simple reinicio de UI y pasa a resultado incierto o conciliación.

#### 11. Interrupción durante prerrequisitos

Cuando la interrupción ocurre durante validación de turno, ubicación, permiso del dispositivo, sesión u otro prerrequisito:

1. se conserva únicamente el contexto seguro que pueda recuperarse;
2. al volver, se consulta el estado real del prerrequisito;
3. no se reutiliza una decisión anterior como autoridad si puede haber cambiado;
4. si el prerrequisito ya quedó resuelto, el flujo puede continuar desde el siguiente punto seguro;
5. si continúa faltando, se vuelve a la explicación y recuperación propietarias;
6. si aparece una causa distinta, se presenta la causa vigente y no la causa histórica.

#### 12. Regreso desde permisos del sistema operativo

Salir de ANIMA para conceder o revisar un permiso no cancela automáticamente la intención.

Al regresar:

- se inspecciona el estado real actual del permiso;
- abrir Ajustes no equivale a permiso concedido;
- cerrar el prompt no equivale universalmente a deny permanente;
- un permiso concedido no evita revalidar los demás prerrequisitos;
- un permiso revocado durante la interrupción detiene la continuación dependiente de ese permiso;
- la intención no se duplica solo porque la pantalla de Home vuelva a montarse.

#### 13. Reanudación y ubicación

La ubicación utilizada para decidir una marcación debe cumplir la política vigente en el momento relevante.

Un checkpoint puede recordar que el flujo esperaba evidencia de ubicación, pero no convierte coordenadas antiguas en evidencia vigente.

Si la política propietaria exige ubicación fresca, la reanudación debe solicitar u obtener evidencia nueva antes de continuar.

La sede laboral, el punto físico de marcación y la evidencia de geocerca siguen siendo conceptos distintos; esta tarea no los fusiona para simplificar la recuperación.

#### 14. Reanudación y turno o contexto laboral

Una reanudación no hereda ciegamente el turno que estaba visible antes de la interrupción.

Antes de producir un nuevo efecto se revalida, cuando corresponda:

- que el trabajador sigue siendo el actor aplicable;
- que el turno o contexto referenciado continúa siendo vigente y compatible;
- que no apareció una transición de asistencia que cambie la acción correcta;
- que no existe una versión o publicación posterior que invalide la proyección anterior.

Si el contexto cambió, la recuperación explica el cambio y resuelve desde el estado actual en vez de completar una acción contra el contexto viejo.

#### 15. Reanudación y autorización

La autorización nunca queda congelada por un checkpoint UX.

Al reanudar una intención que todavía puede producir un efecto:

- se resuelve la autoridad vigente en la capa propietaria;
- no se reutiliza un allow anterior como credencial;
- un deny actual detiene la acción aunque antes hubiera estado habilitada;
- un cambio de sesión obliga a asociar correctamente la recuperación con el actor actual;
- un checkpoint perteneciente a otro trabajador no puede continuar bajo la sesión actual.

La interfaz puede conservar referencias necesarias para explicar la recuperación, pero no concede autoridad por haber sobrevivido a la interrupción.

#### 16. Reanudación después de cierre o terminación del proceso

Cuando ANIMA se abre después de un cierre inesperado o de una terminación del proceso:

1. carga primero la evidencia durable disponible;
2. consulta el estado remoto necesario para detectar resultados ya aplicados o incompatibilidades;
3. identifica si existe una intención durable pendiente;
4. identifica si existe resultado incierto que requiera conciliación;
5. reconstruye la experiencia desde esos hechos;
6. solo entonces habilita una nueva intención incompatible.

La memoria de proceso perdida no puede utilizarse como argumento para asumir que el intento anterior nunca existió.

#### 17. Reanudación de cola durable

Si al regresar existe una entrada durable compatible de la cola:

- se conserva su identidad estable;
- se proyecta como pendiente o en el estado definido por ANIMA-UX-011;
- un retry manual o automático opera sobre la misma intención cuando el contrato lo permita;
- no se crea un nuevo evento para “recuperar” el anterior;
- una reapertura de Home no reinicia `queued_at`, número de intentos ni identidad empresarial por razones de presentación;
- la confirmación remota posterior sustituye el estado pendiente sin duplicar la marcación.

#### 18. Resultado remoto incierto

Cuando una interrupción ocurre después de que la operación pudo haber alcanzado el servidor pero antes de obtener una respuesta autoritativa, ANIMA conserva un estado de resultado incierto.

La recuperación debe:

1. buscar evidencia remota o de conciliación usando las referencias disponibles;
2. impedir un segundo envío ciego de la misma acción;
3. impedir una nueva identidad utilizada únicamente para escapar de la incertidumbre;
4. mostrar al trabajador que el resultado está siendo verificado;
5. terminar como confirmado, fallido, conflicto o intervención únicamente cuando exista evidencia suficiente.

“Perdimos la respuesta” no equivale a “la marcación falló”.

#### 19. Prevención de duplicados al reingresar

La reanudación protege contra duplicados producidos por:

- doble toque antes de que cambie la pantalla;
- Home desmontado y vuelto a montar;
- navegación a otra pestaña y regreso;
- deep link a Home;
- reapertura desde una notificación;
- regreso desde Ajustes;
- retorno de background a foreground;
- dos callbacks tardíos de una misma intención;
- retry automático y retry manual concurrentes;
- reapertura después de cierre inesperado;
- recuperación desde otro punto de entrada de ANIMA.

Mientras la misma intención siga sin resolución segura, la UI no ofrece otra acción incompatible como si nada estuviera en curso.

#### 20. Convergencia de superficies

Home, turnos, historial, notificaciones, deep links y cualquier otra entrada legítima a la marcación deben converger hacia el mismo estado vigente de recuperación.

No se permiten copias competidoras como:

- Home diciendo “pendiente” mientras Historial afirma “confirmado” con una copia vieja;
- una notificación habilitando una segunda salida mientras Home concilia la primera;
- un deep link restaurando un turno que ya dejó de ser aplicable;
- una pantalla local ocultando un conflicto conocido por la cola.

Cada superficie puede adaptar la presentación, pero no el hecho empresarial ni la identidad de la intención.

#### 21. Acción principal durante recuperación

La recuperación muestra como máximo una acción primaria ordinaria cuando exista una continuación segura y ejecutable.

Ejemplos conceptuales:

- continuar validación;
- volver a comprobar permiso;
- intentar sincronizar la misma intención cuando el contrato lo permita;
- revisar un conflicto;
- volver a Home después de confirmar el resultado.

No se presenta “Marcar otra vez”, “Crear nuevo registro” o equivalente mientras la intención previa pueda seguir produciendo o ya haber producido el mismo efecto.

#### 22. Reanudación sin pedir nuevamente datos válidos

La recuperación no obliga al trabajador a repetir información que:

- ya existe en una fuente canónica vigente;
- permanece válida para la misma intención;
- no requiere reconfirmación por seguridad o frescura.

Sin embargo, evitar repetición no autoriza a conservar silenciosamente datos obsoletos. Cuando un dato puede haber vencido o cambiado, la reanudación lo revalida y solo vuelve a pedir interacción humana si la decisión no puede resolverse automáticamente.

#### 23. Estado visible de recuperación

La presentación debe permitir entender cuál de estas situaciones ocurre sin exponer términos técnicos innecesarios:

- la acción todavía estaba preparando sus condiciones;
- existe una marcación guardada y pendiente;
- la marcación se está sincronizando;
- el sistema está verificando qué ocurrió;
- existe un conflicto que debe revisarse;
- hace falta una acción del trabajador;
- hace falta intervención de un responsable;
- la marcación quedó confirmada;
- no existe una intención recuperable y puede iniciarse una nueva acción.

La interfaz identifica entrada o salida cuando esa distinción ya sea conocida.

#### 24. Recuperación de conflicto

Si la revalidación encuentra un estado incompatible, la intención no vuelve automáticamente al camino ordinario.

Ejemplos conceptuales:

- una salida pendiente y el servidor ya no muestra una entrada compatible;
- una entrada pendiente y ya existe una entrada activa incompatible;
- la intención corresponde a un contexto que dejó de ser válido;
- otra superficie o dispositivo produjo un resultado que cambia la secuencia esperada.

La recuperación conserva la evidencia necesaria, explica la situación en lenguaje humano y dirige al flujo de conciliación o intervención. Un conflicto no se resuelve creando una segunda marcación.

#### 25. Uso desde más de un dispositivo

Un checkpoint local pertenece al dispositivo que lo conserva, pero no es fuente de verdad exclusiva de la asistencia.

Al reanudar después de una interrupción se considera que otro dispositivo o flujo autorizado pudo haber cambiado el estado remoto.

Por tanto:

- el estado remoto vigente se revalida antes de ejecutar un efecto incompatible;
- un checkpoint local confirmado como obsoleto no se impone sobre el servidor;
- una acción ya confirmada desde otro dispositivo se muestra como resultado existente;
- una divergencia material se trata como conflicto o conciliación, no como last-write-wins de la interfaz local.

#### 26. Sesión vencida o cambiada

Si ANIMA requiere reautenticación durante la recuperación:

1. la intención recuperable puede conservarse como referencia segura mientras corresponda;
2. la reautenticación no ejecuta la marcación por sí sola;
3. después de autenticar se verifica que el actor coincide con el propietario de la intención;
4. se revalida autoridad y contexto;
5. una intención de otro actor no se muestra ni se ejecuta bajo la nueva sesión;
6. si la seguridad exige descartar presentación sensible, se conserva únicamente la evidencia técnica mínima que el contrato propietario permita.

#### 27. Limpieza del estado de recuperación

Un checkpoint o estado de presentación de recuperación se limpia únicamente cuando exista una razón segura, por ejemplo:

- resultado autoritativo terminal ya proyectado;
- evidencia de que nunca se materializó una intención ni puede existir efecto pendiente;
- abandono permitido antes de una frontera durable o de efecto;
- resolución de conflicto con resultado final conocido;
- invalidación segura definida por el propietario.

No se limpia para ocultar:

- una cola pendiente;
- un resultado incierto;
- un conflicto sin resolver;
- una posible operación ya enviada;
- evidencia necesaria para soporte o conciliación.

#### 28. Abandono y nueva intención

El trabajador puede abandonar una preparación puramente local que no haya cruzado una frontera material y cuya ausencia de efecto esté demostrada.

Una vez exista persistencia durable, envío potencialmente efectivo o resultado incierto, “cancelar la pantalla” no equivale a eliminar la intención empresarial.

Una nueva intención incompatible solo se habilita cuando la anterior:

- quedó terminada de forma autoritativa;
- fue invalidada de forma segura antes de producir efecto;
- fue resuelta mediante el mecanismo propietario correspondiente.

#### 29. Referencia de soporte y conciliación

Cuando una recuperación no pueda cerrarse automáticamente, ANIMA conserva una referencia segura que permita correlacionar el caso sin exponer secretos, SQL, políticas internas, tokens, trazas completas ni datos innecesarios.

La referencia ayuda a responder:

- qué intención se estaba recuperando;
- qué resultado era conocido;
- qué estado estaba pendiente;
- qué conflicto o incertidumbre impidió continuar.

No sustituye la evidencia autoritativa ni concede capacidad de modificación.

#### 30. Accesibilidad y comprensión

La recuperación no depende únicamente de color, animación, vibración, icono o posición visual.

Cada estado material dispone de texto o semántica accesible suficiente para que el trabajador identifique:

- si la acción sigue abierta;
- si está guardada o no;
- si está pendiente de resultado;
- si necesita hacer algo;
- si puede intentar continuar de forma segura;
- si ya terminó.

El foco accesible debe dirigir primero al estado y a la acción segura, no a diagnósticos secundarios.

#### 31. Seguridad y minimización

La reanudación conserva únicamente datos necesarios para continuidad, trazabilidad y resolución segura.

Queda prohibido utilizar el estado de recuperación para persistir o exponer innecesariamente:

- tokens de sesión;
- secretos;
- permisos internos detallados;
- reglas RLS;
- SQL o nombres de funciones como mensaje al trabajador;
- coordenadas históricas más allá de lo permitido por la política propietaria;
- datos de otros trabajadores;
- información administrativa que no sea necesaria para la marcación personal.

La persistencia de un checkpoint no amplía la autorización de quien lo recupera.

#### 32. Auditoría AS-IS relevante

La implementación actual observada ya contiene capacidades parciales útiles para esta tarea:

| Hallazgo AS-IS | Lectura contractual |
| --- | --- |
| La cola de asistencia se persiste mediante almacenamiento seguro por trabajador. | Existe una base para recuperar intenciones ya durables. |
| La cola durable se carga nuevamente cuando existe usuario autenticado. | ANIMA puede rehidratar trabajo pendiente después de perder memoria de proceso. |
| Al volver la aplicación a estado activo se intenta sincronizar trabajo pendiente cuando corresponde. | Existe reentrada automática para la cola, pero no sustituye revalidación semántica. |
| El estado de interacción previo a alcanzar la cola se mantiene principalmente en memoria de la ejecución actual. | No existe evidencia de un checkpoint general durable para todo el flujo previo; no puede presumirse recuperación completa. |
| La persistencia actual registra errores de almacenamiento sin convertir por sí misma el helper en una confirmación contractual de persistencia. | La experiencia TO-BE debe exigir evidencia positiva antes de afirmar que una marcación quedó guardada. |
| La cola conserva identidades y estados que permiten distinguir pendiente, sincronización, fallo y conflicto. | La reanudación debe consumir esas identidades, no crear otras al reabrir la app. |

Estos hallazgos describen el código observado y no autorizan cambios físicos durante esta tarea.

#### 33. Matriz canónica de escenarios de interrupción

| Escenario | Estado recuperado | Revalidación mínima | Acción TO-BE |
| --- | --- | --- | --- |
| Usuario cambia de app antes de tocar marcar | Ninguna intención materializada | Contexto visible actual | Volver a la pantalla vigente sin inventar pendiente |
| App pasa a background mientras valida ubicación | Prerrequisito en curso | Permiso, ubicación fresca, contexto | Retomar desde validación segura |
| Usuario abre Ajustes por permiso | Intención y prerrequisito conocidos | Estado real del permiso y demás contexto | Continuar o explicar bloqueo vigente |
| App termina antes de persistir localmente | Persistencia no demostrada | Cola local, remoto si hubo posible envío | No afirmar guardado; decidir si puede iniciar de nuevo |
| App termina después de persistencia durable | Intención en cola | Identidad, estado de cola, contexto vigente | Recuperar la misma intención bajo ANIMA-UX-011 |
| Conexión cae durante sincronización | Intención durable | Estado remoto y cola | Mantener pendiente o retry seguro sobre misma identidad |
| Respuesta remota se pierde después del envío | Resultado incierto | Conciliación remota | Verificar antes de repetir |
| App vuelve y el servidor ya confirma la acción | Resultado terminal | Correspondencia de intención | Mostrar confirmado; no reejecutar |
| App vuelve y existe conflicto de secuencia | Conflicto | Estado remoto y evidencia local | Revisar conflicto; no retry ordinario |
| Sesión expiró mientras había intención pendiente | Referencia recuperable | Actor, sesión, autoridad, contexto | Reautenticar y revalidar antes de continuar |
| Otro dispositivo cambió asistencia | Checkpoint local potencialmente obsoleto | Estado remoto vigente | Adoptar resultado actual o abrir conflicto |
| Deep link abre Home durante una intención abierta | Misma intención vigente | Estado central de recuperación | Converger a la misma experiencia sin duplicar |
| Retry manual coincide con retry automático | Misma intención | Exclusión/idempotencia propietaria | Ejecutar como máximo un intento elegible |
| Turno cambió durante interrupción | Contexto previo obsoleto | Turno/contexto actual | Detener continuación incompatible y explicar cambio |
| Ubicación previa dejó de ser fresca | Prerrequisito vencido | Nueva evidencia de ubicación | Revalidar; no reproducir coordenada antigua |

#### 34. Requisitos de prueba derivados

**Resultado:** NO GENERA REQUISITOS DE PRUEBA.

**Requisitos creados:** 0

**Requisitos modificados:** 0

La tarea desarrolla en detalle obligaciones ya cubiertas por los contratos vigentes de resiliencia, offline, idempotencia, estado pendiente, recuperación y asistencia. No introduce una regla material nueva que requiera ampliar el registro canónico.

#### 35. Cobertura de prueba vigente reutilizada

La trazabilidad existente que soporta esta tarea incluye, sin modificación de sus filas:

- `TREQ-ANIMA-003`: persistencia durable antes de considerar encolada una marcación offline, identidad estable, supervivencia a reinicio, replay idempotente y conflicto ante contenido incompatible;
- `TREQ-ANIMA-015`: separación visible entre asistencia, geocerca, selección contextual, conectividad, cola offline, sincronización y diagnóstico, sin mostrar como aplicada una marcación todavía pendiente o fallida;
- `TREQ-UX-002`: explicación humana de errores y bloqueos, conservación de datos y recuperación sin duplicar efectos;
- `TREQ-UX-005`: visibilidad de fuente de verdad, estado pendiente o confirmado y prevención de copias competidoras;
- `TREQ-UX-006`: comportamiento explícito ante pérdida de red, sesión o dispositivo y distinción entre pendiente, confirmado, fallido, conflicto e intervención;
- `TREQ-UX-018`: conservación de estado, propietario, idempotencia y referencia segura para operaciones pendientes, con revalidación de autoridad, versión, tarea y contexto al reanudar;
- `TREQ-UX-028`: conservación del punto seguro y condición de reanudación de una tarea válida interrumpida;
- `TREQ-UX-031`: diferenciación entre espera y bloqueo, con condición explícita de reactivación;
- `TREQ-UX-036`: revalidación de versión, actor, contexto, claim y permiso al reanudar, con resolución de conflictos sin actualización destructiva por último escritor.

Esta enumeración es únicamente cobertura reutilizada y no representa cambios al registro.

#### 36. Evidencia de validación

| Clase | Estado | Evidencia |
| --- | --- | --- |
| BUILD | PASS | El artefacto documental fue estructurado como una sola tarea con metadata canónica, secciones obligatorias, cinco clases de evidencia y continuidad cerrada. |
| LOCAL | PASS | El código vigente de ANIMA fue auditado en los hooks de asistencia, persistencia de cola y acciones de Home para identificar rehidratación durable, foreground sync y ausencia observada de un checkpoint general previo a cola. |
| REMOTA | PASS | Las fuentes canónicas vigentes de vento-shell y el código actual de vento-anima fueron contrastados desde sus repositorios propietarios antes de desarrollar el contrato. |
| OPERATIVA | NOT_EXECUTED | La comprensión real de trabajadores ante interrupciones, reapertura y recuperación corresponde al piloto posterior con usuarios y no se ejecuta en esta tarea documental. |
| FÍSICA | NOT_APPLICABLE | La topología vigente clasifica ANIMA-UX-001 a ANIMA-UX-017 como DEFINE_ONCE con NO_PHYSICAL_INSTANCE; esta tarea no materializa pantallas, almacenamiento ni servicios. |

#### 37. Criterios de aceptación

1. La reanudación opera sobre la misma intención y no sobre la mera pantalla anterior.
2. La tarea distingue interrupción de fallo definitivo.
3. La tarea distingue memoria de UI de evidencia durable.
4. No se presenta una intención como encolada sin persistencia durable demostrada.
5. No se presenta una intención como confirmada sin resultado autoritativo compatible.
6. Una intención durable conserva su identidad al reabrir ANIMA.
7. Un retry elegible reutiliza la misma intención en vez de crear otra.
8. Un resultado remoto incierto se concilia antes de cualquier repetición ciega.
9. Una pérdida de respuesta no se transforma automáticamente en fallo.
10. Un cierre o reinicio de la app no demuestra ausencia de efecto.
11. La reanudación consulta evidencia durable antes de habilitar una acción incompatible.
12. El flujo revalida el estado actual de asistencia antes de producir un efecto incompatible.
13. El turno o contexto laboral se revalida cuando pueda haber cambiado.
14. La autorización se resuelve nuevamente antes de un efecto que aún no ocurrió.
15. La sesión actual debe corresponder al propietario de la intención recuperada.
16. El estado real del permiso del dispositivo se consulta después de volver de Ajustes o de un prompt.
17. Abrir Ajustes no se interpreta como permiso concedido.
18. La ubicación antigua no se reutiliza como evidencia vigente cuando la política exige frescura.
19. Home, notificaciones, turnos, historial y deep links convergen al mismo estado material.
20. Una segunda superficie no puede fabricar una intención competidora mientras la primera siga abierta.
21. La reanudación protege frente a doble toque y callbacks tardíos.
22. Retry automático y manual no producen dos efectos para la misma intención.
23. Un conflicto no se convierte en retry ordinario.
24. Un cambio remoto desde otro dispositivo obliga a reconciliar el checkpoint local.
25. El checkpoint conceptual no almacena autoridad como dato reutilizable.
26. El checkpoint conceptual no convierte selección visual en contexto autoritativo.
27. Una intención sin evidencia durable no se muestra como pendiente por conveniencia de UX.
28. Una intención durable recuperada consume la semántica de cola definida por ANIMA-UX-011.
29. La UI identifica entrada o salida cuando el objetivo ya se conoce.
30. La recuperación presenta como máximo una acción primaria ordinaria y segura.
31. No se pide nuevamente información todavía válida y disponible sin necesidad.
32. Los datos potencialmente obsoletos se revalidan antes de continuar.
33. El estado de recuperación no se limpia mientras exista cola, incertidumbre o conflicto sin resolver.
34. Abandonar una pantalla no cancela una operación que pudo cruzar una frontera material.
35. Una nueva intención incompatible solo aparece después de resolver de forma segura la anterior.
36. Los mensajes de recuperación son comprensibles y no dependen solo de color, icono, animación o vibración.
37. La recuperación minimiza datos sensibles y no expone secretos ni detalles internos innecesarios.
38. La tarea no crea tablas, RPC, schemas, tipos físicos, políticas de RLS, thresholds de geocerca ni cambios de Supabase.
39. La tarea no redefine la semántica de cola de ANIMA-UX-011.
40. La tarea no absorbe la simplificación de documentos y datos personales reservada a ANIMA-UX-013.
41. La cobertura de prueba existente se reutiliza sin crear ni modificar requisitos.
42. No existe materialización física propia para esta tarea.

#### 38. Hallazgos y dependencias diferidas

| Hallazgo | Bloquea ANIMA-UX-012 | Propietario | Condición de salida |
| --- | --- | --- | --- |
| El código observado recupera cola durable, pero no demuestra un checkpoint general persistente para todos los pasos anteriores a la cola. | No para cerrar el contrato documental; sí para materializar recuperación completa. | Materialización física propietaria de ANIMA dentro de paquetes E5 aplicables | Implementar el mecanismo compatible con este contrato y demostrar persistencia/frescura sin crear autoridad local. |
| La escritura actual de cola registra fallos de almacenamiento sin ofrecer por sí sola una confirmación contractual fuerte al nivel superior. | No para el diseño; sí para afirmar “guardado” de forma segura en la implementación. | Materialización física de asistencia/cola ANIMA | El llamador obtiene una señal inequívoca de persistencia durable antes de proyectar estado encolado. |
| Los pilotos de comprensión ante cierre, permisos, reapertura y resultado incierto no se han ejecutado. | No | ANIMA-UX-015 | Ejecutar prueba controlada con trabajadores reales y registrar evidencia sobre comprensión, errores, reintentos y ayuda requerida. |

Ningún hallazgo requiere crear una tarea documental nueva.

#### 39. Límites

Esta tarea no:

- implementa almacenamiento de checkpoints;
- modifica SecureStore ni selecciona una tecnología alternativa;
- crea tablas, vistas, triggers, funciones, RPC, Edge Functions o migraciones;
- modifica Supabase;
- redefine políticas de geocerca o thresholds;
- define una nueva política de scheduling;
- modifica el modelo de autorización;
- crea reason codes de negocio;
- redefine la cola offline ni su política de retry;
- redefine el contrato de confirmado frente a pendiente;
- decide la experiencia de documentos o datos personales;
- ejecuta pruebas con trabajadores reales;
- autoriza una implementación física.

La tarea especifica únicamente el comportamiento UX y las invariantes que una materialización posterior deberá respetar.

#### 40. Continuidad

**ÚLTIMA TAREA APROBADA**
`ANIMA-UX-011 — Diseñar manejo comprensible de cola offline`

**TAREA ACTUAL APROBADA**
`ANIMA-UX-012 — Permitir reanudar una marcación interrumpida`

**SIGUIENTE TAREA RESERVADA**
`ANIMA-UX-013 — Simplificar documentos y datos personales`


### ✅ ANIMA-UX-013 — Simplificar documentos y datos personales

**Estado:** APROBADA
**Tarea anterior:** ANIMA-UX-012 — Permitir reanudar una marcación interrumpida
**Tarea siguiente:** ANIMA-UX-014 — Simplificar administración de equipo autorizada
**Tipo de tarea:** documental; diseño UX TO-BE de la experiencia personal de documentos laborales, perfil laboral y gestión comprensible de datos propios en ANIMA, separada de administración de terceros, con minimización, fuente de verdad y rutas de corrección o solicitud sin materialización física
**Bloque:** F_ANIMA — EXPERIENCIA DEL TRABAJADOR Y ADMINISTRACION
**Repositorio propietario:** vento-group-sas/vento-shell
**Archivo propietario:** docs/plan-canonico/modular/bloques/F_ANIMA/02_EXPERIENCIA_DEL_TRABAJADOR_Y_ADMINISTRACION.md
**Estado físico resultante:** ESPECIFICADO_NO_MATERIALIZADO
**Cambios físicos autorizados:** ninguno durante esta tarea
**Requisitos de prueba creados o modificados:** 0

---

#### 1. Propósito

Definir una experiencia personal de ANIMA en la que el trabajador pueda entender y consultar sus documentos laborales y sus datos propios sin convivir con filtros, cargas, eliminaciones, alcances de terceros, metadatos técnicos o herramientas administrativas que no pertenecen a su tarea.

El resultado debe permitir responder, con mínima carga cognitiva, cinco preguntas:

1. ¿qué documentos laborales míos están disponibles?;
2. ¿cuál es su estado y vigencia cuando la fuente pueda determinarlo?;
3. ¿qué información laboral mía muestra ANIMA y de dónde proviene?;
4. ¿qué puedo cambiar directamente y qué requiere una solicitud o revisión de la fuente propietaria?;
5. ¿qué acción debo realizar cuando falta, vence, difiere o no puede abrirse una información o documento?

La simplificación no convierte ANIMA en expediente laboral maestro, biblioteca documental administrativa, editor universal de datos del trabajador ni mecanismo de disposición documental.

---

#### 2. Resultado sustantivo

La tarea establece cinco contratos lógicos coordinados:

1. `ANIMA-WORKER-INFORMATION-IA-001`: arquitectura de información personal para documentos, perfil laboral, preferencias y solicitudes;
2. `ANIMA-WORKER-DOCUMENTS-UX-001`: contenido y comportamiento de la experiencia de documentos propios;
3. `ANIMA-WORKER-PROFILE-UX-001`: contenido y comportamiento de la experiencia de datos laborales propios;
4. `ANIMA-WORKER-DATA-ACTION-MATRIX-001`: decisión por categoría entre consultar, autogestionar, solicitar corrección, solicitar privacidad o derivar a la fuente propietaria;
5. `ANIMA-WORKER-INFORMATION-BOUNDARY-001`: frontera entre experiencia personal, administración documental, administración de equipo, privacidad formal y configuración de la aplicación.

Estos contratos son conceptuales y no crean rutas, tablas, tipos, RPC, buckets, permisos, estados de negocio ni componentes físicos.

---

#### 3. Entradas canónicas consumidas

La tarea consume sin redefinir:

- `ANIMA-UX-001`, que clasificó `/documents` como experiencia personal mixta y `account-settings` como experiencia personal;
- `ANIMA-UX-003`, que separó el carril personal del trabajador de supervisión, administración y diagnóstico;
- `ANIMA-UX-004` a `ANIMA-UX-012`, que consolidaron Home, turno, marcación, estados, errores, offline y reanudación alrededor del actor personal;
- `INFO-UX-002`, que gobierna biblioteca documental, búsqueda autorizada, expediente, versión y vigencia;
- `INFO-UX-004`, que define el portal lógico de solicitudes de privacidad para trabajadores y su integración con `VSCREEN-0032 — Mi perfil laboral` y `VSCREEN-0126 — Mis documentos laborales`;
- `INFO-AUTH-001` a `INFO-AUTH-003`, que gobiernan protección, finalidad, sensibilidad y segregación del ciclo documental;
- el registro de requisitos vigente para documentos, privacidad, minimización, corrección y fuente de verdad.

ANIMA proyecta la información que le corresponde al trabajador; no adquiere propiedad sobre el dato o documento por mostrarlo.

---

#### 4. Principio rector

La experiencia objetivo se rige por esta separación:

```text
LO MÍO
→ simple, personal, mínimo y comprensible

LO ADMINISTRATIVO
→ fuera del flujo personal

LO AUTORITATIVO
→ se consulta o corrige en su fuente propietaria

LO FORMAL DE PRIVACIDAD
→ se tramita como solicitud trazable

LO TÉCNICO
→ no se expone como lenguaje de negocio al trabajador
```

Una pantalla personal no aumenta su utilidad por mostrar más campos o más botones. La utilidad se mide por permitir al trabajador entender lo que le afecta y completar la siguiente acción legítima.

---

#### 5. Identidad de las superficies

La tarea no crea una nueva identidad de pantalla ni asigna una ruta física nueva.

Se conservan las identidades canónicas existentes:

- `ANIMA-SCREEN-007` para la pantalla móvil actualmente observada como `/documents`;
- `ANIMA-SCREEN-008` para el carné laboral actual;
- `ANIMA-SCREEN-013` para configuración de cuenta actual;
- `VSCREEN-0032 — Mi perfil laboral` como superficie lógica canónica de perfil laboral;
- `VSCREEN-0126 — Mis documentos laborales` como superficie lógica canónica de documentos laborales propios.

La materialización posterior decidirá componentes, rutas o composición sin crear identidades paralelas por razones meramente visuales.

---

#### 6. Arquitectura `ANIMA-WORKER-INFORMATION-IA-001`

La información personal del trabajador se organiza en cuatro intenciones distintas:

| Intención | Pregunta humana | Contenido permitido | Acción ordinaria |
| --- | --- | --- | --- |
| **Mis documentos laborales** | ¿Qué documentos míos tengo y cuál es su estado? | documentos propios autorizados, vigencia, referencia mínima y acción disponible | ver, abrir o iniciar una solicitud permitida |
| **Mi perfil laboral** | ¿Qué información laboral mía reconoce Vento? | identidad y relación laboral permitidas, con fuente y estado cuando sean materiales | consultar o pedir corrección cuando corresponda |
| **Mis preferencias y permisos de la app** | ¿Qué puedo configurar directamente en este dispositivo o cuenta? | permisos del sistema y preferencias autogestionables | activar, desactivar o limpiar lo permitido |
| **Mis solicitudes de privacidad** | ¿Cómo pido acceso, rectificación, copia u otra actuación formal? | solicitudes propias y su seguimiento | crear o continuar un caso autorizado |

Estas intenciones pueden compartir navegación, pero no deben mezclarse semánticamente como si fueran el mismo objeto o ciclo de vida.

---

#### 7. Regla de actor propio

En el carril personal el sujeto se resuelve desde el trabajador autenticado y su relación vigente.

Por tanto:

1. no existe selector de empleado para consultar documentos personales;
2. no existe cambio de sujeto mediante parámetro visual, búsqueda, filtro o URL;
3. no se muestran listas de trabajadores como mecanismo de navegación personal;
4. no se muestran documentos de terceros aunque el actor tenga además un rol administrativo;
5. adquirir una capacidad administrativa no transforma automáticamente la superficie personal en backoffice;
6. si el actor necesita administrar terceros, debe usar la superficie administrativa propietaria y volver a resolver autorización y alcance.

---

#### 8. Experiencia `ANIMA-WORKER-DOCUMENTS-UX-001`

La experiencia de **Mis documentos laborales** prioriza, por documento visible:

1. nombre humano del documento;
2. estado o vigencia que la fuente pueda sostener;
3. fecha relevante cuando tenga significado claro;
4. indicación mínima de qué requiere atención, si aplica;
5. una acción principal inequívoca: abrir, ver detalle o continuar una solicitud disponible.

Información secundaria solo aparece cuando ayuda a decidir o entender el documento. Identificadores internos, rutas de Storage, UUID, uploader técnico y metadatos de infraestructura permanecen fuera de la presentación ordinaria.

---

#### 9. Orden de la lista personal

La lista debe favorecer decisión y no inventario técnico.

Reglas:

1. elementos que requieren una acción legítima del trabajador pueden priorizarse sobre elementos meramente históricos;
2. una fecha de vencimiento solo determina urgencia cuando la fuente la considera aplicable;
3. un documento sin fecha de vencimiento no se presenta como vigente por inferencia;
4. no se utiliza la cantidad total de documentos como sustituto de estado documental;
5. filtros avanzados, alcance de sede, empleado, empresa o grupo no forman parte de la experiencia personal ordinaria;
6. si existe búsqueda personal, opera únicamente dentro del universo ya autorizado del trabajador.

---

#### 10. Estado y vigencia documental

La interfaz no crea estados de negocio nuevos.

Cuando la fuente permita resolverlos, la presentación puede traducir a lenguaje humano condiciones como:

- disponible y vigente;
- próximo a una fecha relevante;
- vencido;
- reemplazado o no vigente;
- pendiente de una actuación o validación;
- no disponible temporalmente;
- estado no verificable.

Reglas:

1. `sin dato` no equivale a `vigente`;
2. `no verificable` no equivale a `vencido`;
3. una alerta local no sustituye el estado autoritativo;
4. una versión reemplazada no debe competir visualmente con la versión vigente como si ambas fueran actuales;
5. la interfaz debe poder explicar qué condición observó sin exponer reglas internas innecesarias.

---

#### 11. Apertura segura de documentos

Abrir un documento es una capacidad distinta de conocer que existe.

La experiencia debe asumir que:

1. la autorización se revalida al obtener acceso al archivo;
2. una referencia temporal o URL firmada no se presenta como identificador permanente;
3. el fallo al generar o abrir el acceso no cambia el estado empresarial del documento;
4. el error diferencia, cuando la evidencia lo permite, entre falta de autorización, archivo no disponible, conectividad y fallo técnico;
5. reintentar apertura no crea ni modifica documentos;
6. el trabajador nunca necesita conocer el bucket o `storage_path` para recuperar el archivo.

---

#### 12. Solicitudes desde documentos

La experiencia personal puede ofrecer una acción de **solicitar documento** cuando exista un tipo o comando autorizado por la fuente propietaria.

Esta tarea no fija un catálogo de constancias, certificados o tipos solicitables.

Reglas:

1. una solicitud se diferencia de un documento ya disponible;
2. pulsar solicitar no debe mostrar un documento como generado antes de existir confirmación autoritativa;
3. el estado de la solicitud no se deduce del listado de archivos;
4. si la solicitud requiere datos adicionales, solo se solicitan los indispensables;
5. una solicitud formal de privacidad no se disfraza como solicitud documental ordinaria;
6. el seguimiento usa la identidad y estado del proceso propietario, no una copia local creada por ANIMA.

---

#### 13. Vacío de documentos

El vacío de **Mis documentos laborales** debe distinguir al menos estas causas conceptuales cuando puedan resolverse:

- no existen documentos propios visibles para el alcance actual;
- la consulta todavía está cargando;
- la fuente no puede verificarse;
- la sesión o autorización necesita resolverse;
- existe un problema de conectividad;
- existe un error técnico.

No se comunica “No tienes documentos” si la aplicación no pudo demostrar esa ausencia.

El vacío no ofrece cargar documentos de terceros ni amplía el alcance para “resolver” la pantalla.

---

#### 14. Administración documental fuera del carril personal

Quedan fuera de **Mis documentos laborales**:

- escoger otro trabajador;
- consultar documentos de una población o sede;
- cargar archivos para terceros;
- asignar alcance de empleado, sede o grupo;
- eliminar documentos administrativos;
- gestionar tipos documentales;
- decidir retención, reemplazo, disposición o eliminación;
- inspeccionar metadatos internos de Storage;
- utilizar fallbacks locales de rol como sustituto de autorización.

Retirar estos controles del carril personal no elimina capacidades empresariales. Su administración permanece bajo los contratos propietarios de gobierno documental, autorización y paquetes de materialización correspondientes.

---

#### 15. Eliminación no es una acción personal ordinaria

La experiencia del trabajador no presenta la eliminación directa de un documento laboral como una acción ordinaria.

Un documento laboral puede estar sujeto a versión, sustitución, retención, legal hold, historia laboral, auditoría o disposición controlada. Por tanto:

1. ocultar o retirar acceso no equivale a borrar evidencia;
2. eliminar una fila no autoriza eliminar un archivo;
3. cerrar una cuenta no elimina automáticamente documentos laborales conservables;
4. una solicitud de supresión se procesa como solicitud evaluable, no como borrado inmediato;
5. cualquier disposición física posterior pertenece al ciclo documental propietario.

---

#### 16. Experiencia `ANIMA-WORKER-PROFILE-UX-001`

**Mi perfil laboral** muestra únicamente información propia que el trabajador necesita comprender para su relación y uso de ANIMA.

La presentación se organiza por significado humano, no por estructura de base de datos.

Categorías conceptuales permitidas cuando existan y estén autorizadas:

1. identidad visible del trabajador;
2. vínculo y estado laboral visible;
3. rol o función mostrable;
4. sede o relación territorial mostrable;
5. datos de contacto o perfil que el contrato propietario autorice mostrar;
6. estado documental resumido cuando sea útil y autoritativo;
7. referencia de fuente o condición de actualización cuando sea necesaria para explicar por qué un dato no se edita directamente.

La tarea no declara que todos estos datos existan ni que todos sean editables.

---

#### 17. Taxonomía de datos y acciones

Se adopta `ANIMA-WORKER-DATA-ACTION-MATRIX-001`:

| Categoría | Ejemplos conceptuales | Acción personal por defecto | Regla |
| --- | --- | --- | --- |
| **Dato autogestionable** | preferencia o valor de perfil cuya fuente admita edición directa | editar | solo si el contrato propietario autoriza la mutación |
| **Dato laboral autoritativo** | identidad laboral, relación, rol, sede o estado provenientes de una fuente empresarial | consultar | no se vuelve editable por estar visible |
| **Dato corregible mediante fuente** | dato actual que la fuente admite actualizar o rectificar mediante proceso | solicitar corrección o abrir el flujo propietario | conserva trazabilidad de antes, después y motivo cuando corresponda |
| **Dato histórico** | hecho preservado por historia, auditoría o evidencia | consultar cuando esté permitido | no se presenta como campo ordinario editable |
| **Preferencia de aplicación** | favoritos, preferencias opcionales o permisos del dispositivo | autogestionar | no se confunde con expediente laboral |
| **Dato sensible o interno no necesario** | secreto, identificador técnico, metadato interno o dato de terceros | no mostrar | minimización por finalidad y autorización |
| **Solicitud formal de privacidad** | acceso, copia, rectificación, revocación, supresión u otra petición gobernada | iniciar o seguir caso | se mantiene separada de edición ordinaria |

---

#### 18. Consultar no implica editar

Toda ficha debe distinguir visual y semánticamente entre:

- valor visible;
- valor editable;
- valor no editable con explicación suficiente;
- dato que requiere solicitud de corrección;
- dato que pertenece a un caso formal de privacidad.

Reglas:

1. no se renderiza un campo como input deshabilitado solo para comunicar lectura;
2. no se ofrece un botón `Editar` genérico si algunos datos pertenecen a fuentes distintas;
3. una capacidad local de UI no crea autoridad para guardar;
4. ANIMA no escribe una copia local para “corregir” un maestro ajeno;
5. la corrección del dato actual no reescribe silenciosamente hechos históricos.

---

#### 19. Actualización y rectificación

Cuando la necesidad del trabajador exceda la autogestión ordinaria, la experiencia distingue:

- **Actualizar un dato actual**, cuando la fuente propietaria admite cambiar el valor vigente;
- **Corregir un dato que considero incorrecto**, cuando se requiere revisión o rectificación trazable;
- **Solicitar acceso, copia u otra actuación de privacidad**, cuando la intención es formal y excede una edición ordinaria.

La acción debe llevar al proceso propietario o al caso de privacidad correspondiente conservando el contexto necesario, sin convertir ANIMA en un editor universal de fuentes ajenas.

---

#### 20. Portal personal de privacidad

La tarea adopta el `WORKER_PRIVACY_PORTAL` ya definido por gobierno de información como experiencia lógica integrada con el canal personal de ANIMA.

Reglas:

1. no crea una pantalla nueva por sí sola;
2. **Mi perfil laboral** puede ofrecer entrada al caso cuando la necesidad exceda una edición ordinaria;
3. **Mis documentos laborales** puede aportar referencias documentales propias cuando sean necesarias;
4. una solicitud propia conserva su identidad de caso al navegar entre superficies;
5. no aparecen expedientes, solicitudes ni documentos de otros trabajadores;
6. la aplicación no promete supresión automática de historia laboral o evidencia por terminar vínculo o cerrar cuenta.

---

#### 21. Preferencias y datos opcionales de la aplicación

Permisos del dispositivo, favoritos, preferencias opcionales, marketing u otros ajustes autogestionables pertenecen a configuración de la aplicación y no a **Mi perfil laboral**.

La experiencia debe nombrarlos por su efecto real.

Por tanto:

- limpiar favoritos y preferencias opcionales se presenta como limpieza de preferencias o datos opcionales;
- no se presenta esa acción como gestión integral de datos personales;
- cambiar permiso de ubicación o notificaciones no modifica información laboral;
- limpiar preferencias no equivale a ejercer un derecho formal de supresión;
- cerrar cuenta, solicitar supresión y limpiar datos opcionales conservan intenciones diferentes.

---

#### 22. Relación con el carné laboral

El carné laboral es una proyección de identificación y elegibilidad, no el editor de **Mi perfil laboral**.

Puede mostrar información mínima necesaria para su finalidad, como identidad visible, función, sede o estado documental cuando la fuente lo autorice.

Reglas:

1. el carné no se utiliza como formulario de mantenimiento de maestros;
2. un dato incorrecto puede dirigir a la corrección propietaria sin convertirse en edición inline;
3. el estado resumido del carné no reemplaza el detalle de documentos;
4. los datos presentados se minimizan según la finalidad de identificación interna;
5. una ausencia de elegibilidad no se interpreta automáticamente como documento faltante sin evidencia de la fuente.

---

#### 23. Fuente de verdad visible

Cuando un dato pueda generar confusión por no ser editable o por provenir de otra fuente, ANIMA debe permitir comprender su propiedad sin exponer arquitectura técnica.

Formas humanas válidas incluyen conceptos como:

- “Información laboral registrada por Vento”;
- “Este dato requiere revisión”;
- “Solicita una corrección”;
- “La información todavía no pudo verificarse”.

No se muestran nombres de tablas, RPC, políticas RLS, UUID, nombres de bucket o claves técnicas como explicación al trabajador.

---

#### 24. Frescura y discrepancias

La interfaz no presupone que todo valor visible es actual.

Cuando la fuente exponga frescura, versión o condición de revisión:

1. se diferencia actual, desactualizado pero mostrable, requiere confirmación, reemplazado, inválido o desconocido sin inventar un estado empresarial paralelo;
2. un dato desactualizado no se reemplaza silenciosamente por vacío;
3. una discrepancia no se resuelve escogiendo el valor del dispositivo por defecto;
4. la corrección se dirige a la fuente propietaria;
5. los históricos conservan el snapshot o referencia que su contrato exija.

---

#### 25. Minimización de datos personales

La superficie personal aplica minimización incluso cuando el sujeto sea el propio trabajador.

No se muestran por defecto:

- identificadores internos sin utilidad humana;
- secretos o credenciales;
- tokens;
- metadatos técnicos de autorización;
- rutas de archivo;
- IDs de uploader;
- datos de terceros;
- observaciones administrativas no destinadas al trabajador;
- razones internas de investigación o antifraude;
- atributos sensibles sin finalidad visible y autorización suficiente.

Cuando un identificador personal sensible deba mostrarse, se aplica el nivel de revelado o enmascaramiento definido por su contrato propietario.

---

#### 26. Copia, compartición y salida del dispositivo

Ver, copiar, compartir, imprimir o guardar fuera de ANIMA no se consideran una sola capacidad.

La experiencia no asume que poder abrir un documento autoriza cualquier forma de exportación o redistribución.

La implementación futura deberá aplicar la política propietaria para cada salida disponible. Esta tarea no concede nuevas capacidades de copia, impresión, descarga, compartición ni almacenamiento externo.

---

#### 27. Estados de carga, error y recuperación

Documentos y perfil laboral deben usar estados que indiquen qué se sabe y qué no se pudo confirmar.

Reglas:

1. un spinner prolongado no sustituye una explicación de fallo;
2. un error de red no se muestra como ausencia de datos;
3. un deny real no se muestra como fallo técnico;
4. una fuente caída no se presenta como dato vacío;
5. la recuperación no duplica solicitudes ni mutaciones;
6. el valor confirmado previamente puede conservarse como referencia visible si su contrato permite mostrarlo, acompañado de la condición de frescura adecuada;
7. los mensajes indican siguiente acción comprensible.

---

#### 28. Accesibilidad y carga cognitiva

La simplificación debe conservar:

- títulos y agrupaciones semánticas;
- jerarquía de lectura consistente;
- objetivos táctiles adecuados;
- estados expresados por texto además de color o icono;
- etiquetas accesibles para acciones sobre documentos;
- foco predecible al abrir o cerrar detalle;
- mensajes que no dependan de terminología administrativa o técnica;
- una acción primaria dominante por intención.

El usuario no debe aprender conceptos de scopes, buckets, grants, RLS o estructura de datos para usar la experiencia.

---

#### 29. AS-IS — mezcla observada en documentos

El código actual de `app/(app)/documents.tsx` mezcla en una misma pantalla personal:

- `anima.documents.view_all`;
- `anima.documents.upload`;
- `anima.documents.delete`;
- fallbacks locales por rol;
- filtrado por empleado;
- carga documental;
- selección de alcance;
- eliminación;
- consulta y apertura de documentos propios.

También genera accesos firmados a Storage y contiene lógica de eliminación directa del registro seguida de intento de eliminación del archivo.

Este AS-IS justifica la simplificación, pero no se valida como modelo TO-BE ni autoriza su continuidad física.

---

#### 30. AS-IS — ambigüedad de “datos personales”

La pantalla actual de configuración contiene una sección visual denominada **Gestión de datos personales** y, dentro de ella, una acción que limpia favoritos y preferencias opcionales.

La acción real observada se limita a datos opcionales y preferencias; no constituye por sí misma edición de identidad laboral, corrección de maestros ni gestión integral de privacidad.

El TO-BE elimina esa ambigüedad semántica separando:

- preferencias y datos opcionales de aplicación;
- perfil laboral;
- solicitudes formales de privacidad.

---

#### 31. AS-IS — carné como proyección, no perfil editable

El carné actual proyecta nombre, función, sede principal, estado de actividad y estado documental resumido.

No existe evidencia en esa superficie de un editor general del perfil laboral.

El TO-BE conserva esa diferencia: **identificación** y **mantenimiento de datos** son intenciones distintas.

---

#### 32. Migración conceptual desde el AS-IS

La materialización posterior debe poder avanzar sin cambiar de significado mediante esta secuencia conceptual:

```text
DOCUMENTS MIXTO
→ separar sujeto propio de alcance administrativo
→ conservar consulta personal
→ retirar filtros y mutaciones de terceros del carril personal
→ aplicar estados y vigencia desde fuente
→ conectar solicitudes autorizadas

SETTINGS “DATOS PERSONALES”
→ renombrar por efecto real las preferencias/datos opcionales
→ separar perfil laboral
→ enlazar privacidad formal cuando corresponda
```

La migración no requiere crear un maestro duplicado ni conservar compatibilidad visual con controles administrativos obsoletos.

---

#### 33. Matriz de escenarios de documentos

| Escenario | Presentación personal | Acción permitida | Prohibición |
| --- | --- | --- | --- |
| documento propio disponible | mostrar información mínima y estado | abrir o ver detalle | revelar metadatos técnicos |
| documento próximo a fecha aplicable | indicar condición y fecha | acción propietaria disponible | inventar urgencia no sustentada |
| documento vencido | marcar condición visible | seguir salida autorizada | tratarlo como vigente |
| versión reemplazada | reducir peso o dirigir a vigente | consultar histórico si está autorizado | presentarla como actual |
| archivo no abre por conectividad | conservar identidad del documento y explicar fallo | reintentar apertura | marcar documento inexistente |
| acceso denegado | explicar acceso no disponible sin filtrar detalles | volver o escalar según contrato | revelar contenido o URL |
| estado no verificable | mostrar incertidumbre explícita | reintentar o seguir fuente | asumir vigente, vencido o inexistente |
| ningún documento propio demostrado | vacío personal comprensible | iniciar solicitud permitida si existe | ofrecer cargar para terceros |
| solicitud de documento disponible | diferenciar solicitud de archivo existente | iniciar proceso autorizado | mostrar éxito antes de confirmación |
| documento de otro trabajador | no pertenece al universo personal | ninguna | enumerar existencia o identidad |

---

#### 34. Matriz de escenarios de datos propios

| Escenario | Resultado UX | Acción |
| --- | --- | --- |
| dato laboral correcto y autoritativo | lectura clara | ninguna o consultar fuente |
| dato autogestionable | control de edición explícito | guardar mediante comando propietario |
| dato actual incorrecto | explicar que requiere corrección | iniciar corrección o revisión |
| dato histórico | lectura contextual cuando aplique | no editar como campo actual |
| dato sin frescura verificable | mostrar incertidumbre | refrescar o revisar |
| preferencia opcional | mantener en configuración | autogestionar o limpiar |
| solicitud de privacidad | mostrar caso separado | iniciar o seguir caso |
| dato sensible no necesario | no mostrar | ninguna |
| identificador técnico | no mostrar | ninguna |
| discrepancia entre fuentes | no escoger silenciosamente | derivar a fuente o revisión |

---

#### 35. Frontera con administración de equipo

`ANIMA-UX-014` recibe la simplificación de la administración de equipo autorizada, especialmente la superficie `Team` ya separada del carril personal.

UX-013 no diseña:

- invitación de trabajadores;
- activación o desactivación de integrantes;
- cambio administrativo de rol;
- asignación administrativa de sedes o áreas;
- directorios de equipo;
- acciones masivas sobre trabajadores;
- filtros o navegación administrativa por población.

La existencia de un dato laboral propio en **Mi perfil laboral** no habilita su edición administrativa ni absorbe las decisiones reservadas a UX-014.

---

#### 36. Frontera con gobierno documental y privacidad

UX-013 consume, pero no reemplaza:

- biblioteca, expediente, versión y vigencia documental;
- creación, revisión, aprobación, publicación y firma;
- retención, legal hold y disposición;
- decisiones de privacidad y tratamiento de solicitudes;
- autorización por clasificación, finalidad, sensibilidad y relación;
- contratos de Storage, escaneo, firma, certificación o preservación.

ANIMA actúa como canal personal y proyección autorizada para el trabajador.

---

#### 37. Requisitos de prueba derivados

**NO GENERA REQUISITOS DE PRUEBA**

**Requisitos creados:** **0**
**Requisitos modificados:** **0**
**Requisitos diferidos:** **0**
**Requisitos descartados:** **0**

La tarea desarrolla un contrato UX específico de ANIMA sobre reglas de documentos, privacidad, minimización, fuente de verdad y corrección ya protegidas por el registro vigente. No introduce una obligación de prueba nueva ni cambia el alcance de una obligación existente.

---

#### 38. Cobertura de prueba vigente reutilizada

Esta sección documenta trazabilidad de cobertura existente y no modifica el registro.

- `TREQ-ANIMA-005`: documentos y datos laborales por identidad, vínculo, finalidad, sensibilidad, vigencia, propietario y retención; consulta propia y solicitudes sin acceso a expedientes de terceros.
- `TREQ-UX-003`: información, acciones y densidad adecuadas al actor; minimización de datos sensibles y separación de administración.
- `TREQ-UX-005`: fuente de verdad visible, estado confirmado o pendiente y corrección sin copias competidoras.
- `TREQ-UX-008`: separación de superficies cuando compiten intenciones materiales.
- `TREQ-UX-126`: reutilización documental por identidad, versión, archivo, clasificación, propósito, vigencia y derecho de acceso.
- `TREQ-UX-128`: corrección diferenciada entre maestro, caso, versión, excepción o revisión de la fuente propietaria.
- `TREQ-UX-129`: tratamiento explícito de frescura, obsolescencia, reemplazo, invalidez o estado desconocido.
- `TREQ-UX-130`: finalidad, clasificación, minimización y autorización antes de reutilizar información personal o sensible.
- `TREQ-UX-330`: minimización de información en tareas con identidad laboral, privacidad y datos sensibles.

---

#### 39. Evidencia de validación

| Clase | Estado | Evidencia |
| --- | --- | --- |
| BUILD | NOT_APPLICABLE | Tarea exclusivamente documental `DEFINE_ONCE`; no existe build físico propio. |
| LOCAL | NOT_EXECUTED | La inserción en el archivo propietario y la batería documental local corresponden al lifecycle de la rama de tarea. |
| REMOTA | PASS | Se verificaron continuidad y owner canónicos, contratos INFO de gobierno documental y privacidad, registro modular ANIMA/UX y código vigente de documentos, configuración y carné en los repositorios remotos propietarios. |
| OPERATIVA | NOT_EXECUTED | No se realizó prueba con trabajadores ni observación de operación real durante esta tarea documental. |
| FÍSICA | NOT_APPLICABLE | La topología `DEFINE_ONCE` declara `NO_PHYSICAL_INSTANCE`; no se autorizan cambios físicos. |

---

#### 40. Criterios de aceptación

- [x] La experiencia de documentos parte del trabajador autenticado y no de un selector de empleado.
- [x] Documentos propios y administración documental quedan como intenciones separadas.
- [x] La superficie personal no contiene lectura ampliada, carga, eliminación ni filtros de terceros como acciones ordinarias.
- [x] La retirada de controles administrativos no se interpreta como eliminación de la capacidad empresarial propietaria.
- [x] La experiencia prioriza nombre, estado, vigencia y siguiente acción comprensible del documento.
- [x] La vigencia no se inventa cuando la fuente no puede resolverla.
- [x] Ausencia, no verificable, vencido y fallo técnico permanecen distintos.
- [x] Abrir un archivo no concede capacidades implícitas de copiar, imprimir, compartir o disponer.
- [x] La UI no expone `storage_path`, UUID, bucket, uploader técnico ni metadatos internos como contenido ordinario.
- [x] La eliminación directa de evidencia no forma parte del flujo personal.
- [x] Cerrar cuenta no se presenta como eliminación automática de historia laboral o documentos sujetos a conservación.
- [x] Una solicitud documental se distingue de un documento ya disponible.
- [x] Una solicitud no aparece completada antes de confirmación autoritativa.
- [x] La tarea no inventa catálogo de constancias, certificados o documentos solicitables.
- [x] El vacío no afirma inexistencia si la consulta, autorización o fuente no pudo verificarse.
- [x] **Mi perfil laboral** se organiza por significado humano y no por tablas o campos internos.
- [x] Ver un dato no implica poder editarlo.
- [x] Los datos autogestionables solo se editan cuando el propietario lo permite.
- [x] Los datos laborales autoritativos no se convierten en inputs por conveniencia de UI.
- [x] Actualización y rectificación conservan intenciones distintas.
- [x] Los hechos históricos no se presentan como campos corrientes editables.
- [x] Las discrepancias se resuelven contra la fuente propietaria y no mediante copias locales.
- [x] El `WORKER_PRIVACY_PORTAL` se consume como experiencia lógica existente y no crea una nueva pantalla.
- [x] Perfil laboral, documentos laborales y solicitudes de privacidad pueden preservar el mismo caso cuando corresponda.
- [x] Preferencias y datos opcionales de aplicación no se presentan como gestión integral de datos laborales.
- [x] Limpiar favoritos o preferencias no equivale a ejercer supresión formal.
- [x] Cambiar permisos de ubicación o notificaciones no modifica datos laborales.
- [x] El carné permanece como proyección de identificación y elegibilidad, no como editor de maestros.
- [x] La fuente de verdad se comunica en lenguaje humano cuando es necesario para entender una limitación.
- [x] No se exponen nombres de tablas, RPC, RLS, buckets o tokens al trabajador.
- [x] La superficie aplica minimización aun cuando el sujeto sea el propio trabajador.
- [x] No se muestran datos de terceros ni conteos que permitan inferirlos.
- [x] Los estados de error distinguen ausencia de información de imposibilidad de verificarla.
- [x] La recuperación no duplica solicitudes ni mutaciones.
- [x] Los estados y acciones son accesibles sin depender exclusivamente de color o iconografía.
- [x] El AS-IS mixto de `/documents` queda documentado como brecha, no como contrato futuro.
- [x] La ambigüedad actual entre “datos personales” y limpieza de preferencias queda resuelta conceptualmente.
- [x] No se crea una ruta física, componente, tabla, bucket, RPC, RLS, permiso ni estado empresarial nuevo.
- [x] No se modifica Supabase.
- [x] La tarea reutiliza la cobertura existente sin crear ni modificar requisitos de prueba.
- [x] `ANIMA-UX-014` conserva ownership exclusivo sobre la simplificación de administración de equipo autorizada.
- [x] No existe materialización física propia para UX-013.

---

#### 41. Límites

Esta tarea no:

- implementa cambios en `vento-anima`;
- crea o modifica migraciones, tablas, vistas, funciones, RPC, triggers, RLS, Storage, Edge Functions o datos;
- crea un nuevo maestro de empleados o documentos;
- redefine autorización documental;
- define políticas legales de retención, privacidad o disposición;
- fija un catálogo de documentos solicitables;
- define plantillas o contenido de constancias laborales;
- implementa firma, OCR, escaneo, certificación o archivo externo;
- implementa administración de equipo;
- autoriza acceso a datos de terceros;
- convierte preferencias de aplicación en datos laborales;
- decide rutas físicas definitivas;
- ejecuta pruebas con trabajadores reales;
- habilita una instancia física.

---

#### 42. Hallazgos y dependencias diferidas

| Hallazgo | Bloquea UX-013 | Propietario | Condición de salida |
| --- | --- | --- | --- |
| `/documents` actual mezcla consulta personal con lectura ampliada, carga, filtros y eliminación. | No; la separación TO-BE queda especificada. | Materialización E5 de ANIMA y contratos propietarios de gobierno documental/autorización. | La superficie personal deja de exponer capacidades de terceros y la administración queda en su carril autorizado. |
| La eliminación AS-IS borra primero el registro y luego intenta retirar el archivo de Storage. | No para la especificación; sí es una brecha física que no debe preservarse como regla. | Gobierno documental, autorización y paquete físico propietario. | La disposición sigue el ciclo documental autorizado y conserva evidencia/retención aplicables. |
| Configuración usa “Gestión de datos personales” para una limpieza de favoritos y preferencias opcionales. | No; la taxonomía TO-BE queda resuelta. | Materialización de ANIMA. | La copy y navegación distinguen preferencias/datos opcionales, perfil laboral y privacidad formal. |
| El carné proyecta datos laborales, pero no existe en el AS-IS observado un editor general de perfil laboral. | No; UX-013 define la frontera sin inventar edición. | Materialización de ANIMA y fuentes propietarias de identidad laboral. | Los datos permitidos aparecen en `Mi perfil laboral` con acción correcta por categoría y fuente. |
| La administración de equipo permanece pendiente. | No. | ANIMA-UX-014. | UX-014 define la experiencia administrativa autorizada sin contaminar el carril personal. |

---

#### 43. Handoff a ANIMA-UX-014

`ANIMA-UX-014` recibe una experiencia personal ya depurada de administración de terceros.

Su entrada canónica queda limitada a la administración de equipo autorizada:

- superficies de Team y gestión de integrantes;
- acciones administrativas sobre terceros;
- alcance, autorización y segregación correspondientes;
- navegación entre carril personal y carril administrativo sin mezclarlos.

UX-014 no debe reintroducir en **Mis documentos laborales**, **Mi perfil laboral** o configuración personal filtros, controles o metadatos administrativos solo para reutilizar componentes existentes.

---

#### 44. Continuidad

**ÚLTIMA TAREA APROBADA**
`ANIMA-UX-012 — Permitir reanudar una marcación interrumpida`

**TAREA ACTUAL APROBADA**
`ANIMA-UX-013 — Simplificar documentos y datos personales`

**SIGUIENTE TAREA RESERVADA**
`ANIMA-UX-014 — Simplificar administración de equipo autorizada`


### ✅ ANIMA-UX-014 — Simplificar administración de equipo autorizada

**Estado:** APROBADA
**Tarea anterior:** ANIMA-UX-013 — Simplificar documentos y datos personales
**Tarea siguiente:** ANIMA-UX-015 — Probar check-in y check-out con trabajadores reales
**Tipo de tarea:** documental; diseño UX TO-BE de la administración de equipo autorizada y simplificada en ANIMA, limitada a consulta de directorio e invitación cuando exista autoridad efectiva, con handoff explícito de cambios laborales sensibles hacia sus propietarios canónicos y sin materialización física
**Bloque:** F_ANIMA — EXPERIENCIA DEL TRABAJADOR Y ADMINISTRACION
**Repositorio propietario:** vento-group-sas/vento-shell
**Archivo propietario:** docs/plan-canonico/modular/bloques/F_ANIMA/02_EXPERIENCIA_DEL_TRABAJADOR_Y_ADMINISTRACION.md
**Estado físico resultante:** ESPECIFICADO_NO_MATERIALIZADO
**Cambios físicos autorizados:** ninguno durante esta tarea
**Requisitos de prueba creados o modificados:** 0

---

#### 1. Propósito

Definir una experiencia administrativa de equipo en ANIMA que permita a una persona autorizada resolver las necesidades móviles frecuentes sin convertir la aplicación en un backoffice general de personal, identidad, roles, permisos o estructura organizacional.

El resultado debe responder de forma simple a tres preguntas:

1. ¿qué personas forman parte del equipo que puedo consultar dentro de mi alcance efectivo?;
2. ¿qué información mínima necesito para identificarlas y entender su relación operativa?;
3. ¿qué acción puedo realizar aquí y qué cambio debe continuar en la superficie propietaria correspondiente?

La simplificación no se logra escondiendo controles detrás de condiciones locales. Se logra reduciendo el propósito ordinario de Team a capacidades con ownership y autoridad demostrables.

---

#### 2. Handoff vinculante desde ANIMA-UX-013

ANIMA-UX-013 separó el carril personal del trabajador de la administración de terceros y reservó para esta tarea la decisión sobre:

- directorio de trabajadores;
- invitación de trabajadores;
- activación o desactivación;
- cambios de rol administrativo;
- asignaciones de sede o área;
- acciones masivas sobre equipo.

La presente tarea consume ese handoff completo. Ninguna de esas responsabilidades vuelve a mezclarse con `Mis documentos laborales`, `Mi perfil laboral`, preferencias personales o solicitudes de privacidad.

---

#### 3. Resultado canónico

La experiencia queda organizada bajo el contrato lógico `ANIMA-AUTHORIZED-TEAM-UX-001`.

```text
TEAM EN ANIMA
= DIRECTORIO AUTORIZADO
+ RESUMEN MINIMO DE PERSONA
+ INVITACION AUTORIZADA CUANDO APLIQUE
+ HANDOFF EXPLICITO PARA ADMINISTRACION LABORAL SENSIBLE

TEAM EN ANIMA
≠ MAESTRO GENERAL DE TRABAJADORES
≠ EDITOR UNIVERSAL DE EMPLEADOS
≠ ADMINISTRADOR DE ROLES Y PERMISOS
≠ ADMINISTRADOR TERRITORIAL GLOBAL
≠ BORRADO DE HISTORIA LABORAL
```

La superficie continúa siendo administrativa y separada de la experiencia personal base.

---

#### 4. Posición funcional de Team dentro de ANIMA

`ANIMA-SCREEN-011` conserva su identidad de pantalla administrativa.

Su propósito TO-BE es **consultar y coordinar el equipo autorizado desde móvil**.

No se convierte en pantalla personal, no se incorpora a Home ordinario del trabajador y no hereda autoridad por el hecho de que la persona autenticada tenga un rol verbalmente gerencial.

La visibilidad de Team es una proyección de relevancia. La autoridad para cada lectura o acción se resuelve de forma independiente.

---

#### 5. Principio de menor superficie administrativa

La experiencia ordinaria de Team tendrá únicamente capacidades que cumplan simultáneamente:

1. finalidad administrativa clara y frecuente desde móvil;
2. ownership compatible con ANIMA;
3. permiso canónico vigente;
4. alcance efectivo resoluble;
5. proyección mínima de datos;
6. operación segura sin convertir la UI en fuente de autoridad.

Una función que no cumpla estas seis condiciones no se mantiene como edición local solo porque exista actualmente en el código.

---

#### 6. Intenciones materiales de la superficie

Se reconocen cuatro intenciones UX, con decisiones diferentes:

| Intención | Decisión TO-BE | Condición |
| --- | --- | --- |
| Consultar equipo autorizado | PERMITIDA | permiso efectivo de lectura y alcance resoluble |
| Consultar resumen de una persona autorizada | PERMITIDA | la misma relación de lectura permite conocer esa persona y esos campos |
| Invitar trabajador | PERMITIDA_CONDICIONAL | autoridad efectiva para crear invitación y parámetros elegibles validados por servidor |
| Administrar vínculo, rol, permiso, territorio o eliminación | HANDOFF | pertenece a una capacidad administrativa sensible que no se infiere de lectura o invitación |

No se crea un quinto modo genérico de “editar empleado”.

---

#### 7. Composición TO-BE de la pantalla

La pantalla se simplifica conceptualmente en cinco zonas:

1. encabezado `Equipo` con explicación breve del alcance visible;
2. búsqueda y filtros mínimos;
3. directorio autorizado;
4. acción `Invitar trabajador` cuando sea realmente accionable;
5. acceso contextual al propietario de una administración más sensible cuando exista una intención legítima y autorizada.

No se muestran simultáneamente formularios de roles, sedes, áreas, permisos, activación, eliminación y carga administrativa como controles ordinarios de cada tarjeta.

---

#### 8. Entrada y visibilidad de Team

La pestaña o acceso a Team se presenta solo cuando la capacidad resulte relevante para el actor efectivo.

Reglas:

1. ocultar la pestaña no constituye autorización;
2. acceso directo o deep link vuelve a resolver autoridad;
3. una capacidad revocada no permanece utilizable por caché, navegación previa o rol local;
4. si el actor puede leer equipo pero no invitar, ve el directorio sin CTA de invitación;
5. si puede invitar pero el contrato requiere además una población o alcance que no puede resolverse, la acción queda bloqueada de forma explicada y no se degrada a un selector global;
6. un rol textual no sustituye la decisión efectiva de acceso.

---

#### 9. Permisos canónicos y aliases legacy

La experiencia consume los permisos canónicos ya existentes:

- `anima.workforce.team_members.view` para lectura autorizada del equipo;
- `anima.workforce.staff_invitations.create` para creación autorizada de invitaciones.

El catálogo canónico normaliza los permisos legacy `anima.team.view` y `anima.team.invite` hacia esas dos capacidades. Las capabilities locales observadas en el cliente, `team.view` y `team.invite`, son etiquetas de presentación/adaptación y tampoco constituyen autoridad normativa del TO-BE.

La migración debe converger hacia los permisos canónicos sin inventar un permiso de mutación de miembros para justificar funciones legacy.

---

#### 10. Alcance efectivo del directorio

La consulta de equipo se evalúa después de resolver identidad, permiso y territorio aplicable.

El resultado visible puede representar, según el contrato de autorización vigente:

- equipo dentro de sedes autorizadas;
- equipo dentro de áreas autorizadas;
- población explícitamente permitida por la relación administrativa;
- una intersección más restrictiva cuando concurran varias dimensiones.

Un filtro de sede, área, estado o texto solo reduce el conjunto ya autorizado. Nunca amplía la población.

---

#### 11. Directorio autorizado

El directorio es la vista primaria de Team.

Cada fila o tarjeta debe priorizar únicamente información suficiente para identificar a la persona y entender su relación laboral pertinente:

- nombre visible;
- alias cuando sea útil para operación;
- estado laboral resumido cuando el actor tenga derecho a conocerlo;
- rol o función humana relevante;
- sede o área pertinente dentro del alcance visible;
- estado de invitación cuando la fila represente una invitación y no una persona activa.

Identificadores internos, UUID, códigos de permiso, datos financieros, documentos, historial de asistencia y otros datos no necesarios permanecen fuera de esta superficie.

---

#### 12. Búsqueda y filtros

La búsqueda ordinaria prioriza nombre y alias.

El correo electrónico o código interno solo participa cuando exista una necesidad administrativa demostrable y el actor esté autorizado a conocerlo.

Filtros permitidos conceptualmente:

- estado laboral visible;
- sede autorizada;
- área autorizada;
- estado de invitación cuando aplique.

Reglas:

1. las opciones de filtro se construyen después de autorización;
2. un filtro no revela sedes, áreas o estados fuera de alcance;
3. un resultado vacío filtrado no significa que no existan trabajadores globalmente;
4. limpiar filtros retorna al conjunto autorizado inicial;
5. la búsqueda no enumera identidades no autorizadas mediante coincidencias parciales.

---

#### 13. Resumen de miembro

Abrir una persona desde el directorio muestra un resumen de consulta, no un formulario maestro.

El resumen puede incluir:

- identidad laboral visible;
- función o rol humano relevante;
- sede y área asignadas que el actor esté autorizado a conocer;
- estado laboral resumido;
- información de contacto laboral solo cuando sea necesaria para la finalidad de coordinación.

La superficie debe distinguir claramente dato consultable de dato editable.

---

#### 14. Invitación de trabajador

`Invitar trabajador` es una intención independiente del directorio y requiere `anima.workforce.staff_invitations.create` efectivo.

La invitación debe:

1. solicitar únicamente datos necesarios para crear la invitación;
2. mostrar qué organización o alcance será afectado cuando esa información sea resoluble;
3. obtener del servidor únicamente opciones de asignación elegibles;
4. volver a validar autoridad al confirmar;
5. producir una identidad o receipt de invitación que permita reconocer el resultado;
6. evitar una segunda invitación equivalente cuando exista una solicitud ya válida y el contrato permita reutilizarla o reconciliarla.

La invitación no equivale a alta laboral completa ni a concesión de permisos.

---

#### 15. Parámetros de una invitación

Si el flujo de invitación necesita rol, sede, área u otra clasificación laboral, la presencia del campo no concede autoridad para elegir cualquier valor.

Cada opción debe provenir de una lista elegible resuelta por el propietario y validarse nuevamente al confirmar.

Si no existe una autoridad canónica para modificar una dimensión requerida, Team no inventa una opción mediante listas hardcodeadas ni fallbacks de rol; deriva la intención a la superficie propietaria correspondiente.

---

#### 16. Estados de invitación

La experiencia distingue al menos:

- preparación de invitación;
- envío en curso;
- invitación creada y pendiente de aceptación;
- invitación aceptada cuando la fuente pueda confirmarlo;
- invitación vencida cuando exista vigencia autoritativa;
- invitación revocada cuando exista ese estado canónico;
- resultado desconocido si se perdió la respuesta;
- fallo antes de crear la invitación.

Enviar un correo o mensaje no se presenta como trabajador creado ni como invitación aceptada.

---

#### 17. Persona existente versus invitación

Una invitación y un trabajador existente no se presentan como el mismo objeto.

Reglas:

1. una invitación pendiente no aumenta el conteo de trabajadores activos;
2. aceptar la invitación no autoriza a la UI a inferir activación si la fuente laboral aún no lo confirma;
3. una coincidencia de correo no se usa por sí sola para fusionar identidades;
4. la transición entre invitación y vínculo laboral conserva referencia y trazabilidad cuando el dominio la provea;
5. la tarjeta visual debe indicar si representa persona o invitación.

---

#### 18. Edición general de trabajadores

El editor genérico observado en el AS-IS no forma parte del flujo ordinario TO-BE de Team.

ANIMA no mantendrá una acción única `Editar` capaz de modificar en bloque identidad, rol, sedes, áreas, estado y otras dimensiones con autoridad derivada de `team.view` o de un rol local.

Cada cambio material se trata por su propia intención y ownership.

---

#### 19. Nombre, alias, correo y perfil laboral

Los cambios de identidad o perfil laboral no se realizan como escritura directa desde la tarjeta de Team salvo que exista un contrato propietario explícito que los autorice.

Hasta entonces:

- Team muestra el valor autoritativo permitido;
- una necesidad de corrección abre el handoff hacia el propietario laboral correspondiente;
- la pantalla no mantiene una copia mutable paralela;
- una corrección no reescribe historia ni auditoría desde el cliente.

---

#### 20. Activación y desactivación

`Activo/Inactivo` no se modela como un interruptor visual ordinario.

Activar o desactivar puede afectar acceso, vínculo, operación y trazabilidad, por lo que requiere una intención administrativa propia y autorización independiente.

En ausencia de un permiso canónico específico de Team para esa transición:

- ANIMA puede mostrar el estado cuando corresponda;
- no ofrece el cambio directo;
- deriva la administración del vínculo al propietario canónico;
- nunca usa eliminación permanente como sustituto de desactivación.

---

#### 21. Cambios de rol

El rol visible en Team es contexto informativo dentro del alcance autorizado.

Cambiar rol base, rol operativo, rol administrativo, delegación o simulación no pertenece al directorio móvil ordinario.

Reglas:

1. `anima.workforce.team_members.view` no concede edición de rol;
2. `anima.workforce.staff_invitations.create` no concede edición de rol de una persona existente;
3. una invitación solo puede usar opciones de rol elegibles confirmadas por servidor;
4. cambios posteriores usan la superficie propietaria de workforce/autorización;
5. Team no expone matrices completas de permisos como parte del perfil.

---

#### 22. Asignaciones de sede y área

Sede y área visibles en Team sirven para comprender el contexto administrativo autorizado.

Modificar asignaciones territoriales es una intención diferente de filtrar el directorio.

Un selector de sede o área dentro de Team:

- no convierte el valor seleccionado en sede o área operativa activa;
- no amplía el alcance del actor;
- no concede derecho a reasignar;
- no se utiliza como escritura directa si no existe autoridad propietaria explícita.

Las reasignaciones laborales continúan mediante handoff al propietario correspondiente.

---

#### 23. Permisos, delegaciones y simulación

Team no administra matrices de permisos, excepciones individuales, delegaciones, simulación ni dispositivos compartidos.

Puede mostrar una función humana resumida cuando sea necesaria para identificar al miembro, pero no traduce esa etiqueta en autoridad ni ofrece `Dar permiso` como acción local.

La administración de autorización permanece en el dominio y superficie canónicos correspondientes.

---

#### 24. Eliminación y conservación de historia

La eliminación permanente de una persona no es una acción ordinaria de Team.

El patrón AS-IS que elimina registros de empleado y relaciones asociadas no se incorpora al TO-BE como operación de conveniencia.

Reglas:

1. desactivación, terminación de vínculo, disposición de datos y borrado técnico son conceptos distintos;
2. retirar acceso no borra automáticamente historia laboral ni evidencia sujeta a conservación;
3. cualquier disposición definitiva requiere el lifecycle propietario aplicable;
4. Team no promete que una eliminación es irreversible o completa si el dominio no lo determina;
5. no se elimina Storage, auditoría o relaciones históricas desde una tarjeta de equipo.

---

#### 25. Acciones masivas

Team no ofrece acciones masivas de cambio de rol, sede, área, estado, permisos o eliminación como experiencia móvil ordinaria.

Si una necesidad administrativa futura exige operación masiva:

- pertenece a una superficie administrativa especializada;
- debe mostrar población seleccionada, alcance, efecto esperado y resultado por elemento;
- requiere autoridad explícita y segregación compatible;
- no se introduce como multiselección oculta dentro del directorio de ANIMA.

---

#### 26. Ownership de capacidades

La distribución funcional queda así:

| Capacidad | Superficie TO-BE | Ownership funcional |
| --- | --- | --- |
| Consultar equipo autorizado | ANIMA Team | ANIMA como proyección móvil autorizada |
| Consultar resumen autorizado | ANIMA Team | ANIMA como proyección móvil autorizada |
| Crear invitación | ANIMA Team | ANIMA para la intención de invitación, condicionada al contrato servidor |
| Administrar identidad laboral | Handoff | propietario administrativo de workforce |
| Cambiar rol o autorización | Handoff | propietario de workforce/autorización |
| Cambiar sede o área asignada | Handoff | propietario administrativo del contexto laboral |
| Activar o desactivar vínculo | Handoff | lifecycle laboral propietario |
| Eliminar o disponer historia | Fuera de Team | lifecycle de información y retención aplicable |
| Operación masiva | Fuera de Team ordinario | workspace administrativo especializado |

Esta matriz define fronteras UX; no crea endpoints, pantallas físicas ni permisos nuevos.

---

#### 27. Handoff hacia una superficie propietaria

Cuando una persona autorizada necesita una acción fuera de Team, el handoff debe conservar conceptualmente:

```text
actor efectivo
+ persona objetivo autorizada
+ intención humana
+ contexto territorial relevante
+ referencia segura al recurso
+ origen ANIMA Team
→ superficie propietaria
→ nueva resolución de autorización
```

Reglas:

1. el handoff no transporta permiso ni decisión de autoridad;
2. el destino vuelve a autorizar;
3. no se transportan secretos o datos sensibles innecesarios en navegación;
4. si el destino no puede abrirse, ANIMA explica la limitación sin ofrecer una mutación local alternativa;
5. regresar a Team reconstruye el resumen desde la fuente vigente.

---

#### 28. Minimización de datos

El directorio y sus búsquedas aplican minimización antes de entregar información al cliente.

No basta ocultar campos en la tarjeta si ya fueron consultados innecesariamente.

Quedan fuera por defecto:

- documentos personales;
- información financiera;
- datos médicos o de SST;
- historiales completos de asistencia;
- matrices de permisos;
- tokens o referencias de autenticación;
- metadatos técnicos internos;
- información de otros territorios no autorizados.

La necesidad administrativa concreta puede habilitar una proyección distinta solo mediante contrato y autorización apropiados.

---

#### 29. Conteos y métricas de Team

Los conteos visibles se calculan sobre el mismo alcance autorizado que el directorio o uno más restrictivo.

Un resumen puede mostrar, cuando la fuente esté completa y fresca:

- personas visibles;
- activas visibles;
- inactivas visibles;
- invitaciones pendientes visibles.

No se muestra `0` como cifra global cuando la consulta es parcial, falló o carece de autoridad suficiente para determinar el universo.

Los conteos no revelan poblaciones ocultas.

---

#### 30. Estados vacíos y fallos

La experiencia distingue:

| Estado | Mensaje semántico | Acción permitida |
| --- | --- | --- |
| Sin personas visibles | el alcance autorizado no devuelve personas | revisar filtros o continuar sin acción |
| Filtro sin coincidencias | no hay coincidencias dentro del conjunto visible | limpiar filtros |
| Sin acceso | la función no está disponible para el actor | volver a una superficie permitida |
| Alcance no resoluble | no puede confirmarse qué población corresponde | reintentar o escalar según causa |
| Fuente no disponible | no puede verificarse el directorio | reintentar de forma segura |
| Proyección obsoleta | la información requiere actualización | refrescar antes de actuar |
| Invitación no accionable | falta una condición de autoridad o contrato | corregir condición o usar handoff |

Ningún fallo técnico se presenta como `No hay empleados`.

---

#### 31. Frescura y refresco

Team debe poder indicar que la información visible corresponde a una proyección confirmada o que requiere actualización cuando la frescura sea material.

Reglas:

1. refrescar no amplía alcance;
2. cambios de rol, permiso, sede, área o estado invalidan la proyección incompatible;
3. una tarjeta abierta con datos antiguos no conserva autoridad para mutar;
4. después de una invitación confirmada se actualiza la lista sin asumir aceptación;
5. después de un handoff se vuelve a consultar la fuente antes de afirmar el nuevo estado.

---

#### 32. Acceso directo y navegación

Conocer la ruta de Team no concede acceso.

La entrada directa debe resolver nuevamente:

- sesión válida;
- actor efectivo;
- permiso aplicable;
- alcance;
- relevancia de la superficie.

La respuesta sin acceso no enumera personas, conteos, roles, sedes o acciones que el actor no deba conocer.

---

#### 33. Cambios concurrentes

Si la información de una persona cambia mientras Team está abierto:

1. el cliente no sobrescribe el valor autoritativo desde una copia vieja;
2. la invitación o handoff se valida contra estado vigente;
3. una persona retirada del alcance desaparece en la siguiente proyección autorizada;
4. una acción que ya no sea válida se bloquea de forma comprensible;
5. la interfaz evita presentar un resultado parcial como actualización completa.

---

#### 34. Accesibilidad y móvil

La simplificación debe mejorar la operación móvil sin reducir controles de seguridad.

La experiencia:

- prioriza targets táctiles adecuados;
- usa nombre y estado legibles sin depender de color;
- permite búsqueda con teclado y tecnologías de asistencia;
- expone nombre accesible de acciones e iconos;
- evita menús de acciones densos por tarjeta;
- mantiene el CTA de invitación separado de la apertura de una persona;
- conserva foco y retorno comprensibles después de modales o handoffs.

---

#### 35. Auditoría y soporte

Team no necesita mostrar al operador detalles técnicos de auditoría, pero las acciones materiales deben poder correlacionarse con la evidencia propietaria.

Para invitaciones y handoffs se conserva, cuando el contrato lo produzca:

- actor;
- persona o invitación objetivo;
- instante;
- intención;
- alcance relevante;
- resultado confirmado, fallido o desconocido;
- referencia no secreta utilizable por soporte.

Un error no expone SQL, payloads, tokens, claves internas ni matrices de permisos.

---

#### 36. Hallazgos AS-IS que motivan la simplificación

El código vigente de `vento-anima` presenta una superficie Team más amplia que el contrato objetivo:

1. `app/(app)/team.tsx` condiciona acceso con capabilities locales `team.view` y `team.invite` y conserva fallbacks por roles gerenciales cuando la matriz todavía no está cargada;
2. la pantalla combina directorio, búsqueda, métricas, invitación, edición y un flujo excepcional de eliminación;
3. `use-team-data.ts` consulta empleados y relaciones de sede y área para construir una vista amplia;
4. `use-team-editing.ts` escribe directamente sobre nombre, alias, rol, sede principal, actividad, `employee_sites` y selección de sede del trabajador;
5. `app/(app)/team.tsx` contiene además un flujo de eliminación permanente condicionado por identidad de propietario que invoca la Edge Function `employee-delete`;
6. `use-team-invitations.ts` materializa la intención de invitación mediante el contrato servidor existente;
7. la navegación oculta Team según capability, pero esa condición visual no sustituye protección de servidor;
8. la matriz local de capabilities se deriva de roles y no constituye la fuente canónica de autoridad.

Estos hallazgos son AS-IS y no autorizan cambios físicos durante esta tarea.

---

#### 37. Migración conceptual desde el AS-IS

La transición debe realizarse por intención, no mediante un recorte visual indiscriminado:

| Elemento AS-IS | Tratamiento TO-BE |
| --- | --- |
| permiso legacy `anima.team.view` | converger hacia `anima.workforce.team_members.view` |
| permiso legacy `anima.team.invite` | converger hacia `anima.workforce.staff_invitations.create` |
| capability local `team.view` | dejar de tratarla como autoridad y derivar visibilidad desde el permiso canónico efectivo |
| capability local `team.invite` | dejar de tratarla como autoridad y derivar accionabilidad desde el permiso canónico efectivo |
| Directorio | conservar con alcance y minimización canónicos |
| Búsqueda | conservar sobre población ya autorizada |
| Métricas | conservar solo si usan el mismo alcance autorizado y fuente confiable |
| Invitación | conservar como intención independiente y reautorizada |
| Editor genérico de miembro | retirar del flujo ordinario y dividir por intención/ownership |
| Toggle de actividad | sustituir por handoff al lifecycle propietario |
| Edición de rol | sustituir por handoff al propietario de workforce/autorización |
| Edición de sede/área | sustituir por handoff al propietario del contexto laboral |
| Eliminación permanente | retirar de Team ordinario |
| Acciones masivas | mantener fuera de Team móvil ordinario |

No se retira una capacidad física hasta que la implementación propietaria correspondiente tenga reemplazo, pruebas y rollout aprobados.

---

#### 38. Matriz de escenarios UX

| Escenario | Resultado esperado |
| --- | --- |
| Trabajador sin permiso de equipo | Team no forma parte de su experiencia ordinaria |
| Actor con lectura de equipo | puede consultar únicamente población autorizada |
| Actor con lectura pero sin invitación | ve directorio sin CTA de invitar |
| Actor con invitación accionable | puede iniciar el flujo de invitación |
| Actor conoce deep link pero perdió permiso | entrada bloqueada sin enumerar equipo |
| Gerente con rol verbal pero permiso revocado | no conserva Team por fallback de rol |
| Actor autorizado solo para una sede | directorio y conteos se limitan a esa sede |
| Actor filtra otra sede | el filtro no amplía alcance ni revela población |
| Búsqueda sin coincidencias | se informa vacío filtrado, no inexistencia global |
| Fuente de equipo falla | se informa fallo de verificación, no `0 trabajadores` |
| Directorio parcial | no se presenta un total global como confirmado |
| Persona sale del alcance durante la sesión | desaparece tras revalidación y no queda editable |
| Actor abre un miembro | obtiene resumen mínimo, no editor universal |
| Actor necesita corregir nombre | Team deriva al propietario, no modifica copia local |
| Actor necesita cambiar rol | Team deriva al propietario de workforce/autorización |
| Actor necesita reasignar sede | Team deriva al propietario administrativo correspondiente |
| Actor necesita desactivar vínculo | Team no usa toggle genérico; abre handoff propietario |
| Actor intenta eliminar permanentemente | la acción no existe en Team ordinario |
| Actor intenta modificar permisos | la acción no existe en Team ordinario |
| Invitación requiere opción no autorizada | esa opción no se ofrece ni se fabrica localmente |
| Invitación enviada | se muestra resultado de invitación, no trabajador activo |
| Respuesta de invitación se pierde | resultado queda desconocido hasta reconciliación |
| Invitación ya existente | se evita crear duplicado equivalente cuando el contrato lo permita |
| Persona ya existe | no se crea una nueva identidad por conveniencia de UI |
| Conteo incluye población oculta | escenario inválido; debe recalcularse después de autorización |
| Se cambia actor o sesión | se recalculan capacidad, población y datos visibles |
| Retorno desde un handoff | Team refresca antes de mostrar el nuevo estado |
| Dispositivo con pantalla pequeña | conserva funciones autorizadas sin menú denso ni pérdida de contexto |

---

#### 39. Requisitos de prueba derivados

NO GENERA REQUISITOS DE PRUEBA

**Requisitos creados:** 0
**Requisitos modificados:** 0

La tarea especializa experiencia y ownership sobre reglas de autorización, minimización, separación de carriles, handoff y navegación ya cubiertas por el registro vigente. No introduce una obligación verificable nueva que requiera modificar el registro canónico.

---

#### 40. Cobertura de prueba vigente reutilizada

Esta sección registra trazabilidad y no modifica el registro de requisitos.

Cobertura existente especialmente aplicable:

- `TREQ-UX-003`: información, acciones y densidad adecuadas a tarea y autorización, con minimización de datos sensibles;
- `TREQ-UX-005`: fuente de verdad visible y prohibición de copias mutables competidoras;
- `TREQ-UX-008`: separación o handoff cuando una superficie mezcla intenciones materiales;
- `TREQ-UX-010`: contexto y alcance explícitos en superficies administrativas;
- `TREQ-UX-014`: la presentación visual no concede autoridad y ocultar controles no sustituye protección de servidor;
- `TREQ-UX-016`: experiencia personal, supervisión, configuración y administración permanecen separadas;
- `TREQ-UX-017`: proyección mínima y protección de datos por finalidad;
- `TREQ-UX-050`: acceso directo y navegación revalidan permiso;
- `TREQ-UX-059`: autorización, visibilidad y posibilidad de actuar son estados distintos;
- `TREQ-UX-060`: relevancia se resuelve desde hechos autoritativos, no desde el frontend;
- `TREQ-UX-061`: acceso no autorizado no enumera destinos o datos sensibles;
- `TREQ-UX-064`: las superficies administrativas conservan territorio, población, autoridad, sensibilidad y segregación;
- `TREQ-UX-068`: minimización aplica también a consulta, filtros, previews y payloads;
- `TREQ-UX-069`: conteos y agregados no revelan población oculta;
- `TREQ-UX-070`: búsqueda, recientes y accesos recalculan relevancia y autorización;
- `TREQ-UX-075`: configuración, gobierno, auditoría y excepciones permanecen separadas del flujo ordinario;
- `TREQ-UX-078`: asignación territorial, filtro y contexto operativo no se confunden.

---

#### 41. Evidencia de validación

| Clase | Estado | Evidencia |
| --- | --- | --- |
| BUILD | NOT_EXECUTED | La compilación del plan se reserva al checkout actualizado después de materializar documentalmente esta tarea. |
| LOCAL | NOT_EXECUTED | No se ejecutaron validadores del checkout local del usuario desde este entorno. |
| REMOTA | PASS | Se contrastaron fuentes canónicas vigentes de `vento-shell`, código actual de `vento-anima`, catálogo de permisos, ownership de workforce y fragmentos 04A aplicables; la continuidad remota ubica ANIMA-UX-014 como tarea actual. |
| OPERATIVA | NOT_EXECUTED | La validación con administradores o responsables reales corresponde al ciclo posterior de implementación y pruebas. |
| FÍSICA | NOT_APPLICABLE | La topología de ANIMA-UX-001 a ANIMA-UX-017 es DEFINE_ONCE y esta tarea no posee instancia física propia. |

---

#### 42. Criterios de aceptación

1. Team se mantiene como superficie administrativa y no personal.
2. La experiencia ordinaria se reduce a directorio autorizado, resumen mínimo e invitación cuando sea accionable.
3. `anima.workforce.team_members.view` gobierna conceptualmente la lectura autorizada.
4. `anima.workforce.staff_invitations.create` gobierna conceptualmente la creación de invitación.
5. `anima.team.view` y `anima.team.invite` se reconocen como permisos legacy normalizados; `team.view` y `team.invite` permanecen solo como capabilities locales AS-IS, no como autoridad normativa.
6. Un rol textual no concede acceso por fallback.
7. La pestaña puede ocultarse por irrelevancia sin tratar ese ocultamiento como seguridad.
8. El acceso directo vuelve a autorizar.
9. Los filtros solo reducen el conjunto autorizado.
10. La búsqueda no enumera identidades fuera de alcance.
11. El directorio minimiza campos antes de llegar al cliente.
12. El resumen de miembro no se convierte en editor maestro.
13. La invitación se mantiene separada de la lectura del directorio.
14. La invitación no equivale a alta laboral completa.
15. Enviar una invitación no equivale a aceptación.
16. Una invitación no concede por sí sola autoridad para asignar cualquier rol, sede o área.
17. Las opciones sensibles de invitación deben provenir de elegibilidad autoritativa.
18. No se inventa un permiso nuevo de mutación de miembros.
19. El editor genérico AS-IS queda fuera del flujo ordinario TO-BE.
20. Nombre, alias, correo y perfil laboral no se editan localmente sin ownership explícito.
21. Activación y desactivación no se modelan como toggle ordinario.
22. Cambiar rol requiere un flujo propietario independiente.
23. Cambiar sede o área requiere un flujo propietario independiente.
24. Team no administra matrices de permisos.
25. Team no administra delegación o simulación.
26. La eliminación permanente no está disponible como acción ordinaria.
27. Desactivación y eliminación permanecen semánticamente distintas.
28. La salida de una cuenta o vínculo no borra automáticamente historia preservable.
29. Las acciones masivas sensibles permanecen fuera del Team móvil ordinario.
30. Cada handoff vuelve a resolver autorización en destino.
31. Un handoff no transporta autoridad.
32. Los conteos usan el mismo alcance autorizado que el detalle o uno más restrictivo.
33. Una consulta parcial no se representa como total global confirmado.
34. Un fallo de fuente no se presenta como ausencia de trabajadores.
35. Un vacío filtrado no se presenta como inexistencia global.
36. Cambios de actor, permiso o territorio invalidan proyecciones incompatibles.
37. La interfaz no conserva una mutación habilitada sobre datos obsoletos.
38. La experiencia móvil evita menús densos y mantiene accesibilidad táctil y semántica.
39. Datos sensibles y detalles técnicos permanecen fuera del directorio ordinario.
40. El AS-IS queda documentado sin autorizar cambios físicos.
41. La tarea crea cero requisitos de prueba y reutiliza cobertura vigente.
42. ANIMA-UX-015 permanece reservada y no se desarrolla dentro de esta tarea.

---

#### 43. Hallazgos y dependencias diferidas

| Hallazgo diferido | ¿Bloquea esta tarea? | Propietario | Condición de salida |
| --- | --- | --- | --- |
| Sustitución física de `team.view` y `team.invite` por consumo de permisos canónicos | No | paquete físico de ANIMA/autorización que materialice la UX aprobada | cliente y servidor consumen permisos canónicos y pruebas demuestran ausencia de fallback permisivo |
| Retiro físico del editor genérico de miembro | No | paquete físico de ANIMA y propietarios administrativos de workforce | existe handoff materializado para las intenciones que deban conservarse y el editor legacy puede retirarse sin pérdida funcional |
| Retiro de eliminación permanente desde Team | No | paquete físico de ANIMA + lifecycle de información/workforce | UI deja de exponer borrado directo y el lifecycle propietario cubre desactivación, conservación y disposición |
| Definición física de destinos de handoff | No | tareas y paquetes propietarios de VISO y de los contratos transversales de autorización | cada destino posee identidad navegable, contrato de entrada y reautorización implementados |
| Validación móvil con actores reales | No | ANIMA-UX-015 y paquetes de prueba posteriores | piloto ejecutado con actores, sedes y permisos representativos y evidencia vinculada a requisitos vigentes |

Ningún hallazgo anterior autoriza crear una tarea nueva ni cambia la continuidad documental actual.

---

#### 44. Límites

1. Esta tarea no modifica código de `vento-anima`.
2. Esta tarea no modifica Supabase, datos, migraciones, RLS, RPC, Storage, Realtime, Auth, Edge Functions ni configuración.
3. No crea permisos, roles, tablas, vistas, endpoints, rutas físicas, componentes ni esquemas.
4. No autoriza la instancia física `AUTH-DB-035::GLOBAL` ni altera su estado.
5. No redefine el modelo canónico de autorización.
6. No redefine el ownership general de workforce, identidad, roles, permisos, sedes o áreas.
7. No convierte ANIMA en backoffice integral de RR. HH.
8. No diseña administración masiva detallada; únicamente fija que no pertenece al Team móvil ordinario.
9. No define políticas legales de retención o eliminación; consume las existentes.
10. No diseña ni ejecuta la validación con trabajadores reales reservada a ANIMA-UX-015.
11. No crea ni modifica requisitos de prueba.
12. No materializa cambios físicos propios por corresponder a una tarea DEFINE_ONCE.

---

#### 45. Continuidad

**ÚLTIMA TAREA APROBADA**
`ANIMA-UX-013 — Simplificar documentos y datos personales`

**TAREA ACTUAL APROBADA**
`ANIMA-UX-014 — Simplificar administración de equipo autorizada`

**SIGUIENTE TAREA RESERVADA**
`ANIMA-UX-015 — Probar check-in y check-out con trabajadores reales`


### ✅ ANIMA-UX-015 — Probar check-in y check-out con trabajadores reales

**Estado:** APROBADA
**Tarea anterior:** ANIMA-UX-014 — Simplificar administración de equipo autorizada
**Tarea siguiente:** ANIMA-UX-016 — Auditar y completar recordatorios operativos de inicio y cierre de turno
**Tipo de tarea:** documental; especificación de validación UX controlada del check-in y check-out de ANIMA con trabajadores reales o participantes laborales expresamente autorizados, en dispositivos representativos y sin producir efectos laborales o productivos no autorizados
**Bloque:** F_ANIMA — EXPERIENCIA DEL TRABAJADOR Y ADMINISTRACION
**Repositorio propietario:** vento-group-sas/vento-shell
**Archivo propietario:** docs/plan-canonico/modular/bloques/F_ANIMA/02_EXPERIENCIA_DEL_TRABAJADOR_Y_ADMINISTRACION.md
**Estado físico resultante:** ESPECIFICADO_NO_MATERIALIZADO
**Cambios físicos autorizados:** NINGUNO
**Requisitos de prueba creados o modificados:** 0

---

#### 1. Propósito

Definir la validación controlada que deberá realizarse con trabajadores reales para comprobar que el flujo personal de asistencia de ANIMA permite comprender, ejecutar y recuperar un check-in y un check-out sin ambigüedad, duplicación, confirmaciones falsas ni dependencia de conocimiento técnico.

La validación deberá observar el comportamiento del trabajador frente al producto y no limitarse a preguntar si la interfaz “se entiende”. El resultado esperado es evidencia reproducible sobre si una persona puede:

- identificar si corresponde iniciar o terminar asistencia;
- ejecutar la acción correcta sin ayuda indebida;
- comprender cuándo la marcación quedó confirmada, pendiente, bloqueada o incierta;
- diferenciar problemas de ubicación, turno, autorización y conectividad;
- recuperarse de una interrupción sin crear una segunda intención de negocio;
- reconocer el estado final de su asistencia después de completar o reanudar el flujo.

Esta tarea define el protocolo, la muestra mínima, los escenarios, la evidencia y los gates de decisión. La ejecución con participantes se registra únicamente cuando exista evidencia operativa real.

---

#### 2. Resultado contractual

ANIMA deberá disponer de un protocolo de validación reproducible para check-in y check-out que convierta las decisiones UX ya aprobadas en escenarios observables con trabajadores reales.

El protocolo deberá demostrar por separado:

1. comprensión de la acción disponible;
2. comprensión del contexto laboral visible;
3. ejecución de check-in;
4. ejecución de check-out;
5. interpretación del estado de resultado;
6. manejo de prerequisitos y bloqueos;
7. comportamiento ante conectividad degradada;
8. reanudación después de interrupciones;
9. ausencia de duplicación ante repetición o incertidumbre;
10. consistencia entre el estado mostrado y la evidencia autoritativa disponible.

La aprobación documental de esta tarea no equivale a afirmar que los trabajadores ya fueron probados ni que la experiencia está certificada en campo.

---

#### 3. Base canónica consumida

La validación consume las decisiones documentales ya aprobadas del minibloque ANIMA, en especial:

- ANIMA-UX-005 para contexto visible de sede, área, horario y rol operativo;
- ANIMA-UX-006 para simplificación de check-in;
- ANIMA-UX-007 para simplificación de check-out;
- ANIMA-UX-008 para diferenciar marcación confirmada y pendiente;
- ANIMA-UX-009 para explicar por qué no se puede marcar;
- ANIMA-UX-010 para diferenciar errores de ubicación, turno y autorización;
- ANIMA-UX-011 para cola offline comprensible;
- ANIMA-UX-012 para reanudación de una marcación interrumpida.

También consume la línea base transversal que exige lenguaje comprensible, protocolo neutral, participantes representativos, conectividad explícita, reanudación segura, accesibilidad y minimización de datos.

---

#### 4. Frontera con ANIMA-UX-016

ANIMA-UX-015 valida de forma controlada el flujo concreto de check-in y check-out con trabajadores reales y condiciones reproducibles.

ANIMA-UX-016 permanece reservada para auditar y completar los recordatorios operativos de inicio y cierre de turno. Esta tarea no define ni materializa la política de recordatorios, sus disparadores, notificaciones, frecuencia, escalamiento ni programación.

Los hallazgos de UX-015 podrán identificar fricción asociada a la comprensión del momento de marcar, pero cualquier cambio contractual sobre recordatorios deberá resolverse en ANIMA-UX-016.

---

#### 5. Frontera entre validación documental y ejecución operativa

La tarea documental establece qué debe probarse y qué evidencia será suficiente.

La ejecución operativa requiere una sesión real o expresamente autorizada que cumpla el protocolo. Mientras esa sesión no exista:

- no se registrará PASS de usabilidad con trabajadores;
- no se afirmará que el check-in fue validado en campo;
- no se afirmará que el check-out fue validado en campo;
- no se sustituirá evidencia real por simulación narrativa;
- no se usarán resultados imaginados para cerrar defectos.

Una futura ejecución deberá anexar evidencia trazable sin alterar retroactivamente el contrato definido aquí.

---

#### 6. Entorno de prueba

La prueba ordinaria deberá realizarse en un entorno controlado que represente ANIMA sin producir consecuencias laborales o productivas no autorizadas.

El entorno deberá permitir:

- usar build y versión identificables;
- conocer si el backend es local, CI, staging o equivalente autorizado;
- diferenciar datos de prueba de datos productivos;
- ejecutar o simular de forma controlada condiciones de red cuando sea necesario;
- preservar el estado necesario para repetir escenarios;
- impedir que una sesión de usabilidad genere pagos, sanciones, cierres laborales, ajustes de nómina o decisiones administrativas reales por accidente.

Si la única forma de ejecutar un escenario genera efectos reales no reversibles o no autorizados, el escenario se detiene y queda pendiente de un entorno seguro.

---

#### 7. Participantes mínimos

La cobertura mínima deberá incluir trabajadores reales de Vento o participantes laborales expresamente autorizados que representen, en conjunto:

- uso de ANIMA en Android;
- uso de ANIMA en iOS;
- al menos una sesión con conectividad degradada o intermitente;
- al menos una persona que no conozca previamente el flujo nuevo de check-in y check-out.

Una misma persona podrá cubrir más de una condición cuando quede documentado y no se pierda cobertura de plataforma, experiencia o riesgo.

Ningún perfil de trabajador se considerará cubierto únicamente mediante simulación del facilitador.

---

#### 8. Selección de participantes

La selección deberá evitar una muestra formada exclusivamente por personas que diseñaron, desarrollaron o documentaron el flujo.

Se priorizarán participantes que realmente deban usar ANIMA para asistencia y que permitan cubrir diferencias razonables de:

- familiaridad tecnológica;
- antigüedad en la organización;
- plataforma móvil;
- sede o contexto laboral cuando sea relevante;
- familiaridad previa con el sistema.

No se utilizarán atributos sensibles para segmentar la muestra salvo necesidad justificada, autorizada y minimizada.

---

#### 9. Identidad y privacidad del participante

El registro de prueba deberá usar un identificador pseudonimizado o referencia segura de participante.

La evidencia no deberá incluir innecesariamente:

- contraseñas;
- tokens;
- PIN completos;
- documentos de identidad;
- coordenadas precisas cuando no sean indispensables;
- datos médicos;
- información salarial;
- conversaciones privadas;
- información laboral de terceros.

Cuando una captura contenga datos no necesarios, deberá redaccionarse antes de conservarse como evidencia de la sesión.

---

#### 10. Principio de autonomía del trabajador

El facilitador no ejecutará la marcación por el participante ni le dictará la secuencia ordinaria.

El trabajador deberá poder leer, interpretar y actuar por sí mismo. El facilitador podrá intervenir únicamente cuando:

- exista riesgo de producir un efecto no autorizado;
- el participante solicite ayuda;
- se alcance un criterio de aborto;
- el escenario requiera una condición técnica controlada que el participante no deba configurar.

Toda intervención que cambie materialmente el resultado deberá registrarse.

---

#### 11. Protocolo neutral

Las instrucciones de sesión deberán describir el objetivo laboral, no la respuesta esperada de la interfaz.

Ejemplo de intención válida:

> Necesitas iniciar tu jornada con ANIMA. Muéstrame qué harías.

La prueba no deberá anticipar:

- el botón exacto;
- el texto exacto que el trabajador “debería” buscar;
- la existencia de una cola offline;
- el resultado que se espera obtener;
- la causa de un bloqueo antes de que el participante la interprete.

Las preguntas posteriores podrán explorar comprensión sin convertir la sesión en capacitación.

---

#### 12. Precondiciones de sesión

Antes de iniciar cada sesión se deberá registrar:

- versión o build de ANIMA;
- plataforma y versión del sistema operativo;
- tipo de dispositivo;
- estado de sesión autenticada;
- identidad laboral de prueba válida;
- turno o contexto laboral preparado para el escenario;
- conectividad inicial;
- permisos relevantes del dispositivo;
- condición de ubicación necesaria para el caso;
- escenario a ejecutar;
- estado esperado antes de la primera acción.

La sesión no comenzará si el facilitador no puede distinguir un defecto del producto de una precondición incorrecta.

---

#### 13. Unidad de observación

La unidad primaria no es la pantalla ni el toque individual: es la intención laboral de marcar entrada o salida.

Cada escenario deberá seguir la intención desde que el trabajador identifica la necesidad hasta que puede explicar el estado final de su asistencia.

Una repetición causada por doble toque, reintento, reanudación, navegación o respuesta tardía continúa perteneciendo a la misma intención cuando corresponda según el contrato de idempotencia y recuperación.

---

#### 14. Estados que el trabajador debe poder distinguir

La prueba deberá verificar que el participante diferencia, cuando aparezcan:

- listo para marcar;
- procesando;
- confirmado;
- pendiente de sincronización;
- bloqueado por contexto;
- bloqueado por autorización;
- bloqueado por ubicación o permiso;
- sin conectividad antes de persistencia durable;
- intento durable pendiente;
- resultado remoto incierto;
- conflicto que requiere conciliación;
- estado recuperado después de reanudación.

La UI no deberá obligar al participante a inferir estos estados desde un spinner indefinido o desde la ausencia de respuesta.

---

#### 15. Matriz obligatoria de escenarios

| ID | Escenario controlado | Intención | Evidencia principal |
| --- | --- | --- | --- |
| `UX015-S01` | check-in online sin incidente | entrada | acción descubierta, resultado confirmado y estado final comprensible |
| `UX015-S02` | check-out online sin incidente | salida | acción descubierta, resultado confirmado y estado final comprensible |
| `UX015-S03` | doble toque o repetición rápida | entrada o salida | una sola intención y ausencia de efecto duplicado |
| `UX015-S04` | permiso de ubicación denegado | entrada | bloqueo explicable y ruta segura de recuperación |
| `UX015-S05` | permiso habilitado después del bloqueo | entrada | prerequisito revalidado antes de continuar |
| `UX015-S06` | ubicación no disponible o desactualizada | entrada | mensaje causal sin confirmación falsa |
| `UX015-S07` | pérdida de red antes de persistencia durable | entrada o salida | no se afirma que el evento quedó en cola sin evidencia durable |
| `UX015-S08` | pérdida de red después de persistencia durable | entrada o salida | estado pendiente comprensible y misma identidad de intención |
| `UX015-S09` | background y retorno durante la marcación | entrada o salida | reanudación desde el último punto seguro |
| `UX015-S10` | reinicio de la aplicación con intención durable pendiente | entrada o salida | recuperación sin generar una nueva marcación |
| `UX015-S11` | respuesta remota perdida después de posible efecto | entrada o salida | resultado incierto, conciliación y no repetición ciega |
| `UX015-S12` | sesión expirada durante el flujo | entrada o salida | reautenticación y revalidación antes de cualquier efecto |
| `UX015-S13` | turno o contexto laboral cambia durante interrupción | entrada o salida | estado obsoleto no se usa como autoridad |
| `UX015-S14` | estado autoritativo contradice el supuesto local | entrada o salida | conflicto visible y ausencia de last-write-wins de interfaz |
| `UX015-S15` | retorno a Home después del resultado | entrada o salida | Home representa el mismo estado material |
| `UX015-S16` | consulta posterior del estado/historial disponible | entrada o salida | el trabajador puede corroborar el resultado sin crear otro evento |

La ejecución podrá agregar casos, pero no retirar estos escenarios sin una justificación documental explícita.

---

#### 16. Escenario limpio de check-in

El participante deberá comenzar desde un estado laboral válido para entrada y sin instrucciones sobre controles específicos.

Se observará si puede:

1. identificar su contexto relevante;
2. reconocer que la acción disponible corresponde a iniciar asistencia;
3. completar los prerequisitos permitidos;
4. ejecutar una sola intención de check-in;
5. reconocer cuándo la marcación está confirmada;
6. explicar con sus propias palabras qué ocurrió.

El escenario falla si el trabajador cree estar marcado cuando el sistema no puede sostener esa afirmación o si genera más de un efecto para una sola intención.

---

#### 17. Escenario limpio de check-out

El participante deberá comenzar desde un estado laboral válido para salida.

Se observará si puede:

1. identificar que su asistencia está activa;
2. reconocer la acción de cierre;
3. diferenciar check-out de otras acciones laborales;
4. completar una sola intención de salida;
5. reconocer el resultado confirmado;
6. explicar si su jornada quedó cerrada o si existe una condición pendiente.

La UI no deberá requerir conocimiento de estados internos o nomenclatura técnica para comprender el cierre.

---

#### 18. Prueba de repetición e idempotencia visible

El facilitador deberá reproducir al menos una repetición razonable: doble toque, toque repetido por demora o reanudación que expone nuevamente una acción.

Se verificará que:

- la interfaz no incentive una segunda intención material;
- el estado visible no cambie de forma contradictoria;
- el backend o contrato de prueba no materialice dos efectos para el mismo intento cuando exista identidad estable;
- una respuesta tardía no provoque una falsa necesidad de volver a marcar;
- el participante pueda saber qué hacer sin “probar otra vez” a ciegas.

---

#### 19. Permisos y ubicación

Los escenarios de permiso y ubicación deberán comprobar que el trabajador entiende la causa del bloqueo y la acción permitida para resolverlo.

Abrir configuración del sistema no se considerará equivalente a conceder el permiso.

Al retornar a ANIMA deberán revalidarse los prerequisitos actuales. Una ubicación obtenida antes de una interrupción no conserva validez indefinida por haber pertenecido al mismo flujo.

---

#### 20. Turno, sede, área y rol

Cuando el flujo dependa del turno o contexto laboral, la prueba deberá comprobar que el trabajador puede identificar el contexto relevante sin confundirlo con preferencias, geocerca, perfil genérico o información histórica.

Si el contexto cambia durante una interrupción, ANIMA deberá revalidar el hecho autoritativo antes de continuar.

Un contexto obsoleto no podrá conservar autoridad solo porque estaba visible al inicio de la intención.

---

#### 21. Autorización

La prueba deberá distinguir entre una acción no disponible por falta de autoridad y una falla técnica.

La experiencia deberá:

- evitar presentar como ejecutable una acción que el actor no puede completar;
- evitar revelar detalles internos de políticas de autorización;
- ofrecer una explicación humana suficiente;
- revalidar autoridad después de renovación de sesión o cambio material de contexto.

El facilitador no convertirá una cuenta privilegiada en sustituto del participante para “hacer pasar” el escenario.

---

#### 22. Conectividad antes de persistencia durable

Cuando se pierda conectividad antes de que exista evidencia durable de la intención, la interfaz no deberá afirmar que la marcación está guardada, encolada o pendiente de sincronización.

El participante deberá recibir una salida que no le induzca a abandonar el flujo creyendo que el evento quedó protegido cuando no puede demostrarse.

La sesión registrará si la persona comprende la diferencia entre “no se pudo guardar todavía” y “quedó pendiente para sincronizar”.

---

#### 23. Conectividad después de persistencia durable

Cuando la intención ya esté persistida de forma durable, la prueba deberá comprobar que el trabajador reconoce que existe un evento pendiente y que no necesita crear otro.

El estado deberá sobrevivir a navegación, background o reinicio conforme al contrato vigente y conservar identidad estable.

La prueba falla si el participante recibe señales que razonablemente lo lleven a duplicar la marcación.

---

#### 24. Resultado remoto incierto

Si la comunicación se pierde después de que el servidor pudo haber aplicado el efecto, la prueba deberá observar que ANIMA no representa el caso como un fallo ordinario que invite a repetir.

El estado deberá comunicar incertidumbre o conciliación según corresponda y preservar suficiente evidencia para resolver el resultado.

La ausencia de respuesta no podrá interpretarse automáticamente como ausencia de efecto.

---

#### 25. Interrupción y reanudación

Se deberá interrumpir al menos un flujo mediante background, bloqueo del dispositivo, reinicio de la aplicación o una condición equivalente controlada.

Al reingresar se verificará que ANIMA:

- recupera la misma intención cuando existe identidad durable;
- identifica el último punto seguro;
- revalida datos que pudieron caducar;
- no reusa permisos, autorización, ubicación o contexto obsoletos como autoridad;
- no genera una marcación adicional por reconstruir la pantalla;
- conduce al participante a un estado comprensible.

---

#### 26. Renovación de sesión

Cuando la sesión expire durante un flujo, la reautenticación deberá preservar únicamente la referencia segura necesaria para continuar o conciliar.

Antes de cualquier nuevo efecto se deberá verificar que:

- el actor autenticado corresponde al propietario de la intención;
- la autoridad sigue vigente;
- el turno y contexto siguen siendo válidos;
- la intención no fue ya aplicada;
- no existe conflicto que requiera intervención.

---

#### 27. Conflicto autoritativo

Cuando la fuente autoritativa contradiga el estado local, la interfaz deberá dejar de presentar el supuesto local como verdad.

La prueba deberá comprobar que el participante recibe una salida comprensible y que el sistema preserva evidencia para conciliación.

Un conflicto no deberá transformarse silenciosamente en retry ordinario ni resolverse mediante último estado visual escrito.

---

#### 28. Consistencia Home y estado posterior

Después de cada escenario materializado o conciliado, se deberá volver a la superficie personal donde el trabajador consulta su asistencia.

La prueba verificará que:

- el estado no contradice el resultado del flujo;
- una marcación pendiente sigue diferenciándose de una confirmada;
- un conflicto sigue siendo visible como condición no resuelta cuando corresponda;
- la acción principal disponible es coherente con el estado actual;
- el participante no necesita recordar manualmente qué hizo para interpretar la pantalla.

---

#### 29. Lenguaje y comprensión

Para cada mensaje material se preguntará al participante, después de su primera interpretación:

- qué cree que ocurrió;
- si su entrada o salida ya quedó registrada;
- qué cree que debe hacer ahora;
- qué condición está impidiendo continuar, cuando exista bloqueo.

Las respuestas se registrarán de forma resumida y pseudonimizada.

La capacitación posterior no corregirá retroactivamente una incomprensión observada.

---

#### 30. Accesibilidad observada

La sesión deberá registrar barreras que impidan o dificulten comprender o ejecutar el flujo por:

- tamaño o alcance táctil;
- contraste o dependencia exclusiva de color;
- jerarquía visual;
- lectura del texto;
- foco o lector de pantalla cuando aplique a la muestra;
- tiempo insuficiente;
- controles demasiado próximos;
- feedback dependiente únicamente de animación, háptica o iconografía.

Un hallazgo de accesibilidad se clasifica por impacto y se conserva aunque el participante logre terminar mediante compensación o ayuda.

---

#### 31. Métricas de sesión

Cada escenario deberá registrar al menos:

- completado, fallido o abortado;
- resultado esperado y resultado observado;
- número de intentos iniciados por el participante;
- repeticiones o toques adicionales motivados por incertidumbre;
- intervención del facilitador;
- comprensión del estado final;
- recuperación exitosa o no después de interrupción;
- existencia de duplicación material;
- existencia de confirmación falsa;
- barreras de accesibilidad;
- defectos o fricciones detectados.

El tiempo podrá registrarse como evidencia contextual, pero esta tarea no fija un umbral universal de segundos sin datos operativos que lo justifiquen.

---

#### 32. Esquema mínimo de evidencia

Cada registro de escenario deberá conservar:

| Campo | Regla |
| --- | --- |
| `session_ref` | referencia segura de la sesión |
| `participant_ref` | pseudónimo o identificador no sensible |
| `coverage_tags` | plataforma, primera experiencia, condición de red u otras etiquetas necesarias |
| `build_ref` | versión o build identificable |
| `environment_ref` | entorno autorizado de prueba |
| `scenario_id` | identificador de la matriz UX015 |
| `precondition` | estado previo relevante |
| `expected_outcome` | resultado contractual esperado |
| `observed_outcome` | resultado realmente observado |
| `participant_understanding` | interpretación resumida del participante |
| `facilitator_intervention` | ninguna o intervención registrada |
| `result` | PASS, FAIL o ABORTED para el escenario operativo |
| `issue_ref` | referencia de hallazgo cuando exista |
| `evidence_refs` | capturas, logs o referencias seguras y redactadas |
| `decision` | continuar, repetir justificadamente, corregir o bloquear |

La evidencia de una futura ejecución no se inventará dentro de este artefacto documental.

---

#### 33. Clasificación de hallazgos

Cada hallazgo deberá clasificarse al menos como:

- comprensión o lenguaje;
- jerarquía o descubribilidad;
- contexto laboral;
- autorización;
- ubicación o permiso;
- conectividad;
- persistencia o sincronización;
- idempotencia o duplicación;
- reanudación;
- estado autoritativo o conciliación;
- accesibilidad;
- privacidad;
- defecto técnico;
- problema de preparación del escenario.

La clasificación no sustituye el diagnóstico técnico. Su función es impedir que una falla de producto se cierre como “error del usuario” y que una mala precondición se atribuya al producto sin evidencia.

---

#### 34. Severidad y bloqueo

Se consideran bloqueantes para aprobar la ejecución operativa:

- cualquier duplicación material de check-in o check-out causada por una sola intención;
- cualquier confirmación visible de éxito que no pueda sostenerse con el estado material disponible;
- cualquier situación en la que el participante no pueda determinar si está dentro o fuera de asistencia y no exista una ruta explícita de recuperación o conciliación;
- exposición de datos sensibles no necesarios;
- bypass de autorización;
- pérdida de una intención durable sin mecanismo de recuperación;
- conflicto convertido silenciosamente en estado exitoso;
- una barrera de accesibilidad que impida completar una acción laboral crítica a un participante cubierto.

Un fallo bloqueante no podrá compensarse mediante promedio de éxito del resto de participantes.

---

#### 35. Criterios de aborto de sesión

La sesión se abortará de forma controlada cuando:

- exista riesgo de producir un efecto laboral o productivo no autorizado;
- se detecte exposición de datos sensibles que no pueda contenerse;
- el participante o facilitador pierda certeza sobre el entorno utilizado;
- la identidad de prueba sea incorrecta;
- el escenario pueda afectar a un tercero;
- un defecto impida recuperar el estado seguro;
- continuar requiera conceder privilegios fuera del alcance de la prueba.

Un escenario abortado no se registrará como PASS ni como FAIL del producto sin distinguir la causa.

---

#### 36. Regla de repetición

Un escenario podrá repetirse cuando:

- la precondición estaba mal preparada;
- el entorno falló de forma ajena al comportamiento bajo prueba;
- se requiere confirmar reproducibilidad de un hallazgo;
- se prueba la corrección de un defecto posterior.

La repetición no borrará el resultado original. Ambos intentos deberán conservar relación trazable.

---

#### 37. Gate de decisión de la ejecución operativa

Una futura ejecución podrá declararse PASS únicamente cuando:

1. exista cobertura real de los perfiles mínimos;
2. todos los escenarios obligatorios tengan evidencia;
3. no permanezca ningún fallo bloqueante abierto;
4. no exista duplicación material por una sola intención;
5. no exista confirmación falsa de asistencia;
6. los participantes puedan distinguir confirmado, pendiente, bloqueado e incierto cuando esos estados aparezcan;
7. los escenarios de interrupción y conectividad mantengan recuperación comprensible;
8. los hallazgos no bloqueantes tengan propietario y salida definida;
9. la evidencia respete privacidad y minimización;
10. el veredicto sea reproducible a partir de los registros de sesión.

Hasta entonces el resultado operativo será NOT_EXECUTED o FAIL según la evidencia realmente disponible.

---

#### 38. Handoff de hallazgos

Los hallazgos deberán dirigirse a la tarea o propietario canónico que corresponda.

Esta tarea no crea automáticamente nuevas tareas por cada observación.

Cuando el hallazgo pertenezca a contratos ya definidos de check-in, check-out, estado visible, bloqueo, offline o reanudación, deberá vincularse al contrato propietario existente y a su futura materialización.

Cuando el hallazgo sea específicamente sobre recordatorios de inicio o cierre de turno, se deriva a ANIMA-UX-016 sin desarrollar aquí su solución.

---

#### 39. Requisitos de prueba derivados

**NO GENERA REQUISITOS DE PRUEBA.**

Requisitos creados: **0**
Requisitos modificados: **0**
Requisitos diferidos: **0**
Requisitos descartados: **0**
Requisitos obsoletos: **0**

La tarea operacionaliza obligaciones de prueba ya existentes sobre marcación, idempotencia, estado visible, conectividad, reanudación y validación con trabajadores reales. No introduce una regla de producto nueva que justifique duplicar el registro canónico.

---

#### 40. Cobertura de prueba vigente reutilizada

Se reutiliza sin modificación la cobertura existente, entre otros:

- `TREQ-ANIMA-003`, para persistencia durable offline, identidad estable, replay, idempotencia, conflicto y recuperación de marcaciones;
- `TREQ-ANIMA-015`, para mantener separados en Home los estados de asistencia y los condicionantes que no deben confundirse con la confirmación material;
- `TREQ-UX-274` a `TREQ-UX-296`, como cobertura transversal de checkpoint semántico, interrupciones, reanudación y estados visibles;
- `TREQ-UX-297` a `TREQ-UX-319`, como cobertura transversal de validación semántica con participantes representativos, protocolo neutral, severidad y comprensión de términos y acciones.

Esta enumeración es trazabilidad hacia requisitos vigentes y no modifica el registro canónico de requisitos.

---

#### 41. Evidencia de validación

| Clase | Estado | Evidencia |
| --- | --- | --- |
| BUILD | NOT_EXECUTED | No se ejecutó build de ANIMA ni del repositorio durante el desarrollo documental de este contrato. |
| LOCAL | PASS | El artefacto se verificó estructuralmente como una sola tarea, con metadata completa, secciones obligatorias, cero requisitos derivados, continuidad cerrada y sin instrucciones operativas internas. |
| REMOTA | PASS | Se verificaron en las fuentes canónicas vigentes la tarea actual ANIMA-UX-015, la continuidad desde ANIMA-UX-014, la reserva de ANIMA-UX-016, la topología DEFINE_ONCE, los contratos previos de check-in/check-out y la cobertura de prueba reutilizada. |
| OPERATIVA | NOT_EXECUTED | No se ejecutaron sesiones reales con trabajadores durante el desarrollo documental; los resultados de participantes, escenarios y métricas deberán provenir de una ejecución posterior trazable. |
| FÍSICA | NOT_APPLICABLE | ANIMA-UX-015 es documental y DEFINE_ONCE; no autoriza cambios de código, Supabase, datos productivos, dispositivos, despliegues ni efectos laborales. |

---

#### 42. Criterios de aceptación

1. La tarea define una validación específica de check-in y check-out con trabajadores reales y no una encuesta genérica de satisfacción.
2. La tarea conserva ANIMA-UX-014 como tarea anterior exacta.
3. La tarea conserva ANIMA-UX-016 como siguiente tarea reservada exacta.
4. La tarea no desarrolla la política de recordatorios reservada a ANIMA-UX-016.
5. La aprobación documental no se presenta como evidencia de que las sesiones con trabajadores ya ocurrieron.
6. La muestra mínima cubre Android.
7. La muestra mínima cubre iOS.
8. La muestra mínima cubre al menos una condición de conectividad degradada o intermitente.
9. La muestra mínima cubre al menos una persona sin conocimiento previo del flujo nuevo.
10. Ningún perfil de trabajador se declara cubierto únicamente mediante simulación del facilitador.
11. La selección evita depender exclusivamente de autores o desarrolladores del flujo.
12. La evidencia usa referencias pseudonimizadas y minimiza datos personales.
13. Las credenciales y secretos no forman parte de la evidencia ordinaria.
14. El facilitador no ejecuta la acción ordinaria por el participante.
15. Toda intervención material del facilitador queda registrada.
16. Las instrucciones de prueba describen la intención laboral y no revelan el control que debe pulsarse.
17. El protocolo registra build, plataforma, dispositivo, sesión, contexto, conectividad, permisos y precondición.
18. La unidad de observación es la intención laboral de marcar y no cada montaje de pantalla.
19. El escenario limpio de check-in verifica descubribilidad, ejecución y comprensión del resultado.
20. El escenario limpio de check-out verifica descubribilidad, ejecución y comprensión del resultado.
21. Una sola intención no puede producir dos efectos materiales por repetición de interacción.
22. Un doble toque o respuesta tardía no debe inducir una segunda marcación.
23. Permiso de ubicación denegado se presenta como causa comprensible y no como error genérico.
24. Regresar desde configuración del sistema obliga a revalidar el permiso actual.
25. Una ubicación desactualizada no conserva autoridad por pertenecer al flujo previo.
26. El contexto de turno se revalida cuando pudo cambiar durante una interrupción.
27. Una falta de autorización se diferencia de una falla técnica sin revelar políticas internas sensibles.
28. Antes de persistencia durable la UI no afirma que la marcación quedó en cola.
29. Después de persistencia durable la UI puede representar el evento como pendiente sin invitar a duplicarlo.
30. Un reinicio de la aplicación recupera una intención durable según el contrato existente.
31. Background y foreground no crean una nueva intención por sí mismos.
32. Una respuesta remota perdida después de un posible efecto se trata como resultado incierto o conciliable, no como retry ciego.
33. Una sesión expirada exige reautenticación y revalidación antes de un nuevo efecto.
34. Un conflicto autoritativo no se resuelve mediante last-write-wins de interfaz.
35. Home representa un estado coherente con el resultado material o pendiente del flujo.
36. El participante puede explicar si está marcado, pendiente, bloqueado o en incertidumbre cuando cada estado aparece.
37. La capacitación posterior no convierte una incomprensión inicial en PASS retroactivo.
38. Se registran barreras de accesibilidad aunque el participante logre completar mediante compensación.
39. Cada escenario conserva resultado esperado y observado.
40. Cada escenario conserva la comprensión resumida del participante.
41. Cada escenario conserva intervenciones del facilitador.
42. Cada escenario conserva referencia de hallazgo cuando exista.
43. Un escenario abortado se distingue de PASS y FAIL del producto.
44. Las repeticiones conservan el resultado original y su relación con el nuevo intento.
45. Cualquier duplicación material de asistencia bloquea el PASS operativo.
46. Cualquier confirmación falsa de asistencia bloquea el PASS operativo.
47. Un bypass de autorización bloquea el PASS operativo.
48. Una exposición material de datos sensibles bloquea el PASS operativo.
49. Un fallo bloqueante no puede compensarse mediante promedio de éxito del resto de la muestra.
50. La ejecución operativa solo podrá declararse PASS con cobertura mínima, escenarios completos, evidencia trazable y cero bloqueantes abiertos.
51. Los hallazgos no crean tareas nuevas cuando ya existe un propietario canónico.
52. Los hallazgos sobre recordatorios se derivan a ANIMA-UX-016 sin desarrollar su solución.
53. La sección de requisitos derivados declara cero requisitos y no contiene identificadores de requisitos.
54. La cobertura reutilizada se documenta fuera de la sección de requisitos derivados.
55. La tarea no modifica el registro 04A.
56. BUILD permanece NOT_EXECUTED mientras no exista ejecución real de build asociada a esta entrega documental.
57. OPERATIVA permanece NOT_EXECUTED mientras no exista evidencia real de sesiones con trabajadores.
58. FÍSICA permanece NOT_APPLICABLE porque la tarea no autoriza materialización física.
59. La continuidad termina exactamente en ANIMA-UX-016.
60. Ninguna conclusión de esta tarea autoriza implementación física, cambios productivos o avance automático de continuidad.

---

#### 43. Límites

Esta tarea no:

- implementa cambios en ANIMA;
- modifica componentes, rutas o navegación;
- crea o modifica tablas, funciones, RLS, migraciones o configuración de Supabase;
- ejecuta una marcación productiva;
- altera nómina, asistencia oficial o programación laboral;
- autoriza recopilación de datos sensibles adicionales;
- define recordatorios operativos de entrada o salida;
- sustituye pruebas automatizadas de idempotencia, persistencia o autorización;
- declara aprobada la usabilidad real sin sesiones trazables;
- convierte a un facilitador en representante del trabajador;
- autoriza acceso a información de terceros;
- crea una instancia física propia.

---

#### 44. Continuidad

**ÚLTIMA TAREA APROBADA**
`ANIMA-UX-014 — Simplificar administración de equipo autorizada`

**TAREA ACTUAL APROBADA**
`ANIMA-UX-015 — Probar check-in y check-out con trabajadores reales`

**SIGUIENTE TAREA RESERVADA**
`ANIMA-UX-016 — Auditar y completar recordatorios operativos de inicio y cierre de turno`


### ✅ ANIMA-UX-016 — Auditar y completar recordatorios operativos de inicio y cierre de turno

**Estado:** APROBADA
**Tarea anterior:** ANIMA-UX-015 — Probar check-in y check-out con trabajadores reales
**Tarea siguiente:** ANIMA-UX-017 — Diseñar ciclo completo de novedades internas: audiencia, publicación, edición, archivo, notificación y visibilidad
**Tipo de tarea:** documental; auditoría AS-IS y diseño UX TO-BE de recordatorios operativos personales de inicio y cierre de turno en ANIMA, con elegibilidad derivada del turno publicado y del estado real de asistencia, supresión, deduplicación, navegación segura y trazabilidad, sin materialización física
**Bloque:** F_ANIMA — EXPERIENCIA DEL TRABAJADOR Y ADMINISTRACION
**Repositorio propietario:** vento-group-sas/vento-shell
**Archivo propietario:** docs/plan-canonico/modular/bloques/F_ANIMA/02_EXPERIENCIA_DEL_TRABAJADOR_Y_ADMINISTRACION.md
**Estado físico resultante:** ESPECIFICADO_NO_MATERIALIZADO
**Cambios físicos autorizados:** NINGUNO
**Requisitos de prueba creados o modificados:** 0

---

#### 1. Propósito

Auditar el comportamiento existente de recordatorios asociados al turno de ANIMA y completar el contrato UX objetivo para que el trabajador reciba avisos oportunos de inicio y cierre únicamente cuando la fuente laboral vigente y el estado de asistencia indiquen que el aviso sigue siendo pertinente.

La tarea debe resolver, de forma cerrada y reutilizable:

- cuándo existe un recordatorio de inicio elegible;
- cuándo existe un recordatorio de cierre elegible;
- qué condiciones suprimen cada aviso;
- cómo se evita repetir el mismo recordatorio por ejecución, dispositivo o reintento;
- cómo se representa un recordatorio previo y uno posterior al hito horario;
- cómo se comporta una notificación que llega tarde o después de cambiar el estado real;
- cómo se mantiene separada la notificación de la acción material de asistencia;
- cómo se conserva navegación segura sin ampliar destinos por conveniencia;
- cómo se diferencia intento de envío, aceptación del proveedor y recepción real;
- cómo se conserva el flujo aunque el trabajador haya negado notificaciones.

Esta tarea define experiencia y contrato. No implementa scheduler, Edge Functions, cambios de aplicación, migraciones, cron, tablas, políticas ni despliegues.

---

#### 2. Resultado contractual

ANIMA deberá tratar los recordatorios de turno como una proyección auxiliar del estado laboral vigente y nunca como fuente de verdad de asistencia.

El resultado TO-BE queda gobernado por esta relación:

```text
TURNO PUBLICADO VIGENTE
+
ESTADO REAL DE ASISTENCIA
+
VENTANA TEMPORAL CONFIGURADA
+
CANAL DISPONIBLE
+
REGLA DE SUPRESIÓN Y DEDUPLICACIÓN
=
RECORDATORIO ELEGIBLE
```

Y por estas negaciones obligatorias:

```text
RECORDATORIO
≠ CHECK-IN
≠ CHECK-OUT
≠ AUTORIZACIÓN
≠ CONFIRMACIÓN DE ASISTENCIA
≠ PRUEBA DE ENTREGA AL USUARIO
≠ FUENTE DE VERDAD DEL TURNO
```

El recordatorio puede conducir a una superficie de consulta, pero la acción posterior vuelve a resolver estado, contexto y autoridad mediante sus propietarios canónicos.

---

#### 3. Base canónica consumida

La tarea consume sin reabrir las decisiones aprobadas del minibloque ANIMA, especialmente:

- ANIMA-UX-004 para turno actual y siguiente turno;
- ANIMA-UX-005 para horario, sede, área y rol operativo visibles;
- ANIMA-UX-006 y ANIMA-UX-007 para las intenciones de check-in y check-out;
- ANIMA-UX-008 para diferenciar resultado confirmado y pendiente;
- ANIMA-UX-009 y ANIMA-UX-010 para bloqueos y causas comprensibles;
- ANIMA-UX-011 y ANIMA-UX-012 para persistencia, offline y reanudación;
- ANIMA-UX-015 para la validación controlada de la experiencia de marcación.

También preserva el contrato vigente de navegación de notificaciones de ANIMA y la separación entre programación publicada, asistencia material y estado local del dispositivo.

---

#### 4. Frontera con ANIMA-UX-017

ANIMA-UX-016 cubre exclusivamente recordatorios operativos vinculados al inicio y cierre de un turno personal.

ANIMA-UX-017 permanece reservada para el ciclo de novedades internas: audiencia, publicación, edición, archivo, notificación y visibilidad.

Por tanto, esta tarea no define:

- notificaciones editoriales de novedades;
- campañas o anuncios generales;
- audiencias administrativas;
- publicación de comunicados;
- preferencias editoriales;
- notificaciones de soporte;
- mensajes masivos no vinculados a un turno concreto.

Compartir infraestructura push no convierte esas familias en un mismo contrato funcional.

---

#### 5. Unidad de recordatorio

La unidad lógica es una combinación estable de:

```text
trabajador
+
turno publicado
+
clase de recordatorio
+
etapa temporal
```

La identidad del recordatorio no se define por token push, dispositivo, ejecución del cron ni intento HTTP.

Un trabajador con dos dispositivos puede recibir copias del mismo aviso sin que eso cree dos recordatorios empresariales distintos.

Una reejecución técnica no debe crear una nueva unidad si corresponde a la misma combinación lógica.

---

#### 6. Auditoría AS-IS verificada

La inspección del estado actual muestra una base funcional parcial:

| Hallazgo AS-IS | Lectura contractual |
| --- | --- |
| ANIMA ya integra `expo-notifications` y registra/sincroniza tokens push. | Existe infraestructura de canal; no equivale a un contrato completo de recordatorios de turno. |
| El runtime de turnos consulta programación publicada, asistencia y tokens activos. | Existe una base autoritativa suficiente para evaluar recordatorios de cierre. |
| Existe recordatorio antes del final del turno para sesiones todavía abiertas. | El cierre previo está parcialmente materializado. |
| Existe un segundo recordatorio si el turno sigue abierto después de finalizar. | El cierre posterior existe, pero su identidad de navegación diverge del allowlist móvil vigente. |
| No se encontró recordatorio operativo equivalente para el inicio del turno. | La familia de inicio está incompleta. |
| El runtime actual usa por defecto cinco minutos antes del cierre. | Existe una referencia operacional vigente para la anticipación previa. |
| El runtime actual usa una espera posterior asociada a la gracia configurada, con fallback de treinta minutos. | Existe un comportamiento AS-IS de seguimiento posterior; el contrato TO-BE separa recordatorio de autocierre. |
| El autocierre programado por tiempo está deshabilitado y el autocierre observado pertenece al flujo de salida de geocerca. | Un recordatorio posterior no debe transformarse en check-out automático por reloj. |
| El cliente navega a Turnos para tipos de turno reconocidos. | La navegación segura ya tiene una frontera explícita que debe preservarse. |
| El backend emite actualmente `shift_end_reminder_followup`, pero el cliente no lo reconoce en su allowlist de navegación. | Existe drift de contrato entre productor y consumidor. |
| El envío push puede fallar en proveedor y el flujo técnico actual continúa acumulando eventos de runtime. | La evidencia futura debe distinguir intento, aceptación y entrega; no debe registrar éxito semántico sin evidencia suficiente. |

La auditoría describe implementación vigente; no la convierte automáticamente en contrato permanente.

---

#### 7. Principio de pertinencia

Un aviso solo se genera cuando todavía ayuda al trabajador a realizar una acción legítima.

Antes de emitirlo se deberá revalidar, como mínimo:

1. que el turno existe;
2. que continúa publicado;
3. que no está cancelado;
4. que corresponde a jornada laboral y no a descanso;
5. que pertenece al trabajador objetivo;
6. que el hito temporal aplicable sigue vigente;
7. que el estado de asistencia no vuelve innecesario el recordatorio;
8. que no existe ya un evento lógico equivalente procesado;
9. que una intención durable pendiente no haría engañoso invitar a repetir la acción.

La existencia de una programación histórica no basta para enviar un aviso actual.

---

#### 8. Taxonomía TO-BE de recordatorios

La familia operativa queda compuesta por cuatro etapas:

| Clase | Etapa | Objetivo |
| --- | --- | --- |
| `INICIO` | `ANTES_DEL_INICIO` | avisar que el turno está próximo y facilitar que el trabajador consulte su contexto antes de marcar |
| `INICIO` | `DESPUES_DEL_INICIO` | avisar que el turno ya comenzó cuando todavía no existe evidencia de entrada ni una intención durable pendiente |
| `CIERRE` | `ANTES_DEL_FIN` | avisar que el turno está próximo a terminar cuando la asistencia continúa abierta |
| `CIERRE` | `DESPUES_DEL_FIN` | avisar que el turno continúa abierto después de su fin programado cuando todavía corresponde una salida manual |

Cada etapa se deduplica por turno y trabajador.

Una etapa posterior no se emite por el solo hecho de haber emitido la anterior; vuelve a evaluar pertinencia.

---

#### 9. Compatibilidad con la navegación vigente

Esta tarea no amplía el conjunto de destinos permitido por la navegación de notificaciones.

Para preservar el contrato vigente:

- los recordatorios de inicio reutilizan la familia de tipo de turno ya permitida y agregan semántica de recordatorio en el payload;
- los recordatorios de cierre reutilizan `shift_end_reminder` para las etapas previa y posterior, diferenciadas mediante metadata de etapa;
- `shift_auto_checkout` continúa reservado a informar un autocierre material ya producido por su flujo propietario;
- una actualización de programación continúa separada mediante el tipo de actualización vigente;
- ningún tipo desconocido abre una ruta arbitraria.

El identificador AS-IS `shift_end_reminder_followup` se considera drift de productor y no una nueva identidad canónica que deba incorporarse al allowlist.

---

#### 10. Recordatorio previo de inicio

El recordatorio previo de inicio se evalúa sobre un turno laboral publicado que todavía no ha comenzado.

Baseline de diseño:

- anticipación inicial: cinco minutos antes del inicio programado;
- una sola unidad lógica por turno;
- contenido centrado en hora y contexto necesario;
- navegación hacia Turnos para consultar la asignación vigente;
- ninguna ejecución automática de check-in al abrir la notificación.

La anticipación es una política configurable por el propietario futuro de runtime; el valor inicial conserva una ventana corta coherente con el recordatorio previo de cierre observado.

El aviso se suprime si ya existe una entrada confirmada o una intención durable de entrada cuyo resultado todavía debe resolverse.

---

#### 11. Recordatorio posterior de inicio

Después del inicio programado podrá existir un seguimiento único cuando el trabajador aún no aparece con una entrada confirmada y tampoco existe una intención durable pendiente o un conflicto que deba conciliarse.

Baseline de diseño:

- evaluación inicial cinco minutos después del inicio;
- máximo un seguimiento por turno;
- no califica al trabajador como ausente ni incumplido;
- no genera sanción ni novedad laboral automáticamente;
- no presume que el trabajador debía poder marcar si existe bloqueo de autorización, ubicación, sesión, conectividad o contexto.

Su función es recordar, no clasificar cumplimiento laboral.

---

#### 12. Recordatorio previo de cierre

El aviso previo de cierre solo es elegible cuando el turno correspondiente mantiene una sesión de asistencia abierta.

Baseline vigente:

- cinco minutos antes del fin programado cuando no exista otra política válida;
- un aviso previo por turno;
- supresión inmediata si la salida ya está confirmada;
- supresión si existe una intención durable de salida pendiente o un resultado incierto que deba conciliarse;
- navegación a Turnos sin ejecutar check-out desde la respuesta de notificación.

No se envía un recordatorio de cierre a una persona que nunca inició asistencia únicamente porque su turno estaba programado.

---

#### 13. Recordatorio posterior de cierre

Si el fin programado ya ocurrió y la asistencia continúa autoritativamente abierta, podrá generarse un seguimiento posterior.

La política futura debe usar un parámetro explícito de recordatorio posterior al fin. Mientras exista una transición desde el comportamiento legacy, el valor de gracia observado puede actuar únicamente como compatibilidad temporal documentada; no deberá seguir acoplando semánticamente el recordatorio al concepto de autocierre.

Reglas:

1. el seguimiento se evalúa nuevamente contra estado actual;
2. se emite como máximo una vez por turno y etapa;
3. se suprime cuando la salida ya quedó confirmada;
4. se suprime cuando existe salida durable pendiente o resultado incierto;
5. no ejecuta autocierre por reloj;
6. no amenaza ni presume una falta laboral;
7. utiliza la misma familia canónica de recordatorio de cierre y una metadata de etapa distinta.

---

#### 14. Separación del autocierre

Recordatorio posterior y autocierre son comportamientos distintos.

```text
FIN PROGRAMADO
→ PUEDE GENERAR RECORDATORIO

FIN PROGRAMADO
↛ NO GENERA CHECK-OUT AUTOMÁTICO POR SÍ SOLO
```

El autocierre observado por salida física de geocerca permanece gobernado por su contrato propio y, cuando produzca realmente una salida, puede informar ese resultado mediante `shift_auto_checkout`.

Esta tarea no habilita `scheduled_auto_checkout_enabled`, no redefine geocercas y no cambia el propietario del autocierre.

---

#### 15. Matriz de elegibilidad y supresión

| Situación | Inicio | Cierre | Decisión |
| --- | --- | --- | --- |
| Turno no publicado | NO | NO | suprimir |
| Turno cancelado | NO | NO | suprimir |
| Turno de descanso | NO | NO | suprimir |
| Turno laboral futuro sin entrada | SÍ, según ventana | NO | recordar inicio |
| Entrada confirmada antes del inicio | NO | según fin y sesión | suprimir inicio |
| Entrada durable pendiente | NO | NO hasta resolver estado aplicable | no inducir duplicación |
| Inicio ya pasó sin entrada | SÍ, seguimiento único | NO | recordar sin declarar ausencia |
| Sesión abierta cerca del fin | NO | SÍ | recordar cierre |
| Salida confirmada | NO | NO | suprimir cierre |
| Salida durable pendiente | NO | NO | esperar/conciliar |
| Resultado remoto incierto | NO | NO | no invitar a repetir |
| Autocierre ya aplicado | NO | NO | mostrar resultado actual, no recordar salida |
| Conflicto de asistencia | NO | NO | dirigir a resolución vigente |
| Turno reprogramado | reevaluar | reevaluar | usar versión vigente, no horario viejo |

La matriz define decisión de envío; no reemplaza la lógica autorizativa de la marcación.

---

#### 16. Reprogramación y cancelación

Un recordatorio se calcula sobre la versión vigente del turno en el momento de evaluar el envío.

Si el turno cambia:

- el horario anterior pierde autoridad para recordatorios futuros;
- un aviso ya recibido no conserva autoridad sobre el turno actual;
- al abrir una notificación antigua, ANIMA consulta el estado vigente;
- una cancelación suprime recordatorios todavía no emitidos;
- una reprogramación vuelve a calcular las ventanas sobre la programación publicada vigente;
- no se duplica el recordatorio por conservar simultáneamente la versión anterior y la nueva.

El historial de cambios puede conservarse para auditoría sin convertirse en agenda activa.

---

#### 17. Notificación tardía o estado obsoleto

El dispositivo y el proveedor pueden entregar una notificación después del momento esperado.

Al responder a cualquier recordatorio, ANIMA debe:

1. tratar el payload como referencia, no como autoridad;
2. recuperar el turno vigente;
3. recuperar el estado de asistencia vigente y los pendientes durables aplicables;
4. ignorar la invitación original si ya no corresponde;
5. presentar el estado real actual.

Ejemplos:

- un recordatorio de inicio abierto después del check-in muestra el turno ya iniciado, no invita a volver a marcar;
- un recordatorio de cierre abierto después del check-out muestra el estado cerrado;
- un recordatorio de un turno cancelado no ofrece acción sobre ese turno;
- un recordatorio de una versión anterior dirige al turno vigente cuando sigue existiendo.

---

#### 18. Dedupe lógico

El sistema deberá impedir duplicación por:

- reejecución del scheduler;
- dos workers concurrentes;
- retry de red;
- varios tokens del mismo trabajador;
- token duplicado;
- reinicio del proceso;
- reprogramación sin cambio de etapa lógica;
- respuesta tardía del proveedor.

La deduplicación se aplica a la unidad trabajador + turno + clase + etapa, no al mensaje físico individual.

Varios dispositivos pueden recibir el mismo recordatorio, pero el registro empresarial de la etapa continúa siendo uno.

---

#### 19. Estados de entrega

La trazabilidad técnica no podrá reducir el ciclo a `enviado = true`.

Como mínimo deberá poder distinguir conceptualmente:

- `SUPPRESSED`: no correspondía emitir;
- `READY`: elegible y pendiente de intento;
- `ATTEMPTED`: se realizó un intento hacia el proveedor;
- `PROVIDER_ACCEPTED`: el proveedor aceptó la solicitud cuando exista evidencia de ello;
- `PROVIDER_REJECTED`: el proveedor rechazó la solicitud o el token;
- `DELIVERY_UNKNOWN`: no existe evidencia suficiente para afirmar entrega;
- `DUPLICATE_SKIPPED`: la misma unidad lógica ya fue procesada.

`PROVIDER_ACCEPTED` no equivale a leído por el trabajador.

La ausencia de receipt de dispositivo no deberá representarse como prueba de recepción humana.

---

#### 20. Fallo del proveedor y evidencia honesta

Un fallo HTTP, excepción de red o rechazo del proveedor no podrá persistirse como recordatorio enviado únicamente porque el scheduler llegó a esa rama de ejecución.

Cuando el intento falle:

- se conserva la razón necesaria para diagnóstico;
- el estado no se presenta como entregado;
- la política de retry respeta dedupe e identidad lógica;
- un retry no crea una nueva etapa;
- tokens inválidos pueden desactivarse mediante el lifecycle propietario;
- la falla de notificación no altera el turno ni la asistencia.

Esta regla corrige semánticamente el riesgo observado sin implementar aquí su solución física.

---

#### 21. Permiso del sistema y token push

El permiso de notificaciones es auxiliar.

Si está denegado, indeterminado o el token no está disponible:

- ANIMA sigue permitiendo consultar turnos;
- check-in y check-out continúan por sus contratos normales;
- no se representa el recordatorio como entregado;
- la aplicación puede explicar cómo habilitar notificaciones sin convertirlo en requisito laboral;
- una negativa del sistema operativo no se interpreta como incumplimiento del trabajador.

La reparación o registro de token nunca concede autoridad de asistencia.

---

#### 22. Experiencia dentro de la aplicación

Cuando ANIMA está abierta, Home y Turnos pueden proyectar el mismo estado oportuno sin depender de que el push aparezca visualmente.

La experiencia in-app debe priorizar estado actual:

- próximo turno cuando aún no inicia;
- turno actual y acción de entrada cuando corresponda;
- asistencia activa y cierre cuando corresponda;
- pendiente, incertidumbre o conflicto cuando corresponda;
- estado terminado cuando la salida ya está confirmada.

No se requiere crear una bandeja paralela de recordatorios para cumplir esta tarea.

---

#### 23. Navegación desde un recordatorio

Responder a un recordatorio de turno lleva a la superficie personal de Turnos permitida por el contrato vigente.

Desde allí el trabajador puede comprender:

- qué turno originó el aviso;
- si el turno sigue vigente;
- su horario y contexto publicados;
- su estado actual de asistencia;
- qué acción corresponde, si existe una acción segura.

La notificación no ejecuta mutaciones al tocarla.

Si una acción de asistencia requiere Home o un flujo propietario, la navegación posterior usa el contrato normal de ANIMA y vuelve a validar condiciones.

---

#### 24. Múltiples dispositivos

Los tokens representan canales, no identidades laborales independientes.

Reglas:

1. un trabajador puede tener varios tokens activos;
2. todos pueden recibir una copia cuando la política lo permita;
3. la unidad lógica se registra una sola vez;
4. una copia abierta en un dispositivo no invalida automáticamente otra copia ya entregada;
5. cualquier dispositivo que abra el aviso consulta el estado actual;
6. una acción realizada desde otro dispositivo suprime cualquier nueva emisión que ya no corresponda.

---

#### 25. Conectividad y apertura offline

Una notificación previamente entregada puede abrir ANIMA sin conectividad.

En ese caso:

- el payload no se convierte en fuente de verdad;
- la aplicación usa únicamente estado durable local identificado como tal;
- no afirma que el turno o la asistencia siguen iguales si no puede demostrar frescura;
- una acción offline de asistencia conserva los contratos de persistencia e idempotencia existentes;
- al recuperar red se reconcilia con servidor antes de presentar como actual una suposición obsoleta.

---

#### 26. Horario, zona temporal y turnos nocturnos

Los recordatorios consumen los instantes de inicio y fin resueltos por el contrato propietario de programación.

No reconstruyen semántica temporal desde el cliente mediante:

- sumar una duración estimada;
- asumir que el fin ocurre el mismo día calendario;
- convertir texto de hora sin zona temporal;
- reutilizar la fecha del dispositivo como autoridad;
- aplicar un offset fijo fuera del contrato vigente.

Turnos nocturnos, cambios de fecha y demás reglas temporales conservan su propietario canónico.

---

#### 27. Contenido y minimización

El contenido de pantalla bloqueada debe ser útil sin exponer datos laborales innecesarios.

Puede incluir, cuando corresponda:

- que el turno está próximo a iniciar o terminar;
- hora relevante;
- sede cuando sea necesaria para orientar al trabajador.

No deberá incluir por defecto:

- UUID;
- códigos internos de turno;
- políticas de autorización;
- coordenadas;
- nombres de otros trabajadores;
- datos salariales;
- información disciplinaria;
- detalles administrativos sensibles;
- diagnóstico técnico.

La cantidad exacta visible puede reducirse según las preferencias de privacidad del dispositivo.

---

#### 28. Lenguaje y tono operativo

Los avisos serán neutrales, accionables y no sancionatorios.

Patrones conceptuales válidos:

- “Tu turno empieza pronto”;
- “Tu turno ya comenzó. Revisa tu estado en ANIMA”;
- “Se acerca el fin de tu turno”;
- “Tu turno sigue abierto. Revisa el cierre en ANIMA”.

La interfaz evitará mensajes que afirmen sin evidencia:

- “Llegaste tarde”;
- “Incumpliste tu turno”;
- “No marcaste” cuando existe una intención pendiente;
- “Tu salida falló” cuando el resultado remoto es incierto;
- “Debes marcar de nuevo” sin haber conciliado la intención previa.

---

#### 29. Accesibilidad

El recordatorio no dependerá únicamente de sonido, vibración, color o iconografía.

La experiencia deberá permitir:

- texto comprensible en la notificación;
- lectura mediante tecnologías de asistencia del sistema;
- navegación posterior a una superficie con jerarquía accesible;
- interpretación sin requerir reconocer códigos técnicos;
- acción segura aunque sonido o háptica estén desactivados.

La ausencia de feedback háptico nunca cambia el estado del recordatorio ni de la asistencia.

---

#### 30. Observabilidad mínima

La implementación futura deberá permitir auditar sin exponer contenido sensible:

- turno de referencia;
- trabajador de referencia en forma segura;
- clase y etapa lógica;
- instante programado;
- instante evaluado;
- motivo de elegibilidad o supresión;
- resultado de dedupe;
- cantidad de canales objetivo;
- estado de intento/proveedor;
- token invalidado cuando corresponda mediante referencia segura;
- versión de política utilizada.

La observabilidad se utiliza para explicar comportamiento técnico, no para crear un sistema disciplinario implícito.

---

#### 31. Matriz de escenarios obligatorios

| ID | Escenario | Resultado esperado |
| --- | --- | --- |
| `UX016-S01` | turno publicado próximo a iniciar, sin entrada | recordatorio previo único |
| `UX016-S02` | entrada confirmada antes de ventana | recordatorio de inicio suprimido |
| `UX016-S03` | inicio pasado, sin entrada ni pendiente | seguimiento de inicio único |
| `UX016-S04` | entrada durable pendiente | seguimiento de inicio suprimido |
| `UX016-S05` | turno cancelado antes de aviso | aviso suprimido |
| `UX016-S06` | turno reprogramado | ventana recalculada sobre versión vigente |
| `UX016-S07` | sesión abierta cerca del fin | recordatorio previo de cierre único |
| `UX016-S08` | salida confirmada antes del fin | recordatorio de cierre suprimido |
| `UX016-S09` | turno sigue abierto después del fin | seguimiento posterior único |
| `UX016-S10` | salida durable pendiente al vencer seguimiento | seguimiento suprimido |
| `UX016-S11` | autocierre ya aplicado | no se envía recordatorio de cierre posterior |
| `UX016-S12` | scheduler se ejecuta dos veces | una unidad lógica, sin duplicación |
| `UX016-S13` | trabajador tiene dos tokens | copias de canal permitidas, una unidad lógica |
| `UX016-S14` | proveedor rechaza el push | no se registra como entrega exitosa |
| `UX016-S15` | notificación llega tarde tras check-in/check-out | se muestra estado vigente, no acción obsoleta |
| `UX016-S16` | notificaciones denegadas | asistencia y consulta siguen disponibles |
| `UX016-S17` | tap sobre recordatorio reconocido | navegación segura a Turnos, sin mutación automática |
| `UX016-S18` | tipo de notificación desconocido | no abre destino arbitrario |
| `UX016-S19` | follow-up legacy de cierre | productor debe converger a la familia canónica permitida, no ampliar allowlist por drift |
| `UX016-S20` | apertura offline de aviso antiguo | estado local identificado como no autoritativo y conciliación posterior |

---

#### 32. Handoff de materialización futura

La materialización física correspondiente deberá resolver, sin reabrir este contrato documental:

1. añadir evaluación de recordatorios de inicio sobre turnos publicados;
2. separar parámetros de inicio y cierre cuando el runtime lo requiera;
3. desacoplar el recordatorio posterior de cierre de la semántica de gracia de autocierre;
4. hacer converger el follow-up de cierre hacia la familia de notificación canónica ya permitida;
5. aplicar supresión por entrada/salida confirmada, intención durable, incertidumbre y conflicto;
6. mantener identidad lógica y dedupe por turno/clase/etapa;
7. persistir estados de entrega honestos;
8. evitar registrar `push_sent` cuando no exista evidencia suficiente del intento aceptado;
9. mantener permiso/token como condición del canal y no de la asistencia;
10. probar navegación tardía, reprogramación, cancelación, múltiples dispositivos y fallos del proveedor.

Este handoff describe el resultado esperado; no autoriza implementación durante ANIMA-UX-016.

---

#### 33. Requisitos de prueba derivados

**NO GENERA REQUISITOS DE PRUEBA.**

Requisitos creados: **0**
Requisitos modificados: **0**
Requisitos diferidos: **0**
Requisitos descartados: **0**
Requisitos obsoletos: **0**

La tarea concreta, para recordatorios de turno, obligaciones ya protegidas por la cobertura vigente de navegación segura, estado de asistencia, deduplicación, reanudación y consistencia de fuente de verdad. La taxonomía TO-BE reutiliza tipos de navegación ya permitidos en lugar de crear una nueva superficie o un destino adicional, por lo que no requiere alterar el registro canónico.

---

#### 34. Cobertura de prueba vigente reutilizada

Se reutiliza sin modificación:

- `TREQ-ANIMA-014`, que restringe las respuestas de notificación de turno a destinos permitidos y bloquea navegación arbitraria;
- `TREQ-ANIMA-015`, que obliga a mantener separados estado real de asistencia, pendientes, sincronización y diagnóstico;
- `TREQ-ANIMA-016`, que protege la separación de la lectura personal de Turnos frente a funciones de gestión;
- `TREQ-ANIMA-003`, para persistencia durable e idempotencia cuando una intención de asistencia existe y todavía no está conciliada;
- la cobertura UX transversal vigente sobre mensajes comprensibles, fuente de verdad, conectividad, reanudación y prevención de efectos duplicados.

Esta enumeración es trazabilidad hacia cobertura existente y no modifica ninguna fila del registro.

---

#### 35. Evidencia de validación

| Clase | Estado | Evidencia |
| --- | --- | --- |
| BUILD | NOT_EXECUTED | No se ejecutó build del repositorio ni de ANIMA durante la preparación documental de esta tarea. |
| LOCAL | PASS | El artefacto se verificó estructuralmente como una sola tarea, con metadata completa, sección de requisitos derivados sin identificadores `TREQ-*`, cinco clases de evidencia, continuidad cerrada y ausencia de instrucciones operativas internas. |
| REMOTA | PASS | Se verificaron en GitHub el estado vigente de `vento-shell`, la continuidad ANIMA-UX-015 → ANIMA-UX-016 → ANIMA-UX-017, la topología `DEFINE_ONCE`, el registro ANIMA vigente, la navegación móvil de notificaciones, el registro de tokens, el runtime actual de turnos, los recordatorios de cierre y el autocierre por salida de geocerca. |
| OPERATIVA | NOT_EXECUTED | No se enviaron notificaciones reales ni se ejecutaron sesiones con trabajadores; entrega, latencia, permisos y comprensión deberán comprobarse durante la materialización y validación operativa propietarias. |
| FÍSICA | NOT_APPLICABLE | ANIMA-UX-016 es `DEFINE_ONCE`; no crea instancia física propia ni autoriza código, Supabase, cron, datos, notificaciones productivas o despliegues. |

---

#### 36. Criterios de aceptación

1. La tarea cubre recordatorios personales de inicio y cierre de turno y no notificaciones editoriales de novedades.
2. La unidad lógica de dedupe combina trabajador, turno, clase y etapa.
3. El recordatorio nunca se trata como check-in o check-out.
4. El recordatorio nunca concede autorización.
5. El payload de una notificación nunca sustituye el estado autoritativo vigente.
6. Solo un turno publicado puede originar recordatorios operativos.
7. Turnos cancelados no originan recordatorios pendientes.
8. Los descansos no originan recordatorios de entrada o salida laboral.
9. El recordatorio previo de inicio tiene baseline de cinco minutos antes del inicio.
10. El recordatorio posterior de inicio tiene baseline de cinco minutos después del inicio.
11. Una entrada confirmada suprime recordatorios de inicio posteriores.
12. Una intención durable de entrada pendiente suprime recordatorios que inducirían repetición.
13. El seguimiento de inicio no declara ausencia, tardanza o incumplimiento.
14. El recordatorio previo de cierre solo se emite para asistencia abierta.
15. El baseline previo de cierre conserva cinco minutos cuando no exista política diferente vigente.
16. Una salida confirmada suprime recordatorios de cierre posteriores.
17. Una intención durable de salida pendiente suprime recordatorios que inducirían repetición.
18. Un resultado remoto incierto no produce un mensaje que invite a marcar otra vez.
19. El seguimiento posterior de cierre no ejecuta autocierre por reloj.
20. El autocierre por salida de geocerca conserva su propietario y significado independiente.
21. La política posterior al cierre debe desacoplarse del concepto de gracia de autocierre.
22. Cada etapa lógica se emite como máximo una vez por turno y trabajador.
23. Múltiples tokens no crean múltiples unidades empresariales de recordatorio.
24. Reintentos del scheduler no duplican la etapa lógica.
25. Reprogramar el turno recalcula recordatorios contra la programación vigente.
26. Cancelar el turno suprime avisos todavía no emitidos.
27. Abrir una notificación antigua obliga a recuperar el estado vigente.
28. Un aviso de inicio abierto después del check-in no ofrece una segunda entrada.
29. Un aviso de cierre abierto después del check-out no ofrece una segunda salida.
30. Los recordatorios de inicio reutilizan una familia de navegación ya permitida.
31. Las etapas de cierre reutilizan `shift_end_reminder` y se distinguen por metadata, sin ampliar el allowlist por el drift legacy.
32. `shift_end_reminder_followup` no se consolida como nueva identidad canónica.
33. Tipos desconocidos no abren destinos arbitrarios.
34. Responder al recordatorio no ejecuta una mutación automática.
35. El permiso de notificaciones no es requisito para trabajar ni marcar asistencia.
36. La ausencia de token no se representa como recordatorio entregado.
37. El sistema distingue supresión, intento, aceptación, rechazo y resultado desconocido cuando exista la evidencia correspondiente.
38. Un fallo del proveedor no puede persistirse como entrega exitosa.
39. Aceptación del proveedor no se presenta como lectura humana.
40. Tokens inválidos pueden desactivarse sin modificar el estado laboral.
41. La aplicación abierta puede proyectar el mismo estado sin crear una bandeja paralela obligatoria.
42. Una apertura offline no convierte datos del payload en fuente de verdad.
43. Turnos nocturnos consumen instantes resueltos por el propietario temporal y no se recalculan ingenuamente en cliente.
44. El contenido de lock screen minimiza información laboral.
45. Los mensajes son neutrales y no sancionatorios.
46. El recordatorio es comprensible sin depender exclusivamente de sonido, háptica, color o icono.
47. La observabilidad conserva motivo de elegibilidad, supresión y estado técnico sin crear un sistema disciplinario implícito.
48. La matriz obligatoria cubre inicio, cierre, dedupe, reprogramación, cancelación, proveedor, permisos, navegación, múltiples dispositivos y offline.
49. La tarea no modifica código de `vento-anima`.
50. La tarea no modifica código, Edge Functions, cron o Supabase de `vento-shell`.
51. La tarea no crea migraciones, tablas, columnas, RLS, RPC ni secretos.
52. La tarea no envía notificaciones reales.
53. La tarea no habilita autocierre programado por tiempo.
54. La sección de requisitos derivados declara cero requisitos y no contiene identificadores `TREQ-*`.
55. La cobertura reutilizada se documenta fuera de la sección de requisitos derivados.
56. El registro 04A permanece sin cambios.
57. BUILD permanece NOT_EXECUTED hasta una ejecución real de build.
58. OPERATIVA permanece NOT_EXECUTED hasta una prueba real de notificaciones y comprensión.
59. FÍSICA permanece NOT_APPLICABLE por topología `DEFINE_ONCE`.
60. La continuidad termina exactamente en ANIMA-UX-017.
61. Ninguna decisión de esta tarea autoriza materialización física automática.

---

#### 37. Límites

ANIMA-UX-016 no:

- implementa recordatorios;
- modifica `vento-anima`;
- modifica Edge Functions;
- modifica Supabase;
- crea migraciones;
- crea tablas o columnas;
- cambia RLS, RPC, grants o secretos;
- programa cron;
- registra tokens productivos;
- envía push reales;
- modifica la programación de trabajadores;
- crea, cancela o reprograma turnos;
- ejecuta check-in o check-out;
- habilita autocierre programado;
- redefine el autocierre por salida de geocerca;
- declara tardanza, ausencia o incumplimiento;
- crea una bandeja obligatoria de notificaciones;
- diseña notificaciones de novedades internas;
- modifica el ciclo editorial reservado a ANIMA-UX-017;
- modifica el registro canónico de requisitos de prueba;
- crea una instancia física propia.

---

#### 38. Continuidad

**ÚLTIMA TAREA APROBADA**
`ANIMA-UX-015 — Probar check-in y check-out con trabajadores reales`

**TAREA ACTUAL APROBADA**
`ANIMA-UX-016 — Auditar y completar recordatorios operativos de inicio y cierre de turno`

**SIGUIENTE TAREA RESERVADA**
`ANIMA-UX-017 — Diseñar ciclo completo de novedades internas: audiencia, publicación, edición, archivo, notificación y visibilidad`


### ✅ ANIMA-UX-017 — Diseñar ciclo completo de novedades internas: audiencia, publicación, edición, archivo, notificación y visibilidad

**Estado:** APROBADA
**Tarea anterior:** ANIMA-UX-016 — Auditar y completar recordatorios operativos de inicio y cierre de turno
**Tarea siguiente:** VISO-AUTH-001 — Crear catálogo administrativo de roles base
**Tipo de tarea:** documental; diseño UX TO-BE del ciclo editorial completo de novedades internas de ANIMA, separando lectura personal de administración y definiendo audiencia persistente, publicación, edición, reenvío, archivo, vigencia, notificación, visibilidad, auditoría y fallback sin materialización física
**Bloque:** F_ANIMA — EXPERIENCIA DEL TRABAJADOR Y ADMINISTRACION
**Repositorio propietario:** vento-group-sas/vento-shell
**Archivo propietario:** docs/plan-canonico/modular/bloques/F_ANIMA/02_EXPERIENCIA_DEL_TRABAJADOR_Y_ADMINISTRACION.md
**Estado físico resultante:** ESPECIFICADO_NO_MATERIALIZADO
**Cambios físicos autorizados:** ninguno durante esta tarea
**Requisitos de prueba creados o modificados:** 0

---

#### 1. Propósito

Diseñar el ciclo TO-BE completo de las novedades internas de ANIMA para que una comunicación laboral tenga una identidad persistente, una audiencia de lectura inequívoca, un estado editorial comprensible y una relación explícita con las notificaciones que se envían para anunciarla.

El diseño debe cerrar de extremo a extremo las decisiones que el estado AS-IS deja mezcladas o incompletas:

1. quién puede leer una novedad;
2. quién puede administrarla;
3. cómo se define y persiste su audiencia;
4. cuándo una novedad existe como borrador y cuándo queda publicada;
5. cómo se modifica sin perder historia;
6. cómo se reenvía una notificación sin cambiar silenciosamente la visibilidad;
7. cómo se archiva sin borrar la evidencia editorial;
8. cómo se limita su vigencia;
9. cómo se relacionan audiencia de lectura y audiencia de notificación;
10. qué ocurre si el canal push falla o no está disponible;
11. cómo se comporta la pantalla en modo fallback o solo lectura;
12. qué evidencia debe quedar disponible para auditoría y soporte.

La tarea define el contrato UX y funcional. No implementa tablas, migraciones, Edge Functions, RLS, RPC, rutas, componentes, cron, notificaciones productivas ni despliegues.

---

#### 2. Handoff recibido y decisiones preservadas

Esta tarea consume sin reabrir las decisiones ya aprobadas de ANIMA y de la auditoría E1.

De `ANIMA-UX-003` recibe la separación obligatoria entre:

```text
TRABAJADOR
→ leer novedades aplicables

ADMINISTRACIÓN ANIMA
→ crear, editar, definir audiencia, publicar, archivar y notificar
```

De `ANIMA-UX-016` recibe la distinción entre notificación y fuente de verdad:

```text
NOTIFICACIÓN
≠
HECHO EMPRESARIAL AUTORITATIVO
```

De la auditoría de código recibe cuatro brechas ya propietarias de este cierre:

- la audiencia elegida al crear una novedad se usa para una notificación puntual, pero no queda demostrada como audiencia persistente de lectura;
- la audiencia no se recupera ni se modifica de forma explícita al editar;
- la eliminación observada es física y no demuestra archivo ni historial editorial;
- el modo fallback permite lectura local, pero conserva una experiencia de administración que no puede completar sus mutaciones de forma coherente.

La tarea no crea una fuente de verdad paralela ni cambia los propietarios canónicos de autorización, identidad, contexto o notificaciones.

---

#### 3. Principio rector

La novedad es primero un objeto editorial persistente y después, opcionalmente, el origen de una notificación.

```text
NOVEDAD PERSISTIDA
+
REVISIÓN EDITORIAL
+
AUDIENCIA DE LECTURA PERSISTIDA
+
ESTADO DE PUBLICACIÓN
+
VIGENCIA
=
VISIBILIDAD

VISIBILIDAD VÁLIDA
+
DECISIÓN EXPLÍCITA DE NOTIFICAR
+
CANAL DISPONIBLE
=
INTENTO DE NOTIFICACIÓN
```

Por tanto:

```text
AUDIENCIA DE NOTIFICACIÓN
NO DEFINE POR SÍ SOLA
AUDIENCIA DE LECTURA
```

Y también:

```text
PUSH ENVIADO
NO CONVIERTE
UNA NOVEDAD EN PUBLICADA
```

La publicación debe quedar persistida y ser legible por la audiencia autorizada aunque el proveedor de notificaciones falle.

---

#### 4. Dos experiencias separadas

El ciclo queda dividido en dos experiencias funcionales con datos compartidos, pero intenciones distintas.

| Experiencia | Actor | Intención principal | Acciones ordinarias |
| --- | --- | --- | --- |
| `LECTOR_ANIMA` | trabajador autenticado | consultar comunicaciones vigentes que realmente le aplican | listar, abrir, leer, refrescar |
| `EDITOR_ANIMA` | actor con capacidad administrativa efectiva | gobernar el ciclo editorial | crear borrador, definir audiencia, publicar, editar, reenviar, archivar, consultar historia |

La experiencia del trabajador no muestra controles editoriales por tener un rol textual elevado.

La experiencia administrativa no adquiere autoridad por estar dentro de ANIMA. Cada acción vuelve a resolver capacidad, alcance y condiciones de servidor.

La materialización física podrá usar una superficie administrativa separada, un modo administrativo inequívoco o un handoff compatible con `ANIMA-UX-003`, pero nunca una única pantalla de lectura con botones administrativos mezclados como contrato final.

---

#### 5. Estado AS-IS observado

La implementación vigente demuestra un ciclo parcial:

1. `/announcements` carga novedades remotas activas o usa una lista local de fallback;
2. el cliente considera administradores a `propietario`, `gerente_general` y `gerente` mediante strings locales;
3. crear inserta inmediatamente una fila activa y asigna el instante actual como publicación;
4. después de insertar, el cliente invoca `announcement-notify`;
5. durante creación pueden seleccionarse sedes y roles;
6. esos filtros se envían al notificador, pero no se persisten como parte de la novedad observada;
7. editar modifica título, cuerpo y etiqueta, sin recuperar ni editar audiencia;
8. editar no define reenvío;
9. eliminar ejecuta borrado físico de la fila;
10. no se observa un estado de borrador, archivo, vigencia o historia de revisiones en la experiencia;
11. el fallback local conserva lectura, pero crear o editar se rechaza después de abrir la interacción;
12. el flujo de eliminación no aplica la misma guarda de fallback;
13. la función de notificación resuelve destinatarios por sedes y roles y envía a tokens activos;
14. el tipo de notificación `announcement` emitido por el productor no tiene un destino de respuesta registrado en la navegación móvil observada.

Estos hallazgos describen el AS-IS. No se convierten automáticamente en contrato TO-BE.

---

#### 6. Identidad estable de la novedad

Cada novedad conserva una identidad empresarial estable durante todo su ciclo.

Conceptualmente:

```text
ANNOUNCEMENT_ID
→ identidad de la comunicación

REVISION
→ versión editorial de contenido, audiencia, vigencia y metadata publicable

EVENTO EDITORIAL
→ hecho que explica creación, publicación, edición, reenvío o archivo
```

Editar una novedad publicada no debe crear otra identidad de comunicación únicamente para conservar historial.

La identidad estable permite correlacionar:

- lectura;
- revisiones;
- audiencia vigente;
- notificaciones;
- archivo;
- soporte;
- auditoría.

No se exponen identificadores internos al trabajador cuando no aportan valor de uso.

---

#### 7. Estados editoriales canónicos

El ciclo mínimo utiliza tres estados editoriales persistentes:

| Estado | Significado | Visible al trabajador | Notificable |
| --- | --- | --- | --- |
| `BORRADOR` | contenido todavía no publicado | NO | NO |
| `PUBLICADA` | revisión vigente publicada y dentro de sus condiciones de visibilidad | SÍ, si la audiencia aplica | SÍ, mediante acción explícita y segura |
| `ARCHIVADA` | publicación retirada del feed activo sin destruir su historia | NO | NO |

La condición `VENCIDA` es un estado de visibilidad derivado de una publicación cuya vigencia terminó. No exige convertir el historial en otra identidad ni borrar la publicación.

Esta tarea no introduce publicación programada futura como requisito. La vigencia comienza al publicar y puede tener un fin opcional.

---

#### 8. Transiciones editoriales

Las transiciones quedan:

```text
CREAR
→ BORRADOR

BORRADOR
→ EDITAR BORRADOR
→ PUBLICAR
→ ARCHIVAR / RETIRAR BORRADOR SEGÚN POLÍTICA DE CONSERVACIÓN

PUBLICADA
→ EDITAR COMO NUEVA REVISIÓN
→ REENVIAR NOTIFICACIÓN
→ ARCHIVAR
→ VENCER POR FIN DE VIGENCIA

ARCHIVADA
→ CONSULTAR HISTORIA
→ REPUBLICAR SOLO MEDIANTE UNA NUEVA REVISIÓN Y NUEVA DECISIÓN EXPLÍCITA
```

No existe una transición ordinaria:

```text
PUBLICADA
→ DELETE FÍSICO
```

El borrado físico, si alguna obligación futura lo permite, pertenece al lifecycle propietario de información y retención, no al control ordinario de Novedades.

---

#### 9. Separación entre guardar y publicar

Guardar contenido no equivale a publicar.

La experiencia administrativa debe permitir preparar una comunicación sin exponerla inmediatamente.

```text
GUARDAR BORRADOR
→ persiste contenido de trabajo
→ no crea visibilidad
→ no dispara notificación

PUBLICAR
→ valida contenido + audiencia + vigencia + autorización
→ persiste la revisión publicable
→ activa visibilidad
→ opcionalmente inicia notificación
```

Esta separación elimina el acoplamiento AS-IS en el que crear una fila activa y notificar ocurren como una sola intención visible.

---

#### 10. Modelo de audiencia de lectura

Toda novedad publicada debe tener una audiencia de lectura persistida y comprensible.

La audiencia puede ser:

```text
GLOBAL
```

o:

```text
SEGMENTADA
```

`GLOBAL` significa el universo laboral elegible dentro de la organización y contexto autorizados por los contratos propietarios.

`SEGMENTADA` utiliza únicamente dimensiones de identidad y contexto que el actor administrador esté autorizado a usar y que el servidor pueda resolver de forma confiable.

La ausencia de filtros no se interpreta silenciosamente de dos maneras distintas. La interfaz debe indicar expresamente cuándo la decisión es `Todos los trabajadores elegibles`.

---

#### 11. Dimensiones de segmentación

El contrato admite conceptualmente estas dimensiones cuando exista una fuente canónica y una autorización suficiente:

- sede;
- rol o función laboral elegible;
- trabajador específico.

La materialización no está obligada a exponer las tres desde la primera versión si alguna dimensión carece todavía de selector autorizado y confiable.

Regla de interfaz:

```text
CONTROL VISIBLE
→ dimensión realmente disponible

CONTROL NO IMPLEMENTADO
→ no se nombra como si existiera
```

Por tanto, el texto observado `Seleccionar sede o trabajador` no es válido si la interfaz materializada solo ofrece sede y rol.

---

#### 12. Semántica de combinación de filtros

La audiencia segmentada debe tener semántica determinista y visible.

Regla inicial:

- varios valores dentro de la misma dimensión se combinan como alternativas válidas;
- dimensiones diferentes se combinan como condiciones simultáneas;
- una dimensión vacía no restringe por esa dimensión;
- todas las dimensiones vacías equivalen únicamente a `GLOBAL` cuando el administrador lo haya confirmado de forma explícita.

Ejemplo conceptual:

```text
SEDES = [Centro, Satélite A]
ROLES = [Barista, Cajero]

AUDIENCIA
=
(trabaja en Centro O Satélite A)
Y
(es Barista O Cajero)
```

La interfaz debe mostrar un resumen humano antes de publicar y no obligar al administrador a inferir operadores booleanos ocultos.

---

#### 13. Audiencia y territorio del administrador

Definir audiencia es una acción administrativa y no puede ampliar el territorio del actor.

Antes de ofrecer opciones o publicar se debe resolver:

1. actor efectivo;
2. capacidad administrativa aplicable;
3. alcance territorial y laboral permitido;
4. opciones de sede, rol o trabajador que realmente pueda administrar;
5. intersección entre la audiencia solicitada y el universo autorizable.

Un selector no debe cargar globalmente sedes, roles o trabajadores para luego ocultarlos visualmente.

Un valor fuera de alcance debe ser rechazado por servidor aunque haya sido manipulado desde el cliente.

---

#### 14. Persistencia de audiencia

La regla de audiencia que produjo una publicación forma parte de la revisión editorial.

Debe conservarse de forma suficiente para responder posteriormente:

- qué alcance se publicó;
- qué filtros estaban vigentes;
- quién los definió;
- cuándo se publicaron;
- qué revisión los contenía;
- si fueron modificados después;
- qué audiencia corresponde a la revisión actualmente visible.

No es suficiente conservar únicamente una lista efímera en memoria del formulario ni el conjunto de tokens que recibió un push.

---

#### 15. Evaluación de visibilidad al leer

La lectura de la novedad se decide contra la publicación vigente, no contra el hecho de haber recibido una notificación.

Un trabajador puede leer una novedad cuando simultáneamente:

1. la novedad está `PUBLICADA`;
2. su vigencia actual la mantiene visible;
3. no está archivada;
4. la identidad laboral del actor coincide con la audiencia persistida;
5. la autorización y el alcance de lectura continúan siendo válidos;
6. la fuente de datos puede demostrar ese resultado.

La restricción debe aplicarse en la frontera propietaria antes de entregar contenido que el actor no deba conocer.

No es suficiente descargar todas las novedades y ocultarlas en el cliente.

---

#### 16. Audiencia dinámica y evidencia histórica

La audiencia persistida representa una regla de elegibilidad, no una afirmación eterna de pertenencia de cada trabajador.

Al leer se utiliza el contexto laboral vigente conforme al contrato propietario.

Por tanto, un cambio posterior de sede, rol, vínculo o estado puede cambiar la elegibilidad para una novedad todavía vigente.

A la vez, la auditoría debe conservar:

- la regla de audiencia de cada revisión;
- el contexto necesario para explicar cada publicación;
- el conjunto o resumen resoluble de destinatarios de cada intento de notificación cuando corresponda.

La historia de notificación no sustituye la regla de visibilidad actual.

---

#### 17. Audiencia de notificación

La audiencia de notificación es una proyección de la audiencia de lectura, no un segundo universo independiente.

Regla:

```text
DESTINATARIOS DE PUSH
⊆
TRABAJADORES ELEGIBLES PARA LEER LA REVISIÓN PUBLICADA
```

La ausencia de permiso del sistema operativo, token activo o canal disponible puede reducir la audiencia de notificación sin reducir la audiencia de lectura.

No se permite notificar deliberadamente a una persona que no pueda abrir la comunicación por su audiencia vigente.

La decisión de no enviar push tampoco oculta la novedad dentro de ANIMA.

---

#### 18. Publicación global

La publicación global debe ser una decisión explícita.

Antes de confirmar, la experiencia administrativa muestra de forma inequívoca:

```text
AUDIENCIA
Todos los trabajadores elegibles dentro de tu alcance autorizado
```

El servidor vuelve a validar que el actor puede publicar con ese alcance.

Un formulario sin filtros no se convierte automáticamente en publicación global si el actor no confirmó esa intención o no posee el alcance necesario.

---

#### 19. Publicación segmentada

Antes de publicar una audiencia segmentada, la experiencia debe mostrar:

- dimensiones usadas;
- valores seleccionados en lenguaje humano;
- resumen de combinación;
- resultado resoluble o advertencia si la audiencia actual no puede determinarse;
- vigencia;
- decisión de notificar o no notificar.

Una audiencia vacía o no resoluble no se transforma automáticamente en `GLOBAL`.

Si el sistema no puede demostrar a quién aplica una publicación segmentada, la publicación queda bloqueada o requiere una resolución propietaria explícita; nunca se amplía por fallback.

---

#### 20. Orden de publicación y notificación

La publicación debe quedar persistida antes de intentar el push.

Orden conceptual:

```text
VALIDAR AUTORIDAD
→ VALIDAR REVISIÓN
→ VALIDAR AUDIENCIA
→ VALIDAR VIGENCIA
→ PERSISTIR PUBLICACIÓN Y AUDIENCIA
→ CONFIRMAR PUBLICACIÓN
→ RESOLVER DESTINATARIOS DE NOTIFICACIÓN
→ INTENTAR PUSH
→ REGISTRAR RESULTADO DEL CANAL
```

El canal de notificación es un efecto posterior y recuperable.

No es válido:

```text
ENVIAR PUSH
→ FALLAR AL PERSISTIR AUDIENCIA
→ DEJAR AL RECEPTOR SIN CONTENIDO LEGIBLE
```

---

#### 21. Fallo parcial al notificar

Una publicación confirmada no debe desaparecer porque el push falle después.

Si la persistencia editorial fue confirmada y el proveedor de notificaciones falla:

```text
PUBLICACIÓN = CONFIRMADA
NOTIFICACIÓN = FALLIDA / PARCIAL / DESCONOCIDA
```

La interfaz administrativa debe distinguir esos estados.

La recuperación puede permitir reintento o reenvío según la política, siempre sobre la misma publicación y con trazabilidad suficiente.

Nunca se presenta `publicación fallida` si lo único que falló fue el canal push.

---

#### 22. Edición de borrador

Mientras una novedad permanece en `BORRADOR`, un actor autorizado puede modificar:

- título;
- cuerpo;
- etiqueta;
- audiencia prevista;
- vigencia prevista.

Guardar cambios no publica ni notifica.

La interfaz diferencia claramente `Guardar borrador` de `Publicar`.

Los borradores no aparecen en el feed del trabajador ni pueden ser inferidos mediante una consulta ordinaria de lectura.

---

#### 23. Edición de una publicación

Editar una novedad publicada crea una nueva revisión editorial en lugar de sobrescribir silenciosamente la historia.

La nueva revisión debe conservar trazabilidad de:

- contenido anterior y vigente en la medida necesaria;
- audiencia anterior y vigente;
- vigencia anterior y vigente;
- actor;
- instante;
- motivo cuando la política lo exija.

Guardar una revisión de una publicación no dispara automáticamente un reenvío.

Si la audiencia cambia, la nueva regla de visibilidad comienza a gobernar la lectura cuando la revisión quede confirmada.

Una notificación ya mostrada por un sistema operativo no puede retirarse retroactivamente; al abrir ANIMA se aplica la visibilidad vigente.

---

#### 24. Reenvío

`Reenviar notificación` es una intención independiente de editar y publicar.

Solo es elegible cuando:

- existe una publicación vigente;
- el actor está autorizado;
- la audiencia de lectura actual es resoluble;
- no existe una condición de archivo o vencimiento que haga engañoso el aviso.

El reenvío:

1. no cambia contenido;
2. no cambia audiencia de lectura;
3. no reactiva una publicación archivada o vencida;
4. vuelve a resolver los destinatarios actualmente elegibles;
5. registra actor, instante, revisión y resultado del canal;
6. evita que un doble toque genere dos campañas lógicas equivalentes.

Cuando se requiera modificar contenido o audiencia, primero se confirma la nueva revisión y después se decide si corresponde notificarla.

---

#### 25. Archivo

Archivar es la acción ordinaria para retirar una novedad publicada del feed activo.

```text
ARCHIVAR
→ retira visibilidad ordinaria
→ conserva identidad
→ conserva revisiones
→ conserva audiencia histórica
→ conserva eventos de notificación
→ conserva auditoría
```

El archivo no intenta eliminar notificaciones ya entregadas en dispositivos.

Al abrir una referencia antigua hacia una novedad archivada, ANIMA no debe exponer su cuerpo a un actor que ya no tenga derecho a verla.

La razón de archivo debe conservarse cuando sea material para explicar el retiro.

---

#### 26. Vigencia

Una publicación puede tener un final de vigencia opcional.

Mientras la vigencia esté activa, la lectura continúa sometida a audiencia y autorización.

Cuando termina:

- la novedad deja de aparecer en el feed activo;
- no se emiten nuevos reenvíos ordinarios;
- la historia permanece disponible para administración autorizada;
- no se borra el objeto ni sus revisiones;
- un push antiguo no restaura visibilidad.

Modificar la vigencia de una publicación es un cambio editorial auditable.

Esta tarea no define publicación programada futura ni cronograma editorial avanzado.

---

#### 27. Etiquetas editoriales

Las etiquetas observadas `IMPORTANTE`, `INFO` y `ALERTA` pueden conservarse como clasificación visual mientras sigan siendo útiles.

No conceden por sí mismas:

- prioridad de autorización;
- bypass de audiencia;
- entrega garantizada;
- obligación disciplinaria;
- permiso para usar datos adicionales;
- mayor persistencia que la definida por el ciclo editorial.

Una etiqueta orienta presentación. No sustituye estado, audiencia ni vigencia.

---

#### 28. Historial editorial

La administración debe poder reconstruir el ciclo de una novedad sin depender de logs técnicos crudos.

El historial conceptual incluye, cuando ocurra:

- creación;
- cambios de borrador relevantes;
- publicación;
- revisión de contenido;
- cambio de audiencia;
- cambio de vigencia;
- intento inicial de notificación;
- reenvíos;
- archivo;
- republicación mediante nueva revisión.

Cada evento conserva al menos actor, instante, acción y referencia a la revisión afectada.

La auditoría técnica puede conservar más detalle, pero la experiencia administrativa no expone secretos, tokens, SQL ni payloads internos.

---

#### 29. Experiencia del trabajador

La superficie personal de Novedades prioriza lectura y contexto.

Cada elemento visible presenta únicamente información útil para el trabajador, por ejemplo:

- título;
- contenido;
- etiqueta;
- fecha de publicación o actualización pertinente;
- estado de vigencia cuando sea necesario para comprender la comunicación.

No muestra:

- reglas internas de audiencia;
- listados de otros destinatarios;
- tokens;
- conteos administrativos sensibles;
- botones de publicar, editar, archivar o reenviar.

Un trabajador con rol administrativo sigue viendo el carril personal como lector cuando entra a la experiencia del trabajador.

---

#### 30. Experiencia administrativa

La superficie administrativa organiza el trabajo por estado y decisión.

Como mínimo debe permitir comprender:

- borradores;
- publicaciones vigentes;
- publicaciones vencidas o archivadas;
- audiencia de cada revisión vigente;
- vigencia;
- último cambio;
- estado resumido de notificación cuando exista evidencia;
- acciones realmente permitidas para el actor.

La acción principal depende del estado:

```text
BORRADOR
→ Publicar

PUBLICADA
→ Editar / Reenviar / Archivar según capacidad

ARCHIVADA O VENCIDA
→ Consultar historia / preparar nueva revisión cuando corresponda
```

No se usa un botón genérico `Eliminar` como acción primaria sobre una publicación histórica.

---

#### 31. Modo fallback o solo lectura

El fallback local no se presenta como una fuente equivalente a las novedades vigentes de la organización.

Cuando la fuente principal no está disponible y la aplicación usa contenido local:

```text
MODO LOCAL / CONTENIDO DE RESPALDO
→ lectura explícita
→ sin mutaciones
→ sin publicación
→ sin edición
→ sin archivo
→ sin audiencia
→ sin reenvío
```

Los controles editoriales deben ocultarse o quedar inequívocamente no accionables antes de que el usuario complete formularios.

La restauración de la fuente remota vuelve a resolver autoridad y datos; no mezcla silenciosamente borradores locales con publicaciones reales.

---

#### 32. Estados de error y degradación

La experiencia distingue al menos:

| Estado | Significado | Tratamiento |
| --- | --- | --- |
| fuente no disponible | no puede verificarse el ciclo remoto | mostrar indisponibilidad o fallback explícito |
| sin novedades visibles | la consulta autorizada no devuelve publicaciones aplicables | estado vacío real |
| sin acceso administrativo | el actor no puede gestionar novedades | mantener experiencia personal o denegar entrada administrativa |
| audiencia no resoluble | no puede determinarse el alcance solicitado | bloquear publicación, no ampliar a global |
| guardado fallido | la revisión no quedó persistida | conservar datos editados y permitir recuperación segura |
| publicación confirmada / push fallido | la novedad sí quedó visible, pero el canal falló | mostrar estados separados y permitir recuperación |
| resultado de push desconocido | no existe evidencia suficiente del proveedor | no declarar entrega |
| publicación archivada o vencida | ya no pertenece al feed activo | mostrar historia solo a administración autorizada |

Un fallo técnico nunca se transforma en `No hay novedades` si la fuente no pudo determinar el conjunto.

---

#### 33. Notificación y contenido de pantalla bloqueada

La notificación debe ser útil sin revelar más información laboral de la necesaria.

Como regla base puede incluir:

- existencia de una nueva novedad;
- título o resumen mínimo cuando la clasificación permita exponerlo;
- referencia opaca suficiente para correlacionar la comunicación.

No debe incluir por defecto:

- audiencia completa;
- nombres de otros trabajadores;
- reglas de permiso;
- datos sensibles innecesarios;
- contenido que no deba aparecer en pantalla bloqueada.

La clasificación de la novedad puede exigir una notificación más genérica que el contenido disponible dentro de ANIMA.

---

#### 34. Estados de notificación reutilizados

Esta tarea reutiliza la semántica de canal ya definida para recordatorios operativos:

- no enviado o suprimido;
- intento realizado;
- aceptado por el proveedor cuando exista evidencia;
- rechazado;
- resultado desconocido;
- duplicado omitido.

Aceptar un mensaje en el proveedor no significa que el trabajador lo haya leído.

La tarea no introduce recibos de lectura obligatorios ni confirmación disciplinaria de recepción.

La visibilidad dentro de ANIMA existe independientemente de que el trabajador tenga permiso de notificaciones o un token activo.

---

#### 35. Respuesta a una notificación

El payload de una notificación es una referencia de navegación o correlación, no una credencial de lectura.

Si la materialización permite abrir una novedad desde una notificación, antes de mostrar su contenido debe volver a resolver:

- sesión;
- actor;
- publicación vigente;
- vigencia;
- audiencia de lectura;
- autorización.

Si la publicación dejó de ser visible, la aplicación muestra un estado seguro y no reproduce el cuerpo desde el payload.

El tipo AS-IS `announcement` actualmente emitido no amplía por sí solo el allowlist de navegación. La incorporación de un destino de respuesta debe pasar por el propietario canónico de navegación y seguridad; esta tarea no modifica ese allowlist ni crea una ruta física.

---

#### 36. Múltiples dispositivos y tokens

Los tokens son canales y no identidades de audiencia.

Un trabajador con varios dispositivos puede recibir más de una copia física del mismo aviso, pero:

- la audiencia empresarial contiene una sola identidad laboral;
- el evento editorial de publicación es único;
- el evento lógico de campaña o reenvío es único;
- cada token puede producir un resultado técnico distinto;
- abrir desde cualquier dispositivo vuelve a aplicar visibilidad actual.

Desactivar un token inválido no cambia la audiencia de lectura ni el estado laboral.

---

#### 37. Privacidad y minimización

La administración de novedades aplica minimización en selección, previsualización, envío y auditoría.

No se debe cargar o exponer población global únicamente para construir un selector cuando el actor posee un alcance menor.

La vista administrativa muestra solo datos suficientes para definir y revisar audiencia.

La auditoría de notificación prioriza identificadores seguros, conteos y estados; los listados nominales completos se muestran únicamente cuando exista una finalidad y autorización explícitas.

La experiencia del trabajador no revela por qué filtros internos fue incluido ni quién más recibió la comunicación salvo que exista una razón empresarial aprobada.

---

#### 38. Accesibilidad y comprensión

El ciclo debe poder operarse sin depender únicamente de color, iconos, posición o notificaciones sonoras.

La experiencia administrativa debe nombrar de forma explícita:

- estado editorial;
- audiencia;
- vigencia;
- acción de publicar;
- acción de archivar;
- acción de reenviar.

La experiencia personal debe diferenciar fecha, etiqueta y contenido con semántica accesible.

Los controles destructivos o de alcance amplio requieren etiquetas inequívocas y targets táctiles adecuados.

---

#### 39. Migración conceptual desde el AS-IS

| Elemento AS-IS | Tratamiento TO-BE |
| --- | --- |
| misma pantalla mezcla lector y editor | separar intención personal y administrativa conforme a ANIMA-UX-003 |
| rol textual decide administración | resolver capacidad efectiva y protección de servidor |
| crear inserta como activa y publicada | crear primero borrador y publicar mediante intención separada |
| selector de sede/rol solo alimenta push | persistir audiencia de lectura como parte de la revisión |
| audiencia no se recupera al editar | cargar y versionar audiencia junto con la revisión |
| filtro vacío significa `enviar a todos` implícitamente | exigir decisión global explícita |
| opciones de sede y rol se cargan ampliamente | entregar únicamente opciones autorizadas y resolubles |
| editar modifica contenido sin reenvío definido | separar nueva revisión de la acción de reenviar |
| eliminación física ordinaria | sustituir por archivo con historia conservada |
| `is_active` usado como proxy amplio | materializar estados editoriales explícitos sin depender de un booleano ambiguo |
| sin vigencia | permitir fin de vigencia opcional y auditable |
| fallback conserva affordances de administración | fallback explícitamente de solo lectura |
| push usa audiencia efímera | derivar notificación de una publicación y audiencia persistidas |
| `sent` agregado como resultado | distinguir publicación de resultados técnicos del proveedor |
| productor emite `announcement` sin respuesta móvil registrada | resolver en el propietario de navegación antes de habilitar apertura dirigida |

La tabla define destino contractual. No ejecuta la migración física.

---

#### 40. Contrato conceptual de datos

Sin imponer nombres de tablas, columnas ni API, la materialización futura deberá poder representar conceptualmente:

| Entidad lógica | Responsabilidad |
| --- | --- |
| Novedad | identidad estable de la comunicación |
| Revisión | snapshot editorial de contenido, etiqueta, audiencia y vigencia |
| Regla de audiencia | criterio persistente aplicado a lectura y usado como base de notificación |
| Evento editorial | creación, publicación, edición, reenvío, archivo y republicación |
| Intento de notificación | resultado técnico por campaña/canal con correlación a revisión |

La forma física podrá reutilizar estructuras existentes o normalizarlas durante el paquete propietario.

Esta tarea no aprueba un esquema SQL específico.

---

#### 41. Autorización y ownership

La UI no inventa permisos nuevos ni usa un string de rol como autoridad final.

Las acciones conceptuales se separan por intención:

| Acción | Requisito de autoridad |
| --- | --- |
| leer | identidad del trabajador + publicación visible para su audiencia |
| crear borrador | capacidad administrativa efectiva |
| definir audiencia | capacidad administrativa + alcance suficiente sobre las dimensiones elegidas |
| publicar | capacidad efectiva de publicación + validación de servidor |
| editar | capacidad efectiva sobre la publicación y su alcance |
| reenviar | capacidad efectiva de notificación sobre una publicación vigente |
| archivar | capacidad efectiva de retiro editorial |
| consultar historia | capacidad administrativa o de auditoría aplicable |

`ANIMA-AUTH-019` continúa gobernando la prohibición de que ANIMA se otorgue autoridad a sí misma.

La materialización de servidor permanece bajo los propietarios de autorización y Supabase correspondientes.

---

#### 42. Concurrencia e idempotencia editorial

El ciclo debe tolerar acciones repetidas y cambios concurrentes sin producir publicaciones ambiguas.

Reglas conceptuales:

1. publicar dos veces la misma revisión por doble toque no crea dos publicaciones lógicas;
2. un reenvío repetido accidentalmente no crea dos campañas lógicas equivalentes;
3. editar una revisión obsoleta no sobrescribe silenciosamente una revisión más reciente;
4. archivar una publicación ya archivada devuelve un resultado estable o no-op seguro;
5. una respuesta perdida exige reconciliación antes de repetir una acción material;
6. la audiencia utilizada por cada publicación queda vinculada a la revisión confirmada;
7. la notificación nunca se usa para reparar una publicación que no pudo persistirse.

Los mecanismos físicos de versión, idempotency key o concurrencia pertenecen al paquete de implementación.

---

#### 43. Métricas y evidencia

La observabilidad del ciclo debe permitir distinguir, sin convertir la comunicación en vigilancia disciplinaria:

- borradores creados;
- publicaciones confirmadas;
- publicaciones archivadas;
- revisiones editoriales;
- campañas o reenvíos iniciados;
- destinatarios elegibles resueltos por campaña;
- tokens intentados;
- aceptación o rechazo del proveedor cuando exista evidencia;
- resultados desconocidos;
- fallos de autorización;
- fallos de persistencia;
- fallos de resolución de audiencia.

No se infiere lectura humana a partir de entrega técnica.

Esta tarea no exige telemetría de lectura individual ni acuse obligatorio.

---

#### 44. Matriz canónica de escenarios

| Escenario | Resultado TO-BE |
| --- | --- |
| trabajador abre Novedades | ve únicamente publicaciones vigentes cuya audiencia le aplica |
| trabajador con rol gerencial entra por carril personal | sigue viendo experiencia de lectura sin controles editoriales mezclados |
| actor sin capacidad abre administración | acceso bloqueado sin exponer borradores, audiencias o historia |
| administrador crea una novedad | obtiene un borrador, no una publicación automática |
| administrador guarda borrador | no se envía push ni aparece al trabajador |
| publicación global autorizada | audiencia global queda explícita y persistida |
| publicación global fuera de alcance | servidor la rechaza; no se degrada a otro alcance |
| publicación segmentada por sede | solo trabajadores actualmente elegibles para esa sede pueden leer |
| publicación segmentada por rol | solo trabajadores actualmente elegibles para ese rol pueden leer |
| sede y rol seleccionados | ambas dimensiones se aplican simultáneamente y la UI lo explica |
| filtro manipulado fuera de alcance | servidor rechaza la publicación o la selección |
| audiencia actual no resoluble | publicación bloqueada; nunca se amplía a todos |
| publicación confirmada y push exitoso | visibilidad y resultado de canal quedan trazados por separado |
| publicación confirmada y push falla | la novedad sigue publicada; el canal queda fallido o desconocido |
| trabajador sin permiso de notificaciones | puede leer la novedad si pertenece a la audiencia |
| trabajador recibe push pero cambia de contexto antes de abrir | la apertura vuelve a evaluar visibilidad actual |
| trabajador ya no pertenece a audiencia | el contenido no se expone por conservar un push antiguo |
| administrador edita contenido publicado | se crea nueva revisión; no se borra la anterior |
| administrador cambia audiencia | la nueva revisión gobierna lectura después de confirmarse |
| edición confirmada | no produce reenvío automático |
| administrador decide reenviar | se usa la revisión vigente y la audiencia actual, con evento separado |
| doble toque en reenviar | no crea dos campañas lógicas equivalentes |
| administrador archiva | sale del feed activo y conserva historia |
| publicación vence | sale del feed activo sin borrarse |
| push antiguo de publicación archivada | no restaura acceso al contenido |
| modo fallback | lectura local explícita y ninguna mutación disponible |
| fuente remota falla sin fallback válido | se muestra indisponibilidad, no un falso vacío |
| dos administradores editan concurrentemente | una revisión obsoleta no sobrescribe silenciosamente la nueva |
| productor emite tipo de notificación sin ruta autorizada | no se habilita navegación arbitraria por inferencia |

---

#### 45. Hallazgos y propietarios de salida

| Hallazgo | Bloquea esta especificación | Propietario de materialización o cierre |
| --- | --- | --- |
| audiencia de lectura no persistida en AS-IS | NO | paquete ANIMA de novedades; contratos de servidor y Supabase ya asignados por backlog |
| audiencia no recuperable al editar | NO | mismo paquete ANIMA de novedades |
| eliminación física sin archivo/historia | NO | mismo paquete ANIMA de novedades + gobierno de información cuando aplique |
| fallback incoherente con mutaciones | NO | paquete ANIMA de novedades y contrato de degradación |
| control administrativo basado en roles locales | NO | ANIMA-AUTH-019 y propietarios de autorización de servidor |
| opciones de audiencia no limitadas por territorio demostrado | NO | autorización/contexto de servidor y paquete ANIMA de novedades |
| `announcement` no tiene respuesta móvil registrada | NO | propietarios de navegación segura y validación de pantalla; no se amplía el allowlist en esta tarea |
| resultado de push no demuestra lectura | NO | integración de notificaciones; esta tarea conserva la distinción |

No se crea una tarea nueva. Cada brecha ya tiene propietario canónico o paquete de implementación asociado.

---

#### 46. Requisitos de prueba derivados

**Resultado:** NO GENERA REQUISITOS DE PRUEBA.

**Requisitos creados:** 0

**Requisitos modificados:** 0

La tarea desarrolla y especifica con mayor detalle comportamientos ya registrados por la auditoría y por el Registro Canónico de Requisitos de Prueba para audiencia persistente, coherencia entre visibilidad y notificación, administración autorizada, archivo/historial y modo fallback. No introduce una regla material fuera de esa cobertura que justifique duplicar requisitos existentes.

---

#### 47. Cobertura de prueba vigente reutilizada

La cobertura ya registrada que se reutiliza sin modificar sus filas incluye:

- `TREQ-ANIMA-001`: distingue audiencia de notificación y visibilidad persistente, exige conservar, editar, auditar y aplicar el modelo de audiencia al leer;
- `TREQ-ANIMA-002`: obliga a que fallback o solo lectura no expongan controles de crear, editar o eliminar que no puedan completarse;
- `TREQ-ANIMA-020`: exige coherencia entre audiencia persistida, audiencia notificada y visibilidad, y bloquea mutaciones no autorizadas;
- `TREQ-ANIMA-014`: conserva la navegación de notificaciones bajo un conjunto de destinos explícitamente autorizado y evita rutas arbitrarias;
- los requisitos transversales vigentes de autorización, error, integración, recuperación y trazabilidad que ya protegen acciones de servidor y estados degradados.

Esta sección documenta trazabilidad reutilizada. No representa creación ni modificación del registro.

---

#### 48. Evidencia de validación

| Clase | Estado | Evidencia |
| --- | --- | --- |
| BUILD | NOT_EXECUTED | La tarea es documental y no se ejecutó build de `vento-shell` ni de `vento-anima` durante su preparación. |
| LOCAL | PASS | El artefacto fue verificado estructuralmente como una sola tarea, con metadata obligatoria, declaración numérica de cero requisitos, sección derivada sin identificadores de requisito, cinco clases de evidencia y continuidad cerrada. |
| REMOTA | PASS | Se contrastaron el protocolo, contrato de entrega, manifest, continuidad, topología, políticas de tarea, archivo propietario, auditorías E1, registro ANIMA vigente, `package.json`, pantalla y hook de Novedades, fallback local, función `announcement-notify` y navegación móvil observada. |
| OPERATIVA | NOT_EXECUTED | No se publicaron novedades reales, no se enviaron push productivos y no se ejecutaron sesiones con trabajadores o administradores durante esta definición documental. |
| FÍSICA | NOT_APPLICABLE | ANIMA-UX-017 está gobernada por `DEFINE_ONCE / NO_PHYSICAL_INSTANCE`; no crea una instancia física propia ni autoriza código, Supabase, datos o despliegues. |

---

#### 49. Criterios de aceptación

1. La experiencia personal de Novedades queda separada de la experiencia administrativa.
2. Una novedad conserva identidad estable durante su ciclo editorial.
3. El contenido publicado se gobierna mediante revisiones y no mediante sobreescritura histórica silenciosa.
4. El ciclo mínimo distingue `BORRADOR`, `PUBLICADA` y `ARCHIVADA`.
5. Una publicación vencida deja de ser visible sin borrar su historia.
6. Guardar borrador no publica ni notifica.
7. Publicar es una intención explícita distinta de guardar.
8. La audiencia de lectura queda persistida como parte de la revisión publicada.
9. La audiencia puede ser global o segmentada de forma explícita.
10. La ausencia de filtros no se interpreta silenciosamente como global.
11. Varias opciones de una misma dimensión se interpretan como alternativas.
12. Dimensiones distintas de audiencia se aplican simultáneamente.
13. La UI explica la combinación de filtros en lenguaje humano.
14. Solo se muestran opciones de audiencia dentro del alcance autorizable del actor.
15. Manipular un filtro en cliente no amplía el alcance de publicación.
16. Una audiencia segmentada no resoluble no se degrada a global.
17. La visibilidad se aplica en la frontera propietaria antes de entregar contenido no autorizado.
18. Recibir un push no concede derecho de lectura.
19. Los destinatarios de push son un subconjunto de la audiencia elegible para leer.
20. No disponer de token o permiso push no elimina visibilidad dentro de ANIMA.
21. La publicación se persiste antes de intentar notificación.
22. Un fallo del push no revierte una publicación ya confirmada.
23. Un fallo de publicación impide usar la notificación como sustituto de persistencia.
24. Editar una publicación crea una nueva revisión auditable.
25. Editar no produce reenvío automático.
26. Reenviar es una acción explícita separada de editar y publicar.
27. Reenviar no cambia audiencia de lectura ni contenido.
28. Un reenvío vuelve a resolver destinatarios elegibles actuales.
29. Dobles toques o reintentos no crean dos campañas lógicas equivalentes.
30. Archivar sustituye la eliminación física como acción ordinaria sobre una publicación.
31. Archivar retira del feed y conserva revisiones, audiencia y evidencia editorial.
32. La vigencia opcional puede retirar una publicación del feed sin borrarla.
33. Las etiquetas visuales no cambian autorización ni audiencia.
34. La historia permite reconstruir creación, publicación, edición, cambio de audiencia, reenvío y archivo.
35. La experiencia del trabajador no muestra controles administrativos mezclados.
36. Un actor administrativo en carril personal sigue siendo lector.
37. El carril administrativo exige capacidad efectiva y protección de servidor.
38. Roles locales no constituyen autoridad final.
39. Fallback es explícitamente de solo lectura.
40. Fallback no presenta acciones editoriales que no pueda completar.
41. Un fallo de fuente se distingue de un conjunto vacío real.
42. El resultado técnico del proveedor se distingue de lectura humana.
43. No se introducen recibos de lectura obligatorios ni vigilancia disciplinaria implícita.
44. El contenido de lock screen aplica minimización.
45. Abrir una notificación vuelve a validar publicación, audiencia y autorización antes de exponer el cuerpo.
46. El tipo AS-IS `announcement` no amplía por sí solo el allowlist de navegación.
47. Múltiples tokens no crean múltiples identidades de audiencia.
48. Un token inválido no modifica visibilidad ni vínculo laboral.
49. La tarea no impone nombres de tablas, columnas, RPC ni endpoints.
50. La tarea no implementa código ni modifica Supabase.
51. La tarea no crea migraciones, RLS, grants, funciones, Edge Functions, cron o secretos.
52. La tarea no envía notificaciones reales.
53. La tarea no crea una ruta móvil nueva.
54. La tarea no modifica el registro canónico de requisitos de prueba.
55. La sección de requisitos derivados declara cero cambios y no contiene identificadores de requisitos.
56. La cobertura reutilizada se documenta fuera de la sección de requisitos derivados.
57. BUILD permanece NOT_EXECUTED hasta una ejecución real de build.
58. OPERATIVA permanece NOT_EXECUTED hasta pruebas reales de publicación, audiencia y notificación.
59. FÍSICA permanece NOT_APPLICABLE por topología `DEFINE_ONCE`.
60. El cierre de esta tarea completa el minibloque ANIMA-UX-001 a ANIMA-UX-017.
61. La continuidad posterior queda reservada a VISO-AUTH-001.
62. Ninguna decisión de esta tarea autoriza materialización física automática.

---

#### 50. Límites

ANIMA-UX-017 no:

- modifica `vento-anima`;
- modifica componentes, rutas o navegación;
- modifica `vento-shell` fuera del documento canónico de esta tarea;
- implementa tablas o esquemas de novedades;
- crea migraciones;
- crea o modifica RLS, RPC, triggers, grants o funciones;
- modifica `announcement-notify`;
- registra o desactiva tokens productivos;
- envía push reales;
- crea publicación programada futura;
- crea recibos obligatorios de lectura;
- crea acuses disciplinarios;
- define sanciones por no leer una comunicación;
- convierte etiquetas editoriales en permisos;
- amplía el allowlist de navegación de notificaciones;
- crea rutas físicas de administración;
- define un esquema SQL definitivo para revisiones, audiencia o eventos;
- modifica el Registro Canónico de Requisitos de Prueba;
- crea una instancia física propia;
- adelanta tareas de VISO.

---

#### 51. Estado de salida documental

El minibloque ANIMA-UX queda cerrado documentalmente con un contrato de experiencia que cubre:

- separación trabajador/administración;
- inicio y contexto de turno;
- check-in y check-out simplificados;
- estados confirmados, pendientes y bloqueados;
- recuperación, offline y reanudación;
- documentos y datos personales;
- administración de equipo autorizada;
- prueba de marcación con trabajadores;
- recordatorios de inicio y cierre;
- ciclo completo de novedades internas.

Para Novedades, el handoff materializable queda definido como:

```text
BORRADOR
→ AUDIENCIA PERSISTENTE
→ PUBLICACIÓN
→ VISIBILIDAD AUTORIZADA
→ NOTIFICACIÓN OPCIONAL Y TRAZABLE
→ EDICIÓN VERSIONADA
→ REENVÍO EXPLÍCITO
→ VIGENCIA
→ ARCHIVO
→ HISTORIA AUDITABLE
```

La implementación posterior debe satisfacer este contrato mediante los paquetes y propietarios ya asignados, sin reinterpretar la audiencia efímera AS-IS como diseño final.

---

#### 52. Continuidad

**ÚLTIMA TAREA APROBADA**
`ANIMA-UX-016 — Auditar y completar recordatorios operativos de inicio y cierre de turno`

**TAREA ACTUAL APROBADA**
`ANIMA-UX-017 — Diseñar ciclo completo de novedades internas: audiencia, publicación, edición, archivo, notificación y visibilidad`

**SIGUIENTE TAREA RESERVADA**
`VISO-AUTH-001 — Crear catálogo administrativo de roles base`
