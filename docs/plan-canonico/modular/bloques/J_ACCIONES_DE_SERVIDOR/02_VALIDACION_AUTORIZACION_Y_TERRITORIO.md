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


### [ ] AUTH-SRV-007 — Validar área en cada escritura
### [ ] AUTH-SRV-008 — Validar turno cuando corresponda
### [ ] AUTH-SRV-009 — Validar rol operativo cuando corresponda
### [ ] AUTH-SRV-010 — Validar dispositivo compartido
### [ ] AUTH-SRV-011 — Validar estado actual de la entidad
### [ ] AUTH-SRV-012 — Evitar operaciones entre sedes no autorizadas
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
