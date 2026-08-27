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


### [ ] ANIMA-AUTH-003 — Confirmar área del turno
### [ ] ANIMA-AUTH-004 — Confirmar rol operativo del turno
### [ ] ANIMA-AUTH-005 — Confirmar que el rol esté permitido en la sede
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
