### MINI-BLOQUE — CONTEXTO LABORAL

<!-- PLAN-SECTION-META:START -->
Esta sección organiza **contexto laboral** dentro de **X INTEGRACIONES**. Agrupa tareas que producen un resultado funcional común y deben mantenerse juntas para conservar contexto, trazabilidad y orden de ejecución.

**Cobertura canónica:** `INT-WORK-001` a `INT-WORK-005` — 5 tareas.

**Resultado esperado:** al cerrar este mini-bloque, su resultado debe quedar definido, verificable y coherente con las secciones anterior y siguiente antes de avanzar.

**Contenido funcional:**

- `INT-WORK-001`: Definir contrato para que VISO publique el turno
- `INT-WORK-002`: Definir contrato para que ANIMA presente el turno
- `INT-WORK-003`: Definir contrato para que ANIMA registre la asistencia
- `INT-WORK-004`: Definir confirmación autoritativa del contexto efectivo en Supabase
- `INT-WORK-005`: Definir consumo del contexto por SHELL y las aplicaciones
<!-- PLAN-SECTION-META:END -->

### ✅ INT-WORK-001 — Definir contrato para que VISO publique el turno

**Estado:** APROBADA
**Tarea anterior:** `INT-EXT-020 — Prohibir credenciales compartidas entre integraciones` — APROBADA
**Tarea siguiente:** `INT-WORK-002 — Definir contrato para que ANIMA presente el turno` — RESERVADA
**Tipo de tarea:** documental; definición del contrato autoritativo mediante el cual VISO publica un turno y una revisión consumible por ANIMA, SHELL y las consumidoras aprobadas, sin implementar esquema físico, migraciones, RPC, eventos nuevos, colas, notificaciones desplegadas ni cambios de código
**Bloque:** X — Integraciones
**Mini-bloque:** Contexto laboral
**Fase:** exclusivamente documental
**Repositorio propietario:** `vento-shell`
**Implementación física autorizada:** ninguna

---

#### 1. Objetivo

Definir de forma inequívoca qué significa que VISO publique un turno dentro de Vento OS y qué información autoritativa queda disponible para las aplicaciones consumidoras después de esa publicación.

La decisión debe preservar simultáneamente:

```text
VISO
→ PROPIETARIA DE VPROC-0007
→ CREA Y GOBIERNA LA PROGRAMACIÓN
→ PUBLICA UNA REVISIÓN AUTORITATIVA
→ CONSERVA HISTORIA
→ EXPONE UNA PROYECCIÓN CONSUMIBLE
```

sin convertir a ANIMA, SHELL, Supabase o una interfaz de calendario en fuentes competidoras de programación.

La regla cardinal es:

```text
PUBLICAR UN TURNO
≠
MARCAR UNA FILA COMO VISIBLE
```

Publicar significa completar una transición autoritativa de programación, fijar una revisión coherente, conservar la versión sustituida cuando corresponda, registrar la autoridad y el momento de publicación y habilitar el consumo posterior bajo contratos versionados.

También se conserva:

```text
TURNO PUBLICADO
≠
TURNO VIGENTE EN ESTE INSTANTE
```

```text
PUBLICACIÓN
≠
NOTIFICACIÓN
```

```text
PUBLICACIÓN
≠
CHECK-IN
```

```text
PUBLICACIÓN
≠
AUTORIZACIÓN OPERATIVA FINAL
```

---

#### 2. Resultado sustantivo

`INT-WORK-001` deja definido un contrato documental único de publicación de turnos con cinco resultados materiales:

1. VISO queda confirmado como única aplicación propietaria de la programación de `VPROC-0007`.
2. La unidad autoritativa consumible queda fijada como **turno + revisión publicada**, no como una fila mutable ni como una semana completa.
3. Se define la información mínima que una publicación debe conservar y proyectar.
4. Se definen las puertas que deben cumplirse antes de aceptar la publicación de una revisión.
5. Se fijan las fronteras de consumo para `INT-WORK-002` a `INT-WORK-005`, sin adelantar su contenido.

Balance documental:

| Control                                |                                 Resultado |
| -------------------------------------- | ----------------------------------------: |
| Proceso propietario                    |                      **1 — `VPROC-0007`** |
| Aplicación propietaria                 |                              **1 — VISO** |
| Consumidoras directas heredadas        |                     **2 — ANIMA y SHELL** |
| Consumidoras condicionales heredadas   | **5 — NEXO, FOGO, ORIGO, PULSO y NUMERA** |
| Unidad autoritativa de publicación     |            **turno + revisión publicada** |
| Nuevas definiciones normales de evento |                                     **0** |
| Cambios físicos                        |                                     **0** |
| Cambios en requisitos de prueba        |                                     **0** |

---

#### 3. Decisiones canónicas preservadas

Esta tarea consume y conserva sin redefinir las decisiones ya aprobadas sobre programación laboral, integración, autorización y contexto.

Se preservan especialmente:

- `CAP-SCOPE-002`, con VISO como fuente administrativa de turnos y ANIMA como consumidora y superficie personal;
- `CAP-02.06`, con el flujo `BORRADOR → VALIDACIÓN → PUBLICACIÓN → NOTIFICACIÓN → CONSUMO EN ANIMA → EJECUCIÓN / ASISTENCIA`;
- `VPROC-0007 — Administrar asignaciones laborales y programación publicada con historial y revisión controlada`;
- los estados y transiciones de `VPROC-0007`;
- `PROC-CAT-017` y el catálogo transversal adoptado por `INT-APP-001`;
- la propiedad de VISO sobre `VPROC-0007` registrada por `INT-APP-002`;
- las consumidoras y modalidad de integración registradas por `INT-APP-003`;
- idempotencia, retry, compensación, auditoría, parcialidad y prohibición de escrituras cruzadas definidas por `INT-APP-004` a `INT-APP-010`;
- `AUTH-MOD-007`, `AUTH-MOD-008` y `AUTH-MOD-009` para sede, área y turno publicado;
- `AUTH-CTX-010` para `active_shift` y revisión publicada autoritativa;
- la separación entre turno, asistencia y novedad laboral;
- la obligación de no sobrescribir versiones publicadas;
- la obligación de vincular posteriormente la asistencia a la revisión efectiva.

Nada de esta tarea convierte una proyección de integración en fuente de verdad ni cambia la propiedad funcional del proceso.

---

#### 4. Propiedad y autoridad

La propiedad queda fijada así:

```text
VPROC-0007
→ APLICACIÓN PROPIETARIA = VISO
```

Por tanto:

1. VISO crea y gobierna borradores de programación.
2. VISO ejecuta la revisión administrativa necesaria para llegar a publicación.
3. VISO es la única aplicación que puede declarar autoritativamente una revisión como publicada.
4. ANIMA consume la programación publicada; no crea una segunda programación.
5. SHELL consume el contexto derivado; no publica turnos.
6. NEXO, FOGO, ORIGO, PULSO y NUMERA solo podrán consumir la información que sus contratos y finalidades autoricen.
7. Supabase será infraestructura y fuente física cuando corresponda, pero no una aplicación propietaria distinta.
8. Una escritura física accesible desde varias aplicaciones no transfiere propiedad funcional.
9. Una vista administrativa en ANIMA no autoriza reglas locales de publicación ni mutaciones competidoras.
10. Un cliente no puede convertir una propuesta en publicación mediante un campo enviado por interfaz.

Regla:

```text
QUIEN MUESTRA EL TURNO
≠
QUIEN LO PUBLICA
```

---

#### 5. Vocabulario contractual

##### 5.1. Turno borrador

Propuesta editable que todavía no constituye programación publicada para el trabajador ni contexto operativo.

Puede contener información de planificación, pero:

- no habilita `active_shift`;
- no habilita check-in;
- no habilita permisos operativos;
- no desplaza una revisión publicada;
- no debe ser consumido por ANIMA como horario oficial del trabajador.

##### 5.2. Revisión en validación o revisión

Versión candidata sometida a controles de integridad, cobertura, territorio, rol, tiempo, conflictos y autoridad.

Todavía no es una revisión publicada.

##### 5.3. Revisión pendiente de publicación

Revisión que alcanzó `PENDING_PUBLICATION` y espera la decisión autoritativa de publicación.

##### 5.4. Revisión publicada

Snapshot coherente e inmutable por identidad lógica que alcanzó autoritativamente el estado `PUBLISHED` y puede ser referenciado por consumidoras.

##### 5.5. Turno publicado

Ocurrencia laboral identificada por `shift_id` cuya revisión autoritativa aplicable se encuentra publicada.

##### 5.6. Turno vigente

Turno publicado cuya revisión autoritativa es temporalmente efectiva en el instante de resolución y satisface las condiciones de contexto correspondientes.

##### 5.7. Publicación

Decisión autoritativa que confirma una revisión exacta y produce un resultado durable antes de cualquier comunicación al trabajador.

##### 5.8. Notificación

Comunicación posterior o asociada que informa al trabajador u otro destinatario. No es la publicación misma y no sustituye el registro autoritativo.

---

#### 6. Unidad canónica de publicación

La unidad mínima de publicación es:

```text
`shift_id`
+
revisión publicada
```

No es:

- la semana completa;
- el mes completo;
- una pantalla;
- una selección visual;
- una fila sin revisión resoluble;
- el resultado de una notificación;
- una respuesta HTTP;
- un `published_at` aislado de la identidad de turno y revisión;
- una agrupación usada únicamente para comodidad administrativa.

Semana y mes son proyecciones u orquestaciones sobre múltiples unidades de turno.

Por tanto, una acción masiva puede solicitar la publicación de varias unidades, pero cada turno y revisión conserva:

- identidad propia;
- validación propia;
- outcome propio;
- auditoría propia;
- idempotencia propia;
- relación propia con el trabajador;
- relación propia con la revisión sustituida cuando corresponda.

La atomicidad transaccional de una operación masiva semanal o mensual no se decide aquí y permanece bajo `VISO-SCH-005` y `VISO-SCH-006`.

---

#### 7. Identidad estable

`shift_id` identifica la ocurrencia lógica de turno.

La revisión publicada identifica la versión autoritativa de esa ocurrencia.

Invariantes:

1. `shift_id` no cambia porque una vista muestre el turno en semana o mes.
2. una nueva revisión del mismo turno no crea por sí sola un nuevo turno lógico;
3. una sustitución real por otra ocurrencia deberá conservar la relación explícita entre ambas;
4. una revisión no puede reutilizar la identidad de otra revisión con contenido materialmente diferente;
5. el mismo `shift_id` no puede tener dos revisiones simultáneamente autoritativas sin precedencia inequívoca;
6. la consumidora no puede escoger una revisión por timestamp aproximado o por “última fila recibida”;
7. la revisión efectiva debe ser resoluble por contrato.

---

#### 8. Contenido mínimo de una publicación

Toda revisión publicada deberá poder resolver, cuando aplique al tipo de turno, la siguiente información lógica:

| Información                           | Obligación                                                               |
| ------------------------------------- | ------------------------------------------------------------------------ |
| identidad del turno                   | estable y no ambigua                                                     |
| identidad de la revisión publicada    | estable y resoluble                                                      |
| trabajador                            | referencia exacta                                                        |
| vínculo laboral                       | vigente y coherente con el trabajador                                    |
| periodo de planificación              | referencia del ciclo al que pertenece                                    |
| sede                                  | sede exacta del turno                                                    |
| área                                  | área exacta cuando la función la requiera                                |
| rol operativo                         | código o referencia canónica                                             |
| inicio                                | instante inequívoco                                                      |
| fin                                   | instante inequívoco                                                      |
| zona horaria                          | explícita y válida                                                       |
| tipo o naturaleza del turno           | suficiente para distinguir labor, descanso u otra clasificación aprobada |
| descanso previsto o reglas aplicables | cuando corresponda                                                       |
| estado                                | coherente con la revisión                                                |
| autor de publicación                  | identidad resoluble de quien ejerció la autoridad                        |
| momento de publicación                | timestamp autoritativo                                                   |
| revisión sustituida                   | referencia cuando exista                                                 |
| motivo de cambio o cancelación        | obligatorio cuando la transición lo requiera                             |
| punto de check-in o checkout          | solo cuando el contrato operacional lo requiera                          |
| reemplazo relacionado                 | cuando exista sustitución explícita                                      |
| referencias de auditoría              | correlacionables sin duplicar contenido sensible                         |

La tabla anterior define información lógica, no columnas físicas.

No se decide en esta tarea si cada elemento reside en una tabla, vista, contrato serializado o composición posterior.

---

#### 9. Contenido prohibido o no autoritativo

Una publicación no podrá derivarse de:

- sede seleccionada en interfaz;
- área seleccionada en interfaz;
- rol base del trabajador como fallback;
- `navigation_role`;
- última sede usada;
- último turno mostrado;
- estado local de React;
- parámetros manipulables del cliente;
- un check-in como fuente del turno;
- una notificación enviada;
- una caché no validada;
- una fila parcialmente cargada;
- una combinación de campos procedentes de dos revisiones;
- una fecha sin zona horaria suficiente para resolver instantes;
- un estado legacy interpretado de forma permisiva;
- una marca temporal de publicación sin contexto de revisión cuando el modelo soporte revisiones explícitas.

---

#### 10. Estado de origen y transición autoritativa

La publicación ordinaria corresponde a la transición aprobada de `VPROC-0007`:

```text
PENDING_PUBLICATION
→ PUBLISHED
```

Esta transición conserva las propiedades ya definidas en E2:

- transición normal hacia adelante;
- autoridad de `CONTROL_ACEPTACION`;
- guards obligatorios;
- avance atómico de la instancia afectada.

`INT-WORK-001` no crea un nuevo estado de proceso.

No se admiten equivalencias como:

```text
SCHEDULE_DRAFT
→ PUBLISHED
```

sin haber satisfecho las decisiones y controles intermedios aprobados.

---

#### 11. Puertas mínimas de publicación

Antes de aceptar una publicación deberán poder demostrarse las siguientes condiciones aplicables.

| Puerta                             | Condición                                                                  |
| ---------------------------------- | -------------------------------------------------------------------------- |
| Estado de origen                   | la revisión se encuentra en el estado de origen permitido para publicación |
| Identidad del turno                | el turno existe y su identidad es inequívoca                               |
| Identidad de la revisión           | la revisión candidata es exacta y no combina fuentes                       |
| Trabajador                         | el trabajador existe y corresponde a la revisión                           |
| Vínculo laboral                    | el vínculo aplicable es vigente y compatible con la ventana del turno      |
| Sede                               | la sede existe, está activa y es utilizable para la asignación             |
| Área y sede                        | el área, cuando aplique, pertenece a la sede                               |
| Rol operativo                      | el rol operativo es canónico y está presente cuando se requiere            |
| Compatibilidad territorial del rol | rol, sede y área satisfacen las relaciones aprobadas                       |
| Ventana temporal                   | inicio, fin y zona horaria forman una ventana válida                       |
| Solapamiento                       | no existe conflicto temporal incompatible para el trabajador               |
| Hold o conflicto bloqueante        | no existe hold, conflicto estructural o condición que impida publicar      |
| Autoridad de publicación           | quien publica posee autoridad administrativa suficiente                    |
| Revisión esperada                  | la revisión esperada sigue siendo la candidata vigente                     |
| Idempotencia                       | la solicitud no reutiliza identidad idempotente con contenido distinto     |
| Auditoría                          | la decisión puede quedar correlacionada con evidencia y actor              |

La lista define semántica contractual. La materialización de cada control pertenece a sus tareas propietarias.

---

#### 12. Fallo cerrado de las puertas

Una puerta aplicable que no pueda resolverse no se interpreta como satisfecha.

Regla:

```text
PUERTA DESCONOCIDA, AMBIGUA O CONTRADICTORIA
→ NO PUBLICAR
```

No se permitirá:

- tomar la primera coincidencia de varias;
- escoger la revisión más reciente por conveniencia;
- asumir que `null` significa cualquier sede o área;
- completar rol desde perfil cuando el turno no lo trae;
- ignorar conflicto porque la interfaz no lo muestra;
- publicar y corregir después una incompatibilidad ya conocida;
- usar un valor enviado por cliente para reparar una referencia autoritativa faltante.

---

#### 13. Autoridad de publicación

Publicar es una acción administrativa protegida.

La decisión de autorización deberá resolverse server-side y conservar, como mínimo:

- principal;
- actor efectivo;
- aplicación;
- acción exacta;
- sede y área afectadas cuando corresponda;
- recurso de programación;
- revisión candidata;
- modalidad administrativa;
- decisión;
- razones;
- versión contractual;
- timestamp.

La sola condición de ser gerente, supervisor o propietario no sustituye el permiso efectivo ni el alcance territorial.

La implementación futura deberá alinearse con `VISO-SCH-007`, las tareas de autorización de servidor y el evaluador canónico de Vento OS.

---

#### 14. Trabajador y vínculo laboral

La revisión publicada deberá referenciar un trabajador resoluble y un vínculo compatible con la ventana temporal del turno.

Reglas:

1. un trabajador inactivo no se vuelve elegible porque ya exista un borrador;
2. una asignación residual no reabre un vínculo terminado;
3. un cambio de vínculo posterior debe respetar vigencia y efectos temporales;
4. la historia de turnos anteriores se preserva después del retiro laboral;
5. la publicación futura no podrá omitir el vínculo cuando este sea necesario para demostrar elegibilidad;
6. reingreso no reutiliza por inferencia una programación de un vínculo anterior.

---

#### 15. Sede

La sede del turno es una propiedad de la programación publicada y participa posteriormente en el contexto operativo.

No procede de:

- sede seleccionada;
- sede primaria por conveniencia;
- punto de marcación;
- ubicación GPS del dispositivo;
- sede del último check-in;
- nombre del rol.

Antes de publicación se deberá demostrar que la sede es compatible con el trabajador y el contrato de programación.

Los detalles de validación administrativa y experiencia permanecen en `VISO-AUTH-*` y `VISO-SCH-*`.

---

#### 16. Área

El área publicada debe ser exacta cuando el rol o la programación la requieran.

Reglas:

1. el área debe pertenecer a la sede del turno;
2. `area_id = null` no significa toda la sede;
3. un rol site-wide podrá admitir ausencia de área únicamente cuando su contrato lo permita;
4. no se puede completar el área desde selección de interfaz después de publicar;
5. una incompatibilidad área–sede bloquea publicación;
6. una nueva relación territorial no reescribe revisiones históricas.

`VISO-AUTH-012 — Validar turnos con área incompatible` conserva la materialización administrativa específica de este control.

---

#### 17. Rol operativo

La revisión publicada deberá conservar el rol operativo exacto requerido para el turno laboral.

Reglas:

1. el rol operativo no se deriva del rol base;
2. no se sustituye por `navigation_role`;
3. debe existir en el catálogo canónico;
4. debe ser compatible con la sede y, cuando aplique, el área;
5. la ausencia de rol requerido bloquea publicación utilizable como turno operativo;
6. una revisión posterior puede cambiar el rol únicamente mediante cambio versionado y nueva publicación.

Propietarios posteriores:

- `VISO-AUTH-010 — Asignar rol operativo al turno`;
- `VISO-AUTH-011 — Validar turnos sin rol operativo`;
- `VISO-AUTH-012 — Validar turnos con área incompatible`.

---

#### 18. Tiempo y zona horaria

Un turno publicado debe poder resolverse como intervalo temporal inequívoco.

Debe existir semántica suficiente para construir:

```text
`starts_at`
`ends_at`
zona horaria
```

Reglas:

1. inicio debe ser anterior a fin;
2. la zona horaria debe ser conocida;
3. un turno cruzado de medianoche se resuelve por instantes reales, no por igualdad de fecha civil;
4. cambio de mes o año no modifica la identidad del turno;
5. una vista semanal o mensual no altera el intervalo;
6. no se inventan tolerancias de entrada o salida en esta tarea;
7. `active_shift` se resolverá posteriormente con la regla temporal canónica correspondiente;
8. una revisión futura todavía no efectiva no sustituye la revisión actualmente autoritativa.

`VISO-SCH-002` y `VISO-SCH-003` conservan el detalle funcional de horizontes, bloques, overnight, duración y edición.

---

#### 19. Solapamientos y conflictos

La publicación no debe crear una programación incompatible conocida para el mismo trabajador.

Como mínimo se deberá poder detectar antes de publicar:

- solapamiento temporal incompatible;
- turno laboral y descanso mutuamente incompatibles;
- sede incompatible;
- área incompatible;
- rol no válido;
- revisión stale;
- duplicado lógico;
- conflicto de vigencia;
- varias revisiones autoritativas sin precedencia.

La interfaz puede mostrar conflictos, pero el control efectivo no depende de la interfaz.

`VISO-SCH-006` conserva la definición detallada de conflictos, concurrencia, recuperación y corrección versionada.

---

#### 20. Revisión posterior a publicación

Una revisión publicada no se edita silenciosamente in-place.

Cuando la programación cambia después de publicar:

```text
REVISIÓN PUBLICADA ACTUAL
→ CAMBIO PROPUESTO
→ CHANGE_UNDER_REVIEW
→ VALIDACIÓN
→ PENDING_PUBLICATION
→ NUEVA REVISIÓN PUBLICADA
```

Reglas:

1. la revisión anterior permanece preservada;
2. la revisión anterior continúa siendo la referencia autoritativa hasta que la nueva publicación sea efectiva conforme al contrato;
3. los campos no se mezclan entre revisiones;
4. el motivo del cambio se conserva cuando corresponda;
5. el actor que ejecuta la decisión queda auditado;
6. la nueva revisión conserva relación con la sustituida;
7. consumidoras cambian a la nueva revisión únicamente cuando exista publicación autoritativa;
8. una corrección no reescribe una asistencia histórica ya vinculada a otra revisión.

---

#### 21. `CANCEL`, `VOID`, `SUPERSEDE` y `CORRECT`

La tarea preserva las acciones CCR ya aprobadas para `VPROC-0007`.

##### 21.1. `CANCEL`

Se utiliza para cancelar una propuesta pendiente antes de su publicación o activación efectiva cuando el contrato aplicable lo permita.

No borra historia.

##### 21.2. `VOID`

Se utiliza para invalidar una versión inválida o duplicada antes de que produzca efecto válido.

No convierte una versión ya ejecutada en inexistente.

##### 21.3. `SUPERSEDE`

Se utiliza para reemplazar prospectivamente una definición publicada mediante una nueva versión aprobada.

Las consumidoras no cambian de versión hasta que la sucesora alcance publicación autoritativa.

##### 21.4. `CORRECT`

Se materializa como una nueva revisión con antes, después, impacto, revalidación y propagación controlada.

Nunca como edición silenciosa del registro publicado original.

---

#### 22. Cancelación o retiro de un turno ya publicado

Un turno publicado no desaparece por cancelación.

La cancelación o retiro posterior deberá conservar:

- turno afectado;
- revisión vigente al momento de la decisión;
- nueva decisión o revisión aplicable;
- actor;
- motivo;
- momento efectivo;
- comunicaciones requeridas;
- impactos posteriores;
- auditoría.

Un consumidor no puede inferir cancelación porque dejó de recibir una fila.

Una eliminación física no sustituye el hecho autoritativo de cancelación.

---

#### 23. Idempotencia de publicación

La publicación debe ser idempotente sobre la misma intención lógica.

Reglas:

1. repetir la misma intención con el mismo contenido no produce una segunda revisión publicada equivalente;
2. la misma identidad idempotente con contenido materialmente distinto produce conflicto;
3. un timeout no autoriza a crear otra publicación con nueva identidad por conveniencia;
4. el resultado de la publicación debe poder recuperarse;
5. una redelivery de la solicitud no duplica historia ni notificaciones por inferencia;
6. la idempotencia de publicación y la idempotencia de notificación permanecen correlacionadas pero separadas.

La materialización física reutilizará los contratos transversales de idempotencia y recuperación ya aprobados.

---

#### 24. Concurrencia

Dos actores o procesos no deben poder publicar dos sucesoras incompatibles de la misma revisión esperada.

La publicación deberá validar la revisión esperada inmediatamente antes del commit autoritativo.

Si otra operación ya avanzó la instancia:

```text
REVISIÓN ESPERADA != REVISIÓN AUTORITATIVA ACTUAL
→ CONFLICTO
→ NO PUBLICAR LA CANDIDATA STALE
```

No se permite resolver la carrera mediante “última escritura gana”.

`VISO-SCH-006` conserva la materialización detallada de concurrencia, rollback y recuperación.

---

#### 25. Publicación masiva semanal o mensual

Una interfaz puede ofrecer acciones sobre una semana o un mes, pero esa agrupación no cambia la semántica canónica.

La operación masiva debe tratar cada turno/revisión como unidad identificable.

Debe poder distinguir:

- unidades publicadas;
- unidades rechazadas por validación;
- unidades en conflicto;
- unidades ya publicadas idempotentemente;
- unidades que requieren revisión posterior.

Un mensaje global de éxito no puede ocultar una unidad fallida.

Esta tarea no decide si un lote concreto será todo-o-nada o permitirá parcialidad controlada. Esa decisión corresponde a `VISO-SCH-005`, `VISO-SCH-006` y al paquete de implementación que materialice la programación.

---

#### 26. Publicación y notificación

La secuencia contractual es:

```text
COMMIT AUTORITATIVO DE PUBLICACIÓN
→ EVIDENCIA DURABLE
→ SOLICITUD DE NOTIFICACIÓN
→ RESULTADO DE NOTIFICACIÓN
```

Reglas:

1. la notificación no puede preceder a una publicación que todavía podría fallar;
2. una notificación exitosa no crea la publicación;
3. una notificación fallida no reescribe el hecho de que la revisión fue publicada;
4. el fallo de notificación genera una obligación separada de entrega, retry o conciliación según los contratos transversales;
5. no se vuelve a publicar el turno únicamente para reenviar una comunicación;
6. el trabajador debe recibir la comunicación exigida por el proceso y los cambios posteriores publicados deben generar la comunicación correspondiente;
7. la métrica de publicación sin notificación efectiva se conserva como guardrail operativo;
8. los detalles de canal, plantilla, retry y servicio de notificación no se definen aquí.

`VISO-SCH-007` conserva la definición detallada de autorización, eventos y notificaciones de programación.

---

#### 27. Proyección publicada para consumidoras

La salida consumible es una proyección de la revisión publicada, minimizada por finalidad.

Debe permitir a una consumidora autorizada conocer, cuando lo necesite:

- turno;
- revisión;
- trabajador;
- ventana temporal;
- sede;
- área aplicable;
- rol operativo;
- estado aplicable;
- referencias de cambio o sustitución pertinentes;
- versión contractual.

No debe obligar a entregar:

- notas administrativas internas;
- historial completo de revisión;
- permisos del publicador;
- expediente laboral;
- información salarial;
- motivos sensibles no necesarios;
- datos de otras personas;
- auditoría completa.

La proyección no concede permiso operativo por sí sola.

---

#### 28. Frontera con el catálogo de eventos

`INT-WORK-001` no crea una nueva definición normal `VPROC-0007.EVT-*`.

El catálogo vigente conserva las seis definiciones normales aprobadas para `VPROC-0007`.

La publicación se define aquí como estado, resultado y proyección autoritativa de programación.

Si una implementación futura requiere transportar un evento empresarial adicional distinto de las definiciones vigentes, deberá primero versionar formalmente su fuente de proceso y el catálogo transversal bajo sus tareas propietarias.

La decisión sobre eventos y notificaciones específicas de programación permanece asignada a:

`VISO-SCH-007 — Definir autorización, auditoría, eventos y notificaciones`.

Condición de salida:

- toda emisión futura deberá corresponder a una definición canónica aprobada;
- ninguna implementación podrá inventar un `event_definition_id` local;
- el contrato de publicación seguirá siendo válido aunque el transporte cambie.

---

#### 29. Frontera con ANIMA

ANIMA es consumidora de la programación publicada.

Para este contrato:

```text
VISO PUBLICA
→ ANIMA CONSUME
```

No:

```text
ANIMA MODIFICA
→ VISO ACEPTA POR INFERENCIA
```

`INT-WORK-002` será propietaria documental de cómo ANIMA presenta el turno.

`INT-WORK-003` será propietaria documental de cómo ANIMA registra la asistencia contra el turno y revisión efectivos.

Las tareas `ANIMA-AUTH-001` a `ANIMA-AUTH-019` conservarán los controles de turno, sede, área, rol, contexto, cambios, reemplazos, overnight, offline y prohibición de otorgar autoridad por sí misma.

Esta tarea no desarrolla esas tareas posteriores.

---

#### 30. Frontera con SHELL

SHELL no publica programación.

SHELL podrá consumir la programación publicada únicamente como insumo para contexto, navegación o capacidades compartidas aprobadas.

`INT-WORK-005` conserva la definición del consumo del contexto por SHELL y las demás aplicaciones.

`SHELL-CTX-002` conserva la implementación futura del consumo canónico de turno y check-in dentro del SDK compartido.

La existencia de una revisión publicada no produce por sí sola un `ALLOW` de autorización.

---

#### 31. Frontera con contexto efectivo

La publicación entrega un hecho necesario para construir contexto operativo, pero no confirma por sí sola el contexto efectivo completo.

```text
REVISIÓN PUBLICADA
+
RESOLUCIÓN TEMPORAL
+
ACTOR EFECTIVO
+
SEDE / ÁREA
+
ROL OPERATIVO
+
CHECK-IN CUANDO APLIQUE
+
FRESCURA
→ CONTEXTO OPERATIVO RESOLUBLE
```

`INT-WORK-004` conserva la confirmación autoritativa del contexto efectivo en Supabase.

`AUTH-CTX-010` conserva la semántica de `active_shift`.

Una publicación futura no puede asumir que el trabajador ya se encuentra en turno ni que realizó check-in.

---

#### 32. Frontera con asistencia

Programación y asistencia son expedientes distintos.

Reglas:

1. VISO publica el turno.
2. ANIMA registra hechos de asistencia bajo su contrato posterior.
3. un check-in no modifica el turno publicado;
4. una corrección de asistencia no reescribe programación;
5. una revisión de turno posterior no reescribe asistencia histórica ya producida;
6. el check-in debe poder quedar vinculado al `shift_id` y revisión publicada utilizada;
7. turno sin asistencia no se convierte automáticamente en incidencia;
8. asistencia sin turno válido se trata conforme a sus contratos y no crea un turno por inferencia.

---

#### 33. Cambios cercanos al inicio

El proceso aprobado exige tratamiento especial cuando una modificación ocurre cerca del inicio del turno.

Esta tarea fija la regla cualitativa:

- requiere autoridad válida;
- requiere nueva revisión cuando el contenido publicado cambia;
- requiere comunicación al trabajador;
- preserva la versión sustituida;
- debe invalidar contexto stale cuando corresponda;
- no puede aplicarse silenciosamente.

No se inventa un umbral numérico de minutos u horas.

La definición cuantitativa, si llegara a existir, pertenece a la política de programación que materialicen `VISO-SCH-*`.

---

#### 34. Invalidación y frescura

Una nueva publicación, cancelación, sustitución o cambio efectivo de turno debe poder invalidar consumidores que todavía usen una revisión anterior.

Reglas:

1. una caché no puede prolongar autoridad de una revisión sustituida;
2. una sesión operativa deberá revalidar cuando el cambio afecte su contexto;
3. una cola offline deberá reautorizarse al sincronizar;
4. un consumidor que detecte versión stale no debe ejecutar con ella;
5. la invalidación no borra la revisión histórica;
6. un evento tardío se evalúa contra la revisión a la que realmente pertenece.

La materialización de frescura e invalidación corresponde a `AUTH-CTX-029`, `AUTH-DB-035` y `SHELL-CTX-006`.

---

#### 35. Auditoría mínima de publicación

La publicación deberá ser reconstruible sin depender de logs de interfaz.

La evidencia debe poder correlacionar, cuando aplique:

- proceso `VPROC-0007`;
- instancia de proceso;
- turno;
- revisión candidata;
- revisión publicada;
- revisión sustituida;
- actor de publicación;
- autoridad aplicada;
- sede y área;
- rol operativo;
- ventana temporal;
- decisión;
- conflictos evaluados;
- idempotencia;
- correlación;
- momento de publicación;
- referencia de notificación;
- resultado posterior de comunicación;
- motivo de cambio, corrección o cancelación cuando aplique.

La auditoría no debe copiar expedientes o datos personales innecesarios.

---

#### 36. Privacidad y minimización

La programación laboral es información de dominio laboral restringido.

Reglas:

1. una consumidora recibe solo los campos necesarios para su finalidad;
2. la proyección personal de ANIMA no expone información administrativa de terceros;
3. logs y traces usan referencias y no duplican contenido sensible por defecto;
4. una lista de turnos de sede requiere autoridad territorial;
5. la publicación no concede acceso al expediente laboral completo;
6. un actor que puede publicar no recibe automáticamente capacidad para exportar información laboral sensible;
7. una notificación minimiza contenido según canal y sensibilidad.

---

#### 37. Estados técnicos y resultado empresarial

No se confunden:

```text
200 / ACK / REVALIDATE / NOTIFICACIÓN ENCOLADA
≠
REVISIÓN PUBLICADA
```

El resultado empresarial autoritativo se demuestra por el commit de publicación y su evidencia durable.

Si un componente técnico falla después del commit:

- el turno no vuelve a borrador por inferencia;
- el worker de notificación no publica otra revisión;
- la interfaz recupera el resultado autoritativo antes de repetir;
- la conciliación distingue publicación de comunicación.

---

#### 38. Reconciliación con la implementación observada de VISO

La implementación actual acredita una superficie real de programación y publicación, pero no sustituye el contrato objetivo.

| Superficie observada   | Evidencia actual                                                              | Lectura contractual                                                                                |
| ---------------------- | ----------------------------------------------------------------------------- | -------------------------------------------------------------------------------------------------- |
| guardado de turnos     | crea o actualiza `employee_shifts` y mantiene borradores con publicación nula | evidencia de implementación parcial de planificación; no acredita revisión publicada explícita     |
| validación territorial | valida trabajador, sedes y matriz operativa antes de guardar                  | control útil que deberá converger con el contrato canónico                                         |
| solapamiento           | existe validación de rangos incompatibles al guardar                          | evidencia parcial; la certificación completa pertenece a programación y concurrencia               |
| publicación semanal    | `publishWeekAction` marca filas no publicadas con momento y actor             | prueba que existe un publicador VISO; la semana no se convierte por ello en unidad canónica        |
| comunicación posterior | después del update solicita aviso a ANIMA                                     | coincide con el orden publicación → notificación, pero no acredita entrega efectiva                |
| edición                | la superficie observada puede actualizar una fila existente                   | no satisface por sí sola el requisito de revisión versionada posterior a publicación               |
| borrado                | la eliminación observada se restringe a filas no publicadas                   | preserva parcialmente el principio de no borrar publicación, sin acreditar historial de revisiones |

Esta tarea no modifica esa implementación.

---

#### 39. Reconciliación con el modelo físico observado en `vento-shell`

La migración vigente inspeccionada acredita actualmente en `employee_shifts`:

- `published_at`;
- `published_by`;
- un índice asociado a publicación.

Esto demuestra una marca física de publicación, pero no acredita por sí solo:

- identidad explícita de revisión;
- cadena de supersesión;
- historial completo de revisión;
- control de concurrencia de publicación;
- contrato per-item de una operación masiva;
- invalidación de consumidores;
- paridad entre todas las aplicaciones.

No se selecciona aquí un nuevo esquema físico.

---

#### 40. Reconciliación con ANIMA observada

La implementación observada de ANIMA consume actualmente `employee_shifts` filtrando turnos con publicación existente.

Esto acredita una consumidora real.

No acredita todavía por sí solo:

- consumo de una identidad explícita de revisión;
- proyección versionada del contrato;
- invalidación por revisión sustituida;
- paridad completa con `active_shift`;
- separación física total entre lectura consumidora y mutaciones propietarias.

El cierre documental del consumo de presentación corresponde a `INT-WORK-002`.

El cierre documental de asistencia corresponde a `INT-WORK-003`.

La prohibición transversal de escritura cruzada ya permanece vigente por `INT-APP-010`.

---

#### 41. Propietarios de las brechas físicas observadas

Ninguna brecha queda sin dueño documental.

| Brecha observada                                                                                                   | Propietario exacto                                                                   | Condición de salida                                                                                    |
| ------------------------------------------------------------------------------------------------------------------ | ------------------------------------------------------------------------------------ | ------------------------------------------------------------------------------------------------------ |
| falta de modelo explícito de borrador, revisión, publicación y corrección en la evidencia física inspeccionada     | `VISO-SCH-005 — Definir borrador, revisión, publicación y corrección`                | contrato interno de revisión y publicación aprobado antes del paquete de implementación                |
| conflicto, concurrencia, parcialidad o recuperación de acciones masivas todavía no certificados                    | `VISO-SCH-006 — Definir conflictos, integridad, concurrencia y recuperación`         | reglas de conflicto, idempotencia, rollback y estado parcial aprobadas                                 |
| autorización, auditoría, eventos y notificaciones de programación todavía no certificados como contrato específico | `VISO-SCH-007 — Definir autorización, auditoría, eventos y notificaciones`           | acción de publicación protegida, auditoría y comunicación formalmente materializadas                   |
| rol operativo ausente o incompatible                                                                               | `VISO-AUTH-010`, `VISO-AUTH-011` y `VISO-AUTH-012`                                   | rol asignado y validado contra sede/área antes de habilitar publicación operativa                      |
| experiencia administrativa de programación y conflictos                                                            | `VISO-UX-003` y `VISO-UX-015`                                                        | programación y conflictos presentados sin sustituir validación server-side                             |
| corrección, conflictos, auditoría y notificación del núcleo VISO                                                   | `VISO-CORE-005 — Implementar validación de conflictos y auditoría`                   | implementación del núcleo certifica corrección, auditoría y notificación conforme al contrato aprobado |
| consumo ANIMA sin identidad explícita de revisión                                                                  | `INT-WORK-002 — Definir contrato para que ANIMA presente el turno`                   | presentación queda ligada a turno + revisión vigente sin fuente competidora                            |
| asistencia aún no ligada contractualmente por esta secuencia                                                       | `INT-WORK-003 — Definir contrato para que ANIMA registre la asistencia`              | cada hecho de asistencia referencia turno y revisión aplicables                                        |
| confirmación de contexto efectivo                                                                                  | `INT-WORK-004 — Definir confirmación autoritativa del contexto efectivo en Supabase` | contexto autoritativo converge con turno, revisión, check-in y frescura                                |
| consumo transversal del contexto                                                                                   | `INT-WORK-005 — Definir consumo del contexto por SHELL y las aplicaciones`           | consumidoras usan el contexto compartido sin recalcular turno por cuenta propia                        |
| adaptación del modelo legacy de `published_at` y ausencia de revisiones explícitas en el resolver de contexto      | `AUTH-CTX-028`                                                                       | adapter legacy produce semántica compatible o es retirado por el modelo físico final                   |
| invalidación por cambio de turno o frontera temporal                                                               | `AUTH-CTX-029`, `AUTH-DB-035` y `SHELL-CTX-006`                                      | consumidores dejan de reutilizar contexto stale después de una nueva revisión o cambio efectivo        |

---

#### 42. Límites frente a `VISO-SCH-001` a `VISO-SCH-008`

`INT-WORK-001` define la frontera **entre aplicaciones** de la publicación.

No sustituye el mini-bloque interno de programación VISO.

Se preserva la siguiente separación:

| Tema                                                                                             | Propiedad      |
| ------------------------------------------------------------------------------------------------ | -------------- |
| frontera VISO → consumidoras después de publicación                                              | `INT-WORK-001` |
| unidad, periodo, trabajador, sede, área, rol, turno y versión dentro del contrato funcional VISO | `VISO-SCH-001` |
| semana/mes, zona horaria y navegación interna                                                    | `VISO-SCH-002` |
| bloques, overnight, descansos, presets y edición                                                 | `VISO-SCH-003` |
| límites y excepciones mensuales                                                                  | `VISO-SCH-004` |
| flujo interno borrador/revisión/publicación/corrección y alcance de lotes                        | `VISO-SCH-005` |
| conflicto, concurrencia, rollback y recuperación                                                 | `VISO-SCH-006` |
| autorización, auditoría, eventos y notificaciones                                                | `VISO-SCH-007` |
| gate final del contrato de programación antes de E5                                              | `VISO-SCH-008` |

Ninguna decisión de esta tarea fija los valores provisionales de límites mensuales observados en el delta VISO.

---

#### 43. Prohibiciones

Queda prohibido considerar conforme a este contrato cualquiera de los siguientes atajos:

1. usar solo `published_at` como identidad de revisión;
2. sobrescribir una revisión publicada y conservar únicamente los valores nuevos;
3. publicar desde ANIMA mediante reglas locales;
4. tratar una semana como una única identidad de turno;
5. mezclar campos de revisiones diferentes;
6. publicar con rol operativo faltante cuando este es obligatorio;
7. completar sede o área desde selección del frontend;
8. asumir que notificar equivale a publicar;
9. asumir que publicar equivale a turno vigente;
10. asumir que turno vigente equivale a check-in;
11. publicar pese a un conflicto estructural conocido;
12. usar última escritura gana para resolver concurrencia;
13. repetir publicación a ciegas después de timeout;
14. borrar un turno publicado para representar cancelación;
15. inferir cancelación porque una fila desapareció de una consulta;
16. inventar un nuevo `VPROC-0007.EVT-*` desde la implementación;
17. tratar un ACK técnico como efecto empresarial;
18. convertir una caché en fuente de programación;
19. usar el rol base como rol operativo por fallback;
20. aplicar valores numéricos provisionales del delta mensual como arquitectura estable.

---

#### 44. Escenarios mínimos de aceptación contractual

La implementación futura deberá poder demostrar, como mínimo, estos escenarios sin cambiar la semántica aquí aprobada:

1. publicar un turno laboral válido con sede, área y rol compatibles;
2. publicar un turno site-wide cuando la ausencia de área sea contractualmente válida;
3. rechazar turno sin rol operativo requerido;
4. rechazar área que no pertenece a la sede;
5. rechazar trabajador o vínculo no elegible;
6. rechazar solapamiento incompatible;
7. resolver correctamente un turno cruzado de medianoche;
8. conservar una revisión publicada mientras existe un cambio posterior en borrador;
9. publicar una sucesora sin sobrescribir la anterior;
10. detectar publicación concurrente stale;
11. repetir idempotentemente una solicitud ya confirmada;
12. rechazar reutilización de identidad idempotente con contenido distinto;
13. publicar y luego fallar la notificación sin reescribir el hecho publicado;
14. reintentar la notificación sin generar una nueva revisión;
15. cancelar o retirar un turno publicado preservando historia;
16. consumir desde ANIMA la revisión autoritativa y no el borrador;
17. invalidar contexto stale después de una revisión efectiva nueva;
18. mantener la asistencia histórica ligada a la revisión con la que ocurrió;
19. procesar una acción masiva sin ocultar el resultado individual de cada turno;
20. impedir que un cliente seleccione o fabrique una revisión autoritativa.

---

#### 45. Criterios de aceptación documental

`INT-WORK-001` queda documentalmente completa cuando se cumplen simultáneamente estos criterios:

1. VISO queda como única propietaria de `VPROC-0007`.
2. turno borrador, revisión publicada, turno publicado y turno vigente quedan diferenciados.
3. la unidad autoritativa queda definida como `shift_id + revisión publicada`.
4. semana y mes quedan como proyecciones u orquestaciones, no identidades de turno.
5. la publicación parte del estado aprobado `PENDING_PUBLICATION` y produce `PUBLISHED`.
6. las puertas de publicación cubren identidad, vínculo, territorio, rol, tiempo, conflicto, autoridad, revisión, idempotencia y auditoría.
7. una revisión publicada no puede sobrescribirse silenciosamente.
8. `CANCEL`, `VOID`, `SUPERSEDE` y `CORRECT` conservan sus semánticas aprobadas.
9. publicación y notificación permanecen separadas y correlacionables.
10. un fallo de notificación no vuelve a publicar el turno.
11. la publicación no crea automáticamente contexto operativo ni asistencia.
12. ANIMA y SHELL quedan como consumidoras y no como propietarias.
13. no se crea una nueva definición normal de evento.
14. no se inventan thresholds cuantitativos ni límites mensuales.
15. la implementación observada queda clasificada sin presentarla como contrato final.
16. cada brecha física observada queda vinculada a una tarea propietaria y condición de salida.
17. `INT-WORK-002` a `INT-WORK-005` permanecen sin desarrollar.
18. no se modifica código, Supabase, datos, migraciones, RPC, RLS, colas, notificaciones ni configuración.
19. no se crean ni modifican requisitos de prueba.

---

#### 46. Requisitos de prueba derivados

**NO GENERA REQUISITOS DE PRUEBA.**

Justificación:

- la propiedad de VISO sobre la programación ya está protegida por el registro canónico vigente;
- la revisión estable del turno publicado, la preservación de versiones, el consumo de ANIMA y la vinculación posterior de asistencia ya forman parte de obligaciones de integración vigentes;
- la idempotencia, recuperación de resultado, auditoría, territorialidad, invalidación de contexto y prohibición de escrituras cruzadas ya tienen controles verificables vigentes;
- esta tarea especializa esas obligaciones en la frontera de publicación VISO y no agrega una superficie ejecutable, tecnología, permiso, esquema, endpoint, transición de proceso, definición de evento o comportamiento físico nuevo;
- los requisitos específicos de la futura materialización del contrato interno de programación VISO permanecen bajo las tareas `VISO-SCH-*` ya reservadas y su propio gobierno de requisitos.

---

#### 47. Resultado de la tarea

`INT-WORK-001` queda **APROBADA** como definición documental del contrato mediante el cual VISO publica un turno y una revisión autoritativa consumible por el resto de Vento OS.

Resultado consolidado:

- proceso propietario: **`VPROC-0007`**;
- aplicación propietaria: **VISO**;
- consumidoras directas heredadas: **ANIMA y SHELL**;
- consumidoras condicionales heredadas: **NEXO, FOGO, ORIGO, PULSO y NUMERA**;
- unidad autoritativa: **turno + revisión publicada**;
- publicación ordinaria: **`PENDING_PUBLICATION → PUBLISHED`**;
- revisión publicada sobrescrita in-place: **prohibida**;
- semana/mes como identidad canónica del turno: **prohibido**;
- nueva definición normal de evento: **0**;
- thresholds numéricos nuevos: **0**;
- cambios físicos: **0**;
- requisitos de prueba creados o modificados: **0**.

Invariante final:

```text
VISO
+
TURNO IDENTIFICADO
+
REVISIÓN EXACTA
+
VALIDACIONES SATISFECHAS
+
AUTORIDAD DE PUBLICACIÓN
+
COMMIT DURABLE
+
HISTORIA PRESERVADA
=
REVISIÓN PUBLICADA AUTORITATIVA
```

seguida por:

```text
REVISIÓN PUBLICADA
→ PROYECCIÓN CONSUMIBLE
→ NOTIFICACIÓN CONTROLADA
→ CONSUMO ANIMA / SHELL
→ CONTEXTO Y ASISTENCIA SOLO BAJO SUS CONTRATOS PROPIOS
```

---

ÚLTIMA TAREA APROBADA

`INT-EXT-020 — Prohibir credenciales compartidas entre integraciones`

TAREA ACTUAL APROBADA

`INT-WORK-001 — Definir contrato para que VISO publique el turno`

SIGUIENTE TAREA RESERVADA

`INT-WORK-002 — Definir contrato para que ANIMA presente el turno`


### ✅ INT-WORK-002 — Definir contrato para que ANIMA presente el turno

**Estado:** APROBADA
**Tarea anterior:** `INT-WORK-001 — Definir contrato para que VISO publique el turno` — APROBADA
**Tarea siguiente:** `INT-WORK-003 — Definir contrato para que ANIMA registre la asistencia` — RESERVADA
**Tipo de tarea:** documental; definición del contrato mediante el cual ANIMA consume y presenta la programación publicada por VISO al trabajador y, cuando exista autorización suficiente, proyecciones territoriales de solo lectura, sin implementar código, esquema físico, migraciones, RPC, RLS, eventos, colas, cambios de Supabase ni mutaciones de programación
**Bloque:** X — Integraciones
**Mini-bloque:** Contexto laboral
**Fase:** exclusivamente documental
**Repositorio propietario:** `vento-shell`
**Implementación física autorizada:** ninguna

---

#### 1. Objetivo

Definir de forma inequívoca qué significa que ANIMA presente un turno publicado por VISO y qué condiciones deben cumplirse para que la información mostrada al trabajador corresponda a la revisión autoritativa aplicable, sin crear una segunda fuente de programación ni confundir presentación con contexto operativo, asistencia o autorización.

La regla cardinal es:

```text
VISO PUBLICA
→ ANIMA RESUELVE LA REVISIÓN PUBLICADA APLICABLE
→ ANIMA PRESENTA UNA PROYECCIÓN MINIMIZADA
```

No:

```text
ANIMA LEE UNA FILA CUALQUIERA
→ LA TRATA COMO TURNO AUTORITATIVO
```

Y se conserva expresamente:

```text
ANIMA PRESENTA
≠
ANIMA PUBLICA
```

```text
ANIMA PRESENTA
≠
ANIMA MODIFICA PROGRAMACIÓN
```

```text
TURNO MOSTRADO
≠
CHECK-IN CONFIRMADO
```

```text
TURNO MOSTRADO
≠
AUTORIZACIÓN OPERATIVA FINAL
```

---

#### 2. Resultado sustantivo

`INT-WORK-002` deja definido un único contrato documental de presentación de programación con los siguientes resultados materiales:

1. ANIMA queda confirmada como consumidora y superficie personal de la programación publicada por VISO.
2. La unidad consumida y presentada queda fijada como `shift_id + revisión publicada autoritativa`.
3. Se separan las vistas personales, las proyecciones territoriales autorizadas y las capacidades administrativas.
4. Se define qué información debe transportar la proyección aunque no toda tenga que renderizarse.
5. Se define qué información debe ser visible al trabajador para interpretar correctamente su turno.
6. Se define cómo resolver turno actual, siguiente turno, semana personal, historial reciente, descanso, cancelación y sustitución.
7. Se distingue un estado vacío verdadero de una falla de lectura, una revisión ambigua o una proyección obsoleta.
8. Se prohíbe usar notificaciones, caché, orden de filas, timestamps aproximados o selección de cliente como fuente de revisión.
9. Se prohíbe que las superficies de ANIMA creen, publiquen, editen, confirmen, cancelen o reasignen programación mediante escritura propietaria de ANIMA.
10. Se reconcilian las brechas físicas observadas con tareas propietarias existentes y condiciones de salida explícitas.

Balance documental:

| Control                                     |                      Resultado |
| ------------------------------------------- | -----------------------------: |
| Proceso de programación consumido           |           **1 — `VPROC-0007`** |
| Aplicación propietaria de programación      |                   **1 — VISO** |
| Aplicación consumidora objeto de esta tarea |                  **1 — ANIMA** |
| Unidad autoritativa presentada              | **turno + revisión publicada** |
| Fuente competidora autorizada en ANIMA      |                          **0** |
| Nuevas definiciones normales de evento      |                          **0** |
| Cambios físicos                             |                          **0** |
| Requisitos de prueba creados o modificados  |                          **0** |

---

#### 3. Base canónica preservada

Esta tarea consume y conserva sin reinterpretación las decisiones aprobadas en:

- `INT-WORK-001`, que fija VISO como propietaria, la revisión publicada como unidad autoritativa y ANIMA como consumidora;
- `CAP-SCOPE-002` y `CAP-02.06`, que definen VISO como fuente administrativa de turnos y ANIMA como superficie personal;
- `VPROC-0007 — Administrar asignaciones laborales y programación publicada con historial y revisión controlada`;
- `INT-APP-010`, que prohíbe escrituras cruzadas sin contrato y conserva la propiedad funcional entre VISO y ANIMA;
- `AUTH-MOD-009`, que separa turno publicado, turno vigente y demás estados temporales;
- `AUTH-CTX-010`, que exige una revisión publicada autoritativa para resolver `active_shift`;
- `ANIMA-AUTH-001` a `ANIMA-AUTH-020`, que reservan controles de publicación, sede, área, rol, contexto, cambios, overnight, offline, auditoría y fuente de verdad;
- `ANIMA-UX-003` a `ANIMA-UX-005`, que separan experiencia personal y administrativa y reservan la presentación de turno actual, siguiente turno, sede, área, horario y rol;
- `TREQ-INTEGRATION-007`, que exige expresamente que ANIMA presente la revisión vigente;
- `TREQ-ANIMA-016`, que separa lectura personal, semana de sede y gestión, y exige control efectivo para mutaciones;
- `TREQ-AUTH-008`, `TREQ-AUTH-009`, `TREQ-AUTH-014` y `TREQ-AUTH-015`, que protegen contexto, territorio, invalidación, frescura y trazabilidad.

Ninguna decisión de esta tarea transfiere a ANIMA la propiedad de la programación.

---

#### 4. Propiedad funcional y frontera entre aplicaciones

La propiedad permanece:

```text
VPROC-0007
→ VISO
```

ANIMA cumple dos funciones permitidas respecto de programación:

1. **presentación personal**, para que el trabajador consulte su programación publicada;
2. **presentación territorial autorizada**, cuando un actor autorizado consulte una proyección de equipo que su alcance permita.

ANIMA no adquiere por ello capacidad propietaria para:

- crear un turno;
- publicar una revisión;
- sobrescribir una revisión publicada;
- reasignar trabajador;
- cambiar sede, área o rol del turno;
- confirmar o cancelar programación por escritura directa;
- decidir una corrección de programación;
- alterar `published_at` o su equivalente futuro;
- construir una segunda regla de solapamiento o publicación;
- mantener una fuente administrativa paralela.

Cuando una capacidad administrativa puntual permanezca expuesta desde ANIMA, deberá usar el mismo contrato y servicio propietario de VISO, con autorización y outcome de VISO. La ubicación de la interfaz no cambia la propiedad del proceso.

---

#### 5. Vocabulario de presentación

##### 5.1. Revisión publicada autoritativa

Versión exacta de un turno que fue publicada por VISO y es resoluble como la revisión vigente o aplicable según las relaciones de publicación, sustitución, corrección, cancelación y vigencia aprobadas.

##### 5.2. Proyección publicada

Representación minimizada de la revisión publicada para una finalidad consumidora. Puede ocultar datos administrativos sin perder identidad, versión ni semántica.

##### 5.3. Turno presentado

Proyección que ANIMA muestra como programación del trabajador porque corresponde a una revisión publicada autoritativa y cumple las reglas de alcance de esta tarea.

##### 5.4. Turno actual presentado

Turno publicado cuya ventana temporal aplicable contiene el instante de resolución conforme a la semántica temporal canónica. Es una clasificación de presentación y no prueba por sí sola check-in, presencia física ni autorización operativa.

##### 5.5. Siguiente turno presentado

Primera revisión publicada futura aplicable al trabajador al ordenar por instante canónico de inicio, no por orden de recepción, fila, pantalla ni timestamp de publicación.

##### 5.6. Turno histórico presentado

Proyección de un turno publicado cuyo periodo ya pasó o cuyo estado autoritativo posterior es cancelado, retirado, completado u otro resultado histórico permitido para la consulta personal.

##### 5.7. Vista territorial de programación

Proyección de turnos de otros trabajadores dentro de un territorio autorizado. No equivale a administración ni permite mutar programación.

---

#### 6. Unidad de consumo y de presentación

ANIMA debe conservar en toda proyección la identidad lógica:

```text
shift_id
+
revisión publicada autoritativa
```

La interfaz puede agrupar múltiples turnos por:

- día;
- semana;
- mes;
- sede;
- área;
- trabajador;
- estado visual.

La agrupación nunca sustituye la identidad de cada unidad.

Queda prohibido usar como unidad autoritativa:

- una semana completa;
- una tarjeta visual;
- una fecha sin identidad de turno;
- una fila mutable sin revisión resoluble;
- `published_at` por sí solo;
- la última fila recibida;
- el primer registro de una consulta;
- el contenido de una notificación;
- el estado local de la aplicación.

---

#### 7. Fuente de lectura

La presentación deberá consumir una proyección derivada de la publicación propietaria de VISO.

La fuente física futura podrá materializarse mediante tablas, vistas, RPC, contratos compartidos o adapters aprobados, pero deberá preservar esta semántica:

```text
FUENTE PROPIETARIA DE VISO
→ REVISIÓN PUBLICADA EXACTA
→ PROYECCIÓN AUTORIZADA
→ ANIMA
```

Una consulta directa a una tabla compartida solo será conforme si representa la misma fuente propietaria y no permite a ANIMA crear semántica alternativa de revisión, vigencia o propiedad.

---

#### 8. Identidad del trabajador

La vista personal deberá estar vinculada al actor laboral efectivo.

Reglas:

1. el trabajador de la proyección personal se resuelve desde identidad autenticada y vínculo laboral aplicable;
2. un `employee_id` enviado por cliente no puede ampliar el alcance personal;
3. cambiar de cuenta o actor invalida la proyección anterior;
4. una cuenta inactiva no recupera programación operativa por conservar una caché local;
5. un reingreso no debe mezclar automáticamente turnos de un vínculo laboral anterior con programación actual;
6. una vista territorial de terceros exige autorización separada y no nace de la vista personal.

---

#### 9. Información que la proyección debe transportar

La proyección consumida por ANIMA deberá poder resolver, cuando aplique:

| Información               | Regla                                                            |
| ------------------------- | ---------------------------------------------------------------- |
| `shift_id`                | identidad estable del turno                                      |
| revisión publicada        | identidad exacta y resoluble                                     |
| versión contractual       | permite detectar incompatibilidad de contrato                    |
| trabajador                | referencia exacta del titular del turno                          |
| vínculo laboral           | referencia suficiente para no mezclar vínculos                   |
| periodo de planificación  | contexto del ciclo de programación                               |
| sede                      | sede exacta del turno                                            |
| área                      | área exacta cuando aplique                                       |
| rol operativo             | referencia o código canónico                                     |
| inicio                    | instante inequívoco                                              |
| fin                       | instante inequívoco                                              |
| zona horaria              | explícita y válida                                               |
| naturaleza del turno      | laboral, descanso u otra clasificación aprobada                  |
| descanso previsto         | cuando corresponda                                               |
| estado aplicable          | coherente con la revisión                                        |
| momento de publicación    | referencia de publicación, sin usarla como identidad de revisión |
| revisión sustituida       | cuando exista                                                    |
| cancelación o retiro      | referencia autoritativa cuando aplique                           |
| punto de entrada o salida | solo cuando la finalidad de ANIMA lo requiera                    |
| reemplazo relacionado     | cuando exista y sea pertinente para el trabajador                |
| referencias de auditoría  | correlacionables y minimizadas                                   |

Esta forma es lógica y no prescribe nombres de columnas ni DTO físicos adicionales.

---

#### 10. Información mínima visible al trabajador

ANIMA deberá presentar de forma comprensible, cuando aplique al turno:

- fecha o día;
- hora de inicio;
- hora de fin o representación autorizada de cierre;
- sede;
- área cuando sea relevante para la función;
- rol operativo con etiqueta canónica comprensible;
- naturaleza de turno o descanso;
- estado que afecte al trabajador;
- cambio, cancelación o sustitución cuando corresponda;
- indicación suficiente para distinguir programación oficial de un estado pendiente o no disponible.

La interfaz no está obligada a mostrar al trabajador:

- identificadores técnicos completos;
- actor que publicó;
- permisos del publicador;
- historial administrativo completo;
- notas internas;
- evidencia de auditoría completa;
- datos de otros trabajadores fuera de una vista autorizada;
- motivos sensibles que no sean necesarios para comprender su programación.

La identidad de revisión puede permanecer como metadata no visual siempre que la aplicación la conserve para frescura, correlación y acciones posteriores.

---

#### 11. Presentación del rol operativo

El rol mostrado al trabajador deberá corresponder al rol operativo de la revisión publicada.

Reglas:

1. no se deriva del rol base;
2. no se deriva de `navigation_role`;
3. no se infiere por fragmentos de texto, prefijos o coincidencias aproximadas;
4. una etiqueta amigable debe provenir del catálogo o mapeo canónico compatible con el código del rol;
5. un alias visual no modifica la identidad del rol;
6. una referencia de rol desconocida o incompatible no se presenta como otro rol parecido.

---

#### 12. Presentación de sede y área

La sede y el área mostradas proceden del turno publicado.

No proceden de:

- sede seleccionada para navegación;
- sede primaria por conveniencia;
- área seleccionada;
- última sede utilizada;
- geolocalización actual;
- punto de check-in;
- perfil general del trabajador.

Si el turno es válido sin área por corresponder a una función site-wide, la ausencia de área no se traduce como “todas las áreas”.

---

#### 13. Tiempo, zona horaria y cambio de día

ANIMA deberá interpretar la ventana temporal con la zona horaria autoritativa del turno.

Reglas:

1. la zona del dispositivo no sustituye la zona del turno;
2. la configuración regional del dispositivo puede afectar formato visual, no el instante empresarial;
3. un turno cruzado de medianoche se presenta usando inicio y fin reales y no como una duración negativa o cero;
4. el cambio de mes o año no parte el turno en dos identidades;
5. “hoy”, “actual” y “siguiente” se resuelven respecto del instante canónico y la zona aplicable;
6. ordenar por texto de fecha y hora sin semántica de zona no acredita orden temporal correcto;
7. una fecha civil aislada no basta para decidir vigencia.

---

#### 14. Turno actual

Cuando ANIMA muestre “turno actual”, deberá utilizar la misma revisión publicada y semántica temporal compatibles con el contrato de `active_shift`.

Un turno actual presentado debe satisfacer como mínimo:

- pertenecer al trabajador aplicable;
- ser una revisión publicada resoluble;
- no estar retirada o cancelada para el instante aplicable;
- contener una ventana temporal válida;
- contener los campos operativos mínimos exigidos por su tipo;
- ser la única candidata inequívoca para esa clasificación.

Si existen dos candidatos incompatibles, ANIMA no elegirá uno por orden de consulta.

La etiqueta “turno actual” no significa:

- trabajador presente;
- check-in realizado;
- geocerca válida;
- permiso operativo concedido;
- sesión de asistencia abierta.

---

#### 15. Siguiente turno

El siguiente turno se determina entre revisiones publicadas futuras aplicables.

Reglas:

1. se ordena por inicio autoritativo;
2. se excluyen revisiones retiradas o canceladas para el horizonte aplicable;
3. un borrador futuro no desplaza al siguiente turno publicado;
4. una sucesora aún no publicada no desplaza a la revisión autoritativa;
5. un empate o conflicto no se resuelve escogiendo la primera fila;
6. un descanso puede presentarse como descanso, pero no debe confundirse con un turno laboral operativo.

---

#### 16. Semana personal

La vista semanal personal es una agrupación de revisiones publicadas del trabajador.

Debe:

- conservar identidad por turno;
- ordenar por instantes canónicos;
- representar descansos sin convertir la ausencia de turno en descanso aprobado;
- mostrar cambios y cancelaciones relevantes;
- evitar duplicados por revisiones sucesivas;
- no incluir borradores administrativos;
- no mezclar programación de otro trabajador o vínculo;
- mantener coherencia con las vistas de turno actual y siguiente.

Una semana vacía después de una lectura autoritativa exitosa significa ausencia de programación publicada en esa ventana. No significa error técnico ni indisponibilidad de fuente.

---

#### 17. Descanso y día sin turno

Se distinguen tres situaciones:

1. **descanso publicado**: existe una unidad de programación aprobada que representa descanso;
2. **día sin turno publicado**: no existe programación laboral ni descanso publicado para ese día;
3. **información no resoluble**: la fuente no pudo determinar de manera confiable la programación.

ANIMA no mostrará “Descanso” o “Libre” como hecho empresarial cuando únicamente exista ausencia de datos por error, timeout, incompatibilidad o consulta incompleta.

---

#### 18. Historial reciente

La vista histórica personal podrá mostrar turnos publicados anteriores y sus estados aplicables sin convertir una revisión antigua en la revisión actual.

Reglas:

1. una revisión sustituida permanece histórica;
2. la vista principal de un turno lógico utiliza la revisión autoritativa aplicable al periodo consultado;
3. una cancelación posterior no borra el hecho de que existió programación publicada;
4. una corrección de programación no reescribe asistencia histórica;
5. el detalle histórico ampliado se minimiza a la finalidad del trabajador;
6. un turno retirado no desaparece silenciosamente cuando su conservación es necesaria para comprender cambios ya comunicados o hechos posteriores.

---

#### 19. Cancelación y retiro

Cuando un turno publicado sea cancelado o retirado:

- deja de presentarse como obligación laboral vigente cuando la decisión sea efectiva;
- conserva identidad e historia;
- la cancelación se presenta de forma comprensible cuando sea relevante para el trabajador;
- la desaparición de una fila no se interpreta como cancelación;
- una notificación de cancelación no sustituye el cambio autoritativo;
- la versión anterior no se reescribe para aparentar que el turno nunca existió.

---

#### 20. Revisión sucesora y cambios publicados

Cuando VISO publique una revisión sucesora:

```text
REVISIÓN PUBLICADA ANTERIOR
→ NUEVA REVISIÓN PUBLICADA AUTORITATIVA
→ ANIMA INVALIDA LA PROYECCIÓN ANTERIOR
→ ANIMA PRESENTA LA SUCESORA
```

Reglas:

1. la revisión anterior permanece preservada;
2. ANIMA no mezcla campos de ambas revisiones;
3. un cambio en borrador no altera lo que el trabajador ve como oficial;
4. la interfaz puede indicar que hubo un cambio sin exponer auditoría administrativa innecesaria;
5. la relación con la revisión anterior se conserva para trazabilidad;
6. una vista stale no puede alimentar una acción operativa posterior sin revalidación.

---

#### 21. Estado de programación y estado de asistencia

ANIMA debe mantener separados:

- estado de programación;
- estado temporal del turno;
- estado de check-in;
- estado de check-out;
- estado de descanso de asistencia;
- estado de sincronización offline;
- estado de autorización operativa.

Por tanto:

```text
PROGRAMADO / PUBLICADO
≠
PRESENTE
```

```text
CONFIRMADO EN PROGRAMACIÓN
≠
CHECK-IN CONFIRMADO
```

```text
COMPLETADO EN PRESENTACIÓN
≠
ASISTENCIA CONCILIADA
```

La semántica exacta de registro de asistencia pertenece a `INT-WORK-003`.

---

#### 22. Notificaciones y enlaces hacia programación

Una notificación relacionada con un turno puede dirigir al trabajador a la superficie de programación permitida.

La notificación:

- no contiene autoridad suficiente para decidir la revisión vigente;
- no debe ser la fuente de sede, área, rol, horario o estado final;
- no convierte un payload atrasado en programación actual;
- no debe permitir navegar a un destino arbitrario;
- al abrirse, debe provocar o permitir la resolución de la revisión autoritativa aplicable;
- puede conservar `shift_id` o correlación segura para localizar el recurso, pero el servidor o contrato propietario decide la versión vigente.

Un mensaje exitosamente entregado no prueba que la pantalla haya cargado la revisión correcta.

---

#### 23. Frescura, caché y actualización

La caché puede optimizar experiencia, pero no se convierte en fuente de programación.

Reglas:

1. una revisión sustituida no puede continuar presentándose como vigente después de que el consumidor conozca o deba revalidar el cambio;
2. una notificación, retorno a primer plano, refresh o señal de invalidación puede iniciar relectura, pero no reemplaza la fuente autoritativa;
3. una caché sin identidad de revisión no acredita frescura;
4. una proyección stale puede conservarse únicamente como información explícitamente no fresca si la experiencia futura lo permite, nunca como base para una acción operativa nueva;
5. las acciones de asistencia deberán revalidar bajo su propio contrato y no confiar en el estado visual mostrado;
6. invalidación y frescura físicas permanecen bajo `AUTH-CTX-029`, `AUTH-DB-035` y `SHELL-CTX-006`.

---

#### 24. Estado vacío, falla de lectura y conflicto

ANIMA debe distinguir al menos semánticamente:

- lectura autoritativa exitosa con turnos;
- lectura autoritativa exitosa sin turnos publicados en la ventana;
- fuente temporalmente no disponible;
- contrato o versión incompatible;
- revisión ambigua o contradictoria;
- proyección conocida como obsoleta y pendiente de actualización.

Regla:

```text
ERROR DE LECTURA
≠
NO HAY TURNOS
```

También:

```text
REVISIÓN AMBIGUA
≠
ESCOGER LA PRIMERA
```

La interfaz no debe informar al trabajador que “no tiene turno” si la aplicación únicamente perdió la capacidad de determinarlo.

---

#### 25. Vista territorial o de equipo

Una vista de turnos de otras personas es una proyección laboral restringida.

Debe cumplir simultáneamente:

- actor autenticado;
- capacidad de lectura aplicable;
- alcance territorial suficiente;
- sede y, cuando aplique, área compatibles;
- minimización de información por finalidad;
- revisión publicada para las vistas operativas de equipo;
- protección equivalente en servidor y datos, no solo en la pestaña o botón.

El hecho de que el trabajador tenga una sede asociada no concede por sí solo derecho a consultar la semana de toda la sede.

Una vista territorial no habilita edición.

---

#### 26. Superficie administrativa expuesta desde ANIMA

`CAP-02.06` permite que una capacidad administrativa puntual esté expuesta en ANIMA únicamente cuando use el mismo contrato y servicio de VISO.

Por tanto, si ANIMA conserva en el futuro controles administrativos de programación:

```text
INTERFAZ ANIMA
→ COMANDO CONTRA SERVICIO PROPIETARIO VISO
→ VALIDACIÓN VISO
→ OUTCOME VISO
→ PROYECCIÓN ACTUALIZADA EN ANIMA
```

Queda prohibido:

```text
INTERFAZ ANIMA
→ ESCRITURA DIRECTA DE PROGRAMACIÓN
```

La tarea no decide si la interfaz administrativa final permanecerá en ANIMA o se trasladará completamente a VISO. Sí fija que la propiedad y las reglas no pueden duplicarse.

---

#### 27. Borradores y revisiones no publicadas

Los borradores, revisiones en validación y revisiones pendientes de publicación no forman parte de la programación oficial personal del trabajador.

Reglas:

1. la vista personal no los muestra como turnos oficiales;
2. una vista administrativa autorizada puede mostrarlos como planificación, con estado inequívoco;
3. un borrador no desplaza la revisión publicada anterior;
4. un borrador no produce turno actual;
5. un borrador no produce siguiente turno oficial;
6. una notificación no puede volver oficial un borrador;
7. una consulta de equipo destinada a operación no mezcla borradores con turnos publicados sin distinguirlos expresamente.

---

#### 28. Privacidad y minimización

La programación laboral se trata como información laboral restringida.

La vista personal puede recibir los campos necesarios para que el trabajador comprenda su horario y contexto esperado.

La vista territorial de equipo debe evitar por defecto:

- notas privadas innecesarias;
- datos de contacto;
- información salarial;
- motivos médicos;
- novedades sensibles;
- documentos laborales;
- datos de identidad no necesarios;
- historial administrativo completo;
- permisos o razones de autorización internas.

La necesidad de ver quién trabaja en una sede no habilita acceso al expediente laboral de esas personas.

---

#### 29. Reemplazos y novedades

Un reemplazo o novedad laboral que afecte programación debe llegar a ANIMA como resultado autoritativo de los procesos propietarios correspondientes.

ANIMA no debe:

- crear un reemplazo por inferencia visual;
- reasignar el turno por selección local;
- convertir una ausencia reportada en cancelación de turno sin decisión;
- modificar la programación para hacerla coincidir con asistencia;
- ocultar un conflicto de reemplazo seleccionando una de varias filas.

Cuando una revisión publicada refleje un reemplazo autorizado, ANIMA presenta la revisión aplicable al trabajador correspondiente.

---

#### 30. Turnos cruzados de medianoche

Un turno overnight mantiene una sola identidad lógica y una ventana temporal real.

ANIMA deberá evitar:

- calcular duración usando la misma fecha civil para inicio y fin cuando el turno termina al día siguiente;
- clasificarlo como finalizado al cambiar el calendario a medianoche;
- duplicarlo en dos turnos por conveniencia visual;
- presentar el día siguiente como un nuevo turno sin identidad propia;
- escoger un siguiente turno antes de que finalice correctamente el turno overnight actual.

La implementación específica se completa con `ANIMA-AUTH-013` y las tareas de programación VISO aplicables.

---

#### 31. Relación con `active_shift`

La programación presentada y `active_shift` deben ser compatibles, pero no son el mismo contrato.

La presentación responde principalmente:

```text
¿QUÉ PROGRAMACIÓN PUBLICADA DEBO MOSTRAR?
```

El contexto responde:

```text
¿QUÉ TURNO PUBLICADO Y VIGENTE PARTICIPA EN LA RESOLUCIÓN OPERATIVA AHORA?
```

Por tanto:

- una lista semanal puede incluir turnos futuros que no son `active_shift`;
- un turno histórico puede presentarse sin ser contexto operativo;
- un turno actual presentado no concede permiso;
- la confirmación autoritativa del contexto efectivo permanece reservada a `INT-WORK-004`;
- ANIMA no debe construir un `active_shift` alternativo únicamente desde su UI.

---

#### 32. Relación con asistencia

`INT-WORK-002` no registra entrada, salida ni descanso.

Su obligación hacia `INT-WORK-003` consiste en preservar una referencia inequívoca de:

- trabajador;
- vínculo aplicable;
- `shift_id`;
- revisión publicada;
- ventana temporal;
- sede;
- área cuando aplique;
- rol operativo;
- versión contractual.

La acción de asistencia posterior deberá resolver nuevamente lo necesario y no asumir que el turno visible continúa vigente solo porque la pantalla lo conserva.

---

#### 33. Eventos empresariales

Esta tarea no crea una nueva definición normal `VPROC-0007.EVT-*`.

Presentar una pantalla, refrescar una lista, abrir una notificación o cambiar una tarjeta visual no constituye por sí mismo un nuevo evento empresarial.

Las definiciones vigentes de `VPROC-0007` permanecen sin modificación.

La futura emisión de un nuevo hecho material deberá seguir el gobierno propietario de procesos y el catálogo transversal antes de aparecer en código.

---

#### 34. Reconciliación con la implementación observada de lectura personal

La implementación actual de ANIMA acredita una superficie real de consulta de programación.

| Comportamiento observado | Evidencia técnica actual                                                   | Lectura contractual                                                         |
| ------------------------ | -------------------------------------------------------------------------- | --------------------------------------------------------------------------- |
| consulta personal        | filtra `employee_shifts` por usuario y exige `published_at` no nulo        | acredita consumo de publicación, pero no identidad explícita de revisión    |
| rango visible            | consulta aproximadamente una ventana pasada/futura y ordena por fecha/hora | acredita experiencia de agenda, no semántica completa de zona horaria       |
| semana personal          | agrupa filas por fecha                                                     | agrupación permitida si conserva identidad y revisión                       |
| próximos y recientes     | clasifica usando fecha, hora, estado y reloj del dispositivo               | funcionalidad parcial; debe converger con instantes y zona autoritativos    |
| sede                     | muestra nombre asociado al turno                                           | compatible si la referencia procede de la revisión publicada                |
| rol visible              | construye una etiqueta mediante normalización textual                      | no acredita vínculo con una etiqueta canónica de rol                        |
| error de carga           | el fallo termina con una lista vacía                                       | no permite distinguir ausencia real de turnos frente a fuente no disponible |

La evidencia anterior describe estado físico actual; no cambia el contrato objetivo.

---

#### 35. Reconciliación con la implementación observada de administración en ANIMA

La implementación actual contiene además capacidades administrativas que exceden una presentación de solo lectura.

| Comportamiento observado | Evidencia técnica actual                                                 | Lectura contractual                                                                             |
| ------------------------ | ------------------------------------------------------------------------ | ----------------------------------------------------------------------------------------------- |
| crear turno              | `CreateShiftModal` inserta directamente en `employee_shifts`             | escritura propietaria de programación desde ANIMA; debe converger con la frontera VISO          |
| publicar al crear        | la interfaz puede fijar `published_at` y `published_by`                  | no satisface por sí sola el contrato de publicación de `INT-WORK-001`                           |
| editar turno             | `EditShiftModal` actualiza la fila por `id`                              | una revisión publicada puede quedar sobrescrita in-place; incompatible con historial versionado |
| confirmar o cancelar     | la lógica de turnos actualiza directamente `status`                      | mutación de programación fuera de un outcome propietario de VISO                                |
| lectura de sede          | la pantalla combina semana personal, semana de sede y gestión            | la separación visual existe parcialmente, pero debe alinearse con autoridad y propiedad         |
| fallback de gestión      | la pantalla conserva una lista local de roles mientras carga capacidades | una lista local no puede conceder autoridad final                                               |

`INT-WORK-002` no modifica estos archivos. La tarea fija la frontera que la implementación posterior deberá satisfacer.

---

#### 36. Brechas físicas y propietarios

Ninguna brecha observada queda sin destino documental.

| Brecha                                                                                          | Propietario exacto                                                            | Condición de salida                                                                                      |
| ----------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------- | -------------------------------------------------------------------------------------------------------- |
| consumo personal basado en `published_at` sin identidad explícita de revisión                   | `AUTH-CTX-028`; `ANIMA-AUTH-001`; `ANIMA-UX-004`; `ANIMA-UX-005`              | ANIMA recibe o resuelve `shift_id + revisión publicada` y no infiere versión desde una marca temporal    |
| clasificación temporal con fecha/hora local sin zona contractual explícita                      | `VISO-SCH-002`; `VISO-SCH-003`; `ANIMA-UX-004`; `ANIMA-UX-005`                | inicio, fin, overnight, actual y siguiente se presentan con semántica temporal autoritativa              |
| etiqueta de rol derivada por coincidencia aproximada de texto                                   | `ANIMA-UX-005`                                                                | la etiqueta visible procede del rol operativo canónico o de un mapeo canónico compatible                 |
| error de consulta degradado a lista vacía y mensaje equivalente a ausencia de programación      | `ANIMA-UX-004`; `ANIMA-UX-005`                                                | la UI distingue lectura vacía válida de indisponibilidad, incompatibilidad o conflicto                   |
| vista de sede resuelta principalmente desde datos locales de empleado y capacidades de interfaz | `ANIMA-UX-014`; `ANIMA-AUTH-019`; `AUTH-QA-030`                               | la lectura territorial se valida con capacidad y alcance server-side antes de exponer turnos de terceros |
| creación directa de turnos desde ANIMA                                                          | `ANIMA-UX-003`; `ANIMA-UX-014`; `VISO-SCH-005`; `VISO-SCH-007`; `VISO-UX-003` | toda capacidad administrativa en ANIMA usa el contrato/servicio propietario de VISO o se traslada a VISO |
| publicación directa desde ANIMA mediante `published_at`                                         | `VISO-SCH-005`; `VISO-SCH-007`; `VISO-CORE-005`                               | solo el flujo propietario de VISO produce una revisión publicada conforme a `INT-WORK-001`               |
| edición in-place de un turno ya publicado                                                       | `VISO-SCH-005`; `VISO-SCH-006`; `VISO-CORE-005`                               | un cambio posterior crea revisión sucesora, preserva la anterior y aplica concurrencia controlada        |
| actualización directa de estados de programación desde ANIMA                                    | `ANIMA-UX-003`; `ANIMA-UX-014`; `VISO-SCH-005`; `VISO-SCH-007`                | ANIMA deja de mutar estados propietarios y consume outcomes de VISO                                      |
| invalidez o stale después de una revisión nueva                                                 | `AUTH-CTX-029`; `AUTH-DB-035`; `SHELL-CTX-006`                                | caches y consumidores dejan de reutilizar una revisión sustituida para decisiones posteriores            |
| vínculo contractual de asistencia con turno y revisión                                          | `INT-WORK-003`                                                                | cada hecho de asistencia queda referenciado determinísticamente a turno y revisión aplicables            |
| confirmación autoritativa de contexto efectivo                                                  | `INT-WORK-004`                                                                | Supabase y resolutores canónicos confirman contexto con revisión, tiempo, check-in y frescura            |

---

#### 37. Flujo canónico de presentación personal

El flujo lógico aprobado queda:

```text
ACTOR LABORAL AUTENTICADO
→ RESOLVER VÍNCULO APLICABLE
→ CONSULTAR PROYECCIÓN PUBLICADA AUTORIZADA
→ RESOLVER REVISIÓN AUTORITATIVA POR TURNO
→ VALIDAR COMPATIBILIDAD DE CONTRATO Y FRESCURA
→ ORDENAR POR INSTANTES CANÓNICOS
→ MINIMIZAR POR FINALIDAD
→ PRESENTAR
```

Para cualquier acción operativa posterior:

```text
PRESENTACIÓN
→ NUEVA RESOLUCIÓN / REVALIDACIÓN SEGÚN CONTRATO DE LA ACCIÓN
```

La pantalla no se convierte en prueba de autoridad.

---

#### 38. Invariantes

1. VISO continúa siendo la única propietaria de programación.
2. ANIMA presenta la revisión publicada, no un borrador.
3. `shift_id` y revisión permanecen correlacionados.
4. la revisión no se elige por máximo timestamp.
5. una sucesora en borrador no altera la revisión publicada actual.
6. una nueva revisión publicada invalida la presentación anterior cuando corresponda.
7. una cancelación no equivale a borrar el turno.
8. una semana o tarjeta no sustituye la identidad del turno.
9. turno publicado no equivale a turno vigente.
10. turno vigente no equivale a check-in.
11. presentación no equivale a autorización.
12. notificación no equivale a fuente de programación.
13. caché no equivale a fuente de programación.
14. ausencia de datos por error no equivale a día libre.
15. descanso publicado no equivale a ausencia de turno.
16. sede seleccionada no sustituye sede del turno.
17. área seleccionada no sustituye área del turno.
18. rol base no sustituye rol operativo.
19. una etiqueta de rol no se infiere por texto aproximado.
20. una vista de equipo exige alcance territorial real.
21. una vista de equipo no concede capacidad de edición.
22. una interfaz administrativa en ANIMA no transfiere propiedad de VISO.
23. una escritura directa de ANIMA sobre programación no satisface el contrato.
24. cambios posteriores a publicación preservan historia.
25. overnight se resuelve por instantes reales.
26. historial de programación y asistencia permanecen separados.
27. la acción de asistencia deberá revalidar la revisión aplicable.
28. no se crea un evento empresarial por renderizar una pantalla.

---

#### 39. Prohibiciones

Queda prohibido considerar conforme cualquiera de estos atajos:

1. mostrar una fila porque `published_at` no es nulo sin poder resolver la revisión aplicable;
2. tratar `published_at` como identificador de revisión;
3. elegir la última fila por timestamp;
4. mostrar un borrador como horario oficial;
5. mezclar campos de revisión anterior y sucesora;
6. usar datos de notificación como fuente del turno;
7. usar caché stale como programación vigente;
8. informar “sin turnos” después de una falla de lectura;
9. asumir “libre” porque no hubo respuesta de la fuente;
10. calcular overnight como intervalo inválido por usar una sola fecha civil;
11. usar la zona del dispositivo como autoridad temporal;
12. inferir rol visible por coincidencias aproximadas;
13. usar `employee.site_id` o equivalente local como permiso para ver toda una sede;
14. usar una lista local de roles como autorización final;
15. crear o publicar turnos directamente desde ANIMA;
16. editar una revisión publicada in-place desde ANIMA;
17. cancelar programación mediante una actualización directa de estado ajeno;
18. ocultar una cancelación eliminando la fila;
19. convertir un turno mostrado en check-in confirmado;
20. convertir una vista administrativa en propiedad funcional de programación.

---

#### 40. Escenarios mínimos de aceptación contractual

La implementación futura deberá demostrar como mínimo:

1. trabajador con un turno publicado ve la revisión exacta correspondiente;
2. trabajador no ve un borrador futuro del mismo turno;
3. una revisión sucesora publicada sustituye la presentada sin mezclar campos;
4. la revisión anterior permanece histórica;
5. un turno cancelado deja de ser programado vigente y conserva historia;
6. una semana sin turnos después de lectura válida muestra un estado vacío legítimo;
7. una falla de fuente no se presenta como “sin turnos”;
8. una revisión ambigua no se resuelve por primera fila;
9. turno actual no implica check-in;
10. siguiente turno se ordena por instante autoritativo;
11. overnight mantiene identidad y duración correctas;
12. sede del turno no se sustituye por sede seleccionada;
13. área del turno no se sustituye por área seleccionada;
14. rol operativo visible corresponde al catálogo canónico;
15. descanso publicado se distingue de un día sin programación;
16. una notificación atrasada abre la programación actual y no revive una revisión anterior;
17. una caché stale no autoriza una acción posterior;
18. trabajador solo consulta su programación personal permitida;
19. vista de sede exige autorización territorial real;
20. actor sin alcance suficiente no obtiene turnos de terceros;
21. la vista territorial permanece de solo lectura respecto de propiedad de VISO;
22. una capacidad administrativa expuesta desde ANIMA usa el contrato/servicio de VISO;
23. un intento de edición directa de programación desde ANIMA no forma parte del contrato conforme;
24. cambio de actor invalida la proyección personal anterior;
25. la acción posterior de asistencia puede correlacionar `shift_id` y revisión sin depender de lo renderizado.

---

#### 41. Criterios de aceptación documental

`INT-WORK-002` queda documentalmente completa cuando se cumplen simultáneamente:

1. VISO permanece como propietaria única de la programación.
2. ANIMA queda definida como consumidora y superficie personal.
3. la unidad presentada es `shift_id + revisión publicada autoritativa`.
4. los campos internos necesarios y los campos visibles quedan diferenciados.
5. turno actual, siguiente, semana, historial, descanso y cancelación quedan definidos sin crear fuentes alternativas.
6. presentación, check-in, asistencia, contexto y autorización permanecen separados.
7. la zona horaria autoritativa gobierna la clasificación temporal.
8. un error de lectura no se degrada a ausencia de turnos.
9. una revisión ambigua falla cerrada para la selección automática.
10. las notificaciones sirven para comunicación y navegación, no como fuente.
11. la vista territorial exige autoridad y minimización.
12. la administración eventual desde ANIMA debe invocar VISO y no escribir como propietaria.
13. las mutaciones directas observadas quedan clasificadas como deriva física a corregir por tareas existentes.
14. todas las brechas observadas tienen propietario y condición de salida.
15. no se crea una definición nueva de evento.
16. no se modifica código, Supabase, datos, migraciones, RPC, RLS, colas ni configuración.
17. no se crean ni modifican requisitos de prueba.
18. `INT-WORK-003` permanece sin desarrollar.

---

#### 42. Requisitos de prueba derivados

**NO GENERA REQUISITOS DE PRUEBA.**

Justificación:

- el requisito de integración laboral vigente ya exige que VISO sea la fuente de turnos, que cada turno publicado tenga revisión estable y que ANIMA presente la revisión vigente;
- los requisitos vigentes de ANIMA ya protegen la separación entre lectura personal, semana de sede y gestión, y exigen capacidad efectiva y control de servidor para las mutaciones;
- los requisitos vigentes de autorización ya protegen coherencia del turno publicado, contexto, territorio, invalidación, frescura y evidencia correlacionable;
- las obligaciones de evitar una fuente competidora y escritura cruzada ya están protegidas por los contratos de integración aprobados;
- esta tarea especializa la presentación de esas obligaciones en ANIMA, sin introducir una capacidad empresarial nueva, nuevo permiso, nuevo proceso, nueva transición, nuevo evento, nuevo repositorio, nuevo esquema ni comportamiento físico ejecutable.

---

#### 43. Resultado de la tarea

`INT-WORK-002` queda **APROBADA** como definición documental del contrato mediante el cual ANIMA presenta la programación publicada por VISO.

Resultado consolidado:

- propietaria de programación: **VISO**;
- consumidora de presentación: **ANIMA**;
- proceso: **`VPROC-0007`**;
- unidad autoritativa: **`shift_id + revisión publicada`**;
- vista personal basada en borradores: **prohibida**;
- selección de revisión por `published_at` aislado: **prohibida**;
- escritura propietaria directa desde ANIMA: **prohibida**;
- edición in-place de publicación: **prohibida**;
- turno mostrado equivalente a check-in: **prohibido**;
- error de lectura equivalente a ausencia de programación: **prohibido**;
- vista territorial sin autoridad: **prohibida**;
- nuevas definiciones normales de evento: **0**;
- cambios físicos: **0**;
- requisitos de prueba creados o modificados: **0**.

Invariante final:

```text
VISO
→ REVISIÓN PUBLICADA AUTORITATIVA
→ PROYECCIÓN MINIMIZADA Y VERSIONADA
→ ANIMA
→ PRESENTACIÓN PERSONAL O TERRITORIAL AUTORIZADA
```

sin permitir:

```text
PRESENTACIÓN
→ PROPIEDAD
```

ni:

```text
UI ANIMA
→ MUTACIÓN DIRECTA DE PROGRAMACIÓN VISO
```

---

ÚLTIMA TAREA APROBADA

`INT-WORK-001 — Definir contrato para que VISO publique el turno`

TAREA ACTUAL APROBADA

`INT-WORK-002 — Definir contrato para que ANIMA presente el turno`

SIGUIENTE TAREA RESERVADA

`INT-WORK-003 — Definir contrato para que ANIMA registre la asistencia`


### [ ] INT-WORK-003 — Definir contrato para que ANIMA registre la asistencia
### [ ] INT-WORK-004 — Definir confirmación autoritativa del contexto efectivo en Supabase
### [ ] INT-WORK-005 — Definir consumo del contexto por SHELL y las aplicaciones
