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
