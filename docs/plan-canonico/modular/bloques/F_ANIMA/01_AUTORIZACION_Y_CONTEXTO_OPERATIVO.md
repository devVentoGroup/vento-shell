### MINI-BLOQUE — AUTORIZACIÓN Y CONTEXTO OPERATIVO

<!-- PLAN-SECTION-META:START -->
Esta sección organiza **autorización y contexto operativo** dentro de **F ANIMA**. Agrupa tareas que producen un resultado funcional común y deben mantenerse juntas para conservar contexto, trazabilidad y orden de ejecución.

**Cobertura canónica:** `ANIMA-AUTH-001` a `ANIMA-AUTH-020` — 20 tareas.

**Resultado esperado:** al cerrar este mini-bloque, su resultado debe quedar definido, verificable y coherente con las secciones anterior y siguiente antes de avanzar.

**Límites funcionales:** comienza con “Confirmar turno publicado antes del check-in” y concluye con “Mantener Supabase como fuente de verdad”.
<!-- PLAN-SECTION-META:END -->

### ✅ ANIMA-AUTH-001 — Confirmar turno publicado antes del check-in

**Estado:** APROBADA
**Tarea anterior:** AUTH-ERR-020 — Compartir mensajes desde vento-shell
**Tarea siguiente:** ANIMA-AUTH-002 — Confirmar sede del turno
**Tipo de tarea:** documental; definición del contrato de precondición de turno publicado para admitir un check-in en ANIMA
**Bloque:** `F_ANIMA — AUTORIZACIÓN Y CONTEXTO OPERATIVO`
**Repositorio propietario:** `vento-group-sas/vento-shell`
**Archivo propietario:** `docs/plan-canonico/modular/bloques/F_ANIMA/01_AUTORIZACION_Y_CONTEXTO_OPERATIVO.md`
**Estado físico resultante:** contrato documental definido; materialización física diferida por unidad de implementación
**Cambios físicos autorizados:** ninguno durante el cierre documental; la materialización futura queda sujeta a la topología `PER_IMPLEMENTATION_UNIT` y al gate `POST_E5_PACKAGE`
**Requisitos de prueba creados o modificados:** 0

---

#### 1. Propósito

Definir de forma única, segura y verificable la precondición que ANIMA debe resolver antes de admitir una marcación de entrada: la solicitud debe pertenecer a un actor efectivo resoluble y debe poder vincularse, en servidor, con exactamente una publicación laboral aplicable.

La tarea no concede permisos, no crea un turno, no selecciona sede, área o rol por conveniencia del cliente y no convierte el check-in en fuente de contexto laboral. Su resultado es un gate previo que entrega un turno publicado resuelto a las tareas posteriores del minibloque.

La regla raíz queda:

```text
SOLICITUD DE CHECK-IN
+
ACTOR EFECTIVO RESUELTO EN SERVIDOR
+
PUBLICACIÓN LABORAL AUTORITATIVA
+
PUBLICACIÓN APLICABLE AL ACTOR
+
VENTANA TEMPORAL APLICABLE
+
RESOLUCIÓN ÚNICA Y CONCLUYENTE
→
CONTINUAR CON ANIMA-AUTH-002
```

La ausencia, ambigüedad, retiro, cancelación, invalidez temporal o indisponibilidad de la fuente nunca puede convertirse en un turno sintético ni en una selección optimista.

---

#### 2. Resultado material

ANIMA adopta un contrato previo al check-in con cuatro resultados funcionales:

| Resultado | Significado | Continuación |
| --- | --- | --- |
| `RESOLVED` | existe exactamente una publicación laboral aplicable y temporalmente utilizable para el actor | entregar la referencia del turno y sus hechos publicados a `ANIMA-AUTH-002` |
| `NO_PUBLISHED_SHIFT` | no existe publicación laboral utilizable | denegar la marcación, conservar la sesión y producir cero efectos de asistencia |
| `AMBIGUOUS_PUBLISHED_SHIFT` | más de una publicación pretende ser aplicable y no existe resolución canónica inequívoca | fallar cerrado; no escoger por orden, cliente, check-in ni último turno |
| `SOURCE_UNAVAILABLE` | la fuente necesaria no puede resolverse de forma concluyente | fallar cerrado y conservar la indisponibilidad como fallo técnico, no como ausencia ordinaria |

Cuando existe una única publicación pero la hora de servidor está fuera de su intervalo autorizado, el resultado funcional es `OUTSIDE_SHIFT_WINDOW`; el check-in no continúa.

Estos estados pertenecen al contrato de ANIMA para esta tarea. No sustituyen el catálogo transversal de razones de autorización ni crean un nuevo catálogo público.

---

#### 3. Fuentes y autoridad

La resolución consume las decisiones canónicas ya aprobadas de `AUTH-MOD-009` y `AUTH-CAT-012`.

La fuente autoritativa debe ser la revisión publicada del turno resuelta en servidor. La solicitud del cliente puede aportar datos de correlación, pero no autoridad para escoger la publicación.

No son fuentes de autoridad para esta decisión:

- un `shift_id` enviado por el cliente;
- la última publicación vista en pantalla;
- el último turno usado por el trabajador;
- un check-in previo o pendiente;
- una sede o área seleccionada en interfaz;
- la sede primaria;
- un perfil operativo predeterminado;
- el rol base;
- una preferencia local;
- caché sin prueba de vigencia;
- una asignación legacy utilizada como sustituto de la publicación;
- la sola existencia de una pertenencia laboral o de una sesión autenticada.

La autenticación prueba identidad de sesión; no prueba que exista una publicación laboral aplicable.

---

#### 4. Resolución del actor y de la publicación

La evaluación debe comenzar por el actor efectivo resuelto server-side.

Para que una publicación sea candidata en esta tarea debe cumplir, como mínimo:

1. pertenecer al actor efectivo;
2. representar trabajo y no una programación no laboral;
3. proceder de una revisión publicada;
4. no estar cancelada, retirada ni sustituida por una revisión incompatible;
5. contener una identidad de turno estable y resoluble;
6. contener un intervalo temporal válido;
7. ser evaluada con el tiempo de servidor;
8. ser la única candidata aplicable una vez ejecutadas las reglas canónicas de resolución.

El cliente no puede completar datos faltantes de la publicación.

El check-in tampoco puede crear una relación laboral que no existía antes de la solicitud.

---

#### 5. Frontera temporal

La publicación y su ventana temporal son conceptos distintos.

```text
PUBLICADO
≠
VIGENTE EN ESTE INSTANTE
```

ANIMA debe evaluar el instante de servidor contra el intervalo canónico del turno. La semántica temporal reutilizada es semiabierta:

```text
inicio <= instante_de_evaluación < fin
```

Consecuencias:

- en el inicio exacto puede continuar;
- en el fin exacto debe denegar;
- un turno futuro no admite check-in;
- un turno ya finalizado no admite check-in;
- el reloj del cliente no participa como autoridad.

La lógica especial de turnos que cruzan medianoche pertenece a `ANIMA-AUTH-013`; esta tarea solo exige que el consumidor preserve timestamps absolutos y no degrade la comparación a una fecha civil o a un día de calendario.

---

#### 6. Matriz de decisión previa al check-in

| Caso | Publicación | Tiempo | Cardinalidad | Decisión |
| --- | --- | --- | --- | --- |
| A | publicada y laboral | dentro de ventana | exactamente una | `RESOLVED` |
| B | ninguna utilizable | no aplica | cero | `NO_PUBLISHED_SHIFT` |
| C | borrador o no publicada | cualquiera | cero utilizable | `NO_PUBLISHED_SHIFT` |
| D | cancelada, retirada o sustituida | cualquiera | cero utilizable | `NO_PUBLISHED_SHIFT` |
| E | publicada y laboral | antes del inicio | exactamente una | `OUTSIDE_SHIFT_WINDOW` |
| F | publicada y laboral | en o después del fin | exactamente una | `OUTSIDE_SHIFT_WINDOW` |
| G | candidatas incompatibles | cualquiera | más de una | `AMBIGUOUS_PUBLISHED_SHIFT` |
| H | fuente requerida no verificable | desconocido | desconocida | `SOURCE_UNAVAILABLE` |
| I | cliente propone un turno distinto al resuelto por servidor | cualquiera | cualquiera | ignorar la propuesta como autoridad y conservar la resolución server-side |
| J | existe intención offline de check-in todavía no confirmada | cualquiera | cualquiera | no tratar la intención local como evidencia de turno ni de asistencia |

No existe una rama `ALLOW` que se base únicamente en que el usuario esté autenticado, pertenezca a una empresa o haya seleccionado una sede.

---

#### 7. Respuesta y efectos

`RESOLVED` no crea por sí mismo un registro de asistencia. Solo autoriza a continuar la cadena de precondiciones del minibloque.

Antes de una creación efectiva de asistencia deben permanecer aplicables las validaciones posteriores de sede, área, rol y compatibilidad territorial propietarias de `ANIMA-AUTH-002` a `ANIMA-AUTH-006`.

Para `NO_PUBLISHED_SHIFT`:

- la marcación queda denegada;
- la sesión autenticada se conserva;
- el acceso base a ANIMA no se revoca;
- se producen cero efectos de asistencia;
- no se crea contexto operativo;
- no se crea turno;
- no se selecciona un turno alternativo;
- no se ejecuta fallback a una sede o área habitual.

La razón pública reutilizada para ausencia de publicación es `AUTH_PUBLISHED_SHIFT_REQUIRED`.

Para `OUTSIDE_SHIFT_WINDOW`, la razón pública reutilizada es `AUTH_OUTSIDE_SHIFT_WINDOW`.

La ambigüedad y la indisponibilidad técnica deben conservar sus causas propias y no presentarse falsamente como ausencia limpia de publicación.

---

#### 8. Separación entre ANIMA y autorización operativa

ANIMA debe permanecer utilizable fuera de un turno para las capacidades base que el catálogo ya clasifica sin prerrequisito laboral.

Por tanto:

```text
SIN TURNO PUBLICADO
→
BLOQUEAR CHECK-IN
≠
BLOQUEAR ANIMA COMPLETO
```

Esta tarea no modifica la modalidad ni los prerrequisitos de permisos definidos en `AUTH-CAT-012`.

Tampoco convierte la posibilidad de registrar asistencia en permiso operativo sobre FOGO, NEXO, ORIGO, PULSO u otra aplicación.

El turno aporta contexto laboral; no aporta grants.

---

#### 9. Handoff a las tareas siguientes

Cuando el resultado es `RESOLVED`, el consumidor posterior recibe únicamente hechos derivados de la misma publicación resuelta:

- identidad estable del turno;
- identidad del actor;
- referencia de publicación o revisión cuando exista en el contrato propietario;
- inicio y fin autorizados;
- hechos territoriales publicados;
- hecho de rol publicado cuando corresponda;
- instante server-side de resolución.

Estos hechos no se consideran todavía validados para todos los propósitos.

`ANIMA-AUTH-002` valida la sede del turno.

`ANIMA-AUTH-003` valida el área del turno.

`ANIMA-AUTH-004` valida el rol operativo del turno.

`ANIMA-AUTH-005` valida que el rol esté permitido en la sede.

`ANIMA-AUTH-006` valida que el rol esté permitido en el área.

`ANIMA-AUTH-007` es quien comienza a materializar el contexto operativo al registrar entrada.

---

#### 10. Concurrencia, frescura e invalidación

La decisión previa al check-in no puede sobrevivir indefinidamente como autoridad.

Antes del efecto de asistencia, el consumidor debe volver a asegurar que la publicación utilizada no fue retirada, cancelada, sustituida o invalidada por un cambio relevante ocurrido después de la primera lectura.

Si cambia la publicación entre resolución y efecto:

```text
DECISIÓN ANTERIOR
→
NO REUTILIZABLE
```

Se exige una solicitud nueva o una revalidación server-side dentro de la misma operación atómica propietaria.

Una respuesta cacheada puede acelerar lectura, pero no sustituye una prueba de vigencia cuando de ella depende crear asistencia.

La actualización de un contexto ya creado por un cambio posterior de turno pertenece a `ANIMA-AUTH-008`.

---

#### 11. Privacidad y experiencia

La denegación previa al check-in debe ser útil sin revelar información laboral no autorizada.

No debe exponer automáticamente:

- horario completo;
- otro turno;
- otras sedes;
- otras áreas;
- otros roles;
- quién publicó o retiró la asignación;
- identificadores internos;
- candidatos alternativos;
- detalles técnicos de la fuente.

La experiencia concreta y el diagnóstico visible al trabajador se desarrollan en `ANIMA-AUTH-016` y `ANIMA-AUTH-017`.

Esta tarea solo congela la semántica: conservar sesión, bloquear la marcación incorrecta y no fabricar contexto.

---

#### 12. Observabilidad mínima

La implementación futura debe permitir distinguir al menos:

- resolución exitosa;
- ausencia de publicación;
- publicación fuera de ventana;
- ambigüedad;
- indisponibilidad técnica;
- invalidación por cambio concurrente.

La evidencia debe poder correlacionarse con la solicitud sin convertir logs o telemetría en fuente de autorización.

La auditoría detallada de creación y cierre del contexto pertenece a `ANIMA-AUTH-018`.

---

#### 13. Topología y materialización física

La definición documental se aprueba una sola vez en este marcador.

La topología vigente de `PHASE-04-F-ANIMA` es `PER_IMPLEMENTATION_UNIT`.

La eventual materialización física de este contrato:

- se realiza por unidad de implementación;
- no se ejecuta en este cierre documental;
- no crea una instancia global implícita;
- requiere el gate temporal `POST_E5_PACKAGE`;
- requiere que el paquete propietario aplicable haya superado su gate E5 correspondiente;
- debe limitarse a los productores y consumidores físicos que realmente implementen el check-in de ANIMA.

Esta tarea no autoriza por sí sola cambios en Supabase, aplicaciones, RLS, RPC, Edge Functions, tipos, clientes ni producción.

---

#### 14. Requisitos de prueba derivados

NO GENERA REQUISITOS DE PRUEBA.

La cobertura vigente ya contempla ausencia de publicación, temporalidad, resolución server-side, ambigüedad, canales, experiencia, invalidación y reconciliación física. Esta tarea especializa esas obligaciones para ANIMA sin crear ni modificar requisitos del registro.

---

#### 15. Cobertura de prueba vigente reutilizada

La tarea consume, sin modificarlos, los requisitos ya registrados para:

- `TREQ-AUTH-209`: denegación y cero efectos cuando un carril que exige turno no encuentra publicación utilizable;
- `TREQ-AUTH-210`: dependencia de turno por permiso y carril, no por nombre de aplicación;
- `TREQ-AUTH-211`: separación entre ausencia, borrador, retiro, cancelación y programación no laboral;
- `TREQ-AUTH-212`: conservación de precedencia entre ausencia, ventana temporal, check-in, rol, territorio, ambigüedad y fallo técnico;
- `TREQ-AUTH-213`: resolución server-side de actor y publicación sin aceptar selección de turno desde cliente o check-in;
- `TREQ-AUTH-214`: equivalencia de respuesta entre canales;
- `TREQ-AUTH-216`: privacidad y recuperación para ausencia de publicación;
- `TREQ-AUTH-217`: invalidación ante cambios de publicación y solicitud nueva;
- `TREQ-AUTH-219`: denegación fuera del intervalo autorizado;
- `TREQ-AUTH-220`: reloj de servidor e intervalo semiabierto;
- `TREQ-AUTH-224`: ambigüedad, turnos nocturnos y resolución por timestamps absolutos.

La enumeración anterior es trazabilidad de cobertura ya vigente; no representa requisitos afectados por esta entrega.

---

#### 16. Evidencia de validación

| Clase | Estado | Evidencia |
| --- | --- | --- |
| BUILD | NOT_EXECUTED | la batería real del repositorio se ejecuta después de insertar y normalizar la tarea en su rama |
| LOCAL | PASS | artefacto único, metadata obligatoria, secciones requeridas, continuidad y regla de cero requisitos comprobadas sobre el descargable |
| REMOTA | PASS | owner, continuidad, topología, políticas, catálogo de prerrequisitos y cobertura 04A fueron contrastados contra `main` |
| OPERATIVA | NOT_EXECUTED | no se ejecutó un check-in real ni se modificó comportamiento operativo durante la definición documental |
| FÍSICA | NOT_EXECUTED | la materialización por unidad de implementación queda diferida al gate físico aplicable |

---

#### 17. Criterios de aceptación

La tarea queda documentalmente aceptable cuando:

1. ANIMA no puede admitir un check-in sin resolver primero al actor efectivo en servidor.
2. La publicación laboral se resuelve desde fuentes autoritativas, no desde selección del cliente.
3. La resolución no usa check-in, sede seleccionada, área seleccionada, perfil predeterminado ni último turno como autoridad.
4. Una publicación borrador, retirada, cancelada, no laboral o sustituida no habilita check-in.
5. Un turno futuro o finalizado no habilita check-in.
6. El tiempo de evaluación autoritativo es server-side.
7. Una sola publicación utilizable permite continuar con `ANIMA-AUTH-002`.
8. Cero publicaciones utilizables deniega la marcación sin cerrar sesión ni bloquear las capacidades base de ANIMA.
9. Varias publicaciones incompatibles fallan cerrado y no se resuelven por primera coincidencia.
10. Una falla técnica no se degrada a una ausencia ordinaria de turno.
11. El cliente no puede imponer `shift_id` como fuente de autoridad.
12. `RESOLVED` no crea asistencia ni contexto operativo por sí solo.
13. Las validaciones de sede, área, rol y compatibilidad permanecen en `ANIMA-AUTH-002` a `ANIMA-AUTH-006`.
14. La creación de contexto permanece en `ANIMA-AUTH-007`.
15. La lógica cross-midnight especializada permanece en `ANIMA-AUTH-013`.
16. La cola offline y su revalidación permanecen en `ANIMA-AUTH-014` y `ANIMA-AUTH-015`.
17. El diagnóstico visible permanece en `ANIMA-AUTH-016` y `ANIMA-AUTH-017`.
18. La auditoría detallada de contexto permanece en `ANIMA-AUTH-018`.
19. La tarea no concede permisos directamente y no sustituye las fuentes canónicas.
20. La entrega no crea ni modifica requisitos de prueba.

---

#### 18. Límites

Esta tarea no define:

- la sede válida del turno, propiedad de `ANIMA-AUTH-002`;
- el área válida del turno, propiedad de `ANIMA-AUTH-003`;
- el rol operativo válido, propiedad de `ANIMA-AUTH-004`;
- habilitación rol-sede, propiedad de `ANIMA-AUTH-005`;
- habilitación rol-área, propiedad de `ANIMA-AUTH-006`;
- creación del contexto operativo, propiedad de `ANIMA-AUTH-007`;
- actualización del contexto ante cambio de turno, propiedad de `ANIMA-AUTH-008`;
- cierre de contexto al registrar salida, propiedad de `ANIMA-AUTH-009`;
- descansos, propiedad de `ANIMA-AUTH-010`;
- cambio temporal de área, propiedad de `ANIMA-AUTH-011`;
- reemplazos de turno, propiedad de `ANIMA-AUTH-012`;
- tratamiento especializado de turnos cruzados de medianoche, propiedad de `ANIMA-AUTH-013`;
- cola offline de check-in, propiedad de `ANIMA-AUTH-014`;
- revalidación al sincronizar offline, propiedad de `ANIMA-AUTH-015`;
- diagnóstico visible al trabajador, propiedad de `ANIMA-AUTH-016`;
- diferenciación de falta de turno y falta de permiso en experiencia, propiedad de `ANIMA-AUTH-017`;
- auditoría de creación y cierre de contexto, propiedad de `ANIMA-AUTH-018`;
- concesión de permisos, expresamente prohibida y reforzada por `ANIMA-AUTH-019`;
- sustitución de la fuente de verdad, gobernada por `ANIMA-AUTH-020`.

No crea tablas, migraciones, RPC, policies, Edge Functions, interfaces ni cambios productivos.

`ÚLTIMA TAREA APROBADA`

`AUTH-ERR-020 — Compartir mensajes desde vento-shell`

`TAREA ACTUAL APROBADA`

`ANIMA-AUTH-001 — Confirmar turno publicado antes del check-in`

`SIGUIENTE TAREA RESERVADA`

`ANIMA-AUTH-002 — Confirmar sede del turno`

---

#### 19. Continuidad

**ÚLTIMA TAREA APROBADA**
`AUTH-ERR-020 — Compartir mensajes desde vento-shell`

**TAREA ACTUAL APROBADA**
`ANIMA-AUTH-001 — Confirmar turno publicado antes del check-in`

**SIGUIENTE TAREA RESERVADA**
`ANIMA-AUTH-002 — Confirmar sede del turno`


### ✅ ANIMA-AUTH-002 — Confirmar sede del turno

**Estado:** APROBADA
**Tarea anterior:** ANIMA-AUTH-001 — Confirmar turno publicado antes del check-in
**Tarea siguiente:** ANIMA-AUTH-003 — Confirmar área del turno
**Tipo de tarea:** documental; definición contractual de la validación de la sede operativa contenida en el turno publicado antes de admitir un check-in en ANIMA
**Bloque:** `F_ANIMA — AUTORIZACIÓN Y CONTEXTO OPERATIVO`
**Repositorio propietario:** `vento-group-sas/vento-shell`
**Archivo propietario:** `docs/plan-canonico/modular/bloques/F_ANIMA/01_AUTORIZACION_Y_CONTEXTO_OPERATIVO.md`
**Estado físico resultante:** contrato documental definido; materialización física no ejecutada y diferida por unidad de implementación
**Cambios físicos autorizados:** ninguno durante este cierre documental; la materialización futura queda sujeta a la topología `PER_IMPLEMENTATION_UNIT` y al gate `POST_E5_PACKAGE`
**Requisitos de prueba creados o modificados:** 0

---

#### 1. Propósito

Definir de forma única, segura y verificable cómo ANIMA confirma la sede operativa del turno que `ANIMA-AUTH-001` ya resolvió como publicación laboral aplicable y temporalmente utilizable antes de continuar con un check-in.

La sede operativa no se selecciona durante la marcación. Se obtiene exclusivamente del turno publicado resuelto y después se valida contra las fuentes territoriales autoritativas.

La regla raíz queda:

```text
TURNO PUBLICADO RESUELTO
+
shift.site_id PRESENTE
+
SEDE EXISTENTE
+
SEDE ACTIVA
+
SEDE LABORAL U OPERATIVA APLICABLE
+
RELACION LABORAL ACTOR-SEDE CUANDO SEA EXIGIBLE
+
SIN SUSTITUCION DESDE CLIENTE, PERFIL O CHECK-IN
->
SEDE DEL TURNO CONFIRMADA
->
CONTINUAR CON ANIMA-AUTH-003
```

Esta confirmación no concede permisos, no crea una asignación laboral, no valida todavía el área ni el rol y no registra asistencia.

---

#### 2. Entrada contractual desde ANIMA-AUTH-001

La tarea recibe únicamente un turno cuya resolución previa ya fue concluyente.

Como mínimo, la entrada conserva:

- identidad estable del turno;
- identidad del actor efectivo;
- referencia de publicación o revisión cuando exista en el contrato propietario;
- inicio y fin autorizados;
- `site_id` publicado;
- `area_id` publicado cuando exista;
- rol operativo publicado cuando exista;
- instante server-side de resolución.

`ANIMA-AUTH-002` no vuelve a escoger entre turnos candidatos.

Si durante esta tarea se descubre que la entrada ya no representa un turno único, publicado y vigente, la decisión anterior queda invalidada y debe reanudarse la resolución desde su propietario. No se corrige el problema escogiendo otra sede.

---

#### 3. Fuente autoritativa de la sede operativa

La fuente de la sede activa operativa es:

```text
public.employee_shifts.site_id
```

dentro de la publicación laboral resuelta.

El registro territorial se verifica contra:

```text
public.sites
```

Cuando la acción exige relación laboral con esa sede, la asignación del actor se verifica contra:

```text
public.employee_sites
```

Cada hecho conserva identidad distinta:

```text
SEDE DEL TURNO
!=
SEDE ASIGNADA
!=
SEDE PRIMARIA
!=
SEDE SELECCIONADA
!=
PUNTO DE CHECK-IN
!=
SEDE DEL RECURSO
```

La sede del turno determina el territorio operativo de esta cadena.

Una sede asignada establece afiliación o elegibilidad laboral, pero no sustituye `shift.site_id`.

Una sede primaria es referencia o fallback visual, no autoridad.

Una sede seleccionada es preferencia de interfaz, no autoridad.

El punto físico de check-in puede participar en reglas de marcación, pero no se convierte en sede operativa.

---

#### 4. Condiciones de una sede del turno válida

Para que la sede contenida en el turno pueda confirmarse deben cumplirse todas las condiciones aplicables:

1. `shift.site_id` no es nulo ni está ausente;
2. el identificador resuelve una sede existente en `public.sites`;
3. la sede está activa;
4. la sede pertenece a una clasificación admitida como territorio laboral u operativo para el turno;
5. no representa únicamente un punto de check-in, punto de checkout, espacio técnico o entorno aislado no asignable;
6. la sede continúa siendo la misma que fue publicada para ese turno;
7. la relación actor-sede exigida para elegibilidad operativa se resuelve desde `public.employee_sites`;
8. la relación requerida está vigente y es compatible con la sede exacta;
9. la fuente se pudo leer de forma concluyente;
10. no existe una contradicción estructural que impida reproducir la misma resolución.

La validación es por identificadores estables. La coincidencia de nombre, tipo visible o etiqueta no sustituye la identidad de sede.

---

#### 5. Validación de la relación actor-sede

El turno no fabrica una asignación laboral.

Cuando la operación exige que el trabajador tenga una relación canónica con la sede del turno, ANIMA debe comprobar la relación exacta del actor efectivo con esa sede.

La fuente es `public.employee_sites`.

No sirven como sustituto:

- `employees.site_id`;
- sede primaria;
- sede seleccionada;
- último turno;
- punto de check-in;
- parámetro enviado por el cliente;
- dispositivo;
- simulación;
- perfil operativo predeterminado;
- historial de asistencia.

Una ausencia confirmada de relación compatible conserva la razón transversal propietaria de falta de asignación de sede.

Una asignación inactiva, una sede inactiva, una configuración contradictoria o una fuente no disponible no se degradan a una ausencia limpia de asignación. Cada causa conserva el propietario transversal que ya le corresponde.

---

#### 6. Separación entre sede operativa y punto de marcación

ANIMA puede manejar un punto permitido para registrar entrada o salida distinto de la sede operativa.

Por tanto:

```text
shift.site_id
->
SEDE OPERATIVA
```

mientras que una referencia de punto de marcación:

```text
checkin_site_id
checkout_site_id
```

no sustituye la sede del turno.

La existencia de un punto de check-in válido no repara:

- `shift.site_id` ausente;
- sede operativa inexistente;
- sede operativa inactiva;
- falta de relación laboral exigible;
- mismatch territorial;
- una publicación inválida.

De la misma manera, la sede operativa confirmada no demuestra por sí sola que cualquier punto físico sea válido para marcar asistencia.

---

#### 7. Datos del cliente y selección territorial

El cliente puede transportar información de correlación o mostrar una sede, pero no puede imponer el territorio operativo.

Quedan prohibidos como fuente de autoridad:

- `site_id` enviado en body, query, header o estado local;
- sede escogida en un selector;
- valor de `localStorage` o almacenamiento nativo;
- primera sede disponible;
- sede primaria;
- sede de un perfil legacy;
- sede recordada de una sesión anterior;
- sede inferida desde un nombre de rol;
- sede del dispositivo;
- sede del punto de check-in.

Si una solicitud explícitamente dirigida a una sede contradice la sede publicada del turno, no se cambia el turno ni se adopta el valor del cliente. La incompatibilidad debe fallar cerrada y conservar su diagnóstico territorial.

---

#### 8. Matriz de decisión

| Situación observada | Clasificación contractual | Resultado |
| --- | --- | --- |
| Turno publicado resuelto, `site_id` presente, sede existente, activa y compatible | sede del turno válida | continuar con `ANIMA-AUTH-003` |
| No existe turno publicado utilizable | precondición de esta tarea incumplida | conservar la razón propietaria de publicación y no evaluar una sede sintética |
| Turno publicado fuera de su ventana | precondición temporal incumplida | conservar la razón propietaria de temporalidad |
| `shift.site_id` nulo o ausente | sede activa operativa no resoluble | denegar; no aplicar fallback |
| `shift.site_id` referencia una sede inexistente | configuración territorial no reproducible | fallar cerrado y conservar la razón transversal correspondiente |
| Sede existente pero inactiva | sede activa operativa no disponible | denegar sin sustituirla |
| Sede resuelta es únicamente punto técnico o de marcación no asignable | territorio operativo inválido | denegar sin reinterpretar su tipo |
| Actor carece de relación canónica compatible cuando es exigible | falta de asignación de sede | conservar la razón transversal propietaria |
| La relación existe pero está inactiva o es contradictoria | no es ausencia limpia | conservar diagnóstico distinto y fallar cerrado |
| Cliente envía otra sede | dato no autoritativo | ignorar como fuente y no cambiar el turno |
| Punto de check-in pertenece a otra sede | no reemplaza `shift.site_id` | conservar sede publicada; la compatibilidad de marcación se resuelve en su control propietario |
| Fuente territorial no puede verificarse | indisponibilidad técnica | no convertir en ausencia de sede ni continuar |
| Cambio concurrente invalida publicación o sede antes del efecto | decisión obsoleta | revalidar o exigir nueva solicitud |

La matriz no crea códigos públicos nuevos. Reutiliza el catálogo transversal de razones aprobado.

---

#### 9. Enrutamiento de razones

Esta tarea conserva la propiedad de razones ya aprobada y no crea un catálogo paralelo.

Reglas de frontera:

- ausencia de publicación utilizable conserva `AUTH-ERR-009`;
- publicación fuera de ventana conserva `AUTH-ERR-010`;
- una sede activa operativa no resoluble desde un turno válido conserva `AUTH-ERR-006` y su razón pública `AUTH_ACTIVE_SITE_REQUIRED` cuando esa clasificación es concluyente;
- una ausencia confirmada de asignación canónica exigible conserva `AUTH-ERR-005` y su razón pública `AUTH_SITE_ASSIGNMENT_REQUIRED`;
- contradicciones estructurales concluyentes conservan el propietario de configuración inconsistente;
- indisponibilidad o lectura no verificable conserva el propietario de fallo técnico;
- la tarea no adelanta razones de área, rol, dispositivo, permiso o recurso que pertenecen a evaluaciones posteriores.

La primera causa concluyente aplicable no puede ser ocultada por una causa posterior.

---

#### 10. Resultado positivo y handoff

Cuando la sede queda confirmada, el handoff hacia `ANIMA-AUTH-003` conserva como hechos verificables:

- identidad del turno publicado resuelto;
- identidad del actor efectivo;
- identidad exacta de la sede del turno;
- actividad verificada de la sede;
- compatibilidad laboral actor-sede cuando fue exigible;
- referencia de publicación o revisión disponible;
- instante server-side usado para la resolución.

El handoff no afirma todavía:

- que `area_id` sea válido;
- que el área pertenezca a la sede;
- que exista rol operativo;
- que el rol esté habilitado en la sede;
- que el rol esté habilitado en el área;
- que el check-in haya sido creado;
- que exista permiso para una acción empresarial posterior.

Esas decisiones continúan en sus tareas propietarias.

---

#### 11. Relación con ANIMA-AUTH-003 a ANIMA-AUTH-007

La cadena se mantiene estrictamente ordenada:

```text
ANIMA-AUTH-001
-> turno publicado y ventana temporal

ANIMA-AUTH-002
-> sede del turno

ANIMA-AUTH-003
-> área del turno

ANIMA-AUTH-004
-> rol operativo del turno

ANIMA-AUTH-005
-> rol permitido en la sede

ANIMA-AUTH-006
-> rol permitido en el área

ANIMA-AUTH-007
-> creación del contexto al registrar entrada
```

`ANIMA-AUTH-002` no absorbe comprobaciones reservadas a las cinco tareas siguientes.

---

#### 12. Frescura, concurrencia e invalidación

La sede confirmada es válida únicamente para la publicación y el snapshot que la produjeron.

Deben invalidar la decisión, según corresponda:

- retiro o cancelación del turno;
- nueva revisión publicada;
- cambio de `site_id`;
- desactivación de la sede;
- alta, baja o cambio de la relación actor-sede requerida;
- cambio de actor;
- expiración de la ventana temporal;
- contradicción descubierta en las fuentes;
- pérdida de verificabilidad de una fuente obligatoria.

Antes del efecto de asistencia debe existir una revalidación suficiente para impedir que un estado obsoleto produzca la entrada.

Una corrección posterior no reanuda automáticamente una solicitud antigua.

---

#### 13. Privacidad y experiencia

Una denegación territorial previa al check-in conserva la sesión y el acceso independiente que siga autorizado.

La respuesta al trabajador no debe revelar automáticamente:

- identificadores internos de sede;
- otras sedes asignadas;
- sedes disponibles;
- turnos alternativos;
- causa administrativa de una desactivación;
- relaciones `employee_sites`;
- rol esperado;
- permisos;
- detalles de configuración;
- tablas o mensajes internos.

La experiencia y el diagnóstico visible se desarrollan posteriormente en `ANIMA-AUTH-016` y `ANIMA-AUTH-017`.

Esta tarea congela la semántica, no el diseño visual final.

---

#### 14. Estado físico observado y frontera de adopción

El consumidor físico actual de ANIMA ya trata `site_id` como dato del turno y consulta `public.sites` para gestión de programación.

También conserva elementos legacy o parciales en superficies de administración, por lo que la existencia de lectura física de `site_id` no demuestra que este contrato esté implementado de extremo a extremo.

En particular, la implementación futura no podrá convertir en autoridad:

- un `employeeSiteId` de interfaz;
- `employees.site_id`;
- filtros de UI;
- la primera sede disponible;
- una clasificación visual de sitio;
- el punto de check-in.

La evidencia física observada se registra únicamente como contexto de adopción. No autoriza cambios en `vento-anima` durante esta tarea documental.

---

#### 15. Topología y materialización física

La definición documental se aprueba una sola vez en este marcador.

La topología vigente de `PHASE-04-F-ANIMA` es:

```text
PER_IMPLEMENTATION_UNIT
```

La materialización física posterior:

- se identifica por unidad de implementación;
- no crea una instancia global implícita;
- requiere el gate `POST_E5_PACKAGE`;
- requiere el package propietario aplicable y su gate E5 correspondiente;
- debe limitarse a productores y consumidores físicos de la validación territorial de ANIMA;
- no se ejecuta desde el carril documental.

Esta tarea no autoriza migraciones, RPC, RLS, cambios de Auth, Edge Functions, código de aplicación, despliegues ni modificaciones productivas.

---

#### 16. Requisitos de prueba derivados

NO GENERA REQUISITOS DE PRUEBA.

La cobertura vigente ya contempla asignación de sede, sede activa operativa, separación de fuentes, precedencia de razones, equivalencia entre canales, privacidad, frescura, invalidación y reconciliación física. Esta tarea especializa esas obligaciones para el check-in de ANIMA sin crear ni modificar filas del registro.

---

#### 17. Cobertura de prueba vigente reutilizada

La tarea consume, sin modificarlos, los requisitos ya registrados para:

- `TREQ-AUTH-169` a `TREQ-AUTH-178`: asignación laboral de sede, fuentes válidas, precedencia, aplicaciones, privacidad e invalidación;
- `TREQ-AUTH-179` a `TREQ-AUTH-188`: sede activa, fuente operativa desde el turno, razones, canales, aplicaciones, privacidad y frescura;
- `TREQ-AUTH-209` a `TREQ-AUTH-218`: publicación de turno, resolución server-side y continuidad entre canales;
- `TREQ-AUTH-219` a `TREQ-AUTH-228`: vigencia temporal y fronteras de la publicación.

La enumeración es trazabilidad de cobertura ya vigente y no representa requisitos afectados por esta entrega.

---

#### 18. Evidencia de validación

| Clase | Estado | Evidencia |
| --- | --- | --- |
| BUILD | NOT_EXECUTED | la batería real del checkout se ejecuta después de insertar y normalizar la tarea en su rama |
| LOCAL | PASS | artefacto único, metadata obligatoria, secciones requeridas, continuidad, cero requisitos derivados y representación UTF-8 comprobados sobre el descargable |
| REMOTA | PASS | continuidad, owner, topología, políticas, modelo de sede, publicación de turno, 04A, razones y consumidor ANIMA fueron contrastados contra `main` |
| OPERATIVA | NOT_EXECUTED | no se registró una entrada real ni se alteró comportamiento de asistencia durante esta definición |
| FÍSICA | NOT_EXECUTED | la materialización por unidad de implementación permanece diferida al gate físico aplicable |

---

#### 19. Criterios de aceptación

La tarea queda documentalmente aceptable cuando:

1. consume el turno resuelto por `ANIMA-AUTH-001` y no vuelve a escoger un turno por heurística;
2. usa `public.employee_shifts.site_id` como fuente de la sede operativa;
3. verifica la identidad territorial contra `public.sites`;
4. exige que la sede sea activa;
5. impide usar un punto técnico o de marcación como sustituto de una sede laboral u operativa;
6. conserva `public.employee_sites` como fuente de la relación actor-sede cuando esa relación es exigible;
7. no usa `employees.site_id` como autoridad;
8. no usa sede primaria como autoridad;
9. no usa sede seleccionada como autoridad;
10. no usa el punto de check-in como autoridad de sede operativa;
11. no permite que el cliente imponga una sede distinta;
12. distingue ausencia de asignación, sede activa ausente, configuración inconsistente e indisponibilidad técnica;
13. conserva `AUTH_SITE_ASSIGNMENT_REQUIRED` únicamente para ausencia confirmada de asignación canónica exigible;
14. conserva `AUTH_ACTIVE_SITE_REQUIRED` para la ausencia concluyente de sede activa cuando corresponde;
15. conserva las razones anteriores de publicación y temporalidad sin desplazarlas;
16. no adelanta validación de área;
17. no adelanta validación de rol;
18. no adelanta habilitación rol-sede ni rol-área;
19. no registra asistencia ni crea contexto operativo;
20. entrega una sede confirmada a `ANIMA-AUTH-003`;
21. invalida la decisión cuando cambian turno, sede o relación laboral relevante;
22. preserva sesión y cero efectos ante denegación;
23. no crea ni modifica requisitos de prueba;
24. no ejecuta cambios físicos durante el cierre documental.

---

#### 20. Límites

Esta tarea no define:

- la publicación y ventana temporal del turno, propiedad de `ANIMA-AUTH-001`;
- el área válida del turno, propiedad de `ANIMA-AUTH-003`;
- el rol operativo válido, propiedad de `ANIMA-AUTH-004`;
- habilitación rol-sede, propiedad de `ANIMA-AUTH-005`;
- habilitación rol-área, propiedad de `ANIMA-AUTH-006`;
- creación del contexto operativo, propiedad de `ANIMA-AUTH-007`;
- actualización del contexto ante cambio de turno, propiedad de `ANIMA-AUTH-008`;
- cierre del contexto, propiedad de `ANIMA-AUTH-009`;
- descansos, cambio temporal de área, reemplazos y turnos cruzados de medianoche;
- reglas completas de cola offline y sincronización;
- diseño final del diagnóstico visible;
- auditoría completa de creación y cierre de contexto;
- concesión de permisos;
- materialización física de Supabase o de aplicaciones.

No crea tablas, migraciones, RPC, policies, contratos físicos nuevos, rutas de aplicación ni cambios productivos.

---

#### 21. Continuidad

**ÚLTIMA TAREA APROBADA**
`ANIMA-AUTH-001 — Confirmar turno publicado antes del check-in`

**TAREA ACTUAL APROBADA**
`ANIMA-AUTH-002 — Confirmar sede del turno`

**SIGUIENTE TAREA RESERVADA**
`ANIMA-AUTH-003 — Confirmar área del turno`


### ✅ ANIMA-AUTH-003 — Confirmar área del turno

**Estado:** APROBADA
**Tarea anterior:** ANIMA-AUTH-002 — Confirmar sede del turno
**Tarea siguiente:** ANIMA-AUTH-004 — Confirmar rol operativo del turno
**Tipo de tarea:** documental; definición contractual de la confirmación del área operativa publicada en el turno antes de resolver el rol operativo y registrar asistencia en ANIMA
**Bloque:** F_ANIMA — AUTORIZACIÓN Y CONTEXTO OPERATIVO
**Repositorio propietario:** vento-group-sas/vento-shell
**Archivo propietario:** docs/plan-canonico/modular/bloques/F_ANIMA/01_AUTORIZACION_Y_CONTEXTO_OPERATIVO.md
**Estado físico resultante:** contrato documental definido; materialización física diferida por unidad de implementación
**Cambios físicos autorizados:** ninguno durante esta tarea documental; la materialización futura queda sujeta a la topología PER_IMPLEMENTATION_UNIT y al gate POST_E5_PACKAGE
**Requisitos de prueba creados o modificados:** 0

---

#### 1. Propósito

Definir cómo ANIMA confirma el área operativa del turno que ya superó `ANIMA-AUTH-001` y `ANIMA-AUTH-002`.

La fuente operativa es el hecho publicado en el propio turno. La confirmación no reconstruye el área desde afiliaciones permanentes, preferencias, cliente, check-in, dispositivo o recurso.

```text
TURNO PUBLICADO Y VIGENTE
+
SEDE DEL TURNO CONFIRMADA
+
LECTURA DE shift.area_id
+
SI HAY area_id:
  AREA EXISTENTE
  + AREA ACTIVA
  + AREA PERTENECE A LA SEDE DEL TURNO
+
SI area_id ES NULL:
  CONSERVAR AUSENCIA
  + NO FABRICAR AREA
->
CONTINUAR CON ANIMA-AUTH-004
```

Esta tarea no concede permisos, no decide todavía si el rol exige área y no registra asistencia.

---

#### 2. Entrada contractual

El handoff de `ANIMA-AUTH-002` conserva:

- actor efectivo;
- turno publicado y vigente;
- sede exacta del turno ya confirmada;
- actividad de la sede;
- referencia de publicación o revisión disponible;
- instante server-side de resolución;
- `area_id` publicado, que puede ser nulo;
- rol operativo publicado cuando exista, todavía sin validar.

`ANIMA-AUTH-003` no vuelve a escoger turno ni sede. Si esos hechos dejan de ser reproducibles, invalida el handoff y no intenta repararlo escogiendo otra área.

---

#### 3. Fuente autoritativa

La fuente del área operativa es:

```text
public.employee_shifts.area_id
```

El registro se verifica contra:

```text
public.areas
```

La pertenencia territorial se comprueba con:

```text
public.areas.site_id
```

Relación obligatoria:

```text
shift.area_id
->
areas.id
->
areas.site_id
=
shift.site_id confirmado
```

`area_id` identifica un área concreta. `area_kind` es una clasificación funcional. No son equivalentes.

---

#### 4. Separación de conceptos

Se conservan separados:

```text
AREA DEL TURNO
!= AREA ASIGNADA
!= AREA PRIMARIA
!= AREA SELECCIONADA
!= AREA DEL CHECK-IN
!= AREA DEL DISPOSITIVO
!= AREA DEL RECURSO
```

`public.employee_areas` describe afiliación habitual y no es un prerrequisito operativo universal.

`employees.area_id` es una referencia legacy y no puede autorizar ni sustituir el área del turno.

---

#### 5. Ausencia de área

`shift.area_id = null` no equivale automáticamente a denegación.

Existen roles y capacidades de nivel sede. Por tanto:

```text
shift.area_id = null
->
active_area_id = null
->
NO FABRICAR AREA
->
CONTINUAR A ANIMA-AUTH-004
```

La dependencia real de área se resolverá cuando estén disponibles el rol y las reglas posteriores.

Queda prohibido convertir `null` en:

- primera área de la sede;
- área primaria o seleccionada;
- única área asignada;
- área del último turno;
- área del check-in;
- área del dispositivo;
- área inferida desde el rol;
- wildcard de todas las áreas.

---

#### 6. Condiciones de un área válida

Cuando `shift.area_id` no es nulo, el área se confirma únicamente si:

1. existe en `public.areas`;
2. es única y resoluble;
3. está activa;
4. `areas.site_id` coincide exactamente con la sede confirmada;
5. sigue perteneciendo a la misma publicación o revisión del turno;
6. no fue sustituida por nombre o `area_kind`;
7. la lectura fue concluyente;
8. no existe una contradicción estructural que impida reproducir la resolución.

Una referencia inválida no se degrada a `null`.

---

#### 7. Employee areas no es guard operativo

`public.employee_areas` no es la fuente de `OperationalActiveArea`.

Una rotación válida puede ubicar temporalmente a un trabajador en un área distinta de su afiliación habitual, siempre que las validaciones posteriores de rol, sede y área lo permitan.

Por ello queda prohibido:

- bloquear un turno válido únicamente porque `employee_areas` esté vacío;
- reemplazar el área del turno con `employee_areas`;
- exigir `is_primary` para operar;
- usar `employees.area_id` como fallback;
- crear afiliación permanente desde el check-in.

---

#### 8. Compatibilidad sede-área

Toda área pertenece a una sola sede.

```text
areas.site_id
=
confirmed_shift_site_id
```

Si el turno declara un área de otra sede:

- no se cambia la sede;
- no se cambia el área;
- no se busca otra área con el mismo nombre;
- no se reinterpreta `area_kind`;
- no se continúa hacia la creación de asistencia;
- se falla cerrado conservando la razón transversal propietaria.

---

#### 9. Matriz de decisión

| Situación | Decisión | Handoff |
| --- | --- | --- |
| `area_id` válido, activo y de la sede confirmada | confirmar | área válida |
| `area_id = null` | conservar ausencia explícita | `area_id = null` |
| área inexistente | bloquear | ninguno |
| área inactiva | bloquear | ninguno |
| área de otra sede | bloquear | ninguno |
| coincidencia solo por nombre o tipo | no sustituir | ninguno |
| `employee_areas` vacío y turno con área válida | no bloquear | área del turno |
| `employee_areas` contiene otra área | no sustituir | área del turno |
| cliente propone otra área | ignorar como autoridad | resolución server-side |
| check-in o dispositivo aporta otra área | no sustituir | área del turno |
| fuente no verificable | bloquear | indisponibilidad técnica |
| publicación cambia durante la evaluación | invalidar | nueva resolución |

---

#### 10. Dependencia de área por rol y permiso

El contrato transversal distingue:

```text
REQUIRED
SITE_SUFFICIENT
NOT_APPLICABLE
```

`ANIMA-AUTH-003` confirma el hecho del turno, pero todavía no posee toda la información para decidir si un `null` es permitido.

Por tanto:

- área válida se conserva;
- área nula se conserva como nula;
- `ANIMA-AUTH-004` valida el rol;
- `ANIMA-AUTH-005` valida el rol en la sede;
- `ANIMA-AUTH-006` valida la compatibilidad del rol con el área;
- una capacidad `REQUIRED` no podrá operar finalmente sin área válida;
- `SITE_SUFFICIENT` solo admite ausencia cuando rol y recurso tampoco exigen área concreta;
- `NOT_APPLICABLE` no fabrica contexto operativo.

---

#### 11. Razones y precedencia

Esta tarea no crea códigos públicos nuevos.

Se conserva la propiedad ya aprobada:

- falta de publicación utilizable: `AUTH-ERR-009`;
- turno fuera de ventana: `AUTH-ERR-010`;
- falta de sede asignada exigible: `AUTH-ERR-005`;
- sede activa no resoluble: `AUTH-ERR-006`;
- área activa requerida y no disponible: `AUTH-ERR-008`, cuando la dependencia es concluyente;
- contradicción estructural concluyente: `AUTH-ERR-017`;
- indisponibilidad o lectura no verificable: `AUTH-ERR-019`.

La falta de `employee_areas` no se convierte en falta de área operativa si el turno aporta un área válida.

---

#### 12. Handoff a ANIMA-AUTH-004

El resultado positivo conserva:

- actor efectivo;
- turno publicado y vigente;
- referencia de publicación o revisión;
- sede confirmada;
- `area_id` publicado;
- área presente o ausente;
- si existe, identidad, actividad y sede propietaria verificadas;
- instante server-side de resolución;
- rol publicado todavía pendiente de validación.

Si no hay área, el handoff conserva `area_id = null`.

No afirma todavía que el rol sea válido, que esté permitido en sede o área, que el permiso admita ausencia de área o que exista check-in.

---

#### 13. Continuidad funcional del minibloque

```text
ANIMA-AUTH-001 -> turno publicado y ventana temporal
ANIMA-AUTH-002 -> sede del turno
ANIMA-AUTH-003 -> area del turno o ausencia explicita
ANIMA-AUTH-004 -> rol operativo del turno
ANIMA-AUTH-005 -> rol permitido en la sede
ANIMA-AUTH-006 -> rol permitido en el area
ANIMA-AUTH-007 -> crear contexto al registrar entrada
```

Esta tarea no absorbe responsabilidades de `ANIMA-AUTH-004`, `ANIMA-AUTH-005`, `ANIMA-AUTH-006` ni `ANIMA-AUTH-007`.

---

#### 14. Frescura e invalidación

Invalidan la decisión, según corresponda:

- retiro, cancelación o sustitución de la publicación;
- cambio de `shift.area_id`;
- cambio de la sede del turno;
- cambio de `areas.site_id`;
- activación o desactivación del área;
- eliminación de la referencia territorial;
- cambio de actor;
- expiración de la ventana;
- contradicción estructural;
- pérdida de verificabilidad de una fuente obligatoria.

Antes del efecto de asistencia se revalidan los hechos necesarios. Una corrección posterior no reactiva una solicitud antigua.

---

#### 15. Privacidad

Una denegación conserva la sesión y los accesos independientes que sigan autorizados.

No debe revelar automáticamente:

- IDs internos de área;
- otras áreas de la sede;
- áreas asignadas, primarias o seleccionadas;
- causa administrativa de una desactivación;
- configuraciones incompatibles;
- rol esperado;
- permiso;
- detalles de tablas o constraints.

La experiencia visible se desarrolla en `ANIMA-AUTH-016` y `ANIMA-AUTH-017`.

---

#### 16. Estado físico observado

La base vigente ya contiene `employee_shifts.area_id` referenciado a `public.areas`, y el consumidor ANIMA observado transporta `area_id` en su contexto de turno.

También existe lógica legacy que combina hechos de turno y check-in para producir un área activa.

Ese estado no demuestra cumplimiento de este contrato.

La materialización futura deberá impedir:

- sustituir el área del turno con el área del check-in;
- usar `employees.area_id` como autoridad;
- usar área seleccionada como autoridad;
- usar `employee_areas` como guard operativo universal;
- tratar `null` como todas las áreas;
- omitir `areas.site_id = shift.site_id`;
- aceptar un área inactiva.

Esta tarea no modifica código ni datos.

---

#### 17. Topología y materialización física

La definición documental se aprueba una sola vez.

```text
MODE: PER_IMPLEMENTATION_UNIT
GATE: POST_E5_PACKAGE
```

La materialización futura se identifica por `implementation_unit_id`, exige el package propietario y su gate E5 aplicable, y se limita a los productores y consumidores físicos de esta validación.

Esta tarea no autoriza migraciones, RLS, RPC, Edge Functions, código de aplicación, Auth, despliegues ni cambios productivos.

---

#### 18. Requisitos de prueba derivados

NO GENERA REQUISITOS DE PRUEBA.

La cobertura vigente ya protege la separación entre área asignada y operativa, la fuente del área activa desde el turno, actividad y pertenencia territorial, ausencia permitida para capacidades de nivel sede, precedencia, canales, privacidad, frescura y reconciliación física. Esta tarea especializa esas obligaciones para ANIMA sin cambiar el registro.

---

#### 19. Cobertura de prueba vigente reutilizada

Sin modificarlos, se reutilizan:

- `TREQ-AUTH-189` a `TREQ-AUTH-198`: asignación de área y separación entre afiliación y operación;
- `TREQ-AUTH-199` a `TREQ-AUTH-208`: área activa, dependencia, fuente desde turno, territorio, canales y frescura;
- `TREQ-AUTH-209` a `TREQ-AUTH-218`: publicación y resolución server-side del turno;
- `TREQ-AUTH-219` a `TREQ-AUTH-228`: vigencia temporal e invalidación.

Esta enumeración es trazabilidad y no representa requisitos afectados.

---

#### 20. Evidencia de validación

| Clase | Estado | Evidencia |
| --- | --- | --- |
| BUILD | NOT_EXECUTED | La batería real del checkout se ejecuta después de insertar y normalizar la tarea. |
| LOCAL | PASS | El artefacto aislado fue comprobado por estructura, metadata, secciones, continuidad, UTF-8, EOL y cero TREQ en la sección derivada. |
| REMOTA | PASS | Se contrastaron en `main` continuidad, owner, topología, políticas, modelo de áreas, catálogo, 04A y superficies físicas relevantes. |
| OPERATIVA | NOT_EXECUTED | No se registró asistencia ni se alteró el comportamiento real de ANIMA. |
| FÍSICA | NOT_EXECUTED | No se ejecutaron migraciones, datos, código, RLS, RPC ni despliegues. |

---

#### 21. Criterios de aceptación

La tarea queda aceptable cuando:

1. consume el handoff de `ANIMA-AUTH-002`;
2. usa `employee_shifts.area_id` como fuente operativa;
3. verifica un área no nula en `public.areas`;
4. exige actividad cuando existe;
5. exige coincidencia exacta entre sede del área y sede confirmada;
6. separa `area_id` y `area_kind`;
7. no usa `employee_areas` como fuente operativa;
8. no usa `employees.area_id`, primaria o selección como autoridad;
9. no usa check-in, dispositivo, recurso ni cliente como sustitutos;
10. conserva `area_id = null` sin fabricar área;
11. no deniega anticipadamente un `null` antes de conocer rol y dependencia;
12. no convierte área inválida o inactiva en ausencia limpia;
13. distingue contradicción e indisponibilidad;
14. conserva precedencia de turno y sede;
15. entrega área válida o ausencia explícita a `ANIMA-AUTH-004`;
16. no valida rol, rol-sede ni rol-área;
17. no crea check-in ni contexto;
18. invalida ante cambios relevantes;
19. conserva sesión y cero efectos al bloquear;
20. no crea ni modifica requisitos de prueba;
21. no ejecuta cambios físicos.

---

#### 22. Límites

Esta tarea no define:

- publicación y ventana temporal, propiedad de `ANIMA-AUTH-001`;
- sede del turno, propiedad de `ANIMA-AUTH-002`;
- rol operativo, propiedad de `ANIMA-AUTH-004`;
- rol permitido en sede, propiedad de `ANIMA-AUTH-005`;
- rol permitido en área, propiedad de `ANIMA-AUTH-006`;
- creación del contexto, propiedad de `ANIMA-AUTH-007`;
- actualización posterior del contexto, propiedad de `ANIMA-AUTH-008`;
- diseño final de mensajes;
- autorización de recursos;
- sincronización offline;
- materialización física.

No crea tablas, migraciones, RPC, policies, tipos, rutas ni cambios productivos.

---

#### 23. Continuidad

**ÚLTIMA TAREA APROBADA**
`ANIMA-AUTH-002 — Confirmar sede del turno`

**TAREA ACTUAL APROBADA**
`ANIMA-AUTH-003 — Confirmar área del turno`

**SIGUIENTE TAREA RESERVADA**
`ANIMA-AUTH-004 — Confirmar rol operativo del turno`


### ✅ ANIMA-AUTH-004 — Confirmar rol operativo del turno

**Estado:** APROBADA
**Tarea anterior:** ANIMA-AUTH-003 — Confirmar área del turno
**Tarea siguiente:** ANIMA-AUTH-005 — Confirmar que el rol esté permitido en la sede
**Tipo de tarea:** documental; definición contractual de la confirmación del rol operativo publicado en el turno antes de validar su habilitación territorial y crear contexto operativo en ANIMA
**Bloque:** F_ANIMA — AUTORIZACIÓN Y CONTEXTO OPERATIVO
**Repositorio propietario:** vento-group-sas/vento-shell
**Archivo propietario:** docs/plan-canonico/modular/bloques/F_ANIMA/01_AUTORIZACION_Y_CONTEXTO_OPERATIVO.md
**Estado físico resultante:** contrato documental definido; materialización física diferida por unidad de implementación
**Cambios físicos autorizados:** ninguno durante esta tarea documental; la materialización futura queda sujeta a la topología PER_IMPLEMENTATION_UNIT y al gate POST_E5_PACKAGE
**Requisitos de prueba creados o modificados:** 0

---

#### 1. Propósito

Definir de forma única, segura y verificable cómo ANIMA confirma el rol operativo contenido en el mismo turno publicado, vigente y territorialmente resuelto por `ANIMA-AUTH-001`, `ANIMA-AUTH-002` y `ANIMA-AUTH-003` antes de permitir que la cadena continúe hacia la habilitación rol-sede.

La regla raíz queda:

```text
TURNO PUBLICADO Y VIGENTE
+
SEDE DEL TURNO CONFIRMADA
+
AREA DEL TURNO CONFIRMADA O AUSENCIA EXPLICITA CONSERVADA
+
LECTURA AUTORITATIVA DEL ROL PUBLICADO
+
CODIGO PRESENTE
+
CODIGO CANONICO EXISTENTE
+
ROL OPERATIVO ACTIVO
->
ROL OPERATIVO DEL TURNO CONFIRMADO
->
CONTINUAR CON ANIMA-AUTH-005
```

La tarea confirma identidad y vigencia del rol operativo. No decide todavía si ese rol está habilitado en la sede, si es compatible con el área, si posee permisos suficientes ni si puede ejecutarse una acción empresarial concreta.

---

#### 2. Entrada contractual desde ANIMA-AUTH-003

La tarea consume exclusivamente el handoff válido de `ANIMA-AUTH-003`.

Como mínimo conserva:

- actor efectivo;
- identidad estable del turno publicado y vigente;
- referencia de publicación o revisión disponible;
- instante server-side de resolución;
- sede del turno ya confirmada;
- área del turno ya confirmada o `area_id = null` conservado como ausencia explícita;
- valor de rol operativo publicado en el mismo snapshot del turno.

`ANIMA-AUTH-004` no vuelve a escoger turno, sede ni área.

Si cualquiera de esos hechos deja de pertenecer a la misma revisión reproducible, el handoff se invalida y debe ejecutarse una nueva resolución. No se corrige la inconsistencia tomando el rol desde otra fuente.

---

#### 3. Fuente autoritativa del rol operativo

El concepto canónico consumido por esta tarea es:

```text
active_shift.operational_role_code
```

Debe proceder de la misma revisión publicada que aportó:

```text
shift_id
site_id
area_id
starts_at
ends_at
revision_ref
```

En la estructura física versionada vigente, el dato equivalente se encuentra en:

```text
public.employee_shifts.operational_role
```

La normalización lógica es:

```text
employee_shifts.operational_role
->
active_shift.operational_role_code
```

Esta equivalencia documental no crea una columna nueva ni autoriza una migración.

---

#### 4. Catálogo canónico del rol

Cuando el turno contiene un código no vacío, ANIMA debe resolverlo exclusivamente contra:

```text
public.operational_roles.code
```

Para que el rol quede confirmado en esta tarea deben cumplirse simultáneamente:

```text
role_code existe
AND
operational_roles.is_active = true
```

El código es una identidad estable; la etiqueta humana no participa como autoridad.

Queda prohibido validar por:

- coincidencia de `label`;
- traducción del nombre;
- semejanza de texto;
- familia de rol;
- nombre de pantalla;
- nombre de aplicación;
- nombre de cargo base.

`role_family` puede clasificar, pero no sustituye `code`.

---

#### 5. Separación entre rol base y rol operativo

ANIMA conserva la separación canónica:

```text
ROL BASE
!=
ROL OPERATIVO
```

El rol base describe una relación laboral estable o administrativa.

El rol operativo describe la función temporal asignada en un turno.

Por tanto:

```text
employees.role
!=
active_shift.operational_role_code
```

Aunque ambos valores tengan nombres parecidos, el rol base no completa ni repara un rol operativo faltante.

Ejemplos prohibidos:

```text
employees.role = bodeguero
shift.operational_role = null
-> NO inferir bodeguero
```

```text
employees.role = propietario
shift.operational_role = null
-> NO crear bypass operativo
```

La autoridad temporal proviene del turno, no de jerarquía, cargo o permanencia laboral.

---

#### 6. Fuentes que no pueden crear el rol operativo

No son fuente de autoridad para esta tarea:

- `employees.role`;
- un perfil operativo predeterminado;
- `navigation_role` de un dispositivo;
- el rol del último turno;
- el rol del último check-in;
- una cookie;
- almacenamiento local;
- un selector de interfaz;
- query string, body o header del cliente;
- una preferencia del trabajador;
- la aplicación abierta;
- el permiso solicitado;
- el área o la sede por sí solas;
- un rol simulado;
- una heurística derivada de tareas anteriores.

Un valor predeterminado puede ayudar a planificar un turno antes de publicarlo, pero no puede adquirir autoridad en tiempo de ejecución.

---

#### 7. Rol faltante

Existe ausencia limpia de rol operativo cuando:

```text
TURNO = exactamente uno y ya resuelto
AND
PUBLICACION = concluyente
AND
ROL EN EL TURNO = null, vacio u omitido
AND
FUENTE = disponible y verificable
```

En el flujo de check-in de ANIMA, ese estado no se completa automáticamente.

Resultado:

```text
DENY DE LA CONTINUACION OPERATIVA
+
AUTH_OPERATIONAL_ROLE_REQUIRED
+
SESION PRESERVADA
+
CERO EFECTOS DE ASISTENCIA
```

La corrección pertenece a la fuente administrativa del turno: asignar el rol, publicar la revisión correspondiente y producir una solicitud nueva.

No corresponde pedir al trabajador que elija localmente su rol para desbloquear la marcación.

---

#### 8. Código desconocido, inactivo o deprecado

La presencia de un string no demuestra un rol válido.

Se distinguen obligatoriamente:

| Estado observado | Interpretación | Tratamiento |
| --- | --- | --- |
| `null`, vacío u omitido | ausencia limpia y concluyente | `AUTH_OPERATIONAL_ROLE_REQUIRED` |
| código existente y activo | identidad operativa confirmada | continuar |
| código inexistente | referencia administrada inválida | fallar cerrado como configuración inconsistente |
| código inactivo o deprecado | turno publicado contra catálogo no utilizable | fallar cerrado como configuración inconsistente |
| catálogo no verificable | indisponibilidad técnica | fallar cerrado como fallo técnico |
| dos snapshots autoritativos incompatibles | resolución no reproducible | fallar cerrado como configuración inconsistente |

Un código inválido nunca se convierte en ausencia limpia.

La razón de rol faltante no debe ocultar una configuración contradictoria ni un fallo técnico.

---

#### 9. Frontera con ANIMA-AUTH-005 y ANIMA-AUTH-006

`ANIMA-AUTH-004` termina cuando confirma:

```text
ROL PRESENTE
+
ROL CANONICO
+
ROL ACTIVO
```

No consulta como decisión final la habilitación territorial de:

```text
public.site_operational_roles
```

Esa responsabilidad se divide después:

```text
ANIMA-AUTH-005
-> confirmar que el rol este permitido en la sede

ANIMA-AUTH-006
-> confirmar que el rol este permitido en el area cuando corresponda
```

Por tanto, un rol canónico activo puede superar esta tarea y fallar posteriormente por sede o área.

`ANIMA-AUTH-004` no debe colapsar esas causas en una razón genérica de rol inválido.

---

#### 10. Relación con un área ausente

El handoff de `ANIMA-AUTH-003` puede contener:

```text
area_id = null
```

Eso no impide confirmar la identidad del rol operativo.

La tarea debe mantener separados:

```text
ROL VALIDO
!=
ROL HABILITADO PARA SEDE
!=
ROL HABILITADO PARA AREA
!=
PERMISO OPERATIVO AUTORIZADO
```

Si el rol posteriormente exige un área concreta, `ANIMA-AUTH-006` será quien determine la compatibilidad.

No se inventa un área desde el rol y no se rechaza un rol únicamente porque el turno tenga área nula antes de aplicar la regla territorial propietaria.

---

#### 11. Matriz de decisión de ANIMA-AUTH-004

| Entrada observada | Decisión de esta tarea | Continuación |
| --- | --- | --- |
| rol presente, código canónico y activo | confirmar identidad del rol | `ANIMA-AUTH-005` |
| rol `null` | bloquear | no continuar |
| rol vacío o whitespace | normalizar a ausencia limpia y bloquear | no continuar |
| rol omitido en la revisión publicada | bloquear | no continuar |
| rol base coincide con uno operativo pero el turno no trae rol | no inferir | no continuar |
| perfil predeterminado contiene rol pero el turno no | no inferir | no continuar |
| dispositivo declara `navigation_role` | no inferir | no continuar |
| cliente propone `role_code` | ignorar como autoridad | conservar resolución server-side |
| último turno contiene rol | no reutilizar | conservar turno actual |
| código presente pero inexistente en catálogo | configuración inconsistente | no continuar |
| código presente pero inactivo | configuración inconsistente | no continuar |
| rol válido pero no habilitado en la sede | fuera del alcance de esta tarea | entregar a `ANIMA-AUTH-005` |
| rol válido pero incompatible con el área | fuera del alcance de esta tarea | entregar a `ANIMA-AUTH-005` y luego `ANIMA-AUTH-006` |
| catálogo no disponible o lectura no verificable | fallo técnico | no continuar |
| publicación cambia durante la evaluación | invalidar snapshot | resolver de nuevo |

---

#### 12. Precedencia de razones

Esta tarea no crea códigos públicos nuevos.

La precedencia conserva propietarios ya aprobados:

- sin turno publicado utilizable: `AUTH-ERR-009`;
- turno fuera de ventana: `AUTH-ERR-010`;
- check-in requerido cuando el carril correspondiente ya lo exige y esa etapa precede a la resolución aplicable: `AUTH-ERR-011`;
- rol operativo faltante: `AUTH-ERR-012`;
- rol operativo no habilitado en sede: `AUTH-ERR-013`;
- rol operativo incompatible con área: `AUTH-ERR-014`;
- configuración concluyentemente contradictoria: `AUTH-ERR-017`;
- fuente no verificable o indisponible: `AUTH-ERR-019`.

La primera causa concluyente aplicable no puede ser ocultada por una causa posterior.

Un consumidor no puede volver a usar una única razón `invalid_operational_role` para representar ausencia, catálogo inválido, sede incompatible y área incompatible.

---

#### 13. Handoff a ANIMA-AUTH-005

Cuando la tarea concluye positivamente, el handoff conserva:

- actor efectivo;
- identidad del turno;
- referencia de publicación o revisión;
- instante server-side de resolución;
- sede del turno confirmada;
- área del turno confirmada o ausencia explícita;
- `operational_role_code` exacto;
- evidencia de que el código existe en el catálogo canónico;
- evidencia de que el rol está activo;
- identidad o versión del catálogo cuando el contrato físico la materialice.

El handoff no afirma todavía:

- que exista una fila activa rol-sede;
- que la habilitación rol-sede sea única;
- que el rol pueda operar sin área;
- que el rol esté habilitado para el área concreta;
- que el actor posea el permiso final;
- que el recurso esté dentro del scope;
- que el dispositivo permita la acción;
- que exista autorización final.

---

#### 14. Cadena del minibloque

```text
ANIMA-AUTH-001
-> turno publicado y ventana temporal

ANIMA-AUTH-002
-> sede del turno

ANIMA-AUTH-003
-> area del turno o ausencia explicita

ANIMA-AUTH-004
-> presencia, identidad canonica y actividad del rol operativo

ANIMA-AUTH-005
-> habilitacion del rol en la sede

ANIMA-AUTH-006
-> compatibilidad del rol con el area

ANIMA-AUTH-007
-> crear contexto operativo al registrar entrada
```

Ninguna etapa puede apropiarse de una validación reservada a otra para simplificar el consumidor.

---

#### 15. Frescura, concurrencia e invalidación

La confirmación del rol es válida únicamente para el snapshot que la produjo.

Deben invalidarla, según corresponda:

- una nueva publicación del turno;
- retiro o cancelación de la revisión utilizada;
- cambio de `operational_role`;
- cambio de actor;
- cambio de sede o área del mismo turno;
- expiración de la ventana temporal;
- activación, desactivación o deprecación del rol en el catálogo;
- cambio de identidad del código;
- pérdida de verificabilidad del catálogo;
- detección de una contradicción de versiones.

Antes de crear asistencia o contexto, el productor físico deberá revalidar los hechos necesarios para impedir que un rol obsoleto llegue al efecto.

Una corrección posterior exige nueva resolución; no reactiva una solicitud anterior.

---

#### 16. Privacidad y experiencia

Al bloquear por rol faltante o inválido:

- se conserva la sesión autenticada;
- se conservan capacidades base independientes que sigan autorizadas;
- no se crea check-in;
- no se crea contexto operativo;
- no se aplican permisos del rol ausente o inválido;
- no se selecciona otro rol automáticamente.

La respuesta visible no debe revelar automáticamente:

- todos los roles posibles de la sede;
- roles de otros trabajadores;
- el rol histórico del actor;
- permisos asociados al rol;
- matrices de habilitación;
- detalles de tablas, constraints o claves;
- identificadores internos innecesarios.

La experiencia concreta se mantiene reservada para las tareas posteriores de experiencia y diagnóstico de ANIMA.

---

#### 17. Estado físico observado y brecha de adopción

El repositorio versionado ya contiene:

- `public.employee_shifts.operational_role` como texto del rol planeado por turno;
- `public.operational_roles` como catálogo controlado;
- `public.site_operational_roles` como matriz territorial posterior;
- un `get_operational_context(...)` que lee `employee_shifts.operational_role`.

El consumidor ANIMA observado transporta el valor `operational_role` dentro de su contexto de turno y lo adjunta al contexto técnico de asistencia.

Sin embargo, el estado físico versionado todavía presenta brechas relevantes para este contrato:

1. la columna física de turno es texto y la evolución histórica no demuestra una referencia estricta y vigente al catálogo para cada publicación;
2. la función legacy `get_operational_context(...)` colapsa rol faltante y rol no habilitado territorialmente en `invalid_operational_role`;
3. esa función combina la validación de presencia del rol con `site_operational_roles`, absorbiendo fronteras que documentalmente pertenecen a `ANIMA-AUTH-005` y `ANIMA-AUTH-006`;
4. persiste un bypass por nombres de rol base para `propietario` y `gerente_general`, incompatible con usar el turno como fuente exclusiva del rol operativo;
5. el consumidor ANIMA inspeccionado normaliza y transporta el string `operational_role`, pero no materializa por sí mismo una consulta al catálogo `operational_roles` antes de completar este gate.

Estas observaciones registran frontera de adopción. No autorizan modificaciones físicas en esta tarea.

---

#### 18. Topología y materialización física

La definición documental se aprueba una sola vez en este marcador.

La topología vigente de `PHASE-04-F-ANIMA` es:

```text
PER_IMPLEMENTATION_UNIT
```

La materialización física posterior:

- se identifica por `implementation_unit_id`;
- no crea una instancia global implícita;
- requiere el gate `POST_E5_PACKAGE`;
- requiere el package propietario aplicable y su gate E5 correspondiente;
- debe limitarse a los productores y consumidores físicos que materialicen esta validación;
- no se ejecuta desde este carril documental.

Esta tarea no autoriza migraciones, RLS, RPC, funciones, Edge Functions, código de aplicación, Auth, datos, despliegues ni cambios productivos.

---

#### 19. Requisitos de prueba derivados

NO GENERA REQUISITOS DE PRUEBA.

La cobertura vigente ya exige que el rol operativo proceda exclusivamente del turno publicado, distingue ausencia de código de código desconocido o inactivo, separa rol de sede y área, preserva precedencia, canales, experiencia, frescura y reconciliación física. `ANIMA-AUTH-004` especializa esa cobertura para la cadena de check-in de ANIMA sin crear ni modificar requisitos del registro.

---

#### 20. Cobertura de prueba vigente reutilizada

La tarea reutiliza, sin modificarlos:

- `TREQ-AUTH-239`: rol operativo faltante, sesión preservada y cero efectos;
- `TREQ-AUTH-240`: dependencia por permiso, modalidad y carril;
- `TREQ-AUTH-241`: fuente exclusiva del rol desde la revisión publicada del turno;
- `TREQ-AUTH-242`: separación entre ausencia, código desconocido o inactivo, sede, área, grants y fallo técnico;
- `TREQ-AUTH-243`: precedencia entre turno, vigencia, check-in, rol y validaciones posteriores;
- `TREQ-AUTH-244`: equivalencia multicanal;
- `TREQ-AUTH-245`: cobertura de las aplicaciones y prohibición de que ANIMA complete el rol al marcar entrada;
- `TREQ-AUTH-246`: experiencia y privacidad;
- `TREQ-AUTH-247`: invalidación, concurrencia, caché y replay;
- `TREQ-AUTH-248`: reconciliación física y regresión.

Esta enumeración es trazabilidad de cobertura existente y no representa requisitos afectados por esta entrega.

---

#### 21. Evidencia de validación

| Clase | Estado | Evidencia |
| --- | --- | --- |
| BUILD | NOT_EXECUTED | La batería real del checkout se ejecuta después de insertar y normalizar la tarea en su rama documental. |
| LOCAL | PASS | El artefacto aislado fue comprobado por estructura, metadata obligatoria, secciones requeridas, continuidad, UTF-8, EOL y ausencia de TREQ en la sección derivada. |
| REMOTA | PASS | Se contrastaron en `main` continuidad, owner, topología, políticas, catálogo operativo, migraciones de turno, contratos AUTH-ERR, 04A y el consumidor ANIMA vigente. |
| OPERATIVA | NOT_EXECUTED | No se registró asistencia ni se modificó comportamiento operativo de ANIMA durante esta definición. |
| FÍSICA | NOT_EXECUTED | No se ejecutaron migraciones, datos, RLS, RPC, código, Auth ni despliegues. |

---

#### 22. Criterios de aceptación

La tarea queda documentalmente aceptable cuando:

1. consume exclusivamente el handoff de `ANIMA-AUTH-003`;
2. conserva turno, sede y área del mismo snapshot publicado;
3. toma el rol operativo únicamente de la revisión publicada del turno;
4. normaliza el campo físico vigente sin convertir esa normalización en una migración;
5. trata `null`, vacío u omitido como ausencia limpia cuando la fuente es concluyente;
6. produce `AUTH_OPERATIONAL_ROLE_REQUIRED` para esa ausencia en la cadena operativa aplicable;
7. no completa el rol desde `employees.role`;
8. no completa el rol desde perfiles predeterminados;
9. no completa el rol desde dispositivo o `navigation_role`;
10. no completa el rol desde cliente, cookie, selector, historial o aplicación;
11. verifica el código contra `public.operational_roles`;
12. exige que el rol canónico esté activo;
13. no convierte código desconocido o inactivo en rol faltante;
14. distingue configuración inconsistente de fallo técnico;
15. no consulta la habilitación territorial como decisión final de esta tarea;
16. entrega un rol canónico activo a `ANIMA-AUTH-005`;
17. permite que un rol válido falle después por sede en `ANIMA-AUTH-005`;
18. permite que un rol válido falle después por área en `ANIMA-AUTH-006`;
19. no fabrica un área desde el rol;
20. conserva la precedencia de razones anteriores;
21. no crea check-in ni contexto operativo;
22. conserva sesión y cero efectos al bloquear;
23. invalida la decisión ante cambios de turno, rol, catálogo o territorio;
24. no crea ni modifica requisitos de prueba;
25. no ejecuta cambios físicos.

---

#### 23. Límites

Esta tarea no define:

- publicación y ventana temporal, propiedad de `ANIMA-AUTH-001`;
- sede del turno, propiedad de `ANIMA-AUTH-002`;
- área del turno, propiedad de `ANIMA-AUTH-003`;
- habilitación del rol en la sede, propiedad de `ANIMA-AUTH-005`;
- habilitación del rol en el área, propiedad de `ANIMA-AUTH-006`;
- creación del contexto operativo, propiedad de `ANIMA-AUTH-007`;
- actualización posterior del contexto;
- permisos finales del rol;
- autorización de recursos;
- límites de dispositivos compartidos;
- simulación;
- copy final de experiencia;
- sincronización offline;
- materialización física de Supabase o aplicaciones.

No crea tablas, columnas, constraints, migraciones, RPC, policies, rutas, tipos ni cambios productivos.

---

#### 24. Continuidad

**ÚLTIMA TAREA APROBADA**
`ANIMA-AUTH-003 — Confirmar área del turno`

**TAREA ACTUAL APROBADA**
`ANIMA-AUTH-004 — Confirmar rol operativo del turno`

**SIGUIENTE TAREA RESERVADA**
`ANIMA-AUTH-005 — Confirmar que el rol esté permitido en la sede`


### ✅ ANIMA-AUTH-005 — Confirmar que el rol esté permitido en la sede

**Estado:** APROBADA
**Tarea anterior:** ANIMA-AUTH-004 — Confirmar rol operativo del turno
**Tarea siguiente:** ANIMA-AUTH-006 — Confirmar que el rol esté permitido en el área
**Tipo de tarea:** documental; definición contractual de la habilitación del rol operativo canónico del turno en la sede exacta ya confirmada antes de evaluar compatibilidad de área y crear contexto operativo en ANIMA
**Bloque:** F_ANIMA — AUTORIZACIÓN Y CONTEXTO OPERATIVO
**Repositorio propietario:** vento-group-sas/vento-shell
**Archivo propietario:** docs/plan-canonico/modular/bloques/F_ANIMA/01_AUTORIZACION_Y_CONTEXTO_OPERATIVO.md
**Estado físico resultante:** contrato documental definido; materialización física diferida por unidad de implementación
**Cambios físicos autorizados:** ninguno durante esta tarea documental; la materialización futura queda sujeta a la topología PER_IMPLEMENTATION_UNIT y al gate POST_E5_PACKAGE
**Requisitos de prueba creados o modificados:** 0

---

#### 1. Propósito

Definir cómo ANIMA confirma que el rol operativo ya validado por `ANIMA-AUTH-004` está habilitado para la sede exacta del turno confirmada por `ANIMA-AUTH-002`.

La decisión no selecciona otra sede, no cambia el rol del turno y no evalúa todavía si ese rol puede operar en el área exacta.

```text
TURNO PUBLICADO Y VIGENTE
+
SEDE DEL TURNO CONFIRMADA
+
AREA DEL TURNO CONFIRMADA O AUSENCIA EXPLICITA
+
ROL OPERATIVO PRESENTE, CANONICO Y ACTIVO
+
LECTURA CONCLUYENTE DE HABILITACIONES ACTIVAS
+
AL MENOS UNA HABILITACION DEL PAR EXACTO ROL-SEDE
->
SEDE HABILITADA PARA EL ROL
->
CONTINUAR CON ANIMA-AUTH-006
```

Cuando no existe ninguna habilitación activa para el par exacto rol–sede, el carril operativo no puede continuar.

---

#### 2. Entrada contractual desde ANIMA-AUTH-004

El handoff consumido conserva, como mínimo:

- actor efectivo;
- turno laboral publicado, vigente e inequívoco;
- referencia de publicación o revisión disponible;
- sede exacta del turno ya confirmada;
- área exacta del turno o ausencia explícita ya preservada;
- rol operativo tomado del turno;
- identidad del rol resuelta en el catálogo operativo;
- confirmación de que el rol es canónico y activo;
- instante server-side de resolución;
- estado del check-in cuando la cadena aplicable ya lo exige.

`ANIMA-AUTH-005` no vuelve a resolver el rol desde una fuente alternativa ni modifica los hechos territoriales heredados.

---

#### 3. Resultado de esta etapa

La evaluación conserva los estados contractuales ya definidos para la habilitación sede–rol:

| Estado | Significado | Continuación |
| --- | --- | --- |
| `PRESENT_SITE_WIDE` | existe una habilitación activa del rol para la sede con alcance site-wide | continuar a `ANIMA-AUTH-006` |
| `PRESENT_AREA_SCOPED` | existe una o más habilitaciones activas del rol dentro de la sede, acotadas por área | el gate de sede queda satisfecho; continuar a `ANIMA-AUTH-006` |
| `CONCLUSIVE_ABSENT` | no existe habilitación activa del rol en la sede | bloquear el carril operativo |
| `INACTIVE_ONLY` | solo existen relaciones inactivas o retiradas para ese par | bloquear el carril operativo |
| `CONTRADICTORY` | las fuentes o versiones producen una configuración incompatible | fallar cerrado por configuración |
| `UNAVAILABLE` | la fuente necesaria no pudo verificarse | fallar cerrado por indisponibilidad técnica |

La existencia de una relación area-scoped dentro de la sede demuestra únicamente que el rol está admitido en esa sede. No demuestra que el área concreta del turno sea compatible.

---

#### 4. Fuente autoritativa de habilitación sede–rol

El rol y la sede proceden de la misma revisión publicada del turno:

```text
active_shift.operational_role_code
active_shift.site_id
```

La habilitación procede del contrato canónico equivalente a:

```text
site_operational_roles
WHERE role_code = active_shift.operational_role_code
  AND site_id = active_shift.site_id
  AND is_active = true
```

La implementación física vigente utiliza `public.site_operational_roles`.

La fuente deberá leerse como conjunto completo aplicable al par exacto; no se autoriza escoger una fila por conveniencia ni sustituir el par mediante otra sede.

---

#### 5. Identidad exacta del par rol–sede

La identidad evaluada es:

```text
ROLE_SITE_KEY =
(
  active_shift.operational_role_code,
  active_shift.site_id
)
```

La comparación usa identificadores estables.

No son equivalentes:

```text
role_code
!= role_label
!= role_family

site_id
!= site_code
!= site_name
!= site_kind
```

Una coincidencia por texto, etiqueta, familia o tipo no sustituye el par canónico.

---

#### 6. Semántica exacta de “permitido en la sede”

El rol está permitido en la sede si y solo si la lectura autoritativa y concluyente encuentra al menos una habilitación activa para el par exacto.

```text
ACTIVE_ENABLEMENTS_FOR_ROLE_AND_SITE >= 1
->
SITE_GATE = SATISFIED
```

```text
ACTIVE_ENABLEMENTS_FOR_ROLE_AND_SITE = 0
+
READ = CONCLUSIVE
->
SITE_GATE = DENIED
```

La semántica de esta tarea no exige todavía coincidencia con `area_id`.

Una habilitación area-scoped en otra área de la misma sede satisface el gate de sede y deja la compatibilidad exacta de área para `ANIMA-AUTH-006`.

---

#### 7. Actividad y vigencia de la relación

Una relación únicamente puede contribuir al gate cuando:

1. pertenece al rol exacto del turno;
2. pertenece a la sede exacta del turno;
3. está activa;
4. sus referencias son resolubles;
5. el rol continúa activo;
6. la sede continúa activa;
7. pertenece a la versión o vigencia contractual aplicable cuando el modelo físico la materialice;
8. no forma parte de una configuración contradictoria.

Una fila inactiva, retirada, obsoleta o perteneciente a otra sede no concede autoridad.

`is_default` no participa en la autorización.

---

#### 8. Cardinalidad y multiplicidad

La cardinalidad del gate de sede es de conjunto:

```text
0 filas activas exactas
-> sede no habilitada para el rol

1 o mas filas activas exactas
-> sede habilitada para el rol
```

Varias filas area-scoped del mismo rol dentro de una sede no constituyen por sí mismas una contradicción: pueden representar un rol válido en varias áreas y deberán ser evaluadas por `ANIMA-AUTH-006`.

Sí existe una contradicción cuando la configuración activa no puede interpretarse mediante las reglas canónicas, por ejemplo:

- duplicados semánticamente incompatibles;
- versiones simultáneamente autoritativas que discrepan;
- mezcla site-wide y area-scoped sin una regla versionada que la haga inequívoca;
- referencias territoriales imposibles;
- una cardinalidad física que impide representar la cardinalidad contractual necesaria.

La contradicción no se resuelve con `limit 1`.

---

#### 9. Site-wide y area-scoped

La evaluación distingue:

```text
PRESENT_SITE_WIDE
-> existe una relacion activa con area_id = null
-> el rol esta habilitado en la sede

PRESENT_AREA_SCOPED
-> existe una o mas relaciones activas con area_id concreto
-> el rol esta habilitado en la sede
-> la compatibilidad exacta se decide despues
```

Esta tarea no declara que `area_id = null` en el turno equivalga a site-wide.

El alcance site-wide pertenece a la habilitación de la matriz, no a la ausencia de área en el turno.

---

#### 10. Fuentes que no pueden sustituir la habilitación

Queda prohibido autorizar el gate sede–rol mediante:

- sede seleccionada en interfaz;
- sede primaria o predeterminada del empleado;
- sede del check-in;
- sede del dispositivo;
- última sede utilizada;
- sede enviada por cliente, query, body, cookie o header;
- rol base;
- perfil operativo predeterminado;
- `navigation_role`;
- rol de otro turno;
- rol habilitado en otra sede;
- nombre o etiqueta del rol;
- nombre, código o tipo de sede;
- `is_default`;
- `sort_order`;
- `role_label`;
- `area_kind`;
- grant de permiso;
- recurso solicitado;
- primera fila obtenida;
- heurística por aplicación.

La existencia de un grant no crea habilitación territorial.

---

#### 11. Matriz de decisión

| Caso | Hecho concluyente | Decisión |
| ---: | --- | --- |
| 1 | `BASE_ONLY`, sin carril operativo | esta tarea no aplica |
| 2 | rol y sede exactos con habilitación site-wide activa | gate de sede satisfecho |
| 3 | rol y sede exactos con una habilitación area-scoped activa | gate de sede satisfecho; continuar a área |
| 4 | rol y sede exactos con varias habilitaciones area-scoped activas coherentes | gate de sede satisfecho; continuar a área |
| 5 | ninguna relación del rol en la sede | bloquear |
| 6 | solo relaciones inactivas o retiradas en la sede | bloquear |
| 7 | el rol está habilitado únicamente en otra sede | bloquear |
| 8 | el rol está habilitado en la sede, pero solo en otra área | gate de sede satisfecho; `ANIMA-AUTH-006` decide el área |
| 9 | rol faltante | conservar propietario anterior; no evaluar sede |
| 10 | rol desconocido, inactivo o deprecado | configuración inválida; no evaluar sede |
| 11 | sede del turno nula, inexistente o inactiva | conservar razón territorial/configuracional anterior |
| 12 | cliente propone otra sede donde el rol sí está habilitado | ignorar propuesta |
| 13 | check-in pertenece a otra sede | no sustituir la sede del turno |
| 14 | dispositivo está fijado a otra sede | no sustituir la sede del turno |
| 15 | `is_default = true` en otra relación | no sustituir |
| 16 | grant del permiso existe, pero no existe habilitación rol–sede | bloquear |
| 17 | habilitación rol–sede existe, pero falta grant | continuar; el grant se evalúa después |
| 18 | relaciones activas contradictorias | fallar cerrado por configuración |
| 19 | fuente de matriz o catálogo no verificable | fallar cerrado por indisponibilidad |
| 20 | relación retirada después de una decisión previa | invalidar y resolver de nuevo |
| 21 | simulación propone una sede distinta | no modificar autoridad real |
| 22 | coincidencia únicamente por nombre o tipo | no autorizar |

La matriz de esta tarea decide exclusivamente el gate de sede.

---

#### 12. Relaciones inactivas, retiradas o históricas

Una relación histórica no es una habilitación vigente.

```text
EXACT_ROLE_SITE_RELATIONS_EXIST
+
ACTIVE_RELATIONS = 0
->
INACTIVE_ONLY
```

`INACTIVE_ONLY` produce el mismo bloqueo público de rol no habilitado en sede cuando la lectura es concluyente.

No se reactiva una relación mediante:

- caché;
- una decisión previa;
- `is_default`;
- historial del trabajador;
- un turno anterior;
- un grant;
- una aplicación abierta.

---

#### 13. Rol habilitado únicamente en otra sede

Una coincidencia del mismo rol en otra sede no satisface el gate.

```text
role_code = exacto
+
site_id != active_shift.site_id
->
NO MATCH
```

El evaluador no puede buscar “alguna sede compatible” ni mover el turno hacia una sede donde el rol esté habilitado.

La corrección, si corresponde, debe ocurrir en la fuente administrativa propietaria y producir un contexto nuevo.

---

#### 14. Frontera con compatibilidad de área

La frontera queda:

```text
NO EXISTE NINGUNA HABILITACION ACTIVA DEL ROL EN LA SEDE
->
ANIMA-AUTH-005 BLOQUEA
```

```text
EXISTE AL MENOS UNA HABILITACION ACTIVA DEL ROL EN LA SEDE
->
ANIMA-AUTH-005 PASA
->
ANIMA-AUTH-006 EVALUA EL AREA
```

Por tanto, un rol habilitado en la sede únicamente para un área distinta no se clasifica como rol inválido para sede.

`ANIMA-AUTH-005` tampoco fabrica ni reemplaza el área para lograr una coincidencia.

---

#### 15. Frontera con sede inválida o no resoluble

Esta tarea presupone que `ANIMA-AUTH-002` ya confirmó una sede válida y activa.

Si durante la revalidación esa condición deja de sostenerse:

- no se busca otra sede;
- no se convierte la condición en rol no habilitado;
- se invalida el handoff;
- se conserva la razón territorial o de configuración propietaria.

Una sede inválida no es una ausencia ordinaria de habilitación rol–sede.

---

#### 16. Frontera con grants, permisos y recursos

La relación territorial y el grant son controles independientes.

```text
ROLE_SITE_ENABLEMENT = PRESENT
!=
OPERATIONAL_PERMISSION_GRANTED
```

```text
OPERATIONAL_PERMISSION_GRANTED
!=
ROLE_SITE_ENABLEMENT = PRESENT
```

Esta tarea no concede permisos ni valida scope o recurso.

Un rol territorialmente habilitado puede carecer del permiso solicitado. Esa denegación ocurre después de las validaciones de contexto aplicables.

---

#### 17. Razón pública y precedencia

Cuando la ausencia de habilitación sede–rol es concluyente y el carril operativo debe continuar por esa vía, se reutiliza:

```text
reason_code = AUTH_OPERATIONAL_ROLE_INVALID_FOR_SITE
public_state = OPERATIONAL_ROLE_NOT_ENABLED_FOR_ACTIVE_SITE
```

La sesión se conserva y los efectos empresariales son cero.

La precedencia relevante permanece:

```text
turno publicado
-> vigencia temporal
-> check-in cuando aplique
-> presencia del rol
-> validez del rol
-> validez de la sede
-> habilitacion rol-sede
-> compatibilidad de area
-> dispositivo y simulacion
-> grant
-> scope y recurso
```

Propiedad de causas:

- ausencia de publicación: `AUTH-ERR-009`;
- fuera de ventana: `AUTH-ERR-010`;
- check-in requerido: `AUTH-ERR-011`;
- rol faltante: `AUTH-ERR-012`;
- rol válido no habilitado en la sede: `AUTH-ERR-013`;
- rol habilitado en sede pero incompatible con área: `AUTH-ERR-014`;
- contradicción estructural: `AUTH-ERR-017`;
- indisponibilidad técnica: `AUTH-ERR-019`.

---

#### 18. Cero efectos y comportamiento de ANIMA

Una denegación en esta etapa ocurre antes de crear el contexto operativo o registrar una entrada que dependa de ese contexto.

Queda prohibido:

- crear un rol alternativo;
- cambiar la sede del turno;
- crear o modificar la matriz;
- registrar un contexto operativo parcial;
- producir una asistencia que presuponga el rol habilitado;
- ejecutar una mutación empresarial dependiente;
- reintentar automáticamente con otra sede o rol;
- conservar un `ALLOW` anterior después de retirar la habilitación.

La sesión autenticada y las capacidades base independientes que sigan autorizadas permanecen disponibles.

---

#### 19. Handoff a ANIMA-AUTH-006

Cuando el gate de sede queda satisfecho, `ANIMA-AUTH-006` recibe:

- actor efectivo;
- turno publicado y vigente;
- referencia de publicación o revisión;
- sede exacta confirmada;
- área exacta o ausencia explícita preservada;
- rol operativo canónico y activo;
- conjunto autoritativo de habilitaciones activas del rol dentro de la sede;
- indicación de existencia o ausencia de habilitación site-wide;
- relaciones area-scoped aplicables dentro de la sede;
- instante server-side de resolución;
- versiones o fingerprints disponibles.

El handoff afirma únicamente:

```text
ROLE_ENABLED_IN_SITE = TRUE
```

No afirma:

```text
ROLE_ENABLED_IN_AREA = TRUE
PERMISSION_GRANTED = TRUE
RESOURCE_IN_SCOPE = TRUE
CHECKIN_CREATED = TRUE
OPERATIONAL_CONTEXT_CREATED = TRUE
```

---

#### 20. Frescura e invalidación

Invalidan la decisión anterior:

- cambio del rol del turno;
- cambio de sede del turno;
- cambio de área del turno;
- cancelación, retiro o republicación del turno;
- activación o desactivación del rol;
- activación o desactivación de la sede;
- creación, activación, retiro o modificación de una habilitación sede–rol;
- cambio de modalidad site-wide o area-scoped;
- corrección de una referencia territorial;
- cambio de actor;
- fin de la ventana temporal;
- cambio de versión del catálogo o de la matriz.

Antes del efecto de asistencia o de la creación de contexto se revalidan los hechos necesarios. Una corrección no reactiva la solicitud anterior.

---

#### 21. Privacidad y experiencia

El bloqueo no debe revelar automáticamente:

- otras sedes donde el rol sí está habilitado;
- otras áreas de la sede;
- código interno del rol;
- identificadores internos de sede o matriz;
- relaciones inactivas;
- quién creó o retiró la habilitación;
- grants;
- permisos;
- detalles de tablas, índices o constraints;
- configuraciones alternativas.

La experiencia reutiliza el contrato de `AUTH-ERR-013`. El diseño final de la experiencia de ANIMA permanece en `ANIMA-AUTH-016` y `ANIMA-AUTH-017`.

---

#### 22. Estado físico observado y brechas de adopción

La inspección de solo lectura del estado desplegado vigente observó:

| Elemento | Resultado observado |
| --- | ---: |
| roles operativos físicos activos | 13 |
| roles canónicos consumibles por esta cadena | 12 |
| habilitaciones activas en `site_operational_roles` | 16 |
| sedes representadas por habilitaciones activas | 5 |
| pares activos distintos sede–rol | 16 |
| habilitaciones site-wide activas | 3 |
| habilitaciones area-scoped activas | 13 |
| filas activas de matriz con rol desconocido o inactivo | 0 |
| turnos laborales publicados y no cancelados | 2801 |
| turnos de ese conjunto sin rol | 1535 |
| turnos de ese conjunto con rol presente y canónico activo | 1266 |
| turnos con rol presente sin habilitación activa en su sede | 0 |
| turnos con rol habilitado en sede | 1266 |
| turnos con incompatibilidad de área después de pasar sede | 2 |

El valor cero de casos actuales de rol inválido para sede no certifica implementación.

El estado físico conserva brechas relevantes:

- `get_operational_context` agrupa rol faltante, sede y área bajo `invalid_operational_role`;
- el resolver físico combina rol, sede y área en una misma búsqueda;
- la sede activa puede construirse mediante valores seleccionados, check-in o defaults;
- existen bypasses por nombres de roles administrativos;
- la foreign key física de `site_operational_roles.role_code` permanece `NOT VALID`;
- el estado desplegado conserva un índice único legacy por `site_id + role_code`, incompatible con representar libremente varias áreas para el mismo rol en una sede;
- no se observó una foreign key física de `site_operational_roles.area_id` en el snapshot consultado;
- la aplicación ANIMA transporta hechos del turno, pero no constituye autoridad cliente para la matriz sede–rol.

Estas brechas pertenecen a la materialización física posterior y no se corrigen en esta tarea.

---

#### 23. Topología y materialización física

La definición documental se aprueba una sola vez en este marcador.

```text
MODE: PER_IMPLEMENTATION_UNIT
EXECUTION_GATE: POST_E5_PACKAGE
```

La materialización futura:

- se identifica por `implementation_unit_id`;
- requiere el package propietario y su gate E5 aplicable;
- debe resolver la habilitación en servidor;
- debe separar el gate de sede del gate de área;
- debe retirar fallbacks y razones genéricas incompatibles;
- debe preservar compatibilidad y rollback para cambios de matriz;
- no crea una instancia global implícita.

Esta tarea no autoriza migraciones, DDL, DML, backfills, RLS, RPC, Edge Functions, código de aplicación, despliegues ni cambios productivos.

---

#### 24. Requisitos de prueba derivados

NO GENERA REQUISITOS DE PRUEBA.

**Requisitos creados:** 0

**Requisitos modificados:** 0

**Requisitos diferidos:** 0

**Requisitos obsoletos:** 0

La cobertura transversal vigente ya protege la habilitación exacta del rol en sede, la separación entre sede y área, la precedencia, la equivalencia entre canales, la privacidad, la frescura y la reconciliación física. Esta tarea especializa esas obligaciones para ANIMA sin cambiar el registro.

---

#### 25. Cobertura de prueba vigente reutilizada

Sin modificarlos, se reutilizan:

- `TREQ-AUTH-249`: denegación del carril operativo cuando no existe habilitación activa del rol en la sede exacta;
- `TREQ-AUTH-250`: aplicabilidad por permiso, modalidad y carril;
- `TREQ-AUTH-251`: rol y sede procedentes de la misma revisión del turno;
- `TREQ-AUTH-252`: separación de rol faltante, sede, área, configuración, grant e indisponibilidad;
- `TREQ-AUTH-253`: precedencia del gate sede–rol antes de área, dispositivo, grant, scope y recurso;
- `TREQ-AUTH-254`: equivalencia de respuesta entre canales;
- `TREQ-AUTH-255`: cobertura por aplicación sin convertir la aplicación en autoridad;
- `TREQ-AUTH-256`: privacidad, recuperación y experiencia;
- `TREQ-AUTH-257`: invalidación y frescura;
- `TREQ-AUTH-258`: reconciliación física y regresión.

Esta enumeración es trazabilidad y no representa requisitos afectados por la tarea.

---

#### 26. Evidencia de validación

| Clase | Estado | Evidencia |
| --- | --- | --- |
| BUILD | NOT_EXECUTED | La batería real del checkout se ejecuta después de insertar y normalizar la tarea. |
| LOCAL | PASS | El artefacto aislado fue comprobado por estructura, metadata, secciones obligatorias, continuidad, UTF-8, EOL y ausencia de requisitos afectados en la sección derivada. |
| REMOTA | PASS | Se contrastaron `main`, continuidad, owner, topología, políticas, contrato de `AUTH-ERR-013`, registro 04A, migraciones, consumidor ANIMA y un snapshot Supabase de solo lectura. |
| OPERATIVA | NOT_EXECUTED | No se registró asistencia ni se ejercitó un flujo real de ANIMA. |
| FÍSICA | NOT_EXECUTED | No se ejecutaron migraciones, DDL, DML, backfills, RLS, RPC, código ni despliegues. |

---

#### 27. Criterios de aceptación

La tarea queda aceptable cuando:

1. consume exactamente el handoff de `ANIMA-AUTH-004`;
2. usa el rol canónico del turno y la sede confirmada;
3. evalúa el par exacto `role_code + site_id`;
4. exige una lectura autoritativa y concluyente;
5. una o más habilitaciones activas satisfacen el gate de sede;
6. cero habilitaciones activas producen el bloqueo de sede;
7. relaciones inactivas o retiradas no autorizan;
8. una habilitación en otra sede no autoriza;
9. `is_default` no autoriza;
10. selected site, default site, check-in, dispositivo y cliente no sustituyen la sede del turno;
11. rol base, perfil, navegación e historial no sustituyen el rol del turno;
12. grant y habilitación territorial permanecen separados;
13. una relación area-scoped dentro de la sede satisface únicamente el gate de sede;
14. una relación en otra área de la misma sede no se clasifica como sede inválida;
15. site-wide y area-scoped permanecen diferenciados;
16. varias filas area-scoped coherentes no se reducen mediante `limit 1`;
17. una configuración contradictoria falla cerrado;
18. indisponibilidad técnica no se convierte en ausencia limpia;
19. se reutiliza `AUTH_OPERATIONAL_ROLE_INVALID_FOR_SITE`;
20. la sesión se conserva;
21. los efectos empresariales son cero ante bloqueo;
22. el handoff a `ANIMA-AUTH-006` no afirma compatibilidad de área;
23. cambios de turno, rol, sede o matriz invalidan la decisión;
24. la respuesta no revela sedes o áreas alternativas;
25. el snapshot físico se registra sin presentarlo como conformidad;
26. no se crean ni modifican requisitos de prueba;
27. no se ejecutan cambios físicos.

---

#### 28. Límites

Esta tarea no define:

- publicación y vigencia del turno, propiedad de `ANIMA-AUTH-001`;
- sede del turno, propiedad de `ANIMA-AUTH-002`;
- área del turno, propiedad de `ANIMA-AUTH-003`;
- presencia y validez canónica del rol, propiedad de `ANIMA-AUTH-004`;
- compatibilidad del rol con el área, propiedad de `ANIMA-AUTH-006`;
- creación del contexto operativo, propiedad de `ANIMA-AUTH-007`;
- actualización posterior del contexto, propiedad de `ANIMA-AUTH-008`;
- cierre del contexto, propiedad de `ANIMA-AUTH-009`;
- grants, scopes o autorización de recursos;
- administración de la matriz;
- diseño final de mensajes;
- materialización física.

No crea tablas, migraciones, constraints, índices, RPC, policies, tipos, rutas ni cambios productivos.

---

#### 29. Continuidad

**ÚLTIMA TAREA APROBADA**
`ANIMA-AUTH-004 — Confirmar rol operativo del turno`

**TAREA ACTUAL APROBADA**
`ANIMA-AUTH-005 — Confirmar que el rol esté permitido en la sede`

**SIGUIENTE TAREA RESERVADA**
`ANIMA-AUTH-006 — Confirmar que el rol esté permitido en el área`


### [ ] ANIMA-AUTH-006 — Confirmar que el rol esté permitido en el área
### [ ] ANIMA-AUTH-007 — Crear contexto operativo al registrar entrada
### [ ] ANIMA-AUTH-008 — Actualizar contexto cuando cambia el turno
### [ ] ANIMA-AUTH-009 — Cerrar contexto al registrar salida
### [ ] ANIMA-AUTH-010 — Manejar descansos sin cerrar autorización
### [ ] ANIMA-AUTH-011 — Manejar cambio temporal de área
### [ ] ANIMA-AUTH-012 — Manejar reemplazos de turno
### [ ] ANIMA-AUTH-013 — Manejar turnos cruzados de medianoche
### [ ] ANIMA-AUTH-014 — Manejar cola offline de check-in
### [ ] ANIMA-AUTH-015 — Revalidar permisos al sincronizar una cola offline
### [ ] ANIMA-AUTH-016 — Mostrar diagnóstico de contexto al trabajador
### [ ] ANIMA-AUTH-017 — Diferenciar falta de turno y falta de permiso
### [ ] ANIMA-AUTH-018 — Auditar creación y cierre del contexto
### [ ] ANIMA-AUTH-019 — Evitar que ANIMA otorgue permisos directamente
### [ ] ANIMA-AUTH-020 — Mantener Supabase como fuente de verdad

ANIMA ya fue ajustado parcialmente para bloquear check-in cuando no hay turno publicado o cuando falta un rol operativo válido.
