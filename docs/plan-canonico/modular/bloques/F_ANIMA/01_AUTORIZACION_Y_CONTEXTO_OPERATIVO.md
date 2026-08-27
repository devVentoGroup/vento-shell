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
