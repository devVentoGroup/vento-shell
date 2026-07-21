### ✅ AUTH-CTX-011 — Incluir sesión de check-in activa

**Estado:** APROBADA  
**Bloque:** BLOQUE E — Contexto y decisión de autorización unificados  
**Naturaleza:** Refinamiento documental del nodo `active_checkin_session` dentro de `AccessContext`  
**Implementación física:** No incluida  
**Tarea anterior vigente:** AUTH-CTX-010 — APROBADA  
**Tarea posterior reservada:** AUTH-CTX-012 — Incluir rol operativo efectivo  
**Contrato afectado:** `AccessContext@1.0.0`  
**Nodo afectado:** `active_checkin_session`  
**Cambio contractual:** Aclaración normativa compatible; no cambia la forma publicada  
**Cambios físicos permitidos:** No

Esta tarea define cómo `AccessContext` resuelve una sesión de check-in
confirmada, vigente y compatible con el turno activo del actor efectivo.

La tarea separa expresamente:

- solicitud de check-in;
- evento recibido;
- evento confirmado;
- check-in válido;
- sesión abierta;
- sesión activa para autorización;
- sesión cerrada;
- sesión expirada;
- sesión inválida;
- punto físico de marcación;
- sede operativa;
- presencia;
- permiso;
- autorización final.

No modifica la estructura raíz de `AccessContext`, no agrega campos, no cambia
`contract_version`, no cambia `schema_version`, no implementa SQL, RPC, RLS,
migraciones, triggers, jobs, colas offline, aplicaciones ni cambios físicos
en Supabase.

---

#### 1. Objetivo

Definir el nodo `active_checkin_session` de manera que Vento OS pueda
responder inequívocamente:

1. si existe una sesión de check-in confirmada por servidor;
2. si pertenece al actor efectivo;
3. si corresponde exactamente al `active_shift`;
4. si continúa abierta en `resolved_at`;
5. si expiró;
6. si fue cerrada mediante check-out;
7. si fue reemplazada o corregida;
8. si su sede operativa coincide con el turno;
9. si su área es compatible;
10. cómo se distingue la sede laboral del punto físico de marcación;
11. cómo se tratan solicitudes offline todavía no confirmadas;
12. cómo se resuelven duplicados y reintentos;
13. qué ocurre ante varias sesiones abiertas;
14. qué ocurre cuando hay check-in sin turno vigente;
15. qué ocurre cuando el turno termina sin check-out;
16. cómo afecta a permisos `N`, `T` y `T+C`;
17. cómo mantener independiente el carril base;
18. cómo preservar determinismo, trazabilidad y fail closed.

---

#### 2. Base normativa

AUTH-CTX-011 conserva sin cambios las decisiones aprobadas en:

- ADR-AUTH-001;
- AUTH-MOD-001 — Identidad laboral y actor efectivo;
- AUTH-MOD-002 — Separación entre rol base y rol operativo;
- AUTH-MOD-007 — Sede asignada y sede activa;
- AUTH-MOD-008 — Área asignada y área activa;
- AUTH-MOD-009 — Turno publicado;
- AUTH-MOD-010 — Check-in activo;
- AUTH-MOD-011 — Sesión en dispositivo compartido;
- AUTH-MOD-018 — Precedencia entre carriles;
- AUTH-MOD-019 — Denegación explícita;
- AUTH-CAT-012 — Prerrequisitos de turno y check-in;
- AUTH-CAT-013 — Prerrequisitos de área activa;
- AUTH-CAT-014 — Compatibilidad con dispositivo compartido;
- AUTH-CTX-001 — Diseñar `AccessContext`;
- AUTH-CTX-004 — Versionar contratos;
- AUTH-CTX-005 a AUTH-CTX-010 — Principal, actor, identidad, empleado, rol
  base, cobertura administrativa y turno vigente.

Principios heredados obligatorios:

```text
SOLICITUD DE CHECK-IN
≠
CHECK-IN CONFIRMADO
```

```text
CHECK-IN CONFIRMADO
≠
CHECK-IN ACTIVO
```

```text
CHECK-IN ACTIVO
≠
PERMISO
```

```text
CHECK-IN
≠
TURNO
```

```text
PUNTO FÍSICO DE MARCACIÓN
≠
SEDE OPERATIVA
```

```text
CIERRE DEL CHECK-IN
≠
CIERRE DEL CARRIL BASE
```

---

#### 3. Separación conceptual obligatoria

| Concepto                 | Significado                                                     |              Efecto de autorización |
| ------------------------ | --------------------------------------------------------------- | ----------------------------------: |
| Solicitud de check-in    | Intención generada por cliente, terminal o cola offline         |                             Ninguno |
| Evento recibido          | Solicitud llegada al servidor, todavía dentro de la transacción |                             Ninguno |
| Evento confirmado        | Evento persistido después de validar y confirmar la transacción |               Evidencia, no permiso |
| Check-in válido          | Evento confirmado compatible con actor, turno y territorio      |               Evidencia, no permiso |
| Sesión abierta           | Check-in válido sin evento terminal aplicable                   |                 Puede ser candidata |
| Sesión activa            | Sesión abierta, vigente y compatible con `active_shift`         | Satisface prerrequisito de check-in |
| Sesión cerrada           | Existe check-out terminal confirmado                            |          No satisface prerrequisito |
| Sesión expirada          | Superó su vencimiento efectivo                                  |          No satisface prerrequisito |
| Sesión inválida          | Presenta contradicción estructural o de identidad               |          Bloqueo según AUTH-CTX-015 |
| Punto de marcación       | Lugar físico o geocerca desde donde se registró                 |      No cambia territorio operativo |
| `active_checkin_session` | Snapshot contractual de la sesión activa                        |     No concede permisos por sí solo |

---

#### 4. Forma contractual conservada

AUTH-CTX-011 conserva exactamente la forma conceptual publicada:

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

No se agregan propiedades.

La publicación permanece:

```text
AccessContext
contract_version = 1.0.0
schema_version   = 1.0.0
```

---

#### 5. Semántica raíz del nodo

En el `AccessContext` real de autorización:

```text
active_checkin_session != null
→ status = ACTIVE
→ checked_out_at = null
→ active_shift != null
→ employee_id coincide con el actor efectivo
→ shift_id coincide con active_shift.shift_id
```

Las normalizaciones:

```text
EXPIRED
CLOSED
INVALID
```

se conservan como estados contractuales reconocidos, pero no satisfacen el
prerrequisito de check-in activo.

El productor canónico deberá:

- emitir el nodo únicamente cuando la sesión sea `ACTIVE`;
- representar una sesión cerrada o expirada como ausencia de sesión activa;
- registrar la causa correspondiente en evidencia o razones estructuradas
  cuando aplique;
- no devolver una sesión no activa como si habilitara permisos.

Cuando no existe sesión activa:

```text
active_checkin_session = null
```

---

#### 6. Resolución exclusiva en servidor

La sesión deberá resolverse en servidor utilizando:

- actor efectivo;
- empleado resuelto;
- `active_shift`;
- eventos confirmados;
- estado autoritativo de la sesión;
- `resolved_at`.

No podrá aceptarse como fuente autoritativa:

- `checkedIn: true` enviado por el cliente;
- estado local de ANIMA;
- cola offline aún no confirmada;
- último evento mostrado en pantalla;
- `checkin_session_id` enviado sin validación;
- check-in almacenado en local storage;
- cookie no firmada;
- sesión del dispositivo;
- sede seleccionada;
- GPS del cliente sin validación;
- último check-in histórico;
- check-in de otro empleado;
- check-in de otro turno;
- check-in simulado;
- ausencia aparente de check-out obtenida sin emparejamiento canónico.

---

#### 7. Actor laboral requerido

`active_checkin_session` solo podrá existir cuando:

1. `actor_effective.actor_type = EMPLOYEE`;
2. `employee` existe;
3. el empleado está activo;
4. `active_shift` existe;
5. la sesión pertenece al mismo empleado;
6. no existe ambigüedad de identidad.

Para actores:

- `CUSTOMER`;
- `SYSTEM` autónomo;
- `DEVICE` sin sesión humana;
- `UNRESOLVED`;

el resultado será:

```text
active_checkin_session = null
```

En dispositivos compartidos, el check-in pertenece al empleado actor, no a la
identidad técnica del dispositivo.

---

#### 8. Fuente conceptual

La fuente normativa será un agregado canónico equivalente a:

```text
empleado efectivo
→ active_shift
→ evento de check-in confirmado
→ sesión laboral canónica
→ ausencia de evento terminal
→ vigencia en resolved_at
```

La implementación física futura se diseñará en AUTH-CTX-025.

La adaptación desde:

- `attendance_logs`;
- pares `check_in` / `check_out`;
- eventos sin `shift_id`;
- lógica de último check-in abierto;
- consumidores de `get_operational_context`;

queda asignada a AUTH-CTX-028.

---

#### 9. Solicitud de check-in

Una solicitud puede originarse en:

- ANIMA;
- dispositivo compartido;
- terminal autorizada;
- corrección administrativa;
- reintento idempotente;
- cola offline.

Una solicitud todavía no cambia el contexto.

Regla:

```text
solicitud creada en cliente
→ active_checkin_session no cambia
```

La interfaz podrá mostrar estado pendiente, pero no podrá habilitar acciones
`T+C` hasta recibir confirmación autoritativa.

---

#### 10. Evento confirmado

Un evento de check-in está confirmado cuando:

1. fue recibido por el servidor;
2. pasó validaciones de identidad;
3. pasó validaciones de turno;
4. pasó validaciones territoriales y de política;
5. fue persistido;
6. la transacción fue confirmada;
7. recibió identificador definitivo;
8. quedó vinculado inequívocamente con una sesión;
9. su respuesta no depende de una operación todavía pendiente.

Un evento rechazado, revertido o pendiente no participa en
`active_checkin_session`.

---

#### 11. Identificador de sesión

`checkin_session_id` identifica la sesión laboral canónica, no únicamente el
evento de entrada.

Debe permitir relacionar inequívocamente:

- evento de check-in;
- evento de check-out;
- expiración;
- cierre automático;
- corrección;
- reemplazo;
- auditoría;
- actor;
- turno.

Queda prohibido utilizar como identificador de sesión:

- `employee_id`;
- `shift_id` aislado;
- timestamp aislado;
- último evento del empleado;
- combinación no protegida contra duplicados;
- identificador generado solo en cliente sin confirmación.

AUTH-CTX-025 deberá exigir un identificador estable en el contrato SQL futuro.

AUTH-CTX-028 deberá definir cómo adaptar eventos legacy que todavía no poseen
sesión explícita.

---

#### 12. Coincidencia con el actor efectivo

La sesión deberá cumplir:

```text
active_checkin_session.employee_id
=
active_shift.employee_id
=
employee.employee_id
=
actor_effective.actor_id
```

Un check-in de otro empleado:

- no se adopta;
- no se corrige por dispositivo;
- no se reasigna al usuario autenticado;
- no se usa como fallback;
- produce problema estructural si fue presentado como candidato vigente.

---

#### 13. Coincidencia obligatoria con el turno

La sesión activa deberá cumplir:

```text
active_checkin_session.shift_id
=
active_shift.shift_id
```

Queda prohibido:

- aceptar check-in sin turno para permisos `T+C`;
- asociar el check-in al turno más cercano;
- usar el último turno del empleado;
- usar un turno futuro;
- usar un turno ya terminado;
- usar un turno cancelado;
- elegir entre turnos solapados mediante el check-in;
- cambiar `active_shift` para hacerlo coincidir con la marcación.

El orden obligatorio es:

```text
1. resolver active_shift
2. resolver sesión candidata
3. validar coincidencia exacta
```

---

#### 14. Check-in sin turno vigente

Cuando existe un evento abierto o residual pero:

```text
active_shift = null
```

el resultado será:

```text
active_checkin_session = null
```

El evento no crea turno, rol operativo, sede operativa ni permiso.

AUTH-CTX-015 deberá clasificar el problema cuando el evento pretenda
representar una sesión vigente.

Casos históricos sin turno podrán conservarse para asistencia, pero no para
autorización.

---

#### 15. `site_id` de la sesión

Dentro de `ActiveCheckinContext`:

```text
site_id
=
sede operativa confirmada para la sesión
```

Deberá coincidir con:

```text
active_shift.site_id
```

No representa necesariamente el punto físico donde se marcó.

Por tanto:

```text
operational_site_id
≠ geofence_site_id
```

puede ser válido.

Ejemplo:

```text
turno laboral = CENTRO_PRODUCCION
punto físico de marcación = PICKUP_CAMIONETA
```

El nodo conservará:

```text
site_id = CENTRO_PRODUCCION
```

El punto físico y la evidencia de geocerca se mantienen fuera del contrato
mínimo.

---

#### 16. Punto físico de marcación

El punto de marcación puede ser:

- la propia sede;
- una entrada;
- una geocerca;
- un patio;
- una ubicación logística;
- un punto externo autorizado;
- un dispositivo fijo autorizado.

Ese punto:

- no cambia la sede del turno;
- no crea asignación laboral;
- no crea cobertura administrativa;
- no se convierte en `site_id` operativo;
- no concede permisos;
- debe validarse contra política autoritativa.

La política física de marcación pertenece al dominio de asistencia y será
auditada en E1, diseñada funcionalmente en E2 y materializada mediante los
paquetes de implementación correspondientes de E5 y BLOQUE R.

La semántica de autorización queda cerrada aquí: el punto solo aporta
evidencia.

---

#### 17. `area_id` de la sesión

`area_id` puede ser `null`.

Cuando exista:

1. deberá pertenecer a `site_id`;
2. deberá coincidir con `active_shift.area_id`;
3. no podrá introducir un área ausente en el turno;
4. no podrá proceder únicamente del frontend;
5. no podrá corregir un turno incompleto;
6. no podrá cambiar el área operativa.

Regla:

```text
check-in confirma área del turno
→ puede coincidir

check-in inventa área
→ inválido
```

AUTH-CTX-013 cerrará la resolución de `operational_area`.

---

#### 18. `checked_in_at`

`checked_in_at` deberá ser:

- timestamp absoluto;
- confirmado por servidor;
- serializable en ISO 8601;
- atribuible al evento confirmado;
- coherente con la política temporal aplicable;
- anterior a cualquier cierre válido.

No se aceptará como hora autoritativa:

- reloj del dispositivo sin normalización;
- timestamp editable por el cliente;
- hora local sin zona;
- timestamp futuro injustificado;
- hora reconstruida desde orden físico de filas.

La aceptación operativa de marcaciones tempranas o tardías no modifica la
regla de autorización:

```text
sin active_shift vigente
→ no existe sesión activa para permisos
```

---

#### 19. Inicio anticipado confirmado

Una política de asistencia puede aceptar un check-in antes de
`active_shift.starts_at`.

En ese caso:

- el evento puede quedar confirmado;
- la sesión puede quedar abierta en el dominio de asistencia;
- `active_checkin_session` permanecerá `null` mientras `active_shift` sea
  `null`;
- al iniciar el turno, la misma sesión podrá volverse activa si continúa
  válida y compatible;
- no se habilitan permisos operativos antes del inicio del turno.

No existe prerrequisito operativo satisfecho únicamente por marcar temprano.

---

#### 20. `expires_at`

`expires_at` representa un vencimiento explícito de la sesión cuando exista.

La expiración efectiva será:

```text
mínimo entre:
- expires_at explícito, cuando exista;
- active_shift.ends_at;
- cierre o invalidación autoritativa anterior.
```

Si `expires_at = null`, la sesión nunca podrá sobrevivir al fin del turno.

Por tanto:

```text
resolved_at >= active_shift.ends_at
→ sesión no activa
```

aunque no exista check-out.

---

#### 21. `checked_out_at`

Para una sesión activa:

```text
checked_out_at = null
```

Un check-out confirmado y aplicable produce:

```text
status normalizado = CLOSED
active_checkin_session = null
```

El checkout deberá:

- pertenecer a la misma sesión;
- pertenecer al mismo empleado;
- ser posterior o igual al check-in según reglas temporales;
- estar confirmado;
- no depender de un evento pendiente;
- no cerrar otras sesiones por mera precedencia cronológica.

---

#### 22. Evento terminal

Son eventos terminales conceptuales:

- check-out confirmado;
- auto-checkout confirmado;
- cierre administrativo autoritativo;
- cancelación de sesión;
- reemplazo explícito;
- expiración;
- invalidación estructural.

Un recordatorio, intento fallido o evento pendiente no es terminal.

AUTH-CTX-028 deberá impedir la semántica legacy:

```text
cualquier check-out posterior del empleado
→ cierra todos los check-ins anteriores
```

La relación futura deberá ser por sesión canónica.

---

#### 23. Fin del turno sin check-out

Cuando el turno termina:

```text
resolved_at >= active_shift.ends_at
```

la sesión deja de ser activa aunque no exista check-out.

Resultado:

```text
active_shift = null
active_checkin_session = null
```

La ausencia de check-out podrá producir:

- cierre automático;
- novedad de asistencia;
- reconciliación administrativa;
- auditoría;

pero no prolongará permisos.

---

#### 24. Cancelación del turno con sesión abierta

Cuando el turno se cancela o retira de forma autoritativa:

```text
active_shift = null
active_checkin_session = null
```

La sesión residual no conserva autoridad.

AUTH-CTX-029 deberá invalidar el snapshot.

La creación física del evento terminal o de reconciliación se definirá en los
paquetes de implementación de asistencia posteriores, sin alterar esta regla.

---

#### 25. Estados normalizados

##### 25.1 `ACTIVE`

Requiere simultáneamente:

- evento confirmado;
- actor correcto;
- empleado activo;
- `active_shift` vigente;
- mismo `shift_id`;
- mismo `site_id`;
- área compatible;
- sesión abierta;
- no expirada;
- no reemplazada;
- sin evento terminal;
- candidato único.

Es el único estado que satisface el prerrequisito de check-in.

##### 25.2 `CLOSED`

Existe evento terminal confirmado.

No satisface check-in activo.

##### 25.3 `EXPIRED`

La sesión superó su expiración efectiva sin cierre previo aplicable.

No satisface check-in activo.

##### 25.4 `INVALID`

Existe contradicción de:

- actor;
- empleado;
- turno;
- sede;
- área;
- temporalidad;
- identidad de sesión;
- duplicidad;
- confirmación;
- integridad.

No satisface check-in activo y deberá producir la razón estructural
correspondiente.

---

#### 26. Sesión reemplazada o corregida

Una sesión podrá ser reemplazada únicamente mediante una acción autoritativa
y auditable.

Reglas:

1. la sesión anterior deja de estar activa;
2. la nueva sesión deberá tener identidad propia;
3. no podrán coexistir ambas como activas;
4. una corrección no cambiará silenciosamente el actor;
5. una corrección no cambiará silenciosamente el turno;
6. una corrección no transformará un evento rechazado en confirmado sin
   nueva evidencia;
7. el reemplazo deberá invalidar snapshots anteriores.

La estructura física y flujo administrativo se definirán en E2, E3, E5 y
BLOQUE R.

---

#### 27. Reintentos e idempotencia

Los reintentos de una misma solicitud no podrán crear varias sesiones
activas.

La implementación futura deberá soportar una clave idempotente equivalente a:

```text
client_event_id
+
actor
+
tipo de evento
```

La regla contractual es:

```text
mismo evento lógico confirmado varias veces
→ una sola sesión efectiva
```

AUTH-CTX-025 deberá exigir resolución determinista.

E3 y BLOQUE R definirán la restricción física, índices y transacción.

---

#### 28. Varias sesiones abiertas

Después de validar actor, turno y territorio:

```text
0 sesiones activas candidatas
→ active_checkin_session = null
```

```text
1 sesión activa candidata
→ producir nodo
```

```text
2 o más sesiones activas candidatas
→ active_checkin_session = null
→ inconsistencia estructural
```

Queda prohibido elegir:

- la última;
- la primera;
- la más reciente;
- la que tenga GPS;
- la del dispositivo actual;
- la de la sede seleccionada;
- la que tenga `shift_id`;
- la que parezca más completa.

La duplicidad deberá corregirse en la fuente.

---

#### 29. Sesiones consecutivas

Una sesión cerrada anterior y una sesión activa posterior no generan
ambigüedad cuando:

- tienen identificadores diferentes;
- el cierre anterior es autoritativo;
- los intervalos no se superponen;
- cada evento está vinculado con su sesión.

No se deducirá esta separación únicamente por orden cronológico.

---

#### 30. Ausencia de check-in

La ausencia de sesión activa puede ser normal.

Reglas por prerrequisito:

```text
permiso N
→ no se bloquea por ausencia de check-in
```

```text
permiso T
→ no se bloquea por ausencia de check-in
→ sí requiere active_shift
```

```text
permiso T+C
→ ausencia de active_checkin_session
→ carril operativo no disponible
```

La ausencia no crea un `STRUCTURAL_DENY` por sí sola.

---

#### 31. Check-in incompatible

Un check-in incompatible nunca se tratará como ausencia silenciosa.

Ejemplos:

- otro actor;
- otro turno;
- otra sede operativa;
- área incompatible;
- sesión duplicada;
- evento no confirmado presentado como activo;
- cierre ignorado;
- sesión expirada presentada como activa.

Resultado mínimo:

```text
active_checkin_session = null
```

AUTH-CTX-015 determinará si cada caso:

- bloquea todo el carril operativo;
- bloquea únicamente prerrequisitos `T+C`;
- genera advertencia;
- exige auditoría reforzada.

Hasta esa clasificación, ningún caso incompatible podrá habilitar permisos.

---

#### 32. Relación con el carril base

El check-in:

- no crea rol base;
- no modifica `administrative_coverage`;
- no agrega sedes;
- no agrega áreas;
- no convierte un permiso base en operativo;
- no es requisito para permisos `BASE_ONLY`;
- no revoca permisos base cuando se cierra;
- no amplía el alcance administrativo.

Regla:

```text
check-out
→ invalida capacidades T+C
→ no invalida automáticamente carril base
```

---

#### 33. Relación con permisos `BASE_OR_OPERATIONAL`

Cada carril se evalúa de forma independiente.

Ejemplo:

```text
permiso BASE_OR_OPERATIONAL
carril base válido
carril operativo sin check-in
```

Resultado:

```text
el carril base puede autorizar
```

La ausencia o cierre del check-in no deberá bloquear el carril base.

Una denegación aplicable conserva precedencia.

---

#### 34. Relación con permisos `BASE_AND_OPERATIONAL`

Para `BASE_AND_OPERATIONAL`:

- el componente base deberá ser válido;
- el componente operativo deberá ser válido;
- si el permiso exige `T+C`, deberá existir sesión activa;
- ambos componentes deberán pertenecer al mismo actor;
- el check-in no sustituye ningún componente.

Sin sesión activa requerida:

```text
final_decision = DENY
```

aunque el carril base sea válido.

---

#### 35. Relación con el rol operativo

`active_checkin_session` no crea `operational_role`.

El orden será:

```text
active_shift
→ active_checkin_session
→ operational_role
```

AUTH-CTX-012 resolverá el rol exclusivamente desde el turno.

El check-in podrá confirmar coherencia, pero no:

- completar rol faltante;
- cambiar rol;
- usar `navigation_role`;
- usar perfil predeterminado;
- usar rol base.

---

#### 36. Relación con sede y área operativas

AUTH-CTX-013 resolverá:

```text
operational_site
operational_area
```

Reglas heredadas:

- la sede procede del turno;
- el check-in la confirma;
- el punto físico no la reemplaza;
- el área no se inventa desde la marcación;
- una incompatibilidad produce problema estructural.

---

#### 37. Dispositivo compartido

Un dispositivo compartido:

- puede capturar una solicitud;
- puede autenticar técnicamente el canal;
- puede exigir PIN;
- puede contener una sesión de actor;
- puede restringir capacidades disponibles.

No puede:

- convertirse en empleado;
- prestar un check-in de otro actor;
- mantener el check-in del actor anterior;
- crear sesión activa por estar encendido;
- usar su sede para corregir el turno;
- usar `navigation_role` como función laboral;
- ampliar permisos.

La sesión de actor del dispositivo y la sesión de check-in son objetos
separados.

Cerrar la sesión del dispositivo no necesariamente crea un check-out laboral.

AUTH-CTX-014 definirá su coherencia.

---

#### 38. Cola offline

Una solicitud offline:

```text
pendiente de sincronización
→ no confirmada
→ no activa
```

Al sincronizar:

1. deberá conservar identidad idempotente;
2. deberá validarse contra el turno autoritativo;
3. deberá validarse contra actor, sede y política;
4. podrá ser rechazada por obsolescencia;
5. no reescribirá retrospectivamente autorización ya denegada;
6. no habilitará acciones realizadas antes de confirmarse;
7. deberá registrar la diferencia entre hora declarada y hora confirmada.

La arquitectura física de cola y reconciliación corresponde a E4, E5 y
BLOQUE R.

---

#### 39. Corrección administrativa

Una corrección administrativa puede:

- cerrar una sesión;
- invalidar un evento;
- reemplazar evidencia;
- registrar una novedad;
- corregir asistencia histórica.

No podrá crear retroactivamente autoridad para una acción empresarial ya
ejecutada.

Regla:

```text
corrección posterior
≠ autorización retroactiva
```

La segregación de funciones, permisos exactos y auditoría del flujo serán
definidos en E2, matrices, E5 y BLOQUE R.

---

#### 40. Simulación

La simulación podrá representar hipotéticamente:

- turno;
- check-in;
- sede;
- área;
- rol operativo.

No podrá:

- crear sesión real;
- confirmar evento;
- cambiar `active_checkin_session`;
- habilitar mutaciones;
- reutilizar `WOULD_ALLOW` como autoridad;
- cerrar o expirar sesiones reales.

El contexto simulado permanece separado según AUTH-MOD-012 y
AUTH-CTX-003.

---

#### 41. Snapshot y obsolescencia

`active_checkin_session` forma parte del snapshot inmutable.

El contexto queda potencialmente obsoleto cuando ocurre:

- confirmación de check-in;
- confirmación de check-out;
- expiración;
- auto-checkout;
- cierre administrativo;
- reemplazo;
- invalidación;
- cancelación del turno;
- fin del turno;
- cambio de actor;
- cambio de sesión de dispositivo;
- cambio de sede o área;
- corrección de duplicados;
- revocación del evento confirmado.

AUTH-CTX-029 definirá invalidación, caché y fingerprint.

---

#### 42. Determinismo

Para el mismo:

- actor efectivo;
- `active_shift`;
- conjunto de eventos confirmados;
- sesiones autoritativas;
- políticas;
- `resolved_at`;

la resolución deberá producir exactamente el mismo resultado.

No dependerá de:

- orden físico de filas;
- hora del cliente;
- último evento recuperado sin orden total;
- sesión almacenada en UI;
- dispositivo actual;
- reintento duplicado;
- caché obsoleta;
- ausencia de `ORDER BY` determinista.

---

#### 43. Casos de ejemplo

##### Caso A — Check-in confirmado y activo

```text
actor = E1
active_shift = S1
sesión.employee_id = E1
sesión.shift_id = S1
sesión abierta
sin expiración
sin checkout
```

Resultado:

```text
active_checkin_session != null
status = ACTIVE
checked_out_at = null
```

##### Caso B — Solicitud offline pendiente

```text
evento existe solo en cliente
```

Resultado:

```text
active_checkin_session = null
```

##### Caso C — Check-in confirmado antes del turno

```text
checked_in_at < active_shift.starts_at
resolved_at < active_shift.starts_at
```

Resultado:

```text
active_shift = null
active_checkin_session = null
```

Al iniciar el turno podrá reevaluarse.

##### Caso D — Check-in de otro actor

```text
sesión.employee_id != actor_effective.actor_id
```

Resultado:

```text
active_checkin_session = null
structural_issue = identidad incompatible
```

##### Caso E — Check-in de otro turno

```text
sesión.shift_id != active_shift.shift_id
```

Resultado:

```text
active_checkin_session = null
structural_issue = shift_checkin_mismatch
```

##### Caso F — Check-in en punto externo autorizado

```text
active_shift.site_id = CENTRO_PRODUCCION
operational_site_id = CENTRO_PRODUCCION
geofence_site_id = PICKUP_CAMIONETA
```

Resultado:

```text
active_checkin_session.site_id = CENTRO_PRODUCCION
```

El punto físico no reemplaza la sede.

##### Caso G — Checkout confirmado

```text
checked_out_at != null
```

Resultado:

```text
active_checkin_session = null
estado normalizado = CLOSED
```

##### Caso H — Turno terminó sin checkout

```text
resolved_at >= active_shift.ends_at
```

Resultado:

```text
active_shift = null
active_checkin_session = null
estado normalizado = EXPIRED
```

##### Caso I — Dos sesiones abiertas

```text
candidatos activos = 2
```

Resultado:

```text
active_checkin_session = null
structural_issue = sesiones concurrentes
```

##### Caso J — Permiso `T`

```text
active_shift válido
active_checkin_session = null
```

Resultado:

```text
el prerrequisito de check-in no bloquea
```

##### Caso K — Permiso `T+C`

```text
active_shift válido
active_checkin_session = null
```

Resultado:

```text
carril operativo no disponible
```

##### Caso L — Área capturada distinta

```text
active_shift.area_id = BODEGA
sesión.area_id = REPOSTERIA
```

Resultado:

```text
active_checkin_session = null
structural_issue = área incompatible
```

##### Caso M — Reintento idempotente

```text
mismo client_event_id enviado tres veces
```

Resultado:

```text
una sola sesión efectiva
```

##### Caso N — Check-in residual sin turno

```text
evento abierto legacy
active_shift = null
```

Resultado:

```text
active_checkin_session = null
```

No crea contexto operativo.

---

#### 44. Inconsistencias estructurales detectables

AUTH-CTX-011 identifica las siguientes clases:

1. evento no confirmado presentado como activo;
2. sesión sin identificador;
3. sesión sin empleado;
4. sesión de otro actor;
5. sesión sin turno;
6. sesión de otro turno;
7. sesión con turno inexistente;
8. sesión con turno no vigente;
9. sesión con turno cancelado;
10. sede operativa ausente;
11. sede distinta a la del turno;
12. punto físico usado como sede operativa;
13. área inexistente;
14. área de otra sede;
15. área distinta a la del turno;
16. check-out anterior al check-in;
17. check-out no vinculado con sesión;
18. sesión cerrada presentada como activa;
19. sesión expirada presentada como activa;
20. sesión reemplazada presentada como activa;
21. varias sesiones abiertas;
22. duplicados por reintento;
23. evento pendiente offline presentado como confirmado;
24. timestamp no autoritativo;
25. expiración incoherente;
26. sesión que sobrevive al fin del turno;
27. cualquier checkout posterior usado para cerrar sesiones no relacionadas;
28. actor de dispositivo confundido con empleado;
29. sesión del actor del dispositivo confundida con asistencia;
30. check-in utilizado para seleccionar turno;
31. check-in utilizado para crear rol operativo;
32. check-in utilizado para ampliar carril base;
33. snapshot reutilizado después de cierre o expiración.

AUTH-CTX-015 deberá asignar:

- código definitivo;
- severidad;
- carril afectado;
- exposición;
- mensaje seguro;
- efecto sobre `lane_readiness`.

---

#### 45. Fail closed

Ante ambigüedad o contradicción:

```text
active_checkin_session = null
```

Queda prohibido:

- escoger la sesión más reciente;
- escoger la primera;
- usar último check-in sin check-out;
- emparejar por empleado solamente;
- emparejar por sede solamente;
- aceptar evento pendiente;
- confiar en el estado del frontend;
- extender la sesión después del turno;
- completar `shift_id` con el turno actual;
- completar `site_id` con la sede seleccionada;
- completar `area_id` con el dispositivo;
- tratar GPS válido como sesión válida;
- tratar check-in como permiso;
- tratar ausencia de checkout como vigencia indefinida.

---

#### 46. Minimización de datos

`active_checkin_session` no deberá incluir:

- coordenadas;
- precisión GPS;
- distancia a geocerca;
- fotografía;
- IP;
- user agent;
- información completa del dispositivo;
- PIN;
- punto físico de marcación;
- dirección;
- notas;
- motivo de corrección;
- historial de eventos;
- actor administrativo que corrigió;
- evidencia biométrica.

Estos datos podrán conservarse en auditoría o evidencia física con sus
políticas de acceso y retención.

---

#### 47. Relación con tareas posteriores

##### AUTH-CTX-012

Definirá `operational_role`.

El check-in no creará, completará ni cambiará el rol.

##### AUTH-CTX-013

Definirá sede y área operativas.

La sede del turno será autoritativa y el check-in solo confirmará
coherencia.

##### AUTH-CTX-014

Definirá la relación entre:

- identidad técnica del dispositivo;
- sesión de actor;
- turno;
- sesión de check-in.

##### AUTH-CTX-015

Congelará códigos, severidades, alcance de bloqueo y `lane_readiness`.

##### AUTH-CTX-017

Consumirá `authorization_requirement` y distinguirá `N`, `T` y `T+C`.

##### AUTH-CTX-020

Evaluará el carril operativo utilizando:

- turno;
- check-in;
- rol;
- territorio;
- grants;
- denegaciones.

##### AUTH-CTX-024

Definirá evidencia auditable de la sesión utilizada.

##### AUTH-CTX-025

Diseñará el contrato SQL de `get_access_context`, incluyendo:

- sesión canónica;
- coincidencia exacta;
- estado;
- expiración;
- detección de concurrencia;
- fail closed.

##### AUTH-CTX-027

Impedirá que las aplicaciones repliquen lógica de “último check-in abierto”.

##### AUTH-CTX-028

Diseñará compatibilidad con:

- `attendance_logs`;
- check-ins sin `shift_id`;
- emparejamiento legacy;
- `get_operational_context`;
- `checked_in_now`;
- ausencia de sesiones canónicas;
- check-out global por empleado;
- área de check-in nula;
- colas y consumidores existentes.

##### AUTH-CTX-029

Definirá invalidación por:

- check-in;
- check-out;
- expiración;
- auto-checkout;
- corrección;
- fin o cancelación del turno.

##### AUTH-CTX-030

Definirá pruebas contractuales de:

- ausencia;
- sesión activa;
- sesión cerrada;
- expiración;
- duplicados;
- otro actor;
- otro turno;
- otra sede;
- área incompatible;
- turno nocturno;
- check-in temprano;
- cola offline;
- dispositivo compartido.

##### BLOQUE E1

Deberá verificar la operación real de:

- marcación;
- correcciones;
- colas offline;
- puntos externos;
- auto-checkout;
- excepciones manuales.

##### BLOQUE E2

Diseñará los procesos objetivo de asistencia y corrección.

##### BLOQUE E3

Definirá la fuente física, relaciones, exposición, RLS y retención.

##### BLOQUE E4

Diseñará colas, reintentos, sincronización y eventos operativos.

##### BLOQUE E5

Convertirá el diseño aprobado en paquetes implementables.

##### BLOQUE R

Implementará físicamente sesiones, funciones, migraciones, protecciones y
compatibilidad.

---

#### 48. Fuera del alcance

AUTH-CTX-011 no:

- registra check-in;
- registra check-out;
- diseña la interfaz de ANIMA;
- define geocercas;
- define tolerancias físicas;
- define biometría;
- define fotografías;
- define correcciones laborales;
- crea auto-checkout;
- diseña colas offline;
- crea sesiones físicas;
- modifica `attendance_logs`;
- crea tablas;
- crea triggers;
- crea funciones SQL;
- crea RPC;
- crea RLS;
- crea migraciones;
- modifica Supabase;
- modifica aplicaciones;
- define rol operativo;
- define sede o área operativas;
- decide permisos;
- decide autorización final.

Cada responsabilidad posterior tiene destino explícito en la sección 47.

---

#### 49. Riesgos controlados

##### Riesgo 1 — Último check-in abierto tratado como sesión válida

Control:

```text
sesión canónica + actor + turno + estado + vigencia
```

##### Riesgo 2 — Evento offline concede permisos

Control:

```text
sin confirmación de servidor → sin efecto
```

##### Riesgo 3 — Check-out de otra jornada cierra la sesión

Control:

```text
evento terminal vinculado por checkin_session_id
```

##### Riesgo 4 — Punto físico reemplaza sede operativa

Control:

```text
site_id operativo
≠
geofence_site_id
```

##### Riesgo 5 — Sesión sobrevive al turno

Control:

```text
fin efectivo <= active_shift.ends_at
```

##### Riesgo 6 — Duplicados por reintento

Control:

```text
idempotencia + candidato único
```

##### Riesgo 7 — Check-in crea rol o permiso

Control:

```text
evidencia contextual
≠
grant
```

##### Riesgo 8 — Cierre bloquea administración

Control:

```text
check-out afecta carril operativo
≠
carril base
```

---

#### 50. Criterios de aprobación

AUTH-CTX-011 podrá aprobarse cuando se acepte que:

1. `active_checkin_session` conserva la forma de `AccessContext@1.0.0`;
2. la tarea es una aclaración normativa compatible;
3. la sesión se resuelve exclusivamente en servidor;
4. una solicitud no es un check-in confirmado;
5. una cola offline pendiente no concede autoridad;
6. la transacción debe estar confirmada;
7. la sesión debe tener identificador estable;
8. el actor efectivo debe ser empleado;
9. el empleado debe estar activo;
10. la sesión debe pertenecer al mismo empleado;
11. debe existir `active_shift`;
12. `shift_id` debe coincidir exactamente;
13. el check-in no selecciona el turno;
14. un check-in sin turno no crea contexto;
15. `site_id` representa sede operativa;
16. el punto físico de marcación permanece separado;
17. el punto externo puede ser válido sin cambiar sede;
18. `area_id` puede ser nulo;
19. un área declarada debe coincidir con el turno;
20. el check-in no crea un área;
21. `checked_in_at` es timestamp confirmado;
22. marcar temprano no habilita antes del turno;
23. `expires_at` puede ser nulo;
24. ninguna sesión sobrevive al fin del turno;
25. una sesión activa tiene `checked_out_at = null`;
26. check-out confirmado cierra la sesión;
27. eventos terminales deben pertenecer a la sesión;
28. cualquier checkout posterior no cierra todas las sesiones;
29. el fin del turno revoca la sesión activa;
30. la cancelación del turno revoca la sesión activa;
31. solo `ACTIVE` satisface el prerrequisito;
32. `CLOSED` no lo satisface;
33. `EXPIRED` no lo satisface;
34. `INVALID` no lo satisface;
35. una corrección no crea autoridad retroactiva;
36. reintentos no crean varias sesiones;
37. cero candidatos produce `null`;
38. un candidato válido produce el nodo;
39. varios candidatos producen ambigüedad y `null`;
40. ausencia de check-in puede ser normal;
41. permisos `N` no dependen de check-in;
42. permisos `T` no dependen de check-in;
43. permisos `T+C` exigen sesión activa;
44. un check-in incompatible no se ignora silenciosamente;
45. el check-in no modifica el carril base;
46. `BASE_OR_OPERATIONAL` conserva carriles independientes;
47. `BASE_AND_OPERATIONAL` exige ambos componentes;
48. el check-in no crea rol operativo;
49. el dispositivo no posee check-in laboral propio;
50. la sesión de actor del dispositivo es distinta;
51. la simulación no crea sesión real;
52. el snapshot se invalida al cambiar la sesión;
53. AUTH-CTX-015 congelará códigos y severidades;
54. AUTH-CTX-025 diseñará el productor SQL;
55. AUTH-CTX-028 diseñará compatibilidad legacy;
56. AUTH-CTX-029 definirá invalidación;
57. AUTH-CTX-030 definirá pruebas contractuales;
58. E1, E2, E3, E4, E5 y BLOQUE R tienen responsabilidades explícitas;
59. no se implementa código, migraciones ni cambios en Supabase.

---

#### 51. Estado final de la propuesta

| Tarea        | Estado      | Relación                  |
| ------------ | ----------- | ------------------------- |
| AUTH-CTX-010 | APROBADA    | Tarea anterior            |
| AUTH-CTX-011 | APROBADA    | Tarea actual              |
| AUTH-CTX-012 | NO INICIADA | Tarea siguiente reservada |

La continuidad propuesta queda:

```text
AUTH-CTX-010 — APROBADA
        ↓
AUTH-CTX-011 — APROBADA
        ↓
AUTH-CTX-012 — NO INICIADA
```

No se avanza a AUTH-CTX-012 hasta recibir aprobación explícita de
AUTH-CTX-011.


