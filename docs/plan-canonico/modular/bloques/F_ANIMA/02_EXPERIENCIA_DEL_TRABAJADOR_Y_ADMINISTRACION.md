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
