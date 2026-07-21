### ✅ AUTH-CTX-019 — Incluir decisión del carril base

| Campo | Valor |
| --- | --- |
| **Estado** | **APROBADA** |
| **Bloque** | BLOQUE E — Contexto y decisión de autorización unificados |
| **Subbloque** | `AUTHORIZATION DECISION` |
| **Naturaleza** | Definición documental de `base_decision` dentro de `AuthorizationDecision` |
| **Implementación física** | No incluida |
| **Tarea anterior vigente** | `AUTH-CTX-018` — APROBADA |
| **Tarea posterior reservada** | `AUTH-CTX-020` — Incluir decisión del carril operativo |
| **Contrato afectado** | `AuthorizationDecision@1.0.0` |
| **Campo principal afectado** | `base_decision` |
| **Tipo principal afectado** | `LaneDecision` |
| **Dataset base** | `vento.authorization.base-role-grants@1.0.0` |
| **Dataset de overrides** | `vento.authorization.individual-overrides@1.0.0` |
| **Catálogo** | `vento.authorization@1.0.0` |
| **Cambio contractual** | Aclaración normativa compatible; no cambia la forma publicada |
| **Cambios físicos permitidos** | No |

Esta tarea define cómo Vento OS evalúa el carril base de autorización a partir de:

- actor efectivo;
- identidad laboral;
- estado del empleado;
- rol base vigente;
- cobertura administrativa;
- aplicación y permiso exactos;
- modalidad contractual;
- recurso y territorio resueltos;
- concesiones base de rol;
- concesiones individuales base;
- denegaciones transversales;
- denegaciones del carril base;
- alcance;
- propiedad;
- estado del recurso;
- dispositivo compartido;
- sensibilidad;
- dependencias;
- política de campos;
- `default deny`.

> **Regla central**
>
> ```text
> CARRIL BASE
> =
> AUTORIDAD ADMINISTRATIVA O FUNCIONAL PERMANENTE
> DEL ACTOR LABORAL
> SOBRE EL PERMISO EXACTO
> Y EL RECURSO EXACTO
> ```

El carril base:

- no depende de turno;
- no depende de check-in;
- no toma prestado el rol operativo;
- no toma prestada la sede operativa;
- no toma prestada el área operativa;
- no obtiene bypass por nombre de rol;
- no autoriza por jerarquía implícita;
- no convierte cobertura en permiso;
- no convierte un permiso en cobertura;
- no convierte un dispositivo en fuente de autoridad.

No implementa SQL, RPC, RLS, funciones, migraciones, guards, middlewares, caché ni cambios físicos en Supabase.

#### 1. Objetivo

Definir base_decision de manera que Vento OS pueda responder inequívocamente:

- cuándo el carril base es aplicable
- cuándo debe ser NOT_APPLICABLE
- cuándo está estructuralmente listo
- cuándo debe denegar por indisponibilidad
- cuándo debe denegar por invalidez
- qué fuentes pueden producir un allow base
- qué fuentes pueden producir un deny base
- cómo se consulta la matriz base
- cómo se consumen overrides individuales
- cómo se compara un grant con el recurso
- cómo se evalúa alcance no territorial
- cómo se evalúa alcance organizacional
- cómo se evalúan sedes asignadas
- cómo se evalúa una sede específica
- cómo se evalúan tipos de sede
- cómo se evalúan áreas asignadas
- cómo se evalúa un área específica
- cómo se evalúan tipos de área
- cómo se evalúa OWN
- cómo se evalúan recursos multiterritoriales
- cómo se evalúan colecciones, agregados y lotes
- cómo se preserva la independencia frente al carril operativo
- cómo se aplican actor-wide denies y lane denies
- cómo se aplica default deny
- cómo se serializa LaneDecision
- cómo se ordenan los identificadores coincidentes
- cómo se evita duplicar evidencia
- cómo se evita que un componente base de BASE_AND_OPERATIONAL autorice por sí solo
- cómo se relaciona con restricciones globales
- cómo se preservan determinismo, inmutabilidad y auditoría.

---

#### 2. Base normativa

AUTH-CTX-019 conserva sin cambios las decisiones aprobadas en:

- `ADR-AUTH-001`;
- `AUTH-MOD-001` — Actor efectivo;
- `AUTH-MOD-002` — Separación entre rol base y rol operativo;
- `AUTH-MOD-003` a `AUTH-MOD-006` — Roles administrativos, funcionales e híbridos;
- `AUTH-MOD-007` y `AUTH-MOD-008` — Sede y área;
- `AUTH-MOD-013` a `AUTH-MOD-017` — Alcances;
- `AUTH-MOD-018` — Combinación de carriles;
- `AUTH-MOD-019` — Denegación explícita;
- `AUTH-CAT-006` — Modalidad;
- `AUTH-CAT-011` — Alcance permitido;
- `AUTH-CAT-016` — Contrato de recurso;
- `AUTH-CAT-017` — Dependencias;
- `AUTH-RBAC-001` a `AUTH-RBAC-008` — Matrices base;
- `AUTH-RBAC-020` — Concesiones individuales base;
- `AUTH-RBAC-022` — Denegaciones individuales y transversales;
- `AUTH-RBAC-024` — Dataset canónico de matriz base;
- `AUTH-RBAC-026` — Dataset canónico de overrides;
- `AUTH-RBAC-028` — Independencia de la administración frente al check-in;
- `AUTH-CTX-001` a `AUTH-CTX-015` — `AccessContext`;
- `AUTH-CTX-016` — Aplicación y permiso solicitado;
- `AUTH-CTX-017` — `authorization_requirement`;
- `AUTH-CTX-018` — Recurso y territorio resueltos.

Principios obligatorios:

```text
ROL BASE
≠
PERMISO

COBERTURA ADMINISTRATIVA
≠
ALLOW

PERMISO BASE
≠
BYPASS

SIN TURNO
≠
SIN ADMINISTRACIÓN

CHECK-IN ACTIVO
≠
GANAR ADMINISTRACIÓN

ROL OPERATIVO
≠
HEREDAR MATRIZ BASE

ALLOW BASE APLICABLE
=
PERMISO EXACTO
∩
ACTOR EXACTO
∩
ROL O EXCEPCIÓN COMPATIBLE
∩
VIGENCIA
∩
ALCANCE
∩
RECURSO
∩
AUSENCIA DE DENY APLICABLE
```

---

#### 3. Forma contractual conservada

```ts
type LaneDecision = {
  lane: "BASE" | "OPERATIONAL";

  outcome:
    | "ALLOW"
    | "DENY"
    | "NOT_APPLICABLE";

  readiness:
    | "READY"
    | "UNAVAILABLE"
    | "INVALID"
    | "NOT_APPLICABLE";

  evaluated: boolean;
  matched_allow_ids: string[];
  matched_deny_ids: string[];
  reason_codes: string[];
};
```

Para esta tarea:

```ts
base_decision: LaneDecision;
```

deberá cumplir siempre:

```text
lane = BASE
```

No se agregan campos.

---

#### 4. Aplicabilidad por modalidad

| `authorization_requirement` | Carril base | Regla |
| --- | --- | --- |
| `BASE_ONLY` | Aplicable | Debe producir `ALLOW` o `DENY` |
| `OPERATIONAL_ONLY` | No aplicable | Produce `NOT_APPLICABLE` |
| `BASE_OR_OPERATIONAL` | Aplicable | Se evalúa de forma independiente |
| `BASE_AND_OPERATIONAL` | Aplicable y obligatorio | Debe aportar el componente base |

```text
OPERATIONAL_ONLY
→ base_decision.outcome = NOT_APPLICABLE
```

No se consulta la matriz base para intentar rescatar un permiso `OPERATIONAL_ONLY`.

---

#### 5. Forma de NOT_APPLICABLE

Cuando la modalidad es `OPERATIONAL_ONLY`:

```ts
base_decision = {
  lane: "BASE",
  outcome: "NOT_APPLICABLE",
  readiness: "NOT_APPLICABLE",
  evaluated: false,
  matched_allow_ids: [],
  matched_deny_ids: [],
  reason_codes: ["BASE_LANE_NOT_REQUIRED"]
};
```

Reglas:

- no significa `DENY`;
- no significa error;
- no significa ausencia de rol;
- no consulta allows base;
- no consulta lane denies base;
- los actor-wide denies y structural denies continúan siendo evaluables a nivel global en `AUTH-CTX-022` y `AUTH-CTX-023`;
- un grant base almacenado para un permiso `OPERATIONAL_ONLY` se clasifica como incompatibilidad contractual, no como allow.

---

#### 6. Cuándo evaluated = true

Para las modalidades:

- `BASE_ONLY`;
- `BASE_OR_OPERATIONAL`;
- `BASE_AND_OPERATIONAL`;

se utilizará:

```text
evaluated = true
```

Esto se conserva aunque el carril termine tempranamente en `DENY` por:

- contexto inválido;
- empleado inactivo;
- rol base inválido;
- cobertura inválida;
- recurso no resoluble;
- deny aplicable;
- falta de allow.

```text
evaluated = false
```

se reserva exclusivamente para `NOT_APPLICABLE`.

---

#### 7. readiness

Para modalidades que admiten base:

```text
base_decision.readiness
=
AccessContext.lane_readiness.base.status
```

El evaluador no podrá:

- convertir `INVALID` en `READY`;
- convertir `UNAVAILABLE` en `READY`;
- ocultar un código estructural;
- recalcular parcialmente el contexto;
- reemplazar el rol base;
- completar cobertura.

Si el contexto quedó obsoleto:

```text
readiness = INVALID
outcome = DENY
```

---

#### 8. Relación entre readiness y outcome

| `readiness` | Resultado máximo posible |
| --- | --- |
| `READY` | `ALLOW` o `DENY` |
| `UNAVAILABLE` | `DENY` |
| `INVALID` | `DENY` |
| `NOT_APPLICABLE` | `NOT_APPLICABLE` |

`READY` no concede autoridad. Solo habilita la consulta y evaluación de fuentes base compatibles.

---

#### 9. Actor laboral obligatorio

El carril base laboral requiere:

- actor efectivo de tipo `EMPLOYEE`;
- identidad laboral resoluble;
- empleado exacto;
- empleado activo;
- coincidencia entre actor y empleado;
- snapshot vigente.

Para actores de tipo:

- `CUSTOMER`;
- `SYSTEM` autónomo;
- `DEVICE` sin actor humano;
- `UNRESOLVED`;

el carril base será `NOT_APPLICABLE` o `DENY` según el contrato del actor y la modalidad.

No se inventará una identidad laboral para evaluar una matriz base.

---

#### 10. Empleado inactivo

Un empleado inactivo conserva atribución histórica, pero no autoridad.

Resultado:

```text
readiness = UNAVAILABLE
outcome = DENY
reason_codes incluye BASE_EMPLOYEE_INACTIVE
```

No se consultan grants como mecanismo de reactivación.

Una concesión individual activa no reactiva al empleado.

---

#### 11. Rol base vigente

Para evaluar el carril base deberá existir:

```text
base_role != null
base_role.role_status = ACTIVE
```

Reglas:

- el rol debe pertenecer al actor;
- debe existir en el catálogo canónico;
- debe estar activo;
- debe ser único;
- no puede proceder del turno;
- no puede proceder del dispositivo;
- no puede proceder de `navigation_role`;
- no puede proceder de una cadena enviada por cliente.

Un grant individual no repara:

- rol ausente;
- rol ambiguo;
- rol inactivo;
- rol legacy no mapeado;
- actor incompatible.

---

#### 12. Roles canónicos base

El dataset canónico base contiene exactamente siete roles:

| Rol base canónico |
| --- |
| `propietario` |
| `gerente_general` |
| `gerente` |
| `supervisor` |
| `auxiliar_administrativa` |
| `contador` |
| `marketing` |

Los oficios base legacy no participan como fuente canónica del carril base.

Su transición deberá resolverse mediante:

- `AUTH-MOD-021`;
- `AUTH-CTX-028`;
- `AUTH-DB-020`;
- `AUTH-DB-030`.

Hasta entonces, un oficio legacy no se utilizará como bypass.

---

#### 13. Sin bypass por rol

Queda prohibido:

- propietario → ALLOW automático
- gerente_general → ALLOW automático
- gerente → todos los permisos de su sede
- supervisor → todos los permisos operativos

Todo actor requiere:

```text
permiso exacto
+
grant exacto
+
alcance compatible
+
recurso compatible
+
ausencia de deny
```

---

#### 14. Fuentes de allow base

Solo pueden producir candidatos de allow base:

```text
BASE_ROLE
INDIVIDUAL_BASE
```

Fuentes normativas:

- `vento.authorization.base-role-grants@1.0.0`;
- `vento.authorization.individual-overrides@1.0.0`.

No producen allows base:

- matriz operativa;
- rol operativo;
- turno;
- check-in;
- sede operativa;
- área operativa;
- dispositivo;
- `navigation_role`;
- rutas;
- menús;
- frontend;
- service role;
- nombre del cargo.

---

#### 15. Dataset base canónico

La matriz base vigente es:

```text
vento.authorization.base-role-grants@1.0.0
```

| Característica | Valor |
| --- | ---: |
| Registros lógicos | 499 |
| Roles base | 7 |
| Concesiones directas | 463 |
| Componentes base | 36 |
| Permisos `OPERATIONAL_ONLY` | 0 |
| Claves legacy | 0 |
| Roles operativos | 0 |

Reglas adicionales:

- orden determinista;
- ausencia de fila = `default deny`;
- el evaluador consume el snapshot exacto y su hash aprobado;
- el evaluador no reconstruye la matriz desde tablas legacy.

---

#### 16. Grants DIRECT

Un grant base directo puede producir ALLOW completo cuando:

- el permiso admite base
- el rol coincide
- la clave coincide exactamente
- el grant está activo
- el scope coincide
- el recurso coincide
- la vigencia coincide
- no existe deny aplicable
- las restricciones globales no fallan.

---

#### 17. Grants BASE_COMPONENT

Un registro `BASE_COMPONENT` pertenece a un permiso `BASE_AND_OPERATIONAL` y representa únicamente el componente base.

```text
BASE_COMPONENT
→ puede producir base_decision = ALLOW
```

Pero:

```text
BASE_COMPONENT
≠ final_decision = ALLOW
```

La decisión final exige además:

```text
operational_decision = ALLOW
```

`AUTH-CTX-023` aplicará la conjunción.

---

#### 18. Overrides individuales base

Un override individual base podrá:

- conceder una capacidad adicional compatible;
- limitarla mediante alcance;
- tener vigencia;
- referenciar el empleado exacto.

No podrá:

- reparar un actor inválido;
- reparar un rol base inválido;
- convertir un permiso `OPERATIONAL_ONLY`;
- ampliar un permiso más allá de su contrato;
- anular una denegación;
- conceder por wildcard;
- conceder por prefijo;
- conceder a un dispositivo.

El seed canónico inicial contiene cero overrides automáticos.

---

#### 19. Clave exacta

Todo candidato deberá cumplir:

```text
grant.permission_key
=
requested.permission_key
```

No se admite:

- prefijo;
- sufijo;
- wildcard;
- módulo;
- aplicación completa;
- coincidencia semántica;
- alias no adaptado;
- permiso legacy;
- ruta;
- nombre humano.

---

#### 20. Modalidad compatible

Un grant base solo es compatible con:

```text
BASE_ONLY
BASE_OR_OPERATIONAL
BASE_AND_OPERATIONAL
```

Un grant base sobre permiso OPERATIONAL_ONLY:

- no se incluye en matched_allow_ids
- no produce allow
- genera incompatibilidad contractual
- se audita
- se corrige en datasets o transición.

---

#### 21. Vigencia

Un grant deberá estar activo en `decided_at`.

La vigencia puede depender de:

- estado activo;
- fecha de inicio;
- fecha de fin;
- revocación;
- versión de dataset;
- estado del rol;
- estado del empleado.

Regla de inicio:

```text
starts_at <= decided_at
```

Cuando exista fin:

```text
decided_at < ends_at
```

Un grant futuro, expirado o revocado no coincide.

---

#### 22. Alcances permitidos

La evaluación base podrá consumir los siguientes códigos:

| Código | Alcance |
| --- | --- |
| `NT` | No territorial |
| `ORG` | Recurso organizacional exacto |
| `G` | Global organizacional ordinario |
| `AS` | Sedes asignadas |
| `SS` | Sede específica |
| `AST` | Tipo de sede dentro de asignaciones |
| `TST` | Todas las sedes de un tipo |
| `AA` | Áreas asignadas |
| `SA` | Área específica |
| `AAT` | Tipo de área dentro de asignaciones |
| `ATW` | Todas las áreas de un tipo |
| `OWN` | Propiedad o atribución |

`CTX` es incompatible con el carril base.

```text
scope_code = CTX
→ incompatibilidad contractual
```

---

#### 23. NT — No territorial

NT coincide únicamente cuando el contrato del permiso y del recurso declara que la capacidad no utiliza una dimensión territorial variable.

Reglas:

- no inventa organización
- no inventa sede
- no inventa área
- no autoriza recursos territoriales
- no convierte listas vacías en global.

---

#### 24. ORG — Recurso organizacional exacto

ORG coincide cuando:

- el recurso pertenece a la organización exacta
- el permiso declara alcance organizacional
- el recurso no requiere una sede o área adicional
- no pertenece a entorno aislado
- la unidad de negocio, canal o dominio requerido coincide.
- ORG no equivale a G.
- No cubre automáticamente todos los recursos territoriales de la organización.

---

#### 25. G — Global organizacional ordinario

`G` permite evaluar recursos ordinarios de la organización cuando el grant lo declara expresamente.

Reglas:

- solo aplica al permiso exacto;
- no concede otros permisos;
- no atraviesa organizaciones;
- no atraviesa tenants futuros;
- no incluye `APP-REVIEW`;
- no incluye demo;
- no incluye sandbox;
- no incluye pruebas;
- no incluye recursos aislados;
- no omite sujeto, propiedad, estado, lados o campos;
- no convierte `propietario` en bypass.

Un rol con `administrative_coverage.mode = NONE` puede utilizar un grant `G` específico cuando el grant exacto lo concede y el recurso es compatible.

La cobertura del actor no se transforma por ello en `ORGANIZATION`.

---

#### 26. AS — Sedes asignadas

AS exige que todos los territorios de sede obligatorios del recurso estén incluidos en las asignaciones utilizables del actor.

Fuente:

AccessContext.assigned_sites

Una sede utilizable exige:

- asignación activa
- sede activa
- assignable = true.

Reglas:

- la sede primaria no es suficiente por sí sola
- la sede seleccionada no participa
- varias sedes no significan global
- un recurso multisitio exige coincidencia en todos los lados obligatorios
- una lista vacía no coincide.

---

#### 27. SS — Sede específica

SS exige coincidencia exacta entre:

- grant.site_id
- y la sede o lado del recurso exigido por el contrato.

Reglas:

- no utiliza la sede seleccionada
- no utiliza la sede del turno
- no utiliza la sede primaria como fallback
- la sede debe existir y estar activa
- la coincidencia con un lado no cubre otro lado obligatorio
- un grant sin site_id es inválido.

---

#### 28. AST — Tipo de sede dentro de asignaciones

AST exige:

- sede del recurso dentro de assigned_sites
- sede activa
- tipo de sede exacto
- tipo declarado en el grant
- ausencia de territorio aislado.

Regla:

```text
AS
∩
site_type exacto
```

No equivale a todas las sedes de ese tipo.

---

#### 29. TST — Todas las sedes de un tipo

TST es transversal y exige una concesión explícita.

Reglas:

- no se infiere desde AST
- no se infiere por tener varias sedes
- no se infiere por rol
- cubre únicamente sedes ordinarias del tipo exacto
- excluye entornos aislados
- conserva límites de organización
- conserva recurso y campos
- una sede de tipo desconocido no coincide.

---

#### 30. AA — Áreas asignadas

`AA` exige que todas las áreas obligatorias del recurso estén incluidas en:

```text
AccessContext.assigned_areas
```

y que:

- la asignación esté activa;
- el área esté activa;
- pertenezca a una sede autorizada;
- el área coincida exactamente.

Una lista vacía no coincide.

`AA` no podrá utilizarse como sustituto del área operativa.

---

#### 31. SA — Área específica

SA exige coincidencia exacta entre:

- grant.area_id
- y el área del recurso.

Además:

- el área debe existir
- debe estar activa
- debe pertenecer a la sede correspondiente
- el grant deberá conservar o derivar la sede necesaria
- no se aceptan áreas de otra sede
- un area_id nulo invalida el grant.

---

#### 32. AAT — Tipo de área dentro de asignaciones

`AAT` exige:

```text
área del recurso
∈
assigned_areas utilizables
```

y:

```text
area_kind del recurso
=
area_kind del grant
```

No cubre todas las áreas del mismo tipo.

---

#### 33. ATW — Todas las áreas de un tipo

`ATW` exige:

- tipo de área exacto;
- límite superior de sedes autorizado;
- organización compatible;
- recurso ordinario;
- concesión transversal explícita.

Nunca existe sin un límite de sede.

`ATW` no atraviesa entornos aislados.

---

#### 34. OWN — Propiedad o atribución

`OWN` coincide cuando:

- el contrato define qué significa propiedad;
- `resource.ownership.coherent = true`;
- la relación con el actor coincide;
- el actor exacto es el permitido;
- el recurso está vigente;
- cualquier límite territorial adicional también coincide.

Regla:

```text
OWN
→ puede reducir el conjunto
→ nunca amplía territorio
```

No se utiliza universalmente la regla:

```text
created_by = actor
```

Cada recurso define su relación canónica.

---

#### 35. Composición de alcance

Un permiso puede requerir más de una condición.

Ejemplo:

```text
OWN
+
AS
```

significa:

```text
recurso propio
Y
recurso dentro de sedes asignadas
```

No significa:

```text
recurso propio
O
recurso dentro de sedes asignadas
```

La semántica `AND` u `OR` deberá proceder del perfil de alcance publicado del permiso.

No se elegirá la combinación más permisiva.

---

#### 36. Cobertura administrativa

administrative_coverage es evidencia contextual, no grant.

Modos:

```text
NONE
ASSIGNED_SITES
SPECIFIC_SITE
ASSIGNED_AREAS
SPECIFIC_AREA
ORGANIZATION
```

Uso:

- AS, AST, AA, AAT consumen asignaciones y cobertura coherente
- SS y SA consumen dimensiones exactas del grant
- G y ORG dependen del grant exacto, no de convertir artificialmente la cobertura
- NONE no bloquea permisos NT, ORG, G u OWN cuando el contrato y grant los permiten
- valid = false bloquea el carril base.

---

#### 37. Recursos sin sede

Un recurso con:

```text
site_ids = []
```

puede ser válido cuando el contrato lo clasifica como:

- no territorial;
- organizacional;
- de dominio;
- propio sin dimensión territorial;
- `NON_RESOURCE`.

No será válido para un grant que exija `AS`, `SS`, `AST` o `TST`.

No se asignará una sede por fallback.

---

#### 38. Recursos sin área

Un recurso con:

```text
area_ids = []
```

puede ser válido a nivel de organización, sede, recurso no territorial o recurso site-wide.

No será válido para un grant que exija `AA`, `SA`, `AAT` o `ATW`.

Una lista vacía no significa todas las áreas.

---

#### 39. Recursos multiterritoriales

Cuando resource.required_sides contiene varios lados, el grant deberá cubrir todos los lados obligatorios según su contrato.

Ejemplo:

```text
remisión
origin = CENTRO_PRODUCCION
destination = VENTO_CAFE
```

Un grant SS para CENTRO_PRODUCCION no cubre automáticamente el destino.

La composición deberá estar declarada por el contrato del permiso y del recurso.

---

#### 40. Colecciones

Para `COLLECTION`:

- cada miembro debe quedar dentro del alcance;
- el conjunto se construye en servidor;
- los IDs se evalúan contra el mismo permiso;
- un miembro no autorizado se excluye en lecturas;
- una colección no puede incluir miembros ocultos y filtrar después;
- el conteo y la paginación conservan el alcance.

La decisión de una colección autorizada no autoriza mutaciones sobre todos sus miembros.

---

#### 41. Agregados

Para AGGREGATE:

- cada dato contribuyente debe estar autorizado
- no se incluyen territorios denegados
- no se revelan datos por inferencia
- el resultado conserva el alcance exacto
- un grant global continúa limitado al permiso de agregado
- un agregado transversal requiere scope explícito.

---

#### 42. Operaciones masivas

Para `BULK`:

```text
permiso ordinario
≠
permiso masivo
```

La evaluación seguirá la política declarada:

| Política | Regla |
| --- | --- |
| `ALL_OR_NOTHING` | Todos los miembros deben producir base allow cuando el carril base sea requerido |
| `PARTIAL_WITH_RESULTS` | Cada miembro obtiene una decisión base independiente |

No se resumirá una operación parcialmente denegada como allow total.

---

#### 43. Estado del recurso

Un grant válido no autoriza estados incompatibles.

El carril base deberá consumir:

```text
resource.state_snapshot
```

y verificar el estado actual, la transición solicitada y las condiciones empresariales del permiso.

Si el contrato no admite el estado:

```text
outcome = DENY
reason_codes incluye BASE_RESOURCE_STATE_MISMATCH
```

---

#### 44. Campos protegidos

El allow del carril base no concede automáticamente todos los campos.

La decisión deberá respetar:

```text
resource.field_classification
requested_fields
field_policy_decision
```

Una lectura parcial puede conservar `base_decision.outcome = ALLOW` sobre la proyección autorizada.

Una mutación con un campo bloqueado produce `DENY` o requiere separación explícita.

---

#### 45. Concurrencia

Para una operación que exige concurrencia deberá cumplirse antes de ejecutar:

```text
resource.concurrency.validated = true
```

El carril base puede demostrar autoridad sobre el recurso, pero una concurrencia fallida impide la ejecución.

`AUTH-CTX-023` consolidará el bloqueo final.

---

#### 46. Dispositivo compartido

El dispositivo no produce allow base.

Una acción desde dispositivo exige además:

- dispositivo válido
- sesión de actor válida
- aplicación permitida
- clave incluida
- territorio compatible
- política de actor satisfecha
- reautenticación cuando aplique.

La relación es:

```text
BASE AUTHORITY
∩
DEVICE LIMIT
```

Nunca unión.

---

#### 47. Turno y check-in

El carril base no consulta:

- active_shift
- active_checkin_session
- operational_role
- operational_site
- operational_area.

Reglas:

- sin turno → base puede continuar
- sin check-in → base puede continuar
- fin del turno → no revoca base
- check-in activo → no amplía base

---

#### 48. Carril operativo separado

El carril base no utilizará:

- `operational-role-grants`;
- grants individuales operativos;
- rol del turno;
- scope `CTX`;
- área del turno;
- permisos operativos legacy.

Un actor híbrido puede obtener decisiones independientes en ambos carriles.

---

#### 49. Actor-wide deny

Un actor-wide deny aplicable a la clave exacta bloquea el carril base aunque existan múltiples allows.

Regla:

```text
ACTOR_WIDE_DENY
>
BASE ALLOW
```

AUTH-CTX-022 definirá y poblará la evidencia.

---

#### 50. Base lane deny

Una denegación del carril base bloquea únicamente el base cuando coincide.

En BASE_OR_OPERATIONAL:

```text
base deny
→ base_decision = DENY
→ operativo puede continuar
```

En BASE_AND_OPERATIONAL:

```text
base deny
→ base_decision = DENY
→ final_decision = DENY
```

Una concesión más específica no vence la denegación aplicable.

---

#### 51. Structural deny

Un problema estructural aplicable puede bloquear solo el carril base o ambos carriles.

Ejemplos:

- rol base ambiguo;
- rol base inactivo;
- cobertura administrativa inválida;
- asignaciones contradictorias;
- snapshot obsoleto;
- recurso no resoluble;
- contrato incompatible.

Un structural deny no es una fila administrable de overrides.

---

#### 52. Default deny

Si el carril es aplicable y no existe deny, pero tampoco existe un allow base completo:

```text
outcome = DENY
reason_codes incluye BASE_NO_MATCHING_ALLOW
```

No se materializa una denegación explícita.

No se inventa un grant.

---

#### 53. Varios allows coincidentes

Pueden coincidir varios allows de rol o individuales.

Reglas:

- uno solo completo es suficiente para base_decision = ALLOW
- los grants no se suman para crear un alcance no declarado
- un grant incompleto no completa otro salvo composición explícita
- se registran todos los allows realmente coincidentes
- los IDs se deduplican
- el orden es determinista
- un deny aplicable prevalece.

---

#### 54. matched_allow_ids

Solo incluye grants base que:

- pertenecen al actor o rol exacto;
- usan la clave exacta;
- son compatibles con la modalidad;
- están vigentes;
- coinciden territorialmente;
- coinciden con el recurso;
- cumplen estado y condiciones;
- pueden contribuir al carril.

No incluye candidatos descartados, grants operativos, grants inactivos, fuera de alcance, legacy o incompatibles.

`AUTH-CTX-021` definirá el objeto completo `MatchedGrant`.

---

#### 55. matched_deny_ids

Incluye únicamente IDs de denegaciones administrables que bloquean el carril base:

- actor-wide deny;
- base lane deny.

No incluye:

- structural issues sin `deny_id`;
- default deny;
- falta de allow;
- códigos de razón sin registro administrable.

`AUTH-CTX-022` definirá el objeto completo `MatchedDeny`.

---

#### 56. reason_codes

Códigos iniciales reservados para base_decision:

```text
BASE_LANE_NOT_REQUIRED
BASE_CONTEXT_NOT_APPLICABLE
BASE_CONTEXT_UNAVAILABLE
BASE_CONTEXT_INVALID
BASE_EMPLOYEE_INACTIVE
BASE_ROLE_NOT_AVAILABLE
BASE_ROLE_INVALID
BASE_ADMINISTRATIVE_COVERAGE_INVALID
BASE_RESOURCE_UNRESOLVED
BASE_RESOURCE_CONFLICT
BASE_RESOURCE_ISOLATED
BASE_RESOURCE_STATE_MISMATCH
BASE_SCOPE_NOT_MATCHED
BASE_REQUIRED_SIDE_NOT_COVERED
BASE_OWNERSHIP_NOT_MATCHED
BASE_FIELD_POLICY_FAILED
BASE_CONCURRENCY_FAILED
BASE_ACTOR_WIDE_DENY
BASE_LANE_DENY
BASE_NO_MATCHING_ALLOW
BASE_ALLOW_MATCHED
BASE_COMPONENT_MATCHED
BASE_DATASET_VERSION_MISMATCH
BASE_GRANT_CONFIGURATION_INVALID
BASE_INCOMPATIBLE_GRANT
```

AUTH-CTX-023 decidirá cuáles se exponen al cliente y su prioridad.

---

#### 57. Truth table principal

| Condición | Resultado del carril base |
| --- | --- |
| Modalidad `OPERATIONAL_ONLY` | `NOT_APPLICABLE` |
| Contexto base `INVALID` | `DENY` |
| Contexto base `UNAVAILABLE` | `DENY` |
| Recurso `UNRESOLVED`, `CONFLICT` o `ISOLATED` | `DENY` |
| `actor-wide deny` coincidente | `DENY` |
| `base lane deny` coincidente | `DENY` |
| Sin allow base completo | `DENY` |
| Allow base completo sin deny | `ALLOW` |
| `BASE_COMPONENT` completo | `ALLOW` del carril; no de la decisión final |
| Restricción global fallida | El carril conserva evidencia; la decisión final será `DENY` |

---

#### 58. Restricciones globales y outcome del carril

`base_decision` expresa la autoridad producida por el carril base.

Las decisiones separadas:

- `device_decision`;
- `sensitivity_decision`;
- `field_policy_decision`;
- `prerequisite_decisions`;

no se convierten en grants base.

Cuando una restricción global falla:

```text
base_decision puede conservar ALLOW
final_decision = DENY
```

Esto permite explicar que el actor posee la capacidad base, pero la solicitud concreta fue bloqueada por una restricción adicional.

---

#### 59. Dependencias

Una dependencia de permiso se evalúa mediante una decisión separada.

Reglas:

- no se infiere por módulo
- no se infiere app.access
- cada dependencia conserva su modalidad
- una dependencia fallida bloquea la solicitud principal cuando el contrato la declara obligatoria
- aprobar la dependencia no crea el grant principal
- la evidencia no se incluye como matched_allow_ids del permiso principal.

---

#### 60. Simulación

La simulación puede calcular un base_decision hipotético.

Reglas:

- utiliza el mismo algoritmo
- no modifica el contexto real
- no ejecuta mutaciones
- no crea grants
- no elimina denies
- no convierte WOULD_ALLOW en ALLOW
- el actor real conserva la autorización para iniciar y consultar la simulación.

---

#### 61. Procesos de sistema

Un proceso SYSTEM autónomo no utiliza el carril base laboral salvo que un contrato explícito de sistema lo represente.

No se convertirá service role, API key, cron, Edge Function o cola en rol base.

Los procesos delegados conservan al empleado actor cuando exista delegación válida.

---

#### 62. Inmutabilidad y snapshot

`base_decision` queda asociado a:

- actor;
- empleado;
- rol base;
- cobertura;
- permiso;
- recurso;
- versión;
- datasets;
- denies;
- instante;
- restricciones.

Un cambio en cualquiera de estos hechos obliga a una nueva decisión.

---

#### 63. Orden determinista

La serialización deberá:

- ordenar matched_allow_ids alfabéticamente
- ordenar matched_deny_ids alfabéticamente
- eliminar duplicados
- ordenar reason_codes por prioridad y luego alfabéticamente
- conservar el mismo resultado para el mismo snapshot
- no depender del orden físico de filas
- no elegir el primer grant
- no elegir el grant más amplio
- no elegir el grant más permisivo.

---

#### 64. Casos de ejemplo

##### Caso A — Permiso `BASE_ONLY` con grant de rol

```text
permission = viso.workforce.employees.view
requirement = BASE_ONLY
base_role = gerente
grant = AS
resource.site_ids = [VENTO_CAFE]
assigned_sites = [VENTO_CAFE]
```

Resultado:

```text
base_decision.outcome = ALLOW
operational_decision = NOT_APPLICABLE
```

##### Caso B — `OPERATIONAL_ONLY`

```text
permission = nexo.inventory.remissions.prepare
requirement = OPERATIONAL_ONLY
```

Resultado:

```text
base_decision = NOT_APPLICABLE
```

Aunque exista una fila base legacy, no autoriza.

##### Caso C — `BASE_OR_OPERATIONAL` sin turno

```text
base allow válido
active_shift = null
```

Resultado:

```text
base_decision = ALLOW
```

##### Caso D — `BASE_AND_OPERATIONAL`

```text
base component válido
operational component pendiente
```

Resultado:

```text
base_decision = ALLOW
final_decision todavía no es ALLOW
```

##### Caso E — Propietario sin grant

```text
base_role = propietario
sin grant exacto
```

Resultado:

```text
base_decision = DENY
BASE_NO_MATCHING_ALLOW
```

##### Caso F — Contador con cobertura `NONE` y grant global exacto

```text
base_role = contador
administrative_coverage.mode = NONE
grant.scope = G
resource organizacional ordinario
```

Resultado:

```text
base_decision puede ser ALLOW
```

##### Caso G — Recurso fuera de sedes asignadas

```text
grant = AS
assigned_sites = [VENTO_CAFE]
resource.site = SAUDO
```

Resultado:

```text
DENY
BASE_SCOPE_NOT_MATCHED
```

##### Caso H — Recurso propio fuera del territorio

```text
grant = OWN + AS
ownership = SELF
resource.site = SAUDO
assigned_sites = [VENTO_CAFE]
```

Resultado:

```text
DENY
```

##### Caso I — Remisión con dos lados

```text
grant cubre origin
no cubre destination
ambos lados son obligatorios
```

Resultado:

```text
DENY
BASE_REQUIRED_SIDE_NOT_COVERED
```

##### Caso J — Actor-wide deny

```text
dos allows base válidos
un actor-wide deny coincidente
```

Resultado:

```text
base_decision = DENY
```

##### Caso K — `APP-REVIEW`

```text
grant = G
resource.isolated_environment = true
```

Resultado:

```text
DENY
BASE_RESOURCE_ISOLATED
```

---

#### 65. Antipatrones prohibidos

```ts
if (employee.role === "propietario") {
  return true;
}
```

```ts
if (!activeShift) {
  return false;
}
```

```ts
const allowed = rolePermissions.some((permission) =>
  permission.startsWith(`${appCode}.`)
);
```

```ts
const siteId = selectedSiteId ?? employee.site_id;
```

```ts
if (resource.created_by === actorId) {
  return true;
}
```

También queda prohibido:

```text
rol base → todos los permisos
check-in activo → ampliar administración
sin turno → perder administración
grant operativo → allow base
grant base legacy → rescatar OPERATIONAL_ONLY
sede primaria → todas las sedes
lista vacía → todos
OWN → ignorar territorio
G → incluir APP-REVIEW
allow más específico → vencer deny
varios allows incompletos → construir uno nuevo
BASE_COMPONENT → final allow
```

---

#### 66. Relación con tareas posteriores

| Tarea | Responsabilidad posterior |
| --- | --- |
| `AUTH-CTX-020` | Definir el carril operativo de forma independiente |
| `AUTH-CTX-021` | Definir y serializar `MatchedGrant`, incluyendo los grants base realmente coincidentes |
| `AUTH-CTX-022` | Definir structural denies, actor-wide denies, base lane denies, operational lane denies y evidencia coincidente |
| `AUTH-CTX-023` | Combinar base, operación, modalidad, restricciones, dependencias, campos, denies, default deny y decisión final |
| `AUTH-CTX-024` | Registrar evidencia auditable de rol, grant, override, scope, recurso, territorio, razones, datasets, hash y outcome |
| `AUTH-CTX-025` | Diseñar `get_access_context`, incluyendo los hechos base necesarios |
| `AUTH-CTX-026` | Diseñar `evaluate_authorization`, la consulta de datasets, el scope matcher, la frontera transaccional y `LaneDecision` |
| `AUTH-CTX-027` | Eliminar evaluaciones locales de permisos base en aplicaciones |
| `AUTH-CTX-028` | Diseñar compatibilidad con `has_permission`, `role_permissions`, `employee_permissions`, oficios base legacy, territorios legacy, scopes, duplicados y aliases |
| `AUTH-CTX-029` | Definir caché e invalidación por cambios de rol, asignación, grant, deny, recurso, estado, dataset y catálogo |
| `AUTH-CTX-030` | Definir pruebas contractuales de modalidad, readiness, roles, overrides, scopes, recursos, multiterritorio, colecciones, agregados, bulk, denies, dispositivo, campos, concurrencia y aislamiento |
| `AUTH-MOD-021` | Definir el rol base mínimo de trabajadores puramente operativos antes de `AUTH-CTX-028` |
| `AUTH-DB-006` a `AUTH-DB-010` | Implementar validación del contexto, permiso, recurso, actor y territorio dentro de RPC sensibles |
| `AUTH-DB-020` | Migrar grants y consumidores legacy con compatibilidad temporal |
| `AUTH-DB-027` | Probar matriz base, overrides, RLS, RPC, recursos y migraciones |
| `AUTH-DB-030` | Retirar `has_permission` y rutas legacy después de adopción comprobada |
| `AUTH-DB-031` | Certificar paridad documental, técnica y operativa |

---

#### 67. Fuera del alcance

AUTH-CTX-019 no:

- modifica la matriz base;
- modifica sus 499 registros;
- modifica sus hashes;
- crea grants;
- crea overrides;
- crea denegaciones;
- define el carril operativo;
- define objetos completos de matched allows;
- define objetos completos de matched denies;
- produce la combinación final;
- modifica contratos de recurso;
- reclasifica permisos;
- implementa campos protegidos;
- implementa MFA;
- implementa dispositivos;
- crea tipos físicos;
- crea funciones SQL;
- crea RPC;
- crea RLS;
- crea migraciones;
- modifica Supabase;
- modifica aplicaciones.

Cada responsabilidad posterior tiene destino explícito en la sección 66.

---

#### 68. Riesgos controlados

| Riesgo | Control canónico |
| --- | --- |
| Rol jerárquico funciona como bypass | Rol + grant exacto + recurso exacto |
| Administración depende de presencia operativa | El carril base no consume turno ni check-in |
| Scope global concede todos los permisos | `G` limita territorio; no crea capacidades |
| `OWN` amplía sedes | Propiedad ∩ territorio |
| Grant individual repara identidad inválida | Contexto base válido obligatorio |
| Deny se vence con allow más específico | Deny aplicable > allow |
| Componente base ejecuta acción doble | `BASE_COMPONENT` autoriza el carril; la decisión final exige operación |
| Recursos aislados entran en `G` | `isolated_environment` produce `DENY` sin autorización específica |

---

#### 69. Criterios de aprobación

AUTH-CTX-019 podrá aprobarse cuando se acepte que:

1. se conserva la forma de LaneDecision.
2. base_decision.lane siempre es BASE.
3. OPERATIONAL_ONLY produce NOT_APPLICABLE.
4. evaluated = false solo para carril no aplicable.
5. las demás modalidades evalúan base.
6. readiness procede del AccessContext.
7. el evaluador no mejora readiness.
8. READY no significa allow.
9. un actor laboral exacto es obligatorio.
10. empleado inactivo no posee autoridad.
11. rol base activo y único es obligatorio.
12. un override no repara rol inválido.
13. solo siete roles base son canónicos.
14. los oficios legacy no son fuente final.
15. propietario no tiene bypass.
16. gerente general no tiene bypass.
17. las únicas fuentes de allow son BASE_ROLE e INDIVIDUAL_BASE.
18. el dataset base es @1.0.0.
19. contiene 499 registros.
20. los grants directos pueden autorizar el carril.
21. los componentes base solo autorizan su carril.
22. un componente base no autoriza la acción final.
23. los overrides individuales permanecen restrictivos.
24. la clave debe coincidir exactamente.
25. la modalidad debe admitir base.
26. el grant debe estar vigente.
27. CTX es incompatible con base.
28. NT no inventa territorio.
29. ORG no equivale a global territorial.
30. G es organizacional ordinario.
31. G excluye entornos aislados.
32. AS usa sedes asignadas utilizables.
33. SS exige sede exacta.
34. AST combina asignación y tipo.
35. TST exige transversalidad explícita.
36. AA usa áreas asignadas.
37. SA exige área exacta.
38. AAT combina asignación y tipo.
39. ATW exige límite superior de sede.
40. OWN no amplía territorio.
41. scopes compuestos respetan su lógica publicada.
42. cobertura administrativa no es grant.
43. cobertura NONE puede coexistir con grants NT, ORG, G u OWN.
44. recursos sin sede no usan fallback.
45. recursos sin área no significan todas.
46. todos los lados obligatorios deben estar cubiertos.
47. colecciones se limitan en servidor.
48. agregados excluyen miembros no autorizados.
49. operaciones masivas requieren contrato.
50. estado del recurso participa.
51. campos protegidos permanecen separados.
52. concurrencia permanece obligatoria cuando aplica.
53. el dispositivo solo restringe.
54. el turno no participa.
55. el check-in no participa.
56. el carril operativo permanece separado.
57. actor-wide deny prevalece.
58. base lane deny prevalece en base.
59. structural deny puede bloquear el carril.
60. ausencia de allow produce default deny.
61. varios allows no crean alcance nuevo.
62. matched_allow_ids solo contiene grants realmente coincidentes.
63. matched_deny_ids excluye default deny.
64. reason_codes queda normalizado.
65. restricciones globales pueden negar la decisión final sin reescribir la evidencia del carril.
66. dependencias no crean grants.
67. simulación no ejecuta autoridad.
68. procesos de sistema no inventan rol base.
69. la decisión es inmutable.
70. el orden es determinista.
71. AUTH-CTX-020 definirá operación.
72. AUTH-CTX-021 definirá allows coincidentes.
73. AUTH-CTX-022 definirá denies.
74. AUTH-CTX-023 definirá decisión final.
75. AUTH-CTX-024 definirá auditoría.
76. AUTH-CTX-026 diseñará el evaluador.
77. AUTH-CTX-027 eliminará lógica local.
78. AUTH-CTX-028 gobernará compatibilidad legacy.
79. AUTH-CTX-029 gobernará invalidación.
80. AUTH-CTX-030 gobernará pruebas.
81. AUTH-MOD-021 permanece como puerta antes de AUTH-CTX-028.
82. las tareas AUTH-DB indicadas tienen destinos físicos explícitos.
83. no se implementa código, migraciones ni cambios en Supabase.

---

#### 70. Cierre y continuidad

| Relación | Tarea | Estado |
| --- | --- | --- |
| Tarea anterior | `AUTH-CTX-018` | ✅ APROBADA |
| Tarea cerrada | `AUTH-CTX-019` | ✅ APROBADA |
| Tarea actual | `AUTH-CTX-020` | ⬜ NO INICIADA |

```text
AUTH-CTX-018 — APROBADA
        ↓
AUTH-CTX-019 — APROBADA
        ↓
AUTH-CTX-020 — NO INICIADA
```

`AUTH-CTX-020` permanece reservada hasta que se inicie formalmente su propuesta.
