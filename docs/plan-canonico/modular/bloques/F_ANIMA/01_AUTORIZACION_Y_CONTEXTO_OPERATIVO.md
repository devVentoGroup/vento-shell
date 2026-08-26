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


### [ ] ANIMA-AUTH-002 — Confirmar sede del turno
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
