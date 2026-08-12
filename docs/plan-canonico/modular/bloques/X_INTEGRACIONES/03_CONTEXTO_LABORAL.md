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


### ✅ INT-WORK-003 — Definir contrato para que ANIMA registre la asistencia

**Estado:** APROBADA
**Tarea anterior:** `INT-WORK-002 — Definir contrato para que ANIMA presente el turno` — APROBADA
**Tarea siguiente:** `INT-WORK-004 — Definir confirmación autoritativa del contexto efectivo en Supabase` — RESERVADA
**Tipo de tarea:** documental; definición del contrato autoritativo mediante el cual ANIMA captura, persiste, sincroniza, valida y reconcilia hechos de asistencia vinculados al trabajador, vínculo laboral, turno y revisión publicada aplicables, sin implementar esquema físico, migraciones, RPC, RLS, colas nuevas, cambios de código ni modificaciones de Supabase
**Bloque:** X — Integraciones
**Mini-bloque:** Contexto laboral
**Fase:** exclusivamente documental
**Repositorio propietario:** `vento-shell`
**Implementación física autorizada:** ninguna

---

#### 1. Objetivo

Definir de forma inequívoca qué significa que ANIMA registre asistencia dentro de Vento OS y qué condiciones deben cumplirse para que una intención de marcación se convierta en un hecho de asistencia durable, reconciliable y apto para consumo posterior.

La decisión debe preservar simultáneamente:

```text
VISO
→ GOBIERNA LA PROGRAMACIÓN PUBLICADA

ANIMA
→ GOBIERNA LOS HECHOS DE ASISTENCIA

SHELL / SUPABASE
→ RESUELVEN Y CONFIRMAN CONTEXTO BAJO SUS CONTRATOS
```

sin fusionar programación, asistencia y autorización.

La regla cardinal es:

```text
TOCAR “MARCAR”
≠
ASISTENCIA CONFIRMADA
```

También se conserva:

```text
TURNO PUBLICADO
≠
CHECK-IN
```

```text
CHECK-IN
≠
PERMISO OPERATIVO FINAL
```

```text
EVENTO ENCOLADO
≠
EVENTO CONFIRMADO POR SERVIDOR
```

```text
CORREGIR ASISTENCIA
≠
SOBRESCRIBIR EL HECHO ORIGINAL
```

---

#### 2. Resultado sustantivo

`INT-WORK-003` deja definido un contrato documental único de registro de asistencia con nueve resultados materiales:

1. ANIMA queda confirmada como aplicación propietaria de `VPROC-0008`.
2. La unidad primaria de captura queda fijada como un hecho de asistencia identificado antes del primer intento de sincronización.
3. Cada entrada, salida o descanso deberá vincularse determinísticamente con trabajador, vínculo laboral, turno y revisión publicada aplicables.
4. Se separan intención local, persistencia local, recepción server-side, validación, conciliación y presentación al trabajador.
5. Se define la semántica online y offline sin permitir que la ausencia de una ruta server-side degrade silenciosamente a una escritura alternativa no equivalente.
6. Se fijan idempotencia, concurrencia, orden, replay y resultado desconocido.
7. Se preserva la inmutabilidad del hecho original y el ciclo de corrección auditada de `VPROC-0008`.
8. Se define la frontera exacta con programación VISO y con contexto efectivo, reservado a `INT-WORK-004`.
9. Se reconciliarán las brechas observadas de ANIMA con propietarios documentales existentes, sin dejar pendientes huérfanos.

Balance documental:

| Control                                |                                                     Resultado |
| -------------------------------------- | ------------------------------------------------------------: |
| Proceso propietario                    |                                          **1 — `VPROC-0008`** |
| Aplicación propietaria                 |                                                 **1 — ANIMA** |
| Fuente propietaria de programación     |                                                  **1 — VISO** |
| Consumidoras directas de asistencia    |                                  **3 — VISO, NUMERA y SHELL** |
| Consumidoras condicionales             |                             **4 — NEXO, FOGO, ORIGO y PULSO** |
| Acciones de asistencia cubiertas       | **4 — entrada, salida, inicio de descanso y fin de descanso** |
| Definiciones normales de evento nuevas |                                                         **0** |
| Cambios físicos                        |                                                         **0** |
| Cambios en requisitos de prueba        |                                                         **0** |

---

#### 3. Decisiones canónicas preservadas

Esta tarea consume y conserva sin reinterpretar las decisiones ya aprobadas sobre programación laboral, asistencia, contexto, autorización, eventos, idempotencia y corrección.

Se preservan especialmente:

- `CAP-02.06`, con VISO como fuente administrativa de turnos y ANIMA como consumidora de programación;
- `CAP-02.07`, con ANIMA como superficie de captura y VISO como superficie posterior de revisión laboral;
- `VPROC-0007`, como proceso propietario de programación publicada;
- `VPROC-0008 — Capturar asistencia como hechos inmutables y corregirla mediante decisiones auditables`;
- la propiedad de ANIMA sobre `VPROC-0008`;
- `INT-WORK-001`, que fija la unidad de programación como `shift_id + revisión publicada`;
- `INT-WORK-002`, que obliga a ANIMA a presentar esa revisión sin convertirse en propietaria de programación;
- `AUTH-CTX-010`, que separa turno publicado y vigente de check-in;
- `AUTH-CTX-011`, que exige una sesión de check-in confirmada por servidor para construir `active_checkin_session`;
- `INT-APP-004` a `INT-APP-009`, para idempotencia, reintentos, causalidad, auditoría y recuperación;
- `INT-APP-010`, que impide escrituras cruzadas sin contrato;
- los requisitos vigentes de asistencia offline, descansos, integración laboral, contexto, invalidación y auditoría;
- la prohibición de tratar una respuesta técnica, un estado local o una cola como hecho empresarial confirmado.

Nada de esta tarea modifica la propiedad funcional de VISO sobre programación ni adelanta la confirmación autoritativa del contexto efectivo de `INT-WORK-004`.

---

#### 4. Propiedad y autoridad

La propiedad queda fijada así:

```text
VPROC-0007
→ PROPIETARIA = VISO

VPROC-0008
→ PROPIETARIA = ANIMA
```

Por tanto:

1. VISO crea, versiona y publica la programación laboral.
2. ANIMA captura y gobierna los hechos de asistencia.
3. ANIMA no crea un turno para justificar una marcación.
4. ANIMA no modifica una revisión publicada como efecto de asistencia.
5. VISO puede consumir, revisar y tramitar correcciones de asistencia únicamente bajo el contrato propietario de `VPROC-0008`.
6. VISO no mantiene un registro competidor de entrada, salida o descanso.
7. NUMERA consume resultados autorizados de asistencia para finalidades económicas posteriores, sin convertirse en propietaria del hecho.
8. SHELL consume contexto y estado derivados, sin crear asistencia.
9. NEXO, FOGO, ORIGO y PULSO solo consumen proyecciones cuando una finalidad aprobada lo exija.
10. Supabase podrá materializar persistencia, transición y resolución, pero no constituye una aplicación propietaria distinta.

Regla:

```text
QUIEN PUBLICA EL TURNO
≠
QUIEN CAPTURA LA ASISTENCIA
≠
QUIEN CONSUME EL CONTEXTO
```

---

#### 5. Vocabulario contractual

##### 5.1. Intención de marcación

Acción iniciada por un trabajador o sistema autorizado que expresa la intención de registrar entrada, salida, inicio de descanso o fin de descanso.

Todavía no demuestra que el efecto haya quedado confirmado.

##### 5.2. Evento local persistido

Representación durable en el dispositivo de una intención de asistencia que ya posee identidad estable, contenido suficiente y estado de sincronización.

Puede sobrevivir cierre o reinicio de la aplicación.

##### 5.3. Evento de asistencia recibido

Hecho recibido por la frontera autoritativa y representado en el estado inicial aprobado de `VPROC-0008`.

La recepción no confirma por sí sola validez, turno, contexto ni efecto laboral final.

##### 5.4. Evento validado

Evento cuya identidad, secuencia, actor, tiempo, relación laboral y referencias aplicables fueron comprobadas suficientemente para continuar.

##### 5.5. Evento vinculado a contexto

Evento asociado de forma inequívoca con el trabajador, vínculo, turno, revisión publicada y territorio aplicables cuando correspondan.

##### 5.6. Evento aceptado para conciliación

Evento original que superó las puertas necesarias para formar parte de la reconstrucción de asistencia.

##### 5.7. Evento reconciliado

Representación final de `VPROC-0008` en la que el hecho original y cualquier decisión de corrección aplicable quedaron vinculados al contexto correcto.

No significa por sí solo cierre de turno, cierre de nómina ni cierre del periodo laboral.

##### 5.8. Sesión de check-in

Estado derivado y confirmado por servidor que representa una entrada abierta y compatible con el turno aplicable.

No es el evento original y no concede permisos por sí solo.

##### 5.9. Jornada derivada

Resultado calculado a partir de hechos originales, reglas vigentes y correcciones aprobadas.

No sustituye los eventos que la originaron.

##### 5.10. Corrección

Decisión auditada que modifica la interpretación o resultado derivado sin sobrescribir el hecho original.

---

#### 6. Acciones de asistencia cubiertas

El contrato cubre exactamente estas familias funcionales de marcación:

| Acción             | Significado                                                 |
| ------------------ | ----------------------------------------------------------- |
| entrada            | inicio de presencia laboral asociada a la jornada aplicable |
| salida             | cierre de la presencia o sesión laboral aplicable           |
| inicio de descanso | apertura de un descanso dentro de una sesión de asistencia  |
| fin de descanso    | cierre del descanso correspondiente                         |

La implementación podrá utilizar nombres técnicos distintos, pero no podrá cambiar su semántica por conveniencia local.

Una novedad laboral, ausencia, reemplazo administrativo, corrección de programación o incidencia no se convierte automáticamente en una de estas cuatro acciones.

---

#### 7. Identidad estable de la intención

Toda intención reintentable deberá obtener una identidad estable **antes del primer envío**.

La identidad deberá:

1. ser única dentro de su dominio de asistencia;
2. permanecer igual durante retry, reconexión y replay de la misma intención;
3. no cambiar porque la aplicación se cierre o reinicie;
4. no reutilizarse para contenido materialmente distinto;
5. poder correlacionarse con el hecho persistido y el resultado recuperable;
6. permanecer separada de la identidad técnica del request, dispositivo, sesión o fila física;
7. no ser sustituida por el timestamp como mecanismo de deduplicación.

Regla:

```text
MISMA IDENTIDAD
+
MISMO CONTENIDO LÓGICO
→ MISMA INTENCIÓN
```

```text
MISMA IDENTIDAD
+
CONTENIDO MATERIALMENTE DISTINTO
→ CONFLICTO
```

---

#### 8. Contenido lógico mínimo de una intención

Antes de sincronizar una intención de asistencia deberá existir información suficiente para resolver, según la acción:

| Información                       | Obligación                                                 |
| --------------------------------- | ---------------------------------------------------------- |
| identidad estable de la intención | obligatoria                                                |
| trabajador                        | obligatorio                                                |
| vínculo laboral aplicable         | resoluble server-side                                      |
| tipo de acción                    | obligatorio                                                |
| instante real de ocurrencia       | obligatorio                                                |
| fuente o dispositivo              | obligatorio cuando aplique                                 |
| turno                             | obligatorio cuando la acción dependa de turno              |
| revisión publicada                | obligatoria para vinculación determinista con programación |
| sede                              | obligatoria cuando la acción dependa de territorio         |
| área                              | cuando el turno o rol la requieran                         |
| rol operativo                     | cuando el contrato operativo lo requiera                   |
| sesión de asistencia previa       | obligatoria para salida y descansos cuando corresponda     |
| geolocalización                   | cuando la política de marcación la exija                   |
| precisión de ubicación            | cuando se use geolocalización                              |
| momento de captura offline        | cuando aplique                                             |
| evidencia adicional               | cuando una excepción o corrección la requiera              |
| versión contractual               | resoluble en la frontera autoritativa                      |

Esta tabla define información lógica, no nombres de columnas físicas.

---

#### 9. `occurred_at` y tiempo de recepción

El instante en que ocurrió la marcación y el instante en que el servidor la recibió son conceptos distintos.

Reglas:

1. `occurred_at` representa el instante declarado y validado de ocurrencia.
2. la recepción posterior no reemplaza `occurred_at`.
3. una marcación offline conserva su tiempo original aun si sincroniza horas después.
4. el servidor deberá evaluar plausibilidad, orden y reglas aplicables sin reescribir el instante original por conveniencia.
5. la fecha del dispositivo no se acepta ciegamente como autoridad final.
6. cualquier corrección temporal posterior queda auditada y no altera silenciosamente el evento original.
7. la zona horaria necesaria para interpretar programación procede del contrato del turno y no de una inferencia local libre.

---

#### 10. Vinculación determinista con trabajador y vínculo laboral

Cada hecho de asistencia deberá quedar asociado al trabajador exacto y al vínculo laboral aplicable.

No podrá resolverse por:

- nombre visible;
- correo mostrado;
- último empleado activo en el dispositivo;
- usuario técnico del dispositivo;
- fila de asistencia previa de otra persona;
- rol compartido;
- sede seleccionada;
- turno de un tercero;
- perfil cacheado no revalidado.

Un trabajador retirado, vínculo terminado o identidad ambigua no se vuelve elegible por poseer una intención offline pendiente.

La sincronización deberá revalidar la autoridad vigente sin borrar la evidencia de que el evento fue capturado anteriormente.

---

#### 11. Vinculación determinista con `shift_id + revisión publicada`

La asistencia debe poder reconstruirse contra la programación exacta que le corresponde.

La referencia contractual es:

```text
TRABAJADOR
+
VÍNCULO
+
SHIFT_ID
+
REVISIÓN PUBLICADA APLICABLE
+
ACCIÓN
+
OCCURRED_AT
→ EVENTO DE ASISTENCIA CONTEXTUALIZABLE
```

Reglas:

1. mostrar un turno en ANIMA no basta para fijar la referencia autoritativa.
2. el servidor deberá resolver o verificar el turno y la revisión aplicables.
3. una revisión en borrador no puede recibir asistencia como si fuera publicada.
4. una revisión sustituida no se selecciona por ser la última fila cacheada.
5. una revisión futura no reescribe eventos históricos.
6. una nueva revisión publicada no modifica automáticamente una entrada ya confirmada contra otra revisión.
7. un evento offline se reconcilia con la revisión realmente aplicable al hecho, no con la revisión que casualmente esté visible al sincronizar.
8. si la revisión no puede resolverse sin ambigüedad, el evento no se confirma por inferencia.
9. una selección del cliente no puede fabricar la revisión autoritativa.
10. turno y revisión deben conservarse en la trazabilidad aunque proyecciones posteriores minimicen campos.

---

#### 12. Separación entre turno vigente y turno elegible para marcar

La existencia de un turno publicado y vigente no implica automáticamente que toda marcación sea válida.

La frontera deberá distinguir:

```text
TURNO PUBLICADO Y VIGENTE
```

```text
TURNO ELEGIBLE PARA LA ACCIÓN DE MARCACIÓN
```

```text
SESIÓN DE CHECK-IN ACTIVA
```

No se inventan en esta tarea tolerancias cuantitativas de entrada, salida o descanso.

Las ventanas y políticas temporales exactas permanecen bajo sus propietarios funcionales y deberán ser versionadas antes de materializarse.

---

#### 13. Contrato de entrada

Una entrada válida deberá poder demostrar, como mínimo:

1. trabajador identificable y activo;
2. vínculo laboral compatible;
3. intención con identidad estable;
4. acción de entrada inequívoca;
5. `occurred_at` válido;
6. turno y revisión publicada aplicables;
7. sede del turno;
8. área cuando corresponda;
9. rol operativo requerido cuando corresponda;
10. fuente o dispositivo identificable según política;
11. ubicación o evidencia física cuando la política la requiera;
12. ausencia de otra entrada incompatible ya confirmada;
13. autoridad y contexto suficientes para registrar el hecho;
14. idempotencia y secuencia coherentes;
15. posibilidad de reconstrucción auditada.

La confirmación del evento no se deriva únicamente de que el cliente haya recibido una respuesta HTTP exitosa.

---

#### 14. Contrato de salida

Una salida deberá cerrar la sesión de asistencia correcta sin fabricar una nueva sesión.

Reglas:

1. deberá vincularse al trabajador y sesión abiertos correspondientes;
2. conservará el mismo turno y revisión aplicables a la sesión, salvo una decisión autoritativa explícita que demuestre otra relación;
3. no escogerá una sesión por “última entrada” cuando existan varias candidatas o ambigüedad;
4. no cerrará una sesión de otro trabajador;
5. no cerrará una sesión ya cerrada como un segundo efecto;
6. un replay de la misma intención devolverá el resultado ya determinado;
7. un evento de salida capturado offline conservará su instante original;
8. la expiración temporal del turno no autoriza a desligar la salida de la sesión que realmente se abrió;
9. el check-out confirmado podrá participar posteriormente en el cierre del contexto, cuya confirmación integral pertenece a `INT-WORK-004`;
10. una salida rechazada o pendiente no deberá presentarse como sesión cerrada.

---

#### 15. Contrato de inicio de descanso

Un inicio de descanso deberá operar sobre una sesión de asistencia abierta, exacta y compatible.

Reglas:

1. identifica la sesión afectada;
2. conserva trabajador, turno y revisión;
3. no crea una segunda sesión de asistencia;
4. no cierra autorización operativa por sí solo;
5. no permite dos descansos incompatibles abiertos por replay o concurrencia;
6. conserva identidad idempotente propia de la intención de descanso;
7. un retry no genera un descanso adicional;
8. una acción contra sesión cerrada o incompatible no se aplica por fallback;
9. el resultado debe ser recuperable después de timeout;
10. el hecho original permanece auditable.

---

#### 16. Contrato de fin de descanso

Un fin de descanso deberá cerrar exactamente el descanso abierto correspondiente.

Reglas:

1. no elige arbitrariamente entre varios descansos;
2. no cierra un descanso de otra sesión;
3. no crea un descanso si no existe uno válido que cerrar;
4. preserva la identidad de la intención;
5. replay de la misma intención no produce un segundo cierre;
6. intención con misma identidad y contenido diferente produce conflicto;
7. conserva el instante real de ocurrencia;
8. no convierte descanso terminado en check-out;
9. no modifica programación;
10. queda correlacionado con la sesión de asistencia y el turno/revisión aplicables.

---

#### 17. Puertas mínimas antes de confirmar un hecho

Toda acción deberá evaluarse en la frontera autoritativa con las puertas aplicables.

| Puerta        | Condición                                                 |
| ------------- | --------------------------------------------------------- |
| identidad     | principal y actor efectivos resolubles                    |
| trabajador    | empleado exacto y estado laboral válido                   |
| vínculo       | vínculo aplicable a la acción y al tiempo                 |
| acción        | tipo permitido y coherente con el estado actual           |
| intención     | identidad estable y contenido compatible                  |
| turno         | turno aplicable resoluble                                 |
| revisión      | revisión publicada exacta resoluble                       |
| sede          | territorio compatible con turno y acción                  |
| área          | compatible cuando sea requerida                           |
| rol operativo | válido cuando sea requerido                               |
| sesión previa | exacta para salida y descansos                            |
| ubicación     | satisfecha cuando la política la exija                    |
| secuencia     | transición posible frente al estado actual                |
| idempotencia  | no existe colisión material                               |
| concurrencia  | no existe una transición incompatible ya confirmada       |
| frescura      | referencias de autorización y contexto no están obsoletas |
| auditoría     | decisión correlacionable                                  |

Una puerta aplicable desconocida, ambigua o contradictoria no se interpreta como satisfecha.

---

#### 18. Fallo cerrado

Regla:

```text
CONTEXTO NECESARIO NO RESOLUBLE
→ NO CONFIRMAR EL EFECTO
```

No se permite:

- seleccionar la primera coincidencia;
- usar la última marcación local como verdad;
- asumir que `null` significa cualquier sede o área;
- completar turno desde una tarjeta visible;
- completar rol desde el perfil base;
- escoger revisión por timestamp aproximado;
- convertir un error técnico en confirmación optimista;
- insertar por otra vía únicamente porque una RPC no está disponible;
- omitir una identidad idempotente porque una columna o contrato físico no la soporte;
- presentar error de servidor como lista vacía o jornada sin eventos.

---

#### 19. Persistencia durable antes de mostrar “encolado”

En modo offline o conectividad incierta, ANIMA solo podrá presentar una intención como encolada después de confirmar su persistencia durable en el dispositivo.

La secuencia contractual es:

```text
GENERAR IDENTIDAD ESTABLE
→ CONSTRUIR CONTENIDO
→ PERSISTIR LOCALMENTE
→ CONFIRMAR PERSISTENCIA LOCAL
→ MOSTRAR ESTADO ENCOLADO
```

No:

```text
TOCAR BOTÓN
→ MOSTRAR ENCOLADO
→ INTENTAR PERSISTIR DESPUÉS
```

Si la persistencia local falla, la interfaz no debe afirmar que la marcación está protegida para sincronización posterior.

---

#### 20. Cola offline

La cola deberá conservar, como mínimo, por intención:

- identidad estable;
- acción;
- trabajador;
- vínculo o información suficiente para resolverlo;
- turno;
- revisión publicada aplicable o información suficiente para comprobarla sin inferencia;
- sesión relacionada cuando corresponda;
- instante de ocurrencia;
- instante de captura offline cuando aplique;
- sede;
- área y rol cuando correspondan;
- geolocalización y precisión cuando apliquen;
- fuente o dispositivo;
- estado de sincronización;
- número o historia suficiente de intentos para gobernar retry;
- último resultado o error clasificable;
- versión contractual necesaria para interpretar el contenido.

La tarea no fija un formato físico de almacenamiento local.

---

#### 21. Estados de experiencia offline

La experiencia deberá distinguir conceptualmente:

1. intención aún no persistida;
2. persistida y pendiente de sincronización;
3. sincronizando;
4. confirmada por servidor;
5. requiere atención por conflicto;
6. fallo temporal con retry posible;
7. rechazo definitivo o incompatibilidad que exige intervención;
8. resultado desconocido que exige recuperar estado antes de repetir.

Ninguno de estos estados puede presentarse como asistencia confirmada salvo cuando exista confirmación autoritativa.

---

#### 22. Reautorización al sincronizar

Una intención capturada offline no conserva indefinidamente la autoridad observada al crearla.

Al sincronizar deberá revalidarse, según aplique:

- identidad y estado del trabajador;
- vínculo laboral;
- turno y revisión;
- sede y área;
- rol operativo;
- estado de la sesión de asistencia;
- cambios de programación;
- reemplazos;
- cancelaciones;
- revocaciones;
- estado del dispositivo;
- política de ubicación;
- secuencia y concurrencia;
- reglas de autorización vigentes.

La reautorización no borra el evento local ni cambia su `occurred_at`; determina si puede producir efecto autoritativo y cómo debe reconciliarse.

---

#### 23. Idempotencia

Cada intención reintentable conserva una identidad idempotente estable.

Reglas:

1. mismo identificador y mismo contenido lógico producen como máximo un efecto empresarial;
2. mismo identificador y contenido materialmente distinto producen conflicto;
3. una respuesta perdida no autoriza a crear una intención nueva por conveniencia;
4. antes de repetir después de timeout se intenta recuperar el resultado;
5. la deduplicación no depende únicamente de timestamp, trabajador y tipo;
6. la eliminación local prematura de una intención no debe volver imposible recuperar un resultado ya confirmado;
7. entrada, salida, inicio de descanso y fin de descanso poseen intenciones distinguibles;
8. una clave de programación no se reutiliza como clave universal de asistencia;
9. una clave de asistencia no se reutiliza para contexto, notificación o corrección;
10. la idempotencia deberá ser enforceable en la frontera autoritativa, no solo en memoria del cliente.

---

#### 24. Resultado desconocido

Un timeout, corte de red o cierre de aplicación puede ocurrir después del commit autoritativo pero antes de que el cliente reciba la respuesta.

Regla:

```text
RESULTADO DESCONOCIDO
→ RECUPERAR ESTADO
→ NO REPETIR A CIEGAS
```

El sistema deberá distinguir:

- operación no enviada;
- operación recibida pero no confirmada al cliente;
- operación aplicada;
- operación duplicada idempotentemente;
- operación en conflicto;
- operación rechazada;
- operación pendiente de conciliación.

La interfaz no decide el resultado por ausencia de respuesta.

---

#### 25. Concurrencia y múltiples dispositivos

Dos dispositivos o sesiones pueden intentar afectar la misma jornada.

El contrato deberá impedir que carreras produzcan:

- dos entradas simultáneas incompatibles;
- dos salidas para una misma sesión;
- dos descansos abiertos incompatibles;
- cierre del descanso equivocado;
- una salida ligada a la entrada de otro dispositivo o trabajador;
- dos eventos originales creados para una sola intención;
- una corrección que sobrescriba un hecho concurrentemente;
- selección arbitraria por “última escritura gana”.

La decisión autoritativa debe validar el estado relevante inmediatamente antes del commit.

---

#### 26. Orden de eventos

La red puede entregar eventos fuera de orden.

Reglas:

1. orden de llegada no equivale a orden de ocurrencia;
2. `occurred_at` debe conservarse y validarse;
3. una salida llegada antes que la entrada correspondiente no se aplica ciegamente como sesión nueva;
4. un fin de descanso llegado antes del inicio correspondiente requiere conciliación;
5. la reconciliación puede esperar información faltante sin reescribir el evento original;
6. eventos tardíos conservan causalidad e identidad;
7. una corrección posterior no altera la identidad del hecho original;
8. el orden derivado de la jornada se reconstruye con reglas versionadas y evidencia, no con el orden físico de inserción.

---

#### 27. Turnos cruzados de medianoche

Un turno overnight se interpreta por instantes reales y zona horaria contractual, no por igualdad de fecha civil.

Reglas:

1. una entrada antes de medianoche y salida después de medianoche pueden pertenecer al mismo turno y revisión;
2. cambiar de fecha no crea otra jornada por sí solo;
3. la salida debe cerrar la sesión correcta;
4. un filtro diario no puede cortar la semántica del turno;
5. la cola offline conserva los instantes completos;
6. la conciliación no reasigna automáticamente la salida al “turno de hoy”;
7. no se inventan tolerancias adicionales en esta tarea.

---

#### 28. Cambios de turno después de capturar asistencia

La programación puede cambiar después de que exista un evento de asistencia.

Reglas:

1. una revisión posterior no reescribe el evento ya confirmado;
2. el evento conserva la referencia a la revisión contra la que fue aceptado;
3. una corrección de programación no se propaga como edición destructiva de asistencia;
4. si una revisión nueva invalida contexto futuro, los consumidores deberán revalidar;
5. una intención offline todavía no confirmada deberá evaluarse contra la historia y reglas aplicables al hecho, no solamente contra la revisión visible en el momento de sincronización;
6. una ambigüedad real se reconcilia; no se resuelve por conveniencia de UI.

---

#### 29. Reemplazos de turno

Un reemplazo administrativo no permite asumir que el trabajador sustituto hereda automáticamente una sesión o evento del trabajador original.

Debe conservarse:

- turno original y revisión;
- decisión de reemplazo;
- nueva revisión publicada cuando corresponda;
- trabajador aplicable a cada evento;
- vínculo laboral de cada actor;
- causalidad entre cambio de programación y asistencia posterior;
- historia de los eventos ya ocurridos.

Una marcación anterior al reemplazo no cambia de trabajador por edición posterior de programación.

---

#### 30. Ausencia de turno

La ausencia de un turno aplicable no debe resolverse inventando programación.

El contrato distinguirá:

- no existe turno publicado;
- existe turno publicado pero no es aplicable a la acción;
- existe ambigüedad entre revisiones;
- existe información insuficiente;
- existe excepción laboral que requiere tratamiento específico;
- existe indisponibilidad técnica para resolver el turno.

Una marcación sin turno válido podrá entrar en tratamiento de excepción o conciliación únicamente cuando el proceso aprobado lo permita; nunca crea un turno por inferencia.

---

#### 31. Falta de permiso y falta de turno

La experiencia y la auditoría deben mantener separadas las causas.

```text
NO HAY TURNO APLICABLE
≠
NO HAY PERMISO
```

```text
TURNO AMBIGUO
≠
FALLO DE RED
```

```text
UBICACIÓN NO VÁLIDA
≠
TRABAJADOR INACTIVO
```

La capa cliente puede mostrar mensajes seguros, pero la razón autoritativa se determina en servidor.

---

#### 32. Sede y geolocalización

La sede del turno sigue siendo la referencia territorial de programación.

La geolocalización es evidencia de presencia física cuando la política la exige.

Por tanto:

```text
GPS
≠
SEDE DEL TURNO
```

```text
PUNTO DE CHECK-IN
≠
PROPIEDAD FUNCIONAL DEL TURNO
```

Reglas:

1. una ubicación cercana no crea elegibilidad laboral;
2. una ubicación fuera de política no cambia la sede del turno;
3. el cliente no puede enviar otra sede para reparar una incompatibilidad;
4. la precisión y disponibilidad de geolocalización deberán tratarse según política;
5. una excepción controlada conserva razón y evidencia;
6. la evidencia física se minimiza y protege como dato laboral restringido.

---

#### 33. Área y rol operativo

Cuando la acción requiera área o rol operativo:

1. el área procede del turno o contexto autoritativo aplicable;
2. el rol operativo procede de la programación/contexto, no del rol base;
3. área debe pertenecer a la sede correspondiente;
4. rol debe ser compatible con sede y área según las reglas vigentes;
5. ausencia de área solo es válida cuando el contrato del rol lo permita;
6. `null` no significa toda la sede;
7. un valor enviado por cliente no amplía autoridad;
8. un cambio de rol o área invalida decisiones stale y exige revalidación.

---

#### 34. Dispositivo y fuente de captura

El hecho deberá poder atribuir su fuente cuando el contrato la requiera.

La identidad técnica del dispositivo no sustituye al trabajador.

Debe mantenerse separado:

```text
PRINCIPAL TÉCNICO
≠
DISPOSITIVO
≠
ACTOR HUMANO
≠
SESIÓN PERSONAL
≠
EVENTO DE ASISTENCIA
```

Una reinstalación, cambio de dispositivo o replay desde otra sesión no altera la identidad empresarial de una intención ya creada.

---

#### 35. Sesión de check-in y contexto efectivo

`INT-WORK-003` define el hecho de asistencia que puede originar o cerrar una sesión de check-in.

No define todavía la confirmación integral del contexto efectivo.

La frontera es:

```text
EVENTO DE ENTRADA CONFIRMADO
→ PUEDE PRODUCIR SESIÓN DE CHECK-IN AUTORITATIVA
→ INT-WORK-004 CONFIRMA CONTEXTO EFECTIVO
```

```text
EVENTO DE SALIDA CONFIRMADO
→ PUEDE CERRAR SESIÓN DE CHECK-IN
→ INT-WORK-004 CONFIRMA INVALIDACIÓN DEL CONTEXTO EFECTIVO
```

Una intención local, una cola o una respuesta optimista no puede crear `active_checkin_session`.

---

#### 36. Descansos y autorización

Un descanso es un hecho de asistencia asociado a una sesión abierta.

Por sí solo:

- no cambia el turno publicado;
- no reasigna sede;
- no reasigna área;
- no cambia rol operativo;
- no cierra la sesión de check-in;
- no elimina permisos operativos por inferencia.

La política de qué capacidades permanecen habilitadas durante descanso pertenece a los contratos de contexto/autorización correspondientes y no se redefine aquí.

---

#### 37. Correcciones de asistencia

El hecho original es inmutable.

Toda corrección deberá conservar:

- solicitud de corrección;
- evento original afectado;
- evidencia de soporte;
- actor que solicita;
- autoridad que revisa y decide;
- estado anterior derivado;
- estado posterior derivado;
- motivo;
- timestamps relevantes;
- turno y revisión relacionados;
- impactos sobre jornada, contexto, métricas y consumidores;
- versión de reglas aplicada;
- auditoría.

Regla:

```text
CORRECCIÓN
→ NUEVA DECISIÓN / REPRESENTACIÓN DERIVADA
→ HECHO ORIGINAL PRESERVADO
```

No:

```text
UPDATE SILENCIOSO DEL EVENTO ORIGINAL
```

---

#### 38. `CANCEL`, `VOID`, `REVERSE` y `CORRECT`

Se preservan las acciones aprobadas de `VPROC-0008`.

##### 38.1. `CANCEL`

Cancela el procesamiento de un evento todavía pendiente cuando la transición aplicable lo permita.

No borra evidencia de la intención.

##### 38.2. `VOID`

Invalida un evento duplicado o técnicamente inválido preservando la fila o referencia original y la razón.

No convierte un hecho válido ya ejecutado en inexistente.

##### 38.3. `REVERSE`

Revierte efectos derivados cuando sea necesario sin borrar el evento original.

##### 38.4. `CORRECT`

Crea una decisión de corrección auditable con antes, después, evidencia, autoridad y propagación controlada.

---

#### 39. Jornada derivada y horas trabajadas

La jornada calculada es una proyección derivada.

No se acepta como entrada autoritativa un número de horas enviado por cliente.

La derivación deberá poder reconstruirse desde:

- eventos originales;
- orden y causalidad;
- turno y revisión;
- reglas de descansos;
- correcciones aprobadas;
- versión de reglas;
- excepciones reconciliadas.

Una corrección de horas no sustituye el historial de eventos que justificó el cálculo anterior.

---

#### 40. Estados canónicos de `VPROC-0008`

La tarea conserva los estados ya aprobados:

```text
ATTENDANCE_EVENT_RECEIVED
→ VALIDATION_IN_PROGRESS
→ MATCHED_TO_CONTEXT
→ ACCEPTED_FOR_RECONCILIATION
→ ATTENDANCE_EVENT_RECONCILED
```

Cuando existe corrección:

```text
ACCEPTED_FOR_RECONCILIATION
→ CORRECTION_UNDER_REVIEW
→ CORRECTION_APPROVED
→ ACCEPTED_FOR_RECONCILIATION
→ ATTENDANCE_EVENT_RECONCILED
```

No se crea un estado nuevo por conveniencia de implementación.

Los estados locales de la cola son estados técnicos de sincronización y no reemplazan el ciclo empresarial.

---

#### 41. Excepciones canónicas de `VPROC-0008`

Se preservan las familias aprobadas:

- `QUARANTINE`, para eventos observados que no pueden continuar de forma segura;
- `REQUEST_INFO`, para solicitar corroboración cuando falte evidencia;
- `ESCALATE`, para anomalías que requieren autoridad o revisión;
- `REOPEN`, para reabrir una conciliación vinculada cuando nueva evidencia lo justifique.

El uso de estas excepciones no autoriza a reescribir el evento original.

---

#### 42. Eventos empresariales existentes

`INT-WORK-003` no crea nuevas definiciones normales de evento.

Se conservan las definiciones ya aprobadas de `VPROC-0008` para:

1. evento de asistencia recibido;
2. validación iniciada;
3. evento aceptado para conciliación;
4. corrección aprobada;
5. evento de asistencia reconciliado.

Toda materialización futura deberá reutilizar esas identidades y su sobre empresarial versionado.

Un ACK técnico, retry, almacenamiento local o actualización visual no crea por sí solo otra definición empresarial.

---

#### 43. Consumidoras y proyecciones

Las consumidoras heredadas se mantienen así:

| Consumidora | Finalidad contractual                                                |
| ----------- | -------------------------------------------------------------------- |
| VISO        | revisión administrativa, correcciones y gestión laboral autorizada   |
| NUMERA      | efectos económicos posteriores que requieran asistencia reconciliada |
| SHELL       | contexto, acceso y continuidad compartida donde corresponda          |
| NEXO        | consumo condicional de contexto operativo aprobado                   |
| FOGO        | consumo condicional de contexto operativo aprobado                   |
| ORIGO       | consumo condicional de contexto operativo aprobado                   |
| PULSO       | consumo condicional de contexto operativo aprobado                   |

Las proyecciones deberán minimizar datos y no entregar evidencia personal innecesaria.

Una consumidora no podrá corregir el hecho propietario mediante escritura directa sobre la fuente de ANIMA.

---

#### 44. Privacidad y minimización

La asistencia es información laboral restringida.

Reglas:

1. cada consumidora recibe únicamente lo necesario para su finalidad;
2. geolocalización exacta no se propaga por defecto;
3. datos del dispositivo se minimizan en proyecciones;
4. notas y evidencia de corrección no se exponen a consumidoras sin necesidad;
5. logs no duplican payload sensible por defecto;
6. exportaciones requieren autoridad y finalidad;
7. un supervisor territorial no obtiene historia global por consumir asistencia;
8. el trabajador puede consultar su información permitida sin acceder a la de terceros;
9. los eventos empresariales conservan sensibilidad laboral restringida;
10. auditoría y observabilidad usan referencias cuando sea suficiente.

---

#### 45. Auditoría mínima

Debe poder reconstruirse, cuando aplique:

- proceso `VPROC-0008`;
- identidad del evento original;
- trabajador;
- vínculo laboral;
- acción;
- `occurred_at`;
- instante de recepción;
- turno;
- revisión publicada;
- sesión de asistencia;
- sede;
- área;
- rol operativo;
- fuente o dispositivo;
- evidencia de ubicación cuando aplique;
- identidad idempotente;
- intentos y resultado recuperado;
- decisión de validación;
- excepción o cuarentena;
- corrección;
- aprobador;
- resultado reconciliado;
- correlación con contexto posterior;
- versión contractual.

La auditoría no sustituye la persistencia del hecho empresarial.

---

#### 46. Métricas preservadas

La tarea no crea métricas nuevas.

Se conservan las métricas de `VPROC-0008` orientadas a:

- jornadas conciliadas con asistencia completa;
- marcaciones válidas aceptadas en el primer intento;
- antigüedad de jornadas abiertas o eventos offline pendientes;
- guardrail de correcciones no autorizadas, duplicados y rechazos injustificados por contexto.

Las métricas no cambian el estado del hecho ni constituyen fuente de verdad.

---

#### 47. Frontera con VISO y `VPROC-0007`

VISO gobierna la programación; ANIMA gobierna asistencia.

Por tanto:

```text
VISO PUBLICA TURNO
→ ANIMA RESUELVE ESA PROGRAMACIÓN PARA MARCAR
→ ANIMA REGISTRA HECHO DE ASISTENCIA
```

No:

```text
ANIMA MARCA
→ CREA O EDITA EL TURNO
```

Una corrección de asistencia tampoco corrige programación.

Si el problema real está en el turno, debe seguir el ciclo propietario de programación.

---

#### 48. Frontera con novedades y `VPROC-0009`

Programación, asistencia y novedad laboral permanecen como procesos distintos.

Una ausencia, novedad o incidencia:

- puede explicar una anomalía de asistencia;
- puede generar una solicitud de corrección;
- puede afectar decisiones posteriores;

pero no sustituye el evento original ni se convierte automáticamente en entrada o salida.

Una asistencia sin turno válido no crea por inferencia una novedad ni un turno.

---

#### 49. Frontera con `INT-WORK-004`

`INT-WORK-003` termina en la producción y conciliación de hechos de asistencia suficientemente autoritativos para ser consumidos por el contexto.

`INT-WORK-004` será propietaria documental de confirmar el contexto efectivo en Supabase.

Por tanto esta tarea no define:

- esquema físico final de `AccessContext`;
- RPC final de resolución;
- RLS final;
- triggers;
- caché o invalidación física;
- token derivado;
- contrato de sesión materializado;
- mecanismo físico de actualización del contexto.

Sí fija la precondición:

```text
CONTEXTO EFECTIVO
NO PUEDE BASARSE EN UNA MARCACIÓN
QUE NO HAYA SIDO CONFIRMADA BAJO ESTE CONTRATO
```

---

#### 50. Frontera con SHELL

SHELL no registra asistencia.

Podrá consumir hechos o contexto derivados únicamente mediante contratos aprobados.

SHELL no podrá:

- fabricar un check-in;
- cerrar una sesión por navegación;
- aceptar una intención offline como confirmada;
- recalcular una revisión de turno distinta a la usada por ANIMA;
- restaurar permisos porque apareció una marcación tardía;
- corregir asistencia por escritura directa.

El consumo transversal del contexto permanece reservado a `INT-WORK-005`.

---

#### 51. Reconciliación con la implementación observada de ANIMA

La implementación actual acredita capacidades reales, pero no sustituye el contrato objetivo.

| Superficie observada          | Evidencia actual                                                                                                                                  | Lectura contractual                                                                                                                          |
| ----------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------- | -------------------------------------------------------------------------------------------------------------------------------------------- |
| proveedor de asistencia       | ANIMA centraliza el estado mediante su contexto de asistencia                                                                                     | confirma una superficie propietaria real en ANIMA                                                                                            |
| resolución de turno al entrar | la captura intenta resolver contexto operativo y turno antes de registrar entrada                                                                 | evidencia parcial de la puerta de turno; no acredita por sí sola revisión publicada explícita                                                |
| identidad de evento           | existe generación de `clientEventId` para intenciones reintentables                                                                               | converge con la identidad estable requerida                                                                                                  |
| cola durable                  | existe persistencia local en almacenamiento del dispositivo con estados de sincronización                                                         | converge parcialmente con captura offline durable                                                                                            |
| sincronización ordinaria      | entrada y salida utilizan una frontera `sync_attendance_events` cuando está disponible                                                            | superficie compatible con sincronización propietaria, pendiente de certificación server-side                                                 |
| fallback de sincronización    | ante incompatibilidad de esquema o disponibilidad contractual, la implementación observada puede intentar una escritura alternativa de asistencia | no satisface el contrato si la vía alternativa no demuestra la misma identidad, autorización, idempotencia, revisión y resultado recuperable |
| compatibilidad de identidad   | la vía alternativa observada puede reintentar sin `client_event_id` cuando el almacenamiento físico no lo admite                                  | incompatible con la obligación de identidad estable en la frontera autoritativa                                                              |
| descansos                     | las intenciones de descanso llegan a RPC específicas y conservan `clientEventId` dentro de notas de contexto                                      | la firma observada no demuestra que esa identidad opere como clave de idempotencia server-side                                               |
| turno en payload              | las intenciones observadas conservan `shiftId`                                                                                                    | no acredita referencia explícita de revisión publicada en el contrato transmitido                                                            |
| estados de cola               | se distinguen pendiente, sincronizando, fallo y conflicto                                                                                         | útiles para UX; no sustituyen estados empresariales de `VPROC-0008`                                                                          |

Esta tarea no modifica esa implementación.

---

#### 52. Brechas físicas observadas y propietarios

Ninguna brecha queda sin dueño documental.

| Brecha observada                                                                                                                               | Propietario existente                                                                  | Condición de salida                                                                                                                                 |
| ---------------------------------------------------------------------------------------------------------------------------------------------- | -------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------- |
| la intención de asistencia observada transporta `shiftId` pero no acredita una identidad explícita de revisión publicada                       | `ANIMA-AUTH-001`, `ANIMA-AUTH-008`, `ANIMA-AUTH-012`, `ANIMA-AUTH-013`                 | toda entrada, salida y descanso queda vinculada determinísticamente a turno y revisión aplicables antes de confirmarse                              |
| el fallback de sincronización puede degradar a escritura alternativa cuando no está disponible el contrato server-side principal               | `ANIMA-AUTH-014`, `ANIMA-AUTH-015`, `QUEUE-ARC-003`, `QUEUE-ARC-009`, `NFR-REQ-004`    | toda ruta normal, retry y recuperación conserva paridad demostrable de identidad, autorización, idempotencia, auditoría y resultado o falla cerrado |
| la vía alternativa puede omitir `client_event_id` ante incompatibilidad física                                                                 | `ANIMA-AUTH-014`, `ANIMA-AUTH-015`, `SUPA-TRANS-006`                                   | ninguna intención reintentable produce efecto sin identidad idempotente estable y recuperable                                                       |
| descansos conservan la identidad de intención dentro de notas, pero la firma observada no acredita deduplicación server-side por esa identidad | `ANIMA-AUTH-010`, `ANIMA-AUTH-014`, `ANIMA-AUTH-015`, `QUEUE-ARC-003`, `QUEUE-ARC-009` | inicio y fin de descanso son atómicos e idempotentes y soportan replay, concurrencia y resultado perdido sin efecto duplicado                       |
| la implementación cliente no acredita por sí sola toda la semántica server-side de conciliación, corrección e historia                         | propietarios de `VPROC-0008` en E2 y paquete E5 de ANIMA                               | implementación futura demuestra estados, excepciones, corrección inmutable, auditoría y proyecciones conforme al proceso aprobado                   |
| el contexto posterior a entrada/salida no se certifica en esta tarea                                                                           | `INT-WORK-004 — Definir confirmación autoritativa del contexto efectivo en Supabase`   | el contexto converge con turno, revisión, sesión confirmada, territorio, rol y frescura sin autoridad derivada del cliente                          |
| el consumo transversal del contexto no se certifica en esta tarea                                                                              | `INT-WORK-005 — Definir consumo del contexto por SHELL y las aplicaciones`             | consumidoras usan un contexto compartido y no reconstruyen asistencia o turno por cuenta propia                                                     |

---

#### 53. Cobertura de requisitos de prueba vigente

El comportamiento definido por `INT-WORK-003` ya se encuentra protegido por requisitos vigentes, entre ellos:

- `TREQ-INTEGRATION-007`, para el contrato laboral único entre programación, asistencia, contexto y Supabase;
- `TREQ-INTEGRATION-003`, para identidad estable, contenido lógico, retry, resultado recuperable y deduplicación;
- `TREQ-ANIMA-003`, para persistencia durable offline, replay e identidad estable de marcación;
- `TREQ-ANIMA-004`, para descansos atómicos, concurrentes e idempotentes;
- `TREQ-AUTH-008`, para la separación entre capacidad administrativa y capacidad operativa con turno/check-in;
- `TREQ-AUTH-009`, para resolución territorial determinista;
- `TREQ-AUTH-014`, para invalidación y reautorización ante cambios y sincronización offline;
- `TREQ-AUTH-015`, para auditoría correlacionable de decisiones y acciones protegidas.

Esta tarea especializa esas obligaciones en la frontera de registro de asistencia sin introducir una superficie ejecutable nueva.

---

#### 54. Prohibiciones

Queda prohibido considerar conforme a este contrato cualquiera de los siguientes atajos:

1. considerar el toque del botón como asistencia confirmada;
2. considerar una intención en memoria como evento durable;
3. mostrar “encolado” antes de persistir localmente;
4. generar una nueva identidad en cada retry;
5. reutilizar la misma identidad con contenido diferente;
6. deduplicar únicamente por timestamp;
7. asumir que timeout significa fallo y repetir a ciegas;
8. asumir que timeout significa éxito sin recuperar resultado;
9. insertar por una vía alternativa sin demostrar paridad contractual;
10. omitir identidad idempotente porque una columna no exista;
11. aceptar una revisión de turno elegida por cliente;
12. enlazar asistencia solo al `shift_id` cuando el contrato exige revisión publicada;
13. usar el turno actualmente visible para reescribir un evento histórico;
14. usar sede seleccionada como sede autoritativa del hecho;
15. usar rol base como rol operativo;
16. usar GPS como fuente del turno;
17. crear un turno para reparar una marcación;
18. modificar programación como efecto del check-in;
19. crear dos entradas por concurrencia;
20. cerrar la sesión equivocada por “última fila”;
21. crear dos descansos por replay;
22. guardar `client_event_id` únicamente en texto no vinculante y asumir idempotencia server-side;
23. tratar estado de cola como estado empresarial de `VPROC-0008`;
24. considerar evento recibido como evento reconciliado;
25. sobrescribir el evento original durante una corrección;
26. borrar un evento para ocultar duplicado o invalidez;
27. reordenar eventos por hora de recepción ignorando `occurred_at`;
28. partir un turno overnight por cambio de fecha civil;
29. convertir una novedad laboral en asistencia por inferencia;
30. crear un evento empresarial nuevo porque exista un retry técnico;
31. permitir que una consumidora escriba directamente la fuente propietaria de ANIMA;
32. restaurar permisos o contexto a partir de un evento tardío sin revalidación.

---

#### 55. Escenarios mínimos de aceptación contractual

La implementación futura deberá poder demostrar, como mínimo:

1. registrar una entrada online válida vinculada a trabajador, vínculo, turno y revisión;
2. registrar una salida contra la sesión exacta abierta;
3. iniciar y finalizar un descanso de forma idempotente;
4. rechazar entrada sin turno aplicable cuando no exista excepción aprobada;
5. rechazar revisión ambigua sin seleccionar una por conveniencia;
6. rechazar sede incompatible;
7. rechazar área incompatible cuando sea requerida;
8. rechazar rol operativo inválido cuando sea requerido;
9. conservar `occurred_at` diferente del tiempo de recepción;
10. persistir una intención offline antes de mostrarla como encolada;
11. sobrevivir cierre y reinicio de la aplicación con la misma identidad;
12. sincronizar una intención offline sin crear un segundo efecto;
13. recuperar el resultado después de respuesta perdida;
14. devolver el mismo resultado al replay de la misma intención;
15. producir conflicto si se reutiliza identidad con contenido distinto;
16. impedir dos entradas concurrentes incompatibles;
17. impedir dos salidas para la misma sesión;
18. impedir dos descansos abiertos incompatibles;
19. procesar eventos fuera de orden sin inventar una sesión;
20. resolver una jornada overnight sin dividirla por medianoche;
21. conservar evento histórico frente a nueva revisión de turno;
22. revalidar una intención offline después de cambio de turno, rol, sede o vínculo;
23. conservar evidencia de una intención que ya no puede producir efecto;
24. corregir asistencia sin sobrescribir el evento original;
25. reconstruir antes, después, evidencia y aprobador de una corrección;
26. mantener programación y asistencia como procesos distintos;
27. impedir que VISO cree un hecho competidor de asistencia;
28. impedir que SHELL fabrique una sesión de check-in;
29. diferenciar evento pendiente de evento confirmado en interfaz;
30. mantener contexto efectivo sin activar hasta confirmación autoritativa posterior;
31. emitir únicamente las definiciones empresariales existentes de `VPROC-0008`;
32. demostrar que una ruta de compatibilidad no degrada identidad, idempotencia, autorización ni auditoría.

---

#### 56. Criterios de aceptación documental

`INT-WORK-003` queda documentalmente completa cuando se cumplen simultáneamente estos criterios:

1. ANIMA queda como única propietaria de `VPROC-0008`.
2. VISO permanece como propietaria de programación y consumidora administrativa de asistencia.
3. intención, evento local, evento recibido, evento validado, evento reconciliado y sesión de check-in quedan diferenciados.
4. la identidad estable existe antes del primer envío.
5. entrada, salida, inicio de descanso y fin de descanso quedan cubiertos.
6. cada evento queda vinculable de forma determinista con trabajador, vínculo, turno y revisión publicada aplicables.
7. `occurred_at` permanece separado de la recepción.
8. un evento offline se persiste antes de mostrarse como encolado.
9. la sincronización reautoriza y no reutiliza autoridad stale.
10. replay de la misma intención no duplica efectos.
11. colisión de identidad con contenido diferente produce conflicto.
12. resultado desconocido exige recuperación antes de retry ciego.
13. concurrencia y múltiples dispositivos no producen sesiones o descansos duplicados.
14. eventos fuera de orden permanecen reconciliables sin reescritura del original.
15. overnight se resuelve por instantes reales y zona contractual.
16. cambios posteriores de programación no reescriben asistencia histórica.
17. correcciones preservan evento original, evidencia, decisión y efectos derivados.
18. se conservan estados, excepciones y acciones CCR ya aprobados de `VPROC-0008`.
19. no se crean definiciones normales nuevas de eventos empresariales.
20. se preservan consumidoras directas y condicionales aprobadas.
21. privacidad, minimización y auditoría quedan definidas.
22. `INT-WORK-004` conserva la propiedad de confirmar el contexto efectivo.
23. `INT-WORK-005` conserva la propiedad del consumo transversal del contexto.
24. las brechas físicas observadas tienen propietario y condición de salida.
25. no se selecciona esquema físico, migración, RPC, tabla, trigger, RLS o mecanismo de cache definitivo.
26. no se modifica código, Supabase, datos, migraciones, colas, configuración ni despliegue.
27. no se crean ni modifican requisitos de prueba.

---

#### 57. Requisitos de prueba derivados

**NO GENERA REQUISITOS DE PRUEBA.**

Justificación:

- el contrato laboral único ya protege la vinculación determinista entre programación, asistencia y contexto;
- la captura offline durable, la identidad estable, el replay y la prohibición de una escritura alternativa degradada ya poseen protección específica vigente;
- los descansos atómicos, la concurrencia, la deduplicación y el resultado recuperable ya poseen protección específica vigente;
- la invalidación, reautorización, territorio y auditoría ya están cubiertos por requisitos transversales vigentes;
- esta tarea especializa esas obligaciones en la frontera documental de registro de asistencia y no agrega una superficie ejecutable, esquema, permiso, transición, evento empresarial, endpoint, tecnología o comportamiento físico nuevo.

---

#### 58. Resultado de la tarea

`INT-WORK-003` queda **APROBADA** como definición documental del contrato mediante el cual ANIMA registra hechos de asistencia contra la programación publicada aplicable y los conserva como evidencia inmutable, idempotente y reconciliable.

Resultado consolidado:

- proceso propietario de asistencia: **`VPROC-0008`**;
- aplicación propietaria: **ANIMA**;
- propietaria de programación: **VISO**;
- unidad de programación referenciada: **turno + revisión publicada**;
- acciones cubiertas: **entrada, salida, inicio de descanso y fin de descanso**;
- identidad estable antes del primer envío: **obligatoria**;
- persistencia local antes de mostrar estado encolado: **obligatoria**;
- reautorización al sincronizar: **obligatoria**;
- retry ciego después de resultado desconocido: **prohibido**;
- overwrite del evento original: **prohibido**;
- nuevas definiciones normales de evento: **0**;
- cambios físicos: **0**;
- requisitos de prueba creados o modificados: **0**.

Invariante final:

```text
ACTOR EFECTIVO
+
INTENCIÓN IDENTIFICADA
+
PERSISTENCIA DURABLE CUANDO APLIQUE
+
TRABAJADOR Y VÍNCULO RESOLUBLES
+
TURNO Y REVISIÓN PUBLICADA APLICABLES
+
SEDE / ÁREA / ROL SEGÚN CONTRATO
+
VALIDACIÓN SERVER-SIDE
+
IDEMPOTENCIA
+
COMMIT DURABLE
=
HECHO DE ASISTENCIA AUTORITATIVO Y RECONCILIABLE
```

seguido por:

```text
HECHO DE ASISTENCIA CONFIRMADO
→ SESIÓN / JORNADA DERIVADA
→ PROYECCIONES CONTROLADAS
→ CONTEXTO EFECTIVO SOLO BAJO INT-WORK-004
→ CONSUMO TRANSVERSAL SOLO BAJO INT-WORK-005
```

---

ÚLTIMA TAREA APROBADA

`INT-WORK-002 — Definir contrato para que ANIMA presente el turno`

TAREA ACTUAL APROBADA

`INT-WORK-003 — Definir contrato para que ANIMA registre la asistencia`

SIGUIENTE TAREA RESERVADA

`INT-WORK-004 — Definir confirmación autoritativa del contexto efectivo en Supabase`


### ✅ INT-WORK-004 — Definir confirmación autoritativa del contexto efectivo en Supabase

**Estado:** APROBADA
**Tarea anterior:** `INT-WORK-003 — Definir contrato para que ANIMA registre la asistencia` — APROBADA
**Tarea siguiente:** `INT-WORK-005 — Definir consumo del contexto por SHELL y las aplicaciones` — RESERVADA
**Tipo de tarea:** documental; definición del contrato semántico mediante el cual Supabase y los resolutores canónicos determinan, confirman, invalidan y obligan a revalidar el contexto laboral operativo efectivo a partir de identidad laboral, turno y revisión publicados, asistencia confirmada, sesión de check-in, rol operativo, territorio y frescura autoritativos, sin implementar esquema físico, migraciones, RPC, RLS, triggers, tokens, cachés, cambios de código ni modificaciones de Supabase
**Bloque:** X — Integraciones
**Mini-bloque:** Contexto laboral
**Fase:** exclusivamente documental
**Repositorio propietario:** `vento-shell`
**Implementación física autorizada:** ninguna

---

#### 1. Objetivo

Definir de forma inequívoca cuándo Vento OS puede considerar que existe un contexto laboral operativo efectivo y autoritativo para un actor, y cuándo ese contexto debe considerarse ausente, inválido, obsoleto o no resoluble.

La tarea conecta las decisiones ya aprobadas de programación y asistencia sin transferir propiedad entre dominios:

```text
VISO
→ PUBLICA TURNO Y REVISIÓN AUTORITATIVOS

ANIMA
→ REGISTRA Y CONFIRMA HECHOS DE ASISTENCIA

SUPABASE / RESOLUTORES CANÓNICOS
→ CORRELACIONAN LAS FUENTES AUTORITATIVAS
→ CONFIRMAN O INVALIDAN EL CONTEXTO EFECTIVO
```

La confirmación del contexto no crea programación, no crea asistencia y no concede por sí sola una capacidad empresarial.

---

#### 2. Alcance documental

Esta tarea define exclusivamente:

1. la semántica de contexto laboral operativo efectivo;
2. las fuentes que pueden participar en su resolución;
3. las precondiciones para confirmarlo;
4. las condiciones que impiden confirmarlo;
5. las reglas de frescura e invalidación;
6. el tratamiento de concurrencia, ambigüedad, fallas y operación offline;
7. la relación entre contexto efectivo y autorización;
8. la evidencia mínima para reconstruir una decisión;
9. la frontera con `INT-WORK-001`, `INT-WORK-002`, `INT-WORK-003` e `INT-WORK-005`;
10. los escenarios mínimos que una materialización futura deberá demostrar.

No define una estructura física concreta ni una estrategia específica de almacenamiento o caché.

---

#### 3. Definición canónica de contexto efectivo

Para una acción cuya modalidad requiera contexto laboral operativo, el contexto solo puede considerarse efectivo cuando las fuentes autoritativas aplicables permiten resolver de forma coherente, simultánea y fresca:

- actor humano laboral aplicable;
- vínculo o asignación laboral vigente aplicable;
- turno publicado autoritativo;
- revisión exacta del turno aplicable;
- hecho de entrada confirmado por servidor cuando la modalidad exige presencia;
- sesión de check-in autoritativa vigente derivada de esa confirmación;
- ausencia de una salida o cierre efectivo que invalide la sesión;
- rol operativo efectivo;
- sede efectiva;
- área efectiva cuando corresponda;
- territorio compatible con la acción y el recurso;
- versiones contractuales compatibles;
- ausencia de una causa de invalidación o contradicción que impida utilizar la decisión.

La regla conceptual queda:

```text
TURNO PUBLICADO AUTORITATIVO + REVISIÓN EXACTA
+
VÍNCULO / ASIGNACIÓN LABORAL VÁLIDOS
+
CHECK-IN CONFIRMADO + SESIÓN VIGENTE
+
ROL OPERATIVO + TERRITORIO COHERENTES
+
FRESCURA AUTORITATIVA
+
AUSENCIA DE CONTRADICCIÓN BLOQUEANTE
=
CONTEXTO LABORAL OPERATIVO EFECTIVO
```

Cada componente sigue siendo propiedad de su dominio original.

---

#### 4. Modalidad operativa y modalidad administrativa

El contexto laboral operativo no se convierte en requisito universal para toda capacidad del sistema.

Se preserva la separación ya aprobada:

```text
CAPACIDAD ADMINISTRATIVA
→ PUEDE RESOLVERSE POR ROL BASE Y COBERTURA ADMINISTRATIVA
→ NO EXIGE TURNO NI CHECK-IN CUANDO SU CONTRATO ASÍ LO DEFINE
```

```text
CAPACIDAD OPERATIVA DEPENDIENTE DE JORNADA
→ EXIGE TURNO PUBLICADO Y APLICABLE
→ EXIGE CHECK-IN ACTIVO CUANDO CORRESPONDA
→ EXIGE ROL OPERATIVO EFECTIVO
→ EXIGE TERRITORIO COMPATIBLE
```

La existencia o ausencia de contexto laboral operativo no debe bloquear ni habilitar por inferencia un carril administrativo independiente.

---

#### 5. Fuentes autoritativas

La resolución deberá utilizar únicamente fuentes server-side o contratos propietarios capaces de demostrar la identidad y vigencia de los hechos requeridos.

Pueden participar, según la modalidad:

- identidad autenticada y actor efectivo;
- estado laboral aplicable;
- asignaciones y coberturas vigentes;
- programación publicada por VISO;
- identidad de turno y revisión publicada exacta;
- hechos de asistencia confirmados bajo `INT-WORK-003`;
- sesión de check-in autoritativa derivada de esos hechos;
- catálogo y reglas vigentes de rol operativo;
- relaciones territoriales canónicas de sede y área;
- restricciones aplicables de dispositivo, sesión o contexto;
- versiones contractuales necesarias para interpretar la decisión.

Una fuente cliente puede aportar una intención, un identificador o una pista de correlación, pero no puede convertir ese dato en autoridad.

---

#### 6. Fuentes que no crean autoridad

Por sí solos no confirman contexto efectivo:

- una pantalla que muestra un turno;
- una tarjeta de “turno actual”;
- una notificación;
- una respuesta optimista;
- un evento local aún no confirmado;
- una cola offline;
- un registro pendiente de sincronización;
- una caché del cliente;
- un valor persistido como última selección;
- la zona horaria del dispositivo;
- geolocalización aislada;
- `navigation_role`;
- rol base;
- sede primaria o seleccionada;
- área seleccionada;
- un rol, sede o área enviados por cliente;
- la mera existencia de una sesión autenticada;
- la existencia de un permiso sin los prerrequisitos contextuales que ese permiso exija.

La autoridad se resuelve; no se declara desde la interfaz.

---

#### 7. Identidad laboral y vínculo aplicable

La confirmación debe partir de una identidad laboral resoluble y del vínculo o asignación aplicables al instante y a la acción.

Reglas:

1. una identidad laboral inactiva no conserva contexto operativo por tener un turno o check-in históricos;
2. un vínculo finalizado, suspendido con bloqueo o no aplicable no se reactiva por una sesión previa;
3. una asignación residual no puede conceder autoridad después de quedar inválida;
4. una identidad ambigua no se resuelve escogiendo una coincidencia conveniente;
5. una identidad de cliente no sustituye la identidad laboral requerida;
6. el actor humano, el principal técnico, el dispositivo y la sesión permanecen separados.

---

#### 8. Turno y revisión publicada exacta

El contexto efectivo depende de la misma identidad de programación autoritativa ya aprobada para VISO y ANIMA.

Debe preservarse simultáneamente:

- `shift_id` aplicable;
- revisión publicada exacta;
- trabajador o vínculo al que aplica;
- ventana temporal autoritativa;
- sede;
- área cuando corresponda;
- rol operativo;
- estado que determine su aplicabilidad.

Queda prohibido resolver la revisión mediante:

- máximo timestamp;
- primera fila retornada;
- `published_at` aislado;
- estado visual del cliente;
- notificación;
- caché sin identidad de revisión;
- revisión sucesora todavía no publicada.

Una revisión ambigua o incompatible no puede producir contexto efectivo.

---

#### 9. Relación con asistencia confirmada

`INT-WORK-003` fija la precondición de asistencia:

```text
EVENTO DE ENTRADA CONFIRMADO
→ PUEDE PRODUCIR SESIÓN DE CHECK-IN AUTORITATIVA
→ ESTA TAREA PUEDE CONFIRMAR CONTEXTO EFECTIVO
```

También:

```text
EVENTO DE SALIDA CONFIRMADO
→ PUEDE CERRAR SESIÓN DE CHECK-IN
→ ESTA TAREA DEBE INVALIDAR EL CONTEXTO OPERATIVO DEPENDIENTE DE ESA SESIÓN
```

Un intento de entrada, un `ACK` local, una cola o una respuesta optimista no satisfacen esta precondición.

---

#### 10. Sesión de check-in autoritativa

La sesión de check-in es una representación derivada de hechos de asistencia confirmados y no una fuente independiente capaz de contradecirlos.

Para participar en contexto efectivo deberá ser:

- atribuible al actor laboral correcto;
- correlacionable con el turno y la revisión aplicables;
- abierta por una entrada confirmada;
- no cerrada por una salida confirmada o decisión autoritativa equivalente;
- coherente con el instante de resolución;
- coherente con sede, área y rol cuando correspondan;
- suficientemente fresca para la acción evaluada.

Una sesión abierta que contradiga un hecho autoritativo más reciente no conserva autoridad.

---

#### 11. Rol operativo efectivo

El rol operativo se deriva de la programación, asignación y contexto autoritativos aplicables.

No se deriva de:

- rol base;
- `navigation_role`;
- nombre visible del cargo;
- una lista local;
- coincidencia aproximada de texto;
- selección del cliente;
- último rol utilizado.

Un cambio de rol operativo que afecte la decisión invalida el contexto anterior para acciones posteriores y exige resolución nueva.

---

#### 12. Sede, área y territorio

La sede y el área efectivas deben ser compatibles con el turno, el actor y el recurso según la modalidad correspondiente.

Reglas:

1. sede seleccionada no sustituye sede del turno;
2. área seleccionada no sustituye área efectiva;
3. `null` no significa toda la sede;
4. una geolocalización cercana no crea territorio laboral;
5. un dispositivo no puede trasladar al actor a otra sede o área;
6. un cliente no puede enviar otro territorio para reparar una incompatibilidad;
7. una relación área–sede inválida o contradictoria impide confirmar el contexto que dependa de ella;
8. todo cruce territorial requerido debe resolverse en la frontera autoritativa.

---

#### 13. Tiempo y aplicabilidad

La vigencia temporal se determina con instantes y zona horaria autoritativos del turno y de las fuentes aplicables.

Reglas:

- la zona del dispositivo no gobierna la decisión;
- un turno overnight conserva una sola identidad lógica;
- una fecha civil aislada no acredita vigencia;
- una ventana expirada no conserva contexto porque la UI aún la muestre;
- una transición temporal relevante puede exigir resolución nueva;
- el reloj cliente no puede extender una sesión o turno;
- una decisión válida en un instante no se presume válida indefinidamente.

---

#### 14. Confirmación autoritativa

Confirmar contexto efectivo significa que una frontera server-side puede reconstruir una decisión coherente desde sus fuentes propietarias y producir una respuesta inequívoca para el instante y modalidad evaluados.

La confirmación debe cumplir:

1. identidad suficiente;
2. fuentes necesarias disponibles y concluyentes;
3. correlación determinista entre actor, turno, revisión y asistencia;
4. territorio y rol coherentes;
5. ausencia de contradicciones bloqueantes;
6. frescura suficiente;
7. versión contractual interpretable;
8. decisión reproducible para las mismas entradas autoritativas.

La confirmación no transforma el contexto en un token universal ni evita validar la acción protegida concreta.

---

#### 15. Ausencia normal de contexto efectivo

Puede existir ausencia normal de contexto operativo sin que exista un error técnico.

Ejemplos:

- trabajador sin turno operativo aplicable;
- turno válido pero sin check-in confirmado cuando el carril lo exige;
- sesión correctamente cerrada después de check-out;
- acción perteneciente a un carril que no requiere contexto laboral operativo;
- instante fuera de la ventana aplicable cuando el contrato así lo determina.

La ausencia normal debe mantenerse diferenciada de indisponibilidad, contradicción y estado obsoleto.

---

#### 16. Contexto no resoluble

Si una fuente requerida está temporalmente indisponible o la lectura no es concluyente, el sistema no debe inventar una respuesta empresarial estable.

Son ejemplos:

- timeout;
- excepción de fuente;
- lectura incompleta;
- imposibilidad de comprobar la revisión aplicable;
- imposibilidad de comprobar el estado actual de la sesión;
- versión necesaria temporalmente no disponible.

Regla:

```text
NO SE PUDO RESOLVER
≠
NO EXISTE CONTEXTO
```

La indisponibilidad técnica no se convierte en permiso ni en ausencia normal por conveniencia.

---

#### 17. Contradicción y ambigüedad

Una contradicción concluyente o una ambigüedad material impide confirmar contexto efectivo para el carril afectado.

Entre otros casos:

- dos revisiones incompatibles candidatas;
- más de una sesión que pretende ser la sesión activa del mismo contexto cuando el contrato exige unicidad;
- turno y asistencia vinculados a revisiones incompatibles;
- rol operativo incompatible con la programación;
- área que no pertenece a la sede;
- identidad laboral o asignación contradictorias;
- versiones contractuales incompatibles;
- fuentes propietarias que no pueden reconciliarse sin inventar una regla.

Queda prohibido resolver estas situaciones escogiendo la primera, la última o la más reciente por conveniencia.

---

#### 18. Frescura

La frescura es una propiedad de la decisión contextual, no únicamente de una fila o respuesta cacheada.

Una decisión solo puede reutilizarse cuando las fuentes, versiones y condiciones que la sostienen siguen siendo válidas para el instante y la acción posteriores.

La materialización futura deberá poder detectar o revalidar cambios relevantes sin depender de una duración arbitraria definida por esta tarea.

No se fija un TTL numérico.

---

#### 19. Causas de invalidación

El contexto operativo efectivo debe invalidarse o someterse a resolución completa nueva cuando cambie de forma relevante cualquiera de sus fundamentos autoritativos.

Incluye, según corresponda:

- check-out confirmado;
- cierre o expiración de la sesión de check-in;
- cancelación o retiro efectivo del turno;
- publicación de una revisión sucesora aplicable;
- cambio que altere la vigencia temporal;
- cambio de actor;
- cambio, suspensión o terminación del vínculo laboral;
- cambio de asignación;
- cambio de rol operativo;
- cambio de sede;
- cambio de área o de pertenencia área–sede;
- cambio territorial relevante;
- cambio de dispositivo cuando la modalidad lo haga parte del contexto;
- revocación de una fuente de autoridad aplicable;
- cambio contractual o de catálogo que vuelva incompatible el snapshot anterior;
- detección de una contradicción estructural que afecte el carril.

Una invalidación no borra la evidencia histórica que justificó la decisión anterior.

---

#### 20. Concurrencia

Una acción protegida no puede depender de un contexto que era válido al abrir la pantalla pero quedó inválido antes del efecto autoritativo.

Cuando una condición relevante pueda cambiar concurrentemente, la frontera que autoriza o ejecuta deberá revalidar las precondiciones aplicables antes de producir el efecto.

Ejemplos:

- check-out concurrente;
- nueva revisión publicada;
- cambio de rol o área;
- desactivación del trabajador;
- cierre de sesión;
- revocación territorial.

La victoria de una carrera cliente no constituye una decisión empresarial.

---

#### 21. Operación offline

La operación offline preserva intención y evidencia, no autoridad futura.

Reglas:

1. una intención de check-in encolada no crea contexto efectivo;
2. un último contexto conocido puede conservarse únicamente como representación no autoritativa si la experiencia aprobada lo permite;
3. una acción protegida nueva no puede ejecutarse con un contexto conocido como obsoleto;
4. al sincronizar, toda intención o acción pendiente debe reautorizarse frente a contexto canónico fresco;
5. un cambio ocurrido durante la desconexión puede invalidar la autoridad que existía al capturar la intención;
6. el replay no conserva automáticamente permisos, turno, rol, territorio ni sesión;
7. una cola no puede convertir una decisión anterior en una autorización permanente.

---

#### 22. Caché, Realtime y señales de invalidación

Caché, Realtime y señales de invalidación pueden acelerar la convergencia, pero no sustituyen las fuentes propietarias.

Reglas:

- una señal puede indicar que debe resolverse de nuevo;
- una notificación de cambio no es por sí sola la nueva verdad;
- una caché debe quedar asociada a suficiente identidad y versión para detectar obsolescencia;
- un evento Realtime perdido no convierte en vigente una decisión antigua;
- una reconexión no reutiliza autoridad sin comprobar frescura;
- una vista stale no puede alimentar una acción operativa nueva.

El mecanismo físico de caché, suscripciones e invalidación no se define en esta tarea.

---

#### 23. Contexto efectivo y autorización

El contexto efectivo es una entrada de autorización cuando el contrato de la capacidad lo exige. No sustituye la autorización.

Por tanto:

```text
CONTEXTO EFECTIVO CONFIRMADO
≠
PERMISO CONCEDIDO
```

Una acción protegida continúa exigiendo, según corresponda:

- sesión e identidad válidas;
- acceso a la aplicación;
- clave exacta de permiso;
- modalidad de autorización;
- contexto requerido;
- territorio;
- restricciones de dispositivo;
- estado del recurso;
- reglas de concurrencia;
- ausencia de denegaciones;
- controles server-side, RPC y RLS aplicables.

Un contexto laboral correcto no concede capacidades que el actor no posee.

---

#### 24. Consistencia entre canales

Para las mismas fuentes autoritativas, instante, actor, modalidad y recurso, las capas que dependan del contexto deberán interpretar de forma equivalente si el contexto es utilizable.

La implementación futura no podrá permitir que:

- la interfaz considere válido un contexto que servidor rechaza;
- una RPC acepte un contexto que una acción server-side considera obsoleto;
- RLS ignore una invalidación relevante;
- una cola offline ejecute con una decisión ya retirada;
- una aplicación reconstruya por su cuenta turno, check-in, rol o territorio con reglas distintas.

La materialización de esa paridad permanece bajo los propietarios técnicos ya existentes.

---

#### 25. Auditoría mínima

La decisión de contexto deberá poder reconstruirse, cuando aplique, con evidencia correlacionable de:

- principal autenticado;
- actor humano efectivo;
- identidad laboral y vínculo aplicables;
- turno;
- revisión publicada;
- hecho de asistencia relevante;
- sesión de check-in;
- estado de cierre o check-out cuando corresponda;
- rol operativo;
- sede;
- área;
- territorio;
- dispositivo o sesión cuando formen parte de la modalidad;
- instante de resolución;
- resultado contextual;
- razón de ausencia, invalidación, contradicción o imposibilidad de resolución cuando aplique;
- causa de revalidación;
- versiones contractuales relevantes;
- correlación necesaria para investigar una acción posterior.

La auditoría debe minimizar datos y no almacenar secretos como evidencia contextual.

---

#### 26. Privacidad y minimización

El contexto laboral es información operacional y laboral restringida.

Cada consumidor deberá recibir únicamente los campos necesarios para su finalidad.

La confirmación del contexto no autoriza por sí sola a propagar:

- geolocalización exacta;
- notas laborales privadas;
- evidencia completa de asistencia;
- historial administrativo;
- datos de otros trabajadores;
- razones internas sensibles;
- credenciales, tokens o secretos.

La semántica de consumo por SHELL y las aplicaciones permanece reservada a `INT-WORK-005`.

---

#### 27. Frontera con `INT-WORK-001`

`INT-WORK-001` continúa siendo propietaria documental del contrato mediante el cual VISO publica el turno.

Esta tarea consume esa decisión y exige:

- turno publicado;
- revisión exacta;
- identidad estable;
- aplicabilidad temporal y territorial coherentes.

No publica, corrige, cancela ni versiona programación.

---

#### 28. Frontera con `INT-WORK-002`

`INT-WORK-002` define cómo ANIMA presenta la programación publicada.

La presentación no se convierte en fuente contextual.

Por tanto:

```text
TURNO MOSTRADO
≠
CONTEXTO EFECTIVO
```

Una tarjeta, semana, detalle o notificación pueden conducir a una acción, pero esa acción debe resolver nuevamente las fuentes autoritativas que su contrato requiera.

---

#### 29. Frontera con `INT-WORK-003`

`INT-WORK-003` gobierna la captura, persistencia, sincronización, validación y conciliación de los hechos de asistencia.

Esta tarea no reinterpreta una intención pendiente como asistencia confirmada ni corrige el hecho propietario.

Su dependencia es estricta:

```text
HECHO DE ASISTENCIA CONFIRMADO
→ SESIÓN DE CHECK-IN AUTORITATIVA CUANDO CORRESPONDA
→ CONTEXTO EFECTIVO PUEDE SER RESUELTO
```

Si el hecho de asistencia deja de sostener la sesión, el contexto dependiente de ella deja de ser utilizable.

---

#### 30. Frontera con `INT-WORK-005`

`INT-WORK-004` termina en la definición de cómo se confirma, invalida y revalida el contexto efectivo.

`INT-WORK-005` será propietaria documental del consumo de ese contexto por SHELL y las aplicaciones.

Por tanto esta tarea no define:

- API final de consumo;
- hook, provider o SDK de cliente;
- estructura de estado de SHELL;
- estrategia de navegación;
- campos mínimos por aplicación;
- comportamiento visual por consumidora;
- caché específica de una aplicación;
- contrato de propagación entre aplicaciones.

---

#### 31. Frontera física con Supabase

El título de la tarea fija a Supabase como frontera autoritativa de datos y resolución, pero esta fase no autoriza implementación física.

Esta tarea no crea ni modifica:

- tablas;
- columnas;
- constraints;
- índices;
- vistas o vistas materializadas;
- funciones;
- RPC;
- triggers;
- políticas RLS;
- grants;
- migraciones;
- Edge Functions;
- tokens derivados;
- mecanismos de caché;
- suscripciones Realtime;
- datos de producción, staging o desarrollo.

La materialización futura deberá realizarse mediante los propietarios técnicos ya definidos y versionarse desde `vento-shell` cuando implique Supabase.

---

#### 32. Brechas físicas y propietarios existentes

La definición documental no declara como implementado aquello que permanece pendiente físicamente.

Las obligaciones de materialización ya tienen propietarios documentales existentes, entre ellos:

| Brecha física                                                                         | Propietario existente                                                          | Condición de salida                                                                                                  |
| ------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------ | -------------------------------------------------------------------------------------------------------------------- |
| resolución server-side coherente de contexto operativo y autorización                 | `AUTH-DB-033`; `AUTH-DB-034`; `SHELL-CTX-002` a `SHELL-CTX-004`                | servidor, RPC y RLS resuelven las mismas precondiciones operativas y razones para el mismo caso                      |
| invalidación por check-out, sesión, turno, rol, área, actor, dispositivo o asignación | `AUTH-DB-035`; `SHELL-CTX-006`; `ANIMA-AUTH-015`; `AUTH-QA-025`; `AUTH-QA-026` | ninguna decisión, caché, token derivado o cola offline conserva autoridad después del cambio aplicable               |
| paridad de autorización antes de mutaciones                                           | `AUTH-SRV-004` a `AUTH-SRV-018`; `AUTH-DB-034`                                 | toda mutación revalida identidad, permiso, contexto, territorio y recurso antes del efecto                           |
| evidencia correlacionable de decisión                                                 | `AUTH-DB-012` a `AUTH-DB-014`; `AUTH-DB-032`; `AUTH-SRV-014`; `AUTH-QA-029`    | decisiones permitidas y denegadas pueden reconstruirse con actor, contexto, razones y versión contractual            |
| consumo transversal del contexto                                                      | `INT-WORK-005`                                                                 | SHELL y las aplicaciones consumen el contexto compartido sin reconstruir programación o asistencia por cuenta propia |

No se crea una tarea adicional para obligaciones que ya poseen dueño y condición de salida.

---

#### 33. Invariantes

1. VISO sigue siendo propietaria de programación.
2. ANIMA sigue siendo propietaria de asistencia.
3. Supabase y los resolutores canónicos confirman contexto; no inventan hechos propietarios.
4. turno mostrado no equivale a contexto efectivo.
5. turno publicado no equivale a presencia.
6. check-in local no equivale a check-in confirmado.
7. cola offline no equivale a contexto.
8. sesión autenticada no equivale a contexto laboral operativo.
9. rol base no equivale a rol operativo.
10. sede seleccionada no equivale a sede efectiva.
11. área seleccionada no equivale a área efectiva.
12. `null` no equivale a cobertura global.
13. contexto efectivo no equivale a permiso concedido.
14. contexto válido para una modalidad no habilita otra modalidad por inferencia.
15. una revisión ambigua no se resuelve por primera o última fila.
16. una fuente no disponible no equivale a ausencia normal de contexto.
17. una decisión obsoleta no conserva autoridad para una acción nueva.
18. check-out confirmado invalida el contexto que dependía de la sesión cerrada.
19. cambio de turno, rol, territorio o actor exige revalidación cuando afecta la decisión.
20. la UI no puede ampliar autoridad enviada por servidor.
21. caché y Realtime no son fuentes propietarias.
22. una acción offline pendiente se reautoriza al sincronizar.
23. una decisión histórica se conserva como evidencia aunque deje de ser efectiva.
24. la implementación física no se presume por aprobar esta definición documental.
25. el consumo transversal permanece reservado a `INT-WORK-005`.

---

#### 34. Prohibiciones

Queda prohibido considerar conforme cualquiera de estos atajos:

1. activar contexto cuando el usuario toca “Entrar” antes de confirmación server-side;
2. activar contexto porque una intención fue persistida localmente;
3. activar contexto porque una intención fue enviada a una cola;
4. activar contexto desde una respuesta optimista;
5. usar la tarjeta de turno actual como prueba de presencia;
6. aceptar una revisión distinta a la correlacionada con la asistencia;
7. elegir una revisión por máximo timestamp;
8. elegir una sesión activa por primera fila;
9. usar rol base o `navigation_role` como rol operativo efectivo;
10. aceptar sede o área enviadas por cliente para reparar incompatibilidad;
11. interpretar `null` como todas las sedes o áreas;
12. conservar un contexto después de check-out confirmado;
13. reutilizar un contexto después de una revisión sucesora sin revalidación;
14. ejecutar una acción offline con la autoridad que existía al capturarla sin reautorizar;
15. tratar un timeout como ausencia de contexto;
16. tratar una contradicción como una ausencia normal;
17. conceder una capacidad solo porque el contexto es efectivo;
18. reconstruir el contexto de forma diferente en cada aplicación;
19. declarar implementada una política física no materializada;
20. trasladar a `INT-WORK-005` la propiedad de confirmar el contexto.

---

#### 35. Escenarios mínimos de aceptación contractual

La materialización futura deberá demostrar como mínimo:

1. entrada confirmada, turno y revisión exactos, vínculo válido, sesión vigente, rol y territorio coherentes permiten confirmar contexto operativo cuando la modalidad lo exige;
2. un turno mostrado sin check-in confirmado no produce contexto operativo efectivo;
3. una intención de entrada encolada offline no produce contexto efectivo;
4. una respuesta optimista de cliente no produce contexto efectivo;
5. un check-out confirmado invalida el contexto dependiente de esa sesión;
6. una revisión sucesora publicada invalida la decisión basada en la revisión sustituida cuando afecta su aplicabilidad;
7. un cambio de rol operativo invalida decisiones posteriores basadas en el rol anterior;
8. un cambio de área o sede relevante obliga a resolver de nuevo el territorio;
9. trabajador inactivo o vínculo no aplicable no conserva contexto por tener una sesión previa;
10. dos revisiones incompatibles candidatas bloquean la confirmación automática;
11. dos sesiones incompatibles no se resuelven escogiendo una por orden de consulta;
12. un timeout de fuente se trata como resolución no concluyente y no como ausencia normal;
13. una capacidad administrativa cuyo contrato no exige turno ni check-in conserva su carril independiente;
14. contexto efectivo con permiso exacto ausente no autoriza la acción;
15. contexto efectivo con recurso o territorio incompatible no autoriza la acción;
16. un rol enviado por cliente no sustituye el rol operativo autoritativo;
17. una sede o área enviada por cliente no amplía territorio;
18. una caché stale no habilita una acción operativa nueva;
19. una acción capturada offline se reautoriza con contexto fresco al sincronizar;
20. una señal Realtime inicia convergencia o relectura sin convertirse por sí sola en fuente;
21. la evidencia permite correlacionar turno, revisión, asistencia, sesión, rol, territorio, resultado y versión contractual;
22. el cierre de una sesión conserva la evidencia histórica de la decisión anterior;
23. la aplicación consumidora no necesita reconstruir por su cuenta el turno o la asistencia para saber si el contexto recibido es utilizable;
24. ninguna de las validaciones anteriores exige una mutación física durante esta tarea documental.

---

#### 36. Criterios de aceptación documental

`INT-WORK-004` queda documentalmente completa cuando se cumplen simultáneamente:

1. contexto laboral operativo efectivo queda definido sin confundirse con permiso o sesión autenticada;
2. se preserva la propiedad de VISO sobre programación y de ANIMA sobre asistencia;
3. turno y revisión exactos forman parte de la base contextual cuando corresponde;
4. una sesión de check-in solo participa después de asistencia confirmada;
5. rol, sede y área proceden de fuentes autoritativas y no del cliente;
6. la modalidad administrativa independiente permanece separada;
7. ausencia normal, indisponibilidad, contradicción y obsolescencia permanecen diferenciadas;
8. las causas de invalidación obligan a revalidar cuando afectan la decisión;
9. caché, Realtime, UI y offline no crean autoridad;
10. las acciones pendientes offline se reautorizan al sincronizar;
11. contexto efectivo permanece como prerrequisito de autorización y no como concesión universal;
12. la decisión puede auditarse y correlacionarse sin exponer secretos ni datos innecesarios;
13. las brechas físicas permanecen asignadas a propietarios existentes con condición de salida;
14. no se crea esquema, tabla, RPC, RLS, trigger, token, caché, migración ni cambio físico en Supabase;
15. no se modifica código ni configuración;
16. no se crean ni modifican requisitos de prueba;
17. `INT-WORK-005` permanece reservada y sin desarrollar.

---

#### 37. Requisitos de prueba derivados

**NO GENERA REQUISITOS DE PRUEBA.**

Justificación:

- `TREQ-AUTH-008` ya exige que las capacidades operativas dependientes de jornada requieran turno publicado y vigente, check-in activo, rol operativo efectivo y compatibilidad territorial, preservando por separado las capacidades administrativas que no requieren esas precondiciones;
- `TREQ-AUTH-009` ya exige resolver sede y área efectivas de forma determinista desde asignaciones, turno, check-in y contexto, con rechazo de cruces territoriales indebidos;
- `TREQ-AUTH-013` ya exige que cada mutación protegida revalide en servidor permiso, actor, territorio, contexto requerido, estado del recurso y columnas permitidas;
- `TREQ-AUTH-014` ya exige invalidar contexto, caché y tokens derivados ante check-out, expiración o cambios relevantes y obliga a reautorizar colas offline al sincronizar;
- `TREQ-AUTH-015` ya exige evidencia correlacionable de actor, rol, turno, check-in, sede, área, dispositivo, permiso, decisión, razones, versión contractual y timestamp;
- `TREQ-AUTH-016` ya cubre revocación coordinada del contexto y la prohibición de ejecutar con autoridad anterior desde cachés o colas offline;
- `INT-WORK-003` ya fija que una intención local o pendiente no equivale a asistencia confirmada y que solo un hecho confirmado puede originar la sesión que esta tarea consume;
- esta tarea especializa y conecta obligaciones ya registradas sin introducir una capacidad empresarial, permiso, proceso, transición, evento, repositorio, esquema o comportamiento físico nuevo.

Por tanto, el registro 04A vigente no requiere creación, modificación, diferimiento, descarte ni obsolescencia de filas por esta tarea.

---

#### 38. Resultado de la tarea

`INT-WORK-004` queda **APROBADA** como definición documental de la confirmación autoritativa del contexto laboral operativo efectivo en Supabase.

Resultado consolidado:

- fuente de programación: **VISO mediante turno y revisión publicados autoritativos**;
- fuente de asistencia: **ANIMA mediante hechos confirmados bajo `INT-WORK-003`**;
- condición de presencia: **check-in confirmado y sesión autoritativa vigente cuando la modalidad lo exige**;
- rol operativo: **derivado de fuentes autoritativas, nunca del rol base o del cliente**;
- territorio: **sede y área coherentes con actor, turno y recurso**;
- frescura: **obligatoria para toda reutilización de la decisión**;
- check-out o cambio relevante: **invalida o fuerza nueva resolución cuando afecta el contexto**;
- operación offline: **conserva intención, no autoridad; reautoriza al sincronizar**;
- caché y Realtime: **mecanismos auxiliares, no fuentes propietarias**;
- contexto efectivo equivalente a permiso: **prohibido**;
- mutaciones físicas en Supabase: **0**;
- cambios de código o configuración: **0**;
- requisitos de prueba creados o modificados: **0**.

Invariante final:

```text
FUENTES PROPIETARIAS AUTORITATIVAS
→ RESOLUCIÓN SERVER-SIDE COHERENTE Y FRESCA
→ CONTEXTO LABORAL OPERATIVO EFECTIVO
→ ENTRADA A LA AUTORIZACIÓN DE LA ACCIÓN
```

sin permitir:

```text
CLIENTE / CACHÉ / OFFLINE / UI
→ AUTORIDAD CONTEXTUAL
```

ni:

```text
CONTEXTO EFECTIVO
→ PERMISO UNIVERSAL
```

---

ÚLTIMA TAREA APROBADA

`INT-WORK-003 — Definir contrato para que ANIMA registre la asistencia`

TAREA ACTUAL APROBADA

`INT-WORK-004 — Definir confirmación autoritativa del contexto efectivo en Supabase`

SIGUIENTE TAREA RESERVADA

`INT-WORK-005 — Definir consumo del contexto por SHELL y las aplicaciones`


### [ ] INT-WORK-005 — Definir consumo del contexto por SHELL y las aplicaciones
