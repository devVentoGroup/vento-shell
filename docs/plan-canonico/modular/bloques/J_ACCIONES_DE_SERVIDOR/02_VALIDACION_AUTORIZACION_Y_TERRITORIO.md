### MINI-BLOQUE — VALIDACIÓN AUTORIZACIÓN Y TERRITORIO

<!-- PLAN-SECTION-META:START -->
**Cobertura canónica:** `AUTH-SRV-004` a `AUTH-SRV-013` — 10 tareas.
<!-- PLAN-SECTION-META:END -->

### ✅ AUTH-SRV-004 — Eliminar confianza exclusiva en la interfaz

**Estado:** APROBADA
**Tarea anterior:** AUTH-SRV-003 — Inventariar RPC utilizadas
**Tarea siguiente:** AUTH-SRV-005 — Validar permiso en cada escritura
**Tipo de tarea:** Contrato global con materialización por unidad (`PER_IMPLEMENTATION_UNIT`) — contrato de frontera de confianza para que toda mutación protegida trate la interfaz, URL, formulario, body, SDK y caller externo como intención no autoritativa, reconstruya en servidor el payload efectivo y recalcule contra estado canónico los conflictos, límites y datos derivados antes de producir efectos
**Bloque:** BLOQUE J — Protección de acciones de servidor
**Repositorio propietario:** `vento-group-sas/vento-shell`
**Archivo propietario:** `docs/plan-canonico/modular/bloques/J_ACCIONES_DE_SERVIDOR/02_VALIDACION_AUTORIZACION_Y_TERRITORIO.md`
**Estado físico resultante:** `ESPECIFICADO_NO_MATERIALIZADO`
**Cambios físicos autorizados:** 0 durante el marcador global; las futuras materializaciones ocurren únicamente mediante `AUTH-SRV-004::<implementation_unit_id>` después de que `DELIV-PKG-025::<package_id>` asigne la unidad y el paquete propietario supere `E5-GATE-008::<package_id>`
**Requisitos de prueba creados o modificados:** 0

---

#### 1. Propósito

Definir una frontera de confianza única para las superficies de servidor inventariadas por `AUTH-SRV-001`, `AUTH-SRV-002` y `AUTH-SRV-003`.

La regla vinculante queda:

```text
VALOR RECIBIDO DESDE CLIENTE
=
INTENCIÓN / SELECTOR / CONTENIDO PROPUESTO

VALOR RECIBIDO DESDE CLIENTE
≠
AUTORIDAD
≠
ESTADO ACTUAL
≠
PAYLOAD FINAL PRIVILEGIADO
≠
DECISIÓN DE AUTORIZACIÓN
```

Toda mutación protegida deberá reconstruir en servidor el efecto efectivo a partir de fuentes canónicas antes de escribir, publicar, borrar, aprobar, transferir, ejecutar una RPC privilegiada o producir otro efecto sensible.

#### 2. Resultado contractual

`AUTH-SRV-004` fija cinco obligaciones globales:

1. clasificar cada campo recibido por su nivel de confianza;
2. impedir que datos derivados o privilegiados del cliente se conviertan directamente en columnas, argumentos o contexto efectivo;
3. reconstruir el payload mutante desde fuentes persistidas y reglas canónicas;
4. recalcular conflictos y límites desde estado actual del servidor;
5. fallar cerrado cuando no pueda reconstruirse con evidencia suficiente el efecto solicitado.

El cumplimiento visual de la interfaz no sustituye ninguna de estas obligaciones.

#### 3. Universo consumido

La tarea consume como entradas los inventarios ya aprobados:

```text
AUTH-SRV-001
→ Server Actions

AUTH-SRV-002
→ API routes / endpoints HTTP

AUTH-SRV-003
→ RPC utilizadas
```

No renumera ni redefine esas identidades.

La futura materialización conserva el lineage entre superficie de entrada, helper, RPC, tabla y efecto.

#### 4. Frontera con las tareas siguientes

`AUTH-SRV-004` define **cómo dejar de confiar exclusivamente en datos o decisiones producidos por la interfaz**.

No absorbe las reglas especializadas de:

```text
AUTH-SRV-005
→ permiso exacto en cada escritura

AUTH-SRV-006
→ sede

AUTH-SRV-007
→ área

AUTH-SRV-008
→ turno

AUTH-SRV-009
→ rol operativo

AUTH-SRV-010
→ dispositivo compartido

AUTH-SRV-011
→ estado actual de la entidad

AUTH-SRV-012
→ cruces entre sedes

AUTH-SRV-013
→ cruces entre áreas
```

Una unidad puede cumplir `AUTH-SRV-004` y continuar bloqueada por cualquiera de esas tareas.

#### 5. Modelo de amenaza

Se consideran manipulables por definición:

- inputs HTML;
- campos ocultos;
- parámetros de URL;
- `FormData`;
- JSON;
- headers no criptográficamente confiables;
- argumentos enviados por SDK;
- llamadas directas a endpoints;
- invocaciones directas a RPC expuestas;
- estado serializado del cliente;
- valores calculados por JavaScript;
- flags de interfaz;
- listas visibles u ocultas en UI;
- identificadores elegidos en selectores;
- estados conservados en caché cliente.

La existencia de un control visual, botón deshabilitado, selector filtrado o pantalla oculta no concede autoridad.

#### 6. Clasificación obligatoria de entradas

Cada futura unidad deberá clasificar sus entradas en una de estas clases:

| Clase                | Significado                                                                             | Tratamiento                                                               |
| -------------------- | --------------------------------------------------------------------------------------- | ------------------------------------------------------------------------- |
| `SELECTOR_INTENT`    | identifica lo que el usuario pretende operar                                            | se acepta solo como referencia y debe resolverse contra fuentes canónicas |
| `USER_CONTENT`       | contenido empresarial que el actor realmente redacta o captura                          | se valida, limita y persiste solo en campos expresamente permitidos       |
| `SERVER_DERIVED`     | dato que determina autoridad, territorio, relación, estado o campo privilegiado         | nunca se acepta como autoridad desde cliente; se reconstruye              |
| `CURRENT_STATE`      | dato cuyo valor correcto depende del estado vigente del sistema                         | se vuelve a consultar en servidor                                         |
| `CLIENT_CALCULATION` | total, conflicto, disponibilidad, precio, límite, permiso u otro cálculo mostrado en UI | se ignora para la decisión y se recalcula                                 |
| `NAVIGATION_ONLY`    | valor usado exclusivamente para UX posterior                                            | no modifica objeto, autorización ni alcance de la mutación                |

Ninguna clase puede omitirse cuando la entrada correspondiente exista.

#### 7. Invariante universal

Antes de un efecto protegido debe cumplirse:

```text
request_intent
+ caller_resuelto_en_servidor
+ registros_canonicos_vigentes
+ reglas_canonicas
+ recomputacion_servidor
=
effective_mutation
```

Queda prohibido:

```text
request_body
=
effective_mutation
```

cuando el payload contenga campos derivados, privilegiados o dependientes de estado.

#### 8. Regla de payload efectivo

El payload que finalmente llegue a:

- `insert`;
- `update`;
- `upsert`;
- `delete`;
- RPC mutante;
- API externa sensible;
- Storage sensible;
- cola;
- publicación;
- operación administrativa;

debe construirse explícitamente en servidor.

No se considera válido un patrón que copie indiscriminadamente el request a la persistencia.

#### 9. Prohibición de mass assignment

Queda prohibido usar como payload final un objeto controlado por cliente mediante patrones equivalentes a:

```text
payload_final = request
payload_final = body
payload_final = formData serializado
payload_final = objeto cliente extendido sin allowlist
```

Las columnas o argumentos admitidos deben quedar definidos de forma explícita por la unidad.

Los campos no reconocidos deben ser ignorados o provocar rechazo controlado, según el contrato de la superficie.

#### 10. `SELECTOR_INTENT`

Identificadores como:

```text
employee_id
site_id
shift_id
order_id
product_id
application_id
month
date
roleContext
```

pueden viajar desde cliente cuando representan la selección del actor.

Su presencia solo significa:

```text
"el caller solicita operar esta identidad"
```

No significa:

```text
"esa identidad existe"
"esa identidad pertenece al caller"
"esa identidad pertenece al territorio correcto"
"esa identidad está en un estado mutable"
```

Esas propiedades se resuelven en servidor.

#### 11. `USER_CONTENT`

Contenido como notas, observaciones, texto libre o valores empresariales realmente editables puede conservar origen cliente.

Debe cumplir al menos:

- tipo esperado;
- longitud máxima;
- normalización requerida;
- formato permitido;
- allowlist de campo;
- semántica propia del recurso.

`USER_CONTENT` no puede sobrescribir silenciosamente un campo `SERVER_DERIVED`.

#### 12. `SERVER_DERIVED`

Se clasifican como derivados, cuando correspondan al dominio:

- actor efectivo;
- identidad persistida del principal;
- sede efectiva;
- área efectiva;
- rol operativo efectivo;
- vínculo trabajador-sede;
- punto de check-in;
- punto de check-out;
- estado inicial protegido;
- `published_by`;
- timestamps de autoridad;
- flags administrativos;
- relaciones de ownership;
- referencias privilegiadas;
- campos que se obtengan de matrices o perfiles canónicos.

Si el cliente envía uno de estos valores, su copia no se convierte en evidencia.

#### 13. `CURRENT_STATE`

Se consideran estado actual, entre otros:

- existencia del recurso;
- estado draft/published/cancelled;
- vínculos activos;
- turnos vigentes;
- registros concurrentes;
- stock actual;
- saldos;
- disponibilidad;
- asociaciones vigentes;
- conflictos ya persistidos;
- totales acumulados.

El servidor debe consultar la fuente de verdad aplicable antes de decidir el efecto.

La tarea no declara resueltas todavía las reglas especializadas de transición de `AUTH-SRV-011`.

#### 14. `CLIENT_CALCULATION`

Quedan expresamente fuera de la frontera de confianza:

- totales mostrados;
- porcentajes;
- horas acumuladas;
- flags `hasConflict`;
- flags `canPublish`;
- listas filtradas;
- límites calculados en navegador;
- precios derivados;
- permisos calculados localmente;
- estados de disponibilidad mostrados en pantalla.

El servidor puede devolver esos cálculos para UX, pero no puede consumirlos después como autoridad de la mutación.

#### 15. `NAVIGATION_ONLY`

Valores como `return_to` pueden conservarse como intención de navegación.

La regla es:

```text
navigation_value
→ UX posterior

navigation_value
X autorización
navigation_value
X territorio
navigation_value
X target efectivo
navigation_value
X columnas persistidas
```

Una manipulación de navegación no debe ampliar el efecto empresarial.

#### 16. Contrato para Server Actions

Toda Server Action mutante deberá demostrar:

```text
input recibido
→ parse / shape
→ resolución canónica
→ reconstrucción de efecto
→ recomputación de restricciones
→ mutación
```

No basta con que la acción solo pueda invocarse desde un formulario renderizado por una página protegida.

Una llamada directa o un formulario alterado debe alcanzar exactamente las mismas decisiones del servidor.

#### 17. Contrato para API routes

Toda mutación HTTP deberá tratar:

```text
path params
query params
body
headers cliente
```

como inputs no autoritativos salvo evidencia criptográfica o contractual específica.

La aplicación deberá resolver el recurso y reconstruir el efecto con fuentes de servidor.

Una API route protegida no hereda autorización porque su UI consumidora haya ocultado la operación.

#### 18. Contrato para RPC

Cuando una RPC pueda ser invocada desde navegador, móvil o caller no privilegiado, sus argumentos no podrán conceder por sí solos:

- identidad privilegiada;
- rol;
- sede;
- área;
- ownership;
- estado protegido;
- alcance adicional.

Cuando una capa de servidor invoque la RPC, esa capa seguirá obligada a construir argumentos canónicos; la futura revisión de grants, RLS y seguridad interna de la RPC permanece fuera de este marcador.

#### 19. Clientes administrativos y service role

El uso de:

```text
admin client
service role
```

aumenta, y no reduce, la obligación de reconstrucción.

Cuando el caller privilegiado pueda omitir RLS:

```text
cliente privilegiado
+
campo manipulado por usuario
=
RIESGO CRÍTICO
```

Por tanto, todo dato de cliente que llegue a una operación privilegiada debe haber sido clasificado y resuelto previamente.

#### 20. Fallo cerrado

Si una superficie no puede resolver una dependencia necesaria para construir el efecto:

```text
missing canonical record
invalid selector
ambiguous relation
failed state query
failed conflict query
failed limit query
unknown derived value
```

la mutación no debe degradarse a confiar en el valor recibido.

La ausencia de evidencia canónica produce bloqueo del efecto.

El contrato detallado de mensajes de error permanece para `AUTH-SRV-016`.

#### 21. Baseline VISO mensual

El package mensual usa:

```text
vento-group-sas/vento-viso
src/app/staff/schedule/month/actions.ts
snapshot 8cf7c49a593c748cb6c99dd9b919b6947bcfec14
```

Superficies heredadas:

```text
createMonthlyShiftsAction
deleteMonthlyDraftShiftAction
deleteMonthlyDraftsAction
publishMonthAction
```

`AUTH-SRV-004` fija para este package la regla propietaria:

```text
RECALCULAR PAYLOAD
+
RECALCULAR CONFLICTOS
+
RECALCULAR LÍMITE
```

#### 22. VISO mensual — entrada de creación

`createMonthlyShiftsAction` recibe como intención observable:

| Campo         | Clase en `AUTH-SRV-004`                        |
| ------------- | ---------------------------------------------- |
| `employee_id` | `SELECTOR_INTENT`                              |
| `site_id`     | `SELECTOR_INTENT`                              |
| `month`       | `SELECTOR_INTENT`                              |
| `blocks_json` | conjunto de `SELECTOR_INTENT` + `USER_CONTENT` |
| `return_to`   | `NAVIGATION_ONLY`                              |

Dentro de `blocks_json`:

| Campo         | Clasificación                 |
| ------------- | ----------------------------- |
| `roleContext` | `SELECTOR_INTENT`             |
| `startTime`   | intención horaria validable   |
| `endTime`     | intención horaria validable   |
| `dates`       | intención de fechas validable |
| `notes`       | `USER_CONTENT`                |

Ninguno de estos campos determina por sí solo el payload persistente completo.

#### 23. VISO mensual — payload reconstruido

Para creación mensual, el servidor debe construir explícitamente el registro final.

El contrato separa:

```text
DESDE INTENCIÓN VALIDADA
employee_id
shift_date
start_time
end_time
notes

RESUELTO O FIJADO EN SERVIDOR
site_id efectivo
area_id
operational_role
shift_kind
show_end_as_close
break_minutes
status inicial
checkin_site_id
checkout_site_id
published_at
published_by
```

La futura implementación podrá ajustar esta clasificación si una fuente canónica posterior redefine la propiedad de un campo, pero nunca podrá convertir un valor derivado en autoridad solo porque la UI lo envía.

#### 24. VISO mensual — matriz y perfil

El snapshot ya consulta:

```text
vento_site_operational_role_matrix_v1
employee_site_operational_profiles
```

y utiliza esas fuentes para resolver:

- combinación área/rol;
- rol operativo;
- requisitos de punto externo;
- punto de entrada;
- punto de salida.

`AUTH-SRV-004` convierte ese patrón en obligación contractual de reconstrucción.

La validez territorial exacta de sede y área continúa reservada a `AUTH-SRV-006`, `AUTH-SRV-007`, `AUTH-SRV-012` y `AUTH-SRV-013`.

#### 25. VISO mensual — conflictos

Los conflictos no pueden provenir de:

- celdas ocupadas en la UI;
- turnos cargados al render inicial;
- flags del builder;
- memoria del navegador.

La creación debe volver a consultar en servidor los turnos relevantes y recalcular el solapamiento contra la propuesta validada.

Para el package mensual se conserva la regla observada:

```text
descanso existente
→ conflicto

turno existente
+
intervalos solapados
→ conflicto
```

El estado exacto elegible y la protección frente a cambios concurrentes posteriores pertenecen también a la revisión de estado actual.

#### 26. VISO mensual — límite mensual

El límite mensual es una decisión de servidor.

La UI puede mostrar:

```text
186 h
```

y estados visuales de advertencia, pero no puede declarar que un trabajador está dentro del límite.

El servidor debe recalcular las horas desde filas vigentes de `employee_shifts`, excluyendo las filas que el contrato vigente clasifique como no computables.

#### 27. Semántica de borrador por encima del límite

El baseline actual permite que la creación deje borradores por encima del límite y devuelve una advertencia de que no podrán publicarse hasta corregirse.

`AUTH-SRV-004` preserva esa semántica:

```text
DRAFT > LÍMITE
→ puede existir si el contrato mensual lo permite
→ no equivale a publicación válida
```

Por tanto, esta tarea **no** convierte el límite de 186 horas en rechazo obligatorio durante la creación del borrador.

Lo obligatorio es que el total mostrado o usado después sea recalculado en servidor.

#### 28. Publicación mensual

Antes de publicar, `publishMonthAction` debe resolver desde base de datos:

- borradores afectados;
- trabajadores afectados;
- filas mensuales vigentes de esos trabajadores;
- minutos computables;
- total mensual efectivo.

La decisión:

```text
PUBLISH
```

no puede depender de un flag `canPublish` enviado por interfaz.

Si el total efectivo supera el límite contractual, la publicación permanece bloqueada.

#### 29. Eliminación mensual

Para:

```text
deleteMonthlyDraftShiftAction
deleteMonthlyDraftsAction
```

los identificadores y periodo enviados se consideran selectores.

La eliminación efectiva debe obtenerse de las filas realmente persistidas que coincidan con el contrato de borrador eliminable.

El cliente no decide mediante flags qué filas están autorizadas para eliminación.

La validación específica de estado pertenece a `AUTH-SRV-011`.

#### 30. `requireStaffScheduleAccess`

El baseline contiene `requireStaffScheduleAccess`.

Para esta tarea se clasifica:

```text
EVIDENCIA DE CONTROL EXISTENTE
```

y no:

```text
PRUEBA DE CUMPLIMIENTO COMPLETO
```

`AUTH-SRV-004` no declara que ese helper resuelva el permiso exacto de cada escritura.

Ese handoff pertenece inmediatamente a `AUTH-SRV-005`.

#### 31. Handoff a `AUTH-SRV-005`

Después de reconstruir el efecto:

```text
effective_mutation
```

la siguiente tarea debe demostrar que el caller tiene el permiso exacto para ejecutar **esa** escritura.

La separación es vinculante:

```text
AUTH-SRV-004
→ qué efecto se pretende realmente ejecutar

AUTH-SRV-005
→ si el caller puede ejecutar ese efecto
```

No se considera equivalente tener acceso a la pantalla, al módulo o al calendario.

#### 32. Handoff territorial y operativo

El payload reconstruido proporciona las identidades que necesitan las tareas posteriores.

Ejemplo:

```text
effective_site_id
effective_area_id
effective_role
effective_shift
effective_device
effective_resource_state
```

Solo después de resolver esos valores puede verificarse correctamente:

- sede;
- área;
- turno;
- rol;
- dispositivo;
- estado;
- cruce territorial.

`AUTH-SRV-004` no aprueba esas dimensiones.

#### 33. Caso canónico de invitación laboral

La cobertura canónica ya establece que la activación de una invitación laboral toma rol, sede, identidad y alcance de una invitación persistida, pendiente, vigente y vinculada al actor.

Por tanto, para esa familia:

```text
cliente propone token / referencia / acción
servidor resuelve invitación persistida
servidor deriva identidad + rol + sede + alcance
```

Queda prohibido usar metadata autoadministrable o campos enviados por cliente para elevar la asignación.

Esta tarea no modifica esa regla; la consume como precedente canónico.

#### 34. Regla para campos protegidos

Cuando una entidad contenga una mezcla de:

```text
campos editables
+
campos derivados
+
campos protegidos
```

el servidor debe mantener una allowlist explícita.

Ejemplo abstracto:

```text
entrada:
name
notes
role
status
owner_id

editable:
name
notes

derivado/protegido:
role
status
owner_id
```

La existencia de `role`, `status` u `owner_id` en el request no los vuelve editables.

#### 35. Relectura de estado y concurrencia

Esta tarea exige recomputación en servidor, pero no declara resuelta por sí sola toda carrera concurrente.

La futura unidad deberá documentar si la garantía depende de:

- relectura inmediatamente anterior;
- restricción de base de datos;
- RPC transaccional;
- lock;
- comparación de versión;
- condición en la escritura;
- otra primitive canónica.

La protección específica de estado vigente y transición pertenece a `AUTH-SRV-011` y a las tareas de base de datos aplicables.

#### 36. Lineage obligatorio

Cada futura unidad debe conservar:

```text
entrada_cliente
→ campos aceptados
→ campos descartados
→ fuentes canónicas consultadas
→ valores derivados
→ restricciones recalculadas
→ payload efectivo
→ superficie de persistencia
```

Si existe RPC intermedia:

```text
superficie
→ argumentos reconstruidos
→ RPC
→ efecto
```

El lineage no puede terminar en “el frontend ya validó”.

#### 37. Materialización futura

La identidad física es:

```text
AUTH-SRV-004::<implementation_unit_id>
```

Cada instancia deberá registrar al menos:

```text
implementation_unit_id
repository
commit_before
surface_identity[]
client_controlled_fields[]
user_content_fields[]
server_derived_fields[]
current_state_sources[]
client_calculations_ignored[]
effective_payload_shape
conflict_recalculation
limit_recalculation
privileged_client_usage
package_id[]
change_set
rollback
validation_commands
evidence
commit_after
```

La misma unidad puede servir a varios paquetes con lineage explícito.

#### 38. Evidencia mínima de una unidad

Una futura implementación no puede declararse cumplida sin demostrar:

1. request manipulado no amplía columnas ni argumentos;
2. campos derivados se obtienen en servidor;
3. estado actual se vuelve a consultar cuando afecta el efecto;
4. cálculos cliente no deciden conflictos ni límites;
5. payload efectivo usa allowlist explícita;
6. admin/service role no recibe campos privilegiados sin resolución previa;
7. llamada directa produce las mismas restricciones que la UI;
8. el cambio no absorbe las tareas `005..013`;
9. existe rollback definido;
10. las validaciones autorizadas de la instancia pasan.

#### 39. Rollback

El rollback de una futura unidad deberá poder restaurar el comportamiento técnico anterior sin:

- borrar evidencia histórica;
- alterar contratos ajenos;
- ampliar permisos por compensación;
- dejar una mezcla parcial de payload antiguo y nuevo.

Si la corrección requiere migración o RPC nueva, su rollback deberá quedar coordinado con la tarea propietaria de base de datos.

#### 40. Criterios de aceptación

`AUTH-SRV-004` queda documentalmente satisfecha cuando:

1. toda entrada cliente tiene clase de confianza definida;
2. los campos derivados nunca dependen exclusivamente de UI;
3. el payload final se construye explícitamente;
4. queda prohibido mass assignment de payloads sensibles;
5. los conflictos se recalculan desde estado servidor;
6. los límites se recalculan desde estado servidor;
7. VISO mensual conserva la semántica draft > límite pero publicación bloqueada;
8. `return_to` queda limitado a navegación;
9. service role/admin client no convierte un request en autoridad;
10. se preserva el handoff a permiso, sede, área, turno, rol, dispositivo y estado;
11. existe contrato de materialización por unidad;
12. no se autorizan cambios físicos desde el marcador global;
13. no se crea ni modifica el registro de requisitos de prueba.

#### 41. Límites

Este marcador no certifica todavía:

- permiso exacto;
- sede autorizada;
- área autorizada;
- turno requerido;
- rol operativo efectivo;
- dispositivo compartido;
- transición de estado;
- protección cross-site;
- protección cross-area;
- identidad de principal/actor para todos los callers;
- auditoría completa;
- protección de simulación;
- manejo seguro de errores;
- idempotencia;
- firma SQL;
- grants;
- RLS;
- `SECURITY DEFINER`;
- atomicidad final;
- comportamiento productivo.

Esas propiedades conservan sus tareas propietarias.

#### 42. Evidencia de validación

| Clase     | Estado           | Evidencia                                                                                                                                                                              |
| --------- | ---------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| BUILD     | `NOT_EXECUTED`   | no se ejecutó build durante el desarrollo documental                                                                                                                                   |
| LOCAL     | `NOT_EXECUTED`   | no se ejecutaron comandos contra el checkout del usuario                                                                                                                               |
| REMOTA    | `PASS`           | se auditaron en solo lectura las fuentes canónicas vigentes, el owner del minibloque, el inventario aprobado de superficies, el registro AUTH de requisitos y el snapshot VISO mensual |
| OPERATIVA | `NOT_APPLICABLE` | el marcador no cambia operación real                                                                                                                                                   |
| FÍSICA    | `NOT_APPLICABLE` | no existe instancia física autorizada para esta tarea                                                                                                                                  |

#### 43. Requisitos de prueba derivados

**Resultado:** NO GENERA REQUISITOS DE PRUEBA.

La tarea define el contrato de frontera de confianza que consumirán futuras materializaciones.

El registro vigente ya contiene cobertura asociada a este riesgo y no necesita modificación documental para aprobar este marcador.

#### 44. Cobertura de prueba vigente reutilizada

Se reutiliza sin modificar el registro vigente:

- `TREQ-AUTH-005` — asignación laboral derivada de invitación persistida, no de valores cliente;
- `TREQ-AUTH-013` — URL, formulario, API o RPC manipulada no puede eludir autorización ni ampliar columnas;
- `TREQ-AUTH-017` — superficies sensibles SST no amplían alcance mediante cliente manipulado;
- `TREQ-AUTH-018` — datos de clientes mantienen protección equivalente ante URL, RPC, exportación y otras superficies;
- `TREQ-AUTH-052` — una superficie accesible por URL o aplicación instalada no constituye autorización.

Estas referencias son trazabilidad heredada y no representan requisitos creados o modificados por `AUTH-SRV-004`.

#### 45. Continuidad

**ÚLTIMA TAREA APROBADA**
`AUTH-SRV-003 — Inventariar RPC utilizadas`

**TAREA ACTUAL APROBADA**
`AUTH-SRV-004 — Eliminar confianza exclusiva en la interfaz`

**SIGUIENTE TAREA RESERVADA**
`AUTH-SRV-005 — Validar permiso en cada escritura`


### ✅ AUTH-SRV-005 — Validar permiso en cada escritura

**Estado:** APROBADA
**Tarea anterior:** AUTH-SRV-004 — Eliminar confianza exclusiva en la interfaz
**Tarea siguiente:** AUTH-SRV-006 — Validar sede en cada escritura
**Tipo de tarea:** Contrato global con materialización por unidad (`PER_IMPLEMENTATION_UNIT`) — contrato de autorización atómica por operación para que toda escritura protegida vincule en servidor su efecto efectivo con una única capacidad canónica exacta, evalúe ese permiso dentro del contexto resuelto y bloquee cualquier sustitución por acceso a aplicación, permiso de consulta, rol, pantalla visible o autorización implícita
**Bloque:** BLOQUE J — Protección de acciones de servidor
**Repositorio propietario:** `vento-group-sas/vento-shell`
**Archivo propietario:** `docs/plan-canonico/modular/bloques/J_ACCIONES_DE_SERVIDOR/02_VALIDACION_AUTORIZACION_Y_TERRITORIO.md`
**Estado físico resultante:** `ESPECIFICADO_NO_MATERIALIZADO`
**Cambios físicos autorizados:** 0 durante el marcador global; las futuras materializaciones ocurren únicamente mediante `AUTH-SRV-005::<implementation_unit_id>` después de que `DELIV-PKG-025::<package_id>` asigne la unidad y el paquete propietario supere `E5-GATE-008::<package_id>`
**Requisitos de prueba creados o modificados:** 0

---

#### 1. Propósito

Definir el contrato obligatorio mediante el cual toda escritura protegida debe validar en servidor el permiso funcional exacto correspondiente a la operación que realmente va a ejecutar.

La regla vinculante queda:

```text
OPERACIÓN EFECTIVA
→ CLAVE DE PERMISO EXACTA
→ EVALUACIÓN CANÓNICA
→ DECISIÓN
→ EFECTO
```

Queda prohibido:

```text
ACCESO A APLICACIÓN
→ AUTORIZACIÓN DE ESCRITURA

PERMISO DE CONSULTA
→ AUTORIZACIÓN DE ESCRITURA

ROL O CARGO
→ AUTORIZACIÓN DE ESCRITURA

BOTÓN VISIBLE
→ AUTORIZACIÓN DE ESCRITURA
```

#### 2. Handoff recibido de `AUTH-SRV-004`

`AUTH-SRV-004` entrega una mutación efectiva reconstruida en servidor:

```text
effective_mutation
```

`AUTH-SRV-005` añade inmediatamente:

```text
effective_mutation
→ required_permission_key
```

La clave no se recibe del cliente.

La clave se deriva en servidor a partir del tipo de operación efectiva.

#### 3. Definición de escritura

Para esta tarea se considera escritura toda operación que pueda cambiar estado empresarial o producir un efecto sensible, incluyendo:

- `insert`;
- `update`;
- `upsert`;
- `delete`;
- creación de borrador;
- modificación de borrador;
- publicación;
- cancelación;
- aprobación;
- rechazo;
- activación;
- desactivación;
- asignación;
- revocación;
- carga o eliminación sensible;
- ejecución de RPC mutante;
- envío a una cola con efecto empresarial;
- llamada a API externa que produzca un efecto;
- operación privilegiada mediante cliente administrativo o service role.

El verbo técnico no sustituye la acción empresarial.

#### 4. Consulta no equivale a escritura

Una operación de consulta puede requerir su propio permiso:

```text
view
```

pero:

```text
view
≠ create
view
≠ update
view
≠ delete
view
≠ publish
```

Un actor autorizado para consultar un recurso no obtiene autoridad para modificarlo.

#### 5. Acceso a aplicación no equivale a capacidad interna

La clave:

```text
viso.access
```

solo demuestra acceso a la aplicación VISO cuando el contrato vigente así lo resuelva.

No demuestra capacidad para:

- crear turnos;
- editar turnos;
- eliminar borradores;
- publicar programación;
- administrar seguridad;
- realizar cualquier otra mutación interna.

La misma regla aplica a `<app>.access` en las demás aplicaciones.

#### 6. Permiso atómico

Una escritura cumple esta tarea únicamente cuando existe una relación determinista:

```text
write_operation
→ one_exact_permission_key
```

No se permiten autorizaciones basadas en categorías vagas como:

```text
manage
admin
staff
operator
screen_access
module_access
```

cuando la acción real puede expresarse mediante una capacidad más específica.

#### 7. Convención de claves

Toda clave utilizada deberá respetar la convención canónica:

```text
app.module.resource.action
```

Las acciones aprobadas incluyen, entre otras:

```text
view
create
update
delete
publish
```

La clave usada por una superficie debe existir en una versión vigente del catálogo antes de habilitar físicamente la operación.

#### 8. Fuente de la clave requerida

La clave debe provenir de un mapping controlado por servidor o de un contrato compartido versionado.

Queda prohibido:

```text
request.permission
formData.permission
body.permission
query.permission
header.permission
```

como autoridad para elegir la capacidad que será evaluada.

El cliente puede solicitar una operación.

El servidor decide qué permiso exige esa operación.

#### 9. Ausencia de clave

Si una operación protegida no dispone de una clave canónica exacta:

```text
MISSING_PERMISSION_CONTRACT
→ DENY
→ ZERO_EFFECTS
```

La ausencia no se resuelve usando:

- `<app>.access`;
- un permiso `view`;
- un rol;
- una lista local de nombres;
- una clave `manage`;
- el permiso de una acción vecina.

La materialización permanece bloqueada hasta registrar la capacidad exacta.

#### 10. Clave desconocida o retirada

Si una clave:

- no existe en el catálogo vigente;
- está retirada;
- pertenece a otra aplicación;
- pertenece a otro recurso;
- no es compatible con la versión contractual;
- no puede resolverse sin ambigüedad;

la operación debe denegarse.

No se buscará una coincidencia aproximada.

#### 11. Resultado de evaluación

La evaluación debe producir una decisión explícita:

```text
ALLOW
DENY
TECHNICAL_FAILURE
```

Solo:

```text
ALLOW
```

permite continuar hacia el efecto.

`DENY` y `TECHNICAL_FAILURE` producen cero efectos.

El contrato detallado de error pertenece a `AUTH-SRV-016`.

#### 12. Binding y evaluación son pasos distintos

La clave puede determinarse antes de resolver todo el contexto:

```text
CREATE SHIFT
→ schedules.create
```

pero la evaluación definitiva debe usar el contexto efectivo requerido por el permiso.

Por tanto:

```text
BIND PERMISSION KEY
→ RESOLVE CONTEXT
→ EVALUATE PERMISSION
→ WRITE
```

Las tareas `AUTH-SRV-006..010` completan las dimensiones territoriales y operativas aplicables.

#### 13. Prohibición de autorización por rol

Ningún patrón equivalente a:

```text
if role == "propietario"
if role == "gerente_general"
if role in ADMIN_ROLES
```

sustituye la evaluación del permiso exacto.

Los roles pueden participar en la resolución canónica de autoridad.

No son el permiso final.

#### 14. Prohibición de autorización por UI

No es evidencia suficiente:

- botón renderizado;
- formulario disponible;
- página protegida;
- ruta visible;
- menú disponible;
- selector habilitado;
- estado local `canEdit`;
- prop React;
- feature flag de presentación.

Una llamada directa debe producir la misma decisión que la interfaz.

#### 15. Prohibición de fallback expansivo

Quedan prohibidos patrones equivalentes a:

```text
exact_permission
OR app.access

exact_permission
OR view_permission

exact_permission
OR admin_role
```

cuando el segundo término amplíe la capacidad atómica.

Un fallback solo puede existir cuando esté expresamente definido por un contrato canónico de alias o compatibilidad que preserve exactamente la misma capacidad.

#### 16. Alias seguros

Un alias legacy solo es admisible cuando existe una relación:

```text
legacy_key
→ exactly_one_canonical_key
```

y ambas representan la misma capacidad.

No se permite:

```text
legacy_view
→ create + update + delete + publish
```

ni:

```text
legacy_manage
→ todas las operaciones
```

por inferencia.

#### 17. Nuevas claves y deny por defecto

Toda clave nueva, dividida o reemplazada debe comenzar:

```text
DEFAULT_DENY
```

hasta que exista:

- versión de catálogo que la contenga;
- contrato compartido actualizado;
- matriz o concesión explícita aplicable;
- consumidores migrados;
- pruebas del paquete;
- evidencia de integración.

Ningún actor hereda automáticamente una capacidad nueva por tener la clave antigua más amplia.

#### 18. Catálogo y contrato compartido

Cuando una unidad de `AUTH-SRV-005` necesite una clave inexistente, deberá materializarla bajo los contratos ya aprobados de:

```text
AUTH-CAT-017
→ catálogo versionado

SHELL-CON-003
→ códigos de permisos centralizados
```

La superficie consumidora no deberá introducir una string huérfana como solución local.

#### 19. Asignaciones y matrices

Definir la clave no concede el permiso.

Las asignaciones continúan bajo los contratos propietarios de:

```text
AUTH-RBAC-*
VISO-AUTH-003
VISO-AUTH-004
```

cuando correspondan al tipo de actor y capacidad.

`AUTH-SRV-005` no asigna nuevos permisos a ningún rol.

#### 20. Cliente administrativo y service role

Antes de una escritura realizada con:

```text
admin client
service role
```

debe existir una evaluación de autorización en contexto del principal y actor efectivos.

La credencial privilegiada es un mecanismo técnico de ejecución.

No es evidencia de autorización empresarial.

#### 21. Orden antes del efecto

La regla mínima es:

```text
resolve principal / actor
→ reconstruct effective_mutation
→ bind exact permission
→ resolve required context
→ evaluate exact permission
→ validate remaining task-specific invariants
→ execute effect
```

Ningún efecto parcial puede ocurrir antes de finalizar las validaciones aplicables.

#### 22. Operaciones compuestas

Si una solicitud produce múltiples acciones funcionales:

```text
operation_A
+
operation_B
```

debe determinarse antes del primer efecto el conjunto completo de permisos requeridos.

Si cualquiera falta:

```text
DENY ALL
```

salvo que el contrato empresarial defina explícitamente operaciones independientes y recuperables.

#### 23. Operaciones masivas

Una operación masiva no reduce el permiso requerido.

Ejemplo:

```text
delete one draft
delete many drafts
```

pueden compartir la misma capacidad `delete`, pero cada recurso sigue sujeto a sus validaciones territoriales y de estado.

La autorización no se infiere porque la UI haya filtrado previamente el conjunto.

#### 24. Autorización de RPC

Cuando una superficie invoque una RPC mutante, la clave funcional requerida debe derivarse de la operación empresarial y no del nombre técnico de la función.

La capa de servidor debe validar la capacidad antes de invocar una RPC privilegiada.

La protección interna de la RPC, grants, RLS y `SECURITY DEFINER` continúa bajo las tareas de base de datos correspondientes.

#### 25. Autorización en API routes

Un método HTTP no constituye por sí mismo un permiso.

Ejemplo:

```text
POST
```

puede representar:

- create;
- update;
- approve;
- publish;
- perform.

La route debe resolver la acción empresarial concreta y exigir su clave exacta.

#### 26. Autorización en Server Actions

El nombre de una Server Action puede fijar estáticamente la clave requerida.

Ejemplo:

```text
publishMonthAction
→ permiso de publicación
```

Una acción genérica que reciba un parámetro `action` debe mapear cada valor permitido a una clave en servidor y rechazar valores no reconocidos.

#### 27. Baseline VISO mensual

El baseline heredado conserva:

```text
vento-group-sas/vento-viso
snapshot 8cf7c49a593c748cb6c99dd9b919b6947bcfec14
```

Superficies relevantes:

```text
src/app/staff/schedule/month/actions.ts
src/app/staff/schedule/month/block-actions.ts
src/app/api/viso/staff-schedule-shifts/route.ts
src/app/staff/schedule/helpers.ts
src/lib/auth/guard.ts
src/lib/auth/permissions.ts
```

#### 28. Estado actual de consulta

El permiso legacy observado es:

```text
viso.staff.schedule.view
```

Su normalización canónica aprobada es:

```text
viso.workforce.schedules.view
```

Esta capacidad pertenece exclusivamente a consulta de programación.

No se reutiliza como capacidad de escritura.

#### 29. Gap actual de escritura

En el catálogo documental auditado no existen todavía claves canónicas materializadas para:

```text
schedules.create
schedules.update
schedules.delete
schedules.publish
```

El baseline de VISO utiliza actualmente el permiso de consulta para Server Actions de escritura, y una API route observada admite además `viso.access` como autorización suficiente para modificar horarios.

Ese baseline queda clasificado como:

```text
CONTROL_EXISTENTE_NO_ATOMICO
```

y no como cumplimiento de `AUTH-SRV-005`.

#### 30. Familia objetivo VISO schedules

`AUTH-SRV-005` define como capacidades objetivo de la familia:

```text
viso.workforce.schedules.view
viso.workforce.schedules.create
viso.workforce.schedules.update
viso.workforce.schedules.delete
viso.workforce.schedules.publish
```

Estado contractual:

| Clave                              | Estado en el baseline              | Decisión                                                    |
| ---------------------------------- | ---------------------------------- | ----------------------------------------------------------- |
| `viso.workforce.schedules.view`    | normalización canónica ya definida | conserva consulta                                           |
| `viso.workforce.schedules.create`  | no materializada                   | crear como capacidad atómica antes de habilitar escritura   |
| `viso.workforce.schedules.update`  | no materializada                   | crear como capacidad atómica antes de habilitar edición     |
| `viso.workforce.schedules.delete`  | no materializada                   | crear como capacidad atómica antes de habilitar eliminación |
| `viso.workforce.schedules.publish` | no materializada                   | crear como capacidad atómica antes de habilitar publicación |

Las cuatro claves nuevas inician `DEFAULT_DENY`.

#### 31. Separación propietaria del package

La regla del package queda materializada como:

```text
CONSULTA
→ viso.workforce.schedules.view

BORRADOR NUEVO
→ viso.workforce.schedules.create

EDICIÓN DE BORRADOR
→ viso.workforce.schedules.update

ELIMINACIÓN
→ viso.workforce.schedules.delete

PUBLICACIÓN
→ viso.workforce.schedules.publish
```

Consulta, borrador, eliminación y publicación quedan separados.

#### 32. `createMonthlyShiftsAction`

Binding objetivo:

```text
createMonthlyShiftsAction
→ viso.workforce.schedules.create
```

La acción no puede quedar autorizada por:

```text
viso.workforce.schedules.view
viso.staff.schedule.view
viso.access
```

aunque cualquiera de esas claves permita abrir la pantalla.

#### 33. `createMonthlyScheduleBlocksAction`

Binding objetivo:

```text
createMonthlyScheduleBlocksAction
→ viso.workforce.schedules.create
```

La presencia de bloques laborales o de descanso no cambia la capacidad de creación.

Las validaciones específicas de área, rol, puntos externos y estado continúan en sus tareas propietarias.

#### 34. Edición mediante API route

Para:

```text
POST /api/viso/staff-schedule-shifts
```

la acción debe distinguir:

```text
sin shiftId
→ viso.workforce.schedules.create

con shiftId
→ viso.workforce.schedules.update
```

El parámetro `action` o la existencia de `shiftId` solo seleccionan una rama permitida.

No seleccionan libremente una clave recibida desde cliente.

#### 35. Eliminación individual

Binding objetivo:

```text
deleteMonthlyDraftShiftAction
→ viso.workforce.schedules.delete
```

La condición de que el turno sea borrador pertenece a `AUTH-SRV-011`.

El permiso `delete` no implica que cualquier turno sea eliminable.

#### 36. Eliminación masiva

Binding objetivo:

```text
deleteMonthlyDraftsAction
→ viso.workforce.schedules.delete
```

La autorización de la operación masiva no permite ampliar:

- sede;
- periodo;
- trabajador;
- estado;
- conjunto de filas.

Esas dimensiones continúan sujetas a `AUTH-SRV-006`, `AUTH-SRV-011` y `AUTH-SRV-012` cuando apliquen.

#### 37. API `DELETE`

Binding objetivo:

```text
DELETE /api/viso/staff-schedule-shifts
→ viso.workforce.schedules.delete
```

El baseline actual usa `canManageSchedule`.

La futura materialización debe eliminar como autorización final el fallback a:

```text
viso.access
```

y al permiso de consulta.

#### 38. Publicación

Binding objetivo:

```text
publishMonthAction
→ viso.workforce.schedules.publish
```

La publicación no se autoriza mediante:

```text
create
update
delete
view
access
```

Tener autoridad para preparar borradores no concede autoridad para publicarlos.

#### 39. Matriz de no implicación

La familia VISO schedules cumple:

| Permiso   | view         | create | update | delete | publish |
| --------- | ------------ | ------ | ------ | ------ | ------- |
| `view`    | sí           | no     | no     | no     | no      |
| `create`  | no implícito | sí     | no     | no     | no      |
| `update`  | no implícito | no     | sí     | no     | no      |
| `delete`  | no implícito | no     | no     | sí     | no      |
| `publish` | no implícito | no     | no     | no     | sí      |

Cualquier combinación adicional requiere concesiones explícitas independientes.

#### 40. Handoff a `AUTH-SRV-006`

`AUTH-SRV-005` entrega:

```text
required_permission_key
```

La siguiente tarea debe demostrar que la escritura está limitada a una sede autorizada cuando el contrato del permiso o recurso sea territorial.

Separación:

```text
005
→ QUÉ CAPACIDAD

006
→ EN QUÉ SEDE
```

Una clave correcta con sede incorrecta sigue siendo `DENY`.

#### 41. Handoff a `AUTH-SRV-007..013`

La aprobación de una clave exacta tampoco demuestra:

- área válida;
- turno requerido;
- rol operativo;
- dispositivo compartido;
- estado mutable;
- ausencia de cruce cross-site;
- ausencia de cruce cross-area.

Esas decisiones permanecen en:

```text
AUTH-SRV-007
AUTH-SRV-008
AUTH-SRV-009
AUTH-SRV-010
AUTH-SRV-011
AUTH-SRV-012
AUTH-SRV-013
```

#### 42. Materialización futura

La identidad física es:

```text
AUTH-SRV-005::<implementation_unit_id>
```

Cada unidad deberá registrar como mínimo:

```text
implementation_unit_id
repository
commit_before
surface_identity[]
write_operation[]
required_permission_key[]
permission_catalog_version
legacy_permission_key[]
legacy_fallback_removed[]
permission_binding_source
principal_resolution
actor_resolution
context_inputs
authorization_result
privileged_client_usage
package_id[]
change_set
rollback
validation_commands
evidence
commit_after
```

#### 43. Reglas para consumidores

Todo consumidor deberá:

1. importar la clave desde contrato compartido cuando esté disponible;
2. evitar strings locales nuevas;
3. mapear la operación a la clave en servidor;
4. evaluar antes del efecto;
5. fallar cerrado ante error;
6. no usar `view` para escribir;
7. no usar `<app>.access` para escribir;
8. no usar rol como sustituto;
9. no usar una clave de otra acción;
10. conservar evidencia de la decisión.

#### 44. Rollback

El rollback de una futura unidad deberá poder:

- restaurar el consumidor previo;
- restaurar la versión anterior del catálogo cuando el paquete lo permita;
- revertir contratos compartidos de forma compatible;
- preservar asignaciones históricas;
- preservar evidencia de autorizaciones y denegaciones;
- evitar que la reversa convierta una clave nueva en acceso implícito.

Un rollback no puede mantener código consumidor apuntando a una clave inexistente.

#### 45. Criterios de aceptación

`AUTH-SRV-005` queda documentalmente satisfecha cuando:

1. toda escritura se vincula con una acción funcional exacta;
2. la clave requerida se deriva en servidor;
3. acceso a aplicación no concede escritura;
4. permiso de consulta no concede escritura;
5. roles no sustituyen permisos;
6. aliases no amplían capacidades;
7. claves nuevas nacen denegadas;
8. operaciones compuestas resuelven todos sus permisos antes del primer efecto;
9. VISO schedules separa `view`, `create`, `update`, `delete` y `publish`;
10. `createMonthlyShiftsAction` y `createMonthlyScheduleBlocksAction` quedan vinculadas a `create`;
11. edición de turno queda vinculada a `update`;
12. eliminaciones quedan vinculadas a `delete`;
13. `publishMonthAction` queda vinculada a `publish`;
14. el fallback actual a `viso.access` o `staff.schedule.view` no se considera cumplimiento;
15. se preserva el handoff territorial a `AUTH-SRV-006`;
16. no se autorizan cambios físicos desde el marcador global;
17. no se crean ni modifican requisitos de prueba.

#### 46. Límites

Este marcador no certifica todavía:

- quién recibe las nuevas claves;
- sede autorizada;
- área autorizada;
- turno requerido;
- modalidad administrativa u operativa final;
- rol operativo;
- dispositivo compartido;
- estado actual del recurso;
- protección cross-site;
- protección cross-area;
- grants;
- RLS;
- seguridad interna de RPC;
- `SECURITY DEFINER`;
- error UX final;
- auditoría completa;
- idempotencia;
- atomicidad;
- despliegue del catálogo;
- migración física de consumidores.

Las responsabilidades anteriores conservan sus owners canónicos.

#### 47. Evidencia de validación

| Clase     | Estado           | Evidencia                                                                                                                                                                                                                                     |
| --------- | ---------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| BUILD     | `NOT_EXECUTED`   | no se ejecutó build durante el desarrollo documental                                                                                                                                                                                          |
| LOCAL     | `NOT_EXECUTED`   | no se ejecutaron comandos contra el checkout del usuario                                                                                                                                                                                      |
| REMOTA    | `PASS`           | se auditaron en solo lectura la continuidad vigente, el owner de `AUTH-SRV-005`, la convención canónica de permisos, el catálogo VISO, el helper de autorización, las superficies mensuales, la API de turnos y los fragmentos 04A relevantes |
| OPERATIVA | `NOT_APPLICABLE` | el marcador no cambia la operación real                                                                                                                                                                                                       |
| FÍSICA    | `NOT_APPLICABLE` | no existe instancia física autorizada para esta tarea                                                                                                                                                                                         |

#### 48. Requisitos de prueba derivados

**Resultado:** NO GENERA REQUISITOS DE PRUEBA.

**Justificación:** la regla de permiso exacto por mutación y la separación entre borrador y publicación ya disponen de cobertura vigente en el registro canónico. Esta tarea especifica el contrato que consumirán esas pruebas y no introduce una regla verificable sin requisito existente.

#### 49. Cobertura de prueba vigente reutilizada

Se reutiliza sin modificar el registro vigente:

- `TREQ-AUTH-002` — toda clave consumida debe existir en el catálogo vigente y usar la convención aprobada;
- `TREQ-AUTH-006` — campos y operaciones privilegiadas requieren capacidad y proyección autorizadas;
- `TREQ-AUTH-013` — cada mutación valida permiso exacto en servidor y no puede eludirse desde URL, formulario, API o RPC;
- `TREQ-VISO-013` — cada escritura de la ruta mensual requiere protección de servidor;
- `TREQ-VISO-037` — guardar borrador y publicar son comandos separados, con permisos y resultados distintos;
- `TREQ-VISO-042` — persona, sede, área, rol, fechas y alcance se revalidan en servidor.

Estas referencias son trazabilidad heredada y no representan requisitos creados o modificados por `AUTH-SRV-005`.

#### 50. Continuidad

**ÚLTIMA TAREA APROBADA**
`AUTH-SRV-004 — Eliminar confianza exclusiva en la interfaz`

**TAREA ACTUAL APROBADA**
`AUTH-SRV-005 — Validar permiso en cada escritura`

**SIGUIENTE TAREA RESERVADA**
`AUTH-SRV-006 — Validar sede en cada escritura`


### ✅ AUTH-SRV-006 — Validar sede en cada escritura

**Estado:** APROBADA
**Tarea anterior:** AUTH-SRV-005 — Validar permiso en cada escritura
**Tarea siguiente:** AUTH-SRV-007 — Validar área en cada escritura
**Tipo de tarea:** Contrato global con materialización por unidad (`PER_IMPLEMENTATION_UNIT`) — contrato de autorización territorial por sede para que toda escritura protegida derive la sede real del recurso o valide en servidor la sede objetivo de creación, cruce esa sede con el alcance territorial de la capacidad exacta resuelta por `AUTH-SRV-005` y deniegue cualquier efecto cuando la sede sea inválida, inactiva, ambigua o ajena a la autoridad efectiva del actor
**Bloque:** BLOQUE J — Protección de acciones de servidor
**Repositorio propietario:** `vento-group-sas/vento-shell`
**Archivo propietario:** `docs/plan-canonico/modular/bloques/J_ACCIONES_DE_SERVIDOR/02_VALIDACION_AUTORIZACION_Y_TERRITORIO.md`
**Estado físico resultante:** `ESPECIFICADO_NO_MATERIALIZADO`
**Cambios físicos autorizados:** 0 durante el marcador global; las futuras materializaciones ocurren únicamente mediante `AUTH-SRV-006::<implementation_unit_id>` después de que `DELIV-PKG-025::<package_id>` asigne la unidad y el paquete propietario supere `E5-GATE-008::<package_id>`
**Requisitos de prueba creados o modificados:** 0

---

#### 1. Propósito

Definir el contrato obligatorio para que toda escritura protegida valide en servidor **en qué sede** puede producirse el efecto.

`AUTH-SRV-005` determina la capacidad exacta.

`AUTH-SRV-006` determina el territorio de sede válido para esa capacidad.

La regla vinculante queda:

```text
effective_mutation
+
required_permission_key
+
target_site_resolved
+
site_scope_authorized
=
WRITE_ELIGIBLE_FOR_NEXT_GATES
```

Una capacidad correcta aplicada a una sede incorrecta continúa siendo:

```text
DENY
```

#### 2. Handoff recibido de `AUTH-SRV-005`

La tarea anterior entrega:

```text
effective_mutation
required_permission_key
```

Esta tarea añade:

```text
target_site_id
site_authorization_basis
site_authorization_result
```

La sede no se recibe como autoridad desde el cliente.

Debe resolverse o validarse contra fuentes canónicas antes del efecto.

#### 3. Distinciones territoriales obligatorias

Se mantienen separados:

```text
assigned_site
primary_site
selected_site
administrative_active_site
operational_active_site
resource_site
requested_site
```

No son sinónimos.

La autorización de escritura no puede colapsarlos en una propiedad genérica llamada “sede actual”.

#### 4. Fuente canónica del catálogo de sedes

La existencia y estado de una sede se resuelven desde:

```text
public.sites
```

Una sede utilizada en una escritura territorial debe:

- existir;
- estar activa;
- pertenecer al ámbito organizacional aplicable;
- ser compatible con el tipo de recurso o proceso;
- no ser tratada como sede laboral si en realidad es un punto técnico, punto de check-in, entorno aislado u otra clase no asignable.

Una sede inexistente o inactiva produce:

```text
DENY
```

#### 5. Fuente canónica de sedes asignadas

La fuente de verdad de las sedes laboralmente asignadas al actor o trabajador es:

```text
public.employee_sites
```

con la relación activa correspondiente.

No se utiliza como autoridad territorial:

```text
public.employees.site_id
```

Ese campo conserva carácter legacy y no sustituye `employee_sites`.

#### 6. Asignación no equivale a permiso

La regla permanece:

```text
ACTIVE_SITE_ASSIGNMENT
+
MISSING_PERMISSION
=
DENY
```

Tener una sede asignada únicamente establece elegibilidad territorial cuando el modo de alcance la consume.

No concede por sí sola ninguna capacidad.

#### 7. Permiso no crea asignación

Para un permiso cuya semántica exige sedes asignadas:

```text
EXACT_PERMISSION
+
UNASSIGNED_SITE
=
DENY
```

La capacidad exacta definida por `AUTH-SRV-005` no crea automáticamente una relación en `employee_sites`.

#### 8. Sede primaria no equivale a autorización

```text
employee_sites.is_primary = true
```

sirve como referencia laboral o fallback administrativo cuando corresponda.

No demuestra por sí sola que una escritura sobre esa sede esté autorizada.

#### 9. Sede seleccionada no equivale a autorización

```text
selected_site_id
```

es una preferencia de interfaz.

Puede orientar navegación o filtros.

No puede:

- conceder alcance;
- ampliar alcance;
- sustituir la sede real del recurso;
- modificar la evaluación del permiso fuera de las reglas canónicas.

#### 10. Sede solicitada por cliente

Valores como:

```text
site_id
siteId
requested_site
preferredSiteId
```

se clasifican como:

```text
SELECTOR_INTENT
```

Su significado es únicamente:

```text
“el caller solicita operar sobre esta sede”
```

No significa:

```text
“esta sede está autorizada”
```

#### 11. Sede del recurso

Cuando el recurso ya existe, su sede real controla la autorización territorial.

La regla canónica queda:

```text
resource_site_id
→ TARGET SITE FOR AUTHORIZATION
```

No exclusivamente:

```text
request.site_id
selected_site_id
primary_site_id
```

#### 12. Recursos con sede directa

Si el recurso contiene:

```text
site_id
```

la escritura debe leer o restringir el recurso utilizando esa sede persistida.

Ejemplos:

- turnos;
- inventario;
- remisiones;
- recepciones;
- movimientos;
- objetos administrativos territorializados.

El servidor no debe asumir que el `site_id` recibido coincide con el persistido.

#### 13. Recursos con sede indirecta

Si el recurso no guarda la sede directamente, debe resolverse por una relación canónica reproducible.

Ejemplo conceptual:

```text
child_resource
→ parent_resource
→ site_id
```

Si la relación:

- falta;
- es ambigua;
- devuelve múltiples sedes sin contrato multisede;
- no puede resolverse;

el resultado es:

```text
RESOURCE_SITE_UNRESOLVED
→ DENY
```

#### 14. Creación de un recurso nuevo

Durante creación todavía no existe `resource_site_id` persistido.

El servidor debe:

1. recibir la sede como intención;
2. resolver la identidad canónica de la sede;
3. verificar que está activa y es compatible con el proceso;
4. comprobar el alcance territorial del actor para la capacidad exacta;
5. validar los vínculos laborales o empresariales aplicables;
6. construir el payload final con esa sede ya validada;
7. persistir exactamente esa `target_site_id`.

La sede del request nunca salta los pasos anteriores.

#### 15. Actualización de un recurso existente

Antes de actualizar:

```text
resource_id
→ current_resource
→ current_site_id
```

El permiso debe evaluarse contra la sede real del recurso.

Si el request intenta cambiar:

```text
current_site_id
→ requested_target_site_id
```

la operación deja de ser una actualización territorial ordinaria y debe clasificarse como cambio o cruce de sede.

No se autoriza silenciosamente dentro del path normal.

#### 16. Eliminación de un recurso existente

Para eliminar:

```text
resource_id
→ persisted_site_id
→ permission + site evaluation
→ delete
```

El `site_id` del request puede usarse como filtro defensivo adicional.

No puede ser la única evidencia de la sede objetivo.

#### 17. Publicación, aprobación y transición

Una transición sobre recursos territorializados debe evaluar la sede de los recursos que realmente serán afectados.

Un parámetro como:

```text
site_id
```

puede limitar la consulta.

La autoridad se demuestra con:

```text
resolved affected resources
+
their real site
+
required permission
+
authorized site scope
```

#### 18. Alcance global administrativo

Un permiso administrativo con alcance global explícito puede operar sobre sedes ordinarias de la organización sin requerir una fila `employee_sites` por cada sede.

Sin embargo:

```text
GLOBAL
≠
ALL PERMISSIONS
≠
ALL ENVIRONMENTS
≠
ISOLATED SITE BYPASS
```

La sede del recurso continúa resolviéndose.

El permiso exacto continúa siendo obligatorio.

#### 19. Alcance por sedes asignadas

Para:

```text
site_scope_mode = assigned_sites
```

la autoridad se obtiene de:

```text
public.employee_sites
```

activas del actor.

La sede objetivo debe pertenecer al conjunto efectivo.

La semántica legacy:

```text
scope_type = site
scope_site_id = null
```

se interpreta conforme al contrato canónico como sedes activamente asignadas, no como global.

#### 20. Alcance por sede específica

Para:

```text
site_scope_mode = specific_site
```

la sede real del recurso debe coincidir exactamente con la sede concedida.

No existe herencia automática hacia:

- sedes hermanas;
- sedes del mismo tipo;
- sedes subordinadas;
- sede primaria;
- sede seleccionada.

#### 21. Alcance por tipo de sede

Cuando una capacidad tenga alcance por tipo de sede, la evaluación debe utilizar:

```text
real resource site
+
canonical site classification
```

La coincidencia de tipo no permite operar sobre:

- una sede inactiva;
- una sede aislada no incluida;
- una sede de clasificación distinta;
- un punto físico tratado indebidamente como sede empresarial.

#### 22. Alcance operativo

Para una capacidad operativa, incluso cuando su alcance sea reutilizable o global:

```text
operational permission
→ active operational site
```

La sede operativa procede del contexto laboral válido que corresponda.

No del selector administrativo.

Un permiso operativo global no significa:

```text
cross-site operational permission
```

#### 23. Alcance administrativo

Una capacidad administrativa por sede puede no requerir turno ni check-in cuando su contrato lo permita.

Sí requiere:

- actor válido;
- capacidad exacta;
- sede real;
- alcance administrativo que cubra esa sede.

La futura validación de rol operativo no se adelanta desde esta tarea.

#### 24. Diferencia entre actor y trabajador objetivo

En operaciones administrativas sobre otra persona deben separarse:

```text
ACTOR
→ quién ejecuta

TARGET EMPLOYEE
→ sobre quién recae la operación
```

Validar que el trabajador objetivo pertenece a una sede:

```text
target_employee ↔ site
```

no demuestra que el actor tenga autoridad sobre esa sede.

Ambas relaciones son independientes.

#### 25. Vínculo del trabajador objetivo

Cuando la operación exige que un trabajador pueda ser programado o administrado en una sede, la elegibilidad del trabajador objetivo debe resolverse desde:

```text
employee_sites
```

activa y una sede activa/asignable.

`employees.site_id` no es prueba canónica suficiente del vínculo.

#### 26. Site authority del actor

La autoridad territorial del actor se determina mediante la intersección de:

```text
required_permission_key
permission_scope
target_site_id
actor_context
applicable_assignments
```

según la modalidad administrativa u operativa.

El vínculo del trabajador objetivo no sustituye esta intersección.

#### 27. Evaluación fail-closed

La escritura queda bloqueada si ocurre cualquiera de estos casos:

```text
missing_target_site
invalid_target_site
inactive_target_site
resource_site_unresolved
actor_site_scope_unresolved
actor_site_not_authorized
target_employee_site_invalid
site_scope_ambiguous
technical_site_resolution_failure
```

No existe fallback a una sede enviada por cliente.

#### 28. Uso de cliente administrativo o service role

Antes de utilizar un cliente que pueda omitir RLS:

```text
admin client
service role
```

la sede objetivo y la autoridad territorial deben estar resueltas.

La credencial privilegiada no sustituye la validación de sede.

#### 29. Contrato para Server Actions

Una Server Action mutante territorial debe demostrar:

```text
input
→ resolve target resource or target site
→ validate site
→ evaluate exact permission in site context
→ remaining gates
→ effect
```

No basta con que la página que renderizó el formulario ya estuviera filtrada por sede.

#### 30. Contrato para API routes

Una API route mutante debe tratar:

```text
path site
query site
body site
header site
```

como intentos no autoritativos.

Para recursos existentes debe preferir la sede derivada del recurso.

Para creación debe validar la sede objetivo antes de utilizarla como contexto efectivo.

#### 31. Contrato para RPC

Una capa de servidor que invoque una RPC mutante deberá pasar una sede ya resuelta cuando la función requiera territorio.

Si la RPC puede ser invocada directamente por callers no privilegiados, su protección interna deberá producir una decisión territorial compatible.

La revisión de RLS, grants y `SECURITY DEFINER` pertenece a las tareas de base de datos correspondientes.

#### 32. Operaciones masivas de una sola sede

Una operación masiva declarada como single-site debe demostrar que todas las filas afectadas pertenecen a:

```text
one target_site_id
```

y que esa sede está autorizada.

Una sola fila fuera de esa sede invalida el supuesto single-site.

#### 33. Operaciones que tocan más de una sede

Cuando el conjunto efectivo contiene:

```text
site_count > 1
```

la operación debe clasificarse como multisede.

`AUTH-SRV-006` no concede autoridad transversal por el hecho de que una de las sedes esté autorizada.

La regla completa de cruces entre sedes pertenece a `AUTH-SRV-012`.

#### 34. Handoff a `AUTH-SRV-007`

Después de resolver:

```text
target_site_id
```

la siguiente tarea puede validar el área aplicable dentro de esa sede.

Separación:

```text
006
→ QUÉ SEDE

007
→ QUÉ ÁREA DENTRO DE ESA SEDE
```

Una sede autorizada no concede automáticamente todas sus áreas.

#### 35. Handoff a `AUTH-SRV-008`

`AUTH-SRV-006` no decide si la capacidad exige turno.

Entrega la sede resuelta.

`AUTH-SRV-008` determina cuándo el turno es prerrequisito y cuál turno satisface el contexto.

#### 36. Handoff a `AUTH-SRV-009`

La validación de sede no demuestra que el rol operativo sea válido.

`AUTH-SRV-009` conserva:

- rol efectivo;
- habilitación del rol en la sede;
- puntos externos asociados cuando correspondan.

#### 37. Handoff a `AUTH-SRV-010`

En dispositivo compartido, la sede del dispositivo puede reducir la autoridad efectiva.

`AUTH-SRV-006` no certifica el dispositivo.

`AUTH-SRV-010` debe comprobar la identidad y restricciones del dispositivo y su intersección con actor, sede y área.

#### 38. Handoff a `AUTH-SRV-011`

Una sede correcta no demuestra que el recurso esté en un estado mutable.

`AUTH-SRV-011` conserva:

- borrador;
- publicado;
- cancelado;
- transición permitida;
- estado concurrente.

#### 39. Handoff a `AUTH-SRV-012`

`AUTH-SRV-006` valida el target territorial de cada escritura single-site.

`AUTH-SRV-012` gobierna:

- operaciones con origen y destino;
- agregados multisede;
- escritura sobre conjuntos con varias sedes;
- cambios de sede;
- cualquier operación donde una sede autorizada pudiera utilizarse para alcanzar otra no autorizada.

#### 40. Baseline VISO mensual

Se conserva el snapshot:

```text
vento-group-sas/vento-viso
8cf7c49a593c748cb6c99dd9b919b6947bcfec14
```

Superficies relevantes:

```text
src/app/staff/schedule/month/actions.ts
src/app/staff/schedule/month/block-actions.ts
src/app/api/viso/staff-schedule-shifts/route.ts
src/app/staff/schedule/helpers.ts
src/lib/auth/guard.ts
src/lib/auth/permissions.ts
src/lib/auth/operational-session.ts
```

#### 41. Baseline VISO — `preferredSiteId`

El guard recibe una sede preferida y el resolver de sesión actual puede utilizar `preferredSiteId` directamente como `siteId` efectivo antes de demostrar por sí mismo que pertenece al conjunto territorial válido.

Ese comportamiento se clasifica:

```text
CONTROL_EXISTENTE_REQUIERE_RECONCILIACION_TERRITORIAL
```

No se declara automáticamente explotable, porque la evaluación posterior de permiso puede denegar.

Tampoco se considera cumplimiento de `AUTH-SRV-006`.

#### 42. Baseline VISO — `checkPermission`

El helper existente permite evaluar:

```text
has_permission(
  permission_code,
  p_site_id,
  p_area_id
)
```

La presencia de `p_site_id` es evidencia de que el modelo soporta contexto territorial.

`AUTH-SRV-006` exige además demostrar que el valor enviado en `p_site_id` es la sede correcta para la operación y no solo una sede elegida por el request.

#### 43. VISO mensual — creación

Para:

```text
createMonthlyShiftsAction
createMonthlyScheduleBlocksAction
```

el `site_id` recibido es intención.

Antes de insertar, la futura unidad debe demostrar:

```text
site exists and active
+
actor authorized for required create permission in target site
+
target employee actively linked to target site
+
site compatible with staff scheduling
```

Solo después:

```text
payload.site_id = validated_target_site_id
```

#### 44. VISO mensual — vínculo del trabajador

El baseline actual comprueba primero:

```text
employees.site_id === siteId
```

y solo consulta `employee_sites` cuando no coincide.

El contrato canónico aprobado establece que:

```text
employee_sites
→ source of truth

employees.site_id
→ legacy
```

Por tanto, la futura materialización debe dejar de usar `employees.site_id` como prueba suficiente de vínculo territorial.

#### 45. VISO mensual — matriz y perfil

Las consultas:

```text
vento_site_operational_role_matrix_v1
employee_site_operational_profiles
```

ya se filtran por `site_id`.

Ese filtrado es evidencia útil.

No sustituye la autoridad del actor sobre la sede.

La validación de área y rol permanece en `AUTH-SRV-007` y `AUTH-SRV-009`.

#### 46. VISO mensual — eliminación individual

Para:

```text
deleteMonthlyDraftShiftAction
```

el baseline filtra:

```text
shift.id
+
shift.site_id
```

antes de eliminar.

La futura unidad debe garantizar además que el `site_id` usado por ese filtro haya sido resuelto como sede autorizada del actor o que la sede se derive del turno persistido antes de autorizar.

La condición de borrador permanece en `AUTH-SRV-011`.

#### 47. VISO mensual — eliminación masiva

Para:

```text
deleteMonthlyDraftsAction
```

la operación está declarada por sede y mes.

Antes del `DELETE`, debe existir:

```text
validated_target_site_id
+
required delete permission
+
authorized site scope
```

El hecho de que la query use `.eq("site_id", siteId)` limita filas pero no prueba por sí solo autoridad sobre esa sede.

#### 48. VISO mensual — publicación

Para:

```text
publishMonthAction
```

la sede recibida limita los turnos que se seleccionan y publican.

La futura unidad deberá probar que la sede está autorizada **antes** de utilizar un cliente administrativo para actualizar las filas.

El cálculo mensual puede consultar turnos del mismo trabajador en otras sedes para calcular el límite.

Esa lectura auxiliar no convierte la publicación en autoridad de escritura sobre esas otras sedes.

#### 49. VISO API — creación

Para:

```text
POST /api/viso/staff-schedule-shifts
```

sin `shiftId`, el `siteId` del body debe:

1. validarse como sede;
2. validarse contra el alcance del actor;
3. validarse como sede elegible del trabajador objetivo;
4. utilizarse solo después como `target_site_id`.

La comprobación del vínculo del trabajador objetivo no concede autoridad al actor.

#### 50. VISO API — actualización

Para:

```text
POST /api/viso/staff-schedule-shifts
```

con `shiftId`, la futura unidad debe resolver primero el turno existente:

```text
shiftId
→ persisted shift
→ current_site_id
```

Si:

```text
requested_site_id = current_site_id
```

puede continuar por el carril single-site después de las demás validaciones.

Si:

```text
requested_site_id != current_site_id
```

se clasifica como cambio de sede y debe pasar por el contrato de `AUTH-SRV-012`.

No se transforma el `site_id` del turno como efecto lateral de una edición ordinaria.

#### 51. VISO API — eliminación

El baseline de `DELETE /api/viso/staff-schedule-shifts` ya contiene un patrón más fuerte:

```text
request shiftId
→ read persisted shift
→ obtain shift.site_id
→ permission check using shift.site_id
→ delete
```

La comprobación preliminar basada en el `siteId` recibido no es suficiente por sí sola.

La revalidación contra `shift.site_id` persistido es la referencia contractual que debe preservarse y alinearse con el permiso atómico de `AUTH-SRV-005`.

#### 52. Gap contractual del baseline

El baseline VISO contiene controles parciales correctos:

- `p_site_id` en evaluación de permiso;
- vínculo trabajador-sede;
- filtros de escritura por `site_id`;
- lecturas de `shift.site_id`;
- matrices y perfiles filtrados por sede.

También contiene brechas frente al contrato definitivo:

- `preferredSiteId` puede convertirse prematuramente en contexto efectivo;
- `employees.site_id` todavía se acepta como prueba suficiente de vínculo;
- varias escrituras parten de un `site_id` de request sin derivar primero la sede real del recurso;
- update de turno puede construir payload con una sede solicitada sin clasificar antes un posible cambio cross-site;
- admin client exige que la autorización territorial quede demostrada antes del efecto.

Estas brechas son propiedad de futuras unidades `AUTH-SRV-006::implementation_unit_id`.

#### 53. Lineage obligatorio

Cada futura unidad debe conservar:

```text
surface_identity
→ requested_site
→ resource_identity
→ persisted_or_validated_target_site
→ site_catalog_status
→ permission_scope
→ actor_site_basis
→ target_employee_site_basis when applicable
→ site_authorization_result
→ downstream area/shift/role/device/state gates
→ effect
```

No se acepta evidencia que termine en:

```text
“la UI ya estaba en esa sede”
```

#### 54. Materialización futura

Cada instancia:

```text
AUTH-SRV-006::<implementation_unit_id>
```

deberá registrar como mínimo:

```text
implementation_unit_id
repository
commit_before
surface_identity[]
write_operation[]
required_permission_key[]
requested_site_fields[]
resource_site_source[]
target_site_resolution
site_scope_mode
site_authorization_basis
actor_assigned_sites_source
target_employee_site_source
global_or_local_mode
privileged_client_usage
cross_site_detected
package_id[]
change_set
rollback
validation_commands
evidence
commit_after
```

#### 55. Evidencia mínima de una unidad

Una futura materialización no puede declararse cumplida sin demostrar:

1. sede inexistente → deny;
2. sede inactiva → deny;
3. sede no autorizada → deny;
4. sede seleccionada no amplía autoridad;
5. sede primaria no amplía autoridad;
6. `employees.site_id` no sustituye `employee_sites`;
7. creación valida sede antes del insert;
8. update/delete deriva o ata la sede al recurso persistido;
9. permiso global administrativo conserva límites de recurso y entorno;
10. permiso operativo queda limitado al contexto operativo aplicable;
11. actor y trabajador objetivo se validan por separado;
12. admin/service role no ejecuta antes de resolver territorio;
13. cambio de sede se clasifica para `AUTH-SRV-012`;
14. llamada directa produce la misma decisión territorial que la UI.

#### 56. Rollback

El rollback de una futura unidad deberá restaurar únicamente el mecanismo técnico anterior sin:

- convertir `employees.site_id` en fuente canónica nueva;
- retirar relaciones históricas de `employee_sites`;
- ampliar scopes de permiso;
- convertir site scope en global;
- eliminar evidencia territorial;
- permitir que un cambio cross-site vuelva al carril single-site silenciosamente.

Si la materialización introduce helper compartido, RPC o migración, su rollback deberá coordinarse con el owner técnico correspondiente.

#### 57. Criterios de aceptación

`AUTH-SRV-006` queda documentalmente satisfecha cuando:

1. la sede real del recurso controla la autorización de recursos existentes;
2. la sede objetivo de creación se valida antes de persistir;
3. `public.sites` gobierna existencia y estado;
4. `employee_sites` gobierna asignación laboral;
5. `employees.site_id` queda explícitamente como legacy y no como prueba suficiente;
6. sede primaria y seleccionada no conceden autoridad;
7. el permiso exacto se cruza con su scope territorial;
8. se distinguen global, assigned sites, specific site, site type y contexto operativo según contrato;
9. actor y trabajador objetivo se validan por separado;
10. admin/service role no omite la validación de sede;
11. recursos sin sede resoluble fallan cerrado;
12. operaciones single-site no absorben cambios cross-site;
13. VISO mensual deja definida la reconciliación de vínculo y autoridad de sede;
14. el update de turno diferencia edición local de cambio de sede;
15. se preservan los handoffs a área, turno, rol, dispositivo, estado y cross-site;
16. no se autorizan cambios físicos desde el marcador global;
17. no se crean ni modifican requisitos de prueba.

#### 58. Límites

Este marcador no certifica todavía:

- área autorizada;
- área activa;
- prerrequisito de turno;
- turno publicado/vigente;
- rol operativo efectivo;
- puntos externos;
- dispositivo compartido;
- estado mutable del recurso;
- autorización completa de una operación multisede;
- protección entre áreas;
- RLS;
- grants;
- `SECURITY DEFINER`;
- implementación física de `has_permission`;
- comportamiento productivo;
- atomicidad;
- idempotencia;
- contrato final de errores;
- auditoría completa.

Esas responsabilidades conservan sus tareas propietarias.

#### 59. Evidencia de validación

| Clase     | Estado           | Evidencia                                                                                                                                                                                                  |
| --------- | ---------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| BUILD     | `NOT_EXECUTED`   | no se ejecutó build durante el desarrollo documental                                                                                                                                                       |
| LOCAL     | `NOT_EXECUTED`   | no se ejecutaron comandos contra el checkout del usuario                                                                                                                                                   |
| REMOTA    | `PASS`           | se auditaron en solo lectura la continuidad vigente, la topología del Bloque J, el owner de `AUTH-SRV-006`, los contratos canónicos de sede y scopes, el registro 04A relevante y el snapshot VISO mensual |
| OPERATIVA | `NOT_APPLICABLE` | el marcador no cambia operación real                                                                                                                                                                       |
| FÍSICA    | `NOT_APPLICABLE` | no existe instancia física autorizada para esta tarea                                                                                                                                                      |

#### 60. Requisitos de prueba derivados

**Resultado:** NO GENERA REQUISITOS DE PRUEBA.

**Justificación:** la validación territorial por sede, la administración limitada al territorio autorizado y el rechazo de mutaciones manipuladas ya tienen cobertura vigente en el registro canónico. `AUTH-SRV-006` especifica el contrato que consumirán esas pruebas y no introduce una regla verificable sin cobertura existente.

#### 61. Cobertura de prueba vigente reutilizada

Se reutiliza sin modificar el registro vigente:

- `TREQ-AUTH-007` — administración de roles, perfiles, permisos y disponibilidad limitada al territorio autorizado del actor;
- `TREQ-AUTH-008` — separación entre capacidades administrativas y capacidades operativas con contexto territorial/laboral;
- `TREQ-AUTH-009` — resolución determinista de sede y área efectivas y denegación de cruces territoriales;
- `TREQ-AUTH-013` — cada mutación valida en servidor permiso, territorio, contexto, estado y columnas permitidas;
- `TREQ-VISO-042` — persona, sede, área, rol, fechas y alcance se revalidan nuevamente en servidor.

Estas referencias son trazabilidad heredada y no representan requisitos creados o modificados por `AUTH-SRV-006`.

#### 62. Continuidad

**ÚLTIMA TAREA APROBADA**
`AUTH-SRV-005 — Validar permiso en cada escritura`

**TAREA ACTUAL APROBADA**
`AUTH-SRV-006 — Validar sede en cada escritura`

**SIGUIENTE TAREA RESERVADA**
`AUTH-SRV-007 — Validar área en cada escritura`


### ✅ AUTH-SRV-007 — Validar área en cada escritura

**Estado:** APROBADA
**Tarea anterior:** AUTH-SRV-006 — Validar sede en cada escritura
**Tarea siguiente:** AUTH-SRV-008 — Validar turno cuando corresponda
**Tipo de tarea:** Contrato global con materialización por unidad (`PER_IMPLEMENTATION_UNIT`) — contrato de autorización territorial por área para que toda escritura protegida resuelva en servidor el área real del recurso o la derive de una fuente canónica válida, verifique su pertenencia a la sede ya autorizada por `AUTH-SRV-006`, evalúe el alcance de área exigido por la capacidad exacta de `AUTH-SRV-005` y falle cerrado ante áreas inexistentes, inactivas, ambiguas, incompatibles o fuera del territorio efectivo del actor
**Bloque:** BLOQUE J — Protección de acciones de servidor
**Repositorio propietario:** `vento-group-sas/vento-shell`
**Archivo propietario:** `docs/plan-canonico/modular/bloques/J_ACCIONES_DE_SERVIDOR/02_VALIDACION_AUTORIZACION_Y_TERRITORIO.md`
**Estado físico resultante:** `ESPECIFICADO_NO_MATERIALIZADO`
**Cambios físicos autorizados:** 0 durante el marcador global; las futuras materializaciones ocurren únicamente mediante `AUTH-SRV-007::<implementation_unit_id>` después de que `DELIV-PKG-025::<package_id>` asigne la unidad y el paquete propietario supere `E5-GATE-008::<package_id>`
**Requisitos de prueba creados o modificados:** 0

---

#### 1. Propósito

Definir el contrato obligatorio para que toda escritura protegida determine si el efecto debe quedar limitado a un área empresarial concreta, a un tipo de área dentro de una sede autorizada o a un recurso legítimamente site-level sin área específica.

`AUTH-SRV-006` entrega una sede ya resuelta y autorizada.

`AUTH-SRV-007` añade la dimensión de área sin reabrir la decisión de sede.

La regla vinculante queda:

```text
effective_mutation
+
required_permission_key
+
validated_target_site_id
+
resolved_area_requirement
+
resolved_target_area
+
area_authorization_result
=
WRITE_ELIGIBLE_FOR_NEXT_GATES
```

Una sede correcta no convierte automáticamente en válidas todas sus áreas.

#### 2. Handoff recibido de `AUTH-SRV-006`

La tarea anterior entrega como mínimo:

```text
required_permission_key
target_site_id
site_authorization_basis
site_authorization_result
```

`AUTH-SRV-007` consume ese resultado y produce:

```text
area_requirement
target_area_id
target_area_kind
area_resolution_source
area_authorization_basis
area_authorization_result
```

No se permite resolver un área cuya sede contradiga `target_site_id`.

#### 3. Frontera de responsabilidad

Esta tarea responde:

```text
¿EN QUÉ ÁREA PUEDE PRODUCIRSE ESTA ESCRITURA?
```

No responde todavía:

```text
¿REQUIERE TURNO?
¿QUÉ TURNO ES VÁLIDO?
¿QUÉ ROL OPERATIVO ES VÁLIDO?
¿QUÉ DISPOSITIVO PUEDE INTERVENIR?
¿EL ESTADO ACTUAL DEL RECURSO ADMITE LA MUTACIÓN?
¿PUEDE CRUZAR ENTRE ÁREAS?
```

Esas decisiones permanecen en `AUTH-SRV-008`, `AUTH-SRV-009`, `AUTH-SRV-010`, `AUTH-SRV-011` y `AUTH-SRV-013`.

#### 4. Conceptos de área que permanecen separados

Se mantienen distintos:

```text
organizational_area
assigned_area
primary_area
selected_area
administrative_active_area
operational_active_area
resource_area
requested_area
area_kind
```

No pueden colapsarse en una propiedad genérica llamada “área actual”.

#### 5. Fuente canónica del área empresarial

La fuente de verdad de las áreas empresariales es:

```text
public.areas
```

Toda área utilizada en autorización debe:

- existir;
- estar activa;
- pertenecer exactamente a una sede;
- pertenecer a la misma sede validada para la escritura;
- representar un área empresarial autorizable;
- no confundirse con ubicación física interna, posición de inventario, geocerca, punto de marcación, dispositivo o centro de costo.

#### 6. Identidad estable del área

La identidad territorial concreta es:

```text
area_id
```

No:

```text
area_name
area_label
display_text
slug
translated_name
partial_match
```

Dos áreas con nombres similares o iguales continúan siendo identidades independientes.

#### 7. Invariante sede–área

Toda evaluación debe conservar:

```text
target_area.site_id
=
validated_target_site_id
```

Si la relación no coincide:

```text
AREA_SITE_MISMATCH
→ DENY
```

La validación de área nunca puede ampliar la sede ya autorizada.

#### 8. Área específica y tipo de área

Se mantienen separados:

```text
area_id
→ área empresarial concreta

area_kind / area_type
→ categoría funcional del área
```

Un tipo de área no sustituye la identidad del área real del recurso.

Cuando un permiso utilice tipo de área, el servidor debe resolver primero el `area_id` real y luego comparar su clasificación canónica.

#### 9. Fuente transitoria del tipo de área

Mientras el catálogo normalizado definitivo no esté materializado, el atributo funcional vigente puede ser:

```text
area_kind
```

Su uso contractual exige coincidencia exacta contra la clasificación almacenada.

No se autoriza por:

- nombre parecido;
- alias no registrado;
- texto visible;
- traducción;
- nombre de rol operativo.

#### 10. Clasificación obligatoria del recurso

Antes de decidir el área, la unidad debe clasificar el recurso u operación en una de estas semánticas:

```text
specific_area
site_level
multi_area
organization
```

`null` no puede significar por inferencia:

```text
todas las áreas
```

La ausencia de `area_id` debe tener una semántica explícita.

#### 11. Recurso `specific_area`

Para un recurso que pertenece a un área concreta:

```text
resource_area_id
→ target_area_id
```

La autorización utiliza esa identidad persistida o derivada canónicamente.

El área enviada por el cliente puede actuar como selector defensivo, pero no como autoridad.

#### 12. Recurso `site_level`

Un recurso legítimamente site-level puede no tener `area_id`.

En ese caso:

```text
area_id = null
```

significa únicamente:

```text
resource_scope = site_level
```

No concede automáticamente una capacidad area-scoped sobre todas las áreas.

La compatibilidad entre permiso y recurso debe estar declarada.

#### 13. Recurso `multi_area`

Cuando una operación afecta más de un área:

```text
area_count > 1
```

la unidad debe identificar todas las áreas reales afectadas antes de producir efectos.

`AUTH-SRV-007` clasifica y resuelve el conjunto.

La autorización transversal entre áreas pertenece a `AUTH-SRV-013`.

#### 14. Recurso `organization`

Un recurso organizacional sin sede ni área no debe forzarse artificialmente a un área.

Si una capacidad area-scoped intenta modificar un recurso organizacional sin contrato de segmentación:

```text
AREA_SCOPE_INCOMPATIBLE
→ DENY
```

#### 15. Área solicitada por cliente

Valores como:

```text
area_id
areaId
selected_area_id
roleContext.areaId
```

son:

```text
SELECTOR_INTENT
```

Su presencia expresa la intención del caller.

No demuestra:

```text
area_exists
area_active
area_belongs_to_site
area_authorized_for_actor
area_valid_for_role
area_valid_for_resource
```

#### 16. Área directa del recurso existente

Cuando el recurso persistido contiene:

```text
area_id
```

la escritura debe derivar su territorio desde ese valor.

Ejemplos:

- turno;
- solicitud productiva;
- configuración de rol;
- estación;
- asignación territorial;
- dispositivo con área fija.

Un parámetro del request no reemplaza el `area_id` persistido.

#### 17. Área indirecta

Cuando el recurso no almacena `area_id` directamente, la unidad debe declarar una ruta canónica reproducible.

Ejemplos conceptuales:

```text
movement
→ inventory_location
→ business_area
```

o:

```text
production_line
→ batch
→ order
→ production_area
```

La ausencia de columna directa no convierte al recurso en site-level.

#### 18. Fallo al resolver área

Si la ruta de resolución:

- no existe;
- devuelve un área inexistente;
- devuelve un área inactiva;
- devuelve varias áreas cuando el contrato exige una;
- contradice la sede;
- falla técnicamente;

el resultado es:

```text
DENY
```

No se utiliza como fallback un valor cliente.

#### 19. Creación de recurso area-scoped

Antes de crear un recurso con área:

1. recibir el área como intención o derivarla desde una fuente canónica;
2. resolver `target_area_id`;
3. consultar o demostrar la identidad canónica del área;
4. verificar que el área está activa;
5. verificar `target_area.site_id = validated_target_site_id`;
6. verificar el alcance territorial del actor para la capacidad exacta;
7. verificar la compatibilidad de la capacidad con área o tipo de área;
8. construir el payload final;
9. persistir únicamente el área ya resuelta.

#### 20. Actualización de recurso area-scoped

Para una actualización ordinaria:

```text
resource_id
→ persisted_resource
→ persisted_area_id
```

Ese `persisted_area_id` gobierna la evaluación.

Si el request pretende cambiar el área:

```text
persisted_area_id
!=
requested_area_id
```

la operación debe clasificarse como cambio cross-area y pasar al contrato de `AUTH-SRV-013`.

No se cambia de área silenciosamente dentro de una edición ordinaria.

#### 21. Eliminación de recurso area-scoped

Antes de eliminar:

```text
resource_id
→ persisted_area_id
→ area authorization
→ remaining gates
→ delete
```

La eliminación no queda autorizada únicamente por conocer el identificador del recurso o la sede.

#### 22. Publicación, aprobación y transiciones

Una transición masiva o de negocio debe resolver las áreas de las filas realmente afectadas.

Si el permiso es area-scoped:

```text
all affected areas
→ must be individually authorized
```

Si el permiso está definido como site-level para esa operación, las filas pueden abarcar varias áreas de la sede únicamente dentro del contrato explícito del recurso y sin crear un bypass cross-area.

#### 23. Capacidad con alcance de sede

Un permiso con alcance de sede puede cubrir recursos pertenecientes a varias áreas de esa misma sede cuando el contrato de la capacidad y del recurso sea site-level.

Eso no significa:

```text
site permission
→ any area-sensitive action automatically
```

Las operaciones cuyo recurso o semántica exijan área específica continúan sujetas a esta tarea.

#### 24. Capacidad con alcance de área específica

Para:

```text
permission_scope = specific_area
```

debe cumplirse:

```text
permission_area_id
=
target_area_id
```

y:

```text
target_area.site_id
=
validated_target_site_id
```

La coincidencia es por identidad, no por nombre ni tipo.

#### 25. Capacidad con alcance por tipo de área

Para un permiso por categoría funcional debe cumplirse:

```text
target_area_id
→ canonical area
→ canonical area_kind
→ exact permission area_kind match
```

Además debe existir un límite superior de sede ya autorizado.

Queda prohibido:

```text
area_kind
+
missing site scope
=
global area authority
```

#### 26. Áreas asignadas del actor

La fuente canónica futura de afiliación administrativa habitual es:

```text
public.employee_areas
```

Una fila activa puede formar parte del cálculo de alcance administrativo cuando el modo del permiso así lo requiera.

No concede por sí sola ninguna capacidad.

#### 27. Cobertura transitoria de `employee_areas`

La cobertura histórica incompleta de `employee_areas` no autoriza fallbacks expansivos.

Por tanto:

```text
missing employee_areas
≠
implicit authorization
```

y tampoco:

```text
missing employee_areas
→ use employees.area_id
```

La futura materialización deberá respetar el modo de alcance realmente aplicable a la capacidad.

#### 28. `employees.area_id`

```text
public.employees.area_id
```

se conserva como campo heredado.

No es fuente canónica de:

- autorización;
- áreas asignadas completas;
- área operativa;
- área del recurso;
- alcance territorial.

#### 29. Área primaria

```text
employee_areas.is_primary = true
```

puede representar una preferencia o afiliación habitual.

No equivale a:

```text
authorized_area_id
operational_active_area
resource_area
```

#### 30. Área seleccionada

```text
selected_area_id
```

es una preferencia administrativa de interfaz.

Puede filtrar la experiencia.

No puede:

- conceder autoridad;
- ampliar autoridad;
- reemplazar el área persistida;
- sobrevivir como autoridad residual cuando deja de ser válida.

#### 31. Actor y persona objetivo

En una escritura administrativa sobre otra persona deben separarse:

```text
ACTOR
→ autoridad que ejecuta

TARGET EMPLOYEE
→ persona afectada
```

Que la persona objetivo tenga afiliación o perfil en un área no demuestra que el actor pueda administrar esa área.

Ambas validaciones son independientes.

#### 32. Área operativa activa

Cuando una capacidad sea operativa y requiera área, la fuente canónica es:

```text
employee_shifts.area_id
```

dentro del contexto laboral válido que corresponda.

No se sustituye con:

```text
employee_areas
selected_area_id
primary_area_id
device.area_id
employees.area_id
```

#### 33. Relación con el turno

`AUTH-SRV-007` define qué área debe quedar asociada o validada.

No certifica todavía que exista un turno válido.

`AUTH-SRV-008` es propietario del prerrequisito de turno.

Por tanto, este marcador puede exigir:

```text
area_required_by_operation = true
```

sin declarar satisfecho el contexto laboral.

#### 34. Área obligatoria por configuración operacional

Cuando el contrato de rol o de la superficie determine que el área es obligatoria:

```text
required_area
+
target_area_id = null
=
DENY
```

No se aplica fallback a:

- área primaria;
- área seleccionada;
- primera área de la sede;
- área del dispositivo.

#### 35. Configuración site-wide

Una configuración operacional con:

```text
area_id = null
```

puede representar un rol o recurso de nivel sede.

No significa:

```text
all areas authorized
```

La capacidad concreta decide si una operación site-wide es compatible con ausencia de área específica.

#### 36. Ambigüedad

Cuando una combinación de sede, rol, recurso o intención pueda resolver más de un área y no exista una regla canónica determinista:

```text
AREA_AMBIGUOUS
→ DENY
```

No se selecciona arbitrariamente la primera coincidencia.

#### 37. Fallback determinista permitido

Si el caller no suministra área explícita, una unidad puede derivarla únicamente cuando existe una regla canónica inequívoca, por ejemplo:

- una única área compatible;
- una fila marcada canónicamente como default;
- una relación persistida única;
- una matriz activa que produzca un único resultado.

La fuente y la regla utilizada deben quedar registradas.

#### 38. Fallback prohibido ante área explícita inválida

Si el caller sí suministra un área concreta y esa área:

- no existe;
- no está activa;
- no pertenece a la sede;
- no aparece en la matriz aplicable;
- contradice el recurso;

la unidad no debe sustituirla silenciosamente por otra área default.

La intención inválida produce rechazo controlado.

#### 39. Uso de cliente administrativo o service role

Antes de una escritura mediante:

```text
admin client
service role
```

deben estar resueltos:

```text
target_site_id
target_area_semantics
target_area_id when required
area_authorization_result
```

La credencial privilegiada no sustituye la validación de área.

#### 40. Contrato para Server Actions

Toda Server Action mutante sensible a área debe demostrar:

```text
input
→ resolve resource/site
→ resolve area requirement
→ resolve canonical area
→ validate area against site
→ evaluate exact permission in area context when applicable
→ remaining gates
→ effect
```

Que la pantalla solo muestre áreas permitidas no constituye autorización.

#### 41. Contrato para API routes

Toda API mutante debe tratar:

```text
body.areaId
query.areaId
path area
header area
```

como intención no autoritativa.

Para recursos existentes debe preferir el área persistida.

Para creación debe validar la identidad canónica antes de persistir.

#### 42. Contrato para RPC

Una capa de servidor que invoque una RPC mutante deberá enviar un área ya resuelta cuando la función requiera contexto territorial.

Si la RPC puede ser invocada directamente por callers no privilegiados, su protección interna deberá producir una decisión compatible.

La revisión de grants, RLS y `SECURITY DEFINER` conserva sus owners de base de datos.

#### 43. Operación masiva single-area

Una mutación declarada como single-area debe demostrar:

```text
all affected rows
→ same target_area_id
```

y ese área debe estar autorizada.

Una fila perteneciente a otra área invalida el supuesto single-area.

#### 44. Operación multiárea

Cuando el conjunto contiene más de un área:

```text
area_count > 1
```

la unidad debe registrar el conjunto de identidades reales.

`AUTH-SRV-007` no concede autoridad transversal por resolverlas.

El gate de autorización cross-area pertenece a `AUTH-SRV-013`.

#### 45. Handoff a `AUTH-SRV-008`

La salida contractual hacia turno es:

```text
validated_target_site_id
area_requirement
target_area_id
area_authorization_result
```

`AUTH-SRV-008` determina cuándo la operación exige turno y cuál turno satisface ese territorio.

#### 46. Handoff a `AUTH-SRV-009`

La validación de área no demuestra que el rol operativo sea válido.

`AUTH-SRV-009` deberá comprobar:

```text
operational_role
+
target_site_id
+
target_area_id when required
+
active role matrix
```

sin reinterpretar el área ya resuelta.

#### 47. Handoff a `AUTH-SRV-010`

El área del dispositivo puede reducir el alcance efectivo.

`AUTH-SRV-010` debe cruzar:

```text
actor area
device area
resource area
```

cuando corresponda.

El dispositivo no redefine el área del recurso.

#### 48. Handoff a `AUTH-SRV-011`

Una identidad de área correcta no demuestra que el recurso esté en estado mutable.

Estado actual y transición continúan en `AUTH-SRV-011`.

#### 49. Handoff a `AUTH-SRV-013`

Todo intento de:

```text
source_area_id
!=
destination_area_id
```

o toda mutación cuyo conjunto efectivo abarque áreas distintas debe clasificarse para `AUTH-SRV-013`.

`AUTH-SRV-007` entrega las áreas reales.

`AUTH-SRV-013` decide si el cruce está autorizado.

#### 50. Baseline VISO mensual

Se conserva el snapshot:

```text
vento-group-sas/vento-viso
8cf7c49a593c748cb6c99dd9b919b6947bcfec14
```

Superficies relevantes:

```text
src/app/staff/schedule/month/actions.ts
src/app/staff/schedule/month/block-actions.ts
src/app/api/viso/staff-schedule-shifts/route.ts
src/app/staff/schedule/helpers.ts
src/lib/auth/permissions.ts
```

#### 51. VISO — soporte existente de contexto de área

El helper de permisos ya admite:

```text
PermissionContext.areaId
```

y lo transmite como:

```text
p_area_id
```

a `has_permission`.

Esto demuestra capacidad técnica de transportar contexto de área.

No demuestra que las escrituras actuales estén resolviendo o enviando el área correcta.

#### 52. VISO — `roleContext`

Las acciones mensuales reciben una cadena que codifica:

```text
role_code
+
area_id
```

Ese valor se clasifica como intención.

El área efectiva no es el fragmento recibido.

Debe ser el `area_id` de una fila canónica válida de la matriz aplicable.

#### 53. VISO — matriz operacional

El baseline consulta:

```text
vento_site_operational_role_matrix_v1
```

filtrando por:

```text
site_id
is_active = true
```

y consume:

```text
area_id
area_name
area_kind
role_code
is_default
```

La futura materialización deberá demostrar que la fila elegida:

- pertenece a la sede ya autorizada;
- representa una combinación vigente;
- referencia un área empresarial válida cuando `area_id` no sea null;
- no introduce un área distinta de la intención explícita sin una regla permitida.

#### 54. VISO — fallback observado en `resolveMatrixRow`

El baseline intenta primero:

```text
role_code
+
area_id
```

y si no encuentra coincidencia puede caer a:

```text
default row for role
```

o:

```text
single row for role
```

Ese fallback es aceptable únicamente cuando el área no fue expresamente seleccionada y la derivación es determinista conforme al contrato.

Si se suministró un `area_id` explícito que no corresponde, la futura materialización debe rechazarlo en lugar de convertir silenciosamente la intención en otra área.

#### 55. VISO — creación mensual

Para:

```text
createMonthlyShiftsAction
createMonthlyScheduleBlocksAction
```

un bloque laboral deberá resolver:

```text
validated_target_site_id
+
requested role/area intent
+
active canonical matrix row
=
resolved area for payload
```

El payload final puede utilizar:

```text
area_id = resolved_matrix_row.area_id
```

solo después de las validaciones de esta tarea.

#### 56. VISO — bloques de descanso

Un bloque de descanso puede estar legítimamente definido sin área específica si su contrato es site-level.

En ese caso:

```text
area_id = null
```

no significa todas las áreas.

Significa que el descanso pertenece a la sede y no a una subdivisión concreta, siempre que el modelo del recurso así lo autorice.

#### 57. VISO — API rápida de horarios

La ruta:

```text
POST /api/viso/staff-schedule-shifts
```

no recibe un `areaId` explícito en el body auditado.

Para turnos laborales deriva el área desde la matriz de rol.

La derivación solo es válida cuando el resultado es determinista y pertenece a `siteId`.

Si existen varias áreas posibles sin default canónico válido, debe fallar cerrado.

#### 58. VISO — actualización de turno

Cuando `shiftId` existe, la edición debe resolver primero el turno persistido, incluyendo:

```text
shift.site_id
shift.area_id
```

Si la edición conserva el área:

```text
resolved_area_id
=
persisted_area_id
```

puede continuar por el carril ordinario.

Si cambia:

```text
resolved_area_id
!=
persisted_area_id
```

debe clasificarse como operación cross-area para `AUTH-SRV-013`.

El baseline observado reconstruye el payload a partir de la matriz y por tanto requiere esta reconciliación explícita antes de la futura implementación.

#### 59. VISO — eliminación de turno

Una eliminación de un turno area-scoped debe resolver el `area_id` persistido antes de autorizar cuando la capacidad efectiva esté limitada por área.

Conocer únicamente:

```text
shiftId
siteId
```

no satisface un permiso area-scoped.

#### 60. VISO — publicación mensual

`publishMonthAction` puede afectar turnos pertenecientes a varias áreas de una misma sede.

La futura materialización debe clasificar la operación según el contrato del permiso `publish`:

```text
site-level publish
```

o:

```text
area-scoped publish
```

Si es site-level, cada fila continúa obligada a pertenecer a la sede autorizada y a conservar un área internamente válida cuando corresponda.

Si es area-scoped, todas las áreas afectadas deben entrar en el conjunto de autorización y el cruce se entrega a `AUTH-SRV-013`.

#### 61. VISO — controles existentes y brechas

El baseline contiene controles parciales útiles:

- `area_id` dentro de la matriz operacional;
- `area_kind` como clasificación funcional observable;
- selección de filas activas;
- persistencia de `area_id` en turnos laborales;
- contexto de permiso con soporte para `areaId`;
- bloqueo cuando una combinación de rol no puede resolverse de forma única en la API rápida.

No se consideran cumplimiento completo porque:

- las escrituras de scheduling no evalúan de forma general la capacidad exacta usando `areaId`;
- un área explícita inválida puede degradar a una fila default en los resolvers mensuales;
- no se demuestra de forma independiente que el área resuelta esté activa y pertenezca a `public.areas` salvo que la vista lo garantice contractualmente;
- la edición con `shiftId` puede reconstruir un área distinta sin clasificar primero un cambio cross-area;
- eliminaciones y publicaciones pueden necesitar contexto de área según el scope final de sus permisos.

#### 62. Lineage obligatorio

Cada futura unidad debe conservar:

```text
surface_identity
→ requested_area
→ resource_identity
→ validated_target_site_id
→ resource_area_resolution
→ target_area_id
→ target_area_site_id
→ target_area_kind
→ area_requirement
→ permission_area_scope
→ actor_area_basis
→ area_authorization_result
→ cross_area_detected
→ downstream shift/role/device/state gates
→ effect
```

#### 63. Materialización futura

Cada instancia:

```text
AUTH-SRV-007::<implementation_unit_id>
```

deberá registrar como mínimo:

```text
implementation_unit_id
repository
commit_before
surface_identity[]
write_operation[]
required_permission_key[]
validated_target_site_id
requested_area_fields[]
resource_area_source[]
area_requirement
target_area_id
target_area_kind
area_site_integrity
permission_area_scope
actor_area_basis
target_employee_area_basis
operational_area_source
privileged_client_usage
cross_area_detected
package_id[]
change_set
rollback
validation_commands
evidence
commit_after
```

#### 64. Evidencia mínima de una futura unidad

La materialización deberá demostrar, cuando aplique:

1. área inexistente → deny;
2. área inactiva → deny;
3. área de otra sede → deny;
4. área seleccionada no concede autoridad;
5. área primaria no concede autoridad;
6. `employees.area_id` no se usa como fuente canónica;
7. área explícita inválida no cae a otra default;
8. área ausente solo se deriva mediante regla determinista;
9. `area_id` y `area_kind` no se confunden;
10. creación persiste solo área resuelta;
11. update deriva área persistida antes de cambiarla;
12. delete deriva área persistida cuando el scope lo exige;
13. permiso area-scoped utiliza contexto `areaId`;
14. recurso site-level no convierte `null` en wildcard;
15. rol site-wide no concede automáticamente todas las áreas;
16. admin/service role no ejecuta antes de resolver territorio;
17. operación multiárea se clasifica para `AUTH-SRV-013`;
18. llamada directa produce la misma decisión que la interfaz.

#### 65. Rollback

El rollback de una futura unidad deberá poder restaurar el mecanismo técnico anterior sin:

- convertir `employees.area_id` en fuente canónica;
- convertir `selected_area_id` en autoridad;
- transformar `null` en wildcard;
- ampliar permiso de área a toda la sede;
- mezclar `area_id` con `area_kind`;
- eliminar la relación sede–área;
- permitir cambios cross-area silenciosos;
- retirar evidencia territorial histórica.

#### 66. Criterios de aceptación

`AUTH-SRV-007` queda documentalmente satisfecha cuando:

1. toda escritura clasifica si el área es específica, site-level, multiárea u organizacional;
2. `public.areas` queda como fuente canónica de identidad de área;
3. toda área concreta se valida contra la sede ya autorizada;
4. `area_id` y `area_kind` quedan separados;
5. el área real del recurso prevalece sobre el área de interfaz;
6. recursos con área indirecta declaran una ruta canónica;
7. recursos site-level no interpretan `null` como todas las áreas;
8. `employee_areas` queda como afiliación administrativa cuando el scope la requiera;
9. `employees.area_id`, área primaria y área seleccionada no conceden autoridad;
10. el área operativa se mantiene ligada al turno cuando corresponda sin absorber `AUTH-SRV-008`;
11. los scopes por área específica y por tipo de área se evalúan contra el área real;
12. el cliente privilegiado no omite validación de área;
13. una intención explícita inválida no cae silenciosamente a otra área;
14. una derivación sin área explícita debe ser determinista;
15. update y delete reconcilian el área persistida;
16. operaciones multiárea se entregan a `AUTH-SRV-013`;
17. VISO mensual deja definido el contrato de matriz activa y de área persistida;
18. se preservan los handoffs a turno, rol, dispositivo, estado y cross-area;
19. no se autorizan cambios físicos desde el marcador global;
20. no se crean ni modifican requisitos de prueba.

#### 67. Límites

Este marcador no certifica todavía:

- existencia de turno válido;
- publicación o vigencia del turno;
- check-in;
- rol operativo efectivo;
- habilitación final del rol en la matriz;
- identidad o restricciones de dispositivo compartido;
- estado mutable del recurso;
- autorización completa de una operación cross-area;
- cruces entre sedes;
- RLS;
- grants;
- `SECURITY DEFINER`;
- implementación física de `has_permission`;
- normalización final de `area_types`;
- poblamiento completo de `employee_areas`;
- atomicidad;
- idempotencia;
- auditoría completa;
- contrato final de errores.

Estas responsabilidades conservan sus owners canónicos.

#### 68. Evidencia de validación

| Clase     | Estado           | Evidencia                                                                                                                                                                                                              |
| --------- | ---------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| BUILD     | `NOT_EXECUTED`   | no se ejecutó build durante el desarrollo documental                                                                                                                                                                   |
| LOCAL     | `NOT_EXECUTED`   | no se ejecutaron comandos contra el checkout del usuario                                                                                                                                                               |
| REMOTA    | `PASS`           | se auditaron en solo lectura la continuidad vigente, la topología del Bloque J, el owner de `AUTH-SRV-007`, los contratos canónicos de áreas y tipos de área, los fragmentos 04A relevantes y el snapshot VISO mensual |
| OPERATIVA | `NOT_APPLICABLE` | el marcador no cambia operación real                                                                                                                                                                                   |
| FÍSICA    | `NOT_APPLICABLE` | no existe instancia física autorizada para esta tarea                                                                                                                                                                  |

#### 69. Requisitos de prueba derivados

**Resultado:** NO GENERA REQUISITOS DE PRUEBA.

**Justificación:** la resolución territorial de sede y área, la compatibilidad administrativa/operativa, el bloqueo de mutaciones manipuladas y la revalidación de persona, sede, área, rol, fechas y alcance ya disponen de cobertura vigente. `AUTH-SRV-007` especifica el contrato que consumirán esas pruebas y no introduce una obligación verificable sin requisito existente.

#### 70. Cobertura de prueba vigente reutilizada

Se reutiliza sin modificar el registro vigente:

- `TREQ-AUTH-007` — administración de roles, perfiles, permisos y disponibilidad limitada al territorio autorizado del actor;
- `TREQ-AUTH-008` — compatibilidad de sede y área dentro de la separación entre capacidades administrativas y operativas;
- `TREQ-AUTH-009` — resolución determinista de sede y área efectivas y denegación de cruces territoriales;
- `TREQ-AUTH-013` — cada mutación valida en servidor permiso exacto, territorio, contexto, estado y columnas permitidas;
- `TREQ-VISO-042` — persona, sede, área, rol, fechas y alcance se revalidan nuevamente en servidor.

Estas referencias son trazabilidad heredada y no representan requisitos creados o modificados por `AUTH-SRV-007`.

#### 71. Continuidad

**ÚLTIMA TAREA APROBADA**
`AUTH-SRV-006 — Validar sede en cada escritura`

**TAREA ACTUAL APROBADA**
`AUTH-SRV-007 — Validar área en cada escritura`

**SIGUIENTE TAREA RESERVADA**
`AUTH-SRV-008 — Validar turno cuando corresponda`


### ✅ AUTH-SRV-008 — Validar turno cuando corresponda

**Estado:** APROBADA
**Tarea anterior:** AUTH-SRV-007 — Validar área en cada escritura
**Tarea siguiente:** AUTH-SRV-009 — Validar rol operativo cuando corresponda
**Tipo de tarea:** Contrato global con materialización por unidad (`PER_IMPLEMENTATION_UNIT`) — contrato de prerrequisito laboral para que toda escritura protegida clasifique en servidor si su capacidad es administrativa u operativa, exija turno publicado y vigente únicamente cuando el contrato de autorización lo requiera, resuelva ese turno desde fuentes canónicas, valide su compatibilidad con actor, sede y área ya resueltas y falle cerrado ante ausencia, expiración, cancelación, ambigüedad o contexto laboral incompatible
**Bloque:** BLOQUE J — Protección de acciones de servidor
**Repositorio propietario:** `vento-group-sas/vento-shell`
**Archivo propietario:** `docs/plan-canonico/modular/bloques/J_ACCIONES_DE_SERVIDOR/02_VALIDACION_AUTORIZACION_Y_TERRITORIO.md`
**Estado físico resultante:** `ESPECIFICADO_NO_MATERIALIZADO`
**Cambios físicos autorizados:** 0 durante el marcador global; las futuras materializaciones ocurren únicamente mediante `AUTH-SRV-008::<implementation_unit_id>` después de que `DELIV-PKG-025::<package_id>` asigne la unidad y el paquete propietario supere `E5-GATE-008::<package_id>`
**Requisitos de prueba creados o modificados:** 0

---

#### 1. Propósito

Definir el contrato obligatorio para que cada escritura protegida determine, en servidor, si necesita contexto laboral de turno y, cuando lo necesite, cuál turno satisface realmente la operación.

La regla principal queda:

```text
administrative_capability
→ shift_not_required_unless_explicitly_declared

operational_capability
→ published_valid_shift_required
```

La existencia de sesión, permiso, sede o área no crea por sí sola un turno válido.

#### 2. Handoff recibido de `AUTH-SRV-007`

La tarea anterior entrega como mínimo:

```text
required_permission_key
validated_target_site_id
area_requirement
target_area_id
area_authorization_result
```

`AUTH-SRV-008` añade:

```text
authorization_mode
shift_requirement
effective_shift_id
shift_publication_status
shift_temporal_status
shift_site_id
shift_area_id
shift_resolution_result
active_attendance_requirement
```

No reabre la sede ni el área ya resueltas.

#### 3. Pregunta contractual propietaria

Esta tarea responde:

```text
¿ESTA ESCRITURA NECESITA TURNO?
```

y, si la respuesta es sí:

```text
¿QUÉ TURNO PUBLICADO Y VIGENTE CORRESPONDE AL ACTOR Y AL TERRITORIO EFECTIVO?
```

No decide todavía qué rol operativo exacto queda habilitado.

Esa responsabilidad permanece en `AUTH-SRV-009`.

#### 4. Separación administrativa y operativa

Toda superficie mutante deberá quedar clasificada como mínimo en uno de estos carriles:

```text
ADMINISTRATIVE
OPERATIONAL
```

La clasificación procede del contrato canónico de la capacidad y no de:

- la aplicación visible;
- la pantalla;
- el nombre del rol base;
- el dispositivo;
- la existencia de un turno;
- la intención del cliente.

#### 5. Regla para capacidades administrativas

Cuando el contrato de la capacidad sea administrativo:

```text
authorization_mode = ADMINISTRATIVE
```

la escritura no exigirá automáticamente:

```text
shift
check_in
operational_role
```

siempre que el contrato de la propia capacidad no establezca un prerrequisito laboral especial.

Administrar programación, perfiles, permisos o configuraciones desde un carril administrativo no se convierte en operación por tocar recursos laborales.

#### 6. Regla para capacidades operativas

Cuando el contrato de la capacidad sea operativo:

```text
authorization_mode = OPERATIONAL
```

deberá existir un turno canónico que sea, como mínimo:

```text
published
not_cancelled
temporally_applicable
owned_by_effective_actor
compatible_with_validated_site
compatible_with_target_area_when_required
```

Sin ese turno:

```text
DENY
```

#### 7. Fuente canónica del turno

La fuente de verdad laboral es:

```text
public.employee_shifts
```

El turno no se deriva de:

- horario mostrado en UI;
- selected site;
- selected area;
- rol base;
- employee_sites;
- employee_areas;
- check-in aislado;
- dispositivo;
- cookie;
- parámetro cliente.

#### 8. Turno publicado

Un turno utilizable para autorización operativa debe ser un turno publicado conforme al modelo canónico.

Un borrador o turno todavía no publicado no establece contexto operativo.

La regla es:

```text
draft_shift
→ NOT_OPERATIONAL_AUTHORITY
```

#### 9. Publicación no equivale a activación

Un turno publicado puede ser válido como asignación oficial sin estar todavía activo en el tiempo.

Se mantiene:

```text
PUBLISHED
≠
CURRENTLY_ACTIVE
```

La autorización de una acción operativa exige además que el turno sea temporalmente aplicable.

#### 10. Vigencia temporal

La evaluación debe comprobar que el instante autoritativo de la acción pertenece al intervalo del turno según la política temporal vigente.

No se utiliza como autoridad:

- hora del navegador;
- timestamp construido por cliente;
- zona horaria elegida en UI.

La fuente temporal debe ser server-side y coherente con la zona horaria contractual del turno.

#### 11. Turnos que cruzan medianoche

Un turno que cruza medianoche debe evaluarse mediante un intervalo temporal inequívoco.

No puede decidirse únicamente comparando:

```text
HH:mm
```

sin fecha y contexto temporal.

La futura unidad debe preservar correctamente fecha de inicio, fecha efectiva de fin y zona horaria aplicable.

#### 12. Confirmación del trabajador

La confirmación del empleado no es requisito de autorización.

Se conserva:

```text
published_shift
+
employee_not_confirmed
=
shift_still_valid_when_other_conditions_hold
```

La confirmación, si existe, es informativa y no crea ni retira autoridad.

#### 13. Turno cancelado

Un turno cancelado no puede satisfacer contexto operativo.

```text
cancelled_shift
→ DENY
```

El histórico puede conservarse, pero deja de participar en la decisión operativa.

#### 14. Turno retirado o republicado

Si un turno previamente publicado cambia de forma material, su versión anterior no puede continuar autorizando silenciosamente.

La futura materialización deberá resolver la versión vigente del turno y respetar la republicación o retiro aplicable.

#### 15. Actor efectivo

El turno exigido por una capacidad operativa pertenece al:

```text
effective_actor
```

No necesariamente al principal técnico, al usuario administrativo autenticado o al trabajador objetivo de la operación.

La identidad laboral debe quedar alineada antes de aceptar el turno.

#### 16. Actor y trabajador objetivo

En una operación administrativa sobre la programación de otra persona:

```text
ACTOR
→ administrador que ejecuta

TARGET EMPLOYEE
→ trabajador cuyo turno se crea o modifica
```

El turno del trabajador objetivo es el recurso administrado.

No es un prerrequisito de turno para el actor administrativo.

#### 17. Turno del recurso no equivale a turno del actor

Una escritura puede operar sobre un objeto `employee_shift` sin que eso implique:

```text
actor must have own active shift
```

La necesidad de turno depende del modo de autorización de la capacidad.

No del tipo de tabla modificada.

#### 18. Compatibilidad con sede

Para un carril operativo:

```text
effective_shift.site_id
=
validated_target_site_id
```

cuando la acción está territorialmente ligada a esa sede.

Una discrepancia produce:

```text
OPERATIONAL_SHIFT_SITE_MISMATCH
→ DENY
```

No se cambia la sede efectiva para adaptarla al turno.

#### 19. Compatibilidad con área

Cuando la capacidad requiere área:

```text
effective_shift.area_id
=
target_area_id
```

salvo una semántica site-wide explícita ya permitida por `AUTH-SRV-007`.

Una discrepancia no se corrige usando el área seleccionada ni la del dispositivo.

#### 20. Turno sin área

Un turno con:

```text
area_id = null
```

puede ser legítimo únicamente cuando el contrato operacional admite contexto site-wide.

No significa:

```text
all areas
```

Si la capacidad exige área específica:

```text
shift.area_id = null
→ DENY
```

#### 21. Turno y rol operativo

Un turno laboral puede contener:

```text
operational_role
```

pero `AUTH-SRV-008` solo conserva ese dato como salida de contexto.

No certifica que el rol:

- exista;
- esté activo;
- esté habilitado en la sede;
- esté habilitado en el área;
- posea la capacidad requerida.

La evaluación del rol pertenece a `AUTH-SRV-009`.

#### 22. Ambigüedad entre turnos

Si más de un turno laboral puede satisfacer simultáneamente el mismo contexto operativo y la regla canónica no puede resolver uno de forma inequívoca:

```text
MULTIPLE_ELIGIBLE_SHIFTS
→ DENY
```

No se elige:

- el primero;
- el más reciente;
- el más largo;
- el turno de la sede seleccionada;

por inferencia.

#### 23. Solapamiento

El modelo operativo no debe depender de turnos laborales publicados solapados para el mismo actor cuando puedan crear dos contextos simultáneos incompatibles.

La futura unidad debe detectar el caso o consumir una garantía canónica que lo impida.

La existencia de dos candidatos no se interpreta como unión de autoridad.

#### 24. Descanso

Un bloque o turno de descanso no crea contexto operacional activo.

```text
published_rest
→ NO_OPERATIONAL_AUTHORITY
```

Puede ser un recurso laboral válido para planificación, pero no habilita acciones operativas.

#### 25. Turno futuro

Un turno publicado cuyo intervalo todavía no ha comenzado:

```text
FUTURE_SHIFT
→ NO_CURRENT_OPERATIONAL_AUTHORITY
```

No concede permisos anticipados.

#### 26. Turno expirado

Un turno cuyo intervalo ya finalizó:

```text
EXPIRED_SHIFT
→ NO_CURRENT_OPERATIONAL_AUTHORITY
```

No conserva autoridad por caché ni por haber sido válido minutos antes.

#### 27. Publicación tardía

Publicar un turno después de que parte de su intervalo haya transcurrido no crea autoridad retroactiva para acciones anteriores.

La autorización solo puede evaluarse con el estado vigente al momento autoritativo de la acción.

#### 28. Cambio durante una sesión

Si el turno cambia, se cancela, expira o deja de ser compatible con sede o área:

```text
previous_operational_context
→ STALE
```

Las decisiones cacheadas no pueden continuar ejecutando mutaciones con la autoridad anterior.

La invalidación física completa conserva su owner de contexto/frescura.

#### 29. Relación con check-in

El modelo canónico diferencia:

```text
published_shift
≠
active_check_in
```

Para capacidades operativas ordinarias, el contexto operativo completo requiere además un check-in activo cuando el contrato así lo define.

`AUTH-SRV-008` debe distinguir:

```text
shift_valid
active_attendance_required
active_attendance_present
```

sin convertir un evento de asistencia aislado en fuente del turno.

#### 30. Check-in nunca crea turno

Se conserva:

```text
check_in
+
missing_valid_published_shift
=
DENY
```

El check-in es evidencia laboral subordinada a un turno válido.

No puede reconstruir por sí solo sede, área, rol o intervalo operativo.

#### 31. Check-in confirmado

Cuando se exige contexto operativo activo, el check-in debe estar confirmado y persistido en la fuente canónica.

Un evento:

```text
pending
offline_only
client_local
unconfirmed
```

no satisface el gate de operación.

#### 32. Check-out

Un check-out que cierra la sesión laboral elimina la condición de contexto activo para operaciones posteriores que lo exijan.

```text
checked_out
→ active_attendance_present = false
```

No borra el histórico del turno ni la asistencia.

#### 33. Capacidad operativa sin check-in exigible

Si una capacidad específica estuviera canónicamente clasificada como operativa pero su contrato permitiera ejecución con turno publicado vigente sin check-in, esa excepción deberá estar declarada expresamente.

No puede inferirse por aplicación, rol o conveniencia.

La modalidad por defecto no degrada el requisito de contexto.

#### 34. Acción administrativa durante un turno

La existencia de un turno activo no transforma una capacidad administrativa en operativa.

Un administrador puede continuar usando una capacidad administrativa bajo su contrato administrativo aunque además tenga un turno activo.

El turno no amplía la capacidad.

#### 35. Acción operativa de un administrador

Un actor con rol administrativo que intente ejecutar una capacidad operativa deberá satisfacer el mismo contexto operativo que cualquier otro actor.

El nombre del rol base no constituye bypass.

#### 36. Permiso global y turno

Un permiso administrativo global puede operar sin turno cuando su contrato lo permita.

Un permiso operativo no se vuelve independiente del turno por tener alcance territorial global.

Se mantiene:

```text
global_scope
≠
operational_context_bypass
```

#### 37. Service role

Un proceso técnico legítimo puede operar sin un turno humano únicamente cuando la capacidad esté diseñada expresamente para un principal técnico o proceso de sistema.

El uso de:

```text
service role
admin client
```

por sí solo no crea esa excepción.

#### 38. Server Actions

Una Server Action operativa deberá demostrar:

```text
effective_actor
→ classify capability
→ resolve published shift when required
→ validate temporal applicability
→ validate site
→ validate area when required
→ validate active attendance when required
→ remaining gates
→ effect
```

La existencia de un botón visible durante la jornada no sustituye el gate.

#### 39. API routes

Una API mutante debe ignorar como autoridad cualquier:

```text
shiftId
shift_id
activeShift
isOnShift
```

enviado desde cliente.

Puede aceptar un `shift_id` como selector únicamente si lo resuelve y valida contra el actor y el territorio canónicos.

#### 40. RPC

Una RPC operativa debe recibir o reconstruir un contexto de turno ya validado cuando su diseño lo requiera.

Si puede invocarse directamente por un caller no privilegiado, su protección interna debe preservar la misma semántica de turno.

La revisión de grants, RLS y `SECURITY DEFINER` permanece en los owners de base de datos.

#### 41. Operaciones offline

Una acción capturada offline no conserva automáticamente la autoridad que existía al momento de captura.

Al sincronizar deberá reautorizarse contra el estado aplicable y la política de temporalidad/idempotencia correspondiente.

No se ejecuta únicamente porque el turno estaba activo cuando se originó localmente.

#### 42. Jobs y procesos asíncronos

Un job que ejecuta posteriormente una intención originada por un actor no debe reutilizar ciegamente un contexto laboral expirado.

La unidad propietaria deberá clasificar si:

- reautoriza al ejecutar;
- usa una autorización durable explícita;
- actúa como proceso técnico con contrato propio.

No se inventa continuidad del turno.

#### 43. Handoff a `AUTH-SRV-009`

`AUTH-SRV-008` entrega:

```text
authorization_mode
shift_requirement
effective_shift_id
shift_site_id
shift_area_id
shift_operational_role
shift_resolution_result
active_attendance_requirement
active_attendance_result
```

`AUTH-SRV-009` valida el rol operativo efectivo y su habilitación territorial.

#### 44. Handoff a `AUTH-SRV-010`

Si la acción ocurre desde dispositivo compartido, `AUTH-SRV-010` deberá intersectar el contexto laboral ya resuelto con:

```text
device identity
device site
device area policy
device permission ceiling
actor session
```

El dispositivo no crea turno ni check-in.

#### 45. Handoff a `AUTH-SRV-011`

Un turno válido no demuestra que el recurso objetivo esté en un estado mutable.

Draft, publicado, cancelado, reservado, procesado u otras transiciones del recurso siguen bajo `AUTH-SRV-011`.

#### 46. Handoff a `AUTH-SRV-012` y `AUTH-SRV-013`

El turno aporta una sede y, cuando corresponda, un área operativas.

No concede capacidad de cruzar territorios.

Si el efecto toca otra sede o área, debe pasar por los gates de `AUTH-SRV-012` o `AUTH-SRV-013`.

#### 47. Baseline VISO mensual

Se conserva el snapshot:

```text
vento-group-sas/vento-viso
8cf7c49a593c748cb6c99dd9b919b6947bcfec14
```

Superficies relevantes:

```text
src/app/staff/schedule/month/actions.ts
src/app/staff/schedule/month/block-actions.ts
src/app/api/viso/staff-schedule-shifts/route.ts
src/lib/auth/guard.ts
src/lib/auth/operational-session.ts
```

#### 48. VISO mensual — clasificación del carril

Las acciones de administración de horarios:

```text
createMonthlyShiftsAction
createMonthlyScheduleBlocksAction
deleteMonthlyDraftShiftAction
deleteMonthlyDraftsAction
publishMonthAction
POST /api/viso/staff-schedule-shifts
DELETE /api/viso/staff-schedule-shifts
```

administran recursos de programación.

Su mera relación con `employee_shifts` no convierte al actor administrador en actor operativo.

La futura materialización debe enlazar cada escritura con su permiso exacto de `AUTH-SRV-005` y clasificar su `authorization_mode` desde ese contrato.

#### 49. VISO mensual — no exigir turno al administrador por inferencia

Para una escritura administrativa de programación válida:

```text
ADMINISTRATIVE
+
exact administrative permission
+
authorized site/area
=
NO ACTOR SHIFT REQUIRED
```

Exigir al gerente o supervisor estar actualmente en turno únicamente por editar horarios sería un bloqueo incorrecto.

#### 50. VISO mensual — trabajador objetivo

El turno que se crea, actualiza, publica o elimina pertenece al trabajador objetivo.

Ese turno debe cumplir las reglas propias del recurso laboral.

Pero no puede reutilizarse como evidencia de que el actor administrativo está autorizado.

#### 51. VISO baseline — `resolveOperationalSession`

El resolver auditado construye actualmente `OperationalSession` a partir de:

- usuario;
- dispositivo compartido;
- sede preferida o asignada;
- área preferida;
- rol base o `navigation_role`.

No resuelve un `employee_shift` activo para el actor.

Por tanto:

```text
OperationalSession
≠
validated shift context
```

en el snapshot auditado.

#### 52. VISO baseline — guard

`requireAppAccess` consume el `OperationalSession` y evalúa permisos usando sede y área.

El guard auditado no demuestra por sí solo:

```text
published active shift
active check-in
```

para una capacidad que los exija.

Ese comportamiento se clasifica:

```text
CONTROL_EXISTENTE_REQUIERE_SHIFT_GATE
```

cuando la superficie sea operativa.

#### 53. VISO baseline — API rápida

La API rápida de programación puede crear o actualizar turnos administrativos sin resolver un turno activo del actor.

Eso es correcto únicamente si el permiso de modificación de horarios queda clasificado como administrativo.

No debe utilizarse como patrón para acciones operativas de NEXO, FOGO, ORIGO, PULSO u otras superficies.

#### 54. VISO baseline — publicación

`publishMonthAction` publica recursos de turno de terceros dentro de un carril administrativo de planificación.

La publicación no crea un turno activo del actor administrador.

Tampoco debe depender de que ese administrador tenga check-in.

#### 55. VISO baseline — `employee_shifts` como recurso y contexto

La misma tabla puede aparecer en dos papeles diferentes:

```text
A. resource being administered
B. source of operational context
```

La futura implementación debe distinguirlos explícitamente.

No se acepta una función que trate cualquier lectura de `employee_shifts` como autorización del caller.

#### 56. Brecha contractual del baseline

El snapshot VISO confirma:

- soporte de permisos con sede y área;
- modelo de `OperationalSession`;
- administración de turnos;
- lectura y persistencia de campos de turno.

No demuestra todavía:

- clasificación física de permisos entre administrativos y operativos en cada superficie;
- resolución server-side de un turno publicado vigente del actor operativo;
- verificación de check-in activo como parte del contexto cuando aplique;
- invalidación inmediata de contexto por expiración, cancelación o cambio de turno.

Estas brechas pertenecen a futuras unidades `AUTH-SRV-008::<implementation_unit_id>` y a los owners de contexto/frescura que correspondan.

#### 57. Evaluación fail-closed

Cuando una capacidad exija turno, cualquiera de estos estados bloquea:

```text
shift_required_but_missing
shift_not_published
shift_cancelled
shift_not_yet_active
shift_expired
shift_actor_mismatch
shift_site_mismatch
shift_area_mismatch
shift_ambiguous
shift_resolution_failed
active_attendance_required_but_missing
active_attendance_closed
active_attendance_unconfirmed
```

Un fallo técnico de resolución no se degrada a “sin turno” ni a autorización permisiva.

#### 58. Lineage obligatorio

Cada futura unidad deberá conservar:

```text
surface_identity
→ required_permission_key
→ authorization_mode
→ shift_requirement
→ effective_actor
→ candidate_shift_set
→ effective_shift_id
→ publication_state
→ temporal_interval
→ validated_target_site_id
→ target_area_id
→ shift_site_id
→ shift_area_id
→ active_attendance_requirement
→ active_attendance_result
→ shift_resolution_result
→ downstream role/device/state/cross-territory gates
→ effect
```

#### 59. Materialización futura

Cada instancia:

```text
AUTH-SRV-008::<implementation_unit_id>
```

deberá registrar como mínimo:

```text
implementation_unit_id
repository
commit_before
surface_identity[]
write_operation[]
required_permission_key[]
authorization_mode
shift_requirement
effective_actor_source
shift_source
candidate_shift_resolution
effective_shift_id
publication_rule
temporal_rule
timezone_rule
shift_site_id
shift_area_id
shift_operational_role
active_attendance_requirement
attendance_source
ambiguity_policy
privileged_client_usage
offline_or_async_mode
package_id[]
change_set
rollback
validation_commands
evidence
commit_after
```

#### 60. Evidencia mínima de una futura unidad

La materialización deberá demostrar, cuando aplique:

1. capacidad administrativa válida funciona sin turno;
2. capacidad operativa sin turno → deny;
3. borrador → deny para contexto operativo;
4. turno cancelado → deny;
5. turno futuro → deny;
6. turno expirado → deny;
7. turno de otro actor → deny;
8. turno de otra sede → deny;
9. turno de otra área cuando área es obligatoria → deny;
10. descanso no crea contexto operativo;
11. confirmación del empleado no se exige;
12. dos turnos elegibles ambiguos → deny;
13. turno cross-midnight se evalúa con intervalo inequívoco;
14. check-in aislado no crea turno;
15. check-in pendiente/offline no activa operación;
16. check-out retira contexto activo cuando corresponde;
17. rol administrativo no bypassa el turno de una acción operativa;
18. permiso global no bypassa el turno operativo;
19. admin/service role no crea excepción humana implícita;
20. llamada directa obtiene la misma decisión que la interfaz;
21. acción offline se reautoriza antes del efecto;
22. cambio o expiración invalida contexto previo.

#### 61. Rollback

El rollback de una futura unidad deberá restaurar únicamente el mecanismo técnico anterior sin:

- convertir turnos draft en contexto operativo;
- reintroducir confirmación del empleado como requisito;
- convertir check-in en fuente de turno;
- permitir permisos operativos sin contexto laboral;
- exigir turno a capacidades administrativas por defecto;
- crear fallbacks por sede o área seleccionadas;
- aceptar varios turnos ambiguos;
- conservar autoridad después de cancelación, expiración o check-out;
- borrar histórico laboral o de asistencia.

#### 62. Criterios de aceptación

`AUTH-SRV-008` queda documentalmente satisfecha cuando:

1. toda escritura protegida clasifica su modo administrativo u operativo desde el contrato de capacidad;
2. una capacidad administrativa no exige turno por inferencia;
3. una capacidad operativa exige turno publicado y vigente;
4. `public.employee_shifts` queda como fuente canónica del turno;
5. el turno corresponde al actor efectivo;
6. sede y área del turno son compatibles con el territorio ya resuelto;
7. descanso, borrador, turno futuro, expirado o cancelado no crean contexto operativo;
8. la confirmación del trabajador permanece fuera de la autorización;
9. la ambigüedad entre turnos falla cerrado;
10. los turnos cross-midnight se evalúan con intervalo inequívoco;
11. check-in permanece subordinado al turno y no lo sustituye;
12. el contexto de asistencia activo se exige cuando el contrato operativo lo requiera;
13. check-out y expiración eliminan contexto activo;
14. un permiso global no omite el turno operativo;
15. un rol administrativo no omite el turno cuando ejecuta una capacidad operativa;
16. procesos técnicos solo omiten turno mediante contrato explícito;
17. VISO mensual queda clasificado como administración de programación y no como operación del actor por el mero uso de `employee_shifts`;
18. el baseline VISO deja identificada la ausencia de resolución de turno activo en `OperationalSession`;
19. se preservan handoffs a rol, dispositivo, estado y cruces territoriales;
20. no se autorizan cambios físicos desde el marcador global;
21. no se crean ni modifican requisitos de prueba.

#### 63. Límites

Este marcador no certifica todavía:

- rol operativo válido;
- habilitación del rol en sede o área;
- identidad o techo de dispositivo compartido;
- estado mutable del recurso;
- operación cross-site;
- operación cross-area;
- auditoría completa;
- invalidación física de cachés;
- fingerprint de contexto;
- RLS;
- grants;
- `SECURITY DEFINER`;
- implementación física del resolver de turno;
- implementación física del resolver de asistencia;
- atomicidad;
- idempotencia;
- contrato final de errores.

Esas responsabilidades conservan sus owners canónicos.

#### 64. Evidencia de validación

| Clase     | Estado           | Evidencia                                                                                                                                                                                                          |
| --------- | ---------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| BUILD     | `NOT_EXECUTED`   | no se ejecutó build durante el desarrollo documental                                                                                                                                                               |
| LOCAL     | `NOT_EXECUTED`   | no se ejecutaron comandos contra el checkout del usuario                                                                                                                                                           |
| REMOTA    | `PASS`           | se auditaron en solo lectura la continuidad vigente, la topología del Bloque J, el owner de `AUTH-SRV-008`, el modelo canónico de turno publicado y check-in, el registro 04A relevante y el snapshot VISO mensual |
| OPERATIVA | `NOT_APPLICABLE` | el marcador no cambia operación real                                                                                                                                                                               |
| FÍSICA    | `NOT_APPLICABLE` | no existe instancia física autorizada para esta tarea                                                                                                                                                              |

#### 65. Requisitos de prueba derivados

**Resultado:** NO GENERA REQUISITOS DE PRUEBA.

**Justificación:** la separación entre capacidades administrativas y operativas, el requisito de turno publicado y vigente, el check-in activo cuando corresponde, la compatibilidad territorial y la invalidación de contexto laboral ya disponen de cobertura canónica vigente. `AUTH-SRV-008` especifica el contrato de enforcement que consumirán esas pruebas y no introduce una obligación verificable sin cobertura existente.

#### 66. Cobertura de prueba vigente reutilizada

Se reutiliza sin modificar el registro vigente:

- `TREQ-AUTH-008` — las capacidades administrativas pueden operar sin turno/check-in cuando su contrato lo permite y las operativas exigen turno publicado y vigente, check-in activo, rol operativo efectivo y compatibilidad territorial;
- `TREQ-AUTH-009` — sede y área efectivas se resuelven de forma determinista también desde turno y check-in;
- `TREQ-AUTH-013` — cada mutación valida en servidor el contexto requerido antes de producir efectos;
- `TREQ-AUTH-014` — cambio de turno, check-out, expiración o cambio territorial invalidan contexto, cachés y autoridad derivada.

Estas referencias son trazabilidad heredada y no representan requisitos creados o modificados por `AUTH-SRV-008`.

#### 67. Continuidad

**ÚLTIMA TAREA APROBADA**
`AUTH-SRV-007 — Validar área en cada escritura`

**TAREA ACTUAL APROBADA**
`AUTH-SRV-008 — Validar turno cuando corresponda`

**SIGUIENTE TAREA RESERVADA**
`AUTH-SRV-009 — Validar rol operativo cuando corresponda`


### ✅ AUTH-SRV-009 — Validar rol operativo cuando corresponda

**Estado:** APROBADA
**Tarea anterior:** AUTH-SRV-008 — Validar turno cuando corresponda
**Tarea siguiente:** AUTH-SRV-010 — Validar dispositivo compartido
**Tipo de tarea:** Contrato global con materialización por unidad (`PER_IMPLEMENTATION_UNIT`) — contrato de rol operativo para que toda escritura protegida que utilice el carril operativo resuelva en servidor el rol operativo efectivo exclusivamente desde el turno publicado y vigente del actor, valide su identidad canónica, habilitación territorial y compatibilidad con la capacidad exacta, y falle cerrado ante ausencia, inactividad, ambigüedad, incompatibilidad territorial o sustitución por rol base, perfil, interfaz o dispositivo
**Bloque:** BLOQUE J — Protección de acciones de servidor
**Repositorio propietario:** `vento-group-sas/vento-shell`
**Archivo propietario:** `docs/plan-canonico/modular/bloques/J_ACCIONES_DE_SERVIDOR/02_VALIDACION_AUTORIZACION_Y_TERRITORIO.md`
**Estado físico resultante:** `ESPECIFICADO_NO_MATERIALIZADO`
**Cambios físicos autorizados:** 0 durante el marcador global; las futuras materializaciones ocurren únicamente mediante `AUTH-SRV-009::<implementation_unit_id>` después de que `DELIV-PKG-025::<package_id>` asigne la unidad y el paquete propietario supere `E5-GATE-008::<package_id>`
**Requisitos de prueba creados o modificados:** 0

---

#### 1. Propósito

Definir el contrato obligatorio para determinar cuándo una escritura necesita rol operativo y, cuando lo necesita, cuál rol operativo efectivo participa realmente en la autorización.

La regla principal queda:

```text
administrative_lane
→ operational_role_not_required_by_default

operational_lane
→ valid_effective_operational_role_required
```

Un rol operativo válido es un prerrequisito de contexto.

No autoriza por sí solo la escritura.

#### 2. Handoff recibido de `AUTH-SRV-008`

La tarea anterior entrega como mínimo:

```text
required_permission_key
authorization_mode
validated_target_site_id
target_area_id
shift_requirement
effective_shift_id
shift_site_id
shift_area_id
shift_operational_role
shift_resolution_result
active_attendance_requirement
active_attendance_result
```

`AUTH-SRV-009` añade:

```text
operational_role_requirement
effective_operational_role
operational_role_catalog_result
operational_role_site_result
operational_role_area_result
operational_role_permission_basis
operational_role_validation_result
```

No reabre la selección del turno.

#### 3. Pregunta contractual propietaria

Esta tarea responde:

```text
¿ESTA ESCRITURA REQUIERE ROL OPERATIVO?
```

y, cuando la respuesta es sí:

```text
¿EL ROL DEL TURNO ES UN ROL OPERATIVO CANÓNICO,
VIGENTE Y HABILITADO PARA ESTE TERRITORIO?
```

No decide todavía:

```text
qué dispositivo compartido puede intervenir
qué estado del recurso admite la mutación
si puede cruzar entre sedes
si puede cruzar entre áreas
```

Esas decisiones permanecen en `AUTH-SRV-010` a `AUTH-SRV-013`.

#### 4. Separación entre rol base y rol operativo

Se mantiene:

```text
base_role
≠
operational_role
```

El rol base representa una plantilla permanente de capacidades administrativas o laborales base.

El rol operativo representa una función temporal ejercida durante una jornada concreta.

No se fusionan.

#### 5. Fuente del rol operativo efectivo

La fuente autoritativa es:

```text
effective_shift.operational_role
```

donde `effective_shift` es el turno ya validado por `AUTH-SRV-008`.

Por tanto:

```text
valid_effective_shift
→ operational_role
→ effective_operational_role
```

Sin turno operativo válido:

```text
effective_operational_role = null
```

#### 6. Catálogo canónico

El rol resuelto debe existir en:

```text
public.operational_roles
```

La coincidencia es por código canónico exacto.

No por:

- etiqueta;
- traducción;
- descripción;
- coincidencia parcial;
- alias no registrado;
- nombre de pantalla;
- cargo contractual.

#### 7. Habilitación territorial

La habilitación territorial del rol se resuelve mediante:

```text
public.site_operational_roles
```

El rol efectivo debe ser compatible con:

```text
validated_target_site_id
target_area_id when required
```

La existencia del código en el catálogo global no demuestra que pueda usarse en cualquier sede o área.

#### 8. Permisos del rol operativo

La relación canónica entre rol operativo y capacidades se expresa mediante:

```text
public.operational_role_permissions
```

La tarea no redefine `required_permission_key`.

Esa clave llega fijada por `AUTH-SRV-005`.

`AUTH-SRV-009` verifica únicamente que el carril operativo pueda sostener esa capacidad dentro del contexto ya resuelto.

#### 9. Rol válido no equivale a permiso suficiente

Se mantiene:

```text
valid_operational_role
≠
automatic_permission
```

La decisión completa exige además:

```text
required_permission_key
+
permission decision
+
validated territory
+
valid shift context
+
valid operational role
+
remaining gates
```

La mera pertenencia a un oficio no concede una acción.

#### 10. Permiso válido no elimina el rol requerido

Cuando la capacidad utiliza un carril operativo:

```text
permission_allowed
+
invalid_operational_role
=
DENY
```

Una concesión, excepción o alcance que pueda participar legítimamente en la decisión de permiso no convierte un rol operativo inválido en válido.

#### 11. Carril administrativo

Cuando la capacidad se autoriza exclusivamente por el carril administrativo y su contrato no exige contexto operativo:

```text
operational_role_requirement = NOT_REQUIRED
```

No se exige al actor adoptar un oficio operativo para ejecutar administración.

#### 12. Carril operativo

Cuando la capacidad se evalúa por el carril operativo:

```text
operational_role_requirement = REQUIRED
```

Debe existir:

```text
valid shift
+
effective operational role
+
territorial enablement
```

antes de continuar.

#### 13. `BASE_OR_OPERATIONAL`

En una capacidad que admita ambos carriles:

```text
BASE valid
→ puede autorizar sin rol operativo

OPERATIONAL path
→ exige rol operativo válido
```

Los carriles se evalúan independientemente.

El rol base no toma prestado el rol operativo.

El rol operativo no transforma el carril base.

#### 14. `BASE_AND_OPERATIONAL`

Cuando ambos carriles son obligatorios:

```text
base authorization
+
operational authorization
```

deben satisfacerse de forma independiente.

La existencia de rol base válido no elimina el rol operativo.

La existencia de rol operativo válido no elimina la concesión base requerida.

#### 15. Rol del turno

Para una operación real:

```text
shift.operational_role
=
effective_operational_role
```

Un rol enviado separadamente por el cliente no puede sustituirlo.

#### 16. Rol solicitado desde cliente

Valores como:

```text
role
roleCode
operationalRole
roleContext
navigation_role
```

son, como máximo:

```text
SELECTOR_INTENT
```

cuando forman parte de una solicitud legítima de planificación o navegación.

No constituyen autoridad de una mutación operativa.

#### 17. Rol base del empleado

```text
public.employees.role
```

no sustituye:

```text
effective_shift.operational_role
```

Queda prohibido:

```text
employees.role
→ operational role fallback
```

para autorizar una capacidad operativa.

#### 18. Perfil operativo predeterminado

Un perfil como:

```text
default_operational_role
```

puede sugerir un rol al planificar un turno.

No demuestra qué función está ejecutando actualmente el actor.

La regla queda:

```text
default_operational_role
→ planning_default

effective_shift.operational_role
→ authorization_context
```

#### 19. Último rol utilizado

El último rol ejercido por el actor no es fallback.

```text
previous_shift.operational_role
≠
current_effective_operational_role
```

La ausencia de un rol actual no se completa con historial.

#### 20. Rol de navegación

Un valor de navegación:

```text
navigation_role
```

puede afectar presentación o selección inicial.

No puede convertirse en:

```text
effective_actor
effective_operational_role
permission
```

#### 21. Dispositivo compartido

Un dispositivo no posee rol operativo humano propio.

La futura `AUTH-SRV-010` podrá restringir la acción mediante configuración del dispositivo.

No puede:

- crear un rol operativo;
- reemplazar el rol del turno;
- ampliar el rol del actor;
- prestar su `navigation_role` como autoridad.

#### 22. Actor efectivo

El rol operativo pertenece al:

```text
effective_actor
```

No al principal técnico ni al usuario administrativo que haya iniciado una sesión técnica distinta.

El rol debe poder atribuirse al mismo actor cuyo turno fue resuelto.

#### 23. Rol y trabajador objetivo

En una operación administrativa sobre otro trabajador:

```text
ACTOR
→ quien administra

TARGET EMPLOYEE
→ persona configurada
```

El rol operativo asignado al turno del trabajador objetivo describe el recurso laboral que se está planificando.

No se convierte en rol operativo del actor administrador.

#### 24. Turno laboral

Todo turno laboral que deba crear contexto operativo requiere un rol operativo válido.

Un turno de descanso no crea rol operativo efectivo.

#### 25. Rol inexistente

Si:

```text
effective_shift.operational_role
```

no existe en `public.operational_roles`:

```text
OPERATIONAL_ROLE_NOT_FOUND
→ DENY
```

No se intenta corregir mediante nombre parecido o rol base.

#### 26. Rol inactivo

Un rol operativo inactivo no puede producir autoridad nueva.

```text
inactive_operational_role
→ DENY
```

El historial del turno puede conservar el código, pero no habilita operación actual.

#### 27. Rol no permitido en la sede

Si el rol existe pero no está habilitado para:

```text
validated_target_site_id
```

el resultado es:

```text
OPERATIONAL_ROLE_NOT_ALLOWED_IN_SITE
→ DENY
```

#### 28. Rol no permitido en el área

Cuando el contrato exige área y la habilitación del rol no cubre:

```text
target_area_id
```

el resultado es:

```text
OPERATIONAL_ROLE_NOT_ALLOWED_IN_AREA
→ DENY
```

No se sustituye por el área primaria, seleccionada o del dispositivo.

#### 29. Configuración site-wide

Una configuración territorial del rol con:

```text
area_id = null
```

puede representar una habilitación explícitamente site-wide.

No significa por omisión:

```text
all areas automatically authorized
```

La compatibilidad con una acción area-scoped continúa gobernada por el contrato territorial y de permiso ya resuelto.

#### 30. Área obligatoria por rol

Si el rol operativo exige área:

```text
effective_operational_role
+
target_area_id = null
=
DENY
```

No se inventa un área a partir del perfil o de la interfaz.

#### 31. Cardinalidad

La combinación autoritativa debe resolverse de forma determinista.

Cuando existan múltiples configuraciones activas incompatibles para la misma combinación de:

```text
role
site
area semantics
```

sin una regla canónica única:

```text
OPERATIONAL_ROLE_AMBIGUOUS
→ DENY
```

#### 32. Código exacto

La comparación de autorización usa identidad exacta:

```text
canonical_role_code === effective_operational_role
```

Quedan fuera de autorización patrones como:

```text
contains
startsWith
substring match
label similarity
normalized display name
```

#### 33. Heurísticas de planificación

Una heurística puede comparar nombres o aproximar compatibilidades para sugerir programación.

Esa lógica puede servir para:

```text
planning
recommendation
historical inference
UI suggestion
```

pero nunca para:

```text
authorization
```

Antes de producir efectos, el código debe resolver el rol canónico exacto.

#### 34. Rol administrativo y rol operativo simultáneos

Un mismo actor puede tener:

```text
base_role
+
effective_operational_role
```

sin crear una tercera identidad combinada.

No se crean roles sintéticos como:

```text
gerente_cajero
supervisor_bodeguero
propietario_operativo
```

La autorización compone carriles, no nombres.

#### 35. Gerencia operativa

Un rol como:

```text
gerencia_operativa
```

continúa siendo un rol operativo.

No es un bypass.

Debe cumplir turno, territorio, permiso y demás gates aplicables.

#### 36. Rol transversal

Un rol operativo con alcance funcional transversal no adquiere por ello alcance territorial global.

La sede y el área siguen evaluándose de forma independiente.

#### 37. Cambio de rol durante la jornada

Cuando el rol del turno cambia mediante una transición canónica:

```text
previous_effective_operational_role
→ STALE
```

Toda decisión derivada del rol anterior debe revalidarse antes de una nueva mutación.

La invalidación física de caches y fingerprints conserva su owner específico.

#### 38. Cambio de turno

Un nuevo turno no hereda automáticamente el rol operativo del turno anterior.

La nueva resolución parte del turno actualmente válido.

#### 39. Check-in

El check-in no crea ni elige el rol operativo.

Puede confirmar un contexto laboral vinculado al turno, pero:

```text
check_in
≠ operational_role_source
```

#### 40. Permisos T y T+C

Cuando una capacidad operativa exige:

```text
T
```

o:

```text
T+C
```

el turno vigente debe contener un rol operativo válido.

`T+C` añade el requisito de check-in activo definido por el contrato previo.

La presencia del check-in no compensa un rol inválido.

#### 41. Server Actions

Una Server Action operativa deberá demostrar:

```text
effective actor
→ valid shift
→ effective shift role
→ canonical role lookup
→ site/area role enablement
→ exact permission context
→ remaining gates
→ effect
```

Una Server Action administrativa puede omitir el gate de rol operativo cuando su carril contractual no lo exige.

#### 42. API routes

Una API mutante no puede confiar en:

```text
body.role
body.operationalRole
query.role
header role
```

como autoridad.

Para una acción operativa debe resolver el rol desde el turno efectivo del actor.

#### 43. RPC

Una RPC que evalúe permisos operativos debe recibir o reconstruir un rol operativo ya resuelto de forma canónica.

Una llamada:

```text
has_operational_role_permission(role_code, ...)
```

solo es segura cuando `role_code` procede del contexto efectivo y no de un valor manipulable o de navegación.

#### 44. Cliente administrativo y service role

El uso de:

```text
admin client
service role
```

no permite fabricar un rol operativo.

Una acción humana privilegiada debe conservar el actor y su contexto real.

Un proceso técnico autónomo opera bajo su contrato de sistema y no mediante un rol operativo humano inventado.

#### 45. Operaciones offline

Una acción operativa capturada offline debe volver a resolver el rol efectivo al sincronizar cuando el contrato de ejecución exija reautorización fresca.

No puede conservar indefinidamente:

```text
captured_operational_role
```

como autoridad.

#### 46. Procesos asíncronos

Un job no puede reutilizar ciegamente el rol operativo que tenía el actor al originar la intención.

Debe actuar bajo una autorización durable explícita o reautorizar según el contrato del proceso.

#### 47. Handoff a `AUTH-SRV-010`

La salida hacia dispositivo compartido queda:

```text
effective_actor
authorization_mode
required_permission_key
effective_shift_id
validated_target_site_id
target_area_id
effective_operational_role
operational_role_validation_result
```

`AUTH-SRV-010` intersecta ese contexto con las restricciones reales del dispositivo.

#### 48. Handoff a `AUTH-SRV-011`

Un rol operativo válido no demuestra que el recurso objetivo esté en un estado mutable.

`AUTH-SRV-011` conserva la validación del estado actual y de la transición.

#### 49. Handoff a `AUTH-SRV-012`

Un rol operativo válido en una sede no concede capacidad para operar otra sede.

`AUTH-SRV-012` conserva el gate cross-site.

#### 50. Handoff a `AUTH-SRV-013`

Un rol operativo válido en un área no concede capacidad para cruzar hacia otra área.

`AUTH-SRV-013` conserva el gate cross-area.

#### 51. Baseline VISO mensual

Se conserva el snapshot:

```text
vento-group-sas/vento-viso
8cf7c49a593c748cb6c99dd9b919b6947bcfec14
```

Superficies relevantes:

```text
src/app/staff/schedule/month/actions.ts
src/app/staff/schedule/helpers.ts
src/lib/auth/operational-session.ts
src/lib/auth/permissions.ts
```

#### 52. VISO — `roleContext`

La programación mensual recibe:

```text
roleContext
```

y lo separa en:

```text
roleCode
areaId
```

Ese valor es intención de planificación.

No es rol operativo efectivo del administrador que ejecuta la escritura.

#### 53. VISO — matriz operacional

El baseline consulta:

```text
vento_site_operational_role_matrix_v1
```

y consume filas con:

```text
site_id
area_id
role_code
role_label
role_family
is_default
is_active
```

Para planificación, una fila activa puede resolver el rol que se asignará al turno objetivo.

Ese rol solo será contexto operativo del trabajador cuando el turno aplicable llegue a ser válido conforme a `AUTH-SRV-008`.

#### 54. VISO — persistencia del rol del turno

En creación mensual, el payload utiliza:

```text
operational_role = matrixRow.role_code
```

Esto es coherente como asignación del recurso cuando `matrixRow` ha sido resuelta canónicamente para sede y área.

No constituye autorización del actor administrador.

#### 55. VISO — fallback de matriz

El resolver auditado intenta coincidencia exacta por:

```text
role_code
+
area_id
```

y puede caer a:

```text
default row for role
```

o a una única fila del rol.

Ese fallback es aceptable únicamente para planificación cuando no contradiga una intención explícita y la resolución sea canónica y determinista.

No puede convertirse en fallback para determinar el rol operativo efectivo de una acción real.

#### 56. VISO — perfiles operativos

El baseline consulta:

```text
employee_site_operational_profiles.default_operational_role
```

para apoyar configuración de planificación.

Se conserva:

```text
profile default
≠ effective operational role
```

El perfil no puede autorizar una acción por sí solo.

#### 57. VISO — `OperationalSession` de empleado

El baseline actual resuelve:

```text
OperationalSession.role
```

desde:

```text
employees.role
```

y no desde:

```text
effective_shift.operational_role
```

Por tanto:

```text
OperationalSession.role
≠ validated operational role
```

para una capacidad operativa.

#### 58. VISO — `navigationRole` en dispositivo compartido

El baseline actual obtiene:

```text
navigationRole
```

desde:

```text
shared_operational_devices.navigation_role
```

y lo usa como `roleCode` al consultar `has_operational_role_permission`.

Ese patrón no satisface este contrato porque:

```text
device.navigation_role
≠ effective actor operational role
```

La futura materialización deberá resolver primero al actor humano y su turno; `AUTH-SRV-010` añadirá después la intersección restrictiva del dispositivo.

#### 59. VISO — empleado y `has_permission`

Para sesiones personales, el baseline invoca:

```text
has_permission
```

con sede y área, pero el helper local no demuestra por sí solo que una capacidad operativa haya resuelto:

```text
effective_shift
effective_operational_role
```

Ese gate deberá quedar materializado en la unidad propietaria de la superficie.

#### 60. VISO — `roleMatches`

El helper de planificación contiene una comparación permisiva basada en normalización y coincidencia parcial para señales de planificación.

Esa lógica se clasifica:

```text
PLANNING_ONLY
```

y no podrá reutilizarse como comparador de autorización.

La autorización exige código canónico exacto.

#### 61. VISO — brechas concretas del baseline

El snapshot confirma controles útiles:

- matriz operacional activa por sede;
- `role_code` persistido en turnos laborales;
- RPC específica `has_operational_role_permission`;
- separación parcial entre perfil operativo y turno;
- contexto de sede y área en helpers de permisos.

No demuestra cumplimiento completo porque:

- la sesión operacional del empleado conserva `employees.role`, no el rol del turno;
- el dispositivo compartido usa `navigation_role` como entrada del permiso operativo;
- el helper local no resuelve un turno vigente antes de evaluar una capacidad operativa;
- una heurística de planificación usa coincidencias parciales de rol;
- el rol del trabajador objetivo en programación y el rol del actor administrador pueden confundirse si no se mantienen separados.

#### 62. Evaluación fail-closed

Cuando el carril exija rol operativo, cualquiera de estos estados bloquea:

```text
operational_role_required_but_missing
operational_role_not_found
operational_role_inactive
operational_role_shift_mismatch
operational_role_site_mismatch
operational_role_area_mismatch
operational_role_ambiguous
operational_role_permission_incompatible
operational_role_resolution_failed
```

Un fallo técnico de resolución no se degrada a rol base ni a rol de navegación.

#### 63. Lineage obligatorio

Cada futura unidad deberá conservar:

```text
surface_identity
→ required_permission_key
→ authorization_mode
→ effective_actor
→ effective_shift_id
→ shift_operational_role
→ canonical_operational_role
→ validated_target_site_id
→ target_area_id
→ territorial_role_binding
→ operational_permission_basis
→ operational_role_validation_result
→ downstream device/state/cross-territory gates
→ effect
```

#### 64. Materialización futura

Cada instancia:

```text
AUTH-SRV-009::<implementation_unit_id>
```

deberá registrar como mínimo:

```text
implementation_unit_id
repository
commit_before
surface_identity[]
write_operation[]
required_permission_key[]
authorization_mode
effective_actor_source
effective_shift_id
shift_operational_role
operational_role_catalog_source
territorial_role_source
operational_permission_source
validated_target_site_id
target_area_id
area_semantics
role_resolution_rule
ambiguity_policy
client_role_fields[]
base_role_fallback_present
profile_role_fallback_present
device_role_fallback_present
privileged_client_usage
offline_or_async_mode
package_id[]
change_set
rollback
validation_commands
evidence
commit_after
```

#### 65. Evidencia mínima de una futura unidad

La materialización deberá demostrar, cuando aplique:

1. carril administrativo válido funciona sin rol operativo;
2. carril operativo sin rol → deny;
3. rol inexistente → deny;
4. rol inactivo → deny;
5. rol de otro turno → deny;
6. rol no permitido en sede → deny;
7. rol no permitido en área requerida → deny;
8. rol base no sustituye rol operativo;
9. perfil predeterminado no sustituye rol operativo;
10. último rol usado no sustituye rol operativo;
11. `navigation_role` no sustituye rol del actor;
12. rol del trabajador objetivo no se convierte en rol del administrador;
13. código por label o substring no autoriza;
14. rol válido sin permiso suficiente no autoriza;
15. permiso suficiente no elimina un rol requerido;
16. rol site-wide no se interpreta como wildcard accidental;
17. combinación ambigua → deny;
18. cambio de turno o rol invalida la decisión anterior;
19. admin/service role no fabrica rol humano;
20. llamada directa produce la misma decisión que la interfaz;
21. sincronización offline no reutiliza rol stale;
22. dispositivo compartido conserva rol del actor y no de la plantilla.

#### 66. Rollback

El rollback de una futura unidad deberá restaurar únicamente el mecanismo técnico anterior sin:

- volver a usar `employees.role` como rol operativo;
- volver a usar `navigation_role` como autoridad;
- convertir perfiles predeterminados en autoridad;
- permitir coincidencias parciales de código para autorización;
- eliminar validación territorial del rol;
- convertir `area_id = null` en wildcard;
- fusionar rol base y operativo;
- borrar historial de turnos o roles;
- retirar evidencia de decisiones ya registradas.

#### 67. Criterios de aceptación

`AUTH-SRV-009` queda documentalmente satisfecha cuando:

1. el rol operativo solo se exige en los carriles cuyo contrato lo requiere;
2. el carril administrativo no exige rol operativo por inferencia;
3. el carril operativo resuelve el rol desde el turno efectivo;
4. `public.operational_roles` queda como catálogo canónico;
5. `public.site_operational_roles` queda como habilitación territorial;
6. la relación de permisos operativos se conserva separada de la identidad del rol;
7. rol válido no equivale a permiso automático;
8. permiso válido no elimina un rol operativo requerido;
9. `employees.role` no sustituye el rol del turno;
10. perfiles predeterminados no sustituyen el rol del turno;
11. `navigation_role` no constituye autoridad;
12. el código se compara de forma exacta;
13. sede y área se validan contra la habilitación territorial del rol;
14. configuraciones ambiguas fallan cerrado;
15. un rol site-wide conserva semántica explícita y no wildcard;
16. el rol del trabajador objetivo y el del actor permanecen separados;
17. cambio de turno o rol obliga a revalidar contexto;
18. Server Actions, API y RPC conservan el mismo contrato;
19. VISO mensual mantiene el rol de planificación separado del rol efectivo del actor;
20. la brecha de `OperationalSession.role` y `navigationRole` queda explícitamente identificada;
21. se preservan los handoffs a dispositivo, estado y cruces territoriales;
22. no se autorizan cambios físicos desde el marcador global;
23. no se crean ni modifican requisitos de prueba.

#### 68. Límites

Este marcador no certifica todavía:

- identidad y estado final del dispositivo compartido;
- techo máximo de permisos del dispositivo;
- sesión física del actor en dispositivo;
- estado mutable del recurso;
- autorización cross-site;
- autorización cross-area;
- implementación física de `has_operational_role_permission`;
- implementación física de `has_permission`;
- RLS;
- grants;
- `SECURITY DEFINER`;
- invalidación física de cachés;
- auditoría completa;
- atomicidad;
- idempotencia;
- contrato final de errores.

Estas responsabilidades conservan sus owners canónicos.

#### 69. Evidencia de validación

| Clase     | Estado           | Evidencia                                                                                                                                                                                                                                           |
| --------- | ---------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| BUILD     | `NOT_EXECUTED`   | no se ejecutó build durante el desarrollo documental                                                                                                                                                                                                |
| LOCAL     | `NOT_EXECUTED`   | no se ejecutaron comandos contra el checkout del usuario                                                                                                                                                                                            |
| REMOTA    | `PASS`           | se auditaron en solo lectura la continuidad vigente, la topología del Bloque J, el owner de `AUTH-SRV-009`, el modelo canónico de roles base y operativos, los prerrequisitos de autorización, el registro 04A relevante y el snapshot VISO mensual |
| OPERATIVA | `NOT_APPLICABLE` | el marcador no cambia operación real                                                                                                                                                                                                                |
| FÍSICA    | `NOT_APPLICABLE` | no existe instancia física autorizada para esta tarea                                                                                                                                                                                               |

#### 70. Requisitos de prueba derivados

**Resultado:** NO GENERA REQUISITOS DE PRUEBA.

**Justificación:** la separación entre carriles base y operativos, la exigencia de rol operativo efectivo, la segregación de funciones, la compatibilidad territorial y la revalidación server-side de rol ya disponen de cobertura canónica vigente. `AUTH-SRV-009` especifica el contrato de enforcement que consumirán esas pruebas y no introduce una obligación verificable sin cobertura existente.

#### 71. Cobertura de prueba vigente reutilizada

Se reutiliza sin modificar el registro vigente:

- `TREQ-AUTH-001` — una lista local o nombre de rol no puede conceder autorización final por sí solo;
- `TREQ-AUTH-008` — las capacidades operativas exigen rol operativo efectivo dentro del contexto laboral y territorial aplicable;
- `TREQ-AUTH-010` — las matrices de rol preservan segregación de funciones y las concesiones no neutralizan denegaciones transversales;
- `TREQ-AUTH-013` — cada mutación revalida en servidor el contexto requerido antes de producir efectos;
- `TREQ-VISO-042` — persona, sede, área, rol, fechas y alcance se validan nuevamente en servidor.

Estas referencias son trazabilidad heredada y no representan requisitos creados o modificados por `AUTH-SRV-009`.

#### 72. Continuidad

**ÚLTIMA TAREA APROBADA**
`AUTH-SRV-008 — Validar turno cuando corresponda`

**TAREA ACTUAL APROBADA**
`AUTH-SRV-009 — Validar rol operativo cuando corresponda`

**SIGUIENTE TAREA RESERVADA**
`AUTH-SRV-010 — Validar dispositivo compartido`


### ✅ AUTH-SRV-010 — Validar dispositivo compartido

**Estado:** APROBADA
**Tarea anterior:** AUTH-SRV-009 — Validar rol operativo cuando corresponda
**Tarea siguiente:** AUTH-SRV-011 — Validar estado actual de la entidad
**Tipo de tarea:** Contrato global con materialización por unidad (`PER_IMPLEMENTATION_UNIT`) — contrato de autorización desde dispositivo compartido para que toda escritura protegida distinga la identidad técnica del dispositivo del actor humano efectivo, resuelva en servidor una sesión de actor vigente e interseque la autoridad ya validada del trabajador con las aplicaciones, territorio, paquete máximo de capacidades y requisitos adicionales del dispositivo, sin permitir que la terminal, su plantilla, `navigation_role`, PIN ligero o configuración local concedan o amplíen autoridad empresarial
**Bloque:** BLOQUE J — Protección de acciones de servidor
**Repositorio propietario:** `vento-group-sas/vento-shell`
**Archivo propietario:** `docs/plan-canonico/modular/bloques/J_ACCIONES_DE_SERVIDOR/02_VALIDACION_AUTORIZACION_Y_TERRITORIO.md`
**Estado físico resultante:** `ESPECIFICADO_NO_MATERIALIZADO`
**Cambios físicos autorizados:** 0 durante el marcador global; las futuras materializaciones ocurren únicamente mediante `AUTH-SRV-010::<implementation_unit_id>` después de que `DELIV-PKG-025::<package_id>` asigne la unidad y el paquete propietario supere `E5-GATE-008::<package_id>`
**Requisitos de prueba creados o modificados:** 0

---

#### 1. Propósito

Definir el gate obligatorio de dispositivo compartido para toda escritura empresarial ejecutada desde una identidad técnica de terminal compartida.

La regla central queda:

```text
AUTORIDAD DEL ACTOR YA VALIDADA
∩
LÍMITES EFECTIVOS DEL DISPOSITIVO
=
AUTORIDAD POSIBLE DESDE ESA TERMINAL
```

El dispositivo puede reducir la autorización.

Nunca puede concederla ni ampliarla.

#### 2. Handoff recibido de `AUTH-SRV-009`

La tarea anterior entrega como mínimo:

```text
effective_actor
authorization_mode
required_permission_key
effective_shift_id
validated_target_site_id
target_area_id
effective_operational_role
operational_role_validation_result
```

`AUTH-SRV-010` añade:

```text
device_context_requirement
device_id
device_status
actor_session_id
actor_session_result
effective_device_application_set
effective_device_permission_ceiling
shared_device_requirement
strong_reauth_result
device_territory_result
device_validation_result
```

No reabre permiso, sede, área, turno ni rol operativo ya resueltos.

#### 3. Pregunta contractual propietaria

Esta tarea responde:

```text
¿LA ACCIÓN SE ESTÁ EJECUTANDO DESDE UN DISPOSITIVO COMPARTIDO?
```

y, cuando la respuesta es sí:

```text
¿LA TERMINAL ESTÁ VIGENTE,
TIENE UN ACTOR HUMANO VIGENTE,
ADMITE ESTA APLICACIÓN,
ADMITE ESTA CLAVE EXACTA,
ES COMPATIBLE CON EL TERRITORIO
Y SATISFACE EL NIVEL DE REAUTENTICACIÓN EXIGIDO?
```

No decide todavía si el estado actual del recurso admite la mutación.

Esa responsabilidad permanece en `AUTH-SRV-011`.

#### 4. Dos identidades separadas

En un dispositivo compartido existen dos identidades distintas:

```text
PRINCIPAL TÉCNICO
→ credencial del dispositivo

ACTOR EFECTIVO
→ empleado humano identificado
```

Se mantiene:

```text
technical_device_principal
≠
effective_actor
```

La cuenta técnica no puede convertirse en empleado, rol base, rol operativo ni propietario empresarial del efecto.

#### 5. Aplicación del gate

El gate especializado de esta tarea se aplica cuando el principal autenticado se resuelve canónicamente como:

```text
SHARED_DEVICE
```

En una sesión personal ordinaria:

```text
HUMAN_USER
→ device_context = null
```

El hecho de que la persona utilice físicamente una tablet, portátil o terminal no convierte por sí solo su sesión en dispositivo compartido.

#### 6. Fuente canónica de la instancia

La identidad técnica debe resolverse en servidor desde la relación entre:

```text
auth principal
→ public.shared_operational_devices.auth_user_id
→ device_id único
```

El `device_id` recibido desde interfaz, body, header, cookie no confiable, QR o estado local no es autoridad.

#### 7. Resolución única

La relación principal técnico → dispositivo debe ser inequívoca.

Casos inválidos:

```text
0 dispositivos canónicos compatibles
>1 dispositivos canónicos compatibles
vínculo técnico inconsistente
```

Resultado:

```text
DEVICE_IDENTITY_UNRESOLVED
→ DENY BUSINESS ACTION
```

No se selecciona la primera coincidencia.

#### 8. Estado del dispositivo

Para permitir una acción empresarial, la instancia debe estar en un estado operativo admitido por su contrato vigente.

Como mínimo, el servidor debe verificar:

```text
device exists
device is active
activation_status permits use
device is not revoked
device configuration is current
```

Una terminal suspendida, revocada, inactiva o estructuralmente inválida no puede producir efectos empresariales aunque su sesión técnica continúe autenticada.

#### 9. Disponibilidad técnica no equivale a autoridad

El dispositivo puede permanecer disponible como interfaz técnica sin actor humano.

En ese estado puede exponer exclusivamente funciones técnicas o de identificación autorizadas por su contrato.

Se mantiene:

```text
DEVICE AVAILABLE
≠
BUSINESS ACTION AUTHORIZED
```

#### 10. Superficie previa al actor

Antes de resolver un actor humano válido, la terminal puede mostrar únicamente el contenido técnico permitido, por ejemplo:

```text
estado técnico
identificación del trabajador
aplicaciones configuradas
bloqueo o mantenimiento
información genérica no empresarial
```

La pantalla previa no hereda permisos humanos.

#### 11. Sesión de actor

Toda acción empresarial desde un dispositivo compartido exige una sesión canónica de actor cuando el contrato de la superficie requiera actor humano.

La fuente conceptual es:

```text
public.shared_operational_device_actor_sessions
```

La sesión debe corresponder al mismo `device_id`.

#### 12. Actor efectivo desde sesión

La sesión de actor debe resolver un empleado humano activo.

La identidad del actor empresarial procede de:

```text
actor_session
→ actor_employee_id
→ effective_actor
```

No procede de:

```text
technical auth user
navigation_role
last actor
device label
device template
client employee_id
```

#### 13. Coincidencia con el handoff anterior

Cuando `AUTH-SRV-005..009` ya hayan resuelto al actor y su contexto, la sesión debe ser consistente con ellos.

Como mínimo:

```text
actor_session.actor_employee_id
=
effective_actor
```

y las referencias de turno, sede, área y rol conservadas por la sesión no pueden contradecir el contexto canónico vigente.

#### 14. Vigencia de la sesión

La sesión de actor debe:

```text
exist
belong to device
not be ended
not be expired
match effective actor
be structurally valid
```

Una sesión sin vencimiento resoluble cuando el contrato lo exige no se interpreta como infinita.

#### 15. Cardinalidad de actor

Por dispositivo solo puede existir un actor efectivo utilizable en un instante.

```text
0 sesiones válidas
→ no business actor

1 sesión válida
→ candidate actor

2+ sesiones incompatibles
→ structural conflict
→ DENY
```

No se fusionan permisos de varios trabajadores.

#### 16. Sesión de actor no es autorización

Se mantiene:

```text
actor_session
≠
permission
≠
shift
≠
check_in
≠
operational_role
```

La sesión identifica quién usa la terminal.

Los gates anteriores continúan resolviendo qué puede hacer esa persona.

#### 17. El dispositivo no tiene turno

La terminal compartida no tiene turno ni check-in propios.

Se mantiene:

```text
DEVICE
→ no shift
→ no attendance authority

ACTOR
→ may require shift/check-in according to required_permission_key
```

`AUTH-SRV-008` conserva la decisión T/T+C/N aplicable a la capacidad exacta.

#### 18. Cambio de actor

Al cambiar de trabajador:

```text
old actor session
→ closed / invalid for new actions

new human identification
→ new actor session
→ full revalidation
```

No pueden sobrevivir al cambio:

- autoridad del actor anterior;
- reautenticación fuerte del actor anterior;
- contexto territorial del actor anterior;
- datos temporales sensibles del actor anterior;
- decisión cacheada anterior.

#### 19. Consistencia durante la transacción

La acción debe conservar el mismo:

```text
device_id
actor_session_id
effective_actor
```

desde la autorización hasta la confirmación del efecto.

Si cualquiera cambia antes de confirmar:

```text
SHARED_DEVICE_ACTOR_CHANGED
→ reject / restart authorization
```

#### 20. Aplicaciones efectivas

El conjunto de aplicaciones del dispositivo es una restricción explícita.

Debe resolverse desde configuración canónica de plantilla e instancia.

Se mantiene:

```text
requested_app
∈
effective_device_application_set
```

como condición necesaria.

No suficiente.

#### 21. Aplicación permitida no concede permiso

Que una aplicación aparezca en la terminal significa únicamente que la superficie puede ser presentada.

No significa:

```text
app allowed
→ <app>.access allowed
```

La clave exacta sigue obligada a pasar por permiso del actor y techo del dispositivo.

#### 22. Techo de permisos del dispositivo

El techo efectivo debe ser la intersección de:

```text
versioned template package
∩
active instance reductions
∩
effective applications
∩
active canonical permission catalog
```

La instancia solo puede reducir el techo de su plantilla.

Nunca ampliarlo.

#### 23. Claves exactas

El techo usa únicamente:

```text
exact canonical permission_key
```

Quedan prohibidos como fuente de membresía:

```text
wildcards
prefixes
role names
navigation_role
application names
routes
screens
client lists
implicit aliases that widen authority
```

#### 24. Claves nuevas o reclasificadas

Una clave que aparezca después de la versión aprobada del paquete no se incorpora automáticamente.

La regla es:

```text
unknown_to_device_package
→ DENY
```

hasta existir revisión, nueva versión y despliegue explícito del paquete aplicable.

#### 25. `shared_device_requirement`

Cada permiso canónico debe conservar exactamente una clasificación:

```text
STANDARD_ACTOR_SESSION
STRONG_REAUTH_REQUIRED
NOT_ALLOWED
```

Una clasificación ausente o desconocida produce:

```text
DENY_ON_SHARED_DEVICE
```

#### 26. `STANDARD_ACTOR_SESSION`

Para una clave `STANDARD_ACTOR_SESSION`, la sesión ordinaria de actor puede ser suficiente para el componente de dispositivo, siempre que además se cumplan:

```text
device valid
app allowed
permission in device ceiling
actor session valid
actor permission valid
territory compatible
shift/check-in when permission requires
resource compatible
no higher denial
```

`STANDARD` no significa bajo riesgo ni autorización automática.

#### 27. `STRONG_REAUTH_REQUIRED`

Una clave `STRONG_REAUTH_REQUIRED` exige, además de todo lo anterior:

```text
personal strong reauthentication
bound to effective actor
short and verifiable validity
explicit confirmation
supported by current device
```

La reautenticación no puede pertenecer al actor anterior.

#### 28. PIN ligero

El PIN ligero puede identificar rápidamente al trabajador e iniciar la sesión de actor según el mecanismo aprobado.

No satisface por sí solo:

```text
STRONG_REAUTH_REQUIRED
```

Se mantiene:

```text
LIGHTWEIGHT_PIN
≠
STRONG_REAUTH
```

#### 29. `NOT_ALLOWED`

Cuando:

```text
shared_device_requirement = NOT_ALLOWED
```

la terminal no puede:

- ejecutar la capacidad;
- revelar el contenido protegido por esa capacidad;
- degradarla silenciosamente a solo lectura;
- usar una clave más amplia como sustituto;
- habilitarla por rol, plantilla o tipo de terminal.

La operación requiere el carril personal que corresponda.

#### 30. Territorio del dispositivo

La sede y área configuradas en el dispositivo son restricciones del dispositivo.

No son fuentes del territorio del actor.

Se mantiene:

```text
device.site
≠ actor operational site source

device.area
≠ actor operational area source
```

El actor llega con territorio ya resuelto por `AUTH-SRV-006..009`.

#### 31. Dispositivo con sede operacional exacta

Cuando la política de la instancia sea operacional de sede exacta:

```text
validated_target_site_id
=
device_fixed_site_id
```

debe cumplirse para la acción operativa.

Una discrepancia produce denegación.

#### 32. Dispositivo con área fija exacta

Cuando la política de la instancia exija área exacta:

```text
target_area_id
=
device_fixed_area_id
```

debe cumplirse cuando la acción tenga semántica operativa de área.

El área del dispositivo nunca sustituye un `target_area_id` ausente o inválido.

#### 33. Conjunto explícito de áreas

Cuando una instancia admita un conjunto cerrado de áreas:

```text
target_area_id
∈
device_allowed_area_ids
```

Cada acción conserva una sola área efectiva.

El conjunto no se convierte en:

```text
wildcard
all site areas
actor authority union
```

#### 34. Terminal logística

Una terminal logística móvil puede conservar una sede y área base de propiedad o custodia.

Ruta, vehículo, geolocalización, origen o destino no amplían automáticamente ese territorio.

La autorización del recurso conserva sus lados territoriales propios.

#### 35. Terminal de recepción mixta

Una terminal con modo administrativo y operativo debe mantener los carriles separados.

Carril operativo:

```text
device territory restrictions
→ apply as restrictive intersection
```

Carril administrativo:

```text
actor administrative scope
→ remains authoritative
```

La ubicación física del dispositivo no crea ni amplía cobertura administrativa.

#### 36. Terminal administrativa

Cuando el área del dispositivo sea exclusivamente de ubicación, propiedad o custodia:

```text
PHYSICAL_OWNERSHIP_ONLY
```

esa área no debe convertirse en alcance administrativo del actor.

La terminal puede imponer controles de seguridad propios, pero no redefinir la cobertura organizacional legítima.

#### 37. Recurso y dispositivo

El territorio del recurso continúa resolviéndose desde el backend conforme al contrato del recurso.

La terminal no puede reescribir:

```text
resource.site_id
resource.area_id
source territory
destination territory
```

para acomodar la acción.

#### 38. Carril administrativo desde dispositivo compartido

Una capacidad administrativa solo puede ejecutarse desde dispositivo compartido si su clasificación explícita lo admite.

Debe cumplirse:

```text
base actor authorization
+
device shared requirement
+
device app
+
device permission ceiling
+
valid actor session
+
device-specific restrictions
```

No se exige turno o check-in por inferencia cuando el permiso base no los exige.

#### 39. Carril operativo desde dispositivo compartido

Una capacidad operativa conserva íntegramente los gates anteriores:

```text
actor
permission
site
area when required
shift
check-in when required
operational role
```

y añade:

```text
device identity
actor session
app
permission ceiling
device territory
shared-device classification
strong reauth when required
```

El dispositivo no degrada T+C a T ni T a N.

#### 40. `BASE_OR_OPERATIONAL`

Cuando un permiso permita ambos carriles, el dispositivo no fusiona sus condiciones.

El servidor determina qué carril está autorizando y aplica las restricciones de dispositivo al carril realmente usado.

#### 41. `BASE_AND_OPERATIONAL`

Cuando ambos carriles sean obligatorios, el dispositivo no elimina ninguno.

La acción exige:

```text
valid base component
+
valid operational component
+
valid shared-device component
```

#### 42. Políticas de actor del dispositivo

La política de actor puede restringir quién puede iniciar o mantener sesión en la terminal.

Debe evaluarse contra hechos canónicos del trabajador y su contexto.

No puede conceder una capacidad empresarial ausente.

#### 43. `navigation_role`

Se mantiene:

```text
navigation_role
→ presentation / navigation hint only
```

Queda prohibido:

```text
navigation_role
→ effective actor
navigation_role
→ effective operational role
navigation_role
→ permission grant
navigation_role
→ device permission package
```

#### 44. Datos controlados por cliente

Valores como:

```text
device_id
actor_employee_id
actor_session_id
site_id
area_id
navigation_role
permission package
strong_reauth flag
```

recibidos desde cliente son selectores o contenido no autoritativo.

La decisión debe reconstruirse desde fuentes de servidor.

#### 45. Server Actions

Una Server Action empresarial invocada desde dispositivo compartido deberá demostrar:

```text
technical principal
→ canonical device
→ device state
→ canonical actor session
→ effective actor
→ prior authorization gates
→ app/device ceiling
→ shared-device requirement
→ territory/device policy
→ strong reauth when required
→ current transaction consistency
→ remaining gates
→ effect
```

La página que originó el request no sustituye esa evaluación.

#### 46. API routes

Una API mutante no puede aceptar como autoridad:

```text
deviceId
actorId
actorSessionId
deviceRole
isStrongAuthenticated
```

enviados por cliente.

Debe resolver el contexto compartido desde el principal y registros canónicos.

#### 47. RPC

Una RPC empresarial accesible desde una identidad técnica debe recibir o reconstruir una decisión compatible con este contrato.

Una función privilegiada no puede interpretar que:

```text
auth.uid() = device auth user
```

equivale a:

```text
authorized employee
```

#### 48. Service role

El uso de un cliente administrativo o `service_role` después del gate no borra la separación principal técnico/actor.

Toda acción humana sigue atribuida al empleado real.

Un proceso autónomo legítimo utiliza su contrato de sistema y no una sesión ficticia de dispositivo.

#### 49. Conectividad

Sin conectividad verificable no se ejecuta una nueva mutación empresarial desde dispositivo compartido bajo este contrato.

Una vista cacheada puede servir para presentación controlada, pero:

```text
cached authorization decision
≠
current authority
```

Toda futura capacidad offline requiere contrato independiente.

#### 50. Contexto obsoleto

Debe revalidarse cuando cambie cualquiera de estas dimensiones:

```text
device activation
device revocation
template or package version
instance reduction
allowed applications
actor session
actor
shift
check-in
site
area
operational role
actor permission
denial
strong reauthentication
resource
```

Una decisión previa no sobrevive automáticamente.

#### 51. Fallo cerrado

Cualquiera de estos estados bloquea cuando sea aplicable:

```text
shared_device_unresolved
shared_device_inactive
shared_device_template_version_invalid
shared_device_app_not_allowed
shared_device_permission_not_listed
shared_device_permission_not_allowed
shared_device_actor_required
shared_device_actor_session_expired
shared_device_session_mode_mismatch
shared_device_actor_policy_mismatch
shared_device_site_mismatch
shared_device_area_mismatch
shared_device_resource_mismatch
strong_reauth_required
strong_reauth_not_supported
shared_device_actor_changed
shared_device_context_stale
shared_device_offline_mutation_denied
```

La nomenclatura técnica final podrá especializarse sin alterar estas razones conceptuales.

#### 52. Handoff a `AUTH-SRV-011`

`AUTH-SRV-010` entrega:

```text
effective_actor
authorization_mode
required_permission_key
validated_target_site_id
target_area_id
effective_shift_id
effective_operational_role
device_id
actor_session_id
shared_device_requirement
effective_device_permission_ceiling
device_validation_result
strong_reauth_result
```

`AUTH-SRV-011` vuelve a resolver el estado actual de la entidad y valida la transición permitida.

#### 53. Handoff a `AUTH-SRV-012`

El dispositivo no concede capacidad cross-site.

`AUTH-SRV-012` conserva la validación de todos los cruces entre sedes involucrados por el recurso o el efecto.

#### 54. Handoff a `AUTH-SRV-013`

El dispositivo no concede capacidad cross-area.

`AUTH-SRV-013` conserva la validación de todo cruce entre áreas.

#### 55. Handoff a auditoría posterior

La decisión debe conservar suficiente lineage para que la auditoría posterior pueda atribuir:

```text
technical principal
device_id
actor_session_id
effective_actor
site
area
role
permission
device package/version
shared-device requirement
strong reauth state
decision
```

El contrato detallado de evidencia y auditoría continúa en sus tareas propietarias.

#### 56. Baseline físico existente

La infraestructura actual ya contiene, entre otros:

```text
public.shared_operational_devices
public.shared_operational_device_apps
public.shared_operational_device_actor_sessions
public.shared_operational_device_events
```

La existencia física de estas tablas no demuestra que cada consumidor aplique el contrato completo.

#### 57. Baseline físico — identidad y estado

El modelo existente vincula:

```text
shared_operational_devices.auth_user_id
```

con la identidad técnica y dispone de:

```text
is_active
activation_status
site_id
area_id
```

como información registral.

Esto constituye infraestructura aprovechable, no autorización empresarial completa.

#### 58. Baseline físico — sesión de actor

La tabla de sesiones existente conserva:

```text
device_id
actor_employee_id
actor_shift_id
actor_operational_role
site_id
area_id
started_at
expires_at
ended_at
ended_reason
```

y mantiene una restricción registral de una sesión abierta por dispositivo.

La futura materialización deberá reconciliar ese estado registral con la vigencia canónica del actor y su contexto.

#### 59. Baseline VISO

Se conserva el snapshot:

```text
vento-group-sas/vento-viso
8cf7c49a593c748cb6c99dd9b919b6947bcfec14
```

Superficies relevantes:

```text
src/lib/auth/operational-session.ts
src/lib/auth/guard.ts
```

#### 60. VISO — resolución actual del dispositivo

El baseline ya:

- busca un dispositivo por `auth_user_id`;
- exige `is_active = true`;
- exige `activation_status = active`;
- carga aplicaciones activas;
- identifica `sharedDeviceId`, código y etiqueta.

Estos son controles parciales útiles.

#### 61. VISO — ausencia de sesión de actor

El resolver auditado no consulta:

```text
shared_operational_device_actor_sessions
```

para construir la sesión compartida.

Por tanto no demuestra:

```text
human actor
actor_session_id
actor session expiry
actor-session/effective-actor consistency
```

antes de evaluar permisos.

#### 62. VISO — `navigation_role` como autoridad

El baseline asigna:

```text
navigationRole = shared_operational_devices.navigation_role
```

y utiliza ese valor como `roleCode` para `has_operational_role_permission`.

Ese comportamiento no satisface este contrato.

La fuente del rol efectivo permanece en el turno del actor humano conforme a `AUTH-SRV-009`.

#### 63. VISO — territorio preferido sobre territorio del dispositivo

El baseline permite construir:

```text
siteId = preferredSiteId ?? device.site_id
areaId = preferredAreaId ?? device.area_id
```

En una identidad compartida, una preferencia de request no puede ampliar ni sustituir la política territorial fija o permitida de la instancia.

La futura materialización deberá resolver ambos contextos por separado e intersectarlos.

#### 64. VISO — aplicación permitida y acceso

El baseline permite considerar accesible una aplicación por pertenecer a `allowedAppCodes` y contiene una ruta donde la clave `<app>.access` puede resultar verdadera desde la lógica de sesión compartida.

El contrato final exige separar:

```text
app presentation eligibility
≠
actor permission
≠
device permission ceiling
```

La aplicación efectiva es condición necesaria, no concesión.

#### 65. VISO — techo y clasificación ausentes

El baseline auditado no demuestra resolución de:

```text
capability_package_code
effective device permission ceiling
shared_device_requirement
STRONG reauthentication
NOT_ALLOWED enforcement
```

Esas dimensiones deberán incorporarse en la futura unidad física aplicable.

#### 66. VISO — resultado del diagnóstico

El baseline se clasifica:

```text
PARTIAL_SHARED_DEVICE_CONTROL
```

porque reconoce identidad técnica y aplicaciones, pero no demuestra todavía la intersección completa entre:

```text
human actor authority
∩
device restrictions
```

No se considera cumplimiento de `AUTH-SRV-010` hasta la futura materialización.

#### 67. Lineage obligatorio

Cada futura unidad deberá conservar:

```text
surface_identity
→ principal_type
→ technical_principal
→ device_id
→ device_status
→ template/package version
→ effective applications
→ actor_session_id
→ effective_actor
→ authorization_mode
→ required_permission_key
→ prior site/area/shift/role context
→ shared_device_requirement
→ effective device permission ceiling
→ device territory policy
→ strong reauth result
→ device validation result
→ downstream state/cross-territory gates
→ effect
```

#### 68. Materialización futura

Cada instancia:

```text
AUTH-SRV-010::<implementation_unit_id>
```

deberá registrar como mínimo:

```text
implementation_unit_id
repository
commit_before
surface_identity[]
write_operation[]
principal_type
technical_principal_source
device_source
device_id
device_status
device_template_version
effective_applications[]
actor_session_source
actor_session_id
effective_actor_source
authorization_mode
required_permission_key[]
shared_device_requirement[]
device_permission_package
effective_device_permission_keys[]
device_site_policy
device_area_policy
strong_reauth_rule
strong_reauth_source
client_device_fields[]
privileged_client_usage
offline_mode
package_id[]
change_set
rollback
validation_commands
evidence
commit_after
```

#### 69. Evidencia mínima de una futura unidad

La materialización deberá demostrar, cuando aplique:

1. sesión personal no recibe `device_context`;
2. dispositivo inexistente o ambiguo → deny;
3. dispositivo inactivo, suspendido o revocado → deny empresarial;
4. dispositivo sin actor puede conservar superficie técnica, no acción empresarial;
5. sesión de actor ausente → deny empresarial;
6. sesión de actor expirada → deny;
7. actor de sesión distinto del actor efectivo → deny;
8. varias sesiones incompatibles → deny;
9. aplicación no efectiva → deny;
10. aplicación efectiva no concede `<app>.access`;
11. clave fuera del techo → deny;
12. instancia no amplía paquete de plantilla;
13. clave nueva no entra automáticamente al paquete;
14. `NOT_ALLOWED` → deny;
15. `STANDARD` conserva permiso y contexto del actor;
16. `STRONG` exige reautenticación personal fuerte;
17. PIN ligero no satisface `STRONG`;
18. reautenticación no se transfiere al cambiar actor;
19. `navigation_role` no concede rol ni permiso;
20. sede o área del cliente no sustituyen la política del dispositivo;
21. área fija o permitida solo restringe;
22. carril administrativo no recibe turno por inferencia;
23. carril operativo conserva T/T+C y rol del actor;
24. actor cambia durante la acción → deny/restart;
25. contexto stale se reautoriza;
26. mutación offline sin contrato explícito → deny;
27. llamada directa produce la misma decisión que la interfaz;
28. auditoría puede reconstruir principal técnico, dispositivo, sesión y actor.

#### 70. Rollback

El rollback de una futura unidad deberá restaurar únicamente el mecanismo técnico anterior sin:

- convertir el dispositivo en actor empresarial;
- permitir acciones sin actor humano;
- reintroducir `navigation_role` como autoridad;
- ampliar el paquete de una instancia;
- aceptar wildcards de permisos;
- convertir aplicación permitida en permiso;
- degradar `STRONG` a PIN ligero;
- habilitar claves `NOT_ALLOWED`;
- convertir sede o área del dispositivo en territorio del actor;
- conservar autoridad residual entre trabajadores;
- borrar historial de sesiones o eventos.

#### 71. Criterios de aceptación

`AUTH-SRV-010` queda documentalmente satisfecha cuando:

1. identidad técnica y actor humano permanecen separados;
2. la instancia se resuelve desde el principal técnico en servidor;
3. estado activo y configuración vigente son condiciones obligatorias;
4. una terminal sin actor no ejecuta acciones empresariales;
5. la sesión de actor se resuelve canónicamente y coincide con el actor efectivo;
6. solo un actor utilizable participa por dispositivo;
7. la sesión de actor no sustituye turno, check-in, rol ni permiso;
8. el dispositivo no tiene turno ni check-in;
9. las aplicaciones efectivas restringen pero no conceden;
10. el techo de permisos usa claves exactas y la instancia solo reduce;
11. claves nuevas quedan denegadas hasta versionado explícito;
12. `STANDARD`, `STRONG` y `NOT_ALLOWED` se aplican sin degradación;
13. PIN ligero no satisface `STRONG`;
14. sede y área del dispositivo solo restringen conforme a su política;
15. carriles administrativos y operativos permanecen separados;
16. el contexto de dispositivo no reabre decisiones de `AUTH-SRV-005..009`;
17. cambio de actor invalida el contexto anterior;
18. Server Actions, API y RPC reconstruyen el dispositivo en servidor;
19. las mutaciones offline quedan denegadas salvo contrato futuro explícito;
20. las brechas observadas del baseline VISO quedan identificadas;
21. se preservan los handoffs a estado actual y cruces territoriales;
22. no se autorizan cambios físicos desde el marcador global;
23. no se crean ni modifican requisitos de prueba.

#### 72. Límites

Este marcador no certifica todavía:

- estado mutable actual del recurso;
- transición de estado de la entidad;
- autorización cross-site;
- autorización cross-area;
- ciclo completo de enrolamiento del dispositivo;
- duración numérica definitiva de sesión;
- mecanismo técnico definitivo de PIN, passkey o MFA;
- heartbeat físico;
- rotación de credenciales;
- revocación física completa;
- validación física de las instancias observadas;
- implementación final de paquetes de capacidades;
- RLS;
- grants;
- `SECURITY DEFINER`;
- auditoría completa;
- atomicidad;
- idempotencia;
- contrato final de errores.

Estas responsabilidades conservan sus owners canónicos.

#### 73. Evidencia de validación

| Clase     | Estado           | Evidencia                                                                                                                                                                                                                                                                                                             |
| --------- | ---------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| BUILD     | `NOT_EXECUTED`   | no se ejecutó build durante el desarrollo documental                                                                                                                                                                                                                                                                  |
| LOCAL     | `NOT_EXECUTED`   | no se ejecutaron comandos contra el checkout del usuario                                                                                                                                                                                                                                                              |
| REMOTA    | `PASS`           | se auditaron en solo lectura la continuidad vigente, la topología del Bloque J, el owner de `AUTH-SRV-010`, los contratos canónicos de dispositivo compartido, contexto de dispositivo, compatibilidad de permisos, techo de capacidades, registro 04A aplicable, infraestructura Supabase versionada y baseline VISO |
| OPERATIVA | `NOT_APPLICABLE` | el marcador no cambia operación real                                                                                                                                                                                                                                                                                  |
| FÍSICA    | `NOT_APPLICABLE` | no existe instancia física autorizada para esta tarea                                                                                                                                                                                                                                                                 |

#### 74. Requisitos de prueba derivados

**Resultado:** NO GENERA REQUISITOS DE PRUEBA.

**Justificación:** la intersección entre autoridad del actor y límites del dispositivo, la atribución a un humano real, la clasificación `STANDARD`/`STRONG`/`NOT_ALLOWED`, el techo exacto de permisos, la invalidación de contexto y la revalidación server-side ya disponen de cobertura canónica vigente. `AUTH-SRV-010` especifica el gate de servidor que consumirá esa cobertura y no introduce una obligación verificable sin requisito existente.

#### 75. Cobertura de prueba vigente reutilizada

Se reutiliza sin modificar el registro vigente:

- `TREQ-AUTH-011` — la autoridad desde dispositivo compartido es la intersección entre límites del dispositivo y permisos del trabajador identificado;
- `TREQ-AUTH-013` — toda mutación revalida en servidor principal, actor, permiso, territorio, contexto y estado requerido;
- `TREQ-AUTH-014` — cambio de trabajador, dispositivo o contexto invalida decisiones y autoridad derivada;
- `TREQ-AUTH-059` — el techo efectivo del dispositivo es la intersección entre plantilla, reducción de instancia, aplicaciones y catálogo;
- `TREQ-AUTH-060` — las membresías del paquete utilizan claves canónicas exactas;
- `TREQ-AUTH-061` — aplicaciones y claves del techo deben permanecer coherentes sin autorización implícita;
- `TREQ-AUTH-062` — cada acción intersecta actor, techo, aplicación, modo, territorio, recurso, prerrequisitos y denegaciones;
- `TREQ-AUTH-063` — `STANDARD`, `STRONG` y `NOT_ALLOWED` conservan sus requisitos sin degradación.

Estas referencias son trazabilidad heredada y no representan requisitos creados o modificados por `AUTH-SRV-010`.

#### 76. Continuidad

**ÚLTIMA TAREA APROBADA**
`AUTH-SRV-009 — Validar rol operativo cuando corresponda`

**TAREA ACTUAL APROBADA**
`AUTH-SRV-010 — Validar dispositivo compartido`

**SIGUIENTE TAREA RESERVADA**
`AUTH-SRV-011 — Validar estado actual de la entidad`


### ✅ AUTH-SRV-011 — Validar estado actual de la entidad

**Estado:** APROBADA
**Tarea anterior:** AUTH-SRV-010 — Validar dispositivo compartido
**Tarea siguiente:** AUTH-SRV-012 — Evitar operaciones entre sedes no autorizadas
**Tipo de tarea:** Contrato global con materialización por unidad (`PER_IMPLEMENTATION_UNIT`) — contrato de precondición de estado para que toda escritura protegida sobre una entidad existente resuelva nuevamente en servidor el recurso canónico, lea su estado autoritativo y su versión vigente, verifique que el estado de origen admite el efecto o transición solicitados y falle cerrado ante recurso ausente, estado desconocido, transición incompatible, snapshot obsoleto, conflicto de concurrencia o mutación que intente tratar la interfaz como fuente de estado
**Bloque:** BLOQUE J — Protección de acciones de servidor
**Repositorio propietario:** `vento-group-sas/vento-shell`
**Archivo propietario:** `docs/plan-canonico/modular/bloques/J_ACCIONES_DE_SERVIDOR/02_VALIDACION_AUTORIZACION_Y_TERRITORIO.md`
**Estado físico resultante:** `ESPECIFICADO_NO_MATERIALIZADO`
**Cambios físicos autorizados:** 0 durante el marcador global; las futuras materializaciones ocurren únicamente mediante `AUTH-SRV-011::<implementation_unit_id>` después de que `DELIV-PKG-025::<package_id>` asigne la unidad y el paquete propietario supere `E5-GATE-008::<package_id>`
**Requisitos de prueba creados o modificados:** 0

---

#### 1. Propósito

Definir el gate obligatorio de estado actual para toda escritura empresarial protegida que actúe sobre una entidad existente o pretenda ejecutar una transición de negocio.

La regla vinculante queda:

```text
RECURSO CANÓNICO ACTUAL
+
ESTADO AUTORITATIVO ACTUAL
+
EFECTO EFECTIVO
+
PREDICADO DE ESTADO
+
TRANSICIÓN PERMITIDA CUANDO APLIQUE
+
FRESCURA / CONCURRENCIA VÁLIDA
=
WRITE_ELIGIBLE_FOR_NEXT_GATES
```

Un permiso correcto no autoriza una transición imposible.

#### 2. Handoff recibido de `AUTH-SRV-010`

La tarea anterior entrega como mínimo:

```text
effective_actor
authorization_mode
required_permission_key
validated_target_site_id
target_area_id
effective_shift_id
effective_operational_role
device_id
actor_session_id
shared_device_requirement
effective_device_permission_ceiling
device_validation_result
strong_reauth_result
```

`AUTH-SRV-011` añade:

```text
resource_resolution_result
resource_id
resource_version
current_state_snapshot
requested_state_effect
state_predicate
transition_identity
state_validation_result
concurrency_policy
concurrency_validation_result
```

No reabre permiso, sede, área, turno, rol operativo ni dispositivo ya validados.

#### 3. Pregunta contractual propietaria

Esta tarea responde:

```text
¿EN QUÉ ESTADO ESTÁ REALMENTE LA ENTIDAD AHORA?
```

y:

```text
¿ESE ESTADO ADMITE EL EFECTO O TRANSICIÓN
QUE LA ESCRITURA PRETENDE EJECUTAR?
```

No responde todavía si la operación puede cruzar entre sedes o áreas.

Esas responsabilidades permanecen en `AUTH-SRV-012` y `AUTH-SRV-013`.

#### 4. Estado de interfaz y estado empresarial

Se mantienen separados:

```text
estado mostrado por UI
estado enviado por cliente
estado leído previamente
estado cacheado
estado autoritativo actual
```

Solo el último puede decidir una mutación.

#### 5. Contrato de recurso consumido

Cada capacidad protegida conserva el contrato de recurso aprobado que define, cuando corresponda:

```text
resource_type
resource_locator
subject_resolver
territory_resolver
ownership_resolver
required_sides
state_predicate
concurrency_policy
field_policy
audit_policy
```

`AUTH-SRV-011` consume `state_predicate` y `concurrency_policy` sin redefinir el recurso por inferencia.

#### 6. Resolución previa del recurso

Antes de validar estado, el servidor debe resolver la entidad concreta afectada.

La identidad puede provenir de un selector solicitado, pero la entidad completa se obtiene desde la fuente canónica.

Se mantiene:

```text
requested_resource_id
→ selector

resolved_resource
→ authority source
```

#### 7. Relectura obligatoria

Una entidad existente debe releerse desde la fuente autoritativa antes del efecto.

No basta con reutilizar:

- el objeto cargado al renderizar;
- el valor incluido en un formulario;
- una prop de componente;
- una fila almacenada en cliente;
- una respuesta anterior de API;
- una decisión de autorización previa;
- el estado mostrado por una tabla o modal.

#### 8. `state_snapshot`

La decisión de autorización utiliza un snapshot mínimo de hechos de estado necesarios para decidir.

Puede contener, según el contrato de la capacidad:

```text
current state
proposed state
transition
effective date
close condition
cancellation condition
receipt condition
```

El snapshot no es una copia indiscriminada de toda la entidad.

#### 9. Estado actual resuelto en servidor

El estado actual debe derivarse de campos, relaciones o hechos canónicos del recurso.

No podrá sustituirse por:

```text
status from request
isDraft from client
isPublished from UI
canEdit flag
button visibility
route state
hidden field
local cache
```

#### 10. `state_predicate`

Toda mutación sobre una entidad existente debe aplicar el predicado de estado de su contrato cuando la capacidad lo defina.

El predicado responde:

```text
¿EL RECURSO ACTUAL CUMPLE LAS PRECONDICIONES
PARA ESTA CAPACIDAD EXACTA?
```

No es un permiso adicional.

Es una precondición empresarial de la escritura.

#### 11. Estado permitido no equivale a permiso

Se mantiene:

```text
state_predicate = satisfied
≠
permission granted
```

y:

```text
permission = granted
≠
state_predicate satisfied
```

Ambas dimensiones deben ser válidas antes del efecto.

#### 12. Estado ausente, desconocido e inaplicable

Se distinguen:

```text
STATE_NOT_APPLICABLE
STATE_RESOLVED
STATE_UNRESOLVED
STATE_CONFLICT
```

La ausencia de un predicado solo es válida cuando el contrato de recurso declara explícitamente que el estado no participa.

No se interpreta `null` como “cualquier estado”.

#### 13. Recurso inexistente

Cuando una operación requiere una entidad existente y el resolver no la encuentra:

```text
RESOURCE_NOT_FOUND
→ DENY / NO EFFECT
```

No se crea una entidad sustituta ni se convierte la operación en `create` por inferencia.

#### 14. Creación de una entidad nueva

Una creación legítima no posee todavía un estado actual de la nueva fila.

Por tanto, el gate valida:

```text
resource absence / uniqueness when required
+
parent or referenced entities
+
allowed birth state
+
creation invariant
```

No inventa un “estado anterior” ficticio.

#### 15. Estado inicial de creación

El estado inicial de una entidad nueva debe provenir del contrato del recurso o del proceso.

El cliente puede solicitar una intención de creación.

No puede seleccionar libremente un estado inicial privilegiado que salte etapas.

#### 16. Escritura sobre entidad existente

Para `update`, `delete`, `cancel`, `publish`, `approve`, `receive`, `close`, `revoke` u otro efecto equivalente, el recurso se considera existente y requiere estado actual autoritativo cuando el contrato lo establezca.

La semántica empresarial prevalece sobre el verbo técnico.

#### 17. Efecto efectivo y transición

La tarea consume el efecto reconstruido por `AUTH-SRV-004`.

La relación queda:

```text
effective_mutation
+
current_state_snapshot
→ requested_state_effect
```

El servidor determina si existe una transición de negocio y cuál es.

#### 18. Estado de origen

Toda transición debe declarar un estado o conjunto de estados de origen admitidos por el contrato correspondiente.

Si:

```text
current_state
∉
allowed_origin_states
```

entonces:

```text
INVALID_STATE_FOR_OPERATION
→ DENY
```

#### 19. Estado de destino

Cuando la operación produce un nuevo estado, el destino debe estar admitido por la transición canónica.

No se acepta:

```text
arbitrary target status
```

enviado por cliente.

#### 20. Transición exacta

Una transición se evalúa conceptualmente como:

```text
process/resource
+
origin state
+
business effect
+
destination state
```

No como:

```text
PATCH status = client_value
```

#### 21. Transición inexistente

Si el proceso o contrato no define una transición entre el origen real y el destino solicitado:

```text
TRANSITION_NOT_ALLOWED
→ DENY
```

Un permiso administrativo amplio no crea una transición inexistente.

#### 22. Guard de estado de origen

Las transiciones canónicas de proceso exigen comprobar que la instancia:

```text
exists
belongs to the expected process/resource
is currently in the expected origin state
```

La comprobación ocurre nuevamente al ejecutar el comando.

#### 23. Estado actual y estado propuesto

Se mantienen separados:

```text
current_state
≠
proposed_state
```

El estado propuesto expresa el resultado buscado.

No sustituye el estado actual leído desde servidor.

#### 24. Estados terminales

Una entidad en estado terminal no vuelve automáticamente a un estado previo por recibir una mutación genérica.

Cualquier reapertura, reversa o nueva revisión debe existir como transición canónica explícita.

#### 25. Ciclos y reaperturas

Cuando un proceso permite ciclo, revisión o retorno, la operación debe seguir la transición aprobada.

No se reescriben hechos históricos para simular que la transición anterior nunca ocurrió.

#### 26. Omisiones de estados intermedios

Un salto de estado solo puede realizarse cuando el proceso lo declare expresamente como transición válida o bypass justificado.

No se permite saltar estados porque la interfaz no los muestre.

#### 27. Eliminación física

Una eliminación física solo es válida cuando el contrato del recurso y su estado actual la permiten.

La existencia de permiso `delete` no implica:

```text
DELETE ANY STATE
```

Un recurso publicado, aprobado, contabilizado, recibido, cerrado o equivalente puede requerir cancelación, reversa, retiro o nueva revisión en lugar de borrado físico.

#### 28. Cancelación

`cancel` es una acción empresarial distinta de `delete`.

Debe validar:

```text
current state
+
cancellation transition
+
business conditions
```

y conservar la evidencia que corresponda a su owner de auditoría.

#### 29. Publicación

`publish` es una transición empresarial.

Debe validar:

```text
current state is publishable
+
publication preconditions
+
current version is fresh
```

No puede limitarse a cambiar un timestamp enviado por cliente.

#### 30. Aprobación

`approve` exige que el recurso se encuentre en un estado aprobable y que la transición esté definida.

La autoridad para aprobar no permite aprobar algo ya cerrado, retirado, reemplazado o incompatible.

#### 31. Recepción y handoff

Cuando una transición representa entrega, recepción, aceptación o handoff, el estado actual debe demostrar que la contraparte está realmente en la etapa pendiente correspondiente.

Las validaciones de ambos lados territoriales continúan en tareas posteriores.

#### 32. Operaciones compuestas

Si una solicitud produce varias transiciones o modifica varias entidades, cada entidad debe satisfacer su propio predicado de estado antes del primer efecto irreversible.

No se usa el estado válido de una fila para justificar las demás.

#### 33. Operaciones masivas

Una operación masiva no convierte el estado en una validación de conjunto genérica.

Para cada recurso:

```text
resolve resource
→ resolve current state
→ validate state predicate
```

Si el contrato exige comportamiento todo-o-nada y una fila falla, no se autoriza el lote parcial.

#### 34. Conjunto heterogéneo

Si un lote contiene:

```text
draft
published
cancelled
other incompatible state
```

la operación no debe filtrar silenciosamente los estados incompatibles cuando el contrato del comando exige que el conjunto solicitado sea válido completo.

Cualquier filtrado permisible debe ser parte explícita de la semántica del comando.

#### 35. Versión del recurso

Cuando el recurso exponga versión autoritativa:

```text
resource_version
```

la decisión debe asociarse a esa versión.

Una versión enviada por cliente funciona como expectativa de concurrencia.

No como fuente del estado actual.

#### 36. Políticas de concurrencia

El contrato del recurso puede exigir mecanismos como:

```text
EXPECTED_VERSION
UPDATED_AT
LOCK
SNAPSHOT
IDEMPOTENCY_KEY
```

o su equivalente físico aprobado.

`AUTH-SRV-011` no escoge el mecanismo por conveniencia local.

Consume la política definida para la capacidad y el recurso.

#### 37. Escritura obsoleta

Si la entidad cambió después de que el usuario la observó:

```text
expected version
≠
current version
```

o existe una contradicción equivalente, la solicitud queda obsoleta.

Resultado:

```text
STALE_RESOURCE_STATE
→ NO EFFECT
```

#### 38. Ventana autorización–escritura

La validación de estado no puede quedar separada del efecto por una ventana que permita que otra transacción cambie la precondición sin ser detectada.

La materialización deberá:

```text
validate fresh state
→ bind validation to write
```

mediante la política de concurrencia aprobada.

#### 39. Cambio concurrente

Si otra operación cambia el recurso entre la lectura y el intento de efecto, la escritura debe:

```text
fail as conflict
or
re-resolve and re-authorize
```

según el contrato.

No continúa usando la decisión antigua.

#### 40. Reautorización

Una relectura que detecte cambio de estado invalida la parte de la decisión que dependía de ese estado.

La operación debe reconstruir las condiciones afectadas antes de producir el efecto.

#### 41. Estado y territorio

Un cambio de estado puede alterar el significado territorial del recurso.

`AUTH-SRV-011` detecta el cambio de estado.

Los cruces entre sedes o áreas que resulten de la operación se validan después en `AUTH-SRV-012` y `AUTH-SRV-013`.

#### 42. Estado y actor

Un cambio de estado no concede nueva autoridad al actor.

Si el nuevo estado exige otra capacidad, aprobación, rol o participante, la operación debe satisfacer ese contrato exacto.

#### 43. Estado y dispositivo compartido

El hecho de operar desde un dispositivo válido no modifica la máquina de estados del recurso.

Se mantiene:

```text
device valid
≠
state transition valid
```

#### 44. Estado y simulación

Una simulación puede calcular hipotéticamente una transición permitida o denegada.

No puede convertir el resultado simulado en estado actual ni ejecutar la mutación real.

La protección específica de simulación conserva su owner posterior.

#### 45. Campos de estado controlados por cliente

Campos como:

```text
status
state
phase
published
approved
cancelled
closed
resource_version
updated_at
```

recibidos desde cliente se tratan como intención, selector o expectativa.

Nunca como confirmación de la realidad actual.

#### 46. Server Actions

Una Server Action que modifica una entidad existente deberá demostrar:

```text
effective mutation
→ resolved resource
→ current server-side state
→ state predicate
→ allowed transition
→ concurrency validation
→ remaining gates
→ effect
```

La página que originó la acción no sustituye la relectura.

#### 47. API routes

Un endpoint mutante debe resolver la entidad antes del efecto.

No se acepta que:

```text
body.status
body.published
body.currentState
```

decidan si la mutación es válida.

Los valores de cliente pueden expresar el cambio solicitado y una expectativa de versión.

#### 48. RPC

Una RPC mutante debe aplicar o recibir de forma segura la misma precondición de estado.

Una función privilegiada no puede omitir la validación porque la capa llamante ya mostró una UI compatible.

#### 49. Cliente administrativo y `service_role`

Una credencial privilegiada puede ejecutar técnicamente una operación que RLS ordinaria impediría.

Por ello, el gate de estado sigue siendo obligatorio antes del efecto.

Se mantiene:

```text
service_role
≠
state transition authorization
```

#### 50. RLS y constraints

RLS, constraints y triggers pueden reforzar invariantes de estado.

No sustituyen el contrato de Server Action, API o RPC cuando el consumidor necesita resolver y explicar la precondición antes del efecto.

La materialización física definitiva permanece en sus owners de base de datos y paquete.

#### 51. Colas y operación diferida

Una operación encolada no conserva indefinidamente el estado observado al originarse.

Antes de ejecutar la mutación real debe releer:

```text
current resource
current state
current version
```

y volver a validar la transición aplicable.

#### 52. Operación offline

Una intención generada offline no autoriza con el snapshot local.

Al sincronizar:

```text
offline intent
→ current server-side resource
→ fresh state validation
→ authorization
→ effect
```

Si el recurso cambió, la operación falla o entra al flujo de conflicto previsto.

#### 53. Recurso `UNRESOLVED` o `CONFLICT`

Cuando el resolver de recurso concluye que el estado o identidad no puede determinarse de forma inequívoca:

```text
UNRESOLVED
or
CONFLICT
→ DENY
```

No se selecciona la interpretación más permisiva.

#### 54. Fallo técnico de lectura

Un error técnico al obtener el estado no se interpreta como:

```text
no state restriction
```

Resultado:

```text
STATE_RESOLUTION_FAILED
→ NO EFFECT
```

La normalización final del error conserva el owner de `AUTH-SRV-016`.

#### 55. Package VISO mensual — responsabilidad específica

Para `VISO-SCHEDULE-MONTHLY-001`, la regla de package de esta tarea es:

```text
011
→ borrador / publicado
```

Por tanto, el gate debe impedir que las operaciones de borrador afecten filas que ya estén publicadas.

#### 56. VISO mensual — dimensiones separadas

En `employee_shifts` se mantienen distintas:

```text
publication state
business/runtime status
shift kind
```

El campo `status` no sustituye el estado de publicación.

La publicación se observa actualmente mediante:

```text
published_at
published_by
```

#### 57. VISO mensual — borrador

En las superficies auditadas, una fila con:

```text
published_at IS NULL
```

se trata como borrador para las operaciones de edición y eliminación de borradores.

Esto no convierte cualquier otro estado de negocio en irrelevante.

#### 58. VISO mensual — publicado

En las superficies auditadas, una fila con:

```text
published_at IS NOT NULL
```

se considera ya publicada para las operaciones de planificación mensual que distinguen borrador/publicado.

Una operación de borrador no puede convertirla silenciosamente en editable.

#### 59. VISO mensual — creación

Las acciones auditadas crean nuevas filas de planificación con:

```text
status = scheduled
published_at = null
published_by = null
```

La creación produce borrador.

No produce publicación implícita.

#### 60. VISO mensual — eliminación individual

`deleteMonthlyDraftShiftAction` restringe físicamente el borrado mediante:

```text
shift id
site id
published_at IS NULL
```

Ese filtro es evidencia de control parcial existente.

La materialización deberá además integrar permiso exacto, resolución completa del recurso y manejo canónico del conflicto de estado.

#### 61. VISO mensual — eliminación masiva

`deleteMonthlyDraftsAction` limita actualmente el borrado a:

```text
site
month interval
published_at IS NULL
```

La regla canónica exige que la eliminación masiva afecte únicamente borradores autorizados y que el conjunto solicitado no pueda incluir publicados por manipulación de cliente.

#### 62. VISO mensual — API de actualización

La API auditada permite actualizar una fila existente únicamente cuando:

```text
id = requested shift
AND
published_at IS NULL
```

Esto impide que el update ordinario modifique una fila publicada mediante ese camino.

El contrato final deberá convertir una ausencia de fila actualizable por conflicto de estado en una decisión semántica segura y consistente.

#### 63. VISO mensual — API de eliminación

La API auditada relee primero:

```text
id
employee_id
shift_date
site_id
published_at
```

y devuelve conflicto cuando la fila ya está publicada.

Después vuelve a condicionar el `delete` a:

```text
published_at IS NULL
```

Este patrón se conserva como referencia positiva de doble comprobación.

#### 64. VISO mensual — publicación

`publishMonthAction`:

1. carga las filas del mes;
2. identifica borradores mediante ausencia de `published_at`;
3. no vuelve a publicar cuando no existen borradores;
4. actualiza publicación únicamente sobre filas cuyo `published_at` sigue nulo.

La condición del `update` es necesaria para evitar convertir nuevamente una fila ya publicada durante el mismo comando.

#### 65. VISO mensual — límite mensual

El trigger versionado de límite mensual se activa cuando una fila queda publicada.

Permite conservar borradores sobre el umbral y bloquea publicación cuando el plan mensual laboral excede el límite vigente.

`AUTH-SRV-011` conserva la separación:

```text
draft may exist
≠
draft may be published
```

El cálculo exacto del límite permanece en los contratos propietarios del package.

#### 66. VISO mensual — `status` no define publicación

Los estados de runtime como:

```text
scheduled
confirmed
completed
cancelled
no_show
```

no reemplazan:

```text
published_at
```

como señal física actual de publicación en el baseline.

Un `scheduled` puede requerir distinguir si todavía es borrador o ya fue publicado.

#### 67. VISO mensual — publicación no editable como borrador

La regla canónica heredada establece:

```text
published revision
→ not silently edited as draft
```

Un cambio posterior a una programación publicada debe seguir el mecanismo canónico de nueva revisión y republicación que corresponda.

`AUTH-SRV-011` no inventa aquí la estructura física final de versionado.

#### 68. VISO mensual — baseline parcial

El baseline actual demuestra controles parciales de estado mediante filtros y relecturas de `published_at`.

No demuestra por sí solo, para todas las superficies y carreras posibles:

- un contrato uniforme de estado;
- una versión autoritativa común;
- la misma semántica de conflicto;
- una transición de revisión/publicación completamente materializada;
- enforcement equivalente en todas las vías privilegiadas.

Por tanto se clasifica:

```text
PARTIAL_CURRENT_STATE_CONTROL
```

#### 69. Fallo cerrado

Cuando aplique, cualquiera de estos estados bloquea el efecto:

```text
resource_not_found
resource_resolution_failed
resource_state_unresolved
resource_state_conflict
invalid_state_for_operation
transition_not_allowed
resource_version_mismatch
stale_resource_state
concurrency_conflict
published_resource_not_draft_editable
state_changed_before_effect
```

La nomenclatura técnica final se normalizará bajo `AUTH-SRV-016` sin alterar estas causas conceptuales.

#### 70. Handoff a `AUTH-SRV-012`

`AUTH-SRV-011` entrega:

```text
resolved resource
resource version
current state snapshot
validated business transition
state validation result
concurrency validation result
```

`AUTH-SRV-012` utiliza el recurso ya validado para comprobar todos los lados de sede afectados por la operación.

#### 71. Handoff a `AUTH-SRV-013`

El estado válido no concede autoridad sobre otra área.

`AUTH-SRV-013` conserva la validación cross-area cuando el recurso o transición involucra más de un área.

#### 72. Handoff a auditoría y errores

La decisión debe conservar suficiente lineage para que las tareas posteriores puedan registrar y normalizar:

```text
resource identity
resource version
state before
requested effect
transition
state validation result
concurrency result
decision
```

La auditoría completa pertenece a `AUTH-SRV-014` y la normalización de errores a `AUTH-SRV-016`.

#### 73. Lineage obligatorio

Cada futura unidad deberá conservar:

```text
surface_identity
→ effective_mutation
→ required_permission_key
→ prior actor/territory/shift/role/device gates
→ resource_type
→ resource_locator
→ resource_id
→ resource_resolution_result
→ resource_version
→ current_state_snapshot
→ state_predicate
→ requested_state_effect
→ transition_identity
→ concurrency_policy
→ concurrency_validation_result
→ state_validation_result
→ downstream cross-site/cross-area gates
→ effect
```

#### 74. Materialización futura

Cada instancia:

```text
AUTH-SRV-011::<implementation_unit_id>
```

deberá registrar como mínimo:

```text
implementation_unit_id
repository
commit_before
surface_identity[]
write_operation[]
resource_type[]
resource_locator[]
resource_source[]
resource_id_source[]
current_state_source[]
current_state_fields[]
state_predicate[]
allowed_origin_states[]
requested_state_effect[]
allowed_transition_source[]
resource_version_source[]
concurrency_policy[]
client_state_fields[]
bulk_state_policy
privileged_client_usage
offline_or_async_mode
package_id[]
change_set
rollback
validation_commands
evidence
commit_after
```

#### 75. Evidencia mínima de una futura unidad

La materialización deberá demostrar, cuando aplique:

1. recurso inexistente → no effect;
2. selector manipulado no sustituye relectura canónica;
3. estado enviado por cliente no autoriza;
4. estado actual válido + permiso válido → puede continuar;
5. permiso válido + estado incompatible → deny;
6. transición inexistente → deny;
7. estado de origen distinto del esperado → deny;
8. estado de destino no permitido → deny;
9. estado desconocido → deny;
10. conflicto de resolución → deny;
11. versión obsoleta → conflicto sin efecto;
12. cambio concurrente antes del write → conflicto o reautorización;
13. `service_role` no omite el gate;
14. Server Action directa aplica la misma regla;
15. API directa aplica la misma regla;
16. RPC privilegiada conserva la precondición;
17. operación offline se revalida al sincronizar;
18. lote no usa una fila válida para justificar otra inválida;
19. eliminación física no omite estado;
20. cancelación no se trata como delete genérico;
21. publicación no se trata como update genérico;
22. creación no inventa estado anterior;
23. estado inicial privilegiado no se acepta desde cliente;
24. en VISO, borrador puede editarse bajo sus demás gates;
25. en VISO, publicado no puede editarse como borrador;
26. en VISO, eliminación individual publicada → deny/conflict;
27. en VISO, eliminación masiva no afecta publicados;
28. en VISO, publicación solo toma borradores vigentes;
29. en VISO, `status` y `published_at` permanecen separados;
30. en VISO, una revisión publicada no se modifica silenciosamente como borrador.

#### 76. Rollback

El rollback de una futura unidad deberá restaurar únicamente el mecanismo técnico anterior sin:

- convertir estado enviado por cliente en autoridad;
- permitir edición de publicados como borradores;
- eliminar filtros de estado existentes;
- permitir transición inexistente;
- omitir relectura del recurso;
- ignorar conflictos de versión;
- convertir `null` en wildcard;
- degradar un conflicto a éxito;
- borrar historial de publicación o transición;
- reintroducir efectos parciales ante estado incompatible.

#### 77. Criterios de aceptación

`AUTH-SRV-011` queda documentalmente satisfecha cuando:

1. toda escritura sobre entidad existente relee el recurso canónico cuando el contrato lo exige;
2. el estado actual procede del servidor;
3. cliente, UI y caché no constituyen autoridad de estado;
4. `state_snapshot` contiene únicamente hechos necesarios para autorizar;
5. cada capacidad aplica su `state_predicate`;
6. permiso válido y estado válido permanecen requisitos independientes;
7. estado desconocido o conflictivo falla cerrado;
8. recurso inexistente no se convierte en creación por inferencia;
9. creación utiliza un estado inicial contractual y no inventa estado anterior;
10. cada transición valida origen, efecto y destino;
11. una transición inexistente se deniega;
12. delete, cancel, publish, approve, receive, close y revoke conservan semántica empresarial propia;
13. operaciones masivas revalidan el estado de cada recurso;
14. la decisión queda ligada a una versión o política de concurrencia cuando corresponda;
15. una escritura obsoleta no produce efecto;
16. una carrera de estado obliga a conflicto o reautorización;
17. Server Actions, API y RPC aplican el mismo gate;
18. `service_role` no omite estado;
19. colas y operaciones offline revalidan al ejecutar;
20. en VISO se preserva la separación borrador/publicado;
21. `status` no sustituye `published_at`;
22. creación mensual produce borrador;
23. eliminación de borrador no afecta publicados;
24. publicación toma únicamente borradores todavía vigentes;
25. un publicado no vuelve a ser borrador editable silenciosamente;
26. el baseline VISO queda clasificado como control parcial existente;
27. los cruces territoriales permanecen reservados a `AUTH-SRV-012` y `AUTH-SRV-013`;
28. no se autorizan cambios físicos desde el marcador global;
29. no se crean ni modifican requisitos de prueba.

#### 78. Límites

Este marcador no certifica todavía:

- autorización cross-site;
- autorización cross-area;
- actor real y actor operativo en auditoría completa;
- simulación en auditoría;
- taxonomía final de errores;
- helpers server compartidos;
- revisión de acciones administrativas sin turno;
- implementación física de un esquema universal de versionado;
- implementación física de locks;
- RLS;
- grants;
- `SECURITY DEFINER`;
- idempotencia completa;
- auditoría completa;
- notificación de publicación;
- versionado físico definitivo de revisiones de turno;
- atomicidad global de todos los procesos.

Estas responsabilidades conservan sus owners canónicos.

#### 79. Evidencia de validación

| Clase     | Estado           | Evidencia                                                                                                                                                                                                                                                                                                                                                  |
| --------- | ---------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| BUILD     | `NOT_EXECUTED`   | no se ejecutó build durante el desarrollo documental                                                                                                                                                                                                                                                                                                       |
| LOCAL     | `NOT_EXECUTED`   | no se ejecutaron comandos contra el checkout del usuario                                                                                                                                                                                                                                                                                                   |
| REMOTA    | `PASS`           | se auditaron en solo lectura la continuidad vigente, el owner de `AUTH-SRV-011`, la topología `PER_IMPLEMENTATION_UNIT`, el contrato canónico de recurso, `state_snapshot` y concurrencia, la matriz canónica de transiciones, el registro 04A AUTH/VISO relevante, el baseline VISO mensual y las migraciones versionadas de publicación y límite mensual |
| OPERATIVA | `NOT_APPLICABLE` | el marcador no cambia operación real                                                                                                                                                                                                                                                                                                                       |
| FÍSICA    | `NOT_APPLICABLE` | no existe instancia física autorizada para esta tarea                                                                                                                                                                                                                                                                                                      |

#### 80. Requisitos de prueba derivados

**Resultado:** NO GENERA REQUISITOS DE PRUEBA.

**Justificación:** la validación server-side del estado actual del recurso, el bloqueo de transiciones imposibles, la separación entre guardar borrador y publicar, y la eliminación exclusiva de borradores del package VISO mensual ya disponen de cobertura canónica vigente. `AUTH-SRV-011` especifica el gate de enforcement que consumirá esa cobertura y no introduce una obligación verificable sin requisito existente.

#### 81. Cobertura de prueba vigente reutilizada

Se reutiliza sin modificar el registro vigente:

- `TREQ-AUTH-004` — los evaluadores deben producir decisiones equivalentes para el mismo contexto y no incorporar excepciones locales;
- `TREQ-AUTH-013` — toda mutación valida en servidor permiso, actor, territorio, contexto, estado actual del recurso y columnas permitidas, bloqueando transiciones imposibles;
- `TREQ-AUTH-014` — una decisión obsoleta no puede conservar autoridad después de cambios del contexto aplicable;
- `TREQ-VISO-035` — una proyección sobre el límite puede guardarse como borrador y no publicarse;
- `TREQ-VISO-037` — guardar borrador y publicar son comandos separados con permisos y resultados distintos;
- `TREQ-VISO-038` — los conflictos se recalculan en servidor inmediatamente antes de guardar o publicar;
- `TREQ-VISO-041` — la eliminación masiva afecta únicamente borradores autorizados y conserva auditoría.

Estas referencias son trazabilidad heredada y no representan requisitos creados o modificados por `AUTH-SRV-011`.

#### 82. Continuidad

**ÚLTIMA TAREA APROBADA**
`AUTH-SRV-010 — Validar dispositivo compartido`

**TAREA ACTUAL APROBADA**
`AUTH-SRV-011 — Validar estado actual de la entidad`

**SIGUIENTE TAREA RESERVADA**
`AUTH-SRV-012 — Evitar operaciones entre sedes no autorizadas`


### ✅ AUTH-SRV-012 — Evitar operaciones entre sedes no autorizadas

**Estado:** APROBADA
**Tarea anterior:** AUTH-SRV-011 — Validar estado actual de la entidad
**Tarea siguiente:** AUTH-SRV-013 — Evitar operaciones entre áreas no autorizadas
**Tipo de tarea:** Contrato global con materialización por unidad (`PER_IMPLEMENTATION_UNIT`) — contrato de autorización multisede para que toda escritura protegida identifique en servidor todos los lados de sede exigidos por el contrato del recurso, distinga mutación cross-site de lectura interna de validación, evalúe cada sede obligatoria contra el alcance efectivo del actor y falle cerrado antes del primer efecto cuando un origen, destino, sede actual, sede propuesta o cualquier otro lado requerido no exista, esté inactivo, no sea resoluble o quede fuera de autoridad
**Bloque:** BLOQUE J — Protección de acciones de servidor
**Repositorio propietario:** `vento-group-sas/vento-shell`
**Archivo propietario:** `docs/plan-canonico/modular/bloques/J_ACCIONES_DE_SERVIDOR/02_VALIDACION_AUTORIZACION_Y_TERRITORIO.md`
**Estado físico resultante:** `ESPECIFICADO_NO_MATERIALIZADO`
**Cambios físicos autorizados:** 0 durante el marcador global; las futuras materializaciones ocurren únicamente mediante `AUTH-SRV-012::<implementation_unit_id>` después de que `DELIV-PKG-025::<package_id>` asigne la unidad y el paquete propietario supere `E5-GATE-008::<package_id>`
**Requisitos de prueba creados o modificados:** 0

---

#### 1. Propósito

Definir el gate obligatorio para toda escritura cuyo recurso, transición o efecto empresarial pueda involucrar más de una sede.

La regla vinculante queda:

```text
resolved resource
+
validated current state
+
required_sides
+
all required site identities
+
per-side authorization
+
no unresolved or unauthorized side
=
CROSS_SITE_WRITE_ELIGIBLE_FOR_NEXT_GATES
```

Una autorización válida en una sede no se extiende automáticamente a otra.

#### 2. Handoff recibido de `AUTH-SRV-011`

La tarea anterior entrega como mínimo:

```text
resolved resource
resource version
current state snapshot
validated business transition
state validation result
concurrency validation result
```

Además se conservan los handoffs acumulados de `AUTH-SRV-005..010`:

```text
effective_actor
authorization_mode
required_permission_key
validated_target_site_id
target_area_id
effective_shift_id
effective_operational_role
device context
```

`AUTH-SRV-012` añade:

```text
cross_site_classification
required_site_sides
resolved_required_sites
per_side_site_authorization
cross_site_authorization_result
validation_only_site_dependencies
```

#### 3. Pregunta contractual propietaria

Esta tarea responde:

```text
¿QUÉ SEDES PARTICIPAN REALMENTE EN EL EFECTO?
```

y:

```text
¿TODOS LOS LADOS DE SEDE QUE EL CONTRATO EXIGE
ESTÁN RESUELTOS, ACTIVOS Y AUTORIZADOS
ANTES DEL PRIMER EFECTO?
```

No responde todavía si todos los lados de área están autorizados.

Esa responsabilidad permanece en `AUTH-SRV-013`.

#### 4. Relación con `AUTH-SRV-006`

`AUTH-SRV-006` resuelve y valida la sede real de una escritura single-site.

`AUTH-SRV-012` se activa cuando el recurso o efecto exige más de una sede o cuando una actualización pretende cambiar la sede propietaria del recurso.

Se mantiene:

```text
single-site validation
≠
cross-site authorization
```

#### 5. Fuente de verdad para operaciones multisede

La clasificación multisede procede del contrato canónico de recurso.

Cada capacidad puede declarar:

```text
resource_type
territory_resolver
required_sides
state_predicate
```

El servidor no inventa lados adicionales ni elimina lados exigidos por comodidad de implementación.

#### 6. `required_sides`

`required_sides` expresa qué lados del recurso deben participar en la evaluación de la acción concreta.

Ejemplos canónicos incluyen:

```text
RESOURCE
ORIGIN
DESTINATION
SOURCE
TARGET
PARENT
CHILD
CUSTODIAN
VEHICLE
```

No todos los recursos multisede exigen ambos extremos en todas sus acciones.

#### 7. Recurso multisede no equivale a acción bilateral

Un mismo recurso puede tener varias sedes, pero una acción concreta puede pertenecer únicamente a uno de sus lados.

Ejemplo conceptual:

```text
request
→ ORIGIN required

dispatch
→ ORIGIN required

receive
→ DESTINATION required

transfer ownership
→ ORIGIN + DESTINATION required
```

La lista exacta procede del contrato del permiso y del proceso.

#### 8. Regla de cobertura completa

Cuando el contrato declare:

```text
required_sides = [ORIGIN, DESTINATION]
```

la decisión no puede quedar satisfecha por autorizar únicamente el origen.

Resultado conceptual:

```text
origin = ALLOW
destination = DENY
→ DENY ALL
```

No se ejecuta un efecto parcial.

#### 9. `site_ids` del recurso

El contexto de recurso conserva:

```text
territory.site_ids
```

como conjunto de todas las sedes reales obligatorias del recurso.

Una lista vacía solo significa que la dimensión no aplica cuando el contrato así lo declara.

No significa todas las sedes.

#### 10. Resolución server-side de todos los lados

Cada lado obligatorio debe resolverse desde relaciones canónicas del recurso o del borrador validado.

No puede derivarse exclusivamente de:

```text
body.siteId
formData.site_id
selectedSiteId
primarySiteId
device.site_id
preferredSiteId
route params
UI state
```

Esos valores pueden actuar como intención o selector defensivo, nunca como autoridad final.

#### 11. Identidad de sede

Cada lado territorial usa una identidad de sede estable.

La autorización no se decide por:

```text
site name
label
slug
alias
text shown in UI
```

La identidad debe resolver una sede canónica existente.

#### 12. Actividad de cada sede

Toda sede requerida por el efecto debe existir y encontrarse en estado compatible con la operación.

Si cualquier lado obligatorio está inactivo:

```text
REQUIRED_SITE_INACTIVE
→ DENY / NO EFFECT
```

Un lado activo no compensa otro lado inactivo.

#### 13. Clasificación obligatoria de la operación

Antes del efecto, cada unidad debe clasificar la operación en una de estas semánticas:

```text
SINGLE_SITE
MULTI_SITE_RESOURCE
SITE_TRANSFER
VALIDATION_ONLY_CROSS_SITE_DEPENDENCY
NON_TERRITORIAL
```

No se permite que una operación cambie de clasificación implícitamente durante la escritura.

#### 14. `SINGLE_SITE`

Una operación es `SINGLE_SITE` cuando todos los lados obligatorios del efecto resuelven una única sede y no cambia la propiedad territorial del recurso.

En ese caso consume el resultado de `AUTH-SRV-006` y no exige inventar un gate multisede adicional.

#### 15. `MULTI_SITE_RESOURCE`

Una operación es `MULTI_SITE_RESOURCE` cuando el contrato exige dos o más sedes reales simultáneamente.

Debe resolverse:

```text
all required sides
→ all required site identities
→ authorization for every required side
```

antes del primer efecto.

#### 16. `SITE_TRANSFER`

Una operación es `SITE_TRANSFER` cuando modifica la sede propietaria o territorial de un recurso existente.

Debe mantener separados:

```text
current_site
proposed_site
```

La sede propuesta no sustituye la sede actual durante la autorización.

#### 17. Cambio de sede exige ambos territorios

Cuando una actualización cambia:

```text
current_site = A
proposed_site = B
```

la operación debe autorizar el lado vigente y el propuesto conforme al contrato.

No es suficiente tener autoridad únicamente en `B` para tomar un recurso de `A`.

Tampoco es suficiente tener autoridad únicamente en `A` para colocar el recurso en `B`.

#### 18. Estado y cambio de territorio

El cambio de sede consume la transición ya validada por `AUTH-SRV-011`.

Se mantiene:

```text
valid state transition
≠
valid territorial transition
```

Ambas condiciones son necesarias.

#### 19. Operación que solo muta un lado

Cuando el contrato establece que una acción modifica únicamente un lado de un recurso multisede, la autorización debe aplicar exactamente a los lados declarados para esa acción.

No se exige autoridad sobre lados que el contrato no declare obligatorios.

Tampoco se usa esa reducción para ejecutar efectos sobre lados no autorizados.

#### 20. Permiso exacto por lado

Cada lado se evalúa con la capacidad empresarial exacta definida para la operación.

No se permite sustituirla por:

```text
<app>.access
view permission
role name
screen access
selected site
```

Si acciones distintas de origen y destino utilizan permisos distintos, cada acción conserva su propia clave canónica.

#### 21. Alcance `GLOBAL`

Un grant global de la capacidad exacta puede cubrir varias sedes ordinarias cuando el recurso y la acción estén dentro de su dominio.

Eso no elimina:

- actividad de cada sede;
- resolución del recurso;
- estado;
- dispositivo;
- denegaciones;
- restricciones del entorno;
- contrato de `required_sides`.

`GLOBAL` no significa universal.

#### 22. Alcance `ASSIGNED_SITES`

Cuando la capacidad utiliza sedes asignadas, cada sede obligatoria debe pertenecer a las relaciones activas y utilizables del actor conforme al modelo canónico.

Una sola asignación no cubre por inferencia las demás sedes del recurso.

#### 23. Alcance `SPECIFIC_SITE`

Un alcance de sede específica solo cubre la identidad exacta declarada.

Si la acción exige un segundo lado distinto, ese lado necesita cobertura válida propia bajo el evaluador canónico.

No se promueve el grant a multisede.

#### 24. Alcance por tipo de sede

Cuando el contrato use un tipo de sede, cada lado obligatorio debe resolver primero una sede concreta y luego comprobar su clasificación canónica.

El tipo no sustituye la identidad del origen o destino.

#### 25. Contexto operativo

Un turno operativo activo en una sede no concede automáticamente autoridad para mutar recursos de otra sede.

Cuando una acción operacional sea multisede, la compatibilidad de cada lado debe seguir el contrato de capacidad y recurso.

No se toma prestado el contexto de una sede para completar otra.

#### 26. Roles y cobertura multisede

Un rol administrativo o operativo no convierte por sí solo una operación en multisede autorizada.

La autoridad continúa derivándose de:

```text
exact permission
+
scope
+
resource sides
+
required context
```

El nombre del cargo no agrega lados.

#### 27. Dispositivo compartido

El dispositivo compartido puede reducir territorio.

No puede ampliar una operación multisede.

Si el dispositivo está limitado a una sede y la acción exige otra sede incompatible:

```text
DEVICE_SITE_RESTRICTION
→ DENY
```

salvo que su contrato explícito admita el conjunto requerido sin ampliar la autoridad del actor.

#### 28. Simulación

Una simulación puede evaluar hipotéticamente los lados requeridos.

No puede ejecutar una mutación cross-site real ni convertir un `would_allow` en autoridad efectiva.

La separación real/simulada conserva su contrato propietario.

#### 29. Operaciones masivas multisede

Una operación masiva debe resolver los recursos y lados de sede de cada miembro antes del primer efecto cuando la política sea todo-o-nada.

No se acepta:

```text
filter visible rows in UI
→ assume all rows authorized
```

La atomicidad parcial, si existe, debe estar expresamente definida por el comando.

#### 30. Conjunto con sedes heterogéneas

Si un lote contiene recursos de sedes diferentes:

```text
site A
site B
site C
```

cada miembro y cada lado obligatorio mantiene su decisión territorial.

Un miembro autorizado no legitima los demás.

#### 31. Orden de evaluación

La secuencia mínima de una escritura multisede queda:

```text
resolve effective mutation
→ resolve resource or validated draft
→ validate current state / transition
→ derive required_sides
→ resolve all required sites
→ validate site existence and activity
→ evaluate exact permission and scope for every required side
→ apply device/context restrictions
→ apply remaining area gate
→ execute effect
```

Ningún efecto parcial ocurre antes de completar los lados obligatorios.

#### 32. Fallo de un solo lado

Si cualquier lado obligatorio produce:

```text
DENY
UNRESOLVED
CONFLICT
INACTIVE
TECHNICAL_FAILURE
```

la escritura completa queda no ejecutable cuando el contrato exige todos los lados.

No se degrada a operación single-site.

#### 33. Razones territoriales diferenciadas

Se mantienen conceptualmente distintas:

```text
required_site_missing
required_site_inactive
required_site_scope_mismatch
required_site_unresolved
required_site_conflict
cross_site_side_not_authorized
cross_site_context_mismatch
cross_site_device_restriction
cross_site_state_changed
```

La taxonomía pública final pertenece a `AUTH-SRV-016`.

#### 34. Fallo técnico

Un error al resolver un lado no se interpreta como ausencia de restricción.

Resultado:

```text
CROSS_SITE_RESOLUTION_FAILED
→ NO EFFECT
```

No se intenta completar el lado con una sede seleccionada o primaria.

#### 35. Carreras y frescura

La autorización de todos los lados debe permanecer ligada a la versión del recurso y al estado usados para decidir.

Si la sede actual, la sede propuesta, una asignación o la actividad de una sede cambia antes del efecto:

```text
REAUTHORIZE OR FAIL
```

No se conserva un `ALLOW` stale.

#### 36. Operaciones diferidas

Una acción encolada que afecte varias sedes debe resolver y autorizar nuevamente todos los lados al momento de ejecutar.

La autoridad vigente al encolar no se conserva indefinidamente.

#### 37. Operación offline

Una intención cross-site generada offline no puede usar un snapshot local como autoridad.

Al sincronizar:

```text
offline intent
→ fresh resource
→ fresh required sides
→ fresh per-side authorization
→ effect
```

Si cualquier lado cambió, se aplica conflicto o denegación conforme al contrato.

#### 38. `VALIDATION_ONLY_CROSS_SITE_DEPENDENCY`

No toda lectura interna de otra sede convierte una escritura en mutación multisede.

Existe una clase separada cuando:

```text
write effect
→ only authorized target site

server invariant
→ needs hidden facts from additional sites
```

La lectura adicional sirve exclusivamente para validar el efecto y no concede autoridad sobre esas sedes.

#### 39. Regla de no ampliación por validación interna

Una dependencia de validación cross-site:

- no amplía `write_scope`;
- no amplía `read_scope` visible del actor;
- no devuelve filas ocultas;
- no habilita navegación a otras sedes;
- no convierte un agregado interno en permiso de consulta;
- no permite reutilizar los datos para otro propósito.

Su resultado se limita a la decisión o agregado mínimo necesario para el invariante.

#### 40. Minimización de datos en validación interna

La futura implementación debe consultar únicamente los campos necesarios para calcular la regla transversal.

No se debe transportar al cliente información adicional de sedes ocultas.

Ejemplo:

```text
server computes cross-site monthly total
→ client receives only allowed result/message
→ no hidden site rows are exposed
```

#### 41. Cliente administrativo y `service_role`

Un cliente privilegiado puede ser necesario para calcular una invariante cross-site.

Eso no convierte el `service_role` en permiso del actor.

El uso válido exige:

```text
authorized target operation
+
contractual validation dependency
+
minimal hidden read
+
no visibility expansion
```

La escritura continúa limitada al territorio autorizado del efecto.

#### 42. Agregados visibles y validación interna

Se distinguen:

```text
USER_VISIBLE_MULTI_SITE_AGGREGATE
≠
SERVER_INTERNAL_VALIDATION_AGGREGATE
```

Un agregado visible al usuario sigue el contrato ordinario de lectura del recurso.

Un agregado interno solo puede participar en un invariante protegido y no se presenta como acceso del actor a los miembros ocultos.

#### 43. VISO mensual — regla específica del package

Para `VISO-SCHEDULE-MONTHLY-001`, la regla de esta tarea es:

```text
012
→ total entre sedes sin acceso extra
```

El límite mensual del trabajador se calcula considerando todas sus sedes relevantes.

Eso no concede al administrador acceso visible a la programación de sedes que no administra.

#### 44. VISO mensual — efecto de escritura

Crear, eliminar o publicar programación mensual conserva como territorio de escritura la sede objetivo validada por `AUTH-SRV-006`.

La lectura de turnos de otras sedes para el total mensual es una dependencia de validación.

No añade esas sedes a `write_scope`.

#### 45. VISO mensual — total del trabajador

El cálculo del total mensual debe considerar las filas aplicables del trabajador en todas las sedes necesarias para cumplir la política mensual.

La operación debe usar ese total para:

```text
projected total
warning / limit decision
publication blocking
```

sin exponer el detalle territorial de las filas auxiliares.

#### 46. VISO mensual — baseline observado

El baseline remoto ya consulta `employee_shifts` por `employee_id` y rango mensual sin limitar la consulta a una sola sede para calcular totales.

En publicación también obtiene el conjunto mensual de los trabajadores afectados sin filtro de sede y acumula sus minutos antes de publicar.

Esto demuestra la intención funcional de total organizacional por trabajador.

#### 47. VISO mensual — baseline no equivale a cumplimiento

El hecho de usar `createAdminClient()` para leer todas las sedes no certifica por sí mismo:

- minimización de campos;
- no exposición de filas ocultas;
- separación formal entre read scope y validation dependency;
- auditoría del uso privilegiado;
- coherencia con el permiso atómico de escritura;
- tratamiento uniforme de errores.

Por tanto el baseline se clasifica:

```text
PARTIAL_CROSS_SITE_VALIDATION_CONTROL
```

#### 48. VISO mensual — creación

Al crear un borrador en una sede autorizada:

```text
write side
→ validated target site

monthly total dependency
→ all relevant employee sites
```

La creación no exige permiso de escritura en cada sede que contribuye al total, porque esas filas no son modificadas.

La lectura auxiliar tampoco puede hacerse visible como calendario cross-site del administrador.

#### 49. VISO mensual — publicación

`publishMonthAction` puede consultar filas de todas las sedes de los trabajadores afectados para comprobar el límite mensual.

La actualización de publicación debe permanecer limitada a:

```text
validated target site
+
month
+
still-draft rows
```

La consulta auxiliar no autoriza publicar otras sedes.

#### 50. VISO mensual — actualización de turno entre sedes

Una edición ordinaria conserva el carril single-site cuando:

```text
persisted shift.site_id
=
validated requested site
```

Si el request pretende:

```text
persisted shift.site_id = A
requested site_id = B
```

la operación se clasifica:

```text
SITE_TRANSFER
```

y debe autorizar los lados aplicables antes de cambiar el recurso.

#### 51. VISO API — gap actual de actualización

La API rápida auditada puede construir un payload con el `siteId` recibido y actualizar por `shiftId` mientras el turno siga en borrador.

No relee primero el `site_id` persistido antes de construir la actualización.

Por tanto no demuestra actualmente la separación:

```text
ordinary draft edit
vs
site transfer
```

Ese gap pertenece a la futura unidad física de `AUTH-SRV-012` aplicable a esa superficie.

#### 52. VISO API — eliminación

La eliminación rápida ya relee el turno y vuelve a comprobar permiso sobre:

```text
shift.site_id
```

Como no cambia la sede del recurso, permanece single-site si no existen otros lados obligatorios.

No debe convertirse artificialmente en una operación cross-site.

#### 53. VISO mensual — errores sin fuga territorial

Cuando una validación interna detecte exceso o conflicto por datos de otra sede, el resultado no debe revelar innecesariamente:

- nombre de la otra sede;
- identificadores de turno ajenos;
- responsables de la otra sede;
- notas;
- rol operativo de otro registro;
- cualquier campo no necesario para explicar el bloqueo autorizado.

El contrato final de copy pertenece a los owners de error y experiencia.

#### 54. Relaciones laborales del trabajador objetivo

Que un trabajador objetivo tenga asignaciones en varias sedes no concede al administrador autoridad sobre esas sedes.

Se mantiene:

```text
target employee multi-site membership
≠
actor multi-site authorization
```

La relación del trabajador puede alimentar una validación de integridad o elegibilidad sin ampliar el actor.

#### 55. Transferencia y vínculo del trabajador objetivo

Cuando una operación realmente cambie la sede de un turno u otro recurso laboral, la sede propuesta debe ser compatible con la relación laboral vigente del trabajador objetivo según el contrato correspondiente.

Esa compatibilidad no sustituye la autorización del actor en los lados requeridos.

#### 56. Lecturas auxiliares y respuesta

Toda lectura cross-site usada exclusivamente como validación debe terminar en una salida controlada como:

```text
ALLOW
DENY
CONFLICT
aggregate value required by policy
```

No en una respuesta que materialice las filas auxiliares al consumidor sin permiso de lectura.

#### 57. RPC y funciones privilegiadas

Una RPC o función `SECURITY DEFINER` que calcule una regla multisede debe recibir o reconstruir el contexto suficiente para:

- identificar la operación autorizada;
- identificar el trabajador o recurso objetivo;
- limitar la finalidad del cálculo;
- evitar retorno de filas auxiliares;
- producir un resultado determinista;
- conservar trazabilidad.

Su implementación física pertenece a los owners de base de datos y package correspondientes.

#### 58. Server Actions

Una Server Action con efecto cross-site debe resolver todos los lados antes del primer write.

Una Server Action single-site que use una validación interna cross-site debe mantener explícitamente separados:

```text
write_scope
validation_dependency_scope
```

La página de origen no define ninguno de los dos.

#### 59. API routes

Una route mutante que reciba origen y destino debe tratarlos como intención y resolver el recurso real.

Cuando reciba solo un `siteId` para actualizar un recurso existente, debe releer el recurso antes de decidir si continúa single-site o se convierte en `SITE_TRANSFER`.

#### 60. RLS y base de datos

RLS, grants, constraints y funciones de base de datos deben preservar la misma frontera de lados.

No se considera cumplimiento que una capa de aplicación valide ambos lados si una RPC privilegiada permite luego omitir uno.

La implementación física definitiva conserva sus owners canónicos.

#### 61. Atomicidad

Una operación que deba producir efectos en varios lados no puede confirmar el primer lado y fallar después por autorización del segundo.

La materialización debe asegurar que la autorización completa preceda el primer efecto y que la política de atomicidad del proceso se respete.

#### 62. Idempotencia

Un retry de una operación cross-site no puede repetir solo uno de sus lados ni reusar una autorización territorial vencida.

Debe reconstruir recurso, lados y decisión conforme a la política de idempotencia y concurrencia aplicable.

#### 63. Handoff a `AUTH-SRV-013`

`AUTH-SRV-012` entrega:

```text
cross_site_classification
required_site_sides
resolved_required_sites
per_side_site_authorization
cross_site_authorization_result
validation_only_site_dependencies
```

`AUTH-SRV-013` toma ese resultado y valida cualquier conjunto de áreas requerido dentro de las sedes ya aceptadas.

#### 64. Handoff a auditoría

La decisión debe conservar suficiente lineage para reconstruir:

```text
resource identity
required sides
resolved site per side
site source per side
per-side authorization result
cross-site classification
validation-only dependencies
privileged read usage when applicable
final cross-site decision
```

El contrato detallado de auditoría continúa en `AUTH-SRV-014`.

#### 65. Handoff a errores

Las causas conceptuales de fallo deben poder normalizarse después sin perder la distinción entre:

```text
missing side
inactive side
scope mismatch
unresolved territory
technical failure
state conflict
concurrency conflict
```

La taxonomía final pertenece a `AUTH-SRV-016`.

#### 66. Lineage obligatorio

Cada futura unidad deberá conservar:

```text
surface_identity
→ effective_mutation
→ required_permission_key
→ resolved resource
→ resource version
→ state validation
→ cross_site_classification
→ required_sides
→ resolved site per side
→ site activity per side
→ authorization basis per side
→ authorization result per side
→ validation-only site dependencies
→ privileged read boundary when applicable
→ downstream area gate
→ effect
```

#### 67. Materialización futura

Cada instancia:

```text
AUTH-SRV-012::<implementation_unit_id>
```

deberá registrar como mínimo:

```text
implementation_unit_id
repository
commit_before
surface_identity[]
write_operation[]
resource_type[]
resource_locator[]
required_permission_key[]
cross_site_classification[]
required_sides[]
site_source_by_side[]
resolved_sites[]
site_activity_checks[]
authorization_basis_by_side[]
authorization_result_by_side[]
current_site_source[]
proposed_site_source[]
validation_only_dependencies[]
validation_dependency_data_minimization[]
privileged_client_usage
bulk_policy
offline_or_async_mode
package_id[]
change_set
rollback
validation_commands
evidence
commit_after
```

#### 68. Evidencia mínima de una futura unidad

La materialización deberá demostrar, cuando aplique:

1. single-site permanece single-site;
2. recurso multisede resuelve todos los lados exigidos;
3. lado inexistente → deny;
4. lado inactivo → deny;
5. lado no resoluble → deny;
6. conflicto territorial → deny;
7. permiso en origen sin destino requerido → deny;
8. permiso en destino sin origen requerido → deny;
9. grant global conserva límites de recurso y entorno;
10. assigned-sites exige cobertura de cada sede aplicable;
11. specific-site no se amplía a otra sede;
12. turno de una sede no concede otra;
13. dispositivo restringe y no amplía;
14. cambio A → B relee A y valida B;
15. autoridad solo en B no permite tomar recurso de A;
16. autoridad solo en A no permite mover recurso a B;
17. operación bilateral no produce primer efecto antes del segundo gate;
18. lote multisede valida cada recurso;
19. retry reautoriza todos los lados;
20. offline reautoriza al sincronizar;
21. Server Action directa conserva required_sides;
22. API directa conserva required_sides;
23. RPC privilegiada no omite un lado;
24. en VISO, total mensual incluye todas las sedes relevantes;
25. en VISO, filas auxiliares de otras sedes no se devuelven al administrador;
26. en VISO, el total cross-site no amplía el write scope;
27. en VISO, publicación actualiza solo la sede objetivo autorizada;
28. en VISO, update A → B se clasifica como `SITE_TRANSFER`;
29. en VISO, delete ordinario derivado de `shift.site_id` permanece single-site;
30. lectura privilegiada de validación conserva finalidad y minimización.

#### 69. Rollback

El rollback de una futura unidad deberá restaurar únicamente el mecanismo técnico anterior sin:

- convertir una sede en wildcard;
- eliminar resolución de origen o destino;
- permitir `SITE_TRANSFER` como update ordinario;
- ampliar un scope `SPECIFIC_SITE`;
- usar `employees.site_id` como autoridad multisede;
- convertir vínculo del trabajador objetivo en autoridad del actor;
- exponer filas auxiliares de validación;
- convertir un agregado interno en acceso visible;
- permitir efectos parciales cuando todos los lados son obligatorios;
- retirar filtros territoriales existentes;
- conservar una decisión stale después de cambio de lado.

#### 70. Criterios de aceptación

`AUTH-SRV-012` queda documentalmente satisfecha cuando:

1. toda operación clasifica si es single-site, multisede, transferencia, validación interna o no territorial;
2. `required_sides` gobierna qué lados deben autorizarse;
3. todas las sedes obligatorias se resuelven desde el recurso o borrador validado;
4. cada sede requerida existe y está activa antes del efecto;
5. un lado autorizado no amplía otro;
6. no se exige un lado que el contrato de la acción no declare obligatorio;
7. una mutación bilateral exige cobertura completa antes del primer efecto;
8. cambiar la sede de un recurso autoriza territorio vigente y propuesto;
9. un grant global conserva el dominio exacto de la capacidad;
10. assigned-sites exige cobertura real de cada sede aplicable;
11. specific-site no cruza a otra sede;
12. el contexto operativo no se presta entre sedes;
13. el dispositivo solo restringe;
14. operaciones masivas validan cada recurso y lado;
15. errores de un lado no degradan la operación a single-site;
16. decisiones stale obligan a reautorizar o fallar;
17. colas y offline revalidan al ejecutar;
18. validación interna cross-site permanece separada de autorización visible;
19. lecturas auxiliares no amplían read scope ni write scope del actor;
20. datos auxiliares se minimizan y no se devuelven como filas ocultas;
21. `service_role` no se convierte en permiso humano;
22. VISO calcula el total mensual con todas las sedes relevantes del trabajador;
23. VISO no concede acceso visible adicional por calcular ese total;
24. VISO mantiene las escrituras mensuales limitadas a la sede objetivo autorizada;
25. VISO clasifica un update de turno A → B como transferencia de sede;
26. el gap actual de la API rápida queda identificado;
27. la eliminación rápida que relee `shift.site_id` conserva el carril single-site;
28. se preserva el handoff exacto hacia `AUTH-SRV-013`;
29. no se autorizan cambios físicos desde el marcador global;
30. no se crean ni modifican requisitos de prueba.

#### 71. Límites

Este marcador no certifica todavía:

- autorización cross-area;
- semántica física definitiva de cada `required_side`;
- implementación física del evaluador multisede;
- RLS;
- grants;
- funciones `SECURITY DEFINER`;
- atomicidad física de cada proceso;
- idempotencia física de cada proceso;
- auditoría completa;
- taxonomía final de errores;
- copy final de bloqueos territoriales;
- implementación física de minimización de consultas VISO;
- migración de la API rápida de VISO;
- implementación física de transferencias de sede;
- despliegue;
- comportamiento productivo.

Estas responsabilidades conservan sus owners canónicos.

#### 72. Evidencia de validación

| Clase     | Estado           | Evidencia                                                                                                                                                                                                                                                                                                             |
| --------- | ---------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| BUILD     | `NOT_EXECUTED`   | no se ejecutó build durante el desarrollo documental                                                                                                                                                                                                                                                                  |
| LOCAL     | `NOT_EXECUTED`   | no se ejecutaron comandos contra el checkout del usuario                                                                                                                                                                                                                                                              |
| REMOTA    | `PASS`           | se auditaron en solo lectura la continuidad vigente, la topología `PER_IMPLEMENTATION_UNIT`, el owner de `AUTH-SRV-012`, `AUTH-SRV-006` y `AUTH-SRV-011`, el contrato canónico de recurso y `required_sides`, los scopes territoriales, el registro 04A AUTH/VISO, el delta VISO mensual y el baseline actual de VISO |
| OPERATIVA | `NOT_APPLICABLE` | el marcador no cambia operación real                                                                                                                                                                                                                                                                                  |
| FÍSICA    | `NOT_APPLICABLE` | no existe instancia física autorizada para esta tarea                                                                                                                                                                                                                                                                 |

#### 73. Requisitos de prueba derivados

**Resultado:** NO GENERA REQUISITOS DE PRUEBA.

**Justificación:** la denegación de cruces territoriales, la resolución de todos los lados obligatorios de recursos multisede, el rechazo de mutaciones manipuladas y el cálculo mensual VISO entre todas las sedes sin ampliar la visibilidad del administrador ya disponen de cobertura canónica vigente. `AUTH-SRV-012` especifica el gate de enforcement que consumirá esa cobertura y no introduce una obligación verificable sin requisito existente.

#### 74. Cobertura de prueba vigente reutilizada

Se reutiliza sin modificar el registro vigente:

- `TREQ-AUTH-007` — la administración territorial limita cada fila al alcance autorizado del actor;
- `TREQ-AUTH-009` — todo cruce territorial se deniega en servidor, RPC y RLS cuando queda fuera del territorio efectivo;
- `TREQ-AUTH-013` — cada mutación revalida en servidor permiso, territorio, contexto y estado antes de producir efectos;
- `TREQ-AUTH-170` — la dependencia de asignación de sede deriva del scope, carril y recurso, sin imponer asignación a capacidades que no la requieren;
- `TREQ-AUTH-173` — el evaluador resuelve requisito y asignación antes de clasificar un scope mismatch y no completa grants con territorio inventado;
- `TREQ-AUTH-183` — todo recurso territorial único o multisede resuelve todas las sedes obligatorias, comprueba existencia y actividad y no autoriza parcialmente un extremo;
- `TREQ-VISO-033` — el total mensual considera todas las sedes del trabajador sin ampliar el acceso visible del administrador.

Estas referencias son trazabilidad heredada y no representan requisitos creados o modificados por `AUTH-SRV-012`.

#### 75. Continuidad

**ÚLTIMA TAREA APROBADA**
`AUTH-SRV-011 — Validar estado actual de la entidad`

**TAREA ACTUAL APROBADA**
`AUTH-SRV-012 — Evitar operaciones entre sedes no autorizadas`

**SIGUIENTE TAREA RESERVADA**
`AUTH-SRV-013 — Evitar operaciones entre áreas no autorizadas`


### [ ] AUTH-SRV-013 — Evitar operaciones entre áreas no autorizadas

### Reglas del package

| Tarea | Aplicación                                            |
| ----- | ----------------------------------------------------- |
| 004   | recalcular payload, conflictos y límite               |
| 005   | separar consulta, borrador, eliminación y publicación |
| 006   | vínculo y autoridad de sede                           |
| 007   | área en matriz activa                                 |
| 008   | definir prerrequisito administrativo                  |
| 009   | rol y puntos externos                                 |
| 010   | dispositivo compartido                                |
| 011   | borrador/publicado                                    |
| 012   | total entre sedes sin acceso extra                    |
| 013   | área fuera de alcance                                 |

`requireStaffScheduleAccess` es evidencia, no permiso atómico aprobado.
