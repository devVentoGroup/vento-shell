### ✅ AUTH-CTX-010 — Incluir turno publicado y vigente

**Estado:** APROBADA  
**Bloque:** BLOQUE E — Contexto y decisión de autorización unificados  
**Naturaleza:** Refinamiento documental del nodo `active_shift` dentro de `AccessContext`  
**Implementación física:** No incluida  
**Tarea anterior vigente:** AUTH-CTX-009 — APROBADA  
**Tarea posterior reservada:** AUTH-CTX-011 — Incluir sesión de check-in activa  
**Contrato afectado:** `AccessContext@1.0.0`  
**Nodo afectado:** `active_shift`  
**Cambio contractual:** Aclaración normativa compatible; no cambia la forma publicada  
**Cambios físicos permitidos:** No

Esta tarea define de forma exhaustiva cómo `AccessContext` identifica un turno
publicado y vigente para el empleado que actúa en el contexto, sin confundir:

- existencia de un turno;
- publicación;
- revisión publicada;
- vigencia temporal;
- confirmación del trabajador;
- check-in;
- ejecución;
- resultado del turno;
- rol operativo;
- sede y área operativas;
- permiso;
- autorización final.

No modifica la estructura raíz de `AccessContext`, no agrega campos, no cambia
`contract_version`, no cambia `schema_version`, no implementa SQL, RPC, RLS,
migraciones, triggers, jobs, aplicaciones ni cambios físicos en Supabase.

---

#### 1. Objetivo

Definir el nodo `active_shift` de manera que Vento OS pueda responder
inequívocamente:

1. si existe un turno laboral publicado para el actor efectivo;
2. cuál revisión publicada es autoritativa;
3. si el turno está vigente exactamente en `resolved_at`;
4. cómo se construyen `starts_at` y `ends_at`;
5. cómo se resuelven turnos que cruzan medianoche;
6. qué estados excluyen un turno;
7. qué ocurre con borradores y cambios aún no publicados;
8. qué ocurre cuando existen varios turnos elegibles;
9. qué campos mínimos debe contener el turno;
10. qué validaciones pertenecen a esta tarea;
11. qué validaciones se completarán en AUTH-CTX-011 a AUTH-CTX-013;
12. cuándo `active_shift` debe ser `null`;
13. cuándo la ausencia de turno es normal;
14. cuándo existe una inconsistencia estructural;
15. cómo impedir fallbacks permisivos;
16. cómo mantener independiente el carril base;
17. cómo preservar determinismo, trazabilidad y fail closed.

---

#### 2. Base normativa

AUTH-CTX-010 conserva sin cambios las decisiones aprobadas en:

- ADR-AUTH-001;
- AUTH-MOD-001 — Identidad laboral y actor efectivo;
- AUTH-MOD-002 — Separar rol base de rol operativo;
- AUTH-MOD-007 — Definir sede asignada y sede activa;
- AUTH-MOD-008 — Definir área asignada y área activa;
- AUTH-MOD-009 — Definir turno publicado;
- AUTH-MOD-010 — Definir check-in activo;
- AUTH-MOD-018 — Precedencia entre carriles;
- AUTH-MOD-019 — Denegación explícita;
- AUTH-CAT-012 — Prerrequisitos de turno y check-in;
- AUTH-CAT-013 — Prerrequisitos de área activa;
- AUTH-CTX-001 — Diseñar `AccessContext`;
- AUTH-CTX-004 — Versionar contratos;
- AUTH-CTX-005 a AUTH-CTX-009 — Identidad, actor, empleado, rol base y
  cobertura administrativa.

Principios heredados obligatorios:

```text
TURNO PUBLICADO
≠
TURNO VIGENTE
```

```text
TURNO VIGENTE
≠
CHECK-IN ACTIVO
```

```text
TURNO
≠
PERMISO
```

```text
TURNO
≠
AUTORIZACIÓN FINAL
```

```text
CONFIRMACIÓN DEL TRABAJADOR
≠
PRERREQUISITO DE AUTORIZACIÓN
```

```text
CARRIL BASE
≠
CARRIL OPERATIVO
```

---

#### 3. Separación conceptual obligatoria

| Concepto                     | Pregunta que responde                                           |          Concede autoridad |
| ---------------------------- | --------------------------------------------------------------- | -------------------------: |
| Turno borrador               | ¿Existe una planificación todavía no publicada?                 |                         No |
| Turno publicado              | ¿La asignación fue comunicada oficialmente?                     |                         No |
| Revisión publicada           | ¿Qué versión del turno es autoritativa?                         |                         No |
| Turno vigente                | ¿El instante `resolved_at` cae dentro de su ventana autorizada? |                         No |
| Turno elegible para check-in | ¿Está dentro de la ventana permitida para marcar?               |                         No |
| Check-in activo              | ¿Existe evidencia vigente de presencia?                         |                         No |
| Rol operativo                | ¿Qué función temporal asigna el turno?                          |             No por sí solo |
| Permiso operativo            | ¿Qué capacidad concreta puede evaluar el carril?                | Solo dentro de la decisión |
| Resultado del turno          | ¿Terminó, fue cancelado o fue no-show?                          |                         No |
| `active_shift`               | Snapshot contractual del turno publicado y vigente              |                         No |

---

#### 4. Forma contractual conservada

AUTH-CTX-010 conserva exactamente la forma conceptual publicada:

```ts
type ActiveShiftContext = {
  shift_id: string;
  employee_id: string;
  site_id: string;
  area_id: string | null;
  operational_role_code: string;
  starts_at: string;
  ends_at: string;
  shift_status: string;
  published: boolean;
  currently_valid: boolean;
};
```

No se agregan propiedades.

La publicación permanece:

```text
AccessContext
contract_version = 1.0.0
schema_version   = 1.0.0
```

---

#### 5. Semántica raíz de `active_shift`

`active_shift` representa exactamente un turno que cumple todas las
condiciones contractuales mínimas de esta tarea.

Regla:

```text
active_shift != null
→ published = true
→ currently_valid = true
```

No se admitirá un nodo no nulo con:

```text
published = false
```

o:

```text
currently_valid = false
```

Los dos booleanos se conservan como evidencia contractual explícita de la
resolución, no como estados parciales permisivos.

Cuando no existe un turno elegible:

```text
active_shift = null
```

---

#### 6. Resolución exclusiva en servidor

El turno deberá resolverse en servidor utilizando el actor efectivo y
`resolved_at`.

No podrá aceptarse como fuente autoritativa:

- `shift_id` enviado por el frontend;
- turno seleccionado visualmente;
- turno almacenado en local storage;
- turno recordado en una cookie no firmada;
- turno incluido en query string;
- turno enviado dentro del body de una mutación;
- último turno consultado;
- último turno trabajado;
- turno del dispositivo;
- turno de otro empleado;
- perfil operativo predeterminado;
- rol base;
- `navigation_role`;
- sede seleccionada;
- check-in aislado;
- turno simulado presentado como real.

Una referencia enviada por el cliente podrá utilizarse únicamente como dato
a validar contra la resolución autoritativa; nunca como autoridad.

---

#### 7. Actor laboral requerido

`active_shift` solo podrá resolverse cuando:

1. `actor_effective.actor_type = EMPLOYEE`;
2. `employee` existe;
3. `employee.employee_id` coincide con el actor efectivo;
4. el empleado está activo;
5. la identidad laboral es válida y no ambigua.

Para actores:

- `CUSTOMER`;
- `DEVICE` sin sesión de actor;
- `SYSTEM` autónomo;
- `UNRESOLVED`;

el resultado será:

```text
active_shift = null
```

En un dispositivo compartido, el turno pertenece al empleado de la sesión de
actor, no al usuario técnico del dispositivo.

---

#### 8. Fuente conceptual

La fuente normativa será el agregado canónico equivalente a:

```text
empleado efectivo
→ ocurrencia de turno
→ revisión publicada vigente
→ sede
→ área opcional
→ rol operativo asignado
```

La implementación física futura se diseñará en AUTH-CTX-025.

La compatibilidad con la estructura legacy de `employee_shifts` y
`get_operational_context` se diseñará en AUTH-CTX-028.

---

#### 9. Turno borrador

Un turno borrador es una planificación no publicada.

Puede:

- existir en base de datos;
- aparecer en herramientas administrativas autorizadas;
- contener fecha, horas, sede, área y rol;
- reemplazar potencialmente una revisión anterior cuando se publique.

No puede:

- producir `active_shift`;
- habilitar check-in;
- habilitar permisos operativos;
- reemplazar una revisión publicada;
- afectar el contexto del trabajador antes de publicarse.

Regla:

```text
solo existe borrador
→ active_shift = null
```

La existencia de un borrador futuro no constituye por sí sola una
inconsistencia estructural.

---

#### 10. Turno publicado

Un turno publicado es una asignación laboral comunicada oficialmente mediante
una revisión autoritativa.

La publicación deberá ser verificable mediante una fuente canónica
equivalente a:

- identificador de revisión;
- instante de publicación;
- actor que publicó;
- vínculo inequívoco con la ocurrencia de turno;
- estado vigente de la revisión;
- ausencia de retiro o supersesión efectiva.

`published_at` observado aisladamente no bastará cuando el modelo físico
futuro soporte revisiones explícitas.

Hasta implementar ese modelo, AUTH-CTX-028 deberá definir la adaptación
segura de datos legacy.

---

#### 11. Revisión publicada autoritativa

Para una ocurrencia lógica de turno deberá existir como máximo una revisión
publicada autoritativa en `resolved_at`.

Reglas:

1. un cambio posterior guardado como borrador no modifica el turno publicado;
2. una nueva revisión solo reemplaza la anterior cuando queda publicada;
3. no se mezclarán campos de dos revisiones;
4. la revisión anterior continúa autoritativa hasta la publicación efectiva
   de la nueva;
5. una cancelación o retiro deberá ser un hecho publicado o autoritativo;
6. dos revisiones publicadas simultáneamente sin precedencia inequívoca
   producen ambigüedad estructural;
7. una revisión retirada no podrá producir `active_shift`;
8. una revisión futura todavía no efectiva no reemplaza la vigente.

Queda prohibido construir un turno híbrido como:

```text
horario de revisión A
+
sede de revisión B
+
rol de revisión C
```

---

#### 12. Turno laboral

Solo un turno clasificado como laboral podrá producir `active_shift`.

No lo producen:

- descanso;
- día libre;
- ausencia;
- vacaciones;
- incapacidad;
- permiso laboral;
- bloqueo de agenda;
- evento informativo;
- plantilla de horario;
- turno borrador;
- turno de capacitación no operativo, salvo clasificación expresa futura.

La clasificación exacta deberá proceder de fuente autoritativa.

Un valor desconocido o ambiguo no se tratará como laboral.

---

#### 13. Ventana temporal autoritativa

La vigencia se evaluará contra un único timestamp de servidor:

```text
resolved_at
```

La ventana se modela como intervalo semiabierto:

```text
starts_at <= resolved_at < ends_at
```

Consecuencias:

1. el turno es vigente exactamente desde `starts_at`;
2. deja de ser vigente exactamente en `ends_at`;
3. dos turnos consecutivos pueden tocarse en el límite sin solaparse;
4. no existe doble vigencia en el instante exacto de cambio;
5. no se utilizan segundos o minutos de gracia implícitos;
6. cualquier tolerancia deberá definirse como política explícita y versionada;
7. la ventana para check-in puede ser diferente y corresponde a
   AUTH-CTX-011.

---

#### 14. Construcción de `starts_at` y `ends_at`

`starts_at` y `ends_at` deberán ser timestamps absolutos serializados en
formato ISO 8601.

Su construcción utilizará:

- fecha laboral de inicio;
- hora local de inicio;
- hora local de fin;
- zona horaria autoritativa de la sede o de la organización;
- reglas explícitas para cruce de medianoche.

Para la operación actual de Vento Group, la zona organizacional aplicable es:

```text
America/Bogota
```

Una futura operación multizona deberá introducir una fuente de zona horaria
por sede antes de alterar esta semántica.

No se compararán horas locales aisladas sin construir el intervalo absoluto.

---

#### 15. Turnos que cruzan medianoche

Cuando la hora de fin sea menor o igual que la hora de inicio y la
clasificación permita turno nocturno:

```text
ends_at
=
día calendario siguiente a starts_at
+
hora local de fin
```

Ejemplo:

```text
shift_date = 2026-07-21
start_time = 22:00
end_time   = 06:00
```

produce:

```text
starts_at = 2026-07-21T22:00:00-05:00
ends_at   = 2026-07-22T06:00:00-05:00
```

A las 02:00 del 22 de julio el turno continúa vigente.

Queda prohibido filtrar exclusivamente:

```text
shift_date = fecha de resolved_at
```

porque excluiría turnos iniciados el día anterior.

---

#### 16. Duración inválida

Producen inconsistencia estructural:

- fecha de inicio ausente;
- hora de inicio ausente;
- hora de fin ausente;
- intervalo imposible;
- duración cero no autorizada;
- duración negativa;
- cruce de medianoche no resoluble;
- duración superior al máximo operativo aprobado cuando exista esa política;
- timestamp no serializable;
- zona horaria desconocida.

AUTH-CTX-015 definirá los códigos definitivos.

Ante estas condiciones:

```text
active_shift = null
```

---

#### 17. Estado del turno

`shift_status` conserva el estado normalizado observado del turno.

El estado no reemplaza:

- publicación;
- revisión;
- vigencia temporal;
- check-in;
- resultado calculado;
- autorización.

Para producir `active_shift`, el estado deberá ser compatible con una
jornada todavía operable.

Estados terminales o excluyentes como:

- `cancelled`;
- `no_show`;
- `completed`;
- `withdrawn`;
- `deleted`;
- equivalentes canónicos futuros;

no podrán producir `active_shift`.

La confirmación del trabajador:

```text
confirmed
```

no es obligatoria para autorizar el carril operativo.

Un estado desconocido o contradictorio fallará cerrado.

---

#### 18. Cancelación y retiro

Un turno cancelado o retirado:

```text
active_shift = null
```

aunque:

- su intervalo contenga `resolved_at`;
- exista check-in residual;
- el frontend lo conserve en memoria;
- el dispositivo lo haya cargado previamente;
- el empleado lo haya confirmado;
- exista una sesión anterior.

La cancelación o retiro deberá invalidar el contexto en AUTH-CTX-029.

AUTH-CTX-011 deberá definir el efecto sobre un check-in existente.

---

#### 19. Finalización temporal

Cuando:

```text
resolved_at >= ends_at
```

el turno deja de ser vigente automáticamente.

No requiere:

- cambio manual de `status`;
- check-out;
- job previo;
- actualización del registro;
- confirmación de cierre.

El estado físico puede continuar como `scheduled`, pero el contexto no podrá
tratarlo como turno vigente.

La reconciliación del resultado histórico pertenece a los roadmaps
funcionales de asistencia y no modifica esta regla contractual.

---

#### 20. Turnos futuros

Un turno publicado futuro no produce `active_shift` antes de `starts_at`.

Resultado:

```text
active_shift = null
```

Esto no constituye inconsistencia.

El turno podrá mostrarse en calendarios autorizados, pero no habilitará el
carril operativo.

---

#### 21. Campos obligatorios del candidato

Antes de producir `active_shift`, el candidato deberá contener de forma
resoluble:

- `shift_id`;
- `employee_id`;
- `site_id`;
- `operational_role_code`;
- fecha y hora de inicio;
- fecha y hora de fin;
- estado normalizado;
- evidencia de publicación;
- revisión autoritativa.

`area_id` es opcional en esta tarea.

Su obligatoriedad funcional dependerá del rol y del permiso, y será cerrada
por AUTH-CTX-012, AUTH-CTX-013 y AUTH-CAT-013.

---

#### 22. Pertenencia al actor efectivo

El turno deberá cumplir:

```text
shift.employee_id
=
employee.employee_id
=
actor_effective.actor_id
```

cuando el actor efectivo sea empleado.

Un turno de otro trabajador:

- no se selecciona;
- no se usa como fallback;
- no se devuelve parcialmente;
- produce inconsistencia si fue presentado como candidato autoritativo;
- no puede activarse mediante dispositivo compartido;
- no puede activarse mediante simulación real.

---

#### 23. Sede mínima válida

Para que exista `active_shift`, `site_id` deberá:

- existir;
- identificar una sede organizacional resoluble;
- estar activa;
- ser operable;
- no representar una entidad incompatible como punto técnico oculto,
  plantilla, demo aislada o ubicación no laboral, salvo contrato explícito.

AUTH-CTX-013 definirá el nodo `operational_site` y la relación completa con:

- asignaciones laborales;
- sede del turno;
- sede del check-in;
- sede del dispositivo;
- sede del recurso.

AUTH-CTX-010 no convierte la sede del turno en cobertura administrativa.

---

#### 24. Área opcional y coherencia mínima

`area_id` podrá ser `null`.

Cuando exista, deberá:

- identificar un área real;
- pertenecer exactamente a `site_id`;
- estar activa;
- no ser ambigua.

Un área de otra sede produce inconsistencia estructural y:

```text
active_shift = null
```

La decisión sobre si el rol exige área activa corresponde a:

- AUTH-CAT-013;
- AUTH-CTX-012;
- AUTH-CTX-013;
- AUTH-CTX-020.

---

#### 25. Rol operativo mínimo

`operational_role_code` deberá:

- existir en el catálogo operativo canónico;
- estar activo;
- no ser un rol base usado como fallback;
- no provenir de `navigation_role`;
- no provenir del perfil predeterminado cuando el turno carece de rol;
- estar vinculado a la revisión publicada.

AUTH-CTX-012 definirá el nodo completo `operational_role`.

La habilitación exacta por sede y área deberá ser coherente con el turno antes
de que el carril operativo quede listo.

Un código ausente, legacy, desconocido o ambiguo impide producir
`active_shift`.

---

#### 26. Turnos simultáneos y solapados

Después de aplicar todas las condiciones mínimas, deberá existir como máximo
un candidato vigente.

Casos:

```text
0 candidatos
→ active_shift = null
```

```text
1 candidato
→ producir active_shift
```

```text
2 o más candidatos
→ active_shift = null
→ inconsistencia estructural
```

Queda prohibido seleccionar:

- el primero;
- el último;
- el de inicio más temprano;
- el de inicio más reciente;
- el de la sede seleccionada;
- el que coincide con un check-in;
- el que tiene rol más específico;
- el confirmado;
- el creado más recientemente;

sin una regla canónica explícita aprobada.

La superposición deberá corregirse en la fuente de turnos.

---

#### 27. Turnos consecutivos

Dos turnos son consecutivos y no ambiguos cuando:

```text
turno A.ends_at = turno B.starts_at
```

Debido al intervalo semiabierto:

- A deja de estar vigente en el límite;
- B comienza a estar vigente en el límite;
- existe exactamente un turno elegible.

---

#### 28. Check-in no selecciona turno

AUTH-CTX-010 no utilizará un check-in para elegir entre turnos ambiguos.

Regla:

```text
turno válido
→ contexto base del carril operativo
→ check-in se valida contra ese turno
```

No:

```text
check-in existente
→ elegir cualquier turno compatible
```

AUTH-CTX-011 deberá exigir que la sesión de check-in coincida con el
`active_shift` ya resuelto.

---

#### 29. Perfil operativo predeterminado

`employee_site_operational_profiles.default_operational_role` podrá ayudar a
VISO a crear o proponer turnos.

No podrá:

- crear `active_shift`;
- completar un turno sin rol;
- reemplazar el rol publicado;
- elegir sede;
- elegir área;
- resolver ambigüedad;
- conceder permisos.

---

#### 30. Relación con asignaciones administrativas

`assigned_sites`, `assigned_areas` y `administrative_coverage` permanecen
independientes.

Un turno vigente:

- no agrega sedes administrativas;
- no agrega áreas administrativas;
- no transforma `NONE` en cobertura;
- no reduce cobertura organizacional;
- no modifica el rol base;
- no revoca el carril base al terminar.

La relación entre sede operativa y asignación laboral se cerrará en
AUTH-CTX-013 sin mezclar carriles.

---

#### 31. Relación con el carril base

La ausencia de turno:

```text
active_shift = null
```

no invalida automáticamente:

- `base_role`;
- `administrative_coverage`;
- permisos `BASE_ONLY`;
- carril base de permisos `BASE_OR_OPERATIONAL`;
- capacidades administrativas no operativas.

La presencia de turno tampoco amplía el carril base.

---

#### 32. Relación con AUTH-CAT-012

Para permisos clasificados:

```text
N
```

la ausencia de turno no bloquea por ese prerrequisito.

Para permisos:

```text
T
```

el carril operativo requiere `active_shift != null`.

Para permisos:

```text
T+C
```

requiere además la sesión definida en AUTH-CTX-011.

`active_shift` no determina por sí solo qué clasificación tiene el permiso.

---

#### 33. Relación con `lane_readiness`

AUTH-CTX-010 aporta el hecho de turno al carril operativo.

Reglas conceptuales:

```text
active_shift = null
+
sin inconsistencia
→ turno operativo ausente
```

```text
active_shift = null
+
inconsistencia de turno
→ turno operativo inválido
```

```text
active_shift != null
→ prerrequisito de turno satisfecho
```

La forma completa de `LaneReadiness` y sus razones se consolidará en
AUTH-CTX-015.

---

#### 34. Actores de sistema y delegación

Un proceso `SYSTEM` autónomo no recibe turno laboral.

Resultado:

```text
active_shift = null
```

Cuando un proceso técnico ejecuta una acción delegada atribuida a un empleado,
no deberá inventar un turno.

Solo podrá resolver `active_shift` si:

- el contrato de delegación permite evaluar contexto laboral;
- el actor efectivo continúa siendo el empleado;
- la resolución usa las mismas fuentes canónicas;
- el proceso no suministra manualmente el turno;
- la operación no está diseñada como proceso de sistema independiente.

Los contratos de integración se definirán en BLOQUE X y los paquetes físicos
en BLOQUE R.

---

#### 35. Simulación

La simulación puede evaluar un turno hipotético dentro de su contrato
separado.

No podrá:

- crear un turno real;
- modificar `active_shift` real;
- reutilizar `WOULD_ALLOW` como autoridad;
- persistir una selección hipotética como turno;
- reemplazar la revisión publicada real.

El `AccessContext` real continúa resolviéndose exclusivamente desde datos
autoritativos.

---

#### 36. Dispositivo compartido

Un dispositivo compartido:

- no posee turno laboral propio;
- no presta su sede como turno;
- no presta su rol de navegación;
- no activa el turno por estar encendido;
- no selecciona el turno del último actor;
- no conserva el turno después de cerrar la sesión de actor.

El turno se resuelve para el empleado efectivo de la sesión.

AUTH-CTX-014 definirá la coherencia completa.

---

#### 37. Snapshot y obsolescencia

`active_shift` se evalúa dentro del snapshot inmutable del contexto.

El contexto queda potencialmente obsoleto cuando ocurre:

- publicación de una revisión nueva;
- retiro de la revisión vigente;
- cancelación;
- cambio de empleado;
- cambio de fecha u horario;
- cambio de sede;
- cambio de área;
- cambio de rol operativo;
- desactivación del empleado;
- desactivación de sede, área o rol;
- inicio del turno;
- fin del turno;
- detección o corrección de solapamiento.

AUTH-CTX-029 definirá invalidación, caché y fingerprint.

---

#### 38. Determinismo

Para el mismo:

- actor efectivo;
- conjunto de revisiones publicadas;
- catálogos;
- `resolved_at`;
- configuración temporal;

la resolución deberá producir exactamente el mismo resultado.

No dependerá de:

- orden físico de filas;
- hora del cliente;
- zona horaria del navegador;
- estado de UI;
- caché desactualizada;
- último registro leído;
- orden implícito de una consulta SQL.

---

#### 39. Casos de ejemplo

##### Caso A — Turno laboral publicado y vigente

```text
employee_id = E1
published = true
shift_kind = laboral
starts_at <= resolved_at < ends_at
status = scheduled
candidatos elegibles = 1
```

Resultado:

```text
active_shift != null
published = true
currently_valid = true
```

##### Caso B — Turno futuro publicado

```text
resolved_at < starts_at
```

Resultado:

```text
active_shift = null
```

No existe inconsistencia.

##### Caso C — Turno terminado

```text
resolved_at >= ends_at
status físico = scheduled
```

Resultado:

```text
active_shift = null
```

El estado físico desactualizado no extiende la vigencia.

##### Caso D — Turno borrador dentro de horario

```text
published = false
starts_at <= resolved_at < ends_at
```

Resultado:

```text
active_shift = null
```

##### Caso E — Turno nocturno

```text
inicio = 21 de julio, 22:00
fin    = 22 de julio, 06:00
resolved_at = 22 de julio, 02:00
```

Resultado:

```text
active_shift != null
```

##### Caso F — Dos turnos solapados

```text
candidatos elegibles = 2
```

Resultado:

```text
active_shift = null
structural_issue = turno ambiguo
```

##### Caso G — Descanso publicado

```text
shift_kind = descanso
```

Resultado:

```text
active_shift = null
```

##### Caso H — Turno de otro empleado

```text
shift.employee_id != actor_effective.actor_id
```

Resultado:

```text
active_shift = null
```

Si fue presentado como candidato autoritativo, existe inconsistencia.

##### Caso I — Turno cancelado

```text
status = cancelled
```

Resultado:

```text
active_shift = null
```

##### Caso J — Área de otra sede

```text
shift.site_id = SAUDO
area.site_id = VENTO_CAFE
```

Resultado:

```text
active_shift = null
structural_issue = territorio de turno inconsistente
```

##### Caso K — Turno vigente sin área

```text
area_id = null
```

Resultado:

```text
active_shift puede existir
```

La aptitud del rol o permiso para operar sin área se resolverá posteriormente.

##### Caso L — Turno sin rol operativo

```text
operational_role_code = null
```

Resultado:

```text
active_shift = null
```

No se utiliza el perfil predeterminado ni el rol base.

##### Caso M — Check-in sin turno vigente

```text
check-in residual = activo
active_shift = null
```

Resultado de esta tarea:

```text
active_shift = null
```

AUTH-CTX-011 clasificará la incompatibilidad del check-in.

##### Caso N — Cambio guardado pero no publicado

```text
revisión publicada A
borrador B posterior
```

Resultado:

```text
active_shift se resuelve exclusivamente desde A
```

---

#### 40. Inconsistencias estructurales detectables

AUTH-CTX-010 identifica las siguientes clases:

1. turno sin empleado;
2. turno atribuido a otro actor;
3. turno sin revisión publicada resoluble;
4. varias revisiones publicadas autoritativas;
5. revisión retirada tratada como vigente;
6. turno no laboral tratado como operativo;
7. intervalo temporal inválido;
8. turno nocturno calculado con fecha incorrecta;
9. zona horaria desconocida;
10. sede desconocida o inactiva;
11. área desconocida;
12. área perteneciente a otra sede;
13. rol operativo ausente;
14. rol operativo inexistente o inactivo;
15. rol base utilizado como rol operativo;
16. estado terminal tratado como vigente;
17. cancelación ignorada;
18. dos o más turnos elegibles;
19. selección por orden de filas;
20. fallback al último turno;
21. fallback al perfil operativo;
22. fallback al check-in;
23. turno elegido por el cliente;
24. `active_shift` no nulo con `published = false`;
25. `active_shift` no nulo con `currently_valid = false`;
26. timestamps inconsistentes con la revisión publicada;
27. mezcla de campos entre revisiones;
28. contexto reutilizado después de inicio o fin del turno.

AUTH-CTX-015 deberá asignar:

- código definitivo;
- severidad;
- carril afectado;
- exposición;
- mensaje seguro;
- efecto sobre `lane_readiness`.

---

#### 41. Fail closed

Ante ambigüedad o contradicción:

```text
active_shift = null
```

y deberá registrarse el problema estructural aplicable.

Queda prohibido:

- escoger un candidato arbitrario;
- usar el turno más cercano;
- usar el turno confirmado;
- usar el turno con check-in;
- usar el turno de la sede seleccionada;
- completar campos desde otra revisión;
- completar el rol desde el perfil;
- completar la sede desde el empleado;
- completar el área desde el dispositivo;
- extender la ventana hasta el check-out;
- considerar un turno publicado como vigente fuera de horario;
- considerar un turno vigente como permiso.

---

#### 42. Minimización de datos

`active_shift` no deberá incluir:

- nombre del empleado;
- nombre humano de la sede;
- nombre humano del área;
- notas administrativas;
- comentarios del turno;
- datos de geolocalización;
- información salarial;
- motivo de ausencia;
- información disciplinaria;
- confirmaciones no requeridas;
- auditoría completa de publicación;
- historial de revisiones;
- datos del creador o publicador.

La evidencia ampliada permanecerá en fuentes de auditoría y no en el contrato
mínimo.

---

#### 43. Relación con tareas posteriores

##### AUTH-CTX-011

Definirá `active_checkin_session`.

Deberá validar la sesión contra el `active_shift` resuelto y no utilizar el
check-in para escoger el turno.

##### AUTH-CTX-012

Definirá `operational_role` a partir de
`active_shift.operational_role_code`.

No permitirá fallback al rol base, perfil o dispositivo.

##### AUTH-CTX-013

Definirá `operational_site` y `operational_area` desde el turno validado.

Cerrará la relación con asignaciones, sede, área y roles site-wide.

##### AUTH-CTX-014

Definirá la coherencia entre turno y sesión del actor en dispositivo
compartido.

##### AUTH-CTX-015

Congelará códigos, severidades, carriles afectados y `lane_readiness`.

##### AUTH-CTX-017

Consumirá el prerrequisito contractual de turno del permiso solicitado.

##### AUTH-CTX-020

Evaluará el carril operativo utilizando `active_shift`, check-in, rol,
territorio y grants.

##### AUTH-CTX-024

Definirá la evidencia auditable de resolución del turno.

##### AUTH-CTX-025

Diseñará el contrato SQL de `get_access_context`, incluyendo:

- selección de revisión publicada;
- construcción temporal;
- turnos nocturnos;
- detección de ambigüedad;
- fail closed.

##### AUTH-CTX-027

Exigirá que las aplicaciones consuman `active_shift` centralizado.

##### AUTH-CTX-028

Diseñará la compatibilidad con:

- `employee_shifts`;
- `published_at`;
- estados legacy;
- `get_operational_context`;
- consumidores que filtran `shift_date = hoy`;
- turnos nocturnos;
- ausencia de revisiones explícitas.

##### AUTH-CTX-029

Definirá invalidación por cambios de turno y fronteras temporales.

##### AUTH-CTX-030

Definirá pruebas contractuales, incluyendo turnos futuros, nocturnos,
cancelados, solapados, consecutivos y revisiones en borrador.

---

#### 44. Fuera del alcance

AUTH-CTX-010 no:

- crea turnos;
- publica turnos;
- edita turnos;
- cancela turnos;
- define la interfaz de calendario;
- define notificaciones;
- define confirmación del trabajador;
- define tolerancias de check-in;
- define check-in activo;
- define check-out;
- define descansos;
- define nómina;
- define asistencia histórica;
- define resultado final del turno;
- crea roles operativos;
- asigna roles a sedes;
- define permisos;
- define recursos;
- decide autorización;
- crea tablas;
- crea revisiones físicas;
- crea funciones SQL;
- crea RPC;
- crea RLS;
- crea migraciones;
- modifica Supabase;
- modifica aplicaciones.

Todas las responsabilidades posteriores tienen destino explícito en la
sección 43 o en los roadmaps funcionales de ANIMA y VISO.

---

#### 45. Riesgos controlados

##### Riesgo 1 — Turno publicado tratado como vigente

Control:

```text
starts_at <= resolved_at < ends_at
```

##### Riesgo 2 — Turnos nocturnos perdidos

Control:

```text
intervalo absoluto que puede terminar al día siguiente
```

##### Riesgo 3 — Borrador reemplaza publicación

Control:

```text
solo revisión publicada autoritativa
```

##### Riesgo 4 — Check-in elige turno

Control:

```text
primero active_shift; después validar check-in
```

##### Riesgo 5 — Solapamiento resuelto arbitrariamente

Control:

```text
más de un candidato → fail closed
```

##### Riesgo 6 — Estado `scheduled` extiende turno histórico

Control:

```text
vigencia temporal independiente de status
```

##### Riesgo 7 — Rol faltante completado desde perfil

Control:

```text
sin operational_role_code → active_shift null
```

##### Riesgo 8 — Fin de turno depende de un job

Control:

```text
resolved_at >= ends_at → no vigente
```

---

#### 46. Criterios de aprobación

AUTH-CTX-010 podrá aprobarse cuando se acepte que:

1. `active_shift` conserva la forma de `AccessContext@1.0.0`;
2. la tarea es una aclaración normativa compatible;
3. el turno se resuelve exclusivamente en servidor;
4. el actor efectivo debe ser empleado;
5. el turno debe pertenecer al actor efectivo;
6. el empleado debe estar activo;
7. un turno borrador no produce contexto;
8. un turno publicado no es necesariamente vigente;
9. debe existir una revisión publicada autoritativa;
10. los borradores posteriores no alteran la revisión publicada;
11. no se mezclan campos entre revisiones;
12. solo turnos laborales producen `active_shift`;
13. `resolved_at` es la referencia temporal única;
14. la ventana es `starts_at <= resolved_at < ends_at`;
15. no existen tolerancias implícitas;
16. los timestamps se construyen en servidor;
17. la zona actual es `America/Bogota`;
18. los turnos nocturnos continúan vigentes después de medianoche;
19. no se filtra únicamente `shift_date = hoy`;
20. una duración inválida falla cerrado;
21. estados terminales no producen turno vigente;
22. `confirmed` no es requisito;
23. la cancelación invalida el turno;
24. el fin temporal no depende de actualizar `status`;
25. un turno futuro produce `null` sin inconsistencia;
26. `shift_id`, `employee_id`, `site_id` y rol operativo son obligatorios;
27. `area_id` puede ser nulo;
28. un área declarada debe pertenecer a la sede;
29. el rol operativo debe existir y estar activo;
30. el rol base no reemplaza al rol operativo;
31. el perfil predeterminado no completa el turno;
32. cero candidatos produce `null`;
33. un candidato produce el nodo;
34. varios candidatos producen ambigüedad y `null`;
35. no se selecciona por orden, sede, check-in o confirmación;
36. turnos consecutivos no se solapan;
37. el check-in no selecciona turno;
38. el dispositivo no posee turno laboral;
39. la simulación no modifica el turno real;
40. el turno no modifica cobertura administrativa;
41. la ausencia de turno no invalida el carril base;
42. permisos `T` exigen `active_shift`;
43. permisos `T+C` exigirán además AUTH-CTX-011;
44. `active_shift` no concede permisos;
45. `active_shift` no decide autorización;
46. un nodo no nulo siempre tendrá `published = true`;
47. un nodo no nulo siempre tendrá `currently_valid = true`;
48. AUTH-CTX-015 congelará problemas estructurales;
49. AUTH-CTX-025 diseñará el productor SQL;
50. AUTH-CTX-028 diseñará compatibilidad legacy;
51. AUTH-CTX-029 definirá invalidación temporal;
52. AUTH-CTX-030 definirá pruebas contractuales;
53. no se implementa código, migraciones ni cambios en Supabase.

---

#### 47. Estado final de la propuesta

| Tarea        | Estado      | Relación                  |
| ------------ | ----------- | ------------------------- |
| AUTH-CTX-009 | APROBADA    | Tarea anterior            |
| AUTH-CTX-010 | APROBADA    | Tarea actual              |
| AUTH-CTX-011 | NO INICIADA | Tarea siguiente reservada |

La continuidad propuesta queda:

```text
AUTH-CTX-009 — APROBADA
        ↓
AUTH-CTX-010 — APROBADA
        ↓
AUTH-CTX-011 — NO INICIADA
```

No se avanza a AUTH-CTX-011 hasta recibir aprobación explícita de
AUTH-CTX-010.


