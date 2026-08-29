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


### [ ] ANIMA-UX-002 — Inventariar pantallas administrativas
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
