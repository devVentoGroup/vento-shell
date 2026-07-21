### ✅ AUTH-CTX-002 — Diseñar AuthorizationDecision canónica

**Estado:** APROBADA
**Bloque:** BLOQUE E — Contexto y decisión de autorización unificados  
**Naturaleza:** Diseño documental de contrato canónico  
**Implementación física:** No incluida  
**Tarea anterior vigente:** AUTH-CTX-001 — APROBADA  
**Tarea posterior reservada:** AUTH-CTX-003 — Diseñar SimulationContext separado  
**Contrato diseñado:** `AuthorizationDecision`  
**Contrato de entrada:** `AccessContext` aprobado en AUTH-CTX-001  
**Versión contractual:** Pendiente de AUTH-CTX-004  
**Catálogo de autorización:** `vento.authorization@1.0.0`  
**Datasets contractuales:** base, operativo y overrides `1.0.0`

Esta tarea diseña la forma, responsabilidad, secuencia, precedencia,
composición por carriles, evidencia y límites de la decisión canónica de
autorización de Vento OS.

No implementa tipos TypeScript, funciones SQL, RPC, RLS, migraciones,
triggers, caché, UI, guards, consumidores ni cambios físicos en Supabase.

---

#### 1. Objetivo

Definir un contrato único que permita responder, de manera determinista,
cerrada, explicable y auditable:

```text
¿EL ACTOR EFECTIVO
PUEDE EJECUTAR
EL PERMISO EXACTO
DE LA APLICACIÓN EXACTA
SOBRE EL RECURSO EXACTO
EN ESTE CONTEXTO
EN ESTE MOMENTO?
```

La respuesta real tendrá únicamente dos resultados finales:

```text
ALLOW
DENY
```

No existirán resultados reales ambiguos como:

```text
MAYBE
PROBABLY
UNKNOWN_ALLOW
ALLOW_WITHOUT_RESOURCE
ALLOW_BY_FRONTEND
```

Cuando la información obligatoria sea insuficiente, contradictoria,
obsoleta o no resoluble, la decisión real será `DENY`.

La simulación podrá diferenciar `indeterminate`, pero se diseñará como
contrato separado en AUTH-CTX-003.

---

#### 2. Decisión principal

`AuthorizationDecision` será un snapshot inmutable, producido en servidor
para una solicitud concreta.

Regla:

```text
AuthorizationDecision
=
AccessContext exacto
+
aplicación exacta
+
permiso exacto
+
contrato versionado del permiso
+
recurso o borrador exacto
+
territorio resuelto
+
estado y restricciones del recurso
+
grants y denials aplicables
+
precedencia canónica
+
composición por modalidad
```

No será:

- una lista general de permisos;
- un perfil de navegación;
- un resultado reutilizable para cualquier recurso;
- una sesión de autorización;
- un token de capacidad;
- una prueba suficiente para ejecutar una mutación futura sin revalidar;
- una interpretación local de cada aplicación.

---

#### 3. Responsabilidad del contrato

`AuthorizationDecision` responde:

1. qué aplicación fue solicitada;
2. qué permiso canónico fue solicitado;
3. qué versión contractual se utilizó;
4. qué modalidad de autorización aplica;
5. qué recurso se resolvió;
6. qué territorio y lados del recurso se resolvieron;
7. qué carriles debían evaluarse;
8. qué resultado produjo el carril base;
9. qué resultado produjo el carril operativo;
10. qué allows coincidieron;
11. qué denegaciones coincidieron;
12. qué prerrequisitos y restricciones se cumplieron o fallaron;
13. qué regla de combinación produjo el resultado;
14. por qué se autorizó o denegó;
15. qué evidencia debe conservarse para auditoría.

No responde por sí solo:

- cómo se autentica el usuario;
- cómo se resuelve físicamente `AccessContext`;
- cómo se persisten grants o denegaciones;
- cómo se ejecuta la mutación;
- cómo se presenta la explicación al usuario;
- cómo se simula otro actor;
- cuánto tiempo se almacena en caché.

---

#### 4. Principios obligatorios

##### 4.1 Decisión por capacidad exacta

```text
permission_key exacto
→ una decisión exacta
```

No se autoriza mediante:

- prefijos;
- wildcards;
- nombres parciales;
- nombres de módulos;
- nombres de rutas;
- botones visibles;
- nombres de roles;
- semejanza semántica;
- jerarquías no declaradas.

##### 4.2 Decisión por recurso exacto

```text
NO SE AUTORIZA CONTRA site_id O area_id AISLADOS
```

Se autoriza contra:

```text
recurso resuelto
→ relaciones canónicas
→ territorio real
→ estado real
→ lados requeridos
```

El contexto del actor limita el recurso.

Nunca crea ni reemplaza el territorio del recurso.

##### 4.3 Resolución exclusiva en servidor

El cliente podrá aportar únicamente localizadores o borradores admitidos
por el contrato.

No podrá afirmar autoritativamente:

- sede;
- área;
- propietario;
- custodio;
- estado;
- rol;
- alcance;
- actor;
- ruta;
- origen;
- destino;
- campos sensibles;
- lados autorizados.

##### 4.4 Fail closed

Cualquier ausencia, contradicción, versión incompatible, error de
resolución o estado inválido produce `DENY`.

##### 4.5 Explicabilidad sin filtrar secretos

La decisión debe ser explicable y auditable.

La proyección enviada al cliente no debe revelar:

- grants ajenos;
- denegaciones disciplinarias sensibles;
- reglas internas de seguridad;
- identificadores internos innecesarios;
- estructura completa de matrices;
- datos protegidos del recurso.

##### 4.6 Inmutabilidad

Una decisión emitida no se modifica.

Una nueva realidad produce una nueva decisión.

---

#### 5. Forma canónica de alto nivel

```ts
type AuthorizationDecision = {
  contract_name: "AuthorizationDecision";
  contract_version: string;

  decision_id: string;
  decided_at: string;
  correlation_id: string | null;

  access_context_ref: AccessContextReference;
  request: AuthorizationRequestContext;
  permission_contract: PermissionContractSnapshot;
  resource: ResolvedResourceContext;

  required_lanes: AuthorizationLane[];
  base_decision: LaneDecision;
  operational_decision: LaneDecision;

  prerequisite_decisions: PrerequisiteDecision[];
  device_decision: ConstraintDecision;
  sensitivity_decision: ConstraintDecision;
  field_policy_decision: FieldPolicyDecision;

  matched_allows: MatchedGrant[];
  matched_denies: MatchedDeny[];

  structural_denies: DecisionReason[];
  actor_wide_denies: DecisionReason[];
  lane_denies: DecisionReason[];
  blocked_reasons: DecisionReason[];

  combination: DecisionCombination;
  final_decision: FinalDecision;
  audit: AuthorizationAuditContext;
};
```

La sintaxis es documental.

No constituye todavía un tipo físico ni obliga a una tecnología concreta.

---

#### 6. Identidad y vigencia de la decisión

| Campo                | Obligatorio | Regla                                                           |
| -------------------- | ----------: | --------------------------------------------------------------- |
| `contract_name`      |          Sí | Siempre `AuthorizationDecision`.                                |
| `contract_version`   |          Sí | Se congelará en AUTH-CTX-004.                                   |
| `decision_id`        |          Sí | Identificador único de la evaluación. No es un token de acceso. |
| `decided_at`         |          Sí | Timestamp de servidor utilizado en la evaluación.               |
| `correlation_id`     | Condicional | Vincula decisión, solicitud, ejecución y auditoría.             |
| `access_context_ref` |          Sí | Referencia exacta al contexto evaluado.                         |

Reglas:

1. `decision_id` no puede reutilizarse como bearer token.
2. Una decisión no concede autoridad fuera de su solicitud.
3. Una decisión no es válida para otro permiso.
4. Una decisión no es válida para otro recurso.
5. Una decisión no es válida para otro actor.
6. Una decisión no es válida para otra versión contractual.
7. Una mutación tardía deberá revalidarse cuando el recurso o el contexto
   puedan haber cambiado.
8. El periodo de caché y expiración se definirá en AUTH-CTX-029.

---

#### 7. Referencia a `AccessContext`

Forma conceptual:

```ts
type AccessContextReference = {
  context_id: string;
  context_contract_version: string;
  resolved_at: string;
  actor_type: string;
  actor_id: string | null;
  principal_type: string;
  principal_id: string | null;
  context_fingerprint: string;
};
```

La decisión podrá conservar una referencia y una proyección mínima del
contexto, pero no deberá duplicar indiscriminadamente todos sus datos.

La huella deberá permitir demostrar que la evaluación utilizó un snapshot
concreto.

Regla:

```text
MISMO decision_id
→ MISMO AccessContext
```

---

#### 8. Solicitud de autorización

Forma conceptual:

```ts
type AuthorizationRequestContext = {
  app_code: string;
  permission_key: string;

  operation_kind:
    | "READ"
    | "CREATE"
    | "UPDATE"
    | "DELETE"
    | "EXECUTE"
    | "TRANSITION"
    | "EXPORT"
    | "APP_ACCESS";

  resource_request:
    | ExistingResourceRequest
    | ResourceDraftRequest
    | CollectionRequest
    | AggregateRequest
    | BulkRequest
    | NonResourceRequest;

  requested_fields: string[];
  request_source: "SERVER_ACTION" | "RPC" | "RLS" | "API" | "UI_GUARD" | "JOB";
};
```

Reglas:

- `app_code` debe coincidir con la aplicación propietaria del permiso;
- `permission_key` debe existir exactamente en la versión activa;
- `operation_kind` no amplía la acción declarada por el permiso;
- `requested_fields` solo reduce o precisa la evaluación;
- `request_source` no cambia las reglas;
- una UI guard no sustituye protección de servidor;
- un permiso `<app>.access` no autoriza capacidades internas;
- una operación masiva requiere contrato masivo explícito o decisiones por
  miembro.

---

#### 9. Snapshot del contrato del permiso

Forma conceptual:

```ts
type PermissionContractSnapshot = {
  catalog_id: string;
  catalog_version: string;
  catalog_hash: string;

  app_code: string;
  permission_key: string;
  permission_status: "ACTIVE" | "INACTIVE" | "MISSING";

  authorization_requirement:
    | "BASE_ONLY"
    | "OPERATIONAL_ONLY"
    | "BASE_OR_OPERATIONAL"
    | "BASE_AND_OPERATIONAL";

  base_prerequisite: "N" | "NOT_APPLICABLE";
  operational_prerequisite: "T" | "T+C" | "NOT_APPLICABLE";

  requires_active_area: boolean;
  device_policy_code: string | null;
  sensitivity_class: string;
  simulation_policy: string;

  resource_contract_id: string;
  dependency_permission_keys: string[];
};
```

Reglas:

1. la modalidad se obtiene del catálogo, no de la matriz;
2. la tabla donde aparezca una asignación no redefine la modalidad;
3. un permiso sin modalidad produce denegación estructural;
4. un permiso inactivo produce denegación estructural;
5. la aplicación no puede reinterpretar el contrato;
6. la nueva versión del catálogo no modifica decisiones históricas;
7. un permiso nuevo no se concede automáticamente;
8. las dependencias deben ser explícitas, nunca inferidas por prefijo.

---

#### 10. Recurso resuelto

Forma conceptual:

```ts
type ResolvedResourceContext = {
  resource_type: string;
  request_shape:
    | "EXISTING"
    | "DRAFT"
    | "COLLECTION"
    | "AGGREGATE"
    | "BULK"
    | "NON_RESOURCE";

  resolution_status:
    | "RESOLVED"
    | "MULTI_RESOLVED"
    | "NOT_APPLICABLE"
    | "UNRESOLVED"
    | "CONFLICT"
    | "ISOLATED";

  resource_ids: string[];
  resource_version: string | null;

  subject: ResolvedSubjectContext | null;
  territory: ResolvedTerritoryContext;
  ownership: OwnershipContext;
  required_sides: ResolvedSideContext[];

  state_snapshot: Record<string, unknown>;
  field_classification: Record<string, string>;
  concurrency: ConcurrencyContext | null;
};
```

Reglas:

```text
RESOLVED
MULTI_RESOLVED
NOT_APPLICABLE
→ evaluación puede continuar
```

```text
UNRESOLVED
CONFLICT
ISOLATED
→ DENY
```

`NOT_APPLICABLE` solo se utiliza cuando el contrato declara legítimamente
un recurso no territorial u organizacional.

Nunca significa que la resolución fue omitida.

---

#### 11. Territorio resuelto

Forma conceptual:

```ts
type ResolvedTerritoryContext = {
  organization_id: string | null;
  business_unit_ids: string[];
  site_ids: string[];
  area_ids: string[];
  area_kinds: string[];
  origin: TerritorySide | null;
  destination: TerritorySide | null;
  route_ids: string[];
  vehicle_ids: string[];
  isolated_environment: boolean;
  source: string;
  coherent: boolean;
};
```

Reglas:

- `null` no significa organización completa;
- una lista vacía no significa todos;
- el área debe pertenecer a la sede correspondiente;
- el origen y destino se evalúan cuando el contrato lo exige;
- el permiso global sigue limitado al recurso exacto;
- global no atraviesa entornos aislados;
- un filtro del cliente puede reducir, nunca ampliar;
- la sede seleccionada no reemplaza el territorio;
- la sede primaria no reemplaza el territorio;
- el territorio del dispositivo solo restringe.

---

#### 12. Recursos de creación

Una creación se evalúa contra un `ResourceDraft` normalizado antes de
persistir.

Debe resolver:

- tipo de recurso;
- padres y relaciones;
- sede;
- área;
- origen;
- destino;
- sujeto objetivo;
- campos protegidos;
- estado inicial;
- idempotencia;
- lados requeridos.

Regla:

```text
payload del cliente
→ borrador no confiable
→ normalización
→ resolución de relaciones
→ decisión
→ escritura
```

No se permite:

```text
payload.site_id
→ territorio autorizado por declaración
```

---

#### 13. Colecciones, agregados y operaciones masivas

##### 13.1 Colecciones

La decisión debe construir en servidor el conjunto autorizado.

No se recuperará un conjunto amplio para filtrarlo únicamente en el
frontend.

##### 13.2 Agregados

Cada miembro territorial que alimente el resultado debe estar autorizado.

Un agregado no puede revelar información excluida mediante:

- totales;
- conteos;
- diferencias;
- mensajes de error;
- agrupaciones;
- metadatos.

##### 13.3 Operaciones masivas

Regla:

```text
permiso ordinario sobre un recurso
≠ permiso masivo
```

Una operación masiva deberá:

- usar un permiso masivo canónico explícito; o
- descomponerse en decisiones por recurso.

La política de atomicidad debe declararse:

```text
ALL_OR_NOTHING
PARTIAL_WITH_RESULTS
```

Nunca se elige silenciosamente.

---

#### 14. Carriles requeridos

Tipo conceptual:

```ts
type AuthorizationLane = "BASE" | "OPERATIONAL";
```

La modalidad determina:

| Modalidad              | Carriles requeridos                     |
| ---------------------- | --------------------------------------- |
| `BASE_ONLY`            | `BASE`                                  |
| `OPERATIONAL_ONLY`     | `OPERATIONAL`                           |
| `BASE_OR_OPERATIONAL`  | `BASE`, `OPERATIONAL` como alternativas |
| `BASE_AND_OPERATIONAL` | `BASE`, `OPERATIONAL` obligatorios      |

`required_lanes` no significa que todos deban autorizar.

La regla de combinación queda expresada por `combination`.

---

#### 15. Resultado de un carril

Forma conceptual:

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

Reglas:

1. `NOT_APPLICABLE` solo se utiliza cuando la modalidad no admite el carril.
2. Un carril admitido sin allow produce `DENY`.
3. Un carril con deny aplicable produce `DENY`.
4. Un carril operativo sin contexto obligatorio produce `DENY`.
5. Un carril base no se deniega por ausencia de turno.
6. El outcome final no se infiere solo desde un carril.
7. El carril conserva sus propias restricciones y evidencia.

---

#### 16. Evaluación del carril base

Orden obligatorio:

```text
1. Confirmar que la modalidad admite BASE.
2. Validar hechos estructurales aplicables al carril base.
3. Validar actor laboral y empleado activo.
4. Validar rol base y cobertura cuando correspondan.
5. Evaluar bloqueo individual transversal.
6. Buscar denegaciones base aplicables.
7. Buscar allows base aplicables.
8. Comparar alcance con recurso y territorio.
9. Aplicar dependencias, sensibilidad y restricciones.
10. ALLOW o DENY por defecto.
```

Fuentes posibles:

```text
BASE ROLE GRANT
INDIVIDUAL BASE GRANT
BASE ROLE DENY
INDIVIDUAL BASE DENY
ACTOR-WIDE DENY
```

El carril base no toma prestado:

- turno;
- check-in;
- rol operativo;
- sede operativa;
- área operativa;
- alcance operativo.

---

#### 17. Evaluación del carril operativo

Orden obligatorio:

```text
1. Confirmar que la modalidad admite OPERATIONAL.
2. Validar hechos estructurales aplicables.
3. Validar actor laboral y empleado activo.
4. Validar turno publicado y vigente.
5. Validar check-in cuando el permiso exige T+C.
6. Validar conflictos de check-in aunque el permiso sea T.
7. Validar rol operativo.
8. Validar sede y área operativas.
9. Validar dispositivo cuando aplique.
10. Evaluar bloqueo individual transversal.
11. Buscar denegaciones operativas aplicables.
12. Buscar allows operativos aplicables.
13. Comparar contexto con recurso, territorio y lados.
14. Aplicar dependencias, sensibilidad y restricciones.
15. ALLOW o DENY por defecto.
```

Fuentes posibles:

```text
OPERATIONAL ROLE GRANT
INDIVIDUAL OPERATIONAL GRANT
OPERATIONAL ROLE DENY
INDIVIDUAL OPERATIONAL DENY
ACTOR-WIDE DENY
```

Una concesión operativa nunca crea:

- turno;
- check-in;
- rol operativo;
- sede;
- área;
- sesión de actor;
- relación con el recurso.

---

#### 18. Prerrequisitos

Forma conceptual:

```ts
type PrerequisiteDecision = {
  prerequisite_type:
    | "PERMISSION_DEPENDENCY"
    | "SHIFT"
    | "CHECKIN"
    | "ACTIVE_AREA"
    | "DEVICE"
    | "REAUTHENTICATION"
    | "RESOURCE_STATE"
    | "OWNERSHIP"
    | "REQUIRED_SIDE"
    | "CONCURRENCY"
    | "IDEMPOTENCY";

  applies_to_lane: "BASE" | "OPERATIONAL" | "BOTH" | "REQUEST";
  status: "PASS" | "FAIL" | "NOT_APPLICABLE";
  reason_code: string | null;
};
```

Reglas:

- `N` no elimina permiso, alcance, recurso ni denegaciones;
- `T` exige turno vigente y no exige check-in;
- `T+C` exige turno y check-in;
- la combinación sin turno pero con check-in queda prohibida;
- un check-in incompatible bloquea el carril operativo;
- un área requerida debe estar resuelta y coincidir;
- una dependencia de permiso se evalúa explícitamente;
- aprobar una dependencia no autoriza el permiso principal;
- fallar una dependencia obligatoria produce `DENY`.

---

#### 19. Decisión de dispositivo

Forma conceptual:

```ts
type ConstraintDecision = {
  status: "PASS" | "FAIL" | "NOT_APPLICABLE";
  policy_code: string | null;
  reason_codes: string[];
};
```

La regla de dispositivo será:

```text
autoridad del actor
∩
capacidad admitida por dispositivo
```

Nunca unión.

El dispositivo puede producir `FAIL`.

No puede producir un allow empresarial por sí solo.

Un dispositivo compatible sin permiso humano produce `DENY`.

Un actor autorizado en un dispositivo incompatible produce `DENY` para esa
solicitud.

---

#### 20. Sensibilidad y reautenticación

La autorización de una capacidad sensible podrá exigir controles
adicionales, por ejemplo:

- reautenticación reciente;
- segundo factor;
- confirmación reforzada;
- separación de funciones;
- evidencia de motivo;
- aprobación adicional;
- dispositivo compatible.

Estos controles:

- no sustituyen el permiso;
- no amplían el alcance;
- no eliminan denegaciones;
- no convierten un carril inválido en válido;
- se registran como decisiones de restricción.

El catálogo detallado se desarrollará en las tareas posteriores del BLOQUE
E y en los bloques de implementación.

---

#### 21. Campos protegidos

Forma conceptual:

```ts
type FieldPolicyDecision = {
  status: "PASS" | "PARTIAL" | "FAIL";
  visible_fields: string[];
  masked_fields: string[];
  mutable_fields: string[];
  blocked_fields: string[];
  reason_codes: string[];
};
```

Reglas:

1. autorizar el recurso no autoriza todos sus campos;
2. una lectura parcial puede producir `ALLOW` con proyección limitada;
3. una mutación que incluye un campo no autorizado produce `DENY` o exige
   separar la operación;
4. los errores no deben revelar campos o recursos ocultos;
5. el cliente recibe únicamente la proyección segura;
6. `PARTIAL` no cambia el resultado final de autorización sobre la
   proyección aprobada.

---

#### 22. Grants coincidentes

Forma conceptual:

```ts
type MatchedGrant = {
  grant_id: string;
  lane: "BASE" | "OPERATIONAL";
  source_kind:
    | "BASE_ROLE"
    | "OPERATIONAL_ROLE"
    | "INDIVIDUAL_BASE"
    | "INDIVIDUAL_OPERATIONAL";

  source_subject_id: string;
  permission_key: string;
  effect: "ALLOW";
  scope_code: string;
  matched_territory: boolean;
  matched_resource: boolean;
  validity_status: "ACTIVE";
  source_dataset_id: string;
  source_dataset_version: string;
};
```

Reglas:

- solo se registran grants realmente evaluados;
- una asignación incompatible con la modalidad no es grant coincidente;
- un grant sin coincidencia territorial no autoriza;
- un grant individual no corrige un deny;
- un grant global sigue limitado al permiso y recurso exactos;
- no se exponen todos los grants al cliente.

---

#### 23. Denegaciones coincidentes

Forma conceptual:

```ts
type MatchedDeny = {
  deny_id: string;
  deny_class:
    | "STRUCTURAL"
    | "ACTOR_WIDE"
    | "BASE_LANE"
    | "OPERATIONAL_LANE"
    | "DEFAULT";

  lane: "BASE" | "OPERATIONAL" | "ALL" | null;
  permission_key: string;
  source_kind: string;
  matched_actor: boolean;
  matched_resource: boolean;
  matched_territory: boolean;
  matched_validity: boolean;
  reason_code: string;
};
```

Precedencia:

```text
STRUCTURAL DENY
>
ACTOR-WIDE DENY
>
LANE DENY
>
ALLOW
>
DEFAULT DENY
```

Una concesión adicional no supera un deny aplicable.

---

#### 24. Denegación estructural

Una denegación estructural procede de una condición obligatoria inválida.

Ejemplos:

- principal inválido;
- actor efectivo no resuelto;
- empleado inactivo;
- aplicación inexistente o inactiva;
- permiso inexistente o inactivo;
- modalidad ausente;
- contrato de recurso ausente;
- recurso no resoluble;
- territorio contradictorio;
- entorno aislado no autorizado;
- turno inválido cuando se requiere;
- check-in requerido ausente;
- check-in incompatible;
- rol operativo inválido;
- dispositivo o sesión de actor inválidos;
- contrato o dataset incompatible;
- decisión basada en contexto obsoleto.

Regla:

```text
STRUCTURAL DENY
→ final = DENY
```

No puede ser anulado mediante:

- rol;
- grant individual;
- alcance global;
- nombre de cargo;
- service role;
- dispositivo;
- simulación.

---

#### 25. Bloqueo individual transversal

Un `ACTOR_WIDE_DENY` aplicable:

```text
employee_id exacto
+
permission_key exacto
+
recurso y alcance coincidentes
+
vigencia activa
```

bloquea todos los carriles compatibles.

Resultado:

```text
base_decision = DENY
operational_decision = DENY
final_decision = DENY
```

No bloquea permisos distintos por prefijo.

No desactiva automáticamente al trabajador.

---

#### 26. Denegación de carril

Una denegación base bloquea únicamente el carril base.

Una denegación operativa bloquea únicamente el carril operativo.

En `BASE_OR_OPERATIONAL`:

```text
BASE DENY
+
OPERATIONAL ALLOW
→ ALLOW por OPERATIONAL
```

```text
BASE ALLOW
+
OPERATIONAL DENY
→ ALLOW por BASE
```

Siempre que no exista:

- denegación estructural;
- bloqueo transversal;
- dependencia común fallida;
- restricción de solicitud fallida.

En `BASE_AND_OPERATIONAL`, cualquier carril denegado produce `DENY`.

---

#### 27. Composición por modalidad

##### 27.1 `BASE_ONLY`

```text
base = ALLOW
→ final = ALLOW
```

Todo otro caso:

```text
final = DENY
```

El carril operativo queda `NOT_APPLICABLE`.

##### 27.2 `OPERATIONAL_ONLY`

```text
operational = ALLOW
→ final = ALLOW
```

Todo otro caso:

```text
final = DENY
```

El carril base queda `NOT_APPLICABLE`.

##### 27.3 `BASE_OR_OPERATIONAL`

```text
base = ALLOW
OR
operational = ALLOW
→ final = ALLOW
```

Ambos denegados:

```text
final = DENY
```

Los carriles no prestan partes incompletas entre sí.

##### 27.4 `BASE_AND_OPERATIONAL`

```text
base = ALLOW
AND
operational = ALLOW
→ final = ALLOW
```

Cualquier otro resultado:

```text
final = DENY
```

Ambos componentes deben pertenecer:

- al mismo actor efectivo;
- al mismo permiso;
- al mismo recurso;
- a la misma solicitud;
- a la misma versión contractual.

---

#### 28. Decisión de combinación

Forma conceptual:

```ts
type DecisionCombination = {
  authorization_requirement:
    | "BASE_ONLY"
    | "OPERATIONAL_ONLY"
    | "BASE_OR_OPERATIONAL"
    | "BASE_AND_OPERATIONAL";

  base_outcome: "ALLOW" | "DENY" | "NOT_APPLICABLE";
  operational_outcome: "ALLOW" | "DENY" | "NOT_APPLICABLE";

  authorizing_lanes: AuthorizationLane[];
  blocked_lanes: AuthorizationLane[];

  combination_rule:
    | "BASE"
    | "OPERATIONAL"
    | "BASE_OR_OPERATIONAL"
    | "BASE_AND_OPERATIONAL";

  combination_result: "ALLOW" | "DENY";
};
```

`authorizing_lanes` deberá declarar el carril real que satisfizo la
decisión.

En `BASE_OR_OPERATIONAL`, si ambos carriles permiten, podrá registrar ambos,
pero la implementación no deberá duplicar efectos.

---

#### 29. Decisión final

Forma conceptual:

```ts
type FinalDecision = {
  outcome: "ALLOW" | "DENY";

  reason_category:
    | "AUTHORIZED"
    | "STRUCTURAL_DENY"
    | "ACTOR_WIDE_DENY"
    | "LANE_DENY"
    | "PREREQUISITE_DENY"
    | "RESOURCE_DENY"
    | "DEVICE_DENY"
    | "SENSITIVITY_DENY"
    | "FIELD_POLICY_DENY"
    | "DEFAULT_DENY"
    | "CONTRACT_INVALID";

  primary_reason_code: string;
  authorizing_lanes: AuthorizationLane[];
  safe_message_code: string;
};
```

Reglas:

1. `ALLOW` exige evidencia positiva completa.
2. La ausencia de evidencia positiva produce `DENY`.
3. La decisión no usa `null` como resultado.
4. La razón primaria no elimina razones adicionales.
5. El mensaje seguro para UI no sustituye la razón técnica auditable.
6. Un error interno de evaluación produce `DENY`.
7. La finalización de la decisión no ejecuta por sí sola la acción.

---

#### 30. Razones bloqueantes

Forma conceptual:

```ts
type DecisionReason = {
  reason_code: string;
  category: string;
  severity: "BLOCKING" | "INFORMATIONAL";
  lane: "BASE" | "OPERATIONAL" | "ALL" | null;
  source: string;
  safe_to_expose: boolean;
};
```

Categorías iniciales:

```text
AUTHENTICATION
ACTOR
EMPLOYMENT
APPLICATION
PERMISSION
CONTRACT
RESOURCE
TERRITORY
OWNERSHIP
STATE
BASE_LANE
OPERATIONAL_LANE
SHIFT
CHECKIN
AREA
DEVICE
SENSITIVITY
FIELD_POLICY
DEPENDENCY
DENIAL
DEFAULT_DENY
STALE_CONTEXT
CONCURRENCY
IDEMPOTENCY
```

El catálogo definitivo de razones y mensajes se precisará en
AUTH-CTX-023 y en BLOQUE S.

---

#### 31. Dependencias entre permisos

Una dependencia se declara en el catálogo.

Ejemplo conceptual:

```text
nexo.inventory.remissions.prepare
requiere
nexo.access
```

La dependencia:

- se evalúa con el mismo actor;
- utiliza el mismo contexto;
- usa su propio contrato;
- conserva su modalidad;
- puede tener recurso distinto solo cuando el contrato lo declare;
- no se infiere desde el prefijo;
- no hereda automáticamente la decisión principal.

Una denegación aplicable sobre el permiso prerrequisito puede bloquear la
acción dependiente.

Se deberá evitar recursión circular.

Un ciclo contractual produce `CONTRACT_INVALID` y `DENY`.

---

#### 32. Estado y transición del recurso

Toda mutación debe validar:

- estado actual;
- transición solicitada;
- versión esperada;
- actor;
- territorio actual;
- territorio propuesto cuando cambie;
- lados obligatorios;
- idempotencia cuando corresponda.

Ejemplo:

```text
autoridad sobre remisión
+
estado incompatible
→ DENY
```

El permiso no sustituye el predicado de estado.

Una decisión positiva sobre una versión del recurso no autoriza una
mutación después de que el recurso cambie sin revalidación.

---

#### 33. Concurrencia e idempotencia

Forma conceptual:

```ts
type ConcurrencyContext = {
  policy:
    | "NONE"
    | "EXPECTED_VERSION"
    | "UPDATED_AT"
    | "LOCK"
    | "SNAPSHOT"
    | "IDEMPOTENCY_KEY";

  expected_version: string | null;
  idempotency_key: string | null;
  validated: boolean;
};
```

Reglas:

- la decisión y la escritura deben compartir frontera transaccional o
  revalidación;
- una decisión no reserva el recurso por sí sola;
- los movimientos de inventario requieren atomicidad;
- transiciones terminales y creaciones repetibles requieren idempotencia;
- una clave de idempotencia no concede permiso;
- un conflicto de versión produce `DENY` para la ejecución solicitada y
  exige reevaluar.

---

#### 34. Ejecución vinculada

Para mutaciones:

```text
resolver recurso
→ autorizar
→ validar estado/concurrencia
→ ejecutar
```

debe ocurrir:

- en la misma operación segura; o
- con revalidación inmediatamente antes de escribir.

No se admite:

```text
autorizar en UI
→ esperar
→ ejecutar sin validar servidor
```

`decision_id` se registra para auditoría.

No se utiliza para saltar la evaluación.

---

#### 35. Proyecciones de salida

Podrán existir al menos dos proyecciones:

##### 35.1 Proyección interna

Incluye:

- grants coincidentes;
- denegaciones;
- fuentes;
- hashes;
- contexto;
- territorio;
- evidencia completa permitida;
- detalles de auditoría.

##### 35.2 Proyección segura para cliente

Incluye como máximo:

- outcome;
- permiso;
- recurso lógico seguro;
- código de mensaje;
- razones seguras;
- acciones de recuperación permitidas;
- identificador de soporte o correlación.

No expone:

- decisiones disciplinarias;
- grants de otros actores;
- reglas sensibles;
- estructuras internas;
- existencia de recursos que el actor no puede conocer.

---

#### 36. Navegación, UI y servidor

##### Navegación

Puede usar una decisión para:

- mostrar;
- ocultar;
- deshabilitar;
- explicar.

##### URL

Debe volver a evaluar el permiso exacto.

##### Acción

Debe volver a evaluar en servidor.

##### RLS y RPC

Deben consumir o reproducir el mismo contrato canónico.

Regla:

```text
UI ALLOW
≠ SERVER ALLOW PERSISTENTE
```

```text
ENLACE OCULTO
≠ SEGURIDAD
```

---

#### 37. Listas de permisos efectivos

`AuthorizationDecision` no devolverá por defecto una lista materializada de
todos los permisos efectivos del actor.

Razones:

- el resultado depende del recurso;
- el territorio depende del recurso;
- el estado depende del recurso;
- el carril operativo cambia;
- el dispositivo puede restringir;
- las denegaciones pueden ser específicas;
- la sensibilidad puede exigir controles;
- una lista plana puede aparentar más autoridad de la real.

Las aplicaciones podrán obtener capacidades de navegación mediante
contratos específicos, pero cada operación conserva decisión exacta.

---

#### 38. Servicios del sistema

`SYSTEM_SERVICE` no implica allow.

La decisión deberá validar:

- identidad técnica del proceso;
- proceso autorizado;
- aplicación y permiso exactos;
- recurso;
- alcance;
- delegación cuando actúe por una persona;
- auditoría;
- ausencia de bypass general.

El uso de `service_role` para conectividad no equivale a autoridad
empresarial.

---

#### 39. Dispositivos compartidos

La decisión conserva simultáneamente:

```text
principal autenticado = dispositivo
actor efectivo = empleado
```

Debe validar:

- dispositivo activo;
- sesión de actor;
- actor activo;
- turno;
- check-in cuando aplique;
- paquete de capacidades;
- sede y área;
- recurso;
- permiso exacto.

La decisión y la auditoría deberán atribuir la acción al empleado sin
ocultar el dispositivo utilizado.

---

#### 40. Simulación

La decisión real no contiene:

- actor simulado;
- rol simulado;
- grants hipotéticos;
- territorio hipotético;
- `would_allow`;
- `indeterminate`.

La simulación utilizará un contrato distinto.

Una decisión simulada nunca podrá:

- ejecutar una mutación;
- servir como token;
- modificar RLS;
- reemplazar `auth.uid()`;
- reutilizarse como decisión real.

---

#### 41. Ejemplos canónicos

##### 41.1 `BASE_ONLY`

```text
permiso = viso.staff.roles.manage
modalidad = BASE_ONLY
base = ALLOW
operational = NOT_APPLICABLE
final = ALLOW
authorizing_lanes = [BASE]
```

##### 41.2 `OPERATIONAL_ONLY` sin check-in requerido

```text
modalidad = OPERATIONAL_ONLY
prerrequisito = T
turno = válido
check-in = ausente
operational = ALLOW
final = ALLOW
```

##### 41.3 `OPERATIONAL_ONLY` con T+C

```text
turno = válido
check-in = ausente
operational = DENY
reason = active_checkin_required
final = DENY
```

##### 41.4 `BASE_OR_OPERATIONAL`

```text
base = DENY
operational = ALLOW
final = ALLOW
authorizing_lanes = [OPERATIONAL]
```

##### 41.5 `BASE_AND_OPERATIONAL`

```text
base = ALLOW
operational = DENY
final = DENY
```

##### 41.6 Denegación transversal

```text
actor-wide deny aplicable
base = DENY
operational = DENY
final = DENY
```

##### 41.7 Recurso no resuelto

```text
resource.resolution_status = UNRESOLVED
structural deny
final = DENY
```

##### 41.8 Permiso global sobre recurso aislado

```text
grant = global
resource = APP-REVIEW
autorización aislada específica = ausente
final = DENY
```

##### 41.9 Dispositivo permitido sin grant humano

```text
device = PASS
matched allows = []
final = DENY por defecto
```

##### 41.10 `app.access`

```text
nexo.access = ALLOW
nexo.inventory.movements.create = no evaluado
```

El primer allow no concede el segundo.

---

#### 42. Orden conceptual de evaluación

```text
1. Recibir AccessContext exacto.
2. Normalizar la solicitud.
3. Resolver aplicación.
4. Resolver permiso exacto.
5. Cargar snapshot contractual.
6. Validar versiones y hashes.
7. Resolver recurso o borrador.
8. Resolver territorio, lados, sujeto y estado.
9. Detectar denegaciones estructurales.
10. Evaluar bloqueos actor-wide.
11. Determinar carriles según modalidad.
12. Evaluar prerrequisitos comunes.
13. Evaluar carril base cuando aplique.
14. Evaluar carril operativo cuando aplique.
15. Evaluar dispositivo.
16. Evaluar sensibilidad y reautenticación.
17. Evaluar campos.
18. Evaluar dependencias.
19. Aplicar precedencia deny > allow.
20. Combinar carriles según modalidad.
21. Aplicar denegación por defecto.
22. Construir razón primaria y razones adicionales.
23. Registrar evidencia y hashes.
24. Emitir decisión inmutable.
25. Ejecutar o revalidar dentro de frontera segura.
```

La implementación física y el orden SQL definitivo se diseñarán en
AUTH-CTX-026 y se implementarán en BLOQUE R.

---

#### 43. Invariantes

1. Toda decisión corresponde a un permiso exacto.
2. Toda decisión corresponde a una aplicación exacta.
3. Toda decisión corresponde a un actor efectivo exacto.
4. Toda decisión corresponde a un recurso o contrato no territorial exacto.
5. El cliente no suministra territorio autoritativo.
6. La modalidad procede del catálogo.
7. El recurso no procede del contexto del actor.
8. El contexto limita; no crea territorio.
9. `null` no significa global.
10. Wildcards están prohibidos.
11. Un permiso global no es universal.
12. `<app>.access` no concede permisos internos.
13. Un deny estructural prevalece sobre todo allow.
14. Un bloqueo actor-wide bloquea todos los carriles compatibles.
15. Un deny de carril solo bloquea su carril.
16. Dentro de un carril, deny prevalece sobre allow.
17. Sin allow aplicable existe denegación por defecto.
18. `BASE_ONLY` solo admite base.
19. `OPERATIONAL_ONLY` solo admite operativo.
20. `BASE_OR_OPERATIONAL` exige un carril completo.
21. `BASE_AND_OPERATIONAL` exige ambos carriles completos.
22. Los componentes híbridos pertenecen al mismo actor y recurso.
23. El turno no crea permiso.
24. El check-in no crea permiso.
25. El dispositivo no crea permiso.
26. El service role no crea autoridad empresarial.
27. Autorizar el recurso no autoriza todos los campos.
28. Autorizar una lectura no autoriza una mutación.
29. Autorizar un recurso no autoriza una operación masiva.
30. Una decisión no es token de capacidad.
31. Una decisión obsoleta no puede ejecutar una mutación.
32. La UI no sustituye evaluación de servidor.
33. La simulación no participa en la decisión real.
34. Toda decisión real termina en `ALLOW` o `DENY`.
35. Todo error de resolución falla cerrado.

---

#### 44. Antipatrones prohibidos

```ts
if (employee.role === "propietario") return true;
if (permission.startsWith("nexo.")) return true;
if (activeCheckin) return true;
if (device.apps.includes("nexo")) return true;
if (selectedSiteId === resource.site_id) return true;
if (baseAllow || operationalAllow) return true; // sin mirar modalidad
```

También queda prohibido:

```text
allow individual > deny
site_id del request → territorio confiable
decisión de navegación → autorización de mutación
permiso global → todos los recursos
permiso access → todas las funciones
decisión positiva antigua → escritura nueva
recurso no resuelto → fallback a sede primaria
error interno → allow
```

---

#### 45. Auditoría

Forma conceptual:

```ts
type AuthorizationAuditContext = {
  decision_id: string;
  correlation_id: string | null;

  actor_id: string | null;
  principal_id: string | null;
  device_id: string | null;

  app_code: string;
  permission_key: string;
  resource_type: string;
  resource_ids: string[];

  outcome: "ALLOW" | "DENY";
  authorizing_lanes: AuthorizationLane[];

  context_fingerprint: string;
  resource_fingerprint: string;
  catalog_hash: string;
  dataset_hashes: Record<string, string>;

  evaluator_name: string;
  evaluator_version: string;
};
```

La auditoría completa podrá conservar:

- grants y denials coincidentes;
- razones;
- versión;
- timestamps;
- recurso;
- estado;
- dispositivo;
- actor;
- origen de solicitud;
- ejecución resultante.

La retención y estructura física se definirán en E3 y BLOQUE R.

---

#### 46. Relación con tareas posteriores

##### AUTH-CTX-003

Diseñará `SimulationContext` separado.

##### AUTH-CTX-004

Congelará versiones, compatibilidad y serialización.

##### AUTH-CTX-016

Precisará aplicación y permiso solicitado.

##### AUTH-CTX-017

Precisará `authorization_requirement`.

##### AUTH-CTX-018

Precisará recurso y territorio resueltos.

##### AUTH-CTX-019

Precisará la decisión del carril base.

##### AUTH-CTX-020

Precisará la decisión del carril operativo.

##### AUTH-CTX-021

Precisará los allows coincidentes.

##### AUTH-CTX-022

Precisará las denegaciones coincidentes.

##### AUTH-CTX-023

Precisará la decisión final y razones.

##### AUTH-CTX-024

Precisará datos de auditoría.

##### AUTH-CTX-026

Diseñará el contrato canónico futuro de `evaluate_authorization`.

##### AUTH-CTX-030

Definirá pruebas contractuales completas.

##### BLOQUE E3

Aprobará las fuentes físicas, esquemas y relaciones objetivo.

##### BLOQUE R

Implementará el contrato mediante migraciones y consumidores versionados.

---

#### 47. Fuera del alcance

AUTH-CTX-002 no:

- modifica AUTH-CTX-001;
- diseña simulación;
- congela versión;
- crea TypeScript;
- crea Zod;
- crea JSON Schema;
- crea SQL;
- crea RPC;
- crea RLS;
- crea tablas;
- crea migraciones;
- persiste decisiones;
- define TTL;
- implementa caché;
- adapta aplicaciones;
- crea guards;
- crea UI;
- crea mensajes finales;
- implementa auditoría física;
- ejecuta permisos;
- modifica Supabase.

---

#### 48. Riesgos controlados

##### Riesgo 1 — Decisión sin recurso

Control:

```text
resource resolution obligatoria
```

##### Riesgo 2 — Modalidad reinterpretada

Control:

```text
snapshot contractual versionado
```

##### Riesgo 3 — Deny superado por más allows

Control:

```text
deny > allow
```

##### Riesgo 4 — Mezcla parcial de carriles

Control:

```text
carriles completos
+
composición explícita
```

##### Riesgo 5 — Check-in como grant

Control:

```text
check-in = prerrequisito
≠ allow
```

##### Riesgo 6 — Dispositivo como grant

Control:

```text
device = restricción
≠ allow
```

##### Riesgo 7 — Global como universal

Control:

```text
global
→ territorio organizacional ordinario
→ permiso y recurso exactos
```

##### Riesgo 8 — Decisión UI reutilizada para mutar

Control:

```text
servidor reevalúa
```

##### Riesgo 9 — Filtración de razones sensibles

Control:

```text
proyección interna
≠ proyección segura
```

##### Riesgo 10 — TOCTOU

Control:

```text
decisión + validación + escritura
→ misma frontera o revalidación
```

---

#### 49. Criterios de aprobación

AUTH-CTX-002 podrá aprobarse cuando se acepte que:

1. `AuthorizationDecision` evalúa una solicitud exacta;
2. toda decisión real termina en `ALLOW` o `DENY`;
3. la decisión referencia un `AccessContext` exacto;
4. aplicación y permiso son exactos;
5. la modalidad procede del catálogo;
6. el recurso se resuelve en servidor;
7. el contexto limita y no crea el territorio;
8. `UNRESOLVED`, `CONFLICT` e `ISOLATED` producen `DENY`;
9. base y operativo se evalúan por separado;
10. `BASE_ONLY` solo admite base;
11. `OPERATIONAL_ONLY` solo admite operativo;
12. `BASE_OR_OPERATIONAL` admite cualquier carril completo;
13. `BASE_AND_OPERATIONAL` exige ambos carriles;
14. deny estructural prevalece sobre todo allow;
15. bloqueo actor-wide bloquea todos los carriles compatibles;
16. deny de carril solo bloquea su carril;
17. dentro del carril, deny prevalece sobre allow;
18. sin allow aplicable existe denegación por defecto;
19. turno, check-in y dispositivo no conceden permisos;
20. los grants y denials coincidentes quedan trazables;
21. los campos protegidos se evalúan por separado;
22. dependencias entre permisos son explícitas;
23. las operaciones masivas no se infieren;
24. la decisión no es un token de capacidad;
25. una mutación debe revalidarse frente a cambios;
26. existen proyecciones interna y segura;
27. la simulación queda separada;
28. el catálogo de razones se reserva para tareas posteriores;
29. el contrato SQL se reserva para AUTH-CTX-026;
30. la implementación física se reserva para BLOQUE R.

---

#### 50. Estado final de la propuesta

| Tarea        | Estado      |
| ------------ | ----------- |
| AUTH-CTX-001 | APROBADA    |
| AUTH-CTX-002 | APROBADA    |
| AUTH-CTX-003 | NO INICIADA |

No se avanza a AUTH-CTX-003 hasta recibir aprobación explícita de
AUTH-CTX-002.


