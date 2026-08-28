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

| Resultado                   | Significado                                                                                   | Continuación                                                                                  |
| --------------------------- | --------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------- |
| `RESOLVED`                  | existe exactamente una publicación laboral aplicable y temporalmente utilizable para el actor | entregar la referencia del turno y sus hechos publicados a `ANIMA-AUTH-002`                   |
| `NO_PUBLISHED_SHIFT`        | no existe publicación laboral utilizable                                                      | denegar la marcación, conservar la sesión y producir cero efectos de asistencia               |
| `AMBIGUOUS_PUBLISHED_SHIFT` | más de una publicación pretende ser aplicable y no existe resolución canónica inequívoca      | fallar cerrado; no escoger por orden, cliente, check-in ni último turno                       |
| `SOURCE_UNAVAILABLE`        | la fuente necesaria no puede resolverse de forma concluyente                                  | fallar cerrado y conservar la indisponibilidad como fallo técnico, no como ausencia ordinaria |

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

| Caso | Publicación                                                | Tiempo               | Cardinalidad    | Decisión                                                                  |
| ---- | ---------------------------------------------------------- | -------------------- | --------------- | ------------------------------------------------------------------------- |
| A    | publicada y laboral                                        | dentro de ventana    | exactamente una | `RESOLVED`                                                                |
| B    | ninguna utilizable                                         | no aplica            | cero            | `NO_PUBLISHED_SHIFT`                                                      |
| C    | borrador o no publicada                                    | cualquiera           | cero utilizable | `NO_PUBLISHED_SHIFT`                                                      |
| D    | cancelada, retirada o sustituida                           | cualquiera           | cero utilizable | `NO_PUBLISHED_SHIFT`                                                      |
| E    | publicada y laboral                                        | antes del inicio     | exactamente una | `OUTSIDE_SHIFT_WINDOW`                                                    |
| F    | publicada y laboral                                        | en o después del fin | exactamente una | `OUTSIDE_SHIFT_WINDOW`                                                    |
| G    | candidatas incompatibles                                   | cualquiera           | más de una      | `AMBIGUOUS_PUBLISHED_SHIFT`                                               |
| H    | fuente requerida no verificable                            | desconocido          | desconocida     | `SOURCE_UNAVAILABLE`                                                      |
| I    | cliente propone un turno distinto al resuelto por servidor | cualquiera           | cualquiera      | ignorar la propuesta como autoridad y conservar la resolución server-side |
| J    | existe intención offline de check-in todavía no confirmada | cualquiera           | cualquiera      | no tratar la intención local como evidencia de turno ni de asistencia     |

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

| Clase     | Estado       | Evidencia                                                                                                                            |
| --------- | ------------ | ------------------------------------------------------------------------------------------------------------------------------------ |
| BUILD     | NOT_EXECUTED | la batería real del repositorio se ejecuta después de insertar y normalizar la tarea en su rama                                      |
| LOCAL     | PASS         | artefacto único, metadata obligatoria, secciones requeridas, continuidad y regla de cero requisitos comprobadas sobre el descargable |
| REMOTA    | PASS         | owner, continuidad, topología, políticas, catálogo de prerrequisitos y cobertura 04A fueron contrastados contra `main`               |
| OPERATIVA | NOT_EXECUTED | no se ejecutó un check-in real ni se modificó comportamiento operativo durante la definición documental                              |
| FÍSICA    | NOT_EXECUTED | la materialización por unidad de implementación queda diferida al gate físico aplicable                                              |

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

| Situación observada                                                               | Clasificación contractual                 | Resultado                                                                                      |
| --------------------------------------------------------------------------------- | ----------------------------------------- | ---------------------------------------------------------------------------------------------- |
| Turno publicado resuelto, `site_id` presente, sede existente, activa y compatible | sede del turno válida                     | continuar con `ANIMA-AUTH-003`                                                                 |
| No existe turno publicado utilizable                                              | precondición de esta tarea incumplida     | conservar la razón propietaria de publicación y no evaluar una sede sintética                  |
| Turno publicado fuera de su ventana                                               | precondición temporal incumplida          | conservar la razón propietaria de temporalidad                                                 |
| `shift.site_id` nulo o ausente                                                    | sede activa operativa no resoluble        | denegar; no aplicar fallback                                                                   |
| `shift.site_id` referencia una sede inexistente                                   | configuración territorial no reproducible | fallar cerrado y conservar la razón transversal correspondiente                                |
| Sede existente pero inactiva                                                      | sede activa operativa no disponible       | denegar sin sustituirla                                                                        |
| Sede resuelta es únicamente punto técnico o de marcación no asignable             | territorio operativo inválido             | denegar sin reinterpretar su tipo                                                              |
| Actor carece de relación canónica compatible cuando es exigible                   | falta de asignación de sede               | conservar la razón transversal propietaria                                                     |
| La relación existe pero está inactiva o es contradictoria                         | no es ausencia limpia                     | conservar diagnóstico distinto y fallar cerrado                                                |
| Cliente envía otra sede                                                           | dato no autoritativo                      | ignorar como fuente y no cambiar el turno                                                      |
| Punto de check-in pertenece a otra sede                                           | no reemplaza `shift.site_id`              | conservar sede publicada; la compatibilidad de marcación se resuelve en su control propietario |
| Fuente territorial no puede verificarse                                           | indisponibilidad técnica                  | no convertir en ausencia de sede ni continuar                                                  |
| Cambio concurrente invalida publicación o sede antes del efecto                   | decisión obsoleta                         | revalidar o exigir nueva solicitud                                                             |

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

| Clase     | Estado       | Evidencia                                                                                                                                                   |
| --------- | ------------ | ----------------------------------------------------------------------------------------------------------------------------------------------------------- |
| BUILD     | NOT_EXECUTED | la batería real del checkout se ejecuta después de insertar y normalizar la tarea en su rama                                                                |
| LOCAL     | PASS         | artefacto único, metadata obligatoria, secciones requeridas, continuidad, cero requisitos derivados y representación UTF-8 comprobados sobre el descargable |
| REMOTA    | PASS         | continuidad, owner, topología, políticas, modelo de sede, publicación de turno, 04A, razones y consumidor ANIMA fueron contrastados contra `main`           |
| OPERATIVA | NOT_EXECUTED | no se registró una entrada real ni se alteró comportamiento de asistencia durante esta definición                                                           |
| FÍSICA    | NOT_EXECUTED | la materialización por unidad de implementación permanece diferida al gate físico aplicable                                                                 |

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

| Situación                                        | Decisión                     | Handoff                  |
| ------------------------------------------------ | ---------------------------- | ------------------------ |
| `area_id` válido, activo y de la sede confirmada | confirmar                    | área válida              |
| `area_id = null`                                 | conservar ausencia explícita | `area_id = null`         |
| área inexistente                                 | bloquear                     | ninguno                  |
| área inactiva                                    | bloquear                     | ninguno                  |
| área de otra sede                                | bloquear                     | ninguno                  |
| coincidencia solo por nombre o tipo              | no sustituir                 | ninguno                  |
| `employee_areas` vacío y turno con área válida   | no bloquear                  | área del turno           |
| `employee_areas` contiene otra área              | no sustituir                 | área del turno           |
| cliente propone otra área                        | ignorar como autoridad       | resolución server-side   |
| check-in o dispositivo aporta otra área          | no sustituir                 | área del turno           |
| fuente no verificable                            | bloquear                     | indisponibilidad técnica |
| publicación cambia durante la evaluación         | invalidar                    | nueva resolución         |

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

| Clase     | Estado       | Evidencia                                                                                                                            |
| --------- | ------------ | ------------------------------------------------------------------------------------------------------------------------------------ |
| BUILD     | NOT_EXECUTED | La batería real del checkout se ejecuta después de insertar y normalizar la tarea.                                                   |
| LOCAL     | PASS         | El artefacto aislado fue comprobado por estructura, metadata, secciones, continuidad, UTF-8, EOL y cero TREQ en la sección derivada. |
| REMOTA    | PASS         | Se contrastaron en `main` continuidad, owner, topología, políticas, modelo de áreas, catálogo, 04A y superficies físicas relevantes. |
| OPERATIVA | NOT_EXECUTED | No se registró asistencia ni se alteró el comportamiento real de ANIMA.                                                              |
| FÍSICA    | NOT_EXECUTED | No se ejecutaron migraciones, datos, código, RLS, RPC ni despliegues.                                                                |

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

| Estado observado                          | Interpretación                                | Tratamiento                                     |
| ----------------------------------------- | --------------------------------------------- | ----------------------------------------------- |
| `null`, vacío u omitido                   | ausencia limpia y concluyente                 | `AUTH_OPERATIONAL_ROLE_REQUIRED`                |
| código existente y activo                 | identidad operativa confirmada                | continuar                                       |
| código inexistente                        | referencia administrada inválida              | fallar cerrado como configuración inconsistente |
| código inactivo o deprecado               | turno publicado contra catálogo no utilizable | fallar cerrado como configuración inconsistente |
| catálogo no verificable                   | indisponibilidad técnica                      | fallar cerrado como fallo técnico               |
| dos snapshots autoritativos incompatibles | resolución no reproducible                    | fallar cerrado como configuración inconsistente |

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

| Entrada observada                                             | Decisión de esta tarea                  | Continuación                                         |
| ------------------------------------------------------------- | --------------------------------------- | ---------------------------------------------------- |
| rol presente, código canónico y activo                        | confirmar identidad del rol             | `ANIMA-AUTH-005`                                     |
| rol `null`                                                    | bloquear                                | no continuar                                         |
| rol vacío o whitespace                                        | normalizar a ausencia limpia y bloquear | no continuar                                         |
| rol omitido en la revisión publicada                          | bloquear                                | no continuar                                         |
| rol base coincide con uno operativo pero el turno no trae rol | no inferir                              | no continuar                                         |
| perfil predeterminado contiene rol pero el turno no           | no inferir                              | no continuar                                         |
| dispositivo declara `navigation_role`                         | no inferir                              | no continuar                                         |
| cliente propone `role_code`                                   | ignorar como autoridad                  | conservar resolución server-side                     |
| último turno contiene rol                                     | no reutilizar                           | conservar turno actual                               |
| código presente pero inexistente en catálogo                  | configuración inconsistente             | no continuar                                         |
| código presente pero inactivo                                 | configuración inconsistente             | no continuar                                         |
| rol válido pero no habilitado en la sede                      | fuera del alcance de esta tarea         | entregar a `ANIMA-AUTH-005`                          |
| rol válido pero incompatible con el área                      | fuera del alcance de esta tarea         | entregar a `ANIMA-AUTH-005` y luego `ANIMA-AUTH-006` |
| catálogo no disponible o lectura no verificable               | fallo técnico                           | no continuar                                         |
| publicación cambia durante la evaluación                      | invalidar snapshot                      | resolver de nuevo                                    |

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

| Clase     | Estado       | Evidencia                                                                                                                                                            |
| --------- | ------------ | -------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| BUILD     | NOT_EXECUTED | La batería real del checkout se ejecuta después de insertar y normalizar la tarea en su rama documental.                                                             |
| LOCAL     | PASS         | El artefacto aislado fue comprobado por estructura, metadata obligatoria, secciones requeridas, continuidad, UTF-8, EOL y ausencia de TREQ en la sección derivada.   |
| REMOTA    | PASS         | Se contrastaron en `main` continuidad, owner, topología, políticas, catálogo operativo, migraciones de turno, contratos AUTH-ERR, 04A y el consumidor ANIMA vigente. |
| OPERATIVA | NOT_EXECUTED | No se registró asistencia ni se modificó comportamiento operativo de ANIMA durante esta definición.                                                                  |
| FÍSICA    | NOT_EXECUTED | No se ejecutaron migraciones, datos, RLS, RPC, código, Auth ni despliegues.                                                                                          |

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

| Estado                | Significado                                                                          | Continuación                                                   |
| --------------------- | ------------------------------------------------------------------------------------ | -------------------------------------------------------------- |
| `PRESENT_SITE_WIDE`   | existe una habilitación activa del rol para la sede con alcance site-wide            | continuar a `ANIMA-AUTH-006`                                   |
| `PRESENT_AREA_SCOPED` | existe una o más habilitaciones activas del rol dentro de la sede, acotadas por área | el gate de sede queda satisfecho; continuar a `ANIMA-AUTH-006` |
| `CONCLUSIVE_ABSENT`   | no existe habilitación activa del rol en la sede                                     | bloquear el carril operativo                                   |
| `INACTIVE_ONLY`       | solo existen relaciones inactivas o retiradas para ese par                           | bloquear el carril operativo                                   |
| `CONTRADICTORY`       | las fuentes o versiones producen una configuración incompatible                      | fallar cerrado por configuración                               |
| `UNAVAILABLE`         | la fuente necesaria no pudo verificarse                                              | fallar cerrado por indisponibilidad técnica                    |

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

| Caso | Hecho concluyente                                                           | Decisión                                                 |
| ---: | --------------------------------------------------------------------------- | -------------------------------------------------------- |
|    1 | `BASE_ONLY`, sin carril operativo                                           | esta tarea no aplica                                     |
|    2 | rol y sede exactos con habilitación site-wide activa                        | gate de sede satisfecho                                  |
|    3 | rol y sede exactos con una habilitación area-scoped activa                  | gate de sede satisfecho; continuar a área                |
|    4 | rol y sede exactos con varias habilitaciones area-scoped activas coherentes | gate de sede satisfecho; continuar a área                |
|    5 | ninguna relación del rol en la sede                                         | bloquear                                                 |
|    6 | solo relaciones inactivas o retiradas en la sede                            | bloquear                                                 |
|    7 | el rol está habilitado únicamente en otra sede                              | bloquear                                                 |
|    8 | el rol está habilitado en la sede, pero solo en otra área                   | gate de sede satisfecho; `ANIMA-AUTH-006` decide el área |
|    9 | rol faltante                                                                | conservar propietario anterior; no evaluar sede          |
|   10 | rol desconocido, inactivo o deprecado                                       | configuración inválida; no evaluar sede                  |
|   11 | sede del turno nula, inexistente o inactiva                                 | conservar razón territorial/configuracional anterior     |
|   12 | cliente propone otra sede donde el rol sí está habilitado                   | ignorar propuesta                                        |
|   13 | check-in pertenece a otra sede                                              | no sustituir la sede del turno                           |
|   14 | dispositivo está fijado a otra sede                                         | no sustituir la sede del turno                           |
|   15 | `is_default = true` en otra relación                                        | no sustituir                                             |
|   16 | grant del permiso existe, pero no existe habilitación rol–sede              | bloquear                                                 |
|   17 | habilitación rol–sede existe, pero falta grant                              | continuar; el grant se evalúa después                    |
|   18 | relaciones activas contradictorias                                          | fallar cerrado por configuración                         |
|   19 | fuente de matriz o catálogo no verificable                                  | fallar cerrado por indisponibilidad                      |
|   20 | relación retirada después de una decisión previa                            | invalidar y resolver de nuevo                            |
|   21 | simulación propone una sede distinta                                        | no modificar autoridad real                              |
|   22 | coincidencia únicamente por nombre o tipo                                   | no autorizar                                             |

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

| Elemento                                                   | Resultado observado |
| ---------------------------------------------------------- | ------------------: |
| roles operativos físicos activos                           |                  13 |
| roles canónicos consumibles por esta cadena                |                  12 |
| habilitaciones activas en `site_operational_roles`         |                  16 |
| sedes representadas por habilitaciones activas             |                   5 |
| pares activos distintos sede–rol                           |                  16 |
| habilitaciones site-wide activas                           |                   3 |
| habilitaciones area-scoped activas                         |                  13 |
| filas activas de matriz con rol desconocido o inactivo     |                   0 |
| turnos laborales publicados y no cancelados                |                2801 |
| turnos de ese conjunto sin rol                             |                1535 |
| turnos de ese conjunto con rol presente y canónico activo  |                1266 |
| turnos con rol presente sin habilitación activa en su sede |                   0 |
| turnos con rol habilitado en sede                          |                1266 |
| turnos con incompatibilidad de área después de pasar sede  |                   2 |

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

| Clase     | Estado       | Evidencia                                                                                                                                                                         |
| --------- | ------------ | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| BUILD     | NOT_EXECUTED | La batería real del checkout se ejecuta después de insertar y normalizar la tarea.                                                                                                |
| LOCAL     | PASS         | El artefacto aislado fue comprobado por estructura, metadata, secciones obligatorias, continuidad, UTF-8, EOL y ausencia de requisitos afectados en la sección derivada.          |
| REMOTA    | PASS         | Se contrastaron `main`, continuidad, owner, topología, políticas, contrato de `AUTH-ERR-013`, registro 04A, migraciones, consumidor ANIMA y un snapshot Supabase de solo lectura. |
| OPERATIVA | NOT_EXECUTED | No se registró asistencia ni se ejercitó un flujo real de ANIMA.                                                                                                                  |
| FÍSICA    | NOT_EXECUTED | No se ejecutaron migraciones, DDL, DML, backfills, RLS, RPC, código ni despliegues.                                                                                               |

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


### ✅ ANIMA-AUTH-006 — Confirmar que el rol esté permitido en el área

**Estado:** APROBADA
**Tarea anterior:** ANIMA-AUTH-005 — Confirmar que el rol esté permitido en la sede
**Tarea siguiente:** ANIMA-AUTH-007 — Crear contexto operativo al registrar entrada
**Tipo de tarea:** documental; definición contractual de la compatibilidad del rol operativo canónico del turno con el área exacta ya confirmada, después de satisfacer la habilitación del rol en la sede y antes de crear el contexto operativo de ANIMA
**Bloque:** F_ANIMA — AUTORIZACIÓN Y CONTEXTO OPERATIVO
**Repositorio propietario:** vento-group-sas/vento-shell
**Archivo propietario:** docs/plan-canonico/modular/bloques/F_ANIMA/01_AUTORIZACION_Y_CONTEXTO_OPERATIVO.md
**Estado físico resultante:** contrato documental definido; materialización física diferida por unidad de implementación
**Cambios físicos autorizados:** ninguno durante esta tarea documental; la materialización futura queda sujeta a la topología PER_IMPLEMENTATION_UNIT y al gate POST_E5_PACKAGE
**Requisitos de prueba creados o modificados:** 0

---

#### 1. Propósito

Definir cómo ANIMA confirma que el rol operativo canónico y activo del turno, ya habilitado para la sede por `ANIMA-AUTH-005`, puede operar dentro del área exacta publicada en ese mismo turno o, cuando el turno conserva ausencia explícita de área, si la habilitación site-wide permite continuar sin fabricar una.

La decisión responde exclusivamente:

```text
¿LA HABILITACION TERRITORIAL DEL ROL
CUBRE EL AREA EXACTA DEL TURNO
O CUBRE TODA LA SEDE MEDIANTE SITE-WIDE?
```

La tarea no selecciona otra área, no modifica el turno, no concede permisos y no crea todavía el contexto operativo.

---

#### 2. Entrada contractual desde ANIMA-AUTH-005

El handoff consumido conserva, como mínimo:

- actor efectivo;
- turno laboral publicado, vigente e inequívoco;
- referencia de publicación o revisión disponible;
- sede exacta confirmada;
- área exacta confirmada o ausencia explícita preservada;
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

#### 3. Resultado de esta etapa

La evaluación produce uno de los siguientes estados contractuales:

| Estado                       | Significado                                                                                                            | Continuación                                          |
| ---------------------------- | ---------------------------------------------------------------------------------------------------------------------- | ----------------------------------------------------- |
| `PRESENT_SITE_WIDE`          | existe una habilitación activa site-wide para el rol en la sede                                                        | gate de área satisfecho; continuar a `ANIMA-AUTH-007` |
| `PRESENT_EXACT_AREA`         | existe una habilitación activa para el área exacta del turno                                                           | gate de área satisfecho; continuar a `ANIMA-AUTH-007` |
| `AREA_NULL_SITE_WIDE`        | el turno conserva `area_id = null` y el rol está habilitado site-wide                                                  | gate de área satisfecho sin fabricar área             |
| `PRESENT_OTHER_AREA_ONLY`    | el área del turno es válida, pero el rol solo está habilitado en otra área de la misma sede                            | bloquear el carril operativo                          |
| `INACTIVE_EXACT_AREA_ONLY`   | existió relación para el área exacta, pero ya no está activa, mientras el rol sigue habilitado en otra área de la sede | bloquear el carril operativo                          |
| `AREA_NULL_AREA_SCOPED_ONLY` | el turno no aporta área y el rol solo tiene habilitaciones area-scoped                                                 | configuración o contexto inválido; no elegir área     |
| `CONTRADICTORY`              | matriz, revisión o cardinalidad impiden una decisión única                                                             | fallar cerrado por configuración                      |
| `UNAVAILABLE`                | la fuente necesaria no pudo verificarse                                                                                | fallar cerrado por indisponibilidad técnica           |

`PRESENT_OTHER_AREA_ONLY` e `INACTIVE_EXACT_AREA_ONLY` reutilizan el bloqueo canónico de rol inválido para área. `AREA_NULL_AREA_SCOPED_ONLY` no se degrada a ese bloqueo porque no existe un área válida contra la cual probar incompatibilidad ordinaria.

---

#### 4. Fuentes autoritativas de rol, sede y área

Rol, sede y área proceden de la misma revisión publicada del turno:

```text
active_shift.operational_role_code
active_shift.site_id
active_shift.area_id
```

La matriz se consume desde el contrato canónico equivalente a:

```text
site_operational_roles
WHERE role_code = active_shift.operational_role_code
  AND site_id = active_shift.site_id
  AND is_active = true
```

La compatibilidad se decide mediante identidad estable:

```text
area_id IS NULL en la habilitacion
-> SITE_WIDE

area_id = active_shift.area_id
-> EXACT_AREA

area_id distinto
-> NO CUBRE EL AREA DEL TURNO
```

La lectura debe usar el conjunto completo aplicable al rol y la sede. El orden físico de filas no participa en la decisión.

---

#### 5. Identidad exacta rol–sede–área

Cuando existe un área concreta en el turno, la identidad evaluada es:

```text
ROLE_SITE_AREA_KEY =
(
  active_shift.operational_role_code,
  active_shift.site_id,
  active_shift.area_id
)
```

La comparación es por identificadores estables.

No son equivalentes:

```text
role_code
!= role_label
!= role_family

site_id
!= site_code
!= site_name
!= site_kind

area_id
!= area_code
!= area_name
!= area_kind
```

La coincidencia semántica de nombre, tipo o etiqueta no crea compatibilidad.

---

#### 6. Semántica exacta de compatibilidad de área

Con un área concreta, válida y perteneciente a la sede del turno:

```text
SITE_WIDE_ENABLEMENT = PRESENT
OR
EXACT_AREA_ENABLEMENT = PRESENT
->
AREA_GATE = SATISFIED
```

Si no existe habilitación site-wide:

```text
AREA_ID = VALID
AND
ACTIVE_ENABLEMENTS_IN_SITE >= 1
AND
EXACT_AREA_ENABLEMENT = ABSENT
AND
READ = CONCLUSIVE
->
AREA_GATE = DENIED
```

No basta con que el rol exista en la sede. Debe existir cobertura site-wide o coincidencia exacta con el área del turno.

---

#### 7. Validez previa del área

`ANIMA-AUTH-003` ya resolvió el área publicada.

Cuando `area_id` está presente, esta tarea presupone que:

1. el identificador existe;
2. el área está activa;
3. pertenece a la sede exacta del turno;
4. la resolución fue concluyente;
5. el área procede de la misma revisión publicada.

Si cualquiera de esos hechos deja de sostenerse durante la revalidación, el handoff se invalida.

Un área nula, inexistente, inactiva, perteneciente a otra sede o ambigua no puede ser convertida en una incompatibilidad ordinaria de rol–área.

---

#### 8. Habilitación site-wide

Una habilitación activa con:

```text
site_operational_roles.area_id = null
```

representa alcance site-wide del rol dentro de la sede.

Consecuencias:

- satisface el gate territorial de esta tarea para cualquier área válida de esa sede;
- también permite continuar cuando el turno conserva ausencia explícita de área;
- no concede el permiso solicitado;
- no amplía el scope de un recurso;
- no convierte un área inválida o ajena a la sede en válida;
- no autoriza otra sede;
- no crea un área física ni lógica.

El alcance site-wide pertenece a la relación de la matriz, no a que el turno tenga `area_id = null`.

---

#### 9. Habilitación area-scoped y operación multiárea

Una relación activa con `area_id` concreto representa una habilitación area-scoped.

Cuando el rol opera en varias áreas de una sede, la matriz contractual debe poder representar varias identidades:

```text
(role_code, site_id, area_id_A)
(role_code, site_id, area_id_B)
(role_code, site_id, area_id_C)
```

Cada relación cubre exclusivamente su área exacta.

Queda prohibido:

- escoger la primera relación;
- escoger el área predeterminada;
- reducir varias relaciones a un único par `site_id + role_code`;
- comparar solo `area_kind`;
- heredar cobertura desde un área hermana;
- interpretar una relación en otra área como permiso para toda la sede.

Varias relaciones area-scoped coherentes no son una contradicción. Son la cardinalidad contractual necesaria para un rol multiárea.

---

#### 10. Ausencia explícita de área

El handoff puede conservar:

```text
active_shift.area_id = null
```

La decisión depende del alcance territorial del rol.

Caso site-wide:

```text
area_id = null
+
PRESENT_SITE_WIDE
->
AREA_GATE = SATISFIED
->
NO FABRICAR AREA
```

Caso area-scoped:

```text
area_id = null
+
NO SITE_WIDE
+
PRESENT_AREA_SCOPED
->
AREA_NULL_AREA_SCOPED_ONLY
->
CONFIGURACION O CONTEXTO INVALIDO
->
NO ELEGIR AREA
```

La ausencia de área no funciona como wildcard.

Una relación area-scoped no puede autorizar un turno sin área mediante la condición `area_id is null`.

---

#### 11. Fuentes que no pueden sustituir el área

Queda prohibido completar o sustituir el área mediante:

- área del check-in;
- área seleccionada en interfaz;
- área primaria o predeterminada del empleado;
- área del dispositivo;
- área de otro turno;
- última área utilizada;
- cookie, query, body o header;
- primer área de la sede;
- `area_kind`;
- nombre o código textual;
- perfil operativo predeterminado;
- recurso solicitado;
- ubicación física del dispositivo;
- grant del permiso;
- aplicación abierta;
- heurística por rol;
- una simulación presentada como contexto real.

ANIMA puede transportar el área publicada para UX y correlación, pero no puede convertir el estado del cliente en autoridad territorial.

---

#### 12. Matriz de decisión

| Caso | Hecho concluyente                                                                         | Decisión                                               |
| ---: | ----------------------------------------------------------------------------------------- | ------------------------------------------------------ |
|    1 | `BASE_ONLY`, sin carril operativo                                                         | esta tarea no aplica                                   |
|    2 | área válida y habilitación site-wide activa                                               | gate satisfecho                                        |
|    3 | área válida y habilitación activa exacta                                                  | gate satisfecho                                        |
|    4 | área válida y varias relaciones area-scoped, incluida la exacta                           | gate satisfecho                                        |
|    5 | área válida y el rol solo está habilitado en otra área de la misma sede                   | `AUTH_OPERATIONAL_ROLE_INVALID_FOR_AREA`               |
|    6 | relación exacta inactiva, pero otra relación activa mantiene el rol habilitado en la sede | `AUTH_OPERATIONAL_ROLE_INVALID_FOR_AREA`               |
|    7 | mismo nombre de área, identificador distinto                                              | no equivale; bloquear si no existe coincidencia exacta |
|    8 | mismo `area_kind`, identificador distinto                                                 | no equivale; bloquear si no existe coincidencia exacta |
|    9 | `area_id = null` y existe habilitación site-wide                                          | continuar sin fabricar área                            |
|   10 | `area_id = null` y solo existen habilitaciones area-scoped                                | configuración o contexto inválido                      |
|   11 | área inexistente                                                                          | configuración o contexto inválido                      |
|   12 | área inactiva                                                                             | configuración o contexto inválido                      |
|   13 | área perteneciente a otra sede                                                            | configuración o contexto inválido                      |
|   14 | no existe ninguna habilitación activa del rol en la sede                                  | conservar propietario anterior; `ANIMA-AUTH-005`       |
|   15 | rol faltante                                                                              | conservar propietario anterior; `ANIMA-AUTH-004`       |
|   16 | rol desconocido, inactivo o deprecado                                                     | configuración inválida                                 |
|   17 | cliente propone un área compatible distinta                                               | ignorar propuesta                                      |
|   18 | check-in contiene otra área                                                               | no sustituir el turno                                  |
|   19 | dispositivo o perfil contienen un área compatible                                         | no sustituir el turno                                  |
|   20 | grant existe, pero el área es incompatible                                                | bloquear por área                                      |
|   21 | área compatible, pero grant falta                                                         | continuar; grant posterior                             |
|   22 | configuración activa mezcla site-wide y area-scoped sin regla versionada                  | configuración contradictoria                           |
|   23 | cardinalidad o revisión impiden una lectura única                                         | configuración contradictoria                           |
|   24 | fuente de área, catálogo o matriz no disponible                                           | indisponibilidad técnica                               |

La matriz decide únicamente la compatibilidad territorial de área.

---

#### 13. Relaciones inactivas o retiradas

Una relación histórica no concede autoridad.

Con área exacta:

```text
EXACT_AREA_RELATION_EXISTS
+
EXACT_AREA_ACTIVE = FALSE
+
OTHER_ACTIVE_ENABLEMENT_IN_SITE = TRUE
->
INACTIVE_EXACT_AREA_ONLY
```

La recuperación no reactiva la relación desde caché, historial, `is_default`, un grant o una decisión anterior.

La fuente administrativa debe corregirse o reactivarse por su flujo propietario y la solicitud posterior debe resolver un contexto nuevo.

---

#### 14. Nombres, tipos y equivalencias semánticas

La compatibilidad utiliza `area_id`.

No se autoriza por:

```text
area_name igual
area_code parecido
area_kind igual
misma funcion operativa
misma ubicacion fisica aparente
misma etiqueta visual
```

Dos áreas con el mismo `kind` siguen siendo territorios distintos si sus identificadores son distintos.

La equivalencia semántica solo puede existir mediante un contrato explícito y versionado. No se infiere durante autorización.

---

#### 15. Frontera con la habilitación de sede

La frontera con `ANIMA-AUTH-005` permanece:

```text
ACTIVE_ENABLEMENTS_FOR_ROLE_AND_SITE = 0
->
ANIMA-AUTH-005 BLOQUEA
```

```text
ACTIVE_ENABLEMENTS_FOR_ROLE_AND_SITE >= 1
->
ANIMA-AUTH-005 PASA
->
ANIMA-AUTH-006 EVALUA AREA
```

Por tanto, una relación activa del rol en otra área de la misma sede demuestra que el gate de sede ya fue satisfecho, pero no que el área del turno sea compatible.

Si un cambio concurrente retira la última habilitación de la sede, esta tarea no convierte el caso en área inválida: invalida el handoff y obliga a reejecutar la cadena desde el propietario anterior.

---

#### 16. Frontera con área inválida o no resoluble

Cuando existe una relación area-scoped, un área ausente o inválida no es una incompatibilidad ordinaria.

Propiedad de causas:

| Situación                                                                 | Propietario    |
| ------------------------------------------------------------------------- | -------------- |
| rol faltante                                                              | `AUTH-ERR-012` |
| rol canónico sin habilitación en sede                                     | `AUTH-ERR-013` |
| área válida, rol habilitado en sede, sin site-wide ni coincidencia exacta | `AUTH-ERR-014` |
| área nula bajo alcance exclusivamente area-scoped                         | `AUTH-ERR-017` |
| área inexistente, inactiva, ajena a la sede o contradictoria              | `AUTH-ERR-017` |
| matriz o revisión contradictoria                                          | `AUTH-ERR-017` |
| fuente no verificable                                                     | `AUTH-ERR-019` |

La razón pública de área incompatible exige primero un área válida.

---

#### 17. Frontera con grants, scope y recurso

La compatibilidad territorial no concede el permiso.

```text
AREA_GATE = SATISFIED
!=
OPERATIONAL_GRANT = PRESENT
```

Un grant tampoco corrige el territorio:

```text
OPERATIONAL_GRANT = PRESENT
+
AREA_GATE = DENIED
->
AUTH_OPERATIONAL_ROLE_INVALID_FOR_AREA
```

Después del gate de área, los consumidores posteriores pueden evaluar grants, scope y recurso según sus contratos propietarios.

Esta tarea no decide si el recurso pertenece al área ni si la capacidad requiere un área para un propósito adicional.

---

#### 18. Razón pública y precedencia

Cuando existe un área válida y la lectura concluyente demuestra que el rol está habilitado en la sede, pero no site-wide ni para el área exacta, se reutiliza:

```text
reason_code = AUTH_OPERATIONAL_ROLE_INVALID_FOR_AREA
public_state = OPERATIONAL_ROLE_NOT_ENABLED_FOR_ACTIVE_AREA
```

La sesión se conserva. El carril operativo queda denegado. Si la modalidad permite un carril base independiente completo, ese carril conserva su evaluación propia.

La precedencia relevante permanece:

```text
turno publicado
-> vigencia temporal
-> check-in cuando aplique
-> presencia del rol
-> validez del rol
-> validez de la sede
-> habilitacion rol-sede
-> validez o ausencia explicita del area
-> compatibilidad rol-area
-> dispositivo y simulacion
-> grant
-> scope y recurso
```

La primera causa concluyente aplicable prevalece.

---

#### 19. Cero efectos y comportamiento de ANIMA

Una denegación o invalidación en esta etapa ocurre antes de registrar una entrada que dependa del contexto operativo validado.

Queda prohibido:

- crear un área alternativa;
- cambiar el área del turno;
- cambiar el rol o la sede;
- modificar la matriz;
- crear contexto operativo parcial;
- registrar como exitosa una entrada que dependa de un contexto incompatible;
- usar un grant como bypass territorial;
- reintentar con otra área;
- conservar un `ALLOW` anterior después de retirar la relación;
- ejecutar efectos empresariales dependientes del contexto.

Las capacidades base independientes que sigan autorizadas permanecen disponibles.

---

#### 20. Handoff a ANIMA-AUTH-007

Cuando el gate de área queda satisfecho, `ANIMA-AUTH-007` recibe:

- actor efectivo;
- turno laboral publicado, vigente e inequívoco;
- referencia de publicación o revisión;
- sede exacta confirmada;
- área exacta confirmada o ausencia explícita compatible con site-wide;
- rol operativo canónico y activo;
- confirmación de habilitación del rol en la sede;
- confirmación de compatibilidad territorial por `SITE_WIDE` o `EXACT_AREA`;
- estado de check-in cuando la cadena aplicable ya lo exige;
- instante server-side de resolución;
- versiones o fingerprints disponibles.

El handoff afirma:

```text
ROLE_ENABLED_IN_SITE = TRUE
ROLE_AREA_COMPATIBILITY = SATISFIED
```

No afirma:

```text
PERMISSION_GRANTED = TRUE
RESOURCE_IN_SCOPE = TRUE
OPERATIONAL_CONTEXT_CREATED = TRUE
ATTENDANCE_INSERTED = TRUE
```

`ANIMA-AUTH-007` conserva la propiedad exclusiva de crear el contexto operativo al registrar entrada.

---

#### 21. Frescura e invalidación

Invalidan la decisión anterior:

- cambio del rol del turno;
- cambio de sede o área del turno;
- cancelación, retiro o republicación;
- activación o desactivación del rol;
- activación o desactivación de sede o área;
- corrección de pertenencia área–sede;
- creación, activación, retiro o modificación de habilitaciones;
- cambio entre site-wide y area-scoped;
- nueva relación multiárea;
- cambio de actor;
- fin de la ventana temporal;
- cambio de versión de catálogo o matriz;
- detección de contradicción posterior.

Antes del efecto de asistencia o de la creación de contexto se revalidan los hechos necesarios.

Una corrección nunca reanuda automáticamente la solicitud anterior.

---

#### 22. Privacidad y experiencia

El bloqueo no debe revelar automáticamente:

- otras áreas donde el rol sí está habilitado;
- áreas alternativas de la sede;
- código interno del rol;
- identificadores internos de sede, área o matriz;
- relaciones inactivas;
- quién creó o retiró la relación;
- grants;
- permisos;
- detalles de tablas, índices o constraints.

La experiencia reutiliza el contrato de `AUTH-ERR-014`.

El diseño final del diagnóstico visible de ANIMA permanece en `ANIMA-AUTH-016` y `ANIMA-AUTH-017`.

---

#### 23. Estado físico observado

La inspección de solo lectura del estado desplegado vigente observó:

| Elemento                                                       | Resultado |
| -------------------------------------------------------------- | --------: |
| roles operativos físicos activos                               |        13 |
| roles canónicos consumibles por esta cadena                    |        12 |
| habilitaciones activas en `site_operational_roles`             |        16 |
| sedes representadas por habilitaciones activas                 |         5 |
| pares activos distintos sede–rol                               |        16 |
| habilitaciones site-wide activas                               |         3 |
| habilitaciones area-scoped activas                             |        13 |
| habilitaciones activas con rol desconocido                     |         0 |
| habilitaciones activas con rol inactivo                        |         0 |
| relaciones area-scoped con área inexistente                    |         0 |
| relaciones area-scoped con área inactiva                       |         0 |
| relaciones area-scoped cuyo área pertenece a otra sede         |         0 |
| pares activos con mezcla site-wide y area-scoped               |         0 |
| turnos laborales publicados y no cancelados                    |      2801 |
| turnos de ese conjunto sin rol                                 |      1535 |
| turnos con rol presente y canónico activo                      |      1266 |
| turnos con rol no habilitado en la sede                        |         0 |
| turnos con rol habilitado en la sede                           |      1266 |
| turnos compatibles por habilitación site-wide                  |       144 |
| turnos compatibles por coincidencia de área exacta             |      1120 |
| turnos con área presente y sin coincidencia exacta             |         0 |
| turnos con área nula y habilitación exclusivamente area-scoped |         2 |

Los 144 turnos cubiertos por site-wide conservan `area_id = null` en el snapshot consultado y no requieren que ANIMA fabrique un área.

Los dos casos con `area_id = null` y alcance exclusivamente area-scoped corresponden, de forma agregada y sin identificar trabajadores, a `SAUDO` con rol `cocinero_satelite`. El contrato los clasifica como configuración o contexto inválido, no como una incompatibilidad ordinaria contra un área concreta.

Las cifras son una observación dinámica. No certifican implementación, no alteran requisitos históricos y no autorizan correcciones automáticas de datos.

---

#### 24. Brechas físicas de adopción

El estado físico conserva brechas directamente relevantes:

1. `get_operational_context` combina rol y área y emite `invalid_operational_role` tanto para fallos diferentes como para una ausencia de coincidencia territorial;
2. `has_operational_permission` admite la condición `v_area_id is null` como rama permisiva dentro del chequeo de `site_operational_roles`;
3. `has_operational_role_permission` admite igualmente `p_area_id is null` como rama permisiva;
4. esas ramas pueden convertir ausencia de área en wildcard frente a una relación area-scoped;
5. el índice legacy único por `site_id + role_code` impide representar varias áreas simultáneas para el mismo rol dentro de una sede;
6. existe además un índice por `site_id + coalesce(area_id) + role_code`, pero el índice legacy más restrictivo sigue limitando la cardinalidad;
7. la foreign key desplegada de `site_operational_roles.role_code` permanece `NOT VALID`;
8. el conjunto de constraints desplegado no contiene una foreign key de `site_operational_roles.area_id` a `areas(id)`, aunque una migración posterior define esa referencia al crear la tabla desde cero;
9. ANIMA transporta `area_id` y `operational_role` desde el turno en su flujo de asistencia, pero no consume `site_operational_roles` como autoridad cliente;
10. por tanto, la decisión final debe permanecer server-side y no puede delegarse al estado React, geofence, selección o payload del dispositivo.

Destinos ya existentes para la materialización:

- integridad, cardinalidad y catálogo: `AUTH-DB-020` y `AUTH-DB-030`;
- resolución de hechos de turno y territorio: `AUTH-DB-033`;
- evaluación, precedencia y razones: `AUTH-DB-034`;
- invalidación y frescura: `AUTH-DB-035`;
- contratos y consumidores compartidos: `SHELL-AUTH-002`, `SHELL-AUTH-004` y `SHELL-AUTH-005`;
- adopción específica de este contrato: la instancia futura correspondiente de `ANIMA-AUTH-006` por unidad de implementación.

No se crea una tarea adicional.

---

#### 25. Topología y materialización física

La definición documental se aprueba una sola vez en este marcador.

```text
MODE = PER_IMPLEMENTATION_UNIT
EXECUTION_GATE = POST_E5_PACKAGE
INSTANCE_PATTERN = ANIMA-AUTH-006::<implementation_unit_id>
```

La materialización futura:

- requiere una unidad de implementación real;
- requiere el paquete propietario aplicable;
- requiere el gate E5 correspondiente antes de ejecutar cambios;
- debe separar compatibilidad de sede y compatibilidad de área;
- debe tratar el área nula como ausencia, nunca como wildcard;
- debe soportar cardinalidad multiárea cuando el contrato la requiera;
- debe resolver la matriz en servidor;
- no crea una instancia global implícita.

Esta tarea documental no autoriza migraciones, DDL, DML, backfills, RLS, RPC, Edge Functions, código de aplicación, despliegues ni cambios productivos.

---

#### 26. Requisitos de prueba derivados

NO GENERA REQUISITOS DE PRUEBA.

**Requisitos creados:** 0

**Requisitos modificados:** 0

**Requisitos diferidos:** 0

**Requisitos obsoletos:** 0

La cobertura transversal vigente ya protege compatibilidad exacta de área, site-wide, separación entre sede y área, fuentes autoritativas, precedencia, canales, privacidad, frescura y reconciliación física. Esta tarea especializa esas obligaciones para ANIMA sin cambiar el registro.

---

#### 27. Cobertura de prueba vigente reutilizada

Sin modificarlos, se reutilizan:

- `TREQ-AUTH-259`: denegación del carril operativo cuando existe área válida pero no habilitación site-wide ni coincidencia exacta;
- `TREQ-AUTH-260`: aplicabilidad por permiso, modalidad y carril, con site-wide o área exacta;
- `TREQ-AUTH-261`: rol, sede y área desde la misma revisión del turno y prohibición de fallbacks;
- `TREQ-AUTH-262`: separación entre rol faltante, sede, área nula o inválida, incompatibilidad, grant y fallo técnico;
- `TREQ-AUTH-263`: precedencia antes y después del gate de área;
- `TREQ-AUTH-264`: equivalencia de respuesta entre canales;
- `TREQ-AUTH-265`: cobertura por aplicación sin convertir estado cliente en autoridad;
- `TREQ-AUTH-266`: privacidad, recuperación y experiencia;
- `TREQ-AUTH-267`: invalidación y frescura;
- `TREQ-AUTH-268`: reconciliación física y regresión territorial.

Esta enumeración es trazabilidad y no representa requisitos afectados por la tarea.

---

#### 28. Evidencia de validación

| Clase     | Estado       | Evidencia                                                                                                                                                                      |
| --------- | ------------ | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| BUILD     | NOT_EXECUTED | La batería real del checkout se ejecuta después de insertar y normalizar la tarea.                                                                                             |
| LOCAL     | PASS         | El artefacto aislado fue comprobado por estructura, metadata, secciones obligatorias, continuidad, UTF-8, EOL y ausencia de requisitos afectados en la sección derivada.       |
| REMOTA    | PASS         | Se contrastaron `main`, continuidad, owner, topología, políticas, contrato de `AUTH-ERR-014`, registro 04A, migraciones, consumidor ANIMA y snapshot Supabase de solo lectura. |
| OPERATIVA | NOT_EXECUTED | No se registró asistencia ni se ejercitó un flujo real de ANIMA.                                                                                                               |
| FÍSICA    | NOT_EXECUTED | No se ejecutaron migraciones, DDL, DML, backfills, RLS, RPC, código ni despliegues.                                                                                            |

---

#### 29. Criterios de aceptación

La tarea queda aceptable cuando:

1. consume exactamente el handoff de `ANIMA-AUTH-005`;
2. conserva rol, sede y área de la misma revisión publicada;
3. evalúa la identidad exacta `role_code + site_id + area_id` cuando existe área;
4. una habilitación site-wide satisface el gate de área;
5. una coincidencia activa del área exacta satisface el gate;
6. una habilitación en otra área no autoriza el área del turno;
7. una relación exacta inactiva no autoriza;
8. varias relaciones area-scoped coherentes son admisibles contractualmente;
9. `area_id = null` con site-wide puede continuar sin fabricar área;
10. `area_id = null` con alcance únicamente area-scoped falla cerrado por configuración;
11. ausencia de área nunca funciona como wildcard;
12. área inexistente, inactiva o ajena a la sede no se presenta como incompatibilidad ordinaria;
13. nombre, código visual y `area_kind` no sustituyen `area_id`;
14. área del check-in no sustituye el área del turno;
15. selección, perfil, dispositivo, cookie y cliente no sustituyen el área;
16. grant y compatibilidad territorial permanecen separados;
17. un grant no corrige un área incompatible;
18. una incompatibilidad válida reutiliza `AUTH_OPERATIONAL_ROLE_INVALID_FOR_AREA`;
19. se conserva `OPERATIONAL_ROLE_NOT_ENABLED_FOR_ACTIVE_AREA`;
20. la sesión se conserva;
21. el carril operativo produce cero efectos ante bloqueo;
22. la retirada concurrente de la última relación de sede invalida el handoff y no se reetiqueta como área;
23. cambios de turno, rol, sede, área o matriz invalidan la decisión;
24. el handoff a `ANIMA-AUTH-007` afirma compatibilidad territorial, no creación de contexto;
25. el snapshot físico se registra sin presentarlo como conformidad;
26. se reconocen explícitamente los dos casos actuales de área nula bajo alcance area-scoped sin corregirlos;
27. se identifica el fail-open físico por área nula en los helpers booleanos;
28. se identifica la limitación física de cardinalidad multiárea;
29. no se crean ni modifican requisitos de prueba;
30. no se ejecutan cambios físicos.

---

#### 30. Límites

Esta tarea no define:

- publicación y vigencia del turno, propiedad de `ANIMA-AUTH-001`;
- sede del turno, propiedad de `ANIMA-AUTH-002`;
- validez o ausencia explícita del área del turno, propiedad de `ANIMA-AUTH-003`;
- presencia y validez canónica del rol, propiedad de `ANIMA-AUTH-004`;
- habilitación del rol en la sede, propiedad de `ANIMA-AUTH-005`;
- creación del contexto operativo, propiedad de `ANIMA-AUTH-007`;
- actualización posterior del contexto, propiedad de `ANIMA-AUTH-008`;
- cierre del contexto, propiedad de `ANIMA-AUTH-009`;
- grants, scopes o autorización final de recursos;
- administración de la matriz;
- diseño final de mensajes;
- corrección de los dos casos físicos observados;
- materialización física.

No crea tablas, migraciones, constraints, índices, RPC, policies, tipos, rutas ni cambios productivos.

---

#### 31. Continuidad

**ÚLTIMA TAREA APROBADA**
`ANIMA-AUTH-005 — Confirmar que el rol esté permitido en la sede`

**TAREA ACTUAL APROBADA**
`ANIMA-AUTH-006 — Confirmar que el rol esté permitido en el área`

**SIGUIENTE TAREA RESERVADA**
`ANIMA-AUTH-007 — Crear contexto operativo al registrar entrada`


### ✅ ANIMA-AUTH-007 — Crear contexto operativo al registrar entrada

**Estado:** APROBADA
**Tarea anterior:** ANIMA-AUTH-006 — Confirmar que el rol esté permitido en el área
**Tarea siguiente:** ANIMA-AUTH-008 — Actualizar contexto cuando cambia el turno
**Tipo de tarea:** documental; definición contractual de la activación autoritativa del contexto operativo de ANIMA después de confirmar una entrada válida, preservando la separación entre hecho de asistencia, sesión de check-in, snapshot de AccessContext y autorización final
**Bloque:** F_ANIMA — AUTORIZACIÓN Y CONTEXTO OPERATIVO
**Repositorio propietario:** vento-group-sas/vento-shell
**Archivo propietario:** docs/plan-canonico/modular/bloques/F_ANIMA/01_AUTORIZACION_Y_CONTEXTO_OPERATIVO.md
**Estado físico resultante:** contrato documental definido; materialización física diferida por unidad de implementación
**Cambios físicos autorizados:** ninguno durante esta tarea documental; la materialización futura queda sujeta a la topología PER_IMPLEMENTATION_UNIT y al gate POST_E5_PACKAGE
**Requisitos de prueba creados o modificados:** 0

---

#### 1. Propósito

Definir de forma única, segura y verificable qué significa en ANIMA crear contexto operativo al registrar una entrada.

La creación no ocurre cuando el trabajador toca el botón, cuando el cliente encola una intención ni cuando la interfaz muestra un turno. Ocurre únicamente después de que una frontera autoritativa server-side:

1. conserva el actor efectivo;
2. revalida el turno publicado y vigente;
3. conserva la misma revisión publicada aplicable;
4. confirma la sede, el área o ausencia explícita, el rol y su compatibilidad;
5. valida la marcación y su punto físico cuando aplique;
6. confirma la persistencia idempotente del evento de entrada;
7. establece una única sesión de check-in activa y compatible;
8. permite resolver un nuevo snapshot de `AccessContext` con el carril operativo estructuralmente disponible.

La regla raíz queda:

```text
INTENCION DE CHECK-IN
+
ANIMA-AUTH-001..006 SATISFECHAS Y FRESCAS
+
VALIDACIONES DE MARCACION SATISFECHAS
+
EVENTO DE ENTRADA CONFIRMADO POR SERVIDOR
+
SESION DE CHECK-IN ACTIVA, UNICA Y COMPATIBLE
+
NUEVA RESOLUCION DE ACCESS CONTEXT
->
CONTEXTO OPERATIVO ACTIVADO
```

Ese contexto sigue sin equivaler a un permiso concedido sobre un recurso.

---

#### 2. Entrada contractual desde ANIMA-AUTH-006

`ANIMA-AUTH-007` consume exactamente el handoff aprobado por la tarea anterior:

- actor efectivo;
- turno laboral publicado, vigente e inequívoco;
- referencia de publicación o revisión;
- sede exacta confirmada;
- área exacta confirmada o ausencia explícita compatible con una habilitación site-wide;
- rol operativo canónico y activo;
- confirmación de habilitación del rol en la sede;
- confirmación de compatibilidad territorial por `SITE_WIDE` o `EXACT_AREA`;
- estado de check-in cuando la cadena aplicable ya lo exige;
- instante server-side de resolución;
- versiones o fingerprints disponibles.

El handoff afirma:

```text
ROLE_ENABLED_IN_SITE = TRUE
ROLE_AREA_COMPATIBILITY = SATISFIED
```

No afirma:

```text
ATTENDANCE_INSERTED = TRUE
ACTIVE_CHECKIN_SESSION = PRESENT
ACCESS_CONTEXT_RESOLVED = TRUE
PERMISSION_GRANTED = TRUE
RESOURCE_IN_SCOPE = TRUE
```

Por tanto, esta tarea comienza en la frontera entre una intención de marcación todavía no confirmada y un hecho de asistencia capaz de originar contexto operativo.

---

#### 3. Significado exacto de “crear contexto operativo”

En esta tarea:

```text
CREAR CONTEXTO OPERATIVO
```

significa:

```text
CONFIRMAR EL HECHO DE ENTRADA
+
ESTABLECER O RESOLVER LA SESION DE CHECK-IN ACTIVA
+
RESOLVER UN SNAPSHOT NUEVO DE ACCESS CONTEXT
CON LOS HECHOS OPERATIVOS CONFIRMADOS
```

No significa obligatoriamente:

- insertar una fila en una tabla denominada `operational_context`;
- mantener un objeto mutable durante toda la jornada;
- usar el estado React como contexto;
- copiar permisos dentro de una sesión;
- emitir un token que contenga autoridad permanente;
- convertir `context_id` en identidad de jornada;
- convertir el check-in en fuente de turno, sede, área o rol.

La implementación física futura podrá utilizar una proyección, función, vista, sesión materializada o combinación controlada, siempre que preserve el contrato canónico.

---

#### 4. Cuatro identidades que deben permanecer separadas

La activación distingue cuatro identidades:

| Identidad            | Qué representa                                               | Duración lógica                                                  | Fuente                                  |
| -------------------- | ------------------------------------------------------------ | ---------------------------------------------------------------- | --------------------------------------- |
| `client_event_id`    | intención idempotente de entrada                             | estable durante retries y replay de la misma intención           | productor autorizado de la intención    |
| `attendance_log_id`  | hecho de entrada persistido y confirmado                     | histórico e inmutable salvo corrección auditada                  | persistencia autoritativa de asistencia |
| `checkin_session_id` | sesión de check-in abierta derivada de asistencia confirmada | desde entrada confirmada hasta cierre, expiración o invalidación | resolutor canónico de asistencia        |
| `context_id`         | identidad de una resolución concreta de `AccessContext`      | un snapshot; no una sesión permanente                            | resolutor server-side de contexto       |

Invariantes:

```text
client_event_id != attendance_log_id
attendance_log_id != checkin_session_id
checkin_session_id != context_id
context_id != permiso
```

La reutilización accidental de una identidad para representar otra queda prohibida.

---

#### 5. Condición canónica de activación

La activación solo puede producirse cuando todas las condiciones aplicables sean verdaderas de manera simultánea y concluyente:

```text
ACTOR_EFFECTIVE = RESOLVED_EMPLOYEE
AND
EMPLOYEE_ACTIVE = TRUE
AND
PUBLISHED_SHIFT = RESOLVED
AND
SHIFT_WINDOW = CURRENT
AND
SHIFT_SITE = VALID
AND
SHIFT_AREA = VALID_OR_EXPLICITLY_ABSENT
AND
OPERATIONAL_ROLE = VALID
AND
ROLE_ENABLED_IN_SITE = TRUE
AND
ROLE_AREA_COMPATIBILITY = SATISFIED
AND
CHECKIN_POINT = VALID_WHEN_REQUIRED
AND
GEOFENCE = SATISFIED_WHEN_REQUIRED
AND
ACTIVE_SESSION_COUNT_BEFORE = 0
AND
ATTENDANCE_EVENT = SERVER_CONFIRMED
AND
ACTIVE_SESSION_COUNT_AFTER = 1
AND
POST_COMMIT_CONTEXT_RESOLUTION = CONCLUSIVE
```

Si alguna condición deja de ser cierta antes del commit autoritativo, no se activa contexto con el snapshot anterior.

---

#### 6. Fuentes autoritativas

La activación puede consumir únicamente fuentes propietarias y verificables.

| Hecho                     | Fuente contractual                                    |
| ------------------------- | ----------------------------------------------------- |
| actor efectivo            | resolución server-side de principal y actor           |
| identidad laboral activa  | catálogo y relación laboral canónicos                 |
| turno                     | revisión publicada aplicable                          |
| sede operativa            | turno publicado                                       |
| área operativa            | turno publicado                                       |
| rol operativo             | turno publicado                                       |
| habilitación rol-sede     | matriz operativa canónica                             |
| compatibilidad rol-área   | matriz operativa canónica                             |
| punto físico de marcación | configuración de asistencia aplicable                 |
| hecho de entrada          | persistencia autoritativa de asistencia               |
| sesión activa             | proyección canónica derivada de asistencia confirmada |
| snapshot de contexto      | resolutor canónico de `AccessContext`                 |
| tiempo de autorización    | reloj de servidor                                     |

No adquieren autoridad por sí solos:

- selección de sede o área en interfaz;
- perfil habitual del trabajador;
- rol base;
- último turno mostrado;
- último check-in observado en cliente;
- caché;
- estado de cola;
- notificación;
- respuesta optimista;
- GPS sin validación;
- `device_info`;
- parámetro enviado por cliente;
- último contexto conocido.

---

#### 7. Frontera server-side y atomicidad

La creación del contexto operativo requiere una frontera server-side que impida estados intermedios autoritativos.

Conceptualmente:

```text
BEGIN AUTHORITY BOUNDARY
  resolver y revalidar hechos
  serializar la decision por actor cuando sea necesario
  verificar ausencia de sesion activa incompatible
  persistir o reconocer el evento idempotente
  confirmar el hecho
  derivar una unica sesion activa
COMMIT
  resolver un AccessContext nuevo
END
```

No se exige una tecnología transaccional específica en esta tarea documental.

Sí se exige que ningún consumidor pueda observar como autoridad una combinación imposible, por ejemplo:

```text
check-in confirmado
+
turno diferente
```

o:

```text
contexto operativo activo
+
evento de entrada revertido
```

o:

```text
dos sesiones activas
```

---

#### 8. Actor efectivo

El evento de entrada y la sesión activa pertenecen al actor efectivo.

Para una sesión personal:

```text
principal humano
-> actor efectivo empleado
-> attendance.employee_id
-> shift.employee_id
```

deben converger sobre la misma identidad laboral.

En un dispositivo compartido:

```text
principal tecnico
!= actor humano
```

La identidad técnica no se convierte en empleado. El actor humano debe estar resuelto de forma válida por el contrato propietario del dispositivo antes de originar efectos de asistencia o contexto operativo.

Una identidad `UNRESOLVED`, un empleado inactivo o un actor diferente al titular del turno impiden la activación.

---

#### 9. Turno y revisión publicada fijados

Todo check-in operativo nuevo debe quedar vinculado a exactamente un turno publicado aplicable.

La activación conserva conceptualmente:

```text
shift_id
+
published_revision
```

La revisión que justificó la entrada queda fijada como referencia reproducible del inicio de la sesión.

Queda prohibido:

- activar contexto con `shift_id = null`;
- usar un turno histórico para reparar autoridad actual;
- escoger una revisión por “última fila”;
- combinar hechos de dos revisiones;
- aceptar una revisión retirada o sustituida;
- tomar el `shift_id` enviado por cliente como prueba suficiente.

Un evento histórico sin turno puede permanecer como hecho de asistencia o incidencia, pero no crea contexto operativo.

---

#### 10. Sede, área y rol del snapshot inicial

El contexto inicial copia semánticamente los hechos ya validados de la misma revisión del turno:

```text
operational_site.site_id = active_shift.site_id
operational_role.role_code = active_shift.operational_role
operational_role.site_id = active_shift.site_id
operational_role.area_id = active_shift.area_id
```

Cuando existe área:

```text
operational_area.area_id = active_shift.area_id
operational_area.site_id = active_shift.site_id
```

Cuando el turno conserva ausencia explícita de área y la compatibilidad site-wide fue satisfecha:

```text
operational_area = null
```

No se fabrica un área.

La entrada no puede cambiar la sede, el área o el rol para hacer que la marcación resulte válida.

---

#### 11. Punto físico de marcación y territorio operativo

El punto físico de check-in permanece separado de la sede operativa:

```text
geofence_site_id != operational_site_id
```

aunque en algunos casos sus identificadores puedan coincidir.

El punto de marcación responde dónde se capturó físicamente la asistencia.

El turno responde dónde opera laboralmente el trabajador.

Por tanto:

- una geocerca válida no crea sede operativa;
- una sede operativa válida no evita la geocerca cuando la política la exige;
- un punto técnico oculto puede ser válido sin convertirse en sede laboral;
- el punto de check-in no reemplaza área ni rol;
- la ubicación no amplía permisos.

---

#### 12. Tiempo confiable

La intención puede conservar:

```text
client_occurred_at
```

como evidencia del instante capturado.

La autoridad temporal del contexto utiliza:

```text
server_evaluated_at
```

La implementación debe impedir que alterar el reloj del cliente:

- adelante el inicio del turno;
- extienda su fin;
- reabra una sesión expirada;
- mantenga contexto después de invalidación;
- cambie el orden autoritativo de eventos.

La marca temporal de cliente puede participar en conciliación y auditoría, pero no sustituye el tiempo de servidor para decidir vigencia.

---

#### 13. Idempotencia de la entrada

Una intención reintentable debe tener identidad estable antes de su primer envío.

Regla:

```text
MISMO ACTOR
+
MISMO client_event_id
+
MISMO CONTENIDO SEMANTICO
->
MISMO RESULTADO EMPRESARIAL
+
CERO EFECTOS ADICIONALES
```

En cambio:

```text
MISMO ACTOR
+
MISMO client_event_id
+
CONTENIDO SEMANTICO DISTINTO
->
CONFLICT
+
CERO NUEVO EFECTO
```

Un retry por respuesta perdida no puede producir:

- un segundo evento de entrada;
- una segunda sesión;
- otro turno;
- un nuevo efecto de geocerca;
- otra activación de contexto.

La deduplicación por existencia del identificador no es suficiente si no puede comprobarse que el contenido representa la misma intención.

---

#### 14. Concurrencia y unicidad de sesión

Antes de confirmar una entrada debe existir:

```text
ACTIVE_CHECKIN_SESSION_COUNT = 0
```

Después del efecto aplicado:

```text
ACTIVE_CHECKIN_SESSION_COUNT = 1
```

Dos solicitudes concurrentes del mismo actor deben serializarse o resolverse de forma equivalente.

Resultados permitidos:

| Primera intención                     | Segunda intención       | Resultado                                               |
| ------------------------------------- | ----------------------- | ------------------------------------------------------- |
| misma identidad y mismo contenido     | replay                  | devolver resultado existente                            |
| identidad diferente concurrente       | una gana                | la otra no crea otra sesión                             |
| misma identidad y contenido diferente | conflicto               | cero efecto adicional                                   |
| sesión previa activa                  | nueva entrada           | denegar o devolver conflicto según contrato propietario |
| sesión candidata ambigua              | cualquier entrada nueva | fallar cerrado                                          |

Queda prohibido resolver multiplicidad mediante `ORDER BY ... LIMIT 1` como regla de autoridad.

---

#### 15. Persistencia confirmada antes de activar autoridad

La secuencia contractual es:

```text
INTENCION
-> VALIDACION
-> PERSISTENCIA
-> COMMIT
-> EVENTO CONFIRMADO
-> SESION ACTIVA
-> CONTEXTO OPERATIVO RESOLUBLE
```

No es:

```text
INTENCION
-> CONTEXTO ACTIVO
-> INTENTAR PERSISTIR DESPUES
```

Un insert rechazado, revertido, en conflicto o cuyo outcome autoritativo permanece desconocido no puede activar un contexto nuevo en el cliente.

Cuando el servidor devuelve éxito, la respuesta debe poder correlacionarse con el hecho realmente confirmado.

---

#### 16. `ActiveCheckinContext` conservado

Esta tarea reutiliza sin ampliar la forma conceptual vigente:

```ts
type ActiveCheckinContext = {
  checkin_session_id: string;
  employee_id: string;
  shift_id: string;
  site_id: string;
  area_id: string | null;
  checked_in_at: string;
  expires_at: string | null;
  checked_out_at: string | null;
  status: "ACTIVE" | "EXPIRED" | "CLOSED" | "INVALID";
};
```

Para que participe en el contexto operativo inicial:

```text
status = ACTIVE
checked_out_at = null
employee_id = actor efectivo
shift_id = active_shift.shift_id
site_id = active_shift.site_id
```

Cuando existe área, `area_id` debe ser compatible con el turno según el contrato vigente.

Una sesión cerrada, expirada o inválida no se presenta como activa.

---

#### 17. `OperationalRoleContext` conservado

La creación reutiliza exactamente:

```ts
type OperationalRoleContext = {
  role_code: string;
  shift_id: string;
  site_id: string;
  area_id: string | null;
  valid_for_site: boolean;
  valid_for_area: boolean;
};
```

El snapshot inicial debe conservar:

```text
valid_for_site = true
valid_for_area = true
```

de acuerdo con los gates ya resueltos.

La entrada no crea el rol y no convierte el rol base en rol operativo.

---

#### 18. `OperationalSiteContext` y `OperationalAreaContext` conservados

La sede conserva:

```ts
type OperationalSiteContext = {
  site_id: string;
  source_shift_id: string;
  site_active: boolean;
  assignment_valid: boolean;
};
```

El área, cuando existe, conserva:

```ts
type OperationalAreaContext = {
  area_id: string;
  site_id: string;
  area_kind: string;
  source: "SHIFT" | "CHECKIN_CONFIRMED_SHIFT";
  area_active: boolean;
  compatible_with_role: boolean;
};
```

Después de una entrada confirmada, `CHECKIN_CONFIRMED_SHIFT` puede expresar que la misma área del turno fue corroborada por una sesión de check-in compatible.

Esa fuente solo es válida cuando:

1. existe `active_checkin_session`;
2. pertenece al mismo actor;
3. coincide con el mismo turno;
4. coincide con la misma sede;
5. declara exactamente la misma área;
6. no existe incompatibilidad estructural.

El check-in nunca crea un área distinta.

---

#### 19. Fragmento operativo de `AccessContext`

La activación de entrada permite que una resolución nueva de `AccessContext` represente simultáneamente:

```text
active_shift != null
active_checkin_session != null
operational_role != null
operational_site != null
operational_area = valor valido o null site-wide
lane_readiness.operational = estructuralmente disponible
```

El resto de `AccessContext` continúa resolviéndose bajo su contrato completo.

El snapshot:

- es server-side;
- es inmutable;
- usa una única realidad temporal coherente;
- no mezcla datos obtenidos antes y después de un cambio material;
- no contiene la decisión final de permiso;
- no se reutiliza una vez obsoleto.

---

#### 20. `context_id` no es una sesión persistente

`AccessContext.context_id` identifica una resolución concreta.

Por tanto:

```text
MISMA SESION DE CHECK-IN
+
NUEVA SOLICITUD
+
NUEVA RESOLUCION
->
NUEVO context_id
```

puede ser correcto.

La sesión de check-in puede permanecer igual mientras se produzcan varios snapshots frescos.

Consecuencias:

- no almacenar `context_id` como si fuera el identificador laboral de toda la jornada;
- no usar un `context_id` antiguo como bearer token de autoridad;
- no cerrar la asistencia “cerrando” un `context_id`;
- no actualizar el snapshot in-place cuando cambia un hecho;
- `ANIMA-AUTH-008` puede obligar a resolver otro snapshot sin que eso signifique una segunda entrada.

---

#### 21. Matriz de resultados de creación

| Caso | Evento                                                                 | Sesión                                             | Contexto operativo                                      |
| ---: | ---------------------------------------------------------------------- | -------------------------------------------------- | ------------------------------------------------------- |
|    1 | entrada validada y aplicada                                            | una activa compatible                              | crear resolución nueva                                  |
|    2 | replay idéntico de entrada aplicada                                    | misma sesión                                       | devolver estado coherente; cero efecto adicional        |
|    3 | mismo `client_event_id`, payload distinto                              | no crear otra                                      | conflicto                                               |
|    4 | validación previa falla                                                | ninguna nueva                                      | no activar                                              |
|    5 | turno dejó de ser vigente antes del commit                             | ninguna nueva                                      | revalidar y denegar                                     |
|    6 | revisión cambió antes del commit                                       | ninguna nueva                                      | invalidar snapshot previo                               |
|    7 | sede, área o rol cambiaron                                             | ninguna nueva                                      | volver a resolver cadena                                |
|    8 | geocerca requerida falla                                               | ninguna nueva                                      | no activar                                              |
|    9 | ya existe una sesión activa compatible                                 | ninguna nueva                                      | no crear segunda; resolver según idempotencia/duplicado |
|   10 | dos sesiones activas candidatas                                        | ambiguo                                            | fail closed                                             |
|   11 | persistencia falla                                                     | ninguna nueva                                      | no activar                                              |
|   12 | commit confirmado pero respuesta se pierde                             | ya existe                                          | retry recupera resultado sin duplicar                   |
|   13 | intención permanece offline                                            | ninguna confirmada                                 | no activar autoridad                                    |
|   14 | evento histórico con `shift_id = null`                                 | no utilizable para operación                       | no activar                                              |
|   15 | entrada confirmada, pero resolución post-commit descubre contradicción | conservar hecho histórico; contexto no confirmable | fail closed y escalar causa propietaria                 |
|   16 | capacidad base independiente                                           | no depende de esta activación                      | conservar evaluación base propia                        |

---

#### 22. Cero efectos ante fallo cerrado

Cuando no puede confirmarse el contexto:

- no se crea una segunda sesión;
- no se modifica el turno;
- no se cambia sede;
- no se cambia área;
- no se cambia rol;
- no se concede un permiso;
- no se crea un recurso empresarial;
- no se ejecuta una mutación protegida posterior;
- no se convierte un error técnico en ausencia ordinaria;
- no se corrige automáticamente la programación;
- no se borra un hecho histórico ya confirmado para ocultar la inconsistencia.

Si el evento de entrada ya fue confirmado antes de descubrir una contradicción posterior, se conserva como hecho de asistencia y se bloquea la autoridad operativa hasta que el resolutor pueda producir un contexto válido o un flujo propietario corrija la situación.

---

#### 23. Operación offline

Una intención offline conserva:

- identidad estable;
- actor esperado;
- turno propuesto;
- instante capturado;
- sitio y punto físico;
- geolocalización cuando aplique;
- contexto auxiliar necesario para reconciliar;
- estado de cola.

Pero:

```text
OFFLINE_QUEUED
!=
SERVER_CONFIRMED
```

y:

```text
OFFLINE_QUEUED
!=
ACTIVE_CHECKIN_SESSION
```

Por tanto, no activa un contexto operativo autoritativo.

La sincronización, retry y reconciliación completas permanecen en `ANIMA-AUTH-014` y `ANIMA-AUTH-015`.

---

#### 24. Respuesta perdida y recuperación

Una pérdida de respuesta después del commit no cambia la semántica empresarial.

El cliente debe poder consultar o repetir la misma identidad de intención y obtener un resultado estable.

Queda prohibido:

- generar un nuevo `client_event_id` porque hubo timeout;
- insertar un segundo check-in para “asegurarse”;
- inferir éxito únicamente porque cambió la pantalla;
- inferir fallo únicamente porque no llegó la respuesta;
- activar contexto local sin evidencia autoritativa posterior.

El estado `unknown outcome` requiere recuperación por identidad, no repetición ciega del efecto.

---

#### 25. Contradicción y ambigüedad

Impiden crear un contexto autoritativo, entre otros:

- dos turnos aplicables;
- dos revisiones incompatibles;
- dos sesiones activas;
- sesión activa de otro actor;
- sesión activa de otro turno;
- sesión cuyo sitio contradice el turno;
- sesión residual después de un checkout concluyente;
- rol, sede o área ya no válidos;
- snapshot compuesto con versiones incompatibles;
- fuente obligatoria no verificable.

La primera causa concluyente mantiene su propietario contractual.

No se reduce todo a un booleano `can_operate = false` sin conservar causa y trazabilidad.

---

#### 26. Revalidación inmediatamente antes del efecto

Los gates resueltos por `ANIMA-AUTH-001` a `ANIMA-AUTH-006` no son autorizaciones eternas.

Justo antes del efecto de entrada deben continuar vigentes, al menos:

- identidad del actor;
- estado del empleado;
- turno y revisión publicada;
- ventana temporal;
- sede;
- área;
- rol;
- habilitación rol-sede;
- compatibilidad rol-área;
- configuración del punto físico y geocerca aplicables;
- ausencia de una sesión concurrente incompatible.

Si uno cambió:

```text
PREFLIGHT_PREVIO
-> STALE
-> NO REUTILIZAR
```

Se ejecuta una nueva resolución dentro de la frontera autoritativa.

---

#### 27. Relación con la autorización final

Crear contexto operativo no concede autoridad universal.

```text
OPERATIONAL_CONTEXT_READY
+
PERMISSION_MISSING
->
DENY
```

```text
OPERATIONAL_CONTEXT_READY
+
RESOURCE_OUT_OF_SCOPE
->
DENY
```

```text
OPERATIONAL_CONTEXT_READY
+
DEVICE_RESTRICTED
->
DENY
```

La autorización de capacidades sigue evaluándose por permiso, modalidad, grants, deny, territorio, recurso, dispositivo y demás contratos aplicables.

ANIMA no otorga permisos directamente al registrar entrada.

---

#### 28. Handoff a ANIMA-AUTH-008

Cuando la entrada queda confirmada y existe contexto operativo resoluble, `ANIMA-AUTH-008` recibe una base coherente formada por:

- actor efectivo;
- referencia estable de la sesión de check-in;
- evento de entrada confirmado;
- turno y revisión publicada usados para iniciar la sesión;
- sede operativa;
- área operativa o ausencia site-wide válida;
- rol operativo;
- compatibilidad territorial;
- instante de confirmación;
- snapshot o referencias de versión necesarias para detectar cambios posteriores.

El handoff afirma:

```text
CHECKIN_SERVER_CONFIRMED = TRUE
ACTIVE_CHECKIN_SESSION = PRESENT
OPERATIONAL_CONTEXT_RESOLVABLE = TRUE
```

No afirma que ese mismo snapshot siga siendo válido después de un cambio de turno.

`ANIMA-AUTH-008` conserva la propiedad de actualizar o volver a resolver el contexto cuando cambie el turno después de la entrada.

---

#### 29. Estado físico observado

La inspección de solo lectura del estado desplegado registró:

| Elemento                                                      | Resultado |
| ------------------------------------------------------------- | --------: |
| filas en `attendance_logs`                                    |      5825 |
| eventos `check_in`                                            |      2915 |
| eventos `check_out`                                           |      2910 |
| filas sin `shift_id`                                          |      2629 |
| filas sin `client_event_id`                                   |      5823 |
| filas con `client_event_id`                                   |         2 |
| filas con `shift_id` y `client_event_id`                      |         1 |
| candidatos abiertos por último evento `check_in`              |         5 |
| candidatos abiertos sin `shift_id`                            |         0 |
| candidatos abiertos vinculados a turno publicado laboral      |         5 |
| candidatos abiertos temporalmente aplicables en la inspección |         5 |
| candidatos abiertos con rol canónico activo                   |         5 |
| candidatos abiertos compatibles con rol-sede-área             |         5 |
| candidatos abiertos cuyo `site_id` coincide con el turno      |         5 |
| candidatos abiertos con `client_event_id`                     |         0 |
| tabla base `attendance_sessions` observada                    |         0 |
| triggers `BEFORE INSERT` observados sobre `attendance_logs`   |         4 |

La ausencia histórica de `shift_id` o `client_event_id` no convierte automáticamente una fila histórica en inválida para reportes de asistencia. Sí impide usar esos datos incompletos como prueba suficiente de una nueva autoridad operativa bajo el contrato final.

Los cinco candidatos abiertos observados son un snapshot dinámico. Su validez futura debe revalidarse y no se congela documentalmente.

---

#### 30. Brechas físicas de adopción

La inspección detectó brechas relevantes para la futura materialización:

1. `attendance_logs.shift_id` continúa nullable y una parte sustancial del histórico no está vinculada a turno;
2. casi todo el histórico carece de `client_event_id`;
3. no existe una tabla base `attendance_sessions`; la sesión real se deriva actualmente de eventos;
4. `attendance_logs` tiene cuatro triggers `BEFORE INSERT`, incluidos dos resolutores de contexto de turno que se solapan parcialmente;
5. la secuencia física vigente alterna eventos usando el último registro global del empleado y un advisory lock, pero no materializa una identidad estable de sesión;
6. `sync_attendance_events` recibe `shiftId` del cliente y depende de resolutores y triggers posteriores para normalización;
7. el contrato físico observado no transporta una identidad explícita de revisión publicada en `attendance_logs`;
8. el índice de idempotencia existe únicamente cuando `client_event_id` no es nulo;
9. `sync_attendance_events` trata cualquier `unique_violation` como `duplicate` sin demostrar por esa rama que el contenido sea semánticamente idéntico;
10. el catálogo físico de `source` admite `mobile`, `web`, `kiosk` y `system`, mientras el modelo conceptual de asistencia contempla más procedencias;
11. `get_operational_context` deriva una sesión abierta a partir de eventos y conserva fallbacks legacy de sede y área que no constituyen el contrato final;
12. `get_effective_context_v1` consume ese resolutor legacy para el contexto real y no representa por sí mismo la forma contractual final de `AccessContext`.

Estas brechas no autorizan cambios físicos en esta tarea.

---

#### 31. Propietarios de las brechas

Las brechas quedan asignadas a propietarios ya existentes:

| Brecha                                                      | Propietario o frontera existente     | Condición de salida                                                  |
| ----------------------------------------------------------- | ------------------------------------ | -------------------------------------------------------------------- |
| hechos autoritativos de actor, turno, check-in y territorio | `AUTH-DB-033`                        | producir hechos reproducibles y compatibles con el contrato canónico |
| precedencia, gates y razones                                | `AUTH-DB-034`                        | evaluador único conserva la primera causa concluyente                |
| frescura e invalidación                                     | `AUTH-DB-035`                        | snapshots stale dejan de ser reutilizables                           |
| activación específica de ANIMA                              | instancia futura de `ANIMA-AUTH-007` | entrada confirmada produce sesión y contexto conforme a esta tarea   |
| cambios de turno posteriores                                | `ANIMA-AUTH-008`                     | contexto se vuelve a resolver sin crear otra entrada                 |
| cierre por salida                                           | `ANIMA-AUTH-009`                     | checkout cierra la sesión exacta y revoca contexto dependiente       |
| descansos                                                   | `ANIMA-AUTH-010`                     | pausa no se confunde con checkout                                    |
| offline y reconciliación                                    | `ANIMA-AUTH-014` y `ANIMA-AUTH-015`  | intención offline conserva idempotencia y se reautoriza              |
| diagnóstico visible                                         | `ANIMA-AUTH-016` y `ANIMA-AUTH-017`  | experiencia muestra estado correcto sin inventar autoridad           |
| auditoría                                                   | `ANIMA-AUTH-018`                     | creación y cambios quedan reconstruibles                             |
| prohibición de otorgar permisos desde ANIMA                 | `ANIMA-AUTH-019`                     | check-in y contexto no se convierten en grant                        |
| confirmación transversal de contexto                        | `INT-WORK-004`                       | Supabase y resolutores confirman contexto coherente y fresco         |
| consumo por aplicaciones                                    | `INT-WORK-005`                       | consumidores dejan de reconstruir contexto por su cuenta             |

No se crea una tarea adicional.

---

#### 32. Seguridad, privacidad y observabilidad

La respuesta de activación debe entregar al trabajador solo lo necesario para confirmar el estado de su propia marcación.

No debe revelar automáticamente:

- otros turnos;
- otros trabajadores;
- relaciones de matriz;
- grants;
- denies;
- identificadores internos innecesarios;
- detalles de RLS o RPC;
- SQL;
- fingerprints internos no necesarios para el cliente;
- candidatos alternativos de turno;
- causas técnicas sensibles.

La evidencia operativa futura debe permitir correlacionar, según finalidad autorizada:

- intención idempotente;
- hecho confirmado;
- sesión;
- turno y revisión;
- actor;
- sede y área;
- rol;
- instante de servidor;
- resultado;
- causa de rechazo o conflicto;
- contexto resuelto posterior.

Logs y telemetría siguen siendo evidencia, no fuente de autorización.

---

#### 33. Topología y materialización física

La definición documental se aprueba una sola vez en este marcador.

```text
MODE = PER_IMPLEMENTATION_UNIT
EXECUTION_GATE = POST_E5_PACKAGE
INSTANCE_PATTERN = ANIMA-AUTH-007::<implementation_unit_id>
```

La materialización futura:

- requiere una unidad de implementación real;
- requiere el paquete propietario aplicable;
- requiere el gate E5 correspondiente;
- debe limitarse a los productores y consumidores físicos de la activación;
- debe conservar idempotencia, concurrencia y rollback;
- debe evitar una tabla de contexto persistente si no es necesaria;
- si materializa sesión o proyección, debe conservar las identidades separadas;
- debe ejecutar todos los cambios Supabase desde `vento-group-sas/vento-shell`.

Esta tarea no autoriza DDL, DML, migraciones, RLS, RPC, Edge Functions, cambios de código, datos productivos ni despliegues.

---

#### 34. Requisitos de prueba derivados

NO GENERA REQUISITOS DE PRUEBA.

**Requisitos creados:** 0

**Requisitos modificados:** 0

**Requisitos diferidos:** 0

**Requisitos obsoletos:** 0

La cobertura vigente ya protege check-in confirmado, sesión activa, unicidad, precedencia, territorio, idempotencia, offline, paridad de canales y separación entre contexto y autorización. Esta tarea especializa esas obligaciones para la activación inicial de ANIMA sin cambiar el registro.

---

#### 35. Cobertura de prueba vigente reutilizada

Sin modificarlos, se reutilizan:

- `TREQ-AUTH-008`: capacidades operativas consumen turno vigente, check-in activo, rol y territorio compatibles;
- `TREQ-AUTH-009`: sede y área efectivas se resuelven determinísticamente;
- `TREQ-AUTH-229`: ausencia de check-in requerido produce denegación y cero efectos;
- `TREQ-AUTH-230`: el requisito de check-in se aplica por permiso, modalidad y carril;
- `TREQ-AUTH-231`: sesión activa pertenece al actor, turno y sede exactos, está confirmada y es única;
- `TREQ-AUTH-232`: ausencia, cierre normal, contradicción, multiplicidad e indisponibilidad conservan causas distintas;
- `TREQ-AUTH-233`: precedencia de turno, check-in, rol y territorio;
- `TREQ-AUTH-234`: paridad entre canales;
- `TREQ-AUTH-235`: ANIMA conserva disponible el flujo que crea asistencia;
- `TREQ-AUTH-236`: experiencia y privacidad del check-in requerido;
- `TREQ-ANIMA-003`: intención offline durable e idempotente con `client_event_id` estable.

Esta enumeración es trazabilidad y no representa requisitos afectados por la tarea.

---

#### 36. Evidencia de validación

| Clase     | Estado       | Evidencia                                                                                                                                                                                       |
| --------- | ------------ | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| BUILD     | NOT_EXECUTED | La batería real del checkout se ejecuta después de insertar y normalizar la tarea.                                                                                                              |
| LOCAL     | PASS         | El artefacto aislado fue comprobado por estructura, metadata, continuidad, secciones obligatorias, UTF-8, EOL y cero requisitos afectados en la sección derivada.                               |
| REMOTA    | PASS         | Se contrastaron `main`, continuidad, owner, topología, políticas, contratos `AccessContext`, check-in, contexto efectivo, 04A, migraciones y estado Supabase mediante lecturas de solo lectura. |
| OPERATIVA | NOT_EXECUTED | No se registró una entrada real ni se ejercitó un flujo de trabajador.                                                                                                                          |
| FÍSICA    | NOT_EXECUTED | No se ejecutaron migraciones, DDL, DML, RLS, RPC, cambios de código ni despliegues.                                                                                                             |

---

#### 37. Criterios de aceptación

La tarea queda aceptable cuando:

1. consume exactamente el handoff de `ANIMA-AUTH-006`;
2. separa intención, hecho, sesión y snapshot de contexto;
3. conserva `client_event_id`, `attendance_log_id`, `checkin_session_id` y `context_id` como identidades distintas;
4. `context_id` permanece identidad de resolución y no sesión permanente;
5. la activación exige evento de entrada confirmado por servidor;
6. una intención local o encolada no activa autoridad;
7. `shift_id = null` no crea contexto operativo;
8. se conserva conceptualmente la revisión publicada usada al entrar;
9. actor, turno y sesión convergen sobre el mismo empleado;
10. sede, área y rol proceden del turno y no del check-in;
11. el punto físico permanece separado de la sede operativa;
12. la geocerca no crea territorio;
13. tiempo de cliente no controla vigencia;
14. mismo evento y contenido reproducen el mismo resultado;
15. mismo identificador con contenido distinto produce conflicto;
16. respuesta perdida se recupera por identidad sin duplicar efecto;
17. existe máximo una sesión activa compatible por actor;
18. multiplicidad no se resuelve con primera fila;
19. la persistencia se confirma antes de activar contexto;
20. `ActiveCheckinContext` conserva su forma canónica;
21. `OperationalRoleContext` conserva su forma canónica;
22. `OperationalSiteContext` conserva su forma canónica;
23. `OperationalAreaContext` conserva su forma canónica;
24. `AccessContext` se resuelve de nuevo después del hecho confirmado;
25. contexto operativo no equivale a permiso;
26. grant o scope posteriores siguen evaluándose por sus contratos;
27. los gates `ANIMA-AUTH-001..006` se revalidan cuando puedan haber quedado stale;
28. un fallo previo produce cero efectos de asistencia y contexto;
29. una contradicción posterior a un hecho ya confirmado conserva el histórico y bloquea autoridad;
30. `ANIMA-AUTH-008` conserva la propiedad de cambios de turno posteriores;
31. `ANIMA-AUTH-009` conserva la propiedad del cierre por checkout;
32. `ANIMA-AUTH-014` y `ANIMA-AUTH-015` conservan offline y reconciliación;
33. `ANIMA-AUTH-018` conserva auditoría detallada;
34. `ANIMA-AUTH-019` conserva la prohibición de que ANIMA otorgue permisos directamente;
35. se reconocen las brechas físicas sin corregirlas;
36. no se crean ni modifican requisitos de prueba;
37. no se ejecutan cambios físicos.

---

#### 38. Límites

Esta tarea no define:

- publicación y vigencia del turno, propiedad de `ANIMA-AUTH-001`;
- sede del turno, propiedad de `ANIMA-AUTH-002`;
- área del turno, propiedad de `ANIMA-AUTH-003`;
- rol operativo del turno, propiedad de `ANIMA-AUTH-004`;
- habilitación rol-sede, propiedad de `ANIMA-AUTH-005`;
- compatibilidad rol-área, propiedad de `ANIMA-AUTH-006`;
- actualización después de cambiar el turno, propiedad de `ANIMA-AUTH-008`;
- cierre del contexto al registrar salida, propiedad de `ANIMA-AUTH-009`;
- descansos, propiedad de `ANIMA-AUTH-010`;
- cambio temporal de área, propiedad de `ANIMA-AUTH-011`;
- reemplazos de turno, propiedad de `ANIMA-AUTH-012`;
- turnos cruzados de medianoche, propiedad de `ANIMA-AUTH-013`;
- sincronización y reconciliación offline, propiedad de `ANIMA-AUTH-014` y `ANIMA-AUTH-015`;
- diseño final de diagnóstico, propiedad de `ANIMA-AUTH-016` y `ANIMA-AUTH-017`;
- auditoría detallada, propiedad de `ANIMA-AUTH-018`;
- grants, scopes, recursos o autorización final;
- esquema físico definitivo de una sesión;
- tabla física de contexto;
- migraciones o cambios productivos.

---

#### 39. Continuidad

**ÚLTIMA TAREA APROBADA**
`ANIMA-AUTH-006 — Confirmar que el rol esté permitido en el área`

**TAREA ACTUAL APROBADA**
`ANIMA-AUTH-007 — Crear contexto operativo al registrar entrada`

**SIGUIENTE TAREA RESERVADA**
`ANIMA-AUTH-008 — Actualizar contexto cuando cambia el turno`


### ✅ ANIMA-AUTH-008 — Actualizar contexto cuando cambia el turno

**Estado:** APROBADA
**Tarea anterior:** ANIMA-AUTH-007 — Crear contexto operativo al registrar entrada
**Tarea siguiente:** ANIMA-AUTH-009 — Cerrar contexto al registrar salida
**Tipo de tarea:** documental; definición contractual de invalidación y nueva resolución del contexto operativo de ANIMA cuando cambia el turno autoritativo durante una sesión de check-in ya confirmada, sin reescribir la asistencia histórica ni convertir el cambio de turno en autorización
**Bloque:** F_ANIMA — AUTORIZACIÓN Y CONTEXTO OPERATIVO
**Repositorio propietario:** vento-group-sas/vento-shell
**Archivo propietario:** docs/plan-canonico/modular/bloques/F_ANIMA/01_AUTORIZACION_Y_CONTEXTO_OPERATIVO.md
**Estado físico resultante:** contrato documental definido; materialización física diferida por unidad de implementación
**Cambios físicos autorizados:** ninguno durante esta tarea documental; la materialización futura queda sujeta a la topología PER_IMPLEMENTATION_UNIT y al gate POST_E5_PACKAGE
**Requisitos de prueba creados o modificados:** 0

---

#### 1. Propósito

Definir de forma única, segura y verificable qué debe ocurrir con el contexto operativo de ANIMA cuando, después de una entrada confirmada, cambia el turno autoritativo que participa en la resolución.

La tarea protege tres hechos simultáneos:

```text
LA ASISTENCIA HISTORICA NO SE REESCRIBE
+
EL CONTEXTO VIEJO NO CONSERVA AUTORIDAD
+
LA REALIDAD NUEVA SE RESUELVE DE NUEVO EN SERVIDOR
```

La regla raíz queda:

```text
CONTEXTO OPERATIVO RESUELTO
+
CAMBIO RELEVANTE DEL TURNO O DE SU APLICABILIDAD
->
INVALIDAR REUTILIZACION DEL SNAPSHOT ANTERIOR
->
RESOLVER NUEVO ACCESS CONTEXT
->
REEVALUAR AUTORIZACION PARA TODA ACCION POSTERIOR
```

Actualizar contexto no significa mutar un `AccessContext` existente ni editar la sesión de asistencia para que coincida con el nuevo turno.

---

#### 2. Entrada contractual desde ANIMA-AUTH-007

`ANIMA-AUTH-008` consume exactamente el handoff aprobado por `ANIMA-AUTH-007`:

- actor efectivo;
- referencia estable de la sesión de check-in;
- evento de entrada confirmado;
- turno y revisión publicada usados para iniciar la sesión;
- sede operativa;
- área operativa o ausencia site-wide válida;
- rol operativo;
- compatibilidad territorial;
- instante de confirmación;
- snapshot o referencias de versión necesarias para detectar cambios posteriores.

El handoff afirma:

```text
CHECKIN_SERVER_CONFIRMED = TRUE
ACTIVE_CHECKIN_SESSION = PRESENT
OPERATIONAL_CONTEXT_RESOLVABLE = TRUE
```

No afirma:

```text
SHIFT_WILL_NEVER_CHANGE = TRUE
CONTEXT_WILL_REMAIN_FRESH = TRUE
SESSION_CAN_BE_REBOUND = TRUE
PERMISSION_WILL_REMAIN_GRANTED = TRUE
```

La tarea actual comienza cuando uno de los hechos que sostienen ese contexto deja de poder reutilizarse sin una nueva resolución.

---

#### 3. Qué significa “cambia el turno”

Para esta tarea existe cambio relevante cuando una fuente autoritativa o una frontera temporal puede modificar el `active_shift` que se resolvería ahora.

Incluye, según corresponda:

- publicación efectiva de una revisión sucesora;
- retiro de la revisión vigente;
- cancelación;
- cambio de inicio o fin;
- llegada al inicio o fin temporal;
- cambio de sede;
- cambio de área;
- cambio de rol operativo;
- cambio de trabajador atribuido al turno;
- desactivación de sede, área o rol;
- corrección de solapamientos;
- aparición de ambigüedad;
- transición temporal hacia otra ocurrencia de turno.

No todo cambio almacenado es todavía autoritativo. Un borrador posterior sin publicar no modifica el contexto operativo vigente.

---

#### 4. Tres clases de cambio

Toda observación se clasifica primero como una de estas clases:

| Clase | Significado | Efecto contextual |
| --- | --- | --- |
| `NON_AUTHORITATIVE_CHANGE` | borrador, edición no publicada o dato auxiliar sin autoridad | no reemplaza el turno autoritativo |
| `AUTHORITATIVE_CHANGE_SAME_SHIFT` | cambia la revisión o los hechos vigentes de la misma ocurrencia lógica | invalidar el snapshot anterior y volver a resolver |
| `AUTHORITATIVE_CHANGE_DIFFERENT_SHIFT` | la resolución vigente pasa a otra ocurrencia lógica | invalidar el snapshot; no reatar la sesión anterior al nuevo `shift_id` |

La clasificación se hace server-side desde fuentes canónicas. El cliente no puede declarar que un cambio es inocuo.

---

#### 5. Inmutabilidad de la evidencia de entrada

El hecho de asistencia confirmado permanece ligado a la realidad con la que fue aceptado.

Conceptualmente se conserva:

```text
CHECKIN CONFIRMADO
->
shift_id de origen
+
revisión publicada de origen
+
actor
+
instante
+
territorio de origen
+
evidencia de marcacion
```

Una revisión nueva no reescribe retrospectivamente:

- `checked_in_at`;
- el evento original;
- la identidad idempotente;
- el turno de origen;
- la revisión de origen;
- el punto físico;
- la evidencia de geocerca;
- la decisión de validación original.

La actualización del contexto es prospectiva para acciones posteriores.

---

#### 6. Sesión de check-in y snapshot de sesión

La sesión de asistencia conserva su snapshot histórico.

La regla heredada es:

```text
SESSION SNAPSHOT = INMUTABLE
```

Por tanto, un cambio de turno no autoriza:

- modificar silenciosamente el `shift_id` de la sesión;
- sustituir la revisión con la que comenzó;
- cambiar el actor;
- reescribir el check-in;
- reemplazar evidencia territorial histórica;
- convertir una sesión residual en compatible mediante actualización in-place.

La sesión puede continuar siendo utilizable únicamente si, al resolver de nuevo, sigue satisfaciendo las reglas vigentes de compatibilidad.

---

#### 7. `AccessContext` nunca se actualiza in-place

`AccessContext` es un snapshot inmutable.

Ante un cambio relevante:

```text
context_id anterior
->
STALE / NO REUTILIZABLE
```

y después:

```text
resolver fuentes actuales
->
nuevo AccessContext
->
nuevo context_id
```

Dos resoluciones pueden producir el mismo contenido semántico si el cambio observado no altera finalmente los hechos aplicables, pero la decisión de reutilizar autoridad nunca se basa en mutar el snapshot anterior.

---

#### 8. Revisión sucesora de la misma ocurrencia

Cuando se publica una revisión sucesora de la misma ocurrencia lógica de turno:

1. la revisión anterior deja de ser la fuente autoritativa para nuevas resoluciones cuando la sucesora ya sea efectiva;
2. la sesión de check-in conserva como evidencia la revisión con la que inició;
3. se resuelve un nuevo `active_shift`;
4. se comprueba nuevamente actor, vigencia, sede, área y rol;
5. se comprueba si la sesión activa continúa siendo compatible;
6. se produce un nuevo `AccessContext` o se deja el carril operativo no utilizable.

La existencia del mismo `shift_id` no permite omitir la revalidación.

---

#### 9. Revisión guardada pero no publicada

Caso:

```text
REVISION A = PUBLICADA Y VIGENTE
REVISION B = BORRADOR POSTERIOR
```

Resultado:

```text
ACTIVE_SHIFT CONTINUA DESDE A
```

La revisión B:

- no invalida por sí sola la autoridad de A;
- no cambia sede, área o rol en el contexto;
- no modifica la sesión;
- no habilita nueva autorización;
- no se mezcla campo a campo con A.

Solo una transición autoritativa de publicación puede cambiar la revisión usada para nuevas resoluciones.

---

#### 10. Revisión sucesora todavía no efectiva

Una revisión publicada puede contener una frontera temporal futura.

Mientras la nueva realidad todavía no sea aplicable en el instante server-side:

- no se anticipa el cambio;
- no se proyecta el nuevo rol;
- no se cambia sede o área;
- no se extiende ni reduce el turno usando el reloj del cliente.

El `next_temporal_boundary_at` aplicable debe impedir que un snapshot sobreviva a la frontera en la que la realidad pueda cambiar.

---

#### 11. Cambio de hora de inicio

Si la revisión autoritativa cambia el inicio:

- si el nuevo inicio sigue siendo anterior o igual al instante de resolución y el resto de condiciones continúa válido, el contexto se vuelve a resolver con la nueva revisión;
- si el nuevo inicio queda en el futuro, `active_shift` deja de existir hasta alcanzar la nueva frontera;
- una sesión de asistencia que permanezca abierta no convierte por sí sola un turno futuro en vigente;
- las capacidades base independientes permanecen separadas.

La entrada histórica no cambia de hora.

---

#### 12. Cambio de hora de fin

Si la revisión autoritativa acorta el turno de modo que:

```text
resolved_at >= nuevo ends_at
```

entonces:

```text
active_shift = null
active_checkin_session = null para autorización
```

aunque no exista check-out.

Si el turno se extiende:

- la extensión no revive una sesión ya cerrada, expirada o invalidada;
- una sesión todavía abierta puede continuar únicamente si su propia vigencia y compatibilidad lo permiten;
- una expiración explícita de sesión ya alcanzada no se amplía retroactivamente;
- toda acción nueva se evalúa con el contexto fresco.

---

#### 13. Fin temporal sin escritura

El fin del turno invalida por tiempo.

No requiere:

- actualización manual de `status`;
- job previo;
- check-out previo;
- evento Realtime;
- escritura de invalidación;
- interacción del usuario.

La condición temporal canónica permanece semiabierta:

```text
starts_at <= resolved_at < ends_at
```

Al llegar a `ends_at`, el contexto anterior deja de ser utilizable.

---

#### 14. Cambio de sede

Si cambia autoritativamente la sede de la misma ocurrencia:

1. el snapshot anterior queda obsoleto;
2. `operational_site` se resuelve desde el turno actualizado;
3. no se copia la sede del check-in para reparar el turno;
4. la sesión de check-in solo continúa como prerrequisito si su contrato permanece compatible con la nueva resolución;
5. un mismatch concluyente deja `active_checkin_session = null` para autorización;
6. la sede histórica de la entrada no se reescribe.

La geocerca o punto físico de la marcación tampoco se transforma en la nueva sede operativa.

---

#### 15. Cambio de área

Si cambia autoritativamente el área:

- el snapshot anterior queda obsoleto;
- la nueva área se resuelve desde el turno;
- el rol se vuelve a validar contra sede y área;
- el check-in no inventa ni corrige el área;
- una sesión cuyo `area_id` contradice el nuevo turno deja de ser utilizable para el prerrequisito de check-in;
- un rol site-wide puede conservar `operational_area = null` únicamente cuando el contrato aplicable lo permite.

La mecánica empresarial de un cambio temporal de área permanece reservada a `ANIMA-AUTH-011`; esta tarea define solo su efecto de invalidación y nueva resolución.

---

#### 16. Cambio de rol operativo

Si cambia autoritativamente el rol del turno:

1. el rol anterior deja de participar en nuevas decisiones;
2. se valida que el rol nuevo exista y esté activo;
3. se valida nuevamente habilitación por sede;
4. se valida nuevamente compatibilidad por área;
5. `OperationalRoleContext` se vuelve a producir desde el turno;
6. grants o denies se evalúan de nuevo para cada acción.

El check-in no selecciona el rol y el rol base no sirve como fallback.

La sesión histórica puede conservar el rol observado al iniciar para auditoría sin convertir ese snapshot histórico en autoridad actual.

---

#### 17. Cambio de trabajador

Una ocurrencia que deja de pertenecer al mismo actor efectivo no puede mantener el contexto previo.

Si:

```text
current_shift.employee_id != actor_effective.actor_id
```

entonces el turno no es candidato operativo para ese actor.

Queda prohibido:

- reasignar la sesión de check-in;
- cambiar `employee_id` del evento histórico;
- prestar la sesión a otro trabajador;
- mantener el rol o territorio anterior;
- conservar un permiso porque el mismo dispositivo siga activo.

El cambio requiere resolución bajo la identidad correcta y los flujos propietarios correspondientes.

---

#### 18. Cancelación o retiro

Una cancelación o retiro autoritativo produce:

```text
active_shift = null
active_checkin_session = null para autorización
```

La sesión residual no conserva autoridad.

El hecho de asistencia confirmado:

- permanece en historia;
- puede requerir reconciliación administrativa;
- puede originar una novedad o corrección según procesos propietarios;
- no se borra para ocultar la divergencia.

La creación de un evento terminal o el cierre administrativo de asistencia no se define aquí.

---

#### 19. Desactivación de sede, área o rol

Aunque la fila de turno no cambie, una dependencia estructural puede volverla no utilizable.

Si se desactiva:

- la sede;
- el área requerida;
- el rol operativo;
- una habilitación rol-sede;
- una compatibilidad rol-área;

el snapshot operativo queda obsoleto y debe resolverse de nuevo.

Un dato referenciado pero inactivo no se mantiene como autoridad por estar presente en la sesión previa.

---

#### 20. Transición a otra ocurrencia de turno

Cuando la resolución server-side pasa de:

```text
active_shift.shift_id = S1
```

a:

```text
active_shift.shift_id = S2
```

la sesión asociada a S1 no se reata a S2.

La regla de sesión exige coincidencia exacta:

```text
active_checkin_session.shift_id
=
active_shift.shift_id
```

Por tanto, una nueva resolución con S2 solo puede presentar una sesión activa si existe exactamente una sesión server-confirmed compatible con S2.

La tarea no crea esa sesión por inferencia.

---

#### 21. Turnos consecutivos

En dos turnos consecutivos:

```text
S1.ends_at = S2.starts_at
```

la semántica semiabierta hace que exista exactamente un turno vigente en la frontera.

Al llegar al límite:

```text
S1 deja de ser active_shift
S2 puede convertirse en active_shift
```

La sesión de S1 no se convierte automáticamente en sesión de S2.

Para permisos que requieran `T+C`, S2 necesita una sesión activa compatible con S2.

Para permisos cuyo contrato requiera únicamente turno, la evaluación utiliza el nuevo `active_shift` sin inventar check-in.

---

#### 22. Reemplazo de turno

La creación, aprobación y semántica empresarial de un reemplazo de turno pertenecen a `ANIMA-AUTH-012`.

Esta tarea solo fija una consecuencia transversal:

```text
SI EL REEMPLAZO CAMBIA EL ACTIVE_SHIFT AUTORITATIVO
->
EL CONTEXTO ANTERIOR SE INVALIDA
->
SE RESUELVE DE NUEVO
```

No se define aquí:

- cómo se solicita el reemplazo;
- quién lo aprueba;
- cómo se vinculan dos ocurrencias;
- qué notificación se envía;
- qué compensación de asistencia se aplica.

---

#### 23. Turnos que cruzan medianoche

La semántica especial de turnos overnight pertenece a `ANIMA-AUTH-013`.

`ANIMA-AUTH-008` exige únicamente que la invalidación use timestamps absolutos y no interprete el cambio de fecha civil como cambio automático de turno.

```text
CAMBIO DE DIA
!=
CAMBIO DE TURNO
```

El contexto cambia cuando cambia la resolución autoritativa o se alcanza una frontera temporal real.

---

#### 24. Ambigüedad y solapamiento

Si una actualización produce dos o más candidatos vigentes incompatibles:

```text
active_shift = null
```

y el contexto operativo no puede reconstruirse seleccionando:

- primera fila;
- última fila;
- turno con check-in;
- turno de la sede seleccionada;
- turno más reciente;
- turno con rol más específico.

La sesión previa no resuelve la ambigüedad.

La inconsistencia se corrige en la fuente propietaria y las acciones nuevas fallan cerrado.

---

#### 25. Compatibilidad de la sesión después del cambio

Después de resolver el nuevo `active_shift`, la sesión candidata se valida otra vez.

Debe conservar, como mínimo:

```text
session.employee_id = active_shift.employee_id
session.shift_id = active_shift.shift_id
session.site_id = active_shift.site_id
session.status = ACTIVE
session.checked_out_at = null
session no expirada
candidato unico
```

Cuando exista área en la sesión, debe ser compatible con el área del turno.

Un cambio que rompa estas relaciones no se “repara” modificando la sesión histórica.

---

#### 26. Diferencia entre sesión histórica y autoridad actual

La misma sesión puede ser:

```text
HISTORICAMENTE VALIDA
```

y simultáneamente:

```text
NO UTILIZABLE PARA UNA NUEVA AUTORIZACION
```

Esto ocurre, por ejemplo, cuando:

- el turno fue cancelado después de la entrada;
- cambió la sede;
- cambió el `shift_id` activo;
- terminó la ventana temporal;
- la sesión expiró;
- apareció una contradicción concluyente.

Conservar evidencia no equivale a conservar autoridad.

---

#### 27. Frescura e invalidación

Un cambio relevante debe afectar la frescura del carril operativo.

La materialización futura debe preservar la semántica de `operational_lane_generation`, que cambia cuando cambia cualquiera de:

- turno;
- publicación;
- cancelación;
- revisión;
- check-in;
- check-out;
- sesión laboral;
- rol operativo;
- sede operativa;
- área operativa;
- compatibilidad rol-sede o rol-área.

El token o mecanismo equivalente sirve para demostrar frescura. No constituye una fuente empresarial paralela.

---

#### 28. Barrera de escritura

Cuando una escritura autoritativa modifica un hecho que afecta contexto, la secuencia conceptual es:

```text
CONFIRMAR ESCRITURA EMPRESARIAL
+
ACTUALIZAR MECANISMO DE FRESCURA EN LA MISMA BARRERA DE CORRECCION
->
MARCAR CONTEXTO PREVIO COMO NO REUTILIZABLE
->
DESCARTAR MEMOIZACION APLICABLE
->
RESOLVER CONTEXTO NUEVO
->
PRODUCIR NUEVA DECISION
```

No es aceptable:

```text
COMMIT DEL CAMBIO
+
INVALIDACION BEST EFFORT COMO UNICA GARANTIA
```

La implementación física transaccional permanece bajo `AUTH-DB-035` y consumidores relacionados.

---

#### 29. Caché y proyecciones de cliente

Una caché o proyección visual no conserva autoridad después de un cambio de turno.

Queda prohibido:

- stale-while-revalidate para contexto que influya en autorización;
- servir un snapshot con token de frescura anterior;
- conservar “el último rol” mientras se actualiza;
- mantener la sede anterior hasta que llegue Realtime;
- autorizar usando una proyección de cliente todavía visible.

Una proyección segura puede mostrar estado transitorio, pero las acciones nuevas deben usar servidor y contexto fresco.

---

#### 30. Realtime y señales de cambio

Realtime, notificaciones, polling o eventos internos pueden acelerar la convergencia.

Su semántica es:

```text
SIGNAL
->
INVALIDATE / REFRESH
```

No:

```text
SIGNAL PAYLOAD
->
NEW AUTHORITY
```

El consumidor no adopta ciegamente sede, área, rol, horario o revisión desde un payload de notificación.

Después de la señal se leen fuentes autoritativas.

---

#### 31. Acciones en vuelo y TOCTOU

Un cambio puede ocurrir entre render, evaluación y mutación.

Por tanto, toda acción protegida posterior debe:

1. resolver o validar el contexto actual;
2. resolver el recurso actual;
3. evaluar autorización actual;
4. aplicar controles de concurrencia;
5. ejecutar el efecto solo si todo sigue vigente.

Una decisión tomada antes del cambio no es un token de ejecución.

Si el turno cambia después de mostrar un botón pero antes de la escritura, la visibilidad del botón no conserva autoridad.

---

#### 32. Cola offline

Una acción pendiente offline conserva intención, no autoridad.

Si el turno cambia mientras el dispositivo está desconectado:

- no se usa el contexto capturado como autorización futura;
- no se reata el evento a otro turno;
- no se ejecuta con el rol anterior;
- no se conserva territorio anterior;
- la sincronización debe reautorizar con contexto fresco.

La arquitectura de cola pertenece a `ANIMA-AUTH-014` y la revalidación completa al sincronizar pertenece a `ANIMA-AUTH-015`.

---

#### 33. Matriz de actualización

| Cambio observado | `active_shift` nuevo | Sesión previa | Resultado para contexto nuevo |
| --- | --- | --- | --- |
| borrador no publicado | mismo | misma | no cambia por ese borrador |
| revisión publicada misma ocurrencia, sin cambio material aplicable | mismo hecho semántico | compatible | nueva resolución puede conservar contenido equivalente |
| misma ocurrencia, cambio de rol válido | misma ocurrencia | puede seguir abierta | revalidar rol y producir contexto nuevo |
| misma ocurrencia, cambio de sede | nueva sede | incompatible si conserva sede anterior | no usar sesión incompatible |
| misma ocurrencia, cambio de área | nueva área | revalidar | conservar solo si compatible |
| inicio movido al futuro | `null` hasta nueva frontera | puede existir históricamente | sin contexto operativo vigente |
| fin movido antes o igual a ahora | `null` | deja de ser activa para autorización | sin contexto operativo |
| turno cancelado o retirado | `null` | residual | sin contexto operativo |
| transición S1 a S2 | S2 | sesión S1 | no reatar; S2 necesita sesión compatible cuando el permiso exige check-in |
| dos candidatos vigentes | `null` | no resuelve ambigüedad | fail closed |
| sede, área o rol desactivados | inválido o `null` | no repara | fail closed |
| fuente obligatoria no verificable | no concluyente | no usar como prueba | fail closed técnico |

---

#### 34. Estado físico observado

La inspección de solo lectura del entorno desplegado muestra una implementación todavía legacy respecto de este contrato:

| Superficie | Estado observado |
| --- | --- |
| `employee_shifts` | 3436 filas observadas; 3309 con `published_at` |
| identidad explícita de revisión/version en `employee_shifts` | no observada |
| triggers de `employee_shifts` | 2 observados; control mensual de publicación y `updated_at` |
| invalidación/generación de contexto disparada por cambio de turno | no observada en los triggers inspeccionados |
| tabla o función con nombre de freshness/context generation/cache | no observada |
| `attendance_shift_events` | existe; 210 filas observadas en el snapshot |
| referencia explícita de revisión de turno en `attendance_shift_events` | no observada |
| `get_operational_context` | resolver legacy que selecciona turno y check-in por consultas separadas |
| selección legacy de turno | usa orden temporal y `limit 1` |
| selección legacy de check-in abierto | usa el último evento abierto y `limit 1` |
| fallback territorial legacy | puede mezclar sede solicitada, seleccionada, check-in, turno y sede del empleado |
| bypass legacy | todavía contiene excepciones de administración global y permiso de bypass |

Estas observaciones son evidencia de adopción física pendiente, no definición del contrato objetivo.

Los conteos corresponden al instante de inspección y no se congelan como invariantes empresariales.

---

#### 35. Brechas físicas y propietarios

Las brechas detectadas ya tienen propietarios canónicos:

| Brecha | Propietario existente | Condición de salida |
| --- | --- | --- |
| resolver un `AccessContext` canónico sin fallbacks legacy | `AUTH-DB-033` | actor, turno, check-in, rol y territorio se resuelven desde fuentes canónicas |
| evaluar autorización con contexto fresco | `AUTH-DB-034` | toda decisión usa el contexto actual y conserva precedencia |
| invalidación transaccional por cambio de turno | `AUTH-DB-035` | una escritura relevante cambia la generación aplicable y evita reutilizar stale |
| memoización, caché y single-flight seguros | `SHELL-CTX-006` | ninguna entrada stale puede influir en autorización |
| reacción específica de ANIMA al cambio | instancia futura de `ANIMA-AUTH-008` | cliente y servidor convergen a un nuevo contexto sin reescribir asistencia |
| cierre por salida | `ANIMA-AUTH-009` | checkout cierra la sesión exacta y revoca contexto dependiente |
| cambio temporal de área | `ANIMA-AUTH-011` | flujo propio cambia área sin mezclar autoridad histórica |
| reemplazo de turno | `ANIMA-AUTH-012` | reemplazo conserva identidad, historia y transición propietaria |
| overnight | `ANIMA-AUTH-013` | fronteras usan intervalos absolutos |
| cola y sincronización | `ANIMA-AUTH-014` y `ANIMA-AUTH-015` | toda intención pendiente se reautoriza y reconcilia |
| auditoría | `ANIMA-AUTH-018` | antes, cambio y después pueden reconstruirse |
| prohibición de grants locales | `ANIMA-AUTH-019` | ANIMA nunca convierte cambio de turno en concesión |
| confirmación transversal | `INT-WORK-004` | contexto efectivo se invalida y revalida ante cambio relevante |

No se crea una tarea adicional.

---

#### 36. Topología y materialización física

La definición documental se aprueba una sola vez en este marcador.

```text
MODE = PER_IMPLEMENTATION_UNIT
EXECUTION_GATE = POST_E5_PACKAGE
INSTANCE_PATTERN = ANIMA-AUTH-008::implementation_unit_id
```

La materialización futura:

- requiere una unidad de implementación real;
- requiere el paquete propietario aplicable;
- requiere el gate E5 correspondiente;
- debe identificar productores y consumidores físicos del cambio;
- debe conservar rollback;
- debe conservar compatibilidad con asistencia histórica;
- debe usar los mecanismos canónicos de frescura cuando estén materializados;
- debe ejecutar todo cambio Supabase desde `vento-group-sas/vento-shell`.

Esta tarea no autoriza DDL, DML, migraciones, RLS, RPC, Edge Functions, cambios de código, datos productivos ni despliegues.

---

#### 37. Requisitos de prueba derivados

NO GENERA REQUISITOS DE PRUEBA.

**Requisitos creados:** 0

**Requisitos modificados:** 0

**Requisitos diferidos:** 0

**Requisitos obsoletos:** 0

La cobertura vigente ya exige invalidación comprobable por cambio de turno, reautorización, consistencia de contexto operativo, compatibilidad territorial, auditoría y rechazo de decisiones obsoletas. La tarea especializa esas obligaciones para ANIMA sin cambiar el registro.

---

#### 38. Cobertura de prueba vigente reutilizada

Sin modificarlos, se reutilizan:

- `TREQ-AUTH-008`: capacidades operativas dependen de turno vigente, check-in cuando aplique, rol y territorio compatibles;
- `TREQ-AUTH-009`: sede y área efectivas se resuelven determinísticamente y una rotación recalcula permisos;
- `TREQ-AUTH-014`: cambio de turno, área, trabajador, dispositivo, rol o asignación invalida contexto, caché y tokens derivados;
- `TREQ-AUTH-015`: decisiones y acciones conservan evidencia correlacionable de turno, check-in, rol, territorio, contexto y timestamp;
- `TREQ-ANIMA-003`: una intención offline conserva identidad estable y no produce efectos duplicados al sincronizar.

Esta enumeración es trazabilidad y no representa requisitos afectados por la tarea.

---

#### 39. Evidencia de validación

| Clase | Estado | Evidencia |
| --- | --- | --- |
| BUILD | NOT_EXECUTED | La batería real del checkout se ejecuta después de insertar y normalizar la tarea. |
| LOCAL | PASS | El artefacto aislado fue comprobado por estructura, metadata, continuidad, secciones obligatorias, UTF-8, EOL y cero requisitos afectados en la sección derivada. |
| REMOTA | PASS | Se contrastaron `main`, continuidad, owner, topología, contratos de turno/check-in, invalidación, integración, 04A, scripts vigentes y estado Supabase mediante lecturas de solo lectura. |
| OPERATIVA | NOT_EXECUTED | No se modificó un turno real ni se ejercitó una sesión de trabajador. |
| FÍSICA | NOT_EXECUTED | No se ejecutaron migraciones, DDL, DML, RLS, RPC, cambios de código, datos ni despliegues. |

---

#### 40. Criterios de aceptación

La tarea queda aceptable cuando:

1. consume exactamente el handoff de `ANIMA-AUTH-007`;
2. distingue borrador no autoritativo, cambio autoritativo de la misma ocurrencia y transición a otra ocurrencia;
3. un borrador no publicado no cambia el contexto vigente;
4. una revisión sucesora efectiva invalida el snapshot anterior;
5. el evento de entrada original nunca se reescribe para coincidir con la revisión nueva;
6. la sesión conserva su identidad y evidencia histórica;
7. `AccessContext` no se actualiza in-place;
8. un cambio relevante produce una nueva resolución;
9. `context_id` no se usa como sesión permanente;
10. el turno se resuelve siempre en servidor;
11. una revisión se consume completa y no se mezclan campos de versiones distintas;
12. mover el inicio al futuro elimina `active_shift` hasta la nueva frontera;
13. acortar el fin por debajo del instante actual elimina autoridad operativa;
14. extender el turno no revive una sesión cerrada o expirada;
15. el fin temporal invalida sin depender de una escritura;
16. un cambio de sede revalida sesión y territorio;
17. un cambio de área revalida sesión, rol y territorio;
18. un cambio de rol revalida catálogo, sede, área y permisos;
19. un cambio de trabajador nunca reasigna una sesión existente;
20. cancelación o retiro eliminan el contexto operativo dependiente;
21. desactivación de sede, área, rol o compatibilidad invalida el snapshot;
22. una transición a otro `shift_id` no reata la sesión anterior;
23. turnos consecutivos usan la frontera semiabierta;
24. un nuevo turno que exige check-in necesita una sesión compatible propia;
25. la semántica empresarial de reemplazos permanece en `ANIMA-AUTH-012`;
26. la semántica especial overnight permanece en `ANIMA-AUTH-013`;
27. una ambigüedad de turnos falla cerrada;
28. el check-in no se usa para escoger entre turnos;
29. la sesión se valida nuevamente contra el `active_shift`;
30. una sesión históricamente válida puede dejar de ser utilizable para nueva autorización;
31. los cambios relevantes afectan la frescura del carril operativo;
32. la barrera de escritura impide reutilizar memoización previa;
33. caché y proyecciones cliente no conservan autoridad stale;
34. Realtime es señal de relectura y no fuente propietaria;
35. toda mutación protegida revalida contexto y recurso actuales;
36. las colas offline se reautorizan al sincronizar;
37. los estados base independientes no se eliminan por un cambio operativo;
38. el contexto actualizado no equivale a permiso concedido;
39. las brechas físicas permanecen asignadas a propietarios existentes;
40. no se crean ni modifican requisitos de prueba;
41. no se ejecutan cambios físicos.

---

#### 41. Límites

Esta tarea no define:

- creación inicial del contexto al entrar, propiedad de `ANIMA-AUTH-007`;
- cierre del contexto al registrar salida, propiedad de `ANIMA-AUTH-009`;
- semántica de descansos, propiedad de `ANIMA-AUTH-010`;
- flujo empresarial de cambio temporal de área, propiedad de `ANIMA-AUTH-011`;
- flujo empresarial de reemplazos, propiedad de `ANIMA-AUTH-012`;
- construcción específica de turnos cruzados de medianoche, propiedad de `ANIMA-AUTH-013`;
- cola offline, propiedad de `ANIMA-AUTH-014`;
- revalidación completa de cola sincronizada, propiedad de `ANIMA-AUTH-015`;
- diagnóstico visible, propiedad de `ANIMA-AUTH-016` y `ANIMA-AUTH-017`;
- auditoría detallada, propiedad de `ANIMA-AUTH-018`;
- grants o permisos directos, prohibidos y gobernados por `ANIMA-AUTH-019`;
- esquema físico de revisiones;
- tabla física de sesiones;
- diseño físico de freshness token;
- estrategia final de caché;
- publicación administrativa del turno;
- migraciones o cambios productivos.

---

#### 42. Continuidad

**ÚLTIMA TAREA APROBADA**
`ANIMA-AUTH-007 — Crear contexto operativo al registrar entrada`

**TAREA ACTUAL APROBADA**
`ANIMA-AUTH-008 — Actualizar contexto cuando cambia el turno`

**SIGUIENTE TAREA RESERVADA**
`ANIMA-AUTH-009 — Cerrar contexto al registrar salida`


### ✅ ANIMA-AUTH-009 — Cerrar contexto al registrar salida

**Estado:** APROBADA
**Tarea anterior:** ANIMA-AUTH-008 — Actualizar contexto cuando cambia el turno
**Tarea siguiente:** ANIMA-AUTH-010 — Manejar descansos sin cerrar autorización
**Tipo de tarea:** documental; definición contractual del cierre de la sesión de asistencia y de la invalidación del contexto dependiente cuando una salida queda confirmada, preservando identidad de sesión, idempotencia, evidencia histórica, carril base y reautorización posterior
**Bloque:** F_ANIMA — AUTORIZACIÓN Y CONTEXTO OPERATIVO
**Repositorio propietario:** vento-group-sas/vento-shell
**Archivo propietario:** docs/plan-canonico/modular/bloques/F_ANIMA/01_AUTORIZACION_Y_CONTEXTO_OPERATIVO.md
**Estado físico resultante:** contrato documental definido; materialización física diferida por unidad de implementación
**Cambios físicos autorizados:** ninguno durante esta tarea documental; la materialización futura queda sujeta a la topología PER_IMPLEMENTATION_UNIT y al gate POST_E5_PACKAGE
**Requisitos de prueba creados o modificados:** 0

---

#### 1. Propósito

Definir de forma única, segura y verificable qué significa cerrar el contexto de ANIMA al registrar una salida.

La salida debe cerrar exactamente la sesión de asistencia que estaba abierta y retirar toda autoridad que dependa de esa sesión, sin borrar el turno, sin cerrar la autenticación, sin revocar capacidades base independientes y sin convertir el checkout en una decisión general de autorización.

La regla raíz queda:

```text
INTENCION DE SALIDA
+
ACTOR EFECTIVO RESUELTO
+
SESION DE ASISTENCIA EXACTA
+
VALIDACIONES APLICABLES
+
PERSISTENCIA CONFIRMADA
+
COMMIT
->
SESION CLOSED
+
ACTIVE_CHECKIN_SESSION = NULL EN LA NUEVA RESOLUCION
+
CONTEXTO DEPENDIENTE INVALIDADO
+
NUEVA DECISION PARA TODA ACCION POSTERIOR
```

No existe cierre autoritativo por cambio optimista de interfaz.

---

#### 2. Handoff consumido desde ANIMA-AUTH-008

`ANIMA-AUTH-009` consume el resultado de `ANIMA-AUTH-008` sin reabrir la semántica de actualización por cambio de turno.

Antes de la salida puede existir un contexto fresco con:

- actor efectivo;
- empleado;
- `active_shift`;
- referencia de revisión publicada;
- `active_checkin_session`;
- rol operativo;
- sede operativa;
- área operativa cuando corresponda;
- dispositivo o sesión de actor cuando aplique;
- `context_id`;
- evidencia de frescura.

La tarea actual añade una transición terminal sobre la sesión de asistencia.

No modifica retroactivamente el contexto con el que se registró la entrada.

---

#### 3. Separación conceptual obligatoria

Deben permanecer separados:

| Concepto | Significado |
| --- | --- |
| intención de salida | solicitud todavía no confirmada |
| evento de salida recibido | solicitud dentro de la frontera server-side |
| evento de salida confirmado | hecho persistido y confirmado |
| sesión cerrada | sesión exacta alcanzó un estado terminal por salida aplicable |
| contexto invalidado | un snapshot anterior ya no puede reutilizarse |
| contexto fresco posterior | nueva resolución después del cierre |
| permiso posterior | decisión nueva sobre una acción concreta |

Por tanto:

```text
BOTON "SALIR"
!=
CHECKOUT CONFIRMADO
```

y:

```text
CHECKOUT CONFIRMADO
!=
LOGOUT DE AUTENTICACION
```

y:

```text
SESION CLOSED
!=
TODOS LOS PERMISOS DENEGADOS
```

---

#### 4. Forma contractual de la sesión conservada

La tarea reutiliza sin ampliar la forma conceptual vigente:

```ts
type ActiveCheckinContext = {
  checkin_session_id: string;
  employee_id: string;
  shift_id: string;
  site_id: string;
  area_id: string | null;
  checked_in_at: string;
  expires_at: string | null;
  checked_out_at: string | null;
  status: "ACTIVE" | "EXPIRED" | "CLOSED" | "INVALID";
};
```

Para una sesión activa:

```text
status = ACTIVE
checked_out_at = null
```

Después de una salida confirmada aplicable:

```text
status normalizado = CLOSED
checked_out_at = instante autoritativo del cierre
```

y el nuevo `AccessContext` no presenta esa sesión como `active_checkin_session`.

---

#### 5. Identidad exacta de la sesión que se cierra

El checkout debe aplicarse a una única sesión de asistencia.

La identidad propietaria es:

```text
checkin_session_id
```

La sesión no se identifica únicamente mediante:

- `employee_id`;
- `shift_id`;
- `site_id`;
- timestamp;
- último `check_in`;
- último evento del trabajador;
- última fila recibida;
- última sede utilizada;
- estado local de ANIMA.

Una salida no puede cerrar una sesión distinta porque parezca ser la candidata más reciente.

---

#### 6. Resolución server-side de la sesión

La frontera autoritativa debe resolver o validar en servidor la sesión objetivo.

Para aceptar el cierre deben poder demostrarse, según corresponda:

1. identidad del actor;
2. vínculo del actor con el empleado;
3. identidad estable de la intención;
4. sesión objetivo;
5. pertenencia de la sesión al mismo empleado;
6. estado previo de la sesión;
7. relación con turno y revisión;
8. secuencia temporal;
9. política territorial o física aplicable;
10. ausencia de una transición terminal incompatible ya confirmada;
11. idempotencia;
12. concurrencia;
13. resultado de persistencia.

El cliente puede transportar referencias, pero no declarar que una sesión está abierta.

---

#### 7. Checkout accesible sin permiso operativo vigente

Cerrar una sesión de asistencia no puede depender de conservar el mismo permiso operativo que el propio checkout debe retirar.

La regla es:

```text
SIN PERMISO OPERATIVO
!=
BLOQUEAR CHECKOUT
```

Esto permite cerrar una sesión cuando:

- el permiso operativo ya no está disponible;
- el turno terminó;
- el contexto quedó obsoleto;
- una revisión cambió;
- el carril operativo dejó de ser utilizable;
- la interfaz ya no puede ejecutar otras acciones operativas.

La accesibilidad del cierre no elimina los controles de identidad, sesión, secuencia, idempotencia, territorio físico cuando aplique ni auditoría.

---

#### 8. Ausencia de `active_shift` no impide cerrar una sesión histórica abierta

La resolución de autorización puede producir:

```text
active_shift = null
```

mientras el dominio de asistencia todavía necesita reconciliar una sesión abierta.

La salida debe seguir vinculándose a la sesión realmente abierta y a su historia.

Queda prohibido:

- fabricar un `active_shift` para permitir el cierre;
- elegir el turno actual visible;
- reasignar la sesión a otro turno;
- borrar la sesión porque el turno ya no esté vigente;
- usar la ausencia de permiso como razón para impedir el cierre.

El resultado posterior de autorización se calcula desde la nueva realidad.

---

#### 9. Turno y revisión de la sesión

La salida conserva la relación histórica de la sesión con:

```text
shift_id
+
revisión publicada con la que la sesión quedó contextualizada
```

Una revisión posterior del turno no reescribe la sesión de origen.

Si existe una decisión autoritativa que modifica la relación histórica, debe pertenecer a su flujo propietario de corrección y conservar evidencia.

El checkout ordinario no corrige programación.

---

#### 10. Actor efectivo

La sesión que se cierra debe pertenecer al actor humano aplicable.

Regla:

```text
session.employee_id
=
effective_actor.employee_id
```

cuando el checkout es personal.

Queda prohibido:

- cerrar una sesión de otro trabajador;
- usar el último actor del dispositivo;
- usar un rol compartido como identidad;
- confiar en un `employee_id` manipulable como única prueba;
- transferir una sesión porque dos trabajadores usan la misma sede.

Una corrección o cierre administrativo sigue un contrato distinto y exige autoridad explícita.

---

#### 11. Dispositivo compartido

En un dispositivo compartido deben permanecer separadas:

```text
SESION TECNICA DEL DISPOSITIVO
SESION DE ACTOR HUMANO
SESION DE ASISTENCIA
```

Cerrar la sesión de asistencia:

- no cierra automáticamente la sesión técnica;
- no cierra automáticamente la sesión ligera del actor;
- no convierte al dispositivo en trabajador;
- no permite cerrar la sesión del actor anterior;
- no presta autoridad administrativa del principal técnico.

La atribución del checkout conserva al humano efectivo.

---

#### 12. Intención idempotente de salida

Toda salida reintentable debe poseer una identidad estable antes del primer envío.

Conceptualmente:

```text
checkout_intent_id
+
contenido logico
+
checkin_session_id
```

deben permitir recuperar un resultado estable.

La implementación puede reutilizar el identificador canónico de intención de asistencia ya aprobado; esta tarea no crea un namespace público nuevo.

---

#### 13. Replay de la misma salida

Para la misma identidad y el mismo contenido:

```text
PRIMER INTENTO
->
CIERRE CONFIRMADO

REPLAY
->
MISMO RESULTADO
+
CERO EFECTO ADICIONAL
```

El replay no crea:

- un segundo checkout;
- otra sesión;
- otra hora de cierre;
- otro cierre de contexto;
- una corrección implícita.

La respuesta debe permitir al cliente converger al resultado ya confirmado.

---

#### 14. Misma identidad con contenido distinto

Si la misma identidad idempotente reaparece con contenido materialmente distinto:

```text
CONFLICT
```

No se corrige silenciosamente.

Son diferencias materiales, según el contrato propietario aplicable:

- sesión objetivo;
- actor;
- acción;
- turno o revisión contextualizada;
- instante declarado cuando forme parte de la intención;
- sede o punto físico cuando sea obligatorio;
- contenido cuya igualdad sea necesaria para demostrar el mismo evento lógico.

El conflicto produce cero efecto adicional.

---

#### 15. Sesión ya cerrada

Se distinguen dos casos:

##### Replay del mismo evento lógico

Devuelve el resultado existente.

##### Nueva intención distinta contra una sesión ya cerrada

No produce un segundo cierre.

La frontera puede clasificarla como sesión ya cerrada o conflicto según el contrato de asistencia, pero siempre debe cumplir:

```text
SECOND_TERMINAL_EFFECT = 0
```

No se cambia `checked_out_at` por el último intento.

---

#### 16. Concurrencia entre dos checkouts

Dos solicitudes concurrentes contra la misma sesión deben serializarse o producir un resultado equivalente.

Resultado permitido:

```text
UNA TRANSICION TERMINAL
+
UN RESULTADO RECUPERABLE
```

No permitido:

```text
DOS CHECKOUTS CONFIRMADOS COMO EFECTOS INDEPENDIENTES
```

La implementación futura puede usar lock, versión, comparación atómica o mecanismo equivalente, sin cambiar la semántica.

---

#### 17. Concurrencia con otro evento terminal

El checkout puede competir con:

- auto-close;
- cierre administrativo;
- expiración;
- invalidación;
- reemplazo;
- otro checkout;
- una corrección propietaria.

La primera transición terminal autoritativa aplicable determina el estado.

Las demás operaciones deben:

- recuperar el estado;
- no duplicar efectos;
- conservar la causa real;
- no sobrescribir el cierre ya confirmado.

El orden de recepción por sí solo no sustituye el orden autoritativo.

---

#### 18. Concurrencia con un cambio de turno

Si el turno cambia mientras se procesa la salida:

1. la sesión no se reata al turno nuevo;
2. la salida sigue apuntando a la sesión exacta;
3. la relación histórica con el turno de origen se conserva;
4. la autorización posterior se resuelve con la realidad vigente;
5. ningún snapshot anterior se reutiliza como autoridad.

`ANIMA-AUTH-008` conserva la propiedad del cambio de turno; esta tarea conserva la propiedad del cierre de la sesión.

---

#### 19. `occurred_at` y confirmación server-side

El instante de ocurrencia y el instante de confirmación son distintos.

Una salida puede conservar un `occurred_at` capturado por el cliente, incluido offline, pero el servidor debe:

- validarlo;
- preservar su zona o interpretación contractual;
- validar secuencia;
- evitar tiempos imposibles;
- registrar el instante de confirmación;
- no usar el reloj cliente como autoridad para decidir permisos actuales.

El contexto deja de usar la sesión solo cuando el estado autoritativo permite concluir el cierre o cuando otra causa autoritativa ya la invalidó.

---

#### 20. Persistencia antes de revocar por checkout

La secuencia de un checkout normal es:

```text
INTENCION
->
VALIDACION
->
PERSISTENCIA
->
COMMIT
->
EVENTO DE SALIDA CONFIRMADO
->
SESION CLOSED
->
INVALIDACION DEL CONTEXTO DEPENDIENTE
```

No es:

```text
TOCAR "SALIR"
->
QUITAR AUTORIDAD LOCAL
->
INTENTAR PERSISTIR DESPUES
```

Un fallo de persistencia no puede presentarse como cierre confirmado.

---

#### 21. Resultado desconocido

Una respuesta puede perderse después del commit.

En ese caso:

```text
UNKNOWN OUTCOME
->
RECUPERAR POR IDENTIDAD
->
NO REPETIR A CIEGAS
```

El cliente no genera automáticamente una nueva intención.

Debe recuperar si:

- el checkout fue aplicado;
- fue duplicado idempotentemente;
- quedó en conflicto;
- no produjo efecto.

La pérdida de respuesta no cambia la historia empresarial.

---

#### 22. Cola offline

Una salida offline:

```text
PERSISTIDA LOCALMENTE
!=
CERRADA EN SERVIDOR
```

Mientras permanezca pendiente:

- la interfaz puede mostrar estado pendiente;
- el evento mantiene su identidad;
- no se crea un segundo evento al reconectar;
- la sincronización revalida actor, sesión, turno/revisión histórica, secuencia, territorio y políticas aplicables;
- el contexto server-side no se declara cerrado por la sola cola local.

La arquitectura de cola permanece en `ANIMA-AUTH-014` y la revalidación al sincronizar en `ANIMA-AUTH-015`.

---

#### 23. Efecto autoritativo sobre `ActiveCheckinContext`

Después del checkout confirmado:

```text
session.status = CLOSED
session.checked_out_at != null
```

En la siguiente resolución real:

```text
active_checkin_session = null
```

Una sesión `CLOSED` puede conservarse en historial y auditoría, pero no aparece como sesión activa.

No se elimina para hacer que el contexto “quede limpio”.

---

#### 24. Efecto sobre `AccessContext`

El `AccessContext` utilizado antes del checkout queda obsoleto para acciones posteriores.

Debe ocurrir:

```text
CONTEXTO ANTERIOR
->
NO REUTILIZABLE

NUEVA SOLICITUD
->
NUEVA RESOLUCION
->
NUEVO context_id
```

El checkout no actualiza `context_id` in-place.

El mismo turno puede seguir vigente, pero el nodo `active_checkin_session` cambia.

---

#### 25. `active_shift` puede permanecer vigente

Cerrar el check-in no equivale a terminar el turno publicado.

Si el turno todavía es temporalmente vigente:

```text
active_shift != null
active_checkin_session = null
```

puede ser un resultado válido.

Por tanto, esta tarea no fuerza:

```text
active_shift = null
```

solo porque ocurrió un checkout.

El fin, cancelación o retiro del turno se rigen por sus propios contratos.

---

#### 26. Efecto por modalidad de autorización

Después del checkout, toda acción nueva se evalúa desde contexto fresco.

La consecuencia depende del contrato del permiso:

| Modalidad operativa | Efecto de `active_checkin_session = null` |
| --- | --- |
| sin carril operativo | no adquiere dependencia de check-in por esta tarea |
| `T` | no se convierte en `T+C`; continúa sujeto a turno y demás gates |
| `T+C` | el carril operativo no satisface el prerrequisito de check-in |

Así se evita convertir el checkout en una revocación indiscriminada de capacidades no dependientes de presencia.

---

#### 27. Carril base y capacidades administrativas

El checkout no revoca por sí solo:

- autenticación;
- identidad;
- rol base;
- cobertura administrativa;
- capacidades base;
- acceso a funciones administrativas cuyo contrato no exige check-in;
- sesión técnica del dispositivo.

La regla es:

```text
CHECKOUT
->
CIERRA PRESENCIA Y CONTEXTO DEPENDIENTE

CHECKOUT
-/>
BORRA CARRIL BASE
```

Una denegación o revocación independiente conserva sus propias reglas.

---

#### 28. Rol y territorio después del checkout

El turno vigente puede continuar aportando hechos de rol, sede y área a una resolución fresca.

Esto no significa que exista presencia.

Por tanto:

```text
operational_role != null
operational_site != null
active_checkin_session = null
```

puede coexistir cuando el turno siga vigente y los resolutores lo permitan.

La decisión final de cada permiso conserva sus prerrequisitos exactos.

---

#### 29. Caché, memoización y freshness

El checkout confirmado es un hecho invalidante para todo contexto cuya autoridad dependa de la sesión.

La materialización futura debe asegurar que:

- la generación o mecanismo de frescura aplicable cambie;
- una entrada compartida stale no pueda servirse;
- la memoización de solicitud no sobreviva una barrera de escritura relevante;
- una proyección de cliente no se utilice como autoridad;
- una decisión anterior no se reutilice como bearer token.

La purga de caché es optimización; la prueba de frescura es la barrera de corrección.

---

#### 30. Realtime y actualización de interfaz

Una señal Realtime puede acelerar la convergencia después del checkout.

Su semántica es:

```text
CHECKOUT CONFIRMADO
->
SIGNAL
->
INVALIDAR / REFRESCAR
->
RESOLVER
```

No:

```text
PAYLOAD REALTIME
->
AUTORIDAD NUEVA
```

Si Realtime falla, el servidor no puede seguir autorizando con la sesión cerrada.

---

#### 31. Acción protegida concurrente con checkout

Puede ocurrir que una acción operativa y el checkout compitan.

Ninguna decisión tomada antes del checkout conserva automáticamente derecho a ejecutar después.

La frontera propietaria de la acción debe aplicar:

- contexto actual;
- recurso actual;
- autorización actual;
- control de concurrencia;
- revalidación antes del efecto cuando el contrato lo exige.

Una UI abierta antes del checkout no garantiza autoridad posterior.

---

#### 32. Checkout durante un descanso

Descanso y checkout son conceptos distintos:

```text
ON_BREAK
!=
CHECKOUT
```

Una sesión cerrada no puede seguir aportando autoridad por existir un descanso abierto asociado.

Sin embargo, esta tarea no define si el checkout:

- finaliza explícitamente el descanso;
- produce un evento terminal de descanso;
- requiere una transición previa;
- conserva un intervalo de descanso abierto para reconciliación.

Esa semántica pertenece a `ANIMA-AUTH-010`.

La obligación de esta tarea es que una sesión `CLOSED` no mantenga un descanso como fuente de autoridad operativa.

---

#### 33. Expiración sin checkout

La expiración puede retirar autoridad antes de existir un evento de salida.

Por tanto:

```text
EXPIRACION
->
ACTIVE_CHECKIN_SESSION = NULL
```

no necesita esperar un checkout.

Si el trabajador registra o sincroniza después una salida válida:

- la salida puede cerrar o reconciliar la sesión histórica;
- no crea autoridad retroactiva;
- no cambia la hora original de expiración;
- no transforma el periodo posterior a la expiración en tiempo autorizado.

La expiración y el checkout conservan causas distintas.

---

#### 34. Auto-close

Un auto-close confirmado es una transición terminal distinta de una salida manual.

Debe ser:

- atribuible al mecanismo que lo produjo;
- correlacionable con la sesión;
- idempotente;
- auditable;
- compatible con el turno y la política que lo habilitó;
- incapaz de generar un segundo cierre si ya existe uno.

La revocación de autoridad no puede depender exclusivamente de que un job de auto-close llegue a ejecutarse.

---

#### 35. Cierre administrativo y corrección

Un cierre administrativo requiere autoridad propia y auditoría.

No se confunde con checkout personal.

Una corrección posterior:

```text
CORRECCION
!=
BORRADO DEL CHECKOUT ORIGINAL
```

Debe preservar, según corresponda:

- evento original;
- sesión;
- antes;
- después;
- actor que corrige;
- razón;
- evidencia;
- instante;
- impacto derivado.

La corrección histórica no concede autorización retroactiva.

---

#### 36. Geocerca y punto físico de salida

Cuando la política de salida exija geocerca, precisión o punto físico:

- la evidencia debe validarse en servidor;
- el punto físico no reemplaza la sede operativa;
- no se inventa un radio en esta tarea;
- no se acepta ubicación manipulada como autoridad;
- una excepción debe tener contrato propio.

La accesibilidad del checkout sin permiso operativo no significa bypass de las políticas físicas que realmente sean aplicables.

---

#### 37. Clases funcionales de resultado

Sin crear un catálogo público nuevo, la implementación futura debe poder distinguir al menos estas clases:

| Clase funcional | Significado |
| --- | --- |
| cierre aplicado | una sesión abierta exacta quedó cerrada |
| replay recuperado | la misma intención ya había determinado el cierre |
| sesión ya cerrada | no existe segundo efecto para una intención nueva |
| conflicto | identidad, contenido, actor, sesión o secuencia incompatibles |
| sesión no resoluble | no puede demostrarse qué sesión debe cerrarse |
| sesión de otro actor | la sesión no pertenece al actor efectivo |
| fuente no disponible | no puede verificarse concluyentemente el estado |
| resultado desconocido | debe recuperarse el outcome antes de repetir |

Estas clases no sustituyen los reason codes transversales existentes ni autorizan a inventar nuevos códigos públicos.

---

#### 38. Matriz de cierre

| Caso | Estado previo | Evento | Resultado |
| --- | --- | --- | --- |
| salida normal | sesión exacta `ACTIVE` | confirmado | sesión `CLOSED`; nuevo contexto sin check-in activo |
| mismo evento repetido | ya aplicado | replay idéntico | mismo resultado; cero efecto adicional |
| nueva salida contra sesión cerrada | `CLOSED` | identidad nueva | cero efecto adicional |
| identidad repetida con contenido distinto | cualquiera | conflicto | cero efecto adicional |
| sesión de otro actor | activa | solicitud | denegar cierre |
| sesión ambigua | más de una candidata | solicitud | fail closed |
| turno terminó pero sesión histórica sigue abierta | no hay `active_shift` utilizable | salida exacta | permitir reconciliar/cerrar sesión bajo contrato de asistencia |
| salida pendiente offline | activa server-side | solo local | no declarar cierre server-side |
| commit confirmado y respuesta perdida | `CLOSED` real | outcome desconocido en cliente | recuperar por identidad |
| checkout y auto-close concurrentes | activa | dos transiciones | una transición terminal; la otra recupera estado |
| checkout y acción protegida concurrentes | activa al inicio | carrera | acción debe revalidar antes de su efecto |
| checkout durante descanso | sesión padre activa | salida | sesión cerrada no conserva autoridad; detalle de descanso pertenece a la tarea siguiente |

---

#### 39. Estado físico observado

La inspección de solo lectura del entorno desplegado muestra una implementación todavía legacy respecto de la identidad de sesión final:

| Superficie | Estado observado |
| --- | --- |
| `attendance_logs` | 5832 filas observadas |
| eventos `check_in` | 2919 |
| eventos `check_out` | 2913 |
| filas con `client_event_id` | 2 |
| filas con `shift_id` | 3203 |
| candidatos cuyo último evento es `check_in` | 6 |
| columna física `checkin_session_id` en `attendance_logs` | no observada |
| índice de idempotencia | único por `employee_id + client_event_id` cuando el identificador no es nulo |
| triggers `BEFORE INSERT` sobre `attendance_logs` | 4 observados |
| resolución física de secuencia | usa el último evento global del empleado y alternancia de acciones |
| resolución física de turno | contiene selección por cercanía temporal con `limit 1` |
| sincronización de asistencia | `sync_attendance_events` acepta entrada/salida e identidad cliente |
| tratamiento de `unique_violation` en sincronización | responde `duplicate` sin demostrar en esa rama igualdad semántica del contenido |
| auto-cierre de sesiones antiguas | existen funciones que infieren apertura desde el último evento por empleado |
| `attendance_breaks` | 11 filas observadas; 0 abiertas en el snapshot |
| vínculo explícito de `attendance_breaks` a `checkin_session_id` | no observado |

Los conteos son evidencia del instante de inspección y no se congelan como invariantes.

---

#### 40. Brechas físicas y propietarios existentes

Ninguna brecha detectada crea una tarea nueva.

| Brecha | Propietario existente | Condición de salida |
| --- | --- | --- |
| identidad y resolución canónica de sesión | `AUTH-DB-033` | el resolutor deja de depender del último evento y produce una sesión exacta |
| decisión posterior al cierre | `AUTH-DB-034` | toda acción usa contexto y modalidad actuales |
| invalidación por checkout | `AUTH-DB-035` | el cambio de sesión invalida contexto, caché y decisiones stale |
| materialización específica del cierre en ANIMA | instancia futura de `ANIMA-AUTH-009` | checkout confirmado cierra una sesión exacta e invalida contexto dependiente |
| descansos asociados a una sesión cerrada | `ANIMA-AUTH-010` | la semántica de descanso no deja estados operativos huérfanos |
| checkout offline y retry | `ANIMA-AUTH-014` y `ANIMA-AUTH-015` | la intención persiste, se recupera y se reautoriza sin duplicar cierre |
| auditoría detallada del cierre | `ANIMA-AUTH-018` | intención, sesión, evento, resultado e invalidación son reconstruibles |
| contrato propietario de asistencia | `INT-WORK-003` | salida cierra la sesión correcta y preserva turno/revisión |
| confirmación transversal del contexto | `INT-WORK-004` | el contexto posterior refleja la sesión cerrada sin reconstrucciones competidoras |
| compatibilidad legacy de sesión | `AUTH-CTX-028` | consumidores legacy dejan de usar último evento como autoridad final |

---

#### 41. Seguridad, privacidad y observabilidad

La respuesta visible al trabajador debe minimizar información.

Puede confirmar, según estado autorizado:

- salida registrada;
- salida pendiente;
- resultado recuperado;
- conflicto que requiere acción;
- imposibilidad temporal de confirmar.

No debe revelar automáticamente:

- otras sesiones;
- otros trabajadores;
- candidatos alternativos;
- identificadores internos innecesarios;
- reglas RLS;
- SQL;
- fingerprints internos;
- datos completos de turno;
- razones técnicas sensibles.

La evidencia interna debe poder correlacionar:

- intención;
- evento de salida;
- sesión;
- actor;
- turno y revisión;
- hora declarada;
- hora confirmada;
- fuente;
- estado previo;
- estado posterior;
- resultado;
- invalidación del contexto;
- nueva resolución posterior cuando exista.

---

#### 42. Rollback y reconciliación

Después de un checkout confirmado no se restaura autoridad borrando el evento.

Ante un fallo posterior:

```text
CHECKOUT COMMIT CONFIRMADO
+
FALLO DE INVALIDACION O PROYECCION
->
CONSERVAR CHECKOUT
+
FALLAR CERRADO PARA AUTORIDAD DEPENDIENTE
+
RECONCILIAR
```

No:

```text
BORRAR CHECKOUT
->
REABRIR AUTORIDAD
```

Si el checkout no llegó a commit, la sesión permanece bajo su estado autoritativo previo y el cliente no puede fingir cierre.

---

#### 43. Topología y materialización física

La definición documental se aprueba una sola vez en este marcador.

```text
MODE = PER_IMPLEMENTATION_UNIT
EXECUTION_GATE = POST_E5_PACKAGE
INSTANCE_PATTERN = ANIMA-AUTH-009::implementation_unit_id
```

La materialización futura:

- requiere una unidad de implementación real;
- requiere el paquete propietario aplicable;
- requiere `E5-GATE-008` de ese paquete en PASS;
- debe limitarse a productores y consumidores físicos del cierre;
- debe conservar idempotencia, concurrencia, rollback y auditoría;
- debe preservar el contrato de asistencia histórica;
- debe integrar los mecanismos canónicos de contexto y frescura disponibles;
- debe ejecutar toda modificación Supabase desde `vento-group-sas/vento-shell`.

Esta tarea documental no autoriza DDL, DML, migraciones, RLS, RPC, Edge Functions, cambios de código, datos productivos ni despliegues.

---

#### 44. Requisitos de prueba derivados

NO GENERA REQUISITOS DE PRUEBA.

**Requisitos creados:** 0

**Requisitos modificados:** 0

**Requisitos diferidos:** 0

**Requisitos obsoletos:** 0

La cobertura vigente ya protege sesión exacta, cierre normal, idempotencia, concurrencia, offline, invalidación, reautorización, consistencia de canales, auditoría y separación entre carril base y presencia. Esta tarea especializa esas obligaciones para el checkout de ANIMA sin cambiar el registro.

---

#### 45. Cobertura de prueba vigente reutilizada

Sin modificarlos, se reutilizan:

- `TREQ-AUTH-014`: checkout y otros cambios relevantes invalidan contexto, caché y tokens derivados;
- `TREQ-AUTH-015`: toda decisión y acción protegida conserva evidencia correlacionable;
- `TREQ-AUTH-229`: los carriles `T+C` sin sesión compatible producen denegación y cero efectos;
- `TREQ-AUTH-230`: solo el carril que exige check-in adquiere ese prerrequisito;
- `TREQ-AUTH-231`: una sesión activa pertenece al actor, turno y sede exactos, está abierta, confirmada y es única;
- `TREQ-AUTH-232`: cierre normal, contradicción, multiplicidad, residual e indisponibilidad conservan causas distintas;
- `TREQ-AUTH-233`: publicación, vigencia, check-in y controles posteriores conservan precedencia;
- `TREQ-AUTH-234`: los canales producen comportamiento equivalente y exigen nueva decisión después del cambio de check-in;
- `TREQ-AUTH-237`: offline, concurrencia y replay no duplican sesiones ni conservan autoridad stale;
- `TREQ-ANIMA-003`: la intención offline de asistencia es durable e idempotente;
- `TREQ-INTEGRATION-003`: operaciones reintentables conservan identidad, contenido, resultado recuperable y efecto único;
- `TREQ-INTEGRATION-007`: entrada, salida y descansos se vinculan determinísticamente con trabajador, turno y revisión.

Esta enumeración es trazabilidad y no representa requisitos afectados por la tarea.

---

#### 46. Evidencia de validación

| Clase | Estado | Evidencia |
| --- | --- | --- |
| BUILD | NOT_EXECUTED | La batería real del checkout se ejecuta después de insertar y normalizar la tarea. |
| LOCAL | PASS | El artefacto aislado fue comprobado por estructura, metadata, continuidad, secciones obligatorias, UTF-8, EOL y cero requisitos afectados en la sección derivada. |
| REMOTA | PASS | Se contrastaron `main`, continuidad, owner, topología, políticas, contratos de turno, check-in, asistencia, contexto, 04A, validadores vigentes y estado Supabase mediante lecturas de solo lectura. |
| OPERATIVA | NOT_EXECUTED | No se registró una salida real ni se ejercitó un flujo de trabajador. |
| FÍSICA | NOT_EXECUTED | No se ejecutaron migraciones, DDL, DML, RLS, RPC, cambios de código, datos ni despliegues. |

---

#### 47. Criterios de aceptación

La tarea queda aceptable cuando:

1. consume la continuidad de `ANIMA-AUTH-008`;
2. distingue intención, evento confirmado, sesión cerrada, invalidación y nueva decisión;
3. conserva exactamente la forma de `ActiveCheckinContext`;
4. identifica la sesión mediante `checkin_session_id`;
5. no usa empleado, turno, timestamp ni último evento como sustituto de identidad de sesión;
6. la sesión objetivo se resuelve o valida en servidor;
7. un checkout personal solo cierra una sesión del actor efectivo;
8. la salida permanece accesible aunque el permiso operativo ya no esté disponible;
9. esa accesibilidad no elimina controles de identidad, sesión, política física, idempotencia ni auditoría;
10. ausencia de `active_shift` no impide reconciliar una sesión histórica abierta;
11. el checkout no fabrica un turno;
12. conserva `shift_id` y revisión histórica de la sesión;
13. un dispositivo compartido no confunde identidad técnica, actor humano y sesión de asistencia;
14. la intención de salida obtiene identidad estable;
15. replay idéntico produce el mismo resultado sin segundo efecto;
16. misma identidad con contenido distinto produce conflicto;
17. una nueva intención sobre sesión cerrada no modifica `checked_out_at`;
18. dos checkouts concurrentes producen como máximo una transición terminal;
19. checkout, auto-close, cierre administrativo y otras terminales no duplican efectos;
20. un cambio concurrente de turno no reata la sesión;
21. `occurred_at` y confirmación server-side permanecen separados;
22. el checkout no se declara aplicado antes del commit;
23. resultado desconocido se recupera antes de repetir;
24. una salida offline no cierra optimistamente la sesión server-side;
25. checkout confirmado produce estado `CLOSED`;
26. una sesión `CLOSED` no aparece como `active_checkin_session`;
27. el `AccessContext` anterior queda obsoleto;
28. una nueva resolución produce un nuevo `context_id` cuando corresponde;
29. `active_shift` puede seguir vigente después del checkout;
30. el checkout no convierte permisos `T` en `T+C`;
31. los carriles `T+C` dejan de satisfacer el prerrequisito de check-in;
32. el carril base no se borra por checkout;
33. autenticación y sesión técnica del dispositivo no se cierran automáticamente;
34. rol, sede y área pueden seguir siendo hechos resolubles sin representar presencia;
35. caché, memoización y proyecciones stale dejan de ser utilizables para autoridad dependiente;
36. Realtime es señal de convergencia y no fuente de autoridad;
37. acciones concurrentes revalidan antes de su efecto;
38. un descanso no conserva autoridad después de cerrar la sesión padre;
39. la semántica exacta del descanso permanece en `ANIMA-AUTH-010`;
40. expiración puede retirar autoridad antes del checkout;
41. auto-close conserva causa e idempotencia propias;
42. cierre administrativo permanece separado del checkout personal;
43. geocerca se valida cuando la política aplicable la exija sin inventar thresholds;
44. la respuesta visible minimiza información;
45. un checkout confirmado no se borra para restaurar autoridad;
46. cada brecha física observada tiene propietario existente;
47. no se crean ni modifican requisitos de prueba;
48. no se ejecutan cambios físicos.

---

#### 48. Límites

Esta tarea no define:

- publicación del turno;
- creación del contexto al registrar entrada, propiedad de `ANIMA-AUTH-007`;
- cambio de turno, propiedad de `ANIMA-AUTH-008`;
- semántica detallada de descansos, propiedad de `ANIMA-AUTH-010`;
- cambio temporal de área, propiedad de `ANIMA-AUTH-011`;
- reemplazos, propiedad de `ANIMA-AUTH-012`;
- turnos cruzados de medianoche, propiedad de `ANIMA-AUTH-013`;
- almacenamiento y sincronización completos de la cola offline, propiedad de `ANIMA-AUTH-014` y `ANIMA-AUTH-015`;
- diagnóstico visible, propiedad de `ANIMA-AUTH-016` y `ANIMA-AUTH-017`;
- auditoría detallada, propiedad de `ANIMA-AUTH-018`;
- grants, scopes ni autorización universal;
- esquema físico definitivo de sesiones;
- formato físico de freshness tokens;
- cierre administrativo completo;
- correcciones laborales;
- cálculo de nómina;
- thresholds de geocerca;
- migraciones o cambios productivos.

---

#### 49. Continuidad

**ÚLTIMA TAREA APROBADA**
`ANIMA-AUTH-008 — Actualizar contexto cuando cambia el turno`

**TAREA ACTUAL APROBADA**
`ANIMA-AUTH-009 — Cerrar contexto al registrar salida`

**SIGUIENTE TAREA RESERVADA**
`ANIMA-AUTH-010 — Manejar descansos sin cerrar autorización`


### ✅ ANIMA-AUTH-010 — Manejar descansos sin cerrar autorización

**Estado:** APROBADA
**Tarea anterior:** ANIMA-AUTH-009 — Cerrar contexto al registrar salida
**Tarea siguiente:** ANIMA-AUTH-011 — Manejar cambio temporal de área
**Tipo de tarea:** documental; definición contractual del inicio, permanencia, cierre y reconciliación de descansos sobre una sesión de asistencia exacta sin convertir el descanso en checkout ni revocar por sí solo la autorización operativa
**Bloque:** `F_ANIMA — AUTORIZACIÓN Y CONTEXTO OPERATIVO`
**Repositorio propietario:** `vento-group-sas/vento-shell`
**Archivo propietario:** `docs/plan-canonico/modular/bloques/F_ANIMA/01_AUTORIZACION_Y_CONTEXTO_OPERATIVO.md`
**Estado físico resultante:** contrato documental definido; materialización física diferida por unidad de implementación
**Cambios físicos autorizados:** ninguno durante el cierre documental; la materialización futura queda sujeta a la topología `PER_IMPLEMENTATION_UNIT` y al gate `POST_E5_PACKAGE`
**Requisitos de prueba creados o modificados:** 0

---

#### 1. Propósito

Definir de forma única, segura y verificable cómo ANIMA debe manejar el inicio y fin de un descanso durante una sesión de asistencia válida sin cerrar la sesión laboral ni retirar por sí solo la autorización que depende del check-in.

La regla raíz queda:

```text
SESION DE ASISTENCIA EXACTA Y ACTIVA
+
INTENCION DE DESCANSO CONFIRMADA
->
DESCANSO ABIERTO
+
MISMA SESION DE ASISTENCIA
+
MISMO TURNO Y REVISION
+
SIN CHECKOUT
+
SIN REVOCACION AUTOMATICA DE AUTORIZACION
```

y al finalizar:

```text
DESCANSO ABIERTO EXACTO
+
INTENCION DE FIN CONFIRMADA
->
DESCANSO CERRADO
+
MISMA SESION DE ASISTENCIA
+
SIN CREAR UNA NUEVA SESION
+
SIN CREAR CHECKOUT
```

El descanso pertenece al dominio de asistencia. No se convierte en una nueva fuente de autoridad.

---

#### 2. Handoff consumido desde ANIMA-AUTH-009

`ANIMA-AUTH-010` consume sin reabrir la decisión de `ANIMA-AUTH-009`:

```text
CHECKOUT CONFIRMADO
->
SESION DE ASISTENCIA CLOSED
->
ACTIVE_CHECKIN_SESSION = NULL
->
CONTEXTO DEPENDIENTE INVALIDADO
```

La tarea anterior reservó expresamente a esta tarea la semántica exacta de un descanso cuando la sesión padre permanece abierta o alcanza un estado terminal.

Por tanto:

- un descanso normal no equivale a checkout;
- un checkout sí es terminal para la sesión padre;
- ningún descanso puede mantener autoridad después de que la sesión padre deje de ser utilizable;
- esta tarea define cómo reconciliar esos estados sin fabricar eventos ni borrar historia.

---

#### 3. Base normativa preservada

La tarea conserva sin redefinir las decisiones vigentes de:

- `AUTH-MOD-010`, que separa check-in, sesión activa, descanso y checkout;
- `AUTH-CTX-011`, que publica `active_checkin_session` únicamente cuando la sesión normalizada es `ACTIVE`;
- `INT-WORK-003`, que define entrada, salida, inicio de descanso y fin de descanso como acciones distintas de asistencia;
- `ANIMA-AUTH-007`, que crea el contexto después del check-in;
- `ANIMA-AUTH-008`, que actualiza contexto ante cambios de turno;
- `ANIMA-AUTH-009`, que cierra la sesión ante checkout;
- la topología `PER_IMPLEMENTATION_UNIT`;
- la separación entre contexto, autorización, asistencia y programación;
- la idempotencia, retry, resultado desconocido y recuperación ya aprobados para operaciones reintentables;
- la obligación de resolver identidad, sesión y referencias autoritativas en servidor.

No se amplía `AccessContext@1.0.0`.

---

#### 4. Reconciliación entre estado interno y contrato público

El modelo histórico de asistencia admite conceptualmente una sesión en descanso como una sesión todavía abierta.

El contrato público vigente de `ActiveCheckinContext` no publica `ON_BREAK` como valor.

La reconciliación canónica queda:

```text
ESTADO INTERNO DE ASISTENCIA = EN DESCANSO
->
SESION PADRE SIGUE ABIERTA
->
ACTIVE_CHECKIN_SESSION.status = ACTIVE
```

siempre que la sesión continúe siendo válida por actor, turno, territorio, temporalidad y ausencia de evento terminal.

Por tanto:

```text
ON_BREAK INTERNO
!=
NUEVO ESTADO PUBLICO DE AccessContext
```

Esta tarea no agrega un quinto valor al contrato público.

---

#### 5. Forma de ActiveCheckinContext conservada

Se conserva exactamente:

```ts
type ActiveCheckinContext = {
  checkin_session_id: string;
  employee_id: string;
  shift_id: string;
  site_id: string;
  area_id: string | null;
  checked_in_at: string;
  expires_at: string | null;
  checked_out_at: string | null;
  status: "ACTIVE" | "EXPIRED" | "CLOSED" | "INVALID";
};
```

Un descanso no agrega:

- `break_id`;
- `break_status`;
- `on_break`;
- `break_started_at`;
- `break_ends_at`;
- `is_on_break`;
- `break_policy`;
- campos equivalentes.

La información de descanso permanece fuera de este shape mínimo.

---

#### 6. Separación conceptual obligatoria

Deben mantenerse separados:

| Concepto | Significado |
| --- | --- |
| sesión de asistencia | presencia laboral abierta vinculada al check-in |
| descanso | intervalo subordinado a una sesión de asistencia |
| intención de descanso | solicitud aún no confirmada |
| descanso confirmado | hecho persistido y autoritativo |
| `active_checkin_session` | snapshot de autorización de una sesión válida |
| checkout | transición terminal de la sesión de asistencia |
| expiración | pérdida temporal de vigencia de la sesión para autorización |
| permiso | decisión sobre una capacidad concreta |

Regla:

```text
DESCANSO
!=
SESION DE ASISTENCIA
!=
AUTORIZACION
```

---

#### 7. Propiedad del descanso

El descanso pertenece al proceso de asistencia.

Debe quedar subordinado a una única sesión de asistencia y conservar, directa o derivadamente, referencias resolubles a:

- actor;
- empleado;
- `checkin_session_id`;
- `shift_id`;
- revisión publicada aplicable;
- sede de la sesión;
- área cuando corresponda;
- instante de inicio;
- instante de fin cuando exista;
- fuente;
- intención idempotente;
- resultado;
- evidencia de corrección o reconciliación.

La implementación física puede normalizar estas referencias sin cambiar la semántica.

---

#### 8. Identidad exacta de la sesión padre

Un descanso no puede existir como estado operativo autónomo.

Debe pertenecer a:

```text
exactamente un checkin_session_id
```

Queda prohibido asociarlo únicamente mediante:

- `employee_id`;
- último `check_in`;
- último evento del trabajador;
- fecha del día;
- `site_id`;
- `shift_id` aislado;
- orden de inserción;
- última fila visible;
- sesión inferida desde el cliente.

La sesión padre es la frontera de pertenencia.

---

#### 9. Identidad del descanso

Cada descanso confirmado debe poseer identidad estable dentro del dominio de asistencia.

Conceptualmente:

```text
break_id
```

identifica el intervalo de descanso confirmado.

La identidad de la intención que solicita iniciar o finalizar el descanso permanece separada de `break_id`.

No se utilizará como identidad única del descanso:

- timestamp;
- empleado;
- turno;
- sede;
- posición en una lista;
- combinación no protegida contra carreras.

---

#### 10. Inicio de descanso: precondiciones

Un inicio de descanso puede producir efecto únicamente cuando la frontera autoritativa demuestra:

1. actor efectivo válido;
2. empleado activo;
3. sesión padre exacta;
4. sesión padre abierta y no terminal;
5. pertenencia de la sesión al actor;
6. turno y revisión históricos resolubles;
7. sede compatible;
8. área compatible cuando aplique;
9. secuencia válida;
10. inexistencia de otro descanso incompatible abierto en la misma sesión;
11. identidad idempotente estable;
12. ausencia de colisión material;
13. persistencia confirmable;
14. autoridad técnica suficiente para registrar asistencia.

Una precondición aplicable desconocida o ambigua falla cerrada.

---

#### 11. Inicio de descanso: transición

La transición lógica es:

```text
SESION PADRE ABIERTA
+
SIN DESCANSO ABIERTO INCOMPATIBLE
+
START_BREAK CONFIRMADO
->
DESCANSO ABIERTO
```

No produce:

- otro check-in;
- checkout;
- otra sesión de asistencia;
- nuevo turno;
- nueva revisión de turno;
- cambio de rol;
- cambio de sede;
- cambio de área;
- cierre de autenticación;
- denegación general de permisos.

El evento original y su outcome permanecen recuperables.

---

#### 12. Fin de descanso: precondiciones

Un fin de descanso debe resolver exactamente el descanso abierto que pretende cerrar.

Debe demostrar:

1. actor efectivo;
2. pertenencia del descanso al actor o autoridad administrativa explícita;
3. `break_id` o identidad equivalente resoluble;
4. sesión padre;
5. relación entre descanso y sesión;
6. estado abierto del descanso antes de aplicar la transición;
7. secuencia temporal coherente;
8. identidad idempotente de la intención de fin;
9. ausencia de colisión material;
10. concurrencia controlada.

No se selecciona arbitrariamente un descanso cuando existen varias candidatas.

---

#### 13. Fin de descanso: transición

La transición lógica es:

```text
DESCANSO ABIERTO EXACTO
+
END_BREAK CONFIRMADO
->
MISMO DESCANSO CERRADO
```

El fin del descanso:

- no crea otra sesión;
- no ejecuta checkout;
- no cambia `checked_out_at`;
- no termina el turno;
- no crea una revisión de programación;
- no cambia la identidad del trabajador;
- no concede permisos por sí solo.

La sesión padre continúa bajo su estado autoritativo real.

---

#### 14. Autorización durante un descanso válido

Mientras el descanso está abierto y la sesión padre sigue siendo válida:

```text
active_checkin_session != null
active_checkin_session.status = ACTIVE
active_checkin_session.checked_out_at = null
```

El descanso por sí solo no elimina el prerrequisito de check-in.

No se crea una política transversal:

```text
ON_BREAK -> DENY
```

Una capacidad que deba bloquearse específicamente durante descanso requerirá una regla explícita en su contrato propietario.

---

#### 15. Carriles T y T+C

El descanso no cambia la modalidad de un permiso.

Para un contexto válido:

- un carril `T` continúa gobernado por turno y demás prerrequisitos propios;
- un carril `T+C` continúa satisfaciendo el componente `C` mientras la sesión padre siga activa;
- un permiso sin carril operativo no adquiere dependencia de descanso;
- un permiso no se vuelve más amplio por estar en descanso.

El descanso no redefine el catálogo de permisos.

---

#### 16. Carril base y capacidades administrativas

El descanso no revoca por sí solo:

- autenticación;
- identidad;
- rol base;
- cobertura administrativa;
- capacidades base;
- sesiones administrativas;
- sesión técnica de dispositivo compartido.

La separación se conserva:

```text
DESCANSO OPERATIVO
-/>
CIERRE DEL CARRIL BASE
```

La autoridad administrativa se evalúa por su propio contrato.

---

#### 17. Rol, sede y área durante el descanso

Un descanso no cambia el territorio operativo de la sesión.

Mientras la sesión padre siga válida:

```text
operational_role
operational_site
operational_area
```

continúan resolviéndose desde las fuentes aprobadas.

El descanso no puede:

- inventar otra sede;
- seleccionar otra área;
- ampliar cobertura;
- convertir `null` en wildcard;
- usar ubicación física temporal como nuevo territorio operativo.

El cambio temporal de área permanece reservado a `ANIMA-AUTH-011`.

---

#### 18. Inicio idempotente

La intención de iniciar descanso debe recibir una identidad estable antes del primer envío.

Para:

```text
MISMA IDENTIDAD
+
MISMO CONTENIDO LOGICO
```

el resultado debe ser recuperable y producir como máximo un descanso.

Un replay no crea un segundo intervalo.

La implementación futura debe poder distinguir entre:

- aplicado;
- resultado ya aplicado;
- conflicto;
- fallo temporal;
- resultado desconocido.

No se crea aquí un catálogo público nuevo de códigos.

---

#### 19. Fin idempotente

La intención de finalizar descanso también posee identidad estable propia.

Un replay idéntico:

```text
NO CAMBIA ended_at
NO CIERRA OTRO DESCANSO
NO CREA CHECKOUT
```

Devuelve el outcome ya determinado.

La identidad de `START_BREAK` no se reutiliza como identidad de `END_BREAK`.

---

#### 20. Misma identidad con contenido distinto

Si una identidad idempotente reaparece con contenido materialmente diferente:

```text
CONFLICT
+
CERO EFECTO ADICIONAL
```

Son diferencias materiales, según aplique:

- actor;
- sesión padre;
- descanso objetivo;
- tipo de acción;
- instante declarado;
- sede o evidencia física requerida;
- contenido cuya igualdad pruebe que se trata de la misma intención.

No se corrige silenciosamente.

---

#### 21. Concurrencia entre dos inicios

Dos solicitudes concurrentes de inicio contra la misma sesión no pueden abrir dos descansos incompatibles.

Resultado requerido:

```text
MAXIMO UN DESCANSO ABIERTO COMPATIBLE POR SESION
```

La materialización puede usar:

- restricción única;
- lock;
- versión;
- transición atómica;
- mecanismo equivalente.

Una protección física por empleado no sustituye la pertenencia contractual a la sesión exacta.

---

#### 22. Concurrencia entre dos cierres

Dos solicitudes concurrentes de fin sobre el mismo descanso deben converger.

Resultado:

```text
UNA TRANSICION DE ABIERTO A CERRADO
+
RESULTADO RECUPERABLE
```

No se permiten dos horas de cierre independientes.

La solicitud perdedora recupera el estado ya determinado o produce conflicto sin efecto adicional.

---

#### 23. Carrera entre inicio de descanso y checkout

Un checkout confirmado es terminal para la sesión padre.

Si `START_BREAK` y checkout compiten:

- el descanso solo puede abrirse si la transición de inicio fue válida antes del cierre autoritativo de la sesión;
- el checkout nunca se rechaza únicamente porque exista un descanso;
- una sesión ya cerrada no acepta un nuevo descanso;
- un descanso confirmado antes del checkout queda subordinado al cierre posterior de la sesión;
- no se reabre la sesión para preservar el descanso.

La autoridad posterior se resuelve desde el estado terminal de la sesión.

---

#### 24. Checkout mientras existe un descanso abierto

Cuando la sesión padre recibe un checkout válido mientras existe un descanso abierto:

```text
SESION PADRE -> CLOSED
ACTIVE_CHECKIN_SESSION -> NULL
DESCANSO -> NO OPERATIVO
```

El descanso no puede sobrevivir como fuente de presencia o autorización.

La reconciliación debe conservar:

- inicio original del descanso;
- ausencia de un fin voluntario cuando sea el caso;
- instante terminal de la sesión;
- causa terminal;
- relación con sesión y turno.

No se fabrica silenciosamente una acción voluntaria de `END_BREAK`.

La materialización podrá cerrar el intervalo derivado al límite terminal de la sesión o representar una terminación reconciliada equivalente, siempre preservando la causa real y la historia.

---

#### 25. Expiración mientras existe un descanso abierto

La expiración de la sesión puede retirar autoridad sin esperar un checkout.

Si ocurre durante un descanso:

```text
ACTIVE_CHECKIN_SESSION = NULL
```

y el descanso deja de tener relevancia operativa.

No se interpreta como:

- fin voluntario del descanso;
- checkout voluntario;
- extensión de presencia;
- permiso para seguir operando.

La reconciliación posterior conserva la expiración como causa independiente.

---

#### 26. Fin, cancelación o retiro del turno durante descanso

Si el turno deja de ser utilizable de forma autoritativa:

- la sesión padre se evalúa según su contrato;
- el descanso no crea un turno alternativo;
- el descanso no conserva autoridad;
- la relación histórica con el turno y revisión originales se preserva;
- una revisión nueva no reescribe el intervalo anterior.

La resolución de programación permanece en VISO y en los contratos de contexto correspondientes.

---

#### 27. Cambio de turno durante descanso

Un descanso está ligado a la sesión padre original.

Ante un cambio de turno:

```text
DESCANSO
-/>
REASIGNACION AUTOMATICA A OTRO TURNO
```

Si la sesión padre continúa siendo compatible después de la transición aprobada por `ANIMA-AUTH-008`, el descanso puede continuar subordinado a esa misma sesión.

Si la sesión padre deja de ser válida, el descanso pierde relevancia operativa y se reconcilia sin reatarlo a una sesión o turno distinto.

---

#### 28. Dispositivo compartido

En un dispositivo compartido deben mantenerse separadas:

```text
IDENTIDAD TECNICA DEL DISPOSITIVO
SESION DE ACTOR HUMANO
SESION DE ASISTENCIA
DESCANSO
```

El descanso pertenece al empleado actor.

Un cambio de actor del dispositivo no:

- transfiere el descanso;
- permite finalizar el descanso de otro empleado;
- cambia la sesión padre;
- convierte el PIN en autoridad empresarial suficiente.

Toda transición conserva atribución humana.

---

#### 29. occurred_at y tiempo de confirmación

El instante real de la intención y el instante de confirmación server-side son conceptos distintos.

Una intención puede conservar un `occurred_at` capturado fuera de línea, pero la frontera autoritativa debe validar:

- plausibilidad;
- orden;
- relación con la sesión;
- relación con el descanso;
- zona temporal;
- secuencia con checkout y otros terminales;
- concurrencia.

El servidor no sustituye silenciosamente el hecho histórico por la hora de recepción.

---

#### 30. Inicio offline

Una intención offline de inicio:

```text
PERSISTIDA LOCALMENTE
!=
DESCANSO CONFIRMADO
```

La interfaz solo puede mostrarla como encolada después de confirmar persistencia durable local.

No puede:

- cambiar la sesión server-side a estado terminal;
- declarar un descanso autoritativo;
- asumir que la sesión seguirá abierta al sincronizar;
- crear una segunda intención por reconexión.

La cola conserva la misma identidad durante retries.

---

#### 31. Fin offline

Una intención offline de fin de descanso conserva:

- identidad estable;
- descanso objetivo;
- sesión padre;
- `occurred_at`;
- estado de sincronización;
- evidencia necesaria.

Mientras no exista confirmación server-side, ANIMA no presenta el cierre como definitivo.

Si la sesión padre cambió o terminó antes de sincronizar, la intención debe reconciliarse contra la historia real y no cerrar un descanso distinto por conveniencia.

---

#### 32. Revalidación al sincronizar

La sincronización debe revalidar, según aplique:

- actor;
- empleado;
- sesión padre;
- descanso;
- turno y revisión;
- estado terminal de la sesión;
- sede;
- área;
- estado del dispositivo;
- secuencia;
- concurrencia;
- idempotencia.

Una intención creada bajo un contexto anterior no transporta autoridad indefinida.

La revalidación no cambia su `occurred_at` ni destruye la evidencia original.

---

#### 33. Resultado desconocido

Un timeout puede ocurrir después del commit y antes de que ANIMA reciba la respuesta.

La regla es:

```text
UNKNOWN OUTCOME
->
RECUPERAR POR IDENTIDAD
->
NO REPETIR A CIEGAS
```

La recuperación debe determinar si:

- el descanso abrió;
- el descanso cerró;
- la operación fue un replay;
- existe conflicto;
- no hubo efecto.

No se crea una nueva intención como mecanismo de recuperación.

---

#### 34. Frescura, caché y context_id

El inicio o fin de un descanso no debe revocar autorización únicamente porque cambió el estado de asistencia subordinado.

La implementación puede volver a resolver `AccessContext` o emitir un nuevo `context_id` cuando su mecanismo de frescura lo requiera.

Esta tarea no exige estabilidad ni rotación de `context_id` solo por descanso.

Sí exige invariancia semántica:

```text
DESCANSO VALIDO
+
MISMA SESION PADRE VALIDA
->
EL PRERREQUISITO DE CHECK-IN SIGUE SATISFECHO
```

Un cache de asistencia puede invalidarse sin convertir el descanso en una denegación de autorización.

---

#### 35. Realtime

Realtime puede anunciar:

- inicio confirmado;
- fin confirmado;
- reconciliación;
- conflicto;
- cambio de la sesión padre.

Su payload es una señal de convergencia.

No puede:

- conceder permiso;
- cerrar sesión por sí solo;
- elegir el descanso correcto;
- sustituir una lectura autoritativa;
- convertir estado local en hecho confirmado.

Una pérdida de Realtime no altera la verdad server-side.

---

#### 36. Geocerca y punto físico

Esta tarea no introduce una geocerca nueva para descansos.

Cuando una política futura o vigente exija evidencia física para una transición de descanso:

- debe validarse server-side;
- el punto físico no cambia la sede operativa;
- el cliente no define el threshold;
- una excepción requiere contrato propio;
- el resultado no concede autoridad adicional.

Sin regla explícita, el descanso no hereda automáticamente requisitos de geocerca de check-in o checkout.

---

#### 37. Tiempo trabajado, nómina y reportes

El descanso produce evidencia para cómputos posteriores, pero esta tarea no define:

- duración mínima o máxima;
- descansos remunerados;
- descuentos de nómina;
- horas extras;
- redondeos;
- tolerancias;
- legislación laboral parametrizada;
- reglas de liquidación.

Los consumidores económicos o laborales deben usar el intervalo reconciliado y su historia, no recalcular autoridad a partir del frontend.

---

#### 38. Corrección y reconciliación histórica

Una corrección no sobrescribe el hecho original.

Debe preservar, según aplique:

- intención original;
- `break_id`;
- sesión padre;
- intervalo observado;
- intervalo reconciliado;
- motivo;
- actor que corrige;
- antes;
- después;
- evidencia;
- impacto derivado.

Una corrección histórica de descanso:

```text
!=
AUTORIZACION RETROACTIVA
```

La autorización se decide con el contexto vigente de cada acción.

---

#### 39. Seguridad, privacidad y respuesta visible

La interfaz puede mostrar, según estado:

- descanso iniciado;
- descanso finalizado;
- pendiente de sincronización;
- resultado recuperado;
- conflicto que requiere atención;
- imposibilidad temporal de confirmar.

No debe revelar automáticamente:

- sesiones de terceros;
- otros trabajadores;
- candidatos alternativos;
- identificadores internos innecesarios;
- SQL;
- políticas RLS;
- fingerprints;
- razones técnicas sensibles;
- información laboral ajena.

Los errores de infraestructura no se convierten en confirmaciones optimistas.

---

#### 40. Observabilidad y auditoría

Debe poder reconstruirse:

```text
ACTOR
+
INTENCION
+
ACCION START/END
+
BREAK
+
SESION PADRE
+
TURNO Y REVISION
+
SEDE
+
AREA CUANDO APLIQUE
+
OCCURRED_AT
+
CONFIRMED_AT
+
FUENTE
+
OUTCOME
+
CONFLICTO O RECONCILIACION
```

La auditoría distingue:

- acción humana;
- sincronización offline;
- replay;
- cierre por sesión terminal;
- corrección administrativa;
- fallo técnico.

No se registra un checkout ficticio para representar un descanso.

---

#### 41. Estado físico observado

La inspección de solo lectura del entorno desplegado muestra un modelo de descansos todavía previo al contrato final:

| Superficie | Estado observado |
| --- | --- |
| `public.attendance_breaks` | 11 filas |
| descansos abiertos | 0 |
| descansos cerrados | 11 |
| intervalos con `ended_at < started_at` | 0 |
| `checkin_session_id` en `attendance_breaks` | no observado |
| `shift_id` en `attendance_breaks` | no observado |
| referencia de revisión publicada | no observada |
| identidad idempotente de inicio/fin | no observada |
| RLS en `attendance_breaks` | habilitado |
| RLS forzado | no |
| políticas directas visibles sobre `attendance_breaks` | no observadas |
| unicidad de descanso abierto | existe protección física parcial por empleado |
| `start_attendance_break` | usa `auth.uid()`, exige empleado activo, inspecciona el último evento de asistencia y crea el descanso con hora de servidor |
| `end_attendance_break` | busca el descanso abierto más reciente del empleado, lo bloquea y lo finaliza con hora de servidor |

Los conteos describen el snapshot observado y no son invariantes contractuales.

---

#### 42. Brechas físicas y propietarios existentes

Ninguna brecha observada crea una tarea nueva.

| Brecha | Propietario existente | Condición de salida |
| --- | --- | --- |
| sesión exacta como padre del descanso | `AUTH-DB-033` | la sesión canónica deja de inferirse desde el último evento y es referenciable de forma estable |
| aplicación uniforme de modalidad y contexto | `AUTH-DB-034` | el evaluador usa el contexto canónico sin reglas locales de descanso |
| frescura ante cambios terminales de sesión | `AUTH-DB-035` | checkout, expiración e invalidación impiden reutilizar autoridad stale |
| materialización específica de descansos ANIMA | instancia futura de `ANIMA-AUTH-010` | inicio y fin operan sobre sesión exacta, con idempotencia y concurrencia |
| cola offline de descanso y asistencia | `ANIMA-AUTH-014` | las intenciones sobreviven reinicio y conservan identidad estable |
| revalidación de intenciones offline | `ANIMA-AUTH-015` | sincronización reevalúa sesión, turno, territorio y secuencia |
| auditoría detallada | `ANIMA-AUTH-018` | intención, break, sesión, resultado y reconciliación son reconstruibles |
| contrato transversal de asistencia | `INT-WORK-003` | inicio y fin de descanso son transiciones atómicas, idempotentes y ligadas a la sesión |
| confirmación del contexto efectivo | `INT-WORK-004` | consumidores convergen al estado autoritativo sin fuente competidora |
| adaptación desde resolutores legacy | `AUTH-CTX-028` | el último evento deja de utilizarse como autoridad final |

---

#### 43. Rollback y recuperación

Un descanso confirmado no se borra para restaurar el estado anterior.

Ante:

```text
BREAK COMMIT CONFIRMADO
+
FALLO DE PROYECCION O RESPUESTA
```

se conserva el hecho y se recupera el outcome.

Si el inicio no llegó a commit:

- no existe descanso confirmado;
- la sesión padre conserva su estado real;
- el cliente no puede declararlo activo.

Si el fin no llegó a commit:

- el descanso conserva su estado autoritativo previo;
- el cliente no puede declararlo cerrado.

Las correcciones posteriores son auditadas.

---

#### 44. Topología y materialización física

La definición documental se aprueba una sola vez.

```text
MODE = PER_IMPLEMENTATION_UNIT
EXECUTION_GATE = POST_E5_PACKAGE
INSTANCE_PATTERN = ANIMA-AUTH-010::implementation_unit_id
```

La materialización futura:

- requiere una unidad de implementación real;
- requiere el paquete propietario aplicable;
- requiere `E5-GATE-008` del paquete en `PASS`;
- debe limitarse a productores y consumidores físicos del contrato;
- debe preservar la forma pública de `AccessContext`;
- debe integrar idempotencia, concurrencia, offline, auditoría y recuperación;
- debe ejecutar toda modificación Supabase desde `vento-group-sas/vento-shell`.

Esta tarea documental no autoriza DDL, DML, migraciones, RLS, RPC, Edge Functions, código de aplicación, datos productivos ni despliegues.

---

#### 45. Requisitos de prueba derivados

NO GENERA REQUISITOS DE PRUEBA.

**Requisitos creados:** 0

**Requisitos modificados:** 0

**Requisitos diferidos:** 0

**Requisitos obsoletos:** 0

La cobertura vigente ya exige idempotencia de descansos, transición atómica, replay estable, conflicto por reutilización material de identidad, sincronización durable, sesión exacta, autorización contextual, resultado recuperable y trazabilidad. Esta tarea especializa esas obligaciones para el efecto del descanso sobre el contexto sin crear una superficie ejecutable nueva.

---

#### 46. Cobertura de prueba vigente reutilizada

Sin modificarlos, se reutilizan:

- `TREQ-ANIMA-003`: persistencia durable e idempotencia para intenciones offline de asistencia;
- `TREQ-ANIMA-004`: inicio y fin de descanso idempotentes, atómicos, resistentes a concurrencia, replay, respuestas perdidas y orden adverso;
- `TREQ-AUTH-008`: separación entre carril base y carril operativo, con turno y check-in cuando el permiso los exige;
- `TREQ-AUTH-014`: invalidación de contexto y derivados ante cambios que sí alteran autoridad;
- `TREQ-AUTH-015`: trazabilidad de contexto, decisión y acción;
- `TREQ-AUTH-229` a `TREQ-AUTH-237`: sesión de check-in exacta, modalidades `T` y `T+C`, precedencia, canales, offline y concurrencia;
- `TREQ-INTEGRATION-003`: identidad estable, contenido lógico, efecto único, retry y resultado recuperable;
- `TREQ-INTEGRATION-007`: programación y asistencia vinculadas por trabajador, turno, revisión y hechos inmutables.

Esta enumeración es trazabilidad heredada y no representa modificación del registro.

---

#### 47. Evidencia de validación

| Clase | Estado | Evidencia |
| --- | --- | --- |
| BUILD | NOT_EXECUTED | La batería real del repositorio se ejecuta después de incorporar y normalizar la tarea en su archivo propietario. |
| LOCAL | PASS | El artefacto aislado fue comprobado por estructura, metadata, continuidad, secciones obligatorias, UTF-8, EOL y cero requisitos afectados dentro de la sección derivada. |
| REMOTA | PASS | Se contrastaron `main`, owner, continuidad, topología, políticas, contratos de check-in, checkout, contexto y asistencia, registro 04A pertinente, scripts vigentes y estado Supabase mediante lecturas de solo lectura. |
| OPERATIVA | NOT_EXECUTED | No se inició ni finalizó un descanso real de un trabajador. |
| FÍSICA | NOT_EXECUTED | No se ejecutaron migraciones, DDL, DML, RLS, RPC, cambios de código, datos ni despliegues. |

---

#### 48. Criterios de aceptación

La tarea queda aceptable cuando:

1. consume `ANIMA-AUTH-009` sin reabrir la semántica de checkout;
2. distingue sesión, descanso, intención, autorización y permiso;
3. conserva exactamente `ActiveCheckinContext@1.0.0`;
4. no agrega `ON_BREAK` al estado público;
5. normaliza una sesión válida en descanso como `ACTIVE` para el contexto de autorización;
6. el descanso pertenece a una sesión exacta;
7. la sesión padre se identifica mediante `checkin_session_id`;
8. el descanso posee identidad estable independiente de la intención;
9. el inicio valida actor, sesión, secuencia e inexistencia de descanso incompatible;
10. iniciar descanso no crea otra sesión;
11. iniciar descanso no ejecuta checkout;
12. finalizar descanso resuelve el descanso exacto;
13. finalizar descanso no ejecuta checkout;
14. el descanso por sí solo no revoca autorización;
15. no se crea una regla transversal `ON_BREAK -> DENY`;
16. permisos `T` y `T+C` conservan su modalidad;
17. un `T+C` mantiene el prerrequisito `C` mientras la sesión padre siga activa;
18. el carril base permanece independiente;
19. sede, área y rol no cambian por descanso;
20. el cambio temporal de área permanece reservado a `ANIMA-AUTH-011`;
21. inicio y fin tienen identidades idempotentes propias;
22. replay idéntico produce el mismo outcome;
23. misma identidad con contenido distinto produce conflicto;
24. dos inicios concurrentes producen como máximo un descanso abierto compatible;
25. dos cierres concurrentes producen como máximo un fin efectivo;
26. checkout concurrente prevalece como terminal de la sesión padre;
27. un descanso abierto no bloquea checkout;
28. checkout no fabrica un `END_BREAK` voluntario;
29. un descanso no mantiene autoridad después de sesión `CLOSED`;
30. expiración tampoco mantiene autoridad por descanso;
31. cambio de turno no reata automáticamente el descanso;
32. dispositivo compartido conserva actor humano separado;
33. `occurred_at` y confirmación server-side permanecen distintos;
34. una intención offline no se trata como descanso confirmado;
35. fin offline no cierra optimistamente el descanso remoto;
36. sincronización revalida sesión, descanso, turno, territorio y secuencia;
37. resultado desconocido se recupera antes de repetir;
38. descanso no obliga por sí solo a rotar ni conservar `context_id`;
39. la semántica de autorización permanece equivalente mientras la sesión padre sea válida;
40. Realtime es señal y no autoridad;
41. no se inventan thresholds de geocerca;
42. cálculo de nómina y reglas laborales cuantitativas quedan fuera;
43. correcciones preservan historia;
44. la respuesta visible minimiza información;
45. observabilidad correlaciona actor, intención, break, sesión, turno y outcome;
46. las brechas físicas observadas tienen propietario existente;
47. rollback no borra hechos confirmados;
48. la topología queda `PER_IMPLEMENTATION_UNIT` con gate `POST_E5_PACKAGE`;
49. no se crean ni modifican requisitos de prueba;
50. no se ejecutan cambios físicos.

---

#### 49. Límites

Esta tarea no define:

- creación del contexto al registrar entrada, propiedad de `ANIMA-AUTH-007`;
- actualización por cambio de turno, propiedad de `ANIMA-AUTH-008`;
- checkout, propiedad de `ANIMA-AUTH-009`;
- cambio temporal de área, propiedad de `ANIMA-AUTH-011`;
- reemplazos de turno, propiedad de `ANIMA-AUTH-012`;
- turnos cruzados de medianoche, propiedad de `ANIMA-AUTH-013`;
- almacenamiento completo de cola offline, propiedad de `ANIMA-AUTH-014`;
- revalidación completa de cola offline, propiedad de `ANIMA-AUTH-015`;
- diagnóstico visible, propiedad de `ANIMA-AUTH-016` y `ANIMA-AUTH-017`;
- auditoría detallada, propiedad de `ANIMA-AUTH-018`;
- cálculo de nómina;
- duración legal o empresarial del descanso;
- descansos remunerados o no remunerados;
- thresholds de geocerca;
- nuevos reason codes públicos;
- un nuevo shape de `AccessContext`;
- implementación física de sesiones o descansos;
- cambios productivos.

---

#### 50. Continuidad

**ÚLTIMA TAREA APROBADA**
`ANIMA-AUTH-009 — Cerrar contexto al registrar salida`

**TAREA ACTUAL APROBADA**
`ANIMA-AUTH-010 — Manejar descansos sin cerrar autorización`

**SIGUIENTE TAREA RESERVADA**
`ANIMA-AUTH-011 — Manejar cambio temporal de área`


### ✅ ANIMA-AUTH-011 — Manejar cambio temporal de área

**Estado:** APROBADA
**Tarea anterior:** ANIMA-AUTH-010 — Manejar descansos sin cerrar autorización
**Tarea siguiente:** ANIMA-AUTH-012 — Manejar reemplazos de turno
**Tipo de tarea:** documental; definición contractual del cambio temporal del área operativa aplicable a una misma ocurrencia de turno, preservando programación publicada, sesión de asistencia, autorización contextual y afiliaciones laborales como conceptos separados
**Bloque:** `F_ANIMA — AUTORIZACIÓN Y CONTEXTO OPERATIVO`
**Repositorio propietario:** `vento-group-sas/vento-shell`
**Archivo propietario:** `docs/plan-canonico/modular/bloques/F_ANIMA/01_AUTORIZACION_Y_CONTEXTO_OPERATIVO.md`
**Estado físico resultante:** contrato documental definido; materialización física diferida por unidad de implementación
**Cambios físicos autorizados:** ninguno durante esta tarea documental; la materialización futura queda sujeta a la topología `PER_IMPLEMENTATION_UNIT`, al gate `POST_E5_PACKAGE` y a autorización física explícita
**Requisitos de prueba creados o modificados:** 0

---

#### 1. Propósito

Definir cómo debe manejar Vento OS un cambio **temporal** del área operativa de un trabajador durante una misma ocurrencia de turno sin convertir esa excepción en una segunda fuente de programación, sin modificar su afiliación habitual, sin reescribir la asistencia ya confirmada y sin conservar autorización obsoleta.

La decisión raíz queda:

```text
MISMO TRABAJADOR
+
MISMO SHIFT_ID
+
MISMA SEDE OPERATIVA
+
MISMO ROL OPERATIVO
+
NUEVA AREA TEMPORAL VALIDA
+
AUTORIDAD ADMINISTRATIVA RESUELTA EN SERVIDOR
+
TRANSICION AUTORITATIVA DE PROGRAMACION
->
NUEVA REVISION / ESTADO APLICABLE DEL TURNO
->
INVALIDAR CONTEXTO ANTERIOR
->
RESOLVER CONTEXTO FRESCO
->
REAUTORIZAR ACCIONES POSTERIORES
```

Un cambio temporal de área no concede permisos, no cambia la sede, no cambia por sí mismo el rol, no crea una nueva sesión de check-in y no convierte ANIMA en propietario de la programación laboral.

---

#### 2. Resultado canónico

`ANIMA-AUTH-011` fija un único contrato para consumir y reconciliar una rotación temporal de área dentro de la misma ocurrencia laboral.

El resultado exige simultáneamente:

1. conservar la identidad del trabajador;
2. conservar el mismo `shift_id`;
3. conservar la sede del turno;
4. conservar el rol operativo cuando el caso sea realmente un cambio de área;
5. cambiar únicamente el área operativa aplicable mediante autoridad de programación;
6. preservar la revisión o estado anterior como historia;
7. producir una nueva resolución de contexto;
8. revalidar compatibilidad rol-área;
9. no alterar `employee_areas` para representar temporalidad;
10. no reescribir el check-in histórico;
11. no usar el cliente como autoridad;
12. hacer que toda acción posterior consuma el contexto nuevo.

Esta tarea define semántica y fronteras. No decide la forma física final de tablas, RPC, eventos, contratos serializados ni UI administrativa.

---

#### 3. Vocabulario contractual

##### 3.1. Área asignada

Afiliación laboral permanente o habitual del trabajador.

Su existencia puede servir para organización, planificación o administración, pero no es la fuente del área operativa vigente.

##### 3.2. Área operativa

Área efectiva resuelta para una ocurrencia de turno publicada.

La fuente canónica continúa siendo el turno y su revisión aplicable.

##### 3.3. Cambio temporal de área

Transición autorizada que mantiene trabajador, `shift_id`, sede y rol, pero cambia el área operativa aplicable durante una parte de la vida de esa ocurrencia.

##### 3.4. Retorno de área

Nueva transición autoritativa que vuelve a un área anterior o a otra área válida. No es un fallback automático a la afiliación habitual.

##### 3.5. Mismatch de área

Diferencia no explicada por una transición autoritativa válida entre el área que exige el contexto actual y otra referencia territorial.

Un mismatch ordinario continúa siendo una contradicción; una transición temporal debidamente trazada no se clasifica como corrupción por el mero hecho de que el área anterior sea distinta.

---

#### 4. Separaciones obligatorias

Se conservan las siguientes identidades:

```text
AREA ASIGNADA
!=
AREA PRIMARIA
!=
AREA SELECCIONADA
!=
AREA ADMINISTRATIVA
!=
AREA OPERATIVA
!=
AREA DEL RECURSO
!=
AREA DEL PUNTO FISICO
```

Y también:

```text
CAMBIO TEMPORAL DE AREA
!=
CAMBIO PERMANENTE DE AFILIACION
!=
CAMBIO DE SEDE
!=
CAMBIO DE ROL
!=
REEMPLAZO DE TURNO
!=
NUEVO CHECK-IN
!=
GRANT
!=
SCOPE
```

Ninguna de esas fuentes puede sustituir a otra por conveniencia del consumidor.

---

#### 5. Autoridad sobre la programación

La programación laboral continúa siendo propiedad de VISO y del proceso autoritativo de programación.

ANIMA:

- consume la programación publicada;
- detecta que el contexto cambió;
- invalida proyecciones obsoletas;
- muestra o usa el área efectiva;
- reautoriza acciones con contexto fresco.

ANIMA no puede:

- publicar una revisión por sí solo;
- mutar `area_id` desde estado local;
- convertir una selección visual en programación;
- crear una fuente durable paralela de override;
- conservar un área anterior porque todavía aparece en pantalla.

Una solicitud administrativa solo adquiere efecto operativo cuando la transición propietaria queda confirmada de forma autoritativa.

---

#### 6. Unidad de cambio

La unidad de esta tarea es una **misma ocurrencia lógica de turno**.

Para que el caso pertenezca a `ANIMA-AUTH-011` deben mantenerse:

```text
employee_id = MISMO
shift_id = MISMO
site_id = MISMO
operational_role = MISMO
area_id = CAMBIA
```

Si cambia además la identidad del turno, el caso deja de ser un cambio temporal de área puro y entra en las reglas de cambio o reemplazo de turno.

Si cambia la sede, esta tarea tampoco absorbe el caso.

Si cambia el rol, la transición debe tratarse como cambio material de turno y volver a ejecutar la cadena de validación correspondiente; esta tarea no selecciona un rol alternativo.

---

#### 7. La temporalidad no crea una segunda fuente de verdad

El estado temporal no se modela conceptualmente como:

```text
TURNO DICE AREA_A
+
OVERRIDE LOCAL DICE AREA_B
->
ESCOGER AREA_B
```

El resultado correcto es:

```text
REVISION / ESTADO AUTORITATIVO ANTERIOR
->
TRANSICION CONFIRMADA
->
REVISION / ESTADO AUTORITATIVO APLICABLE CON AREA_B
```

ANIMA consume únicamente el hecho autoritativo vigente.

Cuando deba terminar la temporalidad, el retorno también debe quedar representado por una transición autoritativa aplicable. El consumidor no vuelve por sí mismo a `employee_areas`, a un valor inicial ni al área vista al comenzar el turno.

---

#### 8. Precondiciones de un cambio temporal válido

Antes de confirmar el cambio deben poder demostrarse, según aplique:

1. trabajador existente y activo;
2. ocurrencia de turno exacta y resoluble;
3. revisión o estado vigente de programación conocido;
4. turno publicado y no cancelado;
5. sede del turno válida y activa;
6. área objetivo existente;
7. área objetivo activa;
8. área objetivo perteneciente a la misma sede del turno;
9. rol operativo canónico y activo;
10. rol habilitado para la sede;
11. rol compatible con el área objetivo mediante cobertura site-wide o coincidencia exacta;
12. actor administrativo con autoridad sobre la mutación resuelto server-side;
13. ausencia de una restricción canónica que bloquee la transición;
14. base de concurrencia suficientemente fresca para no sobrescribir otro cambio;
15. capacidad de conservar auditoría del antes y el después.

La pertenencia del trabajador a `employee_areas` para el área objetivo no es un prerrequisito operativo.

---

#### 9. Autoridad administrativa

La posibilidad de solicitar o aprobar el cambio no se deriva de:

- ser el propio trabajador;
- estar autenticado;
- compartir dispositivo;
- conocer el `employee_id`;
- seleccionar un área;
- tener un rol con nombre de gerente;
- estar físicamente en el área;
- poseer un grant operativo sobre un recurso;
- haber realizado el check-in.

La autoridad administrativa se resuelve mediante los contratos de autorización vigentes y la propiedad de programación.

Esta tarea no crea un permiso nuevo ni fija un código de permiso.

---

#### 10. Frontera de sede

`ANIMA-AUTH-011` solo gobierna cambios entre áreas de la **misma sede operativa**.

Debe cumplirse:

```text
target_area.site_id = active_shift.site_id
```

Una solicitud cuyo `target_area.site_id` sea distinto:

- no se interpreta como cambio temporal de área;
- no cambia la sede por efecto secundario;
- no conserva la sesión por conveniencia;
- no se repara con un área homónima;
- debe resolverse por el flujo propietario de cambio territorial o programación que corresponda.

El nombre o `area_kind` no sustituyen la identidad exacta.

---

#### 11. Compatibilidad rol-área

El cambio no elige un rol nuevo para lograr compatibilidad.

Con rol site-wide válido en la sede:

```text
SITE_WIDE
+
TARGET_AREA VALIDA EN LA MISMA SEDE
->
AREA_GATE SATISFIED
```

Con rol area-scoped:

```text
EXACT_AREA_ENABLEMENT = PRESENT
->
AREA_GATE SATISFIED
```

Si solo existe habilitación para otra área:

```text
TARGET_AREA VALIDA
+
NO SITE_WIDE
+
NO EXACT_AREA_ENABLEMENT
->
DENEGAR CAMBIO
```

La respuesta conserva la semántica canónica de incompatibilidad de área y no inventa un bypass.

---

#### 12. `employee_areas` permanece como afiliación habitual

Un cambio temporal no modifica automáticamente:

- `employee_areas`;
- área primaria;
- afiliaciones organizacionales;
- área seleccionada;
- preferencias del empleado.

La regla permanece:

```text
employee_areas
->
AFILIACION HABITUAL

turno publicado y revision aplicable
->
AREA OPERATIVA
```

Por tanto, un trabajador puede operar temporalmente en un área válida de la sede aunque esa área no sea una afiliación habitual, siempre que la transición de programación y la compatibilidad del rol sean válidas.

---

#### 13. Relación con el turno publicado

La transición debe conservar la identidad y linaje de la programación.

Debe ser posible reconstruir:

- `shift_id`;
- revisión o estado autoritativo anterior;
- área anterior;
- revisión o estado autoritativo sucesor;
- área nueva;
- instante efectivo;
- actor que ejerció la autoridad;
- motivo cuando el contrato propietario lo exija.

No se permite mezclar campos de dos revisiones para fabricar un turno híbrido.

La sola actualización visible de un campo sin identidad, precedencia o historia suficiente no satisface el contrato objetivo.

---

#### 14. Momento efectivo

El cambio entra en autoridad únicamente cuando la transición queda confirmada por la fuente propietaria.

Se distinguen:

```text
requested_at
!=
confirmed_at
!=
effective_at
```

cuando el contrato aplicable necesite esas diferencias.

El reloj de cliente no decide el instante efectivo.

Una UI puede mostrar una solicitud pendiente, pero no puede adoptar el área nueva para autorización antes de que la fuente autoritativa la confirme.

---

#### 15. Duración y retorno

La palabra temporal no autoriza un timer local.

Si la programación propietaria representa un intervalo temporal explícito, el servidor debe poder resolver qué estado o revisión es aplicable en cada instante.

Si no existe una transición de retorno autoritativa, queda prohibido:

- restaurar automáticamente el área inicial;
- usar `employee_areas` como fallback;
- usar el área primaria;
- usar el área del check-in;
- usar la última área almacenada en cliente.

El retorno debe ser tan trazable como el cambio inicial.

---

#### 16. Caso sin check-in activo

Una transición de área puede existir en programación aunque todavía no exista una sesión de check-in.

En ese caso:

- no se crea una sesión;
- no se crea asistencia;
- no se satisface artificialmente un permiso `T+C`;
- el próximo check-in aplicable debe consumir el área vigente;
- el contexto operativo previo al check-in conserva los prerrequisitos que correspondan.

Cambiar programación no equivale a registrar presencia.

---

#### 17. Caso con check-in activo

Cuando existe una sesión activa compatible con la misma ocurrencia:

1. se conserva `checkin_session_id`;
2. no se crea un segundo check-in;
3. no se ejecuta checkout;
4. el evento histórico de entrada no se reescribe;
5. el área operativa vigente cambia por la transición de programación;
6. el contexto anterior deja de ser reutilizable;
7. la sesión se vuelve a evaluar contra el estado vigente.

La sesión puede continuar como prerrequisito únicamente si la transición temporal queda reconocida como compatible por el contrato canónico de sesión y conserva actor, turno, sede, estado activo y demás invariantes.

---

#### 18. Diferencia entre evidencia histórica y área actual

El área asociada a una marcación previa puede conservar valor histórico.

Eso no significa que siga siendo autoridad operacional después de una transición válida.

La regla queda:

```text
AREA OBSERVADA AL CHECK-IN
->
EVIDENCIA HISTORICA

AREA DE LA PROGRAMACION AUTORITATIVA VIGENTE
->
AUTORIDAD OPERATIVA ACTUAL
```

Una diferencia explicada por una transición temporal trazable no debe corregirse reescribiendo la marcación.

Una diferencia sin transición autoritativa sigue siendo un mismatch y falla cerrado.

---

#### 19. Compatibilidad de la sesión después del cambio

La revalidación conserva al menos:

```text
session.employee_id = active_shift.employee_id
session.shift_id = active_shift.shift_id
session.site_id = active_shift.site_id
session.status = ACTIVE
session.checked_out_at = null
session no expirada
sesion unica
```

El área histórica de entrada no puede convertirse en autoridad permanente.

Cuando el modelo físico de sesión utilice un área como invariante operacional, la materialización futura debe distinguir una transición temporal autorizada de una contradicción ordinaria. No puede resolverla mutando historia silenciosamente.

Si no puede demostrar compatibilidad, el carril que exige check-in queda sin sesión utilizable hasta que el propietario físico reconcilie el estado de forma válida.

---

#### 20. Efecto sobre `AccessContext`

`AccessContext` es un snapshot inmutable.

Después de confirmar un cambio temporal relevante:

```text
CONTEXTO ANTERIOR
->
STALE / NO REUTILIZABLE
->
RESOLVER FUENTES ACTUALES
->
NUEVO ACCESS CONTEXT
->
NUEVA DECISION DE AUTORIZACION
```

El nuevo snapshot debe reflejar el área operativa vigente.

No se edita un `context_id` anterior para cambiarle `area_id`.

Dos contextos consecutivos pueden conservar actor, turno, sede, rol y sesión, pero diferir en área, frescura y decisiones derivadas.

---

#### 21. Revalidación completa del territorio

El nuevo contexto vuelve a verificar:

1. existencia de sede;
2. actividad de sede;
3. existencia de área;
4. actividad de área;
5. pertenencia del área a la sede;
6. rol operativo;
7. habilitación rol-sede;
8. compatibilidad rol-área;
9. sesión cuando el permiso la exija;
10. recurso y su territorio para la acción concreta.

El hecho de que el cambio haya sido autorizado administrativamente no concede automáticamente acceso a todos los recursos del área nueva.

---

#### 22. Grants, scopes y recursos

La transición territorial no crea grants.

```text
AREA CAMBIA
->
RECALCULAR CONTEXTO
->
REEVALUAR GRANTS Y DENIES EXISTENTES
->
REEVALUAR SCOPE
->
REEVALUAR RECURSO
```

Queda prohibido:

- copiar permisos del área anterior;
- ampliar un permiso area-scoped a la sede;
- usar el área nueva como prueba de grant;
- mantener acceso a un recurso del área anterior por una decisión cacheada;
- interpretar site-wide como global entre sedes.

El recurso conserva su propio territorio autoritativo.

---

#### 23. Efecto sobre capacidades base

Un cambio temporal del carril operativo no elimina por sí mismo capacidades base que sean independientes del turno, check-in o área.

La regla permanece:

```text
CAMBIO DE AREA OPERATIVA
->
RECALCULAR CARRIL OPERATIVO

NO IMPLICA
->
BORRAR CARRIL BASE
```

Los permisos se evalúan según su modalidad canónica.

---

#### 24. Descanso activo

Estar en descanso no congela el área ni convierte el descanso en fuente territorial.

Una transición temporal válida durante un descanso:

- no ejecuta `END_BREAK`;
- no crea otro descanso;
- no cierra la sesión padre;
- no usa el área del descanso como autoridad;
- invalida el contexto operativo igual que cualquier cambio territorial relevante;
- obliga a que las acciones posteriores utilicen el área nueva.

Si el descanso conserva evidencia de sitio o área previa, esa evidencia permanece histórica.

---

#### 25. Checkout concurrente

El checkout es terminal para la sesión de check-in.

Si concurren:

```text
CAMBIO TEMPORAL DE AREA
vs
CHECKOUT
```

la materialización debe evitar un estado en el que un cambio de área reviva o prolongue una sesión ya cerrada.

Una vez confirmado el checkout:

- la sesión deja de ser utilizable;
- el cambio de área no crea otra sesión;
- cualquier respuesta tardía debe reconciliarse contra el estado cerrado;
- la programación puede conservar su historia independientemente del cierre de asistencia.

---

#### 26. Frontera con reemplazos de turno

`ANIMA-AUTH-012` conserva la propiedad de reemplazos de turno.

Esta tarea no define:

- sustitución de trabajador;
- sustitución de `shift_id`;
- préstamo de una sesión a otra ocurrencia;
- reemplazo entre dos trabajadores;
- aprobación empresarial del reemplazo.

Si una operación cambia la identidad de la ocurrencia, no se clasifica como cambio temporal de área.

Una concurrencia entre cambio de área y reemplazo debe resolverse por la linaje autoritativa de programación; ANIMA no elige cuál gana desde el cliente.

---

#### 27. Cancelación, retiro o cambio material concurrente

Si mientras se tramita el cambio:

- el turno es cancelado;
- la revisión base deja de ser vigente;
- cambia el trabajador;
- cambia la sede;
- cambia el rol;
- se alcanza una frontera que hace inaplicable el turno;

la solicitud no puede aplicarse sobre una base stale.

Debe:

```text
DETECTAR CAMBIO
->
NO SOBREESCRIBIR
->
RESOLVER ESTADO ACTUAL
->
DEVOLVER OUTCOME CONCLUYENTE
```

No se recrea el contexto anterior para completar la intención.

---

#### 28. Idempotencia y retry

Toda materialización futura de una mutación de área debe permitir distinguir la identidad lógica de la operación de su transporte.

Propiedades mínimas:

1. misma identidad y mismo contenido lógico -> mismo outcome;
2. misma identidad y contenido materialmente distinto -> conflicto;
3. retry después de timeout -> recuperar antes de duplicar;
4. respuesta perdida después de commit -> no crear otra transición;
5. operación ya aplicada -> resultado recuperable;
6. operación no aplicada -> estado anterior permanece.

La identidad física concreta se define en la implementación propietaria; esta tarea no inventa una columna.

---

#### 29. Concurrencia y base esperada

Dos cambios incompatibles no pueden quedar ambos como autoridad simultánea para la misma ocurrencia e instante.

La materialización futura debe comparar una base autoritativa suficientemente específica, por ejemplo mediante identidad de revisión, versión, generación o control equivalente gobernado por la fuente propietaria.

La regla conceptual es:

```text
BASE ESPERADA = BASE ACTUAL
->
PUEDE INTENTAR TRANSICION

BASE ESPERADA != BASE ACTUAL
->
CONFLICTO / RELECTURA
```

No se usa last-write-wins silencioso para esconder un cambio concurrente.

---

#### 30. Matriz de decisión

| Caso | Estado inicial | Solicitud | Decisión |
| --- | --- | --- | --- |
| A | mismo turno, sede y rol válidos | área distinta, activa, misma sede y rol compatible | aceptar transición propietaria; invalidar contexto y resolver de nuevo |
| B | mismo turno | área objetivo igual al área vigente | resultado estable sin cambio material; no duplicar transición |
| C | mismo turno | área inexistente | rechazar; no mutar programación ni contexto |
| D | mismo turno | área inactiva | rechazar |
| E | mismo turno | área de otra sede | fuera del alcance de esta tarea; no cambiar sede |
| F | mismo turno y sede | rol no compatible con área objetivo | rechazar; no seleccionar otro rol |
| G | turno publicado, sin check-in | cambio válido | programación puede cambiar; no fabricar presencia |
| H | sesión activa compatible | cambio válido | conservar identidad de sesión; invalidar contexto y reautorizar |
| I | sesión cerrada | respuesta tardía o retry | no revivir sesión |
| J | revisión base stale | cambio solicitado | conflicto; releer estado autoritativo |
| K | dos cambios concurrentes incompatibles | ambos válidos sobre la misma base | como máximo uno progresa sobre esa base |
| L | trabajador en descanso | cambio válido | no terminar descanso; contexto posterior usa área nueva |
| M | fuente necesaria no verificable | cualquiera | fail closed técnico |
| N | cliente propone área sin transición propietaria | cualquiera | ignorar como autoridad |
| O | retorno solicitado | área anterior válida | nueva transición autoritativa; no fallback automático |

---

#### 31. Resultado y respuesta

La implementación futura debe poder distinguir internamente, como mínimo:

- transición aplicada;
- replay de transición ya aplicada;
- no-op porque el área ya era la efectiva;
- conflicto de identidad o versión;
- área objetivo inválida;
- incompatibilidad de rol-área;
- cambio fuera de alcance por sede, turno o rol;
- fuente no disponible;
- sesión ya cerrada cuando el resultado dependa de presencia.

Estos outcomes internos no crean por sí mismos nuevos reason codes públicos.

La experiencia visible y el diagnóstico final pertenecen a las tareas de UX y diagnóstico ya reservadas.

---

#### 32. Offline y acciones pendientes

Una intención offline conserva el contexto observado, no autoridad futura.

Si el área cambia mientras el dispositivo está desconectado:

- la acción pendiente no conserva grants del área anterior;
- no se ejecuta con una decisión cacheada;
- no se reescribe para apuntar silenciosamente al área nueva;
- al sincronizar se resuelven turno, sesión, territorio y autorización actuales;
- un conflicto se conserva como conflicto, no como éxito optimista.

Esta tarea no crea una cola offline específica para cambios administrativos de área.

---

#### 33. Caché, memoización y frescura

El cambio de área es una invalidación material del carril operativo.

Por tanto, una generación, token, fingerprint o mecanismo equivalente de frescura debe cambiar cuando la transición pasa a ser efectiva.

Queda prohibido autorizar usando:

- `context_id` previo;
- memoización previa;
- área previa visible;
- resultado de autorización previo;
- snapshot offline previo;
- payload de Realtime como nueva autoridad.

La caché puede acelerar lectura después de demostrar que corresponde a la generación vigente.

---

#### 34. Realtime y señales

Realtime, push, polling o eventos internos pueden anunciar que la programación cambió.

Su semántica es:

```text
SIGNAL
->
INVALIDATE
->
FETCH AUTHORITATIVE STATE
->
RESOLVE CONTEXT
```

No:

```text
SIGNAL PAYLOAD
->
SET AREA
->
AUTHORIZE
```

La pérdida de una señal no cambia la verdad persistida.

---

#### 35. Seguridad y privacidad

La respuesta al trabajador debe minimizar información.

No debe exponer automáticamente:

- quién tiene autoridad administrativa;
- IDs internos innecesarios;
- matriz completa de rol-área;
- afiliaciones de terceros;
- detalles de RLS;
- SQL;
- políticas internas;
- revisiones candidatas competidoras;
- razones técnicas sensibles.

Un conflicto de programación no se presenta como autorización válida.

---

#### 36. Auditoría mínima

Debe poder reconstruirse, sin usar la auditoría como fuente de autorización:

```text
TRABAJADOR
+
SHIFT_ID
+
REVISION / ESTADO BASE
+
AREA ANTERIOR
+
AREA NUEVA
+
SEDE
+
ROL
+
SESION CUANDO EXISTA
+
ACTOR ADMINISTRATIVO
+
MOTIVO CUANDO APLIQUE
+
INSTANTE SOLICITADO
+
INSTANTE CONFIRMADO / EFECTIVO
+
OUTCOME
+
REFERENCIA DE LA TRANSICION SUCESORA
```

La historia debe permitir distinguir:

- cambio temporal;
- retorno;
- retry;
- conflicto;
- corrección administrativa;
- cancelación;
- reemplazo de turno.

La auditoría detallada de ANIMA permanece bajo `ANIMA-AUTH-018`.

---

#### 37. Estado físico observado

La inspección read-only del entorno `vento-os-dev` muestra un modelo todavía previo al contrato completo:

| Superficie | Estado observado |
| --- | --- |
| `public.employee_shifts` | 3436 filas en el snapshot |
| turnos con `published_at` | 3309 |
| turnos publicados con `area_id` | 1120 |
| turnos publicados con área sin relación activa equivalente en `employee_areas` | 1120 |
| `public.employee_areas` | 1 relación total y activa |
| `public.employee_area_purpose_assignments` | 45 relaciones activas; 23 `operational` y 22 `remission` |
| relación o función específica con nombre de override temporal de área | no observada en la inspección por nombre |
| `public.get_operational_context` | consume `employee_shifts.area_id`; mantiene resolución legacy y fallbacks territoriales que no representan el contrato final |
| ANIMA móvil | el contexto de turno observado consume `area_id` de `employee_shifts`; no se observó una autoridad paralela de cambio temporal |

Estos conteos describen un snapshot y no son invariantes empresariales.

La escasa cardinalidad de `employee_areas` frente a los turnos publicados con área confirma que la afiliación habitual no puede convertirse en prerrequisito del área operativa.

---

#### 38. Brechas físicas y propietarios existentes

Ninguna brecha observada crea una tarea nueva.

| Brecha | Propietario existente | Condición de salida |
| --- | --- | --- |
| resolución canónica de turno, sesión, rol y territorio sin fallbacks legacy | `AUTH-DB-033` | el contexto efectivo se deriva de fuentes canónicas y una sola revisión aplicable |
| evaluación con contexto fresco | `AUTH-DB-034` | toda acción usa contexto vigente y conserva precedencia |
| invalidación transaccional por cambio de área o turno | `AUTH-DB-035` | la escritura relevante cambia la generación y evita reutilizar decisiones stale |
| publicación y linaje de programación | `INT-WORK-001` | una revisión publicada conserva identidad, historia, autor y cambio aplicable |
| confirmación autoritativa del contexto efectivo | `INT-WORK-004` | consumidoras convergen al contexto confirmado sin fuente competidora |
| reacción de ANIMA al cambio temporal de área | instancia futura de `ANIMA-AUTH-011` | ANIMA invalida, relee y reautoriza sin mutar afiliación ni asistencia histórica |
| auditoría detallada de contexto | `ANIMA-AUTH-018` | antes, transición y después pueden reconstruirse |
| reemplazo de turno | `ANIMA-AUTH-012` | cambios de identidad de ocurrencia se mantienen fuera de esta tarea |

---

#### 39. Rollback y recuperación

Un cambio confirmado no se elimina para fingir que nunca ocurrió.

Si:

```text
TRANSICION CONFIRMADA
+
RESPUESTA PERDIDA
```

se recupera el outcome por identidad y estado autoritativo.

Si la transición no llegó a confirmarse:

- el área anterior conserva autoridad;
- no se adopta el objetivo en cliente;
- no se invalida historia para simular éxito.

Si el cambio confirmado debe revertirse empresarialmente, se crea una nueva transición autoritativa hacia el área válida correspondiente.

Rollback técnico no equivale a borrar auditoría ni reescribir el check-in original.

---

#### 40. Topología y materialización física

La definición documental se aprueba una sola vez.

```text
MODE = PER_IMPLEMENTATION_UNIT
EXECUTION_GATE = POST_E5_PACKAGE
INSTANCE_PATTERN = ANIMA-AUTH-011::implementation_unit_id
```

La materialización futura:

- requiere una unidad de implementación real;
- requiere un `package_id` propietario aplicable;
- requiere `E5-GATE-008` del paquete en `PASS`;
- requiere autorización física explícita;
- debe limitarse a productores y consumidores reales del cambio de área;
- debe preservar programación, asistencia, contexto, grants y auditoría como capas separadas;
- debe ejecutar toda modificación de Supabase desde `vento-group-sas/vento-shell`.

Esta tarea documental no autoriza DDL, DML, migraciones, RLS, RPC, Edge Functions, código de aplicación, datos productivos ni despliegues.

---

#### 41. Requisitos de prueba derivados

NO GENERA REQUISITOS DE PRUEBA.

**Requisitos creados:** 0

**Requisitos modificados:** 0

**Requisitos diferidos:** 0

**Requisitos obsoletos:** 0

La cobertura vigente ya protege separación entre afiliación y área operativa, resolución del área desde turno, compatibilidad rol-área, sesión exacta, invalidación de contexto, idempotencia, concurrencia, offline, auditoría y vínculo entre programación y asistencia. Esta tarea especializa esas obligaciones para la rotación temporal de área sin ampliar el registro.

---

#### 42. Cobertura de prueba vigente reutilizada

Sin modificarlos, se reutilizan:

- `TREQ-AUTH-008`: capacidades operativas dependen de turno vigente, check-in cuando aplique, rol y territorio compatibles;
- `TREQ-AUTH-009`: sede y área efectivas se resuelven determinísticamente y una rotación recalcula permisos;
- `TREQ-AUTH-014`: cambio de turno, área, trabajador, dispositivo, rol o asignación invalida contexto, caché y tokens derivados;
- `TREQ-AUTH-015`: decisiones y acciones conservan evidencia correlacionable de turno, check-in, rol, territorio, contexto y timestamp;
- `TREQ-AUTH-189` a `TREQ-AUTH-208`: separación entre área asignada y área operativa, fuente desde turno, validez territorial, precedencia, canales y frescura;
- `TREQ-AUTH-229` a `TREQ-AUTH-237`: sesión de check-in exacta, modalidad por carril, precedencia, canales, offline y concurrencia;
- `TREQ-AUTH-259` a `TREQ-AUTH-268`: compatibilidad exacta rol-área, site-wide, fallbacks prohibidos, causas, paridad, privacidad, frescura y reconciliación;
- `TREQ-ANIMA-003`: intención offline durable e idempotente que debe revalidarse al sincronizar;
- `TREQ-INTEGRATION-003`: identidad estable, efecto único, retry y resultado recuperable;
- `TREQ-INTEGRATION-007`: programación y asistencia vinculadas por trabajador, turno, revisión y hechos inmutables.

Esta enumeración es trazabilidad heredada y no representa modificación del registro.

---

#### 43. Evidencia de validación

| Clase | Estado | Evidencia |
| --- | --- | --- |
| BUILD | NOT_EXECUTED | La batería real del repositorio se ejecuta después de incorporar y normalizar la tarea en su archivo propietario. |
| LOCAL | PASS | El artefacto aislado fue comprobado por estructura, metadata, continuidad, secciones obligatorias, UTF-8, EOL, ausencia de placeholders y cero TREQ afectados dentro de la sección derivada. |
| REMOTA | PASS | Se contrastaron `main`, continuidad, topología, políticas, tareas ANIMA previas, modelo de áreas, contratos de programación y contexto, 04A pertinente, código ANIMA y estado `vento-os-dev` mediante lecturas de solo lectura. |
| OPERATIVA | NOT_EXECUTED | No se realizó un cambio temporal real de área sobre un trabajador ni una sesión real. |
| FÍSICA | NOT_EXECUTED | No se ejecutaron migraciones, DDL, DML, RLS, RPC, cambios de código, datos ni despliegues. |

---

#### 44. Criterios de aceptación

La tarea queda aceptable cuando:

1. conserva el cambio temporal de área separado de la afiliación habitual;
2. mantiene `employee_areas` fuera de la autoridad operativa;
3. conserva VISO y la programación publicada como autoridad del turno;
4. no crea un override durable paralelo como segunda fuente;
5. mantiene trabajador, `shift_id`, sede y rol para clasificar el caso como cambio de área puro;
6. reserva cambios de `shift_id` a los flujos de turno o reemplazo;
7. rechaza usar esta tarea para cambiar de sede;
8. no elige un rol alternativo para lograr compatibilidad;
9. exige área objetivo existente, activa y perteneciente a la sede;
10. exige rol válido para la sede y el área;
11. admite cobertura site-wide sin convertirla en global;
12. no exige afiliación activa en `employee_areas` para el área temporal;
13. conserva identidad e historia de la revisión o estado anterior;
14. no mezcla campos de revisiones distintas;
15. usa tiempo autoritativo y no reloj de cliente;
16. no adopta el área nueva antes de confirmación;
17. un retorno exige autoridad equivalente al cambio inicial;
18. no usa timer local para restaurar área;
19. sin check-in no fabrica sesión ni presencia;
20. con check-in no crea otra entrada;
21. no reescribe el hecho histórico de entrada;
22. una transición temporal trazable se distingue de un mismatch ordinario;
23. la sesión se conserva solo cuando sigue siendo compatible;
24. una sesión cerrada no puede revivirse;
25. `AccessContext` no se actualiza in-place;
26. el contexto anterior queda no reutilizable;
27. se produce una nueva resolución con área vigente;
28. se revalidan sede, área, rol, sesión y territorio;
29. la transición no crea grants;
30. grants, denies, scope y recurso se reevaluan;
31. el carril base no se elimina por un cambio de área operativo;
32. un descanso no congela el territorio ni se cierra por esta transición;
33. checkout concurrente prevalece como terminal de sesión;
34. reemplazos permanecen bajo `ANIMA-AUTH-012`;
35. cancelación o revisión stale impiden aplicar sobre base obsoleta;
36. retry no duplica una transición ya confirmada;
37. misma identidad con contenido distinto produce conflicto;
38. cambios concurrentes incompatibles no quedan ambos como autoridad;
39. no se usa last-write-wins silencioso;
40. una acción offline se reautoriza con territorio actual;
41. caché, token y decisiones previas se invalidan;
42. Realtime actúa como señal y no como autoridad;
43. la respuesta visible minimiza información;
44. la auditoría reconstruye trabajador, turno, áreas, autoridad, tiempo y outcome;
45. las brechas físicas observadas conservan propietarios existentes;
46. rollback no borra historia confirmada;
47. la topología queda `PER_IMPLEMENTATION_UNIT`;
48. el gate físico queda `POST_E5_PACKAGE`;
49. no se crean ni modifican requisitos de prueba;
50. no se ejecutan cambios físicos.

---

#### 45. Límites

Esta tarea no define:

- afiliación permanente del trabajador a áreas;
- selección o navegación administrativa de área;
- publicación general de turnos;
- UI administrativa de VISO;
- cambio de sede;
- cambio de rol como parte de la misma operación;
- reemplazo de turno, propiedad de `ANIMA-AUTH-012`;
- turnos cruzados de medianoche, propiedad de `ANIMA-AUTH-013`;
- cola offline general, propiedad de `ANIMA-AUTH-014`;
- revalidación completa de cola, propiedad de `ANIMA-AUTH-015`;
- diagnóstico visible final, propiedad de `ANIMA-AUTH-016` y `ANIMA-AUTH-017`;
- auditoría detallada final, propiedad de `ANIMA-AUTH-018`;
- concesión directa de permisos, prohibida por `ANIMA-AUTH-019`;
- una fuente paralela distinta de Supabase, frontera de `ANIMA-AUTH-020`;
- un código nuevo de permiso;
- un reason code público nuevo;
- un nuevo shape público de `AccessContext`;
- un contrato físico de tablas o RPC;
- implementación física;
- cambios productivos.

---

#### 46. Continuidad

**ÚLTIMA TAREA APROBADA**
`ANIMA-AUTH-010 — Manejar descansos sin cerrar autorización`

**TAREA ACTUAL APROBADA**
`ANIMA-AUTH-011 — Manejar cambio temporal de área`

**SIGUIENTE TAREA RESERVADA**
`ANIMA-AUTH-012 — Manejar reemplazos de turno`


### ✅ ANIMA-AUTH-012 — Manejar reemplazos de turno

**Estado:** APROBADA
**Tarea anterior:** ANIMA-AUTH-011 — Manejar cambio temporal de área
**Tarea siguiente:** ANIMA-AUTH-013 — Manejar turnos cruzados de medianoche
**Tipo de tarea:** documental; definición contractual del reemplazo autoritativo de una ocurrencia de turno o de su trabajador asignado, preservando identidad, revisión, linaje, asistencia, contexto, autorización y tiempo trabajado sin transferir sesiones ni sobrescribir historia
**Bloque:** `F_ANIMA — AUTORIZACIÓN Y CONTEXTO OPERATIVO`
**Repositorio propietario:** `vento-group-sas/vento-shell`
**Archivo propietario:** `docs/plan-canonico/modular/bloques/F_ANIMA/01_AUTORIZACION_Y_CONTEXTO_OPERATIVO.md`
**Estado físico resultante:** contrato documental definido; materialización física diferida por unidad de implementación
**Cambios físicos autorizados:** ninguno durante esta tarea documental; la materialización futura queda sujeta a la topología `PER_IMPLEMENTATION_UNIT`, al gate `POST_E5_PACKAGE` y a autorización física explícita
**Requisitos de prueba creados o modificados:** 0

---

#### 1. Propósito

Definir cómo debe reaccionar ANIMA cuando la programación autoritativa sustituye una ocurrencia de turno, cambia el trabajador responsable de cubrirla o enlaza dos ocurrencias mediante un reemplazo explícito, sin convertir esa sustitución en una edición destructiva del pasado, sin prestar una sesión de asistencia entre trabajadores y sin conservar autorización basada en un turno que dejó de ser aplicable.

La regla raíz queda:

```text
REEMPLAZO AUTORITATIVO CONFIRMADO
+
LINAJE EXPLICITO ENTRE ORIGEN Y SUCESOR
+
HISTORIA DEL ORIGEN PRESERVADA
->
INVALIDAR CONTEXTO OBSOLETO
->
RESOLVER TURNO VIGENTE POR ACTOR
->
RESOLVER SESION COMPATIBLE POR ACTOR
->
REAUTORIZAR ACCIONES POSTERIORES
```

El reemplazo no concede permisos, no crea presencia por sí mismo, no transfiere check-in, no altera retroactivamente el tiempo trabajado y no convierte ANIMA en propietario de la programación.

---

#### 2. Resultado canónico

`ANIMA-AUTH-012` fija un contrato único de consumo y reconciliación de reemplazos de turno con las siguientes propiedades:

1. VISO y el proceso propietario de programación continúan siendo la autoridad del reemplazo;
2. la ocurrencia original conserva identidad e historia;
3. una sustitución real por otra ocurrencia utiliza una identidad de turno sucesora distinta;
4. el vínculo entre original y sucesora es explícito y reconstruible;
5. un cambio de trabajador no se representa sobrescribiendo silenciosamente al trabajador original de una ocurrencia ya publicada;
6. cada trabajador conserva su propia sesión de asistencia;
7. ninguna sesión de check-in se transfiere entre ocurrencias o actores;
8. la autorización posterior se resuelve con el turno y contexto vigentes de cada actor;
9. las acciones offline no se retargetean silenciosamente hacia el reemplazo;
10. la concurrencia no puede producir dos sucesores autoritativos incompatibles para la misma base;
11. un reemplazo confirmado conserva resultado recuperable ante retry o respuesta perdida;
12. las correcciones posteriores preservan el reemplazo y su historia en lugar de borrar evidencia.

La tarea define semántica, identidad, fronteras y handoffs. No fija el esquema físico final de tablas, columnas, RPC, eventos, contratos serializados ni interfaz administrativa.

---

#### 3. Vocabulario contractual

Para esta tarea se distinguen los siguientes conceptos.

**Ocurrencia original:** turno publicado o estado autoritativo que es objeto de sustitución.

**Ocurrencia sucesora:** nueva ocurrencia lógica que pasa a cubrir total o parcialmente la obligación laboral sustituida y posee identidad propia cuando existe sustitución real de ocurrencia.

**Trabajador original:** actor laboral asociado a la ocurrencia original antes del reemplazo.

**Trabajador reemplazante:** actor laboral que queda asociado a la ocurrencia sucesora cuando el reemplazo cambia la persona que cubre el trabajo.

**Linaje de reemplazo:** relación autoritativa que permite reconstruir qué ocurrencia fue sustituida, por cuál, bajo qué decisión, en qué momento y por qué autoridad.

**Corrección de revisión:** modificación versionada de una misma ocurrencia que conserva su identidad lógica y no constituye por sí sola una sustitución real por otra ocurrencia.

**Intercambio de turnos:** operación empresarial que relaciona dos sustituciones coordinadas entre trabajadores u ocurrencias. No implica intercambio de sesiones de asistencia.

---

#### 4. Separaciones obligatorias

Se conservan las siguientes diferencias:

```text
REEMPLAZO DE TURNO
!=
EDICION DE BORRADOR
!=
CORRECCION DE LA MISMA OCURRENCIA
!=
CAMBIO TEMPORAL DE AREA
!=
CAMBIO DE ROL AISLADO
!=
CHECK-IN
!=
CHECKOUT
!=
TRANSFERENCIA DE SESION
!=
GRANT
!=
SCOPE
```

También:

```text
TURNO ORIGINAL
!=
TURNO SUCESOR

TRABAJADOR ORIGINAL
!=
TRABAJADOR REEMPLAZANTE

HECHO DE ASISTENCIA ORIGINAL
!=
HECHO DE ASISTENCIA DEL REEMPLAZANTE
```

Una coincidencia de horario, sede, área o rol no fusiona esas identidades.

---

#### 5. Autoridad sobre el reemplazo

La programación laboral continúa siendo propiedad de VISO y de `VPROC-0007`.

ANIMA puede:

- consumir el estado publicado vigente;
- detectar que una ocurrencia dejó de ser autoritativa para un actor;
- reconocer el linaje de reemplazo que entregue el contrato propietario;
- invalidar contexto local o cacheado;
- presentar el nuevo turno aplicable;
- exigir nueva resolución de asistencia y autorización.

ANIMA no puede:

- aprobar un reemplazo por sí solo;
- elegir quién reemplaza a quién;
- fabricar una ocurrencia sucesora desde estado local;
- reasignar una sesión de check-in;
- modificar el trabajador del turno por conveniencia del cliente;
- decidir cuál de dos reemplazos concurrentes prevalece;
- inferir el reemplazo porque otro trabajador apareció físicamente en la sede.

La autoridad administrativa y la atomicidad empresarial pertenecen a los contratos propietarios de programación, autorización y concurrencia.

---

#### 6. Identidad estable de la ocurrencia

`shift_id` identifica una ocurrencia lógica de turno.

Una revisión nueva de la misma ocurrencia puede conservar `shift_id` cuando el contrato propietario la clasifica como corrección o evolución de esa ocurrencia.

Una sustitución real por otra ocurrencia exige:

```text
original_shift_id != replacement_shift_id
```

La ocurrencia sucesora no reutiliza la identidad de la original para ocultar que existió una sustitución.

El sistema debe poder distinguir históricamente ambas identidades incluso cuando compartan:

- fecha;
- hora;
- sede;
- área;
- rol;
- duración;
- motivo operacional.

---

#### 7. Linaje explícito entre original y sucesora

Una sustitución real debe preservar una relación explícita y resoluble entre las dos ocurrencias.

El contrato lógico debe poder responder, como mínimo:

```text
QUE TURNO FUE REEMPLAZADO
POR CUAL TURNO
PARA QUE TRABAJADOR ORIGINAL
CON QUE TRABAJADOR REEMPLAZANTE
BAJO QUE REVISION O ESTADO
DESDE QUE INSTANTE
POR QUE AUTORIDAD
CON QUE MOTIVO CUANDO APLIQUE
```

Esta tarea no impone nombres de columnas como `replaced_by` o `replacement_id`.

Sí prohíbe depender exclusivamente de:

- notas libres;
- proximidad temporal;
- igualdad de horario;
- último registro creado;
- orden por `updated_at`;
- texto de notificación;
- inferencia desde asistencia.

---

#### 8. Reemplazo frente a corrección de la misma ocurrencia

No toda modificación posterior a publicación es un reemplazo.

Cuando se conserva la misma ocurrencia y solo cambia una revisión autoritativa de sus hechos, aplica el contrato de corrección y actualización de contexto correspondiente.

Conceptualmente:

```text
MISMO SHIFT_ID
+
NUEVA REVISION
->
CORRECCION / ACTUALIZACION DE LA MISMA OCURRENCIA
```

En cambio:

```text
OCURRENCIA S1 DEJA DE CUBRIR LA OBLIGACION
+
OCURRENCIA S2 ASUME ESA COBERTURA
->
REEMPLAZO
```

El consumidor no puede degradar un reemplazo real a una simple edición in-place porque hacerlo perdería identidad, linaje y auditabilidad.

---

#### 9. Reemplazo frente a cambio temporal de área

`ANIMA-AUTH-011` conserva la propiedad del cambio temporal de área dentro de la misma ocurrencia.

La frontera queda:

```text
MISMO EMPLOYEE_ID
+
MISMO SHIFT_ID
+
MISMA SEDE
+
MISMO ROL
+
CAMBIA AREA
->
ANIMA-AUTH-011
```

Si cambia la identidad de la ocurrencia o el trabajador que la cubre, el caso pertenece a `ANIMA-AUTH-012`.

Un cambio de área concurrente con un reemplazo se resuelve mediante la fuente autoritativa y su linaje. ANIMA no combina arbitrariamente el área de una revisión con el trabajador de otra.

---

#### 10. Reemplazo frente a cancelación o retiro

Una cancelación sin sucesor no es un reemplazo.

```text
ORIGINAL CANCELADO
+
SIN OCURRENCIA SUCESORA AUTORITATIVA
->
CANCELACION
```

```text
ORIGINAL DEJA DE SER APLICABLE
+
SUCESORA EXPLICITA ASUME LA COBERTURA
->
REEMPLAZO
```

Queda prohibido inventar una sucesora porque exista otro turno parecido o porque un trabajador distinto realice una marcación.

La ausencia de sucesor conserva su causa real y no se presenta como reemplazo exitoso.

---

#### 11. Reemplazo de trabajador

Cuando la sustitución cambia al trabajador que debe cubrir la obligación, el trabajador original no se sobrescribe retroactivamente dentro de la ocurrencia publicada como si nunca hubiera sido asignado.

La transición debe preservar:

- identidad del trabajador original;
- identidad del reemplazante;
- ocurrencia original;
- ocurrencia sucesora cuando exista sustitución real;
- revisión o estado anterior;
- decisión de reemplazo;
- instante efectivo;
- historia de notificación y auditoría cuando aplique.

El reemplazante debe ser elegible bajo el contrato de programación y autorización vigente. La mera disponibilidad o presencia física no basta.

---

#### 12. Reemplazo de ocurrencia sin cambio de trabajador

También puede existir una sustitución de ocurrencia para el mismo trabajador cuando el turno original deja de ser la unidad válida y una nueva ocurrencia lo reemplaza.

En ese caso:

```text
employee_id puede conservarse
original_shift_id cambia a replacement_shift_id
```

La sesión activa del turno original no se reata automáticamente a la sucesora.

Si la nueva ocurrencia requiere check-in para una capacidad `T+C`, debe existir una sesión confirmada y compatible con la nueva ocurrencia según el contrato vigente.

---

#### 13. Intercambio entre dos trabajadores

Un intercambio de turnos entre dos trabajadores no se representa intercambiando `employee_id` destructivamente sobre dos filas publicadas.

Debe conservarse una relación empresarial reconstruible entre:

- las dos ocurrencias originales;
- los dos trabajadores originales;
- las ocurrencias sucesoras aplicables;
- la autoridad que aprobó el intercambio;
- el instante efectivo;
- el resultado de cada lado.

ANIMA consume únicamente el estado autoritativo ya confirmado.

Si el propietario exige atomicidad del intercambio, ambos lados deben quedar confirmados o reconciliados bajo ese contrato. Esta tarea no redefine la atomicidad propietaria de `VISO-SCH-005` y `VISO-SCH-006`.

---

#### 14. Precondiciones del reemplazo

Antes de que una sustitución pueda considerarse aplicable deben poder demostrarse, según el caso:

1. ocurrencia original existente y resoluble;
2. revisión o estado base conocido;
3. trabajador original resoluble;
4. autoridad administrativa válida;
5. sucesora identificada de manera inequívoca;
6. trabajador reemplazante válido cuando cambie el actor laboral;
7. vínculo laboral aplicable del reemplazante;
8. sede de la sucesora válida;
9. área válida o ausencia compatible cuando corresponda;
10. rol operativo canónico y activo;
11. habilitación rol-sede;
12. compatibilidad rol-área;
13. intervalo temporal válido;
14. ausencia de conflicto irresoluble con otra programación autoritativa;
15. base de concurrencia suficientemente fresca;
16. capacidad de preservar historia y linaje.

La tarea no convierte esas comprobaciones en un permiso nuevo.

---

#### 15. Trabajador reemplazante y elegibilidad

El reemplazante no hereda elegibilidad del trabajador original.

Se resuelven de nuevo, como mínimo:

- identidad efectiva;
- vínculo laboral;
- cobertura territorial requerida;
- turno sucesor;
- sede;
- área;
- rol operativo;
- compatibilidad del rol;
- restricciones temporales;
- requisitos de check-in aplicables a cada permiso.

Queda prohibido copiar:

- grants;
- rol efectivo;
- área efectiva;
- sesión;
- dispositivo;
- contexto;
- excepciones;
- bypass;
- decisión previa.

---

#### 16. Revisión publicada y reemplazo efectivo

Un reemplazo pendiente no constituye todavía autoridad para ANIMA.

La secuencia conceptual es:

```text
SOLICITUD / PROPUESTA
->
VALIDACION PROPIETARIA
->
APROBACION CUANDO APLIQUE
->
PUBLICACION / CONFIRMACION AUTORITATIVA
->
EFECTIVIDAD
->
CONSUMO EN ANIMA
```

El cliente puede mostrar una propuesta o aviso, pero no puede cambiar el `active_shift` utilizado para autorización antes de que la fuente propietaria confirme el estado aplicable.

---

#### 17. Momento efectivo

Cuando el contrato propietario distinga tiempos, se preserva:

```text
requested_at
!=
approved_at
!=
published_at
!=
effective_at
```

El reloj del cliente no decide la efectividad.

Una sustitución futura no invalida prematuramente el turno vigente.

Una sustitución ya efectiva no puede seguir tratándose como futura porque una caché o pantalla todavía muestre el turno anterior.

---

#### 18. Reemplazo antes del inicio del turno

Cuando el reemplazo queda efectivo antes de que comience la ocurrencia original:

- el original deja de ser candidato operativo para el trabajador original desde la efectividad aplicable;
- la sucesora puede convertirse en candidata del reemplazante cuando alcance su ventana temporal;
- no se crea asistencia para ninguno;
- no se crea check-in automático;
- no se transfiere una intención local previa;
- ANIMA debe mostrar el estado autoritativo vigente cuando corresponda.

Una notificación no sustituye la lectura de la fuente autoritativa.

---

#### 19. Reemplazo durante una ocurrencia en curso

Un reemplazo efectivo mientras el trabajo ya está en curso exige separar programación, asistencia y autorización.

El reemplazo puede cambiar quién debe cubrir la obligación hacia adelante, pero no reescribe quién realizó trabajo antes del instante efectivo.

Debe preservarse:

```text
TRABAJO YA CONFIRMADO
->
HISTORIA DEL ACTOR QUE LO REALIZO

TRABAJO POSTERIOR AL REEMPLAZO
->
CONTEXTO DEL ACTOR AUTORITATIVO VIGENTE
```

La frontera exacta de tiempo trabajado se deriva de hechos de asistencia reconciliados y del contrato propietario; no se calcula sustituyendo el `employee_id` histórico.

---

#### 20. Sesión del trabajador original

Si el trabajador original ya posee una sesión de check-in asociada a la ocurrencia sustituida:

1. la sesión conserva su identidad histórica;
2. no cambia de `employee_id`;
3. no cambia de `shift_id` para seguir a la sucesora;
4. no se presta al reemplazante;
5. puede dejar de ser utilizable para nuevas autorizaciones cuando el turno original deje de ser aplicable;
6. su cierre real continúa gobernado por el contrato de checkout, expiración o reconciliación correspondiente;
7. el reemplazo por sí solo no fabrica un evento de checkout que no ocurrió.

La historia de presencia y la autoridad para acciones nuevas son conceptos distintos.

---

#### 21. Sesión del trabajador reemplazante

El reemplazante necesita su propia evidencia de presencia cuando el permiso o carril la exija.

```text
TURNO SUCESOR VALIDO
+
TRABAJADOR REEMPLAZANTE
!=
CHECK-IN CONFIRMADO
```

Por tanto:

- no se crea sesión al aprobar el reemplazo;
- no se copia `checkin_session_id`;
- no se copia hora de entrada;
- no se copia geolocalización;
- no se copia punto físico;
- no se satisface `T+C` sin una sesión propia compatible.

Si el permiso exige solo turno, se evalúa con la sucesora vigente sin inventar presencia.

---

#### 22. Prohibición de transferencia de sesión

La regla es absoluta:

```text
SESSION(A, SHIFT_ORIGINAL)
NO PUEDE CONVERTIRSE EN
SESSION(B, SHIFT_REPLACEMENT)
```

Tampoco:

```text
SESSION(A, S1)
NO PUEDE REATARSE A
S2
```

La coincidencia de sede, horario, área, rol o dispositivo no altera esta prohibición.

Una sesión representa asistencia confirmada de un actor respecto de una ocurrencia concreta; no es un cupo laboral transferible.

---

#### 23. Descanso activo durante un reemplazo

Un descanso abierto pertenece a su sesión padre y al trabajador que lo inició.

Si ocurre un reemplazo mientras el original está en descanso:

- el descanso no se transfiere al reemplazante;
- no se reata a la sucesora;
- no se cierra automáticamente solo para facilitar el reemplazo;
- conserva su historia y requiere reconciliación bajo su sesión padre;
- no mantiene autoridad operativa para el original después de que el turno deje de ser aplicable.

El reemplazante inicia sus propios descansos únicamente sobre su propia sesión cuando corresponda.

---

#### 24. Checkout concurrente

El checkout sigue siendo terminal para la sesión sobre la cual opera.

Si concurren reemplazo y checkout del trabajador original:

- el reemplazo no revive una sesión cerrada;
- el checkout no cambia la identidad de la sucesora;
- una respuesta tardía se reconcilia con el estado confirmado;
- no se inventa un segundo checkout;
- no se transfiere el cierre al reemplazante.

Si el checkout fue confirmado primero, cualquier contexto que dependa de esa sesión debe reflejar el cierre.

---

#### 25. Efecto sobre `AccessContext` del trabajador original

Cuando el reemplazo vuelve inaplicable el turno original para nuevas decisiones, cualquier snapshot operativo anterior queda obsoleto.

Debe ocurrir:

```text
CONTEXTO ORIGINAL
->
NO REUTILIZABLE
->
RESOLVER FUENTES ACTUALES
->
NUEVO ACCESS CONTEXT
```

El nuevo resultado puede carecer de `active_shift` o de `active_checkin_session` si ya no existe una combinación compatible.

No se muta un `AccessContext` anterior in-place.

---

#### 26. Efecto sobre `AccessContext` del reemplazante

El trabajador reemplazante también requiere nueva resolución cuando la sucesora pasa a ser aplicable.

La resolución no reutiliza contexto del original ni una decisión previa del reemplazante tomada antes del cambio.

Debe resolver de nuevo:

- turno vigente;
- revisión aplicable;
- sede;
- área;
- rol;
- sesión compatible cuando aplique;
- dispositivo y simulación cuando correspondan;
- grants, denies, scope y recurso.

El replacement no es un mecanismo de herencia de contexto.

---

#### 27. Grants, denies, scope y recurso

El reemplazo cambia hechos laborales; no concede autorización por sí mismo.

```text
REEMPLAZO CONFIRMADO
!=
GRANT
```

Y:

```text
GRANT DEL ORIGINAL
!=
GRANT DEL REEMPLAZANTE
```

Toda acción posterior se evalúa con el permiso del actor efectivo, su modalidad, el contexto vigente y el recurso real.

Una denegación transversal o territorial no desaparece porque el trabajador haya sido elegido como reemplazante.

---

#### 28. Territorio de la sucesora

La ocurrencia sucesora debe aportar su propio territorio autoritativo.

ANIMA no copia automáticamente sede o área desde la original para completar datos faltantes.

Si la sucesora cambia sede, área o rol respecto de la original, esos hechos se validan bajo la cadena canónica aplicable.

Queda prohibido:

- preservar el territorio original hasta que el usuario cambie de pantalla;
- usar la sede seleccionada como reparación;
- usar el check-in del original como sede de la sucesora;
- inferir área por nombre o `area_kind`;
- permitir un cruce territorial porque el reemplazo fue aprobado.

---

#### 29. Solapamientos y ambigüedad

El reemplazo no puede crear una ambigüedad operativa que el consumidor resuelva por heurística.

Si después de aplicar el estado autoritativo existen dos candidatos incompatibles para el mismo actor e instante y no existe precedencia inequívoca:

```text
ACTIVE_SHIFT = NO CONCLUYENTE
->
FAIL CLOSED
```

No se escoge:

- el turno más reciente;
- el que tenga check-in;
- el que llegue primero por Realtime;
- el turno marcado como reemplazo por el cliente;
- el turno con igual sede;
- el de menor o mayor `id`.

La inconsistencia se resuelve en la fuente propietaria.

---

#### 30. Concurrencia entre reemplazos

Dos sustituciones incompatibles sobre la misma base no pueden quedar ambas como sucesoras autoritativas.

La materialización futura debe comparar una base suficientemente específica mediante revisión, versión, generación o mecanismo equivalente.

Regla conceptual:

```text
EXPECTED_BASE = CURRENT_BASE
->
PUEDE INTENTAR CONFIRMACION

EXPECTED_BASE != CURRENT_BASE
->
CONFLICTO / RELECTURA
```

Queda prohibido esconder la carrera mediante last-write-wins silencioso.

---

#### 31. Idempotencia y retry

La operación propietaria de reemplazo debe poseer identidad estable suficiente para recuperación.

Propiedades mínimas:

1. mismo identificador y mismo contenido lógico producen el mismo outcome;
2. mismo identificador y contenido materialmente distinto producen conflicto;
3. una respuesta perdida después de commit no crea otra sustitución;
4. un timeout con resultado desconocido se recupera antes de repetir;
5. retry no genera una cadena duplicada de sucesoras;
6. el resultado original permanece consultable o reconstruible.

Esta tarea no inventa la columna ni el mecanismo físico que implementará esa identidad.

---

#### 32. Reemplazo y acciones offline pendientes

Una intención offline conserva el contexto observado, no autoridad futura.

Si el turno fue reemplazado antes de sincronizar:

- la intención no cambia silenciosamente de `shift_id`;
- no cambia silenciosamente de trabajador;
- no hereda el contexto de la sucesora;
- no reutiliza grants del original;
- se reautoriza contra el estado vigente;
- puede terminar en conflicto, rechazo o reconciliación según su contrato;
- el sistema no presenta éxito optimista antes de confirmación.

La persistencia y sincronización general de la cola permanecen bajo `ANIMA-AUTH-014` y `ANIMA-AUTH-015`.

---

#### 33. Realtime, push y notificaciones

Realtime, push o notificaciones pueden informar que existe un cambio de programación.

Su semántica permanece:

```text
SIGNAL
->
INVALIDATE
->
FETCH AUTHORITATIVE STATE
->
RESOLVE
```

No:

```text
PAYLOAD DE NOTIFICACION
->
CAMBIAR SHIFT_ID / EMPLOYEE_ID
->
AUTHORIZE
```

La pérdida de una notificación no cambia el estado autoritativo.

---

#### 34. Caché, memoización y frescura

Un reemplazo efectivo es una invalidación material del carril operativo de los actores afectados.

Debe dejar no reutilizables, según aplique:

- `context_id` anterior;
- token o generación de frescura anterior;
- memoización de `active_shift`;
- sesión candidata asociada a otra ocurrencia;
- autorización previa;
- proyección local del horario;
- datos offline usados como autoridad.

Una caché puede acelerar lectura solo después de demostrar que corresponde al estado vigente.

---

#### 35. Tiempo trabajado y no duplicación

El reemplazo no puede producir doble contabilización del mismo trabajo por trasladar o copiar asistencia.

Se preserva:

```text
HECHO DE ASISTENCIA
->
ACTOR QUE LO PRODUJO
+
TURNO / REVISION CON LA QUE FUE CONFIRMADO
```

El tiempo previo a la sustitución no se reasigna al reemplazante.

El tiempo posterior tampoco se atribuye automáticamente: requiere hechos de asistencia propios o el mecanismo autoritativo correspondiente.

Nómina, recargos, compensaciones y reglas de pago quedan fuera de esta tarea.

---

#### 36. Corrección posterior de un reemplazo

Corregir un reemplazo no significa borrar la relación anterior.

Debe poder conservarse, según aplique:

- reemplazo original;
- motivo de corrección;
- actor corrector;
- estado antes;
- estado después;
- nuevas ocurrencias o revisiones;
- impacto sobre asistencia;
- impacto derivado.

Una reversión empresarial se representa mediante una nueva transición autoritativa o corrección versionada, no restaurando silenciosamente la fila anterior.

---

#### 37. Matriz de decisión

| Caso | Estado autoritativo | Resultado para ANIMA |
| --- | --- | --- |
| A | mismo `shift_id`, nueva revisión sin sustitución de ocurrencia | tratar como actualización/corrección; no fabricar reemplazo |
| B | S1 sustituida explícitamente por S2 para otro trabajador antes del inicio | invalidar S1 para el original; S2 será candidata del reemplazante cuando corresponda; sin check-in automático |
| C | S1 sustituida por S2 para el mismo trabajador | no reatar sesión S1; resolver S2 y su sesión compatible por separado |
| D | reemplazo efectivo con original ya checked-in | preservar sesión/historia original; dejar de usarla para autorización incompatible; no transferirla |
| E | reemplazante sin check-in y permiso `T+C` | turno puede existir, pero el carril sigue sin satisfacer check-in |
| F | reemplazante con sesión propia compatible con S2 | resolver contexto fresco y continuar según permisos |
| G | dos reemplazos incompatibles sobre la misma base | conflicto; no elegir por orden de llegada |
| H | intercambio A/B confirmado autoritativamente | resolver cada actor y cada sucesora por separado; cero intercambio de sesiones |
| I | original cancelado sin sucesor | cancelación, no reemplazo |
| J | cliente propone `replacement_shift_id` sin fuente autoritativa | ignorar como autoridad |
| K | acción offline conserva S1 después de reemplazo | reautorizar; no retargetear a S2 silenciosamente |
| L | checkout del original ya confirmado | reemplazo no revive la sesión |
| M | fuente o linaje obligatorio no verificable | fail closed técnico |
| N | sucesora crea solapamiento ambiguo para el reemplazante | no resolver por heurística; bloquear hasta estado concluyente |

---

#### 38. Respuesta y outcomes internos

La implementación futura debe poder distinguir internamente, como mínimo:

- reemplazo aplicado;
- replay de reemplazo ya aplicado;
- solicitud sin cambio material;
- conflicto de versión o base;
- original no resoluble;
- sucesora no resoluble;
- reemplazante no elegible;
- territorio o rol inválido;
- ambigüedad por solapamiento;
- sesión incompatible;
- estado ya cancelado o sustituido;
- fuente no disponible;
- resultado recuperado después de una respuesta perdida.

Estos outcomes no crean por sí solos nuevos reason codes públicos.

El diagnóstico visible al trabajador permanece bajo `ANIMA-AUTH-016` y `ANIMA-AUTH-017`.

---

#### 39. Seguridad y privacidad

Una respuesta de ANIMA debe informar lo necesario sin revelar información laboral ajena.

No debe exponer automáticamente:

- horario completo del trabajador sustituido;
- horario completo del reemplazante;
- otros candidatos evaluados;
- motivos sensibles de ausencia;
- matriz administrativa completa;
- identificadores internos innecesarios;
- SQL;
- políticas RLS;
- detalles técnicos de concurrencia;
- quién rechazó a otros candidatos.

La autorización administrativa del reemplazo no se deduce de datos enviados por el cliente.

---

#### 40. Auditoría mínima

Debe poder reconstruirse, sin usar la auditoría como fuente de autorización:

```text
ORIGINAL_SHIFT_ID
+
ORIGINAL_REVISION / ESTADO
+
ORIGINAL_EMPLOYEE
+
REPLACEMENT_SHIFT_ID
+
REPLACEMENT_REVISION / ESTADO
+
REPLACEMENT_EMPLOYEE CUANDO CAMBIE
+
SEDE / AREA / ROL APLICABLES
+
REQUESTED_AT
+
APPROVED_AT CUANDO APLIQUE
+
EFFECTIVE_AT
+
AUTORIDAD
+
MOTIVO CUANDO APLIQUE
+
OUTCOME
+
SESIONES Y HECHOS DE ASISTENCIA RELACIONADOS SIN REASIGNARLOS
```

La auditoría debe distinguir sustitución, corrección, cancelación, intercambio, replay, conflicto y reversión.

La auditoría detallada de ANIMA permanece bajo `ANIMA-AUTH-018`.

---

#### 41. Estado físico observado

La inspección read-only del entorno `vento-os-dev` y de los consumidores actuales muestra un modelo previo al contrato completo de reemplazos:

| Superficie | Estado observado |
| --- | --- |
| `public.employee_shifts` | 3436 filas en el snapshot |
| turnos con `published_at` | 3309 |
| turnos con `status = cancelled` | 2 |
| turnos publicados y cancelados | 2 |
| turnos `laboral` | 2899 |
| turnos `descanso` | 537 |
| columnas explícitas de revisión o linaje de reemplazo en `employee_shifts` | no observadas |
| función específica de reemplazo o sustitución de turno por nombre | no observada en la inspección read-only |
| VISO semanal actual | crea y edita filas de `employee_shifts`, publica borradores mediante `published_at` y mantiene versionado/corrección completos todavía pendientes en su roadmap |
| ANIMA | consume turnos publicados y `shift_id`; el contrato final de linaje de reemplazo todavía no está materializado |

Los conteos describen el snapshot observado y no son invariantes empresariales.

La ausencia de columnas físicas de reemplazo no autoriza inferencias por horario, notas o `updated_at`.

---

#### 42. Brechas físicas y propietarios existentes

Ninguna brecha observada crea una tarea nueva.

| Brecha | Propietario existente | Condición de salida |
| --- | --- | --- |
| borrador, revisión, publicación y corrección versionada | `VISO-SCH-005` | la programación distingue estados y conserva correcciones sin sobrescritura destructiva |
| conflictos, concurrencia, idempotencia y recuperación | `VISO-SCH-006` | reemplazos incompatibles no progresan sobre la misma base y todo outcome es recuperable |
| autorización, auditoría, eventos y notificaciones de programación | `VISO-SCH-007` | la autoridad y comunicación del reemplazo quedan gobernadas por contrato |
| publicación y linaje de turno/revisión | `INT-WORK-001` | cada publicación y sustitución conserva identidad, versión anterior y relación explícita |
| asistencia ligada determinísticamente a turno y revisión | `INT-WORK-003` | cada entrada, salida y descanso permanece asociado al actor y ocurrencia correctos |
| confirmación del contexto efectivo | `INT-WORK-004` | ANIMA y consumidores convergen al contexto autoritativo vigente |
| consumo coherente por aplicaciones | `INT-WORK-005` | ningún consumidor mantiene una fuente competidora de reemplazo |
| resolución canónica de contexto | `AUTH-DB-033` | actor, turno, sesión, rol y territorio se resuelven sin fallbacks legacy |
| evaluación con contexto vigente | `AUTH-DB-034` | toda acción posterior usa el contexto recién resuelto |
| invalidación transaccional de autoridad stale | `AUTH-DB-035` | el cambio de turno invalida generación, caché y decisiones previas |
| reacción específica de ANIMA al reemplazo | instancia futura de `ANIMA-AUTH-012` | ANIMA invalida, relee y reautoriza sin transferir sesiones ni historia |
| auditoría detallada | `ANIMA-AUTH-018` | antes, reemplazo, asistencia y después pueden reconstruirse |

---

#### 43. Rollback y recuperación

Un reemplazo confirmado no se borra para restaurar la apariencia anterior.

Ante:

```text
REEMPLAZO CONFIRMADO
+
RESPUESTA PERDIDA
```

se recupera el outcome por identidad y estado autoritativo.

Si el reemplazo no llegó a confirmarse:

- la base anterior conserva su estado real;
- ANIMA no adopta la sucesora como autoridad;
- el cliente no declara éxito.

Si el reemplazo confirmado debe revertirse empresarialmente:

- se utiliza una transición o corrección propietaria nueva;
- se conserva el linaje anterior;
- no se reasigna asistencia histórica;
- no se borra evidencia del reemplazo.

---

#### 44. Topología y materialización física

La definición documental se aprueba una sola vez.

```text
MODE = PER_IMPLEMENTATION_UNIT
EXECUTION_GATE = POST_E5_PACKAGE
INSTANCE_PATTERN = ANIMA-AUTH-012::implementation_unit_id
```

La materialización futura:

- requiere una unidad de implementación real;
- requiere un `package_id` propietario aplicable;
- requiere `E5-GATE-008` del paquete en `PASS`;
- requiere autorización física explícita;
- debe limitarse a productores y consumidores reales del reemplazo;
- debe preservar identidad, linaje, asistencia, contexto, grants y auditoría como capas separadas;
- debe ejecutar toda modificación de Supabase desde `vento-group-sas/vento-shell`.

Esta tarea documental no autoriza DDL, DML, migraciones, RLS, RPC, Edge Functions, código de aplicación, datos productivos ni despliegues.

---

#### 45. Requisitos de prueba derivados

NO GENERA REQUISITOS DE PRUEBA.

**Requisitos creados:** 0

**Requisitos modificados:** 0

**Requisitos diferidos:** 0

**Requisitos obsoletos:** 0

La cobertura vigente ya protege cambio de turno, invalidación de contexto, sesión exacta, autorización territorial, idempotencia, concurrencia, offline, historia de programación, vínculo entre turno y asistencia y no duplicación de jornadas. Esta tarea especializa esas obligaciones para reemplazos sin ampliar el registro.

---

#### 46. Cobertura de prueba vigente reutilizada

Sin modificarlos, se reutilizan:

- `TREQ-AUTH-008`: operación exige turno vigente, check-in cuando aplique, rol y territorio compatibles;
- `TREQ-AUTH-009`: sede y área efectivas se resuelven determinísticamente y una rotación recalcula permisos;
- `TREQ-AUTH-014`: cambio de turno, área, trabajador, dispositivo, rol o asignación invalida contexto, caché y tokens derivados;
- `TREQ-AUTH-015`: toda decisión y acción conserva evidencia correlacionable del contexto que la produjo;
- `TREQ-AUTH-229` a `TREQ-AUTH-237`: sesión de check-in exacta, modalidad por carril, precedencia, canales, offline y concurrencia;
- `TREQ-AUTH-239` a `TREQ-AUTH-268`: rol, sede, área, compatibilidad territorial, causas, frescura y reconciliación;
- `TREQ-ANIMA-003`: intención offline durable e idempotente que conserva turno y debe revalidarse al sincronizar;
- `TREQ-INTEGRATION-003`: identidad estable, efecto único, retry, conflicto y resultado recuperable;
- `TREQ-INTEGRATION-007`: programación y asistencia comparten un contrato único; todo cambio preserva versión anterior y los reemplazos convergen sin duplicar jornadas, contextos ni tiempo trabajado.

Esta enumeración es trazabilidad heredada y no representa modificación del registro.

---

#### 47. Evidencia de validación

| Clase | Estado | Evidencia |
| --- | --- | --- |
| BUILD | NOT_EXECUTED | La batería real del repositorio se ejecuta después de incorporar y normalizar la tarea en su archivo propietario. |
| LOCAL | PASS | El artefacto aislado fue comprobado por estructura, metadata, continuidad, secciones obligatorias, UTF-8, EOL, ausencia de placeholders y cero TREQ afectados dentro de la sección derivada. |
| REMOTA | PASS | Se contrastaron `main`, continuidad, topología, políticas, `ANIMA-AUTH-011`, contratos de programación e integración, 04A pertinente, código VISO y estado `vento-os-dev` mediante lecturas de solo lectura. |
| OPERATIVA | NOT_EXECUTED | No se ejecutó un reemplazo real de turno ni se modificó una sesión real de trabajador. |
| FÍSICA | NOT_EXECUTED | No se ejecutaron migraciones, DDL, DML, RLS, RPC, cambios de código, datos ni despliegues. |

---

#### 48. Decisiones vinculantes

Quedan fijadas las siguientes decisiones:

1. VISO conserva la propiedad del reemplazo y de la programación;
2. ANIMA solo consume el resultado autoritativo;
3. una sustitución real por otra ocurrencia usa identidad de turno distinta;
4. la ocurrencia original no se sobrescribe para ocultar el reemplazo;
5. el linaje original-sucesora debe ser explícito;
6. cambiar de trabajador no transfiere asistencia;
7. `checkin_session_id` nunca se presta ni se reata a otro actor o `shift_id`;
8. el reemplazante debe satisfacer sus propios prerrequisitos de turno, sesión, rol y territorio;
9. un permiso `T+C` no queda satisfecho solo por existir reemplazo;
10. el tiempo trabajado permanece con quien produjo sus hechos de asistencia;
11. un intercambio entre trabajadores conserva cada lado y no intercambia sesiones;
12. cancelación sin sucesor no se clasifica como reemplazo;
13. corrección de la misma ocurrencia no se fuerza a convertirse en reemplazo;
14. cambio temporal de área permanece bajo `ANIMA-AUTH-011`;
15. reemplazo efectivo invalida contexto stale de los actores afectados;
16. `AccessContext` se resuelve de nuevo y no se muta in-place;
17. grants, denies y scope no se heredan del trabajador original;
18. acciones offline no se retargetean silenciosamente a la sucesora;
19. Realtime y notificaciones son señales, no autoridad;
20. dos reemplazos incompatibles no pueden quedar simultáneamente autoritativos;
21. retry no duplica sustituciones;
22. rollback no borra historia confirmada;
23. no se crean nuevos reason codes públicos en esta tarea;
24. no se crean ni modifican requisitos de prueba;
25. no se ejecutan cambios físicos.

---

#### 49. Criterios de aceptación

La tarea queda aceptable cuando:

1. consume `ANIMA-AUTH-011` sin confundir cambio de área con reemplazo;
2. conserva VISO y `VPROC-0007` como propietarios de programación;
3. distingue ocurrencia, revisión, trabajador y sesión;
4. mantiene `shift_id` estable para una misma ocurrencia;
5. usa identidad distinta para una sustitución real por otra ocurrencia;
6. exige linaje explícito entre original y sucesora;
7. no infiere reemplazo por horario, nota, `updated_at` o notificación;
8. no sobrescribe destructivamente al trabajador original de una ocurrencia publicada;
9. conserva trabajador original y reemplazante como identidades separadas;
10. distingue reemplazo de corrección de la misma ocurrencia;
11. distingue reemplazo de cancelación sin sucesor;
12. modela intercambio como relación coordinada y no como intercambio de sesiones;
13. revalida elegibilidad del reemplazante;
14. revalida sede, área y rol de la sucesora;
15. no hereda grants ni bypass del original;
16. no adopta la sucesora antes de confirmación autoritativa;
17. usa tiempo server-side para efectividad;
18. no invalida prematuramente un reemplazo futuro;
19. antes del inicio no crea presencia automática;
20. durante el turno no reasigna tiempo ya trabajado;
21. preserva la sesión del original como historia;
22. impide reatar la sesión del original a otra ocurrencia;
23. impide transferir sesión a otro trabajador;
24. exige sesión propia al reemplazante cuando aplique `T+C`;
25. un descanso del original permanece con su sesión padre;
26. checkout confirmado no puede revivirse por reemplazo;
27. contexto del original queda obsoleto cuando el turno deja de ser aplicable;
28. contexto del reemplazante se resuelve de nuevo;
29. `AccessContext` no se actualiza in-place;
30. permisos se reevaluan para cada actor;
31. territorio de la sucesora no se completa desde la original por fallback;
32. solapamientos ambiguos fallan cerrado;
33. concurrencia usa una base esperada o mecanismo equivalente;
34. no existe last-write-wins silencioso;
35. retry mantiene un solo efecto lógico;
36. respuesta perdida se recupera antes de repetir;
37. acciones offline no cambian silenciosamente de turno;
38. Realtime no se usa como fuente;
39. caché y decisiones previas se invalidan;
40. el tiempo trabajado no se duplica ni se traslada;
41. una corrección posterior conserva historia;
42. la respuesta minimiza información de terceros;
43. auditoría reconstruye original, sucesora, actores, tiempo y outcome;
44. las brechas físicas observadas tienen propietario canónico existente;
45. rollback no borra reemplazos confirmados;
46. la topología queda `PER_IMPLEMENTATION_UNIT`;
47. el gate físico queda `POST_E5_PACKAGE`;
48. no se crean ni modifican TREQ;
49. no se ejecutan cambios físicos;
50. la continuidad reserva exclusivamente `ANIMA-AUTH-013`.

---

#### 50. Límites

Esta tarea no define:

- interfaz administrativa de VISO para solicitar o aprobar reemplazos;
- política empresarial de quién puede pedir un intercambio;
- compensaciones, recargos, nómina o pago por reemplazo;
- reglas legales de jornada;
- disponibilidad laboral completa;
- corrección versionada general de programación, propiedad de `VISO-SCH-005`;
- motor completo de concurrencia y rollback de programación, propiedad de `VISO-SCH-006`;
- catálogo de permisos administrativos, propiedad de los contratos de autorización correspondientes;
- cambio temporal de área, propiedad de `ANIMA-AUTH-011`;
- tratamiento especializado de turnos que cruzan medianoche, propiedad de `ANIMA-AUTH-013`;
- almacenamiento general de cola offline, propiedad de `ANIMA-AUTH-014`;
- revalidación completa de cola, propiedad de `ANIMA-AUTH-015`;
- diagnóstico visible final, propiedad de `ANIMA-AUTH-016` y `ANIMA-AUTH-017`;
- auditoría detallada final, propiedad de `ANIMA-AUTH-018`;
- concesión directa de permisos, prohibida por `ANIMA-AUTH-019`;
- una fuente de verdad paralela a Supabase, frontera de `ANIMA-AUTH-020`;
- un reason code público nuevo;
- un nuevo shape público de `AccessContext`;
- columnas o tablas físicas específicas de reemplazo;
- implementación física;
- cambios productivos.

---

#### 51. Continuidad

**ÚLTIMA TAREA APROBADA**
`ANIMA-AUTH-011 — Manejar cambio temporal de área`

**TAREA ACTUAL APROBADA**
`ANIMA-AUTH-012 — Manejar reemplazos de turno`

**SIGUIENTE TAREA RESERVADA**
`ANIMA-AUTH-013 — Manejar turnos cruzados de medianoche`

### ✅ ANIMA-AUTH-013 — Manejar turnos cruzados de medianoche

**Estado:** APROBADA
**Tarea anterior:** ANIMA-AUTH-012 — Manejar reemplazos de turno
**Tarea siguiente:** ANIMA-AUTH-014 — Manejar cola offline de check-in
**Tipo de tarea:** documental; definición contractual de resolución temporal, asistencia y autorización para una misma ocurrencia laboral cuyo intervalo real comienza en una fecha civil y termina en la siguiente, sin dividir identidad, sesión, contexto ni autoridad por el cambio de medianoche
**Bloque:** `F_ANIMA — AUTORIZACIÓN Y CONTEXTO OPERATIVO`
**Repositorio propietario:** `vento-group-sas/vento-shell`
**Archivo propietario:** `docs/plan-canonico/modular/bloques/F_ANIMA/01_AUTORIZACION_Y_CONTEXTO_OPERATIVO.md`
**Estado físico resultante:** contrato documental definido; materialización física diferida por unidad de implementación
**Cambios físicos autorizados:** ninguno durante esta tarea documental; la materialización futura queda sujeta a la topología `PER_IMPLEMENTATION_UNIT`, al gate `POST_E5_PACKAGE` y a autorización física explícita
**Requisitos de prueba creados o modificados:** 0

---

#### 1. Propósito

Definir cómo debe resolver ANIMA una ocurrencia de turno que cruza medianoche sin convertir el cambio de fecha civil en un cambio de turno, sin perder una sesión de asistencia todavía activa, sin adelantar el turno siguiente y sin degradar la vigencia temporal a comparaciones de `shift_date`, `start_time` y `end_time` ejecutadas como si pertenecieran al mismo día.

La regla raíz queda:

```text
TURNO PUBLICADO
+
INICIO ABSOLUTO RESUELTO
+
FIN ABSOLUTO RESUELTO EN FECHA POSTERIOR
+
INSTANTE ACTUAL DENTRO DE [INICIO, FIN)
->
MISMO SHIFT_ID
+
MISMA OCURRENCIA LOGICA
+
MISMA SESION COMPATIBLE CUANDO EXISTA
+
MISMO CONTEXTO MIENTRAS NO EXISTA OTRA INVALIDACION
```

Medianoche es una frontera de calendario. No es por sí sola una transición de programación, asistencia, contexto ni autorización.

---

#### 2. Resultado canónico

`ANIMA-AUTH-013` fija un contrato único para turnos cross-midnight con las siguientes propiedades:

1. un turno overnight conserva una sola identidad lógica;
2. inicio y fin se comparan como instantes absolutos y no como horas aisladas;
3. la zona horaria contractual forma parte de la resolución;
4. la fecha civil de inicio no limita la vigencia al mismo día calendario;
5. el cambio de fecha a las `00:00` no termina el turno;
6. el check-in previo a medianoche puede seguir siendo válido después de medianoche;
7. el checkout posterior a medianoche cierra la misma sesión exacta;
8. una pausa abierta no se termina solo porque cambió el día civil;
9. el contexto operativo no se invalida únicamente por medianoche;
10. el turno siguiente no sustituye al overnight antes de su frontera real;
11. duración, orden, filtros, caché y proyecciones usan el intervalo normalizado;
12. la cola offline conserva instantes completos y nunca retargetea una intención al turno de la nueva fecha por conveniencia;
13. cualquier ambigüedad entre candidatos falla cerrada;
14. las funciones de recuperación no pueden cerrar prematuramente una sesión overnight por considerar anterior la fecha del check-in;
15. la materialización física permanece fuera de esta tarea documental.

---

#### 3. Vocabulario contractual

**Turno overnight:** ocurrencia laboral continua cuyo `starts_at` y `ends_at` pertenecen a fechas civiles distintas dentro de la zona horaria contractual.

**Fecha ancla del turno:** fecha civil a la que pertenece el inicio del turno en la programación propietaria. No equivale a toda la vigencia del turno.

**Inicio absoluto:** instante inequívoco en que comienza la ventana temporal del turno.

**Fin absoluto:** instante inequívoco en que termina la ventana temporal del turno y que debe ser estrictamente posterior al inicio.

**Medianoche:** transición de una fecha civil a la siguiente dentro de una zona horaria. No es una transición de negocio por sí misma.

**Ventana vigente:** intervalo semiabierto `[starts_at, ends_at)` resuelto por servidor.

**Turno siguiente:** ocurrencia distinta cuyo inicio real ocurre después o en la frontera final de la ocurrencia actual y conserva identidad propia.

---

#### 4. Separaciones obligatorias

Se conservan estas diferencias:

```text
CAMBIO DE FECHA CIVIL
!=
CAMBIO DE TURNO
!=
CHECKOUT
!=
CIERRE DE CONTEXTO
!=
REEMPLAZO
!=
CAMBIO DE AREA
!=
CAMBIO DE ROL
```

También:

```text
SHIFT_DATE
!=
STARTS_AT
!=
ENDS_AT
!=
RESOLVED_AT
```

Y:

```text
TURNO OVERNIGHT
!=
DOS TURNOS DIARIOS
```

Un consumidor no puede partir una ocurrencia solo para adaptarla a una vista diaria, un filtro SQL o un widget de calendario.

---

#### 5. Autoridad temporal

La autoridad temporal se resuelve en servidor usando el contrato publicado del turno.

Para una decisión dependiente de turno se requieren, como mínimo:

- identidad del turno;
- revisión publicada aplicable;
- inicio absoluto;
- fin absoluto;
- zona horaria contractual;
- instante autoritativo de resolución;
- estado temporal de la ocurrencia.

El reloj del dispositivo no decide vigencia.

La configuración regional del dispositivo puede cambiar formato visual, pero no cambia `starts_at`, `ends_at` ni la pertenencia de un evento a la ocurrencia.

---

#### 6. Zona horaria contractual

La resolución vigente conserva `America/Bogota` como zona temporal empresarial mientras otra decisión canónica posterior no la sustituya.

La regla es:

```text
HORA LOCAL PROGRAMADA
+
FECHA CIVIL CORRESPONDIENTE
+
ZONA HORARIA CONTRACTUAL
->
TIMESTAMP ABSOLUTO
```

Queda prohibido:

- usar la zona horaria del dispositivo como autoridad;
- construir un `Date` local y asumir que su offset coincide con el contrato empresarial;
- ordenar o comparar horas de texto sin normalización temporal;
- inferir que una fecha ISO obtenida en UTC representa necesariamente la fecha empresarial local.

---

#### 7. Intervalo absoluto obligatorio

Toda ocurrencia overnight debe poder resolverse a:

```text
starts_at < ends_at
```

La vigencia usa el intervalo semiabierto:

```text
starts_at <= resolved_at < ends_at
```

Consecuencias:

- en el inicio exacto la ocurrencia puede ser vigente;
- durante la noche y después de medianoche permanece vigente;
- en el fin exacto deja de ser vigente;
- no existe un minuto adicional implícito;
- el cambio de fecha civil no introduce una frontera artificial.

---

#### 8. Fecha ancla y fecha de finalización

La fecha ancla identifica el día civil de inicio de la ocurrencia dentro de la programación.

Para un turno que comienza el 28 a las 22:00 y termina el 29 a las 06:00:

```text
shift_anchor_date = dia 28
starts_at = dia 28 22:00 en zona contractual
ends_at = dia 29 06:00 en zona contractual
```

La ocurrencia no cambia su fecha ancla al llegar el día 29.

La representación física futura puede usar timestamps absolutos, fecha final explícita o un contrato equivalente. Esta tarea no impone columnas.

Queda prohibido que ANIMA invente la fecha final a partir de una comparación ambigua de horas si la fuente propietaria no entrega un intervalo resoluble.

---

#### 9. Compatibilidad con representaciones legacy

El modelo físico observado conserva `shift_date`, `start_time` y `end_time` separados y no posee una columna explícita de fecha final en `employee_shifts`.

Una capa de compatibilidad solo podrá interpretar una hora de fin de la fecha siguiente cuando exista una regla propietaria inequívoca que declare esa codificación.

Por defecto:

- `end_time < start_time` no puede convertirse en overnight por inferencia local del cliente;
- `end_time = start_time` no representa automáticamente 24 horas;
- un intervalo imposible o ambiguo falla cerrado;
- el contrato normalizado que llega a autorización debe contener un `ends_at` posterior a `starts_at`.

La decisión física definitiva de edición, almacenamiento y publicación permanece en `VISO-SCH-003` y los contratos de programación relacionados.

---

#### 10. Identidad de turno a través de medianoche

Un overnight conserva el mismo `shift_id` antes y después de las `00:00`.

```text
22:00
-> MISMO SHIFT_ID
23:59:59
-> MISMO SHIFT_ID
00:00
-> MISMO SHIFT_ID
05:59:59
-> MISMO SHIFT_ID
06:00
-> TURNO YA NO VIGENTE
```

No se crea una segunda ocurrencia porque la pantalla cambie de día, porque una consulta filtre por fecha o porque la asistencia continúe después de medianoche.

---

#### 11. Medianoche no invalida contexto

El cruce de medianoche por sí solo no modifica:

- trabajador;
- `shift_id`;
- revisión publicada;
- sede;
- área;
- rol operativo;
- sesión de check-in;
- pausa activa;
- grants aplicables;
- denies;
- scope;
- recurso;
- dispositivo;
- generación de contexto.

Por tanto:

```text
MIDNIGHT
+
SIN OTRO HECHO INVALIDANTE
->
NO INVALIDAR CONTEXTO SOLO POR FECHA
```

Una invalidación real sigue obedeciendo a las causas canónicas: checkout, fin temporal, cambio de turno, reemplazo, cambio de área, rol, asignación, dispositivo, revisión o cualquier otro hecho definido por los contratos vigentes.

---

#### 12. Resolución de `active_shift`

La búsqueda del turno vigente no puede limitarse a:

```text
shift_date = fecha_actual
```

La resolución debe considerar publicaciones cuyo intervalo absoluto contenga `resolved_at`, incluso cuando su fecha ancla sea el día anterior.

Resultado conceptual:

```text
CANDIDATOS PUBLICADOS LABORALES
+
starts_at <= resolved_at < ends_at
+
ACTOR Y TERRITORIO COMPATIBLES
->
CARDINALIDAD TEMPORAL
```

La fecha civil participa para construir el intervalo desde la publicación, no como filtro suficiente de vigencia.

---

#### 13. Cardinalidad y ambigüedad

Después de aplicar estado, publicación, temporalidad, actor y contexto:

```text
0 candidatos
-> NO ACTIVE SHIFT

1 candidato
-> ACTIVE SHIFT RESUELTO

mas de 1 candidato incompatible
-> AMBIGUEDAD / FAIL CLOSED
```

No se escoge por:

- turno de hoy;
- último creado;
- menor `start_time` textual;
- primer resultado SQL;
- check-in como selector arbitrario;
- sede seleccionada en cliente;
- confirmación;
- proximidad aproximada cuando persista una incompatibilidad contractual.

---

#### 14. Check-in antes de medianoche

Un check-in realizado antes de medianoche se vincula a la ocurrencia exacta resuelta por servidor.

Si el turno continúa después de medianoche:

- el evento conserva su timestamp absoluto;
- conserva `shift_id` cuando el contrato físico lo materialice;
- la sesión resultante pertenece a esa ocurrencia;
- no necesita ser reabierta a las `00:00`;
- no se crea un segundo check-in por cambio de día.

La sesión de asistencia es una identidad de ejecución, no un agregado diario.

---

#### 15. Check-in después de medianoche para un turno iniciado el día anterior

Una persona puede intentar check-in después de medianoche mientras la ocurrencia iniciada el día anterior todavía existe.

El cambio de fecha no convierte el turno en inexistente.

La admisibilidad depende de las reglas ordinarias de:

- publicación;
- ventana autorizada de check-in;
- estado del turno;
- trabajador;
- sede;
- área;
- rol;
- compatibilidad;
- política de asistencia aplicable.

Esta tarea no inventa minutos de tolerancia.

Si la política permite esa entrada tardía, el servidor debe poder resolver la ocurrencia del día anterior por su intervalo real. Si la política no la permite, se deniega por la causa temporal correspondiente, no por `shift_date != hoy`.

---

#### 16. Sesión activa a través de medianoche

Una sesión confirmada iniciada antes de medianoche puede permanecer activa después de medianoche mientras:

- pertenezca al mismo trabajador;
- conserve el mismo turno aplicable;
- no haya checkout;
- no haya cierre terminal;
- no haya reemplazo incompatible;
- no exista otra invalidación canónica.

La detección de sesión activa no puede depender de que el último check-in tenga la misma fecha civil que `now`.

Por tanto, una expresión equivalente a:

```text
check_in_date = today
```

no acredita por sí sola que la sesión siga abierta o cerrada.

---

#### 17. Checkout posterior a medianoche

El checkout de un overnight debe cerrar la sesión exacta abierta antes o después de medianoche.

La resolución preferente usa la identidad de sesión y de turno ya vinculada.

Si un evento de salida conserva `shift_id`, ese identificador se valida contra trabajador, sesión, estado y contexto; no se reemplaza por una búsqueda del turno de la fecha actual.

Si falta una referencia histórica suficiente, el resolutor debe usar intervalos absolutos y fallar cerrado ante ambigüedad.

No se reasigna automáticamente la salida al primer turno del nuevo día.

---

#### 18. Fin programado y auto-checkout

Un auto-checkout por fin de turno debe dispararse respecto de `ends_at` real.

Para un turno `22:00 -> 06:00`:

```text
FIN PROGRAMADO = 06:00 DEL DIA SIGUIENTE
```

No:

```text
FIN PROGRAMADO = 06:00 DEL MISMO DIA DEL INICIO
```

Una tarea programada o procesador no puede cerrar el turno a medianoche por detectar que el check-in pertenece al día anterior.

La recuperación de sesiones abiertas debe distinguir:

- sesión overnight todavía vigente;
- sesión cuyo `ends_at` ya pasó;
- sesión sin turno resoluble;
- sesión legacy cuya temporalidad no puede reconstruirse.

---

#### 19. Procesamiento de sesiones abiertas antiguas

La condición:

```text
fecha(check_in) < fecha(now)
```

no es suficiente para clasificar una sesión como stale.

Para una ocurrencia overnight todavía vigente, esa comparación es esperada.

El procesador futuro debe decidir usando, como mínimo:

- sesión abierta exacta;
- turno vinculado cuando exista;
- `starts_at`;
- `ends_at`;
- estado publicado vigente;
- tiempo autoritativo;
- política de recuperación aplicable.

Una sesión overnight no puede cerrarse anticipadamente usando `min(ends_at, now)` solo porque el check-in ocurrió en la fecha civil anterior.

---

#### 20. Pausas que cruzan medianoche

Una pausa abierta antes de medianoche puede terminar después de medianoche sin crear otra pausa.

El cambio de fecha no ejecuta:

- `END_BREAK`;
- checkout;
- nuevo check-in;
- nueva sesión;
- nuevo turno.

La pausa conserva relación con la misma sesión y el mismo turno.

Su duración se calcula por instantes absolutos.

La semántica general de descansos permanece bajo `ANIMA-AUTH-010`.

---

#### 21. Contexto operativo y autorización

Un permiso con carril `T` o `T+C` puede seguir utilizando el turno overnight después de medianoche mientras la ocurrencia siga temporalmente vigente y el resto de prerrequisitos se mantenga.

La autorización no debe caer a `DENY` solo porque cambió el día civil.

Tampoco debe permanecer `ALLOW` después de `ends_at`.

Para `T+C`, la sesión de check-in debe seguir siendo compatible con la misma ocurrencia.

Las capacidades base que no dependen de turno conservan su modalidad ordinaria.

---

#### 22. Fin exacto del turno

La frontera final es estricta.

```text
resolved_at < ends_at
-> TURNO PUEDE SEGUIR VIGENTE

resolved_at = ends_at
-> TURNO YA NO ES VIGENTE
```

A partir de esa frontera:

- el contexto dependiente del turno deja de ser reutilizable;
- una acción protegida debe resolver de nuevo;
- no existe gracia implícita;
- el turno siguiente puede evaluarse bajo sus propias reglas;
- una sesión todavía abierta entra en el flujo de checkout o recuperación que corresponda, pero no extiende la autorización del turno terminado.

---

#### 23. Turnos consecutivos en la frontera

Dos ocurrencias pueden ser consecutivas:

```text
S1 = [22:00, 06:00)
S2 = [06:00, 14:00)
```

En `06:00`:

- `S1` ya no es vigente;
- `S2` puede comenzar a ser vigente;
- no existe solapamiento temporal por la semántica semiabierta;
- la sesión de `S1` no se presta a `S2`;
- si `S2` exige check-in, necesita una sesión compatible propia;
- el contexto de `S1` no se recicla como contexto de `S2`.

---

#### 24. Solapamientos incompatibles

Si dos publicaciones distintas son simultáneamente candidatas para el mismo trabajador e instante y no existe precedencia canónica inequívoca:

```text
AMBIGUEDAD
->
FAIL CLOSED
```

La existencia de un overnight no autoriza escoger el turno de la nueva fecha por encima del iniciado el día anterior.

La resolución de conflictos de programación permanece en los contratos propietarios de VISO y `VISO-SCH-006`.

---

#### 25. Relación con reemplazos

`ANIMA-AUTH-012` conserva la propiedad de reemplazos.

Si un overnight es reemplazado antes o durante su ventana:

- el cambio de identidad se resuelve como reemplazo;
- la ocurrencia original conserva historia;
- la sesión no se transfiere al sucesor;
- el cambio de medianoche no modifica el linaje;
- la autorización posterior se resuelve contra la ocurrencia vigente del actor.

Esta tarea no redefine la atomicidad ni aprobación empresarial del reemplazo.

---

#### 26. Relación con cambio temporal de área y rol

`ANIMA-AUTH-011` conserva la propiedad del cambio temporal de área.

Un overnight puede cruzar medianoche sin cambiar área ni rol.

Si durante su vida ocurre un cambio autoritativo de área, rol, sede o revisión:

- se procesa el hecho real correspondiente;
- se invalida cuando el contrato así lo exige;
- no se atribuye la invalidación a medianoche;
- no se combinan campos de estados distintos.

---

#### 27. Cola offline y eventos pendientes

La cola general permanece bajo `ANIMA-AUTH-014` y su revalidación bajo `ANIMA-AUTH-015`.

Esta tarea fija únicamente la frontera temporal que esas tareas deben conservar:

- el evento pendiente mantiene timestamp absoluto;
- mantiene la identidad conocida de turno cuando exista;
- conserva la zona o referencia temporal necesaria para reproducir la intención;
- no cambia su `shift_id` porque el calendario haya avanzado;
- no se reescribe como evento del turno del nuevo día;
- al sincronizar se resuelve el estado autoritativo vigente y la historia del evento original.

---

#### 28. Realtime, polling y señales

Una señal recibida a medianoche no constituye por sí misma cambio de turno.

La regla permanece:

```text
SIGNAL
->
INVALIDATE CUANDO CORRESPONDA
->
FETCH AUTHORITATIVE STATE
->
RESOLVE
```

El payload de una señal no puede imponer el turno actual.

La ausencia de una señal exacta a las `00:00` tampoco cambia la verdad persistida.

---

#### 29. Proyección `hoy`

La categoría visual `hoy` no es una autoridad de turno.

Después de medianoche, un turno iniciado el día anterior y todavía vigente puede seguir siendo la ocurrencia activa aunque su fecha ancla ya no coincida con la fecha actual.

Una pantalla puede agrupar programación por fecha, pero debe distinguir:

- pertenencia visual a una fecha;
- turno activo real;
- próximo turno;
- sesión abierta.

No se permite que una tarjeta `hoy` desactive autorización o esconda la ocurrencia activa por un filtro civil.

---

#### 30. Proyección de próximo turno

Mientras un overnight permanezca activo, no puede desaparecer de la resolución simplemente porque su `shift_date` sea anterior a hoy.

La selección de próximo turno debe ordenar por `starts_at` real y considerar primero si existe una ocurrencia vigente.

Queda prohibido:

- filtrar exclusivamente `shift_date >= hoy` para encontrar la ocurrencia activa;
- considerar terminado un turno porque `end_time` sea menor que `start_time` dentro de la misma fecha;
- promocionar el turno de la mañana como siguiente mientras el overnight todavía esté activo, salvo que la UI distinga explícitamente “activo” de “siguiente” sin sustituir autoridad.

---

#### 31. Consultas y filtros temporales

Toda consulta que necesite resolver estado temporal debe incluir suficiente horizonte para capturar ocurrencias iniciadas en una fecha anterior pero todavía vigentes.

No se fija aquí una ventana física de consulta.

Sí se fija que:

```text
FILTRO POR FECHA CIVIL
!=
RESOLUCION DE VIGENCIA
```

Los filtros de semana, mes o día pueden usarse para presentación siempre que no alteren la identidad ni la resolución autoritativa.

---

#### 32. Duración del turno

La duración se calcula como:

```text
ends_at - starts_at - descansos_aplicables
```

Nunca como:

```text
end_time - start_time
```

cuando ambas horas han sido construidas sobre la misma fecha civil para un overnight.

Queda prohibido corregir una duración negativa mediante `max(0, duracion)` y tratar el resultado cero como válido.

Un intervalo normalizado debe ser positivo antes de descontar pausas.

---

#### 33. `show_end_as_close` no altera temporalidad

Una etiqueta visual de cierre no puede sustituir un fin autoritativo.

`show_end_as_close` puede afectar presentación, pero no puede:

- eliminar `ends_at`;
- extender el turno indefinidamente;
- decidir que medianoche es el cierre;
- cambiar la identidad del turno;
- evitar la validación temporal.

La autorización siempre necesita una frontera temporal real y resoluble.

---

#### 34. Cambio de mes, año y otras fronteras civiles

La misma regla aplica cuando un turno cruza:

- fin de mes;
- fin de año;
- febrero a marzo;
- cualquier cambio de fecha civil.

Ejemplo:

```text
31 diciembre 22:00
-> 1 enero 06:00
-> MISMA OCURRENCIA
```

La navegación por periodo no puede partir el turno ni duplicar su asistencia.

---

#### 35. Métricas diarias, nómina y atribución de tiempo

Esta tarea define vigencia y continuidad de autorización, no la regla contable o laboral para distribuir horas entre fechas.

Por tanto:

- una sesión overnight puede producir tiempo en dos fechas civiles;
- esa distribución no modifica la identidad del turno;
- una métrica diaria puede requerir segmentación de lectura;
- segmentar una métrica no crea dos sesiones ni dos turnos;
- la regla de nómina, recargos nocturnos, fecha laboral o corte contable permanece fuera de alcance.

No se usará una necesidad de reporting para alterar la semántica de autorización.

---

#### 36. Outcomes internos mínimos

La materialización futura debe poder distinguir, como mínimo:

- turno vigente overnight resuelto;
- turno todavía no iniciado;
- turno terminado;
- intervalo inválido;
- intervalo no reproducible por falta de información temporal;
- ambigüedad entre candidatos;
- sesión activa válida de la misma ocurrencia;
- sesión no compatible;
- sesión ya cerrada;
- evento offline con referencia histórica;
- fallo técnico de resolución.

Estos outcomes internos no crean nuevos reason codes públicos.

---

#### 37. Matriz de decisión

| Caso | Estado | Instante | Decisión |
| --- | --- | --- | --- |
| A | turno `22:00 -> 06:00` normalizado y publicado | 23:00 | mismo turno vigente |
| B | mismo turno | 00:00 del día siguiente | mismo turno vigente; no cerrar por medianoche |
| C | mismo turno | 05:59:59 | mismo turno vigente |
| D | mismo turno | 06:00 exacto | turno terminado por frontera semiabierta |
| E | check-in a las 22:00 | 00:30 | misma sesión abierta si no existe checkout ni invalidación |
| F | pausa abierta antes de medianoche | después de medianoche | misma pausa; no auto-finalizar por fecha |
| G | checkout a las 05:50 | sesión vinculada al turno overnight | cerrar la misma sesión |
| H | turno del día anterior todavía vigente + turno futuro del día actual | 01:00 | conservar overnight como vigente; futuro no lo sustituye |
| I | dos turnos incompatibles vigentes | cualquiera | ambigüedad; fail closed |
| J | `shift_date = ayer` pero intervalo contiene `resolved_at` | después de medianoche | candidato válido |
| K | `end_time < start_time` sin contrato que explique fin al día siguiente | cualquiera | intervalo no reproducible; fail closed |
| L | sesión previa marcada stale solo por cambio de fecha | antes de `ends_at` | no cerrar |
| M | evento offline anterior a medianoche sincronizado después | posterior | conservar evento original y revalidar; no retargetear |
| N | turno consecutivo inicia exactamente cuando termina overnight | frontera | termina S1; evaluar S2 con identidad y sesión propias |
| O | cambio de mes o año durante turno | dentro del intervalo | misma ocurrencia |

---

#### 38. Seguridad y privacidad

La respuesta visible al trabajador no debe revelar automáticamente:

- candidatos alternativos de turno;
- horarios de terceros;
- reglas internas de matching;
- ventanas de tolerancia internas no destinadas al usuario;
- IDs técnicos innecesarios;
- detalles SQL;
- políticas RLS;
- estado de otros turnos;
- motivo administrativo sensible.

Un error de zona, intervalo o ambigüedad no se convierte en `ALLOW` para evitar fricción.

El diagnóstico visible final permanece bajo `ANIMA-AUTH-016` y `ANIMA-AUTH-017`.

---

#### 39. Auditoría mínima

Debe poder reconstruirse:

```text
TRABAJADOR
+
SHIFT_ID
+
REVISION / SNAPSHOT APLICABLE
+
STARTS_AT
+
ENDS_AT
+
ZONA HORARIA
+
RESOLVED_AT
+
CHECKIN_SESSION_ID CUANDO EXISTA
+
EVENTOS DE ENTRADA / SALIDA
+
PAUSAS CUANDO EXISTAN
+
SEDE
+
AREA
+
ROL
+
OUTCOME
```

La auditoría debe permitir demostrar que el cambio de día civil no creó una segunda ocurrencia ni cerró una sesión prematuramente.

La auditoría detallada de creación y cierre de contexto permanece bajo `ANIMA-AUTH-018`.

---

#### 40. Estado físico observado en ANIMA

La inspección read-only del código actual muestra comportamiento previo al contrato objetivo:

| Superficie | Estado observado |
| --- | --- |
| `src/components/shifts/utils.ts` | construye inicio y fin con la misma `shift_date`; una duración con `end <= start` devuelve `0` |
| `isUpcomingShift` | construye el fin con la misma fecha civil y puede clasificar un overnight como terminado |
| `src/components/home/use-next-scheduled-shift.ts` | filtra `shift_date >= hoy`, por lo que después de medianoche puede excluir una ocurrencia iniciada el día anterior |
| `src/components/shifts/use-shifts-data.ts` | agrupa semana y días por `shift_date`; válido para presentación, insuficiente para resolver vigencia |
| `src/components/shifts/shift-form.ts` | rechaza `end <= start`; ANIMA no admite hoy creación/edición overnight mediante esa superficie |
| `src/hooks/use-attendance.ts` | la resolución fallback de turno usa `shift_date = hoy`; el checkout intenta conservar `shift_id` del último evento cuando existe |
| `src/hooks/use-attendance.ts` | el estado abierto observado compara la fecha civil del último check-in con el día actual; esa condición no representa una sesión overnight |

Estas observaciones no autorizan cambios de código en esta tarea.

---

#### 41. Estado físico observado en VISO y Supabase

La inspección read-only del entorno `vento-os-dev` y del código VISO muestra:

| Superficie | Estado observado |
| --- | --- |
| `public.employee_shifts` | 3436 filas totales; 2899 laborales en el snapshot |
| turnos laborales con `end_time < start_time` | 0 |
| turnos laborales con `end_time = start_time` | 0 |
| esquema `employee_shifts` | no se observó fecha final explícita ni flag específico de overnight |
| `unique_employee_shift_per_day` | unicidad actual por `employee_id, site_id, shift_date, start_time` |
| VISO `getShiftMinutes` | resta horas del mismo día y trunca a cero una duración negativa |
| VISO formulario ANIMA/VISO observado | las superficies actuales no representan todavía overnight de forma canónica |
| delta mensual VISO | declara expresamente que la modalidad rápida actual no admite overnight |
| `_shift_end_at_bogota` | construye el fin usando la misma `shift_date` del inicio |
| `resolve_attendance_shift_id` | usa `_shift_end_at_bogota` para matching de checkout, por lo que no representa el fin del día siguiente |
| `close_stale_open_attendance_shifts` | reconoce `end_time <= start_time` al calcular fin, pero selecciona check-ins de fecha anterior como stale y normaliza con `least(target_check_out_at, now)`, condición incompatible con un overnight aún vigente |
| pares observados de entrada/salida que cruzan fecha civil | 47 pares en el snapshot consultado |
| check-ins observados sin `shift_id` | 1257, evidencia de compatibilidad legacy que impide depender siempre de una referencia exacta ya materializada |

Los conteos describen un snapshot y no son invariantes empresariales.

---

#### 42. Brechas físicas y propietarios existentes

Ninguna brecha observada crea una tarea nueva.

| Brecha | Propietario existente | Condición de salida |
| --- | --- | --- |
| edición, duración y codificación autoritativa de overnight en programación | `VISO-SCH-003` | VISO produce un intervalo overnight inequívoco y positivo sin depender de resta same-day |
| publicación versionada del intervalo y zona | `INT-WORK-001` / `VISO-SCH-005` | toda revisión publicada expone inicio, fin y zona reproducibles |
| resolución temporal de turno activo | `AUTH-DB-033` | la consulta de contexto encuentra turnos iniciados el día anterior cuando su intervalo sigue vigente |
| evaluación de autorización con intervalo absoluto | `AUTH-DB-034` | `T` y `T+C` usan `[starts_at, ends_at)` sin filtro civil incorrecto |
| invalidación en frontera real | `AUTH-DB-035` | el contexto se invalida por hechos canónicos y fin real, no solo por medianoche |
| matching de asistencia y checkout overnight | `INT-WORK-003` y unidad física futura de `ANIMA-AUTH-013` | entrada y salida convergen sobre la misma ocurrencia y sesión a través de medianoche |
| procesador de sesiones stale | unidad física futura de `ANIMA-AUTH-013` y propietarios de asistencia aplicables | una sesión overnight vigente no se auto-cierra por pertenecer a la fecha civil anterior |
| proyecciones `hoy`, próximo turno y duración en ANIMA | unidad física futura de `ANIMA-AUTH-013` | ANIMA distingue agrupación visual de resolución temporal |
| cola offline | `ANIMA-AUTH-014` | evento durable conserva instante e identidad suficientes |
| revalidación de cola | `ANIMA-AUTH-015` | sincronización resuelve intervalo y autoridad actuales sin retargeting |
| diagnóstico visible | `ANIMA-AUTH-016` y `ANIMA-AUTH-017` | trabajador recibe causa segura y recuperación coherente |
| auditoría detallada | `ANIMA-AUTH-018` | la continuidad temporal puede reconstruirse de extremo a extremo |

---

#### 43. Rollback y recuperación

Una corrección de temporalidad no elimina eventos históricos para reconstruir una narrativa distinta.

Si una implementación futura calculó erróneamente un fin same-day pero todavía no produjo efectos:

- se corrige la resolución antes de autorizar;
- no se adopta un intervalo imposible.

Si produjo un cierre incorrecto:

- la historia original se conserva;
- la recuperación se procesa mediante la corrección o compensación autoritativa aplicable;
- no se borra el checkout para fingir que nunca ocurrió;
- no se extiende retroactivamente autorización sin evidencia.

Un retry usa la identidad lógica de la operación y recupera el resultado existente cuando corresponda.

---

#### 44. Topología y materialización física

La definición documental se aprueba una sola vez.

```text
MODE = PER_IMPLEMENTATION_UNIT
EXECUTION_GATE = POST_E5_PACKAGE
INSTANCE_PATTERN = ANIMA-AUTH-013::implementation_unit_id
```

La materialización futura:

- requiere una unidad de implementación real;
- requiere un `package_id` propietario aplicable;
- requiere `E5-GATE-008` del paquete en `PASS`;
- requiere autorización física explícita;
- puede abarcar ANIMA y componentes de asistencia únicamente cuando formen parte de la misma unidad física aprobada;
- debe preservar propiedad de VISO sobre programación;
- debe ejecutar cualquier modificación de Supabase desde `vento-group-sas/vento-shell`;
- debe incluir pruebas de fronteras antes de producción.

Esta tarea documental no autoriza DDL, DML, migraciones, RLS, RPC, Edge Functions, cron, código de aplicación, datos ni despliegues.

---

#### 45. Requisitos de prueba derivados

NO GENERA REQUISITOS DE PRUEBA.

**Requisitos creados:** 0

**Requisitos modificados:** 0

**Requisitos diferidos:** 0

**Requisitos obsoletos:** 0

La cobertura vigente ya protege intervalo semiabierto, timestamps absolutos, zona horaria, turnos nocturnos iniciados el día anterior, ambigüedad temporal, invalidación, sesión exacta, idempotencia, offline y vínculo entre programación y asistencia. Esta tarea especializa esas obligaciones para ANIMA sin ampliar el registro.

---

#### 46. Cobertura de prueba vigente reutilizada

Sin modificarla, se reutiliza la cobertura existente de:

- `TREQ-AUTH-008`: capacidades operativas conservan prerrequisitos de turno, check-in, rol y territorio;
- `TREQ-AUTH-014`: cambio de turno, área, trabajador, dispositivo, rol o asignación invalida contexto, caché y tokens derivados;
- `TREQ-AUTH-015`: decisiones y acciones conservan evidencia correlacionable de turno, check-in, territorio, contexto y timestamp;
- `TREQ-AUTH-219`: un turno fuera del intervalo semiabierto produce denegación y cero efectos;
- `TREQ-AUTH-220`: vigencia por `resolved_at`, timestamps absolutos, `America/Bogota` y `[starts_at, ends_at)`;
- `TREQ-AUTH-221`: inicio futuro y turno terminado conservan diagnóstico interno separado sin filtrar horario;
- `TREQ-AUTH-222`: ausencia, ventana, check-in, rol, dispositivo, configuración, permiso y fallo técnico conservan razones distintas;
- `TREQ-AUTH-223`: temporalidad se aplica por permiso y carril, no indiscriminadamente a toda la aplicación;
- `TREQ-AUTH-224`: turnos nocturnos, publicaciones iniciadas el día anterior, candidatos simultáneos, zonas y duraciones se resuelven con intervalos absolutos;
- `TREQ-ANIMA-003`: una intención offline conserva identidad estable, timestamp, turno y contexto y se revalida al sincronizar;
- `TREQ-INTEGRATION-003`: operación reintentable conserva identidad estable y un solo efecto;
- `TREQ-INTEGRATION-007`: programación y asistencia comparten contrato único; turnos cruzados de medianoche deben converger sin duplicar jornadas, contextos ni tiempo trabajado.

Esta enumeración es trazabilidad heredada y no representa modificación del registro.

---

#### 47. Evidencia de validación

| Clase | Estado | Evidencia |
| --- | --- | --- |
| BUILD | NOT_EXECUTED | La batería real del repositorio se ejecuta después de incorporar y normalizar la tarea en su archivo propietario. |
| LOCAL | PASS | El artefacto aislado fue comprobado por estructura, metadata, continuidad, secciones obligatorias, UTF-8, EOL, ausencia de placeholders y cero requisitos afectados dentro de la sección derivada. |
| REMOTA | PASS | Se contrastaron `main`, continuidad, topología, políticas, tareas ANIMA previas, contratos INT-WORK, cobertura 04A, VISO, ANIMA y el snapshot read-only de `vento-os-dev`. |
| OPERATIVA | NOT_EXECUTED | No se ejecutó un turno real overnight ni una marcación física a través de medianoche. |
| FÍSICA | NOT_EXECUTED | No se ejecutaron migraciones, DDL, DML, RLS, RPC, cambios de código, datos, cron ni despliegues. |

---

#### 48. Criterios de aceptación

La tarea queda aceptable cuando:

1. un overnight conserva una sola ocurrencia;
2. medianoche no crea otro `shift_id`;
3. la vigencia usa timestamps absolutos;
4. el intervalo queda normalizado con `starts_at < ends_at`;
5. la zona contractual participa en la normalización;
6. el dispositivo no impone su zona como autoridad;
7. `shift_date` no se usa como filtro suficiente de turno vigente;
8. un turno iniciado ayer puede seguir vigente hoy;
9. el inicio exacto pertenece a la ventana;
10. el fin exacto queda fuera de la ventana;
11. no existe minuto de gracia implícito;
12. el check-in previo a medianoche conserva la misma sesión después de medianoche;
13. el cambio de fecha no crea otro check-in;
14. una sesión activa no se decide por `check_in_date = today`;
15. un checkout después de medianoche cierra la misma sesión;
16. un `shift_id` histórico válido se conserva como referencia preferente;
17. si falta referencia exacta, el matching usa intervalos absolutos y falla cerrado ante ambigüedad;
18. el fin programado de un overnight ocurre en la fecha civil posterior;
19. un procesador stale no cierra una sesión solo porque el check-in fue ayer;
20. `min(ends_at, now)` no se usa para cerrar prematuramente una sesión todavía vigente;
21. una pausa puede atravesar medianoche sin duplicarse;
22. medianoche no ejecuta `END_BREAK`;
23. el contexto no se invalida únicamente por cambio de fecha;
24. el contexto sí deja de ser reutilizable en la frontera final u otra invalidación real;
25. `T` y `T+C` siguen resolviendo turno vigente durante la noche;
26. `T+C` conserva exigencia de sesión compatible;
27. turnos consecutivos respetan la frontera semiabierta;
28. la sesión del turno anterior no se presta al siguiente;
29. un solapamiento incompatible falla cerrado;
30. el turno del nuevo día no gana por preferencia de fecha;
31. los reemplazos permanecen bajo `ANIMA-AUTH-012`;
32. los cambios temporales de área permanecen bajo `ANIMA-AUTH-011`;
33. la cola general permanece bajo `ANIMA-AUTH-014`;
34. la revalidación de cola permanece bajo `ANIMA-AUTH-015`;
35. una intención offline no se retargetea por medianoche;
36. Realtime es señal y no autoridad;
37. la proyección `hoy` no gobierna autorización;
38. próximo turno y turno activo se distinguen;
39. una consulta civil no sustituye resolución temporal;
40. duración se calcula desde instantes absolutos;
41. una duración negativa no se corrige silenciosamente a cero;
42. `show_end_as_close` no elimina la frontera temporal;
43. cambio de mes o año no divide la ocurrencia;
44. métricas diarias no cambian identidad de turno ni sesión;
45. intervalos legacy ambiguos fallan cerrados;
46. las brechas físicas observadas conservan propietarios existentes;
47. rollback no borra historia;
48. no se crean ni modifican requisitos de prueba;
49. la topología queda `PER_IMPLEMENTATION_UNIT`;
50. el gate físico queda `POST_E5_PACKAGE`;
51. no se ejecutan cambios físicos.

---

#### 49. Límites

Esta tarea no define:

- el modelo físico definitivo para almacenar fecha final o timestamps absolutos;
- el editor final de overnight en VISO;
- límites legales de jornada;
- recargos nocturnos;
- horas extra;
- nómina;
- fecha contable de la jornada;
- cortes de reportes diarios;
- duración máxima legal o empresarial;
- tolerancias nuevas de entrada o salida;
- turnos partidos;
- aprobación de programación, propiedad de VISO;
- edición, bloques y modalidad rápida, propiedad de `VISO-SCH-003`;
- corrección y publicación versionada general, propiedad de `VISO-SCH-005`;
- conflictos generales de programación, propiedad de `VISO-SCH-006`;
- reemplazos, propiedad de `ANIMA-AUTH-012`;
- cambio temporal de área, propiedad de `ANIMA-AUTH-011`;
- almacenamiento completo de cola offline, propiedad de `ANIMA-AUTH-014`;
- revalidación completa de cola, propiedad de `ANIMA-AUTH-015`;
- diagnóstico visible final, propiedad de `ANIMA-AUTH-016` y `ANIMA-AUTH-017`;
- auditoría detallada final, propiedad de `ANIMA-AUTH-018`;
- concesión directa de permisos, prohibida por `ANIMA-AUTH-019`;
- una fuente paralela distinta de Supabase, frontera de `ANIMA-AUTH-020`;
- un código nuevo de permiso;
- un reason code público nuevo;
- un nuevo shape público de `AccessContext`;
- implementación física;
- cambios productivos.

---

#### 50. Continuidad

**ÚLTIMA TAREA APROBADA**
`ANIMA-AUTH-012 — Manejar reemplazos de turno`

**TAREA ACTUAL APROBADA**
`ANIMA-AUTH-013 — Manejar turnos cruzados de medianoche`

**SIGUIENTE TAREA RESERVADA**
`ANIMA-AUTH-014 — Manejar cola offline de check-in`

### ✅ ANIMA-AUTH-014 — Manejar cola offline de check-in

**Estado:** APROBADA
**Tarea anterior:** ANIMA-AUTH-013 — Manejar turnos cruzados de medianoche
**Tarea siguiente:** ANIMA-AUTH-015 — Revalidar permisos al sincronizar una cola offline
**Tipo de tarea:** documental; definición contractual de captura, persistencia durable, identidad, custodia, orden, retry, idempotencia, aislamiento y recuperación de intenciones offline de asistencia en ANIMA, sin convertir la cola local en hecho empresarial ni adelantar la revalidación autoritativa reservada a la sincronización
**Bloque:** `F_ANIMA — AUTORIZACIÓN Y CONTEXTO OPERATIVO`
**Repositorio propietario:** `vento-group-sas/vento-shell`
**Archivo propietario:** `docs/plan-canonico/modular/bloques/F_ANIMA/01_AUTORIZACION_Y_CONTEXTO_OPERATIVO.md`
**Estado físico resultante:** contrato documental definido; materialización física diferida por unidad de implementación
**Cambios físicos autorizados:** ninguno durante esta tarea documental; la materialización futura queda sujeta a `PER_IMPLEMENTATION_UNIT`, `POST_E5_PACKAGE`, al paquete propietario aplicable y a autorización física explícita
**Requisitos de prueba creados o modificados:** 0

---

#### 1. Propósito

Definir cómo ANIMA debe conservar una intención de check-in cuando la conectividad necesaria para confirmar el efecto server-side no está disponible, evitando que “guardar localmente” se confunda con “registrar asistencia”, evitando pérdida silenciosa al cerrar o reiniciar la aplicación y garantizando que todo replay conserve la misma identidad y el mismo contenido lógico.

La regla raíz queda:

```text
INTENCION DE ASISTENCIA ELEGIBLE PARA CAPTURA OFFLINE
+
IDENTIDAD ESTABLE ANTES DEL PRIMER ENVIO
+
CONTENIDO LOGICO INMUTABLE
+
PERSISTENCIA LOCAL DURABLE CONFIRMADA
→
ESTADO LOCAL PENDIENTE
→
CUSTODIA EN EL DISPOSITIVO
→
RETRY BAJO CONTRATO DE COLA
→
HANDOFF A ANIMA-AUTH-015 PARA REVALIDACION
→
FRONTERA SERVIDORA AUTORITATIVA
```

También se fija:

```text
ENCOLADO
!=
CHECK-IN CONFIRMADO
!=
SESION ACTIVA CONFIRMADA
!=
CONTEXTO OPERATIVO AUTORITATIVO
!=
PERMISO
```

La pérdida de red puede diferir el intento. No puede fabricar autoridad, extender una ventana laboral ni convertir estado local en fuente de verdad.

---

#### 2. Resultado canónico

`ANIMA-AUTH-014` establece un contrato único de cola offline para la intención de asistencia con las siguientes propiedades:

1. la intención recibe identidad estable antes de cualquier primer envío;
2. el payload lógico queda fijado y fingerprintable;
3. la cola solo puede presentarse como durable después de confirmar escritura local exitosa;
4. cerrar, suspender o reiniciar la aplicación no elimina una intención persistida;
5. restaurar una intención no genera otra identidad;
6. el dispositivo conserva custodia local, pero no propiedad del hecho empresarial;
7. la cola conserva actor, turno, tiempo, territorio, geolocalización y contexto suficientes para revalidación posterior;
8. cada retry reutiliza la misma identidad y contenido lógico;
9. la espera por conectividad no se contabiliza como una ejecución contra servidor;
10. los resultados `applied`, `duplicate`, `conflict`, fallo, incertidumbre y aislamiento conservan semántica distinta;
11. una respuesta perdida no autoriza retry ciego cuando el efecto pudo ocurrir;
12. una identidad repetida con contenido distinto es conflicto y no duplicado inocuo;
13. una frontera server-side ausente o incompatible no habilita escritura alternativa silenciosa;
14. un elemento inválido no se borra para “destrabar” la cola;
15. la revalidación de permisos, turno y contexto al sincronizar permanece exclusivamente en `ANIMA-AUTH-015`;
16. la cola nunca concede grants ni crea `AccessContext` por sí misma.

La tarea especializa para ANIMA los contratos transversales de trabajo asíncrono ya aprobados. No crea otro framework de colas paralelo.

---

#### 3. Fuentes y autoridad

La definición consume sin redefinir:

- `INT-WORK-003`, que fija la asistencia como hecho identificado antes del primer intento y separa intención local, persistencia, recepción, validación y conciliación;
- `QUEUE-ARC-002` a `QUEUE-ARC-012`, que gobiernan identidad de trabajo, idempotencia, temporalidad, asignación, retry, cancelación, aislamiento, concurrencia, estados, métricas y autorización del trabajo asíncrono;
- la identidad inventariada `QAI-011`, cola ANIMA de operaciones de asistencia;
- `QAI-012`, cola separada de descansos;
- `QAI-013`, worker móvil periódico que procesa pendientes sin crear otra identidad por cada tick;
- `ANIMA-AUTH-001` a `ANIMA-AUTH-013`, que fijan publicación, territorio, rol, contexto, checkout, descansos, cambios, reemplazos y overnight;
- `ANIMA-AUTH-015`, reservada para revalidación autoritativa al recuperar conectividad;
- `ANIMA-AUTH-020`, que impide que el dispositivo se convierta en fuente de verdad paralela a Supabase.

La autoridad queda separada así:

```text
DISPOSITIVO ANIMA
→ CAPTURA Y CUSTODIA INTENCION

SERVIDOR / CONTRATO AUTORITATIVO
→ DECIDE SI EL EFECTO PUEDE APLICARSE

SUPABASE
→ CONSERVA EL HECHO CONFIRMADO CUANDO CORRESPONDA
```

Ningún estado del cliente sustituye la decisión servidora.

---

#### 4. Vocabulario contractual

**Intención offline de asistencia:** solicitud capturada localmente para ejecutar posteriormente una transición de asistencia cuando la frontera servidora no pueda completarse en ese momento.

**Identidad de evento:** identificador estable del hecho intentado por el productor, representado en el contrato vigente mediante `client_event_id` o una identidad equivalente preservada end-to-end.

**Identidad local de elemento de cola:** identificador técnico de la entrada persistida en el dispositivo. Puede ser distinto de la identidad de evento y no la sustituye.

**Identidad transversal de operación:** `operation_id` del contrato de trabajo asíncrono cuando la intención sea aceptada o correlacionada con la infraestructura transversal correspondiente. No se presume igual a `client_event_id` salvo contrato explícito.

**Fingerprint lógico:** huella estable del contenido semánticamente relevante de la intención, utilizada para distinguir replay legítimo de reutilización conflictiva de identidad.

**Custodia local:** responsabilidad temporal del dispositivo de preservar la intención mientras no exista un resultado autoritativo recuperable.

**Resultado desconocido:** condición en la que una ejecución pudo producir efecto, pero el cliente no dispone de evidencia suficiente para declararlo aplicado, fallido o seguro de repetir.

**Cuarentena:** aislamiento de una intención que requiere revisión, conciliación o recuperación controlada y que no admite retry automático ordinario.

---

#### 5. Frontera entre `ANIMA-AUTH-014` y `ANIMA-AUTH-015`

Las responsabilidades se separan de forma obligatoria:

| Responsabilidad | Propietaria |
| --- | --- |
| crear identidad estable de la intención | `ANIMA-AUTH-014` |
| fijar contenido lógico y fingerprint | `ANIMA-AUTH-014` |
| confirmar persistencia durable antes de mostrar “encolado” | `ANIMA-AUTH-014` |
| restaurar cola después de reinicio | `ANIMA-AUTH-014` |
| ordenar, reintentar, aislar y conciliar resultado técnico | `ANIMA-AUTH-014` |
| preservar contexto capturado para evaluación posterior | `ANIMA-AUTH-014` |
| decidir si el trabajador sigue activo | `ANIMA-AUTH-015` |
| decidir si el turno/revisión siguen aplicables | `ANIMA-AUTH-015` |
| decidir si sede, área y rol siguen autorizados | `ANIMA-AUTH-015` |
| decidir si la ventana temporal sigue permitiendo efecto | `ANIMA-AUTH-015` |
| decidir si cambios concurrentes invalidaron la intención | `ANIMA-AUTH-015` |
| autorizar definitivamente la mutación servidora | `ANIMA-AUTH-015` + frontera servidora propietaria |

Regla:

```text
COLA BIEN FORMADA
!=
INTENCION TODAVIA AUTORIZADA
```

`ANIMA-AUTH-014` no congela una decisión de autorización para reutilizarla horas después.

---

#### 6. Unidad lógica de la cola

La unidad primaria es una **intención individual e inmutable de asistencia**.

Una intención representa exactamente una acción lógica:

```text
UN ACTOR
+
UNA ACCION
+
UN INSTANTE CAPTURADO
+
UN CONTEXTO LABORAL REFERENCIADO
+
UNA IDENTIDAD ESTABLE
=
UNA INTENCION OFFLINE
```

No son la unidad primaria:

- toda la cola;
- una sesión de aplicación;
- un lote de sincronización;
- un tick del worker;
- un día laboral;
- una sede;
- un dispositivo;
- el último check-in visto;
- una respuesta HTTP.

Enviar varias intenciones en un lote no fusiona sus identidades, orden, outcomes ni evidencia.

---

#### 7. Identidades que deben permanecer separadas

El contrato distingue como mínimo:

```text
queue_item_id
!=
client_event_id
!=
operation_id
!=
shift_id
!=
attendance_log_id
```

Semántica:

- `queue_item_id` identifica almacenamiento local;
- `client_event_id` identifica la intención de asistencia para idempotencia de productor;
- `operation_id` identifica el trabajo asíncrono transversal cuando aplique;
- `shift_id` identifica la ocurrencia laboral;
- `attendance_log_id` o identidad equivalente identifica el hecho confirmado por la fuente servidora.

Eliminar y recrear un elemento local no autoriza cambiar `client_event_id`.

Un retry no crea otro `client_event_id`.

Un tick del worker no crea otro `operation_id`.

---

#### 8. Fingerprint lógico e inmutabilidad

Cada intención reintentable debe tener contenido lógico fingerprintable.

El fingerprint debe cubrir los campos semánticamente relevantes de la intención, incluyendo cuando apliquen:

- tipo de acción;
- actor capturado o referencia resoluble;
- sede operacional;
- punto de geocerca;
- turno referenciado;
- revisión, snapshot o referencia versionada disponible;
- instante de ocurrencia;
- fuente;
- geolocalización y precisión capturadas;
- contexto de dispositivo necesario;
- versión contractual;
- cualquier dato que pueda cambiar el efecto empresarial.

No se exige aquí un algoritmo criptográfico físico ni un nombre de columna concreto; esos detalles pertenecen al contrato transversal de idempotencia y a la implementación futura.

Regla:

```text
MISMO client_event_id
+
MISMO fingerprint
→
MISMA INTENCION
```

```text
MISMO client_event_id
+
FINGERPRINT DISTINTO
→
CONFLICTO
```

---

#### 9. Sobre lógico mínimo de una intención offline

La cola debe poder conservar, de forma directa o resoluble, el siguiente sobre lógico:

| Información | Regla |
| --- | --- |
| identidad local | estable mientras exista el elemento |
| `client_event_id` | obligatorio antes del primer envío |
| tipo de evento | exacto y cerrado al contrato de asistencia aplicable |
| actor | capturado para trazabilidad; revalidado por servidor |
| sede operacional | identidad exacta |
| punto de marcación | cuando sea distinto de la sede operacional |
| turno | referencia estable cuando haya sido resuelta |
| revisión/snapshot/versionado | referencia suficiente para reconciliar el estado capturado |
| `occurred_at` | timestamp absoluto de captura del hecho intentado |
| geolocalización | snapshot de evidencia cuando la política la exige |
| precisión | junto con la geolocalización |
| contexto de dispositivo | mínimo necesario para diagnóstico y correlación |
| fingerprint | estable para idempotencia y conflicto |
| instante de creación local | separado de `occurred_at` |
| número de intentos efectivos | monotónico por intención |
| siguiente retry | cuando corresponda |
| último error | clasificado sin sustituir el outcome |
| estado local | proyección de cola, no estado empresarial |
| correlación transversal | cuando exista `operation_id`, receipt u otra referencia |

El sobre no almacena secretos ni concede autoridad por contener estos campos.

---

#### 10. Actor, sesión y principal

La identidad del trabajador debe quedar correlacionada con la intención capturada, pero el servidor no confía en un `employee_id` enviado por el cliente como prueba de autoridad.

Al sincronizar:

```text
ACTOR CAPTURADO
→ TRAZABILIDAD

PRINCIPAL AUTENTICADO ACTUAL
→ RESOLUCION SERVIDORA
```

Reglas:

1. una cola de un usuario no se procesa bajo la sesión de otro;
2. cambiar de cuenta no retargetea elementos existentes;
3. restaurar sesión no convierte automáticamente intenciones antiguas en válidas;
4. el servidor deriva o verifica el actor efectivo desde una identidad autenticada confiable;
5. tokens, refresh tokens y credenciales de sesión no se preservan como parte durable del payload de trabajo;
6. perder la sesión deja la intención pendiente o bloqueada; no autoriza envío anónimo.

---

#### 11. Turno y revisión capturados

La intención debe preservar el turno al que pretendía vincularse y una referencia suficiente de su estado versionado cuando el contrato propietario la exponga.

`shift_id` por sí solo conserva identidad de ocurrencia, pero no demuestra qué revisión era aplicable en el instante de captura.

Por tanto, la materialización futura debe permitir reconstruir:

```text
QUE TURNO
+
QUE VERSION / SNAPSHOT / REVISION ERA CONOCIBLE
+
EN QUE INSTANTE SE CAPTURO
```

La ausencia física actual de una referencia explícita de revisión no autoriza a inventarla desde “la última revisión” al sincronizar.

La resolución final de vigencia y compatibilidad pertenece a `ANIMA-AUTH-015`.

---

#### 12. Sede, área, rol y contexto capturado

La cola preserva hechos necesarios para explicar la intención, no autoridad reutilizable.

Puede conservar como evidencia:

- sede operacional;
- punto físico de check-in;
- área conocida;
- rol operativo conocido;
- contexto de turno;
- referencias de geocerca;
- versión o fingerprint del contexto cuando exista.

Pero:

```text
CONTEXTO CAPTURADO
!=
CONTEXTO AUTORIZADO AL SINCRONIZAR
```

Una sede desactivada, área modificada, rol retirado o contexto invalidado después de la captura puede impedir el efecto posterior sin borrar la intención histórica.

---

#### 13. Instante de ocurrencia y tiempo de sincronización

`occurred_at` conserva el instante original de captura.

Se distinguen al menos:

```text
occurred_at
created_at_local
attempted_at
received_at
applied_at
```

cuando los contratos físicos correspondientes los materialicen.

Reglas:

1. reconectar no reemplaza `occurred_at` por `now()`;
2. retry no cambia el instante original;
3. el servidor puede rechazar un timestamp imposible o no confiable sin reescribirlo silenciosamente;
4. la edad del elemento se calcula desde hechos explícitos, no desde el último retry;
5. la zona horaria de la programación no se toma libremente de la configuración del teléfono;
6. el cambio de fecha civil no altera la identidad del evento.

---

#### 14. Geolocalización como evidencia

Cuando la política exige geolocalización, la intención conserva un snapshot suficiente de la medición usada en la captura.

Ese snapshot puede incluir:

- latitud;
- longitud;
- precisión;
- timestamp de lectura;
- distancia calculada cuando corresponda;
- punto de geocerca identificado;
- metadatos de validación mínimos necesarios.

Reglas:

1. sincronizar no sustituye automáticamente la geolocalización original por una nueva;
2. una lectura nueva puede servir para una nueva decisión, pero no reescribe la evidencia de la intención previa;
3. la ubicación capturada no prueba por sí sola turno, rol, sede autorizada ni permiso;
4. una geolocalización inválida no se “repara” retirándola del payload;
5. datos de ubicación no se copian íntegramente a logs cuando una referencia o métrica agregada sea suficiente.

---

#### 15. Custodia del dispositivo

La ruta objetivo heredada para la cola de asistencia es:

```text
DEVICE
→
WORKER
```

El dispositivo:

- conserva temporalmente la intención;
- mantiene su identidad;
- conserva su estado de cola;
- despierta o entrega trabajo cuando existe oportunidad de sincronización;
- puede presentar estado pendiente al trabajador.

El dispositivo no:

- confirma el hecho empresarial;
- crea una sesión autoritativa;
- concede permisos;
- reemplaza a Supabase;
- decide que una revisión sigue vigente;
- convierte un retry local en resultado del servidor.

SecureStore es evidencia de la implementación actual, no una tecnología obligatoria del contrato.

---

#### 16. Elegibilidad para encolar

Una intención solo puede entrar a la cola offline cuando exista evidencia local suficiente de que la acción fue capturada mediante el flujo autorizado para operación degradada.

Como mínimo debe existir:

1. actor localmente resoluble;
2. acción identificada;
3. identidad estable creada;
4. instante de captura válido;
5. sede operacional resoluble;
6. política offline aplicable;
7. evidencia de geocerca válida o latch vigente cuando la política lo exija;
8. turno/contexto de referencia suficiente cuando el carril lo exija;
9. payload completo y serializable;
10. almacenamiento durable disponible;
11. ausencia de una causa local inequívoca que ya obligue a denegar.

La elegibilidad local permite **guardar una intención**. No permite declarar que el servidor la aplicará después.

---

#### 17. Condiciones que no deben degradarse a cola

No toda falla de un check-in online se convierte en offline.

No se encola por defecto cuando existe:

- denegación explícita de autorización;
- ausencia conocida de turno requerido;
- turno conocido fuera de ventana;
- sede o geocerca inválida;
- actor no resoluble;
- rol operativo faltante cuando ya es una causa concluyente;
- payload corrupto;
- identidad ausente que no puede preservarse;
- incompatibilidad contractual conocida;
- conflicto de secuencia conocido;
- respuesta servidora definitiva de rechazo;
- error de validación de contenido.

La cola se usa para indisponibilidad compatible con retry, no para ocultar una denegación conocida.

---

#### 18. Persistencia durable antes de confirmar “encolado”

La secuencia obligatoria es:

```text
CONSTRUIR INTENCION
→
SERIALIZAR
→
PERSISTIR
→
CONFIRMAR QUE LA PERSISTENCIA TERMINO SIN ERROR
→
ACTUALIZAR PROYECCION LOCAL
→
MOSTRAR ESTADO ENCOLADO
```

Queda prohibido:

```text
ACTUALIZAR UI COMO ENCOLADO
→
INTENTAR PERSISTIR
→
IGNORAR ERROR DE STORAGE
```

Si la escritura durable falla:

- el resultado no es `queued`;
- no se presenta éxito;
- no se aplica un optimistic state que parezca confirmado;
- la intención puede permanecer en memoria únicamente como intento no durable y debe tratarse como fallo recuperable o bloqueo visible;
- la evidencia del error se conserva sin exponer contenido sensible.

Persistir “best effort” no satisface este contrato.

---

#### 19. Experiencia local de estado pendiente

La interfaz puede proyectar que existe una intención pendiente únicamente después de la persistencia durable confirmada.

La experiencia debe distinguir:

```text
REGISTRO PENDIENTE DE SINCRONIZACION
```

de:

```text
ASISTENCIA CONFIRMADA
```

Una proyección optimista puede facilitar continuidad visual, pero no debe:

- crear `active_checkin_session` autoritativa;
- habilitar permisos `T+C` como si el servidor hubiera confirmado presencia;
- ocultar el indicador pendiente;
- borrar la posibilidad de conflicto posterior;
- presentar hora o duración como cerradas cuando todavía dependen del resultado servidor.

La redacción final de mensajes y estados visuales permanece en `ANIMA-UX-011`, `ANIMA-UX-012`, `ANIMA-AUTH-016` y `ANIMA-AUTH-017` según corresponda.

---

#### 20. Estados de cola y relación con el contrato transversal

Los estados locales actuales `pending`, `syncing`, `failed` y `conflict` son una proyección técnica y no un vocabulario empresarial.

La implementación futura debe poder mapear cada elemento a la semántica transversal cuando corresponda:

| Condición lógica | Semántica transversal esperable |
| --- | --- |
| intención durable lista | `queued` |
| espera hasta próximo retry | `retry_pending` |
| ejecución efectiva en curso | `processing` después de adquirir autoridad técnica aplicable |
| condición temporalmente bloqueada | `blocked` |
| resultado incierto | `result_unknown` |
| conciliación activa | `reconciling` |
| conflicto o unidad no procesable | `quarantined` |
| presupuesto automático agotado | `dead_letter` cuando el perfil lo exija |
| resultado confirmado | `succeeded` |
| fallo definitivo contractual | `failed` |
| cancelación efectiva | `cancelled` |
| intención vencida sin efecto ambiguo | `expired` |

Un estado local `syncing` no acredita claim distribuido, lease ni fencing.

Un estado local `failed` no decide por sí solo si el trabajo es terminal.

---

#### 21. Orden y dependencias entre eventos

La cola debe preservar orden lógico sin depender exclusivamente del orden del arreglo persistido.

Reglas:

1. un check-out no puede aplicarse antes del check-in del que depende;
2. un inicio de descanso no puede aplicarse sin una sesión compatible;
3. un fin de descanso no puede cerrar otro descanso;
4. eventos diferentes conservan identidades diferentes;
5. el orden por `created_at` local no reemplaza `occurred_at` ni dependencias explícitas;
6. reordenar por tiempo de recepción servidor no autoriza una secuencia imposible;
7. un evento posterior puede quedar bloqueado mientras un predecesor permanezca incierto;
8. una intención en cuarentena no se salta si ello cambia la semántica de los elementos dependientes;
9. eventos independientes pueden procesarse sin crear dependencia artificial.

La resolución empresarial de la secuencia se revalida server-side antes de producir efectos.

---

#### 22. Check-in como caso primario

Para check-in, la cola debe conservar como mínimo:

- identidad estable;
- actor capturado;
- turno referenciado;
- sede operacional;
- punto físico cuando aplique;
- instante de captura;
- geolocalización y precisión cuando aplique;
- contexto de rol/área disponible;
- fingerprint;
- estado de persistencia y retry.

El check-in offline encolado no habilita por sí mismo:

- una sesión confirmada;
- inicio autoritativo de jornada;
- permisos operativos dependientes de check-in;
- consumo por otras aplicaciones como presencia confirmada.

Solo un resultado servidor autoritativo puede materializar esos efectos.

---

#### 23. Reutilización para check-out

El contrato de cola puede reutilizarse para una intención offline de check-out, pero la semántica de cierre sigue perteneciendo a `ANIMA-AUTH-009`.

Una intención de salida debe preservar además la referencia de la sesión o check-in que pretende cerrar cuando el contrato la haga resoluble.

Queda prohibido:

- cerrar “la última sesión” por conveniencia si existe ambigüedad;
- cambiar de sede para hacer coincidir la salida;
- generar otra identidad al reiniciar;
- considerar el checkout aplicado solo porque fue guardado localmente.

La revalidación del cierre al sincronizar permanece bajo `ANIMA-AUTH-015` y los contratos propietarios de asistencia.

---

#### 24. Reutilización para descansos

La cola de descansos puede permanecer físicamente separada, como en la implementación observada, siempre que conserve el mismo gobierno transversal de identidad, retry, concurrencia y recuperación.

Cada inicio o fin de descanso requiere identidad propia.

La separación física entre cola de asistencia y cola de descansos no autoriza:

- contadores de retry reiniciados entre ambas;
- orden incoherente;
- start/end sin vínculo a sesión compatible;
- eliminación de conflicto por procesar primero la otra cola;
- usar notas libres como única identidad idempotente.

La semántica empresarial del descanso permanece en `ANIMA-AUTH-010`.

---

#### 25. Turnos overnight y cambio de fecha

Se consume íntegramente `ANIMA-AUTH-013`.

Una intención pendiente:

- conserva timestamp absoluto;
- conserva `shift_id` conocido;
- no cambia de turno al llegar medianoche;
- no cambia su `occurred_at` al reconectar;
- no se retargetea al “turno de hoy”;
- no se marca vencida únicamente porque cambió la fecha civil;
- no pierde una dependencia porque el check-in ocurrió el día anterior.

La vigencia real se decide por intervalo y contexto en la revalidación de `ANIMA-AUTH-015`.

---

#### 26. Múltiples dispositivos y concurrencia

Dos dispositivos pueden intentar operar para el mismo trabajador.

La cola debe asumir que:

- otro dispositivo puede haber aplicado una acción mientras uno estaba offline;
- dos intenciones distintas pueden competir sobre el mismo turno;
- el mismo evento puede llegar por replay;
- un resultado puede existir aunque el dispositivo originador no lo conozca.

Por tanto:

1. la exclusión local no es suficiente;
2. `syncing` no es lease distribuido;
3. la identidad de evento se verifica server-side;
4. el estado actual del recurso se revalida antes de mutar;
5. una carrera no se resuelve “último write gana”;
6. un segundo dispositivo no hereda la cola del primero por coincidencia de usuario;
7. un conflicto se conserva para conciliación o decisión controlada.

---

#### 27. Idempotencia y replay

La frontera server-side debe soportar replay seguro.

Regla:

```text
MISMO ACTOR
+
MISMO client_event_id
+
MISMO fingerprint
→
NO MAS DE UN EFECTO
→
RESULTADO ORIGINAL RECUPERABLE
```

La respuesta de replay debe ser compatible con el resultado ya confirmado, no una segunda mutación.

La deduplicación no se basa únicamente en:

- proximidad temporal;
- mismo sitio;
- mismo tipo de acción;
- contenido textual de notas;
- último log observado;
- un flag local de `syncing`.

La identidad se crea antes del primer intento y se conserva hasta terminalidad o recuperación controlada.

---

#### 28. Misma identidad con contenido distinto

Una colisión de identidad con payload lógico diferente es un conflicto contractual.

```text
client_event_id = X
fingerprint = A
```

seguido de:

```text
client_event_id = X
fingerprint = B
```

no puede responder simplemente `duplicate`.

Debe producir una condición equivalente a conflicto y conservar evidencia suficiente para investigar:

- identidad reutilizada;
- fingerprint esperado;
- fingerprint recibido;
- actor;
- correlación;
- recurso/turno afectado;
- instante.

No se exige exponer el payload sensible completo en logs ni mensajes al trabajador.

---

#### 29. Frontera servidora canónica

La sincronización debe utilizar una frontera server-side versionada y conocida por el consumidor.

La implementación actual expone una RPC `sync_attendance_events`, observada como superficie compatible con este propósito, pero su existencia no basta para declarar cumplimiento completo.

La frontera objetivo debe:

1. autenticar al principal;
2. resolver actor efectivo;
3. validar contrato y versión;
4. aceptar identidad estable;
5. verificar fingerprint/idempotencia;
6. aplicar o recuperar un resultado único;
7. distinguir conflicto de duplicado;
8. conservar `occurred_at`;
9. preservar referencias de turno/contexto;
10. producir outcome recuperable;
11. registrar incertidumbre cuando no pueda probarse resultado;
12. permitir la revalidación completa exigida por `ANIMA-AUTH-015`.

El nombre físico final de la RPC puede cambiar bajo la transición correspondiente; esta tarea fija la semántica, no un endpoint eterno.

---

#### 30. Prohibición de fallback de escritura directa

La ausencia o incompatibilidad de la frontera canónica de sincronización debe fallar cerrada.

Queda prohibido:

```text
RPC CANONICA NO DISPONIBLE
→
INSERT DIRECTO AL MISMO RECURSO
→
REPORTAR APPLIED
```

salvo que una ruta de compatibilidad haya sido previamente aprobada y demuestre paridad completa de:

- identidad;
- fingerprint;
- autorización;
- turno/revisión;
- geocerca;
- idempotencia;
- concurrencia;
- auditoría;
- resultado recuperable;
- error y rollback.

Una excepción “function does not exist” no es autorización para omitir el contrato.

---

#### 31. Perfil de retry offline

La cola de asistencia consume el perfil transversal `RR3_DEVICE_OR_OFFLINE` ya aprobado.

La política objetivo conserva:

```text
max_attempts = 6
base_waits = 10 s / 1 min / 5 min / 30 min / 2 h
jitter = acotado
```

Reglas:

1. esperar conectividad o disponibilidad del SO no consume intento;
2. un intento se cuenta cuando comienza una ejecución real contra la frontera aplicable;
3. el tick del worker cada 15 s no es un intento;
4. reiniciar la aplicación no reinicia `attempts`;
5. reabrir la cola no reinicia presupuesto;
6. `Retry-After` se respeta cuando exista y sea compatible con deadline;
7. un error no reintentable no se repite por temporizador;
8. resultado ambiguo no consume un retry adicional hasta reconciliar.

---

#### 32. Deadline, edad y expiración

La intención offline es temporalmente sensible.

La cola debe conservar un deadline o criterio de vigencia resoluble bajo el contrato propietario.

La reconexión no amplía ese límite.

Reglas:

1. la edad se calcula desde la intención original, no desde el último retry;
2. una operación vencida sin efecto ambiguo puede llegar a `expired`;
3. una operación con posible efecto no se marca `expired` para evitar conciliación;
4. una ventana de turno terminada no borra la intención histórica;
5. la intención puede conservarse aislada para evidencia aunque ya no sea ejecutable;
6. la revalidación exacta de vigencia al sincronizar pertenece a `ANIMA-AUTH-015`.

---

#### 33. Backoff, jitter y recuperación de conectividad

El worker no debe producir una tormenta de reintentos al volver la red.

Se exige:

- backoff según perfil aprobado;
- jitter acotado;
- presupuesto persistente;
- `next_retry_at` durable o semántica equivalente;
- respeto del orden y dependencias;
- limitación de concurrencia por recurso cuando corresponda;
- no disparar todos los elementos históricos si ya vencieron o requieren revalidación;
- no usar el intervalo de polling como único backoff.

La conectividad recuperada significa “existe oportunidad de evaluar”, no “todos los eventos deben enviarse inmediatamente”.

---

#### 34. Resultado desconocido y conciliación

Si el cliente envía una intención y pierde respuesta después de que el servidor pudo haber producido efecto:

```text
TIMEOUT / RESPUESTA PERDIDA
+
EFECTO POSIBLE
→
RESULT_UNKNOWN
→
RECONCILIACION
```

No:

```text
TIMEOUT
→
RETRY CIEGO
```

La conciliación debe consultar una fuente autoritativa por identidad/correlación y determinar, como mínimo:

- aplicado;
- no aplicado y seguro de reintentar;
- conflicto;
- resultado todavía incierto;
- efecto parcialmente materializado cuando el contrato lo admita.

Una lectura vacía sin garantía fuerte no prueba ausencia de efecto.

---

#### 35. Cuarentena, dead-letter y fallos no automáticos

Las intenciones que no admiten retry ordinario permanecen visibles para recuperación controlada.

`quarantined` aplica, entre otros, a:

- conflicto de identidad/fingerprint;
- orden imposible;
- contrato incompatible;
- referencia de turno/revisión irresoluble;
- corrupción recuperable que requiere intervención;
- causa que necesita decisión propietaria.

`dead_letter` aplica cuando el tratamiento automático agota su presupuesto bajo la política correspondiente sin un resultado ambiguo que exija primero conciliación.

Ninguno de estos estados autoriza borrar la intención ni crear otra con identidad nueva para “volver a intentar”.

---

#### 36. Cancelación antes del efecto

Una intención todavía no aplicada puede admitir cancelación bajo la política transversal de `COOPERATIVE_SAFE_POINT`.

La cancelación válida debe:

- quedar asociada a la misma intención;
- sobrevivir reinicio y reconexión;
- impedir que el worker vuelva a enviarla;
- distinguir solicitud de cancelación de cancelación efectiva;
- no borrar un efecto ya confirmado;
- entrar a conciliación si llegó demasiado tarde y el resultado es incierto.

Eliminar físicamente un elemento del storage no equivale a una cancelación durable.

Esta tarea no obliga a exponer una acción de cancelación al trabajador en la interfaz actual.

---

#### 37. Cierre, suspensión y reinicio de la aplicación

Una intención confirmada como durable debe sobrevivir:

- cierre normal de la aplicación;
- kill del proceso;
- suspensión por el sistema operativo;
- reinicio de la aplicación;
- pérdida temporal de conectividad;
- despertar posterior del worker.

Al restaurar:

1. se lee el estado durable;
2. se valida su esquema/versionado;
3. se preserva identidad original;
4. se preservan attempts y `next_retry_at`;
5. no se convierte `syncing` abandonado en resultado exitoso;
6. un intento que pudo haber cruzado la frontera entra a reconciliación antes de retry;
7. se reconstruye la proyección local sin fabricar asistencia confirmada.

El contrato no exige supervivencia frente a desinstalación o pérdida física del dispositivo cuando no exista una réplica servidora ya aceptada.

---

#### 38. Logout, expiración de sesión y cambio de actor

La cola permanece segregada por actor.

Reglas:

1. logout no procesa pendientes sin principal;
2. otro usuario no recibe ni procesa la cola ajena;
3. una cola retenida localmente después de logout se considera bloqueada hasta una sesión compatible;
4. reautenticarse como el mismo actor no omite la revalidación;
5. reautenticarse como otro actor no retargetea la intención;
6. si la relación laboral terminó, la evidencia puede conservarse pero el efecto no se fuerza;
7. la limpieza local de datos por retiro de cuenta debe respetar obligaciones de auditoría y recuperación aplicables.

---

#### 39. Corrupción, migración de esquema y compatibilidad local

Una cola persistida puede sobrevivir actualizaciones de aplicación.

La implementación debe distinguir:

- elemento válido en versión actual;
- elemento migrable de forma determinista;
- elemento incompleto pero identificable;
- elemento corrupto;
- elemento con identidad ausente;
- elemento con contrato incompatible.

Queda prohibido reparar silenciosamente una identidad ausente generando una nueva durante cada restore.

Una migración local solo puede completar campos cuando exista una transformación determinista que no cambie intención ni fingerprint semántico.

Si no puede probarse esa transformación, el elemento se aísla y conserva evidencia suficiente para recuperación.

---

#### 40. Privacidad y seguridad del almacenamiento local

La cola de asistencia contiene información laboral y potencialmente ubicación precisa.

Por tanto:

1. el almacenamiento local debe usar protección apropiada del dispositivo;
2. no se guardan `service_role`, secret keys, contraseñas ni tokens privados dentro de la intención;
3. la cola no se exporta a logs completos;
4. diagnostics deben minimizar coordenadas y datos personales;
5. una captura de error no debe incluir el payload sensible completo cuando basta una referencia;
6. las claves de almacenamiento quedan segregadas por actor;
7. borrar una credencial no debe borrar silenciosamente evidencia pendiente sin proceso definido;
8. la cola no se usa como caché general de turnos, permisos o perfiles.

---

#### 41. Observabilidad mínima

La implementación futura debe permitir observar sin exponer contenido sensible:

- cantidad de intenciones pendientes;
- edad del elemento más antiguo;
- número de intentos por elemento;
- tiempo hasta próximo retry;
- cantidad de duplicados recuperados;
- conflictos;
- resultados desconocidos;
- cuarentenas;
- dead-letter;
- fallos de persistencia local;
- restauraciones después de reinicio;
- latencia desde captura hasta resultado autoritativo;
- cancelaciones;
- elementos bloqueados por falta de sesión;
- elementos bloqueados para revalidación.

Estas métricas no son fuente de autorización ni sustituyen la historia de eventos.

---

#### 42. Reconciliación con la implementación cliente observada

La rama principal observada de `vento-anima` ya contiene una implementación parcial de cola offline.

| Evidencia actual | Evaluación contractual |
| --- | --- |
| `SecureStore` por usuario | compatible como custodia local; no fuente del hecho |
| tipo `PendingAttendanceEvent` con identidad, evento, sitio, tiempo, geo, payload, attempts, estado y retry | base útil y parcialmente alineada |
| `clientEventId` incorporado al payload antes de envíos ordinarios | converge con identidad estable |
| estados `pending`, `syncing`, `failed`, `conflict` | proyección local útil, no ciclo transversal completo |
| worker periódico de 15 s | ejecutor técnico; cada tick no es nueva intención |
| persistencia helper captura errores y retorna sin propagar fallo | **BRECHA:** el llamador no puede probar que “encolado” fue durable |
| normalización puede generar un nuevo ID cuando un elemento restaurado no lo trae | **BRECHA:** una identidad ausente no debe regenerarse silenciosamente |
| política de retry local difiere de `RR3_DEVICE_OR_OFFLINE` | **BRECHA:** presupuesto, waits, jitter y deadline requieren reconciliación física |
| cola no materializa cancelación durable | **BRECHA:** la política transversal no está acreditada |
| `failed` / `conflict` se conservan pero no materializan recovery auditado | **BRECHA:** force retry no equivale a recuperación canónica |
| decisión previa a sync compara principalmente última acción y sede | **BRECHA RESERVADA:** reautorización completa pertenece a `ANIMA-AUTH-015` |

La presencia de código no se presenta como certificación de cumplimiento.

---

#### 43. Reconciliación con la frontera servidora observada

En `vento-os-dev` se observó la RPC `public.sync_attendance_events(jsonb)` y la infraestructura de asistencia relacionada.

La lectura remota del corte de esta tarea evidencia:

```text
attendance_logs_total = 5858
attendance_logs_with_client_event_id = 2
attendance_logs_with_shift_id = 3229
attendance_logs_with_client_event_id_and_shift_id = 1
attendance_sync_conflicts_total = 0
```

Estos conteos describen el estado observado; no son objetivos contractuales permanentes.

La frontera actual demuestra aspectos compatibles:

- deriva actor desde `auth.uid()`;
- exige empleado activo;
- valida tipo de evento y fuente;
- valida sede mediante control servidor;
- acepta `eventId`;
- preserva `occurredAt`;
- puede transportar `shiftId`;
- registra `client_event_id`;
- existe índice único parcial por `employee_id + client_event_id`;
- devuelve `applied`, `duplicate`, `conflict` o `error` según sus ramas actuales.

También existen brechas verificables:

1. `unique_violation` se traduce directamente a `duplicate` sin demostrar igualdad de fingerprint;
2. por ello, el contrato observado no acredita todavía `same id + different content = conflict`;
3. la función no acredita por sí sola una referencia explícita de revisión publicada en la intención;
4. la autorización completa contra turno, revisión, área, rol, ventana y cambios concurrentes no queda certificada por esta RPC y pertenece a `ANIMA-AUTH-015`;
5. el cliente observado contiene fallback a inserción alternativa cuando la RPC se reporta ausente, incompatible con fail-closed sin paridad demostrada;
6. la escasa presencia histórica de `client_event_id` demuestra convivencia legacy y exige transición explícita en lugar de asumir que toda asistencia previa ya posee identidad idempotente.

Cero conflictos observados no demuestra ausencia de carreras ni certifica idempotencia de contenido.

---

#### 44. Handoff exacto a `ANIMA-AUTH-015`

`ANIMA-AUTH-014` entrega a la siguiente tarea una intención durable con semántica congelada.

El handoff debe permitir resolver, como mínimo:

```text
client_event_id ESTABLE
fingerprint LOGICO
actor CAPTURADO
accion
occurred_at ORIGINAL
turno REFERENCIADO
version / snapshot / revision RESOLUBLE CUANDO APLIQUE
sede / area / rol / geocerca CAPTURADOS COMO EVIDENCIA
estado DE COLA
attempts
next_retry_at
resultado PREVIO SI EXISTE
correlacion TECNICA
```

`ANIMA-AUTH-015` debe consumir ese sobre sin modificar retrospectivamente la intención original y decidir si, en el instante de sincronización, siguen siendo válidos:

- principal y vínculo laboral;
- publicación y revisión;
- ventana temporal;
- sede;
- área;
- rol;
- compatibilidades territoriales;
- sesión de asistencia previa;
- orden de eventos;
- invalidaciones concurrentes;
- permisos y prerrequisitos aplicables.

014 garantiza que hay **qué revalidar**. 015 decide **si puede ejecutarse ahora**.

---

#### 45. Requisitos de prueba derivados

NO GENERA REQUISITOS DE PRUEBA.

**Requisitos creados:** 0
**Requisitos modificados:** 0
**Requisitos diferidos:** 0
**Requisitos obsoletos:** 0

La cobertura vigente ya protege persistencia durable, identidad estable, idempotencia, replay, retry, orden, concurrencia, aislamiento, recuperación, sincronización offline y vínculo con asistencia. Esta tarea especializa esas obligaciones para ANIMA sin alterar el registro canónico.

---

#### 46. Cobertura de prueba vigente reutilizada

Se reutilizan sin modificación:

- `TREQ-ANIMA-003`: persistencia durable antes de mostrar encolado, `client_event_id` estable, conservación de actor/sede/turno/tiempo/geolocalización/contexto, supervivencia a reinicio, efecto único y prohibición de fallback sin paridad;
- `TREQ-ANIMA-004`: identidad persistente y transición atómica/idempotente para descansos, concurrencia y replay;
- `TREQ-INTEGRATION-003`: clave estable, fingerprint, estado durable, resultado recuperable, retry con backoff/jitter, timeout incierto, claim/concurrencia y recuperación manual;
- `TREQ-INTEGRATION-007`: programación y asistencia comparten contrato; eventos offline y retries no duplican jornadas, contexto ni tiempo trabajado;
- `TREQ-SUPABASE-001`: cualquier wrapper o fallback legacy requiere propietario, consumidores, paridad, rollback y puerta explícita antes de conservarse o retirarse;
- `TREQ-AUTH-217`: cambios de publicación, actor, tiempo, territorio o rol invalidan contexto y obligan solicitud/revalidación nueva cuando corresponda;
- `TREQ-AUTH-220`: temporalidad basada en timestamps absolutos y resolución server-side;
- `TREQ-AUTH-224`: turnos nocturnos y ambigüedad temporal se resuelven mediante intervalos absolutos y fail-closed.

La enumeración anterior es trazabilidad de cobertura existente; no representa actualización de requisitos.

---

#### 47. Evidencia de validación

| Clase | Estado | Evidencia |
| --- | --- | --- |
| BUILD | NOT_EXECUTED | el artefacto todavía no ha sido incorporado al archivo propietario ni compilado por el checkout local del usuario |
| LOCAL | NOT_EXECUTED | format, quality, delivery, plan, TREQ y diff deben ejecutarse después del reemplazo en la rama documental real |
| REMOTA | PASS | continuidad, owner, topología, políticas, contratos E4/INT-WORK, 04A vigente, código `vento-anima@8bcfaaa3b6ab79d5839c03719edec7b50fd97d2d` y estado read-only de `vento-os-dev` fueron inspeccionados |
| OPERATIVA | NOT_EXECUTED | no se ejecutó una marcación offline real en dispositivo, reinicio, reconexión ni escenario de respuesta perdida |
| FÍSICA | NOT_APPLICABLE | la tarea es documental y no autoriza mutaciones de código, Supabase, datos, configuración ni despliegue |

La evidencia remota demuestra el estado actual y las brechas documentadas. No sustituye la validación física futura de la unidad de implementación.

---

#### 48. Criterios de aceptación

La tarea se considera documentalmente completa cuando se demuestra que:

1. existe exactamente una intención lógica por evento offline;
2. `client_event_id` se crea antes del primer envío;
3. restore y retry preservan la misma identidad;
4. existe fingerprint lógico del contenido relevante;
5. misma identidad y mismo fingerprint recuperan la misma intención/resultado;
6. misma identidad y fingerprint distinto producen conflicto;
7. `queue_item_id`, `client_event_id`, `operation_id`, `shift_id` y hecho confirmado permanecen separados;
8. la cola conserva actor, sede, turno, tiempo, geolocalización y contexto suficientes;
9. la referencia de revisión/versionado queda resoluble cuando el contrato la requiere;
10. el cliente no puede presentar “encolado” antes de confirmar persistencia durable;
11. fallo de storage no se convierte en éxito optimista;
12. cerrar o reiniciar la app no elimina una intención durable;
13. restaurar un elemento incompleto no genera identidad nueva silenciosamente;
14. la cola permanece segregada por actor;
15. logout no procesa pendientes sin sesión compatible;
16. cambiar de usuario no retargetea una intención;
17. SecureStore o tecnología equivalente permanece custodia, no fuente del hecho;
18. una intención encolada no crea sesión autoritativa;
19. una intención encolada no habilita permisos `T+C`;
20. el timestamp original no se sustituye por la hora de reconexión;
21. el snapshot geográfico original no se reescribe durante sync;
22. medianoche no retargetea la intención;
23. check-out y descanso preservan dependencia y orden cuando reutilizan la arquitectura;
24. múltiples dispositivos se tratan como concurrencia distribuida;
25. `syncing` local no se presenta como lease distribuido;
26. la frontera server-side conserva identidad y outcome recuperable;
27. la ausencia de la frontera canónica falla cerrada sin fallback silencioso;
28. un timeout con posible efecto usa resultado desconocido y conciliación antes de retry;
29. el retry consume `RR3_DEVICE_OR_OFFLINE`;
30. esperar conectividad no consume intento;
31. el tick de 15 s no crea un intento nuevo;
32. el presupuesto no se reinicia al reiniciar la aplicación;
33. retry usa backoff, jitter y deadline;
34. conflictos no se reintentan a ciegas;
35. aislamiento conserva identidad e historia;
36. dead-letter no se confunde con fallo empresarial;
37. cancelación durable impide futuros envíos antes del efecto;
38. borrar storage no se usa como sustituto de cancelación;
39. datos sensibles y secretos no se incrustan en la intención;
40. diagnostics minimizan payload y ubicación;
41. la implementación actual queda registrada como parcial, no certificada;
42. la falta de fingerprint en deduplicación servidora queda identificada como brecha;
43. la escasa cobertura histórica de `client_event_id` queda tratada como coexistencia legacy;
44. la revalidación completa permanece reservada a `ANIMA-AUTH-015`;
45. no se crean ni modifican requisitos de prueba;
46. no se crea un framework de cola paralelo a `QUEUE-ARC-*`;
47. topología documental/física permanece `PER_IMPLEMENTATION_UNIT`;
48. el gate físico permanece `POST_E5_PACKAGE`;
49. no se ejecutan cambios físicos;
50. la continuidad reserva exclusivamente `ANIMA-AUTH-015`.

---

#### 49. Límites

Esta tarea no define ni ejecuta:

- la revalidación de permisos al sincronizar, propiedad de `ANIMA-AUTH-015`;
- el diseño final de mensajes de conflicto o recuperación, propiedad de `ANIMA-AUTH-016` y `ANIMA-AUTH-017`;
- la auditoría final de creación y cierre de contexto, propiedad de `ANIMA-AUTH-018`;
- concesión de permisos, prohibida por `ANIMA-AUTH-019`;
- una fuente de verdad local paralela, prohibida por `ANIMA-AUTH-020`;
- la semántica empresarial de checkout, propiedad de `ANIMA-AUTH-009`;
- la semántica empresarial de descansos, propiedad de `ANIMA-AUTH-010`;
- cambios temporales de área, propiedad de `ANIMA-AUTH-011`;
- reemplazos, propiedad de `ANIMA-AUTH-012`;
- semántica overnight, propiedad de `ANIMA-AUTH-013`;
- un nuevo catálogo transversal de estados de cola;
- un nuevo perfil de retry distinto de `QUEUE-ARC-*`;
- el algoritmo físico definitivo del fingerprint;
- nombres físicos de tablas, columnas, índices o constraints;
- creación o modificación de RPC;
- modificación de `sync_attendance_events`;
- modificación de `attendance_logs`;
- modificación de `attendance_sync_conflicts`;
- migraciones;
- RLS;
- grants;
- Edge Functions;
- cron;
- cambios en SecureStore;
- cambios en el worker móvil;
- cambios de UI;
- despliegues;
- cambios productivos;
- un reason code público nuevo;
- un permiso nuevo;
- un nuevo shape público de `AccessContext`.

Toda brecha física identificada queda para la unidad de implementación correspondiente y sus propietarios existentes. La tarea documental no la corrige físicamente.

---

#### 50. Continuidad

**ÚLTIMA TAREA APROBADA**
`ANIMA-AUTH-013 — Manejar turnos cruzados de medianoche`

**TAREA ACTUAL APROBADA**
`ANIMA-AUTH-014 — Manejar cola offline de check-in`

**SIGUIENTE TAREA RESERVADA**
`ANIMA-AUTH-015 — Revalidar permisos al sincronizar una cola offline`

### [ ] ANIMA-AUTH-015 — Revalidar permisos al sincronizar una cola offline
### [ ] ANIMA-AUTH-016 — Mostrar diagnóstico de contexto al trabajador
### [ ] ANIMA-AUTH-017 — Diferenciar falta de turno y falta de permiso
### [ ] ANIMA-AUTH-018 — Auditar creación y cierre del contexto
### [ ] ANIMA-AUTH-019 — Evitar que ANIMA otorgue permisos directamente
### [ ] ANIMA-AUTH-020 — Mantener Supabase como fuente de verdad

ANIMA ya fue ajustado parcialmente para bloquear check-in cuando no hay turno publicado o cuando falta un rol operativo válido.
